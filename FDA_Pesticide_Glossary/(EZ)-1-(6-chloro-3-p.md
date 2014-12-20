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
-3.672787, 0.4584983, -0.5639183, 1, 0, 0, 1,
-3.620645, -0.9258132, -2.27786, 1, 0.007843138, 0, 1,
-3.231616, 1.166726, -0.7799323, 1, 0.01176471, 0, 1,
-2.805049, -0.406163, -0.9812363, 1, 0.01960784, 0, 1,
-2.802831, -0.08563635, -2.359573, 1, 0.02352941, 0, 1,
-2.568461, 1.23367, -0.3534017, 1, 0.03137255, 0, 1,
-2.559969, 0.1416664, -0.5364127, 1, 0.03529412, 0, 1,
-2.550325, 0.6956139, -1.398962, 1, 0.04313726, 0, 1,
-2.402952, -2.010215, -1.745864, 1, 0.04705882, 0, 1,
-2.383706, 0.2372343, -1.428906, 1, 0.05490196, 0, 1,
-2.309542, -0.04893845, -0.2377372, 1, 0.05882353, 0, 1,
-2.273668, -0.9082191, -1.151571, 1, 0.06666667, 0, 1,
-2.272259, 0.3022864, -3.242272, 1, 0.07058824, 0, 1,
-2.255752, 1.144193, 0.9344358, 1, 0.07843138, 0, 1,
-2.137324, -1.056286, -1.28307, 1, 0.08235294, 0, 1,
-2.133183, 0.08134146, -0.5287229, 1, 0.09019608, 0, 1,
-2.10404, -2.87817, -4.00131, 1, 0.09411765, 0, 1,
-2.093871, -0.6178671, -2.879408, 1, 0.1019608, 0, 1,
-2.07687, 1.729837, 1.182891, 1, 0.1098039, 0, 1,
-2.066561, 0.6811358, -0.5067537, 1, 0.1137255, 0, 1,
-1.985659, -1.54064, -2.62482, 1, 0.1215686, 0, 1,
-1.984272, 0.3531384, -0.7228415, 1, 0.1254902, 0, 1,
-1.954753, 1.57718, -0.586475, 1, 0.1333333, 0, 1,
-1.939351, 0.7952707, 0.6425365, 1, 0.1372549, 0, 1,
-1.920441, -0.990509, -3.427491, 1, 0.145098, 0, 1,
-1.918219, 0.3274148, -0.1769522, 1, 0.1490196, 0, 1,
-1.917787, -2.079693, -2.354936, 1, 0.1568628, 0, 1,
-1.915319, -0.3611829, -0.7528187, 1, 0.1607843, 0, 1,
-1.915236, -0.1690401, -0.1258841, 1, 0.1686275, 0, 1,
-1.88363, 2.274032, 0.007948013, 1, 0.172549, 0, 1,
-1.881601, 0.6038987, -1.235919, 1, 0.1803922, 0, 1,
-1.866985, 0.13571, -1.350939, 1, 0.1843137, 0, 1,
-1.835239, 1.482576, -1.179934, 1, 0.1921569, 0, 1,
-1.83506, 0.8603379, -2.738416, 1, 0.1960784, 0, 1,
-1.824722, 1.884806, -1.666758, 1, 0.2039216, 0, 1,
-1.823293, 1.03868, -0.844039, 1, 0.2117647, 0, 1,
-1.822698, -0.09721779, -0.9946771, 1, 0.2156863, 0, 1,
-1.817804, 0.1867406, -0.6584368, 1, 0.2235294, 0, 1,
-1.813981, 1.157533, -0.7363847, 1, 0.227451, 0, 1,
-1.809768, -0.1910277, -3.884646, 1, 0.2352941, 0, 1,
-1.809768, 0.5809237, -1.949895, 1, 0.2392157, 0, 1,
-1.784075, -0.659271, -1.562613, 1, 0.2470588, 0, 1,
-1.780654, -0.4940599, -2.600606, 1, 0.2509804, 0, 1,
-1.780192, -0.210802, -3.062982, 1, 0.2588235, 0, 1,
-1.739209, 0.4881734, -0.9442954, 1, 0.2627451, 0, 1,
-1.737397, 0.05877124, -2.391945, 1, 0.2705882, 0, 1,
-1.724697, 0.3985199, -0.7194807, 1, 0.2745098, 0, 1,
-1.720518, 0.6613265, 0.4463719, 1, 0.282353, 0, 1,
-1.687165, 1.00639, -0.2365391, 1, 0.2862745, 0, 1,
-1.677824, 2.541243, 0.2724757, 1, 0.2941177, 0, 1,
-1.664406, 0.4579684, -1.597771, 1, 0.3019608, 0, 1,
-1.66343, -0.2708384, -1.11869, 1, 0.3058824, 0, 1,
-1.660818, -0.05809784, -0.7293779, 1, 0.3137255, 0, 1,
-1.65244, -0.1695978, -1.107806, 1, 0.3176471, 0, 1,
-1.635519, -1.636641, -2.81835, 1, 0.3254902, 0, 1,
-1.615562, -0.24212, -1.36023, 1, 0.3294118, 0, 1,
-1.61107, 0.6462077, -1.675759, 1, 0.3372549, 0, 1,
-1.59474, 1.679931, 0.2526731, 1, 0.3411765, 0, 1,
-1.593521, 0.3738043, -2.726198, 1, 0.3490196, 0, 1,
-1.592365, -1.107271, -0.9998532, 1, 0.3529412, 0, 1,
-1.561746, 1.072668, -2.966362, 1, 0.3607843, 0, 1,
-1.546945, -0.5455015, -1.940425, 1, 0.3647059, 0, 1,
-1.537788, -0.2011459, -0.7226294, 1, 0.372549, 0, 1,
-1.527818, -0.1373719, -3.04519, 1, 0.3764706, 0, 1,
-1.521188, 0.475711, -0.5152162, 1, 0.3843137, 0, 1,
-1.51537, 0.451239, -3.98179, 1, 0.3882353, 0, 1,
-1.492948, 0.07630714, -2.106533, 1, 0.3960784, 0, 1,
-1.488171, 2.57478, -1.194729, 1, 0.4039216, 0, 1,
-1.484732, 0.1495684, -1.310244, 1, 0.4078431, 0, 1,
-1.478841, 0.4825918, -0.7613069, 1, 0.4156863, 0, 1,
-1.470864, 0.6889857, -1.518924, 1, 0.4196078, 0, 1,
-1.465967, -0.6307527, -1.338557, 1, 0.427451, 0, 1,
-1.45505, 0.05341849, -2.600673, 1, 0.4313726, 0, 1,
-1.44229, 2.257462, -0.6070198, 1, 0.4392157, 0, 1,
-1.44204, 1.448799, -0.3001262, 1, 0.4431373, 0, 1,
-1.432574, 0.3117356, -3.060369, 1, 0.4509804, 0, 1,
-1.432321, -0.9520571, -0.7279247, 1, 0.454902, 0, 1,
-1.430409, 0.404155, -0.4481492, 1, 0.4627451, 0, 1,
-1.429825, -0.1245104, -1.112466, 1, 0.4666667, 0, 1,
-1.41561, -0.8542849, -2.44186, 1, 0.4745098, 0, 1,
-1.403846, 0.3628733, -0.4673017, 1, 0.4784314, 0, 1,
-1.399839, 0.2415228, -1.028818, 1, 0.4862745, 0, 1,
-1.396936, -1.016652, -0.2259806, 1, 0.4901961, 0, 1,
-1.386544, -0.5589294, -2.858051, 1, 0.4980392, 0, 1,
-1.354828, 0.5403896, -3.892659, 1, 0.5058824, 0, 1,
-1.350691, 0.3289399, -3.590373, 1, 0.509804, 0, 1,
-1.344808, -1.270807, -4.524174, 1, 0.5176471, 0, 1,
-1.331067, -0.2495674, -3.163615, 1, 0.5215687, 0, 1,
-1.32379, 0.1392001, -2.67856, 1, 0.5294118, 0, 1,
-1.323045, -0.03806793, -1.567294, 1, 0.5333334, 0, 1,
-1.31338, -0.7573053, -1.126699, 1, 0.5411765, 0, 1,
-1.301719, -0.3203313, -1.58669, 1, 0.5450981, 0, 1,
-1.29942, -0.374582, -3.444078, 1, 0.5529412, 0, 1,
-1.297725, -0.09114495, -1.872938, 1, 0.5568628, 0, 1,
-1.293889, -0.9129102, -2.618366, 1, 0.5647059, 0, 1,
-1.291368, -1.887573, -3.256036, 1, 0.5686275, 0, 1,
-1.285449, -0.06762488, -1.866481, 1, 0.5764706, 0, 1,
-1.277973, -0.6243147, -1.821526, 1, 0.5803922, 0, 1,
-1.274066, -0.4144198, -2.018109, 1, 0.5882353, 0, 1,
-1.271795, 0.7190098, -2.797459, 1, 0.5921569, 0, 1,
-1.26637, -0.8897248, -2.295787, 1, 0.6, 0, 1,
-1.258032, 2.496979, -0.0686437, 1, 0.6078432, 0, 1,
-1.257382, -1.107168, -3.08398, 1, 0.6117647, 0, 1,
-1.249868, -1.008869, -1.990775, 1, 0.6196079, 0, 1,
-1.246862, -0.1793855, -1.485755, 1, 0.6235294, 0, 1,
-1.244219, 1.348933, -1.014726, 1, 0.6313726, 0, 1,
-1.231505, 0.893001, -0.6599427, 1, 0.6352941, 0, 1,
-1.230966, 1.555788, -2.78744, 1, 0.6431373, 0, 1,
-1.22394, 0.8538864, -1.795276, 1, 0.6470588, 0, 1,
-1.203836, -2.376279, -1.868157, 1, 0.654902, 0, 1,
-1.200749, 0.4333056, -0.1765472, 1, 0.6588235, 0, 1,
-1.189039, 0.3252216, -0.8910658, 1, 0.6666667, 0, 1,
-1.174054, 0.05693572, -2.738486, 1, 0.6705883, 0, 1,
-1.164827, 0.8294565, 0.3214763, 1, 0.6784314, 0, 1,
-1.155713, -0.5214694, -2.78437, 1, 0.682353, 0, 1,
-1.155116, 0.6085981, -1.21754, 1, 0.6901961, 0, 1,
-1.154315, 1.531978, 0.3760772, 1, 0.6941177, 0, 1,
-1.148983, 0.1813312, -0.6645325, 1, 0.7019608, 0, 1,
-1.148666, 0.5412443, -1.691152, 1, 0.7098039, 0, 1,
-1.139184, 0.04718998, -1.227751, 1, 0.7137255, 0, 1,
-1.137918, -1.445409, -3.261537, 1, 0.7215686, 0, 1,
-1.135995, 0.6817753, 0.2691651, 1, 0.7254902, 0, 1,
-1.13489, -1.038526, -1.803644, 1, 0.7333333, 0, 1,
-1.131033, -0.09436386, -1.879988, 1, 0.7372549, 0, 1,
-1.13069, 0.2743505, -2.766942, 1, 0.7450981, 0, 1,
-1.129486, -1.107797, -1.757352, 1, 0.7490196, 0, 1,
-1.124689, -1.059785, -3.165676, 1, 0.7568628, 0, 1,
-1.122609, -1.329442, -0.7764232, 1, 0.7607843, 0, 1,
-1.122152, 0.6946841, -2.058608, 1, 0.7686275, 0, 1,
-1.120667, -1.300564, -3.993856, 1, 0.772549, 0, 1,
-1.119116, -0.5866069, -1.322623, 1, 0.7803922, 0, 1,
-1.115914, -0.4842092, -2.487057, 1, 0.7843137, 0, 1,
-1.115729, 0.7511742, -1.296732, 1, 0.7921569, 0, 1,
-1.113017, 1.072874, -0.7487564, 1, 0.7960784, 0, 1,
-1.112251, -1.13982, -1.804789, 1, 0.8039216, 0, 1,
-1.10875, -0.2399563, -1.259811, 1, 0.8117647, 0, 1,
-1.105036, 0.1929657, -0.401635, 1, 0.8156863, 0, 1,
-1.103581, 0.538668, 0.01589564, 1, 0.8235294, 0, 1,
-1.097903, 1.168422, -0.8649039, 1, 0.827451, 0, 1,
-1.096262, 1.719462, 0.3244583, 1, 0.8352941, 0, 1,
-1.089668, 0.812713, -2.749883, 1, 0.8392157, 0, 1,
-1.086256, 0.2128988, -1.433885, 1, 0.8470588, 0, 1,
-1.084632, -1.13164, -1.616596, 1, 0.8509804, 0, 1,
-1.084352, -0.4426218, -2.939574, 1, 0.8588235, 0, 1,
-1.063416, -0.4741923, -2.502837, 1, 0.8627451, 0, 1,
-1.058979, -1.466847, -5.475228, 1, 0.8705882, 0, 1,
-1.047424, 0.1252383, -2.468883, 1, 0.8745098, 0, 1,
-1.041787, -0.1309634, -2.933794, 1, 0.8823529, 0, 1,
-1.03741, 0.49073, 0.3993472, 1, 0.8862745, 0, 1,
-1.035841, -0.2086624, -0.9278301, 1, 0.8941177, 0, 1,
-1.035395, 0.1126062, -2.079573, 1, 0.8980392, 0, 1,
-1.01539, 0.5584032, 0.2437887, 1, 0.9058824, 0, 1,
-1.008154, 0.09475297, -2.072282, 1, 0.9137255, 0, 1,
-0.9975649, 0.1359343, -0.5520134, 1, 0.9176471, 0, 1,
-0.9946288, 1.018905, -1.066435, 1, 0.9254902, 0, 1,
-0.9866487, -0.7059709, -1.989028, 1, 0.9294118, 0, 1,
-0.9855858, 0.8669242, 0.4110511, 1, 0.9372549, 0, 1,
-0.981421, 0.8245789, -0.476033, 1, 0.9411765, 0, 1,
-0.9788981, -0.3160813, -1.577121, 1, 0.9490196, 0, 1,
-0.9768796, -0.2880922, -2.226536, 1, 0.9529412, 0, 1,
-0.9596609, -0.8686296, -3.520676, 1, 0.9607843, 0, 1,
-0.9518946, -0.07650584, -0.5955041, 1, 0.9647059, 0, 1,
-0.9518623, -1.056245, -2.948508, 1, 0.972549, 0, 1,
-0.951404, 0.6256101, -1.344121, 1, 0.9764706, 0, 1,
-0.9460216, -1.446194, -3.851522, 1, 0.9843137, 0, 1,
-0.9441237, 0.06486461, -2.637531, 1, 0.9882353, 0, 1,
-0.9414434, 0.7614713, -1.151974, 1, 0.9960784, 0, 1,
-0.9405679, 0.7696657, 0.4889545, 0.9960784, 1, 0, 1,
-0.9343773, 1.407395, 0.9322615, 0.9921569, 1, 0, 1,
-0.9325752, -0.9600155, -3.445055, 0.9843137, 1, 0, 1,
-0.9289315, 0.5791082, -1.949021, 0.9803922, 1, 0, 1,
-0.9227103, 1.407143, -0.6101545, 0.972549, 1, 0, 1,
-0.920715, 0.8277331, -2.291707, 0.9686275, 1, 0, 1,
-0.9117217, -1.109874, -2.87637, 0.9607843, 1, 0, 1,
-0.9114143, -1.187987, -1.157524, 0.9568627, 1, 0, 1,
-0.9104321, 2.265293, -1.052545, 0.9490196, 1, 0, 1,
-0.8991798, 0.9615574, -1.046439, 0.945098, 1, 0, 1,
-0.8921742, -0.2054183, -1.521954, 0.9372549, 1, 0, 1,
-0.89068, 1.96517, 0.58027, 0.9333333, 1, 0, 1,
-0.8744261, -0.4676928, -2.153677, 0.9254902, 1, 0, 1,
-0.8653542, 0.8955987, -0.9049224, 0.9215686, 1, 0, 1,
-0.8564188, -0.08070543, -0.1580352, 0.9137255, 1, 0, 1,
-0.8544586, -0.9129949, -2.353702, 0.9098039, 1, 0, 1,
-0.8463345, 1.628058, -0.7767757, 0.9019608, 1, 0, 1,
-0.8428395, 1.379542, -0.5697712, 0.8941177, 1, 0, 1,
-0.8409088, 0.6963993, -1.580172, 0.8901961, 1, 0, 1,
-0.8388824, -0.7792498, -2.470085, 0.8823529, 1, 0, 1,
-0.8384151, 0.4105918, -2.433761, 0.8784314, 1, 0, 1,
-0.8302881, 0.2726445, 0.03103406, 0.8705882, 1, 0, 1,
-0.8293127, -0.3380535, -0.6354023, 0.8666667, 1, 0, 1,
-0.8270682, -0.8659799, -2.722294, 0.8588235, 1, 0, 1,
-0.8263482, 0.3165635, -2.66329, 0.854902, 1, 0, 1,
-0.8213073, -0.4007769, -1.824557, 0.8470588, 1, 0, 1,
-0.8176128, -0.9691446, -3.534354, 0.8431373, 1, 0, 1,
-0.8168049, -0.1912276, -2.869297, 0.8352941, 1, 0, 1,
-0.8131936, 0.2830488, 0.8813949, 0.8313726, 1, 0, 1,
-0.8099336, -0.5073538, -1.218296, 0.8235294, 1, 0, 1,
-0.7985393, -1.423132, -3.679076, 0.8196079, 1, 0, 1,
-0.7974204, 2.053521, 0.2848676, 0.8117647, 1, 0, 1,
-0.7905049, -1.985466, -1.735669, 0.8078431, 1, 0, 1,
-0.7901551, 2.149558, -1.246826, 0.8, 1, 0, 1,
-0.7847357, 0.7786932, -0.7662988, 0.7921569, 1, 0, 1,
-0.7679554, 1.431094, -0.9676343, 0.7882353, 1, 0, 1,
-0.7675264, -1.347219, -2.43107, 0.7803922, 1, 0, 1,
-0.760735, 0.5840422, 0.498363, 0.7764706, 1, 0, 1,
-0.7546052, -0.7544876, -3.087711, 0.7686275, 1, 0, 1,
-0.7496968, -0.8848366, -1.127325, 0.7647059, 1, 0, 1,
-0.740849, 0.7637515, -0.5357766, 0.7568628, 1, 0, 1,
-0.7385587, -0.2488048, -2.351008, 0.7529412, 1, 0, 1,
-0.7367701, 1.135008, 1.34598, 0.7450981, 1, 0, 1,
-0.7299047, 0.1303846, -1.989545, 0.7411765, 1, 0, 1,
-0.7285777, 0.7634702, -2.134807, 0.7333333, 1, 0, 1,
-0.7273206, 1.046754, 0.3650295, 0.7294118, 1, 0, 1,
-0.7257551, 0.7282528, -2.701188, 0.7215686, 1, 0, 1,
-0.7244394, -1.805815, -3.638915, 0.7176471, 1, 0, 1,
-0.7224307, 0.4100929, 0.5180423, 0.7098039, 1, 0, 1,
-0.7197578, 1.023226, 0.3440842, 0.7058824, 1, 0, 1,
-0.7119063, 0.0004271522, -0.996792, 0.6980392, 1, 0, 1,
-0.7101666, 1.093686, -0.7293344, 0.6901961, 1, 0, 1,
-0.7096038, 1.257246, -0.1142196, 0.6862745, 1, 0, 1,
-0.7086191, 1.515834, 0.7678613, 0.6784314, 1, 0, 1,
-0.7022935, 0.7193992, -1.398406, 0.6745098, 1, 0, 1,
-0.7007861, -0.788444, -2.565374, 0.6666667, 1, 0, 1,
-0.6980345, 0.177385, -1.952161, 0.6627451, 1, 0, 1,
-0.6953588, 1.002368, -1.116932, 0.654902, 1, 0, 1,
-0.6941631, -1.884614, -3.417525, 0.6509804, 1, 0, 1,
-0.6928235, -1.584852, -1.851558, 0.6431373, 1, 0, 1,
-0.687819, -1.250304, -1.503505, 0.6392157, 1, 0, 1,
-0.6833011, -1.241322, -4.1071, 0.6313726, 1, 0, 1,
-0.6825135, -0.9007252, -1.077877, 0.627451, 1, 0, 1,
-0.6820105, 0.1064222, -1.164242, 0.6196079, 1, 0, 1,
-0.6777343, -0.8199553, -1.904079, 0.6156863, 1, 0, 1,
-0.6768901, 0.3909623, -2.128386, 0.6078432, 1, 0, 1,
-0.6747152, 0.3284873, -0.1743204, 0.6039216, 1, 0, 1,
-0.6712593, 0.6091098, -1.251391, 0.5960785, 1, 0, 1,
-0.665916, -2.312165, -2.859778, 0.5882353, 1, 0, 1,
-0.6643333, -1.507418, -2.857059, 0.5843138, 1, 0, 1,
-0.6585389, -0.7175437, -2.303181, 0.5764706, 1, 0, 1,
-0.6585131, -0.9213904, -2.135141, 0.572549, 1, 0, 1,
-0.6582021, 0.2203092, -3.302594, 0.5647059, 1, 0, 1,
-0.6578044, 1.384024, 0.1766542, 0.5607843, 1, 0, 1,
-0.6498597, 1.500575, 1.217474, 0.5529412, 1, 0, 1,
-0.6497546, 1.675552, -2.28089, 0.5490196, 1, 0, 1,
-0.6480459, 0.1021722, -2.851185, 0.5411765, 1, 0, 1,
-0.6470862, -1.170535, -3.040432, 0.5372549, 1, 0, 1,
-0.644287, -0.1603833, -3.627795, 0.5294118, 1, 0, 1,
-0.6441349, -0.8172762, -2.461144, 0.5254902, 1, 0, 1,
-0.6440551, -1.501018, -1.016933, 0.5176471, 1, 0, 1,
-0.6408539, 0.6841174, -0.5795076, 0.5137255, 1, 0, 1,
-0.6349751, 0.03883266, -1.258857, 0.5058824, 1, 0, 1,
-0.6313128, -0.02467013, -1.692203, 0.5019608, 1, 0, 1,
-0.6300486, -0.3586767, -1.553403, 0.4941176, 1, 0, 1,
-0.6272432, -2.153928, -1.842257, 0.4862745, 1, 0, 1,
-0.6262325, -2.158129, -3.657213, 0.4823529, 1, 0, 1,
-0.6253613, 1.118168, -1.341169, 0.4745098, 1, 0, 1,
-0.6215348, -0.4961118, -3.208401, 0.4705882, 1, 0, 1,
-0.6161278, -0.8257428, -3.704958, 0.4627451, 1, 0, 1,
-0.6159495, 1.037015, 0.007742426, 0.4588235, 1, 0, 1,
-0.6122855, 1.061829, 1.546386, 0.4509804, 1, 0, 1,
-0.6104065, 0.7644058, -1.871621, 0.4470588, 1, 0, 1,
-0.6089631, 0.2477846, -2.537435, 0.4392157, 1, 0, 1,
-0.6081596, -1.233131, -2.469191, 0.4352941, 1, 0, 1,
-0.6026336, 0.5521016, -0.9271746, 0.427451, 1, 0, 1,
-0.5991402, 1.754573, 0.1880115, 0.4235294, 1, 0, 1,
-0.5932546, 0.5577044, -2.073639, 0.4156863, 1, 0, 1,
-0.5899273, -0.3779174, -3.186758, 0.4117647, 1, 0, 1,
-0.5850263, -0.6543218, -2.661886, 0.4039216, 1, 0, 1,
-0.5821387, 0.2105939, -1.467631, 0.3960784, 1, 0, 1,
-0.5746918, -1.244839, -3.688002, 0.3921569, 1, 0, 1,
-0.5725793, -0.3642872, -0.8213051, 0.3843137, 1, 0, 1,
-0.5637582, 0.6969472, -0.1799256, 0.3803922, 1, 0, 1,
-0.5614192, -0.7645815, -0.4426366, 0.372549, 1, 0, 1,
-0.5592925, 1.10216, -0.6273825, 0.3686275, 1, 0, 1,
-0.5546578, 0.8575306, -2.272529, 0.3607843, 1, 0, 1,
-0.552696, 1.466065, -1.340719, 0.3568628, 1, 0, 1,
-0.5484354, -0.01555019, -0.9194021, 0.3490196, 1, 0, 1,
-0.5443806, -0.2211127, -2.094011, 0.345098, 1, 0, 1,
-0.5390891, 0.01044224, -2.382154, 0.3372549, 1, 0, 1,
-0.5343898, -0.21411, -1.738079, 0.3333333, 1, 0, 1,
-0.5323076, 0.2032408, -0.7142133, 0.3254902, 1, 0, 1,
-0.528402, -0.552035, -3.106098, 0.3215686, 1, 0, 1,
-0.5282883, 0.5643483, -0.4633758, 0.3137255, 1, 0, 1,
-0.5268087, -1.111402, -1.674307, 0.3098039, 1, 0, 1,
-0.5250621, 1.204982, -0.03984162, 0.3019608, 1, 0, 1,
-0.5198051, -0.02435115, -2.385533, 0.2941177, 1, 0, 1,
-0.5194348, 0.3737862, -0.5376199, 0.2901961, 1, 0, 1,
-0.515959, 0.6010045, -1.559922, 0.282353, 1, 0, 1,
-0.5145878, 0.3053063, -1.045859, 0.2784314, 1, 0, 1,
-0.5065331, -0.0996466, -1.016488, 0.2705882, 1, 0, 1,
-0.5030123, 1.022687, 1.798565, 0.2666667, 1, 0, 1,
-0.5019994, 0.5435559, 0.3829287, 0.2588235, 1, 0, 1,
-0.4971752, -2.253092, -4.278622, 0.254902, 1, 0, 1,
-0.4969173, -1.524195, -3.829482, 0.2470588, 1, 0, 1,
-0.4950253, -0.02902585, -0.874812, 0.2431373, 1, 0, 1,
-0.4941376, 0.1538849, -1.092979, 0.2352941, 1, 0, 1,
-0.4934933, 1.098473, -1.654478, 0.2313726, 1, 0, 1,
-0.4929395, -0.1498764, 0.2428221, 0.2235294, 1, 0, 1,
-0.4918654, 0.9936392, -1.332333, 0.2196078, 1, 0, 1,
-0.4915125, -0.3160391, -1.8466, 0.2117647, 1, 0, 1,
-0.4904511, -0.9346453, -1.802085, 0.2078431, 1, 0, 1,
-0.4875045, -0.5610083, -2.769871, 0.2, 1, 0, 1,
-0.4874904, 0.9841781, -0.1799771, 0.1921569, 1, 0, 1,
-0.4857893, 0.698084, -0.7850134, 0.1882353, 1, 0, 1,
-0.4854946, -1.255482, -4.456092, 0.1803922, 1, 0, 1,
-0.4851055, 1.130198, 0.2825108, 0.1764706, 1, 0, 1,
-0.4831795, 0.6802844, -0.003449938, 0.1686275, 1, 0, 1,
-0.4762572, 0.7772728, 0.2920838, 0.1647059, 1, 0, 1,
-0.4755213, 0.8532199, 0.7221499, 0.1568628, 1, 0, 1,
-0.4752636, -1.143692, -2.009873, 0.1529412, 1, 0, 1,
-0.474795, 0.9407476, -1.479025, 0.145098, 1, 0, 1,
-0.4746277, -0.0373981, -2.73374, 0.1411765, 1, 0, 1,
-0.472301, -0.963587, -2.233354, 0.1333333, 1, 0, 1,
-0.4703276, 0.1889357, 0.109491, 0.1294118, 1, 0, 1,
-0.4646635, 0.05035518, 0.02211172, 0.1215686, 1, 0, 1,
-0.4635684, -0.432456, -1.678378, 0.1176471, 1, 0, 1,
-0.4616084, -0.0138826, -1.249614, 0.1098039, 1, 0, 1,
-0.4582826, -0.7605907, -3.808844, 0.1058824, 1, 0, 1,
-0.4529044, -1.024456, -2.217862, 0.09803922, 1, 0, 1,
-0.4512495, 0.7597497, -0.2616025, 0.09019608, 1, 0, 1,
-0.4491604, 0.3240168, -1.411849, 0.08627451, 1, 0, 1,
-0.4491571, 1.797542, 0.337214, 0.07843138, 1, 0, 1,
-0.4456428, 0.2661458, -2.484766, 0.07450981, 1, 0, 1,
-0.4444638, -0.1608941, -2.933972, 0.06666667, 1, 0, 1,
-0.4433817, 0.3743162, -0.9068702, 0.0627451, 1, 0, 1,
-0.4423187, -0.8988988, -5.26832, 0.05490196, 1, 0, 1,
-0.4355903, -0.4811472, -2.263673, 0.05098039, 1, 0, 1,
-0.4349708, 1.616216, -1.524869, 0.04313726, 1, 0, 1,
-0.4312618, -0.1032889, -0.90363, 0.03921569, 1, 0, 1,
-0.4271266, 0.2405746, -1.402445, 0.03137255, 1, 0, 1,
-0.4146298, 2.649828, -0.807732, 0.02745098, 1, 0, 1,
-0.4145641, 1.14679, -0.9468095, 0.01960784, 1, 0, 1,
-0.4122829, -0.4414815, -2.42209, 0.01568628, 1, 0, 1,
-0.4108371, -1.17665, -2.77195, 0.007843138, 1, 0, 1,
-0.4081413, -0.7529546, -0.840809, 0.003921569, 1, 0, 1,
-0.4023494, -0.2585423, -1.620318, 0, 1, 0.003921569, 1,
-0.398015, 1.025203, -0.3304693, 0, 1, 0.01176471, 1,
-0.3953045, 1.399014, 1.192384, 0, 1, 0.01568628, 1,
-0.3938913, 0.3397223, -1.773694, 0, 1, 0.02352941, 1,
-0.3901692, -1.030141, -0.00311018, 0, 1, 0.02745098, 1,
-0.3881375, 1.1175, 0.3546854, 0, 1, 0.03529412, 1,
-0.387736, -0.7264947, -4.117726, 0, 1, 0.03921569, 1,
-0.3820855, 1.900216, -0.1596603, 0, 1, 0.04705882, 1,
-0.3787315, -1.391136, -2.781719, 0, 1, 0.05098039, 1,
-0.3779023, -1.051813, -2.8405, 0, 1, 0.05882353, 1,
-0.3772537, -1.443868, -3.68894, 0, 1, 0.0627451, 1,
-0.375196, 0.715481, 0.6775381, 0, 1, 0.07058824, 1,
-0.3726808, -0.4483834, -3.421115, 0, 1, 0.07450981, 1,
-0.3674482, 0.4066703, -0.6230385, 0, 1, 0.08235294, 1,
-0.367343, 0.5875056, -0.3810181, 0, 1, 0.08627451, 1,
-0.366806, 0.2333193, -1.561212, 0, 1, 0.09411765, 1,
-0.3652211, 1.112146, -0.6943445, 0, 1, 0.1019608, 1,
-0.3593732, 0.1938259, -2.086612, 0, 1, 0.1058824, 1,
-0.356966, 0.2224143, -2.286304, 0, 1, 0.1137255, 1,
-0.3541323, -0.7943975, -4.004941, 0, 1, 0.1176471, 1,
-0.347699, -1.014492, -1.468111, 0, 1, 0.1254902, 1,
-0.3441208, -0.4509601, -1.012123, 0, 1, 0.1294118, 1,
-0.3415128, 0.7400401, -1.053409, 0, 1, 0.1372549, 1,
-0.340355, -1.92646, -4.310115, 0, 1, 0.1411765, 1,
-0.3375635, 0.6857176, 0.4927146, 0, 1, 0.1490196, 1,
-0.3367266, 1.300141, 1.791822, 0, 1, 0.1529412, 1,
-0.3360234, 0.2201661, 0.0880438, 0, 1, 0.1607843, 1,
-0.3356879, 1.837594, 1.102417, 0, 1, 0.1647059, 1,
-0.3353957, -0.08605956, -3.155817, 0, 1, 0.172549, 1,
-0.328186, 0.2933584, -2.158089, 0, 1, 0.1764706, 1,
-0.3251598, -0.165099, -1.841512, 0, 1, 0.1843137, 1,
-0.3243752, -0.08763039, -1.833945, 0, 1, 0.1882353, 1,
-0.3235698, -0.958266, -2.337503, 0, 1, 0.1960784, 1,
-0.320238, -1.819286, -3.205834, 0, 1, 0.2039216, 1,
-0.3171755, -0.2142398, -3.10647, 0, 1, 0.2078431, 1,
-0.3154169, 0.6843144, -0.428849, 0, 1, 0.2156863, 1,
-0.3147661, 0.5080872, 0.1159285, 0, 1, 0.2196078, 1,
-0.3126076, 1.384798, 0.1502206, 0, 1, 0.227451, 1,
-0.2967569, -0.3155569, -2.747581, 0, 1, 0.2313726, 1,
-0.2877052, -0.6258364, -3.499904, 0, 1, 0.2392157, 1,
-0.270639, -0.271187, -2.912233, 0, 1, 0.2431373, 1,
-0.2655025, 0.2414827, 0.1926389, 0, 1, 0.2509804, 1,
-0.2584531, 0.7728338, -0.2919624, 0, 1, 0.254902, 1,
-0.2543817, -0.6083094, -1.297568, 0, 1, 0.2627451, 1,
-0.2518431, 0.1075019, -3.307965, 0, 1, 0.2666667, 1,
-0.2509201, -1.82807, -3.751508, 0, 1, 0.2745098, 1,
-0.2500513, 0.4535704, -0.7489305, 0, 1, 0.2784314, 1,
-0.2479244, -1.28316, -1.510859, 0, 1, 0.2862745, 1,
-0.2472808, -0.7743189, -2.935064, 0, 1, 0.2901961, 1,
-0.245364, -0.008798884, -1.37302, 0, 1, 0.2980392, 1,
-0.2446217, -0.07389154, -1.786354, 0, 1, 0.3058824, 1,
-0.2411461, -1.088469, -1.59847, 0, 1, 0.3098039, 1,
-0.2400135, 1.367471, 1.234649, 0, 1, 0.3176471, 1,
-0.2338048, -0.5987703, -2.338403, 0, 1, 0.3215686, 1,
-0.2323415, 0.8691192, -1.808528, 0, 1, 0.3294118, 1,
-0.2321939, 1.736732, 0.3374265, 0, 1, 0.3333333, 1,
-0.232115, -1.204803, -3.832937, 0, 1, 0.3411765, 1,
-0.2318833, -0.4121072, -0.5173697, 0, 1, 0.345098, 1,
-0.2257764, -1.471309, -3.162864, 0, 1, 0.3529412, 1,
-0.2181746, -3.083475, -3.244712, 0, 1, 0.3568628, 1,
-0.2138542, 2.844211, -0.8838481, 0, 1, 0.3647059, 1,
-0.2095886, -0.5365205, -2.79352, 0, 1, 0.3686275, 1,
-0.2080029, 1.642927, 0.3663776, 0, 1, 0.3764706, 1,
-0.1945691, -0.1092092, -1.946981, 0, 1, 0.3803922, 1,
-0.1938764, -0.8481891, -1.488531, 0, 1, 0.3882353, 1,
-0.1925085, 1.301521, -0.3005403, 0, 1, 0.3921569, 1,
-0.1915087, -0.8331739, -1.946831, 0, 1, 0.4, 1,
-0.1880135, 0.3836031, -0.7094078, 0, 1, 0.4078431, 1,
-0.187889, -0.2204713, -3.510953, 0, 1, 0.4117647, 1,
-0.1870589, -1.354914, -4.103364, 0, 1, 0.4196078, 1,
-0.1870566, -0.923464, -2.807791, 0, 1, 0.4235294, 1,
-0.1844158, -0.3206332, -3.049444, 0, 1, 0.4313726, 1,
-0.1838773, -0.02706554, -1.210289, 0, 1, 0.4352941, 1,
-0.1828278, 0.7520987, 0.5127876, 0, 1, 0.4431373, 1,
-0.1813423, -1.050704, -3.304075, 0, 1, 0.4470588, 1,
-0.1787078, 1.724317, -0.380403, 0, 1, 0.454902, 1,
-0.1745637, -0.1744839, -3.377631, 0, 1, 0.4588235, 1,
-0.1730587, -0.1891542, -1.201088, 0, 1, 0.4666667, 1,
-0.1730191, 0.8448459, -0.7805374, 0, 1, 0.4705882, 1,
-0.1727401, -2.274512, -1.957604, 0, 1, 0.4784314, 1,
-0.1716035, -1.736144, -2.145516, 0, 1, 0.4823529, 1,
-0.1714447, 0.2772371, -0.176937, 0, 1, 0.4901961, 1,
-0.1702119, -0.899606, -3.483485, 0, 1, 0.4941176, 1,
-0.1690102, -1.109248, -2.985964, 0, 1, 0.5019608, 1,
-0.1681422, 0.5687233, 0.9992231, 0, 1, 0.509804, 1,
-0.1649528, 0.7655672, 0.7017106, 0, 1, 0.5137255, 1,
-0.1643827, -0.6089001, -3.160076, 0, 1, 0.5215687, 1,
-0.1599121, -0.5474191, -2.267858, 0, 1, 0.5254902, 1,
-0.1576568, 0.8176212, 0.3170094, 0, 1, 0.5333334, 1,
-0.1489103, 1.458022, 0.2338097, 0, 1, 0.5372549, 1,
-0.1483026, -1.941363, -3.00748, 0, 1, 0.5450981, 1,
-0.1466909, -0.558897, -2.465612, 0, 1, 0.5490196, 1,
-0.1421188, 0.7137591, -0.3026752, 0, 1, 0.5568628, 1,
-0.1417706, -0.7041052, -2.83296, 0, 1, 0.5607843, 1,
-0.1318438, 2.042388, -1.067402, 0, 1, 0.5686275, 1,
-0.1312121, -0.6561189, -2.265172, 0, 1, 0.572549, 1,
-0.128587, -0.4826362, -3.786879, 0, 1, 0.5803922, 1,
-0.127522, -1.170547, -1.333401, 0, 1, 0.5843138, 1,
-0.1259165, -0.1366784, -2.385016, 0, 1, 0.5921569, 1,
-0.1235032, 0.1641333, -0.5171891, 0, 1, 0.5960785, 1,
-0.1227549, -0.2797407, -2.615058, 0, 1, 0.6039216, 1,
-0.1176688, -0.7012538, -2.73625, 0, 1, 0.6117647, 1,
-0.1148588, 0.1555916, -1.142018, 0, 1, 0.6156863, 1,
-0.1125549, 0.4240295, 0.2232606, 0, 1, 0.6235294, 1,
-0.1107707, 0.6060781, -0.7900425, 0, 1, 0.627451, 1,
-0.1088863, 1.616367, -0.7663385, 0, 1, 0.6352941, 1,
-0.1088589, 0.9635741, 0.5174068, 0, 1, 0.6392157, 1,
-0.1084663, -0.8016722, -1.705214, 0, 1, 0.6470588, 1,
-0.10435, 0.4382282, -0.1709134, 0, 1, 0.6509804, 1,
-0.1004804, -2.307517, -2.916228, 0, 1, 0.6588235, 1,
-0.09770551, -0.5177746, -4.190347, 0, 1, 0.6627451, 1,
-0.09522782, -0.5113769, -2.114844, 0, 1, 0.6705883, 1,
-0.094041, -0.9739584, -2.312792, 0, 1, 0.6745098, 1,
-0.09236666, 0.2354405, -0.9698792, 0, 1, 0.682353, 1,
-0.092305, -0.4201328, -3.161361, 0, 1, 0.6862745, 1,
-0.08864734, 2.224438, 0.6870062, 0, 1, 0.6941177, 1,
-0.08814233, -0.9694908, -3.74523, 0, 1, 0.7019608, 1,
-0.08794678, 0.1623797, -1.607996, 0, 1, 0.7058824, 1,
-0.087501, 1.035262, -0.9829659, 0, 1, 0.7137255, 1,
-0.0869971, -0.9093146, -3.020468, 0, 1, 0.7176471, 1,
-0.08056747, -0.3009707, -2.507493, 0, 1, 0.7254902, 1,
-0.0779504, -2.141373, -2.056314, 0, 1, 0.7294118, 1,
-0.07671698, 1.660946, -0.3471445, 0, 1, 0.7372549, 1,
-0.07665379, 1.306941, -1.225595, 0, 1, 0.7411765, 1,
-0.07455961, 0.06440737, -3.295413, 0, 1, 0.7490196, 1,
-0.07343867, -1.449592, -3.04799, 0, 1, 0.7529412, 1,
-0.07171028, -0.4002899, -2.87373, 0, 1, 0.7607843, 1,
-0.06746837, 0.6910462, -0.6270382, 0, 1, 0.7647059, 1,
-0.06502653, -0.2309135, -2.705594, 0, 1, 0.772549, 1,
-0.06439951, 0.8721713, -2.348312, 0, 1, 0.7764706, 1,
-0.06145565, 0.2079053, -0.7116219, 0, 1, 0.7843137, 1,
-0.05365029, 1.111508, -1.106524, 0, 1, 0.7882353, 1,
-0.04414451, 0.9667755, 0.09662739, 0, 1, 0.7960784, 1,
-0.04177136, -1.617065, -2.372498, 0, 1, 0.8039216, 1,
-0.04106222, 0.9312888, 1.960785, 0, 1, 0.8078431, 1,
-0.04083214, -1.488201, -0.9986289, 0, 1, 0.8156863, 1,
-0.04025466, 0.2192381, 0.2530911, 0, 1, 0.8196079, 1,
-0.03322081, -0.7173488, -1.676327, 0, 1, 0.827451, 1,
-0.0305841, -0.8771178, -1.867318, 0, 1, 0.8313726, 1,
-0.03020011, -0.09094424, -3.258372, 0, 1, 0.8392157, 1,
-0.02840762, 1.543831, -0.4705037, 0, 1, 0.8431373, 1,
-0.0129364, 0.4476696, -0.1845672, 0, 1, 0.8509804, 1,
-0.003654728, 0.002625651, -0.4490918, 0, 1, 0.854902, 1,
-0.002162983, -0.7404529, -2.526764, 0, 1, 0.8627451, 1,
3.240495e-05, -0.7461217, 1.884611, 0, 1, 0.8666667, 1,
0.0002822712, -1.606412, 3.187099, 0, 1, 0.8745098, 1,
0.00133872, -0.7043418, 3.217315, 0, 1, 0.8784314, 1,
0.001513161, 0.4025626, 0.6226112, 0, 1, 0.8862745, 1,
0.002820677, 2.40979, -0.4655469, 0, 1, 0.8901961, 1,
0.00633022, 2.95903, 0.09971601, 0, 1, 0.8980392, 1,
0.007469343, 0.2059172, 0.8202209, 0, 1, 0.9058824, 1,
0.009098343, -1.295195, 4.700479, 0, 1, 0.9098039, 1,
0.009401992, -0.9978445, 2.931411, 0, 1, 0.9176471, 1,
0.01000925, -0.1532336, 2.69014, 0, 1, 0.9215686, 1,
0.01076685, 0.4318909, 0.3492907, 0, 1, 0.9294118, 1,
0.01097897, 0.8748018, -0.7198748, 0, 1, 0.9333333, 1,
0.01193403, 0.5651326, -0.2159952, 0, 1, 0.9411765, 1,
0.01225645, 0.8353873, 0.4276868, 0, 1, 0.945098, 1,
0.01499595, -0.3561695, 4.515117, 0, 1, 0.9529412, 1,
0.01679652, -0.01923466, 2.704843, 0, 1, 0.9568627, 1,
0.0170723, 0.1383821, -0.01339506, 0, 1, 0.9647059, 1,
0.02197753, -0.7402862, 3.183468, 0, 1, 0.9686275, 1,
0.03286089, 0.4227261, -0.1729384, 0, 1, 0.9764706, 1,
0.03372895, -0.3994943, 2.27506, 0, 1, 0.9803922, 1,
0.04048604, 0.1275982, -0.764353, 0, 1, 0.9882353, 1,
0.04315797, 0.3571055, 0.7367682, 0, 1, 0.9921569, 1,
0.04649814, 1.831547, -1.037022, 0, 1, 1, 1,
0.0479155, -0.04530815, 3.096055, 0, 0.9921569, 1, 1,
0.04829773, -1.272124, 3.974614, 0, 0.9882353, 1, 1,
0.04836329, -0.2240391, 1.94292, 0, 0.9803922, 1, 1,
0.05097316, 0.9523359, -0.9605179, 0, 0.9764706, 1, 1,
0.05104741, -0.02702693, -0.05476112, 0, 0.9686275, 1, 1,
0.05118372, -0.3397292, 2.935378, 0, 0.9647059, 1, 1,
0.057489, -1.532346, 3.080747, 0, 0.9568627, 1, 1,
0.05771317, 0.07978649, 0.08450102, 0, 0.9529412, 1, 1,
0.0586138, 0.7862762, 0.4894881, 0, 0.945098, 1, 1,
0.05903712, 0.1483293, -0.2496403, 0, 0.9411765, 1, 1,
0.05915213, 0.05052199, 0.8656769, 0, 0.9333333, 1, 1,
0.06014446, 1.230856, -0.6907544, 0, 0.9294118, 1, 1,
0.06056139, -0.3766533, 1.593436, 0, 0.9215686, 1, 1,
0.06126281, -0.5251127, 0.9427993, 0, 0.9176471, 1, 1,
0.06286143, -0.5670395, 0.2925592, 0, 0.9098039, 1, 1,
0.06424377, 0.4815533, 0.765662, 0, 0.9058824, 1, 1,
0.06918561, -0.552885, 4.654548, 0, 0.8980392, 1, 1,
0.07335368, -0.3418445, 3.47554, 0, 0.8901961, 1, 1,
0.07488555, -0.2023623, 3.680611, 0, 0.8862745, 1, 1,
0.08046456, -0.5529595, 1.114544, 0, 0.8784314, 1, 1,
0.08456481, 0.5938958, -0.3244452, 0, 0.8745098, 1, 1,
0.08468957, 0.4253258, -1.806888, 0, 0.8666667, 1, 1,
0.08953217, 1.044323, 0.3076794, 0, 0.8627451, 1, 1,
0.08997954, -0.3229508, 3.127107, 0, 0.854902, 1, 1,
0.09111845, 1.114574, 1.70594, 0, 0.8509804, 1, 1,
0.09148567, -1.110088, 3.092979, 0, 0.8431373, 1, 1,
0.09235692, 0.8917954, -0.01235979, 0, 0.8392157, 1, 1,
0.09300991, -0.864629, 2.644822, 0, 0.8313726, 1, 1,
0.09591234, 1.672551, 0.02973925, 0, 0.827451, 1, 1,
0.09815585, 0.9925572, -1.187677, 0, 0.8196079, 1, 1,
0.101551, -1.056578, 4.380039, 0, 0.8156863, 1, 1,
0.1050773, -1.961652, 3.266431, 0, 0.8078431, 1, 1,
0.1092723, 0.6762596, 0.5709969, 0, 0.8039216, 1, 1,
0.111942, 0.5600425, 0.3730959, 0, 0.7960784, 1, 1,
0.1127319, -0.9433722, 3.908763, 0, 0.7882353, 1, 1,
0.1143045, -1.40091, 3.802136, 0, 0.7843137, 1, 1,
0.1193096, 1.006887, -0.1749272, 0, 0.7764706, 1, 1,
0.1234195, 0.7869738, 0.5658024, 0, 0.772549, 1, 1,
0.1234247, -0.3003746, 2.700095, 0, 0.7647059, 1, 1,
0.1240861, -1.455948, 2.218064, 0, 0.7607843, 1, 1,
0.1241948, 0.08746413, 1.716449, 0, 0.7529412, 1, 1,
0.1259427, 2.202059, 0.6110516, 0, 0.7490196, 1, 1,
0.130879, -0.2176548, 3.241048, 0, 0.7411765, 1, 1,
0.1314585, 1.633042, -1.116525, 0, 0.7372549, 1, 1,
0.1342478, -2.307367, 4.652417, 0, 0.7294118, 1, 1,
0.1359613, -1.413219, 3.404085, 0, 0.7254902, 1, 1,
0.1391377, -0.7582448, 4.846626, 0, 0.7176471, 1, 1,
0.1401528, 0.3673489, 1.527654, 0, 0.7137255, 1, 1,
0.1414448, -1.793669, 2.529265, 0, 0.7058824, 1, 1,
0.1437528, 0.1190203, 0.3647429, 0, 0.6980392, 1, 1,
0.1441596, 0.1146405, -0.4137297, 0, 0.6941177, 1, 1,
0.1480057, -1.029602, 4.110025, 0, 0.6862745, 1, 1,
0.1487144, -0.3115799, 4.058389, 0, 0.682353, 1, 1,
0.1487884, 1.28367, 0.2037995, 0, 0.6745098, 1, 1,
0.1508458, 0.3400717, -0.4350285, 0, 0.6705883, 1, 1,
0.1532825, -0.3562581, 3.892841, 0, 0.6627451, 1, 1,
0.1538635, 0.5881221, 0.5848716, 0, 0.6588235, 1, 1,
0.1577241, -0.7773308, 4.1598, 0, 0.6509804, 1, 1,
0.1592013, 1.384255, 0.2731755, 0, 0.6470588, 1, 1,
0.1607581, -0.1328518, 3.720434, 0, 0.6392157, 1, 1,
0.1616486, -1.057666, 3.184496, 0, 0.6352941, 1, 1,
0.163469, 0.6463307, 0.5380017, 0, 0.627451, 1, 1,
0.1639868, -0.8487345, 1.318167, 0, 0.6235294, 1, 1,
0.1665773, 1.373385, -1.009147, 0, 0.6156863, 1, 1,
0.1733694, 0.779444, -0.8032393, 0, 0.6117647, 1, 1,
0.1804069, 1.419067, 0.3545976, 0, 0.6039216, 1, 1,
0.1897466, -1.386547, 2.968839, 0, 0.5960785, 1, 1,
0.1912334, 0.4838412, 1.226831, 0, 0.5921569, 1, 1,
0.1919308, -0.3605368, 1.770989, 0, 0.5843138, 1, 1,
0.192133, 1.545428, 1.573724, 0, 0.5803922, 1, 1,
0.1939088, -0.8703222, 3.640226, 0, 0.572549, 1, 1,
0.1968331, 1.696604, 1.213461, 0, 0.5686275, 1, 1,
0.1994343, 0.7855996, 0.305562, 0, 0.5607843, 1, 1,
0.1994976, -0.701817, 3.353846, 0, 0.5568628, 1, 1,
0.2029964, 1.409364, -1.587454, 0, 0.5490196, 1, 1,
0.2033445, 0.5089064, -0.5168072, 0, 0.5450981, 1, 1,
0.2034039, -0.193486, 2.080894, 0, 0.5372549, 1, 1,
0.2041735, 0.2872738, 2.160698, 0, 0.5333334, 1, 1,
0.2114045, -0.1640146, 2.024879, 0, 0.5254902, 1, 1,
0.2124403, -0.1266434, 3.517247, 0, 0.5215687, 1, 1,
0.214058, -0.3015989, 2.596468, 0, 0.5137255, 1, 1,
0.216619, 0.02111202, 0.05387391, 0, 0.509804, 1, 1,
0.2174771, -0.2773906, 1.529024, 0, 0.5019608, 1, 1,
0.2287709, -0.783534, 4.451833, 0, 0.4941176, 1, 1,
0.2292384, -0.03200254, 1.43646, 0, 0.4901961, 1, 1,
0.2326238, 0.5698706, 0.0985857, 0, 0.4823529, 1, 1,
0.233353, 1.707512, 0.03491766, 0, 0.4784314, 1, 1,
0.2392293, -0.00532316, 0.6062419, 0, 0.4705882, 1, 1,
0.2409783, -0.06706151, 1.715889, 0, 0.4666667, 1, 1,
0.2422726, -1.041078, 3.952789, 0, 0.4588235, 1, 1,
0.2438655, 1.989573, -1.166951, 0, 0.454902, 1, 1,
0.2514988, -0.2180588, 1.025713, 0, 0.4470588, 1, 1,
0.2536445, -1.870839, 3.825195, 0, 0.4431373, 1, 1,
0.257167, 0.6974491, 0.4362282, 0, 0.4352941, 1, 1,
0.2611234, -0.2707753, 2.421759, 0, 0.4313726, 1, 1,
0.2617246, -1.905628, 3.927419, 0, 0.4235294, 1, 1,
0.2655269, -0.3012677, -0.2472944, 0, 0.4196078, 1, 1,
0.2659527, 1.217485, 0.1624436, 0, 0.4117647, 1, 1,
0.2688527, 1.63371, -0.2850359, 0, 0.4078431, 1, 1,
0.2761587, 0.3094751, 2.994773, 0, 0.4, 1, 1,
0.2792416, -0.9354221, 2.898409, 0, 0.3921569, 1, 1,
0.2874786, 1.423904, 0.2653604, 0, 0.3882353, 1, 1,
0.2878599, -1.150759, 1.282757, 0, 0.3803922, 1, 1,
0.2892795, -0.5868652, 1.353572, 0, 0.3764706, 1, 1,
0.2899244, 0.146225, 0.8686358, 0, 0.3686275, 1, 1,
0.2904201, -1.787604, 3.11501, 0, 0.3647059, 1, 1,
0.2912221, 0.5443293, 0.5987445, 0, 0.3568628, 1, 1,
0.2915581, 1.441658, 0.1187309, 0, 0.3529412, 1, 1,
0.2945704, -0.8317803, 2.98367, 0, 0.345098, 1, 1,
0.2952221, -0.8219324, 4.195438, 0, 0.3411765, 1, 1,
0.2953675, 0.263258, -0.3303675, 0, 0.3333333, 1, 1,
0.2957585, 1.923923, -1.346173, 0, 0.3294118, 1, 1,
0.2967311, 0.1434462, -0.1604431, 0, 0.3215686, 1, 1,
0.2981924, -0.5695226, 3.144492, 0, 0.3176471, 1, 1,
0.2994407, -0.7659415, 2.572511, 0, 0.3098039, 1, 1,
0.3001915, -0.9457542, 3.500751, 0, 0.3058824, 1, 1,
0.3021052, 0.2401127, 2.271059, 0, 0.2980392, 1, 1,
0.3089436, 0.7806706, 1.240341, 0, 0.2901961, 1, 1,
0.309995, -0.4742179, 3.365668, 0, 0.2862745, 1, 1,
0.3118888, 0.121214, 1.084463, 0, 0.2784314, 1, 1,
0.3200948, 1.424238, 1.759168, 0, 0.2745098, 1, 1,
0.3206124, -0.5111273, 1.553766, 0, 0.2666667, 1, 1,
0.3207626, -0.1671304, 2.181408, 0, 0.2627451, 1, 1,
0.324707, 1.151089, 0.310154, 0, 0.254902, 1, 1,
0.326591, 0.05051976, 1.076405, 0, 0.2509804, 1, 1,
0.3321877, 0.8930201, 0.6457226, 0, 0.2431373, 1, 1,
0.3382731, -0.1795568, 1.367779, 0, 0.2392157, 1, 1,
0.339793, 0.9419326, 0.07719509, 0, 0.2313726, 1, 1,
0.3445464, 0.7450458, -0.379939, 0, 0.227451, 1, 1,
0.3489265, 0.9462412, 0.01688444, 0, 0.2196078, 1, 1,
0.3499458, 1.9219, -0.5975989, 0, 0.2156863, 1, 1,
0.3552173, -1.042015, 2.22132, 0, 0.2078431, 1, 1,
0.3559034, 0.7710488, -0.8600547, 0, 0.2039216, 1, 1,
0.3574026, -0.2510853, 1.487309, 0, 0.1960784, 1, 1,
0.3606648, 0.7124209, 1.284666, 0, 0.1882353, 1, 1,
0.3634046, -0.6647412, 2.389765, 0, 0.1843137, 1, 1,
0.3669119, -1.195046, 2.696829, 0, 0.1764706, 1, 1,
0.3693689, -1.200454, 3.587372, 0, 0.172549, 1, 1,
0.3697205, 0.01223808, 2.345033, 0, 0.1647059, 1, 1,
0.372355, 1.925583, 1.066326, 0, 0.1607843, 1, 1,
0.3779564, 1.242488, -2.223377, 0, 0.1529412, 1, 1,
0.3792282, -0.5032606, 2.084002, 0, 0.1490196, 1, 1,
0.3829343, -0.4865031, 0.947788, 0, 0.1411765, 1, 1,
0.3900762, 0.08772375, 0.2481081, 0, 0.1372549, 1, 1,
0.3981132, 0.9902688, 0.1305231, 0, 0.1294118, 1, 1,
0.4039138, 0.7673454, 0.8291256, 0, 0.1254902, 1, 1,
0.4052061, 0.2699203, -0.3240685, 0, 0.1176471, 1, 1,
0.4104778, -0.253132, 2.187562, 0, 0.1137255, 1, 1,
0.4108359, 0.4790754, 0.6275705, 0, 0.1058824, 1, 1,
0.413886, 0.1773258, 0.66852, 0, 0.09803922, 1, 1,
0.416187, -0.003416347, 1.086171, 0, 0.09411765, 1, 1,
0.4185717, -1.195308, 0.4718709, 0, 0.08627451, 1, 1,
0.4193195, 0.04129797, 1.890688, 0, 0.08235294, 1, 1,
0.4210185, 0.5043979, 1.182515, 0, 0.07450981, 1, 1,
0.4229341, -1.196499, 2.316298, 0, 0.07058824, 1, 1,
0.426403, 0.3540561, 0.8835238, 0, 0.0627451, 1, 1,
0.4301404, -0.5272453, 0.8963489, 0, 0.05882353, 1, 1,
0.4349093, -0.7687737, 3.786052, 0, 0.05098039, 1, 1,
0.4385586, 3.210755, 1.46176, 0, 0.04705882, 1, 1,
0.4398293, -0.1528811, 2.518702, 0, 0.03921569, 1, 1,
0.4408974, -0.3517445, 0.943957, 0, 0.03529412, 1, 1,
0.4417831, 0.2867133, 0.5892991, 0, 0.02745098, 1, 1,
0.4426166, 0.8659127, -1.718319, 0, 0.02352941, 1, 1,
0.4429438, -0.4344032, 3.549786, 0, 0.01568628, 1, 1,
0.4435549, 0.3211841, 0.6508627, 0, 0.01176471, 1, 1,
0.446648, 1.23197, 1.05012, 0, 0.003921569, 1, 1,
0.4642984, -0.3331063, 1.640248, 0.003921569, 0, 1, 1,
0.4669742, 1.57874, 0.4818894, 0.007843138, 0, 1, 1,
0.4670959, -0.3097953, 0.3476938, 0.01568628, 0, 1, 1,
0.4693519, -1.338496, 2.915679, 0.01960784, 0, 1, 1,
0.4750743, -0.9796408, 3.023225, 0.02745098, 0, 1, 1,
0.4800032, -0.06330308, 1.277321, 0.03137255, 0, 1, 1,
0.4806055, -0.4039361, 1.130644, 0.03921569, 0, 1, 1,
0.4807878, -0.7792053, 2.401949, 0.04313726, 0, 1, 1,
0.4890476, 0.1431369, 1.6675, 0.05098039, 0, 1, 1,
0.4911462, -1.736189, 3.51035, 0.05490196, 0, 1, 1,
0.4927402, -1.210639, 3.608939, 0.0627451, 0, 1, 1,
0.5020698, -1.20811, 4.638863, 0.06666667, 0, 1, 1,
0.5050477, -0.9783885, 0.4892861, 0.07450981, 0, 1, 1,
0.5051277, 0.08840422, 0.9875003, 0.07843138, 0, 1, 1,
0.5055577, -0.0334425, 0.987056, 0.08627451, 0, 1, 1,
0.5101504, -0.3352941, 2.231953, 0.09019608, 0, 1, 1,
0.5156214, -1.917404, 5.259399, 0.09803922, 0, 1, 1,
0.5157921, -0.3118569, 2.001801, 0.1058824, 0, 1, 1,
0.5257442, -1.153861, 2.280028, 0.1098039, 0, 1, 1,
0.5305324, -0.2062924, 3.853307, 0.1176471, 0, 1, 1,
0.5362734, 0.4230459, 0.2951147, 0.1215686, 0, 1, 1,
0.5497289, 1.4722, 0.1611426, 0.1294118, 0, 1, 1,
0.5518318, 0.03352119, 1.806922, 0.1333333, 0, 1, 1,
0.5567539, 0.1068048, 1.010019, 0.1411765, 0, 1, 1,
0.5632756, 0.3844041, 0.1167545, 0.145098, 0, 1, 1,
0.5639499, 1.000255, 1.103464, 0.1529412, 0, 1, 1,
0.5643992, -2.07148, 2.522701, 0.1568628, 0, 1, 1,
0.5658177, 0.4456784, -0.3756359, 0.1647059, 0, 1, 1,
0.5665989, -1.815128, 2.050872, 0.1686275, 0, 1, 1,
0.5675985, -0.002923297, 2.055187, 0.1764706, 0, 1, 1,
0.5736532, -1.332589, 2.258, 0.1803922, 0, 1, 1,
0.5773795, -0.630144, 2.215699, 0.1882353, 0, 1, 1,
0.578384, 0.3825468, 2.098874, 0.1921569, 0, 1, 1,
0.5813472, 0.2301208, 2.104002, 0.2, 0, 1, 1,
0.5822061, -0.3443781, 1.381763, 0.2078431, 0, 1, 1,
0.5839207, 1.19599, 0.6113009, 0.2117647, 0, 1, 1,
0.5839669, 0.05969116, 2.676369, 0.2196078, 0, 1, 1,
0.5842149, -2.098629, 3.170503, 0.2235294, 0, 1, 1,
0.5876242, 2.144893, -0.3224151, 0.2313726, 0, 1, 1,
0.5899218, -1.406298, 4.323345, 0.2352941, 0, 1, 1,
0.5947741, 0.2068423, 1.993134, 0.2431373, 0, 1, 1,
0.5952821, -0.5282773, 2.920141, 0.2470588, 0, 1, 1,
0.59942, -0.9098195, 2.891014, 0.254902, 0, 1, 1,
0.6047044, -0.4480746, 2.541714, 0.2588235, 0, 1, 1,
0.6050601, -0.3864489, 1.753609, 0.2666667, 0, 1, 1,
0.6061536, -0.7227258, 1.226947, 0.2705882, 0, 1, 1,
0.6110244, 1.922188, 0.7764581, 0.2784314, 0, 1, 1,
0.6121117, -0.6723233, 1.861827, 0.282353, 0, 1, 1,
0.6143264, 1.770541, 1.18695, 0.2901961, 0, 1, 1,
0.6158813, 1.256853, -1.419256, 0.2941177, 0, 1, 1,
0.6212689, -0.8540605, 1.866555, 0.3019608, 0, 1, 1,
0.6297778, 1.362624, 0.559966, 0.3098039, 0, 1, 1,
0.6329235, -1.07902, 3.946549, 0.3137255, 0, 1, 1,
0.6333827, 1.770597, -1.132282, 0.3215686, 0, 1, 1,
0.6340383, -1.147456, 2.697736, 0.3254902, 0, 1, 1,
0.6362841, -1.264238, 1.945756, 0.3333333, 0, 1, 1,
0.6400635, 0.339566, 0.9672928, 0.3372549, 0, 1, 1,
0.6400965, 0.08049208, 2.135257, 0.345098, 0, 1, 1,
0.6451716, -0.7966873, 2.479823, 0.3490196, 0, 1, 1,
0.6483858, -1.053307, 1.230955, 0.3568628, 0, 1, 1,
0.6543904, -0.1893266, 0.462518, 0.3607843, 0, 1, 1,
0.6544857, -0.9253663, 2.251154, 0.3686275, 0, 1, 1,
0.6565968, 0.03052172, 2.678297, 0.372549, 0, 1, 1,
0.6571432, -0.3217302, 1.401625, 0.3803922, 0, 1, 1,
0.6598192, 1.675855, -1.931834, 0.3843137, 0, 1, 1,
0.6620342, 0.4030212, -0.1778532, 0.3921569, 0, 1, 1,
0.666407, 0.7469657, 2.179294, 0.3960784, 0, 1, 1,
0.6697254, -0.6175465, 1.68036, 0.4039216, 0, 1, 1,
0.6698081, 1.176512, -0.03557082, 0.4117647, 0, 1, 1,
0.671389, -0.6747805, 0.7589753, 0.4156863, 0, 1, 1,
0.6747281, 2.333344, 0.8825929, 0.4235294, 0, 1, 1,
0.6775874, -1.104881, 4.864448, 0.427451, 0, 1, 1,
0.6786079, -0.2866866, 3.286229, 0.4352941, 0, 1, 1,
0.682135, 0.4079152, 0.3887242, 0.4392157, 0, 1, 1,
0.6821436, -0.4983858, 3.561457, 0.4470588, 0, 1, 1,
0.6833707, -1.921888, 3.072, 0.4509804, 0, 1, 1,
0.6898174, 0.05267017, 1.589318, 0.4588235, 0, 1, 1,
0.6917925, 1.129644, 0.1171922, 0.4627451, 0, 1, 1,
0.6936658, 0.07734369, 1.959477, 0.4705882, 0, 1, 1,
0.6949117, 1.224568, -0.07478864, 0.4745098, 0, 1, 1,
0.6988778, 0.2304287, 3.301613, 0.4823529, 0, 1, 1,
0.6993246, 0.7311542, 0.9346913, 0.4862745, 0, 1, 1,
0.6993415, -0.5621512, 2.674469, 0.4941176, 0, 1, 1,
0.6997941, -0.07147168, 3.343297, 0.5019608, 0, 1, 1,
0.7004018, -0.6052372, 1.29612, 0.5058824, 0, 1, 1,
0.7004722, 1.829797, 0.5592632, 0.5137255, 0, 1, 1,
0.7056158, 1.601836, 0.3499533, 0.5176471, 0, 1, 1,
0.7092839, -0.4768641, 3.039897, 0.5254902, 0, 1, 1,
0.7103156, -0.2228268, 1.839815, 0.5294118, 0, 1, 1,
0.7110204, -0.5045188, 4.713972, 0.5372549, 0, 1, 1,
0.7136386, -0.2182722, 1.454039, 0.5411765, 0, 1, 1,
0.7163459, -0.3529321, 1.50093, 0.5490196, 0, 1, 1,
0.7232144, 0.4914467, 0.7997335, 0.5529412, 0, 1, 1,
0.7321153, 2.026854, 1.661659, 0.5607843, 0, 1, 1,
0.7414857, 0.8111699, 1.515803, 0.5647059, 0, 1, 1,
0.7444583, -0.5327563, 2.431926, 0.572549, 0, 1, 1,
0.7451106, -0.3499679, 2.819964, 0.5764706, 0, 1, 1,
0.7452417, -1.424374, 1.914911, 0.5843138, 0, 1, 1,
0.7459956, -1.346797, 3.199035, 0.5882353, 0, 1, 1,
0.753129, -0.9395701, 1.864904, 0.5960785, 0, 1, 1,
0.7534895, 1.065122, 1.044029, 0.6039216, 0, 1, 1,
0.7574705, 1.069043, 0.3956075, 0.6078432, 0, 1, 1,
0.7673214, 0.1209851, 2.360726, 0.6156863, 0, 1, 1,
0.767804, 1.726289, 0.7034637, 0.6196079, 0, 1, 1,
0.770041, 0.7273418, 1.600464, 0.627451, 0, 1, 1,
0.7714353, -0.06015353, 1.485604, 0.6313726, 0, 1, 1,
0.7742915, 0.4244497, 2.414988, 0.6392157, 0, 1, 1,
0.7743014, -0.7602287, 3.831208, 0.6431373, 0, 1, 1,
0.7761043, -0.179224, 3.899874, 0.6509804, 0, 1, 1,
0.7762472, 0.8797789, 1.22045, 0.654902, 0, 1, 1,
0.7771681, 1.342153, 1.509458, 0.6627451, 0, 1, 1,
0.7786064, 1.219513, 0.3160573, 0.6666667, 0, 1, 1,
0.7786697, -0.9722695, 2.877488, 0.6745098, 0, 1, 1,
0.7797489, 2.230987, -0.6966931, 0.6784314, 0, 1, 1,
0.7818685, -0.04698792, 2.753812, 0.6862745, 0, 1, 1,
0.7836747, 0.4917293, 0.7710248, 0.6901961, 0, 1, 1,
0.7849875, 1.989116, 0.2315049, 0.6980392, 0, 1, 1,
0.7864665, 0.7604805, 0.5488244, 0.7058824, 0, 1, 1,
0.7888185, -0.3899482, 2.287799, 0.7098039, 0, 1, 1,
0.7905185, -1.907747, 1.590199, 0.7176471, 0, 1, 1,
0.7918087, -0.1055148, 2.799578, 0.7215686, 0, 1, 1,
0.7966176, 0.03362888, 2.226442, 0.7294118, 0, 1, 1,
0.7972236, 0.467509, 0.436392, 0.7333333, 0, 1, 1,
0.7982187, -0.3257334, 1.623729, 0.7411765, 0, 1, 1,
0.8040208, -1.491812, 2.601709, 0.7450981, 0, 1, 1,
0.8160478, -0.8764619, 3.562971, 0.7529412, 0, 1, 1,
0.8174034, 1.576252, 1.107162, 0.7568628, 0, 1, 1,
0.8202775, -1.723877, 2.248136, 0.7647059, 0, 1, 1,
0.8210354, 0.1094951, 2.388209, 0.7686275, 0, 1, 1,
0.8220396, 0.1628911, 3.17555, 0.7764706, 0, 1, 1,
0.8241027, -1.060671, 2.151716, 0.7803922, 0, 1, 1,
0.8258216, 0.6567962, 0.6207965, 0.7882353, 0, 1, 1,
0.8357843, 0.6478403, 1.809876, 0.7921569, 0, 1, 1,
0.8369502, 1.28579, -0.752801, 0.8, 0, 1, 1,
0.8436028, -1.249221, 1.876217, 0.8078431, 0, 1, 1,
0.8442653, 0.3415191, 1.277577, 0.8117647, 0, 1, 1,
0.8462595, -0.06806096, 1.158808, 0.8196079, 0, 1, 1,
0.8464068, 0.2643307, -0.2273585, 0.8235294, 0, 1, 1,
0.851606, 0.2630362, 1.067783, 0.8313726, 0, 1, 1,
0.8522683, -0.6736293, 2.452115, 0.8352941, 0, 1, 1,
0.8544269, -1.50913, 3.115252, 0.8431373, 0, 1, 1,
0.8563614, 0.6376694, 0.8405526, 0.8470588, 0, 1, 1,
0.8609267, -0.148978, 2.595845, 0.854902, 0, 1, 1,
0.8610708, -1.389212, 3.897249, 0.8588235, 0, 1, 1,
0.8617061, -0.4507344, 2.676403, 0.8666667, 0, 1, 1,
0.8622054, -0.5227248, 2.171505, 0.8705882, 0, 1, 1,
0.8635885, 0.8968985, -0.852935, 0.8784314, 0, 1, 1,
0.8656341, -0.2380713, 2.062157, 0.8823529, 0, 1, 1,
0.867779, 1.227753, 0.452701, 0.8901961, 0, 1, 1,
0.8726654, 0.4759012, 1.183158, 0.8941177, 0, 1, 1,
0.8776287, 0.1005234, 0.9791198, 0.9019608, 0, 1, 1,
0.8809906, 1.44536, 0.1699131, 0.9098039, 0, 1, 1,
0.8817854, -1.22975, 1.190242, 0.9137255, 0, 1, 1,
0.8843419, 1.292046, -0.6141361, 0.9215686, 0, 1, 1,
0.8845273, 0.2733127, 0.8461288, 0.9254902, 0, 1, 1,
0.8916089, 1.014042, 1.02588, 0.9333333, 0, 1, 1,
0.8935471, -0.3692133, 2.009081, 0.9372549, 0, 1, 1,
0.8939375, -1.385818, 4.223567, 0.945098, 0, 1, 1,
0.898499, -0.2255042, 3.588678, 0.9490196, 0, 1, 1,
0.9033575, 1.48047, 2.309236, 0.9568627, 0, 1, 1,
0.91279, 1.296724, 1.866995, 0.9607843, 0, 1, 1,
0.9149435, 1.069296, 1.499588, 0.9686275, 0, 1, 1,
0.9211067, 0.1387705, 1.299743, 0.972549, 0, 1, 1,
0.9264808, -0.4409149, 4.577224, 0.9803922, 0, 1, 1,
0.9266959, 0.1876726, 1.269076, 0.9843137, 0, 1, 1,
0.9267035, 0.2115064, 1.18814, 0.9921569, 0, 1, 1,
0.9277786, 0.982187, -0.7720208, 0.9960784, 0, 1, 1,
0.93646, -0.6863365, 2.803576, 1, 0, 0.9960784, 1,
0.9371886, 0.1417575, 2.193821, 1, 0, 0.9882353, 1,
0.9373401, -0.3919709, 3.197679, 1, 0, 0.9843137, 1,
0.9494087, 0.2155966, 0.6015443, 1, 0, 0.9764706, 1,
0.9514509, -0.02679964, 3.646239, 1, 0, 0.972549, 1,
0.9586396, -0.3884889, 0.9282477, 1, 0, 0.9647059, 1,
0.9601443, -0.03473681, 0.394024, 1, 0, 0.9607843, 1,
0.9685181, 0.9801525, 0.6717218, 1, 0, 0.9529412, 1,
0.9725313, -1.170025, 2.660034, 1, 0, 0.9490196, 1,
0.9781942, -0.01082183, 0.7386943, 1, 0, 0.9411765, 1,
0.978704, 0.2743376, 0.8566812, 1, 0, 0.9372549, 1,
0.9803492, -1.139555, 3.145505, 1, 0, 0.9294118, 1,
0.9918232, 0.2169105, 2.282176, 1, 0, 0.9254902, 1,
0.9953488, 0.5978842, 1.363747, 1, 0, 0.9176471, 1,
0.9983953, -1.337904, 2.562664, 1, 0, 0.9137255, 1,
1.00175, 0.4220396, 0.2244537, 1, 0, 0.9058824, 1,
1.001819, 0.03260853, 1.942178, 1, 0, 0.9019608, 1,
1.001973, -0.7808855, 2.49157, 1, 0, 0.8941177, 1,
1.003461, -1.113596, 0.7185894, 1, 0, 0.8862745, 1,
1.005778, 0.8006422, -1.256224, 1, 0, 0.8823529, 1,
1.012234, -0.3935225, 2.807024, 1, 0, 0.8745098, 1,
1.012823, 0.6773912, 0.8468585, 1, 0, 0.8705882, 1,
1.029721, -0.5014247, 2.196371, 1, 0, 0.8627451, 1,
1.033931, 0.8891664, 2.783794, 1, 0, 0.8588235, 1,
1.035826, 0.1952726, 2.226894, 1, 0, 0.8509804, 1,
1.045834, 0.3929309, 1.190876, 1, 0, 0.8470588, 1,
1.04634, -1.273553, 3.352716, 1, 0, 0.8392157, 1,
1.050183, 0.8406541, 2.053487, 1, 0, 0.8352941, 1,
1.059452, -1.07008, 2.679631, 1, 0, 0.827451, 1,
1.060334, -0.1794758, 2.815765, 1, 0, 0.8235294, 1,
1.060621, 2.991862, 1.354792, 1, 0, 0.8156863, 1,
1.067591, -0.8527036, 0.949526, 1, 0, 0.8117647, 1,
1.068318, 0.6721032, 2.842732, 1, 0, 0.8039216, 1,
1.075027, -1.110289, 1.750513, 1, 0, 0.7960784, 1,
1.083604, -0.7862177, 1.658965, 1, 0, 0.7921569, 1,
1.091431, 0.9559287, 0.7039496, 1, 0, 0.7843137, 1,
1.096311, -0.9930024, 2.329069, 1, 0, 0.7803922, 1,
1.096991, 0.4047061, 0.8034523, 1, 0, 0.772549, 1,
1.108059, 0.5030727, 3.019953, 1, 0, 0.7686275, 1,
1.110138, 0.02265551, 3.358448, 1, 0, 0.7607843, 1,
1.117633, 0.1332745, 2.276114, 1, 0, 0.7568628, 1,
1.1191, -1.444802, 2.263754, 1, 0, 0.7490196, 1,
1.119627, 0.2249706, 2.735595, 1, 0, 0.7450981, 1,
1.122588, 0.38031, 2.79351, 1, 0, 0.7372549, 1,
1.123079, 0.48331, 1.209997, 1, 0, 0.7333333, 1,
1.12657, -1.080132, 1.903899, 1, 0, 0.7254902, 1,
1.127113, 0.02927906, 2.33358, 1, 0, 0.7215686, 1,
1.128813, -0.03721119, 2.622305, 1, 0, 0.7137255, 1,
1.136984, 0.1228405, 0.7757251, 1, 0, 0.7098039, 1,
1.138535, -1.232605, 3.581703, 1, 0, 0.7019608, 1,
1.141405, 0.03291867, 0.5346329, 1, 0, 0.6941177, 1,
1.14974, 2.300084, 0.3509534, 1, 0, 0.6901961, 1,
1.15466, 0.4565537, 1.476104, 1, 0, 0.682353, 1,
1.167171, -0.4339866, 3.056753, 1, 0, 0.6784314, 1,
1.173459, -0.1609435, -0.2277787, 1, 0, 0.6705883, 1,
1.178963, 0.6010872, 2.619344, 1, 0, 0.6666667, 1,
1.18842, -1.813064, 3.730742, 1, 0, 0.6588235, 1,
1.188989, -0.7868233, 2.497777, 1, 0, 0.654902, 1,
1.20843, 1.932842, -0.3098493, 1, 0, 0.6470588, 1,
1.219786, 2.025831, -0.5818432, 1, 0, 0.6431373, 1,
1.22104, -0.6159618, 2.625324, 1, 0, 0.6352941, 1,
1.232495, -0.1414643, 1.913859, 1, 0, 0.6313726, 1,
1.239244, 0.4054571, -0.9714429, 1, 0, 0.6235294, 1,
1.245897, -0.2528369, 1.281278, 1, 0, 0.6196079, 1,
1.247815, 0.9764925, 0.901569, 1, 0, 0.6117647, 1,
1.254716, -0.8131154, 1.838545, 1, 0, 0.6078432, 1,
1.255308, 1.481007, 1.04805, 1, 0, 0.6, 1,
1.260681, 0.07668189, 2.2551, 1, 0, 0.5921569, 1,
1.261022, 0.4556818, 0.6990865, 1, 0, 0.5882353, 1,
1.265907, 0.01714624, 2.285002, 1, 0, 0.5803922, 1,
1.268249, 0.6482704, 2.875521, 1, 0, 0.5764706, 1,
1.272286, -1.686282, 0.8237267, 1, 0, 0.5686275, 1,
1.275996, 0.9445645, 0.2534105, 1, 0, 0.5647059, 1,
1.290012, -0.5115467, 3.328255, 1, 0, 0.5568628, 1,
1.297228, 1.360251, 2.732331, 1, 0, 0.5529412, 1,
1.300116, -1.002144, 3.390228, 1, 0, 0.5450981, 1,
1.301501, -0.8236626, 1.901303, 1, 0, 0.5411765, 1,
1.303886, 1.19308, 1.877018, 1, 0, 0.5333334, 1,
1.306926, 0.616536, 1.668436, 1, 0, 0.5294118, 1,
1.313079, 2.357342, -0.2436793, 1, 0, 0.5215687, 1,
1.32615, -0.109941, 0.5937111, 1, 0, 0.5176471, 1,
1.334063, 1.076553, 2.259037, 1, 0, 0.509804, 1,
1.349658, -2.404448, 2.314636, 1, 0, 0.5058824, 1,
1.351066, 1.293731, 0.3595791, 1, 0, 0.4980392, 1,
1.358226, 0.1266306, 3.299363, 1, 0, 0.4901961, 1,
1.361116, -0.6461716, 1.786121, 1, 0, 0.4862745, 1,
1.361409, 0.8371041, 1.072119, 1, 0, 0.4784314, 1,
1.362172, -1.550347, 1.107349, 1, 0, 0.4745098, 1,
1.368961, 0.1898724, 1.610963, 1, 0, 0.4666667, 1,
1.371914, -1.628774, 4.20067, 1, 0, 0.4627451, 1,
1.374742, 0.1175364, 2.281796, 1, 0, 0.454902, 1,
1.387095, 1.240791, 1.151852, 1, 0, 0.4509804, 1,
1.38902, 0.6829312, -0.5243365, 1, 0, 0.4431373, 1,
1.392118, -0.08553646, 1.4, 1, 0, 0.4392157, 1,
1.392163, 0.2269832, 2.351614, 1, 0, 0.4313726, 1,
1.394945, -0.7501641, 2.457402, 1, 0, 0.427451, 1,
1.400348, 0.8697212, 1.211799, 1, 0, 0.4196078, 1,
1.402406, -0.1760564, 2.420575, 1, 0, 0.4156863, 1,
1.420194, 0.770645, 2.186219, 1, 0, 0.4078431, 1,
1.424614, -1.864974, 2.365598, 1, 0, 0.4039216, 1,
1.425038, -0.2773526, 2.863107, 1, 0, 0.3960784, 1,
1.425284, -1.323143, 3.44735, 1, 0, 0.3882353, 1,
1.447722, 0.4460083, 1.314586, 1, 0, 0.3843137, 1,
1.451544, 0.1929466, 1.056638, 1, 0, 0.3764706, 1,
1.453177, 1.061121, -0.7639313, 1, 0, 0.372549, 1,
1.467909, 0.4568406, 2.403926, 1, 0, 0.3647059, 1,
1.475719, -0.3918637, 3.254344, 1, 0, 0.3607843, 1,
1.482242, 0.2561009, 0.584407, 1, 0, 0.3529412, 1,
1.48275, 0.4920838, 1.34104, 1, 0, 0.3490196, 1,
1.504473, -0.09982076, 1.252369, 1, 0, 0.3411765, 1,
1.514885, -0.1641517, 2.718702, 1, 0, 0.3372549, 1,
1.517065, 0.1561013, 2.250414, 1, 0, 0.3294118, 1,
1.518173, 0.9973686, 1.186496, 1, 0, 0.3254902, 1,
1.531139, -1.254511, 1.78255, 1, 0, 0.3176471, 1,
1.543119, -0.2391496, 0.4694568, 1, 0, 0.3137255, 1,
1.545324, 1.75295, 0.488824, 1, 0, 0.3058824, 1,
1.556791, 1.065479, 1.02935, 1, 0, 0.2980392, 1,
1.566192, -0.6794579, 2.830184, 1, 0, 0.2941177, 1,
1.567333, 0.9003493, 0.9877878, 1, 0, 0.2862745, 1,
1.580286, 0.3346678, 0.9497594, 1, 0, 0.282353, 1,
1.586683, -1.489678, 1.445432, 1, 0, 0.2745098, 1,
1.593207, 0.5400838, 2.166482, 1, 0, 0.2705882, 1,
1.601023, -0.3043966, 1.17554, 1, 0, 0.2627451, 1,
1.604439, 0.9314529, -0.9836127, 1, 0, 0.2588235, 1,
1.606566, 0.5457445, 1.51853, 1, 0, 0.2509804, 1,
1.612517, 0.352282, 1.881718, 1, 0, 0.2470588, 1,
1.637277, 0.178804, 1.706011, 1, 0, 0.2392157, 1,
1.642889, 0.05325954, 1.241934, 1, 0, 0.2352941, 1,
1.654704, -0.5444437, 2.680479, 1, 0, 0.227451, 1,
1.658756, 0.5899226, 0.7113089, 1, 0, 0.2235294, 1,
1.662185, 0.4492473, 0.3197947, 1, 0, 0.2156863, 1,
1.675449, 1.613014, -0.5882192, 1, 0, 0.2117647, 1,
1.681225, -0.2339897, 0.925907, 1, 0, 0.2039216, 1,
1.691033, 0.9067858, 1.564488, 1, 0, 0.1960784, 1,
1.699434, 0.1341388, 0.1971692, 1, 0, 0.1921569, 1,
1.731666, 0.4467334, 1.299298, 1, 0, 0.1843137, 1,
1.748537, -0.0402049, 1.431684, 1, 0, 0.1803922, 1,
1.768882, 2.95037, -0.7576305, 1, 0, 0.172549, 1,
1.771588, -0.0001510033, 3.435342, 1, 0, 0.1686275, 1,
1.773167, -0.5925887, 1.594697, 1, 0, 0.1607843, 1,
1.775673, 0.2878981, 0.6669598, 1, 0, 0.1568628, 1,
1.786755, -0.2911618, 1.2096, 1, 0, 0.1490196, 1,
1.794672, 0.601592, 2.244851, 1, 0, 0.145098, 1,
1.803012, -2.52769, 2.378611, 1, 0, 0.1372549, 1,
1.818987, -0.5126613, 2.110482, 1, 0, 0.1333333, 1,
1.898396, 0.5381125, 1.953771, 1, 0, 0.1254902, 1,
1.903916, 2.641452, -0.677332, 1, 0, 0.1215686, 1,
1.919462, 1.247208, 0.6363444, 1, 0, 0.1137255, 1,
1.953265, -1.562886, 3.21981, 1, 0, 0.1098039, 1,
1.955452, -0.2470815, 2.11919, 1, 0, 0.1019608, 1,
1.96597, -0.8145019, -0.7530077, 1, 0, 0.09411765, 1,
1.981305, -1.115533, 3.081004, 1, 0, 0.09019608, 1,
2.028157, 0.7830948, -0.09541837, 1, 0, 0.08235294, 1,
2.036872, 1.67199, 1.653232, 1, 0, 0.07843138, 1,
2.039003, -1.401681, 3.507543, 1, 0, 0.07058824, 1,
2.094132, 1.592286, 1.968064, 1, 0, 0.06666667, 1,
2.104932, 0.2809191, 1.491316, 1, 0, 0.05882353, 1,
2.145688, -1.211486, 3.751369, 1, 0, 0.05490196, 1,
2.167906, 0.7390195, 1.420462, 1, 0, 0.04705882, 1,
2.2401, 0.114141, 3.075514, 1, 0, 0.04313726, 1,
2.36024, -0.3745363, 2.070782, 1, 0, 0.03529412, 1,
2.573995, 0.3998279, 1.413553, 1, 0, 0.03137255, 1,
2.686071, 0.2075173, 2.601558, 1, 0, 0.02352941, 1,
2.737121, 2.48704, 0.6554446, 1, 0, 0.01960784, 1,
3.138969, 0.2960519, 2.613877, 1, 0, 0.01176471, 1,
3.787433, -0.941282, 2.617664, 1, 0, 0.007843138, 1
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
0.05732298, -4.150347, -7.294747, 0, -0.5, 0.5, 0.5,
0.05732298, -4.150347, -7.294747, 1, -0.5, 0.5, 0.5,
0.05732298, -4.150347, -7.294747, 1, 1.5, 0.5, 0.5,
0.05732298, -4.150347, -7.294747, 0, 1.5, 0.5, 0.5
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
-4.937295, 0.06364, -7.294747, 0, -0.5, 0.5, 0.5,
-4.937295, 0.06364, -7.294747, 1, -0.5, 0.5, 0.5,
-4.937295, 0.06364, -7.294747, 1, 1.5, 0.5, 0.5,
-4.937295, 0.06364, -7.294747, 0, 1.5, 0.5, 0.5
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
-4.937295, -4.150347, -0.1079144, 0, -0.5, 0.5, 0.5,
-4.937295, -4.150347, -0.1079144, 1, -0.5, 0.5, 0.5,
-4.937295, -4.150347, -0.1079144, 1, 1.5, 0.5, 0.5,
-4.937295, -4.150347, -0.1079144, 0, 1.5, 0.5, 0.5
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
-2, -3.177889, -5.636247,
2, -3.177889, -5.636247,
-2, -3.177889, -5.636247,
-2, -3.339965, -5.912664,
0, -3.177889, -5.636247,
0, -3.339965, -5.912664,
2, -3.177889, -5.636247,
2, -3.339965, -5.912664
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
-2, -3.664118, -6.465497, 0, -0.5, 0.5, 0.5,
-2, -3.664118, -6.465497, 1, -0.5, 0.5, 0.5,
-2, -3.664118, -6.465497, 1, 1.5, 0.5, 0.5,
-2, -3.664118, -6.465497, 0, 1.5, 0.5, 0.5,
0, -3.664118, -6.465497, 0, -0.5, 0.5, 0.5,
0, -3.664118, -6.465497, 1, -0.5, 0.5, 0.5,
0, -3.664118, -6.465497, 1, 1.5, 0.5, 0.5,
0, -3.664118, -6.465497, 0, 1.5, 0.5, 0.5,
2, -3.664118, -6.465497, 0, -0.5, 0.5, 0.5,
2, -3.664118, -6.465497, 1, -0.5, 0.5, 0.5,
2, -3.664118, -6.465497, 1, 1.5, 0.5, 0.5,
2, -3.664118, -6.465497, 0, 1.5, 0.5, 0.5
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
-3.784691, -3, -5.636247,
-3.784691, 3, -5.636247,
-3.784691, -3, -5.636247,
-3.976791, -3, -5.912664,
-3.784691, -2, -5.636247,
-3.976791, -2, -5.912664,
-3.784691, -1, -5.636247,
-3.976791, -1, -5.912664,
-3.784691, 0, -5.636247,
-3.976791, 0, -5.912664,
-3.784691, 1, -5.636247,
-3.976791, 1, -5.912664,
-3.784691, 2, -5.636247,
-3.976791, 2, -5.912664,
-3.784691, 3, -5.636247,
-3.976791, 3, -5.912664
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
-4.360993, -3, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, -3, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, -3, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, -3, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, -2, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, -2, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, -2, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, -2, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, -1, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, -1, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, -1, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, -1, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, 0, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, 0, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, 0, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, 0, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, 1, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, 1, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, 1, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, 1, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, 2, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, 2, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, 2, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, 2, -6.465497, 0, 1.5, 0.5, 0.5,
-4.360993, 3, -6.465497, 0, -0.5, 0.5, 0.5,
-4.360993, 3, -6.465497, 1, -0.5, 0.5, 0.5,
-4.360993, 3, -6.465497, 1, 1.5, 0.5, 0.5,
-4.360993, 3, -6.465497, 0, 1.5, 0.5, 0.5
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
-3.784691, -3.177889, -4,
-3.784691, -3.177889, 4,
-3.784691, -3.177889, -4,
-3.976791, -3.339965, -4,
-3.784691, -3.177889, -2,
-3.976791, -3.339965, -2,
-3.784691, -3.177889, 0,
-3.976791, -3.339965, 0,
-3.784691, -3.177889, 2,
-3.976791, -3.339965, 2,
-3.784691, -3.177889, 4,
-3.976791, -3.339965, 4
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
-4.360993, -3.664118, -4, 0, -0.5, 0.5, 0.5,
-4.360993, -3.664118, -4, 1, -0.5, 0.5, 0.5,
-4.360993, -3.664118, -4, 1, 1.5, 0.5, 0.5,
-4.360993, -3.664118, -4, 0, 1.5, 0.5, 0.5,
-4.360993, -3.664118, -2, 0, -0.5, 0.5, 0.5,
-4.360993, -3.664118, -2, 1, -0.5, 0.5, 0.5,
-4.360993, -3.664118, -2, 1, 1.5, 0.5, 0.5,
-4.360993, -3.664118, -2, 0, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 0, 0, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 0, 1, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 0, 1, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 0, 0, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 2, 0, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 2, 1, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 2, 1, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 2, 0, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 4, 0, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 4, 1, -0.5, 0.5, 0.5,
-4.360993, -3.664118, 4, 1, 1.5, 0.5, 0.5,
-4.360993, -3.664118, 4, 0, 1.5, 0.5, 0.5
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
-3.784691, -3.177889, -5.636247,
-3.784691, 3.305169, -5.636247,
-3.784691, -3.177889, 5.420418,
-3.784691, 3.305169, 5.420418,
-3.784691, -3.177889, -5.636247,
-3.784691, -3.177889, 5.420418,
-3.784691, 3.305169, -5.636247,
-3.784691, 3.305169, 5.420418,
-3.784691, -3.177889, -5.636247,
3.899337, -3.177889, -5.636247,
-3.784691, -3.177889, 5.420418,
3.899337, -3.177889, 5.420418,
-3.784691, 3.305169, -5.636247,
3.899337, 3.305169, -5.636247,
-3.784691, 3.305169, 5.420418,
3.899337, 3.305169, 5.420418,
3.899337, -3.177889, -5.636247,
3.899337, 3.305169, -5.636247,
3.899337, -3.177889, 5.420418,
3.899337, 3.305169, 5.420418,
3.899337, -3.177889, -5.636247,
3.899337, -3.177889, 5.420418,
3.899337, 3.305169, -5.636247,
3.899337, 3.305169, 5.420418
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
var radius = 7.979824;
var distance = 35.50314;
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
mvMatrix.translate( -0.05732298, -0.06364, 0.1079144 );
mvMatrix.scale( 1.122841, 1.330845, 0.7803385 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50314);
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


