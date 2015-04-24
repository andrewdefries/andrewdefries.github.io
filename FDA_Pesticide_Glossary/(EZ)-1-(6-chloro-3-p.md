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
-3.081198, 0.607072, -2.390471, 1, 0, 0, 1,
-3.021838, 1.360159, -0.4914792, 1, 0.007843138, 0, 1,
-2.863238, 0.7959813, -0.5023985, 1, 0.01176471, 0, 1,
-2.704905, 0.1159165, -2.080564, 1, 0.01960784, 0, 1,
-2.638188, 1.463198, -2.37616, 1, 0.02352941, 0, 1,
-2.573939, -1.586234, -2.012272, 1, 0.03137255, 0, 1,
-2.387898, -1.48532, -2.215974, 1, 0.03529412, 0, 1,
-2.356103, -1.384307, -1.859995, 1, 0.04313726, 0, 1,
-2.303154, -1.089113, -2.603241, 1, 0.04705882, 0, 1,
-2.294703, -1.44094, -2.172628, 1, 0.05490196, 0, 1,
-2.22675, 0.6197373, -1.395498, 1, 0.05882353, 0, 1,
-2.20017, -0.8372551, -0.604853, 1, 0.06666667, 0, 1,
-2.176422, -0.1140559, -1.890723, 1, 0.07058824, 0, 1,
-2.174928, -0.3358244, -1.416636, 1, 0.07843138, 0, 1,
-2.148026, 2.112527, 0.2035362, 1, 0.08235294, 0, 1,
-2.048231, 0.4499993, -2.261019, 1, 0.09019608, 0, 1,
-2.040912, -1.937484, -1.233779, 1, 0.09411765, 0, 1,
-2.032596, 0.379723, -1.709712, 1, 0.1019608, 0, 1,
-2.02378, 1.34943, -0.03443598, 1, 0.1098039, 0, 1,
-2.021664, -2.144656, -3.905899, 1, 0.1137255, 0, 1,
-1.965975, 1.454519, -1.061216, 1, 0.1215686, 0, 1,
-1.965747, 2.484493, -1.696259, 1, 0.1254902, 0, 1,
-1.960217, -0.514527, -2.259376, 1, 0.1333333, 0, 1,
-1.925146, 1.959661, 0.1458482, 1, 0.1372549, 0, 1,
-1.899246, -0.795593, -2.453994, 1, 0.145098, 0, 1,
-1.892089, -0.2688796, -2.895019, 1, 0.1490196, 0, 1,
-1.890987, 1.477897, -1.905528, 1, 0.1568628, 0, 1,
-1.88442, 0.5907961, -1.783297, 1, 0.1607843, 0, 1,
-1.873713, 0.273874, -1.701198, 1, 0.1686275, 0, 1,
-1.859268, 0.3665708, -4.005361, 1, 0.172549, 0, 1,
-1.852807, 0.608959, 0.9753831, 1, 0.1803922, 0, 1,
-1.846122, -0.7120804, -1.419368, 1, 0.1843137, 0, 1,
-1.839486, 1.476496, 0.6648674, 1, 0.1921569, 0, 1,
-1.830236, 1.178019, -1.529547, 1, 0.1960784, 0, 1,
-1.816473, 0.3064088, -1.542571, 1, 0.2039216, 0, 1,
-1.815519, -0.7823722, -1.515864, 1, 0.2117647, 0, 1,
-1.79932, -0.5687578, -1.605988, 1, 0.2156863, 0, 1,
-1.787454, -0.1147954, -2.45798, 1, 0.2235294, 0, 1,
-1.761966, 0.7662817, 0.01095102, 1, 0.227451, 0, 1,
-1.757939, 0.9257314, -0.8323084, 1, 0.2352941, 0, 1,
-1.74555, -0.5381488, 0.1188328, 1, 0.2392157, 0, 1,
-1.740666, 0.134915, -1.370038, 1, 0.2470588, 0, 1,
-1.740201, -0.7189863, -2.096287, 1, 0.2509804, 0, 1,
-1.731613, -1.006004, -1.125612, 1, 0.2588235, 0, 1,
-1.726809, 0.4854323, -1.546761, 1, 0.2627451, 0, 1,
-1.716142, -0.4392649, -2.308648, 1, 0.2705882, 0, 1,
-1.703619, 1.402351, -0.2070618, 1, 0.2745098, 0, 1,
-1.678691, 0.4646589, -0.6412166, 1, 0.282353, 0, 1,
-1.65692, 0.4981593, -1.057971, 1, 0.2862745, 0, 1,
-1.650235, 0.4489456, -1.502909, 1, 0.2941177, 0, 1,
-1.644174, 0.4263152, -2.729974, 1, 0.3019608, 0, 1,
-1.623494, 1.341584, 1.540968, 1, 0.3058824, 0, 1,
-1.619721, 0.6587757, -1.855232, 1, 0.3137255, 0, 1,
-1.601078, 1.182828, -1.964437, 1, 0.3176471, 0, 1,
-1.533352, -2.988354, -3.123101, 1, 0.3254902, 0, 1,
-1.516311, 0.1775011, -1.334953, 1, 0.3294118, 0, 1,
-1.514045, 1.470781, -0.7603, 1, 0.3372549, 0, 1,
-1.511434, 0.6838595, -2.064408, 1, 0.3411765, 0, 1,
-1.493364, -0.6299127, -0.396153, 1, 0.3490196, 0, 1,
-1.482573, -0.5876612, -1.094666, 1, 0.3529412, 0, 1,
-1.480344, -0.6823511, -2.393925, 1, 0.3607843, 0, 1,
-1.474016, -0.04819165, -0.3604706, 1, 0.3647059, 0, 1,
-1.471702, -1.930534, -4.331216, 1, 0.372549, 0, 1,
-1.46952, 0.159539, -2.009645, 1, 0.3764706, 0, 1,
-1.458931, 0.6084164, -1.325868, 1, 0.3843137, 0, 1,
-1.456295, 0.8775046, -1.978169, 1, 0.3882353, 0, 1,
-1.455673, -1.033002, -1.595746, 1, 0.3960784, 0, 1,
-1.45535, 1.78519, 0.09849286, 1, 0.4039216, 0, 1,
-1.451419, 0.925377, -2.021141, 1, 0.4078431, 0, 1,
-1.436113, -1.085242, -0.5796202, 1, 0.4156863, 0, 1,
-1.428324, -1.118077, -0.4194374, 1, 0.4196078, 0, 1,
-1.426492, -0.9160996, -2.245781, 1, 0.427451, 0, 1,
-1.416057, 0.580187, -0.3633358, 1, 0.4313726, 0, 1,
-1.413226, 0.2077965, 0.09976549, 1, 0.4392157, 0, 1,
-1.392106, -0.7233455, -2.150023, 1, 0.4431373, 0, 1,
-1.383516, 0.6461637, -1.531644, 1, 0.4509804, 0, 1,
-1.382511, 2.629904, -1.572482, 1, 0.454902, 0, 1,
-1.356855, -0.8384135, -3.419488, 1, 0.4627451, 0, 1,
-1.338769, -0.1054019, -1.510959, 1, 0.4666667, 0, 1,
-1.329904, 0.6716313, -0.6537439, 1, 0.4745098, 0, 1,
-1.316129, -1.056521, -2.245485, 1, 0.4784314, 0, 1,
-1.2872, 0.2845148, -1.767393, 1, 0.4862745, 0, 1,
-1.286496, -0.6394838, -1.087485, 1, 0.4901961, 0, 1,
-1.271849, 0.2096835, -1.431014, 1, 0.4980392, 0, 1,
-1.265531, 0.3561162, -0.930289, 1, 0.5058824, 0, 1,
-1.26511, -0.9310495, -3.759928, 1, 0.509804, 0, 1,
-1.262586, -0.9931753, -1.962039, 1, 0.5176471, 0, 1,
-1.261348, 1.399547, -0.8233235, 1, 0.5215687, 0, 1,
-1.249686, 0.9891381, -1.783792, 1, 0.5294118, 0, 1,
-1.247482, -0.9804448, -1.77323, 1, 0.5333334, 0, 1,
-1.245953, 1.68803, -1.530352, 1, 0.5411765, 0, 1,
-1.23689, 0.8660921, -1.016054, 1, 0.5450981, 0, 1,
-1.234656, 0.9430918, -1.626763, 1, 0.5529412, 0, 1,
-1.231742, -0.9486948, -1.11588, 1, 0.5568628, 0, 1,
-1.227258, -0.2338347, -3.352473, 1, 0.5647059, 0, 1,
-1.226743, 0.2363462, -0.8785683, 1, 0.5686275, 0, 1,
-1.211789, -1.325224, -3.167596, 1, 0.5764706, 0, 1,
-1.205714, 0.4481716, -0.109689, 1, 0.5803922, 0, 1,
-1.199002, 0.2737511, -2.031122, 1, 0.5882353, 0, 1,
-1.196202, -0.6490152, 0.09153953, 1, 0.5921569, 0, 1,
-1.195826, 0.7273748, -1.048465, 1, 0.6, 0, 1,
-1.195625, 0.4215339, -1.005769, 1, 0.6078432, 0, 1,
-1.193321, 1.496814, -0.4134348, 1, 0.6117647, 0, 1,
-1.190298, -1.601738, -3.599706, 1, 0.6196079, 0, 1,
-1.177396, -0.6700332, -0.5484109, 1, 0.6235294, 0, 1,
-1.174966, 0.9573295, 0.2496027, 1, 0.6313726, 0, 1,
-1.172231, -0.1511034, -2.903104, 1, 0.6352941, 0, 1,
-1.169642, 1.288793, -0.2873002, 1, 0.6431373, 0, 1,
-1.16834, 1.495708, -0.9568294, 1, 0.6470588, 0, 1,
-1.165911, -0.268193, -3.693066, 1, 0.654902, 0, 1,
-1.160836, -0.8961288, -2.121888, 1, 0.6588235, 0, 1,
-1.159134, 0.5528405, -1.070914, 1, 0.6666667, 0, 1,
-1.14852, 0.1816014, -1.875449, 1, 0.6705883, 0, 1,
-1.148401, -1.479496, -1.291039, 1, 0.6784314, 0, 1,
-1.144447, -2.751503, -3.969454, 1, 0.682353, 0, 1,
-1.138563, 0.1940052, -2.447443, 1, 0.6901961, 0, 1,
-1.137556, -1.643899, -4.416567, 1, 0.6941177, 0, 1,
-1.135947, -0.308066, -2.319575, 1, 0.7019608, 0, 1,
-1.135501, 1.632713, -0.08529809, 1, 0.7098039, 0, 1,
-1.127287, 0.07520936, -1.278216, 1, 0.7137255, 0, 1,
-1.12105, -0.7851976, 1.098091, 1, 0.7215686, 0, 1,
-1.120564, 0.3727862, -0.2239552, 1, 0.7254902, 0, 1,
-1.112506, 0.06200306, -1.885976, 1, 0.7333333, 0, 1,
-1.107283, 0.6200006, -2.156208, 1, 0.7372549, 0, 1,
-1.098787, 0.4382058, -2.524055, 1, 0.7450981, 0, 1,
-1.098723, 1.773608, 0.009427226, 1, 0.7490196, 0, 1,
-1.095393, -0.2319008, -0.8768772, 1, 0.7568628, 0, 1,
-1.095168, 1.135157, -0.2694005, 1, 0.7607843, 0, 1,
-1.092807, 0.01549321, -0.1765897, 1, 0.7686275, 0, 1,
-1.090841, -0.01696534, -2.638829, 1, 0.772549, 0, 1,
-1.084532, 0.584954, -0.7128178, 1, 0.7803922, 0, 1,
-1.079334, 0.9035283, 0.6664119, 1, 0.7843137, 0, 1,
-1.07736, 0.7327944, -0.1200526, 1, 0.7921569, 0, 1,
-1.072968, 0.5115694, -0.829899, 1, 0.7960784, 0, 1,
-1.068215, 2.006532, -0.3266776, 1, 0.8039216, 0, 1,
-1.065747, 0.801551, 0.607937, 1, 0.8117647, 0, 1,
-1.064709, 0.05950136, 0.1745366, 1, 0.8156863, 0, 1,
-1.064106, -1.120942, -2.318492, 1, 0.8235294, 0, 1,
-1.049742, -0.5102885, -2.503559, 1, 0.827451, 0, 1,
-1.045441, 0.02116243, -1.786281, 1, 0.8352941, 0, 1,
-1.04052, 0.7961167, -2.321103, 1, 0.8392157, 0, 1,
-1.037482, 0.8804906, -0.5816048, 1, 0.8470588, 0, 1,
-1.034747, -0.7113591, -2.482893, 1, 0.8509804, 0, 1,
-1.027669, 0.6696444, -0.5597653, 1, 0.8588235, 0, 1,
-1.024851, -1.332225, -1.589753, 1, 0.8627451, 0, 1,
-1.019161, 0.06309395, -0.6044989, 1, 0.8705882, 0, 1,
-1.016446, -0.6881616, -4.597796, 1, 0.8745098, 0, 1,
-1.004876, -0.6783757, -1.914697, 1, 0.8823529, 0, 1,
-0.996769, 0.8468814, -0.5371724, 1, 0.8862745, 0, 1,
-0.9931486, -0.6120697, -1.208083, 1, 0.8941177, 0, 1,
-0.9830208, 1.213045, -2.121733, 1, 0.8980392, 0, 1,
-0.9819083, -0.1807087, 0.6337803, 1, 0.9058824, 0, 1,
-0.9726394, 1.167613, 0.02375698, 1, 0.9137255, 0, 1,
-0.9632044, -1.035027, -3.152217, 1, 0.9176471, 0, 1,
-0.9600361, -1.469896, -1.812923, 1, 0.9254902, 0, 1,
-0.9568128, 1.03675, -1.624965, 1, 0.9294118, 0, 1,
-0.9468988, 0.5410946, -0.2620997, 1, 0.9372549, 0, 1,
-0.9408551, 0.6029404, -1.559731, 1, 0.9411765, 0, 1,
-0.9398851, 0.5180097, -1.76998, 1, 0.9490196, 0, 1,
-0.930152, -0.3459585, -2.921769, 1, 0.9529412, 0, 1,
-0.9284925, -2.786689, -2.929474, 1, 0.9607843, 0, 1,
-0.9195768, 0.2741711, -0.7972071, 1, 0.9647059, 0, 1,
-0.9127311, -1.79482, -3.094809, 1, 0.972549, 0, 1,
-0.9125995, 0.2319557, -1.299392, 1, 0.9764706, 0, 1,
-0.9101725, -0.7057573, -1.620909, 1, 0.9843137, 0, 1,
-0.9097515, -0.09212349, -3.11269, 1, 0.9882353, 0, 1,
-0.9014035, 1.712337, -0.7065459, 1, 0.9960784, 0, 1,
-0.9010686, -0.4516999, -0.9998906, 0.9960784, 1, 0, 1,
-0.8986365, -1.465631, -3.458312, 0.9921569, 1, 0, 1,
-0.8946354, -0.6762899, -3.450899, 0.9843137, 1, 0, 1,
-0.8858973, -0.173334, -2.940052, 0.9803922, 1, 0, 1,
-0.8813262, -0.4965782, -3.266864, 0.972549, 1, 0, 1,
-0.8801855, 0.1492262, -2.260285, 0.9686275, 1, 0, 1,
-0.8800727, -1.732066, -1.626463, 0.9607843, 1, 0, 1,
-0.8778301, 1.447693, -0.2463647, 0.9568627, 1, 0, 1,
-0.8733106, -0.7783781, -2.515775, 0.9490196, 1, 0, 1,
-0.864984, 0.5534482, -0.854221, 0.945098, 1, 0, 1,
-0.8618814, 0.2946808, -2.716131, 0.9372549, 1, 0, 1,
-0.8602703, -0.7912131, -1.657575, 0.9333333, 1, 0, 1,
-0.8581704, -0.5855269, -1.996241, 0.9254902, 1, 0, 1,
-0.8537815, 0.2837491, -1.995398, 0.9215686, 1, 0, 1,
-0.8451914, -0.9201576, -2.914897, 0.9137255, 1, 0, 1,
-0.8433637, -0.4499547, -3.257205, 0.9098039, 1, 0, 1,
-0.8417726, 0.7335933, -2.23201, 0.9019608, 1, 0, 1,
-0.8394874, -0.1844718, -2.15492, 0.8941177, 1, 0, 1,
-0.8390202, 1.220736, 0.7556131, 0.8901961, 1, 0, 1,
-0.8315583, 1.325422, -1.167107, 0.8823529, 1, 0, 1,
-0.8314655, -0.4253082, -3.770236, 0.8784314, 1, 0, 1,
-0.8287823, -0.4720927, -3.996882, 0.8705882, 1, 0, 1,
-0.8251568, -0.2943742, -2.959132, 0.8666667, 1, 0, 1,
-0.8110806, -0.6453542, -1.890149, 0.8588235, 1, 0, 1,
-0.8106056, -1.054287, -2.657198, 0.854902, 1, 0, 1,
-0.8044919, 1.443269, -1.261486, 0.8470588, 1, 0, 1,
-0.8043723, 0.8129149, -2.132684, 0.8431373, 1, 0, 1,
-0.8042798, 0.3035088, -1.346819, 0.8352941, 1, 0, 1,
-0.7921928, -0.9974143, -0.47477, 0.8313726, 1, 0, 1,
-0.7867137, 0.4639638, -2.305817, 0.8235294, 1, 0, 1,
-0.7785418, -0.6607045, -0.6346468, 0.8196079, 1, 0, 1,
-0.7768801, 0.5011296, -1.174939, 0.8117647, 1, 0, 1,
-0.7737501, -0.3871813, -2.225713, 0.8078431, 1, 0, 1,
-0.7731271, -2.426913, -3.449515, 0.8, 1, 0, 1,
-0.7589347, 0.1492815, -2.242305, 0.7921569, 1, 0, 1,
-0.7548272, -0.7240883, -0.1494726, 0.7882353, 1, 0, 1,
-0.7546664, -0.887626, -1.125705, 0.7803922, 1, 0, 1,
-0.7521274, -1.783246, -1.944641, 0.7764706, 1, 0, 1,
-0.7475429, -0.634053, -2.150838, 0.7686275, 1, 0, 1,
-0.7460985, -0.3184779, -0.8628362, 0.7647059, 1, 0, 1,
-0.7391685, -0.1751639, -0.7788619, 0.7568628, 1, 0, 1,
-0.7371792, 1.337537, -0.1761565, 0.7529412, 1, 0, 1,
-0.73713, 0.04043764, -3.594871, 0.7450981, 1, 0, 1,
-0.7370048, -0.687156, -1.672572, 0.7411765, 1, 0, 1,
-0.7292055, -0.8956323, -4.056945, 0.7333333, 1, 0, 1,
-0.728485, -0.2860808, 0.4258134, 0.7294118, 1, 0, 1,
-0.7272466, 0.4550823, -2.09183, 0.7215686, 1, 0, 1,
-0.7245591, 0.3106513, -1.861571, 0.7176471, 1, 0, 1,
-0.7224072, 0.8709718, -0.3544319, 0.7098039, 1, 0, 1,
-0.7211479, 0.4239442, -0.6583081, 0.7058824, 1, 0, 1,
-0.7202063, 0.3727782, -0.2888639, 0.6980392, 1, 0, 1,
-0.715206, -0.5481573, -2.953732, 0.6901961, 1, 0, 1,
-0.7151284, -0.8471109, -2.762452, 0.6862745, 1, 0, 1,
-0.7143538, 1.037416, 1.668458, 0.6784314, 1, 0, 1,
-0.7091324, 0.1143335, 0.6328833, 0.6745098, 1, 0, 1,
-0.702449, -0.4128101, -3.004537, 0.6666667, 1, 0, 1,
-0.7014167, -1.017781, -3.769659, 0.6627451, 1, 0, 1,
-0.6981902, -0.4184542, -1.977101, 0.654902, 1, 0, 1,
-0.6959207, 1.157056, -0.7487355, 0.6509804, 1, 0, 1,
-0.6873526, -0.3610088, -1.601992, 0.6431373, 1, 0, 1,
-0.6830959, -1.230857, -3.22523, 0.6392157, 1, 0, 1,
-0.679887, -0.4694917, -0.3053904, 0.6313726, 1, 0, 1,
-0.6768979, 1.073477, -0.7357998, 0.627451, 1, 0, 1,
-0.6734148, 0.2076423, -0.4976499, 0.6196079, 1, 0, 1,
-0.6716254, -1.112884, -2.077786, 0.6156863, 1, 0, 1,
-0.6708239, -0.8110676, -3.937947, 0.6078432, 1, 0, 1,
-0.6699225, -0.2061842, -1.934327, 0.6039216, 1, 0, 1,
-0.6666236, 0.1999224, 0.8236355, 0.5960785, 1, 0, 1,
-0.665782, -1.857605, -4.852862, 0.5882353, 1, 0, 1,
-0.6568751, -0.5190471, -2.936321, 0.5843138, 1, 0, 1,
-0.6519927, 1.761967, -1.255877, 0.5764706, 1, 0, 1,
-0.651679, 0.5498249, -0.661972, 0.572549, 1, 0, 1,
-0.6501783, 0.143732, -2.685593, 0.5647059, 1, 0, 1,
-0.644295, 0.6038401, -1.724146, 0.5607843, 1, 0, 1,
-0.6426229, 0.08468655, -1.02421, 0.5529412, 1, 0, 1,
-0.642096, 1.64459, -1.182831, 0.5490196, 1, 0, 1,
-0.6408045, -0.1917728, -2.238029, 0.5411765, 1, 0, 1,
-0.6407647, 0.9721423, -1.675686, 0.5372549, 1, 0, 1,
-0.6353419, -0.09492663, -3.056325, 0.5294118, 1, 0, 1,
-0.6337276, -0.3171806, -3.060357, 0.5254902, 1, 0, 1,
-0.6321436, 1.372412, -1.609182, 0.5176471, 1, 0, 1,
-0.628135, -1.074551, -3.808093, 0.5137255, 1, 0, 1,
-0.6250041, -0.1745228, -2.20498, 0.5058824, 1, 0, 1,
-0.6236798, 0.8367962, -0.9456668, 0.5019608, 1, 0, 1,
-0.6236526, -0.2387807, -3.007353, 0.4941176, 1, 0, 1,
-0.6221433, -0.7824261, -1.950197, 0.4862745, 1, 0, 1,
-0.6157796, -0.483508, -2.49355, 0.4823529, 1, 0, 1,
-0.6110108, 1.107442, 1.815926, 0.4745098, 1, 0, 1,
-0.606596, 0.6203483, -2.831792, 0.4705882, 1, 0, 1,
-0.6006829, 0.9289098, -1.958879, 0.4627451, 1, 0, 1,
-0.5998598, -0.2315139, -2.202378, 0.4588235, 1, 0, 1,
-0.5929405, 0.8672475, -0.2218752, 0.4509804, 1, 0, 1,
-0.5913805, 0.2586301, -2.308222, 0.4470588, 1, 0, 1,
-0.5890409, -0.9724069, -1.674358, 0.4392157, 1, 0, 1,
-0.5807108, 0.3926812, -0.4959462, 0.4352941, 1, 0, 1,
-0.5784318, -0.224196, -1.998939, 0.427451, 1, 0, 1,
-0.5783978, 0.5983018, -3.070215, 0.4235294, 1, 0, 1,
-0.5751455, -0.8500568, -4.214522, 0.4156863, 1, 0, 1,
-0.5673948, -2.130088, -3.41627, 0.4117647, 1, 0, 1,
-0.5647928, 0.5435804, -1.051212, 0.4039216, 1, 0, 1,
-0.5581765, 1.834334, 0.1427737, 0.3960784, 1, 0, 1,
-0.5554035, 0.0959118, -2.53937, 0.3921569, 1, 0, 1,
-0.5535486, 0.1387378, -1.585393, 0.3843137, 1, 0, 1,
-0.5526363, -1.137474, -0.7576643, 0.3803922, 1, 0, 1,
-0.5517627, 2.282912, 0.05424991, 0.372549, 1, 0, 1,
-0.5513229, -1.013347, -2.976691, 0.3686275, 1, 0, 1,
-0.5491767, 0.2527129, -2.018812, 0.3607843, 1, 0, 1,
-0.5460364, -0.7965572, -3.223193, 0.3568628, 1, 0, 1,
-0.5383455, 0.5712671, -1.275233, 0.3490196, 1, 0, 1,
-0.536766, 0.1635319, -1.830001, 0.345098, 1, 0, 1,
-0.5334435, -0.4694098, -2.09253, 0.3372549, 1, 0, 1,
-0.5320694, -0.9596964, -2.589272, 0.3333333, 1, 0, 1,
-0.5320368, -1.99073, -1.973444, 0.3254902, 1, 0, 1,
-0.5307378, -1.235152, -3.87398, 0.3215686, 1, 0, 1,
-0.5271751, -0.2546119, -0.9498345, 0.3137255, 1, 0, 1,
-0.5269791, 0.4195785, -1.248423, 0.3098039, 1, 0, 1,
-0.5257188, 0.133779, -1.490934, 0.3019608, 1, 0, 1,
-0.5209634, 1.146502, -1.267362, 0.2941177, 1, 0, 1,
-0.5205506, -1.039949, -2.906412, 0.2901961, 1, 0, 1,
-0.519644, 1.774456, -0.2739457, 0.282353, 1, 0, 1,
-0.5188126, 1.255126, -0.2962794, 0.2784314, 1, 0, 1,
-0.5155464, 0.06357817, -0.905179, 0.2705882, 1, 0, 1,
-0.5152273, 0.09240805, -3.237057, 0.2666667, 1, 0, 1,
-0.5083076, -0.8579865, -4.738818, 0.2588235, 1, 0, 1,
-0.5078526, 1.172515, -0.252841, 0.254902, 1, 0, 1,
-0.5061119, -0.8852933, -2.719408, 0.2470588, 1, 0, 1,
-0.504142, 0.807947, -0.8974063, 0.2431373, 1, 0, 1,
-0.5026118, 0.9721575, -1.93952, 0.2352941, 1, 0, 1,
-0.492303, 0.6931499, 0.7295289, 0.2313726, 1, 0, 1,
-0.4883206, 0.1595354, -1.510009, 0.2235294, 1, 0, 1,
-0.4867284, -0.22168, -1.779333, 0.2196078, 1, 0, 1,
-0.4849588, 0.744556, -1.324681, 0.2117647, 1, 0, 1,
-0.4834359, 0.5428357, -0.1701724, 0.2078431, 1, 0, 1,
-0.4815681, 1.685131, 0.3202477, 0.2, 1, 0, 1,
-0.478469, 1.476851, -2.051255, 0.1921569, 1, 0, 1,
-0.4773636, 0.6667075, -2.365819, 0.1882353, 1, 0, 1,
-0.4768438, 0.7196779, 0.233263, 0.1803922, 1, 0, 1,
-0.4693471, -1.205002, -3.820465, 0.1764706, 1, 0, 1,
-0.4667426, -0.04681976, -2.180223, 0.1686275, 1, 0, 1,
-0.4633818, -0.2513409, -1.557065, 0.1647059, 1, 0, 1,
-0.4494721, 0.461752, -2.160105, 0.1568628, 1, 0, 1,
-0.4406239, 0.508109, 0.1620991, 0.1529412, 1, 0, 1,
-0.4393736, 1.363093, 0.4211302, 0.145098, 1, 0, 1,
-0.4381784, 1.43812, 0.03211118, 0.1411765, 1, 0, 1,
-0.4321856, 0.08707032, -2.318354, 0.1333333, 1, 0, 1,
-0.431336, 0.6868969, -1.451722, 0.1294118, 1, 0, 1,
-0.4273562, 0.04867979, -0.8241335, 0.1215686, 1, 0, 1,
-0.4265231, -0.3493909, -3.250287, 0.1176471, 1, 0, 1,
-0.4241261, -0.4312381, -1.983698, 0.1098039, 1, 0, 1,
-0.4163316, 0.9663391, -1.625841, 0.1058824, 1, 0, 1,
-0.3945693, 1.525422, -1.064788, 0.09803922, 1, 0, 1,
-0.3872585, -2.427477, -2.653831, 0.09019608, 1, 0, 1,
-0.3825504, -0.5399033, -3.145829, 0.08627451, 1, 0, 1,
-0.3788873, 1.585311, -0.2863485, 0.07843138, 1, 0, 1,
-0.3716481, 1.867521, -0.5103459, 0.07450981, 1, 0, 1,
-0.3691792, 1.50017, -1.012767, 0.06666667, 1, 0, 1,
-0.3666112, -1.961784, -2.265683, 0.0627451, 1, 0, 1,
-0.3623227, -2.159466, -1.901071, 0.05490196, 1, 0, 1,
-0.362256, -2.389408, -1.071801, 0.05098039, 1, 0, 1,
-0.362173, -0.9336447, -3.5961, 0.04313726, 1, 0, 1,
-0.3537674, -1.587768, -0.5817034, 0.03921569, 1, 0, 1,
-0.3507965, 1.289403, -2.434331, 0.03137255, 1, 0, 1,
-0.3502659, -1.395172, -3.128813, 0.02745098, 1, 0, 1,
-0.3500738, 1.263756, 0.09622832, 0.01960784, 1, 0, 1,
-0.3488618, -1.275734, -4.023857, 0.01568628, 1, 0, 1,
-0.3479005, 1.938729, 0.5627261, 0.007843138, 1, 0, 1,
-0.3466282, 1.971251, 0.2667193, 0.003921569, 1, 0, 1,
-0.3461813, 0.4229231, -3.326863, 0, 1, 0.003921569, 1,
-0.3456898, 1.854653, -1.447154, 0, 1, 0.01176471, 1,
-0.3455652, -0.8808212, -3.325882, 0, 1, 0.01568628, 1,
-0.3433624, 1.45487, -0.4236905, 0, 1, 0.02352941, 1,
-0.3376524, 0.08452296, -0.7344704, 0, 1, 0.02745098, 1,
-0.337578, 0.5859349, 0.3122441, 0, 1, 0.03529412, 1,
-0.3357604, -0.7417203, -2.936329, 0, 1, 0.03921569, 1,
-0.3230588, 1.816907, -0.2867469, 0, 1, 0.04705882, 1,
-0.319696, 1.810839, 2.290232, 0, 1, 0.05098039, 1,
-0.3163971, -0.7283296, -2.060503, 0, 1, 0.05882353, 1,
-0.3098695, -0.4471356, -1.70745, 0, 1, 0.0627451, 1,
-0.3098055, -0.5265787, -2.398984, 0, 1, 0.07058824, 1,
-0.3065456, 1.310175, 0.003046914, 0, 1, 0.07450981, 1,
-0.305012, -0.7053583, -2.974929, 0, 1, 0.08235294, 1,
-0.2907988, -0.1406859, -3.139351, 0, 1, 0.08627451, 1,
-0.2889614, -0.7372124, -2.715589, 0, 1, 0.09411765, 1,
-0.2881612, 0.3130797, -0.5732776, 0, 1, 0.1019608, 1,
-0.2812471, -1.449472, -1.935624, 0, 1, 0.1058824, 1,
-0.2806089, -1.368085, -5.598393, 0, 1, 0.1137255, 1,
-0.2800784, 1.060514, 0.6081141, 0, 1, 0.1176471, 1,
-0.2792342, 0.746231, -0.7085932, 0, 1, 0.1254902, 1,
-0.2771533, -0.1059347, -1.352644, 0, 1, 0.1294118, 1,
-0.2756711, 1.908103, -1.291725, 0, 1, 0.1372549, 1,
-0.26842, 0.003360254, 1.169175, 0, 1, 0.1411765, 1,
-0.2673293, -0.1695738, -0.9638526, 0, 1, 0.1490196, 1,
-0.2647722, -0.2515037, -2.80389, 0, 1, 0.1529412, 1,
-0.2636692, -0.8121964, -2.534435, 0, 1, 0.1607843, 1,
-0.2591581, 2.828667, -0.3910012, 0, 1, 0.1647059, 1,
-0.2569207, 1.129988, -1.353003, 0, 1, 0.172549, 1,
-0.2568245, 1.678113, 1.2155, 0, 1, 0.1764706, 1,
-0.2551429, -0.4249258, -1.682454, 0, 1, 0.1843137, 1,
-0.2509143, -0.96427, -3.359545, 0, 1, 0.1882353, 1,
-0.2505359, -0.2315867, -2.105333, 0, 1, 0.1960784, 1,
-0.2470723, -1.497665, -4.799322, 0, 1, 0.2039216, 1,
-0.2470568, 0.468361, -1.519931, 0, 1, 0.2078431, 1,
-0.245613, 0.2276077, -3.018963, 0, 1, 0.2156863, 1,
-0.2430579, 0.4496093, -1.775088, 0, 1, 0.2196078, 1,
-0.2428225, 1.557495, 1.594856, 0, 1, 0.227451, 1,
-0.242112, 0.394592, -0.8691379, 0, 1, 0.2313726, 1,
-0.234795, -0.3218079, -2.08275, 0, 1, 0.2392157, 1,
-0.234669, -0.96766, -4.161056, 0, 1, 0.2431373, 1,
-0.226051, 0.1796377, -0.2376314, 0, 1, 0.2509804, 1,
-0.222273, -1.804383, -3.743204, 0, 1, 0.254902, 1,
-0.2221999, 0.4022382, -0.6518773, 0, 1, 0.2627451, 1,
-0.2212299, 0.7429305, -1.498157, 0, 1, 0.2666667, 1,
-0.2173797, 0.7134648, 0.4081362, 0, 1, 0.2745098, 1,
-0.2144974, -0.8669641, -2.46113, 0, 1, 0.2784314, 1,
-0.2121846, 1.80027, -0.06395859, 0, 1, 0.2862745, 1,
-0.2076374, -0.9828322, -3.530647, 0, 1, 0.2901961, 1,
-0.2066493, -1.191066, -2.781453, 0, 1, 0.2980392, 1,
-0.2059053, -0.2559504, -1.028088, 0, 1, 0.3058824, 1,
-0.2017761, -1.66626, -4.66369, 0, 1, 0.3098039, 1,
-0.1972802, -1.950496, -3.677785, 0, 1, 0.3176471, 1,
-0.1952731, 0.5013674, 0.4945509, 0, 1, 0.3215686, 1,
-0.1929827, -0.6187928, -3.146898, 0, 1, 0.3294118, 1,
-0.1917887, 0.6702465, 0.3970437, 0, 1, 0.3333333, 1,
-0.1914352, 0.1848154, -0.3354698, 0, 1, 0.3411765, 1,
-0.1892044, 1.174391, -1.716718, 0, 1, 0.345098, 1,
-0.1889302, 0.282644, 0.4038395, 0, 1, 0.3529412, 1,
-0.1883208, -0.1698847, -0.9021823, 0, 1, 0.3568628, 1,
-0.1860444, 0.9431616, -1.211505, 0, 1, 0.3647059, 1,
-0.1837498, -0.604512, -3.322057, 0, 1, 0.3686275, 1,
-0.1830005, -0.2877828, -2.313473, 0, 1, 0.3764706, 1,
-0.1829733, 0.3701181, -0.3247578, 0, 1, 0.3803922, 1,
-0.1760456, -0.8504892, -1.697787, 0, 1, 0.3882353, 1,
-0.171403, 0.4156345, -1.64252, 0, 1, 0.3921569, 1,
-0.1562817, 0.8155016, -0.6861564, 0, 1, 0.4, 1,
-0.1558402, 1.473612, -0.4236293, 0, 1, 0.4078431, 1,
-0.1537719, -0.849297, -3.646099, 0, 1, 0.4117647, 1,
-0.149207, 0.9894154, -0.4150302, 0, 1, 0.4196078, 1,
-0.1492052, -1.924788, -3.370183, 0, 1, 0.4235294, 1,
-0.1447961, -0.08605347, -1.14007, 0, 1, 0.4313726, 1,
-0.1426264, 0.3588258, -0.4640607, 0, 1, 0.4352941, 1,
-0.1410396, -0.8499927, -3.929118, 0, 1, 0.4431373, 1,
-0.1408905, 0.04287565, -1.778634, 0, 1, 0.4470588, 1,
-0.1399167, 1.027569, -2.478111, 0, 1, 0.454902, 1,
-0.1348219, -0.06751986, -2.903526, 0, 1, 0.4588235, 1,
-0.1289465, -0.2513044, -3.708658, 0, 1, 0.4666667, 1,
-0.1289366, 0.2747752, -1.734677, 0, 1, 0.4705882, 1,
-0.1285193, -0.08587817, -2.043031, 0, 1, 0.4784314, 1,
-0.127814, -0.698009, -1.659272, 0, 1, 0.4823529, 1,
-0.1272341, 0.4815217, -1.850571, 0, 1, 0.4901961, 1,
-0.1261054, 0.3418407, -0.04990158, 0, 1, 0.4941176, 1,
-0.1250708, -1.474962, -3.340651, 0, 1, 0.5019608, 1,
-0.1237927, -0.4388174, -4.536415, 0, 1, 0.509804, 1,
-0.1230804, -0.8528079, -3.981137, 0, 1, 0.5137255, 1,
-0.1149523, 1.240346, 0.4902599, 0, 1, 0.5215687, 1,
-0.1144862, 0.1547225, -1.20974, 0, 1, 0.5254902, 1,
-0.1139034, -0.6774782, -2.319784, 0, 1, 0.5333334, 1,
-0.1129828, 0.4610199, 0.1884551, 0, 1, 0.5372549, 1,
-0.1107439, -0.3159075, -4.122468, 0, 1, 0.5450981, 1,
-0.1067764, 0.3517678, -0.3216904, 0, 1, 0.5490196, 1,
-0.1054231, 1.259281, -0.3220104, 0, 1, 0.5568628, 1,
-0.1022893, -0.6355316, -0.7118776, 0, 1, 0.5607843, 1,
-0.1014067, 1.880639, -0.6545756, 0, 1, 0.5686275, 1,
-0.1004467, 0.9983497, -0.01394656, 0, 1, 0.572549, 1,
-0.09949356, -1.056955, -5.503356, 0, 1, 0.5803922, 1,
-0.09732287, -0.03823389, -0.9566446, 0, 1, 0.5843138, 1,
-0.09679351, 0.05469874, -1.79069, 0, 1, 0.5921569, 1,
-0.09677349, -1.241022, -3.717124, 0, 1, 0.5960785, 1,
-0.09350432, 1.353027, -0.7879594, 0, 1, 0.6039216, 1,
-0.09238576, -1.624589, -1.759515, 0, 1, 0.6117647, 1,
-0.09221739, 0.3449371, -0.2711504, 0, 1, 0.6156863, 1,
-0.09097568, -0.4452599, -1.873706, 0, 1, 0.6235294, 1,
-0.09047992, -0.7644703, -4.621467, 0, 1, 0.627451, 1,
-0.08970388, -1.025331, -3.032553, 0, 1, 0.6352941, 1,
-0.0846737, 0.3908423, -1.114687, 0, 1, 0.6392157, 1,
-0.08443235, 0.7393909, 1.326716, 0, 1, 0.6470588, 1,
-0.08415093, 1.05618, 0.4332761, 0, 1, 0.6509804, 1,
-0.08371684, -0.300594, -2.669506, 0, 1, 0.6588235, 1,
-0.07899226, 0.8125718, -1.575253, 0, 1, 0.6627451, 1,
-0.07881769, -0.5209829, -2.194249, 0, 1, 0.6705883, 1,
-0.07848239, 0.4621108, 0.7548192, 0, 1, 0.6745098, 1,
-0.07479452, 0.586192, 1.026063, 0, 1, 0.682353, 1,
-0.06897331, 0.9753472, -0.6754702, 0, 1, 0.6862745, 1,
-0.06484778, -1.759074, -3.725589, 0, 1, 0.6941177, 1,
-0.05817375, 0.2270972, 0.110475, 0, 1, 0.7019608, 1,
-0.05309512, -0.3780221, -1.572155, 0, 1, 0.7058824, 1,
-0.0525698, -0.1900775, -2.872705, 0, 1, 0.7137255, 1,
-0.0467858, -1.079468, -3.828384, 0, 1, 0.7176471, 1,
-0.04663943, -1.023582, -2.159407, 0, 1, 0.7254902, 1,
-0.04534005, -1.271837, -3.547779, 0, 1, 0.7294118, 1,
-0.03870332, -1.809177, -2.147289, 0, 1, 0.7372549, 1,
-0.0366555, 0.3483673, 1.31569, 0, 1, 0.7411765, 1,
-0.03537297, 1.895718, 0.5983818, 0, 1, 0.7490196, 1,
-0.03428623, -0.8710788, -2.948329, 0, 1, 0.7529412, 1,
-0.03393224, -1.044082, -2.450105, 0, 1, 0.7607843, 1,
-0.03179241, -1.842443, -4.618154, 0, 1, 0.7647059, 1,
-0.03133791, -0.3762273, -3.19934, 0, 1, 0.772549, 1,
-0.03119647, 0.1558909, -1.771603, 0, 1, 0.7764706, 1,
-0.02895364, -0.07865737, -2.346003, 0, 1, 0.7843137, 1,
-0.02737559, 0.7354238, -0.218999, 0, 1, 0.7882353, 1,
-0.02101376, -0.1214116, -4.959991, 0, 1, 0.7960784, 1,
-0.02080854, 0.5459406, 0.2767325, 0, 1, 0.8039216, 1,
-0.01795826, 0.8446749, 0.1825489, 0, 1, 0.8078431, 1,
-0.01465781, -0.4796396, -3.901296, 0, 1, 0.8156863, 1,
-0.01407249, 0.7136614, -0.6376147, 0, 1, 0.8196079, 1,
-0.009781851, -1.635004, -4.019462, 0, 1, 0.827451, 1,
-0.008895917, 1.032572, -0.1394318, 0, 1, 0.8313726, 1,
-0.005747441, -0.06542541, -1.690663, 0, 1, 0.8392157, 1,
-0.004887628, -0.4366444, -3.002029, 0, 1, 0.8431373, 1,
-0.001753958, -0.4029503, -3.615055, 0, 1, 0.8509804, 1,
0.0005332014, 1.515989, 0.4400437, 0, 1, 0.854902, 1,
0.001771161, 0.1193266, -1.977219, 0, 1, 0.8627451, 1,
0.004231107, -0.682689, 3.099045, 0, 1, 0.8666667, 1,
0.004545266, 0.9905866, 0.3921732, 0, 1, 0.8745098, 1,
0.01125193, 0.007252196, 0.6004059, 0, 1, 0.8784314, 1,
0.0122431, 0.3583703, -0.3287248, 0, 1, 0.8862745, 1,
0.01358757, 0.963456, -1.161443, 0, 1, 0.8901961, 1,
0.01375203, 1.517911, -1.496807, 0, 1, 0.8980392, 1,
0.01453628, -0.07351071, 2.185044, 0, 1, 0.9058824, 1,
0.01462748, 1.066661, -0.9369935, 0, 1, 0.9098039, 1,
0.0150041, 1.291337, 2.686949, 0, 1, 0.9176471, 1,
0.02620192, -0.577688, 3.171476, 0, 1, 0.9215686, 1,
0.03302774, -0.121132, 3.190907, 0, 1, 0.9294118, 1,
0.03620645, 1.739521, -0.9002874, 0, 1, 0.9333333, 1,
0.04035426, 0.4361934, 1.42292, 0, 1, 0.9411765, 1,
0.04916547, -0.173475, 3.42792, 0, 1, 0.945098, 1,
0.05473575, -0.1114344, 3.335192, 0, 1, 0.9529412, 1,
0.05822043, 0.03231018, -0.627116, 0, 1, 0.9568627, 1,
0.0601678, -0.4666117, 3.383508, 0, 1, 0.9647059, 1,
0.0620595, 1.363162, -0.6727052, 0, 1, 0.9686275, 1,
0.06248122, -0.647678, 4.669823, 0, 1, 0.9764706, 1,
0.06279708, 1.738743, 1.679642, 0, 1, 0.9803922, 1,
0.0701327, -1.164293, 2.411518, 0, 1, 0.9882353, 1,
0.07159833, -0.7616465, 2.730532, 0, 1, 0.9921569, 1,
0.07252618, 0.4132759, -0.4067392, 0, 1, 1, 1,
0.07338356, -0.3865393, 2.045761, 0, 0.9921569, 1, 1,
0.07409788, 2.035183, -1.132068, 0, 0.9882353, 1, 1,
0.07964023, -0.9292223, 2.208511, 0, 0.9803922, 1, 1,
0.08532295, 0.8494322, -1.166884, 0, 0.9764706, 1, 1,
0.08542318, -0.1682661, 4.904367, 0, 0.9686275, 1, 1,
0.08734578, 0.6007708, -2.066059, 0, 0.9647059, 1, 1,
0.08915389, 0.08210117, 0.2557321, 0, 0.9568627, 1, 1,
0.08967341, 0.3278089, 0.6033384, 0, 0.9529412, 1, 1,
0.09171984, 1.671243, -0.9545758, 0, 0.945098, 1, 1,
0.09294994, -0.4841249, 3.770958, 0, 0.9411765, 1, 1,
0.09824187, 0.204311, -1.056033, 0, 0.9333333, 1, 1,
0.1000819, 1.359962, -0.7232268, 0, 0.9294118, 1, 1,
0.1049857, 0.5917645, -1.099861, 0, 0.9215686, 1, 1,
0.1077892, -0.7737519, 2.641553, 0, 0.9176471, 1, 1,
0.1102979, 1.112683, 0.4424467, 0, 0.9098039, 1, 1,
0.112985, -0.6877481, 1.755089, 0, 0.9058824, 1, 1,
0.1267291, -0.5619305, 2.432879, 0, 0.8980392, 1, 1,
0.1356637, -0.4356692, 4.139041, 0, 0.8901961, 1, 1,
0.1384514, -1.494659, 1.804509, 0, 0.8862745, 1, 1,
0.1387196, 0.239211, 0.803181, 0, 0.8784314, 1, 1,
0.1433542, -1.531235, 3.445364, 0, 0.8745098, 1, 1,
0.1459832, 0.4418706, 1.120685, 0, 0.8666667, 1, 1,
0.150268, 0.8506297, 0.3918835, 0, 0.8627451, 1, 1,
0.1511522, 0.3632248, 0.9272633, 0, 0.854902, 1, 1,
0.1561178, 0.111877, 1.566685, 0, 0.8509804, 1, 1,
0.1578963, -0.2977844, 0.6830516, 0, 0.8431373, 1, 1,
0.1579598, -0.4514559, 4.862061, 0, 0.8392157, 1, 1,
0.1607869, 1.003606, -0.3354488, 0, 0.8313726, 1, 1,
0.1637017, -0.9482585, 3.74486, 0, 0.827451, 1, 1,
0.1663285, -0.06941855, 2.134612, 0, 0.8196079, 1, 1,
0.1679905, 0.8726348, -0.8401088, 0, 0.8156863, 1, 1,
0.1712726, -0.4110894, 2.071934, 0, 0.8078431, 1, 1,
0.1714162, -0.5268803, 2.319943, 0, 0.8039216, 1, 1,
0.1722951, -0.3844594, 2.386659, 0, 0.7960784, 1, 1,
0.1750015, -0.5242593, 2.042703, 0, 0.7882353, 1, 1,
0.1760425, -0.6467847, 3.818644, 0, 0.7843137, 1, 1,
0.1812841, 0.1688165, 0.1469756, 0, 0.7764706, 1, 1,
0.1820194, 0.4236142, 1.155918, 0, 0.772549, 1, 1,
0.1824881, 1.35465, 0.08156303, 0, 0.7647059, 1, 1,
0.183619, -0.5942996, 1.520508, 0, 0.7607843, 1, 1,
0.1839852, 0.6512324, -0.3198563, 0, 0.7529412, 1, 1,
0.1949608, 0.7500286, -0.2560934, 0, 0.7490196, 1, 1,
0.1957407, 0.5511467, -1.115391, 0, 0.7411765, 1, 1,
0.1965538, -1.262321, 0.7699897, 0, 0.7372549, 1, 1,
0.1981642, -1.381129, 2.347161, 0, 0.7294118, 1, 1,
0.2080642, -1.239759, 4.215006, 0, 0.7254902, 1, 1,
0.2103832, 0.4125979, 0.479921, 0, 0.7176471, 1, 1,
0.2113803, -1.098683, 4.297884, 0, 0.7137255, 1, 1,
0.2123881, 0.1831436, 1.177249, 0, 0.7058824, 1, 1,
0.2149072, -0.5172022, 2.692875, 0, 0.6980392, 1, 1,
0.2161234, 0.1484078, 1.588828, 0, 0.6941177, 1, 1,
0.2221137, 0.4299434, -0.6170095, 0, 0.6862745, 1, 1,
0.2239835, -1.161007, 3.70433, 0, 0.682353, 1, 1,
0.2253551, -1.488661, 3.121444, 0, 0.6745098, 1, 1,
0.2274571, -1.480874, 4.278191, 0, 0.6705883, 1, 1,
0.2284976, 1.804653, 1.990596, 0, 0.6627451, 1, 1,
0.230044, -0.15709, 1.012233, 0, 0.6588235, 1, 1,
0.2313935, -0.3869981, 3.437613, 0, 0.6509804, 1, 1,
0.2338657, -0.5683325, 3.399048, 0, 0.6470588, 1, 1,
0.234399, -0.2768641, 3.340237, 0, 0.6392157, 1, 1,
0.2346258, -0.3761117, 1.697077, 0, 0.6352941, 1, 1,
0.2378469, 0.565339, 1.116532, 0, 0.627451, 1, 1,
0.2397876, -0.6771634, 3.202839, 0, 0.6235294, 1, 1,
0.2405399, 1.351309, -1.257154, 0, 0.6156863, 1, 1,
0.241405, -0.1363163, 2.320767, 0, 0.6117647, 1, 1,
0.2429658, -1.850801, 2.399855, 0, 0.6039216, 1, 1,
0.2441825, -0.1750086, 1.222526, 0, 0.5960785, 1, 1,
0.2453642, 0.4418679, 1.177128, 0, 0.5921569, 1, 1,
0.2480713, -0.01509736, 1.53372, 0, 0.5843138, 1, 1,
0.2497996, 0.5009613, 0.4030245, 0, 0.5803922, 1, 1,
0.2502065, 0.1679294, 0.9117689, 0, 0.572549, 1, 1,
0.2547072, -0.179464, 0.9063653, 0, 0.5686275, 1, 1,
0.2552519, 1.166193, 0.6536962, 0, 0.5607843, 1, 1,
0.2568763, 0.125203, 0.5888601, 0, 0.5568628, 1, 1,
0.2635736, 0.5170409, -0.08496033, 0, 0.5490196, 1, 1,
0.2733015, 0.09341628, 0.04692394, 0, 0.5450981, 1, 1,
0.2738553, -0.345177, 2.050241, 0, 0.5372549, 1, 1,
0.2753881, -1.910254, 2.127518, 0, 0.5333334, 1, 1,
0.2754277, -0.2143318, 2.293126, 0, 0.5254902, 1, 1,
0.2754425, -0.486185, 1.514006, 0, 0.5215687, 1, 1,
0.2765755, 0.1420598, 0.8631958, 0, 0.5137255, 1, 1,
0.2778899, 0.3908926, 2.537309, 0, 0.509804, 1, 1,
0.2848005, 1.116191, 0.1780961, 0, 0.5019608, 1, 1,
0.2856894, 0.77777, 1.02437, 0, 0.4941176, 1, 1,
0.2872615, 0.6929579, -0.2575985, 0, 0.4901961, 1, 1,
0.2874456, -1.035711, 3.129959, 0, 0.4823529, 1, 1,
0.2876984, -1.31805, 1.418023, 0, 0.4784314, 1, 1,
0.2891984, -1.092316, 3.442499, 0, 0.4705882, 1, 1,
0.292273, 0.9132159, -0.131642, 0, 0.4666667, 1, 1,
0.2923265, -1.679909, 2.556192, 0, 0.4588235, 1, 1,
0.2950178, -2.814192, 3.007502, 0, 0.454902, 1, 1,
0.2979162, 0.4902583, -0.1807144, 0, 0.4470588, 1, 1,
0.3005996, -1.677358, 3.26836, 0, 0.4431373, 1, 1,
0.3030118, -3.466809, 2.311878, 0, 0.4352941, 1, 1,
0.3145614, -0.4663744, 2.815095, 0, 0.4313726, 1, 1,
0.3153201, 1.445031, -0.7270196, 0, 0.4235294, 1, 1,
0.3190922, -2.690839, 3.972225, 0, 0.4196078, 1, 1,
0.3205319, 2.588483, -0.4251705, 0, 0.4117647, 1, 1,
0.3295531, 2.486794, -0.3622555, 0, 0.4078431, 1, 1,
0.3335961, 1.169412, 1.342353, 0, 0.4, 1, 1,
0.3377446, -1.026612, 3.296437, 0, 0.3921569, 1, 1,
0.3377982, 0.6975709, 1.859149, 0, 0.3882353, 1, 1,
0.3379351, -0.3068751, 3.09487, 0, 0.3803922, 1, 1,
0.33836, 1.447977, -0.002353876, 0, 0.3764706, 1, 1,
0.3392877, 0.6914914, -1.052871, 0, 0.3686275, 1, 1,
0.3439904, -2.234535, 3.864082, 0, 0.3647059, 1, 1,
0.3471897, 0.9495354, 2.461231, 0, 0.3568628, 1, 1,
0.3473747, -0.9258679, 0.6410423, 0, 0.3529412, 1, 1,
0.3517836, 0.416982, 0.8999869, 0, 0.345098, 1, 1,
0.3563835, -1.058954, 1.905309, 0, 0.3411765, 1, 1,
0.3564897, 0.7771261, -0.2111986, 0, 0.3333333, 1, 1,
0.3583919, 0.6116067, 1.38625, 0, 0.3294118, 1, 1,
0.3635263, -0.983785, 4.275461, 0, 0.3215686, 1, 1,
0.3662355, 0.2821526, 0.8411925, 0, 0.3176471, 1, 1,
0.3678013, 0.3826394, 0.5821717, 0, 0.3098039, 1, 1,
0.3684293, -0.01473241, 0.2661378, 0, 0.3058824, 1, 1,
0.3700704, 0.6419438, 1.267401, 0, 0.2980392, 1, 1,
0.3763764, -2.290314, 2.059034, 0, 0.2901961, 1, 1,
0.3773174, -0.36659, 2.840848, 0, 0.2862745, 1, 1,
0.3818666, 0.03319811, 0.5514906, 0, 0.2784314, 1, 1,
0.3828805, 1.379963, 0.4371101, 0, 0.2745098, 1, 1,
0.3836159, -0.0550464, 2.167156, 0, 0.2666667, 1, 1,
0.3859034, 1.726729, -0.9778318, 0, 0.2627451, 1, 1,
0.3881968, -1.37215, 2.970026, 0, 0.254902, 1, 1,
0.3887021, 0.01781371, 1.165239, 0, 0.2509804, 1, 1,
0.391615, -0.1940341, 3.248941, 0, 0.2431373, 1, 1,
0.3922682, 0.2569578, 1.107427, 0, 0.2392157, 1, 1,
0.3964926, -0.1866048, 2.734275, 0, 0.2313726, 1, 1,
0.4012051, 1.175141, 0.008817268, 0, 0.227451, 1, 1,
0.4020706, 0.1179508, 0.0211781, 0, 0.2196078, 1, 1,
0.4023278, -2.258657, 1.736697, 0, 0.2156863, 1, 1,
0.4035361, -0.6426861, 0.7283167, 0, 0.2078431, 1, 1,
0.40534, 0.3296367, 1.057475, 0, 0.2039216, 1, 1,
0.4091241, -1.490936, 3.498261, 0, 0.1960784, 1, 1,
0.4109368, -0.293265, 1.788175, 0, 0.1882353, 1, 1,
0.4128717, -1.179698, 3.651734, 0, 0.1843137, 1, 1,
0.4133727, 0.8996935, -0.6843549, 0, 0.1764706, 1, 1,
0.4137324, -0.01258137, 2.207495, 0, 0.172549, 1, 1,
0.4143833, 0.2138177, 0.5438648, 0, 0.1647059, 1, 1,
0.4148157, -0.01973179, 3.844822, 0, 0.1607843, 1, 1,
0.4224716, 0.8854085, 1.129012, 0, 0.1529412, 1, 1,
0.4229802, -0.6782182, 2.067819, 0, 0.1490196, 1, 1,
0.4263522, -0.2273057, 2.162996, 0, 0.1411765, 1, 1,
0.4296998, -1.021369, 2.379313, 0, 0.1372549, 1, 1,
0.4329531, -0.06821433, 1.247883, 0, 0.1294118, 1, 1,
0.436627, -0.09006551, 2.709063, 0, 0.1254902, 1, 1,
0.4367984, 0.8249612, 0.08333758, 0, 0.1176471, 1, 1,
0.4384959, 1.364125, 2.551573, 0, 0.1137255, 1, 1,
0.44097, -1.192144, 4.377267, 0, 0.1058824, 1, 1,
0.4442174, 1.033572, 0.07408059, 0, 0.09803922, 1, 1,
0.4470567, -1.070768, 3.485255, 0, 0.09411765, 1, 1,
0.447833, -0.02334831, 1.409443, 0, 0.08627451, 1, 1,
0.4593389, 1.766056, -0.9134292, 0, 0.08235294, 1, 1,
0.4597442, 0.1064581, 1.902934, 0, 0.07450981, 1, 1,
0.4605337, -0.4466185, 2.271047, 0, 0.07058824, 1, 1,
0.4608389, -0.9717595, 3.119817, 0, 0.0627451, 1, 1,
0.4810217, 0.2256831, 0.4548852, 0, 0.05882353, 1, 1,
0.4834701, -1.74213, 2.847753, 0, 0.05098039, 1, 1,
0.4837443, -0.1401568, 2.068758, 0, 0.04705882, 1, 1,
0.4839857, 0.6506873, 0.892705, 0, 0.03921569, 1, 1,
0.4876851, 0.8386854, -0.522715, 0, 0.03529412, 1, 1,
0.4923633, 0.3227813, -0.2808901, 0, 0.02745098, 1, 1,
0.4978369, 0.243413, 1.748769, 0, 0.02352941, 1, 1,
0.4989847, -0.5728297, 1.715896, 0, 0.01568628, 1, 1,
0.50791, 0.4582812, -0.6201438, 0, 0.01176471, 1, 1,
0.5088835, -0.8178219, 2.617555, 0, 0.003921569, 1, 1,
0.5088881, -1.439861, 3.592798, 0.003921569, 0, 1, 1,
0.5091481, -0.2480391, 2.486787, 0.007843138, 0, 1, 1,
0.512239, 0.8287019, 1.339842, 0.01568628, 0, 1, 1,
0.5162857, -0.2368431, 1.785737, 0.01960784, 0, 1, 1,
0.5170155, -1.239781, 2.432476, 0.02745098, 0, 1, 1,
0.5183052, 0.2180976, -0.480105, 0.03137255, 0, 1, 1,
0.526096, -0.7097756, 1.211111, 0.03921569, 0, 1, 1,
0.5270882, -0.9871905, 3.010928, 0.04313726, 0, 1, 1,
0.529498, -0.4541957, 2.279473, 0.05098039, 0, 1, 1,
0.5299962, 0.03108226, 1.187132, 0.05490196, 0, 1, 1,
0.5306291, -1.134064, 4.6507, 0.0627451, 0, 1, 1,
0.5352112, 1.577559, 1.689025, 0.06666667, 0, 1, 1,
0.536453, 0.1378934, 0.7662524, 0.07450981, 0, 1, 1,
0.5385404, -1.502854, 3.178866, 0.07843138, 0, 1, 1,
0.5402365, 1.498757, 0.413558, 0.08627451, 0, 1, 1,
0.5413013, 0.345338, 1.808928, 0.09019608, 0, 1, 1,
0.5418987, 0.8845088, 0.8057185, 0.09803922, 0, 1, 1,
0.5436823, 0.1197661, 0.8153951, 0.1058824, 0, 1, 1,
0.5446438, -0.6953748, 1.694571, 0.1098039, 0, 1, 1,
0.5452186, 1.20862, 0.8423724, 0.1176471, 0, 1, 1,
0.5452969, -2.013, 2.068088, 0.1215686, 0, 1, 1,
0.5459754, 1.107839, -0.7814536, 0.1294118, 0, 1, 1,
0.547023, -2.009948, 4.301279, 0.1333333, 0, 1, 1,
0.5543764, 1.947235, 0.6581016, 0.1411765, 0, 1, 1,
0.5550979, 0.007078193, 2.886696, 0.145098, 0, 1, 1,
0.5561252, 0.1703087, 1.929433, 0.1529412, 0, 1, 1,
0.5574216, -0.03016503, 2.751685, 0.1568628, 0, 1, 1,
0.5595411, -0.2209883, 3.643879, 0.1647059, 0, 1, 1,
0.5606419, 2.050165, 0.8092875, 0.1686275, 0, 1, 1,
0.565946, 0.9106822, 2.162425, 0.1764706, 0, 1, 1,
0.566107, 0.4966062, 1.341121, 0.1803922, 0, 1, 1,
0.5684921, 0.4284576, 0.1994186, 0.1882353, 0, 1, 1,
0.5694085, 0.01920141, 1.36027, 0.1921569, 0, 1, 1,
0.5744612, 0.5412216, 0.3481181, 0.2, 0, 1, 1,
0.5750743, 1.378802, -0.3587665, 0.2078431, 0, 1, 1,
0.5788735, -0.764183, 0.8545322, 0.2117647, 0, 1, 1,
0.5810533, -0.1690616, 2.039877, 0.2196078, 0, 1, 1,
0.5821034, 0.9851298, 0.253732, 0.2235294, 0, 1, 1,
0.5830557, 0.3947124, 0.8637176, 0.2313726, 0, 1, 1,
0.5894077, -0.0589744, 2.212668, 0.2352941, 0, 1, 1,
0.5917086, 0.3857155, 2.256231, 0.2431373, 0, 1, 1,
0.5960152, -0.655615, 4.32182, 0.2470588, 0, 1, 1,
0.5971161, 1.040905, 0.6809015, 0.254902, 0, 1, 1,
0.6117735, -1.032714, 2.220638, 0.2588235, 0, 1, 1,
0.6123849, 1.292457, 1.120554, 0.2666667, 0, 1, 1,
0.6146863, 0.7754898, 1.536071, 0.2705882, 0, 1, 1,
0.6160681, -2.228255, 0.08679212, 0.2784314, 0, 1, 1,
0.6187561, 0.3825283, 1.137512, 0.282353, 0, 1, 1,
0.6218135, -0.5309137, -0.6389657, 0.2901961, 0, 1, 1,
0.6220546, 0.5413919, 1.823644, 0.2941177, 0, 1, 1,
0.6222504, -0.9958541, 4.068097, 0.3019608, 0, 1, 1,
0.6229168, -1.785749, 1.775011, 0.3098039, 0, 1, 1,
0.6241485, -0.8438659, 2.724624, 0.3137255, 0, 1, 1,
0.625288, 0.3899421, 0.2854661, 0.3215686, 0, 1, 1,
0.6282431, -0.1337896, 2.300307, 0.3254902, 0, 1, 1,
0.6383833, 2.359086, -0.5631027, 0.3333333, 0, 1, 1,
0.6428369, -0.0009023563, 2.381061, 0.3372549, 0, 1, 1,
0.6454319, 2.160897, -1.014136, 0.345098, 0, 1, 1,
0.6482889, 0.6453699, 1.143598, 0.3490196, 0, 1, 1,
0.6524947, 0.3192788, 1.786165, 0.3568628, 0, 1, 1,
0.6553444, 0.842733, 1.094126, 0.3607843, 0, 1, 1,
0.6557619, -0.2721854, 0.7478726, 0.3686275, 0, 1, 1,
0.658164, 0.581697, 2.811733, 0.372549, 0, 1, 1,
0.6697639, -0.175189, 3.076557, 0.3803922, 0, 1, 1,
0.6704137, 0.004605294, 1.068972, 0.3843137, 0, 1, 1,
0.6846796, -0.9664368, 4.678839, 0.3921569, 0, 1, 1,
0.6876221, -0.6413729, 2.081279, 0.3960784, 0, 1, 1,
0.6898997, 1.340417, 0.9612606, 0.4039216, 0, 1, 1,
0.6899057, -0.7656907, 3.771833, 0.4117647, 0, 1, 1,
0.6929049, -0.288794, 3.167938, 0.4156863, 0, 1, 1,
0.6973246, -0.3961391, 2.037313, 0.4235294, 0, 1, 1,
0.7007336, 0.3222711, 2.24335, 0.427451, 0, 1, 1,
0.7051692, 2.070747, -0.660909, 0.4352941, 0, 1, 1,
0.7065052, 0.3064119, -0.244219, 0.4392157, 0, 1, 1,
0.7073123, 0.3793823, 1.147024, 0.4470588, 0, 1, 1,
0.7082763, 1.849588, -0.5869396, 0.4509804, 0, 1, 1,
0.7189891, -0.4517302, 4.480941, 0.4588235, 0, 1, 1,
0.7198793, 1.181663, 0.1129614, 0.4627451, 0, 1, 1,
0.7222683, 1.81331, -0.939078, 0.4705882, 0, 1, 1,
0.723522, 0.1605388, 1.100469, 0.4745098, 0, 1, 1,
0.7277533, -0.9257762, 2.651408, 0.4823529, 0, 1, 1,
0.7323769, -1.364763, 3.023028, 0.4862745, 0, 1, 1,
0.7330181, 0.9948462, 1.471409, 0.4941176, 0, 1, 1,
0.7360166, 1.008599, 2.250836, 0.5019608, 0, 1, 1,
0.738296, 0.5242434, 2.629962, 0.5058824, 0, 1, 1,
0.7384323, -0.3694593, 1.630341, 0.5137255, 0, 1, 1,
0.7439456, 1.198197, 1.720698, 0.5176471, 0, 1, 1,
0.7479942, 0.2187281, 1.166432, 0.5254902, 0, 1, 1,
0.7499698, 0.3834603, 0.5838555, 0.5294118, 0, 1, 1,
0.752867, -1.004341, 2.396048, 0.5372549, 0, 1, 1,
0.754999, 0.1585744, 2.323684, 0.5411765, 0, 1, 1,
0.7554107, -0.6494566, 3.517541, 0.5490196, 0, 1, 1,
0.7560252, 1.220119, -1.161634, 0.5529412, 0, 1, 1,
0.7567388, -0.02305365, 1.519247, 0.5607843, 0, 1, 1,
0.7628967, -1.34872, 4.231642, 0.5647059, 0, 1, 1,
0.7652661, -1.346837, 1.074403, 0.572549, 0, 1, 1,
0.7657942, -1.758417, 2.451568, 0.5764706, 0, 1, 1,
0.7666115, 0.7062893, 0.6011227, 0.5843138, 0, 1, 1,
0.7703655, -0.6525801, 2.257505, 0.5882353, 0, 1, 1,
0.7719607, 0.8649694, 1.941462, 0.5960785, 0, 1, 1,
0.772675, -0.6232147, 3.844354, 0.6039216, 0, 1, 1,
0.7760522, -0.9093171, 3.884131, 0.6078432, 0, 1, 1,
0.7844043, 1.787504, 0.5499268, 0.6156863, 0, 1, 1,
0.7907612, 0.9134657, 0.08974113, 0.6196079, 0, 1, 1,
0.7913445, 0.1073282, 1.850456, 0.627451, 0, 1, 1,
0.7942456, -0.1311457, 3.620584, 0.6313726, 0, 1, 1,
0.7986868, -0.8633555, 2.361326, 0.6392157, 0, 1, 1,
0.7988098, -0.3518691, 1.834805, 0.6431373, 0, 1, 1,
0.7994168, 1.813908, -0.4429112, 0.6509804, 0, 1, 1,
0.7999689, -0.04221983, 0.8946924, 0.654902, 0, 1, 1,
0.8017703, -1.112713, 5.672687, 0.6627451, 0, 1, 1,
0.802792, 1.662598, 0.1657335, 0.6666667, 0, 1, 1,
0.8053052, 0.974988, 2.255035, 0.6745098, 0, 1, 1,
0.8115789, -0.09361716, 3.313287, 0.6784314, 0, 1, 1,
0.8141921, 0.06029205, -0.2799425, 0.6862745, 0, 1, 1,
0.8172904, 2.046545, -0.8475574, 0.6901961, 0, 1, 1,
0.8207072, -0.8795041, 2.681943, 0.6980392, 0, 1, 1,
0.8210471, 0.5504991, 0.02068478, 0.7058824, 0, 1, 1,
0.8217312, -0.2887042, -0.367885, 0.7098039, 0, 1, 1,
0.822013, -1.565551, 4.852101, 0.7176471, 0, 1, 1,
0.8318194, 0.9867281, 0.09515151, 0.7215686, 0, 1, 1,
0.836272, 0.1181281, 2.56355, 0.7294118, 0, 1, 1,
0.8426951, -1.071109, 2.200705, 0.7333333, 0, 1, 1,
0.8470887, -0.251212, 2.779544, 0.7411765, 0, 1, 1,
0.8496991, -1.065387, 1.761348, 0.7450981, 0, 1, 1,
0.8532403, -1.718667, 3.225196, 0.7529412, 0, 1, 1,
0.8550205, 0.01176124, 2.397669, 0.7568628, 0, 1, 1,
0.8584227, -1.390916, 2.988673, 0.7647059, 0, 1, 1,
0.8615606, 1.615741, 0.3364306, 0.7686275, 0, 1, 1,
0.8637528, 1.047003, 0.5574773, 0.7764706, 0, 1, 1,
0.8638547, 1.254355, 1.500901, 0.7803922, 0, 1, 1,
0.8672909, -0.5777944, 1.272425, 0.7882353, 0, 1, 1,
0.8702018, -1.024038, 3.59068, 0.7921569, 0, 1, 1,
0.8704257, -0.5473318, 1.228071, 0.8, 0, 1, 1,
0.8759272, -0.5281745, 2.427208, 0.8078431, 0, 1, 1,
0.8826892, 1.177534, 0.8988983, 0.8117647, 0, 1, 1,
0.8872421, -1.137109, 4.125304, 0.8196079, 0, 1, 1,
0.8876265, -1.614585, 2.210118, 0.8235294, 0, 1, 1,
0.8948529, -0.1098446, 1.506469, 0.8313726, 0, 1, 1,
0.8949229, 0.684989, 1.119207, 0.8352941, 0, 1, 1,
0.8977628, -0.2977945, 0.450857, 0.8431373, 0, 1, 1,
0.9045959, -0.6083359, 2.25785, 0.8470588, 0, 1, 1,
0.9050093, 0.7936625, 0.3572647, 0.854902, 0, 1, 1,
0.9059169, -1.154092, 3.580723, 0.8588235, 0, 1, 1,
0.9075398, 0.7089342, -0.3329393, 0.8666667, 0, 1, 1,
0.9116201, 0.07615513, 3.385655, 0.8705882, 0, 1, 1,
0.9126048, 1.183089, 0.01026483, 0.8784314, 0, 1, 1,
0.9184148, 0.5028935, 2.239878, 0.8823529, 0, 1, 1,
0.9233893, -0.3728854, 1.546355, 0.8901961, 0, 1, 1,
0.9286357, 0.6259328, 2.720938, 0.8941177, 0, 1, 1,
0.9318098, 0.1388603, 1.914429, 0.9019608, 0, 1, 1,
0.9367547, -0.3075218, 3.047307, 0.9098039, 0, 1, 1,
0.9374076, 0.4184352, -0.1923859, 0.9137255, 0, 1, 1,
0.9452417, -1.505475, 1.806684, 0.9215686, 0, 1, 1,
0.9453271, -0.1111684, 2.097263, 0.9254902, 0, 1, 1,
0.9535425, 0.8283732, 1.075826, 0.9333333, 0, 1, 1,
0.9539835, 0.508652, 1.812515, 0.9372549, 0, 1, 1,
0.9543459, -1.106134, 2.590911, 0.945098, 0, 1, 1,
0.9545776, 1.404435, 2.516028, 0.9490196, 0, 1, 1,
0.9567468, -0.04989557, 1.351622, 0.9568627, 0, 1, 1,
0.9579025, 0.2358532, 0.8926741, 0.9607843, 0, 1, 1,
0.9592155, 0.7955847, 0.1287764, 0.9686275, 0, 1, 1,
0.9602381, -0.8494229, 1.268269, 0.972549, 0, 1, 1,
0.9653144, -1.988176, 3.567724, 0.9803922, 0, 1, 1,
0.9690469, -0.9107162, 2.014398, 0.9843137, 0, 1, 1,
0.9712706, 1.374097, 0.4042577, 0.9921569, 0, 1, 1,
0.9720119, -1.102498, 3.472213, 0.9960784, 0, 1, 1,
0.9760148, 1.674466, 0.2057015, 1, 0, 0.9960784, 1,
0.9773321, -2.084097, 2.121313, 1, 0, 0.9882353, 1,
0.9819953, 0.3811363, 2.375538, 1, 0, 0.9843137, 1,
0.9888589, -1.561226, 2.7786, 1, 0, 0.9764706, 1,
0.9914141, 0.9250836, 1.318759, 1, 0, 0.972549, 1,
0.9935392, 0.4195056, 0.5970548, 1, 0, 0.9647059, 1,
0.995184, 1.268445, 0.216427, 1, 0, 0.9607843, 1,
0.9973403, 1.128884, 0.2394891, 1, 0, 0.9529412, 1,
0.9975701, -0.4968687, 2.588016, 1, 0, 0.9490196, 1,
0.9979454, 1.399827, -0.7146868, 1, 0, 0.9411765, 1,
1.015419, -0.1910544, 1.879969, 1, 0, 0.9372549, 1,
1.024975, 0.5776141, 1.490313, 1, 0, 0.9294118, 1,
1.02936, -1.539291, 2.617354, 1, 0, 0.9254902, 1,
1.032978, -0.1435565, 0.7925163, 1, 0, 0.9176471, 1,
1.038316, 3.719164, -0.2341952, 1, 0, 0.9137255, 1,
1.038674, -0.3193713, 2.92887, 1, 0, 0.9058824, 1,
1.040154, -0.04592787, 2.137399, 1, 0, 0.9019608, 1,
1.041504, 0.264906, -0.7768359, 1, 0, 0.8941177, 1,
1.045013, -0.5034566, 2.35305, 1, 0, 0.8862745, 1,
1.054755, 0.2435379, 0.5916883, 1, 0, 0.8823529, 1,
1.055346, 1.111561, 0.8915193, 1, 0, 0.8745098, 1,
1.059144, 0.6404395, 1.248387, 1, 0, 0.8705882, 1,
1.05922, -0.9996722, 1.678497, 1, 0, 0.8627451, 1,
1.06521, -0.2316653, 2.210907, 1, 0, 0.8588235, 1,
1.072701, -0.7408499, 1.823341, 1, 0, 0.8509804, 1,
1.074266, -0.9732317, 3.842403, 1, 0, 0.8470588, 1,
1.076168, 0.1859552, 0.8076627, 1, 0, 0.8392157, 1,
1.081466, 1.29943, 1.433233, 1, 0, 0.8352941, 1,
1.082542, -0.7631552, 3.468434, 1, 0, 0.827451, 1,
1.088335, 1.226108, -0.1142262, 1, 0, 0.8235294, 1,
1.089995, 0.703491, 2.256264, 1, 0, 0.8156863, 1,
1.117931, 1.04159, 2.193359, 1, 0, 0.8117647, 1,
1.119139, -0.2450798, 0.9902139, 1, 0, 0.8039216, 1,
1.122542, 1.139982, -1.881043, 1, 0, 0.7960784, 1,
1.125441, -0.45128, 0.8440213, 1, 0, 0.7921569, 1,
1.127568, 1.482078, 0.1149513, 1, 0, 0.7843137, 1,
1.129487, -0.4416941, 0.4100861, 1, 0, 0.7803922, 1,
1.138834, -0.7882782, 3.467439, 1, 0, 0.772549, 1,
1.140975, 0.3360428, 2.136648, 1, 0, 0.7686275, 1,
1.146259, -1.109157, 2.192366, 1, 0, 0.7607843, 1,
1.154274, -0.7664304, 3.663343, 1, 0, 0.7568628, 1,
1.163294, 1.692095, 0.9265493, 1, 0, 0.7490196, 1,
1.17425, 0.2916311, 2.901961, 1, 0, 0.7450981, 1,
1.176024, -0.4346997, 1.266595, 1, 0, 0.7372549, 1,
1.178661, 1.508707, 2.415883, 1, 0, 0.7333333, 1,
1.17878, 1.159992, 1.557326, 1, 0, 0.7254902, 1,
1.183215, -1.214465, 3.298019, 1, 0, 0.7215686, 1,
1.183967, -0.9885763, 2.785774, 1, 0, 0.7137255, 1,
1.185481, 1.744531, 0.1993552, 1, 0, 0.7098039, 1,
1.190307, 0.6962187, 0.02271891, 1, 0, 0.7019608, 1,
1.192501, -0.627282, 3.459245, 1, 0, 0.6941177, 1,
1.203702, 0.5608819, 1.264335, 1, 0, 0.6901961, 1,
1.219657, 0.5213636, 1.541598, 1, 0, 0.682353, 1,
1.22948, 0.02854434, 0.7683717, 1, 0, 0.6784314, 1,
1.233233, 3.221654, 0.9252399, 1, 0, 0.6705883, 1,
1.236457, 1.183985, 2.982616, 1, 0, 0.6666667, 1,
1.25317, 0.712741, 1.086978, 1, 0, 0.6588235, 1,
1.27063, 1.93127, 0.3990278, 1, 0, 0.654902, 1,
1.27097, -0.1568806, 1.536214, 1, 0, 0.6470588, 1,
1.271983, -1.125351, 2.396854, 1, 0, 0.6431373, 1,
1.27202, 0.6180063, -0.262062, 1, 0, 0.6352941, 1,
1.274001, -0.01709209, 2.086097, 1, 0, 0.6313726, 1,
1.27608, 0.1247572, 1.943118, 1, 0, 0.6235294, 1,
1.29455, 1.144893, 1.080926, 1, 0, 0.6196079, 1,
1.297429, -0.5027115, 0.3316978, 1, 0, 0.6117647, 1,
1.300181, 0.3924472, 0.6531287, 1, 0, 0.6078432, 1,
1.30125, 0.2254697, 1.157497, 1, 0, 0.6, 1,
1.308827, 0.6510618, 0.2814023, 1, 0, 0.5921569, 1,
1.319864, -0.1702726, 3.380306, 1, 0, 0.5882353, 1,
1.326339, 0.9283567, 1.068109, 1, 0, 0.5803922, 1,
1.326428, 1.040305, -0.7302927, 1, 0, 0.5764706, 1,
1.346005, -0.2555486, 1.716604, 1, 0, 0.5686275, 1,
1.375152, 0.1604203, 0.452542, 1, 0, 0.5647059, 1,
1.378952, -0.002909187, -0.4523921, 1, 0, 0.5568628, 1,
1.382501, -0.964069, 1.868571, 1, 0, 0.5529412, 1,
1.392762, -0.09255147, 2.974415, 1, 0, 0.5450981, 1,
1.393459, -0.8089378, 2.823442, 1, 0, 0.5411765, 1,
1.396102, 1.502194, 0.7139643, 1, 0, 0.5333334, 1,
1.398239, -0.4638734, 1.386687, 1, 0, 0.5294118, 1,
1.402651, 0.3581714, 1.046667, 1, 0, 0.5215687, 1,
1.412447, -0.6459028, 1.817556, 1, 0, 0.5176471, 1,
1.414818, 0.2425198, 1.86861, 1, 0, 0.509804, 1,
1.419487, 0.53299, 1.621982, 1, 0, 0.5058824, 1,
1.437937, -1.100651, 2.540431, 1, 0, 0.4980392, 1,
1.443, 0.2463803, -0.0169776, 1, 0, 0.4901961, 1,
1.443435, -0.3707545, 3.353267, 1, 0, 0.4862745, 1,
1.446599, -0.5311625, 1.782003, 1, 0, 0.4784314, 1,
1.461816, 1.38395, 0.6532764, 1, 0, 0.4745098, 1,
1.465583, 1.78509, 0.3498763, 1, 0, 0.4666667, 1,
1.468702, -2.740754, 2.808096, 1, 0, 0.4627451, 1,
1.471278, 1.571961, 0.459787, 1, 0, 0.454902, 1,
1.478867, -0.9601886, 1.54713, 1, 0, 0.4509804, 1,
1.480442, 0.2882052, 2.478382, 1, 0, 0.4431373, 1,
1.482754, 0.7273708, 1.922551, 1, 0, 0.4392157, 1,
1.489866, -0.4355507, 2.184452, 1, 0, 0.4313726, 1,
1.506691, 0.5280885, -0.1246363, 1, 0, 0.427451, 1,
1.508606, -0.8785087, 2.553868, 1, 0, 0.4196078, 1,
1.50998, 0.6697468, 0.4407912, 1, 0, 0.4156863, 1,
1.513985, 0.9674519, 1.782105, 1, 0, 0.4078431, 1,
1.523266, -0.5747758, 1.119794, 1, 0, 0.4039216, 1,
1.524887, -0.1786865, 2.734857, 1, 0, 0.3960784, 1,
1.526882, 0.2235618, 0.4616183, 1, 0, 0.3882353, 1,
1.53454, 0.1822255, 0.9008968, 1, 0, 0.3843137, 1,
1.554502, -0.2193614, 4.314542, 1, 0, 0.3764706, 1,
1.557992, -0.525001, 3.418986, 1, 0, 0.372549, 1,
1.560437, 0.8831016, 0.799594, 1, 0, 0.3647059, 1,
1.569592, 0.1564424, 3.411685, 1, 0, 0.3607843, 1,
1.575766, 2.328756, 0.6721367, 1, 0, 0.3529412, 1,
1.575979, 0.1676935, 1.605241, 1, 0, 0.3490196, 1,
1.577584, 0.1974534, 3.126011, 1, 0, 0.3411765, 1,
1.585865, -0.4851731, 2.94201, 1, 0, 0.3372549, 1,
1.591439, 1.13706, 2.99085, 1, 0, 0.3294118, 1,
1.592663, -0.4258547, 2.221336, 1, 0, 0.3254902, 1,
1.596585, -1.000894, 2.080092, 1, 0, 0.3176471, 1,
1.596973, -1.509333, 0.7544358, 1, 0, 0.3137255, 1,
1.613743, 1.793814, 0.2379627, 1, 0, 0.3058824, 1,
1.619335, -0.2436687, -0.2169096, 1, 0, 0.2980392, 1,
1.627409, -0.2190925, 0.7220582, 1, 0, 0.2941177, 1,
1.638191, -0.7394025, -1.044847, 1, 0, 0.2862745, 1,
1.657284, 0.6326685, 2.121686, 1, 0, 0.282353, 1,
1.668682, 1.317133, 0.3247678, 1, 0, 0.2745098, 1,
1.669197, 2.193802, 1.696718, 1, 0, 0.2705882, 1,
1.675435, 0.5895851, 2.408046, 1, 0, 0.2627451, 1,
1.731226, -0.01653664, 2.897364, 1, 0, 0.2588235, 1,
1.73821, 0.8576664, 2.273124, 1, 0, 0.2509804, 1,
1.748571, 1.039656, 0.6750466, 1, 0, 0.2470588, 1,
1.754997, 0.08799219, -0.2378866, 1, 0, 0.2392157, 1,
1.782423, 1.424486, 1.230398, 1, 0, 0.2352941, 1,
1.796692, -0.04728737, 1.5322, 1, 0, 0.227451, 1,
1.823204, -1.02716, 1.77501, 1, 0, 0.2235294, 1,
1.831607, -0.3686505, 0.6614233, 1, 0, 0.2156863, 1,
1.854291, 0.0514482, 1.87057, 1, 0, 0.2117647, 1,
1.854631, -0.5109336, 1.058811, 1, 0, 0.2039216, 1,
1.860669, -0.6221087, 1.37443, 1, 0, 0.1960784, 1,
1.865065, 0.4939164, 1.670648, 1, 0, 0.1921569, 1,
1.874016, -0.2541362, 1.298324, 1, 0, 0.1843137, 1,
1.895663, -0.3074693, 0.4130345, 1, 0, 0.1803922, 1,
1.912285, 0.39219, 0.2293395, 1, 0, 0.172549, 1,
1.932957, 0.9056195, 2.086661, 1, 0, 0.1686275, 1,
1.938355, -1.075517, -0.0719249, 1, 0, 0.1607843, 1,
1.946984, 1.216308, 0.6426119, 1, 0, 0.1568628, 1,
1.967064, -2.389973, 3.706364, 1, 0, 0.1490196, 1,
2.000583, 1.814259, 1.632881, 1, 0, 0.145098, 1,
2.002264, 0.8374234, 1.491855, 1, 0, 0.1372549, 1,
2.021816, -0.7916569, 2.232462, 1, 0, 0.1333333, 1,
2.040761, -0.9949133, 0.1330625, 1, 0, 0.1254902, 1,
2.067038, -1.680302, 3.467233, 1, 0, 0.1215686, 1,
2.09217, 0.4587306, 1.254247, 1, 0, 0.1137255, 1,
2.101548, -0.1886117, 2.597671, 1, 0, 0.1098039, 1,
2.170721, 0.2170676, 1.733825, 1, 0, 0.1019608, 1,
2.173439, -0.8465527, 1.83432, 1, 0, 0.09411765, 1,
2.244846, -0.3680509, 1.384677, 1, 0, 0.09019608, 1,
2.297382, -0.4850872, 2.884944, 1, 0, 0.08235294, 1,
2.299355, -0.1645798, 4.224106, 1, 0, 0.07843138, 1,
2.316185, 1.006006, 0.3508607, 1, 0, 0.07058824, 1,
2.318775, -3.178887, 2.804146, 1, 0, 0.06666667, 1,
2.370348, 0.4058191, -1.020915, 1, 0, 0.05882353, 1,
2.388671, 0.2042881, 0.3372298, 1, 0, 0.05490196, 1,
2.478252, 0.5267048, 0.3854334, 1, 0, 0.04705882, 1,
2.583301, 0.5774156, 1.946853, 1, 0, 0.04313726, 1,
2.691839, -0.5845975, 1.898397, 1, 0, 0.03529412, 1,
2.70361, 0.3122228, 1.998427, 1, 0, 0.03137255, 1,
2.766659, -0.1395465, 0.456001, 1, 0, 0.02352941, 1,
2.877925, 0.06851428, 2.440799, 1, 0, 0.01960784, 1,
2.898318, -0.009926294, 1.804293, 1, 0, 0.01176471, 1,
3.807562, 0.2076733, 2.437228, 1, 0, 0.007843138, 1
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
0.3631817, -4.684831, -7.508841, 0, -0.5, 0.5, 0.5,
0.3631817, -4.684831, -7.508841, 1, -0.5, 0.5, 0.5,
0.3631817, -4.684831, -7.508841, 1, 1.5, 0.5, 0.5,
0.3631817, -4.684831, -7.508841, 0, 1.5, 0.5, 0.5
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
-4.248843, 0.1261777, -7.508841, 0, -0.5, 0.5, 0.5,
-4.248843, 0.1261777, -7.508841, 1, -0.5, 0.5, 0.5,
-4.248843, 0.1261777, -7.508841, 1, 1.5, 0.5, 0.5,
-4.248843, 0.1261777, -7.508841, 0, 1.5, 0.5, 0.5
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
-4.248843, -4.684831, 0.03714681, 0, -0.5, 0.5, 0.5,
-4.248843, -4.684831, 0.03714681, 1, -0.5, 0.5, 0.5,
-4.248843, -4.684831, 0.03714681, 1, 1.5, 0.5, 0.5,
-4.248843, -4.684831, 0.03714681, 0, 1.5, 0.5, 0.5
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
-3, -3.574598, -5.767459,
3, -3.574598, -5.767459,
-3, -3.574598, -5.767459,
-3, -3.759637, -6.05769,
-2, -3.574598, -5.767459,
-2, -3.759637, -6.05769,
-1, -3.574598, -5.767459,
-1, -3.759637, -6.05769,
0, -3.574598, -5.767459,
0, -3.759637, -6.05769,
1, -3.574598, -5.767459,
1, -3.759637, -6.05769,
2, -3.574598, -5.767459,
2, -3.759637, -6.05769,
3, -3.574598, -5.767459,
3, -3.759637, -6.05769
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
-3, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
-3, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
-3, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
-3, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
-2, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
-2, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
-2, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
-2, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
-1, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
-1, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
-1, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
-1, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
0, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
0, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
0, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
0, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
1, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
1, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
1, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
1, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
2, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
2, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
2, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
2, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5,
3, -4.129714, -6.63815, 0, -0.5, 0.5, 0.5,
3, -4.129714, -6.63815, 1, -0.5, 0.5, 0.5,
3, -4.129714, -6.63815, 1, 1.5, 0.5, 0.5,
3, -4.129714, -6.63815, 0, 1.5, 0.5, 0.5
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
-3.18453, -2, -5.767459,
-3.18453, 2, -5.767459,
-3.18453, -2, -5.767459,
-3.361915, -2, -6.05769,
-3.18453, 0, -5.767459,
-3.361915, 0, -6.05769,
-3.18453, 2, -5.767459,
-3.361915, 2, -6.05769
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
-3.716686, -2, -6.63815, 0, -0.5, 0.5, 0.5,
-3.716686, -2, -6.63815, 1, -0.5, 0.5, 0.5,
-3.716686, -2, -6.63815, 1, 1.5, 0.5, 0.5,
-3.716686, -2, -6.63815, 0, 1.5, 0.5, 0.5,
-3.716686, 0, -6.63815, 0, -0.5, 0.5, 0.5,
-3.716686, 0, -6.63815, 1, -0.5, 0.5, 0.5,
-3.716686, 0, -6.63815, 1, 1.5, 0.5, 0.5,
-3.716686, 0, -6.63815, 0, 1.5, 0.5, 0.5,
-3.716686, 2, -6.63815, 0, -0.5, 0.5, 0.5,
-3.716686, 2, -6.63815, 1, -0.5, 0.5, 0.5,
-3.716686, 2, -6.63815, 1, 1.5, 0.5, 0.5,
-3.716686, 2, -6.63815, 0, 1.5, 0.5, 0.5
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
-3.18453, -3.574598, -4,
-3.18453, -3.574598, 4,
-3.18453, -3.574598, -4,
-3.361915, -3.759637, -4,
-3.18453, -3.574598, -2,
-3.361915, -3.759637, -2,
-3.18453, -3.574598, 0,
-3.361915, -3.759637, 0,
-3.18453, -3.574598, 2,
-3.361915, -3.759637, 2,
-3.18453, -3.574598, 4,
-3.361915, -3.759637, 4
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
-3.716686, -4.129714, -4, 0, -0.5, 0.5, 0.5,
-3.716686, -4.129714, -4, 1, -0.5, 0.5, 0.5,
-3.716686, -4.129714, -4, 1, 1.5, 0.5, 0.5,
-3.716686, -4.129714, -4, 0, 1.5, 0.5, 0.5,
-3.716686, -4.129714, -2, 0, -0.5, 0.5, 0.5,
-3.716686, -4.129714, -2, 1, -0.5, 0.5, 0.5,
-3.716686, -4.129714, -2, 1, 1.5, 0.5, 0.5,
-3.716686, -4.129714, -2, 0, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 0, 0, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 0, 1, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 0, 1, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 0, 0, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 2, 0, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 2, 1, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 2, 1, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 2, 0, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 4, 0, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 4, 1, -0.5, 0.5, 0.5,
-3.716686, -4.129714, 4, 1, 1.5, 0.5, 0.5,
-3.716686, -4.129714, 4, 0, 1.5, 0.5, 0.5
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
-3.18453, -3.574598, -5.767459,
-3.18453, 3.826953, -5.767459,
-3.18453, -3.574598, 5.841753,
-3.18453, 3.826953, 5.841753,
-3.18453, -3.574598, -5.767459,
-3.18453, -3.574598, 5.841753,
-3.18453, 3.826953, -5.767459,
-3.18453, 3.826953, 5.841753,
-3.18453, -3.574598, -5.767459,
3.910893, -3.574598, -5.767459,
-3.18453, -3.574598, 5.841753,
3.910893, -3.574598, 5.841753,
-3.18453, 3.826953, -5.767459,
3.910893, 3.826953, -5.767459,
-3.18453, 3.826953, 5.841753,
3.910893, 3.826953, 5.841753,
3.910893, -3.574598, -5.767459,
3.910893, 3.826953, -5.767459,
3.910893, -3.574598, 5.841753,
3.910893, 3.826953, 5.841753,
3.910893, -3.574598, -5.767459,
3.910893, -3.574598, 5.841753,
3.910893, 3.826953, -5.767459,
3.910893, 3.826953, 5.841753
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
var radius = 8.270699;
var distance = 36.79728;
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
mvMatrix.translate( -0.3631817, -0.1261777, -0.03714681 );
mvMatrix.scale( 1.260311, 1.208185, 0.7702885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.79728);
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

