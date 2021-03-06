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
-3.732016, -0.8365424, -1.319892, 1, 0, 0, 1,
-3.135111, -0.5924557, -2.232675, 1, 0.007843138, 0, 1,
-2.633781, -1.561351, -2.300485, 1, 0.01176471, 0, 1,
-2.539581, -0.2784328, -1.978681, 1, 0.01960784, 0, 1,
-2.467519, -0.7771401, 0.09730735, 1, 0.02352941, 0, 1,
-2.392722, -0.884545, -2.727112, 1, 0.03137255, 0, 1,
-2.351586, 0.4015243, -0.9342107, 1, 0.03529412, 0, 1,
-2.326048, -0.3209423, -2.332784, 1, 0.04313726, 0, 1,
-2.315842, 0.8707865, -1.613845, 1, 0.04705882, 0, 1,
-2.297456, 2.285662, -0.448314, 1, 0.05490196, 0, 1,
-2.287556, -0.9522893, -1.230855, 1, 0.05882353, 0, 1,
-2.235719, -0.2499888, 0.003601468, 1, 0.06666667, 0, 1,
-2.21528, 0.8122333, -2.096527, 1, 0.07058824, 0, 1,
-2.135133, -0.9668775, -1.788058, 1, 0.07843138, 0, 1,
-2.132396, -2.319711, -1.020383, 1, 0.08235294, 0, 1,
-2.109571, 0.20184, 1.166016, 1, 0.09019608, 0, 1,
-2.087853, -0.3635251, -3.313497, 1, 0.09411765, 0, 1,
-2.033611, 2.293628, -1.101576, 1, 0.1019608, 0, 1,
-1.998123, 0.5194599, -0.5957876, 1, 0.1098039, 0, 1,
-1.987833, -0.753404, -1.700321, 1, 0.1137255, 0, 1,
-1.968682, -0.9275284, -2.405852, 1, 0.1215686, 0, 1,
-1.927468, 0.5287241, 1.3435, 1, 0.1254902, 0, 1,
-1.914381, 0.7131147, -0.02112087, 1, 0.1333333, 0, 1,
-1.868608, 1.477671, -2.693471, 1, 0.1372549, 0, 1,
-1.850589, -0.4640476, -3.737242, 1, 0.145098, 0, 1,
-1.789694, -0.4323455, -1.806996, 1, 0.1490196, 0, 1,
-1.77492, -0.4365456, -1.256068, 1, 0.1568628, 0, 1,
-1.764054, -0.2440348, -1.540579, 1, 0.1607843, 0, 1,
-1.763643, 0.1432051, 0.5226005, 1, 0.1686275, 0, 1,
-1.744665, 0.8571582, -0.9195877, 1, 0.172549, 0, 1,
-1.741999, 1.361064, -0.07082086, 1, 0.1803922, 0, 1,
-1.7407, 0.1970033, -1.235223, 1, 0.1843137, 0, 1,
-1.739923, 1.13992, -1.081958, 1, 0.1921569, 0, 1,
-1.718377, -0.3225179, -1.445974, 1, 0.1960784, 0, 1,
-1.717106, -1.05283, -0.6072771, 1, 0.2039216, 0, 1,
-1.707767, -0.6087724, -2.178418, 1, 0.2117647, 0, 1,
-1.707624, 0.3984064, -0.5115102, 1, 0.2156863, 0, 1,
-1.705715, 0.3709571, -1.040272, 1, 0.2235294, 0, 1,
-1.704966, -0.6304196, -2.171218, 1, 0.227451, 0, 1,
-1.702469, 0.4302547, -2.383911, 1, 0.2352941, 0, 1,
-1.694899, 1.993308, -1.507726, 1, 0.2392157, 0, 1,
-1.689881, 0.1110438, -1.545087, 1, 0.2470588, 0, 1,
-1.676899, 0.9275146, -2.719963, 1, 0.2509804, 0, 1,
-1.671261, 0.407184, 0.2426924, 1, 0.2588235, 0, 1,
-1.660094, 1.575276, -0.695312, 1, 0.2627451, 0, 1,
-1.634582, 0.2153079, -1.273559, 1, 0.2705882, 0, 1,
-1.634181, 0.6497131, -1.975286, 1, 0.2745098, 0, 1,
-1.632667, 1.2856, -2.088871, 1, 0.282353, 0, 1,
-1.628861, 0.4392233, -0.5446231, 1, 0.2862745, 0, 1,
-1.597364, -0.6758124, -2.898799, 1, 0.2941177, 0, 1,
-1.586894, 0.9717603, 0.1891468, 1, 0.3019608, 0, 1,
-1.575116, 1.510911, -0.1472514, 1, 0.3058824, 0, 1,
-1.569132, -0.1930978, -1.282, 1, 0.3137255, 0, 1,
-1.564426, 0.06010243, -1.189822, 1, 0.3176471, 0, 1,
-1.56231, -1.152672, -3.997075, 1, 0.3254902, 0, 1,
-1.561936, 0.7495449, -1.628976, 1, 0.3294118, 0, 1,
-1.555184, 1.206549, -0.4854218, 1, 0.3372549, 0, 1,
-1.542089, -0.6392087, 0.4758518, 1, 0.3411765, 0, 1,
-1.522303, -2.623945, -2.827406, 1, 0.3490196, 0, 1,
-1.51767, -1.202695, -2.410555, 1, 0.3529412, 0, 1,
-1.508679, 1.070861, -1.315756, 1, 0.3607843, 0, 1,
-1.508096, -1.373163, -2.42925, 1, 0.3647059, 0, 1,
-1.501134, 0.3766222, -3.138103, 1, 0.372549, 0, 1,
-1.495046, -0.07113751, -1.413504, 1, 0.3764706, 0, 1,
-1.487658, -0.1998283, -3.408144, 1, 0.3843137, 0, 1,
-1.480758, -0.2490871, -2.440799, 1, 0.3882353, 0, 1,
-1.470426, -1.280549, -0.5751941, 1, 0.3960784, 0, 1,
-1.469893, 0.9017518, 0.9107697, 1, 0.4039216, 0, 1,
-1.462834, 0.880437, -0.6149432, 1, 0.4078431, 0, 1,
-1.458724, 0.5634414, -2.009803, 1, 0.4156863, 0, 1,
-1.432443, 0.6127653, -1.915388, 1, 0.4196078, 0, 1,
-1.431824, 0.7044201, -1.559115, 1, 0.427451, 0, 1,
-1.431802, -0.7220162, -1.605474, 1, 0.4313726, 0, 1,
-1.423727, 1.091267, -0.2519077, 1, 0.4392157, 0, 1,
-1.421025, -0.2567638, -0.7629125, 1, 0.4431373, 0, 1,
-1.414293, -1.851237, -1.592072, 1, 0.4509804, 0, 1,
-1.410386, 0.6820853, -1.145207, 1, 0.454902, 0, 1,
-1.3958, 1.0582, -0.5945923, 1, 0.4627451, 0, 1,
-1.390615, 1.977005, -1.177153, 1, 0.4666667, 0, 1,
-1.389442, 1.478853, -2.187515, 1, 0.4745098, 0, 1,
-1.371549, 1.082731, -1.271923, 1, 0.4784314, 0, 1,
-1.365398, -0.09779511, -0.06350285, 1, 0.4862745, 0, 1,
-1.337569, -0.197604, -1.802966, 1, 0.4901961, 0, 1,
-1.333946, -0.007811871, -2.569086, 1, 0.4980392, 0, 1,
-1.328197, 2.013765, -0.8784174, 1, 0.5058824, 0, 1,
-1.325184, -0.7216551, -2.087584, 1, 0.509804, 0, 1,
-1.324802, -1.470618, -0.9857234, 1, 0.5176471, 0, 1,
-1.317544, -0.9460801, -1.475191, 1, 0.5215687, 0, 1,
-1.317447, -0.1056241, -2.311754, 1, 0.5294118, 0, 1,
-1.308031, -0.2558354, -1.823546, 1, 0.5333334, 0, 1,
-1.300034, -0.8067617, -1.865736, 1, 0.5411765, 0, 1,
-1.297855, 0.8495986, -2.016201, 1, 0.5450981, 0, 1,
-1.294121, 1.603423, -0.8683696, 1, 0.5529412, 0, 1,
-1.288703, -1.917498, -3.908968, 1, 0.5568628, 0, 1,
-1.278068, 1.10659, -0.371953, 1, 0.5647059, 0, 1,
-1.277498, -1.761018, -4.423954, 1, 0.5686275, 0, 1,
-1.273249, -1.043189, -1.511494, 1, 0.5764706, 0, 1,
-1.268404, 0.1427374, -2.643384, 1, 0.5803922, 0, 1,
-1.253403, 0.6375227, -2.855579, 1, 0.5882353, 0, 1,
-1.245735, -1.076103, -0.1352214, 1, 0.5921569, 0, 1,
-1.243006, -0.323126, -1.601939, 1, 0.6, 0, 1,
-1.242424, 0.05413244, -2.130919, 1, 0.6078432, 0, 1,
-1.241571, 0.8530197, -2.483928, 1, 0.6117647, 0, 1,
-1.24002, 1.126773, -1.472759, 1, 0.6196079, 0, 1,
-1.232511, 0.2491284, -1.394872, 1, 0.6235294, 0, 1,
-1.225862, 0.1854889, -0.9148175, 1, 0.6313726, 0, 1,
-1.224592, 0.03639153, -0.212391, 1, 0.6352941, 0, 1,
-1.218796, -1.925558, -2.655292, 1, 0.6431373, 0, 1,
-1.218425, 0.0422558, -1.940262, 1, 0.6470588, 0, 1,
-1.2156, 1.013562, 0.1932215, 1, 0.654902, 0, 1,
-1.204949, -0.6417745, -1.508926, 1, 0.6588235, 0, 1,
-1.203482, 0.1248097, -2.331681, 1, 0.6666667, 0, 1,
-1.203295, 0.9544541, -2.13724, 1, 0.6705883, 0, 1,
-1.183327, -0.6595001, -1.982742, 1, 0.6784314, 0, 1,
-1.18238, -0.2035216, -1.445886, 1, 0.682353, 0, 1,
-1.162675, 0.05110943, -2.655769, 1, 0.6901961, 0, 1,
-1.154607, -0.7513314, -2.096239, 1, 0.6941177, 0, 1,
-1.153973, -0.8622053, -1.746872, 1, 0.7019608, 0, 1,
-1.148828, -0.6623257, -2.743771, 1, 0.7098039, 0, 1,
-1.138747, 1.331472, -0.8337703, 1, 0.7137255, 0, 1,
-1.131519, 0.2375869, -1.659653, 1, 0.7215686, 0, 1,
-1.128221, -1.187656, -2.222331, 1, 0.7254902, 0, 1,
-1.125389, 0.256397, -0.4228606, 1, 0.7333333, 0, 1,
-1.118526, -1.258117, -2.265594, 1, 0.7372549, 0, 1,
-1.111923, -0.5780789, -3.577681, 1, 0.7450981, 0, 1,
-1.111758, -1.571435, -1.094082, 1, 0.7490196, 0, 1,
-1.101928, 0.2478749, -1.72228, 1, 0.7568628, 0, 1,
-1.099899, -0.806641, -1.474376, 1, 0.7607843, 0, 1,
-1.092145, 0.01736764, -1.494239, 1, 0.7686275, 0, 1,
-1.091667, 1.279022, -2.678028, 1, 0.772549, 0, 1,
-1.086116, 0.6286802, -1.481567, 1, 0.7803922, 0, 1,
-1.081015, -0.5046095, -2.796583, 1, 0.7843137, 0, 1,
-1.07408, -1.159466, -1.49014, 1, 0.7921569, 0, 1,
-1.070987, 2.496941, 0.07475705, 1, 0.7960784, 0, 1,
-1.070979, -0.1674757, -1.379852, 1, 0.8039216, 0, 1,
-1.064464, 0.4009605, 0.2171439, 1, 0.8117647, 0, 1,
-1.057687, 1.086777, 0.07728974, 1, 0.8156863, 0, 1,
-1.051908, 0.06337471, -2.159315, 1, 0.8235294, 0, 1,
-1.04243, 0.3509187, -2.347164, 1, 0.827451, 0, 1,
-1.038459, 1.435833, -0.3561627, 1, 0.8352941, 0, 1,
-1.035931, -0.182755, -1.263614, 1, 0.8392157, 0, 1,
-1.027853, -1.261412, -2.042073, 1, 0.8470588, 0, 1,
-1.027048, -0.4931344, -2.901353, 1, 0.8509804, 0, 1,
-1.025785, 0.4213642, -1.127803, 1, 0.8588235, 0, 1,
-1.016363, 1.031307, -2.119431, 1, 0.8627451, 0, 1,
-1.011071, -0.8185264, -2.547113, 1, 0.8705882, 0, 1,
-1.006949, -0.4220032, -2.187589, 1, 0.8745098, 0, 1,
-0.9990837, -0.8204642, -2.428459, 1, 0.8823529, 0, 1,
-0.9940389, 0.1419089, -1.116554, 1, 0.8862745, 0, 1,
-0.990258, 1.853804, 0.4075049, 1, 0.8941177, 0, 1,
-0.9889747, 0.6658273, -1.989195, 1, 0.8980392, 0, 1,
-0.9812112, -0.07828426, -3.058188, 1, 0.9058824, 0, 1,
-0.9783651, -0.6834865, -2.54418, 1, 0.9137255, 0, 1,
-0.9735819, -1.384285, -2.382061, 1, 0.9176471, 0, 1,
-0.9711454, 0.2247577, -1.476099, 1, 0.9254902, 0, 1,
-0.9711098, 0.8207119, -1.988098, 1, 0.9294118, 0, 1,
-0.9686552, 0.4112506, -1.301977, 1, 0.9372549, 0, 1,
-0.9645247, 0.8880039, -0.02221156, 1, 0.9411765, 0, 1,
-0.9553269, -0.3831617, -0.7034977, 1, 0.9490196, 0, 1,
-0.9516826, -0.8150877, -3.337491, 1, 0.9529412, 0, 1,
-0.9503366, 0.3239789, -1.295836, 1, 0.9607843, 0, 1,
-0.9435952, -0.6203688, -0.9955828, 1, 0.9647059, 0, 1,
-0.9414065, -0.5597753, -1.721787, 1, 0.972549, 0, 1,
-0.9383672, 0.05893731, -0.7240044, 1, 0.9764706, 0, 1,
-0.9378157, -0.1850229, -2.523468, 1, 0.9843137, 0, 1,
-0.9365653, 0.07796407, 0.4482564, 1, 0.9882353, 0, 1,
-0.9353317, 0.1692111, -1.514466, 1, 0.9960784, 0, 1,
-0.9348894, -0.5741915, -2.823881, 0.9960784, 1, 0, 1,
-0.9304419, 0.6084816, -1.805233, 0.9921569, 1, 0, 1,
-0.9293986, -1.170885, -3.383838, 0.9843137, 1, 0, 1,
-0.929324, -1.235877, -3.238595, 0.9803922, 1, 0, 1,
-0.9241794, 0.9678589, -1.506201, 0.972549, 1, 0, 1,
-0.92213, 0.4621809, -1.127766, 0.9686275, 1, 0, 1,
-0.9217961, -0.4035708, -0.309483, 0.9607843, 1, 0, 1,
-0.921631, 0.708288, -1.453465, 0.9568627, 1, 0, 1,
-0.9183277, -0.09441415, -1.711654, 0.9490196, 1, 0, 1,
-0.9147395, -0.6907154, -1.054991, 0.945098, 1, 0, 1,
-0.9126855, -1.24377, -3.781108, 0.9372549, 1, 0, 1,
-0.9123135, -0.8189132, -4.145041, 0.9333333, 1, 0, 1,
-0.9100549, 1.886161, 0.8566176, 0.9254902, 1, 0, 1,
-0.9075051, 0.1496103, -0.7413051, 0.9215686, 1, 0, 1,
-0.895627, 0.6995026, -0.8349438, 0.9137255, 1, 0, 1,
-0.8926215, -0.4803422, -3.829066, 0.9098039, 1, 0, 1,
-0.8892998, -0.1926907, -3.347474, 0.9019608, 1, 0, 1,
-0.8885897, -0.9137024, -0.2466354, 0.8941177, 1, 0, 1,
-0.8822203, -1.481515, -1.690721, 0.8901961, 1, 0, 1,
-0.8795741, -1.375715, -1.198443, 0.8823529, 1, 0, 1,
-0.8793401, 0.5277464, -1.464726, 0.8784314, 1, 0, 1,
-0.8787749, 0.9450721, -0.4330051, 0.8705882, 1, 0, 1,
-0.8770358, -0.5300941, -0.7651032, 0.8666667, 1, 0, 1,
-0.8753073, 0.2592657, -0.814909, 0.8588235, 1, 0, 1,
-0.8745013, -1.61223, -3.283539, 0.854902, 1, 0, 1,
-0.8703879, -0.6997786, -2.670905, 0.8470588, 1, 0, 1,
-0.8701662, 0.8222938, -0.6021299, 0.8431373, 1, 0, 1,
-0.8660018, 0.1063193, -0.8318071, 0.8352941, 1, 0, 1,
-0.8619014, 0.2092974, -1.422612, 0.8313726, 1, 0, 1,
-0.8581455, 1.166414, -0.6501295, 0.8235294, 1, 0, 1,
-0.8557802, 0.2204534, -0.5920523, 0.8196079, 1, 0, 1,
-0.8540689, -0.7574456, -2.995564, 0.8117647, 1, 0, 1,
-0.846204, 1.369884, -0.6567588, 0.8078431, 1, 0, 1,
-0.8388423, 0.6732222, -1.071922, 0.8, 1, 0, 1,
-0.8383183, -0.09643366, 0.6220617, 0.7921569, 1, 0, 1,
-0.8367203, -0.4868462, -1.709679, 0.7882353, 1, 0, 1,
-0.8345628, -0.6560727, -0.8842674, 0.7803922, 1, 0, 1,
-0.8339092, -0.9704923, -3.397306, 0.7764706, 1, 0, 1,
-0.8321618, 0.6753063, 0.12739, 0.7686275, 1, 0, 1,
-0.830168, -1.150337, -3.184355, 0.7647059, 1, 0, 1,
-0.8245758, -0.2911063, -0.351895, 0.7568628, 1, 0, 1,
-0.8224479, 0.8164379, -1.705354, 0.7529412, 1, 0, 1,
-0.8218473, -1.043691, -3.468505, 0.7450981, 1, 0, 1,
-0.8215472, 0.127758, -0.2441347, 0.7411765, 1, 0, 1,
-0.8192264, 0.8746572, 1.576052, 0.7333333, 1, 0, 1,
-0.8184751, 1.901576, -0.368957, 0.7294118, 1, 0, 1,
-0.8168728, -0.497934, -1.971251, 0.7215686, 1, 0, 1,
-0.8154519, 0.07471585, 0.8909442, 0.7176471, 1, 0, 1,
-0.8101814, -0.5014544, -3.436698, 0.7098039, 1, 0, 1,
-0.8092211, -0.2074773, -0.8825562, 0.7058824, 1, 0, 1,
-0.8060642, -0.8296279, -3.633306, 0.6980392, 1, 0, 1,
-0.7934846, 0.3506708, -1.487949, 0.6901961, 1, 0, 1,
-0.7835682, -0.3879494, -2.804121, 0.6862745, 1, 0, 1,
-0.7705384, -0.7017275, -1.23989, 0.6784314, 1, 0, 1,
-0.7666839, -0.333789, -0.8609265, 0.6745098, 1, 0, 1,
-0.7664474, -1.736447, -1.763198, 0.6666667, 1, 0, 1,
-0.7644747, 0.2018298, -1.052302, 0.6627451, 1, 0, 1,
-0.7622819, -1.056256, -2.971152, 0.654902, 1, 0, 1,
-0.758522, -0.8617849, -2.908602, 0.6509804, 1, 0, 1,
-0.7555531, 2.335991, 0.08419538, 0.6431373, 1, 0, 1,
-0.7554471, -0.6504686, -1.064973, 0.6392157, 1, 0, 1,
-0.7549738, -0.158722, -3.03087, 0.6313726, 1, 0, 1,
-0.7511856, -1.490842, -0.1428933, 0.627451, 1, 0, 1,
-0.7485844, -1.640728, -3.623218, 0.6196079, 1, 0, 1,
-0.7477376, -0.136265, -1.484996, 0.6156863, 1, 0, 1,
-0.7437701, 1.890066, -1.070757, 0.6078432, 1, 0, 1,
-0.7424569, -0.2967723, -1.494125, 0.6039216, 1, 0, 1,
-0.7400663, 0.135111, -1.812382, 0.5960785, 1, 0, 1,
-0.7348024, -0.1520775, -2.582013, 0.5882353, 1, 0, 1,
-0.7338459, 1.510459, -0.9771488, 0.5843138, 1, 0, 1,
-0.7304286, -0.06555579, -0.9704094, 0.5764706, 1, 0, 1,
-0.7239944, 0.173703, -1.380949, 0.572549, 1, 0, 1,
-0.7228443, -0.2396269, -2.214018, 0.5647059, 1, 0, 1,
-0.7221624, -0.6704671, -2.659416, 0.5607843, 1, 0, 1,
-0.7148745, -0.4577166, -2.929551, 0.5529412, 1, 0, 1,
-0.7108485, 0.1086521, -3.105968, 0.5490196, 1, 0, 1,
-0.7104952, -1.022482, -3.015295, 0.5411765, 1, 0, 1,
-0.7064812, -0.01817344, -0.5004643, 0.5372549, 1, 0, 1,
-0.7047151, 1.308788, -1.824176, 0.5294118, 1, 0, 1,
-0.7032264, 0.1374978, -1.165017, 0.5254902, 1, 0, 1,
-0.6966717, -1.019158, -3.893736, 0.5176471, 1, 0, 1,
-0.6927335, 0.5994166, 0.002359699, 0.5137255, 1, 0, 1,
-0.6920089, -1.403758, -1.194863, 0.5058824, 1, 0, 1,
-0.6880825, -0.403216, -1.112629, 0.5019608, 1, 0, 1,
-0.6844913, 1.580388, -0.3780054, 0.4941176, 1, 0, 1,
-0.6837401, -0.7598433, -1.495568, 0.4862745, 1, 0, 1,
-0.6835667, -1.074803, -3.115368, 0.4823529, 1, 0, 1,
-0.683394, -1.077111, -4.262914, 0.4745098, 1, 0, 1,
-0.6809953, 1.563666, -1.218971, 0.4705882, 1, 0, 1,
-0.6758801, -0.3855753, -1.504588, 0.4627451, 1, 0, 1,
-0.6758795, 1.992334, 0.1437844, 0.4588235, 1, 0, 1,
-0.6699343, 1.540268, -0.1970665, 0.4509804, 1, 0, 1,
-0.6687025, 0.6344985, -0.7704457, 0.4470588, 1, 0, 1,
-0.666769, -0.2930261, -2.862841, 0.4392157, 1, 0, 1,
-0.6623021, 1.946546, 0.8010001, 0.4352941, 1, 0, 1,
-0.6622001, 0.1255323, -0.0314272, 0.427451, 1, 0, 1,
-0.6596423, 0.7466476, -1.521765, 0.4235294, 1, 0, 1,
-0.6592591, 1.172048, -0.5811031, 0.4156863, 1, 0, 1,
-0.6554235, -0.8902772, -2.50154, 0.4117647, 1, 0, 1,
-0.6545885, 0.5636542, -1.034233, 0.4039216, 1, 0, 1,
-0.6520913, -0.4872901, -3.74074, 0.3960784, 1, 0, 1,
-0.648744, -1.381296, -2.276863, 0.3921569, 1, 0, 1,
-0.6386523, -1.37011, -2.415112, 0.3843137, 1, 0, 1,
-0.6380284, 0.5036613, 0.2956991, 0.3803922, 1, 0, 1,
-0.6364822, 0.4636767, 0.4700467, 0.372549, 1, 0, 1,
-0.6349527, 1.499096, -0.9140613, 0.3686275, 1, 0, 1,
-0.6338183, 0.4558402, -2.026129, 0.3607843, 1, 0, 1,
-0.6322602, 0.3376975, -0.3930514, 0.3568628, 1, 0, 1,
-0.6257287, -0.4103159, -2.028005, 0.3490196, 1, 0, 1,
-0.6222764, -0.05289727, -1.960708, 0.345098, 1, 0, 1,
-0.619038, -0.6988917, -1.769396, 0.3372549, 1, 0, 1,
-0.6126913, -0.3342754, -1.140185, 0.3333333, 1, 0, 1,
-0.6072331, -1.553741, -3.042491, 0.3254902, 1, 0, 1,
-0.6057559, -0.166421, -0.9233815, 0.3215686, 1, 0, 1,
-0.5996408, -0.1426395, -1.228804, 0.3137255, 1, 0, 1,
-0.5954957, -0.4439732, -2.372674, 0.3098039, 1, 0, 1,
-0.5910001, 0.3528278, -1.026905, 0.3019608, 1, 0, 1,
-0.589093, -0.03767162, -3.012494, 0.2941177, 1, 0, 1,
-0.5873231, -0.4372796, -2.963917, 0.2901961, 1, 0, 1,
-0.5851604, 0.9927406, 0.5440547, 0.282353, 1, 0, 1,
-0.5825506, 0.3114558, 1.083588, 0.2784314, 1, 0, 1,
-0.5818796, -0.2414062, -1.471868, 0.2705882, 1, 0, 1,
-0.5724067, 0.5190323, -2.02513, 0.2666667, 1, 0, 1,
-0.568935, -0.2983945, -3.853245, 0.2588235, 1, 0, 1,
-0.5664669, 0.08508631, -2.372437, 0.254902, 1, 0, 1,
-0.5474512, -0.7424164, -3.425221, 0.2470588, 1, 0, 1,
-0.5474081, -0.6434719, -2.008782, 0.2431373, 1, 0, 1,
-0.5473385, -0.01972187, -1.061524, 0.2352941, 1, 0, 1,
-0.5453885, -0.8206896, -2.997655, 0.2313726, 1, 0, 1,
-0.544745, -2.216767, -2.205311, 0.2235294, 1, 0, 1,
-0.5435851, -0.2466228, -0.7381921, 0.2196078, 1, 0, 1,
-0.542297, 0.4357453, -1.594322, 0.2117647, 1, 0, 1,
-0.541534, 0.8905745, 1.023019, 0.2078431, 1, 0, 1,
-0.5383293, 0.6273285, 0.3872121, 0.2, 1, 0, 1,
-0.5379103, 1.026694, 0.6075385, 0.1921569, 1, 0, 1,
-0.5325008, -0.6337864, -2.548511, 0.1882353, 1, 0, 1,
-0.5314525, -1.051604, -2.279723, 0.1803922, 1, 0, 1,
-0.5113254, -0.05723635, -2.183681, 0.1764706, 1, 0, 1,
-0.5106875, -0.3656933, 0.4442682, 0.1686275, 1, 0, 1,
-0.50474, 1.677516, 1.722855, 0.1647059, 1, 0, 1,
-0.5030771, -1.518685, -2.190361, 0.1568628, 1, 0, 1,
-0.5027008, -0.6481158, -2.003901, 0.1529412, 1, 0, 1,
-0.4987287, -1.006735, -3.443204, 0.145098, 1, 0, 1,
-0.4982982, -1.026823, -2.568861, 0.1411765, 1, 0, 1,
-0.4939147, -0.691756, -3.386488, 0.1333333, 1, 0, 1,
-0.4928675, -0.2785515, -0.7213533, 0.1294118, 1, 0, 1,
-0.4922508, -0.04774049, -1.4, 0.1215686, 1, 0, 1,
-0.4888704, 1.393724, -0.8067307, 0.1176471, 1, 0, 1,
-0.4885472, -1.51961, -2.303705, 0.1098039, 1, 0, 1,
-0.4879972, -1.689573, -3.940103, 0.1058824, 1, 0, 1,
-0.4870428, 0.5636559, -0.05148109, 0.09803922, 1, 0, 1,
-0.4850861, 1.050745, -1.086935, 0.09019608, 1, 0, 1,
-0.4841449, 1.372776, -1.645619, 0.08627451, 1, 0, 1,
-0.4827488, -1.020948, -3.129157, 0.07843138, 1, 0, 1,
-0.4809612, -0.02190356, -2.898783, 0.07450981, 1, 0, 1,
-0.4780926, -1.615952, -2.647584, 0.06666667, 1, 0, 1,
-0.4732055, 1.17667, -0.4572938, 0.0627451, 1, 0, 1,
-0.4710279, -0.7756656, -3.036001, 0.05490196, 1, 0, 1,
-0.4553303, -0.5405825, -0.0749265, 0.05098039, 1, 0, 1,
-0.4505222, 1.181857, -1.668092, 0.04313726, 1, 0, 1,
-0.4487024, 0.2279806, -2.176002, 0.03921569, 1, 0, 1,
-0.448194, 0.6989616, -0.1619672, 0.03137255, 1, 0, 1,
-0.4475119, 0.4638515, 1.241983, 0.02745098, 1, 0, 1,
-0.4470159, 0.5435456, 0.1984168, 0.01960784, 1, 0, 1,
-0.4428275, 2.111862, -0.1351713, 0.01568628, 1, 0, 1,
-0.439261, -0.8240907, -1.275024, 0.007843138, 1, 0, 1,
-0.4381016, -1.546417, -3.229888, 0.003921569, 1, 0, 1,
-0.4379658, -0.6088657, -1.58395, 0, 1, 0.003921569, 1,
-0.4358097, -0.8487653, -1.850339, 0, 1, 0.01176471, 1,
-0.4307327, -1.366063, -2.899763, 0, 1, 0.01568628, 1,
-0.4266993, 0.6257703, -0.3910812, 0, 1, 0.02352941, 1,
-0.4235039, 1.018814, -0.1316875, 0, 1, 0.02745098, 1,
-0.4116994, -0.1534141, -1.651191, 0, 1, 0.03529412, 1,
-0.4106573, -0.9108885, -1.819371, 0, 1, 0.03921569, 1,
-0.4090624, -1.638441, -3.255108, 0, 1, 0.04705882, 1,
-0.4089599, 1.978161, -0.05435343, 0, 1, 0.05098039, 1,
-0.4019483, 0.9196024, 0.005922112, 0, 1, 0.05882353, 1,
-0.4009719, -1.280956, -2.289483, 0, 1, 0.0627451, 1,
-0.399279, 0.09598736, -2.785095, 0, 1, 0.07058824, 1,
-0.3956564, -0.5477066, -4.419083, 0, 1, 0.07450981, 1,
-0.394073, 0.9468841, 0.381882, 0, 1, 0.08235294, 1,
-0.3937307, -0.01706653, -1.351998, 0, 1, 0.08627451, 1,
-0.3914539, 2.400402, 0.6066746, 0, 1, 0.09411765, 1,
-0.3808406, 0.3350984, -1.893749, 0, 1, 0.1019608, 1,
-0.3800904, 0.3320368, -1.057736, 0, 1, 0.1058824, 1,
-0.374664, 0.8121597, 0.672411, 0, 1, 0.1137255, 1,
-0.3742292, -2.538422, -3.187171, 0, 1, 0.1176471, 1,
-0.370526, 0.03367515, -1.027169, 0, 1, 0.1254902, 1,
-0.3602491, 0.07003112, -0.746263, 0, 1, 0.1294118, 1,
-0.3576624, -1.186106, -3.226202, 0, 1, 0.1372549, 1,
-0.3541178, -0.6503685, -3.411821, 0, 1, 0.1411765, 1,
-0.3532661, -1.455458, -1.594597, 0, 1, 0.1490196, 1,
-0.3512416, -1.429593, -1.947915, 0, 1, 0.1529412, 1,
-0.3476763, -0.7426561, -1.776251, 0, 1, 0.1607843, 1,
-0.3390601, 1.275732, -0.6281127, 0, 1, 0.1647059, 1,
-0.3351846, 0.4180208, 0.1048503, 0, 1, 0.172549, 1,
-0.3348627, -0.4007307, -2.192206, 0, 1, 0.1764706, 1,
-0.33413, 1.094943, -0.3992112, 0, 1, 0.1843137, 1,
-0.3318678, -0.7167224, -1.228089, 0, 1, 0.1882353, 1,
-0.3283621, -0.5299757, -3.492179, 0, 1, 0.1960784, 1,
-0.3274393, -0.8547193, -2.106308, 0, 1, 0.2039216, 1,
-0.3267466, 0.2426995, -0.585465, 0, 1, 0.2078431, 1,
-0.3241459, -1.393127, -3.10627, 0, 1, 0.2156863, 1,
-0.3239257, 0.4840237, 0.5067056, 0, 1, 0.2196078, 1,
-0.3185523, 1.172544, -0.878368, 0, 1, 0.227451, 1,
-0.318296, -0.7123309, -3.6257, 0, 1, 0.2313726, 1,
-0.3180614, -0.7013609, -2.50209, 0, 1, 0.2392157, 1,
-0.3150849, 2.227299, -0.9775554, 0, 1, 0.2431373, 1,
-0.3149629, -0.9888073, -3.76418, 0, 1, 0.2509804, 1,
-0.3147753, -0.8352357, -3.31308, 0, 1, 0.254902, 1,
-0.3121796, 0.001927611, -2.918613, 0, 1, 0.2627451, 1,
-0.3088505, -0.7887619, -3.55906, 0, 1, 0.2666667, 1,
-0.30852, 1.503146, -0.6865776, 0, 1, 0.2745098, 1,
-0.3018017, -0.3353458, -2.329799, 0, 1, 0.2784314, 1,
-0.2967067, -1.226705, -3.606658, 0, 1, 0.2862745, 1,
-0.294, -2.604181, -2.756426, 0, 1, 0.2901961, 1,
-0.2916602, 0.5639549, 1.225524, 0, 1, 0.2980392, 1,
-0.2875961, 0.1217086, -0.06665381, 0, 1, 0.3058824, 1,
-0.2816759, 0.5214885, 0.5001838, 0, 1, 0.3098039, 1,
-0.2795483, 0.6139929, -0.6329272, 0, 1, 0.3176471, 1,
-0.275906, 1.166627, -1.465253, 0, 1, 0.3215686, 1,
-0.2757886, -0.255845, -0.7664441, 0, 1, 0.3294118, 1,
-0.2757095, -1.358167, -2.622497, 0, 1, 0.3333333, 1,
-0.2681155, 0.108805, -3.199688, 0, 1, 0.3411765, 1,
-0.2674777, 0.6356795, -2.436551, 0, 1, 0.345098, 1,
-0.2648509, 0.6998081, 0.7366266, 0, 1, 0.3529412, 1,
-0.2608687, 0.6695651, -0.6682452, 0, 1, 0.3568628, 1,
-0.2594481, -0.1480871, -3.00387, 0, 1, 0.3647059, 1,
-0.2525542, 1.204968, -1.910507, 0, 1, 0.3686275, 1,
-0.2510397, 0.002527301, -3.532404, 0, 1, 0.3764706, 1,
-0.2460405, -0.386044, -3.412958, 0, 1, 0.3803922, 1,
-0.2418827, -0.01776446, -1.22124, 0, 1, 0.3882353, 1,
-0.2380267, -0.7116829, -3.884838, 0, 1, 0.3921569, 1,
-0.2371821, 0.1369927, -3.202662, 0, 1, 0.4, 1,
-0.227873, -0.7837862, -3.363764, 0, 1, 0.4078431, 1,
-0.2275389, 1.287194, 0.3760155, 0, 1, 0.4117647, 1,
-0.2269451, -0.8515756, -2.56777, 0, 1, 0.4196078, 1,
-0.2213957, 1.505086, 0.07753248, 0, 1, 0.4235294, 1,
-0.2185782, -0.1630174, -3.247923, 0, 1, 0.4313726, 1,
-0.2167156, 0.8894629, 0.9386696, 0, 1, 0.4352941, 1,
-0.2159433, 1.152582, 2.047801, 0, 1, 0.4431373, 1,
-0.2127009, 1.048323, -0.1070434, 0, 1, 0.4470588, 1,
-0.2099934, 0.3279234, -0.2276839, 0, 1, 0.454902, 1,
-0.2040789, 2.479577, -0.9832118, 0, 1, 0.4588235, 1,
-0.203233, -0.5110818, -3.287433, 0, 1, 0.4666667, 1,
-0.1998164, 1.42756, -1.678658, 0, 1, 0.4705882, 1,
-0.1991726, 1.134413, -0.8206049, 0, 1, 0.4784314, 1,
-0.1983595, 1.023713, -0.4782318, 0, 1, 0.4823529, 1,
-0.1937087, -0.3598088, 0.529712, 0, 1, 0.4901961, 1,
-0.1936105, -0.2598321, -1.400082, 0, 1, 0.4941176, 1,
-0.1896514, -0.2276248, -0.9190245, 0, 1, 0.5019608, 1,
-0.1865405, 0.7793666, -1.08323, 0, 1, 0.509804, 1,
-0.1836612, -0.6282138, -3.578588, 0, 1, 0.5137255, 1,
-0.1813947, 2.940177, 1.013831, 0, 1, 0.5215687, 1,
-0.1801984, 0.8115404, 1.612055, 0, 1, 0.5254902, 1,
-0.1785254, 2.093934, 1.0113, 0, 1, 0.5333334, 1,
-0.1775424, -0.2422548, -3.78483, 0, 1, 0.5372549, 1,
-0.1718372, -2.787477, -2.043403, 0, 1, 0.5450981, 1,
-0.1690819, -0.8290158, -3.127847, 0, 1, 0.5490196, 1,
-0.1672369, 0.06360748, 0.5544907, 0, 1, 0.5568628, 1,
-0.1668396, 0.03734563, -1.747371, 0, 1, 0.5607843, 1,
-0.1668324, -0.3915991, -3.230351, 0, 1, 0.5686275, 1,
-0.16532, 1.051795, 0.4376923, 0, 1, 0.572549, 1,
-0.163532, 0.4161813, -0.3284535, 0, 1, 0.5803922, 1,
-0.1552766, 1.158977, 0.3613292, 0, 1, 0.5843138, 1,
-0.1538048, -1.374559, -2.660296, 0, 1, 0.5921569, 1,
-0.1504068, -0.3448893, -1.924512, 0, 1, 0.5960785, 1,
-0.14791, 1.070554, -0.9584785, 0, 1, 0.6039216, 1,
-0.1465315, -2.150674, -4.143137, 0, 1, 0.6117647, 1,
-0.1457598, -0.540792, -2.680218, 0, 1, 0.6156863, 1,
-0.1446331, -0.1153729, -2.975823, 0, 1, 0.6235294, 1,
-0.1439604, 2.335169, -0.05532781, 0, 1, 0.627451, 1,
-0.1422916, -0.4848228, -2.745357, 0, 1, 0.6352941, 1,
-0.1385012, 1.702086, -0.1700972, 0, 1, 0.6392157, 1,
-0.1355346, -0.03034767, -3.024482, 0, 1, 0.6470588, 1,
-0.1353719, 2.504142, -1.048921, 0, 1, 0.6509804, 1,
-0.1269751, -0.162967, -2.252687, 0, 1, 0.6588235, 1,
-0.1206565, 1.138739, 0.2959623, 0, 1, 0.6627451, 1,
-0.119391, -0.7968039, -2.549312, 0, 1, 0.6705883, 1,
-0.1164358, 0.05484581, -1.041972, 0, 1, 0.6745098, 1,
-0.1121935, 0.9853094, 0.9678746, 0, 1, 0.682353, 1,
-0.1119398, -0.1858432, -1.568345, 0, 1, 0.6862745, 1,
-0.1104724, 1.602224, -0.9709554, 0, 1, 0.6941177, 1,
-0.1076245, 1.070703, -2.056703, 0, 1, 0.7019608, 1,
-0.1042822, 1.657349, 1.196698, 0, 1, 0.7058824, 1,
-0.1005514, -0.7403119, -3.538503, 0, 1, 0.7137255, 1,
-0.09563394, -0.422315, -3.865635, 0, 1, 0.7176471, 1,
-0.0940987, -0.5642914, -1.475169, 0, 1, 0.7254902, 1,
-0.09346651, -0.2075613, -1.282184, 0, 1, 0.7294118, 1,
-0.09248712, 0.5477145, 0.7361271, 0, 1, 0.7372549, 1,
-0.08992326, 0.7295375, -1.438625, 0, 1, 0.7411765, 1,
-0.08861005, -0.146567, -1.594297, 0, 1, 0.7490196, 1,
-0.08689134, -0.8822174, -2.112545, 0, 1, 0.7529412, 1,
-0.08512747, -0.5453094, -2.454241, 0, 1, 0.7607843, 1,
-0.08468599, -1.03979, -1.65809, 0, 1, 0.7647059, 1,
-0.08457726, 0.057926, -0.5041695, 0, 1, 0.772549, 1,
-0.08290831, -0.4257377, -4.316112, 0, 1, 0.7764706, 1,
-0.08196442, 0.8107632, 0.7528071, 0, 1, 0.7843137, 1,
-0.08075839, 0.6036384, 0.01469379, 0, 1, 0.7882353, 1,
-0.07949697, 0.4642402, 0.9988862, 0, 1, 0.7960784, 1,
-0.07897525, -0.6543691, -4.276684, 0, 1, 0.8039216, 1,
-0.07680506, -0.03783552, -3.444249, 0, 1, 0.8078431, 1,
-0.0766166, -0.245488, -3.441968, 0, 1, 0.8156863, 1,
-0.07628459, -0.9687231, -3.134832, 0, 1, 0.8196079, 1,
-0.07624288, 0.8674299, 0.9321906, 0, 1, 0.827451, 1,
-0.07545957, 0.3015086, -0.6900806, 0, 1, 0.8313726, 1,
-0.07413542, 0.1670364, -1.314007, 0, 1, 0.8392157, 1,
-0.07355903, 1.134459, -0.7915781, 0, 1, 0.8431373, 1,
-0.07319982, 0.4526786, 0.2441415, 0, 1, 0.8509804, 1,
-0.07276087, 1.112007, 0.3630038, 0, 1, 0.854902, 1,
-0.07198869, 0.5502474, -0.9500684, 0, 1, 0.8627451, 1,
-0.07175802, -0.9170079, -3.585212, 0, 1, 0.8666667, 1,
-0.06871855, 1.099018, 0.07702368, 0, 1, 0.8745098, 1,
-0.06192891, 0.3440448, -0.3613669, 0, 1, 0.8784314, 1,
-0.05415663, 1.986256, -0.242016, 0, 1, 0.8862745, 1,
-0.0540301, -0.970665, -2.888167, 0, 1, 0.8901961, 1,
-0.05215555, 1.639565, 1.305103, 0, 1, 0.8980392, 1,
-0.05023756, -0.3431268, -3.536387, 0, 1, 0.9058824, 1,
-0.04544359, 0.5652768, 1.195252, 0, 1, 0.9098039, 1,
-0.04271462, -0.04698394, -1.437438, 0, 1, 0.9176471, 1,
-0.04239491, -0.7012804, -3.213857, 0, 1, 0.9215686, 1,
-0.04164376, 0.05555588, 0.1304631, 0, 1, 0.9294118, 1,
-0.03970117, -0.4094657, -0.6778173, 0, 1, 0.9333333, 1,
-0.03599902, 0.5225725, -1.781976, 0, 1, 0.9411765, 1,
-0.03493927, 0.9407904, 0.001145284, 0, 1, 0.945098, 1,
-0.03439542, -0.7469985, -3.37529, 0, 1, 0.9529412, 1,
-0.02946331, -0.5844853, -3.696683, 0, 1, 0.9568627, 1,
-0.02630869, -1.36486, -2.39726, 0, 1, 0.9647059, 1,
-0.01920579, -1.102676, 0.09757711, 0, 1, 0.9686275, 1,
-0.01665866, -0.5949602, -2.051791, 0, 1, 0.9764706, 1,
-0.01530929, -1.574733, -3.572905, 0, 1, 0.9803922, 1,
-0.01434335, 1.917618, 0.4473743, 0, 1, 0.9882353, 1,
-0.01167644, -0.9681395, -3.432937, 0, 1, 0.9921569, 1,
-0.006502397, 1.500124, 0.8248265, 0, 1, 1, 1,
-0.004930636, -1.430801, -4.704788, 0, 0.9921569, 1, 1,
-0.004212325, -0.8137742, -2.698277, 0, 0.9882353, 1, 1,
-0.001473426, -0.4915226, -1.866307, 0, 0.9803922, 1, 1,
0.002590246, 3.018856, -1.433945, 0, 0.9764706, 1, 1,
0.01731137, 2.597789, -1.446958, 0, 0.9686275, 1, 1,
0.01738489, -1.034461, 1.666254, 0, 0.9647059, 1, 1,
0.01845755, -1.018564, 3.636226, 0, 0.9568627, 1, 1,
0.02177328, 0.5303522, -0.9242591, 0, 0.9529412, 1, 1,
0.0220038, -0.3957973, 3.029445, 0, 0.945098, 1, 1,
0.02239347, 1.582986, 1.128307, 0, 0.9411765, 1, 1,
0.02267029, -1.645739, 0.9130646, 0, 0.9333333, 1, 1,
0.02281406, 0.4943028, -0.3323425, 0, 0.9294118, 1, 1,
0.03079993, 0.06498142, 1.089867, 0, 0.9215686, 1, 1,
0.03121002, 1.556258, 1.074088, 0, 0.9176471, 1, 1,
0.03335999, 0.3780393, -0.9306624, 0, 0.9098039, 1, 1,
0.03441503, -0.8436512, 3.568907, 0, 0.9058824, 1, 1,
0.036727, -0.146218, 2.558282, 0, 0.8980392, 1, 1,
0.03843659, -1.29052, 2.811163, 0, 0.8901961, 1, 1,
0.04308575, -0.7232829, 2.061025, 0, 0.8862745, 1, 1,
0.04643537, 0.3092246, 0.0903733, 0, 0.8784314, 1, 1,
0.05029294, -0.759784, 2.62782, 0, 0.8745098, 1, 1,
0.05030179, 0.3465038, 0.03377375, 0, 0.8666667, 1, 1,
0.05198341, -0.04634469, 3.429889, 0, 0.8627451, 1, 1,
0.05507112, -0.2075114, 3.101696, 0, 0.854902, 1, 1,
0.05533871, -2.94044, 5.162793, 0, 0.8509804, 1, 1,
0.0569299, -1.826954, 3.952864, 0, 0.8431373, 1, 1,
0.05909207, 0.8899035, -0.1326912, 0, 0.8392157, 1, 1,
0.05937896, -0.6910051, 2.530506, 0, 0.8313726, 1, 1,
0.06172413, -1.933871, 3.082274, 0, 0.827451, 1, 1,
0.06229787, -0.4144933, 3.120412, 0, 0.8196079, 1, 1,
0.07005025, -0.2501856, 3.506299, 0, 0.8156863, 1, 1,
0.0818679, 0.1775172, 0.2113465, 0, 0.8078431, 1, 1,
0.08265623, -0.7446327, 2.492465, 0, 0.8039216, 1, 1,
0.08368402, -0.8967731, 4.825687, 0, 0.7960784, 1, 1,
0.08909348, 0.05413518, 1.405439, 0, 0.7882353, 1, 1,
0.08941074, -0.9248928, 3.380857, 0, 0.7843137, 1, 1,
0.090677, -0.02525574, 1.721336, 0, 0.7764706, 1, 1,
0.09072781, 0.284419, -0.1320062, 0, 0.772549, 1, 1,
0.1015955, 0.8783426, -1.412342, 0, 0.7647059, 1, 1,
0.1017415, -1.066473, 2.221977, 0, 0.7607843, 1, 1,
0.1034305, 0.3940114, -2.849788, 0, 0.7529412, 1, 1,
0.106553, 0.931155, 1.510992, 0, 0.7490196, 1, 1,
0.1070671, 0.3848817, 0.2489678, 0, 0.7411765, 1, 1,
0.1091046, 0.592558, -1.287167, 0, 0.7372549, 1, 1,
0.1154231, -0.8677855, 4.220616, 0, 0.7294118, 1, 1,
0.1162183, 0.8722046, 0.4475925, 0, 0.7254902, 1, 1,
0.1206686, 0.5276335, -0.203505, 0, 0.7176471, 1, 1,
0.1214371, 1.360538, 0.580181, 0, 0.7137255, 1, 1,
0.1224411, 0.827369, 1.17342, 0, 0.7058824, 1, 1,
0.1256925, -1.054736, 1.643691, 0, 0.6980392, 1, 1,
0.1263916, 1.252595, 1.640348, 0, 0.6941177, 1, 1,
0.1346405, -1.063063, 3.665212, 0, 0.6862745, 1, 1,
0.1347976, -0.8568119, 2.308511, 0, 0.682353, 1, 1,
0.1373774, -0.1148485, 0.9826415, 0, 0.6745098, 1, 1,
0.1380498, 1.236155, -2.048219, 0, 0.6705883, 1, 1,
0.1390854, 0.2712209, 0.2465728, 0, 0.6627451, 1, 1,
0.1424601, 1.172572, -0.01728855, 0, 0.6588235, 1, 1,
0.1469769, -1.174219, 3.760723, 0, 0.6509804, 1, 1,
0.1470278, -0.5415528, 2.174834, 0, 0.6470588, 1, 1,
0.1507236, -0.9436405, 1.653908, 0, 0.6392157, 1, 1,
0.1515491, -0.4943657, 2.862784, 0, 0.6352941, 1, 1,
0.1534923, 1.309686, 0.1319932, 0, 0.627451, 1, 1,
0.1546845, 0.5967819, -1.024642, 0, 0.6235294, 1, 1,
0.1610325, -1.354388, 2.182764, 0, 0.6156863, 1, 1,
0.163374, -0.3146035, 1.926389, 0, 0.6117647, 1, 1,
0.1639628, 0.1922967, -1.087779, 0, 0.6039216, 1, 1,
0.1640577, 0.5985276, -0.3601993, 0, 0.5960785, 1, 1,
0.167386, -1.583467, 3.054898, 0, 0.5921569, 1, 1,
0.1702248, 0.3065116, 0.3976307, 0, 0.5843138, 1, 1,
0.1710096, -0.4861289, 0.06115898, 0, 0.5803922, 1, 1,
0.1749976, -0.136637, 2.393058, 0, 0.572549, 1, 1,
0.1759785, 1.802513, -1.544193, 0, 0.5686275, 1, 1,
0.1797548, -0.08215478, 2.606603, 0, 0.5607843, 1, 1,
0.183649, -0.4558386, 3.384557, 0, 0.5568628, 1, 1,
0.1847761, 1.866911, -0.5489389, 0, 0.5490196, 1, 1,
0.1876928, -0.5742654, 3.569224, 0, 0.5450981, 1, 1,
0.1891245, 0.4764143, 0.5692366, 0, 0.5372549, 1, 1,
0.1909461, 0.08922419, 0.5338985, 0, 0.5333334, 1, 1,
0.1942519, -0.8852582, 1.950038, 0, 0.5254902, 1, 1,
0.1960246, 0.5431592, 0.55424, 0, 0.5215687, 1, 1,
0.1983064, 0.5958811, 1.65043, 0, 0.5137255, 1, 1,
0.1990121, 1.935232, 0.9723164, 0, 0.509804, 1, 1,
0.2007852, 0.3962019, 0.6751841, 0, 0.5019608, 1, 1,
0.203691, -0.1146826, 3.218507, 0, 0.4941176, 1, 1,
0.2067896, -1.562963, 2.365796, 0, 0.4901961, 1, 1,
0.2080412, -0.0461355, 1.119531, 0, 0.4823529, 1, 1,
0.2103554, -0.6415285, 3.176828, 0, 0.4784314, 1, 1,
0.2118113, -0.8872581, 1.945313, 0, 0.4705882, 1, 1,
0.2150013, -0.4681532, 3.268326, 0, 0.4666667, 1, 1,
0.2167427, -0.6376599, 3.667427, 0, 0.4588235, 1, 1,
0.2168107, 0.4780223, 0.1106952, 0, 0.454902, 1, 1,
0.2189822, -0.2060284, 3.427833, 0, 0.4470588, 1, 1,
0.2207382, 0.5436318, 1.810962, 0, 0.4431373, 1, 1,
0.2211018, 0.703732, -0.1576041, 0, 0.4352941, 1, 1,
0.2235574, -0.3121939, 5.535273, 0, 0.4313726, 1, 1,
0.2314948, 1.541192, 1.516133, 0, 0.4235294, 1, 1,
0.2336318, -0.420139, 4.514254, 0, 0.4196078, 1, 1,
0.2358316, 0.009161305, 1.619456, 0, 0.4117647, 1, 1,
0.2397689, 0.3241689, 0.756726, 0, 0.4078431, 1, 1,
0.2400703, 1.280713, -0.6617393, 0, 0.4, 1, 1,
0.2426432, -1.397929, 3.116035, 0, 0.3921569, 1, 1,
0.245086, -0.4846199, 0.5221393, 0, 0.3882353, 1, 1,
0.2494677, 1.674269, -0.7618669, 0, 0.3803922, 1, 1,
0.2539917, 0.1144125, 1.463337, 0, 0.3764706, 1, 1,
0.2554381, -1.547256, 2.760423, 0, 0.3686275, 1, 1,
0.2557563, -1.340859, 2.611847, 0, 0.3647059, 1, 1,
0.2560847, -0.733678, 4.396971, 0, 0.3568628, 1, 1,
0.2561921, 0.4153641, 1.728989, 0, 0.3529412, 1, 1,
0.2566418, 0.7804238, 1.193362, 0, 0.345098, 1, 1,
0.257472, -0.2842678, 3.025551, 0, 0.3411765, 1, 1,
0.2605726, -0.7453898, 0.9008974, 0, 0.3333333, 1, 1,
0.2634658, 0.7913773, 0.9601069, 0, 0.3294118, 1, 1,
0.2636791, -0.7461124, 3.545409, 0, 0.3215686, 1, 1,
0.2693756, 0.4015805, -0.8995363, 0, 0.3176471, 1, 1,
0.2714527, 2.682414, 2.153626, 0, 0.3098039, 1, 1,
0.2728411, -0.8768817, 2.334826, 0, 0.3058824, 1, 1,
0.2752324, -0.463831, 4.757141, 0, 0.2980392, 1, 1,
0.2760248, -1.241864, 4.787379, 0, 0.2901961, 1, 1,
0.2770294, 1.090153, 0.3016708, 0, 0.2862745, 1, 1,
0.2828526, -1.300772, 4.102729, 0, 0.2784314, 1, 1,
0.283127, -0.04054194, 2.313286, 0, 0.2745098, 1, 1,
0.2869729, -1.290972, 2.959134, 0, 0.2666667, 1, 1,
0.2882753, -0.368781, 3.389742, 0, 0.2627451, 1, 1,
0.2942058, -0.7647302, 1.822851, 0, 0.254902, 1, 1,
0.2949015, 0.1620646, 2.285339, 0, 0.2509804, 1, 1,
0.2969778, -1.332279, 3.29369, 0, 0.2431373, 1, 1,
0.2973689, -0.3234843, 2.670579, 0, 0.2392157, 1, 1,
0.3023543, 1.115126, -0.6706967, 0, 0.2313726, 1, 1,
0.3040668, -0.6970035, 4.010536, 0, 0.227451, 1, 1,
0.3079824, -2.209974, 2.434969, 0, 0.2196078, 1, 1,
0.3091108, -0.4504412, 2.712619, 0, 0.2156863, 1, 1,
0.3093994, 0.01978716, 0.7001798, 0, 0.2078431, 1, 1,
0.3141651, -1.026909, 2.89403, 0, 0.2039216, 1, 1,
0.3225357, 0.02111652, 3.494994, 0, 0.1960784, 1, 1,
0.3245453, 0.9580114, 1.28059, 0, 0.1882353, 1, 1,
0.3247401, 0.01814653, 1.637808, 0, 0.1843137, 1, 1,
0.3262644, 0.2238445, 0.9969035, 0, 0.1764706, 1, 1,
0.3265648, -1.214882, 5.334431, 0, 0.172549, 1, 1,
0.3308191, 0.9022792, -1.773766, 0, 0.1647059, 1, 1,
0.3338122, 1.259722, -0.3624594, 0, 0.1607843, 1, 1,
0.3449363, -1.041476, 2.85345, 0, 0.1529412, 1, 1,
0.3487851, -0.1460294, 0.8075145, 0, 0.1490196, 1, 1,
0.3516701, 0.8552371, 0.6306466, 0, 0.1411765, 1, 1,
0.3533568, 0.5201128, 1.898083, 0, 0.1372549, 1, 1,
0.3542754, 0.6077214, 1.095852, 0, 0.1294118, 1, 1,
0.3544445, 0.6258742, -0.8562565, 0, 0.1254902, 1, 1,
0.3553609, -1.430348, 1.614848, 0, 0.1176471, 1, 1,
0.3591236, 1.966866, -0.1130849, 0, 0.1137255, 1, 1,
0.3605443, 0.3922487, 1.166094, 0, 0.1058824, 1, 1,
0.3608623, 0.6891378, 0.1919658, 0, 0.09803922, 1, 1,
0.3610319, -1.652708, 3.723749, 0, 0.09411765, 1, 1,
0.361274, -1.193025, 3.624814, 0, 0.08627451, 1, 1,
0.3739055, 0.9842465, 0.2493144, 0, 0.08235294, 1, 1,
0.3740137, -0.9675854, 3.04805, 0, 0.07450981, 1, 1,
0.375079, -0.4201126, 0.9572515, 0, 0.07058824, 1, 1,
0.3776598, 0.7397177, 1.31625, 0, 0.0627451, 1, 1,
0.3777194, 1.28217, -0.08702627, 0, 0.05882353, 1, 1,
0.3786284, 1.088883, 0.2603437, 0, 0.05098039, 1, 1,
0.3820705, 0.0313202, 1.263016, 0, 0.04705882, 1, 1,
0.3825887, -0.5010098, 2.223563, 0, 0.03921569, 1, 1,
0.3834294, -0.3265591, 3.089644, 0, 0.03529412, 1, 1,
0.3846626, -1.2449, 2.104379, 0, 0.02745098, 1, 1,
0.3888143, -0.1681347, 2.853148, 0, 0.02352941, 1, 1,
0.3899624, 1.176546, 0.3461963, 0, 0.01568628, 1, 1,
0.3930882, 0.1976429, -0.005992226, 0, 0.01176471, 1, 1,
0.397321, 1.008527, -1.593747, 0, 0.003921569, 1, 1,
0.4008234, 1.001613, 0.3262833, 0.003921569, 0, 1, 1,
0.4013891, 0.007001695, 0.4339979, 0.007843138, 0, 1, 1,
0.4061914, 1.172759, 1.31229, 0.01568628, 0, 1, 1,
0.4119973, 1.187797, -0.3840125, 0.01960784, 0, 1, 1,
0.4139699, 1.197014, -0.1348644, 0.02745098, 0, 1, 1,
0.4149173, -0.05681302, 0.7059546, 0.03137255, 0, 1, 1,
0.4191875, 0.0810478, 0.5672365, 0.03921569, 0, 1, 1,
0.4213814, -0.248272, 2.606978, 0.04313726, 0, 1, 1,
0.4227645, 0.3142916, 0.06147155, 0.05098039, 0, 1, 1,
0.425152, -0.1360984, 0.003704913, 0.05490196, 0, 1, 1,
0.4272685, 0.7331957, 1.455262, 0.0627451, 0, 1, 1,
0.4273594, 1.029622, -1.145522, 0.06666667, 0, 1, 1,
0.4322837, 1.253984, 0.3898127, 0.07450981, 0, 1, 1,
0.4346778, 0.4927155, 2.603999, 0.07843138, 0, 1, 1,
0.4351459, 0.3587559, 0.3689435, 0.08627451, 0, 1, 1,
0.4369183, -1.197743, 3.67902, 0.09019608, 0, 1, 1,
0.440715, -0.9287312, 4.368651, 0.09803922, 0, 1, 1,
0.4415709, -1.298678, 3.94328, 0.1058824, 0, 1, 1,
0.4415784, -0.3380947, 1.629063, 0.1098039, 0, 1, 1,
0.4437502, -0.8926574, 4.311516, 0.1176471, 0, 1, 1,
0.4445939, 0.05112634, 2.008267, 0.1215686, 0, 1, 1,
0.4454439, 0.1295278, 0.02574712, 0.1294118, 0, 1, 1,
0.4540198, -1.37459, 2.793914, 0.1333333, 0, 1, 1,
0.4567116, -0.2710404, 2.279079, 0.1411765, 0, 1, 1,
0.4586382, 0.6830391, 2.310471, 0.145098, 0, 1, 1,
0.4620299, 0.5796888, -0.3567492, 0.1529412, 0, 1, 1,
0.4671226, -0.2683716, 2.679414, 0.1568628, 0, 1, 1,
0.4677957, -2.297387, 0.8065429, 0.1647059, 0, 1, 1,
0.4759301, 4.071614, -0.1735304, 0.1686275, 0, 1, 1,
0.4783923, 1.601011, -1.561198, 0.1764706, 0, 1, 1,
0.483799, -0.7596669, 2.089242, 0.1803922, 0, 1, 1,
0.4857887, 0.8307054, 0.2148974, 0.1882353, 0, 1, 1,
0.4878775, -0.3682876, 3.311108, 0.1921569, 0, 1, 1,
0.4882022, -0.5689794, 3.693044, 0.2, 0, 1, 1,
0.4923363, -0.7655898, -0.0838229, 0.2078431, 0, 1, 1,
0.4940238, 0.5546611, 1.865671, 0.2117647, 0, 1, 1,
0.4949106, -0.4863119, 3.657526, 0.2196078, 0, 1, 1,
0.4992129, 1.176948, 1.909214, 0.2235294, 0, 1, 1,
0.5000894, 0.3428105, 2.304165, 0.2313726, 0, 1, 1,
0.5045702, -2.027896, 2.412402, 0.2352941, 0, 1, 1,
0.5101062, -1.629257, 1.257924, 0.2431373, 0, 1, 1,
0.5104787, 0.03389787, 1.931089, 0.2470588, 0, 1, 1,
0.5140476, -0.9567443, 2.527186, 0.254902, 0, 1, 1,
0.5150037, 0.1561662, 2.550731, 0.2588235, 0, 1, 1,
0.517818, -1.00644, 2.518984, 0.2666667, 0, 1, 1,
0.5230836, 0.2517031, -0.4904326, 0.2705882, 0, 1, 1,
0.5301031, -0.5333747, 2.463017, 0.2784314, 0, 1, 1,
0.5367533, -0.2309406, 0.4347297, 0.282353, 0, 1, 1,
0.5416837, 0.5235406, 1.871998, 0.2901961, 0, 1, 1,
0.5435099, -1.134395, 1.529217, 0.2941177, 0, 1, 1,
0.5438861, 0.1822864, 1.059399, 0.3019608, 0, 1, 1,
0.5441201, 1.591378, -0.8236595, 0.3098039, 0, 1, 1,
0.546431, -1.489668, 2.209962, 0.3137255, 0, 1, 1,
0.5521731, -1.219707, 3.07121, 0.3215686, 0, 1, 1,
0.5535402, 0.7397815, 1.111635, 0.3254902, 0, 1, 1,
0.5546308, 2.243388, 1.196506, 0.3333333, 0, 1, 1,
0.5552618, 0.3082999, -1.102481, 0.3372549, 0, 1, 1,
0.5602055, -0.472481, 2.789962, 0.345098, 0, 1, 1,
0.5618108, -0.7153675, 1.819271, 0.3490196, 0, 1, 1,
0.5631962, 2.46154, -0.633787, 0.3568628, 0, 1, 1,
0.5726909, 0.198031, 1.329598, 0.3607843, 0, 1, 1,
0.5800983, 0.5889374, 0.8369538, 0.3686275, 0, 1, 1,
0.5823007, -0.5257524, 2.042348, 0.372549, 0, 1, 1,
0.5867262, -1.306058, 1.897554, 0.3803922, 0, 1, 1,
0.5868608, 1.308411, -1.499885, 0.3843137, 0, 1, 1,
0.5880655, 0.8679312, 0.2512071, 0.3921569, 0, 1, 1,
0.5892695, 0.4111104, 1.377289, 0.3960784, 0, 1, 1,
0.593433, 1.0803, 1.808407, 0.4039216, 0, 1, 1,
0.5940106, 0.6261918, -0.8112442, 0.4117647, 0, 1, 1,
0.5970606, 1.044964, -0.5010857, 0.4156863, 0, 1, 1,
0.5993656, -0.7422466, 2.126972, 0.4235294, 0, 1, 1,
0.6022534, -1.418821, 4.405939, 0.427451, 0, 1, 1,
0.6040285, -0.3314602, 1.52001, 0.4352941, 0, 1, 1,
0.608327, -1.749989, 2.347323, 0.4392157, 0, 1, 1,
0.6093155, 0.9412526, -0.5944027, 0.4470588, 0, 1, 1,
0.6139194, -1.33553, 1.801508, 0.4509804, 0, 1, 1,
0.6158299, 0.3191514, 1.566805, 0.4588235, 0, 1, 1,
0.6201962, -0.5713258, 2.287987, 0.4627451, 0, 1, 1,
0.6372269, -1.230335, 2.943477, 0.4705882, 0, 1, 1,
0.6377946, -1.099087, 2.37346, 0.4745098, 0, 1, 1,
0.6405861, 0.7553656, 0.8483881, 0.4823529, 0, 1, 1,
0.6408164, -0.7317825, 3.40605, 0.4862745, 0, 1, 1,
0.6442682, 1.61325, 1.362828, 0.4941176, 0, 1, 1,
0.649765, -0.5800979, 1.508437, 0.5019608, 0, 1, 1,
0.6524213, 0.08531894, 3.200962, 0.5058824, 0, 1, 1,
0.6555837, 0.1401997, 3.794327, 0.5137255, 0, 1, 1,
0.6566468, 0.4528696, 0.3289827, 0.5176471, 0, 1, 1,
0.6578735, 0.2398489, 0.8397745, 0.5254902, 0, 1, 1,
0.6581252, 0.7052659, 0.04312365, 0.5294118, 0, 1, 1,
0.6587383, 1.885914, -0.3660069, 0.5372549, 0, 1, 1,
0.6658289, 0.1099272, 0.5332284, 0.5411765, 0, 1, 1,
0.667931, 0.1700885, 1.278633, 0.5490196, 0, 1, 1,
0.6684254, -0.7490415, 3.406518, 0.5529412, 0, 1, 1,
0.6700565, -0.2550075, 0.8026614, 0.5607843, 0, 1, 1,
0.6761877, -0.6717741, 2.376434, 0.5647059, 0, 1, 1,
0.6766591, 0.4573983, -0.8572652, 0.572549, 0, 1, 1,
0.6830507, -0.4027018, 1.296895, 0.5764706, 0, 1, 1,
0.6846968, 1.319165, 0.8252343, 0.5843138, 0, 1, 1,
0.6942572, -2.159521, 2.205757, 0.5882353, 0, 1, 1,
0.6971071, 0.8494974, 0.3074201, 0.5960785, 0, 1, 1,
0.713133, -1.163305, 2.668211, 0.6039216, 0, 1, 1,
0.7193051, 0.2352887, 0.6406387, 0.6078432, 0, 1, 1,
0.7200987, 1.259056, 0.5127778, 0.6156863, 0, 1, 1,
0.7208188, 0.2987738, 1.367168, 0.6196079, 0, 1, 1,
0.7224519, -0.6657302, 2.480624, 0.627451, 0, 1, 1,
0.7225093, -0.206293, 3.21624, 0.6313726, 0, 1, 1,
0.7245372, 1.57897, 1.350812, 0.6392157, 0, 1, 1,
0.7245559, -0.02354523, 1.78824, 0.6431373, 0, 1, 1,
0.7307264, 0.376105, 0.5904849, 0.6509804, 0, 1, 1,
0.7400709, 0.5007566, 0.1080098, 0.654902, 0, 1, 1,
0.747431, 0.9992734, 1.852056, 0.6627451, 0, 1, 1,
0.7479968, -0.76094, 1.680121, 0.6666667, 0, 1, 1,
0.7554184, -1.331636, 3.265708, 0.6745098, 0, 1, 1,
0.7566909, -0.3980232, 3.259052, 0.6784314, 0, 1, 1,
0.7594938, 1.798429, 0.2741613, 0.6862745, 0, 1, 1,
0.7630095, -1.89166, 1.898673, 0.6901961, 0, 1, 1,
0.7656276, 1.612335, 1.040085, 0.6980392, 0, 1, 1,
0.7759822, 0.7603503, 0.03629294, 0.7058824, 0, 1, 1,
0.7768329, -1.325156, 2.788899, 0.7098039, 0, 1, 1,
0.7874064, 0.2083363, 2.19239, 0.7176471, 0, 1, 1,
0.788415, 1.376627, 1.217404, 0.7215686, 0, 1, 1,
0.7955701, -1.787017, 3.914197, 0.7294118, 0, 1, 1,
0.8075468, -0.04176768, 2.751089, 0.7333333, 0, 1, 1,
0.8086164, 0.1953696, 0.5118078, 0.7411765, 0, 1, 1,
0.8122005, 0.2198316, 1.111019, 0.7450981, 0, 1, 1,
0.8123644, -1.030173, 0.3976594, 0.7529412, 0, 1, 1,
0.8179259, -1.240631, 2.623223, 0.7568628, 0, 1, 1,
0.8203626, -0.9330629, 2.584311, 0.7647059, 0, 1, 1,
0.8241974, 0.3355475, 1.334519, 0.7686275, 0, 1, 1,
0.8254435, 0.3106428, 1.910415, 0.7764706, 0, 1, 1,
0.8288516, 0.121986, 1.164994, 0.7803922, 0, 1, 1,
0.8298309, 1.036121, 1.281652, 0.7882353, 0, 1, 1,
0.8311288, -0.7504604, 2.496201, 0.7921569, 0, 1, 1,
0.8327411, -0.9660424, 3.357651, 0.8, 0, 1, 1,
0.8359609, 0.1081345, 1.093177, 0.8078431, 0, 1, 1,
0.8417831, 1.22911, -0.2858613, 0.8117647, 0, 1, 1,
0.8479637, -1.06986, 1.457495, 0.8196079, 0, 1, 1,
0.8616229, -1.012964, 3.439526, 0.8235294, 0, 1, 1,
0.8622825, -0.3190495, 2.055651, 0.8313726, 0, 1, 1,
0.8647062, 0.300989, 0.6196386, 0.8352941, 0, 1, 1,
0.8649865, 1.155747, -0.3183659, 0.8431373, 0, 1, 1,
0.870663, 0.3577927, 2.358742, 0.8470588, 0, 1, 1,
0.8744491, 1.332083, -0.7174153, 0.854902, 0, 1, 1,
0.8787872, 0.1067898, 2.002257, 0.8588235, 0, 1, 1,
0.8807053, -0.9486166, 2.251474, 0.8666667, 0, 1, 1,
0.8819801, 0.02243801, 0.03910374, 0.8705882, 0, 1, 1,
0.8894148, 2.417638, 0.4325333, 0.8784314, 0, 1, 1,
0.8899318, -0.08224794, -0.05828681, 0.8823529, 0, 1, 1,
0.8914552, 0.9365771, 1.867617, 0.8901961, 0, 1, 1,
0.896303, -1.249442, 1.461056, 0.8941177, 0, 1, 1,
0.9022365, -1.723111, 3.037811, 0.9019608, 0, 1, 1,
0.9028478, -0.3858237, 1.679179, 0.9098039, 0, 1, 1,
0.9121321, 0.05981391, 1.177311, 0.9137255, 0, 1, 1,
0.9135141, -0.1505625, 0.1938803, 0.9215686, 0, 1, 1,
0.9195824, 0.1196228, 2.621663, 0.9254902, 0, 1, 1,
0.9216458, 0.2917147, 2.861121, 0.9333333, 0, 1, 1,
0.9299942, 0.6106351, 1.134185, 0.9372549, 0, 1, 1,
0.9338372, 1.396486, 0.1008304, 0.945098, 0, 1, 1,
0.9400411, -0.5888938, 2.980083, 0.9490196, 0, 1, 1,
0.946585, 0.9942642, 0.7111735, 0.9568627, 0, 1, 1,
0.9508302, -0.4124664, 2.444976, 0.9607843, 0, 1, 1,
0.9548181, 0.6449614, 1.318485, 0.9686275, 0, 1, 1,
0.9606032, 0.3766465, 0.5487859, 0.972549, 0, 1, 1,
0.9628289, 0.3974687, 0.2056025, 0.9803922, 0, 1, 1,
0.9738444, 0.1993414, 0.7877915, 0.9843137, 0, 1, 1,
0.9775223, -0.4895282, 2.872899, 0.9921569, 0, 1, 1,
0.9872288, -2.389762, 2.188732, 0.9960784, 0, 1, 1,
0.9885716, 0.04874538, 2.563843, 1, 0, 0.9960784, 1,
0.9903182, -0.8362904, 3.330428, 1, 0, 0.9882353, 1,
0.9922244, -0.5791917, 0.9977788, 1, 0, 0.9843137, 1,
0.9946022, 0.1005571, 1.349764, 1, 0, 0.9764706, 1,
0.9951444, -0.9722334, 3.201108, 1, 0, 0.972549, 1,
0.9958642, 0.7271835, 2.138971, 1, 0, 0.9647059, 1,
0.9961081, 0.1644764, 2.366688, 1, 0, 0.9607843, 1,
1.007448, -1.456907, 3.745956, 1, 0, 0.9529412, 1,
1.008378, -0.2724016, -0.3628722, 1, 0, 0.9490196, 1,
1.009632, 0.6196783, 1.2322, 1, 0, 0.9411765, 1,
1.011284, 0.7444764, -0.8257045, 1, 0, 0.9372549, 1,
1.011311, 2.109373, 0.1586944, 1, 0, 0.9294118, 1,
1.015808, -0.9863337, 3.440918, 1, 0, 0.9254902, 1,
1.02124, 0.9178867, 0.9163292, 1, 0, 0.9176471, 1,
1.034397, -0.9014655, 2.149441, 1, 0, 0.9137255, 1,
1.046202, 0.6509095, 0.2681323, 1, 0, 0.9058824, 1,
1.051663, 0.7228613, 1.400254, 1, 0, 0.9019608, 1,
1.076038, -0.06036055, 1.646663, 1, 0, 0.8941177, 1,
1.080928, 0.8255693, 0.255874, 1, 0, 0.8862745, 1,
1.080943, -0.07020984, 3.082496, 1, 0, 0.8823529, 1,
1.083181, 0.1986737, 1.589296, 1, 0, 0.8745098, 1,
1.089099, -0.01181977, 0.1289177, 1, 0, 0.8705882, 1,
1.090368, 0.6762215, 0.4975918, 1, 0, 0.8627451, 1,
1.091534, 0.2228153, 1.518902, 1, 0, 0.8588235, 1,
1.092859, -0.4019156, 2.451915, 1, 0, 0.8509804, 1,
1.093349, -0.009416563, 1.805954, 1, 0, 0.8470588, 1,
1.099405, -0.9979167, 1.705708, 1, 0, 0.8392157, 1,
1.107491, 0.5930482, -0.02881612, 1, 0, 0.8352941, 1,
1.118363, -0.1076377, 3.422226, 1, 0, 0.827451, 1,
1.123384, -0.2666868, 0.4852694, 1, 0, 0.8235294, 1,
1.139148, 0.4708787, -0.1880219, 1, 0, 0.8156863, 1,
1.141528, -0.6514077, 2.682371, 1, 0, 0.8117647, 1,
1.142461, -1.034938, 1.320997, 1, 0, 0.8039216, 1,
1.1429, 0.382102, 1.821963, 1, 0, 0.7960784, 1,
1.142977, 0.224639, 3.137033, 1, 0, 0.7921569, 1,
1.14389, -0.3293423, 3.015316, 1, 0, 0.7843137, 1,
1.144847, -0.6167989, 1.564966, 1, 0, 0.7803922, 1,
1.145619, -0.2407275, 2.813767, 1, 0, 0.772549, 1,
1.148289, -2.165451, 1.926719, 1, 0, 0.7686275, 1,
1.150719, -2.481477, 3.249294, 1, 0, 0.7607843, 1,
1.151592, -0.03656328, 3.06285, 1, 0, 0.7568628, 1,
1.153911, 0.2728511, 0.178654, 1, 0, 0.7490196, 1,
1.164531, -0.6564913, 3.441426, 1, 0, 0.7450981, 1,
1.17517, 1.348156, 0.04863204, 1, 0, 0.7372549, 1,
1.181744, -0.8449373, 2.483073, 1, 0, 0.7333333, 1,
1.18702, -0.2958305, 2.625293, 1, 0, 0.7254902, 1,
1.195229, -0.4631244, 0.6896155, 1, 0, 0.7215686, 1,
1.199109, -0.5269101, 2.6992, 1, 0, 0.7137255, 1,
1.205974, -0.8319932, 1.601238, 1, 0, 0.7098039, 1,
1.212345, -1.662664, 1.734711, 1, 0, 0.7019608, 1,
1.219648, -2.077198, 0.9389503, 1, 0, 0.6941177, 1,
1.2203, 0.8727409, 2.027442, 1, 0, 0.6901961, 1,
1.225995, -1.382661, 2.246647, 1, 0, 0.682353, 1,
1.226249, 0.04084844, 0.8839618, 1, 0, 0.6784314, 1,
1.228712, -1.421803, 1.861608, 1, 0, 0.6705883, 1,
1.234992, 0.2783732, 0.9371551, 1, 0, 0.6666667, 1,
1.238521, 0.5360067, 0.219281, 1, 0, 0.6588235, 1,
1.239813, -1.003472, 1.942723, 1, 0, 0.654902, 1,
1.252045, 0.6666727, 1.636518, 1, 0, 0.6470588, 1,
1.279037, -0.3089673, 1.249143, 1, 0, 0.6431373, 1,
1.281609, 0.2309615, 1.179436, 1, 0, 0.6352941, 1,
1.282046, -0.4149157, 2.53618, 1, 0, 0.6313726, 1,
1.283223, -1.091446, 0.5332776, 1, 0, 0.6235294, 1,
1.284791, -0.5384803, 1.668166, 1, 0, 0.6196079, 1,
1.292762, -1.756594, 3.694303, 1, 0, 0.6117647, 1,
1.296342, 0.1393465, 3.209021, 1, 0, 0.6078432, 1,
1.307918, -1.638334, 1.506418, 1, 0, 0.6, 1,
1.313874, -0.6112721, 2.896397, 1, 0, 0.5921569, 1,
1.327359, 1.304592, 1.031363, 1, 0, 0.5882353, 1,
1.328248, 1.442813, 1.023279, 1, 0, 0.5803922, 1,
1.334377, -0.01434394, 2.609728, 1, 0, 0.5764706, 1,
1.344974, -2.029939, 1.553049, 1, 0, 0.5686275, 1,
1.355664, -0.1288993, 0.7947898, 1, 0, 0.5647059, 1,
1.36112, -1.172768, 1.996844, 1, 0, 0.5568628, 1,
1.36234, 0.8362518, 0.893696, 1, 0, 0.5529412, 1,
1.364251, 0.7856441, 0.7413797, 1, 0, 0.5450981, 1,
1.372767, 0.8235219, 1.003242, 1, 0, 0.5411765, 1,
1.376411, 0.5586153, 1.674457, 1, 0, 0.5333334, 1,
1.377131, 0.9029226, 0.7559577, 1, 0, 0.5294118, 1,
1.399, -0.01584616, 3.365868, 1, 0, 0.5215687, 1,
1.399149, -0.6369183, 2.847976, 1, 0, 0.5176471, 1,
1.409983, 0.2168268, 1.696179, 1, 0, 0.509804, 1,
1.444948, 0.1522058, 1.603467, 1, 0, 0.5058824, 1,
1.459535, 0.7354617, 0.02592417, 1, 0, 0.4980392, 1,
1.459892, 1.666086, 0.9493421, 1, 0, 0.4901961, 1,
1.462845, -1.665384, 3.291093, 1, 0, 0.4862745, 1,
1.466999, -0.4579185, 1.624762, 1, 0, 0.4784314, 1,
1.46842, -0.2439855, 1.273035, 1, 0, 0.4745098, 1,
1.471691, -1.000496, 1.971258, 1, 0, 0.4666667, 1,
1.473371, 1.360297, -0.006311988, 1, 0, 0.4627451, 1,
1.482818, 0.5499433, 1.19029, 1, 0, 0.454902, 1,
1.486245, 0.2052209, -0.05526219, 1, 0, 0.4509804, 1,
1.491826, 0.3224563, 0.124333, 1, 0, 0.4431373, 1,
1.515045, 1.238208, 1.643316, 1, 0, 0.4392157, 1,
1.518293, 1.571554, 0.651511, 1, 0, 0.4313726, 1,
1.521717, 0.126292, 3.004007, 1, 0, 0.427451, 1,
1.526428, 1.730826, 0.4407309, 1, 0, 0.4196078, 1,
1.526456, -0.6124813, 2.848645, 1, 0, 0.4156863, 1,
1.529925, -0.5256445, 2.63397, 1, 0, 0.4078431, 1,
1.53065, 1.502031, 0.7403324, 1, 0, 0.4039216, 1,
1.532712, -1.333888, 1.392675, 1, 0, 0.3960784, 1,
1.537217, -0.1233573, 2.161079, 1, 0, 0.3882353, 1,
1.550684, -0.610451, 1.660534, 1, 0, 0.3843137, 1,
1.561014, 0.299024, 1.242695, 1, 0, 0.3764706, 1,
1.563858, 0.9415041, 3.632211, 1, 0, 0.372549, 1,
1.56502, 0.0500296, 1.457357, 1, 0, 0.3647059, 1,
1.568793, -0.775255, 2.974036, 1, 0, 0.3607843, 1,
1.587572, -0.3917536, 1.737552, 1, 0, 0.3529412, 1,
1.594946, 1.072627, 1.808052, 1, 0, 0.3490196, 1,
1.595417, 0.007704888, 2.011767, 1, 0, 0.3411765, 1,
1.605955, -0.7319434, 2.379061, 1, 0, 0.3372549, 1,
1.615886, 0.5175564, 1.713529, 1, 0, 0.3294118, 1,
1.632663, 2.365767, 1.503354, 1, 0, 0.3254902, 1,
1.648397, -1.356979, 3.58478, 1, 0, 0.3176471, 1,
1.648456, -1.753899, 1.095303, 1, 0, 0.3137255, 1,
1.652485, -0.3822309, 3.287673, 1, 0, 0.3058824, 1,
1.654307, 0.6527228, 3.920808, 1, 0, 0.2980392, 1,
1.654431, -0.7036214, 1.872023, 1, 0, 0.2941177, 1,
1.660829, -0.9331819, 1.743197, 1, 0, 0.2862745, 1,
1.666521, 0.5746589, 1.331962, 1, 0, 0.282353, 1,
1.667534, -0.4845435, 2.762766, 1, 0, 0.2745098, 1,
1.673717, -0.1317797, 1.070134, 1, 0, 0.2705882, 1,
1.674938, -0.400678, 3.658993, 1, 0, 0.2627451, 1,
1.703527, -1.205992, 2.684247, 1, 0, 0.2588235, 1,
1.704537, 0.9170021, 2.460025, 1, 0, 0.2509804, 1,
1.710281, -1.665702, 4.460568, 1, 0, 0.2470588, 1,
1.715801, -0.5499485, 0.3647611, 1, 0, 0.2392157, 1,
1.740494, -0.1316201, 2.584909, 1, 0, 0.2352941, 1,
1.749632, -0.6561183, 2.666508, 1, 0, 0.227451, 1,
1.752302, -0.6353123, 1.512525, 1, 0, 0.2235294, 1,
1.757978, 0.8690718, 1.397035, 1, 0, 0.2156863, 1,
1.783856, 0.5005168, 1.154659, 1, 0, 0.2117647, 1,
1.78507, 1.796511, 0.05438004, 1, 0, 0.2039216, 1,
1.81547, 0.439723, 2.402075, 1, 0, 0.1960784, 1,
1.82053, 0.3167402, 0.002852377, 1, 0, 0.1921569, 1,
1.857426, 0.5180277, 2.043288, 1, 0, 0.1843137, 1,
1.874755, 0.08667465, 1.356429, 1, 0, 0.1803922, 1,
1.881657, 0.3307003, 0.9967103, 1, 0, 0.172549, 1,
1.898218, 1.024735, 1.284192, 1, 0, 0.1686275, 1,
1.933267, -0.5822243, 1.304216, 1, 0, 0.1607843, 1,
1.942786, 2.089251, 0.1899255, 1, 0, 0.1568628, 1,
1.966836, -0.4937673, 1.506793, 1, 0, 0.1490196, 1,
1.981382, -0.50892, 0.7159998, 1, 0, 0.145098, 1,
2.018201, -0.02956369, 1.708464, 1, 0, 0.1372549, 1,
2.024767, 0.6241678, 1.053179, 1, 0, 0.1333333, 1,
2.033484, -0.7697438, 0.4151216, 1, 0, 0.1254902, 1,
2.082398, 1.658316, 0.6954747, 1, 0, 0.1215686, 1,
2.094952, -0.2538775, 1.279564, 1, 0, 0.1137255, 1,
2.177926, -1.834626, 1.20225, 1, 0, 0.1098039, 1,
2.264693, 1.319588, -1.315295, 1, 0, 0.1019608, 1,
2.267577, 0.2537515, 1.498621, 1, 0, 0.09411765, 1,
2.297656, 0.1441285, 1.899193, 1, 0, 0.09019608, 1,
2.310518, 2.703244, -0.1172467, 1, 0, 0.08235294, 1,
2.373048, -2.833812, 2.302106, 1, 0, 0.07843138, 1,
2.39762, 0.6873634, 0.8729756, 1, 0, 0.07058824, 1,
2.408345, 1.073322, -0.262579, 1, 0, 0.06666667, 1,
2.422923, 0.9021635, 0.9383752, 1, 0, 0.05882353, 1,
2.432453, -1.213749, 1.959951, 1, 0, 0.05490196, 1,
2.531163, -0.3008116, 1.718965, 1, 0, 0.04705882, 1,
2.559484, -0.02180078, 2.661777, 1, 0, 0.04313726, 1,
2.562397, 0.2525769, 1.865813, 1, 0, 0.03529412, 1,
2.568792, -1.274276, 2.379481, 1, 0, 0.03137255, 1,
2.643286, -1.061304, 1.151005, 1, 0, 0.02352941, 1,
2.826452, 1.033262, 1.613501, 1, 0, 0.01960784, 1,
3.144342, -0.9506869, 3.083648, 1, 0, 0.01176471, 1,
3.319318, 0.3520477, 1.996974, 1, 0, 0.007843138, 1
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
-0.206349, -4.128983, -6.440478, 0, -0.5, 0.5, 0.5,
-0.206349, -4.128983, -6.440478, 1, -0.5, 0.5, 0.5,
-0.206349, -4.128983, -6.440478, 1, 1.5, 0.5, 0.5,
-0.206349, -4.128983, -6.440478, 0, 1.5, 0.5, 0.5
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
-4.927217, 0.5655867, -6.440478, 0, -0.5, 0.5, 0.5,
-4.927217, 0.5655867, -6.440478, 1, -0.5, 0.5, 0.5,
-4.927217, 0.5655867, -6.440478, 1, 1.5, 0.5, 0.5,
-4.927217, 0.5655867, -6.440478, 0, 1.5, 0.5, 0.5
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
-4.927217, -4.128983, 0.4152427, 0, -0.5, 0.5, 0.5,
-4.927217, -4.128983, 0.4152427, 1, -0.5, 0.5, 0.5,
-4.927217, -4.128983, 0.4152427, 1, 1.5, 0.5, 0.5,
-4.927217, -4.128983, 0.4152427, 0, 1.5, 0.5, 0.5
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
-2, -3.045621, -4.858388,
2, -3.045621, -4.858388,
-2, -3.045621, -4.858388,
-2, -3.226182, -5.12207,
0, -3.045621, -4.858388,
0, -3.226182, -5.12207,
2, -3.045621, -4.858388,
2, -3.226182, -5.12207
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
"0",
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
-2, -3.587302, -5.649433, 0, -0.5, 0.5, 0.5,
-2, -3.587302, -5.649433, 1, -0.5, 0.5, 0.5,
-2, -3.587302, -5.649433, 1, 1.5, 0.5, 0.5,
-2, -3.587302, -5.649433, 0, 1.5, 0.5, 0.5,
0, -3.587302, -5.649433, 0, -0.5, 0.5, 0.5,
0, -3.587302, -5.649433, 1, -0.5, 0.5, 0.5,
0, -3.587302, -5.649433, 1, 1.5, 0.5, 0.5,
0, -3.587302, -5.649433, 0, 1.5, 0.5, 0.5,
2, -3.587302, -5.649433, 0, -0.5, 0.5, 0.5,
2, -3.587302, -5.649433, 1, -0.5, 0.5, 0.5,
2, -3.587302, -5.649433, 1, 1.5, 0.5, 0.5,
2, -3.587302, -5.649433, 0, 1.5, 0.5, 0.5
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
-3.837786, -2, -4.858388,
-3.837786, 4, -4.858388,
-3.837786, -2, -4.858388,
-4.019358, -2, -5.12207,
-3.837786, 0, -4.858388,
-4.019358, 0, -5.12207,
-3.837786, 2, -4.858388,
-4.019358, 2, -5.12207,
-3.837786, 4, -4.858388,
-4.019358, 4, -5.12207
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
"2",
"4"
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
-4.382502, -2, -5.649433, 0, -0.5, 0.5, 0.5,
-4.382502, -2, -5.649433, 1, -0.5, 0.5, 0.5,
-4.382502, -2, -5.649433, 1, 1.5, 0.5, 0.5,
-4.382502, -2, -5.649433, 0, 1.5, 0.5, 0.5,
-4.382502, 0, -5.649433, 0, -0.5, 0.5, 0.5,
-4.382502, 0, -5.649433, 1, -0.5, 0.5, 0.5,
-4.382502, 0, -5.649433, 1, 1.5, 0.5, 0.5,
-4.382502, 0, -5.649433, 0, 1.5, 0.5, 0.5,
-4.382502, 2, -5.649433, 0, -0.5, 0.5, 0.5,
-4.382502, 2, -5.649433, 1, -0.5, 0.5, 0.5,
-4.382502, 2, -5.649433, 1, 1.5, 0.5, 0.5,
-4.382502, 2, -5.649433, 0, 1.5, 0.5, 0.5,
-4.382502, 4, -5.649433, 0, -0.5, 0.5, 0.5,
-4.382502, 4, -5.649433, 1, -0.5, 0.5, 0.5,
-4.382502, 4, -5.649433, 1, 1.5, 0.5, 0.5,
-4.382502, 4, -5.649433, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.837786, -3.045621, -4,
-3.837786, -3.045621, 4,
-3.837786, -3.045621, -4,
-4.019358, -3.226182, -4,
-3.837786, -3.045621, -2,
-4.019358, -3.226182, -2,
-3.837786, -3.045621, 0,
-4.019358, -3.226182, 0,
-3.837786, -3.045621, 2,
-4.019358, -3.226182, 2,
-3.837786, -3.045621, 4,
-4.019358, -3.226182, 4
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
-4.382502, -3.587302, -4, 0, -0.5, 0.5, 0.5,
-4.382502, -3.587302, -4, 1, -0.5, 0.5, 0.5,
-4.382502, -3.587302, -4, 1, 1.5, 0.5, 0.5,
-4.382502, -3.587302, -4, 0, 1.5, 0.5, 0.5,
-4.382502, -3.587302, -2, 0, -0.5, 0.5, 0.5,
-4.382502, -3.587302, -2, 1, -0.5, 0.5, 0.5,
-4.382502, -3.587302, -2, 1, 1.5, 0.5, 0.5,
-4.382502, -3.587302, -2, 0, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 0, 0, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 0, 1, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 0, 1, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 0, 0, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 2, 0, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 2, 1, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 2, 1, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 2, 0, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 4, 0, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 4, 1, -0.5, 0.5, 0.5,
-4.382502, -3.587302, 4, 1, 1.5, 0.5, 0.5,
-4.382502, -3.587302, 4, 0, 1.5, 0.5, 0.5
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
-3.837786, -3.045621, -4.858388,
-3.837786, 4.176795, -4.858388,
-3.837786, -3.045621, 5.688874,
-3.837786, 4.176795, 5.688874,
-3.837786, -3.045621, -4.858388,
-3.837786, -3.045621, 5.688874,
-3.837786, 4.176795, -4.858388,
-3.837786, 4.176795, 5.688874,
-3.837786, -3.045621, -4.858388,
3.425088, -3.045621, -4.858388,
-3.837786, -3.045621, 5.688874,
3.425088, -3.045621, 5.688874,
-3.837786, 4.176795, -4.858388,
3.425088, 4.176795, -4.858388,
-3.837786, 4.176795, 5.688874,
3.425088, 4.176795, 5.688874,
3.425088, -3.045621, -4.858388,
3.425088, 4.176795, -4.858388,
3.425088, -3.045621, 5.688874,
3.425088, 4.176795, 5.688874,
3.425088, -3.045621, -4.858388,
3.425088, -3.045621, 5.688874,
3.425088, 4.176795, -4.858388,
3.425088, 4.176795, 5.688874
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
var radius = 7.850738;
var distance = 34.92882;
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
mvMatrix.translate( 0.206349, -0.5655867, -0.4152427 );
mvMatrix.scale( 1.168735, 1.175282, 0.8047938 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92882);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


