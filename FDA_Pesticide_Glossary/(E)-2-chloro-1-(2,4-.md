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
-3.775906, 0.5170925, -1.108833, 1, 0, 0, 1,
-3.66448, -0.2543044, -0.7636208, 1, 0.007843138, 0, 1,
-3.549669, -0.9904745, -2.684355, 1, 0.01176471, 0, 1,
-3.168328, -1.971966, -0.3006946, 1, 0.01960784, 0, 1,
-2.973231, -1.872136, -2.326388, 1, 0.02352941, 0, 1,
-2.787439, -0.2618544, -1.376247, 1, 0.03137255, 0, 1,
-2.761624, 1.28715, -1.225762, 1, 0.03529412, 0, 1,
-2.54022, 0.4780979, -1.251421, 1, 0.04313726, 0, 1,
-2.540196, -1.951317, -3.031573, 1, 0.04705882, 0, 1,
-2.461235, -0.1846595, -1.436006, 1, 0.05490196, 0, 1,
-2.426927, -0.05308142, -2.146667, 1, 0.05882353, 0, 1,
-2.315101, 1.618865, 0.5393654, 1, 0.06666667, 0, 1,
-2.313944, -0.8411932, -2.152693, 1, 0.07058824, 0, 1,
-2.308944, -0.5989515, -1.576452, 1, 0.07843138, 0, 1,
-2.280077, 1.032015, -1.576434, 1, 0.08235294, 0, 1,
-2.266971, -1.702606, -0.9829859, 1, 0.09019608, 0, 1,
-2.261004, 1.434407, -2.305669, 1, 0.09411765, 0, 1,
-2.228873, -0.2547679, -0.9754108, 1, 0.1019608, 0, 1,
-2.213073, 0.580319, -1.991017, 1, 0.1098039, 0, 1,
-2.178622, 0.3305371, -2.846142, 1, 0.1137255, 0, 1,
-2.097438, -0.8034566, -1.483872, 1, 0.1215686, 0, 1,
-2.081952, 0.1253649, -0.9812407, 1, 0.1254902, 0, 1,
-2.068316, -0.9858529, -0.2736317, 1, 0.1333333, 0, 1,
-2.039894, 0.2776381, -0.4151952, 1, 0.1372549, 0, 1,
-2.036868, -0.4182809, -0.5956917, 1, 0.145098, 0, 1,
-2.025337, 0.6698065, -1.604505, 1, 0.1490196, 0, 1,
-2.012394, -0.06053117, -1.141527, 1, 0.1568628, 0, 1,
-1.999383, -0.2477315, -1.66336, 1, 0.1607843, 0, 1,
-1.988836, 0.5085673, -0.4284105, 1, 0.1686275, 0, 1,
-1.949296, -0.9825792, -3.435073, 1, 0.172549, 0, 1,
-1.919252, -0.7992617, -1.592077, 1, 0.1803922, 0, 1,
-1.909762, -1.872605, -1.801339, 1, 0.1843137, 0, 1,
-1.89569, -1.826309, -1.633959, 1, 0.1921569, 0, 1,
-1.875294, -1.341147, -2.441134, 1, 0.1960784, 0, 1,
-1.824203, -0.4305655, -1.324043, 1, 0.2039216, 0, 1,
-1.802404, 0.2595604, -0.7308125, 1, 0.2117647, 0, 1,
-1.795266, 0.9537122, -0.9542257, 1, 0.2156863, 0, 1,
-1.779742, 0.4848292, -0.6982177, 1, 0.2235294, 0, 1,
-1.776527, -0.2399498, -2.202887, 1, 0.227451, 0, 1,
-1.773486, -0.7934752, -0.7051795, 1, 0.2352941, 0, 1,
-1.771694, -1.65239, -3.505808, 1, 0.2392157, 0, 1,
-1.758846, -0.1452102, -1.255995, 1, 0.2470588, 0, 1,
-1.746, 0.1186326, -3.255124, 1, 0.2509804, 0, 1,
-1.743085, -1.498894, -3.238709, 1, 0.2588235, 0, 1,
-1.731285, -1.510472, -2.444274, 1, 0.2627451, 0, 1,
-1.723901, -0.9489487, -0.7272868, 1, 0.2705882, 0, 1,
-1.713377, 0.6522541, -1.269781, 1, 0.2745098, 0, 1,
-1.70926, -0.5556041, -2.418922, 1, 0.282353, 0, 1,
-1.707429, -0.1881158, -1.362026, 1, 0.2862745, 0, 1,
-1.69011, 1.873851, -1.816978, 1, 0.2941177, 0, 1,
-1.667025, -0.06693602, -1.210691, 1, 0.3019608, 0, 1,
-1.651969, -0.5633804, -0.1223554, 1, 0.3058824, 0, 1,
-1.650942, -0.2438203, -1.505111, 1, 0.3137255, 0, 1,
-1.62252, 0.6444014, -1.369804, 1, 0.3176471, 0, 1,
-1.611145, -1.140256, -2.844661, 1, 0.3254902, 0, 1,
-1.592773, 2.261303, -0.1043271, 1, 0.3294118, 0, 1,
-1.586875, 0.03738543, -1.259929, 1, 0.3372549, 0, 1,
-1.579533, 0.7987236, 1.139471, 1, 0.3411765, 0, 1,
-1.561724, -0.4933124, -1.226651, 1, 0.3490196, 0, 1,
-1.543335, 1.053509, -0.8438758, 1, 0.3529412, 0, 1,
-1.539561, -0.06087641, -1.381079, 1, 0.3607843, 0, 1,
-1.537947, -0.9183394, -1.599962, 1, 0.3647059, 0, 1,
-1.523502, 0.1552763, -1.635484, 1, 0.372549, 0, 1,
-1.505421, 1.446605, 0.7508836, 1, 0.3764706, 0, 1,
-1.490607, 1.345344, 0.5443645, 1, 0.3843137, 0, 1,
-1.486628, -0.009520249, -2.11402, 1, 0.3882353, 0, 1,
-1.482633, 2.10224, -0.3638704, 1, 0.3960784, 0, 1,
-1.482196, 0.8345435, -0.5015146, 1, 0.4039216, 0, 1,
-1.480098, 0.4538031, -1.805321, 1, 0.4078431, 0, 1,
-1.47348, 0.5075895, -0.3090796, 1, 0.4156863, 0, 1,
-1.465351, -0.9241149, -2.575366, 1, 0.4196078, 0, 1,
-1.463469, -1.895014, -3.047273, 1, 0.427451, 0, 1,
-1.459786, -0.6829173, -2.652597, 1, 0.4313726, 0, 1,
-1.451155, -0.3908489, -2.424383, 1, 0.4392157, 0, 1,
-1.449391, -0.34186, -0.3573694, 1, 0.4431373, 0, 1,
-1.446056, 0.8326803, -2.436744, 1, 0.4509804, 0, 1,
-1.443161, 0.1729981, -1.099793, 1, 0.454902, 0, 1,
-1.442566, 1.428486, -0.8001034, 1, 0.4627451, 0, 1,
-1.436059, -0.7529574, -2.685145, 1, 0.4666667, 0, 1,
-1.433923, 0.7933555, -2.254117, 1, 0.4745098, 0, 1,
-1.427194, 1.410533, -0.2797202, 1, 0.4784314, 0, 1,
-1.418505, -0.5250933, -1.563091, 1, 0.4862745, 0, 1,
-1.403799, 0.3924984, -0.9841178, 1, 0.4901961, 0, 1,
-1.403397, 0.7503197, -1.05518, 1, 0.4980392, 0, 1,
-1.39104, 0.6637577, 0.2706739, 1, 0.5058824, 0, 1,
-1.390461, 0.5811464, -0.3120619, 1, 0.509804, 0, 1,
-1.382306, 0.4025997, -2.200119, 1, 0.5176471, 0, 1,
-1.367255, 2.001027, -0.7843674, 1, 0.5215687, 0, 1,
-1.361509, 0.07405382, -2.431175, 1, 0.5294118, 0, 1,
-1.347862, 0.09863155, 0.0277325, 1, 0.5333334, 0, 1,
-1.34279, -1.631155, -2.295684, 1, 0.5411765, 0, 1,
-1.339233, 0.2178685, -1.159454, 1, 0.5450981, 0, 1,
-1.333189, 0.9531304, -1.212443, 1, 0.5529412, 0, 1,
-1.326307, -1.042226, -4.418094, 1, 0.5568628, 0, 1,
-1.326301, 0.6044791, -0.9866636, 1, 0.5647059, 0, 1,
-1.319235, -0.2701958, -1.105529, 1, 0.5686275, 0, 1,
-1.317296, 0.9089133, -0.4413505, 1, 0.5764706, 0, 1,
-1.315354, 0.7796273, -1.169706, 1, 0.5803922, 0, 1,
-1.314176, -1.618631, -1.650496, 1, 0.5882353, 0, 1,
-1.302411, 1.29395, -0.8843868, 1, 0.5921569, 0, 1,
-1.296605, -0.9798409, -2.140316, 1, 0.6, 0, 1,
-1.293574, -1.332251, -3.434781, 1, 0.6078432, 0, 1,
-1.29222, -1.062738, -2.76658, 1, 0.6117647, 0, 1,
-1.287872, 3.116277, -0.6977174, 1, 0.6196079, 0, 1,
-1.277238, 0.346561, -0.5557875, 1, 0.6235294, 0, 1,
-1.274134, -0.0740013, -4.085883, 1, 0.6313726, 0, 1,
-1.27084, -0.8275099, -1.732584, 1, 0.6352941, 0, 1,
-1.266292, -0.8784041, -2.835982, 1, 0.6431373, 0, 1,
-1.262623, -1.725505, -2.788345, 1, 0.6470588, 0, 1,
-1.239797, 0.9061491, -0.9578857, 1, 0.654902, 0, 1,
-1.237347, 0.5679866, 0.7331141, 1, 0.6588235, 0, 1,
-1.22544, -0.7763095, -0.8905229, 1, 0.6666667, 0, 1,
-1.22276, 0.5861498, -0.8283025, 1, 0.6705883, 0, 1,
-1.21907, 2.076307, -0.4868865, 1, 0.6784314, 0, 1,
-1.209656, 0.8930897, -1.257585, 1, 0.682353, 0, 1,
-1.20495, 0.6713067, 0.04218823, 1, 0.6901961, 0, 1,
-1.195121, 1.832345, 0.6945568, 1, 0.6941177, 0, 1,
-1.189222, 0.4177884, -1.306413, 1, 0.7019608, 0, 1,
-1.188952, -1.694735, -1.891601, 1, 0.7098039, 0, 1,
-1.184321, 0.9666091, -1.419046, 1, 0.7137255, 0, 1,
-1.181204, 0.07739484, 0.5400158, 1, 0.7215686, 0, 1,
-1.175549, -0.6025214, -1.174989, 1, 0.7254902, 0, 1,
-1.175501, 0.5246215, -0.8064258, 1, 0.7333333, 0, 1,
-1.163936, -0.0996207, -0.4803546, 1, 0.7372549, 0, 1,
-1.151962, 0.3337451, -2.30277, 1, 0.7450981, 0, 1,
-1.145445, -0.4992929, -4.753663, 1, 0.7490196, 0, 1,
-1.136374, -1.000504, -3.167886, 1, 0.7568628, 0, 1,
-1.133508, -0.7837938, -1.967742, 1, 0.7607843, 0, 1,
-1.132533, 1.176383, 0.1024644, 1, 0.7686275, 0, 1,
-1.122179, 0.3529743, -1.813242, 1, 0.772549, 0, 1,
-1.119075, -0.9188778, -2.753918, 1, 0.7803922, 0, 1,
-1.118739, 0.3279971, 0.5624432, 1, 0.7843137, 0, 1,
-1.114424, 0.369001, -1.329774, 1, 0.7921569, 0, 1,
-1.112326, 1.801162, -1.38595, 1, 0.7960784, 0, 1,
-1.109158, -0.08715681, -1.386578, 1, 0.8039216, 0, 1,
-1.103705, 1.563007, -1.323055, 1, 0.8117647, 0, 1,
-1.102719, 1.241296, -0.9810587, 1, 0.8156863, 0, 1,
-1.101246, 0.2823878, -1.568484, 1, 0.8235294, 0, 1,
-1.098531, 0.4724228, -1.334833, 1, 0.827451, 0, 1,
-1.092591, 1.519987, -0.1075776, 1, 0.8352941, 0, 1,
-1.091158, 0.3413004, -0.6979508, 1, 0.8392157, 0, 1,
-1.087187, -0.5550798, -1.187752, 1, 0.8470588, 0, 1,
-1.075918, 0.8289232, -0.7919729, 1, 0.8509804, 0, 1,
-1.070484, 1.702678, -1.465026, 1, 0.8588235, 0, 1,
-1.05671, 0.09794758, -0.9509746, 1, 0.8627451, 0, 1,
-1.049974, -0.9281107, -3.122399, 1, 0.8705882, 0, 1,
-1.046936, 0.9939648, -0.05830183, 1, 0.8745098, 0, 1,
-1.038406, 0.3368611, -0.05799299, 1, 0.8823529, 0, 1,
-1.037775, 2.253728, 0.07844479, 1, 0.8862745, 0, 1,
-1.035786, 0.02203801, -1.228693, 1, 0.8941177, 0, 1,
-1.030573, 0.6440319, -1.815655, 1, 0.8980392, 0, 1,
-1.026478, 1.775306, 0.6010091, 1, 0.9058824, 0, 1,
-1.019692, 0.1624423, -0.06198192, 1, 0.9137255, 0, 1,
-1.018568, 0.2008538, -0.7798881, 1, 0.9176471, 0, 1,
-1.017104, -0.0548149, -2.615747, 1, 0.9254902, 0, 1,
-1.009542, 1.476207, -0.4024534, 1, 0.9294118, 0, 1,
-1.003972, -1.696634, -3.22403, 1, 0.9372549, 0, 1,
-1.003293, -0.6490396, -4.765608, 1, 0.9411765, 0, 1,
-0.9994336, -1.812126, -2.057656, 1, 0.9490196, 0, 1,
-0.9990945, 0.6043776, -0.431551, 1, 0.9529412, 0, 1,
-0.9942562, -0.3684461, -1.46042, 1, 0.9607843, 0, 1,
-0.9929808, -0.5842069, -2.546335, 1, 0.9647059, 0, 1,
-0.9925265, -1.195745, -3.014771, 1, 0.972549, 0, 1,
-0.9884358, 0.7009873, 0.5097113, 1, 0.9764706, 0, 1,
-0.9855003, -0.656785, -3.037856, 1, 0.9843137, 0, 1,
-0.9840492, -0.02542894, -1.660991, 1, 0.9882353, 0, 1,
-0.9787623, 0.3537883, -2.449337, 1, 0.9960784, 0, 1,
-0.9694482, -0.4852001, -1.564878, 0.9960784, 1, 0, 1,
-0.9683249, 0.9785638, -0.4156267, 0.9921569, 1, 0, 1,
-0.9668444, -2.569116, -3.100766, 0.9843137, 1, 0, 1,
-0.9550454, -2.039606, -2.351017, 0.9803922, 1, 0, 1,
-0.9542829, -0.3387035, -2.10245, 0.972549, 1, 0, 1,
-0.9519612, 0.2240809, -1.076169, 0.9686275, 1, 0, 1,
-0.9505538, -1.177402, -3.217279, 0.9607843, 1, 0, 1,
-0.9493856, 2.010107, 0.6871106, 0.9568627, 1, 0, 1,
-0.9445544, 0.7877889, -1.700053, 0.9490196, 1, 0, 1,
-0.9405289, 1.045292, -0.906569, 0.945098, 1, 0, 1,
-0.936409, -0.6408785, -1.601374, 0.9372549, 1, 0, 1,
-0.9358335, -0.1918151, -1.692691, 0.9333333, 1, 0, 1,
-0.9241012, 0.9064845, 0.6839492, 0.9254902, 1, 0, 1,
-0.9207428, -0.2652886, -3.583335, 0.9215686, 1, 0, 1,
-0.9180515, -0.6179535, -1.809109, 0.9137255, 1, 0, 1,
-0.9147089, 2.285743, 1.501345, 0.9098039, 1, 0, 1,
-0.9137635, 0.6616222, -0.6462098, 0.9019608, 1, 0, 1,
-0.9107319, -0.229584, -1.979316, 0.8941177, 1, 0, 1,
-0.8988985, -1.480263, -2.495442, 0.8901961, 1, 0, 1,
-0.8941506, -0.2930143, -1.116945, 0.8823529, 1, 0, 1,
-0.8776927, -0.9378275, -3.423288, 0.8784314, 1, 0, 1,
-0.8760611, -0.5580737, -1.581876, 0.8705882, 1, 0, 1,
-0.8740915, 0.4351507, -2.205024, 0.8666667, 1, 0, 1,
-0.8729815, 0.0851834, 0.1092957, 0.8588235, 1, 0, 1,
-0.8708537, 0.9758515, -0.3019271, 0.854902, 1, 0, 1,
-0.8672318, 0.3848609, -0.8251241, 0.8470588, 1, 0, 1,
-0.8671504, 1.174539, -0.4701194, 0.8431373, 1, 0, 1,
-0.8606515, -0.4819726, -2.13966, 0.8352941, 1, 0, 1,
-0.8600371, -0.6257827, -2.068086, 0.8313726, 1, 0, 1,
-0.8563135, 1.143136, 0.7481578, 0.8235294, 1, 0, 1,
-0.8554534, -0.01482465, -2.120302, 0.8196079, 1, 0, 1,
-0.8552351, 1.090817, -2.141135, 0.8117647, 1, 0, 1,
-0.8469174, -0.1169407, -1.48984, 0.8078431, 1, 0, 1,
-0.8456333, 0.964869, 0.3709925, 0.8, 1, 0, 1,
-0.8401065, -0.03018088, -0.01205356, 0.7921569, 1, 0, 1,
-0.8244832, 1.005527, -2.132123, 0.7882353, 1, 0, 1,
-0.8219053, 0.2185671, 0.7212915, 0.7803922, 1, 0, 1,
-0.8201154, -1.431636, -3.581116, 0.7764706, 1, 0, 1,
-0.8193865, -0.5718448, -2.305501, 0.7686275, 1, 0, 1,
-0.8191214, 0.8450121, 0.6062005, 0.7647059, 1, 0, 1,
-0.8190711, -0.7380725, -0.6728905, 0.7568628, 1, 0, 1,
-0.8064928, 0.1560655, -2.230764, 0.7529412, 1, 0, 1,
-0.7996515, -1.624079, -1.579833, 0.7450981, 1, 0, 1,
-0.7988476, -1.141718, -3.093845, 0.7411765, 1, 0, 1,
-0.7940434, -0.09079345, -2.084692, 0.7333333, 1, 0, 1,
-0.7914978, -1.217538, -2.435484, 0.7294118, 1, 0, 1,
-0.7865425, 1.868041, -0.1069828, 0.7215686, 1, 0, 1,
-0.7852652, -0.563643, -0.02630705, 0.7176471, 1, 0, 1,
-0.7806535, -0.6495537, -1.303222, 0.7098039, 1, 0, 1,
-0.7776571, -0.257212, -0.7629296, 0.7058824, 1, 0, 1,
-0.7685452, 0.3789252, -0.121757, 0.6980392, 1, 0, 1,
-0.7655671, -2.227916, -2.339675, 0.6901961, 1, 0, 1,
-0.7643626, -1.947655, -2.819982, 0.6862745, 1, 0, 1,
-0.7641705, -0.428399, -1.326401, 0.6784314, 1, 0, 1,
-0.761216, 1.497395, 0.3686547, 0.6745098, 1, 0, 1,
-0.7556419, -0.5572566, -1.877017, 0.6666667, 1, 0, 1,
-0.7540687, -0.4219146, -4.119558, 0.6627451, 1, 0, 1,
-0.7522567, 0.6816393, -2.494261, 0.654902, 1, 0, 1,
-0.7521865, -1.823472, -1.469429, 0.6509804, 1, 0, 1,
-0.7498692, 0.06352374, -1.214627, 0.6431373, 1, 0, 1,
-0.7457045, -0.03506536, -0.5072303, 0.6392157, 1, 0, 1,
-0.7440642, 0.2316657, -1.518505, 0.6313726, 1, 0, 1,
-0.7399889, -0.05775546, -1.153766, 0.627451, 1, 0, 1,
-0.7362692, -1.684464, -3.168098, 0.6196079, 1, 0, 1,
-0.7271965, -0.4638834, -1.331887, 0.6156863, 1, 0, 1,
-0.7261913, 1.414887, -2.004062, 0.6078432, 1, 0, 1,
-0.7227859, -0.461323, -1.57316, 0.6039216, 1, 0, 1,
-0.7226294, -0.5558108, -0.9702069, 0.5960785, 1, 0, 1,
-0.7187942, -0.9444759, -3.984116, 0.5882353, 1, 0, 1,
-0.7053355, -0.5401518, -0.5964595, 0.5843138, 1, 0, 1,
-0.7016187, -0.334213, -0.8220136, 0.5764706, 1, 0, 1,
-0.7011771, -0.4028389, -1.041427, 0.572549, 1, 0, 1,
-0.7005792, -1.660102, -2.55815, 0.5647059, 1, 0, 1,
-0.6936767, -0.7526741, -1.670797, 0.5607843, 1, 0, 1,
-0.6710613, -0.1303604, -2.589788, 0.5529412, 1, 0, 1,
-0.6703726, -1.936365, -4.198534, 0.5490196, 1, 0, 1,
-0.6676832, 0.2198931, -1.280732, 0.5411765, 1, 0, 1,
-0.66301, 2.440173, -0.3242652, 0.5372549, 1, 0, 1,
-0.6544448, -0.2046477, -1.923754, 0.5294118, 1, 0, 1,
-0.6540128, 1.52491, -1.763259, 0.5254902, 1, 0, 1,
-0.6520048, 0.3441547, -1.635905, 0.5176471, 1, 0, 1,
-0.6518303, -0.8710669, -2.497095, 0.5137255, 1, 0, 1,
-0.6477458, 0.3394473, -0.0001651416, 0.5058824, 1, 0, 1,
-0.6475774, 0.02337267, -1.628164, 0.5019608, 1, 0, 1,
-0.646312, -1.348825, -3.285495, 0.4941176, 1, 0, 1,
-0.6462513, 3.171513, -0.2703611, 0.4862745, 1, 0, 1,
-0.6433887, -0.4873082, -1.461793, 0.4823529, 1, 0, 1,
-0.6413743, 0.4396356, -0.7419727, 0.4745098, 1, 0, 1,
-0.6364094, -0.5118549, -0.01357568, 0.4705882, 1, 0, 1,
-0.6302869, 0.6443554, -1.139893, 0.4627451, 1, 0, 1,
-0.6287729, -0.4291988, -3.631139, 0.4588235, 1, 0, 1,
-0.6268231, 1.930202, -0.2920842, 0.4509804, 1, 0, 1,
-0.6232718, -1.030554, -2.040886, 0.4470588, 1, 0, 1,
-0.620563, -0.8531626, -2.433999, 0.4392157, 1, 0, 1,
-0.6193879, -1.146256, -1.190035, 0.4352941, 1, 0, 1,
-0.6192756, 2.108595, 0.123821, 0.427451, 1, 0, 1,
-0.6119573, -1.871483, -5.30284, 0.4235294, 1, 0, 1,
-0.6102935, -1.280627, -3.080303, 0.4156863, 1, 0, 1,
-0.6080369, -0.4196008, -1.664707, 0.4117647, 1, 0, 1,
-0.6063046, 0.9161214, -2.169309, 0.4039216, 1, 0, 1,
-0.6051696, 1.601457, 1.679321, 0.3960784, 1, 0, 1,
-0.6014473, 1.269114, -0.6507121, 0.3921569, 1, 0, 1,
-0.6000906, 0.468735, -1.870059, 0.3843137, 1, 0, 1,
-0.5988635, 0.8695296, -0.699388, 0.3803922, 1, 0, 1,
-0.5936076, -1.454874, -4.799744, 0.372549, 1, 0, 1,
-0.5916195, -0.07567433, -1.041423, 0.3686275, 1, 0, 1,
-0.5909539, -0.7941356, -2.754974, 0.3607843, 1, 0, 1,
-0.5886128, -0.7506954, -2.514148, 0.3568628, 1, 0, 1,
-0.5856152, -0.2511367, -1.103805, 0.3490196, 1, 0, 1,
-0.5826449, -1.66116, -3.915943, 0.345098, 1, 0, 1,
-0.5820181, 0.08842455, -0.07974625, 0.3372549, 1, 0, 1,
-0.5818277, -0.04270376, -1.504842, 0.3333333, 1, 0, 1,
-0.5799577, -0.5880874, -1.936173, 0.3254902, 1, 0, 1,
-0.579244, -1.562215, -1.288504, 0.3215686, 1, 0, 1,
-0.5768791, 1.012124, -1.381781, 0.3137255, 1, 0, 1,
-0.5767711, 1.02193, 0.4897068, 0.3098039, 1, 0, 1,
-0.5766896, 0.0669292, -2.614212, 0.3019608, 1, 0, 1,
-0.5752649, -0.09346512, -1.304441, 0.2941177, 1, 0, 1,
-0.5704041, 0.2203591, -0.6308072, 0.2901961, 1, 0, 1,
-0.5646253, 0.3745137, -1.439215, 0.282353, 1, 0, 1,
-0.5632696, -0.221028, -1.032979, 0.2784314, 1, 0, 1,
-0.558942, -1.944446, -3.853139, 0.2705882, 1, 0, 1,
-0.5571402, -0.3216667, -0.9761587, 0.2666667, 1, 0, 1,
-0.5567065, -1.219677, -1.999302, 0.2588235, 1, 0, 1,
-0.548386, -1.130326, -2.641151, 0.254902, 1, 0, 1,
-0.5451599, 0.9187902, -0.790607, 0.2470588, 1, 0, 1,
-0.5443977, 0.9998879, -0.8532861, 0.2431373, 1, 0, 1,
-0.5433406, -0.3694216, -3.84305, 0.2352941, 1, 0, 1,
-0.5414864, -0.0459516, -1.97095, 0.2313726, 1, 0, 1,
-0.5407785, -0.4826903, -3.260231, 0.2235294, 1, 0, 1,
-0.5356067, 0.6698108, -0.7771097, 0.2196078, 1, 0, 1,
-0.5311164, 0.6590584, -1.193421, 0.2117647, 1, 0, 1,
-0.5257778, 0.6870916, -0.4966117, 0.2078431, 1, 0, 1,
-0.5249146, 0.632866, -1.631939, 0.2, 1, 0, 1,
-0.5206448, 0.09587059, -2.087793, 0.1921569, 1, 0, 1,
-0.5196486, 0.03446357, 0.07052669, 0.1882353, 1, 0, 1,
-0.5179345, -0.2838278, -2.357559, 0.1803922, 1, 0, 1,
-0.5064272, 0.3315703, -0.403001, 0.1764706, 1, 0, 1,
-0.5034244, -1.381835, -4.512334, 0.1686275, 1, 0, 1,
-0.5017628, -0.3552845, -2.260388, 0.1647059, 1, 0, 1,
-0.4996871, -0.7044768, -1.779778, 0.1568628, 1, 0, 1,
-0.499299, -0.02837203, -2.439004, 0.1529412, 1, 0, 1,
-0.4992567, 0.5140918, -0.3859169, 0.145098, 1, 0, 1,
-0.4981014, -0.487999, -1.859044, 0.1411765, 1, 0, 1,
-0.4929, 1.23518, -0.6676574, 0.1333333, 1, 0, 1,
-0.4911795, 0.5015084, -1.683725, 0.1294118, 1, 0, 1,
-0.4881594, -0.5630029, -4.252897, 0.1215686, 1, 0, 1,
-0.4853857, -2.063993, -2.665094, 0.1176471, 1, 0, 1,
-0.4850864, 0.8758902, -1.200201, 0.1098039, 1, 0, 1,
-0.4792004, -0.4242584, -3.229107, 0.1058824, 1, 0, 1,
-0.4745035, 0.9743326, -0.09041277, 0.09803922, 1, 0, 1,
-0.4665161, -0.8245713, -3.05928, 0.09019608, 1, 0, 1,
-0.4663086, 1.069476, -0.7728278, 0.08627451, 1, 0, 1,
-0.4656247, -0.3876353, -0.8890822, 0.07843138, 1, 0, 1,
-0.4646066, -0.6252671, -2.099817, 0.07450981, 1, 0, 1,
-0.4636236, -0.1227993, -1.075504, 0.06666667, 1, 0, 1,
-0.4616344, -1.166382, -3.831985, 0.0627451, 1, 0, 1,
-0.4607192, -1.268126, -3.102571, 0.05490196, 1, 0, 1,
-0.4543077, -0.3555484, -3.078589, 0.05098039, 1, 0, 1,
-0.4501382, 0.6365261, 0.5468611, 0.04313726, 1, 0, 1,
-0.4497656, -0.8208139, -3.366751, 0.03921569, 1, 0, 1,
-0.4472106, 1.45483, -0.02334948, 0.03137255, 1, 0, 1,
-0.4451264, 1.974066, 0.7925768, 0.02745098, 1, 0, 1,
-0.43929, 0.5623282, 0.3371683, 0.01960784, 1, 0, 1,
-0.4372453, 2.088325, -1.009946, 0.01568628, 1, 0, 1,
-0.4359092, 0.3257423, 0.04676082, 0.007843138, 1, 0, 1,
-0.4320736, 0.4582996, 0.3528634, 0.003921569, 1, 0, 1,
-0.4313629, -0.9374921, -3.930242, 0, 1, 0.003921569, 1,
-0.4286241, 0.1954742, -0.2199603, 0, 1, 0.01176471, 1,
-0.4148086, -0.4066444, -2.878885, 0, 1, 0.01568628, 1,
-0.4056087, 1.043486, -2.244865, 0, 1, 0.02352941, 1,
-0.4034919, -1.000669, -2.590766, 0, 1, 0.02745098, 1,
-0.4013106, 1.194899, -1.362718, 0, 1, 0.03529412, 1,
-0.4000543, -0.5156072, -2.29187, 0, 1, 0.03921569, 1,
-0.3923242, 1.441551, -0.2452605, 0, 1, 0.04705882, 1,
-0.3920138, -0.7798355, -0.9013128, 0, 1, 0.05098039, 1,
-0.3881856, 0.2599339, -0.9269641, 0, 1, 0.05882353, 1,
-0.3873834, -0.1613643, -2.05088, 0, 1, 0.0627451, 1,
-0.3820291, -0.7131684, -1.843516, 0, 1, 0.07058824, 1,
-0.3818928, -0.1588837, -1.886442, 0, 1, 0.07450981, 1,
-0.3815708, 1.068634, -1.297209, 0, 1, 0.08235294, 1,
-0.3788829, -0.5465096, -2.916076, 0, 1, 0.08627451, 1,
-0.374326, 0.1435402, -0.1685029, 0, 1, 0.09411765, 1,
-0.369455, -0.4872744, -3.246767, 0, 1, 0.1019608, 1,
-0.3628555, 1.153452, -0.906276, 0, 1, 0.1058824, 1,
-0.3596487, 0.09397727, -2.386451, 0, 1, 0.1137255, 1,
-0.3570833, -1.762215, -2.532628, 0, 1, 0.1176471, 1,
-0.3569786, -0.8386952, -3.903352, 0, 1, 0.1254902, 1,
-0.3506951, -0.4870273, -2.536461, 0, 1, 0.1294118, 1,
-0.3489097, 0.2103972, -1.267098, 0, 1, 0.1372549, 1,
-0.3426565, -0.1091641, -1.006366, 0, 1, 0.1411765, 1,
-0.3393769, 1.435797, 0.6167215, 0, 1, 0.1490196, 1,
-0.3324406, 1.076846, -1.797737, 0, 1, 0.1529412, 1,
-0.3294744, -0.9538736, -1.915353, 0, 1, 0.1607843, 1,
-0.3281867, -0.3336364, -2.597798, 0, 1, 0.1647059, 1,
-0.3274756, -1.20736, -3.290473, 0, 1, 0.172549, 1,
-0.3267886, -0.6863843, -3.463, 0, 1, 0.1764706, 1,
-0.3263507, -0.2848253, -0.9226912, 0, 1, 0.1843137, 1,
-0.3215211, -0.2686243, -2.059646, 0, 1, 0.1882353, 1,
-0.3153274, 1.099674, -1.116046, 0, 1, 0.1960784, 1,
-0.3127869, -0.730471, -0.815969, 0, 1, 0.2039216, 1,
-0.3021711, -0.4805903, -3.567544, 0, 1, 0.2078431, 1,
-0.2986909, -1.123997, -3.355006, 0, 1, 0.2156863, 1,
-0.2904963, -1.774586, -2.767407, 0, 1, 0.2196078, 1,
-0.2899067, 0.02219808, 0.4584034, 0, 1, 0.227451, 1,
-0.2869965, 0.2864819, -0.828149, 0, 1, 0.2313726, 1,
-0.2857356, 0.4564287, -1.837109, 0, 1, 0.2392157, 1,
-0.2835738, -0.4635238, -2.354609, 0, 1, 0.2431373, 1,
-0.2819118, -0.9937103, -3.201688, 0, 1, 0.2509804, 1,
-0.2808126, 1.462361, 1.395894, 0, 1, 0.254902, 1,
-0.2773194, -1.270286, -3.116062, 0, 1, 0.2627451, 1,
-0.2746334, -0.9705495, -1.34524, 0, 1, 0.2666667, 1,
-0.2688, -0.1573794, -3.826715, 0, 1, 0.2745098, 1,
-0.2684189, 0.3840852, -0.1392944, 0, 1, 0.2784314, 1,
-0.2671737, -0.8821846, -3.655658, 0, 1, 0.2862745, 1,
-0.2634079, 0.1644492, -0.02738372, 0, 1, 0.2901961, 1,
-0.2625055, -1.143815, -1.805656, 0, 1, 0.2980392, 1,
-0.2565888, -0.1836973, -2.726158, 0, 1, 0.3058824, 1,
-0.2558393, 0.7582095, -1.062926, 0, 1, 0.3098039, 1,
-0.2524423, -0.694171, -0.9302702, 0, 1, 0.3176471, 1,
-0.2504638, -0.1521512, -2.548681, 0, 1, 0.3215686, 1,
-0.2501417, -0.03079646, -0.2827703, 0, 1, 0.3294118, 1,
-0.2439437, 1.015635, -1.328676, 0, 1, 0.3333333, 1,
-0.239507, -0.211099, -1.372253, 0, 1, 0.3411765, 1,
-0.2379294, 0.06260231, -2.724562, 0, 1, 0.345098, 1,
-0.2297439, 1.094754, -0.3497413, 0, 1, 0.3529412, 1,
-0.2270719, 0.07579966, -2.323743, 0, 1, 0.3568628, 1,
-0.2189653, -0.9539212, -2.269251, 0, 1, 0.3647059, 1,
-0.2166418, 1.775681, -0.8280553, 0, 1, 0.3686275, 1,
-0.2145886, -0.1659878, -3.892881, 0, 1, 0.3764706, 1,
-0.2142372, 0.771325, 0.1281462, 0, 1, 0.3803922, 1,
-0.213016, -2.309856, -1.199856, 0, 1, 0.3882353, 1,
-0.209858, -0.30804, -1.569518, 0, 1, 0.3921569, 1,
-0.2054613, -0.4455723, -3.190121, 0, 1, 0.4, 1,
-0.2038908, -0.0734245, -0.5304104, 0, 1, 0.4078431, 1,
-0.2035387, 0.7848973, -0.7320461, 0, 1, 0.4117647, 1,
-0.2034654, 1.323968, 0.2786119, 0, 1, 0.4196078, 1,
-0.2021061, 0.394975, -0.8178581, 0, 1, 0.4235294, 1,
-0.2007475, 0.5007815, 0.1508098, 0, 1, 0.4313726, 1,
-0.196577, 1.472971, -0.7650228, 0, 1, 0.4352941, 1,
-0.1920405, -1.017119, -3.288219, 0, 1, 0.4431373, 1,
-0.190492, 1.405933, 0.7915207, 0, 1, 0.4470588, 1,
-0.1900191, 0.07383104, 0.03484029, 0, 1, 0.454902, 1,
-0.1870736, 1.247185, -0.2138405, 0, 1, 0.4588235, 1,
-0.1858715, -1.09197, -3.382258, 0, 1, 0.4666667, 1,
-0.1801194, -0.3645687, -4.37186, 0, 1, 0.4705882, 1,
-0.1716134, -2.01887, -4.344956, 0, 1, 0.4784314, 1,
-0.1696148, -0.7709816, -3.599174, 0, 1, 0.4823529, 1,
-0.1689013, -0.278589, -2.793432, 0, 1, 0.4901961, 1,
-0.1564679, 0.6688397, -0.2518364, 0, 1, 0.4941176, 1,
-0.1541826, -0.2231147, -3.996534, 0, 1, 0.5019608, 1,
-0.1535473, -0.9028429, -1.242412, 0, 1, 0.509804, 1,
-0.1515501, 1.309885, -0.2902586, 0, 1, 0.5137255, 1,
-0.1483924, -1.596768, -3.456932, 0, 1, 0.5215687, 1,
-0.1381603, -0.4606186, -4.21286, 0, 1, 0.5254902, 1,
-0.1371598, 0.1928089, 1.461552, 0, 1, 0.5333334, 1,
-0.135435, -0.2459482, -2.023227, 0, 1, 0.5372549, 1,
-0.1332981, -0.9568686, -4.084649, 0, 1, 0.5450981, 1,
-0.1311693, 1.115827, 0.7773919, 0, 1, 0.5490196, 1,
-0.1304172, 0.129311, 1.003193, 0, 1, 0.5568628, 1,
-0.1280306, 0.2344308, 0.5536502, 0, 1, 0.5607843, 1,
-0.123511, 1.539055, 0.1092939, 0, 1, 0.5686275, 1,
-0.1225076, 0.6940542, -0.2806626, 0, 1, 0.572549, 1,
-0.1221771, -0.9011025, -2.900975, 0, 1, 0.5803922, 1,
-0.1149011, 1.52125, -0.2601661, 0, 1, 0.5843138, 1,
-0.1142729, -1.577917, -2.424449, 0, 1, 0.5921569, 1,
-0.1140659, -0.1446851, -3.15919, 0, 1, 0.5960785, 1,
-0.1140087, -1.138379, -2.373442, 0, 1, 0.6039216, 1,
-0.1112984, -2.128025, -2.408959, 0, 1, 0.6117647, 1,
-0.1071172, -0.4188226, -1.620867, 0, 1, 0.6156863, 1,
-0.1058946, -1.338099, -4.990554, 0, 1, 0.6235294, 1,
-0.1057123, -0.5963923, -3.218574, 0, 1, 0.627451, 1,
-0.1054483, 0.4175143, -0.3049639, 0, 1, 0.6352941, 1,
-0.1044475, 1.810078, 0.02175399, 0, 1, 0.6392157, 1,
-0.1016432, 1.293943, -0.3286953, 0, 1, 0.6470588, 1,
-0.09929886, 2.805017, -0.2074878, 0, 1, 0.6509804, 1,
-0.09828787, 3.206556, -0.7169062, 0, 1, 0.6588235, 1,
-0.09698265, 0.1983445, -0.9140126, 0, 1, 0.6627451, 1,
-0.0952577, -0.1963436, -3.410084, 0, 1, 0.6705883, 1,
-0.09124276, 0.5251615, -0.1759583, 0, 1, 0.6745098, 1,
-0.09072095, 0.5263523, 0.7118596, 0, 1, 0.682353, 1,
-0.08736296, 0.6421613, 0.8479491, 0, 1, 0.6862745, 1,
-0.08491129, 0.3674845, 0.7633567, 0, 1, 0.6941177, 1,
-0.08203408, 1.917758, -0.5299172, 0, 1, 0.7019608, 1,
-0.07741767, 0.6699766, 1.372783, 0, 1, 0.7058824, 1,
-0.07480187, 0.5197092, 0.4503526, 0, 1, 0.7137255, 1,
-0.07470674, -0.8385159, -3.025212, 0, 1, 0.7176471, 1,
-0.07425337, 1.403639, 0.1878908, 0, 1, 0.7254902, 1,
-0.07293022, 0.7582544, -0.8893511, 0, 1, 0.7294118, 1,
-0.06991897, 2.232745, 0.7679898, 0, 1, 0.7372549, 1,
-0.06933114, -1.179263, -3.005444, 0, 1, 0.7411765, 1,
-0.06844368, 0.06019376, -2.831601, 0, 1, 0.7490196, 1,
-0.06682211, -1.311546, -3.205536, 0, 1, 0.7529412, 1,
-0.06509625, -0.5382029, -2.181769, 0, 1, 0.7607843, 1,
-0.06448203, 2.435128, 0.4895512, 0, 1, 0.7647059, 1,
-0.06231136, 0.4588308, -0.95748, 0, 1, 0.772549, 1,
-0.06104171, -0.916196, -3.22029, 0, 1, 0.7764706, 1,
-0.05866996, 1.447888, 1.559539, 0, 1, 0.7843137, 1,
-0.05545059, 0.1802446, -1.508251, 0, 1, 0.7882353, 1,
-0.05456737, 1.106086, 1.20647, 0, 1, 0.7960784, 1,
-0.0525558, -0.7374035, -1.664775, 0, 1, 0.8039216, 1,
-0.05248899, 0.4613193, 3.524352, 0, 1, 0.8078431, 1,
-0.04936575, -0.4038646, -2.484384, 0, 1, 0.8156863, 1,
-0.04915646, 0.1912764, -2.242225, 0, 1, 0.8196079, 1,
-0.0488078, -0.4557571, -3.31597, 0, 1, 0.827451, 1,
-0.04690812, 0.06244403, -0.9444343, 0, 1, 0.8313726, 1,
-0.04490111, -0.3366925, -0.9994219, 0, 1, 0.8392157, 1,
-0.03315911, -0.502762, -3.925123, 0, 1, 0.8431373, 1,
-0.03300197, 0.6780071, -2.130107, 0, 1, 0.8509804, 1,
-0.03289884, -1.953565, -2.840434, 0, 1, 0.854902, 1,
-0.03185923, -1.661402, -0.5795377, 0, 1, 0.8627451, 1,
-0.02964437, 0.9574808, 0.4286147, 0, 1, 0.8666667, 1,
-0.02905053, -1.53877, -1.990276, 0, 1, 0.8745098, 1,
-0.02888506, -0.8783002, -2.91794, 0, 1, 0.8784314, 1,
-0.02730621, 0.5901263, -0.5340497, 0, 1, 0.8862745, 1,
-0.02340219, -1.117569, -2.454788, 0, 1, 0.8901961, 1,
-0.02224508, 0.5920901, -1.209626, 0, 1, 0.8980392, 1,
-0.0198443, -0.57585, -3.182762, 0, 1, 0.9058824, 1,
-0.01843333, 0.8013898, -1.265007, 0, 1, 0.9098039, 1,
-0.01650809, 1.118109, -0.04617837, 0, 1, 0.9176471, 1,
-0.01546694, 0.1410043, 1.090205, 0, 1, 0.9215686, 1,
-0.01429026, -0.2367843, -2.15334, 0, 1, 0.9294118, 1,
-0.01252103, -0.2492747, -2.418121, 0, 1, 0.9333333, 1,
-0.0114569, 0.1023201, 1.148123, 0, 1, 0.9411765, 1,
-0.01061703, -0.6764623, -2.900227, 0, 1, 0.945098, 1,
-0.005756256, 0.3170507, -0.454342, 0, 1, 0.9529412, 1,
-0.005225328, 0.8189533, 0.1580295, 0, 1, 0.9568627, 1,
-0.004525689, 2.124686, -0.1489162, 0, 1, 0.9647059, 1,
-0.004404697, -0.05732336, -2.872707, 0, 1, 0.9686275, 1,
-0.002131877, 0.2433982, -1.354487, 0, 1, 0.9764706, 1,
-0.000765577, -1.164727, -3.03717, 0, 1, 0.9803922, 1,
0.0009211812, -0.2244566, 2.896626, 0, 1, 0.9882353, 1,
0.007336189, 1.235619, 1.767685, 0, 1, 0.9921569, 1,
0.01090888, 1.824619, -0.04217576, 0, 1, 1, 1,
0.01388544, 0.4270678, 1.820184, 0, 0.9921569, 1, 1,
0.01717105, -2.871101, 2.376579, 0, 0.9882353, 1, 1,
0.01831517, 0.7331837, 1.511453, 0, 0.9803922, 1, 1,
0.01832451, -1.252733, 2.269965, 0, 0.9764706, 1, 1,
0.0201396, -0.412903, 3.073652, 0, 0.9686275, 1, 1,
0.02181551, 0.824181, 0.7365015, 0, 0.9647059, 1, 1,
0.02200103, 0.4761266, 1.745843, 0, 0.9568627, 1, 1,
0.02519381, 0.02998552, 0.5647768, 0, 0.9529412, 1, 1,
0.03105783, 1.396677, -0.247858, 0, 0.945098, 1, 1,
0.03221134, 0.4179496, -0.8179946, 0, 0.9411765, 1, 1,
0.03579186, -0.4794326, 2.107651, 0, 0.9333333, 1, 1,
0.03617714, -0.2913669, 1.786983, 0, 0.9294118, 1, 1,
0.03648791, 1.068858, -0.4490397, 0, 0.9215686, 1, 1,
0.03738461, -0.7294381, 3.315164, 0, 0.9176471, 1, 1,
0.04033832, 0.960891, -0.4571921, 0, 0.9098039, 1, 1,
0.04476992, 0.1976509, -1.38274, 0, 0.9058824, 1, 1,
0.04565882, -0.6034628, 1.503189, 0, 0.8980392, 1, 1,
0.04594068, -1.125924, 4.254229, 0, 0.8901961, 1, 1,
0.0466378, -0.01276911, 1.196918, 0, 0.8862745, 1, 1,
0.05054722, -0.5486194, 4.437303, 0, 0.8784314, 1, 1,
0.05206806, 0.8885658, 2.075377, 0, 0.8745098, 1, 1,
0.0547502, -0.005716411, 1.247666, 0, 0.8666667, 1, 1,
0.05495365, -0.6103096, 4.152484, 0, 0.8627451, 1, 1,
0.05753891, 1.356458, -0.457671, 0, 0.854902, 1, 1,
0.05982763, 0.5142832, 0.5544939, 0, 0.8509804, 1, 1,
0.06198752, 0.8735075, -0.2460933, 0, 0.8431373, 1, 1,
0.06643354, -1.021345, 1.076964, 0, 0.8392157, 1, 1,
0.06941836, 1.164948, -1.358672, 0, 0.8313726, 1, 1,
0.07916564, 0.3458644, 0.8296224, 0, 0.827451, 1, 1,
0.07936657, -1.37646, 3.798115, 0, 0.8196079, 1, 1,
0.08052334, -1.792077, 2.525758, 0, 0.8156863, 1, 1,
0.08386153, -0.1086639, 3.507024, 0, 0.8078431, 1, 1,
0.09083548, 0.1396947, 1.567768, 0, 0.8039216, 1, 1,
0.09265101, 0.7974291, 1.461833, 0, 0.7960784, 1, 1,
0.09265555, -0.847882, 2.916602, 0, 0.7882353, 1, 1,
0.09472137, -1.731113, 3.966926, 0, 0.7843137, 1, 1,
0.1020654, -0.3602898, 2.150527, 0, 0.7764706, 1, 1,
0.1036557, 1.287439, 0.6416413, 0, 0.772549, 1, 1,
0.1038269, 1.263605, -0.5540833, 0, 0.7647059, 1, 1,
0.1062271, 0.9186535, 0.4181781, 0, 0.7607843, 1, 1,
0.1063515, 1.486735, -0.8282696, 0, 0.7529412, 1, 1,
0.1070858, -0.5047393, 4.121219, 0, 0.7490196, 1, 1,
0.1120061, 1.026534, -0.1702976, 0, 0.7411765, 1, 1,
0.1143129, 0.1356246, 1.067277, 0, 0.7372549, 1, 1,
0.1149763, -0.1923976, 2.663382, 0, 0.7294118, 1, 1,
0.1151419, -0.3015552, 3.194955, 0, 0.7254902, 1, 1,
0.1158579, -0.9753698, 3.094095, 0, 0.7176471, 1, 1,
0.1191676, -0.9135342, 3.566235, 0, 0.7137255, 1, 1,
0.1253642, 0.9801214, 0.5619301, 0, 0.7058824, 1, 1,
0.1265842, 0.4189457, 1.186877, 0, 0.6980392, 1, 1,
0.1271553, 0.6167893, 1.070258, 0, 0.6941177, 1, 1,
0.130072, -0.04660306, 1.843451, 0, 0.6862745, 1, 1,
0.132954, 0.3897496, -1.108051, 0, 0.682353, 1, 1,
0.1426995, 0.1888681, -0.6008854, 0, 0.6745098, 1, 1,
0.1443222, 1.873632, -0.8235105, 0, 0.6705883, 1, 1,
0.146323, -0.8962744, 1.616663, 0, 0.6627451, 1, 1,
0.1464042, 2.868003, -0.3782866, 0, 0.6588235, 1, 1,
0.1465615, 0.2768539, -0.5144341, 0, 0.6509804, 1, 1,
0.1469614, 0.1169621, 1.685636, 0, 0.6470588, 1, 1,
0.1473936, -1.326917, 3.301414, 0, 0.6392157, 1, 1,
0.1476148, -1.307093, 5.425347, 0, 0.6352941, 1, 1,
0.1499483, -1.023642, 4.209575, 0, 0.627451, 1, 1,
0.154921, 1.180592, -0.1724176, 0, 0.6235294, 1, 1,
0.1568504, 0.02279573, 1.461521, 0, 0.6156863, 1, 1,
0.1580615, 1.194763, -0.8283159, 0, 0.6117647, 1, 1,
0.1588809, -0.3185916, 2.085449, 0, 0.6039216, 1, 1,
0.1641814, 0.2594378, 0.5701645, 0, 0.5960785, 1, 1,
0.1646591, -1.245894, 3.352236, 0, 0.5921569, 1, 1,
0.171425, -0.6945002, 2.720122, 0, 0.5843138, 1, 1,
0.1734173, -0.4680364, 2.633187, 0, 0.5803922, 1, 1,
0.1753838, 0.9952829, -0.1889387, 0, 0.572549, 1, 1,
0.1764861, -0.3744066, 2.142976, 0, 0.5686275, 1, 1,
0.1768413, -1.063365, 3.383065, 0, 0.5607843, 1, 1,
0.1863478, -1.456716, 4.193447, 0, 0.5568628, 1, 1,
0.1919867, 0.7175762, 3.37276, 0, 0.5490196, 1, 1,
0.1927565, 0.8438163, 0.2698181, 0, 0.5450981, 1, 1,
0.1944017, 2.585751, 0.8335342, 0, 0.5372549, 1, 1,
0.1968683, 0.3093722, 2.030863, 0, 0.5333334, 1, 1,
0.1985945, 0.2026872, 1.111408, 0, 0.5254902, 1, 1,
0.2021679, 0.2509386, 0.5967879, 0, 0.5215687, 1, 1,
0.2022692, -0.3425739, 3.27446, 0, 0.5137255, 1, 1,
0.2024336, -0.6358685, 1.691843, 0, 0.509804, 1, 1,
0.2037956, 0.8077372, 0.30932, 0, 0.5019608, 1, 1,
0.2047535, 0.05803195, 0.05069799, 0, 0.4941176, 1, 1,
0.2082756, 0.6924945, 0.9004116, 0, 0.4901961, 1, 1,
0.2105333, 0.8427839, 0.8019446, 0, 0.4823529, 1, 1,
0.2115941, -0.2398013, 3.993775, 0, 0.4784314, 1, 1,
0.2132523, -0.5648154, 1.181181, 0, 0.4705882, 1, 1,
0.2166154, 0.4883911, 0.4064038, 0, 0.4666667, 1, 1,
0.2185169, 0.2691657, 1.032987, 0, 0.4588235, 1, 1,
0.2193283, -1.413236, 3.623657, 0, 0.454902, 1, 1,
0.2200358, -1.028546, 3.186523, 0, 0.4470588, 1, 1,
0.22249, -1.740296, 3.269182, 0, 0.4431373, 1, 1,
0.2279976, 1.126257, -1.174569, 0, 0.4352941, 1, 1,
0.2287242, 1.168494, 0.7580561, 0, 0.4313726, 1, 1,
0.2316002, -2.15281, 2.895537, 0, 0.4235294, 1, 1,
0.2335112, -1.152518, 2.391353, 0, 0.4196078, 1, 1,
0.2337391, -0.3843116, 2.002986, 0, 0.4117647, 1, 1,
0.236625, -0.8619191, 2.777113, 0, 0.4078431, 1, 1,
0.2370446, -0.6091447, 1.652102, 0, 0.4, 1, 1,
0.2416873, -1.124898, 3.914341, 0, 0.3921569, 1, 1,
0.2439271, 0.2933002, -0.00653144, 0, 0.3882353, 1, 1,
0.2464574, -1.415117, 3.37408, 0, 0.3803922, 1, 1,
0.2466443, -1.06205, 2.270917, 0, 0.3764706, 1, 1,
0.2515243, -0.2642542, 1.788869, 0, 0.3686275, 1, 1,
0.2524546, -0.1039048, 3.194228, 0, 0.3647059, 1, 1,
0.2534739, -1.175615, 3.493813, 0, 0.3568628, 1, 1,
0.2549832, 0.6207228, 1.317845, 0, 0.3529412, 1, 1,
0.2564402, -1.002509, 2.248874, 0, 0.345098, 1, 1,
0.2564685, -0.5516989, 0.8218732, 0, 0.3411765, 1, 1,
0.2584776, 1.797343, -0.1427178, 0, 0.3333333, 1, 1,
0.2644916, 1.261494, 0.7094927, 0, 0.3294118, 1, 1,
0.2697892, 1.716508, 0.1966549, 0, 0.3215686, 1, 1,
0.2731525, -1.23701, 3.658437, 0, 0.3176471, 1, 1,
0.2732087, 0.638471, -0.8583418, 0, 0.3098039, 1, 1,
0.2767105, 0.798761, -0.0542315, 0, 0.3058824, 1, 1,
0.2775499, 0.8371704, 1.682472, 0, 0.2980392, 1, 1,
0.2829701, 0.6969194, 0.4525264, 0, 0.2901961, 1, 1,
0.2834108, 1.188226, 1.481423, 0, 0.2862745, 1, 1,
0.2845882, -0.6201934, 3.130822, 0, 0.2784314, 1, 1,
0.2892716, -0.3669116, 2.327352, 0, 0.2745098, 1, 1,
0.2920185, -0.07941588, 4.607844, 0, 0.2666667, 1, 1,
0.2922036, 0.2737655, 1.225348, 0, 0.2627451, 1, 1,
0.2923244, -1.522306, 0.95163, 0, 0.254902, 1, 1,
0.292541, 2.41989, -0.8652117, 0, 0.2509804, 1, 1,
0.2936804, 0.5654051, 0.4707015, 0, 0.2431373, 1, 1,
0.2952285, -1.699188, 2.933484, 0, 0.2392157, 1, 1,
0.2956243, 0.04059207, 1.866057, 0, 0.2313726, 1, 1,
0.2979424, 0.8458411, -0.845707, 0, 0.227451, 1, 1,
0.2991134, 0.8388007, -1.22093, 0, 0.2196078, 1, 1,
0.3029193, -0.9269798, 3.567661, 0, 0.2156863, 1, 1,
0.3031992, -0.01990726, 1.075296, 0, 0.2078431, 1, 1,
0.3034411, 0.1893016, 0.8460937, 0, 0.2039216, 1, 1,
0.3059501, 0.9900137, 1.441078, 0, 0.1960784, 1, 1,
0.3100941, -0.7875405, 2.187203, 0, 0.1882353, 1, 1,
0.3102681, 1.831209, -0.3185433, 0, 0.1843137, 1, 1,
0.3116306, 1.429447, 0.4602658, 0, 0.1764706, 1, 1,
0.3127372, -0.04802881, 1.771295, 0, 0.172549, 1, 1,
0.3168836, -3.393608, 2.540546, 0, 0.1647059, 1, 1,
0.320957, -0.6635514, 2.190197, 0, 0.1607843, 1, 1,
0.322353, 2.279191, 0.289545, 0, 0.1529412, 1, 1,
0.323096, -1.10244, 2.606173, 0, 0.1490196, 1, 1,
0.3236845, -0.02467061, 4.340062, 0, 0.1411765, 1, 1,
0.3257783, -2.222239, 2.877324, 0, 0.1372549, 1, 1,
0.3331906, 0.4328228, -0.3292518, 0, 0.1294118, 1, 1,
0.3355152, -0.4734613, 2.308744, 0, 0.1254902, 1, 1,
0.3355974, -0.2380862, 1.388602, 0, 0.1176471, 1, 1,
0.3361933, 0.3083064, 0.8362715, 0, 0.1137255, 1, 1,
0.345859, 0.4772558, 0.6941857, 0, 0.1058824, 1, 1,
0.3479671, 0.02401987, 0.3978392, 0, 0.09803922, 1, 1,
0.3532849, 0.4439899, -0.7446394, 0, 0.09411765, 1, 1,
0.3567321, 0.819408, 1.774574, 0, 0.08627451, 1, 1,
0.3569391, -0.7103605, 0.7915287, 0, 0.08235294, 1, 1,
0.3598413, -1.418839, 0.9037768, 0, 0.07450981, 1, 1,
0.362342, 1.101469, -0.2643876, 0, 0.07058824, 1, 1,
0.3670023, 0.9405078, 0.6522504, 0, 0.0627451, 1, 1,
0.3670982, 2.048002, 1.291863, 0, 0.05882353, 1, 1,
0.3676204, -0.01245988, 1.431172, 0, 0.05098039, 1, 1,
0.3686519, -0.3898855, 3.163589, 0, 0.04705882, 1, 1,
0.377104, -0.05116846, 1.062095, 0, 0.03921569, 1, 1,
0.3800921, -0.06560094, 1.47693, 0, 0.03529412, 1, 1,
0.3841591, -0.06832398, 2.524535, 0, 0.02745098, 1, 1,
0.3862665, 1.263283, -1.552541, 0, 0.02352941, 1, 1,
0.3874837, -0.1511866, 1.635382, 0, 0.01568628, 1, 1,
0.3883615, -1.781582, 2.742907, 0, 0.01176471, 1, 1,
0.3931624, -0.7565712, 3.219248, 0, 0.003921569, 1, 1,
0.39704, 1.036423, 0.1602552, 0.003921569, 0, 1, 1,
0.4013828, -0.07024924, 1.479171, 0.007843138, 0, 1, 1,
0.4016447, 0.635736, 0.9029245, 0.01568628, 0, 1, 1,
0.4025477, -1.293568, 3.015534, 0.01960784, 0, 1, 1,
0.4043587, -0.03439551, 2.402227, 0.02745098, 0, 1, 1,
0.4066919, 0.2807436, 0.6431969, 0.03137255, 0, 1, 1,
0.4080977, 0.9257957, 1.382449, 0.03921569, 0, 1, 1,
0.4100955, -0.6397835, 3.640099, 0.04313726, 0, 1, 1,
0.4149546, -1.02069, 2.729766, 0.05098039, 0, 1, 1,
0.4157462, -0.645159, 1.310655, 0.05490196, 0, 1, 1,
0.416907, 0.2079516, 1.241766, 0.0627451, 0, 1, 1,
0.4169113, -0.7649954, 3.604322, 0.06666667, 0, 1, 1,
0.4206615, 1.225264, 0.5107816, 0.07450981, 0, 1, 1,
0.4246232, -0.5369062, 1.800681, 0.07843138, 0, 1, 1,
0.4247666, 1.520401, -0.8866027, 0.08627451, 0, 1, 1,
0.4345772, -1.031621, 2.649447, 0.09019608, 0, 1, 1,
0.4379742, -0.4995915, 1.70339, 0.09803922, 0, 1, 1,
0.4396229, 1.530107, -2.358316, 0.1058824, 0, 1, 1,
0.4436056, 0.5711613, 2.958667, 0.1098039, 0, 1, 1,
0.4522201, -0.385439, 4.285469, 0.1176471, 0, 1, 1,
0.4531268, 0.131341, 0.9398655, 0.1215686, 0, 1, 1,
0.4574849, -1.408837, 2.17412, 0.1294118, 0, 1, 1,
0.457772, -0.6347075, 2.338426, 0.1333333, 0, 1, 1,
0.4587444, 1.477527, 2.464818, 0.1411765, 0, 1, 1,
0.4634637, -0.5868703, 2.963055, 0.145098, 0, 1, 1,
0.4655823, 0.4068482, 0.9875345, 0.1529412, 0, 1, 1,
0.4699501, 0.234643, 2.214957, 0.1568628, 0, 1, 1,
0.4715317, -1.260228, 2.811387, 0.1647059, 0, 1, 1,
0.4716722, -0.916357, 5.364739, 0.1686275, 0, 1, 1,
0.4739562, 0.7212517, 1.026873, 0.1764706, 0, 1, 1,
0.4741234, 0.8526115, 0.1521966, 0.1803922, 0, 1, 1,
0.4748488, 0.98248, 0.04311157, 0.1882353, 0, 1, 1,
0.4748546, -0.9875645, 2.364657, 0.1921569, 0, 1, 1,
0.4793598, -1.101347, -0.017007, 0.2, 0, 1, 1,
0.4804831, 1.282603, 0.7057983, 0.2078431, 0, 1, 1,
0.4805128, -0.56795, 2.872123, 0.2117647, 0, 1, 1,
0.4835773, -0.1321745, 2.447101, 0.2196078, 0, 1, 1,
0.4859478, -0.3476027, 2.95771, 0.2235294, 0, 1, 1,
0.4866782, 1.12814, 0.3056064, 0.2313726, 0, 1, 1,
0.4878023, 0.9112448, -0.226103, 0.2352941, 0, 1, 1,
0.4903125, 0.6423242, 0.9707344, 0.2431373, 0, 1, 1,
0.4933726, 0.8503132, 0.05167807, 0.2470588, 0, 1, 1,
0.494408, 0.4729077, 1.232277, 0.254902, 0, 1, 1,
0.4988935, -1.067354, 3.148662, 0.2588235, 0, 1, 1,
0.5005473, 0.01439502, 1.681634, 0.2666667, 0, 1, 1,
0.502941, -1.451688, 1.815914, 0.2705882, 0, 1, 1,
0.504478, -0.8312795, 0.7628553, 0.2784314, 0, 1, 1,
0.5114769, -0.564829, 1.150831, 0.282353, 0, 1, 1,
0.5133524, -0.09575943, 2.984894, 0.2901961, 0, 1, 1,
0.5161422, -0.6112965, 3.107637, 0.2941177, 0, 1, 1,
0.5169018, -1.10374, 2.158487, 0.3019608, 0, 1, 1,
0.5198243, 2.773256, -0.06270885, 0.3098039, 0, 1, 1,
0.5227762, 2.150997, 0.5539835, 0.3137255, 0, 1, 1,
0.5234182, -1.386471, 1.71, 0.3215686, 0, 1, 1,
0.5240229, -1.105883, 2.889608, 0.3254902, 0, 1, 1,
0.526371, 1.682691, 0.3715864, 0.3333333, 0, 1, 1,
0.5266812, -1.914697, 3.204323, 0.3372549, 0, 1, 1,
0.5278426, -1.762713, 2.841288, 0.345098, 0, 1, 1,
0.5325575, 0.1962211, 3.319362, 0.3490196, 0, 1, 1,
0.5350208, -0.4765873, 3.504164, 0.3568628, 0, 1, 1,
0.5353268, 0.5039924, 1.283051, 0.3607843, 0, 1, 1,
0.5374239, -0.07210673, 2.113894, 0.3686275, 0, 1, 1,
0.5382747, -1.872603, 0.9621187, 0.372549, 0, 1, 1,
0.5398219, -1.463537, -0.0922092, 0.3803922, 0, 1, 1,
0.5457456, 0.714529, 0.4744885, 0.3843137, 0, 1, 1,
0.5474573, -1.470907, 3.696604, 0.3921569, 0, 1, 1,
0.5499135, -0.5740433, 2.185431, 0.3960784, 0, 1, 1,
0.5526105, -0.3874088, 2.051238, 0.4039216, 0, 1, 1,
0.5540859, -0.01932239, 0.3865334, 0.4117647, 0, 1, 1,
0.5600876, -0.1045022, 1.92219, 0.4156863, 0, 1, 1,
0.5667223, -0.4608082, 1.561423, 0.4235294, 0, 1, 1,
0.5675983, -0.6349066, 2.180439, 0.427451, 0, 1, 1,
0.5686752, -0.1705978, 1.96668, 0.4352941, 0, 1, 1,
0.5740827, -0.1948057, -0.2982151, 0.4392157, 0, 1, 1,
0.5757499, -0.8059486, 2.744558, 0.4470588, 0, 1, 1,
0.5945718, 0.02017754, 3.391591, 0.4509804, 0, 1, 1,
0.6034146, 0.8455986, 1.534159, 0.4588235, 0, 1, 1,
0.6082718, 0.009096594, -0.3886206, 0.4627451, 0, 1, 1,
0.6184703, -1.309184, 1.905398, 0.4705882, 0, 1, 1,
0.6197863, -0.665451, 3.490258, 0.4745098, 0, 1, 1,
0.6209633, 1.546945, -0.4578861, 0.4823529, 0, 1, 1,
0.6214722, 1.213395, 0.4297598, 0.4862745, 0, 1, 1,
0.6217713, 1.215205, 1.676525, 0.4941176, 0, 1, 1,
0.6231077, -0.3406835, 3.60804, 0.5019608, 0, 1, 1,
0.6283639, -0.8842906, 3.179854, 0.5058824, 0, 1, 1,
0.6309692, -0.2398924, 2.591933, 0.5137255, 0, 1, 1,
0.6392647, 0.335463, 0.6455919, 0.5176471, 0, 1, 1,
0.6437347, -1.258193, 1.626514, 0.5254902, 0, 1, 1,
0.6515203, 2.028415, -1.141133, 0.5294118, 0, 1, 1,
0.6535406, -0.5050806, 2.626088, 0.5372549, 0, 1, 1,
0.6582899, -0.6062468, 3.582771, 0.5411765, 0, 1, 1,
0.6639894, 1.822035, -0.6160685, 0.5490196, 0, 1, 1,
0.6663135, -0.08369533, 1.198007, 0.5529412, 0, 1, 1,
0.6686389, 1.101853, -0.1101943, 0.5607843, 0, 1, 1,
0.6690536, -0.8052594, 2.405389, 0.5647059, 0, 1, 1,
0.6718731, 0.7919562, -0.02036599, 0.572549, 0, 1, 1,
0.6734814, 0.3003531, 1.719545, 0.5764706, 0, 1, 1,
0.6752595, -0.7520522, 3.361307, 0.5843138, 0, 1, 1,
0.6778136, -0.5392686, 0.3427754, 0.5882353, 0, 1, 1,
0.6797584, -0.8870994, 3.817791, 0.5960785, 0, 1, 1,
0.6841429, 0.6514333, 0.4060956, 0.6039216, 0, 1, 1,
0.6861247, -0.6178098, 2.224416, 0.6078432, 0, 1, 1,
0.6869843, -1.932115, 2.685605, 0.6156863, 0, 1, 1,
0.6926426, 0.1574295, 0.1934841, 0.6196079, 0, 1, 1,
0.6941137, -0.826373, 3.111826, 0.627451, 0, 1, 1,
0.7033469, 1.736187, 0.822125, 0.6313726, 0, 1, 1,
0.7038794, -0.2742057, 1.219934, 0.6392157, 0, 1, 1,
0.7084102, 1.182567, 0.09684151, 0.6431373, 0, 1, 1,
0.7146115, 0.3244141, 1.437164, 0.6509804, 0, 1, 1,
0.7153975, 0.1709997, 2.275341, 0.654902, 0, 1, 1,
0.7165885, 1.06881, 2.69028, 0.6627451, 0, 1, 1,
0.720212, -1.102583, 1.775205, 0.6666667, 0, 1, 1,
0.7220038, -2.092331, 3.833209, 0.6745098, 0, 1, 1,
0.7251932, -0.5359687, 1.581397, 0.6784314, 0, 1, 1,
0.7296133, -0.4296591, 0.4357937, 0.6862745, 0, 1, 1,
0.732616, -0.4715133, 1.668441, 0.6901961, 0, 1, 1,
0.734287, 0.3395908, 1.393391, 0.6980392, 0, 1, 1,
0.7344267, -0.9784594, 1.90643, 0.7058824, 0, 1, 1,
0.7402028, -1.247624, 3.969545, 0.7098039, 0, 1, 1,
0.7402688, -1.100083, 1.866662, 0.7176471, 0, 1, 1,
0.7455006, -0.3901662, 3.529735, 0.7215686, 0, 1, 1,
0.7466452, -0.9830739, 1.572807, 0.7294118, 0, 1, 1,
0.7491664, -0.03751267, 2.991467, 0.7333333, 0, 1, 1,
0.7498034, 0.4018, 1.265825, 0.7411765, 0, 1, 1,
0.7518023, -1.907613, 4.879885, 0.7450981, 0, 1, 1,
0.7562606, -1.975502, 2.024331, 0.7529412, 0, 1, 1,
0.7719054, 0.8548161, 0.6277541, 0.7568628, 0, 1, 1,
0.7775072, 0.0702583, -0.5684804, 0.7647059, 0, 1, 1,
0.7823096, 1.290735, 0.3697265, 0.7686275, 0, 1, 1,
0.7882661, -1.587216, 2.421058, 0.7764706, 0, 1, 1,
0.7891161, 0.02767291, 1.192299, 0.7803922, 0, 1, 1,
0.7919164, 1.705453, 0.5799147, 0.7882353, 0, 1, 1,
0.7945796, 1.715726, -0.07721055, 0.7921569, 0, 1, 1,
0.7947034, -0.611914, 2.360646, 0.8, 0, 1, 1,
0.8056303, 0.7650071, -1.252545, 0.8078431, 0, 1, 1,
0.8067927, 0.4811805, 1.559552, 0.8117647, 0, 1, 1,
0.8105752, -1.082977, 2.269782, 0.8196079, 0, 1, 1,
0.8217018, -0.4660123, 1.868548, 0.8235294, 0, 1, 1,
0.8218596, 0.8448431, -0.5214496, 0.8313726, 0, 1, 1,
0.8245645, 0.04129419, 0.6533018, 0.8352941, 0, 1, 1,
0.8260996, -0.2478155, 3.413378, 0.8431373, 0, 1, 1,
0.8279983, -0.8432902, 1.664005, 0.8470588, 0, 1, 1,
0.8351489, -1.014896, 1.947818, 0.854902, 0, 1, 1,
0.8352531, 1.136456, -0.6621061, 0.8588235, 0, 1, 1,
0.8381726, 1.204758, 0.3261509, 0.8666667, 0, 1, 1,
0.8447212, -0.2431962, 1.977603, 0.8705882, 0, 1, 1,
0.8452404, -1.075421, 3.709179, 0.8784314, 0, 1, 1,
0.8469565, 0.5531429, 0.02892577, 0.8823529, 0, 1, 1,
0.8524492, 1.645673, 0.2605933, 0.8901961, 0, 1, 1,
0.8547352, 0.1204068, 2.505247, 0.8941177, 0, 1, 1,
0.8558409, -0.4410567, 3.100693, 0.9019608, 0, 1, 1,
0.8581651, -2.059774, 1.608371, 0.9098039, 0, 1, 1,
0.8620713, 0.2754095, 0.2805583, 0.9137255, 0, 1, 1,
0.8635252, -1.229296, 1.832547, 0.9215686, 0, 1, 1,
0.8669514, -2.953787, 2.654998, 0.9254902, 0, 1, 1,
0.868816, 1.312389, 1.642098, 0.9333333, 0, 1, 1,
0.8695593, 0.3281045, 0.4521231, 0.9372549, 0, 1, 1,
0.8695601, -0.1518915, -0.6073664, 0.945098, 0, 1, 1,
0.8735815, -0.1700289, 2.164541, 0.9490196, 0, 1, 1,
0.8737462, 0.1960081, 2.582272, 0.9568627, 0, 1, 1,
0.8750834, -0.4095639, 2.711053, 0.9607843, 0, 1, 1,
0.8811892, 2.889501, 1.59334, 0.9686275, 0, 1, 1,
0.8888903, 0.6101931, -0.05098332, 0.972549, 0, 1, 1,
0.9037546, -0.3180055, 0.7041612, 0.9803922, 0, 1, 1,
0.9067923, 0.1275968, 2.466489, 0.9843137, 0, 1, 1,
0.9096906, -0.9462668, 2.973628, 0.9921569, 0, 1, 1,
0.9114196, 0.7197336, 1.193869, 0.9960784, 0, 1, 1,
0.9149411, 1.25065, 1.104221, 1, 0, 0.9960784, 1,
0.9163332, -1.670827, 2.789522, 1, 0, 0.9882353, 1,
0.9199555, -1.372826, 3.208273, 1, 0, 0.9843137, 1,
0.9335789, 0.7178432, 1.134968, 1, 0, 0.9764706, 1,
0.9428327, 0.009419116, 3.534141, 1, 0, 0.972549, 1,
0.9430567, -1.175244, 3.825143, 1, 0, 0.9647059, 1,
0.9503801, 1.025791, 1.153334, 1, 0, 0.9607843, 1,
0.9508786, 0.03173729, 1.741432, 1, 0, 0.9529412, 1,
0.9512219, -0.3309718, 2.819603, 1, 0, 0.9490196, 1,
0.9530568, -1.286023, 1.397629, 1, 0, 0.9411765, 1,
0.9531426, -0.08270507, 2.494491, 1, 0, 0.9372549, 1,
0.9567202, 1.420535, 0.1774761, 1, 0, 0.9294118, 1,
0.9688058, 0.3366493, 2.645136, 1, 0, 0.9254902, 1,
0.9766223, 0.2958917, -0.07670651, 1, 0, 0.9176471, 1,
0.9771943, -0.5098906, 0.4225252, 1, 0, 0.9137255, 1,
0.9776431, 0.4570922, -1.628811, 1, 0, 0.9058824, 1,
0.9812485, 0.971515, -0.4880164, 1, 0, 0.9019608, 1,
0.9986991, -1.949909, 4.065993, 1, 0, 0.8941177, 1,
1.007846, -0.8665114, 1.948875, 1, 0, 0.8862745, 1,
1.011212, -0.1114914, 1.961071, 1, 0, 0.8823529, 1,
1.018493, -0.7848284, 3.979363, 1, 0, 0.8745098, 1,
1.019672, 0.05944257, 2.009337, 1, 0, 0.8705882, 1,
1.040241, -0.4977213, 1.92001, 1, 0, 0.8627451, 1,
1.045845, 0.5863594, 1.094884, 1, 0, 0.8588235, 1,
1.05194, -1.347396, 2.759187, 1, 0, 0.8509804, 1,
1.060748, -0.7041224, 3.286164, 1, 0, 0.8470588, 1,
1.065921, 0.8292181, 1.280325, 1, 0, 0.8392157, 1,
1.070704, 1.643018, -0.02837798, 1, 0, 0.8352941, 1,
1.072033, -0.3253685, 2.444026, 1, 0, 0.827451, 1,
1.079068, 0.3608826, 0.3186587, 1, 0, 0.8235294, 1,
1.079999, -0.1700204, 2.209512, 1, 0, 0.8156863, 1,
1.086397, 0.6666986, 2.227458, 1, 0, 0.8117647, 1,
1.087541, 0.8100299, 2.031801, 1, 0, 0.8039216, 1,
1.093009, -0.7385421, 0.1520371, 1, 0, 0.7960784, 1,
1.098863, -0.5305547, 1.434645, 1, 0, 0.7921569, 1,
1.100472, 1.359824, 1.393598, 1, 0, 0.7843137, 1,
1.104787, -0.04734918, 3.875097, 1, 0, 0.7803922, 1,
1.107607, 0.5060319, 1.387708, 1, 0, 0.772549, 1,
1.110621, -0.1870206, -0.5039186, 1, 0, 0.7686275, 1,
1.116749, 0.4288273, 1.563806, 1, 0, 0.7607843, 1,
1.127517, 0.1375065, 3.553598, 1, 0, 0.7568628, 1,
1.131399, 0.4049481, 1.211211, 1, 0, 0.7490196, 1,
1.134216, -0.1571234, 2.135281, 1, 0, 0.7450981, 1,
1.136228, 1.128993, -0.9257543, 1, 0, 0.7372549, 1,
1.13661, 0.6672866, 1.784911, 1, 0, 0.7333333, 1,
1.140674, -1.154695, 2.15293, 1, 0, 0.7254902, 1,
1.140924, 0.4323479, -0.3486268, 1, 0, 0.7215686, 1,
1.141939, -0.249612, 1.875569, 1, 0, 0.7137255, 1,
1.143692, -1.981494, 3.579011, 1, 0, 0.7098039, 1,
1.155025, 0.5338678, 2.287849, 1, 0, 0.7019608, 1,
1.158809, 1.187283, 0.08385432, 1, 0, 0.6941177, 1,
1.160918, 0.5261918, 0.9157044, 1, 0, 0.6901961, 1,
1.163232, -1.726739, 3.968929, 1, 0, 0.682353, 1,
1.16674, 0.4941878, 1.865009, 1, 0, 0.6784314, 1,
1.171589, -0.2628688, 1.636526, 1, 0, 0.6705883, 1,
1.172364, -0.6833906, 1.740403, 1, 0, 0.6666667, 1,
1.180623, -1.303592, 2.177295, 1, 0, 0.6588235, 1,
1.183251, -0.3867054, 2.961163, 1, 0, 0.654902, 1,
1.192929, 0.202876, 1.564631, 1, 0, 0.6470588, 1,
1.2116, -0.03620885, 1.699731, 1, 0, 0.6431373, 1,
1.233103, -0.3406679, 3.413337, 1, 0, 0.6352941, 1,
1.237988, 0.4345279, 2.210789, 1, 0, 0.6313726, 1,
1.238347, 1.072625, 1.569763, 1, 0, 0.6235294, 1,
1.241787, -0.3152594, 2.901261, 1, 0, 0.6196079, 1,
1.24826, -0.6248142, 1.517496, 1, 0, 0.6117647, 1,
1.248912, 0.2203007, 1.72824, 1, 0, 0.6078432, 1,
1.248994, 1.317002, 0.6923506, 1, 0, 0.6, 1,
1.267033, -2.190803, 3.348707, 1, 0, 0.5921569, 1,
1.273927, -1.363575, 3.249787, 1, 0, 0.5882353, 1,
1.283592, -1.046968, 3.692222, 1, 0, 0.5803922, 1,
1.286879, -1.139424, 2.018746, 1, 0, 0.5764706, 1,
1.299448, -1.353598, 3.334834, 1, 0, 0.5686275, 1,
1.309078, 1.687003, 1.100516, 1, 0, 0.5647059, 1,
1.310823, -0.8801159, 4.267452, 1, 0, 0.5568628, 1,
1.31244, -1.092888, 2.872984, 1, 0, 0.5529412, 1,
1.31557, -0.6419924, 2.865995, 1, 0, 0.5450981, 1,
1.320238, 0.09874167, 1.075696, 1, 0, 0.5411765, 1,
1.321432, -1.407394, 2.305926, 1, 0, 0.5333334, 1,
1.324079, 0.7040266, -0.01278026, 1, 0, 0.5294118, 1,
1.331626, 0.8724318, 0.1956959, 1, 0, 0.5215687, 1,
1.34491, 0.8720986, 1.620115, 1, 0, 0.5176471, 1,
1.35678, 0.971622, 3.228131, 1, 0, 0.509804, 1,
1.363468, -0.09894295, 1.623991, 1, 0, 0.5058824, 1,
1.367264, 0.9523844, 2.501097, 1, 0, 0.4980392, 1,
1.385617, -0.3132816, 2.554842, 1, 0, 0.4901961, 1,
1.391797, 0.9252965, 0.8024488, 1, 0, 0.4862745, 1,
1.399465, -0.1409203, 1.098674, 1, 0, 0.4784314, 1,
1.401115, 1.082186, -0.1501777, 1, 0, 0.4745098, 1,
1.403657, -1.389483, 1.388061, 1, 0, 0.4666667, 1,
1.404407, -1.326426, 2.626958, 1, 0, 0.4627451, 1,
1.414517, -0.6543249, 3.007868, 1, 0, 0.454902, 1,
1.425726, -0.5920787, 2.468305, 1, 0, 0.4509804, 1,
1.440835, -0.7026386, 0.8563776, 1, 0, 0.4431373, 1,
1.443892, -1.041567, 2.615461, 1, 0, 0.4392157, 1,
1.471473, 0.2004271, 1.054983, 1, 0, 0.4313726, 1,
1.477509, 1.100776, 0.584861, 1, 0, 0.427451, 1,
1.486376, -0.4401727, 3.70254, 1, 0, 0.4196078, 1,
1.487067, 1.32717, 0.9695858, 1, 0, 0.4156863, 1,
1.491873, -0.3729415, 1.73101, 1, 0, 0.4078431, 1,
1.502368, 0.2493473, 1.003366, 1, 0, 0.4039216, 1,
1.507311, 0.4316319, 2.368276, 1, 0, 0.3960784, 1,
1.510549, -0.4555815, 1.882102, 1, 0, 0.3882353, 1,
1.510732, -0.3793356, 1.051293, 1, 0, 0.3843137, 1,
1.516675, 0.294342, 0.8702286, 1, 0, 0.3764706, 1,
1.518837, 1.722441, 1.538124, 1, 0, 0.372549, 1,
1.52317, -0.8795403, 1.307654, 1, 0, 0.3647059, 1,
1.530445, -1.51465, 1.471764, 1, 0, 0.3607843, 1,
1.533824, 0.5913845, 0.03548247, 1, 0, 0.3529412, 1,
1.539788, -0.1929639, 1.092829, 1, 0, 0.3490196, 1,
1.544799, 0.1488049, 0.535129, 1, 0, 0.3411765, 1,
1.552266, 0.443226, 1.153299, 1, 0, 0.3372549, 1,
1.558093, 1.889777, -0.3656414, 1, 0, 0.3294118, 1,
1.567083, 0.4341418, 1.277882, 1, 0, 0.3254902, 1,
1.573328, -0.304509, 1.530194, 1, 0, 0.3176471, 1,
1.578655, -0.6260967, 0.3843486, 1, 0, 0.3137255, 1,
1.586665, 0.1693275, 1.248114, 1, 0, 0.3058824, 1,
1.586919, 0.001254609, 0.8271599, 1, 0, 0.2980392, 1,
1.594152, -1.526304, 1.904121, 1, 0, 0.2941177, 1,
1.614545, 0.7161538, 2.52881, 1, 0, 0.2862745, 1,
1.615927, -0.6995707, 1.10811, 1, 0, 0.282353, 1,
1.621492, 0.02211494, 1.320418, 1, 0, 0.2745098, 1,
1.637025, -1.303946, 0.5703984, 1, 0, 0.2705882, 1,
1.662338, 0.3108375, 1.908895, 1, 0, 0.2627451, 1,
1.671462, -1.54401, 1.219751, 1, 0, 0.2588235, 1,
1.675932, 1.577501, 1.542134, 1, 0, 0.2509804, 1,
1.685119, -0.9165177, 2.23166, 1, 0, 0.2470588, 1,
1.703042, -1.610658, 2.192097, 1, 0, 0.2392157, 1,
1.723798, 0.3683771, 1.437645, 1, 0, 0.2352941, 1,
1.739955, 0.239289, 1.266799, 1, 0, 0.227451, 1,
1.747661, -0.07171664, 2.064014, 1, 0, 0.2235294, 1,
1.753005, 1.504053, -0.2394638, 1, 0, 0.2156863, 1,
1.753598, -1.925182, 2.124356, 1, 0, 0.2117647, 1,
1.782057, 0.8169139, -1.276933, 1, 0, 0.2039216, 1,
1.785203, -0.1142747, 1.16576, 1, 0, 0.1960784, 1,
1.790641, 0.1671878, -0.007568151, 1, 0, 0.1921569, 1,
1.815209, 0.9216225, 1.690595, 1, 0, 0.1843137, 1,
1.841556, 0.9944984, 0.2964628, 1, 0, 0.1803922, 1,
1.850518, -1.211841, 3.588291, 1, 0, 0.172549, 1,
1.866605, 1.668626, 1.648254, 1, 0, 0.1686275, 1,
1.871726, 1.796147, 1.010544, 1, 0, 0.1607843, 1,
1.914863, -0.4968583, 1.337083, 1, 0, 0.1568628, 1,
1.919411, -0.4619853, 3.294597, 1, 0, 0.1490196, 1,
1.9599, 0.1360353, 1.607969, 1, 0, 0.145098, 1,
1.979136, 0.8923677, -0.1304125, 1, 0, 0.1372549, 1,
1.988088, 0.742115, -0.1846899, 1, 0, 0.1333333, 1,
2.004807, 1.082931, 1.763927, 1, 0, 0.1254902, 1,
2.034564, 0.3781874, 3.126729, 1, 0, 0.1215686, 1,
2.055309, 1.757334, 0.9212406, 1, 0, 0.1137255, 1,
2.094485, 0.1183701, 2.502601, 1, 0, 0.1098039, 1,
2.100465, 0.6094884, 1.539285, 1, 0, 0.1019608, 1,
2.100562, 1.251569, -0.05070842, 1, 0, 0.09411765, 1,
2.108603, -0.4819223, 0.9165292, 1, 0, 0.09019608, 1,
2.133003, -0.08086645, 1.490388, 1, 0, 0.08235294, 1,
2.162963, -0.1304221, 1.709648, 1, 0, 0.07843138, 1,
2.20538, 1.177665, 0.07976402, 1, 0, 0.07058824, 1,
2.262153, -1.322072, 2.629547, 1, 0, 0.06666667, 1,
2.286956, -0.3035656, 3.01486, 1, 0, 0.05882353, 1,
2.293522, -0.7909907, 1.186504, 1, 0, 0.05490196, 1,
2.30116, 0.2424986, 1.626326, 1, 0, 0.04705882, 1,
2.329944, -0.5298586, 1.001123, 1, 0, 0.04313726, 1,
2.394156, 0.922906, 2.33419, 1, 0, 0.03529412, 1,
2.488325, 0.4224481, 0.07750624, 1, 0, 0.03137255, 1,
2.529327, -1.653857, 3.273027, 1, 0, 0.02352941, 1,
2.672579, 0.6792925, 1.158208, 1, 0, 0.01960784, 1,
2.921412, -0.266402, 2.178138, 1, 0, 0.01176471, 1,
3.150694, -0.5447197, 2.838341, 1, 0, 0.007843138, 1
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
-0.3126063, -4.512336, -7.121267, 0, -0.5, 0.5, 0.5,
-0.3126063, -4.512336, -7.121267, 1, -0.5, 0.5, 0.5,
-0.3126063, -4.512336, -7.121267, 1, 1.5, 0.5, 0.5,
-0.3126063, -4.512336, -7.121267, 0, 1.5, 0.5, 0.5
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
-4.949965, -0.09352612, -7.121267, 0, -0.5, 0.5, 0.5,
-4.949965, -0.09352612, -7.121267, 1, -0.5, 0.5, 0.5,
-4.949965, -0.09352612, -7.121267, 1, 1.5, 0.5, 0.5,
-4.949965, -0.09352612, -7.121267, 0, 1.5, 0.5, 0.5
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
-4.949965, -4.512336, 0.06125355, 0, -0.5, 0.5, 0.5,
-4.949965, -4.512336, 0.06125355, 1, -0.5, 0.5, 0.5,
-4.949965, -4.512336, 0.06125355, 1, 1.5, 0.5, 0.5,
-4.949965, -4.512336, 0.06125355, 0, 1.5, 0.5, 0.5
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
-3, -3.492611, -5.463763,
3, -3.492611, -5.463763,
-3, -3.492611, -5.463763,
-3, -3.662565, -5.740013,
-2, -3.492611, -5.463763,
-2, -3.662565, -5.740013,
-1, -3.492611, -5.463763,
-1, -3.662565, -5.740013,
0, -3.492611, -5.463763,
0, -3.662565, -5.740013,
1, -3.492611, -5.463763,
1, -3.662565, -5.740013,
2, -3.492611, -5.463763,
2, -3.662565, -5.740013,
3, -3.492611, -5.463763,
3, -3.662565, -5.740013
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
-3, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
-3, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
-3, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
-3, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
-2, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
-2, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
-2, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
-2, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
-1, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
-1, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
-1, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
-1, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
0, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
0, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
0, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
0, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
1, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
1, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
1, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
1, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
2, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
2, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
2, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
2, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5,
3, -4.002473, -6.292515, 0, -0.5, 0.5, 0.5,
3, -4.002473, -6.292515, 1, -0.5, 0.5, 0.5,
3, -4.002473, -6.292515, 1, 1.5, 0.5, 0.5,
3, -4.002473, -6.292515, 0, 1.5, 0.5, 0.5
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
-3.879805, -3, -5.463763,
-3.879805, 3, -5.463763,
-3.879805, -3, -5.463763,
-4.058165, -3, -5.740013,
-3.879805, -2, -5.463763,
-4.058165, -2, -5.740013,
-3.879805, -1, -5.463763,
-4.058165, -1, -5.740013,
-3.879805, 0, -5.463763,
-4.058165, 0, -5.740013,
-3.879805, 1, -5.463763,
-4.058165, 1, -5.740013,
-3.879805, 2, -5.463763,
-4.058165, 2, -5.740013,
-3.879805, 3, -5.463763,
-4.058165, 3, -5.740013
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
-4.414885, -3, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, -3, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, -3, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, -3, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, -2, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, -2, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, -2, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, -2, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, -1, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, -1, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, -1, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, -1, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, 0, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, 0, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, 0, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, 0, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, 1, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, 1, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, 1, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, 1, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, 2, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, 2, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, 2, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, 2, -6.292515, 0, 1.5, 0.5, 0.5,
-4.414885, 3, -6.292515, 0, -0.5, 0.5, 0.5,
-4.414885, 3, -6.292515, 1, -0.5, 0.5, 0.5,
-4.414885, 3, -6.292515, 1, 1.5, 0.5, 0.5,
-4.414885, 3, -6.292515, 0, 1.5, 0.5, 0.5
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
-3.879805, -3.492611, -4,
-3.879805, -3.492611, 4,
-3.879805, -3.492611, -4,
-4.058165, -3.662565, -4,
-3.879805, -3.492611, -2,
-4.058165, -3.662565, -2,
-3.879805, -3.492611, 0,
-4.058165, -3.662565, 0,
-3.879805, -3.492611, 2,
-4.058165, -3.662565, 2,
-3.879805, -3.492611, 4,
-4.058165, -3.662565, 4
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
-4.414885, -4.002473, -4, 0, -0.5, 0.5, 0.5,
-4.414885, -4.002473, -4, 1, -0.5, 0.5, 0.5,
-4.414885, -4.002473, -4, 1, 1.5, 0.5, 0.5,
-4.414885, -4.002473, -4, 0, 1.5, 0.5, 0.5,
-4.414885, -4.002473, -2, 0, -0.5, 0.5, 0.5,
-4.414885, -4.002473, -2, 1, -0.5, 0.5, 0.5,
-4.414885, -4.002473, -2, 1, 1.5, 0.5, 0.5,
-4.414885, -4.002473, -2, 0, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 0, 0, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 0, 1, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 0, 1, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 0, 0, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 2, 0, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 2, 1, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 2, 1, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 2, 0, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 4, 0, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 4, 1, -0.5, 0.5, 0.5,
-4.414885, -4.002473, 4, 1, 1.5, 0.5, 0.5,
-4.414885, -4.002473, 4, 0, 1.5, 0.5, 0.5
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
-3.879805, -3.492611, -5.463763,
-3.879805, 3.305558, -5.463763,
-3.879805, -3.492611, 5.58627,
-3.879805, 3.305558, 5.58627,
-3.879805, -3.492611, -5.463763,
-3.879805, -3.492611, 5.58627,
-3.879805, 3.305558, -5.463763,
-3.879805, 3.305558, 5.58627,
-3.879805, -3.492611, -5.463763,
3.254593, -3.492611, -5.463763,
-3.879805, -3.492611, 5.58627,
3.254593, -3.492611, 5.58627,
-3.879805, 3.305558, -5.463763,
3.254593, 3.305558, -5.463763,
-3.879805, 3.305558, 5.58627,
3.254593, 3.305558, 5.58627,
3.254593, -3.492611, -5.463763,
3.254593, 3.305558, -5.463763,
3.254593, -3.492611, 5.58627,
3.254593, 3.305558, 5.58627,
3.254593, -3.492611, -5.463763,
3.254593, -3.492611, 5.58627,
3.254593, 3.305558, -5.463763,
3.254593, 3.305558, 5.58627
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
var radius = 7.906122;
var distance = 35.17523;
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
mvMatrix.translate( 0.3126063, 0.09352612, -0.06125355 );
mvMatrix.scale( 1.198175, 1.257435, 0.7735954 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17523);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


