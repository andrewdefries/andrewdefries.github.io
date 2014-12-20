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
-3.219789, -2.186609, -2.473803, 1, 0, 0, 1,
-3.089761, -1.108137, -1.077149, 1, 0.007843138, 0, 1,
-2.916426, 1.278126, -0.6474097, 1, 0.01176471, 0, 1,
-2.691795, 0.002071986, -0.49902, 1, 0.01960784, 0, 1,
-2.597265, -1.498549, -0.952902, 1, 0.02352941, 0, 1,
-2.558162, 2.272838, -1.533336, 1, 0.03137255, 0, 1,
-2.507678, -0.2981599, -1.524868, 1, 0.03529412, 0, 1,
-2.412547, 1.533599, -0.6843067, 1, 0.04313726, 0, 1,
-2.405988, 0.5934331, -1.762198, 1, 0.04705882, 0, 1,
-2.350888, 1.003088, -0.3318401, 1, 0.05490196, 0, 1,
-2.296403, 1.694021, -0.6969194, 1, 0.05882353, 0, 1,
-2.268535, -1.038411, -2.086565, 1, 0.06666667, 0, 1,
-2.217212, -0.08345292, -1.777623, 1, 0.07058824, 0, 1,
-2.214535, -0.8655501, -1.261254, 1, 0.07843138, 0, 1,
-2.206382, 0.8512544, -2.074859, 1, 0.08235294, 0, 1,
-2.203276, -0.9368796, -2.705647, 1, 0.09019608, 0, 1,
-2.197512, -1.102687, -1.131992, 1, 0.09411765, 0, 1,
-2.122937, -0.1648808, -3.552748, 1, 0.1019608, 0, 1,
-2.121229, -2.70431, -0.7031983, 1, 0.1098039, 0, 1,
-2.118477, -0.5939535, -2.269352, 1, 0.1137255, 0, 1,
-2.100841, -0.301181, -1.302727, 1, 0.1215686, 0, 1,
-2.08319, 0.7766896, -1.555594, 1, 0.1254902, 0, 1,
-2.073022, -0.7964607, -1.788258, 1, 0.1333333, 0, 1,
-2.071241, 0.3012272, -2.308753, 1, 0.1372549, 0, 1,
-1.952693, -0.7527051, -1.987161, 1, 0.145098, 0, 1,
-1.92318, 0.7496065, -0.3438319, 1, 0.1490196, 0, 1,
-1.889338, 0.9934552, -3.261449, 1, 0.1568628, 0, 1,
-1.887456, 1.233219, -0.360247, 1, 0.1607843, 0, 1,
-1.879665, -0.6580113, -1.665301, 1, 0.1686275, 0, 1,
-1.879376, 1.477109, -0.09817491, 1, 0.172549, 0, 1,
-1.853585, -0.718577, -0.9035939, 1, 0.1803922, 0, 1,
-1.839274, 0.5534783, -1.853734, 1, 0.1843137, 0, 1,
-1.835414, -0.3239862, -2.790865, 1, 0.1921569, 0, 1,
-1.831138, 0.1752318, -1.450986, 1, 0.1960784, 0, 1,
-1.790762, 0.2066502, -2.293086, 1, 0.2039216, 0, 1,
-1.786049, -0.6397497, -1.491368, 1, 0.2117647, 0, 1,
-1.785607, 0.6829714, -0.5883517, 1, 0.2156863, 0, 1,
-1.76629, 0.518851, -0.9638088, 1, 0.2235294, 0, 1,
-1.76473, 0.6314273, -1.425373, 1, 0.227451, 0, 1,
-1.764505, -1.901758, -1.941651, 1, 0.2352941, 0, 1,
-1.754214, 0.05348384, 0.1368092, 1, 0.2392157, 0, 1,
-1.753603, 0.7691566, -0.1882559, 1, 0.2470588, 0, 1,
-1.738756, -1.115803, -1.9528, 1, 0.2509804, 0, 1,
-1.716719, -1.077676, -2.670197, 1, 0.2588235, 0, 1,
-1.711472, 0.8717571, -0.2010966, 1, 0.2627451, 0, 1,
-1.707276, 0.6985187, -1.615176, 1, 0.2705882, 0, 1,
-1.700573, -0.6293054, -1.333124, 1, 0.2745098, 0, 1,
-1.681177, -3.050941, -4.437386, 1, 0.282353, 0, 1,
-1.670729, 0.3251989, -2.215504, 1, 0.2862745, 0, 1,
-1.657067, 0.5759654, -0.8281815, 1, 0.2941177, 0, 1,
-1.652632, -1.525008, -1.955111, 1, 0.3019608, 0, 1,
-1.627098, 1.44676, -2.075137, 1, 0.3058824, 0, 1,
-1.620255, -0.3244759, -3.150114, 1, 0.3137255, 0, 1,
-1.610876, 0.2853118, -3.046066, 1, 0.3176471, 0, 1,
-1.605894, 1.864181, -0.8017132, 1, 0.3254902, 0, 1,
-1.590837, -1.217853, -1.882707, 1, 0.3294118, 0, 1,
-1.59042, 2.42062, 0.1879311, 1, 0.3372549, 0, 1,
-1.587005, 2.030905, -0.4299961, 1, 0.3411765, 0, 1,
-1.584079, -1.946814, -1.82523, 1, 0.3490196, 0, 1,
-1.57666, -0.1240381, -1.554571, 1, 0.3529412, 0, 1,
-1.565869, 0.9135237, -0.5604283, 1, 0.3607843, 0, 1,
-1.562343, -1.298669, -3.630948, 1, 0.3647059, 0, 1,
-1.553332, -0.4027935, -1.574569, 1, 0.372549, 0, 1,
-1.550395, 0.3247564, -2.956695, 1, 0.3764706, 0, 1,
-1.545484, 0.3267494, -0.1656383, 1, 0.3843137, 0, 1,
-1.545168, 0.9525573, -2.2744, 1, 0.3882353, 0, 1,
-1.53478, 0.5665911, -0.4819712, 1, 0.3960784, 0, 1,
-1.532405, -1.449854, -3.68213, 1, 0.4039216, 0, 1,
-1.479969, 0.7136954, -0.6160706, 1, 0.4078431, 0, 1,
-1.478486, 0.7503034, -0.01492156, 1, 0.4156863, 0, 1,
-1.477474, -1.771387, -2.476188, 1, 0.4196078, 0, 1,
-1.470004, 0.09122439, -3.296758, 1, 0.427451, 0, 1,
-1.469703, -0.009682735, -1.742909, 1, 0.4313726, 0, 1,
-1.467499, -0.8501688, -1.974494, 1, 0.4392157, 0, 1,
-1.465473, 0.5675792, -1.534445, 1, 0.4431373, 0, 1,
-1.462913, -1.946436, -2.771924, 1, 0.4509804, 0, 1,
-1.457006, 0.3314883, -2.039274, 1, 0.454902, 0, 1,
-1.442278, -0.1848155, -0.1086487, 1, 0.4627451, 0, 1,
-1.437466, -0.9020548, -2.749239, 1, 0.4666667, 0, 1,
-1.427449, 1.363266, -0.9678688, 1, 0.4745098, 0, 1,
-1.419715, -0.6231444, -4.834351, 1, 0.4784314, 0, 1,
-1.418982, 1.787648, -1.276145, 1, 0.4862745, 0, 1,
-1.402054, -0.02109656, -2.636311, 1, 0.4901961, 0, 1,
-1.391304, -0.5275511, -2.21421, 1, 0.4980392, 0, 1,
-1.370286, -0.3565227, -0.9372658, 1, 0.5058824, 0, 1,
-1.364238, 0.5978175, -0.07787146, 1, 0.509804, 0, 1,
-1.354873, 1.19089, -0.7638235, 1, 0.5176471, 0, 1,
-1.354596, 1.029521, -1.654804, 1, 0.5215687, 0, 1,
-1.350585, -0.8580291, -3.544767, 1, 0.5294118, 0, 1,
-1.348663, 0.751428, 0.3249406, 1, 0.5333334, 0, 1,
-1.34335, -0.3144174, 0.1472283, 1, 0.5411765, 0, 1,
-1.338063, -2.086867, -4.455814, 1, 0.5450981, 0, 1,
-1.327954, 0.4855857, -1.47915, 1, 0.5529412, 0, 1,
-1.319721, -0.9874122, -2.65987, 1, 0.5568628, 0, 1,
-1.304799, 0.6781421, 0.9569309, 1, 0.5647059, 0, 1,
-1.303715, -0.268553, -2.441572, 1, 0.5686275, 0, 1,
-1.301371, -0.314164, -0.6933434, 1, 0.5764706, 0, 1,
-1.299826, 1.047096, -0.257368, 1, 0.5803922, 0, 1,
-1.297505, 0.9843677, -1.412631, 1, 0.5882353, 0, 1,
-1.295295, 0.6802366, -1.358408, 1, 0.5921569, 0, 1,
-1.28831, -0.5948388, -1.916831, 1, 0.6, 0, 1,
-1.288292, -2.108696, -2.942595, 1, 0.6078432, 0, 1,
-1.287066, 0.5082988, 0.06680892, 1, 0.6117647, 0, 1,
-1.266416, 2.000272, 0.08679996, 1, 0.6196079, 0, 1,
-1.262929, 1.054299, -1.163091, 1, 0.6235294, 0, 1,
-1.261397, -0.4462659, -1.399101, 1, 0.6313726, 0, 1,
-1.250653, -1.243528, -3.066162, 1, 0.6352941, 0, 1,
-1.248927, -0.1188056, -0.7639489, 1, 0.6431373, 0, 1,
-1.248658, -0.6614817, -3.690954, 1, 0.6470588, 0, 1,
-1.243409, -0.2343609, -1.798136, 1, 0.654902, 0, 1,
-1.225568, -0.2020582, -0.4479727, 1, 0.6588235, 0, 1,
-1.214846, 0.4136928, -0.9511688, 1, 0.6666667, 0, 1,
-1.209281, -0.3668185, -1.158856, 1, 0.6705883, 0, 1,
-1.202714, -0.1210402, -1.943784, 1, 0.6784314, 0, 1,
-1.200692, 0.08546668, -1.473852, 1, 0.682353, 0, 1,
-1.198832, 0.377827, -1.567175, 1, 0.6901961, 0, 1,
-1.196698, 1.277949, -1.820973, 1, 0.6941177, 0, 1,
-1.19646, -0.4897671, -2.101651, 1, 0.7019608, 0, 1,
-1.188711, 0.7210924, -2.271474, 1, 0.7098039, 0, 1,
-1.185656, 0.5415047, -0.4354308, 1, 0.7137255, 0, 1,
-1.183663, -0.5315772, -1.395862, 1, 0.7215686, 0, 1,
-1.181441, -1.010355, -3.904666, 1, 0.7254902, 0, 1,
-1.175451, -2.242971, -2.909749, 1, 0.7333333, 0, 1,
-1.168075, 0.7839787, -1.6484, 1, 0.7372549, 0, 1,
-1.167052, 0.2712317, -0.7910269, 1, 0.7450981, 0, 1,
-1.165667, 1.179586, -1.539631, 1, 0.7490196, 0, 1,
-1.162082, -0.199347, -2.245362, 1, 0.7568628, 0, 1,
-1.160532, 1.443854, -2.333733, 1, 0.7607843, 0, 1,
-1.158211, 2.161541, 0.7937636, 1, 0.7686275, 0, 1,
-1.155355, 0.8074929, -0.7791385, 1, 0.772549, 0, 1,
-1.155353, -0.2443328, -0.09983102, 1, 0.7803922, 0, 1,
-1.153077, 1.406919, 0.4756427, 1, 0.7843137, 0, 1,
-1.14952, 0.4926609, -0.4121273, 1, 0.7921569, 0, 1,
-1.128258, -0.9261218, -3.229781, 1, 0.7960784, 0, 1,
-1.127235, 1.019828, -0.4276562, 1, 0.8039216, 0, 1,
-1.111942, -0.4188838, -0.9194531, 1, 0.8117647, 0, 1,
-1.11157, -0.08747824, -2.317753, 1, 0.8156863, 0, 1,
-1.109144, 0.3909248, -1.073241, 1, 0.8235294, 0, 1,
-1.108322, -1.172833, -1.342077, 1, 0.827451, 0, 1,
-1.107355, -1.213809, -1.470776, 1, 0.8352941, 0, 1,
-1.088168, 1.011202, -0.008079939, 1, 0.8392157, 0, 1,
-1.081125, -0.8952098, -1.236621, 1, 0.8470588, 0, 1,
-1.077796, 0.6187988, -0.4929348, 1, 0.8509804, 0, 1,
-1.071958, 0.8530373, -0.7617044, 1, 0.8588235, 0, 1,
-1.061486, 1.743631, -0.8547678, 1, 0.8627451, 0, 1,
-1.059787, -0.6289743, -1.415741, 1, 0.8705882, 0, 1,
-1.058072, 1.13951, -0.9410721, 1, 0.8745098, 0, 1,
-1.045418, -0.6284745, -3.748559, 1, 0.8823529, 0, 1,
-1.045278, 2.219996, -0.3357579, 1, 0.8862745, 0, 1,
-1.045082, 0.3537606, -3.732399, 1, 0.8941177, 0, 1,
-1.040023, 0.4865201, 0.3974084, 1, 0.8980392, 0, 1,
-1.0333, 0.879522, -0.3221644, 1, 0.9058824, 0, 1,
-1.033142, 0.7992095, 0.08825739, 1, 0.9137255, 0, 1,
-1.033073, 1.615484, -0.6128254, 1, 0.9176471, 0, 1,
-1.026099, -1.388853, -3.85459, 1, 0.9254902, 0, 1,
-1.024677, -0.2158434, -1.909107, 1, 0.9294118, 0, 1,
-1.013061, 1.994096, -1.637628, 1, 0.9372549, 0, 1,
-1.011162, -0.6543069, 0.05132262, 1, 0.9411765, 0, 1,
-1.010159, -0.3943444, -2.630184, 1, 0.9490196, 0, 1,
-1.008711, -0.1054169, -0.4642217, 1, 0.9529412, 0, 1,
-1.008104, 1.441981, -1.719759, 1, 0.9607843, 0, 1,
-1.005922, 0.1475803, -0.5778593, 1, 0.9647059, 0, 1,
-1.003256, -0.4497097, -0.9146585, 1, 0.972549, 0, 1,
-1.000966, -0.1482883, -0.3319403, 1, 0.9764706, 0, 1,
-0.9981719, 1.30765, -1.910659, 1, 0.9843137, 0, 1,
-0.9966996, -0.5995021, -2.833366, 1, 0.9882353, 0, 1,
-0.9952806, -1.924431, -3.769809, 1, 0.9960784, 0, 1,
-0.9943604, 2.561812, 0.917926, 0.9960784, 1, 0, 1,
-0.9895957, -0.9062557, -1.43779, 0.9921569, 1, 0, 1,
-0.9859009, 0.0164008, -2.227046, 0.9843137, 1, 0, 1,
-0.9748763, -1.204142, -2.434323, 0.9803922, 1, 0, 1,
-0.9732293, 0.7573171, -2.404407, 0.972549, 1, 0, 1,
-0.9730521, 0.4513569, -3.547225, 0.9686275, 1, 0, 1,
-0.9699762, -0.5966299, -2.301683, 0.9607843, 1, 0, 1,
-0.9668193, 0.7646819, -0.1334207, 0.9568627, 1, 0, 1,
-0.965367, 1.21934, -0.06140803, 0.9490196, 1, 0, 1,
-0.9646728, 0.3163262, -1.526011, 0.945098, 1, 0, 1,
-0.9627199, 0.6626835, -0.2277585, 0.9372549, 1, 0, 1,
-0.9589824, -0.7990955, -2.453542, 0.9333333, 1, 0, 1,
-0.9585873, -0.3084131, -1.214204, 0.9254902, 1, 0, 1,
-0.9569681, -0.05714351, -2.024954, 0.9215686, 1, 0, 1,
-0.9561979, -0.4320015, -1.058692, 0.9137255, 1, 0, 1,
-0.9492702, 2.122477, 0.313056, 0.9098039, 1, 0, 1,
-0.9341045, -0.5050846, -1.309022, 0.9019608, 1, 0, 1,
-0.9336328, -0.5122543, -2.723263, 0.8941177, 1, 0, 1,
-0.932454, 0.8023291, -2.0641, 0.8901961, 1, 0, 1,
-0.9134052, 0.4360653, 1.404011, 0.8823529, 1, 0, 1,
-0.9116675, 0.1235973, -2.672117, 0.8784314, 1, 0, 1,
-0.9100513, -1.017306, -1.786715, 0.8705882, 1, 0, 1,
-0.9090917, -0.7491865, -1.165768, 0.8666667, 1, 0, 1,
-0.9068905, 1.325295, -2.180439, 0.8588235, 1, 0, 1,
-0.9068835, -3.150405, -1.045518, 0.854902, 1, 0, 1,
-0.906189, 0.7796729, -1.099803, 0.8470588, 1, 0, 1,
-0.9048945, 0.2801576, 0.557828, 0.8431373, 1, 0, 1,
-0.9022369, -0.3120365, -2.413801, 0.8352941, 1, 0, 1,
-0.900759, -1.997256, -2.563411, 0.8313726, 1, 0, 1,
-0.8985825, -0.4678936, -1.206275, 0.8235294, 1, 0, 1,
-0.8980644, 0.08118273, -1.02345, 0.8196079, 1, 0, 1,
-0.8731118, -0.3423795, -2.453184, 0.8117647, 1, 0, 1,
-0.8700464, 0.1201554, -1.415881, 0.8078431, 1, 0, 1,
-0.867964, -1.934496, -2.148488, 0.8, 1, 0, 1,
-0.8628849, 1.623185, -2.241381, 0.7921569, 1, 0, 1,
-0.8586879, 1.004812, -1.891004, 0.7882353, 1, 0, 1,
-0.8552611, -0.4298101, -0.8610497, 0.7803922, 1, 0, 1,
-0.8521581, 0.2085487, -2.626474, 0.7764706, 1, 0, 1,
-0.8517414, 0.9035298, -1.186483, 0.7686275, 1, 0, 1,
-0.848977, 0.1536756, -0.4327813, 0.7647059, 1, 0, 1,
-0.8460299, 0.9644938, -0.8197162, 0.7568628, 1, 0, 1,
-0.8380599, -0.3509509, -0.8817685, 0.7529412, 1, 0, 1,
-0.8370454, 0.290073, -1.92073, 0.7450981, 1, 0, 1,
-0.8363728, 1.769862, -1.41567, 0.7411765, 1, 0, 1,
-0.8352616, -2.044592, -2.741716, 0.7333333, 1, 0, 1,
-0.833025, -0.5614911, -1.386273, 0.7294118, 1, 0, 1,
-0.8320372, 1.796914, 0.730949, 0.7215686, 1, 0, 1,
-0.8263572, 0.1060144, -1.8899, 0.7176471, 1, 0, 1,
-0.8177004, 0.2244276, -2.087142, 0.7098039, 1, 0, 1,
-0.8134974, 0.1932196, -2.16661, 0.7058824, 1, 0, 1,
-0.7971562, 0.7616941, -1.826238, 0.6980392, 1, 0, 1,
-0.7964926, -1.128557, -3.732254, 0.6901961, 1, 0, 1,
-0.7960998, 0.9780942, 1.092305, 0.6862745, 1, 0, 1,
-0.7955483, -3.01147, -3.195175, 0.6784314, 1, 0, 1,
-0.7928678, 2.134315, 0.1280535, 0.6745098, 1, 0, 1,
-0.7909177, 0.0727753, -0.5314916, 0.6666667, 1, 0, 1,
-0.7818806, -0.7237318, -3.020916, 0.6627451, 1, 0, 1,
-0.7720896, -0.06893092, -1.974105, 0.654902, 1, 0, 1,
-0.7586164, -1.482391, -3.19755, 0.6509804, 1, 0, 1,
-0.7575225, 0.3951207, -1.388882, 0.6431373, 1, 0, 1,
-0.7513528, 0.1049056, -2.568659, 0.6392157, 1, 0, 1,
-0.7446765, 0.9813301, -0.9682893, 0.6313726, 1, 0, 1,
-0.7434399, -1.451159, -4.63694, 0.627451, 1, 0, 1,
-0.7382207, -0.4066196, -1.518733, 0.6196079, 1, 0, 1,
-0.7378181, 0.2908703, -0.9534071, 0.6156863, 1, 0, 1,
-0.7364424, 1.53942, -0.4520311, 0.6078432, 1, 0, 1,
-0.7338958, -0.09233566, -1.275585, 0.6039216, 1, 0, 1,
-0.7299255, -0.01211191, -1.437479, 0.5960785, 1, 0, 1,
-0.7286707, 0.3561909, -3.141264, 0.5882353, 1, 0, 1,
-0.7242482, 1.096456, -0.9169573, 0.5843138, 1, 0, 1,
-0.7236385, 1.172076, -0.2836094, 0.5764706, 1, 0, 1,
-0.7231792, 0.648122, -2.116149, 0.572549, 1, 0, 1,
-0.7160082, -1.491457, -1.215922, 0.5647059, 1, 0, 1,
-0.7139096, 0.4522255, -1.913349, 0.5607843, 1, 0, 1,
-0.7133359, -1.163327, -1.364895, 0.5529412, 1, 0, 1,
-0.7100265, -1.460055, -3.419375, 0.5490196, 1, 0, 1,
-0.7061734, -0.08810629, -1.17639, 0.5411765, 1, 0, 1,
-0.7058492, -1.655608, -2.585633, 0.5372549, 1, 0, 1,
-0.6963454, 1.947211, 1.096009, 0.5294118, 1, 0, 1,
-0.6927549, -0.8870919, -0.4232906, 0.5254902, 1, 0, 1,
-0.6925743, 2.108362, -1.034216, 0.5176471, 1, 0, 1,
-0.692519, -0.1869784, -2.634492, 0.5137255, 1, 0, 1,
-0.6853274, -0.8870845, -4.299066, 0.5058824, 1, 0, 1,
-0.6825939, 1.602782, -1.045087, 0.5019608, 1, 0, 1,
-0.6787828, -1.059692, -3.736155, 0.4941176, 1, 0, 1,
-0.6776385, 0.2004828, -1.755031, 0.4862745, 1, 0, 1,
-0.6729794, -0.1562523, -1.980417, 0.4823529, 1, 0, 1,
-0.6682535, 2.057553, 0.3414446, 0.4745098, 1, 0, 1,
-0.664348, -0.3852454, -1.092782, 0.4705882, 1, 0, 1,
-0.6634769, -1.2514, -2.962039, 0.4627451, 1, 0, 1,
-0.6618946, 0.1579648, -3.127353, 0.4588235, 1, 0, 1,
-0.6601591, -1.062263, -3.513016, 0.4509804, 1, 0, 1,
-0.6568905, 0.922688, -0.5906224, 0.4470588, 1, 0, 1,
-0.6566581, -1.269592, -2.652223, 0.4392157, 1, 0, 1,
-0.6453854, -0.1868635, -0.6430498, 0.4352941, 1, 0, 1,
-0.6453503, -1.288956, -1.88471, 0.427451, 1, 0, 1,
-0.6426004, 1.285924, -1.477095, 0.4235294, 1, 0, 1,
-0.641525, -0.1926845, -3.942493, 0.4156863, 1, 0, 1,
-0.6392862, -0.2809078, -2.06405, 0.4117647, 1, 0, 1,
-0.6357372, -0.4313027, -2.740535, 0.4039216, 1, 0, 1,
-0.6260656, -0.3975282, -2.909518, 0.3960784, 1, 0, 1,
-0.6246037, 0.8972401, -0.9658684, 0.3921569, 1, 0, 1,
-0.6242755, 0.3578886, -0.4608257, 0.3843137, 1, 0, 1,
-0.6185322, 0.9156442, 1.578104, 0.3803922, 1, 0, 1,
-0.6176434, -0.5753576, -2.479215, 0.372549, 1, 0, 1,
-0.6167254, 0.2254853, -0.573116, 0.3686275, 1, 0, 1,
-0.6163088, 0.5518469, -2.58348, 0.3607843, 1, 0, 1,
-0.6161281, 1.662096, 0.2044194, 0.3568628, 1, 0, 1,
-0.6101423, 0.02386575, -1.488746, 0.3490196, 1, 0, 1,
-0.6080828, 0.787118, -1.160469, 0.345098, 1, 0, 1,
-0.6033013, -2.602894, -3.205468, 0.3372549, 1, 0, 1,
-0.6015745, -0.2613179, -2.453169, 0.3333333, 1, 0, 1,
-0.5900078, 1.954203, -0.09917159, 0.3254902, 1, 0, 1,
-0.5897092, -0.5974808, -2.544774, 0.3215686, 1, 0, 1,
-0.5841948, 0.1276857, -1.328207, 0.3137255, 1, 0, 1,
-0.5802919, -0.0003539408, -3.789049, 0.3098039, 1, 0, 1,
-0.5799195, 0.3894737, -0.5660602, 0.3019608, 1, 0, 1,
-0.5768255, 1.023362, -0.7746075, 0.2941177, 1, 0, 1,
-0.5764959, -0.007148966, 0.3833382, 0.2901961, 1, 0, 1,
-0.5712292, 1.191507, -0.6960362, 0.282353, 1, 0, 1,
-0.5645276, 0.263083, -1.934234, 0.2784314, 1, 0, 1,
-0.5617235, -0.8430238, -1.103622, 0.2705882, 1, 0, 1,
-0.5612391, -0.4910828, -4.107402, 0.2666667, 1, 0, 1,
-0.5548819, 0.6729594, 0.6284766, 0.2588235, 1, 0, 1,
-0.548588, -1.262954, -2.870203, 0.254902, 1, 0, 1,
-0.5482156, -1.040947, -2.006412, 0.2470588, 1, 0, 1,
-0.5481082, -0.5815648, -5.092317, 0.2431373, 1, 0, 1,
-0.5445156, 1.900374, 1.865967, 0.2352941, 1, 0, 1,
-0.5430425, -0.2268479, -2.873674, 0.2313726, 1, 0, 1,
-0.5350821, 1.186365, -0.4152297, 0.2235294, 1, 0, 1,
-0.5321301, -0.4803106, -2.472828, 0.2196078, 1, 0, 1,
-0.5293643, 0.4766534, -0.9147694, 0.2117647, 1, 0, 1,
-0.5289558, 0.566234, 0.04431961, 0.2078431, 1, 0, 1,
-0.5289457, -0.3714948, -0.6860477, 0.2, 1, 0, 1,
-0.5278456, 1.013585, -0.4402888, 0.1921569, 1, 0, 1,
-0.5232015, -0.4271884, -2.670124, 0.1882353, 1, 0, 1,
-0.5216588, -0.1922092, -1.034195, 0.1803922, 1, 0, 1,
-0.5210602, 0.9120405, -0.6993812, 0.1764706, 1, 0, 1,
-0.5177947, 0.7093137, -1.703893, 0.1686275, 1, 0, 1,
-0.5146661, 0.6159554, 0.2892678, 0.1647059, 1, 0, 1,
-0.5117086, 2.518281, -2.11001, 0.1568628, 1, 0, 1,
-0.5098044, 0.4516901, -0.1019952, 0.1529412, 1, 0, 1,
-0.5066599, 1.181388, -1.576161, 0.145098, 1, 0, 1,
-0.5063062, -1.403183, -1.424259, 0.1411765, 1, 0, 1,
-0.5054491, -1.860848, -4.19453, 0.1333333, 1, 0, 1,
-0.50497, -0.6878434, -3.128772, 0.1294118, 1, 0, 1,
-0.5041004, -0.2381533, -1.662377, 0.1215686, 1, 0, 1,
-0.5040616, 1.049141, -1.555916, 0.1176471, 1, 0, 1,
-0.5023774, 0.3166181, 0.273104, 0.1098039, 1, 0, 1,
-0.5006946, 0.1934523, -0.9118041, 0.1058824, 1, 0, 1,
-0.4966115, 0.1980189, -1.96057, 0.09803922, 1, 0, 1,
-0.4879777, 1.478501, -0.9968683, 0.09019608, 1, 0, 1,
-0.4854436, -0.6184033, -2.685648, 0.08627451, 1, 0, 1,
-0.4847579, 0.4466413, -0.030591, 0.07843138, 1, 0, 1,
-0.4843782, -0.3214915, -1.137975, 0.07450981, 1, 0, 1,
-0.4696484, 0.3082897, -2.024193, 0.06666667, 1, 0, 1,
-0.4686844, -0.5177149, -2.645342, 0.0627451, 1, 0, 1,
-0.4667358, -0.3343083, -3.220812, 0.05490196, 1, 0, 1,
-0.4658691, -1.436902, -2.639384, 0.05098039, 1, 0, 1,
-0.4648159, -1.05223, -4.225816, 0.04313726, 1, 0, 1,
-0.4603381, 0.04774427, -1.476217, 0.03921569, 1, 0, 1,
-0.4586114, 0.2439342, -1.203425, 0.03137255, 1, 0, 1,
-0.4573336, 0.6838713, -0.1186752, 0.02745098, 1, 0, 1,
-0.4572371, 0.006672377, -1.114609, 0.01960784, 1, 0, 1,
-0.4571929, 1.645488, 0.9986804, 0.01568628, 1, 0, 1,
-0.4567566, -0.5890846, -3.144828, 0.007843138, 1, 0, 1,
-0.4540787, -0.2058243, -1.20595, 0.003921569, 1, 0, 1,
-0.4539889, 1.771137, -0.8627805, 0, 1, 0.003921569, 1,
-0.4510472, 0.7372888, -0.8348844, 0, 1, 0.01176471, 1,
-0.4475103, -0.09802618, -1.362761, 0, 1, 0.01568628, 1,
-0.444452, -0.5548622, -2.135375, 0, 1, 0.02352941, 1,
-0.4431784, 0.6277166, 1.190019, 0, 1, 0.02745098, 1,
-0.4428739, 0.9949876, -1.416371, 0, 1, 0.03529412, 1,
-0.4398462, 1.211482, -0.3607755, 0, 1, 0.03921569, 1,
-0.4312518, -0.825682, -3.329889, 0, 1, 0.04705882, 1,
-0.4294747, -0.2564668, -1.779486, 0, 1, 0.05098039, 1,
-0.4284165, -0.02302938, -1.702418, 0, 1, 0.05882353, 1,
-0.4263237, -0.23857, -2.565926, 0, 1, 0.0627451, 1,
-0.4224593, 0.7476356, 0.5728118, 0, 1, 0.07058824, 1,
-0.4208115, 0.2364868, -1.975051, 0, 1, 0.07450981, 1,
-0.4204752, 0.03073584, -0.4138137, 0, 1, 0.08235294, 1,
-0.418766, 0.2191652, -0.7847852, 0, 1, 0.08627451, 1,
-0.417597, 2.431856, 1.209176, 0, 1, 0.09411765, 1,
-0.4171706, -1.851332, -3.048514, 0, 1, 0.1019608, 1,
-0.4169435, 1.001267, 0.0892907, 0, 1, 0.1058824, 1,
-0.4118422, -0.1063431, -2.687847, 0, 1, 0.1137255, 1,
-0.4059311, 0.0680768, -3.121346, 0, 1, 0.1176471, 1,
-0.4053189, -0.5849718, -3.814513, 0, 1, 0.1254902, 1,
-0.40172, -0.3180504, -1.403237, 0, 1, 0.1294118, 1,
-0.4008311, -0.1188781, -1.00283, 0, 1, 0.1372549, 1,
-0.4000368, -0.7573619, -2.398358, 0, 1, 0.1411765, 1,
-0.3984051, -1.873298, -3.339514, 0, 1, 0.1490196, 1,
-0.3946013, -0.5897574, -2.628129, 0, 1, 0.1529412, 1,
-0.3942135, -0.3053743, -1.798221, 0, 1, 0.1607843, 1,
-0.3921197, -0.09070248, -0.8046473, 0, 1, 0.1647059, 1,
-0.3920675, -1.488394, -2.564083, 0, 1, 0.172549, 1,
-0.383874, -0.7588342, -1.772415, 0, 1, 0.1764706, 1,
-0.3808946, 0.1681569, -0.8776725, 0, 1, 0.1843137, 1,
-0.3800707, -0.789306, -3.961044, 0, 1, 0.1882353, 1,
-0.3759854, -0.1209811, -0.8656439, 0, 1, 0.1960784, 1,
-0.374319, -0.5353922, -3.553345, 0, 1, 0.2039216, 1,
-0.3736725, 0.3016812, -2.158595, 0, 1, 0.2078431, 1,
-0.370952, 0.3134483, -0.2592579, 0, 1, 0.2156863, 1,
-0.3674683, -0.630059, -3.856381, 0, 1, 0.2196078, 1,
-0.3645149, 2.409098, -1.360079, 0, 1, 0.227451, 1,
-0.3604463, -0.05914719, -0.9631992, 0, 1, 0.2313726, 1,
-0.3582969, 0.122396, -1.37678, 0, 1, 0.2392157, 1,
-0.3556475, 0.3920272, -1.309971, 0, 1, 0.2431373, 1,
-0.3554166, -0.1253422, -2.535205, 0, 1, 0.2509804, 1,
-0.3539535, 0.03351111, -2.438882, 0, 1, 0.254902, 1,
-0.3504635, -0.385364, -3.298143, 0, 1, 0.2627451, 1,
-0.3462291, 1.742913, 0.8171602, 0, 1, 0.2666667, 1,
-0.3415252, 0.04313988, -2.154922, 0, 1, 0.2745098, 1,
-0.3392588, -0.09231921, -2.968562, 0, 1, 0.2784314, 1,
-0.3380583, 0.09363325, -1.847753, 0, 1, 0.2862745, 1,
-0.3355033, -0.9315878, -2.542531, 0, 1, 0.2901961, 1,
-0.3316626, 0.1179008, 0.6263467, 0, 1, 0.2980392, 1,
-0.3265436, 0.532461, -1.642178, 0, 1, 0.3058824, 1,
-0.3228305, -1.87287, -1.186179, 0, 1, 0.3098039, 1,
-0.3224446, -0.3449624, -1.843863, 0, 1, 0.3176471, 1,
-0.322185, 1.415905, -1.788449, 0, 1, 0.3215686, 1,
-0.317846, -0.3727503, -3.180717, 0, 1, 0.3294118, 1,
-0.316623, -0.4724441, -1.555049, 0, 1, 0.3333333, 1,
-0.310675, 2.069543, 1.515936, 0, 1, 0.3411765, 1,
-0.3023663, -0.6222967, -2.150789, 0, 1, 0.345098, 1,
-0.3017727, -0.4524987, -2.378028, 0, 1, 0.3529412, 1,
-0.3009863, 1.636494, -1.277633, 0, 1, 0.3568628, 1,
-0.2982697, 1.351394, -1.416819, 0, 1, 0.3647059, 1,
-0.2975543, 1.509217, -0.3821302, 0, 1, 0.3686275, 1,
-0.2966807, 0.9600514, -0.01706528, 0, 1, 0.3764706, 1,
-0.2939586, -0.8570911, -1.606517, 0, 1, 0.3803922, 1,
-0.2936076, 2.011616, -0.5135042, 0, 1, 0.3882353, 1,
-0.2885306, -0.4681251, -2.09432, 0, 1, 0.3921569, 1,
-0.2870279, -0.2345495, -2.649661, 0, 1, 0.4, 1,
-0.2863367, -0.8378555, -3.80021, 0, 1, 0.4078431, 1,
-0.2828619, 0.2883122, -0.5812228, 0, 1, 0.4117647, 1,
-0.2810335, -0.7676053, -2.896404, 0, 1, 0.4196078, 1,
-0.2768061, 0.08604939, -0.9251096, 0, 1, 0.4235294, 1,
-0.2759011, -2.851998, -1.211895, 0, 1, 0.4313726, 1,
-0.2754543, -0.9279907, -2.996348, 0, 1, 0.4352941, 1,
-0.2743454, -1.823302, -2.636604, 0, 1, 0.4431373, 1,
-0.2730097, 0.1761376, -2.410948, 0, 1, 0.4470588, 1,
-0.2715221, -1.432969, -2.751668, 0, 1, 0.454902, 1,
-0.2708668, -0.3713872, -2.340637, 0, 1, 0.4588235, 1,
-0.2663814, 1.096072, 1.600929, 0, 1, 0.4666667, 1,
-0.2652491, -0.1352967, -1.546456, 0, 1, 0.4705882, 1,
-0.2612868, -1.923692, -2.29817, 0, 1, 0.4784314, 1,
-0.2565409, -0.7954073, -4.499855, 0, 1, 0.4823529, 1,
-0.2474693, -0.1447458, -2.824337, 0, 1, 0.4901961, 1,
-0.2422618, -0.8517697, -1.387579, 0, 1, 0.4941176, 1,
-0.2417246, -0.2717989, -4.357362, 0, 1, 0.5019608, 1,
-0.2412625, -1.045511, -2.26223, 0, 1, 0.509804, 1,
-0.2348098, 0.1166637, -1.752912, 0, 1, 0.5137255, 1,
-0.2340817, 1.588376, -0.808865, 0, 1, 0.5215687, 1,
-0.2336444, 1.835341, -0.9891908, 0, 1, 0.5254902, 1,
-0.2326632, 0.4237819, -0.7890053, 0, 1, 0.5333334, 1,
-0.2322837, -0.5889313, -3.358733, 0, 1, 0.5372549, 1,
-0.2281846, -0.4380309, -3.405555, 0, 1, 0.5450981, 1,
-0.2270455, -0.6532758, -2.439841, 0, 1, 0.5490196, 1,
-0.2171534, -0.1780199, -2.428993, 0, 1, 0.5568628, 1,
-0.2161727, 0.2358978, 1.685679, 0, 1, 0.5607843, 1,
-0.2079539, 0.6593141, 0.4059658, 0, 1, 0.5686275, 1,
-0.2058408, -0.8416119, -3.04329, 0, 1, 0.572549, 1,
-0.2048792, 0.295406, 0.08557555, 0, 1, 0.5803922, 1,
-0.2021259, 0.09582482, -0.683809, 0, 1, 0.5843138, 1,
-0.1973866, -1.419433, -3.971786, 0, 1, 0.5921569, 1,
-0.1968697, 1.44773, 0.4624563, 0, 1, 0.5960785, 1,
-0.1929975, -0.9387813, -3.028332, 0, 1, 0.6039216, 1,
-0.1926108, 0.2992838, -0.3570987, 0, 1, 0.6117647, 1,
-0.18547, -0.7629347, -3.528746, 0, 1, 0.6156863, 1,
-0.1787131, -0.4885631, -3.493971, 0, 1, 0.6235294, 1,
-0.1769971, -1.03997, -4.26626, 0, 1, 0.627451, 1,
-0.1765973, 0.4242162, -0.3441515, 0, 1, 0.6352941, 1,
-0.1747183, -1.395208, -2.834329, 0, 1, 0.6392157, 1,
-0.1712597, 0.9457428, -0.4991638, 0, 1, 0.6470588, 1,
-0.1582791, -1.132058, -0.7868111, 0, 1, 0.6509804, 1,
-0.156168, -0.774842, -2.043656, 0, 1, 0.6588235, 1,
-0.1489205, -0.5807253, -2.064231, 0, 1, 0.6627451, 1,
-0.1377011, -0.09418236, -3.462662, 0, 1, 0.6705883, 1,
-0.1363506, -0.4535141, -2.25, 0, 1, 0.6745098, 1,
-0.1355258, -0.8785501, -3.355925, 0, 1, 0.682353, 1,
-0.130231, 1.45073, 0.8208008, 0, 1, 0.6862745, 1,
-0.130013, -1.451925, -2.337519, 0, 1, 0.6941177, 1,
-0.1295156, -1.305612, -1.882367, 0, 1, 0.7019608, 1,
-0.1288442, -0.4652191, -4.212977, 0, 1, 0.7058824, 1,
-0.1225329, -0.1166828, -2.580033, 0, 1, 0.7137255, 1,
-0.1223334, -0.8541104, -4.570313, 0, 1, 0.7176471, 1,
-0.1207056, 0.5567577, -0.3618744, 0, 1, 0.7254902, 1,
-0.1187582, -0.4426191, -3.159825, 0, 1, 0.7294118, 1,
-0.1061753, 0.9088272, -0.3469664, 0, 1, 0.7372549, 1,
-0.1051406, -0.655808, -2.488634, 0, 1, 0.7411765, 1,
-0.1011671, 0.3425047, -0.03104546, 0, 1, 0.7490196, 1,
-0.09960342, 0.005353917, -1.862968, 0, 1, 0.7529412, 1,
-0.09720939, 0.6225163, 1.071268, 0, 1, 0.7607843, 1,
-0.09542248, -1.468118, -3.032121, 0, 1, 0.7647059, 1,
-0.09276554, -1.319754, -1.793802, 0, 1, 0.772549, 1,
-0.08383212, 1.979432, -2.456534, 0, 1, 0.7764706, 1,
-0.08158912, 0.4378935, -0.8643975, 0, 1, 0.7843137, 1,
-0.07934939, 0.5522096, 2.67994, 0, 1, 0.7882353, 1,
-0.07043441, -0.008610953, -0.7992827, 0, 1, 0.7960784, 1,
-0.06930168, -0.3423981, -4.327548, 0, 1, 0.8039216, 1,
-0.06770802, -0.4452853, -2.031993, 0, 1, 0.8078431, 1,
-0.06320766, -1.046568, -1.036607, 0, 1, 0.8156863, 1,
-0.06134235, 0.09625284, -2.220474, 0, 1, 0.8196079, 1,
-0.06108608, -1.436359, -3.87047, 0, 1, 0.827451, 1,
-0.05717491, -0.4237002, -4.21915, 0, 1, 0.8313726, 1,
-0.05180891, -0.4690812, -4.085771, 0, 1, 0.8392157, 1,
-0.04827095, 0.718016, 1.885831, 0, 1, 0.8431373, 1,
-0.04588817, 1.426383, -0.5607946, 0, 1, 0.8509804, 1,
-0.04526537, -0.1492591, -2.13421, 0, 1, 0.854902, 1,
-0.04320832, -0.425436, -2.707861, 0, 1, 0.8627451, 1,
-0.04261689, 0.4127776, -0.4443853, 0, 1, 0.8666667, 1,
-0.03613065, -2.076052, -2.839624, 0, 1, 0.8745098, 1,
-0.03603328, -0.4842197, -3.012413, 0, 1, 0.8784314, 1,
-0.03507861, 0.5333654, -0.4441905, 0, 1, 0.8862745, 1,
-0.0316793, 0.6290572, -1.610556, 0, 1, 0.8901961, 1,
-0.03121005, -1.047273, -2.776807, 0, 1, 0.8980392, 1,
-0.02992792, -0.05545324, -1.949486, 0, 1, 0.9058824, 1,
-0.02549796, -0.08165009, -2.400259, 0, 1, 0.9098039, 1,
-0.02477316, 0.2029712, -2.073846, 0, 1, 0.9176471, 1,
-0.02360192, 0.03184278, 0.05447511, 0, 1, 0.9215686, 1,
-0.01591289, 1.590513, -0.8346748, 0, 1, 0.9294118, 1,
-0.007284464, -1.758621, -2.679576, 0, 1, 0.9333333, 1,
-0.005973201, -0.03330715, -2.848019, 0, 1, 0.9411765, 1,
-0.002543649, 0.9815904, -1.259765, 0, 1, 0.945098, 1,
-0.001199107, -1.083496, -3.539344, 0, 1, 0.9529412, 1,
0.001083154, 0.884604, 0.6517506, 0, 1, 0.9568627, 1,
0.007379169, -0.2238322, 3.165113, 0, 1, 0.9647059, 1,
0.0111408, 0.1866584, -0.908334, 0, 1, 0.9686275, 1,
0.01616104, -0.3336509, 4.983979, 0, 1, 0.9764706, 1,
0.0177222, -0.9432716, 1.762576, 0, 1, 0.9803922, 1,
0.02086938, -2.111491, 2.953147, 0, 1, 0.9882353, 1,
0.02305323, -0.5458845, 2.709468, 0, 1, 0.9921569, 1,
0.02763565, -0.2250285, 2.131929, 0, 1, 1, 1,
0.02942793, 0.9606459, 1.617064, 0, 0.9921569, 1, 1,
0.03017505, 0.05637325, -0.797137, 0, 0.9882353, 1, 1,
0.03246571, -0.8965748, 2.579198, 0, 0.9803922, 1, 1,
0.03521673, 0.412484, 0.5782782, 0, 0.9764706, 1, 1,
0.03597445, 1.131391, 1.07391, 0, 0.9686275, 1, 1,
0.03768764, -0.4804634, 3.869848, 0, 0.9647059, 1, 1,
0.03923414, 1.366302, -0.4012031, 0, 0.9568627, 1, 1,
0.04376962, 1.867259, -2.13363, 0, 0.9529412, 1, 1,
0.04442881, -0.791892, 3.558839, 0, 0.945098, 1, 1,
0.04968372, -0.493155, 2.753202, 0, 0.9411765, 1, 1,
0.05151701, 0.1752508, 0.8380353, 0, 0.9333333, 1, 1,
0.05219244, 0.4554784, -0.2011979, 0, 0.9294118, 1, 1,
0.05270381, 0.8944449, -0.8154031, 0, 0.9215686, 1, 1,
0.05887564, 0.3733325, 1.20205, 0, 0.9176471, 1, 1,
0.06007164, -0.1177892, 2.689306, 0, 0.9098039, 1, 1,
0.06088162, 1.204478, -1.509373, 0, 0.9058824, 1, 1,
0.06206794, -0.8623176, 3.2994, 0, 0.8980392, 1, 1,
0.06586748, 0.5566749, -0.4889476, 0, 0.8901961, 1, 1,
0.06636555, 0.5970186, -0.636517, 0, 0.8862745, 1, 1,
0.06837912, -0.9342057, 1.958178, 0, 0.8784314, 1, 1,
0.06869045, -1.600374, 2.350748, 0, 0.8745098, 1, 1,
0.0706341, -0.1182965, 1.718518, 0, 0.8666667, 1, 1,
0.07213537, -0.7588699, 3.419016, 0, 0.8627451, 1, 1,
0.07284231, 2.005976, 0.540016, 0, 0.854902, 1, 1,
0.07401177, -1.843069, 3.277936, 0, 0.8509804, 1, 1,
0.07602797, 0.6524956, -1.000304, 0, 0.8431373, 1, 1,
0.07780299, 0.9440121, -1.439024, 0, 0.8392157, 1, 1,
0.08082487, 0.6050568, 0.8990409, 0, 0.8313726, 1, 1,
0.08150184, 0.3902825, -1.513194, 0, 0.827451, 1, 1,
0.08314113, 1.067416, 0.9601485, 0, 0.8196079, 1, 1,
0.08351438, -0.7055006, 4.796696, 0, 0.8156863, 1, 1,
0.08668303, -0.9060132, 6.268648, 0, 0.8078431, 1, 1,
0.08774379, -1.260379, 3.238866, 0, 0.8039216, 1, 1,
0.09003081, -0.9935284, 2.597472, 0, 0.7960784, 1, 1,
0.09052546, 0.4386768, 1.216416, 0, 0.7882353, 1, 1,
0.09084371, -0.766027, 2.393824, 0, 0.7843137, 1, 1,
0.09205013, 1.131849, -0.9406913, 0, 0.7764706, 1, 1,
0.09285235, -0.5383404, 2.518507, 0, 0.772549, 1, 1,
0.09294985, -0.4657525, 2.830873, 0, 0.7647059, 1, 1,
0.09742814, 1.250068, -0.6784786, 0, 0.7607843, 1, 1,
0.09891315, -0.1451981, 2.568994, 0, 0.7529412, 1, 1,
0.1000569, -0.6202701, 1.760563, 0, 0.7490196, 1, 1,
0.1007534, -0.590358, 2.26181, 0, 0.7411765, 1, 1,
0.1008812, -0.8125013, 3.224999, 0, 0.7372549, 1, 1,
0.1039978, 0.4050035, -0.1875107, 0, 0.7294118, 1, 1,
0.1047357, -0.4601456, 3.42851, 0, 0.7254902, 1, 1,
0.1088639, -0.7649181, 2.053972, 0, 0.7176471, 1, 1,
0.111016, 1.056755, 0.1968763, 0, 0.7137255, 1, 1,
0.1164901, -1.156542, 2.347926, 0, 0.7058824, 1, 1,
0.1170878, 0.05741942, 0.4173876, 0, 0.6980392, 1, 1,
0.1198686, -0.509689, 2.597649, 0, 0.6941177, 1, 1,
0.1224622, 0.6795869, 0.2510887, 0, 0.6862745, 1, 1,
0.1238442, 0.7033593, 0.8291534, 0, 0.682353, 1, 1,
0.1258475, -1.590116, 1.232717, 0, 0.6745098, 1, 1,
0.1392431, -0.126939, 4.645513, 0, 0.6705883, 1, 1,
0.1426907, -1.332135, 2.472769, 0, 0.6627451, 1, 1,
0.1453484, 0.1575139, 1.757875, 0, 0.6588235, 1, 1,
0.145853, -0.592918, 3.264296, 0, 0.6509804, 1, 1,
0.1470869, 0.3246584, 1.817448, 0, 0.6470588, 1, 1,
0.1479122, 2.273691, -0.2249122, 0, 0.6392157, 1, 1,
0.1482409, 0.3277442, 2.430071, 0, 0.6352941, 1, 1,
0.1590476, -0.2439282, 2.103733, 0, 0.627451, 1, 1,
0.1598961, 0.6647739, -0.4425633, 0, 0.6235294, 1, 1,
0.1617179, 1.40812, 1.44641, 0, 0.6156863, 1, 1,
0.1622777, -1.193347, 2.430511, 0, 0.6117647, 1, 1,
0.1659172, 0.7688716, 1.446059, 0, 0.6039216, 1, 1,
0.1670593, 0.4735313, -0.04123066, 0, 0.5960785, 1, 1,
0.1687478, 0.8611264, 1.389072, 0, 0.5921569, 1, 1,
0.1706249, 0.8339128, 0.2929681, 0, 0.5843138, 1, 1,
0.1744308, 0.4112882, 1.318135, 0, 0.5803922, 1, 1,
0.1756405, -0.3040596, 2.768508, 0, 0.572549, 1, 1,
0.1781227, -0.4992514, 1.069111, 0, 0.5686275, 1, 1,
0.1785602, -0.3034249, 3.101464, 0, 0.5607843, 1, 1,
0.1788687, -0.6129187, 0.9427422, 0, 0.5568628, 1, 1,
0.1824698, 0.2861964, 1.211759, 0, 0.5490196, 1, 1,
0.1925284, -0.9284878, 3.843285, 0, 0.5450981, 1, 1,
0.1994547, 0.8793604, 1.332195, 0, 0.5372549, 1, 1,
0.2023607, 0.2992438, 0.4356283, 0, 0.5333334, 1, 1,
0.2025393, 0.002042706, 2.021528, 0, 0.5254902, 1, 1,
0.2054884, -1.475626, 3.230709, 0, 0.5215687, 1, 1,
0.2106481, -0.9969319, 2.820191, 0, 0.5137255, 1, 1,
0.2107184, 1.034817, 0.7676631, 0, 0.509804, 1, 1,
0.2109156, 0.664288, -1.083004, 0, 0.5019608, 1, 1,
0.2126486, 1.568928, 0.3222922, 0, 0.4941176, 1, 1,
0.2127589, 1.081928, 0.2115469, 0, 0.4901961, 1, 1,
0.2149394, -2.580517, 1.171402, 0, 0.4823529, 1, 1,
0.2184684, -0.1468946, 2.829885, 0, 0.4784314, 1, 1,
0.2249348, -0.7639464, 2.125881, 0, 0.4705882, 1, 1,
0.2269036, 0.6511373, -0.9189731, 0, 0.4666667, 1, 1,
0.2270254, 0.4539646, 0.2101801, 0, 0.4588235, 1, 1,
0.2314, 0.7883269, 1.742835, 0, 0.454902, 1, 1,
0.233313, 0.1177308, 1.901214, 0, 0.4470588, 1, 1,
0.2337289, 2.029284, -1.873563, 0, 0.4431373, 1, 1,
0.2345054, -0.9113165, 3.901164, 0, 0.4352941, 1, 1,
0.2353268, -0.3798205, 2.491336, 0, 0.4313726, 1, 1,
0.236091, -0.7178216, 3.804182, 0, 0.4235294, 1, 1,
0.2361801, 0.3473522, 0.6495711, 0, 0.4196078, 1, 1,
0.2362087, 1.080707, -0.7234404, 0, 0.4117647, 1, 1,
0.2366915, 0.1427887, 1.915068, 0, 0.4078431, 1, 1,
0.2472222, -1.49749, 3.647606, 0, 0.4, 1, 1,
0.2507546, -0.9197603, 3.951443, 0, 0.3921569, 1, 1,
0.2538177, 0.8834966, 1.976667, 0, 0.3882353, 1, 1,
0.2567665, 0.00535241, 1.618209, 0, 0.3803922, 1, 1,
0.2573582, -0.7015734, 2.823347, 0, 0.3764706, 1, 1,
0.2603683, -0.2484786, 1.106217, 0, 0.3686275, 1, 1,
0.263304, -0.08305602, 0.3565038, 0, 0.3647059, 1, 1,
0.2633693, -2.510533, 3.263847, 0, 0.3568628, 1, 1,
0.2640072, -1.055141, 1.289428, 0, 0.3529412, 1, 1,
0.270461, -0.1744128, 1.260432, 0, 0.345098, 1, 1,
0.2716234, -0.2000653, 2.075818, 0, 0.3411765, 1, 1,
0.2757169, -0.7822711, 2.419991, 0, 0.3333333, 1, 1,
0.2770091, 0.07915773, 2.061903, 0, 0.3294118, 1, 1,
0.2782027, 0.817726, 1.880826, 0, 0.3215686, 1, 1,
0.2837677, 0.2277771, 0.4628775, 0, 0.3176471, 1, 1,
0.2880436, -0.4525989, 4.21894, 0, 0.3098039, 1, 1,
0.2910126, -1.319152, 3.377071, 0, 0.3058824, 1, 1,
0.2916503, 0.0409715, -0.5863759, 0, 0.2980392, 1, 1,
0.2917371, 1.443303, -0.4710658, 0, 0.2901961, 1, 1,
0.2940603, -0.6785794, 3.598524, 0, 0.2862745, 1, 1,
0.2970688, 0.8306086, -1.189954, 0, 0.2784314, 1, 1,
0.3099382, -1.060288, 1.404766, 0, 0.2745098, 1, 1,
0.3103067, 0.1822487, 1.984093, 0, 0.2666667, 1, 1,
0.3147375, 0.08021674, 1.596409, 0, 0.2627451, 1, 1,
0.316966, 1.265234, 1.418554, 0, 0.254902, 1, 1,
0.3233889, -0.3374525, 2.756829, 0, 0.2509804, 1, 1,
0.3234165, 1.67251, 0.368796, 0, 0.2431373, 1, 1,
0.3249606, -1.111237, 3.605593, 0, 0.2392157, 1, 1,
0.3250244, -1.37795, 3.133296, 0, 0.2313726, 1, 1,
0.3273408, 1.337415, -1.062085, 0, 0.227451, 1, 1,
0.328228, 1.034451, 0.679346, 0, 0.2196078, 1, 1,
0.3287756, 1.048966, 0.02049183, 0, 0.2156863, 1, 1,
0.329432, 1.692838, -0.3102222, 0, 0.2078431, 1, 1,
0.3307839, -0.3850428, 1.805923, 0, 0.2039216, 1, 1,
0.3332338, -1.252942, 3.488369, 0, 0.1960784, 1, 1,
0.3355963, 0.414456, -0.6302407, 0, 0.1882353, 1, 1,
0.3424097, -0.3640742, 2.487177, 0, 0.1843137, 1, 1,
0.3424285, -0.3582408, 2.510812, 0, 0.1764706, 1, 1,
0.3425397, 0.1198539, 1.776424, 0, 0.172549, 1, 1,
0.3433287, -5.616509, 2.981415, 0, 0.1647059, 1, 1,
0.344924, 0.9551716, -0.8101853, 0, 0.1607843, 1, 1,
0.3458617, 1.082305, -1.007046, 0, 0.1529412, 1, 1,
0.3477901, -0.2685809, -0.04226625, 0, 0.1490196, 1, 1,
0.3481121, -0.09672406, 1.992984, 0, 0.1411765, 1, 1,
0.3518606, 0.4403035, 1.011411, 0, 0.1372549, 1, 1,
0.3527961, 1.910798, 0.5537537, 0, 0.1294118, 1, 1,
0.3536037, 1.193607, -0.2812706, 0, 0.1254902, 1, 1,
0.3545329, 0.02164129, 1.951621, 0, 0.1176471, 1, 1,
0.3574339, -0.9405798, 1.183575, 0, 0.1137255, 1, 1,
0.3605708, 1.73285, 1.432017, 0, 0.1058824, 1, 1,
0.3666252, -0.2330057, 1.258928, 0, 0.09803922, 1, 1,
0.3729323, -1.232973, 1.428046, 0, 0.09411765, 1, 1,
0.3757691, -1.556151, 3.049294, 0, 0.08627451, 1, 1,
0.3761598, -0.8755205, 3.376765, 0, 0.08235294, 1, 1,
0.3767715, 0.5552191, -0.9491752, 0, 0.07450981, 1, 1,
0.385718, 1.190664, -0.01574211, 0, 0.07058824, 1, 1,
0.3884518, 1.587677, -0.7804878, 0, 0.0627451, 1, 1,
0.3887824, 0.1358427, 1.195846, 0, 0.05882353, 1, 1,
0.3899868, 1.065153, 1.258763, 0, 0.05098039, 1, 1,
0.3909005, 0.4172862, 0.8957571, 0, 0.04705882, 1, 1,
0.3910439, -0.5514139, 2.151854, 0, 0.03921569, 1, 1,
0.3972022, 0.07495021, 1.873517, 0, 0.03529412, 1, 1,
0.399039, -1.76222, 3.435444, 0, 0.02745098, 1, 1,
0.400016, -1.459341, 1.721515, 0, 0.02352941, 1, 1,
0.4013553, -0.9570264, 3.209529, 0, 0.01568628, 1, 1,
0.4042823, -1.866273, 2.245437, 0, 0.01176471, 1, 1,
0.405619, 0.6480017, 3.073726, 0, 0.003921569, 1, 1,
0.4058285, -0.8051665, 1.90739, 0.003921569, 0, 1, 1,
0.4085631, -0.4463305, 2.195192, 0.007843138, 0, 1, 1,
0.4124175, 0.3096444, -0.6045479, 0.01568628, 0, 1, 1,
0.4130034, -0.4583148, 2.194096, 0.01960784, 0, 1, 1,
0.4205903, 1.196869, 0.2396115, 0.02745098, 0, 1, 1,
0.4271192, 1.062661, 2.586786, 0.03137255, 0, 1, 1,
0.4285662, -0.8219554, 3.495965, 0.03921569, 0, 1, 1,
0.4337484, -2.313268, 2.397263, 0.04313726, 0, 1, 1,
0.4341924, 0.5590658, 0.4000284, 0.05098039, 0, 1, 1,
0.4347837, -0.9224991, 2.297009, 0.05490196, 0, 1, 1,
0.4356083, -0.8319876, 2.438397, 0.0627451, 0, 1, 1,
0.4405296, 0.6695438, -0.4090041, 0.06666667, 0, 1, 1,
0.4416244, -0.9841019, 1.071234, 0.07450981, 0, 1, 1,
0.4489802, -0.5242816, 2.894139, 0.07843138, 0, 1, 1,
0.4510264, -0.2989174, 1.141992, 0.08627451, 0, 1, 1,
0.4521441, -0.2759121, 1.499962, 0.09019608, 0, 1, 1,
0.4545265, -0.5078071, 3.061414, 0.09803922, 0, 1, 1,
0.4572183, -0.1383865, 2.632433, 0.1058824, 0, 1, 1,
0.4580138, -1.875708, 1.750437, 0.1098039, 0, 1, 1,
0.459984, -0.3246327, 2.442696, 0.1176471, 0, 1, 1,
0.4602184, -1.848443, 2.614919, 0.1215686, 0, 1, 1,
0.4697455, -0.5018823, 3.009004, 0.1294118, 0, 1, 1,
0.4718992, 0.797258, -0.1311236, 0.1333333, 0, 1, 1,
0.4729493, 1.421763, 0.06174719, 0.1411765, 0, 1, 1,
0.4772193, 1.356592, 0.5304683, 0.145098, 0, 1, 1,
0.4787157, 3.207062, 0.5988076, 0.1529412, 0, 1, 1,
0.4844251, -0.4328621, 3.969791, 0.1568628, 0, 1, 1,
0.4913789, -0.6572341, 0.6068233, 0.1647059, 0, 1, 1,
0.4917821, -0.1483909, 1.943842, 0.1686275, 0, 1, 1,
0.4978684, -1.293926, 4.4587, 0.1764706, 0, 1, 1,
0.4995265, -0.05016665, 1.457376, 0.1803922, 0, 1, 1,
0.5026151, 1.523858, -0.4268977, 0.1882353, 0, 1, 1,
0.5093905, -0.6076979, 1.969417, 0.1921569, 0, 1, 1,
0.5096208, -0.7050015, 3.08777, 0.2, 0, 1, 1,
0.5130594, 1.197046, -0.426994, 0.2078431, 0, 1, 1,
0.5141363, 1.841592, 1.968728, 0.2117647, 0, 1, 1,
0.5142748, 1.519223, -0.1557916, 0.2196078, 0, 1, 1,
0.5150719, 0.2928184, 1.400623, 0.2235294, 0, 1, 1,
0.5162134, -0.7069747, 1.514172, 0.2313726, 0, 1, 1,
0.5179608, 0.4864784, 0.8454618, 0.2352941, 0, 1, 1,
0.524996, 1.262299, -0.8702573, 0.2431373, 0, 1, 1,
0.5276647, 0.9438136, 2.157353, 0.2470588, 0, 1, 1,
0.5286351, 0.7985911, 1.475748, 0.254902, 0, 1, 1,
0.5293416, 0.01395099, 1.639524, 0.2588235, 0, 1, 1,
0.5361716, 0.8734717, -0.4759478, 0.2666667, 0, 1, 1,
0.5370394, -0.2671432, 1.340797, 0.2705882, 0, 1, 1,
0.5386559, -2.041529, 3.847396, 0.2784314, 0, 1, 1,
0.5565485, -1.000379, 2.101143, 0.282353, 0, 1, 1,
0.5580321, -1.202417, 1.741379, 0.2901961, 0, 1, 1,
0.5645327, 0.02272684, 1.541297, 0.2941177, 0, 1, 1,
0.5764039, 0.470544, 2.750896, 0.3019608, 0, 1, 1,
0.5776475, -0.5705549, 2.018359, 0.3098039, 0, 1, 1,
0.5781625, -0.7148103, 1.04814, 0.3137255, 0, 1, 1,
0.5793081, -0.7542718, 2.370336, 0.3215686, 0, 1, 1,
0.5793214, -1.05336, 3.474081, 0.3254902, 0, 1, 1,
0.5820483, -0.0717511, 1.61957, 0.3333333, 0, 1, 1,
0.5825598, 1.105075, -0.3095829, 0.3372549, 0, 1, 1,
0.5854759, -0.8948251, 3.17117, 0.345098, 0, 1, 1,
0.5916872, 0.8044167, 2.038852, 0.3490196, 0, 1, 1,
0.5938799, 1.310164, -1.293572, 0.3568628, 0, 1, 1,
0.5945353, 1.343414, 0.1666481, 0.3607843, 0, 1, 1,
0.5946276, 1.044715, 1.500213, 0.3686275, 0, 1, 1,
0.5986369, -1.075245, -0.1695781, 0.372549, 0, 1, 1,
0.5993927, 2.532647, 0.6352226, 0.3803922, 0, 1, 1,
0.6062005, 0.09417281, 0.1463775, 0.3843137, 0, 1, 1,
0.6081487, 1.880017, -0.3181751, 0.3921569, 0, 1, 1,
0.6106613, 1.311053, 2.615979, 0.3960784, 0, 1, 1,
0.6157278, 0.3670467, 1.113714, 0.4039216, 0, 1, 1,
0.6197977, -0.9150504, 2.09839, 0.4117647, 0, 1, 1,
0.6215323, 0.04827704, 3.039233, 0.4156863, 0, 1, 1,
0.6253416, 0.03823158, 1.491933, 0.4235294, 0, 1, 1,
0.6301661, -1.568979, 3.263647, 0.427451, 0, 1, 1,
0.6371962, 0.7967052, -0.4860633, 0.4352941, 0, 1, 1,
0.6373937, 0.09405021, 1.662799, 0.4392157, 0, 1, 1,
0.6385021, 0.8458447, -0.4902242, 0.4470588, 0, 1, 1,
0.6387739, -0.3998592, 2.737346, 0.4509804, 0, 1, 1,
0.6402797, 0.7880393, 0.9886116, 0.4588235, 0, 1, 1,
0.642891, 1.440565, -0.2568909, 0.4627451, 0, 1, 1,
0.6431242, 1.182611, -0.4236663, 0.4705882, 0, 1, 1,
0.644114, 2.286159, -0.477235, 0.4745098, 0, 1, 1,
0.6459554, 1.251677, 1.495545, 0.4823529, 0, 1, 1,
0.6477587, 1.147875, 1.580106, 0.4862745, 0, 1, 1,
0.6488133, 0.870055, 1.689431, 0.4941176, 0, 1, 1,
0.6507413, 2.047724, -0.03818249, 0.5019608, 0, 1, 1,
0.6524348, -0.525444, 1.352221, 0.5058824, 0, 1, 1,
0.6543426, -0.8927643, 1.601699, 0.5137255, 0, 1, 1,
0.6575596, -1.700656, 2.89391, 0.5176471, 0, 1, 1,
0.6616879, 1.629654, 0.446486, 0.5254902, 0, 1, 1,
0.6630455, 0.7598309, 2.075074, 0.5294118, 0, 1, 1,
0.6639876, -0.8059306, 2.28332, 0.5372549, 0, 1, 1,
0.6667573, -1.794579, 3.210728, 0.5411765, 0, 1, 1,
0.6670343, -0.7019367, 1.554418, 0.5490196, 0, 1, 1,
0.6693018, -1.047629, 3.177844, 0.5529412, 0, 1, 1,
0.6763724, -0.108436, 1.468328, 0.5607843, 0, 1, 1,
0.6785527, -0.8659489, 2.306208, 0.5647059, 0, 1, 1,
0.6858089, 1.345227, 0.9776151, 0.572549, 0, 1, 1,
0.6899918, -0.345605, 2.254171, 0.5764706, 0, 1, 1,
0.6919782, 0.8125195, 0.1505223, 0.5843138, 0, 1, 1,
0.6956334, 1.64557, -0.8169819, 0.5882353, 0, 1, 1,
0.6986848, -0.2373903, 3.716638, 0.5960785, 0, 1, 1,
0.7024037, -1.362168, 2.558046, 0.6039216, 0, 1, 1,
0.7086575, -0.6685446, 1.182756, 0.6078432, 0, 1, 1,
0.7138249, 0.1843688, 0.8759966, 0.6156863, 0, 1, 1,
0.7144432, -0.1283808, 2.94378, 0.6196079, 0, 1, 1,
0.7145213, -1.029769, 2.3823, 0.627451, 0, 1, 1,
0.7176731, -1.296302, 1.731365, 0.6313726, 0, 1, 1,
0.7205306, 0.003930302, 1.369081, 0.6392157, 0, 1, 1,
0.7250592, -0.9882575, 2.065252, 0.6431373, 0, 1, 1,
0.7290922, -0.6706263, 1.525975, 0.6509804, 0, 1, 1,
0.739926, -1.362553, 2.390034, 0.654902, 0, 1, 1,
0.7405444, -0.5786964, 2.703829, 0.6627451, 0, 1, 1,
0.7410896, 0.780234, 1.639782, 0.6666667, 0, 1, 1,
0.7423021, 0.7583476, 0.8299364, 0.6745098, 0, 1, 1,
0.7440373, -0.8783965, 2.762864, 0.6784314, 0, 1, 1,
0.7481613, -1.357924, 0.1593709, 0.6862745, 0, 1, 1,
0.7486178, 0.7168456, -0.6576852, 0.6901961, 0, 1, 1,
0.7490796, -0.3608112, 0.8941392, 0.6980392, 0, 1, 1,
0.7494036, -0.04543648, 0.7154462, 0.7058824, 0, 1, 1,
0.7535915, 1.308742, 1.754216, 0.7098039, 0, 1, 1,
0.7536086, 1.365709, 0.9596535, 0.7176471, 0, 1, 1,
0.7562358, 1.307752, 0.06296578, 0.7215686, 0, 1, 1,
0.7566713, 0.7601941, 1.461609, 0.7294118, 0, 1, 1,
0.7601508, -0.1365017, 1.352567, 0.7333333, 0, 1, 1,
0.7629999, -1.327876, 2.5438, 0.7411765, 0, 1, 1,
0.7732409, -0.1309693, 2.455317, 0.7450981, 0, 1, 1,
0.7741969, -0.6641726, 3.121347, 0.7529412, 0, 1, 1,
0.7747458, -1.184362, 2.955854, 0.7568628, 0, 1, 1,
0.7865116, -0.377232, 1.516112, 0.7647059, 0, 1, 1,
0.7878798, -0.8989552, 3.172156, 0.7686275, 0, 1, 1,
0.7928463, -0.08330441, 2.136668, 0.7764706, 0, 1, 1,
0.7930852, -0.3921994, 2.17495, 0.7803922, 0, 1, 1,
0.7938849, -0.8768775, 2.353656, 0.7882353, 0, 1, 1,
0.796596, 0.5776475, 0.724394, 0.7921569, 0, 1, 1,
0.7973559, -1.235777, 3.897473, 0.8, 0, 1, 1,
0.800876, 0.3006563, 0.9545143, 0.8078431, 0, 1, 1,
0.8025486, 0.709618, -1.354918, 0.8117647, 0, 1, 1,
0.8095431, -0.3530956, 4.226936, 0.8196079, 0, 1, 1,
0.8106984, 0.1507339, 1.071781, 0.8235294, 0, 1, 1,
0.8138827, 1.673788, 0.1444695, 0.8313726, 0, 1, 1,
0.8147643, -0.3517207, 2.525105, 0.8352941, 0, 1, 1,
0.8167471, 0.9174777, -0.5541068, 0.8431373, 0, 1, 1,
0.8210751, -0.1402801, 3.206361, 0.8470588, 0, 1, 1,
0.8263068, -0.1197467, 1.653743, 0.854902, 0, 1, 1,
0.8269904, -0.4107262, 1.16977, 0.8588235, 0, 1, 1,
0.828942, 1.088071, 0.931429, 0.8666667, 0, 1, 1,
0.8336385, 0.9302434, -0.2185129, 0.8705882, 0, 1, 1,
0.8397896, -0.8977699, 1.906996, 0.8784314, 0, 1, 1,
0.8523158, -0.3471845, 1.763768, 0.8823529, 0, 1, 1,
0.8524339, 1.810963, -0.5416523, 0.8901961, 0, 1, 1,
0.8596867, 0.2798094, 0.2086767, 0.8941177, 0, 1, 1,
0.8678495, 0.3910384, 2.213097, 0.9019608, 0, 1, 1,
0.8687058, -0.9996645, 1.26666, 0.9098039, 0, 1, 1,
0.8691783, 0.7960573, 2.142632, 0.9137255, 0, 1, 1,
0.872854, 0.01239938, 1.871033, 0.9215686, 0, 1, 1,
0.8761128, -1.469263, 1.179779, 0.9254902, 0, 1, 1,
0.8806391, -0.02010326, 1.975223, 0.9333333, 0, 1, 1,
0.8846483, -1.127688, 3.010512, 0.9372549, 0, 1, 1,
0.8863156, -0.8517842, 1.860728, 0.945098, 0, 1, 1,
0.8933799, 1.087155, 1.35954, 0.9490196, 0, 1, 1,
0.8947366, 2.712644, -0.2354652, 0.9568627, 0, 1, 1,
0.8991292, -0.9079826, 2.373472, 0.9607843, 0, 1, 1,
0.9006308, 0.9141334, -0.9998926, 0.9686275, 0, 1, 1,
0.904075, 1.184647, 1.039892, 0.972549, 0, 1, 1,
0.9056136, -1.490929, 3.476813, 0.9803922, 0, 1, 1,
0.9088975, -0.8214646, 2.627132, 0.9843137, 0, 1, 1,
0.9129256, -0.9155321, 4.349851, 0.9921569, 0, 1, 1,
0.9255377, 1.231429, 1.164084, 0.9960784, 0, 1, 1,
0.9327845, 1.054958, 1.007252, 1, 0, 0.9960784, 1,
0.9430596, 0.6095411, -0.6793677, 1, 0, 0.9882353, 1,
0.9460893, 0.5888639, 0.2018688, 1, 0, 0.9843137, 1,
0.9510769, -0.785835, 2.178404, 1, 0, 0.9764706, 1,
0.9511412, 1.335468, 1.432497, 1, 0, 0.972549, 1,
0.9626051, -0.5507618, 3.295162, 1, 0, 0.9647059, 1,
0.9632159, 0.2213429, 2.213426, 1, 0, 0.9607843, 1,
0.9636368, 1.372438, 1.471649, 1, 0, 0.9529412, 1,
0.9697233, 0.337137, 0.7867638, 1, 0, 0.9490196, 1,
0.9723713, -0.1841885, 0.7161118, 1, 0, 0.9411765, 1,
0.9769478, -0.5442265, 0.1421914, 1, 0, 0.9372549, 1,
0.9828631, -0.2587343, -0.1048197, 1, 0, 0.9294118, 1,
0.9837318, 0.1249335, 1.382706, 1, 0, 0.9254902, 1,
0.9857203, 0.6776754, 0.8662518, 1, 0, 0.9176471, 1,
0.9876179, 0.2343411, 0.3660776, 1, 0, 0.9137255, 1,
0.9916295, 0.311539, -0.8363954, 1, 0, 0.9058824, 1,
0.9924446, -1.236685, 4.793365, 1, 0, 0.9019608, 1,
0.9953845, 0.854921, 0.5359636, 1, 0, 0.8941177, 1,
0.9970898, 0.8290183, -0.4141653, 1, 0, 0.8862745, 1,
1.003585, -1.703406, 2.347558, 1, 0, 0.8823529, 1,
1.015471, 2.055959, -1.030239, 1, 0, 0.8745098, 1,
1.015822, 0.2650789, 1.626023, 1, 0, 0.8705882, 1,
1.019132, -0.8660392, 2.369763, 1, 0, 0.8627451, 1,
1.020109, 0.4521334, 1.22277, 1, 0, 0.8588235, 1,
1.030785, 0.1375644, 1.607243, 1, 0, 0.8509804, 1,
1.034773, 2.013995, 1.205449, 1, 0, 0.8470588, 1,
1.03575, -0.11254, -0.8682417, 1, 0, 0.8392157, 1,
1.04261, -0.3432654, 3.527278, 1, 0, 0.8352941, 1,
1.054752, -2.075613, 3.038381, 1, 0, 0.827451, 1,
1.058099, -1.145764, 2.737619, 1, 0, 0.8235294, 1,
1.063369, 0.9352543, 1.261126, 1, 0, 0.8156863, 1,
1.073342, 0.1569622, 0.4888577, 1, 0, 0.8117647, 1,
1.075472, -0.0425424, 1.912805, 1, 0, 0.8039216, 1,
1.083071, 1.119343, 2.394722, 1, 0, 0.7960784, 1,
1.084764, 0.9982422, 0.09965327, 1, 0, 0.7921569, 1,
1.090259, 0.8168408, 1.244539, 1, 0, 0.7843137, 1,
1.096256, -1.127768, 2.301189, 1, 0, 0.7803922, 1,
1.099616, -0.04211528, 1.042068, 1, 0, 0.772549, 1,
1.104449, -0.8139771, 3.068997, 1, 0, 0.7686275, 1,
1.107308, 1.172396, -0.4507764, 1, 0, 0.7607843, 1,
1.108775, 0.7604166, 0.2398047, 1, 0, 0.7568628, 1,
1.109722, -0.1462635, 2.060661, 1, 0, 0.7490196, 1,
1.112899, -0.3761186, 1.217024, 1, 0, 0.7450981, 1,
1.126742, -0.2723002, 0.161523, 1, 0, 0.7372549, 1,
1.138253, 2.536158, 2.295276, 1, 0, 0.7333333, 1,
1.14639, -1.13759, 2.993573, 1, 0, 0.7254902, 1,
1.154629, -0.3104093, 1.467754, 1, 0, 0.7215686, 1,
1.155599, -0.357164, 0.3723161, 1, 0, 0.7137255, 1,
1.157963, -0.2428353, 1.24804, 1, 0, 0.7098039, 1,
1.158012, -0.2869638, 2.629222, 1, 0, 0.7019608, 1,
1.160403, 0.3702515, -0.3712934, 1, 0, 0.6941177, 1,
1.17243, -0.0194253, 2.13827, 1, 0, 0.6901961, 1,
1.173537, -1.257571, 2.009601, 1, 0, 0.682353, 1,
1.186746, 0.1813493, -0.7140735, 1, 0, 0.6784314, 1,
1.203751, -1.05441, 2.563004, 1, 0, 0.6705883, 1,
1.20746, -0.8455721, 0.8783305, 1, 0, 0.6666667, 1,
1.213379, -0.7710208, 1.363689, 1, 0, 0.6588235, 1,
1.22006, -0.8706862, 1.344553, 1, 0, 0.654902, 1,
1.237486, -1.658795, 1.902559, 1, 0, 0.6470588, 1,
1.245074, -1.575745, 3.895699, 1, 0, 0.6431373, 1,
1.24634, 1.491983, -0.1847307, 1, 0, 0.6352941, 1,
1.252033, -1.457936, 3.366722, 1, 0, 0.6313726, 1,
1.25503, 0.5180341, -1.091879, 1, 0, 0.6235294, 1,
1.256093, 1.499924, 1.324306, 1, 0, 0.6196079, 1,
1.25761, 0.09912648, 1.392249, 1, 0, 0.6117647, 1,
1.259995, 2.449507, 1.023038, 1, 0, 0.6078432, 1,
1.262686, 1.32104, 1.092842, 1, 0, 0.6, 1,
1.267452, -0.09482855, -0.2543596, 1, 0, 0.5921569, 1,
1.271998, -0.1165507, 1.738077, 1, 0, 0.5882353, 1,
1.273142, -1.017352, 2.593919, 1, 0, 0.5803922, 1,
1.274635, -1.023831, 1.487719, 1, 0, 0.5764706, 1,
1.280545, 0.2422797, 0.274437, 1, 0, 0.5686275, 1,
1.288194, 0.560264, 2.110965, 1, 0, 0.5647059, 1,
1.289693, -0.8660869, 1.49199, 1, 0, 0.5568628, 1,
1.309648, 0.7317002, 0.06067367, 1, 0, 0.5529412, 1,
1.321996, 1.773089, -0.09412106, 1, 0, 0.5450981, 1,
1.324654, -0.5674479, 2.10102, 1, 0, 0.5411765, 1,
1.327936, 0.7693875, -0.6031269, 1, 0, 0.5333334, 1,
1.333556, 1.429637, 0.1889823, 1, 0, 0.5294118, 1,
1.355111, -1.202853, 3.394696, 1, 0, 0.5215687, 1,
1.359866, 0.7227978, 0.495685, 1, 0, 0.5176471, 1,
1.367907, -1.744329, 1.453688, 1, 0, 0.509804, 1,
1.37145, -0.7849619, 2.132109, 1, 0, 0.5058824, 1,
1.37472, -0.2548201, 1.964648, 1, 0, 0.4980392, 1,
1.377156, -0.1853523, 3.167347, 1, 0, 0.4901961, 1,
1.378968, -0.1517248, 0.7997317, 1, 0, 0.4862745, 1,
1.392188, -2.703976, 4.191807, 1, 0, 0.4784314, 1,
1.399178, 0.9089538, 1.051089, 1, 0, 0.4745098, 1,
1.412884, -0.1994079, 1.09646, 1, 0, 0.4666667, 1,
1.418405, 0.7766737, 0.9807594, 1, 0, 0.4627451, 1,
1.420127, 1.726935, 3.005098, 1, 0, 0.454902, 1,
1.421049, 0.9831319, 1.314089, 1, 0, 0.4509804, 1,
1.422604, -0.6659803, 3.070361, 1, 0, 0.4431373, 1,
1.427327, 0.4909475, 0.7547488, 1, 0, 0.4392157, 1,
1.432332, -1.441427, 3.419743, 1, 0, 0.4313726, 1,
1.432791, -0.3503118, 1.915491, 1, 0, 0.427451, 1,
1.433712, 0.80923, 1.45379, 1, 0, 0.4196078, 1,
1.445316, -1.442169, 2.505133, 1, 0, 0.4156863, 1,
1.45327, 0.5919401, -1.108545, 1, 0, 0.4078431, 1,
1.470931, -0.6473043, 0.3532859, 1, 0, 0.4039216, 1,
1.486879, -1.155689, 2.519881, 1, 0, 0.3960784, 1,
1.498432, -2.075114, 1.783548, 1, 0, 0.3882353, 1,
1.500045, 0.83044, 0.8871428, 1, 0, 0.3843137, 1,
1.501691, -0.0980427, 2.433075, 1, 0, 0.3764706, 1,
1.503656, 0.4376755, 1.403603, 1, 0, 0.372549, 1,
1.512031, -1.220059, 1.375666, 1, 0, 0.3647059, 1,
1.53415, -1.180458, 2.80865, 1, 0, 0.3607843, 1,
1.537933, -0.3573634, 2.171306, 1, 0, 0.3529412, 1,
1.544366, -1.094203, 0.9437363, 1, 0, 0.3490196, 1,
1.545493, 0.6484639, 3.413094, 1, 0, 0.3411765, 1,
1.55276, 0.2887001, 2.420241, 1, 0, 0.3372549, 1,
1.558394, 0.4775361, 1.772614, 1, 0, 0.3294118, 1,
1.563007, 0.2268088, 1.928929, 1, 0, 0.3254902, 1,
1.564861, -0.2433756, 1.402589, 1, 0, 0.3176471, 1,
1.585796, 1.606483, 1.749372, 1, 0, 0.3137255, 1,
1.599737, -1.105427, 3.222133, 1, 0, 0.3058824, 1,
1.602409, 0.6073414, 1.825893, 1, 0, 0.2980392, 1,
1.604592, -0.07143591, 3.533112, 1, 0, 0.2941177, 1,
1.604679, -1.858617, 1.011645, 1, 0, 0.2862745, 1,
1.606759, -1.131175, 1.005424, 1, 0, 0.282353, 1,
1.61164, 0.6002298, -0.9233183, 1, 0, 0.2745098, 1,
1.617356, 1.479178, 0.9074098, 1, 0, 0.2705882, 1,
1.637142, 0.5275756, 0.5653057, 1, 0, 0.2627451, 1,
1.641322, 0.6153299, 0.4755572, 1, 0, 0.2588235, 1,
1.660809, 0.349812, 2.886735, 1, 0, 0.2509804, 1,
1.665523, 0.2433291, 2.836197, 1, 0, 0.2470588, 1,
1.681721, -1.694211, 1.141852, 1, 0, 0.2392157, 1,
1.68254, -0.37696, 2.194026, 1, 0, 0.2352941, 1,
1.691649, -0.3290258, 2.403573, 1, 0, 0.227451, 1,
1.692926, -0.1319207, 3.127827, 1, 0, 0.2235294, 1,
1.712875, -0.5164706, 3.299882, 1, 0, 0.2156863, 1,
1.719718, -1.042204, 2.805596, 1, 0, 0.2117647, 1,
1.746005, 0.2151429, 1.634035, 1, 0, 0.2039216, 1,
1.7501, 1.418664, -0.1289996, 1, 0, 0.1960784, 1,
1.773006, 0.4541179, 1.344435, 1, 0, 0.1921569, 1,
1.778239, 0.3028015, 2.130089, 1, 0, 0.1843137, 1,
1.779653, -1.651732, 3.998429, 1, 0, 0.1803922, 1,
1.809278, -0.3851736, 2.689781, 1, 0, 0.172549, 1,
1.809336, 2.02565, 2.778384, 1, 0, 0.1686275, 1,
1.809945, -0.8015549, 2.656135, 1, 0, 0.1607843, 1,
1.83637, -1.30416, 2.039778, 1, 0, 0.1568628, 1,
1.83875, -0.06975116, -0.6943258, 1, 0, 0.1490196, 1,
1.87167, 0.116333, 0.1550901, 1, 0, 0.145098, 1,
1.877583, -0.2205865, 1.84669, 1, 0, 0.1372549, 1,
1.90655, 0.1918774, 2.411888, 1, 0, 0.1333333, 1,
1.913188, 0.2006721, 3.202082, 1, 0, 0.1254902, 1,
1.915206, 1.313033, 2.086579, 1, 0, 0.1215686, 1,
1.922422, 0.8332959, 0.5221444, 1, 0, 0.1137255, 1,
1.935919, -0.9730484, 1.403615, 1, 0, 0.1098039, 1,
1.97621, 1.007377, 1.701166, 1, 0, 0.1019608, 1,
1.981085, 1.023725, 0.4723429, 1, 0, 0.09411765, 1,
1.996264, 1.664939, 0.840795, 1, 0, 0.09019608, 1,
2.029188, 0.03092526, 1.970999, 1, 0, 0.08235294, 1,
2.038515, -0.7496933, 1.681829, 1, 0, 0.07843138, 1,
2.0432, 0.1531996, 3.802823, 1, 0, 0.07058824, 1,
2.054008, -1.797704, 2.581915, 1, 0, 0.06666667, 1,
2.055651, 0.1415965, 2.964558, 1, 0, 0.05882353, 1,
2.076225, 0.3748736, 2.840064, 1, 0, 0.05490196, 1,
2.12651, 1.439867, -0.1978652, 1, 0, 0.04705882, 1,
2.156199, -1.297058, 0.4262625, 1, 0, 0.04313726, 1,
2.387238, 1.09117, 0.4172344, 1, 0, 0.03529412, 1,
2.387449, -0.3694697, 2.800684, 1, 0, 0.03137255, 1,
2.466496, 0.283248, 1.208784, 1, 0, 0.02352941, 1,
2.66588, 1.392836, 1.052294, 1, 0, 0.01960784, 1,
2.670317, 0.4331337, 0.2360201, 1, 0, 0.01176471, 1,
2.803722, -0.04588681, 2.534626, 1, 0, 0.007843138, 1
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
-0.2080333, -7.112104, -7.018, 0, -0.5, 0.5, 0.5,
-0.2080333, -7.112104, -7.018, 1, -0.5, 0.5, 0.5,
-0.2080333, -7.112104, -7.018, 1, 1.5, 0.5, 0.5,
-0.2080333, -7.112104, -7.018, 0, 1.5, 0.5, 0.5
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
-4.240774, -1.204723, -7.018, 0, -0.5, 0.5, 0.5,
-4.240774, -1.204723, -7.018, 1, -0.5, 0.5, 0.5,
-4.240774, -1.204723, -7.018, 1, 1.5, 0.5, 0.5,
-4.240774, -1.204723, -7.018, 0, 1.5, 0.5, 0.5
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
-4.240774, -7.112104, 0.5881658, 0, -0.5, 0.5, 0.5,
-4.240774, -7.112104, 0.5881658, 1, -0.5, 0.5, 0.5,
-4.240774, -7.112104, 0.5881658, 1, 1.5, 0.5, 0.5,
-4.240774, -7.112104, 0.5881658, 0, 1.5, 0.5, 0.5
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
-3, -5.748863, -5.262731,
2, -5.748863, -5.262731,
-3, -5.748863, -5.262731,
-3, -5.976069, -5.555276,
-2, -5.748863, -5.262731,
-2, -5.976069, -5.555276,
-1, -5.748863, -5.262731,
-1, -5.976069, -5.555276,
0, -5.748863, -5.262731,
0, -5.976069, -5.555276,
1, -5.748863, -5.262731,
1, -5.976069, -5.555276,
2, -5.748863, -5.262731,
2, -5.976069, -5.555276
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
-3, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
-3, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
-3, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
-3, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5,
-2, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
-2, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
-2, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
-2, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5,
-1, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
-1, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
-1, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
-1, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5,
0, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
0, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
0, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
0, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5,
1, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
1, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
1, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
1, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5,
2, -6.430483, -6.140366, 0, -0.5, 0.5, 0.5,
2, -6.430483, -6.140366, 1, -0.5, 0.5, 0.5,
2, -6.430483, -6.140366, 1, 1.5, 0.5, 0.5,
2, -6.430483, -6.140366, 0, 1.5, 0.5, 0.5
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
-3.310142, -4, -5.262731,
-3.310142, 2, -5.262731,
-3.310142, -4, -5.262731,
-3.465247, -4, -5.555276,
-3.310142, -2, -5.262731,
-3.465247, -2, -5.555276,
-3.310142, 0, -5.262731,
-3.465247, 0, -5.555276,
-3.310142, 2, -5.262731,
-3.465247, 2, -5.555276
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
"-4",
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
-3.775458, -4, -6.140366, 0, -0.5, 0.5, 0.5,
-3.775458, -4, -6.140366, 1, -0.5, 0.5, 0.5,
-3.775458, -4, -6.140366, 1, 1.5, 0.5, 0.5,
-3.775458, -4, -6.140366, 0, 1.5, 0.5, 0.5,
-3.775458, -2, -6.140366, 0, -0.5, 0.5, 0.5,
-3.775458, -2, -6.140366, 1, -0.5, 0.5, 0.5,
-3.775458, -2, -6.140366, 1, 1.5, 0.5, 0.5,
-3.775458, -2, -6.140366, 0, 1.5, 0.5, 0.5,
-3.775458, 0, -6.140366, 0, -0.5, 0.5, 0.5,
-3.775458, 0, -6.140366, 1, -0.5, 0.5, 0.5,
-3.775458, 0, -6.140366, 1, 1.5, 0.5, 0.5,
-3.775458, 0, -6.140366, 0, 1.5, 0.5, 0.5,
-3.775458, 2, -6.140366, 0, -0.5, 0.5, 0.5,
-3.775458, 2, -6.140366, 1, -0.5, 0.5, 0.5,
-3.775458, 2, -6.140366, 1, 1.5, 0.5, 0.5,
-3.775458, 2, -6.140366, 0, 1.5, 0.5, 0.5
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
-3.310142, -5.748863, -4,
-3.310142, -5.748863, 6,
-3.310142, -5.748863, -4,
-3.465247, -5.976069, -4,
-3.310142, -5.748863, -2,
-3.465247, -5.976069, -2,
-3.310142, -5.748863, 0,
-3.465247, -5.976069, 0,
-3.310142, -5.748863, 2,
-3.465247, -5.976069, 2,
-3.310142, -5.748863, 4,
-3.465247, -5.976069, 4,
-3.310142, -5.748863, 6,
-3.465247, -5.976069, 6
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
"4",
"6"
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
-3.775458, -6.430483, -4, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, -4, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, -4, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, -4, 0, 1.5, 0.5, 0.5,
-3.775458, -6.430483, -2, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, -2, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, -2, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, -2, 0, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 0, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 0, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 0, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 0, 0, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 2, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 2, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 2, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 2, 0, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 4, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 4, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 4, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 4, 0, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 6, 0, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 6, 1, -0.5, 0.5, 0.5,
-3.775458, -6.430483, 6, 1, 1.5, 0.5, 0.5,
-3.775458, -6.430483, 6, 0, 1.5, 0.5, 0.5
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
-3.310142, -5.748863, -5.262731,
-3.310142, 3.339416, -5.262731,
-3.310142, -5.748863, 6.439063,
-3.310142, 3.339416, 6.439063,
-3.310142, -5.748863, -5.262731,
-3.310142, -5.748863, 6.439063,
-3.310142, 3.339416, -5.262731,
-3.310142, 3.339416, 6.439063,
-3.310142, -5.748863, -5.262731,
2.894075, -5.748863, -5.262731,
-3.310142, -5.748863, 6.439063,
2.894075, -5.748863, 6.439063,
-3.310142, 3.339416, -5.262731,
2.894075, 3.339416, -5.262731,
-3.310142, 3.339416, 6.439063,
2.894075, 3.339416, 6.439063,
2.894075, -5.748863, -5.262731,
2.894075, 3.339416, -5.262731,
2.894075, -5.748863, 6.439063,
2.894075, 3.339416, 6.439063,
2.894075, -5.748863, -5.262731,
2.894075, -5.748863, 6.439063,
2.894075, 3.339416, -5.262731,
2.894075, 3.339416, 6.439063
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
var radius = 8.577348;
var distance = 38.16159;
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
mvMatrix.translate( 0.2080333, 1.204723, -0.5881658 );
mvMatrix.scale( 1.494789, 1.020435, 0.7925279 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.16159);
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


