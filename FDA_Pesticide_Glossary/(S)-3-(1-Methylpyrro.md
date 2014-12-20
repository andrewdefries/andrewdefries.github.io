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
-3.170394, 1.927229, -1.888686, 1, 0, 0, 1,
-2.935582, -0.5240557, -1.009317, 1, 0.007843138, 0, 1,
-2.877481, -1.034535, -2.335245, 1, 0.01176471, 0, 1,
-2.843599, -0.03987927, -1.655028, 1, 0.01960784, 0, 1,
-2.72819, 1.242255, -0.9459689, 1, 0.02352941, 0, 1,
-2.70049, 1.52618, -2.516493, 1, 0.03137255, 0, 1,
-2.658044, -1.15448, -0.8474095, 1, 0.03529412, 0, 1,
-2.587561, -0.3272727, -1.260908, 1, 0.04313726, 0, 1,
-2.580619, 1.715189, -3.148329, 1, 0.04705882, 0, 1,
-2.417113, -1.438823, -3.101633, 1, 0.05490196, 0, 1,
-2.413682, -0.5257998, -3.144982, 1, 0.05882353, 0, 1,
-2.375554, -0.3799108, -1.910632, 1, 0.06666667, 0, 1,
-2.327146, -1.230981, -1.864665, 1, 0.07058824, 0, 1,
-2.292567, 1.396739, -1.357225, 1, 0.07843138, 0, 1,
-2.166202, 1.913567, -1.578066, 1, 0.08235294, 0, 1,
-2.162408, -0.4595348, -1.737369, 1, 0.09019608, 0, 1,
-2.157479, -0.2315192, -1.51954, 1, 0.09411765, 0, 1,
-2.151274, 1.376008, -1.253895, 1, 0.1019608, 0, 1,
-2.047403, -0.1867587, -1.287161, 1, 0.1098039, 0, 1,
-2.019809, 0.8585402, -1.974946, 1, 0.1137255, 0, 1,
-2.016686, 0.7873374, -0.9381225, 1, 0.1215686, 0, 1,
-2.002251, 2.158059, -0.8610942, 1, 0.1254902, 0, 1,
-1.968072, -0.8245152, -4.400984, 1, 0.1333333, 0, 1,
-1.893786, 0.1531054, -2.377846, 1, 0.1372549, 0, 1,
-1.873476, -0.4968075, -2.481394, 1, 0.145098, 0, 1,
-1.865511, -1.030206, -2.079356, 1, 0.1490196, 0, 1,
-1.843987, 1.87911, -0.7776002, 1, 0.1568628, 0, 1,
-1.836134, 0.8663104, -0.6883229, 1, 0.1607843, 0, 1,
-1.780633, 0.4050283, -3.429092, 1, 0.1686275, 0, 1,
-1.770073, 1.278053, -0.4913709, 1, 0.172549, 0, 1,
-1.763862, 0.2662356, -2.079622, 1, 0.1803922, 0, 1,
-1.761533, -0.3872802, -2.516558, 1, 0.1843137, 0, 1,
-1.752915, -1.158602, -5.311674, 1, 0.1921569, 0, 1,
-1.715389, 0.4935964, 0.485806, 1, 0.1960784, 0, 1,
-1.711264, -1.067996, -2.038846, 1, 0.2039216, 0, 1,
-1.708626, 1.110619, -2.335126, 1, 0.2117647, 0, 1,
-1.701411, 0.4368163, -0.2902207, 1, 0.2156863, 0, 1,
-1.69477, -1.52134, -3.266492, 1, 0.2235294, 0, 1,
-1.692181, 0.358235, -0.3263153, 1, 0.227451, 0, 1,
-1.678983, 0.9510466, -2.586811, 1, 0.2352941, 0, 1,
-1.673653, 0.4845715, -2.33012, 1, 0.2392157, 0, 1,
-1.671723, 1.488014, -1.003544, 1, 0.2470588, 0, 1,
-1.663467, -0.4031844, -0.05602213, 1, 0.2509804, 0, 1,
-1.646903, 0.05408926, -1.21723, 1, 0.2588235, 0, 1,
-1.621878, -1.3599, -3.336817, 1, 0.2627451, 0, 1,
-1.590362, -0.5459978, -1.560925, 1, 0.2705882, 0, 1,
-1.590095, 1.44138, -1.839818, 1, 0.2745098, 0, 1,
-1.568033, 0.568705, -0.5578858, 1, 0.282353, 0, 1,
-1.552894, 0.6776171, -0.7946132, 1, 0.2862745, 0, 1,
-1.546909, 0.7692341, -1.287405, 1, 0.2941177, 0, 1,
-1.545285, 0.6451292, -1.908965, 1, 0.3019608, 0, 1,
-1.544873, -1.147041, -4.444286, 1, 0.3058824, 0, 1,
-1.534016, -0.3017013, -2.08549, 1, 0.3137255, 0, 1,
-1.527841, -0.102423, -1.040601, 1, 0.3176471, 0, 1,
-1.52257, -0.03647707, -2.199407, 1, 0.3254902, 0, 1,
-1.514045, -1.54474, -3.999728, 1, 0.3294118, 0, 1,
-1.486203, 0.7336591, -3.029526, 1, 0.3372549, 0, 1,
-1.477069, 1.356579, -1.351105, 1, 0.3411765, 0, 1,
-1.470808, -0.2646562, -0.8466421, 1, 0.3490196, 0, 1,
-1.454028, -0.5683416, -0.2773117, 1, 0.3529412, 0, 1,
-1.437024, -1.620304, -0.4588949, 1, 0.3607843, 0, 1,
-1.400266, -1.123626, -2.376921, 1, 0.3647059, 0, 1,
-1.399219, 0.1676073, -2.20928, 1, 0.372549, 0, 1,
-1.396252, 0.4580449, -1.776262, 1, 0.3764706, 0, 1,
-1.390353, -0.8754218, -1.086155, 1, 0.3843137, 0, 1,
-1.384747, -1.418683, -1.631967, 1, 0.3882353, 0, 1,
-1.382142, -0.5799837, -2.506038, 1, 0.3960784, 0, 1,
-1.381897, 0.3918093, -0.7475941, 1, 0.4039216, 0, 1,
-1.37901, -0.7532137, -0.5437438, 1, 0.4078431, 0, 1,
-1.377492, -1.762853, -2.352901, 1, 0.4156863, 0, 1,
-1.363369, 0.183342, -2.37072, 1, 0.4196078, 0, 1,
-1.351268, 0.6199908, -4.298541, 1, 0.427451, 0, 1,
-1.350708, 1.495463, -0.005425719, 1, 0.4313726, 0, 1,
-1.344146, -0.04658427, -2.058678, 1, 0.4392157, 0, 1,
-1.340463, -1.685045, -1.496259, 1, 0.4431373, 0, 1,
-1.338818, 0.7268598, -1.178333, 1, 0.4509804, 0, 1,
-1.327416, -1.321683, -3.117145, 1, 0.454902, 0, 1,
-1.318644, -0.8190259, -2.175245, 1, 0.4627451, 0, 1,
-1.307828, -0.4474744, -1.189244, 1, 0.4666667, 0, 1,
-1.302284, 0.7242293, -4.935347, 1, 0.4745098, 0, 1,
-1.301619, 0.4098742, -2.134349, 1, 0.4784314, 0, 1,
-1.2873, 0.5226591, -1.752251, 1, 0.4862745, 0, 1,
-1.274202, -0.121599, -0.768191, 1, 0.4901961, 0, 1,
-1.274043, -0.4251023, -1.994047, 1, 0.4980392, 0, 1,
-1.273075, -0.09004474, -1.302936, 1, 0.5058824, 0, 1,
-1.269675, -0.4385914, -1.839252, 1, 0.509804, 0, 1,
-1.26842, 0.2111889, -0.5239897, 1, 0.5176471, 0, 1,
-1.267622, 0.2914489, -1.238281, 1, 0.5215687, 0, 1,
-1.259578, 0.884532, -1.690707, 1, 0.5294118, 0, 1,
-1.256678, 1.085511, 0.5514909, 1, 0.5333334, 0, 1,
-1.25278, -0.3206699, -1.17235, 1, 0.5411765, 0, 1,
-1.251826, 0.5386779, -1.799176, 1, 0.5450981, 0, 1,
-1.250695, 1.247268, -1.489725, 1, 0.5529412, 0, 1,
-1.249684, 0.3179319, -0.9860234, 1, 0.5568628, 0, 1,
-1.24671, -0.4788937, -2.877914, 1, 0.5647059, 0, 1,
-1.243082, 1.642269, -1.611295, 1, 0.5686275, 0, 1,
-1.241527, -0.09201147, -3.510681, 1, 0.5764706, 0, 1,
-1.23049, -0.5825883, -3.569995, 1, 0.5803922, 0, 1,
-1.223425, 0.3746165, -0.6667181, 1, 0.5882353, 0, 1,
-1.217748, -0.8017097, -2.569578, 1, 0.5921569, 0, 1,
-1.217687, 1.068067, -0.8162884, 1, 0.6, 0, 1,
-1.204206, 0.1917482, -0.6220462, 1, 0.6078432, 0, 1,
-1.203051, -0.2454588, -1.094349, 1, 0.6117647, 0, 1,
-1.201318, -1.502523, -3.811219, 1, 0.6196079, 0, 1,
-1.198938, 0.4077283, -1.892307, 1, 0.6235294, 0, 1,
-1.188405, 2.064946, 0.216177, 1, 0.6313726, 0, 1,
-1.187039, 0.09629209, -2.01598, 1, 0.6352941, 0, 1,
-1.186291, 0.07559007, -3.108649, 1, 0.6431373, 0, 1,
-1.184145, -0.3392467, -1.035984, 1, 0.6470588, 0, 1,
-1.180509, -0.1882982, -2.298183, 1, 0.654902, 0, 1,
-1.179535, 0.5871434, 1.404076, 1, 0.6588235, 0, 1,
-1.177553, 0.1714278, -2.452226, 1, 0.6666667, 0, 1,
-1.176552, -0.09013072, -2.872988, 1, 0.6705883, 0, 1,
-1.174679, -1.373494, -2.227873, 1, 0.6784314, 0, 1,
-1.171091, -0.09053399, -1.854329, 1, 0.682353, 0, 1,
-1.169452, 1.681067, -0.5338873, 1, 0.6901961, 0, 1,
-1.163579, 0.6503215, 0.910294, 1, 0.6941177, 0, 1,
-1.158935, -0.5122988, -0.2682729, 1, 0.7019608, 0, 1,
-1.155143, -1.719259, -3.586012, 1, 0.7098039, 0, 1,
-1.154731, 2.479282, 1.366494, 1, 0.7137255, 0, 1,
-1.147297, 1.648723, -0.7502192, 1, 0.7215686, 0, 1,
-1.137132, 0.0334235, -0.9673176, 1, 0.7254902, 0, 1,
-1.132478, -0.8927813, 0.1750889, 1, 0.7333333, 0, 1,
-1.128582, -0.05996171, -2.114962, 1, 0.7372549, 0, 1,
-1.127183, 0.4942457, -0.6992816, 1, 0.7450981, 0, 1,
-1.127169, 0.2834735, -2.7379, 1, 0.7490196, 0, 1,
-1.117094, -1.156959, -3.479171, 1, 0.7568628, 0, 1,
-1.112298, -0.6725093, -2.885614, 1, 0.7607843, 0, 1,
-1.110312, 1.422503, 0.1823594, 1, 0.7686275, 0, 1,
-1.101359, 0.08236974, -2.795149, 1, 0.772549, 0, 1,
-1.100767, 1.725224, 0.3994944, 1, 0.7803922, 0, 1,
-1.10018, -0.8930552, -0.8865478, 1, 0.7843137, 0, 1,
-1.067839, -0.4633203, -1.084339, 1, 0.7921569, 0, 1,
-1.064281, 0.1775062, 0.2083311, 1, 0.7960784, 0, 1,
-1.06275, -0.5117391, -1.803249, 1, 0.8039216, 0, 1,
-1.060313, -0.4013366, -0.282851, 1, 0.8117647, 0, 1,
-1.055099, -0.9762283, -2.289892, 1, 0.8156863, 0, 1,
-1.049582, 1.24078, 0.2729814, 1, 0.8235294, 0, 1,
-1.049498, 1.847414, -1.746535, 1, 0.827451, 0, 1,
-1.04738, -1.068921, -1.918864, 1, 0.8352941, 0, 1,
-1.045206, -0.2087524, -1.02642, 1, 0.8392157, 0, 1,
-1.033335, -0.876111, -2.954262, 1, 0.8470588, 0, 1,
-1.022159, 0.3514683, -1.006908, 1, 0.8509804, 0, 1,
-1.020385, 0.4843494, -0.01196175, 1, 0.8588235, 0, 1,
-1.015354, -1.849858, -0.9545649, 1, 0.8627451, 0, 1,
-1.012706, -0.5554321, 0.2244408, 1, 0.8705882, 0, 1,
-1.008852, 0.2905303, -1.649706, 1, 0.8745098, 0, 1,
-1.004847, -2.366512, -3.290229, 1, 0.8823529, 0, 1,
-1.000848, -0.6777417, -3.501081, 1, 0.8862745, 0, 1,
-0.9887785, 0.1256573, -0.4192099, 1, 0.8941177, 0, 1,
-0.9760443, -0.01991447, -0.2207903, 1, 0.8980392, 0, 1,
-0.9741959, -1.263699, -2.085119, 1, 0.9058824, 0, 1,
-0.9733832, -0.4705546, -1.741298, 1, 0.9137255, 0, 1,
-0.9458314, -0.3862866, -3.111754, 1, 0.9176471, 0, 1,
-0.9394293, 0.1835813, -2.278672, 1, 0.9254902, 0, 1,
-0.9297038, -0.3641384, -2.772019, 1, 0.9294118, 0, 1,
-0.9274457, 0.02636536, 1.286737, 1, 0.9372549, 0, 1,
-0.9264057, 1.129447, -0.6327667, 1, 0.9411765, 0, 1,
-0.9261535, 0.07192129, -1.72097, 1, 0.9490196, 0, 1,
-0.9191206, -1.917249, -2.626281, 1, 0.9529412, 0, 1,
-0.9149706, -0.05126779, -3.086692, 1, 0.9607843, 0, 1,
-0.9095299, 2.607957, 0.290956, 1, 0.9647059, 0, 1,
-0.906235, -1.110483, -1.889036, 1, 0.972549, 0, 1,
-0.9036307, -2.009079, -4.193918, 1, 0.9764706, 0, 1,
-0.9015233, -1.843256, -2.300256, 1, 0.9843137, 0, 1,
-0.9002361, -0.2342396, -1.376239, 1, 0.9882353, 0, 1,
-0.8973448, 0.4917963, -0.006361783, 1, 0.9960784, 0, 1,
-0.888751, 1.440533, 1.452492, 0.9960784, 1, 0, 1,
-0.8862306, 1.223204, -3.161277, 0.9921569, 1, 0, 1,
-0.8849885, 0.7004117, -1.823318, 0.9843137, 1, 0, 1,
-0.8831271, 0.8550301, -2.692366, 0.9803922, 1, 0, 1,
-0.8812835, 0.1586468, -1.374255, 0.972549, 1, 0, 1,
-0.8812565, 0.8744639, -2.095656, 0.9686275, 1, 0, 1,
-0.8800488, 0.9577612, -0.3320904, 0.9607843, 1, 0, 1,
-0.8787704, 0.3471185, -1.164486, 0.9568627, 1, 0, 1,
-0.8771605, -2.164411, -1.626176, 0.9490196, 1, 0, 1,
-0.8758664, -3.391749, -1.649435, 0.945098, 1, 0, 1,
-0.8698108, 0.382443, -0.760657, 0.9372549, 1, 0, 1,
-0.8633252, 0.8346961, -1.686719, 0.9333333, 1, 0, 1,
-0.8631431, 1.18468, -0.78158, 0.9254902, 1, 0, 1,
-0.8594409, -0.8974258, -2.533865, 0.9215686, 1, 0, 1,
-0.8591283, 1.450717, 0.08569992, 0.9137255, 1, 0, 1,
-0.8515123, 0.1535826, -1.54946, 0.9098039, 1, 0, 1,
-0.8513497, -0.6553289, -2.572208, 0.9019608, 1, 0, 1,
-0.8502555, -0.04441322, -0.8728638, 0.8941177, 1, 0, 1,
-0.8448732, 0.8958225, -1.161649, 0.8901961, 1, 0, 1,
-0.8332208, -0.3527657, -3.673066, 0.8823529, 1, 0, 1,
-0.8285782, 0.6162567, 1.232592, 0.8784314, 1, 0, 1,
-0.8251875, -0.3201935, -1.138626, 0.8705882, 1, 0, 1,
-0.8216485, -0.9432552, -3.905481, 0.8666667, 1, 0, 1,
-0.820575, 1.582966, -0.3640541, 0.8588235, 1, 0, 1,
-0.8100876, 0.7668906, 0.3316313, 0.854902, 1, 0, 1,
-0.8071156, 0.3105161, -0.9104937, 0.8470588, 1, 0, 1,
-0.8069026, 0.7614314, -0.9162953, 0.8431373, 1, 0, 1,
-0.8039566, 0.1433309, -0.4867655, 0.8352941, 1, 0, 1,
-0.7945725, 0.02852927, -0.777428, 0.8313726, 1, 0, 1,
-0.7938984, -0.4888909, -2.98808, 0.8235294, 1, 0, 1,
-0.7866699, -0.8266264, -3.516013, 0.8196079, 1, 0, 1,
-0.7850369, -0.9818714, -1.724332, 0.8117647, 1, 0, 1,
-0.7844859, -0.9123617, -1.688168, 0.8078431, 1, 0, 1,
-0.784457, -0.517144, -1.415133, 0.8, 1, 0, 1,
-0.7838602, 0.04146578, -3.466809, 0.7921569, 1, 0, 1,
-0.7720459, 0.4435224, -0.4770007, 0.7882353, 1, 0, 1,
-0.7718019, -0.9885945, -1.115663, 0.7803922, 1, 0, 1,
-0.7597111, 0.9324537, -1.40634, 0.7764706, 1, 0, 1,
-0.7567847, -0.5929508, -2.026525, 0.7686275, 1, 0, 1,
-0.7409353, -1.106095, -2.751955, 0.7647059, 1, 0, 1,
-0.7393481, 0.3064243, 0.09682186, 0.7568628, 1, 0, 1,
-0.7378788, -0.6307074, -2.73777, 0.7529412, 1, 0, 1,
-0.7353721, 0.4813897, -0.9267141, 0.7450981, 1, 0, 1,
-0.7312096, -0.6115727, -1.90964, 0.7411765, 1, 0, 1,
-0.7248188, -0.8414679, -3.578011, 0.7333333, 1, 0, 1,
-0.7165432, -0.2018781, -3.101669, 0.7294118, 1, 0, 1,
-0.7111465, -0.5867239, -3.183448, 0.7215686, 1, 0, 1,
-0.7000012, -0.06066188, 0.7963468, 0.7176471, 1, 0, 1,
-0.6998293, 1.279566, 0.2811258, 0.7098039, 1, 0, 1,
-0.6984875, -0.6168166, -2.704509, 0.7058824, 1, 0, 1,
-0.6944455, 0.00291704, -3.027063, 0.6980392, 1, 0, 1,
-0.6867639, 0.328545, -1.644277, 0.6901961, 1, 0, 1,
-0.6865782, 0.4538064, -1.727384, 0.6862745, 1, 0, 1,
-0.6835597, 1.780707, 0.9619033, 0.6784314, 1, 0, 1,
-0.6824629, -0.09633023, -1.454841, 0.6745098, 1, 0, 1,
-0.6793581, -1.128574, -2.057631, 0.6666667, 1, 0, 1,
-0.6780168, 0.3676253, -1.552199, 0.6627451, 1, 0, 1,
-0.6655225, -0.5160781, -4.838203, 0.654902, 1, 0, 1,
-0.6632903, 0.3254915, -2.799914, 0.6509804, 1, 0, 1,
-0.6590701, 0.1528273, -0.3535793, 0.6431373, 1, 0, 1,
-0.6584841, -1.133884, -2.567175, 0.6392157, 1, 0, 1,
-0.6563378, 0.7265241, -2.192335, 0.6313726, 1, 0, 1,
-0.6547428, -0.4822744, -1.40896, 0.627451, 1, 0, 1,
-0.6472752, -0.3697061, -2.417242, 0.6196079, 1, 0, 1,
-0.6464084, 1.390208, -0.2754152, 0.6156863, 1, 0, 1,
-0.6396593, 0.5561309, -0.9098662, 0.6078432, 1, 0, 1,
-0.637297, 0.6025678, -1.457897, 0.6039216, 1, 0, 1,
-0.6363568, 1.419799, -0.3984738, 0.5960785, 1, 0, 1,
-0.6361722, 0.6806865, -0.6024622, 0.5882353, 1, 0, 1,
-0.634054, -0.0007687899, -0.6998224, 0.5843138, 1, 0, 1,
-0.6339043, -0.9733997, -3.073515, 0.5764706, 1, 0, 1,
-0.6326674, -1.872917, -2.589761, 0.572549, 1, 0, 1,
-0.6319401, 0.7240844, -2.45011, 0.5647059, 1, 0, 1,
-0.6304374, -0.6157486, -4.002265, 0.5607843, 1, 0, 1,
-0.6281728, 0.2003292, -2.115185, 0.5529412, 1, 0, 1,
-0.6211392, 0.9459166, -0.6733213, 0.5490196, 1, 0, 1,
-0.6191347, -0.3090832, -1.930212, 0.5411765, 1, 0, 1,
-0.6183574, 0.08505228, -2.229347, 0.5372549, 1, 0, 1,
-0.6154358, -0.06005945, -0.2929581, 0.5294118, 1, 0, 1,
-0.6126818, 0.2536714, -0.5971667, 0.5254902, 1, 0, 1,
-0.6119948, -1.83011, -2.322937, 0.5176471, 1, 0, 1,
-0.6094643, 0.2524825, -2.610282, 0.5137255, 1, 0, 1,
-0.6072447, 0.3219439, 0.6829346, 0.5058824, 1, 0, 1,
-0.6055887, 0.6108088, -2.290134, 0.5019608, 1, 0, 1,
-0.5993108, 0.4433544, -1.337549, 0.4941176, 1, 0, 1,
-0.5983195, -0.5454648, -3.252625, 0.4862745, 1, 0, 1,
-0.5925753, 0.6077312, -1.52366, 0.4823529, 1, 0, 1,
-0.5900673, -0.3337173, -4.008761, 0.4745098, 1, 0, 1,
-0.5875292, 0.4302069, -1.918768, 0.4705882, 1, 0, 1,
-0.581953, -1.249403, -3.539389, 0.4627451, 1, 0, 1,
-0.5773221, -2.343181, -0.6929263, 0.4588235, 1, 0, 1,
-0.5770168, -0.3225517, -1.357727, 0.4509804, 1, 0, 1,
-0.5756262, -0.1821132, -1.560041, 0.4470588, 1, 0, 1,
-0.5733621, -0.7136499, -3.18181, 0.4392157, 1, 0, 1,
-0.5731936, 0.8193865, -0.6218498, 0.4352941, 1, 0, 1,
-0.5731277, 1.141415, -0.6848222, 0.427451, 1, 0, 1,
-0.5720631, -0.676663, -2.636709, 0.4235294, 1, 0, 1,
-0.5632202, 0.6385929, 0.2757839, 0.4156863, 1, 0, 1,
-0.5630921, -1.112027, -3.477115, 0.4117647, 1, 0, 1,
-0.5601747, 0.6948118, -1.67449, 0.4039216, 1, 0, 1,
-0.549587, -2.43039, -1.321545, 0.3960784, 1, 0, 1,
-0.5491742, -1.033828, -1.808761, 0.3921569, 1, 0, 1,
-0.5489918, 0.3226675, -2.259362, 0.3843137, 1, 0, 1,
-0.5487655, 0.2154919, 0.949832, 0.3803922, 1, 0, 1,
-0.5453721, 0.2107922, -0.7217999, 0.372549, 1, 0, 1,
-0.5450555, -0.4143747, -0.509579, 0.3686275, 1, 0, 1,
-0.538569, 0.2474881, -1.807644, 0.3607843, 1, 0, 1,
-0.5370043, -1.738551, -2.783473, 0.3568628, 1, 0, 1,
-0.5265154, -0.4143341, -2.655819, 0.3490196, 1, 0, 1,
-0.5078108, -0.6155077, -3.477055, 0.345098, 1, 0, 1,
-0.507722, -0.6453995, -2.280272, 0.3372549, 1, 0, 1,
-0.5037285, 0.9130622, -0.7450435, 0.3333333, 1, 0, 1,
-0.4957834, 0.7218359, -0.004183417, 0.3254902, 1, 0, 1,
-0.4932026, 0.455312, -1.770706, 0.3215686, 1, 0, 1,
-0.4912213, 1.672759, 1.70156, 0.3137255, 1, 0, 1,
-0.4901527, 0.8109981, 0.3638746, 0.3098039, 1, 0, 1,
-0.4889435, 2.605537, -0.4170053, 0.3019608, 1, 0, 1,
-0.4841137, -0.548425, -1.235555, 0.2941177, 1, 0, 1,
-0.482471, -1.287381, -3.205978, 0.2901961, 1, 0, 1,
-0.4824233, 0.0959953, -2.406948, 0.282353, 1, 0, 1,
-0.4813514, -0.4896034, -2.259486, 0.2784314, 1, 0, 1,
-0.4753605, 0.7568246, -2.048098, 0.2705882, 1, 0, 1,
-0.4706142, 1.385527, -1.625615, 0.2666667, 1, 0, 1,
-0.4664685, 0.2617906, -0.3766619, 0.2588235, 1, 0, 1,
-0.4653155, -1.516348, -2.786299, 0.254902, 1, 0, 1,
-0.4633513, 1.22108, -0.5960068, 0.2470588, 1, 0, 1,
-0.4572899, 0.9576136, -0.1969164, 0.2431373, 1, 0, 1,
-0.4538924, -1.796676, -0.4171224, 0.2352941, 1, 0, 1,
-0.453869, -0.01511642, -2.952035, 0.2313726, 1, 0, 1,
-0.4502515, -0.93436, -2.52054, 0.2235294, 1, 0, 1,
-0.4469524, -0.4514723, -1.538436, 0.2196078, 1, 0, 1,
-0.4457912, 1.094421, 0.2347786, 0.2117647, 1, 0, 1,
-0.4449466, -0.3842688, -1.26195, 0.2078431, 1, 0, 1,
-0.4444184, 0.519265, -2.205967, 0.2, 1, 0, 1,
-0.4429737, 1.121009, -1.234793, 0.1921569, 1, 0, 1,
-0.4421453, 0.5987343, -0.457503, 0.1882353, 1, 0, 1,
-0.4350955, 0.2293599, -2.447276, 0.1803922, 1, 0, 1,
-0.4350142, -0.9337669, -2.071825, 0.1764706, 1, 0, 1,
-0.4321456, -2.455135, -3.111413, 0.1686275, 1, 0, 1,
-0.4257613, 1.457555, -0.3377717, 0.1647059, 1, 0, 1,
-0.4228595, -0.3775942, -2.608938, 0.1568628, 1, 0, 1,
-0.4218739, 0.9114274, 1.65913, 0.1529412, 1, 0, 1,
-0.4154381, -0.6279596, -2.348702, 0.145098, 1, 0, 1,
-0.4083764, -1.813627, -3.221236, 0.1411765, 1, 0, 1,
-0.4065674, 0.4683995, -0.9562124, 0.1333333, 1, 0, 1,
-0.4060662, 1.675376, -0.7199377, 0.1294118, 1, 0, 1,
-0.4020771, 0.2111477, -1.82387, 0.1215686, 1, 0, 1,
-0.4015017, 1.121634, 1.81706, 0.1176471, 1, 0, 1,
-0.4009309, 0.7172005, 0.08061907, 0.1098039, 1, 0, 1,
-0.4007656, 1.349303, -1.563526, 0.1058824, 1, 0, 1,
-0.4002334, -1.37393, -4.947429, 0.09803922, 1, 0, 1,
-0.4001553, 0.8328517, -0.06680332, 0.09019608, 1, 0, 1,
-0.3958101, 0.8360137, 0.8404092, 0.08627451, 1, 0, 1,
-0.3941074, -0.8051644, -3.258164, 0.07843138, 1, 0, 1,
-0.3891121, 0.06523772, -0.6123808, 0.07450981, 1, 0, 1,
-0.3845711, 0.4002857, -0.1735492, 0.06666667, 1, 0, 1,
-0.3828389, -0.5271298, -2.971187, 0.0627451, 1, 0, 1,
-0.3803816, -0.1807883, -1.78052, 0.05490196, 1, 0, 1,
-0.3801316, 1.066202, -0.2068315, 0.05098039, 1, 0, 1,
-0.3782964, 0.971433, 0.1463055, 0.04313726, 1, 0, 1,
-0.3737575, -1.095578, -1.66446, 0.03921569, 1, 0, 1,
-0.3734323, 2.715477, -0.8535172, 0.03137255, 1, 0, 1,
-0.3729546, 1.029468, 0.7219236, 0.02745098, 1, 0, 1,
-0.3695185, 1.227268, -0.4289968, 0.01960784, 1, 0, 1,
-0.3681269, -0.2812288, 0.9159263, 0.01568628, 1, 0, 1,
-0.3593443, 0.2289371, 0.3159351, 0.007843138, 1, 0, 1,
-0.3569635, -2.110289, -3.327564, 0.003921569, 1, 0, 1,
-0.3529244, 0.581764, -0.7076812, 0, 1, 0.003921569, 1,
-0.3520584, -0.3622296, -2.811604, 0, 1, 0.01176471, 1,
-0.3511366, 1.782353, -0.9560899, 0, 1, 0.01568628, 1,
-0.3504919, 2.212977, 0.0584821, 0, 1, 0.02352941, 1,
-0.3462393, 2.361581, 0.9570215, 0, 1, 0.02745098, 1,
-0.342079, -0.2573818, -2.71512, 0, 1, 0.03529412, 1,
-0.3390707, -1.077261, -3.627267, 0, 1, 0.03921569, 1,
-0.3385807, 1.492843, -0.4635375, 0, 1, 0.04705882, 1,
-0.3365534, -0.7947202, -3.162888, 0, 1, 0.05098039, 1,
-0.3341793, -0.2610225, -1.149296, 0, 1, 0.05882353, 1,
-0.3318889, 0.02794192, -1.430032, 0, 1, 0.0627451, 1,
-0.330601, -1.599902, -0.3640133, 0, 1, 0.07058824, 1,
-0.3304442, -0.129173, -2.207166, 0, 1, 0.07450981, 1,
-0.3290506, 0.6391459, -0.8707141, 0, 1, 0.08235294, 1,
-0.3288693, -1.14035, -2.78317, 0, 1, 0.08627451, 1,
-0.328294, 0.5236022, -0.1025777, 0, 1, 0.09411765, 1,
-0.3182702, -0.06743102, -1.366916, 0, 1, 0.1019608, 1,
-0.3179252, -0.634818, -1.135444, 0, 1, 0.1058824, 1,
-0.3154485, -0.02765788, -0.466699, 0, 1, 0.1137255, 1,
-0.3129938, -1.858334, -2.533368, 0, 1, 0.1176471, 1,
-0.3107276, -0.5343285, -3.023398, 0, 1, 0.1254902, 1,
-0.3107112, 0.4907685, -2.676485, 0, 1, 0.1294118, 1,
-0.3079754, -0.5976905, -2.661023, 0, 1, 0.1372549, 1,
-0.3077737, 0.5523059, -0.8143726, 0, 1, 0.1411765, 1,
-0.2997257, -0.07078074, -0.3474231, 0, 1, 0.1490196, 1,
-0.2984968, -0.1449801, -3.084743, 0, 1, 0.1529412, 1,
-0.2950117, 0.6718078, -0.6818857, 0, 1, 0.1607843, 1,
-0.292106, -0.3444914, -2.934374, 0, 1, 0.1647059, 1,
-0.2904951, 0.9076779, 0.1890423, 0, 1, 0.172549, 1,
-0.2864324, -2.050721, -1.370335, 0, 1, 0.1764706, 1,
-0.2840456, 0.1498571, -1.110242, 0, 1, 0.1843137, 1,
-0.2777357, -0.1446156, -1.319392, 0, 1, 0.1882353, 1,
-0.2740598, -1.565643, -3.612619, 0, 1, 0.1960784, 1,
-0.2653888, 0.1016742, -2.762652, 0, 1, 0.2039216, 1,
-0.2633417, 0.3540029, 0.01250645, 0, 1, 0.2078431, 1,
-0.2580782, -0.4770215, -3.144252, 0, 1, 0.2156863, 1,
-0.2509038, 0.8015076, -0.8421023, 0, 1, 0.2196078, 1,
-0.2459158, -0.4970391, -1.994954, 0, 1, 0.227451, 1,
-0.245286, 0.4881972, -0.5595709, 0, 1, 0.2313726, 1,
-0.2450865, -0.3823101, -1.250794, 0, 1, 0.2392157, 1,
-0.2403583, -0.3891523, -3.561874, 0, 1, 0.2431373, 1,
-0.2394473, 0.09694849, -1.083178, 0, 1, 0.2509804, 1,
-0.2380776, -1.878141, -4.282252, 0, 1, 0.254902, 1,
-0.2364057, 0.786402, -2.716513, 0, 1, 0.2627451, 1,
-0.234934, 1.997223, 1.533448, 0, 1, 0.2666667, 1,
-0.2336815, 0.1801892, -0.00675521, 0, 1, 0.2745098, 1,
-0.2296239, -3.009684, -3.194745, 0, 1, 0.2784314, 1,
-0.2250978, -1.322384, -3.301334, 0, 1, 0.2862745, 1,
-0.221354, 0.7819263, -1.788332, 0, 1, 0.2901961, 1,
-0.220321, -0.2200553, -1.724993, 0, 1, 0.2980392, 1,
-0.2185814, -0.105529, -1.505147, 0, 1, 0.3058824, 1,
-0.217741, -0.006209318, -2.030445, 0, 1, 0.3098039, 1,
-0.2139808, -1.932593, -3.952768, 0, 1, 0.3176471, 1,
-0.208553, -0.4595237, -4.118086, 0, 1, 0.3215686, 1,
-0.203423, 0.3107798, 0.7900772, 0, 1, 0.3294118, 1,
-0.2005782, 0.5362224, -0.693032, 0, 1, 0.3333333, 1,
-0.1988582, 0.6378181, -2.028059, 0, 1, 0.3411765, 1,
-0.1987894, -0.53574, -3.177404, 0, 1, 0.345098, 1,
-0.1968019, 0.3522455, -2.873183, 0, 1, 0.3529412, 1,
-0.1922004, 1.283677, -0.07631267, 0, 1, 0.3568628, 1,
-0.1861864, -0.4554718, -2.262575, 0, 1, 0.3647059, 1,
-0.1853457, 0.4990058, 2.051906, 0, 1, 0.3686275, 1,
-0.1846051, 0.07077891, -1.137007, 0, 1, 0.3764706, 1,
-0.1819441, -2.249128, -3.766945, 0, 1, 0.3803922, 1,
-0.1817569, 0.6329347, 0.2728324, 0, 1, 0.3882353, 1,
-0.1790487, -0.2087145, -3.301358, 0, 1, 0.3921569, 1,
-0.1785299, 0.9705307, -0.5506552, 0, 1, 0.4, 1,
-0.1760433, 0.7550769, 0.4606514, 0, 1, 0.4078431, 1,
-0.1700819, 0.1013112, -0.7006143, 0, 1, 0.4117647, 1,
-0.1691503, -0.01232661, -1.830111, 0, 1, 0.4196078, 1,
-0.1644077, 0.5362272, -1.615303, 0, 1, 0.4235294, 1,
-0.1607898, 0.5389941, -0.5375018, 0, 1, 0.4313726, 1,
-0.159897, 0.3061847, -0.3326465, 0, 1, 0.4352941, 1,
-0.1558545, -0.5772628, -3.72099, 0, 1, 0.4431373, 1,
-0.155135, 0.4923468, -0.09992086, 0, 1, 0.4470588, 1,
-0.1518971, -2.589184, -2.250882, 0, 1, 0.454902, 1,
-0.1469116, -0.2492516, -2.721506, 0, 1, 0.4588235, 1,
-0.1453365, 0.501959, 0.6997315, 0, 1, 0.4666667, 1,
-0.1432083, -0.6691267, -3.809932, 0, 1, 0.4705882, 1,
-0.1428924, -1.278574, -2.715852, 0, 1, 0.4784314, 1,
-0.1428789, -0.8947783, -2.928568, 0, 1, 0.4823529, 1,
-0.1378051, -0.1754266, -1.322636, 0, 1, 0.4901961, 1,
-0.1314997, 0.506133, 0.6294827, 0, 1, 0.4941176, 1,
-0.1297511, 0.2509779, -1.446243, 0, 1, 0.5019608, 1,
-0.1290882, 0.3760775, -2.053663, 0, 1, 0.509804, 1,
-0.1289698, -0.1871027, -3.023879, 0, 1, 0.5137255, 1,
-0.1265184, -2.163856, -3.160676, 0, 1, 0.5215687, 1,
-0.124977, -0.5809335, -3.934198, 0, 1, 0.5254902, 1,
-0.1242445, 0.4160449, -1.130284, 0, 1, 0.5333334, 1,
-0.1146044, 0.6980028, 1.266132, 0, 1, 0.5372549, 1,
-0.1127986, -0.15577, -3.349062, 0, 1, 0.5450981, 1,
-0.1063426, 1.575005, 0.2919089, 0, 1, 0.5490196, 1,
-0.09824973, -0.6719434, -4.985844, 0, 1, 0.5568628, 1,
-0.0975197, -1.010553, -2.444758, 0, 1, 0.5607843, 1,
-0.0943558, 1.494022, -2.056551, 0, 1, 0.5686275, 1,
-0.0935514, -0.3771914, -3.750413, 0, 1, 0.572549, 1,
-0.08690412, 0.3856597, 0.7126572, 0, 1, 0.5803922, 1,
-0.08286431, -0.1883656, -4.799366, 0, 1, 0.5843138, 1,
-0.07979334, 0.6038378, -0.279085, 0, 1, 0.5921569, 1,
-0.07854322, 1.834809, -0.1071056, 0, 1, 0.5960785, 1,
-0.07541376, -0.9526892, -2.033048, 0, 1, 0.6039216, 1,
-0.07438514, -1.050012, -2.086746, 0, 1, 0.6117647, 1,
-0.07038291, 0.8126637, -1.0468, 0, 1, 0.6156863, 1,
-0.06977095, -0.006254812, -3.0045, 0, 1, 0.6235294, 1,
-0.0662948, -0.3843985, -2.276684, 0, 1, 0.627451, 1,
-0.06605288, 0.2510989, 0.5976959, 0, 1, 0.6352941, 1,
-0.06568135, 1.733321, -0.6777582, 0, 1, 0.6392157, 1,
-0.06200203, 1.382641, 1.679224, 0, 1, 0.6470588, 1,
-0.06093897, -0.6064326, -1.526844, 0, 1, 0.6509804, 1,
-0.05557928, 0.2546909, 0.4183982, 0, 1, 0.6588235, 1,
-0.05335965, 0.08954474, 0.3042533, 0, 1, 0.6627451, 1,
-0.05301861, 0.03070068, -0.5659473, 0, 1, 0.6705883, 1,
-0.05118224, -0.5698807, -1.874243, 0, 1, 0.6745098, 1,
-0.04991868, 0.04649819, -0.4344689, 0, 1, 0.682353, 1,
-0.04901126, 1.278287, 0.4355812, 0, 1, 0.6862745, 1,
-0.04642675, -1.587083, -4.640862, 0, 1, 0.6941177, 1,
-0.04642633, -0.2881262, -3.525022, 0, 1, 0.7019608, 1,
-0.04377375, -1.036647, -3.354776, 0, 1, 0.7058824, 1,
-0.04355619, 1.133816, -0.1582547, 0, 1, 0.7137255, 1,
-0.04271034, 0.6623494, 0.7448854, 0, 1, 0.7176471, 1,
-0.04263308, 0.1946916, 0.3879285, 0, 1, 0.7254902, 1,
-0.04118496, 1.583457, 0.1820587, 0, 1, 0.7294118, 1,
-0.03868596, 0.3244714, -0.6887745, 0, 1, 0.7372549, 1,
-0.03753088, -1.018794, -5.483912, 0, 1, 0.7411765, 1,
-0.03661008, -0.2154707, -2.819227, 0, 1, 0.7490196, 1,
-0.03089642, 0.3064732, -1.000505, 0, 1, 0.7529412, 1,
-0.02757045, 0.6671711, 1.323109, 0, 1, 0.7607843, 1,
-0.02592419, 1.915019, -0.9388555, 0, 1, 0.7647059, 1,
-0.02587737, 0.1565618, -0.288505, 0, 1, 0.772549, 1,
-0.02572047, 1.75655, -0.08451857, 0, 1, 0.7764706, 1,
-0.02453565, -0.663184, -1.41309, 0, 1, 0.7843137, 1,
-0.02383554, 0.7059439, 0.1717908, 0, 1, 0.7882353, 1,
-0.02366425, 1.433715, 0.4861305, 0, 1, 0.7960784, 1,
-0.02289453, -0.28377, -3.749082, 0, 1, 0.8039216, 1,
-0.01750403, 1.159965, 0.8751992, 0, 1, 0.8078431, 1,
-0.01511124, 1.77405, 0.4142747, 0, 1, 0.8156863, 1,
-0.01324541, 0.213834, 2.268471, 0, 1, 0.8196079, 1,
-0.01232391, 0.7360007, -0.936218, 0, 1, 0.827451, 1,
-0.01203194, -0.7871286, -5.56776, 0, 1, 0.8313726, 1,
-0.0111651, -1.401844, -2.31052, 0, 1, 0.8392157, 1,
-0.007913369, -0.6422318, -3.787692, 0, 1, 0.8431373, 1,
-0.003300698, 0.147329, -0.3026981, 0, 1, 0.8509804, 1,
-0.002554205, 1.048323, 0.8253241, 0, 1, 0.854902, 1,
0.008680617, -1.160599, 3.870666, 0, 1, 0.8627451, 1,
0.01027342, 0.4838585, -0.2575339, 0, 1, 0.8666667, 1,
0.01306405, 0.1798464, -1.404922, 0, 1, 0.8745098, 1,
0.01963015, -0.2340006, 2.512048, 0, 1, 0.8784314, 1,
0.02075494, -0.7203231, 2.455986, 0, 1, 0.8862745, 1,
0.0238019, -0.7822755, 2.624494, 0, 1, 0.8901961, 1,
0.02404358, 0.3358229, -0.0959726, 0, 1, 0.8980392, 1,
0.02690653, 1.488554, 0.2773021, 0, 1, 0.9058824, 1,
0.02820272, 1.069044, 0.282229, 0, 1, 0.9098039, 1,
0.02893887, -0.7900045, 1.622392, 0, 1, 0.9176471, 1,
0.02945483, -1.252805, 3.093283, 0, 1, 0.9215686, 1,
0.03133364, 0.5286967, 0.5828382, 0, 1, 0.9294118, 1,
0.03150912, 0.5538536, 0.3876068, 0, 1, 0.9333333, 1,
0.03160884, -0.4959374, 2.822827, 0, 1, 0.9411765, 1,
0.0328789, 1.126724, 2.050514, 0, 1, 0.945098, 1,
0.03387829, -1.806569, 3.597982, 0, 1, 0.9529412, 1,
0.03529118, -1.863273, 4.798608, 0, 1, 0.9568627, 1,
0.03535706, 0.4816533, -0.2428782, 0, 1, 0.9647059, 1,
0.03592728, -1.380439, 2.286173, 0, 1, 0.9686275, 1,
0.03616899, -0.0146313, 1.200534, 0, 1, 0.9764706, 1,
0.03718907, 0.6107092, -0.3131146, 0, 1, 0.9803922, 1,
0.04211658, -1.195082, 2.932554, 0, 1, 0.9882353, 1,
0.04321227, -0.109844, 2.995954, 0, 1, 0.9921569, 1,
0.04560098, 1.099688, 1.527287, 0, 1, 1, 1,
0.04680827, -1.058431, 3.467812, 0, 0.9921569, 1, 1,
0.04841106, -0.7222251, 3.470252, 0, 0.9882353, 1, 1,
0.04918826, 0.162834, 0.317662, 0, 0.9803922, 1, 1,
0.05023552, 0.414242, 0.3621867, 0, 0.9764706, 1, 1,
0.05084652, -0.696739, 3.380409, 0, 0.9686275, 1, 1,
0.05405119, 2.263075, 0.1083568, 0, 0.9647059, 1, 1,
0.05437344, 0.1998987, -0.5947583, 0, 0.9568627, 1, 1,
0.05483213, -0.2757001, 1.752547, 0, 0.9529412, 1, 1,
0.06012489, 2.140039, 0.4548118, 0, 0.945098, 1, 1,
0.0624538, 0.9910846, -0.9739318, 0, 0.9411765, 1, 1,
0.0652345, -1.368215, 2.439637, 0, 0.9333333, 1, 1,
0.06632966, 0.146796, 0.3008272, 0, 0.9294118, 1, 1,
0.07009758, 0.5010972, 0.9338369, 0, 0.9215686, 1, 1,
0.07470331, 0.9175572, 0.8216611, 0, 0.9176471, 1, 1,
0.07676554, 0.7702904, 0.7783593, 0, 0.9098039, 1, 1,
0.08207848, -1.270441, 3.679107, 0, 0.9058824, 1, 1,
0.0882309, -0.4417414, 2.54888, 0, 0.8980392, 1, 1,
0.09080058, -0.2209622, 2.03344, 0, 0.8901961, 1, 1,
0.09647733, 1.094541, -1.31598, 0, 0.8862745, 1, 1,
0.1017417, -0.4261536, 3.46212, 0, 0.8784314, 1, 1,
0.105851, 1.102079, -0.4619832, 0, 0.8745098, 1, 1,
0.1103553, 0.06592744, 1.585809, 0, 0.8666667, 1, 1,
0.1132211, 0.442638, 0.9778314, 0, 0.8627451, 1, 1,
0.1226272, -0.8604998, 5.737667, 0, 0.854902, 1, 1,
0.1318451, -0.2308208, 2.860321, 0, 0.8509804, 1, 1,
0.1362916, -0.4718361, 2.976857, 0, 0.8431373, 1, 1,
0.1375075, -0.27211, 2.009038, 0, 0.8392157, 1, 1,
0.1375856, 0.6816807, 0.1345429, 0, 0.8313726, 1, 1,
0.1419579, -0.09302086, 2.086979, 0, 0.827451, 1, 1,
0.1419662, -0.7636343, 2.06185, 0, 0.8196079, 1, 1,
0.1431361, 0.2617018, 1.156081, 0, 0.8156863, 1, 1,
0.1449108, 2.102537, 0.06134937, 0, 0.8078431, 1, 1,
0.1449386, -0.6488811, 3.257953, 0, 0.8039216, 1, 1,
0.1480832, 0.08687051, 0.1058484, 0, 0.7960784, 1, 1,
0.1493962, -0.1056093, 0.9655401, 0, 0.7882353, 1, 1,
0.1515741, -0.8356332, 4.212579, 0, 0.7843137, 1, 1,
0.1534231, -0.7723209, 2.149436, 0, 0.7764706, 1, 1,
0.1556513, 0.4548433, 0.02139818, 0, 0.772549, 1, 1,
0.1572564, -0.1811367, 3.587989, 0, 0.7647059, 1, 1,
0.1580886, -0.7558329, 3.079333, 0, 0.7607843, 1, 1,
0.1619295, -2.055893, 1.956071, 0, 0.7529412, 1, 1,
0.1631076, -1.04775, 2.515737, 0, 0.7490196, 1, 1,
0.1682056, -0.158689, 0.71472, 0, 0.7411765, 1, 1,
0.172998, 0.475186, 0.3514664, 0, 0.7372549, 1, 1,
0.1743768, -0.9475701, 2.226655, 0, 0.7294118, 1, 1,
0.1769049, 0.473501, 1.494288, 0, 0.7254902, 1, 1,
0.1782407, 0.5933261, 0.2867022, 0, 0.7176471, 1, 1,
0.183843, -0.4873741, 2.974321, 0, 0.7137255, 1, 1,
0.1879418, 0.5004333, 0.8355609, 0, 0.7058824, 1, 1,
0.188131, 3.242502, -0.1542203, 0, 0.6980392, 1, 1,
0.1883687, 0.5742071, 0.1629133, 0, 0.6941177, 1, 1,
0.1922293, -0.474242, 2.987263, 0, 0.6862745, 1, 1,
0.1991998, 0.1587111, 1.67641, 0, 0.682353, 1, 1,
0.2003204, -1.484718, 2.185536, 0, 0.6745098, 1, 1,
0.2036338, -0.9690303, 2.644772, 0, 0.6705883, 1, 1,
0.2067177, -1.118828, 3.261617, 0, 0.6627451, 1, 1,
0.209381, -0.05959378, 1.291475, 0, 0.6588235, 1, 1,
0.2122573, 0.2862114, 2.144596, 0, 0.6509804, 1, 1,
0.2143281, 1.098962, -1.777962, 0, 0.6470588, 1, 1,
0.2144414, 0.1604596, -0.004777626, 0, 0.6392157, 1, 1,
0.2211706, -0.5415248, 2.658589, 0, 0.6352941, 1, 1,
0.2223047, -1.878395, 2.118932, 0, 0.627451, 1, 1,
0.2261604, -1.695714, 1.728629, 0, 0.6235294, 1, 1,
0.2293014, 0.9131528, 2.574517, 0, 0.6156863, 1, 1,
0.230697, -0.366734, 2.568185, 0, 0.6117647, 1, 1,
0.2308257, -0.8485324, 1.950027, 0, 0.6039216, 1, 1,
0.2335501, 0.8758569, 0.5825051, 0, 0.5960785, 1, 1,
0.2354502, -1.743126, 2.343632, 0, 0.5921569, 1, 1,
0.2360409, -0.7572621, 3.113734, 0, 0.5843138, 1, 1,
0.2433813, -1.123322, 3.279643, 0, 0.5803922, 1, 1,
0.2448162, 2.039337, 0.4215361, 0, 0.572549, 1, 1,
0.2474754, 0.5473765, -0.4620465, 0, 0.5686275, 1, 1,
0.2497821, -1.176376, 3.209111, 0, 0.5607843, 1, 1,
0.2512289, 0.524728, 0.310547, 0, 0.5568628, 1, 1,
0.2527021, -0.2815494, 0.2696544, 0, 0.5490196, 1, 1,
0.260302, -0.1031357, 2.190197, 0, 0.5450981, 1, 1,
0.2608391, 2.042628, -1.944974, 0, 0.5372549, 1, 1,
0.2649473, 0.1904672, 1.274111, 0, 0.5333334, 1, 1,
0.2659536, -0.511165, 1.686904, 0, 0.5254902, 1, 1,
0.269112, 1.16872, -0.5274055, 0, 0.5215687, 1, 1,
0.2732665, -1.388142, 1.263877, 0, 0.5137255, 1, 1,
0.2823609, -0.9621896, 3.019227, 0, 0.509804, 1, 1,
0.2854472, 0.3108654, 2.312184, 0, 0.5019608, 1, 1,
0.2863769, 1.360144, -0.1743525, 0, 0.4941176, 1, 1,
0.2914949, -0.3863312, 1.69585, 0, 0.4901961, 1, 1,
0.2979176, -0.933563, 3.423003, 0, 0.4823529, 1, 1,
0.298077, -0.2329309, 2.636992, 0, 0.4784314, 1, 1,
0.3125198, -1.674644, 3.151204, 0, 0.4705882, 1, 1,
0.3139763, -0.4480218, 1.484306, 0, 0.4666667, 1, 1,
0.3184018, 2.970847, 0.7722923, 0, 0.4588235, 1, 1,
0.327234, -0.4930424, 1.471579, 0, 0.454902, 1, 1,
0.3318919, -0.132655, 1.867025, 0, 0.4470588, 1, 1,
0.3354039, 1.78015, 1.5146, 0, 0.4431373, 1, 1,
0.3358995, -1.242532, 2.987543, 0, 0.4352941, 1, 1,
0.3360844, -0.05532346, 1.767033, 0, 0.4313726, 1, 1,
0.338247, -1.520547, 3.973244, 0, 0.4235294, 1, 1,
0.3492762, 0.4335853, -1.320428, 0, 0.4196078, 1, 1,
0.3495816, -0.9675451, 4.289778, 0, 0.4117647, 1, 1,
0.3510893, -1.504076, 3.67613, 0, 0.4078431, 1, 1,
0.3517087, -2.342732, 3.877288, 0, 0.4, 1, 1,
0.3518651, -0.3481066, 2.64793, 0, 0.3921569, 1, 1,
0.3551147, -0.7291628, 2.594665, 0, 0.3882353, 1, 1,
0.3557875, -1.101147, 2.391915, 0, 0.3803922, 1, 1,
0.3567828, 0.5345014, 0.1527347, 0, 0.3764706, 1, 1,
0.3568911, 1.183334, 0.6907658, 0, 0.3686275, 1, 1,
0.3610664, 0.4921197, 1.415754, 0, 0.3647059, 1, 1,
0.3691967, -0.771266, 1.914322, 0, 0.3568628, 1, 1,
0.3718549, -1.303818, 0.6433651, 0, 0.3529412, 1, 1,
0.3723903, -0.3587188, 2.403351, 0, 0.345098, 1, 1,
0.3752954, -0.715461, 1.707605, 0, 0.3411765, 1, 1,
0.3766642, 0.00599888, 2.146861, 0, 0.3333333, 1, 1,
0.3769771, 0.5167281, 0.4141974, 0, 0.3294118, 1, 1,
0.3793748, 0.7727844, 1.407634, 0, 0.3215686, 1, 1,
0.3850136, -0.2039104, 2.696121, 0, 0.3176471, 1, 1,
0.3861476, -1.214807, 1.761428, 0, 0.3098039, 1, 1,
0.3927477, 0.4954901, -1.055454, 0, 0.3058824, 1, 1,
0.3937854, -0.1619325, 2.124114, 0, 0.2980392, 1, 1,
0.3947501, -0.7973366, 2.221233, 0, 0.2901961, 1, 1,
0.3951451, 1.012095, 1.229924, 0, 0.2862745, 1, 1,
0.395301, 0.7460038, 0.3063763, 0, 0.2784314, 1, 1,
0.3958158, -0.7317108, 1.094709, 0, 0.2745098, 1, 1,
0.3961611, 1.131059, 1.311779, 0, 0.2666667, 1, 1,
0.3966264, -0.1001345, 3.209681, 0, 0.2627451, 1, 1,
0.3990538, -0.1137433, 2.385021, 0, 0.254902, 1, 1,
0.3997393, 0.8749282, 2.214533, 0, 0.2509804, 1, 1,
0.4017348, -0.6783637, 0.9281647, 0, 0.2431373, 1, 1,
0.4035098, 0.235935, 3.004063, 0, 0.2392157, 1, 1,
0.4049581, -0.9779826, 2.989128, 0, 0.2313726, 1, 1,
0.4052538, 0.3789605, 1.172535, 0, 0.227451, 1, 1,
0.4070134, 0.004902203, 3.168664, 0, 0.2196078, 1, 1,
0.4075449, 0.1078069, 1.319022, 0, 0.2156863, 1, 1,
0.4089264, 0.3126715, 0.6797135, 0, 0.2078431, 1, 1,
0.409924, 0.1918096, 1.286668, 0, 0.2039216, 1, 1,
0.4119385, 0.5289143, 1.232725, 0, 0.1960784, 1, 1,
0.4126709, -0.1995204, 3.110685, 0, 0.1882353, 1, 1,
0.4196099, 0.5211286, 2.664928, 0, 0.1843137, 1, 1,
0.4198119, 1.737113, 0.788331, 0, 0.1764706, 1, 1,
0.4205455, 2.132053, 0.8062695, 0, 0.172549, 1, 1,
0.4230115, -0.7675465, 4.454445, 0, 0.1647059, 1, 1,
0.425934, -1.20104, 3.855125, 0, 0.1607843, 1, 1,
0.4265457, -0.6701244, 4.050334, 0, 0.1529412, 1, 1,
0.4284886, -1.256131, 2.834682, 0, 0.1490196, 1, 1,
0.4305942, 1.296451, 0.6245259, 0, 0.1411765, 1, 1,
0.4373471, 0.418796, 0.0675671, 0, 0.1372549, 1, 1,
0.4485073, 0.6658587, -0.5975753, 0, 0.1294118, 1, 1,
0.4511165, -0.4174834, 1.76853, 0, 0.1254902, 1, 1,
0.4520267, -1.332478, 2.193182, 0, 0.1176471, 1, 1,
0.4606945, 0.7344295, -0.3356669, 0, 0.1137255, 1, 1,
0.4657407, -0.6141018, 2.178882, 0, 0.1058824, 1, 1,
0.4679751, 1.550397, 0.01065643, 0, 0.09803922, 1, 1,
0.4686439, 0.4330943, 1.44694, 0, 0.09411765, 1, 1,
0.4707308, 0.02111817, 0.9972031, 0, 0.08627451, 1, 1,
0.4711824, 0.2529062, 1.283605, 0, 0.08235294, 1, 1,
0.4722787, 1.218614, 0.3366924, 0, 0.07450981, 1, 1,
0.4743831, -1.723281, 3.297832, 0, 0.07058824, 1, 1,
0.4748825, 0.9599746, 1.910242, 0, 0.0627451, 1, 1,
0.4788336, -1.106634, 2.256032, 0, 0.05882353, 1, 1,
0.4797898, -0.4133056, 4.321457, 0, 0.05098039, 1, 1,
0.4820924, -1.779027, 3.916374, 0, 0.04705882, 1, 1,
0.4874519, 2.451099, -1.227091, 0, 0.03921569, 1, 1,
0.4903553, 1.503284, 0.4940864, 0, 0.03529412, 1, 1,
0.4909626, -1.216176, 3.070878, 0, 0.02745098, 1, 1,
0.492956, 0.3135141, 0.4570624, 0, 0.02352941, 1, 1,
0.4937057, 0.4493033, 1.25224, 0, 0.01568628, 1, 1,
0.493927, 0.078, 0.7031961, 0, 0.01176471, 1, 1,
0.4942007, -0.170838, 2.281764, 0, 0.003921569, 1, 1,
0.5014579, 0.1696038, 0.4299851, 0.003921569, 0, 1, 1,
0.5071877, 1.594907, -0.8267558, 0.007843138, 0, 1, 1,
0.5076476, -0.7430002, 0.613286, 0.01568628, 0, 1, 1,
0.5084951, -0.9876752, 2.967432, 0.01960784, 0, 1, 1,
0.5087958, 0.1865064, 1.70374, 0.02745098, 0, 1, 1,
0.509126, 0.2149399, 2.000695, 0.03137255, 0, 1, 1,
0.5180103, -1.667711, 2.644809, 0.03921569, 0, 1, 1,
0.5208148, 1.031752, 1.374796, 0.04313726, 0, 1, 1,
0.5315911, -0.2617369, 2.485815, 0.05098039, 0, 1, 1,
0.5323716, 0.8619425, 0.8699652, 0.05490196, 0, 1, 1,
0.5337524, 1.82958, 0.7384881, 0.0627451, 0, 1, 1,
0.5344521, 0.6332036, 0.5494366, 0.06666667, 0, 1, 1,
0.5350851, -1.491093, 3.243026, 0.07450981, 0, 1, 1,
0.5354387, -0.8798428, 1.598158, 0.07843138, 0, 1, 1,
0.5368617, 0.2227594, 1.018923, 0.08627451, 0, 1, 1,
0.5384685, 0.6991429, 0.2435569, 0.09019608, 0, 1, 1,
0.5413549, 0.645577, 1.492322, 0.09803922, 0, 1, 1,
0.5426872, -0.3645719, 4.059887, 0.1058824, 0, 1, 1,
0.5441016, 1.438945, 1.164382, 0.1098039, 0, 1, 1,
0.54469, -0.1269397, 2.733773, 0.1176471, 0, 1, 1,
0.5456421, 0.4770998, -0.8700714, 0.1215686, 0, 1, 1,
0.5538887, -0.7850081, 2.411515, 0.1294118, 0, 1, 1,
0.55672, 1.28938, -0.3362545, 0.1333333, 0, 1, 1,
0.5606022, -0.6684367, 1.961475, 0.1411765, 0, 1, 1,
0.5619672, 0.1958046, 2.553006, 0.145098, 0, 1, 1,
0.5625696, 1.513271, 2.512614, 0.1529412, 0, 1, 1,
0.5674659, 0.4556253, -0.1285696, 0.1568628, 0, 1, 1,
0.5736242, 0.9954019, -2.804285, 0.1647059, 0, 1, 1,
0.5758977, 0.6030707, 0.3492024, 0.1686275, 0, 1, 1,
0.5777861, 2.007486, -0.3931998, 0.1764706, 0, 1, 1,
0.5780795, -0.02574538, 1.20004, 0.1803922, 0, 1, 1,
0.5852745, -0.6860374, 2.612584, 0.1882353, 0, 1, 1,
0.5860964, -0.9386423, 3.881544, 0.1921569, 0, 1, 1,
0.5863073, 1.006475, 1.354541, 0.2, 0, 1, 1,
0.5892155, 1.206748, 1.811924, 0.2078431, 0, 1, 1,
0.5894535, 1.004261, 0.7755806, 0.2117647, 0, 1, 1,
0.5897567, -0.02941758, 1.598163, 0.2196078, 0, 1, 1,
0.5912873, 0.4334325, 1.134859, 0.2235294, 0, 1, 1,
0.5930356, -0.6498753, 0.6324266, 0.2313726, 0, 1, 1,
0.5931147, -0.07596673, -0.8433085, 0.2352941, 0, 1, 1,
0.5958578, 0.4147736, 1.53521, 0.2431373, 0, 1, 1,
0.5973843, 0.9587997, 0.07762064, 0.2470588, 0, 1, 1,
0.5992709, 0.5070962, 0.4553697, 0.254902, 0, 1, 1,
0.600595, 0.8908108, -1.275777, 0.2588235, 0, 1, 1,
0.6036083, 0.08511209, 2.877596, 0.2666667, 0, 1, 1,
0.6037608, 0.1093837, 1.376918, 0.2705882, 0, 1, 1,
0.6068292, -0.9119764, 1.709125, 0.2784314, 0, 1, 1,
0.6075968, 0.4985945, 2.878901, 0.282353, 0, 1, 1,
0.6127412, 0.6678181, 1.074778, 0.2901961, 0, 1, 1,
0.6149417, -0.7858854, 2.913498, 0.2941177, 0, 1, 1,
0.6261077, 0.0999901, 0.7703092, 0.3019608, 0, 1, 1,
0.6268739, -1.860634, 2.154131, 0.3098039, 0, 1, 1,
0.6272046, 0.8925243, 1.279902, 0.3137255, 0, 1, 1,
0.6308653, -1.441795, 2.601948, 0.3215686, 0, 1, 1,
0.6360943, 0.9146487, -0.7677901, 0.3254902, 0, 1, 1,
0.6386296, -1.68997, 4.454933, 0.3333333, 0, 1, 1,
0.6406139, 0.2652316, 0.2561332, 0.3372549, 0, 1, 1,
0.6493415, 0.4653145, -0.02019599, 0.345098, 0, 1, 1,
0.6495602, -0.2282042, 1.815979, 0.3490196, 0, 1, 1,
0.6509147, 1.244071, 1.827711, 0.3568628, 0, 1, 1,
0.6538399, 1.588543, -0.2169082, 0.3607843, 0, 1, 1,
0.6684325, -0.01978306, 2.454039, 0.3686275, 0, 1, 1,
0.6702152, -0.1867398, 2.183799, 0.372549, 0, 1, 1,
0.6707605, 1.199723, 0.7150267, 0.3803922, 0, 1, 1,
0.6762699, -0.8447463, 2.256272, 0.3843137, 0, 1, 1,
0.6800207, -1.231567, 4.468472, 0.3921569, 0, 1, 1,
0.6806813, 0.4896003, 0.4650173, 0.3960784, 0, 1, 1,
0.6820131, 0.09536319, 0.9220113, 0.4039216, 0, 1, 1,
0.6826212, 0.9452276, 0.6979191, 0.4117647, 0, 1, 1,
0.691885, 1.529142, -1.592276, 0.4156863, 0, 1, 1,
0.6958204, -1.387077, 1.808014, 0.4235294, 0, 1, 1,
0.6966648, -0.6641328, 3.874784, 0.427451, 0, 1, 1,
0.6983869, 0.4188382, 0.1369782, 0.4352941, 0, 1, 1,
0.7031673, -1.018963, 1.857984, 0.4392157, 0, 1, 1,
0.7129931, -0.1553106, 2.003788, 0.4470588, 0, 1, 1,
0.7130567, -2.079062, 3.032073, 0.4509804, 0, 1, 1,
0.7140605, -0.1566419, 1.372458, 0.4588235, 0, 1, 1,
0.7154645, 0.7812964, 1.934231, 0.4627451, 0, 1, 1,
0.7155787, 0.2017331, -1.343517, 0.4705882, 0, 1, 1,
0.7161137, -0.6699974, 3.666962, 0.4745098, 0, 1, 1,
0.7211821, -0.5588281, 3.308055, 0.4823529, 0, 1, 1,
0.722048, -0.8817452, 2.246911, 0.4862745, 0, 1, 1,
0.7231901, -1.258446, 1.897245, 0.4941176, 0, 1, 1,
0.7233603, -1.947816, 4.779918, 0.5019608, 0, 1, 1,
0.7255007, 0.0929335, 2.741707, 0.5058824, 0, 1, 1,
0.727963, -0.3805191, 0.6536873, 0.5137255, 0, 1, 1,
0.7300457, 0.7948414, 0.2344455, 0.5176471, 0, 1, 1,
0.7456147, 0.03771336, 1.23979, 0.5254902, 0, 1, 1,
0.7484052, -0.8088032, 2.224398, 0.5294118, 0, 1, 1,
0.7512771, 1.712109, 0.260656, 0.5372549, 0, 1, 1,
0.7571409, -0.7601833, 2.055948, 0.5411765, 0, 1, 1,
0.7701501, 0.9287773, 1.307039, 0.5490196, 0, 1, 1,
0.7716187, 1.104408, 1.200107, 0.5529412, 0, 1, 1,
0.7734921, -0.5993623, 2.922574, 0.5607843, 0, 1, 1,
0.7861691, -0.4511081, 2.450142, 0.5647059, 0, 1, 1,
0.7865569, -0.3280821, 2.26591, 0.572549, 0, 1, 1,
0.7869143, 0.7095692, 2.637662, 0.5764706, 0, 1, 1,
0.7869247, 0.04336699, 0.966, 0.5843138, 0, 1, 1,
0.7909955, -0.5610822, 2.759905, 0.5882353, 0, 1, 1,
0.7925456, 1.870005, -0.08922069, 0.5960785, 0, 1, 1,
0.7926354, 0.7963709, 0.1083694, 0.6039216, 0, 1, 1,
0.798793, -1.143955, 3.116262, 0.6078432, 0, 1, 1,
0.8078012, -0.2152673, 1.704811, 0.6156863, 0, 1, 1,
0.8079525, -0.2938903, 2.421833, 0.6196079, 0, 1, 1,
0.808971, -0.2237474, 0.5955085, 0.627451, 0, 1, 1,
0.8095174, -0.1835987, 3.391076, 0.6313726, 0, 1, 1,
0.8095379, -1.074214, 3.072453, 0.6392157, 0, 1, 1,
0.8104324, 0.2953564, -1.062157, 0.6431373, 0, 1, 1,
0.8131539, 0.2250642, 0.9361963, 0.6509804, 0, 1, 1,
0.8139709, -0.3029602, 2.416154, 0.654902, 0, 1, 1,
0.8143883, 1.465145, 3.346271, 0.6627451, 0, 1, 1,
0.8146968, -2.993429, 3.055744, 0.6666667, 0, 1, 1,
0.814927, 0.6295699, -0.1865529, 0.6745098, 0, 1, 1,
0.8152598, -0.6711096, 3.79108, 0.6784314, 0, 1, 1,
0.8232153, -1.06113, 1.473083, 0.6862745, 0, 1, 1,
0.8347641, 1.714139, -0.2759764, 0.6901961, 0, 1, 1,
0.8394545, -1.620901, 1.797136, 0.6980392, 0, 1, 1,
0.8394583, -0.06514528, 0.1076917, 0.7058824, 0, 1, 1,
0.8427178, -0.5388213, 2.529494, 0.7098039, 0, 1, 1,
0.8451663, -0.6109266, 2.718581, 0.7176471, 0, 1, 1,
0.8469442, -0.04504647, 1.550341, 0.7215686, 0, 1, 1,
0.8574263, 0.1821524, 1.812208, 0.7294118, 0, 1, 1,
0.8607289, -0.2349477, 2.3247, 0.7333333, 0, 1, 1,
0.8632444, -1.628492, 2.033204, 0.7411765, 0, 1, 1,
0.8646968, 0.427694, 2.624698, 0.7450981, 0, 1, 1,
0.8658268, 1.222837, 0.2700445, 0.7529412, 0, 1, 1,
0.8737429, -0.08507676, 1.685026, 0.7568628, 0, 1, 1,
0.8769857, -0.5126238, 2.848052, 0.7647059, 0, 1, 1,
0.8778836, -0.9139733, 3.453141, 0.7686275, 0, 1, 1,
0.878175, 1.365888, 0.8272741, 0.7764706, 0, 1, 1,
0.8783396, -0.7389821, 1.399522, 0.7803922, 0, 1, 1,
0.878879, 0.2887096, -0.02404963, 0.7882353, 0, 1, 1,
0.8868966, 0.7414745, 1.847884, 0.7921569, 0, 1, 1,
0.8956855, 0.5438662, 2.733916, 0.8, 0, 1, 1,
0.8964087, 0.1858772, 1.399237, 0.8078431, 0, 1, 1,
0.8979286, -0.6038052, 1.941121, 0.8117647, 0, 1, 1,
0.8992642, -1.381491, 3.918433, 0.8196079, 0, 1, 1,
0.9040966, -0.2032325, 0.6981771, 0.8235294, 0, 1, 1,
0.9055764, -0.265576, 0.9003442, 0.8313726, 0, 1, 1,
0.9089665, -0.1113478, 0.675649, 0.8352941, 0, 1, 1,
0.9126369, 0.05519706, 1.975684, 0.8431373, 0, 1, 1,
0.9146776, -1.021714, 1.381843, 0.8470588, 0, 1, 1,
0.9184175, -0.1240045, 1.794988, 0.854902, 0, 1, 1,
0.9233499, 1.11381, 0.1343092, 0.8588235, 0, 1, 1,
0.9273881, -0.1362874, 1.756752, 0.8666667, 0, 1, 1,
0.9274367, 0.8737776, 0.2800491, 0.8705882, 0, 1, 1,
0.9340654, 1.166746, 1.015012, 0.8784314, 0, 1, 1,
0.9350697, -0.4646491, 1.44229, 0.8823529, 0, 1, 1,
0.9373028, -0.2292544, 1.643809, 0.8901961, 0, 1, 1,
0.9399363, 0.3378617, -0.6406686, 0.8941177, 0, 1, 1,
0.9413025, 1.85734, 0.2336204, 0.9019608, 0, 1, 1,
0.9450926, -1.284303, 0.8446409, 0.9098039, 0, 1, 1,
0.9462243, 1.127541, 1.63493, 0.9137255, 0, 1, 1,
0.9478566, 0.4588292, 0.07211936, 0.9215686, 0, 1, 1,
0.9487392, 0.7558606, -1.10605, 0.9254902, 0, 1, 1,
0.949304, -1.524226, 2.089685, 0.9333333, 0, 1, 1,
0.9525843, 0.9097024, 1.097725, 0.9372549, 0, 1, 1,
0.9564831, 0.2688613, -0.611952, 0.945098, 0, 1, 1,
0.9574105, -0.4708135, 0.7856827, 0.9490196, 0, 1, 1,
0.9595775, -1.518103, 4.479993, 0.9568627, 0, 1, 1,
0.9600568, -0.3325006, 1.866262, 0.9607843, 0, 1, 1,
0.9685324, 0.3614032, 1.678, 0.9686275, 0, 1, 1,
0.9757682, -0.7542024, 2.643916, 0.972549, 0, 1, 1,
0.979145, 1.491748, 1.569546, 0.9803922, 0, 1, 1,
0.9847288, -1.991752, 2.950363, 0.9843137, 0, 1, 1,
0.9872386, 1.248532, 0.9283283, 0.9921569, 0, 1, 1,
0.9909533, -1.602996, 4.010228, 0.9960784, 0, 1, 1,
0.9931929, 0.7752487, 1.578204, 1, 0, 0.9960784, 1,
0.9971362, 0.405067, 1.638901, 1, 0, 0.9882353, 1,
0.9991949, 2.38219, 2.573326, 1, 0, 0.9843137, 1,
1.005555, -0.5038165, 1.421863, 1, 0, 0.9764706, 1,
1.012866, 0.7493749, -0.3928722, 1, 0, 0.972549, 1,
1.018687, -0.1064551, 1.621786, 1, 0, 0.9647059, 1,
1.027171, 0.1706385, 1.715303, 1, 0, 0.9607843, 1,
1.031838, 0.540152, 3.113507, 1, 0, 0.9529412, 1,
1.032209, -0.8357947, 3.082038, 1, 0, 0.9490196, 1,
1.033167, 1.868324, 1.634073, 1, 0, 0.9411765, 1,
1.034749, -0.8547212, 0.1652007, 1, 0, 0.9372549, 1,
1.038474, 0.4479664, 0.06944334, 1, 0, 0.9294118, 1,
1.048681, 0.9341655, 0.1136116, 1, 0, 0.9254902, 1,
1.054516, -0.09519564, 2.565679, 1, 0, 0.9176471, 1,
1.059347, 0.02124136, 3.238666, 1, 0, 0.9137255, 1,
1.062938, 2.295527, 0.1475288, 1, 0, 0.9058824, 1,
1.068983, -0.7629699, 3.705554, 1, 0, 0.9019608, 1,
1.069965, -0.2979892, 2.008567, 1, 0, 0.8941177, 1,
1.070816, 0.2230174, 1.268879, 1, 0, 0.8862745, 1,
1.084413, 0.08113243, 0.9571639, 1, 0, 0.8823529, 1,
1.085535, -0.2928254, 0.5061742, 1, 0, 0.8745098, 1,
1.090744, 0.5400006, 0.2932018, 1, 0, 0.8705882, 1,
1.097299, 0.2625839, 0.9638757, 1, 0, 0.8627451, 1,
1.103972, -0.06953125, 2.211694, 1, 0, 0.8588235, 1,
1.107026, -0.3315946, 1.991983, 1, 0, 0.8509804, 1,
1.107718, -0.8615652, 2.098513, 1, 0, 0.8470588, 1,
1.108399, 0.2835606, -0.05098483, 1, 0, 0.8392157, 1,
1.110508, 0.06700138, 1.900879, 1, 0, 0.8352941, 1,
1.110672, 0.4089303, 1.992579, 1, 0, 0.827451, 1,
1.110878, 1.563374, 2.364572, 1, 0, 0.8235294, 1,
1.111569, -1.398351, 2.346099, 1, 0, 0.8156863, 1,
1.11984, -0.5388804, 2.063912, 1, 0, 0.8117647, 1,
1.125082, 1.448243, -0.4038509, 1, 0, 0.8039216, 1,
1.131766, 0.2615288, 3.46759, 1, 0, 0.7960784, 1,
1.133571, 0.3094187, 0.9626123, 1, 0, 0.7921569, 1,
1.146492, 0.6614633, 2.92842, 1, 0, 0.7843137, 1,
1.147066, -1.553787, 3.007341, 1, 0, 0.7803922, 1,
1.150513, -1.026839, 1.717613, 1, 0, 0.772549, 1,
1.151612, 0.766956, 0.5974171, 1, 0, 0.7686275, 1,
1.156071, -0.7122982, 2.685964, 1, 0, 0.7607843, 1,
1.156528, 0.7764392, 0.10583, 1, 0, 0.7568628, 1,
1.162455, 0.7313932, 1.178092, 1, 0, 0.7490196, 1,
1.173892, -0.3795775, 1.582155, 1, 0, 0.7450981, 1,
1.177007, -0.8982178, 3.926044, 1, 0, 0.7372549, 1,
1.182436, -0.3591047, 2.604791, 1, 0, 0.7333333, 1,
1.183244, 0.8331799, 2.885954, 1, 0, 0.7254902, 1,
1.184819, 0.744745, 1.977947, 1, 0, 0.7215686, 1,
1.190167, -0.7788639, 2.327089, 1, 0, 0.7137255, 1,
1.203703, -1.332941, 2.784911, 1, 0, 0.7098039, 1,
1.215015, 0.7040871, 0.5122858, 1, 0, 0.7019608, 1,
1.227295, -1.125312, 1.582583, 1, 0, 0.6941177, 1,
1.23101, 0.6911432, 1.309434, 1, 0, 0.6901961, 1,
1.237027, -0.9324384, 3.175694, 1, 0, 0.682353, 1,
1.237587, 0.4296511, 1.828225, 1, 0, 0.6784314, 1,
1.242984, 0.9263861, 0.5480963, 1, 0, 0.6705883, 1,
1.24816, 0.06442408, 3.606977, 1, 0, 0.6666667, 1,
1.254779, -0.6790839, 4.033587, 1, 0, 0.6588235, 1,
1.254823, 2.011146, 0.7069342, 1, 0, 0.654902, 1,
1.262515, -0.3081383, 0.3870246, 1, 0, 0.6470588, 1,
1.264117, 0.9871361, 0.4316278, 1, 0, 0.6431373, 1,
1.267255, 1.79053, 0.2819895, 1, 0, 0.6352941, 1,
1.268539, 1.540306, 0.6069641, 1, 0, 0.6313726, 1,
1.272569, -0.1479529, 2.176769, 1, 0, 0.6235294, 1,
1.272924, -0.8861558, 0.9098852, 1, 0, 0.6196079, 1,
1.276125, 0.368643, 1.39947, 1, 0, 0.6117647, 1,
1.282867, -0.3031737, 0.9342253, 1, 0, 0.6078432, 1,
1.29025, 0.1578328, 1.105183, 1, 0, 0.6, 1,
1.310209, 1.05955, -0.2733348, 1, 0, 0.5921569, 1,
1.318151, -0.7207199, 1.265018, 1, 0, 0.5882353, 1,
1.327714, -0.9739209, 1.478916, 1, 0, 0.5803922, 1,
1.336815, -0.5263009, 2.670574, 1, 0, 0.5764706, 1,
1.339582, -0.00660299, 0.5281551, 1, 0, 0.5686275, 1,
1.362926, 0.2587813, 0.7162124, 1, 0, 0.5647059, 1,
1.367603, 0.3398408, 1.663762, 1, 0, 0.5568628, 1,
1.374844, 1.221161, 0.8443708, 1, 0, 0.5529412, 1,
1.375738, -0.703306, 2.556523, 1, 0, 0.5450981, 1,
1.382732, -1.345109, 2.482089, 1, 0, 0.5411765, 1,
1.390671, 0.4137031, 2.410233, 1, 0, 0.5333334, 1,
1.393577, 0.9472061, 1.174868, 1, 0, 0.5294118, 1,
1.405977, 1.231994, 2.234917, 1, 0, 0.5215687, 1,
1.41256, 2.435807, -0.07758743, 1, 0, 0.5176471, 1,
1.419889, 1.874443, 0.3735209, 1, 0, 0.509804, 1,
1.419893, 0.9523858, 3.864516, 1, 0, 0.5058824, 1,
1.429499, 0.9164613, 1.418481, 1, 0, 0.4980392, 1,
1.446252, 0.5170853, 2.643238, 1, 0, 0.4901961, 1,
1.463953, -0.1908527, 1.982293, 1, 0, 0.4862745, 1,
1.482876, 0.2773291, 1.436007, 1, 0, 0.4784314, 1,
1.485277, -0.4108711, 0.9088762, 1, 0, 0.4745098, 1,
1.495185, -0.311124, 1.756477, 1, 0, 0.4666667, 1,
1.498091, -1.55113, 2.284895, 1, 0, 0.4627451, 1,
1.498886, -0.9267689, 1.919987, 1, 0, 0.454902, 1,
1.501381, 0.2998683, 1.582266, 1, 0, 0.4509804, 1,
1.501581, 0.111622, 0.1770252, 1, 0, 0.4431373, 1,
1.502338, -0.2028493, 1.412388, 1, 0, 0.4392157, 1,
1.503764, 2.734524, 1.113907, 1, 0, 0.4313726, 1,
1.506097, -0.3876119, 2.20296, 1, 0, 0.427451, 1,
1.516889, 0.7552978, 1.026332, 1, 0, 0.4196078, 1,
1.527747, -0.4712825, 2.062433, 1, 0, 0.4156863, 1,
1.54795, -0.9510105, 2.711996, 1, 0, 0.4078431, 1,
1.55408, 2.002745, 0.7400281, 1, 0, 0.4039216, 1,
1.557776, 0.4310084, 2.374052, 1, 0, 0.3960784, 1,
1.560891, 2.32243, 0.9946608, 1, 0, 0.3882353, 1,
1.564663, -0.06537188, 1.366819, 1, 0, 0.3843137, 1,
1.575725, 0.01357055, 2.53159, 1, 0, 0.3764706, 1,
1.588324, -1.853627, 1.234168, 1, 0, 0.372549, 1,
1.608649, 0.2226996, 1.174453, 1, 0, 0.3647059, 1,
1.611311, -1.446514, 2.302768, 1, 0, 0.3607843, 1,
1.615492, 2.049084, 1.855794, 1, 0, 0.3529412, 1,
1.615857, -0.6589656, 2.458428, 1, 0, 0.3490196, 1,
1.626085, -0.8504263, 1.699144, 1, 0, 0.3411765, 1,
1.627313, 0.3801576, 1.826879, 1, 0, 0.3372549, 1,
1.632978, 0.06279681, 3.473983, 1, 0, 0.3294118, 1,
1.647735, -0.7242293, 2.091805, 1, 0, 0.3254902, 1,
1.649177, -0.01838581, 0.8114712, 1, 0, 0.3176471, 1,
1.658793, 0.3651129, 3.304547, 1, 0, 0.3137255, 1,
1.663441, 0.2167826, 1.48818, 1, 0, 0.3058824, 1,
1.669547, 0.1849292, 1.813788, 1, 0, 0.2980392, 1,
1.674139, -0.9931756, 3.036791, 1, 0, 0.2941177, 1,
1.680481, 1.01838, 1.33429, 1, 0, 0.2862745, 1,
1.684357, 0.3835597, 0.7049311, 1, 0, 0.282353, 1,
1.689655, 0.8998582, 1.244197, 1, 0, 0.2745098, 1,
1.696607, 0.4165211, 2.698593, 1, 0, 0.2705882, 1,
1.697511, -0.4535624, 2.683399, 1, 0, 0.2627451, 1,
1.717991, 1.566175, 1.511402, 1, 0, 0.2588235, 1,
1.731622, 0.270579, 3.095583, 1, 0, 0.2509804, 1,
1.759911, 1.055854, 2.570544, 1, 0, 0.2470588, 1,
1.762173, -1.44495, 1.738366, 1, 0, 0.2392157, 1,
1.787914, -0.4438508, 2.836219, 1, 0, 0.2352941, 1,
1.793066, -1.661068, 1.240871, 1, 0, 0.227451, 1,
1.807789, -1.73221, 2.507399, 1, 0, 0.2235294, 1,
1.810168, -0.4899187, 1.647033, 1, 0, 0.2156863, 1,
1.820839, -0.03109705, 2.75605, 1, 0, 0.2117647, 1,
1.828855, -0.01154955, 2.943784, 1, 0, 0.2039216, 1,
1.837874, 1.095332, 0.1258653, 1, 0, 0.1960784, 1,
1.856841, -0.3403292, 1.926186, 1, 0, 0.1921569, 1,
1.883167, 0.9961898, 2.348644, 1, 0, 0.1843137, 1,
1.887892, 0.6023324, 2.221319, 1, 0, 0.1803922, 1,
1.891155, 0.5102766, 0.4671914, 1, 0, 0.172549, 1,
1.916509, -0.01633383, 0.5872223, 1, 0, 0.1686275, 1,
1.927419, -0.8849434, 4.001105, 1, 0, 0.1607843, 1,
1.941391, -1.468015, 2.18761, 1, 0, 0.1568628, 1,
1.950359, -1.320073, 2.666718, 1, 0, 0.1490196, 1,
1.958019, -0.4578946, 2.605062, 1, 0, 0.145098, 1,
1.965964, 0.111861, -0.5261469, 1, 0, 0.1372549, 1,
1.971053, 0.6790127, -0.8542542, 1, 0, 0.1333333, 1,
2.011612, 1.70546, 1.35101, 1, 0, 0.1254902, 1,
2.012314, 0.2607927, 0.6777922, 1, 0, 0.1215686, 1,
2.060985, 0.08689207, -0.3028378, 1, 0, 0.1137255, 1,
2.065701, 0.1271856, 0.9770203, 1, 0, 0.1098039, 1,
2.182043, 0.5290158, 1.307961, 1, 0, 0.1019608, 1,
2.201078, -0.01233287, 0.9794398, 1, 0, 0.09411765, 1,
2.205628, -0.7802196, -0.1733103, 1, 0, 0.09019608, 1,
2.240681, 0.2082361, 1.944151, 1, 0, 0.08235294, 1,
2.272646, -0.9533018, 1.425696, 1, 0, 0.07843138, 1,
2.304758, 0.2034012, 0.6710726, 1, 0, 0.07058824, 1,
2.360638, 0.03815389, 4.075719, 1, 0, 0.06666667, 1,
2.369081, -0.02919553, 2.719612, 1, 0, 0.05882353, 1,
2.519403, -0.3299071, 2.365562, 1, 0, 0.05490196, 1,
2.533926, 0.5621054, 1.492103, 1, 0, 0.04705882, 1,
2.596593, -1.223854, 2.683088, 1, 0, 0.04313726, 1,
2.639602, -0.5634286, 2.544714, 1, 0, 0.03529412, 1,
2.897102, -0.5165895, 2.356118, 1, 0, 0.03137255, 1,
2.94137, 0.4037597, 0.931618, 1, 0, 0.02352941, 1,
2.96624, 0.5031475, 2.416091, 1, 0, 0.01960784, 1,
2.996587, 0.5376843, 1.743644, 1, 0, 0.01176471, 1,
3.241332, 0.1198959, 1.814991, 1, 0, 0.007843138, 1
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
0.03546894, -4.516255, -7.48403, 0, -0.5, 0.5, 0.5,
0.03546894, -4.516255, -7.48403, 1, -0.5, 0.5, 0.5,
0.03546894, -4.516255, -7.48403, 1, 1.5, 0.5, 0.5,
0.03546894, -4.516255, -7.48403, 0, 1.5, 0.5, 0.5
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
-4.257182, -0.0746237, -7.48403, 0, -0.5, 0.5, 0.5,
-4.257182, -0.0746237, -7.48403, 1, -0.5, 0.5, 0.5,
-4.257182, -0.0746237, -7.48403, 1, 1.5, 0.5, 0.5,
-4.257182, -0.0746237, -7.48403, 0, 1.5, 0.5, 0.5
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
-4.257182, -4.516255, 0.08495331, 0, -0.5, 0.5, 0.5,
-4.257182, -4.516255, 0.08495331, 1, -0.5, 0.5, 0.5,
-4.257182, -4.516255, 0.08495331, 1, 1.5, 0.5, 0.5,
-4.257182, -4.516255, 0.08495331, 0, 1.5, 0.5, 0.5
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
-3, -3.491263, -5.737341,
3, -3.491263, -5.737341,
-3, -3.491263, -5.737341,
-3, -3.662095, -6.028456,
-2, -3.491263, -5.737341,
-2, -3.662095, -6.028456,
-1, -3.491263, -5.737341,
-1, -3.662095, -6.028456,
0, -3.491263, -5.737341,
0, -3.662095, -6.028456,
1, -3.491263, -5.737341,
1, -3.662095, -6.028456,
2, -3.491263, -5.737341,
2, -3.662095, -6.028456,
3, -3.491263, -5.737341,
3, -3.662095, -6.028456
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
-3, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
-3, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
-3, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
-3, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
-2, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
-2, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
-2, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
-2, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
-1, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
-1, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
-1, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
-1, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
0, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
0, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
0, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
0, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
1, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
1, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
1, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
1, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
2, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
2, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
2, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
2, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5,
3, -4.003759, -6.610686, 0, -0.5, 0.5, 0.5,
3, -4.003759, -6.610686, 1, -0.5, 0.5, 0.5,
3, -4.003759, -6.610686, 1, 1.5, 0.5, 0.5,
3, -4.003759, -6.610686, 0, 1.5, 0.5, 0.5
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
-3.26657, -3, -5.737341,
-3.26657, 3, -5.737341,
-3.26657, -3, -5.737341,
-3.431672, -3, -6.028456,
-3.26657, -2, -5.737341,
-3.431672, -2, -6.028456,
-3.26657, -1, -5.737341,
-3.431672, -1, -6.028456,
-3.26657, 0, -5.737341,
-3.431672, 0, -6.028456,
-3.26657, 1, -5.737341,
-3.431672, 1, -6.028456,
-3.26657, 2, -5.737341,
-3.431672, 2, -6.028456,
-3.26657, 3, -5.737341,
-3.431672, 3, -6.028456
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
-3.761876, -3, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, -3, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, -3, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, -3, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, -2, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, -2, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, -2, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, -2, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, -1, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, -1, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, -1, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, -1, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, 0, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, 0, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, 0, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, 0, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, 1, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, 1, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, 1, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, 1, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, 2, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, 2, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, 2, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, 2, -6.610686, 0, 1.5, 0.5, 0.5,
-3.761876, 3, -6.610686, 0, -0.5, 0.5, 0.5,
-3.761876, 3, -6.610686, 1, -0.5, 0.5, 0.5,
-3.761876, 3, -6.610686, 1, 1.5, 0.5, 0.5,
-3.761876, 3, -6.610686, 0, 1.5, 0.5, 0.5
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
-3.26657, -3.491263, -4,
-3.26657, -3.491263, 4,
-3.26657, -3.491263, -4,
-3.431672, -3.662095, -4,
-3.26657, -3.491263, -2,
-3.431672, -3.662095, -2,
-3.26657, -3.491263, 0,
-3.431672, -3.662095, 0,
-3.26657, -3.491263, 2,
-3.431672, -3.662095, 2,
-3.26657, -3.491263, 4,
-3.431672, -3.662095, 4
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
-3.761876, -4.003759, -4, 0, -0.5, 0.5, 0.5,
-3.761876, -4.003759, -4, 1, -0.5, 0.5, 0.5,
-3.761876, -4.003759, -4, 1, 1.5, 0.5, 0.5,
-3.761876, -4.003759, -4, 0, 1.5, 0.5, 0.5,
-3.761876, -4.003759, -2, 0, -0.5, 0.5, 0.5,
-3.761876, -4.003759, -2, 1, -0.5, 0.5, 0.5,
-3.761876, -4.003759, -2, 1, 1.5, 0.5, 0.5,
-3.761876, -4.003759, -2, 0, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 0, 0, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 0, 1, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 0, 1, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 0, 0, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 2, 0, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 2, 1, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 2, 1, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 2, 0, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 4, 0, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 4, 1, -0.5, 0.5, 0.5,
-3.761876, -4.003759, 4, 1, 1.5, 0.5, 0.5,
-3.761876, -4.003759, 4, 0, 1.5, 0.5, 0.5
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
-3.26657, -3.491263, -5.737341,
-3.26657, 3.342016, -5.737341,
-3.26657, -3.491263, 5.907248,
-3.26657, 3.342016, 5.907248,
-3.26657, -3.491263, -5.737341,
-3.26657, -3.491263, 5.907248,
-3.26657, 3.342016, -5.737341,
-3.26657, 3.342016, 5.907248,
-3.26657, -3.491263, -5.737341,
3.337508, -3.491263, -5.737341,
-3.26657, -3.491263, 5.907248,
3.337508, -3.491263, 5.907248,
-3.26657, 3.342016, -5.737341,
3.337508, 3.342016, -5.737341,
-3.26657, 3.342016, 5.907248,
3.337508, 3.342016, 5.907248,
3.337508, -3.491263, -5.737341,
3.337508, 3.342016, -5.737341,
3.337508, -3.491263, 5.907248,
3.337508, 3.342016, 5.907248,
3.337508, -3.491263, -5.737341,
3.337508, -3.491263, 5.907248,
3.337508, 3.342016, -5.737341,
3.337508, 3.342016, 5.907248
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
var radius = 8.025783;
var distance = 35.70762;
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
mvMatrix.translate( -0.03546894, 0.0746237, -0.08495331 );
mvMatrix.scale( 1.313981, 1.269908, 0.7452074 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70762);
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


