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
-2.792131, 1.133553, -0.4828769, 1, 0, 0, 1,
-2.774044, 1.117551, -1.375758, 1, 0.007843138, 0, 1,
-2.752637, 0.4686127, -0.249176, 1, 0.01176471, 0, 1,
-2.65748, -0.237094, -1.610708, 1, 0.01960784, 0, 1,
-2.63443, -0.1008361, -0.1630945, 1, 0.02352941, 0, 1,
-2.546151, -0.1258433, -2.220512, 1, 0.03137255, 0, 1,
-2.388555, -0.1092139, -2.113957, 1, 0.03529412, 0, 1,
-2.375015, -1.265451, -3.597208, 1, 0.04313726, 0, 1,
-2.370978, 0.616723, -0.6214551, 1, 0.04705882, 0, 1,
-2.347444, -2.915946, -2.976272, 1, 0.05490196, 0, 1,
-2.346316, -0.4783033, -0.4946977, 1, 0.05882353, 0, 1,
-2.308731, 0.8918839, -1.490573, 1, 0.06666667, 0, 1,
-2.268852, -0.5596865, -1.98112, 1, 0.07058824, 0, 1,
-2.248564, -1.569029, -2.166533, 1, 0.07843138, 0, 1,
-2.232515, 1.136508, -1.101693, 1, 0.08235294, 0, 1,
-2.197819, -0.1310227, -0.7293044, 1, 0.09019608, 0, 1,
-2.181926, 0.159899, -1.759006, 1, 0.09411765, 0, 1,
-2.155798, -0.8208264, -0.8938633, 1, 0.1019608, 0, 1,
-2.133903, 0.3154428, -0.1146304, 1, 0.1098039, 0, 1,
-2.093469, -0.9881675, -1.476198, 1, 0.1137255, 0, 1,
-2.08544, 0.04779281, -2.737016, 1, 0.1215686, 0, 1,
-2.081743, -0.2415649, -0.2787077, 1, 0.1254902, 0, 1,
-1.987128, 2.864149, -0.2164364, 1, 0.1333333, 0, 1,
-1.975473, -0.4821838, -1.246513, 1, 0.1372549, 0, 1,
-1.903582, -0.3847082, -1.512759, 1, 0.145098, 0, 1,
-1.888752, -1.328273, 0.9395294, 1, 0.1490196, 0, 1,
-1.888745, 2.385601, -1.466619, 1, 0.1568628, 0, 1,
-1.887796, -0.280556, -2.843375, 1, 0.1607843, 0, 1,
-1.867474, -1.27967, -1.102093, 1, 0.1686275, 0, 1,
-1.859087, 0.5331199, -0.4609057, 1, 0.172549, 0, 1,
-1.847032, -0.08190254, -2.853331, 1, 0.1803922, 0, 1,
-1.822393, -1.267891, -1.208371, 1, 0.1843137, 0, 1,
-1.821485, 1.657647, -2.310186, 1, 0.1921569, 0, 1,
-1.815661, 0.1240838, -2.975441, 1, 0.1960784, 0, 1,
-1.810513, -1.070321, -1.943062, 1, 0.2039216, 0, 1,
-1.8101, 0.8881186, 0.4529595, 1, 0.2117647, 0, 1,
-1.806865, -1.085552, -2.926947, 1, 0.2156863, 0, 1,
-1.804818, -0.2787229, -1.047792, 1, 0.2235294, 0, 1,
-1.796632, 0.4593508, -1.0997, 1, 0.227451, 0, 1,
-1.780699, 1.306762, -0.3443521, 1, 0.2352941, 0, 1,
-1.773538, 0.8459662, -2.51712, 1, 0.2392157, 0, 1,
-1.763777, 0.3129304, -1.582508, 1, 0.2470588, 0, 1,
-1.753375, -0.7851697, -0.3945733, 1, 0.2509804, 0, 1,
-1.728674, -0.6354064, -4.11552, 1, 0.2588235, 0, 1,
-1.6915, 0.7869489, -0.7937527, 1, 0.2627451, 0, 1,
-1.677754, 0.08562066, -1.823872, 1, 0.2705882, 0, 1,
-1.672754, 0.9457517, -0.07052399, 1, 0.2745098, 0, 1,
-1.660473, -0.3840912, -2.998245, 1, 0.282353, 0, 1,
-1.648493, 1.145457, -2.280143, 1, 0.2862745, 0, 1,
-1.643649, -1.487408, -2.459303, 1, 0.2941177, 0, 1,
-1.642719, -0.7167339, -3.249673, 1, 0.3019608, 0, 1,
-1.638266, -2.532555, -4.429529, 1, 0.3058824, 0, 1,
-1.630139, -0.507537, -2.108071, 1, 0.3137255, 0, 1,
-1.62905, 0.3731856, -0.360296, 1, 0.3176471, 0, 1,
-1.620903, 1.597739, -0.9346262, 1, 0.3254902, 0, 1,
-1.619399, -0.5662717, -1.734156, 1, 0.3294118, 0, 1,
-1.597915, -1.208076, -2.357911, 1, 0.3372549, 0, 1,
-1.579739, 0.7867829, -0.420589, 1, 0.3411765, 0, 1,
-1.579028, -1.696282, -3.002679, 1, 0.3490196, 0, 1,
-1.577956, 0.3055569, -0.4468194, 1, 0.3529412, 0, 1,
-1.567533, -0.5002621, -1.628439, 1, 0.3607843, 0, 1,
-1.559824, -1.098105, -1.656983, 1, 0.3647059, 0, 1,
-1.527997, 0.970758, -0.6603016, 1, 0.372549, 0, 1,
-1.516109, 0.08249405, -0.3851706, 1, 0.3764706, 0, 1,
-1.515904, -0.5455783, -1.712955, 1, 0.3843137, 0, 1,
-1.514262, -0.4024328, -1.571449, 1, 0.3882353, 0, 1,
-1.511373, -0.67788, -1.251802, 1, 0.3960784, 0, 1,
-1.506547, -1.095147, -1.872748, 1, 0.4039216, 0, 1,
-1.495754, -1.216055, -2.131975, 1, 0.4078431, 0, 1,
-1.495432, -0.604473, -1.793898, 1, 0.4156863, 0, 1,
-1.476322, -0.526755, -0.2450746, 1, 0.4196078, 0, 1,
-1.466658, 1.354005, -1.568899, 1, 0.427451, 0, 1,
-1.466226, -1.182949, -1.381939, 1, 0.4313726, 0, 1,
-1.463253, -1.495122, -3.694121, 1, 0.4392157, 0, 1,
-1.452998, 0.7162291, -0.5239786, 1, 0.4431373, 0, 1,
-1.443389, 1.608269, -0.4510553, 1, 0.4509804, 0, 1,
-1.43852, -0.5350676, -1.898726, 1, 0.454902, 0, 1,
-1.431276, 0.2908532, -1.584535, 1, 0.4627451, 0, 1,
-1.431109, 0.4347262, -2.082234, 1, 0.4666667, 0, 1,
-1.425302, -0.4462126, -3.035721, 1, 0.4745098, 0, 1,
-1.414025, 0.0899578, -2.151156, 1, 0.4784314, 0, 1,
-1.406145, 0.8704442, -0.312159, 1, 0.4862745, 0, 1,
-1.402492, -0.7829368, -1.709196, 1, 0.4901961, 0, 1,
-1.400546, 0.801596, -0.3201359, 1, 0.4980392, 0, 1,
-1.399545, -0.4533677, -2.135339, 1, 0.5058824, 0, 1,
-1.398192, 0.165965, -0.5571468, 1, 0.509804, 0, 1,
-1.397799, 0.7442491, -0.8855579, 1, 0.5176471, 0, 1,
-1.395742, 0.5534047, -0.9770685, 1, 0.5215687, 0, 1,
-1.370788, 0.6001389, -1.177766, 1, 0.5294118, 0, 1,
-1.367064, 1.150742, -1.14493, 1, 0.5333334, 0, 1,
-1.358617, -1.046381, -0.4002493, 1, 0.5411765, 0, 1,
-1.357702, -0.43722, -3.634739, 1, 0.5450981, 0, 1,
-1.351174, -0.7907192, -3.231743, 1, 0.5529412, 0, 1,
-1.351086, -0.2782388, -1.838968, 1, 0.5568628, 0, 1,
-1.34646, -0.9421695, -2.095434, 1, 0.5647059, 0, 1,
-1.338051, -1.138787, -2.651564, 1, 0.5686275, 0, 1,
-1.33456, 2.808413, 1.010324, 1, 0.5764706, 0, 1,
-1.328177, 0.433372, -1.209967, 1, 0.5803922, 0, 1,
-1.325552, -1.995906, -3.153889, 1, 0.5882353, 0, 1,
-1.318178, -0.738626, -3.794945, 1, 0.5921569, 0, 1,
-1.316065, 1.123004, -0.04391517, 1, 0.6, 0, 1,
-1.312724, 1.380664, -0.6483282, 1, 0.6078432, 0, 1,
-1.301482, 0.03845056, -1.372629, 1, 0.6117647, 0, 1,
-1.296605, 0.6368551, -0.7423173, 1, 0.6196079, 0, 1,
-1.275608, 0.1920635, -1.615579, 1, 0.6235294, 0, 1,
-1.268242, 0.5057982, 0.5724073, 1, 0.6313726, 0, 1,
-1.265422, -0.4410638, -0.7790612, 1, 0.6352941, 0, 1,
-1.264121, -1.116249, -0.564826, 1, 0.6431373, 0, 1,
-1.263426, 0.6344134, -2.870217, 1, 0.6470588, 0, 1,
-1.258922, 0.4212953, -0.7783561, 1, 0.654902, 0, 1,
-1.257842, 0.7088848, 1.04996, 1, 0.6588235, 0, 1,
-1.256657, 0.7889213, -2.710902, 1, 0.6666667, 0, 1,
-1.251675, -1.269327, -1.226585, 1, 0.6705883, 0, 1,
-1.245294, -0.7521124, -0.2617011, 1, 0.6784314, 0, 1,
-1.234635, -0.6415079, -0.6704078, 1, 0.682353, 0, 1,
-1.230059, -0.7790093, -0.1205539, 1, 0.6901961, 0, 1,
-1.229975, -0.8852882, -2.693929, 1, 0.6941177, 0, 1,
-1.223907, -1.045088, -2.73233, 1, 0.7019608, 0, 1,
-1.195755, 1.541656, -1.851325, 1, 0.7098039, 0, 1,
-1.188535, 0.05975471, -1.592463, 1, 0.7137255, 0, 1,
-1.187038, -1.113439, -2.492494, 1, 0.7215686, 0, 1,
-1.18507, -0.8060083, -2.64731, 1, 0.7254902, 0, 1,
-1.184777, 0.7675402, -0.5285722, 1, 0.7333333, 0, 1,
-1.17968, 0.3742439, -2.361173, 1, 0.7372549, 0, 1,
-1.175213, 0.8484113, -1.171276, 1, 0.7450981, 0, 1,
-1.170247, -0.3357754, -2.813838, 1, 0.7490196, 0, 1,
-1.169247, -1.103007, -3.083459, 1, 0.7568628, 0, 1,
-1.164991, 0.8755391, -1.022604, 1, 0.7607843, 0, 1,
-1.160854, 0.09933017, -2.203082, 1, 0.7686275, 0, 1,
-1.160622, -0.2346178, -1.42246, 1, 0.772549, 0, 1,
-1.158464, 1.355659, -1.053989, 1, 0.7803922, 0, 1,
-1.156134, 0.2059995, -1.611987, 1, 0.7843137, 0, 1,
-1.144951, -1.580417, -4.332943, 1, 0.7921569, 0, 1,
-1.144281, 1.029331, -0.1296064, 1, 0.7960784, 0, 1,
-1.137814, 0.5595422, -1.436842, 1, 0.8039216, 0, 1,
-1.13106, 1.164329, -0.5172809, 1, 0.8117647, 0, 1,
-1.119283, -1.275776, -2.326373, 1, 0.8156863, 0, 1,
-1.108396, 1.07897, -1.453592, 1, 0.8235294, 0, 1,
-1.107833, 1.08941, 0.2059108, 1, 0.827451, 0, 1,
-1.102333, -0.06751081, -1.570889, 1, 0.8352941, 0, 1,
-1.099578, 0.4079923, -0.9743801, 1, 0.8392157, 0, 1,
-1.096663, -0.7810338, -3.775732, 1, 0.8470588, 0, 1,
-1.081904, 0.0408116, -0.3829019, 1, 0.8509804, 0, 1,
-1.073302, -0.3707239, -3.534723, 1, 0.8588235, 0, 1,
-1.066167, -0.7651936, -2.084285, 1, 0.8627451, 0, 1,
-1.066023, -1.432479, -1.881625, 1, 0.8705882, 0, 1,
-1.058965, -0.9544858, -4.238498, 1, 0.8745098, 0, 1,
-1.057488, 1.247773, -0.2893286, 1, 0.8823529, 0, 1,
-1.056209, -0.2632883, -2.434368, 1, 0.8862745, 0, 1,
-1.055802, -0.2910326, -0.8651339, 1, 0.8941177, 0, 1,
-1.047658, -0.03225888, -3.12577, 1, 0.8980392, 0, 1,
-1.044766, -0.3484858, -1.778196, 1, 0.9058824, 0, 1,
-1.021367, 0.6264066, -0.9851615, 1, 0.9137255, 0, 1,
-1.018501, 0.8255761, 0.2297437, 1, 0.9176471, 0, 1,
-1.017645, 0.762426, -0.9605626, 1, 0.9254902, 0, 1,
-1.012449, 0.2880451, -1.183885, 1, 0.9294118, 0, 1,
-1.011516, -0.3957916, -0.9942746, 1, 0.9372549, 0, 1,
-1.002503, -0.2913559, -1.935705, 1, 0.9411765, 0, 1,
-1.000833, 1.152618, -1.193216, 1, 0.9490196, 0, 1,
-0.9983734, -1.353745, -3.010717, 1, 0.9529412, 0, 1,
-0.987808, 0.06918721, -1.21411, 1, 0.9607843, 0, 1,
-0.9781781, 1.92359, -1.920431, 1, 0.9647059, 0, 1,
-0.9722488, 1.600556, 0.6727105, 1, 0.972549, 0, 1,
-0.9696875, -0.1115276, -2.272684, 1, 0.9764706, 0, 1,
-0.9696244, -0.3047846, -3.676857, 1, 0.9843137, 0, 1,
-0.9578248, -1.02191, -1.987206, 1, 0.9882353, 0, 1,
-0.9572884, 0.1783274, -3.273266, 1, 0.9960784, 0, 1,
-0.9520962, 0.4853418, -1.025497, 0.9960784, 1, 0, 1,
-0.9422978, -0.1330292, -1.105642, 0.9921569, 1, 0, 1,
-0.9399601, 0.7844213, -0.8696439, 0.9843137, 1, 0, 1,
-0.9322622, 1.160412, -1.248867, 0.9803922, 1, 0, 1,
-0.9320074, -1.323604, -2.275545, 0.972549, 1, 0, 1,
-0.9275361, -0.7243743, -0.5878707, 0.9686275, 1, 0, 1,
-0.9275118, 1.092422, -0.009562695, 0.9607843, 1, 0, 1,
-0.9237823, -1.202825, -1.186704, 0.9568627, 1, 0, 1,
-0.9159929, 0.9880751, 0.1003213, 0.9490196, 1, 0, 1,
-0.9095037, 0.09106714, -1.418973, 0.945098, 1, 0, 1,
-0.9067106, 0.7597252, 0.9699659, 0.9372549, 1, 0, 1,
-0.8940229, -0.1403943, -2.077846, 0.9333333, 1, 0, 1,
-0.8906003, 0.05047588, -0.1708008, 0.9254902, 1, 0, 1,
-0.8897237, 0.8465412, -0.8524633, 0.9215686, 1, 0, 1,
-0.8854264, 0.8049632, -2.163691, 0.9137255, 1, 0, 1,
-0.8849431, 1.45672, -1.059728, 0.9098039, 1, 0, 1,
-0.8840483, -0.703845, -3.1043, 0.9019608, 1, 0, 1,
-0.883468, 1.157929, 0.5061589, 0.8941177, 1, 0, 1,
-0.8798575, -1.451294, -2.097119, 0.8901961, 1, 0, 1,
-0.8791892, -0.5101584, -1.956475, 0.8823529, 1, 0, 1,
-0.8791801, -0.8111333, 0.9580222, 0.8784314, 1, 0, 1,
-0.8758865, 1.080489, -1.830707, 0.8705882, 1, 0, 1,
-0.8736082, 0.618444, -1.205415, 0.8666667, 1, 0, 1,
-0.868862, -1.171131, -3.842386, 0.8588235, 1, 0, 1,
-0.8655061, -0.4761061, -1.65901, 0.854902, 1, 0, 1,
-0.8569979, -0.9151825, -2.905076, 0.8470588, 1, 0, 1,
-0.8557162, 0.459835, -0.7532826, 0.8431373, 1, 0, 1,
-0.8529502, -0.2514682, -1.616005, 0.8352941, 1, 0, 1,
-0.8521477, 0.5413559, -0.702792, 0.8313726, 1, 0, 1,
-0.8518607, 0.4534402, -2.299698, 0.8235294, 1, 0, 1,
-0.842937, 0.9180725, 0.05205165, 0.8196079, 1, 0, 1,
-0.8386066, 0.4163457, -2.417498, 0.8117647, 1, 0, 1,
-0.8281411, 0.1445685, -0.4333756, 0.8078431, 1, 0, 1,
-0.8242116, -1.382913, -2.712296, 0.8, 1, 0, 1,
-0.8203964, 0.07870699, -1.4467, 0.7921569, 1, 0, 1,
-0.8190139, 0.2580651, -0.4610562, 0.7882353, 1, 0, 1,
-0.8169498, 0.9184254, -1.385654, 0.7803922, 1, 0, 1,
-0.8148125, 0.1213173, -1.452859, 0.7764706, 1, 0, 1,
-0.813844, -2.459059, -1.569702, 0.7686275, 1, 0, 1,
-0.8124454, -1.342696, -2.485443, 0.7647059, 1, 0, 1,
-0.8096769, 1.599028, -0.4876342, 0.7568628, 1, 0, 1,
-0.8087219, 1.43876, 0.4692316, 0.7529412, 1, 0, 1,
-0.8038988, 0.2023611, -2.127255, 0.7450981, 1, 0, 1,
-0.8028441, -0.4462634, -3.03295, 0.7411765, 1, 0, 1,
-0.7965476, -0.5539167, -4.154574, 0.7333333, 1, 0, 1,
-0.7945761, -1.774229, -3.712869, 0.7294118, 1, 0, 1,
-0.7911402, 0.1070595, -1.947165, 0.7215686, 1, 0, 1,
-0.7908127, 0.4561108, 0.03284736, 0.7176471, 1, 0, 1,
-0.7888449, -1.829405, -3.000577, 0.7098039, 1, 0, 1,
-0.7856696, 0.01462434, -1.691753, 0.7058824, 1, 0, 1,
-0.7852136, -1.709949, -3.00121, 0.6980392, 1, 0, 1,
-0.7849101, 0.6157516, 0.9878072, 0.6901961, 1, 0, 1,
-0.7814059, 1.068961, -0.8683109, 0.6862745, 1, 0, 1,
-0.7745578, -0.05399308, -1.421924, 0.6784314, 1, 0, 1,
-0.7744371, 0.1648292, -0.1886373, 0.6745098, 1, 0, 1,
-0.7726299, -0.7264056, -1.250978, 0.6666667, 1, 0, 1,
-0.7661192, -0.5655701, -3.473578, 0.6627451, 1, 0, 1,
-0.7575376, 0.1650053, -1.445835, 0.654902, 1, 0, 1,
-0.7557276, 0.6996517, 0.4972256, 0.6509804, 1, 0, 1,
-0.7553242, 1.709166, -0.5555996, 0.6431373, 1, 0, 1,
-0.7542483, -0.5359088, -0.9876983, 0.6392157, 1, 0, 1,
-0.7490568, 0.5286682, -1.261981, 0.6313726, 1, 0, 1,
-0.7486785, -0.2606455, -1.525489, 0.627451, 1, 0, 1,
-0.7468995, -0.0320661, -1.510686, 0.6196079, 1, 0, 1,
-0.7453915, -1.57919, -2.151422, 0.6156863, 1, 0, 1,
-0.7448065, -0.78009, -3.724956, 0.6078432, 1, 0, 1,
-0.7447541, 0.2705073, 0.1861021, 0.6039216, 1, 0, 1,
-0.7389783, 0.8061655, 0.4834461, 0.5960785, 1, 0, 1,
-0.7374946, -0.07606728, -0.9352657, 0.5882353, 1, 0, 1,
-0.7356578, 1.600325, -0.7899866, 0.5843138, 1, 0, 1,
-0.7328773, 1.03054, -0.6309511, 0.5764706, 1, 0, 1,
-0.7304873, -0.2781637, -1.923349, 0.572549, 1, 0, 1,
-0.7261023, 0.4007342, -1.95626, 0.5647059, 1, 0, 1,
-0.7243681, -0.007109642, -0.6829337, 0.5607843, 1, 0, 1,
-0.7230659, 1.338356, -1.742742, 0.5529412, 1, 0, 1,
-0.7202477, 1.004987, -2.097681, 0.5490196, 1, 0, 1,
-0.7195996, 0.6995494, -0.899714, 0.5411765, 1, 0, 1,
-0.7111043, -0.1798557, -0.5943807, 0.5372549, 1, 0, 1,
-0.7106993, 0.03254325, -4.08174, 0.5294118, 1, 0, 1,
-0.6988743, -0.01112583, -1.456389, 0.5254902, 1, 0, 1,
-0.6912269, 0.03967747, 0.1383329, 0.5176471, 1, 0, 1,
-0.6890163, 0.5550863, -1.691016, 0.5137255, 1, 0, 1,
-0.6860476, 1.261103, -1.401783, 0.5058824, 1, 0, 1,
-0.6810588, 0.3147463, -1.35186, 0.5019608, 1, 0, 1,
-0.6771745, -1.338004, -2.020103, 0.4941176, 1, 0, 1,
-0.6764428, -0.4382041, -3.565343, 0.4862745, 1, 0, 1,
-0.6761989, -1.174933, -4.159099, 0.4823529, 1, 0, 1,
-0.6749626, -1.595764, -2.980082, 0.4745098, 1, 0, 1,
-0.6732681, 0.07035515, -1.949479, 0.4705882, 1, 0, 1,
-0.6697149, -0.5858615, -2.200031, 0.4627451, 1, 0, 1,
-0.6691888, -1.365454, -2.968174, 0.4588235, 1, 0, 1,
-0.668785, -1.252945, -3.133746, 0.4509804, 1, 0, 1,
-0.6662847, -0.8998181, -4.185997, 0.4470588, 1, 0, 1,
-0.6625071, -2.809824, -1.754473, 0.4392157, 1, 0, 1,
-0.653555, 1.635891, -1.651739, 0.4352941, 1, 0, 1,
-0.6528222, 1.767393, 0.2927469, 0.427451, 1, 0, 1,
-0.649407, -0.2721648, -2.464412, 0.4235294, 1, 0, 1,
-0.6460411, -0.4618424, -3.317618, 0.4156863, 1, 0, 1,
-0.634829, 1.414217, 0.7135065, 0.4117647, 1, 0, 1,
-0.6305324, 0.5016511, -1.308729, 0.4039216, 1, 0, 1,
-0.6280335, -0.5666568, -1.271704, 0.3960784, 1, 0, 1,
-0.6231692, 0.5657148, 0.4960366, 0.3921569, 1, 0, 1,
-0.612282, -0.5148342, -0.5779569, 0.3843137, 1, 0, 1,
-0.6119616, 0.1978497, -4.071359, 0.3803922, 1, 0, 1,
-0.6054552, -1.554153, -2.471329, 0.372549, 1, 0, 1,
-0.5968093, -0.9819937, -1.989522, 0.3686275, 1, 0, 1,
-0.5957945, -1.303741, -2.362042, 0.3607843, 1, 0, 1,
-0.5946567, 0.5812814, -0.7998264, 0.3568628, 1, 0, 1,
-0.5925092, 0.8390365, -0.6025187, 0.3490196, 1, 0, 1,
-0.59241, 0.3499233, -1.308602, 0.345098, 1, 0, 1,
-0.5901231, -1.30493, -3.615178, 0.3372549, 1, 0, 1,
-0.5857337, 0.6786474, -0.1803108, 0.3333333, 1, 0, 1,
-0.5841776, 1.373115, 0.2842076, 0.3254902, 1, 0, 1,
-0.5821251, 0.673691, -0.5833617, 0.3215686, 1, 0, 1,
-0.5810063, -1.159392, -3.598695, 0.3137255, 1, 0, 1,
-0.5809783, 2.028836, 0.6301046, 0.3098039, 1, 0, 1,
-0.5806441, 0.4336454, 0.1508457, 0.3019608, 1, 0, 1,
-0.5798759, 1.779008, 0.791623, 0.2941177, 1, 0, 1,
-0.578635, -0.4437375, -2.907274, 0.2901961, 1, 0, 1,
-0.5755807, -0.728677, -2.577468, 0.282353, 1, 0, 1,
-0.5720579, 1.296333, -0.7788156, 0.2784314, 1, 0, 1,
-0.5712919, -0.5512363, -3.402285, 0.2705882, 1, 0, 1,
-0.5671984, -0.06349216, -2.481131, 0.2666667, 1, 0, 1,
-0.5670766, -0.6537921, -2.348518, 0.2588235, 1, 0, 1,
-0.5594718, -1.014865, -2.477364, 0.254902, 1, 0, 1,
-0.5521411, -0.3353175, -2.51596, 0.2470588, 1, 0, 1,
-0.5400729, -1.139739, -3.435668, 0.2431373, 1, 0, 1,
-0.5385704, 0.4480209, -2.032025, 0.2352941, 1, 0, 1,
-0.5367408, 0.0803261, -1.485593, 0.2313726, 1, 0, 1,
-0.5307056, -0.4775371, -2.959947, 0.2235294, 1, 0, 1,
-0.5220641, -0.319511, -0.7803644, 0.2196078, 1, 0, 1,
-0.5157796, -1.375471, -1.555679, 0.2117647, 1, 0, 1,
-0.5131846, -0.4358345, -2.227737, 0.2078431, 1, 0, 1,
-0.5086044, -0.5182375, -2.716873, 0.2, 1, 0, 1,
-0.5070807, 0.2913975, -2.510625, 0.1921569, 1, 0, 1,
-0.505017, 1.323781, -1.360994, 0.1882353, 1, 0, 1,
-0.4897783, -0.09374532, -1.0354, 0.1803922, 1, 0, 1,
-0.4866765, 0.05001855, 0.2188355, 0.1764706, 1, 0, 1,
-0.4845129, 0.349552, -1.896269, 0.1686275, 1, 0, 1,
-0.4837786, -0.7772689, -2.413416, 0.1647059, 1, 0, 1,
-0.4745668, -0.08556486, -2.164608, 0.1568628, 1, 0, 1,
-0.4705798, 0.3258358, -0.242953, 0.1529412, 1, 0, 1,
-0.4661246, -2.061652, -3.059324, 0.145098, 1, 0, 1,
-0.4655496, 0.6455444, -1.103949, 0.1411765, 1, 0, 1,
-0.4653303, 0.1546827, -1.39065, 0.1333333, 1, 0, 1,
-0.4649818, -0.8855324, -1.467697, 0.1294118, 1, 0, 1,
-0.4604577, 0.7185038, 1.211921, 0.1215686, 1, 0, 1,
-0.4589109, -0.863483, -2.610564, 0.1176471, 1, 0, 1,
-0.4581407, -0.1148036, -1.3978, 0.1098039, 1, 0, 1,
-0.4568615, 0.910731, 0.7966193, 0.1058824, 1, 0, 1,
-0.4508385, 2.658313, 0.958711, 0.09803922, 1, 0, 1,
-0.4498049, 0.8941483, -2.139174, 0.09019608, 1, 0, 1,
-0.4491526, 0.3749456, -0.5988538, 0.08627451, 1, 0, 1,
-0.4482381, 0.08789793, -2.306777, 0.07843138, 1, 0, 1,
-0.4423217, -1.038758, -3.383682, 0.07450981, 1, 0, 1,
-0.4415245, -0.1532041, -2.153246, 0.06666667, 1, 0, 1,
-0.4360702, 0.5686868, 0.3417321, 0.0627451, 1, 0, 1,
-0.4350762, 0.2097934, -1.735417, 0.05490196, 1, 0, 1,
-0.4324266, -0.3407764, -1.881347, 0.05098039, 1, 0, 1,
-0.4308948, 2.076538, 0.01201243, 0.04313726, 1, 0, 1,
-0.4306189, 0.8636855, -1.404363, 0.03921569, 1, 0, 1,
-0.4301199, 0.05292116, -2.175584, 0.03137255, 1, 0, 1,
-0.425631, -0.09494761, -1.930737, 0.02745098, 1, 0, 1,
-0.4219592, 0.9021791, 1.862362, 0.01960784, 1, 0, 1,
-0.4196571, 0.5958319, -0.3413397, 0.01568628, 1, 0, 1,
-0.4117908, 0.9426455, -1.809677, 0.007843138, 1, 0, 1,
-0.4099259, 2.248857, -0.512617, 0.003921569, 1, 0, 1,
-0.4055959, -0.152833, -0.6649936, 0, 1, 0.003921569, 1,
-0.4018307, -0.07940874, -0.8359685, 0, 1, 0.01176471, 1,
-0.401583, 0.2249796, -1.406976, 0, 1, 0.01568628, 1,
-0.395385, 0.1503177, -1.979283, 0, 1, 0.02352941, 1,
-0.3941929, 0.8506192, 0.5517002, 0, 1, 0.02745098, 1,
-0.3931194, -1.091964, -2.594844, 0, 1, 0.03529412, 1,
-0.392837, -0.1969893, -1.028785, 0, 1, 0.03921569, 1,
-0.3897614, 0.2043934, -0.6621106, 0, 1, 0.04705882, 1,
-0.389652, 0.9142846, -0.4018739, 0, 1, 0.05098039, 1,
-0.3859598, 2.024148, -0.7043882, 0, 1, 0.05882353, 1,
-0.384499, 0.6159598, -0.8894709, 0, 1, 0.0627451, 1,
-0.3825116, -0.1502118, -4.488103, 0, 1, 0.07058824, 1,
-0.3815764, 0.09519766, -1.281765, 0, 1, 0.07450981, 1,
-0.3672588, 0.7215974, -0.7114029, 0, 1, 0.08235294, 1,
-0.3663645, 0.7116979, -0.5610905, 0, 1, 0.08627451, 1,
-0.3605015, -0.06059493, -1.965538, 0, 1, 0.09411765, 1,
-0.3584522, -0.3862476, -3.069757, 0, 1, 0.1019608, 1,
-0.3576475, -0.004590224, -1.607669, 0, 1, 0.1058824, 1,
-0.3554248, 0.8824509, 0.3109626, 0, 1, 0.1137255, 1,
-0.3533285, -2.854229, -5.087142, 0, 1, 0.1176471, 1,
-0.3489032, 0.2242561, -0.8710197, 0, 1, 0.1254902, 1,
-0.3436009, -3.342882, -2.028564, 0, 1, 0.1294118, 1,
-0.340696, 0.193133, -1.382585, 0, 1, 0.1372549, 1,
-0.3402667, 1.103834, 0.1326836, 0, 1, 0.1411765, 1,
-0.3378647, -0.05777311, -2.230744, 0, 1, 0.1490196, 1,
-0.3377979, -0.4356551, -1.302834, 0, 1, 0.1529412, 1,
-0.3371839, 0.7342364, -1.988266, 0, 1, 0.1607843, 1,
-0.3364348, -0.6851083, -3.711651, 0, 1, 0.1647059, 1,
-0.3341608, -2.313367, -2.483091, 0, 1, 0.172549, 1,
-0.3283372, -0.3541683, -2.567387, 0, 1, 0.1764706, 1,
-0.3274167, 2.600296, -0.1086194, 0, 1, 0.1843137, 1,
-0.3272161, -0.8005012, -3.985938, 0, 1, 0.1882353, 1,
-0.3200331, 0.1566933, -2.088377, 0, 1, 0.1960784, 1,
-0.3183048, -1.193239, -2.649116, 0, 1, 0.2039216, 1,
-0.3169636, -0.7521721, -3.151002, 0, 1, 0.2078431, 1,
-0.3141586, 1.246738, -0.7522887, 0, 1, 0.2156863, 1,
-0.3140658, 0.5432848, 1.562513, 0, 1, 0.2196078, 1,
-0.3062363, -0.1846271, -1.57284, 0, 1, 0.227451, 1,
-0.3040559, -1.584208, -2.303829, 0, 1, 0.2313726, 1,
-0.3011885, 0.04935719, -1.189157, 0, 1, 0.2392157, 1,
-0.3004058, 1.533628, -1.50205, 0, 1, 0.2431373, 1,
-0.3002868, 0.5189617, -0.2768437, 0, 1, 0.2509804, 1,
-0.2955802, 0.6361367, -1.821817, 0, 1, 0.254902, 1,
-0.2910065, 0.6594149, -0.4995858, 0, 1, 0.2627451, 1,
-0.2909587, -0.4425313, -2.506184, 0, 1, 0.2666667, 1,
-0.2898386, -0.07153755, -0.622671, 0, 1, 0.2745098, 1,
-0.2879892, 0.7461275, -0.3794653, 0, 1, 0.2784314, 1,
-0.2879545, -0.6538759, -2.776554, 0, 1, 0.2862745, 1,
-0.2847196, -0.03884608, -2.283326, 0, 1, 0.2901961, 1,
-0.2821818, 0.411548, -1.988738, 0, 1, 0.2980392, 1,
-0.2804914, 1.193828, 0.3885067, 0, 1, 0.3058824, 1,
-0.2696032, 1.368568, 1.782584, 0, 1, 0.3098039, 1,
-0.2633295, -0.6507567, -1.364469, 0, 1, 0.3176471, 1,
-0.2627084, 0.1853243, -0.8701536, 0, 1, 0.3215686, 1,
-0.2610621, -0.6916233, -4.376329, 0, 1, 0.3294118, 1,
-0.2568849, 0.357364, -0.7712307, 0, 1, 0.3333333, 1,
-0.2522281, -0.4337026, -3.236985, 0, 1, 0.3411765, 1,
-0.2517996, -0.05772779, -2.742519, 0, 1, 0.345098, 1,
-0.250151, 0.9604562, 0.9359929, 0, 1, 0.3529412, 1,
-0.2497393, -0.1118231, -2.071472, 0, 1, 0.3568628, 1,
-0.2495059, 0.5184289, -0.397827, 0, 1, 0.3647059, 1,
-0.2481159, 0.07878329, -0.5390559, 0, 1, 0.3686275, 1,
-0.2452494, -0.1652482, -0.5116842, 0, 1, 0.3764706, 1,
-0.2446517, -0.6904218, -4.070059, 0, 1, 0.3803922, 1,
-0.2446216, -2.501731, -4.080433, 0, 1, 0.3882353, 1,
-0.2441963, -0.289884, -3.996504, 0, 1, 0.3921569, 1,
-0.2322458, 0.7707884, 0.2498822, 0, 1, 0.4, 1,
-0.2300646, -1.02591, -2.606514, 0, 1, 0.4078431, 1,
-0.2286801, 0.1668943, -1.099422, 0, 1, 0.4117647, 1,
-0.2237106, -0.3105655, -3.486576, 0, 1, 0.4196078, 1,
-0.2227051, 0.3450084, -1.401444, 0, 1, 0.4235294, 1,
-0.2106203, 0.4381771, -1.401685, 0, 1, 0.4313726, 1,
-0.2088231, -2.047376, -3.793371, 0, 1, 0.4352941, 1,
-0.2087788, 0.780289, 0.2225632, 0, 1, 0.4431373, 1,
-0.2050703, 0.06613489, -1.946029, 0, 1, 0.4470588, 1,
-0.204399, 0.322824, -1.381253, 0, 1, 0.454902, 1,
-0.197474, -1.003089, -3.211701, 0, 1, 0.4588235, 1,
-0.197303, 0.6903116, -0.4634944, 0, 1, 0.4666667, 1,
-0.1969099, -0.2343925, -1.627036, 0, 1, 0.4705882, 1,
-0.1966645, 0.6608177, 1.892752, 0, 1, 0.4784314, 1,
-0.1954087, -0.2030625, -3.809837, 0, 1, 0.4823529, 1,
-0.1948503, -0.1226458, -1.308097, 0, 1, 0.4901961, 1,
-0.1945852, -0.8970567, -2.663584, 0, 1, 0.4941176, 1,
-0.1932614, -0.5989833, -2.231225, 0, 1, 0.5019608, 1,
-0.193077, 0.6576174, -1.107801, 0, 1, 0.509804, 1,
-0.1923444, 0.3608408, 0.3866968, 0, 1, 0.5137255, 1,
-0.1905824, -0.5741092, -3.097596, 0, 1, 0.5215687, 1,
-0.1814853, 0.1920624, -0.1008471, 0, 1, 0.5254902, 1,
-0.1808165, 1.46317, -1.469408, 0, 1, 0.5333334, 1,
-0.1744324, -0.6068329, -1.825409, 0, 1, 0.5372549, 1,
-0.1736001, -0.5668168, -3.656704, 0, 1, 0.5450981, 1,
-0.155295, -2.414773, -3.121136, 0, 1, 0.5490196, 1,
-0.1545589, 1.199589, -2.448676, 0, 1, 0.5568628, 1,
-0.1518315, -0.2943179, -3.566471, 0, 1, 0.5607843, 1,
-0.1487479, 0.4003972, 0.6617607, 0, 1, 0.5686275, 1,
-0.1476846, 1.332539, 0.9574211, 0, 1, 0.572549, 1,
-0.1429878, 1.060538, -0.002422385, 0, 1, 0.5803922, 1,
-0.1399014, 0.1227897, -1.932937, 0, 1, 0.5843138, 1,
-0.1372793, 0.7395163, -0.7665641, 0, 1, 0.5921569, 1,
-0.1371866, 0.5941094, -0.6331449, 0, 1, 0.5960785, 1,
-0.135398, -1.673191, -2.772533, 0, 1, 0.6039216, 1,
-0.1333901, -0.02257573, -1.427838, 0, 1, 0.6117647, 1,
-0.1331443, -0.7535537, -3.548074, 0, 1, 0.6156863, 1,
-0.1270815, -0.4718464, -2.602187, 0, 1, 0.6235294, 1,
-0.1233137, -0.6709846, -2.785145, 0, 1, 0.627451, 1,
-0.121519, 0.7859824, 0.4988237, 0, 1, 0.6352941, 1,
-0.1201996, 1.779847, -0.1420834, 0, 1, 0.6392157, 1,
-0.1193407, 0.4048017, -0.3273694, 0, 1, 0.6470588, 1,
-0.118194, 0.175731, -0.3134052, 0, 1, 0.6509804, 1,
-0.1160053, -0.6146002, -2.549343, 0, 1, 0.6588235, 1,
-0.1152904, 2.096323, -0.9811481, 0, 1, 0.6627451, 1,
-0.1107023, -0.0350062, -3.005196, 0, 1, 0.6705883, 1,
-0.1079287, -0.6096452, -3.748067, 0, 1, 0.6745098, 1,
-0.1077526, 0.6750044, -0.06224394, 0, 1, 0.682353, 1,
-0.1061746, 0.1243875, -0.3303903, 0, 1, 0.6862745, 1,
-0.1056416, 0.05545339, -1.507126, 0, 1, 0.6941177, 1,
-0.1054225, -0.7952206, -3.666405, 0, 1, 0.7019608, 1,
-0.1023208, 0.4419803, 0.9817752, 0, 1, 0.7058824, 1,
-0.09901159, -0.9584777, -3.707065, 0, 1, 0.7137255, 1,
-0.09860115, 0.3311076, -1.593886, 0, 1, 0.7176471, 1,
-0.09680108, 1.425924, 0.7391606, 0, 1, 0.7254902, 1,
-0.09542704, 0.601641, 1.254178, 0, 1, 0.7294118, 1,
-0.08714101, 1.110504, 1.052249, 0, 1, 0.7372549, 1,
-0.0859437, -0.4938876, -3.656391, 0, 1, 0.7411765, 1,
-0.08359303, -0.5339918, -2.277623, 0, 1, 0.7490196, 1,
-0.08237828, 0.9026714, -0.4245849, 0, 1, 0.7529412, 1,
-0.07962347, 0.4125308, -0.8925828, 0, 1, 0.7607843, 1,
-0.07563936, -1.107111, -4.972256, 0, 1, 0.7647059, 1,
-0.0733987, 2.565284, 1.152758, 0, 1, 0.772549, 1,
-0.07270774, 1.235946, 0.1264503, 0, 1, 0.7764706, 1,
-0.06871296, 0.4938456, 2.253741, 0, 1, 0.7843137, 1,
-0.06840798, 0.1642549, 0.407368, 0, 1, 0.7882353, 1,
-0.06226813, 0.7223178, 1.524202, 0, 1, 0.7960784, 1,
-0.06125654, 0.7677398, 0.1513875, 0, 1, 0.8039216, 1,
-0.06101033, 0.1716626, -0.6516474, 0, 1, 0.8078431, 1,
-0.06028841, -0.7963911, -3.250459, 0, 1, 0.8156863, 1,
-0.06001688, -1.149012, -1.348975, 0, 1, 0.8196079, 1,
-0.05785659, 0.1771564, 0.4556312, 0, 1, 0.827451, 1,
-0.04978764, -1.305304, -2.940722, 0, 1, 0.8313726, 1,
-0.04618769, 0.7151215, -0.4386433, 0, 1, 0.8392157, 1,
-0.04466613, -0.5129146, -3.197126, 0, 1, 0.8431373, 1,
-0.04354717, 0.3313126, 0.7335059, 0, 1, 0.8509804, 1,
-0.04198726, -1.441019, -2.211617, 0, 1, 0.854902, 1,
-0.04196515, 0.9008348, 1.145266, 0, 1, 0.8627451, 1,
-0.03927521, 0.2201763, -0.06391032, 0, 1, 0.8666667, 1,
-0.03813635, 1.36553, 0.1873103, 0, 1, 0.8745098, 1,
-0.0366638, -0.5470875, -3.591224, 0, 1, 0.8784314, 1,
-0.03472165, -0.3290606, -3.805272, 0, 1, 0.8862745, 1,
-0.02930863, 0.05846153, 0.1117258, 0, 1, 0.8901961, 1,
-0.02922153, 0.7290691, 0.689023, 0, 1, 0.8980392, 1,
-0.0248929, 1.181929, -0.02079633, 0, 1, 0.9058824, 1,
-0.02026006, 0.7207033, -1.472965, 0, 1, 0.9098039, 1,
-0.01307491, 0.3539767, -0.05938755, 0, 1, 0.9176471, 1,
-0.01181699, -0.09419902, -4.001741, 0, 1, 0.9215686, 1,
-0.00341735, -2.208698, -3.013852, 0, 1, 0.9294118, 1,
-0.003384704, -0.7907564, -3.330704, 0, 1, 0.9333333, 1,
-0.002057801, -0.5948467, -4.157347, 0, 1, 0.9411765, 1,
-0.001877664, -0.2236899, -3.579304, 0, 1, 0.945098, 1,
0.004193031, 0.5405863, 0.4929693, 0, 1, 0.9529412, 1,
0.008417162, -1.113626, 3.172456, 0, 1, 0.9568627, 1,
0.01018059, -0.2611641, 3.431615, 0, 1, 0.9647059, 1,
0.02249529, 0.2043621, 0.4968404, 0, 1, 0.9686275, 1,
0.02390588, 0.17746, 0.7313046, 0, 1, 0.9764706, 1,
0.02407764, -0.9220169, 2.903877, 0, 1, 0.9803922, 1,
0.02598817, 0.3987539, 0.4601868, 0, 1, 0.9882353, 1,
0.02676647, -2.160288, 3.772344, 0, 1, 0.9921569, 1,
0.03163096, -1.413168, 3.781836, 0, 1, 1, 1,
0.03310917, -0.2328667, 4.327841, 0, 0.9921569, 1, 1,
0.03491605, -1.842685, 4.948148, 0, 0.9882353, 1, 1,
0.03617635, -0.837679, 3.5316, 0, 0.9803922, 1, 1,
0.03698995, 0.4071626, 0.3212255, 0, 0.9764706, 1, 1,
0.03822343, -0.1579761, 2.200766, 0, 0.9686275, 1, 1,
0.03830231, -0.2293809, 4.126972, 0, 0.9647059, 1, 1,
0.03868863, 0.5605299, -2.019992, 0, 0.9568627, 1, 1,
0.04154012, 0.9218096, 0.3938228, 0, 0.9529412, 1, 1,
0.04415454, 1.919961, -1.818341, 0, 0.945098, 1, 1,
0.04432523, -1.671273, 3.295128, 0, 0.9411765, 1, 1,
0.04477825, 0.702675, -0.1023772, 0, 0.9333333, 1, 1,
0.04618948, 1.124687, -0.8510599, 0, 0.9294118, 1, 1,
0.04624576, 0.1210081, 0.3147048, 0, 0.9215686, 1, 1,
0.05263514, 1.032193, -0.1637331, 0, 0.9176471, 1, 1,
0.05284239, 1.734902, -0.04893709, 0, 0.9098039, 1, 1,
0.05287945, -0.6440586, 3.914348, 0, 0.9058824, 1, 1,
0.05289873, -0.00263602, 0.6410082, 0, 0.8980392, 1, 1,
0.05290349, -2.39624, 4.300203, 0, 0.8901961, 1, 1,
0.0543539, 0.4053701, 0.3777421, 0, 0.8862745, 1, 1,
0.05665578, 0.8345379, 0.1832444, 0, 0.8784314, 1, 1,
0.05895063, 0.05396219, 0.6269294, 0, 0.8745098, 1, 1,
0.05950224, 0.9214318, -0.03710821, 0, 0.8666667, 1, 1,
0.0600713, -0.2439936, 4.292828, 0, 0.8627451, 1, 1,
0.0609434, 1.26332, -0.1313391, 0, 0.854902, 1, 1,
0.06314554, 2.131111, 0.8237345, 0, 0.8509804, 1, 1,
0.06476195, 0.5599881, 1.294896, 0, 0.8431373, 1, 1,
0.0663916, 0.3379063, 0.6591684, 0, 0.8392157, 1, 1,
0.06811795, -0.4164202, 4.674869, 0, 0.8313726, 1, 1,
0.06826509, 0.9917749, -0.2499104, 0, 0.827451, 1, 1,
0.07055669, -0.4291361, 2.753471, 0, 0.8196079, 1, 1,
0.07166036, -0.6996194, 2.741961, 0, 0.8156863, 1, 1,
0.07723251, 0.452157, 1.510685, 0, 0.8078431, 1, 1,
0.08050235, 0.8691446, 1.816759, 0, 0.8039216, 1, 1,
0.0828324, -0.3091099, 2.678643, 0, 0.7960784, 1, 1,
0.0836662, -1.690768, 4.267807, 0, 0.7882353, 1, 1,
0.08529764, -0.8528806, 3.848336, 0, 0.7843137, 1, 1,
0.08630918, -0.3988733, 2.73475, 0, 0.7764706, 1, 1,
0.09389871, -3.000966, 2.19993, 0, 0.772549, 1, 1,
0.09478714, 0.07844367, 0.8329446, 0, 0.7647059, 1, 1,
0.09647327, -0.731796, 1.56784, 0, 0.7607843, 1, 1,
0.09753205, -1.301583, 2.690031, 0, 0.7529412, 1, 1,
0.09957289, 0.05009343, 1.244992, 0, 0.7490196, 1, 1,
0.09971138, -0.04933845, 1.981914, 0, 0.7411765, 1, 1,
0.1013118, -1.538343, 3.169122, 0, 0.7372549, 1, 1,
0.1029625, -0.7402183, 2.963761, 0, 0.7294118, 1, 1,
0.1054264, -0.551529, 2.549457, 0, 0.7254902, 1, 1,
0.1065225, -0.05378883, 1.148253, 0, 0.7176471, 1, 1,
0.1078437, 1.62514, 1.306975, 0, 0.7137255, 1, 1,
0.1078961, 1.160464, 1.117362, 0, 0.7058824, 1, 1,
0.1087227, 2.047506, 1.837493, 0, 0.6980392, 1, 1,
0.1130944, 1.749028, 2.196853, 0, 0.6941177, 1, 1,
0.1146732, -1.840277, 3.961143, 0, 0.6862745, 1, 1,
0.1206586, 1.558254, 1.62267, 0, 0.682353, 1, 1,
0.1241356, -1.672681, 3.873958, 0, 0.6745098, 1, 1,
0.1321878, -0.6423651, 1.655725, 0, 0.6705883, 1, 1,
0.1334798, 0.4549714, 0.2304815, 0, 0.6627451, 1, 1,
0.1344005, -0.2637819, 2.73284, 0, 0.6588235, 1, 1,
0.1358564, 0.2576524, -1.042556, 0, 0.6509804, 1, 1,
0.141041, -1.224101, 3.943189, 0, 0.6470588, 1, 1,
0.145352, 0.159842, -0.104487, 0, 0.6392157, 1, 1,
0.1457745, -1.142191, 4.401934, 0, 0.6352941, 1, 1,
0.1468554, 1.174894, 0.2300889, 0, 0.627451, 1, 1,
0.1495852, 0.5113477, -0.4044453, 0, 0.6235294, 1, 1,
0.1499522, 0.3299973, 0.09961257, 0, 0.6156863, 1, 1,
0.1557681, -1.21796, 3.5688, 0, 0.6117647, 1, 1,
0.1592808, -1.906974, 3.030965, 0, 0.6039216, 1, 1,
0.1624764, 1.975457, 2.010079, 0, 0.5960785, 1, 1,
0.1652315, -0.04400023, 3.733064, 0, 0.5921569, 1, 1,
0.1660231, -0.403046, 3.302613, 0, 0.5843138, 1, 1,
0.1674737, -0.2147057, 3.174263, 0, 0.5803922, 1, 1,
0.1719321, -1.045728, 2.715844, 0, 0.572549, 1, 1,
0.1782815, 1.184651, 0.04689303, 0, 0.5686275, 1, 1,
0.1824828, -1.579667, 4.036159, 0, 0.5607843, 1, 1,
0.1832398, 0.785119, 1.172713, 0, 0.5568628, 1, 1,
0.1880911, 1.545017, 1.435472, 0, 0.5490196, 1, 1,
0.188092, 0.1652581, 0.8276355, 0, 0.5450981, 1, 1,
0.1949243, 1.384709, 1.127217, 0, 0.5372549, 1, 1,
0.195326, 0.07075748, 2.446173, 0, 0.5333334, 1, 1,
0.1966658, 0.1296803, 2.02404, 0, 0.5254902, 1, 1,
0.1969723, -0.3962907, 2.815759, 0, 0.5215687, 1, 1,
0.1979348, 0.6013557, 1.012778, 0, 0.5137255, 1, 1,
0.1983699, -0.886477, 3.292113, 0, 0.509804, 1, 1,
0.1994751, 2.931033, 0.394215, 0, 0.5019608, 1, 1,
0.2001507, -2.656353, 3.34058, 0, 0.4941176, 1, 1,
0.2027698, -1.065947, 2.71721, 0, 0.4901961, 1, 1,
0.206749, -2.06927, 4.021924, 0, 0.4823529, 1, 1,
0.2077621, -0.2996002, 3.248564, 0, 0.4784314, 1, 1,
0.2078224, 0.5365445, 0.6132238, 0, 0.4705882, 1, 1,
0.2090477, -0.05362352, 3.961159, 0, 0.4666667, 1, 1,
0.2149528, -1.904885, 1.734433, 0, 0.4588235, 1, 1,
0.2151777, 0.149745, 2.602422, 0, 0.454902, 1, 1,
0.2227128, 1.217485, 0.1574951, 0, 0.4470588, 1, 1,
0.223019, 0.6857072, -0.6059059, 0, 0.4431373, 1, 1,
0.2234437, 0.5438575, 1.340276, 0, 0.4352941, 1, 1,
0.2283008, 0.5679226, -0.1981459, 0, 0.4313726, 1, 1,
0.2327753, 0.4768301, -1.441546, 0, 0.4235294, 1, 1,
0.232916, 0.1424187, 0.6781926, 0, 0.4196078, 1, 1,
0.2395443, 1.359612, -0.4440484, 0, 0.4117647, 1, 1,
0.2486337, 0.3123898, 1.22711, 0, 0.4078431, 1, 1,
0.2502116, 0.432702, 0.6234449, 0, 0.4, 1, 1,
0.2505351, -1.093746, 1.707465, 0, 0.3921569, 1, 1,
0.250762, -0.2642244, 1.155658, 0, 0.3882353, 1, 1,
0.2517437, 0.3619243, -0.006652179, 0, 0.3803922, 1, 1,
0.251791, -0.4772457, 3.14817, 0, 0.3764706, 1, 1,
0.253844, -0.6875958, 2.179204, 0, 0.3686275, 1, 1,
0.2540185, -0.4894827, 2.644415, 0, 0.3647059, 1, 1,
0.255355, 1.47143, 1.126515, 0, 0.3568628, 1, 1,
0.2555676, -0.09178077, 3.194366, 0, 0.3529412, 1, 1,
0.2577836, 0.3387278, 3.221067, 0, 0.345098, 1, 1,
0.2634041, 2.017088, 0.5735206, 0, 0.3411765, 1, 1,
0.2649472, -0.1539734, 2.011903, 0, 0.3333333, 1, 1,
0.2651189, -0.8228933, 2.413492, 0, 0.3294118, 1, 1,
0.2707832, -2.722651, 2.10752, 0, 0.3215686, 1, 1,
0.2712485, 1.187507, -1.207207, 0, 0.3176471, 1, 1,
0.2721473, 0.61081, -0.6529998, 0, 0.3098039, 1, 1,
0.2754653, -0.8533809, 3.200419, 0, 0.3058824, 1, 1,
0.2791672, -0.0251093, 1.877997, 0, 0.2980392, 1, 1,
0.2839017, 0.3367872, -0.2089211, 0, 0.2901961, 1, 1,
0.2854011, 0.417975, 1.412694, 0, 0.2862745, 1, 1,
0.2878449, -0.7915395, 3.75971, 0, 0.2784314, 1, 1,
0.2908329, 0.5465215, 1.246492, 0, 0.2745098, 1, 1,
0.2936402, -0.7722119, 4.993036, 0, 0.2666667, 1, 1,
0.2948811, -1.334953, 4.441371, 0, 0.2627451, 1, 1,
0.2953098, -1.000658, 3.31438, 0, 0.254902, 1, 1,
0.2970722, 1.417423, 0.2505799, 0, 0.2509804, 1, 1,
0.3018338, -0.5797885, 1.273714, 0, 0.2431373, 1, 1,
0.3025472, 1.06597, -0.389028, 0, 0.2392157, 1, 1,
0.3032434, 0.6088793, 0.08974829, 0, 0.2313726, 1, 1,
0.3053103, -0.2459197, 3.116129, 0, 0.227451, 1, 1,
0.3059409, 0.5547262, -0.1313714, 0, 0.2196078, 1, 1,
0.3092508, 0.1644126, 0.06279977, 0, 0.2156863, 1, 1,
0.3107775, -0.1396078, 0.8094949, 0, 0.2078431, 1, 1,
0.3128897, -2.238132, 3.316919, 0, 0.2039216, 1, 1,
0.3153589, -0.629767, 2.578984, 0, 0.1960784, 1, 1,
0.3161877, -0.9405447, 1.523315, 0, 0.1882353, 1, 1,
0.3213587, 0.3226817, 1.392172, 0, 0.1843137, 1, 1,
0.3217138, -0.3274404, 2.777079, 0, 0.1764706, 1, 1,
0.3244851, 1.549551, 2.20204, 0, 0.172549, 1, 1,
0.3248833, 1.143444, -0.1206533, 0, 0.1647059, 1, 1,
0.3256984, -0.6439031, 2.15038, 0, 0.1607843, 1, 1,
0.3327613, 0.9121352, -1.249592, 0, 0.1529412, 1, 1,
0.3359808, 1.272086, 1.464658, 0, 0.1490196, 1, 1,
0.3377585, -1.194699, 2.581185, 0, 0.1411765, 1, 1,
0.3402049, -0.1045908, 2.12719, 0, 0.1372549, 1, 1,
0.3425741, -0.4306509, 2.76259, 0, 0.1294118, 1, 1,
0.3443286, -1.88712, 4.24021, 0, 0.1254902, 1, 1,
0.3477387, -0.3963269, 2.583287, 0, 0.1176471, 1, 1,
0.3496998, 1.474526, 1.68819, 0, 0.1137255, 1, 1,
0.3517792, 2.030418, 1.998516, 0, 0.1058824, 1, 1,
0.3552187, 0.2473868, 0.7744349, 0, 0.09803922, 1, 1,
0.3558885, -0.5127219, 2.955832, 0, 0.09411765, 1, 1,
0.3650821, -0.08758812, 0.8067947, 0, 0.08627451, 1, 1,
0.3662172, -2.172257, 2.992324, 0, 0.08235294, 1, 1,
0.3750945, 0.9101608, 0.4111118, 0, 0.07450981, 1, 1,
0.375313, 0.3000422, 0.7340174, 0, 0.07058824, 1, 1,
0.3763987, -1.184477, 3.163486, 0, 0.0627451, 1, 1,
0.3819549, 0.7312393, -0.7173864, 0, 0.05882353, 1, 1,
0.3887653, 0.5853204, -1.527749, 0, 0.05098039, 1, 1,
0.3896392, -0.4508536, 3.607909, 0, 0.04705882, 1, 1,
0.3927227, 1.811158, -0.09564597, 0, 0.03921569, 1, 1,
0.3942125, 0.2689088, 0.2420506, 0, 0.03529412, 1, 1,
0.3966525, 0.3086998, 1.656041, 0, 0.02745098, 1, 1,
0.4033617, -0.6590404, 5.056156, 0, 0.02352941, 1, 1,
0.4169444, -0.1875119, 0.3570669, 0, 0.01568628, 1, 1,
0.4284379, 0.4579177, -0.793167, 0, 0.01176471, 1, 1,
0.4351327, 0.6049091, -0.2406806, 0, 0.003921569, 1, 1,
0.4393505, -0.2992189, 4.321837, 0.003921569, 0, 1, 1,
0.4399449, 0.5350471, 1.295134, 0.007843138, 0, 1, 1,
0.441339, 1.11576, 0.2859834, 0.01568628, 0, 1, 1,
0.4455031, 0.6101692, 1.152047, 0.01960784, 0, 1, 1,
0.4488926, -0.05351542, 2.864868, 0.02745098, 0, 1, 1,
0.4529024, -0.7630125, 3.386317, 0.03137255, 0, 1, 1,
0.452915, 0.4212526, -0.1041078, 0.03921569, 0, 1, 1,
0.4534033, -0.1444247, 3.748948, 0.04313726, 0, 1, 1,
0.4549098, 0.2365808, 0.5237089, 0.05098039, 0, 1, 1,
0.4557993, -0.2665716, 1.544006, 0.05490196, 0, 1, 1,
0.4570051, -0.08549864, 3.09382, 0.0627451, 0, 1, 1,
0.4624398, 0.2493434, -0.5967612, 0.06666667, 0, 1, 1,
0.4627544, -0.2814091, 2.445319, 0.07450981, 0, 1, 1,
0.4683601, 0.473801, 0.46084, 0.07843138, 0, 1, 1,
0.4767412, -0.7648631, 2.991046, 0.08627451, 0, 1, 1,
0.4770659, 1.373217, -1.762052, 0.09019608, 0, 1, 1,
0.4780372, 0.3281613, 1.129474, 0.09803922, 0, 1, 1,
0.478952, 0.809785, 0.6620446, 0.1058824, 0, 1, 1,
0.4808917, -0.8952551, 1.966376, 0.1098039, 0, 1, 1,
0.4811619, -0.1236224, 1.185109, 0.1176471, 0, 1, 1,
0.4819131, 0.1258532, 2.327401, 0.1215686, 0, 1, 1,
0.4853269, -0.7237924, 2.832653, 0.1294118, 0, 1, 1,
0.4879945, 2.413296, 0.5360006, 0.1333333, 0, 1, 1,
0.4881097, 0.1393666, 0.6407911, 0.1411765, 0, 1, 1,
0.4888421, 0.6597375, 2.407308, 0.145098, 0, 1, 1,
0.4908383, -0.7836698, 3.41499, 0.1529412, 0, 1, 1,
0.4949912, 2.466228, 0.3037168, 0.1568628, 0, 1, 1,
0.4985306, -0.9205317, 3.122284, 0.1647059, 0, 1, 1,
0.5002189, -0.6027655, 2.688944, 0.1686275, 0, 1, 1,
0.5041692, -0.666319, 2.157571, 0.1764706, 0, 1, 1,
0.5050255, -1.005164, 2.414547, 0.1803922, 0, 1, 1,
0.5051987, 0.9858339, 0.08477004, 0.1882353, 0, 1, 1,
0.5082734, -0.1429294, 1.212081, 0.1921569, 0, 1, 1,
0.512825, 0.7348735, 0.6718954, 0.2, 0, 1, 1,
0.514576, 0.02772445, 1.384325, 0.2078431, 0, 1, 1,
0.5157747, 0.4411821, 1.304735, 0.2117647, 0, 1, 1,
0.5220521, -0.8705166, 2.830786, 0.2196078, 0, 1, 1,
0.5270033, -0.9418381, 4.836882, 0.2235294, 0, 1, 1,
0.5294124, -0.4852793, 1.57391, 0.2313726, 0, 1, 1,
0.5341808, -0.7519798, 4.257209, 0.2352941, 0, 1, 1,
0.5418368, -0.7560784, 2.474246, 0.2431373, 0, 1, 1,
0.5427771, 1.469191, -0.5785907, 0.2470588, 0, 1, 1,
0.5446597, -1.391592, 3.858962, 0.254902, 0, 1, 1,
0.5493633, -0.3332579, 1.733995, 0.2588235, 0, 1, 1,
0.5528749, -0.1171121, 1.612605, 0.2666667, 0, 1, 1,
0.556502, -0.9986591, 2.462321, 0.2705882, 0, 1, 1,
0.5570673, -0.8208469, 2.333678, 0.2784314, 0, 1, 1,
0.5585517, -0.8864413, 2.701374, 0.282353, 0, 1, 1,
0.5618849, 0.177747, 0.6631319, 0.2901961, 0, 1, 1,
0.5639808, 0.4820383, 0.3683426, 0.2941177, 0, 1, 1,
0.5706924, -0.4863907, 0.2462217, 0.3019608, 0, 1, 1,
0.5715139, 1.618118, 0.7778541, 0.3098039, 0, 1, 1,
0.5731367, 0.2219482, 1.340879, 0.3137255, 0, 1, 1,
0.5761719, -1.197756, 3.533775, 0.3215686, 0, 1, 1,
0.5829137, 0.2860414, 1.46967, 0.3254902, 0, 1, 1,
0.5866756, 0.5633831, 1.109427, 0.3333333, 0, 1, 1,
0.5933563, -0.0653408, 1.258542, 0.3372549, 0, 1, 1,
0.5939218, -1.077214, 2.664564, 0.345098, 0, 1, 1,
0.5958773, -0.8303161, 1.560949, 0.3490196, 0, 1, 1,
0.5983032, 0.9366682, 0.5934696, 0.3568628, 0, 1, 1,
0.603437, -1.053109, 2.349159, 0.3607843, 0, 1, 1,
0.6038297, 0.04925004, 1.943754, 0.3686275, 0, 1, 1,
0.6061145, -0.4273304, 2.782882, 0.372549, 0, 1, 1,
0.6073467, 0.5651129, 0.727255, 0.3803922, 0, 1, 1,
0.6117318, -1.497106, 2.214822, 0.3843137, 0, 1, 1,
0.6135517, -1.430338, 2.451447, 0.3921569, 0, 1, 1,
0.6169714, 1.124976, 0.3722107, 0.3960784, 0, 1, 1,
0.6177368, -0.3241631, 0.8925201, 0.4039216, 0, 1, 1,
0.6184363, -0.429474, 2.467968, 0.4117647, 0, 1, 1,
0.6224306, 1.2164, -0.004356284, 0.4156863, 0, 1, 1,
0.624142, -0.614113, 1.827941, 0.4235294, 0, 1, 1,
0.6280265, 0.3963938, 0.05011981, 0.427451, 0, 1, 1,
0.6305811, 0.1076101, 0.1828752, 0.4352941, 0, 1, 1,
0.6328202, 0.6027703, 0.5081384, 0.4392157, 0, 1, 1,
0.6433615, 0.05008407, 1.34134, 0.4470588, 0, 1, 1,
0.6435886, -1.18966, 1.789915, 0.4509804, 0, 1, 1,
0.6457492, 0.5285281, -0.204307, 0.4588235, 0, 1, 1,
0.6458939, 0.2577446, 0.5193838, 0.4627451, 0, 1, 1,
0.6498706, 0.06114134, 1.919346, 0.4705882, 0, 1, 1,
0.6513522, -0.4859138, 2.527091, 0.4745098, 0, 1, 1,
0.6589536, 0.7743548, 0.4480185, 0.4823529, 0, 1, 1,
0.6591672, -0.4445442, 1.43353, 0.4862745, 0, 1, 1,
0.6601069, 1.619539, 0.2431369, 0.4941176, 0, 1, 1,
0.677169, 0.4967714, 0.931603, 0.5019608, 0, 1, 1,
0.6779695, -0.1718734, 1.383849, 0.5058824, 0, 1, 1,
0.6802862, -0.4300998, 3.361074, 0.5137255, 0, 1, 1,
0.6803577, 0.2808856, 2.215224, 0.5176471, 0, 1, 1,
0.6816941, -0.1516238, 1.263751, 0.5254902, 0, 1, 1,
0.6821755, -1.764167, 2.427305, 0.5294118, 0, 1, 1,
0.6859638, 1.496402, 1.025831, 0.5372549, 0, 1, 1,
0.6922375, 0.04308933, 1.124871, 0.5411765, 0, 1, 1,
0.6955261, 0.234636, -0.2086377, 0.5490196, 0, 1, 1,
0.6982563, 1.272692, 1.450678, 0.5529412, 0, 1, 1,
0.6997116, 0.9786198, 0.8569725, 0.5607843, 0, 1, 1,
0.7006118, -0.9004444, 1.851395, 0.5647059, 0, 1, 1,
0.7007072, 0.4902655, 1.217034, 0.572549, 0, 1, 1,
0.7036651, 0.4412439, -0.2574551, 0.5764706, 0, 1, 1,
0.7051888, -0.6031098, 1.223414, 0.5843138, 0, 1, 1,
0.7073631, -2.35459, 1.969015, 0.5882353, 0, 1, 1,
0.7089907, 0.1745544, 1.727485, 0.5960785, 0, 1, 1,
0.7142912, 1.912725, 1.781977, 0.6039216, 0, 1, 1,
0.71492, 0.1530775, -0.09133513, 0.6078432, 0, 1, 1,
0.7155741, -1.02793, 2.936097, 0.6156863, 0, 1, 1,
0.7159575, -0.3274835, 2.195947, 0.6196079, 0, 1, 1,
0.7193217, 0.1375215, 2.709498, 0.627451, 0, 1, 1,
0.7196986, 0.7807779, 1.277016, 0.6313726, 0, 1, 1,
0.7223516, 0.6378486, 0.7571875, 0.6392157, 0, 1, 1,
0.7267535, -0.2330463, 2.161729, 0.6431373, 0, 1, 1,
0.727057, 0.6398208, -0.275159, 0.6509804, 0, 1, 1,
0.727502, -1.11972, 3.615571, 0.654902, 0, 1, 1,
0.7340351, -0.2388831, 1.967244, 0.6627451, 0, 1, 1,
0.7375706, -0.09346115, 1.556548, 0.6666667, 0, 1, 1,
0.7386061, -1.432533, 3.317265, 0.6745098, 0, 1, 1,
0.739724, 0.3961014, 1.906221, 0.6784314, 0, 1, 1,
0.7401794, -1.711113, 2.996656, 0.6862745, 0, 1, 1,
0.7404693, 1.48749, 0.9183241, 0.6901961, 0, 1, 1,
0.7416317, 0.6282414, 1.045796, 0.6980392, 0, 1, 1,
0.7443867, -2.276798, 3.838816, 0.7058824, 0, 1, 1,
0.7506545, 1.648606, -0.5670565, 0.7098039, 0, 1, 1,
0.757809, 0.5169395, 0.3778616, 0.7176471, 0, 1, 1,
0.757913, 0.335213, 1.730784, 0.7215686, 0, 1, 1,
0.7642024, -0.6535233, 2.126792, 0.7294118, 0, 1, 1,
0.7656562, 0.08563708, 1.22901, 0.7333333, 0, 1, 1,
0.7663009, 0.2551901, 0.1437222, 0.7411765, 0, 1, 1,
0.7699525, -0.3475434, 1.557296, 0.7450981, 0, 1, 1,
0.7798322, 0.09680393, 1.724343, 0.7529412, 0, 1, 1,
0.7836517, -1.490898, 4.108641, 0.7568628, 0, 1, 1,
0.8004168, -2.011973, 2.918494, 0.7647059, 0, 1, 1,
0.8010735, -2.48498, 2.052377, 0.7686275, 0, 1, 1,
0.8093519, -1.174773, 1.662961, 0.7764706, 0, 1, 1,
0.812656, 2.801335, 0.5835867, 0.7803922, 0, 1, 1,
0.8129328, -1.325035, 2.482802, 0.7882353, 0, 1, 1,
0.8165202, 0.5849124, 1.067939, 0.7921569, 0, 1, 1,
0.8220516, 0.7407366, 1.09939, 0.8, 0, 1, 1,
0.8248068, 0.9706401, 1.399047, 0.8078431, 0, 1, 1,
0.8255346, -0.08842166, 2.852151, 0.8117647, 0, 1, 1,
0.8298602, -0.7364496, 2.205448, 0.8196079, 0, 1, 1,
0.8303772, -0.4499024, 1.341369, 0.8235294, 0, 1, 1,
0.8395281, 0.013633, 0.01593131, 0.8313726, 0, 1, 1,
0.8439696, -0.3352625, 0.9671428, 0.8352941, 0, 1, 1,
0.8465784, 0.3510456, 2.908322, 0.8431373, 0, 1, 1,
0.8468144, -0.2650783, 2.81708, 0.8470588, 0, 1, 1,
0.8495466, -1.555219, 1.485605, 0.854902, 0, 1, 1,
0.8501281, -0.1630338, 1.167005, 0.8588235, 0, 1, 1,
0.8513498, 1.539129, 0.4679962, 0.8666667, 0, 1, 1,
0.8602917, 1.185791, 1.495268, 0.8705882, 0, 1, 1,
0.8618469, -0.5448973, 0.1109848, 0.8784314, 0, 1, 1,
0.8690975, -0.4780104, 2.902067, 0.8823529, 0, 1, 1,
0.8795519, 1.042001, -0.07774977, 0.8901961, 0, 1, 1,
0.8809514, 1.303984, 2.109796, 0.8941177, 0, 1, 1,
0.8845068, 0.06939963, 2.395918, 0.9019608, 0, 1, 1,
0.8862154, 0.4742795, 1.760148, 0.9098039, 0, 1, 1,
0.8863958, 0.3019597, 1.443846, 0.9137255, 0, 1, 1,
0.8890933, -1.535659, 2.590713, 0.9215686, 0, 1, 1,
0.8941474, -1.435434, 1.378837, 0.9254902, 0, 1, 1,
0.8942836, 1.267399, 0.7430581, 0.9333333, 0, 1, 1,
0.8961695, 0.239819, 2.072034, 0.9372549, 0, 1, 1,
0.9024739, -0.009062512, 1.337817, 0.945098, 0, 1, 1,
0.9114639, -1.518188, 2.661119, 0.9490196, 0, 1, 1,
0.9125625, 0.5025235, 0.1990817, 0.9568627, 0, 1, 1,
0.9136059, -0.463933, 1.720989, 0.9607843, 0, 1, 1,
0.9152549, 1.650721, 0.717243, 0.9686275, 0, 1, 1,
0.9216422, -2.03585, 3.833014, 0.972549, 0, 1, 1,
0.9253162, 1.014417, 0.03521445, 0.9803922, 0, 1, 1,
0.9256152, -1.325229, 2.400682, 0.9843137, 0, 1, 1,
0.9375086, -0.2188801, 2.838881, 0.9921569, 0, 1, 1,
0.9394352, -1.689206, 1.319725, 0.9960784, 0, 1, 1,
0.9397845, 2.034456, -0.7118818, 1, 0, 0.9960784, 1,
0.9421751, -0.2899577, 2.688183, 1, 0, 0.9882353, 1,
0.9434716, 0.6752941, 0.1054317, 1, 0, 0.9843137, 1,
0.9484133, 0.9168842, 0.1884197, 1, 0, 0.9764706, 1,
0.9511642, -0.06479686, 1.129354, 1, 0, 0.972549, 1,
0.9512832, -1.70274, 3.240883, 1, 0, 0.9647059, 1,
0.9546447, 1.113367, -1.519998, 1, 0, 0.9607843, 1,
0.9626175, -0.6506438, 4.594757, 1, 0, 0.9529412, 1,
0.9667364, -0.05642189, 1.453752, 1, 0, 0.9490196, 1,
0.97177, -0.4284418, 1.445441, 1, 0, 0.9411765, 1,
0.971972, 1.871087, 0.3771379, 1, 0, 0.9372549, 1,
0.9724489, -0.6523649, 1.536214, 1, 0, 0.9294118, 1,
0.9765771, 2.14971, -0.07319784, 1, 0, 0.9254902, 1,
0.9790268, 0.1892208, 1.722742, 1, 0, 0.9176471, 1,
0.981688, 0.9544874, 1.151289, 1, 0, 0.9137255, 1,
0.982625, 0.5371497, -0.2486328, 1, 0, 0.9058824, 1,
0.9846851, -1.155945, 3.634657, 1, 0, 0.9019608, 1,
0.9917914, -0.3702733, 1.279221, 1, 0, 0.8941177, 1,
0.9978904, -0.647629, 1.85283, 1, 0, 0.8862745, 1,
0.9985052, -1.643074, 1.55073, 1, 0, 0.8823529, 1,
1.004785, -0.3856764, 1.26746, 1, 0, 0.8745098, 1,
1.008976, 0.7790294, 0.4884982, 1, 0, 0.8705882, 1,
1.013857, 1.498974, 0.192138, 1, 0, 0.8627451, 1,
1.014757, 1.256498, 1.080583, 1, 0, 0.8588235, 1,
1.015569, 1.722662, 0.7627966, 1, 0, 0.8509804, 1,
1.021819, -0.413083, 0.1531705, 1, 0, 0.8470588, 1,
1.029772, -0.340407, 1.293221, 1, 0, 0.8392157, 1,
1.032749, 0.8014511, 1.700927, 1, 0, 0.8352941, 1,
1.036853, -0.6838745, 0.7235863, 1, 0, 0.827451, 1,
1.041442, -1.917478, 1.762054, 1, 0, 0.8235294, 1,
1.046357, 0.6484944, 0.383249, 1, 0, 0.8156863, 1,
1.051002, -0.3109914, 1.905084, 1, 0, 0.8117647, 1,
1.059623, -0.5052973, 2.213969, 1, 0, 0.8039216, 1,
1.061813, 1.250156, 1.627035, 1, 0, 0.7960784, 1,
1.064979, 0.2956392, 1.60224, 1, 0, 0.7921569, 1,
1.064986, 1.37435, 0.7203229, 1, 0, 0.7843137, 1,
1.073742, 0.7232633, 0.1121565, 1, 0, 0.7803922, 1,
1.081259, -0.1263399, 0.2449067, 1, 0, 0.772549, 1,
1.083871, 0.3863887, 3.184918, 1, 0, 0.7686275, 1,
1.085404, 1.129991, 1.130409, 1, 0, 0.7607843, 1,
1.088351, -0.8014941, 2.402768, 1, 0, 0.7568628, 1,
1.099735, 1.845721, 2.450351, 1, 0, 0.7490196, 1,
1.104256, 0.956463, 0.04968057, 1, 0, 0.7450981, 1,
1.106607, -0.5075177, 0.6502483, 1, 0, 0.7372549, 1,
1.128075, 0.408518, 2.644757, 1, 0, 0.7333333, 1,
1.13215, 0.3153592, 2.46865, 1, 0, 0.7254902, 1,
1.14435, -1.618361, 2.554438, 1, 0, 0.7215686, 1,
1.149164, -0.9877824, 1.425756, 1, 0, 0.7137255, 1,
1.152763, 0.8976558, 2.090999, 1, 0, 0.7098039, 1,
1.153578, -0.05057555, -0.316242, 1, 0, 0.7019608, 1,
1.160001, -0.5026121, 1.206876, 1, 0, 0.6941177, 1,
1.160919, -0.9043931, 2.960099, 1, 0, 0.6901961, 1,
1.163308, -0.4855443, 2.268616, 1, 0, 0.682353, 1,
1.169179, 1.672717, 0.4059765, 1, 0, 0.6784314, 1,
1.169572, -0.9380429, 3.437296, 1, 0, 0.6705883, 1,
1.170406, 1.768778, -1.075694, 1, 0, 0.6666667, 1,
1.189359, -0.8214722, 0.1238875, 1, 0, 0.6588235, 1,
1.194021, 0.1204266, 2.005535, 1, 0, 0.654902, 1,
1.198456, -0.4836426, 1.365191, 1, 0, 0.6470588, 1,
1.212425, -0.05313726, 2.272347, 1, 0, 0.6431373, 1,
1.221585, 0.9534163, 0.2864692, 1, 0, 0.6352941, 1,
1.225011, 2.319384, -0.7065524, 1, 0, 0.6313726, 1,
1.236652, -0.1582021, 1.607288, 1, 0, 0.6235294, 1,
1.2444, -1.543867, 2.793264, 1, 0, 0.6196079, 1,
1.24549, 1.242187, -1.433981, 1, 0, 0.6117647, 1,
1.250493, 1.957476, 2.673896, 1, 0, 0.6078432, 1,
1.251478, -2.088044, 2.061929, 1, 0, 0.6, 1,
1.251833, -0.3524167, 1.773565, 1, 0, 0.5921569, 1,
1.253164, -1.092438, 2.331544, 1, 0, 0.5882353, 1,
1.255265, -1.739994, 2.661935, 1, 0, 0.5803922, 1,
1.258682, 0.7324947, -1.032667, 1, 0, 0.5764706, 1,
1.277758, -1.073745, 4.039927, 1, 0, 0.5686275, 1,
1.277891, -1.169016, 0.8770281, 1, 0, 0.5647059, 1,
1.28308, 0.4844154, -0.3189997, 1, 0, 0.5568628, 1,
1.296226, 0.9123816, -0.9766241, 1, 0, 0.5529412, 1,
1.30262, -0.8099124, 3.540321, 1, 0, 0.5450981, 1,
1.312535, 0.2242645, 0.4156068, 1, 0, 0.5411765, 1,
1.312889, -1.364874, 3.403909, 1, 0, 0.5333334, 1,
1.317143, -1.537667, 2.854733, 1, 0, 0.5294118, 1,
1.323345, -0.6796483, 2.063199, 1, 0, 0.5215687, 1,
1.329499, 0.6595103, -0.1271994, 1, 0, 0.5176471, 1,
1.33741, -0.02532586, 1.725087, 1, 0, 0.509804, 1,
1.338785, 0.3713298, 2.646673, 1, 0, 0.5058824, 1,
1.339943, 0.6081446, 0.5929816, 1, 0, 0.4980392, 1,
1.34155, -0.5106682, 2.123776, 1, 0, 0.4901961, 1,
1.367885, -0.4900846, 2.088247, 1, 0, 0.4862745, 1,
1.36983, -0.4964786, 0.6618569, 1, 0, 0.4784314, 1,
1.372595, -0.7522511, 2.241072, 1, 0, 0.4745098, 1,
1.375947, -0.3425789, 1.362692, 1, 0, 0.4666667, 1,
1.376701, 0.03825828, 2.165277, 1, 0, 0.4627451, 1,
1.37742, 0.1377963, 1.611514, 1, 0, 0.454902, 1,
1.378295, 0.349537, 0.4356076, 1, 0, 0.4509804, 1,
1.378819, -0.7267102, 2.606915, 1, 0, 0.4431373, 1,
1.379046, -0.213731, 1.12761, 1, 0, 0.4392157, 1,
1.391684, 1.403938, 0.7135835, 1, 0, 0.4313726, 1,
1.400939, 1.264915, 1.340097, 1, 0, 0.427451, 1,
1.402297, -1.772288, -1.003305, 1, 0, 0.4196078, 1,
1.421517, -0.3624678, 4.780853, 1, 0, 0.4156863, 1,
1.421603, -1.886558, 2.388164, 1, 0, 0.4078431, 1,
1.423004, -1.442934, 3.430643, 1, 0, 0.4039216, 1,
1.425618, -0.2666532, 1.088592, 1, 0, 0.3960784, 1,
1.44125, 0.3493377, 2.697312, 1, 0, 0.3882353, 1,
1.447246, 0.5009453, -0.1555441, 1, 0, 0.3843137, 1,
1.497675, -0.8236631, 2.750948, 1, 0, 0.3764706, 1,
1.516368, 1.497607, 0.7616915, 1, 0, 0.372549, 1,
1.521908, 0.5605469, 0.9610875, 1, 0, 0.3647059, 1,
1.527957, -0.01371977, 1.758125, 1, 0, 0.3607843, 1,
1.534603, -1.320142, 3.134959, 1, 0, 0.3529412, 1,
1.539137, 0.2155945, -0.2327509, 1, 0, 0.3490196, 1,
1.539434, -0.3219474, 2.302414, 1, 0, 0.3411765, 1,
1.562013, -2.083274, 2.719169, 1, 0, 0.3372549, 1,
1.571449, 0.4842433, 0.4615091, 1, 0, 0.3294118, 1,
1.578341, 0.8115067, 2.00513, 1, 0, 0.3254902, 1,
1.581823, -0.7203652, 2.02073, 1, 0, 0.3176471, 1,
1.593721, -0.3880527, 1.649875, 1, 0, 0.3137255, 1,
1.618734, 0.8357637, 0.2667066, 1, 0, 0.3058824, 1,
1.630303, 1.712324, 2.850326, 1, 0, 0.2980392, 1,
1.633384, -1.571995, 2.452343, 1, 0, 0.2941177, 1,
1.634717, 0.5913941, 0.8798972, 1, 0, 0.2862745, 1,
1.639683, 1.18547, 1.113995, 1, 0, 0.282353, 1,
1.645948, 0.5288247, 0.7786042, 1, 0, 0.2745098, 1,
1.653538, 0.5477307, 2.119479, 1, 0, 0.2705882, 1,
1.673783, -0.06349402, 0.7885772, 1, 0, 0.2627451, 1,
1.679155, -0.1906275, 2.992319, 1, 0, 0.2588235, 1,
1.688093, -1.624172, 2.960713, 1, 0, 0.2509804, 1,
1.692742, 0.5648754, 2.696669, 1, 0, 0.2470588, 1,
1.696856, -0.505227, 3.623482, 1, 0, 0.2392157, 1,
1.713834, 0.153273, 0.7807549, 1, 0, 0.2352941, 1,
1.72413, 0.802742, 1.529461, 1, 0, 0.227451, 1,
1.727172, -0.8250986, 3.587402, 1, 0, 0.2235294, 1,
1.747384, -0.4775915, 2.50827, 1, 0, 0.2156863, 1,
1.748149, 0.02556065, 0.9917932, 1, 0, 0.2117647, 1,
1.765827, -0.8343923, 2.318261, 1, 0, 0.2039216, 1,
1.779482, 0.08890558, 1.082689, 1, 0, 0.1960784, 1,
1.781471, -0.2645241, 1.686374, 1, 0, 0.1921569, 1,
1.787138, -0.8546421, 0.1382245, 1, 0, 0.1843137, 1,
1.824774, 0.06186471, 3.179383, 1, 0, 0.1803922, 1,
1.864366, -0.471101, 1.639888, 1, 0, 0.172549, 1,
1.867303, -0.1015392, 0.3168756, 1, 0, 0.1686275, 1,
1.872969, -1.927962, 3.148085, 1, 0, 0.1607843, 1,
1.879385, 0.4947157, 2.328438, 1, 0, 0.1568628, 1,
1.890095, -1.287563, 1.899995, 1, 0, 0.1490196, 1,
1.896553, 0.7422221, 2.421344, 1, 0, 0.145098, 1,
1.905411, -0.955708, 2.305345, 1, 0, 0.1372549, 1,
1.944122, 0.2829054, 0.06402264, 1, 0, 0.1333333, 1,
1.948152, 0.01472248, 1.039779, 1, 0, 0.1254902, 1,
1.965549, -0.2110584, 1.130753, 1, 0, 0.1215686, 1,
1.970228, -0.4973116, 1.902957, 1, 0, 0.1137255, 1,
1.978196, -1.189537, 1.225492, 1, 0, 0.1098039, 1,
2.002406, -0.44307, 1.065331, 1, 0, 0.1019608, 1,
2.010635, -1.655735, 1.540383, 1, 0, 0.09411765, 1,
2.014419, 1.179288, 1.387823, 1, 0, 0.09019608, 1,
2.017484, -0.4956364, 1.048974, 1, 0, 0.08235294, 1,
2.067672, 0.01168909, 1.507512, 1, 0, 0.07843138, 1,
2.13299, 1.457161, 0.9813032, 1, 0, 0.07058824, 1,
2.168669, 0.2000958, 3.264921, 1, 0, 0.06666667, 1,
2.210773, 1.064554, 0.06442077, 1, 0, 0.05882353, 1,
2.220659, -1.202432, 2.162494, 1, 0, 0.05490196, 1,
2.263074, -0.8773911, 2.331759, 1, 0, 0.04705882, 1,
2.473277, -0.2797057, 0.2148726, 1, 0, 0.04313726, 1,
2.478483, 0.4007386, 0.07916227, 1, 0, 0.03529412, 1,
2.489434, -0.6854438, 1.309311, 1, 0, 0.03137255, 1,
2.58358, 0.9529486, -0.2911109, 1, 0, 0.02352941, 1,
2.665728, 0.6724119, 0.1562784, 1, 0, 0.01960784, 1,
2.911574, 1.119409, 1.180533, 1, 0, 0.01176471, 1,
3.25177, -0.1166157, -0.1224629, 1, 0, 0.007843138, 1
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
0.2298199, -4.406311, -6.806431, 0, -0.5, 0.5, 0.5,
0.2298199, -4.406311, -6.806431, 1, -0.5, 0.5, 0.5,
0.2298199, -4.406311, -6.806431, 1, 1.5, 0.5, 0.5,
0.2298199, -4.406311, -6.806431, 0, 1.5, 0.5, 0.5
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
-3.816572, -0.2059243, -6.806431, 0, -0.5, 0.5, 0.5,
-3.816572, -0.2059243, -6.806431, 1, -0.5, 0.5, 0.5,
-3.816572, -0.2059243, -6.806431, 1, 1.5, 0.5, 0.5,
-3.816572, -0.2059243, -6.806431, 0, 1.5, 0.5, 0.5
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
-3.816572, -4.406311, -0.01549292, 0, -0.5, 0.5, 0.5,
-3.816572, -4.406311, -0.01549292, 1, -0.5, 0.5, 0.5,
-3.816572, -4.406311, -0.01549292, 1, 1.5, 0.5, 0.5,
-3.816572, -4.406311, -0.01549292, 0, 1.5, 0.5, 0.5
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
-2, -3.436991, -5.239292,
3, -3.436991, -5.239292,
-2, -3.436991, -5.239292,
-2, -3.598544, -5.500482,
-1, -3.436991, -5.239292,
-1, -3.598544, -5.500482,
0, -3.436991, -5.239292,
0, -3.598544, -5.500482,
1, -3.436991, -5.239292,
1, -3.598544, -5.500482,
2, -3.436991, -5.239292,
2, -3.598544, -5.500482,
3, -3.436991, -5.239292,
3, -3.598544, -5.500482
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
-2, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
-2, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
-2, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
-2, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5,
-1, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
-1, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
-1, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
-1, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5,
0, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
0, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
0, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
0, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5,
1, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
1, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
1, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
1, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5,
2, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
2, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
2, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
2, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5,
3, -3.921651, -6.022861, 0, -0.5, 0.5, 0.5,
3, -3.921651, -6.022861, 1, -0.5, 0.5, 0.5,
3, -3.921651, -6.022861, 1, 1.5, 0.5, 0.5,
3, -3.921651, -6.022861, 0, 1.5, 0.5, 0.5
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
-2.882789, -3, -5.239292,
-2.882789, 2, -5.239292,
-2.882789, -3, -5.239292,
-3.03842, -3, -5.500482,
-2.882789, -2, -5.239292,
-3.03842, -2, -5.500482,
-2.882789, -1, -5.239292,
-3.03842, -1, -5.500482,
-2.882789, 0, -5.239292,
-3.03842, 0, -5.500482,
-2.882789, 1, -5.239292,
-3.03842, 1, -5.500482,
-2.882789, 2, -5.239292,
-3.03842, 2, -5.500482
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
-3.349681, -3, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, -3, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, -3, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, -3, -6.022861, 0, 1.5, 0.5, 0.5,
-3.349681, -2, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, -2, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, -2, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, -2, -6.022861, 0, 1.5, 0.5, 0.5,
-3.349681, -1, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, -1, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, -1, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, -1, -6.022861, 0, 1.5, 0.5, 0.5,
-3.349681, 0, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, 0, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, 0, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, 0, -6.022861, 0, 1.5, 0.5, 0.5,
-3.349681, 1, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, 1, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, 1, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, 1, -6.022861, 0, 1.5, 0.5, 0.5,
-3.349681, 2, -6.022861, 0, -0.5, 0.5, 0.5,
-3.349681, 2, -6.022861, 1, -0.5, 0.5, 0.5,
-3.349681, 2, -6.022861, 1, 1.5, 0.5, 0.5,
-3.349681, 2, -6.022861, 0, 1.5, 0.5, 0.5
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
-2.882789, -3.436991, -4,
-2.882789, -3.436991, 4,
-2.882789, -3.436991, -4,
-3.03842, -3.598544, -4,
-2.882789, -3.436991, -2,
-3.03842, -3.598544, -2,
-2.882789, -3.436991, 0,
-3.03842, -3.598544, 0,
-2.882789, -3.436991, 2,
-3.03842, -3.598544, 2,
-2.882789, -3.436991, 4,
-3.03842, -3.598544, 4
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
-3.349681, -3.921651, -4, 0, -0.5, 0.5, 0.5,
-3.349681, -3.921651, -4, 1, -0.5, 0.5, 0.5,
-3.349681, -3.921651, -4, 1, 1.5, 0.5, 0.5,
-3.349681, -3.921651, -4, 0, 1.5, 0.5, 0.5,
-3.349681, -3.921651, -2, 0, -0.5, 0.5, 0.5,
-3.349681, -3.921651, -2, 1, -0.5, 0.5, 0.5,
-3.349681, -3.921651, -2, 1, 1.5, 0.5, 0.5,
-3.349681, -3.921651, -2, 0, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 0, 0, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 0, 1, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 0, 1, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 0, 0, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 2, 0, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 2, 1, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 2, 1, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 2, 0, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 4, 0, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 4, 1, -0.5, 0.5, 0.5,
-3.349681, -3.921651, 4, 1, 1.5, 0.5, 0.5,
-3.349681, -3.921651, 4, 0, 1.5, 0.5, 0.5
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
-2.882789, -3.436991, -5.239292,
-2.882789, 3.025142, -5.239292,
-2.882789, -3.436991, 5.208306,
-2.882789, 3.025142, 5.208306,
-2.882789, -3.436991, -5.239292,
-2.882789, -3.436991, 5.208306,
-2.882789, 3.025142, -5.239292,
-2.882789, 3.025142, 5.208306,
-2.882789, -3.436991, -5.239292,
3.342429, -3.436991, -5.239292,
-2.882789, -3.436991, 5.208306,
3.342429, -3.436991, 5.208306,
-2.882789, 3.025142, -5.239292,
3.342429, 3.025142, -5.239292,
-2.882789, 3.025142, 5.208306,
3.342429, 3.025142, 5.208306,
3.342429, -3.436991, -5.239292,
3.342429, 3.025142, -5.239292,
3.342429, -3.436991, 5.208306,
3.342429, 3.025142, 5.208306,
3.342429, -3.436991, -5.239292,
3.342429, -3.436991, 5.208306,
3.342429, 3.025142, -5.239292,
3.342429, 3.025142, 5.208306
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
var radius = 7.353919;
var distance = 32.71841;
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
mvMatrix.translate( -0.2298199, 0.2059243, 0.01549292 );
mvMatrix.scale( 1.277257, 1.23043, 0.7610555 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.71841);
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


