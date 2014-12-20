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
-2.623298, -3.137572, -4.128424, 1, 0, 0, 1,
-2.561616, 1.030818, 0.6206558, 1, 0.007843138, 0, 1,
-2.506349, 0.3251394, -1.615881, 1, 0.01176471, 0, 1,
-2.430808, -0.9712901, -0.9218972, 1, 0.01960784, 0, 1,
-2.429504, -0.2322466, -1.97512, 1, 0.02352941, 0, 1,
-2.36404, -0.6833811, -0.7489582, 1, 0.03137255, 0, 1,
-2.344206, -0.3399356, -0.6851626, 1, 0.03529412, 0, 1,
-2.316875, 0.8604604, -0.8099968, 1, 0.04313726, 0, 1,
-2.267116, 1.48309, -2.343054, 1, 0.04705882, 0, 1,
-2.254468, -2.531584, -2.683311, 1, 0.05490196, 0, 1,
-2.230714, -0.1627407, -2.561901, 1, 0.05882353, 0, 1,
-2.18508, 0.7738301, -1.432136, 1, 0.06666667, 0, 1,
-2.165112, 0.4014457, -0.9608979, 1, 0.07058824, 0, 1,
-2.164062, -2.066425, -1.889754, 1, 0.07843138, 0, 1,
-2.128624, 0.6616805, -0.9991187, 1, 0.08235294, 0, 1,
-2.117691, 0.004237105, -2.72254, 1, 0.09019608, 0, 1,
-2.108016, -1.303766, -2.004305, 1, 0.09411765, 0, 1,
-2.037735, 0.581053, -0.1920182, 1, 0.1019608, 0, 1,
-2.030817, 1.291197, -1.611783, 1, 0.1098039, 0, 1,
-2.019243, 1.019354, -1.972998, 1, 0.1137255, 0, 1,
-2.014375, -0.8590319, -1.373134, 1, 0.1215686, 0, 1,
-2.008665, 0.1630444, 0.0606015, 1, 0.1254902, 0, 1,
-1.956414, -0.1294128, -1.984543, 1, 0.1333333, 0, 1,
-1.932799, -0.5343261, -0.5386153, 1, 0.1372549, 0, 1,
-1.906031, -0.06404848, -2.451059, 1, 0.145098, 0, 1,
-1.899645, -0.9662411, -1.912134, 1, 0.1490196, 0, 1,
-1.893367, 0.03204804, -3.326095, 1, 0.1568628, 0, 1,
-1.842541, -0.4776122, -0.4126149, 1, 0.1607843, 0, 1,
-1.838975, -2.497967, -2.218651, 1, 0.1686275, 0, 1,
-1.83726, 0.7807186, -0.6958531, 1, 0.172549, 0, 1,
-1.823213, -1.120215, -2.28824, 1, 0.1803922, 0, 1,
-1.806926, -0.96298, -2.091077, 1, 0.1843137, 0, 1,
-1.799419, 0.5917534, -1.138921, 1, 0.1921569, 0, 1,
-1.794011, 1.017212, 0.07743437, 1, 0.1960784, 0, 1,
-1.770924, -1.093159, -3.662645, 1, 0.2039216, 0, 1,
-1.769544, -1.418545, -3.459147, 1, 0.2117647, 0, 1,
-1.732244, -0.2094183, -1.678894, 1, 0.2156863, 0, 1,
-1.71965, -1.42561, -1.560164, 1, 0.2235294, 0, 1,
-1.701052, -0.8009716, -1.949767, 1, 0.227451, 0, 1,
-1.698534, -0.2327792, -2.355643, 1, 0.2352941, 0, 1,
-1.689127, -0.530376, -2.173956, 1, 0.2392157, 0, 1,
-1.679444, 1.427939, -1.337576, 1, 0.2470588, 0, 1,
-1.63766, 0.3148115, -1.687754, 1, 0.2509804, 0, 1,
-1.61292, 1.580472, -3.341, 1, 0.2588235, 0, 1,
-1.606285, -0.2844929, -2.305087, 1, 0.2627451, 0, 1,
-1.60462, 2.540193, 0.780869, 1, 0.2705882, 0, 1,
-1.601889, 0.9175929, 0.3280962, 1, 0.2745098, 0, 1,
-1.588781, -0.4806607, -1.436434, 1, 0.282353, 0, 1,
-1.582258, 0.09964023, -2.27595, 1, 0.2862745, 0, 1,
-1.564651, -0.4522244, -2.570828, 1, 0.2941177, 0, 1,
-1.545949, -1.166712, -1.649771, 1, 0.3019608, 0, 1,
-1.532532, 0.8620374, 0.3542926, 1, 0.3058824, 0, 1,
-1.53199, 1.412263, 0.4186523, 1, 0.3137255, 0, 1,
-1.518689, 0.279939, -2.703249, 1, 0.3176471, 0, 1,
-1.514392, -0.4443587, -1.25655, 1, 0.3254902, 0, 1,
-1.508755, -1.065926, -2.989433, 1, 0.3294118, 0, 1,
-1.505325, -0.9464751, -4.328261, 1, 0.3372549, 0, 1,
-1.500851, 0.599694, -1.913072, 1, 0.3411765, 0, 1,
-1.485359, -0.6663892, -1.143529, 1, 0.3490196, 0, 1,
-1.479888, 0.02444774, -4.062346, 1, 0.3529412, 0, 1,
-1.478926, -0.9096601, -1.870236, 1, 0.3607843, 0, 1,
-1.459556, 0.4556415, -1.919965, 1, 0.3647059, 0, 1,
-1.458395, -1.176833, -2.048451, 1, 0.372549, 0, 1,
-1.42582, 1.981798, -0.7433115, 1, 0.3764706, 0, 1,
-1.422037, 0.5495811, -0.9216586, 1, 0.3843137, 0, 1,
-1.407742, -1.187778, -3.685778, 1, 0.3882353, 0, 1,
-1.393791, -0.8137106, -2.658237, 1, 0.3960784, 0, 1,
-1.389225, 0.6591086, 1.482608, 1, 0.4039216, 0, 1,
-1.387513, -0.6739919, -2.462446, 1, 0.4078431, 0, 1,
-1.386848, 0.3046663, -2.049685, 1, 0.4156863, 0, 1,
-1.384422, 1.072695, -0.8481809, 1, 0.4196078, 0, 1,
-1.381732, 0.8553648, -1.481052, 1, 0.427451, 0, 1,
-1.378649, 2.144287, -2.313499, 1, 0.4313726, 0, 1,
-1.377995, 0.004002674, -2.557326, 1, 0.4392157, 0, 1,
-1.375765, 0.05258618, -0.427745, 1, 0.4431373, 0, 1,
-1.37389, 0.5775689, -3.049106, 1, 0.4509804, 0, 1,
-1.37326, -0.1934475, -2.432846, 1, 0.454902, 0, 1,
-1.373256, -0.2555862, -1.734002, 1, 0.4627451, 0, 1,
-1.368905, 0.01284042, -2.985048, 1, 0.4666667, 0, 1,
-1.355633, 0.1499981, -0.8095524, 1, 0.4745098, 0, 1,
-1.353533, 0.2239771, -1.12653, 1, 0.4784314, 0, 1,
-1.353511, -0.6375175, -0.871693, 1, 0.4862745, 0, 1,
-1.351728, -0.3308047, -2.046438, 1, 0.4901961, 0, 1,
-1.347867, -0.3950214, -2.160526, 1, 0.4980392, 0, 1,
-1.340502, -0.5379085, -1.25971, 1, 0.5058824, 0, 1,
-1.340241, 1.501358, 0.9515356, 1, 0.509804, 0, 1,
-1.340221, 0.6284825, 1.369134, 1, 0.5176471, 0, 1,
-1.338455, 1.953543, 0.2241806, 1, 0.5215687, 0, 1,
-1.333861, -0.3559097, -1.304417, 1, 0.5294118, 0, 1,
-1.324112, -0.08005185, -1.406299, 1, 0.5333334, 0, 1,
-1.324068, 0.6970883, -3.235024, 1, 0.5411765, 0, 1,
-1.308336, 0.1273282, 0.5699841, 1, 0.5450981, 0, 1,
-1.297529, 0.3168721, -2.902042, 1, 0.5529412, 0, 1,
-1.283091, -0.8842033, -3.116645, 1, 0.5568628, 0, 1,
-1.268453, -0.7859519, -2.362943, 1, 0.5647059, 0, 1,
-1.262262, -1.134741, -2.531158, 1, 0.5686275, 0, 1,
-1.245902, -0.4679891, -0.6949536, 1, 0.5764706, 0, 1,
-1.24267, -2.881433, -2.085966, 1, 0.5803922, 0, 1,
-1.233127, -0.1844639, -0.6957161, 1, 0.5882353, 0, 1,
-1.22976, 1.796967, -0.02197745, 1, 0.5921569, 0, 1,
-1.224145, -0.2674005, -2.717071, 1, 0.6, 0, 1,
-1.221011, -0.2725765, -1.726078, 1, 0.6078432, 0, 1,
-1.219996, -0.1102231, -2.425213, 1, 0.6117647, 0, 1,
-1.217483, 0.578813, -0.09731156, 1, 0.6196079, 0, 1,
-1.214679, 0.2248845, -1.5662, 1, 0.6235294, 0, 1,
-1.213092, -1.180162, -1.914851, 1, 0.6313726, 0, 1,
-1.207632, -0.5596561, -2.471919, 1, 0.6352941, 0, 1,
-1.199967, -0.5784717, -1.890122, 1, 0.6431373, 0, 1,
-1.187434, 0.376536, -1.681925, 1, 0.6470588, 0, 1,
-1.184255, 0.1150333, -0.268357, 1, 0.654902, 0, 1,
-1.173926, 0.5392656, -0.1899597, 1, 0.6588235, 0, 1,
-1.172237, 1.038134, -0.7120152, 1, 0.6666667, 0, 1,
-1.171115, -1.620377, -2.484564, 1, 0.6705883, 0, 1,
-1.163171, 0.6034096, -1.822669, 1, 0.6784314, 0, 1,
-1.15798, -0.2462567, -2.237834, 1, 0.682353, 0, 1,
-1.154211, -0.2670776, -1.26862, 1, 0.6901961, 0, 1,
-1.143773, 0.6703349, -0.8233799, 1, 0.6941177, 0, 1,
-1.140182, -0.001609857, -0.5136218, 1, 0.7019608, 0, 1,
-1.13188, -1.243108, -4.156574, 1, 0.7098039, 0, 1,
-1.127696, -0.9194983, -2.524254, 1, 0.7137255, 0, 1,
-1.126162, 0.6921437, -1.950696, 1, 0.7215686, 0, 1,
-1.117827, -0.508003, -1.121722, 1, 0.7254902, 0, 1,
-1.111115, 0.7665176, -1.395211, 1, 0.7333333, 0, 1,
-1.110248, -0.7161035, -2.469308, 1, 0.7372549, 0, 1,
-1.108393, 0.8085363, -2.032673, 1, 0.7450981, 0, 1,
-1.10553, 0.09186815, -1.710449, 1, 0.7490196, 0, 1,
-1.104659, -1.619723, -2.125105, 1, 0.7568628, 0, 1,
-1.095747, -1.030429, -1.673286, 1, 0.7607843, 0, 1,
-1.089608, 1.505977, -1.524274, 1, 0.7686275, 0, 1,
-1.086424, -0.7073999, -3.780366, 1, 0.772549, 0, 1,
-1.078526, 1.139647, -0.3355841, 1, 0.7803922, 0, 1,
-1.078305, -1.264989, -2.445215, 1, 0.7843137, 0, 1,
-1.073901, -0.671747, -1.760114, 1, 0.7921569, 0, 1,
-1.071179, 0.6108792, -0.9269545, 1, 0.7960784, 0, 1,
-1.068846, 0.1923137, -2.939142, 1, 0.8039216, 0, 1,
-1.063924, 0.2581735, -0.1793519, 1, 0.8117647, 0, 1,
-1.056406, -1.882013, -3.743485, 1, 0.8156863, 0, 1,
-1.050496, 0.8029003, 1.068179, 1, 0.8235294, 0, 1,
-1.045306, 0.02924745, -0.7570276, 1, 0.827451, 0, 1,
-1.038089, 0.482328, -0.9014335, 1, 0.8352941, 0, 1,
-1.03801, 0.8885467, -1.818095, 1, 0.8392157, 0, 1,
-1.034151, 1.625689, 0.04474096, 1, 0.8470588, 0, 1,
-1.033664, -0.6995852, -1.622318, 1, 0.8509804, 0, 1,
-1.031733, -1.079943, -1.478996, 1, 0.8588235, 0, 1,
-1.02903, -0.8367426, -2.343161, 1, 0.8627451, 0, 1,
-1.024928, -0.5937812, -2.144919, 1, 0.8705882, 0, 1,
-1.023196, 0.5995281, -0.974138, 1, 0.8745098, 0, 1,
-1.020231, -1.019872, -2.132264, 1, 0.8823529, 0, 1,
-1.005914, -0.899189, -1.594264, 1, 0.8862745, 0, 1,
-1.004357, -0.5501199, -1.947613, 1, 0.8941177, 0, 1,
-1.000866, -0.2563059, -0.3618668, 1, 0.8980392, 0, 1,
-0.9970265, -1.295475, -1.081129, 1, 0.9058824, 0, 1,
-0.9953731, -0.5133593, -1.31418, 1, 0.9137255, 0, 1,
-0.9911411, 0.6372933, -1.85241, 1, 0.9176471, 0, 1,
-0.9880742, -0.9686487, -2.290051, 1, 0.9254902, 0, 1,
-0.9861286, -1.262661, -2.910095, 1, 0.9294118, 0, 1,
-0.9842994, 0.7841912, -2.837586, 1, 0.9372549, 0, 1,
-0.9825409, -0.1383605, -1.711466, 1, 0.9411765, 0, 1,
-0.979174, 0.9876848, -2.386999, 1, 0.9490196, 0, 1,
-0.9739094, -0.6587698, -2.692366, 1, 0.9529412, 0, 1,
-0.9735652, -1.715211, -2.153383, 1, 0.9607843, 0, 1,
-0.9730622, -1.335883, -1.988329, 1, 0.9647059, 0, 1,
-0.9666876, 0.2679499, -2.088743, 1, 0.972549, 0, 1,
-0.9663978, -0.6079532, -2.117515, 1, 0.9764706, 0, 1,
-0.9659403, -0.2538974, -2.483047, 1, 0.9843137, 0, 1,
-0.9632592, 1.146407, -0.4400119, 1, 0.9882353, 0, 1,
-0.9573449, -0.8233765, -0.9890047, 1, 0.9960784, 0, 1,
-0.9567753, 1.146294, -0.5013514, 0.9960784, 1, 0, 1,
-0.9560891, 0.6078377, -1.636603, 0.9921569, 1, 0, 1,
-0.9516243, -0.5638505, -1.520592, 0.9843137, 1, 0, 1,
-0.9487019, 0.8497925, 0.3106648, 0.9803922, 1, 0, 1,
-0.9481976, -0.8386147, -1.921198, 0.972549, 1, 0, 1,
-0.9457059, 0.757445, -0.7150166, 0.9686275, 1, 0, 1,
-0.9447943, 0.7827209, -1.500929, 0.9607843, 1, 0, 1,
-0.9403522, -1.122226, -3.165532, 0.9568627, 1, 0, 1,
-0.9323595, -0.1719762, -0.7820916, 0.9490196, 1, 0, 1,
-0.9322445, 0.9631618, -0.7849381, 0.945098, 1, 0, 1,
-0.9278844, 1.100994, -2.332028, 0.9372549, 1, 0, 1,
-0.9253803, -0.2167477, -4.596906, 0.9333333, 1, 0, 1,
-0.9213941, 0.8388757, -0.8122169, 0.9254902, 1, 0, 1,
-0.9204766, 1.201285, -0.2953869, 0.9215686, 1, 0, 1,
-0.9191474, 1.04528, -2.338551, 0.9137255, 1, 0, 1,
-0.917141, 0.1003825, -2.903785, 0.9098039, 1, 0, 1,
-0.9098821, 0.516295, -3.26533, 0.9019608, 1, 0, 1,
-0.9096393, 0.6098034, -2.484401, 0.8941177, 1, 0, 1,
-0.9015828, -1.633676, -3.23924, 0.8901961, 1, 0, 1,
-0.8979058, -0.1380184, -2.031654, 0.8823529, 1, 0, 1,
-0.896127, -0.2093828, -2.437929, 0.8784314, 1, 0, 1,
-0.8958787, -0.04027216, -0.6898682, 0.8705882, 1, 0, 1,
-0.8957238, 0.2647642, 0.3646646, 0.8666667, 1, 0, 1,
-0.8879493, 0.6910052, -0.6474788, 0.8588235, 1, 0, 1,
-0.8799208, -0.6071165, -2.583474, 0.854902, 1, 0, 1,
-0.8557824, -1.167737, -3.633024, 0.8470588, 1, 0, 1,
-0.8533139, 0.2283199, -0.1313506, 0.8431373, 1, 0, 1,
-0.848807, 1.023752, -0.6929425, 0.8352941, 1, 0, 1,
-0.8463895, -2.574658, -3.029433, 0.8313726, 1, 0, 1,
-0.8447599, -0.862222, -4.270637, 0.8235294, 1, 0, 1,
-0.8443063, -0.5559916, -0.6489941, 0.8196079, 1, 0, 1,
-0.8442824, -0.5917668, -0.4232006, 0.8117647, 1, 0, 1,
-0.8355957, 1.389002, -0.1067447, 0.8078431, 1, 0, 1,
-0.8277864, 1.522565, -1.510943, 0.8, 1, 0, 1,
-0.8257676, -0.08125663, -2.449671, 0.7921569, 1, 0, 1,
-0.82553, 0.3921331, -2.368253, 0.7882353, 1, 0, 1,
-0.8236064, 0.4384354, -0.4588949, 0.7803922, 1, 0, 1,
-0.8189139, 0.1585658, -2.075138, 0.7764706, 1, 0, 1,
-0.8140395, -0.626651, -1.070951, 0.7686275, 1, 0, 1,
-0.8138271, -2.066367, -2.512482, 0.7647059, 1, 0, 1,
-0.81236, 0.1690701, -0.239016, 0.7568628, 1, 0, 1,
-0.7996868, 1.154403, -1.902713, 0.7529412, 1, 0, 1,
-0.7983434, -0.2924835, -2.652518, 0.7450981, 1, 0, 1,
-0.791053, 0.3474399, -1.072348, 0.7411765, 1, 0, 1,
-0.7771086, 0.6071902, 1.627669, 0.7333333, 1, 0, 1,
-0.7735286, 0.3169513, -0.1558723, 0.7294118, 1, 0, 1,
-0.7697065, -0.3972534, -2.563459, 0.7215686, 1, 0, 1,
-0.7690044, -0.6170996, -3.804052, 0.7176471, 1, 0, 1,
-0.7678494, -1.040561, -0.3265955, 0.7098039, 1, 0, 1,
-0.7666258, 0.4642872, -0.2340576, 0.7058824, 1, 0, 1,
-0.7650448, 2.188843, -0.2155837, 0.6980392, 1, 0, 1,
-0.7641947, -1.742023, -2.974293, 0.6901961, 1, 0, 1,
-0.7587851, 0.5112506, -3.743207, 0.6862745, 1, 0, 1,
-0.7517785, -0.1042951, -2.211987, 0.6784314, 1, 0, 1,
-0.7502958, 0.06440068, -1.493683, 0.6745098, 1, 0, 1,
-0.7494576, -0.2530273, -2.227587, 0.6666667, 1, 0, 1,
-0.7492954, 0.3675908, -1.72641, 0.6627451, 1, 0, 1,
-0.7465243, 0.04654734, -2.196981, 0.654902, 1, 0, 1,
-0.7333709, 0.4199682, -2.057326, 0.6509804, 1, 0, 1,
-0.7325653, -0.5633107, -2.204185, 0.6431373, 1, 0, 1,
-0.7243131, 0.0392498, 0.3050731, 0.6392157, 1, 0, 1,
-0.7236984, -1.753821, -4.337115, 0.6313726, 1, 0, 1,
-0.7099172, 0.2941021, -0.02937826, 0.627451, 1, 0, 1,
-0.7098645, 0.5535464, -1.096664, 0.6196079, 1, 0, 1,
-0.7079584, -0.363234, -2.662312, 0.6156863, 1, 0, 1,
-0.7043826, 1.223067, 0.548329, 0.6078432, 1, 0, 1,
-0.7021348, 0.05974511, -2.493764, 0.6039216, 1, 0, 1,
-0.7007645, 0.9035407, -0.9966246, 0.5960785, 1, 0, 1,
-0.6979108, 0.1512697, -0.9881911, 0.5882353, 1, 0, 1,
-0.6965693, -0.7506664, -4.707955, 0.5843138, 1, 0, 1,
-0.6890594, -0.134277, -2.435581, 0.5764706, 1, 0, 1,
-0.6848292, 0.713069, -1.343303, 0.572549, 1, 0, 1,
-0.6846343, 1.827051, 0.7215252, 0.5647059, 1, 0, 1,
-0.6841582, 1.293827, -0.7739967, 0.5607843, 1, 0, 1,
-0.683715, 1.447425, -2.710289, 0.5529412, 1, 0, 1,
-0.68071, -0.0008260889, -3.079362, 0.5490196, 1, 0, 1,
-0.6795213, 0.04825288, 0.1087755, 0.5411765, 1, 0, 1,
-0.6771583, -0.7382546, -1.191654, 0.5372549, 1, 0, 1,
-0.6759142, 0.3277003, 0.6250746, 0.5294118, 1, 0, 1,
-0.6718748, -0.640997, -3.882145, 0.5254902, 1, 0, 1,
-0.6672431, -0.3288678, -1.110326, 0.5176471, 1, 0, 1,
-0.6599545, 1.829065, -0.4443769, 0.5137255, 1, 0, 1,
-0.6541757, -0.5773782, -2.244739, 0.5058824, 1, 0, 1,
-0.6440057, -1.549053, -3.555527, 0.5019608, 1, 0, 1,
-0.6437522, -0.3380979, -1.55182, 0.4941176, 1, 0, 1,
-0.6433968, -0.9765162, -2.303573, 0.4862745, 1, 0, 1,
-0.6379598, 1.347263, 0.9568797, 0.4823529, 1, 0, 1,
-0.6315053, -1.428605, -2.708523, 0.4745098, 1, 0, 1,
-0.6299471, -1.451102, -2.786068, 0.4705882, 1, 0, 1,
-0.6266866, 0.5629601, -0.3989751, 0.4627451, 1, 0, 1,
-0.622143, 0.6683018, 0.07683282, 0.4588235, 1, 0, 1,
-0.6213154, 0.187944, -0.9211485, 0.4509804, 1, 0, 1,
-0.6211187, -0.4739098, -2.931715, 0.4470588, 1, 0, 1,
-0.6207958, -0.006663161, -1.178734, 0.4392157, 1, 0, 1,
-0.6151303, -0.95439, -2.595945, 0.4352941, 1, 0, 1,
-0.6138362, 0.2518898, -0.6840166, 0.427451, 1, 0, 1,
-0.6121898, 0.4156083, -0.667996, 0.4235294, 1, 0, 1,
-0.6107885, 0.1298072, -2.827589, 0.4156863, 1, 0, 1,
-0.6071784, -1.472471, -3.128829, 0.4117647, 1, 0, 1,
-0.6069167, -0.3210062, -2.477665, 0.4039216, 1, 0, 1,
-0.6065241, -0.6204863, -2.859438, 0.3960784, 1, 0, 1,
-0.6050467, -1.961135, -2.643858, 0.3921569, 1, 0, 1,
-0.5950035, -0.2689283, -1.794008, 0.3843137, 1, 0, 1,
-0.5914496, 1.708049, 0.2392214, 0.3803922, 1, 0, 1,
-0.5890764, 0.5066907, -2.582544, 0.372549, 1, 0, 1,
-0.5874757, 0.3291017, -0.8958147, 0.3686275, 1, 0, 1,
-0.5873795, -1.134403, -3.751635, 0.3607843, 1, 0, 1,
-0.5828056, -1.164754, -3.072119, 0.3568628, 1, 0, 1,
-0.5794867, 1.67477, 0.2622241, 0.3490196, 1, 0, 1,
-0.576543, 0.0921606, -2.268935, 0.345098, 1, 0, 1,
-0.570007, -0.8092628, -2.583704, 0.3372549, 1, 0, 1,
-0.5661791, 0.9035757, -0.710072, 0.3333333, 1, 0, 1,
-0.561013, -1.166294, -0.8541253, 0.3254902, 1, 0, 1,
-0.5591256, 0.3092792, -1.231984, 0.3215686, 1, 0, 1,
-0.5550137, 1.682024, 1.191366, 0.3137255, 1, 0, 1,
-0.551652, -0.7258582, -2.215692, 0.3098039, 1, 0, 1,
-0.5463998, 0.6076592, -1.010774, 0.3019608, 1, 0, 1,
-0.5429988, 0.2420002, -1.205662, 0.2941177, 1, 0, 1,
-0.5412669, 0.6170332, 0.2561933, 0.2901961, 1, 0, 1,
-0.5392072, -0.7878869, -1.872789, 0.282353, 1, 0, 1,
-0.5372818, -1.109989, -1.746128, 0.2784314, 1, 0, 1,
-0.5359337, 0.425395, -0.8462827, 0.2705882, 1, 0, 1,
-0.5249525, -0.4271823, -2.807246, 0.2666667, 1, 0, 1,
-0.5211825, -0.6119234, -1.220096, 0.2588235, 1, 0, 1,
-0.5166357, 0.1773628, -0.7718592, 0.254902, 1, 0, 1,
-0.5090226, 1.21231, -0.896601, 0.2470588, 1, 0, 1,
-0.508327, -0.6832721, -1.433991, 0.2431373, 1, 0, 1,
-0.5072687, 0.1899182, -1.843619, 0.2352941, 1, 0, 1,
-0.5064749, 0.5304094, -0.6816118, 0.2313726, 1, 0, 1,
-0.5064632, -1.075366, -2.082829, 0.2235294, 1, 0, 1,
-0.5058433, 0.7976347, 0.3490578, 0.2196078, 1, 0, 1,
-0.5039083, -0.1210556, -2.816619, 0.2117647, 1, 0, 1,
-0.4984817, -0.6609772, -3.272882, 0.2078431, 1, 0, 1,
-0.4982133, 0.1993465, -0.2522978, 0.2, 1, 0, 1,
-0.4899867, -1.05104, -1.303315, 0.1921569, 1, 0, 1,
-0.4890058, 0.04026785, -1.350249, 0.1882353, 1, 0, 1,
-0.4868825, -0.0827925, -0.9890286, 0.1803922, 1, 0, 1,
-0.4825036, 1.942251, 0.7854028, 0.1764706, 1, 0, 1,
-0.4796396, 1.017886, 0.2177851, 0.1686275, 1, 0, 1,
-0.4666792, 1.849252, -0.16942, 0.1647059, 1, 0, 1,
-0.4641477, 0.4955492, -0.4931676, 0.1568628, 1, 0, 1,
-0.4628514, 1.84823, -0.4743726, 0.1529412, 1, 0, 1,
-0.4622226, -0.8340551, -3.255097, 0.145098, 1, 0, 1,
-0.4606495, -0.2797183, -3.157095, 0.1411765, 1, 0, 1,
-0.4556632, -0.6831033, -1.656349, 0.1333333, 1, 0, 1,
-0.4536689, -0.2737239, -2.473391, 0.1294118, 1, 0, 1,
-0.4503841, -2.290906, -3.242372, 0.1215686, 1, 0, 1,
-0.4500006, -1.288319, -1.990296, 0.1176471, 1, 0, 1,
-0.4492849, 0.8513314, -0.8659685, 0.1098039, 1, 0, 1,
-0.4492682, -0.347135, -2.627695, 0.1058824, 1, 0, 1,
-0.4466651, 0.1662094, -1.471269, 0.09803922, 1, 0, 1,
-0.4447327, 2.800212, 0.3434682, 0.09019608, 1, 0, 1,
-0.4430914, 0.9885144, 0.2630893, 0.08627451, 1, 0, 1,
-0.4426368, -2.489007, -4.871341, 0.07843138, 1, 0, 1,
-0.4407764, 0.08136699, -0.221514, 0.07450981, 1, 0, 1,
-0.4396732, 0.9978384, -0.6231533, 0.06666667, 1, 0, 1,
-0.4384871, 1.387141, -0.6657094, 0.0627451, 1, 0, 1,
-0.4340286, -0.2587114, -3.813315, 0.05490196, 1, 0, 1,
-0.4308601, 1.838916, -1.478444, 0.05098039, 1, 0, 1,
-0.4283139, 1.360788, -0.01477975, 0.04313726, 1, 0, 1,
-0.4279522, -0.6205778, -3.725631, 0.03921569, 1, 0, 1,
-0.4256124, 1.035063, -0.2034882, 0.03137255, 1, 0, 1,
-0.4218447, -1.181769, -3.078828, 0.02745098, 1, 0, 1,
-0.4156533, 3.515319, 0.3411446, 0.01960784, 1, 0, 1,
-0.4115451, -1.721481, -2.894479, 0.01568628, 1, 0, 1,
-0.4052653, -1.53976, -2.32702, 0.007843138, 1, 0, 1,
-0.4022325, -1.471624, -2.670067, 0.003921569, 1, 0, 1,
-0.3989051, -0.2567281, -2.682102, 0, 1, 0.003921569, 1,
-0.3975635, 1.256844, -0.6153225, 0, 1, 0.01176471, 1,
-0.3960092, 0.2819841, -1.034163, 0, 1, 0.01568628, 1,
-0.3949264, 1.56762, -1.28389, 0, 1, 0.02352941, 1,
-0.3936309, -0.6507238, -3.34764, 0, 1, 0.02745098, 1,
-0.3919282, -1.0779, -2.288261, 0, 1, 0.03529412, 1,
-0.3890925, 0.143763, -2.283273, 0, 1, 0.03921569, 1,
-0.3882072, -0.33937, -2.568004, 0, 1, 0.04705882, 1,
-0.3806225, 2.35193, 0.9597793, 0, 1, 0.05098039, 1,
-0.3781378, -2.440694, -3.28182, 0, 1, 0.05882353, 1,
-0.3752427, 1.534747, -0.9252511, 0, 1, 0.0627451, 1,
-0.3748216, 2.084815, -1.318978, 0, 1, 0.07058824, 1,
-0.3722098, -0.4863584, -1.139392, 0, 1, 0.07450981, 1,
-0.3710866, 0.5610652, -0.7769225, 0, 1, 0.08235294, 1,
-0.3704134, 1.496658, -2.362866, 0, 1, 0.08627451, 1,
-0.3649831, -0.7722527, -2.823637, 0, 1, 0.09411765, 1,
-0.3636546, -0.5160944, -1.883502, 0, 1, 0.1019608, 1,
-0.3634517, 0.4305376, 0.9611651, 0, 1, 0.1058824, 1,
-0.3626335, -1.611173, -2.307895, 0, 1, 0.1137255, 1,
-0.3568098, -1.377522, -1.86299, 0, 1, 0.1176471, 1,
-0.3549031, 1.300269, -1.55073, 0, 1, 0.1254902, 1,
-0.3539261, -0.1322405, -1.932366, 0, 1, 0.1294118, 1,
-0.349615, -1.018909, -1.381682, 0, 1, 0.1372549, 1,
-0.3468161, 0.4633397, -0.154127, 0, 1, 0.1411765, 1,
-0.3460313, 0.3562981, 0.05935325, 0, 1, 0.1490196, 1,
-0.3426065, 1.832506, -0.5512332, 0, 1, 0.1529412, 1,
-0.3388314, 0.09147907, -1.270454, 0, 1, 0.1607843, 1,
-0.3380083, -0.07987629, -1.372675, 0, 1, 0.1647059, 1,
-0.3347494, -0.3779178, -2.938863, 0, 1, 0.172549, 1,
-0.3342324, -1.179535, -4.696123, 0, 1, 0.1764706, 1,
-0.3331504, -0.7129127, -4.570388, 0, 1, 0.1843137, 1,
-0.3312198, 0.2464466, -1.236151, 0, 1, 0.1882353, 1,
-0.329062, -0.9758202, -3.832969, 0, 1, 0.1960784, 1,
-0.3272941, 0.3977979, -1.819374, 0, 1, 0.2039216, 1,
-0.3263012, -2.074048, 0.1001644, 0, 1, 0.2078431, 1,
-0.3262591, 1.041353, -0.3064031, 0, 1, 0.2156863, 1,
-0.324754, 1.348048, -1.063148, 0, 1, 0.2196078, 1,
-0.3217335, 0.9299791, -1.74514, 0, 1, 0.227451, 1,
-0.3201364, -0.2645309, -2.676655, 0, 1, 0.2313726, 1,
-0.3192655, 1.489745, -0.6751267, 0, 1, 0.2392157, 1,
-0.3164976, 0.5843394, -1.231955, 0, 1, 0.2431373, 1,
-0.3146299, -0.2441336, -0.9001428, 0, 1, 0.2509804, 1,
-0.3124747, -1.444659, -3.536612, 0, 1, 0.254902, 1,
-0.3115787, 0.9074478, -1.511274, 0, 1, 0.2627451, 1,
-0.3035389, -2.296116, -3.004026, 0, 1, 0.2666667, 1,
-0.3032535, 0.423764, -0.4944354, 0, 1, 0.2745098, 1,
-0.2977961, -0.9198171, -4.779733, 0, 1, 0.2784314, 1,
-0.2958363, -0.3281376, -3.25788, 0, 1, 0.2862745, 1,
-0.2914753, 0.434528, -0.9332917, 0, 1, 0.2901961, 1,
-0.2908906, 0.3388858, -1.248926, 0, 1, 0.2980392, 1,
-0.2908456, -1.207866, -3.746695, 0, 1, 0.3058824, 1,
-0.2872205, 1.246645, -1.335553, 0, 1, 0.3098039, 1,
-0.2856996, 0.6959543, -1.688458, 0, 1, 0.3176471, 1,
-0.2849993, 2.008646, -2.678278, 0, 1, 0.3215686, 1,
-0.2809561, -1.160628, -3.659345, 0, 1, 0.3294118, 1,
-0.2793527, 1.073634, -0.5970083, 0, 1, 0.3333333, 1,
-0.2762398, 0.5526851, -0.5328578, 0, 1, 0.3411765, 1,
-0.2755373, 0.8724639, -1.90042, 0, 1, 0.345098, 1,
-0.2746092, 1.314145, 0.5436926, 0, 1, 0.3529412, 1,
-0.2737411, -1.304151, 0.04045235, 0, 1, 0.3568628, 1,
-0.2725092, 0.547413, -0.6464707, 0, 1, 0.3647059, 1,
-0.2720872, 0.9014589, -0.08123644, 0, 1, 0.3686275, 1,
-0.2704216, 0.04544549, -4.10051, 0, 1, 0.3764706, 1,
-0.2703135, -1.00461, -4.877094, 0, 1, 0.3803922, 1,
-0.2637839, 0.0845544, -0.6961513, 0, 1, 0.3882353, 1,
-0.2626507, -0.7465015, -3.296945, 0, 1, 0.3921569, 1,
-0.2586804, -0.5796119, -1.456687, 0, 1, 0.4, 1,
-0.2586394, 0.1892336, -0.1656362, 0, 1, 0.4078431, 1,
-0.2575118, -0.1482688, -0.4258226, 0, 1, 0.4117647, 1,
-0.2571519, 1.082805, -0.5914638, 0, 1, 0.4196078, 1,
-0.2534617, -0.8320681, -3.511519, 0, 1, 0.4235294, 1,
-0.2534002, -0.8313951, -1.94111, 0, 1, 0.4313726, 1,
-0.2495556, 0.02202453, -2.66715, 0, 1, 0.4352941, 1,
-0.2437374, -1.051329, -3.711724, 0, 1, 0.4431373, 1,
-0.2431439, -0.4665008, -2.131942, 0, 1, 0.4470588, 1,
-0.2421249, 0.3369243, 0.8672383, 0, 1, 0.454902, 1,
-0.238051, 0.1944399, -1.901159, 0, 1, 0.4588235, 1,
-0.2339855, 0.5221592, -1.338648, 0, 1, 0.4666667, 1,
-0.2329382, 2.141743, -0.7157841, 0, 1, 0.4705882, 1,
-0.2240356, 0.07712142, -0.3136936, 0, 1, 0.4784314, 1,
-0.2192391, 0.6778967, -1.070207, 0, 1, 0.4823529, 1,
-0.2150525, 1.38447, 0.3356312, 0, 1, 0.4901961, 1,
-0.2143838, 0.09839964, -1.039822, 0, 1, 0.4941176, 1,
-0.2134892, 0.857361, 0.2703528, 0, 1, 0.5019608, 1,
-0.2119318, -0.4162557, -2.55168, 0, 1, 0.509804, 1,
-0.2055012, 1.954351, -0.391438, 0, 1, 0.5137255, 1,
-0.2040078, -1.106861, -2.022673, 0, 1, 0.5215687, 1,
-0.203974, -0.445691, -2.742198, 0, 1, 0.5254902, 1,
-0.2012637, 2.294993, -1.211242, 0, 1, 0.5333334, 1,
-0.1989191, 0.07231286, -2.070641, 0, 1, 0.5372549, 1,
-0.1928109, 0.2493524, -0.141236, 0, 1, 0.5450981, 1,
-0.1889717, 0.4820462, 1.067009, 0, 1, 0.5490196, 1,
-0.1883455, -1.868754, -3.418582, 0, 1, 0.5568628, 1,
-0.1819135, -0.36465, -0.4945405, 0, 1, 0.5607843, 1,
-0.1717143, -1.501336, -2.174895, 0, 1, 0.5686275, 1,
-0.171137, 0.3557067, 0.1508517, 0, 1, 0.572549, 1,
-0.161903, 2.267382, 0.1957771, 0, 1, 0.5803922, 1,
-0.1580154, -0.5153743, -3.16816, 0, 1, 0.5843138, 1,
-0.1545651, -0.9938137, -1.883542, 0, 1, 0.5921569, 1,
-0.1530795, -1.252018, -4.133456, 0, 1, 0.5960785, 1,
-0.1501373, -0.6601509, -2.325607, 0, 1, 0.6039216, 1,
-0.1500495, -0.6511422, -3.999912, 0, 1, 0.6117647, 1,
-0.1472019, 0.656869, -0.4855718, 0, 1, 0.6156863, 1,
-0.1465897, -0.3959424, -2.219029, 0, 1, 0.6235294, 1,
-0.1443514, -1.274787, -3.665207, 0, 1, 0.627451, 1,
-0.1423248, 0.2965869, -2.297598, 0, 1, 0.6352941, 1,
-0.1396928, 1.864978, -0.301756, 0, 1, 0.6392157, 1,
-0.1384175, 0.3823942, 0.5102638, 0, 1, 0.6470588, 1,
-0.1360288, -0.9190331, -2.516868, 0, 1, 0.6509804, 1,
-0.1309333, -0.6291698, -1.747042, 0, 1, 0.6588235, 1,
-0.1260318, -1.554351, -4.508047, 0, 1, 0.6627451, 1,
-0.1215673, 0.8774186, 0.6411099, 0, 1, 0.6705883, 1,
-0.1194175, 1.619521, -0.4075151, 0, 1, 0.6745098, 1,
-0.1157833, -0.8500541, -2.730141, 0, 1, 0.682353, 1,
-0.1141276, -0.9182334, -3.048112, 0, 1, 0.6862745, 1,
-0.1120433, 0.7558901, 0.08328842, 0, 1, 0.6941177, 1,
-0.1109754, -0.3104303, -3.392444, 0, 1, 0.7019608, 1,
-0.110794, 0.2413805, -1.367962, 0, 1, 0.7058824, 1,
-0.1102183, -0.9759272, -2.233422, 0, 1, 0.7137255, 1,
-0.1058294, -2.783365, -3.403637, 0, 1, 0.7176471, 1,
-0.10555, -0.2902088, -3.180018, 0, 1, 0.7254902, 1,
-0.1010774, -1.854468, -3.678775, 0, 1, 0.7294118, 1,
-0.09866405, 0.1897427, -0.620768, 0, 1, 0.7372549, 1,
-0.0957087, 0.02285195, 0.5621616, 0, 1, 0.7411765, 1,
-0.09098352, 0.4678398, -1.272301, 0, 1, 0.7490196, 1,
-0.08617587, 0.7928529, 0.9099972, 0, 1, 0.7529412, 1,
-0.08183894, -1.091835, -2.75757, 0, 1, 0.7607843, 1,
-0.08080799, 0.804544, 1.363624, 0, 1, 0.7647059, 1,
-0.07853739, 1.018993, 1.311025, 0, 1, 0.772549, 1,
-0.07637897, -1.440232, -3.827806, 0, 1, 0.7764706, 1,
-0.07533518, -0.7725074, -2.917275, 0, 1, 0.7843137, 1,
-0.06573378, 0.5728818, 1.415264, 0, 1, 0.7882353, 1,
-0.06553999, 1.012196, 0.6284298, 0, 1, 0.7960784, 1,
-0.06487173, -0.6810057, -0.5632034, 0, 1, 0.8039216, 1,
-0.06469131, -0.5102903, -3.360828, 0, 1, 0.8078431, 1,
-0.0626409, -2.964708, -2.951319, 0, 1, 0.8156863, 1,
-0.05915506, -1.880626, -3.650976, 0, 1, 0.8196079, 1,
-0.05846226, 1.134416, 1.208676, 0, 1, 0.827451, 1,
-0.05653302, -0.8972395, -2.328258, 0, 1, 0.8313726, 1,
-0.05557191, 1.001994, 1.094888, 0, 1, 0.8392157, 1,
-0.05482442, -2.508317, -1.817236, 0, 1, 0.8431373, 1,
-0.05309473, -1.670955, -2.15983, 0, 1, 0.8509804, 1,
-0.05259933, -0.8287352, -1.527192, 0, 1, 0.854902, 1,
-0.05205805, 0.01964542, -1.7108, 0, 1, 0.8627451, 1,
-0.04822948, 1.440737, -0.2491251, 0, 1, 0.8666667, 1,
-0.04793072, 0.1824898, -0.5486168, 0, 1, 0.8745098, 1,
-0.04267769, -0.6858004, -1.97539, 0, 1, 0.8784314, 1,
-0.04249745, 1.119314, 0.7616394, 0, 1, 0.8862745, 1,
-0.04194999, 0.2229367, 0.3609576, 0, 1, 0.8901961, 1,
-0.02674766, 0.6167139, 0.02998673, 0, 1, 0.8980392, 1,
-0.02266881, -0.5983311, -2.43049, 0, 1, 0.9058824, 1,
-0.02244055, 0.5603301, -1.006261, 0, 1, 0.9098039, 1,
-0.0161349, -0.3410718, -4.213724, 0, 1, 0.9176471, 1,
-0.009533232, 0.6265375, 0.3940655, 0, 1, 0.9215686, 1,
-0.008066653, -1.40067, -3.495263, 0, 1, 0.9294118, 1,
-0.004936638, -1.41332, -2.707215, 0, 1, 0.9333333, 1,
-0.002939808, 1.04386, 0.3999805, 0, 1, 0.9411765, 1,
-0.002841068, 0.4222691, 0.6186628, 0, 1, 0.945098, 1,
-0.001741128, -1.081975, -3.920563, 0, 1, 0.9529412, 1,
-0.0007543673, -0.8401396, -1.404546, 0, 1, 0.9568627, 1,
9.750485e-06, -1.361785, 4.706729, 0, 1, 0.9647059, 1,
0.01053841, 0.06511868, 0.3142125, 0, 1, 0.9686275, 1,
0.0110798, 0.65662, 0.9249488, 0, 1, 0.9764706, 1,
0.01196969, -0.01656449, 1.483138, 0, 1, 0.9803922, 1,
0.01255027, 1.669412, -0.7177233, 0, 1, 0.9882353, 1,
0.01362761, -0.8852931, 3.789658, 0, 1, 0.9921569, 1,
0.01366049, -0.2810595, 4.215807, 0, 1, 1, 1,
0.0142224, 1.18392, 1.958253, 0, 0.9921569, 1, 1,
0.01537591, -0.7420636, 3.567812, 0, 0.9882353, 1, 1,
0.01940573, 0.1553076, -0.8014126, 0, 0.9803922, 1, 1,
0.02185318, -1.176343, 1.396867, 0, 0.9764706, 1, 1,
0.02238553, -0.6050223, 2.872953, 0, 0.9686275, 1, 1,
0.03162945, 2.243329, 0.02907772, 0, 0.9647059, 1, 1,
0.03377583, 0.6187418, 1.760449, 0, 0.9568627, 1, 1,
0.03526225, 0.04284106, -0.9830253, 0, 0.9529412, 1, 1,
0.0360831, 0.3374868, -2.367619, 0, 0.945098, 1, 1,
0.03755142, -0.6836201, 3.377167, 0, 0.9411765, 1, 1,
0.04256696, 0.2981393, -0.494682, 0, 0.9333333, 1, 1,
0.04679678, -0.8148084, 2.525539, 0, 0.9294118, 1, 1,
0.0501846, 1.278009, -1.202239, 0, 0.9215686, 1, 1,
0.05636029, 0.1657045, -0.1924485, 0, 0.9176471, 1, 1,
0.05804719, 1.308178, 2.008648, 0, 0.9098039, 1, 1,
0.05920355, 0.4020987, -0.6717739, 0, 0.9058824, 1, 1,
0.06016617, 3.151797, -0.2266305, 0, 0.8980392, 1, 1,
0.06088302, 2.184471, -1.455208, 0, 0.8901961, 1, 1,
0.06278136, 0.5914719, 0.4532979, 0, 0.8862745, 1, 1,
0.06294519, -0.2116271, 3.506851, 0, 0.8784314, 1, 1,
0.06557949, 0.2355547, 0.28246, 0, 0.8745098, 1, 1,
0.06683597, 0.834762, 0.7703452, 0, 0.8666667, 1, 1,
0.06825041, 0.1437218, 0.3199026, 0, 0.8627451, 1, 1,
0.06827949, -0.8273712, 3.320408, 0, 0.854902, 1, 1,
0.06853223, -0.7372115, 3.749221, 0, 0.8509804, 1, 1,
0.07112472, 0.3909332, -1.557204, 0, 0.8431373, 1, 1,
0.07327334, -0.886097, 1.610261, 0, 0.8392157, 1, 1,
0.0747809, 1.487793, 0.7651609, 0, 0.8313726, 1, 1,
0.07652544, -0.4326973, 4.966229, 0, 0.827451, 1, 1,
0.08066491, -1.104611, 4.294744, 0, 0.8196079, 1, 1,
0.08115912, -1.041454, 3.302497, 0, 0.8156863, 1, 1,
0.08446072, 0.9191647, -0.3681778, 0, 0.8078431, 1, 1,
0.08727822, -0.688394, 4.280717, 0, 0.8039216, 1, 1,
0.09116964, 0.06565226, 1.675432, 0, 0.7960784, 1, 1,
0.09356311, 1.464054, 0.01048021, 0, 0.7882353, 1, 1,
0.09511259, 0.4245432, -0.1694406, 0, 0.7843137, 1, 1,
0.09887444, 1.240828, -1.848022, 0, 0.7764706, 1, 1,
0.09985672, 0.6668284, 0.2655213, 0, 0.772549, 1, 1,
0.1013623, 2.184886, 0.9603984, 0, 0.7647059, 1, 1,
0.1065261, -1.672359, 3.409921, 0, 0.7607843, 1, 1,
0.1068409, -0.4910308, 3.331242, 0, 0.7529412, 1, 1,
0.1091681, -0.6425613, 2.426347, 0, 0.7490196, 1, 1,
0.109858, 0.4340973, 1.172313, 0, 0.7411765, 1, 1,
0.1122334, 0.60932, -0.4204577, 0, 0.7372549, 1, 1,
0.1173674, 0.4103189, 1.162926, 0, 0.7294118, 1, 1,
0.1174618, -0.3165984, 3.723738, 0, 0.7254902, 1, 1,
0.1209639, 1.456494, -0.3280935, 0, 0.7176471, 1, 1,
0.1214237, -0.6184973, 2.652602, 0, 0.7137255, 1, 1,
0.124126, 1.537712, -0.02909898, 0, 0.7058824, 1, 1,
0.1252736, 1.373775, 0.8979949, 0, 0.6980392, 1, 1,
0.1256077, -0.2105175, 5.962517, 0, 0.6941177, 1, 1,
0.1264243, -0.7276763, 1.799638, 0, 0.6862745, 1, 1,
0.127412, 0.6652693, -0.7352637, 0, 0.682353, 1, 1,
0.1274987, -0.2711249, 2.917454, 0, 0.6745098, 1, 1,
0.1318268, -1.893141, 1.754659, 0, 0.6705883, 1, 1,
0.1336339, -0.5845824, 2.093407, 0, 0.6627451, 1, 1,
0.1378173, 0.5726846, 1.203696, 0, 0.6588235, 1, 1,
0.1392521, 0.4806182, 0.4330444, 0, 0.6509804, 1, 1,
0.1404108, 0.2474575, 3.02822, 0, 0.6470588, 1, 1,
0.1425304, -1.26567, 2.582823, 0, 0.6392157, 1, 1,
0.1459901, 1.85477, 1.44785, 0, 0.6352941, 1, 1,
0.1482686, -0.7375484, 3.071889, 0, 0.627451, 1, 1,
0.1544913, -0.5347775, 2.164556, 0, 0.6235294, 1, 1,
0.1633299, -0.519586, 1.449526, 0, 0.6156863, 1, 1,
0.1640357, -0.5215042, 2.781667, 0, 0.6117647, 1, 1,
0.1688952, 0.942495, -0.2381984, 0, 0.6039216, 1, 1,
0.172605, -1.562502, 1.99433, 0, 0.5960785, 1, 1,
0.1726448, -0.6432042, 1.40137, 0, 0.5921569, 1, 1,
0.1735434, -0.2560291, 3.499816, 0, 0.5843138, 1, 1,
0.1788577, 1.309817, 1.400196, 0, 0.5803922, 1, 1,
0.1807488, -2.256885, 4.680156, 0, 0.572549, 1, 1,
0.1819367, 1.742485, 0.2953465, 0, 0.5686275, 1, 1,
0.1821251, 0.1171694, -0.273179, 0, 0.5607843, 1, 1,
0.1837867, 0.5200668, -1.487778, 0, 0.5568628, 1, 1,
0.1867766, 0.4231326, -1.563619, 0, 0.5490196, 1, 1,
0.1885131, -0.01126226, 1.281262, 0, 0.5450981, 1, 1,
0.1895318, 0.5157229, 0.5795122, 0, 0.5372549, 1, 1,
0.1917751, -1.563885, 2.730262, 0, 0.5333334, 1, 1,
0.1918356, -0.7169785, 3.65547, 0, 0.5254902, 1, 1,
0.1927367, -1.017309, 4.048778, 0, 0.5215687, 1, 1,
0.1949991, -0.6535697, 3.698843, 0, 0.5137255, 1, 1,
0.1975139, 0.3576499, 1.089228, 0, 0.509804, 1, 1,
0.1977241, 0.007252349, 1.243992, 0, 0.5019608, 1, 1,
0.1983949, -0.03542135, 1.82126, 0, 0.4941176, 1, 1,
0.2004404, 1.353912, 1.192272, 0, 0.4901961, 1, 1,
0.2017043, -1.67792, 3.024963, 0, 0.4823529, 1, 1,
0.2017977, 0.0006539091, 1.462794, 0, 0.4784314, 1, 1,
0.2058913, -1.005354, 2.279196, 0, 0.4705882, 1, 1,
0.207699, -0.1277561, 2.71876, 0, 0.4666667, 1, 1,
0.2079496, -0.2324818, 1.304491, 0, 0.4588235, 1, 1,
0.212909, -1.198415, 4.357151, 0, 0.454902, 1, 1,
0.2134296, -1.122964, 3.727119, 0, 0.4470588, 1, 1,
0.2175606, -1.655694, 2.607764, 0, 0.4431373, 1, 1,
0.2254549, -1.543082, 3.174531, 0, 0.4352941, 1, 1,
0.2262452, -1.55012, 5.125047, 0, 0.4313726, 1, 1,
0.2277293, 0.3960363, 1.298558, 0, 0.4235294, 1, 1,
0.2302149, -1.653777, 2.354498, 0, 0.4196078, 1, 1,
0.2367688, -1.997648, 3.742463, 0, 0.4117647, 1, 1,
0.2372613, 0.5276057, -0.1889021, 0, 0.4078431, 1, 1,
0.2383599, -0.1956557, 2.127078, 0, 0.4, 1, 1,
0.2384556, -1.39, 2.176709, 0, 0.3921569, 1, 1,
0.2477256, -0.4656887, 3.339674, 0, 0.3882353, 1, 1,
0.2484096, 1.2183, 0.8468601, 0, 0.3803922, 1, 1,
0.2486748, -0.724349, 1.878269, 0, 0.3764706, 1, 1,
0.2520172, -0.4829224, 2.71764, 0, 0.3686275, 1, 1,
0.2535231, 0.7739729, 1.250663, 0, 0.3647059, 1, 1,
0.2542906, -0.3268869, 2.105082, 0, 0.3568628, 1, 1,
0.2641959, -0.8127804, 2.88902, 0, 0.3529412, 1, 1,
0.2676052, 0.7142122, 1.269547, 0, 0.345098, 1, 1,
0.2684379, -0.9187639, 2.20801, 0, 0.3411765, 1, 1,
0.2714595, 1.686543, -0.6812756, 0, 0.3333333, 1, 1,
0.2762946, 0.1244375, -0.09600783, 0, 0.3294118, 1, 1,
0.2821065, 1.861674, 0.8735179, 0, 0.3215686, 1, 1,
0.2845338, -0.1809589, 2.459495, 0, 0.3176471, 1, 1,
0.284717, 1.629202, -0.89409, 0, 0.3098039, 1, 1,
0.2887833, 0.2922145, 1.682712, 0, 0.3058824, 1, 1,
0.2897975, 0.7250463, 0.8604357, 0, 0.2980392, 1, 1,
0.2898208, -0.5409559, 3.121682, 0, 0.2901961, 1, 1,
0.2903222, 1.159351, 0.3390906, 0, 0.2862745, 1, 1,
0.2922271, 0.22055, -0.5163998, 0, 0.2784314, 1, 1,
0.3016174, 0.07278183, 0.6948366, 0, 0.2745098, 1, 1,
0.3023223, -2.136758, 2.913833, 0, 0.2666667, 1, 1,
0.3047684, 0.223727, 0.7275108, 0, 0.2627451, 1, 1,
0.3057962, 1.718479, 2.199096, 0, 0.254902, 1, 1,
0.3065168, -0.7653587, 1.517381, 0, 0.2509804, 1, 1,
0.3077145, 0.001741921, 1.567129, 0, 0.2431373, 1, 1,
0.3079072, 0.6952878, -0.1377989, 0, 0.2392157, 1, 1,
0.3165683, -2.174252, 1.448967, 0, 0.2313726, 1, 1,
0.3187794, 0.726193, 0.2277416, 0, 0.227451, 1, 1,
0.3251282, 1.001132, 0.2091344, 0, 0.2196078, 1, 1,
0.3256521, -1.391571, 2.182687, 0, 0.2156863, 1, 1,
0.3257032, 1.835672, -0.5893204, 0, 0.2078431, 1, 1,
0.3285527, 1.775881, 0.03143517, 0, 0.2039216, 1, 1,
0.3292676, -0.5236035, 1.863952, 0, 0.1960784, 1, 1,
0.332936, -0.7867296, 3.327502, 0, 0.1882353, 1, 1,
0.3380871, -1.096702, 3.140849, 0, 0.1843137, 1, 1,
0.3430639, -1.34677, 1.437608, 0, 0.1764706, 1, 1,
0.3440344, 0.6589236, 1.459203, 0, 0.172549, 1, 1,
0.3464874, 0.02634848, 0.4934395, 0, 0.1647059, 1, 1,
0.3477476, 0.06991168, 2.167184, 0, 0.1607843, 1, 1,
0.3505334, -1.405957, 1.875507, 0, 0.1529412, 1, 1,
0.352992, 0.8253064, -1.943344, 0, 0.1490196, 1, 1,
0.354685, -0.241809, 1.231478, 0, 0.1411765, 1, 1,
0.3554119, 0.2640542, 1.36004, 0, 0.1372549, 1, 1,
0.3561127, -0.810069, 2.773252, 0, 0.1294118, 1, 1,
0.3577863, 0.8188221, 0.0828015, 0, 0.1254902, 1, 1,
0.3594687, 0.7993174, -0.05767944, 0, 0.1176471, 1, 1,
0.3609593, 0.5799243, 1.900478, 0, 0.1137255, 1, 1,
0.3623852, -1.012011, 3.541932, 0, 0.1058824, 1, 1,
0.3662068, 0.7554508, 0.4495575, 0, 0.09803922, 1, 1,
0.3689512, 1.58474, 0.3128371, 0, 0.09411765, 1, 1,
0.3707797, 1.113281, 0.238893, 0, 0.08627451, 1, 1,
0.3714236, -1.651328, 2.715831, 0, 0.08235294, 1, 1,
0.3861209, -2.425864, 2.984213, 0, 0.07450981, 1, 1,
0.3867768, 0.08638625, 0.08592138, 0, 0.07058824, 1, 1,
0.3874454, -0.3195637, 3.168248, 0, 0.0627451, 1, 1,
0.3917699, 0.4396284, 1.343167, 0, 0.05882353, 1, 1,
0.3942883, 0.4887325, -0.5056133, 0, 0.05098039, 1, 1,
0.4002633, 0.4540677, 0.5489118, 0, 0.04705882, 1, 1,
0.4004984, -1.037977, 3.873099, 0, 0.03921569, 1, 1,
0.4048828, 1.480769, 0.1600228, 0, 0.03529412, 1, 1,
0.4053508, 0.2701336, 0.1976522, 0, 0.02745098, 1, 1,
0.4070341, -0.9235314, 2.492726, 0, 0.02352941, 1, 1,
0.4114395, -0.2987309, 3.396245, 0, 0.01568628, 1, 1,
0.4120404, -0.467219, 3.359032, 0, 0.01176471, 1, 1,
0.4177282, 0.9656978, -0.7425191, 0, 0.003921569, 1, 1,
0.4204938, 0.3738285, 0.7481862, 0.003921569, 0, 1, 1,
0.4243668, -1.800359, 3.112255, 0.007843138, 0, 1, 1,
0.4259275, 0.8666476, 1.54208, 0.01568628, 0, 1, 1,
0.4295855, -0.6486087, 2.163754, 0.01960784, 0, 1, 1,
0.4311974, 0.5029254, 0.347586, 0.02745098, 0, 1, 1,
0.4368482, -3.508599, 3.637865, 0.03137255, 0, 1, 1,
0.4382339, 1.062016, 0.9418364, 0.03921569, 0, 1, 1,
0.4571101, -0.3624444, 2.970026, 0.04313726, 0, 1, 1,
0.4584668, 0.1135901, 0.6675098, 0.05098039, 0, 1, 1,
0.4620286, 1.289545, -0.001549863, 0.05490196, 0, 1, 1,
0.4628489, -0.0174858, 3.993824, 0.0627451, 0, 1, 1,
0.4650805, -2.263523, 2.912266, 0.06666667, 0, 1, 1,
0.4659545, 0.3178967, 1.223082, 0.07450981, 0, 1, 1,
0.4682029, -0.9803119, 3.321025, 0.07843138, 0, 1, 1,
0.4705147, -1.719123, 3.171829, 0.08627451, 0, 1, 1,
0.4720508, 1.456139, 0.7135143, 0.09019608, 0, 1, 1,
0.4729953, -0.6413464, 2.568163, 0.09803922, 0, 1, 1,
0.4766117, -0.03970189, 2.836336, 0.1058824, 0, 1, 1,
0.4776744, 1.663468, -0.4974072, 0.1098039, 0, 1, 1,
0.4815258, 0.6699387, 0.8079914, 0.1176471, 0, 1, 1,
0.4820449, 1.18775, 0.7341872, 0.1215686, 0, 1, 1,
0.4879705, -0.8163303, 3.223145, 0.1294118, 0, 1, 1,
0.4888397, -0.4035459, 4.40165, 0.1333333, 0, 1, 1,
0.4913137, 0.06220723, 1.488375, 0.1411765, 0, 1, 1,
0.5023153, -0.9872802, 3.345745, 0.145098, 0, 1, 1,
0.5063621, -0.7817809, 2.525697, 0.1529412, 0, 1, 1,
0.5117105, -0.8503908, 3.284205, 0.1568628, 0, 1, 1,
0.5129812, -0.1443453, 2.708129, 0.1647059, 0, 1, 1,
0.5134332, 0.1435666, 1.055562, 0.1686275, 0, 1, 1,
0.5188469, 0.6346267, 0.968955, 0.1764706, 0, 1, 1,
0.5218195, -0.8044001, 2.769762, 0.1803922, 0, 1, 1,
0.5266347, 0.9130846, 1.767351, 0.1882353, 0, 1, 1,
0.529379, -1.413452, 2.865366, 0.1921569, 0, 1, 1,
0.5314726, -0.1416314, 0.4688313, 0.2, 0, 1, 1,
0.5337165, -0.2916041, 1.093629, 0.2078431, 0, 1, 1,
0.5361555, 2.600876, 0.1726313, 0.2117647, 0, 1, 1,
0.5375319, 0.2774043, 2.578417, 0.2196078, 0, 1, 1,
0.5391703, -0.8491125, 1.475367, 0.2235294, 0, 1, 1,
0.5429074, 0.187582, 2.37357, 0.2313726, 0, 1, 1,
0.5447965, -0.922933, 3.536435, 0.2352941, 0, 1, 1,
0.5512595, -1.092137, 1.654205, 0.2431373, 0, 1, 1,
0.5552525, 0.7969438, 3.10566, 0.2470588, 0, 1, 1,
0.5571271, -0.09676571, 2.107316, 0.254902, 0, 1, 1,
0.5655248, -0.9575309, 3.349522, 0.2588235, 0, 1, 1,
0.5669881, 1.146375, -0.4009185, 0.2666667, 0, 1, 1,
0.5678447, -0.713881, 2.757294, 0.2705882, 0, 1, 1,
0.5706893, -0.4084254, 1.925781, 0.2784314, 0, 1, 1,
0.5712032, -0.347902, 1.870589, 0.282353, 0, 1, 1,
0.5733922, 0.8333231, 2.299168, 0.2901961, 0, 1, 1,
0.5752304, 1.012444, -0.3709173, 0.2941177, 0, 1, 1,
0.5792661, -0.2634346, 1.458334, 0.3019608, 0, 1, 1,
0.5813094, -0.1334236, -0.7278615, 0.3098039, 0, 1, 1,
0.5966044, -0.8749101, 3.395121, 0.3137255, 0, 1, 1,
0.5996283, 0.2262201, -0.4263662, 0.3215686, 0, 1, 1,
0.6001511, 2.034999, -0.2621605, 0.3254902, 0, 1, 1,
0.6043089, 0.2243064, 1.288976, 0.3333333, 0, 1, 1,
0.6047648, 0.6825678, 0.5255593, 0.3372549, 0, 1, 1,
0.6072438, 1.197348, 0.539816, 0.345098, 0, 1, 1,
0.6078174, -0.8298631, 3.425178, 0.3490196, 0, 1, 1,
0.6131386, 0.00711129, 0.09031129, 0.3568628, 0, 1, 1,
0.6145591, -0.1076624, 2.450207, 0.3607843, 0, 1, 1,
0.6155411, 1.026567, 1.964114, 0.3686275, 0, 1, 1,
0.6155595, 1.073428, 0.3657846, 0.372549, 0, 1, 1,
0.62902, -1.051676, 2.641629, 0.3803922, 0, 1, 1,
0.6305167, -0.03574381, 1.108728, 0.3843137, 0, 1, 1,
0.631529, -0.8041616, 2.605796, 0.3921569, 0, 1, 1,
0.6365264, -0.3521022, 1.545437, 0.3960784, 0, 1, 1,
0.6367929, 0.6087409, 0.9186386, 0.4039216, 0, 1, 1,
0.637212, -0.0767379, 1.027504, 0.4117647, 0, 1, 1,
0.6440045, 0.4870566, 0.5050553, 0.4156863, 0, 1, 1,
0.6449317, 0.01887774, 1.356086, 0.4235294, 0, 1, 1,
0.6503374, 0.8027049, 0.4241785, 0.427451, 0, 1, 1,
0.6532642, -0.479481, 1.950209, 0.4352941, 0, 1, 1,
0.6574471, -1.059657, 2.44657, 0.4392157, 0, 1, 1,
0.6645896, -0.1969217, 2.326119, 0.4470588, 0, 1, 1,
0.66734, 1.825358, 0.5204973, 0.4509804, 0, 1, 1,
0.6719179, 0.2461444, 3.09798, 0.4588235, 0, 1, 1,
0.674207, 0.8620329, 1.301654, 0.4627451, 0, 1, 1,
0.674216, 1.402768, 0.3648157, 0.4705882, 0, 1, 1,
0.6773137, -2.071352, 4.87669, 0.4745098, 0, 1, 1,
0.6803695, -0.4724376, 1.709447, 0.4823529, 0, 1, 1,
0.6819374, -0.599787, 1.124435, 0.4862745, 0, 1, 1,
0.6826677, -0.4290007, 4.253887, 0.4941176, 0, 1, 1,
0.6860277, -0.601955, 3.341521, 0.5019608, 0, 1, 1,
0.6963215, -0.9395321, 2.392989, 0.5058824, 0, 1, 1,
0.7013589, 0.3851241, 0.3251981, 0.5137255, 0, 1, 1,
0.7054678, -0.2136534, 1.914198, 0.5176471, 0, 1, 1,
0.7062825, 0.3089323, 2.821215, 0.5254902, 0, 1, 1,
0.7067521, 1.14497, 0.8266094, 0.5294118, 0, 1, 1,
0.7071634, -0.05455324, 1.498656, 0.5372549, 0, 1, 1,
0.7075019, -1.276899, 3.865201, 0.5411765, 0, 1, 1,
0.7099722, -0.6323922, 2.281985, 0.5490196, 0, 1, 1,
0.7123767, 0.9399978, 2.141587, 0.5529412, 0, 1, 1,
0.7131403, -0.04460352, 2.472896, 0.5607843, 0, 1, 1,
0.7179343, 0.1566707, 1.914293, 0.5647059, 0, 1, 1,
0.7179443, 0.3382007, -1.015599, 0.572549, 0, 1, 1,
0.7179472, -2.014308, 1.107182, 0.5764706, 0, 1, 1,
0.7181649, 0.831297, 1.229975, 0.5843138, 0, 1, 1,
0.7182497, 0.2362173, -0.05169395, 0.5882353, 0, 1, 1,
0.7216073, -0.8183534, 2.528104, 0.5960785, 0, 1, 1,
0.7229394, 2.532855, -0.6266109, 0.6039216, 0, 1, 1,
0.7240466, 0.02273971, 1.350997, 0.6078432, 0, 1, 1,
0.7255275, 0.1852945, 0.5629801, 0.6156863, 0, 1, 1,
0.7292672, -1.340127, 2.377031, 0.6196079, 0, 1, 1,
0.7306748, -1.893673, 2.564015, 0.627451, 0, 1, 1,
0.7417458, -0.6581155, 3.528642, 0.6313726, 0, 1, 1,
0.7442087, -1.081554, 3.518366, 0.6392157, 0, 1, 1,
0.7518263, 0.4332819, -1.029735, 0.6431373, 0, 1, 1,
0.760711, 0.5397127, 0.9092844, 0.6509804, 0, 1, 1,
0.7744325, 0.8812056, -0.04569045, 0.654902, 0, 1, 1,
0.7754937, -0.8419607, 2.030609, 0.6627451, 0, 1, 1,
0.776491, 0.995019, 0.221038, 0.6666667, 0, 1, 1,
0.7818543, 0.6222715, -0.3586731, 0.6745098, 0, 1, 1,
0.7824457, -0.6355445, 4.407517, 0.6784314, 0, 1, 1,
0.7828889, -0.4825793, 2.274595, 0.6862745, 0, 1, 1,
0.7842397, -0.2529507, 1.238479, 0.6901961, 0, 1, 1,
0.7846704, 0.08185712, 1.492006, 0.6980392, 0, 1, 1,
0.7880452, -1.012156, 2.896681, 0.7058824, 0, 1, 1,
0.79002, -2.024054, 1.632686, 0.7098039, 0, 1, 1,
0.791482, 1.225998, 0.657322, 0.7176471, 0, 1, 1,
0.7935421, 1.348929, 0.9991357, 0.7215686, 0, 1, 1,
0.7951046, 0.4996088, 1.598446, 0.7294118, 0, 1, 1,
0.8049495, -0.9755237, 2.867776, 0.7333333, 0, 1, 1,
0.8076118, -0.01287532, 0.9404165, 0.7411765, 0, 1, 1,
0.8104264, 1.116066, 1.588629, 0.7450981, 0, 1, 1,
0.8212376, 0.6893758, 0.7839121, 0.7529412, 0, 1, 1,
0.821888, -0.1441031, 2.970786, 0.7568628, 0, 1, 1,
0.8238115, -1.528288, 1.555026, 0.7647059, 0, 1, 1,
0.8292752, -1.428741, 2.606503, 0.7686275, 0, 1, 1,
0.8349804, -1.126371, 1.532485, 0.7764706, 0, 1, 1,
0.8370916, 0.5416079, -0.1433873, 0.7803922, 0, 1, 1,
0.8406996, -0.02015773, 5.053388, 0.7882353, 0, 1, 1,
0.8470542, 0.5925476, 1.346595, 0.7921569, 0, 1, 1,
0.8500555, -0.7829003, 2.071529, 0.8, 0, 1, 1,
0.8576745, -0.04929364, 0.1309002, 0.8078431, 0, 1, 1,
0.8635458, 1.15581, 0.7735018, 0.8117647, 0, 1, 1,
0.8653952, -1.073399, 4.305559, 0.8196079, 0, 1, 1,
0.8664201, 0.02578265, 0.6808395, 0.8235294, 0, 1, 1,
0.8666048, -0.4636694, 0.2781488, 0.8313726, 0, 1, 1,
0.8691232, 0.004890352, -0.1524583, 0.8352941, 0, 1, 1,
0.8705217, 1.12766, 0.7553328, 0.8431373, 0, 1, 1,
0.8744023, 0.5077119, 0.2844729, 0.8470588, 0, 1, 1,
0.8774939, -0.4062396, 1.267222, 0.854902, 0, 1, 1,
0.8781977, 0.2886005, 1.922795, 0.8588235, 0, 1, 1,
0.8794943, -0.8688532, 2.061439, 0.8666667, 0, 1, 1,
0.8812544, 0.2367545, 2.041147, 0.8705882, 0, 1, 1,
0.884046, -1.340795, 1.969825, 0.8784314, 0, 1, 1,
0.8910668, -0.8606056, 2.700958, 0.8823529, 0, 1, 1,
0.897838, -0.9477648, 1.094433, 0.8901961, 0, 1, 1,
0.9016804, 0.201784, 2.701882, 0.8941177, 0, 1, 1,
0.9048249, -1.66267, 1.539508, 0.9019608, 0, 1, 1,
0.9061216, 0.08831293, 1.990036, 0.9098039, 0, 1, 1,
0.9076265, -1.097361, 1.567501, 0.9137255, 0, 1, 1,
0.9100533, -0.1790643, 0.949423, 0.9215686, 0, 1, 1,
0.9153596, -0.2271774, 2.016242, 0.9254902, 0, 1, 1,
0.9182363, -0.4339782, 2.281323, 0.9333333, 0, 1, 1,
0.921571, 0.8071198, -0.01140989, 0.9372549, 0, 1, 1,
0.9281814, 1.604481, 0.8552446, 0.945098, 0, 1, 1,
0.9288172, -0.6245447, 2.631955, 0.9490196, 0, 1, 1,
0.9324394, 0.129774, 1.879753, 0.9568627, 0, 1, 1,
0.9328755, 0.008479969, 2.798882, 0.9607843, 0, 1, 1,
0.9338056, 0.8265575, -0.03644803, 0.9686275, 0, 1, 1,
0.934251, 0.164473, 1.531075, 0.972549, 0, 1, 1,
0.9428202, -2.026952, 3.370208, 0.9803922, 0, 1, 1,
0.9447892, -0.4804677, 0.8302216, 0.9843137, 0, 1, 1,
0.9463425, 1.971561, -0.02881218, 0.9921569, 0, 1, 1,
0.9477118, 0.9549324, 1.001616, 0.9960784, 0, 1, 1,
0.9505697, 0.6383111, -0.005041612, 1, 0, 0.9960784, 1,
0.9527007, 0.2038492, 0.1049983, 1, 0, 0.9882353, 1,
0.9609998, -0.2882493, 2.373328, 1, 0, 0.9843137, 1,
0.9641563, -0.2346964, 2.335461, 1, 0, 0.9764706, 1,
0.9733539, 0.3197557, 2.124572, 1, 0, 0.972549, 1,
0.973841, 0.5109913, 1.674917, 1, 0, 0.9647059, 1,
0.9824845, -0.4010877, 3.809913, 1, 0, 0.9607843, 1,
0.9937805, -1.207476, 0.7499189, 1, 0, 0.9529412, 1,
0.9967799, 0.9660676, -0.1080186, 1, 0, 0.9490196, 1,
0.9998383, -0.02011988, 1.321522, 1, 0, 0.9411765, 1,
1.006061, 0.1988977, 1.036677, 1, 0, 0.9372549, 1,
1.015905, -1.460079, 1.915216, 1, 0, 0.9294118, 1,
1.023475, 0.6948937, 1.479426, 1, 0, 0.9254902, 1,
1.025409, -0.3162807, 1.410848, 1, 0, 0.9176471, 1,
1.03129, 0.02280804, 1.612343, 1, 0, 0.9137255, 1,
1.037047, 1.160952, -0.8756835, 1, 0, 0.9058824, 1,
1.037388, 0.6283389, -0.9368655, 1, 0, 0.9019608, 1,
1.03873, -0.3984611, 1.563367, 1, 0, 0.8941177, 1,
1.041043, -0.4369058, 1.824731, 1, 0, 0.8862745, 1,
1.04142, -2.236851, 2.953928, 1, 0, 0.8823529, 1,
1.047176, -1.000807, 1.022162, 1, 0, 0.8745098, 1,
1.056627, 0.01916124, 3.244605, 1, 0, 0.8705882, 1,
1.064876, -1.437791, 2.020426, 1, 0, 0.8627451, 1,
1.072535, 0.3248565, 4.146127, 1, 0, 0.8588235, 1,
1.081144, 0.6267573, 0.8116661, 1, 0, 0.8509804, 1,
1.08252, 0.365053, 0.6907752, 1, 0, 0.8470588, 1,
1.083611, 0.8944139, 1.342191, 1, 0, 0.8392157, 1,
1.089855, -0.06998987, 1.232398, 1, 0, 0.8352941, 1,
1.09038, -0.9684386, 1.608462, 1, 0, 0.827451, 1,
1.092324, 0.214516, 0.7388277, 1, 0, 0.8235294, 1,
1.104569, 0.2355472, -0.4822788, 1, 0, 0.8156863, 1,
1.107029, -0.1808798, -0.04691524, 1, 0, 0.8117647, 1,
1.109973, -0.1402383, 1.561753, 1, 0, 0.8039216, 1,
1.112426, -0.3374528, 1.558535, 1, 0, 0.7960784, 1,
1.113766, 0.9825673, 0.3037171, 1, 0, 0.7921569, 1,
1.117878, 0.5214051, 3.055379, 1, 0, 0.7843137, 1,
1.124577, -1.296176, 3.171498, 1, 0, 0.7803922, 1,
1.129501, -0.9436423, -0.4186171, 1, 0, 0.772549, 1,
1.130906, -0.1803191, 1.877473, 1, 0, 0.7686275, 1,
1.141196, -2.074485, 5.079875, 1, 0, 0.7607843, 1,
1.147716, 0.3877909, 1.210741, 1, 0, 0.7568628, 1,
1.147927, -0.800209, 2.047324, 1, 0, 0.7490196, 1,
1.168853, -0.7118102, 3.725733, 1, 0, 0.7450981, 1,
1.180135, 0.6395229, -0.2754218, 1, 0, 0.7372549, 1,
1.181726, -0.9457508, 2.773197, 1, 0, 0.7333333, 1,
1.200665, -1.708491, 4.497006, 1, 0, 0.7254902, 1,
1.204199, 0.5647856, 1.441998, 1, 0, 0.7215686, 1,
1.205445, -1.201634, 2.664288, 1, 0, 0.7137255, 1,
1.206751, -1.31752, 2.582112, 1, 0, 0.7098039, 1,
1.207394, -0.1626685, 2.069858, 1, 0, 0.7019608, 1,
1.207736, -0.9576049, 1.892814, 1, 0, 0.6941177, 1,
1.209843, -0.5468013, 0.6805539, 1, 0, 0.6901961, 1,
1.210256, 0.3444929, 1.968344, 1, 0, 0.682353, 1,
1.214793, 0.4256567, 0.2798467, 1, 0, 0.6784314, 1,
1.215312, 0.8003085, 1.386127, 1, 0, 0.6705883, 1,
1.216569, -0.993327, 2.424636, 1, 0, 0.6666667, 1,
1.223313, -0.6991979, 2.951198, 1, 0, 0.6588235, 1,
1.223943, -0.4863682, 1.609507, 1, 0, 0.654902, 1,
1.225988, 0.804774, 2.30863, 1, 0, 0.6470588, 1,
1.237939, 1.055345, 2.514535, 1, 0, 0.6431373, 1,
1.24569, -0.9160011, 2.480589, 1, 0, 0.6352941, 1,
1.253129, 0.672143, 0.5839132, 1, 0, 0.6313726, 1,
1.257782, 0.9732975, 0.5537375, 1, 0, 0.6235294, 1,
1.26236, -0.6040818, 1.327606, 1, 0, 0.6196079, 1,
1.279772, -1.229651, 1.884929, 1, 0, 0.6117647, 1,
1.286696, -1.326052, 3.242741, 1, 0, 0.6078432, 1,
1.310584, -2.024668, 2.045293, 1, 0, 0.6, 1,
1.31061, -0.2083255, 1.674345, 1, 0, 0.5921569, 1,
1.314106, -1.657169, 1.313918, 1, 0, 0.5882353, 1,
1.321037, 0.6557418, 2.127811, 1, 0, 0.5803922, 1,
1.32449, 1.847926, 1.717679, 1, 0, 0.5764706, 1,
1.328925, -0.3508303, 1.56625, 1, 0, 0.5686275, 1,
1.335737, 2.616037, -0.5442432, 1, 0, 0.5647059, 1,
1.337285, -0.3775267, 0.2034756, 1, 0, 0.5568628, 1,
1.341283, -1.9883, 2.503377, 1, 0, 0.5529412, 1,
1.344811, 1.542689, 0.0009459432, 1, 0, 0.5450981, 1,
1.344836, 1.060134, -0.4481017, 1, 0, 0.5411765, 1,
1.346839, 0.4200175, 0.7122082, 1, 0, 0.5333334, 1,
1.348902, -1.126816, 2.287069, 1, 0, 0.5294118, 1,
1.350767, 1.198744, 1.552883, 1, 0, 0.5215687, 1,
1.35276, 0.08288456, 2.767668, 1, 0, 0.5176471, 1,
1.353919, 0.3783831, 0.7986749, 1, 0, 0.509804, 1,
1.360163, -0.4993472, 1.28974, 1, 0, 0.5058824, 1,
1.364064, -1.127918, 0.9246659, 1, 0, 0.4980392, 1,
1.365186, 0.3053719, 1.483046, 1, 0, 0.4901961, 1,
1.367864, 0.4886035, -0.05369862, 1, 0, 0.4862745, 1,
1.37878, 0.4630633, 2.136091, 1, 0, 0.4784314, 1,
1.393246, -1.767009, 4.509522, 1, 0, 0.4745098, 1,
1.398859, -0.5054607, 0.9175422, 1, 0, 0.4666667, 1,
1.400019, 0.810998, -1.264832, 1, 0, 0.4627451, 1,
1.40512, -1.456745, 1.898654, 1, 0, 0.454902, 1,
1.405701, 0.5453711, 0.5153485, 1, 0, 0.4509804, 1,
1.417319, 0.7144064, 1.392072, 1, 0, 0.4431373, 1,
1.417388, -0.6466675, 2.688778, 1, 0, 0.4392157, 1,
1.442169, -0.5141287, 1.667289, 1, 0, 0.4313726, 1,
1.445259, 0.6360933, -0.9468437, 1, 0, 0.427451, 1,
1.446097, -0.4440385, 0.2405247, 1, 0, 0.4196078, 1,
1.451736, -0.8123723, 2.967529, 1, 0, 0.4156863, 1,
1.453759, 0.3047353, 1.293116, 1, 0, 0.4078431, 1,
1.460421, 0.0170302, 1.750819, 1, 0, 0.4039216, 1,
1.471972, 0.6895565, 1.05517, 1, 0, 0.3960784, 1,
1.475097, -1.912927, 2.20046, 1, 0, 0.3882353, 1,
1.490659, 1.479265, 2.044879, 1, 0, 0.3843137, 1,
1.495026, -0.9798133, 2.309019, 1, 0, 0.3764706, 1,
1.495532, 0.3110651, 1.418499, 1, 0, 0.372549, 1,
1.51207, 1.249268, -0.6636088, 1, 0, 0.3647059, 1,
1.516484, -0.3710315, 2.522197, 1, 0, 0.3607843, 1,
1.517854, -1.064333, 1.412551, 1, 0, 0.3529412, 1,
1.519307, 0.5210723, 2.35987, 1, 0, 0.3490196, 1,
1.52102, 0.8288842, 0.7048644, 1, 0, 0.3411765, 1,
1.541126, 0.4872861, -0.184272, 1, 0, 0.3372549, 1,
1.556391, -0.8689464, 1.230943, 1, 0, 0.3294118, 1,
1.563168, -0.3252642, 0.2802354, 1, 0, 0.3254902, 1,
1.575107, 0.4911964, -0.5023113, 1, 0, 0.3176471, 1,
1.575514, 0.595996, 1.820968, 1, 0, 0.3137255, 1,
1.576255, 2.072922, 1.847336, 1, 0, 0.3058824, 1,
1.596212, -2.293423, 2.123109, 1, 0, 0.2980392, 1,
1.598568, 0.5538973, 0.9694546, 1, 0, 0.2941177, 1,
1.611603, -0.3724577, 0.5619004, 1, 0, 0.2862745, 1,
1.626684, -0.9472321, 0.6758361, 1, 0, 0.282353, 1,
1.712396, 0.5351855, 0.773439, 1, 0, 0.2745098, 1,
1.72614, -0.8208422, 2.713768, 1, 0, 0.2705882, 1,
1.727189, 0.8905256, 0.1332059, 1, 0, 0.2627451, 1,
1.728101, 1.276626, 1.767196, 1, 0, 0.2588235, 1,
1.740116, 0.03665546, 2.071089, 1, 0, 0.2509804, 1,
1.767644, -1.653137, 2.270582, 1, 0, 0.2470588, 1,
1.777106, 0.342466, 2.235943, 1, 0, 0.2392157, 1,
1.778931, 1.00547, 0.8441526, 1, 0, 0.2352941, 1,
1.792212, -0.07944869, 1.243247, 1, 0, 0.227451, 1,
1.793262, -0.09424557, 1.395345, 1, 0, 0.2235294, 1,
1.820973, -0.39563, 2.503255, 1, 0, 0.2156863, 1,
1.821327, -1.401985, 2.394825, 1, 0, 0.2117647, 1,
1.830177, -1.218761, 2.430658, 1, 0, 0.2039216, 1,
1.851338, -0.09450796, 2.234944, 1, 0, 0.1960784, 1,
1.871951, -0.09550031, 2.050333, 1, 0, 0.1921569, 1,
1.890672, -1.142555, 1.954661, 1, 0, 0.1843137, 1,
1.891092, 0.5858323, 2.376025, 1, 0, 0.1803922, 1,
1.892364, -0.05526046, 1.714784, 1, 0, 0.172549, 1,
1.898665, -0.3631422, 0.8206683, 1, 0, 0.1686275, 1,
1.934017, -0.7976251, 2.500726, 1, 0, 0.1607843, 1,
1.947414, -0.2172519, 1.194748, 1, 0, 0.1568628, 1,
1.981568, 1.345024, 1.956004, 1, 0, 0.1490196, 1,
1.996408, 1.989564, -0.7822897, 1, 0, 0.145098, 1,
2.022025, -0.5341995, 1.485018, 1, 0, 0.1372549, 1,
2.03781, 0.7142174, 2.081307, 1, 0, 0.1333333, 1,
2.094904, -0.8020529, 0.8489075, 1, 0, 0.1254902, 1,
2.105698, -0.08370011, 1.55213, 1, 0, 0.1215686, 1,
2.166781, 0.004050629, 1.062928, 1, 0, 0.1137255, 1,
2.18351, 0.5204278, -0.0797862, 1, 0, 0.1098039, 1,
2.228037, -0.2956481, 0.4606015, 1, 0, 0.1019608, 1,
2.239598, -0.05689897, 1.561311, 1, 0, 0.09411765, 1,
2.265886, 0.4169854, -0.3397635, 1, 0, 0.09019608, 1,
2.282734, -2.243717, 1.850739, 1, 0, 0.08235294, 1,
2.305481, 1.73764, 1.590711, 1, 0, 0.07843138, 1,
2.316528, 0.3819838, 2.962056, 1, 0, 0.07058824, 1,
2.333541, -0.2230235, 1.93583, 1, 0, 0.06666667, 1,
2.606741, 0.8428739, 0.684867, 1, 0, 0.05882353, 1,
2.855771, 0.6236988, 0.1835013, 1, 0, 0.05490196, 1,
2.899712, -0.6843918, 2.939538, 1, 0, 0.04705882, 1,
2.91327, 1.330007, 0.6243349, 1, 0, 0.04313726, 1,
2.963076, 0.5701108, 0.983864, 1, 0, 0.03529412, 1,
3.132202, -0.9723815, 0.7611036, 1, 0, 0.03137255, 1,
3.338914, -1.555266, 0.6877863, 1, 0, 0.02352941, 1,
3.343813, -0.08679763, 1.525753, 1, 0, 0.01960784, 1,
3.379736, 1.476201, 0.6281065, 1, 0, 0.01176471, 1,
3.479496, -1.330253, 1.192349, 1, 0, 0.007843138, 1
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
0.4280987, -4.699153, -6.714408, 0, -0.5, 0.5, 0.5,
0.4280987, -4.699153, -6.714408, 1, -0.5, 0.5, 0.5,
0.4280987, -4.699153, -6.714408, 1, 1.5, 0.5, 0.5,
0.4280987, -4.699153, -6.714408, 0, 1.5, 0.5, 0.5
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
-3.657722, 0.003360152, -6.714408, 0, -0.5, 0.5, 0.5,
-3.657722, 0.003360152, -6.714408, 1, -0.5, 0.5, 0.5,
-3.657722, 0.003360152, -6.714408, 1, 1.5, 0.5, 0.5,
-3.657722, 0.003360152, -6.714408, 0, 1.5, 0.5, 0.5
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
-3.657722, -4.699153, 0.5427115, 0, -0.5, 0.5, 0.5,
-3.657722, -4.699153, 0.5427115, 1, -0.5, 0.5, 0.5,
-3.657722, -4.699153, 0.5427115, 1, 1.5, 0.5, 0.5,
-3.657722, -4.699153, 0.5427115, 0, 1.5, 0.5, 0.5
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
-2, -3.613958, -5.039689,
3, -3.613958, -5.039689,
-2, -3.613958, -5.039689,
-2, -3.794823, -5.318809,
-1, -3.613958, -5.039689,
-1, -3.794823, -5.318809,
0, -3.613958, -5.039689,
0, -3.794823, -5.318809,
1, -3.613958, -5.039689,
1, -3.794823, -5.318809,
2, -3.613958, -5.039689,
2, -3.794823, -5.318809,
3, -3.613958, -5.039689,
3, -3.794823, -5.318809
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
-2, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
-2, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
-2, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
-2, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5,
-1, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
-1, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
-1, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
-1, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5,
0, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
0, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
0, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
0, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5,
1, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
1, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
1, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
1, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5,
2, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
2, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
2, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
2, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5,
3, -4.156555, -5.877048, 0, -0.5, 0.5, 0.5,
3, -4.156555, -5.877048, 1, -0.5, 0.5, 0.5,
3, -4.156555, -5.877048, 1, 1.5, 0.5, 0.5,
3, -4.156555, -5.877048, 0, 1.5, 0.5, 0.5
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
-2.71484, -2, -5.039689,
-2.71484, 2, -5.039689,
-2.71484, -2, -5.039689,
-2.871987, -2, -5.318809,
-2.71484, 0, -5.039689,
-2.871987, 0, -5.318809,
-2.71484, 2, -5.039689,
-2.871987, 2, -5.318809
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
-3.186281, -2, -5.877048, 0, -0.5, 0.5, 0.5,
-3.186281, -2, -5.877048, 1, -0.5, 0.5, 0.5,
-3.186281, -2, -5.877048, 1, 1.5, 0.5, 0.5,
-3.186281, -2, -5.877048, 0, 1.5, 0.5, 0.5,
-3.186281, 0, -5.877048, 0, -0.5, 0.5, 0.5,
-3.186281, 0, -5.877048, 1, -0.5, 0.5, 0.5,
-3.186281, 0, -5.877048, 1, 1.5, 0.5, 0.5,
-3.186281, 0, -5.877048, 0, 1.5, 0.5, 0.5,
-3.186281, 2, -5.877048, 0, -0.5, 0.5, 0.5,
-3.186281, 2, -5.877048, 1, -0.5, 0.5, 0.5,
-3.186281, 2, -5.877048, 1, 1.5, 0.5, 0.5,
-3.186281, 2, -5.877048, 0, 1.5, 0.5, 0.5
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
-2.71484, -3.613958, -4,
-2.71484, -3.613958, 4,
-2.71484, -3.613958, -4,
-2.871987, -3.794823, -4,
-2.71484, -3.613958, -2,
-2.871987, -3.794823, -2,
-2.71484, -3.613958, 0,
-2.871987, -3.794823, 0,
-2.71484, -3.613958, 2,
-2.871987, -3.794823, 2,
-2.71484, -3.613958, 4,
-2.871987, -3.794823, 4
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
-3.186281, -4.156555, -4, 0, -0.5, 0.5, 0.5,
-3.186281, -4.156555, -4, 1, -0.5, 0.5, 0.5,
-3.186281, -4.156555, -4, 1, 1.5, 0.5, 0.5,
-3.186281, -4.156555, -4, 0, 1.5, 0.5, 0.5,
-3.186281, -4.156555, -2, 0, -0.5, 0.5, 0.5,
-3.186281, -4.156555, -2, 1, -0.5, 0.5, 0.5,
-3.186281, -4.156555, -2, 1, 1.5, 0.5, 0.5,
-3.186281, -4.156555, -2, 0, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 0, 0, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 0, 1, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 0, 1, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 0, 0, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 2, 0, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 2, 1, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 2, 1, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 2, 0, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 4, 0, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 4, 1, -0.5, 0.5, 0.5,
-3.186281, -4.156555, 4, 1, 1.5, 0.5, 0.5,
-3.186281, -4.156555, 4, 0, 1.5, 0.5, 0.5
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
-2.71484, -3.613958, -5.039689,
-2.71484, 3.620678, -5.039689,
-2.71484, -3.613958, 6.125112,
-2.71484, 3.620678, 6.125112,
-2.71484, -3.613958, -5.039689,
-2.71484, -3.613958, 6.125112,
-2.71484, 3.620678, -5.039689,
-2.71484, 3.620678, 6.125112,
-2.71484, -3.613958, -5.039689,
3.571038, -3.613958, -5.039689,
-2.71484, -3.613958, 6.125112,
3.571038, -3.613958, 6.125112,
-2.71484, 3.620678, -5.039689,
3.571038, 3.620678, -5.039689,
-2.71484, 3.620678, 6.125112,
3.571038, 3.620678, 6.125112,
3.571038, -3.613958, -5.039689,
3.571038, 3.620678, -5.039689,
3.571038, -3.613958, 6.125112,
3.571038, 3.620678, 6.125112,
3.571038, -3.613958, -5.039689,
3.571038, -3.613958, 6.125112,
3.571038, 3.620678, -5.039689,
3.571038, 3.620678, 6.125112
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
var radius = 7.857048;
var distance = 34.95689;
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
mvMatrix.translate( -0.4280987, -0.003360152, -0.5427115 );
mvMatrix.scale( 1.351473, 1.174239, 0.7608908 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.95689);
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


