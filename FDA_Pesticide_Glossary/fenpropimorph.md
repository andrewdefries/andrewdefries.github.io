---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.209589, 1.189201, 0.928157, 1, 0, 0, 1,
-3.099509, -0.2503371, -1.302429, 1, 0.007843138, 0, 1,
-2.91319, -0.423149, -2.214888, 1, 0.01176471, 0, 1,
-2.625658, -0.9873106, -2.833468, 1, 0.01960784, 0, 1,
-2.556165, 0.1520529, -0.7731987, 1, 0.02352941, 0, 1,
-2.472792, -1.344848, -0.6134474, 1, 0.03137255, 0, 1,
-2.435207, -0.1269367, -0.5909264, 1, 0.03529412, 0, 1,
-2.426908, -1.237414, -2.282325, 1, 0.04313726, 0, 1,
-2.395811, -0.2697776, -0.4040779, 1, 0.04705882, 0, 1,
-2.392283, -1.312037, -1.221043, 1, 0.05490196, 0, 1,
-2.348566, 0.5408434, -2.184123, 1, 0.05882353, 0, 1,
-2.331599, -0.5848307, -2.898276, 1, 0.06666667, 0, 1,
-2.263411, 0.1115828, -0.3360286, 1, 0.07058824, 0, 1,
-2.254593, -0.1432851, -0.9766573, 1, 0.07843138, 0, 1,
-2.226477, -0.7292282, -1.563108, 1, 0.08235294, 0, 1,
-2.217162, -0.7594585, -0.9862019, 1, 0.09019608, 0, 1,
-2.214137, -1.088464, -4.425134, 1, 0.09411765, 0, 1,
-2.20261, 0.3516335, -0.1104117, 1, 0.1019608, 0, 1,
-2.168738, -0.3726632, -2.891279, 1, 0.1098039, 0, 1,
-2.129291, 0.6631254, -2.697467, 1, 0.1137255, 0, 1,
-2.1218, -0.5789568, -1.768226, 1, 0.1215686, 0, 1,
-2.107865, 0.06731329, -3.204597, 1, 0.1254902, 0, 1,
-2.096244, 1.501202, 0.5524468, 1, 0.1333333, 0, 1,
-2.074179, -1.400682, -1.961926, 1, 0.1372549, 0, 1,
-2.044575, 0.8051113, -0.4474637, 1, 0.145098, 0, 1,
-2.043993, 0.2476523, -2.116914, 1, 0.1490196, 0, 1,
-2.024862, -0.8416345, -1.975176, 1, 0.1568628, 0, 1,
-2.017404, 0.7739843, -2.193294, 1, 0.1607843, 0, 1,
-2.007644, -0.2840136, -0.2248706, 1, 0.1686275, 0, 1,
-1.998366, 0.2046069, -1.114141, 1, 0.172549, 0, 1,
-1.991242, -0.4306087, -1.176555, 1, 0.1803922, 0, 1,
-1.968673, 1.059096, 0.3334332, 1, 0.1843137, 0, 1,
-1.934993, -0.2960121, -2.372038, 1, 0.1921569, 0, 1,
-1.934849, 1.591697, 0.4467925, 1, 0.1960784, 0, 1,
-1.932492, -0.07625139, -1.13211, 1, 0.2039216, 0, 1,
-1.902036, -1.483396, -0.6919844, 1, 0.2117647, 0, 1,
-1.901239, -1.190667, -2.980285, 1, 0.2156863, 0, 1,
-1.896347, -0.3917297, -1.804355, 1, 0.2235294, 0, 1,
-1.862364, -1.563677, -4.479244, 1, 0.227451, 0, 1,
-1.86102, 0.02839348, -1.001674, 1, 0.2352941, 0, 1,
-1.85888, -1.063733, -2.91965, 1, 0.2392157, 0, 1,
-1.855369, 0.1899914, -1.638013, 1, 0.2470588, 0, 1,
-1.853957, -0.4913279, -3.456846, 1, 0.2509804, 0, 1,
-1.843373, 0.6275476, -0.3023275, 1, 0.2588235, 0, 1,
-1.836434, 0.7140799, -0.6377301, 1, 0.2627451, 0, 1,
-1.812603, -0.6554034, -0.2124254, 1, 0.2705882, 0, 1,
-1.804846, 1.758998, -1.560279, 1, 0.2745098, 0, 1,
-1.795161, 1.592016, -1.783401, 1, 0.282353, 0, 1,
-1.792923, 0.1613468, -2.342662, 1, 0.2862745, 0, 1,
-1.790667, 0.5865802, -1.183786, 1, 0.2941177, 0, 1,
-1.778824, -1.221278, -1.975765, 1, 0.3019608, 0, 1,
-1.77708, -1.283019, -3.267483, 1, 0.3058824, 0, 1,
-1.775706, -0.498079, 0.2133877, 1, 0.3137255, 0, 1,
-1.751168, 1.771757, 0.6146218, 1, 0.3176471, 0, 1,
-1.747185, -0.5467942, -2.606768, 1, 0.3254902, 0, 1,
-1.697682, 1.007038, -0.6536415, 1, 0.3294118, 0, 1,
-1.685676, 0.1870785, -1.316727, 1, 0.3372549, 0, 1,
-1.677996, -0.5345687, -0.9118348, 1, 0.3411765, 0, 1,
-1.654434, -1.303278, -2.899585, 1, 0.3490196, 0, 1,
-1.649862, 1.040583, -2.280218, 1, 0.3529412, 0, 1,
-1.642065, 2.948653, -1.81787, 1, 0.3607843, 0, 1,
-1.619456, 0.3853247, -0.7068194, 1, 0.3647059, 0, 1,
-1.615904, -1.393043, -1.574135, 1, 0.372549, 0, 1,
-1.609276, -0.7777805, -2.346891, 1, 0.3764706, 0, 1,
-1.582487, -0.8442668, -2.54093, 1, 0.3843137, 0, 1,
-1.579497, 0.2375703, -1.50659, 1, 0.3882353, 0, 1,
-1.573783, -0.7940412, -2.727139, 1, 0.3960784, 0, 1,
-1.570637, 1.699241, -2.077927, 1, 0.4039216, 0, 1,
-1.562629, 0.7468852, -1.166782, 1, 0.4078431, 0, 1,
-1.561985, -0.3269518, -1.158447, 1, 0.4156863, 0, 1,
-1.559283, -0.5841048, -3.12502, 1, 0.4196078, 0, 1,
-1.555163, 0.5030901, 0.9082578, 1, 0.427451, 0, 1,
-1.516214, 0.2765073, -2.077783, 1, 0.4313726, 0, 1,
-1.504861, -0.3572751, 0.08195543, 1, 0.4392157, 0, 1,
-1.504823, -0.6535607, -2.20068, 1, 0.4431373, 0, 1,
-1.501445, 0.5226436, -0.5712436, 1, 0.4509804, 0, 1,
-1.500143, -2.427041, -2.302414, 1, 0.454902, 0, 1,
-1.498392, -1.405317, -2.255111, 1, 0.4627451, 0, 1,
-1.494419, 1.11266, -0.3582285, 1, 0.4666667, 0, 1,
-1.486591, -1.286655, -3.672981, 1, 0.4745098, 0, 1,
-1.483563, 0.518286, -3.638417, 1, 0.4784314, 0, 1,
-1.479511, 0.5714676, -0.5011237, 1, 0.4862745, 0, 1,
-1.478125, 0.1505752, -1.456901, 1, 0.4901961, 0, 1,
-1.474855, -1.357369, -3.354019, 1, 0.4980392, 0, 1,
-1.463441, 1.728751, -1.010481, 1, 0.5058824, 0, 1,
-1.440139, -0.1576985, -1.97551, 1, 0.509804, 0, 1,
-1.431765, -0.6945186, -2.576351, 1, 0.5176471, 0, 1,
-1.413546, -1.988845, -3.788831, 1, 0.5215687, 0, 1,
-1.402569, -0.1664976, -0.8998611, 1, 0.5294118, 0, 1,
-1.400403, 0.3253615, 0.8779497, 1, 0.5333334, 0, 1,
-1.371618, 0.2456467, 0.7860857, 1, 0.5411765, 0, 1,
-1.368902, -0.2034014, -1.561804, 1, 0.5450981, 0, 1,
-1.366344, 0.01330393, 0.2941867, 1, 0.5529412, 0, 1,
-1.362349, -1.750463, -1.325019, 1, 0.5568628, 0, 1,
-1.360189, -0.191866, -1.876796, 1, 0.5647059, 0, 1,
-1.342792, 0.509684, -3.085702, 1, 0.5686275, 0, 1,
-1.34211, 0.0507355, -0.545264, 1, 0.5764706, 0, 1,
-1.333845, 1.476289, -1.08099, 1, 0.5803922, 0, 1,
-1.332045, -0.1028595, 0.48474, 1, 0.5882353, 0, 1,
-1.329612, 0.05936936, -0.6230505, 1, 0.5921569, 0, 1,
-1.327485, -0.7267971, -1.678027, 1, 0.6, 0, 1,
-1.325805, -0.02937281, -1.815391, 1, 0.6078432, 0, 1,
-1.313655, 0.196905, -3.126495, 1, 0.6117647, 0, 1,
-1.298633, 0.2539413, -1.261279, 1, 0.6196079, 0, 1,
-1.297478, 1.595577, 0.1585738, 1, 0.6235294, 0, 1,
-1.297102, 1.327756, -2.44723, 1, 0.6313726, 0, 1,
-1.294132, 1.007612, -2.605685, 1, 0.6352941, 0, 1,
-1.286268, 0.8377687, -1.032118, 1, 0.6431373, 0, 1,
-1.274313, -0.5523211, -3.162063, 1, 0.6470588, 0, 1,
-1.274199, -0.09613722, -0.9943042, 1, 0.654902, 0, 1,
-1.26579, 0.9430941, 0.3614216, 1, 0.6588235, 0, 1,
-1.255737, -0.6203215, -3.690568, 1, 0.6666667, 0, 1,
-1.252447, 0.7306327, -1.618049, 1, 0.6705883, 0, 1,
-1.246887, 0.5116917, -0.8250601, 1, 0.6784314, 0, 1,
-1.242012, -1.012664, -1.809458, 1, 0.682353, 0, 1,
-1.23758, 1.334149, -0.6935418, 1, 0.6901961, 0, 1,
-1.236443, -1.117537, -1.255318, 1, 0.6941177, 0, 1,
-1.236121, 0.7793592, -1.048231, 1, 0.7019608, 0, 1,
-1.22189, -0.2761054, -3.912287, 1, 0.7098039, 0, 1,
-1.21869, -1.719478, -2.997174, 1, 0.7137255, 0, 1,
-1.21648, -0.1994413, -3.017921, 1, 0.7215686, 0, 1,
-1.216317, 0.5751487, -2.278066, 1, 0.7254902, 0, 1,
-1.200863, -0.3061395, -1.616915, 1, 0.7333333, 0, 1,
-1.200137, 0.00657327, -2.489182, 1, 0.7372549, 0, 1,
-1.177696, -0.8259756, -2.768745, 1, 0.7450981, 0, 1,
-1.172641, -1.857975, -2.927766, 1, 0.7490196, 0, 1,
-1.171948, 0.5547215, -1.305978, 1, 0.7568628, 0, 1,
-1.161233, -0.5569881, -1.230643, 1, 0.7607843, 0, 1,
-1.154997, 0.001728135, -0.5243011, 1, 0.7686275, 0, 1,
-1.153725, 1.325146, -2.590698, 1, 0.772549, 0, 1,
-1.152206, -0.19304, -2.03661, 1, 0.7803922, 0, 1,
-1.147458, 0.386631, -0.8956394, 1, 0.7843137, 0, 1,
-1.145206, 1.242251, -2.050703, 1, 0.7921569, 0, 1,
-1.134255, -0.7313612, -3.227949, 1, 0.7960784, 0, 1,
-1.127387, 0.6110835, -1.491513, 1, 0.8039216, 0, 1,
-1.124664, 1.126232, 0.1962263, 1, 0.8117647, 0, 1,
-1.121683, 1.619792, 0.9327347, 1, 0.8156863, 0, 1,
-1.121517, -0.1728496, -0.6713583, 1, 0.8235294, 0, 1,
-1.119127, -0.1752445, -0.5803469, 1, 0.827451, 0, 1,
-1.116001, -0.07001249, -1.813093, 1, 0.8352941, 0, 1,
-1.114073, -0.5464593, -1.762367, 1, 0.8392157, 0, 1,
-1.107904, -1.9225, -3.416335, 1, 0.8470588, 0, 1,
-1.106303, -0.9360124, -2.911586, 1, 0.8509804, 0, 1,
-1.10382, 0.09274471, -3.762309, 1, 0.8588235, 0, 1,
-1.091798, -1.912005, -1.999178, 1, 0.8627451, 0, 1,
-1.089782, -0.2020691, -2.319638, 1, 0.8705882, 0, 1,
-1.085822, 0.03721464, -1.457157, 1, 0.8745098, 0, 1,
-1.083422, -1.217362, -3.281932, 1, 0.8823529, 0, 1,
-1.078837, -1.977854, -2.954962, 1, 0.8862745, 0, 1,
-1.073976, 1.27047, -1.979219, 1, 0.8941177, 0, 1,
-1.068568, 0.1356407, -1.750585, 1, 0.8980392, 0, 1,
-1.065394, 0.8570732, 0.3636882, 1, 0.9058824, 0, 1,
-1.061765, -1.424616, -2.055287, 1, 0.9137255, 0, 1,
-1.060199, 1.067917, -0.2256721, 1, 0.9176471, 0, 1,
-1.053134, 1.362052, -0.5643759, 1, 0.9254902, 0, 1,
-1.046831, 0.4455733, -2.068511, 1, 0.9294118, 0, 1,
-1.042455, 3.113217, -1.990419, 1, 0.9372549, 0, 1,
-1.036032, 0.01157166, -0.6443021, 1, 0.9411765, 0, 1,
-1.033349, 1.593626, -1.487969, 1, 0.9490196, 0, 1,
-1.027424, -0.9303089, -2.610131, 1, 0.9529412, 0, 1,
-1.024495, -2.135983, -2.286909, 1, 0.9607843, 0, 1,
-1.021439, 1.313389, -0.3345756, 1, 0.9647059, 0, 1,
-1.017709, 1.129097, -0.8027532, 1, 0.972549, 0, 1,
-1.00853, 1.429788, -0.6400604, 1, 0.9764706, 0, 1,
-1.003428, -1.455168, -4.475379, 1, 0.9843137, 0, 1,
-1.00085, -0.3898, -2.552358, 1, 0.9882353, 0, 1,
-1.000801, 1.411281, 0.2899979, 1, 0.9960784, 0, 1,
-1.000213, 0.3635016, 0.03491006, 0.9960784, 1, 0, 1,
-0.9811859, 0.7532843, 0.7107515, 0.9921569, 1, 0, 1,
-0.9678151, 0.7250957, -1.712185, 0.9843137, 1, 0, 1,
-0.965706, -0.6482207, -2.697362, 0.9803922, 1, 0, 1,
-0.9656065, -0.1105352, -0.8792267, 0.972549, 1, 0, 1,
-0.9606471, 0.1752784, -1.908786, 0.9686275, 1, 0, 1,
-0.9603005, -0.1155772, -1.897484, 0.9607843, 1, 0, 1,
-0.9570399, -1.565794, -4.054072, 0.9568627, 1, 0, 1,
-0.952127, -1.841052, -2.056598, 0.9490196, 1, 0, 1,
-0.948332, 1.738149, -2.120612, 0.945098, 1, 0, 1,
-0.9473879, -0.8830351, -1.905627, 0.9372549, 1, 0, 1,
-0.9375869, 1.199786, 0.5804582, 0.9333333, 1, 0, 1,
-0.9372471, -0.7561882, -0.4263178, 0.9254902, 1, 0, 1,
-0.9371235, 1.58382, -0.1426121, 0.9215686, 1, 0, 1,
-0.9319622, -0.127325, -1.563119, 0.9137255, 1, 0, 1,
-0.9289507, 0.5316918, -1.415904, 0.9098039, 1, 0, 1,
-0.9265134, -0.2369366, -1.46024, 0.9019608, 1, 0, 1,
-0.9212973, -0.05508686, -0.162092, 0.8941177, 1, 0, 1,
-0.9152965, 0.00362356, -0.9137262, 0.8901961, 1, 0, 1,
-0.9088077, -0.2611414, -2.916607, 0.8823529, 1, 0, 1,
-0.9053587, 0.9140751, -1.790756, 0.8784314, 1, 0, 1,
-0.9015272, -0.2087863, -1.857831, 0.8705882, 1, 0, 1,
-0.8968427, -1.021258, -2.402084, 0.8666667, 1, 0, 1,
-0.8838785, 0.01942614, -2.723674, 0.8588235, 1, 0, 1,
-0.880765, -0.6347352, -1.871278, 0.854902, 1, 0, 1,
-0.8713331, -1.547383, -3.260731, 0.8470588, 1, 0, 1,
-0.8649367, -0.8030195, -3.6552, 0.8431373, 1, 0, 1,
-0.864885, -0.2242363, -2.58106, 0.8352941, 1, 0, 1,
-0.8603496, -0.4084383, -2.546471, 0.8313726, 1, 0, 1,
-0.8586432, -1.322611, -3.076587, 0.8235294, 1, 0, 1,
-0.8554975, -1.165389, -1.964253, 0.8196079, 1, 0, 1,
-0.8539792, 0.3449362, -0.8192282, 0.8117647, 1, 0, 1,
-0.8507124, -0.3605708, -1.853811, 0.8078431, 1, 0, 1,
-0.8476368, -0.7315555, -3.081883, 0.8, 1, 0, 1,
-0.841055, -0.5173805, -2.890526, 0.7921569, 1, 0, 1,
-0.8368388, 0.8250393, -1.425606, 0.7882353, 1, 0, 1,
-0.8344049, 1.323099, 1.268844, 0.7803922, 1, 0, 1,
-0.8331011, 1.164555, -3.067558, 0.7764706, 1, 0, 1,
-0.8316866, -0.1720929, -0.4936523, 0.7686275, 1, 0, 1,
-0.8303036, -0.2429551, -2.832647, 0.7647059, 1, 0, 1,
-0.8255584, -0.5917881, -3.251744, 0.7568628, 1, 0, 1,
-0.824908, 1.297657, -2.839308, 0.7529412, 1, 0, 1,
-0.8232324, 0.8210028, -0.3110533, 0.7450981, 1, 0, 1,
-0.8126836, 1.732527, 0.2945741, 0.7411765, 1, 0, 1,
-0.8106626, -0.4181281, -1.701359, 0.7333333, 1, 0, 1,
-0.8102043, -0.3486925, -1.81051, 0.7294118, 1, 0, 1,
-0.8085784, -0.9490453, -3.419297, 0.7215686, 1, 0, 1,
-0.8024358, 0.2288154, -1.507305, 0.7176471, 1, 0, 1,
-0.7984139, -0.8889262, -2.304177, 0.7098039, 1, 0, 1,
-0.7959613, -0.8531321, -2.660934, 0.7058824, 1, 0, 1,
-0.79569, 0.7095261, -0.3494249, 0.6980392, 1, 0, 1,
-0.7878349, 0.5261611, -0.3990794, 0.6901961, 1, 0, 1,
-0.7869418, 1.241654, -0.5552291, 0.6862745, 1, 0, 1,
-0.7770669, -0.515409, 0.04512708, 0.6784314, 1, 0, 1,
-0.7760499, 0.8200459, -0.6658983, 0.6745098, 1, 0, 1,
-0.7704777, 0.01846842, -2.28045, 0.6666667, 1, 0, 1,
-0.7627788, 1.313506, -3.758114, 0.6627451, 1, 0, 1,
-0.7493601, -0.7254723, -2.287538, 0.654902, 1, 0, 1,
-0.7458606, -2.368716, -3.738102, 0.6509804, 1, 0, 1,
-0.7456502, 1.546845, -0.4174691, 0.6431373, 1, 0, 1,
-0.7448434, -0.01213997, -0.7863191, 0.6392157, 1, 0, 1,
-0.7414343, 0.4553852, -0.4514277, 0.6313726, 1, 0, 1,
-0.7364801, -0.6481844, -0.4145703, 0.627451, 1, 0, 1,
-0.7353775, 3.046922, 0.4736074, 0.6196079, 1, 0, 1,
-0.7336735, 0.5168343, -0.792166, 0.6156863, 1, 0, 1,
-0.7313273, 0.6737092, 0.1154937, 0.6078432, 1, 0, 1,
-0.7260694, 0.301029, -0.6097855, 0.6039216, 1, 0, 1,
-0.7213126, -0.3156027, -1.875523, 0.5960785, 1, 0, 1,
-0.7203988, 0.5545381, 0.5928116, 0.5882353, 1, 0, 1,
-0.7169131, -2.280328, -3.654369, 0.5843138, 1, 0, 1,
-0.7149811, -0.6669173, -1.448603, 0.5764706, 1, 0, 1,
-0.7145765, 0.1873358, -0.6918209, 0.572549, 1, 0, 1,
-0.7132859, -0.3385432, -2.531184, 0.5647059, 1, 0, 1,
-0.7112253, 1.126602, -1.256075, 0.5607843, 1, 0, 1,
-0.6972885, 1.517098, -1.222987, 0.5529412, 1, 0, 1,
-0.6961191, 0.06020608, -1.688012, 0.5490196, 1, 0, 1,
-0.6953582, 1.0471, -0.149597, 0.5411765, 1, 0, 1,
-0.6938981, 2.074076, -1.584848, 0.5372549, 1, 0, 1,
-0.6889522, 0.3214962, -0.8508333, 0.5294118, 1, 0, 1,
-0.6856052, 1.451089, 1.420377, 0.5254902, 1, 0, 1,
-0.681524, -0.372349, -0.04320229, 0.5176471, 1, 0, 1,
-0.6770896, 1.71199, -0.9710829, 0.5137255, 1, 0, 1,
-0.6699326, -1.12549, -2.769279, 0.5058824, 1, 0, 1,
-0.6616382, 0.7252877, 1.027247, 0.5019608, 1, 0, 1,
-0.6589168, 0.8493699, -0.0278186, 0.4941176, 1, 0, 1,
-0.6560791, -2.081054, -1.879245, 0.4862745, 1, 0, 1,
-0.6555634, 1.033153, -0.3232072, 0.4823529, 1, 0, 1,
-0.6508682, -1.684276, -3.308849, 0.4745098, 1, 0, 1,
-0.6382903, 1.225266, 0.7715037, 0.4705882, 1, 0, 1,
-0.636215, -1.423483, -2.986361, 0.4627451, 1, 0, 1,
-0.636199, 0.6260943, 1.095186, 0.4588235, 1, 0, 1,
-0.6346581, -0.5550427, -1.39314, 0.4509804, 1, 0, 1,
-0.6310036, 1.788354, -1.859267, 0.4470588, 1, 0, 1,
-0.6293979, -1.385877, -1.627477, 0.4392157, 1, 0, 1,
-0.6291769, 0.6718572, 0.02458802, 0.4352941, 1, 0, 1,
-0.6277373, -1.143683, -2.710945, 0.427451, 1, 0, 1,
-0.6271428, 1.420135, -0.0930403, 0.4235294, 1, 0, 1,
-0.626404, -0.7488618, -2.238468, 0.4156863, 1, 0, 1,
-0.6233832, -1.601986, -2.036117, 0.4117647, 1, 0, 1,
-0.6203421, -0.01133898, -0.2973551, 0.4039216, 1, 0, 1,
-0.6191679, 0.8103544, -0.2556643, 0.3960784, 1, 0, 1,
-0.6189121, -0.9617454, -3.83547, 0.3921569, 1, 0, 1,
-0.6122742, -0.2035677, -2.978331, 0.3843137, 1, 0, 1,
-0.6102775, 1.433986, -1.248449, 0.3803922, 1, 0, 1,
-0.6063997, 0.2685386, -1.605598, 0.372549, 1, 0, 1,
-0.6053931, -2.37605, -2.782887, 0.3686275, 1, 0, 1,
-0.6012008, -0.2306737, -3.433099, 0.3607843, 1, 0, 1,
-0.5945266, 0.691709, -1.982597, 0.3568628, 1, 0, 1,
-0.59425, 1.588327, -1.418664, 0.3490196, 1, 0, 1,
-0.5887123, -0.4760222, -2.776667, 0.345098, 1, 0, 1,
-0.5886295, -1.009337, -2.536579, 0.3372549, 1, 0, 1,
-0.5884299, -0.377731, -2.598739, 0.3333333, 1, 0, 1,
-0.5868136, -0.2107828, -0.4967115, 0.3254902, 1, 0, 1,
-0.5830316, -1.891304, -3.067459, 0.3215686, 1, 0, 1,
-0.5802746, -0.7447995, -3.14427, 0.3137255, 1, 0, 1,
-0.5784126, 0.7894646, -0.08591574, 0.3098039, 1, 0, 1,
-0.5757129, 1.178027, -1.920228, 0.3019608, 1, 0, 1,
-0.5743191, 0.6873447, -1.015969, 0.2941177, 1, 0, 1,
-0.5677028, 0.8263016, -1.217238, 0.2901961, 1, 0, 1,
-0.5656863, 0.7964569, -1.636759, 0.282353, 1, 0, 1,
-0.5646176, -0.07373717, -1.72101, 0.2784314, 1, 0, 1,
-0.5642403, 0.5272838, -1.368799, 0.2705882, 1, 0, 1,
-0.560621, 1.313838, -0.1775408, 0.2666667, 1, 0, 1,
-0.5600538, 0.4124664, -0.8795171, 0.2588235, 1, 0, 1,
-0.5563031, -1.312548, -1.930417, 0.254902, 1, 0, 1,
-0.5523888, -0.4233637, -1.436677, 0.2470588, 1, 0, 1,
-0.5523307, -0.5766459, -1.846559, 0.2431373, 1, 0, 1,
-0.5478442, -0.4623838, -2.191347, 0.2352941, 1, 0, 1,
-0.5464327, -0.7052274, -3.580715, 0.2313726, 1, 0, 1,
-0.543838, 0.5185944, -1.017806, 0.2235294, 1, 0, 1,
-0.5368541, -0.08998924, -0.5144721, 0.2196078, 1, 0, 1,
-0.5225567, -1.705396, -0.7443881, 0.2117647, 1, 0, 1,
-0.5198508, 0.2307946, 0.03242442, 0.2078431, 1, 0, 1,
-0.5090114, 1.003623, -0.4658554, 0.2, 1, 0, 1,
-0.5081882, -0.5042328, -0.903475, 0.1921569, 1, 0, 1,
-0.5079884, -0.4323164, -2.090205, 0.1882353, 1, 0, 1,
-0.5035167, 0.03803511, -0.2555196, 0.1803922, 1, 0, 1,
-0.5030195, 0.5312724, -2.79122, 0.1764706, 1, 0, 1,
-0.501883, 1.78413, 0.6686236, 0.1686275, 1, 0, 1,
-0.4979595, -1.152102, -2.521473, 0.1647059, 1, 0, 1,
-0.4971221, -0.3285574, -1.820081, 0.1568628, 1, 0, 1,
-0.492483, -0.4618835, -2.816212, 0.1529412, 1, 0, 1,
-0.4914292, 1.023589, 0.3361181, 0.145098, 1, 0, 1,
-0.4900663, 0.1395461, -0.05654999, 0.1411765, 1, 0, 1,
-0.4865249, -0.3828786, -3.11323, 0.1333333, 1, 0, 1,
-0.4861663, 0.05662587, -0.5735096, 0.1294118, 1, 0, 1,
-0.4818515, -0.04923354, -0.9915636, 0.1215686, 1, 0, 1,
-0.4818443, -0.5067322, -0.7956049, 0.1176471, 1, 0, 1,
-0.4708368, -0.4089706, -1.065836, 0.1098039, 1, 0, 1,
-0.4692812, -0.1659714, -1.703274, 0.1058824, 1, 0, 1,
-0.4546125, 2.428914, 0.7323048, 0.09803922, 1, 0, 1,
-0.4536389, -0.8385363, -3.477524, 0.09019608, 1, 0, 1,
-0.4530248, 1.773292, -0.7483988, 0.08627451, 1, 0, 1,
-0.4482767, 0.7582579, -0.5149921, 0.07843138, 1, 0, 1,
-0.4440389, -0.8422258, -3.228723, 0.07450981, 1, 0, 1,
-0.4440004, 0.7626998, 1.228499, 0.06666667, 1, 0, 1,
-0.4386507, 0.08382978, -1.436288, 0.0627451, 1, 0, 1,
-0.4366372, 0.5463449, -0.8184458, 0.05490196, 1, 0, 1,
-0.434893, 0.3596504, -1.500359, 0.05098039, 1, 0, 1,
-0.4300566, -0.9423184, -3.618404, 0.04313726, 1, 0, 1,
-0.4286708, 0.08546194, -1.754127, 0.03921569, 1, 0, 1,
-0.4280512, -1.502247, -4.34489, 0.03137255, 1, 0, 1,
-0.4279707, 0.2672104, -0.3797413, 0.02745098, 1, 0, 1,
-0.4277791, -0.9326757, -2.191069, 0.01960784, 1, 0, 1,
-0.4217043, -1.165549, -4.309352, 0.01568628, 1, 0, 1,
-0.4210327, -1.197725, -2.856961, 0.007843138, 1, 0, 1,
-0.4181453, 0.7610968, -2.138965, 0.003921569, 1, 0, 1,
-0.4178295, 0.1719954, -2.38229, 0, 1, 0.003921569, 1,
-0.4171005, -0.2530383, -0.7660583, 0, 1, 0.01176471, 1,
-0.4168402, -0.7264662, -1.736217, 0, 1, 0.01568628, 1,
-0.4152697, -0.5435432, -3.162117, 0, 1, 0.02352941, 1,
-0.4142372, -0.6676137, -0.9475201, 0, 1, 0.02745098, 1,
-0.4129245, -1.165583, -3.248511, 0, 1, 0.03529412, 1,
-0.4125429, 0.9264054, -1.168012, 0, 1, 0.03921569, 1,
-0.4118013, -1.124201, -2.732575, 0, 1, 0.04705882, 1,
-0.4117917, 0.7012452, -1.82682, 0, 1, 0.05098039, 1,
-0.4039792, 1.080746, -0.9185762, 0, 1, 0.05882353, 1,
-0.4020502, 1.126621, -0.9312434, 0, 1, 0.0627451, 1,
-0.3968765, -2.38989, -4.13973, 0, 1, 0.07058824, 1,
-0.3940544, 0.6787627, 0.1011168, 0, 1, 0.07450981, 1,
-0.3925572, 1.294903, 0.9241261, 0, 1, 0.08235294, 1,
-0.3919175, -0.5681863, -2.394199, 0, 1, 0.08627451, 1,
-0.3899334, -0.6715383, -2.929796, 0, 1, 0.09411765, 1,
-0.3889418, 0.6950482, 0.3089904, 0, 1, 0.1019608, 1,
-0.3872854, -1.565471, -2.740161, 0, 1, 0.1058824, 1,
-0.384926, -0.3333643, -1.426227, 0, 1, 0.1137255, 1,
-0.3843037, -0.01069895, -3.32915, 0, 1, 0.1176471, 1,
-0.3791238, 0.40602, -1.150953, 0, 1, 0.1254902, 1,
-0.3781548, 1.005581, -2.600507, 0, 1, 0.1294118, 1,
-0.377876, -1.174185, -4.153694, 0, 1, 0.1372549, 1,
-0.3711218, 0.1496537, -0.4222406, 0, 1, 0.1411765, 1,
-0.3669339, 0.8428871, -0.4052233, 0, 1, 0.1490196, 1,
-0.3663746, -0.01789847, -2.140008, 0, 1, 0.1529412, 1,
-0.3647199, -0.5845336, -3.095811, 0, 1, 0.1607843, 1,
-0.3641681, -0.4183301, -1.557797, 0, 1, 0.1647059, 1,
-0.3624279, 0.8376594, -1.185099, 0, 1, 0.172549, 1,
-0.3615317, -0.7903271, -1.776048, 0, 1, 0.1764706, 1,
-0.3610122, -0.1149534, -2.048397, 0, 1, 0.1843137, 1,
-0.3594069, 0.02786995, -1.747488, 0, 1, 0.1882353, 1,
-0.3576458, -0.8892871, -3.46982, 0, 1, 0.1960784, 1,
-0.3542567, -1.616208, -2.491627, 0, 1, 0.2039216, 1,
-0.3517027, 1.920005, 1.750536, 0, 1, 0.2078431, 1,
-0.344319, -0.7680929, -3.392395, 0, 1, 0.2156863, 1,
-0.3442702, 0.9402481, -1.251571, 0, 1, 0.2196078, 1,
-0.331602, 1.649667, -0.1240232, 0, 1, 0.227451, 1,
-0.3281623, -0.5012234, -1.941306, 0, 1, 0.2313726, 1,
-0.3275767, -0.2495412, -2.919353, 0, 1, 0.2392157, 1,
-0.326445, 1.867077, 0.09536411, 0, 1, 0.2431373, 1,
-0.3236611, -0.9065771, -2.476536, 0, 1, 0.2509804, 1,
-0.3220509, 0.6013615, -1.125441, 0, 1, 0.254902, 1,
-0.3207073, -1.607436, -2.124303, 0, 1, 0.2627451, 1,
-0.3168057, 0.04152923, -0.8849677, 0, 1, 0.2666667, 1,
-0.3160684, 0.4061353, -1.05652, 0, 1, 0.2745098, 1,
-0.3085491, -1.899556, -3.651639, 0, 1, 0.2784314, 1,
-0.3085078, -1.927168, -3.992729, 0, 1, 0.2862745, 1,
-0.3083751, 0.1871163, -0.7000395, 0, 1, 0.2901961, 1,
-0.306146, 0.5980717, -1.248109, 0, 1, 0.2980392, 1,
-0.304197, -0.1155785, -1.123919, 0, 1, 0.3058824, 1,
-0.3040438, 0.3809027, -0.2083399, 0, 1, 0.3098039, 1,
-0.3024468, 0.972794, -1.418987, 0, 1, 0.3176471, 1,
-0.3022165, 0.3938904, -0.04944691, 0, 1, 0.3215686, 1,
-0.3004193, 0.3568504, -1.016303, 0, 1, 0.3294118, 1,
-0.2985263, 0.6748063, -1.402217, 0, 1, 0.3333333, 1,
-0.2983592, 0.6953362, 1.264785, 0, 1, 0.3411765, 1,
-0.2975698, -1.321891, -4.355838, 0, 1, 0.345098, 1,
-0.2963894, -0.8452135, -3.309031, 0, 1, 0.3529412, 1,
-0.2937737, 0.9025083, 0.1060308, 0, 1, 0.3568628, 1,
-0.2905678, 0.3033952, -2.574835, 0, 1, 0.3647059, 1,
-0.2889796, -2.478395, -4.139407, 0, 1, 0.3686275, 1,
-0.2799014, -0.03919416, -1.153014, 0, 1, 0.3764706, 1,
-0.2754553, 0.0959429, -1.564526, 0, 1, 0.3803922, 1,
-0.2739221, -1.59492, -3.738802, 0, 1, 0.3882353, 1,
-0.270811, 0.01913984, -2.874486, 0, 1, 0.3921569, 1,
-0.2686402, 1.492673, -1.473967, 0, 1, 0.4, 1,
-0.2658922, 0.4367675, 0.4974805, 0, 1, 0.4078431, 1,
-0.2588304, 0.02042043, -0.1058912, 0, 1, 0.4117647, 1,
-0.2586676, -1.129443, -4.603249, 0, 1, 0.4196078, 1,
-0.2583697, -0.1069789, -1.165994, 0, 1, 0.4235294, 1,
-0.2570412, -1.745312, -3.696674, 0, 1, 0.4313726, 1,
-0.2568288, -0.5482183, -0.9868506, 0, 1, 0.4352941, 1,
-0.251185, -0.6283618, -3.575529, 0, 1, 0.4431373, 1,
-0.2474684, 0.6274579, 0.5254422, 0, 1, 0.4470588, 1,
-0.2437938, 0.009137171, -1.443272, 0, 1, 0.454902, 1,
-0.2430869, 2.331939, 0.6560016, 0, 1, 0.4588235, 1,
-0.2421776, -0.282153, -2.357119, 0, 1, 0.4666667, 1,
-0.2382878, -0.9271939, -2.261956, 0, 1, 0.4705882, 1,
-0.2376381, 0.6456569, 0.3695508, 0, 1, 0.4784314, 1,
-0.231809, 0.4642151, 1.072317, 0, 1, 0.4823529, 1,
-0.229148, -0.4387332, -2.799466, 0, 1, 0.4901961, 1,
-0.2258191, -0.6394075, -2.681773, 0, 1, 0.4941176, 1,
-0.2222458, -2.028392, -1.754425, 0, 1, 0.5019608, 1,
-0.2218713, -0.2749034, -1.59896, 0, 1, 0.509804, 1,
-0.2191244, -0.5734878, -2.282824, 0, 1, 0.5137255, 1,
-0.2039197, -1.39356, -5.65095, 0, 1, 0.5215687, 1,
-0.2016756, -0.4631847, -1.885141, 0, 1, 0.5254902, 1,
-0.1974347, 0.5400963, -0.3525227, 0, 1, 0.5333334, 1,
-0.1913667, -1.533673, -2.432545, 0, 1, 0.5372549, 1,
-0.1887006, 0.1749003, -1.089434, 0, 1, 0.5450981, 1,
-0.1827533, 0.1934571, -1.719947, 0, 1, 0.5490196, 1,
-0.1773122, 0.6028891, -0.6211539, 0, 1, 0.5568628, 1,
-0.176769, -0.1584174, -2.257531, 0, 1, 0.5607843, 1,
-0.1734406, 0.9729115, 1.169716, 0, 1, 0.5686275, 1,
-0.1693753, 1.44467, 0.05072535, 0, 1, 0.572549, 1,
-0.1685341, -0.5510256, -3.288866, 0, 1, 0.5803922, 1,
-0.1679605, 0.06660575, -1.067182, 0, 1, 0.5843138, 1,
-0.1679318, -0.2429122, -1.824287, 0, 1, 0.5921569, 1,
-0.1669501, 1.38941, 1.092092, 0, 1, 0.5960785, 1,
-0.163833, 2.273536, -0.2124981, 0, 1, 0.6039216, 1,
-0.1637923, -0.2865859, -2.889502, 0, 1, 0.6117647, 1,
-0.1631622, 0.9395009, -0.9007615, 0, 1, 0.6156863, 1,
-0.1569807, 1.359057, 0.5025721, 0, 1, 0.6235294, 1,
-0.1554465, -0.4558117, -1.245736, 0, 1, 0.627451, 1,
-0.1543126, 0.8370318, -0.639528, 0, 1, 0.6352941, 1,
-0.1531477, 0.4373102, -1.246402, 0, 1, 0.6392157, 1,
-0.1520838, -0.5423935, -3.868283, 0, 1, 0.6470588, 1,
-0.1516795, -1.425045, -2.968595, 0, 1, 0.6509804, 1,
-0.1454656, 1.448892, 0.9757761, 0, 1, 0.6588235, 1,
-0.1404619, -0.1271371, -1.684593, 0, 1, 0.6627451, 1,
-0.1403081, -0.0985595, -3.129621, 0, 1, 0.6705883, 1,
-0.1334657, 0.9674106, 0.6761312, 0, 1, 0.6745098, 1,
-0.1307761, -0.4570544, -3.361762, 0, 1, 0.682353, 1,
-0.1305727, -0.1383419, -2.225142, 0, 1, 0.6862745, 1,
-0.1290447, -0.2079998, -2.195683, 0, 1, 0.6941177, 1,
-0.1277557, -2.301542, -2.447165, 0, 1, 0.7019608, 1,
-0.1263734, -0.1511692, -2.374616, 0, 1, 0.7058824, 1,
-0.1252247, 0.104896, -1.434446, 0, 1, 0.7137255, 1,
-0.1233515, 1.346767, 0.2401915, 0, 1, 0.7176471, 1,
-0.1218264, 0.1917168, -0.5659164, 0, 1, 0.7254902, 1,
-0.1190727, -0.7781428, -4.458684, 0, 1, 0.7294118, 1,
-0.1182014, -2.035855, -3.278354, 0, 1, 0.7372549, 1,
-0.1063084, -0.5448911, -3.127199, 0, 1, 0.7411765, 1,
-0.1049071, -0.5017939, -2.442437, 0, 1, 0.7490196, 1,
-0.1006737, -0.2178934, -3.505598, 0, 1, 0.7529412, 1,
-0.0980446, 0.5067972, 0.9939755, 0, 1, 0.7607843, 1,
-0.09732432, 0.1759356, -2.370209, 0, 1, 0.7647059, 1,
-0.09654151, -1.919211, -2.994215, 0, 1, 0.772549, 1,
-0.09304781, 0.284707, 0.2554497, 0, 1, 0.7764706, 1,
-0.09098917, 1.545225, -0.8904848, 0, 1, 0.7843137, 1,
-0.09023791, 0.7740499, -0.1687231, 0, 1, 0.7882353, 1,
-0.08909996, -0.5715281, -0.632717, 0, 1, 0.7960784, 1,
-0.0887742, 1.001777, 2.38985, 0, 1, 0.8039216, 1,
-0.08693806, 0.3671293, -1.242599, 0, 1, 0.8078431, 1,
-0.08660071, -0.5162025, -3.804873, 0, 1, 0.8156863, 1,
-0.0861516, -0.3574817, -5.096053, 0, 1, 0.8196079, 1,
-0.0796067, 0.9217225, -0.1998528, 0, 1, 0.827451, 1,
-0.07721814, 1.937582, 0.6669114, 0, 1, 0.8313726, 1,
-0.07444008, -0.4529258, -4.965199, 0, 1, 0.8392157, 1,
-0.07136347, -1.588601, -3.90825, 0, 1, 0.8431373, 1,
-0.06907433, 0.4529156, 1.785799, 0, 1, 0.8509804, 1,
-0.06771188, 0.6296183, 0.9970552, 0, 1, 0.854902, 1,
-0.06749618, -0.1695409, -3.419348, 0, 1, 0.8627451, 1,
-0.06457026, 0.04096291, -0.09346999, 0, 1, 0.8666667, 1,
-0.06347212, -0.4121408, -2.644851, 0, 1, 0.8745098, 1,
-0.06263172, 0.2346988, -0.4629382, 0, 1, 0.8784314, 1,
-0.06164964, -0.002761179, -0.4712773, 0, 1, 0.8862745, 1,
-0.06064577, 1.393483, 0.6910502, 0, 1, 0.8901961, 1,
-0.06053051, 1.139047, -1.768616, 0, 1, 0.8980392, 1,
-0.0601505, 0.5241104, -0.5080725, 0, 1, 0.9058824, 1,
-0.05989863, -0.05460483, -1.524576, 0, 1, 0.9098039, 1,
-0.05925574, 0.4736902, -1.169616, 0, 1, 0.9176471, 1,
-0.05406762, -0.4824376, -3.426359, 0, 1, 0.9215686, 1,
-0.05109679, -0.9388399, -2.922085, 0, 1, 0.9294118, 1,
-0.04850755, -0.6861323, -4.575971, 0, 1, 0.9333333, 1,
-0.04309576, -0.1476055, -0.9103562, 0, 1, 0.9411765, 1,
-0.04293951, 0.6323923, 2.619206, 0, 1, 0.945098, 1,
-0.04163391, -0.2039741, -2.827818, 0, 1, 0.9529412, 1,
-0.03766901, 0.2071436, -0.511215, 0, 1, 0.9568627, 1,
-0.03749642, -0.4987988, -1.646322, 0, 1, 0.9647059, 1,
-0.0373968, -0.5841022, -1.610585, 0, 1, 0.9686275, 1,
-0.03699695, 2.083665, 0.1069283, 0, 1, 0.9764706, 1,
-0.03552929, 0.2474493, -0.6853544, 0, 1, 0.9803922, 1,
-0.03548984, 1.117951, 0.3857305, 0, 1, 0.9882353, 1,
-0.03527929, -0.6105224, -4.335883, 0, 1, 0.9921569, 1,
-0.03180031, 0.7032359, -1.553771, 0, 1, 1, 1,
-0.03119058, -1.260864, -3.273035, 0, 0.9921569, 1, 1,
-0.02819751, 0.774264, -1.788462, 0, 0.9882353, 1, 1,
-0.01820475, 0.795178, 0.7063641, 0, 0.9803922, 1, 1,
-0.01712551, 0.06281368, 0.04486796, 0, 0.9764706, 1, 1,
-0.01263097, -2.248815, -3.004695, 0, 0.9686275, 1, 1,
-0.007342762, -0.8187159, -4.132429, 0, 0.9647059, 1, 1,
-0.007139268, -0.01212268, -3.813964, 0, 0.9568627, 1, 1,
-0.004622151, -1.375955, -4.069249, 0, 0.9529412, 1, 1,
0.0005589942, 0.1810403, 1.138725, 0, 0.945098, 1, 1,
0.002041104, 0.7181848, -0.8794341, 0, 0.9411765, 1, 1,
0.003170904, 1.600845, 1.258422, 0, 0.9333333, 1, 1,
0.007425811, -1.78484, 2.755133, 0, 0.9294118, 1, 1,
0.007817331, -0.04755238, 1.03539, 0, 0.9215686, 1, 1,
0.01270961, 0.234834, -2.866402, 0, 0.9176471, 1, 1,
0.01744986, -0.758005, 2.899687, 0, 0.9098039, 1, 1,
0.01749922, 1.056478, -1.049943, 0, 0.9058824, 1, 1,
0.02038303, -0.8811175, 4.551052, 0, 0.8980392, 1, 1,
0.02323732, 0.3432037, -0.3287347, 0, 0.8901961, 1, 1,
0.02431777, 1.700926, -1.526996, 0, 0.8862745, 1, 1,
0.02504372, -0.1491423, 3.091695, 0, 0.8784314, 1, 1,
0.03520267, 0.08552612, 2.177443, 0, 0.8745098, 1, 1,
0.03662727, -0.1434324, 4.029335, 0, 0.8666667, 1, 1,
0.0387133, -2.513369, 3.764751, 0, 0.8627451, 1, 1,
0.03911931, -0.300057, 1.155094, 0, 0.854902, 1, 1,
0.03967547, -1.130361, 3.943233, 0, 0.8509804, 1, 1,
0.04067312, 0.4118305, 2.04013, 0, 0.8431373, 1, 1,
0.04160299, -1.377313, 4.911716, 0, 0.8392157, 1, 1,
0.04966516, 1.606031, 0.2044219, 0, 0.8313726, 1, 1,
0.05011361, 0.8561935, 0.4612993, 0, 0.827451, 1, 1,
0.05139362, -0.5176169, 2.842465, 0, 0.8196079, 1, 1,
0.05285368, -0.2588539, 3.637715, 0, 0.8156863, 1, 1,
0.05346511, 0.4693928, 0.04363881, 0, 0.8078431, 1, 1,
0.06098558, -1.276579, 3.448891, 0, 0.8039216, 1, 1,
0.06487878, 0.6909679, -0.67025, 0, 0.7960784, 1, 1,
0.07193274, -1.117306, 3.011332, 0, 0.7882353, 1, 1,
0.07262584, 1.730528, 0.477731, 0, 0.7843137, 1, 1,
0.07289217, 0.5995208, 0.1624568, 0, 0.7764706, 1, 1,
0.07467908, -0.2598921, 1.991492, 0, 0.772549, 1, 1,
0.08184104, 0.5682366, -0.08023601, 0, 0.7647059, 1, 1,
0.08304705, 0.01393724, 0.8603204, 0, 0.7607843, 1, 1,
0.0893562, -1.499264, 3.650138, 0, 0.7529412, 1, 1,
0.08991673, 0.03952629, 2.523084, 0, 0.7490196, 1, 1,
0.09512212, -0.5901843, 1.897587, 0, 0.7411765, 1, 1,
0.1027896, -1.25205, 3.067288, 0, 0.7372549, 1, 1,
0.107228, 0.7852544, 2.320782, 0, 0.7294118, 1, 1,
0.108503, -0.4424199, 2.380483, 0, 0.7254902, 1, 1,
0.1104793, -0.02841181, 1.944153, 0, 0.7176471, 1, 1,
0.1131722, -0.4102485, 1.701144, 0, 0.7137255, 1, 1,
0.1200884, -2.221833, 2.674966, 0, 0.7058824, 1, 1,
0.1237374, -2.229179, 2.411013, 0, 0.6980392, 1, 1,
0.126797, -0.4174065, 2.535582, 0, 0.6941177, 1, 1,
0.1272346, 0.7474178, -0.3535826, 0, 0.6862745, 1, 1,
0.1342738, -0.3657626, 3.499054, 0, 0.682353, 1, 1,
0.1352138, 1.403172, 0.5987974, 0, 0.6745098, 1, 1,
0.1395847, -1.764577, 3.449557, 0, 0.6705883, 1, 1,
0.1454156, -0.8262002, 1.527287, 0, 0.6627451, 1, 1,
0.1459194, 0.2695254, 0.5830534, 0, 0.6588235, 1, 1,
0.1498134, 0.8787495, -0.272328, 0, 0.6509804, 1, 1,
0.1620044, 0.4185756, 0.6802148, 0, 0.6470588, 1, 1,
0.1627081, 0.2571048, 1.178574, 0, 0.6392157, 1, 1,
0.1631978, 0.5088553, 0.9681347, 0, 0.6352941, 1, 1,
0.1634545, -0.9416547, -0.01887355, 0, 0.627451, 1, 1,
0.1643863, 0.9736609, -0.6219608, 0, 0.6235294, 1, 1,
0.1653508, 0.7040381, -0.5100645, 0, 0.6156863, 1, 1,
0.1662623, -0.575242, 2.786179, 0, 0.6117647, 1, 1,
0.1677947, -0.1532314, 2.363748, 0, 0.6039216, 1, 1,
0.1686135, -0.01966048, 1.957369, 0, 0.5960785, 1, 1,
0.1695704, -0.6093168, 3.745766, 0, 0.5921569, 1, 1,
0.1703471, 0.7564914, 1.602072, 0, 0.5843138, 1, 1,
0.1730886, -0.2146904, 1.88126, 0, 0.5803922, 1, 1,
0.1744029, -0.6652419, 0.5960096, 0, 0.572549, 1, 1,
0.1778629, 0.4631918, 0.7431187, 0, 0.5686275, 1, 1,
0.1811042, -2.709899, 2.989707, 0, 0.5607843, 1, 1,
0.1824956, -1.385134, 3.057573, 0, 0.5568628, 1, 1,
0.1826475, 0.061371, 1.939116, 0, 0.5490196, 1, 1,
0.1864939, -1.313379, 3.293874, 0, 0.5450981, 1, 1,
0.1876069, -1.063639, 0.9804512, 0, 0.5372549, 1, 1,
0.1887351, -0.5313087, 1.092697, 0, 0.5333334, 1, 1,
0.1965376, 0.0174997, 0.6572293, 0, 0.5254902, 1, 1,
0.1999095, -0.5517691, 3.737837, 0, 0.5215687, 1, 1,
0.2060656, 0.2942448, -0.5253066, 0, 0.5137255, 1, 1,
0.2080019, -1.459329, 3.091322, 0, 0.509804, 1, 1,
0.2100563, -1.137296, 2.828312, 0, 0.5019608, 1, 1,
0.2116421, -0.1701755, 2.396112, 0, 0.4941176, 1, 1,
0.2122305, 1.04198, 0.6128136, 0, 0.4901961, 1, 1,
0.2218366, -0.1871156, 1.363624, 0, 0.4823529, 1, 1,
0.2286625, 0.3734142, 2.128386, 0, 0.4784314, 1, 1,
0.2301228, 0.498089, 2.052828, 0, 0.4705882, 1, 1,
0.2308745, -0.6360347, 2.705659, 0, 0.4666667, 1, 1,
0.2327856, -0.3084837, 1.229381, 0, 0.4588235, 1, 1,
0.2386234, 1.752649, 1.353543, 0, 0.454902, 1, 1,
0.2438693, 1.542278, 1.241007, 0, 0.4470588, 1, 1,
0.2453976, -0.2990074, 2.583941, 0, 0.4431373, 1, 1,
0.2462311, -0.3483401, 2.347488, 0, 0.4352941, 1, 1,
0.2487487, 0.2684918, 0.8345011, 0, 0.4313726, 1, 1,
0.2509722, -0.1093008, 2.360301, 0, 0.4235294, 1, 1,
0.2512104, 0.7625908, 1.37624, 0, 0.4196078, 1, 1,
0.2558013, 1.075264, -3.312978, 0, 0.4117647, 1, 1,
0.256113, -1.255209, 1.784284, 0, 0.4078431, 1, 1,
0.2572299, -1.07205, 3.363601, 0, 0.4, 1, 1,
0.2606151, 1.002545, 0.5546661, 0, 0.3921569, 1, 1,
0.2606791, 0.8110145, -0.4578747, 0, 0.3882353, 1, 1,
0.2620194, 0.9091411, 0.7501183, 0, 0.3803922, 1, 1,
0.2623436, -0.9573186, 2.821293, 0, 0.3764706, 1, 1,
0.2631992, 1.625932, -1.42697, 0, 0.3686275, 1, 1,
0.2638629, -0.1569223, 3.032194, 0, 0.3647059, 1, 1,
0.2645326, -1.064161, 2.414313, 0, 0.3568628, 1, 1,
0.269083, 1.715748, -0.3486478, 0, 0.3529412, 1, 1,
0.2694496, 1.061201, 0.5536063, 0, 0.345098, 1, 1,
0.2696992, -1.271299, 1.109558, 0, 0.3411765, 1, 1,
0.2717364, 0.4799044, -0.06361408, 0, 0.3333333, 1, 1,
0.273622, 0.4284597, 2.435969, 0, 0.3294118, 1, 1,
0.2780379, -1.039843, 3.878556, 0, 0.3215686, 1, 1,
0.2809647, -1.359449, 3.977561, 0, 0.3176471, 1, 1,
0.2875135, 0.2239603, 0.8904521, 0, 0.3098039, 1, 1,
0.2897282, -0.8835737, 4.176057, 0, 0.3058824, 1, 1,
0.292294, -0.6898642, 0.1809011, 0, 0.2980392, 1, 1,
0.3009266, -0.2777018, 3.209624, 0, 0.2901961, 1, 1,
0.3044435, 0.5706889, 0.7026895, 0, 0.2862745, 1, 1,
0.3073432, 1.18538, -1.500015, 0, 0.2784314, 1, 1,
0.3136987, 0.7892941, 1.804908, 0, 0.2745098, 1, 1,
0.3191799, 0.5146689, -0.4393444, 0, 0.2666667, 1, 1,
0.3238132, -0.4424147, 2.303586, 0, 0.2627451, 1, 1,
0.3279538, 0.431472, 0.763563, 0, 0.254902, 1, 1,
0.331647, -0.01067165, 1.698307, 0, 0.2509804, 1, 1,
0.3355776, 0.3474246, 0.02342155, 0, 0.2431373, 1, 1,
0.3374442, -0.4895909, 2.897545, 0, 0.2392157, 1, 1,
0.3398918, 0.3825682, 0.7337241, 0, 0.2313726, 1, 1,
0.3423451, 0.06293432, 1.937456, 0, 0.227451, 1, 1,
0.3426279, -0.8159086, 1.842297, 0, 0.2196078, 1, 1,
0.3436307, 0.0149715, 1.892169, 0, 0.2156863, 1, 1,
0.3455288, 0.02986438, 1.446206, 0, 0.2078431, 1, 1,
0.3503304, -1.536721, 3.530099, 0, 0.2039216, 1, 1,
0.3551898, -0.9418752, 2.9879, 0, 0.1960784, 1, 1,
0.3582371, -1.031671, 3.895576, 0, 0.1882353, 1, 1,
0.3603901, 2.035201, 0.9504332, 0, 0.1843137, 1, 1,
0.3610989, -1.399545, 1.620646, 0, 0.1764706, 1, 1,
0.3633457, 0.9710852, 1.872236, 0, 0.172549, 1, 1,
0.3665951, -0.3182242, 2.336727, 0, 0.1647059, 1, 1,
0.3714086, -1.13128, 1.779739, 0, 0.1607843, 1, 1,
0.3717653, -0.892131, 2.332439, 0, 0.1529412, 1, 1,
0.3727132, -0.7978911, 4.10708, 0, 0.1490196, 1, 1,
0.3756301, -0.6918126, 3.679718, 0, 0.1411765, 1, 1,
0.3757842, 0.02900936, 1.626357, 0, 0.1372549, 1, 1,
0.3813141, -0.09970104, 0.9941928, 0, 0.1294118, 1, 1,
0.3861256, -1.762596, 2.013288, 0, 0.1254902, 1, 1,
0.3892447, -0.06425304, 2.077598, 0, 0.1176471, 1, 1,
0.3905485, -0.648652, 2.278364, 0, 0.1137255, 1, 1,
0.3943198, 0.970103, 0.3951952, 0, 0.1058824, 1, 1,
0.3961016, 1.218038, -0.1257286, 0, 0.09803922, 1, 1,
0.396868, 0.621699, -0.1419467, 0, 0.09411765, 1, 1,
0.4014075, -0.1028721, 2.339171, 0, 0.08627451, 1, 1,
0.4017382, 0.1380866, 1.767801, 0, 0.08235294, 1, 1,
0.4025744, 0.9523125, 0.935043, 0, 0.07450981, 1, 1,
0.4078142, -0.1430144, 0.1185075, 0, 0.07058824, 1, 1,
0.4129476, -1.492611, 2.093523, 0, 0.0627451, 1, 1,
0.4143428, 0.2601364, 0.5029375, 0, 0.05882353, 1, 1,
0.4190124, -0.5992898, 2.491158, 0, 0.05098039, 1, 1,
0.4215277, 1.067842, 1.489168, 0, 0.04705882, 1, 1,
0.4263026, 1.016901, 0.9946333, 0, 0.03921569, 1, 1,
0.4324809, -2.183638, 2.078459, 0, 0.03529412, 1, 1,
0.432873, -0.5253415, 0.5357103, 0, 0.02745098, 1, 1,
0.433122, -1.496618, 3.327448, 0, 0.02352941, 1, 1,
0.4344487, -0.284696, 0.9590989, 0, 0.01568628, 1, 1,
0.4347371, 1.088046, -0.6561446, 0, 0.01176471, 1, 1,
0.4357949, -0.5371909, 2.692448, 0, 0.003921569, 1, 1,
0.4374687, -0.2118857, 1.083395, 0.003921569, 0, 1, 1,
0.4376602, 0.661698, 0.9258491, 0.007843138, 0, 1, 1,
0.441055, 0.5167915, 0.5745172, 0.01568628, 0, 1, 1,
0.4424303, -0.3645143, 1.816337, 0.01960784, 0, 1, 1,
0.4484013, 0.763387, 1.137574, 0.02745098, 0, 1, 1,
0.4505855, 0.3880615, 1.260448, 0.03137255, 0, 1, 1,
0.453862, 0.5544201, -0.1265673, 0.03921569, 0, 1, 1,
0.45407, -0.77026, 1.347583, 0.04313726, 0, 1, 1,
0.4555178, -1.083504, 2.881415, 0.05098039, 0, 1, 1,
0.4579925, -0.5055541, 2.245884, 0.05490196, 0, 1, 1,
0.4618505, 0.1782942, 1.105288, 0.0627451, 0, 1, 1,
0.4622093, -0.2998204, 2.930358, 0.06666667, 0, 1, 1,
0.4655654, -0.0334205, 0.9972135, 0.07450981, 0, 1, 1,
0.468113, 0.1713746, 2.115416, 0.07843138, 0, 1, 1,
0.4696495, -1.632337, 3.206208, 0.08627451, 0, 1, 1,
0.4712327, 1.342484, 0.1915406, 0.09019608, 0, 1, 1,
0.471344, -0.7617797, 3.854977, 0.09803922, 0, 1, 1,
0.4714978, -0.907194, 2.292355, 0.1058824, 0, 1, 1,
0.4763803, -1.571345, 3.256062, 0.1098039, 0, 1, 1,
0.4773574, 0.5084158, 1.321478, 0.1176471, 0, 1, 1,
0.478428, 0.9201208, -0.2712791, 0.1215686, 0, 1, 1,
0.4819755, 0.8110078, 0.7821602, 0.1294118, 0, 1, 1,
0.4900345, -0.1389925, 1.57891, 0.1333333, 0, 1, 1,
0.4928472, 0.2905596, 2.047823, 0.1411765, 0, 1, 1,
0.495569, -0.5558661, 0.6712163, 0.145098, 0, 1, 1,
0.5013264, -0.3781929, 3.275686, 0.1529412, 0, 1, 1,
0.5017253, -0.6671856, 1.770332, 0.1568628, 0, 1, 1,
0.5069408, 1.371766, -0.06929877, 0.1647059, 0, 1, 1,
0.5074069, -0.75852, 2.100513, 0.1686275, 0, 1, 1,
0.5100292, 0.02639569, 0.9330724, 0.1764706, 0, 1, 1,
0.5216705, 0.9618366, -0.3085858, 0.1803922, 0, 1, 1,
0.5273377, 1.377383, -1.077467, 0.1882353, 0, 1, 1,
0.541178, -1.401971, 5.091606, 0.1921569, 0, 1, 1,
0.54567, 1.912907, 0.9696884, 0.2, 0, 1, 1,
0.5482584, -1.112914, 2.265035, 0.2078431, 0, 1, 1,
0.5503868, 0.007901987, 1.235736, 0.2117647, 0, 1, 1,
0.5513474, 0.720232, -0.15862, 0.2196078, 0, 1, 1,
0.5536248, -0.1100452, 0.8581849, 0.2235294, 0, 1, 1,
0.5552055, 1.505069, 1.194749, 0.2313726, 0, 1, 1,
0.5553079, -0.8955299, 4.648997, 0.2352941, 0, 1, 1,
0.5580912, 1.900418, 0.8156629, 0.2431373, 0, 1, 1,
0.5609608, -0.4452801, 0.4724567, 0.2470588, 0, 1, 1,
0.5661455, -1.389601, 2.748416, 0.254902, 0, 1, 1,
0.5672674, 1.196325, 0.8079015, 0.2588235, 0, 1, 1,
0.5726892, -0.04631538, 0.646132, 0.2666667, 0, 1, 1,
0.5727712, -0.3345191, 2.537092, 0.2705882, 0, 1, 1,
0.5741053, 0.5483267, 0.04394889, 0.2784314, 0, 1, 1,
0.5775724, 0.663497, 0.3301764, 0.282353, 0, 1, 1,
0.5818647, 0.5647055, 0.1839979, 0.2901961, 0, 1, 1,
0.587638, -1.922437, 4.416304, 0.2941177, 0, 1, 1,
0.5876489, -2.86924, 3.531568, 0.3019608, 0, 1, 1,
0.5920497, 0.3449017, 2.245959, 0.3098039, 0, 1, 1,
0.5979932, 0.8978706, -0.4424718, 0.3137255, 0, 1, 1,
0.5986176, -0.07585905, 1.426701, 0.3215686, 0, 1, 1,
0.6014145, 0.6833708, 3.549173, 0.3254902, 0, 1, 1,
0.606674, 0.6705325, 1.876387, 0.3333333, 0, 1, 1,
0.6111219, -0.3543354, 2.517389, 0.3372549, 0, 1, 1,
0.6169646, 1.410171, 1.616994, 0.345098, 0, 1, 1,
0.6229044, 1.565448, 0.160484, 0.3490196, 0, 1, 1,
0.6247701, 0.8856666, 0.2380648, 0.3568628, 0, 1, 1,
0.6258256, 0.01505353, 2.047584, 0.3607843, 0, 1, 1,
0.6266286, 0.1040348, 0.0005157302, 0.3686275, 0, 1, 1,
0.6305833, 1.418357, 0.9350788, 0.372549, 0, 1, 1,
0.6313769, 1.060419, -0.0843469, 0.3803922, 0, 1, 1,
0.6316377, -0.6068075, 2.028949, 0.3843137, 0, 1, 1,
0.6348662, -0.07220528, 0.1719534, 0.3921569, 0, 1, 1,
0.6369339, -1.448641, 1.437485, 0.3960784, 0, 1, 1,
0.6388627, -0.1437988, 0.8884839, 0.4039216, 0, 1, 1,
0.6462207, -1.664936, 3.651875, 0.4117647, 0, 1, 1,
0.649861, -0.5517867, 2.024567, 0.4156863, 0, 1, 1,
0.6528125, -0.541252, 1.598014, 0.4235294, 0, 1, 1,
0.6533787, 0.1371375, 1.149131, 0.427451, 0, 1, 1,
0.6552521, -1.412837, 2.088594, 0.4352941, 0, 1, 1,
0.6621688, 2.198988, 0.07952864, 0.4392157, 0, 1, 1,
0.6640267, 0.1008663, 1.959993, 0.4470588, 0, 1, 1,
0.6666453, 0.1190101, 0.652967, 0.4509804, 0, 1, 1,
0.6676692, -0.9924418, 1.755373, 0.4588235, 0, 1, 1,
0.6804367, -0.376594, 1.82452, 0.4627451, 0, 1, 1,
0.6805038, -0.1695428, 2.269725, 0.4705882, 0, 1, 1,
0.6832172, 1.605154, 0.6335524, 0.4745098, 0, 1, 1,
0.6850353, 0.08429151, 1.261211, 0.4823529, 0, 1, 1,
0.6872858, 0.1572746, 3.340796, 0.4862745, 0, 1, 1,
0.6891814, 0.02890483, 1.465241, 0.4941176, 0, 1, 1,
0.6895147, 1.952881, 0.5449057, 0.5019608, 0, 1, 1,
0.6931764, 1.668129, 0.463908, 0.5058824, 0, 1, 1,
0.6984243, -0.4971255, 1.570932, 0.5137255, 0, 1, 1,
0.702312, -1.818175, 3.463846, 0.5176471, 0, 1, 1,
0.7026254, 0.1919764, -2.047287, 0.5254902, 0, 1, 1,
0.7080302, 1.224067, -0.7057441, 0.5294118, 0, 1, 1,
0.7109336, -0.1190194, 1.623911, 0.5372549, 0, 1, 1,
0.7115299, 0.3606396, 2.131363, 0.5411765, 0, 1, 1,
0.7176079, 2.374704, 1.020423, 0.5490196, 0, 1, 1,
0.7213203, 0.7192251, 1.473871, 0.5529412, 0, 1, 1,
0.7224891, 0.9975264, -0.5476705, 0.5607843, 0, 1, 1,
0.7371575, -0.1481748, 0.6450177, 0.5647059, 0, 1, 1,
0.7402612, 0.5065233, 1.22788, 0.572549, 0, 1, 1,
0.7427866, 0.3593616, 1.690309, 0.5764706, 0, 1, 1,
0.7435616, 0.1425166, 2.052758, 0.5843138, 0, 1, 1,
0.7528133, -1.079969, 1.015879, 0.5882353, 0, 1, 1,
0.7568844, 0.5194006, 1.356511, 0.5960785, 0, 1, 1,
0.761017, 1.824915, -0.1761001, 0.6039216, 0, 1, 1,
0.7618315, 0.1621543, 2.331505, 0.6078432, 0, 1, 1,
0.7620023, -1.475921, 2.855399, 0.6156863, 0, 1, 1,
0.7671593, -1.004837, 1.08831, 0.6196079, 0, 1, 1,
0.7740983, -0.5710987, 2.359137, 0.627451, 0, 1, 1,
0.7756292, 0.06032388, 1.083795, 0.6313726, 0, 1, 1,
0.7766908, -1.134431, 1.205835, 0.6392157, 0, 1, 1,
0.7774653, -0.006499881, 1.122396, 0.6431373, 0, 1, 1,
0.7811916, 0.5304291, 2.768413, 0.6509804, 0, 1, 1,
0.786806, -1.604921, 3.239944, 0.654902, 0, 1, 1,
0.7883403, 2.046114, 0.6132256, 0.6627451, 0, 1, 1,
0.7936019, -1.447038, 2.719413, 0.6666667, 0, 1, 1,
0.7957112, -0.261695, -0.1629562, 0.6745098, 0, 1, 1,
0.7971778, 0.6969056, 1.309176, 0.6784314, 0, 1, 1,
0.8038666, 0.287895, 2.682851, 0.6862745, 0, 1, 1,
0.8060704, 0.08934209, 1.138378, 0.6901961, 0, 1, 1,
0.8083375, -0.1688867, 3.222048, 0.6980392, 0, 1, 1,
0.811837, 0.06980651, 1.949701, 0.7058824, 0, 1, 1,
0.8211257, -0.2018005, 1.980428, 0.7098039, 0, 1, 1,
0.8245983, -1.630306, 2.55561, 0.7176471, 0, 1, 1,
0.829814, 0.7104269, 1.267665, 0.7215686, 0, 1, 1,
0.832195, 0.7813944, 1.365439, 0.7294118, 0, 1, 1,
0.83496, 0.4026701, -0.07729216, 0.7333333, 0, 1, 1,
0.8362697, 2.41491, -0.835843, 0.7411765, 0, 1, 1,
0.8387499, -0.01743204, 1.902818, 0.7450981, 0, 1, 1,
0.8469186, 1.125813, 0.6776855, 0.7529412, 0, 1, 1,
0.8476303, -0.146791, 1.908807, 0.7568628, 0, 1, 1,
0.8487303, -0.1942165, 1.36134, 0.7647059, 0, 1, 1,
0.8525915, 0.1372624, 1.749373, 0.7686275, 0, 1, 1,
0.8533655, -0.02621821, 2.465918, 0.7764706, 0, 1, 1,
0.862413, 0.5363504, 1.770107, 0.7803922, 0, 1, 1,
0.8635017, -0.8952143, 1.736567, 0.7882353, 0, 1, 1,
0.8688457, -0.6792793, 3.045779, 0.7921569, 0, 1, 1,
0.8709264, -0.2162583, 2.56962, 0.8, 0, 1, 1,
0.8796945, -0.1913084, 0.2349676, 0.8078431, 0, 1, 1,
0.8824608, 0.5882034, 2.447956, 0.8117647, 0, 1, 1,
0.8846046, -1.372626, 2.648422, 0.8196079, 0, 1, 1,
0.8876718, -0.7543859, 2.139234, 0.8235294, 0, 1, 1,
0.8902758, -0.1875737, 2.79205, 0.8313726, 0, 1, 1,
0.8904704, 0.8639708, 1.835755, 0.8352941, 0, 1, 1,
0.8993533, 0.4720467, 0.4105296, 0.8431373, 0, 1, 1,
0.9024253, -0.9131615, 2.786743, 0.8470588, 0, 1, 1,
0.914629, 0.9472359, 1.577371, 0.854902, 0, 1, 1,
0.9175898, -1.946441, 2.168409, 0.8588235, 0, 1, 1,
0.9179775, 0.2716402, 0.4779442, 0.8666667, 0, 1, 1,
0.9197752, -1.076632, 4.478883, 0.8705882, 0, 1, 1,
0.923895, -3.465683, 2.89098, 0.8784314, 0, 1, 1,
0.9264843, 0.6213294, 0.7417979, 0.8823529, 0, 1, 1,
0.9282394, 0.3661162, 1.154287, 0.8901961, 0, 1, 1,
0.9316677, -1.025073, 3.374903, 0.8941177, 0, 1, 1,
0.939097, -0.2301519, 1.879352, 0.9019608, 0, 1, 1,
0.9475679, -1.047289, 1.319295, 0.9098039, 0, 1, 1,
0.9485819, 0.1851185, 0.7854665, 0.9137255, 0, 1, 1,
0.9485929, -1.538823, 2.264632, 0.9215686, 0, 1, 1,
0.9496732, -0.2988688, 1.068337, 0.9254902, 0, 1, 1,
0.9542249, -0.2210565, 2.420536, 0.9333333, 0, 1, 1,
0.9608638, -0.09424889, 2.561127, 0.9372549, 0, 1, 1,
0.962281, 0.0847576, 2.990443, 0.945098, 0, 1, 1,
0.962378, 1.304235, 2.130435, 0.9490196, 0, 1, 1,
0.9636397, 0.5437667, 0.5614942, 0.9568627, 0, 1, 1,
0.9659208, 1.137565, 0.07185852, 0.9607843, 0, 1, 1,
0.9669844, 0.8034943, 1.067806, 0.9686275, 0, 1, 1,
0.9745363, 0.4036266, 0.9383602, 0.972549, 0, 1, 1,
0.9797058, -0.3228861, 2.013282, 0.9803922, 0, 1, 1,
0.9843948, -1.501118, 1.702921, 0.9843137, 0, 1, 1,
0.9846281, -1.139248, 3.194434, 0.9921569, 0, 1, 1,
0.9892017, 0.391292, 0.1254169, 0.9960784, 0, 1, 1,
0.9894714, 1.268493, 1.641333, 1, 0, 0.9960784, 1,
0.9902914, 1.012292, 1.070738, 1, 0, 0.9882353, 1,
0.9917818, -0.9553181, 1.218347, 1, 0, 0.9843137, 1,
0.9957958, -1.437267, 3.107229, 1, 0, 0.9764706, 1,
0.997008, 0.5329834, 1.409638, 1, 0, 0.972549, 1,
0.9970582, -0.5757802, 3.451749, 1, 0, 0.9647059, 1,
0.9984551, -0.5787221, 3.302283, 1, 0, 0.9607843, 1,
1.00164, 1.537197, -0.3546685, 1, 0, 0.9529412, 1,
1.004111, 0.683453, 0.9032807, 1, 0, 0.9490196, 1,
1.010745, 0.05242949, 1.326628, 1, 0, 0.9411765, 1,
1.011542, 0.7243459, 0.6100996, 1, 0, 0.9372549, 1,
1.011853, -1.965299, 2.79865, 1, 0, 0.9294118, 1,
1.019189, -0.03026642, 2.511977, 1, 0, 0.9254902, 1,
1.024872, -1.721286, 3.347754, 1, 0, 0.9176471, 1,
1.027362, 1.083472, 0.05709027, 1, 0, 0.9137255, 1,
1.032735, 0.7426864, 1.351722, 1, 0, 0.9058824, 1,
1.04467, 0.4987838, 0.8769293, 1, 0, 0.9019608, 1,
1.047989, 0.5163288, 0.1434043, 1, 0, 0.8941177, 1,
1.048128, -0.1766903, 3.324722, 1, 0, 0.8862745, 1,
1.051964, 0.823725, 1.287449, 1, 0, 0.8823529, 1,
1.052292, 0.04323149, 0.7416865, 1, 0, 0.8745098, 1,
1.052656, -1.048443, 2.313993, 1, 0, 0.8705882, 1,
1.057655, 0.6466874, -0.8754539, 1, 0, 0.8627451, 1,
1.06154, 0.2086175, 0.3473565, 1, 0, 0.8588235, 1,
1.06618, -0.5259123, 1.384988, 1, 0, 0.8509804, 1,
1.067843, 0.1987155, 0.01611405, 1, 0, 0.8470588, 1,
1.072137, -0.3622592, 2.924614, 1, 0, 0.8392157, 1,
1.075692, -0.9605442, 3.103907, 1, 0, 0.8352941, 1,
1.080773, 0.07503805, 0.8249578, 1, 0, 0.827451, 1,
1.080909, -0.1390003, -0.9346122, 1, 0, 0.8235294, 1,
1.087106, -0.229758, 1.089324, 1, 0, 0.8156863, 1,
1.099284, 0.4091935, 1.051033, 1, 0, 0.8117647, 1,
1.099835, -0.8252854, 4.276102, 1, 0, 0.8039216, 1,
1.100475, 1.265977, -1.029162, 1, 0, 0.7960784, 1,
1.102741, 0.5210415, 0.4619522, 1, 0, 0.7921569, 1,
1.123375, 0.7901868, 3.440567, 1, 0, 0.7843137, 1,
1.127788, 0.2150385, 0.8147677, 1, 0, 0.7803922, 1,
1.128647, -0.7573907, 1.047949, 1, 0, 0.772549, 1,
1.130793, 1.199381, -1.254761, 1, 0, 0.7686275, 1,
1.13826, 2.454535, 0.5593735, 1, 0, 0.7607843, 1,
1.138352, 1.563897, 0.5759248, 1, 0, 0.7568628, 1,
1.139393, 0.6673579, 0.4421248, 1, 0, 0.7490196, 1,
1.14917, 0.6319709, 2.755645, 1, 0, 0.7450981, 1,
1.149656, 0.03326843, 2.48219, 1, 0, 0.7372549, 1,
1.15331, 0.1946544, 2.302427, 1, 0, 0.7333333, 1,
1.162091, 1.479437, -0.05613358, 1, 0, 0.7254902, 1,
1.172202, -2.02319, 3.223349, 1, 0, 0.7215686, 1,
1.174397, -0.3848577, 2.045242, 1, 0, 0.7137255, 1,
1.186763, -1.276309, 2.683517, 1, 0, 0.7098039, 1,
1.18864, 0.2728211, 1.937913, 1, 0, 0.7019608, 1,
1.196968, 0.111112, 2.380868, 1, 0, 0.6941177, 1,
1.208086, 1.570002, 1.594047, 1, 0, 0.6901961, 1,
1.215525, 0.2994386, 1.568859, 1, 0, 0.682353, 1,
1.226803, 0.6727929, 0.8392128, 1, 0, 0.6784314, 1,
1.228083, -0.06456899, 4.067155, 1, 0, 0.6705883, 1,
1.233689, 2.819411, -0.2073063, 1, 0, 0.6666667, 1,
1.243092, 1.318084, 0.5657172, 1, 0, 0.6588235, 1,
1.243798, -0.4038011, 3.387214, 1, 0, 0.654902, 1,
1.24894, 0.9306605, 0.04181751, 1, 0, 0.6470588, 1,
1.252781, 1.555008, -0.3960234, 1, 0, 0.6431373, 1,
1.25307, 0.5880108, -0.5088326, 1, 0, 0.6352941, 1,
1.258478, 0.02723437, 1.266219, 1, 0, 0.6313726, 1,
1.265746, 1.286391, -0.6233673, 1, 0, 0.6235294, 1,
1.266975, -1.950938, 2.725736, 1, 0, 0.6196079, 1,
1.283971, -1.218936, 2.494352, 1, 0, 0.6117647, 1,
1.289742, -0.7219362, 3.944829, 1, 0, 0.6078432, 1,
1.290025, -0.02368108, 0.7166569, 1, 0, 0.6, 1,
1.290594, 1.040941, 0.8273128, 1, 0, 0.5921569, 1,
1.291083, -0.8239384, 3.076671, 1, 0, 0.5882353, 1,
1.30817, 0.2038259, 1.029566, 1, 0, 0.5803922, 1,
1.312851, 2.12566, 0.9382088, 1, 0, 0.5764706, 1,
1.317078, -0.1119696, 0.9487727, 1, 0, 0.5686275, 1,
1.317372, -0.424979, 1.94582, 1, 0, 0.5647059, 1,
1.317855, 1.292252, 2.087116, 1, 0, 0.5568628, 1,
1.321541, -0.0962225, 0.3563946, 1, 0, 0.5529412, 1,
1.339209, -0.5145285, 2.49368, 1, 0, 0.5450981, 1,
1.354506, 0.0008364279, 0.6443692, 1, 0, 0.5411765, 1,
1.35541, 0.9457666, 1.154276, 1, 0, 0.5333334, 1,
1.356349, 2.221375, -0.04675955, 1, 0, 0.5294118, 1,
1.367937, -0.3478042, -0.351532, 1, 0, 0.5215687, 1,
1.371876, -0.5179447, 1.7109, 1, 0, 0.5176471, 1,
1.374055, 1.060125, -1.115404, 1, 0, 0.509804, 1,
1.375201, -0.03859372, -0.1715977, 1, 0, 0.5058824, 1,
1.378888, -0.04478073, 0.694434, 1, 0, 0.4980392, 1,
1.385518, 0.09295233, 2.33566, 1, 0, 0.4901961, 1,
1.390546, -0.9228219, 2.133344, 1, 0, 0.4862745, 1,
1.40606, 1.372361, 1.23639, 1, 0, 0.4784314, 1,
1.409742, -1.708616, -0.2751189, 1, 0, 0.4745098, 1,
1.410671, -0.9527913, 2.851469, 1, 0, 0.4666667, 1,
1.440102, 0.02020216, 2.792545, 1, 0, 0.4627451, 1,
1.445502, 0.6252618, 0.1943249, 1, 0, 0.454902, 1,
1.455799, 3.606471, -0.2294511, 1, 0, 0.4509804, 1,
1.472326, 0.4027409, 1.21361, 1, 0, 0.4431373, 1,
1.485393, 0.706686, 0.5291267, 1, 0, 0.4392157, 1,
1.486319, 0.6878451, -0.5940597, 1, 0, 0.4313726, 1,
1.486478, -0.280177, 4.341207, 1, 0, 0.427451, 1,
1.497768, 2.019368, 1.781152, 1, 0, 0.4196078, 1,
1.499294, 1.064296, 0.1246093, 1, 0, 0.4156863, 1,
1.500206, 2.095125, -0.247905, 1, 0, 0.4078431, 1,
1.512892, 0.2215202, 3.186705, 1, 0, 0.4039216, 1,
1.514056, -0.08123204, 0.9637012, 1, 0, 0.3960784, 1,
1.514468, 0.8838719, 0.2299915, 1, 0, 0.3882353, 1,
1.540454, 0.7704358, 0.9562778, 1, 0, 0.3843137, 1,
1.562538, 0.1541625, 0.09107146, 1, 0, 0.3764706, 1,
1.564099, 1.536727, -0.1743968, 1, 0, 0.372549, 1,
1.568099, -1.021243, 1.662651, 1, 0, 0.3647059, 1,
1.568317, 1.025545, 1.637467, 1, 0, 0.3607843, 1,
1.573156, -0.66719, 1.542168, 1, 0, 0.3529412, 1,
1.579617, -0.6389975, 1.310664, 1, 0, 0.3490196, 1,
1.58192, 1.005034, 0.3687145, 1, 0, 0.3411765, 1,
1.590794, 0.604409, 1.043779, 1, 0, 0.3372549, 1,
1.597057, -1.799046, 2.255864, 1, 0, 0.3294118, 1,
1.599267, 1.010486, 1.438003, 1, 0, 0.3254902, 1,
1.601182, -0.3840066, 1.199778, 1, 0, 0.3176471, 1,
1.609131, 0.7168344, -0.2630797, 1, 0, 0.3137255, 1,
1.613177, -1.735745, 1.637503, 1, 0, 0.3058824, 1,
1.616924, -0.1970183, 3.736154, 1, 0, 0.2980392, 1,
1.623574, 1.158652, -0.0272136, 1, 0, 0.2941177, 1,
1.635907, 1.153977, 1.618179, 1, 0, 0.2862745, 1,
1.645664, 0.5365399, 2.691917, 1, 0, 0.282353, 1,
1.647052, 0.57493, 1.157846, 1, 0, 0.2745098, 1,
1.652681, 0.7475595, 1.668545, 1, 0, 0.2705882, 1,
1.659773, 0.09739833, 2.349431, 1, 0, 0.2627451, 1,
1.678465, 1.005857, 0.6810263, 1, 0, 0.2588235, 1,
1.679568, -0.882079, 1.856952, 1, 0, 0.2509804, 1,
1.680358, -1.167665, 1.136432, 1, 0, 0.2470588, 1,
1.686332, 0.4592128, 1.87118, 1, 0, 0.2392157, 1,
1.69175, 0.731719, 2.276147, 1, 0, 0.2352941, 1,
1.69613, 0.458777, 2.264545, 1, 0, 0.227451, 1,
1.697499, 0.4439344, 1.748675, 1, 0, 0.2235294, 1,
1.698849, -1.25224, 3.757568, 1, 0, 0.2156863, 1,
1.710786, -0.9040611, 0.6225201, 1, 0, 0.2117647, 1,
1.712567, -0.819934, 2.263499, 1, 0, 0.2039216, 1,
1.738772, 1.4384, 1.176493, 1, 0, 0.1960784, 1,
1.747821, 0.1977894, 2.065527, 1, 0, 0.1921569, 1,
1.74936, -1.991817, 2.214187, 1, 0, 0.1843137, 1,
1.779843, 0.120811, 3.43413, 1, 0, 0.1803922, 1,
1.782029, -1.552755, 1.612759, 1, 0, 0.172549, 1,
1.792099, -0.5928659, 0.6649595, 1, 0, 0.1686275, 1,
1.794938, 0.2803219, 0.04161372, 1, 0, 0.1607843, 1,
1.807831, -1.29621, 2.656582, 1, 0, 0.1568628, 1,
1.813106, 1.450472, 0.2280449, 1, 0, 0.1490196, 1,
1.814139, 1.157703, 0.5219892, 1, 0, 0.145098, 1,
1.814535, 0.1918745, 1.304471, 1, 0, 0.1372549, 1,
1.820382, -1.763592, 1.18506, 1, 0, 0.1333333, 1,
1.881439, 0.6079463, 1.693647, 1, 0, 0.1254902, 1,
1.892815, 1.165571, 1.102447, 1, 0, 0.1215686, 1,
1.914353, 2.335396, -1.025129, 1, 0, 0.1137255, 1,
1.93356, -0.5452724, 2.517914, 1, 0, 0.1098039, 1,
1.988866, -0.1564118, 1.970959, 1, 0, 0.1019608, 1,
2.010782, 0.6544862, 1.257725, 1, 0, 0.09411765, 1,
2.03777, 1.409236, 1.360236, 1, 0, 0.09019608, 1,
2.06684, -0.3107224, 1.143217, 1, 0, 0.08235294, 1,
2.087446, 0.8228964, -0.09852729, 1, 0, 0.07843138, 1,
2.121699, 0.7185375, 1.980822, 1, 0, 0.07058824, 1,
2.156772, 0.7980685, 2.847215, 1, 0, 0.06666667, 1,
2.195979, 0.06629006, 0.8042683, 1, 0, 0.05882353, 1,
2.216555, -0.1125275, 1.16918, 1, 0, 0.05490196, 1,
2.268377, -0.1849639, 1.355651, 1, 0, 0.04705882, 1,
2.285554, 0.7031091, 1.017912, 1, 0, 0.04313726, 1,
2.292158, 0.9219343, -0.4322724, 1, 0, 0.03529412, 1,
2.390766, -1.376572, 0.4139038, 1, 0, 0.03137255, 1,
2.486093, 0.5160251, 2.026367, 1, 0, 0.02352941, 1,
2.50688, -1.118188, 1.827548, 1, 0, 0.01960784, 1,
2.65631, -1.732963, 4.069399, 1, 0, 0.01176471, 1,
2.992463, 0.4302866, 0.4851188, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.1085632, -4.664413, -7.471813, 0, -0.5, 0.5, 0.5,
-0.1085632, -4.664413, -7.471813, 1, -0.5, 0.5, 0.5,
-0.1085632, -4.664413, -7.471813, 1, 1.5, 0.5, 0.5,
-0.1085632, -4.664413, -7.471813, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.260838, 0.0703938, -7.471813, 0, -0.5, 0.5, 0.5,
-4.260838, 0.0703938, -7.471813, 1, -0.5, 0.5, 0.5,
-4.260838, 0.0703938, -7.471813, 1, 1.5, 0.5, 0.5,
-4.260838, 0.0703938, -7.471813, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.260838, -4.664413, -0.2796719, 0, -0.5, 0.5, 0.5,
-4.260838, -4.664413, -0.2796719, 1, -0.5, 0.5, 0.5,
-4.260838, -4.664413, -0.2796719, 1, 1.5, 0.5, 0.5,
-4.260838, -4.664413, -0.2796719, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.571766, -5.812088,
2, -3.571766, -5.812088,
-3, -3.571766, -5.812088,
-3, -3.753874, -6.088709,
-2, -3.571766, -5.812088,
-2, -3.753874, -6.088709,
-1, -3.571766, -5.812088,
-1, -3.753874, -6.088709,
0, -3.571766, -5.812088,
0, -3.753874, -6.088709,
1, -3.571766, -5.812088,
1, -3.753874, -6.088709,
2, -3.571766, -5.812088,
2, -3.753874, -6.088709
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
-3, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
-3, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
-3, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5,
-2, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
-2, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
-2, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
-2, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5,
-1, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
-1, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
-1, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
-1, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5,
0, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
0, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
0, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
0, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5,
1, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
1, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
1, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
1, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5,
2, -4.11809, -6.641951, 0, -0.5, 0.5, 0.5,
2, -4.11809, -6.641951, 1, -0.5, 0.5, 0.5,
2, -4.11809, -6.641951, 1, 1.5, 0.5, 0.5,
2, -4.11809, -6.641951, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.30262, -2, -5.812088,
-3.30262, 2, -5.812088,
-3.30262, -2, -5.812088,
-3.462323, -2, -6.088709,
-3.30262, 0, -5.812088,
-3.462323, 0, -6.088709,
-3.30262, 2, -5.812088,
-3.462323, 2, -6.088709
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.781729, -2, -6.641951, 0, -0.5, 0.5, 0.5,
-3.781729, -2, -6.641951, 1, -0.5, 0.5, 0.5,
-3.781729, -2, -6.641951, 1, 1.5, 0.5, 0.5,
-3.781729, -2, -6.641951, 0, 1.5, 0.5, 0.5,
-3.781729, 0, -6.641951, 0, -0.5, 0.5, 0.5,
-3.781729, 0, -6.641951, 1, -0.5, 0.5, 0.5,
-3.781729, 0, -6.641951, 1, 1.5, 0.5, 0.5,
-3.781729, 0, -6.641951, 0, 1.5, 0.5, 0.5,
-3.781729, 2, -6.641951, 0, -0.5, 0.5, 0.5,
-3.781729, 2, -6.641951, 1, -0.5, 0.5, 0.5,
-3.781729, 2, -6.641951, 1, 1.5, 0.5, 0.5,
-3.781729, 2, -6.641951, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.30262, -3.571766, -4,
-3.30262, -3.571766, 4,
-3.30262, -3.571766, -4,
-3.462323, -3.753874, -4,
-3.30262, -3.571766, -2,
-3.462323, -3.753874, -2,
-3.30262, -3.571766, 0,
-3.462323, -3.753874, 0,
-3.30262, -3.571766, 2,
-3.462323, -3.753874, 2,
-3.30262, -3.571766, 4,
-3.462323, -3.753874, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.781729, -4.11809, -4, 0, -0.5, 0.5, 0.5,
-3.781729, -4.11809, -4, 1, -0.5, 0.5, 0.5,
-3.781729, -4.11809, -4, 1, 1.5, 0.5, 0.5,
-3.781729, -4.11809, -4, 0, 1.5, 0.5, 0.5,
-3.781729, -4.11809, -2, 0, -0.5, 0.5, 0.5,
-3.781729, -4.11809, -2, 1, -0.5, 0.5, 0.5,
-3.781729, -4.11809, -2, 1, 1.5, 0.5, 0.5,
-3.781729, -4.11809, -2, 0, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 0, 0, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 0, 1, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 0, 1, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 0, 0, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 2, 0, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 2, 1, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 2, 1, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 2, 0, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 4, 0, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 4, 1, -0.5, 0.5, 0.5,
-3.781729, -4.11809, 4, 1, 1.5, 0.5, 0.5,
-3.781729, -4.11809, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.30262, -3.571766, -5.812088,
-3.30262, 3.712553, -5.812088,
-3.30262, -3.571766, 5.252745,
-3.30262, 3.712553, 5.252745,
-3.30262, -3.571766, -5.812088,
-3.30262, -3.571766, 5.252745,
-3.30262, 3.712553, -5.812088,
-3.30262, 3.712553, 5.252745,
-3.30262, -3.571766, -5.812088,
3.085494, -3.571766, -5.812088,
-3.30262, -3.571766, 5.252745,
3.085494, -3.571766, 5.252745,
-3.30262, 3.712553, -5.812088,
3.085494, 3.712553, -5.812088,
-3.30262, 3.712553, 5.252745,
3.085494, 3.712553, 5.252745,
3.085494, -3.571766, -5.812088,
3.085494, 3.712553, -5.812088,
3.085494, -3.571766, 5.252745,
3.085494, 3.712553, 5.252745,
3.085494, -3.571766, -5.812088,
3.085494, -3.571766, 5.252745,
3.085494, 3.712553, -5.812088,
3.085494, 3.712553, 5.252745
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.853325;
var distance = 34.94033;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1085632, -0.0703938, 0.2796719 );
mvMatrix.scale( 1.329214, 1.165678, 0.7674015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94033);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
fenpropimorph<-read.table("fenpropimorph.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpropimorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
```

```r
y<-fenpropimorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
```

```r
z<-fenpropimorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.209589, 1.189201, 0.928157, 0, 0, 1, 1, 1,
-3.099509, -0.2503371, -1.302429, 1, 0, 0, 1, 1,
-2.91319, -0.423149, -2.214888, 1, 0, 0, 1, 1,
-2.625658, -0.9873106, -2.833468, 1, 0, 0, 1, 1,
-2.556165, 0.1520529, -0.7731987, 1, 0, 0, 1, 1,
-2.472792, -1.344848, -0.6134474, 1, 0, 0, 1, 1,
-2.435207, -0.1269367, -0.5909264, 0, 0, 0, 1, 1,
-2.426908, -1.237414, -2.282325, 0, 0, 0, 1, 1,
-2.395811, -0.2697776, -0.4040779, 0, 0, 0, 1, 1,
-2.392283, -1.312037, -1.221043, 0, 0, 0, 1, 1,
-2.348566, 0.5408434, -2.184123, 0, 0, 0, 1, 1,
-2.331599, -0.5848307, -2.898276, 0, 0, 0, 1, 1,
-2.263411, 0.1115828, -0.3360286, 0, 0, 0, 1, 1,
-2.254593, -0.1432851, -0.9766573, 1, 1, 1, 1, 1,
-2.226477, -0.7292282, -1.563108, 1, 1, 1, 1, 1,
-2.217162, -0.7594585, -0.9862019, 1, 1, 1, 1, 1,
-2.214137, -1.088464, -4.425134, 1, 1, 1, 1, 1,
-2.20261, 0.3516335, -0.1104117, 1, 1, 1, 1, 1,
-2.168738, -0.3726632, -2.891279, 1, 1, 1, 1, 1,
-2.129291, 0.6631254, -2.697467, 1, 1, 1, 1, 1,
-2.1218, -0.5789568, -1.768226, 1, 1, 1, 1, 1,
-2.107865, 0.06731329, -3.204597, 1, 1, 1, 1, 1,
-2.096244, 1.501202, 0.5524468, 1, 1, 1, 1, 1,
-2.074179, -1.400682, -1.961926, 1, 1, 1, 1, 1,
-2.044575, 0.8051113, -0.4474637, 1, 1, 1, 1, 1,
-2.043993, 0.2476523, -2.116914, 1, 1, 1, 1, 1,
-2.024862, -0.8416345, -1.975176, 1, 1, 1, 1, 1,
-2.017404, 0.7739843, -2.193294, 1, 1, 1, 1, 1,
-2.007644, -0.2840136, -0.2248706, 0, 0, 1, 1, 1,
-1.998366, 0.2046069, -1.114141, 1, 0, 0, 1, 1,
-1.991242, -0.4306087, -1.176555, 1, 0, 0, 1, 1,
-1.968673, 1.059096, 0.3334332, 1, 0, 0, 1, 1,
-1.934993, -0.2960121, -2.372038, 1, 0, 0, 1, 1,
-1.934849, 1.591697, 0.4467925, 1, 0, 0, 1, 1,
-1.932492, -0.07625139, -1.13211, 0, 0, 0, 1, 1,
-1.902036, -1.483396, -0.6919844, 0, 0, 0, 1, 1,
-1.901239, -1.190667, -2.980285, 0, 0, 0, 1, 1,
-1.896347, -0.3917297, -1.804355, 0, 0, 0, 1, 1,
-1.862364, -1.563677, -4.479244, 0, 0, 0, 1, 1,
-1.86102, 0.02839348, -1.001674, 0, 0, 0, 1, 1,
-1.85888, -1.063733, -2.91965, 0, 0, 0, 1, 1,
-1.855369, 0.1899914, -1.638013, 1, 1, 1, 1, 1,
-1.853957, -0.4913279, -3.456846, 1, 1, 1, 1, 1,
-1.843373, 0.6275476, -0.3023275, 1, 1, 1, 1, 1,
-1.836434, 0.7140799, -0.6377301, 1, 1, 1, 1, 1,
-1.812603, -0.6554034, -0.2124254, 1, 1, 1, 1, 1,
-1.804846, 1.758998, -1.560279, 1, 1, 1, 1, 1,
-1.795161, 1.592016, -1.783401, 1, 1, 1, 1, 1,
-1.792923, 0.1613468, -2.342662, 1, 1, 1, 1, 1,
-1.790667, 0.5865802, -1.183786, 1, 1, 1, 1, 1,
-1.778824, -1.221278, -1.975765, 1, 1, 1, 1, 1,
-1.77708, -1.283019, -3.267483, 1, 1, 1, 1, 1,
-1.775706, -0.498079, 0.2133877, 1, 1, 1, 1, 1,
-1.751168, 1.771757, 0.6146218, 1, 1, 1, 1, 1,
-1.747185, -0.5467942, -2.606768, 1, 1, 1, 1, 1,
-1.697682, 1.007038, -0.6536415, 1, 1, 1, 1, 1,
-1.685676, 0.1870785, -1.316727, 0, 0, 1, 1, 1,
-1.677996, -0.5345687, -0.9118348, 1, 0, 0, 1, 1,
-1.654434, -1.303278, -2.899585, 1, 0, 0, 1, 1,
-1.649862, 1.040583, -2.280218, 1, 0, 0, 1, 1,
-1.642065, 2.948653, -1.81787, 1, 0, 0, 1, 1,
-1.619456, 0.3853247, -0.7068194, 1, 0, 0, 1, 1,
-1.615904, -1.393043, -1.574135, 0, 0, 0, 1, 1,
-1.609276, -0.7777805, -2.346891, 0, 0, 0, 1, 1,
-1.582487, -0.8442668, -2.54093, 0, 0, 0, 1, 1,
-1.579497, 0.2375703, -1.50659, 0, 0, 0, 1, 1,
-1.573783, -0.7940412, -2.727139, 0, 0, 0, 1, 1,
-1.570637, 1.699241, -2.077927, 0, 0, 0, 1, 1,
-1.562629, 0.7468852, -1.166782, 0, 0, 0, 1, 1,
-1.561985, -0.3269518, -1.158447, 1, 1, 1, 1, 1,
-1.559283, -0.5841048, -3.12502, 1, 1, 1, 1, 1,
-1.555163, 0.5030901, 0.9082578, 1, 1, 1, 1, 1,
-1.516214, 0.2765073, -2.077783, 1, 1, 1, 1, 1,
-1.504861, -0.3572751, 0.08195543, 1, 1, 1, 1, 1,
-1.504823, -0.6535607, -2.20068, 1, 1, 1, 1, 1,
-1.501445, 0.5226436, -0.5712436, 1, 1, 1, 1, 1,
-1.500143, -2.427041, -2.302414, 1, 1, 1, 1, 1,
-1.498392, -1.405317, -2.255111, 1, 1, 1, 1, 1,
-1.494419, 1.11266, -0.3582285, 1, 1, 1, 1, 1,
-1.486591, -1.286655, -3.672981, 1, 1, 1, 1, 1,
-1.483563, 0.518286, -3.638417, 1, 1, 1, 1, 1,
-1.479511, 0.5714676, -0.5011237, 1, 1, 1, 1, 1,
-1.478125, 0.1505752, -1.456901, 1, 1, 1, 1, 1,
-1.474855, -1.357369, -3.354019, 1, 1, 1, 1, 1,
-1.463441, 1.728751, -1.010481, 0, 0, 1, 1, 1,
-1.440139, -0.1576985, -1.97551, 1, 0, 0, 1, 1,
-1.431765, -0.6945186, -2.576351, 1, 0, 0, 1, 1,
-1.413546, -1.988845, -3.788831, 1, 0, 0, 1, 1,
-1.402569, -0.1664976, -0.8998611, 1, 0, 0, 1, 1,
-1.400403, 0.3253615, 0.8779497, 1, 0, 0, 1, 1,
-1.371618, 0.2456467, 0.7860857, 0, 0, 0, 1, 1,
-1.368902, -0.2034014, -1.561804, 0, 0, 0, 1, 1,
-1.366344, 0.01330393, 0.2941867, 0, 0, 0, 1, 1,
-1.362349, -1.750463, -1.325019, 0, 0, 0, 1, 1,
-1.360189, -0.191866, -1.876796, 0, 0, 0, 1, 1,
-1.342792, 0.509684, -3.085702, 0, 0, 0, 1, 1,
-1.34211, 0.0507355, -0.545264, 0, 0, 0, 1, 1,
-1.333845, 1.476289, -1.08099, 1, 1, 1, 1, 1,
-1.332045, -0.1028595, 0.48474, 1, 1, 1, 1, 1,
-1.329612, 0.05936936, -0.6230505, 1, 1, 1, 1, 1,
-1.327485, -0.7267971, -1.678027, 1, 1, 1, 1, 1,
-1.325805, -0.02937281, -1.815391, 1, 1, 1, 1, 1,
-1.313655, 0.196905, -3.126495, 1, 1, 1, 1, 1,
-1.298633, 0.2539413, -1.261279, 1, 1, 1, 1, 1,
-1.297478, 1.595577, 0.1585738, 1, 1, 1, 1, 1,
-1.297102, 1.327756, -2.44723, 1, 1, 1, 1, 1,
-1.294132, 1.007612, -2.605685, 1, 1, 1, 1, 1,
-1.286268, 0.8377687, -1.032118, 1, 1, 1, 1, 1,
-1.274313, -0.5523211, -3.162063, 1, 1, 1, 1, 1,
-1.274199, -0.09613722, -0.9943042, 1, 1, 1, 1, 1,
-1.26579, 0.9430941, 0.3614216, 1, 1, 1, 1, 1,
-1.255737, -0.6203215, -3.690568, 1, 1, 1, 1, 1,
-1.252447, 0.7306327, -1.618049, 0, 0, 1, 1, 1,
-1.246887, 0.5116917, -0.8250601, 1, 0, 0, 1, 1,
-1.242012, -1.012664, -1.809458, 1, 0, 0, 1, 1,
-1.23758, 1.334149, -0.6935418, 1, 0, 0, 1, 1,
-1.236443, -1.117537, -1.255318, 1, 0, 0, 1, 1,
-1.236121, 0.7793592, -1.048231, 1, 0, 0, 1, 1,
-1.22189, -0.2761054, -3.912287, 0, 0, 0, 1, 1,
-1.21869, -1.719478, -2.997174, 0, 0, 0, 1, 1,
-1.21648, -0.1994413, -3.017921, 0, 0, 0, 1, 1,
-1.216317, 0.5751487, -2.278066, 0, 0, 0, 1, 1,
-1.200863, -0.3061395, -1.616915, 0, 0, 0, 1, 1,
-1.200137, 0.00657327, -2.489182, 0, 0, 0, 1, 1,
-1.177696, -0.8259756, -2.768745, 0, 0, 0, 1, 1,
-1.172641, -1.857975, -2.927766, 1, 1, 1, 1, 1,
-1.171948, 0.5547215, -1.305978, 1, 1, 1, 1, 1,
-1.161233, -0.5569881, -1.230643, 1, 1, 1, 1, 1,
-1.154997, 0.001728135, -0.5243011, 1, 1, 1, 1, 1,
-1.153725, 1.325146, -2.590698, 1, 1, 1, 1, 1,
-1.152206, -0.19304, -2.03661, 1, 1, 1, 1, 1,
-1.147458, 0.386631, -0.8956394, 1, 1, 1, 1, 1,
-1.145206, 1.242251, -2.050703, 1, 1, 1, 1, 1,
-1.134255, -0.7313612, -3.227949, 1, 1, 1, 1, 1,
-1.127387, 0.6110835, -1.491513, 1, 1, 1, 1, 1,
-1.124664, 1.126232, 0.1962263, 1, 1, 1, 1, 1,
-1.121683, 1.619792, 0.9327347, 1, 1, 1, 1, 1,
-1.121517, -0.1728496, -0.6713583, 1, 1, 1, 1, 1,
-1.119127, -0.1752445, -0.5803469, 1, 1, 1, 1, 1,
-1.116001, -0.07001249, -1.813093, 1, 1, 1, 1, 1,
-1.114073, -0.5464593, -1.762367, 0, 0, 1, 1, 1,
-1.107904, -1.9225, -3.416335, 1, 0, 0, 1, 1,
-1.106303, -0.9360124, -2.911586, 1, 0, 0, 1, 1,
-1.10382, 0.09274471, -3.762309, 1, 0, 0, 1, 1,
-1.091798, -1.912005, -1.999178, 1, 0, 0, 1, 1,
-1.089782, -0.2020691, -2.319638, 1, 0, 0, 1, 1,
-1.085822, 0.03721464, -1.457157, 0, 0, 0, 1, 1,
-1.083422, -1.217362, -3.281932, 0, 0, 0, 1, 1,
-1.078837, -1.977854, -2.954962, 0, 0, 0, 1, 1,
-1.073976, 1.27047, -1.979219, 0, 0, 0, 1, 1,
-1.068568, 0.1356407, -1.750585, 0, 0, 0, 1, 1,
-1.065394, 0.8570732, 0.3636882, 0, 0, 0, 1, 1,
-1.061765, -1.424616, -2.055287, 0, 0, 0, 1, 1,
-1.060199, 1.067917, -0.2256721, 1, 1, 1, 1, 1,
-1.053134, 1.362052, -0.5643759, 1, 1, 1, 1, 1,
-1.046831, 0.4455733, -2.068511, 1, 1, 1, 1, 1,
-1.042455, 3.113217, -1.990419, 1, 1, 1, 1, 1,
-1.036032, 0.01157166, -0.6443021, 1, 1, 1, 1, 1,
-1.033349, 1.593626, -1.487969, 1, 1, 1, 1, 1,
-1.027424, -0.9303089, -2.610131, 1, 1, 1, 1, 1,
-1.024495, -2.135983, -2.286909, 1, 1, 1, 1, 1,
-1.021439, 1.313389, -0.3345756, 1, 1, 1, 1, 1,
-1.017709, 1.129097, -0.8027532, 1, 1, 1, 1, 1,
-1.00853, 1.429788, -0.6400604, 1, 1, 1, 1, 1,
-1.003428, -1.455168, -4.475379, 1, 1, 1, 1, 1,
-1.00085, -0.3898, -2.552358, 1, 1, 1, 1, 1,
-1.000801, 1.411281, 0.2899979, 1, 1, 1, 1, 1,
-1.000213, 0.3635016, 0.03491006, 1, 1, 1, 1, 1,
-0.9811859, 0.7532843, 0.7107515, 0, 0, 1, 1, 1,
-0.9678151, 0.7250957, -1.712185, 1, 0, 0, 1, 1,
-0.965706, -0.6482207, -2.697362, 1, 0, 0, 1, 1,
-0.9656065, -0.1105352, -0.8792267, 1, 0, 0, 1, 1,
-0.9606471, 0.1752784, -1.908786, 1, 0, 0, 1, 1,
-0.9603005, -0.1155772, -1.897484, 1, 0, 0, 1, 1,
-0.9570399, -1.565794, -4.054072, 0, 0, 0, 1, 1,
-0.952127, -1.841052, -2.056598, 0, 0, 0, 1, 1,
-0.948332, 1.738149, -2.120612, 0, 0, 0, 1, 1,
-0.9473879, -0.8830351, -1.905627, 0, 0, 0, 1, 1,
-0.9375869, 1.199786, 0.5804582, 0, 0, 0, 1, 1,
-0.9372471, -0.7561882, -0.4263178, 0, 0, 0, 1, 1,
-0.9371235, 1.58382, -0.1426121, 0, 0, 0, 1, 1,
-0.9319622, -0.127325, -1.563119, 1, 1, 1, 1, 1,
-0.9289507, 0.5316918, -1.415904, 1, 1, 1, 1, 1,
-0.9265134, -0.2369366, -1.46024, 1, 1, 1, 1, 1,
-0.9212973, -0.05508686, -0.162092, 1, 1, 1, 1, 1,
-0.9152965, 0.00362356, -0.9137262, 1, 1, 1, 1, 1,
-0.9088077, -0.2611414, -2.916607, 1, 1, 1, 1, 1,
-0.9053587, 0.9140751, -1.790756, 1, 1, 1, 1, 1,
-0.9015272, -0.2087863, -1.857831, 1, 1, 1, 1, 1,
-0.8968427, -1.021258, -2.402084, 1, 1, 1, 1, 1,
-0.8838785, 0.01942614, -2.723674, 1, 1, 1, 1, 1,
-0.880765, -0.6347352, -1.871278, 1, 1, 1, 1, 1,
-0.8713331, -1.547383, -3.260731, 1, 1, 1, 1, 1,
-0.8649367, -0.8030195, -3.6552, 1, 1, 1, 1, 1,
-0.864885, -0.2242363, -2.58106, 1, 1, 1, 1, 1,
-0.8603496, -0.4084383, -2.546471, 1, 1, 1, 1, 1,
-0.8586432, -1.322611, -3.076587, 0, 0, 1, 1, 1,
-0.8554975, -1.165389, -1.964253, 1, 0, 0, 1, 1,
-0.8539792, 0.3449362, -0.8192282, 1, 0, 0, 1, 1,
-0.8507124, -0.3605708, -1.853811, 1, 0, 0, 1, 1,
-0.8476368, -0.7315555, -3.081883, 1, 0, 0, 1, 1,
-0.841055, -0.5173805, -2.890526, 1, 0, 0, 1, 1,
-0.8368388, 0.8250393, -1.425606, 0, 0, 0, 1, 1,
-0.8344049, 1.323099, 1.268844, 0, 0, 0, 1, 1,
-0.8331011, 1.164555, -3.067558, 0, 0, 0, 1, 1,
-0.8316866, -0.1720929, -0.4936523, 0, 0, 0, 1, 1,
-0.8303036, -0.2429551, -2.832647, 0, 0, 0, 1, 1,
-0.8255584, -0.5917881, -3.251744, 0, 0, 0, 1, 1,
-0.824908, 1.297657, -2.839308, 0, 0, 0, 1, 1,
-0.8232324, 0.8210028, -0.3110533, 1, 1, 1, 1, 1,
-0.8126836, 1.732527, 0.2945741, 1, 1, 1, 1, 1,
-0.8106626, -0.4181281, -1.701359, 1, 1, 1, 1, 1,
-0.8102043, -0.3486925, -1.81051, 1, 1, 1, 1, 1,
-0.8085784, -0.9490453, -3.419297, 1, 1, 1, 1, 1,
-0.8024358, 0.2288154, -1.507305, 1, 1, 1, 1, 1,
-0.7984139, -0.8889262, -2.304177, 1, 1, 1, 1, 1,
-0.7959613, -0.8531321, -2.660934, 1, 1, 1, 1, 1,
-0.79569, 0.7095261, -0.3494249, 1, 1, 1, 1, 1,
-0.7878349, 0.5261611, -0.3990794, 1, 1, 1, 1, 1,
-0.7869418, 1.241654, -0.5552291, 1, 1, 1, 1, 1,
-0.7770669, -0.515409, 0.04512708, 1, 1, 1, 1, 1,
-0.7760499, 0.8200459, -0.6658983, 1, 1, 1, 1, 1,
-0.7704777, 0.01846842, -2.28045, 1, 1, 1, 1, 1,
-0.7627788, 1.313506, -3.758114, 1, 1, 1, 1, 1,
-0.7493601, -0.7254723, -2.287538, 0, 0, 1, 1, 1,
-0.7458606, -2.368716, -3.738102, 1, 0, 0, 1, 1,
-0.7456502, 1.546845, -0.4174691, 1, 0, 0, 1, 1,
-0.7448434, -0.01213997, -0.7863191, 1, 0, 0, 1, 1,
-0.7414343, 0.4553852, -0.4514277, 1, 0, 0, 1, 1,
-0.7364801, -0.6481844, -0.4145703, 1, 0, 0, 1, 1,
-0.7353775, 3.046922, 0.4736074, 0, 0, 0, 1, 1,
-0.7336735, 0.5168343, -0.792166, 0, 0, 0, 1, 1,
-0.7313273, 0.6737092, 0.1154937, 0, 0, 0, 1, 1,
-0.7260694, 0.301029, -0.6097855, 0, 0, 0, 1, 1,
-0.7213126, -0.3156027, -1.875523, 0, 0, 0, 1, 1,
-0.7203988, 0.5545381, 0.5928116, 0, 0, 0, 1, 1,
-0.7169131, -2.280328, -3.654369, 0, 0, 0, 1, 1,
-0.7149811, -0.6669173, -1.448603, 1, 1, 1, 1, 1,
-0.7145765, 0.1873358, -0.6918209, 1, 1, 1, 1, 1,
-0.7132859, -0.3385432, -2.531184, 1, 1, 1, 1, 1,
-0.7112253, 1.126602, -1.256075, 1, 1, 1, 1, 1,
-0.6972885, 1.517098, -1.222987, 1, 1, 1, 1, 1,
-0.6961191, 0.06020608, -1.688012, 1, 1, 1, 1, 1,
-0.6953582, 1.0471, -0.149597, 1, 1, 1, 1, 1,
-0.6938981, 2.074076, -1.584848, 1, 1, 1, 1, 1,
-0.6889522, 0.3214962, -0.8508333, 1, 1, 1, 1, 1,
-0.6856052, 1.451089, 1.420377, 1, 1, 1, 1, 1,
-0.681524, -0.372349, -0.04320229, 1, 1, 1, 1, 1,
-0.6770896, 1.71199, -0.9710829, 1, 1, 1, 1, 1,
-0.6699326, -1.12549, -2.769279, 1, 1, 1, 1, 1,
-0.6616382, 0.7252877, 1.027247, 1, 1, 1, 1, 1,
-0.6589168, 0.8493699, -0.0278186, 1, 1, 1, 1, 1,
-0.6560791, -2.081054, -1.879245, 0, 0, 1, 1, 1,
-0.6555634, 1.033153, -0.3232072, 1, 0, 0, 1, 1,
-0.6508682, -1.684276, -3.308849, 1, 0, 0, 1, 1,
-0.6382903, 1.225266, 0.7715037, 1, 0, 0, 1, 1,
-0.636215, -1.423483, -2.986361, 1, 0, 0, 1, 1,
-0.636199, 0.6260943, 1.095186, 1, 0, 0, 1, 1,
-0.6346581, -0.5550427, -1.39314, 0, 0, 0, 1, 1,
-0.6310036, 1.788354, -1.859267, 0, 0, 0, 1, 1,
-0.6293979, -1.385877, -1.627477, 0, 0, 0, 1, 1,
-0.6291769, 0.6718572, 0.02458802, 0, 0, 0, 1, 1,
-0.6277373, -1.143683, -2.710945, 0, 0, 0, 1, 1,
-0.6271428, 1.420135, -0.0930403, 0, 0, 0, 1, 1,
-0.626404, -0.7488618, -2.238468, 0, 0, 0, 1, 1,
-0.6233832, -1.601986, -2.036117, 1, 1, 1, 1, 1,
-0.6203421, -0.01133898, -0.2973551, 1, 1, 1, 1, 1,
-0.6191679, 0.8103544, -0.2556643, 1, 1, 1, 1, 1,
-0.6189121, -0.9617454, -3.83547, 1, 1, 1, 1, 1,
-0.6122742, -0.2035677, -2.978331, 1, 1, 1, 1, 1,
-0.6102775, 1.433986, -1.248449, 1, 1, 1, 1, 1,
-0.6063997, 0.2685386, -1.605598, 1, 1, 1, 1, 1,
-0.6053931, -2.37605, -2.782887, 1, 1, 1, 1, 1,
-0.6012008, -0.2306737, -3.433099, 1, 1, 1, 1, 1,
-0.5945266, 0.691709, -1.982597, 1, 1, 1, 1, 1,
-0.59425, 1.588327, -1.418664, 1, 1, 1, 1, 1,
-0.5887123, -0.4760222, -2.776667, 1, 1, 1, 1, 1,
-0.5886295, -1.009337, -2.536579, 1, 1, 1, 1, 1,
-0.5884299, -0.377731, -2.598739, 1, 1, 1, 1, 1,
-0.5868136, -0.2107828, -0.4967115, 1, 1, 1, 1, 1,
-0.5830316, -1.891304, -3.067459, 0, 0, 1, 1, 1,
-0.5802746, -0.7447995, -3.14427, 1, 0, 0, 1, 1,
-0.5784126, 0.7894646, -0.08591574, 1, 0, 0, 1, 1,
-0.5757129, 1.178027, -1.920228, 1, 0, 0, 1, 1,
-0.5743191, 0.6873447, -1.015969, 1, 0, 0, 1, 1,
-0.5677028, 0.8263016, -1.217238, 1, 0, 0, 1, 1,
-0.5656863, 0.7964569, -1.636759, 0, 0, 0, 1, 1,
-0.5646176, -0.07373717, -1.72101, 0, 0, 0, 1, 1,
-0.5642403, 0.5272838, -1.368799, 0, 0, 0, 1, 1,
-0.560621, 1.313838, -0.1775408, 0, 0, 0, 1, 1,
-0.5600538, 0.4124664, -0.8795171, 0, 0, 0, 1, 1,
-0.5563031, -1.312548, -1.930417, 0, 0, 0, 1, 1,
-0.5523888, -0.4233637, -1.436677, 0, 0, 0, 1, 1,
-0.5523307, -0.5766459, -1.846559, 1, 1, 1, 1, 1,
-0.5478442, -0.4623838, -2.191347, 1, 1, 1, 1, 1,
-0.5464327, -0.7052274, -3.580715, 1, 1, 1, 1, 1,
-0.543838, 0.5185944, -1.017806, 1, 1, 1, 1, 1,
-0.5368541, -0.08998924, -0.5144721, 1, 1, 1, 1, 1,
-0.5225567, -1.705396, -0.7443881, 1, 1, 1, 1, 1,
-0.5198508, 0.2307946, 0.03242442, 1, 1, 1, 1, 1,
-0.5090114, 1.003623, -0.4658554, 1, 1, 1, 1, 1,
-0.5081882, -0.5042328, -0.903475, 1, 1, 1, 1, 1,
-0.5079884, -0.4323164, -2.090205, 1, 1, 1, 1, 1,
-0.5035167, 0.03803511, -0.2555196, 1, 1, 1, 1, 1,
-0.5030195, 0.5312724, -2.79122, 1, 1, 1, 1, 1,
-0.501883, 1.78413, 0.6686236, 1, 1, 1, 1, 1,
-0.4979595, -1.152102, -2.521473, 1, 1, 1, 1, 1,
-0.4971221, -0.3285574, -1.820081, 1, 1, 1, 1, 1,
-0.492483, -0.4618835, -2.816212, 0, 0, 1, 1, 1,
-0.4914292, 1.023589, 0.3361181, 1, 0, 0, 1, 1,
-0.4900663, 0.1395461, -0.05654999, 1, 0, 0, 1, 1,
-0.4865249, -0.3828786, -3.11323, 1, 0, 0, 1, 1,
-0.4861663, 0.05662587, -0.5735096, 1, 0, 0, 1, 1,
-0.4818515, -0.04923354, -0.9915636, 1, 0, 0, 1, 1,
-0.4818443, -0.5067322, -0.7956049, 0, 0, 0, 1, 1,
-0.4708368, -0.4089706, -1.065836, 0, 0, 0, 1, 1,
-0.4692812, -0.1659714, -1.703274, 0, 0, 0, 1, 1,
-0.4546125, 2.428914, 0.7323048, 0, 0, 0, 1, 1,
-0.4536389, -0.8385363, -3.477524, 0, 0, 0, 1, 1,
-0.4530248, 1.773292, -0.7483988, 0, 0, 0, 1, 1,
-0.4482767, 0.7582579, -0.5149921, 0, 0, 0, 1, 1,
-0.4440389, -0.8422258, -3.228723, 1, 1, 1, 1, 1,
-0.4440004, 0.7626998, 1.228499, 1, 1, 1, 1, 1,
-0.4386507, 0.08382978, -1.436288, 1, 1, 1, 1, 1,
-0.4366372, 0.5463449, -0.8184458, 1, 1, 1, 1, 1,
-0.434893, 0.3596504, -1.500359, 1, 1, 1, 1, 1,
-0.4300566, -0.9423184, -3.618404, 1, 1, 1, 1, 1,
-0.4286708, 0.08546194, -1.754127, 1, 1, 1, 1, 1,
-0.4280512, -1.502247, -4.34489, 1, 1, 1, 1, 1,
-0.4279707, 0.2672104, -0.3797413, 1, 1, 1, 1, 1,
-0.4277791, -0.9326757, -2.191069, 1, 1, 1, 1, 1,
-0.4217043, -1.165549, -4.309352, 1, 1, 1, 1, 1,
-0.4210327, -1.197725, -2.856961, 1, 1, 1, 1, 1,
-0.4181453, 0.7610968, -2.138965, 1, 1, 1, 1, 1,
-0.4178295, 0.1719954, -2.38229, 1, 1, 1, 1, 1,
-0.4171005, -0.2530383, -0.7660583, 1, 1, 1, 1, 1,
-0.4168402, -0.7264662, -1.736217, 0, 0, 1, 1, 1,
-0.4152697, -0.5435432, -3.162117, 1, 0, 0, 1, 1,
-0.4142372, -0.6676137, -0.9475201, 1, 0, 0, 1, 1,
-0.4129245, -1.165583, -3.248511, 1, 0, 0, 1, 1,
-0.4125429, 0.9264054, -1.168012, 1, 0, 0, 1, 1,
-0.4118013, -1.124201, -2.732575, 1, 0, 0, 1, 1,
-0.4117917, 0.7012452, -1.82682, 0, 0, 0, 1, 1,
-0.4039792, 1.080746, -0.9185762, 0, 0, 0, 1, 1,
-0.4020502, 1.126621, -0.9312434, 0, 0, 0, 1, 1,
-0.3968765, -2.38989, -4.13973, 0, 0, 0, 1, 1,
-0.3940544, 0.6787627, 0.1011168, 0, 0, 0, 1, 1,
-0.3925572, 1.294903, 0.9241261, 0, 0, 0, 1, 1,
-0.3919175, -0.5681863, -2.394199, 0, 0, 0, 1, 1,
-0.3899334, -0.6715383, -2.929796, 1, 1, 1, 1, 1,
-0.3889418, 0.6950482, 0.3089904, 1, 1, 1, 1, 1,
-0.3872854, -1.565471, -2.740161, 1, 1, 1, 1, 1,
-0.384926, -0.3333643, -1.426227, 1, 1, 1, 1, 1,
-0.3843037, -0.01069895, -3.32915, 1, 1, 1, 1, 1,
-0.3791238, 0.40602, -1.150953, 1, 1, 1, 1, 1,
-0.3781548, 1.005581, -2.600507, 1, 1, 1, 1, 1,
-0.377876, -1.174185, -4.153694, 1, 1, 1, 1, 1,
-0.3711218, 0.1496537, -0.4222406, 1, 1, 1, 1, 1,
-0.3669339, 0.8428871, -0.4052233, 1, 1, 1, 1, 1,
-0.3663746, -0.01789847, -2.140008, 1, 1, 1, 1, 1,
-0.3647199, -0.5845336, -3.095811, 1, 1, 1, 1, 1,
-0.3641681, -0.4183301, -1.557797, 1, 1, 1, 1, 1,
-0.3624279, 0.8376594, -1.185099, 1, 1, 1, 1, 1,
-0.3615317, -0.7903271, -1.776048, 1, 1, 1, 1, 1,
-0.3610122, -0.1149534, -2.048397, 0, 0, 1, 1, 1,
-0.3594069, 0.02786995, -1.747488, 1, 0, 0, 1, 1,
-0.3576458, -0.8892871, -3.46982, 1, 0, 0, 1, 1,
-0.3542567, -1.616208, -2.491627, 1, 0, 0, 1, 1,
-0.3517027, 1.920005, 1.750536, 1, 0, 0, 1, 1,
-0.344319, -0.7680929, -3.392395, 1, 0, 0, 1, 1,
-0.3442702, 0.9402481, -1.251571, 0, 0, 0, 1, 1,
-0.331602, 1.649667, -0.1240232, 0, 0, 0, 1, 1,
-0.3281623, -0.5012234, -1.941306, 0, 0, 0, 1, 1,
-0.3275767, -0.2495412, -2.919353, 0, 0, 0, 1, 1,
-0.326445, 1.867077, 0.09536411, 0, 0, 0, 1, 1,
-0.3236611, -0.9065771, -2.476536, 0, 0, 0, 1, 1,
-0.3220509, 0.6013615, -1.125441, 0, 0, 0, 1, 1,
-0.3207073, -1.607436, -2.124303, 1, 1, 1, 1, 1,
-0.3168057, 0.04152923, -0.8849677, 1, 1, 1, 1, 1,
-0.3160684, 0.4061353, -1.05652, 1, 1, 1, 1, 1,
-0.3085491, -1.899556, -3.651639, 1, 1, 1, 1, 1,
-0.3085078, -1.927168, -3.992729, 1, 1, 1, 1, 1,
-0.3083751, 0.1871163, -0.7000395, 1, 1, 1, 1, 1,
-0.306146, 0.5980717, -1.248109, 1, 1, 1, 1, 1,
-0.304197, -0.1155785, -1.123919, 1, 1, 1, 1, 1,
-0.3040438, 0.3809027, -0.2083399, 1, 1, 1, 1, 1,
-0.3024468, 0.972794, -1.418987, 1, 1, 1, 1, 1,
-0.3022165, 0.3938904, -0.04944691, 1, 1, 1, 1, 1,
-0.3004193, 0.3568504, -1.016303, 1, 1, 1, 1, 1,
-0.2985263, 0.6748063, -1.402217, 1, 1, 1, 1, 1,
-0.2983592, 0.6953362, 1.264785, 1, 1, 1, 1, 1,
-0.2975698, -1.321891, -4.355838, 1, 1, 1, 1, 1,
-0.2963894, -0.8452135, -3.309031, 0, 0, 1, 1, 1,
-0.2937737, 0.9025083, 0.1060308, 1, 0, 0, 1, 1,
-0.2905678, 0.3033952, -2.574835, 1, 0, 0, 1, 1,
-0.2889796, -2.478395, -4.139407, 1, 0, 0, 1, 1,
-0.2799014, -0.03919416, -1.153014, 1, 0, 0, 1, 1,
-0.2754553, 0.0959429, -1.564526, 1, 0, 0, 1, 1,
-0.2739221, -1.59492, -3.738802, 0, 0, 0, 1, 1,
-0.270811, 0.01913984, -2.874486, 0, 0, 0, 1, 1,
-0.2686402, 1.492673, -1.473967, 0, 0, 0, 1, 1,
-0.2658922, 0.4367675, 0.4974805, 0, 0, 0, 1, 1,
-0.2588304, 0.02042043, -0.1058912, 0, 0, 0, 1, 1,
-0.2586676, -1.129443, -4.603249, 0, 0, 0, 1, 1,
-0.2583697, -0.1069789, -1.165994, 0, 0, 0, 1, 1,
-0.2570412, -1.745312, -3.696674, 1, 1, 1, 1, 1,
-0.2568288, -0.5482183, -0.9868506, 1, 1, 1, 1, 1,
-0.251185, -0.6283618, -3.575529, 1, 1, 1, 1, 1,
-0.2474684, 0.6274579, 0.5254422, 1, 1, 1, 1, 1,
-0.2437938, 0.009137171, -1.443272, 1, 1, 1, 1, 1,
-0.2430869, 2.331939, 0.6560016, 1, 1, 1, 1, 1,
-0.2421776, -0.282153, -2.357119, 1, 1, 1, 1, 1,
-0.2382878, -0.9271939, -2.261956, 1, 1, 1, 1, 1,
-0.2376381, 0.6456569, 0.3695508, 1, 1, 1, 1, 1,
-0.231809, 0.4642151, 1.072317, 1, 1, 1, 1, 1,
-0.229148, -0.4387332, -2.799466, 1, 1, 1, 1, 1,
-0.2258191, -0.6394075, -2.681773, 1, 1, 1, 1, 1,
-0.2222458, -2.028392, -1.754425, 1, 1, 1, 1, 1,
-0.2218713, -0.2749034, -1.59896, 1, 1, 1, 1, 1,
-0.2191244, -0.5734878, -2.282824, 1, 1, 1, 1, 1,
-0.2039197, -1.39356, -5.65095, 0, 0, 1, 1, 1,
-0.2016756, -0.4631847, -1.885141, 1, 0, 0, 1, 1,
-0.1974347, 0.5400963, -0.3525227, 1, 0, 0, 1, 1,
-0.1913667, -1.533673, -2.432545, 1, 0, 0, 1, 1,
-0.1887006, 0.1749003, -1.089434, 1, 0, 0, 1, 1,
-0.1827533, 0.1934571, -1.719947, 1, 0, 0, 1, 1,
-0.1773122, 0.6028891, -0.6211539, 0, 0, 0, 1, 1,
-0.176769, -0.1584174, -2.257531, 0, 0, 0, 1, 1,
-0.1734406, 0.9729115, 1.169716, 0, 0, 0, 1, 1,
-0.1693753, 1.44467, 0.05072535, 0, 0, 0, 1, 1,
-0.1685341, -0.5510256, -3.288866, 0, 0, 0, 1, 1,
-0.1679605, 0.06660575, -1.067182, 0, 0, 0, 1, 1,
-0.1679318, -0.2429122, -1.824287, 0, 0, 0, 1, 1,
-0.1669501, 1.38941, 1.092092, 1, 1, 1, 1, 1,
-0.163833, 2.273536, -0.2124981, 1, 1, 1, 1, 1,
-0.1637923, -0.2865859, -2.889502, 1, 1, 1, 1, 1,
-0.1631622, 0.9395009, -0.9007615, 1, 1, 1, 1, 1,
-0.1569807, 1.359057, 0.5025721, 1, 1, 1, 1, 1,
-0.1554465, -0.4558117, -1.245736, 1, 1, 1, 1, 1,
-0.1543126, 0.8370318, -0.639528, 1, 1, 1, 1, 1,
-0.1531477, 0.4373102, -1.246402, 1, 1, 1, 1, 1,
-0.1520838, -0.5423935, -3.868283, 1, 1, 1, 1, 1,
-0.1516795, -1.425045, -2.968595, 1, 1, 1, 1, 1,
-0.1454656, 1.448892, 0.9757761, 1, 1, 1, 1, 1,
-0.1404619, -0.1271371, -1.684593, 1, 1, 1, 1, 1,
-0.1403081, -0.0985595, -3.129621, 1, 1, 1, 1, 1,
-0.1334657, 0.9674106, 0.6761312, 1, 1, 1, 1, 1,
-0.1307761, -0.4570544, -3.361762, 1, 1, 1, 1, 1,
-0.1305727, -0.1383419, -2.225142, 0, 0, 1, 1, 1,
-0.1290447, -0.2079998, -2.195683, 1, 0, 0, 1, 1,
-0.1277557, -2.301542, -2.447165, 1, 0, 0, 1, 1,
-0.1263734, -0.1511692, -2.374616, 1, 0, 0, 1, 1,
-0.1252247, 0.104896, -1.434446, 1, 0, 0, 1, 1,
-0.1233515, 1.346767, 0.2401915, 1, 0, 0, 1, 1,
-0.1218264, 0.1917168, -0.5659164, 0, 0, 0, 1, 1,
-0.1190727, -0.7781428, -4.458684, 0, 0, 0, 1, 1,
-0.1182014, -2.035855, -3.278354, 0, 0, 0, 1, 1,
-0.1063084, -0.5448911, -3.127199, 0, 0, 0, 1, 1,
-0.1049071, -0.5017939, -2.442437, 0, 0, 0, 1, 1,
-0.1006737, -0.2178934, -3.505598, 0, 0, 0, 1, 1,
-0.0980446, 0.5067972, 0.9939755, 0, 0, 0, 1, 1,
-0.09732432, 0.1759356, -2.370209, 1, 1, 1, 1, 1,
-0.09654151, -1.919211, -2.994215, 1, 1, 1, 1, 1,
-0.09304781, 0.284707, 0.2554497, 1, 1, 1, 1, 1,
-0.09098917, 1.545225, -0.8904848, 1, 1, 1, 1, 1,
-0.09023791, 0.7740499, -0.1687231, 1, 1, 1, 1, 1,
-0.08909996, -0.5715281, -0.632717, 1, 1, 1, 1, 1,
-0.0887742, 1.001777, 2.38985, 1, 1, 1, 1, 1,
-0.08693806, 0.3671293, -1.242599, 1, 1, 1, 1, 1,
-0.08660071, -0.5162025, -3.804873, 1, 1, 1, 1, 1,
-0.0861516, -0.3574817, -5.096053, 1, 1, 1, 1, 1,
-0.0796067, 0.9217225, -0.1998528, 1, 1, 1, 1, 1,
-0.07721814, 1.937582, 0.6669114, 1, 1, 1, 1, 1,
-0.07444008, -0.4529258, -4.965199, 1, 1, 1, 1, 1,
-0.07136347, -1.588601, -3.90825, 1, 1, 1, 1, 1,
-0.06907433, 0.4529156, 1.785799, 1, 1, 1, 1, 1,
-0.06771188, 0.6296183, 0.9970552, 0, 0, 1, 1, 1,
-0.06749618, -0.1695409, -3.419348, 1, 0, 0, 1, 1,
-0.06457026, 0.04096291, -0.09346999, 1, 0, 0, 1, 1,
-0.06347212, -0.4121408, -2.644851, 1, 0, 0, 1, 1,
-0.06263172, 0.2346988, -0.4629382, 1, 0, 0, 1, 1,
-0.06164964, -0.002761179, -0.4712773, 1, 0, 0, 1, 1,
-0.06064577, 1.393483, 0.6910502, 0, 0, 0, 1, 1,
-0.06053051, 1.139047, -1.768616, 0, 0, 0, 1, 1,
-0.0601505, 0.5241104, -0.5080725, 0, 0, 0, 1, 1,
-0.05989863, -0.05460483, -1.524576, 0, 0, 0, 1, 1,
-0.05925574, 0.4736902, -1.169616, 0, 0, 0, 1, 1,
-0.05406762, -0.4824376, -3.426359, 0, 0, 0, 1, 1,
-0.05109679, -0.9388399, -2.922085, 0, 0, 0, 1, 1,
-0.04850755, -0.6861323, -4.575971, 1, 1, 1, 1, 1,
-0.04309576, -0.1476055, -0.9103562, 1, 1, 1, 1, 1,
-0.04293951, 0.6323923, 2.619206, 1, 1, 1, 1, 1,
-0.04163391, -0.2039741, -2.827818, 1, 1, 1, 1, 1,
-0.03766901, 0.2071436, -0.511215, 1, 1, 1, 1, 1,
-0.03749642, -0.4987988, -1.646322, 1, 1, 1, 1, 1,
-0.0373968, -0.5841022, -1.610585, 1, 1, 1, 1, 1,
-0.03699695, 2.083665, 0.1069283, 1, 1, 1, 1, 1,
-0.03552929, 0.2474493, -0.6853544, 1, 1, 1, 1, 1,
-0.03548984, 1.117951, 0.3857305, 1, 1, 1, 1, 1,
-0.03527929, -0.6105224, -4.335883, 1, 1, 1, 1, 1,
-0.03180031, 0.7032359, -1.553771, 1, 1, 1, 1, 1,
-0.03119058, -1.260864, -3.273035, 1, 1, 1, 1, 1,
-0.02819751, 0.774264, -1.788462, 1, 1, 1, 1, 1,
-0.01820475, 0.795178, 0.7063641, 1, 1, 1, 1, 1,
-0.01712551, 0.06281368, 0.04486796, 0, 0, 1, 1, 1,
-0.01263097, -2.248815, -3.004695, 1, 0, 0, 1, 1,
-0.007342762, -0.8187159, -4.132429, 1, 0, 0, 1, 1,
-0.007139268, -0.01212268, -3.813964, 1, 0, 0, 1, 1,
-0.004622151, -1.375955, -4.069249, 1, 0, 0, 1, 1,
0.0005589942, 0.1810403, 1.138725, 1, 0, 0, 1, 1,
0.002041104, 0.7181848, -0.8794341, 0, 0, 0, 1, 1,
0.003170904, 1.600845, 1.258422, 0, 0, 0, 1, 1,
0.007425811, -1.78484, 2.755133, 0, 0, 0, 1, 1,
0.007817331, -0.04755238, 1.03539, 0, 0, 0, 1, 1,
0.01270961, 0.234834, -2.866402, 0, 0, 0, 1, 1,
0.01744986, -0.758005, 2.899687, 0, 0, 0, 1, 1,
0.01749922, 1.056478, -1.049943, 0, 0, 0, 1, 1,
0.02038303, -0.8811175, 4.551052, 1, 1, 1, 1, 1,
0.02323732, 0.3432037, -0.3287347, 1, 1, 1, 1, 1,
0.02431777, 1.700926, -1.526996, 1, 1, 1, 1, 1,
0.02504372, -0.1491423, 3.091695, 1, 1, 1, 1, 1,
0.03520267, 0.08552612, 2.177443, 1, 1, 1, 1, 1,
0.03662727, -0.1434324, 4.029335, 1, 1, 1, 1, 1,
0.0387133, -2.513369, 3.764751, 1, 1, 1, 1, 1,
0.03911931, -0.300057, 1.155094, 1, 1, 1, 1, 1,
0.03967547, -1.130361, 3.943233, 1, 1, 1, 1, 1,
0.04067312, 0.4118305, 2.04013, 1, 1, 1, 1, 1,
0.04160299, -1.377313, 4.911716, 1, 1, 1, 1, 1,
0.04966516, 1.606031, 0.2044219, 1, 1, 1, 1, 1,
0.05011361, 0.8561935, 0.4612993, 1, 1, 1, 1, 1,
0.05139362, -0.5176169, 2.842465, 1, 1, 1, 1, 1,
0.05285368, -0.2588539, 3.637715, 1, 1, 1, 1, 1,
0.05346511, 0.4693928, 0.04363881, 0, 0, 1, 1, 1,
0.06098558, -1.276579, 3.448891, 1, 0, 0, 1, 1,
0.06487878, 0.6909679, -0.67025, 1, 0, 0, 1, 1,
0.07193274, -1.117306, 3.011332, 1, 0, 0, 1, 1,
0.07262584, 1.730528, 0.477731, 1, 0, 0, 1, 1,
0.07289217, 0.5995208, 0.1624568, 1, 0, 0, 1, 1,
0.07467908, -0.2598921, 1.991492, 0, 0, 0, 1, 1,
0.08184104, 0.5682366, -0.08023601, 0, 0, 0, 1, 1,
0.08304705, 0.01393724, 0.8603204, 0, 0, 0, 1, 1,
0.0893562, -1.499264, 3.650138, 0, 0, 0, 1, 1,
0.08991673, 0.03952629, 2.523084, 0, 0, 0, 1, 1,
0.09512212, -0.5901843, 1.897587, 0, 0, 0, 1, 1,
0.1027896, -1.25205, 3.067288, 0, 0, 0, 1, 1,
0.107228, 0.7852544, 2.320782, 1, 1, 1, 1, 1,
0.108503, -0.4424199, 2.380483, 1, 1, 1, 1, 1,
0.1104793, -0.02841181, 1.944153, 1, 1, 1, 1, 1,
0.1131722, -0.4102485, 1.701144, 1, 1, 1, 1, 1,
0.1200884, -2.221833, 2.674966, 1, 1, 1, 1, 1,
0.1237374, -2.229179, 2.411013, 1, 1, 1, 1, 1,
0.126797, -0.4174065, 2.535582, 1, 1, 1, 1, 1,
0.1272346, 0.7474178, -0.3535826, 1, 1, 1, 1, 1,
0.1342738, -0.3657626, 3.499054, 1, 1, 1, 1, 1,
0.1352138, 1.403172, 0.5987974, 1, 1, 1, 1, 1,
0.1395847, -1.764577, 3.449557, 1, 1, 1, 1, 1,
0.1454156, -0.8262002, 1.527287, 1, 1, 1, 1, 1,
0.1459194, 0.2695254, 0.5830534, 1, 1, 1, 1, 1,
0.1498134, 0.8787495, -0.272328, 1, 1, 1, 1, 1,
0.1620044, 0.4185756, 0.6802148, 1, 1, 1, 1, 1,
0.1627081, 0.2571048, 1.178574, 0, 0, 1, 1, 1,
0.1631978, 0.5088553, 0.9681347, 1, 0, 0, 1, 1,
0.1634545, -0.9416547, -0.01887355, 1, 0, 0, 1, 1,
0.1643863, 0.9736609, -0.6219608, 1, 0, 0, 1, 1,
0.1653508, 0.7040381, -0.5100645, 1, 0, 0, 1, 1,
0.1662623, -0.575242, 2.786179, 1, 0, 0, 1, 1,
0.1677947, -0.1532314, 2.363748, 0, 0, 0, 1, 1,
0.1686135, -0.01966048, 1.957369, 0, 0, 0, 1, 1,
0.1695704, -0.6093168, 3.745766, 0, 0, 0, 1, 1,
0.1703471, 0.7564914, 1.602072, 0, 0, 0, 1, 1,
0.1730886, -0.2146904, 1.88126, 0, 0, 0, 1, 1,
0.1744029, -0.6652419, 0.5960096, 0, 0, 0, 1, 1,
0.1778629, 0.4631918, 0.7431187, 0, 0, 0, 1, 1,
0.1811042, -2.709899, 2.989707, 1, 1, 1, 1, 1,
0.1824956, -1.385134, 3.057573, 1, 1, 1, 1, 1,
0.1826475, 0.061371, 1.939116, 1, 1, 1, 1, 1,
0.1864939, -1.313379, 3.293874, 1, 1, 1, 1, 1,
0.1876069, -1.063639, 0.9804512, 1, 1, 1, 1, 1,
0.1887351, -0.5313087, 1.092697, 1, 1, 1, 1, 1,
0.1965376, 0.0174997, 0.6572293, 1, 1, 1, 1, 1,
0.1999095, -0.5517691, 3.737837, 1, 1, 1, 1, 1,
0.2060656, 0.2942448, -0.5253066, 1, 1, 1, 1, 1,
0.2080019, -1.459329, 3.091322, 1, 1, 1, 1, 1,
0.2100563, -1.137296, 2.828312, 1, 1, 1, 1, 1,
0.2116421, -0.1701755, 2.396112, 1, 1, 1, 1, 1,
0.2122305, 1.04198, 0.6128136, 1, 1, 1, 1, 1,
0.2218366, -0.1871156, 1.363624, 1, 1, 1, 1, 1,
0.2286625, 0.3734142, 2.128386, 1, 1, 1, 1, 1,
0.2301228, 0.498089, 2.052828, 0, 0, 1, 1, 1,
0.2308745, -0.6360347, 2.705659, 1, 0, 0, 1, 1,
0.2327856, -0.3084837, 1.229381, 1, 0, 0, 1, 1,
0.2386234, 1.752649, 1.353543, 1, 0, 0, 1, 1,
0.2438693, 1.542278, 1.241007, 1, 0, 0, 1, 1,
0.2453976, -0.2990074, 2.583941, 1, 0, 0, 1, 1,
0.2462311, -0.3483401, 2.347488, 0, 0, 0, 1, 1,
0.2487487, 0.2684918, 0.8345011, 0, 0, 0, 1, 1,
0.2509722, -0.1093008, 2.360301, 0, 0, 0, 1, 1,
0.2512104, 0.7625908, 1.37624, 0, 0, 0, 1, 1,
0.2558013, 1.075264, -3.312978, 0, 0, 0, 1, 1,
0.256113, -1.255209, 1.784284, 0, 0, 0, 1, 1,
0.2572299, -1.07205, 3.363601, 0, 0, 0, 1, 1,
0.2606151, 1.002545, 0.5546661, 1, 1, 1, 1, 1,
0.2606791, 0.8110145, -0.4578747, 1, 1, 1, 1, 1,
0.2620194, 0.9091411, 0.7501183, 1, 1, 1, 1, 1,
0.2623436, -0.9573186, 2.821293, 1, 1, 1, 1, 1,
0.2631992, 1.625932, -1.42697, 1, 1, 1, 1, 1,
0.2638629, -0.1569223, 3.032194, 1, 1, 1, 1, 1,
0.2645326, -1.064161, 2.414313, 1, 1, 1, 1, 1,
0.269083, 1.715748, -0.3486478, 1, 1, 1, 1, 1,
0.2694496, 1.061201, 0.5536063, 1, 1, 1, 1, 1,
0.2696992, -1.271299, 1.109558, 1, 1, 1, 1, 1,
0.2717364, 0.4799044, -0.06361408, 1, 1, 1, 1, 1,
0.273622, 0.4284597, 2.435969, 1, 1, 1, 1, 1,
0.2780379, -1.039843, 3.878556, 1, 1, 1, 1, 1,
0.2809647, -1.359449, 3.977561, 1, 1, 1, 1, 1,
0.2875135, 0.2239603, 0.8904521, 1, 1, 1, 1, 1,
0.2897282, -0.8835737, 4.176057, 0, 0, 1, 1, 1,
0.292294, -0.6898642, 0.1809011, 1, 0, 0, 1, 1,
0.3009266, -0.2777018, 3.209624, 1, 0, 0, 1, 1,
0.3044435, 0.5706889, 0.7026895, 1, 0, 0, 1, 1,
0.3073432, 1.18538, -1.500015, 1, 0, 0, 1, 1,
0.3136987, 0.7892941, 1.804908, 1, 0, 0, 1, 1,
0.3191799, 0.5146689, -0.4393444, 0, 0, 0, 1, 1,
0.3238132, -0.4424147, 2.303586, 0, 0, 0, 1, 1,
0.3279538, 0.431472, 0.763563, 0, 0, 0, 1, 1,
0.331647, -0.01067165, 1.698307, 0, 0, 0, 1, 1,
0.3355776, 0.3474246, 0.02342155, 0, 0, 0, 1, 1,
0.3374442, -0.4895909, 2.897545, 0, 0, 0, 1, 1,
0.3398918, 0.3825682, 0.7337241, 0, 0, 0, 1, 1,
0.3423451, 0.06293432, 1.937456, 1, 1, 1, 1, 1,
0.3426279, -0.8159086, 1.842297, 1, 1, 1, 1, 1,
0.3436307, 0.0149715, 1.892169, 1, 1, 1, 1, 1,
0.3455288, 0.02986438, 1.446206, 1, 1, 1, 1, 1,
0.3503304, -1.536721, 3.530099, 1, 1, 1, 1, 1,
0.3551898, -0.9418752, 2.9879, 1, 1, 1, 1, 1,
0.3582371, -1.031671, 3.895576, 1, 1, 1, 1, 1,
0.3603901, 2.035201, 0.9504332, 1, 1, 1, 1, 1,
0.3610989, -1.399545, 1.620646, 1, 1, 1, 1, 1,
0.3633457, 0.9710852, 1.872236, 1, 1, 1, 1, 1,
0.3665951, -0.3182242, 2.336727, 1, 1, 1, 1, 1,
0.3714086, -1.13128, 1.779739, 1, 1, 1, 1, 1,
0.3717653, -0.892131, 2.332439, 1, 1, 1, 1, 1,
0.3727132, -0.7978911, 4.10708, 1, 1, 1, 1, 1,
0.3756301, -0.6918126, 3.679718, 1, 1, 1, 1, 1,
0.3757842, 0.02900936, 1.626357, 0, 0, 1, 1, 1,
0.3813141, -0.09970104, 0.9941928, 1, 0, 0, 1, 1,
0.3861256, -1.762596, 2.013288, 1, 0, 0, 1, 1,
0.3892447, -0.06425304, 2.077598, 1, 0, 0, 1, 1,
0.3905485, -0.648652, 2.278364, 1, 0, 0, 1, 1,
0.3943198, 0.970103, 0.3951952, 1, 0, 0, 1, 1,
0.3961016, 1.218038, -0.1257286, 0, 0, 0, 1, 1,
0.396868, 0.621699, -0.1419467, 0, 0, 0, 1, 1,
0.4014075, -0.1028721, 2.339171, 0, 0, 0, 1, 1,
0.4017382, 0.1380866, 1.767801, 0, 0, 0, 1, 1,
0.4025744, 0.9523125, 0.935043, 0, 0, 0, 1, 1,
0.4078142, -0.1430144, 0.1185075, 0, 0, 0, 1, 1,
0.4129476, -1.492611, 2.093523, 0, 0, 0, 1, 1,
0.4143428, 0.2601364, 0.5029375, 1, 1, 1, 1, 1,
0.4190124, -0.5992898, 2.491158, 1, 1, 1, 1, 1,
0.4215277, 1.067842, 1.489168, 1, 1, 1, 1, 1,
0.4263026, 1.016901, 0.9946333, 1, 1, 1, 1, 1,
0.4324809, -2.183638, 2.078459, 1, 1, 1, 1, 1,
0.432873, -0.5253415, 0.5357103, 1, 1, 1, 1, 1,
0.433122, -1.496618, 3.327448, 1, 1, 1, 1, 1,
0.4344487, -0.284696, 0.9590989, 1, 1, 1, 1, 1,
0.4347371, 1.088046, -0.6561446, 1, 1, 1, 1, 1,
0.4357949, -0.5371909, 2.692448, 1, 1, 1, 1, 1,
0.4374687, -0.2118857, 1.083395, 1, 1, 1, 1, 1,
0.4376602, 0.661698, 0.9258491, 1, 1, 1, 1, 1,
0.441055, 0.5167915, 0.5745172, 1, 1, 1, 1, 1,
0.4424303, -0.3645143, 1.816337, 1, 1, 1, 1, 1,
0.4484013, 0.763387, 1.137574, 1, 1, 1, 1, 1,
0.4505855, 0.3880615, 1.260448, 0, 0, 1, 1, 1,
0.453862, 0.5544201, -0.1265673, 1, 0, 0, 1, 1,
0.45407, -0.77026, 1.347583, 1, 0, 0, 1, 1,
0.4555178, -1.083504, 2.881415, 1, 0, 0, 1, 1,
0.4579925, -0.5055541, 2.245884, 1, 0, 0, 1, 1,
0.4618505, 0.1782942, 1.105288, 1, 0, 0, 1, 1,
0.4622093, -0.2998204, 2.930358, 0, 0, 0, 1, 1,
0.4655654, -0.0334205, 0.9972135, 0, 0, 0, 1, 1,
0.468113, 0.1713746, 2.115416, 0, 0, 0, 1, 1,
0.4696495, -1.632337, 3.206208, 0, 0, 0, 1, 1,
0.4712327, 1.342484, 0.1915406, 0, 0, 0, 1, 1,
0.471344, -0.7617797, 3.854977, 0, 0, 0, 1, 1,
0.4714978, -0.907194, 2.292355, 0, 0, 0, 1, 1,
0.4763803, -1.571345, 3.256062, 1, 1, 1, 1, 1,
0.4773574, 0.5084158, 1.321478, 1, 1, 1, 1, 1,
0.478428, 0.9201208, -0.2712791, 1, 1, 1, 1, 1,
0.4819755, 0.8110078, 0.7821602, 1, 1, 1, 1, 1,
0.4900345, -0.1389925, 1.57891, 1, 1, 1, 1, 1,
0.4928472, 0.2905596, 2.047823, 1, 1, 1, 1, 1,
0.495569, -0.5558661, 0.6712163, 1, 1, 1, 1, 1,
0.5013264, -0.3781929, 3.275686, 1, 1, 1, 1, 1,
0.5017253, -0.6671856, 1.770332, 1, 1, 1, 1, 1,
0.5069408, 1.371766, -0.06929877, 1, 1, 1, 1, 1,
0.5074069, -0.75852, 2.100513, 1, 1, 1, 1, 1,
0.5100292, 0.02639569, 0.9330724, 1, 1, 1, 1, 1,
0.5216705, 0.9618366, -0.3085858, 1, 1, 1, 1, 1,
0.5273377, 1.377383, -1.077467, 1, 1, 1, 1, 1,
0.541178, -1.401971, 5.091606, 1, 1, 1, 1, 1,
0.54567, 1.912907, 0.9696884, 0, 0, 1, 1, 1,
0.5482584, -1.112914, 2.265035, 1, 0, 0, 1, 1,
0.5503868, 0.007901987, 1.235736, 1, 0, 0, 1, 1,
0.5513474, 0.720232, -0.15862, 1, 0, 0, 1, 1,
0.5536248, -0.1100452, 0.8581849, 1, 0, 0, 1, 1,
0.5552055, 1.505069, 1.194749, 1, 0, 0, 1, 1,
0.5553079, -0.8955299, 4.648997, 0, 0, 0, 1, 1,
0.5580912, 1.900418, 0.8156629, 0, 0, 0, 1, 1,
0.5609608, -0.4452801, 0.4724567, 0, 0, 0, 1, 1,
0.5661455, -1.389601, 2.748416, 0, 0, 0, 1, 1,
0.5672674, 1.196325, 0.8079015, 0, 0, 0, 1, 1,
0.5726892, -0.04631538, 0.646132, 0, 0, 0, 1, 1,
0.5727712, -0.3345191, 2.537092, 0, 0, 0, 1, 1,
0.5741053, 0.5483267, 0.04394889, 1, 1, 1, 1, 1,
0.5775724, 0.663497, 0.3301764, 1, 1, 1, 1, 1,
0.5818647, 0.5647055, 0.1839979, 1, 1, 1, 1, 1,
0.587638, -1.922437, 4.416304, 1, 1, 1, 1, 1,
0.5876489, -2.86924, 3.531568, 1, 1, 1, 1, 1,
0.5920497, 0.3449017, 2.245959, 1, 1, 1, 1, 1,
0.5979932, 0.8978706, -0.4424718, 1, 1, 1, 1, 1,
0.5986176, -0.07585905, 1.426701, 1, 1, 1, 1, 1,
0.6014145, 0.6833708, 3.549173, 1, 1, 1, 1, 1,
0.606674, 0.6705325, 1.876387, 1, 1, 1, 1, 1,
0.6111219, -0.3543354, 2.517389, 1, 1, 1, 1, 1,
0.6169646, 1.410171, 1.616994, 1, 1, 1, 1, 1,
0.6229044, 1.565448, 0.160484, 1, 1, 1, 1, 1,
0.6247701, 0.8856666, 0.2380648, 1, 1, 1, 1, 1,
0.6258256, 0.01505353, 2.047584, 1, 1, 1, 1, 1,
0.6266286, 0.1040348, 0.0005157302, 0, 0, 1, 1, 1,
0.6305833, 1.418357, 0.9350788, 1, 0, 0, 1, 1,
0.6313769, 1.060419, -0.0843469, 1, 0, 0, 1, 1,
0.6316377, -0.6068075, 2.028949, 1, 0, 0, 1, 1,
0.6348662, -0.07220528, 0.1719534, 1, 0, 0, 1, 1,
0.6369339, -1.448641, 1.437485, 1, 0, 0, 1, 1,
0.6388627, -0.1437988, 0.8884839, 0, 0, 0, 1, 1,
0.6462207, -1.664936, 3.651875, 0, 0, 0, 1, 1,
0.649861, -0.5517867, 2.024567, 0, 0, 0, 1, 1,
0.6528125, -0.541252, 1.598014, 0, 0, 0, 1, 1,
0.6533787, 0.1371375, 1.149131, 0, 0, 0, 1, 1,
0.6552521, -1.412837, 2.088594, 0, 0, 0, 1, 1,
0.6621688, 2.198988, 0.07952864, 0, 0, 0, 1, 1,
0.6640267, 0.1008663, 1.959993, 1, 1, 1, 1, 1,
0.6666453, 0.1190101, 0.652967, 1, 1, 1, 1, 1,
0.6676692, -0.9924418, 1.755373, 1, 1, 1, 1, 1,
0.6804367, -0.376594, 1.82452, 1, 1, 1, 1, 1,
0.6805038, -0.1695428, 2.269725, 1, 1, 1, 1, 1,
0.6832172, 1.605154, 0.6335524, 1, 1, 1, 1, 1,
0.6850353, 0.08429151, 1.261211, 1, 1, 1, 1, 1,
0.6872858, 0.1572746, 3.340796, 1, 1, 1, 1, 1,
0.6891814, 0.02890483, 1.465241, 1, 1, 1, 1, 1,
0.6895147, 1.952881, 0.5449057, 1, 1, 1, 1, 1,
0.6931764, 1.668129, 0.463908, 1, 1, 1, 1, 1,
0.6984243, -0.4971255, 1.570932, 1, 1, 1, 1, 1,
0.702312, -1.818175, 3.463846, 1, 1, 1, 1, 1,
0.7026254, 0.1919764, -2.047287, 1, 1, 1, 1, 1,
0.7080302, 1.224067, -0.7057441, 1, 1, 1, 1, 1,
0.7109336, -0.1190194, 1.623911, 0, 0, 1, 1, 1,
0.7115299, 0.3606396, 2.131363, 1, 0, 0, 1, 1,
0.7176079, 2.374704, 1.020423, 1, 0, 0, 1, 1,
0.7213203, 0.7192251, 1.473871, 1, 0, 0, 1, 1,
0.7224891, 0.9975264, -0.5476705, 1, 0, 0, 1, 1,
0.7371575, -0.1481748, 0.6450177, 1, 0, 0, 1, 1,
0.7402612, 0.5065233, 1.22788, 0, 0, 0, 1, 1,
0.7427866, 0.3593616, 1.690309, 0, 0, 0, 1, 1,
0.7435616, 0.1425166, 2.052758, 0, 0, 0, 1, 1,
0.7528133, -1.079969, 1.015879, 0, 0, 0, 1, 1,
0.7568844, 0.5194006, 1.356511, 0, 0, 0, 1, 1,
0.761017, 1.824915, -0.1761001, 0, 0, 0, 1, 1,
0.7618315, 0.1621543, 2.331505, 0, 0, 0, 1, 1,
0.7620023, -1.475921, 2.855399, 1, 1, 1, 1, 1,
0.7671593, -1.004837, 1.08831, 1, 1, 1, 1, 1,
0.7740983, -0.5710987, 2.359137, 1, 1, 1, 1, 1,
0.7756292, 0.06032388, 1.083795, 1, 1, 1, 1, 1,
0.7766908, -1.134431, 1.205835, 1, 1, 1, 1, 1,
0.7774653, -0.006499881, 1.122396, 1, 1, 1, 1, 1,
0.7811916, 0.5304291, 2.768413, 1, 1, 1, 1, 1,
0.786806, -1.604921, 3.239944, 1, 1, 1, 1, 1,
0.7883403, 2.046114, 0.6132256, 1, 1, 1, 1, 1,
0.7936019, -1.447038, 2.719413, 1, 1, 1, 1, 1,
0.7957112, -0.261695, -0.1629562, 1, 1, 1, 1, 1,
0.7971778, 0.6969056, 1.309176, 1, 1, 1, 1, 1,
0.8038666, 0.287895, 2.682851, 1, 1, 1, 1, 1,
0.8060704, 0.08934209, 1.138378, 1, 1, 1, 1, 1,
0.8083375, -0.1688867, 3.222048, 1, 1, 1, 1, 1,
0.811837, 0.06980651, 1.949701, 0, 0, 1, 1, 1,
0.8211257, -0.2018005, 1.980428, 1, 0, 0, 1, 1,
0.8245983, -1.630306, 2.55561, 1, 0, 0, 1, 1,
0.829814, 0.7104269, 1.267665, 1, 0, 0, 1, 1,
0.832195, 0.7813944, 1.365439, 1, 0, 0, 1, 1,
0.83496, 0.4026701, -0.07729216, 1, 0, 0, 1, 1,
0.8362697, 2.41491, -0.835843, 0, 0, 0, 1, 1,
0.8387499, -0.01743204, 1.902818, 0, 0, 0, 1, 1,
0.8469186, 1.125813, 0.6776855, 0, 0, 0, 1, 1,
0.8476303, -0.146791, 1.908807, 0, 0, 0, 1, 1,
0.8487303, -0.1942165, 1.36134, 0, 0, 0, 1, 1,
0.8525915, 0.1372624, 1.749373, 0, 0, 0, 1, 1,
0.8533655, -0.02621821, 2.465918, 0, 0, 0, 1, 1,
0.862413, 0.5363504, 1.770107, 1, 1, 1, 1, 1,
0.8635017, -0.8952143, 1.736567, 1, 1, 1, 1, 1,
0.8688457, -0.6792793, 3.045779, 1, 1, 1, 1, 1,
0.8709264, -0.2162583, 2.56962, 1, 1, 1, 1, 1,
0.8796945, -0.1913084, 0.2349676, 1, 1, 1, 1, 1,
0.8824608, 0.5882034, 2.447956, 1, 1, 1, 1, 1,
0.8846046, -1.372626, 2.648422, 1, 1, 1, 1, 1,
0.8876718, -0.7543859, 2.139234, 1, 1, 1, 1, 1,
0.8902758, -0.1875737, 2.79205, 1, 1, 1, 1, 1,
0.8904704, 0.8639708, 1.835755, 1, 1, 1, 1, 1,
0.8993533, 0.4720467, 0.4105296, 1, 1, 1, 1, 1,
0.9024253, -0.9131615, 2.786743, 1, 1, 1, 1, 1,
0.914629, 0.9472359, 1.577371, 1, 1, 1, 1, 1,
0.9175898, -1.946441, 2.168409, 1, 1, 1, 1, 1,
0.9179775, 0.2716402, 0.4779442, 1, 1, 1, 1, 1,
0.9197752, -1.076632, 4.478883, 0, 0, 1, 1, 1,
0.923895, -3.465683, 2.89098, 1, 0, 0, 1, 1,
0.9264843, 0.6213294, 0.7417979, 1, 0, 0, 1, 1,
0.9282394, 0.3661162, 1.154287, 1, 0, 0, 1, 1,
0.9316677, -1.025073, 3.374903, 1, 0, 0, 1, 1,
0.939097, -0.2301519, 1.879352, 1, 0, 0, 1, 1,
0.9475679, -1.047289, 1.319295, 0, 0, 0, 1, 1,
0.9485819, 0.1851185, 0.7854665, 0, 0, 0, 1, 1,
0.9485929, -1.538823, 2.264632, 0, 0, 0, 1, 1,
0.9496732, -0.2988688, 1.068337, 0, 0, 0, 1, 1,
0.9542249, -0.2210565, 2.420536, 0, 0, 0, 1, 1,
0.9608638, -0.09424889, 2.561127, 0, 0, 0, 1, 1,
0.962281, 0.0847576, 2.990443, 0, 0, 0, 1, 1,
0.962378, 1.304235, 2.130435, 1, 1, 1, 1, 1,
0.9636397, 0.5437667, 0.5614942, 1, 1, 1, 1, 1,
0.9659208, 1.137565, 0.07185852, 1, 1, 1, 1, 1,
0.9669844, 0.8034943, 1.067806, 1, 1, 1, 1, 1,
0.9745363, 0.4036266, 0.9383602, 1, 1, 1, 1, 1,
0.9797058, -0.3228861, 2.013282, 1, 1, 1, 1, 1,
0.9843948, -1.501118, 1.702921, 1, 1, 1, 1, 1,
0.9846281, -1.139248, 3.194434, 1, 1, 1, 1, 1,
0.9892017, 0.391292, 0.1254169, 1, 1, 1, 1, 1,
0.9894714, 1.268493, 1.641333, 1, 1, 1, 1, 1,
0.9902914, 1.012292, 1.070738, 1, 1, 1, 1, 1,
0.9917818, -0.9553181, 1.218347, 1, 1, 1, 1, 1,
0.9957958, -1.437267, 3.107229, 1, 1, 1, 1, 1,
0.997008, 0.5329834, 1.409638, 1, 1, 1, 1, 1,
0.9970582, -0.5757802, 3.451749, 1, 1, 1, 1, 1,
0.9984551, -0.5787221, 3.302283, 0, 0, 1, 1, 1,
1.00164, 1.537197, -0.3546685, 1, 0, 0, 1, 1,
1.004111, 0.683453, 0.9032807, 1, 0, 0, 1, 1,
1.010745, 0.05242949, 1.326628, 1, 0, 0, 1, 1,
1.011542, 0.7243459, 0.6100996, 1, 0, 0, 1, 1,
1.011853, -1.965299, 2.79865, 1, 0, 0, 1, 1,
1.019189, -0.03026642, 2.511977, 0, 0, 0, 1, 1,
1.024872, -1.721286, 3.347754, 0, 0, 0, 1, 1,
1.027362, 1.083472, 0.05709027, 0, 0, 0, 1, 1,
1.032735, 0.7426864, 1.351722, 0, 0, 0, 1, 1,
1.04467, 0.4987838, 0.8769293, 0, 0, 0, 1, 1,
1.047989, 0.5163288, 0.1434043, 0, 0, 0, 1, 1,
1.048128, -0.1766903, 3.324722, 0, 0, 0, 1, 1,
1.051964, 0.823725, 1.287449, 1, 1, 1, 1, 1,
1.052292, 0.04323149, 0.7416865, 1, 1, 1, 1, 1,
1.052656, -1.048443, 2.313993, 1, 1, 1, 1, 1,
1.057655, 0.6466874, -0.8754539, 1, 1, 1, 1, 1,
1.06154, 0.2086175, 0.3473565, 1, 1, 1, 1, 1,
1.06618, -0.5259123, 1.384988, 1, 1, 1, 1, 1,
1.067843, 0.1987155, 0.01611405, 1, 1, 1, 1, 1,
1.072137, -0.3622592, 2.924614, 1, 1, 1, 1, 1,
1.075692, -0.9605442, 3.103907, 1, 1, 1, 1, 1,
1.080773, 0.07503805, 0.8249578, 1, 1, 1, 1, 1,
1.080909, -0.1390003, -0.9346122, 1, 1, 1, 1, 1,
1.087106, -0.229758, 1.089324, 1, 1, 1, 1, 1,
1.099284, 0.4091935, 1.051033, 1, 1, 1, 1, 1,
1.099835, -0.8252854, 4.276102, 1, 1, 1, 1, 1,
1.100475, 1.265977, -1.029162, 1, 1, 1, 1, 1,
1.102741, 0.5210415, 0.4619522, 0, 0, 1, 1, 1,
1.123375, 0.7901868, 3.440567, 1, 0, 0, 1, 1,
1.127788, 0.2150385, 0.8147677, 1, 0, 0, 1, 1,
1.128647, -0.7573907, 1.047949, 1, 0, 0, 1, 1,
1.130793, 1.199381, -1.254761, 1, 0, 0, 1, 1,
1.13826, 2.454535, 0.5593735, 1, 0, 0, 1, 1,
1.138352, 1.563897, 0.5759248, 0, 0, 0, 1, 1,
1.139393, 0.6673579, 0.4421248, 0, 0, 0, 1, 1,
1.14917, 0.6319709, 2.755645, 0, 0, 0, 1, 1,
1.149656, 0.03326843, 2.48219, 0, 0, 0, 1, 1,
1.15331, 0.1946544, 2.302427, 0, 0, 0, 1, 1,
1.162091, 1.479437, -0.05613358, 0, 0, 0, 1, 1,
1.172202, -2.02319, 3.223349, 0, 0, 0, 1, 1,
1.174397, -0.3848577, 2.045242, 1, 1, 1, 1, 1,
1.186763, -1.276309, 2.683517, 1, 1, 1, 1, 1,
1.18864, 0.2728211, 1.937913, 1, 1, 1, 1, 1,
1.196968, 0.111112, 2.380868, 1, 1, 1, 1, 1,
1.208086, 1.570002, 1.594047, 1, 1, 1, 1, 1,
1.215525, 0.2994386, 1.568859, 1, 1, 1, 1, 1,
1.226803, 0.6727929, 0.8392128, 1, 1, 1, 1, 1,
1.228083, -0.06456899, 4.067155, 1, 1, 1, 1, 1,
1.233689, 2.819411, -0.2073063, 1, 1, 1, 1, 1,
1.243092, 1.318084, 0.5657172, 1, 1, 1, 1, 1,
1.243798, -0.4038011, 3.387214, 1, 1, 1, 1, 1,
1.24894, 0.9306605, 0.04181751, 1, 1, 1, 1, 1,
1.252781, 1.555008, -0.3960234, 1, 1, 1, 1, 1,
1.25307, 0.5880108, -0.5088326, 1, 1, 1, 1, 1,
1.258478, 0.02723437, 1.266219, 1, 1, 1, 1, 1,
1.265746, 1.286391, -0.6233673, 0, 0, 1, 1, 1,
1.266975, -1.950938, 2.725736, 1, 0, 0, 1, 1,
1.283971, -1.218936, 2.494352, 1, 0, 0, 1, 1,
1.289742, -0.7219362, 3.944829, 1, 0, 0, 1, 1,
1.290025, -0.02368108, 0.7166569, 1, 0, 0, 1, 1,
1.290594, 1.040941, 0.8273128, 1, 0, 0, 1, 1,
1.291083, -0.8239384, 3.076671, 0, 0, 0, 1, 1,
1.30817, 0.2038259, 1.029566, 0, 0, 0, 1, 1,
1.312851, 2.12566, 0.9382088, 0, 0, 0, 1, 1,
1.317078, -0.1119696, 0.9487727, 0, 0, 0, 1, 1,
1.317372, -0.424979, 1.94582, 0, 0, 0, 1, 1,
1.317855, 1.292252, 2.087116, 0, 0, 0, 1, 1,
1.321541, -0.0962225, 0.3563946, 0, 0, 0, 1, 1,
1.339209, -0.5145285, 2.49368, 1, 1, 1, 1, 1,
1.354506, 0.0008364279, 0.6443692, 1, 1, 1, 1, 1,
1.35541, 0.9457666, 1.154276, 1, 1, 1, 1, 1,
1.356349, 2.221375, -0.04675955, 1, 1, 1, 1, 1,
1.367937, -0.3478042, -0.351532, 1, 1, 1, 1, 1,
1.371876, -0.5179447, 1.7109, 1, 1, 1, 1, 1,
1.374055, 1.060125, -1.115404, 1, 1, 1, 1, 1,
1.375201, -0.03859372, -0.1715977, 1, 1, 1, 1, 1,
1.378888, -0.04478073, 0.694434, 1, 1, 1, 1, 1,
1.385518, 0.09295233, 2.33566, 1, 1, 1, 1, 1,
1.390546, -0.9228219, 2.133344, 1, 1, 1, 1, 1,
1.40606, 1.372361, 1.23639, 1, 1, 1, 1, 1,
1.409742, -1.708616, -0.2751189, 1, 1, 1, 1, 1,
1.410671, -0.9527913, 2.851469, 1, 1, 1, 1, 1,
1.440102, 0.02020216, 2.792545, 1, 1, 1, 1, 1,
1.445502, 0.6252618, 0.1943249, 0, 0, 1, 1, 1,
1.455799, 3.606471, -0.2294511, 1, 0, 0, 1, 1,
1.472326, 0.4027409, 1.21361, 1, 0, 0, 1, 1,
1.485393, 0.706686, 0.5291267, 1, 0, 0, 1, 1,
1.486319, 0.6878451, -0.5940597, 1, 0, 0, 1, 1,
1.486478, -0.280177, 4.341207, 1, 0, 0, 1, 1,
1.497768, 2.019368, 1.781152, 0, 0, 0, 1, 1,
1.499294, 1.064296, 0.1246093, 0, 0, 0, 1, 1,
1.500206, 2.095125, -0.247905, 0, 0, 0, 1, 1,
1.512892, 0.2215202, 3.186705, 0, 0, 0, 1, 1,
1.514056, -0.08123204, 0.9637012, 0, 0, 0, 1, 1,
1.514468, 0.8838719, 0.2299915, 0, 0, 0, 1, 1,
1.540454, 0.7704358, 0.9562778, 0, 0, 0, 1, 1,
1.562538, 0.1541625, 0.09107146, 1, 1, 1, 1, 1,
1.564099, 1.536727, -0.1743968, 1, 1, 1, 1, 1,
1.568099, -1.021243, 1.662651, 1, 1, 1, 1, 1,
1.568317, 1.025545, 1.637467, 1, 1, 1, 1, 1,
1.573156, -0.66719, 1.542168, 1, 1, 1, 1, 1,
1.579617, -0.6389975, 1.310664, 1, 1, 1, 1, 1,
1.58192, 1.005034, 0.3687145, 1, 1, 1, 1, 1,
1.590794, 0.604409, 1.043779, 1, 1, 1, 1, 1,
1.597057, -1.799046, 2.255864, 1, 1, 1, 1, 1,
1.599267, 1.010486, 1.438003, 1, 1, 1, 1, 1,
1.601182, -0.3840066, 1.199778, 1, 1, 1, 1, 1,
1.609131, 0.7168344, -0.2630797, 1, 1, 1, 1, 1,
1.613177, -1.735745, 1.637503, 1, 1, 1, 1, 1,
1.616924, -0.1970183, 3.736154, 1, 1, 1, 1, 1,
1.623574, 1.158652, -0.0272136, 1, 1, 1, 1, 1,
1.635907, 1.153977, 1.618179, 0, 0, 1, 1, 1,
1.645664, 0.5365399, 2.691917, 1, 0, 0, 1, 1,
1.647052, 0.57493, 1.157846, 1, 0, 0, 1, 1,
1.652681, 0.7475595, 1.668545, 1, 0, 0, 1, 1,
1.659773, 0.09739833, 2.349431, 1, 0, 0, 1, 1,
1.678465, 1.005857, 0.6810263, 1, 0, 0, 1, 1,
1.679568, -0.882079, 1.856952, 0, 0, 0, 1, 1,
1.680358, -1.167665, 1.136432, 0, 0, 0, 1, 1,
1.686332, 0.4592128, 1.87118, 0, 0, 0, 1, 1,
1.69175, 0.731719, 2.276147, 0, 0, 0, 1, 1,
1.69613, 0.458777, 2.264545, 0, 0, 0, 1, 1,
1.697499, 0.4439344, 1.748675, 0, 0, 0, 1, 1,
1.698849, -1.25224, 3.757568, 0, 0, 0, 1, 1,
1.710786, -0.9040611, 0.6225201, 1, 1, 1, 1, 1,
1.712567, -0.819934, 2.263499, 1, 1, 1, 1, 1,
1.738772, 1.4384, 1.176493, 1, 1, 1, 1, 1,
1.747821, 0.1977894, 2.065527, 1, 1, 1, 1, 1,
1.74936, -1.991817, 2.214187, 1, 1, 1, 1, 1,
1.779843, 0.120811, 3.43413, 1, 1, 1, 1, 1,
1.782029, -1.552755, 1.612759, 1, 1, 1, 1, 1,
1.792099, -0.5928659, 0.6649595, 1, 1, 1, 1, 1,
1.794938, 0.2803219, 0.04161372, 1, 1, 1, 1, 1,
1.807831, -1.29621, 2.656582, 1, 1, 1, 1, 1,
1.813106, 1.450472, 0.2280449, 1, 1, 1, 1, 1,
1.814139, 1.157703, 0.5219892, 1, 1, 1, 1, 1,
1.814535, 0.1918745, 1.304471, 1, 1, 1, 1, 1,
1.820382, -1.763592, 1.18506, 1, 1, 1, 1, 1,
1.881439, 0.6079463, 1.693647, 1, 1, 1, 1, 1,
1.892815, 1.165571, 1.102447, 0, 0, 1, 1, 1,
1.914353, 2.335396, -1.025129, 1, 0, 0, 1, 1,
1.93356, -0.5452724, 2.517914, 1, 0, 0, 1, 1,
1.988866, -0.1564118, 1.970959, 1, 0, 0, 1, 1,
2.010782, 0.6544862, 1.257725, 1, 0, 0, 1, 1,
2.03777, 1.409236, 1.360236, 1, 0, 0, 1, 1,
2.06684, -0.3107224, 1.143217, 0, 0, 0, 1, 1,
2.087446, 0.8228964, -0.09852729, 0, 0, 0, 1, 1,
2.121699, 0.7185375, 1.980822, 0, 0, 0, 1, 1,
2.156772, 0.7980685, 2.847215, 0, 0, 0, 1, 1,
2.195979, 0.06629006, 0.8042683, 0, 0, 0, 1, 1,
2.216555, -0.1125275, 1.16918, 0, 0, 0, 1, 1,
2.268377, -0.1849639, 1.355651, 0, 0, 0, 1, 1,
2.285554, 0.7031091, 1.017912, 1, 1, 1, 1, 1,
2.292158, 0.9219343, -0.4322724, 1, 1, 1, 1, 1,
2.390766, -1.376572, 0.4139038, 1, 1, 1, 1, 1,
2.486093, 0.5160251, 2.026367, 1, 1, 1, 1, 1,
2.50688, -1.118188, 1.827548, 1, 1, 1, 1, 1,
2.65631, -1.732963, 4.069399, 1, 1, 1, 1, 1,
2.992463, 0.4302866, 0.4851188, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.714165;
var distance = 34.12059;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1085632, -0.0703938, 0.2796719 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12059);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
