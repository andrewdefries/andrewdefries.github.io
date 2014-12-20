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
-3.843475, 0.1432569, -1.030187, 1, 0, 0, 1,
-3.163254, 0.4116598, -2.21655, 1, 0.007843138, 0, 1,
-3.144431, -0.9108135, -0.7986988, 1, 0.01176471, 0, 1,
-2.908239, 0.4064501, -0.6729807, 1, 0.01960784, 0, 1,
-2.832576, -0.866931, -3.237637, 1, 0.02352941, 0, 1,
-2.830196, -2.754875, -3.128712, 1, 0.03137255, 0, 1,
-2.721404, 1.382058, -0.9338204, 1, 0.03529412, 0, 1,
-2.597182, 0.687886, 0.05998413, 1, 0.04313726, 0, 1,
-2.55755, -0.6024668, -0.7543645, 1, 0.04705882, 0, 1,
-2.460178, 0.3607218, -0.4716804, 1, 0.05490196, 0, 1,
-2.34667, -0.9763672, -0.8759843, 1, 0.05882353, 0, 1,
-2.336149, 0.7282783, -2.32676, 1, 0.06666667, 0, 1,
-2.203506, 1.518381, -1.763131, 1, 0.07058824, 0, 1,
-2.181276, -1.188932, -1.714541, 1, 0.07843138, 0, 1,
-2.159519, 2.451614, -1.906782, 1, 0.08235294, 0, 1,
-2.131207, 0.04519319, -1.65382, 1, 0.09019608, 0, 1,
-2.116422, 0.4371264, 0.4426254, 1, 0.09411765, 0, 1,
-2.061086, -0.8006887, -1.250386, 1, 0.1019608, 0, 1,
-2.04688, 0.9031894, 1.289784, 1, 0.1098039, 0, 1,
-2.009856, 0.259177, -1.4198, 1, 0.1137255, 0, 1,
-1.989718, -1.268402, -1.865192, 1, 0.1215686, 0, 1,
-1.96464, 0.04736758, -1.766537, 1, 0.1254902, 0, 1,
-1.93376, 0.5509403, -0.6454468, 1, 0.1333333, 0, 1,
-1.908163, -0.2696373, -2.305547, 1, 0.1372549, 0, 1,
-1.883635, 0.948471, -0.7128643, 1, 0.145098, 0, 1,
-1.863744, -0.6683048, -1.721988, 1, 0.1490196, 0, 1,
-1.863297, 1.651238, -0.7409977, 1, 0.1568628, 0, 1,
-1.846864, 0.1096688, 0.8703262, 1, 0.1607843, 0, 1,
-1.841952, 0.1036326, -2.020474, 1, 0.1686275, 0, 1,
-1.826786, 0.3438202, -1.814309, 1, 0.172549, 0, 1,
-1.825122, 0.6893929, -0.9733614, 1, 0.1803922, 0, 1,
-1.818953, 1.131648, -0.9831175, 1, 0.1843137, 0, 1,
-1.808747, -0.533339, -1.855795, 1, 0.1921569, 0, 1,
-1.795558, -0.5538593, -1.002155, 1, 0.1960784, 0, 1,
-1.794152, -1.401586, -2.199367, 1, 0.2039216, 0, 1,
-1.773643, 1.831624, 1.475662, 1, 0.2117647, 0, 1,
-1.769533, -0.05153326, -0.8735822, 1, 0.2156863, 0, 1,
-1.747821, 1.433738, -1.372882, 1, 0.2235294, 0, 1,
-1.728123, 1.610168, -1.803246, 1, 0.227451, 0, 1,
-1.72393, 0.1118905, -2.498958, 1, 0.2352941, 0, 1,
-1.714794, -0.4312438, -4.909188, 1, 0.2392157, 0, 1,
-1.7104, -0.7689009, -2.277784, 1, 0.2470588, 0, 1,
-1.695844, 0.2998392, -3.366645, 1, 0.2509804, 0, 1,
-1.693382, 2.469406, 0.2643074, 1, 0.2588235, 0, 1,
-1.688248, 1.057531, -0.8513914, 1, 0.2627451, 0, 1,
-1.684858, 2.071914, 1.707903, 1, 0.2705882, 0, 1,
-1.684584, -1.672131, -0.5554534, 1, 0.2745098, 0, 1,
-1.675082, 0.2725506, 0.05257009, 1, 0.282353, 0, 1,
-1.665787, 0.6307372, -1.847748, 1, 0.2862745, 0, 1,
-1.643975, -0.2968403, -3.766082, 1, 0.2941177, 0, 1,
-1.63113, 0.8960447, -1.511149, 1, 0.3019608, 0, 1,
-1.627485, -1.500271, -4.219082, 1, 0.3058824, 0, 1,
-1.621162, 1.012568, -1.152252, 1, 0.3137255, 0, 1,
-1.606778, -0.06001786, -1.155948, 1, 0.3176471, 0, 1,
-1.604732, 0.4536727, -3.013328, 1, 0.3254902, 0, 1,
-1.60417, 2.284868, -2.354032, 1, 0.3294118, 0, 1,
-1.59895, -0.1277073, -1.873582, 1, 0.3372549, 0, 1,
-1.595315, 1.208014, -2.312949, 1, 0.3411765, 0, 1,
-1.581821, -0.7594467, -2.639579, 1, 0.3490196, 0, 1,
-1.573748, 0.1962697, -1.490187, 1, 0.3529412, 0, 1,
-1.573467, 1.211134, -0.5117646, 1, 0.3607843, 0, 1,
-1.573447, -0.05321698, -2.1383, 1, 0.3647059, 0, 1,
-1.565115, 1.232338, -0.3443033, 1, 0.372549, 0, 1,
-1.560243, -0.04214436, 0.2138846, 1, 0.3764706, 0, 1,
-1.548318, -0.5439969, -4.213881, 1, 0.3843137, 0, 1,
-1.547825, 0.3431877, -1.915037, 1, 0.3882353, 0, 1,
-1.530693, 0.2471354, -1.158594, 1, 0.3960784, 0, 1,
-1.530116, 0.5964382, -2.646602, 1, 0.4039216, 0, 1,
-1.52521, 0.3282399, -3.536342, 1, 0.4078431, 0, 1,
-1.515898, 1.392265, -0.6093021, 1, 0.4156863, 0, 1,
-1.508759, 0.4854773, -2.091234, 1, 0.4196078, 0, 1,
-1.503619, 0.5753005, -0.6975639, 1, 0.427451, 0, 1,
-1.500689, 0.09977908, -0.5650897, 1, 0.4313726, 0, 1,
-1.482633, 1.695288, -0.250834, 1, 0.4392157, 0, 1,
-1.47279, 0.5181655, -1.441339, 1, 0.4431373, 0, 1,
-1.454598, -0.2444449, -1.986589, 1, 0.4509804, 0, 1,
-1.453837, 0.1715442, -1.870666, 1, 0.454902, 0, 1,
-1.445124, 2.361103, -0.6946296, 1, 0.4627451, 0, 1,
-1.444738, -0.9335172, -1.176581, 1, 0.4666667, 0, 1,
-1.433217, -1.051943, -2.967208, 1, 0.4745098, 0, 1,
-1.426368, -0.1962717, -0.7571204, 1, 0.4784314, 0, 1,
-1.417832, 0.2281195, -0.4127804, 1, 0.4862745, 0, 1,
-1.411496, -0.2164127, -0.2669149, 1, 0.4901961, 0, 1,
-1.404446, -0.3399855, 0.764066, 1, 0.4980392, 0, 1,
-1.40285, -0.7368132, -0.9507703, 1, 0.5058824, 0, 1,
-1.390624, -0.1320995, -0.4115097, 1, 0.509804, 0, 1,
-1.387026, 0.737298, -1.496039, 1, 0.5176471, 0, 1,
-1.377463, 0.8445245, -0.6603206, 1, 0.5215687, 0, 1,
-1.375713, 1.407236, -1.479805, 1, 0.5294118, 0, 1,
-1.371523, -0.01229623, -2.148352, 1, 0.5333334, 0, 1,
-1.366823, 0.6654535, -0.9820123, 1, 0.5411765, 0, 1,
-1.366067, -0.9038383, 0.1278945, 1, 0.5450981, 0, 1,
-1.359255, -0.0713048, -0.4365767, 1, 0.5529412, 0, 1,
-1.357375, -0.3057714, -1.664434, 1, 0.5568628, 0, 1,
-1.350848, -0.970442, -3.224566, 1, 0.5647059, 0, 1,
-1.342459, -1.122425, -1.400353, 1, 0.5686275, 0, 1,
-1.337078, -0.4178042, -0.5760939, 1, 0.5764706, 0, 1,
-1.335032, 1.26467, -3.11721, 1, 0.5803922, 0, 1,
-1.333272, -0.7213175, -1.909819, 1, 0.5882353, 0, 1,
-1.331729, 0.4143901, -1.395181, 1, 0.5921569, 0, 1,
-1.329897, 0.8464121, -0.1728947, 1, 0.6, 0, 1,
-1.325571, 1.273719, 0.2154497, 1, 0.6078432, 0, 1,
-1.324583, -0.1728198, -1.35337, 1, 0.6117647, 0, 1,
-1.322587, 0.6442484, 0.7563864, 1, 0.6196079, 0, 1,
-1.317683, -0.4617398, -2.126405, 1, 0.6235294, 0, 1,
-1.316651, -1.627189, -2.654629, 1, 0.6313726, 0, 1,
-1.315372, 0.9525285, -1.340485, 1, 0.6352941, 0, 1,
-1.312509, 0.9840321, -1.21642, 1, 0.6431373, 0, 1,
-1.311043, 0.3194036, -3.037822, 1, 0.6470588, 0, 1,
-1.310387, -1.822043, -0.8776771, 1, 0.654902, 0, 1,
-1.306218, -0.4752319, -2.473198, 1, 0.6588235, 0, 1,
-1.303368, -0.4764833, -1.379358, 1, 0.6666667, 0, 1,
-1.279025, 1.290992, -0.8621486, 1, 0.6705883, 0, 1,
-1.278773, 0.7591676, -1.398118, 1, 0.6784314, 0, 1,
-1.274941, -2.720937, -2.221705, 1, 0.682353, 0, 1,
-1.262914, -0.5349393, -1.835673, 1, 0.6901961, 0, 1,
-1.262114, -2.120324, -2.904328, 1, 0.6941177, 0, 1,
-1.260559, 0.1609674, -2.178379, 1, 0.7019608, 0, 1,
-1.257609, 2.55889, -0.2007474, 1, 0.7098039, 0, 1,
-1.252121, -0.04870859, -2.52937, 1, 0.7137255, 0, 1,
-1.247755, 0.3830804, -1.364392, 1, 0.7215686, 0, 1,
-1.236609, -1.74618, -2.598123, 1, 0.7254902, 0, 1,
-1.234734, 0.05434208, -3.008461, 1, 0.7333333, 0, 1,
-1.229565, 1.555336, -0.4843181, 1, 0.7372549, 0, 1,
-1.227841, -0.9215397, -1.809401, 1, 0.7450981, 0, 1,
-1.22388, -0.436696, -2.670049, 1, 0.7490196, 0, 1,
-1.221027, -1.603201, -3.018301, 1, 0.7568628, 0, 1,
-1.219396, 0.7288018, -0.08911899, 1, 0.7607843, 0, 1,
-1.199182, -0.1192611, -2.048087, 1, 0.7686275, 0, 1,
-1.19624, -1.159364, -1.953517, 1, 0.772549, 0, 1,
-1.192485, -1.810781, -1.414375, 1, 0.7803922, 0, 1,
-1.188424, 1.012286, -1.124712, 1, 0.7843137, 0, 1,
-1.181133, 2.725298, -1.391914, 1, 0.7921569, 0, 1,
-1.178931, -1.912255, -3.69207, 1, 0.7960784, 0, 1,
-1.174509, -0.7693907, -1.119718, 1, 0.8039216, 0, 1,
-1.172421, 0.5449274, 0.3730478, 1, 0.8117647, 0, 1,
-1.171781, -0.4193105, -0.872105, 1, 0.8156863, 0, 1,
-1.163048, 0.0462079, -1.399832, 1, 0.8235294, 0, 1,
-1.160066, 0.2276032, 0.807864, 1, 0.827451, 0, 1,
-1.157836, -0.1712201, -1.282485, 1, 0.8352941, 0, 1,
-1.152916, -1.071035, -2.44434, 1, 0.8392157, 0, 1,
-1.151779, 1.891439, -1.818108, 1, 0.8470588, 0, 1,
-1.145045, 1.07804, -2.622213, 1, 0.8509804, 0, 1,
-1.135871, -1.213036, -1.579213, 1, 0.8588235, 0, 1,
-1.122585, -0.5699224, -1.7228, 1, 0.8627451, 0, 1,
-1.110363, -1.344586, -3.97771, 1, 0.8705882, 0, 1,
-1.108501, -2.090456, -3.471465, 1, 0.8745098, 0, 1,
-1.102885, -1.150461, -3.959023, 1, 0.8823529, 0, 1,
-1.101029, -0.6261408, -1.623817, 1, 0.8862745, 0, 1,
-1.09963, -0.1076662, -2.439309, 1, 0.8941177, 0, 1,
-1.090485, -0.7870543, -4.612558, 1, 0.8980392, 0, 1,
-1.090248, -0.0974859, -3.038902, 1, 0.9058824, 0, 1,
-1.080561, 0.5510538, -0.1909749, 1, 0.9137255, 0, 1,
-1.079239, -0.325275, -2.235921, 1, 0.9176471, 0, 1,
-1.072331, 0.240362, -2.406845, 1, 0.9254902, 0, 1,
-1.067114, -0.7629002, -0.8969026, 1, 0.9294118, 0, 1,
-1.065402, 1.14834, -1.129751, 1, 0.9372549, 0, 1,
-1.065339, -0.9408171, -2.604959, 1, 0.9411765, 0, 1,
-1.056795, -0.6344383, -2.2817, 1, 0.9490196, 0, 1,
-1.055756, -0.3085256, -1.049593, 1, 0.9529412, 0, 1,
-1.039747, 1.322291, 0.2847694, 1, 0.9607843, 0, 1,
-1.030197, -0.7629448, -3.571299, 1, 0.9647059, 0, 1,
-1.025494, 0.9489676, -0.2737245, 1, 0.972549, 0, 1,
-1.012903, -1.00838, -4.235532, 1, 0.9764706, 0, 1,
-1.011031, -0.2218314, -1.474133, 1, 0.9843137, 0, 1,
-1.009551, -0.8084129, -0.8921504, 1, 0.9882353, 0, 1,
-1.009109, -0.7965971, -2.693411, 1, 0.9960784, 0, 1,
-1.006059, -0.5247827, -2.128644, 0.9960784, 1, 0, 1,
-1.005173, 0.5560886, 1.052952, 0.9921569, 1, 0, 1,
-0.9978245, 0.520495, -0.6155279, 0.9843137, 1, 0, 1,
-0.9937295, 1.257047, -1.005669, 0.9803922, 1, 0, 1,
-0.9856738, 0.3598488, -0.2765957, 0.972549, 1, 0, 1,
-0.9825631, 0.5238631, -0.2387289, 0.9686275, 1, 0, 1,
-0.9809226, 0.577979, -2.142074, 0.9607843, 1, 0, 1,
-0.9783567, 2.421849, -0.09101846, 0.9568627, 1, 0, 1,
-0.9705561, -0.8213082, -2.75601, 0.9490196, 1, 0, 1,
-0.9692372, -2.089648, -3.000272, 0.945098, 1, 0, 1,
-0.9651808, -1.18042, -3.216586, 0.9372549, 1, 0, 1,
-0.9639581, -0.0767772, -2.798999, 0.9333333, 1, 0, 1,
-0.9539098, 1.652055, -2.404279, 0.9254902, 1, 0, 1,
-0.9528018, 0.02519624, -0.7242125, 0.9215686, 1, 0, 1,
-0.9523004, 0.7105123, -1.615763, 0.9137255, 1, 0, 1,
-0.951391, 1.026903, -2.499579, 0.9098039, 1, 0, 1,
-0.9495354, 0.4206389, -1.020189, 0.9019608, 1, 0, 1,
-0.9493662, 0.9107107, -1.343952, 0.8941177, 1, 0, 1,
-0.9483114, -0.5882123, -2.561949, 0.8901961, 1, 0, 1,
-0.9442429, 0.7273418, -2.345229, 0.8823529, 1, 0, 1,
-0.9320189, 0.5940225, -1.435517, 0.8784314, 1, 0, 1,
-0.9313031, -0.1613725, -1.331763, 0.8705882, 1, 0, 1,
-0.9240181, -1.022125, -1.691628, 0.8666667, 1, 0, 1,
-0.9235324, -0.6597564, -1.554245, 0.8588235, 1, 0, 1,
-0.9174305, 1.513496, -0.1447151, 0.854902, 1, 0, 1,
-0.9136583, 0.2044729, -0.1491369, 0.8470588, 1, 0, 1,
-0.9089233, -0.5224828, -3.04026, 0.8431373, 1, 0, 1,
-0.9076837, -1.068237, -2.172205, 0.8352941, 1, 0, 1,
-0.9072898, -0.07075192, -4.059744, 0.8313726, 1, 0, 1,
-0.9033324, 0.6923178, -0.6189214, 0.8235294, 1, 0, 1,
-0.9023074, -0.8351371, -1.305116, 0.8196079, 1, 0, 1,
-0.898797, 0.5585434, -1.425279, 0.8117647, 1, 0, 1,
-0.892976, 0.6938182, -0.7492183, 0.8078431, 1, 0, 1,
-0.8807857, 0.1914782, 0.2365921, 0.8, 1, 0, 1,
-0.8751146, 1.551466, -1.182944, 0.7921569, 1, 0, 1,
-0.870145, -0.5990478, -3.628333, 0.7882353, 1, 0, 1,
-0.8649773, 0.01701963, -2.56524, 0.7803922, 1, 0, 1,
-0.8646366, 0.1067113, -1.588875, 0.7764706, 1, 0, 1,
-0.8634831, -0.2224541, -2.115858, 0.7686275, 1, 0, 1,
-0.8628082, 0.7309719, -0.3666572, 0.7647059, 1, 0, 1,
-0.8602871, -0.3318791, -2.612732, 0.7568628, 1, 0, 1,
-0.8574316, 0.8036249, -0.7676792, 0.7529412, 1, 0, 1,
-0.8563287, 1.380523, -1.740887, 0.7450981, 1, 0, 1,
-0.8503835, -0.6613395, -1.553923, 0.7411765, 1, 0, 1,
-0.8500478, -0.7078094, -2.141137, 0.7333333, 1, 0, 1,
-0.8446296, 1.504815, -0.5867184, 0.7294118, 1, 0, 1,
-0.8377492, -1.452305, -3.843377, 0.7215686, 1, 0, 1,
-0.8351794, 1.662152, -0.9298121, 0.7176471, 1, 0, 1,
-0.8284267, 1.158401, -0.3607978, 0.7098039, 1, 0, 1,
-0.8260812, 0.2245837, 0.3071108, 0.7058824, 1, 0, 1,
-0.8256987, 2.415586, 0.6494079, 0.6980392, 1, 0, 1,
-0.8207136, -0.0602774, -0.9413561, 0.6901961, 1, 0, 1,
-0.8185276, 0.9680654, -0.2260298, 0.6862745, 1, 0, 1,
-0.8185114, -0.7153631, -3.085162, 0.6784314, 1, 0, 1,
-0.802956, 0.4132966, -0.244571, 0.6745098, 1, 0, 1,
-0.8011325, 0.8759725, -1.243194, 0.6666667, 1, 0, 1,
-0.8002239, 1.551867, -0.8592699, 0.6627451, 1, 0, 1,
-0.7993674, -1.547192, -4.123852, 0.654902, 1, 0, 1,
-0.7900772, -0.4710123, -2.550085, 0.6509804, 1, 0, 1,
-0.7886373, 1.569098, -0.3105842, 0.6431373, 1, 0, 1,
-0.7816433, -0.0899615, -0.9079899, 0.6392157, 1, 0, 1,
-0.7784411, -0.9421197, -1.370969, 0.6313726, 1, 0, 1,
-0.7698108, 0.7424495, -1.302131, 0.627451, 1, 0, 1,
-0.7679299, 0.0556936, -2.311699, 0.6196079, 1, 0, 1,
-0.7666075, -0.8729323, -3.874478, 0.6156863, 1, 0, 1,
-0.7662282, 1.621252, -0.4037174, 0.6078432, 1, 0, 1,
-0.7647371, 0.8572388, -1.365555, 0.6039216, 1, 0, 1,
-0.7629978, 0.5231831, -2.474624, 0.5960785, 1, 0, 1,
-0.7623716, 0.9846566, -2.274145, 0.5882353, 1, 0, 1,
-0.7572986, 0.9349834, -1.076306, 0.5843138, 1, 0, 1,
-0.7570363, 0.5905758, -1.163467, 0.5764706, 1, 0, 1,
-0.7504637, -1.178482, -2.40472, 0.572549, 1, 0, 1,
-0.7493694, 0.9463879, -1.630371, 0.5647059, 1, 0, 1,
-0.7446569, -0.1549485, -2.577584, 0.5607843, 1, 0, 1,
-0.7442881, -0.1219792, -1.230582, 0.5529412, 1, 0, 1,
-0.7409344, 0.9113247, 1.589193, 0.5490196, 1, 0, 1,
-0.7340904, 0.113451, 0.3370442, 0.5411765, 1, 0, 1,
-0.7305368, -0.0841791, 0.2876952, 0.5372549, 1, 0, 1,
-0.7303129, -0.1098769, -2.170262, 0.5294118, 1, 0, 1,
-0.7261965, 1.867375, -1.079014, 0.5254902, 1, 0, 1,
-0.7138956, -0.7610276, -1.526881, 0.5176471, 1, 0, 1,
-0.7089919, 0.2235101, -1.940782, 0.5137255, 1, 0, 1,
-0.708969, -0.5718346, -0.510155, 0.5058824, 1, 0, 1,
-0.7052044, 1.087163, 0.2564192, 0.5019608, 1, 0, 1,
-0.7030485, 1.563984, -1.496607, 0.4941176, 1, 0, 1,
-0.6961988, 0.6688102, -0.5180531, 0.4862745, 1, 0, 1,
-0.6924947, -0.01116309, -0.02502239, 0.4823529, 1, 0, 1,
-0.6918878, -0.4226114, -2.524773, 0.4745098, 1, 0, 1,
-0.6889413, -0.02800601, -1.76519, 0.4705882, 1, 0, 1,
-0.6863492, -0.9020354, -2.35948, 0.4627451, 1, 0, 1,
-0.6855806, -0.4712315, -1.913021, 0.4588235, 1, 0, 1,
-0.6838536, 0.6658651, -1.446839, 0.4509804, 1, 0, 1,
-0.6804861, 0.5948182, 0.8653662, 0.4470588, 1, 0, 1,
-0.6778499, 0.2898222, -2.280911, 0.4392157, 1, 0, 1,
-0.677542, -0.2706925, -1.780391, 0.4352941, 1, 0, 1,
-0.6774467, -0.8026333, -2.106214, 0.427451, 1, 0, 1,
-0.676224, -1.655933, -1.94773, 0.4235294, 1, 0, 1,
-0.6746346, -1.608349, -3.055101, 0.4156863, 1, 0, 1,
-0.6724005, -0.9962211, -4.292978, 0.4117647, 1, 0, 1,
-0.6707839, -0.4585416, -2.784614, 0.4039216, 1, 0, 1,
-0.6699075, -0.6078602, -2.820998, 0.3960784, 1, 0, 1,
-0.6661958, -1.403443, -4.212289, 0.3921569, 1, 0, 1,
-0.6621671, -0.7621142, -0.7785387, 0.3843137, 1, 0, 1,
-0.6598341, -0.3889281, -2.389834, 0.3803922, 1, 0, 1,
-0.6598065, 0.2229048, -2.070987, 0.372549, 1, 0, 1,
-0.6565917, -0.1820937, -2.56972, 0.3686275, 1, 0, 1,
-0.6444049, 1.581858, -0.720988, 0.3607843, 1, 0, 1,
-0.6394981, -1.08848, -1.981607, 0.3568628, 1, 0, 1,
-0.6313571, 0.7333964, -1.680564, 0.3490196, 1, 0, 1,
-0.6292754, -0.2412947, -2.595958, 0.345098, 1, 0, 1,
-0.62525, 0.4156975, -0.8075616, 0.3372549, 1, 0, 1,
-0.6193372, -0.6684594, -1.019046, 0.3333333, 1, 0, 1,
-0.6188928, -0.02434114, -3.166136, 0.3254902, 1, 0, 1,
-0.6180542, -0.8316334, -2.680353, 0.3215686, 1, 0, 1,
-0.618007, -1.700252, -2.197758, 0.3137255, 1, 0, 1,
-0.611042, -0.2157106, -2.105259, 0.3098039, 1, 0, 1,
-0.6098973, 0.09842174, -1.669358, 0.3019608, 1, 0, 1,
-0.6095756, 2.699238, -2.39852, 0.2941177, 1, 0, 1,
-0.6085027, -0.00980047, -1.012519, 0.2901961, 1, 0, 1,
-0.6080934, 0.4906608, 0.4316646, 0.282353, 1, 0, 1,
-0.6060236, 0.7060084, -0.2206178, 0.2784314, 1, 0, 1,
-0.6059604, 0.958461, -0.03104923, 0.2705882, 1, 0, 1,
-0.6055741, -1.11474, -3.167631, 0.2666667, 1, 0, 1,
-0.6049431, 0.4646392, -0.8567408, 0.2588235, 1, 0, 1,
-0.6036298, -1.393035, -2.846615, 0.254902, 1, 0, 1,
-0.6014147, 1.630559, -0.03373247, 0.2470588, 1, 0, 1,
-0.5929797, -1.582411, -3.356407, 0.2431373, 1, 0, 1,
-0.5920109, -1.639176, -3.895578, 0.2352941, 1, 0, 1,
-0.590459, -1.325696, -2.586944, 0.2313726, 1, 0, 1,
-0.5829516, -1.388337, -3.373985, 0.2235294, 1, 0, 1,
-0.5823367, 1.139384, -0.8808866, 0.2196078, 1, 0, 1,
-0.5774182, -1.83756, -3.799129, 0.2117647, 1, 0, 1,
-0.573682, -0.9857018, -2.91147, 0.2078431, 1, 0, 1,
-0.5724742, 1.774658, 0.2640186, 0.2, 1, 0, 1,
-0.569167, -0.2252353, -3.536922, 0.1921569, 1, 0, 1,
-0.5622383, 0.5231255, -0.8395467, 0.1882353, 1, 0, 1,
-0.5612772, -0.9535047, -1.105916, 0.1803922, 1, 0, 1,
-0.5605486, 0.891901, -1.750481, 0.1764706, 1, 0, 1,
-0.5576851, 0.3310995, -2.029052, 0.1686275, 1, 0, 1,
-0.5535262, -2.560802, -2.603181, 0.1647059, 1, 0, 1,
-0.5513526, 0.7303951, -1.661083, 0.1568628, 1, 0, 1,
-0.5476444, -0.6095189, -3.011369, 0.1529412, 1, 0, 1,
-0.5464007, -0.05296504, -1.821124, 0.145098, 1, 0, 1,
-0.545325, -0.5747624, -2.732261, 0.1411765, 1, 0, 1,
-0.5446385, -1.102492, -2.339759, 0.1333333, 1, 0, 1,
-0.5394734, -0.8909016, -2.504702, 0.1294118, 1, 0, 1,
-0.5372467, -0.6312502, -2.822837, 0.1215686, 1, 0, 1,
-0.5341623, 0.5353827, -1.255866, 0.1176471, 1, 0, 1,
-0.5337043, -1.306075, -2.299495, 0.1098039, 1, 0, 1,
-0.5322804, 0.6998292, 0.09486006, 0.1058824, 1, 0, 1,
-0.5289737, -0.8530735, -1.537003, 0.09803922, 1, 0, 1,
-0.5283332, 0.3629345, 0.5401019, 0.09019608, 1, 0, 1,
-0.5254506, -0.8741663, -0.5185726, 0.08627451, 1, 0, 1,
-0.5245115, -1.275544, -3.903732, 0.07843138, 1, 0, 1,
-0.5234815, 0.5772548, -0.9410067, 0.07450981, 1, 0, 1,
-0.5143579, 0.07123505, 0.6581168, 0.06666667, 1, 0, 1,
-0.5119538, 0.6290696, 0.05454398, 0.0627451, 1, 0, 1,
-0.5115743, 0.5506402, -0.1308137, 0.05490196, 1, 0, 1,
-0.5114415, 1.421907, -0.8266461, 0.05098039, 1, 0, 1,
-0.5103161, 0.561765, 0.4843937, 0.04313726, 1, 0, 1,
-0.507453, 3.440291, -1.36988, 0.03921569, 1, 0, 1,
-0.506941, 0.1840131, -2.895967, 0.03137255, 1, 0, 1,
-0.5062357, -1.029107, -3.802969, 0.02745098, 1, 0, 1,
-0.5006275, -0.3545777, -2.691979, 0.01960784, 1, 0, 1,
-0.5000491, -0.1789605, -0.3277872, 0.01568628, 1, 0, 1,
-0.4982056, -0.9993328, -2.201644, 0.007843138, 1, 0, 1,
-0.4954393, -0.6360271, -2.704243, 0.003921569, 1, 0, 1,
-0.4915898, -1.253202, -2.230225, 0, 1, 0.003921569, 1,
-0.4888541, 0.02632811, -2.392275, 0, 1, 0.01176471, 1,
-0.4840434, 0.2624494, -1.011052, 0, 1, 0.01568628, 1,
-0.4813828, -1.612323, -3.48924, 0, 1, 0.02352941, 1,
-0.4812234, -0.2104279, -2.558226, 0, 1, 0.02745098, 1,
-0.4785477, -1.507409, -3.277883, 0, 1, 0.03529412, 1,
-0.4767227, -0.8455162, -2.648563, 0, 1, 0.03921569, 1,
-0.4753837, -1.704311, -3.360389, 0, 1, 0.04705882, 1,
-0.4750086, -0.08880323, -0.0105027, 0, 1, 0.05098039, 1,
-0.4735084, 2.116564, -0.8821146, 0, 1, 0.05882353, 1,
-0.4728768, 2.284897, -0.6267889, 0, 1, 0.0627451, 1,
-0.4712468, 0.2640479, 0.09084065, 0, 1, 0.07058824, 1,
-0.4681569, -0.03403194, -0.3071491, 0, 1, 0.07450981, 1,
-0.4666431, 0.4525588, 0.1736014, 0, 1, 0.08235294, 1,
-0.4661908, -0.9573851, -1.736314, 0, 1, 0.08627451, 1,
-0.4632207, -0.7526597, -1.792909, 0, 1, 0.09411765, 1,
-0.461549, 1.598229, 0.7814876, 0, 1, 0.1019608, 1,
-0.4580588, 0.8203406, -0.08645479, 0, 1, 0.1058824, 1,
-0.4490951, -1.081613, -2.715466, 0, 1, 0.1137255, 1,
-0.4462235, -0.9830313, -0.8100629, 0, 1, 0.1176471, 1,
-0.4406634, -0.7605351, -4.300576, 0, 1, 0.1254902, 1,
-0.4360058, -0.3662895, -1.209594, 0, 1, 0.1294118, 1,
-0.4349273, 0.4725527, -0.3587469, 0, 1, 0.1372549, 1,
-0.4348963, 0.006207052, -2.372435, 0, 1, 0.1411765, 1,
-0.4344882, -1.054119, -1.961143, 0, 1, 0.1490196, 1,
-0.434022, 1.072266, -0.03593881, 0, 1, 0.1529412, 1,
-0.4257805, -0.0902915, -2.768274, 0, 1, 0.1607843, 1,
-0.4225149, 0.1558086, -2.767713, 0, 1, 0.1647059, 1,
-0.4223921, 3.987573e-05, -3.360653, 0, 1, 0.172549, 1,
-0.4223223, 1.023526, 0.4173339, 0, 1, 0.1764706, 1,
-0.4131637, -0.3815412, -0.9398718, 0, 1, 0.1843137, 1,
-0.4127649, -2.055517, -1.74575, 0, 1, 0.1882353, 1,
-0.4116105, 0.3882221, -1.154235, 0, 1, 0.1960784, 1,
-0.4035923, -1.108083, -3.209468, 0, 1, 0.2039216, 1,
-0.4032424, 0.6677669, 0.7300616, 0, 1, 0.2078431, 1,
-0.3965274, 1.023638, -0.5568191, 0, 1, 0.2156863, 1,
-0.3884349, 0.2608396, -0.7006891, 0, 1, 0.2196078, 1,
-0.3831318, 0.5779777, -1.814723, 0, 1, 0.227451, 1,
-0.3800945, 1.374408, -0.5164861, 0, 1, 0.2313726, 1,
-0.3797414, 1.19294, -1.323305, 0, 1, 0.2392157, 1,
-0.3796306, -1.24828, -3.855686, 0, 1, 0.2431373, 1,
-0.3759984, -0.4337663, -1.615242, 0, 1, 0.2509804, 1,
-0.3752642, -1.1691, -3.264156, 0, 1, 0.254902, 1,
-0.3729548, -0.9428052, -4.3613, 0, 1, 0.2627451, 1,
-0.3718383, 0.4737256, 0.0802495, 0, 1, 0.2666667, 1,
-0.3715006, -0.008179888, -2.268837, 0, 1, 0.2745098, 1,
-0.3703507, -0.3319866, -2.144769, 0, 1, 0.2784314, 1,
-0.3690857, -0.9731172, -1.997662, 0, 1, 0.2862745, 1,
-0.3673446, 0.7097439, -0.5634042, 0, 1, 0.2901961, 1,
-0.3599031, 0.8933223, 0.5991214, 0, 1, 0.2980392, 1,
-0.3591676, -1.380795, -3.103996, 0, 1, 0.3058824, 1,
-0.3534175, 0.8398221, 0.950605, 0, 1, 0.3098039, 1,
-0.3508039, 1.359828, -0.9951113, 0, 1, 0.3176471, 1,
-0.3469444, -0.498675, -0.8037014, 0, 1, 0.3215686, 1,
-0.3449242, -0.1303447, -3.452164, 0, 1, 0.3294118, 1,
-0.3431506, -0.07609773, -3.697805, 0, 1, 0.3333333, 1,
-0.3378727, -0.8956631, -1.833677, 0, 1, 0.3411765, 1,
-0.3368869, 0.943982, -0.7487839, 0, 1, 0.345098, 1,
-0.3361856, -0.0734273, -2.609697, 0, 1, 0.3529412, 1,
-0.3282104, 0.2758068, -0.07792302, 0, 1, 0.3568628, 1,
-0.3262877, -0.436419, -1.328254, 0, 1, 0.3647059, 1,
-0.3243224, 0.816621, -0.9163651, 0, 1, 0.3686275, 1,
-0.3230048, 0.6582437, -0.7191215, 0, 1, 0.3764706, 1,
-0.3225001, 0.5944306, -2.844974, 0, 1, 0.3803922, 1,
-0.3187637, 0.6021184, -1.823801, 0, 1, 0.3882353, 1,
-0.3074233, 0.3237396, -1.17514, 0, 1, 0.3921569, 1,
-0.3062212, -0.7317172, -4.748096, 0, 1, 0.4, 1,
-0.3049066, 1.606317, -0.6080961, 0, 1, 0.4078431, 1,
-0.3032267, 1.77107, -0.4773332, 0, 1, 0.4117647, 1,
-0.3020963, 1.127322, -1.218196, 0, 1, 0.4196078, 1,
-0.2948343, -0.2505078, -0.7393476, 0, 1, 0.4235294, 1,
-0.2938999, 0.8381125, 1.668357, 0, 1, 0.4313726, 1,
-0.2921454, 0.4881419, -0.8259599, 0, 1, 0.4352941, 1,
-0.2916559, -0.4069851, -2.343429, 0, 1, 0.4431373, 1,
-0.2899585, 0.1775773, -0.8922407, 0, 1, 0.4470588, 1,
-0.2808035, -0.7218135, -0.8730347, 0, 1, 0.454902, 1,
-0.2772989, -2.603854, -3.261725, 0, 1, 0.4588235, 1,
-0.2758051, 1.390363, 0.761888, 0, 1, 0.4666667, 1,
-0.2732362, 0.9493559, -0.4589143, 0, 1, 0.4705882, 1,
-0.2690343, -0.9293169, -3.171719, 0, 1, 0.4784314, 1,
-0.2689317, 0.3722301, -0.3525298, 0, 1, 0.4823529, 1,
-0.2673517, -0.547833, -3.973807, 0, 1, 0.4901961, 1,
-0.2654882, -0.546676, -2.035455, 0, 1, 0.4941176, 1,
-0.2640878, -1.506738, -3.619933, 0, 1, 0.5019608, 1,
-0.2566046, 0.3178855, 0.8554633, 0, 1, 0.509804, 1,
-0.2511854, 0.9391193, -0.316751, 0, 1, 0.5137255, 1,
-0.2501787, -1.808325, -2.888318, 0, 1, 0.5215687, 1,
-0.2491284, 2.176647, -2.101403, 0, 1, 0.5254902, 1,
-0.2458342, 1.657249, -1.040605, 0, 1, 0.5333334, 1,
-0.240192, 1.271695, -0.9122329, 0, 1, 0.5372549, 1,
-0.2343288, -0.5611058, -4.337936, 0, 1, 0.5450981, 1,
-0.2342281, 1.162422, -0.7041723, 0, 1, 0.5490196, 1,
-0.233306, -0.2421415, -3.271943, 0, 1, 0.5568628, 1,
-0.2319114, -1.290696, -4.365223, 0, 1, 0.5607843, 1,
-0.2301445, 1.300764, -0.1002864, 0, 1, 0.5686275, 1,
-0.228591, -0.1896329, -0.2492211, 0, 1, 0.572549, 1,
-0.2247144, -0.08547977, -2.282137, 0, 1, 0.5803922, 1,
-0.2235822, -1.462394, -3.917164, 0, 1, 0.5843138, 1,
-0.2227426, 0.7505566, 1.24662, 0, 1, 0.5921569, 1,
-0.2200867, -0.8750104, -2.892776, 0, 1, 0.5960785, 1,
-0.2191683, -0.5352495, -3.949335, 0, 1, 0.6039216, 1,
-0.2154876, -0.2893638, -1.276307, 0, 1, 0.6117647, 1,
-0.2092424, 1.64618, 0.8839433, 0, 1, 0.6156863, 1,
-0.2069921, -0.8032669, -4.336859, 0, 1, 0.6235294, 1,
-0.2038162, -0.08966834, -1.917293, 0, 1, 0.627451, 1,
-0.1977241, -0.3780145, -1.241429, 0, 1, 0.6352941, 1,
-0.1863339, -2.163395, -3.834031, 0, 1, 0.6392157, 1,
-0.1861068, 0.512318, -1.361866, 0, 1, 0.6470588, 1,
-0.1841939, -0.7336451, -3.143584, 0, 1, 0.6509804, 1,
-0.1820062, -0.6772852, -1.42033, 0, 1, 0.6588235, 1,
-0.1797883, 1.256845, -0.6104893, 0, 1, 0.6627451, 1,
-0.171461, 0.2994318, -1.215341, 0, 1, 0.6705883, 1,
-0.1679457, 0.6031312, -0.4783493, 0, 1, 0.6745098, 1,
-0.1573221, 0.3844429, -0.4322465, 0, 1, 0.682353, 1,
-0.156396, 0.5946659, -0.3811942, 0, 1, 0.6862745, 1,
-0.1497507, 1.034135, 1.909914, 0, 1, 0.6941177, 1,
-0.14893, -1.87657, -1.801661, 0, 1, 0.7019608, 1,
-0.1485595, -1.180171, -1.377268, 0, 1, 0.7058824, 1,
-0.1477125, -0.6701238, -4.475896, 0, 1, 0.7137255, 1,
-0.1448383, -1.089861, -2.752087, 0, 1, 0.7176471, 1,
-0.1428199, -0.0615614, 0.4103998, 0, 1, 0.7254902, 1,
-0.1407592, -1.138166, -4.480381, 0, 1, 0.7294118, 1,
-0.1405782, 0.9780827, 1.146347, 0, 1, 0.7372549, 1,
-0.1383415, -0.8354253, -2.996888, 0, 1, 0.7411765, 1,
-0.1376697, 0.3220825, -0.5550404, 0, 1, 0.7490196, 1,
-0.1310869, 0.08061263, -2.463262, 0, 1, 0.7529412, 1,
-0.1306114, 0.1275922, -0.3398073, 0, 1, 0.7607843, 1,
-0.1279436, 0.278475, 0.8822983, 0, 1, 0.7647059, 1,
-0.1270198, -0.4548579, -2.219052, 0, 1, 0.772549, 1,
-0.1267761, 0.9321874, 0.4072892, 0, 1, 0.7764706, 1,
-0.1244903, 0.03835624, -0.3375515, 0, 1, 0.7843137, 1,
-0.1224572, -1.283227, -3.536676, 0, 1, 0.7882353, 1,
-0.1188816, -1.208027, -3.679518, 0, 1, 0.7960784, 1,
-0.1183574, -0.8836287, -4.106379, 0, 1, 0.8039216, 1,
-0.1182081, 1.96701, 0.1416231, 0, 1, 0.8078431, 1,
-0.1148768, 1.545746, 0.05174736, 0, 1, 0.8156863, 1,
-0.1142959, 0.722192, 0.5222378, 0, 1, 0.8196079, 1,
-0.110581, -1.383897, -4.318355, 0, 1, 0.827451, 1,
-0.1096961, 0.5540233, 0.08553721, 0, 1, 0.8313726, 1,
-0.1090156, 0.767495, -1.283679, 0, 1, 0.8392157, 1,
-0.1024328, -0.477971, -1.912247, 0, 1, 0.8431373, 1,
-0.09705946, -0.5737119, -3.21989, 0, 1, 0.8509804, 1,
-0.09589663, 0.8958309, 1.249165, 0, 1, 0.854902, 1,
-0.09471378, -0.9288166, -3.584734, 0, 1, 0.8627451, 1,
-0.07818639, -0.8115074, -3.038329, 0, 1, 0.8666667, 1,
-0.07774632, -0.002517574, 0.1239263, 0, 1, 0.8745098, 1,
-0.07771293, -0.3762059, -4.018052, 0, 1, 0.8784314, 1,
-0.07439533, 0.5787918, 0.2514183, 0, 1, 0.8862745, 1,
-0.07329349, -0.6299492, -3.390432, 0, 1, 0.8901961, 1,
-0.07235797, 0.3276527, 1.514079, 0, 1, 0.8980392, 1,
-0.07059784, -0.5496945, -3.26203, 0, 1, 0.9058824, 1,
-0.06256139, 0.1885429, -1.567447, 0, 1, 0.9098039, 1,
-0.05544239, 0.856761, 1.810563, 0, 1, 0.9176471, 1,
-0.04634303, 1.031174, 2.042099, 0, 1, 0.9215686, 1,
-0.04423916, -0.02870589, -2.128008, 0, 1, 0.9294118, 1,
-0.04414039, 2.218791, -0.828738, 0, 1, 0.9333333, 1,
-0.04238568, -1.035213, -3.71228, 0, 1, 0.9411765, 1,
-0.04119445, -0.3331662, -2.109527, 0, 1, 0.945098, 1,
-0.03907321, 0.2519403, -0.6873412, 0, 1, 0.9529412, 1,
-0.03703806, 0.9785703, -0.4649688, 0, 1, 0.9568627, 1,
-0.03683358, -1.030165, -4.30527, 0, 1, 0.9647059, 1,
-0.03633659, -0.5960756, -3.406987, 0, 1, 0.9686275, 1,
-0.03378033, 0.4128751, 0.3470234, 0, 1, 0.9764706, 1,
-0.03364445, -1.466627, -2.818084, 0, 1, 0.9803922, 1,
-0.03362668, -0.4449278, -4.721023, 0, 1, 0.9882353, 1,
-0.03185132, -2.497463, -4.436106, 0, 1, 0.9921569, 1,
-0.02875994, 1.626872, 1.311808, 0, 1, 1, 1,
-0.02788468, 0.3739133, -1.384514, 0, 0.9921569, 1, 1,
-0.02776266, 0.7366835, 0.9559547, 0, 0.9882353, 1, 1,
-0.02077421, -0.6223679, -2.524325, 0, 0.9803922, 1, 1,
-0.01728572, -1.621097, -2.809025, 0, 0.9764706, 1, 1,
-0.01311009, -1.925796, -2.879963, 0, 0.9686275, 1, 1,
-0.01083522, 1.43191, -0.04680418, 0, 0.9647059, 1, 1,
-0.01064634, -1.834853, -3.777464, 0, 0.9568627, 1, 1,
-0.01045881, -0.1695111, -3.294418, 0, 0.9529412, 1, 1,
-0.008476313, -0.835974, -4.213419, 0, 0.945098, 1, 1,
-0.007172476, -0.707825, -4.820406, 0, 0.9411765, 1, 1,
-0.001543636, -0.9715828, -2.531757, 0, 0.9333333, 1, 1,
0.002185941, -1.006831, 3.202616, 0, 0.9294118, 1, 1,
0.004286841, -0.1891036, 3.86795, 0, 0.9215686, 1, 1,
0.006475947, 2.557949, 0.301198, 0, 0.9176471, 1, 1,
0.007167558, 0.03513744, 1.242378, 0, 0.9098039, 1, 1,
0.01529756, 1.274502, -0.6231337, 0, 0.9058824, 1, 1,
0.01614671, 0.03032686, 0.08094103, 0, 0.8980392, 1, 1,
0.01688566, 0.8085748, 0.9342377, 0, 0.8901961, 1, 1,
0.02002517, -0.4112293, 5.604367, 0, 0.8862745, 1, 1,
0.02335218, -0.2343229, 2.013405, 0, 0.8784314, 1, 1,
0.02866889, 0.1983826, 0.3723481, 0, 0.8745098, 1, 1,
0.02984708, 0.9559399, 0.04652127, 0, 0.8666667, 1, 1,
0.03049642, 1.468131, 0.3073997, 0, 0.8627451, 1, 1,
0.03105268, 1.4772, -0.140689, 0, 0.854902, 1, 1,
0.03122355, 0.8526755, -0.7729336, 0, 0.8509804, 1, 1,
0.03182419, 0.01513989, -0.3173949, 0, 0.8431373, 1, 1,
0.0324416, 0.3423389, -1.145209, 0, 0.8392157, 1, 1,
0.03479539, 0.7058798, 0.1634721, 0, 0.8313726, 1, 1,
0.0383308, -0.07833104, 1.107075, 0, 0.827451, 1, 1,
0.04446884, -1.161247, 2.927573, 0, 0.8196079, 1, 1,
0.04759981, 0.3878808, 0.7876132, 0, 0.8156863, 1, 1,
0.04781336, 0.0844923, 1.517428, 0, 0.8078431, 1, 1,
0.04911924, 0.2594593, 1.00414, 0, 0.8039216, 1, 1,
0.05128827, 0.05757544, -0.6638433, 0, 0.7960784, 1, 1,
0.05525433, 1.479539, 0.571631, 0, 0.7882353, 1, 1,
0.0571594, 0.4469375, -0.5465521, 0, 0.7843137, 1, 1,
0.05860349, -0.6344317, 1.163962, 0, 0.7764706, 1, 1,
0.05929301, -1.191144, 2.50048, 0, 0.772549, 1, 1,
0.0607082, -1.748064, 4.029339, 0, 0.7647059, 1, 1,
0.06170608, 0.05853474, 2.492505, 0, 0.7607843, 1, 1,
0.06693889, 0.523097, 0.3686726, 0, 0.7529412, 1, 1,
0.0680839, -0.05124025, 2.457348, 0, 0.7490196, 1, 1,
0.07532377, -0.1906671, 2.503693, 0, 0.7411765, 1, 1,
0.0766109, -0.3386629, 2.273474, 0, 0.7372549, 1, 1,
0.07669094, -1.639323, 1.520196, 0, 0.7294118, 1, 1,
0.07680845, -1.258845, 2.472027, 0, 0.7254902, 1, 1,
0.07953271, 0.5711804, 2.507766, 0, 0.7176471, 1, 1,
0.08139216, 0.1945257, 0.1835154, 0, 0.7137255, 1, 1,
0.08210496, -1.142745, 2.615831, 0, 0.7058824, 1, 1,
0.08472019, 1.873823, 0.01141167, 0, 0.6980392, 1, 1,
0.08563893, -0.5672377, 4.387631, 0, 0.6941177, 1, 1,
0.08906317, 0.878802, -0.8747259, 0, 0.6862745, 1, 1,
0.0931649, 0.2615753, 0.8135341, 0, 0.682353, 1, 1,
0.09327159, 1.23937, -0.1228674, 0, 0.6745098, 1, 1,
0.09405273, -0.2265988, 2.229601, 0, 0.6705883, 1, 1,
0.09628011, -0.5003844, 3.140295, 0, 0.6627451, 1, 1,
0.09930053, 0.7514418, -0.04787074, 0, 0.6588235, 1, 1,
0.101679, 0.7902862, -0.7567998, 0, 0.6509804, 1, 1,
0.1056785, 0.7603391, 0.6546317, 0, 0.6470588, 1, 1,
0.1135298, -1.058575, 2.829786, 0, 0.6392157, 1, 1,
0.1177172, -0.05457866, 1.521384, 0, 0.6352941, 1, 1,
0.1186826, 0.9266077, -1.511911, 0, 0.627451, 1, 1,
0.1188663, -2.054128, 3.567732, 0, 0.6235294, 1, 1,
0.1206707, -0.6304736, 3.295255, 0, 0.6156863, 1, 1,
0.1264592, 1.203596, 1.557446, 0, 0.6117647, 1, 1,
0.1273103, -0.2041016, 3.272438, 0, 0.6039216, 1, 1,
0.1328769, 1.543247, -0.1601032, 0, 0.5960785, 1, 1,
0.1374761, 0.8141489, 1.147188, 0, 0.5921569, 1, 1,
0.1408688, 1.916122, -1.039951, 0, 0.5843138, 1, 1,
0.142309, 0.0783549, 0.4689009, 0, 0.5803922, 1, 1,
0.1471768, -0.9700019, 1.707662, 0, 0.572549, 1, 1,
0.150694, 0.1646653, -0.8232134, 0, 0.5686275, 1, 1,
0.151261, -0.03972015, 1.866877, 0, 0.5607843, 1, 1,
0.1530168, -0.4184081, 3.801771, 0, 0.5568628, 1, 1,
0.15402, -0.1916118, 3.727367, 0, 0.5490196, 1, 1,
0.1570327, -0.6480628, 2.792736, 0, 0.5450981, 1, 1,
0.1600037, -0.4963551, 2.805045, 0, 0.5372549, 1, 1,
0.16032, -1.861494, 4.604612, 0, 0.5333334, 1, 1,
0.162712, 1.33434, -0.1488768, 0, 0.5254902, 1, 1,
0.1634902, 1.600514, 2.370401, 0, 0.5215687, 1, 1,
0.1647423, -0.1586768, 0.7774718, 0, 0.5137255, 1, 1,
0.1664996, 0.1095823, 1.689612, 0, 0.509804, 1, 1,
0.1706449, 0.3398302, 1.065406, 0, 0.5019608, 1, 1,
0.1737566, 0.1607646, -0.1189106, 0, 0.4941176, 1, 1,
0.1740449, -0.5551383, 1.205261, 0, 0.4901961, 1, 1,
0.1749493, 0.2801873, 0.5976465, 0, 0.4823529, 1, 1,
0.1786769, -0.571141, 4.597054, 0, 0.4784314, 1, 1,
0.1791261, -0.1404021, 2.613956, 0, 0.4705882, 1, 1,
0.1811353, 1.150847, -0.3053834, 0, 0.4666667, 1, 1,
0.190974, 0.6900337, 1.669693, 0, 0.4588235, 1, 1,
0.1947251, -0.6841317, 3.352394, 0, 0.454902, 1, 1,
0.1949513, -0.742699, 3.120318, 0, 0.4470588, 1, 1,
0.1950528, -0.2132783, 3.20542, 0, 0.4431373, 1, 1,
0.1955253, 1.647368, 1.432588, 0, 0.4352941, 1, 1,
0.1962636, 0.07476714, 0.8864493, 0, 0.4313726, 1, 1,
0.2029687, -0.3109931, 2.472789, 0, 0.4235294, 1, 1,
0.2030389, 1.509601, 0.6971635, 0, 0.4196078, 1, 1,
0.2032343, 0.156537, 2.434008, 0, 0.4117647, 1, 1,
0.2034588, 0.3738256, -0.8634607, 0, 0.4078431, 1, 1,
0.2058625, -0.8776895, 3.945213, 0, 0.4, 1, 1,
0.2124295, 0.7524111, 1.527776, 0, 0.3921569, 1, 1,
0.2144884, 2.032076, 1.534491, 0, 0.3882353, 1, 1,
0.2183551, -1.528925, 4.176338, 0, 0.3803922, 1, 1,
0.2206992, -0.08239904, 3.516884, 0, 0.3764706, 1, 1,
0.2217895, -0.7081597, 2.926895, 0, 0.3686275, 1, 1,
0.2270091, -0.05629892, 1.423923, 0, 0.3647059, 1, 1,
0.2279618, 0.07924385, 1.443423, 0, 0.3568628, 1, 1,
0.233516, 0.9346024, 0.782599, 0, 0.3529412, 1, 1,
0.2411074, -0.8441882, 1.663507, 0, 0.345098, 1, 1,
0.2433268, -2.499142, 1.667657, 0, 0.3411765, 1, 1,
0.2452535, 2.102425, -0.09851263, 0, 0.3333333, 1, 1,
0.2464051, -0.9640069, 0.4162009, 0, 0.3294118, 1, 1,
0.2481505, -0.6588609, 2.862919, 0, 0.3215686, 1, 1,
0.251591, 0.7832084, 0.3074608, 0, 0.3176471, 1, 1,
0.2540678, 1.651168, -0.7653875, 0, 0.3098039, 1, 1,
0.2577755, 0.7509907, -0.3416663, 0, 0.3058824, 1, 1,
0.2618284, 0.5384969, -0.6579171, 0, 0.2980392, 1, 1,
0.2682924, 0.2915364, 0.9552503, 0, 0.2901961, 1, 1,
0.2759225, 0.03392813, 1.309215, 0, 0.2862745, 1, 1,
0.2884367, -0.5181094, 2.258541, 0, 0.2784314, 1, 1,
0.2972902, 0.8690321, 0.9412662, 0, 0.2745098, 1, 1,
0.2998949, -0.8754092, 3.730416, 0, 0.2666667, 1, 1,
0.3012117, 0.1620623, -1.166378, 0, 0.2627451, 1, 1,
0.3013586, -0.04361204, 3.418621, 0, 0.254902, 1, 1,
0.3044608, 0.5176665, -0.4361416, 0, 0.2509804, 1, 1,
0.3051516, -0.1420901, 3.072047, 0, 0.2431373, 1, 1,
0.3053374, 0.3724124, 0.9703068, 0, 0.2392157, 1, 1,
0.3067074, -0.6241117, 2.175616, 0, 0.2313726, 1, 1,
0.3097463, -0.7046253, 3.57659, 0, 0.227451, 1, 1,
0.3137476, -1.604885, 3.085481, 0, 0.2196078, 1, 1,
0.3227957, -0.3181587, 0.03265809, 0, 0.2156863, 1, 1,
0.322905, -0.3067074, 2.665791, 0, 0.2078431, 1, 1,
0.3238822, -0.46153, 3.387189, 0, 0.2039216, 1, 1,
0.3330001, -0.7216299, 2.461849, 0, 0.1960784, 1, 1,
0.3345998, 0.1256155, 2.117333, 0, 0.1882353, 1, 1,
0.3394937, 0.1974317, 0.8050702, 0, 0.1843137, 1, 1,
0.3468056, 0.2082866, 1.759525, 0, 0.1764706, 1, 1,
0.352051, -1.100897, 3.598798, 0, 0.172549, 1, 1,
0.3536061, -1.389655, 3.548615, 0, 0.1647059, 1, 1,
0.3556416, 0.927923, -0.200591, 0, 0.1607843, 1, 1,
0.3565252, -1.524723, 3.227752, 0, 0.1529412, 1, 1,
0.3597027, -0.5478424, 3.103616, 0, 0.1490196, 1, 1,
0.3643351, -1.088019, 2.808578, 0, 0.1411765, 1, 1,
0.3670131, -1.049344, 1.708718, 0, 0.1372549, 1, 1,
0.3673491, -0.2560096, 1.800115, 0, 0.1294118, 1, 1,
0.3710639, 0.3944546, 0.3612751, 0, 0.1254902, 1, 1,
0.3717949, 0.2795211, 0.2628737, 0, 0.1176471, 1, 1,
0.3781214, -0.7843364, 1.530614, 0, 0.1137255, 1, 1,
0.3786423, 0.9195957, -0.7526245, 0, 0.1058824, 1, 1,
0.3839348, -0.7663659, 2.079295, 0, 0.09803922, 1, 1,
0.3842698, 0.04089041, -0.196247, 0, 0.09411765, 1, 1,
0.3905854, -0.317599, 4.152749, 0, 0.08627451, 1, 1,
0.3913206, 1.978351, 0.0962162, 0, 0.08235294, 1, 1,
0.3920673, -0.2289916, 2.134336, 0, 0.07450981, 1, 1,
0.3996776, 0.2848648, 1.529444, 0, 0.07058824, 1, 1,
0.4020014, -0.4854093, 2.63476, 0, 0.0627451, 1, 1,
0.4043851, -0.4904827, 2.913927, 0, 0.05882353, 1, 1,
0.4059062, 2.899942, 0.285935, 0, 0.05098039, 1, 1,
0.4061495, -0.9896974, 2.402023, 0, 0.04705882, 1, 1,
0.4122388, -1.118933, 2.918858, 0, 0.03921569, 1, 1,
0.415869, 0.2832313, -0.2943829, 0, 0.03529412, 1, 1,
0.4166023, 1.435353, -0.01708404, 0, 0.02745098, 1, 1,
0.427921, -0.8659945, 3.329907, 0, 0.02352941, 1, 1,
0.4303718, 0.1003191, 3.132875, 0, 0.01568628, 1, 1,
0.4354042, -1.054193, 1.375437, 0, 0.01176471, 1, 1,
0.4392026, 0.8028147, 0.4766577, 0, 0.003921569, 1, 1,
0.4393479, 0.7457985, 2.472501, 0.003921569, 0, 1, 1,
0.439502, 0.6525971, 0.9306386, 0.007843138, 0, 1, 1,
0.4406964, 0.4726008, 0.3695243, 0.01568628, 0, 1, 1,
0.4415855, -0.1831671, 1.503312, 0.01960784, 0, 1, 1,
0.441903, 1.441824, -0.4144377, 0.02745098, 0, 1, 1,
0.4446769, 0.3270018, -0.0592069, 0.03137255, 0, 1, 1,
0.4447446, 0.8002374, -0.5865523, 0.03921569, 0, 1, 1,
0.444809, 0.8344022, 0.506627, 0.04313726, 0, 1, 1,
0.4470019, -0.645548, 3.865505, 0.05098039, 0, 1, 1,
0.4471263, 0.3517578, -0.7062402, 0.05490196, 0, 1, 1,
0.4533316, -0.2095519, 2.426175, 0.0627451, 0, 1, 1,
0.4572394, -1.508287, 3.313729, 0.06666667, 0, 1, 1,
0.4588689, -0.07501689, 2.117883, 0.07450981, 0, 1, 1,
0.4610265, -0.4282635, 2.354991, 0.07843138, 0, 1, 1,
0.4629112, 1.157086, 0.3892619, 0.08627451, 0, 1, 1,
0.4640093, 1.792055, 0.2789187, 0.09019608, 0, 1, 1,
0.468116, -0.8033661, 2.698326, 0.09803922, 0, 1, 1,
0.4682544, 0.06560665, 2.115226, 0.1058824, 0, 1, 1,
0.4689002, 0.1898454, 1.263166, 0.1098039, 0, 1, 1,
0.4767419, 0.02317131, 1.370639, 0.1176471, 0, 1, 1,
0.4804618, -0.390883, 1.215815, 0.1215686, 0, 1, 1,
0.4846899, -0.7195669, 1.732224, 0.1294118, 0, 1, 1,
0.4855175, 1.614196, -0.8281915, 0.1333333, 0, 1, 1,
0.4872219, -0.2490758, 2.426068, 0.1411765, 0, 1, 1,
0.4874278, 0.7497118, -0.7492524, 0.145098, 0, 1, 1,
0.4879313, 0.1448915, 1.241244, 0.1529412, 0, 1, 1,
0.488396, -0.4340877, 0.6967794, 0.1568628, 0, 1, 1,
0.4916978, 1.254079, 0.4377616, 0.1647059, 0, 1, 1,
0.4991183, -0.3171602, 1.235592, 0.1686275, 0, 1, 1,
0.4997403, 1.658177, -0.5517237, 0.1764706, 0, 1, 1,
0.5009848, 0.09803108, 1.904957, 0.1803922, 0, 1, 1,
0.503203, 0.153621, 1.958222, 0.1882353, 0, 1, 1,
0.5040894, 0.1695857, 2.498209, 0.1921569, 0, 1, 1,
0.5042832, -0.09507661, 1.849128, 0.2, 0, 1, 1,
0.5044174, -0.5548226, 3.48144, 0.2078431, 0, 1, 1,
0.5066269, -1.771314, 1.492929, 0.2117647, 0, 1, 1,
0.5081751, -0.05519255, 2.510612, 0.2196078, 0, 1, 1,
0.5121219, 1.093516, -0.0149825, 0.2235294, 0, 1, 1,
0.5126436, 1.954398, 1.302999, 0.2313726, 0, 1, 1,
0.5138958, 0.5720685, 2.450384, 0.2352941, 0, 1, 1,
0.5195161, -0.0694177, 3.240438, 0.2431373, 0, 1, 1,
0.5223432, 0.4584877, 0.4780903, 0.2470588, 0, 1, 1,
0.5258319, 1.926977, -1.563873, 0.254902, 0, 1, 1,
0.530691, 0.8906913, 0.3513529, 0.2588235, 0, 1, 1,
0.5318872, -0.1010291, 4.048906, 0.2666667, 0, 1, 1,
0.5325125, -1.56056, 3.619798, 0.2705882, 0, 1, 1,
0.5382287, -0.172345, 1.849842, 0.2784314, 0, 1, 1,
0.539715, 0.1029425, 2.773168, 0.282353, 0, 1, 1,
0.5407062, 1.139593, 0.5184945, 0.2901961, 0, 1, 1,
0.5424052, 1.524217, 2.48862, 0.2941177, 0, 1, 1,
0.5447845, 0.4259471, 2.782915, 0.3019608, 0, 1, 1,
0.5475224, -0.454589, 1.417256, 0.3098039, 0, 1, 1,
0.5502623, 0.08654527, 0.7363431, 0.3137255, 0, 1, 1,
0.5524659, 1.527078, 0.8952711, 0.3215686, 0, 1, 1,
0.5561938, 1.864367, 0.3431168, 0.3254902, 0, 1, 1,
0.5583646, -0.4727916, 1.898746, 0.3333333, 0, 1, 1,
0.5608552, -1.265051, 3.294974, 0.3372549, 0, 1, 1,
0.5635715, 0.2239538, 1.840832, 0.345098, 0, 1, 1,
0.5636705, 1.565167, 1.177208, 0.3490196, 0, 1, 1,
0.5659614, -2.464124, 4.180104, 0.3568628, 0, 1, 1,
0.5704778, -1.731029, 2.821329, 0.3607843, 0, 1, 1,
0.5710607, 0.7448697, 1.265826, 0.3686275, 0, 1, 1,
0.5765319, -1.321237, 1.511617, 0.372549, 0, 1, 1,
0.577337, 0.5797611, 1.575933, 0.3803922, 0, 1, 1,
0.5818927, 0.3415934, 1.479919, 0.3843137, 0, 1, 1,
0.5819226, 0.6450315, -0.5382348, 0.3921569, 0, 1, 1,
0.5822871, -1.181318, 3.387766, 0.3960784, 0, 1, 1,
0.5894547, -0.8052749, 2.476552, 0.4039216, 0, 1, 1,
0.5970379, -0.485833, 2.439851, 0.4117647, 0, 1, 1,
0.6007414, -0.07306954, 1.45642, 0.4156863, 0, 1, 1,
0.6041635, -1.000546, 2.051686, 0.4235294, 0, 1, 1,
0.6064956, 0.6597314, 0.09498013, 0.427451, 0, 1, 1,
0.6114969, -0.4707784, 3.114634, 0.4352941, 0, 1, 1,
0.6129862, 0.4416612, 0.7819626, 0.4392157, 0, 1, 1,
0.6131452, 1.172843, -1.990325, 0.4470588, 0, 1, 1,
0.6133582, 1.262419, 1.001706, 0.4509804, 0, 1, 1,
0.617115, 0.8196601, 1.406076, 0.4588235, 0, 1, 1,
0.6208217, -0.7052371, 1.050241, 0.4627451, 0, 1, 1,
0.6228713, -1.553526, 3.125643, 0.4705882, 0, 1, 1,
0.6236598, -0.3901196, 2.539807, 0.4745098, 0, 1, 1,
0.6237513, 0.2470575, 1.370179, 0.4823529, 0, 1, 1,
0.6242251, -1.781959, 4.096611, 0.4862745, 0, 1, 1,
0.6260582, -0.9889136, 1.885726, 0.4941176, 0, 1, 1,
0.6311862, -1.130933, 2.535102, 0.5019608, 0, 1, 1,
0.6360191, 0.2348464, 1.180446, 0.5058824, 0, 1, 1,
0.6416095, -0.2334542, 2.521355, 0.5137255, 0, 1, 1,
0.6418627, -0.5777802, 2.074928, 0.5176471, 0, 1, 1,
0.6426086, 0.3594128, 1.084458, 0.5254902, 0, 1, 1,
0.6438536, -0.1891291, 0.9014549, 0.5294118, 0, 1, 1,
0.6444713, -0.3738984, 0.8592758, 0.5372549, 0, 1, 1,
0.6473567, -0.334246, 4.548628, 0.5411765, 0, 1, 1,
0.6488111, 0.009488141, 2.58039, 0.5490196, 0, 1, 1,
0.6509941, -0.5439096, 2.574946, 0.5529412, 0, 1, 1,
0.6615355, 0.5017518, 0.7487459, 0.5607843, 0, 1, 1,
0.6789988, 0.6498576, -1.407286, 0.5647059, 0, 1, 1,
0.6841711, -0.05858373, 1.6665, 0.572549, 0, 1, 1,
0.6946031, -0.007738743, 1.540501, 0.5764706, 0, 1, 1,
0.6951822, 0.8640064, 1.030772, 0.5843138, 0, 1, 1,
0.6972746, 0.6127923, 0.3294297, 0.5882353, 0, 1, 1,
0.7005226, 0.916123, 0.2973247, 0.5960785, 0, 1, 1,
0.7115549, 0.7767234, 0.8710404, 0.6039216, 0, 1, 1,
0.7181992, -0.3009171, 1.185876, 0.6078432, 0, 1, 1,
0.7184206, -1.037798, 3.458847, 0.6156863, 0, 1, 1,
0.7217812, -1.616799, 1.302439, 0.6196079, 0, 1, 1,
0.7245707, -1.15585, 2.740268, 0.627451, 0, 1, 1,
0.7261952, -0.995223, 2.504855, 0.6313726, 0, 1, 1,
0.7270303, -0.9706818, 3.039062, 0.6392157, 0, 1, 1,
0.732206, -1.940801, 1.767338, 0.6431373, 0, 1, 1,
0.744612, -1.773612, 2.406477, 0.6509804, 0, 1, 1,
0.7463297, 0.6271452, 0.9684477, 0.654902, 0, 1, 1,
0.7485485, -0.666693, -0.2128087, 0.6627451, 0, 1, 1,
0.7511719, -0.596202, 1.731871, 0.6666667, 0, 1, 1,
0.7520638, -1.853908, 3.608444, 0.6745098, 0, 1, 1,
0.7527546, 0.5168064, 0.06118454, 0.6784314, 0, 1, 1,
0.7566077, -1.939418, 4.02942, 0.6862745, 0, 1, 1,
0.7573157, -0.4433582, 2.390295, 0.6901961, 0, 1, 1,
0.7578295, -0.008019651, 2.664847, 0.6980392, 0, 1, 1,
0.7579938, 0.8401564, 0.6305423, 0.7058824, 0, 1, 1,
0.7597257, -0.2095611, 0.9241167, 0.7098039, 0, 1, 1,
0.7643037, -1.583384, -0.4161929, 0.7176471, 0, 1, 1,
0.765021, 0.2407473, 1.197221, 0.7215686, 0, 1, 1,
0.7692934, -0.1101758, 1.778184, 0.7294118, 0, 1, 1,
0.7708753, 0.4039493, 2.310867, 0.7333333, 0, 1, 1,
0.7755351, -0.5444307, 1.740517, 0.7411765, 0, 1, 1,
0.7820832, 0.02799663, 1.096802, 0.7450981, 0, 1, 1,
0.7860317, 0.3095045, 3.139081, 0.7529412, 0, 1, 1,
0.7902884, -0.1480316, 1.38613, 0.7568628, 0, 1, 1,
0.7903733, -0.4424423, 4.110198, 0.7647059, 0, 1, 1,
0.7923466, 1.04262, 2.756079, 0.7686275, 0, 1, 1,
0.7984145, 1.287674, -2.176449, 0.7764706, 0, 1, 1,
0.8031005, 0.9781791, 2.871503, 0.7803922, 0, 1, 1,
0.8038402, -0.4759313, 3.723817, 0.7882353, 0, 1, 1,
0.807977, -0.5660954, 2.49331, 0.7921569, 0, 1, 1,
0.8120559, -1.059653, 2.433934, 0.8, 0, 1, 1,
0.8129821, -0.3319259, 2.851723, 0.8078431, 0, 1, 1,
0.8245977, -0.3554928, 3.22406, 0.8117647, 0, 1, 1,
0.8259729, 0.1334769, 0.3418464, 0.8196079, 0, 1, 1,
0.8313736, 1.302057, 1.507178, 0.8235294, 0, 1, 1,
0.8324568, 1.060316, 0.3980408, 0.8313726, 0, 1, 1,
0.8325254, 0.8555222, 1.453378, 0.8352941, 0, 1, 1,
0.835658, 0.07431438, 2.812994, 0.8431373, 0, 1, 1,
0.8372865, 0.4664093, 2.17948, 0.8470588, 0, 1, 1,
0.8376099, 0.08639384, 0.9244283, 0.854902, 0, 1, 1,
0.8418772, 1.280336, 1.813287, 0.8588235, 0, 1, 1,
0.8479492, 1.441159, 0.09573025, 0.8666667, 0, 1, 1,
0.8522176, -0.1732378, 1.461651, 0.8705882, 0, 1, 1,
0.8577864, 0.1506063, 2.30036, 0.8784314, 0, 1, 1,
0.8580721, 0.1607257, -0.08434051, 0.8823529, 0, 1, 1,
0.8622912, -0.1656416, 1.924271, 0.8901961, 0, 1, 1,
0.8752185, 0.3922468, 0.9673189, 0.8941177, 0, 1, 1,
0.8785145, 2.300606, -0.8199627, 0.9019608, 0, 1, 1,
0.8802208, 0.5258675, 2.284189, 0.9098039, 0, 1, 1,
0.8864443, 1.451433, -0.7482526, 0.9137255, 0, 1, 1,
0.888411, 0.6125304, 0.3945553, 0.9215686, 0, 1, 1,
0.895687, -0.9757794, 2.002345, 0.9254902, 0, 1, 1,
0.90201, 1.117047, -0.6889997, 0.9333333, 0, 1, 1,
0.9025086, 1.701019, -0.3708238, 0.9372549, 0, 1, 1,
0.9037181, 0.5146902, 1.329146, 0.945098, 0, 1, 1,
0.9055338, 1.478334, -1.365495, 0.9490196, 0, 1, 1,
0.9094352, 0.9172509, 1.620526, 0.9568627, 0, 1, 1,
0.9118984, 0.6794712, 1.219639, 0.9607843, 0, 1, 1,
0.9123401, -0.8086225, 3.049729, 0.9686275, 0, 1, 1,
0.9206523, 0.6224641, 0.6960905, 0.972549, 0, 1, 1,
0.9224702, 1.378694, 1.201558, 0.9803922, 0, 1, 1,
0.9318339, 0.1491354, 1.885401, 0.9843137, 0, 1, 1,
0.9321513, -0.8683706, 1.627753, 0.9921569, 0, 1, 1,
0.9371129, 2.384411, -1.681553, 0.9960784, 0, 1, 1,
0.9389178, -0.2573949, 1.835539, 1, 0, 0.9960784, 1,
0.9466007, 0.6096734, 0.7919807, 1, 0, 0.9882353, 1,
0.9469881, 0.358096, 1.908638, 1, 0, 0.9843137, 1,
0.9539797, 1.295536, 0.8665534, 1, 0, 0.9764706, 1,
0.9621736, -0.236836, -0.8052941, 1, 0, 0.972549, 1,
0.9680086, 1.923656, 0.3279342, 1, 0, 0.9647059, 1,
0.9693637, 0.5303587, 0.7460298, 1, 0, 0.9607843, 1,
0.9720954, 0.4084803, 1.602108, 1, 0, 0.9529412, 1,
0.9751306, 0.1168016, 2.173144, 1, 0, 0.9490196, 1,
0.9826537, -0.5400131, 2.064905, 1, 0, 0.9411765, 1,
0.9831467, 0.6906332, 0.4315655, 1, 0, 0.9372549, 1,
0.9855116, -0.1687584, 1.454361, 1, 0, 0.9294118, 1,
0.9863956, 0.4748753, 0.06996267, 1, 0, 0.9254902, 1,
0.996657, -1.017288, 3.456933, 1, 0, 0.9176471, 1,
1.008509, 0.4841185, 0.4088101, 1, 0, 0.9137255, 1,
1.009414, -0.5364851, 1.276959, 1, 0, 0.9058824, 1,
1.012141, -0.1598551, 1.308382, 1, 0, 0.9019608, 1,
1.016139, 1.805417, -0.4495243, 1, 0, 0.8941177, 1,
1.017572, 1.582239, 1.516303, 1, 0, 0.8862745, 1,
1.017794, -0.4827055, 2.022277, 1, 0, 0.8823529, 1,
1.022366, -0.415839, 2.199067, 1, 0, 0.8745098, 1,
1.024335, -0.4846494, 1.883389, 1, 0, 0.8705882, 1,
1.027938, -0.9397812, 1.672588, 1, 0, 0.8627451, 1,
1.031844, 1.136202, 0.2175317, 1, 0, 0.8588235, 1,
1.032906, 1.450724, -0.3555604, 1, 0, 0.8509804, 1,
1.042135, 1.167936, -0.1898756, 1, 0, 0.8470588, 1,
1.042491, 0.9171219, 0.3950725, 1, 0, 0.8392157, 1,
1.051998, -0.03329497, 1.233507, 1, 0, 0.8352941, 1,
1.055784, 1.848945, 0.001314967, 1, 0, 0.827451, 1,
1.057544, 1.041941, -0.1375281, 1, 0, 0.8235294, 1,
1.058638, 0.2434483, -0.7418252, 1, 0, 0.8156863, 1,
1.064684, -0.2720453, 2.731284, 1, 0, 0.8117647, 1,
1.071057, -0.9009315, 2.411049, 1, 0, 0.8039216, 1,
1.072845, -0.9087153, 2.146985, 1, 0, 0.7960784, 1,
1.08412, 1.274626, -0.2156585, 1, 0, 0.7921569, 1,
1.088519, 0.2770151, 2.5525, 1, 0, 0.7843137, 1,
1.094437, 0.9123277, 1.639602, 1, 0, 0.7803922, 1,
1.097994, 0.3854003, 1.59426, 1, 0, 0.772549, 1,
1.09811, -0.782333, 1.837443, 1, 0, 0.7686275, 1,
1.098406, -1.18732, 2.900728, 1, 0, 0.7607843, 1,
1.106376, -1.471801, 1.96101, 1, 0, 0.7568628, 1,
1.119697, -1.587857, 2.677731, 1, 0, 0.7490196, 1,
1.120273, -2.536312, 3.315661, 1, 0, 0.7450981, 1,
1.121936, -0.4227145, 2.981887, 1, 0, 0.7372549, 1,
1.131778, 0.3110798, 1.160675, 1, 0, 0.7333333, 1,
1.136218, -2.463086, 2.418482, 1, 0, 0.7254902, 1,
1.143607, -0.6947846, 1.278161, 1, 0, 0.7215686, 1,
1.145665, -0.9390833, 0.5079758, 1, 0, 0.7137255, 1,
1.146628, 0.07539202, 0.5947708, 1, 0, 0.7098039, 1,
1.146905, -0.5961087, 2.277064, 1, 0, 0.7019608, 1,
1.149479, 0.8748707, 2.696607, 1, 0, 0.6941177, 1,
1.157253, 0.07244336, 0.9894569, 1, 0, 0.6901961, 1,
1.178525, -0.03174561, 0.6111008, 1, 0, 0.682353, 1,
1.180441, -0.2251119, 3.366467, 1, 0, 0.6784314, 1,
1.185876, 0.7897253, 0.6489834, 1, 0, 0.6705883, 1,
1.190084, -1.372584, 3.503403, 1, 0, 0.6666667, 1,
1.193133, -0.5243775, 2.105336, 1, 0, 0.6588235, 1,
1.199259, 0.4338738, 3.212172, 1, 0, 0.654902, 1,
1.200273, 0.05780201, 1.650577, 1, 0, 0.6470588, 1,
1.209613, -0.2285907, 1.011638, 1, 0, 0.6431373, 1,
1.21052, 1.047293, 0.8305277, 1, 0, 0.6352941, 1,
1.211839, -0.3548995, 3.596359, 1, 0, 0.6313726, 1,
1.212526, 1.387708, 0.3778765, 1, 0, 0.6235294, 1,
1.218269, 0.7652582, -0.04341673, 1, 0, 0.6196079, 1,
1.219112, 0.5981931, 1.956975, 1, 0, 0.6117647, 1,
1.232357, 0.3021876, 0.8136827, 1, 0, 0.6078432, 1,
1.237493, 1.497869, -0.7687849, 1, 0, 0.6, 1,
1.243293, 1.330686, 1.611669, 1, 0, 0.5921569, 1,
1.24619, 0.3482196, 2.990528, 1, 0, 0.5882353, 1,
1.246776, 0.4124865, -0.5695106, 1, 0, 0.5803922, 1,
1.247215, -2.444303, 2.943639, 1, 0, 0.5764706, 1,
1.250082, 0.5002823, 2.63608, 1, 0, 0.5686275, 1,
1.258897, -0.6918288, 3.902504, 1, 0, 0.5647059, 1,
1.259939, 0.8042373, 1.69892, 1, 0, 0.5568628, 1,
1.264133, -0.7029846, 2.46327, 1, 0, 0.5529412, 1,
1.273117, 0.1858108, 1.776996, 1, 0, 0.5450981, 1,
1.274536, 0.6565539, -1.260525, 1, 0, 0.5411765, 1,
1.275507, -1.627745, 3.584735, 1, 0, 0.5333334, 1,
1.276392, 0.4537211, 2.471452, 1, 0, 0.5294118, 1,
1.277951, -1.130501, 1.792631, 1, 0, 0.5215687, 1,
1.283244, -0.9301366, 3.003044, 1, 0, 0.5176471, 1,
1.283847, 0.8871378, 3.252043, 1, 0, 0.509804, 1,
1.289455, 0.5531531, 1.750497, 1, 0, 0.5058824, 1,
1.296, -1.267168, 5.171128, 1, 0, 0.4980392, 1,
1.310965, -0.7903439, 0.9239803, 1, 0, 0.4901961, 1,
1.33537, -0.9058585, 1.822322, 1, 0, 0.4862745, 1,
1.342871, 0.9360859, 1.458871, 1, 0, 0.4784314, 1,
1.359483, -0.6182168, 2.222219, 1, 0, 0.4745098, 1,
1.359932, 0.3324371, 1.98378, 1, 0, 0.4666667, 1,
1.360643, -1.118185, 2.088386, 1, 0, 0.4627451, 1,
1.361239, -1.130145, 3.420515, 1, 0, 0.454902, 1,
1.380628, 1.110473, 0.7486296, 1, 0, 0.4509804, 1,
1.385615, 0.7136505, 0.9343039, 1, 0, 0.4431373, 1,
1.386394, -0.2889971, 1.638591, 1, 0, 0.4392157, 1,
1.390123, -0.6610277, 2.876214, 1, 0, 0.4313726, 1,
1.390646, 0.4982044, 0.252227, 1, 0, 0.427451, 1,
1.390916, -1.724769, 1.337829, 1, 0, 0.4196078, 1,
1.39297, 0.954339, 1.007203, 1, 0, 0.4156863, 1,
1.396137, 0.7720218, 0.1175336, 1, 0, 0.4078431, 1,
1.400083, 1.44028, 1.856942, 1, 0, 0.4039216, 1,
1.415291, 0.8797841, 1.803934, 1, 0, 0.3960784, 1,
1.42041, 1.421412, 0.1532747, 1, 0, 0.3882353, 1,
1.422905, -0.0004505418, 0.3836422, 1, 0, 0.3843137, 1,
1.426433, 1.374745, -0.6436667, 1, 0, 0.3764706, 1,
1.428246, -0.4796832, 1.488698, 1, 0, 0.372549, 1,
1.443128, 0.4120699, 1.968503, 1, 0, 0.3647059, 1,
1.446224, 0.3198511, 1.634211, 1, 0, 0.3607843, 1,
1.450906, -0.2219402, 1.68875, 1, 0, 0.3529412, 1,
1.465848, 1.227742, -0.3187866, 1, 0, 0.3490196, 1,
1.471734, 0.1528285, 1.432375, 1, 0, 0.3411765, 1,
1.473512, 0.4877202, 1.70619, 1, 0, 0.3372549, 1,
1.481141, -1.229631, 1.652497, 1, 0, 0.3294118, 1,
1.482972, -1.133994, 2.485201, 1, 0, 0.3254902, 1,
1.505497, -0.1573793, 2.170258, 1, 0, 0.3176471, 1,
1.519781, -2.048579, 1.047786, 1, 0, 0.3137255, 1,
1.521006, -1.756891, 3.388194, 1, 0, 0.3058824, 1,
1.604614, -0.3071389, 2.510882, 1, 0, 0.2980392, 1,
1.609446, 0.46803, 2.376235, 1, 0, 0.2941177, 1,
1.612269, -0.09132537, 3.74694, 1, 0, 0.2862745, 1,
1.612855, 2.029945, 2.313018, 1, 0, 0.282353, 1,
1.617949, 0.3204559, -0.8035873, 1, 0, 0.2745098, 1,
1.619081, 0.835492, 0.05394707, 1, 0, 0.2705882, 1,
1.623899, -2.086428, 2.677789, 1, 0, 0.2627451, 1,
1.627732, -1.005609, 0.2582203, 1, 0, 0.2588235, 1,
1.632504, -0.09317479, 0.4410864, 1, 0, 0.2509804, 1,
1.632836, 1.113038, 0.5564871, 1, 0, 0.2470588, 1,
1.652498, 1.585865, -0.4872279, 1, 0, 0.2392157, 1,
1.657643, 1.238269, 0.9844081, 1, 0, 0.2352941, 1,
1.687549, -0.04562882, 0.493782, 1, 0, 0.227451, 1,
1.694904, 0.1626576, -0.1348608, 1, 0, 0.2235294, 1,
1.697842, -0.612074, 1.250394, 1, 0, 0.2156863, 1,
1.729031, -0.7574088, 3.450586, 1, 0, 0.2117647, 1,
1.744044, 0.02290348, 1.436513, 1, 0, 0.2039216, 1,
1.758719, 1.818956, 0.3133598, 1, 0, 0.1960784, 1,
1.79822, 0.3515669, -0.7839946, 1, 0, 0.1921569, 1,
1.836319, -0.9033041, 2.439688, 1, 0, 0.1843137, 1,
1.846674, 0.06581116, 1.151028, 1, 0, 0.1803922, 1,
1.855225, 0.7329116, -0.4602947, 1, 0, 0.172549, 1,
1.856595, -1.71256, 2.784035, 1, 0, 0.1686275, 1,
1.865769, -1.758019, 2.981925, 1, 0, 0.1607843, 1,
1.883264, -0.4420939, 3.763904, 1, 0, 0.1568628, 1,
1.886007, -1.470896, 0.6382652, 1, 0, 0.1490196, 1,
1.920413, -2.021487, 3.399302, 1, 0, 0.145098, 1,
1.940622, 0.2994595, 0.2392656, 1, 0, 0.1372549, 1,
1.953207, -0.3357714, 2.466377, 1, 0, 0.1333333, 1,
1.96397, -1.839432, 1.802341, 1, 0, 0.1254902, 1,
2.006864, -0.397259, 1.255263, 1, 0, 0.1215686, 1,
2.019232, -1.088782, 1.762452, 1, 0, 0.1137255, 1,
2.063522, -0.2589574, 1.684851, 1, 0, 0.1098039, 1,
2.070988, -0.5564243, 2.193564, 1, 0, 0.1019608, 1,
2.090346, 0.8317445, 1.331434, 1, 0, 0.09411765, 1,
2.102752, 1.449499, 1.5588, 1, 0, 0.09019608, 1,
2.110441, -0.2164105, 2.911776, 1, 0, 0.08235294, 1,
2.116988, -0.05164989, 2.017019, 1, 0, 0.07843138, 1,
2.119836, 0.4376894, 3.31268, 1, 0, 0.07058824, 1,
2.138281, -0.4070613, 0.06570196, 1, 0, 0.06666667, 1,
2.200148, -1.753616, 2.549695, 1, 0, 0.05882353, 1,
2.202765, 1.588338, 0.1809383, 1, 0, 0.05490196, 1,
2.229869, -0.4184119, 1.514452, 1, 0, 0.04705882, 1,
2.259193, -0.9828768, 1.764932, 1, 0, 0.04313726, 1,
2.27191, 1.128414, 2.185758, 1, 0, 0.03529412, 1,
2.294868, 0.04437022, 0.8251226, 1, 0, 0.03137255, 1,
2.325598, -1.417545, 0.927641, 1, 0, 0.02352941, 1,
2.415788, -2.035711, 3.661568, 1, 0, 0.01960784, 1,
2.48674, -1.897178, 1.833212, 1, 0, 0.01176471, 1,
2.560098, 0.6882052, 2.047897, 1, 0, 0.007843138, 1
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
-0.6416883, -3.804956, -6.691235, 0, -0.5, 0.5, 0.5,
-0.6416883, -3.804956, -6.691235, 1, -0.5, 0.5, 0.5,
-0.6416883, -3.804956, -6.691235, 1, 1.5, 0.5, 0.5,
-0.6416883, -3.804956, -6.691235, 0, 1.5, 0.5, 0.5
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
-4.928881, 0.3427079, -6.691235, 0, -0.5, 0.5, 0.5,
-4.928881, 0.3427079, -6.691235, 1, -0.5, 0.5, 0.5,
-4.928881, 0.3427079, -6.691235, 1, 1.5, 0.5, 0.5,
-4.928881, 0.3427079, -6.691235, 0, 1.5, 0.5, 0.5
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
-4.928881, -3.804956, 0.3475895, 0, -0.5, 0.5, 0.5,
-4.928881, -3.804956, 0.3475895, 1, -0.5, 0.5, 0.5,
-4.928881, -3.804956, 0.3475895, 1, 1.5, 0.5, 0.5,
-4.928881, -3.804956, 0.3475895, 0, 1.5, 0.5, 0.5
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
-3, -2.847803, -5.066891,
2, -2.847803, -5.066891,
-3, -2.847803, -5.066891,
-3, -3.007328, -5.337615,
-2, -2.847803, -5.066891,
-2, -3.007328, -5.337615,
-1, -2.847803, -5.066891,
-1, -3.007328, -5.337615,
0, -2.847803, -5.066891,
0, -3.007328, -5.337615,
1, -2.847803, -5.066891,
1, -3.007328, -5.337615,
2, -2.847803, -5.066891,
2, -3.007328, -5.337615
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
-3, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
-3, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
-3, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
-3, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5,
-2, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
-2, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
-2, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
-2, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5,
-1, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
-1, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
-1, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
-1, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5,
0, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
0, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
0, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
0, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5,
1, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
1, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
1, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
1, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5,
2, -3.326379, -5.879063, 0, -0.5, 0.5, 0.5,
2, -3.326379, -5.879063, 1, -0.5, 0.5, 0.5,
2, -3.326379, -5.879063, 1, 1.5, 0.5, 0.5,
2, -3.326379, -5.879063, 0, 1.5, 0.5, 0.5
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
-3.939529, -2, -5.066891,
-3.939529, 3, -5.066891,
-3.939529, -2, -5.066891,
-4.104421, -2, -5.337615,
-3.939529, -1, -5.066891,
-4.104421, -1, -5.337615,
-3.939529, 0, -5.066891,
-4.104421, 0, -5.337615,
-3.939529, 1, -5.066891,
-4.104421, 1, -5.337615,
-3.939529, 2, -5.066891,
-4.104421, 2, -5.337615,
-3.939529, 3, -5.066891,
-4.104421, 3, -5.337615
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
"-1",
"0",
"1",
"2",
"3"
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
-4.434205, -2, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, -2, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, -2, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, -2, -5.879063, 0, 1.5, 0.5, 0.5,
-4.434205, -1, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, -1, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, -1, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, -1, -5.879063, 0, 1.5, 0.5, 0.5,
-4.434205, 0, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, 0, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, 0, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, 0, -5.879063, 0, 1.5, 0.5, 0.5,
-4.434205, 1, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, 1, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, 1, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, 1, -5.879063, 0, 1.5, 0.5, 0.5,
-4.434205, 2, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, 2, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, 2, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, 2, -5.879063, 0, 1.5, 0.5, 0.5,
-4.434205, 3, -5.879063, 0, -0.5, 0.5, 0.5,
-4.434205, 3, -5.879063, 1, -0.5, 0.5, 0.5,
-4.434205, 3, -5.879063, 1, 1.5, 0.5, 0.5,
-4.434205, 3, -5.879063, 0, 1.5, 0.5, 0.5
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
-3.939529, -2.847803, -4,
-3.939529, -2.847803, 4,
-3.939529, -2.847803, -4,
-4.104421, -3.007328, -4,
-3.939529, -2.847803, -2,
-4.104421, -3.007328, -2,
-3.939529, -2.847803, 0,
-4.104421, -3.007328, 0,
-3.939529, -2.847803, 2,
-4.104421, -3.007328, 2,
-3.939529, -2.847803, 4,
-4.104421, -3.007328, 4
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
-4.434205, -3.326379, -4, 0, -0.5, 0.5, 0.5,
-4.434205, -3.326379, -4, 1, -0.5, 0.5, 0.5,
-4.434205, -3.326379, -4, 1, 1.5, 0.5, 0.5,
-4.434205, -3.326379, -4, 0, 1.5, 0.5, 0.5,
-4.434205, -3.326379, -2, 0, -0.5, 0.5, 0.5,
-4.434205, -3.326379, -2, 1, -0.5, 0.5, 0.5,
-4.434205, -3.326379, -2, 1, 1.5, 0.5, 0.5,
-4.434205, -3.326379, -2, 0, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 0, 0, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 0, 1, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 0, 1, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 0, 0, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 2, 0, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 2, 1, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 2, 1, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 2, 0, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 4, 0, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 4, 1, -0.5, 0.5, 0.5,
-4.434205, -3.326379, 4, 1, 1.5, 0.5, 0.5,
-4.434205, -3.326379, 4, 0, 1.5, 0.5, 0.5
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
-3.939529, -2.847803, -5.066891,
-3.939529, 3.533218, -5.066891,
-3.939529, -2.847803, 5.76207,
-3.939529, 3.533218, 5.76207,
-3.939529, -2.847803, -5.066891,
-3.939529, -2.847803, 5.76207,
-3.939529, 3.533218, -5.066891,
-3.939529, 3.533218, 5.76207,
-3.939529, -2.847803, -5.066891,
2.656152, -2.847803, -5.066891,
-3.939529, -2.847803, 5.76207,
2.656152, -2.847803, 5.76207,
-3.939529, 3.533218, -5.066891,
2.656152, 3.533218, -5.066891,
-3.939529, 3.533218, 5.76207,
2.656152, 3.533218, 5.76207,
2.656152, -2.847803, -5.066891,
2.656152, 3.533218, -5.066891,
2.656152, -2.847803, 5.76207,
2.656152, 3.533218, 5.76207,
2.656152, -2.847803, -5.066891,
2.656152, -2.847803, 5.76207,
2.656152, 3.533218, -5.066891,
2.656152, 3.533218, 5.76207
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
var radius = 7.579644;
var distance = 33.72269;
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
mvMatrix.translate( 0.6416883, -0.3427079, -0.3475895 );
mvMatrix.scale( 1.242519, 1.284318, 0.7567909 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72269);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


