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
-2.922527, 0.3880087, -2.258586, 1, 0, 0, 1,
-2.900209, -1.181184, -3.716019, 1, 0.007843138, 0, 1,
-2.870426, -0.5421633, -0.9475285, 1, 0.01176471, 0, 1,
-2.829079, 0.1982983, -3.221898, 1, 0.01960784, 0, 1,
-2.672327, -0.09448, -0.9290637, 1, 0.02352941, 0, 1,
-2.663443, -2.089126, -1.663251, 1, 0.03137255, 0, 1,
-2.445768, -0.6394596, -2.441517, 1, 0.03529412, 0, 1,
-2.423304, -0.6182111, -2.107018, 1, 0.04313726, 0, 1,
-2.390096, 0.4050574, -1.967944, 1, 0.04705882, 0, 1,
-2.374113, -0.3670208, -2.113372, 1, 0.05490196, 0, 1,
-2.339346, 0.03591084, -2.040152, 1, 0.05882353, 0, 1,
-2.315259, -0.6070951, 0.2658404, 1, 0.06666667, 0, 1,
-2.28369, -1.170362, -0.5054001, 1, 0.07058824, 0, 1,
-2.242799, 0.5517203, -2.222804, 1, 0.07843138, 0, 1,
-2.207573, 1.727045, -0.9861228, 1, 0.08235294, 0, 1,
-2.194544, 1.252845, -0.08230637, 1, 0.09019608, 0, 1,
-2.176758, -0.6065983, -1.394035, 1, 0.09411765, 0, 1,
-2.165099, 1.287199, -2.056741, 1, 0.1019608, 0, 1,
-2.129306, -0.01076214, -0.7311311, 1, 0.1098039, 0, 1,
-2.121774, -0.4538696, -1.53834, 1, 0.1137255, 0, 1,
-2.118329, -0.4428404, -1.705859, 1, 0.1215686, 0, 1,
-2.096839, 0.7328917, -2.225426, 1, 0.1254902, 0, 1,
-2.079227, -0.8170258, 0.7963643, 1, 0.1333333, 0, 1,
-2.058594, 2.32144, -0.4120415, 1, 0.1372549, 0, 1,
-2.043489, -0.7453839, -2.828583, 1, 0.145098, 0, 1,
-2.018933, -1.401751, -1.342863, 1, 0.1490196, 0, 1,
-1.995757, -1.556599, -3.072737, 1, 0.1568628, 0, 1,
-1.959541, -0.2335049, -1.126774, 1, 0.1607843, 0, 1,
-1.950755, 0.01017304, -2.737464, 1, 0.1686275, 0, 1,
-1.950003, -0.2701779, -2.683188, 1, 0.172549, 0, 1,
-1.937997, -1.656566, -2.135998, 1, 0.1803922, 0, 1,
-1.926992, 2.042022, -0.1348694, 1, 0.1843137, 0, 1,
-1.906053, 0.8521367, 1.028197, 1, 0.1921569, 0, 1,
-1.894031, 2.149364, -1.050041, 1, 0.1960784, 0, 1,
-1.888312, -1.426419, -1.850801, 1, 0.2039216, 0, 1,
-1.877692, 0.456693, -1.915647, 1, 0.2117647, 0, 1,
-1.863142, -1.632734, -1.445664, 1, 0.2156863, 0, 1,
-1.86101, 1.715831, -1.25776, 1, 0.2235294, 0, 1,
-1.851063, 0.9167058, -1.911295, 1, 0.227451, 0, 1,
-1.821874, 0.1243002, -2.374472, 1, 0.2352941, 0, 1,
-1.770931, -0.4419008, -1.92837, 1, 0.2392157, 0, 1,
-1.766249, 2.008909, -2.927545, 1, 0.2470588, 0, 1,
-1.729976, -0.2279443, -1.070061, 1, 0.2509804, 0, 1,
-1.722906, -0.7344767, -2.755316, 1, 0.2588235, 0, 1,
-1.722232, 0.05355997, -0.7428605, 1, 0.2627451, 0, 1,
-1.699211, 0.3132752, -0.6903124, 1, 0.2705882, 0, 1,
-1.687763, 0.1738269, -1.045876, 1, 0.2745098, 0, 1,
-1.681485, -2.091583, -2.398226, 1, 0.282353, 0, 1,
-1.671573, 0.5014014, -0.8119341, 1, 0.2862745, 0, 1,
-1.668176, 2.088441, -2.113103, 1, 0.2941177, 0, 1,
-1.659371, -0.6104863, -1.809658, 1, 0.3019608, 0, 1,
-1.659189, -0.09281135, -1.990823, 1, 0.3058824, 0, 1,
-1.647962, -0.04793924, -0.1238313, 1, 0.3137255, 0, 1,
-1.621545, 0.8786951, -1.576741, 1, 0.3176471, 0, 1,
-1.610672, 0.689045, -0.5341057, 1, 0.3254902, 0, 1,
-1.610575, 0.616249, -1.548847, 1, 0.3294118, 0, 1,
-1.608044, 1.418286, -0.6753308, 1, 0.3372549, 0, 1,
-1.607694, -0.7813426, -1.360423, 1, 0.3411765, 0, 1,
-1.587094, 0.5863431, -3.478666, 1, 0.3490196, 0, 1,
-1.586285, -0.725196, -1.546379, 1, 0.3529412, 0, 1,
-1.568327, 0.3814788, -0.02734069, 1, 0.3607843, 0, 1,
-1.56284, -0.1883422, -2.386432, 1, 0.3647059, 0, 1,
-1.532728, -0.2375592, -0.408769, 1, 0.372549, 0, 1,
-1.520535, -1.872858, -2.328176, 1, 0.3764706, 0, 1,
-1.516725, 0.5619375, -0.183557, 1, 0.3843137, 0, 1,
-1.516706, -1.03641, -3.159286, 1, 0.3882353, 0, 1,
-1.511788, 1.228185, -1.097844, 1, 0.3960784, 0, 1,
-1.505119, 0.133204, -0.3584462, 1, 0.4039216, 0, 1,
-1.49731, -0.9341637, -1.389475, 1, 0.4078431, 0, 1,
-1.481107, 1.119909, 1.146057, 1, 0.4156863, 0, 1,
-1.478922, -0.4089878, -2.903687, 1, 0.4196078, 0, 1,
-1.473861, 0.3010371, -2.6182, 1, 0.427451, 0, 1,
-1.467804, 0.2319224, 0.8785119, 1, 0.4313726, 0, 1,
-1.458562, -1.18855, -0.07791057, 1, 0.4392157, 0, 1,
-1.440307, 3.023528, -1.378651, 1, 0.4431373, 0, 1,
-1.430379, 0.639623, 0.9116639, 1, 0.4509804, 0, 1,
-1.424015, 1.004935, -0.8685634, 1, 0.454902, 0, 1,
-1.423592, 2.437189, -0.6572835, 1, 0.4627451, 0, 1,
-1.422005, 0.5953389, -1.402893, 1, 0.4666667, 0, 1,
-1.414186, -1.069135, -0.9292521, 1, 0.4745098, 0, 1,
-1.411562, 0.1252619, -2.790938, 1, 0.4784314, 0, 1,
-1.408793, -1.022591, -4.218366, 1, 0.4862745, 0, 1,
-1.402748, 0.1276515, -2.053921, 1, 0.4901961, 0, 1,
-1.381652, 2.357051, -2.019509, 1, 0.4980392, 0, 1,
-1.377931, -1.713302, -1.270667, 1, 0.5058824, 0, 1,
-1.367836, 0.4244921, 1.022733, 1, 0.509804, 0, 1,
-1.3659, -1.596424, -3.564283, 1, 0.5176471, 0, 1,
-1.36307, 0.9174039, 0.987694, 1, 0.5215687, 0, 1,
-1.357396, -0.8324769, -0.9584094, 1, 0.5294118, 0, 1,
-1.355216, -1.217364, -1.497626, 1, 0.5333334, 0, 1,
-1.351617, 2.420339, 0.4342469, 1, 0.5411765, 0, 1,
-1.351118, -1.123164, -3.287693, 1, 0.5450981, 0, 1,
-1.348984, -0.42117, -2.776188, 1, 0.5529412, 0, 1,
-1.338192, -1.356483, -1.498436, 1, 0.5568628, 0, 1,
-1.336485, 0.1493751, -1.87506, 1, 0.5647059, 0, 1,
-1.332029, 0.06299776, -1.649259, 1, 0.5686275, 0, 1,
-1.310702, 0.4853748, -2.118691, 1, 0.5764706, 0, 1,
-1.309716, -1.201682, -2.585582, 1, 0.5803922, 0, 1,
-1.304184, 2.339482, -1.43941, 1, 0.5882353, 0, 1,
-1.292833, 0.2788397, -2.695632, 1, 0.5921569, 0, 1,
-1.276977, 0.8222721, -2.09116, 1, 0.6, 0, 1,
-1.266894, -0.03060417, -3.638574, 1, 0.6078432, 0, 1,
-1.263058, -0.01682906, -1.459574, 1, 0.6117647, 0, 1,
-1.24709, -0.5055152, -3.523629, 1, 0.6196079, 0, 1,
-1.244593, -1.89082, -1.290915, 1, 0.6235294, 0, 1,
-1.238687, -0.9854448, -3.262534, 1, 0.6313726, 0, 1,
-1.222091, -0.6897982, -3.727079, 1, 0.6352941, 0, 1,
-1.217192, -0.1170916, -0.461004, 1, 0.6431373, 0, 1,
-1.216446, -0.06502958, -0.07842313, 1, 0.6470588, 0, 1,
-1.212027, -2.031649, -1.769588, 1, 0.654902, 0, 1,
-1.210916, 1.502247, -0.6673651, 1, 0.6588235, 0, 1,
-1.205148, -1.898716, -3.253666, 1, 0.6666667, 0, 1,
-1.198445, 0.08648298, -1.80776, 1, 0.6705883, 0, 1,
-1.197501, -0.422375, -3.582872, 1, 0.6784314, 0, 1,
-1.191375, -0.4639518, -2.484653, 1, 0.682353, 0, 1,
-1.187869, 2.894905, 0.7716763, 1, 0.6901961, 0, 1,
-1.187591, -0.6427281, -2.450893, 1, 0.6941177, 0, 1,
-1.184228, -2.114284, -3.448987, 1, 0.7019608, 0, 1,
-1.18046, 1.763463, -0.7686713, 1, 0.7098039, 0, 1,
-1.176846, 0.8169035, -0.5119416, 1, 0.7137255, 0, 1,
-1.17425, 0.88792, -1.157847, 1, 0.7215686, 0, 1,
-1.166548, -1.883916, -2.871433, 1, 0.7254902, 0, 1,
-1.160222, 0.3678052, -0.9815102, 1, 0.7333333, 0, 1,
-1.156599, -1.122385, -2.31071, 1, 0.7372549, 0, 1,
-1.139616, -0.2813006, -0.4593032, 1, 0.7450981, 0, 1,
-1.136723, -0.8652424, -2.8473, 1, 0.7490196, 0, 1,
-1.136639, 1.124615, -1.314554, 1, 0.7568628, 0, 1,
-1.124312, 1.030189, -1.617814, 1, 0.7607843, 0, 1,
-1.124089, -2.416257, -3.179274, 1, 0.7686275, 0, 1,
-1.119625, 0.2906314, -0.7502173, 1, 0.772549, 0, 1,
-1.117415, -0.4695666, -1.775747, 1, 0.7803922, 0, 1,
-1.11422, 0.8035161, -0.6673947, 1, 0.7843137, 0, 1,
-1.108631, -1.509447, -4.234159, 1, 0.7921569, 0, 1,
-1.092027, -1.147073, -2.996439, 1, 0.7960784, 0, 1,
-1.091272, 0.008651492, -0.2812651, 1, 0.8039216, 0, 1,
-1.086512, 0.7444466, -1.985771, 1, 0.8117647, 0, 1,
-1.076499, -0.4828439, -2.703688, 1, 0.8156863, 0, 1,
-1.065592, 1.090164, -0.7611227, 1, 0.8235294, 0, 1,
-1.046361, 0.7031766, -0.6482919, 1, 0.827451, 0, 1,
-1.044788, 0.0373065, -1.835231, 1, 0.8352941, 0, 1,
-1.042529, 1.281533, -0.09693575, 1, 0.8392157, 0, 1,
-1.03958, 0.4741287, -1.390028, 1, 0.8470588, 0, 1,
-1.034959, 0.8311277, 0.005074166, 1, 0.8509804, 0, 1,
-1.030384, 0.7423573, -1.139362, 1, 0.8588235, 0, 1,
-1.013655, -1.14013, -1.420574, 1, 0.8627451, 0, 1,
-1.007915, 0.3816994, -1.117318, 1, 0.8705882, 0, 1,
-1.007022, -1.156217, -1.121897, 1, 0.8745098, 0, 1,
-1.003227, -0.9996201, -3.412603, 1, 0.8823529, 0, 1,
-1.003222, 1.073479, -2.593716, 1, 0.8862745, 0, 1,
-1.002406, 1.534499, -1.215115, 1, 0.8941177, 0, 1,
-0.9951794, 0.8274993, 0.371346, 1, 0.8980392, 0, 1,
-0.992303, -1.694705, -2.893105, 1, 0.9058824, 0, 1,
-0.9851772, 0.4368162, -0.2869023, 1, 0.9137255, 0, 1,
-0.9834319, -0.4195294, -1.934045, 1, 0.9176471, 0, 1,
-0.9765383, 1.486707, 0.06162599, 1, 0.9254902, 0, 1,
-0.9750596, 0.1445515, -0.6219726, 1, 0.9294118, 0, 1,
-0.9660364, 2.200588, -0.9476675, 1, 0.9372549, 0, 1,
-0.9600796, -0.5678757, -2.486347, 1, 0.9411765, 0, 1,
-0.9549633, 0.7805417, -0.03133528, 1, 0.9490196, 0, 1,
-0.9407759, -0.2872847, -2.360508, 1, 0.9529412, 0, 1,
-0.9393632, -0.5977337, -2.189976, 1, 0.9607843, 0, 1,
-0.9390815, 1.11228, -0.859372, 1, 0.9647059, 0, 1,
-0.9263816, -0.6491629, -1.760982, 1, 0.972549, 0, 1,
-0.9111059, 1.269415, -1.785021, 1, 0.9764706, 0, 1,
-0.9109979, -1.153795, -2.831513, 1, 0.9843137, 0, 1,
-0.9081462, -0.2741751, -1.080378, 1, 0.9882353, 0, 1,
-0.9037182, -0.1247756, -2.510714, 1, 0.9960784, 0, 1,
-0.9002179, -0.7072226, -0.6305, 0.9960784, 1, 0, 1,
-0.8996438, -0.03402388, -3.171122, 0.9921569, 1, 0, 1,
-0.8992991, -2.260834, -2.983412, 0.9843137, 1, 0, 1,
-0.8988931, -0.3191565, -3.825676, 0.9803922, 1, 0, 1,
-0.8988311, -0.4418806, -1.117851, 0.972549, 1, 0, 1,
-0.8969256, -0.02103678, -2.86843, 0.9686275, 1, 0, 1,
-0.8924499, -0.5358334, -4.463333, 0.9607843, 1, 0, 1,
-0.8886316, -0.7602041, -0.7789995, 0.9568627, 1, 0, 1,
-0.882265, -1.413341, -2.292353, 0.9490196, 1, 0, 1,
-0.8815549, 0.7005346, -1.99491, 0.945098, 1, 0, 1,
-0.8811016, 0.4475684, -1.83954, 0.9372549, 1, 0, 1,
-0.879756, 0.4311904, -2.081396, 0.9333333, 1, 0, 1,
-0.8784351, -0.8077706, -3.338269, 0.9254902, 1, 0, 1,
-0.8714631, -1.247444, -2.726949, 0.9215686, 1, 0, 1,
-0.8705614, 0.8114638, 0.7426265, 0.9137255, 1, 0, 1,
-0.8656163, -0.9838966, -3.580445, 0.9098039, 1, 0, 1,
-0.8636104, -0.5212486, -1.097465, 0.9019608, 1, 0, 1,
-0.8610739, -1.074533, -2.824928, 0.8941177, 1, 0, 1,
-0.8586912, 1.759824, -1.891283, 0.8901961, 1, 0, 1,
-0.8581679, -0.138917, -1.995376, 0.8823529, 1, 0, 1,
-0.8539494, -0.3379795, -1.709852, 0.8784314, 1, 0, 1,
-0.847796, 0.4290032, -3.873728, 0.8705882, 1, 0, 1,
-0.840357, -0.1925126, -2.40768, 0.8666667, 1, 0, 1,
-0.8381682, -1.828115, -3.182269, 0.8588235, 1, 0, 1,
-0.8371265, 0.7202516, -2.081078, 0.854902, 1, 0, 1,
-0.8292281, -0.3217003, -2.087769, 0.8470588, 1, 0, 1,
-0.8199761, -0.3208698, -0.7310424, 0.8431373, 1, 0, 1,
-0.8133962, 2.037521, -0.5160004, 0.8352941, 1, 0, 1,
-0.8066525, -0.09953833, -1.620201, 0.8313726, 1, 0, 1,
-0.7990724, 0.07142654, -1.87298, 0.8235294, 1, 0, 1,
-0.7920543, -0.02710027, -2.639187, 0.8196079, 1, 0, 1,
-0.790496, 0.4225407, -1.380924, 0.8117647, 1, 0, 1,
-0.7830619, -0.238951, -1.899742, 0.8078431, 1, 0, 1,
-0.7822524, 1.443704, 0.6498106, 0.8, 1, 0, 1,
-0.7737115, -0.4011346, -3.011456, 0.7921569, 1, 0, 1,
-0.7656429, -0.1831296, -2.161139, 0.7882353, 1, 0, 1,
-0.7623496, -0.01173692, -0.4597131, 0.7803922, 1, 0, 1,
-0.7592413, 0.9689944, 0.3070492, 0.7764706, 1, 0, 1,
-0.7518734, 0.1538153, -0.9530276, 0.7686275, 1, 0, 1,
-0.7455142, 1.675385, -1.949123, 0.7647059, 1, 0, 1,
-0.7396873, -1.193349, -2.439358, 0.7568628, 1, 0, 1,
-0.7386535, 2.113374, 0.08784585, 0.7529412, 1, 0, 1,
-0.7377765, 0.2924331, -1.845282, 0.7450981, 1, 0, 1,
-0.7337286, -0.09018465, -2.236475, 0.7411765, 1, 0, 1,
-0.7252744, 1.004949, 0.4517604, 0.7333333, 1, 0, 1,
-0.7198507, -1.403926, -4.292922, 0.7294118, 1, 0, 1,
-0.7140881, 0.6295074, -0.8140677, 0.7215686, 1, 0, 1,
-0.7127157, 0.18519, -1.714159, 0.7176471, 1, 0, 1,
-0.7116578, 1.381878, -0.9540739, 0.7098039, 1, 0, 1,
-0.7072169, 1.438871, 0.1212449, 0.7058824, 1, 0, 1,
-0.7033235, -1.385724, -2.7271, 0.6980392, 1, 0, 1,
-0.7029973, -0.9569922, -2.864985, 0.6901961, 1, 0, 1,
-0.7022888, 0.860777, 0.56306, 0.6862745, 1, 0, 1,
-0.7003093, -0.3041064, -1.214848, 0.6784314, 1, 0, 1,
-0.6989779, 0.3257647, -1.456574, 0.6745098, 1, 0, 1,
-0.6893456, -0.2003237, -2.562164, 0.6666667, 1, 0, 1,
-0.6869738, 1.821015, -1.174118, 0.6627451, 1, 0, 1,
-0.6837423, 0.7406318, 0.3530403, 0.654902, 1, 0, 1,
-0.6834593, -1.652475, -4.159436, 0.6509804, 1, 0, 1,
-0.6832409, 1.509457, -1.477485, 0.6431373, 1, 0, 1,
-0.6751603, 2.219194, -0.6491238, 0.6392157, 1, 0, 1,
-0.6743522, 0.8139482, -0.09931103, 0.6313726, 1, 0, 1,
-0.67422, 1.820424, 0.08193915, 0.627451, 1, 0, 1,
-0.6729001, 1.110752, 0.2486169, 0.6196079, 1, 0, 1,
-0.6721185, 1.369334, 0.1600861, 0.6156863, 1, 0, 1,
-0.6686597, -0.2497438, -1.628713, 0.6078432, 1, 0, 1,
-0.6666195, -0.473867, -3.037059, 0.6039216, 1, 0, 1,
-0.6648822, -0.06811205, -0.9366859, 0.5960785, 1, 0, 1,
-0.6644938, 0.4468357, -2.825747, 0.5882353, 1, 0, 1,
-0.6576748, -0.05032782, -3.49613, 0.5843138, 1, 0, 1,
-0.6475432, -1.589418, -3.093266, 0.5764706, 1, 0, 1,
-0.6390899, 1.094002, -1.095751, 0.572549, 1, 0, 1,
-0.6378138, -0.5110462, -3.366192, 0.5647059, 1, 0, 1,
-0.6360418, 1.512759, 1.350062, 0.5607843, 1, 0, 1,
-0.6318141, 0.2210393, -2.197802, 0.5529412, 1, 0, 1,
-0.6226431, -1.018673, -2.62714, 0.5490196, 1, 0, 1,
-0.6222556, -0.9024327, -3.639884, 0.5411765, 1, 0, 1,
-0.6070262, -0.5493416, -2.848836, 0.5372549, 1, 0, 1,
-0.6064646, 2.158385, -0.149245, 0.5294118, 1, 0, 1,
-0.5955271, 1.28186, 0.4658371, 0.5254902, 1, 0, 1,
-0.5939304, -1.434398, -1.528502, 0.5176471, 1, 0, 1,
-0.5863304, -0.0409109, -1.484042, 0.5137255, 1, 0, 1,
-0.5863076, 0.5956202, 0.3813548, 0.5058824, 1, 0, 1,
-0.5854726, 1.543345, 0.2715463, 0.5019608, 1, 0, 1,
-0.5848618, 1.193006, -2.162868, 0.4941176, 1, 0, 1,
-0.5832327, -0.1353771, -2.145398, 0.4862745, 1, 0, 1,
-0.5814552, 1.164389, 0.3144835, 0.4823529, 1, 0, 1,
-0.5738711, -0.4267318, -3.083323, 0.4745098, 1, 0, 1,
-0.57354, -0.6546195, -1.812793, 0.4705882, 1, 0, 1,
-0.5667627, -1.093268, -2.364287, 0.4627451, 1, 0, 1,
-0.5659894, -0.4149758, -1.867147, 0.4588235, 1, 0, 1,
-0.5627736, 0.1330961, -0.798232, 0.4509804, 1, 0, 1,
-0.5622159, -0.1487944, -1.575854, 0.4470588, 1, 0, 1,
-0.5564596, 1.969617, -0.1121373, 0.4392157, 1, 0, 1,
-0.5507273, -0.06229041, -1.707709, 0.4352941, 1, 0, 1,
-0.5499211, 0.5572139, -0.8393399, 0.427451, 1, 0, 1,
-0.5486897, -1.709408, -3.086823, 0.4235294, 1, 0, 1,
-0.5470814, 0.9876445, -2.128698, 0.4156863, 1, 0, 1,
-0.5424342, -0.9422091, -3.533968, 0.4117647, 1, 0, 1,
-0.5412197, -0.9974926, -1.414527, 0.4039216, 1, 0, 1,
-0.5402748, -0.4070657, -2.36958, 0.3960784, 1, 0, 1,
-0.5335882, -0.5221331, -2.160406, 0.3921569, 1, 0, 1,
-0.5332575, -0.7446045, -2.23012, 0.3843137, 1, 0, 1,
-0.529346, -0.8926472, -1.194566, 0.3803922, 1, 0, 1,
-0.5264939, -1.556098, -4.101077, 0.372549, 1, 0, 1,
-0.5264269, -0.4585467, -3.560467, 0.3686275, 1, 0, 1,
-0.5256215, 0.5962894, -1.51562, 0.3607843, 1, 0, 1,
-0.5253814, 0.1620244, -2.187974, 0.3568628, 1, 0, 1,
-0.5230635, -1.62526, -4.1806, 0.3490196, 1, 0, 1,
-0.5194867, -0.1950898, -2.35076, 0.345098, 1, 0, 1,
-0.5154947, 0.07109494, -2.36322, 0.3372549, 1, 0, 1,
-0.5152388, 0.4984061, -1.218621, 0.3333333, 1, 0, 1,
-0.5149885, 0.2989059, 0.4384727, 0.3254902, 1, 0, 1,
-0.5146463, 1.799179, -1.636722, 0.3215686, 1, 0, 1,
-0.5140487, -1.170036, -3.118205, 0.3137255, 1, 0, 1,
-0.5045894, 1.477076, 0.2836568, 0.3098039, 1, 0, 1,
-0.4985025, 0.1821103, -1.240012, 0.3019608, 1, 0, 1,
-0.4980577, 0.7985709, -2.97063, 0.2941177, 1, 0, 1,
-0.4974419, 0.8616379, 0.4500538, 0.2901961, 1, 0, 1,
-0.4958078, -0.6897532, -0.9061152, 0.282353, 1, 0, 1,
-0.4948088, 1.186254, -0.8728893, 0.2784314, 1, 0, 1,
-0.4946308, 1.576571, -1.009535, 0.2705882, 1, 0, 1,
-0.4946244, -0.02164398, -0.801526, 0.2666667, 1, 0, 1,
-0.4833818, 0.6673504, 1.089965, 0.2588235, 1, 0, 1,
-0.4824138, 0.05599319, -1.522496, 0.254902, 1, 0, 1,
-0.4819597, -1.766403, -4.431111, 0.2470588, 1, 0, 1,
-0.4806534, -1.598611, -3.633809, 0.2431373, 1, 0, 1,
-0.4784107, -1.011444, -3.395283, 0.2352941, 1, 0, 1,
-0.4778654, 0.3747831, -0.3562571, 0.2313726, 1, 0, 1,
-0.4766836, -1.189164, -3.261686, 0.2235294, 1, 0, 1,
-0.4765904, 1.544293, -1.994381, 0.2196078, 1, 0, 1,
-0.4763514, -0.8833617, -4.75043, 0.2117647, 1, 0, 1,
-0.4755506, -0.145991, -1.692452, 0.2078431, 1, 0, 1,
-0.4697146, -0.61382, -2.679161, 0.2, 1, 0, 1,
-0.4649851, -0.6016659, -4.25859, 0.1921569, 1, 0, 1,
-0.4624309, -1.228618, -2.5487, 0.1882353, 1, 0, 1,
-0.4622937, 1.754483, -0.3196301, 0.1803922, 1, 0, 1,
-0.4617895, 0.2640226, -0.01442296, 0.1764706, 1, 0, 1,
-0.4529541, -0.5326927, -0.2179505, 0.1686275, 1, 0, 1,
-0.4504932, -1.415747, -2.978335, 0.1647059, 1, 0, 1,
-0.4503751, -0.1184382, -1.189235, 0.1568628, 1, 0, 1,
-0.4474825, -0.329758, -1.962968, 0.1529412, 1, 0, 1,
-0.4466323, -0.8252973, -0.6402026, 0.145098, 1, 0, 1,
-0.4462469, 1.251331, -0.7156342, 0.1411765, 1, 0, 1,
-0.4399565, -0.9473407, -2.009818, 0.1333333, 1, 0, 1,
-0.4394177, -0.2449311, -2.569893, 0.1294118, 1, 0, 1,
-0.4305237, 0.16247, -0.2197854, 0.1215686, 1, 0, 1,
-0.4302745, -0.3370995, -1.109405, 0.1176471, 1, 0, 1,
-0.4287041, 0.2380376, -1.413642, 0.1098039, 1, 0, 1,
-0.4282424, -0.9152054, -3.291601, 0.1058824, 1, 0, 1,
-0.4263754, 2.045486, -0.3416972, 0.09803922, 1, 0, 1,
-0.4248255, 0.3761474, -2.850846, 0.09019608, 1, 0, 1,
-0.4218523, 0.9143634, -1.159614, 0.08627451, 1, 0, 1,
-0.420726, -1.30884, -2.876147, 0.07843138, 1, 0, 1,
-0.4191668, 0.4133862, 0.4288634, 0.07450981, 1, 0, 1,
-0.4174969, 1.698851, 0.7980895, 0.06666667, 1, 0, 1,
-0.4155434, 0.8927568, -1.349329, 0.0627451, 1, 0, 1,
-0.4153347, 0.5718532, 0.5592922, 0.05490196, 1, 0, 1,
-0.4148183, 0.03208089, -0.2036925, 0.05098039, 1, 0, 1,
-0.4125275, -0.1613917, -2.408913, 0.04313726, 1, 0, 1,
-0.4114254, 0.1580622, -0.5693952, 0.03921569, 1, 0, 1,
-0.4102184, 1.191405, -0.6553323, 0.03137255, 1, 0, 1,
-0.4092229, -0.7888173, -4.151263, 0.02745098, 1, 0, 1,
-0.4050287, 0.1706657, -0.2378972, 0.01960784, 1, 0, 1,
-0.4031529, -0.1668639, -1.014817, 0.01568628, 1, 0, 1,
-0.4020394, 0.4837789, 0.7285497, 0.007843138, 1, 0, 1,
-0.4020114, -0.449985, -1.593547, 0.003921569, 1, 0, 1,
-0.3991854, -0.754333, -1.813135, 0, 1, 0.003921569, 1,
-0.397042, 0.04430396, -1.967314, 0, 1, 0.01176471, 1,
-0.393593, 0.3138601, -1.941651, 0, 1, 0.01568628, 1,
-0.3910432, -0.3710776, -2.047998, 0, 1, 0.02352941, 1,
-0.390702, -0.4835055, -2.594121, 0, 1, 0.02745098, 1,
-0.3784256, -1.634896, -3.356855, 0, 1, 0.03529412, 1,
-0.3782147, 0.03449059, -1.018713, 0, 1, 0.03921569, 1,
-0.3754196, -0.3935476, -2.958597, 0, 1, 0.04705882, 1,
-0.3741146, 1.677488, -1.145411, 0, 1, 0.05098039, 1,
-0.3730808, 0.1056442, -0.5354001, 0, 1, 0.05882353, 1,
-0.3712609, 1.251744, 0.9431056, 0, 1, 0.0627451, 1,
-0.3643719, -1.987766, -1.575136, 0, 1, 0.07058824, 1,
-0.3631825, -0.4529183, -2.681696, 0, 1, 0.07450981, 1,
-0.3618738, 0.6339898, -0.07027322, 0, 1, 0.08235294, 1,
-0.3610012, -1.022084, -2.167392, 0, 1, 0.08627451, 1,
-0.3553239, -0.3940836, -0.8262944, 0, 1, 0.09411765, 1,
-0.3550566, 2.967938, -0.892746, 0, 1, 0.1019608, 1,
-0.3501315, -0.06448828, -2.307574, 0, 1, 0.1058824, 1,
-0.348604, 0.09595566, -0.6719732, 0, 1, 0.1137255, 1,
-0.3453425, -0.1011789, -1.385236, 0, 1, 0.1176471, 1,
-0.3447633, -0.1915771, -1.586326, 0, 1, 0.1254902, 1,
-0.3433295, -0.8449318, -2.042265, 0, 1, 0.1294118, 1,
-0.3412125, 0.2757101, -0.9112142, 0, 1, 0.1372549, 1,
-0.3379364, 0.6010988, 0.9153126, 0, 1, 0.1411765, 1,
-0.3311259, -2.909445, -2.173283, 0, 1, 0.1490196, 1,
-0.3278666, -0.2644205, -2.638638, 0, 1, 0.1529412, 1,
-0.3254354, -0.4240868, -3.159017, 0, 1, 0.1607843, 1,
-0.3246839, 0.0639056, -1.06856, 0, 1, 0.1647059, 1,
-0.3180049, 0.3312804, -1.871085, 0, 1, 0.172549, 1,
-0.31774, 0.4188674, 0.5638638, 0, 1, 0.1764706, 1,
-0.3167208, 1.792346, 1.364126, 0, 1, 0.1843137, 1,
-0.3152824, 0.5634182, 0.5329111, 0, 1, 0.1882353, 1,
-0.306246, 1.296475, -0.8737361, 0, 1, 0.1960784, 1,
-0.3041037, 2.354446, -0.0753002, 0, 1, 0.2039216, 1,
-0.3038357, 2.209528, 1.085713, 0, 1, 0.2078431, 1,
-0.3031254, 1.052432, -1.65782, 0, 1, 0.2156863, 1,
-0.3005012, 0.01966349, -1.455721, 0, 1, 0.2196078, 1,
-0.2996325, -0.7127296, -2.691265, 0, 1, 0.227451, 1,
-0.2819483, 0.9448557, -0.1363335, 0, 1, 0.2313726, 1,
-0.2750766, -1.100991, -3.30845, 0, 1, 0.2392157, 1,
-0.2748473, -0.2813101, -3.632633, 0, 1, 0.2431373, 1,
-0.2733997, 1.869099, 1.230838, 0, 1, 0.2509804, 1,
-0.2725436, 2.706204, 1.914502, 0, 1, 0.254902, 1,
-0.2705193, 1.840156, -0.4240522, 0, 1, 0.2627451, 1,
-0.2695773, -0.5075611, -3.369961, 0, 1, 0.2666667, 1,
-0.2684474, -0.4335749, -2.438679, 0, 1, 0.2745098, 1,
-0.267128, 0.4785358, 0.05132684, 0, 1, 0.2784314, 1,
-0.2651896, 0.2303199, 0.3083562, 0, 1, 0.2862745, 1,
-0.2637944, -0.6626654, -3.350111, 0, 1, 0.2901961, 1,
-0.2627316, -0.1447033, -2.14889, 0, 1, 0.2980392, 1,
-0.2625351, -0.5022886, -1.097381, 0, 1, 0.3058824, 1,
-0.2617286, -2.691511, -3.652123, 0, 1, 0.3098039, 1,
-0.2614538, 0.8575177, -0.2375431, 0, 1, 0.3176471, 1,
-0.2597914, 1.004161, -0.0207551, 0, 1, 0.3215686, 1,
-0.2597365, 0.1827634, -2.589902, 0, 1, 0.3294118, 1,
-0.255708, 0.21114, -1.704522, 0, 1, 0.3333333, 1,
-0.2538328, -0.03241829, -0.8948994, 0, 1, 0.3411765, 1,
-0.2531292, -0.2836075, -0.2212249, 0, 1, 0.345098, 1,
-0.2503875, 0.3330038, -1.413444, 0, 1, 0.3529412, 1,
-0.2485315, 1.210587, 0.03342493, 0, 1, 0.3568628, 1,
-0.2445951, -0.3112392, -1.571173, 0, 1, 0.3647059, 1,
-0.2399532, 0.6907495, -1.188882, 0, 1, 0.3686275, 1,
-0.2379719, 0.5096464, -2.293018, 0, 1, 0.3764706, 1,
-0.2352935, -1.481234, -3.479518, 0, 1, 0.3803922, 1,
-0.2343418, 0.1523476, -0.8781517, 0, 1, 0.3882353, 1,
-0.2300264, -0.6870638, -1.761296, 0, 1, 0.3921569, 1,
-0.2296188, -0.428714, -2.090564, 0, 1, 0.4, 1,
-0.2252474, 0.140331, -1.561125, 0, 1, 0.4078431, 1,
-0.2238301, -0.8087638, -3.827508, 0, 1, 0.4117647, 1,
-0.2225749, -2.188537, -1.709393, 0, 1, 0.4196078, 1,
-0.2213258, 0.5180942, -0.5718912, 0, 1, 0.4235294, 1,
-0.2144653, -0.04721969, -3.549435, 0, 1, 0.4313726, 1,
-0.2134739, 0.07634992, -0.755836, 0, 1, 0.4352941, 1,
-0.2127267, -0.7879243, -2.796033, 0, 1, 0.4431373, 1,
-0.2107402, 0.09593029, -0.07017376, 0, 1, 0.4470588, 1,
-0.2080176, 0.06852485, 0.4437505, 0, 1, 0.454902, 1,
-0.2009006, 1.579573, -0.1855493, 0, 1, 0.4588235, 1,
-0.1981651, 0.999044, -0.6600205, 0, 1, 0.4666667, 1,
-0.1971449, 1.248079, -2.266498, 0, 1, 0.4705882, 1,
-0.1940824, -1.477265, -3.771924, 0, 1, 0.4784314, 1,
-0.1924163, 1.892742, 0.06922723, 0, 1, 0.4823529, 1,
-0.1900484, -0.2486059, -3.019848, 0, 1, 0.4901961, 1,
-0.1893796, 0.4720265, -0.8957067, 0, 1, 0.4941176, 1,
-0.1890212, -0.5964302, -3.014521, 0, 1, 0.5019608, 1,
-0.1890195, -0.3523549, -1.809383, 0, 1, 0.509804, 1,
-0.1868052, -0.6003212, -3.419879, 0, 1, 0.5137255, 1,
-0.1867388, -0.6158516, -1.381328, 0, 1, 0.5215687, 1,
-0.1866805, -0.510922, -1.402669, 0, 1, 0.5254902, 1,
-0.1857679, -0.8266661, -3.680501, 0, 1, 0.5333334, 1,
-0.1836988, -1.224193, -3.001566, 0, 1, 0.5372549, 1,
-0.1833605, 0.4601562, 0.1186465, 0, 1, 0.5450981, 1,
-0.1816381, -0.03683553, -3.335851, 0, 1, 0.5490196, 1,
-0.1789354, 0.5745344, 0.1021447, 0, 1, 0.5568628, 1,
-0.1772067, -1.124502, -2.277619, 0, 1, 0.5607843, 1,
-0.1749812, -0.2710329, -3.137633, 0, 1, 0.5686275, 1,
-0.1740218, 0.3577408, -0.1824198, 0, 1, 0.572549, 1,
-0.1724449, 0.2593967, -0.1153247, 0, 1, 0.5803922, 1,
-0.1700737, 0.6938667, 1.279611, 0, 1, 0.5843138, 1,
-0.1679675, 0.178763, -1.781532, 0, 1, 0.5921569, 1,
-0.1619597, 1.085893, 0.0006083039, 0, 1, 0.5960785, 1,
-0.1617187, 0.971067, 0.6373307, 0, 1, 0.6039216, 1,
-0.1598838, 0.6825474, -1.927648, 0, 1, 0.6117647, 1,
-0.159644, -0.3586824, -3.245785, 0, 1, 0.6156863, 1,
-0.1563844, 0.8271685, 0.1482187, 0, 1, 0.6235294, 1,
-0.1543971, 0.9178036, 1.274292, 0, 1, 0.627451, 1,
-0.1535343, -2.344564, -0.8914296, 0, 1, 0.6352941, 1,
-0.1531456, -0.7052121, -2.63081, 0, 1, 0.6392157, 1,
-0.1505079, -1.508709, -1.576865, 0, 1, 0.6470588, 1,
-0.1470705, 0.3486128, -0.4712452, 0, 1, 0.6509804, 1,
-0.1460955, 0.2570792, -1.800964, 0, 1, 0.6588235, 1,
-0.1439061, -2.238741, -2.711478, 0, 1, 0.6627451, 1,
-0.143208, 0.8547851, 0.2398984, 0, 1, 0.6705883, 1,
-0.13816, 0.6998574, 0.1031956, 0, 1, 0.6745098, 1,
-0.1329034, 0.06114711, 0.1641765, 0, 1, 0.682353, 1,
-0.1287063, 1.203116, -1.343441, 0, 1, 0.6862745, 1,
-0.1270864, 0.4662254, 1.092137, 0, 1, 0.6941177, 1,
-0.1220809, 1.693216, 0.6165237, 0, 1, 0.7019608, 1,
-0.1211755, -1.331068, -3.673444, 0, 1, 0.7058824, 1,
-0.117799, 0.3564544, -0.3175669, 0, 1, 0.7137255, 1,
-0.1158996, 0.001831542, -2.103925, 0, 1, 0.7176471, 1,
-0.1158861, -1.679769, -1.85469, 0, 1, 0.7254902, 1,
-0.1151691, 1.634649, 1.299063, 0, 1, 0.7294118, 1,
-0.1138829, 0.2147026, 1.072114, 0, 1, 0.7372549, 1,
-0.1109089, 0.5236061, 0.5386808, 0, 1, 0.7411765, 1,
-0.1103719, -0.5638601, -0.6085675, 0, 1, 0.7490196, 1,
-0.1096683, -1.173609, -3.370744, 0, 1, 0.7529412, 1,
-0.1067652, 0.01984586, -2.854605, 0, 1, 0.7607843, 1,
-0.09525929, 0.02390342, -1.79558, 0, 1, 0.7647059, 1,
-0.09476064, 0.1832548, -0.7332658, 0, 1, 0.772549, 1,
-0.09191969, -0.3453083, -3.508603, 0, 1, 0.7764706, 1,
-0.09185416, -0.5868711, -3.064867, 0, 1, 0.7843137, 1,
-0.08785383, 1.121058, -0.2220568, 0, 1, 0.7882353, 1,
-0.07876846, -0.4600327, -3.942419, 0, 1, 0.7960784, 1,
-0.07617985, 0.6599963, -0.131596, 0, 1, 0.8039216, 1,
-0.07525156, 0.6098413, -0.963324, 0, 1, 0.8078431, 1,
-0.07478988, -0.6354662, -1.816834, 0, 1, 0.8156863, 1,
-0.07410891, 0.5422047, 0.4448337, 0, 1, 0.8196079, 1,
-0.07179103, -0.3025103, -2.72436, 0, 1, 0.827451, 1,
-0.07007618, 0.08001366, -1.263979, 0, 1, 0.8313726, 1,
-0.06979031, 0.02689677, -2.438931, 0, 1, 0.8392157, 1,
-0.06768344, 0.2356927, -0.2961581, 0, 1, 0.8431373, 1,
-0.06620169, -1.752093, -3.333591, 0, 1, 0.8509804, 1,
-0.06549625, 1.070661, -0.2078501, 0, 1, 0.854902, 1,
-0.0634499, 0.2117672, 0.6167189, 0, 1, 0.8627451, 1,
-0.05654617, 0.6769806, -0.7696721, 0, 1, 0.8666667, 1,
-0.05357281, -0.802772, -2.601783, 0, 1, 0.8745098, 1,
-0.05249895, 1.19494, 0.7844498, 0, 1, 0.8784314, 1,
-0.05236011, 0.2506618, -1.447607, 0, 1, 0.8862745, 1,
-0.05121788, -1.107011, -3.694436, 0, 1, 0.8901961, 1,
-0.04444577, -0.4853495, -4.336737, 0, 1, 0.8980392, 1,
-0.04013546, 0.07002383, 0.05555302, 0, 1, 0.9058824, 1,
-0.03986303, -0.4123916, -3.020333, 0, 1, 0.9098039, 1,
-0.03697657, 0.2025615, 0.9210005, 0, 1, 0.9176471, 1,
-0.03654841, -1.409799, -2.196074, 0, 1, 0.9215686, 1,
-0.03602966, 1.365172, -0.8067838, 0, 1, 0.9294118, 1,
-0.03555698, -0.2527874, -3.163678, 0, 1, 0.9333333, 1,
-0.0330397, -0.4811256, -1.785143, 0, 1, 0.9411765, 1,
-0.02635874, -0.2794405, -3.157764, 0, 1, 0.945098, 1,
-0.02526862, 0.3155268, 0.5699233, 0, 1, 0.9529412, 1,
-0.02430512, 1.277593, 1.218445, 0, 1, 0.9568627, 1,
-0.02296069, 0.3258328, -1.836935, 0, 1, 0.9647059, 1,
-0.01742388, -1.649442, -3.504852, 0, 1, 0.9686275, 1,
-0.0126417, 0.8148927, -0.683063, 0, 1, 0.9764706, 1,
-0.01165092, 0.2004944, -0.09962282, 0, 1, 0.9803922, 1,
-0.01095759, 0.06854963, -1.972678, 0, 1, 0.9882353, 1,
-0.01028559, 1.338847, -1.457842, 0, 1, 0.9921569, 1,
-0.009847647, 0.2201395, 2.508281, 0, 1, 1, 1,
-0.008781147, -0.600149, -3.050567, 0, 0.9921569, 1, 1,
-0.002521681, -0.6583222, -3.188496, 0, 0.9882353, 1, 1,
-0.001898824, 0.2978298, -0.78502, 0, 0.9803922, 1, 1,
-6.522542e-06, -1.017871, -2.525202, 0, 0.9764706, 1, 1,
0.003626771, -0.8667212, 1.274389, 0, 0.9686275, 1, 1,
0.00659744, -0.6440582, 3.190611, 0, 0.9647059, 1, 1,
0.007218011, 0.8279249, 0.4110726, 0, 0.9568627, 1, 1,
0.008764246, -0.6164864, 3.549046, 0, 0.9529412, 1, 1,
0.01066138, 0.1498414, -0.485435, 0, 0.945098, 1, 1,
0.01078778, 2.48329, -1.723145, 0, 0.9411765, 1, 1,
0.0108136, 1.474257, -1.364516, 0, 0.9333333, 1, 1,
0.01194762, -0.370524, 4.195242, 0, 0.9294118, 1, 1,
0.0171635, -0.2020297, 3.318304, 0, 0.9215686, 1, 1,
0.01740972, 1.387277, 0.2004658, 0, 0.9176471, 1, 1,
0.0198697, 0.06541495, -0.1986018, 0, 0.9098039, 1, 1,
0.02027048, 0.1187247, 0.3982452, 0, 0.9058824, 1, 1,
0.02098411, -1.465615, 1.697507, 0, 0.8980392, 1, 1,
0.02184184, 0.4449315, -0.1007303, 0, 0.8901961, 1, 1,
0.02515583, -0.0547182, 3.105792, 0, 0.8862745, 1, 1,
0.02544402, 0.6264575, -0.4774887, 0, 0.8784314, 1, 1,
0.02774135, 0.7505703, 0.6132058, 0, 0.8745098, 1, 1,
0.03289429, -0.05539946, 3.411158, 0, 0.8666667, 1, 1,
0.03426103, -1.344906, 3.610467, 0, 0.8627451, 1, 1,
0.04181172, -0.7358832, 2.14701, 0, 0.854902, 1, 1,
0.04488135, 0.1186798, 0.3169651, 0, 0.8509804, 1, 1,
0.04508621, -0.4582748, 2.729928, 0, 0.8431373, 1, 1,
0.04524566, -0.8077697, 3.566158, 0, 0.8392157, 1, 1,
0.04936765, -0.6873904, 4.17701, 0, 0.8313726, 1, 1,
0.04967159, -1.329389, 2.639845, 0, 0.827451, 1, 1,
0.05239245, 2.084583, 1.915976, 0, 0.8196079, 1, 1,
0.05337564, 1.717665, -0.3782203, 0, 0.8156863, 1, 1,
0.0551471, 1.39194, 0.1739592, 0, 0.8078431, 1, 1,
0.06098973, 1.191905, -0.2214871, 0, 0.8039216, 1, 1,
0.06276304, -0.08764877, 1.546837, 0, 0.7960784, 1, 1,
0.06320034, 0.2037962, 0.89281, 0, 0.7882353, 1, 1,
0.06328252, 1.053444, 0.8078297, 0, 0.7843137, 1, 1,
0.06539587, -0.8659953, 3.484808, 0, 0.7764706, 1, 1,
0.06802902, 1.082829, 0.6070008, 0, 0.772549, 1, 1,
0.06855627, 1.657482, 0.3459089, 0, 0.7647059, 1, 1,
0.06863648, 0.5850735, 1.189338, 0, 0.7607843, 1, 1,
0.07031926, 0.5220225, 0.6197828, 0, 0.7529412, 1, 1,
0.07098126, -1.497073, 4.908957, 0, 0.7490196, 1, 1,
0.07296648, -1.086803, 2.278933, 0, 0.7411765, 1, 1,
0.07493893, -0.3408261, 2.101799, 0, 0.7372549, 1, 1,
0.07652726, 0.5634289, -0.3598022, 0, 0.7294118, 1, 1,
0.08264258, -0.2904356, 1.604278, 0, 0.7254902, 1, 1,
0.0831548, 0.9827005, 0.4139943, 0, 0.7176471, 1, 1,
0.08574108, -1.834838, 3.89355, 0, 0.7137255, 1, 1,
0.08986205, -0.7734868, 3.383283, 0, 0.7058824, 1, 1,
0.09014333, -0.8879098, 2.399938, 0, 0.6980392, 1, 1,
0.09026083, -0.1565458, 1.837104, 0, 0.6941177, 1, 1,
0.1009216, 0.2025175, 1.058942, 0, 0.6862745, 1, 1,
0.1010585, 0.4771404, -0.4539477, 0, 0.682353, 1, 1,
0.1043661, -0.768967, 3.567116, 0, 0.6745098, 1, 1,
0.1078945, 1.391831, -0.9499598, 0, 0.6705883, 1, 1,
0.1082804, 1.330755, -0.9087136, 0, 0.6627451, 1, 1,
0.1083933, -0.8910006, 2.946586, 0, 0.6588235, 1, 1,
0.1091137, -0.06627781, 3.085319, 0, 0.6509804, 1, 1,
0.1140998, 1.927678, 0.5527838, 0, 0.6470588, 1, 1,
0.11751, 1.974169, -0.4907749, 0, 0.6392157, 1, 1,
0.1227497, -0.3912507, 2.8341, 0, 0.6352941, 1, 1,
0.1294234, -0.2339904, 3.080437, 0, 0.627451, 1, 1,
0.1313653, 0.6306581, -1.287236, 0, 0.6235294, 1, 1,
0.1341869, 1.147638, 0.1708757, 0, 0.6156863, 1, 1,
0.1415834, 2.098586, 0.3752168, 0, 0.6117647, 1, 1,
0.1417371, 1.821573, 1.431281, 0, 0.6039216, 1, 1,
0.1430214, -2.381821, 3.530658, 0, 0.5960785, 1, 1,
0.1444036, -1.91096, 2.481107, 0, 0.5921569, 1, 1,
0.1446343, 1.320285, 1.348677, 0, 0.5843138, 1, 1,
0.1489849, -0.06475213, 4.166627, 0, 0.5803922, 1, 1,
0.1523886, 0.2698545, 2.25252, 0, 0.572549, 1, 1,
0.1647649, 0.8295578, -0.7064978, 0, 0.5686275, 1, 1,
0.1669903, -0.2330611, 2.048942, 0, 0.5607843, 1, 1,
0.1673079, 1.736757, -0.11798, 0, 0.5568628, 1, 1,
0.1731184, -1.744517, 2.934719, 0, 0.5490196, 1, 1,
0.1791956, -0.5207427, 3.501223, 0, 0.5450981, 1, 1,
0.1832071, -0.583329, 2.579522, 0, 0.5372549, 1, 1,
0.192313, 0.4992475, -0.4320827, 0, 0.5333334, 1, 1,
0.1953923, -0.3622779, 3.0107, 0, 0.5254902, 1, 1,
0.1970467, 1.767362, -0.7966317, 0, 0.5215687, 1, 1,
0.1975671, 0.5719497, 1.103692, 0, 0.5137255, 1, 1,
0.1992428, 0.6948732, 0.6633487, 0, 0.509804, 1, 1,
0.2016419, -0.2761846, 3.161759, 0, 0.5019608, 1, 1,
0.2033873, 1.654822, 0.8027412, 0, 0.4941176, 1, 1,
0.2036329, 0.5192258, 0.4003004, 0, 0.4901961, 1, 1,
0.2062406, -1.208005, 1.251795, 0, 0.4823529, 1, 1,
0.2075886, 1.509437, 0.6018676, 0, 0.4784314, 1, 1,
0.2082378, 0.3460804, -0.4429663, 0, 0.4705882, 1, 1,
0.2109589, 0.4970361, -0.8881347, 0, 0.4666667, 1, 1,
0.2113939, -0.02330926, 2.648636, 0, 0.4588235, 1, 1,
0.216717, -0.1258499, 1.692367, 0, 0.454902, 1, 1,
0.2186241, -1.071691, 2.794402, 0, 0.4470588, 1, 1,
0.2211133, -0.08079406, 3.350952, 0, 0.4431373, 1, 1,
0.2269031, 0.04746844, 1.81142, 0, 0.4352941, 1, 1,
0.2291628, 0.3137766, 0.1439124, 0, 0.4313726, 1, 1,
0.232346, 0.2736037, 0.4414468, 0, 0.4235294, 1, 1,
0.2369414, -1.200808, 3.263544, 0, 0.4196078, 1, 1,
0.2414496, -1.197291, 2.292116, 0, 0.4117647, 1, 1,
0.2422018, -0.1974451, 1.398634, 0, 0.4078431, 1, 1,
0.2423034, -0.8610762, 3.649931, 0, 0.4, 1, 1,
0.2445831, 0.1586865, 1.24995, 0, 0.3921569, 1, 1,
0.2470316, -0.06437147, 2.541531, 0, 0.3882353, 1, 1,
0.2505369, 1.878551, -0.3937881, 0, 0.3803922, 1, 1,
0.2508016, 0.7866464, -0.5915955, 0, 0.3764706, 1, 1,
0.2539901, -0.8650487, 2.610611, 0, 0.3686275, 1, 1,
0.2573383, -0.4728222, 3.897548, 0, 0.3647059, 1, 1,
0.2580783, -0.351734, 2.731378, 0, 0.3568628, 1, 1,
0.2598167, -0.4871683, 2.28558, 0, 0.3529412, 1, 1,
0.2638135, -0.6296837, 4.823943, 0, 0.345098, 1, 1,
0.2679336, 0.5030763, -2.430787, 0, 0.3411765, 1, 1,
0.2729021, 0.2781911, -0.9243131, 0, 0.3333333, 1, 1,
0.2730393, -0.1518473, 2.210784, 0, 0.3294118, 1, 1,
0.2738055, 0.3408194, -0.4248733, 0, 0.3215686, 1, 1,
0.2758808, 0.6670255, -1.05619, 0, 0.3176471, 1, 1,
0.2812136, 0.5857552, 1.871805, 0, 0.3098039, 1, 1,
0.2841899, 0.7523264, -0.8231632, 0, 0.3058824, 1, 1,
0.2893735, 1.629431, 0.498617, 0, 0.2980392, 1, 1,
0.2904071, -0.6766111, 3.193135, 0, 0.2901961, 1, 1,
0.2912053, 0.697952, 0.1722591, 0, 0.2862745, 1, 1,
0.2930091, 0.4341593, 1.703539, 0, 0.2784314, 1, 1,
0.2971604, 0.3582376, 1.235581, 0, 0.2745098, 1, 1,
0.3058074, 0.3847201, -0.4808198, 0, 0.2666667, 1, 1,
0.3076258, -1.626754, 1.305273, 0, 0.2627451, 1, 1,
0.3107991, -1.033677, 2.409602, 0, 0.254902, 1, 1,
0.311359, 0.12089, 1.217809, 0, 0.2509804, 1, 1,
0.3128077, 0.4232942, 0.7775351, 0, 0.2431373, 1, 1,
0.316815, -1.012938, 1.603047, 0, 0.2392157, 1, 1,
0.3214501, -1.67889, 1.417251, 0, 0.2313726, 1, 1,
0.3220616, -2.269728, 2.68309, 0, 0.227451, 1, 1,
0.3239033, 1.381775, -1.587425, 0, 0.2196078, 1, 1,
0.3252544, 0.06196833, 2.199979, 0, 0.2156863, 1, 1,
0.3303521, 1.516348, -1.08367, 0, 0.2078431, 1, 1,
0.3321111, 1.029846, -1.110183, 0, 0.2039216, 1, 1,
0.332769, -0.074845, 1.982728, 0, 0.1960784, 1, 1,
0.3348616, -0.08096676, 2.263959, 0, 0.1882353, 1, 1,
0.3443041, -0.9342517, 0.6529688, 0, 0.1843137, 1, 1,
0.3485303, -0.7885482, -0.6256952, 0, 0.1764706, 1, 1,
0.3488458, 1.26232, -0.03617885, 0, 0.172549, 1, 1,
0.3527144, 0.785058, -0.472212, 0, 0.1647059, 1, 1,
0.3529584, -0.02377841, 0.5889364, 0, 0.1607843, 1, 1,
0.3537124, 0.00393541, 1.202659, 0, 0.1529412, 1, 1,
0.3563283, -0.09694865, 2.097625, 0, 0.1490196, 1, 1,
0.3589043, 2.173892, -1.103726, 0, 0.1411765, 1, 1,
0.3660014, 1.17787, -0.2447776, 0, 0.1372549, 1, 1,
0.3689766, -0.3522727, 1.407006, 0, 0.1294118, 1, 1,
0.3703279, 1.007878, 1.158187, 0, 0.1254902, 1, 1,
0.3724664, 0.7706306, 2.686439, 0, 0.1176471, 1, 1,
0.3733964, 0.6814768, -0.197318, 0, 0.1137255, 1, 1,
0.3786068, -0.4474649, 1.742702, 0, 0.1058824, 1, 1,
0.3787279, 0.9700557, -0.7757965, 0, 0.09803922, 1, 1,
0.3791199, -1.107234, 1.640699, 0, 0.09411765, 1, 1,
0.3792075, 0.4439788, -2.787772, 0, 0.08627451, 1, 1,
0.3818705, -0.7673617, 2.833794, 0, 0.08235294, 1, 1,
0.3819007, 1.531294, -0.2733796, 0, 0.07450981, 1, 1,
0.3823735, -0.4817714, 1.088591, 0, 0.07058824, 1, 1,
0.3831455, -1.183994, 2.030411, 0, 0.0627451, 1, 1,
0.3831564, 0.8370816, -0.03438195, 0, 0.05882353, 1, 1,
0.3891001, 1.634565, 1.170104, 0, 0.05098039, 1, 1,
0.3919411, 0.3606552, 0.9782588, 0, 0.04705882, 1, 1,
0.3937714, -0.8106517, 3.208749, 0, 0.03921569, 1, 1,
0.3944423, -0.3097008, 2.312997, 0, 0.03529412, 1, 1,
0.4004827, -0.7962132, 4.191517, 0, 0.02745098, 1, 1,
0.4014444, -0.2844431, 3.725818, 0, 0.02352941, 1, 1,
0.4121609, -1.209383, 2.662695, 0, 0.01568628, 1, 1,
0.413509, -0.3698294, 5.725677, 0, 0.01176471, 1, 1,
0.4143276, -1.396855, 1.638733, 0, 0.003921569, 1, 1,
0.4146145, -0.3443942, 2.89644, 0.003921569, 0, 1, 1,
0.4215045, 0.3701591, 1.443544, 0.007843138, 0, 1, 1,
0.4256505, -0.3181613, 0.9819902, 0.01568628, 0, 1, 1,
0.4268552, -0.8584625, 3.392027, 0.01960784, 0, 1, 1,
0.4305745, 0.5462719, 0.1838772, 0.02745098, 0, 1, 1,
0.4345989, 0.1657612, 2.45495, 0.03137255, 0, 1, 1,
0.4346173, 0.6947526, 0.7511608, 0.03921569, 0, 1, 1,
0.435391, -0.5170466, 3.521051, 0.04313726, 0, 1, 1,
0.4356284, 0.3142769, 0.3187408, 0.05098039, 0, 1, 1,
0.4427061, -0.4976491, 1.125574, 0.05490196, 0, 1, 1,
0.4427186, -0.1201088, 1.402707, 0.0627451, 0, 1, 1,
0.4446507, 0.7374715, 0.2703019, 0.06666667, 0, 1, 1,
0.4448003, 2.988941, -0.1535914, 0.07450981, 0, 1, 1,
0.4543659, 1.949152, -1.522229, 0.07843138, 0, 1, 1,
0.458139, 0.3602965, -0.009005082, 0.08627451, 0, 1, 1,
0.4586529, -0.5271435, 1.587144, 0.09019608, 0, 1, 1,
0.4596296, -0.2005053, 2.023495, 0.09803922, 0, 1, 1,
0.4622399, 0.143796, 0.6586742, 0.1058824, 0, 1, 1,
0.4678075, 0.07342406, 0.4663669, 0.1098039, 0, 1, 1,
0.4689315, 0.2375726, 1.817835, 0.1176471, 0, 1, 1,
0.4691979, -0.4642855, 3.075117, 0.1215686, 0, 1, 1,
0.4750529, 0.2272624, 0.5144632, 0.1294118, 0, 1, 1,
0.4755349, 0.2289904, 1.46736, 0.1333333, 0, 1, 1,
0.4774508, -1.338716, 2.378596, 0.1411765, 0, 1, 1,
0.4832581, 0.02580561, 2.134933, 0.145098, 0, 1, 1,
0.4842197, 1.039057, 0.6207499, 0.1529412, 0, 1, 1,
0.4847494, 0.4578157, -0.268357, 0.1568628, 0, 1, 1,
0.4881813, 1.124396, -0.4668975, 0.1647059, 0, 1, 1,
0.4892381, 0.1562036, 2.827246, 0.1686275, 0, 1, 1,
0.4892526, -0.5302088, 2.383212, 0.1764706, 0, 1, 1,
0.4943123, 0.5611427, 0.438511, 0.1803922, 0, 1, 1,
0.495252, 0.0540961, 0.5912766, 0.1882353, 0, 1, 1,
0.4966228, -0.5411928, 5.159913, 0.1921569, 0, 1, 1,
0.5001521, 0.9395034, -0.4098438, 0.2, 0, 1, 1,
0.5003372, -0.3399596, 1.264895, 0.2078431, 0, 1, 1,
0.5053748, 2.110839, -0.7186813, 0.2117647, 0, 1, 1,
0.5096998, 0.1973454, -0.7975079, 0.2196078, 0, 1, 1,
0.5123011, 1.105838, -0.5041106, 0.2235294, 0, 1, 1,
0.5192408, 0.9384682, -1.993168, 0.2313726, 0, 1, 1,
0.5218281, 0.969157, 1.668847, 0.2352941, 0, 1, 1,
0.5234294, 0.2952857, 2.634434, 0.2431373, 0, 1, 1,
0.5257396, 1.552906, -1.058084, 0.2470588, 0, 1, 1,
0.526676, -0.009789492, 0.7532237, 0.254902, 0, 1, 1,
0.5361941, 1.598473, -1.066944, 0.2588235, 0, 1, 1,
0.5382992, -1.886427, 2.012575, 0.2666667, 0, 1, 1,
0.538999, 0.05420234, 2.278481, 0.2705882, 0, 1, 1,
0.5425847, 0.3176454, 2.144511, 0.2784314, 0, 1, 1,
0.5431995, -0.187911, 2.378647, 0.282353, 0, 1, 1,
0.5435277, 0.9185687, 1.485691, 0.2901961, 0, 1, 1,
0.5446975, -0.2650859, 2.333541, 0.2941177, 0, 1, 1,
0.5453292, -0.4683341, 0.2386713, 0.3019608, 0, 1, 1,
0.545481, 2.363401, -0.109861, 0.3098039, 0, 1, 1,
0.5461875, 0.8641244, 1.863755, 0.3137255, 0, 1, 1,
0.5475012, -0.07461374, 1.055238, 0.3215686, 0, 1, 1,
0.5498692, 0.5874579, 0.2013376, 0.3254902, 0, 1, 1,
0.5503149, 1.351969, -0.1167094, 0.3333333, 0, 1, 1,
0.5569714, -0.9805441, 3.536299, 0.3372549, 0, 1, 1,
0.5581475, 0.236415, 1.719084, 0.345098, 0, 1, 1,
0.5599872, 0.4511905, 0.827958, 0.3490196, 0, 1, 1,
0.56103, 1.930634, -0.4333182, 0.3568628, 0, 1, 1,
0.5619888, -0.8233503, 2.088724, 0.3607843, 0, 1, 1,
0.5671557, -1.074943, 0.4875205, 0.3686275, 0, 1, 1,
0.5677156, 0.8845157, 0.01290684, 0.372549, 0, 1, 1,
0.5683915, 0.1426052, 2.694144, 0.3803922, 0, 1, 1,
0.5690346, -0.2464897, 2.290103, 0.3843137, 0, 1, 1,
0.5703842, -0.09527336, 1.143878, 0.3921569, 0, 1, 1,
0.5721316, 0.8924586, 0.9920728, 0.3960784, 0, 1, 1,
0.5733356, 0.5781982, -0.4917294, 0.4039216, 0, 1, 1,
0.5762252, 0.6032302, 0.1195308, 0.4117647, 0, 1, 1,
0.5775024, 0.3488962, 2.151571, 0.4156863, 0, 1, 1,
0.5780207, 1.657937, 0.9113529, 0.4235294, 0, 1, 1,
0.5792751, 0.7890272, 0.2528014, 0.427451, 0, 1, 1,
0.5813742, -0.5474139, 2.810385, 0.4352941, 0, 1, 1,
0.5888203, 1.566138, -0.1377003, 0.4392157, 0, 1, 1,
0.5888669, 2.306648, 0.7421234, 0.4470588, 0, 1, 1,
0.592385, -1.325677, 3.010753, 0.4509804, 0, 1, 1,
0.5957151, 0.3949597, 1.708704, 0.4588235, 0, 1, 1,
0.5970274, -1.217628, 3.364158, 0.4627451, 0, 1, 1,
0.5995417, -1.453124, 4.100877, 0.4705882, 0, 1, 1,
0.6022295, -0.9885959, 3.905768, 0.4745098, 0, 1, 1,
0.6030124, -1.197871, 1.190028, 0.4823529, 0, 1, 1,
0.6033874, -0.9306633, 3.14959, 0.4862745, 0, 1, 1,
0.6123118, 0.39355, 2.608395, 0.4941176, 0, 1, 1,
0.6146306, 0.8189111, 0.6404688, 0.5019608, 0, 1, 1,
0.6181427, -0.7487394, 2.720132, 0.5058824, 0, 1, 1,
0.6191857, -0.5116159, 3.061475, 0.5137255, 0, 1, 1,
0.6273984, 1.287567, 1.082638, 0.5176471, 0, 1, 1,
0.6276795, 1.741424, 0.9147331, 0.5254902, 0, 1, 1,
0.6297153, 0.2441544, 0.9816241, 0.5294118, 0, 1, 1,
0.6315595, 0.2331547, 2.21227, 0.5372549, 0, 1, 1,
0.6321076, 1.594681, 1.900368, 0.5411765, 0, 1, 1,
0.6331951, -0.4826068, 2.2716, 0.5490196, 0, 1, 1,
0.6416194, 0.4254958, 1.495047, 0.5529412, 0, 1, 1,
0.6432694, 0.3276861, 1.742428, 0.5607843, 0, 1, 1,
0.6463403, 0.8563476, 1.096385, 0.5647059, 0, 1, 1,
0.6513106, -0.7198001, 2.229154, 0.572549, 0, 1, 1,
0.6515881, -0.9157415, 2.665166, 0.5764706, 0, 1, 1,
0.652145, 0.584754, -0.344956, 0.5843138, 0, 1, 1,
0.6535547, -1.914556, 2.755217, 0.5882353, 0, 1, 1,
0.6677262, -0.6137297, 1.119771, 0.5960785, 0, 1, 1,
0.6679081, 0.01872775, -0.58587, 0.6039216, 0, 1, 1,
0.6698657, 0.4930969, 0.8883151, 0.6078432, 0, 1, 1,
0.6699811, 0.3467878, 1.744342, 0.6156863, 0, 1, 1,
0.6714732, 0.4259014, -1.154322, 0.6196079, 0, 1, 1,
0.6856775, -0.5960178, 0.539514, 0.627451, 0, 1, 1,
0.687013, -0.7173853, 1.10961, 0.6313726, 0, 1, 1,
0.688165, 0.4535376, 0.6166016, 0.6392157, 0, 1, 1,
0.6906458, -0.6661197, 1.554801, 0.6431373, 0, 1, 1,
0.69689, 0.8546649, 0.9134325, 0.6509804, 0, 1, 1,
0.698845, 0.5506692, 0.5397645, 0.654902, 0, 1, 1,
0.7002853, -1.15988, 2.213371, 0.6627451, 0, 1, 1,
0.7019115, 0.1670148, 1.890118, 0.6666667, 0, 1, 1,
0.7023077, 0.6415427, 1.296708, 0.6745098, 0, 1, 1,
0.7035289, 1.006314, 0.6687545, 0.6784314, 0, 1, 1,
0.7059048, -0.6108218, 3.208327, 0.6862745, 0, 1, 1,
0.7069098, -1.598477, 4.688118, 0.6901961, 0, 1, 1,
0.7073447, -0.110936, 1.526967, 0.6980392, 0, 1, 1,
0.71327, 0.7073589, 1.296344, 0.7058824, 0, 1, 1,
0.7148932, 1.167964, 2.646222, 0.7098039, 0, 1, 1,
0.727811, 1.050294, -0.3406729, 0.7176471, 0, 1, 1,
0.7340479, -0.1915993, 2.835921, 0.7215686, 0, 1, 1,
0.7434378, -0.285131, 0.7228464, 0.7294118, 0, 1, 1,
0.7531261, 0.3220335, 1.922479, 0.7333333, 0, 1, 1,
0.7569301, 0.8849373, -0.1684959, 0.7411765, 0, 1, 1,
0.7594975, 0.2587963, 2.332633, 0.7450981, 0, 1, 1,
0.7597138, 1.364174, 0.3139792, 0.7529412, 0, 1, 1,
0.7629546, 0.3833786, 1.805171, 0.7568628, 0, 1, 1,
0.7655872, 0.771299, 1.553852, 0.7647059, 0, 1, 1,
0.7713116, 1.860657, -0.3489218, 0.7686275, 0, 1, 1,
0.792774, 0.1686276, 0.8577428, 0.7764706, 0, 1, 1,
0.7939516, -1.306449, 1.536077, 0.7803922, 0, 1, 1,
0.8104624, -0.7894809, 2.733034, 0.7882353, 0, 1, 1,
0.812236, 0.8901964, 3.041481, 0.7921569, 0, 1, 1,
0.8149132, -0.04834849, 0.703768, 0.8, 0, 1, 1,
0.8156627, 1.780581, 0.5237387, 0.8078431, 0, 1, 1,
0.8180796, 0.07389858, 0.7190332, 0.8117647, 0, 1, 1,
0.8235502, 0.75921, 0.3554324, 0.8196079, 0, 1, 1,
0.8239949, -0.7071666, 1.917085, 0.8235294, 0, 1, 1,
0.8256517, -0.6023132, 2.969815, 0.8313726, 0, 1, 1,
0.8311351, -1.833655, 2.677211, 0.8352941, 0, 1, 1,
0.8340629, -0.004951543, 2.085488, 0.8431373, 0, 1, 1,
0.8393999, -0.4147263, 2.136682, 0.8470588, 0, 1, 1,
0.8401673, 1.049637, -0.7340483, 0.854902, 0, 1, 1,
0.8433676, 0.1570451, 1.10227, 0.8588235, 0, 1, 1,
0.8474802, 0.009081422, 1.831851, 0.8666667, 0, 1, 1,
0.8487841, 1.4278, -0.6475682, 0.8705882, 0, 1, 1,
0.8508691, -0.3626046, 0.065455, 0.8784314, 0, 1, 1,
0.853638, -0.9938234, 1.679428, 0.8823529, 0, 1, 1,
0.8537434, 0.1759308, -0.008766133, 0.8901961, 0, 1, 1,
0.8546985, -1.026797, 3.554198, 0.8941177, 0, 1, 1,
0.8553448, -0.4130554, 1.82055, 0.9019608, 0, 1, 1,
0.8601388, -0.5429478, 1.69186, 0.9098039, 0, 1, 1,
0.8603175, -0.712791, 2.475129, 0.9137255, 0, 1, 1,
0.8607097, 0.116968, 0.4820061, 0.9215686, 0, 1, 1,
0.8631556, -0.385669, 1.784624, 0.9254902, 0, 1, 1,
0.8679467, 0.3242371, 0.9467129, 0.9333333, 0, 1, 1,
0.8702618, 0.661243, 0.4540317, 0.9372549, 0, 1, 1,
0.8777692, -1.452735, 2.538448, 0.945098, 0, 1, 1,
0.8778272, 0.02306219, 0.2203045, 0.9490196, 0, 1, 1,
0.8884386, -2.397357, 2.890353, 0.9568627, 0, 1, 1,
0.9044687, 0.5134, -0.2895102, 0.9607843, 0, 1, 1,
0.9045655, -0.7704751, 2.92359, 0.9686275, 0, 1, 1,
0.9065948, -0.3761061, 0.7633943, 0.972549, 0, 1, 1,
0.9078907, -1.450081, 1.174891, 0.9803922, 0, 1, 1,
0.9092289, 0.1189143, 1.434804, 0.9843137, 0, 1, 1,
0.9093868, -0.5804893, 2.108151, 0.9921569, 0, 1, 1,
0.9172433, 0.310762, 1.690519, 0.9960784, 0, 1, 1,
0.9174441, -0.2692945, 0.795113, 1, 0, 0.9960784, 1,
0.9377292, -1.56694, 2.477975, 1, 0, 0.9882353, 1,
0.9425579, -1.692753, 2.705383, 1, 0, 0.9843137, 1,
0.9454715, 1.054932, 0.8661595, 1, 0, 0.9764706, 1,
0.9513093, -0.4948221, 3.673631, 1, 0, 0.972549, 1,
0.9527239, -0.6913909, 2.242336, 1, 0, 0.9647059, 1,
0.9552748, 1.323648, 1.011496, 1, 0, 0.9607843, 1,
0.9557209, 1.182211, -0.07541577, 1, 0, 0.9529412, 1,
0.9610101, -0.4623269, 2.797309, 1, 0, 0.9490196, 1,
0.9630291, 1.056095, 2.431054, 1, 0, 0.9411765, 1,
0.9645946, -0.4751062, 1.999936, 1, 0, 0.9372549, 1,
0.9693155, -0.9089944, 1.239277, 1, 0, 0.9294118, 1,
0.9760819, 0.4357631, 1.350815, 1, 0, 0.9254902, 1,
0.9790088, -0.3655378, 3.434703, 1, 0, 0.9176471, 1,
0.9944801, -0.09454297, 2.701182, 1, 0, 0.9137255, 1,
0.9969118, 1.551985, -0.1891273, 1, 0, 0.9058824, 1,
0.9970443, -0.3816893, 2.451227, 1, 0, 0.9019608, 1,
0.9989624, 1.007763, 0.06278539, 1, 0, 0.8941177, 1,
1.007931, 1.989074, 0.4377007, 1, 0, 0.8862745, 1,
1.010502, -1.179655, 4.072794, 1, 0, 0.8823529, 1,
1.011287, -0.2813147, 1.258589, 1, 0, 0.8745098, 1,
1.011465, -0.9040266, 1.690543, 1, 0, 0.8705882, 1,
1.025899, 0.4093266, 1.76647, 1, 0, 0.8627451, 1,
1.041357, 1.001084, 0.1556134, 1, 0, 0.8588235, 1,
1.043935, 0.91298, 1.481772, 1, 0, 0.8509804, 1,
1.044434, 0.6936282, 2.113168, 1, 0, 0.8470588, 1,
1.046955, 0.4244306, -0.6685495, 1, 0, 0.8392157, 1,
1.064381, 0.2975468, 1.6487, 1, 0, 0.8352941, 1,
1.065132, -0.9349396, 2.924876, 1, 0, 0.827451, 1,
1.065189, -0.0476595, 2.139321, 1, 0, 0.8235294, 1,
1.071722, 0.2649978, 1.92312, 1, 0, 0.8156863, 1,
1.079485, -1.308084, 4.700039, 1, 0, 0.8117647, 1,
1.079591, 1.233472, 2.890103, 1, 0, 0.8039216, 1,
1.081953, -1.838654, 2.303173, 1, 0, 0.7960784, 1,
1.086314, -0.7577286, 1.20811, 1, 0, 0.7921569, 1,
1.088315, 0.2049097, 2.177611, 1, 0, 0.7843137, 1,
1.09317, 0.4800131, 0.5657951, 1, 0, 0.7803922, 1,
1.093499, 0.3622665, 1.225359, 1, 0, 0.772549, 1,
1.101247, 0.8986285, -0.8234766, 1, 0, 0.7686275, 1,
1.103723, 1.248919, 0.4802513, 1, 0, 0.7607843, 1,
1.109605, -1.499588, 3.381544, 1, 0, 0.7568628, 1,
1.114842, -0.4110837, 1.805034, 1, 0, 0.7490196, 1,
1.119499, 2.086403, 0.965735, 1, 0, 0.7450981, 1,
1.126321, 1.099589, 2.591495, 1, 0, 0.7372549, 1,
1.129635, -0.7481765, 2.668161, 1, 0, 0.7333333, 1,
1.130984, -0.5497005, 2.724615, 1, 0, 0.7254902, 1,
1.138173, 1.673569, -0.3348435, 1, 0, 0.7215686, 1,
1.139383, 0.2701485, 1.596027, 1, 0, 0.7137255, 1,
1.140718, 1.285765, 0.6550046, 1, 0, 0.7098039, 1,
1.166167, 1.09736, 2.841032, 1, 0, 0.7019608, 1,
1.176315, -1.557915, 1.283884, 1, 0, 0.6941177, 1,
1.178081, 0.1779182, 1.569458, 1, 0, 0.6901961, 1,
1.1815, -0.9742498, 1.834592, 1, 0, 0.682353, 1,
1.193212, -0.4808346, 2.871935, 1, 0, 0.6784314, 1,
1.19582, 0.06627279, 1.382898, 1, 0, 0.6705883, 1,
1.198649, 0.4753025, 0.2477494, 1, 0, 0.6666667, 1,
1.19908, 0.9347566, 1.477543, 1, 0, 0.6588235, 1,
1.201754, 1.746268, 2.60333, 1, 0, 0.654902, 1,
1.227881, 0.6069365, 1.03987, 1, 0, 0.6470588, 1,
1.229381, 2.055353, 0.5582407, 1, 0, 0.6431373, 1,
1.229416, 1.987626, 1.523457, 1, 0, 0.6352941, 1,
1.229874, 1.949026, 1.237023, 1, 0, 0.6313726, 1,
1.230925, -0.9892062, 2.77492, 1, 0, 0.6235294, 1,
1.232888, -1.697308, 2.537565, 1, 0, 0.6196079, 1,
1.233945, -0.9944701, 1.269513, 1, 0, 0.6117647, 1,
1.24232, 1.355838, -0.124852, 1, 0, 0.6078432, 1,
1.242768, 0.1211986, 1.335533, 1, 0, 0.6, 1,
1.243441, -0.7756574, 1.455664, 1, 0, 0.5921569, 1,
1.247965, -0.3241917, 1.411925, 1, 0, 0.5882353, 1,
1.256699, 1.296675, 1.224958, 1, 0, 0.5803922, 1,
1.25697, 0.9708505, 1.644836, 1, 0, 0.5764706, 1,
1.27186, 1.921931, 0.3592576, 1, 0, 0.5686275, 1,
1.276968, -0.6338329, 2.537975, 1, 0, 0.5647059, 1,
1.28764, -0.1693862, 0.4493248, 1, 0, 0.5568628, 1,
1.290007, -0.4088494, 2.516629, 1, 0, 0.5529412, 1,
1.29342, -0.27351, 3.339916, 1, 0, 0.5450981, 1,
1.307006, -0.6762964, 3.903789, 1, 0, 0.5411765, 1,
1.309029, -2.29837, 3.511836, 1, 0, 0.5333334, 1,
1.322399, 0.7361221, 0.03952498, 1, 0, 0.5294118, 1,
1.328602, 0.5380828, 1.806101, 1, 0, 0.5215687, 1,
1.329565, -1.28343, 0.3803217, 1, 0, 0.5176471, 1,
1.340977, -0.5056326, 2.889558, 1, 0, 0.509804, 1,
1.346211, 1.309876, 0.1791057, 1, 0, 0.5058824, 1,
1.349916, 0.9262648, 1.658919, 1, 0, 0.4980392, 1,
1.363069, -0.668431, 2.285118, 1, 0, 0.4901961, 1,
1.365476, -0.2220105, 2.630231, 1, 0, 0.4862745, 1,
1.378346, 1.122252, 1.433096, 1, 0, 0.4784314, 1,
1.395198, 0.1131417, 0.2496046, 1, 0, 0.4745098, 1,
1.398915, 1.003959, 1.304377, 1, 0, 0.4666667, 1,
1.428229, 2.4762, 1.892425, 1, 0, 0.4627451, 1,
1.441067, -1.760345, 2.42936, 1, 0, 0.454902, 1,
1.44399, -0.4539598, 2.772433, 1, 0, 0.4509804, 1,
1.444244, -0.3331949, 3.475054, 1, 0, 0.4431373, 1,
1.445915, -1.70384, 2.291374, 1, 0, 0.4392157, 1,
1.456007, 0.6076844, 3.872458, 1, 0, 0.4313726, 1,
1.484445, -0.2168729, 2.891089, 1, 0, 0.427451, 1,
1.485031, -0.2042079, 1.084862, 1, 0, 0.4196078, 1,
1.495945, -1.642108, 3.890654, 1, 0, 0.4156863, 1,
1.524808, 0.1184601, -0.5466432, 1, 0, 0.4078431, 1,
1.535185, 1.713795, -0.8337157, 1, 0, 0.4039216, 1,
1.537085, -2.209083, 3.001118, 1, 0, 0.3960784, 1,
1.546042, 0.4284387, 0.7807931, 1, 0, 0.3882353, 1,
1.568984, -0.3796137, 2.014871, 1, 0, 0.3843137, 1,
1.575276, 1.103292, -0.3057463, 1, 0, 0.3764706, 1,
1.580012, 0.8822351, 1.493939, 1, 0, 0.372549, 1,
1.581277, 0.09945288, 1.573125, 1, 0, 0.3647059, 1,
1.597729, 0.8011753, 1.129021, 1, 0, 0.3607843, 1,
1.61406, -0.05694321, 1.813661, 1, 0, 0.3529412, 1,
1.624076, -0.5250416, 1.38401, 1, 0, 0.3490196, 1,
1.648196, 0.414485, 1.88932, 1, 0, 0.3411765, 1,
1.650496, -1.419879, 1.541142, 1, 0, 0.3372549, 1,
1.658363, -0.4477446, 2.914682, 1, 0, 0.3294118, 1,
1.681407, -0.0912976, 1.427902, 1, 0, 0.3254902, 1,
1.684886, -0.469369, 1.41576, 1, 0, 0.3176471, 1,
1.689277, -1.213017, 3.22712, 1, 0, 0.3137255, 1,
1.694243, 0.4407451, 0.9504868, 1, 0, 0.3058824, 1,
1.71072, -0.9186733, 2.579482, 1, 0, 0.2980392, 1,
1.713404, 0.2194784, 1.570216, 1, 0, 0.2941177, 1,
1.730638, 0.5179307, 0.5716465, 1, 0, 0.2862745, 1,
1.732494, 0.957543, 0.8751692, 1, 0, 0.282353, 1,
1.738839, -0.1413859, 2.30029, 1, 0, 0.2745098, 1,
1.741023, 0.3350977, 2.252842, 1, 0, 0.2705882, 1,
1.75064, 0.5335548, 0.2111339, 1, 0, 0.2627451, 1,
1.759702, -1.259611, 2.223024, 1, 0, 0.2588235, 1,
1.762537, 1.399027, -0.6626927, 1, 0, 0.2509804, 1,
1.787852, -0.2585783, 3.978932, 1, 0, 0.2470588, 1,
1.814045, 1.294732, 0.5680726, 1, 0, 0.2392157, 1,
1.839616, -0.2776533, -0.3543277, 1, 0, 0.2352941, 1,
1.863678, 0.0519233, 3.842633, 1, 0, 0.227451, 1,
1.875983, -0.2875959, -0.3890725, 1, 0, 0.2235294, 1,
1.887189, -0.2824433, 0.8461155, 1, 0, 0.2156863, 1,
1.890981, 0.08261939, -0.801331, 1, 0, 0.2117647, 1,
1.896226, -1.861832, 1.039225, 1, 0, 0.2039216, 1,
1.932849, 0.5099704, 2.720725, 1, 0, 0.1960784, 1,
1.957563, 1.078234, 1.377272, 1, 0, 0.1921569, 1,
1.959195, 0.7749353, 0.9652399, 1, 0, 0.1843137, 1,
1.961435, 0.4280773, 0.131332, 1, 0, 0.1803922, 1,
1.961862, -0.1920727, -0.06125499, 1, 0, 0.172549, 1,
1.98169, 0.04399533, 4.073669, 1, 0, 0.1686275, 1,
1.983442, 2.558093, 0.5594658, 1, 0, 0.1607843, 1,
1.993632, 0.521997, -0.2640581, 1, 0, 0.1568628, 1,
1.995826, 0.8153496, 1.230519, 1, 0, 0.1490196, 1,
2.000623, -0.1721407, 1.676403, 1, 0, 0.145098, 1,
2.002226, -0.03211841, 1.19098, 1, 0, 0.1372549, 1,
2.009099, 1.121006, 0.8606426, 1, 0, 0.1333333, 1,
2.030447, -0.5496167, 1.30697, 1, 0, 0.1254902, 1,
2.052322, -0.8381624, 3.026446, 1, 0, 0.1215686, 1,
2.064647, -0.2875776, 3.866255, 1, 0, 0.1137255, 1,
2.090691, 0.1214993, 0.5278596, 1, 0, 0.1098039, 1,
2.108916, -0.4642204, 2.157992, 1, 0, 0.1019608, 1,
2.120036, 1.363194, 0.9911113, 1, 0, 0.09411765, 1,
2.231508, 1.037116, 1.306614, 1, 0, 0.09019608, 1,
2.231519, -0.791378, 1.421479, 1, 0, 0.08235294, 1,
2.290722, 0.03176785, 2.220585, 1, 0, 0.07843138, 1,
2.292505, -0.07964087, 2.395088, 1, 0, 0.07058824, 1,
2.327953, -0.03176451, 1.019962, 1, 0, 0.06666667, 1,
2.344395, 1.934082, 0.8748755, 1, 0, 0.05882353, 1,
2.389142, -1.439056, 2.248561, 1, 0, 0.05490196, 1,
2.47264, 1.370863, 0.290563, 1, 0, 0.04705882, 1,
2.491972, -0.2248864, 2.58153, 1, 0, 0.04313726, 1,
2.529096, -1.188155, 0.6126507, 1, 0, 0.03529412, 1,
2.533534, 0.7229493, 0.5506672, 1, 0, 0.03137255, 1,
2.533679, 0.5223798, 2.062422, 1, 0, 0.02352941, 1,
2.574002, -0.7984515, 0.4850594, 1, 0, 0.01960784, 1,
2.763149, -0.03026755, 0.91008, 1, 0, 0.01176471, 1,
3.220536, -0.2635932, 0.5744884, 1, 0, 0.007843138, 1
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
0.1490045, -3.915084, -6.52613, 0, -0.5, 0.5, 0.5,
0.1490045, -3.915084, -6.52613, 1, -0.5, 0.5, 0.5,
0.1490045, -3.915084, -6.52613, 1, 1.5, 0.5, 0.5,
0.1490045, -3.915084, -6.52613, 0, 1.5, 0.5, 0.5
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
-3.963776, 0.05704141, -6.52613, 0, -0.5, 0.5, 0.5,
-3.963776, 0.05704141, -6.52613, 1, -0.5, 0.5, 0.5,
-3.963776, 0.05704141, -6.52613, 1, 1.5, 0.5, 0.5,
-3.963776, 0.05704141, -6.52613, 0, 1.5, 0.5, 0.5
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
-3.963776, -3.915084, 0.4876237, 0, -0.5, 0.5, 0.5,
-3.963776, -3.915084, 0.4876237, 1, -0.5, 0.5, 0.5,
-3.963776, -3.915084, 0.4876237, 1, 1.5, 0.5, 0.5,
-3.963776, -3.915084, 0.4876237, 0, 1.5, 0.5, 0.5
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
-2, -2.99844, -4.907572,
3, -2.99844, -4.907572,
-2, -2.99844, -4.907572,
-2, -3.151214, -5.177331,
-1, -2.99844, -4.907572,
-1, -3.151214, -5.177331,
0, -2.99844, -4.907572,
0, -3.151214, -5.177331,
1, -2.99844, -4.907572,
1, -3.151214, -5.177331,
2, -2.99844, -4.907572,
2, -3.151214, -5.177331,
3, -2.99844, -4.907572,
3, -3.151214, -5.177331
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
-2, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
-2, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
-2, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
-2, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5,
-1, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
-1, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
-1, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
-1, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5,
0, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
0, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
0, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
0, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5,
1, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
1, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
1, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
1, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5,
2, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
2, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
2, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
2, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5,
3, -3.456762, -5.716851, 0, -0.5, 0.5, 0.5,
3, -3.456762, -5.716851, 1, -0.5, 0.5, 0.5,
3, -3.456762, -5.716851, 1, 1.5, 0.5, 0.5,
3, -3.456762, -5.716851, 0, 1.5, 0.5, 0.5
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
-3.014673, -2, -4.907572,
-3.014673, 3, -4.907572,
-3.014673, -2, -4.907572,
-3.172856, -2, -5.177331,
-3.014673, -1, -4.907572,
-3.172856, -1, -5.177331,
-3.014673, 0, -4.907572,
-3.172856, 0, -5.177331,
-3.014673, 1, -4.907572,
-3.172856, 1, -5.177331,
-3.014673, 2, -4.907572,
-3.172856, 2, -5.177331,
-3.014673, 3, -4.907572,
-3.172856, 3, -5.177331
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
-3.489224, -2, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, -2, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, -2, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, -2, -5.716851, 0, 1.5, 0.5, 0.5,
-3.489224, -1, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, -1, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, -1, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, -1, -5.716851, 0, 1.5, 0.5, 0.5,
-3.489224, 0, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, 0, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, 0, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, 0, -5.716851, 0, 1.5, 0.5, 0.5,
-3.489224, 1, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, 1, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, 1, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, 1, -5.716851, 0, 1.5, 0.5, 0.5,
-3.489224, 2, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, 2, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, 2, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, 2, -5.716851, 0, 1.5, 0.5, 0.5,
-3.489224, 3, -5.716851, 0, -0.5, 0.5, 0.5,
-3.489224, 3, -5.716851, 1, -0.5, 0.5, 0.5,
-3.489224, 3, -5.716851, 1, 1.5, 0.5, 0.5,
-3.489224, 3, -5.716851, 0, 1.5, 0.5, 0.5
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
-3.014673, -2.99844, -4,
-3.014673, -2.99844, 4,
-3.014673, -2.99844, -4,
-3.172856, -3.151214, -4,
-3.014673, -2.99844, -2,
-3.172856, -3.151214, -2,
-3.014673, -2.99844, 0,
-3.172856, -3.151214, 0,
-3.014673, -2.99844, 2,
-3.172856, -3.151214, 2,
-3.014673, -2.99844, 4,
-3.172856, -3.151214, 4
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
-3.489224, -3.456762, -4, 0, -0.5, 0.5, 0.5,
-3.489224, -3.456762, -4, 1, -0.5, 0.5, 0.5,
-3.489224, -3.456762, -4, 1, 1.5, 0.5, 0.5,
-3.489224, -3.456762, -4, 0, 1.5, 0.5, 0.5,
-3.489224, -3.456762, -2, 0, -0.5, 0.5, 0.5,
-3.489224, -3.456762, -2, 1, -0.5, 0.5, 0.5,
-3.489224, -3.456762, -2, 1, 1.5, 0.5, 0.5,
-3.489224, -3.456762, -2, 0, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 0, 0, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 0, 1, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 0, 1, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 0, 0, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 2, 0, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 2, 1, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 2, 1, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 2, 0, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 4, 0, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 4, 1, -0.5, 0.5, 0.5,
-3.489224, -3.456762, 4, 1, 1.5, 0.5, 0.5,
-3.489224, -3.456762, 4, 0, 1.5, 0.5, 0.5
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
-3.014673, -2.99844, -4.907572,
-3.014673, 3.112522, -4.907572,
-3.014673, -2.99844, 5.882819,
-3.014673, 3.112522, 5.882819,
-3.014673, -2.99844, -4.907572,
-3.014673, -2.99844, 5.882819,
-3.014673, 3.112522, -4.907572,
-3.014673, 3.112522, 5.882819,
-3.014673, -2.99844, -4.907572,
3.312681, -2.99844, -4.907572,
-3.014673, -2.99844, 5.882819,
3.312681, -2.99844, 5.882819,
-3.014673, 3.112522, -4.907572,
3.312681, 3.112522, -4.907572,
-3.014673, 3.112522, 5.882819,
3.312681, 3.112522, 5.882819,
3.312681, -2.99844, -4.907572,
3.312681, 3.112522, -4.907572,
3.312681, -2.99844, 5.882819,
3.312681, 3.112522, 5.882819,
3.312681, -2.99844, -4.907572,
3.312681, -2.99844, 5.882819,
3.312681, 3.112522, -4.907572,
3.312681, 3.112522, 5.882819
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
var radius = 7.433881;
var distance = 33.07417;
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
mvMatrix.translate( -0.1490045, -0.05704141, -0.4876237 );
mvMatrix.scale( 1.270303, 1.315285, 0.7448903 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.07417);
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


