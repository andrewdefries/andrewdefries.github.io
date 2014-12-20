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
-2.603537, 0.5771466, 0.1584439, 1, 0, 0, 1,
-2.541837, -1.111688, -2.119456, 1, 0.007843138, 0, 1,
-2.495518, 1.673242, -2.650125, 1, 0.01176471, 0, 1,
-2.481442, -0.1331648, 0.1674694, 1, 0.01960784, 0, 1,
-2.460859, 0.163377, -1.888324, 1, 0.02352941, 0, 1,
-2.41813, 0.843985, -1.802011, 1, 0.03137255, 0, 1,
-2.385854, -0.3129829, -3.422961, 1, 0.03529412, 0, 1,
-2.319258, 0.431836, -1.888501, 1, 0.04313726, 0, 1,
-2.207601, 1.999765, 1.09525, 1, 0.04705882, 0, 1,
-2.186842, -1.336891, -2.36412, 1, 0.05490196, 0, 1,
-2.172114, -0.3373496, -1.987319, 1, 0.05882353, 0, 1,
-2.166675, 0.1917977, -1.830738, 1, 0.06666667, 0, 1,
-2.140033, -0.4158054, -0.8970095, 1, 0.07058824, 0, 1,
-2.123502, -1.240442, -2.637591, 1, 0.07843138, 0, 1,
-2.108841, -1.936951, -2.40478, 1, 0.08235294, 0, 1,
-2.035815, -1.352957, -2.094745, 1, 0.09019608, 0, 1,
-2.023299, 0.7961009, -1.59089, 1, 0.09411765, 0, 1,
-2.013091, 0.8745528, 0.2263612, 1, 0.1019608, 0, 1,
-2.005324, -1.862583, -1.050828, 1, 0.1098039, 0, 1,
-1.993858, -0.9454557, -2.08141, 1, 0.1137255, 0, 1,
-1.993004, 0.1978579, -1.565103, 1, 0.1215686, 0, 1,
-1.987646, 0.06645403, 0.2036887, 1, 0.1254902, 0, 1,
-1.984455, 0.9036755, -1.228858, 1, 0.1333333, 0, 1,
-1.955164, 0.1075253, -0.04265072, 1, 0.1372549, 0, 1,
-1.948016, 1.360362, 1.186534, 1, 0.145098, 0, 1,
-1.937214, 0.2728269, -1.214945, 1, 0.1490196, 0, 1,
-1.894538, 0.4245213, -1.37447, 1, 0.1568628, 0, 1,
-1.889966, -0.1822522, -2.843963, 1, 0.1607843, 0, 1,
-1.875133, 1.795672, -0.8892862, 1, 0.1686275, 0, 1,
-1.870455, 1.078876, -1.589505, 1, 0.172549, 0, 1,
-1.867293, -0.02594429, -1.496881, 1, 0.1803922, 0, 1,
-1.865277, -1.590571, -2.990242, 1, 0.1843137, 0, 1,
-1.860734, -0.308952, -1.52753, 1, 0.1921569, 0, 1,
-1.838764, 0.5920774, -0.9513976, 1, 0.1960784, 0, 1,
-1.804685, -0.1862872, -2.091444, 1, 0.2039216, 0, 1,
-1.793828, 1.790866, 0.9917166, 1, 0.2117647, 0, 1,
-1.79244, -0.6347482, -1.840238, 1, 0.2156863, 0, 1,
-1.790496, -0.3549283, -0.6510943, 1, 0.2235294, 0, 1,
-1.790406, 0.2376962, -2.493298, 1, 0.227451, 0, 1,
-1.780921, 0.7422726, 0.2284908, 1, 0.2352941, 0, 1,
-1.770957, -1.504776, -1.804783, 1, 0.2392157, 0, 1,
-1.755079, 0.2436146, -1.47245, 1, 0.2470588, 0, 1,
-1.745713, 0.8146725, -0.7375035, 1, 0.2509804, 0, 1,
-1.735893, 0.2109189, 0.4723147, 1, 0.2588235, 0, 1,
-1.733328, -0.2730139, -0.1379248, 1, 0.2627451, 0, 1,
-1.725998, -1.666298, -2.386705, 1, 0.2705882, 0, 1,
-1.721854, -0.3385711, -1.130394, 1, 0.2745098, 0, 1,
-1.683334, 0.05825389, -0.9358129, 1, 0.282353, 0, 1,
-1.682269, 0.5691348, -1.291322, 1, 0.2862745, 0, 1,
-1.675885, 0.3771659, -1.264018, 1, 0.2941177, 0, 1,
-1.670683, -0.3436947, -2.799358, 1, 0.3019608, 0, 1,
-1.636644, -0.2749837, -1.893548, 1, 0.3058824, 0, 1,
-1.636275, 0.62679, -3.493278, 1, 0.3137255, 0, 1,
-1.636128, -0.4650187, -1.973899, 1, 0.3176471, 0, 1,
-1.621871, -1.462965, -2.47317, 1, 0.3254902, 0, 1,
-1.615421, 1.309696, -2.130185, 1, 0.3294118, 0, 1,
-1.605652, -2.704132, -3.91941, 1, 0.3372549, 0, 1,
-1.603202, 1.286965, 0.9646225, 1, 0.3411765, 0, 1,
-1.600843, 0.1986509, -1.670207, 1, 0.3490196, 0, 1,
-1.576026, -1.468201, -2.108024, 1, 0.3529412, 0, 1,
-1.570957, 1.331061, 0.2125117, 1, 0.3607843, 0, 1,
-1.562854, -1.338428, -3.319493, 1, 0.3647059, 0, 1,
-1.537146, 0.175269, -2.222638, 1, 0.372549, 0, 1,
-1.537027, 1.421773, -0.5171507, 1, 0.3764706, 0, 1,
-1.535396, -0.009384008, -2.16067, 1, 0.3843137, 0, 1,
-1.503172, 0.000361236, -1.605659, 1, 0.3882353, 0, 1,
-1.493726, -0.9997401, -1.418995, 1, 0.3960784, 0, 1,
-1.48651, 1.038225, -2.774073, 1, 0.4039216, 0, 1,
-1.486041, -1.500652, -2.571172, 1, 0.4078431, 0, 1,
-1.476092, 1.608098, -0.4511038, 1, 0.4156863, 0, 1,
-1.470837, 1.247957, -1.536213, 1, 0.4196078, 0, 1,
-1.461281, 1.107676, -1.861993, 1, 0.427451, 0, 1,
-1.460164, 0.7361065, -2.2598, 1, 0.4313726, 0, 1,
-1.456759, 0.9735291, -1.887199, 1, 0.4392157, 0, 1,
-1.454265, -0.2381572, -1.30198, 1, 0.4431373, 0, 1,
-1.453463, 0.05998418, -1.271986, 1, 0.4509804, 0, 1,
-1.452291, 1.36296, 1.615699, 1, 0.454902, 0, 1,
-1.434821, -1.422937, -5.075898, 1, 0.4627451, 0, 1,
-1.426839, -0.2772131, -2.111707, 1, 0.4666667, 0, 1,
-1.41108, 0.6520168, -0.372208, 1, 0.4745098, 0, 1,
-1.404729, -0.1076217, -0.8283253, 1, 0.4784314, 0, 1,
-1.396109, 0.2590111, -2.104486, 1, 0.4862745, 0, 1,
-1.389946, -0.3871337, -1.975638, 1, 0.4901961, 0, 1,
-1.387517, 0.8039832, -1.766499, 1, 0.4980392, 0, 1,
-1.377421, -1.154906, -0.6211615, 1, 0.5058824, 0, 1,
-1.36549, 0.8109747, -0.1571857, 1, 0.509804, 0, 1,
-1.361873, 1.606058, -0.007968562, 1, 0.5176471, 0, 1,
-1.359497, 0.6059019, -1.412348, 1, 0.5215687, 0, 1,
-1.356599, -0.8345101, -2.29406, 1, 0.5294118, 0, 1,
-1.356019, 2.676786, -0.225945, 1, 0.5333334, 0, 1,
-1.344287, -1.115597, -1.403853, 1, 0.5411765, 0, 1,
-1.341333, -0.4406197, -3.75916, 1, 0.5450981, 0, 1,
-1.321856, -0.3592181, -2.402428, 1, 0.5529412, 0, 1,
-1.316178, -2.536044, -2.770005, 1, 0.5568628, 0, 1,
-1.315954, -0.6542268, -1.524859, 1, 0.5647059, 0, 1,
-1.313003, -1.419536, -4.259883, 1, 0.5686275, 0, 1,
-1.309964, -1.935876, -2.602883, 1, 0.5764706, 0, 1,
-1.301152, -0.3383926, -1.905061, 1, 0.5803922, 0, 1,
-1.301086, -2.262276, 0.1968739, 1, 0.5882353, 0, 1,
-1.300572, 0.07175786, -3.504845, 1, 0.5921569, 0, 1,
-1.299562, 1.186859, -1.164985, 1, 0.6, 0, 1,
-1.298729, 0.3582131, 0.1909529, 1, 0.6078432, 0, 1,
-1.291946, -0.4821101, -2.341109, 1, 0.6117647, 0, 1,
-1.284672, -0.127496, -1.662712, 1, 0.6196079, 0, 1,
-1.283924, -1.177971, -3.358862, 1, 0.6235294, 0, 1,
-1.280992, 0.2988374, -2.865172, 1, 0.6313726, 0, 1,
-1.280345, 1.056168, -3.148421, 1, 0.6352941, 0, 1,
-1.277039, -0.7877225, -1.276786, 1, 0.6431373, 0, 1,
-1.267334, -0.4507314, -2.646296, 1, 0.6470588, 0, 1,
-1.255122, -1.229539, -2.893081, 1, 0.654902, 0, 1,
-1.253137, 0.6867309, -0.5510018, 1, 0.6588235, 0, 1,
-1.243011, 0.4646797, -2.779514, 1, 0.6666667, 0, 1,
-1.23735, 1.785196, -0.5931317, 1, 0.6705883, 0, 1,
-1.230361, -0.08742587, -2.789252, 1, 0.6784314, 0, 1,
-1.229713, -1.011971, -1.423377, 1, 0.682353, 0, 1,
-1.228399, 2.35298, 0.7284273, 1, 0.6901961, 0, 1,
-1.228283, -0.8164321, -3.384994, 1, 0.6941177, 0, 1,
-1.220111, 0.4581729, -1.513009, 1, 0.7019608, 0, 1,
-1.21665, 1.163859, 0.06776661, 1, 0.7098039, 0, 1,
-1.216629, 0.8236597, -1.159891, 1, 0.7137255, 0, 1,
-1.214665, -0.9749597, -1.773224, 1, 0.7215686, 0, 1,
-1.209499, -0.06385345, -2.785177, 1, 0.7254902, 0, 1,
-1.208386, 0.2094084, -2.364481, 1, 0.7333333, 0, 1,
-1.205759, -0.9099094, -2.569333, 1, 0.7372549, 0, 1,
-1.200135, -1.563008, -3.029643, 1, 0.7450981, 0, 1,
-1.192428, 0.7472302, -0.4877188, 1, 0.7490196, 0, 1,
-1.19094, 1.650531, 0.1184248, 1, 0.7568628, 0, 1,
-1.187176, 2.246615, -1.872351, 1, 0.7607843, 0, 1,
-1.18434, -1.628736, -2.17839, 1, 0.7686275, 0, 1,
-1.182994, -1.11438, -2.145167, 1, 0.772549, 0, 1,
-1.182059, 0.1298268, -1.697255, 1, 0.7803922, 0, 1,
-1.177486, -0.3146864, -2.197459, 1, 0.7843137, 0, 1,
-1.145128, 1.689727, -1.366951, 1, 0.7921569, 0, 1,
-1.144732, 1.101645, 0.1764331, 1, 0.7960784, 0, 1,
-1.142368, 0.2543256, -1.308771, 1, 0.8039216, 0, 1,
-1.142074, -2.367907, -2.015406, 1, 0.8117647, 0, 1,
-1.138086, 0.7600539, -0.3776219, 1, 0.8156863, 0, 1,
-1.135882, 0.3915209, -1.582414, 1, 0.8235294, 0, 1,
-1.130021, -0.5637608, -1.806734, 1, 0.827451, 0, 1,
-1.119373, -1.3169, -1.66053, 1, 0.8352941, 0, 1,
-1.115154, 0.9225795, -0.9886271, 1, 0.8392157, 0, 1,
-1.109413, -1.73892, -2.956125, 1, 0.8470588, 0, 1,
-1.103007, 0.3368064, -1.843505, 1, 0.8509804, 0, 1,
-1.097294, -0.2047718, -2.097564, 1, 0.8588235, 0, 1,
-1.089892, -0.1254866, -2.54406, 1, 0.8627451, 0, 1,
-1.0894, -0.09194195, -2.161108, 1, 0.8705882, 0, 1,
-1.082351, -0.4148508, -1.770386, 1, 0.8745098, 0, 1,
-1.081653, -1.346697, -2.091605, 1, 0.8823529, 0, 1,
-1.081615, 2.626662, 1.306136, 1, 0.8862745, 0, 1,
-1.076411, 0.1063271, -2.112678, 1, 0.8941177, 0, 1,
-1.071671, 1.131241, -2.129346, 1, 0.8980392, 0, 1,
-1.053968, 0.2345356, -2.109175, 1, 0.9058824, 0, 1,
-1.052536, 1.448805, -1.738333, 1, 0.9137255, 0, 1,
-1.042959, 1.390728, -0.6232342, 1, 0.9176471, 0, 1,
-1.040324, -0.5628463, -3.143656, 1, 0.9254902, 0, 1,
-1.037818, -0.6807678, -2.386662, 1, 0.9294118, 0, 1,
-1.031642, 0.7941345, -0.6742585, 1, 0.9372549, 0, 1,
-1.031362, 0.7433791, -0.7560585, 1, 0.9411765, 0, 1,
-1.030908, 0.007588434, -1.95657, 1, 0.9490196, 0, 1,
-1.030487, 0.3831008, -1.46479, 1, 0.9529412, 0, 1,
-1.021177, -0.6052205, -2.925838, 1, 0.9607843, 0, 1,
-1.019721, -0.2757461, -1.395515, 1, 0.9647059, 0, 1,
-1.008623, -0.0006453021, -2.660079, 1, 0.972549, 0, 1,
-0.9977244, -0.7727533, -3.537388, 1, 0.9764706, 0, 1,
-0.9940743, 0.03336293, -2.456238, 1, 0.9843137, 0, 1,
-0.9871915, 0.4694178, -0.3387915, 1, 0.9882353, 0, 1,
-0.9769884, 0.02620173, -0.5626519, 1, 0.9960784, 0, 1,
-0.976601, 0.4478435, -2.367844, 0.9960784, 1, 0, 1,
-0.9748054, -1.61368, -2.225024, 0.9921569, 1, 0, 1,
-0.9731289, -1.49542, -3.251773, 0.9843137, 1, 0, 1,
-0.9725422, 0.01430167, -2.600368, 0.9803922, 1, 0, 1,
-0.9722811, -0.7967506, -2.168831, 0.972549, 1, 0, 1,
-0.9673096, -1.082751, -1.655169, 0.9686275, 1, 0, 1,
-0.9658571, -0.2791169, -0.3001289, 0.9607843, 1, 0, 1,
-0.9598643, -0.6934293, -3.029134, 0.9568627, 1, 0, 1,
-0.9564894, 0.5685748, -0.6751767, 0.9490196, 1, 0, 1,
-0.9546331, -0.7077271, -3.446912, 0.945098, 1, 0, 1,
-0.9498903, -0.9580159, 0.7733592, 0.9372549, 1, 0, 1,
-0.9427382, -0.3024918, -2.733642, 0.9333333, 1, 0, 1,
-0.9423353, -0.4630098, -0.4527063, 0.9254902, 1, 0, 1,
-0.9382604, 1.179517, -0.9359134, 0.9215686, 1, 0, 1,
-0.9373265, -0.6858873, -2.252414, 0.9137255, 1, 0, 1,
-0.9356116, -1.706344, -4.149876, 0.9098039, 1, 0, 1,
-0.9322287, -0.2047305, -2.266407, 0.9019608, 1, 0, 1,
-0.928767, -0.0645163, -1.055304, 0.8941177, 1, 0, 1,
-0.9234311, 0.06236605, -1.965486, 0.8901961, 1, 0, 1,
-0.9233931, 0.1878707, -0.47821, 0.8823529, 1, 0, 1,
-0.9230856, -0.2486249, -1.802873, 0.8784314, 1, 0, 1,
-0.9186829, 1.822156, -0.3366304, 0.8705882, 1, 0, 1,
-0.9184422, 0.4245327, -3.363718, 0.8666667, 1, 0, 1,
-0.9179333, -0.7824132, -2.085837, 0.8588235, 1, 0, 1,
-0.9155412, -0.7060669, -1.227875, 0.854902, 1, 0, 1,
-0.9137125, 1.695242, 0.1687987, 0.8470588, 1, 0, 1,
-0.912591, -1.515696, -2.872749, 0.8431373, 1, 0, 1,
-0.9086265, 1.61488, -0.4865395, 0.8352941, 1, 0, 1,
-0.9048725, 0.8622073, -1.903242, 0.8313726, 1, 0, 1,
-0.8993779, -0.36275, -2.382464, 0.8235294, 1, 0, 1,
-0.8968034, 1.234361, -1.160644, 0.8196079, 1, 0, 1,
-0.8904036, 0.02488887, -0.3019682, 0.8117647, 1, 0, 1,
-0.8862755, 0.1033492, 0.124573, 0.8078431, 1, 0, 1,
-0.8859475, -0.2664618, -1.280261, 0.8, 1, 0, 1,
-0.8733208, 2.033227, 0.3807056, 0.7921569, 1, 0, 1,
-0.8713076, -2.06749, -0.6001678, 0.7882353, 1, 0, 1,
-0.869903, 0.4987336, -0.03591724, 0.7803922, 1, 0, 1,
-0.8532478, -0.4851871, -1.103215, 0.7764706, 1, 0, 1,
-0.8479146, -0.9430751, -1.604617, 0.7686275, 1, 0, 1,
-0.8468556, -0.09603982, -2.706039, 0.7647059, 1, 0, 1,
-0.8468144, -0.9202028, -3.031735, 0.7568628, 1, 0, 1,
-0.8445611, -1.930838, -2.351326, 0.7529412, 1, 0, 1,
-0.8421255, 0.02051412, -1.933199, 0.7450981, 1, 0, 1,
-0.8371198, -2.137774, -1.097551, 0.7411765, 1, 0, 1,
-0.8342889, 0.5798948, -0.9775864, 0.7333333, 1, 0, 1,
-0.8341522, 1.192902, 1.268891, 0.7294118, 1, 0, 1,
-0.8322162, -2.279726, -1.724342, 0.7215686, 1, 0, 1,
-0.8319659, -0.7379147, -2.591061, 0.7176471, 1, 0, 1,
-0.8268607, -2.017515, -4.618705, 0.7098039, 1, 0, 1,
-0.8162259, -1.148253, -1.874658, 0.7058824, 1, 0, 1,
-0.8158321, -0.8220234, -2.207497, 0.6980392, 1, 0, 1,
-0.8144017, 0.6763166, 0.2874858, 0.6901961, 1, 0, 1,
-0.8104563, 1.598833, -0.5656868, 0.6862745, 1, 0, 1,
-0.8050581, -0.5944895, -0.194138, 0.6784314, 1, 0, 1,
-0.8047324, -1.250236, -3.868888, 0.6745098, 1, 0, 1,
-0.8041111, 0.06809174, -0.2100883, 0.6666667, 1, 0, 1,
-0.7983268, 1.632429, -2.204842, 0.6627451, 1, 0, 1,
-0.7959797, -0.5538086, -1.660688, 0.654902, 1, 0, 1,
-0.7938524, 0.4083484, -2.433073, 0.6509804, 1, 0, 1,
-0.7871931, 0.08497161, -1.758662, 0.6431373, 1, 0, 1,
-0.7796658, -0.2203428, -3.582673, 0.6392157, 1, 0, 1,
-0.7767525, -0.5092689, -2.286963, 0.6313726, 1, 0, 1,
-0.7712062, -0.005851713, -1.242001, 0.627451, 1, 0, 1,
-0.7476131, -0.3879652, -1.102047, 0.6196079, 1, 0, 1,
-0.7419845, -1.552801, -1.189554, 0.6156863, 1, 0, 1,
-0.7389736, 1.276519, -0.7701325, 0.6078432, 1, 0, 1,
-0.7321509, -1.124145, -3.710866, 0.6039216, 1, 0, 1,
-0.7287229, 1.20061, -0.8716373, 0.5960785, 1, 0, 1,
-0.7238384, 0.1677646, -1.827134, 0.5882353, 1, 0, 1,
-0.7223175, -1.152992, -3.253243, 0.5843138, 1, 0, 1,
-0.7191169, 0.313093, -0.7634971, 0.5764706, 1, 0, 1,
-0.7187403, 0.4424301, -0.7132631, 0.572549, 1, 0, 1,
-0.7166596, 1.762609, 0.6312278, 0.5647059, 1, 0, 1,
-0.7089664, 0.2212815, -0.6454437, 0.5607843, 1, 0, 1,
-0.701961, -1.999803, -2.330811, 0.5529412, 1, 0, 1,
-0.7003455, 0.3062682, -1.832029, 0.5490196, 1, 0, 1,
-0.6888964, 1.45604, -0.05111336, 0.5411765, 1, 0, 1,
-0.6876042, -0.6413447, -0.1664206, 0.5372549, 1, 0, 1,
-0.6760445, -0.1356269, -2.135781, 0.5294118, 1, 0, 1,
-0.6741428, 1.207146, 0.5992698, 0.5254902, 1, 0, 1,
-0.6735905, 0.6487775, -1.28756, 0.5176471, 1, 0, 1,
-0.672285, 0.8159485, 0.7702289, 0.5137255, 1, 0, 1,
-0.668053, -0.9593151, -1.854146, 0.5058824, 1, 0, 1,
-0.6632305, -0.0792248, -1.936904, 0.5019608, 1, 0, 1,
-0.6585193, 1.052364, -0.4407749, 0.4941176, 1, 0, 1,
-0.6572356, -1.717526, -2.671881, 0.4862745, 1, 0, 1,
-0.6528789, 0.1139798, -2.47592, 0.4823529, 1, 0, 1,
-0.6462111, 0.316765, -0.9332581, 0.4745098, 1, 0, 1,
-0.6356751, 0.6389397, -0.4330007, 0.4705882, 1, 0, 1,
-0.6333202, 0.3959145, -0.7608438, 0.4627451, 1, 0, 1,
-0.6316611, -0.412664, -2.813238, 0.4588235, 1, 0, 1,
-0.6306481, -1.616278, -2.964234, 0.4509804, 1, 0, 1,
-0.6266701, -0.3643659, -2.413742, 0.4470588, 1, 0, 1,
-0.6265391, 1.227064, -1.941899, 0.4392157, 1, 0, 1,
-0.6264197, -1.364346, -2.244979, 0.4352941, 1, 0, 1,
-0.6250105, 2.139543, -0.7738349, 0.427451, 1, 0, 1,
-0.6232173, 0.5234377, 1.358226, 0.4235294, 1, 0, 1,
-0.6161118, 0.230165, -0.9780201, 0.4156863, 1, 0, 1,
-0.614674, -0.2437676, -1.854539, 0.4117647, 1, 0, 1,
-0.613865, 0.5465335, 0.3164917, 0.4039216, 1, 0, 1,
-0.6135458, -0.7291743, -2.959865, 0.3960784, 1, 0, 1,
-0.6131212, -0.694422, -4.387647, 0.3921569, 1, 0, 1,
-0.612919, -1.4488, -2.164584, 0.3843137, 1, 0, 1,
-0.6100606, 1.155849, -1.67936, 0.3803922, 1, 0, 1,
-0.6036343, 2.448821, -0.8618962, 0.372549, 1, 0, 1,
-0.6014752, 0.07674074, -0.04103037, 0.3686275, 1, 0, 1,
-0.5991277, 0.1032844, 1.201854, 0.3607843, 1, 0, 1,
-0.5990863, -0.03592112, -1.06791, 0.3568628, 1, 0, 1,
-0.5973109, -1.20138, -3.580378, 0.3490196, 1, 0, 1,
-0.5932036, 0.2887484, -1.256468, 0.345098, 1, 0, 1,
-0.5913681, 0.8755793, -0.7230405, 0.3372549, 1, 0, 1,
-0.5882859, 0.2295862, -0.2722197, 0.3333333, 1, 0, 1,
-0.5862466, 1.162913, 0.2029203, 0.3254902, 1, 0, 1,
-0.5794219, -0.7797289, -3.35714, 0.3215686, 1, 0, 1,
-0.5782146, -0.9626436, -4.814421, 0.3137255, 1, 0, 1,
-0.5752689, -1.242365, -3.989293, 0.3098039, 1, 0, 1,
-0.5701402, 0.2664231, -1.056869, 0.3019608, 1, 0, 1,
-0.5688521, 1.238287, 0.1547435, 0.2941177, 1, 0, 1,
-0.5668667, 0.8959209, 0.4256517, 0.2901961, 1, 0, 1,
-0.5638534, -1.17614, -2.059581, 0.282353, 1, 0, 1,
-0.5616087, 0.721226, 0.7430694, 0.2784314, 1, 0, 1,
-0.5586702, -1.181802, -0.908173, 0.2705882, 1, 0, 1,
-0.5583286, -1.102654, -2.867069, 0.2666667, 1, 0, 1,
-0.5509439, -0.9243979, -0.9115617, 0.2588235, 1, 0, 1,
-0.5466979, 1.323065, 0.2931015, 0.254902, 1, 0, 1,
-0.5466558, -3.084124, -2.004332, 0.2470588, 1, 0, 1,
-0.5438651, 0.5477905, -0.5992774, 0.2431373, 1, 0, 1,
-0.5435579, 1.577135, -0.6376399, 0.2352941, 1, 0, 1,
-0.5401036, 1.145665, -1.337196, 0.2313726, 1, 0, 1,
-0.5398202, -1.244363, -2.694247, 0.2235294, 1, 0, 1,
-0.5355858, -1.394318, -2.874275, 0.2196078, 1, 0, 1,
-0.5257133, 1.446578, -2.53911, 0.2117647, 1, 0, 1,
-0.5221136, 0.9479095, 0.03776374, 0.2078431, 1, 0, 1,
-0.5179012, 0.4512334, 0.1273246, 0.2, 1, 0, 1,
-0.5113299, 0.4161619, -2.809643, 0.1921569, 1, 0, 1,
-0.5083414, -1.285509, -3.067111, 0.1882353, 1, 0, 1,
-0.5081263, 0.8269707, -1.215713, 0.1803922, 1, 0, 1,
-0.4984173, -1.976854, -2.508292, 0.1764706, 1, 0, 1,
-0.4912177, 0.6085141, -0.676151, 0.1686275, 1, 0, 1,
-0.4880543, 0.4202019, 0.305245, 0.1647059, 1, 0, 1,
-0.4862037, 1.088148, 0.1632597, 0.1568628, 1, 0, 1,
-0.4861587, 0.5651872, -1.292252, 0.1529412, 1, 0, 1,
-0.4802072, 0.03921156, -0.6126111, 0.145098, 1, 0, 1,
-0.4742301, -1.071426, -2.793757, 0.1411765, 1, 0, 1,
-0.4676542, 0.2775578, -0.07380968, 0.1333333, 1, 0, 1,
-0.4655513, -0.01462848, -2.105186, 0.1294118, 1, 0, 1,
-0.4630787, 0.2640592, -0.9855446, 0.1215686, 1, 0, 1,
-0.4629375, -0.211301, -2.625293, 0.1176471, 1, 0, 1,
-0.4570613, -1.231617, -2.748041, 0.1098039, 1, 0, 1,
-0.4550439, 0.06211843, -1.540581, 0.1058824, 1, 0, 1,
-0.4527901, -0.8628877, -4.080469, 0.09803922, 1, 0, 1,
-0.4495894, -0.1364287, -1.335174, 0.09019608, 1, 0, 1,
-0.4470227, -1.727523, -2.74178, 0.08627451, 1, 0, 1,
-0.4464309, -0.9729684, -4.455923, 0.07843138, 1, 0, 1,
-0.4458421, -0.4659007, -2.865074, 0.07450981, 1, 0, 1,
-0.4418375, 0.2794893, -0.6291254, 0.06666667, 1, 0, 1,
-0.4414542, -1.087077, -2.559687, 0.0627451, 1, 0, 1,
-0.4402438, -1.023502, -2.722428, 0.05490196, 1, 0, 1,
-0.4366829, -1.611576, -2.202018, 0.05098039, 1, 0, 1,
-0.4362965, 0.7236342, -0.9111192, 0.04313726, 1, 0, 1,
-0.4361406, 0.06204248, -0.5511968, 0.03921569, 1, 0, 1,
-0.433055, -2.169631, -3.346726, 0.03137255, 1, 0, 1,
-0.4298436, 1.046068, -1.286806, 0.02745098, 1, 0, 1,
-0.4260603, -0.01728027, -1.385813, 0.01960784, 1, 0, 1,
-0.4257951, 1.546471, 0.1620128, 0.01568628, 1, 0, 1,
-0.4247696, -1.257825, -2.459621, 0.007843138, 1, 0, 1,
-0.4244138, -0.6548114, -1.562367, 0.003921569, 1, 0, 1,
-0.4215245, 1.146469, -1.245918, 0, 1, 0.003921569, 1,
-0.4166383, -1.243917, -2.515224, 0, 1, 0.01176471, 1,
-0.408497, -0.2401203, -3.820101, 0, 1, 0.01568628, 1,
-0.4069084, 0.9733585, -0.9941351, 0, 1, 0.02352941, 1,
-0.4065788, -0.166975, -1.558934, 0, 1, 0.02745098, 1,
-0.4060651, 1.136163, -0.05744234, 0, 1, 0.03529412, 1,
-0.4015001, 1.564139, 1.734067, 0, 1, 0.03921569, 1,
-0.3946993, -0.995385, -0.9022288, 0, 1, 0.04705882, 1,
-0.3945034, 0.736375, 0.9659778, 0, 1, 0.05098039, 1,
-0.3942601, 0.2751272, -1.757415, 0, 1, 0.05882353, 1,
-0.3903294, -0.9971792, -3.257196, 0, 1, 0.0627451, 1,
-0.3901704, 0.7714213, -2.092614, 0, 1, 0.07058824, 1,
-0.3894985, 0.6413978, 1.305483, 0, 1, 0.07450981, 1,
-0.3826825, 1.210081, -0.1741774, 0, 1, 0.08235294, 1,
-0.3812111, 0.02742402, -1.39083, 0, 1, 0.08627451, 1,
-0.3805043, 1.544621, 0.2549806, 0, 1, 0.09411765, 1,
-0.3758613, 0.09372911, -0.7090467, 0, 1, 0.1019608, 1,
-0.3741142, -0.7647198, -2.640219, 0, 1, 0.1058824, 1,
-0.3740594, 0.6734202, -2.610301, 0, 1, 0.1137255, 1,
-0.370644, 0.3574537, 0.5267947, 0, 1, 0.1176471, 1,
-0.365739, 0.5886872, -0.5924766, 0, 1, 0.1254902, 1,
-0.3610238, 1.238148, 0.5645044, 0, 1, 0.1294118, 1,
-0.3598509, -0.4753718, -1.953426, 0, 1, 0.1372549, 1,
-0.3519243, -0.2561293, -0.4237594, 0, 1, 0.1411765, 1,
-0.35142, 0.02900213, -0.820277, 0, 1, 0.1490196, 1,
-0.3437882, 0.9645133, -1.028807, 0, 1, 0.1529412, 1,
-0.3434478, 1.100851, -1.484271, 0, 1, 0.1607843, 1,
-0.3414212, -1.3501, -3.632578, 0, 1, 0.1647059, 1,
-0.3412643, -1.327071, -3.176757, 0, 1, 0.172549, 1,
-0.3391863, -0.8396583, -2.28833, 0, 1, 0.1764706, 1,
-0.331415, -1.488491, -1.992103, 0, 1, 0.1843137, 1,
-0.3312117, 1.459219, 0.6428847, 0, 1, 0.1882353, 1,
-0.3310298, -0.1729085, -2.295049, 0, 1, 0.1960784, 1,
-0.3270582, 0.9496564, -1.130898, 0, 1, 0.2039216, 1,
-0.32332, -1.837749, -2.318094, 0, 1, 0.2078431, 1,
-0.323259, -0.6249616, -2.773487, 0, 1, 0.2156863, 1,
-0.3219221, 1.06205, -0.3722547, 0, 1, 0.2196078, 1,
-0.319089, -0.8628782, -4.134318, 0, 1, 0.227451, 1,
-0.3174801, -0.5241503, -1.05532, 0, 1, 0.2313726, 1,
-0.3158736, -1.086589, -4.487004, 0, 1, 0.2392157, 1,
-0.3127998, -1.880664, -3.079883, 0, 1, 0.2431373, 1,
-0.3120365, 0.6381261, 0.3093345, 0, 1, 0.2509804, 1,
-0.3101597, -0.0177157, -2.863436, 0, 1, 0.254902, 1,
-0.3087638, 0.7426212, -0.4914487, 0, 1, 0.2627451, 1,
-0.3017513, 0.9482952, 0.639241, 0, 1, 0.2666667, 1,
-0.2977011, 0.3814556, -2.141605, 0, 1, 0.2745098, 1,
-0.2970574, 0.4996032, -1.794519, 0, 1, 0.2784314, 1,
-0.2969837, -0.9891064, -1.073827, 0, 1, 0.2862745, 1,
-0.2929236, 0.4557452, -1.325039, 0, 1, 0.2901961, 1,
-0.2907956, 1.509626, -1.355193, 0, 1, 0.2980392, 1,
-0.2901085, -0.394005, -4.400908, 0, 1, 0.3058824, 1,
-0.2892909, 0.4013582, -2.063286, 0, 1, 0.3098039, 1,
-0.2883627, 0.9447547, -0.4099948, 0, 1, 0.3176471, 1,
-0.2875286, -0.4246145, -3.284427, 0, 1, 0.3215686, 1,
-0.2841174, -0.3175663, -2.184857, 0, 1, 0.3294118, 1,
-0.2741345, -0.3827839, -3.027254, 0, 1, 0.3333333, 1,
-0.2714833, -0.1139517, -1.055427, 0, 1, 0.3411765, 1,
-0.2714214, -0.8956696, -1.698878, 0, 1, 0.345098, 1,
-0.267162, 0.7337554, -1.712197, 0, 1, 0.3529412, 1,
-0.26541, 0.3862129, -0.9011616, 0, 1, 0.3568628, 1,
-0.2632503, 0.1128726, -0.8105413, 0, 1, 0.3647059, 1,
-0.2494005, -0.3033665, -2.360615, 0, 1, 0.3686275, 1,
-0.2491796, 0.9070349, -1.269933, 0, 1, 0.3764706, 1,
-0.245226, -0.4204102, -1.580233, 0, 1, 0.3803922, 1,
-0.2434501, 0.3467552, -1.584508, 0, 1, 0.3882353, 1,
-0.2430343, 0.1730434, -0.9669947, 0, 1, 0.3921569, 1,
-0.2293426, -0.9878621, -2.05855, 0, 1, 0.4, 1,
-0.229029, 0.09768746, -1.848631, 0, 1, 0.4078431, 1,
-0.2245128, -0.2390098, -1.610393, 0, 1, 0.4117647, 1,
-0.2217798, -0.8973814, -3.137884, 0, 1, 0.4196078, 1,
-0.2184381, -1.198962, -2.455356, 0, 1, 0.4235294, 1,
-0.2167523, -0.03892528, -1.957027, 0, 1, 0.4313726, 1,
-0.2142225, -0.614755, -2.892353, 0, 1, 0.4352941, 1,
-0.2133605, 0.5670609, 1.061846, 0, 1, 0.4431373, 1,
-0.2089962, 0.06427523, -1.581373, 0, 1, 0.4470588, 1,
-0.2077988, 0.8021842, 0.1966126, 0, 1, 0.454902, 1,
-0.2039458, 0.7310807, -0.7552308, 0, 1, 0.4588235, 1,
-0.1988757, -0.09729513, -0.7015517, 0, 1, 0.4666667, 1,
-0.1985347, 1.19976, 0.01298004, 0, 1, 0.4705882, 1,
-0.1908508, 0.7783514, -1.807734, 0, 1, 0.4784314, 1,
-0.1892295, -1.694029, -1.116305, 0, 1, 0.4823529, 1,
-0.1864619, -1.236992, -2.965828, 0, 1, 0.4901961, 1,
-0.1851439, -1.467845, -2.19469, 0, 1, 0.4941176, 1,
-0.1834557, 1.023008, -0.1829067, 0, 1, 0.5019608, 1,
-0.1790186, 0.3454582, -1.308873, 0, 1, 0.509804, 1,
-0.1761339, -1.019885, -4.147205, 0, 1, 0.5137255, 1,
-0.1744908, -0.6614049, -1.82965, 0, 1, 0.5215687, 1,
-0.1726455, -0.8648059, -2.798081, 0, 1, 0.5254902, 1,
-0.1697108, -1.574308, -3.169413, 0, 1, 0.5333334, 1,
-0.1636609, 0.46337, 0.04779985, 0, 1, 0.5372549, 1,
-0.1606542, -1.968423, -1.431684, 0, 1, 0.5450981, 1,
-0.1600867, -0.3009972, -4.455553, 0, 1, 0.5490196, 1,
-0.15662, 0.08739064, -1.122111, 0, 1, 0.5568628, 1,
-0.1526463, 0.2389833, -1.215719, 0, 1, 0.5607843, 1,
-0.1525317, -0.3061956, -3.310607, 0, 1, 0.5686275, 1,
-0.1519636, 0.9535297, -0.07474591, 0, 1, 0.572549, 1,
-0.1493233, 0.793142, 0.1493984, 0, 1, 0.5803922, 1,
-0.1491312, 0.3877883, 0.3055461, 0, 1, 0.5843138, 1,
-0.1425151, -0.973526, -4.517731, 0, 1, 0.5921569, 1,
-0.142511, -0.7949744, -3.07489, 0, 1, 0.5960785, 1,
-0.1414354, 0.7583649, 1.527191, 0, 1, 0.6039216, 1,
-0.1413745, -0.8117796, -2.125306, 0, 1, 0.6117647, 1,
-0.1405256, 0.1309374, 0.3219162, 0, 1, 0.6156863, 1,
-0.139942, -0.6640798, -2.705678, 0, 1, 0.6235294, 1,
-0.1312604, 0.9110997, 0.3225771, 0, 1, 0.627451, 1,
-0.1303144, 0.03345891, 0.5296421, 0, 1, 0.6352941, 1,
-0.126346, 0.0764019, -0.5480967, 0, 1, 0.6392157, 1,
-0.1227746, 0.4176041, -0.8392773, 0, 1, 0.6470588, 1,
-0.1219205, 0.05983373, 1.163024, 0, 1, 0.6509804, 1,
-0.1210245, 1.631144, 0.7765562, 0, 1, 0.6588235, 1,
-0.1189418, 0.1213262, -2.287706, 0, 1, 0.6627451, 1,
-0.1179889, -0.2101229, -3.229908, 0, 1, 0.6705883, 1,
-0.1149087, 0.337445, -1.27105, 0, 1, 0.6745098, 1,
-0.1128144, -0.1334563, -3.889416, 0, 1, 0.682353, 1,
-0.106088, 0.2263606, -0.7118175, 0, 1, 0.6862745, 1,
-0.1003559, 0.8559098, -2.327026, 0, 1, 0.6941177, 1,
-0.09662561, -0.465491, -1.821355, 0, 1, 0.7019608, 1,
-0.09201445, -2.22689, -3.452598, 0, 1, 0.7058824, 1,
-0.0910041, -0.2568032, -2.424322, 0, 1, 0.7137255, 1,
-0.08109826, 0.8622784, 0.2767385, 0, 1, 0.7176471, 1,
-0.07788573, 0.07402127, -1.104176, 0, 1, 0.7254902, 1,
-0.0775442, 1.587258, -0.74286, 0, 1, 0.7294118, 1,
-0.07748873, -1.902213, -2.00755, 0, 1, 0.7372549, 1,
-0.07391017, -1.096033, -2.964091, 0, 1, 0.7411765, 1,
-0.05926603, -0.5911318, -2.415327, 0, 1, 0.7490196, 1,
-0.05607997, 1.862863, 0.2193232, 0, 1, 0.7529412, 1,
-0.05593061, -1.179406, -3.876847, 0, 1, 0.7607843, 1,
-0.05556979, 0.4130675, -1.452139, 0, 1, 0.7647059, 1,
-0.05518275, 1.046634, -0.6137636, 0, 1, 0.772549, 1,
-0.05180904, -0.1653978, -1.788952, 0, 1, 0.7764706, 1,
-0.05047766, -0.29662, -3.454014, 0, 1, 0.7843137, 1,
-0.0501554, 1.799629, 0.5161628, 0, 1, 0.7882353, 1,
-0.04742343, -0.7533278, -3.922642, 0, 1, 0.7960784, 1,
-0.04694847, -0.02185556, -1.326571, 0, 1, 0.8039216, 1,
-0.04452587, -0.8765872, -0.0105307, 0, 1, 0.8078431, 1,
-0.04330831, 0.3828494, 0.183155, 0, 1, 0.8156863, 1,
-0.03912465, 0.2668801, -1.212361, 0, 1, 0.8196079, 1,
-0.03722039, -0.8809005, -2.313743, 0, 1, 0.827451, 1,
-0.03361914, -1.046743, -4.017422, 0, 1, 0.8313726, 1,
-0.02953126, 0.1713323, 0.3970779, 0, 1, 0.8392157, 1,
-0.02880637, -0.2741317, -2.608688, 0, 1, 0.8431373, 1,
-0.02550096, 1.033585, -0.03329797, 0, 1, 0.8509804, 1,
-0.02046228, -0.95478, -3.321226, 0, 1, 0.854902, 1,
-0.02027098, -0.1420764, -2.507501, 0, 1, 0.8627451, 1,
-0.01953265, 0.40859, -1.74035, 0, 1, 0.8666667, 1,
-0.008598276, -0.06327906, -3.64409, 0, 1, 0.8745098, 1,
-0.00455199, -0.04477902, -3.680129, 0, 1, 0.8784314, 1,
-0.004148039, -0.2353875, -1.817671, 0, 1, 0.8862745, 1,
1.818122e-05, 2.612006, 0.476832, 0, 1, 0.8901961, 1,
0.005124275, -0.807406, 3.089902, 0, 1, 0.8980392, 1,
0.005355371, -0.03075146, 4.913181, 0, 1, 0.9058824, 1,
0.005451405, -0.4633386, 3.032711, 0, 1, 0.9098039, 1,
0.006589449, 0.5169516, 0.8305843, 0, 1, 0.9176471, 1,
0.007377815, -0.7328966, 3.24775, 0, 1, 0.9215686, 1,
0.01286556, -0.7616307, 2.896536, 0, 1, 0.9294118, 1,
0.01446321, 0.3703135, 0.4704705, 0, 1, 0.9333333, 1,
0.015066, -1.358296, 2.706775, 0, 1, 0.9411765, 1,
0.01812971, 0.185078, 2.125764, 0, 1, 0.945098, 1,
0.02504946, 1.9039, 1.447215, 0, 1, 0.9529412, 1,
0.02586884, 0.8016847, 1.185795, 0, 1, 0.9568627, 1,
0.03016, 0.3795686, 1.548475, 0, 1, 0.9647059, 1,
0.03187954, -0.2722121, 3.503506, 0, 1, 0.9686275, 1,
0.03364936, 1.529086, -0.2752479, 0, 1, 0.9764706, 1,
0.03547143, 0.05522283, 1.454078, 0, 1, 0.9803922, 1,
0.03713875, -0.1792052, 4.38764, 0, 1, 0.9882353, 1,
0.0384825, 1.904551, 0.0285378, 0, 1, 0.9921569, 1,
0.03867679, 0.04780465, -0.9306354, 0, 1, 1, 1,
0.0422416, 0.4002278, 1.02893, 0, 0.9921569, 1, 1,
0.04607501, 0.02565541, 1.59373, 0, 0.9882353, 1, 1,
0.0465188, -0.6603646, 3.972665, 0, 0.9803922, 1, 1,
0.04666978, -2.134975, 2.545812, 0, 0.9764706, 1, 1,
0.04797186, -0.8144255, 3.016602, 0, 0.9686275, 1, 1,
0.05168915, 0.9000933, -2.210527, 0, 0.9647059, 1, 1,
0.05281609, 0.2799733, 1.60724, 0, 0.9568627, 1, 1,
0.0529198, 0.9733164, -2.044657, 0, 0.9529412, 1, 1,
0.05660053, -0.2749425, 2.442067, 0, 0.945098, 1, 1,
0.0567194, 1.586452, 1.045872, 0, 0.9411765, 1, 1,
0.06049358, -0.8301973, 0.2034052, 0, 0.9333333, 1, 1,
0.06106242, -1.570891, 4.870277, 0, 0.9294118, 1, 1,
0.067529, -1.266419, 3.384402, 0, 0.9215686, 1, 1,
0.06896389, -2.659896, 2.50064, 0, 0.9176471, 1, 1,
0.07001308, 0.1220652, 1.367658, 0, 0.9098039, 1, 1,
0.07069798, -0.9039939, 1.773215, 0, 0.9058824, 1, 1,
0.07292901, -0.8532268, 3.61466, 0, 0.8980392, 1, 1,
0.07315114, -0.02434325, 3.712612, 0, 0.8901961, 1, 1,
0.07322832, 1.414298, -0.1189896, 0, 0.8862745, 1, 1,
0.07529374, -0.6600721, 1.38961, 0, 0.8784314, 1, 1,
0.07850889, 1.785582, 1.71691, 0, 0.8745098, 1, 1,
0.0804091, 1.566023, 0.3869946, 0, 0.8666667, 1, 1,
0.0822496, -0.8715279, 3.337478, 0, 0.8627451, 1, 1,
0.08359134, 0.6972649, -0.7155441, 0, 0.854902, 1, 1,
0.08583017, -1.564128, 2.933686, 0, 0.8509804, 1, 1,
0.08679602, 0.400192, 0.8300039, 0, 0.8431373, 1, 1,
0.08936433, 0.3808259, 1.562503, 0, 0.8392157, 1, 1,
0.08950236, 0.6232709, -0.1084228, 0, 0.8313726, 1, 1,
0.08957346, -0.5689449, 1.1837, 0, 0.827451, 1, 1,
0.09085494, -1.499971, 2.53209, 0, 0.8196079, 1, 1,
0.09116066, -1.909309, 2.660887, 0, 0.8156863, 1, 1,
0.09728602, 0.3528901, 1.207749, 0, 0.8078431, 1, 1,
0.1014658, -0.148356, 2.464185, 0, 0.8039216, 1, 1,
0.1019081, 0.5528342, -0.6801577, 0, 0.7960784, 1, 1,
0.1023005, 1.20051, -1.794862, 0, 0.7882353, 1, 1,
0.1023285, -0.1428703, 1.731006, 0, 0.7843137, 1, 1,
0.1044692, -0.6586176, 3.791324, 0, 0.7764706, 1, 1,
0.1058691, -0.6754109, 2.145511, 0, 0.772549, 1, 1,
0.1066975, -0.7842209, 3.089505, 0, 0.7647059, 1, 1,
0.1081107, 1.273231, -1.012955, 0, 0.7607843, 1, 1,
0.1135249, -0.6221942, 4.378182, 0, 0.7529412, 1, 1,
0.114015, -0.6668459, 2.46147, 0, 0.7490196, 1, 1,
0.1197917, 0.339951, -1.053383, 0, 0.7411765, 1, 1,
0.1199483, -0.2471818, 3.655983, 0, 0.7372549, 1, 1,
0.1200582, 1.051273, 1.566342, 0, 0.7294118, 1, 1,
0.1208786, -0.472791, 1.838568, 0, 0.7254902, 1, 1,
0.1220819, -1.252455, 1.58067, 0, 0.7176471, 1, 1,
0.124294, -1.989973, 1.852554, 0, 0.7137255, 1, 1,
0.1268069, 1.01569, 1.156193, 0, 0.7058824, 1, 1,
0.1275378, -1.069639, 3.862249, 0, 0.6980392, 1, 1,
0.1299955, 1.796205, 1.693183, 0, 0.6941177, 1, 1,
0.1312273, 0.3799914, -1.893868, 0, 0.6862745, 1, 1,
0.1324974, -0.5723035, 0.4384478, 0, 0.682353, 1, 1,
0.1343585, 0.83343, 0.2682022, 0, 0.6745098, 1, 1,
0.1360023, 0.5244241, -0.3800125, 0, 0.6705883, 1, 1,
0.1374733, -1.686957, 3.565217, 0, 0.6627451, 1, 1,
0.1376177, 1.876902, 0.7009574, 0, 0.6588235, 1, 1,
0.1398228, 0.2011634, 0.0605015, 0, 0.6509804, 1, 1,
0.1408823, 0.2380294, -0.09398209, 0, 0.6470588, 1, 1,
0.1412823, 0.2581919, 1.484128, 0, 0.6392157, 1, 1,
0.1428637, -0.2370437, 1.95576, 0, 0.6352941, 1, 1,
0.1435348, -1.093415, 3.189332, 0, 0.627451, 1, 1,
0.1455883, 0.0597844, 0.7682427, 0, 0.6235294, 1, 1,
0.1459555, -0.579536, 2.755998, 0, 0.6156863, 1, 1,
0.1461135, -0.00508473, 0.9459085, 0, 0.6117647, 1, 1,
0.1476747, -0.2981987, 2.689291, 0, 0.6039216, 1, 1,
0.1482311, 0.3892087, 1.297445, 0, 0.5960785, 1, 1,
0.1502513, 1.392786, 2.212772, 0, 0.5921569, 1, 1,
0.1513848, -1.106059, 3.344765, 0, 0.5843138, 1, 1,
0.1518563, 0.2105488, 0.4393957, 0, 0.5803922, 1, 1,
0.1524907, -0.7213422, 2.508096, 0, 0.572549, 1, 1,
0.1569952, 0.6930397, -2.742467, 0, 0.5686275, 1, 1,
0.1571429, 0.1413935, 0.6114222, 0, 0.5607843, 1, 1,
0.1592146, 0.852264, -0.2557985, 0, 0.5568628, 1, 1,
0.1595964, -1.828476, 2.576331, 0, 0.5490196, 1, 1,
0.1690985, -0.7236193, 2.863739, 0, 0.5450981, 1, 1,
0.1736593, 0.8128976, 0.07753217, 0, 0.5372549, 1, 1,
0.1757046, 0.2144557, 1.176775, 0, 0.5333334, 1, 1,
0.1774197, -0.4054033, 3.899836, 0, 0.5254902, 1, 1,
0.1779866, 0.1598055, -1.176947, 0, 0.5215687, 1, 1,
0.1799123, 1.464585, -0.9951446, 0, 0.5137255, 1, 1,
0.180425, 0.7228348, 0.3480051, 0, 0.509804, 1, 1,
0.1834229, 0.02667292, 3.106334, 0, 0.5019608, 1, 1,
0.1854402, 0.05641557, -0.447182, 0, 0.4941176, 1, 1,
0.1870221, -0.1340194, 1.675562, 0, 0.4901961, 1, 1,
0.1880634, -0.4751131, 2.859827, 0, 0.4823529, 1, 1,
0.1946944, 0.7460583, 1.332915, 0, 0.4784314, 1, 1,
0.199943, -1.562321, 0.2797513, 0, 0.4705882, 1, 1,
0.2012599, -0.4996113, 2.732946, 0, 0.4666667, 1, 1,
0.2019545, -1.238326, 2.280668, 0, 0.4588235, 1, 1,
0.2079501, -2.407343, 3.767714, 0, 0.454902, 1, 1,
0.2088459, 1.523814, 1.457161, 0, 0.4470588, 1, 1,
0.2110981, 0.5812641, 0.8850235, 0, 0.4431373, 1, 1,
0.2114833, 0.7762489, -0.7807018, 0, 0.4352941, 1, 1,
0.2115782, 0.9322586, -0.1653157, 0, 0.4313726, 1, 1,
0.214476, -1.884312, 2.109819, 0, 0.4235294, 1, 1,
0.2151777, 1.340108, 0.1979681, 0, 0.4196078, 1, 1,
0.2153666, 0.04764034, 1.84612, 0, 0.4117647, 1, 1,
0.2194743, 1.064898, 1.498966, 0, 0.4078431, 1, 1,
0.2205401, 0.3607185, -1.064217, 0, 0.4, 1, 1,
0.2243302, 0.2272649, 1.82182, 0, 0.3921569, 1, 1,
0.2252562, 0.9033979, 0.7508621, 0, 0.3882353, 1, 1,
0.2270654, -0.6770903, 1.146159, 0, 0.3803922, 1, 1,
0.2286129, 1.131064, 0.5015904, 0, 0.3764706, 1, 1,
0.2329297, 0.3651512, -0.1372843, 0, 0.3686275, 1, 1,
0.2332165, 0.09983103, 1.062825, 0, 0.3647059, 1, 1,
0.2364873, -2.379177, 4.803863, 0, 0.3568628, 1, 1,
0.2373583, -1.380178, 3.394542, 0, 0.3529412, 1, 1,
0.2374076, -0.3673958, 3.804583, 0, 0.345098, 1, 1,
0.2409393, -0.4308055, 3.246815, 0, 0.3411765, 1, 1,
0.2428259, -0.7903805, 2.663151, 0, 0.3333333, 1, 1,
0.2510796, -0.009489829, 3.052916, 0, 0.3294118, 1, 1,
0.2574784, -0.3822492, 1.362917, 0, 0.3215686, 1, 1,
0.2593918, -0.8936747, 4.748255, 0, 0.3176471, 1, 1,
0.2626529, 0.6004474, -0.4611283, 0, 0.3098039, 1, 1,
0.2636946, -0.7488765, 1.646751, 0, 0.3058824, 1, 1,
0.2642867, 0.2196592, 1.149329, 0, 0.2980392, 1, 1,
0.2649409, 1.521309, 1.02356, 0, 0.2901961, 1, 1,
0.2683406, 0.5501672, 0.5062065, 0, 0.2862745, 1, 1,
0.2800004, -1.309503, 3.215131, 0, 0.2784314, 1, 1,
0.2835802, 0.6368043, 0.605863, 0, 0.2745098, 1, 1,
0.2838162, -0.5919479, 1.504603, 0, 0.2666667, 1, 1,
0.2846335, 0.2417264, 0.08705146, 0, 0.2627451, 1, 1,
0.2869769, -0.3270716, 1.604729, 0, 0.254902, 1, 1,
0.2882421, 1.296401, 0.6341049, 0, 0.2509804, 1, 1,
0.2885481, -0.6063827, 4.366024, 0, 0.2431373, 1, 1,
0.2899262, -0.5535071, 3.932409, 0, 0.2392157, 1, 1,
0.2926748, -0.8757634, 2.689189, 0, 0.2313726, 1, 1,
0.2964149, 1.54385, 1.003823, 0, 0.227451, 1, 1,
0.2986531, 0.7119118, 1.384266, 0, 0.2196078, 1, 1,
0.3086357, 2.165906, -1.189425, 0, 0.2156863, 1, 1,
0.3088029, 0.6628897, -0.005242248, 0, 0.2078431, 1, 1,
0.3103741, 0.1705147, -0.3326261, 0, 0.2039216, 1, 1,
0.3108495, -1.590299, 3.063991, 0, 0.1960784, 1, 1,
0.3125613, 0.3789477, 0.6556057, 0, 0.1882353, 1, 1,
0.3155758, -0.3649684, 2.33197, 0, 0.1843137, 1, 1,
0.3160565, -0.4929536, 3.1626, 0, 0.1764706, 1, 1,
0.3169825, 0.9505318, -1.361773, 0, 0.172549, 1, 1,
0.3179139, 0.8826959, 0.9740074, 0, 0.1647059, 1, 1,
0.3187841, -0.7402125, 2.398233, 0, 0.1607843, 1, 1,
0.3204137, -1.328105, 2.659287, 0, 0.1529412, 1, 1,
0.3216593, -0.1421069, 3.104685, 0, 0.1490196, 1, 1,
0.3218966, -0.1893717, 1.977364, 0, 0.1411765, 1, 1,
0.3278883, 1.43531, -1.609514, 0, 0.1372549, 1, 1,
0.3285641, -0.5571882, 1.645825, 0, 0.1294118, 1, 1,
0.3323216, 1.246796, -0.7160469, 0, 0.1254902, 1, 1,
0.3326846, -1.534647, 2.401466, 0, 0.1176471, 1, 1,
0.3337148, -0.001624664, 1.991792, 0, 0.1137255, 1, 1,
0.3344675, 1.259501, 1.672607, 0, 0.1058824, 1, 1,
0.337888, -0.5535908, 3.433048, 0, 0.09803922, 1, 1,
0.3408982, -0.03753448, 2.874457, 0, 0.09411765, 1, 1,
0.3474078, -1.330256, 3.486277, 0, 0.08627451, 1, 1,
0.3477129, 0.8947021, -0.5221437, 0, 0.08235294, 1, 1,
0.3519297, -0.0796788, -0.960567, 0, 0.07450981, 1, 1,
0.3537193, 0.327693, 0.7566857, 0, 0.07058824, 1, 1,
0.3590782, -0.1300845, 1.771214, 0, 0.0627451, 1, 1,
0.361438, -0.454073, 3.28193, 0, 0.05882353, 1, 1,
0.3621224, 1.659753, 0.6008153, 0, 0.05098039, 1, 1,
0.3643393, 0.02158565, 1.418647, 0, 0.04705882, 1, 1,
0.3649606, -1.777742, 3.376135, 0, 0.03921569, 1, 1,
0.3711977, -0.6871225, 2.965376, 0, 0.03529412, 1, 1,
0.3720172, 0.8729509, 1.655936, 0, 0.02745098, 1, 1,
0.3721255, 0.3908696, 2.918921, 0, 0.02352941, 1, 1,
0.372287, -1.435077, 1.692809, 0, 0.01568628, 1, 1,
0.3730122, 0.05292062, 1.562383, 0, 0.01176471, 1, 1,
0.3734275, -0.9645737, 3.643166, 0, 0.003921569, 1, 1,
0.3757578, -0.9554785, 2.849321, 0.003921569, 0, 1, 1,
0.3769104, 0.9475499, 0.2824919, 0.007843138, 0, 1, 1,
0.3777776, -1.659903, 3.520717, 0.01568628, 0, 1, 1,
0.3794613, 0.4559526, 0.9581285, 0.01960784, 0, 1, 1,
0.3795448, -0.6221491, 3.827069, 0.02745098, 0, 1, 1,
0.3809934, -1.366622, 2.194288, 0.03137255, 0, 1, 1,
0.3829881, 0.7884372, -1.901038, 0.03921569, 0, 1, 1,
0.3843177, 0.1580242, 1.894603, 0.04313726, 0, 1, 1,
0.3879455, -0.5315242, 4.369369, 0.05098039, 0, 1, 1,
0.3880563, -0.7365005, 3.597917, 0.05490196, 0, 1, 1,
0.3959679, 1.893554, 1.008668, 0.0627451, 0, 1, 1,
0.4011246, -0.8549144, 4.166925, 0.06666667, 0, 1, 1,
0.4068179, -1.19778, 2.88019, 0.07450981, 0, 1, 1,
0.4070013, 0.1486175, 0.3815988, 0.07843138, 0, 1, 1,
0.4088083, 0.9513865, 1.633772, 0.08627451, 0, 1, 1,
0.410148, 0.1342111, 0.5497505, 0.09019608, 0, 1, 1,
0.4104967, 1.285036, -0.2422704, 0.09803922, 0, 1, 1,
0.4167939, -0.1256087, 2.372417, 0.1058824, 0, 1, 1,
0.4178428, -1.213509, 1.203539, 0.1098039, 0, 1, 1,
0.4211924, -0.948858, 1.074938, 0.1176471, 0, 1, 1,
0.4212037, -0.2208335, 2.222456, 0.1215686, 0, 1, 1,
0.4215818, -0.1380638, 1.015228, 0.1294118, 0, 1, 1,
0.4220434, 1.100144, -0.08906, 0.1333333, 0, 1, 1,
0.4248971, -0.1705698, 3.458871, 0.1411765, 0, 1, 1,
0.4257546, -0.688834, 1.868085, 0.145098, 0, 1, 1,
0.427207, -0.7063727, 1.115555, 0.1529412, 0, 1, 1,
0.4338253, 0.6466885, 0.902469, 0.1568628, 0, 1, 1,
0.4342844, -0.1758304, 2.01213, 0.1647059, 0, 1, 1,
0.4387227, -1.394775, 3.389183, 0.1686275, 0, 1, 1,
0.446654, 0.610655, 1.632043, 0.1764706, 0, 1, 1,
0.4470271, 1.027475, -0.2151751, 0.1803922, 0, 1, 1,
0.4484482, 0.8402748, -0.6245132, 0.1882353, 0, 1, 1,
0.45141, -0.9601572, 5.171338, 0.1921569, 0, 1, 1,
0.4531668, -1.070672, 1.135126, 0.2, 0, 1, 1,
0.4543601, -1.666196, 1.174461, 0.2078431, 0, 1, 1,
0.4564965, -0.03446968, 0.3137004, 0.2117647, 0, 1, 1,
0.4570359, -0.2612951, 2.118569, 0.2196078, 0, 1, 1,
0.4639947, -0.05406426, 0.9411232, 0.2235294, 0, 1, 1,
0.468449, 0.3167289, 0.6473914, 0.2313726, 0, 1, 1,
0.4699187, -1.026877, 3.936144, 0.2352941, 0, 1, 1,
0.4703807, -0.6415733, 2.400406, 0.2431373, 0, 1, 1,
0.4710961, -0.4939709, 3.080667, 0.2470588, 0, 1, 1,
0.4758477, 2.338342, 0.5606084, 0.254902, 0, 1, 1,
0.4789272, -0.118031, 1.149508, 0.2588235, 0, 1, 1,
0.4821521, 0.9329236, 1.473849, 0.2666667, 0, 1, 1,
0.48243, -0.797493, 3.215168, 0.2705882, 0, 1, 1,
0.4878588, -0.7432272, 4.014785, 0.2784314, 0, 1, 1,
0.4907467, -0.0639876, 2.758257, 0.282353, 0, 1, 1,
0.4915185, -0.06653526, 0.3073258, 0.2901961, 0, 1, 1,
0.4929722, -0.6732184, 2.42334, 0.2941177, 0, 1, 1,
0.4953851, -0.3363807, 0.6842908, 0.3019608, 0, 1, 1,
0.4986218, 0.09884965, 1.789498, 0.3098039, 0, 1, 1,
0.4987459, -1.543464, 1.358127, 0.3137255, 0, 1, 1,
0.5218448, -1.645152, 3.811536, 0.3215686, 0, 1, 1,
0.5241852, -0.4723183, 3.23708, 0.3254902, 0, 1, 1,
0.5258254, -1.061516, 3.208136, 0.3333333, 0, 1, 1,
0.5279264, 1.508333, -0.9656752, 0.3372549, 0, 1, 1,
0.5298275, 0.6688254, -0.5257626, 0.345098, 0, 1, 1,
0.5362977, 0.1478436, 1.231966, 0.3490196, 0, 1, 1,
0.5367818, 0.2605259, 0.5590971, 0.3568628, 0, 1, 1,
0.5412853, -1.204382, 4.058907, 0.3607843, 0, 1, 1,
0.5420577, -0.4760865, 1.520221, 0.3686275, 0, 1, 1,
0.5420834, -0.7914597, 0.5366313, 0.372549, 0, 1, 1,
0.5469122, 0.08003933, 1.647262, 0.3803922, 0, 1, 1,
0.5525513, -1.695192, 2.228398, 0.3843137, 0, 1, 1,
0.5544426, -0.8165412, 1.859268, 0.3921569, 0, 1, 1,
0.5548231, -0.2123581, 1.697042, 0.3960784, 0, 1, 1,
0.5551189, 0.3516896, 1.3953, 0.4039216, 0, 1, 1,
0.5555349, 0.04576706, 0.8152965, 0.4117647, 0, 1, 1,
0.5623929, -0.4797794, 1.925788, 0.4156863, 0, 1, 1,
0.5672634, 1.292544, -0.959491, 0.4235294, 0, 1, 1,
0.5690611, -0.001168935, 0.1059323, 0.427451, 0, 1, 1,
0.5772673, 1.358274, 0.1997246, 0.4352941, 0, 1, 1,
0.5781881, 1.98716, -0.6773242, 0.4392157, 0, 1, 1,
0.5801424, 0.9054146, 2.8974, 0.4470588, 0, 1, 1,
0.5824316, 0.2806351, 1.909418, 0.4509804, 0, 1, 1,
0.5866522, 0.6060682, -0.06020583, 0.4588235, 0, 1, 1,
0.5880874, 0.1874002, -0.5159039, 0.4627451, 0, 1, 1,
0.5890952, 2.100959, -0.5519537, 0.4705882, 0, 1, 1,
0.5900509, -0.2130975, 1.019924, 0.4745098, 0, 1, 1,
0.5926718, -0.102717, 2.778289, 0.4823529, 0, 1, 1,
0.6013258, 0.5125885, 0.01103182, 0.4862745, 0, 1, 1,
0.6068174, 0.6844606, 0.1984862, 0.4941176, 0, 1, 1,
0.6080272, 0.9359534, 1.783436, 0.5019608, 0, 1, 1,
0.6080572, 0.4185048, -0.1237576, 0.5058824, 0, 1, 1,
0.6155098, -0.8781831, 1.480879, 0.5137255, 0, 1, 1,
0.6163054, -0.6468106, 1.753374, 0.5176471, 0, 1, 1,
0.619351, -0.2336605, 1.899709, 0.5254902, 0, 1, 1,
0.620191, 0.7703456, 0.8159009, 0.5294118, 0, 1, 1,
0.6208668, 1.655092, -0.9581022, 0.5372549, 0, 1, 1,
0.6232277, 0.9775705, -0.9316202, 0.5411765, 0, 1, 1,
0.6266226, 0.24894, 2.253664, 0.5490196, 0, 1, 1,
0.6359686, -1.240488, 2.43681, 0.5529412, 0, 1, 1,
0.6463973, -2.837401, 1.40003, 0.5607843, 0, 1, 1,
0.6516297, -0.153824, 0.9082064, 0.5647059, 0, 1, 1,
0.6572922, -0.2427433, 2.957475, 0.572549, 0, 1, 1,
0.6638303, -1.116095, 3.366148, 0.5764706, 0, 1, 1,
0.6652639, 0.2480372, 1.899001, 0.5843138, 0, 1, 1,
0.6722346, -0.1373357, 0.01037288, 0.5882353, 0, 1, 1,
0.6727292, -0.3086554, 3.143297, 0.5960785, 0, 1, 1,
0.6733183, 1.305603, 0.1897689, 0.6039216, 0, 1, 1,
0.6878996, 0.4485114, 0.8423668, 0.6078432, 0, 1, 1,
0.6923563, -0.8305526, 2.76044, 0.6156863, 0, 1, 1,
0.6950604, 0.5566978, 1.330691, 0.6196079, 0, 1, 1,
0.6967459, -0.7467834, 2.96531, 0.627451, 0, 1, 1,
0.7015367, -0.06034061, 0.4268618, 0.6313726, 0, 1, 1,
0.7073957, -0.2095245, 0.7079378, 0.6392157, 0, 1, 1,
0.7106927, 1.497292, 0.8769615, 0.6431373, 0, 1, 1,
0.7117282, -0.07393277, 3.043207, 0.6509804, 0, 1, 1,
0.7206303, 1.067507, 0.3392257, 0.654902, 0, 1, 1,
0.7222403, -2.192885, 2.571701, 0.6627451, 0, 1, 1,
0.7222917, -1.055894, 3.788995, 0.6666667, 0, 1, 1,
0.7307805, -0.04816222, 2.121868, 0.6745098, 0, 1, 1,
0.7343442, -0.9378716, 4.478129, 0.6784314, 0, 1, 1,
0.7347918, 0.5166937, -0.5086822, 0.6862745, 0, 1, 1,
0.7362117, -0.5353687, 0.3404981, 0.6901961, 0, 1, 1,
0.7387766, 1.121744, 1.914092, 0.6980392, 0, 1, 1,
0.739656, 0.886789, 0.3567172, 0.7058824, 0, 1, 1,
0.7414011, -1.285959, 2.485258, 0.7098039, 0, 1, 1,
0.7449143, -2.266242, 2.918396, 0.7176471, 0, 1, 1,
0.7468155, -0.1127919, 2.547513, 0.7215686, 0, 1, 1,
0.7469283, 1.421047, -0.2329901, 0.7294118, 0, 1, 1,
0.7472619, -0.8364559, 2.873096, 0.7333333, 0, 1, 1,
0.7474775, 0.5223154, 0.4827197, 0.7411765, 0, 1, 1,
0.7490934, -1.050289, 3.622875, 0.7450981, 0, 1, 1,
0.7530655, 2.393524, -0.02834799, 0.7529412, 0, 1, 1,
0.7582959, 0.38748, 1.913554, 0.7568628, 0, 1, 1,
0.76127, 1.885057, 0.721045, 0.7647059, 0, 1, 1,
0.764176, -0.6890315, 0.8207012, 0.7686275, 0, 1, 1,
0.7739856, -0.7081972, 2.077055, 0.7764706, 0, 1, 1,
0.7782245, 0.9690148, 0.02101411, 0.7803922, 0, 1, 1,
0.7822681, 2.241631, 0.8360048, 0.7882353, 0, 1, 1,
0.786526, -0.3839056, 1.575849, 0.7921569, 0, 1, 1,
0.788688, 0.5128816, 2.962579, 0.8, 0, 1, 1,
0.795994, -1.275811, 2.122214, 0.8078431, 0, 1, 1,
0.8008308, -0.2428325, 1.911787, 0.8117647, 0, 1, 1,
0.8021008, 2.451873, 0.9276409, 0.8196079, 0, 1, 1,
0.8025497, -1.266435, 2.227871, 0.8235294, 0, 1, 1,
0.8058469, -0.3301653, 1.427482, 0.8313726, 0, 1, 1,
0.8076671, -0.8245405, 0.1396973, 0.8352941, 0, 1, 1,
0.8094851, -0.9105479, 3.626868, 0.8431373, 0, 1, 1,
0.8111035, -1.563529, 2.814895, 0.8470588, 0, 1, 1,
0.8134981, 0.04881053, 0.8434815, 0.854902, 0, 1, 1,
0.8154907, 0.8145951, -0.6332778, 0.8588235, 0, 1, 1,
0.8217747, 0.8155781, 0.9532644, 0.8666667, 0, 1, 1,
0.8263157, 1.316349, -0.3755664, 0.8705882, 0, 1, 1,
0.8274713, -1.236237, 1.316338, 0.8784314, 0, 1, 1,
0.830283, -0.6475099, 1.166366, 0.8823529, 0, 1, 1,
0.830604, -1.532169, 3.393129, 0.8901961, 0, 1, 1,
0.8312753, -0.9713037, 2.248901, 0.8941177, 0, 1, 1,
0.8415141, -1.026861, 4.706821, 0.9019608, 0, 1, 1,
0.8511405, -0.06984837, 2.673289, 0.9098039, 0, 1, 1,
0.8515533, -0.9426262, 2.920369, 0.9137255, 0, 1, 1,
0.8519991, -0.8690293, 1.766999, 0.9215686, 0, 1, 1,
0.8634192, -0.5729063, 1.763765, 0.9254902, 0, 1, 1,
0.8639396, -0.03306652, 0.3817503, 0.9333333, 0, 1, 1,
0.867029, -0.005091815, 2.158897, 0.9372549, 0, 1, 1,
0.8671867, 1.913572, 1.072769, 0.945098, 0, 1, 1,
0.8760989, -1.670465, 2.690205, 0.9490196, 0, 1, 1,
0.8810295, -0.7698929, 2.830116, 0.9568627, 0, 1, 1,
0.8826835, -0.627176, 2.710024, 0.9607843, 0, 1, 1,
0.884528, -0.1943135, 2.05035, 0.9686275, 0, 1, 1,
0.8944826, -0.1735455, 1.270364, 0.972549, 0, 1, 1,
0.896437, 1.521984, 1.79219, 0.9803922, 0, 1, 1,
0.8981432, -1.959518, 1.729846, 0.9843137, 0, 1, 1,
0.9004761, 1.695975, 1.743775, 0.9921569, 0, 1, 1,
0.9094403, 1.095484, 0.8738583, 0.9960784, 0, 1, 1,
0.923988, 0.8234051, 0.1810409, 1, 0, 0.9960784, 1,
0.9239978, 1.281309, 1.546237, 1, 0, 0.9882353, 1,
0.927626, -0.7966293, 3.034875, 1, 0, 0.9843137, 1,
0.9289747, -1.019214, 1.659389, 1, 0, 0.9764706, 1,
0.9290146, 0.8119477, 1.634721, 1, 0, 0.972549, 1,
0.9349538, 0.1885699, 1.51088, 1, 0, 0.9647059, 1,
0.9421938, 0.1211079, -0.05358771, 1, 0, 0.9607843, 1,
0.9423676, -1.282658, 1.921348, 1, 0, 0.9529412, 1,
0.9522887, -0.7575601, 2.947278, 1, 0, 0.9490196, 1,
0.9554814, 0.1760218, 1.350684, 1, 0, 0.9411765, 1,
0.9583279, 0.5553614, 0.6838204, 1, 0, 0.9372549, 1,
0.9743855, 0.7316355, 2.244033, 1, 0, 0.9294118, 1,
0.9774791, -1.588157, 3.941858, 1, 0, 0.9254902, 1,
0.9787755, 1.986553, 0.6636701, 1, 0, 0.9176471, 1,
0.9797139, 0.4801089, -0.2996492, 1, 0, 0.9137255, 1,
0.9797654, -1.506797, 1.679315, 1, 0, 0.9058824, 1,
0.9799793, -0.4360022, 0.7966384, 1, 0, 0.9019608, 1,
0.9800952, 0.2460706, 2.343036, 1, 0, 0.8941177, 1,
0.985009, -0.8843082, 4.409937, 1, 0, 0.8862745, 1,
0.9883552, 0.1288166, 1.041955, 1, 0, 0.8823529, 1,
0.9913003, -0.2848113, 2.088365, 1, 0, 0.8745098, 1,
0.9995562, -0.2241021, 3.193822, 1, 0, 0.8705882, 1,
1.00008, -0.05717199, 0.3185535, 1, 0, 0.8627451, 1,
1.001277, 0.0009310417, 0.3610179, 1, 0, 0.8588235, 1,
1.001638, 0.3184557, 0.6127065, 1, 0, 0.8509804, 1,
1.005356, 0.6205195, 1.316106, 1, 0, 0.8470588, 1,
1.005753, 0.3453975, 1.365377, 1, 0, 0.8392157, 1,
1.006766, -1.322484, 2.174451, 1, 0, 0.8352941, 1,
1.011133, 2.595247, 1.017094, 1, 0, 0.827451, 1,
1.011544, -0.7162123, 4.047993, 1, 0, 0.8235294, 1,
1.011735, -0.3919341, 2.380059, 1, 0, 0.8156863, 1,
1.016125, 0.4510221, -0.9545793, 1, 0, 0.8117647, 1,
1.023139, 1.332903, 3.306142, 1, 0, 0.8039216, 1,
1.028789, -0.1952402, 1.471937, 1, 0, 0.7960784, 1,
1.030559, 0.368039, 1.739125, 1, 0, 0.7921569, 1,
1.033824, 0.1264676, 3.094915, 1, 0, 0.7843137, 1,
1.052055, -0.2096577, 2.188436, 1, 0, 0.7803922, 1,
1.055999, -0.7286966, 2.329626, 1, 0, 0.772549, 1,
1.063775, 0.800876, -0.4877934, 1, 0, 0.7686275, 1,
1.07343, 0.3820146, 2.908618, 1, 0, 0.7607843, 1,
1.093256, 2.741603, 1.686817, 1, 0, 0.7568628, 1,
1.096393, -1.05294, 0.9588786, 1, 0, 0.7490196, 1,
1.097461, -0.453994, 2.198591, 1, 0, 0.7450981, 1,
1.104251, 0.9118899, -0.1718134, 1, 0, 0.7372549, 1,
1.110806, 0.1482058, 2.412277, 1, 0, 0.7333333, 1,
1.117458, -1.292527, 1.961868, 1, 0, 0.7254902, 1,
1.125741, 0.4957399, 1.732887, 1, 0, 0.7215686, 1,
1.133466, -0.3137515, 2.320457, 1, 0, 0.7137255, 1,
1.136157, 0.9392765, 3.312747, 1, 0, 0.7098039, 1,
1.136311, -0.04232144, 0.996807, 1, 0, 0.7019608, 1,
1.13699, 0.8908646, 1.28299, 1, 0, 0.6941177, 1,
1.141169, 1.563574, 0.6013867, 1, 0, 0.6901961, 1,
1.143526, 1.730632, 0.547583, 1, 0, 0.682353, 1,
1.15024, 0.1832045, 1.859666, 1, 0, 0.6784314, 1,
1.157286, -0.293457, 1.71023, 1, 0, 0.6705883, 1,
1.160687, 0.544876, 0.1249739, 1, 0, 0.6666667, 1,
1.166761, 0.5826379, 2.18788, 1, 0, 0.6588235, 1,
1.168248, 0.5311678, 1.993028, 1, 0, 0.654902, 1,
1.168555, 0.5624894, -0.7700716, 1, 0, 0.6470588, 1,
1.170085, -0.1030048, 1.795098, 1, 0, 0.6431373, 1,
1.178112, 1.441518, -1.046494, 1, 0, 0.6352941, 1,
1.181482, 1.131185, 0.08850203, 1, 0, 0.6313726, 1,
1.191462, -0.6218707, 1.01785, 1, 0, 0.6235294, 1,
1.193547, 0.6838799, 2.16263, 1, 0, 0.6196079, 1,
1.193937, 1.031296, -0.8803212, 1, 0, 0.6117647, 1,
1.203036, -1.201189, 2.61769, 1, 0, 0.6078432, 1,
1.21077, -2.135459, 1.934536, 1, 0, 0.6, 1,
1.21229, 1.463152, 1.565609, 1, 0, 0.5921569, 1,
1.22112, -0.5994442, 1.112509, 1, 0, 0.5882353, 1,
1.238612, 0.8000438, 0.2873189, 1, 0, 0.5803922, 1,
1.244911, 0.4984947, 1.812692, 1, 0, 0.5764706, 1,
1.246561, -0.2324814, 1.296445, 1, 0, 0.5686275, 1,
1.250113, 0.9026624, 0.8880023, 1, 0, 0.5647059, 1,
1.258814, -2.015919, 2.702881, 1, 0, 0.5568628, 1,
1.269016, 0.1875704, 3.170866, 1, 0, 0.5529412, 1,
1.271323, -0.08863041, 0.2435996, 1, 0, 0.5450981, 1,
1.282977, 0.2298446, 1.647918, 1, 0, 0.5411765, 1,
1.284252, -1.091248, 3.6159, 1, 0, 0.5333334, 1,
1.291964, 0.4396056, 0.5233904, 1, 0, 0.5294118, 1,
1.302327, -0.2177564, 1.460786, 1, 0, 0.5215687, 1,
1.315655, -1.014029, 1.618122, 1, 0, 0.5176471, 1,
1.319853, -0.2107845, 1.82913, 1, 0, 0.509804, 1,
1.326209, -2.250268, 3.254319, 1, 0, 0.5058824, 1,
1.330917, -1.42987, 2.18403, 1, 0, 0.4980392, 1,
1.334245, 1.325381, -0.3463157, 1, 0, 0.4901961, 1,
1.345953, 0.5866907, 0.4146794, 1, 0, 0.4862745, 1,
1.351434, 0.1712364, 1.523212, 1, 0, 0.4784314, 1,
1.381904, 1.983898, -1.432651, 1, 0, 0.4745098, 1,
1.381982, -0.5361631, 2.347136, 1, 0, 0.4666667, 1,
1.409061, 0.5275835, 3.117782, 1, 0, 0.4627451, 1,
1.414955, 0.02934851, 1.612691, 1, 0, 0.454902, 1,
1.425044, 0.4179164, 1.381453, 1, 0, 0.4509804, 1,
1.428002, 0.2575084, 2.17439, 1, 0, 0.4431373, 1,
1.432261, 0.5664978, -0.5646607, 1, 0, 0.4392157, 1,
1.447295, -0.2355966, 4.331807, 1, 0, 0.4313726, 1,
1.454096, 0.4837185, 1.537602, 1, 0, 0.427451, 1,
1.459381, -1.00328, -0.07980583, 1, 0, 0.4196078, 1,
1.462991, -0.3897881, 0.4380122, 1, 0, 0.4156863, 1,
1.463264, 0.899985, 0.9635242, 1, 0, 0.4078431, 1,
1.463312, 1.568233, 0.1490574, 1, 0, 0.4039216, 1,
1.469356, 1.100062, -0.7654612, 1, 0, 0.3960784, 1,
1.483097, 0.2517502, 0.8513449, 1, 0, 0.3882353, 1,
1.492668, -0.3807169, 1.565209, 1, 0, 0.3843137, 1,
1.510774, -1.150189, 1.353527, 1, 0, 0.3764706, 1,
1.513322, 0.5428395, 1.574194, 1, 0, 0.372549, 1,
1.522181, 1.163434, 2.80595, 1, 0, 0.3647059, 1,
1.530182, -1.08607, 2.9, 1, 0, 0.3607843, 1,
1.533806, 1.029032, 0.571753, 1, 0, 0.3529412, 1,
1.539986, -0.2836068, 2.730541, 1, 0, 0.3490196, 1,
1.54341, 1.585132, 0.3955369, 1, 0, 0.3411765, 1,
1.551117, 0.2177791, 0.8560573, 1, 0, 0.3372549, 1,
1.56205, -0.238184, 2.341842, 1, 0, 0.3294118, 1,
1.577952, -0.763069, 3.269215, 1, 0, 0.3254902, 1,
1.584495, 1.172946, -0.3242296, 1, 0, 0.3176471, 1,
1.589523, -0.9275565, 3.102229, 1, 0, 0.3137255, 1,
1.609951, -1.712149, 2.492295, 1, 0, 0.3058824, 1,
1.632119, 0.535631, -1.636707, 1, 0, 0.2980392, 1,
1.632712, 0.195267, 3.000308, 1, 0, 0.2941177, 1,
1.64022, -0.5120609, 3.100485, 1, 0, 0.2862745, 1,
1.657206, -0.7958785, 0.8274105, 1, 0, 0.282353, 1,
1.675926, -1.432588, 1.741514, 1, 0, 0.2745098, 1,
1.69151, -0.2484309, -0.1864199, 1, 0, 0.2705882, 1,
1.718861, 0.4835701, 2.496412, 1, 0, 0.2627451, 1,
1.730161, -0.5441681, 2.254638, 1, 0, 0.2588235, 1,
1.74489, 0.6016532, 0.4333282, 1, 0, 0.2509804, 1,
1.755746, 0.2586851, 1.329454, 1, 0, 0.2470588, 1,
1.757617, 1.095174, -0.7913553, 1, 0, 0.2392157, 1,
1.766401, -1.487183, 3.771457, 1, 0, 0.2352941, 1,
1.774028, -1.607502, 3.081146, 1, 0, 0.227451, 1,
1.780462, -0.02466556, 1.228861, 1, 0, 0.2235294, 1,
1.783362, 1.216205, 0.4169651, 1, 0, 0.2156863, 1,
1.793711, 1.871983, 0.3262184, 1, 0, 0.2117647, 1,
1.80202, 0.7145085, 0.7036143, 1, 0, 0.2039216, 1,
1.810525, -1.113195, 2.442245, 1, 0, 0.1960784, 1,
1.810685, -1.229488, 3.734452, 1, 0, 0.1921569, 1,
1.833046, -0.5099972, 2.279644, 1, 0, 0.1843137, 1,
1.865592, -0.5013924, 2.69919, 1, 0, 0.1803922, 1,
1.892361, 0.9625213, 1.560929, 1, 0, 0.172549, 1,
1.898267, -0.8986022, 2.683171, 1, 0, 0.1686275, 1,
1.901292, 1.272689, 1.535878, 1, 0, 0.1607843, 1,
1.915101, -2.560563, 2.135098, 1, 0, 0.1568628, 1,
1.916247, -0.4740371, 3.016822, 1, 0, 0.1490196, 1,
1.925731, 1.45216, 0.424115, 1, 0, 0.145098, 1,
1.963041, 0.3583766, 0.6221586, 1, 0, 0.1372549, 1,
1.975196, 1.764234, 1.432901, 1, 0, 0.1333333, 1,
2.000503, 1.022706, 0.4847754, 1, 0, 0.1254902, 1,
2.039723, 1.148594, -0.2002077, 1, 0, 0.1215686, 1,
2.043635, -1.246858, 0.9124823, 1, 0, 0.1137255, 1,
2.055728, -0.7552342, 2.237452, 1, 0, 0.1098039, 1,
2.090036, -0.422744, 1.999417, 1, 0, 0.1019608, 1,
2.090769, -1.219226, 1.473978, 1, 0, 0.09411765, 1,
2.09685, 0.2935057, 1.128799, 1, 0, 0.09019608, 1,
2.099904, -0.0279091, 2.28461, 1, 0, 0.08235294, 1,
2.144274, -0.4322746, 2.88899, 1, 0, 0.07843138, 1,
2.149066, -1.410713, 3.323215, 1, 0, 0.07058824, 1,
2.213164, -0.7187079, 2.780116, 1, 0, 0.06666667, 1,
2.228581, -0.1852713, 1.931196, 1, 0, 0.05882353, 1,
2.240844, -0.6034767, 1.78115, 1, 0, 0.05490196, 1,
2.259443, 0.9471979, 2.369787, 1, 0, 0.04705882, 1,
2.28299, -2.445962, 2.573568, 1, 0, 0.04313726, 1,
2.446464, 0.6676382, 2.577314, 1, 0, 0.03529412, 1,
2.489861, -0.7839789, 2.89199, 1, 0, 0.03137255, 1,
2.869979, 0.5208922, 0.5653772, 1, 0, 0.02352941, 1,
2.885813, 0.5335718, 0.8770634, 1, 0, 0.01960784, 1,
2.976175, -0.7538824, 1.55255, 1, 0, 0.01176471, 1,
3.218062, 0.271962, -0.02565579, 1, 0, 0.007843138, 1
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
0.3072627, -4.071585, -6.812804, 0, -0.5, 0.5, 0.5,
0.3072627, -4.071585, -6.812804, 1, -0.5, 0.5, 0.5,
0.3072627, -4.071585, -6.812804, 1, 1.5, 0.5, 0.5,
0.3072627, -4.071585, -6.812804, 0, 1.5, 0.5, 0.5
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
-3.590298, -0.1712607, -6.812804, 0, -0.5, 0.5, 0.5,
-3.590298, -0.1712607, -6.812804, 1, -0.5, 0.5, 0.5,
-3.590298, -0.1712607, -6.812804, 1, 1.5, 0.5, 0.5,
-3.590298, -0.1712607, -6.812804, 0, 1.5, 0.5, 0.5
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
-3.590298, -4.071585, 0.04771996, 0, -0.5, 0.5, 0.5,
-3.590298, -4.071585, 0.04771996, 1, -0.5, 0.5, 0.5,
-3.590298, -4.071585, 0.04771996, 1, 1.5, 0.5, 0.5,
-3.590298, -4.071585, 0.04771996, 0, 1.5, 0.5, 0.5
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
-2, -3.17151, -5.229606,
3, -3.17151, -5.229606,
-2, -3.17151, -5.229606,
-2, -3.321523, -5.493473,
-1, -3.17151, -5.229606,
-1, -3.321523, -5.493473,
0, -3.17151, -5.229606,
0, -3.321523, -5.493473,
1, -3.17151, -5.229606,
1, -3.321523, -5.493473,
2, -3.17151, -5.229606,
2, -3.321523, -5.493473,
3, -3.17151, -5.229606,
3, -3.321523, -5.493473
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
-2, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
-2, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
-2, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
-2, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5,
-1, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
-1, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
-1, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
-1, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5,
0, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
0, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
0, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
0, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5,
1, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
1, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
1, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
1, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5,
2, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
2, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
2, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
2, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5,
3, -3.621548, -6.021205, 0, -0.5, 0.5, 0.5,
3, -3.621548, -6.021205, 1, -0.5, 0.5, 0.5,
3, -3.621548, -6.021205, 1, 1.5, 0.5, 0.5,
3, -3.621548, -6.021205, 0, 1.5, 0.5, 0.5
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
-2.690861, -3, -5.229606,
-2.690861, 2, -5.229606,
-2.690861, -3, -5.229606,
-2.840767, -3, -5.493473,
-2.690861, -2, -5.229606,
-2.840767, -2, -5.493473,
-2.690861, -1, -5.229606,
-2.840767, -1, -5.493473,
-2.690861, 0, -5.229606,
-2.840767, 0, -5.493473,
-2.690861, 1, -5.229606,
-2.840767, 1, -5.493473,
-2.690861, 2, -5.229606,
-2.840767, 2, -5.493473
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
-3.14058, -3, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, -3, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, -3, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, -3, -6.021205, 0, 1.5, 0.5, 0.5,
-3.14058, -2, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, -2, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, -2, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, -2, -6.021205, 0, 1.5, 0.5, 0.5,
-3.14058, -1, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, -1, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, -1, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, -1, -6.021205, 0, 1.5, 0.5, 0.5,
-3.14058, 0, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, 0, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, 0, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, 0, -6.021205, 0, 1.5, 0.5, 0.5,
-3.14058, 1, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, 1, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, 1, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, 1, -6.021205, 0, 1.5, 0.5, 0.5,
-3.14058, 2, -6.021205, 0, -0.5, 0.5, 0.5,
-3.14058, 2, -6.021205, 1, -0.5, 0.5, 0.5,
-3.14058, 2, -6.021205, 1, 1.5, 0.5, 0.5,
-3.14058, 2, -6.021205, 0, 1.5, 0.5, 0.5
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
-2.690861, -3.17151, -4,
-2.690861, -3.17151, 4,
-2.690861, -3.17151, -4,
-2.840767, -3.321523, -4,
-2.690861, -3.17151, -2,
-2.840767, -3.321523, -2,
-2.690861, -3.17151, 0,
-2.840767, -3.321523, 0,
-2.690861, -3.17151, 2,
-2.840767, -3.321523, 2,
-2.690861, -3.17151, 4,
-2.840767, -3.321523, 4
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
-3.14058, -3.621548, -4, 0, -0.5, 0.5, 0.5,
-3.14058, -3.621548, -4, 1, -0.5, 0.5, 0.5,
-3.14058, -3.621548, -4, 1, 1.5, 0.5, 0.5,
-3.14058, -3.621548, -4, 0, 1.5, 0.5, 0.5,
-3.14058, -3.621548, -2, 0, -0.5, 0.5, 0.5,
-3.14058, -3.621548, -2, 1, -0.5, 0.5, 0.5,
-3.14058, -3.621548, -2, 1, 1.5, 0.5, 0.5,
-3.14058, -3.621548, -2, 0, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 0, 0, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 0, 1, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 0, 1, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 0, 0, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 2, 0, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 2, 1, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 2, 1, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 2, 0, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 4, 0, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 4, 1, -0.5, 0.5, 0.5,
-3.14058, -3.621548, 4, 1, 1.5, 0.5, 0.5,
-3.14058, -3.621548, 4, 0, 1.5, 0.5, 0.5
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
-2.690861, -3.17151, -5.229606,
-2.690861, 2.828989, -5.229606,
-2.690861, -3.17151, 5.325046,
-2.690861, 2.828989, 5.325046,
-2.690861, -3.17151, -5.229606,
-2.690861, -3.17151, 5.325046,
-2.690861, 2.828989, -5.229606,
-2.690861, 2.828989, 5.325046,
-2.690861, -3.17151, -5.229606,
3.305386, -3.17151, -5.229606,
-2.690861, -3.17151, 5.325046,
3.305386, -3.17151, 5.325046,
-2.690861, 2.828989, -5.229606,
3.305386, 2.828989, -5.229606,
-2.690861, 2.828989, 5.325046,
3.305386, 2.828989, 5.325046,
3.305386, -3.17151, -5.229606,
3.305386, 2.828989, -5.229606,
3.305386, -3.17151, 5.325046,
3.305386, 2.828989, 5.325046,
3.305386, -3.17151, -5.229606,
3.305386, -3.17151, 5.325046,
3.305386, 2.828989, -5.229606,
3.305386, 2.828989, 5.325046
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
var radius = 7.23069;
var distance = 32.17015;
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
mvMatrix.translate( -0.3072627, 0.1712607, -0.04771996 );
mvMatrix.scale( 1.303809, 1.302886, 0.7407125 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.17015);
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


