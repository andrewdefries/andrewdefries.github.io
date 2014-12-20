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
-2.910301, -0.5949787, -2.392995, 1, 0, 0, 1,
-2.871936, -1.055049, -2.976504, 1, 0.007843138, 0, 1,
-2.823371, 0.3142153, 0.423775, 1, 0.01176471, 0, 1,
-2.708034, 1.206887, -2.12009, 1, 0.01960784, 0, 1,
-2.603279, -0.04097657, -0.5197855, 1, 0.02352941, 0, 1,
-2.56391, 0.4988171, -1.45507, 1, 0.03137255, 0, 1,
-2.479736, 0.1312161, -1.246352, 1, 0.03529412, 0, 1,
-2.409704, -0.8014541, -0.2746847, 1, 0.04313726, 0, 1,
-2.396297, -1.172373, -2.424606, 1, 0.04705882, 0, 1,
-2.351266, -0.07656596, -1.416516, 1, 0.05490196, 0, 1,
-2.330786, 0.9655482, -1.295959, 1, 0.05882353, 0, 1,
-2.300625, -1.921342, -3.176917, 1, 0.06666667, 0, 1,
-2.246151, 0.2356848, -2.319443, 1, 0.07058824, 0, 1,
-2.227224, 0.7457353, 0.6628785, 1, 0.07843138, 0, 1,
-2.172383, -1.789419, -1.638615, 1, 0.08235294, 0, 1,
-2.163345, 1.082263, -1.909331, 1, 0.09019608, 0, 1,
-2.147928, 0.1025497, -0.8194559, 1, 0.09411765, 0, 1,
-2.146048, -0.3544781, -1.190716, 1, 0.1019608, 0, 1,
-2.104767, -1.053134, -1.842974, 1, 0.1098039, 0, 1,
-2.072035, 0.40628, -1.67178, 1, 0.1137255, 0, 1,
-2.064033, -0.9576356, -1.342146, 1, 0.1215686, 0, 1,
-2.021698, 0.02665363, -3.473113, 1, 0.1254902, 0, 1,
-2.013201, -0.4304832, -1.551007, 1, 0.1333333, 0, 1,
-2.00882, -0.2693371, -1.429294, 1, 0.1372549, 0, 1,
-1.96414, 1.005747, -1.606431, 1, 0.145098, 0, 1,
-1.938771, -0.01835551, -1.198841, 1, 0.1490196, 0, 1,
-1.870038, 0.8902255, 0.2858572, 1, 0.1568628, 0, 1,
-1.861209, -1.113323, -2.488143, 1, 0.1607843, 0, 1,
-1.845954, -1.969649, -1.364141, 1, 0.1686275, 0, 1,
-1.844753, -1.324152, -3.213493, 1, 0.172549, 0, 1,
-1.831978, 0.852423, -0.244443, 1, 0.1803922, 0, 1,
-1.822781, 0.7737949, -1.128244, 1, 0.1843137, 0, 1,
-1.821865, 2.135968, 0.646863, 1, 0.1921569, 0, 1,
-1.81765, -1.230926, -2.183092, 1, 0.1960784, 0, 1,
-1.813582, 0.8337591, 0.1903434, 1, 0.2039216, 0, 1,
-1.803473, -0.06755628, -0.9164062, 1, 0.2117647, 0, 1,
-1.798902, -0.2779495, -1.3184, 1, 0.2156863, 0, 1,
-1.784136, -0.1864291, -3.28512, 1, 0.2235294, 0, 1,
-1.780276, 0.6579863, -1.885188, 1, 0.227451, 0, 1,
-1.774028, -1.138983, -1.443425, 1, 0.2352941, 0, 1,
-1.754052, -1.749015, -0.6553291, 1, 0.2392157, 0, 1,
-1.746258, 1.216695, -1.334516, 1, 0.2470588, 0, 1,
-1.739288, 1.220708, -0.6411821, 1, 0.2509804, 0, 1,
-1.690709, -1.067031, -1.923965, 1, 0.2588235, 0, 1,
-1.672348, -0.967739, -2.272495, 1, 0.2627451, 0, 1,
-1.6676, 1.729577, -3.132857, 1, 0.2705882, 0, 1,
-1.660856, -0.5286214, -1.532324, 1, 0.2745098, 0, 1,
-1.656965, -0.4548694, -3.6648, 1, 0.282353, 0, 1,
-1.656265, -1.428362, -3.063171, 1, 0.2862745, 0, 1,
-1.654371, 0.02558138, -0.03605081, 1, 0.2941177, 0, 1,
-1.653098, -1.476882, -0.6729361, 1, 0.3019608, 0, 1,
-1.650838, 0.8668505, -0.4886985, 1, 0.3058824, 0, 1,
-1.643668, 0.1522747, -1.918929, 1, 0.3137255, 0, 1,
-1.622593, -0.08761809, -0.1298715, 1, 0.3176471, 0, 1,
-1.617458, 0.6751388, -0.7010263, 1, 0.3254902, 0, 1,
-1.614898, 0.5898193, -1.155078, 1, 0.3294118, 0, 1,
-1.613796, 0.09632665, -1.740231, 1, 0.3372549, 0, 1,
-1.613168, -0.3737565, -1.306667, 1, 0.3411765, 0, 1,
-1.609866, -0.5587008, -3.141265, 1, 0.3490196, 0, 1,
-1.572263, -1.211689, -1.707606, 1, 0.3529412, 0, 1,
-1.568208, 0.06418072, -1.61019, 1, 0.3607843, 0, 1,
-1.567915, 0.1346426, 0.1872632, 1, 0.3647059, 0, 1,
-1.557072, -0.4999136, -1.81539, 1, 0.372549, 0, 1,
-1.550984, -0.2121413, -1.896743, 1, 0.3764706, 0, 1,
-1.539938, 0.09634601, -3.680444, 1, 0.3843137, 0, 1,
-1.53664, -0.1499016, 0.7426633, 1, 0.3882353, 0, 1,
-1.533206, 0.8122354, -1.09717, 1, 0.3960784, 0, 1,
-1.524423, -1.138364, -1.177076, 1, 0.4039216, 0, 1,
-1.522739, 0.06353444, -1.613766, 1, 0.4078431, 0, 1,
-1.519858, 0.5128615, 0.7712128, 1, 0.4156863, 0, 1,
-1.518351, 0.3750019, -0.634209, 1, 0.4196078, 0, 1,
-1.518001, -0.5441563, -3.079726, 1, 0.427451, 0, 1,
-1.515405, -0.6699895, -3.353859, 1, 0.4313726, 0, 1,
-1.510817, 0.3658085, -0.5870242, 1, 0.4392157, 0, 1,
-1.50039, -0.3346853, 0.1040238, 1, 0.4431373, 0, 1,
-1.478902, -0.9749815, -4.381027, 1, 0.4509804, 0, 1,
-1.473867, 1.031823, -1.282308, 1, 0.454902, 0, 1,
-1.473167, -0.3066441, -2.953865, 1, 0.4627451, 0, 1,
-1.472001, 0.4911293, -2.915143, 1, 0.4666667, 0, 1,
-1.470636, 0.387791, -0.5244766, 1, 0.4745098, 0, 1,
-1.470238, -0.01964264, -1.545543, 1, 0.4784314, 0, 1,
-1.461147, -0.7680295, -3.109382, 1, 0.4862745, 0, 1,
-1.458457, -0.6504899, -2.783495, 1, 0.4901961, 0, 1,
-1.447196, 0.3095035, -1.634145, 1, 0.4980392, 0, 1,
-1.424401, 1.311749, -0.1688809, 1, 0.5058824, 0, 1,
-1.417617, -1.061555, -1.133765, 1, 0.509804, 0, 1,
-1.411528, 0.04937066, -1.372666, 1, 0.5176471, 0, 1,
-1.400336, 0.9529477, -0.006525898, 1, 0.5215687, 0, 1,
-1.393927, -0.3672044, -1.617633, 1, 0.5294118, 0, 1,
-1.389993, -1.720408, -2.77776, 1, 0.5333334, 0, 1,
-1.385986, 0.2694719, -1.826007, 1, 0.5411765, 0, 1,
-1.370363, 0.4641106, -2.518366, 1, 0.5450981, 0, 1,
-1.366711, -0.3554886, -2.942751, 1, 0.5529412, 0, 1,
-1.363389, 0.08581936, -0.7723472, 1, 0.5568628, 0, 1,
-1.359219, -2.309202, -3.498816, 1, 0.5647059, 0, 1,
-1.347295, 0.6686654, -1.055264, 1, 0.5686275, 0, 1,
-1.343234, 0.6779667, -0.1780138, 1, 0.5764706, 0, 1,
-1.343109, 0.8928111, -1.259192, 1, 0.5803922, 0, 1,
-1.337217, 0.4158148, -1.671422, 1, 0.5882353, 0, 1,
-1.321037, 0.4204776, -0.3339298, 1, 0.5921569, 0, 1,
-1.319602, 0.2758676, -1.024841, 1, 0.6, 0, 1,
-1.316002, 0.16042, -0.9441994, 1, 0.6078432, 0, 1,
-1.310212, -0.276255, -1.466275, 1, 0.6117647, 0, 1,
-1.299806, -0.6511775, -3.992425, 1, 0.6196079, 0, 1,
-1.298753, 0.7493379, -1.863748, 1, 0.6235294, 0, 1,
-1.294469, -0.2540412, -0.9634877, 1, 0.6313726, 0, 1,
-1.288614, -1.680084, -1.404222, 1, 0.6352941, 0, 1,
-1.285724, -0.2910293, -2.887449, 1, 0.6431373, 0, 1,
-1.285214, -0.1724972, -1.203289, 1, 0.6470588, 0, 1,
-1.272215, 1.245732, -1.586344, 1, 0.654902, 0, 1,
-1.269708, 0.6051736, -0.8423438, 1, 0.6588235, 0, 1,
-1.26867, -1.114737, -3.729844, 1, 0.6666667, 0, 1,
-1.268368, 0.447709, -2.551032, 1, 0.6705883, 0, 1,
-1.266271, -0.9299933, -2.008308, 1, 0.6784314, 0, 1,
-1.257036, 0.02381504, -3.136686, 1, 0.682353, 0, 1,
-1.251841, -0.7678189, -1.224823, 1, 0.6901961, 0, 1,
-1.250577, 0.6236528, -1.128477, 1, 0.6941177, 0, 1,
-1.250391, 0.9087449, -1.224014, 1, 0.7019608, 0, 1,
-1.246078, -1.314936, -0.5202327, 1, 0.7098039, 0, 1,
-1.24576, 2.55878, 0.1224144, 1, 0.7137255, 0, 1,
-1.237196, 1.063327, -0.8513978, 1, 0.7215686, 0, 1,
-1.226083, 2.272279, 0.3989194, 1, 0.7254902, 0, 1,
-1.22592, -0.7223985, -2.286544, 1, 0.7333333, 0, 1,
-1.222323, 0.9821968, -0.6654343, 1, 0.7372549, 0, 1,
-1.193682, -0.8334832, -1.608362, 1, 0.7450981, 0, 1,
-1.181054, -0.8518695, -0.1057687, 1, 0.7490196, 0, 1,
-1.179953, -0.0101218, -0.6335972, 1, 0.7568628, 0, 1,
-1.178786, -0.3300011, -3.561578, 1, 0.7607843, 0, 1,
-1.177091, -0.8734082, -2.265475, 1, 0.7686275, 0, 1,
-1.176878, -1.006117, -1.479475, 1, 0.772549, 0, 1,
-1.162538, 0.3661592, -0.4617635, 1, 0.7803922, 0, 1,
-1.158429, -0.6358012, -3.915196, 1, 0.7843137, 0, 1,
-1.147784, -0.05438481, -1.700552, 1, 0.7921569, 0, 1,
-1.147036, -0.2833158, -0.3323808, 1, 0.7960784, 0, 1,
-1.140131, -1.129378, -1.718161, 1, 0.8039216, 0, 1,
-1.138056, -2.048288, -2.123621, 1, 0.8117647, 0, 1,
-1.136942, 0.5735673, -3.62924, 1, 0.8156863, 0, 1,
-1.112125, -1.664579, -2.155623, 1, 0.8235294, 0, 1,
-1.109164, -0.5645601, -2.17312, 1, 0.827451, 0, 1,
-1.108932, 0.3255762, -0.2500968, 1, 0.8352941, 0, 1,
-1.10755, -0.2763107, -1.690763, 1, 0.8392157, 0, 1,
-1.103097, -0.7335278, -2.167806, 1, 0.8470588, 0, 1,
-1.100368, -0.9832661, -4.119808, 1, 0.8509804, 0, 1,
-1.096555, -1.970818, -1.593601, 1, 0.8588235, 0, 1,
-1.096029, 0.03484385, -1.221787, 1, 0.8627451, 0, 1,
-1.091789, 2.372012, -1.655458, 1, 0.8705882, 0, 1,
-1.089803, -2.302067, -2.077469, 1, 0.8745098, 0, 1,
-1.088482, -0.5336207, -1.949804, 1, 0.8823529, 0, 1,
-1.087621, -0.3240048, -2.358113, 1, 0.8862745, 0, 1,
-1.077985, 0.2932751, -0.9131497, 1, 0.8941177, 0, 1,
-1.076622, -1.417279, -4.257654, 1, 0.8980392, 0, 1,
-1.069335, 0.7373276, 0.6096758, 1, 0.9058824, 0, 1,
-1.057388, -0.4230684, -1.472541, 1, 0.9137255, 0, 1,
-1.056046, 3.362734, -0.7802869, 1, 0.9176471, 0, 1,
-1.055336, -0.2579295, -0.5920503, 1, 0.9254902, 0, 1,
-1.051442, -0.863866, -1.25565, 1, 0.9294118, 0, 1,
-1.048904, 1.635038, -0.558709, 1, 0.9372549, 0, 1,
-1.048569, 0.3408067, -1.622058, 1, 0.9411765, 0, 1,
-1.047845, -3.901631, -2.154993, 1, 0.9490196, 0, 1,
-1.047826, -0.2547793, -1.837253, 1, 0.9529412, 0, 1,
-1.045746, 0.341758, -2.603534, 1, 0.9607843, 0, 1,
-1.035042, -1.128184, -5.280601, 1, 0.9647059, 0, 1,
-1.034501, -0.4967483, -1.719771, 1, 0.972549, 0, 1,
-1.030847, -1.264185, -1.669904, 1, 0.9764706, 0, 1,
-1.025437, 1.53387, -0.2637111, 1, 0.9843137, 0, 1,
-1.02298, -0.9714938, -0.3857333, 1, 0.9882353, 0, 1,
-1.022198, 1.288384, -1.905346, 1, 0.9960784, 0, 1,
-1.017686, -0.2807908, -2.446954, 0.9960784, 1, 0, 1,
-1.016488, -0.7908748, -2.157976, 0.9921569, 1, 0, 1,
-1.015523, 0.7084819, -2.588222, 0.9843137, 1, 0, 1,
-1.013535, -0.161585, -2.716134, 0.9803922, 1, 0, 1,
-1.011987, -1.511716, -2.188868, 0.972549, 1, 0, 1,
-1.011903, -0.75782, 0.1992022, 0.9686275, 1, 0, 1,
-1.01058, -0.08203062, -1.490058, 0.9607843, 1, 0, 1,
-1.007592, 0.6518338, -2.431947, 0.9568627, 1, 0, 1,
-1.006247, -0.5290089, -1.277454, 0.9490196, 1, 0, 1,
-1.003889, 1.495375, -1.154514, 0.945098, 1, 0, 1,
-1.00123, 0.03902958, 0.2967829, 0.9372549, 1, 0, 1,
-0.9963957, 0.4911971, -2.789743, 0.9333333, 1, 0, 1,
-0.9885721, -0.9183062, -1.125731, 0.9254902, 1, 0, 1,
-0.9812757, 1.080552, 0.7645372, 0.9215686, 1, 0, 1,
-0.9805326, 0.2573521, -2.350371, 0.9137255, 1, 0, 1,
-0.9624228, 0.2329946, -1.793035, 0.9098039, 1, 0, 1,
-0.9601813, -1.474678, -2.673401, 0.9019608, 1, 0, 1,
-0.9600521, -0.1864817, -1.350453, 0.8941177, 1, 0, 1,
-0.9595343, -2.734365, -3.367206, 0.8901961, 1, 0, 1,
-0.9483681, -1.438465, -2.245692, 0.8823529, 1, 0, 1,
-0.9468856, -0.6369683, -1.510001, 0.8784314, 1, 0, 1,
-0.9465398, 1.563094, -0.664171, 0.8705882, 1, 0, 1,
-0.9448927, -0.1113309, -2.18687, 0.8666667, 1, 0, 1,
-0.9411869, 0.4715832, -1.287705, 0.8588235, 1, 0, 1,
-0.9406927, 0.09649423, -2.949501, 0.854902, 1, 0, 1,
-0.9391263, 0.3916115, 0.2227144, 0.8470588, 1, 0, 1,
-0.9363134, -0.02567288, -2.454895, 0.8431373, 1, 0, 1,
-0.9341798, 1.186321, 0.4225539, 0.8352941, 1, 0, 1,
-0.930657, 0.4947249, -2.393099, 0.8313726, 1, 0, 1,
-0.9292246, 0.4180116, -0.7370694, 0.8235294, 1, 0, 1,
-0.9263209, -0.4429241, -3.244123, 0.8196079, 1, 0, 1,
-0.9222254, -1.177585, -4.271854, 0.8117647, 1, 0, 1,
-0.9186044, 0.09108645, -2.09641, 0.8078431, 1, 0, 1,
-0.9157824, 1.094983, -0.786196, 0.8, 1, 0, 1,
-0.9141155, 0.2175214, -1.270903, 0.7921569, 1, 0, 1,
-0.9094222, -0.21835, -1.616428, 0.7882353, 1, 0, 1,
-0.9078981, -0.8895761, -0.9490207, 0.7803922, 1, 0, 1,
-0.9077581, 1.01252, -0.8000579, 0.7764706, 1, 0, 1,
-0.9003586, 0.8071383, 0.3078244, 0.7686275, 1, 0, 1,
-0.8911745, 0.02703073, -2.280548, 0.7647059, 1, 0, 1,
-0.8900049, -0.3700084, -1.670866, 0.7568628, 1, 0, 1,
-0.8899512, 0.9072467, 0.07306268, 0.7529412, 1, 0, 1,
-0.8781824, 1.074412, -1.98762, 0.7450981, 1, 0, 1,
-0.8663691, -0.1142568, -1.287094, 0.7411765, 1, 0, 1,
-0.861328, 1.261415, -1.901266, 0.7333333, 1, 0, 1,
-0.8595705, 1.593921, -0.04448666, 0.7294118, 1, 0, 1,
-0.8545508, 1.37883, -1.495046, 0.7215686, 1, 0, 1,
-0.8536776, 0.8611674, -0.6401562, 0.7176471, 1, 0, 1,
-0.8522234, 1.188732, 1.423607, 0.7098039, 1, 0, 1,
-0.8485867, 1.666863, -1.669168, 0.7058824, 1, 0, 1,
-0.8364434, 0.7671643, -0.4808416, 0.6980392, 1, 0, 1,
-0.8349723, 0.2657439, -0.005192693, 0.6901961, 1, 0, 1,
-0.8344787, 0.4223614, -0.9958755, 0.6862745, 1, 0, 1,
-0.8305982, 0.0103355, -2.533656, 0.6784314, 1, 0, 1,
-0.8282363, 1.075985, 0.876197, 0.6745098, 1, 0, 1,
-0.8176635, 0.2750103, -1.45381, 0.6666667, 1, 0, 1,
-0.8123622, -0.7476701, -1.593267, 0.6627451, 1, 0, 1,
-0.8092015, -0.07170114, -2.35839, 0.654902, 1, 0, 1,
-0.8056394, 1.535172, -0.8059366, 0.6509804, 1, 0, 1,
-0.8038027, -0.02627668, -2.662031, 0.6431373, 1, 0, 1,
-0.8034375, 0.4777477, -1.053109, 0.6392157, 1, 0, 1,
-0.7992838, 1.749011, -0.5168861, 0.6313726, 1, 0, 1,
-0.797922, 0.5044841, -1.961673, 0.627451, 1, 0, 1,
-0.7957022, -0.2867949, -1.509066, 0.6196079, 1, 0, 1,
-0.7942166, -1.580555, -1.203313, 0.6156863, 1, 0, 1,
-0.7892414, -1.577919, -3.708367, 0.6078432, 1, 0, 1,
-0.7889162, 0.1123264, -1.389782, 0.6039216, 1, 0, 1,
-0.787304, -0.7411346, -0.8752264, 0.5960785, 1, 0, 1,
-0.7850492, 0.8905885, -0.5741312, 0.5882353, 1, 0, 1,
-0.7771419, -0.08089636, -2.454313, 0.5843138, 1, 0, 1,
-0.7727143, -0.09965835, -0.3250511, 0.5764706, 1, 0, 1,
-0.769169, -0.3835717, -3.451787, 0.572549, 1, 0, 1,
-0.7658861, 2.199867, -0.9465866, 0.5647059, 1, 0, 1,
-0.7579998, -0.4564313, -2.956578, 0.5607843, 1, 0, 1,
-0.7514472, -0.05688286, 0.1168653, 0.5529412, 1, 0, 1,
-0.7442012, 0.2105055, -1.862869, 0.5490196, 1, 0, 1,
-0.7426895, -0.1633012, -2.195743, 0.5411765, 1, 0, 1,
-0.7380109, 1.139436, 0.05533754, 0.5372549, 1, 0, 1,
-0.7273805, 0.9894434, 1.080775, 0.5294118, 1, 0, 1,
-0.7270517, 1.458378, -1.095932, 0.5254902, 1, 0, 1,
-0.7256663, -0.2666353, -1.137435, 0.5176471, 1, 0, 1,
-0.7228032, -0.9744158, -2.267437, 0.5137255, 1, 0, 1,
-0.7132275, -0.2380214, -1.873675, 0.5058824, 1, 0, 1,
-0.7085568, 0.9182507, -0.09551539, 0.5019608, 1, 0, 1,
-0.707348, 0.1331367, -1.193842, 0.4941176, 1, 0, 1,
-0.7015193, -0.0006807894, -1.817988, 0.4862745, 1, 0, 1,
-0.6983399, -1.028074, -2.527703, 0.4823529, 1, 0, 1,
-0.6964828, -0.7833794, -1.517096, 0.4745098, 1, 0, 1,
-0.6935183, 0.2746623, -1.3335, 0.4705882, 1, 0, 1,
-0.6932374, 1.186835, -1.482899, 0.4627451, 1, 0, 1,
-0.6929609, -0.2986648, -3.926312, 0.4588235, 1, 0, 1,
-0.688629, 1.20913, -2.591965, 0.4509804, 1, 0, 1,
-0.6851796, -1.007042, -2.352233, 0.4470588, 1, 0, 1,
-0.6812971, -1.024961, -2.093708, 0.4392157, 1, 0, 1,
-0.6798198, -0.3565957, -1.354739, 0.4352941, 1, 0, 1,
-0.678508, -0.1428466, -3.315306, 0.427451, 1, 0, 1,
-0.677052, 0.8571435, -1.464248, 0.4235294, 1, 0, 1,
-0.6713171, 1.731349, -1.103458, 0.4156863, 1, 0, 1,
-0.6710606, 1.638665, -0.3647633, 0.4117647, 1, 0, 1,
-0.6702383, 0.8399617, -1.555726, 0.4039216, 1, 0, 1,
-0.6680007, 0.6068054, -1.773409, 0.3960784, 1, 0, 1,
-0.6676452, -1.62358, -3.44756, 0.3921569, 1, 0, 1,
-0.6650854, -0.3901576, -0.9245799, 0.3843137, 1, 0, 1,
-0.6645123, 0.4518218, -0.9065897, 0.3803922, 1, 0, 1,
-0.662349, -0.4914699, -2.232102, 0.372549, 1, 0, 1,
-0.6606855, 1.714454, -0.05435607, 0.3686275, 1, 0, 1,
-0.6606171, 0.3319601, 0.03800956, 0.3607843, 1, 0, 1,
-0.6546371, 0.2942628, -0.4494716, 0.3568628, 1, 0, 1,
-0.6545048, 0.7185583, -1.369621, 0.3490196, 1, 0, 1,
-0.6538106, -0.4509441, -2.348492, 0.345098, 1, 0, 1,
-0.650899, -0.3840254, -3.134404, 0.3372549, 1, 0, 1,
-0.6504798, 0.7071697, 1.160383, 0.3333333, 1, 0, 1,
-0.6470251, -0.03151323, 0.1509557, 0.3254902, 1, 0, 1,
-0.6458551, -1.163579, -1.84533, 0.3215686, 1, 0, 1,
-0.6422666, -0.7372243, -3.219505, 0.3137255, 1, 0, 1,
-0.6413296, -0.5704015, -2.595, 0.3098039, 1, 0, 1,
-0.6403009, -1.630283, -2.821517, 0.3019608, 1, 0, 1,
-0.6394978, -0.997714, -1.22667, 0.2941177, 1, 0, 1,
-0.6393728, 0.2902677, -2.19873, 0.2901961, 1, 0, 1,
-0.6381776, 1.590079, -0.8851696, 0.282353, 1, 0, 1,
-0.6367175, 1.638819, 0.5081389, 0.2784314, 1, 0, 1,
-0.6357461, -1.040174, -3.712272, 0.2705882, 1, 0, 1,
-0.6351945, 1.590877, 0.4617878, 0.2666667, 1, 0, 1,
-0.6282902, -1.285764, -3.658144, 0.2588235, 1, 0, 1,
-0.6240683, -0.6414572, -2.963987, 0.254902, 1, 0, 1,
-0.6214589, 0.2232105, 0.3106844, 0.2470588, 1, 0, 1,
-0.6213406, 0.594008, 0.8537524, 0.2431373, 1, 0, 1,
-0.6189426, 0.88989, -1.19137, 0.2352941, 1, 0, 1,
-0.616614, 0.5951767, -1.527685, 0.2313726, 1, 0, 1,
-0.6137066, -0.2366527, -3.124281, 0.2235294, 1, 0, 1,
-0.6129243, 0.2763914, -1.6569, 0.2196078, 1, 0, 1,
-0.6125706, 0.4233729, 0.06837362, 0.2117647, 1, 0, 1,
-0.6124022, 0.8108073, -0.5522401, 0.2078431, 1, 0, 1,
-0.6072739, 0.3301002, -0.421745, 0.2, 1, 0, 1,
-0.6062106, 0.3068648, -2.025433, 0.1921569, 1, 0, 1,
-0.5973015, 2.607549, 0.0590055, 0.1882353, 1, 0, 1,
-0.5928844, 1.29815, -0.5500056, 0.1803922, 1, 0, 1,
-0.5919419, 0.0910897, -3.209711, 0.1764706, 1, 0, 1,
-0.5915892, -0.3595024, -3.532643, 0.1686275, 1, 0, 1,
-0.5915403, 0.05949142, -0.2836854, 0.1647059, 1, 0, 1,
-0.5906985, 0.03742341, -1.164131, 0.1568628, 1, 0, 1,
-0.5893944, 1.956667, -2.055347, 0.1529412, 1, 0, 1,
-0.5891209, 0.4106388, -1.557684, 0.145098, 1, 0, 1,
-0.5890475, 1.055881, -2.517574, 0.1411765, 1, 0, 1,
-0.5889292, 0.413599, -0.9861436, 0.1333333, 1, 0, 1,
-0.5858592, -0.2965418, -2.269896, 0.1294118, 1, 0, 1,
-0.5844856, -1.377488, -3.383952, 0.1215686, 1, 0, 1,
-0.5843977, -0.7212999, -2.304351, 0.1176471, 1, 0, 1,
-0.5829505, -0.7743505, -3.878453, 0.1098039, 1, 0, 1,
-0.5816304, -0.1436073, -1.656495, 0.1058824, 1, 0, 1,
-0.5810045, 0.208736, -0.8400776, 0.09803922, 1, 0, 1,
-0.5801022, -0.2396864, -1.764467, 0.09019608, 1, 0, 1,
-0.579532, 0.5575749, -1.851134, 0.08627451, 1, 0, 1,
-0.5789862, 0.13277, -2.125253, 0.07843138, 1, 0, 1,
-0.5767002, 1.169559, -1.313798, 0.07450981, 1, 0, 1,
-0.5759564, -0.5443286, -0.9176222, 0.06666667, 1, 0, 1,
-0.5729665, -0.131478, -0.8881232, 0.0627451, 1, 0, 1,
-0.5726177, 0.4747763, -2.456363, 0.05490196, 1, 0, 1,
-0.5699227, -0.1813187, -0.929503, 0.05098039, 1, 0, 1,
-0.5693874, -0.2489796, -1.019575, 0.04313726, 1, 0, 1,
-0.5684212, -1.738809, -1.947699, 0.03921569, 1, 0, 1,
-0.5679703, -0.9726343, -3.95657, 0.03137255, 1, 0, 1,
-0.5570608, 1.050637, 0.3001737, 0.02745098, 1, 0, 1,
-0.5563708, -0.9998941, -2.724669, 0.01960784, 1, 0, 1,
-0.5542649, -0.3014092, -1.356443, 0.01568628, 1, 0, 1,
-0.5517281, 0.819568, -2.47951, 0.007843138, 1, 0, 1,
-0.5493059, -0.8041272, -2.757632, 0.003921569, 1, 0, 1,
-0.5477897, 0.3463885, 0.8228027, 0, 1, 0.003921569, 1,
-0.5379523, 1.166739, 0.01391815, 0, 1, 0.01176471, 1,
-0.5354474, -1.476154, -2.515616, 0, 1, 0.01568628, 1,
-0.5337727, 0.03721727, -1.702894, 0, 1, 0.02352941, 1,
-0.5325896, 1.051396, -1.92136, 0, 1, 0.02745098, 1,
-0.5321423, 0.6088758, 0.09108081, 0, 1, 0.03529412, 1,
-0.5283896, 0.9876509, -1.628639, 0, 1, 0.03921569, 1,
-0.5194488, -0.5018561, -3.576444, 0, 1, 0.04705882, 1,
-0.519436, 0.9465387, -0.2354199, 0, 1, 0.05098039, 1,
-0.5140994, -0.005990769, -2.53756, 0, 1, 0.05882353, 1,
-0.5139577, 0.5564547, -1.108381, 0, 1, 0.0627451, 1,
-0.5124034, 2.286138, 0.4398368, 0, 1, 0.07058824, 1,
-0.5113639, -0.07606762, -1.200687, 0, 1, 0.07450981, 1,
-0.497604, -0.1051641, -0.2322317, 0, 1, 0.08235294, 1,
-0.4875621, 1.77421, 0.6040751, 0, 1, 0.08627451, 1,
-0.4849337, -0.3178962, -2.74515, 0, 1, 0.09411765, 1,
-0.4847471, -0.5817532, -1.34305, 0, 1, 0.1019608, 1,
-0.4827272, 0.2598456, -1.460425, 0, 1, 0.1058824, 1,
-0.4809361, 0.2677163, -1.227148, 0, 1, 0.1137255, 1,
-0.4590835, -0.1823794, -3.784813, 0, 1, 0.1176471, 1,
-0.4558367, -0.2053093, -2.128313, 0, 1, 0.1254902, 1,
-0.4497439, 0.1503626, -0.1669838, 0, 1, 0.1294118, 1,
-0.448071, 1.245286, -1.484303, 0, 1, 0.1372549, 1,
-0.4473236, -0.5733224, -1.777246, 0, 1, 0.1411765, 1,
-0.4461191, -0.456993, -2.908815, 0, 1, 0.1490196, 1,
-0.4424676, -0.05129978, -2.573953, 0, 1, 0.1529412, 1,
-0.4379996, 0.9396053, -1.048252, 0, 1, 0.1607843, 1,
-0.4333268, 0.2337765, -0.5444152, 0, 1, 0.1647059, 1,
-0.4326674, -0.1068451, -1.37828, 0, 1, 0.172549, 1,
-0.4302324, 0.9940199, -0.6054658, 0, 1, 0.1764706, 1,
-0.4263995, -0.8403929, -2.912063, 0, 1, 0.1843137, 1,
-0.4260997, -1.749786, -3.292436, 0, 1, 0.1882353, 1,
-0.4191535, 0.8816915, -1.595957, 0, 1, 0.1960784, 1,
-0.4072345, -1.510741, -3.745597, 0, 1, 0.2039216, 1,
-0.4038925, 0.1374734, -2.417349, 0, 1, 0.2078431, 1,
-0.4032262, 0.9645928, -0.9009409, 0, 1, 0.2156863, 1,
-0.4018727, 0.5439442, -1.58537, 0, 1, 0.2196078, 1,
-0.3974589, -0.1489243, -2.381104, 0, 1, 0.227451, 1,
-0.395134, 1.528283, 0.7816786, 0, 1, 0.2313726, 1,
-0.3913379, 1.17019, -1.562375, 0, 1, 0.2392157, 1,
-0.3911488, 0.9856207, -0.5018182, 0, 1, 0.2431373, 1,
-0.3904984, -2.158664, -2.906551, 0, 1, 0.2509804, 1,
-0.38449, 1.597692, 0.5651612, 0, 1, 0.254902, 1,
-0.3833655, 1.893333, -0.351261, 0, 1, 0.2627451, 1,
-0.3793137, -1.137483, -4.182536, 0, 1, 0.2666667, 1,
-0.3621051, 0.06858382, 0.3479503, 0, 1, 0.2745098, 1,
-0.3576425, -0.8331869, -2.475754, 0, 1, 0.2784314, 1,
-0.3467099, 0.7995015, -1.139979, 0, 1, 0.2862745, 1,
-0.3464701, 0.3740494, -1.709187, 0, 1, 0.2901961, 1,
-0.3431029, 1.526883, 0.6380897, 0, 1, 0.2980392, 1,
-0.3425876, 0.6254672, -0.1793853, 0, 1, 0.3058824, 1,
-0.3378856, -1.55143, -1.325716, 0, 1, 0.3098039, 1,
-0.3361261, 1.177425, 0.05354942, 0, 1, 0.3176471, 1,
-0.333983, -1.420369, -3.729472, 0, 1, 0.3215686, 1,
-0.331437, 0.09882084, -0.2517137, 0, 1, 0.3294118, 1,
-0.3275074, -1.65185, -1.097054, 0, 1, 0.3333333, 1,
-0.326385, 0.641506, -0.1103876, 0, 1, 0.3411765, 1,
-0.317031, -0.1242975, -1.832785, 0, 1, 0.345098, 1,
-0.3164836, 1.502019, 1.402427, 0, 1, 0.3529412, 1,
-0.3162912, 0.1312635, -2.044043, 0, 1, 0.3568628, 1,
-0.3056578, 0.6379488, -1.500026, 0, 1, 0.3647059, 1,
-0.3051966, -0.7555135, -2.949386, 0, 1, 0.3686275, 1,
-0.3047585, 0.6069302, -0.3711423, 0, 1, 0.3764706, 1,
-0.3033681, -0.3066153, -3.308551, 0, 1, 0.3803922, 1,
-0.3011004, -1.377899, -1.948861, 0, 1, 0.3882353, 1,
-0.2966235, 0.01852957, -2.19344, 0, 1, 0.3921569, 1,
-0.2923733, -0.0167831, -0.6553761, 0, 1, 0.4, 1,
-0.2910156, 0.03374774, -2.718062, 0, 1, 0.4078431, 1,
-0.2896431, 0.7803653, -1.358625, 0, 1, 0.4117647, 1,
-0.2861952, 0.3318861, 0.05285573, 0, 1, 0.4196078, 1,
-0.2846096, -0.4673073, -1.899958, 0, 1, 0.4235294, 1,
-0.2807559, -0.7314709, -0.8247588, 0, 1, 0.4313726, 1,
-0.2791621, 0.2023317, -0.8222271, 0, 1, 0.4352941, 1,
-0.2755328, -0.8798831, -2.719955, 0, 1, 0.4431373, 1,
-0.2750581, -0.7378398, -3.491837, 0, 1, 0.4470588, 1,
-0.2728914, 0.6308518, -0.9780627, 0, 1, 0.454902, 1,
-0.2701907, -0.388372, -3.660902, 0, 1, 0.4588235, 1,
-0.2603486, -0.007478254, -3.467824, 0, 1, 0.4666667, 1,
-0.2554357, 1.356603, -2.187862, 0, 1, 0.4705882, 1,
-0.2539236, 1.885658, 0.3766239, 0, 1, 0.4784314, 1,
-0.2526532, -0.1047202, -1.961229, 0, 1, 0.4823529, 1,
-0.2472164, 1.320481, -0.4978034, 0, 1, 0.4901961, 1,
-0.2462268, -1.196285, -2.918657, 0, 1, 0.4941176, 1,
-0.2415282, -1.372627, -3.324106, 0, 1, 0.5019608, 1,
-0.238208, -0.9731116, -3.742048, 0, 1, 0.509804, 1,
-0.237159, -0.3756351, -1.245635, 0, 1, 0.5137255, 1,
-0.2298549, -0.01999638, -1.260036, 0, 1, 0.5215687, 1,
-0.2243595, 1.612521, -0.409955, 0, 1, 0.5254902, 1,
-0.2202171, -0.04385009, -2.401248, 0, 1, 0.5333334, 1,
-0.2177798, 0.1996049, -0.3560392, 0, 1, 0.5372549, 1,
-0.2170336, -1.503119, -2.485983, 0, 1, 0.5450981, 1,
-0.2164248, 0.5514086, -0.3158605, 0, 1, 0.5490196, 1,
-0.2112854, -0.7969739, -2.617532, 0, 1, 0.5568628, 1,
-0.2111868, -0.7714206, -2.16016, 0, 1, 0.5607843, 1,
-0.2109793, 0.4470578, 0.7855067, 0, 1, 0.5686275, 1,
-0.210589, -1.282603, -3.246267, 0, 1, 0.572549, 1,
-0.2089402, -1.525761, -4.525537, 0, 1, 0.5803922, 1,
-0.2050615, 1.359999, 0.2583718, 0, 1, 0.5843138, 1,
-0.2016235, -0.1836285, -1.335938, 0, 1, 0.5921569, 1,
-0.2013114, -1.126658, -2.864764, 0, 1, 0.5960785, 1,
-0.2011716, 1.426637, -0.35986, 0, 1, 0.6039216, 1,
-0.2005377, 0.809333, 1.035766, 0, 1, 0.6117647, 1,
-0.1991136, -0.8216462, -3.349948, 0, 1, 0.6156863, 1,
-0.197492, -0.2483341, -3.100898, 0, 1, 0.6235294, 1,
-0.1965969, 1.775691, -1.272498, 0, 1, 0.627451, 1,
-0.1959163, 0.9919848, -0.5764983, 0, 1, 0.6352941, 1,
-0.1916173, 1.192121, 0.04972558, 0, 1, 0.6392157, 1,
-0.1858722, -0.08976834, -1.013526, 0, 1, 0.6470588, 1,
-0.1842752, -0.3045387, -5.242609, 0, 1, 0.6509804, 1,
-0.1818117, -0.3947798, -2.235082, 0, 1, 0.6588235, 1,
-0.176861, -1.500365, -3.179081, 0, 1, 0.6627451, 1,
-0.1747832, 0.9383037, 1.284315, 0, 1, 0.6705883, 1,
-0.174707, 2.591335, -0.6030415, 0, 1, 0.6745098, 1,
-0.1673819, -1.876373, -3.129083, 0, 1, 0.682353, 1,
-0.1666853, 0.8980696, 0.6687914, 0, 1, 0.6862745, 1,
-0.164515, 0.5013359, -0.513634, 0, 1, 0.6941177, 1,
-0.160973, 0.8501489, 0.6163999, 0, 1, 0.7019608, 1,
-0.1603195, -0.6135033, -2.330704, 0, 1, 0.7058824, 1,
-0.1550929, 0.3529232, -0.314866, 0, 1, 0.7137255, 1,
-0.1539882, 1.910664, -0.2953313, 0, 1, 0.7176471, 1,
-0.1530851, -0.412719, -0.9420063, 0, 1, 0.7254902, 1,
-0.1512686, 0.2512607, 0.34006, 0, 1, 0.7294118, 1,
-0.1482866, 0.6762295, -0.3467076, 0, 1, 0.7372549, 1,
-0.1454862, 0.580924, 0.1513418, 0, 1, 0.7411765, 1,
-0.1451728, 0.3383775, -1.372615, 0, 1, 0.7490196, 1,
-0.139823, -1.113629, -1.498574, 0, 1, 0.7529412, 1,
-0.1391978, 0.7188016, -0.2791331, 0, 1, 0.7607843, 1,
-0.1356869, -2.301911, -4.680985, 0, 1, 0.7647059, 1,
-0.1326199, 0.7069184, 0.4505454, 0, 1, 0.772549, 1,
-0.1320405, 0.4328632, -0.3583002, 0, 1, 0.7764706, 1,
-0.1315057, 1.717175, -0.844914, 0, 1, 0.7843137, 1,
-0.1253113, 0.4316352, -1.905749, 0, 1, 0.7882353, 1,
-0.1251215, 0.5750127, -0.06451664, 0, 1, 0.7960784, 1,
-0.1218871, 1.340326, -0.9503998, 0, 1, 0.8039216, 1,
-0.1171088, 1.252145, 0.08849497, 0, 1, 0.8078431, 1,
-0.1150229, -0.5677237, -1.90055, 0, 1, 0.8156863, 1,
-0.1088316, -0.4722153, -2.471262, 0, 1, 0.8196079, 1,
-0.1082757, 1.7412, 0.9761538, 0, 1, 0.827451, 1,
-0.1074527, 1.151734, -0.425844, 0, 1, 0.8313726, 1,
-0.1033142, -0.7924792, -4.267764, 0, 1, 0.8392157, 1,
-0.1029116, 0.6626215, 0.720634, 0, 1, 0.8431373, 1,
-0.1022124, -0.288812, -2.123913, 0, 1, 0.8509804, 1,
-0.1012127, 1.12798, 0.2925534, 0, 1, 0.854902, 1,
-0.09716313, 0.2953605, 0.3469629, 0, 1, 0.8627451, 1,
-0.09623299, -1.063399, -2.855126, 0, 1, 0.8666667, 1,
-0.09272604, -0.6545215, -5.039536, 0, 1, 0.8745098, 1,
-0.08876041, -0.9655626, -4.534178, 0, 1, 0.8784314, 1,
-0.08786706, -1.498363, -1.889897, 0, 1, 0.8862745, 1,
-0.08469193, 2.524346, 0.7293686, 0, 1, 0.8901961, 1,
-0.0838757, -0.3922577, -3.370993, 0, 1, 0.8980392, 1,
-0.08115457, 0.3316878, 1.052716, 0, 1, 0.9058824, 1,
-0.07811248, -0.2629707, -1.998629, 0, 1, 0.9098039, 1,
-0.07509394, -0.6235251, -2.732961, 0, 1, 0.9176471, 1,
-0.07372511, 1.010167, 0.3158717, 0, 1, 0.9215686, 1,
-0.06865576, 1.114609, -1.230917, 0, 1, 0.9294118, 1,
-0.06856425, 0.0515446, -0.8776738, 0, 1, 0.9333333, 1,
-0.06790263, 0.6724273, 1.430645, 0, 1, 0.9411765, 1,
-0.06608949, -2.151283, -4.43962, 0, 1, 0.945098, 1,
-0.06562051, 0.4624658, 1.268023, 0, 1, 0.9529412, 1,
-0.06524979, 1.094405, 0.5429809, 0, 1, 0.9568627, 1,
-0.06159175, 0.8518254, 0.05482936, 0, 1, 0.9647059, 1,
-0.06026889, 0.2874135, 0.3164221, 0, 1, 0.9686275, 1,
-0.05924111, 0.3885802, -0.4196468, 0, 1, 0.9764706, 1,
-0.05727837, -1.006118, -3.977563, 0, 1, 0.9803922, 1,
-0.05605468, 0.8238317, -0.3707183, 0, 1, 0.9882353, 1,
-0.05333067, 0.6777818, 0.7625807, 0, 1, 0.9921569, 1,
-0.04620829, 0.7439757, 0.3473703, 0, 1, 1, 1,
-0.04358894, 0.9477233, 0.3396392, 0, 0.9921569, 1, 1,
-0.04282037, 0.2491169, 0.8460413, 0, 0.9882353, 1, 1,
-0.04140652, -0.09162833, -3.517097, 0, 0.9803922, 1, 1,
-0.03862352, 1.746186, -0.1880358, 0, 0.9764706, 1, 1,
-0.03846896, -0.9673204, -3.451103, 0, 0.9686275, 1, 1,
-0.03814135, -0.9570098, -5.272035, 0, 0.9647059, 1, 1,
-0.0378972, -1.546139, -3.831015, 0, 0.9568627, 1, 1,
-0.03375017, -1.592085, -2.888384, 0, 0.9529412, 1, 1,
-0.03236056, 1.096958, 0.8650369, 0, 0.945098, 1, 1,
-0.02805165, 0.2322923, -1.097048, 0, 0.9411765, 1, 1,
-0.02413177, 1.299335, 1.105924, 0, 0.9333333, 1, 1,
-0.02184383, -0.009203172, -0.2615317, 0, 0.9294118, 1, 1,
-0.02182831, -0.818972, -0.7552172, 0, 0.9215686, 1, 1,
-0.02012542, 1.682783, -1.222011, 0, 0.9176471, 1, 1,
-0.01951178, -0.1843349, -0.9545439, 0, 0.9098039, 1, 1,
-0.01847785, -2.060447, -2.655207, 0, 0.9058824, 1, 1,
-0.009532077, -0.8247262, -1.98602, 0, 0.8980392, 1, 1,
-0.004904678, 0.9478966, 0.3259912, 0, 0.8901961, 1, 1,
-0.003984665, 0.5019917, -0.4590991, 0, 0.8862745, 1, 1,
-0.001752799, 0.137942, -0.5066296, 0, 0.8784314, 1, 1,
0.001881604, 0.4433431, -0.8522532, 0, 0.8745098, 1, 1,
0.002064954, -0.1632092, 3.518569, 0, 0.8666667, 1, 1,
0.002234786, -1.978499, 1.273912, 0, 0.8627451, 1, 1,
0.01180349, -1.872076, 3.708074, 0, 0.854902, 1, 1,
0.01304872, -0.5664074, 2.496068, 0, 0.8509804, 1, 1,
0.02313508, 1.009182, 1.773661, 0, 0.8431373, 1, 1,
0.02767754, 0.6181016, 1.59604, 0, 0.8392157, 1, 1,
0.02834195, 0.05175509, -0.4140539, 0, 0.8313726, 1, 1,
0.02987288, 0.03835572, 0.4960437, 0, 0.827451, 1, 1,
0.03177239, 0.07493496, 1.044339, 0, 0.8196079, 1, 1,
0.03723696, 0.1071142, 0.3080843, 0, 0.8156863, 1, 1,
0.03752641, -0.7302973, 2.636968, 0, 0.8078431, 1, 1,
0.04000728, 0.05890867, 0.5580905, 0, 0.8039216, 1, 1,
0.04566618, 1.144684, -1.118955, 0, 0.7960784, 1, 1,
0.0470516, 0.3400897, -1.848866, 0, 0.7882353, 1, 1,
0.04756713, -0.03027509, 2.960618, 0, 0.7843137, 1, 1,
0.05349971, -1.015714, 2.239129, 0, 0.7764706, 1, 1,
0.05505891, -0.3171425, 1.54919, 0, 0.772549, 1, 1,
0.05639922, -0.009848678, 0.5101373, 0, 0.7647059, 1, 1,
0.05693903, 1.321706, -0.8733929, 0, 0.7607843, 1, 1,
0.05804592, 0.4825118, -0.354373, 0, 0.7529412, 1, 1,
0.05982648, 1.469355, -0.09779618, 0, 0.7490196, 1, 1,
0.06514793, 0.6338763, 0.6224929, 0, 0.7411765, 1, 1,
0.06932632, 0.2895322, 0.7291237, 0, 0.7372549, 1, 1,
0.07154068, -0.2465059, 2.734193, 0, 0.7294118, 1, 1,
0.07210897, 0.1885357, 0.3561262, 0, 0.7254902, 1, 1,
0.07274101, -1.039516, 3.075146, 0, 0.7176471, 1, 1,
0.07919709, -0.1812506, 2.956278, 0, 0.7137255, 1, 1,
0.08067872, 1.323527, -1.036483, 0, 0.7058824, 1, 1,
0.08172063, -0.581329, 1.422461, 0, 0.6980392, 1, 1,
0.08260122, -0.3785923, 2.562734, 0, 0.6941177, 1, 1,
0.08309413, -1.107197, 2.053605, 0, 0.6862745, 1, 1,
0.08742005, 0.7099739, 0.3681736, 0, 0.682353, 1, 1,
0.09122793, 0.8613504, -0.9537222, 0, 0.6745098, 1, 1,
0.09143551, 0.508074, 1.28712, 0, 0.6705883, 1, 1,
0.09224258, -0.8439765, 4.479681, 0, 0.6627451, 1, 1,
0.09439468, 0.4071678, -1.112589, 0, 0.6588235, 1, 1,
0.09701299, -0.1733046, 1.92082, 0, 0.6509804, 1, 1,
0.09920958, -0.05091318, 1.565118, 0, 0.6470588, 1, 1,
0.09966531, -1.787812, 3.951294, 0, 0.6392157, 1, 1,
0.1007506, -0.7124816, 2.907668, 0, 0.6352941, 1, 1,
0.101495, -0.08166842, 2.005095, 0, 0.627451, 1, 1,
0.101877, -0.5520675, 1.278437, 0, 0.6235294, 1, 1,
0.1018899, 0.4161327, 2.229767, 0, 0.6156863, 1, 1,
0.1030168, 0.1627632, 1.723708, 0, 0.6117647, 1, 1,
0.1032187, -0.1948598, 4.234691, 0, 0.6039216, 1, 1,
0.1045023, -1.082842, 3.7211, 0, 0.5960785, 1, 1,
0.105646, 1.32283, -1.147773, 0, 0.5921569, 1, 1,
0.1061611, -0.04194856, 3.63856, 0, 0.5843138, 1, 1,
0.1077545, -0.8405677, 2.917319, 0, 0.5803922, 1, 1,
0.1126977, 0.5552117, 1.061191, 0, 0.572549, 1, 1,
0.1166269, 1.087281, -0.8058391, 0, 0.5686275, 1, 1,
0.1187513, -0.7898434, 3.824028, 0, 0.5607843, 1, 1,
0.1238714, -0.7854238, 3.300789, 0, 0.5568628, 1, 1,
0.1241963, -0.09083648, 1.635365, 0, 0.5490196, 1, 1,
0.1269252, -0.1366742, 5.047286, 0, 0.5450981, 1, 1,
0.1274175, -2.072175, 3.01546, 0, 0.5372549, 1, 1,
0.1392661, -0.4805818, 2.462721, 0, 0.5333334, 1, 1,
0.141533, 1.260764, -2.259513, 0, 0.5254902, 1, 1,
0.1427785, -0.7340006, 2.652532, 0, 0.5215687, 1, 1,
0.1433884, 0.6623353, 1.159241, 0, 0.5137255, 1, 1,
0.1451044, 0.8357651, 0.3363989, 0, 0.509804, 1, 1,
0.1458117, -0.2637463, 4.388377, 0, 0.5019608, 1, 1,
0.1482985, -1.256015, 0.7849617, 0, 0.4941176, 1, 1,
0.1497428, 0.8326724, 1.644955, 0, 0.4901961, 1, 1,
0.1510869, 1.468451, 0.4305217, 0, 0.4823529, 1, 1,
0.1568879, -0.4041762, 2.9516, 0, 0.4784314, 1, 1,
0.1596125, -1.602163, 3.69396, 0, 0.4705882, 1, 1,
0.1606174, -0.369771, 3.050481, 0, 0.4666667, 1, 1,
0.1720002, 1.445265, -0.4603683, 0, 0.4588235, 1, 1,
0.1737478, 0.4352378, 1.396378, 0, 0.454902, 1, 1,
0.1754826, -0.6982173, 1.567579, 0, 0.4470588, 1, 1,
0.1763353, -0.2639999, 2.162823, 0, 0.4431373, 1, 1,
0.1784496, -2.180834, 3.278637, 0, 0.4352941, 1, 1,
0.1876483, -0.243063, 2.772734, 0, 0.4313726, 1, 1,
0.1900612, 0.3449946, 0.6394168, 0, 0.4235294, 1, 1,
0.1935677, 0.05652487, 1.212061, 0, 0.4196078, 1, 1,
0.1947719, 0.07858312, 0.9953245, 0, 0.4117647, 1, 1,
0.1954017, -0.06694324, 2.011446, 0, 0.4078431, 1, 1,
0.1962073, -0.1515838, 3.65352, 0, 0.4, 1, 1,
0.1980778, 0.2214942, 0.9087202, 0, 0.3921569, 1, 1,
0.2161052, 0.3644587, -0.3906422, 0, 0.3882353, 1, 1,
0.2183569, 1.191355, 1.995498, 0, 0.3803922, 1, 1,
0.222095, -1.095654, 1.573964, 0, 0.3764706, 1, 1,
0.2234226, -0.6735721, 3.404949, 0, 0.3686275, 1, 1,
0.2268364, 0.9285674, -0.04899776, 0, 0.3647059, 1, 1,
0.2272405, 1.829346, 0.8257751, 0, 0.3568628, 1, 1,
0.2305131, 0.5552234, 2.083137, 0, 0.3529412, 1, 1,
0.2315661, -1.207021, 2.530295, 0, 0.345098, 1, 1,
0.2335943, -0.9881494, 2.340994, 0, 0.3411765, 1, 1,
0.2382371, 1.187624, -1.081198, 0, 0.3333333, 1, 1,
0.2383431, -0.4397258, 1.476901, 0, 0.3294118, 1, 1,
0.2469582, 0.09438367, 1.728214, 0, 0.3215686, 1, 1,
0.2557409, 0.790134, 0.1930533, 0, 0.3176471, 1, 1,
0.2563392, 0.0523343, 0.7966113, 0, 0.3098039, 1, 1,
0.2605998, -0.424114, 3.106533, 0, 0.3058824, 1, 1,
0.2613644, -1.194466, 2.918651, 0, 0.2980392, 1, 1,
0.2626616, -1.509113, 3.657939, 0, 0.2901961, 1, 1,
0.2627677, -1.849096, 4.104047, 0, 0.2862745, 1, 1,
0.2641412, 0.6227421, 0.9026307, 0, 0.2784314, 1, 1,
0.2651629, -2.006052, 3.734035, 0, 0.2745098, 1, 1,
0.2664586, 0.8054925, -0.2187004, 0, 0.2666667, 1, 1,
0.2693558, -0.01573192, 1.162958, 0, 0.2627451, 1, 1,
0.2712358, 1.690616, 0.1434431, 0, 0.254902, 1, 1,
0.2725374, -0.3552559, 2.841319, 0, 0.2509804, 1, 1,
0.2726465, 0.8466939, 0.07187576, 0, 0.2431373, 1, 1,
0.2775195, 1.386994, -0.5398471, 0, 0.2392157, 1, 1,
0.2778181, 0.5379964, 2.416549, 0, 0.2313726, 1, 1,
0.2888939, -0.06584479, -1.570366, 0, 0.227451, 1, 1,
0.2936159, 0.3635607, -0.4201656, 0, 0.2196078, 1, 1,
0.2939858, 1.12246, 1.365258, 0, 0.2156863, 1, 1,
0.2947576, 1.171137, 0.4364327, 0, 0.2078431, 1, 1,
0.2955561, 1.658689, 0.7575025, 0, 0.2039216, 1, 1,
0.2978823, -0.2394729, 2.146333, 0, 0.1960784, 1, 1,
0.3039503, 0.154742, 0.8440546, 0, 0.1882353, 1, 1,
0.3059756, -0.2426917, 2.228825, 0, 0.1843137, 1, 1,
0.3078028, 1.232151, -1.66615, 0, 0.1764706, 1, 1,
0.3078741, -1.572792, 2.241882, 0, 0.172549, 1, 1,
0.3085861, -0.2352037, 2.29356, 0, 0.1647059, 1, 1,
0.3118457, 0.9656262, 0.4789825, 0, 0.1607843, 1, 1,
0.315915, 1.380608, -0.9500451, 0, 0.1529412, 1, 1,
0.3197617, 0.2921513, 0.0801793, 0, 0.1490196, 1, 1,
0.3217953, 2.08122, -0.2001838, 0, 0.1411765, 1, 1,
0.324233, 1.478751, 1.607376, 0, 0.1372549, 1, 1,
0.3268341, -0.2290912, 2.841339, 0, 0.1294118, 1, 1,
0.3277611, -1.179513, 2.698896, 0, 0.1254902, 1, 1,
0.3325402, 0.5562742, 1.7825, 0, 0.1176471, 1, 1,
0.332929, -1.217213, 1.216508, 0, 0.1137255, 1, 1,
0.334809, -1.828729, 2.22084, 0, 0.1058824, 1, 1,
0.3354865, 0.3705644, -0.4825419, 0, 0.09803922, 1, 1,
0.3404406, -0.4575387, 5.058235, 0, 0.09411765, 1, 1,
0.3405087, -0.0755388, 3.354143, 0, 0.08627451, 1, 1,
0.3445326, -1.07154, 2.478872, 0, 0.08235294, 1, 1,
0.3453977, -0.8628094, 2.421806, 0, 0.07450981, 1, 1,
0.3502294, -0.07511046, 2.451428, 0, 0.07058824, 1, 1,
0.3507449, 0.3613174, 1.345061, 0, 0.0627451, 1, 1,
0.3514326, -1.499087, 2.147915, 0, 0.05882353, 1, 1,
0.3533761, 0.9029832, -0.04929164, 0, 0.05098039, 1, 1,
0.3533902, -2.708358, 2.925081, 0, 0.04705882, 1, 1,
0.3543705, -1.067481, 1.983807, 0, 0.03921569, 1, 1,
0.3573868, 0.538879, -0.5174986, 0, 0.03529412, 1, 1,
0.3598901, 0.03528348, 0.3833065, 0, 0.02745098, 1, 1,
0.3606472, 2.365567, -0.5969788, 0, 0.02352941, 1, 1,
0.3671094, -0.1869122, 1.116687, 0, 0.01568628, 1, 1,
0.3695504, 0.02813494, 2.346553, 0, 0.01176471, 1, 1,
0.3710403, 0.2650452, 0.09416036, 0, 0.003921569, 1, 1,
0.3721401, -0.1442086, 1.79327, 0.003921569, 0, 1, 1,
0.3727401, 0.277601, 2.54825, 0.007843138, 0, 1, 1,
0.3734964, 1.237366, -0.460129, 0.01568628, 0, 1, 1,
0.3745463, 0.2323193, 1.068853, 0.01960784, 0, 1, 1,
0.3747158, 0.6945123, -0.4843245, 0.02745098, 0, 1, 1,
0.3762193, -0.1893596, 3.519487, 0.03137255, 0, 1, 1,
0.3771155, -0.6770276, 3.105033, 0.03921569, 0, 1, 1,
0.3849009, 0.3434703, 0.1193308, 0.04313726, 0, 1, 1,
0.3860865, -1.162108, 3.543157, 0.05098039, 0, 1, 1,
0.3866156, 0.2552574, 1.254595, 0.05490196, 0, 1, 1,
0.3868835, 0.5066166, 0.7317548, 0.0627451, 0, 1, 1,
0.3876677, 0.9562912, 1.819238, 0.06666667, 0, 1, 1,
0.3925577, 0.958603, 1.360148, 0.07450981, 0, 1, 1,
0.3927219, -2.314061, 2.22974, 0.07843138, 0, 1, 1,
0.3942766, 0.6767462, -2.04621, 0.08627451, 0, 1, 1,
0.4099774, 0.5402508, 0.2531974, 0.09019608, 0, 1, 1,
0.4134473, 2.021364, 1.090485, 0.09803922, 0, 1, 1,
0.414362, 1.250299, -1.675546, 0.1058824, 0, 1, 1,
0.4211633, -0.05645119, 1.475711, 0.1098039, 0, 1, 1,
0.4226521, 0.2987804, -0.4172668, 0.1176471, 0, 1, 1,
0.4247651, -0.5482719, 2.655021, 0.1215686, 0, 1, 1,
0.4261786, -0.7995811, 3.336903, 0.1294118, 0, 1, 1,
0.4267805, -0.5730043, 1.505641, 0.1333333, 0, 1, 1,
0.4270347, 1.357877, 1.13723, 0.1411765, 0, 1, 1,
0.4336487, -0.2971331, 1.097982, 0.145098, 0, 1, 1,
0.4352781, 0.1321424, 1.571435, 0.1529412, 0, 1, 1,
0.4450856, 0.3364988, 2.648728, 0.1568628, 0, 1, 1,
0.4507015, 1.629853, -0.408056, 0.1647059, 0, 1, 1,
0.4516949, -0.6183882, 2.645059, 0.1686275, 0, 1, 1,
0.4570056, 0.918142, -0.3992839, 0.1764706, 0, 1, 1,
0.4657955, -0.36685, 0.7902353, 0.1803922, 0, 1, 1,
0.4721764, 1.253365, 0.4430212, 0.1882353, 0, 1, 1,
0.4766135, 2.637184, 0.3729078, 0.1921569, 0, 1, 1,
0.4773863, 0.2957074, 0.9027735, 0.2, 0, 1, 1,
0.4786656, -0.9152562, 1.220219, 0.2078431, 0, 1, 1,
0.478949, -0.2690993, 2.106818, 0.2117647, 0, 1, 1,
0.479255, 1.251896, 0.7829444, 0.2196078, 0, 1, 1,
0.4828449, -3.121411, 3.41715, 0.2235294, 0, 1, 1,
0.4844448, -1.098273, 3.521719, 0.2313726, 0, 1, 1,
0.4849142, 0.3485812, 2.643247, 0.2352941, 0, 1, 1,
0.4869426, 0.7120196, -0.3222872, 0.2431373, 0, 1, 1,
0.4885515, 1.074136, -0.7350838, 0.2470588, 0, 1, 1,
0.4933492, 0.4008602, 1.322782, 0.254902, 0, 1, 1,
0.4943306, 0.4475757, 2.140091, 0.2588235, 0, 1, 1,
0.5006737, 1.222408, 1.558538, 0.2666667, 0, 1, 1,
0.5086798, 1.531947, -0.3073714, 0.2705882, 0, 1, 1,
0.5119118, 0.01787825, 1.675349, 0.2784314, 0, 1, 1,
0.5126013, -0.9224702, 0.987715, 0.282353, 0, 1, 1,
0.5135031, 0.6017513, 1.308804, 0.2901961, 0, 1, 1,
0.5136477, -0.5593209, 2.3731, 0.2941177, 0, 1, 1,
0.5142686, 1.3155, -0.2457905, 0.3019608, 0, 1, 1,
0.5148931, 0.5572556, -0.5167973, 0.3098039, 0, 1, 1,
0.5245829, -0.3477285, 2.360303, 0.3137255, 0, 1, 1,
0.5258803, 0.3641588, -0.7797345, 0.3215686, 0, 1, 1,
0.525923, -1.560378, 2.524637, 0.3254902, 0, 1, 1,
0.5298366, 1.21418, 0.9631309, 0.3333333, 0, 1, 1,
0.5327993, 0.4161378, 0.8384476, 0.3372549, 0, 1, 1,
0.5336192, 0.3697625, 0.1375649, 0.345098, 0, 1, 1,
0.5346644, 1.220534, 1.550301, 0.3490196, 0, 1, 1,
0.5398709, -1.678432, 3.678507, 0.3568628, 0, 1, 1,
0.5419078, 0.1236411, 0.9820638, 0.3607843, 0, 1, 1,
0.5545841, -0.18696, 2.54719, 0.3686275, 0, 1, 1,
0.5599635, 0.130475, 1.799209, 0.372549, 0, 1, 1,
0.5600028, 0.04894147, 2.612721, 0.3803922, 0, 1, 1,
0.567767, 0.5913102, 1.355642, 0.3843137, 0, 1, 1,
0.568183, -0.8576339, 1.663853, 0.3921569, 0, 1, 1,
0.5717416, -1.879729, 1.901916, 0.3960784, 0, 1, 1,
0.5735446, 0.2485274, 1.667593, 0.4039216, 0, 1, 1,
0.5774245, 0.9171343, -0.3394367, 0.4117647, 0, 1, 1,
0.5784346, 0.5164457, 0.7390905, 0.4156863, 0, 1, 1,
0.5795434, 1.106253, 2.038188, 0.4235294, 0, 1, 1,
0.5822896, -0.8436498, 2.411315, 0.427451, 0, 1, 1,
0.5829998, 0.9943994, -0.2770291, 0.4352941, 0, 1, 1,
0.5831126, -0.4295294, 1.912814, 0.4392157, 0, 1, 1,
0.5837363, 0.5520676, -0.1403763, 0.4470588, 0, 1, 1,
0.5853074, 0.8058886, -1.342259, 0.4509804, 0, 1, 1,
0.5879351, 0.9940062, 1.657893, 0.4588235, 0, 1, 1,
0.5925842, 0.5899811, 0.4249964, 0.4627451, 0, 1, 1,
0.5933242, -0.5058733, 0.3105612, 0.4705882, 0, 1, 1,
0.59592, 0.1144372, 0.2395677, 0.4745098, 0, 1, 1,
0.6052525, 0.2322039, 1.197792, 0.4823529, 0, 1, 1,
0.6080759, -0.3796469, 1.269919, 0.4862745, 0, 1, 1,
0.6129315, -0.265868, 2.474906, 0.4941176, 0, 1, 1,
0.6168778, 0.7669235, -0.4997087, 0.5019608, 0, 1, 1,
0.6189155, -2.536234, 4.265168, 0.5058824, 0, 1, 1,
0.6259302, 0.1216825, 1.470506, 0.5137255, 0, 1, 1,
0.6262949, 0.1789279, 1.373296, 0.5176471, 0, 1, 1,
0.6290064, 0.1922723, 1.887857, 0.5254902, 0, 1, 1,
0.6326064, -1.796312, 1.881065, 0.5294118, 0, 1, 1,
0.6370585, -0.2553271, 2.007367, 0.5372549, 0, 1, 1,
0.6379678, 1.449059, 1.613083, 0.5411765, 0, 1, 1,
0.6406066, 0.270241, 1.764539, 0.5490196, 0, 1, 1,
0.6458152, 0.08298618, 1.126802, 0.5529412, 0, 1, 1,
0.6468819, 0.7621868, 1.058023, 0.5607843, 0, 1, 1,
0.6472412, 0.0702214, 0.7830222, 0.5647059, 0, 1, 1,
0.6521638, -0.2835148, 2.56526, 0.572549, 0, 1, 1,
0.6539623, -0.9041036, 1.355059, 0.5764706, 0, 1, 1,
0.6549166, -1.654107, 1.917132, 0.5843138, 0, 1, 1,
0.6553726, -0.1883057, 1.80392, 0.5882353, 0, 1, 1,
0.6584244, -0.3736797, 2.537, 0.5960785, 0, 1, 1,
0.6589893, -0.3862522, 2.319244, 0.6039216, 0, 1, 1,
0.6666071, 2.040957, 0.6977207, 0.6078432, 0, 1, 1,
0.6666614, 0.9724804, 0.2543299, 0.6156863, 0, 1, 1,
0.6668868, -0.1931676, -0.03162269, 0.6196079, 0, 1, 1,
0.66773, 0.6343026, 0.9779249, 0.627451, 0, 1, 1,
0.6725557, 1.176155, 0.8346952, 0.6313726, 0, 1, 1,
0.6778758, 0.4139571, 0.6961598, 0.6392157, 0, 1, 1,
0.6836452, 0.6491548, 1.278981, 0.6431373, 0, 1, 1,
0.6872047, -0.2171243, 3.258133, 0.6509804, 0, 1, 1,
0.6899389, -0.7112841, 1.862669, 0.654902, 0, 1, 1,
0.6903728, -0.1203524, 3.408751, 0.6627451, 0, 1, 1,
0.6935389, 1.489092, 0.7050332, 0.6666667, 0, 1, 1,
0.6937718, -0.6901478, 1.942155, 0.6745098, 0, 1, 1,
0.6997256, -1.147368, 1.498948, 0.6784314, 0, 1, 1,
0.7013891, 0.9825553, 3.190905, 0.6862745, 0, 1, 1,
0.7014595, 0.2127179, 1.589574, 0.6901961, 0, 1, 1,
0.7015465, -0.1832126, 2.051224, 0.6980392, 0, 1, 1,
0.7047547, -0.2042998, 1.661968, 0.7058824, 0, 1, 1,
0.708662, -0.7597107, 2.577121, 0.7098039, 0, 1, 1,
0.7091986, -0.07788141, 0.1313775, 0.7176471, 0, 1, 1,
0.7323136, -0.895792, 3.264923, 0.7215686, 0, 1, 1,
0.7385787, 0.5617207, 2.337305, 0.7294118, 0, 1, 1,
0.7396366, 1.814973, -1.442598, 0.7333333, 0, 1, 1,
0.7449909, 1.34513, 0.4913801, 0.7411765, 0, 1, 1,
0.7459065, 0.2446835, 0.7415416, 0.7450981, 0, 1, 1,
0.7504696, 0.4499803, -0.03033559, 0.7529412, 0, 1, 1,
0.7510713, -0.3613644, 2.117332, 0.7568628, 0, 1, 1,
0.7511034, 0.1203339, 0.5570698, 0.7647059, 0, 1, 1,
0.7532464, -0.8017968, 2.827314, 0.7686275, 0, 1, 1,
0.754086, 0.781413, 0.9924329, 0.7764706, 0, 1, 1,
0.7550913, 0.06471422, 0.0554874, 0.7803922, 0, 1, 1,
0.7590085, 0.02339876, 0.2278109, 0.7882353, 0, 1, 1,
0.76008, -1.254083, 2.885226, 0.7921569, 0, 1, 1,
0.7601733, -0.005675403, 1.797444, 0.8, 0, 1, 1,
0.7602378, 1.335397, -1.658419, 0.8078431, 0, 1, 1,
0.7659553, -0.2339213, 1.560546, 0.8117647, 0, 1, 1,
0.7713257, -2.046579, 2.350829, 0.8196079, 0, 1, 1,
0.773816, -1.89554, 1.990315, 0.8235294, 0, 1, 1,
0.7767909, -0.8295053, 2.28931, 0.8313726, 0, 1, 1,
0.7796506, -1.434968, 1.180724, 0.8352941, 0, 1, 1,
0.7810365, 0.3856091, 0.7980353, 0.8431373, 0, 1, 1,
0.7838519, -0.249176, 3.724298, 0.8470588, 0, 1, 1,
0.7976736, 1.332884, 0.4190125, 0.854902, 0, 1, 1,
0.7988422, -0.1732222, 1.339119, 0.8588235, 0, 1, 1,
0.8009007, 0.2840289, 2.376897, 0.8666667, 0, 1, 1,
0.8021751, -0.5948038, 1.78868, 0.8705882, 0, 1, 1,
0.8123584, -1.087227, 3.647903, 0.8784314, 0, 1, 1,
0.8129538, 0.2367434, 0.560805, 0.8823529, 0, 1, 1,
0.8156367, 1.106938, 0.7908699, 0.8901961, 0, 1, 1,
0.8185266, 1.072007, 1.327546, 0.8941177, 0, 1, 1,
0.8195751, -1.662664, 3.305436, 0.9019608, 0, 1, 1,
0.8225701, 0.6535417, 0.2756314, 0.9098039, 0, 1, 1,
0.8380181, -0.8006188, 3.129567, 0.9137255, 0, 1, 1,
0.8392742, 1.859372, 1.032935, 0.9215686, 0, 1, 1,
0.8396947, 0.9053983, 1.225131, 0.9254902, 0, 1, 1,
0.8465149, -0.4126974, 0.06556819, 0.9333333, 0, 1, 1,
0.8505014, 1.620948, 2.193468, 0.9372549, 0, 1, 1,
0.8522043, -0.7732288, 2.992395, 0.945098, 0, 1, 1,
0.8536409, -0.01503191, 3.402333, 0.9490196, 0, 1, 1,
0.8558385, -0.1725642, 3.179902, 0.9568627, 0, 1, 1,
0.857463, -0.01432305, 2.569625, 0.9607843, 0, 1, 1,
0.8578663, -0.2937317, 2.071507, 0.9686275, 0, 1, 1,
0.861838, 0.7445021, 2.827489, 0.972549, 0, 1, 1,
0.871191, -1.026719, 2.804497, 0.9803922, 0, 1, 1,
0.8721582, 1.082715, -0.3932893, 0.9843137, 0, 1, 1,
0.8842378, 0.6312396, 1.333932, 0.9921569, 0, 1, 1,
0.8852395, 0.1217167, -0.1660648, 0.9960784, 0, 1, 1,
0.8862071, -0.3756411, 2.524852, 1, 0, 0.9960784, 1,
0.8997496, 0.3271532, 1.177639, 1, 0, 0.9882353, 1,
0.902384, 0.1529421, 2.201208, 1, 0, 0.9843137, 1,
0.9151963, 0.007632129, 1.955019, 1, 0, 0.9764706, 1,
0.9158274, 1.027312, -0.9215117, 1, 0, 0.972549, 1,
0.9187511, -1.468297, 0.758577, 1, 0, 0.9647059, 1,
0.922373, 0.8532898, 0.5855073, 1, 0, 0.9607843, 1,
0.9284164, -0.2769833, 0.04006077, 1, 0, 0.9529412, 1,
0.9312096, 0.0394167, 1.369027, 1, 0, 0.9490196, 1,
0.9336683, -0.8434361, 2.73373, 1, 0, 0.9411765, 1,
0.9352013, -1.642551, 3.145914, 1, 0, 0.9372549, 1,
0.9371306, 1.461806, 0.8909281, 1, 0, 0.9294118, 1,
0.941116, -0.8818622, 4.338002, 1, 0, 0.9254902, 1,
0.9431976, 0.4714332, 0.2783066, 1, 0, 0.9176471, 1,
0.9449521, 0.0465305, 1.633219, 1, 0, 0.9137255, 1,
0.9482291, -1.880961, 1.587636, 1, 0, 0.9058824, 1,
0.9532461, -0.001313976, 2.123789, 1, 0, 0.9019608, 1,
0.9547536, 0.7875014, 2.986902, 1, 0, 0.8941177, 1,
0.9598814, -1.173821, 0.9816993, 1, 0, 0.8862745, 1,
0.9633533, -1.951247, 3.642594, 1, 0, 0.8823529, 1,
0.9664392, -0.8386431, 2.08246, 1, 0, 0.8745098, 1,
0.9698087, 1.09499, 0.3523198, 1, 0, 0.8705882, 1,
0.9734393, 0.4076837, 0.9413041, 1, 0, 0.8627451, 1,
0.9778577, -0.5128825, 1.297461, 1, 0, 0.8588235, 1,
0.9809287, -1.626256, 2.178784, 1, 0, 0.8509804, 1,
0.9874831, -0.2980751, 1.662201, 1, 0, 0.8470588, 1,
0.9884322, 0.04724598, 3.02544, 1, 0, 0.8392157, 1,
0.9944538, -0.2365599, -1.063327, 1, 0, 0.8352941, 1,
0.995217, 0.3389289, 1.046391, 1, 0, 0.827451, 1,
0.9967153, 3.026534, 1.416269, 1, 0, 0.8235294, 1,
1.005941, -1.115132, 3.961591, 1, 0, 0.8156863, 1,
1.006392, -0.4703521, 1.514125, 1, 0, 0.8117647, 1,
1.011533, -1.389174, 1.307412, 1, 0, 0.8039216, 1,
1.012802, 0.4837005, 1.059402, 1, 0, 0.7960784, 1,
1.024859, -0.2481723, 2.800027, 1, 0, 0.7921569, 1,
1.031242, 0.73802, 0.8785643, 1, 0, 0.7843137, 1,
1.044926, -0.5589379, 1.429282, 1, 0, 0.7803922, 1,
1.046928, -0.8246861, 0.9620681, 1, 0, 0.772549, 1,
1.047603, -1.192285, 4.323087, 1, 0, 0.7686275, 1,
1.061713, 0.6439283, 1.33481, 1, 0, 0.7607843, 1,
1.062094, 1.714301, 0.3371744, 1, 0, 0.7568628, 1,
1.06581, -0.1190263, 1.893681, 1, 0, 0.7490196, 1,
1.068454, -1.089915, 2.919578, 1, 0, 0.7450981, 1,
1.071619, -0.05564291, 0.7326417, 1, 0, 0.7372549, 1,
1.072882, -0.732417, 1.930356, 1, 0, 0.7333333, 1,
1.076833, -1.350135, 1.951084, 1, 0, 0.7254902, 1,
1.082276, 0.5480132, 2.634688, 1, 0, 0.7215686, 1,
1.087789, -0.723546, 2.284197, 1, 0, 0.7137255, 1,
1.095185, 0.6295452, 0.878962, 1, 0, 0.7098039, 1,
1.095624, 1.083802, 1.021757, 1, 0, 0.7019608, 1,
1.095726, 0.9475612, 1.045113, 1, 0, 0.6941177, 1,
1.099154, -0.7606756, 4.042317, 1, 0, 0.6901961, 1,
1.103122, 2.007191, 0.9115831, 1, 0, 0.682353, 1,
1.103288, 0.8365948, 0.7603114, 1, 0, 0.6784314, 1,
1.104903, -1.008289, 0.889944, 1, 0, 0.6705883, 1,
1.114905, 1.366457, 1.334884, 1, 0, 0.6666667, 1,
1.129092, -0.5331749, 3.405848, 1, 0, 0.6588235, 1,
1.136788, 2.118054, 1.082611, 1, 0, 0.654902, 1,
1.142904, 0.1118464, 0.6116326, 1, 0, 0.6470588, 1,
1.145647, -0.6764513, 0.9407877, 1, 0, 0.6431373, 1,
1.148181, -2.445608, 1.446422, 1, 0, 0.6352941, 1,
1.150852, -1.348287, 3.132633, 1, 0, 0.6313726, 1,
1.157523, -0.6036834, 1.669188, 1, 0, 0.6235294, 1,
1.161021, 1.26749, -0.5186211, 1, 0, 0.6196079, 1,
1.161249, -0.7482153, 2.513474, 1, 0, 0.6117647, 1,
1.166696, 0.1464881, 1.147989, 1, 0, 0.6078432, 1,
1.167386, 0.7050357, 1.676525, 1, 0, 0.6, 1,
1.169875, 0.3295144, 1.055624, 1, 0, 0.5921569, 1,
1.171322, -1.856557, 3.696116, 1, 0, 0.5882353, 1,
1.178241, 1.234949, -1.019209, 1, 0, 0.5803922, 1,
1.180158, 0.02094968, 1.967535, 1, 0, 0.5764706, 1,
1.187549, 1.489797, 0.7375283, 1, 0, 0.5686275, 1,
1.220557, 0.08328032, 2.219686, 1, 0, 0.5647059, 1,
1.243056, -0.2643341, 2.654029, 1, 0, 0.5568628, 1,
1.247072, -0.7470326, 0.3453204, 1, 0, 0.5529412, 1,
1.247084, -1.390521, 3.700676, 1, 0, 0.5450981, 1,
1.247203, -1.778345, 0.7041088, 1, 0, 0.5411765, 1,
1.252591, 0.3265345, 2.016603, 1, 0, 0.5333334, 1,
1.255027, -0.5344505, 1.45148, 1, 0, 0.5294118, 1,
1.261717, 0.3616593, -0.01258216, 1, 0, 0.5215687, 1,
1.276677, 0.1014291, 0.8167461, 1, 0, 0.5176471, 1,
1.27738, -0.968672, 1.042758, 1, 0, 0.509804, 1,
1.280017, 0.6570706, 1.1921, 1, 0, 0.5058824, 1,
1.281088, -0.8090414, 3.033643, 1, 0, 0.4980392, 1,
1.309157, -1.270005, 3.394246, 1, 0, 0.4901961, 1,
1.320562, 0.668797, 0.8497532, 1, 0, 0.4862745, 1,
1.325674, -1.198809, 1.138445, 1, 0, 0.4784314, 1,
1.326419, 0.8119481, 2.091732, 1, 0, 0.4745098, 1,
1.331666, 2.049937, 0.8539781, 1, 0, 0.4666667, 1,
1.342316, 0.1239202, 0.8768159, 1, 0, 0.4627451, 1,
1.345324, -1.172802, 2.582495, 1, 0, 0.454902, 1,
1.351691, -2.023594, 0.5315642, 1, 0, 0.4509804, 1,
1.359698, 0.2238898, 1.026376, 1, 0, 0.4431373, 1,
1.368136, -0.1907464, 1.316874, 1, 0, 0.4392157, 1,
1.370268, -0.5779967, 3.223409, 1, 0, 0.4313726, 1,
1.384908, -0.3964432, 0.9618304, 1, 0, 0.427451, 1,
1.385692, -0.2113767, 2.571839, 1, 0, 0.4196078, 1,
1.385793, 1.133409, 0.6859322, 1, 0, 0.4156863, 1,
1.387707, 1.210115, 0.7318237, 1, 0, 0.4078431, 1,
1.396612, -2.549316, 3.160684, 1, 0, 0.4039216, 1,
1.400408, -0.07873268, 1.910721, 1, 0, 0.3960784, 1,
1.418305, -1.662452, 0.7869139, 1, 0, 0.3882353, 1,
1.428131, 0.07855906, 2.729754, 1, 0, 0.3843137, 1,
1.445131, -0.9295895, 2.336896, 1, 0, 0.3764706, 1,
1.445523, 1.847074, 0.6984542, 1, 0, 0.372549, 1,
1.450869, -0.4337333, 1.049439, 1, 0, 0.3647059, 1,
1.461505, 0.2308926, 2.83531, 1, 0, 0.3607843, 1,
1.46262, 0.6800044, 1.234201, 1, 0, 0.3529412, 1,
1.485076, -0.354496, 2.70982, 1, 0, 0.3490196, 1,
1.499787, -0.4407941, 1.437393, 1, 0, 0.3411765, 1,
1.507094, 1.053926, 1.221071, 1, 0, 0.3372549, 1,
1.513285, -0.736833, -0.07592526, 1, 0, 0.3294118, 1,
1.530448, 1.923407, 1.523613, 1, 0, 0.3254902, 1,
1.589481, 0.1105404, 0.2888537, 1, 0, 0.3176471, 1,
1.594174, 0.2473995, 2.431053, 1, 0, 0.3137255, 1,
1.598748, 1.858561, 2.132374, 1, 0, 0.3058824, 1,
1.612408, -0.3149284, 2.004021, 1, 0, 0.2980392, 1,
1.629453, -0.5632038, 0.6293212, 1, 0, 0.2941177, 1,
1.631735, -1.142413, 2.744969, 1, 0, 0.2862745, 1,
1.632988, 1.211082, 0.472708, 1, 0, 0.282353, 1,
1.643256, 2.156197, -0.2321675, 1, 0, 0.2745098, 1,
1.645875, 0.754674, 4.176831, 1, 0, 0.2705882, 1,
1.646463, -0.05800924, 0.5859131, 1, 0, 0.2627451, 1,
1.648712, 0.6049789, 1.744007, 1, 0, 0.2588235, 1,
1.65646, 0.112285, 2.689101, 1, 0, 0.2509804, 1,
1.672439, -0.1496122, 3.808419, 1, 0, 0.2470588, 1,
1.694395, -0.09990238, 2.967111, 1, 0, 0.2392157, 1,
1.71, 0.9587442, 0.6071893, 1, 0, 0.2352941, 1,
1.717585, -0.2157675, 1.217312, 1, 0, 0.227451, 1,
1.725299, 0.1904363, 0.9598876, 1, 0, 0.2235294, 1,
1.734363, -1.502159, 2.689191, 1, 0, 0.2156863, 1,
1.734592, 0.08946163, 1.512894, 1, 0, 0.2117647, 1,
1.744688, 1.463749, 1.650781, 1, 0, 0.2039216, 1,
1.767215, -1.817631, 2.644061, 1, 0, 0.1960784, 1,
1.777302, -1.710588, 3.141243, 1, 0, 0.1921569, 1,
1.783576, -0.5952489, 2.074423, 1, 0, 0.1843137, 1,
1.793952, 0.930688, 1.646478, 1, 0, 0.1803922, 1,
1.798418, -0.6009219, 1.689188, 1, 0, 0.172549, 1,
1.805521, -0.3439837, 3.293805, 1, 0, 0.1686275, 1,
1.809376, -1.00378, 3.690356, 1, 0, 0.1607843, 1,
1.815976, -0.6791552, 1.812317, 1, 0, 0.1568628, 1,
1.849624, -0.8399008, 2.618307, 1, 0, 0.1490196, 1,
1.88355, -0.9520268, 1.195235, 1, 0, 0.145098, 1,
1.932994, 0.817, 1.931888, 1, 0, 0.1372549, 1,
2.00689, 1.117063, 1.053981, 1, 0, 0.1333333, 1,
2.028584, -1.187381, 4.167135, 1, 0, 0.1254902, 1,
2.044575, -0.1510629, -0.5054222, 1, 0, 0.1215686, 1,
2.056387, -0.3354711, 3.045, 1, 0, 0.1137255, 1,
2.058674, 2.105396, 1.277364, 1, 0, 0.1098039, 1,
2.104092, -0.1439368, 1.468853, 1, 0, 0.1019608, 1,
2.114994, -1.955119, 2.179771, 1, 0, 0.09411765, 1,
2.117689, -0.5001664, 2.411704, 1, 0, 0.09019608, 1,
2.241068, -0.933594, 2.417176, 1, 0, 0.08235294, 1,
2.278536, 0.7158698, 2.656857, 1, 0, 0.07843138, 1,
2.296737, -1.284486, 2.443956, 1, 0, 0.07058824, 1,
2.331122, -0.352663, 1.514616, 1, 0, 0.06666667, 1,
2.339045, -0.3957547, 2.66007, 1, 0, 0.05882353, 1,
2.340928, 0.3902191, 2.911088, 1, 0, 0.05490196, 1,
2.395503, 1.146576, 1.511417, 1, 0, 0.04705882, 1,
2.466439, 0.2576558, 2.18092, 1, 0, 0.04313726, 1,
2.488635, -2.235247, 1.654951, 1, 0, 0.03529412, 1,
2.520482, 0.517932, 1.053217, 1, 0, 0.03137255, 1,
2.521779, -1.203011, 3.337141, 1, 0, 0.02352941, 1,
2.534827, 0.1882162, 1.311765, 1, 0, 0.01960784, 1,
2.594236, 0.5727174, 0.4284457, 1, 0, 0.01176471, 1,
3.641201, -0.8320835, 1.278946, 1, 0, 0.007843138, 1
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
0.3654503, -5.132941, -7.033033, 0, -0.5, 0.5, 0.5,
0.3654503, -5.132941, -7.033033, 1, -0.5, 0.5, 0.5,
0.3654503, -5.132941, -7.033033, 1, 1.5, 0.5, 0.5,
0.3654503, -5.132941, -7.033033, 0, 1.5, 0.5, 0.5
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
-4.020781, -0.2694484, -7.033033, 0, -0.5, 0.5, 0.5,
-4.020781, -0.2694484, -7.033033, 1, -0.5, 0.5, 0.5,
-4.020781, -0.2694484, -7.033033, 1, 1.5, 0.5, 0.5,
-4.020781, -0.2694484, -7.033033, 0, 1.5, 0.5, 0.5
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
-4.020781, -5.132941, -0.1111827, 0, -0.5, 0.5, 0.5,
-4.020781, -5.132941, -0.1111827, 1, -0.5, 0.5, 0.5,
-4.020781, -5.132941, -0.1111827, 1, 1.5, 0.5, 0.5,
-4.020781, -5.132941, -0.1111827, 0, 1.5, 0.5, 0.5
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
-2, -4.010597, -5.435683,
3, -4.010597, -5.435683,
-2, -4.010597, -5.435683,
-2, -4.197654, -5.701908,
-1, -4.010597, -5.435683,
-1, -4.197654, -5.701908,
0, -4.010597, -5.435683,
0, -4.197654, -5.701908,
1, -4.010597, -5.435683,
1, -4.197654, -5.701908,
2, -4.010597, -5.435683,
2, -4.197654, -5.701908,
3, -4.010597, -5.435683,
3, -4.197654, -5.701908
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
-2, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
-2, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
-2, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
-2, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5,
-1, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
-1, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
-1, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
-1, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5,
0, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
0, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
0, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
0, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5,
1, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
1, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
1, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
1, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5,
2, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
2, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
2, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
2, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5,
3, -4.571769, -6.234358, 0, -0.5, 0.5, 0.5,
3, -4.571769, -6.234358, 1, -0.5, 0.5, 0.5,
3, -4.571769, -6.234358, 1, 1.5, 0.5, 0.5,
3, -4.571769, -6.234358, 0, 1.5, 0.5, 0.5
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
-3.008574, -2, -5.435683,
-3.008574, 2, -5.435683,
-3.008574, -2, -5.435683,
-3.177275, -2, -5.701908,
-3.008574, 0, -5.435683,
-3.177275, 0, -5.701908,
-3.008574, 2, -5.435683,
-3.177275, 2, -5.701908
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
-3.514677, -2, -6.234358, 0, -0.5, 0.5, 0.5,
-3.514677, -2, -6.234358, 1, -0.5, 0.5, 0.5,
-3.514677, -2, -6.234358, 1, 1.5, 0.5, 0.5,
-3.514677, -2, -6.234358, 0, 1.5, 0.5, 0.5,
-3.514677, 0, -6.234358, 0, -0.5, 0.5, 0.5,
-3.514677, 0, -6.234358, 1, -0.5, 0.5, 0.5,
-3.514677, 0, -6.234358, 1, 1.5, 0.5, 0.5,
-3.514677, 0, -6.234358, 0, 1.5, 0.5, 0.5,
-3.514677, 2, -6.234358, 0, -0.5, 0.5, 0.5,
-3.514677, 2, -6.234358, 1, -0.5, 0.5, 0.5,
-3.514677, 2, -6.234358, 1, 1.5, 0.5, 0.5,
-3.514677, 2, -6.234358, 0, 1.5, 0.5, 0.5
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
-3.008574, -4.010597, -4,
-3.008574, -4.010597, 4,
-3.008574, -4.010597, -4,
-3.177275, -4.197654, -4,
-3.008574, -4.010597, -2,
-3.177275, -4.197654, -2,
-3.008574, -4.010597, 0,
-3.177275, -4.197654, 0,
-3.008574, -4.010597, 2,
-3.177275, -4.197654, 2,
-3.008574, -4.010597, 4,
-3.177275, -4.197654, 4
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
-3.514677, -4.571769, -4, 0, -0.5, 0.5, 0.5,
-3.514677, -4.571769, -4, 1, -0.5, 0.5, 0.5,
-3.514677, -4.571769, -4, 1, 1.5, 0.5, 0.5,
-3.514677, -4.571769, -4, 0, 1.5, 0.5, 0.5,
-3.514677, -4.571769, -2, 0, -0.5, 0.5, 0.5,
-3.514677, -4.571769, -2, 1, -0.5, 0.5, 0.5,
-3.514677, -4.571769, -2, 1, 1.5, 0.5, 0.5,
-3.514677, -4.571769, -2, 0, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 0, 0, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 0, 1, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 0, 1, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 0, 0, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 2, 0, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 2, 1, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 2, 1, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 2, 0, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 4, 0, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 4, 1, -0.5, 0.5, 0.5,
-3.514677, -4.571769, 4, 1, 1.5, 0.5, 0.5,
-3.514677, -4.571769, 4, 0, 1.5, 0.5, 0.5
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
-3.008574, -4.010597, -5.435683,
-3.008574, 3.4717, -5.435683,
-3.008574, -4.010597, 5.213318,
-3.008574, 3.4717, 5.213318,
-3.008574, -4.010597, -5.435683,
-3.008574, -4.010597, 5.213318,
-3.008574, 3.4717, -5.435683,
-3.008574, 3.4717, 5.213318,
-3.008574, -4.010597, -5.435683,
3.739474, -4.010597, -5.435683,
-3.008574, -4.010597, 5.213318,
3.739474, -4.010597, 5.213318,
-3.008574, 3.4717, -5.435683,
3.739474, 3.4717, -5.435683,
-3.008574, 3.4717, 5.213318,
3.739474, 3.4717, 5.213318,
3.739474, -4.010597, -5.435683,
3.739474, 3.4717, -5.435683,
3.739474, -4.010597, 5.213318,
3.739474, 3.4717, 5.213318,
3.739474, -4.010597, -5.435683,
3.739474, -4.010597, 5.213318,
3.739474, 3.4717, -5.435683,
3.739474, 3.4717, 5.213318
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
var radius = 7.828274;
var distance = 34.82888;
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
mvMatrix.translate( -0.3654503, 0.2694484, 0.1111827 );
mvMatrix.scale( 1.254301, 1.131215, 0.7948242 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.82888);
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


