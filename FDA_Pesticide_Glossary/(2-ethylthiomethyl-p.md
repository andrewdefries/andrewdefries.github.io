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
-3.540338, 0.1796388, -3.334001, 1, 0, 0, 1,
-3.381375, 0.4282947, -2.895964, 1, 0.007843138, 0, 1,
-3.205559, -0.3988525, -3.897193, 1, 0.01176471, 0, 1,
-3.119135, 1.607634, -1.731129, 1, 0.01960784, 0, 1,
-2.810305, 0.2739167, -1.729067, 1, 0.02352941, 0, 1,
-2.734762, -0.449331, -1.819988, 1, 0.03137255, 0, 1,
-2.665, -1.290147, -1.468302, 1, 0.03529412, 0, 1,
-2.651969, -0.2559749, -2.922218, 1, 0.04313726, 0, 1,
-2.582629, -1.391515, -1.980725, 1, 0.04705882, 0, 1,
-2.535583, 0.1475912, -2.520496, 1, 0.05490196, 0, 1,
-2.532483, 0.4801037, -1.530608, 1, 0.05882353, 0, 1,
-2.496583, 0.02703374, 0.5052226, 1, 0.06666667, 0, 1,
-2.470279, -0.4834792, -1.4784, 1, 0.07058824, 0, 1,
-2.344532, -0.1663982, -1.920474, 1, 0.07843138, 0, 1,
-2.319355, 0.9244326, -1.944876, 1, 0.08235294, 0, 1,
-2.312427, 1.044538, -1.359546, 1, 0.09019608, 0, 1,
-2.311495, -0.2490489, -0.4415909, 1, 0.09411765, 0, 1,
-2.296557, -1.729568, -2.627264, 1, 0.1019608, 0, 1,
-2.224026, -1.079265, -2.541384, 1, 0.1098039, 0, 1,
-2.215704, 0.1092316, -0.9656029, 1, 0.1137255, 0, 1,
-2.208051, 0.1034067, -1.45453, 1, 0.1215686, 0, 1,
-2.201304, 0.9497924, -0.4315124, 1, 0.1254902, 0, 1,
-2.196751, 0.3930591, -2.519681, 1, 0.1333333, 0, 1,
-2.147098, -0.01244481, -2.663624, 1, 0.1372549, 0, 1,
-2.127987, -0.4080427, 0.149648, 1, 0.145098, 0, 1,
-2.117913, 0.3130409, -1.445813, 1, 0.1490196, 0, 1,
-2.109827, -0.7695501, -0.6269068, 1, 0.1568628, 0, 1,
-2.10928, -0.5007095, -2.073534, 1, 0.1607843, 0, 1,
-2.08453, 0.9183303, -2.031317, 1, 0.1686275, 0, 1,
-2.071598, 0.5968515, -1.388014, 1, 0.172549, 0, 1,
-2.038806, -0.3664084, -1.856144, 1, 0.1803922, 0, 1,
-2.013482, 0.09483202, -1.100412, 1, 0.1843137, 0, 1,
-1.970007, -1.021628, -3.377792, 1, 0.1921569, 0, 1,
-1.967795, -0.1276418, -2.587369, 1, 0.1960784, 0, 1,
-1.957893, -0.1188194, -2.979532, 1, 0.2039216, 0, 1,
-1.953776, 0.8909576, -0.9639884, 1, 0.2117647, 0, 1,
-1.908835, -0.7524911, -1.269475, 1, 0.2156863, 0, 1,
-1.870763, -1.068793, -2.192952, 1, 0.2235294, 0, 1,
-1.821882, -0.01518382, -1.918314, 1, 0.227451, 0, 1,
-1.819411, 1.215273, -1.473061, 1, 0.2352941, 0, 1,
-1.801186, -0.4181771, -1.512967, 1, 0.2392157, 0, 1,
-1.759892, 0.05131277, -2.193044, 1, 0.2470588, 0, 1,
-1.751109, -1.259798, -3.384384, 1, 0.2509804, 0, 1,
-1.746361, 0.2348994, -1.98575, 1, 0.2588235, 0, 1,
-1.743079, 0.864273, -0.3929401, 1, 0.2627451, 0, 1,
-1.74029, 0.2161559, -2.406208, 1, 0.2705882, 0, 1,
-1.722661, 0.1774523, -0.784759, 1, 0.2745098, 0, 1,
-1.704284, -1.188866, -1.422428, 1, 0.282353, 0, 1,
-1.6999, -1.712591, -1.892586, 1, 0.2862745, 0, 1,
-1.692267, -0.1271694, -0.8026726, 1, 0.2941177, 0, 1,
-1.688445, 1.583484, 1.842612, 1, 0.3019608, 0, 1,
-1.668903, -0.02673972, -0.5302612, 1, 0.3058824, 0, 1,
-1.660576, 1.652194, -0.1074693, 1, 0.3137255, 0, 1,
-1.656951, 1.041243, 0.5785899, 1, 0.3176471, 0, 1,
-1.652953, -0.3117134, -0.8498662, 1, 0.3254902, 0, 1,
-1.636703, 0.3727179, -1.87974, 1, 0.3294118, 0, 1,
-1.63205, -0.8584507, 0.1587236, 1, 0.3372549, 0, 1,
-1.626475, 2.115464, 0.2380877, 1, 0.3411765, 0, 1,
-1.624413, 1.707017, -0.3393899, 1, 0.3490196, 0, 1,
-1.612933, 0.8335589, -0.8221367, 1, 0.3529412, 0, 1,
-1.579831, 0.2787675, -3.524617, 1, 0.3607843, 0, 1,
-1.564468, -1.127304, -2.914986, 1, 0.3647059, 0, 1,
-1.558367, -0.08079697, -1.080075, 1, 0.372549, 0, 1,
-1.534896, -0.573392, -2.168005, 1, 0.3764706, 0, 1,
-1.529622, -1.058375, -1.799805, 1, 0.3843137, 0, 1,
-1.525352, 2.508824, -0.9712382, 1, 0.3882353, 0, 1,
-1.522698, -0.7644857, -3.966296, 1, 0.3960784, 0, 1,
-1.522566, 0.2157111, -1.43452, 1, 0.4039216, 0, 1,
-1.51144, -1.127578, -0.9818965, 1, 0.4078431, 0, 1,
-1.499961, 0.03276585, -1.671429, 1, 0.4156863, 0, 1,
-1.478638, -0.1294555, 0.2546082, 1, 0.4196078, 0, 1,
-1.461538, 1.029467, 0.5656585, 1, 0.427451, 0, 1,
-1.460789, -0.6405534, -0.5264007, 1, 0.4313726, 0, 1,
-1.448263, -0.5778041, -1.731218, 1, 0.4392157, 0, 1,
-1.447499, -2.052404, -0.9263659, 1, 0.4431373, 0, 1,
-1.435219, 1.123462, -1.014294, 1, 0.4509804, 0, 1,
-1.421342, 0.09972303, -3.721558, 1, 0.454902, 0, 1,
-1.419109, -0.5570347, -2.573716, 1, 0.4627451, 0, 1,
-1.405569, 0.07897444, -2.475427, 1, 0.4666667, 0, 1,
-1.400818, -0.7410677, -2.165215, 1, 0.4745098, 0, 1,
-1.391069, 1.2504, 0.9281133, 1, 0.4784314, 0, 1,
-1.379616, 0.3610837, -0.791418, 1, 0.4862745, 0, 1,
-1.374593, 1.198094, -2.047899, 1, 0.4901961, 0, 1,
-1.365887, -1.375301, -4.191285, 1, 0.4980392, 0, 1,
-1.364012, 0.9832584, -0.996534, 1, 0.5058824, 0, 1,
-1.363851, -0.2223295, -1.112474, 1, 0.509804, 0, 1,
-1.354295, -0.951559, -2.831582, 1, 0.5176471, 0, 1,
-1.34538, 0.1977392, -0.8865233, 1, 0.5215687, 0, 1,
-1.339321, 0.9199538, 0.5067257, 1, 0.5294118, 0, 1,
-1.339152, -0.9578979, -2.443741, 1, 0.5333334, 0, 1,
-1.337773, -0.7506325, -1.517545, 1, 0.5411765, 0, 1,
-1.325073, 0.2071563, -1.602656, 1, 0.5450981, 0, 1,
-1.315776, -0.7722934, -2.36055, 1, 0.5529412, 0, 1,
-1.311161, -0.5422076, -2.070871, 1, 0.5568628, 0, 1,
-1.304155, 2.668185, -0.6346137, 1, 0.5647059, 0, 1,
-1.300883, -0.916122, -2.537241, 1, 0.5686275, 0, 1,
-1.300618, 0.4313427, -0.241813, 1, 0.5764706, 0, 1,
-1.297259, 0.2491998, -2.093878, 1, 0.5803922, 0, 1,
-1.29433, 0.9183468, -1.348381, 1, 0.5882353, 0, 1,
-1.293562, 1.143069, -0.2844399, 1, 0.5921569, 0, 1,
-1.286757, -0.9291701, -2.701837, 1, 0.6, 0, 1,
-1.271637, -0.5547524, -2.608667, 1, 0.6078432, 0, 1,
-1.250746, -1.500419, -2.721989, 1, 0.6117647, 0, 1,
-1.248951, -0.2153304, -2.292757, 1, 0.6196079, 0, 1,
-1.240959, 1.250875, 1.312655, 1, 0.6235294, 0, 1,
-1.239748, 0.9479809, -1.749782, 1, 0.6313726, 0, 1,
-1.23543, -0.2767167, 0.1470623, 1, 0.6352941, 0, 1,
-1.234575, 0.8232126, -1.39615, 1, 0.6431373, 0, 1,
-1.232924, -0.2073286, -0.2503389, 1, 0.6470588, 0, 1,
-1.230775, -0.01078337, -1.226889, 1, 0.654902, 0, 1,
-1.216091, 0.245081, -1.240764, 1, 0.6588235, 0, 1,
-1.203367, 0.3667024, -0.953579, 1, 0.6666667, 0, 1,
-1.200631, -1.227756, -1.567112, 1, 0.6705883, 0, 1,
-1.197326, 1.507471, -0.3278158, 1, 0.6784314, 0, 1,
-1.193692, -0.1116542, -1.001114, 1, 0.682353, 0, 1,
-1.176005, 1.56669, -0.4450755, 1, 0.6901961, 0, 1,
-1.169624, -0.6610848, -1.168603, 1, 0.6941177, 0, 1,
-1.165456, 0.5283183, -2.329952, 1, 0.7019608, 0, 1,
-1.1654, -0.6237134, -2.89134, 1, 0.7098039, 0, 1,
-1.156975, 0.3401344, -3.1631, 1, 0.7137255, 0, 1,
-1.151479, 1.740421, 0.6804581, 1, 0.7215686, 0, 1,
-1.146182, 0.4632271, -2.417538, 1, 0.7254902, 0, 1,
-1.143883, -0.3289734, -0.4131885, 1, 0.7333333, 0, 1,
-1.14122, -0.3122537, -1.244086, 1, 0.7372549, 0, 1,
-1.140149, -0.7629178, -2.911059, 1, 0.7450981, 0, 1,
-1.140105, -0.3264733, -1.643978, 1, 0.7490196, 0, 1,
-1.124869, 0.5936285, -2.213607, 1, 0.7568628, 0, 1,
-1.124155, 1.894548, -0.1337575, 1, 0.7607843, 0, 1,
-1.119398, -1.245381, -2.670861, 1, 0.7686275, 0, 1,
-1.118085, -1.172065, -2.334384, 1, 0.772549, 0, 1,
-1.116807, -0.9103415, -3.784935, 1, 0.7803922, 0, 1,
-1.110982, -0.1721463, -2.49803, 1, 0.7843137, 0, 1,
-1.109674, -0.8887485, -2.969188, 1, 0.7921569, 0, 1,
-1.10906, -0.3632222, -0.9402383, 1, 0.7960784, 0, 1,
-1.106841, 1.335181, -0.6962677, 1, 0.8039216, 0, 1,
-1.101851, 0.9584454, -1.632645, 1, 0.8117647, 0, 1,
-1.095848, 0.9460596, -0.2956484, 1, 0.8156863, 0, 1,
-1.087207, 0.4217684, -0.8540342, 1, 0.8235294, 0, 1,
-1.0839, -0.9062472, -3.465089, 1, 0.827451, 0, 1,
-1.069216, -0.2666928, -0.6101708, 1, 0.8352941, 0, 1,
-1.067521, -0.6835263, -3.5878, 1, 0.8392157, 0, 1,
-1.06658, -0.4023281, -3.083225, 1, 0.8470588, 0, 1,
-1.06654, -1.210008, -2.663156, 1, 0.8509804, 0, 1,
-1.065246, -2.29208, -2.295665, 1, 0.8588235, 0, 1,
-1.062869, -0.7977819, -3.615177, 1, 0.8627451, 0, 1,
-1.06095, -0.8531088, -1.490245, 1, 0.8705882, 0, 1,
-1.058455, -0.9641001, -1.661329, 1, 0.8745098, 0, 1,
-1.054311, -2.065708, -3.716446, 1, 0.8823529, 0, 1,
-1.052528, 0.9591075, 0.04656365, 1, 0.8862745, 0, 1,
-1.051975, 0.5837158, 0.2023988, 1, 0.8941177, 0, 1,
-1.050605, 0.2436779, -1.150443, 1, 0.8980392, 0, 1,
-1.049818, 0.352339, 0.5128372, 1, 0.9058824, 0, 1,
-1.044098, 0.128266, -1.503953, 1, 0.9137255, 0, 1,
-1.040424, 0.6336273, 0.3666508, 1, 0.9176471, 0, 1,
-1.035342, -0.9610739, -1.965801, 1, 0.9254902, 0, 1,
-1.034357, -0.9710141, -2.244087, 1, 0.9294118, 0, 1,
-1.024713, 1.003833, 0.8204107, 1, 0.9372549, 0, 1,
-1.020033, 0.3457187, -0.9718429, 1, 0.9411765, 0, 1,
-1.01944, 0.3104208, 0.2984475, 1, 0.9490196, 0, 1,
-1.012197, -1.882095, -3.320478, 1, 0.9529412, 0, 1,
-1.009759, 0.3831177, -1.716239, 1, 0.9607843, 0, 1,
-1.00953, -1.841468, -3.579048, 1, 0.9647059, 0, 1,
-1.007653, 1.534743, -0.1192981, 1, 0.972549, 0, 1,
-1.003522, -0.1911419, -1.992187, 1, 0.9764706, 0, 1,
-1.000669, -0.03539522, -2.885049, 1, 0.9843137, 0, 1,
-0.9992889, 0.05781992, -2.718674, 1, 0.9882353, 0, 1,
-0.9966916, 0.2621129, -0.78887, 1, 0.9960784, 0, 1,
-0.9925493, 0.3737769, -0.852796, 0.9960784, 1, 0, 1,
-0.9875381, -0.4330785, -2.204541, 0.9921569, 1, 0, 1,
-0.9848545, 1.269041, -1.107611, 0.9843137, 1, 0, 1,
-0.9818997, 0.2889033, -0.8680755, 0.9803922, 1, 0, 1,
-0.9810955, 0.7814943, 0.5331424, 0.972549, 1, 0, 1,
-0.9801677, 1.036466, -1.431508, 0.9686275, 1, 0, 1,
-0.9781741, -0.179445, -3.121577, 0.9607843, 1, 0, 1,
-0.9777001, -1.28792, -2.473289, 0.9568627, 1, 0, 1,
-0.9772784, 0.6753152, -0.04534722, 0.9490196, 1, 0, 1,
-0.9748584, 0.5191302, -2.857946, 0.945098, 1, 0, 1,
-0.9684415, -1.549055, -2.514221, 0.9372549, 1, 0, 1,
-0.9641499, -2.838625, -1.7616, 0.9333333, 1, 0, 1,
-0.9619444, -0.2566408, -2.6387, 0.9254902, 1, 0, 1,
-0.9613892, -1.720532, -2.069902, 0.9215686, 1, 0, 1,
-0.9603302, -0.1354668, -1.858672, 0.9137255, 1, 0, 1,
-0.9582554, -0.7624022, -1.824613, 0.9098039, 1, 0, 1,
-0.9534749, -0.5549784, -1.986794, 0.9019608, 1, 0, 1,
-0.9490561, -0.3221285, -2.044915, 0.8941177, 1, 0, 1,
-0.9486175, -0.5614462, -1.228156, 0.8901961, 1, 0, 1,
-0.9438533, -1.13531, -0.9489396, 0.8823529, 1, 0, 1,
-0.9404004, -1.338534, -2.231171, 0.8784314, 1, 0, 1,
-0.9357232, 0.5240194, 0.1141095, 0.8705882, 1, 0, 1,
-0.9289964, 0.711691, -0.3317846, 0.8666667, 1, 0, 1,
-0.9274192, 0.6838458, -0.7361102, 0.8588235, 1, 0, 1,
-0.9235982, -0.647765, -1.881582, 0.854902, 1, 0, 1,
-0.918045, 0.4473206, -1.378392, 0.8470588, 1, 0, 1,
-0.9176514, -1.297097, -2.614226, 0.8431373, 1, 0, 1,
-0.9143191, 0.8197105, -1.484328, 0.8352941, 1, 0, 1,
-0.9106858, 0.5529528, -1.698169, 0.8313726, 1, 0, 1,
-0.9084439, -1.848809, -1.685855, 0.8235294, 1, 0, 1,
-0.9019638, 0.6036233, -2.074877, 0.8196079, 1, 0, 1,
-0.8944978, 2.423917, -0.586483, 0.8117647, 1, 0, 1,
-0.8917393, 0.4335338, -1.685781, 0.8078431, 1, 0, 1,
-0.8900332, 1.049873, -2.112142, 0.8, 1, 0, 1,
-0.8843416, 0.08125242, 0.1881451, 0.7921569, 1, 0, 1,
-0.8783053, -0.8805941, -2.685916, 0.7882353, 1, 0, 1,
-0.8779289, -0.6776989, -1.507174, 0.7803922, 1, 0, 1,
-0.8739368, -0.7104384, -3.334806, 0.7764706, 1, 0, 1,
-0.8618312, -1.060929, -2.995817, 0.7686275, 1, 0, 1,
-0.8571534, -0.7685788, -1.965793, 0.7647059, 1, 0, 1,
-0.855794, 1.438967, 0.3729812, 0.7568628, 1, 0, 1,
-0.8486094, 0.3499208, -1.263357, 0.7529412, 1, 0, 1,
-0.8470311, 0.2392198, -2.283761, 0.7450981, 1, 0, 1,
-0.8435445, 0.9734979, -3.743101, 0.7411765, 1, 0, 1,
-0.8356494, 1.291215, -2.14669, 0.7333333, 1, 0, 1,
-0.833155, 0.818864, -0.4701514, 0.7294118, 1, 0, 1,
-0.8307878, 1.087443, -0.4461156, 0.7215686, 1, 0, 1,
-0.8263464, 0.6923495, -0.4603539, 0.7176471, 1, 0, 1,
-0.8228215, -0.06490235, -1.78945, 0.7098039, 1, 0, 1,
-0.8129886, 0.1484854, -2.298202, 0.7058824, 1, 0, 1,
-0.8116195, 0.8659558, -0.9301321, 0.6980392, 1, 0, 1,
-0.8094468, -1.115476, -3.285049, 0.6901961, 1, 0, 1,
-0.8053604, -1.071158, -3.412877, 0.6862745, 1, 0, 1,
-0.7987242, -0.2475526, -1.486667, 0.6784314, 1, 0, 1,
-0.7973728, 0.1645526, -0.4194476, 0.6745098, 1, 0, 1,
-0.7964468, -0.6102489, -2.663052, 0.6666667, 1, 0, 1,
-0.7956977, 2.229728, -1.873511, 0.6627451, 1, 0, 1,
-0.7928544, -0.4259409, -1.735233, 0.654902, 1, 0, 1,
-0.7878472, -1.158603, -3.482599, 0.6509804, 1, 0, 1,
-0.7855646, 0.8533615, -0.04987844, 0.6431373, 1, 0, 1,
-0.7847374, 0.556712, -0.4190808, 0.6392157, 1, 0, 1,
-0.784003, 0.8094155, -1.245238, 0.6313726, 1, 0, 1,
-0.7721819, 1.216574, 0.6941881, 0.627451, 1, 0, 1,
-0.7688754, -0.4024929, -3.573647, 0.6196079, 1, 0, 1,
-0.7661976, 1.168796, -0.9057311, 0.6156863, 1, 0, 1,
-0.7642435, 0.3017816, -1.435984, 0.6078432, 1, 0, 1,
-0.7592945, 0.3673534, -1.749994, 0.6039216, 1, 0, 1,
-0.7523435, -0.3732409, -2.379773, 0.5960785, 1, 0, 1,
-0.7447979, 1.154071, -0.1973105, 0.5882353, 1, 0, 1,
-0.739879, -0.3292314, -2.243944, 0.5843138, 1, 0, 1,
-0.7350493, 1.259008, -0.6422501, 0.5764706, 1, 0, 1,
-0.7340452, -0.9492239, -2.837256, 0.572549, 1, 0, 1,
-0.7287346, -0.5988616, -1.889444, 0.5647059, 1, 0, 1,
-0.7235963, -1.117451, -3.943414, 0.5607843, 1, 0, 1,
-0.7233477, -0.6599238, 0.6019765, 0.5529412, 1, 0, 1,
-0.7145421, 0.2414745, -0.2043636, 0.5490196, 1, 0, 1,
-0.7142959, 0.8187289, -0.9466051, 0.5411765, 1, 0, 1,
-0.7135182, 0.08963948, -2.280413, 0.5372549, 1, 0, 1,
-0.7059562, -0.1983617, -0.7091214, 0.5294118, 1, 0, 1,
-0.696878, -2.420034, -0.8462225, 0.5254902, 1, 0, 1,
-0.6960706, -0.185442, -4.934592, 0.5176471, 1, 0, 1,
-0.6903191, -0.1096096, -1.485744, 0.5137255, 1, 0, 1,
-0.6859708, -0.5190465, -1.514222, 0.5058824, 1, 0, 1,
-0.6843196, -0.1347706, -2.473135, 0.5019608, 1, 0, 1,
-0.6797994, -0.5521274, -0.3996567, 0.4941176, 1, 0, 1,
-0.6773125, -0.7510768, -4.911809, 0.4862745, 1, 0, 1,
-0.6762038, 0.2691175, -0.8568013, 0.4823529, 1, 0, 1,
-0.6757829, 0.644987, 0.08828218, 0.4745098, 1, 0, 1,
-0.6748683, 0.3855759, -0.03658003, 0.4705882, 1, 0, 1,
-0.6703952, 0.9438578, -3.397415, 0.4627451, 1, 0, 1,
-0.6702629, -0.2471822, -1.554504, 0.4588235, 1, 0, 1,
-0.6657315, 1.186591, -0.1332328, 0.4509804, 1, 0, 1,
-0.6636683, 0.1525127, -0.7774969, 0.4470588, 1, 0, 1,
-0.660606, -0.9294828, -1.462357, 0.4392157, 1, 0, 1,
-0.6593912, -0.3463121, -2.669458, 0.4352941, 1, 0, 1,
-0.6567463, -0.0984678, 0.04682602, 0.427451, 1, 0, 1,
-0.6505561, 1.010591, -0.3217537, 0.4235294, 1, 0, 1,
-0.6467865, 0.6666398, -2.068891, 0.4156863, 1, 0, 1,
-0.6351713, -0.03392052, -1.740475, 0.4117647, 1, 0, 1,
-0.6350564, 2.168275, -1.197749, 0.4039216, 1, 0, 1,
-0.6346076, -0.06824426, -1.381405, 0.3960784, 1, 0, 1,
-0.6331407, 0.07678418, -1.661555, 0.3921569, 1, 0, 1,
-0.6293775, -1.11575, -2.884042, 0.3843137, 1, 0, 1,
-0.6269587, -1.415423, -2.671742, 0.3803922, 1, 0, 1,
-0.6265554, -1.208286, -2.998732, 0.372549, 1, 0, 1,
-0.6230394, -0.4785882, -0.6573497, 0.3686275, 1, 0, 1,
-0.6196882, -0.4857579, -2.292876, 0.3607843, 1, 0, 1,
-0.6191748, 0.2750402, -2.422587, 0.3568628, 1, 0, 1,
-0.6144238, -0.3781262, -4.299376, 0.3490196, 1, 0, 1,
-0.6130882, -1.634097, -2.064728, 0.345098, 1, 0, 1,
-0.6121889, -1.66024, -2.51397, 0.3372549, 1, 0, 1,
-0.6103441, 0.4156315, -2.016816, 0.3333333, 1, 0, 1,
-0.6094623, -1.963208, -3.192424, 0.3254902, 1, 0, 1,
-0.6005724, 1.912831, -1.744979, 0.3215686, 1, 0, 1,
-0.6000727, -0.7493995, -2.061006, 0.3137255, 1, 0, 1,
-0.5972211, -0.1674771, -2.898294, 0.3098039, 1, 0, 1,
-0.5952321, -0.5684645, -1.63919, 0.3019608, 1, 0, 1,
-0.5948083, 0.2347211, -1.789909, 0.2941177, 1, 0, 1,
-0.5916415, 1.072782, -0.603861, 0.2901961, 1, 0, 1,
-0.5910174, -0.1851422, -1.069193, 0.282353, 1, 0, 1,
-0.5852193, -0.1924588, -2.202464, 0.2784314, 1, 0, 1,
-0.5845438, 0.9812295, -1.416045, 0.2705882, 1, 0, 1,
-0.5838869, -1.569742, -2.740178, 0.2666667, 1, 0, 1,
-0.5729614, -0.3685842, -3.892278, 0.2588235, 1, 0, 1,
-0.5692842, 0.1819033, 0.1624843, 0.254902, 1, 0, 1,
-0.5645882, -0.9661211, -1.524141, 0.2470588, 1, 0, 1,
-0.5623588, 0.4073439, 0.2929875, 0.2431373, 1, 0, 1,
-0.5611287, -0.4143365, -0.9946401, 0.2352941, 1, 0, 1,
-0.5595859, -1.872566, -3.293274, 0.2313726, 1, 0, 1,
-0.5566147, 1.461669, 2.727977, 0.2235294, 1, 0, 1,
-0.5561288, 0.7608433, 0.4226137, 0.2196078, 1, 0, 1,
-0.5524763, 1.651673, -0.1921934, 0.2117647, 1, 0, 1,
-0.5501897, 2.270594, -1.578712, 0.2078431, 1, 0, 1,
-0.5470865, 0.1182246, 0.2065185, 0.2, 1, 0, 1,
-0.5462754, 0.9746606, -0.4261655, 0.1921569, 1, 0, 1,
-0.546208, 0.8005167, 0.4268357, 0.1882353, 1, 0, 1,
-0.540049, -2.38149, -4.554241, 0.1803922, 1, 0, 1,
-0.5344037, -0.6837013, -1.790293, 0.1764706, 1, 0, 1,
-0.5301128, 0.5562242, -2.525987, 0.1686275, 1, 0, 1,
-0.5298534, -0.8667446, -2.616781, 0.1647059, 1, 0, 1,
-0.5281901, 0.3528479, -1.407433, 0.1568628, 1, 0, 1,
-0.5260897, 1.015584, 1.079339, 0.1529412, 1, 0, 1,
-0.5218742, 0.9171838, 1.165103, 0.145098, 1, 0, 1,
-0.5185559, -0.02780093, -2.727485, 0.1411765, 1, 0, 1,
-0.516703, 0.4053774, 1.189161, 0.1333333, 1, 0, 1,
-0.5117928, -0.06030507, -1.40457, 0.1294118, 1, 0, 1,
-0.5115511, 0.101345, -1.551916, 0.1215686, 1, 0, 1,
-0.5115218, 0.02000426, -1.683238, 0.1176471, 1, 0, 1,
-0.5081661, 1.550985, -0.6951725, 0.1098039, 1, 0, 1,
-0.5042465, -0.561201, -2.173702, 0.1058824, 1, 0, 1,
-0.5041114, 2.0164, -0.6135544, 0.09803922, 1, 0, 1,
-0.5024721, 0.3823346, -1.066036, 0.09019608, 1, 0, 1,
-0.5019544, 0.2962839, -0.9251316, 0.08627451, 1, 0, 1,
-0.500868, -0.9600221, -3.382439, 0.07843138, 1, 0, 1,
-0.5007585, 1.416309, 0.0582259, 0.07450981, 1, 0, 1,
-0.4980365, -0.1825397, -1.272417, 0.06666667, 1, 0, 1,
-0.4977075, 0.2753947, -0.8337465, 0.0627451, 1, 0, 1,
-0.4867061, 0.8657291, 1.532832, 0.05490196, 1, 0, 1,
-0.4844769, -0.8356903, -0.6168538, 0.05098039, 1, 0, 1,
-0.4832157, 0.670945, 0.2350738, 0.04313726, 1, 0, 1,
-0.4831934, 0.6834872, -1.052853, 0.03921569, 1, 0, 1,
-0.4815211, 0.8238112, -1.399525, 0.03137255, 1, 0, 1,
-0.4784577, -1.451521, -0.9352487, 0.02745098, 1, 0, 1,
-0.4738337, -1.567211, -3.439133, 0.01960784, 1, 0, 1,
-0.4728343, 2.393075, 0.9115934, 0.01568628, 1, 0, 1,
-0.4713902, 0.1067946, -1.022218, 0.007843138, 1, 0, 1,
-0.4694816, -0.122969, -0.554646, 0.003921569, 1, 0, 1,
-0.4694074, 0.5407416, -0.7285805, 0, 1, 0.003921569, 1,
-0.4692743, 1.325186, -1.01727, 0, 1, 0.01176471, 1,
-0.467998, -1.296413, -1.607139, 0, 1, 0.01568628, 1,
-0.4671083, -0.2951551, -2.242236, 0, 1, 0.02352941, 1,
-0.4647802, 0.05389627, -0.889268, 0, 1, 0.02745098, 1,
-0.463387, -0.2259841, -2.214355, 0, 1, 0.03529412, 1,
-0.4530528, 1.284295, -0.1060583, 0, 1, 0.03921569, 1,
-0.4525481, -1.393593, -4.154323, 0, 1, 0.04705882, 1,
-0.4520076, -1.088989, -2.51832, 0, 1, 0.05098039, 1,
-0.4504737, 0.3516975, 0.6702414, 0, 1, 0.05882353, 1,
-0.4468201, 1.841655, -0.8483792, 0, 1, 0.0627451, 1,
-0.4434645, 1.291076, -1.351349, 0, 1, 0.07058824, 1,
-0.440926, -1.206932, -3.422785, 0, 1, 0.07450981, 1,
-0.4399408, 1.418275, -1.62972, 0, 1, 0.08235294, 1,
-0.4276619, 1.465136, -1.3641, 0, 1, 0.08627451, 1,
-0.4250059, 0.2607659, -0.9544654, 0, 1, 0.09411765, 1,
-0.424763, 0.1046716, -0.06616572, 0, 1, 0.1019608, 1,
-0.424058, -1.120455, -1.104453, 0, 1, 0.1058824, 1,
-0.4220845, 0.7884634, -0.5560331, 0, 1, 0.1137255, 1,
-0.4175558, 0.4786147, 0.02192972, 0, 1, 0.1176471, 1,
-0.4139721, -0.3304147, -2.412841, 0, 1, 0.1254902, 1,
-0.4080278, 0.1555437, -1.421082, 0, 1, 0.1294118, 1,
-0.4057519, 0.2571032, -1.587551, 0, 1, 0.1372549, 1,
-0.4048726, 0.3895498, -0.5503512, 0, 1, 0.1411765, 1,
-0.4035615, 0.1393358, -1.6541, 0, 1, 0.1490196, 1,
-0.4019641, 1.222764, -1.481848, 0, 1, 0.1529412, 1,
-0.3965987, 1.297359, 1.471159, 0, 1, 0.1607843, 1,
-0.3955885, -2.089074, -3.964779, 0, 1, 0.1647059, 1,
-0.3942594, -1.771486, -2.523262, 0, 1, 0.172549, 1,
-0.3938621, 0.775938, -1.854016, 0, 1, 0.1764706, 1,
-0.3930013, 2.271657, -0.4396181, 0, 1, 0.1843137, 1,
-0.3908758, -1.904985, -3.031206, 0, 1, 0.1882353, 1,
-0.3895116, -0.1653026, -1.632524, 0, 1, 0.1960784, 1,
-0.3799095, -1.06268, -2.595265, 0, 1, 0.2039216, 1,
-0.379405, -0.477434, -3.44416, 0, 1, 0.2078431, 1,
-0.3785281, 0.8070078, 0.07751239, 0, 1, 0.2156863, 1,
-0.3732439, -0.1552524, -2.97761, 0, 1, 0.2196078, 1,
-0.3719635, 1.134271, -0.4368637, 0, 1, 0.227451, 1,
-0.3654902, -0.4728616, -3.486401, 0, 1, 0.2313726, 1,
-0.3643687, 0.5602502, -1.677048, 0, 1, 0.2392157, 1,
-0.3620564, 0.5088618, 1.980636, 0, 1, 0.2431373, 1,
-0.3613458, -0.9874038, -3.731382, 0, 1, 0.2509804, 1,
-0.3579044, 1.121955, -0.2251734, 0, 1, 0.254902, 1,
-0.352432, -0.9275029, -2.392137, 0, 1, 0.2627451, 1,
-0.3429568, 0.4922854, -0.349689, 0, 1, 0.2666667, 1,
-0.3426968, 0.1049068, -2.485799, 0, 1, 0.2745098, 1,
-0.3365656, 1.704554, 0.1570108, 0, 1, 0.2784314, 1,
-0.3358113, 0.3194112, 0.6711051, 0, 1, 0.2862745, 1,
-0.3333051, 0.3667873, -0.9972978, 0, 1, 0.2901961, 1,
-0.3329089, -1.73755, -3.226852, 0, 1, 0.2980392, 1,
-0.3319525, 1.081711, 0.3501711, 0, 1, 0.3058824, 1,
-0.3298702, 0.056837, -1.488894, 0, 1, 0.3098039, 1,
-0.3288265, -0.613375, -2.336673, 0, 1, 0.3176471, 1,
-0.3258898, 3.160941, -0.5570912, 0, 1, 0.3215686, 1,
-0.3258016, -0.6844887, -1.18253, 0, 1, 0.3294118, 1,
-0.323762, 0.3061364, -0.2860809, 0, 1, 0.3333333, 1,
-0.3206606, 1.295231, -0.2092307, 0, 1, 0.3411765, 1,
-0.3190095, 1.83611, -1.321572, 0, 1, 0.345098, 1,
-0.3154274, 0.1541235, -1.677769, 0, 1, 0.3529412, 1,
-0.3121723, -1.11021, -1.758771, 0, 1, 0.3568628, 1,
-0.3093049, 0.3380345, -1.247425, 0, 1, 0.3647059, 1,
-0.308483, 0.5785539, -0.8876357, 0, 1, 0.3686275, 1,
-0.3060964, 1.030952, -2.768351, 0, 1, 0.3764706, 1,
-0.3031959, -0.3371204, -2.5114, 0, 1, 0.3803922, 1,
-0.2990594, 0.3042808, -1.24374, 0, 1, 0.3882353, 1,
-0.298556, 0.09751994, -1.343627, 0, 1, 0.3921569, 1,
-0.2978492, 0.5406524, -0.1902921, 0, 1, 0.4, 1,
-0.2966929, -1.432573, -4.606584, 0, 1, 0.4078431, 1,
-0.2960593, 0.3727159, 0.01587928, 0, 1, 0.4117647, 1,
-0.2923888, -0.1399044, 0.4680183, 0, 1, 0.4196078, 1,
-0.2916276, -0.6389146, -2.399522, 0, 1, 0.4235294, 1,
-0.2860126, 0.5486731, -1.369516, 0, 1, 0.4313726, 1,
-0.2857841, -0.2037031, -3.470709, 0, 1, 0.4352941, 1,
-0.2847483, 0.482198, -0.4458308, 0, 1, 0.4431373, 1,
-0.2828158, -1.111146, -4.102356, 0, 1, 0.4470588, 1,
-0.2820801, 1.000508, 0.7066578, 0, 1, 0.454902, 1,
-0.2753699, -1.188519, -2.654868, 0, 1, 0.4588235, 1,
-0.2682986, -0.06123385, -0.953832, 0, 1, 0.4666667, 1,
-0.2589569, 1.001915, -1.117479, 0, 1, 0.4705882, 1,
-0.2563113, 0.473545, -1.308771, 0, 1, 0.4784314, 1,
-0.2552165, -1.488135, -2.974956, 0, 1, 0.4823529, 1,
-0.2469423, 0.08218408, -1.693689, 0, 1, 0.4901961, 1,
-0.2464229, -0.6303602, -2.543226, 0, 1, 0.4941176, 1,
-0.2462784, 2.03942, -2.841062, 0, 1, 0.5019608, 1,
-0.2422742, -0.1673972, -3.101675, 0, 1, 0.509804, 1,
-0.2344504, -0.9924573, -1.476359, 0, 1, 0.5137255, 1,
-0.2319172, 1.160825, 0.4477068, 0, 1, 0.5215687, 1,
-0.226278, 1.238178, -0.849638, 0, 1, 0.5254902, 1,
-0.2210788, 1.345649, 0.6076729, 0, 1, 0.5333334, 1,
-0.2207343, -0.6271089, -2.846397, 0, 1, 0.5372549, 1,
-0.2206566, 0.4559428, -0.01176769, 0, 1, 0.5450981, 1,
-0.2164351, -1.505116, -2.426791, 0, 1, 0.5490196, 1,
-0.2111798, -1.294174, -2.164948, 0, 1, 0.5568628, 1,
-0.2070038, 1.370424, 1.19892, 0, 1, 0.5607843, 1,
-0.2050462, -1.240824, -2.248893, 0, 1, 0.5686275, 1,
-0.1984127, -1.460873, -3.975852, 0, 1, 0.572549, 1,
-0.1977443, -0.1284299, -3.068035, 0, 1, 0.5803922, 1,
-0.1962035, 0.2668219, 1.152428, 0, 1, 0.5843138, 1,
-0.1960454, -0.6466916, -4.017663, 0, 1, 0.5921569, 1,
-0.1958535, -0.03986492, -1.620922, 0, 1, 0.5960785, 1,
-0.1939675, -2.471653, -5.039392, 0, 1, 0.6039216, 1,
-0.1926167, 1.506297, -0.7061495, 0, 1, 0.6117647, 1,
-0.1804509, -0.5370318, -2.067779, 0, 1, 0.6156863, 1,
-0.1795986, -0.348986, -3.060829, 0, 1, 0.6235294, 1,
-0.1794836, -0.2409524, -2.187392, 0, 1, 0.627451, 1,
-0.1737881, 1.828729, -0.3571611, 0, 1, 0.6352941, 1,
-0.1701033, -0.003357329, -1.354787, 0, 1, 0.6392157, 1,
-0.1699864, -0.3505369, -2.264691, 0, 1, 0.6470588, 1,
-0.1693415, -0.4902368, -2.622457, 0, 1, 0.6509804, 1,
-0.1670535, 0.02466486, -0.6554193, 0, 1, 0.6588235, 1,
-0.160655, -0.4899147, -2.692734, 0, 1, 0.6627451, 1,
-0.1574429, -0.1624676, -2.34434, 0, 1, 0.6705883, 1,
-0.1523883, -0.4874471, -1.881316, 0, 1, 0.6745098, 1,
-0.1522982, -1.430477, -4.606804, 0, 1, 0.682353, 1,
-0.1522105, -0.9735863, -3.22985, 0, 1, 0.6862745, 1,
-0.1473621, -0.09999258, -1.078243, 0, 1, 0.6941177, 1,
-0.1454613, -0.1956304, -2.704146, 0, 1, 0.7019608, 1,
-0.1448235, 0.7127203, -0.1160829, 0, 1, 0.7058824, 1,
-0.1438426, 1.092961, -0.32768, 0, 1, 0.7137255, 1,
-0.1409787, -0.8518153, -3.100029, 0, 1, 0.7176471, 1,
-0.1376715, 0.2229062, 1.752632, 0, 1, 0.7254902, 1,
-0.1371737, -0.7488878, -1.639603, 0, 1, 0.7294118, 1,
-0.1291065, -0.1893357, -1.341811, 0, 1, 0.7372549, 1,
-0.1271395, 1.136918, -0.4045778, 0, 1, 0.7411765, 1,
-0.1266622, 0.7063922, 0.07042164, 0, 1, 0.7490196, 1,
-0.1265514, 1.071347, -1.211197, 0, 1, 0.7529412, 1,
-0.1225785, -1.485175, -2.668919, 0, 1, 0.7607843, 1,
-0.1153212, -0.854611, -4.005262, 0, 1, 0.7647059, 1,
-0.1127314, 1.595734, 2.300805, 0, 1, 0.772549, 1,
-0.1095686, 0.5740442, -1.794938, 0, 1, 0.7764706, 1,
-0.1091005, -1.658121, -2.87011, 0, 1, 0.7843137, 1,
-0.09919125, 0.2120308, -0.9684655, 0, 1, 0.7882353, 1,
-0.09696693, 2.334573, 0.2609356, 0, 1, 0.7960784, 1,
-0.0949254, 0.5620758, 0.8279928, 0, 1, 0.8039216, 1,
-0.09347893, 1.052785, 0.8047969, 0, 1, 0.8078431, 1,
-0.09219651, -0.661072, -1.614822, 0, 1, 0.8156863, 1,
-0.08541077, 0.8495668, -0.8800908, 0, 1, 0.8196079, 1,
-0.07873186, -0.5948663, -4.238789, 0, 1, 0.827451, 1,
-0.07362983, -0.002621842, -2.29027, 0, 1, 0.8313726, 1,
-0.06736547, 1.487041, 0.9159426, 0, 1, 0.8392157, 1,
-0.06727823, 0.1776432, -0.5017361, 0, 1, 0.8431373, 1,
-0.06566049, 1.662354, -2.044433, 0, 1, 0.8509804, 1,
-0.06272248, -0.5369904, -3.138513, 0, 1, 0.854902, 1,
-0.05710984, -0.3246777, -1.87284, 0, 1, 0.8627451, 1,
-0.05674177, -1.034294, -4.94845, 0, 1, 0.8666667, 1,
-0.05661217, -0.5575745, -1.698326, 0, 1, 0.8745098, 1,
-0.05576738, 1.282828, 1.944734, 0, 1, 0.8784314, 1,
-0.05166719, -0.9291475, -1.973822, 0, 1, 0.8862745, 1,
-0.0495839, -0.4171048, -3.490414, 0, 1, 0.8901961, 1,
-0.04898709, -0.5377491, -2.33239, 0, 1, 0.8980392, 1,
-0.04688013, -0.0989718, -2.726017, 0, 1, 0.9058824, 1,
-0.04539481, -0.5709121, -3.644973, 0, 1, 0.9098039, 1,
-0.04492488, 1.904953, -1.028869, 0, 1, 0.9176471, 1,
-0.04208224, 0.4578969, 1.124894, 0, 1, 0.9215686, 1,
-0.04163517, -1.083122, -3.310401, 0, 1, 0.9294118, 1,
-0.03807896, 2.261191, 0.800721, 0, 1, 0.9333333, 1,
-0.03709678, 0.6412987, 0.6821295, 0, 1, 0.9411765, 1,
-0.0368991, 0.2452533, -0.3466218, 0, 1, 0.945098, 1,
-0.03257291, 0.5230867, -1.151299, 0, 1, 0.9529412, 1,
-0.03044225, 0.9272875, 0.7093416, 0, 1, 0.9568627, 1,
-0.03042035, 0.8335975, 0.2479245, 0, 1, 0.9647059, 1,
-0.02710195, 1.257192, 0.04416254, 0, 1, 0.9686275, 1,
-0.02574995, 0.9066935, 1.087571, 0, 1, 0.9764706, 1,
-0.02554698, -0.06449034, -3.240011, 0, 1, 0.9803922, 1,
-0.02043521, -1.101369, -2.301368, 0, 1, 0.9882353, 1,
-0.0115114, -0.7274401, -2.332224, 0, 1, 0.9921569, 1,
-0.01002143, -0.9666889, -2.949124, 0, 1, 1, 1,
-0.00910048, 0.8262521, 0.46576, 0, 0.9921569, 1, 1,
-0.007983233, -1.965318, -2.965547, 0, 0.9882353, 1, 1,
-0.00705837, 0.3905543, -1.029992, 0, 0.9803922, 1, 1,
-0.006557027, 0.5103511, 0.3151983, 0, 0.9764706, 1, 1,
-0.005868083, -0.6762711, -3.57903, 0, 0.9686275, 1, 1,
-0.005622211, -0.3366469, -3.23573, 0, 0.9647059, 1, 1,
0.005716986, 0.09166107, 0.6654546, 0, 0.9568627, 1, 1,
0.008288568, -0.001247246, 1.723316, 0, 0.9529412, 1, 1,
0.013095, -0.05094225, 3.412848, 0, 0.945098, 1, 1,
0.01330219, -1.429915, 3.458085, 0, 0.9411765, 1, 1,
0.01331469, -1.243201, 3.471156, 0, 0.9333333, 1, 1,
0.01574232, 0.684675, -2.334856, 0, 0.9294118, 1, 1,
0.01710785, 0.6932938, -1.785811, 0, 0.9215686, 1, 1,
0.01799803, -0.257259, 1.2285, 0, 0.9176471, 1, 1,
0.01891181, -0.02666063, 2.814132, 0, 0.9098039, 1, 1,
0.03123106, 0.9986359, 0.9384418, 0, 0.9058824, 1, 1,
0.03141518, -0.9446044, 3.017785, 0, 0.8980392, 1, 1,
0.03156556, 1.872603, -0.9518483, 0, 0.8901961, 1, 1,
0.03637708, -0.2896376, 2.346291, 0, 0.8862745, 1, 1,
0.04068496, -1.786332, 0.7118106, 0, 0.8784314, 1, 1,
0.0499819, 0.1831412, 0.8126749, 0, 0.8745098, 1, 1,
0.05236484, -0.6625147, 2.068402, 0, 0.8666667, 1, 1,
0.05335973, 0.1275489, -0.09436419, 0, 0.8627451, 1, 1,
0.06492992, 1.330089, 1.106434, 0, 0.854902, 1, 1,
0.0650619, -0.6219276, 2.633359, 0, 0.8509804, 1, 1,
0.07749304, 0.07168628, 1.702897, 0, 0.8431373, 1, 1,
0.07794039, -0.9026411, 2.459926, 0, 0.8392157, 1, 1,
0.07853371, 0.4117624, 0.2019989, 0, 0.8313726, 1, 1,
0.08402084, -0.4355, 3.021054, 0, 0.827451, 1, 1,
0.08506417, -1.288917, 3.554073, 0, 0.8196079, 1, 1,
0.08756672, 0.2794945, -0.6504689, 0, 0.8156863, 1, 1,
0.08950094, -1.043629, 1.654956, 0, 0.8078431, 1, 1,
0.08997352, -1.192275, 2.721134, 0, 0.8039216, 1, 1,
0.09074973, 2.247952, -0.5359741, 0, 0.7960784, 1, 1,
0.09166802, -0.08184104, 3.47155, 0, 0.7882353, 1, 1,
0.09236558, -0.05979351, 1.404622, 0, 0.7843137, 1, 1,
0.0937375, 0.1137289, 0.07535866, 0, 0.7764706, 1, 1,
0.09405813, 1.426123, -1.310921, 0, 0.772549, 1, 1,
0.09703163, -0.6570539, 3.240123, 0, 0.7647059, 1, 1,
0.09734526, 1.206998, 1.350677, 0, 0.7607843, 1, 1,
0.09777402, -2.099735, 2.21246, 0, 0.7529412, 1, 1,
0.09857497, -2.243114, 3.197158, 0, 0.7490196, 1, 1,
0.1007642, 0.8723428, -1.01764, 0, 0.7411765, 1, 1,
0.1031459, 0.1298326, 0.04937053, 0, 0.7372549, 1, 1,
0.1070579, -0.01277707, 2.548569, 0, 0.7294118, 1, 1,
0.1148364, -0.7976997, 4.194189, 0, 0.7254902, 1, 1,
0.1167339, -0.07153335, -0.05005767, 0, 0.7176471, 1, 1,
0.118966, 0.7278491, 0.1991948, 0, 0.7137255, 1, 1,
0.1214394, -0.7122011, 4.018608, 0, 0.7058824, 1, 1,
0.1234203, 0.3207457, -0.4002377, 0, 0.6980392, 1, 1,
0.1319376, 0.2279528, -0.2509383, 0, 0.6941177, 1, 1,
0.1339105, -0.1333618, 2.909145, 0, 0.6862745, 1, 1,
0.1421588, 0.02082843, 2.598197, 0, 0.682353, 1, 1,
0.142609, -1.25486, 3.004491, 0, 0.6745098, 1, 1,
0.1445864, -1.369548, 2.704989, 0, 0.6705883, 1, 1,
0.1487734, 0.5676458, 0.2329383, 0, 0.6627451, 1, 1,
0.1501757, -1.572343, 2.789758, 0, 0.6588235, 1, 1,
0.1503492, -0.1258191, 2.088939, 0, 0.6509804, 1, 1,
0.1528511, 0.3903758, 1.479202, 0, 0.6470588, 1, 1,
0.1533895, 0.6046197, -0.09065425, 0, 0.6392157, 1, 1,
0.1550886, -0.03613823, 0.6492141, 0, 0.6352941, 1, 1,
0.1559788, 0.7473207, 0.02211596, 0, 0.627451, 1, 1,
0.1641223, -0.9862288, 1.248662, 0, 0.6235294, 1, 1,
0.1644661, -0.6498274, 3.692199, 0, 0.6156863, 1, 1,
0.1665215, 1.968562, -1.514878, 0, 0.6117647, 1, 1,
0.1668531, 0.179237, 1.634941, 0, 0.6039216, 1, 1,
0.1694779, 0.07211037, 1.285423, 0, 0.5960785, 1, 1,
0.174437, -0.3446393, 1.995708, 0, 0.5921569, 1, 1,
0.1799188, 0.7515209, 0.2628957, 0, 0.5843138, 1, 1,
0.1810146, 0.5504324, 1.27466, 0, 0.5803922, 1, 1,
0.1824018, 1.187139, -0.4701307, 0, 0.572549, 1, 1,
0.1838915, -0.4673541, 1.548713, 0, 0.5686275, 1, 1,
0.1873177, -0.3169518, 3.042707, 0, 0.5607843, 1, 1,
0.1894844, -0.7833193, 1.708411, 0, 0.5568628, 1, 1,
0.198467, 0.7925649, 1.774048, 0, 0.5490196, 1, 1,
0.2003812, 0.1995528, 0.7857479, 0, 0.5450981, 1, 1,
0.2013812, -0.8844599, 4.339046, 0, 0.5372549, 1, 1,
0.2021501, -0.5459127, 3.485672, 0, 0.5333334, 1, 1,
0.2026487, -0.4222543, 3.460042, 0, 0.5254902, 1, 1,
0.2030854, 0.9192547, 0.06010851, 0, 0.5215687, 1, 1,
0.2054678, 1.793148, 1.614763, 0, 0.5137255, 1, 1,
0.2060269, 1.261458, 0.8437654, 0, 0.509804, 1, 1,
0.2075225, -0.2870608, 2.239861, 0, 0.5019608, 1, 1,
0.2101219, -0.1809942, 2.719415, 0, 0.4941176, 1, 1,
0.210569, -1.171921, 3.216063, 0, 0.4901961, 1, 1,
0.2183673, 0.4449466, 0.4340527, 0, 0.4823529, 1, 1,
0.2184176, -2.156233, 3.48753, 0, 0.4784314, 1, 1,
0.2191734, 0.7811021, -0.9752831, 0, 0.4705882, 1, 1,
0.2232848, 0.5918269, 1.528122, 0, 0.4666667, 1, 1,
0.2233658, 0.3989321, 1.307461, 0, 0.4588235, 1, 1,
0.2240846, 1.911807, -0.4739576, 0, 0.454902, 1, 1,
0.2297178, -0.9181068, 1.968774, 0, 0.4470588, 1, 1,
0.2317309, -0.4722403, 2.288283, 0, 0.4431373, 1, 1,
0.2353826, 0.1860222, 3.071211, 0, 0.4352941, 1, 1,
0.2380382, 0.5994366, -0.01132749, 0, 0.4313726, 1, 1,
0.2385746, -0.3461541, 2.236632, 0, 0.4235294, 1, 1,
0.2392391, -0.4358091, 2.214984, 0, 0.4196078, 1, 1,
0.2411379, -1.483303, 2.125118, 0, 0.4117647, 1, 1,
0.2419713, -0.2225762, 2.482008, 0, 0.4078431, 1, 1,
0.2443492, 0.5515822, 1.758797, 0, 0.4, 1, 1,
0.247416, 0.9282883, -0.4096667, 0, 0.3921569, 1, 1,
0.254795, 1.950191, 0.5732985, 0, 0.3882353, 1, 1,
0.2577762, 1.030444, -0.9559761, 0, 0.3803922, 1, 1,
0.2629561, 1.036933, 0.1543005, 0, 0.3764706, 1, 1,
0.26476, 0.2291704, 0.9388965, 0, 0.3686275, 1, 1,
0.2647836, 1.130578, -1.5368, 0, 0.3647059, 1, 1,
0.2698787, -0.4299017, 2.209221, 0, 0.3568628, 1, 1,
0.2702847, 1.183347, -0.4017438, 0, 0.3529412, 1, 1,
0.2797204, -1.229542, 3.413828, 0, 0.345098, 1, 1,
0.2799714, 0.5479782, 1.148267, 0, 0.3411765, 1, 1,
0.2851564, -0.2962444, 1.835935, 0, 0.3333333, 1, 1,
0.285583, -0.9424451, 2.232197, 0, 0.3294118, 1, 1,
0.2866623, 0.353576, 0.5811011, 0, 0.3215686, 1, 1,
0.2876769, 0.8660104, -1.121457, 0, 0.3176471, 1, 1,
0.2923532, -0.7415488, 4.529391, 0, 0.3098039, 1, 1,
0.2979734, -0.4711905, 3.301995, 0, 0.3058824, 1, 1,
0.3001221, -0.2350213, 1.125792, 0, 0.2980392, 1, 1,
0.300436, -0.5640876, 2.216324, 0, 0.2901961, 1, 1,
0.3047159, -1.098523, 2.878034, 0, 0.2862745, 1, 1,
0.3153274, 0.7659411, 0.3261293, 0, 0.2784314, 1, 1,
0.3174647, 1.775148, 0.5235997, 0, 0.2745098, 1, 1,
0.3182524, 1.520491, 1.101392, 0, 0.2666667, 1, 1,
0.3207411, -0.3478924, 2.320407, 0, 0.2627451, 1, 1,
0.3215213, -0.5742788, 3.971051, 0, 0.254902, 1, 1,
0.3242898, -0.5538822, 2.752147, 0, 0.2509804, 1, 1,
0.3311892, 0.2092468, -0.2245276, 0, 0.2431373, 1, 1,
0.3323829, 0.3550118, 1.302313, 0, 0.2392157, 1, 1,
0.3370283, -0.06215008, 2.337761, 0, 0.2313726, 1, 1,
0.3382217, -1.264211, 3.758975, 0, 0.227451, 1, 1,
0.3388862, 0.2081005, 2.329551, 0, 0.2196078, 1, 1,
0.3409728, -1.413617, 3.641426, 0, 0.2156863, 1, 1,
0.3439467, -1.2835, 2.385852, 0, 0.2078431, 1, 1,
0.3442366, -0.06457609, 1.458766, 0, 0.2039216, 1, 1,
0.3450637, 0.07808011, 1.63826, 0, 0.1960784, 1, 1,
0.346038, -1.141131, 4.520572, 0, 0.1882353, 1, 1,
0.3461692, -0.8998983, 3.292379, 0, 0.1843137, 1, 1,
0.3482179, 0.6172723, 0.5861062, 0, 0.1764706, 1, 1,
0.3506309, -1.087349, 4.236087, 0, 0.172549, 1, 1,
0.3522551, 0.6427569, -0.6438655, 0, 0.1647059, 1, 1,
0.3545505, 0.8332073, 1.193649, 0, 0.1607843, 1, 1,
0.3564058, 1.270499, -0.5537997, 0, 0.1529412, 1, 1,
0.3590087, -0.8501032, 3.774115, 0, 0.1490196, 1, 1,
0.3592355, 0.1936312, 2.659489, 0, 0.1411765, 1, 1,
0.3607565, -0.002846163, 3.156926, 0, 0.1372549, 1, 1,
0.3612002, -0.5357771, 2.226468, 0, 0.1294118, 1, 1,
0.3676782, -0.5954806, 2.374278, 0, 0.1254902, 1, 1,
0.3679113, 0.6047752, 1.077082, 0, 0.1176471, 1, 1,
0.3687009, -0.03464658, 0.8065655, 0, 0.1137255, 1, 1,
0.3700978, 1.12687, -0.4082739, 0, 0.1058824, 1, 1,
0.3739878, 0.1986008, 0.1086919, 0, 0.09803922, 1, 1,
0.3740693, -0.06080948, 3.621402, 0, 0.09411765, 1, 1,
0.3742622, 0.3583679, 0.7401385, 0, 0.08627451, 1, 1,
0.3745149, 0.1582301, -0.8961518, 0, 0.08235294, 1, 1,
0.3754641, 0.2156673, 1.387669, 0, 0.07450981, 1, 1,
0.3759787, -0.3222605, 1.231143, 0, 0.07058824, 1, 1,
0.3761792, -1.40979, 3.764065, 0, 0.0627451, 1, 1,
0.3779374, -1.541538, 3.727022, 0, 0.05882353, 1, 1,
0.3808126, -1.016907, 3.970772, 0, 0.05098039, 1, 1,
0.3814398, -0.4094138, 2.411716, 0, 0.04705882, 1, 1,
0.384007, -0.2430254, 1.399442, 0, 0.03921569, 1, 1,
0.3850185, -0.1776677, 2.015458, 0, 0.03529412, 1, 1,
0.3894982, 0.03997729, 0.5992452, 0, 0.02745098, 1, 1,
0.3957246, -0.402035, 2.3225, 0, 0.02352941, 1, 1,
0.3977482, 0.4168547, -0.317461, 0, 0.01568628, 1, 1,
0.3987287, -1.023398, 3.60282, 0, 0.01176471, 1, 1,
0.3993377, 0.7305981, 0.6463066, 0, 0.003921569, 1, 1,
0.4046212, -0.09197741, 2.775557, 0.003921569, 0, 1, 1,
0.4129753, 0.6955969, 0.8207244, 0.007843138, 0, 1, 1,
0.413263, -0.5015577, 3.539565, 0.01568628, 0, 1, 1,
0.4137481, 1.022211, -0.5136444, 0.01960784, 0, 1, 1,
0.415358, -0.1769079, 2.797333, 0.02745098, 0, 1, 1,
0.4170192, 0.3493881, 0.4644314, 0.03137255, 0, 1, 1,
0.4203322, -0.4217235, 1.428234, 0.03921569, 0, 1, 1,
0.4248973, -0.2320814, 1.248999, 0.04313726, 0, 1, 1,
0.4273861, -1.472195, 3.329881, 0.05098039, 0, 1, 1,
0.4294117, -0.4651867, 4.363587, 0.05490196, 0, 1, 1,
0.430491, -1.140478, 2.659867, 0.0627451, 0, 1, 1,
0.4340871, -0.5310714, 2.924472, 0.06666667, 0, 1, 1,
0.4348801, 0.04331687, 3.23608, 0.07450981, 0, 1, 1,
0.43555, 0.2584038, 0.6394305, 0.07843138, 0, 1, 1,
0.4370639, -0.05289212, 1.555375, 0.08627451, 0, 1, 1,
0.438434, -0.0664591, 0.8437944, 0.09019608, 0, 1, 1,
0.4417662, 1.803557, 0.3371382, 0.09803922, 0, 1, 1,
0.4556481, -0.4931101, 2.979038, 0.1058824, 0, 1, 1,
0.4568903, 0.2074552, 2.031119, 0.1098039, 0, 1, 1,
0.4633154, -0.06733562, 0.2609518, 0.1176471, 0, 1, 1,
0.4706941, 0.2200356, 0.5476798, 0.1215686, 0, 1, 1,
0.472215, 0.03290224, 1.786676, 0.1294118, 0, 1, 1,
0.4739669, 1.032634, 0.164359, 0.1333333, 0, 1, 1,
0.4748149, 0.4098718, 1.430197, 0.1411765, 0, 1, 1,
0.4782329, -0.2401012, 1.357909, 0.145098, 0, 1, 1,
0.4797513, -0.5203312, 2.535501, 0.1529412, 0, 1, 1,
0.4799457, 0.3404258, 1.344544, 0.1568628, 0, 1, 1,
0.4838857, 2.15192, -0.04207015, 0.1647059, 0, 1, 1,
0.4851863, 1.344142, 1.234704, 0.1686275, 0, 1, 1,
0.4855866, 0.3714514, 1.537264, 0.1764706, 0, 1, 1,
0.4905643, -0.2364413, 1.929507, 0.1803922, 0, 1, 1,
0.4964262, -0.8453007, 2.903377, 0.1882353, 0, 1, 1,
0.4986841, -0.5961845, 1.277835, 0.1921569, 0, 1, 1,
0.5007507, -0.1734933, 2.761949, 0.2, 0, 1, 1,
0.5012792, -0.6525289, 2.254459, 0.2078431, 0, 1, 1,
0.5017717, -0.219154, 1.081365, 0.2117647, 0, 1, 1,
0.5031272, 0.2569198, 1.296111, 0.2196078, 0, 1, 1,
0.5042132, 1.890653, 1.590666, 0.2235294, 0, 1, 1,
0.5103719, -0.7833673, 3.223404, 0.2313726, 0, 1, 1,
0.5119655, -1.064194, 3.319697, 0.2352941, 0, 1, 1,
0.5172883, -0.4229029, 2.784425, 0.2431373, 0, 1, 1,
0.5175817, -0.00183528, 0.235231, 0.2470588, 0, 1, 1,
0.5204024, -0.9321434, 0.3443322, 0.254902, 0, 1, 1,
0.5240275, -1.16307, 2.71383, 0.2588235, 0, 1, 1,
0.5285611, 1.602721, 1.164632, 0.2666667, 0, 1, 1,
0.531253, 0.3210576, 2.15595, 0.2705882, 0, 1, 1,
0.5328268, -0.1257791, 1.764608, 0.2784314, 0, 1, 1,
0.5331376, -0.3963834, 2.656021, 0.282353, 0, 1, 1,
0.5415651, -0.1329477, 1.92489, 0.2901961, 0, 1, 1,
0.5485104, -0.7331052, 4.401784, 0.2941177, 0, 1, 1,
0.5488005, 0.4626003, 0.8617657, 0.3019608, 0, 1, 1,
0.5489957, 0.4309821, 0.7056327, 0.3098039, 0, 1, 1,
0.549605, -1.197848, 4.289587, 0.3137255, 0, 1, 1,
0.5536031, 2.670485, 0.6495722, 0.3215686, 0, 1, 1,
0.5551912, -0.1883986, 1.656494, 0.3254902, 0, 1, 1,
0.5634584, -1.9356, 2.084775, 0.3333333, 0, 1, 1,
0.5650555, -0.8401592, 3.148232, 0.3372549, 0, 1, 1,
0.5712399, -0.6700233, 2.400228, 0.345098, 0, 1, 1,
0.5727084, 0.4340543, -1.437474, 0.3490196, 0, 1, 1,
0.5736123, -0.0992588, -0.3675203, 0.3568628, 0, 1, 1,
0.5773934, 1.689843, 1.292335, 0.3607843, 0, 1, 1,
0.5809865, 1.458278, -1.95522, 0.3686275, 0, 1, 1,
0.5815529, -1.495528, 2.544703, 0.372549, 0, 1, 1,
0.585552, -1.403752, 0.7701048, 0.3803922, 0, 1, 1,
0.5856892, 0.1470712, 2.829551, 0.3843137, 0, 1, 1,
0.5977939, -0.5600962, 3.283139, 0.3921569, 0, 1, 1,
0.6017301, -0.4253861, 0.3392442, 0.3960784, 0, 1, 1,
0.605498, 2.007048, -1.011327, 0.4039216, 0, 1, 1,
0.6066719, -0.6994011, 3.309668, 0.4117647, 0, 1, 1,
0.6189085, 1.505995, -0.3641621, 0.4156863, 0, 1, 1,
0.6204227, -0.3519525, -1.15066, 0.4235294, 0, 1, 1,
0.6205965, 1.242436, 1.543721, 0.427451, 0, 1, 1,
0.6234423, 1.307885, 1.502868, 0.4352941, 0, 1, 1,
0.6239923, -0.04406827, 2.175398, 0.4392157, 0, 1, 1,
0.6272406, -1.000536, 2.044654, 0.4470588, 0, 1, 1,
0.6279058, 0.1823266, -0.7002262, 0.4509804, 0, 1, 1,
0.6383958, -1.367489, 2.300211, 0.4588235, 0, 1, 1,
0.6397237, 1.38442, 1.170556, 0.4627451, 0, 1, 1,
0.6514635, -0.003153881, 1.87557, 0.4705882, 0, 1, 1,
0.6521389, -1.825047, 3.741891, 0.4745098, 0, 1, 1,
0.6553645, -0.5965906, 1.7803, 0.4823529, 0, 1, 1,
0.6553777, 0.8818985, 1.10691, 0.4862745, 0, 1, 1,
0.6600335, 0.4309736, 1.934517, 0.4941176, 0, 1, 1,
0.661436, 1.60489, 0.9379296, 0.5019608, 0, 1, 1,
0.6628417, -0.9896966, 2.352194, 0.5058824, 0, 1, 1,
0.6647009, 0.275478, 4.589987, 0.5137255, 0, 1, 1,
0.6670702, 0.7874134, -1.008605, 0.5176471, 0, 1, 1,
0.6709163, -0.2946646, 1.891873, 0.5254902, 0, 1, 1,
0.6716757, -0.3882025, 2.414672, 0.5294118, 0, 1, 1,
0.675105, 0.09788363, 3.619432, 0.5372549, 0, 1, 1,
0.6767037, -0.9378513, 2.047421, 0.5411765, 0, 1, 1,
0.6789614, -1.860351, 1.44129, 0.5490196, 0, 1, 1,
0.6804651, -0.3832183, 0.974233, 0.5529412, 0, 1, 1,
0.6867734, 0.8466366, 2.276313, 0.5607843, 0, 1, 1,
0.6881151, 0.8019, 0.9204825, 0.5647059, 0, 1, 1,
0.6971292, 0.7902122, -0.7759914, 0.572549, 0, 1, 1,
0.6985549, 1.323229, -0.7215233, 0.5764706, 0, 1, 1,
0.7006703, 1.225694, 0.5005886, 0.5843138, 0, 1, 1,
0.7012424, 0.1581457, 2.471038, 0.5882353, 0, 1, 1,
0.701804, -1.723475, 3.302517, 0.5960785, 0, 1, 1,
0.701957, 0.3942578, 0.7600923, 0.6039216, 0, 1, 1,
0.7033612, -0.3840754, 1.611558, 0.6078432, 0, 1, 1,
0.7053399, 1.071411, 1.152985, 0.6156863, 0, 1, 1,
0.7085617, 1.114438, 0.2159979, 0.6196079, 0, 1, 1,
0.7095548, 0.3307181, 1.310447, 0.627451, 0, 1, 1,
0.7238997, 1.139341, -1.277315, 0.6313726, 0, 1, 1,
0.7331148, 0.04424459, 1.708357, 0.6392157, 0, 1, 1,
0.7331332, 1.834966, -0.2044149, 0.6431373, 0, 1, 1,
0.7342637, 0.9037018, 1.329754, 0.6509804, 0, 1, 1,
0.7363499, 1.71527, -1.170553, 0.654902, 0, 1, 1,
0.7382095, -0.8650919, 2.072149, 0.6627451, 0, 1, 1,
0.738578, -2.190091, 2.995686, 0.6666667, 0, 1, 1,
0.7396914, 0.7472506, 1.375877, 0.6745098, 0, 1, 1,
0.7399663, 0.6608157, 0.7803651, 0.6784314, 0, 1, 1,
0.7450424, 0.428371, 2.274172, 0.6862745, 0, 1, 1,
0.7465432, 0.5513788, -0.01188938, 0.6901961, 0, 1, 1,
0.7499214, -0.5009166, 2.550445, 0.6980392, 0, 1, 1,
0.7572786, -0.1896802, 2.196196, 0.7058824, 0, 1, 1,
0.7574975, -1.005586, 2.744859, 0.7098039, 0, 1, 1,
0.7576984, 0.8748175, 1.421998, 0.7176471, 0, 1, 1,
0.7669566, 1.800234, 0.08202352, 0.7215686, 0, 1, 1,
0.7680277, -0.9016554, 1.086684, 0.7294118, 0, 1, 1,
0.7715746, -1.374675, 3.786443, 0.7333333, 0, 1, 1,
0.7804342, 0.02917008, 1.89474, 0.7411765, 0, 1, 1,
0.7833838, -0.06264871, -0.2313854, 0.7450981, 0, 1, 1,
0.787707, -0.2203522, 2.483536, 0.7529412, 0, 1, 1,
0.7905513, -0.5840744, 3.101336, 0.7568628, 0, 1, 1,
0.791253, 0.01581111, 0.9883304, 0.7647059, 0, 1, 1,
0.7951826, 1.375569, 0.01475041, 0.7686275, 0, 1, 1,
0.7999356, -0.4463512, 2.715149, 0.7764706, 0, 1, 1,
0.8029432, -0.1189707, 1.31088, 0.7803922, 0, 1, 1,
0.8041243, -1.534753, 1.877722, 0.7882353, 0, 1, 1,
0.8069407, 1.192117, -1.278366, 0.7921569, 0, 1, 1,
0.8081569, 1.413818, -0.3079067, 0.8, 0, 1, 1,
0.8233748, -1.477671, 3.502986, 0.8078431, 0, 1, 1,
0.8267605, -0.1095939, 1.095676, 0.8117647, 0, 1, 1,
0.8298855, -0.2854974, 3.157636, 0.8196079, 0, 1, 1,
0.8454506, 0.855559, 1.631994, 0.8235294, 0, 1, 1,
0.8457184, 1.876717, -0.02703792, 0.8313726, 0, 1, 1,
0.8510204, 1.043869, -0.5244956, 0.8352941, 0, 1, 1,
0.8585638, 1.052699, 0.2835561, 0.8431373, 0, 1, 1,
0.8832737, 1.023906, 0.8015066, 0.8470588, 0, 1, 1,
0.8851725, -2.648587, 4.531079, 0.854902, 0, 1, 1,
0.8995751, -0.5884528, 2.033863, 0.8588235, 0, 1, 1,
0.9031515, -0.3362263, 1.63942, 0.8666667, 0, 1, 1,
0.9036747, -1.171704, 2.857791, 0.8705882, 0, 1, 1,
0.9053324, 0.4056945, 1.583338, 0.8784314, 0, 1, 1,
0.9064221, -0.02521574, 0.1058969, 0.8823529, 0, 1, 1,
0.9085941, -0.1478286, 0.4743164, 0.8901961, 0, 1, 1,
0.9089424, 0.9743688, -0.5028927, 0.8941177, 0, 1, 1,
0.9101889, 0.3667881, 2.010162, 0.9019608, 0, 1, 1,
0.9209282, 0.1154058, 3.142978, 0.9098039, 0, 1, 1,
0.922605, 0.6475002, -0.2300289, 0.9137255, 0, 1, 1,
0.9266035, 0.04010226, 1.220049, 0.9215686, 0, 1, 1,
0.928592, 0.6026679, 0.1857498, 0.9254902, 0, 1, 1,
0.9323229, -0.3805932, 2.369631, 0.9333333, 0, 1, 1,
0.9329048, -0.07927868, 1.353722, 0.9372549, 0, 1, 1,
0.9350728, -0.008346847, 2.215278, 0.945098, 0, 1, 1,
0.9371287, -0.1754235, 2.70248, 0.9490196, 0, 1, 1,
0.9460283, 0.07578622, 3.340732, 0.9568627, 0, 1, 1,
0.947108, 1.094233, -0.385841, 0.9607843, 0, 1, 1,
0.9490791, 1.209072, 1.186195, 0.9686275, 0, 1, 1,
0.9628628, 0.6432605, 2.509225, 0.972549, 0, 1, 1,
0.965793, -0.1969383, 1.918166, 0.9803922, 0, 1, 1,
0.9685946, 0.9077123, 2.034095, 0.9843137, 0, 1, 1,
0.9696143, 0.06099493, 2.008743, 0.9921569, 0, 1, 1,
0.9716303, 1.762896, 0.239528, 0.9960784, 0, 1, 1,
0.971762, 0.3912481, 2.214625, 1, 0, 0.9960784, 1,
0.9788659, 1.171792, 0.4324453, 1, 0, 0.9882353, 1,
0.9853489, -0.3980074, 2.160563, 1, 0, 0.9843137, 1,
0.9915938, -1.412818, 2.057869, 1, 0, 0.9764706, 1,
0.9946554, -0.9082945, 2.095576, 1, 0, 0.972549, 1,
0.9956645, -0.238905, 0.8828574, 1, 0, 0.9647059, 1,
0.9966066, 0.08739502, 1.025736, 1, 0, 0.9607843, 1,
1.001496, 1.230702, -1.535912, 1, 0, 0.9529412, 1,
1.003305, 0.1410275, 1.063553, 1, 0, 0.9490196, 1,
1.005044, 0.9057763, 1.691767, 1, 0, 0.9411765, 1,
1.012944, 0.3068669, 0.6867991, 1, 0, 0.9372549, 1,
1.022323, -0.1216967, 0.5037653, 1, 0, 0.9294118, 1,
1.027696, -0.3369334, 3.099325, 1, 0, 0.9254902, 1,
1.039019, 0.3178459, 2.917418, 1, 0, 0.9176471, 1,
1.043293, 0.04678956, 1.824979, 1, 0, 0.9137255, 1,
1.0453, -0.3745837, 2.13751, 1, 0, 0.9058824, 1,
1.04685, -0.182561, 2.008711, 1, 0, 0.9019608, 1,
1.050474, 2.146122, 1.128882, 1, 0, 0.8941177, 1,
1.05118, 1.516479, 0.8873653, 1, 0, 0.8862745, 1,
1.058351, 1.600681, 0.8355206, 1, 0, 0.8823529, 1,
1.059387, -0.5584664, 1.82917, 1, 0, 0.8745098, 1,
1.061966, -0.6506829, 1.893725, 1, 0, 0.8705882, 1,
1.06272, 0.9361043, 0.2969943, 1, 0, 0.8627451, 1,
1.067009, -0.6508596, 2.710543, 1, 0, 0.8588235, 1,
1.06898, 0.844772, 0.2416135, 1, 0, 0.8509804, 1,
1.070657, 1.415008, 0.6080381, 1, 0, 0.8470588, 1,
1.071098, 1.543838, -0.5649474, 1, 0, 0.8392157, 1,
1.071687, -0.235013, 3.473687, 1, 0, 0.8352941, 1,
1.073408, 1.045362, -0.3953013, 1, 0, 0.827451, 1,
1.088429, -1.174816, 1.351522, 1, 0, 0.8235294, 1,
1.092813, -0.1476226, 0.6226615, 1, 0, 0.8156863, 1,
1.099423, -1.311036, 3.828166, 1, 0, 0.8117647, 1,
1.103713, 0.0660006, 2.140773, 1, 0, 0.8039216, 1,
1.108572, -0.3342297, 1.366595, 1, 0, 0.7960784, 1,
1.109068, -1.562413, 2.809733, 1, 0, 0.7921569, 1,
1.109742, -0.1780617, 2.795199, 1, 0, 0.7843137, 1,
1.115774, 0.6381399, 1.193905, 1, 0, 0.7803922, 1,
1.11901, 2.097702, 1.343326, 1, 0, 0.772549, 1,
1.125602, -0.1657686, 2.394403, 1, 0, 0.7686275, 1,
1.135316, 1.855975, 0.9368065, 1, 0, 0.7607843, 1,
1.137306, 1.96638, 0.7306185, 1, 0, 0.7568628, 1,
1.140095, 0.8765886, 0.4487185, 1, 0, 0.7490196, 1,
1.143802, 1.267533, 0.7266268, 1, 0, 0.7450981, 1,
1.149907, -1.164013, 1.99968, 1, 0, 0.7372549, 1,
1.150818, 0.09293661, 1.322669, 1, 0, 0.7333333, 1,
1.162769, 1.617211, 1.974822, 1, 0, 0.7254902, 1,
1.163812, 0.439376, 1.409866, 1, 0, 0.7215686, 1,
1.16732, 0.4760394, 1.695704, 1, 0, 0.7137255, 1,
1.170066, -0.7788236, 1.637068, 1, 0, 0.7098039, 1,
1.174655, -1.445114, 0.2144557, 1, 0, 0.7019608, 1,
1.176864, -0.1031174, 0.8130742, 1, 0, 0.6941177, 1,
1.178108, 0.1839967, 0.98815, 1, 0, 0.6901961, 1,
1.181296, -0.4265359, 3.230402, 1, 0, 0.682353, 1,
1.186868, -0.6561946, 1.725255, 1, 0, 0.6784314, 1,
1.199516, -0.7436982, 1.961569, 1, 0, 0.6705883, 1,
1.208015, 0.962855, 0.3626828, 1, 0, 0.6666667, 1,
1.209963, -0.7425355, 2.738662, 1, 0, 0.6588235, 1,
1.21298, 1.601075, 1.334447, 1, 0, 0.654902, 1,
1.213345, -0.5703943, 0.6202385, 1, 0, 0.6470588, 1,
1.215116, -0.1290207, 1.892704, 1, 0, 0.6431373, 1,
1.224041, -0.9522653, 3.02709, 1, 0, 0.6352941, 1,
1.226371, 0.8499371, 3.303957, 1, 0, 0.6313726, 1,
1.233905, -1.6921, 3.151861, 1, 0, 0.6235294, 1,
1.236817, -0.01879757, -0.4158033, 1, 0, 0.6196079, 1,
1.242448, -1.870668, 1.209966, 1, 0, 0.6117647, 1,
1.247815, -1.518856, 1.17607, 1, 0, 0.6078432, 1,
1.254846, 0.2581322, 1.17589, 1, 0, 0.6, 1,
1.255894, 1.534798, -0.7539988, 1, 0, 0.5921569, 1,
1.258167, 0.2535649, 0.9260287, 1, 0, 0.5882353, 1,
1.258773, 1.291551, 1.945072, 1, 0, 0.5803922, 1,
1.275779, 1.1841, 1.404431, 1, 0, 0.5764706, 1,
1.275933, -0.7258478, 1.817732, 1, 0, 0.5686275, 1,
1.281079, 0.9941837, 1.346134, 1, 0, 0.5647059, 1,
1.303467, 0.7827182, 1.793878, 1, 0, 0.5568628, 1,
1.311123, 0.9643869, 2.130299, 1, 0, 0.5529412, 1,
1.31461, -1.132174, 3.764627, 1, 0, 0.5450981, 1,
1.316297, 1.440987, 1.441484, 1, 0, 0.5411765, 1,
1.317467, 0.3592649, 2.266739, 1, 0, 0.5333334, 1,
1.320013, 0.2483095, 1.852746, 1, 0, 0.5294118, 1,
1.333044, -0.362456, 2.000163, 1, 0, 0.5215687, 1,
1.340714, -2.313257, 1.447236, 1, 0, 0.5176471, 1,
1.341831, -0.179686, 2.838624, 1, 0, 0.509804, 1,
1.344222, 1.399293, 1.176074, 1, 0, 0.5058824, 1,
1.345599, 0.6455451, 0.6149294, 1, 0, 0.4980392, 1,
1.35677, 0.00950335, 1.059712, 1, 0, 0.4901961, 1,
1.35836, 0.6468499, 0.3663418, 1, 0, 0.4862745, 1,
1.358767, 1.132194, -1.091519, 1, 0, 0.4784314, 1,
1.360596, -0.248809, -0.4520611, 1, 0, 0.4745098, 1,
1.363073, -0.2693837, 1.209798, 1, 0, 0.4666667, 1,
1.366237, 1.508053, 1.607429, 1, 0, 0.4627451, 1,
1.369799, 0.5680023, 0.4854539, 1, 0, 0.454902, 1,
1.371498, -0.6931559, 1.978673, 1, 0, 0.4509804, 1,
1.373829, -1.045136, 0.7809802, 1, 0, 0.4431373, 1,
1.381185, 1.139351, 1.321876, 1, 0, 0.4392157, 1,
1.381455, -0.3301509, 3.559806, 1, 0, 0.4313726, 1,
1.383016, 1.44142, 0.001431071, 1, 0, 0.427451, 1,
1.40926, 1.439, 1.46989, 1, 0, 0.4196078, 1,
1.421467, -0.6587083, 1.249612, 1, 0, 0.4156863, 1,
1.440502, -0.0809192, 1.33267, 1, 0, 0.4078431, 1,
1.445542, 0.8119777, 1.131624, 1, 0, 0.4039216, 1,
1.453409, 1.046915, 0.5681222, 1, 0, 0.3960784, 1,
1.455076, -0.01056379, 0.7662373, 1, 0, 0.3882353, 1,
1.460009, 0.6358229, 1.627729, 1, 0, 0.3843137, 1,
1.476939, 0.07606112, 1.314336, 1, 0, 0.3764706, 1,
1.492793, 0.2957093, 2.062168, 1, 0, 0.372549, 1,
1.509937, -0.2755374, 1.419327, 1, 0, 0.3647059, 1,
1.510165, 0.4423363, 0.8653897, 1, 0, 0.3607843, 1,
1.516777, 0.4972701, -2.190733, 1, 0, 0.3529412, 1,
1.52342, 0.2944181, 1.708542, 1, 0, 0.3490196, 1,
1.526016, 0.1081533, 2.310332, 1, 0, 0.3411765, 1,
1.555025, 1.039714, 0.8117498, 1, 0, 0.3372549, 1,
1.57014, 0.4457096, 0.2006451, 1, 0, 0.3294118, 1,
1.578318, -0.2914221, 1.268702, 1, 0, 0.3254902, 1,
1.585788, -0.6865866, 3.392194, 1, 0, 0.3176471, 1,
1.587466, 2.401524, 0.515056, 1, 0, 0.3137255, 1,
1.591327, -0.7867139, -0.6119328, 1, 0, 0.3058824, 1,
1.602199, 1.57629, 0.7511222, 1, 0, 0.2980392, 1,
1.641118, 0.3688435, 1.425879, 1, 0, 0.2941177, 1,
1.691107, -0.2632004, 0.9040691, 1, 0, 0.2862745, 1,
1.702033, 0.4931912, 1.606473, 1, 0, 0.282353, 1,
1.716645, -0.7737263, 3.230307, 1, 0, 0.2745098, 1,
1.724835, -0.5829506, 3.065832, 1, 0, 0.2705882, 1,
1.741274, 0.7002341, 1.581024, 1, 0, 0.2627451, 1,
1.744284, 0.8532847, -0.2506074, 1, 0, 0.2588235, 1,
1.746224, -0.6536199, 1.352118, 1, 0, 0.2509804, 1,
1.753405, 0.7037501, 2.356986, 1, 0, 0.2470588, 1,
1.776462, 0.7316592, 0.8646748, 1, 0, 0.2392157, 1,
1.780701, -0.1945295, 2.880733, 1, 0, 0.2352941, 1,
1.820679, 1.496105, 0.4422176, 1, 0, 0.227451, 1,
1.853267, 0.3791349, 0.6725668, 1, 0, 0.2235294, 1,
1.861953, -1.019053, 2.365284, 1, 0, 0.2156863, 1,
1.881756, -0.1026836, -0.8453736, 1, 0, 0.2117647, 1,
1.882978, 0.4154607, 2.196084, 1, 0, 0.2039216, 1,
1.938648, -0.6891205, 2.164123, 1, 0, 0.1960784, 1,
1.95405, 0.1058224, 2.398156, 1, 0, 0.1921569, 1,
1.959445, -1.380412, 3.087208, 1, 0, 0.1843137, 1,
1.981379, 1.011632, 1.662559, 1, 0, 0.1803922, 1,
1.98141, -0.4725412, 1.017866, 1, 0, 0.172549, 1,
1.989785, 0.2220613, 1.436844, 1, 0, 0.1686275, 1,
2.002396, -0.8866985, 2.158255, 1, 0, 0.1607843, 1,
2.024074, -0.192607, 3.882035, 1, 0, 0.1568628, 1,
2.025304, -0.2630624, 3.788079, 1, 0, 0.1490196, 1,
2.052245, 0.2778457, 2.450525, 1, 0, 0.145098, 1,
2.06497, -2.447703, 2.518133, 1, 0, 0.1372549, 1,
2.097382, -1.256291, 4.239461, 1, 0, 0.1333333, 1,
2.136734, -0.1564735, 1.401185, 1, 0, 0.1254902, 1,
2.192074, 0.7466272, 1.381389, 1, 0, 0.1215686, 1,
2.215295, 1.449284, 1.253857, 1, 0, 0.1137255, 1,
2.245429, 1.253229, 0.9459868, 1, 0, 0.1098039, 1,
2.262727, -1.098467, 0.98519, 1, 0, 0.1019608, 1,
2.296739, -0.5169148, 1.376193, 1, 0, 0.09411765, 1,
2.35427, -0.608571, 1.86382, 1, 0, 0.09019608, 1,
2.449481, 0.1865185, -0.3671704, 1, 0, 0.08235294, 1,
2.458466, 0.4219066, 0.4519646, 1, 0, 0.07843138, 1,
2.462433, 0.1779581, 4.321337, 1, 0, 0.07058824, 1,
2.484437, 1.195052, 0.2741578, 1, 0, 0.06666667, 1,
2.497338, 0.3534312, 1.127579, 1, 0, 0.05882353, 1,
2.523252, 0.3592908, 1.531611, 1, 0, 0.05490196, 1,
2.532635, 1.695688, 1.418011, 1, 0, 0.04705882, 1,
2.558249, 1.120197, 1.085986, 1, 0, 0.04313726, 1,
2.564885, 1.226218, 1.44564, 1, 0, 0.03529412, 1,
2.580721, -0.02215705, 1.289079, 1, 0, 0.03137255, 1,
2.584123, 0.7428318, 0.00738067, 1, 0, 0.02352941, 1,
2.617834, 0.08386584, 0.7628515, 1, 0, 0.01960784, 1,
2.759134, -1.184096, 2.95619, 1, 0, 0.01176471, 1,
2.849032, 0.3516709, 1.192353, 1, 0, 0.007843138, 1
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
-0.3456527, -3.855552, -6.671571, 0, -0.5, 0.5, 0.5,
-0.3456527, -3.855552, -6.671571, 1, -0.5, 0.5, 0.5,
-0.3456527, -3.855552, -6.671571, 1, 1.5, 0.5, 0.5,
-0.3456527, -3.855552, -6.671571, 0, 1.5, 0.5, 0.5
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
-4.623336, 0.1611578, -6.671571, 0, -0.5, 0.5, 0.5,
-4.623336, 0.1611578, -6.671571, 1, -0.5, 0.5, 0.5,
-4.623336, 0.1611578, -6.671571, 1, 1.5, 0.5, 0.5,
-4.623336, 0.1611578, -6.671571, 0, 1.5, 0.5, 0.5
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
-4.623336, -3.855552, -0.2247024, 0, -0.5, 0.5, 0.5,
-4.623336, -3.855552, -0.2247024, 1, -0.5, 0.5, 0.5,
-4.623336, -3.855552, -0.2247024, 1, 1.5, 0.5, 0.5,
-4.623336, -3.855552, -0.2247024, 0, 1.5, 0.5, 0.5
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
-3, -2.928619, -5.183832,
2, -2.928619, -5.183832,
-3, -2.928619, -5.183832,
-3, -3.083108, -5.431789,
-2, -2.928619, -5.183832,
-2, -3.083108, -5.431789,
-1, -2.928619, -5.183832,
-1, -3.083108, -5.431789,
0, -2.928619, -5.183832,
0, -3.083108, -5.431789,
1, -2.928619, -5.183832,
1, -3.083108, -5.431789,
2, -2.928619, -5.183832,
2, -3.083108, -5.431789
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
-3, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
-3, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
-3, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
-3, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5,
-2, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
-2, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
-2, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
-2, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5,
-1, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
-1, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
-1, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
-1, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5,
0, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
0, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
0, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
0, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5,
1, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
1, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
1, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
1, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5,
2, -3.392086, -5.927701, 0, -0.5, 0.5, 0.5,
2, -3.392086, -5.927701, 1, -0.5, 0.5, 0.5,
2, -3.392086, -5.927701, 1, 1.5, 0.5, 0.5,
2, -3.392086, -5.927701, 0, 1.5, 0.5, 0.5
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
-3.636178, -2, -5.183832,
-3.636178, 3, -5.183832,
-3.636178, -2, -5.183832,
-3.800705, -2, -5.431789,
-3.636178, -1, -5.183832,
-3.800705, -1, -5.431789,
-3.636178, 0, -5.183832,
-3.800705, 0, -5.431789,
-3.636178, 1, -5.183832,
-3.800705, 1, -5.431789,
-3.636178, 2, -5.183832,
-3.800705, 2, -5.431789,
-3.636178, 3, -5.183832,
-3.800705, 3, -5.431789
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
-4.129757, -2, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, -2, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, -2, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, -2, -5.927701, 0, 1.5, 0.5, 0.5,
-4.129757, -1, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, -1, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, -1, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, -1, -5.927701, 0, 1.5, 0.5, 0.5,
-4.129757, 0, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, 0, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, 0, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, 0, -5.927701, 0, 1.5, 0.5, 0.5,
-4.129757, 1, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, 1, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, 1, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, 1, -5.927701, 0, 1.5, 0.5, 0.5,
-4.129757, 2, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, 2, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, 2, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, 2, -5.927701, 0, 1.5, 0.5, 0.5,
-4.129757, 3, -5.927701, 0, -0.5, 0.5, 0.5,
-4.129757, 3, -5.927701, 1, -0.5, 0.5, 0.5,
-4.129757, 3, -5.927701, 1, 1.5, 0.5, 0.5,
-4.129757, 3, -5.927701, 0, 1.5, 0.5, 0.5
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
-3.636178, -2.928619, -4,
-3.636178, -2.928619, 4,
-3.636178, -2.928619, -4,
-3.800705, -3.083108, -4,
-3.636178, -2.928619, -2,
-3.800705, -3.083108, -2,
-3.636178, -2.928619, 0,
-3.800705, -3.083108, 0,
-3.636178, -2.928619, 2,
-3.800705, -3.083108, 2,
-3.636178, -2.928619, 4,
-3.800705, -3.083108, 4
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
-4.129757, -3.392086, -4, 0, -0.5, 0.5, 0.5,
-4.129757, -3.392086, -4, 1, -0.5, 0.5, 0.5,
-4.129757, -3.392086, -4, 1, 1.5, 0.5, 0.5,
-4.129757, -3.392086, -4, 0, 1.5, 0.5, 0.5,
-4.129757, -3.392086, -2, 0, -0.5, 0.5, 0.5,
-4.129757, -3.392086, -2, 1, -0.5, 0.5, 0.5,
-4.129757, -3.392086, -2, 1, 1.5, 0.5, 0.5,
-4.129757, -3.392086, -2, 0, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 0, 0, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 0, 1, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 0, 1, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 0, 0, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 2, 0, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 2, 1, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 2, 1, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 2, 0, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 4, 0, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 4, 1, -0.5, 0.5, 0.5,
-4.129757, -3.392086, 4, 1, 1.5, 0.5, 0.5,
-4.129757, -3.392086, 4, 0, 1.5, 0.5, 0.5
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
-3.636178, -2.928619, -5.183832,
-3.636178, 3.250935, -5.183832,
-3.636178, -2.928619, 4.734427,
-3.636178, 3.250935, 4.734427,
-3.636178, -2.928619, -5.183832,
-3.636178, -2.928619, 4.734427,
-3.636178, 3.250935, -5.183832,
-3.636178, 3.250935, 4.734427,
-3.636178, -2.928619, -5.183832,
2.944873, -2.928619, -5.183832,
-3.636178, -2.928619, 4.734427,
2.944873, -2.928619, 4.734427,
-3.636178, 3.250935, -5.183832,
2.944873, 3.250935, -5.183832,
-3.636178, 3.250935, 4.734427,
2.944873, 3.250935, 4.734427,
2.944873, -2.928619, -5.183832,
2.944873, 3.250935, -5.183832,
2.944873, -2.928619, 4.734427,
2.944873, 3.250935, 4.734427,
2.944873, -2.928619, -5.183832,
2.944873, -2.928619, 4.734427,
2.944873, 3.250935, -5.183832,
2.944873, 3.250935, 4.734427
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
var radius = 7.161494;
var distance = 31.8623;
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
mvMatrix.translate( 0.3456527, -0.1611578, 0.2247024 );
mvMatrix.scale( 1.176582, 1.253027, 0.7806962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.8623);
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


