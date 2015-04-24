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
-3.018837, 0.7839782, -0.6514369, 1, 0, 0, 1,
-2.994586, 0.8098595, -1.130793, 1, 0.007843138, 0, 1,
-2.964674, -0.234032, -1.851111, 1, 0.01176471, 0, 1,
-2.944139, -0.1857758, -2.418865, 1, 0.01960784, 0, 1,
-2.841459, 0.440277, -2.989594, 1, 0.02352941, 0, 1,
-2.821063, 1.710618, -0.6961426, 1, 0.03137255, 0, 1,
-2.815593, 2.65641, -2.145767, 1, 0.03529412, 0, 1,
-2.768836, -0.2575842, -1.501232, 1, 0.04313726, 0, 1,
-2.737958, -0.4451953, -1.735496, 1, 0.04705882, 0, 1,
-2.701715, -0.9972918, -1.404088, 1, 0.05490196, 0, 1,
-2.587408, -0.8494661, -1.538578, 1, 0.05882353, 0, 1,
-2.53773, -1.363711, -1.767483, 1, 0.06666667, 0, 1,
-2.50037, 1.569317, -1.816885, 1, 0.07058824, 0, 1,
-2.476346, -0.7658083, -3.028128, 1, 0.07843138, 0, 1,
-2.434047, 0.08206319, -1.387891, 1, 0.08235294, 0, 1,
-2.415631, 0.7257739, -3.278923, 1, 0.09019608, 0, 1,
-2.318018, -0.393297, -0.7525335, 1, 0.09411765, 0, 1,
-2.295048, -0.8608162, -2.107554, 1, 0.1019608, 0, 1,
-2.294327, -0.8917543, -3.802444, 1, 0.1098039, 0, 1,
-2.266081, -1.216511, -2.027684, 1, 0.1137255, 0, 1,
-2.261091, 1.182342, -1.451908, 1, 0.1215686, 0, 1,
-2.221548, 0.2630778, -3.356676, 1, 0.1254902, 0, 1,
-2.197356, -0.3680299, 0.449973, 1, 0.1333333, 0, 1,
-2.144131, -1.035191, -3.654802, 1, 0.1372549, 0, 1,
-2.082841, 0.1843617, -0.1003319, 1, 0.145098, 0, 1,
-2.066284, 0.0683476, -1.113755, 1, 0.1490196, 0, 1,
-2.042074, -0.3726817, -0.5904157, 1, 0.1568628, 0, 1,
-2.034449, -1.000088, -3.423299, 1, 0.1607843, 0, 1,
-2.010315, -0.2636013, -0.400907, 1, 0.1686275, 0, 1,
-1.984061, -0.1559478, -0.3035379, 1, 0.172549, 0, 1,
-1.977518, 1.178403, -3.153338, 1, 0.1803922, 0, 1,
-1.954185, 0.9936057, -2.495733, 1, 0.1843137, 0, 1,
-1.94666, -0.4270288, -1.797678, 1, 0.1921569, 0, 1,
-1.94148, -0.1372254, -1.413242, 1, 0.1960784, 0, 1,
-1.936752, -0.6409903, 1.176049, 1, 0.2039216, 0, 1,
-1.933202, 0.2720383, -0.7849968, 1, 0.2117647, 0, 1,
-1.916848, 0.3310558, -1.20713, 1, 0.2156863, 0, 1,
-1.90908, 0.8606939, -1.821695, 1, 0.2235294, 0, 1,
-1.904606, -1.255961, -2.637753, 1, 0.227451, 0, 1,
-1.902812, 0.7008464, -0.3780338, 1, 0.2352941, 0, 1,
-1.891708, 1.902138, -1.759348, 1, 0.2392157, 0, 1,
-1.859421, 0.5820467, -2.101635, 1, 0.2470588, 0, 1,
-1.841017, 2.937829, -0.718944, 1, 0.2509804, 0, 1,
-1.840883, -0.6452035, -2.028322, 1, 0.2588235, 0, 1,
-1.838545, -0.3017924, -0.2239887, 1, 0.2627451, 0, 1,
-1.783149, -0.08293557, -3.860461, 1, 0.2705882, 0, 1,
-1.776884, 0.3873186, -1.01611, 1, 0.2745098, 0, 1,
-1.776667, -1.464516, -3.528818, 1, 0.282353, 0, 1,
-1.768049, -0.5690767, -3.379833, 1, 0.2862745, 0, 1,
-1.760595, 1.16888, 0.05844123, 1, 0.2941177, 0, 1,
-1.752943, -0.838249, -2.858922, 1, 0.3019608, 0, 1,
-1.728035, 0.2444224, -3.04257, 1, 0.3058824, 0, 1,
-1.712732, 0.4160802, -0.4975306, 1, 0.3137255, 0, 1,
-1.711589, -0.5596799, -1.246371, 1, 0.3176471, 0, 1,
-1.705595, -0.6225414, -1.869846, 1, 0.3254902, 0, 1,
-1.667154, 0.2686083, -0.5939841, 1, 0.3294118, 0, 1,
-1.66691, -0.1487563, -1.412015, 1, 0.3372549, 0, 1,
-1.662649, 0.2020271, -2.599541, 1, 0.3411765, 0, 1,
-1.653769, 2.049148, 0.02282815, 1, 0.3490196, 0, 1,
-1.643717, -0.6439561, -2.506855, 1, 0.3529412, 0, 1,
-1.640635, 1.746596, -1.189759, 1, 0.3607843, 0, 1,
-1.640021, 0.5579402, -0.2593872, 1, 0.3647059, 0, 1,
-1.636334, -0.4834808, -0.9007151, 1, 0.372549, 0, 1,
-1.633682, 0.5128065, -1.185878, 1, 0.3764706, 0, 1,
-1.624702, -0.295807, -1.72314, 1, 0.3843137, 0, 1,
-1.618468, -1.175062, -2.2962, 1, 0.3882353, 0, 1,
-1.616749, -0.6712706, -1.365777, 1, 0.3960784, 0, 1,
-1.611193, -0.1583786, -2.601211, 1, 0.4039216, 0, 1,
-1.608545, 0.2829264, -0.8101156, 1, 0.4078431, 0, 1,
-1.60221, 0.4616504, -0.1954303, 1, 0.4156863, 0, 1,
-1.599608, -0.292433, -0.8041156, 1, 0.4196078, 0, 1,
-1.590231, 2.214602, -0.8112062, 1, 0.427451, 0, 1,
-1.574041, -0.0009629868, -1.247818, 1, 0.4313726, 0, 1,
-1.563998, -1.914103, -2.262266, 1, 0.4392157, 0, 1,
-1.563415, -1.902673, -4.16296, 1, 0.4431373, 0, 1,
-1.551986, 1.075646, 0.04370455, 1, 0.4509804, 0, 1,
-1.546958, -0.5236196, -1.742149, 1, 0.454902, 0, 1,
-1.539999, 0.7671139, -1.828424, 1, 0.4627451, 0, 1,
-1.539535, 2.430395, -2.145159, 1, 0.4666667, 0, 1,
-1.53853, 1.430915, -2.921715, 1, 0.4745098, 0, 1,
-1.500259, 1.115316, -1.412853, 1, 0.4784314, 0, 1,
-1.498454, -0.3416741, -0.324798, 1, 0.4862745, 0, 1,
-1.484084, 0.948464, 0.1052484, 1, 0.4901961, 0, 1,
-1.47692, 0.9266635, 0.167655, 1, 0.4980392, 0, 1,
-1.474958, -0.5463275, -2.167723, 1, 0.5058824, 0, 1,
-1.460005, -0.4040942, -4.133152, 1, 0.509804, 0, 1,
-1.457145, -1.360022, -2.764911, 1, 0.5176471, 0, 1,
-1.429655, -0.4605089, -2.062348, 1, 0.5215687, 0, 1,
-1.422182, -2.022896, -2.406171, 1, 0.5294118, 0, 1,
-1.417729, -1.001711, -3.228654, 1, 0.5333334, 0, 1,
-1.413739, 0.126737, -1.890934, 1, 0.5411765, 0, 1,
-1.386109, -1.501223, -0.8566657, 1, 0.5450981, 0, 1,
-1.376012, -0.2386566, -2.072356, 1, 0.5529412, 0, 1,
-1.360949, -0.3906129, -2.520195, 1, 0.5568628, 0, 1,
-1.358552, 0.6106696, 0.1160972, 1, 0.5647059, 0, 1,
-1.338093, -0.5004547, -2.648505, 1, 0.5686275, 0, 1,
-1.332847, 1.083476, -0.1663601, 1, 0.5764706, 0, 1,
-1.322344, 1.127785, 0.5578641, 1, 0.5803922, 0, 1,
-1.31523, -1.08634, -1.932032, 1, 0.5882353, 0, 1,
-1.31004, 0.6764343, -2.044177, 1, 0.5921569, 0, 1,
-1.308341, 0.5471057, 0.6279688, 1, 0.6, 0, 1,
-1.307376, 0.0492369, -2.141324, 1, 0.6078432, 0, 1,
-1.304351, -1.098126, -3.137528, 1, 0.6117647, 0, 1,
-1.294112, -0.5021706, -4.581196, 1, 0.6196079, 0, 1,
-1.293651, 0.7673879, -2.24728, 1, 0.6235294, 0, 1,
-1.287951, 0.9103726, -0.1097601, 1, 0.6313726, 0, 1,
-1.276028, -0.394456, -3.735878, 1, 0.6352941, 0, 1,
-1.267869, -0.05135811, -1.260722, 1, 0.6431373, 0, 1,
-1.248289, -1.023687, -0.6820273, 1, 0.6470588, 0, 1,
-1.242451, -0.3603938, -3.368037, 1, 0.654902, 0, 1,
-1.238993, -0.4857006, -3.348297, 1, 0.6588235, 0, 1,
-1.238167, 0.09158291, -3.303136, 1, 0.6666667, 0, 1,
-1.234269, 0.9564068, 0.710435, 1, 0.6705883, 0, 1,
-1.226169, -0.7901667, -2.647404, 1, 0.6784314, 0, 1,
-1.218457, -0.3153978, -0.5378042, 1, 0.682353, 0, 1,
-1.216616, 0.4865316, -0.2209038, 1, 0.6901961, 0, 1,
-1.199618, -0.1716929, -2.267048, 1, 0.6941177, 0, 1,
-1.194065, 0.01013953, -1.225384, 1, 0.7019608, 0, 1,
-1.190713, 0.3822761, -2.129094, 1, 0.7098039, 0, 1,
-1.188602, 0.9176867, -2.147642, 1, 0.7137255, 0, 1,
-1.184066, 0.07427181, -2.708136, 1, 0.7215686, 0, 1,
-1.17662, -1.192604, -2.851726, 1, 0.7254902, 0, 1,
-1.168439, 0.5438235, -3.405182, 1, 0.7333333, 0, 1,
-1.166209, 1.102353, -2.146919, 1, 0.7372549, 0, 1,
-1.165561, -0.4810247, -3.13799, 1, 0.7450981, 0, 1,
-1.161896, 0.2746356, -2.525005, 1, 0.7490196, 0, 1,
-1.150483, 0.3660763, -2.462857, 1, 0.7568628, 0, 1,
-1.135216, 0.8352965, -1.837785, 1, 0.7607843, 0, 1,
-1.123229, 1.121522, -0.9120508, 1, 0.7686275, 0, 1,
-1.122433, 0.5014818, -0.7173287, 1, 0.772549, 0, 1,
-1.120042, 0.7556455, -2.162642, 1, 0.7803922, 0, 1,
-1.113506, 1.22663, -2.638883, 1, 0.7843137, 0, 1,
-1.110214, -0.1254559, -0.8709613, 1, 0.7921569, 0, 1,
-1.110075, -1.181677, -1.762222, 1, 0.7960784, 0, 1,
-1.10748, -0.3247193, -1.481695, 1, 0.8039216, 0, 1,
-1.105446, -0.8113098, -3.227911, 1, 0.8117647, 0, 1,
-1.103581, 0.3924553, 0.3379351, 1, 0.8156863, 0, 1,
-1.093759, 0.5345871, -0.4961652, 1, 0.8235294, 0, 1,
-1.087232, 0.02077682, -1.934322, 1, 0.827451, 0, 1,
-1.076958, 1.019552, -0.5530103, 1, 0.8352941, 0, 1,
-1.069802, 0.09397093, -3.105225, 1, 0.8392157, 0, 1,
-1.06878, 1.208706, 0.5184855, 1, 0.8470588, 0, 1,
-1.06561, -0.1284516, -1.212607, 1, 0.8509804, 0, 1,
-1.065026, -0.3120761, -2.025668, 1, 0.8588235, 0, 1,
-1.063669, -0.46606, -1.351901, 1, 0.8627451, 0, 1,
-1.059827, -0.1060928, -0.4298849, 1, 0.8705882, 0, 1,
-1.059791, -0.2537392, -1.226815, 1, 0.8745098, 0, 1,
-1.057497, 1.435668, -0.6181638, 1, 0.8823529, 0, 1,
-1.054321, -0.8178705, -1.333957, 1, 0.8862745, 0, 1,
-1.048598, 1.693209, -0.311265, 1, 0.8941177, 0, 1,
-1.045685, 1.846686, -2.280725, 1, 0.8980392, 0, 1,
-1.03538, -0.6912216, -3.980994, 1, 0.9058824, 0, 1,
-1.033042, -2.795722, -2.84457, 1, 0.9137255, 0, 1,
-1.029657, 0.2969407, -1.361946, 1, 0.9176471, 0, 1,
-1.026989, -0.4400069, -1.292598, 1, 0.9254902, 0, 1,
-1.025687, 1.114293, -1.083766, 1, 0.9294118, 0, 1,
-1.018121, 0.2261435, -2.703687, 1, 0.9372549, 0, 1,
-1.016263, 1.334325, -0.8843408, 1, 0.9411765, 0, 1,
-1.016243, 0.2378752, -0.2769297, 1, 0.9490196, 0, 1,
-1.01619, -0.8234474, -3.877009, 1, 0.9529412, 0, 1,
-1.013845, -0.2770608, -4.059916, 1, 0.9607843, 0, 1,
-1.007541, 0.01311631, -2.357486, 1, 0.9647059, 0, 1,
-1.006365, 0.567044, -0.4236106, 1, 0.972549, 0, 1,
-1.003601, -0.8878224, -3.630818, 1, 0.9764706, 0, 1,
-0.9987344, 0.007337887, -2.47648, 1, 0.9843137, 0, 1,
-0.9933111, -0.4126436, -1.609643, 1, 0.9882353, 0, 1,
-0.9733919, -0.2418604, -1.072839, 1, 0.9960784, 0, 1,
-0.9727634, -0.367865, -1.768636, 0.9960784, 1, 0, 1,
-0.9671737, -0.263962, -0.7700521, 0.9921569, 1, 0, 1,
-0.9569339, 1.481567, -0.5446659, 0.9843137, 1, 0, 1,
-0.9473323, -1.748996, -3.338608, 0.9803922, 1, 0, 1,
-0.9372734, 0.9452211, -1.348206, 0.972549, 1, 0, 1,
-0.9343482, 0.854883, -1.089994, 0.9686275, 1, 0, 1,
-0.9212381, -0.3681915, -2.005248, 0.9607843, 1, 0, 1,
-0.9171008, -1.563906, -2.599709, 0.9568627, 1, 0, 1,
-0.9126647, 1.166015, -1.870118, 0.9490196, 1, 0, 1,
-0.9088395, -0.3229967, -0.3622825, 0.945098, 1, 0, 1,
-0.9041775, -0.3961022, -1.766511, 0.9372549, 1, 0, 1,
-0.9010784, -1.214251, -1.291272, 0.9333333, 1, 0, 1,
-0.8997965, 1.351711, 0.6051973, 0.9254902, 1, 0, 1,
-0.8988733, -3.595892, -3.665724, 0.9215686, 1, 0, 1,
-0.8969254, -0.0006167707, -1.185965, 0.9137255, 1, 0, 1,
-0.8725379, -0.0169955, -0.7592471, 0.9098039, 1, 0, 1,
-0.872132, -0.5389651, -2.065, 0.9019608, 1, 0, 1,
-0.8715771, 0.6562212, -0.4083344, 0.8941177, 1, 0, 1,
-0.869294, -0.8785526, -1.31535, 0.8901961, 1, 0, 1,
-0.8658664, -0.6039278, -2.593299, 0.8823529, 1, 0, 1,
-0.8619463, -1.587882, -0.9806947, 0.8784314, 1, 0, 1,
-0.8524765, 0.001330822, -0.9573056, 0.8705882, 1, 0, 1,
-0.8478325, -0.9095808, -2.457911, 0.8666667, 1, 0, 1,
-0.8415067, -0.5194855, -2.770462, 0.8588235, 1, 0, 1,
-0.8413172, -1.276779, -2.824033, 0.854902, 1, 0, 1,
-0.8409169, 0.3288098, -1.034117, 0.8470588, 1, 0, 1,
-0.8349614, 1.105709, 0.3923598, 0.8431373, 1, 0, 1,
-0.8234159, 1.181315, -1.271081, 0.8352941, 1, 0, 1,
-0.8174469, 0.4507368, -2.771752, 0.8313726, 1, 0, 1,
-0.8138226, 0.3877442, 0.5589316, 0.8235294, 1, 0, 1,
-0.8091918, 0.7167519, -0.5336537, 0.8196079, 1, 0, 1,
-0.8079274, 0.5212677, -1.585707, 0.8117647, 1, 0, 1,
-0.7974226, -0.4676509, -1.670348, 0.8078431, 1, 0, 1,
-0.788199, -0.3059475, -2.025068, 0.8, 1, 0, 1,
-0.7808693, -0.6562061, -3.231275, 0.7921569, 1, 0, 1,
-0.7792139, -0.2875794, 0.1647601, 0.7882353, 1, 0, 1,
-0.7791617, 0.5074668, 0.8357514, 0.7803922, 1, 0, 1,
-0.7757081, -0.6826605, -2.146446, 0.7764706, 1, 0, 1,
-0.7738759, -1.715804, -2.561444, 0.7686275, 1, 0, 1,
-0.7679753, 0.4675848, -1.045604, 0.7647059, 1, 0, 1,
-0.7677557, -1.121949, -1.5636, 0.7568628, 1, 0, 1,
-0.7665553, -2.50955, -1.553237, 0.7529412, 1, 0, 1,
-0.7655752, -0.1165018, -1.991651, 0.7450981, 1, 0, 1,
-0.7636849, -1.322729, -1.758873, 0.7411765, 1, 0, 1,
-0.7612574, 0.8150791, -0.5322604, 0.7333333, 1, 0, 1,
-0.7606565, 0.6535559, -1.46626, 0.7294118, 1, 0, 1,
-0.7589506, 0.7363114, -1.405268, 0.7215686, 1, 0, 1,
-0.7571422, 0.1029335, -2.189847, 0.7176471, 1, 0, 1,
-0.7555068, 0.1557508, -0.8904663, 0.7098039, 1, 0, 1,
-0.7517824, 1.112872, -0.3014785, 0.7058824, 1, 0, 1,
-0.7508656, 1.446884, -0.5281381, 0.6980392, 1, 0, 1,
-0.7475179, 0.4943866, 0.05904034, 0.6901961, 1, 0, 1,
-0.7462547, 0.4132894, -1.999362, 0.6862745, 1, 0, 1,
-0.7445612, 0.4704549, -2.506894, 0.6784314, 1, 0, 1,
-0.7371712, 1.684359, -1.102795, 0.6745098, 1, 0, 1,
-0.7354569, 1.061593, -2.393589, 0.6666667, 1, 0, 1,
-0.7334871, 0.007387878, -2.348811, 0.6627451, 1, 0, 1,
-0.731557, -1.132446, -1.255645, 0.654902, 1, 0, 1,
-0.7237536, -0.3345553, -0.05212803, 0.6509804, 1, 0, 1,
-0.7212296, 2.492704, 1.054196, 0.6431373, 1, 0, 1,
-0.7174401, 0.09619816, -1.946058, 0.6392157, 1, 0, 1,
-0.7137137, 1.733509, 1.422559, 0.6313726, 1, 0, 1,
-0.7080418, 0.0001474162, -1.767552, 0.627451, 1, 0, 1,
-0.7079678, 0.7175828, -0.9675574, 0.6196079, 1, 0, 1,
-0.70701, 0.6872387, -1.928905, 0.6156863, 1, 0, 1,
-0.706524, 0.5977554, -0.2649124, 0.6078432, 1, 0, 1,
-0.6968815, -0.7540946, -1.687378, 0.6039216, 1, 0, 1,
-0.6946558, 0.06127915, -0.8399176, 0.5960785, 1, 0, 1,
-0.6922063, 0.6970817, -0.6453149, 0.5882353, 1, 0, 1,
-0.6901591, 0.5341483, -1.160185, 0.5843138, 1, 0, 1,
-0.6899618, -0.4643994, -2.655075, 0.5764706, 1, 0, 1,
-0.6886247, -1.355025, -2.674977, 0.572549, 1, 0, 1,
-0.6869602, -1.397764, -3.275673, 0.5647059, 1, 0, 1,
-0.6832947, 2.122186, -0.3280086, 0.5607843, 1, 0, 1,
-0.6770645, -1.664573, -3.155574, 0.5529412, 1, 0, 1,
-0.6739318, -1.051776, -2.438636, 0.5490196, 1, 0, 1,
-0.6716565, 1.469198, -1.121465, 0.5411765, 1, 0, 1,
-0.6703157, -0.7451221, -1.851103, 0.5372549, 1, 0, 1,
-0.669437, -0.4904949, -2.768926, 0.5294118, 1, 0, 1,
-0.6677773, -0.4113415, -2.154286, 0.5254902, 1, 0, 1,
-0.6639487, -0.1742844, -3.717655, 0.5176471, 1, 0, 1,
-0.6613967, 1.018286, -1.66956, 0.5137255, 1, 0, 1,
-0.6607769, -1.698284, -3.62078, 0.5058824, 1, 0, 1,
-0.6603419, -0.437993, -2.22905, 0.5019608, 1, 0, 1,
-0.6539604, -0.932695, -5.18299, 0.4941176, 1, 0, 1,
-0.6535459, 0.8440657, -0.6889257, 0.4862745, 1, 0, 1,
-0.6493797, -0.1288003, -2.845066, 0.4823529, 1, 0, 1,
-0.6441432, -2.768919, -1.341963, 0.4745098, 1, 0, 1,
-0.6440653, -0.7258886, -2.762191, 0.4705882, 1, 0, 1,
-0.6396421, 0.7121028, 0.5984144, 0.4627451, 1, 0, 1,
-0.6379836, 0.7141168, -1.342527, 0.4588235, 1, 0, 1,
-0.637727, 0.9245982, 0.4865349, 0.4509804, 1, 0, 1,
-0.6320863, 0.2311679, -1.685969, 0.4470588, 1, 0, 1,
-0.6248913, -0.3852564, -1.305932, 0.4392157, 1, 0, 1,
-0.6239564, -1.077486, -2.483985, 0.4352941, 1, 0, 1,
-0.6234332, 0.8616313, 1.382516, 0.427451, 1, 0, 1,
-0.6226597, 2.617778, -0.8669814, 0.4235294, 1, 0, 1,
-0.6209731, 1.264237, -2.079957, 0.4156863, 1, 0, 1,
-0.6202527, 0.1038712, 0.01288685, 0.4117647, 1, 0, 1,
-0.6127497, 0.9892003, 0.120149, 0.4039216, 1, 0, 1,
-0.6090171, 1.000324, -0.254388, 0.3960784, 1, 0, 1,
-0.6088318, -0.8487468, -2.210856, 0.3921569, 1, 0, 1,
-0.6043563, 0.5381734, 0.6619283, 0.3843137, 1, 0, 1,
-0.5916564, -0.7359135, -0.8072305, 0.3803922, 1, 0, 1,
-0.5905337, -0.4921799, -1.098641, 0.372549, 1, 0, 1,
-0.5897262, 1.17571, -0.2743243, 0.3686275, 1, 0, 1,
-0.587213, -0.5471447, -3.139549, 0.3607843, 1, 0, 1,
-0.5850059, 0.4786812, -1.115627, 0.3568628, 1, 0, 1,
-0.5826626, 0.5880159, -0.2090102, 0.3490196, 1, 0, 1,
-0.5809299, -0.4681546, -2.244048, 0.345098, 1, 0, 1,
-0.5792536, -0.5083073, -2.662798, 0.3372549, 1, 0, 1,
-0.5757727, -0.4770107, -3.371981, 0.3333333, 1, 0, 1,
-0.5736554, 0.2055021, -1.80512, 0.3254902, 1, 0, 1,
-0.5657753, 0.1300609, -1.274978, 0.3215686, 1, 0, 1,
-0.5656382, -1.410434, -3.276827, 0.3137255, 1, 0, 1,
-0.5607185, 1.177712, 0.6054282, 0.3098039, 1, 0, 1,
-0.5551144, 0.01969221, -2.045314, 0.3019608, 1, 0, 1,
-0.5505072, 0.2567627, -0.8090203, 0.2941177, 1, 0, 1,
-0.5459637, 1.079236, -0.6874765, 0.2901961, 1, 0, 1,
-0.5431581, -0.1668055, -1.386503, 0.282353, 1, 0, 1,
-0.5382363, 0.02500439, -2.194319, 0.2784314, 1, 0, 1,
-0.5334102, -0.3586997, -1.560535, 0.2705882, 1, 0, 1,
-0.5324222, -0.1262149, -1.933769, 0.2666667, 1, 0, 1,
-0.5306465, 0.1859523, -3.726287, 0.2588235, 1, 0, 1,
-0.5302224, 0.3610097, -2.167997, 0.254902, 1, 0, 1,
-0.5285937, 0.274578, -0.5396625, 0.2470588, 1, 0, 1,
-0.5264274, -1.873735, -3.713424, 0.2431373, 1, 0, 1,
-0.5263615, -0.06422273, -1.73201, 0.2352941, 1, 0, 1,
-0.5259645, -0.1423908, -0.3440701, 0.2313726, 1, 0, 1,
-0.5254261, -0.8641192, -1.875242, 0.2235294, 1, 0, 1,
-0.520115, 1.22273, -1.134698, 0.2196078, 1, 0, 1,
-0.5149267, -0.9840315, -1.319755, 0.2117647, 1, 0, 1,
-0.5128348, 1.180433, 1.265484, 0.2078431, 1, 0, 1,
-0.5115584, 1.026728, -1.242174, 0.2, 1, 0, 1,
-0.5046426, 0.5194873, -0.1097782, 0.1921569, 1, 0, 1,
-0.502108, 1.096734, -1.601685, 0.1882353, 1, 0, 1,
-0.5012209, 0.2245988, -2.29636, 0.1803922, 1, 0, 1,
-0.5000588, -0.6110145, -1.896035, 0.1764706, 1, 0, 1,
-0.4935359, 1.285568, -1.70491, 0.1686275, 1, 0, 1,
-0.4917376, 1.532886, -0.5722241, 0.1647059, 1, 0, 1,
-0.4904177, -1.736495, -1.474256, 0.1568628, 1, 0, 1,
-0.4901691, -0.481374, -3.076594, 0.1529412, 1, 0, 1,
-0.4861225, 0.5487406, 0.0585354, 0.145098, 1, 0, 1,
-0.4838216, -2.382895, -2.517884, 0.1411765, 1, 0, 1,
-0.4825241, -0.3771447, -2.160744, 0.1333333, 1, 0, 1,
-0.4819885, -0.7275296, -2.171235, 0.1294118, 1, 0, 1,
-0.4814141, 0.115713, -2.014477, 0.1215686, 1, 0, 1,
-0.4806162, 0.5423329, -1.663742, 0.1176471, 1, 0, 1,
-0.4756564, -0.03891818, -0.9762851, 0.1098039, 1, 0, 1,
-0.4753281, -0.8957413, -2.327383, 0.1058824, 1, 0, 1,
-0.4735022, -0.6355651, -1.653064, 0.09803922, 1, 0, 1,
-0.4719823, 1.17852, -0.1382622, 0.09019608, 1, 0, 1,
-0.4711044, 0.04249285, 0.4229585, 0.08627451, 1, 0, 1,
-0.4682415, 0.5005237, -2.233324, 0.07843138, 1, 0, 1,
-0.466584, 0.262735, -1.046784, 0.07450981, 1, 0, 1,
-0.4665284, 0.6763037, 0.1110618, 0.06666667, 1, 0, 1,
-0.4626092, 0.04651638, -2.386935, 0.0627451, 1, 0, 1,
-0.4607912, -1.470818, -3.383647, 0.05490196, 1, 0, 1,
-0.4601647, -1.094895, -4.01245, 0.05098039, 1, 0, 1,
-0.4591107, -0.4482769, -0.8283328, 0.04313726, 1, 0, 1,
-0.4523119, 1.280654, -0.4346741, 0.03921569, 1, 0, 1,
-0.4511239, -1.848717, -2.929292, 0.03137255, 1, 0, 1,
-0.4506271, -1.086472, -2.689952, 0.02745098, 1, 0, 1,
-0.4431752, 3.435302, 0.02063422, 0.01960784, 1, 0, 1,
-0.440211, 0.5974224, 0.04707253, 0.01568628, 1, 0, 1,
-0.4396682, -0.6157796, -2.360608, 0.007843138, 1, 0, 1,
-0.4391494, 0.3603236, -1.38938, 0.003921569, 1, 0, 1,
-0.4339811, 3.324985, -0.8231867, 0, 1, 0.003921569, 1,
-0.4321111, -0.3594184, -2.418824, 0, 1, 0.01176471, 1,
-0.429579, 0.07720833, -2.923033, 0, 1, 0.01568628, 1,
-0.4271673, -1.149664, -2.49196, 0, 1, 0.02352941, 1,
-0.4259744, -0.1077825, -1.564105, 0, 1, 0.02745098, 1,
-0.4257336, -0.6007583, -2.804264, 0, 1, 0.03529412, 1,
-0.4255482, -0.2439438, -2.70549, 0, 1, 0.03921569, 1,
-0.4245003, 0.475383, -0.4337895, 0, 1, 0.04705882, 1,
-0.4244389, 1.118213, -2.010527, 0, 1, 0.05098039, 1,
-0.4244346, 0.08797575, -2.313132, 0, 1, 0.05882353, 1,
-0.4243871, 1.491068, -0.1865931, 0, 1, 0.0627451, 1,
-0.422358, -0.03553436, -1.995749, 0, 1, 0.07058824, 1,
-0.4218572, -0.7305911, -3.616461, 0, 1, 0.07450981, 1,
-0.4201756, -0.7191198, -1.94874, 0, 1, 0.08235294, 1,
-0.4190745, 0.3178745, -2.873051, 0, 1, 0.08627451, 1,
-0.4088128, 1.399192, -0.8794922, 0, 1, 0.09411765, 1,
-0.4082439, 0.1052182, -0.05894417, 0, 1, 0.1019608, 1,
-0.4037635, 1.628317, -1.119324, 0, 1, 0.1058824, 1,
-0.403625, -1.800197, -4.577702, 0, 1, 0.1137255, 1,
-0.4026598, 0.3239695, -0.05718451, 0, 1, 0.1176471, 1,
-0.4022926, -0.3200167, -2.923369, 0, 1, 0.1254902, 1,
-0.4020209, 0.257666, -1.810358, 0, 1, 0.1294118, 1,
-0.3958535, 1.025141, 1.082388, 0, 1, 0.1372549, 1,
-0.3943842, -0.3093445, -2.395859, 0, 1, 0.1411765, 1,
-0.3914512, -0.6478316, -0.2999578, 0, 1, 0.1490196, 1,
-0.3894517, -0.2807128, -3.209979, 0, 1, 0.1529412, 1,
-0.389236, -0.0009333303, -2.237514, 0, 1, 0.1607843, 1,
-0.3877438, -1.830018, -2.622061, 0, 1, 0.1647059, 1,
-0.3871035, 0.09197764, -1.687218, 0, 1, 0.172549, 1,
-0.3848775, 1.676393, -0.1170535, 0, 1, 0.1764706, 1,
-0.3838895, -0.2450744, -1.865675, 0, 1, 0.1843137, 1,
-0.3827108, -0.02881827, -1.752774, 0, 1, 0.1882353, 1,
-0.3824297, -1.371717, -3.274686, 0, 1, 0.1960784, 1,
-0.3725429, 0.8881008, -1.150266, 0, 1, 0.2039216, 1,
-0.3707154, -1.0624, -4.612714, 0, 1, 0.2078431, 1,
-0.3661186, 0.01890734, -1.785947, 0, 1, 0.2156863, 1,
-0.3656532, 0.3833274, -0.436671, 0, 1, 0.2196078, 1,
-0.3651805, -0.5904585, -2.341194, 0, 1, 0.227451, 1,
-0.3650542, 0.956337, -1.308935, 0, 1, 0.2313726, 1,
-0.3622906, 1.229325, 1.92371, 0, 1, 0.2392157, 1,
-0.3604372, 1.0201, -1.160146, 0, 1, 0.2431373, 1,
-0.3592047, 0.703693, 0.2857366, 0, 1, 0.2509804, 1,
-0.349975, 0.3909444, 1.069203, 0, 1, 0.254902, 1,
-0.3481291, 0.2478445, 0.4994476, 0, 1, 0.2627451, 1,
-0.3461541, -1.660336, -2.431062, 0, 1, 0.2666667, 1,
-0.3459185, -1.052883, -0.5685003, 0, 1, 0.2745098, 1,
-0.3393166, 0.06945524, 0.1055832, 0, 1, 0.2784314, 1,
-0.3389893, -1.844665, -2.571696, 0, 1, 0.2862745, 1,
-0.3293793, -1.257892, -1.91833, 0, 1, 0.2901961, 1,
-0.3291945, 0.5055054, -0.8198528, 0, 1, 0.2980392, 1,
-0.3291634, -0.2895587, -3.410318, 0, 1, 0.3058824, 1,
-0.3204625, -0.05191926, -0.4462779, 0, 1, 0.3098039, 1,
-0.3128839, -1.289837, -3.801936, 0, 1, 0.3176471, 1,
-0.3093175, -0.83218, -3.350841, 0, 1, 0.3215686, 1,
-0.3027115, -1.140572, -2.022812, 0, 1, 0.3294118, 1,
-0.3009539, 0.9538104, 0.1408739, 0, 1, 0.3333333, 1,
-0.3004227, -2.98412, -4.549642, 0, 1, 0.3411765, 1,
-0.2967475, -1.016656, -2.036926, 0, 1, 0.345098, 1,
-0.2883804, -1.085467, -1.949724, 0, 1, 0.3529412, 1,
-0.2732349, -0.2869683, -1.594138, 0, 1, 0.3568628, 1,
-0.272541, 0.04457177, -1.667666, 0, 1, 0.3647059, 1,
-0.2721902, 0.3604997, -0.09949753, 0, 1, 0.3686275, 1,
-0.2613436, 3.280448, 1.738458, 0, 1, 0.3764706, 1,
-0.260367, -0.673124, -2.326339, 0, 1, 0.3803922, 1,
-0.259593, -0.6823693, -1.553903, 0, 1, 0.3882353, 1,
-0.2542163, -0.8077865, -4.423229, 0, 1, 0.3921569, 1,
-0.2534017, 0.5110856, 0.06192103, 0, 1, 0.4, 1,
-0.2442925, -1.210923, -0.8325319, 0, 1, 0.4078431, 1,
-0.2417798, -1.273274, -2.0423, 0, 1, 0.4117647, 1,
-0.2411855, -0.492387, -2.195435, 0, 1, 0.4196078, 1,
-0.2405424, 0.02517761, -1.829571, 0, 1, 0.4235294, 1,
-0.2403312, -0.2951855, -1.343621, 0, 1, 0.4313726, 1,
-0.2368156, 1.539688, 0.4451581, 0, 1, 0.4352941, 1,
-0.234105, -1.521035, -3.373976, 0, 1, 0.4431373, 1,
-0.2266718, -0.7973046, -3.019572, 0, 1, 0.4470588, 1,
-0.2247715, -0.8512931, -3.351192, 0, 1, 0.454902, 1,
-0.2246454, -0.6560548, -3.702471, 0, 1, 0.4588235, 1,
-0.2220688, -1.78944, -5.412727, 0, 1, 0.4666667, 1,
-0.2218129, 0.5861113, -1.589857, 0, 1, 0.4705882, 1,
-0.2198417, 0.7890871, -0.05188864, 0, 1, 0.4784314, 1,
-0.2187509, -0.6561932, -2.240188, 0, 1, 0.4823529, 1,
-0.2181463, -0.3746934, -2.860574, 0, 1, 0.4901961, 1,
-0.2160787, -0.1945483, -0.8068835, 0, 1, 0.4941176, 1,
-0.209311, 1.275748, -0.4742277, 0, 1, 0.5019608, 1,
-0.2059023, -1.969075, -1.283999, 0, 1, 0.509804, 1,
-0.2053891, 2.125702, 0.2687471, 0, 1, 0.5137255, 1,
-0.2024818, -0.1655245, -1.859526, 0, 1, 0.5215687, 1,
-0.2018479, -0.4958902, -3.695329, 0, 1, 0.5254902, 1,
-0.1981004, -1.477223, -1.53125, 0, 1, 0.5333334, 1,
-0.195864, -0.3526377, -2.481941, 0, 1, 0.5372549, 1,
-0.186942, -0.8265738, -2.42935, 0, 1, 0.5450981, 1,
-0.1834953, 0.7110883, -0.6567956, 0, 1, 0.5490196, 1,
-0.1820727, -1.395619, -2.486739, 0, 1, 0.5568628, 1,
-0.1805811, -0.3983845, -4.132426, 0, 1, 0.5607843, 1,
-0.1776776, 0.435343, -1.266123, 0, 1, 0.5686275, 1,
-0.1773439, 1.37059, 1.968136, 0, 1, 0.572549, 1,
-0.175965, 1.498446, 1.009835, 0, 1, 0.5803922, 1,
-0.170303, -1.084319, -1.60121, 0, 1, 0.5843138, 1,
-0.166391, -0.6481706, -5.056039, 0, 1, 0.5921569, 1,
-0.1588692, -0.507038, 0.001140997, 0, 1, 0.5960785, 1,
-0.1584163, 0.6191239, -1.416379, 0, 1, 0.6039216, 1,
-0.1583893, 0.6028283, 0.1435701, 0, 1, 0.6117647, 1,
-0.1533296, -1.406846, -2.368913, 0, 1, 0.6156863, 1,
-0.1494763, 0.7376836, 0.4314167, 0, 1, 0.6235294, 1,
-0.1493101, -1.118828, -3.216221, 0, 1, 0.627451, 1,
-0.1486719, -0.4421838, -2.547049, 0, 1, 0.6352941, 1,
-0.1467341, 0.6264508, -0.01417601, 0, 1, 0.6392157, 1,
-0.1428266, 0.1888877, -0.1266924, 0, 1, 0.6470588, 1,
-0.1408122, -3.037737, -1.254745, 0, 1, 0.6509804, 1,
-0.1394958, -0.9362463, -1.846216, 0, 1, 0.6588235, 1,
-0.1362225, -0.3057147, -1.208481, 0, 1, 0.6627451, 1,
-0.1361615, 2.091757, 0.8604124, 0, 1, 0.6705883, 1,
-0.1308086, -1.275561, -2.460446, 0, 1, 0.6745098, 1,
-0.1288959, 0.1555963, -2.828212, 0, 1, 0.682353, 1,
-0.1274745, 0.5158982, -0.227657, 0, 1, 0.6862745, 1,
-0.1259189, -0.3544767, -2.245505, 0, 1, 0.6941177, 1,
-0.1183202, 0.6271015, 0.4365397, 0, 1, 0.7019608, 1,
-0.1175129, 0.5240844, -0.1762379, 0, 1, 0.7058824, 1,
-0.1097554, 0.7555096, -0.334829, 0, 1, 0.7137255, 1,
-0.105412, -0.4963985, -1.990736, 0, 1, 0.7176471, 1,
-0.100708, 0.9683167, -0.594084, 0, 1, 0.7254902, 1,
-0.1000164, 0.3163023, -0.2245027, 0, 1, 0.7294118, 1,
-0.09946372, 0.03889987, -1.92258, 0, 1, 0.7372549, 1,
-0.09696153, -0.9088084, -1.19393, 0, 1, 0.7411765, 1,
-0.09687174, -0.5798767, -3.08574, 0, 1, 0.7490196, 1,
-0.08744434, -1.549809, -4.190956, 0, 1, 0.7529412, 1,
-0.08512594, -1.02324, -4.932158, 0, 1, 0.7607843, 1,
-0.08354428, -1.532793, -4.693825, 0, 1, 0.7647059, 1,
-0.08307831, 0.4352648, 2.389676, 0, 1, 0.772549, 1,
-0.08183201, -0.350954, -1.777016, 0, 1, 0.7764706, 1,
-0.08099218, -0.8128663, -2.997234, 0, 1, 0.7843137, 1,
-0.08030089, -1.658046, -4.492188, 0, 1, 0.7882353, 1,
-0.07977425, 2.153868, -0.08382525, 0, 1, 0.7960784, 1,
-0.07449992, 0.4212911, -0.5804485, 0, 1, 0.8039216, 1,
-0.07278497, -1.732647, -2.236531, 0, 1, 0.8078431, 1,
-0.07099765, -0.9142426, -3.710336, 0, 1, 0.8156863, 1,
-0.06819809, -0.3526968, -2.499945, 0, 1, 0.8196079, 1,
-0.0638006, -0.2725126, -2.331198, 0, 1, 0.827451, 1,
-0.06338594, -1.506253, -1.621113, 0, 1, 0.8313726, 1,
-0.05545308, 0.266907, -1.738465, 0, 1, 0.8392157, 1,
-0.05356234, -0.4570713, -1.813128, 0, 1, 0.8431373, 1,
-0.04853722, 0.6997215, 1.564365, 0, 1, 0.8509804, 1,
-0.0458547, -0.6790437, -2.492846, 0, 1, 0.854902, 1,
-0.0446813, -2.024362, -2.963957, 0, 1, 0.8627451, 1,
-0.04344736, -0.6716143, -3.852483, 0, 1, 0.8666667, 1,
-0.03936756, 0.2785393, -0.7852497, 0, 1, 0.8745098, 1,
-0.03504923, -1.469891, -3.331517, 0, 1, 0.8784314, 1,
-0.03218693, 2.309315, 0.7632416, 0, 1, 0.8862745, 1,
-0.03153661, 0.2117998, 0.2301722, 0, 1, 0.8901961, 1,
-0.03134326, 2.720574, -0.7980998, 0, 1, 0.8980392, 1,
-0.03052219, -0.1604595, -2.84671, 0, 1, 0.9058824, 1,
-0.0277879, -1.902799, -1.987388, 0, 1, 0.9098039, 1,
-0.02616374, 0.4071386, 1.039312, 0, 1, 0.9176471, 1,
-0.02263978, -1.973516, -2.408861, 0, 1, 0.9215686, 1,
-0.02165375, -1.046058, -4.167744, 0, 1, 0.9294118, 1,
-0.01821844, 0.05945913, -1.954743, 0, 1, 0.9333333, 1,
-0.01753247, 0.04736074, 0.8064768, 0, 1, 0.9411765, 1,
-0.01288632, 1.147341, 1.52924, 0, 1, 0.945098, 1,
-0.01123592, 0.1732232, -0.0564437, 0, 1, 0.9529412, 1,
-0.01113208, -0.6149197, -2.452155, 0, 1, 0.9568627, 1,
-0.005297136, -1.097281, -3.088946, 0, 1, 0.9647059, 1,
0.0005663433, 0.2377722, 0.05348291, 0, 1, 0.9686275, 1,
0.00938254, 0.6766012, 0.7940945, 0, 1, 0.9764706, 1,
0.009421542, -0.01673098, 4.397776, 0, 1, 0.9803922, 1,
0.01544789, 0.1975816, 1.590997, 0, 1, 0.9882353, 1,
0.02782232, -0.6772214, 3.135584, 0, 1, 0.9921569, 1,
0.02842759, -1.538585, 3.10195, 0, 1, 1, 1,
0.03063766, 0.8533818, -1.336275, 0, 0.9921569, 1, 1,
0.03233121, 1.085006, 0.07340234, 0, 0.9882353, 1, 1,
0.03500707, 0.426992, 1.335063, 0, 0.9803922, 1, 1,
0.04115516, 0.9562054, -0.5728979, 0, 0.9764706, 1, 1,
0.04235097, 1.092766, 0.8817655, 0, 0.9686275, 1, 1,
0.04348618, 1.508312, -1.290209, 0, 0.9647059, 1, 1,
0.0439404, 0.3694358, -0.3375496, 0, 0.9568627, 1, 1,
0.04440358, -0.9282234, 1.782651, 0, 0.9529412, 1, 1,
0.04570525, 0.9040849, 0.02600543, 0, 0.945098, 1, 1,
0.05038998, -1.154149, 4.282219, 0, 0.9411765, 1, 1,
0.05125592, -0.4252694, 2.983453, 0, 0.9333333, 1, 1,
0.05131285, 0.6348544, 1.395165, 0, 0.9294118, 1, 1,
0.05706922, 1.017279, 1.90632, 0, 0.9215686, 1, 1,
0.0668451, 0.1816899, -1.21271, 0, 0.9176471, 1, 1,
0.0743827, -0.3881239, 5.611518, 0, 0.9098039, 1, 1,
0.07680659, 2.62115, 0.03500488, 0, 0.9058824, 1, 1,
0.07686856, -1.041687, 3.636387, 0, 0.8980392, 1, 1,
0.07714317, 0.1870264, -0.975246, 0, 0.8901961, 1, 1,
0.07951746, 0.5999508, -0.2278974, 0, 0.8862745, 1, 1,
0.08254517, 0.6899342, -0.9561723, 0, 0.8784314, 1, 1,
0.08491756, 0.4384092, -2.315621, 0, 0.8745098, 1, 1,
0.08745532, -0.9747127, 3.306613, 0, 0.8666667, 1, 1,
0.08770261, 0.5441822, 0.2623586, 0, 0.8627451, 1, 1,
0.08879869, 0.5324904, -2.259031, 0, 0.854902, 1, 1,
0.09448472, 0.4486913, -1.167529, 0, 0.8509804, 1, 1,
0.09525406, -0.05768215, 3.274019, 0, 0.8431373, 1, 1,
0.09581678, 0.2037123, 0.6841547, 0, 0.8392157, 1, 1,
0.1011415, 0.8964148, 1.542013, 0, 0.8313726, 1, 1,
0.1020602, 0.8461044, -0.2667533, 0, 0.827451, 1, 1,
0.1024985, -0.8883755, 4.522132, 0, 0.8196079, 1, 1,
0.1058791, -1.070518, 2.896068, 0, 0.8156863, 1, 1,
0.1130642, -0.367572, 3.580163, 0, 0.8078431, 1, 1,
0.1159397, -0.2818538, 3.413712, 0, 0.8039216, 1, 1,
0.1195545, -0.2300099, 3.440937, 0, 0.7960784, 1, 1,
0.1222043, 0.498633, -0.3418135, 0, 0.7882353, 1, 1,
0.1250648, -0.5163524, 3.346818, 0, 0.7843137, 1, 1,
0.1287646, -1.07961, 3.752628, 0, 0.7764706, 1, 1,
0.1302079, 2.162699, -0.5237618, 0, 0.772549, 1, 1,
0.1344748, -1.307732, 4.279504, 0, 0.7647059, 1, 1,
0.1374884, 0.9439996, -0.4073858, 0, 0.7607843, 1, 1,
0.1385436, -1.715333, 2.527569, 0, 0.7529412, 1, 1,
0.1436806, -0.8023573, 3.959176, 0, 0.7490196, 1, 1,
0.143704, -0.7358004, 1.176893, 0, 0.7411765, 1, 1,
0.1464939, 0.1409217, 1.187582, 0, 0.7372549, 1, 1,
0.1480534, 1.396564, 1.290414, 0, 0.7294118, 1, 1,
0.1500937, -0.1072489, 2.614758, 0, 0.7254902, 1, 1,
0.1575852, -0.6437013, 1.63165, 0, 0.7176471, 1, 1,
0.1586287, 0.4959537, -0.6172478, 0, 0.7137255, 1, 1,
0.1609779, -0.2971796, 4.327341, 0, 0.7058824, 1, 1,
0.1613951, 0.3269421, -0.4707472, 0, 0.6980392, 1, 1,
0.1637653, -0.9022713, 2.195929, 0, 0.6941177, 1, 1,
0.1651418, 1.316759, 0.02613412, 0, 0.6862745, 1, 1,
0.1688598, 1.135093, 0.7172001, 0, 0.682353, 1, 1,
0.1702694, 0.9884521, 0.632661, 0, 0.6745098, 1, 1,
0.1812074, -0.9454831, 1.615699, 0, 0.6705883, 1, 1,
0.1842186, -2.222995, 3.137289, 0, 0.6627451, 1, 1,
0.1849266, 1.678789, 1.040667, 0, 0.6588235, 1, 1,
0.1850798, -0.3002188, 1.932605, 0, 0.6509804, 1, 1,
0.186707, 0.07517068, -0.3102934, 0, 0.6470588, 1, 1,
0.1867203, 0.9285436, -0.5512393, 0, 0.6392157, 1, 1,
0.1867204, 1.05336, -0.1306809, 0, 0.6352941, 1, 1,
0.1873899, -0.1809643, 1.609166, 0, 0.627451, 1, 1,
0.1881582, 1.635767, 0.9734942, 0, 0.6235294, 1, 1,
0.1884142, 0.07696073, 0.2963344, 0, 0.6156863, 1, 1,
0.1906254, -1.358524, 3.238921, 0, 0.6117647, 1, 1,
0.1909954, 0.7140439, 1.685976, 0, 0.6039216, 1, 1,
0.1928286, 0.8799375, -0.6073884, 0, 0.5960785, 1, 1,
0.1955018, -0.4295204, 1.774118, 0, 0.5921569, 1, 1,
0.2024713, 0.9313672, -1.20253, 0, 0.5843138, 1, 1,
0.2044591, -0.6294499, 3.008755, 0, 0.5803922, 1, 1,
0.2052142, 0.1823313, 0.4953807, 0, 0.572549, 1, 1,
0.2061559, -0.3536507, 2.140586, 0, 0.5686275, 1, 1,
0.2080653, 0.1631588, -0.2435764, 0, 0.5607843, 1, 1,
0.2136088, -0.02970013, 1.663369, 0, 0.5568628, 1, 1,
0.2202831, 0.9140995, 0.4221201, 0, 0.5490196, 1, 1,
0.2206624, -0.3211459, 2.655587, 0, 0.5450981, 1, 1,
0.2232239, -0.6880207, 2.990611, 0, 0.5372549, 1, 1,
0.2232698, -0.08832695, 0.1086597, 0, 0.5333334, 1, 1,
0.223578, -1.808183, 4.474133, 0, 0.5254902, 1, 1,
0.2237937, -0.5796143, 2.814072, 0, 0.5215687, 1, 1,
0.2309267, 2.007976, -0.8050712, 0, 0.5137255, 1, 1,
0.2309484, 1.55954, -0.1844911, 0, 0.509804, 1, 1,
0.2310689, -2.736288, 1.781224, 0, 0.5019608, 1, 1,
0.2319659, -1.642408, 4.619769, 0, 0.4941176, 1, 1,
0.2325497, 0.6986079, 0.01242741, 0, 0.4901961, 1, 1,
0.2344533, 0.6786693, -0.8651266, 0, 0.4823529, 1, 1,
0.2348458, 0.2192647, 2.726511, 0, 0.4784314, 1, 1,
0.2350093, 0.1249398, 1.548922, 0, 0.4705882, 1, 1,
0.235839, 1.883058, 0.01299083, 0, 0.4666667, 1, 1,
0.2372825, -1.091416, 3.563698, 0, 0.4588235, 1, 1,
0.2380816, -0.2017609, 2.199158, 0, 0.454902, 1, 1,
0.240593, -0.5124087, 4.566045, 0, 0.4470588, 1, 1,
0.2415234, 0.1088988, 0.9737031, 0, 0.4431373, 1, 1,
0.2418894, -0.7786664, 3.926959, 0, 0.4352941, 1, 1,
0.2424767, 1.7032, 2.055035, 0, 0.4313726, 1, 1,
0.2459172, 0.6426361, -0.6626391, 0, 0.4235294, 1, 1,
0.2483247, 1.19697, -0.8514833, 0, 0.4196078, 1, 1,
0.2520319, 1.593489, -0.4554476, 0, 0.4117647, 1, 1,
0.2526628, -0.473605, 1.455644, 0, 0.4078431, 1, 1,
0.2537769, -0.1906163, 1.538316, 0, 0.4, 1, 1,
0.2538144, 2.18389, 0.7214081, 0, 0.3921569, 1, 1,
0.2546595, 0.6495035, -0.7629206, 0, 0.3882353, 1, 1,
0.2571743, 0.3931549, 0.1908164, 0, 0.3803922, 1, 1,
0.2617643, -1.151136, 3.769099, 0, 0.3764706, 1, 1,
0.2627493, 0.2569885, 0.2267035, 0, 0.3686275, 1, 1,
0.2654446, 0.9649231, 2.247687, 0, 0.3647059, 1, 1,
0.2708119, 1.538592, 1.579542, 0, 0.3568628, 1, 1,
0.2723061, 1.508661, -0.5104441, 0, 0.3529412, 1, 1,
0.2745653, -1.457333, 2.823948, 0, 0.345098, 1, 1,
0.274771, -0.09698429, 1.565736, 0, 0.3411765, 1, 1,
0.2760425, -0.3062923, 3.665657, 0, 0.3333333, 1, 1,
0.277317, -0.46934, 1.924095, 0, 0.3294118, 1, 1,
0.2779664, 1.845291, -0.1474912, 0, 0.3215686, 1, 1,
0.2780011, 0.3914843, -0.09800947, 0, 0.3176471, 1, 1,
0.2790233, 0.6249777, 0.05958502, 0, 0.3098039, 1, 1,
0.2911974, 0.1780855, 0.8102059, 0, 0.3058824, 1, 1,
0.2933647, -0.8945162, 2.892542, 0, 0.2980392, 1, 1,
0.2954598, -2.639053, 2.298496, 0, 0.2901961, 1, 1,
0.3005358, -1.160171, 3.887701, 0, 0.2862745, 1, 1,
0.3018237, 0.4419828, -1.219677, 0, 0.2784314, 1, 1,
0.3062507, 1.560111, 0.1099822, 0, 0.2745098, 1, 1,
0.3062902, 0.001381121, 1.645142, 0, 0.2666667, 1, 1,
0.3069017, 0.3536238, 1.360805, 0, 0.2627451, 1, 1,
0.3083592, 0.8272816, 0.5768682, 0, 0.254902, 1, 1,
0.3124819, -0.09078217, -1.10055, 0, 0.2509804, 1, 1,
0.3136612, -0.8311239, 2.114255, 0, 0.2431373, 1, 1,
0.313974, -1.317151, 2.53422, 0, 0.2392157, 1, 1,
0.314999, 0.519721, -0.2796341, 0, 0.2313726, 1, 1,
0.316889, -0.4579489, 4.511559, 0, 0.227451, 1, 1,
0.3175654, -1.072539, 1.466711, 0, 0.2196078, 1, 1,
0.3177655, 0.6688879, 1.031934, 0, 0.2156863, 1, 1,
0.3218388, -0.8534481, -0.1394503, 0, 0.2078431, 1, 1,
0.3273152, 0.05118964, 0.3292861, 0, 0.2039216, 1, 1,
0.327692, 1.121377, -0.03409305, 0, 0.1960784, 1, 1,
0.3286417, -0.8939856, 1.714875, 0, 0.1882353, 1, 1,
0.3329279, -0.4347441, 1.887322, 0, 0.1843137, 1, 1,
0.3332061, 0.6763243, 1.243712, 0, 0.1764706, 1, 1,
0.3342291, 1.948537, 0.8426828, 0, 0.172549, 1, 1,
0.3374408, 0.09147932, 1.59365, 0, 0.1647059, 1, 1,
0.3374574, 1.106972, 1.697389, 0, 0.1607843, 1, 1,
0.3377217, -0.03799892, 1.081336, 0, 0.1529412, 1, 1,
0.3424117, -0.5977191, 3.040097, 0, 0.1490196, 1, 1,
0.3441981, 0.5815372, 1.599462, 0, 0.1411765, 1, 1,
0.3457162, 0.6949579, 1.247347, 0, 0.1372549, 1, 1,
0.3492963, 0.7294717, 0.1995538, 0, 0.1294118, 1, 1,
0.3507305, -0.4452972, 3.176479, 0, 0.1254902, 1, 1,
0.3525021, 2.027514, 0.3129253, 0, 0.1176471, 1, 1,
0.3622499, -1.036811, 2.512814, 0, 0.1137255, 1, 1,
0.3634214, 0.4320777, 1.02048, 0, 0.1058824, 1, 1,
0.3676518, -0.3637198, 3.054743, 0, 0.09803922, 1, 1,
0.3709193, 0.7760321, 1.0613, 0, 0.09411765, 1, 1,
0.3854261, -0.8351979, 1.485093, 0, 0.08627451, 1, 1,
0.3885074, -0.6182057, 1.320741, 0, 0.08235294, 1, 1,
0.3903205, 0.4436627, 1.905773, 0, 0.07450981, 1, 1,
0.3930513, -1.868888, 5.745589, 0, 0.07058824, 1, 1,
0.3934738, 0.1749454, -1.298532, 0, 0.0627451, 1, 1,
0.3944942, 0.8286542, 1.102182, 0, 0.05882353, 1, 1,
0.395041, 0.4876471, 0.6904494, 0, 0.05098039, 1, 1,
0.3973602, 0.8294534, 0.320801, 0, 0.04705882, 1, 1,
0.3975398, 1.568215, 0.9443774, 0, 0.03921569, 1, 1,
0.4047375, -2.120201, 1.745104, 0, 0.03529412, 1, 1,
0.4169319, -0.4388517, 0.9150519, 0, 0.02745098, 1, 1,
0.4192723, -1.436272, 3.993587, 0, 0.02352941, 1, 1,
0.4216385, -0.7037261, 1.672236, 0, 0.01568628, 1, 1,
0.4228268, 0.6744155, -0.008552882, 0, 0.01176471, 1, 1,
0.4248267, 0.3854509, 1.084469, 0, 0.003921569, 1, 1,
0.4263403, 0.5779206, -0.4253402, 0.003921569, 0, 1, 1,
0.4266585, 1.211773, -0.2772587, 0.007843138, 0, 1, 1,
0.4312722, -0.1266347, -0.793055, 0.01568628, 0, 1, 1,
0.4338076, 0.470572, -0.3881586, 0.01960784, 0, 1, 1,
0.4452328, 0.4990534, 1.719027, 0.02745098, 0, 1, 1,
0.4508092, 0.4443589, 0.5580097, 0.03137255, 0, 1, 1,
0.4526019, -1.237263, 4.410961, 0.03921569, 0, 1, 1,
0.4536358, -1.399758, 3.607646, 0.04313726, 0, 1, 1,
0.4590836, 1.551401, 0.7538102, 0.05098039, 0, 1, 1,
0.4593723, -1.442285, 2.485046, 0.05490196, 0, 1, 1,
0.475117, 0.1161122, 0.6107642, 0.0627451, 0, 1, 1,
0.4755894, -0.02239138, 1.964231, 0.06666667, 0, 1, 1,
0.4823425, 0.2154652, -0.5610042, 0.07450981, 0, 1, 1,
0.4861592, 1.803021, 0.4439896, 0.07843138, 0, 1, 1,
0.4901304, -1.613607, 2.118721, 0.08627451, 0, 1, 1,
0.4959392, 0.06104954, 1.791546, 0.09019608, 0, 1, 1,
0.4973422, 0.1748228, 0.5032152, 0.09803922, 0, 1, 1,
0.4987648, -0.9286478, 3.653822, 0.1058824, 0, 1, 1,
0.5058832, -0.07508419, 1.642624, 0.1098039, 0, 1, 1,
0.5066494, -1.992133, 3.163563, 0.1176471, 0, 1, 1,
0.5071164, 1.204752, 0.2649331, 0.1215686, 0, 1, 1,
0.5084702, 1.468628, 0.4811983, 0.1294118, 0, 1, 1,
0.5090181, 0.07163885, 2.126753, 0.1333333, 0, 1, 1,
0.5119485, -0.3408863, 1.359711, 0.1411765, 0, 1, 1,
0.5171914, -0.2234243, 1.151739, 0.145098, 0, 1, 1,
0.5250869, 0.06215914, 2.234918, 0.1529412, 0, 1, 1,
0.5294895, -0.193223, 2.290019, 0.1568628, 0, 1, 1,
0.5307405, -0.3922559, 1.343654, 0.1647059, 0, 1, 1,
0.5318164, -0.9184326, 1.750692, 0.1686275, 0, 1, 1,
0.5319281, 0.6191092, 0.3996568, 0.1764706, 0, 1, 1,
0.5347465, 0.1763313, 2.221416, 0.1803922, 0, 1, 1,
0.5361133, 0.6573911, 1.398144, 0.1882353, 0, 1, 1,
0.5364828, 1.407128, 0.3772906, 0.1921569, 0, 1, 1,
0.5416023, -0.2299736, 2.526934, 0.2, 0, 1, 1,
0.547859, 0.02635581, 2.014786, 0.2078431, 0, 1, 1,
0.5501739, -0.7016995, 1.242981, 0.2117647, 0, 1, 1,
0.5509027, 1.052517, -0.3779973, 0.2196078, 0, 1, 1,
0.5518292, -0.1082651, 1.892532, 0.2235294, 0, 1, 1,
0.5540034, -1.909155, 1.892381, 0.2313726, 0, 1, 1,
0.5584079, 0.4856601, -0.406177, 0.2352941, 0, 1, 1,
0.559542, -0.3087204, 3.199775, 0.2431373, 0, 1, 1,
0.563174, -0.2635516, 3.186652, 0.2470588, 0, 1, 1,
0.5634582, 0.388912, 1.828928, 0.254902, 0, 1, 1,
0.5636604, 2.253798, -0.7214261, 0.2588235, 0, 1, 1,
0.5673453, -0.1045676, 4.090542, 0.2666667, 0, 1, 1,
0.5674806, -0.7304026, 3.397907, 0.2705882, 0, 1, 1,
0.5689039, -0.0209604, 2.548888, 0.2784314, 0, 1, 1,
0.5695446, -1.294659, 1.478361, 0.282353, 0, 1, 1,
0.5713742, -1.419495, 2.346219, 0.2901961, 0, 1, 1,
0.571616, -0.6549991, 1.674782, 0.2941177, 0, 1, 1,
0.5720429, -0.3814915, 2.081124, 0.3019608, 0, 1, 1,
0.5740403, -0.9000417, 3.346093, 0.3098039, 0, 1, 1,
0.5748867, -0.1585443, 1.799509, 0.3137255, 0, 1, 1,
0.5750393, 0.0512018, 2.15239, 0.3215686, 0, 1, 1,
0.589438, -1.269858, 3.336534, 0.3254902, 0, 1, 1,
0.5939491, -1.247507, 2.559764, 0.3333333, 0, 1, 1,
0.6002332, 1.530281, 2.559941, 0.3372549, 0, 1, 1,
0.6008044, 0.6177578, 1.259811, 0.345098, 0, 1, 1,
0.6042333, 0.2554621, 2.80584, 0.3490196, 0, 1, 1,
0.6052854, -1.163973, 4.039163, 0.3568628, 0, 1, 1,
0.6067532, 1.179618, 2.261642, 0.3607843, 0, 1, 1,
0.6105136, 0.4146304, 2.212259, 0.3686275, 0, 1, 1,
0.6126359, -0.3009525, 3.602407, 0.372549, 0, 1, 1,
0.6141506, -0.1119821, 1.357666, 0.3803922, 0, 1, 1,
0.6151721, 0.8388652, 1.576351, 0.3843137, 0, 1, 1,
0.6164754, 0.08289728, 1.679827, 0.3921569, 0, 1, 1,
0.6186891, 1.43198, -0.556065, 0.3960784, 0, 1, 1,
0.6205377, 0.07254213, 1.219153, 0.4039216, 0, 1, 1,
0.625844, 0.3334169, 1.192892, 0.4117647, 0, 1, 1,
0.6298737, 1.074136, -0.4958118, 0.4156863, 0, 1, 1,
0.6323483, 0.9132317, -0.3872784, 0.4235294, 0, 1, 1,
0.6363525, -0.7780137, 3.397813, 0.427451, 0, 1, 1,
0.6388334, 0.4426231, 1.234953, 0.4352941, 0, 1, 1,
0.6447634, -1.967055, 2.783573, 0.4392157, 0, 1, 1,
0.6460393, -1.844094, 2.49648, 0.4470588, 0, 1, 1,
0.6462792, -0.1000985, 1.986452, 0.4509804, 0, 1, 1,
0.6541911, 0.6565128, 1.066561, 0.4588235, 0, 1, 1,
0.6544656, -0.3275995, 1.758012, 0.4627451, 0, 1, 1,
0.6554632, -0.3790632, 1.329399, 0.4705882, 0, 1, 1,
0.6568766, 0.7318869, -0.03671937, 0.4745098, 0, 1, 1,
0.6591778, 0.7547964, 1.323182, 0.4823529, 0, 1, 1,
0.6618601, 1.79484, 2.015841, 0.4862745, 0, 1, 1,
0.6638188, 0.3377067, 0.5410303, 0.4941176, 0, 1, 1,
0.6656095, 0.0312456, 2.098645, 0.5019608, 0, 1, 1,
0.6754257, 0.2151443, 2.258771, 0.5058824, 0, 1, 1,
0.6772075, 0.4848859, 0.4292099, 0.5137255, 0, 1, 1,
0.6772657, -1.400531, 0.958376, 0.5176471, 0, 1, 1,
0.6773274, 0.3718036, 1.430805, 0.5254902, 0, 1, 1,
0.6807914, -1.72212, 3.710801, 0.5294118, 0, 1, 1,
0.6813207, -0.8179972, 2.460026, 0.5372549, 0, 1, 1,
0.6823024, 0.1562346, 0.1192527, 0.5411765, 0, 1, 1,
0.6869332, 0.3481843, -0.6299114, 0.5490196, 0, 1, 1,
0.6879426, -0.7486732, 3.334733, 0.5529412, 0, 1, 1,
0.6881227, 0.07139725, 0.2727874, 0.5607843, 0, 1, 1,
0.6892754, 0.3537835, 1.617133, 0.5647059, 0, 1, 1,
0.6934091, 0.9005735, 0.5148494, 0.572549, 0, 1, 1,
0.6961136, -1.893502, 4.448043, 0.5764706, 0, 1, 1,
0.7055032, 1.398881, 2.332433, 0.5843138, 0, 1, 1,
0.7059371, -0.07786966, 0.8398149, 0.5882353, 0, 1, 1,
0.7113727, 0.1965238, 2.80846, 0.5960785, 0, 1, 1,
0.7115745, -0.5575327, 1.93585, 0.6039216, 0, 1, 1,
0.714933, 0.6063733, 2.134126, 0.6078432, 0, 1, 1,
0.7235556, -0.9274576, 2.882889, 0.6156863, 0, 1, 1,
0.7271227, -1.770707, 4.468011, 0.6196079, 0, 1, 1,
0.7287185, -0.1882287, 2.130352, 0.627451, 0, 1, 1,
0.732681, -0.4642858, 1.709383, 0.6313726, 0, 1, 1,
0.734479, 0.3883069, 0.8581432, 0.6392157, 0, 1, 1,
0.7377599, -3.149272, 2.919886, 0.6431373, 0, 1, 1,
0.7399538, 0.687127, 1.565571, 0.6509804, 0, 1, 1,
0.7402994, -0.4147798, 1.330047, 0.654902, 0, 1, 1,
0.7424346, -3.04388, 3.414646, 0.6627451, 0, 1, 1,
0.7442287, -0.0794031, 3.03743, 0.6666667, 0, 1, 1,
0.7449195, -0.865927, 1.547226, 0.6745098, 0, 1, 1,
0.7471401, -0.8444335, 3.673556, 0.6784314, 0, 1, 1,
0.7494211, -1.482865, 2.981374, 0.6862745, 0, 1, 1,
0.756004, 0.2283255, 1.40323, 0.6901961, 0, 1, 1,
0.7571174, 0.123637, 0.7835777, 0.6980392, 0, 1, 1,
0.7651376, 0.6461082, 1.190057, 0.7058824, 0, 1, 1,
0.7718619, 0.5554816, 1.736402, 0.7098039, 0, 1, 1,
0.7738993, -0.7613606, 2.959293, 0.7176471, 0, 1, 1,
0.7755579, -0.3684761, 2.120991, 0.7215686, 0, 1, 1,
0.7759457, -2.201174, 2.052438, 0.7294118, 0, 1, 1,
0.7862331, 0.6350704, 1.104776, 0.7333333, 0, 1, 1,
0.7874122, -0.2426328, 1.232529, 0.7411765, 0, 1, 1,
0.7932084, -0.9864149, 2.097596, 0.7450981, 0, 1, 1,
0.7971262, 0.7081546, 2.672507, 0.7529412, 0, 1, 1,
0.8008106, -0.3004945, 2.621927, 0.7568628, 0, 1, 1,
0.8032663, 0.08474521, 1.559762, 0.7647059, 0, 1, 1,
0.8042462, 0.7018048, 0.5494402, 0.7686275, 0, 1, 1,
0.817552, 0.3310708, 1.699566, 0.7764706, 0, 1, 1,
0.8184183, -1.203177, 1.851033, 0.7803922, 0, 1, 1,
0.8247955, 0.03661414, 1.064141, 0.7882353, 0, 1, 1,
0.8315384, 2.160719, 0.3629273, 0.7921569, 0, 1, 1,
0.8389774, -2.478089, 2.719585, 0.8, 0, 1, 1,
0.8422199, 0.02868032, 1.272591, 0.8078431, 0, 1, 1,
0.8423394, 2.090987, -1.696834, 0.8117647, 0, 1, 1,
0.8457065, -0.8516207, 2.883991, 0.8196079, 0, 1, 1,
0.848348, -1.65806, 1.477928, 0.8235294, 0, 1, 1,
0.8561605, 0.0817758, -0.09694495, 0.8313726, 0, 1, 1,
0.8586466, -0.5148635, 0.3174724, 0.8352941, 0, 1, 1,
0.8613782, 1.049432, 2.72418, 0.8431373, 0, 1, 1,
0.8620812, 0.01970991, 0.1450405, 0.8470588, 0, 1, 1,
0.8650542, -0.1678085, 1.678468, 0.854902, 0, 1, 1,
0.8654628, 0.1448707, -2.078159, 0.8588235, 0, 1, 1,
0.8654767, -0.9867321, 2.869066, 0.8666667, 0, 1, 1,
0.8686187, 1.083903, 1.911058, 0.8705882, 0, 1, 1,
0.868795, 0.489545, 0.4002376, 0.8784314, 0, 1, 1,
0.8724931, -0.8642987, 1.795101, 0.8823529, 0, 1, 1,
0.8763729, -1.001304, 2.582715, 0.8901961, 0, 1, 1,
0.878709, 1.816513, 0.04492132, 0.8941177, 0, 1, 1,
0.883794, -1.933859, 2.914382, 0.9019608, 0, 1, 1,
0.888037, -0.02982684, 1.102213, 0.9098039, 0, 1, 1,
0.8938619, 0.7145945, 1.709398, 0.9137255, 0, 1, 1,
0.8947796, 1.138172, -1.069688, 0.9215686, 0, 1, 1,
0.8970233, -0.5509665, 2.776528, 0.9254902, 0, 1, 1,
0.8976945, 0.1186925, 2.237858, 0.9333333, 0, 1, 1,
0.9097889, -0.8985034, 1.356485, 0.9372549, 0, 1, 1,
0.9117293, -0.8478579, 1.506625, 0.945098, 0, 1, 1,
0.9161447, 1.854648, 0.7750779, 0.9490196, 0, 1, 1,
0.9161459, 1.095813, 1.006693, 0.9568627, 0, 1, 1,
0.9168012, -0.2836768, 1.582237, 0.9607843, 0, 1, 1,
0.9287206, -1.224257, 2.726903, 0.9686275, 0, 1, 1,
0.9307367, 0.4118248, 1.454397, 0.972549, 0, 1, 1,
0.9308328, 1.644902, -0.8929123, 0.9803922, 0, 1, 1,
0.9336947, -0.4088656, 2.977014, 0.9843137, 0, 1, 1,
0.9436993, 0.3995929, 1.35384, 0.9921569, 0, 1, 1,
0.9452291, -0.292663, 2.770791, 0.9960784, 0, 1, 1,
0.9504563, -0.2593888, 2.372972, 1, 0, 0.9960784, 1,
0.9547548, -1.888034, 2.407361, 1, 0, 0.9882353, 1,
0.977984, -0.5759597, 1.192086, 1, 0, 0.9843137, 1,
0.9865829, 0.4896774, 0.5080695, 1, 0, 0.9764706, 1,
0.9886996, 1.492086, -1.909167, 1, 0, 0.972549, 1,
0.9971986, 1.230772, -0.7844991, 1, 0, 0.9647059, 1,
0.9974432, -0.571488, 3.581623, 1, 0, 0.9607843, 1,
0.9996129, -0.8030652, 3.194922, 1, 0, 0.9529412, 1,
1.000484, -1.81719, 0.7827268, 1, 0, 0.9490196, 1,
1.006093, 1.538235, 1.661914, 1, 0, 0.9411765, 1,
1.007827, 0.47938, 3.005036, 1, 0, 0.9372549, 1,
1.009386, 1.80068, -0.6761031, 1, 0, 0.9294118, 1,
1.014449, 0.684215, 1.134407, 1, 0, 0.9254902, 1,
1.016987, -1.330206, 1.479115, 1, 0, 0.9176471, 1,
1.018158, 0.8320154, 0.8534411, 1, 0, 0.9137255, 1,
1.022992, -1.894306, 4.030415, 1, 0, 0.9058824, 1,
1.026047, -0.247024, 1.032697, 1, 0, 0.9019608, 1,
1.029185, -1.920264, 0.8722928, 1, 0, 0.8941177, 1,
1.032943, 1.370667, 2.223174, 1, 0, 0.8862745, 1,
1.03835, -0.7664053, 2.32495, 1, 0, 0.8823529, 1,
1.050583, -0.3222161, 2.198501, 1, 0, 0.8745098, 1,
1.065159, -0.3207117, 0.1135301, 1, 0, 0.8705882, 1,
1.074527, -0.1952106, 1.900295, 1, 0, 0.8627451, 1,
1.079578, 0.6555328, 1.687951, 1, 0, 0.8588235, 1,
1.087723, -0.2516636, 2.884864, 1, 0, 0.8509804, 1,
1.089334, -0.8579741, 0.7472536, 1, 0, 0.8470588, 1,
1.08959, -0.524277, 3.905563, 1, 0, 0.8392157, 1,
1.092136, 1.081157, 0.5824392, 1, 0, 0.8352941, 1,
1.092307, -0.06851204, 0.1641472, 1, 0, 0.827451, 1,
1.096602, 0.663232, 1.558168, 1, 0, 0.8235294, 1,
1.096693, 0.7170638, 1.238623, 1, 0, 0.8156863, 1,
1.10574, 1.55134, -0.1155936, 1, 0, 0.8117647, 1,
1.111351, -0.009770135, 2.096119, 1, 0, 0.8039216, 1,
1.113027, 0.08523646, 1.795711, 1, 0, 0.7960784, 1,
1.115699, 1.024168, -0.3507056, 1, 0, 0.7921569, 1,
1.120374, 0.4608816, -0.03134209, 1, 0, 0.7843137, 1,
1.128594, -0.5275161, 4.138962, 1, 0, 0.7803922, 1,
1.135218, 0.04210212, 2.214356, 1, 0, 0.772549, 1,
1.136032, -0.3737782, 0.9910683, 1, 0, 0.7686275, 1,
1.136909, 0.4201618, 1.373946, 1, 0, 0.7607843, 1,
1.138131, -0.4648611, 2.041489, 1, 0, 0.7568628, 1,
1.1534, 1.933993, 0.4195016, 1, 0, 0.7490196, 1,
1.156442, 0.03091593, 0.4017125, 1, 0, 0.7450981, 1,
1.157103, -0.957852, 2.066222, 1, 0, 0.7372549, 1,
1.163947, -0.8875232, 1.054423, 1, 0, 0.7333333, 1,
1.168706, 0.236343, 1.431685, 1, 0, 0.7254902, 1,
1.178084, 1.475326, -0.08518738, 1, 0, 0.7215686, 1,
1.180208, 0.7391236, 1.483351, 1, 0, 0.7137255, 1,
1.18518, -0.5538544, 2.220477, 1, 0, 0.7098039, 1,
1.196913, 0.4652113, 2.841046, 1, 0, 0.7019608, 1,
1.203848, 0.7986723, -0.7350386, 1, 0, 0.6941177, 1,
1.210153, -0.3128167, 2.006134, 1, 0, 0.6901961, 1,
1.223554, 1.832245, -0.0001036164, 1, 0, 0.682353, 1,
1.25061, 0.2282608, 1.500988, 1, 0, 0.6784314, 1,
1.253048, -1.618702, 2.462145, 1, 0, 0.6705883, 1,
1.256308, 0.01924796, 2.954317, 1, 0, 0.6666667, 1,
1.258419, -0.9105639, 0.6209612, 1, 0, 0.6588235, 1,
1.262368, 0.1091156, 1.231993, 1, 0, 0.654902, 1,
1.265451, 0.2195568, 1.618767, 1, 0, 0.6470588, 1,
1.265692, -0.4016261, 1.777285, 1, 0, 0.6431373, 1,
1.265948, 0.2224907, 2.993579, 1, 0, 0.6352941, 1,
1.266677, -0.1066394, 2.009654, 1, 0, 0.6313726, 1,
1.274304, 0.6608625, 1.565243, 1, 0, 0.6235294, 1,
1.276249, 0.7211171, -0.1932037, 1, 0, 0.6196079, 1,
1.286923, -1.00133, 1.522061, 1, 0, 0.6117647, 1,
1.294456, 0.003133193, 1.237341, 1, 0, 0.6078432, 1,
1.31187, 0.7817026, 3.449466, 1, 0, 0.6, 1,
1.313431, -1.124536, 3.155924, 1, 0, 0.5921569, 1,
1.321265, -0.05655926, 2.104536, 1, 0, 0.5882353, 1,
1.322433, 0.8717002, 1.250734, 1, 0, 0.5803922, 1,
1.328641, 0.6723692, 1.140745, 1, 0, 0.5764706, 1,
1.340873, -0.925571, 2.503234, 1, 0, 0.5686275, 1,
1.341323, 0.7766787, 1.519722, 1, 0, 0.5647059, 1,
1.3438, 0.07182736, -0.3521625, 1, 0, 0.5568628, 1,
1.360736, -2.119069, 2.861727, 1, 0, 0.5529412, 1,
1.368926, -0.7461169, 1.15165, 1, 0, 0.5450981, 1,
1.381344, -0.6298928, 3.077499, 1, 0, 0.5411765, 1,
1.389102, 0.2247831, 2.261179, 1, 0, 0.5333334, 1,
1.39353, 0.5176042, 0.1133804, 1, 0, 0.5294118, 1,
1.401261, 0.8813419, 1.755254, 1, 0, 0.5215687, 1,
1.404154, -0.4076653, 2.559075, 1, 0, 0.5176471, 1,
1.409269, -1.575417, 1.746621, 1, 0, 0.509804, 1,
1.412278, 0.09166963, 1.200613, 1, 0, 0.5058824, 1,
1.414548, -1.747721, 3.349111, 1, 0, 0.4980392, 1,
1.41659, -0.3123688, 1.422857, 1, 0, 0.4901961, 1,
1.421633, -0.6259371, 1.29783, 1, 0, 0.4862745, 1,
1.424582, 0.2346951, -1.149273, 1, 0, 0.4784314, 1,
1.434925, 0.3860638, 2.067315, 1, 0, 0.4745098, 1,
1.450014, -0.09206078, 1.922064, 1, 0, 0.4666667, 1,
1.4683, -1.214308, 3.992224, 1, 0, 0.4627451, 1,
1.47674, 0.2129443, 0.9011434, 1, 0, 0.454902, 1,
1.478427, -1.902806, 2.140162, 1, 0, 0.4509804, 1,
1.478545, -0.7685183, 1.62168, 1, 0, 0.4431373, 1,
1.48782, -1.47955, 2.732406, 1, 0, 0.4392157, 1,
1.515505, 0.1151696, 1.181867, 1, 0, 0.4313726, 1,
1.518592, -0.3719568, 1.438155, 1, 0, 0.427451, 1,
1.5264, 0.5095571, 1.441473, 1, 0, 0.4196078, 1,
1.532772, -1.540555, 1.97703, 1, 0, 0.4156863, 1,
1.535062, -0.7105507, 2.872841, 1, 0, 0.4078431, 1,
1.543045, 0.9899132, 2.243683, 1, 0, 0.4039216, 1,
1.570995, -0.3469721, 1.722504, 1, 0, 0.3960784, 1,
1.575026, -1.358294, 3.492499, 1, 0, 0.3882353, 1,
1.57673, 0.5200616, 2.993784, 1, 0, 0.3843137, 1,
1.580364, 1.843046, 0.7996285, 1, 0, 0.3764706, 1,
1.584256, -1.098992, 3.130995, 1, 0, 0.372549, 1,
1.602, 0.6299109, 1.701441, 1, 0, 0.3647059, 1,
1.609724, -0.001318258, 1.410004, 1, 0, 0.3607843, 1,
1.617068, -1.666937, 2.932156, 1, 0, 0.3529412, 1,
1.618812, 1.775757, 0.4305862, 1, 0, 0.3490196, 1,
1.640154, -3.501633, 4.168999, 1, 0, 0.3411765, 1,
1.642663, 0.2383004, 1.413506, 1, 0, 0.3372549, 1,
1.65158, 2.150398, -0.6830008, 1, 0, 0.3294118, 1,
1.66488, -2.268938, 3.876997, 1, 0, 0.3254902, 1,
1.683573, -0.01672739, 1.951294, 1, 0, 0.3176471, 1,
1.718259, 0.9759645, 0.8226731, 1, 0, 0.3137255, 1,
1.725808, -0.6216966, 2.35408, 1, 0, 0.3058824, 1,
1.730417, 0.1468325, 0.2325156, 1, 0, 0.2980392, 1,
1.748352, -0.08635103, 0.6510792, 1, 0, 0.2941177, 1,
1.755437, 0.5378729, 1.640886, 1, 0, 0.2862745, 1,
1.792964, -0.02983622, 1.338297, 1, 0, 0.282353, 1,
1.793618, 0.88856, 2.055758, 1, 0, 0.2745098, 1,
1.797712, 0.7969722, 1.973578, 1, 0, 0.2705882, 1,
1.802197, -1.97641, 1.802749, 1, 0, 0.2627451, 1,
1.802895, 0.5948492, 0.2398336, 1, 0, 0.2588235, 1,
1.805706, -0.4789045, 1.974039, 1, 0, 0.2509804, 1,
1.806829, 0.5575684, 2.420323, 1, 0, 0.2470588, 1,
1.814228, -0.3825915, 2.539701, 1, 0, 0.2392157, 1,
1.830456, 0.6701257, 1.338763, 1, 0, 0.2352941, 1,
1.848309, 0.362752, 1.083483, 1, 0, 0.227451, 1,
1.85351, -0.05182107, 1.816352, 1, 0, 0.2235294, 1,
1.864637, 0.9895221, 0.311847, 1, 0, 0.2156863, 1,
1.884956, -0.4033022, 2.182734, 1, 0, 0.2117647, 1,
1.895966, -0.7532315, 1.074624, 1, 0, 0.2039216, 1,
1.903918, 0.07818273, 2.934343, 1, 0, 0.1960784, 1,
1.907931, -0.1632777, 2.853567, 1, 0, 0.1921569, 1,
1.940485, 0.3034838, -0.1108145, 1, 0, 0.1843137, 1,
1.956123, 1.179534, 2.154785, 1, 0, 0.1803922, 1,
1.978279, 1.089029, 1.527739, 1, 0, 0.172549, 1,
1.984536, 0.5316222, 0.2311203, 1, 0, 0.1686275, 1,
1.985083, -0.3123864, 1.238703, 1, 0, 0.1607843, 1,
2.003302, -0.1073711, 3.206255, 1, 0, 0.1568628, 1,
2.003609, 0.6475952, 2.111037, 1, 0, 0.1490196, 1,
2.012366, 0.06644673, 0.3673941, 1, 0, 0.145098, 1,
2.03435, -0.2752041, 0.7865041, 1, 0, 0.1372549, 1,
2.041639, -1.329485, 3.537772, 1, 0, 0.1333333, 1,
2.079868, 0.2291126, 1.448418, 1, 0, 0.1254902, 1,
2.107083, 2.467563, 0.1456376, 1, 0, 0.1215686, 1,
2.151159, 1.113772, 0.86221, 1, 0, 0.1137255, 1,
2.165762, 1.072819, 1.784584, 1, 0, 0.1098039, 1,
2.166787, -1.515276, 2.799874, 1, 0, 0.1019608, 1,
2.173811, -0.6249733, 2.354122, 1, 0, 0.09411765, 1,
2.179694, 0.8450698, 0.4248238, 1, 0, 0.09019608, 1,
2.227163, 0.8697979, 1.638958, 1, 0, 0.08235294, 1,
2.22994, -1.477244, 3.248278, 1, 0, 0.07843138, 1,
2.334998, -0.3049537, 1.354817, 1, 0, 0.07058824, 1,
2.416731, -1.443996, 1.797884, 1, 0, 0.06666667, 1,
2.421038, -0.1655167, 2.201373, 1, 0, 0.05882353, 1,
2.485436, -1.158577, 0.8107256, 1, 0, 0.05490196, 1,
2.49225, -0.2858003, 1.074456, 1, 0, 0.04705882, 1,
2.504981, -0.3617397, 2.164151, 1, 0, 0.04313726, 1,
2.529769, -1.136587, 2.013385, 1, 0, 0.03529412, 1,
2.636203, -0.06646107, 3.829288, 1, 0, 0.03137255, 1,
2.797611, 1.356159, 1.378889, 1, 0, 0.02352941, 1,
2.834687, -1.149113, 1.64174, 1, 0, 0.01960784, 1,
2.882694, 0.8503914, 1.764355, 1, 0, 0.01176471, 1,
3.371149, -0.3421796, 1.687418, 1, 0, 0.007843138, 1
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
0.1761559, -4.78768, -7.304062, 0, -0.5, 0.5, 0.5,
0.1761559, -4.78768, -7.304062, 1, -0.5, 0.5, 0.5,
0.1761559, -4.78768, -7.304062, 1, 1.5, 0.5, 0.5,
0.1761559, -4.78768, -7.304062, 0, 1.5, 0.5, 0.5
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
-4.10194, -0.08029497, -7.304062, 0, -0.5, 0.5, 0.5,
-4.10194, -0.08029497, -7.304062, 1, -0.5, 0.5, 0.5,
-4.10194, -0.08029497, -7.304062, 1, 1.5, 0.5, 0.5,
-4.10194, -0.08029497, -7.304062, 0, 1.5, 0.5, 0.5
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
-4.10194, -4.78768, 0.166431, 0, -0.5, 0.5, 0.5,
-4.10194, -4.78768, 0.166431, 1, -0.5, 0.5, 0.5,
-4.10194, -4.78768, 0.166431, 1, 1.5, 0.5, 0.5,
-4.10194, -4.78768, 0.166431, 0, 1.5, 0.5, 0.5
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
-3, -3.70136, -5.580102,
3, -3.70136, -5.580102,
-3, -3.70136, -5.580102,
-3, -3.882414, -5.867429,
-2, -3.70136, -5.580102,
-2, -3.882414, -5.867429,
-1, -3.70136, -5.580102,
-1, -3.882414, -5.867429,
0, -3.70136, -5.580102,
0, -3.882414, -5.867429,
1, -3.70136, -5.580102,
1, -3.882414, -5.867429,
2, -3.70136, -5.580102,
2, -3.882414, -5.867429,
3, -3.70136, -5.580102,
3, -3.882414, -5.867429
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
-3, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
-3, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
-3, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
-3, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
-2, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
-2, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
-2, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
-2, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
-1, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
-1, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
-1, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
-1, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
0, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
0, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
0, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
0, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
1, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
1, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
1, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
1, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
2, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
2, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
2, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
2, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5,
3, -4.24452, -6.442082, 0, -0.5, 0.5, 0.5,
3, -4.24452, -6.442082, 1, -0.5, 0.5, 0.5,
3, -4.24452, -6.442082, 1, 1.5, 0.5, 0.5,
3, -4.24452, -6.442082, 0, 1.5, 0.5, 0.5
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
-3.114687, -2, -5.580102,
-3.114687, 2, -5.580102,
-3.114687, -2, -5.580102,
-3.279229, -2, -5.867429,
-3.114687, 0, -5.580102,
-3.279229, 0, -5.867429,
-3.114687, 2, -5.580102,
-3.279229, 2, -5.867429
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
-3.608314, -2, -6.442082, 0, -0.5, 0.5, 0.5,
-3.608314, -2, -6.442082, 1, -0.5, 0.5, 0.5,
-3.608314, -2, -6.442082, 1, 1.5, 0.5, 0.5,
-3.608314, -2, -6.442082, 0, 1.5, 0.5, 0.5,
-3.608314, 0, -6.442082, 0, -0.5, 0.5, 0.5,
-3.608314, 0, -6.442082, 1, -0.5, 0.5, 0.5,
-3.608314, 0, -6.442082, 1, 1.5, 0.5, 0.5,
-3.608314, 0, -6.442082, 0, 1.5, 0.5, 0.5,
-3.608314, 2, -6.442082, 0, -0.5, 0.5, 0.5,
-3.608314, 2, -6.442082, 1, -0.5, 0.5, 0.5,
-3.608314, 2, -6.442082, 1, 1.5, 0.5, 0.5,
-3.608314, 2, -6.442082, 0, 1.5, 0.5, 0.5
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
-3.114687, -3.70136, -4,
-3.114687, -3.70136, 4,
-3.114687, -3.70136, -4,
-3.279229, -3.882414, -4,
-3.114687, -3.70136, -2,
-3.279229, -3.882414, -2,
-3.114687, -3.70136, 0,
-3.279229, -3.882414, 0,
-3.114687, -3.70136, 2,
-3.279229, -3.882414, 2,
-3.114687, -3.70136, 4,
-3.279229, -3.882414, 4
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
-3.608314, -4.24452, -4, 0, -0.5, 0.5, 0.5,
-3.608314, -4.24452, -4, 1, -0.5, 0.5, 0.5,
-3.608314, -4.24452, -4, 1, 1.5, 0.5, 0.5,
-3.608314, -4.24452, -4, 0, 1.5, 0.5, 0.5,
-3.608314, -4.24452, -2, 0, -0.5, 0.5, 0.5,
-3.608314, -4.24452, -2, 1, -0.5, 0.5, 0.5,
-3.608314, -4.24452, -2, 1, 1.5, 0.5, 0.5,
-3.608314, -4.24452, -2, 0, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 0, 0, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 0, 1, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 0, 1, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 0, 0, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 2, 0, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 2, 1, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 2, 1, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 2, 0, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 4, 0, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 4, 1, -0.5, 0.5, 0.5,
-3.608314, -4.24452, 4, 1, 1.5, 0.5, 0.5,
-3.608314, -4.24452, 4, 0, 1.5, 0.5, 0.5
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
-3.114687, -3.70136, -5.580102,
-3.114687, 3.540771, -5.580102,
-3.114687, -3.70136, 5.912964,
-3.114687, 3.540771, 5.912964,
-3.114687, -3.70136, -5.580102,
-3.114687, -3.70136, 5.912964,
-3.114687, 3.540771, -5.580102,
-3.114687, 3.540771, 5.912964,
-3.114687, -3.70136, -5.580102,
3.466999, -3.70136, -5.580102,
-3.114687, -3.70136, 5.912964,
3.466999, -3.70136, 5.912964,
-3.114687, 3.540771, -5.580102,
3.466999, 3.540771, -5.580102,
-3.114687, 3.540771, 5.912964,
3.466999, 3.540771, 5.912964,
3.466999, -3.70136, -5.580102,
3.466999, 3.540771, -5.580102,
3.466999, -3.70136, 5.912964,
3.466999, 3.540771, 5.912964,
3.466999, -3.70136, -5.580102,
3.466999, -3.70136, 5.912964,
3.466999, 3.540771, -5.580102,
3.466999, 3.540771, 5.912964
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
var radius = 8.060412;
var distance = 35.86168;
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
mvMatrix.translate( -0.1761559, 0.08029497, -0.166431 );
mvMatrix.scale( 1.32414, 1.203386, 0.7582899 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.86168);
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

