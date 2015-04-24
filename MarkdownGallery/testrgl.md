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
<!-- ****** points object 95 ****** -->
<script id="testglvshader95" type="x-shader/x-vertex">
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
<script id="testglfshader95" type="x-shader/x-fragment"> 
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
<!-- ****** text object 97 ****** -->
<script id="testglvshader97" type="x-shader/x-vertex">
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
<script id="testglfshader97" type="x-shader/x-fragment"> 
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
<!-- ****** text object 98 ****** -->
<script id="testglvshader98" type="x-shader/x-vertex">
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
<script id="testglfshader98" type="x-shader/x-fragment"> 
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
<!-- ****** text object 99 ****** -->
<script id="testglvshader99" type="x-shader/x-vertex">
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
<script id="testglfshader99" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 100 ****** -->
<script id="testglvshader100" type="x-shader/x-vertex">
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
<script id="testglfshader100" type="x-shader/x-fragment"> 
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
<!-- ****** text object 101 ****** -->
<script id="testglvshader101" type="x-shader/x-vertex">
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
<script id="testglfshader101" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 102 ****** -->
<script id="testglvshader102" type="x-shader/x-vertex">
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
<script id="testglfshader102" type="x-shader/x-fragment"> 
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
<!-- ****** text object 103 ****** -->
<script id="testglvshader103" type="x-shader/x-vertex">
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
<script id="testglfshader103" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 104 ****** -->
<script id="testglvshader104" type="x-shader/x-vertex">
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
<script id="testglfshader104" type="x-shader/x-fragment"> 
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
<!-- ****** text object 105 ****** -->
<script id="testglvshader105" type="x-shader/x-vertex">
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
<script id="testglfshader105" type="x-shader/x-fragment"> 
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
<!-- ****** lines object 106 ****** -->
<script id="testglvshader106" type="x-shader/x-vertex">
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
<script id="testglfshader106" type="x-shader/x-fragment"> 
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
var width = 1281;  var height = 993;
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
var activeSubscene = 88;
zoom[88] = 1;
fov[88] = 30;
userMatrix[88] = new CanvasMatrix4();
userMatrix[88].load([
-0.7624434, 0.6217963, -0.1790246, 0,
-0.6434295, -0.7578232, 0.1081797, 0,
-0.06840318, 0.1976704, 0.9778789, 0,
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
// ****** points object 95 ******
var prog95  = gl.createProgram();
gl.attachShader(prog95, getShader( gl, "testglvshader95" ));
gl.attachShader(prog95, getShader( gl, "testglfshader95" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog95, 0, "aPos");
gl.bindAttribLocation(prog95, 1, "aCol");
gl.linkProgram(prog95);
var v=new Float32Array([
-3.077646, 0.3934888, -1.46941, 1, 0, 0, 1,
-3.073347, -1.061542, -2.31483, 1, 0.007843138, 0, 1,
-2.813202, 0.5290235, -1.747811, 1, 0.01176471, 0, 1,
-2.781399, -0.7552599, -0.4012525, 1, 0.01960784, 0, 1,
-2.752169, -0.6877074, -3.221343, 1, 0.02352941, 0, 1,
-2.653638, -0.761816, -2.419979, 1, 0.03137255, 0, 1,
-2.59669, 0.5338283, -1.556317, 1, 0.03529412, 0, 1,
-2.54358, -1.388412, -3.356125, 1, 0.04313726, 0, 1,
-2.50121, 0.4060028, -2.157003, 1, 0.04705882, 0, 1,
-2.455047, -1.449665, -2.093271, 1, 0.05490196, 0, 1,
-2.361027, -0.3625742, -2.151527, 1, 0.05882353, 0, 1,
-2.351318, 2.662568, -3.070104, 1, 0.06666667, 0, 1,
-2.31851, 1.046371, 0.3736547, 1, 0.07058824, 0, 1,
-2.310453, -0.842966, -2.605027, 1, 0.07843138, 0, 1,
-2.275304, 0.7568408, -0.8917262, 1, 0.08235294, 0, 1,
-2.26602, 0.865436, -3.657785, 1, 0.09019608, 0, 1,
-2.242939, 0.7823425, -1.955573, 1, 0.09411765, 0, 1,
-2.170783, -0.9544825, -1.42979, 1, 0.1019608, 0, 1,
-2.142042, -1.739169, -3.377876, 1, 0.1098039, 0, 1,
-2.124425, -0.7087346, 0.3086185, 1, 0.1137255, 0, 1,
-2.107208, 0.1028728, -3.256993, 1, 0.1215686, 0, 1,
-2.102181, -0.4847895, -1.168096, 1, 0.1254902, 0, 1,
-2.101066, 1.163545, 0.01923465, 1, 0.1333333, 0, 1,
-2.089794, -1.335863, 1.266342, 1, 0.1372549, 0, 1,
-2.088053, -0.5518386, -0.7833508, 1, 0.145098, 0, 1,
-2.085456, -1.617068, -2.970334, 1, 0.1490196, 0, 1,
-2.02707, -0.1946298, -1.266966, 1, 0.1568628, 0, 1,
-2.009969, -0.3633158, -2.075373, 1, 0.1607843, 0, 1,
-2.005672, -0.1650999, -1.961133, 1, 0.1686275, 0, 1,
-2.00506, -0.6667641, -1.790365, 1, 0.172549, 0, 1,
-2.001509, 2.038093, -1.474601, 1, 0.1803922, 0, 1,
-1.981752, -0.3542489, -1.111396, 1, 0.1843137, 0, 1,
-1.945409, 0.09482413, -1.504184, 1, 0.1921569, 0, 1,
-1.931635, 1.437413, 0.4156092, 1, 0.1960784, 0, 1,
-1.921286, -0.9556104, -0.6939452, 1, 0.2039216, 0, 1,
-1.914372, -0.04766094, -3.430603, 1, 0.2117647, 0, 1,
-1.905931, 0.6841869, -2.339923, 1, 0.2156863, 0, 1,
-1.895901, -0.7930638, -1.78015, 1, 0.2235294, 0, 1,
-1.857177, 0.9854814, -2.474309, 1, 0.227451, 0, 1,
-1.845391, 0.03639902, -2.064989, 1, 0.2352941, 0, 1,
-1.84297, -0.1663407, -2.737107, 1, 0.2392157, 0, 1,
-1.808571, 0.3489978, -1.223398, 1, 0.2470588, 0, 1,
-1.788298, 0.9055406, -1.003635, 1, 0.2509804, 0, 1,
-1.787409, 0.9986687, -1.506498, 1, 0.2588235, 0, 1,
-1.781297, 1.781622, -0.5777693, 1, 0.2627451, 0, 1,
-1.776618, -0.3045965, -1.869786, 1, 0.2705882, 0, 1,
-1.75406, 1.183497, -2.71982, 1, 0.2745098, 0, 1,
-1.753816, -0.8191245, -2.130212, 1, 0.282353, 0, 1,
-1.748825, -0.01967996, -2.68156, 1, 0.2862745, 0, 1,
-1.723338, 0.4442709, -1.608051, 1, 0.2941177, 0, 1,
-1.717207, -0.04100592, -1.408899, 1, 0.3019608, 0, 1,
-1.710894, -0.2718996, -0.9967148, 1, 0.3058824, 0, 1,
-1.703992, 0.5282888, -0.3557237, 1, 0.3137255, 0, 1,
-1.657356, 1.019488, -2.010328, 1, 0.3176471, 0, 1,
-1.639929, -0.5203959, -0.9657257, 1, 0.3254902, 0, 1,
-1.638495, -0.7459923, -1.209098, 1, 0.3294118, 0, 1,
-1.63174, -1.914249, -1.865949, 1, 0.3372549, 0, 1,
-1.631229, 0.2332356, -1.764526, 1, 0.3411765, 0, 1,
-1.623255, 1.139212, -0.5399737, 1, 0.3490196, 0, 1,
-1.619275, -2.141582, -1.631076, 1, 0.3529412, 0, 1,
-1.604515, 0.3280984, -1.434504, 1, 0.3607843, 0, 1,
-1.603021, 0.7765576, -1.900974, 1, 0.3647059, 0, 1,
-1.596653, 1.248642, -1.089701, 1, 0.372549, 0, 1,
-1.567253, -0.2478839, 0.1037848, 1, 0.3764706, 0, 1,
-1.553281, 0.359666, -0.07736751, 1, 0.3843137, 0, 1,
-1.544188, 0.6865765, -0.7433492, 1, 0.3882353, 0, 1,
-1.54379, -0.3281779, -1.533884, 1, 0.3960784, 0, 1,
-1.5334, 1.980106, -2.231992, 1, 0.4039216, 0, 1,
-1.529494, -0.1023246, -0.4274039, 1, 0.4078431, 0, 1,
-1.524059, -1.033313, -2.560811, 1, 0.4156863, 0, 1,
-1.522689, 0.02921415, -0.5730779, 1, 0.4196078, 0, 1,
-1.515572, -0.9756696, -3.849985, 1, 0.427451, 0, 1,
-1.500557, 1.524014, -0.8151991, 1, 0.4313726, 0, 1,
-1.489141, -0.9545246, -0.2496445, 1, 0.4392157, 0, 1,
-1.48837, -1.082334, -2.184767, 1, 0.4431373, 0, 1,
-1.482648, 0.8754942, -1.450123, 1, 0.4509804, 0, 1,
-1.45796, 1.402236, -0.7676933, 1, 0.454902, 0, 1,
-1.456919, 1.347287, -0.8362935, 1, 0.4627451, 0, 1,
-1.453491, 0.8228769, -0.5107151, 1, 0.4666667, 0, 1,
-1.452774, -1.430701, -1.307244, 1, 0.4745098, 0, 1,
-1.451018, 0.8188331, -1.564584, 1, 0.4784314, 0, 1,
-1.450134, 1.334026, -0.5260382, 1, 0.4862745, 0, 1,
-1.445873, 1.295077, -0.5714338, 1, 0.4901961, 0, 1,
-1.442722, 0.1728259, -0.7595362, 1, 0.4980392, 0, 1,
-1.435138, 0.4989518, -1.622228, 1, 0.5058824, 0, 1,
-1.432228, -1.823455, -1.01302, 1, 0.509804, 0, 1,
-1.419519, -0.9113463, -0.1348591, 1, 0.5176471, 0, 1,
-1.417901, 1.215441, -0.4304965, 1, 0.5215687, 0, 1,
-1.416813, -0.268974, -1.68439, 1, 0.5294118, 0, 1,
-1.41346, 0.3782917, 0.3360748, 1, 0.5333334, 0, 1,
-1.409117, -0.4954354, -0.3550723, 1, 0.5411765, 0, 1,
-1.408455, 0.6449594, -1.831026, 1, 0.5450981, 0, 1,
-1.405433, 0.7224691, -1.8639, 1, 0.5529412, 0, 1,
-1.403171, 0.781804, -2.00315, 1, 0.5568628, 0, 1,
-1.401258, 1.198152, -0.8464337, 1, 0.5647059, 0, 1,
-1.396539, -0.3812423, -2.476224, 1, 0.5686275, 0, 1,
-1.377775, 0.1358869, 0.04166494, 1, 0.5764706, 0, 1,
-1.375485, 0.9094075, -2.358542, 1, 0.5803922, 0, 1,
-1.363049, 0.7474447, -1.412945, 1, 0.5882353, 0, 1,
-1.355337, 0.3545533, -0.8847811, 1, 0.5921569, 0, 1,
-1.353453, 0.4818776, -0.7694877, 1, 0.6, 0, 1,
-1.338286, -0.0090277, -1.31979, 1, 0.6078432, 0, 1,
-1.325613, -2.460046, -2.877501, 1, 0.6117647, 0, 1,
-1.325312, 1.031399, -0.938422, 1, 0.6196079, 0, 1,
-1.324338, -0.8567144, -1.008427, 1, 0.6235294, 0, 1,
-1.31692, -0.6564071, -1.965863, 1, 0.6313726, 0, 1,
-1.314194, -1.736209, -1.747739, 1, 0.6352941, 0, 1,
-1.312218, 0.7200623, -0.8621883, 1, 0.6431373, 0, 1,
-1.308076, -0.6507585, -1.104461, 1, 0.6470588, 0, 1,
-1.307304, 0.8600753, -1.087946, 1, 0.654902, 0, 1,
-1.30206, 0.1845505, -1.319215, 1, 0.6588235, 0, 1,
-1.301593, -0.6070967, -2.209876, 1, 0.6666667, 0, 1,
-1.299738, 0.4425626, -1.103534, 1, 0.6705883, 0, 1,
-1.293303, 1.434324, -0.1002033, 1, 0.6784314, 0, 1,
-1.274239, 0.2625993, -2.192637, 1, 0.682353, 0, 1,
-1.269453, 0.3579385, -0.81383, 1, 0.6901961, 0, 1,
-1.266523, -0.772441, -0.7210537, 1, 0.6941177, 0, 1,
-1.266001, 0.3422194, 0.1710285, 1, 0.7019608, 0, 1,
-1.263497, -0.7886987, -1.780181, 1, 0.7098039, 0, 1,
-1.261003, 1.319856, 0.3834235, 1, 0.7137255, 0, 1,
-1.252745, 0.8060536, -0.6151911, 1, 0.7215686, 0, 1,
-1.250665, 0.2201185, 0.2831622, 1, 0.7254902, 0, 1,
-1.247014, -1.479977, -2.695755, 1, 0.7333333, 0, 1,
-1.233463, -1.61453, -1.217795, 1, 0.7372549, 0, 1,
-1.233361, -0.5446969, -2.54546, 1, 0.7450981, 0, 1,
-1.232432, -0.57242, -1.857075, 1, 0.7490196, 0, 1,
-1.232072, 0.08557869, -1.112949, 1, 0.7568628, 0, 1,
-1.224239, 0.3266277, -1.060075, 1, 0.7607843, 0, 1,
-1.222706, 1.246854, 0.6520411, 1, 0.7686275, 0, 1,
-1.210053, -0.06923117, -1.711509, 1, 0.772549, 0, 1,
-1.208129, 0.8057387, -0.7083558, 1, 0.7803922, 0, 1,
-1.20315, 0.08268113, -2.281846, 1, 0.7843137, 0, 1,
-1.190331, 1.578414, -1.260794, 1, 0.7921569, 0, 1,
-1.189598, -1.784962, -2.784069, 1, 0.7960784, 0, 1,
-1.186657, 0.2407315, -2.863479, 1, 0.8039216, 0, 1,
-1.173846, -0.866947, -1.253146, 1, 0.8117647, 0, 1,
-1.168659, 1.310328, -0.5586281, 1, 0.8156863, 0, 1,
-1.16352, -1.219616, -2.136743, 1, 0.8235294, 0, 1,
-1.153255, 0.3128637, -1.43888, 1, 0.827451, 0, 1,
-1.1523, 1.425315, 0.5875768, 1, 0.8352941, 0, 1,
-1.143816, -0.1601968, -1.766161, 1, 0.8392157, 0, 1,
-1.142564, 2.037065, -1.760972, 1, 0.8470588, 0, 1,
-1.134359, 2.072903, -2.220071, 1, 0.8509804, 0, 1,
-1.133982, -0.4658704, -1.01134, 1, 0.8588235, 0, 1,
-1.128694, -2.230877, -3.259272, 1, 0.8627451, 0, 1,
-1.122566, 1.252712, -1.41082, 1, 0.8705882, 0, 1,
-1.119107, 0.04572042, -1.280333, 1, 0.8745098, 0, 1,
-1.114754, -0.5328951, -2.090724, 1, 0.8823529, 0, 1,
-1.111131, 1.653898, -0.9945058, 1, 0.8862745, 0, 1,
-1.102874, 0.1837328, 0.2695454, 1, 0.8941177, 0, 1,
-1.102324, 0.2890731, 0.8878505, 1, 0.8980392, 0, 1,
-1.098263, -0.9651104, -2.702324, 1, 0.9058824, 0, 1,
-1.09203, 1.031093, -1.980007, 1, 0.9137255, 0, 1,
-1.087212, -1.116408, -1.778096, 1, 0.9176471, 0, 1,
-1.077358, -0.2292484, -2.361737, 1, 0.9254902, 0, 1,
-1.076563, 0.3095008, -1.810558, 1, 0.9294118, 0, 1,
-1.074849, -0.3185533, -1.493932, 1, 0.9372549, 0, 1,
-1.068692, 0.3521178, -1.480466, 1, 0.9411765, 0, 1,
-1.067832, 0.01861376, -2.031013, 1, 0.9490196, 0, 1,
-1.067238, -1.086222, -2.351852, 1, 0.9529412, 0, 1,
-1.065343, -0.08730529, -0.8528478, 1, 0.9607843, 0, 1,
-1.063436, 0.1795539, -2.220171, 1, 0.9647059, 0, 1,
-1.062395, 0.6374485, -0.8785883, 1, 0.972549, 0, 1,
-1.061756, -1.131773, -1.469997, 1, 0.9764706, 0, 1,
-1.060646, -0.005375397, -1.178201, 1, 0.9843137, 0, 1,
-1.057073, -2.370082, -1.646412, 1, 0.9882353, 0, 1,
-1.055388, 0.5799957, -2.325413, 1, 0.9960784, 0, 1,
-1.055272, 0.8811665, 0.4405308, 0.9960784, 1, 0, 1,
-1.054803, 0.151768, -1.586957, 0.9921569, 1, 0, 1,
-1.054303, -0.4213961, -3.592549, 0.9843137, 1, 0, 1,
-1.054022, 0.5596482, -0.008945174, 0.9803922, 1, 0, 1,
-1.033556, 0.5576784, -1.391656, 0.972549, 1, 0, 1,
-1.031886, 1.55508, 0.9371113, 0.9686275, 1, 0, 1,
-1.029965, -1.593075, -1.532142, 0.9607843, 1, 0, 1,
-1.025571, -0.5022055, -3.771854, 0.9568627, 1, 0, 1,
-1.019854, 0.1600375, -1.786744, 0.9490196, 1, 0, 1,
-1.01542, -0.4167798, -0.9943975, 0.945098, 1, 0, 1,
-1.000084, -0.1157406, 0.281155, 0.9372549, 1, 0, 1,
-0.9995939, -1.180841, -2.835463, 0.9333333, 1, 0, 1,
-0.9970701, -0.5837688, -1.402416, 0.9254902, 1, 0, 1,
-0.9953077, 0.8400906, 0.1157381, 0.9215686, 1, 0, 1,
-0.989299, 0.6529412, -1.28269, 0.9137255, 1, 0, 1,
-0.9872828, 2.371949, -0.08654001, 0.9098039, 1, 0, 1,
-0.985101, -0.2602004, -2.869103, 0.9019608, 1, 0, 1,
-0.9732813, 1.478229, -1.745668, 0.8941177, 1, 0, 1,
-0.9709144, 1.120446, 0.2699017, 0.8901961, 1, 0, 1,
-0.9514726, -0.6332777, -0.8905426, 0.8823529, 1, 0, 1,
-0.950608, -0.02204205, -3.135056, 0.8784314, 1, 0, 1,
-0.9460028, 0.4930907, -0.7860125, 0.8705882, 1, 0, 1,
-0.9439811, 0.5332713, -0.3019163, 0.8666667, 1, 0, 1,
-0.9439561, 0.03110584, -1.43838, 0.8588235, 1, 0, 1,
-0.9438156, -1.359176, -3.314583, 0.854902, 1, 0, 1,
-0.9436027, 1.808307, -1.787157, 0.8470588, 1, 0, 1,
-0.9419196, -1.213794, -1.651616, 0.8431373, 1, 0, 1,
-0.9417845, -1.262043, -2.326202, 0.8352941, 1, 0, 1,
-0.9394982, 0.4173732, -1.766944, 0.8313726, 1, 0, 1,
-0.9373529, 0.2432006, -0.4109593, 0.8235294, 1, 0, 1,
-0.9369314, 0.02250618, -1.831793, 0.8196079, 1, 0, 1,
-0.9352044, 1.01396, -0.2270618, 0.8117647, 1, 0, 1,
-0.9346542, -0.2147056, -0.5109702, 0.8078431, 1, 0, 1,
-0.9248412, 0.1767154, -2.234998, 0.8, 1, 0, 1,
-0.9234929, 1.107454, -1.631449, 0.7921569, 1, 0, 1,
-0.9178092, 0.7044361, -0.2455848, 0.7882353, 1, 0, 1,
-0.9146537, -0.7348768, -1.332039, 0.7803922, 1, 0, 1,
-0.9144406, -0.747271, -0.5262453, 0.7764706, 1, 0, 1,
-0.9141491, 1.080316, -0.6750744, 0.7686275, 1, 0, 1,
-0.9140189, -0.5226687, 0.4074852, 0.7647059, 1, 0, 1,
-0.9054272, 0.1950937, -1.501588, 0.7568628, 1, 0, 1,
-0.9046227, -0.464676, -1.615893, 0.7529412, 1, 0, 1,
-0.9033574, -2.007042, -1.78232, 0.7450981, 1, 0, 1,
-0.897979, -0.9820561, -2.234818, 0.7411765, 1, 0, 1,
-0.8914872, -0.661948, -4.538455, 0.7333333, 1, 0, 1,
-0.8912327, 0.04214717, -1.788174, 0.7294118, 1, 0, 1,
-0.8859668, -0.1419724, -2.520416, 0.7215686, 1, 0, 1,
-0.8818207, 0.8512122, -0.9809967, 0.7176471, 1, 0, 1,
-0.8816367, 1.031961, -1.102659, 0.7098039, 1, 0, 1,
-0.8802558, 2.645415, -1.678898, 0.7058824, 1, 0, 1,
-0.8705799, 1.261293, -0.4380096, 0.6980392, 1, 0, 1,
-0.8635356, 0.4924505, -1.41642, 0.6901961, 1, 0, 1,
-0.862981, 0.5682312, -0.1870406, 0.6862745, 1, 0, 1,
-0.85695, 0.875777, -1.986978, 0.6784314, 1, 0, 1,
-0.8527564, 0.9029061, -1.297723, 0.6745098, 1, 0, 1,
-0.8479637, -0.5379205, -1.901023, 0.6666667, 1, 0, 1,
-0.8383532, 1.278627, -0.2709505, 0.6627451, 1, 0, 1,
-0.8366894, 0.1873527, -2.62342, 0.654902, 1, 0, 1,
-0.8332952, 0.3205514, -1.625016, 0.6509804, 1, 0, 1,
-0.8301204, -0.4409802, -2.733858, 0.6431373, 1, 0, 1,
-0.8299561, 0.6204945, 1.44831, 0.6392157, 1, 0, 1,
-0.8284915, -1.13735, -3.794923, 0.6313726, 1, 0, 1,
-0.825456, 1.111301, -1.286651, 0.627451, 1, 0, 1,
-0.8200011, 0.227216, -0.6283869, 0.6196079, 1, 0, 1,
-0.8184338, -1.35269, -3.231111, 0.6156863, 1, 0, 1,
-0.8182611, 0.04642927, -0.3232918, 0.6078432, 1, 0, 1,
-0.8182532, -1.384222, -2.336736, 0.6039216, 1, 0, 1,
-0.809311, -0.03523139, -2.184663, 0.5960785, 1, 0, 1,
-0.8037147, -0.6893005, -2.07769, 0.5882353, 1, 0, 1,
-0.8018933, 0.09153039, -0.7469035, 0.5843138, 1, 0, 1,
-0.8014739, 0.2304191, -0.9162455, 0.5764706, 1, 0, 1,
-0.7998883, -1.681486, -2.90239, 0.572549, 1, 0, 1,
-0.7991723, -0.9535099, -3.0328, 0.5647059, 1, 0, 1,
-0.7967659, -1.501724, -2.23436, 0.5607843, 1, 0, 1,
-0.7917375, -0.04171827, -1.779366, 0.5529412, 1, 0, 1,
-0.7870848, -1.415504, -1.720527, 0.5490196, 1, 0, 1,
-0.7852363, -0.2755128, -0.5958549, 0.5411765, 1, 0, 1,
-0.7732824, 1.560424, -0.4238552, 0.5372549, 1, 0, 1,
-0.7715502, -0.4632447, -1.870624, 0.5294118, 1, 0, 1,
-0.7674449, -0.2539392, -1.62921, 0.5254902, 1, 0, 1,
-0.76441, -0.1533602, -1.164955, 0.5176471, 1, 0, 1,
-0.7547513, 0.2944657, -0.5729055, 0.5137255, 1, 0, 1,
-0.754324, 0.400842, 1.204445, 0.5058824, 1, 0, 1,
-0.7494531, -0.4944534, -1.488271, 0.5019608, 1, 0, 1,
-0.7477434, -0.3270312, -2.45059, 0.4941176, 1, 0, 1,
-0.7466174, 0.5610748, -0.2930894, 0.4862745, 1, 0, 1,
-0.7447545, 0.5856884, -0.3387896, 0.4823529, 1, 0, 1,
-0.7402586, -1.087817, -3.218718, 0.4745098, 1, 0, 1,
-0.733923, -0.4772373, -3.24664, 0.4705882, 1, 0, 1,
-0.7334507, 1.892428, 1.138206, 0.4627451, 1, 0, 1,
-0.7332537, 0.6898664, 1.227972, 0.4588235, 1, 0, 1,
-0.7327811, -0.1658501, -2.209878, 0.4509804, 1, 0, 1,
-0.7300446, -1.064355, 0.1128831, 0.4470588, 1, 0, 1,
-0.7209225, -0.9773481, -2.054549, 0.4392157, 1, 0, 1,
-0.7180498, -1.154828, -2.845998, 0.4352941, 1, 0, 1,
-0.7149056, -0.345017, -1.331202, 0.427451, 1, 0, 1,
-0.7116432, 1.574896, -1.756106, 0.4235294, 1, 0, 1,
-0.7045089, 1.81565, -0.8860469, 0.4156863, 1, 0, 1,
-0.6979489, -0.5564235, -2.79851, 0.4117647, 1, 0, 1,
-0.6965807, -0.1413281, -1.579869, 0.4039216, 1, 0, 1,
-0.6944318, -0.6834929, -3.094442, 0.3960784, 1, 0, 1,
-0.6932461, 0.8657603, -1.821228, 0.3921569, 1, 0, 1,
-0.6893517, -0.8683729, -2.415995, 0.3843137, 1, 0, 1,
-0.6853767, 0.8459867, -0.4900765, 0.3803922, 1, 0, 1,
-0.6775437, -0.2403882, -2.189418, 0.372549, 1, 0, 1,
-0.6745362, -0.2629229, -1.017331, 0.3686275, 1, 0, 1,
-0.6744187, -0.2693402, -2.014229, 0.3607843, 1, 0, 1,
-0.6736952, -0.02970533, -2.24382, 0.3568628, 1, 0, 1,
-0.6667904, -0.0798191, -1.067229, 0.3490196, 1, 0, 1,
-0.6667466, -0.5692292, -2.257375, 0.345098, 1, 0, 1,
-0.6613216, 0.7395267, -1.525765, 0.3372549, 1, 0, 1,
-0.6600853, -0.9125494, -2.319032, 0.3333333, 1, 0, 1,
-0.6571372, -0.5009434, -1.168685, 0.3254902, 1, 0, 1,
-0.656046, 0.5638222, 0.4500874, 0.3215686, 1, 0, 1,
-0.6530594, 1.267883, -1.60548, 0.3137255, 1, 0, 1,
-0.6529522, -1.247457, -1.983219, 0.3098039, 1, 0, 1,
-0.6502787, -0.2085595, -1.284485, 0.3019608, 1, 0, 1,
-0.6475698, -0.9811273, -2.921339, 0.2941177, 1, 0, 1,
-0.6473724, -0.6901774, -1.857208, 0.2901961, 1, 0, 1,
-0.645698, -1.262113, -1.957214, 0.282353, 1, 0, 1,
-0.6438181, -1.015059, -2.357738, 0.2784314, 1, 0, 1,
-0.64082, -1.041648, -2.176437, 0.2705882, 1, 0, 1,
-0.6366176, -1.298904, -2.202199, 0.2666667, 1, 0, 1,
-0.6338557, -0.07775929, -0.1196594, 0.2588235, 1, 0, 1,
-0.6321692, 1.347334, 0.007457543, 0.254902, 1, 0, 1,
-0.629068, -1.931105, -2.234302, 0.2470588, 1, 0, 1,
-0.627202, 1.900634, -1.024617, 0.2431373, 1, 0, 1,
-0.6264597, 0.5555697, 0.4646606, 0.2352941, 1, 0, 1,
-0.620846, -0.6136681, -3.2943, 0.2313726, 1, 0, 1,
-0.6187585, -0.2784787, -4.95346, 0.2235294, 1, 0, 1,
-0.6162931, 1.075394, -1.080654, 0.2196078, 1, 0, 1,
-0.6137155, 0.3591102, 1.604137, 0.2117647, 1, 0, 1,
-0.6096212, 0.8380232, -0.6030455, 0.2078431, 1, 0, 1,
-0.6094652, -0.3786298, -3.588305, 0.2, 1, 0, 1,
-0.6054453, 0.6001089, 0.5947121, 0.1921569, 1, 0, 1,
-0.6024127, 0.8599131, 0.4301454, 0.1882353, 1, 0, 1,
-0.5939825, 1.296605, -0.6727862, 0.1803922, 1, 0, 1,
-0.5937741, 0.9774037, 0.3453069, 0.1764706, 1, 0, 1,
-0.5899562, -2.577844, -2.042337, 0.1686275, 1, 0, 1,
-0.5895181, -0.2041616, -1.764658, 0.1647059, 1, 0, 1,
-0.5759625, -0.355284, -3.404443, 0.1568628, 1, 0, 1,
-0.5726694, -0.4165284, -3.421236, 0.1529412, 1, 0, 1,
-0.5726209, 0.3250144, -0.6914505, 0.145098, 1, 0, 1,
-0.5659479, 1.091535, -0.1275236, 0.1411765, 1, 0, 1,
-0.5654647, -0.9117345, -1.317743, 0.1333333, 1, 0, 1,
-0.5617649, 0.2456207, -3.026474, 0.1294118, 1, 0, 1,
-0.5616904, 1.674929, 0.1856402, 0.1215686, 1, 0, 1,
-0.5584334, 1.395233, -1.916136, 0.1176471, 1, 0, 1,
-0.5557286, -0.4568368, -2.452753, 0.1098039, 1, 0, 1,
-0.5555998, -0.5017066, -2.872108, 0.1058824, 1, 0, 1,
-0.5545624, -0.9602799, -2.676182, 0.09803922, 1, 0, 1,
-0.5496231, 1.263416, -0.202459, 0.09019608, 1, 0, 1,
-0.5494253, -0.1969132, -3.939356, 0.08627451, 1, 0, 1,
-0.5483904, -1.589316, -1.174139, 0.07843138, 1, 0, 1,
-0.5483286, 0.7722555, -0.9077131, 0.07450981, 1, 0, 1,
-0.5394301, 0.3089325, 1.244211, 0.06666667, 1, 0, 1,
-0.5385439, 0.2839836, -0.08657088, 0.0627451, 1, 0, 1,
-0.5355746, 0.8124241, -0.8191013, 0.05490196, 1, 0, 1,
-0.530268, 1.027701, -0.6641412, 0.05098039, 1, 0, 1,
-0.5296131, -0.8984467, -1.084457, 0.04313726, 1, 0, 1,
-0.5269861, 0.5200964, -2.6972, 0.03921569, 1, 0, 1,
-0.5232955, 2.469766, 0.2556538, 0.03137255, 1, 0, 1,
-0.5232175, -0.01854723, -1.8311, 0.02745098, 1, 0, 1,
-0.5199217, 0.7903906, 0.2369449, 0.01960784, 1, 0, 1,
-0.5129634, -0.619219, -1.716256, 0.01568628, 1, 0, 1,
-0.5081252, -0.5356128, -2.944366, 0.007843138, 1, 0, 1,
-0.5064062, -0.1754486, -1.960784, 0.003921569, 1, 0, 1,
-0.5042351, 0.6128792, -1.288321, 0, 1, 0.003921569, 1,
-0.4991407, 0.369967, 0.3670816, 0, 1, 0.01176471, 1,
-0.4878269, 1.09897, -0.7847985, 0, 1, 0.01568628, 1,
-0.4868792, 0.268501, -1.353492, 0, 1, 0.02352941, 1,
-0.4846065, 1.578677, -0.4594055, 0, 1, 0.02745098, 1,
-0.4799904, -1.763787, -0.8824392, 0, 1, 0.03529412, 1,
-0.4786297, 0.7765457, -0.5040516, 0, 1, 0.03921569, 1,
-0.4780962, 1.175444, -1.199788, 0, 1, 0.04705882, 1,
-0.4744063, -1.808895, -3.12386, 0, 1, 0.05098039, 1,
-0.4694309, -0.6212139, -1.416378, 0, 1, 0.05882353, 1,
-0.4669529, -1.816833, -2.134515, 0, 1, 0.0627451, 1,
-0.4632797, 0.2987012, 0.6166935, 0, 1, 0.07058824, 1,
-0.4611518, -0.220563, -1.785501, 0, 1, 0.07450981, 1,
-0.441365, -0.1686389, -1.939983, 0, 1, 0.08235294, 1,
-0.4402468, 0.436815, -0.8318951, 0, 1, 0.08627451, 1,
-0.43565, 0.7045861, -0.9233211, 0, 1, 0.09411765, 1,
-0.4317452, -1.387894, -1.718058, 0, 1, 0.1019608, 1,
-0.4308809, -1.489136, -2.078733, 0, 1, 0.1058824, 1,
-0.4239112, -2.39685, -1.619588, 0, 1, 0.1137255, 1,
-0.4222866, -0.6560434, -3.378614, 0, 1, 0.1176471, 1,
-0.421409, -0.3131832, -1.35893, 0, 1, 0.1254902, 1,
-0.4199425, -1.018065, -5.326552, 0, 1, 0.1294118, 1,
-0.4103823, -0.5493652, -2.717311, 0, 1, 0.1372549, 1,
-0.402591, -0.3652503, -3.076236, 0, 1, 0.1411765, 1,
-0.3985557, -0.3993885, -3.510406, 0, 1, 0.1490196, 1,
-0.3977868, -0.09303335, -1.307743, 0, 1, 0.1529412, 1,
-0.3963594, -1.455751, -3.575198, 0, 1, 0.1607843, 1,
-0.394108, 0.607592, 0.607917, 0, 1, 0.1647059, 1,
-0.3906121, -0.2587208, -0.9449509, 0, 1, 0.172549, 1,
-0.3894471, 0.07246339, -1.264611, 0, 1, 0.1764706, 1,
-0.388628, -0.7338476, -2.298092, 0, 1, 0.1843137, 1,
-0.3855505, -0.2670432, -0.1684847, 0, 1, 0.1882353, 1,
-0.3845617, -1.377294, -3.033478, 0, 1, 0.1960784, 1,
-0.3840845, 0.2662191, -1.327309, 0, 1, 0.2039216, 1,
-0.3776143, -0.8754237, -2.101874, 0, 1, 0.2078431, 1,
-0.372149, 0.3106541, 0.09675815, 0, 1, 0.2156863, 1,
-0.371749, 1.795155, -0.1516465, 0, 1, 0.2196078, 1,
-0.3681745, 0.9510559, -0.4094968, 0, 1, 0.227451, 1,
-0.3658129, 1.574659, -0.02113313, 0, 1, 0.2313726, 1,
-0.3597176, 1.314486, 0.2727196, 0, 1, 0.2392157, 1,
-0.3591469, -0.0364885, -2.329136, 0, 1, 0.2431373, 1,
-0.3585448, -0.4270124, -1.595191, 0, 1, 0.2509804, 1,
-0.3572131, -1.112273, -2.698114, 0, 1, 0.254902, 1,
-0.355528, -1.738776, -2.559691, 0, 1, 0.2627451, 1,
-0.3530887, -0.6437371, -2.659027, 0, 1, 0.2666667, 1,
-0.3496709, -0.2815199, -1.394766, 0, 1, 0.2745098, 1,
-0.3465249, 1.16031, -2.010924, 0, 1, 0.2784314, 1,
-0.340383, 0.1372398, -1.63098, 0, 1, 0.2862745, 1,
-0.339604, -1.294342, -2.320898, 0, 1, 0.2901961, 1,
-0.3384504, -0.04050039, 0.6305621, 0, 1, 0.2980392, 1,
-0.3347155, -0.8891723, -0.8599079, 0, 1, 0.3058824, 1,
-0.3314724, 1.055245, -0.7495608, 0, 1, 0.3098039, 1,
-0.3306256, -1.068992, -2.279201, 0, 1, 0.3176471, 1,
-0.3242027, 0.6982474, -0.9326082, 0, 1, 0.3215686, 1,
-0.3230244, 0.2084345, -1.059228, 0, 1, 0.3294118, 1,
-0.3222809, -0.02054724, -0.6185035, 0, 1, 0.3333333, 1,
-0.3165651, -0.775091, -3.514944, 0, 1, 0.3411765, 1,
-0.3082463, 0.5594501, 0.1089854, 0, 1, 0.345098, 1,
-0.2944788, -0.1243417, -2.922551, 0, 1, 0.3529412, 1,
-0.2904572, 2.049034, 0.1599335, 0, 1, 0.3568628, 1,
-0.2900559, -1.032383, -2.808149, 0, 1, 0.3647059, 1,
-0.2894738, -0.7987708, -1.883926, 0, 1, 0.3686275, 1,
-0.2886322, 0.8855394, 1.547575, 0, 1, 0.3764706, 1,
-0.2880167, -1.070106, -1.894205, 0, 1, 0.3803922, 1,
-0.2863185, 0.2213586, -2.488802, 0, 1, 0.3882353, 1,
-0.2823477, 0.3709005, -0.8061168, 0, 1, 0.3921569, 1,
-0.2814584, -2.100201, -3.603595, 0, 1, 0.4, 1,
-0.2799425, 0.9713322, 0.4103522, 0, 1, 0.4078431, 1,
-0.2754456, 1.487579, -0.6046295, 0, 1, 0.4117647, 1,
-0.2653958, -0.2514998, -2.315708, 0, 1, 0.4196078, 1,
-0.2645788, -0.9176167, -3.548874, 0, 1, 0.4235294, 1,
-0.26453, -0.02298272, -0.1864435, 0, 1, 0.4313726, 1,
-0.2636346, -0.3504183, -1.971149, 0, 1, 0.4352941, 1,
-0.2619734, 1.419379, -0.02664088, 0, 1, 0.4431373, 1,
-0.2588974, 1.264421, -1.280059, 0, 1, 0.4470588, 1,
-0.2525383, -0.9641154, -4.623491, 0, 1, 0.454902, 1,
-0.2508499, -0.0460318, -2.21335, 0, 1, 0.4588235, 1,
-0.2471457, -1.104061, -4.377533, 0, 1, 0.4666667, 1,
-0.2455818, -0.3645378, -3.940229, 0, 1, 0.4705882, 1,
-0.2444401, -1.128064, -3.376729, 0, 1, 0.4784314, 1,
-0.2442987, 0.5610337, -2.573688, 0, 1, 0.4823529, 1,
-0.2415764, -1.006333, -4.054956, 0, 1, 0.4901961, 1,
-0.2357468, -0.9743049, -4.827137, 0, 1, 0.4941176, 1,
-0.2336497, 0.02525539, -1.661928, 0, 1, 0.5019608, 1,
-0.2294966, 0.8580351, -1.499557, 0, 1, 0.509804, 1,
-0.2280258, 0.7991387, -0.493184, 0, 1, 0.5137255, 1,
-0.2232151, -0.2220071, -4.462443, 0, 1, 0.5215687, 1,
-0.2231348, -0.9500857, -4.910657, 0, 1, 0.5254902, 1,
-0.2230176, -1.875271, -1.880212, 0, 1, 0.5333334, 1,
-0.2225007, 0.04516698, 1.450523, 0, 1, 0.5372549, 1,
-0.2220168, -0.8148953, -1.512669, 0, 1, 0.5450981, 1,
-0.2218434, 1.051887, 0.8334125, 0, 1, 0.5490196, 1,
-0.2188041, -1.642606, -5.245307, 0, 1, 0.5568628, 1,
-0.2158307, 0.6363474, -0.2419974, 0, 1, 0.5607843, 1,
-0.2147134, 0.1067428, -0.9162957, 0, 1, 0.5686275, 1,
-0.2130407, 0.2611947, 0.06573155, 0, 1, 0.572549, 1,
-0.2124234, -0.1599658, -1.654202, 0, 1, 0.5803922, 1,
-0.2092269, 0.3562433, 0.2930625, 0, 1, 0.5843138, 1,
-0.2061359, 0.3069423, -1.681058, 0, 1, 0.5921569, 1,
-0.2038431, -0.3324357, -2.586005, 0, 1, 0.5960785, 1,
-0.2028788, -0.1127473, -0.8187582, 0, 1, 0.6039216, 1,
-0.1994856, 0.4225323, -0.3123781, 0, 1, 0.6117647, 1,
-0.1991265, 0.4766283, -0.5337878, 0, 1, 0.6156863, 1,
-0.1990355, -0.8911461, -2.174298, 0, 1, 0.6235294, 1,
-0.1973175, -0.3159479, -2.388669, 0, 1, 0.627451, 1,
-0.1936505, 0.5191562, -0.443312, 0, 1, 0.6352941, 1,
-0.1931374, -0.5631906, -2.87821, 0, 1, 0.6392157, 1,
-0.1895453, 0.274503, -2.085789, 0, 1, 0.6470588, 1,
-0.1887062, 0.6003189, -2.93314, 0, 1, 0.6509804, 1,
-0.1845636, 1.815772, -0.8745705, 0, 1, 0.6588235, 1,
-0.1792312, 1.383801, -1.630301, 0, 1, 0.6627451, 1,
-0.1789251, -0.2722667, -3.627881, 0, 1, 0.6705883, 1,
-0.1714193, 1.335233, 0.8027599, 0, 1, 0.6745098, 1,
-0.1698958, 1.110862, 0.8370016, 0, 1, 0.682353, 1,
-0.1686648, -1.058271, -4.006057, 0, 1, 0.6862745, 1,
-0.1616688, -0.6753778, -3.712804, 0, 1, 0.6941177, 1,
-0.1564045, -0.4102519, -2.388261, 0, 1, 0.7019608, 1,
-0.1538998, -2.167065, -3.443789, 0, 1, 0.7058824, 1,
-0.1510702, 0.7643887, -0.5663266, 0, 1, 0.7137255, 1,
-0.1502696, -0.525467, -2.915835, 0, 1, 0.7176471, 1,
-0.1479688, -0.394227, -3.326592, 0, 1, 0.7254902, 1,
-0.1429876, 0.04559042, -0.9626638, 0, 1, 0.7294118, 1,
-0.1289456, -0.4426543, -2.78056, 0, 1, 0.7372549, 1,
-0.1219014, -2.151443, -2.523966, 0, 1, 0.7411765, 1,
-0.1215192, -1.022085, -3.699819, 0, 1, 0.7490196, 1,
-0.1154564, 1.892394, -0.7081451, 0, 1, 0.7529412, 1,
-0.1147027, 1.755468, -2.053855, 0, 1, 0.7607843, 1,
-0.1135152, 1.189646, 0.1591834, 0, 1, 0.7647059, 1,
-0.1128174, 0.8982518, 0.7586001, 0, 1, 0.772549, 1,
-0.1119347, -0.3474629, -1.372078, 0, 1, 0.7764706, 1,
-0.1117154, 0.2205597, -0.5327635, 0, 1, 0.7843137, 1,
-0.1112935, -1.593665, -1.518501, 0, 1, 0.7882353, 1,
-0.1105495, -0.9318403, -2.728005, 0, 1, 0.7960784, 1,
-0.1082409, 0.4823412, -0.9100061, 0, 1, 0.8039216, 1,
-0.1050373, -1.035314, -3.909621, 0, 1, 0.8078431, 1,
-0.09785385, -0.6923014, -3.487926, 0, 1, 0.8156863, 1,
-0.09708455, 0.1018768, -0.6101541, 0, 1, 0.8196079, 1,
-0.09445743, -2.357769, -2.467385, 0, 1, 0.827451, 1,
-0.09388401, 0.8897294, 0.1222617, 0, 1, 0.8313726, 1,
-0.09352448, -1.499797, -2.064127, 0, 1, 0.8392157, 1,
-0.09139845, 1.233702, 0.8364697, 0, 1, 0.8431373, 1,
-0.08955687, 0.3513161, -1.138855, 0, 1, 0.8509804, 1,
-0.08948395, -1.937967, -4.331182, 0, 1, 0.854902, 1,
-0.08495589, 1.419828, 1.529904, 0, 1, 0.8627451, 1,
-0.08124202, -2.674941, -2.342741, 0, 1, 0.8666667, 1,
-0.08087286, -1.322817, -0.7985167, 0, 1, 0.8745098, 1,
-0.07517925, -0.06524489, -1.108399, 0, 1, 0.8784314, 1,
-0.07492836, 1.856148, -0.2432382, 0, 1, 0.8862745, 1,
-0.07411261, 1.027032, 0.005477065, 0, 1, 0.8901961, 1,
-0.07393374, 0.01847831, -2.823291, 0, 1, 0.8980392, 1,
-0.07028601, 0.8386329, -0.1853343, 0, 1, 0.9058824, 1,
-0.07009614, -0.07508359, -3.640838, 0, 1, 0.9098039, 1,
-0.06780233, -1.41389, -4.132682, 0, 1, 0.9176471, 1,
-0.06580076, 0.8620507, -0.04377844, 0, 1, 0.9215686, 1,
-0.06394933, 0.6315948, -1.256867, 0, 1, 0.9294118, 1,
-0.06275058, 0.1040824, 0.7176071, 0, 1, 0.9333333, 1,
-0.05429652, -0.02963115, -0.2173022, 0, 1, 0.9411765, 1,
-0.05273566, 2.377339, -0.1425712, 0, 1, 0.945098, 1,
-0.05022167, 1.496496, -0.474606, 0, 1, 0.9529412, 1,
-0.04980715, -2.154463, -1.76402, 0, 1, 0.9568627, 1,
-0.04864734, 0.04804633, 0.04269191, 0, 1, 0.9647059, 1,
-0.0432775, -1.057055, -3.573451, 0, 1, 0.9686275, 1,
-0.03960219, -1.811335, -3.599795, 0, 1, 0.9764706, 1,
-0.03790599, -1.12462, -2.649622, 0, 1, 0.9803922, 1,
-0.03555337, -1.362022, -2.319809, 0, 1, 0.9882353, 1,
-0.03055718, 1.76846, -1.407176, 0, 1, 0.9921569, 1,
-0.03041758, 1.300612, -0.2209732, 0, 1, 1, 1,
-0.02855194, 0.9185073, -1.291275, 0, 0.9921569, 1, 1,
-0.02717984, 0.1733368, 1.604573, 0, 0.9882353, 1, 1,
-0.02437403, 0.1672045, 0.6144059, 0, 0.9803922, 1, 1,
-0.02333366, -0.4403013, -3.257086, 0, 0.9764706, 1, 1,
-0.02022074, 0.3181309, -2.649359, 0, 0.9686275, 1, 1,
-0.01806461, -1.083346, -3.526208, 0, 0.9647059, 1, 1,
-0.01146446, -1.109673, -0.290101, 0, 0.9568627, 1, 1,
-0.004507535, -0.3998794, -3.144615, 0, 0.9529412, 1, 1,
-0.0005448625, -0.04713868, -2.230446, 0, 0.945098, 1, 1,
0.002524488, 0.4705742, -1.668402, 0, 0.9411765, 1, 1,
0.004158573, -1.322363, 2.44621, 0, 0.9333333, 1, 1,
0.004298017, 1.236187, -0.5550872, 0, 0.9294118, 1, 1,
0.01440229, -0.3179084, 3.630821, 0, 0.9215686, 1, 1,
0.01729497, 1.268596, -0.7486553, 0, 0.9176471, 1, 1,
0.02231057, -0.3692333, 3.000169, 0, 0.9098039, 1, 1,
0.02328048, -0.16584, 5.162267, 0, 0.9058824, 1, 1,
0.03001647, 0.1387579, 1.319035, 0, 0.8980392, 1, 1,
0.03159313, 0.1867149, -0.8431851, 0, 0.8901961, 1, 1,
0.03185402, 0.8882593, 0.9737399, 0, 0.8862745, 1, 1,
0.03408815, 0.469107, -1.234006, 0, 0.8784314, 1, 1,
0.0382228, 0.9967787, -0.4003611, 0, 0.8745098, 1, 1,
0.04525927, -0.2218878, 2.049215, 0, 0.8666667, 1, 1,
0.04884508, -0.4407737, 2.705506, 0, 0.8627451, 1, 1,
0.05286133, 0.004193442, 1.054153, 0, 0.854902, 1, 1,
0.0541424, 1.201841, -1.061009, 0, 0.8509804, 1, 1,
0.05633005, -1.096002, 2.005575, 0, 0.8431373, 1, 1,
0.0618052, -2.68839, 2.301016, 0, 0.8392157, 1, 1,
0.06252563, 0.02549788, 2.84209, 0, 0.8313726, 1, 1,
0.06342148, 0.198176, -1.250187, 0, 0.827451, 1, 1,
0.06754562, 1.451022, 1.241982, 0, 0.8196079, 1, 1,
0.06800777, 2.788919, -0.1852194, 0, 0.8156863, 1, 1,
0.06975137, 0.01412662, -0.6443684, 0, 0.8078431, 1, 1,
0.07466161, -0.4878311, 4.171374, 0, 0.8039216, 1, 1,
0.07960794, 0.8440111, 1.053302, 0, 0.7960784, 1, 1,
0.08154469, -0.03681728, 2.08769, 0, 0.7882353, 1, 1,
0.08278482, 0.02060998, 2.412355, 0, 0.7843137, 1, 1,
0.08343187, 0.9764821, 0.3861619, 0, 0.7764706, 1, 1,
0.08387972, -1.401886, 3.663384, 0, 0.772549, 1, 1,
0.08834504, 0.9140114, 0.4494355, 0, 0.7647059, 1, 1,
0.08835674, 0.8909432, 0.2374111, 0, 0.7607843, 1, 1,
0.08836769, 0.3647799, -0.8405769, 0, 0.7529412, 1, 1,
0.09003682, 0.1465328, 0.8995163, 0, 0.7490196, 1, 1,
0.09242976, -0.2081308, 4.2489, 0, 0.7411765, 1, 1,
0.09455225, -0.9220353, 1.871137, 0, 0.7372549, 1, 1,
0.09568144, 0.3808586, 0.4952116, 0, 0.7294118, 1, 1,
0.09580558, -0.4569532, 4.863812, 0, 0.7254902, 1, 1,
0.09588679, -0.2930284, 3.178813, 0, 0.7176471, 1, 1,
0.09603194, -0.7850537, 4.205402, 0, 0.7137255, 1, 1,
0.09607533, 0.08420498, 3.348054, 0, 0.7058824, 1, 1,
0.1004989, 0.07034658, 1.565088, 0, 0.6980392, 1, 1,
0.1017013, 1.17534, 1.189815, 0, 0.6941177, 1, 1,
0.1021484, 0.4682659, 0.6337285, 0, 0.6862745, 1, 1,
0.1027933, -0.1045862, 4.363707, 0, 0.682353, 1, 1,
0.1038185, 0.1050933, 0.7004735, 0, 0.6745098, 1, 1,
0.1080683, 0.5923076, 1.82425, 0, 0.6705883, 1, 1,
0.1135424, -0.1055206, 0.7955453, 0, 0.6627451, 1, 1,
0.1143769, -0.8267791, 3.381222, 0, 0.6588235, 1, 1,
0.115722, 0.7252585, -1.333725, 0, 0.6509804, 1, 1,
0.1163813, 0.94317, 1.044304, 0, 0.6470588, 1, 1,
0.1174248, -1.614625, 2.955074, 0, 0.6392157, 1, 1,
0.1192731, -1.994119, 2.738048, 0, 0.6352941, 1, 1,
0.1266124, 0.9111419, 0.3725935, 0, 0.627451, 1, 1,
0.1303755, 0.9367999, -1.161644, 0, 0.6235294, 1, 1,
0.1329406, 1.326751, -0.5595636, 0, 0.6156863, 1, 1,
0.1330399, -0.4435188, 2.524514, 0, 0.6117647, 1, 1,
0.1372179, 0.6963114, 0.1375372, 0, 0.6039216, 1, 1,
0.1453289, 0.9787487, 0.132639, 0, 0.5960785, 1, 1,
0.1453419, -0.577074, 1.918833, 0, 0.5921569, 1, 1,
0.1455146, 0.4726458, -0.05142063, 0, 0.5843138, 1, 1,
0.146931, -0.004782675, 1.685543, 0, 0.5803922, 1, 1,
0.1470091, 1.488082, 0.7035774, 0, 0.572549, 1, 1,
0.1481016, 0.7029768, -1.866245, 0, 0.5686275, 1, 1,
0.1583348, 0.3954908, -0.9328776, 0, 0.5607843, 1, 1,
0.1619337, 1.045641, -0.06305626, 0, 0.5568628, 1, 1,
0.1622074, -0.4762907, 2.555647, 0, 0.5490196, 1, 1,
0.1634412, -1.48502, 3.350955, 0, 0.5450981, 1, 1,
0.1649478, 0.5072933, 1.162837, 0, 0.5372549, 1, 1,
0.1656116, -0.2653527, 2.346814, 0, 0.5333334, 1, 1,
0.1721089, -0.8302188, 2.492769, 0, 0.5254902, 1, 1,
0.172266, -0.7961044, 3.740765, 0, 0.5215687, 1, 1,
0.173724, 0.754619, -0.518621, 0, 0.5137255, 1, 1,
0.1747688, 0.09676817, 0.5617912, 0, 0.509804, 1, 1,
0.1762247, 0.7919191, 0.1882751, 0, 0.5019608, 1, 1,
0.1800048, -1.443536, 3.545001, 0, 0.4941176, 1, 1,
0.1813605, 1.825704, -1.128921, 0, 0.4901961, 1, 1,
0.1839572, 0.8921537, -0.9482017, 0, 0.4823529, 1, 1,
0.1874005, -1.002162, 3.376078, 0, 0.4784314, 1, 1,
0.1885901, 1.438116, -0.1213202, 0, 0.4705882, 1, 1,
0.1886875, 1.064374, 1.37229, 0, 0.4666667, 1, 1,
0.1924377, -1.249671, 3.670087, 0, 0.4588235, 1, 1,
0.1938747, -0.9356402, 2.358061, 0, 0.454902, 1, 1,
0.1947064, 1.527354, 1.255145, 0, 0.4470588, 1, 1,
0.2010435, 0.8342043, -1.331905, 0, 0.4431373, 1, 1,
0.2011922, -0.4126064, 1.445633, 0, 0.4352941, 1, 1,
0.2029362, 1.703284, 0.2978243, 0, 0.4313726, 1, 1,
0.2046317, 0.9941188, -0.02546659, 0, 0.4235294, 1, 1,
0.206501, -0.4001194, 2.129028, 0, 0.4196078, 1, 1,
0.2067203, -1.705541, 0.174705, 0, 0.4117647, 1, 1,
0.2128085, 1.457134, -0.4015821, 0, 0.4078431, 1, 1,
0.2156465, 0.733706, -0.4637435, 0, 0.4, 1, 1,
0.2162742, 0.2036291, 0.2016538, 0, 0.3921569, 1, 1,
0.2163331, -0.01633368, 2.364334, 0, 0.3882353, 1, 1,
0.2188858, -1.452775, 1.750538, 0, 0.3803922, 1, 1,
0.2196588, 0.6051055, 0.1925015, 0, 0.3764706, 1, 1,
0.2211086, -0.8253933, 0.508711, 0, 0.3686275, 1, 1,
0.222228, 1.487774, 0.1814564, 0, 0.3647059, 1, 1,
0.2254753, 0.4727715, 0.8468858, 0, 0.3568628, 1, 1,
0.2276663, -2.179893, 3.746907, 0, 0.3529412, 1, 1,
0.2284376, 1.4921, 1.188645, 0, 0.345098, 1, 1,
0.2314724, -0.07657224, 3.079169, 0, 0.3411765, 1, 1,
0.2364513, -2.408598, 3.600779, 0, 0.3333333, 1, 1,
0.2375473, 1.742015, -0.6229829, 0, 0.3294118, 1, 1,
0.239915, 0.7005887, 1.192227, 0, 0.3215686, 1, 1,
0.2484482, 0.800815, 0.2286449, 0, 0.3176471, 1, 1,
0.2506444, 0.876893, -0.03537853, 0, 0.3098039, 1, 1,
0.2519356, -1.349907, 1.681295, 0, 0.3058824, 1, 1,
0.25328, -0.5967898, 3.038217, 0, 0.2980392, 1, 1,
0.2547997, -0.5012349, 4.072406, 0, 0.2901961, 1, 1,
0.2548314, 1.326985, 1.865966, 0, 0.2862745, 1, 1,
0.2571411, -1.246456, 4.216851, 0, 0.2784314, 1, 1,
0.2580329, 1.205549, -0.6241474, 0, 0.2745098, 1, 1,
0.2582691, -0.08654448, 2.835864, 0, 0.2666667, 1, 1,
0.2615696, -0.6728426, 1.754876, 0, 0.2627451, 1, 1,
0.2631525, 0.05626856, 2.165927, 0, 0.254902, 1, 1,
0.2671503, -1.100531, 3.437135, 0, 0.2509804, 1, 1,
0.2713435, 0.2356602, 0.6827856, 0, 0.2431373, 1, 1,
0.2735667, 0.7406297, -0.9402425, 0, 0.2392157, 1, 1,
0.2787966, 0.3027836, -0.09410948, 0, 0.2313726, 1, 1,
0.2847458, 1.684936, 0.2542697, 0, 0.227451, 1, 1,
0.2858212, 0.7528561, -1.200467, 0, 0.2196078, 1, 1,
0.2876723, -0.161355, 4.16527, 0, 0.2156863, 1, 1,
0.2925787, 0.8032361, -0.4271244, 0, 0.2078431, 1, 1,
0.2940169, 1.972304, -1.309374, 0, 0.2039216, 1, 1,
0.2992575, 0.4882688, 1.106476, 0, 0.1960784, 1, 1,
0.3013442, 0.07061088, -0.07226403, 0, 0.1882353, 1, 1,
0.3044716, 1.293246, -0.7106116, 0, 0.1843137, 1, 1,
0.3065326, -1.516288, 2.075806, 0, 0.1764706, 1, 1,
0.3071187, -2.232759, 3.895416, 0, 0.172549, 1, 1,
0.3084626, -0.5408417, 3.386202, 0, 0.1647059, 1, 1,
0.3099732, -0.2979048, 3.035289, 0, 0.1607843, 1, 1,
0.3166778, 0.9023049, -0.5914617, 0, 0.1529412, 1, 1,
0.318721, -0.9635399, 2.258654, 0, 0.1490196, 1, 1,
0.3191482, 0.01973948, 1.0747, 0, 0.1411765, 1, 1,
0.3192845, 0.1540414, 3.02812, 0, 0.1372549, 1, 1,
0.326156, 0.5271031, 1.089106, 0, 0.1294118, 1, 1,
0.3284862, -1.993356, 1.237721, 0, 0.1254902, 1, 1,
0.3307413, -0.6461192, 2.487908, 0, 0.1176471, 1, 1,
0.3312255, 0.03292466, 1.324661, 0, 0.1137255, 1, 1,
0.3313868, -0.3387832, 2.246552, 0, 0.1058824, 1, 1,
0.3321579, 0.8732302, 0.7426471, 0, 0.09803922, 1, 1,
0.33307, 0.1227246, -0.5844385, 0, 0.09411765, 1, 1,
0.3395118, -0.3850481, 2.781073, 0, 0.08627451, 1, 1,
0.3405647, -0.2830522, 3.079176, 0, 0.08235294, 1, 1,
0.3421484, -0.8826964, 3.476172, 0, 0.07450981, 1, 1,
0.3457395, -1.439284, 2.386708, 0, 0.07058824, 1, 1,
0.3546484, 0.5782778, 0.5808068, 0, 0.0627451, 1, 1,
0.3557259, -1.689615, 3.046102, 0, 0.05882353, 1, 1,
0.3593742, 0.7403384, -0.02098408, 0, 0.05098039, 1, 1,
0.36009, 0.1445179, 1.453252, 0, 0.04705882, 1, 1,
0.3644816, -0.7347468, 4.390478, 0, 0.03921569, 1, 1,
0.364807, -0.400223, 1.402211, 0, 0.03529412, 1, 1,
0.3684764, -0.804907, 4.070798, 0, 0.02745098, 1, 1,
0.3700096, -0.8847201, 2.79222, 0, 0.02352941, 1, 1,
0.3717722, -0.5079867, 1.786796, 0, 0.01568628, 1, 1,
0.3736742, 0.1288285, 0.5935706, 0, 0.01176471, 1, 1,
0.3810503, 0.5617388, -1.48092, 0, 0.003921569, 1, 1,
0.3811209, -1.09489, 2.298552, 0.003921569, 0, 1, 1,
0.3854434, 2.539964, -0.6211274, 0.007843138, 0, 1, 1,
0.3880969, -0.5260125, 2.393911, 0.01568628, 0, 1, 1,
0.3900855, 0.5463978, 1.691097, 0.01960784, 0, 1, 1,
0.3948117, -0.03374338, 0.4269027, 0.02745098, 0, 1, 1,
0.3994844, 1.239895, -0.6628405, 0.03137255, 0, 1, 1,
0.4016331, -0.3096812, 1.767974, 0.03921569, 0, 1, 1,
0.405302, -0.04401345, 0.4142187, 0.04313726, 0, 1, 1,
0.4066288, -1.215036, 2.976778, 0.05098039, 0, 1, 1,
0.4091724, -1.041888, 1.737998, 0.05490196, 0, 1, 1,
0.4117312, 0.2591814, 0.9673411, 0.0627451, 0, 1, 1,
0.4155552, -0.49604, 3.869263, 0.06666667, 0, 1, 1,
0.422316, 0.3584919, 0.03071337, 0.07450981, 0, 1, 1,
0.4290893, 0.2924382, 1.33328, 0.07843138, 0, 1, 1,
0.4333635, -1.064996, 1.847371, 0.08627451, 0, 1, 1,
0.4340119, -0.4777411, 1.87093, 0.09019608, 0, 1, 1,
0.4349151, 2.965952, 2.433617, 0.09803922, 0, 1, 1,
0.4387721, 0.1760449, 0.8478059, 0.1058824, 0, 1, 1,
0.4388, -0.5386645, 2.449464, 0.1098039, 0, 1, 1,
0.4399644, -0.1000211, 2.274295, 0.1176471, 0, 1, 1,
0.443652, -0.7472208, 2.967639, 0.1215686, 0, 1, 1,
0.4453593, 0.01398255, 0.7425396, 0.1294118, 0, 1, 1,
0.4466057, -0.143296, 2.802948, 0.1333333, 0, 1, 1,
0.4496923, 1.080698, 0.4658621, 0.1411765, 0, 1, 1,
0.4500805, 1.458639, 1.11111, 0.145098, 0, 1, 1,
0.4559716, 0.006950294, 1.261986, 0.1529412, 0, 1, 1,
0.4593225, 1.295333, -0.2317961, 0.1568628, 0, 1, 1,
0.4639198, -1.666116, 0.9702213, 0.1647059, 0, 1, 1,
0.4669991, -0.4539339, 3.10171, 0.1686275, 0, 1, 1,
0.4676043, 1.030486, -0.1257531, 0.1764706, 0, 1, 1,
0.4709817, 0.858043, -0.315391, 0.1803922, 0, 1, 1,
0.4746171, -0.9201642, 2.292792, 0.1882353, 0, 1, 1,
0.4751058, 0.2626697, 0.8758705, 0.1921569, 0, 1, 1,
0.4768059, -0.2734866, 3.45598, 0.2, 0, 1, 1,
0.4801096, -1.67222, 3.730288, 0.2078431, 0, 1, 1,
0.482632, 1.857733, 0.8474684, 0.2117647, 0, 1, 1,
0.4862636, -0.4281598, 1.702564, 0.2196078, 0, 1, 1,
0.4868281, -1.017007, 1.208676, 0.2235294, 0, 1, 1,
0.4872442, -0.5778417, 1.912778, 0.2313726, 0, 1, 1,
0.4876418, -0.5410893, 3.605965, 0.2352941, 0, 1, 1,
0.5075166, -1.493325, 3.677713, 0.2431373, 0, 1, 1,
0.5094171, -1.235505, 3.801469, 0.2470588, 0, 1, 1,
0.5123028, 0.8318648, -0.06700079, 0.254902, 0, 1, 1,
0.5292532, 0.7579157, 1.088221, 0.2588235, 0, 1, 1,
0.5299494, 0.2386188, 1.895075, 0.2666667, 0, 1, 1,
0.5364462, 0.5441025, -0.6529543, 0.2705882, 0, 1, 1,
0.537727, 0.8213201, 0.6722491, 0.2784314, 0, 1, 1,
0.5382733, 0.6889948, 0.8815003, 0.282353, 0, 1, 1,
0.5454785, 1.089643, 0.9653395, 0.2901961, 0, 1, 1,
0.5512601, 2.370173, 1.078706, 0.2941177, 0, 1, 1,
0.5528248, 0.1452888, 2.237641, 0.3019608, 0, 1, 1,
0.553755, 0.3296731, 0.7952884, 0.3098039, 0, 1, 1,
0.5539412, 1.13682, 1.370099, 0.3137255, 0, 1, 1,
0.5550756, -0.1289134, 2.05826, 0.3215686, 0, 1, 1,
0.5571859, 1.254929, 0.867284, 0.3254902, 0, 1, 1,
0.5580039, 0.2368385, 2.3025, 0.3333333, 0, 1, 1,
0.5621419, 0.5441214, -0.5996557, 0.3372549, 0, 1, 1,
0.5657143, -0.3328097, 0.875273, 0.345098, 0, 1, 1,
0.5714896, 0.9819862, 1.036232, 0.3490196, 0, 1, 1,
0.5738284, 0.6855022, 0.7774436, 0.3568628, 0, 1, 1,
0.5743492, 1.29045, 0.7612734, 0.3607843, 0, 1, 1,
0.576912, 0.5180001, 0.4186904, 0.3686275, 0, 1, 1,
0.5788084, 0.1655979, 4.458131, 0.372549, 0, 1, 1,
0.5858303, -1.463992, 2.428008, 0.3803922, 0, 1, 1,
0.588415, 0.4630788, 1.262801, 0.3843137, 0, 1, 1,
0.5965135, -0.4702672, 0.6711571, 0.3921569, 0, 1, 1,
0.599302, -0.1809592, 1.813472, 0.3960784, 0, 1, 1,
0.6017981, -0.02150632, 0.1446435, 0.4039216, 0, 1, 1,
0.6024738, 0.2920989, 1.780521, 0.4117647, 0, 1, 1,
0.6047161, -1.923594, 3.390432, 0.4156863, 0, 1, 1,
0.6053702, 0.4420437, -0.2595908, 0.4235294, 0, 1, 1,
0.6068779, -1.459069, 3.155239, 0.427451, 0, 1, 1,
0.6082234, -1.693972, 2.985268, 0.4352941, 0, 1, 1,
0.6084344, 1.18999, 1.077507, 0.4392157, 0, 1, 1,
0.6090033, 1.081403, -0.5140077, 0.4470588, 0, 1, 1,
0.6099883, 0.7010139, 1.637419, 0.4509804, 0, 1, 1,
0.6183363, -1.12039, -0.1895645, 0.4588235, 0, 1, 1,
0.6208123, 0.01088254, -0.1852071, 0.4627451, 0, 1, 1,
0.6238224, -1.417825, 2.05745, 0.4705882, 0, 1, 1,
0.624664, 1.693919, -1.453888, 0.4745098, 0, 1, 1,
0.6328641, -0.95144, 3.086908, 0.4823529, 0, 1, 1,
0.6332014, -0.2362687, 1.991207, 0.4862745, 0, 1, 1,
0.6354825, -0.146183, -0.09752808, 0.4941176, 0, 1, 1,
0.6362031, 1.599257, 1.113414, 0.5019608, 0, 1, 1,
0.6376935, -2.362789, 3.498937, 0.5058824, 0, 1, 1,
0.6383478, -0.2475905, 1.687987, 0.5137255, 0, 1, 1,
0.6445749, -0.4211687, 2.78912, 0.5176471, 0, 1, 1,
0.647777, 0.7198433, 1.924436, 0.5254902, 0, 1, 1,
0.6575178, -1.792702, 2.653038, 0.5294118, 0, 1, 1,
0.6609458, -0.6132804, 2.163363, 0.5372549, 0, 1, 1,
0.6612578, 0.2221305, 1.365093, 0.5411765, 0, 1, 1,
0.6673473, 0.58119, 0.950718, 0.5490196, 0, 1, 1,
0.6680449, -0.7895742, 2.727336, 0.5529412, 0, 1, 1,
0.6752326, -1.345506, 1.765662, 0.5607843, 0, 1, 1,
0.6807108, -1.483059, 4.022936, 0.5647059, 0, 1, 1,
0.6873521, 0.393969, 1.479836, 0.572549, 0, 1, 1,
0.6899961, 0.609493, -0.1203297, 0.5764706, 0, 1, 1,
0.6909775, -1.138849, 3.421653, 0.5843138, 0, 1, 1,
0.6924214, -0.405995, 2.717734, 0.5882353, 0, 1, 1,
0.6968683, 0.7319149, 1.378607, 0.5960785, 0, 1, 1,
0.6998842, -0.4364438, 1.672566, 0.6039216, 0, 1, 1,
0.7009228, -0.784186, 1.421405, 0.6078432, 0, 1, 1,
0.7016052, 0.7932236, 1.326379, 0.6156863, 0, 1, 1,
0.7040441, -0.2742235, 1.814201, 0.6196079, 0, 1, 1,
0.7126884, -0.2164692, 1.042628, 0.627451, 0, 1, 1,
0.7156218, -0.5881146, 2.583802, 0.6313726, 0, 1, 1,
0.7170205, -0.3372236, 3.361985, 0.6392157, 0, 1, 1,
0.7193444, 1.365077, 0.2934497, 0.6431373, 0, 1, 1,
0.7194089, 0.1715896, 0.971912, 0.6509804, 0, 1, 1,
0.7201073, -0.7594125, -0.2208418, 0.654902, 0, 1, 1,
0.7239515, -1.401413, 2.26463, 0.6627451, 0, 1, 1,
0.7263616, 0.4222343, 1.874741, 0.6666667, 0, 1, 1,
0.7277012, 0.1136787, 2.138741, 0.6745098, 0, 1, 1,
0.728782, 2.230402, -0.6865811, 0.6784314, 0, 1, 1,
0.731445, -0.9887927, 3.683297, 0.6862745, 0, 1, 1,
0.7390022, 0.7042225, 0.2442827, 0.6901961, 0, 1, 1,
0.739023, -0.6137213, 1.07026, 0.6980392, 0, 1, 1,
0.7395585, 0.4258716, 0.3216032, 0.7058824, 0, 1, 1,
0.7410283, -0.9829985, 3.396698, 0.7098039, 0, 1, 1,
0.7484962, 0.5427153, -0.5090134, 0.7176471, 0, 1, 1,
0.7528077, -1.221963, 2.258363, 0.7215686, 0, 1, 1,
0.7533765, -0.1762071, 1.603344, 0.7294118, 0, 1, 1,
0.7597466, -0.3967845, 0.9607056, 0.7333333, 0, 1, 1,
0.7623608, -0.4357946, 2.701209, 0.7411765, 0, 1, 1,
0.7631466, 1.187357, 2.787939, 0.7450981, 0, 1, 1,
0.7662117, 1.416413, 1.038059, 0.7529412, 0, 1, 1,
0.7755385, -0.5355778, 1.532403, 0.7568628, 0, 1, 1,
0.7807144, 1.814214, 0.3266475, 0.7647059, 0, 1, 1,
0.7858816, 1.353306, -0.6474614, 0.7686275, 0, 1, 1,
0.7861505, 0.8022871, 0.07878595, 0.7764706, 0, 1, 1,
0.786599, 2.59219, -0.2512024, 0.7803922, 0, 1, 1,
0.7880603, -1.75125, 2.661964, 0.7882353, 0, 1, 1,
0.7909569, 0.6783072, 1.508474, 0.7921569, 0, 1, 1,
0.7974193, -1.128653, 1.793672, 0.8, 0, 1, 1,
0.8003057, -1.608616, 2.263783, 0.8078431, 0, 1, 1,
0.8042606, -0.1358369, 2.75486, 0.8117647, 0, 1, 1,
0.8057453, 0.07667866, 1.436318, 0.8196079, 0, 1, 1,
0.8123633, -0.9973187, 2.018538, 0.8235294, 0, 1, 1,
0.8133521, 1.133454, -0.07314885, 0.8313726, 0, 1, 1,
0.8181508, -0.463226, 2.059798, 0.8352941, 0, 1, 1,
0.8205881, 0.2996886, 0.1998698, 0.8431373, 0, 1, 1,
0.8220177, -0.8763568, 1.365493, 0.8470588, 0, 1, 1,
0.8222128, -0.456934, 1.579202, 0.854902, 0, 1, 1,
0.8230562, 0.2073694, 0.5412141, 0.8588235, 0, 1, 1,
0.830858, -0.6913295, 2.458769, 0.8666667, 0, 1, 1,
0.8351174, 1.949159, -0.5012242, 0.8705882, 0, 1, 1,
0.846628, 1.028906, 1.19195, 0.8784314, 0, 1, 1,
0.8531591, -0.4113455, 0.7143101, 0.8823529, 0, 1, 1,
0.8539389, -0.5543995, 1.360492, 0.8901961, 0, 1, 1,
0.8626224, -0.8655199, 2.413461, 0.8941177, 0, 1, 1,
0.867846, -0.2688898, 1.91569, 0.9019608, 0, 1, 1,
0.8777951, -1.288271, 2.481203, 0.9098039, 0, 1, 1,
0.8789607, 1.803326, -0.3546959, 0.9137255, 0, 1, 1,
0.8963034, -0.1354972, 0.3790523, 0.9215686, 0, 1, 1,
0.8968043, -0.5167326, 3.62303, 0.9254902, 0, 1, 1,
0.8980439, -0.376924, 4.109501, 0.9333333, 0, 1, 1,
0.9031245, -0.414078, 0.7287726, 0.9372549, 0, 1, 1,
0.9069106, 0.04060018, 2.938892, 0.945098, 0, 1, 1,
0.9116579, 0.4478905, 1.212881, 0.9490196, 0, 1, 1,
0.9118248, 0.09039021, 0.1452654, 0.9568627, 0, 1, 1,
0.9131483, -0.6332635, 1.4803, 0.9607843, 0, 1, 1,
0.9146017, -0.7119269, 2.655677, 0.9686275, 0, 1, 1,
0.9153913, -0.852749, 2.651799, 0.972549, 0, 1, 1,
0.9167659, -0.6473439, 1.573861, 0.9803922, 0, 1, 1,
0.9177958, 0.7700412, 0.9117761, 0.9843137, 0, 1, 1,
0.9248897, -1.660453, 4.694698, 0.9921569, 0, 1, 1,
0.9333839, 0.3873853, 2.687943, 0.9960784, 0, 1, 1,
0.9351532, -0.9027275, 2.640573, 1, 0, 0.9960784, 1,
0.9389939, 0.3675771, 0.7934885, 1, 0, 0.9882353, 1,
0.9402298, 0.02091307, 1.179619, 1, 0, 0.9843137, 1,
0.9436187, -0.126798, 2.935295, 1, 0, 0.9764706, 1,
0.9570979, 0.3328381, 0.7537763, 1, 0, 0.972549, 1,
0.9644204, -0.4261409, 1.203811, 1, 0, 0.9647059, 1,
0.9714723, -1.023548, 3.986085, 1, 0, 0.9607843, 1,
0.9791642, 0.0377989, 0.6267766, 1, 0, 0.9529412, 1,
0.9843976, -0.8740996, 2.99544, 1, 0, 0.9490196, 1,
0.9901766, -1.734745, 2.400315, 1, 0, 0.9411765, 1,
0.9920127, 1.706059, 0.8090156, 1, 0, 0.9372549, 1,
1.006184, 0.8985888, 2.328401, 1, 0, 0.9294118, 1,
1.015825, -0.659165, 1.925258, 1, 0, 0.9254902, 1,
1.017742, 0.4989188, 2.643587, 1, 0, 0.9176471, 1,
1.024899, 0.003005727, 1.604854, 1, 0, 0.9137255, 1,
1.026368, -0.5128781, 1.530632, 1, 0, 0.9058824, 1,
1.030823, 0.7663259, 0.5545033, 1, 0, 0.9019608, 1,
1.031999, -0.1612893, 0.192034, 1, 0, 0.8941177, 1,
1.034328, -1.277313, 3.416177, 1, 0, 0.8862745, 1,
1.036846, -1.065558, 2.131922, 1, 0, 0.8823529, 1,
1.036977, -0.7940139, 2.447035, 1, 0, 0.8745098, 1,
1.043396, -1.094218, 3.028044, 1, 0, 0.8705882, 1,
1.05102, -1.161108, 3.276367, 1, 0, 0.8627451, 1,
1.053452, 2.488843, 1.52708, 1, 0, 0.8588235, 1,
1.059401, 2.404366, 1.229441, 1, 0, 0.8509804, 1,
1.061988, -1.963369, 2.415372, 1, 0, 0.8470588, 1,
1.087566, 0.8289881, 0.4966044, 1, 0, 0.8392157, 1,
1.102035, -1.078959, 2.456262, 1, 0, 0.8352941, 1,
1.10833, 0.3277341, 1.431588, 1, 0, 0.827451, 1,
1.117141, 0.5595823, 0.4682751, 1, 0, 0.8235294, 1,
1.119579, -1.335438, 3.04131, 1, 0, 0.8156863, 1,
1.122789, 0.7412111, 2.312321, 1, 0, 0.8117647, 1,
1.122815, -0.2795501, 0.04546459, 1, 0, 0.8039216, 1,
1.142325, -0.6910161, 3.271432, 1, 0, 0.7960784, 1,
1.149376, -0.3488322, 2.019172, 1, 0, 0.7921569, 1,
1.152245, 0.1225253, 1.078237, 1, 0, 0.7843137, 1,
1.155653, 0.4175199, 1.30572, 1, 0, 0.7803922, 1,
1.162218, -0.3636516, 3.493464, 1, 0, 0.772549, 1,
1.162781, 0.7794604, -0.1835084, 1, 0, 0.7686275, 1,
1.165125, 2.572825, 0.7290422, 1, 0, 0.7607843, 1,
1.174785, 0.4318832, 1.101598, 1, 0, 0.7568628, 1,
1.175015, -1.393934, 2.540903, 1, 0, 0.7490196, 1,
1.187665, -1.353656, 1.80746, 1, 0, 0.7450981, 1,
1.192931, 1.663231, -0.3617062, 1, 0, 0.7372549, 1,
1.194254, -1.341864, 2.889304, 1, 0, 0.7333333, 1,
1.195886, -0.9743135, 2.445817, 1, 0, 0.7254902, 1,
1.197476, -0.663784, 2.452451, 1, 0, 0.7215686, 1,
1.209678, 0.3679452, 0.8211319, 1, 0, 0.7137255, 1,
1.210736, -1.078708, 4.193583, 1, 0, 0.7098039, 1,
1.211212, -2.667637, 0.4930448, 1, 0, 0.7019608, 1,
1.231741, -2.05698, 3.368859, 1, 0, 0.6941177, 1,
1.235397, 0.2318139, 2.004462, 1, 0, 0.6901961, 1,
1.243412, -0.1047943, 3.4895, 1, 0, 0.682353, 1,
1.247818, 1.028528, 0.8997801, 1, 0, 0.6784314, 1,
1.248401, -1.780506, 4.046741, 1, 0, 0.6705883, 1,
1.250646, -0.9963129, 2.842695, 1, 0, 0.6666667, 1,
1.25191, -2.242287, 2.943534, 1, 0, 0.6588235, 1,
1.2528, 0.05993529, 0.01455113, 1, 0, 0.654902, 1,
1.267081, -0.7433054, 2.987696, 1, 0, 0.6470588, 1,
1.267601, -0.9872196, 3.86356, 1, 0, 0.6431373, 1,
1.268434, 1.426082, 2.177446, 1, 0, 0.6352941, 1,
1.283062, -0.1981521, 0.4039675, 1, 0, 0.6313726, 1,
1.286849, 1.491186, -0.895273, 1, 0, 0.6235294, 1,
1.296419, 0.1437044, 1.777049, 1, 0, 0.6196079, 1,
1.297243, 2.178065, -0.903789, 1, 0, 0.6117647, 1,
1.300813, -0.9558665, 1.381669, 1, 0, 0.6078432, 1,
1.302233, 0.8487456, 0.8336877, 1, 0, 0.6, 1,
1.323198, 0.2383032, 2.298737, 1, 0, 0.5921569, 1,
1.335825, -1.91756, 2.385401, 1, 0, 0.5882353, 1,
1.34133, 1.734263, 0.4346513, 1, 0, 0.5803922, 1,
1.342581, 1.652122, -1.108175, 1, 0, 0.5764706, 1,
1.344837, -0.6500398, 1.88352, 1, 0, 0.5686275, 1,
1.358485, 0.5707627, 2.132056, 1, 0, 0.5647059, 1,
1.369556, 0.3467455, -0.7370122, 1, 0, 0.5568628, 1,
1.413077, -1.729263, 1.393761, 1, 0, 0.5529412, 1,
1.419239, 1.222409, 0.3263628, 1, 0, 0.5450981, 1,
1.440849, -0.0985196, 0.9672115, 1, 0, 0.5411765, 1,
1.441441, -0.1855287, 4.428453, 1, 0, 0.5333334, 1,
1.446203, 0.5686628, 0.9601036, 1, 0, 0.5294118, 1,
1.460691, -0.4158871, 1.130081, 1, 0, 0.5215687, 1,
1.466942, -0.5387122, 2.515545, 1, 0, 0.5176471, 1,
1.475852, -0.1209115, 2.113551, 1, 0, 0.509804, 1,
1.483505, 1.475235, 1.684876, 1, 0, 0.5058824, 1,
1.484288, -0.8934179, 4.236363, 1, 0, 0.4980392, 1,
1.485032, -0.8908204, 2.000998, 1, 0, 0.4901961, 1,
1.489416, 0.7807028, 0.6396839, 1, 0, 0.4862745, 1,
1.491757, 0.1088248, 1.62916, 1, 0, 0.4784314, 1,
1.497019, -0.1467726, 0.1440726, 1, 0, 0.4745098, 1,
1.502008, -0.3736384, 1.696652, 1, 0, 0.4666667, 1,
1.507227, 1.172514, -1.108742, 1, 0, 0.4627451, 1,
1.53153, 1.012348, 1.095687, 1, 0, 0.454902, 1,
1.555743, 1.591161, 0.2058236, 1, 0, 0.4509804, 1,
1.559137, -0.217185, 0.5936812, 1, 0, 0.4431373, 1,
1.563332, 1.756422, 1.527936, 1, 0, 0.4392157, 1,
1.575977, -1.19277, 0.2749641, 1, 0, 0.4313726, 1,
1.577857, -0.02291485, 0.07190559, 1, 0, 0.427451, 1,
1.584661, -0.189376, 0.1904239, 1, 0, 0.4196078, 1,
1.589093, -0.1318351, 2.881054, 1, 0, 0.4156863, 1,
1.60925, 2.20719, -0.2519134, 1, 0, 0.4078431, 1,
1.621183, -0.7556226, 2.027544, 1, 0, 0.4039216, 1,
1.631713, 0.2672451, 2.682895, 1, 0, 0.3960784, 1,
1.642289, -2.518444, 2.156754, 1, 0, 0.3882353, 1,
1.643866, -0.6367505, 2.277587, 1, 0, 0.3843137, 1,
1.646398, 0.2683572, -0.1456463, 1, 0, 0.3764706, 1,
1.658348, 1.233978, 0.4804406, 1, 0, 0.372549, 1,
1.672365, 1.127198, 1.252653, 1, 0, 0.3647059, 1,
1.680115, 1.470383, 0.2945997, 1, 0, 0.3607843, 1,
1.691226, -1.260566, 1.749641, 1, 0, 0.3529412, 1,
1.703063, 0.1512627, 3.236075, 1, 0, 0.3490196, 1,
1.714812, 1.605954, 1.755555, 1, 0, 0.3411765, 1,
1.716984, 0.1266349, 1.245116, 1, 0, 0.3372549, 1,
1.721705, 1.700576, -0.3529881, 1, 0, 0.3294118, 1,
1.726165, 0.5613252, 0.590046, 1, 0, 0.3254902, 1,
1.734616, 1.037574, 1.937255, 1, 0, 0.3176471, 1,
1.763687, 0.8632548, 0.4910317, 1, 0, 0.3137255, 1,
1.773358, 1.099105, 0.9834635, 1, 0, 0.3058824, 1,
1.797796, 0.4083176, 0.9355077, 1, 0, 0.2980392, 1,
1.799643, 0.457288, 1.895088, 1, 0, 0.2941177, 1,
1.801068, 0.1453341, 2.303533, 1, 0, 0.2862745, 1,
1.825424, -1.580212, 3.054936, 1, 0, 0.282353, 1,
1.827625, 1.48066, 0.5097873, 1, 0, 0.2745098, 1,
1.829733, 1.444752, 0.3955368, 1, 0, 0.2705882, 1,
1.832772, -1.076514, 0.782264, 1, 0, 0.2627451, 1,
1.832816, -1.502539, 0.6935365, 1, 0, 0.2588235, 1,
1.852298, -0.9981619, 1.935531, 1, 0, 0.2509804, 1,
1.859087, 0.3803857, 1.561663, 1, 0, 0.2470588, 1,
1.859729, -0.5237895, 1.001885, 1, 0, 0.2392157, 1,
1.895104, -0.1989687, 0.7099492, 1, 0, 0.2352941, 1,
1.897659, 0.2828994, 0.1155593, 1, 0, 0.227451, 1,
1.929349, 0.1314027, 1.753631, 1, 0, 0.2235294, 1,
1.941033, -0.4606854, 2.256184, 1, 0, 0.2156863, 1,
1.970181, -0.1411483, 2.175746, 1, 0, 0.2117647, 1,
2.010695, -0.0623314, 1.422759, 1, 0, 0.2039216, 1,
2.035054, -0.5678284, 2.082039, 1, 0, 0.1960784, 1,
2.066415, 1.301007, 1.167667, 1, 0, 0.1921569, 1,
2.068398, 0.5299757, 0.953446, 1, 0, 0.1843137, 1,
2.068959, 1.223103, 0.04058272, 1, 0, 0.1803922, 1,
2.088261, -0.5563698, 2.111053, 1, 0, 0.172549, 1,
2.100529, -0.4329778, 1.139385, 1, 0, 0.1686275, 1,
2.107709, -0.8071097, 2.242606, 1, 0, 0.1607843, 1,
2.147871, -0.3998483, 0.9570627, 1, 0, 0.1568628, 1,
2.163425, -0.5482023, 1.705018, 1, 0, 0.1490196, 1,
2.166304, 0.254207, 0.09230161, 1, 0, 0.145098, 1,
2.229696, 0.2608339, 3.603502, 1, 0, 0.1372549, 1,
2.257576, -0.5874798, 2.928674, 1, 0, 0.1333333, 1,
2.264543, 1.307939, 1.468645, 1, 0, 0.1254902, 1,
2.267616, 0.5164778, -0.0002062308, 1, 0, 0.1215686, 1,
2.324175, -1.687412, 2.454342, 1, 0, 0.1137255, 1,
2.342612, 1.152579, 2.684417, 1, 0, 0.1098039, 1,
2.391587, -0.2841635, 2.50523, 1, 0, 0.1019608, 1,
2.412106, -1.963162, 1.422079, 1, 0, 0.09411765, 1,
2.41222, -0.343726, 1.345825, 1, 0, 0.09019608, 1,
2.436154, 0.5476817, 0.6809294, 1, 0, 0.08235294, 1,
2.437276, 0.3146226, 1.015333, 1, 0, 0.07843138, 1,
2.478538, 0.7225273, 0.7056361, 1, 0, 0.07058824, 1,
2.48752, 0.4740486, 1.736368, 1, 0, 0.06666667, 1,
2.531136, 1.248859, 0.743762, 1, 0, 0.05882353, 1,
2.53914, -2.439799, 1.001959, 1, 0, 0.05490196, 1,
2.584573, -0.2825021, 2.022074, 1, 0, 0.04705882, 1,
2.599231, -1.343716, 3.29868, 1, 0, 0.04313726, 1,
2.603494, 1.740346, 1.65, 1, 0, 0.03529412, 1,
2.629821, 0.1894829, 1.53464, 1, 0, 0.03137255, 1,
2.635824, -0.03597512, -0.2681899, 1, 0, 0.02352941, 1,
2.710578, -1.126526, 2.250183, 1, 0, 0.01960784, 1,
2.805514, 0.3696773, 1.780683, 1, 0, 0.01176471, 1,
3.032038, 0.7363834, 0.8016061, 1, 0, 0.007843138, 1
]);
var buf95 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf95);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc95 = gl.getUniformLocation(prog95,"mvMatrix");
var prMatLoc95 = gl.getUniformLocation(prog95,"prMatrix");
// ****** text object 97 ******
var prog97  = gl.createProgram();
gl.attachShader(prog97, getShader( gl, "testglvshader97" ));
gl.attachShader(prog97, getShader( gl, "testglfshader97" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog97, 0, "aPos");
gl.bindAttribLocation(prog97, 1, "aCol");
gl.linkProgram(prog97);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX97 = texinfo.canvasX;
var canvasY97 = texinfo.canvasY;
var ofsLoc97 = gl.getAttribLocation(prog97, "aOfs");
var texture97 = gl.createTexture();
var texLoc97 = gl.getAttribLocation(prog97, "aTexcoord");
var sampler97 = gl.getUniformLocation(prog97,"uSampler");
handleLoadedTexture(texture97, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.02280426, -3.646801, -7.104407, 0, -0.5, 0.5, 0.5,
-0.02280426, -3.646801, -7.104407, 1, -0.5, 0.5, 0.5,
-0.02280426, -3.646801, -7.104407, 1, 1.5, 0.5, 0.5,
-0.02280426, -3.646801, -7.104407, 0, 1.5, 0.5, 0.5
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
var buf97 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf97);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf97 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf97);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc97 = gl.getUniformLocation(prog97,"mvMatrix");
var prMatLoc97 = gl.getUniformLocation(prog97,"prMatrix");
var textScaleLoc97 = gl.getUniformLocation(prog97,"textScale");
// ****** text object 98 ******
var prog98  = gl.createProgram();
gl.attachShader(prog98, getShader( gl, "testglvshader98" ));
gl.attachShader(prog98, getShader( gl, "testglfshader98" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog98, 0, "aPos");
gl.bindAttribLocation(prog98, 1, "aCol");
gl.linkProgram(prog98);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX98 = texinfo.canvasX;
var canvasY98 = texinfo.canvasY;
var ofsLoc98 = gl.getAttribLocation(prog98, "aOfs");
var texture98 = gl.createTexture();
var texLoc98 = gl.getAttribLocation(prog98, "aTexcoord");
var sampler98 = gl.getUniformLocation(prog98,"uSampler");
handleLoadedTexture(texture98, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.113238, 0.1387811, -7.104407, 0, -0.5, 0.5, 0.5,
-4.113238, 0.1387811, -7.104407, 1, -0.5, 0.5, 0.5,
-4.113238, 0.1387811, -7.104407, 1, 1.5, 0.5, 0.5,
-4.113238, 0.1387811, -7.104407, 0, 1.5, 0.5, 0.5
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
var buf98 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf98);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf98 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf98);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc98 = gl.getUniformLocation(prog98,"mvMatrix");
var prMatLoc98 = gl.getUniformLocation(prog98,"prMatrix");
var textScaleLoc98 = gl.getUniformLocation(prog98,"textScale");
// ****** text object 99 ******
var prog99  = gl.createProgram();
gl.attachShader(prog99, getShader( gl, "testglvshader99" ));
gl.attachShader(prog99, getShader( gl, "testglfshader99" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog99, 0, "aPos");
gl.bindAttribLocation(prog99, 1, "aCol");
gl.linkProgram(prog99);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX99 = texinfo.canvasX;
var canvasY99 = texinfo.canvasY;
var ofsLoc99 = gl.getAttribLocation(prog99, "aOfs");
var texture99 = gl.createTexture();
var texLoc99 = gl.getAttribLocation(prog99, "aTexcoord");
var sampler99 = gl.getUniformLocation(prog99,"uSampler");
handleLoadedTexture(texture99, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.113238, -3.646801, -0.08214235, 0, -0.5, 0.5, 0.5,
-4.113238, -3.646801, -0.08214235, 1, -0.5, 0.5, 0.5,
-4.113238, -3.646801, -0.08214235, 1, 1.5, 0.5, 0.5,
-4.113238, -3.646801, -0.08214235, 0, 1.5, 0.5, 0.5
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
var buf99 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf99);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf99 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf99);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc99 = gl.getUniformLocation(prog99,"mvMatrix");
var prMatLoc99 = gl.getUniformLocation(prog99,"prMatrix");
var textScaleLoc99 = gl.getUniformLocation(prog99,"textScale");
// ****** lines object 100 ******
var prog100  = gl.createProgram();
gl.attachShader(prog100, getShader( gl, "testglvshader100" ));
gl.attachShader(prog100, getShader( gl, "testglfshader100" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog100, 0, "aPos");
gl.bindAttribLocation(prog100, 1, "aCol");
gl.linkProgram(prog100);
var v=new Float32Array([
-3, -2.773205, -5.483884,
3, -2.773205, -5.483884,
-3, -2.773205, -5.483884,
-3, -2.918804, -5.753971,
-2, -2.773205, -5.483884,
-2, -2.918804, -5.753971,
-1, -2.773205, -5.483884,
-1, -2.918804, -5.753971,
0, -2.773205, -5.483884,
0, -2.918804, -5.753971,
1, -2.773205, -5.483884,
1, -2.918804, -5.753971,
2, -2.773205, -5.483884,
2, -2.918804, -5.753971,
3, -2.773205, -5.483884,
3, -2.918804, -5.753971
]);
var buf100 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf100);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc100 = gl.getUniformLocation(prog100,"mvMatrix");
var prMatLoc100 = gl.getUniformLocation(prog100,"prMatrix");
// ****** text object 101 ******
var prog101  = gl.createProgram();
gl.attachShader(prog101, getShader( gl, "testglvshader101" ));
gl.attachShader(prog101, getShader( gl, "testglfshader101" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog101, 0, "aPos");
gl.bindAttribLocation(prog101, 1, "aCol");
gl.linkProgram(prog101);
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
var canvasX101 = texinfo.canvasX;
var canvasY101 = texinfo.canvasY;
var ofsLoc101 = gl.getAttribLocation(prog101, "aOfs");
var texture101 = gl.createTexture();
var texLoc101 = gl.getAttribLocation(prog101, "aTexcoord");
var sampler101 = gl.getUniformLocation(prog101,"uSampler");
handleLoadedTexture(texture101, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
-3, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
-3, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
-3, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
-2, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
-2, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
-2, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
-2, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
-1, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
-1, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
-1, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
-1, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
0, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
0, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
0, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
0, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
1, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
1, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
1, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
1, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
2, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
2, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
2, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
2, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5,
3, -3.210003, -6.294146, 0, -0.5, 0.5, 0.5,
3, -3.210003, -6.294146, 1, -0.5, 0.5, 0.5,
3, -3.210003, -6.294146, 1, 1.5, 0.5, 0.5,
3, -3.210003, -6.294146, 0, 1.5, 0.5, 0.5
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
var buf101 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf101);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf101 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf101);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc101 = gl.getUniformLocation(prog101,"mvMatrix");
var prMatLoc101 = gl.getUniformLocation(prog101,"prMatrix");
var textScaleLoc101 = gl.getUniformLocation(prog101,"textScale");
// ****** lines object 102 ******
var prog102  = gl.createProgram();
gl.attachShader(prog102, getShader( gl, "testglvshader102" ));
gl.attachShader(prog102, getShader( gl, "testglfshader102" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog102, 0, "aPos");
gl.bindAttribLocation(prog102, 1, "aCol");
gl.linkProgram(prog102);
var v=new Float32Array([
-3.169292, -2, -5.483884,
-3.169292, 2, -5.483884,
-3.169292, -2, -5.483884,
-3.326616, -2, -5.753971,
-3.169292, -1, -5.483884,
-3.326616, -1, -5.753971,
-3.169292, 0, -5.483884,
-3.326616, 0, -5.753971,
-3.169292, 1, -5.483884,
-3.326616, 1, -5.753971,
-3.169292, 2, -5.483884,
-3.326616, 2, -5.753971
]);
var buf102 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf102);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc102 = gl.getUniformLocation(prog102,"mvMatrix");
var prMatLoc102 = gl.getUniformLocation(prog102,"prMatrix");
// ****** text object 103 ******
var prog103  = gl.createProgram();
gl.attachShader(prog103, getShader( gl, "testglvshader103" ));
gl.attachShader(prog103, getShader( gl, "testglfshader103" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog103, 0, "aPos");
gl.bindAttribLocation(prog103, 1, "aCol");
gl.linkProgram(prog103);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX103 = texinfo.canvasX;
var canvasY103 = texinfo.canvasY;
var ofsLoc103 = gl.getAttribLocation(prog103, "aOfs");
var texture103 = gl.createTexture();
var texLoc103 = gl.getAttribLocation(prog103, "aTexcoord");
var sampler103 = gl.getUniformLocation(prog103,"uSampler");
handleLoadedTexture(texture103, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.641265, -2, -6.294146, 0, -0.5, 0.5, 0.5,
-3.641265, -2, -6.294146, 1, -0.5, 0.5, 0.5,
-3.641265, -2, -6.294146, 1, 1.5, 0.5, 0.5,
-3.641265, -2, -6.294146, 0, 1.5, 0.5, 0.5,
-3.641265, -1, -6.294146, 0, -0.5, 0.5, 0.5,
-3.641265, -1, -6.294146, 1, -0.5, 0.5, 0.5,
-3.641265, -1, -6.294146, 1, 1.5, 0.5, 0.5,
-3.641265, -1, -6.294146, 0, 1.5, 0.5, 0.5,
-3.641265, 0, -6.294146, 0, -0.5, 0.5, 0.5,
-3.641265, 0, -6.294146, 1, -0.5, 0.5, 0.5,
-3.641265, 0, -6.294146, 1, 1.5, 0.5, 0.5,
-3.641265, 0, -6.294146, 0, 1.5, 0.5, 0.5,
-3.641265, 1, -6.294146, 0, -0.5, 0.5, 0.5,
-3.641265, 1, -6.294146, 1, -0.5, 0.5, 0.5,
-3.641265, 1, -6.294146, 1, 1.5, 0.5, 0.5,
-3.641265, 1, -6.294146, 0, 1.5, 0.5, 0.5,
-3.641265, 2, -6.294146, 0, -0.5, 0.5, 0.5,
-3.641265, 2, -6.294146, 1, -0.5, 0.5, 0.5,
-3.641265, 2, -6.294146, 1, 1.5, 0.5, 0.5,
-3.641265, 2, -6.294146, 0, 1.5, 0.5, 0.5
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
var buf103 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf103);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf103 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf103);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc103 = gl.getUniformLocation(prog103,"mvMatrix");
var prMatLoc103 = gl.getUniformLocation(prog103,"prMatrix");
var textScaleLoc103 = gl.getUniformLocation(prog103,"textScale");
// ****** lines object 104 ******
var prog104  = gl.createProgram();
gl.attachShader(prog104, getShader( gl, "testglvshader104" ));
gl.attachShader(prog104, getShader( gl, "testglfshader104" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog104, 0, "aPos");
gl.bindAttribLocation(prog104, 1, "aCol");
gl.linkProgram(prog104);
var v=new Float32Array([
-3.169292, -2.773205, -4,
-3.169292, -2.773205, 4,
-3.169292, -2.773205, -4,
-3.326616, -2.918804, -4,
-3.169292, -2.773205, -2,
-3.326616, -2.918804, -2,
-3.169292, -2.773205, 0,
-3.326616, -2.918804, 0,
-3.169292, -2.773205, 2,
-3.326616, -2.918804, 2,
-3.169292, -2.773205, 4,
-3.326616, -2.918804, 4
]);
var buf104 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf104);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc104 = gl.getUniformLocation(prog104,"mvMatrix");
var prMatLoc104 = gl.getUniformLocation(prog104,"prMatrix");
// ****** text object 105 ******
var prog105  = gl.createProgram();
gl.attachShader(prog105, getShader( gl, "testglvshader105" ));
gl.attachShader(prog105, getShader( gl, "testglfshader105" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog105, 0, "aPos");
gl.bindAttribLocation(prog105, 1, "aCol");
gl.linkProgram(prog105);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX105 = texinfo.canvasX;
var canvasY105 = texinfo.canvasY;
var ofsLoc105 = gl.getAttribLocation(prog105, "aOfs");
var texture105 = gl.createTexture();
var texLoc105 = gl.getAttribLocation(prog105, "aTexcoord");
var sampler105 = gl.getUniformLocation(prog105,"uSampler");
handleLoadedTexture(texture105, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.641265, -3.210003, -4, 0, -0.5, 0.5, 0.5,
-3.641265, -3.210003, -4, 1, -0.5, 0.5, 0.5,
-3.641265, -3.210003, -4, 1, 1.5, 0.5, 0.5,
-3.641265, -3.210003, -4, 0, 1.5, 0.5, 0.5,
-3.641265, -3.210003, -2, 0, -0.5, 0.5, 0.5,
-3.641265, -3.210003, -2, 1, -0.5, 0.5, 0.5,
-3.641265, -3.210003, -2, 1, 1.5, 0.5, 0.5,
-3.641265, -3.210003, -2, 0, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 0, 0, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 0, 1, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 0, 1, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 0, 0, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 2, 0, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 2, 1, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 2, 1, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 2, 0, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 4, 0, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 4, 1, -0.5, 0.5, 0.5,
-3.641265, -3.210003, 4, 1, 1.5, 0.5, 0.5,
-3.641265, -3.210003, 4, 0, 1.5, 0.5, 0.5
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
var buf105 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf105);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf105 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf105);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc105 = gl.getUniformLocation(prog105,"mvMatrix");
var prMatLoc105 = gl.getUniformLocation(prog105,"prMatrix");
var textScaleLoc105 = gl.getUniformLocation(prog105,"textScale");
// ****** lines object 106 ******
var prog106  = gl.createProgram();
gl.attachShader(prog106, getShader( gl, "testglvshader106" ));
gl.attachShader(prog106, getShader( gl, "testglfshader106" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog106, 0, "aPos");
gl.bindAttribLocation(prog106, 1, "aCol");
gl.linkProgram(prog106);
var v=new Float32Array([
-3.169292, -2.773205, -5.483884,
-3.169292, 3.050767, -5.483884,
-3.169292, -2.773205, 5.3196,
-3.169292, 3.050767, 5.3196,
-3.169292, -2.773205, -5.483884,
-3.169292, -2.773205, 5.3196,
-3.169292, 3.050767, -5.483884,
-3.169292, 3.050767, 5.3196,
-3.169292, -2.773205, -5.483884,
3.123683, -2.773205, -5.483884,
-3.169292, -2.773205, 5.3196,
3.123683, -2.773205, 5.3196,
-3.169292, 3.050767, -5.483884,
3.123683, 3.050767, -5.483884,
-3.169292, 3.050767, 5.3196,
3.123683, 3.050767, 5.3196,
3.123683, -2.773205, -5.483884,
3.123683, 3.050767, -5.483884,
3.123683, -2.773205, 5.3196,
3.123683, 3.050767, 5.3196,
3.123683, -2.773205, -5.483884,
3.123683, -2.773205, 5.3196,
3.123683, 3.050767, -5.483884,
3.123683, 3.050767, 5.3196
]);
var buf106 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf106);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc106 = gl.getUniformLocation(prog106,"mvMatrix");
var prMatLoc106 = gl.getUniformLocation(prog106,"prMatrix");
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
// ***** subscene 88 ****
gl.viewport(0, 0, 1280, 992);
gl.scissor(0, 0, 1280, 992);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.364974;
var distance = 32.7676;
var t = tan(fov[88]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1.290323;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[88], hlen*aspect*zoom[88], 
-hlen*zoom[88], hlen*zoom[88], near, far);
else  
prMatrix.frustum(-hlen*zoom[88], hlen*zoom[88], 
-hlen*zoom[88]/aspect, hlen*zoom[88]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.02280426, -0.1387811, 0.08214235 );
mvMatrix.scale( 1.265404, 1.367306, 0.7370913 );   
mvMatrix.multRight( userMatrix[88] );
mvMatrix.translate(-0, -0, -32.7676);
// ****** points object 95 *******
gl.useProgram(prog95);
gl.bindBuffer(gl.ARRAY_BUFFER, buf95);
gl.uniformMatrix4fv( prMatLoc95, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc95, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 97 *******
gl.useProgram(prog97);
gl.bindBuffer(gl.ARRAY_BUFFER, buf97);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf97);
gl.uniformMatrix4fv( prMatLoc97, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc97, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc97, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc97 );
gl.vertexAttribPointer(texLoc97, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture97);
gl.uniform1i( sampler97, 0);
gl.enableVertexAttribArray( ofsLoc97 );
gl.vertexAttribPointer(ofsLoc97, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 98 *******
gl.useProgram(prog98);
gl.bindBuffer(gl.ARRAY_BUFFER, buf98);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf98);
gl.uniformMatrix4fv( prMatLoc98, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc98, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc98, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc98 );
gl.vertexAttribPointer(texLoc98, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture98);
gl.uniform1i( sampler98, 0);
gl.enableVertexAttribArray( ofsLoc98 );
gl.vertexAttribPointer(ofsLoc98, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 99 *******
gl.useProgram(prog99);
gl.bindBuffer(gl.ARRAY_BUFFER, buf99);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf99);
gl.uniformMatrix4fv( prMatLoc99, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc99, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc99, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc99 );
gl.vertexAttribPointer(texLoc99, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture99);
gl.uniform1i( sampler99, 0);
gl.enableVertexAttribArray( ofsLoc99 );
gl.vertexAttribPointer(ofsLoc99, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 100 *******
gl.useProgram(prog100);
gl.bindBuffer(gl.ARRAY_BUFFER, buf100);
gl.uniformMatrix4fv( prMatLoc100, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc100, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 101 *******
gl.useProgram(prog101);
gl.bindBuffer(gl.ARRAY_BUFFER, buf101);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf101);
gl.uniformMatrix4fv( prMatLoc101, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc101, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc101, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc101 );
gl.vertexAttribPointer(texLoc101, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture101);
gl.uniform1i( sampler101, 0);
gl.enableVertexAttribArray( ofsLoc101 );
gl.vertexAttribPointer(ofsLoc101, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 102 *******
gl.useProgram(prog102);
gl.bindBuffer(gl.ARRAY_BUFFER, buf102);
gl.uniformMatrix4fv( prMatLoc102, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc102, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 103 *******
gl.useProgram(prog103);
gl.bindBuffer(gl.ARRAY_BUFFER, buf103);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf103);
gl.uniformMatrix4fv( prMatLoc103, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc103, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc103, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc103 );
gl.vertexAttribPointer(texLoc103, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture103);
gl.uniform1i( sampler103, 0);
gl.enableVertexAttribArray( ofsLoc103 );
gl.vertexAttribPointer(ofsLoc103, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 104 *******
gl.useProgram(prog104);
gl.bindBuffer(gl.ARRAY_BUFFER, buf104);
gl.uniformMatrix4fv( prMatLoc104, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc104, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 105 *******
gl.useProgram(prog105);
gl.bindBuffer(gl.ARRAY_BUFFER, buf105);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf105);
gl.uniformMatrix4fv( prMatLoc105, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc105, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc105, 0.0005859375, 0.0007560484);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc105 );
gl.vertexAttribPointer(texLoc105, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture105);
gl.uniform1i( sampler105, 0);
gl.enableVertexAttribArray( ofsLoc105 );
gl.vertexAttribPointer(ofsLoc105, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 106 *******
gl.useProgram(prog106);
gl.bindBuffer(gl.ARRAY_BUFFER, buf106);
gl.uniformMatrix4fv( prMatLoc106, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc106, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
88: 0
};
var vpy0 = {
88: 0
};
var vpWidths = {
88: 1280
};
var vpHeights = {
88: 992
};
var activeModel = {
88: 88
};
var activeProjection = {
88: 88
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 1280 && 0 <= coords.y && coords.y <= 992) return(88);
return(88);
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
##   8
```

```r
data<-read.table("data.xyz")
x<-data$V2
y<-data$V3
z<-data$V4
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 113 ****** -->
<script id="testgl2vshader113" type="x-shader/x-vertex">
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
<script id="testgl2fshader113" type="x-shader/x-fragment"> 
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
var activeSubscene = 107;
zoom[107] = 1;
fov[107] = 30;
userMatrix[107] = new CanvasMatrix4();
userMatrix[107].load([
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
// ****** spheres object 113 ******
var prog113  = gl.createProgram();
gl.attachShader(prog113, getShader( gl, "testgl2vshader113" ));
gl.attachShader(prog113, getShader( gl, "testgl2fshader113" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog113, 0, "aPos");
gl.bindAttribLocation(prog113, 1, "aCol");
gl.linkProgram(prog113);
var v=new Float32Array([
-1.4425, 3.8203, -0.1067, 0, 0, 1, 1, 1,
2.1604, 0.4365, 0.1057, 1, 0, 0, 1, 1,
-2.2867, -1.0529, 0.0325, 1, 0, 0, 1, 1,
-0.0528, -0.3391, 0.0703, 1, 0, 0, 1, 1,
0.4264, 2.0113, 0.0066, 1, 0, 0, 1, 1,
-1.8486, 1.2493, -0.0308, 1, 0, 0, 1, 1,
2.7052, -0.9026, 0.166, 0, 0, 0, 1, 1,
4.1224, -0.8435, 0.7203, 0, 0, 0, 1, 1,
2.6783, -1.5257, -1.2236, 0, 0, 0, 1, 1,
0.8047, 0.7107, 0.0596, 0, 0, 0, 1, 1,
-1.9029, -2.4287, 0.0879, 0, 0, 0, 1, 1,
-1.3503, 0.0036, 0.0237, 0, 0, 0, 1, 1,
-3.1117, -3.341, 0.1242, 0, 0, 0, 1, 1,
-0.902, 2.2018, -0.0358, 1, 1, 1, 1, 1,
2.1146, -1.5229, 0.852, 1, 1, 1, 1, 1,
2.7907, 1.2284, 0.0472, 1, 1, 1, 1, 1,
4.5538, -1.847, 0.7977, 1, 1, 1, 1, 1,
4.7777, -0.2407, 0.0813, 1, 1, 1, 1, 1,
4.1314, -0.3935, 1.7193, 1, 1, 1, 1, 1,
1.6576, -1.6165, -1.609, 1, 1, 1, 1, 1,
3.1148, -2.5299, -1.206, 1, 1, 1, 1, 1,
3.2474, -0.923, -1.9406, 1, 1, 1, 1, 1,
-1.2931, -2.6856, -0.7864, 1, 1, 1, 1, 1,
-1.2967, -2.6169, 0.982, 1, 1, 1, 1, 1,
-3.2653, -0.7918, -0.006, 1, 1, 1, 1, 1,
-3.7347, -3.1326, 1.0005, 1, 1, 1, 1, 1,
-3.7333, -3.2048, -0.7672, 1, 1, 1, 1, 1,
-2.8002, -4.3892, 0.1671, 1, 1, 1, 1, 1
]);
var values113 = v;
var normLoc113 = gl.getAttribLocation(prog113, "aNorm");
var mvMatLoc113 = gl.getUniformLocation(prog113,"mvMatrix");
var prMatLoc113 = gl.getUniformLocation(prog113,"prMatrix");
var normMatLoc113 = gl.getUniformLocation(prog113,"normMatrix");
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
// ***** subscene 107 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.640059;
var distance = 30.34784;
var t = tan(fov[107]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[107], hlen*aspect*zoom[107], 
-hlen*zoom[107], hlen*zoom[107], near, far);
else  
prMatrix.frustum(-hlen*zoom[107], hlen*zoom[107], 
-hlen*zoom[107]/aspect, hlen*zoom[107]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.5214999, 0.2844501, 0.1106499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[107] );
mvMatrix.translate(-0, -0, -30.34784);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[107] );
// ****** spheres object 113 *******
gl.useProgram(prog113);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc113, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc113, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc113, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc113 );
gl.vertexAttribPointer(normLoc113,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc113, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 28; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values113[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values113[baseofs], 
values113[baseofs+1], 
values113[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc113, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values113[ofs], 
values113[ofs+1], 
values113[ofs+2],
values113[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
107: 0
};
var vpy0 = {
107: 0
};
var vpWidths = {
107: 504
};
var vpHeights = {
107: 504
};
var activeModel = {
107: 107
};
var activeProjection = {
107: 107
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(107);
return(107);
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