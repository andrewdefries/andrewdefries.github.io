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
-3.218666, 0.2522016, 0.3658458, 1, 0, 0, 1,
-3.032292, 0.7730179, -0.6747729, 1, 0.007843138, 0, 1,
-2.810972, -0.9457484, -3.504898, 1, 0.01176471, 0, 1,
-2.5892, -1.541648, -3.647672, 1, 0.01960784, 0, 1,
-2.547651, -0.001303243, 0.3279875, 1, 0.02352941, 0, 1,
-2.541234, -0.4954245, -1.668168, 1, 0.03137255, 0, 1,
-2.445249, -1.395473, -1.772744, 1, 0.03529412, 0, 1,
-2.43333, -0.3167877, -2.116465, 1, 0.04313726, 0, 1,
-2.395313, 0.9494024, -0.2472417, 1, 0.04705882, 0, 1,
-2.389577, 0.9270623, -0.6734011, 1, 0.05490196, 0, 1,
-2.377941, -1.237719, -2.984167, 1, 0.05882353, 0, 1,
-2.365635, -0.7165753, 0.388273, 1, 0.06666667, 0, 1,
-2.353788, -0.1944241, -0.3635078, 1, 0.07058824, 0, 1,
-2.333062, -0.6266049, -1.714866, 1, 0.07843138, 0, 1,
-2.314828, -1.055678, -1.577826, 1, 0.08235294, 0, 1,
-2.286502, 0.2072722, -1.734864, 1, 0.09019608, 0, 1,
-2.235205, -0.8237744, -3.208466, 1, 0.09411765, 0, 1,
-2.2188, 1.034541, -0.6667286, 1, 0.1019608, 0, 1,
-2.212349, -0.1233761, -0.8816732, 1, 0.1098039, 0, 1,
-2.160445, -0.6874372, -2.033199, 1, 0.1137255, 0, 1,
-2.145825, -0.4614531, -0.8187438, 1, 0.1215686, 0, 1,
-2.135735, 0.1467578, -1.973281, 1, 0.1254902, 0, 1,
-2.101477, -0.6093693, -2.774243, 1, 0.1333333, 0, 1,
-2.084532, 0.5193532, -1.900082, 1, 0.1372549, 0, 1,
-2.081913, 0.03324617, -1.738355, 1, 0.145098, 0, 1,
-2.078056, 2.199724, -2.111718, 1, 0.1490196, 0, 1,
-2.057276, 0.5577481, -1.954597, 1, 0.1568628, 0, 1,
-2.056998, -1.444711, -2.141585, 1, 0.1607843, 0, 1,
-1.996213, -0.1723549, -2.024384, 1, 0.1686275, 0, 1,
-1.929592, -1.975117, -4.488345, 1, 0.172549, 0, 1,
-1.921589, -0.6712502, -1.547806, 1, 0.1803922, 0, 1,
-1.907905, -0.03984223, -3.862663, 1, 0.1843137, 0, 1,
-1.860786, 0.3254207, -1.20037, 1, 0.1921569, 0, 1,
-1.834869, -0.5745938, -1.86048, 1, 0.1960784, 0, 1,
-1.824731, 1.219932, -1.127571, 1, 0.2039216, 0, 1,
-1.816749, -1.443327, -3.499461, 1, 0.2117647, 0, 1,
-1.803347, -0.1892522, -0.1302669, 1, 0.2156863, 0, 1,
-1.794175, -0.7686284, -3.108418, 1, 0.2235294, 0, 1,
-1.790936, 1.135685, -1.19055, 1, 0.227451, 0, 1,
-1.780399, 0.1412737, 1.151711, 1, 0.2352941, 0, 1,
-1.776826, -1.173175, -2.280967, 1, 0.2392157, 0, 1,
-1.747006, 0.0182921, 0.1175813, 1, 0.2470588, 0, 1,
-1.732183, 0.6352496, -0.600498, 1, 0.2509804, 0, 1,
-1.729229, -0.7905497, -3.007082, 1, 0.2588235, 0, 1,
-1.707368, 0.01109378, -2.00723, 1, 0.2627451, 0, 1,
-1.693412, -1.605215, -2.104805, 1, 0.2705882, 0, 1,
-1.691843, -0.1914811, -0.2295993, 1, 0.2745098, 0, 1,
-1.680373, -0.2438298, 0.07554374, 1, 0.282353, 0, 1,
-1.634978, 0.5649977, -0.3641661, 1, 0.2862745, 0, 1,
-1.632823, -1.360142, -1.761586, 1, 0.2941177, 0, 1,
-1.632449, 0.4559059, -0.8153459, 1, 0.3019608, 0, 1,
-1.631585, 0.9929488, -1.544856, 1, 0.3058824, 0, 1,
-1.631251, -1.502569, -2.916322, 1, 0.3137255, 0, 1,
-1.624682, 0.0665447, 0.6700574, 1, 0.3176471, 0, 1,
-1.619396, 0.545011, -1.944069, 1, 0.3254902, 0, 1,
-1.615203, 0.8742854, -0.6619611, 1, 0.3294118, 0, 1,
-1.606371, -0.1375384, -1.049138, 1, 0.3372549, 0, 1,
-1.601959, 0.6569721, 0.4121532, 1, 0.3411765, 0, 1,
-1.593213, -1.808424, -1.897216, 1, 0.3490196, 0, 1,
-1.581248, 2.509575, 0.2925405, 1, 0.3529412, 0, 1,
-1.576437, -0.3857847, -2.740661, 1, 0.3607843, 0, 1,
-1.575456, 0.2999049, -0.8566232, 1, 0.3647059, 0, 1,
-1.549769, 0.5999016, -1.006842, 1, 0.372549, 0, 1,
-1.5468, 0.3308652, -0.6831192, 1, 0.3764706, 0, 1,
-1.533718, 0.9166117, -1.523856, 1, 0.3843137, 0, 1,
-1.532385, 0.6423846, -0.6619495, 1, 0.3882353, 0, 1,
-1.53101, 0.4608915, -2.235905, 1, 0.3960784, 0, 1,
-1.525817, 1.842394, -1.546862, 1, 0.4039216, 0, 1,
-1.502735, -0.01410976, -1.095402, 1, 0.4078431, 0, 1,
-1.500878, -0.9415583, -2.256238, 1, 0.4156863, 0, 1,
-1.500673, -0.5425758, -2.158588, 1, 0.4196078, 0, 1,
-1.495586, -2.978989, -2.251812, 1, 0.427451, 0, 1,
-1.487331, -0.9115598, -0.2154725, 1, 0.4313726, 0, 1,
-1.48591, -0.05413926, -1.185857, 1, 0.4392157, 0, 1,
-1.483845, 1.018369, -0.1753648, 1, 0.4431373, 0, 1,
-1.48225, -0.4347863, -0.9198465, 1, 0.4509804, 0, 1,
-1.475901, 0.4988021, -1.702305, 1, 0.454902, 0, 1,
-1.471623, -1.310198, -3.242625, 1, 0.4627451, 0, 1,
-1.471299, -0.2714554, -2.196718, 1, 0.4666667, 0, 1,
-1.467991, 0.09327921, -0.3323936, 1, 0.4745098, 0, 1,
-1.446004, -1.521048, -2.316504, 1, 0.4784314, 0, 1,
-1.441394, 1.779612, -0.05407134, 1, 0.4862745, 0, 1,
-1.440961, 1.000293, 1.400909, 1, 0.4901961, 0, 1,
-1.435425, -0.8428408, -1.218607, 1, 0.4980392, 0, 1,
-1.422875, -1.579187, -1.996004, 1, 0.5058824, 0, 1,
-1.422587, 1.116929, -0.3591164, 1, 0.509804, 0, 1,
-1.400649, 0.1604806, -1.337872, 1, 0.5176471, 0, 1,
-1.397524, 0.8303148, -0.7060179, 1, 0.5215687, 0, 1,
-1.388244, 0.2039413, -0.7689611, 1, 0.5294118, 0, 1,
-1.382213, 0.8082368, -1.039018, 1, 0.5333334, 0, 1,
-1.368707, -1.554408, -3.082036, 1, 0.5411765, 0, 1,
-1.359178, 0.6012629, -1.13042, 1, 0.5450981, 0, 1,
-1.356534, -0.356357, -1.611121, 1, 0.5529412, 0, 1,
-1.340414, 0.1448722, -1.877638, 1, 0.5568628, 0, 1,
-1.333788, -0.6856669, -2.037946, 1, 0.5647059, 0, 1,
-1.332019, 0.8190629, 0.5449539, 1, 0.5686275, 0, 1,
-1.330996, 1.827363, 1.027968, 1, 0.5764706, 0, 1,
-1.330786, -1.36111, -1.941, 1, 0.5803922, 0, 1,
-1.309371, -0.3084559, -0.6072419, 1, 0.5882353, 0, 1,
-1.301753, 3.139741, -0.2357707, 1, 0.5921569, 0, 1,
-1.286811, 1.429381, -1.543486, 1, 0.6, 0, 1,
-1.286742, -0.5246048, -3.475449, 1, 0.6078432, 0, 1,
-1.285895, 0.2069787, -2.486377, 1, 0.6117647, 0, 1,
-1.283503, 1.257, -1.931864, 1, 0.6196079, 0, 1,
-1.281508, 0.3031573, -0.8630185, 1, 0.6235294, 0, 1,
-1.279686, -0.05126693, -1.664069, 1, 0.6313726, 0, 1,
-1.273624, 0.4479161, -0.9511213, 1, 0.6352941, 0, 1,
-1.258937, 0.3723702, -1.30615, 1, 0.6431373, 0, 1,
-1.257261, 0.4793824, -2.261945, 1, 0.6470588, 0, 1,
-1.255152, 0.6126907, -0.8657194, 1, 0.654902, 0, 1,
-1.248762, 1.117134, -1.427816, 1, 0.6588235, 0, 1,
-1.241256, -0.2876258, -0.8350287, 1, 0.6666667, 0, 1,
-1.228151, 0.7651929, 0.5169274, 1, 0.6705883, 0, 1,
-1.226584, 1.857706, -1.415666, 1, 0.6784314, 0, 1,
-1.22238, 0.3648193, -1.753269, 1, 0.682353, 0, 1,
-1.22015, -0.1960192, -0.1021624, 1, 0.6901961, 0, 1,
-1.210929, -0.2818827, -2.077215, 1, 0.6941177, 0, 1,
-1.205593, -0.5830402, -2.892338, 1, 0.7019608, 0, 1,
-1.201843, -0.7889339, -0.5229869, 1, 0.7098039, 0, 1,
-1.20104, -0.7370595, -2.147104, 1, 0.7137255, 0, 1,
-1.186654, -1.012666, -2.840097, 1, 0.7215686, 0, 1,
-1.183832, 0.2640664, -1.022054, 1, 0.7254902, 0, 1,
-1.164729, 1.083615, 0.2002915, 1, 0.7333333, 0, 1,
-1.154113, 0.5729754, 0.5503762, 1, 0.7372549, 0, 1,
-1.15003, -0.1403857, -2.117429, 1, 0.7450981, 0, 1,
-1.143143, -0.7836981, -0.9235213, 1, 0.7490196, 0, 1,
-1.136731, 1.156779, -1.923085, 1, 0.7568628, 0, 1,
-1.128097, -1.116042, -2.421638, 1, 0.7607843, 0, 1,
-1.107874, -0.4060761, -1.598721, 1, 0.7686275, 0, 1,
-1.105675, 1.207307, 0.04773874, 1, 0.772549, 0, 1,
-1.104322, 2.411431, -0.5804242, 1, 0.7803922, 0, 1,
-1.098417, 0.1896427, -2.787922, 1, 0.7843137, 0, 1,
-1.094969, -0.7473139, -2.505874, 1, 0.7921569, 0, 1,
-1.092474, -1.141887, -3.337335, 1, 0.7960784, 0, 1,
-1.092319, -0.5953311, -3.700911, 1, 0.8039216, 0, 1,
-1.092232, 0.4836182, 0.2329715, 1, 0.8117647, 0, 1,
-1.091713, 1.31457, -0.8747622, 1, 0.8156863, 0, 1,
-1.086278, -0.331379, -1.650618, 1, 0.8235294, 0, 1,
-1.084152, 0.4000549, -1.738489, 1, 0.827451, 0, 1,
-1.082286, -0.0788335, -1.990211, 1, 0.8352941, 0, 1,
-1.074643, 0.1601018, -2.713868, 1, 0.8392157, 0, 1,
-1.070731, 1.268118, -0.04349722, 1, 0.8470588, 0, 1,
-1.069525, -0.5920776, -3.143317, 1, 0.8509804, 0, 1,
-1.069073, -0.1716315, -1.630829, 1, 0.8588235, 0, 1,
-1.068172, 2.469314, 0.8233725, 1, 0.8627451, 0, 1,
-1.062026, 0.3919871, -2.801496, 1, 0.8705882, 0, 1,
-1.059271, 0.9995261, -1.145204, 1, 0.8745098, 0, 1,
-1.056893, 0.602152, -0.6828734, 1, 0.8823529, 0, 1,
-1.05409, 0.0647976, -1.30469, 1, 0.8862745, 0, 1,
-1.043496, 1.687282, -0.29046, 1, 0.8941177, 0, 1,
-1.04115, 0.9520379, -2.310504, 1, 0.8980392, 0, 1,
-1.034782, 0.3265841, -2.026555, 1, 0.9058824, 0, 1,
-1.029783, -0.4871442, -2.984384, 1, 0.9137255, 0, 1,
-1.024973, -1.00403, -1.361788, 1, 0.9176471, 0, 1,
-1.017652, 0.9935066, -1.965208, 1, 0.9254902, 0, 1,
-1.015048, 1.341904, -2.049361, 1, 0.9294118, 0, 1,
-1.007091, 0.8206693, -0.8773838, 1, 0.9372549, 0, 1,
-1.003253, 1.857545, 0.8634128, 1, 0.9411765, 0, 1,
-1.003241, 0.7181926, -0.4353516, 1, 0.9490196, 0, 1,
-1.001536, 0.2093983, -1.890114, 1, 0.9529412, 0, 1,
-0.9887025, 0.858936, -0.6948938, 1, 0.9607843, 0, 1,
-0.974387, -0.5986344, -3.49138, 1, 0.9647059, 0, 1,
-0.9718782, -1.189665, -3.390002, 1, 0.972549, 0, 1,
-0.9708482, 1.29902, -0.3136783, 1, 0.9764706, 0, 1,
-0.9704064, -1.055375, -0.965076, 1, 0.9843137, 0, 1,
-0.9651732, -0.2935827, 0.8909771, 1, 0.9882353, 0, 1,
-0.960147, -1.064513, -1.698915, 1, 0.9960784, 0, 1,
-0.9518555, 0.3293573, -1.047114, 0.9960784, 1, 0, 1,
-0.9497693, -0.7877979, -1.558108, 0.9921569, 1, 0, 1,
-0.942806, -0.1977407, -0.9887065, 0.9843137, 1, 0, 1,
-0.9425672, -0.5223024, -1.02585, 0.9803922, 1, 0, 1,
-0.9423531, -0.9783732, -3.257794, 0.972549, 1, 0, 1,
-0.9417335, 0.3564798, 0.6740553, 0.9686275, 1, 0, 1,
-0.9372422, 0.05380354, -2.583456, 0.9607843, 1, 0, 1,
-0.9363345, -0.938051, -2.859679, 0.9568627, 1, 0, 1,
-0.9353778, 0.6091127, -1.108526, 0.9490196, 1, 0, 1,
-0.9343954, 0.4416064, -1.927021, 0.945098, 1, 0, 1,
-0.9338524, 2.314666, -0.08625422, 0.9372549, 1, 0, 1,
-0.9287344, -0.09834433, -1.256618, 0.9333333, 1, 0, 1,
-0.9252117, 0.3265371, -1.397448, 0.9254902, 1, 0, 1,
-0.9243819, -0.0750301, -2.389416, 0.9215686, 1, 0, 1,
-0.9164577, 0.1842023, 0.08887646, 0.9137255, 1, 0, 1,
-0.9149796, 0.6137953, -0.7499793, 0.9098039, 1, 0, 1,
-0.9135159, -0.6726427, -3.185438, 0.9019608, 1, 0, 1,
-0.9085072, -2.630182, -3.895336, 0.8941177, 1, 0, 1,
-0.894738, 1.253326, -0.9860727, 0.8901961, 1, 0, 1,
-0.8938149, -0.7893341, -2.299937, 0.8823529, 1, 0, 1,
-0.8844485, 0.03243035, -2.346539, 0.8784314, 1, 0, 1,
-0.8834817, 0.3120934, -2.094165, 0.8705882, 1, 0, 1,
-0.8817455, -0.2501373, -3.431624, 0.8666667, 1, 0, 1,
-0.8762434, -1.111241, -1.538228, 0.8588235, 1, 0, 1,
-0.8730072, 1.044921, -3.358397, 0.854902, 1, 0, 1,
-0.8719923, 0.1595751, -0.6557306, 0.8470588, 1, 0, 1,
-0.8698817, 0.2062377, -2.629178, 0.8431373, 1, 0, 1,
-0.8659524, -1.397044, -2.144737, 0.8352941, 1, 0, 1,
-0.8625228, 0.8740938, 0.02316959, 0.8313726, 1, 0, 1,
-0.861361, -0.3784886, -2.01945, 0.8235294, 1, 0, 1,
-0.8588462, -1.173633, -2.867809, 0.8196079, 1, 0, 1,
-0.8586755, -1.106362, -2.012887, 0.8117647, 1, 0, 1,
-0.8569648, 1.28433, -0.788271, 0.8078431, 1, 0, 1,
-0.8549006, 0.1190507, 1.69146, 0.8, 1, 0, 1,
-0.8501134, -0.2618489, -1.730457, 0.7921569, 1, 0, 1,
-0.847455, 0.2687022, -0.8064781, 0.7882353, 1, 0, 1,
-0.8468311, 1.275093, -1.09311, 0.7803922, 1, 0, 1,
-0.8462923, -0.7706731, -2.204079, 0.7764706, 1, 0, 1,
-0.8457327, 1.633557, -1.302888, 0.7686275, 1, 0, 1,
-0.842123, -0.266119, -0.9419168, 0.7647059, 1, 0, 1,
-0.8410286, -1.421925, -1.089142, 0.7568628, 1, 0, 1,
-0.8349434, -1.728589, -3.546491, 0.7529412, 1, 0, 1,
-0.8333657, 0.6429798, -0.4696877, 0.7450981, 1, 0, 1,
-0.831499, -0.3474398, -2.755189, 0.7411765, 1, 0, 1,
-0.8273888, 0.1488809, -1.40907, 0.7333333, 1, 0, 1,
-0.8183393, 0.8717057, -1.132174, 0.7294118, 1, 0, 1,
-0.8156799, 0.8113918, 0.09593612, 0.7215686, 1, 0, 1,
-0.81206, 0.8874279, -0.6534131, 0.7176471, 1, 0, 1,
-0.8113754, 1.012298, -0.6977578, 0.7098039, 1, 0, 1,
-0.8060104, -0.5736557, -3.436503, 0.7058824, 1, 0, 1,
-0.8058093, 2.38838, 0.4604112, 0.6980392, 1, 0, 1,
-0.7980347, -0.7029188, -1.861349, 0.6901961, 1, 0, 1,
-0.7891102, -0.3742658, -2.473637, 0.6862745, 1, 0, 1,
-0.7890416, -1.310331, -5.062715, 0.6784314, 1, 0, 1,
-0.7824636, -0.2642533, -1.563105, 0.6745098, 1, 0, 1,
-0.7821921, -0.2930577, -1.937183, 0.6666667, 1, 0, 1,
-0.7821248, 0.6838163, -0.4087673, 0.6627451, 1, 0, 1,
-0.7810372, 0.3042074, -0.7331877, 0.654902, 1, 0, 1,
-0.7799463, 1.661412, 1.01343, 0.6509804, 1, 0, 1,
-0.778059, 0.519551, 0.185936, 0.6431373, 1, 0, 1,
-0.7744411, 0.1075519, -0.4333349, 0.6392157, 1, 0, 1,
-0.7719064, 1.530263, -0.1956724, 0.6313726, 1, 0, 1,
-0.7688478, 1.760455, -0.613756, 0.627451, 1, 0, 1,
-0.7669498, -0.09247398, -3.271065, 0.6196079, 1, 0, 1,
-0.7649159, 0.6229547, -1.871875, 0.6156863, 1, 0, 1,
-0.7583448, -0.2567708, -1.834952, 0.6078432, 1, 0, 1,
-0.7578785, 0.7618751, 0.4477243, 0.6039216, 1, 0, 1,
-0.7558292, -0.4070091, -1.985073, 0.5960785, 1, 0, 1,
-0.744451, -0.5194965, -1.439457, 0.5882353, 1, 0, 1,
-0.7443995, -0.9924317, -1.352745, 0.5843138, 1, 0, 1,
-0.7398295, -1.690511, -1.491684, 0.5764706, 1, 0, 1,
-0.7380841, -0.413856, -3.714293, 0.572549, 1, 0, 1,
-0.736808, 0.8305227, 0.2416249, 0.5647059, 1, 0, 1,
-0.7332682, -0.3741218, -0.8126592, 0.5607843, 1, 0, 1,
-0.7282639, 1.007797, -1.830733, 0.5529412, 1, 0, 1,
-0.7275661, -0.5153111, 0.1231301, 0.5490196, 1, 0, 1,
-0.726424, -0.9373523, -1.824419, 0.5411765, 1, 0, 1,
-0.7246037, 0.9879584, -0.6189281, 0.5372549, 1, 0, 1,
-0.7224464, 0.7694446, -0.7350884, 0.5294118, 1, 0, 1,
-0.715232, 1.39145, 0.1569688, 0.5254902, 1, 0, 1,
-0.709847, -0.2185776, -2.874147, 0.5176471, 1, 0, 1,
-0.7041463, 2.599166, 0.4280319, 0.5137255, 1, 0, 1,
-0.7035061, 0.4555318, -1.348978, 0.5058824, 1, 0, 1,
-0.6972504, 0.5303555, -0.2491418, 0.5019608, 1, 0, 1,
-0.6953114, 0.3832803, -0.07506487, 0.4941176, 1, 0, 1,
-0.6945258, -0.3617081, -2.25731, 0.4862745, 1, 0, 1,
-0.6885489, 0.08107508, -1.226456, 0.4823529, 1, 0, 1,
-0.6845506, -0.2972945, -2.798231, 0.4745098, 1, 0, 1,
-0.6817256, -1.399896, -2.232109, 0.4705882, 1, 0, 1,
-0.6803222, 0.399995, -0.7879985, 0.4627451, 1, 0, 1,
-0.6682361, 2.085238, 1.462495, 0.4588235, 1, 0, 1,
-0.6647443, 0.1512981, -1.40362, 0.4509804, 1, 0, 1,
-0.6624044, 0.979009, -0.236085, 0.4470588, 1, 0, 1,
-0.6519744, -0.3493749, -2.708454, 0.4392157, 1, 0, 1,
-0.6518484, 1.532062, -1.262005, 0.4352941, 1, 0, 1,
-0.643778, 0.5227339, -0.9822736, 0.427451, 1, 0, 1,
-0.629551, -0.1379246, -1.367528, 0.4235294, 1, 0, 1,
-0.6273672, 0.7719932, -0.6576295, 0.4156863, 1, 0, 1,
-0.624655, -0.8392914, -1.733321, 0.4117647, 1, 0, 1,
-0.6245666, 1.874333, -0.5768316, 0.4039216, 1, 0, 1,
-0.6242688, -1.278895, -1.74144, 0.3960784, 1, 0, 1,
-0.6116365, -0.3394563, -1.28261, 0.3921569, 1, 0, 1,
-0.6105502, 1.850153, -0.4431013, 0.3843137, 1, 0, 1,
-0.6006024, 0.1615786, -0.1420911, 0.3803922, 1, 0, 1,
-0.600032, 0.5607671, -1.136913, 0.372549, 1, 0, 1,
-0.5972089, 0.4371388, 1.625495, 0.3686275, 1, 0, 1,
-0.5902975, -0.4570611, -1.762624, 0.3607843, 1, 0, 1,
-0.5871822, -0.3537776, -0.1242819, 0.3568628, 1, 0, 1,
-0.5845791, -0.8363527, -1.586353, 0.3490196, 1, 0, 1,
-0.5838847, 0.1261252, -2.237241, 0.345098, 1, 0, 1,
-0.5806941, 1.712376, -0.7850872, 0.3372549, 1, 0, 1,
-0.5731283, -0.8212507, -1.138453, 0.3333333, 1, 0, 1,
-0.5691013, 0.3587753, -1.343983, 0.3254902, 1, 0, 1,
-0.5678204, -0.1709571, -3.823787, 0.3215686, 1, 0, 1,
-0.5661051, -0.2103362, -2.112128, 0.3137255, 1, 0, 1,
-0.5660299, -0.454581, -0.2659623, 0.3098039, 1, 0, 1,
-0.5514001, 1.042769, -1.130982, 0.3019608, 1, 0, 1,
-0.5487249, -0.536505, -4.309731, 0.2941177, 1, 0, 1,
-0.54426, -0.09181628, -3.00324, 0.2901961, 1, 0, 1,
-0.5409576, -2.309011, -1.633003, 0.282353, 1, 0, 1,
-0.5376124, -1.616365, -3.205208, 0.2784314, 1, 0, 1,
-0.5370215, -1.063458, -2.240211, 0.2705882, 1, 0, 1,
-0.5323798, -1.992007, -3.533045, 0.2666667, 1, 0, 1,
-0.5287962, -0.4817761, -2.261369, 0.2588235, 1, 0, 1,
-0.5241064, -0.6446522, -2.859725, 0.254902, 1, 0, 1,
-0.5198967, -1.572236, -0.3822535, 0.2470588, 1, 0, 1,
-0.5182894, 0.1552139, -0.7824461, 0.2431373, 1, 0, 1,
-0.5172284, -0.7742315, -3.82292, 0.2352941, 1, 0, 1,
-0.5128326, -0.02359364, -1.689051, 0.2313726, 1, 0, 1,
-0.5058911, 0.8460921, -0.7502131, 0.2235294, 1, 0, 1,
-0.4996806, -0.1686615, -1.705566, 0.2196078, 1, 0, 1,
-0.4959237, 0.4523587, -1.873081, 0.2117647, 1, 0, 1,
-0.4956935, -2.127497, -2.449439, 0.2078431, 1, 0, 1,
-0.4951229, 0.8865828, -1.159062, 0.2, 1, 0, 1,
-0.4947653, 0.9407428, 2.888419, 0.1921569, 1, 0, 1,
-0.492895, -0.5699853, -3.521387, 0.1882353, 1, 0, 1,
-0.4897667, 0.6027444, -0.07823007, 0.1803922, 1, 0, 1,
-0.4848152, -0.500052, -1.616205, 0.1764706, 1, 0, 1,
-0.4829161, 0.05082091, -0.1075304, 0.1686275, 1, 0, 1,
-0.4784311, -0.5664853, -4.658738, 0.1647059, 1, 0, 1,
-0.476487, 0.06352814, -0.8341112, 0.1568628, 1, 0, 1,
-0.4741972, -1.18607, -2.401587, 0.1529412, 1, 0, 1,
-0.4738759, 0.2421783, -1.444878, 0.145098, 1, 0, 1,
-0.4726969, -0.845111, -0.7505246, 0.1411765, 1, 0, 1,
-0.4721892, -0.4848387, -0.8468625, 0.1333333, 1, 0, 1,
-0.4720087, -0.8553194, -0.7011313, 0.1294118, 1, 0, 1,
-0.4699135, -2.079316, -3.278779, 0.1215686, 1, 0, 1,
-0.4614637, 0.05870144, -0.8172067, 0.1176471, 1, 0, 1,
-0.4608402, 0.4533753, -1.812741, 0.1098039, 1, 0, 1,
-0.4606599, 1.014877, 0.07374174, 0.1058824, 1, 0, 1,
-0.4574578, 0.1336229, -1.588073, 0.09803922, 1, 0, 1,
-0.4521194, 0.01331455, -2.109673, 0.09019608, 1, 0, 1,
-0.4509295, -0.4972692, -2.468329, 0.08627451, 1, 0, 1,
-0.4506841, -1.451992, -2.037553, 0.07843138, 1, 0, 1,
-0.450158, -0.9754816, -2.647179, 0.07450981, 1, 0, 1,
-0.4468168, 0.2518761, -1.084317, 0.06666667, 1, 0, 1,
-0.4459977, -0.8719916, -2.923918, 0.0627451, 1, 0, 1,
-0.4451883, -1.977897, -1.764118, 0.05490196, 1, 0, 1,
-0.4391073, -1.070255, -4.855206, 0.05098039, 1, 0, 1,
-0.4264972, -0.9430797, -3.495219, 0.04313726, 1, 0, 1,
-0.4246532, -1.134567, -2.366266, 0.03921569, 1, 0, 1,
-0.4239138, 0.08624954, -0.3272298, 0.03137255, 1, 0, 1,
-0.4218563, 0.03287819, -0.7769098, 0.02745098, 1, 0, 1,
-0.4208972, 0.7064869, 0.1764013, 0.01960784, 1, 0, 1,
-0.4208355, -1.98358, -3.1088, 0.01568628, 1, 0, 1,
-0.4120887, -0.02172449, -2.323022, 0.007843138, 1, 0, 1,
-0.4107237, 0.9728988, -1.24568, 0.003921569, 1, 0, 1,
-0.4072524, -0.01259923, -1.49618, 0, 1, 0.003921569, 1,
-0.4052172, -0.1626382, 0.334868, 0, 1, 0.01176471, 1,
-0.4033096, -0.596215, -2.509917, 0, 1, 0.01568628, 1,
-0.4032674, 0.5238291, -0.7673391, 0, 1, 0.02352941, 1,
-0.402632, 1.920581, 0.3414766, 0, 1, 0.02745098, 1,
-0.3989604, -1.475325, -2.518772, 0, 1, 0.03529412, 1,
-0.398804, 0.3934222, 0.4465856, 0, 1, 0.03921569, 1,
-0.3950441, 0.39523, -1.753778, 0, 1, 0.04705882, 1,
-0.3940315, 0.1910243, -0.5815883, 0, 1, 0.05098039, 1,
-0.3936187, 1.460907, 0.8778002, 0, 1, 0.05882353, 1,
-0.3884298, 0.4832464, -0.9819925, 0, 1, 0.0627451, 1,
-0.3836829, -2.042367, -2.205964, 0, 1, 0.07058824, 1,
-0.3831826, 0.7812079, -0.3330418, 0, 1, 0.07450981, 1,
-0.3793469, 0.9816641, 0.7431644, 0, 1, 0.08235294, 1,
-0.3742712, -0.4126439, -2.822014, 0, 1, 0.08627451, 1,
-0.3725502, -0.1488041, -1.074613, 0, 1, 0.09411765, 1,
-0.369231, -0.5300825, -4.567896, 0, 1, 0.1019608, 1,
-0.3629903, 1.59464, 1.183347, 0, 1, 0.1058824, 1,
-0.3618006, 0.2562882, -2.289723, 0, 1, 0.1137255, 1,
-0.3594702, 0.6845552, -0.2057145, 0, 1, 0.1176471, 1,
-0.3592376, 0.142369, -1.821669, 0, 1, 0.1254902, 1,
-0.3568454, 2.517894, -1.751202, 0, 1, 0.1294118, 1,
-0.3450347, 1.140636, -0.6817477, 0, 1, 0.1372549, 1,
-0.3443622, 0.2500124, -1.4051, 0, 1, 0.1411765, 1,
-0.344225, 0.4089631, -1.048007, 0, 1, 0.1490196, 1,
-0.3375088, -0.08172195, 0.8346834, 0, 1, 0.1529412, 1,
-0.3362621, 0.3734373, 0.3202706, 0, 1, 0.1607843, 1,
-0.3316327, -1.238922, -1.736904, 0, 1, 0.1647059, 1,
-0.3307564, 0.6709016, -0.02040456, 0, 1, 0.172549, 1,
-0.3252211, 2.297249, 0.9881684, 0, 1, 0.1764706, 1,
-0.321337, 1.246775, 0.04931953, 0, 1, 0.1843137, 1,
-0.3185979, 0.729865, -0.8977677, 0, 1, 0.1882353, 1,
-0.3182741, -2.113073, -4.68699, 0, 1, 0.1960784, 1,
-0.3148924, -2.271178, -4.550255, 0, 1, 0.2039216, 1,
-0.3145307, 0.4649485, 0.9085566, 0, 1, 0.2078431, 1,
-0.3131962, 0.6374345, 1.136039, 0, 1, 0.2156863, 1,
-0.3043009, 0.6146248, -0.4523232, 0, 1, 0.2196078, 1,
-0.3018658, 2.37913, -0.7685472, 0, 1, 0.227451, 1,
-0.2953941, 0.7530286, 1.711415, 0, 1, 0.2313726, 1,
-0.293308, -0.81511, -3.589582, 0, 1, 0.2392157, 1,
-0.2925403, 1.653824, -0.2945896, 0, 1, 0.2431373, 1,
-0.2872102, -0.2091983, -1.36569, 0, 1, 0.2509804, 1,
-0.2819614, 1.025666, -2.248319, 0, 1, 0.254902, 1,
-0.2781465, -0.8763365, -3.435452, 0, 1, 0.2627451, 1,
-0.2780634, 0.2439835, -0.6602855, 0, 1, 0.2666667, 1,
-0.2764432, -0.6866414, -1.174841, 0, 1, 0.2745098, 1,
-0.2755095, -0.05630187, -2.038363, 0, 1, 0.2784314, 1,
-0.2748075, 2.532791, -1.464293, 0, 1, 0.2862745, 1,
-0.2737487, 2.473642, 0.3241108, 0, 1, 0.2901961, 1,
-0.2722214, 2.132712, 0.7323897, 0, 1, 0.2980392, 1,
-0.2707259, 0.4037285, 0.3106289, 0, 1, 0.3058824, 1,
-0.2703521, 1.773255, -1.019105, 0, 1, 0.3098039, 1,
-0.2677037, -0.5156464, -2.477659, 0, 1, 0.3176471, 1,
-0.2674771, -1.138767, -3.723173, 0, 1, 0.3215686, 1,
-0.2670056, 1.686995, -0.2435491, 0, 1, 0.3294118, 1,
-0.2652187, 3.018416, 0.106692, 0, 1, 0.3333333, 1,
-0.2612336, 0.1023382, -1.51286, 0, 1, 0.3411765, 1,
-0.2607116, -1.086846, -3.960638, 0, 1, 0.345098, 1,
-0.2596242, 1.438424, -1.844439, 0, 1, 0.3529412, 1,
-0.2590176, 0.1152675, -1.386168, 0, 1, 0.3568628, 1,
-0.2541291, 0.4223202, -0.2105396, 0, 1, 0.3647059, 1,
-0.2537394, -0.3918968, -3.403861, 0, 1, 0.3686275, 1,
-0.247954, -0.5629619, -2.651826, 0, 1, 0.3764706, 1,
-0.2427304, 1.824578, 0.6983716, 0, 1, 0.3803922, 1,
-0.2418617, 1.827772, -0.3945813, 0, 1, 0.3882353, 1,
-0.2374217, 1.622501, -0.07532308, 0, 1, 0.3921569, 1,
-0.234655, 0.08956133, -1.939007, 0, 1, 0.4, 1,
-0.2334009, -1.763374, -2.367179, 0, 1, 0.4078431, 1,
-0.2331557, 1.156792, -0.08344194, 0, 1, 0.4117647, 1,
-0.2320553, 0.4017477, -1.459742, 0, 1, 0.4196078, 1,
-0.2293452, 1.172924, -1.660914, 0, 1, 0.4235294, 1,
-0.2254155, -0.5742644, -3.47732, 0, 1, 0.4313726, 1,
-0.223254, -0.9364225, -1.845494, 0, 1, 0.4352941, 1,
-0.2215099, -0.3525445, -1.424089, 0, 1, 0.4431373, 1,
-0.2175362, 0.9547551, 0.2651837, 0, 1, 0.4470588, 1,
-0.2075182, 1.897347, -0.2518918, 0, 1, 0.454902, 1,
-0.2068463, -0.7594953, -3.081517, 0, 1, 0.4588235, 1,
-0.2052825, -0.3425297, -3.48725, 0, 1, 0.4666667, 1,
-0.204369, -0.852931, -2.750409, 0, 1, 0.4705882, 1,
-0.2035632, -0.153362, -1.480729, 0, 1, 0.4784314, 1,
-0.2004209, 0.9344653, 0.08621424, 0, 1, 0.4823529, 1,
-0.1991641, 1.093083, 0.292669, 0, 1, 0.4901961, 1,
-0.1931019, 1.470693, 1.146687, 0, 1, 0.4941176, 1,
-0.1926307, -1.347809, -3.998405, 0, 1, 0.5019608, 1,
-0.1924864, 0.33726, -0.4648978, 0, 1, 0.509804, 1,
-0.1906587, -1.329374, -2.560704, 0, 1, 0.5137255, 1,
-0.1902722, 0.8619127, 0.9855043, 0, 1, 0.5215687, 1,
-0.1874585, 1.328802, 0.5638247, 0, 1, 0.5254902, 1,
-0.1869651, 0.1368435, 0.08556613, 0, 1, 0.5333334, 1,
-0.1856396, 0.453107, -1.907659, 0, 1, 0.5372549, 1,
-0.1845401, 1.586261, 0.3119162, 0, 1, 0.5450981, 1,
-0.1830849, -1.01062, -1.385652, 0, 1, 0.5490196, 1,
-0.1790034, -1.033398, -3.914838, 0, 1, 0.5568628, 1,
-0.1755213, -0.5371733, -3.358657, 0, 1, 0.5607843, 1,
-0.1732946, 1.40936, -0.2391355, 0, 1, 0.5686275, 1,
-0.1727883, 0.2007307, 0.1133893, 0, 1, 0.572549, 1,
-0.1706023, -1.182028, -3.979816, 0, 1, 0.5803922, 1,
-0.1691855, 2.526615, -0.1386123, 0, 1, 0.5843138, 1,
-0.1631734, -0.6790187, -3.601375, 0, 1, 0.5921569, 1,
-0.1629853, -0.269853, -2.60399, 0, 1, 0.5960785, 1,
-0.1619634, -1.099011, -2.660154, 0, 1, 0.6039216, 1,
-0.1617534, -1.761331, -3.141033, 0, 1, 0.6117647, 1,
-0.1538392, 0.4462412, -0.7815895, 0, 1, 0.6156863, 1,
-0.1537926, -1.332507, -1.972392, 0, 1, 0.6235294, 1,
-0.151637, -0.8558558, -4.768676, 0, 1, 0.627451, 1,
-0.1420099, -1.859399, -2.537578, 0, 1, 0.6352941, 1,
-0.1388961, 0.9552463, 0.1958713, 0, 1, 0.6392157, 1,
-0.1322036, 0.7998281, 0.9521914, 0, 1, 0.6470588, 1,
-0.1320646, 0.4336017, 0.1102142, 0, 1, 0.6509804, 1,
-0.1317309, -0.3835291, -3.16524, 0, 1, 0.6588235, 1,
-0.1296282, -0.396728, -1.713879, 0, 1, 0.6627451, 1,
-0.1288618, -0.3568911, -3.309689, 0, 1, 0.6705883, 1,
-0.1284719, -0.7301676, -3.165242, 0, 1, 0.6745098, 1,
-0.1165957, -0.395873, -1.131545, 0, 1, 0.682353, 1,
-0.1129865, 1.6114, 2.201026, 0, 1, 0.6862745, 1,
-0.109651, -1.217556, -2.078175, 0, 1, 0.6941177, 1,
-0.1086883, 1.108049, -2.185297, 0, 1, 0.7019608, 1,
-0.09488337, -0.3844547, -3.733102, 0, 1, 0.7058824, 1,
-0.08924764, 0.2796081, -1.415751, 0, 1, 0.7137255, 1,
-0.089155, -1.472657, -2.936872, 0, 1, 0.7176471, 1,
-0.08794142, -0.543399, -2.613477, 0, 1, 0.7254902, 1,
-0.08456498, -0.1314025, -2.637502, 0, 1, 0.7294118, 1,
-0.07986496, -0.8688104, -3.02178, 0, 1, 0.7372549, 1,
-0.07827897, -0.3635757, -2.056963, 0, 1, 0.7411765, 1,
-0.07581607, -1.549941, -3.43906, 0, 1, 0.7490196, 1,
-0.07427436, -0.04472299, -0.7071592, 0, 1, 0.7529412, 1,
-0.0712867, -0.946628, -3.536621, 0, 1, 0.7607843, 1,
-0.07122161, 1.867123, 1.362021, 0, 1, 0.7647059, 1,
-0.07043558, 0.4211183, 1.150454, 0, 1, 0.772549, 1,
-0.06830885, -1.806169, -3.678611, 0, 1, 0.7764706, 1,
-0.06783912, -0.5056614, -2.947834, 0, 1, 0.7843137, 1,
-0.06506852, -0.8903409, -3.069761, 0, 1, 0.7882353, 1,
-0.06146962, -0.8364308, -2.948593, 0, 1, 0.7960784, 1,
-0.05855342, 1.170808, 0.8693075, 0, 1, 0.8039216, 1,
-0.05155233, 0.4293846, 1.033579, 0, 1, 0.8078431, 1,
-0.04583049, -1.013002, -3.84096, 0, 1, 0.8156863, 1,
-0.04413111, -0.1841521, -3.229757, 0, 1, 0.8196079, 1,
-0.04384981, 0.8591954, -0.2663901, 0, 1, 0.827451, 1,
-0.0411173, -0.4249595, -2.682987, 0, 1, 0.8313726, 1,
-0.03942147, 0.4782095, -1.644587, 0, 1, 0.8392157, 1,
-0.03769004, -0.0103621, -3.226918, 0, 1, 0.8431373, 1,
-0.03705655, -0.6589929, -2.884, 0, 1, 0.8509804, 1,
-0.03461198, 0.6469368, -0.2823632, 0, 1, 0.854902, 1,
-0.03423729, -1.048409, -3.038072, 0, 1, 0.8627451, 1,
-0.03295965, -0.895436, -2.594726, 0, 1, 0.8666667, 1,
-0.03254472, 0.6169543, 0.0474226, 0, 1, 0.8745098, 1,
-0.03220798, 1.143079, 1.419543, 0, 1, 0.8784314, 1,
-0.02633069, -0.6605474, -2.292257, 0, 1, 0.8862745, 1,
-0.02421715, 0.8006486, 0.06841731, 0, 1, 0.8901961, 1,
-0.0234086, 0.3154922, -1.119974, 0, 1, 0.8980392, 1,
-0.02303142, 1.317561, -0.166433, 0, 1, 0.9058824, 1,
-0.02238148, 1.063924, 1.76399, 0, 1, 0.9098039, 1,
-0.01791629, 1.063377, 1.812309, 0, 1, 0.9176471, 1,
-0.01763092, 0.03446912, -0.7429446, 0, 1, 0.9215686, 1,
-0.01700793, 1.774462, -0.3256641, 0, 1, 0.9294118, 1,
-0.01593716, 0.3864787, -0.07461544, 0, 1, 0.9333333, 1,
-0.01303862, 1.206141, -2.035052, 0, 1, 0.9411765, 1,
-0.009385346, 1.067499, -0.9385771, 0, 1, 0.945098, 1,
-0.007521501, 0.7062486, -0.8455958, 0, 1, 0.9529412, 1,
-0.002739985, 0.3586237, -1.581609, 0, 1, 0.9568627, 1,
-0.000925199, 1.871186, -0.1137656, 0, 1, 0.9647059, 1,
-0.0008925733, 0.2056678, 1.310178, 0, 1, 0.9686275, 1,
0.004251571, -0.3277018, 4.48598, 0, 1, 0.9764706, 1,
0.005570204, 1.778927, 0.04310553, 0, 1, 0.9803922, 1,
0.01192935, 0.4168707, -0.3116554, 0, 1, 0.9882353, 1,
0.01678999, -1.937663, 3.959165, 0, 1, 0.9921569, 1,
0.03455732, -0.1205437, 2.758121, 0, 1, 1, 1,
0.03479808, -0.1701802, 2.189086, 0, 0.9921569, 1, 1,
0.03492336, 0.0824145, 0.2363364, 0, 0.9882353, 1, 1,
0.03660331, -0.3918819, 2.063185, 0, 0.9803922, 1, 1,
0.04046663, 0.1963104, -0.4667812, 0, 0.9764706, 1, 1,
0.04155408, -1.788044, 4.585432, 0, 0.9686275, 1, 1,
0.04163933, 1.603425, 1.546627, 0, 0.9647059, 1, 1,
0.04187236, 2.41288, -0.09898751, 0, 0.9568627, 1, 1,
0.04341473, 0.9140647, -0.756157, 0, 0.9529412, 1, 1,
0.04346678, -1.546329, 2.78302, 0, 0.945098, 1, 1,
0.04580988, -0.1550683, 2.024266, 0, 0.9411765, 1, 1,
0.04606886, -0.58614, 3.080461, 0, 0.9333333, 1, 1,
0.04707474, -0.1196764, 3.445348, 0, 0.9294118, 1, 1,
0.05389254, -0.02368649, 0.133524, 0, 0.9215686, 1, 1,
0.05398879, 0.8521091, 0.9878276, 0, 0.9176471, 1, 1,
0.05543516, -1.333058, 3.846653, 0, 0.9098039, 1, 1,
0.05624312, -0.733842, 1.826374, 0, 0.9058824, 1, 1,
0.05743892, -0.2665659, 4.031312, 0, 0.8980392, 1, 1,
0.06108101, -1.779638, 2.673415, 0, 0.8901961, 1, 1,
0.06148375, -1.690793, 2.540661, 0, 0.8862745, 1, 1,
0.06150345, -0.6247123, 0.1947905, 0, 0.8784314, 1, 1,
0.06166377, 1.463968, -0.6813693, 0, 0.8745098, 1, 1,
0.06894828, 0.172814, -2.116896, 0, 0.8666667, 1, 1,
0.06900571, 0.2360323, 0.02939933, 0, 0.8627451, 1, 1,
0.07052742, -1.14193, 3.454172, 0, 0.854902, 1, 1,
0.07110315, 1.102247, -0.05737419, 0, 0.8509804, 1, 1,
0.07666042, 0.9577212, 0.57242, 0, 0.8431373, 1, 1,
0.07686961, -0.5720811, 1.224891, 0, 0.8392157, 1, 1,
0.0845411, 0.2240692, 1.328755, 0, 0.8313726, 1, 1,
0.0861584, 0.304426, 0.8929703, 0, 0.827451, 1, 1,
0.08687607, 1.342535, 1.376316, 0, 0.8196079, 1, 1,
0.090785, 0.3536506, 1.289615, 0, 0.8156863, 1, 1,
0.0982639, 0.8152801, -1.003233, 0, 0.8078431, 1, 1,
0.1010185, -0.9694741, 4.174082, 0, 0.8039216, 1, 1,
0.1018112, 0.01014432, 1.257326, 0, 0.7960784, 1, 1,
0.1032427, 0.8902842, 0.5988255, 0, 0.7882353, 1, 1,
0.1041518, 2.806654, -2.287365, 0, 0.7843137, 1, 1,
0.1048659, 2.140139, -1.070811, 0, 0.7764706, 1, 1,
0.1066294, 2.873816, -0.5595011, 0, 0.772549, 1, 1,
0.1154413, 0.7070512, -0.389431, 0, 0.7647059, 1, 1,
0.1165339, -0.5002159, 2.6459, 0, 0.7607843, 1, 1,
0.1165487, 0.9835889, -0.1547287, 0, 0.7529412, 1, 1,
0.11716, -1.052281, 3.32796, 0, 0.7490196, 1, 1,
0.1211309, -0.583854, 3.38195, 0, 0.7411765, 1, 1,
0.1231252, -0.6229368, 3.845856, 0, 0.7372549, 1, 1,
0.1255042, -2.207855, 3.535236, 0, 0.7294118, 1, 1,
0.1263323, 0.6099242, 1.294641, 0, 0.7254902, 1, 1,
0.1271015, 0.8659591, -0.2404695, 0, 0.7176471, 1, 1,
0.1319627, -1.090334, 4.192796, 0, 0.7137255, 1, 1,
0.1415378, 0.6333661, 3.208853, 0, 0.7058824, 1, 1,
0.1453903, 0.7461106, 0.7317027, 0, 0.6980392, 1, 1,
0.1463755, -0.4476421, 1.745091, 0, 0.6941177, 1, 1,
0.152403, -0.1638535, 1.464189, 0, 0.6862745, 1, 1,
0.1549997, -0.05976635, 4.459258, 0, 0.682353, 1, 1,
0.1554972, -0.1233521, 1.757666, 0, 0.6745098, 1, 1,
0.1570281, -0.5488466, 1.755159, 0, 0.6705883, 1, 1,
0.1581058, -0.9936134, 2.515476, 0, 0.6627451, 1, 1,
0.1592136, -0.6619959, 4.276927, 0, 0.6588235, 1, 1,
0.161265, 0.6278423, 0.4763824, 0, 0.6509804, 1, 1,
0.1651164, -1.214889, 1.325114, 0, 0.6470588, 1, 1,
0.1674206, 1.027665, 0.2491667, 0, 0.6392157, 1, 1,
0.1683161, 0.3694603, 1.173347, 0, 0.6352941, 1, 1,
0.1711607, -1.016667, 4.359563, 0, 0.627451, 1, 1,
0.1737168, 0.2272863, 1.038872, 0, 0.6235294, 1, 1,
0.1791758, 2.186393, 0.1697922, 0, 0.6156863, 1, 1,
0.1807844, 0.2242358, 1.498785, 0, 0.6117647, 1, 1,
0.1843744, -1.01732, 3.582585, 0, 0.6039216, 1, 1,
0.1900466, -2.179877, 4.515422, 0, 0.5960785, 1, 1,
0.1921529, 1.103626, 0.7213201, 0, 0.5921569, 1, 1,
0.1926507, 0.2941659, 0.1786091, 0, 0.5843138, 1, 1,
0.2054673, -0.01085986, 1.575024, 0, 0.5803922, 1, 1,
0.2100349, -0.1732822, 2.055327, 0, 0.572549, 1, 1,
0.2141925, -1.03052, 1.860753, 0, 0.5686275, 1, 1,
0.2196367, -0.3691138, 2.418291, 0, 0.5607843, 1, 1,
0.2202763, 0.09637886, 1.599042, 0, 0.5568628, 1, 1,
0.2254982, -0.565546, 1.090358, 0, 0.5490196, 1, 1,
0.2264368, -0.8039917, 3.490395, 0, 0.5450981, 1, 1,
0.2298868, 0.4838985, -0.4391513, 0, 0.5372549, 1, 1,
0.230028, -1.495102, 3.693698, 0, 0.5333334, 1, 1,
0.2302283, 0.9978038, -0.4473707, 0, 0.5254902, 1, 1,
0.2320683, 1.849353, 0.8172321, 0, 0.5215687, 1, 1,
0.2361431, 1.505219, -0.2124512, 0, 0.5137255, 1, 1,
0.2372361, -1.507716, 2.364972, 0, 0.509804, 1, 1,
0.2473908, -0.1263724, 2.005612, 0, 0.5019608, 1, 1,
0.2478271, -0.5029262, 1.337563, 0, 0.4941176, 1, 1,
0.249897, -0.7157342, 2.219157, 0, 0.4901961, 1, 1,
0.2499908, -1.151313, 3.752802, 0, 0.4823529, 1, 1,
0.2537009, 1.342015, 1.84974, 0, 0.4784314, 1, 1,
0.2562423, 1.449392, 0.7457635, 0, 0.4705882, 1, 1,
0.2562897, 2.009764, 2.034123, 0, 0.4666667, 1, 1,
0.2636467, 1.088336, -1.023885, 0, 0.4588235, 1, 1,
0.2639507, 0.05298382, 1.379581, 0, 0.454902, 1, 1,
0.2655514, -0.8253416, 1.741092, 0, 0.4470588, 1, 1,
0.265969, -0.8739843, 2.979076, 0, 0.4431373, 1, 1,
0.2706714, 0.7913931, -0.9834576, 0, 0.4352941, 1, 1,
0.2712413, -0.3286047, 4.039456, 0, 0.4313726, 1, 1,
0.2747821, -0.1374176, 4.21145, 0, 0.4235294, 1, 1,
0.2773091, 0.3229786, 2.466822, 0, 0.4196078, 1, 1,
0.2797434, -0.6202541, 1.775069, 0, 0.4117647, 1, 1,
0.2814043, -1.151785, 3.746784, 0, 0.4078431, 1, 1,
0.2823581, -1.476668, 1.516013, 0, 0.4, 1, 1,
0.285419, 0.6484398, -0.3915375, 0, 0.3921569, 1, 1,
0.2872384, -0.4561871, 4.763077, 0, 0.3882353, 1, 1,
0.2895605, -0.6217172, 4.0126, 0, 0.3803922, 1, 1,
0.294835, 2.294093, 1.491857, 0, 0.3764706, 1, 1,
0.2991181, -0.734654, 3.150621, 0, 0.3686275, 1, 1,
0.2994158, -2.206088, 4.983094, 0, 0.3647059, 1, 1,
0.3028433, 0.8510261, -1.148496, 0, 0.3568628, 1, 1,
0.3035662, 2.205444, -0.6710994, 0, 0.3529412, 1, 1,
0.3042862, -1.123275, 3.922898, 0, 0.345098, 1, 1,
0.3065038, -0.2810954, 4.346442, 0, 0.3411765, 1, 1,
0.3079945, 0.7166596, 0.8301528, 0, 0.3333333, 1, 1,
0.3082168, -0.6784205, 0.797249, 0, 0.3294118, 1, 1,
0.3086871, 1.293346, -0.2124229, 0, 0.3215686, 1, 1,
0.3090287, 1.634839, 2.230653, 0, 0.3176471, 1, 1,
0.3137286, 0.2616902, -0.705735, 0, 0.3098039, 1, 1,
0.3191485, -0.9024689, 2.843573, 0, 0.3058824, 1, 1,
0.320553, 0.5782202, 0.223793, 0, 0.2980392, 1, 1,
0.3216923, -0.6493385, 3.194334, 0, 0.2901961, 1, 1,
0.3238757, 0.2019809, 0.6961299, 0, 0.2862745, 1, 1,
0.3239381, -0.2987534, 1.982112, 0, 0.2784314, 1, 1,
0.324433, -1.711261, 2.025918, 0, 0.2745098, 1, 1,
0.3249667, -0.2797669, 3.08735, 0, 0.2666667, 1, 1,
0.3252676, 0.2295279, 1.362621, 0, 0.2627451, 1, 1,
0.3254872, 0.4572067, 0.6371214, 0, 0.254902, 1, 1,
0.3268525, 0.8878493, -0.8463291, 0, 0.2509804, 1, 1,
0.3310705, -1.218389, 2.898499, 0, 0.2431373, 1, 1,
0.3329701, 0.1748815, 2.166976, 0, 0.2392157, 1, 1,
0.3341326, -0.4514714, 3.057385, 0, 0.2313726, 1, 1,
0.3363197, 0.4468198, 0.6125752, 0, 0.227451, 1, 1,
0.3365115, 1.224819, -1.002349, 0, 0.2196078, 1, 1,
0.3366178, 2.175781, -0.8298583, 0, 0.2156863, 1, 1,
0.3370987, -1.426183, 1.350609, 0, 0.2078431, 1, 1,
0.3382477, -1.450026, 2.627812, 0, 0.2039216, 1, 1,
0.3435965, -0.1781698, 1.536112, 0, 0.1960784, 1, 1,
0.3468032, 0.57942, 0.09369601, 0, 0.1882353, 1, 1,
0.3471916, 1.9025, -0.645439, 0, 0.1843137, 1, 1,
0.3485118, -0.2406228, 0.687288, 0, 0.1764706, 1, 1,
0.3541247, 0.7738528, 0.6966479, 0, 0.172549, 1, 1,
0.3609041, -1.109108, 1.87828, 0, 0.1647059, 1, 1,
0.3635202, -0.1172982, 1.094546, 0, 0.1607843, 1, 1,
0.3636015, -0.4694314, 3.070357, 0, 0.1529412, 1, 1,
0.3656462, 1.051063, 0.2494151, 0, 0.1490196, 1, 1,
0.3702292, 1.878045, -1.200346, 0, 0.1411765, 1, 1,
0.374741, -0.4161676, 2.206405, 0, 0.1372549, 1, 1,
0.3757161, 1.897218, -0.3611884, 0, 0.1294118, 1, 1,
0.3757783, -0.3754633, 2.256422, 0, 0.1254902, 1, 1,
0.3771232, -0.9745087, 3.946298, 0, 0.1176471, 1, 1,
0.3779896, -0.3211963, 2.383665, 0, 0.1137255, 1, 1,
0.3792837, -0.3144266, 1.185062, 0, 0.1058824, 1, 1,
0.3860118, -0.8007901, 3.106663, 0, 0.09803922, 1, 1,
0.4059168, -1.443402, 3.844599, 0, 0.09411765, 1, 1,
0.4070239, 0.2342526, 0.6487344, 0, 0.08627451, 1, 1,
0.408076, 1.738434, 0.6819719, 0, 0.08235294, 1, 1,
0.4096109, -2.353729, 4.329425, 0, 0.07450981, 1, 1,
0.409734, 1.135416, 2.939273, 0, 0.07058824, 1, 1,
0.4114799, -0.9972265, 3.618434, 0, 0.0627451, 1, 1,
0.4132496, 1.027375, -0.009256998, 0, 0.05882353, 1, 1,
0.4225072, 1.750102, 0.2784348, 0, 0.05098039, 1, 1,
0.4291803, 0.392086, 2.284405, 0, 0.04705882, 1, 1,
0.4294935, -0.4877052, 4.238781, 0, 0.03921569, 1, 1,
0.4321741, 0.5842067, 0.08604241, 0, 0.03529412, 1, 1,
0.4323742, -0.5245911, 1.662844, 0, 0.02745098, 1, 1,
0.4325528, 0.2301668, 0.2669971, 0, 0.02352941, 1, 1,
0.4374251, -0.7331519, 0.6851726, 0, 0.01568628, 1, 1,
0.440978, -0.2093771, 1.894089, 0, 0.01176471, 1, 1,
0.4410958, 0.7263438, 2.009223, 0, 0.003921569, 1, 1,
0.4436607, 1.942311, 1.915434, 0.003921569, 0, 1, 1,
0.456964, -0.7645586, 4.177689, 0.007843138, 0, 1, 1,
0.4576063, -0.240558, 1.616226, 0.01568628, 0, 1, 1,
0.4589282, 1.91152, -0.2785867, 0.01960784, 0, 1, 1,
0.4659811, -0.06381836, 2.578331, 0.02745098, 0, 1, 1,
0.4667735, 1.947662, 0.08674853, 0.03137255, 0, 1, 1,
0.4669035, 0.9840495, -1.172704, 0.03921569, 0, 1, 1,
0.4719745, -0.7008601, 0.7865356, 0.04313726, 0, 1, 1,
0.4819827, 0.6093834, 0.8972707, 0.05098039, 0, 1, 1,
0.4871312, 0.6153265, 0.4064925, 0.05490196, 0, 1, 1,
0.4885793, 1.659254, -1.009292, 0.0627451, 0, 1, 1,
0.4890532, 0.3483725, 0.9497039, 0.06666667, 0, 1, 1,
0.489761, 0.2718679, -0.4460045, 0.07450981, 0, 1, 1,
0.4905428, -0.6057601, 2.99869, 0.07843138, 0, 1, 1,
0.4908158, -0.1270937, 2.212396, 0.08627451, 0, 1, 1,
0.4924945, -1.137993, 4.011616, 0.09019608, 0, 1, 1,
0.4940147, 0.01366355, 0.3916878, 0.09803922, 0, 1, 1,
0.4971553, 0.4430586, 0.6806774, 0.1058824, 0, 1, 1,
0.498625, 1.027906, -0.904456, 0.1098039, 0, 1, 1,
0.4999157, -0.1102503, 2.335141, 0.1176471, 0, 1, 1,
0.5013318, -0.3341238, 2.26954, 0.1215686, 0, 1, 1,
0.5058063, 0.8171104, 0.3197916, 0.1294118, 0, 1, 1,
0.5074812, -0.1480731, 1.961481, 0.1333333, 0, 1, 1,
0.5084769, 1.131618, -0.8474919, 0.1411765, 0, 1, 1,
0.5086846, 0.4811747, 1.151889, 0.145098, 0, 1, 1,
0.5096121, -1.090526, 3.054539, 0.1529412, 0, 1, 1,
0.5106451, -1.063062, 2.109885, 0.1568628, 0, 1, 1,
0.5195971, -0.724251, 2.920169, 0.1647059, 0, 1, 1,
0.5209094, 0.3028, -0.1828739, 0.1686275, 0, 1, 1,
0.5309267, 0.8812932, 2.119288, 0.1764706, 0, 1, 1,
0.5351854, 2.418923, -0.9372081, 0.1803922, 0, 1, 1,
0.5372537, 1.2637, 0.03144876, 0.1882353, 0, 1, 1,
0.5385332, -0.9132052, 4.29975, 0.1921569, 0, 1, 1,
0.5395995, -0.987004, 1.995818, 0.2, 0, 1, 1,
0.5405254, -0.7768901, 1.632971, 0.2078431, 0, 1, 1,
0.5416074, 0.3169304, 0.577088, 0.2117647, 0, 1, 1,
0.5425496, 1.199243, -0.8242338, 0.2196078, 0, 1, 1,
0.5449024, 1.112629, -0.9615489, 0.2235294, 0, 1, 1,
0.5552469, 0.7068003, -1.529418, 0.2313726, 0, 1, 1,
0.5599257, 1.727231, 0.1350622, 0.2352941, 0, 1, 1,
0.5652404, -0.4815625, 2.132247, 0.2431373, 0, 1, 1,
0.5807711, 0.6556708, 0.3614101, 0.2470588, 0, 1, 1,
0.580777, -0.365962, 3.274137, 0.254902, 0, 1, 1,
0.5812266, 0.3228011, 1.931123, 0.2588235, 0, 1, 1,
0.5822218, -1.198193, 3.346466, 0.2666667, 0, 1, 1,
0.5868475, 0.4844941, 0.730723, 0.2705882, 0, 1, 1,
0.5960385, 0.1643176, 2.213056, 0.2784314, 0, 1, 1,
0.6048306, 1.43816, 0.1635905, 0.282353, 0, 1, 1,
0.606503, 1.158373, 0.7542562, 0.2901961, 0, 1, 1,
0.6175272, 0.0702341, 0.506613, 0.2941177, 0, 1, 1,
0.6177388, -0.6395065, 2.229281, 0.3019608, 0, 1, 1,
0.6227267, 0.5585406, 1.149841, 0.3098039, 0, 1, 1,
0.62321, 0.574214, 1.132655, 0.3137255, 0, 1, 1,
0.627071, -0.594032, 1.46374, 0.3215686, 0, 1, 1,
0.6292856, 0.2482773, 1.916855, 0.3254902, 0, 1, 1,
0.6294484, 1.707938, 1.777927, 0.3333333, 0, 1, 1,
0.6365452, -0.05118151, 2.159599, 0.3372549, 0, 1, 1,
0.6365962, -1.211543, 5.158455, 0.345098, 0, 1, 1,
0.6385289, 2.040067, 0.0005067149, 0.3490196, 0, 1, 1,
0.6401953, -2.550689, 2.742775, 0.3568628, 0, 1, 1,
0.6403416, 0.04033645, 2.371291, 0.3607843, 0, 1, 1,
0.6502709, -0.8640809, 1.077901, 0.3686275, 0, 1, 1,
0.6546457, 1.169859, -1.599948, 0.372549, 0, 1, 1,
0.6577449, 0.8203437, 0.4225714, 0.3803922, 0, 1, 1,
0.6639547, -0.5560216, 4.347349, 0.3843137, 0, 1, 1,
0.6649917, -0.1524145, 1.696798, 0.3921569, 0, 1, 1,
0.6700905, -0.5371631, 3.402105, 0.3960784, 0, 1, 1,
0.670431, -0.4897523, 0.7506322, 0.4039216, 0, 1, 1,
0.6707223, 1.748834, -0.6139795, 0.4117647, 0, 1, 1,
0.6752981, -0.2806967, 2.329871, 0.4156863, 0, 1, 1,
0.6753429, 0.3064367, 2.082806, 0.4235294, 0, 1, 1,
0.6779496, -1.093732, 2.003161, 0.427451, 0, 1, 1,
0.6797348, 1.193152, -0.3975102, 0.4352941, 0, 1, 1,
0.6841874, 0.5016661, -0.7770876, 0.4392157, 0, 1, 1,
0.6881335, 0.9690031, -0.9058449, 0.4470588, 0, 1, 1,
0.6936469, 1.838007, 0.4831319, 0.4509804, 0, 1, 1,
0.6948485, 0.1090684, 1.369727, 0.4588235, 0, 1, 1,
0.6954339, -0.9085417, 6.049749, 0.4627451, 0, 1, 1,
0.6989256, -1.423236, 3.401913, 0.4705882, 0, 1, 1,
0.7049159, 1.941489, 2.371469, 0.4745098, 0, 1, 1,
0.7059832, 0.7042159, 1.105276, 0.4823529, 0, 1, 1,
0.7076226, 0.3711564, 1.992359, 0.4862745, 0, 1, 1,
0.7086571, -0.2243282, 1.845091, 0.4941176, 0, 1, 1,
0.710646, 1.156365, -0.1212404, 0.5019608, 0, 1, 1,
0.7112314, -0.5230939, 1.513134, 0.5058824, 0, 1, 1,
0.7172983, -0.1936586, -0.07446625, 0.5137255, 0, 1, 1,
0.7265974, -0.944963, 0.6055172, 0.5176471, 0, 1, 1,
0.7266156, -1.024297, 1.817727, 0.5254902, 0, 1, 1,
0.7319077, 1.123749, 1.003778, 0.5294118, 0, 1, 1,
0.7330903, -0.7208704, 2.585233, 0.5372549, 0, 1, 1,
0.7361591, 0.2550063, 3.714293, 0.5411765, 0, 1, 1,
0.7375754, -1.190739, 4.348007, 0.5490196, 0, 1, 1,
0.7410179, 0.8197976, 0.1771126, 0.5529412, 0, 1, 1,
0.7441222, 0.9183993, -0.4104505, 0.5607843, 0, 1, 1,
0.7472585, 0.6309526, -0.2220174, 0.5647059, 0, 1, 1,
0.7595276, -0.8284497, 1.490773, 0.572549, 0, 1, 1,
0.7603644, -0.4422225, 2.273213, 0.5764706, 0, 1, 1,
0.7630155, -1.660338, 2.219807, 0.5843138, 0, 1, 1,
0.765137, 1.292235, 1.206736, 0.5882353, 0, 1, 1,
0.767397, 0.8723162, 0.06194242, 0.5960785, 0, 1, 1,
0.7712632, -2.181519, 2.672031, 0.6039216, 0, 1, 1,
0.7786921, 0.5748278, 1.474739, 0.6078432, 0, 1, 1,
0.7866291, 0.1330353, 2.274927, 0.6156863, 0, 1, 1,
0.7895836, -0.3066016, 3.095567, 0.6196079, 0, 1, 1,
0.7906651, -1.232704, 3.856629, 0.627451, 0, 1, 1,
0.797195, 0.5946549, 1.960203, 0.6313726, 0, 1, 1,
0.7984251, -1.069321, 2.687396, 0.6392157, 0, 1, 1,
0.799159, 0.4665518, 0.6584412, 0.6431373, 0, 1, 1,
0.8043557, 0.3425128, 0.7327363, 0.6509804, 0, 1, 1,
0.8056712, -0.4185803, 2.142165, 0.654902, 0, 1, 1,
0.8091832, -1.356708, 1.373611, 0.6627451, 0, 1, 1,
0.8122296, 0.8054058, 2.143691, 0.6666667, 0, 1, 1,
0.8153625, -0.7702847, 2.760595, 0.6745098, 0, 1, 1,
0.8184126, -1.498808, 2.739129, 0.6784314, 0, 1, 1,
0.8186016, -1.714531, 1.175156, 0.6862745, 0, 1, 1,
0.8221235, 0.2719536, 2.730424, 0.6901961, 0, 1, 1,
0.8242673, 0.3847901, -1.24294, 0.6980392, 0, 1, 1,
0.8279898, 1.256634, 0.9783114, 0.7058824, 0, 1, 1,
0.8288986, -0.5613152, 3.584675, 0.7098039, 0, 1, 1,
0.8301084, -0.8446937, 2.133247, 0.7176471, 0, 1, 1,
0.8344043, 2.089612, 0.2828857, 0.7215686, 0, 1, 1,
0.8362039, -0.5896298, 1.113557, 0.7294118, 0, 1, 1,
0.8440323, 2.510173, -1.158946, 0.7333333, 0, 1, 1,
0.8494481, -0.9614706, 2.82447, 0.7411765, 0, 1, 1,
0.8502657, 1.795141, 0.05035431, 0.7450981, 0, 1, 1,
0.8514013, 0.4045029, -1.407887, 0.7529412, 0, 1, 1,
0.8514109, -0.153239, 1.366603, 0.7568628, 0, 1, 1,
0.8531697, 0.04049628, 1.6908, 0.7647059, 0, 1, 1,
0.8565589, -2.335401, 3.780447, 0.7686275, 0, 1, 1,
0.8726532, 0.8952491, 0.1857984, 0.7764706, 0, 1, 1,
0.8741278, 0.4946546, 1.639945, 0.7803922, 0, 1, 1,
0.8754223, 2.395369, 1.53251, 0.7882353, 0, 1, 1,
0.8805704, -0.3496893, 0.9999068, 0.7921569, 0, 1, 1,
0.884016, -0.01971507, 2.991541, 0.8, 0, 1, 1,
0.8902661, -0.6818795, 0.7468846, 0.8078431, 0, 1, 1,
0.8993307, -0.9528888, 1.794143, 0.8117647, 0, 1, 1,
0.900218, 1.920409, 0.2098302, 0.8196079, 0, 1, 1,
0.9093659, -1.591709, 3.74052, 0.8235294, 0, 1, 1,
0.9098012, 0.1902638, 0.7251907, 0.8313726, 0, 1, 1,
0.9127584, -0.3073464, 2.10971, 0.8352941, 0, 1, 1,
0.9149728, 1.202801, 1.793127, 0.8431373, 0, 1, 1,
0.915249, 0.434969, 0.9474639, 0.8470588, 0, 1, 1,
0.9205813, 2.082429, 0.5923257, 0.854902, 0, 1, 1,
0.9215634, 0.8744782, 0.5111002, 0.8588235, 0, 1, 1,
0.9243084, -0.8491763, 0.562528, 0.8666667, 0, 1, 1,
0.9272686, 0.3350595, 1.84335, 0.8705882, 0, 1, 1,
0.9325745, 1.079898, 1.303062, 0.8784314, 0, 1, 1,
0.9355112, 0.05841995, 1.290062, 0.8823529, 0, 1, 1,
0.9401345, 2.028392, -0.6512762, 0.8901961, 0, 1, 1,
0.9416828, 0.6611541, -0.272689, 0.8941177, 0, 1, 1,
0.9447688, 0.03930255, 0.2526838, 0.9019608, 0, 1, 1,
0.9454092, 1.334932, 0.5180082, 0.9098039, 0, 1, 1,
0.9462023, -1.305616, 2.325844, 0.9137255, 0, 1, 1,
0.9541568, 0.0003777795, 1.352111, 0.9215686, 0, 1, 1,
0.9562728, -0.1130931, 0.8065286, 0.9254902, 0, 1, 1,
0.967066, 1.270948, -0.8495169, 0.9333333, 0, 1, 1,
0.9675746, 1.652724, 1.464191, 0.9372549, 0, 1, 1,
0.9735073, -3.103222, 2.74823, 0.945098, 0, 1, 1,
0.9794854, 1.492222, 2.056337, 0.9490196, 0, 1, 1,
0.9852644, -0.09916374, 2.521427, 0.9568627, 0, 1, 1,
0.9956555, 0.5954551, 0.959384, 0.9607843, 0, 1, 1,
1.000351, -0.5484664, 3.28573, 0.9686275, 0, 1, 1,
1.004031, -1.634128, 3.985893, 0.972549, 0, 1, 1,
1.004222, 0.4454562, 1.075205, 0.9803922, 0, 1, 1,
1.004704, -1.295317, 2.482472, 0.9843137, 0, 1, 1,
1.004787, -1.022382, 2.324625, 0.9921569, 0, 1, 1,
1.008487, -1.681194, 2.140871, 0.9960784, 0, 1, 1,
1.012408, -1.380565, 2.983923, 1, 0, 0.9960784, 1,
1.020356, -0.3212593, 1.363445, 1, 0, 0.9882353, 1,
1.027933, 0.08216785, 0.8409064, 1, 0, 0.9843137, 1,
1.029056, -0.2837845, 1.637689, 1, 0, 0.9764706, 1,
1.030678, -0.9806995, 3.215295, 1, 0, 0.972549, 1,
1.042558, -0.4399715, 0.4195408, 1, 0, 0.9647059, 1,
1.05253, 1.120151, 0.2887932, 1, 0, 0.9607843, 1,
1.059781, -0.05358687, 0.9166743, 1, 0, 0.9529412, 1,
1.060768, 0.7035087, -0.5093197, 1, 0, 0.9490196, 1,
1.063896, 1.910153, -1.216347, 1, 0, 0.9411765, 1,
1.064883, -0.3718861, 4.372874, 1, 0, 0.9372549, 1,
1.066324, -0.6051586, 1.000024, 1, 0, 0.9294118, 1,
1.068879, -0.6846063, 1.78834, 1, 0, 0.9254902, 1,
1.071602, -1.260259, 2.871087, 1, 0, 0.9176471, 1,
1.078359, -0.8688092, 2.440649, 1, 0, 0.9137255, 1,
1.081097, 1.519045, 1.538411, 1, 0, 0.9058824, 1,
1.088711, 1.157037, 0.898982, 1, 0, 0.9019608, 1,
1.09742, -1.877193, 3.619242, 1, 0, 0.8941177, 1,
1.10282, 0.597055, 0.6078897, 1, 0, 0.8862745, 1,
1.104477, 0.7120823, 1.164587, 1, 0, 0.8823529, 1,
1.113837, 0.3954612, 0.809346, 1, 0, 0.8745098, 1,
1.114973, -1.894812, 2.569877, 1, 0, 0.8705882, 1,
1.116993, 0.7578036, 1.062702, 1, 0, 0.8627451, 1,
1.124014, 0.5764389, 1.630507, 1, 0, 0.8588235, 1,
1.124564, -0.5212137, 3.738274, 1, 0, 0.8509804, 1,
1.124854, 0.7621948, 1.194086, 1, 0, 0.8470588, 1,
1.128684, 0.2103496, 3.818929, 1, 0, 0.8392157, 1,
1.133402, 0.2855016, 1.832391, 1, 0, 0.8352941, 1,
1.141174, -0.7501447, 1.269818, 1, 0, 0.827451, 1,
1.146515, 1.510573, -0.9273484, 1, 0, 0.8235294, 1,
1.147162, -2.162232, 3.142113, 1, 0, 0.8156863, 1,
1.148792, -0.8832877, 1.463177, 1, 0, 0.8117647, 1,
1.151212, -1.077499, 2.908532, 1, 0, 0.8039216, 1,
1.15865, 1.365899, -0.1122225, 1, 0, 0.7960784, 1,
1.160259, 1.083593, 0.3884354, 1, 0, 0.7921569, 1,
1.160468, -1.213576, 2.680971, 1, 0, 0.7843137, 1,
1.160768, 0.9356372, 1.691934, 1, 0, 0.7803922, 1,
1.166413, -0.3671821, 2.328737, 1, 0, 0.772549, 1,
1.175621, -1.556676, 3.704762, 1, 0, 0.7686275, 1,
1.176319, 1.140591, 1.078453, 1, 0, 0.7607843, 1,
1.177813, 0.387069, -1.195295, 1, 0, 0.7568628, 1,
1.178202, -1.460162, 2.610879, 1, 0, 0.7490196, 1,
1.181342, -1.122011, 2.40869, 1, 0, 0.7450981, 1,
1.187152, 0.1551854, 2.188397, 1, 0, 0.7372549, 1,
1.188471, -0.8963701, 2.432089, 1, 0, 0.7333333, 1,
1.189501, -0.04218409, 1.722722, 1, 0, 0.7254902, 1,
1.193572, 0.6092278, 2.359435, 1, 0, 0.7215686, 1,
1.198199, 0.4352682, 0.3821106, 1, 0, 0.7137255, 1,
1.204339, 0.3798047, 0.7769349, 1, 0, 0.7098039, 1,
1.207866, -0.471085, 2.238571, 1, 0, 0.7019608, 1,
1.212711, 0.9884573, -0.007117211, 1, 0, 0.6941177, 1,
1.213649, -1.182082, 3.108658, 1, 0, 0.6901961, 1,
1.214454, -1.014711, 0.396752, 1, 0, 0.682353, 1,
1.217159, 0.3297305, 2.616411, 1, 0, 0.6784314, 1,
1.223965, -0.9911534, 1.012566, 1, 0, 0.6705883, 1,
1.234875, -0.1548293, 2.561631, 1, 0, 0.6666667, 1,
1.235959, -1.576893, 5.327308, 1, 0, 0.6588235, 1,
1.242396, -0.1947488, 1.824002, 1, 0, 0.654902, 1,
1.248194, -0.1568362, 3.517958, 1, 0, 0.6470588, 1,
1.253992, -0.6365473, 1.542058, 1, 0, 0.6431373, 1,
1.258419, 0.5810996, 0.66765, 1, 0, 0.6352941, 1,
1.263255, -0.8964764, 3.535678, 1, 0, 0.6313726, 1,
1.264516, 1.889305, 1.442232, 1, 0, 0.6235294, 1,
1.26825, -1.217739, 1.653997, 1, 0, 0.6196079, 1,
1.27065, -1.511435, 1.134175, 1, 0, 0.6117647, 1,
1.271843, 1.665516, 1.850756, 1, 0, 0.6078432, 1,
1.283741, -0.02566906, 0.5521758, 1, 0, 0.6, 1,
1.288816, -0.6639661, 1.656473, 1, 0, 0.5921569, 1,
1.291288, -1.316994, 2.534302, 1, 0, 0.5882353, 1,
1.293457, -0.5442912, 3.88009, 1, 0, 0.5803922, 1,
1.299654, 1.54004, 1.949162, 1, 0, 0.5764706, 1,
1.300236, -0.4279706, 2.778159, 1, 0, 0.5686275, 1,
1.303552, -1.237299, 1.847198, 1, 0, 0.5647059, 1,
1.311354, -1.388886, 1.701044, 1, 0, 0.5568628, 1,
1.314023, -0.3928484, 1.787484, 1, 0, 0.5529412, 1,
1.329025, -0.5844215, 1.967263, 1, 0, 0.5450981, 1,
1.341053, 0.5906521, 0.5637605, 1, 0, 0.5411765, 1,
1.344348, 0.7042707, 0.1349355, 1, 0, 0.5333334, 1,
1.347785, -0.4309673, 3.465169, 1, 0, 0.5294118, 1,
1.35068, 0.05893918, -0.2099934, 1, 0, 0.5215687, 1,
1.351755, -1.321731, 3.166878, 1, 0, 0.5176471, 1,
1.356257, -0.1477823, 1.253104, 1, 0, 0.509804, 1,
1.366324, 0.3960845, 0.4994434, 1, 0, 0.5058824, 1,
1.373352, -0.9584938, 1.333855, 1, 0, 0.4980392, 1,
1.378427, 2.259359, 0.1807257, 1, 0, 0.4901961, 1,
1.387325, -0.6647472, 1.698148, 1, 0, 0.4862745, 1,
1.394819, 2.312736, 2.150714, 1, 0, 0.4784314, 1,
1.397985, 0.5754312, 0.9526269, 1, 0, 0.4745098, 1,
1.405827, 0.4410398, 0.2369631, 1, 0, 0.4666667, 1,
1.409245, 0.4946965, 0.5047342, 1, 0, 0.4627451, 1,
1.412714, 0.4068897, 0.3545535, 1, 0, 0.454902, 1,
1.41414, 0.2474143, 1.695449, 1, 0, 0.4509804, 1,
1.422341, -0.6235936, 0.7052779, 1, 0, 0.4431373, 1,
1.438449, -0.262641, 3.044573, 1, 0, 0.4392157, 1,
1.442089, -0.1403368, -0.02081702, 1, 0, 0.4313726, 1,
1.451157, 0.81138, 0.908418, 1, 0, 0.427451, 1,
1.457206, 0.4504059, 0.5815534, 1, 0, 0.4196078, 1,
1.46021, -0.481619, 1.93322, 1, 0, 0.4156863, 1,
1.491876, 0.01043041, 1.21695, 1, 0, 0.4078431, 1,
1.517445, 0.1547684, 2.023388, 1, 0, 0.4039216, 1,
1.524357, -0.3514144, 2.918988, 1, 0, 0.3960784, 1,
1.53007, -1.507538, 2.226473, 1, 0, 0.3882353, 1,
1.537023, -0.5668569, 1.398175, 1, 0, 0.3843137, 1,
1.539469, 1.572673, 0.250336, 1, 0, 0.3764706, 1,
1.548758, 0.4975117, 2.021398, 1, 0, 0.372549, 1,
1.551954, 1.343669, 0.8201783, 1, 0, 0.3647059, 1,
1.558416, 0.426634, -0.5961508, 1, 0, 0.3607843, 1,
1.572974, -0.6653523, 1.502125, 1, 0, 0.3529412, 1,
1.579092, 1.584274, 0.4051684, 1, 0, 0.3490196, 1,
1.582756, 0.2992199, 1.732586, 1, 0, 0.3411765, 1,
1.59868, 1.261362, 2.259771, 1, 0, 0.3372549, 1,
1.598837, 0.5372288, 2.143594, 1, 0, 0.3294118, 1,
1.610973, 0.9662313, 3.080101, 1, 0, 0.3254902, 1,
1.619016, 0.02771608, 0.6451199, 1, 0, 0.3176471, 1,
1.629931, 0.2294495, 1.599537, 1, 0, 0.3137255, 1,
1.645312, 0.01198416, 1.555622, 1, 0, 0.3058824, 1,
1.652768, -1.222234, 4.028652, 1, 0, 0.2980392, 1,
1.661887, -0.9271106, 2.192993, 1, 0, 0.2941177, 1,
1.684089, -0.1436388, 1.45238, 1, 0, 0.2862745, 1,
1.690176, 1.791681, -1.331422, 1, 0, 0.282353, 1,
1.692514, -0.839595, 1.990275, 1, 0, 0.2745098, 1,
1.714784, 0.2396573, 2.482726, 1, 0, 0.2705882, 1,
1.727123, 0.7524024, -1.13786, 1, 0, 0.2627451, 1,
1.730311, -0.571927, 0.8916943, 1, 0, 0.2588235, 1,
1.747703, -0.7394605, 3.74396, 1, 0, 0.2509804, 1,
1.755387, 0.5628368, 0.1450036, 1, 0, 0.2470588, 1,
1.763552, 0.3764456, 0.5030816, 1, 0, 0.2392157, 1,
1.764857, 1.866708, 1.757, 1, 0, 0.2352941, 1,
1.782415, 0.07097939, 1.680203, 1, 0, 0.227451, 1,
1.78472, 0.08208331, 3.255555, 1, 0, 0.2235294, 1,
1.785311, -0.614668, 2.051397, 1, 0, 0.2156863, 1,
1.79353, -0.4049347, 2.709515, 1, 0, 0.2117647, 1,
1.796886, -0.5058976, 4.159298, 1, 0, 0.2039216, 1,
1.799277, 0.6293327, -0.4479293, 1, 0, 0.1960784, 1,
1.87168, -0.6812618, 1.507727, 1, 0, 0.1921569, 1,
1.871878, -1.687542, 4.254285, 1, 0, 0.1843137, 1,
1.918292, -1.437648, 1.964254, 1, 0, 0.1803922, 1,
1.943407, -0.499328, 2.515745, 1, 0, 0.172549, 1,
1.94463, 1.449946, -1.385389, 1, 0, 0.1686275, 1,
1.964406, -1.24673, 2.670005, 1, 0, 0.1607843, 1,
1.96463, -0.4092765, 2.599848, 1, 0, 0.1568628, 1,
1.972268, -1.09455, 1.305042, 1, 0, 0.1490196, 1,
1.973653, -1.250485, 2.097506, 1, 0, 0.145098, 1,
2.000111, -0.9258561, 3.299627, 1, 0, 0.1372549, 1,
2.000489, 0.4246113, 1.108395, 1, 0, 0.1333333, 1,
2.00245, 0.1128043, 1.081298, 1, 0, 0.1254902, 1,
2.006495, 2.859663, -1.301312, 1, 0, 0.1215686, 1,
2.008456, 1.120493, 1.020859, 1, 0, 0.1137255, 1,
2.043097, -0.7527311, 0.2422396, 1, 0, 0.1098039, 1,
2.102143, -0.4746563, 1.86455, 1, 0, 0.1019608, 1,
2.127318, -0.6247986, 1.341538, 1, 0, 0.09411765, 1,
2.128965, -1.426929, 3.21003, 1, 0, 0.09019608, 1,
2.168638, -0.3768493, 1.966278, 1, 0, 0.08235294, 1,
2.1791, 2.479998, 0.05252233, 1, 0, 0.07843138, 1,
2.188544, -0.1906347, 1.089086, 1, 0, 0.07058824, 1,
2.248129, 0.3477192, 2.286686, 1, 0, 0.06666667, 1,
2.259497, 1.215015, 1.39932, 1, 0, 0.05882353, 1,
2.357049, 0.9413248, 1.267035, 1, 0, 0.05490196, 1,
2.388382, 0.1903979, 2.850647, 1, 0, 0.04705882, 1,
2.492787, 0.4897037, 0.9070845, 1, 0, 0.04313726, 1,
2.676854, -1.612008, 0.9673226, 1, 0, 0.03529412, 1,
2.69606, -1.065792, 2.0943, 1, 0, 0.03137255, 1,
2.877845, -0.01157, 2.003407, 1, 0, 0.02352941, 1,
2.961855, 0.0911762, 0.9440193, 1, 0, 0.01960784, 1,
2.992817, -1.099707, 0.5742234, 1, 0, 0.01176471, 1,
3.058732, -0.3773126, 2.906025, 1, 0, 0.007843138, 1
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
-0.0799669, -4.161405, -6.946277, 0, -0.5, 0.5, 0.5,
-0.0799669, -4.161405, -6.946277, 1, -0.5, 0.5, 0.5,
-0.0799669, -4.161405, -6.946277, 1, 1.5, 0.5, 0.5,
-0.0799669, -4.161405, -6.946277, 0, 1.5, 0.5, 0.5
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
-4.282685, 0.01825953, -6.946277, 0, -0.5, 0.5, 0.5,
-4.282685, 0.01825953, -6.946277, 1, -0.5, 0.5, 0.5,
-4.282685, 0.01825953, -6.946277, 1, 1.5, 0.5, 0.5,
-4.282685, 0.01825953, -6.946277, 0, 1.5, 0.5, 0.5
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
-4.282685, -4.161405, 0.4935174, 0, -0.5, 0.5, 0.5,
-4.282685, -4.161405, 0.4935174, 1, -0.5, 0.5, 0.5,
-4.282685, -4.161405, 0.4935174, 1, 1.5, 0.5, 0.5,
-4.282685, -4.161405, 0.4935174, 0, 1.5, 0.5, 0.5
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
-3, -3.196867, -5.229402,
3, -3.196867, -5.229402,
-3, -3.196867, -5.229402,
-3, -3.357623, -5.515547,
-2, -3.196867, -5.229402,
-2, -3.357623, -5.515547,
-1, -3.196867, -5.229402,
-1, -3.357623, -5.515547,
0, -3.196867, -5.229402,
0, -3.357623, -5.515547,
1, -3.196867, -5.229402,
1, -3.357623, -5.515547,
2, -3.196867, -5.229402,
2, -3.357623, -5.515547,
3, -3.196867, -5.229402,
3, -3.357623, -5.515547
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
-3, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
-3, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
-3, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
-3, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
-2, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
-2, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
-2, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
-2, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
-1, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
-1, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
-1, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
-1, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
0, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
0, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
0, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
0, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
1, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
1, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
1, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
1, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
2, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
2, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
2, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
2, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5,
3, -3.679136, -6.08784, 0, -0.5, 0.5, 0.5,
3, -3.679136, -6.08784, 1, -0.5, 0.5, 0.5,
3, -3.679136, -6.08784, 1, 1.5, 0.5, 0.5,
3, -3.679136, -6.08784, 0, 1.5, 0.5, 0.5
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
-3.312827, -3, -5.229402,
-3.312827, 3, -5.229402,
-3.312827, -3, -5.229402,
-3.47447, -3, -5.515547,
-3.312827, -2, -5.229402,
-3.47447, -2, -5.515547,
-3.312827, -1, -5.229402,
-3.47447, -1, -5.515547,
-3.312827, 0, -5.229402,
-3.47447, 0, -5.515547,
-3.312827, 1, -5.229402,
-3.47447, 1, -5.515547,
-3.312827, 2, -5.229402,
-3.47447, 2, -5.515547,
-3.312827, 3, -5.229402,
-3.47447, 3, -5.515547
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
-3.797756, -3, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, -3, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, -3, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, -3, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, -2, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, -2, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, -2, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, -2, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, -1, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, -1, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, -1, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, -1, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, 0, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, 0, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, 0, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, 0, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, 1, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, 1, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, 1, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, 1, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, 2, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, 2, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, 2, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, 2, -6.08784, 0, 1.5, 0.5, 0.5,
-3.797756, 3, -6.08784, 0, -0.5, 0.5, 0.5,
-3.797756, 3, -6.08784, 1, -0.5, 0.5, 0.5,
-3.797756, 3, -6.08784, 1, 1.5, 0.5, 0.5,
-3.797756, 3, -6.08784, 0, 1.5, 0.5, 0.5
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
-3.312827, -3.196867, -4,
-3.312827, -3.196867, 6,
-3.312827, -3.196867, -4,
-3.47447, -3.357623, -4,
-3.312827, -3.196867, -2,
-3.47447, -3.357623, -2,
-3.312827, -3.196867, 0,
-3.47447, -3.357623, 0,
-3.312827, -3.196867, 2,
-3.47447, -3.357623, 2,
-3.312827, -3.196867, 4,
-3.47447, -3.357623, 4,
-3.312827, -3.196867, 6,
-3.47447, -3.357623, 6
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
-3.797756, -3.679136, -4, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, -4, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, -4, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, -4, 0, 1.5, 0.5, 0.5,
-3.797756, -3.679136, -2, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, -2, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, -2, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, -2, 0, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 0, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 0, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 0, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 0, 0, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 2, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 2, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 2, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 2, 0, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 4, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 4, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 4, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 4, 0, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 6, 0, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 6, 1, -0.5, 0.5, 0.5,
-3.797756, -3.679136, 6, 1, 1.5, 0.5, 0.5,
-3.797756, -3.679136, 6, 0, 1.5, 0.5, 0.5
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
-3.312827, -3.196867, -5.229402,
-3.312827, 3.233386, -5.229402,
-3.312827, -3.196867, 6.216436,
-3.312827, 3.233386, 6.216436,
-3.312827, -3.196867, -5.229402,
-3.312827, -3.196867, 6.216436,
-3.312827, 3.233386, -5.229402,
-3.312827, 3.233386, 6.216436,
-3.312827, -3.196867, -5.229402,
3.152893, -3.196867, -5.229402,
-3.312827, -3.196867, 6.216436,
3.152893, -3.196867, 6.216436,
-3.312827, 3.233386, -5.229402,
3.152893, 3.233386, -5.229402,
-3.312827, 3.233386, 6.216436,
3.152893, 3.233386, 6.216436,
3.152893, -3.196867, -5.229402,
3.152893, 3.233386, -5.229402,
3.152893, -3.196867, 6.216436,
3.152893, 3.233386, 6.216436,
3.152893, -3.196867, -5.229402,
3.152893, -3.196867, 6.216436,
3.152893, 3.233386, -5.229402,
3.152893, 3.233386, 6.216436
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
var radius = 7.814398;
var distance = 34.76714;
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
mvMatrix.translate( 0.0799669, -0.01825953, -0.4935174 );
mvMatrix.scale( 1.30675, 1.313958, 0.7381793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76714);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
(E)-2-methoxyimino-N<-read.table("(E)-2-methoxyimino-N.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-(E)-2-methoxyimino-N$V2
```

```
## Error in eval(expr, envir, enclos): object 'E' not found
```

```r
y<-(E)-2-methoxyimino-N$V3
```

```
## Error in eval(expr, envir, enclos): object 'E' not found
```

```r
z<-(E)-2-methoxyimino-N$V4
```

```
## Error in eval(expr, envir, enclos): object 'E' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
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
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
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
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
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
var canvas = document.getElementById("testgl2textureCanvas");
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
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.218666, 0.2522016, 0.3658458, 0, 0, 1, 1, 1,
-3.032292, 0.7730179, -0.6747729, 1, 0, 0, 1, 1,
-2.810972, -0.9457484, -3.504898, 1, 0, 0, 1, 1,
-2.5892, -1.541648, -3.647672, 1, 0, 0, 1, 1,
-2.547651, -0.001303243, 0.3279875, 1, 0, 0, 1, 1,
-2.541234, -0.4954245, -1.668168, 1, 0, 0, 1, 1,
-2.445249, -1.395473, -1.772744, 0, 0, 0, 1, 1,
-2.43333, -0.3167877, -2.116465, 0, 0, 0, 1, 1,
-2.395313, 0.9494024, -0.2472417, 0, 0, 0, 1, 1,
-2.389577, 0.9270623, -0.6734011, 0, 0, 0, 1, 1,
-2.377941, -1.237719, -2.984167, 0, 0, 0, 1, 1,
-2.365635, -0.7165753, 0.388273, 0, 0, 0, 1, 1,
-2.353788, -0.1944241, -0.3635078, 0, 0, 0, 1, 1,
-2.333062, -0.6266049, -1.714866, 1, 1, 1, 1, 1,
-2.314828, -1.055678, -1.577826, 1, 1, 1, 1, 1,
-2.286502, 0.2072722, -1.734864, 1, 1, 1, 1, 1,
-2.235205, -0.8237744, -3.208466, 1, 1, 1, 1, 1,
-2.2188, 1.034541, -0.6667286, 1, 1, 1, 1, 1,
-2.212349, -0.1233761, -0.8816732, 1, 1, 1, 1, 1,
-2.160445, -0.6874372, -2.033199, 1, 1, 1, 1, 1,
-2.145825, -0.4614531, -0.8187438, 1, 1, 1, 1, 1,
-2.135735, 0.1467578, -1.973281, 1, 1, 1, 1, 1,
-2.101477, -0.6093693, -2.774243, 1, 1, 1, 1, 1,
-2.084532, 0.5193532, -1.900082, 1, 1, 1, 1, 1,
-2.081913, 0.03324617, -1.738355, 1, 1, 1, 1, 1,
-2.078056, 2.199724, -2.111718, 1, 1, 1, 1, 1,
-2.057276, 0.5577481, -1.954597, 1, 1, 1, 1, 1,
-2.056998, -1.444711, -2.141585, 1, 1, 1, 1, 1,
-1.996213, -0.1723549, -2.024384, 0, 0, 1, 1, 1,
-1.929592, -1.975117, -4.488345, 1, 0, 0, 1, 1,
-1.921589, -0.6712502, -1.547806, 1, 0, 0, 1, 1,
-1.907905, -0.03984223, -3.862663, 1, 0, 0, 1, 1,
-1.860786, 0.3254207, -1.20037, 1, 0, 0, 1, 1,
-1.834869, -0.5745938, -1.86048, 1, 0, 0, 1, 1,
-1.824731, 1.219932, -1.127571, 0, 0, 0, 1, 1,
-1.816749, -1.443327, -3.499461, 0, 0, 0, 1, 1,
-1.803347, -0.1892522, -0.1302669, 0, 0, 0, 1, 1,
-1.794175, -0.7686284, -3.108418, 0, 0, 0, 1, 1,
-1.790936, 1.135685, -1.19055, 0, 0, 0, 1, 1,
-1.780399, 0.1412737, 1.151711, 0, 0, 0, 1, 1,
-1.776826, -1.173175, -2.280967, 0, 0, 0, 1, 1,
-1.747006, 0.0182921, 0.1175813, 1, 1, 1, 1, 1,
-1.732183, 0.6352496, -0.600498, 1, 1, 1, 1, 1,
-1.729229, -0.7905497, -3.007082, 1, 1, 1, 1, 1,
-1.707368, 0.01109378, -2.00723, 1, 1, 1, 1, 1,
-1.693412, -1.605215, -2.104805, 1, 1, 1, 1, 1,
-1.691843, -0.1914811, -0.2295993, 1, 1, 1, 1, 1,
-1.680373, -0.2438298, 0.07554374, 1, 1, 1, 1, 1,
-1.634978, 0.5649977, -0.3641661, 1, 1, 1, 1, 1,
-1.632823, -1.360142, -1.761586, 1, 1, 1, 1, 1,
-1.632449, 0.4559059, -0.8153459, 1, 1, 1, 1, 1,
-1.631585, 0.9929488, -1.544856, 1, 1, 1, 1, 1,
-1.631251, -1.502569, -2.916322, 1, 1, 1, 1, 1,
-1.624682, 0.0665447, 0.6700574, 1, 1, 1, 1, 1,
-1.619396, 0.545011, -1.944069, 1, 1, 1, 1, 1,
-1.615203, 0.8742854, -0.6619611, 1, 1, 1, 1, 1,
-1.606371, -0.1375384, -1.049138, 0, 0, 1, 1, 1,
-1.601959, 0.6569721, 0.4121532, 1, 0, 0, 1, 1,
-1.593213, -1.808424, -1.897216, 1, 0, 0, 1, 1,
-1.581248, 2.509575, 0.2925405, 1, 0, 0, 1, 1,
-1.576437, -0.3857847, -2.740661, 1, 0, 0, 1, 1,
-1.575456, 0.2999049, -0.8566232, 1, 0, 0, 1, 1,
-1.549769, 0.5999016, -1.006842, 0, 0, 0, 1, 1,
-1.5468, 0.3308652, -0.6831192, 0, 0, 0, 1, 1,
-1.533718, 0.9166117, -1.523856, 0, 0, 0, 1, 1,
-1.532385, 0.6423846, -0.6619495, 0, 0, 0, 1, 1,
-1.53101, 0.4608915, -2.235905, 0, 0, 0, 1, 1,
-1.525817, 1.842394, -1.546862, 0, 0, 0, 1, 1,
-1.502735, -0.01410976, -1.095402, 0, 0, 0, 1, 1,
-1.500878, -0.9415583, -2.256238, 1, 1, 1, 1, 1,
-1.500673, -0.5425758, -2.158588, 1, 1, 1, 1, 1,
-1.495586, -2.978989, -2.251812, 1, 1, 1, 1, 1,
-1.487331, -0.9115598, -0.2154725, 1, 1, 1, 1, 1,
-1.48591, -0.05413926, -1.185857, 1, 1, 1, 1, 1,
-1.483845, 1.018369, -0.1753648, 1, 1, 1, 1, 1,
-1.48225, -0.4347863, -0.9198465, 1, 1, 1, 1, 1,
-1.475901, 0.4988021, -1.702305, 1, 1, 1, 1, 1,
-1.471623, -1.310198, -3.242625, 1, 1, 1, 1, 1,
-1.471299, -0.2714554, -2.196718, 1, 1, 1, 1, 1,
-1.467991, 0.09327921, -0.3323936, 1, 1, 1, 1, 1,
-1.446004, -1.521048, -2.316504, 1, 1, 1, 1, 1,
-1.441394, 1.779612, -0.05407134, 1, 1, 1, 1, 1,
-1.440961, 1.000293, 1.400909, 1, 1, 1, 1, 1,
-1.435425, -0.8428408, -1.218607, 1, 1, 1, 1, 1,
-1.422875, -1.579187, -1.996004, 0, 0, 1, 1, 1,
-1.422587, 1.116929, -0.3591164, 1, 0, 0, 1, 1,
-1.400649, 0.1604806, -1.337872, 1, 0, 0, 1, 1,
-1.397524, 0.8303148, -0.7060179, 1, 0, 0, 1, 1,
-1.388244, 0.2039413, -0.7689611, 1, 0, 0, 1, 1,
-1.382213, 0.8082368, -1.039018, 1, 0, 0, 1, 1,
-1.368707, -1.554408, -3.082036, 0, 0, 0, 1, 1,
-1.359178, 0.6012629, -1.13042, 0, 0, 0, 1, 1,
-1.356534, -0.356357, -1.611121, 0, 0, 0, 1, 1,
-1.340414, 0.1448722, -1.877638, 0, 0, 0, 1, 1,
-1.333788, -0.6856669, -2.037946, 0, 0, 0, 1, 1,
-1.332019, 0.8190629, 0.5449539, 0, 0, 0, 1, 1,
-1.330996, 1.827363, 1.027968, 0, 0, 0, 1, 1,
-1.330786, -1.36111, -1.941, 1, 1, 1, 1, 1,
-1.309371, -0.3084559, -0.6072419, 1, 1, 1, 1, 1,
-1.301753, 3.139741, -0.2357707, 1, 1, 1, 1, 1,
-1.286811, 1.429381, -1.543486, 1, 1, 1, 1, 1,
-1.286742, -0.5246048, -3.475449, 1, 1, 1, 1, 1,
-1.285895, 0.2069787, -2.486377, 1, 1, 1, 1, 1,
-1.283503, 1.257, -1.931864, 1, 1, 1, 1, 1,
-1.281508, 0.3031573, -0.8630185, 1, 1, 1, 1, 1,
-1.279686, -0.05126693, -1.664069, 1, 1, 1, 1, 1,
-1.273624, 0.4479161, -0.9511213, 1, 1, 1, 1, 1,
-1.258937, 0.3723702, -1.30615, 1, 1, 1, 1, 1,
-1.257261, 0.4793824, -2.261945, 1, 1, 1, 1, 1,
-1.255152, 0.6126907, -0.8657194, 1, 1, 1, 1, 1,
-1.248762, 1.117134, -1.427816, 1, 1, 1, 1, 1,
-1.241256, -0.2876258, -0.8350287, 1, 1, 1, 1, 1,
-1.228151, 0.7651929, 0.5169274, 0, 0, 1, 1, 1,
-1.226584, 1.857706, -1.415666, 1, 0, 0, 1, 1,
-1.22238, 0.3648193, -1.753269, 1, 0, 0, 1, 1,
-1.22015, -0.1960192, -0.1021624, 1, 0, 0, 1, 1,
-1.210929, -0.2818827, -2.077215, 1, 0, 0, 1, 1,
-1.205593, -0.5830402, -2.892338, 1, 0, 0, 1, 1,
-1.201843, -0.7889339, -0.5229869, 0, 0, 0, 1, 1,
-1.20104, -0.7370595, -2.147104, 0, 0, 0, 1, 1,
-1.186654, -1.012666, -2.840097, 0, 0, 0, 1, 1,
-1.183832, 0.2640664, -1.022054, 0, 0, 0, 1, 1,
-1.164729, 1.083615, 0.2002915, 0, 0, 0, 1, 1,
-1.154113, 0.5729754, 0.5503762, 0, 0, 0, 1, 1,
-1.15003, -0.1403857, -2.117429, 0, 0, 0, 1, 1,
-1.143143, -0.7836981, -0.9235213, 1, 1, 1, 1, 1,
-1.136731, 1.156779, -1.923085, 1, 1, 1, 1, 1,
-1.128097, -1.116042, -2.421638, 1, 1, 1, 1, 1,
-1.107874, -0.4060761, -1.598721, 1, 1, 1, 1, 1,
-1.105675, 1.207307, 0.04773874, 1, 1, 1, 1, 1,
-1.104322, 2.411431, -0.5804242, 1, 1, 1, 1, 1,
-1.098417, 0.1896427, -2.787922, 1, 1, 1, 1, 1,
-1.094969, -0.7473139, -2.505874, 1, 1, 1, 1, 1,
-1.092474, -1.141887, -3.337335, 1, 1, 1, 1, 1,
-1.092319, -0.5953311, -3.700911, 1, 1, 1, 1, 1,
-1.092232, 0.4836182, 0.2329715, 1, 1, 1, 1, 1,
-1.091713, 1.31457, -0.8747622, 1, 1, 1, 1, 1,
-1.086278, -0.331379, -1.650618, 1, 1, 1, 1, 1,
-1.084152, 0.4000549, -1.738489, 1, 1, 1, 1, 1,
-1.082286, -0.0788335, -1.990211, 1, 1, 1, 1, 1,
-1.074643, 0.1601018, -2.713868, 0, 0, 1, 1, 1,
-1.070731, 1.268118, -0.04349722, 1, 0, 0, 1, 1,
-1.069525, -0.5920776, -3.143317, 1, 0, 0, 1, 1,
-1.069073, -0.1716315, -1.630829, 1, 0, 0, 1, 1,
-1.068172, 2.469314, 0.8233725, 1, 0, 0, 1, 1,
-1.062026, 0.3919871, -2.801496, 1, 0, 0, 1, 1,
-1.059271, 0.9995261, -1.145204, 0, 0, 0, 1, 1,
-1.056893, 0.602152, -0.6828734, 0, 0, 0, 1, 1,
-1.05409, 0.0647976, -1.30469, 0, 0, 0, 1, 1,
-1.043496, 1.687282, -0.29046, 0, 0, 0, 1, 1,
-1.04115, 0.9520379, -2.310504, 0, 0, 0, 1, 1,
-1.034782, 0.3265841, -2.026555, 0, 0, 0, 1, 1,
-1.029783, -0.4871442, -2.984384, 0, 0, 0, 1, 1,
-1.024973, -1.00403, -1.361788, 1, 1, 1, 1, 1,
-1.017652, 0.9935066, -1.965208, 1, 1, 1, 1, 1,
-1.015048, 1.341904, -2.049361, 1, 1, 1, 1, 1,
-1.007091, 0.8206693, -0.8773838, 1, 1, 1, 1, 1,
-1.003253, 1.857545, 0.8634128, 1, 1, 1, 1, 1,
-1.003241, 0.7181926, -0.4353516, 1, 1, 1, 1, 1,
-1.001536, 0.2093983, -1.890114, 1, 1, 1, 1, 1,
-0.9887025, 0.858936, -0.6948938, 1, 1, 1, 1, 1,
-0.974387, -0.5986344, -3.49138, 1, 1, 1, 1, 1,
-0.9718782, -1.189665, -3.390002, 1, 1, 1, 1, 1,
-0.9708482, 1.29902, -0.3136783, 1, 1, 1, 1, 1,
-0.9704064, -1.055375, -0.965076, 1, 1, 1, 1, 1,
-0.9651732, -0.2935827, 0.8909771, 1, 1, 1, 1, 1,
-0.960147, -1.064513, -1.698915, 1, 1, 1, 1, 1,
-0.9518555, 0.3293573, -1.047114, 1, 1, 1, 1, 1,
-0.9497693, -0.7877979, -1.558108, 0, 0, 1, 1, 1,
-0.942806, -0.1977407, -0.9887065, 1, 0, 0, 1, 1,
-0.9425672, -0.5223024, -1.02585, 1, 0, 0, 1, 1,
-0.9423531, -0.9783732, -3.257794, 1, 0, 0, 1, 1,
-0.9417335, 0.3564798, 0.6740553, 1, 0, 0, 1, 1,
-0.9372422, 0.05380354, -2.583456, 1, 0, 0, 1, 1,
-0.9363345, -0.938051, -2.859679, 0, 0, 0, 1, 1,
-0.9353778, 0.6091127, -1.108526, 0, 0, 0, 1, 1,
-0.9343954, 0.4416064, -1.927021, 0, 0, 0, 1, 1,
-0.9338524, 2.314666, -0.08625422, 0, 0, 0, 1, 1,
-0.9287344, -0.09834433, -1.256618, 0, 0, 0, 1, 1,
-0.9252117, 0.3265371, -1.397448, 0, 0, 0, 1, 1,
-0.9243819, -0.0750301, -2.389416, 0, 0, 0, 1, 1,
-0.9164577, 0.1842023, 0.08887646, 1, 1, 1, 1, 1,
-0.9149796, 0.6137953, -0.7499793, 1, 1, 1, 1, 1,
-0.9135159, -0.6726427, -3.185438, 1, 1, 1, 1, 1,
-0.9085072, -2.630182, -3.895336, 1, 1, 1, 1, 1,
-0.894738, 1.253326, -0.9860727, 1, 1, 1, 1, 1,
-0.8938149, -0.7893341, -2.299937, 1, 1, 1, 1, 1,
-0.8844485, 0.03243035, -2.346539, 1, 1, 1, 1, 1,
-0.8834817, 0.3120934, -2.094165, 1, 1, 1, 1, 1,
-0.8817455, -0.2501373, -3.431624, 1, 1, 1, 1, 1,
-0.8762434, -1.111241, -1.538228, 1, 1, 1, 1, 1,
-0.8730072, 1.044921, -3.358397, 1, 1, 1, 1, 1,
-0.8719923, 0.1595751, -0.6557306, 1, 1, 1, 1, 1,
-0.8698817, 0.2062377, -2.629178, 1, 1, 1, 1, 1,
-0.8659524, -1.397044, -2.144737, 1, 1, 1, 1, 1,
-0.8625228, 0.8740938, 0.02316959, 1, 1, 1, 1, 1,
-0.861361, -0.3784886, -2.01945, 0, 0, 1, 1, 1,
-0.8588462, -1.173633, -2.867809, 1, 0, 0, 1, 1,
-0.8586755, -1.106362, -2.012887, 1, 0, 0, 1, 1,
-0.8569648, 1.28433, -0.788271, 1, 0, 0, 1, 1,
-0.8549006, 0.1190507, 1.69146, 1, 0, 0, 1, 1,
-0.8501134, -0.2618489, -1.730457, 1, 0, 0, 1, 1,
-0.847455, 0.2687022, -0.8064781, 0, 0, 0, 1, 1,
-0.8468311, 1.275093, -1.09311, 0, 0, 0, 1, 1,
-0.8462923, -0.7706731, -2.204079, 0, 0, 0, 1, 1,
-0.8457327, 1.633557, -1.302888, 0, 0, 0, 1, 1,
-0.842123, -0.266119, -0.9419168, 0, 0, 0, 1, 1,
-0.8410286, -1.421925, -1.089142, 0, 0, 0, 1, 1,
-0.8349434, -1.728589, -3.546491, 0, 0, 0, 1, 1,
-0.8333657, 0.6429798, -0.4696877, 1, 1, 1, 1, 1,
-0.831499, -0.3474398, -2.755189, 1, 1, 1, 1, 1,
-0.8273888, 0.1488809, -1.40907, 1, 1, 1, 1, 1,
-0.8183393, 0.8717057, -1.132174, 1, 1, 1, 1, 1,
-0.8156799, 0.8113918, 0.09593612, 1, 1, 1, 1, 1,
-0.81206, 0.8874279, -0.6534131, 1, 1, 1, 1, 1,
-0.8113754, 1.012298, -0.6977578, 1, 1, 1, 1, 1,
-0.8060104, -0.5736557, -3.436503, 1, 1, 1, 1, 1,
-0.8058093, 2.38838, 0.4604112, 1, 1, 1, 1, 1,
-0.7980347, -0.7029188, -1.861349, 1, 1, 1, 1, 1,
-0.7891102, -0.3742658, -2.473637, 1, 1, 1, 1, 1,
-0.7890416, -1.310331, -5.062715, 1, 1, 1, 1, 1,
-0.7824636, -0.2642533, -1.563105, 1, 1, 1, 1, 1,
-0.7821921, -0.2930577, -1.937183, 1, 1, 1, 1, 1,
-0.7821248, 0.6838163, -0.4087673, 1, 1, 1, 1, 1,
-0.7810372, 0.3042074, -0.7331877, 0, 0, 1, 1, 1,
-0.7799463, 1.661412, 1.01343, 1, 0, 0, 1, 1,
-0.778059, 0.519551, 0.185936, 1, 0, 0, 1, 1,
-0.7744411, 0.1075519, -0.4333349, 1, 0, 0, 1, 1,
-0.7719064, 1.530263, -0.1956724, 1, 0, 0, 1, 1,
-0.7688478, 1.760455, -0.613756, 1, 0, 0, 1, 1,
-0.7669498, -0.09247398, -3.271065, 0, 0, 0, 1, 1,
-0.7649159, 0.6229547, -1.871875, 0, 0, 0, 1, 1,
-0.7583448, -0.2567708, -1.834952, 0, 0, 0, 1, 1,
-0.7578785, 0.7618751, 0.4477243, 0, 0, 0, 1, 1,
-0.7558292, -0.4070091, -1.985073, 0, 0, 0, 1, 1,
-0.744451, -0.5194965, -1.439457, 0, 0, 0, 1, 1,
-0.7443995, -0.9924317, -1.352745, 0, 0, 0, 1, 1,
-0.7398295, -1.690511, -1.491684, 1, 1, 1, 1, 1,
-0.7380841, -0.413856, -3.714293, 1, 1, 1, 1, 1,
-0.736808, 0.8305227, 0.2416249, 1, 1, 1, 1, 1,
-0.7332682, -0.3741218, -0.8126592, 1, 1, 1, 1, 1,
-0.7282639, 1.007797, -1.830733, 1, 1, 1, 1, 1,
-0.7275661, -0.5153111, 0.1231301, 1, 1, 1, 1, 1,
-0.726424, -0.9373523, -1.824419, 1, 1, 1, 1, 1,
-0.7246037, 0.9879584, -0.6189281, 1, 1, 1, 1, 1,
-0.7224464, 0.7694446, -0.7350884, 1, 1, 1, 1, 1,
-0.715232, 1.39145, 0.1569688, 1, 1, 1, 1, 1,
-0.709847, -0.2185776, -2.874147, 1, 1, 1, 1, 1,
-0.7041463, 2.599166, 0.4280319, 1, 1, 1, 1, 1,
-0.7035061, 0.4555318, -1.348978, 1, 1, 1, 1, 1,
-0.6972504, 0.5303555, -0.2491418, 1, 1, 1, 1, 1,
-0.6953114, 0.3832803, -0.07506487, 1, 1, 1, 1, 1,
-0.6945258, -0.3617081, -2.25731, 0, 0, 1, 1, 1,
-0.6885489, 0.08107508, -1.226456, 1, 0, 0, 1, 1,
-0.6845506, -0.2972945, -2.798231, 1, 0, 0, 1, 1,
-0.6817256, -1.399896, -2.232109, 1, 0, 0, 1, 1,
-0.6803222, 0.399995, -0.7879985, 1, 0, 0, 1, 1,
-0.6682361, 2.085238, 1.462495, 1, 0, 0, 1, 1,
-0.6647443, 0.1512981, -1.40362, 0, 0, 0, 1, 1,
-0.6624044, 0.979009, -0.236085, 0, 0, 0, 1, 1,
-0.6519744, -0.3493749, -2.708454, 0, 0, 0, 1, 1,
-0.6518484, 1.532062, -1.262005, 0, 0, 0, 1, 1,
-0.643778, 0.5227339, -0.9822736, 0, 0, 0, 1, 1,
-0.629551, -0.1379246, -1.367528, 0, 0, 0, 1, 1,
-0.6273672, 0.7719932, -0.6576295, 0, 0, 0, 1, 1,
-0.624655, -0.8392914, -1.733321, 1, 1, 1, 1, 1,
-0.6245666, 1.874333, -0.5768316, 1, 1, 1, 1, 1,
-0.6242688, -1.278895, -1.74144, 1, 1, 1, 1, 1,
-0.6116365, -0.3394563, -1.28261, 1, 1, 1, 1, 1,
-0.6105502, 1.850153, -0.4431013, 1, 1, 1, 1, 1,
-0.6006024, 0.1615786, -0.1420911, 1, 1, 1, 1, 1,
-0.600032, 0.5607671, -1.136913, 1, 1, 1, 1, 1,
-0.5972089, 0.4371388, 1.625495, 1, 1, 1, 1, 1,
-0.5902975, -0.4570611, -1.762624, 1, 1, 1, 1, 1,
-0.5871822, -0.3537776, -0.1242819, 1, 1, 1, 1, 1,
-0.5845791, -0.8363527, -1.586353, 1, 1, 1, 1, 1,
-0.5838847, 0.1261252, -2.237241, 1, 1, 1, 1, 1,
-0.5806941, 1.712376, -0.7850872, 1, 1, 1, 1, 1,
-0.5731283, -0.8212507, -1.138453, 1, 1, 1, 1, 1,
-0.5691013, 0.3587753, -1.343983, 1, 1, 1, 1, 1,
-0.5678204, -0.1709571, -3.823787, 0, 0, 1, 1, 1,
-0.5661051, -0.2103362, -2.112128, 1, 0, 0, 1, 1,
-0.5660299, -0.454581, -0.2659623, 1, 0, 0, 1, 1,
-0.5514001, 1.042769, -1.130982, 1, 0, 0, 1, 1,
-0.5487249, -0.536505, -4.309731, 1, 0, 0, 1, 1,
-0.54426, -0.09181628, -3.00324, 1, 0, 0, 1, 1,
-0.5409576, -2.309011, -1.633003, 0, 0, 0, 1, 1,
-0.5376124, -1.616365, -3.205208, 0, 0, 0, 1, 1,
-0.5370215, -1.063458, -2.240211, 0, 0, 0, 1, 1,
-0.5323798, -1.992007, -3.533045, 0, 0, 0, 1, 1,
-0.5287962, -0.4817761, -2.261369, 0, 0, 0, 1, 1,
-0.5241064, -0.6446522, -2.859725, 0, 0, 0, 1, 1,
-0.5198967, -1.572236, -0.3822535, 0, 0, 0, 1, 1,
-0.5182894, 0.1552139, -0.7824461, 1, 1, 1, 1, 1,
-0.5172284, -0.7742315, -3.82292, 1, 1, 1, 1, 1,
-0.5128326, -0.02359364, -1.689051, 1, 1, 1, 1, 1,
-0.5058911, 0.8460921, -0.7502131, 1, 1, 1, 1, 1,
-0.4996806, -0.1686615, -1.705566, 1, 1, 1, 1, 1,
-0.4959237, 0.4523587, -1.873081, 1, 1, 1, 1, 1,
-0.4956935, -2.127497, -2.449439, 1, 1, 1, 1, 1,
-0.4951229, 0.8865828, -1.159062, 1, 1, 1, 1, 1,
-0.4947653, 0.9407428, 2.888419, 1, 1, 1, 1, 1,
-0.492895, -0.5699853, -3.521387, 1, 1, 1, 1, 1,
-0.4897667, 0.6027444, -0.07823007, 1, 1, 1, 1, 1,
-0.4848152, -0.500052, -1.616205, 1, 1, 1, 1, 1,
-0.4829161, 0.05082091, -0.1075304, 1, 1, 1, 1, 1,
-0.4784311, -0.5664853, -4.658738, 1, 1, 1, 1, 1,
-0.476487, 0.06352814, -0.8341112, 1, 1, 1, 1, 1,
-0.4741972, -1.18607, -2.401587, 0, 0, 1, 1, 1,
-0.4738759, 0.2421783, -1.444878, 1, 0, 0, 1, 1,
-0.4726969, -0.845111, -0.7505246, 1, 0, 0, 1, 1,
-0.4721892, -0.4848387, -0.8468625, 1, 0, 0, 1, 1,
-0.4720087, -0.8553194, -0.7011313, 1, 0, 0, 1, 1,
-0.4699135, -2.079316, -3.278779, 1, 0, 0, 1, 1,
-0.4614637, 0.05870144, -0.8172067, 0, 0, 0, 1, 1,
-0.4608402, 0.4533753, -1.812741, 0, 0, 0, 1, 1,
-0.4606599, 1.014877, 0.07374174, 0, 0, 0, 1, 1,
-0.4574578, 0.1336229, -1.588073, 0, 0, 0, 1, 1,
-0.4521194, 0.01331455, -2.109673, 0, 0, 0, 1, 1,
-0.4509295, -0.4972692, -2.468329, 0, 0, 0, 1, 1,
-0.4506841, -1.451992, -2.037553, 0, 0, 0, 1, 1,
-0.450158, -0.9754816, -2.647179, 1, 1, 1, 1, 1,
-0.4468168, 0.2518761, -1.084317, 1, 1, 1, 1, 1,
-0.4459977, -0.8719916, -2.923918, 1, 1, 1, 1, 1,
-0.4451883, -1.977897, -1.764118, 1, 1, 1, 1, 1,
-0.4391073, -1.070255, -4.855206, 1, 1, 1, 1, 1,
-0.4264972, -0.9430797, -3.495219, 1, 1, 1, 1, 1,
-0.4246532, -1.134567, -2.366266, 1, 1, 1, 1, 1,
-0.4239138, 0.08624954, -0.3272298, 1, 1, 1, 1, 1,
-0.4218563, 0.03287819, -0.7769098, 1, 1, 1, 1, 1,
-0.4208972, 0.7064869, 0.1764013, 1, 1, 1, 1, 1,
-0.4208355, -1.98358, -3.1088, 1, 1, 1, 1, 1,
-0.4120887, -0.02172449, -2.323022, 1, 1, 1, 1, 1,
-0.4107237, 0.9728988, -1.24568, 1, 1, 1, 1, 1,
-0.4072524, -0.01259923, -1.49618, 1, 1, 1, 1, 1,
-0.4052172, -0.1626382, 0.334868, 1, 1, 1, 1, 1,
-0.4033096, -0.596215, -2.509917, 0, 0, 1, 1, 1,
-0.4032674, 0.5238291, -0.7673391, 1, 0, 0, 1, 1,
-0.402632, 1.920581, 0.3414766, 1, 0, 0, 1, 1,
-0.3989604, -1.475325, -2.518772, 1, 0, 0, 1, 1,
-0.398804, 0.3934222, 0.4465856, 1, 0, 0, 1, 1,
-0.3950441, 0.39523, -1.753778, 1, 0, 0, 1, 1,
-0.3940315, 0.1910243, -0.5815883, 0, 0, 0, 1, 1,
-0.3936187, 1.460907, 0.8778002, 0, 0, 0, 1, 1,
-0.3884298, 0.4832464, -0.9819925, 0, 0, 0, 1, 1,
-0.3836829, -2.042367, -2.205964, 0, 0, 0, 1, 1,
-0.3831826, 0.7812079, -0.3330418, 0, 0, 0, 1, 1,
-0.3793469, 0.9816641, 0.7431644, 0, 0, 0, 1, 1,
-0.3742712, -0.4126439, -2.822014, 0, 0, 0, 1, 1,
-0.3725502, -0.1488041, -1.074613, 1, 1, 1, 1, 1,
-0.369231, -0.5300825, -4.567896, 1, 1, 1, 1, 1,
-0.3629903, 1.59464, 1.183347, 1, 1, 1, 1, 1,
-0.3618006, 0.2562882, -2.289723, 1, 1, 1, 1, 1,
-0.3594702, 0.6845552, -0.2057145, 1, 1, 1, 1, 1,
-0.3592376, 0.142369, -1.821669, 1, 1, 1, 1, 1,
-0.3568454, 2.517894, -1.751202, 1, 1, 1, 1, 1,
-0.3450347, 1.140636, -0.6817477, 1, 1, 1, 1, 1,
-0.3443622, 0.2500124, -1.4051, 1, 1, 1, 1, 1,
-0.344225, 0.4089631, -1.048007, 1, 1, 1, 1, 1,
-0.3375088, -0.08172195, 0.8346834, 1, 1, 1, 1, 1,
-0.3362621, 0.3734373, 0.3202706, 1, 1, 1, 1, 1,
-0.3316327, -1.238922, -1.736904, 1, 1, 1, 1, 1,
-0.3307564, 0.6709016, -0.02040456, 1, 1, 1, 1, 1,
-0.3252211, 2.297249, 0.9881684, 1, 1, 1, 1, 1,
-0.321337, 1.246775, 0.04931953, 0, 0, 1, 1, 1,
-0.3185979, 0.729865, -0.8977677, 1, 0, 0, 1, 1,
-0.3182741, -2.113073, -4.68699, 1, 0, 0, 1, 1,
-0.3148924, -2.271178, -4.550255, 1, 0, 0, 1, 1,
-0.3145307, 0.4649485, 0.9085566, 1, 0, 0, 1, 1,
-0.3131962, 0.6374345, 1.136039, 1, 0, 0, 1, 1,
-0.3043009, 0.6146248, -0.4523232, 0, 0, 0, 1, 1,
-0.3018658, 2.37913, -0.7685472, 0, 0, 0, 1, 1,
-0.2953941, 0.7530286, 1.711415, 0, 0, 0, 1, 1,
-0.293308, -0.81511, -3.589582, 0, 0, 0, 1, 1,
-0.2925403, 1.653824, -0.2945896, 0, 0, 0, 1, 1,
-0.2872102, -0.2091983, -1.36569, 0, 0, 0, 1, 1,
-0.2819614, 1.025666, -2.248319, 0, 0, 0, 1, 1,
-0.2781465, -0.8763365, -3.435452, 1, 1, 1, 1, 1,
-0.2780634, 0.2439835, -0.6602855, 1, 1, 1, 1, 1,
-0.2764432, -0.6866414, -1.174841, 1, 1, 1, 1, 1,
-0.2755095, -0.05630187, -2.038363, 1, 1, 1, 1, 1,
-0.2748075, 2.532791, -1.464293, 1, 1, 1, 1, 1,
-0.2737487, 2.473642, 0.3241108, 1, 1, 1, 1, 1,
-0.2722214, 2.132712, 0.7323897, 1, 1, 1, 1, 1,
-0.2707259, 0.4037285, 0.3106289, 1, 1, 1, 1, 1,
-0.2703521, 1.773255, -1.019105, 1, 1, 1, 1, 1,
-0.2677037, -0.5156464, -2.477659, 1, 1, 1, 1, 1,
-0.2674771, -1.138767, -3.723173, 1, 1, 1, 1, 1,
-0.2670056, 1.686995, -0.2435491, 1, 1, 1, 1, 1,
-0.2652187, 3.018416, 0.106692, 1, 1, 1, 1, 1,
-0.2612336, 0.1023382, -1.51286, 1, 1, 1, 1, 1,
-0.2607116, -1.086846, -3.960638, 1, 1, 1, 1, 1,
-0.2596242, 1.438424, -1.844439, 0, 0, 1, 1, 1,
-0.2590176, 0.1152675, -1.386168, 1, 0, 0, 1, 1,
-0.2541291, 0.4223202, -0.2105396, 1, 0, 0, 1, 1,
-0.2537394, -0.3918968, -3.403861, 1, 0, 0, 1, 1,
-0.247954, -0.5629619, -2.651826, 1, 0, 0, 1, 1,
-0.2427304, 1.824578, 0.6983716, 1, 0, 0, 1, 1,
-0.2418617, 1.827772, -0.3945813, 0, 0, 0, 1, 1,
-0.2374217, 1.622501, -0.07532308, 0, 0, 0, 1, 1,
-0.234655, 0.08956133, -1.939007, 0, 0, 0, 1, 1,
-0.2334009, -1.763374, -2.367179, 0, 0, 0, 1, 1,
-0.2331557, 1.156792, -0.08344194, 0, 0, 0, 1, 1,
-0.2320553, 0.4017477, -1.459742, 0, 0, 0, 1, 1,
-0.2293452, 1.172924, -1.660914, 0, 0, 0, 1, 1,
-0.2254155, -0.5742644, -3.47732, 1, 1, 1, 1, 1,
-0.223254, -0.9364225, -1.845494, 1, 1, 1, 1, 1,
-0.2215099, -0.3525445, -1.424089, 1, 1, 1, 1, 1,
-0.2175362, 0.9547551, 0.2651837, 1, 1, 1, 1, 1,
-0.2075182, 1.897347, -0.2518918, 1, 1, 1, 1, 1,
-0.2068463, -0.7594953, -3.081517, 1, 1, 1, 1, 1,
-0.2052825, -0.3425297, -3.48725, 1, 1, 1, 1, 1,
-0.204369, -0.852931, -2.750409, 1, 1, 1, 1, 1,
-0.2035632, -0.153362, -1.480729, 1, 1, 1, 1, 1,
-0.2004209, 0.9344653, 0.08621424, 1, 1, 1, 1, 1,
-0.1991641, 1.093083, 0.292669, 1, 1, 1, 1, 1,
-0.1931019, 1.470693, 1.146687, 1, 1, 1, 1, 1,
-0.1926307, -1.347809, -3.998405, 1, 1, 1, 1, 1,
-0.1924864, 0.33726, -0.4648978, 1, 1, 1, 1, 1,
-0.1906587, -1.329374, -2.560704, 1, 1, 1, 1, 1,
-0.1902722, 0.8619127, 0.9855043, 0, 0, 1, 1, 1,
-0.1874585, 1.328802, 0.5638247, 1, 0, 0, 1, 1,
-0.1869651, 0.1368435, 0.08556613, 1, 0, 0, 1, 1,
-0.1856396, 0.453107, -1.907659, 1, 0, 0, 1, 1,
-0.1845401, 1.586261, 0.3119162, 1, 0, 0, 1, 1,
-0.1830849, -1.01062, -1.385652, 1, 0, 0, 1, 1,
-0.1790034, -1.033398, -3.914838, 0, 0, 0, 1, 1,
-0.1755213, -0.5371733, -3.358657, 0, 0, 0, 1, 1,
-0.1732946, 1.40936, -0.2391355, 0, 0, 0, 1, 1,
-0.1727883, 0.2007307, 0.1133893, 0, 0, 0, 1, 1,
-0.1706023, -1.182028, -3.979816, 0, 0, 0, 1, 1,
-0.1691855, 2.526615, -0.1386123, 0, 0, 0, 1, 1,
-0.1631734, -0.6790187, -3.601375, 0, 0, 0, 1, 1,
-0.1629853, -0.269853, -2.60399, 1, 1, 1, 1, 1,
-0.1619634, -1.099011, -2.660154, 1, 1, 1, 1, 1,
-0.1617534, -1.761331, -3.141033, 1, 1, 1, 1, 1,
-0.1538392, 0.4462412, -0.7815895, 1, 1, 1, 1, 1,
-0.1537926, -1.332507, -1.972392, 1, 1, 1, 1, 1,
-0.151637, -0.8558558, -4.768676, 1, 1, 1, 1, 1,
-0.1420099, -1.859399, -2.537578, 1, 1, 1, 1, 1,
-0.1388961, 0.9552463, 0.1958713, 1, 1, 1, 1, 1,
-0.1322036, 0.7998281, 0.9521914, 1, 1, 1, 1, 1,
-0.1320646, 0.4336017, 0.1102142, 1, 1, 1, 1, 1,
-0.1317309, -0.3835291, -3.16524, 1, 1, 1, 1, 1,
-0.1296282, -0.396728, -1.713879, 1, 1, 1, 1, 1,
-0.1288618, -0.3568911, -3.309689, 1, 1, 1, 1, 1,
-0.1284719, -0.7301676, -3.165242, 1, 1, 1, 1, 1,
-0.1165957, -0.395873, -1.131545, 1, 1, 1, 1, 1,
-0.1129865, 1.6114, 2.201026, 0, 0, 1, 1, 1,
-0.109651, -1.217556, -2.078175, 1, 0, 0, 1, 1,
-0.1086883, 1.108049, -2.185297, 1, 0, 0, 1, 1,
-0.09488337, -0.3844547, -3.733102, 1, 0, 0, 1, 1,
-0.08924764, 0.2796081, -1.415751, 1, 0, 0, 1, 1,
-0.089155, -1.472657, -2.936872, 1, 0, 0, 1, 1,
-0.08794142, -0.543399, -2.613477, 0, 0, 0, 1, 1,
-0.08456498, -0.1314025, -2.637502, 0, 0, 0, 1, 1,
-0.07986496, -0.8688104, -3.02178, 0, 0, 0, 1, 1,
-0.07827897, -0.3635757, -2.056963, 0, 0, 0, 1, 1,
-0.07581607, -1.549941, -3.43906, 0, 0, 0, 1, 1,
-0.07427436, -0.04472299, -0.7071592, 0, 0, 0, 1, 1,
-0.0712867, -0.946628, -3.536621, 0, 0, 0, 1, 1,
-0.07122161, 1.867123, 1.362021, 1, 1, 1, 1, 1,
-0.07043558, 0.4211183, 1.150454, 1, 1, 1, 1, 1,
-0.06830885, -1.806169, -3.678611, 1, 1, 1, 1, 1,
-0.06783912, -0.5056614, -2.947834, 1, 1, 1, 1, 1,
-0.06506852, -0.8903409, -3.069761, 1, 1, 1, 1, 1,
-0.06146962, -0.8364308, -2.948593, 1, 1, 1, 1, 1,
-0.05855342, 1.170808, 0.8693075, 1, 1, 1, 1, 1,
-0.05155233, 0.4293846, 1.033579, 1, 1, 1, 1, 1,
-0.04583049, -1.013002, -3.84096, 1, 1, 1, 1, 1,
-0.04413111, -0.1841521, -3.229757, 1, 1, 1, 1, 1,
-0.04384981, 0.8591954, -0.2663901, 1, 1, 1, 1, 1,
-0.0411173, -0.4249595, -2.682987, 1, 1, 1, 1, 1,
-0.03942147, 0.4782095, -1.644587, 1, 1, 1, 1, 1,
-0.03769004, -0.0103621, -3.226918, 1, 1, 1, 1, 1,
-0.03705655, -0.6589929, -2.884, 1, 1, 1, 1, 1,
-0.03461198, 0.6469368, -0.2823632, 0, 0, 1, 1, 1,
-0.03423729, -1.048409, -3.038072, 1, 0, 0, 1, 1,
-0.03295965, -0.895436, -2.594726, 1, 0, 0, 1, 1,
-0.03254472, 0.6169543, 0.0474226, 1, 0, 0, 1, 1,
-0.03220798, 1.143079, 1.419543, 1, 0, 0, 1, 1,
-0.02633069, -0.6605474, -2.292257, 1, 0, 0, 1, 1,
-0.02421715, 0.8006486, 0.06841731, 0, 0, 0, 1, 1,
-0.0234086, 0.3154922, -1.119974, 0, 0, 0, 1, 1,
-0.02303142, 1.317561, -0.166433, 0, 0, 0, 1, 1,
-0.02238148, 1.063924, 1.76399, 0, 0, 0, 1, 1,
-0.01791629, 1.063377, 1.812309, 0, 0, 0, 1, 1,
-0.01763092, 0.03446912, -0.7429446, 0, 0, 0, 1, 1,
-0.01700793, 1.774462, -0.3256641, 0, 0, 0, 1, 1,
-0.01593716, 0.3864787, -0.07461544, 1, 1, 1, 1, 1,
-0.01303862, 1.206141, -2.035052, 1, 1, 1, 1, 1,
-0.009385346, 1.067499, -0.9385771, 1, 1, 1, 1, 1,
-0.007521501, 0.7062486, -0.8455958, 1, 1, 1, 1, 1,
-0.002739985, 0.3586237, -1.581609, 1, 1, 1, 1, 1,
-0.000925199, 1.871186, -0.1137656, 1, 1, 1, 1, 1,
-0.0008925733, 0.2056678, 1.310178, 1, 1, 1, 1, 1,
0.004251571, -0.3277018, 4.48598, 1, 1, 1, 1, 1,
0.005570204, 1.778927, 0.04310553, 1, 1, 1, 1, 1,
0.01192935, 0.4168707, -0.3116554, 1, 1, 1, 1, 1,
0.01678999, -1.937663, 3.959165, 1, 1, 1, 1, 1,
0.03455732, -0.1205437, 2.758121, 1, 1, 1, 1, 1,
0.03479808, -0.1701802, 2.189086, 1, 1, 1, 1, 1,
0.03492336, 0.0824145, 0.2363364, 1, 1, 1, 1, 1,
0.03660331, -0.3918819, 2.063185, 1, 1, 1, 1, 1,
0.04046663, 0.1963104, -0.4667812, 0, 0, 1, 1, 1,
0.04155408, -1.788044, 4.585432, 1, 0, 0, 1, 1,
0.04163933, 1.603425, 1.546627, 1, 0, 0, 1, 1,
0.04187236, 2.41288, -0.09898751, 1, 0, 0, 1, 1,
0.04341473, 0.9140647, -0.756157, 1, 0, 0, 1, 1,
0.04346678, -1.546329, 2.78302, 1, 0, 0, 1, 1,
0.04580988, -0.1550683, 2.024266, 0, 0, 0, 1, 1,
0.04606886, -0.58614, 3.080461, 0, 0, 0, 1, 1,
0.04707474, -0.1196764, 3.445348, 0, 0, 0, 1, 1,
0.05389254, -0.02368649, 0.133524, 0, 0, 0, 1, 1,
0.05398879, 0.8521091, 0.9878276, 0, 0, 0, 1, 1,
0.05543516, -1.333058, 3.846653, 0, 0, 0, 1, 1,
0.05624312, -0.733842, 1.826374, 0, 0, 0, 1, 1,
0.05743892, -0.2665659, 4.031312, 1, 1, 1, 1, 1,
0.06108101, -1.779638, 2.673415, 1, 1, 1, 1, 1,
0.06148375, -1.690793, 2.540661, 1, 1, 1, 1, 1,
0.06150345, -0.6247123, 0.1947905, 1, 1, 1, 1, 1,
0.06166377, 1.463968, -0.6813693, 1, 1, 1, 1, 1,
0.06894828, 0.172814, -2.116896, 1, 1, 1, 1, 1,
0.06900571, 0.2360323, 0.02939933, 1, 1, 1, 1, 1,
0.07052742, -1.14193, 3.454172, 1, 1, 1, 1, 1,
0.07110315, 1.102247, -0.05737419, 1, 1, 1, 1, 1,
0.07666042, 0.9577212, 0.57242, 1, 1, 1, 1, 1,
0.07686961, -0.5720811, 1.224891, 1, 1, 1, 1, 1,
0.0845411, 0.2240692, 1.328755, 1, 1, 1, 1, 1,
0.0861584, 0.304426, 0.8929703, 1, 1, 1, 1, 1,
0.08687607, 1.342535, 1.376316, 1, 1, 1, 1, 1,
0.090785, 0.3536506, 1.289615, 1, 1, 1, 1, 1,
0.0982639, 0.8152801, -1.003233, 0, 0, 1, 1, 1,
0.1010185, -0.9694741, 4.174082, 1, 0, 0, 1, 1,
0.1018112, 0.01014432, 1.257326, 1, 0, 0, 1, 1,
0.1032427, 0.8902842, 0.5988255, 1, 0, 0, 1, 1,
0.1041518, 2.806654, -2.287365, 1, 0, 0, 1, 1,
0.1048659, 2.140139, -1.070811, 1, 0, 0, 1, 1,
0.1066294, 2.873816, -0.5595011, 0, 0, 0, 1, 1,
0.1154413, 0.7070512, -0.389431, 0, 0, 0, 1, 1,
0.1165339, -0.5002159, 2.6459, 0, 0, 0, 1, 1,
0.1165487, 0.9835889, -0.1547287, 0, 0, 0, 1, 1,
0.11716, -1.052281, 3.32796, 0, 0, 0, 1, 1,
0.1211309, -0.583854, 3.38195, 0, 0, 0, 1, 1,
0.1231252, -0.6229368, 3.845856, 0, 0, 0, 1, 1,
0.1255042, -2.207855, 3.535236, 1, 1, 1, 1, 1,
0.1263323, 0.6099242, 1.294641, 1, 1, 1, 1, 1,
0.1271015, 0.8659591, -0.2404695, 1, 1, 1, 1, 1,
0.1319627, -1.090334, 4.192796, 1, 1, 1, 1, 1,
0.1415378, 0.6333661, 3.208853, 1, 1, 1, 1, 1,
0.1453903, 0.7461106, 0.7317027, 1, 1, 1, 1, 1,
0.1463755, -0.4476421, 1.745091, 1, 1, 1, 1, 1,
0.152403, -0.1638535, 1.464189, 1, 1, 1, 1, 1,
0.1549997, -0.05976635, 4.459258, 1, 1, 1, 1, 1,
0.1554972, -0.1233521, 1.757666, 1, 1, 1, 1, 1,
0.1570281, -0.5488466, 1.755159, 1, 1, 1, 1, 1,
0.1581058, -0.9936134, 2.515476, 1, 1, 1, 1, 1,
0.1592136, -0.6619959, 4.276927, 1, 1, 1, 1, 1,
0.161265, 0.6278423, 0.4763824, 1, 1, 1, 1, 1,
0.1651164, -1.214889, 1.325114, 1, 1, 1, 1, 1,
0.1674206, 1.027665, 0.2491667, 0, 0, 1, 1, 1,
0.1683161, 0.3694603, 1.173347, 1, 0, 0, 1, 1,
0.1711607, -1.016667, 4.359563, 1, 0, 0, 1, 1,
0.1737168, 0.2272863, 1.038872, 1, 0, 0, 1, 1,
0.1791758, 2.186393, 0.1697922, 1, 0, 0, 1, 1,
0.1807844, 0.2242358, 1.498785, 1, 0, 0, 1, 1,
0.1843744, -1.01732, 3.582585, 0, 0, 0, 1, 1,
0.1900466, -2.179877, 4.515422, 0, 0, 0, 1, 1,
0.1921529, 1.103626, 0.7213201, 0, 0, 0, 1, 1,
0.1926507, 0.2941659, 0.1786091, 0, 0, 0, 1, 1,
0.2054673, -0.01085986, 1.575024, 0, 0, 0, 1, 1,
0.2100349, -0.1732822, 2.055327, 0, 0, 0, 1, 1,
0.2141925, -1.03052, 1.860753, 0, 0, 0, 1, 1,
0.2196367, -0.3691138, 2.418291, 1, 1, 1, 1, 1,
0.2202763, 0.09637886, 1.599042, 1, 1, 1, 1, 1,
0.2254982, -0.565546, 1.090358, 1, 1, 1, 1, 1,
0.2264368, -0.8039917, 3.490395, 1, 1, 1, 1, 1,
0.2298868, 0.4838985, -0.4391513, 1, 1, 1, 1, 1,
0.230028, -1.495102, 3.693698, 1, 1, 1, 1, 1,
0.2302283, 0.9978038, -0.4473707, 1, 1, 1, 1, 1,
0.2320683, 1.849353, 0.8172321, 1, 1, 1, 1, 1,
0.2361431, 1.505219, -0.2124512, 1, 1, 1, 1, 1,
0.2372361, -1.507716, 2.364972, 1, 1, 1, 1, 1,
0.2473908, -0.1263724, 2.005612, 1, 1, 1, 1, 1,
0.2478271, -0.5029262, 1.337563, 1, 1, 1, 1, 1,
0.249897, -0.7157342, 2.219157, 1, 1, 1, 1, 1,
0.2499908, -1.151313, 3.752802, 1, 1, 1, 1, 1,
0.2537009, 1.342015, 1.84974, 1, 1, 1, 1, 1,
0.2562423, 1.449392, 0.7457635, 0, 0, 1, 1, 1,
0.2562897, 2.009764, 2.034123, 1, 0, 0, 1, 1,
0.2636467, 1.088336, -1.023885, 1, 0, 0, 1, 1,
0.2639507, 0.05298382, 1.379581, 1, 0, 0, 1, 1,
0.2655514, -0.8253416, 1.741092, 1, 0, 0, 1, 1,
0.265969, -0.8739843, 2.979076, 1, 0, 0, 1, 1,
0.2706714, 0.7913931, -0.9834576, 0, 0, 0, 1, 1,
0.2712413, -0.3286047, 4.039456, 0, 0, 0, 1, 1,
0.2747821, -0.1374176, 4.21145, 0, 0, 0, 1, 1,
0.2773091, 0.3229786, 2.466822, 0, 0, 0, 1, 1,
0.2797434, -0.6202541, 1.775069, 0, 0, 0, 1, 1,
0.2814043, -1.151785, 3.746784, 0, 0, 0, 1, 1,
0.2823581, -1.476668, 1.516013, 0, 0, 0, 1, 1,
0.285419, 0.6484398, -0.3915375, 1, 1, 1, 1, 1,
0.2872384, -0.4561871, 4.763077, 1, 1, 1, 1, 1,
0.2895605, -0.6217172, 4.0126, 1, 1, 1, 1, 1,
0.294835, 2.294093, 1.491857, 1, 1, 1, 1, 1,
0.2991181, -0.734654, 3.150621, 1, 1, 1, 1, 1,
0.2994158, -2.206088, 4.983094, 1, 1, 1, 1, 1,
0.3028433, 0.8510261, -1.148496, 1, 1, 1, 1, 1,
0.3035662, 2.205444, -0.6710994, 1, 1, 1, 1, 1,
0.3042862, -1.123275, 3.922898, 1, 1, 1, 1, 1,
0.3065038, -0.2810954, 4.346442, 1, 1, 1, 1, 1,
0.3079945, 0.7166596, 0.8301528, 1, 1, 1, 1, 1,
0.3082168, -0.6784205, 0.797249, 1, 1, 1, 1, 1,
0.3086871, 1.293346, -0.2124229, 1, 1, 1, 1, 1,
0.3090287, 1.634839, 2.230653, 1, 1, 1, 1, 1,
0.3137286, 0.2616902, -0.705735, 1, 1, 1, 1, 1,
0.3191485, -0.9024689, 2.843573, 0, 0, 1, 1, 1,
0.320553, 0.5782202, 0.223793, 1, 0, 0, 1, 1,
0.3216923, -0.6493385, 3.194334, 1, 0, 0, 1, 1,
0.3238757, 0.2019809, 0.6961299, 1, 0, 0, 1, 1,
0.3239381, -0.2987534, 1.982112, 1, 0, 0, 1, 1,
0.324433, -1.711261, 2.025918, 1, 0, 0, 1, 1,
0.3249667, -0.2797669, 3.08735, 0, 0, 0, 1, 1,
0.3252676, 0.2295279, 1.362621, 0, 0, 0, 1, 1,
0.3254872, 0.4572067, 0.6371214, 0, 0, 0, 1, 1,
0.3268525, 0.8878493, -0.8463291, 0, 0, 0, 1, 1,
0.3310705, -1.218389, 2.898499, 0, 0, 0, 1, 1,
0.3329701, 0.1748815, 2.166976, 0, 0, 0, 1, 1,
0.3341326, -0.4514714, 3.057385, 0, 0, 0, 1, 1,
0.3363197, 0.4468198, 0.6125752, 1, 1, 1, 1, 1,
0.3365115, 1.224819, -1.002349, 1, 1, 1, 1, 1,
0.3366178, 2.175781, -0.8298583, 1, 1, 1, 1, 1,
0.3370987, -1.426183, 1.350609, 1, 1, 1, 1, 1,
0.3382477, -1.450026, 2.627812, 1, 1, 1, 1, 1,
0.3435965, -0.1781698, 1.536112, 1, 1, 1, 1, 1,
0.3468032, 0.57942, 0.09369601, 1, 1, 1, 1, 1,
0.3471916, 1.9025, -0.645439, 1, 1, 1, 1, 1,
0.3485118, -0.2406228, 0.687288, 1, 1, 1, 1, 1,
0.3541247, 0.7738528, 0.6966479, 1, 1, 1, 1, 1,
0.3609041, -1.109108, 1.87828, 1, 1, 1, 1, 1,
0.3635202, -0.1172982, 1.094546, 1, 1, 1, 1, 1,
0.3636015, -0.4694314, 3.070357, 1, 1, 1, 1, 1,
0.3656462, 1.051063, 0.2494151, 1, 1, 1, 1, 1,
0.3702292, 1.878045, -1.200346, 1, 1, 1, 1, 1,
0.374741, -0.4161676, 2.206405, 0, 0, 1, 1, 1,
0.3757161, 1.897218, -0.3611884, 1, 0, 0, 1, 1,
0.3757783, -0.3754633, 2.256422, 1, 0, 0, 1, 1,
0.3771232, -0.9745087, 3.946298, 1, 0, 0, 1, 1,
0.3779896, -0.3211963, 2.383665, 1, 0, 0, 1, 1,
0.3792837, -0.3144266, 1.185062, 1, 0, 0, 1, 1,
0.3860118, -0.8007901, 3.106663, 0, 0, 0, 1, 1,
0.4059168, -1.443402, 3.844599, 0, 0, 0, 1, 1,
0.4070239, 0.2342526, 0.6487344, 0, 0, 0, 1, 1,
0.408076, 1.738434, 0.6819719, 0, 0, 0, 1, 1,
0.4096109, -2.353729, 4.329425, 0, 0, 0, 1, 1,
0.409734, 1.135416, 2.939273, 0, 0, 0, 1, 1,
0.4114799, -0.9972265, 3.618434, 0, 0, 0, 1, 1,
0.4132496, 1.027375, -0.009256998, 1, 1, 1, 1, 1,
0.4225072, 1.750102, 0.2784348, 1, 1, 1, 1, 1,
0.4291803, 0.392086, 2.284405, 1, 1, 1, 1, 1,
0.4294935, -0.4877052, 4.238781, 1, 1, 1, 1, 1,
0.4321741, 0.5842067, 0.08604241, 1, 1, 1, 1, 1,
0.4323742, -0.5245911, 1.662844, 1, 1, 1, 1, 1,
0.4325528, 0.2301668, 0.2669971, 1, 1, 1, 1, 1,
0.4374251, -0.7331519, 0.6851726, 1, 1, 1, 1, 1,
0.440978, -0.2093771, 1.894089, 1, 1, 1, 1, 1,
0.4410958, 0.7263438, 2.009223, 1, 1, 1, 1, 1,
0.4436607, 1.942311, 1.915434, 1, 1, 1, 1, 1,
0.456964, -0.7645586, 4.177689, 1, 1, 1, 1, 1,
0.4576063, -0.240558, 1.616226, 1, 1, 1, 1, 1,
0.4589282, 1.91152, -0.2785867, 1, 1, 1, 1, 1,
0.4659811, -0.06381836, 2.578331, 1, 1, 1, 1, 1,
0.4667735, 1.947662, 0.08674853, 0, 0, 1, 1, 1,
0.4669035, 0.9840495, -1.172704, 1, 0, 0, 1, 1,
0.4719745, -0.7008601, 0.7865356, 1, 0, 0, 1, 1,
0.4819827, 0.6093834, 0.8972707, 1, 0, 0, 1, 1,
0.4871312, 0.6153265, 0.4064925, 1, 0, 0, 1, 1,
0.4885793, 1.659254, -1.009292, 1, 0, 0, 1, 1,
0.4890532, 0.3483725, 0.9497039, 0, 0, 0, 1, 1,
0.489761, 0.2718679, -0.4460045, 0, 0, 0, 1, 1,
0.4905428, -0.6057601, 2.99869, 0, 0, 0, 1, 1,
0.4908158, -0.1270937, 2.212396, 0, 0, 0, 1, 1,
0.4924945, -1.137993, 4.011616, 0, 0, 0, 1, 1,
0.4940147, 0.01366355, 0.3916878, 0, 0, 0, 1, 1,
0.4971553, 0.4430586, 0.6806774, 0, 0, 0, 1, 1,
0.498625, 1.027906, -0.904456, 1, 1, 1, 1, 1,
0.4999157, -0.1102503, 2.335141, 1, 1, 1, 1, 1,
0.5013318, -0.3341238, 2.26954, 1, 1, 1, 1, 1,
0.5058063, 0.8171104, 0.3197916, 1, 1, 1, 1, 1,
0.5074812, -0.1480731, 1.961481, 1, 1, 1, 1, 1,
0.5084769, 1.131618, -0.8474919, 1, 1, 1, 1, 1,
0.5086846, 0.4811747, 1.151889, 1, 1, 1, 1, 1,
0.5096121, -1.090526, 3.054539, 1, 1, 1, 1, 1,
0.5106451, -1.063062, 2.109885, 1, 1, 1, 1, 1,
0.5195971, -0.724251, 2.920169, 1, 1, 1, 1, 1,
0.5209094, 0.3028, -0.1828739, 1, 1, 1, 1, 1,
0.5309267, 0.8812932, 2.119288, 1, 1, 1, 1, 1,
0.5351854, 2.418923, -0.9372081, 1, 1, 1, 1, 1,
0.5372537, 1.2637, 0.03144876, 1, 1, 1, 1, 1,
0.5385332, -0.9132052, 4.29975, 1, 1, 1, 1, 1,
0.5395995, -0.987004, 1.995818, 0, 0, 1, 1, 1,
0.5405254, -0.7768901, 1.632971, 1, 0, 0, 1, 1,
0.5416074, 0.3169304, 0.577088, 1, 0, 0, 1, 1,
0.5425496, 1.199243, -0.8242338, 1, 0, 0, 1, 1,
0.5449024, 1.112629, -0.9615489, 1, 0, 0, 1, 1,
0.5552469, 0.7068003, -1.529418, 1, 0, 0, 1, 1,
0.5599257, 1.727231, 0.1350622, 0, 0, 0, 1, 1,
0.5652404, -0.4815625, 2.132247, 0, 0, 0, 1, 1,
0.5807711, 0.6556708, 0.3614101, 0, 0, 0, 1, 1,
0.580777, -0.365962, 3.274137, 0, 0, 0, 1, 1,
0.5812266, 0.3228011, 1.931123, 0, 0, 0, 1, 1,
0.5822218, -1.198193, 3.346466, 0, 0, 0, 1, 1,
0.5868475, 0.4844941, 0.730723, 0, 0, 0, 1, 1,
0.5960385, 0.1643176, 2.213056, 1, 1, 1, 1, 1,
0.6048306, 1.43816, 0.1635905, 1, 1, 1, 1, 1,
0.606503, 1.158373, 0.7542562, 1, 1, 1, 1, 1,
0.6175272, 0.0702341, 0.506613, 1, 1, 1, 1, 1,
0.6177388, -0.6395065, 2.229281, 1, 1, 1, 1, 1,
0.6227267, 0.5585406, 1.149841, 1, 1, 1, 1, 1,
0.62321, 0.574214, 1.132655, 1, 1, 1, 1, 1,
0.627071, -0.594032, 1.46374, 1, 1, 1, 1, 1,
0.6292856, 0.2482773, 1.916855, 1, 1, 1, 1, 1,
0.6294484, 1.707938, 1.777927, 1, 1, 1, 1, 1,
0.6365452, -0.05118151, 2.159599, 1, 1, 1, 1, 1,
0.6365962, -1.211543, 5.158455, 1, 1, 1, 1, 1,
0.6385289, 2.040067, 0.0005067149, 1, 1, 1, 1, 1,
0.6401953, -2.550689, 2.742775, 1, 1, 1, 1, 1,
0.6403416, 0.04033645, 2.371291, 1, 1, 1, 1, 1,
0.6502709, -0.8640809, 1.077901, 0, 0, 1, 1, 1,
0.6546457, 1.169859, -1.599948, 1, 0, 0, 1, 1,
0.6577449, 0.8203437, 0.4225714, 1, 0, 0, 1, 1,
0.6639547, -0.5560216, 4.347349, 1, 0, 0, 1, 1,
0.6649917, -0.1524145, 1.696798, 1, 0, 0, 1, 1,
0.6700905, -0.5371631, 3.402105, 1, 0, 0, 1, 1,
0.670431, -0.4897523, 0.7506322, 0, 0, 0, 1, 1,
0.6707223, 1.748834, -0.6139795, 0, 0, 0, 1, 1,
0.6752981, -0.2806967, 2.329871, 0, 0, 0, 1, 1,
0.6753429, 0.3064367, 2.082806, 0, 0, 0, 1, 1,
0.6779496, -1.093732, 2.003161, 0, 0, 0, 1, 1,
0.6797348, 1.193152, -0.3975102, 0, 0, 0, 1, 1,
0.6841874, 0.5016661, -0.7770876, 0, 0, 0, 1, 1,
0.6881335, 0.9690031, -0.9058449, 1, 1, 1, 1, 1,
0.6936469, 1.838007, 0.4831319, 1, 1, 1, 1, 1,
0.6948485, 0.1090684, 1.369727, 1, 1, 1, 1, 1,
0.6954339, -0.9085417, 6.049749, 1, 1, 1, 1, 1,
0.6989256, -1.423236, 3.401913, 1, 1, 1, 1, 1,
0.7049159, 1.941489, 2.371469, 1, 1, 1, 1, 1,
0.7059832, 0.7042159, 1.105276, 1, 1, 1, 1, 1,
0.7076226, 0.3711564, 1.992359, 1, 1, 1, 1, 1,
0.7086571, -0.2243282, 1.845091, 1, 1, 1, 1, 1,
0.710646, 1.156365, -0.1212404, 1, 1, 1, 1, 1,
0.7112314, -0.5230939, 1.513134, 1, 1, 1, 1, 1,
0.7172983, -0.1936586, -0.07446625, 1, 1, 1, 1, 1,
0.7265974, -0.944963, 0.6055172, 1, 1, 1, 1, 1,
0.7266156, -1.024297, 1.817727, 1, 1, 1, 1, 1,
0.7319077, 1.123749, 1.003778, 1, 1, 1, 1, 1,
0.7330903, -0.7208704, 2.585233, 0, 0, 1, 1, 1,
0.7361591, 0.2550063, 3.714293, 1, 0, 0, 1, 1,
0.7375754, -1.190739, 4.348007, 1, 0, 0, 1, 1,
0.7410179, 0.8197976, 0.1771126, 1, 0, 0, 1, 1,
0.7441222, 0.9183993, -0.4104505, 1, 0, 0, 1, 1,
0.7472585, 0.6309526, -0.2220174, 1, 0, 0, 1, 1,
0.7595276, -0.8284497, 1.490773, 0, 0, 0, 1, 1,
0.7603644, -0.4422225, 2.273213, 0, 0, 0, 1, 1,
0.7630155, -1.660338, 2.219807, 0, 0, 0, 1, 1,
0.765137, 1.292235, 1.206736, 0, 0, 0, 1, 1,
0.767397, 0.8723162, 0.06194242, 0, 0, 0, 1, 1,
0.7712632, -2.181519, 2.672031, 0, 0, 0, 1, 1,
0.7786921, 0.5748278, 1.474739, 0, 0, 0, 1, 1,
0.7866291, 0.1330353, 2.274927, 1, 1, 1, 1, 1,
0.7895836, -0.3066016, 3.095567, 1, 1, 1, 1, 1,
0.7906651, -1.232704, 3.856629, 1, 1, 1, 1, 1,
0.797195, 0.5946549, 1.960203, 1, 1, 1, 1, 1,
0.7984251, -1.069321, 2.687396, 1, 1, 1, 1, 1,
0.799159, 0.4665518, 0.6584412, 1, 1, 1, 1, 1,
0.8043557, 0.3425128, 0.7327363, 1, 1, 1, 1, 1,
0.8056712, -0.4185803, 2.142165, 1, 1, 1, 1, 1,
0.8091832, -1.356708, 1.373611, 1, 1, 1, 1, 1,
0.8122296, 0.8054058, 2.143691, 1, 1, 1, 1, 1,
0.8153625, -0.7702847, 2.760595, 1, 1, 1, 1, 1,
0.8184126, -1.498808, 2.739129, 1, 1, 1, 1, 1,
0.8186016, -1.714531, 1.175156, 1, 1, 1, 1, 1,
0.8221235, 0.2719536, 2.730424, 1, 1, 1, 1, 1,
0.8242673, 0.3847901, -1.24294, 1, 1, 1, 1, 1,
0.8279898, 1.256634, 0.9783114, 0, 0, 1, 1, 1,
0.8288986, -0.5613152, 3.584675, 1, 0, 0, 1, 1,
0.8301084, -0.8446937, 2.133247, 1, 0, 0, 1, 1,
0.8344043, 2.089612, 0.2828857, 1, 0, 0, 1, 1,
0.8362039, -0.5896298, 1.113557, 1, 0, 0, 1, 1,
0.8440323, 2.510173, -1.158946, 1, 0, 0, 1, 1,
0.8494481, -0.9614706, 2.82447, 0, 0, 0, 1, 1,
0.8502657, 1.795141, 0.05035431, 0, 0, 0, 1, 1,
0.8514013, 0.4045029, -1.407887, 0, 0, 0, 1, 1,
0.8514109, -0.153239, 1.366603, 0, 0, 0, 1, 1,
0.8531697, 0.04049628, 1.6908, 0, 0, 0, 1, 1,
0.8565589, -2.335401, 3.780447, 0, 0, 0, 1, 1,
0.8726532, 0.8952491, 0.1857984, 0, 0, 0, 1, 1,
0.8741278, 0.4946546, 1.639945, 1, 1, 1, 1, 1,
0.8754223, 2.395369, 1.53251, 1, 1, 1, 1, 1,
0.8805704, -0.3496893, 0.9999068, 1, 1, 1, 1, 1,
0.884016, -0.01971507, 2.991541, 1, 1, 1, 1, 1,
0.8902661, -0.6818795, 0.7468846, 1, 1, 1, 1, 1,
0.8993307, -0.9528888, 1.794143, 1, 1, 1, 1, 1,
0.900218, 1.920409, 0.2098302, 1, 1, 1, 1, 1,
0.9093659, -1.591709, 3.74052, 1, 1, 1, 1, 1,
0.9098012, 0.1902638, 0.7251907, 1, 1, 1, 1, 1,
0.9127584, -0.3073464, 2.10971, 1, 1, 1, 1, 1,
0.9149728, 1.202801, 1.793127, 1, 1, 1, 1, 1,
0.915249, 0.434969, 0.9474639, 1, 1, 1, 1, 1,
0.9205813, 2.082429, 0.5923257, 1, 1, 1, 1, 1,
0.9215634, 0.8744782, 0.5111002, 1, 1, 1, 1, 1,
0.9243084, -0.8491763, 0.562528, 1, 1, 1, 1, 1,
0.9272686, 0.3350595, 1.84335, 0, 0, 1, 1, 1,
0.9325745, 1.079898, 1.303062, 1, 0, 0, 1, 1,
0.9355112, 0.05841995, 1.290062, 1, 0, 0, 1, 1,
0.9401345, 2.028392, -0.6512762, 1, 0, 0, 1, 1,
0.9416828, 0.6611541, -0.272689, 1, 0, 0, 1, 1,
0.9447688, 0.03930255, 0.2526838, 1, 0, 0, 1, 1,
0.9454092, 1.334932, 0.5180082, 0, 0, 0, 1, 1,
0.9462023, -1.305616, 2.325844, 0, 0, 0, 1, 1,
0.9541568, 0.0003777795, 1.352111, 0, 0, 0, 1, 1,
0.9562728, -0.1130931, 0.8065286, 0, 0, 0, 1, 1,
0.967066, 1.270948, -0.8495169, 0, 0, 0, 1, 1,
0.9675746, 1.652724, 1.464191, 0, 0, 0, 1, 1,
0.9735073, -3.103222, 2.74823, 0, 0, 0, 1, 1,
0.9794854, 1.492222, 2.056337, 1, 1, 1, 1, 1,
0.9852644, -0.09916374, 2.521427, 1, 1, 1, 1, 1,
0.9956555, 0.5954551, 0.959384, 1, 1, 1, 1, 1,
1.000351, -0.5484664, 3.28573, 1, 1, 1, 1, 1,
1.004031, -1.634128, 3.985893, 1, 1, 1, 1, 1,
1.004222, 0.4454562, 1.075205, 1, 1, 1, 1, 1,
1.004704, -1.295317, 2.482472, 1, 1, 1, 1, 1,
1.004787, -1.022382, 2.324625, 1, 1, 1, 1, 1,
1.008487, -1.681194, 2.140871, 1, 1, 1, 1, 1,
1.012408, -1.380565, 2.983923, 1, 1, 1, 1, 1,
1.020356, -0.3212593, 1.363445, 1, 1, 1, 1, 1,
1.027933, 0.08216785, 0.8409064, 1, 1, 1, 1, 1,
1.029056, -0.2837845, 1.637689, 1, 1, 1, 1, 1,
1.030678, -0.9806995, 3.215295, 1, 1, 1, 1, 1,
1.042558, -0.4399715, 0.4195408, 1, 1, 1, 1, 1,
1.05253, 1.120151, 0.2887932, 0, 0, 1, 1, 1,
1.059781, -0.05358687, 0.9166743, 1, 0, 0, 1, 1,
1.060768, 0.7035087, -0.5093197, 1, 0, 0, 1, 1,
1.063896, 1.910153, -1.216347, 1, 0, 0, 1, 1,
1.064883, -0.3718861, 4.372874, 1, 0, 0, 1, 1,
1.066324, -0.6051586, 1.000024, 1, 0, 0, 1, 1,
1.068879, -0.6846063, 1.78834, 0, 0, 0, 1, 1,
1.071602, -1.260259, 2.871087, 0, 0, 0, 1, 1,
1.078359, -0.8688092, 2.440649, 0, 0, 0, 1, 1,
1.081097, 1.519045, 1.538411, 0, 0, 0, 1, 1,
1.088711, 1.157037, 0.898982, 0, 0, 0, 1, 1,
1.09742, -1.877193, 3.619242, 0, 0, 0, 1, 1,
1.10282, 0.597055, 0.6078897, 0, 0, 0, 1, 1,
1.104477, 0.7120823, 1.164587, 1, 1, 1, 1, 1,
1.113837, 0.3954612, 0.809346, 1, 1, 1, 1, 1,
1.114973, -1.894812, 2.569877, 1, 1, 1, 1, 1,
1.116993, 0.7578036, 1.062702, 1, 1, 1, 1, 1,
1.124014, 0.5764389, 1.630507, 1, 1, 1, 1, 1,
1.124564, -0.5212137, 3.738274, 1, 1, 1, 1, 1,
1.124854, 0.7621948, 1.194086, 1, 1, 1, 1, 1,
1.128684, 0.2103496, 3.818929, 1, 1, 1, 1, 1,
1.133402, 0.2855016, 1.832391, 1, 1, 1, 1, 1,
1.141174, -0.7501447, 1.269818, 1, 1, 1, 1, 1,
1.146515, 1.510573, -0.9273484, 1, 1, 1, 1, 1,
1.147162, -2.162232, 3.142113, 1, 1, 1, 1, 1,
1.148792, -0.8832877, 1.463177, 1, 1, 1, 1, 1,
1.151212, -1.077499, 2.908532, 1, 1, 1, 1, 1,
1.15865, 1.365899, -0.1122225, 1, 1, 1, 1, 1,
1.160259, 1.083593, 0.3884354, 0, 0, 1, 1, 1,
1.160468, -1.213576, 2.680971, 1, 0, 0, 1, 1,
1.160768, 0.9356372, 1.691934, 1, 0, 0, 1, 1,
1.166413, -0.3671821, 2.328737, 1, 0, 0, 1, 1,
1.175621, -1.556676, 3.704762, 1, 0, 0, 1, 1,
1.176319, 1.140591, 1.078453, 1, 0, 0, 1, 1,
1.177813, 0.387069, -1.195295, 0, 0, 0, 1, 1,
1.178202, -1.460162, 2.610879, 0, 0, 0, 1, 1,
1.181342, -1.122011, 2.40869, 0, 0, 0, 1, 1,
1.187152, 0.1551854, 2.188397, 0, 0, 0, 1, 1,
1.188471, -0.8963701, 2.432089, 0, 0, 0, 1, 1,
1.189501, -0.04218409, 1.722722, 0, 0, 0, 1, 1,
1.193572, 0.6092278, 2.359435, 0, 0, 0, 1, 1,
1.198199, 0.4352682, 0.3821106, 1, 1, 1, 1, 1,
1.204339, 0.3798047, 0.7769349, 1, 1, 1, 1, 1,
1.207866, -0.471085, 2.238571, 1, 1, 1, 1, 1,
1.212711, 0.9884573, -0.007117211, 1, 1, 1, 1, 1,
1.213649, -1.182082, 3.108658, 1, 1, 1, 1, 1,
1.214454, -1.014711, 0.396752, 1, 1, 1, 1, 1,
1.217159, 0.3297305, 2.616411, 1, 1, 1, 1, 1,
1.223965, -0.9911534, 1.012566, 1, 1, 1, 1, 1,
1.234875, -0.1548293, 2.561631, 1, 1, 1, 1, 1,
1.235959, -1.576893, 5.327308, 1, 1, 1, 1, 1,
1.242396, -0.1947488, 1.824002, 1, 1, 1, 1, 1,
1.248194, -0.1568362, 3.517958, 1, 1, 1, 1, 1,
1.253992, -0.6365473, 1.542058, 1, 1, 1, 1, 1,
1.258419, 0.5810996, 0.66765, 1, 1, 1, 1, 1,
1.263255, -0.8964764, 3.535678, 1, 1, 1, 1, 1,
1.264516, 1.889305, 1.442232, 0, 0, 1, 1, 1,
1.26825, -1.217739, 1.653997, 1, 0, 0, 1, 1,
1.27065, -1.511435, 1.134175, 1, 0, 0, 1, 1,
1.271843, 1.665516, 1.850756, 1, 0, 0, 1, 1,
1.283741, -0.02566906, 0.5521758, 1, 0, 0, 1, 1,
1.288816, -0.6639661, 1.656473, 1, 0, 0, 1, 1,
1.291288, -1.316994, 2.534302, 0, 0, 0, 1, 1,
1.293457, -0.5442912, 3.88009, 0, 0, 0, 1, 1,
1.299654, 1.54004, 1.949162, 0, 0, 0, 1, 1,
1.300236, -0.4279706, 2.778159, 0, 0, 0, 1, 1,
1.303552, -1.237299, 1.847198, 0, 0, 0, 1, 1,
1.311354, -1.388886, 1.701044, 0, 0, 0, 1, 1,
1.314023, -0.3928484, 1.787484, 0, 0, 0, 1, 1,
1.329025, -0.5844215, 1.967263, 1, 1, 1, 1, 1,
1.341053, 0.5906521, 0.5637605, 1, 1, 1, 1, 1,
1.344348, 0.7042707, 0.1349355, 1, 1, 1, 1, 1,
1.347785, -0.4309673, 3.465169, 1, 1, 1, 1, 1,
1.35068, 0.05893918, -0.2099934, 1, 1, 1, 1, 1,
1.351755, -1.321731, 3.166878, 1, 1, 1, 1, 1,
1.356257, -0.1477823, 1.253104, 1, 1, 1, 1, 1,
1.366324, 0.3960845, 0.4994434, 1, 1, 1, 1, 1,
1.373352, -0.9584938, 1.333855, 1, 1, 1, 1, 1,
1.378427, 2.259359, 0.1807257, 1, 1, 1, 1, 1,
1.387325, -0.6647472, 1.698148, 1, 1, 1, 1, 1,
1.394819, 2.312736, 2.150714, 1, 1, 1, 1, 1,
1.397985, 0.5754312, 0.9526269, 1, 1, 1, 1, 1,
1.405827, 0.4410398, 0.2369631, 1, 1, 1, 1, 1,
1.409245, 0.4946965, 0.5047342, 1, 1, 1, 1, 1,
1.412714, 0.4068897, 0.3545535, 0, 0, 1, 1, 1,
1.41414, 0.2474143, 1.695449, 1, 0, 0, 1, 1,
1.422341, -0.6235936, 0.7052779, 1, 0, 0, 1, 1,
1.438449, -0.262641, 3.044573, 1, 0, 0, 1, 1,
1.442089, -0.1403368, -0.02081702, 1, 0, 0, 1, 1,
1.451157, 0.81138, 0.908418, 1, 0, 0, 1, 1,
1.457206, 0.4504059, 0.5815534, 0, 0, 0, 1, 1,
1.46021, -0.481619, 1.93322, 0, 0, 0, 1, 1,
1.491876, 0.01043041, 1.21695, 0, 0, 0, 1, 1,
1.517445, 0.1547684, 2.023388, 0, 0, 0, 1, 1,
1.524357, -0.3514144, 2.918988, 0, 0, 0, 1, 1,
1.53007, -1.507538, 2.226473, 0, 0, 0, 1, 1,
1.537023, -0.5668569, 1.398175, 0, 0, 0, 1, 1,
1.539469, 1.572673, 0.250336, 1, 1, 1, 1, 1,
1.548758, 0.4975117, 2.021398, 1, 1, 1, 1, 1,
1.551954, 1.343669, 0.8201783, 1, 1, 1, 1, 1,
1.558416, 0.426634, -0.5961508, 1, 1, 1, 1, 1,
1.572974, -0.6653523, 1.502125, 1, 1, 1, 1, 1,
1.579092, 1.584274, 0.4051684, 1, 1, 1, 1, 1,
1.582756, 0.2992199, 1.732586, 1, 1, 1, 1, 1,
1.59868, 1.261362, 2.259771, 1, 1, 1, 1, 1,
1.598837, 0.5372288, 2.143594, 1, 1, 1, 1, 1,
1.610973, 0.9662313, 3.080101, 1, 1, 1, 1, 1,
1.619016, 0.02771608, 0.6451199, 1, 1, 1, 1, 1,
1.629931, 0.2294495, 1.599537, 1, 1, 1, 1, 1,
1.645312, 0.01198416, 1.555622, 1, 1, 1, 1, 1,
1.652768, -1.222234, 4.028652, 1, 1, 1, 1, 1,
1.661887, -0.9271106, 2.192993, 1, 1, 1, 1, 1,
1.684089, -0.1436388, 1.45238, 0, 0, 1, 1, 1,
1.690176, 1.791681, -1.331422, 1, 0, 0, 1, 1,
1.692514, -0.839595, 1.990275, 1, 0, 0, 1, 1,
1.714784, 0.2396573, 2.482726, 1, 0, 0, 1, 1,
1.727123, 0.7524024, -1.13786, 1, 0, 0, 1, 1,
1.730311, -0.571927, 0.8916943, 1, 0, 0, 1, 1,
1.747703, -0.7394605, 3.74396, 0, 0, 0, 1, 1,
1.755387, 0.5628368, 0.1450036, 0, 0, 0, 1, 1,
1.763552, 0.3764456, 0.5030816, 0, 0, 0, 1, 1,
1.764857, 1.866708, 1.757, 0, 0, 0, 1, 1,
1.782415, 0.07097939, 1.680203, 0, 0, 0, 1, 1,
1.78472, 0.08208331, 3.255555, 0, 0, 0, 1, 1,
1.785311, -0.614668, 2.051397, 0, 0, 0, 1, 1,
1.79353, -0.4049347, 2.709515, 1, 1, 1, 1, 1,
1.796886, -0.5058976, 4.159298, 1, 1, 1, 1, 1,
1.799277, 0.6293327, -0.4479293, 1, 1, 1, 1, 1,
1.87168, -0.6812618, 1.507727, 1, 1, 1, 1, 1,
1.871878, -1.687542, 4.254285, 1, 1, 1, 1, 1,
1.918292, -1.437648, 1.964254, 1, 1, 1, 1, 1,
1.943407, -0.499328, 2.515745, 1, 1, 1, 1, 1,
1.94463, 1.449946, -1.385389, 1, 1, 1, 1, 1,
1.964406, -1.24673, 2.670005, 1, 1, 1, 1, 1,
1.96463, -0.4092765, 2.599848, 1, 1, 1, 1, 1,
1.972268, -1.09455, 1.305042, 1, 1, 1, 1, 1,
1.973653, -1.250485, 2.097506, 1, 1, 1, 1, 1,
2.000111, -0.9258561, 3.299627, 1, 1, 1, 1, 1,
2.000489, 0.4246113, 1.108395, 1, 1, 1, 1, 1,
2.00245, 0.1128043, 1.081298, 1, 1, 1, 1, 1,
2.006495, 2.859663, -1.301312, 0, 0, 1, 1, 1,
2.008456, 1.120493, 1.020859, 1, 0, 0, 1, 1,
2.043097, -0.7527311, 0.2422396, 1, 0, 0, 1, 1,
2.102143, -0.4746563, 1.86455, 1, 0, 0, 1, 1,
2.127318, -0.6247986, 1.341538, 1, 0, 0, 1, 1,
2.128965, -1.426929, 3.21003, 1, 0, 0, 1, 1,
2.168638, -0.3768493, 1.966278, 0, 0, 0, 1, 1,
2.1791, 2.479998, 0.05252233, 0, 0, 0, 1, 1,
2.188544, -0.1906347, 1.089086, 0, 0, 0, 1, 1,
2.248129, 0.3477192, 2.286686, 0, 0, 0, 1, 1,
2.259497, 1.215015, 1.39932, 0, 0, 0, 1, 1,
2.357049, 0.9413248, 1.267035, 0, 0, 0, 1, 1,
2.388382, 0.1903979, 2.850647, 0, 0, 0, 1, 1,
2.492787, 0.4897037, 0.9070845, 1, 1, 1, 1, 1,
2.676854, -1.612008, 0.9673226, 1, 1, 1, 1, 1,
2.69606, -1.065792, 2.0943, 1, 1, 1, 1, 1,
2.877845, -0.01157, 2.003407, 1, 1, 1, 1, 1,
2.961855, 0.0911762, 0.9440193, 1, 1, 1, 1, 1,
2.992817, -1.099707, 0.5742234, 1, 1, 1, 1, 1,
3.058732, -0.3773126, 2.906025, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
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
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.658703;
var distance = 33.92578;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.07996702, -0.01825953, -0.4935174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92578);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
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
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
