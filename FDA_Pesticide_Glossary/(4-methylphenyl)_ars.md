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
-3.468837, -1.516806, -2.924722, 1, 0, 0, 1,
-3.295721, 0.08001406, -1.595866, 1, 0.007843138, 0, 1,
-2.872391, -0.5422561, -1.400123, 1, 0.01176471, 0, 1,
-2.780744, -1.178858, -2.335357, 1, 0.01960784, 0, 1,
-2.541916, 0.3627501, -1.850975, 1, 0.02352941, 0, 1,
-2.540959, 1.128335, -1.404822, 1, 0.03137255, 0, 1,
-2.518449, 1.030594, -2.319111, 1, 0.03529412, 0, 1,
-2.480902, 0.5222474, -1.145473, 1, 0.04313726, 0, 1,
-2.437622, -0.4502749, -1.473231, 1, 0.04705882, 0, 1,
-2.417189, 0.02454434, -2.224195, 1, 0.05490196, 0, 1,
-2.395607, 1.071726, 0.7856235, 1, 0.05882353, 0, 1,
-2.353634, 2.073643, 0.3683664, 1, 0.06666667, 0, 1,
-2.340004, -0.7457717, -1.392424, 1, 0.07058824, 0, 1,
-2.318249, 0.2239011, -0.8107184, 1, 0.07843138, 0, 1,
-2.263988, 0.8775513, -0.4854063, 1, 0.08235294, 0, 1,
-2.234211, 0.3449213, -1.270187, 1, 0.09019608, 0, 1,
-2.20148, 1.542594, 0.06312341, 1, 0.09411765, 0, 1,
-2.157316, 0.3106808, -1.837199, 1, 0.1019608, 0, 1,
-2.131048, 0.001617725, -1.736936, 1, 0.1098039, 0, 1,
-2.128265, 0.165584, -0.5713558, 1, 0.1137255, 0, 1,
-2.109435, 0.8468243, -1.196753, 1, 0.1215686, 0, 1,
-2.074555, 2.024077, -1.020238, 1, 0.1254902, 0, 1,
-2.073173, -0.9264108, -2.520702, 1, 0.1333333, 0, 1,
-2.052215, -0.3982838, -1.857866, 1, 0.1372549, 0, 1,
-2.045952, 0.9495276, -2.719047, 1, 0.145098, 0, 1,
-2.040009, 0.9027673, -3.135101, 1, 0.1490196, 0, 1,
-2.017095, 0.1539066, -1.659602, 1, 0.1568628, 0, 1,
-2.00606, -0.9251067, 0.02018549, 1, 0.1607843, 0, 1,
-2.003402, -0.9985936, -1.454603, 1, 0.1686275, 0, 1,
-1.994207, -0.1179526, -0.7427682, 1, 0.172549, 0, 1,
-1.977206, 0.436947, -0.9068186, 1, 0.1803922, 0, 1,
-1.965989, -0.6328224, -2.335121, 1, 0.1843137, 0, 1,
-1.956824, 0.6595441, -0.004393998, 1, 0.1921569, 0, 1,
-1.936207, -0.5128713, -1.870347, 1, 0.1960784, 0, 1,
-1.875895, 0.529171, -1.357782, 1, 0.2039216, 0, 1,
-1.87214, -0.8810128, -3.285831, 1, 0.2117647, 0, 1,
-1.850097, -0.6935768, -0.0860705, 1, 0.2156863, 0, 1,
-1.839483, -0.7948122, -2.680262, 1, 0.2235294, 0, 1,
-1.833338, 0.2933659, -1.311381, 1, 0.227451, 0, 1,
-1.812177, -0.6595542, -1.483364, 1, 0.2352941, 0, 1,
-1.798591, -0.06720398, -2.462418, 1, 0.2392157, 0, 1,
-1.768822, 0.752772, -1.979041, 1, 0.2470588, 0, 1,
-1.767483, -0.5331067, -2.484333, 1, 0.2509804, 0, 1,
-1.756335, 1.204719, -1.536339, 1, 0.2588235, 0, 1,
-1.742458, -1.454337, -4.544689, 1, 0.2627451, 0, 1,
-1.719038, 0.2509469, -3.308481, 1, 0.2705882, 0, 1,
-1.713495, -2.370111, -1.397393, 1, 0.2745098, 0, 1,
-1.703208, -1.117629, -1.615659, 1, 0.282353, 0, 1,
-1.690384, -0.558364, -0.2354654, 1, 0.2862745, 0, 1,
-1.673264, 0.6049169, -1.573751, 1, 0.2941177, 0, 1,
-1.639573, -0.9276336, -2.60994, 1, 0.3019608, 0, 1,
-1.633921, 0.120568, -2.877485, 1, 0.3058824, 0, 1,
-1.621424, 0.03090658, -2.005947, 1, 0.3137255, 0, 1,
-1.620697, -0.6869623, -0.8903861, 1, 0.3176471, 0, 1,
-1.611289, 1.769452, -3.036861, 1, 0.3254902, 0, 1,
-1.606203, 0.1255657, -1.73598, 1, 0.3294118, 0, 1,
-1.598902, 0.3367361, -2.01599, 1, 0.3372549, 0, 1,
-1.591025, 1.208823, -1.065677, 1, 0.3411765, 0, 1,
-1.588458, -1.468255, -2.480282, 1, 0.3490196, 0, 1,
-1.584788, -0.3000098, -4.006389, 1, 0.3529412, 0, 1,
-1.581129, 0.6288807, -0.3796604, 1, 0.3607843, 0, 1,
-1.564712, -0.04409743, -2.900144, 1, 0.3647059, 0, 1,
-1.558386, -1.387024, -2.757651, 1, 0.372549, 0, 1,
-1.556529, -0.3066659, -2.773134, 1, 0.3764706, 0, 1,
-1.538796, -1.67612, -1.727024, 1, 0.3843137, 0, 1,
-1.514089, -1.056245, -2.417712, 1, 0.3882353, 0, 1,
-1.503799, -0.8920057, -2.03984, 1, 0.3960784, 0, 1,
-1.50048, -0.6504006, -0.08152577, 1, 0.4039216, 0, 1,
-1.496789, 0.7342479, 0.2348727, 1, 0.4078431, 0, 1,
-1.496199, -1.508376, -3.552092, 1, 0.4156863, 0, 1,
-1.493095, -0.5199783, -2.900212, 1, 0.4196078, 0, 1,
-1.48152, 2.394506, -2.952398, 1, 0.427451, 0, 1,
-1.47159, -1.813853, -1.313991, 1, 0.4313726, 0, 1,
-1.461838, 1.778347, -1.014683, 1, 0.4392157, 0, 1,
-1.461337, 2.316805, 0.3985567, 1, 0.4431373, 0, 1,
-1.460469, 0.6360548, -1.650719, 1, 0.4509804, 0, 1,
-1.455979, -1.126755, -1.417751, 1, 0.454902, 0, 1,
-1.429327, 0.168711, -2.75818, 1, 0.4627451, 0, 1,
-1.429075, -0.7662477, -0.4943212, 1, 0.4666667, 0, 1,
-1.428355, 0.8991638, -2.764469, 1, 0.4745098, 0, 1,
-1.428252, 0.5984899, -0.9299864, 1, 0.4784314, 0, 1,
-1.42331, -1.087053, -0.5889148, 1, 0.4862745, 0, 1,
-1.416746, 2.138392, -1.577025, 1, 0.4901961, 0, 1,
-1.412716, -0.804956, -0.3230441, 1, 0.4980392, 0, 1,
-1.394008, -0.07111228, -2.583616, 1, 0.5058824, 0, 1,
-1.393737, 0.2166085, -1.661065, 1, 0.509804, 0, 1,
-1.387537, -0.9946619, -0.7933234, 1, 0.5176471, 0, 1,
-1.367734, -0.3172708, -2.504358, 1, 0.5215687, 0, 1,
-1.359144, 0.3301411, -1.285229, 1, 0.5294118, 0, 1,
-1.352586, 0.09619019, -1.688961, 1, 0.5333334, 0, 1,
-1.350311, 0.4813482, -0.9658079, 1, 0.5411765, 0, 1,
-1.344965, -0.3182049, -2.033425, 1, 0.5450981, 0, 1,
-1.344395, -0.3355659, -2.359343, 1, 0.5529412, 0, 1,
-1.34025, -1.840572, -1.798419, 1, 0.5568628, 0, 1,
-1.337276, 1.021641, -1.042792, 1, 0.5647059, 0, 1,
-1.311039, 0.2163597, -0.6589979, 1, 0.5686275, 0, 1,
-1.309993, 0.5691763, -1.327935, 1, 0.5764706, 0, 1,
-1.306896, 0.5479468, -1.369329, 1, 0.5803922, 0, 1,
-1.291188, -0.08697744, -1.434909, 1, 0.5882353, 0, 1,
-1.287566, -0.1576536, -1.432035, 1, 0.5921569, 0, 1,
-1.284431, -0.2530414, -1.358518, 1, 0.6, 0, 1,
-1.283491, -0.01258837, -3.702986, 1, 0.6078432, 0, 1,
-1.256702, 0.05678778, -2.097397, 1, 0.6117647, 0, 1,
-1.256028, 0.06952861, -2.215657, 1, 0.6196079, 0, 1,
-1.25524, -0.1259937, -2.156165, 1, 0.6235294, 0, 1,
-1.252913, 0.6780725, -1.450011, 1, 0.6313726, 0, 1,
-1.250089, 1.326189, -1.308043, 1, 0.6352941, 0, 1,
-1.249685, 0.04136373, -1.132944, 1, 0.6431373, 0, 1,
-1.249526, -0.9388263, -1.854727, 1, 0.6470588, 0, 1,
-1.248489, -1.926337, -1.620616, 1, 0.654902, 0, 1,
-1.234789, -0.05438423, -0.8224726, 1, 0.6588235, 0, 1,
-1.221335, 0.2481592, -2.26682, 1, 0.6666667, 0, 1,
-1.21363, -0.6196247, -2.688457, 1, 0.6705883, 0, 1,
-1.212868, -1.668819, -2.81075, 1, 0.6784314, 0, 1,
-1.191185, 0.3636516, -2.45537, 1, 0.682353, 0, 1,
-1.181273, -1.378721, -3.187284, 1, 0.6901961, 0, 1,
-1.151682, 0.1906845, -0.2406745, 1, 0.6941177, 0, 1,
-1.147363, 1.647811, -0.5159979, 1, 0.7019608, 0, 1,
-1.141942, 0.2789539, -0.5767024, 1, 0.7098039, 0, 1,
-1.127392, 0.8204471, -0.5277187, 1, 0.7137255, 0, 1,
-1.116863, -0.070307, -2.379277, 1, 0.7215686, 0, 1,
-1.111676, -0.8655702, -3.380438, 1, 0.7254902, 0, 1,
-1.108714, 0.7500277, -2.097092, 1, 0.7333333, 0, 1,
-1.108367, -0.8208923, -2.057682, 1, 0.7372549, 0, 1,
-1.108101, -1.593713, -4.331877, 1, 0.7450981, 0, 1,
-1.103366, -1.244273, -2.396349, 1, 0.7490196, 0, 1,
-1.101784, 0.1409668, 0.1975125, 1, 0.7568628, 0, 1,
-1.10111, -1.918181, -3.485502, 1, 0.7607843, 0, 1,
-1.099464, 0.3957033, -1.029794, 1, 0.7686275, 0, 1,
-1.099449, -0.2371051, -0.8133814, 1, 0.772549, 0, 1,
-1.099126, -0.2085144, -0.4383578, 1, 0.7803922, 0, 1,
-1.095575, -1.434532, -2.033847, 1, 0.7843137, 0, 1,
-1.089399, 1.682406, 0.3873097, 1, 0.7921569, 0, 1,
-1.087281, -0.5445909, -2.794679, 1, 0.7960784, 0, 1,
-1.084664, -1.112988, -2.242398, 1, 0.8039216, 0, 1,
-1.083912, -0.2045112, -2.898881, 1, 0.8117647, 0, 1,
-1.078188, 0.1065042, -2.078089, 1, 0.8156863, 0, 1,
-1.077988, -0.554849, -1.832213, 1, 0.8235294, 0, 1,
-1.077856, 0.1445887, -0.5944023, 1, 0.827451, 0, 1,
-1.07643, 0.4227264, -3.005606, 1, 0.8352941, 0, 1,
-1.071813, -2.554076, -1.858076, 1, 0.8392157, 0, 1,
-1.057978, 0.4498881, -1.709777, 1, 0.8470588, 0, 1,
-1.054495, 0.6674038, -0.7163872, 1, 0.8509804, 0, 1,
-1.046633, -1.795997, -1.850499, 1, 0.8588235, 0, 1,
-1.027697, 1.187245, -0.7256646, 1, 0.8627451, 0, 1,
-1.020193, 0.1833813, -1.838735, 1, 0.8705882, 0, 1,
-1.017743, -0.1916094, -1.704347, 1, 0.8745098, 0, 1,
-1.016586, -0.9848477, -0.779722, 1, 0.8823529, 0, 1,
-1.016185, -0.6773816, -0.3688575, 1, 0.8862745, 0, 1,
-1.007071, 1.160617, -1.267727, 1, 0.8941177, 0, 1,
-1.00544, -1.162568, -1.889871, 1, 0.8980392, 0, 1,
-1.003119, 1.270176, -0.876392, 1, 0.9058824, 0, 1,
-0.9977068, -1.006003, -2.563196, 1, 0.9137255, 0, 1,
-0.9973459, -0.1014117, -1.206232, 1, 0.9176471, 0, 1,
-0.9955985, -0.1752245, -2.103746, 1, 0.9254902, 0, 1,
-0.9866604, 0.1349333, -1.871162, 1, 0.9294118, 0, 1,
-0.9777424, 0.5323783, -1.780753, 1, 0.9372549, 0, 1,
-0.9721203, -0.3266627, -2.080882, 1, 0.9411765, 0, 1,
-0.9586244, 1.315068, 0.838744, 1, 0.9490196, 0, 1,
-0.9550287, 0.6717619, -0.5510358, 1, 0.9529412, 0, 1,
-0.943956, 1.158711, 0.4526201, 1, 0.9607843, 0, 1,
-0.9429945, 1.105547, -0.7078474, 1, 0.9647059, 0, 1,
-0.9377909, 0.6061165, -1.238064, 1, 0.972549, 0, 1,
-0.9358384, -0.501839, -4.844512, 1, 0.9764706, 0, 1,
-0.9322432, 1.220776, 0.03193726, 1, 0.9843137, 0, 1,
-0.9309453, -0.5485013, -0.705254, 1, 0.9882353, 0, 1,
-0.9299223, -0.4528661, -2.990561, 1, 0.9960784, 0, 1,
-0.921574, -1.388651, -0.5089501, 0.9960784, 1, 0, 1,
-0.9213854, 1.270619, 0.13059, 0.9921569, 1, 0, 1,
-0.9191363, -1.622551, -3.306247, 0.9843137, 1, 0, 1,
-0.9156264, -0.1322594, -0.7940052, 0.9803922, 1, 0, 1,
-0.9116512, 0.5024585, -0.7339173, 0.972549, 1, 0, 1,
-0.8996644, -0.8325242, -1.852377, 0.9686275, 1, 0, 1,
-0.8830242, 1.964205, -0.5767366, 0.9607843, 1, 0, 1,
-0.8771948, 1.600105, 0.5539631, 0.9568627, 1, 0, 1,
-0.8769484, 0.8368014, -1.335161, 0.9490196, 1, 0, 1,
-0.876874, -1.606475, -0.7643479, 0.945098, 1, 0, 1,
-0.8749779, 0.08707641, -2.372678, 0.9372549, 1, 0, 1,
-0.8721151, 0.4967872, -1.567716, 0.9333333, 1, 0, 1,
-0.8686054, -1.206781, -1.738138, 0.9254902, 1, 0, 1,
-0.8668904, 0.5926502, -1.041022, 0.9215686, 1, 0, 1,
-0.8588193, 0.4468544, -0.8622313, 0.9137255, 1, 0, 1,
-0.8489829, 0.4301652, -1.256943, 0.9098039, 1, 0, 1,
-0.847913, -2.007545, -1.334531, 0.9019608, 1, 0, 1,
-0.8384789, 1.826763, -0.824692, 0.8941177, 1, 0, 1,
-0.8377854, -1.854914, -4.923206, 0.8901961, 1, 0, 1,
-0.8371403, -2.34351, -2.648011, 0.8823529, 1, 0, 1,
-0.8268294, -1.03092, -3.041637, 0.8784314, 1, 0, 1,
-0.8221068, -0.2922299, -3.044284, 0.8705882, 1, 0, 1,
-0.822032, 0.657031, -1.429949, 0.8666667, 1, 0, 1,
-0.819681, 0.9661336, 1.512492, 0.8588235, 1, 0, 1,
-0.8196416, 0.437221, 0.5709531, 0.854902, 1, 0, 1,
-0.8168751, 0.9831937, -0.5203797, 0.8470588, 1, 0, 1,
-0.80813, -1.76785, -5.206196, 0.8431373, 1, 0, 1,
-0.8012055, -0.615783, -1.401622, 0.8352941, 1, 0, 1,
-0.8000486, 1.299023, 1.716803, 0.8313726, 1, 0, 1,
-0.7951669, -1.470078, -2.526558, 0.8235294, 1, 0, 1,
-0.775297, 0.2189747, -2.649428, 0.8196079, 1, 0, 1,
-0.7626733, 0.2494394, -0.6863032, 0.8117647, 1, 0, 1,
-0.7625247, -1.636531, -2.655209, 0.8078431, 1, 0, 1,
-0.7602121, 0.4471154, -1.774894, 0.8, 1, 0, 1,
-0.7368103, -0.3597094, -1.710982, 0.7921569, 1, 0, 1,
-0.7347249, -1.863769, -2.181875, 0.7882353, 1, 0, 1,
-0.7308418, 0.6730571, -1.424998, 0.7803922, 1, 0, 1,
-0.7280241, -1.131183, -2.268768, 0.7764706, 1, 0, 1,
-0.7243048, 1.024985, 0.1504554, 0.7686275, 1, 0, 1,
-0.722602, 1.344301, -0.3531031, 0.7647059, 1, 0, 1,
-0.7190277, 0.1911822, -0.4425688, 0.7568628, 1, 0, 1,
-0.713361, -0.2410344, -2.923491, 0.7529412, 1, 0, 1,
-0.7084718, 0.01404323, -1.738241, 0.7450981, 1, 0, 1,
-0.7058573, 0.2267434, -1.805472, 0.7411765, 1, 0, 1,
-0.6922144, -0.6004136, -2.195353, 0.7333333, 1, 0, 1,
-0.6914092, 1.369588, -1.979645, 0.7294118, 1, 0, 1,
-0.6874938, -2.49137, -3.389292, 0.7215686, 1, 0, 1,
-0.6868357, -0.4342757, -2.980733, 0.7176471, 1, 0, 1,
-0.6863638, 0.8330716, 0.1839661, 0.7098039, 1, 0, 1,
-0.6850675, 0.9274312, -2.131548, 0.7058824, 1, 0, 1,
-0.6797403, -1.511099, -3.06961, 0.6980392, 1, 0, 1,
-0.6770947, 0.0283068, -1.406966, 0.6901961, 1, 0, 1,
-0.6713543, -0.4765326, -2.374693, 0.6862745, 1, 0, 1,
-0.6711144, -2.015254, -3.943883, 0.6784314, 1, 0, 1,
-0.6687728, -0.06904591, -2.130567, 0.6745098, 1, 0, 1,
-0.6635985, 0.4009126, -2.032998, 0.6666667, 1, 0, 1,
-0.6578867, -0.6754647, -1.792076, 0.6627451, 1, 0, 1,
-0.6555525, 0.1705516, -2.548943, 0.654902, 1, 0, 1,
-0.6555232, 0.561091, 0.04138928, 0.6509804, 1, 0, 1,
-0.6552625, 0.5648643, 0.2130615, 0.6431373, 1, 0, 1,
-0.6541197, -0.1800348, -0.2945022, 0.6392157, 1, 0, 1,
-0.6514124, -1.633499, -0.6063552, 0.6313726, 1, 0, 1,
-0.6493812, -0.7383723, -3.702662, 0.627451, 1, 0, 1,
-0.6408119, 1.030453, -0.4761995, 0.6196079, 1, 0, 1,
-0.6367712, 0.005698238, -0.9134986, 0.6156863, 1, 0, 1,
-0.6320085, 0.5958283, -1.441246, 0.6078432, 1, 0, 1,
-0.6315824, 0.875002, -0.791275, 0.6039216, 1, 0, 1,
-0.6305482, 1.266806, -0.06582332, 0.5960785, 1, 0, 1,
-0.6288535, 0.6135334, -0.1345567, 0.5882353, 1, 0, 1,
-0.6284711, 0.7089264, -0.3685766, 0.5843138, 1, 0, 1,
-0.6257328, -1.863669, -2.489708, 0.5764706, 1, 0, 1,
-0.6147735, -1.547008, -1.642366, 0.572549, 1, 0, 1,
-0.6136233, -0.5411559, -3.086375, 0.5647059, 1, 0, 1,
-0.6133552, 1.088121, -1.86746, 0.5607843, 1, 0, 1,
-0.6111973, -0.8626294, -0.8648062, 0.5529412, 1, 0, 1,
-0.6096438, -1.854484, -2.494295, 0.5490196, 1, 0, 1,
-0.6086473, 0.5222794, -2.048995, 0.5411765, 1, 0, 1,
-0.6086022, 1.140842, -0.6035206, 0.5372549, 1, 0, 1,
-0.6074481, 2.027126, -0.5836792, 0.5294118, 1, 0, 1,
-0.6025007, -0.2214167, -2.134069, 0.5254902, 1, 0, 1,
-0.6007733, -0.3659258, -2.536793, 0.5176471, 1, 0, 1,
-0.6005651, -0.8139426, -1.288599, 0.5137255, 1, 0, 1,
-0.5936514, 0.6573993, 0.4685544, 0.5058824, 1, 0, 1,
-0.5923757, -0.7363394, -2.342556, 0.5019608, 1, 0, 1,
-0.5907869, 0.6996009, -1.097551, 0.4941176, 1, 0, 1,
-0.5819707, 0.6136127, -0.6488624, 0.4862745, 1, 0, 1,
-0.5814672, 0.6812903, -1.912769, 0.4823529, 1, 0, 1,
-0.5797606, -0.326153, -1.320359, 0.4745098, 1, 0, 1,
-0.5762014, 0.2596463, -2.311725, 0.4705882, 1, 0, 1,
-0.5755789, -0.14383, -2.624577, 0.4627451, 1, 0, 1,
-0.5684, 2.828287, -0.01996959, 0.4588235, 1, 0, 1,
-0.5637362, 1.051725, -2.483218, 0.4509804, 1, 0, 1,
-0.5635218, 1.624306, 0.327363, 0.4470588, 1, 0, 1,
-0.5615649, 0.3486789, 1.102885, 0.4392157, 1, 0, 1,
-0.5603801, 0.3270153, -0.9953439, 0.4352941, 1, 0, 1,
-0.5549334, 0.9763556, -0.2649702, 0.427451, 1, 0, 1,
-0.5418553, -1.513884, -2.88617, 0.4235294, 1, 0, 1,
-0.5415336, -1.007386, -4.997912, 0.4156863, 1, 0, 1,
-0.5366977, 0.4986822, -1.442644, 0.4117647, 1, 0, 1,
-0.5364956, 1.981983, -0.908444, 0.4039216, 1, 0, 1,
-0.5304356, -0.5994166, -2.463366, 0.3960784, 1, 0, 1,
-0.5302684, -2.189601, -5.588377, 0.3921569, 1, 0, 1,
-0.5284113, 0.2080519, -0.4628794, 0.3843137, 1, 0, 1,
-0.5230087, 1.325466, 1.783367, 0.3803922, 1, 0, 1,
-0.5202929, -0.9745076, -1.528246, 0.372549, 1, 0, 1,
-0.518492, -2.080496, -1.570178, 0.3686275, 1, 0, 1,
-0.5184456, -0.5987995, -4.01123, 0.3607843, 1, 0, 1,
-0.5161692, -1.147524, -1.237018, 0.3568628, 1, 0, 1,
-0.511556, -0.4612799, -3.627228, 0.3490196, 1, 0, 1,
-0.5099683, 0.5143356, -3.015135, 0.345098, 1, 0, 1,
-0.5093021, 0.6514533, -0.969892, 0.3372549, 1, 0, 1,
-0.5091344, -1.390851, -1.985087, 0.3333333, 1, 0, 1,
-0.5070927, 0.9372736, 1.818583, 0.3254902, 1, 0, 1,
-0.5057866, 0.3142389, -2.514881, 0.3215686, 1, 0, 1,
-0.498914, -1.174906, -2.870968, 0.3137255, 1, 0, 1,
-0.4947187, -0.9048588, -3.442363, 0.3098039, 1, 0, 1,
-0.493853, 0.5036795, 0.6148857, 0.3019608, 1, 0, 1,
-0.4937221, 2.153707, 1.304583, 0.2941177, 1, 0, 1,
-0.4918277, 0.02288293, -0.6815441, 0.2901961, 1, 0, 1,
-0.4895363, 0.849326, 0.2315263, 0.282353, 1, 0, 1,
-0.4796343, -0.4233413, -3.277155, 0.2784314, 1, 0, 1,
-0.4784316, -0.8824761, -2.013035, 0.2705882, 1, 0, 1,
-0.4744606, -1.005559, -0.9847707, 0.2666667, 1, 0, 1,
-0.4705173, -0.8931365, -2.764467, 0.2588235, 1, 0, 1,
-0.4647481, -0.1345738, -0.5384505, 0.254902, 1, 0, 1,
-0.4636444, -0.005701036, -1.64876, 0.2470588, 1, 0, 1,
-0.4561158, -1.567548, -2.926489, 0.2431373, 1, 0, 1,
-0.4524297, 0.08459871, 0.07852276, 0.2352941, 1, 0, 1,
-0.4505592, -0.4231864, -1.429987, 0.2313726, 1, 0, 1,
-0.4486172, 1.58388, -0.1493969, 0.2235294, 1, 0, 1,
-0.4362928, -0.7359535, -2.085076, 0.2196078, 1, 0, 1,
-0.4339659, -0.2865245, -1.934498, 0.2117647, 1, 0, 1,
-0.4320997, 0.5650265, 0.02841314, 0.2078431, 1, 0, 1,
-0.4307454, -0.3158094, -1.689051, 0.2, 1, 0, 1,
-0.4254366, 0.2213019, -1.161092, 0.1921569, 1, 0, 1,
-0.4246992, 0.05251195, 1.522715, 0.1882353, 1, 0, 1,
-0.4209676, 0.3058508, -1.216494, 0.1803922, 1, 0, 1,
-0.4137534, -2.237943, -3.240565, 0.1764706, 1, 0, 1,
-0.4102255, -0.09313529, -2.273439, 0.1686275, 1, 0, 1,
-0.4080905, -0.08328965, -0.5448917, 0.1647059, 1, 0, 1,
-0.4000259, 0.6302348, -1.185433, 0.1568628, 1, 0, 1,
-0.3942962, 0.6970366, -1.775451, 0.1529412, 1, 0, 1,
-0.3936715, -0.3931983, -3.990902, 0.145098, 1, 0, 1,
-0.3858782, -0.5842639, -4.825071, 0.1411765, 1, 0, 1,
-0.3827028, 0.5846575, -0.7563227, 0.1333333, 1, 0, 1,
-0.380904, -0.8286597, -2.708218, 0.1294118, 1, 0, 1,
-0.3802551, 1.426652, -1.844704, 0.1215686, 1, 0, 1,
-0.3797066, -0.1111164, -0.3172342, 0.1176471, 1, 0, 1,
-0.3795304, 0.2604879, -1.68532, 0.1098039, 1, 0, 1,
-0.3723397, -0.8277547, -3.430543, 0.1058824, 1, 0, 1,
-0.3722686, 1.245483, -0.923557, 0.09803922, 1, 0, 1,
-0.3703963, -0.6208774, -3.400437, 0.09019608, 1, 0, 1,
-0.3691212, -1.039507, -3.935953, 0.08627451, 1, 0, 1,
-0.3583038, -0.9184913, -3.759545, 0.07843138, 1, 0, 1,
-0.3574166, 2.358944, 0.7429998, 0.07450981, 1, 0, 1,
-0.356315, -0.9133242, -4.835776, 0.06666667, 1, 0, 1,
-0.3534898, -1.279866, -3.73763, 0.0627451, 1, 0, 1,
-0.3531903, 0.6857203, 0.1118934, 0.05490196, 1, 0, 1,
-0.3476235, -0.9438466, -1.842798, 0.05098039, 1, 0, 1,
-0.3464397, 0.06194212, -0.3029834, 0.04313726, 1, 0, 1,
-0.3445025, -0.4998643, -2.929447, 0.03921569, 1, 0, 1,
-0.3416353, 0.476286, -0.3129823, 0.03137255, 1, 0, 1,
-0.3366967, 1.290786, 0.2590208, 0.02745098, 1, 0, 1,
-0.3366051, -0.5676242, -2.50703, 0.01960784, 1, 0, 1,
-0.336535, -0.2999817, -2.333837, 0.01568628, 1, 0, 1,
-0.3362271, -1.962372, -3.470725, 0.007843138, 1, 0, 1,
-0.3323166, -0.1489625, -0.9253404, 0.003921569, 1, 0, 1,
-0.3289584, -2.455668, -0.8631819, 0, 1, 0.003921569, 1,
-0.3281037, 0.2095817, -1.477637, 0, 1, 0.01176471, 1,
-0.3234751, -0.4472146, -3.536625, 0, 1, 0.01568628, 1,
-0.3233663, 0.03059058, -0.4817957, 0, 1, 0.02352941, 1,
-0.3218767, -1.476519, -4.08686, 0, 1, 0.02745098, 1,
-0.319209, 0.07483251, -1.546469, 0, 1, 0.03529412, 1,
-0.3139557, -0.07468311, -0.2378197, 0, 1, 0.03921569, 1,
-0.3124429, -0.7167737, -3.028596, 0, 1, 0.04705882, 1,
-0.309416, -0.9426609, -2.410704, 0, 1, 0.05098039, 1,
-0.3042425, -0.07290905, -3.974846, 0, 1, 0.05882353, 1,
-0.300049, 0.004097482, -3.061578, 0, 1, 0.0627451, 1,
-0.294794, -0.7220842, -2.895617, 0, 1, 0.07058824, 1,
-0.29433, 0.9569846, 0.06335998, 0, 1, 0.07450981, 1,
-0.2876137, 1.283052, -0.3647771, 0, 1, 0.08235294, 1,
-0.2825485, 0.7443307, 0.8492834, 0, 1, 0.08627451, 1,
-0.2764499, -0.3822755, -2.247242, 0, 1, 0.09411765, 1,
-0.2759606, -1.062738, -3.572446, 0, 1, 0.1019608, 1,
-0.2720382, 0.08023866, -1.93497, 0, 1, 0.1058824, 1,
-0.2702593, 0.6212771, -1.167409, 0, 1, 0.1137255, 1,
-0.2669568, -0.5709247, -3.785247, 0, 1, 0.1176471, 1,
-0.2552505, 0.3605929, -0.08480074, 0, 1, 0.1254902, 1,
-0.2513169, -0.5894817, -3.077805, 0, 1, 0.1294118, 1,
-0.2506527, -0.9710557, -1.969643, 0, 1, 0.1372549, 1,
-0.2475263, 0.5831045, 0.8158363, 0, 1, 0.1411765, 1,
-0.2468187, -1.775313, -3.898259, 0, 1, 0.1490196, 1,
-0.2453423, -0.876833, -2.223268, 0, 1, 0.1529412, 1,
-0.2444899, 0.9621365, -0.3809603, 0, 1, 0.1607843, 1,
-0.2415355, -1.105087, -2.492737, 0, 1, 0.1647059, 1,
-0.2372157, 0.04080138, -2.013132, 0, 1, 0.172549, 1,
-0.2363589, -1.443832, -3.613456, 0, 1, 0.1764706, 1,
-0.2353424, 0.5172786, -0.1866347, 0, 1, 0.1843137, 1,
-0.2349098, -0.3311716, -4.384954, 0, 1, 0.1882353, 1,
-0.2345992, 0.3791833, -0.6119706, 0, 1, 0.1960784, 1,
-0.2344802, 1.362153, 0.3684124, 0, 1, 0.2039216, 1,
-0.2344583, -0.3265593, -1.541766, 0, 1, 0.2078431, 1,
-0.2322139, 1.750793, -0.2226727, 0, 1, 0.2156863, 1,
-0.2276627, -0.4433865, -2.905336, 0, 1, 0.2196078, 1,
-0.2252355, 2.25953, -0.6869386, 0, 1, 0.227451, 1,
-0.2232309, 0.9201964, -0.1607753, 0, 1, 0.2313726, 1,
-0.2223925, 1.712068, -2.848979, 0, 1, 0.2392157, 1,
-0.222335, -0.7799628, -3.380963, 0, 1, 0.2431373, 1,
-0.2212568, -0.449513, -1.799119, 0, 1, 0.2509804, 1,
-0.2207819, 0.6486501, 0.2074635, 0, 1, 0.254902, 1,
-0.2199872, 0.09391031, -0.9896578, 0, 1, 0.2627451, 1,
-0.2196035, 1.078591, 0.06758152, 0, 1, 0.2666667, 1,
-0.2182695, -0.7069641, -2.646055, 0, 1, 0.2745098, 1,
-0.2172232, -0.6501408, -2.657245, 0, 1, 0.2784314, 1,
-0.2165698, -1.475818, -2.823501, 0, 1, 0.2862745, 1,
-0.2151547, 0.8560348, 0.5174734, 0, 1, 0.2901961, 1,
-0.2140306, 1.094538, 0.4060343, 0, 1, 0.2980392, 1,
-0.2137823, -0.5882658, -3.237372, 0, 1, 0.3058824, 1,
-0.2099815, 0.7066809, -1.109154, 0, 1, 0.3098039, 1,
-0.2096075, 0.5848079, -0.3790918, 0, 1, 0.3176471, 1,
-0.2092113, 0.3943801, 0.3527923, 0, 1, 0.3215686, 1,
-0.206526, -0.2010738, -1.348315, 0, 1, 0.3294118, 1,
-0.2032626, -1.244675, -4.967474, 0, 1, 0.3333333, 1,
-0.2023771, -1.236079, -2.819071, 0, 1, 0.3411765, 1,
-0.1961649, 0.9775459, -0.1434782, 0, 1, 0.345098, 1,
-0.1921678, -1.486329, -3.303278, 0, 1, 0.3529412, 1,
-0.1901377, 0.7218524, 0.5012951, 0, 1, 0.3568628, 1,
-0.1843899, 2.246013, 0.7309339, 0, 1, 0.3647059, 1,
-0.1809344, 1.486193, -1.269376, 0, 1, 0.3686275, 1,
-0.1801888, -0.3318059, -2.585706, 0, 1, 0.3764706, 1,
-0.1768499, -1.178386, -4.070811, 0, 1, 0.3803922, 1,
-0.1762555, 0.8078765, 0.251403, 0, 1, 0.3882353, 1,
-0.1762346, 0.8117284, 0.5460524, 0, 1, 0.3921569, 1,
-0.1758733, 1.203233, -1.057034, 0, 1, 0.4, 1,
-0.168248, -0.01876047, -1.877484, 0, 1, 0.4078431, 1,
-0.1664811, -0.1067516, -2.029943, 0, 1, 0.4117647, 1,
-0.1648051, 0.4154725, -0.03383883, 0, 1, 0.4196078, 1,
-0.1625152, -0.3628142, -1.56023, 0, 1, 0.4235294, 1,
-0.1624978, 0.8295605, -1.26425, 0, 1, 0.4313726, 1,
-0.161465, 0.847442, -2.129864, 0, 1, 0.4352941, 1,
-0.1594752, -1.120449, -4.155842, 0, 1, 0.4431373, 1,
-0.1504982, -1.406887, -3.671963, 0, 1, 0.4470588, 1,
-0.1489131, 0.1241362, -2.094355, 0, 1, 0.454902, 1,
-0.1439137, -0.2563708, -1.956484, 0, 1, 0.4588235, 1,
-0.1435309, 0.1402793, -0.810314, 0, 1, 0.4666667, 1,
-0.1425188, 1.948931, 1.264956, 0, 1, 0.4705882, 1,
-0.1385321, -0.7168059, -3.376935, 0, 1, 0.4784314, 1,
-0.1356432, -1.80033, -3.960105, 0, 1, 0.4823529, 1,
-0.1306569, -0.4768567, -2.859732, 0, 1, 0.4901961, 1,
-0.1303662, -0.2561423, -1.938761, 0, 1, 0.4941176, 1,
-0.1303396, -1.954906, -3.80748, 0, 1, 0.5019608, 1,
-0.1282527, -0.3927431, -2.92404, 0, 1, 0.509804, 1,
-0.128007, 0.9501211, 0.03391726, 0, 1, 0.5137255, 1,
-0.1233789, 0.2986079, 0.5580502, 0, 1, 0.5215687, 1,
-0.1229227, -1.866637, -2.473211, 0, 1, 0.5254902, 1,
-0.1221329, -2.130009, -4.589874, 0, 1, 0.5333334, 1,
-0.1190403, -0.4540657, -2.627891, 0, 1, 0.5372549, 1,
-0.1173266, 1.766295, -0.1898037, 0, 1, 0.5450981, 1,
-0.1105659, -0.009181571, -1.53078, 0, 1, 0.5490196, 1,
-0.1083731, -1.211776, -2.970855, 0, 1, 0.5568628, 1,
-0.1078023, 0.2135135, 0.03145861, 0, 1, 0.5607843, 1,
-0.1067859, -1.635946, -3.009611, 0, 1, 0.5686275, 1,
-0.1067752, 0.08436302, -0.822086, 0, 1, 0.572549, 1,
-0.1053397, -0.01886555, -0.5247426, 0, 1, 0.5803922, 1,
-0.1039719, -1.256645, -2.678142, 0, 1, 0.5843138, 1,
-0.1035773, -0.6552496, -2.253652, 0, 1, 0.5921569, 1,
-0.1031648, -0.2586417, -2.455141, 0, 1, 0.5960785, 1,
-0.1023888, 0.7266948, 0.2771227, 0, 1, 0.6039216, 1,
-0.1011749, -1.799312, -5.644659, 0, 1, 0.6117647, 1,
-0.1006219, 0.3326013, -0.9280808, 0, 1, 0.6156863, 1,
-0.09964057, 0.7905745, -0.9392965, 0, 1, 0.6235294, 1,
-0.09464353, -0.2607516, -3.105677, 0, 1, 0.627451, 1,
-0.09432224, -1.11197, -3.725523, 0, 1, 0.6352941, 1,
-0.09376162, -1.747547, -2.000009, 0, 1, 0.6392157, 1,
-0.0919664, -0.3695567, -4.661936, 0, 1, 0.6470588, 1,
-0.09153894, -0.5037879, -2.849798, 0, 1, 0.6509804, 1,
-0.08494198, 0.6444739, 1.590106, 0, 1, 0.6588235, 1,
-0.08178022, -0.2671111, 0.07074668, 0, 1, 0.6627451, 1,
-0.08158097, 1.132173, -0.16326, 0, 1, 0.6705883, 1,
-0.08012943, 0.02438412, -0.3722721, 0, 1, 0.6745098, 1,
-0.07744889, 2.538828, 0.8694632, 0, 1, 0.682353, 1,
-0.07743438, 1.148118, -0.2297487, 0, 1, 0.6862745, 1,
-0.07569732, 0.7917256, 0.155576, 0, 1, 0.6941177, 1,
-0.07242055, 0.4709755, -0.1651631, 0, 1, 0.7019608, 1,
-0.0708684, 2.063796, -0.2533776, 0, 1, 0.7058824, 1,
-0.0708158, 0.2966592, -0.3681946, 0, 1, 0.7137255, 1,
-0.06853518, -0.6035751, -2.167477, 0, 1, 0.7176471, 1,
-0.06300159, -0.7253228, -3.06308, 0, 1, 0.7254902, 1,
-0.06121461, -0.09402791, -1.544275, 0, 1, 0.7294118, 1,
-0.04539038, 0.04780082, 0.1842352, 0, 1, 0.7372549, 1,
-0.04310255, -2.252465, -3.786984, 0, 1, 0.7411765, 1,
-0.04085765, 0.8744018, -0.7291258, 0, 1, 0.7490196, 1,
-0.04024289, 0.6132435, 1.495265, 0, 1, 0.7529412, 1,
-0.03964277, 1.04009, -2.077593, 0, 1, 0.7607843, 1,
-0.03931496, -0.02487159, -2.684641, 0, 1, 0.7647059, 1,
-0.03679748, -0.2553505, -4.467786, 0, 1, 0.772549, 1,
-0.03592638, 0.8327153, 1.314721, 0, 1, 0.7764706, 1,
-0.02778752, -2.178837, -2.538878, 0, 1, 0.7843137, 1,
-0.02332599, -0.9008675, -1.856629, 0, 1, 0.7882353, 1,
-0.02160023, -1.421565, -3.195256, 0, 1, 0.7960784, 1,
-0.00585278, -0.3329737, -2.245908, 0, 1, 0.8039216, 1,
-0.002017054, 1.386337, -0.1016588, 0, 1, 0.8078431, 1,
0.0001186533, 1.019952, -0.2657517, 0, 1, 0.8156863, 1,
0.006222334, 0.3237111, 1.997131, 0, 1, 0.8196079, 1,
0.006292702, -0.7392268, 2.901065, 0, 1, 0.827451, 1,
0.008194186, 0.8223842, -0.5447193, 0, 1, 0.8313726, 1,
0.008708598, -0.9939775, 2.661215, 0, 1, 0.8392157, 1,
0.009041831, 0.8464598, 0.9156923, 0, 1, 0.8431373, 1,
0.01037349, -0.6278158, 2.881135, 0, 1, 0.8509804, 1,
0.01389971, -0.02821279, 2.159675, 0, 1, 0.854902, 1,
0.01868703, 0.4639515, 0.04252209, 0, 1, 0.8627451, 1,
0.02044844, -1.794426, 2.337434, 0, 1, 0.8666667, 1,
0.0224541, 0.055897, 1.000555, 0, 1, 0.8745098, 1,
0.02263835, -1.297972, 2.61241, 0, 1, 0.8784314, 1,
0.02459492, 0.2703042, 0.3258093, 0, 1, 0.8862745, 1,
0.02827909, -0.06823212, 2.428417, 0, 1, 0.8901961, 1,
0.03305107, 2.296466, 0.4849783, 0, 1, 0.8980392, 1,
0.03338302, 2.158366, 1.068161, 0, 1, 0.9058824, 1,
0.03419005, 1.117368, -0.07629914, 0, 1, 0.9098039, 1,
0.03465398, -1.270868, 2.27096, 0, 1, 0.9176471, 1,
0.03668313, 1.391577, 0.9443755, 0, 1, 0.9215686, 1,
0.03818898, -0.4507155, 4.099441, 0, 1, 0.9294118, 1,
0.04399963, -0.4360296, 2.252265, 0, 1, 0.9333333, 1,
0.0444321, 0.1258085, 0.5606006, 0, 1, 0.9411765, 1,
0.04976756, 1.177699, -0.1607378, 0, 1, 0.945098, 1,
0.05103429, 0.4238465, 0.6270871, 0, 1, 0.9529412, 1,
0.05237155, -2.196598, 2.745156, 0, 1, 0.9568627, 1,
0.05749374, 1.53155, -0.5855291, 0, 1, 0.9647059, 1,
0.05939374, -0.1928387, 2.262548, 0, 1, 0.9686275, 1,
0.06964308, 0.009621661, 1.946307, 0, 1, 0.9764706, 1,
0.07209297, -1.089098, 2.89819, 0, 1, 0.9803922, 1,
0.07803743, 0.5895805, 2.516201, 0, 1, 0.9882353, 1,
0.08068109, 1.53377, -1.478863, 0, 1, 0.9921569, 1,
0.08601903, -0.1383599, 2.570794, 0, 1, 1, 1,
0.08911159, 1.509034, 0.9651505, 0, 0.9921569, 1, 1,
0.09925448, 0.717707, 1.355415, 0, 0.9882353, 1, 1,
0.1006527, -0.5768875, 2.402091, 0, 0.9803922, 1, 1,
0.1018398, -1.042803, 4.760068, 0, 0.9764706, 1, 1,
0.1056268, -0.1353874, 1.794345, 0, 0.9686275, 1, 1,
0.1065361, 0.8867324, -0.4285352, 0, 0.9647059, 1, 1,
0.106871, 0.1186419, 1.724271, 0, 0.9568627, 1, 1,
0.1073385, 0.8664337, -0.939404, 0, 0.9529412, 1, 1,
0.11217, -0.8647657, 3.682247, 0, 0.945098, 1, 1,
0.11926, -0.08303754, 3.301116, 0, 0.9411765, 1, 1,
0.1247207, 1.6642, -0.1675469, 0, 0.9333333, 1, 1,
0.1254703, 0.7061591, -0.1059245, 0, 0.9294118, 1, 1,
0.1259006, 0.2277225, 0.7617352, 0, 0.9215686, 1, 1,
0.1265737, -0.003580248, 2.423713, 0, 0.9176471, 1, 1,
0.135673, 0.3144096, -0.8131789, 0, 0.9098039, 1, 1,
0.1373314, 0.030512, 1.546807, 0, 0.9058824, 1, 1,
0.1439471, -0.4398699, 2.559835, 0, 0.8980392, 1, 1,
0.1460563, -0.08638002, 0.9732552, 0, 0.8901961, 1, 1,
0.1477709, 0.03203214, 0.1277053, 0, 0.8862745, 1, 1,
0.1487891, -0.558835, 4.019728, 0, 0.8784314, 1, 1,
0.1492832, 0.7423773, -0.1931719, 0, 0.8745098, 1, 1,
0.1496677, -0.6712693, 2.221225, 0, 0.8666667, 1, 1,
0.1506122, -0.8398819, 2.246234, 0, 0.8627451, 1, 1,
0.1528101, 0.67125, -0.2580364, 0, 0.854902, 1, 1,
0.1538269, -0.934761, 4.802317, 0, 0.8509804, 1, 1,
0.1557702, -0.3003735, 3.359263, 0, 0.8431373, 1, 1,
0.1560103, 1.451582, -0.3448632, 0, 0.8392157, 1, 1,
0.1586809, -0.2046936, 2.203012, 0, 0.8313726, 1, 1,
0.1592254, -0.3433379, 3.311042, 0, 0.827451, 1, 1,
0.1601062, -1.068499, 2.788706, 0, 0.8196079, 1, 1,
0.1618475, -0.9683884, 2.511711, 0, 0.8156863, 1, 1,
0.1622418, -2.150736, 2.953438, 0, 0.8078431, 1, 1,
0.1626329, 1.523678, -1.945444, 0, 0.8039216, 1, 1,
0.1637337, 0.25942, -0.3778485, 0, 0.7960784, 1, 1,
0.1674309, 0.3950125, -1.228183, 0, 0.7882353, 1, 1,
0.1688015, 1.7416, 0.3152799, 0, 0.7843137, 1, 1,
0.1756512, -0.7142018, 3.175182, 0, 0.7764706, 1, 1,
0.1769886, -0.387476, 1.774668, 0, 0.772549, 1, 1,
0.1803501, 0.4295699, 1.529134, 0, 0.7647059, 1, 1,
0.1827218, -1.336074, 4.392653, 0, 0.7607843, 1, 1,
0.184536, -1.79922, 3.042893, 0, 0.7529412, 1, 1,
0.1860099, 0.2548234, -0.09285267, 0, 0.7490196, 1, 1,
0.1874583, 0.6293544, -0.2004966, 0, 0.7411765, 1, 1,
0.1891863, 0.596917, 0.4220425, 0, 0.7372549, 1, 1,
0.1894709, -0.8164985, 3.011974, 0, 0.7294118, 1, 1,
0.1900392, -0.211088, 1.023234, 0, 0.7254902, 1, 1,
0.1917803, 0.5999546, -0.4787917, 0, 0.7176471, 1, 1,
0.1972064, 0.5288531, 0.4849747, 0, 0.7137255, 1, 1,
0.1972237, -0.8217315, 3.981158, 0, 0.7058824, 1, 1,
0.1981892, 0.7035061, -0.2070012, 0, 0.6980392, 1, 1,
0.1984493, 1.144466, 1.338807, 0, 0.6941177, 1, 1,
0.1997451, 0.2606731, 1.613163, 0, 0.6862745, 1, 1,
0.2002902, 1.339283, 1.683037, 0, 0.682353, 1, 1,
0.2005026, -1.11564, 3.746071, 0, 0.6745098, 1, 1,
0.2084138, 0.1924191, -1.095455, 0, 0.6705883, 1, 1,
0.2181114, -0.6433395, 2.903579, 0, 0.6627451, 1, 1,
0.2187122, -0.3449827, 4.317074, 0, 0.6588235, 1, 1,
0.2202235, -1.674098, 2.536426, 0, 0.6509804, 1, 1,
0.2243969, -0.1515421, 4.374198, 0, 0.6470588, 1, 1,
0.2312409, 0.5656011, 1.396163, 0, 0.6392157, 1, 1,
0.2313382, 0.9505259, -0.1343871, 0, 0.6352941, 1, 1,
0.2326953, -0.759321, 3.093855, 0, 0.627451, 1, 1,
0.2343251, -2.265332, 3.588737, 0, 0.6235294, 1, 1,
0.2355783, -1.748205, 1.96351, 0, 0.6156863, 1, 1,
0.235938, 0.6565959, 0.8566256, 0, 0.6117647, 1, 1,
0.2397173, 2.097994, 0.0193561, 0, 0.6039216, 1, 1,
0.2411003, 1.468012, -1.033872, 0, 0.5960785, 1, 1,
0.2424845, -1.71584, 3.35811, 0, 0.5921569, 1, 1,
0.242807, -0.2429156, 2.722706, 0, 0.5843138, 1, 1,
0.2435814, 0.7099965, 0.3933145, 0, 0.5803922, 1, 1,
0.2461569, 0.1160466, 1.96826, 0, 0.572549, 1, 1,
0.2501415, -0.967293, 2.371451, 0, 0.5686275, 1, 1,
0.2533613, 1.434583, 1.236564, 0, 0.5607843, 1, 1,
0.2540857, -1.210349, 2.722943, 0, 0.5568628, 1, 1,
0.2555916, -0.1523081, 1.99007, 0, 0.5490196, 1, 1,
0.2578954, -0.1668318, 1.782408, 0, 0.5450981, 1, 1,
0.2593076, -2.212901, 2.610047, 0, 0.5372549, 1, 1,
0.2594402, 0.2651622, -0.7173287, 0, 0.5333334, 1, 1,
0.2597382, -0.8188299, 2.209527, 0, 0.5254902, 1, 1,
0.2608624, -0.1975993, 3.149722, 0, 0.5215687, 1, 1,
0.2634371, 0.5405715, -1.303278, 0, 0.5137255, 1, 1,
0.2635531, 0.6262504, -0.03046772, 0, 0.509804, 1, 1,
0.2655286, -0.6059151, 4.265644, 0, 0.5019608, 1, 1,
0.269746, -0.5887133, 4.466205, 0, 0.4941176, 1, 1,
0.2723497, 2.513996, -2.149709, 0, 0.4901961, 1, 1,
0.2769646, 1.101305, -0.4719814, 0, 0.4823529, 1, 1,
0.2800512, -0.7572657, 2.225768, 0, 0.4784314, 1, 1,
0.2801073, -0.9830355, 3.408065, 0, 0.4705882, 1, 1,
0.2804717, -0.6632532, 2.50134, 0, 0.4666667, 1, 1,
0.2816571, 0.1299427, 0.8160672, 0, 0.4588235, 1, 1,
0.2824758, -2.304383, 2.646597, 0, 0.454902, 1, 1,
0.2859738, 0.3779653, 0.7073645, 0, 0.4470588, 1, 1,
0.2862272, -0.1061098, 3.067178, 0, 0.4431373, 1, 1,
0.2872262, 0.04314474, 2.966246, 0, 0.4352941, 1, 1,
0.2883431, 0.6884019, -0.7374406, 0, 0.4313726, 1, 1,
0.2898369, 0.005482517, 2.086205, 0, 0.4235294, 1, 1,
0.294988, -0.962607, 2.059835, 0, 0.4196078, 1, 1,
0.296645, 0.4097791, 1.475422, 0, 0.4117647, 1, 1,
0.3080757, 1.150991, 0.04903392, 0, 0.4078431, 1, 1,
0.3083297, 1.213579, 2.59039, 0, 0.4, 1, 1,
0.3147605, 0.4192761, 1.468268, 0, 0.3921569, 1, 1,
0.3203843, 0.6807958, 0.588375, 0, 0.3882353, 1, 1,
0.3221924, -1.792288, 2.331334, 0, 0.3803922, 1, 1,
0.3231431, 2.231498, 1.105647, 0, 0.3764706, 1, 1,
0.3253727, -0.2550302, 1.88996, 0, 0.3686275, 1, 1,
0.3277202, -0.6525428, 2.610326, 0, 0.3647059, 1, 1,
0.3335574, 1.059073, -0.6859239, 0, 0.3568628, 1, 1,
0.3346639, -1.426522, 2.544513, 0, 0.3529412, 1, 1,
0.3362159, -0.1827808, 3.525162, 0, 0.345098, 1, 1,
0.3379902, -0.8733023, 2.769991, 0, 0.3411765, 1, 1,
0.3389822, -0.968058, 2.452182, 0, 0.3333333, 1, 1,
0.3404494, -1.915528, 2.742297, 0, 0.3294118, 1, 1,
0.3406937, 1.007439, -0.4360048, 0, 0.3215686, 1, 1,
0.3423108, 0.2646355, -0.02997365, 0, 0.3176471, 1, 1,
0.3452227, 0.8950824, -0.2437392, 0, 0.3098039, 1, 1,
0.3474177, -0.3439522, 2.022745, 0, 0.3058824, 1, 1,
0.3484983, -1.176876, 1.844401, 0, 0.2980392, 1, 1,
0.3525011, 0.4072554, 0.6059505, 0, 0.2901961, 1, 1,
0.3539615, -1.505585, 3.918255, 0, 0.2862745, 1, 1,
0.3593905, 0.6695441, -0.250394, 0, 0.2784314, 1, 1,
0.3628462, -0.7272111, 3.111794, 0, 0.2745098, 1, 1,
0.3671605, -0.07928716, 1.957443, 0, 0.2666667, 1, 1,
0.3718756, 0.5919725, 1.059436, 0, 0.2627451, 1, 1,
0.3760211, -0.5291188, 2.31267, 0, 0.254902, 1, 1,
0.3825673, 0.1332718, 2.248387, 0, 0.2509804, 1, 1,
0.3902124, -0.8734695, 3.230896, 0, 0.2431373, 1, 1,
0.3930891, 1.440071, -0.2418524, 0, 0.2392157, 1, 1,
0.3939168, -0.8148821, 1.821121, 0, 0.2313726, 1, 1,
0.3946735, -0.794817, 1.22058, 0, 0.227451, 1, 1,
0.40201, 1.802307, -0.4530093, 0, 0.2196078, 1, 1,
0.4053712, 0.4114241, 0.4512615, 0, 0.2156863, 1, 1,
0.4057157, 0.7162899, -0.2388243, 0, 0.2078431, 1, 1,
0.4079959, -1.058007, 3.864518, 0, 0.2039216, 1, 1,
0.4083979, 0.6977919, 0.6094334, 0, 0.1960784, 1, 1,
0.4102148, -0.9948764, 2.316229, 0, 0.1882353, 1, 1,
0.4103695, 1.161408, -2.0112, 0, 0.1843137, 1, 1,
0.412047, -0.0373576, 1.033376, 0, 0.1764706, 1, 1,
0.4134512, 0.2937297, 0.8717431, 0, 0.172549, 1, 1,
0.4149361, -0.1299704, 1.441576, 0, 0.1647059, 1, 1,
0.4209297, -0.05785935, 3.488328, 0, 0.1607843, 1, 1,
0.4211471, -0.4872978, 2.643971, 0, 0.1529412, 1, 1,
0.4299286, 0.1990038, -0.277566, 0, 0.1490196, 1, 1,
0.4318115, 0.3572169, 0.7157635, 0, 0.1411765, 1, 1,
0.4322298, -0.9879521, 1.830843, 0, 0.1372549, 1, 1,
0.433053, 0.5058641, 1.098305, 0, 0.1294118, 1, 1,
0.4332305, 1.67401, -0.6077651, 0, 0.1254902, 1, 1,
0.4332914, -0.1745229, 1.233124, 0, 0.1176471, 1, 1,
0.4348156, -0.2555891, 1.705734, 0, 0.1137255, 1, 1,
0.439178, 1.736783, 2.013608, 0, 0.1058824, 1, 1,
0.4404917, -0.4401971, 2.191227, 0, 0.09803922, 1, 1,
0.4412031, 0.2134839, 2.789506, 0, 0.09411765, 1, 1,
0.44963, 0.4204014, 1.052294, 0, 0.08627451, 1, 1,
0.4522036, -1.287843, 1.734294, 0, 0.08235294, 1, 1,
0.4574388, -2.614707, 2.898542, 0, 0.07450981, 1, 1,
0.4614825, 0.4261443, 1.956479, 0, 0.07058824, 1, 1,
0.4658574, -1.228179, 2.19189, 0, 0.0627451, 1, 1,
0.4661226, -0.07179897, 1.815966, 0, 0.05882353, 1, 1,
0.4721543, -0.393732, 1.967586, 0, 0.05098039, 1, 1,
0.4729059, 0.0001973983, 1.818212, 0, 0.04705882, 1, 1,
0.476188, -1.495888, 0.9942912, 0, 0.03921569, 1, 1,
0.4812752, 0.2965172, 1.673573, 0, 0.03529412, 1, 1,
0.4894371, -1.262325, 3.419616, 0, 0.02745098, 1, 1,
0.489875, 0.4178183, 1.735059, 0, 0.02352941, 1, 1,
0.4921655, 1.875003, -1.610785, 0, 0.01568628, 1, 1,
0.4935723, 0.1508388, 0.8581852, 0, 0.01176471, 1, 1,
0.4944752, 1.433719, 1.668427, 0, 0.003921569, 1, 1,
0.4983348, 0.380972, 1.879133, 0.003921569, 0, 1, 1,
0.5007721, -1.472355, 3.443721, 0.007843138, 0, 1, 1,
0.502569, -0.3207344, 4.238794, 0.01568628, 0, 1, 1,
0.5048731, -0.1296673, 0.5508783, 0.01960784, 0, 1, 1,
0.5080488, 0.3684831, 0.5445215, 0.02745098, 0, 1, 1,
0.5092207, -0.4269681, 3.656804, 0.03137255, 0, 1, 1,
0.5171236, -0.05143167, 2.238622, 0.03921569, 0, 1, 1,
0.5175388, 0.08075017, 0.8976013, 0.04313726, 0, 1, 1,
0.5190392, 0.4042055, 2.074003, 0.05098039, 0, 1, 1,
0.5199869, -1.138474, 3.198553, 0.05490196, 0, 1, 1,
0.5285044, 0.7507498, 1.064798, 0.0627451, 0, 1, 1,
0.5309183, -0.1231254, 1.324021, 0.06666667, 0, 1, 1,
0.5327651, 0.01304927, 1.971314, 0.07450981, 0, 1, 1,
0.5329655, -2.21044, 1.266781, 0.07843138, 0, 1, 1,
0.5336316, -0.06192765, 2.551831, 0.08627451, 0, 1, 1,
0.5391344, 0.5657236, 0.2220296, 0.09019608, 0, 1, 1,
0.5407248, 0.2716012, 0.6483163, 0.09803922, 0, 1, 1,
0.5410373, -0.14091, 1.456748, 0.1058824, 0, 1, 1,
0.5424597, 0.3328469, 2.315725, 0.1098039, 0, 1, 1,
0.54764, 0.4541011, 0.303008, 0.1176471, 0, 1, 1,
0.5493329, 0.01265996, 3.991716, 0.1215686, 0, 1, 1,
0.5552858, -1.556786, 3.468587, 0.1294118, 0, 1, 1,
0.5570998, 0.1370341, 1.293945, 0.1333333, 0, 1, 1,
0.5577447, -0.1717217, 1.832454, 0.1411765, 0, 1, 1,
0.562604, -0.6345044, 0.08509549, 0.145098, 0, 1, 1,
0.5648156, -1.773239, 4.198844, 0.1529412, 0, 1, 1,
0.5667397, 0.2834021, 0.1399758, 0.1568628, 0, 1, 1,
0.5685529, -0.05100806, 3.934698, 0.1647059, 0, 1, 1,
0.5727966, 0.9052988, -0.8394843, 0.1686275, 0, 1, 1,
0.573435, 0.9202775, 0.9280501, 0.1764706, 0, 1, 1,
0.5743482, -0.3225261, 2.153947, 0.1803922, 0, 1, 1,
0.5765556, -1.016884, 2.929503, 0.1882353, 0, 1, 1,
0.5802128, 0.2111509, 2.121213, 0.1921569, 0, 1, 1,
0.5818782, 0.5139863, 1.324614, 0.2, 0, 1, 1,
0.5845093, -0.1517506, 2.867544, 0.2078431, 0, 1, 1,
0.5862865, -1.332773, 4.591499, 0.2117647, 0, 1, 1,
0.5863039, 1.428827, 0.6058307, 0.2196078, 0, 1, 1,
0.5890853, 0.06963301, 1.63073, 0.2235294, 0, 1, 1,
0.58999, 1.227311, -0.5701143, 0.2313726, 0, 1, 1,
0.5902568, -0.06637796, 1.211684, 0.2352941, 0, 1, 1,
0.5994177, -0.1156348, 4.558038, 0.2431373, 0, 1, 1,
0.5997861, 0.04242506, 1.28602, 0.2470588, 0, 1, 1,
0.6028414, -0.05660404, 2.041472, 0.254902, 0, 1, 1,
0.6075009, -0.01907013, 1.900526, 0.2588235, 0, 1, 1,
0.6076037, 1.244097, 1.509859, 0.2666667, 0, 1, 1,
0.6092899, -0.8268632, 3.236289, 0.2705882, 0, 1, 1,
0.60955, 0.3123455, -0.0574391, 0.2784314, 0, 1, 1,
0.6177788, 0.2719923, 0.2627077, 0.282353, 0, 1, 1,
0.6197496, -1.446142, 2.944317, 0.2901961, 0, 1, 1,
0.6197908, -1.098291, 0.6448972, 0.2941177, 0, 1, 1,
0.6202241, 0.6539902, -0.3193796, 0.3019608, 0, 1, 1,
0.6207196, -0.1748521, 1.512834, 0.3098039, 0, 1, 1,
0.6227408, -0.643607, 2.815728, 0.3137255, 0, 1, 1,
0.6243136, -1.170425, 1.172117, 0.3215686, 0, 1, 1,
0.625354, -0.5605084, 2.042048, 0.3254902, 0, 1, 1,
0.625882, 0.7345814, 1.63211, 0.3333333, 0, 1, 1,
0.6284854, -0.5028484, 1.208035, 0.3372549, 0, 1, 1,
0.631898, -0.2964861, 2.492116, 0.345098, 0, 1, 1,
0.6392236, -0.3038318, 1.598743, 0.3490196, 0, 1, 1,
0.6424599, 0.4750272, 0.6629357, 0.3568628, 0, 1, 1,
0.6434444, 0.5497751, 1.330648, 0.3607843, 0, 1, 1,
0.6500525, -1.254811, 2.101286, 0.3686275, 0, 1, 1,
0.6533492, 1.06575, 1.26072, 0.372549, 0, 1, 1,
0.660515, -0.01632312, 3.345072, 0.3803922, 0, 1, 1,
0.6667966, 1.027099, 1.08019, 0.3843137, 0, 1, 1,
0.6675597, -1.327811, 3.444807, 0.3921569, 0, 1, 1,
0.6707442, 1.216088, -1.06471, 0.3960784, 0, 1, 1,
0.6793666, -0.5861, 4.093172, 0.4039216, 0, 1, 1,
0.6815726, -1.445439, 2.184515, 0.4117647, 0, 1, 1,
0.6888798, 1.758236, 0.1002528, 0.4156863, 0, 1, 1,
0.6892267, -0.1656145, 2.217911, 0.4235294, 0, 1, 1,
0.6913365, -0.9256548, 3.635339, 0.427451, 0, 1, 1,
0.6952782, 1.181825, 0.9328862, 0.4352941, 0, 1, 1,
0.6965505, 1.118153, -0.8231067, 0.4392157, 0, 1, 1,
0.6975541, -0.1915707, 1.891526, 0.4470588, 0, 1, 1,
0.6989943, -0.4406871, 2.586963, 0.4509804, 0, 1, 1,
0.7014439, 0.4679675, 0.7458318, 0.4588235, 0, 1, 1,
0.7048079, -1.857564, 2.778898, 0.4627451, 0, 1, 1,
0.7049483, -0.8694454, 3.358732, 0.4705882, 0, 1, 1,
0.7067194, 1.18602, -0.1266526, 0.4745098, 0, 1, 1,
0.7071845, 0.8274901, 0.6229784, 0.4823529, 0, 1, 1,
0.7074907, 2.05007, -1.085797, 0.4862745, 0, 1, 1,
0.7101862, -1.182371, 2.477897, 0.4941176, 0, 1, 1,
0.7102413, 0.2947775, 0.6408349, 0.5019608, 0, 1, 1,
0.710833, -0.1240047, 2.157449, 0.5058824, 0, 1, 1,
0.7109286, 2.313039, 0.4981532, 0.5137255, 0, 1, 1,
0.7119022, -0.562966, 1.675016, 0.5176471, 0, 1, 1,
0.7124384, 1.454023, 0.03483924, 0.5254902, 0, 1, 1,
0.7155257, 0.4386772, 1.325717, 0.5294118, 0, 1, 1,
0.7156435, 0.5779386, 2.128067, 0.5372549, 0, 1, 1,
0.7170581, 0.2366049, 3.145991, 0.5411765, 0, 1, 1,
0.7185784, 1.319219, 0.9804705, 0.5490196, 0, 1, 1,
0.7245871, -0.9608341, 2.039211, 0.5529412, 0, 1, 1,
0.726516, -0.1120471, 1.879323, 0.5607843, 0, 1, 1,
0.7271838, 1.974479, -0.7477128, 0.5647059, 0, 1, 1,
0.7281301, 0.3368666, 0.2150085, 0.572549, 0, 1, 1,
0.7331574, -2.070318, 3.620982, 0.5764706, 0, 1, 1,
0.7337803, 1.280887, 1.028814, 0.5843138, 0, 1, 1,
0.7414023, 1.044757, 0.5439379, 0.5882353, 0, 1, 1,
0.7436477, 0.1057208, 3.149575, 0.5960785, 0, 1, 1,
0.7438467, -1.112503, 3.730436, 0.6039216, 0, 1, 1,
0.7439699, 0.6744434, 1.178414, 0.6078432, 0, 1, 1,
0.7466725, -1.193131, 1.774498, 0.6156863, 0, 1, 1,
0.7487019, 0.2061487, 2.535566, 0.6196079, 0, 1, 1,
0.7503518, 0.3683675, 2.985285, 0.627451, 0, 1, 1,
0.752991, -1.685182, 2.15279, 0.6313726, 0, 1, 1,
0.753199, 0.09163382, 0.2395965, 0.6392157, 0, 1, 1,
0.7551295, 0.1702751, -0.5101284, 0.6431373, 0, 1, 1,
0.7556543, -0.3962422, 1.306542, 0.6509804, 0, 1, 1,
0.7573629, -0.7386285, 3.01565, 0.654902, 0, 1, 1,
0.7620115, -0.6283721, 0.7350712, 0.6627451, 0, 1, 1,
0.7700643, -0.1214416, 0.8424538, 0.6666667, 0, 1, 1,
0.7774771, 0.448468, 0.67269, 0.6745098, 0, 1, 1,
0.7786325, -0.7208484, 3.052956, 0.6784314, 0, 1, 1,
0.7834628, 2.684476, -0.8412834, 0.6862745, 0, 1, 1,
0.7875119, 1.15749, 2.15012, 0.6901961, 0, 1, 1,
0.7890886, 0.8944047, 0.9126207, 0.6980392, 0, 1, 1,
0.7920114, -1.564232, 1.637695, 0.7058824, 0, 1, 1,
0.7925089, 0.4150714, -0.06575227, 0.7098039, 0, 1, 1,
0.7926283, 1.114157, -0.7776618, 0.7176471, 0, 1, 1,
0.7949928, 0.5465674, 2.219808, 0.7215686, 0, 1, 1,
0.7970216, 0.4942661, 1.683936, 0.7294118, 0, 1, 1,
0.8030407, -2.15593, 3.033782, 0.7333333, 0, 1, 1,
0.8063157, -0.2734796, 0.1235601, 0.7411765, 0, 1, 1,
0.8065059, -0.4893975, 1.041981, 0.7450981, 0, 1, 1,
0.8091263, 0.2817219, 0.3750751, 0.7529412, 0, 1, 1,
0.8104942, -0.8091376, 2.896842, 0.7568628, 0, 1, 1,
0.8113193, 2.02319, -0.8502609, 0.7647059, 0, 1, 1,
0.8114948, 1.368281, 2.070576, 0.7686275, 0, 1, 1,
0.8121228, -0.1807076, 2.611586, 0.7764706, 0, 1, 1,
0.8132238, 0.0954917, 0.8009087, 0.7803922, 0, 1, 1,
0.8168864, -0.5934663, 0.1745495, 0.7882353, 0, 1, 1,
0.8187839, -1.134618, 1.96344, 0.7921569, 0, 1, 1,
0.8203918, 0.5172331, 0.5868075, 0.8, 0, 1, 1,
0.8315737, 0.5103006, -0.2269871, 0.8078431, 0, 1, 1,
0.8331697, 0.185981, 0.05120127, 0.8117647, 0, 1, 1,
0.8415365, -0.5405691, 2.940866, 0.8196079, 0, 1, 1,
0.8419846, 0.1407189, 1.576532, 0.8235294, 0, 1, 1,
0.8422157, 0.2697715, 3.289526, 0.8313726, 0, 1, 1,
0.8424181, 2.566284, -0.3074295, 0.8352941, 0, 1, 1,
0.8468375, 1.348866, 0.732559, 0.8431373, 0, 1, 1,
0.84777, 0.2459868, 0.7841642, 0.8470588, 0, 1, 1,
0.853242, -1.639907, 3.912995, 0.854902, 0, 1, 1,
0.8554097, 0.6288483, 0.8483822, 0.8588235, 0, 1, 1,
0.8620065, 1.759204, 0.519648, 0.8666667, 0, 1, 1,
0.8644391, -1.650673, 2.856158, 0.8705882, 0, 1, 1,
0.8729037, 0.6258914, 1.289106, 0.8784314, 0, 1, 1,
0.874592, 0.8943793, 3.122254, 0.8823529, 0, 1, 1,
0.8837018, 0.3007601, 1.974607, 0.8901961, 0, 1, 1,
0.8879045, 0.7586143, -1.513152, 0.8941177, 0, 1, 1,
0.8883703, 0.8082052, -0.1443221, 0.9019608, 0, 1, 1,
0.8886566, -1.902345, 2.256941, 0.9098039, 0, 1, 1,
0.8953154, 1.018576, 1.255572, 0.9137255, 0, 1, 1,
0.8990651, 1.271168, 1.865378, 0.9215686, 0, 1, 1,
0.9113293, 0.1394956, 1.667011, 0.9254902, 0, 1, 1,
0.9123002, 1.210178, 0.4689747, 0.9333333, 0, 1, 1,
0.9125136, 0.2450084, 2.421224, 0.9372549, 0, 1, 1,
0.9132804, 0.9651, 2.33031, 0.945098, 0, 1, 1,
0.9177114, 0.8076335, 0.838268, 0.9490196, 0, 1, 1,
0.9300854, -0.9651545, 2.26228, 0.9568627, 0, 1, 1,
0.9302735, 1.319576, 2.088886, 0.9607843, 0, 1, 1,
0.9349399, 0.429863, 1.111839, 0.9686275, 0, 1, 1,
0.9374807, -0.6834148, 1.92617, 0.972549, 0, 1, 1,
0.949046, -0.2532097, 0.7041076, 0.9803922, 0, 1, 1,
0.9521487, -0.547538, 2.987189, 0.9843137, 0, 1, 1,
0.9691151, 0.4387238, 0.8125396, 0.9921569, 0, 1, 1,
0.9739932, 1.206753, 0.07886324, 0.9960784, 0, 1, 1,
0.9742568, 0.8621106, 1.425541, 1, 0, 0.9960784, 1,
0.984076, -2.236008, 1.900841, 1, 0, 0.9882353, 1,
0.9894295, -0.5286415, 0.6455588, 1, 0, 0.9843137, 1,
0.9901634, 0.6821311, 0.9206802, 1, 0, 0.9764706, 1,
0.9925148, -0.02632006, 0.1531729, 1, 0, 0.972549, 1,
0.9933894, -0.4807163, 2.88991, 1, 0, 0.9647059, 1,
0.994625, 1.972695, 1.212901, 1, 0, 0.9607843, 1,
0.9963521, 2.688001, 1.130843, 1, 0, 0.9529412, 1,
0.9998611, -0.05525212, 2.140362, 1, 0, 0.9490196, 1,
1.002507, -1.363251, 3.038787, 1, 0, 0.9411765, 1,
1.00965, 1.471086, 0.5190697, 1, 0, 0.9372549, 1,
1.015078, 1.743755, 1.267091, 1, 0, 0.9294118, 1,
1.015163, -0.8242512, 1.687733, 1, 0, 0.9254902, 1,
1.015289, 1.079647, -0.1861394, 1, 0, 0.9176471, 1,
1.018376, 0.5694453, 1.360937, 1, 0, 0.9137255, 1,
1.019239, 1.345869, -1.54383, 1, 0, 0.9058824, 1,
1.02075, 0.8953986, 0.01470163, 1, 0, 0.9019608, 1,
1.032738, 0.5812644, -1.062659, 1, 0, 0.8941177, 1,
1.039677, 0.3378203, 1.700629, 1, 0, 0.8862745, 1,
1.041604, 0.4738483, 2.53018, 1, 0, 0.8823529, 1,
1.043143, 0.02754137, -0.1777492, 1, 0, 0.8745098, 1,
1.043206, 1.114184, 2.246272, 1, 0, 0.8705882, 1,
1.057792, -0.6486928, 2.795732, 1, 0, 0.8627451, 1,
1.068358, -2.073084, 3.440383, 1, 0, 0.8588235, 1,
1.069678, -0.9522709, 1.084052, 1, 0, 0.8509804, 1,
1.070383, 0.4229038, 0.4801132, 1, 0, 0.8470588, 1,
1.074475, -0.1835161, 2.843933, 1, 0, 0.8392157, 1,
1.078927, -0.2838564, 1.592729, 1, 0, 0.8352941, 1,
1.089901, 0.8856757, 1.12029, 1, 0, 0.827451, 1,
1.094753, -0.6203033, 2.879185, 1, 0, 0.8235294, 1,
1.099028, -1.576242, 1.613892, 1, 0, 0.8156863, 1,
1.099982, -0.2596901, 1.355243, 1, 0, 0.8117647, 1,
1.101179, 0.4066669, 1.588225, 1, 0, 0.8039216, 1,
1.110134, 2.048478, -1.293895, 1, 0, 0.7960784, 1,
1.11242, 1.398924, 0.8267025, 1, 0, 0.7921569, 1,
1.114559, -1.018075, 2.441015, 1, 0, 0.7843137, 1,
1.119911, 0.7414287, -0.9890227, 1, 0, 0.7803922, 1,
1.123389, -0.2551506, -0.3520578, 1, 0, 0.772549, 1,
1.125407, -0.6057549, 2.186937, 1, 0, 0.7686275, 1,
1.127433, -1.295468, 1.614997, 1, 0, 0.7607843, 1,
1.134584, -0.1488895, 0.5228538, 1, 0, 0.7568628, 1,
1.134778, 1.02447, 0.7978497, 1, 0, 0.7490196, 1,
1.137944, 1.115547, 0.580775, 1, 0, 0.7450981, 1,
1.143127, -0.4661423, 0.2538076, 1, 0, 0.7372549, 1,
1.147499, -0.08282733, 0.237406, 1, 0, 0.7333333, 1,
1.151033, 0.01949197, 1.045046, 1, 0, 0.7254902, 1,
1.152807, 0.09225298, 0.5235947, 1, 0, 0.7215686, 1,
1.161133, 0.877444, 2.482469, 1, 0, 0.7137255, 1,
1.162703, 0.9352411, 0.8913599, 1, 0, 0.7098039, 1,
1.166981, 0.02533084, 1.379484, 1, 0, 0.7019608, 1,
1.167785, -0.4392228, 1.24898, 1, 0, 0.6941177, 1,
1.177359, 1.188787, 0.3700411, 1, 0, 0.6901961, 1,
1.18217, -0.590341, 1.324928, 1, 0, 0.682353, 1,
1.184563, -1.206723, 2.173532, 1, 0, 0.6784314, 1,
1.191397, 0.3352145, 2.383622, 1, 0, 0.6705883, 1,
1.19614, -0.4363029, 2.942096, 1, 0, 0.6666667, 1,
1.196512, 0.230123, 2.422547, 1, 0, 0.6588235, 1,
1.196524, 0.6631938, 1.736967, 1, 0, 0.654902, 1,
1.197775, -2.344802, 2.989111, 1, 0, 0.6470588, 1,
1.205172, 0.5928766, 2.491435, 1, 0, 0.6431373, 1,
1.20813, -0.154216, 1.760254, 1, 0, 0.6352941, 1,
1.21139, -1.275664, 1.644907, 1, 0, 0.6313726, 1,
1.222649, 0.1318491, 1.265249, 1, 0, 0.6235294, 1,
1.225431, 1.370666, 0.0578731, 1, 0, 0.6196079, 1,
1.229177, -1.443856, 4.52695, 1, 0, 0.6117647, 1,
1.230997, 0.9948226, 2.92244, 1, 0, 0.6078432, 1,
1.237493, 0.148835, 1.567501, 1, 0, 0.6, 1,
1.247856, -0.6270998, 2.31794, 1, 0, 0.5921569, 1,
1.251208, -2.591086, 3.17835, 1, 0, 0.5882353, 1,
1.261506, -0.09531923, 1.823498, 1, 0, 0.5803922, 1,
1.266659, -0.1876032, 1.827163, 1, 0, 0.5764706, 1,
1.268335, 1.263052, 1.103645, 1, 0, 0.5686275, 1,
1.27625, -0.4625353, 1.588184, 1, 0, 0.5647059, 1,
1.288682, 0.1505241, -0.1813592, 1, 0, 0.5568628, 1,
1.291452, 0.1158573, 0.4932328, 1, 0, 0.5529412, 1,
1.297571, 0.967662, 2.611094, 1, 0, 0.5450981, 1,
1.299725, -0.8050506, 1.954566, 1, 0, 0.5411765, 1,
1.306163, 0.5810232, 1.614325, 1, 0, 0.5333334, 1,
1.314513, -0.2777551, 1.298205, 1, 0, 0.5294118, 1,
1.318562, 0.4330876, 0.2306288, 1, 0, 0.5215687, 1,
1.319981, 1.258024, 2.035151, 1, 0, 0.5176471, 1,
1.332696, -0.4827811, 4.316494, 1, 0, 0.509804, 1,
1.334005, 1.282214, 0.7637199, 1, 0, 0.5058824, 1,
1.340334, 0.704919, 2.516221, 1, 0, 0.4980392, 1,
1.343208, -0.913184, 0.8556309, 1, 0, 0.4901961, 1,
1.343427, -0.02974601, -0.06970837, 1, 0, 0.4862745, 1,
1.345163, 0.02627863, 2.471767, 1, 0, 0.4784314, 1,
1.355446, 0.2657577, 1.448828, 1, 0, 0.4745098, 1,
1.359756, -1.16315, 2.684323, 1, 0, 0.4666667, 1,
1.368841, -1.117615, 2.581278, 1, 0, 0.4627451, 1,
1.371894, 0.6663295, 1.763166, 1, 0, 0.454902, 1,
1.379642, -0.2906644, 2.723604, 1, 0, 0.4509804, 1,
1.382789, 1.836994, 1.847884, 1, 0, 0.4431373, 1,
1.385368, -0.6082789, -0.6116533, 1, 0, 0.4392157, 1,
1.38599, 0.05111581, 3.054948, 1, 0, 0.4313726, 1,
1.393058, 0.01755335, 2.904677, 1, 0, 0.427451, 1,
1.394962, -0.02949738, 2.446552, 1, 0, 0.4196078, 1,
1.397573, 1.50324, 0.8168054, 1, 0, 0.4156863, 1,
1.407813, -2.250318, 3.200315, 1, 0, 0.4078431, 1,
1.418258, 0.2555201, 2.020459, 1, 0, 0.4039216, 1,
1.419053, -1.155287, 0.3886287, 1, 0, 0.3960784, 1,
1.422903, 0.5462421, 2.515172, 1, 0, 0.3882353, 1,
1.424562, -0.2970328, 0.5527307, 1, 0, 0.3843137, 1,
1.428409, 0.4804948, 0.7673743, 1, 0, 0.3764706, 1,
1.432062, -1.196761, 2.019269, 1, 0, 0.372549, 1,
1.432271, -0.0787691, 0.745019, 1, 0, 0.3647059, 1,
1.445444, 0.977914, 0.6412002, 1, 0, 0.3607843, 1,
1.498268, -1.119669, 3.03181, 1, 0, 0.3529412, 1,
1.525224, -1.276053, 1.875161, 1, 0, 0.3490196, 1,
1.526386, -0.1396624, 2.274711, 1, 0, 0.3411765, 1,
1.557814, -0.7675055, 2.743475, 1, 0, 0.3372549, 1,
1.571134, 0.5122619, 1.591732, 1, 0, 0.3294118, 1,
1.578824, 1.304562, 0.4395142, 1, 0, 0.3254902, 1,
1.581235, 0.4485876, 1.384239, 1, 0, 0.3176471, 1,
1.583484, -1.385123, 1.413894, 1, 0, 0.3137255, 1,
1.583971, -0.1274395, 2.549479, 1, 0, 0.3058824, 1,
1.589833, 0.1344252, 0.7448078, 1, 0, 0.2980392, 1,
1.600164, 0.1942159, 2.021081, 1, 0, 0.2941177, 1,
1.601901, -0.9394467, 2.684289, 1, 0, 0.2862745, 1,
1.61305, 2.335072, 2.270702, 1, 0, 0.282353, 1,
1.622324, -0.8931929, 3.175757, 1, 0, 0.2745098, 1,
1.637859, 0.04190718, 1.807643, 1, 0, 0.2705882, 1,
1.644847, 1.564816, -0.2431767, 1, 0, 0.2627451, 1,
1.675945, -0.7755155, 2.963473, 1, 0, 0.2588235, 1,
1.68523, -0.3517446, 0.5661864, 1, 0, 0.2509804, 1,
1.697368, 1.574496, 0.6316116, 1, 0, 0.2470588, 1,
1.710702, 0.4063374, 1.454047, 1, 0, 0.2392157, 1,
1.711457, 0.6523961, -0.2370712, 1, 0, 0.2352941, 1,
1.778574, -1.060952, 0.6846386, 1, 0, 0.227451, 1,
1.784707, -0.3314695, 3.317148, 1, 0, 0.2235294, 1,
1.79536, -0.7962265, 2.192477, 1, 0, 0.2156863, 1,
1.802457, -0.06751585, 0.3418077, 1, 0, 0.2117647, 1,
1.813802, -0.04764408, 1.231385, 1, 0, 0.2039216, 1,
1.815356, -0.375839, 1.557009, 1, 0, 0.1960784, 1,
1.830961, 1.040608, 0.7656465, 1, 0, 0.1921569, 1,
1.852612, -0.3630806, 1.233279, 1, 0, 0.1843137, 1,
1.854169, -0.6909032, 0.02183423, 1, 0, 0.1803922, 1,
1.854509, -1.16532, 0.2667824, 1, 0, 0.172549, 1,
1.872545, -3.159225, 0.03099565, 1, 0, 0.1686275, 1,
1.907213, -2.349204, 0.180471, 1, 0, 0.1607843, 1,
1.914707, 0.9757895, 0.05014865, 1, 0, 0.1568628, 1,
1.916292, 0.2808226, -0.1415799, 1, 0, 0.1490196, 1,
1.920178, 0.02367508, 1.604303, 1, 0, 0.145098, 1,
1.951486, -2.797109, 3.911195, 1, 0, 0.1372549, 1,
1.979086, -0.2296226, 0.5939937, 1, 0, 0.1333333, 1,
1.980961, 0.8242548, 0.2933291, 1, 0, 0.1254902, 1,
2.007455, -0.5553944, 4.000055, 1, 0, 0.1215686, 1,
2.009465, 1.207797, 2.916349, 1, 0, 0.1137255, 1,
2.047313, 1.262972, 0.1143117, 1, 0, 0.1098039, 1,
2.114166, 0.4828966, 2.317029, 1, 0, 0.1019608, 1,
2.120809, 0.8300886, -0.1491967, 1, 0, 0.09411765, 1,
2.156697, 2.123338, 2.08568, 1, 0, 0.09019608, 1,
2.180815, 0.6343896, 2.886819, 1, 0, 0.08235294, 1,
2.224705, -1.094164, 2.496982, 1, 0, 0.07843138, 1,
2.304029, 0.6421395, 0.9969178, 1, 0, 0.07058824, 1,
2.329419, -0.9992701, 0.7360281, 1, 0, 0.06666667, 1,
2.340907, -0.9554784, 0.9130048, 1, 0, 0.05882353, 1,
2.377234, -1.019176, -1.247329, 1, 0, 0.05490196, 1,
2.378517, 1.442225, 0.1987801, 1, 0, 0.04705882, 1,
2.398265, 0.7177494, -0.8222016, 1, 0, 0.04313726, 1,
2.440483, -0.1694285, 1.721256, 1, 0, 0.03529412, 1,
2.558512, 0.4058713, 0.7643516, 1, 0, 0.03137255, 1,
2.599266, 0.4435963, 1.380739, 1, 0, 0.02352941, 1,
2.605377, 0.4240676, 3.142951, 1, 0, 0.01960784, 1,
2.850557, 0.6440079, 1.199614, 1, 0, 0.01176471, 1,
3.364192, -0.8474705, 2.989608, 1, 0, 0.007843138, 1
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
-0.05232227, -4.174109, -7.415421, 0, -0.5, 0.5, 0.5,
-0.05232227, -4.174109, -7.415421, 1, -0.5, 0.5, 0.5,
-0.05232227, -4.174109, -7.415421, 1, 1.5, 0.5, 0.5,
-0.05232227, -4.174109, -7.415421, 0, 1.5, 0.5, 0.5
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
-4.627036, -0.1654691, -7.415421, 0, -0.5, 0.5, 0.5,
-4.627036, -0.1654691, -7.415421, 1, -0.5, 0.5, 0.5,
-4.627036, -0.1654691, -7.415421, 1, 1.5, 0.5, 0.5,
-4.627036, -0.1654691, -7.415421, 0, 1.5, 0.5, 0.5
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
-4.627036, -4.174109, -0.4211707, 0, -0.5, 0.5, 0.5,
-4.627036, -4.174109, -0.4211707, 1, -0.5, 0.5, 0.5,
-4.627036, -4.174109, -0.4211707, 1, 1.5, 0.5, 0.5,
-4.627036, -4.174109, -0.4211707, 0, 1.5, 0.5, 0.5
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
-3, -3.249038, -5.801363,
3, -3.249038, -5.801363,
-3, -3.249038, -5.801363,
-3, -3.403217, -6.070373,
-2, -3.249038, -5.801363,
-2, -3.403217, -6.070373,
-1, -3.249038, -5.801363,
-1, -3.403217, -6.070373,
0, -3.249038, -5.801363,
0, -3.403217, -6.070373,
1, -3.249038, -5.801363,
1, -3.403217, -6.070373,
2, -3.249038, -5.801363,
2, -3.403217, -6.070373,
3, -3.249038, -5.801363,
3, -3.403217, -6.070373
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
-3, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
-3, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
-3, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
-3, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
-2, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
-2, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
-2, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
-2, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
-1, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
-1, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
-1, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
-1, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
0, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
0, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
0, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
0, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
1, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
1, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
1, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
1, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
2, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
2, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
2, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
2, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5,
3, -3.711574, -6.608392, 0, -0.5, 0.5, 0.5,
3, -3.711574, -6.608392, 1, -0.5, 0.5, 0.5,
3, -3.711574, -6.608392, 1, 1.5, 0.5, 0.5,
3, -3.711574, -6.608392, 0, 1.5, 0.5, 0.5
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
-3.571332, -3, -5.801363,
-3.571332, 2, -5.801363,
-3.571332, -3, -5.801363,
-3.747283, -3, -6.070373,
-3.571332, -2, -5.801363,
-3.747283, -2, -6.070373,
-3.571332, -1, -5.801363,
-3.747283, -1, -6.070373,
-3.571332, 0, -5.801363,
-3.747283, 0, -6.070373,
-3.571332, 1, -5.801363,
-3.747283, 1, -6.070373,
-3.571332, 2, -5.801363,
-3.747283, 2, -6.070373
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
-4.099184, -3, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, -3, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, -3, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, -3, -6.608392, 0, 1.5, 0.5, 0.5,
-4.099184, -2, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, -2, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, -2, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, -2, -6.608392, 0, 1.5, 0.5, 0.5,
-4.099184, -1, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, -1, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, -1, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, -1, -6.608392, 0, 1.5, 0.5, 0.5,
-4.099184, 0, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, 0, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, 0, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, 0, -6.608392, 0, 1.5, 0.5, 0.5,
-4.099184, 1, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, 1, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, 1, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, 1, -6.608392, 0, 1.5, 0.5, 0.5,
-4.099184, 2, -6.608392, 0, -0.5, 0.5, 0.5,
-4.099184, 2, -6.608392, 1, -0.5, 0.5, 0.5,
-4.099184, 2, -6.608392, 1, 1.5, 0.5, 0.5,
-4.099184, 2, -6.608392, 0, 1.5, 0.5, 0.5
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
-3.571332, -3.249038, -4,
-3.571332, -3.249038, 4,
-3.571332, -3.249038, -4,
-3.747283, -3.403217, -4,
-3.571332, -3.249038, -2,
-3.747283, -3.403217, -2,
-3.571332, -3.249038, 0,
-3.747283, -3.403217, 0,
-3.571332, -3.249038, 2,
-3.747283, -3.403217, 2,
-3.571332, -3.249038, 4,
-3.747283, -3.403217, 4
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
-4.099184, -3.711574, -4, 0, -0.5, 0.5, 0.5,
-4.099184, -3.711574, -4, 1, -0.5, 0.5, 0.5,
-4.099184, -3.711574, -4, 1, 1.5, 0.5, 0.5,
-4.099184, -3.711574, -4, 0, 1.5, 0.5, 0.5,
-4.099184, -3.711574, -2, 0, -0.5, 0.5, 0.5,
-4.099184, -3.711574, -2, 1, -0.5, 0.5, 0.5,
-4.099184, -3.711574, -2, 1, 1.5, 0.5, 0.5,
-4.099184, -3.711574, -2, 0, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 0, 0, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 0, 1, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 0, 1, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 0, 0, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 2, 0, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 2, 1, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 2, 1, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 2, 0, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 4, 0, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 4, 1, -0.5, 0.5, 0.5,
-4.099184, -3.711574, 4, 1, 1.5, 0.5, 0.5,
-4.099184, -3.711574, 4, 0, 1.5, 0.5, 0.5
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
-3.571332, -3.249038, -5.801363,
-3.571332, 2.9181, -5.801363,
-3.571332, -3.249038, 4.959022,
-3.571332, 2.9181, 4.959022,
-3.571332, -3.249038, -5.801363,
-3.571332, -3.249038, 4.959022,
-3.571332, 2.9181, -5.801363,
-3.571332, 2.9181, 4.959022,
-3.571332, -3.249038, -5.801363,
3.466688, -3.249038, -5.801363,
-3.571332, -3.249038, 4.959022,
3.466688, -3.249038, 4.959022,
-3.571332, 2.9181, -5.801363,
3.466688, 2.9181, -5.801363,
-3.571332, 2.9181, 4.959022,
3.466688, 2.9181, 4.959022,
3.466688, -3.249038, -5.801363,
3.466688, 2.9181, -5.801363,
3.466688, -3.249038, 4.959022,
3.466688, 2.9181, 4.959022,
3.466688, -3.249038, -5.801363,
3.466688, -3.249038, 4.959022,
3.466688, 2.9181, -5.801363,
3.466688, 2.9181, 4.959022
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
var radius = 7.614668;
var distance = 33.87852;
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
mvMatrix.translate( 0.05232227, 0.1654691, 0.4211707 );
mvMatrix.scale( 1.169807, 1.335, 0.7651333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87852);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


