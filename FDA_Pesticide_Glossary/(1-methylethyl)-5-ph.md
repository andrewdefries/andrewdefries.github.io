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
-2.953618, 0.269311, -2.033645, 1, 0, 0, 1,
-2.816723, -0.005850499, -0.01909965, 1, 0.007843138, 0, 1,
-2.796191, 0.9150481, -1.858744, 1, 0.01176471, 0, 1,
-2.687758, -1.532098, -3.775038, 1, 0.01960784, 0, 1,
-2.633009, 0.991462, -1.697546, 1, 0.02352941, 0, 1,
-2.540852, -1.02872, -4.01687, 1, 0.03137255, 0, 1,
-2.5324, 0.209377, -2.146404, 1, 0.03529412, 0, 1,
-2.50084, -0.7014922, -1.805738, 1, 0.04313726, 0, 1,
-2.471368, -0.2323117, -1.054746, 1, 0.04705882, 0, 1,
-2.414997, 0.3224947, -1.639638, 1, 0.05490196, 0, 1,
-2.400215, -0.4942149, -1.161422, 1, 0.05882353, 0, 1,
-2.395693, -0.5387504, -2.903658, 1, 0.06666667, 0, 1,
-2.371951, 0.8471425, -0.3760485, 1, 0.07058824, 0, 1,
-2.217133, -0.4253012, -3.204886, 1, 0.07843138, 0, 1,
-2.216936, -0.02943775, -1.888124, 1, 0.08235294, 0, 1,
-2.197622, -1.531535, -1.88855, 1, 0.09019608, 0, 1,
-2.196601, 0.7108219, -0.9575869, 1, 0.09411765, 0, 1,
-2.187324, 0.9096754, -2.02056, 1, 0.1019608, 0, 1,
-2.183272, -1.122481, -2.360837, 1, 0.1098039, 0, 1,
-2.158651, 0.04249109, -0.4854012, 1, 0.1137255, 0, 1,
-2.133525, 0.6472552, 0.5454364, 1, 0.1215686, 0, 1,
-2.130702, 0.6453109, 0.245342, 1, 0.1254902, 0, 1,
-2.127349, -0.8892921, -1.559252, 1, 0.1333333, 0, 1,
-2.097956, -0.6248378, -4.019082, 1, 0.1372549, 0, 1,
-2.061086, -1.484543, -2.008595, 1, 0.145098, 0, 1,
-2.058794, -0.6547722, -2.18964, 1, 0.1490196, 0, 1,
-2.041252, 1.488534, -2.732372, 1, 0.1568628, 0, 1,
-2.034435, 2.286683, -1.572105, 1, 0.1607843, 0, 1,
-2.020124, -0.2756723, -2.406909, 1, 0.1686275, 0, 1,
-2.010314, -1.453254, -4.94441, 1, 0.172549, 0, 1,
-1.996282, -0.7259028, 0.04912533, 1, 0.1803922, 0, 1,
-1.985787, 0.07730059, -1.091598, 1, 0.1843137, 0, 1,
-1.934197, 0.8570348, -0.6839013, 1, 0.1921569, 0, 1,
-1.931035, -0.1445923, -1.675393, 1, 0.1960784, 0, 1,
-1.927857, -0.4376613, -2.934228, 1, 0.2039216, 0, 1,
-1.927136, -0.3521636, 0.149069, 1, 0.2117647, 0, 1,
-1.920182, 2.111688, -0.7613866, 1, 0.2156863, 0, 1,
-1.91153, 0.07174801, -2.583488, 1, 0.2235294, 0, 1,
-1.901308, 1.470247, -1.845552, 1, 0.227451, 0, 1,
-1.889835, -0.9188893, -0.7977701, 1, 0.2352941, 0, 1,
-1.881263, -0.7723144, -1.315797, 1, 0.2392157, 0, 1,
-1.8811, -2.698333, -2.960136, 1, 0.2470588, 0, 1,
-1.856842, 2.822131, -0.8729509, 1, 0.2509804, 0, 1,
-1.846957, -0.450607, -0.7122088, 1, 0.2588235, 0, 1,
-1.837412, -0.8948832, -1.46235, 1, 0.2627451, 0, 1,
-1.837169, 0.9736594, -1.591413, 1, 0.2705882, 0, 1,
-1.835416, 0.1606189, -0.4807648, 1, 0.2745098, 0, 1,
-1.807139, 0.9277945, -0.4463686, 1, 0.282353, 0, 1,
-1.801677, 0.4317852, -0.2045067, 1, 0.2862745, 0, 1,
-1.796739, -0.5842338, -2.051701, 1, 0.2941177, 0, 1,
-1.75689, -0.00654593, -1.737674, 1, 0.3019608, 0, 1,
-1.754105, 1.413423, -0.416617, 1, 0.3058824, 0, 1,
-1.75023, -0.8370631, -2.602981, 1, 0.3137255, 0, 1,
-1.726545, -0.5588002, -0.147608, 1, 0.3176471, 0, 1,
-1.716156, 0.4655702, -0.9929498, 1, 0.3254902, 0, 1,
-1.703049, -0.7707808, -0.5082124, 1, 0.3294118, 0, 1,
-1.690444, 0.2214058, -1.295519, 1, 0.3372549, 0, 1,
-1.688191, -0.6984195, -1.995185, 1, 0.3411765, 0, 1,
-1.688082, -0.5427015, -1.673761, 1, 0.3490196, 0, 1,
-1.679935, 1.806362, -2.732596, 1, 0.3529412, 0, 1,
-1.674825, 0.4941933, -1.721053, 1, 0.3607843, 0, 1,
-1.661021, -0.1175996, -1.358498, 1, 0.3647059, 0, 1,
-1.638314, -0.7165353, -0.4322359, 1, 0.372549, 0, 1,
-1.612318, 0.3964474, -1.910061, 1, 0.3764706, 0, 1,
-1.609223, -1.150717, -1.690163, 1, 0.3843137, 0, 1,
-1.608271, 0.0946046, -1.991687, 1, 0.3882353, 0, 1,
-1.594295, -0.3158427, -1.716248, 1, 0.3960784, 0, 1,
-1.591898, 1.058091, 0.7670413, 1, 0.4039216, 0, 1,
-1.582065, -2.575233, -2.011216, 1, 0.4078431, 0, 1,
-1.54744, 0.5315059, -1.143677, 1, 0.4156863, 0, 1,
-1.546427, -0.6274365, -2.258271, 1, 0.4196078, 0, 1,
-1.542898, -0.03647435, -0.8824431, 1, 0.427451, 0, 1,
-1.541619, 0.06140316, -2.175648, 1, 0.4313726, 0, 1,
-1.525291, 0.05236555, -3.118894, 1, 0.4392157, 0, 1,
-1.504573, -0.8098606, -2.783321, 1, 0.4431373, 0, 1,
-1.504323, 2.104817, -1.62426, 1, 0.4509804, 0, 1,
-1.500386, -0.7631333, -2.32721, 1, 0.454902, 0, 1,
-1.495189, -0.9498076, -1.470443, 1, 0.4627451, 0, 1,
-1.485426, 0.02240226, -1.576716, 1, 0.4666667, 0, 1,
-1.484798, -1.403942, -0.690917, 1, 0.4745098, 0, 1,
-1.484087, 1.317451, -0.3682223, 1, 0.4784314, 0, 1,
-1.476604, -1.040699, -3.356997, 1, 0.4862745, 0, 1,
-1.475582, -0.2565373, -1.438912, 1, 0.4901961, 0, 1,
-1.45934, 1.14568, -1.473811, 1, 0.4980392, 0, 1,
-1.458363, -2.645215, -2.067452, 1, 0.5058824, 0, 1,
-1.4567, 1.088164, -1.650896, 1, 0.509804, 0, 1,
-1.454822, 2.26277, -0.9328335, 1, 0.5176471, 0, 1,
-1.4329, -0.9440864, -0.2445554, 1, 0.5215687, 0, 1,
-1.430616, -2.851523, -3.219568, 1, 0.5294118, 0, 1,
-1.42631, 1.703858, -0.3011752, 1, 0.5333334, 0, 1,
-1.42034, -0.1601541, -0.9193312, 1, 0.5411765, 0, 1,
-1.410208, 0.06549046, -1.018911, 1, 0.5450981, 0, 1,
-1.399344, 0.04420464, -0.9466226, 1, 0.5529412, 0, 1,
-1.391887, 0.4444925, -0.2556674, 1, 0.5568628, 0, 1,
-1.391438, -0.9351385, -4.594798, 1, 0.5647059, 0, 1,
-1.390302, 0.1067352, -0.696469, 1, 0.5686275, 0, 1,
-1.38515, 1.419552, 0.5332614, 1, 0.5764706, 0, 1,
-1.38505, 2.390109, 0.03771127, 1, 0.5803922, 0, 1,
-1.362371, -0.2436039, -1.287767, 1, 0.5882353, 0, 1,
-1.355697, -0.3279743, -2.923948, 1, 0.5921569, 0, 1,
-1.346168, 0.8618135, -1.905043, 1, 0.6, 0, 1,
-1.344953, 1.250728, -0.2573895, 1, 0.6078432, 0, 1,
-1.275846, -0.3324475, -1.114532, 1, 0.6117647, 0, 1,
-1.273553, -1.001808, -2.727334, 1, 0.6196079, 0, 1,
-1.269383, -0.20314, -1.469324, 1, 0.6235294, 0, 1,
-1.263951, -1.412448, -2.372646, 1, 0.6313726, 0, 1,
-1.257653, 0.05860965, -3.514491, 1, 0.6352941, 0, 1,
-1.254172, 0.7520647, -0.3937627, 1, 0.6431373, 0, 1,
-1.248323, 1.552804, -0.7735102, 1, 0.6470588, 0, 1,
-1.243119, 1.406719, -0.4961157, 1, 0.654902, 0, 1,
-1.238744, 0.1778863, -1.273313, 1, 0.6588235, 0, 1,
-1.238393, -0.462546, -2.419949, 1, 0.6666667, 0, 1,
-1.228081, 0.297965, -1.24426, 1, 0.6705883, 0, 1,
-1.226315, -1.394608, -3.002779, 1, 0.6784314, 0, 1,
-1.224437, 0.8824117, -0.04199506, 1, 0.682353, 0, 1,
-1.224097, -0.3426102, -1.754525, 1, 0.6901961, 0, 1,
-1.222479, 1.309037, -0.6881853, 1, 0.6941177, 0, 1,
-1.215893, 0.5922645, -1.483549, 1, 0.7019608, 0, 1,
-1.214193, -0.3807638, -3.039047, 1, 0.7098039, 0, 1,
-1.205369, -0.8088797, -2.236763, 1, 0.7137255, 0, 1,
-1.203689, -0.4295197, -4.062259, 1, 0.7215686, 0, 1,
-1.201657, 1.106838, -2.108853, 1, 0.7254902, 0, 1,
-1.200791, -2.02599, -1.857041, 1, 0.7333333, 0, 1,
-1.191843, 0.08346537, -2.124017, 1, 0.7372549, 0, 1,
-1.188565, -0.3241204, -0.108238, 1, 0.7450981, 0, 1,
-1.180878, 2.418886, -1.283647, 1, 0.7490196, 0, 1,
-1.176233, -0.03643436, -2.936955, 1, 0.7568628, 0, 1,
-1.173623, 0.3843599, -1.208449, 1, 0.7607843, 0, 1,
-1.167008, 0.8290988, -0.6331476, 1, 0.7686275, 0, 1,
-1.166335, -2.018951, -3.512249, 1, 0.772549, 0, 1,
-1.165707, 0.4644137, -0.6895388, 1, 0.7803922, 0, 1,
-1.162556, 0.4691465, -1.397213, 1, 0.7843137, 0, 1,
-1.160454, 0.1832707, -1.565302, 1, 0.7921569, 0, 1,
-1.15734, -0.9282666, -2.736831, 1, 0.7960784, 0, 1,
-1.149743, -0.8043008, -1.991067, 1, 0.8039216, 0, 1,
-1.140314, -0.650521, -4.315946, 1, 0.8117647, 0, 1,
-1.136687, 0.4364351, -0.3360413, 1, 0.8156863, 0, 1,
-1.13333, -0.7685608, -3.872409, 1, 0.8235294, 0, 1,
-1.131103, 0.2969462, -2.381576, 1, 0.827451, 0, 1,
-1.128695, -0.06678316, -1.831434, 1, 0.8352941, 0, 1,
-1.126075, -0.4207266, -3.153951, 1, 0.8392157, 0, 1,
-1.122819, -0.2040002, -3.783496, 1, 0.8470588, 0, 1,
-1.122188, -0.9463378, -3.033891, 1, 0.8509804, 0, 1,
-1.120832, 0.01335191, -1.780975, 1, 0.8588235, 0, 1,
-1.116214, 0.4431191, -0.9473312, 1, 0.8627451, 0, 1,
-1.094032, 0.6092769, -1.809534, 1, 0.8705882, 0, 1,
-1.092892, -0.007502867, -2.383131, 1, 0.8745098, 0, 1,
-1.089277, -1.90187, -3.320956, 1, 0.8823529, 0, 1,
-1.088042, 1.915001, -0.1716451, 1, 0.8862745, 0, 1,
-1.083375, -0.8534565, -2.234838, 1, 0.8941177, 0, 1,
-1.07619, -0.2503403, -0.3776366, 1, 0.8980392, 0, 1,
-1.067689, 0.4026338, -3.202578, 1, 0.9058824, 0, 1,
-1.066729, 1.444266, -2.643718, 1, 0.9137255, 0, 1,
-1.063923, 1.082211, -2.301042, 1, 0.9176471, 0, 1,
-1.062125, 0.4503688, -1.732163, 1, 0.9254902, 0, 1,
-1.060832, 0.5652169, -0.8325741, 1, 0.9294118, 0, 1,
-1.055924, -0.8907476, -2.553363, 1, 0.9372549, 0, 1,
-1.054442, 1.189003, 0.5137804, 1, 0.9411765, 0, 1,
-1.052523, 0.4152895, -1.347657, 1, 0.9490196, 0, 1,
-1.043231, -0.8218584, -2.240732, 1, 0.9529412, 0, 1,
-1.029366, 0.912501, -0.6851863, 1, 0.9607843, 0, 1,
-1.029264, 0.03769557, -0.4513234, 1, 0.9647059, 0, 1,
-1.026876, -0.6072836, -3.640845, 1, 0.972549, 0, 1,
-1.026708, 0.8382043, -0.5188719, 1, 0.9764706, 0, 1,
-1.026079, 0.654901, -0.2945256, 1, 0.9843137, 0, 1,
-1.018986, 0.6698316, -0.7883874, 1, 0.9882353, 0, 1,
-1.016756, -0.2266426, -1.186941, 1, 0.9960784, 0, 1,
-0.9998174, -0.709024, -2.074495, 0.9960784, 1, 0, 1,
-0.9955406, -1.152874, -2.948995, 0.9921569, 1, 0, 1,
-0.9938931, 0.03613334, -1.829261, 0.9843137, 1, 0, 1,
-0.9858565, 0.5815623, 0.8966446, 0.9803922, 1, 0, 1,
-0.9777198, -0.6392126, -2.619247, 0.972549, 1, 0, 1,
-0.9740877, -0.3936626, -0.6131357, 0.9686275, 1, 0, 1,
-0.960946, 1.458075, -0.8434941, 0.9607843, 1, 0, 1,
-0.95717, 0.6161416, 0.0896522, 0.9568627, 1, 0, 1,
-0.9564424, -0.3872473, -0.3462704, 0.9490196, 1, 0, 1,
-0.9491901, 0.5916327, -0.3509308, 0.945098, 1, 0, 1,
-0.9465603, -0.7015705, -1.976337, 0.9372549, 1, 0, 1,
-0.93849, 1.577866, -0.7805449, 0.9333333, 1, 0, 1,
-0.9367795, 0.1939386, -2.05564, 0.9254902, 1, 0, 1,
-0.9366242, 1.189272, -1.554764, 0.9215686, 1, 0, 1,
-0.9345555, 0.711346, -0.7606868, 0.9137255, 1, 0, 1,
-0.9260665, -0.02820052, -0.2455487, 0.9098039, 1, 0, 1,
-0.9252356, 0.9206043, -0.6250974, 0.9019608, 1, 0, 1,
-0.9244856, -0.05162724, -2.846681, 0.8941177, 1, 0, 1,
-0.9189982, -0.6230241, -2.718339, 0.8901961, 1, 0, 1,
-0.9176839, 0.607829, -0.40549, 0.8823529, 1, 0, 1,
-0.9170653, 0.2184401, -0.7824596, 0.8784314, 1, 0, 1,
-0.9140811, -0.5279579, -2.031922, 0.8705882, 1, 0, 1,
-0.9011139, 1.226195, -0.02004003, 0.8666667, 1, 0, 1,
-0.8993772, -0.9251646, -2.636853, 0.8588235, 1, 0, 1,
-0.898194, 0.7946404, -1.883467, 0.854902, 1, 0, 1,
-0.8969595, 1.952292, -0.6603295, 0.8470588, 1, 0, 1,
-0.8963279, 0.6599149, -0.8623981, 0.8431373, 1, 0, 1,
-0.8900002, 0.7921091, 0.7426617, 0.8352941, 1, 0, 1,
-0.887018, -0.574503, -1.670636, 0.8313726, 1, 0, 1,
-0.8857401, -1.419277, -3.849689, 0.8235294, 1, 0, 1,
-0.882385, -0.8861966, -1.603342, 0.8196079, 1, 0, 1,
-0.8817741, 0.3847122, -0.8203721, 0.8117647, 1, 0, 1,
-0.8748561, 0.8813957, -1.811573, 0.8078431, 1, 0, 1,
-0.8741281, 0.715383, 0.2802906, 0.8, 1, 0, 1,
-0.865617, 0.7493069, -0.3299305, 0.7921569, 1, 0, 1,
-0.8637046, -0.9648262, -2.775515, 0.7882353, 1, 0, 1,
-0.8634887, 0.8398225, -0.5304784, 0.7803922, 1, 0, 1,
-0.8626502, -0.9115343, -3.223097, 0.7764706, 1, 0, 1,
-0.8583736, 0.594392, -0.1823034, 0.7686275, 1, 0, 1,
-0.8564616, -0.9174113, -3.724081, 0.7647059, 1, 0, 1,
-0.8558099, -0.167081, -0.6323974, 0.7568628, 1, 0, 1,
-0.8523012, 0.4237463, -0.4677851, 0.7529412, 1, 0, 1,
-0.8510549, -0.2701386, 0.4672902, 0.7450981, 1, 0, 1,
-0.8498203, 1.960033, -1.793577, 0.7411765, 1, 0, 1,
-0.845259, -1.36839, -1.694638, 0.7333333, 1, 0, 1,
-0.8431766, 2.176121, 1.645018, 0.7294118, 1, 0, 1,
-0.8426671, 0.4924138, -2.256657, 0.7215686, 1, 0, 1,
-0.8420476, 0.3000287, -0.07486562, 0.7176471, 1, 0, 1,
-0.833493, -0.1010249, -2.03321, 0.7098039, 1, 0, 1,
-0.8323365, -0.3054249, -3.521155, 0.7058824, 1, 0, 1,
-0.8252364, 1.335007, -0.1760529, 0.6980392, 1, 0, 1,
-0.81099, 0.5489045, -0.8087698, 0.6901961, 1, 0, 1,
-0.8064448, -0.5868101, -3.173326, 0.6862745, 1, 0, 1,
-0.8061852, 0.2422349, -0.2441882, 0.6784314, 1, 0, 1,
-0.8054283, 0.04832528, -2.790734, 0.6745098, 1, 0, 1,
-0.7944409, -0.2372122, -0.6341044, 0.6666667, 1, 0, 1,
-0.7930122, -0.03422528, -0.07520559, 0.6627451, 1, 0, 1,
-0.7893068, -0.08260242, -1.101173, 0.654902, 1, 0, 1,
-0.7892349, 0.7593578, -1.740591, 0.6509804, 1, 0, 1,
-0.7765006, 0.7926461, -1.836743, 0.6431373, 1, 0, 1,
-0.7738917, 1.894237, 0.3670362, 0.6392157, 1, 0, 1,
-0.7738761, 1.079694, 0.07594429, 0.6313726, 1, 0, 1,
-0.7735564, -0.2735071, -1.462327, 0.627451, 1, 0, 1,
-0.7709818, 0.4740206, -0.8041176, 0.6196079, 1, 0, 1,
-0.7637685, 0.4848036, -1.00478, 0.6156863, 1, 0, 1,
-0.7635759, 0.3415948, -2.82502, 0.6078432, 1, 0, 1,
-0.7556074, 0.7730093, 0.3808484, 0.6039216, 1, 0, 1,
-0.7549086, -1.280431, -1.828003, 0.5960785, 1, 0, 1,
-0.7519172, -0.03675125, -1.640295, 0.5882353, 1, 0, 1,
-0.7416166, 1.179222, -0.351773, 0.5843138, 1, 0, 1,
-0.7411453, 0.6228487, 0.3308359, 0.5764706, 1, 0, 1,
-0.7348104, 0.9175154, -0.689428, 0.572549, 1, 0, 1,
-0.7346899, -1.832072, -3.588872, 0.5647059, 1, 0, 1,
-0.73373, 1.160003, -1.964703, 0.5607843, 1, 0, 1,
-0.7311277, -0.4425426, -3.306591, 0.5529412, 1, 0, 1,
-0.7255378, 1.657312, 1.062017, 0.5490196, 1, 0, 1,
-0.7206124, -0.9284231, -3.237672, 0.5411765, 1, 0, 1,
-0.7183181, 0.1792315, -2.984557, 0.5372549, 1, 0, 1,
-0.7137327, 0.9730024, -0.1584519, 0.5294118, 1, 0, 1,
-0.7136558, -1.372297, -2.883536, 0.5254902, 1, 0, 1,
-0.7125621, 1.68235, 1.102972, 0.5176471, 1, 0, 1,
-0.707342, 0.3479323, -1.395693, 0.5137255, 1, 0, 1,
-0.7055916, 0.2473389, -0.9607143, 0.5058824, 1, 0, 1,
-0.6957811, 0.1421843, -0.616097, 0.5019608, 1, 0, 1,
-0.6886973, -1.629402, -3.334867, 0.4941176, 1, 0, 1,
-0.685135, -1.517942, -3.221324, 0.4862745, 1, 0, 1,
-0.6773477, -0.2137387, -3.049976, 0.4823529, 1, 0, 1,
-0.6750529, 0.8711252, -1.554364, 0.4745098, 1, 0, 1,
-0.6699215, 1.854073, -0.7209138, 0.4705882, 1, 0, 1,
-0.6682853, -1.604878, -2.801335, 0.4627451, 1, 0, 1,
-0.6659948, -0.09698093, -0.1056372, 0.4588235, 1, 0, 1,
-0.6650774, -0.3705937, -2.032612, 0.4509804, 1, 0, 1,
-0.6647546, 0.04097126, -2.584338, 0.4470588, 1, 0, 1,
-0.6643461, -0.4249736, -3.545348, 0.4392157, 1, 0, 1,
-0.6627853, 0.1030701, -3.175101, 0.4352941, 1, 0, 1,
-0.6616939, 0.6982919, 0.6950117, 0.427451, 1, 0, 1,
-0.65948, 0.6373, -1.141945, 0.4235294, 1, 0, 1,
-0.6591945, -0.4773478, -1.58476, 0.4156863, 1, 0, 1,
-0.658758, 0.2984416, -0.1184921, 0.4117647, 1, 0, 1,
-0.6569306, 0.7526603, 0.9634779, 0.4039216, 1, 0, 1,
-0.6511478, 1.276465, 1.512002, 0.3960784, 1, 0, 1,
-0.6497193, 0.3157937, -2.141364, 0.3921569, 1, 0, 1,
-0.6471879, -0.3843602, -2.879002, 0.3843137, 1, 0, 1,
-0.6313283, 1.016435, 0.1318065, 0.3803922, 1, 0, 1,
-0.6283812, 0.4853452, -0.7434228, 0.372549, 1, 0, 1,
-0.620082, 0.8738727, -0.6093324, 0.3686275, 1, 0, 1,
-0.6193349, -0.2652813, -2.973242, 0.3607843, 1, 0, 1,
-0.6188088, 1.027195, -0.4585212, 0.3568628, 1, 0, 1,
-0.6178951, 0.05294602, -1.293083, 0.3490196, 1, 0, 1,
-0.6176847, 0.366743, -1.100334, 0.345098, 1, 0, 1,
-0.6165168, -1.938365, -3.479166, 0.3372549, 1, 0, 1,
-0.614305, -0.9276889, -2.043865, 0.3333333, 1, 0, 1,
-0.6142316, 0.7345856, -0.5168471, 0.3254902, 1, 0, 1,
-0.6117958, 0.08195022, -1.736714, 0.3215686, 1, 0, 1,
-0.6030404, 0.5291248, -0.3532574, 0.3137255, 1, 0, 1,
-0.6029052, -0.1987194, -1.004691, 0.3098039, 1, 0, 1,
-0.6024844, 0.3936916, -1.432428, 0.3019608, 1, 0, 1,
-0.5940047, -1.569938, -3.887899, 0.2941177, 1, 0, 1,
-0.5868715, -1.34012, -1.157091, 0.2901961, 1, 0, 1,
-0.58235, -0.4358876, -2.998889, 0.282353, 1, 0, 1,
-0.5805752, 0.757851, -1.226288, 0.2784314, 1, 0, 1,
-0.5801586, -1.861851, -2.874239, 0.2705882, 1, 0, 1,
-0.5772455, -1.185111, -2.492054, 0.2666667, 1, 0, 1,
-0.5710443, -1.572263, -4.711555, 0.2588235, 1, 0, 1,
-0.5677103, -0.4971929, -2.484915, 0.254902, 1, 0, 1,
-0.5632945, 1.074658, -1.342005, 0.2470588, 1, 0, 1,
-0.5620694, 0.03539253, -1.951806, 0.2431373, 1, 0, 1,
-0.5618673, -0.5102864, -2.441712, 0.2352941, 1, 0, 1,
-0.5603801, -0.5405199, -1.080141, 0.2313726, 1, 0, 1,
-0.5596639, -0.1179297, -2.884238, 0.2235294, 1, 0, 1,
-0.5569409, -2.32712, -4.369498, 0.2196078, 1, 0, 1,
-0.5567834, 0.3578201, -1.114124, 0.2117647, 1, 0, 1,
-0.5544146, -1.343274, -3.576794, 0.2078431, 1, 0, 1,
-0.5542489, 1.791409, 0.02914012, 0.2, 1, 0, 1,
-0.5534896, 0.5867131, -0.3937162, 0.1921569, 1, 0, 1,
-0.5487362, 2.610266, -0.7163836, 0.1882353, 1, 0, 1,
-0.5417761, 1.605181, 0.484402, 0.1803922, 1, 0, 1,
-0.5363658, -0.6350721, -3.089507, 0.1764706, 1, 0, 1,
-0.5351162, -1.856298, -2.864602, 0.1686275, 1, 0, 1,
-0.5336933, -0.7703952, -1.539405, 0.1647059, 1, 0, 1,
-0.5302833, 0.3847336, 0.2435043, 0.1568628, 1, 0, 1,
-0.5272717, 1.121444, 0.5153078, 0.1529412, 1, 0, 1,
-0.5269786, 0.5414776, -2.002705, 0.145098, 1, 0, 1,
-0.5197868, -0.1149933, -1.611603, 0.1411765, 1, 0, 1,
-0.511184, -0.8122183, -2.411515, 0.1333333, 1, 0, 1,
-0.5099057, 0.4594702, -0.363173, 0.1294118, 1, 0, 1,
-0.5083283, 0.5935773, -1.085609, 0.1215686, 1, 0, 1,
-0.506172, 0.3640619, -1.220343, 0.1176471, 1, 0, 1,
-0.5004733, -1.036763, -1.877792, 0.1098039, 1, 0, 1,
-0.4994079, 1.826169, 0.01845478, 0.1058824, 1, 0, 1,
-0.4989796, -0.08859055, -2.137808, 0.09803922, 1, 0, 1,
-0.4983812, -0.4548949, -1.914307, 0.09019608, 1, 0, 1,
-0.4977079, -1.397961, -2.258909, 0.08627451, 1, 0, 1,
-0.4957033, 0.3187015, 0.06122219, 0.07843138, 1, 0, 1,
-0.4952787, -0.8135374, -2.185212, 0.07450981, 1, 0, 1,
-0.4854453, -0.1322424, -1.128361, 0.06666667, 1, 0, 1,
-0.4839947, 1.653459, 0.5550482, 0.0627451, 1, 0, 1,
-0.4818679, 0.7041373, 1.251184, 0.05490196, 1, 0, 1,
-0.4787595, 2.590849, 0.1984375, 0.05098039, 1, 0, 1,
-0.4783244, 0.4176529, -2.19106, 0.04313726, 1, 0, 1,
-0.4739152, 0.5773167, 0.5727706, 0.03921569, 1, 0, 1,
-0.4737216, -0.833452, -1.371998, 0.03137255, 1, 0, 1,
-0.4709897, -1.529922, -1.647923, 0.02745098, 1, 0, 1,
-0.4709144, -0.066291, -1.780171, 0.01960784, 1, 0, 1,
-0.4692664, 0.8789944, -0.615464, 0.01568628, 1, 0, 1,
-0.4692473, -0.728828, -2.835478, 0.007843138, 1, 0, 1,
-0.4657807, -1.266233, -2.43823, 0.003921569, 1, 0, 1,
-0.4636914, 1.166779, 1.279086, 0, 1, 0.003921569, 1,
-0.4629312, 0.409097, -1.393851, 0, 1, 0.01176471, 1,
-0.4600695, 1.530455, 0.007671801, 0, 1, 0.01568628, 1,
-0.4431161, 0.2303286, -1.411385, 0, 1, 0.02352941, 1,
-0.4424116, 1.922318, -0.4452111, 0, 1, 0.02745098, 1,
-0.4404473, 1.204951, 0.7800538, 0, 1, 0.03529412, 1,
-0.4395196, 0.8224089, -1.440095, 0, 1, 0.03921569, 1,
-0.4389681, -0.007589488, -1.445185, 0, 1, 0.04705882, 1,
-0.4364945, -0.2607708, -0.3146286, 0, 1, 0.05098039, 1,
-0.4334472, -0.4042554, -2.55011, 0, 1, 0.05882353, 1,
-0.4316793, -0.5545641, -3.246357, 0, 1, 0.0627451, 1,
-0.4291513, -1.091246, -2.21662, 0, 1, 0.07058824, 1,
-0.422009, 1.586384, -0.4289237, 0, 1, 0.07450981, 1,
-0.4168837, -0.4510064, -1.884805, 0, 1, 0.08235294, 1,
-0.4148548, 0.6882504, -1.388279, 0, 1, 0.08627451, 1,
-0.4148353, -0.263999, -0.8291664, 0, 1, 0.09411765, 1,
-0.4091823, -0.615826, -3.478357, 0, 1, 0.1019608, 1,
-0.4068968, -0.3333159, -1.080836, 0, 1, 0.1058824, 1,
-0.4067039, 1.159667, -1.636524, 0, 1, 0.1137255, 1,
-0.4065569, -1.293389, -1.223918, 0, 1, 0.1176471, 1,
-0.4010725, 1.269533, 0.7919799, 0, 1, 0.1254902, 1,
-0.3946417, 0.9508076, -0.4755746, 0, 1, 0.1294118, 1,
-0.3878435, 0.00439467, -1.827749, 0, 1, 0.1372549, 1,
-0.3854016, -0.515535, -2.205038, 0, 1, 0.1411765, 1,
-0.3846185, -0.752986, -1.848927, 0, 1, 0.1490196, 1,
-0.381852, 0.3093865, -0.3426597, 0, 1, 0.1529412, 1,
-0.3793888, -0.6896015, -1.25155, 0, 1, 0.1607843, 1,
-0.3763654, 0.9016076, 0.1525885, 0, 1, 0.1647059, 1,
-0.3715396, -0.4299935, -1.057883, 0, 1, 0.172549, 1,
-0.3679819, 0.2178559, -1.096211, 0, 1, 0.1764706, 1,
-0.3609726, 0.2461793, -0.3443632, 0, 1, 0.1843137, 1,
-0.3594769, 0.2493267, -1.348181, 0, 1, 0.1882353, 1,
-0.3584975, -2.05594, -3.15846, 0, 1, 0.1960784, 1,
-0.3498898, 0.3116603, -0.8612205, 0, 1, 0.2039216, 1,
-0.3430971, 2.283723, 0.3516562, 0, 1, 0.2078431, 1,
-0.3423741, -1.177306, -3.504962, 0, 1, 0.2156863, 1,
-0.3373407, -0.491899, -2.735774, 0, 1, 0.2196078, 1,
-0.3367267, -0.4530964, -2.114666, 0, 1, 0.227451, 1,
-0.3309241, 0.04438628, -1.098252, 0, 1, 0.2313726, 1,
-0.3291699, -1.230718, -2.420842, 0, 1, 0.2392157, 1,
-0.3273203, 0.4809699, -0.9881073, 0, 1, 0.2431373, 1,
-0.3267308, -0.6300573, -2.426511, 0, 1, 0.2509804, 1,
-0.3265499, 0.6176906, 0.0979545, 0, 1, 0.254902, 1,
-0.3263461, -1.283521, -2.321974, 0, 1, 0.2627451, 1,
-0.3252443, 1.305892, -1.823799, 0, 1, 0.2666667, 1,
-0.3246704, -1.706784, -4.385651, 0, 1, 0.2745098, 1,
-0.3234012, -0.5836821, -3.640532, 0, 1, 0.2784314, 1,
-0.3210647, -0.6981061, -3.841612, 0, 1, 0.2862745, 1,
-0.32032, 0.3734843, -1.626002, 0, 1, 0.2901961, 1,
-0.3147635, -0.08797783, -3.238677, 0, 1, 0.2980392, 1,
-0.3081943, 0.3499849, -1.501536, 0, 1, 0.3058824, 1,
-0.3062758, -1.944159, -0.5930875, 0, 1, 0.3098039, 1,
-0.3057488, 1.886281, -0.544017, 0, 1, 0.3176471, 1,
-0.2967226, -1.467715, -3.541185, 0, 1, 0.3215686, 1,
-0.2959379, -0.05566251, -2.237699, 0, 1, 0.3294118, 1,
-0.2918518, -0.2922065, -3.674642, 0, 1, 0.3333333, 1,
-0.2874148, 0.4810308, -0.591556, 0, 1, 0.3411765, 1,
-0.2873934, -0.9393507, -4.612537, 0, 1, 0.345098, 1,
-0.2862792, 1.095085, 0.06254107, 0, 1, 0.3529412, 1,
-0.2843069, 0.3371463, -0.4823625, 0, 1, 0.3568628, 1,
-0.2805292, -0.5484779, -3.720473, 0, 1, 0.3647059, 1,
-0.2782006, 1.774436, -1.260189, 0, 1, 0.3686275, 1,
-0.2770622, 1.213871, -1.160005, 0, 1, 0.3764706, 1,
-0.2765126, 0.5376399, -0.8591711, 0, 1, 0.3803922, 1,
-0.275666, 0.07117452, -1.672822, 0, 1, 0.3882353, 1,
-0.2743359, 0.3119041, -0.5107709, 0, 1, 0.3921569, 1,
-0.2725998, 0.7221202, -1.925127, 0, 1, 0.4, 1,
-0.2718665, -1.591716, -3.282083, 0, 1, 0.4078431, 1,
-0.2693949, -0.8998774, -3.461863, 0, 1, 0.4117647, 1,
-0.2648121, 1.311508, 1.014557, 0, 1, 0.4196078, 1,
-0.2593392, -0.6947726, -5.342846, 0, 1, 0.4235294, 1,
-0.2580656, -0.3989012, -2.275787, 0, 1, 0.4313726, 1,
-0.253933, -0.06201247, -2.254533, 0, 1, 0.4352941, 1,
-0.2499121, 0.0009179355, -1.092437, 0, 1, 0.4431373, 1,
-0.2459921, -0.7934313, -2.543694, 0, 1, 0.4470588, 1,
-0.2440131, -2.076123, -2.269329, 0, 1, 0.454902, 1,
-0.2433805, -0.2043622, -2.191875, 0, 1, 0.4588235, 1,
-0.2431301, -0.3918357, -3.616372, 0, 1, 0.4666667, 1,
-0.2418272, 1.290283, 0.1812381, 0, 1, 0.4705882, 1,
-0.240089, 0.6934497, -2.782114, 0, 1, 0.4784314, 1,
-0.2397179, 1.208221, 0.6996514, 0, 1, 0.4823529, 1,
-0.2357997, 1.725345, 0.3630154, 0, 1, 0.4901961, 1,
-0.2308165, 0.35585, -0.8314503, 0, 1, 0.4941176, 1,
-0.2281674, 0.6114484, -0.8283235, 0, 1, 0.5019608, 1,
-0.2213748, 0.7094935, -0.03200145, 0, 1, 0.509804, 1,
-0.2209799, -1.488579, -4.282947, 0, 1, 0.5137255, 1,
-0.2200175, -0.8696195, -3.369301, 0, 1, 0.5215687, 1,
-0.2194835, -1.358555, -3.667825, 0, 1, 0.5254902, 1,
-0.2165648, -0.8429612, -2.658534, 0, 1, 0.5333334, 1,
-0.2161151, -0.3583638, -3.805683, 0, 1, 0.5372549, 1,
-0.215107, -0.279406, -3.42566, 0, 1, 0.5450981, 1,
-0.2140626, -2.178436, -2.470854, 0, 1, 0.5490196, 1,
-0.2124103, -0.7229751, -1.088751, 0, 1, 0.5568628, 1,
-0.2092948, -1.063875, -1.564222, 0, 1, 0.5607843, 1,
-0.2078301, -1.400912, -2.84016, 0, 1, 0.5686275, 1,
-0.2030595, -0.07583547, -1.957844, 0, 1, 0.572549, 1,
-0.2026314, -0.1666172, -3.753527, 0, 1, 0.5803922, 1,
-0.2014756, 2.274611, -0.008548501, 0, 1, 0.5843138, 1,
-0.2012719, -1.396371, -2.649589, 0, 1, 0.5921569, 1,
-0.1972624, 0.5758387, -0.4920094, 0, 1, 0.5960785, 1,
-0.193955, -0.1661999, -3.097371, 0, 1, 0.6039216, 1,
-0.1921669, 1.118348, 0.5271192, 0, 1, 0.6117647, 1,
-0.1911981, -0.6212264, -4.776432, 0, 1, 0.6156863, 1,
-0.1892478, 0.1069951, -0.1101497, 0, 1, 0.6235294, 1,
-0.1892147, 0.8996943, 0.2537279, 0, 1, 0.627451, 1,
-0.1891097, -0.7219556, -4.037829, 0, 1, 0.6352941, 1,
-0.1884712, -0.9446151, -3.422293, 0, 1, 0.6392157, 1,
-0.1869671, 1.165497, 0.1631108, 0, 1, 0.6470588, 1,
-0.1837295, 0.779052, 0.4941875, 0, 1, 0.6509804, 1,
-0.1835648, -0.3449229, -4.035811, 0, 1, 0.6588235, 1,
-0.1726732, 0.1919602, -0.4164697, 0, 1, 0.6627451, 1,
-0.169911, 0.3554194, -2.239802, 0, 1, 0.6705883, 1,
-0.1693766, 0.9842881, 0.01902958, 0, 1, 0.6745098, 1,
-0.1668922, -0.2515566, -2.722644, 0, 1, 0.682353, 1,
-0.1657963, 0.8710541, 0.2403252, 0, 1, 0.6862745, 1,
-0.1620264, 1.447796, -0.4080116, 0, 1, 0.6941177, 1,
-0.1497088, -1.024922, -3.187643, 0, 1, 0.7019608, 1,
-0.1478833, 1.119157, 0.8948405, 0, 1, 0.7058824, 1,
-0.1472556, -0.09993818, -1.887205, 0, 1, 0.7137255, 1,
-0.146724, -1.703749, -2.263211, 0, 1, 0.7176471, 1,
-0.1444467, 0.8260484, -1.52717, 0, 1, 0.7254902, 1,
-0.140809, 0.768162, -0.4177024, 0, 1, 0.7294118, 1,
-0.133363, 0.1891914, -0.4255445, 0, 1, 0.7372549, 1,
-0.1330711, 0.0002908487, -2.218549, 0, 1, 0.7411765, 1,
-0.132833, 0.3205385, -0.04317359, 0, 1, 0.7490196, 1,
-0.1304266, -0.8002964, -2.837678, 0, 1, 0.7529412, 1,
-0.1292959, 1.088488, -0.8231575, 0, 1, 0.7607843, 1,
-0.1289984, -0.2911259, -1.275117, 0, 1, 0.7647059, 1,
-0.1287622, 0.2130581, 0.3683609, 0, 1, 0.772549, 1,
-0.1283857, 0.9249259, -0.8737015, 0, 1, 0.7764706, 1,
-0.1266976, 1.929451, -0.8936402, 0, 1, 0.7843137, 1,
-0.1239539, 0.09133539, -0.9912329, 0, 1, 0.7882353, 1,
-0.1214647, -0.2809302, -2.632024, 0, 1, 0.7960784, 1,
-0.1197643, 0.7256227, -0.5628151, 0, 1, 0.8039216, 1,
-0.1192904, -1.621164, -2.777201, 0, 1, 0.8078431, 1,
-0.1132005, -0.5186592, -2.724313, 0, 1, 0.8156863, 1,
-0.1117033, -0.1571896, -1.910387, 0, 1, 0.8196079, 1,
-0.1114501, 0.2183701, -0.2106206, 0, 1, 0.827451, 1,
-0.1108629, 0.9702114, -1.201293, 0, 1, 0.8313726, 1,
-0.1107636, -0.3543434, -1.716012, 0, 1, 0.8392157, 1,
-0.108985, -1.780499, -2.843258, 0, 1, 0.8431373, 1,
-0.1066574, 1.159086, 0.2696266, 0, 1, 0.8509804, 1,
-0.1049144, 0.5963126, -1.50976, 0, 1, 0.854902, 1,
-0.1000459, -1.082312, -3.223998, 0, 1, 0.8627451, 1,
-0.09980541, 0.1251382, -1.165068, 0, 1, 0.8666667, 1,
-0.09933525, -0.1644415, -1.75976, 0, 1, 0.8745098, 1,
-0.0975734, 0.8158448, -0.01297151, 0, 1, 0.8784314, 1,
-0.09523063, 1.23251, -0.7119753, 0, 1, 0.8862745, 1,
-0.09145804, 0.8116927, -2.383216, 0, 1, 0.8901961, 1,
-0.08992175, -0.7197549, -3.052304, 0, 1, 0.8980392, 1,
-0.08711124, 1.467932, 0.3172456, 0, 1, 0.9058824, 1,
-0.0860805, -0.5280243, -3.787719, 0, 1, 0.9098039, 1,
-0.08349351, 0.3069246, 0.7542505, 0, 1, 0.9176471, 1,
-0.08234797, 1.356, 0.4322142, 0, 1, 0.9215686, 1,
-0.08104245, -0.9884635, -5.140676, 0, 1, 0.9294118, 1,
-0.07975395, 1.250831, -2.334575, 0, 1, 0.9333333, 1,
-0.07658079, -0.3543353, -0.5289493, 0, 1, 0.9411765, 1,
-0.07142419, 0.6071478, -0.8815622, 0, 1, 0.945098, 1,
-0.07115695, -0.07910137, -3.239804, 0, 1, 0.9529412, 1,
-0.07053653, 1.008229, -0.5927063, 0, 1, 0.9568627, 1,
-0.06798255, -0.05675427, -2.086851, 0, 1, 0.9647059, 1,
-0.06707054, -1.511365, -2.559685, 0, 1, 0.9686275, 1,
-0.06407998, 1.081636, -0.9205447, 0, 1, 0.9764706, 1,
-0.0631566, -1.636693, -6.807231, 0, 1, 0.9803922, 1,
-0.05974131, -0.5378208, -2.677842, 0, 1, 0.9882353, 1,
-0.05740779, 1.163004, -1.48355, 0, 1, 0.9921569, 1,
-0.05717843, 0.07409765, -0.928165, 0, 1, 1, 1,
-0.05596395, 0.8428516, 0.4320002, 0, 0.9921569, 1, 1,
-0.05561437, -0.7028286, -2.012313, 0, 0.9882353, 1, 1,
-0.05342956, 1.364695, -1.079193, 0, 0.9803922, 1, 1,
-0.0522433, 1.166363, -0.3258688, 0, 0.9764706, 1, 1,
-0.04717807, -1.094524, -2.85942, 0, 0.9686275, 1, 1,
-0.04681663, -0.3725947, -4.484079, 0, 0.9647059, 1, 1,
-0.04140668, 1.627731, 1.043589, 0, 0.9568627, 1, 1,
-0.03807481, 0.4033144, -0.3079036, 0, 0.9529412, 1, 1,
-0.0367367, 1.818171, 1.42574, 0, 0.945098, 1, 1,
-0.03246201, -1.509998, -3.971758, 0, 0.9411765, 1, 1,
-0.03108006, -0.006706188, -3.071173, 0, 0.9333333, 1, 1,
-0.02880419, 0.2990572, 1.593172, 0, 0.9294118, 1, 1,
-0.02853869, 1.205928, -0.9151037, 0, 0.9215686, 1, 1,
-0.02468078, -1.045873, -3.774121, 0, 0.9176471, 1, 1,
-0.02450337, 0.9800404, -0.1364601, 0, 0.9098039, 1, 1,
-0.02397667, 0.08982802, 0.4510106, 0, 0.9058824, 1, 1,
-0.02073536, 0.2608472, 0.6974109, 0, 0.8980392, 1, 1,
-0.009098164, -0.5448871, -1.751591, 0, 0.8901961, 1, 1,
-0.006335184, 0.4949641, -0.0535638, 0, 0.8862745, 1, 1,
-0.006254211, 1.466277, -0.7617512, 0, 0.8784314, 1, 1,
-0.006137939, 0.9157834, 0.7381218, 0, 0.8745098, 1, 1,
-0.004693321, 0.9164412, 1.010184, 0, 0.8666667, 1, 1,
-0.0045671, 0.4627498, 0.7436651, 0, 0.8627451, 1, 1,
-0.003833479, 0.2600081, -1.481571, 0, 0.854902, 1, 1,
-0.001222, -1.013426, -2.490781, 0, 0.8509804, 1, 1,
-0.0003103652, 1.336589, -0.3077589, 0, 0.8431373, 1, 1,
0.001197399, -0.1202355, 1.751178, 0, 0.8392157, 1, 1,
0.007593274, 0.8756616, 1.519703, 0, 0.8313726, 1, 1,
0.008061666, 0.6656622, 0.7801158, 0, 0.827451, 1, 1,
0.01793873, 0.5331956, -0.6715081, 0, 0.8196079, 1, 1,
0.01840933, 0.009067791, -1.29292, 0, 0.8156863, 1, 1,
0.02196245, 2.318822, -1.509145, 0, 0.8078431, 1, 1,
0.02259267, 0.3476577, -1.601239, 0, 0.8039216, 1, 1,
0.02532949, -0.7537144, 2.361518, 0, 0.7960784, 1, 1,
0.02602775, 0.4710041, -0.7588232, 0, 0.7882353, 1, 1,
0.03028185, -1.730263, 2.334109, 0, 0.7843137, 1, 1,
0.03109468, -1.644663, 3.437773, 0, 0.7764706, 1, 1,
0.03537537, -0.1956452, 1.866407, 0, 0.772549, 1, 1,
0.03839238, -0.0937357, 3.604973, 0, 0.7647059, 1, 1,
0.03863827, 0.6543338, -1.835997, 0, 0.7607843, 1, 1,
0.04113096, -0.7623007, 3.383999, 0, 0.7529412, 1, 1,
0.04681957, -1.655991, 3.556996, 0, 0.7490196, 1, 1,
0.04976272, -0.1012525, 3.234036, 0, 0.7411765, 1, 1,
0.04982164, 1.211515, 0.9305662, 0, 0.7372549, 1, 1,
0.05013821, -0.4714911, 0.8602143, 0, 0.7294118, 1, 1,
0.0504653, -0.747881, 2.767873, 0, 0.7254902, 1, 1,
0.05083844, 1.20296, 0.1115744, 0, 0.7176471, 1, 1,
0.05622173, -0.156925, 3.462139, 0, 0.7137255, 1, 1,
0.05631613, 0.5735772, -0.6130497, 0, 0.7058824, 1, 1,
0.05679814, 0.09059448, 1.59862, 0, 0.6980392, 1, 1,
0.06250932, -0.04939327, 3.573306, 0, 0.6941177, 1, 1,
0.06274506, 1.526363, 1.495898, 0, 0.6862745, 1, 1,
0.06300236, -1.032212, 2.936459, 0, 0.682353, 1, 1,
0.06670693, 1.540133, -0.6275139, 0, 0.6745098, 1, 1,
0.06728959, -0.4740669, 3.639369, 0, 0.6705883, 1, 1,
0.06980839, -0.4681755, 3.035434, 0, 0.6627451, 1, 1,
0.07292769, -2.117741, 2.422823, 0, 0.6588235, 1, 1,
0.07709193, -2.040793, 2.571444, 0, 0.6509804, 1, 1,
0.08002543, -2.033869, 2.510531, 0, 0.6470588, 1, 1,
0.08157265, -0.6530476, 2.920633, 0, 0.6392157, 1, 1,
0.08953732, -0.272183, 3.485552, 0, 0.6352941, 1, 1,
0.09102035, 1.015309, 1.74143, 0, 0.627451, 1, 1,
0.09158013, 0.807268, 1.543175, 0, 0.6235294, 1, 1,
0.09277113, 0.9354385, 0.4259156, 0, 0.6156863, 1, 1,
0.09476982, -0.4211269, 2.036379, 0, 0.6117647, 1, 1,
0.09728699, -0.3177053, 4.582041, 0, 0.6039216, 1, 1,
0.09958354, -0.7188339, 2.500997, 0, 0.5960785, 1, 1,
0.1018429, -2.692743, 3.277092, 0, 0.5921569, 1, 1,
0.10225, -0.6032391, 2.143405, 0, 0.5843138, 1, 1,
0.1025235, 1.68997, 0.3172297, 0, 0.5803922, 1, 1,
0.1057986, -0.1055112, 1.560586, 0, 0.572549, 1, 1,
0.1059363, 0.3027895, 1.262099, 0, 0.5686275, 1, 1,
0.1063907, 1.54607, -0.1310919, 0, 0.5607843, 1, 1,
0.110905, 0.7299179, -0.2062681, 0, 0.5568628, 1, 1,
0.1119802, -0.7612098, 4.424613, 0, 0.5490196, 1, 1,
0.1142198, -0.3076532, 1.586539, 0, 0.5450981, 1, 1,
0.1173561, -0.5350051, 2.747717, 0, 0.5372549, 1, 1,
0.117714, 0.9454381, -0.340582, 0, 0.5333334, 1, 1,
0.1178164, 1.288018, 0.2903073, 0, 0.5254902, 1, 1,
0.118846, 0.4156053, 0.4262293, 0, 0.5215687, 1, 1,
0.1201989, -1.682711, 3.696754, 0, 0.5137255, 1, 1,
0.1204121, -0.7788979, 4.200564, 0, 0.509804, 1, 1,
0.121916, 1.567566, -0.0815926, 0, 0.5019608, 1, 1,
0.1269162, -1.427694, 3.630202, 0, 0.4941176, 1, 1,
0.1326379, 1.112566, -0.7602729, 0, 0.4901961, 1, 1,
0.1343569, 1.047517, -0.3876442, 0, 0.4823529, 1, 1,
0.1345993, 1.213071, -0.002519831, 0, 0.4784314, 1, 1,
0.1380977, -1.032315, 4.278232, 0, 0.4705882, 1, 1,
0.1400861, 0.531868, 0.7830624, 0, 0.4666667, 1, 1,
0.1402089, 0.7971541, 0.9638092, 0, 0.4588235, 1, 1,
0.1418655, -0.05165088, 3.753985, 0, 0.454902, 1, 1,
0.1420185, 1.25969, -1.657959, 0, 0.4470588, 1, 1,
0.1441877, -0.544475, 2.762717, 0, 0.4431373, 1, 1,
0.1470104, -0.4454113, 2.449456, 0, 0.4352941, 1, 1,
0.1472418, -0.4223401, 2.163422, 0, 0.4313726, 1, 1,
0.1516017, -1.00459, 1.616518, 0, 0.4235294, 1, 1,
0.1540496, -0.8672237, 3.188396, 0, 0.4196078, 1, 1,
0.1546451, 0.2813444, 0.8977659, 0, 0.4117647, 1, 1,
0.1580108, 0.2410252, 0.626973, 0, 0.4078431, 1, 1,
0.1632519, 0.2504832, 0.6383194, 0, 0.4, 1, 1,
0.1662091, 1.435212, 0.06518039, 0, 0.3921569, 1, 1,
0.1686522, -1.201287, 2.985039, 0, 0.3882353, 1, 1,
0.1688956, -0.6781791, 2.997766, 0, 0.3803922, 1, 1,
0.170048, 0.4949816, 0.5671642, 0, 0.3764706, 1, 1,
0.1772487, 0.3442416, -0.257758, 0, 0.3686275, 1, 1,
0.1805676, -1.874432, 1.637965, 0, 0.3647059, 1, 1,
0.1874814, -0.2257706, 2.147127, 0, 0.3568628, 1, 1,
0.1876723, 1.126709, -0.5697951, 0, 0.3529412, 1, 1,
0.1886385, -0.05537568, 0.4076282, 0, 0.345098, 1, 1,
0.1904038, -1.609527, 3.26274, 0, 0.3411765, 1, 1,
0.191498, -0.5031162, 2.943013, 0, 0.3333333, 1, 1,
0.1948056, -0.04223071, 1.094895, 0, 0.3294118, 1, 1,
0.1985844, 0.6415207, -1.333436, 0, 0.3215686, 1, 1,
0.2012529, -0.661177, 3.501706, 0, 0.3176471, 1, 1,
0.2085878, -0.577828, 2.518893, 0, 0.3098039, 1, 1,
0.213684, -0.2326544, 1.455418, 0, 0.3058824, 1, 1,
0.2157558, -2.072149, 2.389224, 0, 0.2980392, 1, 1,
0.217077, 1.492942, -0.3153848, 0, 0.2901961, 1, 1,
0.2175559, 0.1487224, 0.1410876, 0, 0.2862745, 1, 1,
0.2176832, -0.2933998, 2.221658, 0, 0.2784314, 1, 1,
0.228344, 0.7408147, -2.483274, 0, 0.2745098, 1, 1,
0.2287219, 1.583183, -1.462439, 0, 0.2666667, 1, 1,
0.2287582, 2.026018, 0.832388, 0, 0.2627451, 1, 1,
0.2293505, 1.05079, 0.4600513, 0, 0.254902, 1, 1,
0.2295581, 1.323187, -0.6302008, 0, 0.2509804, 1, 1,
0.2296383, 0.5566784, -0.2817561, 0, 0.2431373, 1, 1,
0.2307306, -1.329308, 2.735719, 0, 0.2392157, 1, 1,
0.2368347, 0.9668462, 0.1125229, 0, 0.2313726, 1, 1,
0.2368374, 0.558754, -1.211066, 0, 0.227451, 1, 1,
0.2423131, -0.03189372, 2.576916, 0, 0.2196078, 1, 1,
0.2459585, -0.02181657, 2.201826, 0, 0.2156863, 1, 1,
0.2539849, -1.388858, 4.051934, 0, 0.2078431, 1, 1,
0.2539985, -0.3507871, 1.2612, 0, 0.2039216, 1, 1,
0.2595223, -0.145219, 3.165352, 0, 0.1960784, 1, 1,
0.2624499, 0.3273825, 0.6370409, 0, 0.1882353, 1, 1,
0.2651086, 0.4090029, -0.08859863, 0, 0.1843137, 1, 1,
0.2665662, -0.2072881, 1.581089, 0, 0.1764706, 1, 1,
0.271744, 0.7313282, -0.5934643, 0, 0.172549, 1, 1,
0.2751191, -1.179494, 2.36365, 0, 0.1647059, 1, 1,
0.2791426, 0.2506795, -0.7465826, 0, 0.1607843, 1, 1,
0.2817007, -0.3397846, 1.915698, 0, 0.1529412, 1, 1,
0.2844525, 0.1442851, 2.261788, 0, 0.1490196, 1, 1,
0.2850808, 0.861869, 1.702809, 0, 0.1411765, 1, 1,
0.2862611, -1.080931, 2.793508, 0, 0.1372549, 1, 1,
0.2909546, -0.06402778, 2.982237, 0, 0.1294118, 1, 1,
0.2911229, -0.9732804, 3.029254, 0, 0.1254902, 1, 1,
0.292451, 1.125157, 0.5653998, 0, 0.1176471, 1, 1,
0.2986341, -0.5237851, 2.593529, 0, 0.1137255, 1, 1,
0.3017514, -0.2351662, 2.820899, 0, 0.1058824, 1, 1,
0.3023929, 1.458749, 0.1581165, 0, 0.09803922, 1, 1,
0.3050102, 0.2924121, 1.37157, 0, 0.09411765, 1, 1,
0.3058272, -0.3342499, 3.386375, 0, 0.08627451, 1, 1,
0.3095487, -1.185802, 2.366318, 0, 0.08235294, 1, 1,
0.3127613, -0.09189493, 2.234078, 0, 0.07450981, 1, 1,
0.3130124, -1.912408, 4.260724, 0, 0.07058824, 1, 1,
0.3144121, -0.0914715, 3.054783, 0, 0.0627451, 1, 1,
0.3158729, -0.6536159, 2.665735, 0, 0.05882353, 1, 1,
0.3162247, 0.09393999, 1.135073, 0, 0.05098039, 1, 1,
0.3201613, -1.944888, 2.522403, 0, 0.04705882, 1, 1,
0.3219742, 1.195901, 1.286377, 0, 0.03921569, 1, 1,
0.32633, -2.046451, 2.640304, 0, 0.03529412, 1, 1,
0.3296236, 0.3266261, 2.635382, 0, 0.02745098, 1, 1,
0.3323852, -0.9538089, 3.313012, 0, 0.02352941, 1, 1,
0.332963, -0.189513, 1.960139, 0, 0.01568628, 1, 1,
0.3335511, -0.8348777, 0.2946616, 0, 0.01176471, 1, 1,
0.3355344, -0.4974066, 1.633485, 0, 0.003921569, 1, 1,
0.3372385, 0.0653505, 0.6012335, 0.003921569, 0, 1, 1,
0.3417517, 0.802528, -0.9580569, 0.007843138, 0, 1, 1,
0.3434667, -0.3486267, 1.755167, 0.01568628, 0, 1, 1,
0.3472735, -0.3412291, 1.411306, 0.01960784, 0, 1, 1,
0.3481948, 0.9056298, -0.5561308, 0.02745098, 0, 1, 1,
0.3580014, 0.05287297, 2.279135, 0.03137255, 0, 1, 1,
0.3601299, -0.365357, 1.789692, 0.03921569, 0, 1, 1,
0.3625564, 0.9225997, -0.6515587, 0.04313726, 0, 1, 1,
0.3644779, -0.0868059, 0.8611298, 0.05098039, 0, 1, 1,
0.3672777, 0.5424976, -1.060333, 0.05490196, 0, 1, 1,
0.3738025, -0.7874082, 4.720817, 0.0627451, 0, 1, 1,
0.3804687, 0.3263069, 1.65536, 0.06666667, 0, 1, 1,
0.3855297, 0.05308137, 1.452474, 0.07450981, 0, 1, 1,
0.3931334, -0.02687353, 2.577945, 0.07843138, 0, 1, 1,
0.3982166, 0.620817, -0.2692001, 0.08627451, 0, 1, 1,
0.4008858, 0.456994, 1.578552, 0.09019608, 0, 1, 1,
0.4028119, 0.4774346, -0.7579338, 0.09803922, 0, 1, 1,
0.4056305, 0.1096196, 1.954979, 0.1058824, 0, 1, 1,
0.4105046, 0.9577675, -0.6810358, 0.1098039, 0, 1, 1,
0.4138738, -0.5846297, 2.406683, 0.1176471, 0, 1, 1,
0.4168581, -0.5504913, 2.014921, 0.1215686, 0, 1, 1,
0.4184602, 0.1283486, 0.5455289, 0.1294118, 0, 1, 1,
0.4189198, 1.33469, 1.299576, 0.1333333, 0, 1, 1,
0.4192235, -1.187638, 2.528293, 0.1411765, 0, 1, 1,
0.419856, -0.4018843, -0.06419379, 0.145098, 0, 1, 1,
0.4209364, -0.6684093, 1.817313, 0.1529412, 0, 1, 1,
0.4240946, -0.872235, 3.32175, 0.1568628, 0, 1, 1,
0.4250546, -0.9304671, 1.117566, 0.1647059, 0, 1, 1,
0.4255742, 3.093456, -0.6943035, 0.1686275, 0, 1, 1,
0.4268184, -0.1170722, 0.4277469, 0.1764706, 0, 1, 1,
0.4306666, -1.139319, 2.318835, 0.1803922, 0, 1, 1,
0.4318848, 1.157316, -0.9953929, 0.1882353, 0, 1, 1,
0.4368739, 1.726448, -0.4014668, 0.1921569, 0, 1, 1,
0.4381543, 0.1603491, 1.730991, 0.2, 0, 1, 1,
0.4393721, 1.739964, 2.241099, 0.2078431, 0, 1, 1,
0.4400879, 0.9791622, 0.6898139, 0.2117647, 0, 1, 1,
0.4438927, -0.8219433, 1.817127, 0.2196078, 0, 1, 1,
0.4451449, 1.124238, 0.7686065, 0.2235294, 0, 1, 1,
0.450555, -0.6232773, 3.683759, 0.2313726, 0, 1, 1,
0.4526291, -0.1427649, 3.949668, 0.2352941, 0, 1, 1,
0.4540466, -1.275024, 2.676904, 0.2431373, 0, 1, 1,
0.4593712, 0.3225393, 0.3799267, 0.2470588, 0, 1, 1,
0.4626856, -0.2302789, 2.109746, 0.254902, 0, 1, 1,
0.4636408, 0.8226397, 0.5614184, 0.2588235, 0, 1, 1,
0.4650749, 0.6012354, 1.298534, 0.2666667, 0, 1, 1,
0.4727706, 0.8428935, 0.292121, 0.2705882, 0, 1, 1,
0.472836, 1.42581, 0.06819728, 0.2784314, 0, 1, 1,
0.4756387, 0.3398719, -0.7262711, 0.282353, 0, 1, 1,
0.4773772, 0.4365216, 1.477184, 0.2901961, 0, 1, 1,
0.4941877, 1.615139, -0.07612713, 0.2941177, 0, 1, 1,
0.498035, 0.4887759, 1.178226, 0.3019608, 0, 1, 1,
0.4988582, -0.1622223, 4.28934, 0.3098039, 0, 1, 1,
0.4998517, -0.2028582, 1.984657, 0.3137255, 0, 1, 1,
0.5035018, -0.650804, 3.909793, 0.3215686, 0, 1, 1,
0.5086089, 0.2565468, 0.6219858, 0.3254902, 0, 1, 1,
0.5100165, 0.01068321, 2.329209, 0.3333333, 0, 1, 1,
0.5126169, -0.4609258, 2.155313, 0.3372549, 0, 1, 1,
0.5130318, -0.8778347, 3.506598, 0.345098, 0, 1, 1,
0.5178195, 0.522408, 1.829089, 0.3490196, 0, 1, 1,
0.5221511, 0.1416273, 3.265198, 0.3568628, 0, 1, 1,
0.5247241, 0.9696391, -1.781662, 0.3607843, 0, 1, 1,
0.5323243, 1.438746, -0.3614329, 0.3686275, 0, 1, 1,
0.5326857, -0.8441371, 1.484937, 0.372549, 0, 1, 1,
0.5330921, -0.8062251, 3.076525, 0.3803922, 0, 1, 1,
0.5371013, -0.7327352, 1.674728, 0.3843137, 0, 1, 1,
0.5398007, -0.05334697, 1.646921, 0.3921569, 0, 1, 1,
0.5404757, 0.1474515, 0.8821031, 0.3960784, 0, 1, 1,
0.5427511, 0.3101823, 0.312849, 0.4039216, 0, 1, 1,
0.5431181, 0.502649, 0.4116258, 0.4117647, 0, 1, 1,
0.5461639, -1.653266, 3.770272, 0.4156863, 0, 1, 1,
0.5463361, -0.09512022, 1.708089, 0.4235294, 0, 1, 1,
0.5470942, 0.9802122, 0.9459779, 0.427451, 0, 1, 1,
0.5569044, 1.17666, 0.6241513, 0.4352941, 0, 1, 1,
0.5580342, 0.08035629, 0.3396036, 0.4392157, 0, 1, 1,
0.5590326, -0.4090675, 2.351939, 0.4470588, 0, 1, 1,
0.5595244, -1.104894, 2.180367, 0.4509804, 0, 1, 1,
0.5642565, -3.397424, 2.899555, 0.4588235, 0, 1, 1,
0.5648576, 1.441043, 1.667817, 0.4627451, 0, 1, 1,
0.5664292, -0.2352148, 4.049195, 0.4705882, 0, 1, 1,
0.5676309, 1.57528, -1.932195, 0.4745098, 0, 1, 1,
0.5717087, -0.4055003, 2.187071, 0.4823529, 0, 1, 1,
0.5721784, -1.798411, 3.848875, 0.4862745, 0, 1, 1,
0.5761395, 0.677938, -0.7605768, 0.4941176, 0, 1, 1,
0.5771655, 1.698015, -0.465041, 0.5019608, 0, 1, 1,
0.5819879, 0.2043241, 2.126376, 0.5058824, 0, 1, 1,
0.5887601, 0.5802647, 0.95215, 0.5137255, 0, 1, 1,
0.591464, -0.9863615, 3.948699, 0.5176471, 0, 1, 1,
0.5965008, -1.116847, 2.588598, 0.5254902, 0, 1, 1,
0.6003963, 0.03972216, 1.524846, 0.5294118, 0, 1, 1,
0.6039436, -0.5100724, 2.791013, 0.5372549, 0, 1, 1,
0.6041152, 0.441986, -2.061006, 0.5411765, 0, 1, 1,
0.6062798, 0.2662542, 2.209522, 0.5490196, 0, 1, 1,
0.6092004, 0.6137717, 0.05721793, 0.5529412, 0, 1, 1,
0.6128586, 0.3127502, -1.477044, 0.5607843, 0, 1, 1,
0.6169626, 0.4579791, 1.710075, 0.5647059, 0, 1, 1,
0.6217339, 0.3579267, 0.3328528, 0.572549, 0, 1, 1,
0.6250001, 0.5491726, 1.220235, 0.5764706, 0, 1, 1,
0.6298136, -0.3816813, 2.087504, 0.5843138, 0, 1, 1,
0.6334793, -0.4085357, 2.118382, 0.5882353, 0, 1, 1,
0.635943, -0.2678426, 1.656526, 0.5960785, 0, 1, 1,
0.6397403, -0.6669901, 0.9358925, 0.6039216, 0, 1, 1,
0.6398404, -0.1990135, 3.093185, 0.6078432, 0, 1, 1,
0.6401454, 0.1701468, 1.810495, 0.6156863, 0, 1, 1,
0.641566, 0.3129719, -0.9934036, 0.6196079, 0, 1, 1,
0.6489435, 0.8688111, 1.002343, 0.627451, 0, 1, 1,
0.6490588, -0.2687608, 1.174365, 0.6313726, 0, 1, 1,
0.649942, -0.941408, 1.35803, 0.6392157, 0, 1, 1,
0.6522756, 0.2363045, 2.658603, 0.6431373, 0, 1, 1,
0.6533302, -1.009174, 1.578972, 0.6509804, 0, 1, 1,
0.6562306, 0.009069116, 2.553426, 0.654902, 0, 1, 1,
0.6602185, 0.9292321, 0.4440644, 0.6627451, 0, 1, 1,
0.6605359, 0.4021815, 1.578025, 0.6666667, 0, 1, 1,
0.6617399, -0.06010066, 0.6347188, 0.6745098, 0, 1, 1,
0.6682944, -0.4836478, 1.710372, 0.6784314, 0, 1, 1,
0.6745986, 2.042172, 0.8354645, 0.6862745, 0, 1, 1,
0.6846484, -0.01504971, 1.195677, 0.6901961, 0, 1, 1,
0.6908521, -0.9669576, 3.264077, 0.6980392, 0, 1, 1,
0.6944475, 0.9489067, 0.3454894, 0.7058824, 0, 1, 1,
0.6981466, 0.2736963, 2.197211, 0.7098039, 0, 1, 1,
0.7019078, -0.6721725, 1.918867, 0.7176471, 0, 1, 1,
0.7035427, -0.670352, 2.820899, 0.7215686, 0, 1, 1,
0.7058064, -1.388922, 0.84756, 0.7294118, 0, 1, 1,
0.7090905, 0.9272267, 1.796603, 0.7333333, 0, 1, 1,
0.7123897, 0.4803125, -0.2277149, 0.7411765, 0, 1, 1,
0.7130921, -1.448218, 2.066276, 0.7450981, 0, 1, 1,
0.7161912, -0.5039641, 2.459053, 0.7529412, 0, 1, 1,
0.721612, 1.079664, 0.0001123051, 0.7568628, 0, 1, 1,
0.7229588, -1.73364, 2.976273, 0.7647059, 0, 1, 1,
0.7268503, -1.240752, 2.235262, 0.7686275, 0, 1, 1,
0.7278288, -1.417833, 4.100003, 0.7764706, 0, 1, 1,
0.7303856, -0.2021076, 0.7184141, 0.7803922, 0, 1, 1,
0.7336294, -2.027146, 2.352855, 0.7882353, 0, 1, 1,
0.734137, 2.493914, -0.9632982, 0.7921569, 0, 1, 1,
0.7365956, -1.00411, 1.328509, 0.8, 0, 1, 1,
0.7389503, -1.288921, 4.041311, 0.8078431, 0, 1, 1,
0.7422529, -0.3982507, 4.121873, 0.8117647, 0, 1, 1,
0.7495273, -0.1821476, 2.005727, 0.8196079, 0, 1, 1,
0.7510004, 2.684191, 0.5154601, 0.8235294, 0, 1, 1,
0.7517327, -0.3444191, 0.3671721, 0.8313726, 0, 1, 1,
0.7530088, 0.6772725, -0.9707354, 0.8352941, 0, 1, 1,
0.7553794, -0.7794275, 3.239605, 0.8431373, 0, 1, 1,
0.7562882, -2.514482, 3.869836, 0.8470588, 0, 1, 1,
0.7620341, 0.6842622, -0.1075978, 0.854902, 0, 1, 1,
0.763913, -1.597424, 2.921447, 0.8588235, 0, 1, 1,
0.7655007, -1.267483, 2.428695, 0.8666667, 0, 1, 1,
0.7871148, -0.541508, 3.171561, 0.8705882, 0, 1, 1,
0.7876273, -0.6064587, 1.630361, 0.8784314, 0, 1, 1,
0.7912157, -0.2361104, 0.9952402, 0.8823529, 0, 1, 1,
0.811056, -0.6789257, 2.365779, 0.8901961, 0, 1, 1,
0.8121792, -0.669596, 2.242701, 0.8941177, 0, 1, 1,
0.818852, -0.5773801, 2.702538, 0.9019608, 0, 1, 1,
0.8256323, -0.818208, 3.91487, 0.9098039, 0, 1, 1,
0.8263344, -1.374547, 2.938662, 0.9137255, 0, 1, 1,
0.8327409, -0.1962046, 0.5826268, 0.9215686, 0, 1, 1,
0.8334197, -0.06511672, 2.057824, 0.9254902, 0, 1, 1,
0.8427823, -0.8035938, 1.281787, 0.9333333, 0, 1, 1,
0.8495955, -0.5550674, 1.682238, 0.9372549, 0, 1, 1,
0.8505113, 1.934015, 0.612606, 0.945098, 0, 1, 1,
0.8625268, -0.2971873, 2.099704, 0.9490196, 0, 1, 1,
0.8655605, -0.06568398, 2.527376, 0.9568627, 0, 1, 1,
0.8655666, 0.7868235, -0.2240356, 0.9607843, 0, 1, 1,
0.8809332, 0.7734247, 1.732381, 0.9686275, 0, 1, 1,
0.8830205, 0.08152968, 1.423926, 0.972549, 0, 1, 1,
0.8841006, -1.242266, 3.702694, 0.9803922, 0, 1, 1,
0.8872572, 0.7615165, 1.685511, 0.9843137, 0, 1, 1,
0.8929418, 0.2096157, 0.9285669, 0.9921569, 0, 1, 1,
0.8964844, 0.5203274, 1.140033, 0.9960784, 0, 1, 1,
0.9104943, -0.8019188, 3.32338, 1, 0, 0.9960784, 1,
0.9132107, -0.9751872, 1.811548, 1, 0, 0.9882353, 1,
0.9261689, -0.1376788, 2.398271, 1, 0, 0.9843137, 1,
0.9273906, 1.102029, -0.1182267, 1, 0, 0.9764706, 1,
0.9288455, 0.4791981, 0.1776051, 1, 0, 0.972549, 1,
0.9355103, 0.05352926, -1.819092, 1, 0, 0.9647059, 1,
0.9450003, 0.03703388, 1.230592, 1, 0, 0.9607843, 1,
0.9542636, -2.148721, 4.566075, 1, 0, 0.9529412, 1,
0.9645692, 0.4392281, -0.7952178, 1, 0, 0.9490196, 1,
0.9726734, -0.3825618, 1.456391, 1, 0, 0.9411765, 1,
0.9737795, 1.91879, 0.7589655, 1, 0, 0.9372549, 1,
0.976176, 1.060153, 0.9113239, 1, 0, 0.9294118, 1,
0.9808981, -0.1398402, 2.900476, 1, 0, 0.9254902, 1,
0.9826, 0.3019016, 2.113382, 1, 0, 0.9176471, 1,
0.9874398, -0.7910984, 0.9840927, 1, 0, 0.9137255, 1,
0.9915423, -0.4470888, 1.159715, 1, 0, 0.9058824, 1,
0.9917735, 0.7427599, -1.115198, 1, 0, 0.9019608, 1,
1.00307, 0.7893943, 0.1359309, 1, 0, 0.8941177, 1,
1.009174, 0.9830011, 2.222493, 1, 0, 0.8862745, 1,
1.013031, -0.188117, 1.562678, 1, 0, 0.8823529, 1,
1.015551, 0.8451919, 1.732711, 1, 0, 0.8745098, 1,
1.028683, -0.3731042, 2.732123, 1, 0, 0.8705882, 1,
1.031371, 0.5731479, -1.025383, 1, 0, 0.8627451, 1,
1.034731, -2.081988, 2.701974, 1, 0, 0.8588235, 1,
1.041455, 0.1639006, 1.186904, 1, 0, 0.8509804, 1,
1.041914, -0.6319173, 4.06374, 1, 0, 0.8470588, 1,
1.042352, 1.9112, 1.075328, 1, 0, 0.8392157, 1,
1.042563, -1.761378, 2.4137, 1, 0, 0.8352941, 1,
1.048031, 0.1441008, 0.4985335, 1, 0, 0.827451, 1,
1.057977, -1.579429, 3.237353, 1, 0, 0.8235294, 1,
1.070121, 0.06892814, 2.303001, 1, 0, 0.8156863, 1,
1.071675, -1.265925, 3.694261, 1, 0, 0.8117647, 1,
1.074889, 0.8855892, 2.911036, 1, 0, 0.8039216, 1,
1.07556, 0.4787821, 0.7192209, 1, 0, 0.7960784, 1,
1.086331, 0.08647703, 1.680591, 1, 0, 0.7921569, 1,
1.089538, -1.289073, 2.275397, 1, 0, 0.7843137, 1,
1.089855, 1.203411, 1.727841, 1, 0, 0.7803922, 1,
1.092745, -1.073776, 1.067366, 1, 0, 0.772549, 1,
1.104467, -0.6724387, 2.737401, 1, 0, 0.7686275, 1,
1.113833, -0.4875965, 1.996644, 1, 0, 0.7607843, 1,
1.125865, -0.9465727, 3.381044, 1, 0, 0.7568628, 1,
1.138898, -1.873891, 1.841542, 1, 0, 0.7490196, 1,
1.141066, 0.6831078, 2.258079, 1, 0, 0.7450981, 1,
1.156024, -0.015002, 0.5702465, 1, 0, 0.7372549, 1,
1.165847, 0.987358, -0.6868791, 1, 0, 0.7333333, 1,
1.16925, 2.090121, 0.3177202, 1, 0, 0.7254902, 1,
1.178711, -0.4487432, 2.182286, 1, 0, 0.7215686, 1,
1.180215, 0.7395222, -1.080106, 1, 0, 0.7137255, 1,
1.189097, 0.6812245, 2.486691, 1, 0, 0.7098039, 1,
1.191141, -0.462717, 1.65832, 1, 0, 0.7019608, 1,
1.193326, 1.565215, 1.212535, 1, 0, 0.6941177, 1,
1.198281, 0.9414262, 1.009639, 1, 0, 0.6901961, 1,
1.202097, 1.982991, -0.7661701, 1, 0, 0.682353, 1,
1.206573, -0.1932563, 0.5161425, 1, 0, 0.6784314, 1,
1.208992, 0.02644123, 1.629156, 1, 0, 0.6705883, 1,
1.210178, -1.040749, 1.445007, 1, 0, 0.6666667, 1,
1.22523, 0.5478541, 1.722688, 1, 0, 0.6588235, 1,
1.22754, 0.3072957, -0.3775847, 1, 0, 0.654902, 1,
1.231269, -0.3853672, 2.887288, 1, 0, 0.6470588, 1,
1.231281, 0.7827924, -0.2508397, 1, 0, 0.6431373, 1,
1.241404, 1.319147, -0.8630513, 1, 0, 0.6352941, 1,
1.25036, -0.05759035, 0.8408017, 1, 0, 0.6313726, 1,
1.250483, 1.504725, 0.9069866, 1, 0, 0.6235294, 1,
1.253395, -0.03197772, 2.949983, 1, 0, 0.6196079, 1,
1.257876, -0.04696668, 2.155004, 1, 0, 0.6117647, 1,
1.263211, -0.1882544, 1.771466, 1, 0, 0.6078432, 1,
1.264361, -1.268867, 1.101466, 1, 0, 0.6, 1,
1.270146, 1.056096, 0.2725368, 1, 0, 0.5921569, 1,
1.272297, 1.201911, -0.07298, 1, 0, 0.5882353, 1,
1.274749, 1.817336, 3.12963, 1, 0, 0.5803922, 1,
1.298902, 0.004795711, 1.711357, 1, 0, 0.5764706, 1,
1.302107, 0.7651152, 0.718604, 1, 0, 0.5686275, 1,
1.308064, 0.1364381, 2.160499, 1, 0, 0.5647059, 1,
1.309075, -0.7003742, 2.723588, 1, 0, 0.5568628, 1,
1.309554, 0.174131, 1.940485, 1, 0, 0.5529412, 1,
1.314049, 0.04196505, 2.623708, 1, 0, 0.5450981, 1,
1.315924, -1.707227, 3.08268, 1, 0, 0.5411765, 1,
1.319319, 0.04847157, 0.5288702, 1, 0, 0.5333334, 1,
1.319936, -0.2091745, -0.4631917, 1, 0, 0.5294118, 1,
1.338189, 1.824716, 1.961377, 1, 0, 0.5215687, 1,
1.342535, -0.4219776, 2.906161, 1, 0, 0.5176471, 1,
1.344821, 2.437511, 0.6168314, 1, 0, 0.509804, 1,
1.345603, -1.687889, 0.6847243, 1, 0, 0.5058824, 1,
1.350574, 0.7622654, 1.008777, 1, 0, 0.4980392, 1,
1.355877, -0.9601879, 3.008772, 1, 0, 0.4901961, 1,
1.357643, -0.7673408, 2.144768, 1, 0, 0.4862745, 1,
1.365306, 0.3395634, -0.4518369, 1, 0, 0.4784314, 1,
1.368143, 2.339023, 0.8935096, 1, 0, 0.4745098, 1,
1.379716, 0.4355504, 1.86387, 1, 0, 0.4666667, 1,
1.38633, 2.389205, 0.4249872, 1, 0, 0.4627451, 1,
1.386728, -0.3251106, 3.265246, 1, 0, 0.454902, 1,
1.391661, -0.2662078, 1.949715, 1, 0, 0.4509804, 1,
1.398658, -0.02605632, 2.018555, 1, 0, 0.4431373, 1,
1.398998, 1.150686, 0.1751056, 1, 0, 0.4392157, 1,
1.404934, 0.4886584, 1.830045, 1, 0, 0.4313726, 1,
1.430692, 0.266161, 1.189247, 1, 0, 0.427451, 1,
1.442059, 2.389406, 0.9958664, 1, 0, 0.4196078, 1,
1.442536, 0.6776187, 1.478319, 1, 0, 0.4156863, 1,
1.473133, -0.5892705, 2.032062, 1, 0, 0.4078431, 1,
1.473929, 0.174895, 2.209472, 1, 0, 0.4039216, 1,
1.482223, -0.7524126, 1.586138, 1, 0, 0.3960784, 1,
1.498214, -1.253116, 3.230461, 1, 0, 0.3882353, 1,
1.498603, 0.04852018, 2.448636, 1, 0, 0.3843137, 1,
1.528509, -0.8228717, 0.00684424, 1, 0, 0.3764706, 1,
1.544331, 0.3159368, 0.1018349, 1, 0, 0.372549, 1,
1.544669, 0.09509585, 2.189537, 1, 0, 0.3647059, 1,
1.556504, 2.582451, 1.296267, 1, 0, 0.3607843, 1,
1.560706, -0.8006408, 1.059074, 1, 0, 0.3529412, 1,
1.565519, -0.6743925, 2.065594, 1, 0, 0.3490196, 1,
1.566443, 1.173591, 1.087322, 1, 0, 0.3411765, 1,
1.602591, 0.2691587, 1.237031, 1, 0, 0.3372549, 1,
1.613078, -0.6051423, 1.628505, 1, 0, 0.3294118, 1,
1.621503, 0.4891162, 1.89349, 1, 0, 0.3254902, 1,
1.623501, 0.4304484, 1.646817, 1, 0, 0.3176471, 1,
1.669366, -1.05958, 1.556852, 1, 0, 0.3137255, 1,
1.672378, 0.06043475, 2.421773, 1, 0, 0.3058824, 1,
1.672665, 0.1551857, 1.842758, 1, 0, 0.2980392, 1,
1.673591, 0.1253855, 2.207984, 1, 0, 0.2941177, 1,
1.685676, -0.7555811, 2.075327, 1, 0, 0.2862745, 1,
1.720076, 0.5419779, 0.1537752, 1, 0, 0.282353, 1,
1.723995, -1.203185, 3.582392, 1, 0, 0.2745098, 1,
1.724555, 0.006466324, 1.463432, 1, 0, 0.2705882, 1,
1.759243, -0.01490023, 1.149347, 1, 0, 0.2627451, 1,
1.768184, 0.2501983, 0.6340606, 1, 0, 0.2588235, 1,
1.770192, 0.05335845, 3.018349, 1, 0, 0.2509804, 1,
1.775734, 1.648836, 0.4264052, 1, 0, 0.2470588, 1,
1.786232, 0.4725121, 1.24258, 1, 0, 0.2392157, 1,
1.798165, 0.2797342, 1.603972, 1, 0, 0.2352941, 1,
1.809554, -1.439466, 2.277575, 1, 0, 0.227451, 1,
1.810329, -0.9172785, 1.550861, 1, 0, 0.2235294, 1,
1.813825, -0.1463841, 2.535501, 1, 0, 0.2156863, 1,
1.818857, -0.8138097, 1.898227, 1, 0, 0.2117647, 1,
1.823548, -1.285342, 1.110124, 1, 0, 0.2039216, 1,
1.840201, 1.301626, 1.779466, 1, 0, 0.1960784, 1,
1.856809, 0.1835959, 0.7935329, 1, 0, 0.1921569, 1,
1.86932, 0.800949, 1.864458, 1, 0, 0.1843137, 1,
1.872148, -0.2255997, 1.742883, 1, 0, 0.1803922, 1,
1.913178, 0.5919943, 0.9728692, 1, 0, 0.172549, 1,
1.915925, -0.4579386, 1.579199, 1, 0, 0.1686275, 1,
1.92594, -1.451181, 2.56847, 1, 0, 0.1607843, 1,
1.955878, 0.6655062, 0.4106151, 1, 0, 0.1568628, 1,
1.961517, 2.122876, 1.511172, 1, 0, 0.1490196, 1,
1.971303, -1.050709, 2.141714, 1, 0, 0.145098, 1,
1.982312, -0.9106115, 1.298632, 1, 0, 0.1372549, 1,
1.982776, 0.6119451, 0.2759737, 1, 0, 0.1333333, 1,
1.997921, 0.2395514, 2.811025, 1, 0, 0.1254902, 1,
1.998782, -0.3669064, 1.838001, 1, 0, 0.1215686, 1,
2.008124, -0.5839477, 0.2842362, 1, 0, 0.1137255, 1,
2.066958, -2.740114, 1.255519, 1, 0, 0.1098039, 1,
2.09042, -0.3085774, 0.850158, 1, 0, 0.1019608, 1,
2.105417, 0.09629632, 1.457205, 1, 0, 0.09411765, 1,
2.110271, -2.346452, 1.229142, 1, 0, 0.09019608, 1,
2.157413, -0.02466622, 0.9754854, 1, 0, 0.08235294, 1,
2.201172, 0.1008969, 2.520523, 1, 0, 0.07843138, 1,
2.206057, 0.7806717, 0.8156037, 1, 0, 0.07058824, 1,
2.226705, -0.002621681, 1.296259, 1, 0, 0.06666667, 1,
2.260841, -0.8982359, -0.03477753, 1, 0, 0.05882353, 1,
2.294539, -2.258145, 1.330301, 1, 0, 0.05490196, 1,
2.365664, -0.8081089, 2.523582, 1, 0, 0.04705882, 1,
2.387946, -0.9121166, 3.993869, 1, 0, 0.04313726, 1,
2.493615, 0.6027134, 2.097725, 1, 0, 0.03529412, 1,
2.537433, -1.706509, 3.409298, 1, 0, 0.03137255, 1,
2.735022, 0.3027216, 1.049254, 1, 0, 0.02352941, 1,
2.825878, -0.3875906, 2.225033, 1, 0, 0.01960784, 1,
3.001868, -1.419932, 2.289479, 1, 0, 0.01176471, 1,
3.326829, 0.4658423, 3.043855, 1, 0, 0.007843138, 1
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
0.1866055, -4.497629, -8.761235, 0, -0.5, 0.5, 0.5,
0.1866055, -4.497629, -8.761235, 1, -0.5, 0.5, 0.5,
0.1866055, -4.497629, -8.761235, 1, 1.5, 0.5, 0.5,
0.1866055, -4.497629, -8.761235, 0, 1.5, 0.5, 0.5
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
-4.018154, -0.1519842, -8.761235, 0, -0.5, 0.5, 0.5,
-4.018154, -0.1519842, -8.761235, 1, -0.5, 0.5, 0.5,
-4.018154, -0.1519842, -8.761235, 1, 1.5, 0.5, 0.5,
-4.018154, -0.1519842, -8.761235, 0, 1.5, 0.5, 0.5
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
-4.018154, -4.497629, -1.043207, 0, -0.5, 0.5, 0.5,
-4.018154, -4.497629, -1.043207, 1, -0.5, 0.5, 0.5,
-4.018154, -4.497629, -1.043207, 1, 1.5, 0.5, 0.5,
-4.018154, -4.497629, -1.043207, 0, 1.5, 0.5, 0.5
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
-2, -3.494788, -6.980152,
3, -3.494788, -6.980152,
-2, -3.494788, -6.980152,
-2, -3.661928, -7.276999,
-1, -3.494788, -6.980152,
-1, -3.661928, -7.276999,
0, -3.494788, -6.980152,
0, -3.661928, -7.276999,
1, -3.494788, -6.980152,
1, -3.661928, -7.276999,
2, -3.494788, -6.980152,
2, -3.661928, -7.276999,
3, -3.494788, -6.980152,
3, -3.661928, -7.276999
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-2, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
-2, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
-2, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
-2, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5,
-1, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
-1, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
-1, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
-1, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5,
0, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
0, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
0, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
0, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5,
1, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
1, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
1, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
1, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5,
2, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
2, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
2, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
2, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5,
3, -3.996208, -7.870693, 0, -0.5, 0.5, 0.5,
3, -3.996208, -7.870693, 1, -0.5, 0.5, 0.5,
3, -3.996208, -7.870693, 1, 1.5, 0.5, 0.5,
3, -3.996208, -7.870693, 0, 1.5, 0.5, 0.5
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
-3.047825, -3, -6.980152,
-3.047825, 3, -6.980152,
-3.047825, -3, -6.980152,
-3.209546, -3, -7.276999,
-3.047825, -2, -6.980152,
-3.209546, -2, -7.276999,
-3.047825, -1, -6.980152,
-3.209546, -1, -7.276999,
-3.047825, 0, -6.980152,
-3.209546, 0, -7.276999,
-3.047825, 1, -6.980152,
-3.209546, 1, -7.276999,
-3.047825, 2, -6.980152,
-3.209546, 2, -7.276999,
-3.047825, 3, -6.980152,
-3.209546, 3, -7.276999
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
"-3",
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
-3.532989, -3, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, -3, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, -3, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, -3, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, -2, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, -2, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, -2, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, -2, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, -1, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, -1, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, -1, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, -1, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, 0, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, 0, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, 0, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, 0, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, 1, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, 1, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, 1, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, 1, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, 2, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, 2, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, 2, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, 2, -7.870693, 0, 1.5, 0.5, 0.5,
-3.532989, 3, -7.870693, 0, -0.5, 0.5, 0.5,
-3.532989, 3, -7.870693, 1, -0.5, 0.5, 0.5,
-3.532989, 3, -7.870693, 1, 1.5, 0.5, 0.5,
-3.532989, 3, -7.870693, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.047825, -3.494788, -6,
-3.047825, -3.494788, 4,
-3.047825, -3.494788, -6,
-3.209546, -3.661928, -6,
-3.047825, -3.494788, -4,
-3.209546, -3.661928, -4,
-3.047825, -3.494788, -2,
-3.209546, -3.661928, -2,
-3.047825, -3.494788, 0,
-3.209546, -3.661928, 0,
-3.047825, -3.494788, 2,
-3.209546, -3.661928, 2,
-3.047825, -3.494788, 4,
-3.209546, -3.661928, 4
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
"-6",
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
-3.532989, -3.996208, -6, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -6, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -6, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, -6, 0, 1.5, 0.5, 0.5,
-3.532989, -3.996208, -4, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -4, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -4, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, -4, 0, 1.5, 0.5, 0.5,
-3.532989, -3.996208, -2, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -2, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, -2, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, -2, 0, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 0, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 0, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 0, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 0, 0, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 2, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 2, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 2, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 2, 0, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 4, 0, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 4, 1, -0.5, 0.5, 0.5,
-3.532989, -3.996208, 4, 1, 1.5, 0.5, 0.5,
-3.532989, -3.996208, 4, 0, 1.5, 0.5, 0.5
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
-3.047825, -3.494788, -6.980152,
-3.047825, 3.190819, -6.980152,
-3.047825, -3.494788, 4.893738,
-3.047825, 3.190819, 4.893738,
-3.047825, -3.494788, -6.980152,
-3.047825, -3.494788, 4.893738,
-3.047825, 3.190819, -6.980152,
-3.047825, 3.190819, 4.893738,
-3.047825, -3.494788, -6.980152,
3.421036, -3.494788, -6.980152,
-3.047825, -3.494788, 4.893738,
3.421036, -3.494788, 4.893738,
-3.047825, 3.190819, -6.980152,
3.421036, 3.190819, -6.980152,
-3.047825, 3.190819, 4.893738,
3.421036, 3.190819, 4.893738,
3.421036, -3.494788, -6.980152,
3.421036, 3.190819, -6.980152,
3.421036, -3.494788, 4.893738,
3.421036, 3.190819, 4.893738,
3.421036, -3.494788, -6.980152,
3.421036, -3.494788, 4.893738,
3.421036, 3.190819, -6.980152,
3.421036, 3.190819, 4.893738
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
var radius = 8.054664;
var distance = 35.83611;
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
mvMatrix.translate( -0.1866055, 0.1519842, 1.043207 );
mvMatrix.scale( 1.346274, 1.302628, 0.7334463 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83611);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
(1-methylethyl)-5-ph<-read.table("(1-methylethyl)-5-ph.xyz")
```

```
## Error in read.table("(1-methylethyl)-5-ph.xyz"): no lines available in input
```

```r
x<-(1-methylethyl)-5-ph$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl' not found
```

```r
y<-(1-methylethyl)-5-ph$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl' not found
```

```r
z<-(1-methylethyl)-5-ph$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl' not found
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
-2.953618, 0.269311, -2.033645, 0, 0, 1, 1, 1,
-2.816723, -0.005850499, -0.01909965, 1, 0, 0, 1, 1,
-2.796191, 0.9150481, -1.858744, 1, 0, 0, 1, 1,
-2.687758, -1.532098, -3.775038, 1, 0, 0, 1, 1,
-2.633009, 0.991462, -1.697546, 1, 0, 0, 1, 1,
-2.540852, -1.02872, -4.01687, 1, 0, 0, 1, 1,
-2.5324, 0.209377, -2.146404, 0, 0, 0, 1, 1,
-2.50084, -0.7014922, -1.805738, 0, 0, 0, 1, 1,
-2.471368, -0.2323117, -1.054746, 0, 0, 0, 1, 1,
-2.414997, 0.3224947, -1.639638, 0, 0, 0, 1, 1,
-2.400215, -0.4942149, -1.161422, 0, 0, 0, 1, 1,
-2.395693, -0.5387504, -2.903658, 0, 0, 0, 1, 1,
-2.371951, 0.8471425, -0.3760485, 0, 0, 0, 1, 1,
-2.217133, -0.4253012, -3.204886, 1, 1, 1, 1, 1,
-2.216936, -0.02943775, -1.888124, 1, 1, 1, 1, 1,
-2.197622, -1.531535, -1.88855, 1, 1, 1, 1, 1,
-2.196601, 0.7108219, -0.9575869, 1, 1, 1, 1, 1,
-2.187324, 0.9096754, -2.02056, 1, 1, 1, 1, 1,
-2.183272, -1.122481, -2.360837, 1, 1, 1, 1, 1,
-2.158651, 0.04249109, -0.4854012, 1, 1, 1, 1, 1,
-2.133525, 0.6472552, 0.5454364, 1, 1, 1, 1, 1,
-2.130702, 0.6453109, 0.245342, 1, 1, 1, 1, 1,
-2.127349, -0.8892921, -1.559252, 1, 1, 1, 1, 1,
-2.097956, -0.6248378, -4.019082, 1, 1, 1, 1, 1,
-2.061086, -1.484543, -2.008595, 1, 1, 1, 1, 1,
-2.058794, -0.6547722, -2.18964, 1, 1, 1, 1, 1,
-2.041252, 1.488534, -2.732372, 1, 1, 1, 1, 1,
-2.034435, 2.286683, -1.572105, 1, 1, 1, 1, 1,
-2.020124, -0.2756723, -2.406909, 0, 0, 1, 1, 1,
-2.010314, -1.453254, -4.94441, 1, 0, 0, 1, 1,
-1.996282, -0.7259028, 0.04912533, 1, 0, 0, 1, 1,
-1.985787, 0.07730059, -1.091598, 1, 0, 0, 1, 1,
-1.934197, 0.8570348, -0.6839013, 1, 0, 0, 1, 1,
-1.931035, -0.1445923, -1.675393, 1, 0, 0, 1, 1,
-1.927857, -0.4376613, -2.934228, 0, 0, 0, 1, 1,
-1.927136, -0.3521636, 0.149069, 0, 0, 0, 1, 1,
-1.920182, 2.111688, -0.7613866, 0, 0, 0, 1, 1,
-1.91153, 0.07174801, -2.583488, 0, 0, 0, 1, 1,
-1.901308, 1.470247, -1.845552, 0, 0, 0, 1, 1,
-1.889835, -0.9188893, -0.7977701, 0, 0, 0, 1, 1,
-1.881263, -0.7723144, -1.315797, 0, 0, 0, 1, 1,
-1.8811, -2.698333, -2.960136, 1, 1, 1, 1, 1,
-1.856842, 2.822131, -0.8729509, 1, 1, 1, 1, 1,
-1.846957, -0.450607, -0.7122088, 1, 1, 1, 1, 1,
-1.837412, -0.8948832, -1.46235, 1, 1, 1, 1, 1,
-1.837169, 0.9736594, -1.591413, 1, 1, 1, 1, 1,
-1.835416, 0.1606189, -0.4807648, 1, 1, 1, 1, 1,
-1.807139, 0.9277945, -0.4463686, 1, 1, 1, 1, 1,
-1.801677, 0.4317852, -0.2045067, 1, 1, 1, 1, 1,
-1.796739, -0.5842338, -2.051701, 1, 1, 1, 1, 1,
-1.75689, -0.00654593, -1.737674, 1, 1, 1, 1, 1,
-1.754105, 1.413423, -0.416617, 1, 1, 1, 1, 1,
-1.75023, -0.8370631, -2.602981, 1, 1, 1, 1, 1,
-1.726545, -0.5588002, -0.147608, 1, 1, 1, 1, 1,
-1.716156, 0.4655702, -0.9929498, 1, 1, 1, 1, 1,
-1.703049, -0.7707808, -0.5082124, 1, 1, 1, 1, 1,
-1.690444, 0.2214058, -1.295519, 0, 0, 1, 1, 1,
-1.688191, -0.6984195, -1.995185, 1, 0, 0, 1, 1,
-1.688082, -0.5427015, -1.673761, 1, 0, 0, 1, 1,
-1.679935, 1.806362, -2.732596, 1, 0, 0, 1, 1,
-1.674825, 0.4941933, -1.721053, 1, 0, 0, 1, 1,
-1.661021, -0.1175996, -1.358498, 1, 0, 0, 1, 1,
-1.638314, -0.7165353, -0.4322359, 0, 0, 0, 1, 1,
-1.612318, 0.3964474, -1.910061, 0, 0, 0, 1, 1,
-1.609223, -1.150717, -1.690163, 0, 0, 0, 1, 1,
-1.608271, 0.0946046, -1.991687, 0, 0, 0, 1, 1,
-1.594295, -0.3158427, -1.716248, 0, 0, 0, 1, 1,
-1.591898, 1.058091, 0.7670413, 0, 0, 0, 1, 1,
-1.582065, -2.575233, -2.011216, 0, 0, 0, 1, 1,
-1.54744, 0.5315059, -1.143677, 1, 1, 1, 1, 1,
-1.546427, -0.6274365, -2.258271, 1, 1, 1, 1, 1,
-1.542898, -0.03647435, -0.8824431, 1, 1, 1, 1, 1,
-1.541619, 0.06140316, -2.175648, 1, 1, 1, 1, 1,
-1.525291, 0.05236555, -3.118894, 1, 1, 1, 1, 1,
-1.504573, -0.8098606, -2.783321, 1, 1, 1, 1, 1,
-1.504323, 2.104817, -1.62426, 1, 1, 1, 1, 1,
-1.500386, -0.7631333, -2.32721, 1, 1, 1, 1, 1,
-1.495189, -0.9498076, -1.470443, 1, 1, 1, 1, 1,
-1.485426, 0.02240226, -1.576716, 1, 1, 1, 1, 1,
-1.484798, -1.403942, -0.690917, 1, 1, 1, 1, 1,
-1.484087, 1.317451, -0.3682223, 1, 1, 1, 1, 1,
-1.476604, -1.040699, -3.356997, 1, 1, 1, 1, 1,
-1.475582, -0.2565373, -1.438912, 1, 1, 1, 1, 1,
-1.45934, 1.14568, -1.473811, 1, 1, 1, 1, 1,
-1.458363, -2.645215, -2.067452, 0, 0, 1, 1, 1,
-1.4567, 1.088164, -1.650896, 1, 0, 0, 1, 1,
-1.454822, 2.26277, -0.9328335, 1, 0, 0, 1, 1,
-1.4329, -0.9440864, -0.2445554, 1, 0, 0, 1, 1,
-1.430616, -2.851523, -3.219568, 1, 0, 0, 1, 1,
-1.42631, 1.703858, -0.3011752, 1, 0, 0, 1, 1,
-1.42034, -0.1601541, -0.9193312, 0, 0, 0, 1, 1,
-1.410208, 0.06549046, -1.018911, 0, 0, 0, 1, 1,
-1.399344, 0.04420464, -0.9466226, 0, 0, 0, 1, 1,
-1.391887, 0.4444925, -0.2556674, 0, 0, 0, 1, 1,
-1.391438, -0.9351385, -4.594798, 0, 0, 0, 1, 1,
-1.390302, 0.1067352, -0.696469, 0, 0, 0, 1, 1,
-1.38515, 1.419552, 0.5332614, 0, 0, 0, 1, 1,
-1.38505, 2.390109, 0.03771127, 1, 1, 1, 1, 1,
-1.362371, -0.2436039, -1.287767, 1, 1, 1, 1, 1,
-1.355697, -0.3279743, -2.923948, 1, 1, 1, 1, 1,
-1.346168, 0.8618135, -1.905043, 1, 1, 1, 1, 1,
-1.344953, 1.250728, -0.2573895, 1, 1, 1, 1, 1,
-1.275846, -0.3324475, -1.114532, 1, 1, 1, 1, 1,
-1.273553, -1.001808, -2.727334, 1, 1, 1, 1, 1,
-1.269383, -0.20314, -1.469324, 1, 1, 1, 1, 1,
-1.263951, -1.412448, -2.372646, 1, 1, 1, 1, 1,
-1.257653, 0.05860965, -3.514491, 1, 1, 1, 1, 1,
-1.254172, 0.7520647, -0.3937627, 1, 1, 1, 1, 1,
-1.248323, 1.552804, -0.7735102, 1, 1, 1, 1, 1,
-1.243119, 1.406719, -0.4961157, 1, 1, 1, 1, 1,
-1.238744, 0.1778863, -1.273313, 1, 1, 1, 1, 1,
-1.238393, -0.462546, -2.419949, 1, 1, 1, 1, 1,
-1.228081, 0.297965, -1.24426, 0, 0, 1, 1, 1,
-1.226315, -1.394608, -3.002779, 1, 0, 0, 1, 1,
-1.224437, 0.8824117, -0.04199506, 1, 0, 0, 1, 1,
-1.224097, -0.3426102, -1.754525, 1, 0, 0, 1, 1,
-1.222479, 1.309037, -0.6881853, 1, 0, 0, 1, 1,
-1.215893, 0.5922645, -1.483549, 1, 0, 0, 1, 1,
-1.214193, -0.3807638, -3.039047, 0, 0, 0, 1, 1,
-1.205369, -0.8088797, -2.236763, 0, 0, 0, 1, 1,
-1.203689, -0.4295197, -4.062259, 0, 0, 0, 1, 1,
-1.201657, 1.106838, -2.108853, 0, 0, 0, 1, 1,
-1.200791, -2.02599, -1.857041, 0, 0, 0, 1, 1,
-1.191843, 0.08346537, -2.124017, 0, 0, 0, 1, 1,
-1.188565, -0.3241204, -0.108238, 0, 0, 0, 1, 1,
-1.180878, 2.418886, -1.283647, 1, 1, 1, 1, 1,
-1.176233, -0.03643436, -2.936955, 1, 1, 1, 1, 1,
-1.173623, 0.3843599, -1.208449, 1, 1, 1, 1, 1,
-1.167008, 0.8290988, -0.6331476, 1, 1, 1, 1, 1,
-1.166335, -2.018951, -3.512249, 1, 1, 1, 1, 1,
-1.165707, 0.4644137, -0.6895388, 1, 1, 1, 1, 1,
-1.162556, 0.4691465, -1.397213, 1, 1, 1, 1, 1,
-1.160454, 0.1832707, -1.565302, 1, 1, 1, 1, 1,
-1.15734, -0.9282666, -2.736831, 1, 1, 1, 1, 1,
-1.149743, -0.8043008, -1.991067, 1, 1, 1, 1, 1,
-1.140314, -0.650521, -4.315946, 1, 1, 1, 1, 1,
-1.136687, 0.4364351, -0.3360413, 1, 1, 1, 1, 1,
-1.13333, -0.7685608, -3.872409, 1, 1, 1, 1, 1,
-1.131103, 0.2969462, -2.381576, 1, 1, 1, 1, 1,
-1.128695, -0.06678316, -1.831434, 1, 1, 1, 1, 1,
-1.126075, -0.4207266, -3.153951, 0, 0, 1, 1, 1,
-1.122819, -0.2040002, -3.783496, 1, 0, 0, 1, 1,
-1.122188, -0.9463378, -3.033891, 1, 0, 0, 1, 1,
-1.120832, 0.01335191, -1.780975, 1, 0, 0, 1, 1,
-1.116214, 0.4431191, -0.9473312, 1, 0, 0, 1, 1,
-1.094032, 0.6092769, -1.809534, 1, 0, 0, 1, 1,
-1.092892, -0.007502867, -2.383131, 0, 0, 0, 1, 1,
-1.089277, -1.90187, -3.320956, 0, 0, 0, 1, 1,
-1.088042, 1.915001, -0.1716451, 0, 0, 0, 1, 1,
-1.083375, -0.8534565, -2.234838, 0, 0, 0, 1, 1,
-1.07619, -0.2503403, -0.3776366, 0, 0, 0, 1, 1,
-1.067689, 0.4026338, -3.202578, 0, 0, 0, 1, 1,
-1.066729, 1.444266, -2.643718, 0, 0, 0, 1, 1,
-1.063923, 1.082211, -2.301042, 1, 1, 1, 1, 1,
-1.062125, 0.4503688, -1.732163, 1, 1, 1, 1, 1,
-1.060832, 0.5652169, -0.8325741, 1, 1, 1, 1, 1,
-1.055924, -0.8907476, -2.553363, 1, 1, 1, 1, 1,
-1.054442, 1.189003, 0.5137804, 1, 1, 1, 1, 1,
-1.052523, 0.4152895, -1.347657, 1, 1, 1, 1, 1,
-1.043231, -0.8218584, -2.240732, 1, 1, 1, 1, 1,
-1.029366, 0.912501, -0.6851863, 1, 1, 1, 1, 1,
-1.029264, 0.03769557, -0.4513234, 1, 1, 1, 1, 1,
-1.026876, -0.6072836, -3.640845, 1, 1, 1, 1, 1,
-1.026708, 0.8382043, -0.5188719, 1, 1, 1, 1, 1,
-1.026079, 0.654901, -0.2945256, 1, 1, 1, 1, 1,
-1.018986, 0.6698316, -0.7883874, 1, 1, 1, 1, 1,
-1.016756, -0.2266426, -1.186941, 1, 1, 1, 1, 1,
-0.9998174, -0.709024, -2.074495, 1, 1, 1, 1, 1,
-0.9955406, -1.152874, -2.948995, 0, 0, 1, 1, 1,
-0.9938931, 0.03613334, -1.829261, 1, 0, 0, 1, 1,
-0.9858565, 0.5815623, 0.8966446, 1, 0, 0, 1, 1,
-0.9777198, -0.6392126, -2.619247, 1, 0, 0, 1, 1,
-0.9740877, -0.3936626, -0.6131357, 1, 0, 0, 1, 1,
-0.960946, 1.458075, -0.8434941, 1, 0, 0, 1, 1,
-0.95717, 0.6161416, 0.0896522, 0, 0, 0, 1, 1,
-0.9564424, -0.3872473, -0.3462704, 0, 0, 0, 1, 1,
-0.9491901, 0.5916327, -0.3509308, 0, 0, 0, 1, 1,
-0.9465603, -0.7015705, -1.976337, 0, 0, 0, 1, 1,
-0.93849, 1.577866, -0.7805449, 0, 0, 0, 1, 1,
-0.9367795, 0.1939386, -2.05564, 0, 0, 0, 1, 1,
-0.9366242, 1.189272, -1.554764, 0, 0, 0, 1, 1,
-0.9345555, 0.711346, -0.7606868, 1, 1, 1, 1, 1,
-0.9260665, -0.02820052, -0.2455487, 1, 1, 1, 1, 1,
-0.9252356, 0.9206043, -0.6250974, 1, 1, 1, 1, 1,
-0.9244856, -0.05162724, -2.846681, 1, 1, 1, 1, 1,
-0.9189982, -0.6230241, -2.718339, 1, 1, 1, 1, 1,
-0.9176839, 0.607829, -0.40549, 1, 1, 1, 1, 1,
-0.9170653, 0.2184401, -0.7824596, 1, 1, 1, 1, 1,
-0.9140811, -0.5279579, -2.031922, 1, 1, 1, 1, 1,
-0.9011139, 1.226195, -0.02004003, 1, 1, 1, 1, 1,
-0.8993772, -0.9251646, -2.636853, 1, 1, 1, 1, 1,
-0.898194, 0.7946404, -1.883467, 1, 1, 1, 1, 1,
-0.8969595, 1.952292, -0.6603295, 1, 1, 1, 1, 1,
-0.8963279, 0.6599149, -0.8623981, 1, 1, 1, 1, 1,
-0.8900002, 0.7921091, 0.7426617, 1, 1, 1, 1, 1,
-0.887018, -0.574503, -1.670636, 1, 1, 1, 1, 1,
-0.8857401, -1.419277, -3.849689, 0, 0, 1, 1, 1,
-0.882385, -0.8861966, -1.603342, 1, 0, 0, 1, 1,
-0.8817741, 0.3847122, -0.8203721, 1, 0, 0, 1, 1,
-0.8748561, 0.8813957, -1.811573, 1, 0, 0, 1, 1,
-0.8741281, 0.715383, 0.2802906, 1, 0, 0, 1, 1,
-0.865617, 0.7493069, -0.3299305, 1, 0, 0, 1, 1,
-0.8637046, -0.9648262, -2.775515, 0, 0, 0, 1, 1,
-0.8634887, 0.8398225, -0.5304784, 0, 0, 0, 1, 1,
-0.8626502, -0.9115343, -3.223097, 0, 0, 0, 1, 1,
-0.8583736, 0.594392, -0.1823034, 0, 0, 0, 1, 1,
-0.8564616, -0.9174113, -3.724081, 0, 0, 0, 1, 1,
-0.8558099, -0.167081, -0.6323974, 0, 0, 0, 1, 1,
-0.8523012, 0.4237463, -0.4677851, 0, 0, 0, 1, 1,
-0.8510549, -0.2701386, 0.4672902, 1, 1, 1, 1, 1,
-0.8498203, 1.960033, -1.793577, 1, 1, 1, 1, 1,
-0.845259, -1.36839, -1.694638, 1, 1, 1, 1, 1,
-0.8431766, 2.176121, 1.645018, 1, 1, 1, 1, 1,
-0.8426671, 0.4924138, -2.256657, 1, 1, 1, 1, 1,
-0.8420476, 0.3000287, -0.07486562, 1, 1, 1, 1, 1,
-0.833493, -0.1010249, -2.03321, 1, 1, 1, 1, 1,
-0.8323365, -0.3054249, -3.521155, 1, 1, 1, 1, 1,
-0.8252364, 1.335007, -0.1760529, 1, 1, 1, 1, 1,
-0.81099, 0.5489045, -0.8087698, 1, 1, 1, 1, 1,
-0.8064448, -0.5868101, -3.173326, 1, 1, 1, 1, 1,
-0.8061852, 0.2422349, -0.2441882, 1, 1, 1, 1, 1,
-0.8054283, 0.04832528, -2.790734, 1, 1, 1, 1, 1,
-0.7944409, -0.2372122, -0.6341044, 1, 1, 1, 1, 1,
-0.7930122, -0.03422528, -0.07520559, 1, 1, 1, 1, 1,
-0.7893068, -0.08260242, -1.101173, 0, 0, 1, 1, 1,
-0.7892349, 0.7593578, -1.740591, 1, 0, 0, 1, 1,
-0.7765006, 0.7926461, -1.836743, 1, 0, 0, 1, 1,
-0.7738917, 1.894237, 0.3670362, 1, 0, 0, 1, 1,
-0.7738761, 1.079694, 0.07594429, 1, 0, 0, 1, 1,
-0.7735564, -0.2735071, -1.462327, 1, 0, 0, 1, 1,
-0.7709818, 0.4740206, -0.8041176, 0, 0, 0, 1, 1,
-0.7637685, 0.4848036, -1.00478, 0, 0, 0, 1, 1,
-0.7635759, 0.3415948, -2.82502, 0, 0, 0, 1, 1,
-0.7556074, 0.7730093, 0.3808484, 0, 0, 0, 1, 1,
-0.7549086, -1.280431, -1.828003, 0, 0, 0, 1, 1,
-0.7519172, -0.03675125, -1.640295, 0, 0, 0, 1, 1,
-0.7416166, 1.179222, -0.351773, 0, 0, 0, 1, 1,
-0.7411453, 0.6228487, 0.3308359, 1, 1, 1, 1, 1,
-0.7348104, 0.9175154, -0.689428, 1, 1, 1, 1, 1,
-0.7346899, -1.832072, -3.588872, 1, 1, 1, 1, 1,
-0.73373, 1.160003, -1.964703, 1, 1, 1, 1, 1,
-0.7311277, -0.4425426, -3.306591, 1, 1, 1, 1, 1,
-0.7255378, 1.657312, 1.062017, 1, 1, 1, 1, 1,
-0.7206124, -0.9284231, -3.237672, 1, 1, 1, 1, 1,
-0.7183181, 0.1792315, -2.984557, 1, 1, 1, 1, 1,
-0.7137327, 0.9730024, -0.1584519, 1, 1, 1, 1, 1,
-0.7136558, -1.372297, -2.883536, 1, 1, 1, 1, 1,
-0.7125621, 1.68235, 1.102972, 1, 1, 1, 1, 1,
-0.707342, 0.3479323, -1.395693, 1, 1, 1, 1, 1,
-0.7055916, 0.2473389, -0.9607143, 1, 1, 1, 1, 1,
-0.6957811, 0.1421843, -0.616097, 1, 1, 1, 1, 1,
-0.6886973, -1.629402, -3.334867, 1, 1, 1, 1, 1,
-0.685135, -1.517942, -3.221324, 0, 0, 1, 1, 1,
-0.6773477, -0.2137387, -3.049976, 1, 0, 0, 1, 1,
-0.6750529, 0.8711252, -1.554364, 1, 0, 0, 1, 1,
-0.6699215, 1.854073, -0.7209138, 1, 0, 0, 1, 1,
-0.6682853, -1.604878, -2.801335, 1, 0, 0, 1, 1,
-0.6659948, -0.09698093, -0.1056372, 1, 0, 0, 1, 1,
-0.6650774, -0.3705937, -2.032612, 0, 0, 0, 1, 1,
-0.6647546, 0.04097126, -2.584338, 0, 0, 0, 1, 1,
-0.6643461, -0.4249736, -3.545348, 0, 0, 0, 1, 1,
-0.6627853, 0.1030701, -3.175101, 0, 0, 0, 1, 1,
-0.6616939, 0.6982919, 0.6950117, 0, 0, 0, 1, 1,
-0.65948, 0.6373, -1.141945, 0, 0, 0, 1, 1,
-0.6591945, -0.4773478, -1.58476, 0, 0, 0, 1, 1,
-0.658758, 0.2984416, -0.1184921, 1, 1, 1, 1, 1,
-0.6569306, 0.7526603, 0.9634779, 1, 1, 1, 1, 1,
-0.6511478, 1.276465, 1.512002, 1, 1, 1, 1, 1,
-0.6497193, 0.3157937, -2.141364, 1, 1, 1, 1, 1,
-0.6471879, -0.3843602, -2.879002, 1, 1, 1, 1, 1,
-0.6313283, 1.016435, 0.1318065, 1, 1, 1, 1, 1,
-0.6283812, 0.4853452, -0.7434228, 1, 1, 1, 1, 1,
-0.620082, 0.8738727, -0.6093324, 1, 1, 1, 1, 1,
-0.6193349, -0.2652813, -2.973242, 1, 1, 1, 1, 1,
-0.6188088, 1.027195, -0.4585212, 1, 1, 1, 1, 1,
-0.6178951, 0.05294602, -1.293083, 1, 1, 1, 1, 1,
-0.6176847, 0.366743, -1.100334, 1, 1, 1, 1, 1,
-0.6165168, -1.938365, -3.479166, 1, 1, 1, 1, 1,
-0.614305, -0.9276889, -2.043865, 1, 1, 1, 1, 1,
-0.6142316, 0.7345856, -0.5168471, 1, 1, 1, 1, 1,
-0.6117958, 0.08195022, -1.736714, 0, 0, 1, 1, 1,
-0.6030404, 0.5291248, -0.3532574, 1, 0, 0, 1, 1,
-0.6029052, -0.1987194, -1.004691, 1, 0, 0, 1, 1,
-0.6024844, 0.3936916, -1.432428, 1, 0, 0, 1, 1,
-0.5940047, -1.569938, -3.887899, 1, 0, 0, 1, 1,
-0.5868715, -1.34012, -1.157091, 1, 0, 0, 1, 1,
-0.58235, -0.4358876, -2.998889, 0, 0, 0, 1, 1,
-0.5805752, 0.757851, -1.226288, 0, 0, 0, 1, 1,
-0.5801586, -1.861851, -2.874239, 0, 0, 0, 1, 1,
-0.5772455, -1.185111, -2.492054, 0, 0, 0, 1, 1,
-0.5710443, -1.572263, -4.711555, 0, 0, 0, 1, 1,
-0.5677103, -0.4971929, -2.484915, 0, 0, 0, 1, 1,
-0.5632945, 1.074658, -1.342005, 0, 0, 0, 1, 1,
-0.5620694, 0.03539253, -1.951806, 1, 1, 1, 1, 1,
-0.5618673, -0.5102864, -2.441712, 1, 1, 1, 1, 1,
-0.5603801, -0.5405199, -1.080141, 1, 1, 1, 1, 1,
-0.5596639, -0.1179297, -2.884238, 1, 1, 1, 1, 1,
-0.5569409, -2.32712, -4.369498, 1, 1, 1, 1, 1,
-0.5567834, 0.3578201, -1.114124, 1, 1, 1, 1, 1,
-0.5544146, -1.343274, -3.576794, 1, 1, 1, 1, 1,
-0.5542489, 1.791409, 0.02914012, 1, 1, 1, 1, 1,
-0.5534896, 0.5867131, -0.3937162, 1, 1, 1, 1, 1,
-0.5487362, 2.610266, -0.7163836, 1, 1, 1, 1, 1,
-0.5417761, 1.605181, 0.484402, 1, 1, 1, 1, 1,
-0.5363658, -0.6350721, -3.089507, 1, 1, 1, 1, 1,
-0.5351162, -1.856298, -2.864602, 1, 1, 1, 1, 1,
-0.5336933, -0.7703952, -1.539405, 1, 1, 1, 1, 1,
-0.5302833, 0.3847336, 0.2435043, 1, 1, 1, 1, 1,
-0.5272717, 1.121444, 0.5153078, 0, 0, 1, 1, 1,
-0.5269786, 0.5414776, -2.002705, 1, 0, 0, 1, 1,
-0.5197868, -0.1149933, -1.611603, 1, 0, 0, 1, 1,
-0.511184, -0.8122183, -2.411515, 1, 0, 0, 1, 1,
-0.5099057, 0.4594702, -0.363173, 1, 0, 0, 1, 1,
-0.5083283, 0.5935773, -1.085609, 1, 0, 0, 1, 1,
-0.506172, 0.3640619, -1.220343, 0, 0, 0, 1, 1,
-0.5004733, -1.036763, -1.877792, 0, 0, 0, 1, 1,
-0.4994079, 1.826169, 0.01845478, 0, 0, 0, 1, 1,
-0.4989796, -0.08859055, -2.137808, 0, 0, 0, 1, 1,
-0.4983812, -0.4548949, -1.914307, 0, 0, 0, 1, 1,
-0.4977079, -1.397961, -2.258909, 0, 0, 0, 1, 1,
-0.4957033, 0.3187015, 0.06122219, 0, 0, 0, 1, 1,
-0.4952787, -0.8135374, -2.185212, 1, 1, 1, 1, 1,
-0.4854453, -0.1322424, -1.128361, 1, 1, 1, 1, 1,
-0.4839947, 1.653459, 0.5550482, 1, 1, 1, 1, 1,
-0.4818679, 0.7041373, 1.251184, 1, 1, 1, 1, 1,
-0.4787595, 2.590849, 0.1984375, 1, 1, 1, 1, 1,
-0.4783244, 0.4176529, -2.19106, 1, 1, 1, 1, 1,
-0.4739152, 0.5773167, 0.5727706, 1, 1, 1, 1, 1,
-0.4737216, -0.833452, -1.371998, 1, 1, 1, 1, 1,
-0.4709897, -1.529922, -1.647923, 1, 1, 1, 1, 1,
-0.4709144, -0.066291, -1.780171, 1, 1, 1, 1, 1,
-0.4692664, 0.8789944, -0.615464, 1, 1, 1, 1, 1,
-0.4692473, -0.728828, -2.835478, 1, 1, 1, 1, 1,
-0.4657807, -1.266233, -2.43823, 1, 1, 1, 1, 1,
-0.4636914, 1.166779, 1.279086, 1, 1, 1, 1, 1,
-0.4629312, 0.409097, -1.393851, 1, 1, 1, 1, 1,
-0.4600695, 1.530455, 0.007671801, 0, 0, 1, 1, 1,
-0.4431161, 0.2303286, -1.411385, 1, 0, 0, 1, 1,
-0.4424116, 1.922318, -0.4452111, 1, 0, 0, 1, 1,
-0.4404473, 1.204951, 0.7800538, 1, 0, 0, 1, 1,
-0.4395196, 0.8224089, -1.440095, 1, 0, 0, 1, 1,
-0.4389681, -0.007589488, -1.445185, 1, 0, 0, 1, 1,
-0.4364945, -0.2607708, -0.3146286, 0, 0, 0, 1, 1,
-0.4334472, -0.4042554, -2.55011, 0, 0, 0, 1, 1,
-0.4316793, -0.5545641, -3.246357, 0, 0, 0, 1, 1,
-0.4291513, -1.091246, -2.21662, 0, 0, 0, 1, 1,
-0.422009, 1.586384, -0.4289237, 0, 0, 0, 1, 1,
-0.4168837, -0.4510064, -1.884805, 0, 0, 0, 1, 1,
-0.4148548, 0.6882504, -1.388279, 0, 0, 0, 1, 1,
-0.4148353, -0.263999, -0.8291664, 1, 1, 1, 1, 1,
-0.4091823, -0.615826, -3.478357, 1, 1, 1, 1, 1,
-0.4068968, -0.3333159, -1.080836, 1, 1, 1, 1, 1,
-0.4067039, 1.159667, -1.636524, 1, 1, 1, 1, 1,
-0.4065569, -1.293389, -1.223918, 1, 1, 1, 1, 1,
-0.4010725, 1.269533, 0.7919799, 1, 1, 1, 1, 1,
-0.3946417, 0.9508076, -0.4755746, 1, 1, 1, 1, 1,
-0.3878435, 0.00439467, -1.827749, 1, 1, 1, 1, 1,
-0.3854016, -0.515535, -2.205038, 1, 1, 1, 1, 1,
-0.3846185, -0.752986, -1.848927, 1, 1, 1, 1, 1,
-0.381852, 0.3093865, -0.3426597, 1, 1, 1, 1, 1,
-0.3793888, -0.6896015, -1.25155, 1, 1, 1, 1, 1,
-0.3763654, 0.9016076, 0.1525885, 1, 1, 1, 1, 1,
-0.3715396, -0.4299935, -1.057883, 1, 1, 1, 1, 1,
-0.3679819, 0.2178559, -1.096211, 1, 1, 1, 1, 1,
-0.3609726, 0.2461793, -0.3443632, 0, 0, 1, 1, 1,
-0.3594769, 0.2493267, -1.348181, 1, 0, 0, 1, 1,
-0.3584975, -2.05594, -3.15846, 1, 0, 0, 1, 1,
-0.3498898, 0.3116603, -0.8612205, 1, 0, 0, 1, 1,
-0.3430971, 2.283723, 0.3516562, 1, 0, 0, 1, 1,
-0.3423741, -1.177306, -3.504962, 1, 0, 0, 1, 1,
-0.3373407, -0.491899, -2.735774, 0, 0, 0, 1, 1,
-0.3367267, -0.4530964, -2.114666, 0, 0, 0, 1, 1,
-0.3309241, 0.04438628, -1.098252, 0, 0, 0, 1, 1,
-0.3291699, -1.230718, -2.420842, 0, 0, 0, 1, 1,
-0.3273203, 0.4809699, -0.9881073, 0, 0, 0, 1, 1,
-0.3267308, -0.6300573, -2.426511, 0, 0, 0, 1, 1,
-0.3265499, 0.6176906, 0.0979545, 0, 0, 0, 1, 1,
-0.3263461, -1.283521, -2.321974, 1, 1, 1, 1, 1,
-0.3252443, 1.305892, -1.823799, 1, 1, 1, 1, 1,
-0.3246704, -1.706784, -4.385651, 1, 1, 1, 1, 1,
-0.3234012, -0.5836821, -3.640532, 1, 1, 1, 1, 1,
-0.3210647, -0.6981061, -3.841612, 1, 1, 1, 1, 1,
-0.32032, 0.3734843, -1.626002, 1, 1, 1, 1, 1,
-0.3147635, -0.08797783, -3.238677, 1, 1, 1, 1, 1,
-0.3081943, 0.3499849, -1.501536, 1, 1, 1, 1, 1,
-0.3062758, -1.944159, -0.5930875, 1, 1, 1, 1, 1,
-0.3057488, 1.886281, -0.544017, 1, 1, 1, 1, 1,
-0.2967226, -1.467715, -3.541185, 1, 1, 1, 1, 1,
-0.2959379, -0.05566251, -2.237699, 1, 1, 1, 1, 1,
-0.2918518, -0.2922065, -3.674642, 1, 1, 1, 1, 1,
-0.2874148, 0.4810308, -0.591556, 1, 1, 1, 1, 1,
-0.2873934, -0.9393507, -4.612537, 1, 1, 1, 1, 1,
-0.2862792, 1.095085, 0.06254107, 0, 0, 1, 1, 1,
-0.2843069, 0.3371463, -0.4823625, 1, 0, 0, 1, 1,
-0.2805292, -0.5484779, -3.720473, 1, 0, 0, 1, 1,
-0.2782006, 1.774436, -1.260189, 1, 0, 0, 1, 1,
-0.2770622, 1.213871, -1.160005, 1, 0, 0, 1, 1,
-0.2765126, 0.5376399, -0.8591711, 1, 0, 0, 1, 1,
-0.275666, 0.07117452, -1.672822, 0, 0, 0, 1, 1,
-0.2743359, 0.3119041, -0.5107709, 0, 0, 0, 1, 1,
-0.2725998, 0.7221202, -1.925127, 0, 0, 0, 1, 1,
-0.2718665, -1.591716, -3.282083, 0, 0, 0, 1, 1,
-0.2693949, -0.8998774, -3.461863, 0, 0, 0, 1, 1,
-0.2648121, 1.311508, 1.014557, 0, 0, 0, 1, 1,
-0.2593392, -0.6947726, -5.342846, 0, 0, 0, 1, 1,
-0.2580656, -0.3989012, -2.275787, 1, 1, 1, 1, 1,
-0.253933, -0.06201247, -2.254533, 1, 1, 1, 1, 1,
-0.2499121, 0.0009179355, -1.092437, 1, 1, 1, 1, 1,
-0.2459921, -0.7934313, -2.543694, 1, 1, 1, 1, 1,
-0.2440131, -2.076123, -2.269329, 1, 1, 1, 1, 1,
-0.2433805, -0.2043622, -2.191875, 1, 1, 1, 1, 1,
-0.2431301, -0.3918357, -3.616372, 1, 1, 1, 1, 1,
-0.2418272, 1.290283, 0.1812381, 1, 1, 1, 1, 1,
-0.240089, 0.6934497, -2.782114, 1, 1, 1, 1, 1,
-0.2397179, 1.208221, 0.6996514, 1, 1, 1, 1, 1,
-0.2357997, 1.725345, 0.3630154, 1, 1, 1, 1, 1,
-0.2308165, 0.35585, -0.8314503, 1, 1, 1, 1, 1,
-0.2281674, 0.6114484, -0.8283235, 1, 1, 1, 1, 1,
-0.2213748, 0.7094935, -0.03200145, 1, 1, 1, 1, 1,
-0.2209799, -1.488579, -4.282947, 1, 1, 1, 1, 1,
-0.2200175, -0.8696195, -3.369301, 0, 0, 1, 1, 1,
-0.2194835, -1.358555, -3.667825, 1, 0, 0, 1, 1,
-0.2165648, -0.8429612, -2.658534, 1, 0, 0, 1, 1,
-0.2161151, -0.3583638, -3.805683, 1, 0, 0, 1, 1,
-0.215107, -0.279406, -3.42566, 1, 0, 0, 1, 1,
-0.2140626, -2.178436, -2.470854, 1, 0, 0, 1, 1,
-0.2124103, -0.7229751, -1.088751, 0, 0, 0, 1, 1,
-0.2092948, -1.063875, -1.564222, 0, 0, 0, 1, 1,
-0.2078301, -1.400912, -2.84016, 0, 0, 0, 1, 1,
-0.2030595, -0.07583547, -1.957844, 0, 0, 0, 1, 1,
-0.2026314, -0.1666172, -3.753527, 0, 0, 0, 1, 1,
-0.2014756, 2.274611, -0.008548501, 0, 0, 0, 1, 1,
-0.2012719, -1.396371, -2.649589, 0, 0, 0, 1, 1,
-0.1972624, 0.5758387, -0.4920094, 1, 1, 1, 1, 1,
-0.193955, -0.1661999, -3.097371, 1, 1, 1, 1, 1,
-0.1921669, 1.118348, 0.5271192, 1, 1, 1, 1, 1,
-0.1911981, -0.6212264, -4.776432, 1, 1, 1, 1, 1,
-0.1892478, 0.1069951, -0.1101497, 1, 1, 1, 1, 1,
-0.1892147, 0.8996943, 0.2537279, 1, 1, 1, 1, 1,
-0.1891097, -0.7219556, -4.037829, 1, 1, 1, 1, 1,
-0.1884712, -0.9446151, -3.422293, 1, 1, 1, 1, 1,
-0.1869671, 1.165497, 0.1631108, 1, 1, 1, 1, 1,
-0.1837295, 0.779052, 0.4941875, 1, 1, 1, 1, 1,
-0.1835648, -0.3449229, -4.035811, 1, 1, 1, 1, 1,
-0.1726732, 0.1919602, -0.4164697, 1, 1, 1, 1, 1,
-0.169911, 0.3554194, -2.239802, 1, 1, 1, 1, 1,
-0.1693766, 0.9842881, 0.01902958, 1, 1, 1, 1, 1,
-0.1668922, -0.2515566, -2.722644, 1, 1, 1, 1, 1,
-0.1657963, 0.8710541, 0.2403252, 0, 0, 1, 1, 1,
-0.1620264, 1.447796, -0.4080116, 1, 0, 0, 1, 1,
-0.1497088, -1.024922, -3.187643, 1, 0, 0, 1, 1,
-0.1478833, 1.119157, 0.8948405, 1, 0, 0, 1, 1,
-0.1472556, -0.09993818, -1.887205, 1, 0, 0, 1, 1,
-0.146724, -1.703749, -2.263211, 1, 0, 0, 1, 1,
-0.1444467, 0.8260484, -1.52717, 0, 0, 0, 1, 1,
-0.140809, 0.768162, -0.4177024, 0, 0, 0, 1, 1,
-0.133363, 0.1891914, -0.4255445, 0, 0, 0, 1, 1,
-0.1330711, 0.0002908487, -2.218549, 0, 0, 0, 1, 1,
-0.132833, 0.3205385, -0.04317359, 0, 0, 0, 1, 1,
-0.1304266, -0.8002964, -2.837678, 0, 0, 0, 1, 1,
-0.1292959, 1.088488, -0.8231575, 0, 0, 0, 1, 1,
-0.1289984, -0.2911259, -1.275117, 1, 1, 1, 1, 1,
-0.1287622, 0.2130581, 0.3683609, 1, 1, 1, 1, 1,
-0.1283857, 0.9249259, -0.8737015, 1, 1, 1, 1, 1,
-0.1266976, 1.929451, -0.8936402, 1, 1, 1, 1, 1,
-0.1239539, 0.09133539, -0.9912329, 1, 1, 1, 1, 1,
-0.1214647, -0.2809302, -2.632024, 1, 1, 1, 1, 1,
-0.1197643, 0.7256227, -0.5628151, 1, 1, 1, 1, 1,
-0.1192904, -1.621164, -2.777201, 1, 1, 1, 1, 1,
-0.1132005, -0.5186592, -2.724313, 1, 1, 1, 1, 1,
-0.1117033, -0.1571896, -1.910387, 1, 1, 1, 1, 1,
-0.1114501, 0.2183701, -0.2106206, 1, 1, 1, 1, 1,
-0.1108629, 0.9702114, -1.201293, 1, 1, 1, 1, 1,
-0.1107636, -0.3543434, -1.716012, 1, 1, 1, 1, 1,
-0.108985, -1.780499, -2.843258, 1, 1, 1, 1, 1,
-0.1066574, 1.159086, 0.2696266, 1, 1, 1, 1, 1,
-0.1049144, 0.5963126, -1.50976, 0, 0, 1, 1, 1,
-0.1000459, -1.082312, -3.223998, 1, 0, 0, 1, 1,
-0.09980541, 0.1251382, -1.165068, 1, 0, 0, 1, 1,
-0.09933525, -0.1644415, -1.75976, 1, 0, 0, 1, 1,
-0.0975734, 0.8158448, -0.01297151, 1, 0, 0, 1, 1,
-0.09523063, 1.23251, -0.7119753, 1, 0, 0, 1, 1,
-0.09145804, 0.8116927, -2.383216, 0, 0, 0, 1, 1,
-0.08992175, -0.7197549, -3.052304, 0, 0, 0, 1, 1,
-0.08711124, 1.467932, 0.3172456, 0, 0, 0, 1, 1,
-0.0860805, -0.5280243, -3.787719, 0, 0, 0, 1, 1,
-0.08349351, 0.3069246, 0.7542505, 0, 0, 0, 1, 1,
-0.08234797, 1.356, 0.4322142, 0, 0, 0, 1, 1,
-0.08104245, -0.9884635, -5.140676, 0, 0, 0, 1, 1,
-0.07975395, 1.250831, -2.334575, 1, 1, 1, 1, 1,
-0.07658079, -0.3543353, -0.5289493, 1, 1, 1, 1, 1,
-0.07142419, 0.6071478, -0.8815622, 1, 1, 1, 1, 1,
-0.07115695, -0.07910137, -3.239804, 1, 1, 1, 1, 1,
-0.07053653, 1.008229, -0.5927063, 1, 1, 1, 1, 1,
-0.06798255, -0.05675427, -2.086851, 1, 1, 1, 1, 1,
-0.06707054, -1.511365, -2.559685, 1, 1, 1, 1, 1,
-0.06407998, 1.081636, -0.9205447, 1, 1, 1, 1, 1,
-0.0631566, -1.636693, -6.807231, 1, 1, 1, 1, 1,
-0.05974131, -0.5378208, -2.677842, 1, 1, 1, 1, 1,
-0.05740779, 1.163004, -1.48355, 1, 1, 1, 1, 1,
-0.05717843, 0.07409765, -0.928165, 1, 1, 1, 1, 1,
-0.05596395, 0.8428516, 0.4320002, 1, 1, 1, 1, 1,
-0.05561437, -0.7028286, -2.012313, 1, 1, 1, 1, 1,
-0.05342956, 1.364695, -1.079193, 1, 1, 1, 1, 1,
-0.0522433, 1.166363, -0.3258688, 0, 0, 1, 1, 1,
-0.04717807, -1.094524, -2.85942, 1, 0, 0, 1, 1,
-0.04681663, -0.3725947, -4.484079, 1, 0, 0, 1, 1,
-0.04140668, 1.627731, 1.043589, 1, 0, 0, 1, 1,
-0.03807481, 0.4033144, -0.3079036, 1, 0, 0, 1, 1,
-0.0367367, 1.818171, 1.42574, 1, 0, 0, 1, 1,
-0.03246201, -1.509998, -3.971758, 0, 0, 0, 1, 1,
-0.03108006, -0.006706188, -3.071173, 0, 0, 0, 1, 1,
-0.02880419, 0.2990572, 1.593172, 0, 0, 0, 1, 1,
-0.02853869, 1.205928, -0.9151037, 0, 0, 0, 1, 1,
-0.02468078, -1.045873, -3.774121, 0, 0, 0, 1, 1,
-0.02450337, 0.9800404, -0.1364601, 0, 0, 0, 1, 1,
-0.02397667, 0.08982802, 0.4510106, 0, 0, 0, 1, 1,
-0.02073536, 0.2608472, 0.6974109, 1, 1, 1, 1, 1,
-0.009098164, -0.5448871, -1.751591, 1, 1, 1, 1, 1,
-0.006335184, 0.4949641, -0.0535638, 1, 1, 1, 1, 1,
-0.006254211, 1.466277, -0.7617512, 1, 1, 1, 1, 1,
-0.006137939, 0.9157834, 0.7381218, 1, 1, 1, 1, 1,
-0.004693321, 0.9164412, 1.010184, 1, 1, 1, 1, 1,
-0.0045671, 0.4627498, 0.7436651, 1, 1, 1, 1, 1,
-0.003833479, 0.2600081, -1.481571, 1, 1, 1, 1, 1,
-0.001222, -1.013426, -2.490781, 1, 1, 1, 1, 1,
-0.0003103652, 1.336589, -0.3077589, 1, 1, 1, 1, 1,
0.001197399, -0.1202355, 1.751178, 1, 1, 1, 1, 1,
0.007593274, 0.8756616, 1.519703, 1, 1, 1, 1, 1,
0.008061666, 0.6656622, 0.7801158, 1, 1, 1, 1, 1,
0.01793873, 0.5331956, -0.6715081, 1, 1, 1, 1, 1,
0.01840933, 0.009067791, -1.29292, 1, 1, 1, 1, 1,
0.02196245, 2.318822, -1.509145, 0, 0, 1, 1, 1,
0.02259267, 0.3476577, -1.601239, 1, 0, 0, 1, 1,
0.02532949, -0.7537144, 2.361518, 1, 0, 0, 1, 1,
0.02602775, 0.4710041, -0.7588232, 1, 0, 0, 1, 1,
0.03028185, -1.730263, 2.334109, 1, 0, 0, 1, 1,
0.03109468, -1.644663, 3.437773, 1, 0, 0, 1, 1,
0.03537537, -0.1956452, 1.866407, 0, 0, 0, 1, 1,
0.03839238, -0.0937357, 3.604973, 0, 0, 0, 1, 1,
0.03863827, 0.6543338, -1.835997, 0, 0, 0, 1, 1,
0.04113096, -0.7623007, 3.383999, 0, 0, 0, 1, 1,
0.04681957, -1.655991, 3.556996, 0, 0, 0, 1, 1,
0.04976272, -0.1012525, 3.234036, 0, 0, 0, 1, 1,
0.04982164, 1.211515, 0.9305662, 0, 0, 0, 1, 1,
0.05013821, -0.4714911, 0.8602143, 1, 1, 1, 1, 1,
0.0504653, -0.747881, 2.767873, 1, 1, 1, 1, 1,
0.05083844, 1.20296, 0.1115744, 1, 1, 1, 1, 1,
0.05622173, -0.156925, 3.462139, 1, 1, 1, 1, 1,
0.05631613, 0.5735772, -0.6130497, 1, 1, 1, 1, 1,
0.05679814, 0.09059448, 1.59862, 1, 1, 1, 1, 1,
0.06250932, -0.04939327, 3.573306, 1, 1, 1, 1, 1,
0.06274506, 1.526363, 1.495898, 1, 1, 1, 1, 1,
0.06300236, -1.032212, 2.936459, 1, 1, 1, 1, 1,
0.06670693, 1.540133, -0.6275139, 1, 1, 1, 1, 1,
0.06728959, -0.4740669, 3.639369, 1, 1, 1, 1, 1,
0.06980839, -0.4681755, 3.035434, 1, 1, 1, 1, 1,
0.07292769, -2.117741, 2.422823, 1, 1, 1, 1, 1,
0.07709193, -2.040793, 2.571444, 1, 1, 1, 1, 1,
0.08002543, -2.033869, 2.510531, 1, 1, 1, 1, 1,
0.08157265, -0.6530476, 2.920633, 0, 0, 1, 1, 1,
0.08953732, -0.272183, 3.485552, 1, 0, 0, 1, 1,
0.09102035, 1.015309, 1.74143, 1, 0, 0, 1, 1,
0.09158013, 0.807268, 1.543175, 1, 0, 0, 1, 1,
0.09277113, 0.9354385, 0.4259156, 1, 0, 0, 1, 1,
0.09476982, -0.4211269, 2.036379, 1, 0, 0, 1, 1,
0.09728699, -0.3177053, 4.582041, 0, 0, 0, 1, 1,
0.09958354, -0.7188339, 2.500997, 0, 0, 0, 1, 1,
0.1018429, -2.692743, 3.277092, 0, 0, 0, 1, 1,
0.10225, -0.6032391, 2.143405, 0, 0, 0, 1, 1,
0.1025235, 1.68997, 0.3172297, 0, 0, 0, 1, 1,
0.1057986, -0.1055112, 1.560586, 0, 0, 0, 1, 1,
0.1059363, 0.3027895, 1.262099, 0, 0, 0, 1, 1,
0.1063907, 1.54607, -0.1310919, 1, 1, 1, 1, 1,
0.110905, 0.7299179, -0.2062681, 1, 1, 1, 1, 1,
0.1119802, -0.7612098, 4.424613, 1, 1, 1, 1, 1,
0.1142198, -0.3076532, 1.586539, 1, 1, 1, 1, 1,
0.1173561, -0.5350051, 2.747717, 1, 1, 1, 1, 1,
0.117714, 0.9454381, -0.340582, 1, 1, 1, 1, 1,
0.1178164, 1.288018, 0.2903073, 1, 1, 1, 1, 1,
0.118846, 0.4156053, 0.4262293, 1, 1, 1, 1, 1,
0.1201989, -1.682711, 3.696754, 1, 1, 1, 1, 1,
0.1204121, -0.7788979, 4.200564, 1, 1, 1, 1, 1,
0.121916, 1.567566, -0.0815926, 1, 1, 1, 1, 1,
0.1269162, -1.427694, 3.630202, 1, 1, 1, 1, 1,
0.1326379, 1.112566, -0.7602729, 1, 1, 1, 1, 1,
0.1343569, 1.047517, -0.3876442, 1, 1, 1, 1, 1,
0.1345993, 1.213071, -0.002519831, 1, 1, 1, 1, 1,
0.1380977, -1.032315, 4.278232, 0, 0, 1, 1, 1,
0.1400861, 0.531868, 0.7830624, 1, 0, 0, 1, 1,
0.1402089, 0.7971541, 0.9638092, 1, 0, 0, 1, 1,
0.1418655, -0.05165088, 3.753985, 1, 0, 0, 1, 1,
0.1420185, 1.25969, -1.657959, 1, 0, 0, 1, 1,
0.1441877, -0.544475, 2.762717, 1, 0, 0, 1, 1,
0.1470104, -0.4454113, 2.449456, 0, 0, 0, 1, 1,
0.1472418, -0.4223401, 2.163422, 0, 0, 0, 1, 1,
0.1516017, -1.00459, 1.616518, 0, 0, 0, 1, 1,
0.1540496, -0.8672237, 3.188396, 0, 0, 0, 1, 1,
0.1546451, 0.2813444, 0.8977659, 0, 0, 0, 1, 1,
0.1580108, 0.2410252, 0.626973, 0, 0, 0, 1, 1,
0.1632519, 0.2504832, 0.6383194, 0, 0, 0, 1, 1,
0.1662091, 1.435212, 0.06518039, 1, 1, 1, 1, 1,
0.1686522, -1.201287, 2.985039, 1, 1, 1, 1, 1,
0.1688956, -0.6781791, 2.997766, 1, 1, 1, 1, 1,
0.170048, 0.4949816, 0.5671642, 1, 1, 1, 1, 1,
0.1772487, 0.3442416, -0.257758, 1, 1, 1, 1, 1,
0.1805676, -1.874432, 1.637965, 1, 1, 1, 1, 1,
0.1874814, -0.2257706, 2.147127, 1, 1, 1, 1, 1,
0.1876723, 1.126709, -0.5697951, 1, 1, 1, 1, 1,
0.1886385, -0.05537568, 0.4076282, 1, 1, 1, 1, 1,
0.1904038, -1.609527, 3.26274, 1, 1, 1, 1, 1,
0.191498, -0.5031162, 2.943013, 1, 1, 1, 1, 1,
0.1948056, -0.04223071, 1.094895, 1, 1, 1, 1, 1,
0.1985844, 0.6415207, -1.333436, 1, 1, 1, 1, 1,
0.2012529, -0.661177, 3.501706, 1, 1, 1, 1, 1,
0.2085878, -0.577828, 2.518893, 1, 1, 1, 1, 1,
0.213684, -0.2326544, 1.455418, 0, 0, 1, 1, 1,
0.2157558, -2.072149, 2.389224, 1, 0, 0, 1, 1,
0.217077, 1.492942, -0.3153848, 1, 0, 0, 1, 1,
0.2175559, 0.1487224, 0.1410876, 1, 0, 0, 1, 1,
0.2176832, -0.2933998, 2.221658, 1, 0, 0, 1, 1,
0.228344, 0.7408147, -2.483274, 1, 0, 0, 1, 1,
0.2287219, 1.583183, -1.462439, 0, 0, 0, 1, 1,
0.2287582, 2.026018, 0.832388, 0, 0, 0, 1, 1,
0.2293505, 1.05079, 0.4600513, 0, 0, 0, 1, 1,
0.2295581, 1.323187, -0.6302008, 0, 0, 0, 1, 1,
0.2296383, 0.5566784, -0.2817561, 0, 0, 0, 1, 1,
0.2307306, -1.329308, 2.735719, 0, 0, 0, 1, 1,
0.2368347, 0.9668462, 0.1125229, 0, 0, 0, 1, 1,
0.2368374, 0.558754, -1.211066, 1, 1, 1, 1, 1,
0.2423131, -0.03189372, 2.576916, 1, 1, 1, 1, 1,
0.2459585, -0.02181657, 2.201826, 1, 1, 1, 1, 1,
0.2539849, -1.388858, 4.051934, 1, 1, 1, 1, 1,
0.2539985, -0.3507871, 1.2612, 1, 1, 1, 1, 1,
0.2595223, -0.145219, 3.165352, 1, 1, 1, 1, 1,
0.2624499, 0.3273825, 0.6370409, 1, 1, 1, 1, 1,
0.2651086, 0.4090029, -0.08859863, 1, 1, 1, 1, 1,
0.2665662, -0.2072881, 1.581089, 1, 1, 1, 1, 1,
0.271744, 0.7313282, -0.5934643, 1, 1, 1, 1, 1,
0.2751191, -1.179494, 2.36365, 1, 1, 1, 1, 1,
0.2791426, 0.2506795, -0.7465826, 1, 1, 1, 1, 1,
0.2817007, -0.3397846, 1.915698, 1, 1, 1, 1, 1,
0.2844525, 0.1442851, 2.261788, 1, 1, 1, 1, 1,
0.2850808, 0.861869, 1.702809, 1, 1, 1, 1, 1,
0.2862611, -1.080931, 2.793508, 0, 0, 1, 1, 1,
0.2909546, -0.06402778, 2.982237, 1, 0, 0, 1, 1,
0.2911229, -0.9732804, 3.029254, 1, 0, 0, 1, 1,
0.292451, 1.125157, 0.5653998, 1, 0, 0, 1, 1,
0.2986341, -0.5237851, 2.593529, 1, 0, 0, 1, 1,
0.3017514, -0.2351662, 2.820899, 1, 0, 0, 1, 1,
0.3023929, 1.458749, 0.1581165, 0, 0, 0, 1, 1,
0.3050102, 0.2924121, 1.37157, 0, 0, 0, 1, 1,
0.3058272, -0.3342499, 3.386375, 0, 0, 0, 1, 1,
0.3095487, -1.185802, 2.366318, 0, 0, 0, 1, 1,
0.3127613, -0.09189493, 2.234078, 0, 0, 0, 1, 1,
0.3130124, -1.912408, 4.260724, 0, 0, 0, 1, 1,
0.3144121, -0.0914715, 3.054783, 0, 0, 0, 1, 1,
0.3158729, -0.6536159, 2.665735, 1, 1, 1, 1, 1,
0.3162247, 0.09393999, 1.135073, 1, 1, 1, 1, 1,
0.3201613, -1.944888, 2.522403, 1, 1, 1, 1, 1,
0.3219742, 1.195901, 1.286377, 1, 1, 1, 1, 1,
0.32633, -2.046451, 2.640304, 1, 1, 1, 1, 1,
0.3296236, 0.3266261, 2.635382, 1, 1, 1, 1, 1,
0.3323852, -0.9538089, 3.313012, 1, 1, 1, 1, 1,
0.332963, -0.189513, 1.960139, 1, 1, 1, 1, 1,
0.3335511, -0.8348777, 0.2946616, 1, 1, 1, 1, 1,
0.3355344, -0.4974066, 1.633485, 1, 1, 1, 1, 1,
0.3372385, 0.0653505, 0.6012335, 1, 1, 1, 1, 1,
0.3417517, 0.802528, -0.9580569, 1, 1, 1, 1, 1,
0.3434667, -0.3486267, 1.755167, 1, 1, 1, 1, 1,
0.3472735, -0.3412291, 1.411306, 1, 1, 1, 1, 1,
0.3481948, 0.9056298, -0.5561308, 1, 1, 1, 1, 1,
0.3580014, 0.05287297, 2.279135, 0, 0, 1, 1, 1,
0.3601299, -0.365357, 1.789692, 1, 0, 0, 1, 1,
0.3625564, 0.9225997, -0.6515587, 1, 0, 0, 1, 1,
0.3644779, -0.0868059, 0.8611298, 1, 0, 0, 1, 1,
0.3672777, 0.5424976, -1.060333, 1, 0, 0, 1, 1,
0.3738025, -0.7874082, 4.720817, 1, 0, 0, 1, 1,
0.3804687, 0.3263069, 1.65536, 0, 0, 0, 1, 1,
0.3855297, 0.05308137, 1.452474, 0, 0, 0, 1, 1,
0.3931334, -0.02687353, 2.577945, 0, 0, 0, 1, 1,
0.3982166, 0.620817, -0.2692001, 0, 0, 0, 1, 1,
0.4008858, 0.456994, 1.578552, 0, 0, 0, 1, 1,
0.4028119, 0.4774346, -0.7579338, 0, 0, 0, 1, 1,
0.4056305, 0.1096196, 1.954979, 0, 0, 0, 1, 1,
0.4105046, 0.9577675, -0.6810358, 1, 1, 1, 1, 1,
0.4138738, -0.5846297, 2.406683, 1, 1, 1, 1, 1,
0.4168581, -0.5504913, 2.014921, 1, 1, 1, 1, 1,
0.4184602, 0.1283486, 0.5455289, 1, 1, 1, 1, 1,
0.4189198, 1.33469, 1.299576, 1, 1, 1, 1, 1,
0.4192235, -1.187638, 2.528293, 1, 1, 1, 1, 1,
0.419856, -0.4018843, -0.06419379, 1, 1, 1, 1, 1,
0.4209364, -0.6684093, 1.817313, 1, 1, 1, 1, 1,
0.4240946, -0.872235, 3.32175, 1, 1, 1, 1, 1,
0.4250546, -0.9304671, 1.117566, 1, 1, 1, 1, 1,
0.4255742, 3.093456, -0.6943035, 1, 1, 1, 1, 1,
0.4268184, -0.1170722, 0.4277469, 1, 1, 1, 1, 1,
0.4306666, -1.139319, 2.318835, 1, 1, 1, 1, 1,
0.4318848, 1.157316, -0.9953929, 1, 1, 1, 1, 1,
0.4368739, 1.726448, -0.4014668, 1, 1, 1, 1, 1,
0.4381543, 0.1603491, 1.730991, 0, 0, 1, 1, 1,
0.4393721, 1.739964, 2.241099, 1, 0, 0, 1, 1,
0.4400879, 0.9791622, 0.6898139, 1, 0, 0, 1, 1,
0.4438927, -0.8219433, 1.817127, 1, 0, 0, 1, 1,
0.4451449, 1.124238, 0.7686065, 1, 0, 0, 1, 1,
0.450555, -0.6232773, 3.683759, 1, 0, 0, 1, 1,
0.4526291, -0.1427649, 3.949668, 0, 0, 0, 1, 1,
0.4540466, -1.275024, 2.676904, 0, 0, 0, 1, 1,
0.4593712, 0.3225393, 0.3799267, 0, 0, 0, 1, 1,
0.4626856, -0.2302789, 2.109746, 0, 0, 0, 1, 1,
0.4636408, 0.8226397, 0.5614184, 0, 0, 0, 1, 1,
0.4650749, 0.6012354, 1.298534, 0, 0, 0, 1, 1,
0.4727706, 0.8428935, 0.292121, 0, 0, 0, 1, 1,
0.472836, 1.42581, 0.06819728, 1, 1, 1, 1, 1,
0.4756387, 0.3398719, -0.7262711, 1, 1, 1, 1, 1,
0.4773772, 0.4365216, 1.477184, 1, 1, 1, 1, 1,
0.4941877, 1.615139, -0.07612713, 1, 1, 1, 1, 1,
0.498035, 0.4887759, 1.178226, 1, 1, 1, 1, 1,
0.4988582, -0.1622223, 4.28934, 1, 1, 1, 1, 1,
0.4998517, -0.2028582, 1.984657, 1, 1, 1, 1, 1,
0.5035018, -0.650804, 3.909793, 1, 1, 1, 1, 1,
0.5086089, 0.2565468, 0.6219858, 1, 1, 1, 1, 1,
0.5100165, 0.01068321, 2.329209, 1, 1, 1, 1, 1,
0.5126169, -0.4609258, 2.155313, 1, 1, 1, 1, 1,
0.5130318, -0.8778347, 3.506598, 1, 1, 1, 1, 1,
0.5178195, 0.522408, 1.829089, 1, 1, 1, 1, 1,
0.5221511, 0.1416273, 3.265198, 1, 1, 1, 1, 1,
0.5247241, 0.9696391, -1.781662, 1, 1, 1, 1, 1,
0.5323243, 1.438746, -0.3614329, 0, 0, 1, 1, 1,
0.5326857, -0.8441371, 1.484937, 1, 0, 0, 1, 1,
0.5330921, -0.8062251, 3.076525, 1, 0, 0, 1, 1,
0.5371013, -0.7327352, 1.674728, 1, 0, 0, 1, 1,
0.5398007, -0.05334697, 1.646921, 1, 0, 0, 1, 1,
0.5404757, 0.1474515, 0.8821031, 1, 0, 0, 1, 1,
0.5427511, 0.3101823, 0.312849, 0, 0, 0, 1, 1,
0.5431181, 0.502649, 0.4116258, 0, 0, 0, 1, 1,
0.5461639, -1.653266, 3.770272, 0, 0, 0, 1, 1,
0.5463361, -0.09512022, 1.708089, 0, 0, 0, 1, 1,
0.5470942, 0.9802122, 0.9459779, 0, 0, 0, 1, 1,
0.5569044, 1.17666, 0.6241513, 0, 0, 0, 1, 1,
0.5580342, 0.08035629, 0.3396036, 0, 0, 0, 1, 1,
0.5590326, -0.4090675, 2.351939, 1, 1, 1, 1, 1,
0.5595244, -1.104894, 2.180367, 1, 1, 1, 1, 1,
0.5642565, -3.397424, 2.899555, 1, 1, 1, 1, 1,
0.5648576, 1.441043, 1.667817, 1, 1, 1, 1, 1,
0.5664292, -0.2352148, 4.049195, 1, 1, 1, 1, 1,
0.5676309, 1.57528, -1.932195, 1, 1, 1, 1, 1,
0.5717087, -0.4055003, 2.187071, 1, 1, 1, 1, 1,
0.5721784, -1.798411, 3.848875, 1, 1, 1, 1, 1,
0.5761395, 0.677938, -0.7605768, 1, 1, 1, 1, 1,
0.5771655, 1.698015, -0.465041, 1, 1, 1, 1, 1,
0.5819879, 0.2043241, 2.126376, 1, 1, 1, 1, 1,
0.5887601, 0.5802647, 0.95215, 1, 1, 1, 1, 1,
0.591464, -0.9863615, 3.948699, 1, 1, 1, 1, 1,
0.5965008, -1.116847, 2.588598, 1, 1, 1, 1, 1,
0.6003963, 0.03972216, 1.524846, 1, 1, 1, 1, 1,
0.6039436, -0.5100724, 2.791013, 0, 0, 1, 1, 1,
0.6041152, 0.441986, -2.061006, 1, 0, 0, 1, 1,
0.6062798, 0.2662542, 2.209522, 1, 0, 0, 1, 1,
0.6092004, 0.6137717, 0.05721793, 1, 0, 0, 1, 1,
0.6128586, 0.3127502, -1.477044, 1, 0, 0, 1, 1,
0.6169626, 0.4579791, 1.710075, 1, 0, 0, 1, 1,
0.6217339, 0.3579267, 0.3328528, 0, 0, 0, 1, 1,
0.6250001, 0.5491726, 1.220235, 0, 0, 0, 1, 1,
0.6298136, -0.3816813, 2.087504, 0, 0, 0, 1, 1,
0.6334793, -0.4085357, 2.118382, 0, 0, 0, 1, 1,
0.635943, -0.2678426, 1.656526, 0, 0, 0, 1, 1,
0.6397403, -0.6669901, 0.9358925, 0, 0, 0, 1, 1,
0.6398404, -0.1990135, 3.093185, 0, 0, 0, 1, 1,
0.6401454, 0.1701468, 1.810495, 1, 1, 1, 1, 1,
0.641566, 0.3129719, -0.9934036, 1, 1, 1, 1, 1,
0.6489435, 0.8688111, 1.002343, 1, 1, 1, 1, 1,
0.6490588, -0.2687608, 1.174365, 1, 1, 1, 1, 1,
0.649942, -0.941408, 1.35803, 1, 1, 1, 1, 1,
0.6522756, 0.2363045, 2.658603, 1, 1, 1, 1, 1,
0.6533302, -1.009174, 1.578972, 1, 1, 1, 1, 1,
0.6562306, 0.009069116, 2.553426, 1, 1, 1, 1, 1,
0.6602185, 0.9292321, 0.4440644, 1, 1, 1, 1, 1,
0.6605359, 0.4021815, 1.578025, 1, 1, 1, 1, 1,
0.6617399, -0.06010066, 0.6347188, 1, 1, 1, 1, 1,
0.6682944, -0.4836478, 1.710372, 1, 1, 1, 1, 1,
0.6745986, 2.042172, 0.8354645, 1, 1, 1, 1, 1,
0.6846484, -0.01504971, 1.195677, 1, 1, 1, 1, 1,
0.6908521, -0.9669576, 3.264077, 1, 1, 1, 1, 1,
0.6944475, 0.9489067, 0.3454894, 0, 0, 1, 1, 1,
0.6981466, 0.2736963, 2.197211, 1, 0, 0, 1, 1,
0.7019078, -0.6721725, 1.918867, 1, 0, 0, 1, 1,
0.7035427, -0.670352, 2.820899, 1, 0, 0, 1, 1,
0.7058064, -1.388922, 0.84756, 1, 0, 0, 1, 1,
0.7090905, 0.9272267, 1.796603, 1, 0, 0, 1, 1,
0.7123897, 0.4803125, -0.2277149, 0, 0, 0, 1, 1,
0.7130921, -1.448218, 2.066276, 0, 0, 0, 1, 1,
0.7161912, -0.5039641, 2.459053, 0, 0, 0, 1, 1,
0.721612, 1.079664, 0.0001123051, 0, 0, 0, 1, 1,
0.7229588, -1.73364, 2.976273, 0, 0, 0, 1, 1,
0.7268503, -1.240752, 2.235262, 0, 0, 0, 1, 1,
0.7278288, -1.417833, 4.100003, 0, 0, 0, 1, 1,
0.7303856, -0.2021076, 0.7184141, 1, 1, 1, 1, 1,
0.7336294, -2.027146, 2.352855, 1, 1, 1, 1, 1,
0.734137, 2.493914, -0.9632982, 1, 1, 1, 1, 1,
0.7365956, -1.00411, 1.328509, 1, 1, 1, 1, 1,
0.7389503, -1.288921, 4.041311, 1, 1, 1, 1, 1,
0.7422529, -0.3982507, 4.121873, 1, 1, 1, 1, 1,
0.7495273, -0.1821476, 2.005727, 1, 1, 1, 1, 1,
0.7510004, 2.684191, 0.5154601, 1, 1, 1, 1, 1,
0.7517327, -0.3444191, 0.3671721, 1, 1, 1, 1, 1,
0.7530088, 0.6772725, -0.9707354, 1, 1, 1, 1, 1,
0.7553794, -0.7794275, 3.239605, 1, 1, 1, 1, 1,
0.7562882, -2.514482, 3.869836, 1, 1, 1, 1, 1,
0.7620341, 0.6842622, -0.1075978, 1, 1, 1, 1, 1,
0.763913, -1.597424, 2.921447, 1, 1, 1, 1, 1,
0.7655007, -1.267483, 2.428695, 1, 1, 1, 1, 1,
0.7871148, -0.541508, 3.171561, 0, 0, 1, 1, 1,
0.7876273, -0.6064587, 1.630361, 1, 0, 0, 1, 1,
0.7912157, -0.2361104, 0.9952402, 1, 0, 0, 1, 1,
0.811056, -0.6789257, 2.365779, 1, 0, 0, 1, 1,
0.8121792, -0.669596, 2.242701, 1, 0, 0, 1, 1,
0.818852, -0.5773801, 2.702538, 1, 0, 0, 1, 1,
0.8256323, -0.818208, 3.91487, 0, 0, 0, 1, 1,
0.8263344, -1.374547, 2.938662, 0, 0, 0, 1, 1,
0.8327409, -0.1962046, 0.5826268, 0, 0, 0, 1, 1,
0.8334197, -0.06511672, 2.057824, 0, 0, 0, 1, 1,
0.8427823, -0.8035938, 1.281787, 0, 0, 0, 1, 1,
0.8495955, -0.5550674, 1.682238, 0, 0, 0, 1, 1,
0.8505113, 1.934015, 0.612606, 0, 0, 0, 1, 1,
0.8625268, -0.2971873, 2.099704, 1, 1, 1, 1, 1,
0.8655605, -0.06568398, 2.527376, 1, 1, 1, 1, 1,
0.8655666, 0.7868235, -0.2240356, 1, 1, 1, 1, 1,
0.8809332, 0.7734247, 1.732381, 1, 1, 1, 1, 1,
0.8830205, 0.08152968, 1.423926, 1, 1, 1, 1, 1,
0.8841006, -1.242266, 3.702694, 1, 1, 1, 1, 1,
0.8872572, 0.7615165, 1.685511, 1, 1, 1, 1, 1,
0.8929418, 0.2096157, 0.9285669, 1, 1, 1, 1, 1,
0.8964844, 0.5203274, 1.140033, 1, 1, 1, 1, 1,
0.9104943, -0.8019188, 3.32338, 1, 1, 1, 1, 1,
0.9132107, -0.9751872, 1.811548, 1, 1, 1, 1, 1,
0.9261689, -0.1376788, 2.398271, 1, 1, 1, 1, 1,
0.9273906, 1.102029, -0.1182267, 1, 1, 1, 1, 1,
0.9288455, 0.4791981, 0.1776051, 1, 1, 1, 1, 1,
0.9355103, 0.05352926, -1.819092, 1, 1, 1, 1, 1,
0.9450003, 0.03703388, 1.230592, 0, 0, 1, 1, 1,
0.9542636, -2.148721, 4.566075, 1, 0, 0, 1, 1,
0.9645692, 0.4392281, -0.7952178, 1, 0, 0, 1, 1,
0.9726734, -0.3825618, 1.456391, 1, 0, 0, 1, 1,
0.9737795, 1.91879, 0.7589655, 1, 0, 0, 1, 1,
0.976176, 1.060153, 0.9113239, 1, 0, 0, 1, 1,
0.9808981, -0.1398402, 2.900476, 0, 0, 0, 1, 1,
0.9826, 0.3019016, 2.113382, 0, 0, 0, 1, 1,
0.9874398, -0.7910984, 0.9840927, 0, 0, 0, 1, 1,
0.9915423, -0.4470888, 1.159715, 0, 0, 0, 1, 1,
0.9917735, 0.7427599, -1.115198, 0, 0, 0, 1, 1,
1.00307, 0.7893943, 0.1359309, 0, 0, 0, 1, 1,
1.009174, 0.9830011, 2.222493, 0, 0, 0, 1, 1,
1.013031, -0.188117, 1.562678, 1, 1, 1, 1, 1,
1.015551, 0.8451919, 1.732711, 1, 1, 1, 1, 1,
1.028683, -0.3731042, 2.732123, 1, 1, 1, 1, 1,
1.031371, 0.5731479, -1.025383, 1, 1, 1, 1, 1,
1.034731, -2.081988, 2.701974, 1, 1, 1, 1, 1,
1.041455, 0.1639006, 1.186904, 1, 1, 1, 1, 1,
1.041914, -0.6319173, 4.06374, 1, 1, 1, 1, 1,
1.042352, 1.9112, 1.075328, 1, 1, 1, 1, 1,
1.042563, -1.761378, 2.4137, 1, 1, 1, 1, 1,
1.048031, 0.1441008, 0.4985335, 1, 1, 1, 1, 1,
1.057977, -1.579429, 3.237353, 1, 1, 1, 1, 1,
1.070121, 0.06892814, 2.303001, 1, 1, 1, 1, 1,
1.071675, -1.265925, 3.694261, 1, 1, 1, 1, 1,
1.074889, 0.8855892, 2.911036, 1, 1, 1, 1, 1,
1.07556, 0.4787821, 0.7192209, 1, 1, 1, 1, 1,
1.086331, 0.08647703, 1.680591, 0, 0, 1, 1, 1,
1.089538, -1.289073, 2.275397, 1, 0, 0, 1, 1,
1.089855, 1.203411, 1.727841, 1, 0, 0, 1, 1,
1.092745, -1.073776, 1.067366, 1, 0, 0, 1, 1,
1.104467, -0.6724387, 2.737401, 1, 0, 0, 1, 1,
1.113833, -0.4875965, 1.996644, 1, 0, 0, 1, 1,
1.125865, -0.9465727, 3.381044, 0, 0, 0, 1, 1,
1.138898, -1.873891, 1.841542, 0, 0, 0, 1, 1,
1.141066, 0.6831078, 2.258079, 0, 0, 0, 1, 1,
1.156024, -0.015002, 0.5702465, 0, 0, 0, 1, 1,
1.165847, 0.987358, -0.6868791, 0, 0, 0, 1, 1,
1.16925, 2.090121, 0.3177202, 0, 0, 0, 1, 1,
1.178711, -0.4487432, 2.182286, 0, 0, 0, 1, 1,
1.180215, 0.7395222, -1.080106, 1, 1, 1, 1, 1,
1.189097, 0.6812245, 2.486691, 1, 1, 1, 1, 1,
1.191141, -0.462717, 1.65832, 1, 1, 1, 1, 1,
1.193326, 1.565215, 1.212535, 1, 1, 1, 1, 1,
1.198281, 0.9414262, 1.009639, 1, 1, 1, 1, 1,
1.202097, 1.982991, -0.7661701, 1, 1, 1, 1, 1,
1.206573, -0.1932563, 0.5161425, 1, 1, 1, 1, 1,
1.208992, 0.02644123, 1.629156, 1, 1, 1, 1, 1,
1.210178, -1.040749, 1.445007, 1, 1, 1, 1, 1,
1.22523, 0.5478541, 1.722688, 1, 1, 1, 1, 1,
1.22754, 0.3072957, -0.3775847, 1, 1, 1, 1, 1,
1.231269, -0.3853672, 2.887288, 1, 1, 1, 1, 1,
1.231281, 0.7827924, -0.2508397, 1, 1, 1, 1, 1,
1.241404, 1.319147, -0.8630513, 1, 1, 1, 1, 1,
1.25036, -0.05759035, 0.8408017, 1, 1, 1, 1, 1,
1.250483, 1.504725, 0.9069866, 0, 0, 1, 1, 1,
1.253395, -0.03197772, 2.949983, 1, 0, 0, 1, 1,
1.257876, -0.04696668, 2.155004, 1, 0, 0, 1, 1,
1.263211, -0.1882544, 1.771466, 1, 0, 0, 1, 1,
1.264361, -1.268867, 1.101466, 1, 0, 0, 1, 1,
1.270146, 1.056096, 0.2725368, 1, 0, 0, 1, 1,
1.272297, 1.201911, -0.07298, 0, 0, 0, 1, 1,
1.274749, 1.817336, 3.12963, 0, 0, 0, 1, 1,
1.298902, 0.004795711, 1.711357, 0, 0, 0, 1, 1,
1.302107, 0.7651152, 0.718604, 0, 0, 0, 1, 1,
1.308064, 0.1364381, 2.160499, 0, 0, 0, 1, 1,
1.309075, -0.7003742, 2.723588, 0, 0, 0, 1, 1,
1.309554, 0.174131, 1.940485, 0, 0, 0, 1, 1,
1.314049, 0.04196505, 2.623708, 1, 1, 1, 1, 1,
1.315924, -1.707227, 3.08268, 1, 1, 1, 1, 1,
1.319319, 0.04847157, 0.5288702, 1, 1, 1, 1, 1,
1.319936, -0.2091745, -0.4631917, 1, 1, 1, 1, 1,
1.338189, 1.824716, 1.961377, 1, 1, 1, 1, 1,
1.342535, -0.4219776, 2.906161, 1, 1, 1, 1, 1,
1.344821, 2.437511, 0.6168314, 1, 1, 1, 1, 1,
1.345603, -1.687889, 0.6847243, 1, 1, 1, 1, 1,
1.350574, 0.7622654, 1.008777, 1, 1, 1, 1, 1,
1.355877, -0.9601879, 3.008772, 1, 1, 1, 1, 1,
1.357643, -0.7673408, 2.144768, 1, 1, 1, 1, 1,
1.365306, 0.3395634, -0.4518369, 1, 1, 1, 1, 1,
1.368143, 2.339023, 0.8935096, 1, 1, 1, 1, 1,
1.379716, 0.4355504, 1.86387, 1, 1, 1, 1, 1,
1.38633, 2.389205, 0.4249872, 1, 1, 1, 1, 1,
1.386728, -0.3251106, 3.265246, 0, 0, 1, 1, 1,
1.391661, -0.2662078, 1.949715, 1, 0, 0, 1, 1,
1.398658, -0.02605632, 2.018555, 1, 0, 0, 1, 1,
1.398998, 1.150686, 0.1751056, 1, 0, 0, 1, 1,
1.404934, 0.4886584, 1.830045, 1, 0, 0, 1, 1,
1.430692, 0.266161, 1.189247, 1, 0, 0, 1, 1,
1.442059, 2.389406, 0.9958664, 0, 0, 0, 1, 1,
1.442536, 0.6776187, 1.478319, 0, 0, 0, 1, 1,
1.473133, -0.5892705, 2.032062, 0, 0, 0, 1, 1,
1.473929, 0.174895, 2.209472, 0, 0, 0, 1, 1,
1.482223, -0.7524126, 1.586138, 0, 0, 0, 1, 1,
1.498214, -1.253116, 3.230461, 0, 0, 0, 1, 1,
1.498603, 0.04852018, 2.448636, 0, 0, 0, 1, 1,
1.528509, -0.8228717, 0.00684424, 1, 1, 1, 1, 1,
1.544331, 0.3159368, 0.1018349, 1, 1, 1, 1, 1,
1.544669, 0.09509585, 2.189537, 1, 1, 1, 1, 1,
1.556504, 2.582451, 1.296267, 1, 1, 1, 1, 1,
1.560706, -0.8006408, 1.059074, 1, 1, 1, 1, 1,
1.565519, -0.6743925, 2.065594, 1, 1, 1, 1, 1,
1.566443, 1.173591, 1.087322, 1, 1, 1, 1, 1,
1.602591, 0.2691587, 1.237031, 1, 1, 1, 1, 1,
1.613078, -0.6051423, 1.628505, 1, 1, 1, 1, 1,
1.621503, 0.4891162, 1.89349, 1, 1, 1, 1, 1,
1.623501, 0.4304484, 1.646817, 1, 1, 1, 1, 1,
1.669366, -1.05958, 1.556852, 1, 1, 1, 1, 1,
1.672378, 0.06043475, 2.421773, 1, 1, 1, 1, 1,
1.672665, 0.1551857, 1.842758, 1, 1, 1, 1, 1,
1.673591, 0.1253855, 2.207984, 1, 1, 1, 1, 1,
1.685676, -0.7555811, 2.075327, 0, 0, 1, 1, 1,
1.720076, 0.5419779, 0.1537752, 1, 0, 0, 1, 1,
1.723995, -1.203185, 3.582392, 1, 0, 0, 1, 1,
1.724555, 0.006466324, 1.463432, 1, 0, 0, 1, 1,
1.759243, -0.01490023, 1.149347, 1, 0, 0, 1, 1,
1.768184, 0.2501983, 0.6340606, 1, 0, 0, 1, 1,
1.770192, 0.05335845, 3.018349, 0, 0, 0, 1, 1,
1.775734, 1.648836, 0.4264052, 0, 0, 0, 1, 1,
1.786232, 0.4725121, 1.24258, 0, 0, 0, 1, 1,
1.798165, 0.2797342, 1.603972, 0, 0, 0, 1, 1,
1.809554, -1.439466, 2.277575, 0, 0, 0, 1, 1,
1.810329, -0.9172785, 1.550861, 0, 0, 0, 1, 1,
1.813825, -0.1463841, 2.535501, 0, 0, 0, 1, 1,
1.818857, -0.8138097, 1.898227, 1, 1, 1, 1, 1,
1.823548, -1.285342, 1.110124, 1, 1, 1, 1, 1,
1.840201, 1.301626, 1.779466, 1, 1, 1, 1, 1,
1.856809, 0.1835959, 0.7935329, 1, 1, 1, 1, 1,
1.86932, 0.800949, 1.864458, 1, 1, 1, 1, 1,
1.872148, -0.2255997, 1.742883, 1, 1, 1, 1, 1,
1.913178, 0.5919943, 0.9728692, 1, 1, 1, 1, 1,
1.915925, -0.4579386, 1.579199, 1, 1, 1, 1, 1,
1.92594, -1.451181, 2.56847, 1, 1, 1, 1, 1,
1.955878, 0.6655062, 0.4106151, 1, 1, 1, 1, 1,
1.961517, 2.122876, 1.511172, 1, 1, 1, 1, 1,
1.971303, -1.050709, 2.141714, 1, 1, 1, 1, 1,
1.982312, -0.9106115, 1.298632, 1, 1, 1, 1, 1,
1.982776, 0.6119451, 0.2759737, 1, 1, 1, 1, 1,
1.997921, 0.2395514, 2.811025, 1, 1, 1, 1, 1,
1.998782, -0.3669064, 1.838001, 0, 0, 1, 1, 1,
2.008124, -0.5839477, 0.2842362, 1, 0, 0, 1, 1,
2.066958, -2.740114, 1.255519, 1, 0, 0, 1, 1,
2.09042, -0.3085774, 0.850158, 1, 0, 0, 1, 1,
2.105417, 0.09629632, 1.457205, 1, 0, 0, 1, 1,
2.110271, -2.346452, 1.229142, 1, 0, 0, 1, 1,
2.157413, -0.02466622, 0.9754854, 0, 0, 0, 1, 1,
2.201172, 0.1008969, 2.520523, 0, 0, 0, 1, 1,
2.206057, 0.7806717, 0.8156037, 0, 0, 0, 1, 1,
2.226705, -0.002621681, 1.296259, 0, 0, 0, 1, 1,
2.260841, -0.8982359, -0.03477753, 0, 0, 0, 1, 1,
2.294539, -2.258145, 1.330301, 0, 0, 0, 1, 1,
2.365664, -0.8081089, 2.523582, 0, 0, 0, 1, 1,
2.387946, -0.9121166, 3.993869, 1, 1, 1, 1, 1,
2.493615, 0.6027134, 2.097725, 1, 1, 1, 1, 1,
2.537433, -1.706509, 3.409298, 1, 1, 1, 1, 1,
2.735022, 0.3027216, 1.049254, 1, 1, 1, 1, 1,
2.825878, -0.3875906, 2.225033, 1, 1, 1, 1, 1,
3.001868, -1.419932, 2.289479, 1, 1, 1, 1, 1,
3.326829, 0.4658423, 3.043855, 1, 1, 1, 1, 1
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
var radius = 9.894941;
var distance = 34.75556;
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
mvMatrix.translate( -0.1866056, 0.1519842, 1.043207 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.75556);
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
