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
-3.231068, 2.334863, -4.911459, 1, 0, 0, 1,
-3.081931, -0.3196619, -1.872386, 1, 0.007843138, 0, 1,
-2.870781, -0.383771, -2.451773, 1, 0.01176471, 0, 1,
-2.704055, 0.8216243, -0.5219119, 1, 0.01960784, 0, 1,
-2.61813, -0.04345233, -3.054637, 1, 0.02352941, 0, 1,
-2.52772, 0.03317747, -1.728722, 1, 0.03137255, 0, 1,
-2.453872, 0.3184764, 0.6918348, 1, 0.03529412, 0, 1,
-2.447574, 2.652407, 0.1073448, 1, 0.04313726, 0, 1,
-2.315785, 0.7843173, -1.157249, 1, 0.04705882, 0, 1,
-2.290837, 0.232179, -3.418106, 1, 0.05490196, 0, 1,
-2.283078, -1.535767, -1.30944, 1, 0.05882353, 0, 1,
-2.230996, -0.9079219, -0.932851, 1, 0.06666667, 0, 1,
-2.16453, -0.161754, -0.7647564, 1, 0.07058824, 0, 1,
-2.117131, -0.5778142, -1.528005, 1, 0.07843138, 0, 1,
-2.103588, 0.5409879, -1.619296, 1, 0.08235294, 0, 1,
-2.04725, 0.02736263, -0.06850621, 1, 0.09019608, 0, 1,
-2.029319, 1.04141, -2.294646, 1, 0.09411765, 0, 1,
-2.015546, -1.657748, -1.979785, 1, 0.1019608, 0, 1,
-1.990645, 0.2536516, -4.000224, 1, 0.1098039, 0, 1,
-1.984112, 0.4806414, -0.5235046, 1, 0.1137255, 0, 1,
-1.984092, -1.261989, -0.9786024, 1, 0.1215686, 0, 1,
-1.982109, 1.285858, 0.1241151, 1, 0.1254902, 0, 1,
-1.954893, -1.807077, -2.109158, 1, 0.1333333, 0, 1,
-1.948896, -1.312498, -0.7250584, 1, 0.1372549, 0, 1,
-1.938666, 0.6506698, 0.8151478, 1, 0.145098, 0, 1,
-1.937791, 0.1389472, -1.3831, 1, 0.1490196, 0, 1,
-1.916324, -1.294758, -2.144787, 1, 0.1568628, 0, 1,
-1.906942, -1.277313, -2.435596, 1, 0.1607843, 0, 1,
-1.902235, 0.1364969, -1.330087, 1, 0.1686275, 0, 1,
-1.826679, -0.4012185, -1.848123, 1, 0.172549, 0, 1,
-1.82088, 0.164592, -0.8950822, 1, 0.1803922, 0, 1,
-1.814861, -1.03289, -2.117461, 1, 0.1843137, 0, 1,
-1.800829, 0.9760101, 0.01946047, 1, 0.1921569, 0, 1,
-1.7925, 0.03521213, -2.221925, 1, 0.1960784, 0, 1,
-1.787869, -0.7654561, -1.067918, 1, 0.2039216, 0, 1,
-1.764798, -0.9595541, -2.015311, 1, 0.2117647, 0, 1,
-1.758752, -0.01218837, -1.770594, 1, 0.2156863, 0, 1,
-1.734269, -0.953056, -0.5999473, 1, 0.2235294, 0, 1,
-1.731917, 0.5858399, -2.421512, 1, 0.227451, 0, 1,
-1.729287, 0.688053, -1.266628, 1, 0.2352941, 0, 1,
-1.723475, 0.5863411, -0.9374747, 1, 0.2392157, 0, 1,
-1.714493, 0.3287621, -0.9244798, 1, 0.2470588, 0, 1,
-1.707587, -0.3963148, -0.9842132, 1, 0.2509804, 0, 1,
-1.703571, 0.9488989, -1.307298, 1, 0.2588235, 0, 1,
-1.701852, -2.282638, -2.62173, 1, 0.2627451, 0, 1,
-1.699051, -0.1841478, -2.781321, 1, 0.2705882, 0, 1,
-1.684994, 0.1115732, 0.0829813, 1, 0.2745098, 0, 1,
-1.670202, -0.2269886, -1.031386, 1, 0.282353, 0, 1,
-1.665012, -1.592019, -1.271298, 1, 0.2862745, 0, 1,
-1.649476, -2.096307, -2.437995, 1, 0.2941177, 0, 1,
-1.637661, 0.2907348, -2.307874, 1, 0.3019608, 0, 1,
-1.630107, 0.0119819, -1.609922, 1, 0.3058824, 0, 1,
-1.5782, -0.473001, -1.352565, 1, 0.3137255, 0, 1,
-1.567509, 0.4145088, -1.759633, 1, 0.3176471, 0, 1,
-1.56523, -0.006702463, -0.2566575, 1, 0.3254902, 0, 1,
-1.547053, -0.9983812, -2.844445, 1, 0.3294118, 0, 1,
-1.543008, -0.3094082, -0.9564179, 1, 0.3372549, 0, 1,
-1.506584, -0.6349649, -0.5205601, 1, 0.3411765, 0, 1,
-1.505823, 0.3678317, -2.328441, 1, 0.3490196, 0, 1,
-1.501217, 0.8736462, -0.5178822, 1, 0.3529412, 0, 1,
-1.49647, 0.272949, -2.766139, 1, 0.3607843, 0, 1,
-1.476898, 0.2610665, 0.3001024, 1, 0.3647059, 0, 1,
-1.47225, -1.712591, -0.8838976, 1, 0.372549, 0, 1,
-1.456125, -0.3185874, -1.205433, 1, 0.3764706, 0, 1,
-1.43471, -1.171437, -2.005483, 1, 0.3843137, 0, 1,
-1.433756, -0.5829462, -3.323704, 1, 0.3882353, 0, 1,
-1.429762, 0.2135214, -2.693047, 1, 0.3960784, 0, 1,
-1.429185, -0.6852657, -1.594203, 1, 0.4039216, 0, 1,
-1.428117, -1.219614, -2.463736, 1, 0.4078431, 0, 1,
-1.423622, 0.8212008, -2.026446, 1, 0.4156863, 0, 1,
-1.419128, -0.6872957, -1.474266, 1, 0.4196078, 0, 1,
-1.417503, 0.576943, -1.381339, 1, 0.427451, 0, 1,
-1.41219, -1.567474, -1.743044, 1, 0.4313726, 0, 1,
-1.392204, -0.1091884, -2.976573, 1, 0.4392157, 0, 1,
-1.383525, -0.7417703, 0.8119071, 1, 0.4431373, 0, 1,
-1.373909, -0.9482962, -2.091003, 1, 0.4509804, 0, 1,
-1.372681, -0.3488114, -2.243895, 1, 0.454902, 0, 1,
-1.367757, 0.4022095, -0.7191066, 1, 0.4627451, 0, 1,
-1.353452, -0.8810288, -2.299526, 1, 0.4666667, 0, 1,
-1.331151, -0.03781565, -1.821797, 1, 0.4745098, 0, 1,
-1.324064, -0.2295659, -1.07089, 1, 0.4784314, 0, 1,
-1.321674, -0.9486351, -3.144079, 1, 0.4862745, 0, 1,
-1.302941, -0.9513341, -2.392682, 1, 0.4901961, 0, 1,
-1.300344, 1.032178, 0.2172332, 1, 0.4980392, 0, 1,
-1.291668, -0.8252195, -3.096151, 1, 0.5058824, 0, 1,
-1.28792, 0.48392, -1.568472, 1, 0.509804, 0, 1,
-1.284157, -0.9553639, -2.431564, 1, 0.5176471, 0, 1,
-1.276145, -0.5415191, -0.2621234, 1, 0.5215687, 0, 1,
-1.273592, 1.548674, -2.835808, 1, 0.5294118, 0, 1,
-1.262313, 2.839438, -2.670654, 1, 0.5333334, 0, 1,
-1.261912, -0.5599269, -1.582573, 1, 0.5411765, 0, 1,
-1.260767, 1.745947, -0.6547945, 1, 0.5450981, 0, 1,
-1.258957, 1.742382, -1.932685, 1, 0.5529412, 0, 1,
-1.253424, -1.660355, -1.929068, 1, 0.5568628, 0, 1,
-1.23468, -0.2675583, -1.963148, 1, 0.5647059, 0, 1,
-1.233301, 1.824789, 0.2016392, 1, 0.5686275, 0, 1,
-1.233111, -0.8916931, -1.962092, 1, 0.5764706, 0, 1,
-1.231561, 2.534216, -0.5057293, 1, 0.5803922, 0, 1,
-1.230043, -1.574595, -0.945419, 1, 0.5882353, 0, 1,
-1.216417, -0.03581775, -1.0195, 1, 0.5921569, 0, 1,
-1.211997, -0.7430638, -2.730699, 1, 0.6, 0, 1,
-1.208358, -0.01285314, 0.5425267, 1, 0.6078432, 0, 1,
-1.204104, 0.6616401, -1.824606, 1, 0.6117647, 0, 1,
-1.196854, 0.2530694, -1.428881, 1, 0.6196079, 0, 1,
-1.195453, 1.209785, -0.5068988, 1, 0.6235294, 0, 1,
-1.178364, 1.725345, -0.4511318, 1, 0.6313726, 0, 1,
-1.177512, -0.194322, -1.195168, 1, 0.6352941, 0, 1,
-1.171499, -1.152813, -1.466046, 1, 0.6431373, 0, 1,
-1.166811, 0.3335597, -3.711422, 1, 0.6470588, 0, 1,
-1.160641, -2.082753, -2.191143, 1, 0.654902, 0, 1,
-1.146357, -1.985719, -3.493872, 1, 0.6588235, 0, 1,
-1.141615, 0.1801221, -1.293596, 1, 0.6666667, 0, 1,
-1.134583, 0.5647172, -1.113927, 1, 0.6705883, 0, 1,
-1.131024, -0.9497972, -2.51958, 1, 0.6784314, 0, 1,
-1.128834, -1.148614, -2.434036, 1, 0.682353, 0, 1,
-1.124337, -0.2996633, -4.295254, 1, 0.6901961, 0, 1,
-1.114112, -0.1544498, -1.215486, 1, 0.6941177, 0, 1,
-1.108292, 0.4329788, -1.1401, 1, 0.7019608, 0, 1,
-1.103554, -1.31582, -3.668225, 1, 0.7098039, 0, 1,
-1.100297, -0.6170024, 0.1239357, 1, 0.7137255, 0, 1,
-1.09889, -0.5053931, -1.992106, 1, 0.7215686, 0, 1,
-1.093664, -0.1739217, -0.495391, 1, 0.7254902, 0, 1,
-1.088867, -0.09302816, -0.4591745, 1, 0.7333333, 0, 1,
-1.081232, 1.11315, -1.513589, 1, 0.7372549, 0, 1,
-1.079646, -0.7597264, 0.08144109, 1, 0.7450981, 0, 1,
-1.075532, -0.7186474, -2.785316, 1, 0.7490196, 0, 1,
-1.069607, -0.4518707, -3.411867, 1, 0.7568628, 0, 1,
-1.043098, 0.7466028, -0.3581504, 1, 0.7607843, 0, 1,
-1.038427, 0.6687678, -0.4419158, 1, 0.7686275, 0, 1,
-1.038315, 0.8655294, -1.413859, 1, 0.772549, 0, 1,
-1.036, -0.4314176, -1.489953, 1, 0.7803922, 0, 1,
-1.033911, 0.9137774, -0.3828333, 1, 0.7843137, 0, 1,
-1.033897, -1.041373, -2.249471, 1, 0.7921569, 0, 1,
-1.032475, 0.2415663, 1.171439, 1, 0.7960784, 0, 1,
-1.030094, 0.7932962, -1.773188, 1, 0.8039216, 0, 1,
-1.029434, 0.4642639, 0.03357545, 1, 0.8117647, 0, 1,
-1.026533, 0.2003749, -1.337497, 1, 0.8156863, 0, 1,
-1.018994, 1.308864, -2.503697, 1, 0.8235294, 0, 1,
-1.010979, 0.297926, -1.13367, 1, 0.827451, 0, 1,
-0.9903855, 1.731982, 0.1284937, 1, 0.8352941, 0, 1,
-0.9821502, -1.647174, -3.869634, 1, 0.8392157, 0, 1,
-0.9691966, 1.00565, -0.8184038, 1, 0.8470588, 0, 1,
-0.9570795, -2.787801, -3.660876, 1, 0.8509804, 0, 1,
-0.9517702, 0.3723469, -1.80995, 1, 0.8588235, 0, 1,
-0.9494593, 1.376995, 1.06644, 1, 0.8627451, 0, 1,
-0.94647, 2.163771, -0.7281287, 1, 0.8705882, 0, 1,
-0.9409491, 0.1903186, -2.914435, 1, 0.8745098, 0, 1,
-0.9407355, -0.6795563, -2.454927, 1, 0.8823529, 0, 1,
-0.9403312, 0.2611341, -2.577519, 1, 0.8862745, 0, 1,
-0.936963, -1.102165, -2.817247, 1, 0.8941177, 0, 1,
-0.9340813, -0.2842315, -1.838546, 1, 0.8980392, 0, 1,
-0.9301761, -1.860089, -2.087228, 1, 0.9058824, 0, 1,
-0.9236175, -1.024171, -3.053676, 1, 0.9137255, 0, 1,
-0.9198145, 0.4403192, -1.739848, 1, 0.9176471, 0, 1,
-0.9189262, -0.07982144, -1.283005, 1, 0.9254902, 0, 1,
-0.9175025, 0.8498433, -0.345021, 1, 0.9294118, 0, 1,
-0.9157422, -1.669539, -3.328316, 1, 0.9372549, 0, 1,
-0.9137281, -1.171526, -2.383916, 1, 0.9411765, 0, 1,
-0.910662, 0.4559617, -1.075424, 1, 0.9490196, 0, 1,
-0.9100963, -0.656079, -1.264768, 1, 0.9529412, 0, 1,
-0.908703, 0.09914143, -1.192664, 1, 0.9607843, 0, 1,
-0.9077998, 0.1405314, 0.7553236, 1, 0.9647059, 0, 1,
-0.907645, -0.6695493, -3.220962, 1, 0.972549, 0, 1,
-0.8917913, -0.09976091, -2.135065, 1, 0.9764706, 0, 1,
-0.8896955, 0.8044848, -0.1022304, 1, 0.9843137, 0, 1,
-0.8773527, 1.051482, 0.7783375, 1, 0.9882353, 0, 1,
-0.8769038, -0.8304283, -2.690337, 1, 0.9960784, 0, 1,
-0.8769007, -0.07791874, -3.135301, 0.9960784, 1, 0, 1,
-0.8720363, -0.4872018, -2.561079, 0.9921569, 1, 0, 1,
-0.8679513, 0.7774222, -2.410744, 0.9843137, 1, 0, 1,
-0.8668228, -1.3482, -1.513462, 0.9803922, 1, 0, 1,
-0.8639321, 1.321002, -0.6702204, 0.972549, 1, 0, 1,
-0.8636711, -1.646585, -1.685467, 0.9686275, 1, 0, 1,
-0.8623936, -0.9071802, -1.675189, 0.9607843, 1, 0, 1,
-0.8605838, 0.288229, -1.878022, 0.9568627, 1, 0, 1,
-0.8592749, 0.2814744, -1.26015, 0.9490196, 1, 0, 1,
-0.8522221, -0.8813054, -2.74328, 0.945098, 1, 0, 1,
-0.8441269, 0.5599846, 0.1518203, 0.9372549, 1, 0, 1,
-0.8429281, -0.1764182, -2.955657, 0.9333333, 1, 0, 1,
-0.8410469, -0.6910817, -2.726871, 0.9254902, 1, 0, 1,
-0.8303773, -1.559495, -1.891281, 0.9215686, 1, 0, 1,
-0.8254346, 0.1130956, -0.6259667, 0.9137255, 1, 0, 1,
-0.8249691, 0.8374407, -0.7063842, 0.9098039, 1, 0, 1,
-0.8249203, -0.1682609, -2.397855, 0.9019608, 1, 0, 1,
-0.8242164, -1.686849, -1.196733, 0.8941177, 1, 0, 1,
-0.8227076, -1.530129, -2.810061, 0.8901961, 1, 0, 1,
-0.8217751, 0.1184821, -0.3958559, 0.8823529, 1, 0, 1,
-0.8190248, 0.8014241, -1.830357, 0.8784314, 1, 0, 1,
-0.8178053, -0.775179, -2.335396, 0.8705882, 1, 0, 1,
-0.8143137, -1.197711, -4.049036, 0.8666667, 1, 0, 1,
-0.8121445, -1.909775, -2.074551, 0.8588235, 1, 0, 1,
-0.8105986, -0.5591489, -1.555582, 0.854902, 1, 0, 1,
-0.8089609, -1.806058, -3.014186, 0.8470588, 1, 0, 1,
-0.8056918, 2.430082, -1.864748, 0.8431373, 1, 0, 1,
-0.8052191, 0.2882239, -1.636199, 0.8352941, 1, 0, 1,
-0.7997519, -0.50648, -1.474504, 0.8313726, 1, 0, 1,
-0.7937389, 0.381203, -1.240781, 0.8235294, 1, 0, 1,
-0.7927659, 1.410368, -1.493948, 0.8196079, 1, 0, 1,
-0.7804007, -0.256627, -3.157247, 0.8117647, 1, 0, 1,
-0.7802204, 0.4751084, -1.772706, 0.8078431, 1, 0, 1,
-0.7797273, -0.2413905, -2.437965, 0.8, 1, 0, 1,
-0.778128, -1.285106, -1.11703, 0.7921569, 1, 0, 1,
-0.7750521, 0.05629938, -1.52971, 0.7882353, 1, 0, 1,
-0.773211, -0.4417651, -1.280857, 0.7803922, 1, 0, 1,
-0.7670267, -0.9165838, -2.024512, 0.7764706, 1, 0, 1,
-0.7668606, -0.9025297, -2.286829, 0.7686275, 1, 0, 1,
-0.7584221, 0.7103618, -0.1458439, 0.7647059, 1, 0, 1,
-0.7571688, 0.8322921, -1.703614, 0.7568628, 1, 0, 1,
-0.7492883, -0.2809242, -2.006411, 0.7529412, 1, 0, 1,
-0.7463583, -1.107768, -3.417318, 0.7450981, 1, 0, 1,
-0.7391211, 1.268636, 0.1148285, 0.7411765, 1, 0, 1,
-0.7319391, -0.9701725, -2.779687, 0.7333333, 1, 0, 1,
-0.7318988, 0.09070501, -1.328765, 0.7294118, 1, 0, 1,
-0.7318625, -0.0712465, -0.3956046, 0.7215686, 1, 0, 1,
-0.7288142, 1.859836, -0.3478853, 0.7176471, 1, 0, 1,
-0.7281542, 0.01558642, -3.327219, 0.7098039, 1, 0, 1,
-0.7242725, 1.444761, -0.6247579, 0.7058824, 1, 0, 1,
-0.7192341, 1.574207, 0.348779, 0.6980392, 1, 0, 1,
-0.716006, 0.3017462, -1.335236, 0.6901961, 1, 0, 1,
-0.7137143, 1.020601, -0.7525664, 0.6862745, 1, 0, 1,
-0.7069644, 0.8097882, -1.995961, 0.6784314, 1, 0, 1,
-0.705695, -1.087273, -3.001009, 0.6745098, 1, 0, 1,
-0.7015851, -0.6455996, -2.525335, 0.6666667, 1, 0, 1,
-0.6952322, 1.144761, 0.5746998, 0.6627451, 1, 0, 1,
-0.6938085, -0.4222873, -2.966087, 0.654902, 1, 0, 1,
-0.6900925, 0.54471, -0.6282892, 0.6509804, 1, 0, 1,
-0.6884521, 0.3888141, -2.179914, 0.6431373, 1, 0, 1,
-0.6830091, 0.2210081, -1.517744, 0.6392157, 1, 0, 1,
-0.6824022, -0.01784243, -0.6034177, 0.6313726, 1, 0, 1,
-0.680219, 0.6355644, -1.173679, 0.627451, 1, 0, 1,
-0.6766752, -2.065337, -2.474911, 0.6196079, 1, 0, 1,
-0.6755257, 0.616408, 0.5219675, 0.6156863, 1, 0, 1,
-0.6734321, 0.2573518, -1.414046, 0.6078432, 1, 0, 1,
-0.6714168, -1.386872, -0.6866604, 0.6039216, 1, 0, 1,
-0.6704556, 1.866493, -0.686511, 0.5960785, 1, 0, 1,
-0.6688496, 1.072138, 0.6584263, 0.5882353, 1, 0, 1,
-0.6664698, 0.5213004, -1.829909, 0.5843138, 1, 0, 1,
-0.6662923, -1.191301, -2.44988, 0.5764706, 1, 0, 1,
-0.6598892, -0.2285927, -1.831318, 0.572549, 1, 0, 1,
-0.6596048, 1.639249, -0.5830317, 0.5647059, 1, 0, 1,
-0.6559153, -0.03668583, -1.28656, 0.5607843, 1, 0, 1,
-0.6555338, 1.069359, 0.3396508, 0.5529412, 1, 0, 1,
-0.6543993, -0.3527002, -2.011126, 0.5490196, 1, 0, 1,
-0.6535442, -1.084994, -1.454886, 0.5411765, 1, 0, 1,
-0.6487601, -1.619483, -1.484017, 0.5372549, 1, 0, 1,
-0.6483407, -0.2015483, -1.70091, 0.5294118, 1, 0, 1,
-0.646937, -0.5273881, -1.327403, 0.5254902, 1, 0, 1,
-0.6363106, 0.2650555, -0.006596053, 0.5176471, 1, 0, 1,
-0.6352912, -0.1054055, -1.529039, 0.5137255, 1, 0, 1,
-0.6322272, 1.124115, 1.190723, 0.5058824, 1, 0, 1,
-0.6314665, -1.294937, -2.197746, 0.5019608, 1, 0, 1,
-0.6305327, -1.319022, -1.954536, 0.4941176, 1, 0, 1,
-0.6298189, 0.4527279, -0.3442813, 0.4862745, 1, 0, 1,
-0.6272646, -0.6725299, -1.378025, 0.4823529, 1, 0, 1,
-0.6266012, -0.395937, -1.789879, 0.4745098, 1, 0, 1,
-0.6255334, -0.3547772, -3.907374, 0.4705882, 1, 0, 1,
-0.6236179, -1.084772, -1.655799, 0.4627451, 1, 0, 1,
-0.6221954, 0.2643594, -2.218777, 0.4588235, 1, 0, 1,
-0.6209796, -0.2640237, -3.110815, 0.4509804, 1, 0, 1,
-0.6154635, -1.284521, -2.778451, 0.4470588, 1, 0, 1,
-0.6131754, -0.884813, -5.180659, 0.4392157, 1, 0, 1,
-0.6116895, 0.2131538, -1.645165, 0.4352941, 1, 0, 1,
-0.6074598, -0.2908592, 0.03743603, 0.427451, 1, 0, 1,
-0.6052526, 0.5542371, -1.776601, 0.4235294, 1, 0, 1,
-0.6021814, 0.2862963, 0.125018, 0.4156863, 1, 0, 1,
-0.5933234, -1.009801, -3.782547, 0.4117647, 1, 0, 1,
-0.591714, -1.92049, -2.240261, 0.4039216, 1, 0, 1,
-0.5900145, -0.9731061, -1.761718, 0.3960784, 1, 0, 1,
-0.5858957, -1.753226, -2.330646, 0.3921569, 1, 0, 1,
-0.5772878, 0.3066847, 0.1607798, 0.3843137, 1, 0, 1,
-0.5754048, 0.4208191, -1.073764, 0.3803922, 1, 0, 1,
-0.5709148, -0.3325936, -1.102723, 0.372549, 1, 0, 1,
-0.5669819, -1.834266, -3.125964, 0.3686275, 1, 0, 1,
-0.5655617, -0.6959695, -3.371847, 0.3607843, 1, 0, 1,
-0.55795, 1.754905, -0.6645582, 0.3568628, 1, 0, 1,
-0.5558636, -0.2574631, 0.1545293, 0.3490196, 1, 0, 1,
-0.5470529, -0.1970102, -1.154919, 0.345098, 1, 0, 1,
-0.5296696, -0.9158777, -2.708512, 0.3372549, 1, 0, 1,
-0.5287059, 0.4835085, -1.327325, 0.3333333, 1, 0, 1,
-0.5205402, 0.4920963, -0.8163369, 0.3254902, 1, 0, 1,
-0.5203688, -0.3454363, -1.567328, 0.3215686, 1, 0, 1,
-0.5202897, 1.192885, 1.764775, 0.3137255, 1, 0, 1,
-0.5151347, -1.308098, -2.52234, 0.3098039, 1, 0, 1,
-0.5141202, -0.226198, -3.298544, 0.3019608, 1, 0, 1,
-0.5101724, 1.732099, -1.150501, 0.2941177, 1, 0, 1,
-0.5027426, -0.1215803, -0.7218506, 0.2901961, 1, 0, 1,
-0.5003067, 1.127689, -0.4455769, 0.282353, 1, 0, 1,
-0.4975366, 2.221633, 0.4547041, 0.2784314, 1, 0, 1,
-0.4888064, 2.662328, 0.5350488, 0.2705882, 1, 0, 1,
-0.4824333, -0.5059344, -1.691385, 0.2666667, 1, 0, 1,
-0.4823339, -1.457043, -4.657558, 0.2588235, 1, 0, 1,
-0.4823007, -0.8409203, -1.82637, 0.254902, 1, 0, 1,
-0.4817651, 0.828811, 0.5125847, 0.2470588, 1, 0, 1,
-0.4749842, 0.6801175, 0.9267003, 0.2431373, 1, 0, 1,
-0.4713274, -1.212169, -4.284794, 0.2352941, 1, 0, 1,
-0.4665966, 0.8092313, -1.162354, 0.2313726, 1, 0, 1,
-0.4660509, 0.9178132, 0.2656319, 0.2235294, 1, 0, 1,
-0.4648831, -0.6230826, -4.068597, 0.2196078, 1, 0, 1,
-0.4614989, -0.5673451, -4.114588, 0.2117647, 1, 0, 1,
-0.4602629, -0.681538, -1.365726, 0.2078431, 1, 0, 1,
-0.4490958, 0.3873007, -1.108248, 0.2, 1, 0, 1,
-0.4384142, 0.07497127, -2.25387, 0.1921569, 1, 0, 1,
-0.4382546, -0.9192491, -3.458104, 0.1882353, 1, 0, 1,
-0.4300317, 0.5295975, -0.4444381, 0.1803922, 1, 0, 1,
-0.4285921, -0.7338299, -1.65091, 0.1764706, 1, 0, 1,
-0.4279771, 0.7919203, 0.1824984, 0.1686275, 1, 0, 1,
-0.424386, 0.7868626, -1.04609, 0.1647059, 1, 0, 1,
-0.4240886, -0.3557217, -3.21547, 0.1568628, 1, 0, 1,
-0.4217035, 1.263782, 1.152907, 0.1529412, 1, 0, 1,
-0.4164644, 0.9749126, 1.045772, 0.145098, 1, 0, 1,
-0.4152414, -0.007694205, -2.197087, 0.1411765, 1, 0, 1,
-0.4151962, 0.7114221, 0.4828918, 0.1333333, 1, 0, 1,
-0.4138181, 1.878918, -0.2929687, 0.1294118, 1, 0, 1,
-0.4136881, -0.5338064, -2.647559, 0.1215686, 1, 0, 1,
-0.4115877, -1.464156, -1.418517, 0.1176471, 1, 0, 1,
-0.4074547, 0.04983607, -1.633903, 0.1098039, 1, 0, 1,
-0.4024484, 1.192956, -0.6231909, 0.1058824, 1, 0, 1,
-0.3985052, -0.3188981, -1.937748, 0.09803922, 1, 0, 1,
-0.3976356, 0.2076267, -0.8986254, 0.09019608, 1, 0, 1,
-0.396883, -0.8770773, -0.3247244, 0.08627451, 1, 0, 1,
-0.3961059, -1.012839, -3.482998, 0.07843138, 1, 0, 1,
-0.3941377, 0.8204856, -0.4636629, 0.07450981, 1, 0, 1,
-0.3885836, -1.50783, -1.957898, 0.06666667, 1, 0, 1,
-0.3862528, 2.012801, -1.167724, 0.0627451, 1, 0, 1,
-0.3820299, 1.495233, 0.9835425, 0.05490196, 1, 0, 1,
-0.3779833, -1.312279, -2.541613, 0.05098039, 1, 0, 1,
-0.3776911, 2.109059, 0.7156332, 0.04313726, 1, 0, 1,
-0.3733927, -0.2677681, -3.518872, 0.03921569, 1, 0, 1,
-0.3727584, 0.3893108, -0.8908615, 0.03137255, 1, 0, 1,
-0.3717035, 0.1069502, 1.530034, 0.02745098, 1, 0, 1,
-0.3715962, -0.05931326, -1.489327, 0.01960784, 1, 0, 1,
-0.3701345, -0.3471539, -3.527892, 0.01568628, 1, 0, 1,
-0.3697885, 0.05587325, -1.862471, 0.007843138, 1, 0, 1,
-0.3609475, 1.084724, -0.3188352, 0.003921569, 1, 0, 1,
-0.3592477, 0.7668592, 1.346193, 0, 1, 0.003921569, 1,
-0.3559406, 0.425191, 0.5090187, 0, 1, 0.01176471, 1,
-0.3510201, -0.430051, -2.203018, 0, 1, 0.01568628, 1,
-0.3445483, -1.10294, -2.148307, 0, 1, 0.02352941, 1,
-0.3437698, 0.9911208, 0.9360723, 0, 1, 0.02745098, 1,
-0.3416231, 1.992199, 0.4613906, 0, 1, 0.03529412, 1,
-0.3391458, 0.5208642, -1.099174, 0, 1, 0.03921569, 1,
-0.3380313, 0.9904299, -1.066678, 0, 1, 0.04705882, 1,
-0.3361019, -0.6603326, -2.400726, 0, 1, 0.05098039, 1,
-0.3353098, -0.01021668, -0.7396761, 0, 1, 0.05882353, 1,
-0.334614, -0.5885926, -2.611955, 0, 1, 0.0627451, 1,
-0.3324927, 1.346723, 0.782764, 0, 1, 0.07058824, 1,
-0.3267919, -0.05932533, -1.471281, 0, 1, 0.07450981, 1,
-0.3244801, 0.1660895, -2.055553, 0, 1, 0.08235294, 1,
-0.3218333, 0.5463047, -0.6780095, 0, 1, 0.08627451, 1,
-0.3195084, -1.396922, -2.186819, 0, 1, 0.09411765, 1,
-0.3193214, 1.076711, -0.4349609, 0, 1, 0.1019608, 1,
-0.3191025, 2.335787, -0.2947078, 0, 1, 0.1058824, 1,
-0.3183865, 0.67448, -1.271023, 0, 1, 0.1137255, 1,
-0.3183253, -0.06656383, -1.847508, 0, 1, 0.1176471, 1,
-0.3175977, 0.4249788, -0.7994679, 0, 1, 0.1254902, 1,
-0.3139035, -0.1330675, -2.412714, 0, 1, 0.1294118, 1,
-0.3133957, 0.2762555, -2.564515, 0, 1, 0.1372549, 1,
-0.3127229, -0.9847637, -2.897468, 0, 1, 0.1411765, 1,
-0.3118007, 0.1142612, -1.486563, 0, 1, 0.1490196, 1,
-0.3116485, -0.804073, -3.423589, 0, 1, 0.1529412, 1,
-0.311063, 1.598436, 0.4992669, 0, 1, 0.1607843, 1,
-0.3100952, 1.709094, -0.9352771, 0, 1, 0.1647059, 1,
-0.3092735, -0.4467188, -2.221027, 0, 1, 0.172549, 1,
-0.3048918, -0.3679794, -1.970587, 0, 1, 0.1764706, 1,
-0.3041484, -1.275423, -3.037143, 0, 1, 0.1843137, 1,
-0.3040121, 0.5812886, 0.0925509, 0, 1, 0.1882353, 1,
-0.3016211, 0.4869862, -0.7283083, 0, 1, 0.1960784, 1,
-0.2981534, 1.161106, 0.6428416, 0, 1, 0.2039216, 1,
-0.2891921, 0.2028849, -3.110794, 0, 1, 0.2078431, 1,
-0.2888051, 0.497196, 1.522514, 0, 1, 0.2156863, 1,
-0.2882944, 0.2143771, -2.044717, 0, 1, 0.2196078, 1,
-0.284192, -0.09238823, -1.717291, 0, 1, 0.227451, 1,
-0.2784247, -1.338309, -1.133966, 0, 1, 0.2313726, 1,
-0.2690721, 0.2938276, 0.4020023, 0, 1, 0.2392157, 1,
-0.261427, 0.3398035, 0.3186031, 0, 1, 0.2431373, 1,
-0.2593399, -1.270241, -3.669641, 0, 1, 0.2509804, 1,
-0.2582572, 0.4996195, 0.727227, 0, 1, 0.254902, 1,
-0.2567843, -0.2397205, -0.4349869, 0, 1, 0.2627451, 1,
-0.2563537, -0.5931395, -3.174544, 0, 1, 0.2666667, 1,
-0.2538471, -1.417272, -2.729748, 0, 1, 0.2745098, 1,
-0.2537768, 2.219041, -1.772348, 0, 1, 0.2784314, 1,
-0.2531785, -1.50973, -1.903313, 0, 1, 0.2862745, 1,
-0.2509409, -0.3698216, -2.009772, 0, 1, 0.2901961, 1,
-0.2490681, -1.460337, -2.515734, 0, 1, 0.2980392, 1,
-0.246487, 0.369159, -0.7102169, 0, 1, 0.3058824, 1,
-0.2414968, -0.4779015, -1.904009, 0, 1, 0.3098039, 1,
-0.2398124, -0.9325828, -1.947096, 0, 1, 0.3176471, 1,
-0.2376818, 0.3293349, -0.6792755, 0, 1, 0.3215686, 1,
-0.2317453, 0.5224572, -2.831051, 0, 1, 0.3294118, 1,
-0.2307553, -0.4900745, -2.188475, 0, 1, 0.3333333, 1,
-0.2288178, -0.3871278, -3.001724, 0, 1, 0.3411765, 1,
-0.228769, 0.846597, -0.1348231, 0, 1, 0.345098, 1,
-0.226829, 0.7485307, 1.113613, 0, 1, 0.3529412, 1,
-0.2236737, -0.5627847, -1.561129, 0, 1, 0.3568628, 1,
-0.2190471, 1.729588, -0.8613443, 0, 1, 0.3647059, 1,
-0.2110569, -0.6554253, -3.487474, 0, 1, 0.3686275, 1,
-0.2083447, -1.148893, -2.593214, 0, 1, 0.3764706, 1,
-0.206108, -1.318859, -4.121237, 0, 1, 0.3803922, 1,
-0.2059685, 0.03932241, -0.06398938, 0, 1, 0.3882353, 1,
-0.2037289, -1.041254, -1.850861, 0, 1, 0.3921569, 1,
-0.2002783, -0.6474274, -2.734604, 0, 1, 0.4, 1,
-0.1976462, -0.5171633, -2.046795, 0, 1, 0.4078431, 1,
-0.1960099, -0.2398788, -1.883661, 0, 1, 0.4117647, 1,
-0.1934097, 1.365498, -0.4909462, 0, 1, 0.4196078, 1,
-0.1933215, 0.07520263, -3.476354, 0, 1, 0.4235294, 1,
-0.1913592, -0.3966599, -1.580568, 0, 1, 0.4313726, 1,
-0.1890359, 0.3303129, -0.3197746, 0, 1, 0.4352941, 1,
-0.1839954, -0.3545753, -2.77979, 0, 1, 0.4431373, 1,
-0.1750252, 0.8823767, 0.9954154, 0, 1, 0.4470588, 1,
-0.1726397, 0.7564921, -1.825856, 0, 1, 0.454902, 1,
-0.1699398, 0.8102673, -0.01855438, 0, 1, 0.4588235, 1,
-0.1694187, -0.2649786, -2.129726, 0, 1, 0.4666667, 1,
-0.1691508, -0.01590977, -3.831442, 0, 1, 0.4705882, 1,
-0.1682975, -0.7491581, -2.91346, 0, 1, 0.4784314, 1,
-0.1668295, 0.2937598, 0.2387448, 0, 1, 0.4823529, 1,
-0.1638607, 0.8399991, -0.3144802, 0, 1, 0.4901961, 1,
-0.1580666, -0.4528078, -3.180732, 0, 1, 0.4941176, 1,
-0.1512004, -0.8008218, -3.093719, 0, 1, 0.5019608, 1,
-0.1481848, -1.136629, -3.471193, 0, 1, 0.509804, 1,
-0.1460902, 1.456147, 2.629238, 0, 1, 0.5137255, 1,
-0.1442316, 0.923031, -2.273777, 0, 1, 0.5215687, 1,
-0.1435989, -0.1807475, -1.587186, 0, 1, 0.5254902, 1,
-0.1433973, 0.3435889, -0.01691188, 0, 1, 0.5333334, 1,
-0.1370942, -0.1361641, -1.925155, 0, 1, 0.5372549, 1,
-0.1351646, -0.3808579, -3.290664, 0, 1, 0.5450981, 1,
-0.1347411, -0.08147391, -1.822224, 0, 1, 0.5490196, 1,
-0.1346938, -1.748839, -4.392863, 0, 1, 0.5568628, 1,
-0.133018, 0.4643233, 0.3522444, 0, 1, 0.5607843, 1,
-0.1309273, -1.123413, -4.412481, 0, 1, 0.5686275, 1,
-0.1298721, 0.3204166, -2.425815, 0, 1, 0.572549, 1,
-0.1287266, -0.4995757, -3.63653, 0, 1, 0.5803922, 1,
-0.126385, -2.185729, -4.182533, 0, 1, 0.5843138, 1,
-0.1208273, -1.099841, -1.635282, 0, 1, 0.5921569, 1,
-0.1195375, 0.1451592, -1.84946, 0, 1, 0.5960785, 1,
-0.1182183, -1.209438, -3.274919, 0, 1, 0.6039216, 1,
-0.1135858, 0.06205695, -1.537368, 0, 1, 0.6117647, 1,
-0.1130822, 0.7877331, -1.672609, 0, 1, 0.6156863, 1,
-0.1089831, -0.7103142, -2.344424, 0, 1, 0.6235294, 1,
-0.1038305, 0.2265821, -0.1983843, 0, 1, 0.627451, 1,
-0.1036654, 0.7054631, -1.196629, 0, 1, 0.6352941, 1,
-0.1009334, 0.7450602, 0.9669046, 0, 1, 0.6392157, 1,
-0.09922592, 0.2859513, -0.09626013, 0, 1, 0.6470588, 1,
-0.09847721, 0.4402391, -1.426842, 0, 1, 0.6509804, 1,
-0.09784384, -0.1858902, -2.547936, 0, 1, 0.6588235, 1,
-0.09165677, 1.212361, 0.02308698, 0, 1, 0.6627451, 1,
-0.09137047, -0.8688149, -2.819379, 0, 1, 0.6705883, 1,
-0.08806911, -0.679724, -1.559321, 0, 1, 0.6745098, 1,
-0.07877655, -0.2887534, -2.368428, 0, 1, 0.682353, 1,
-0.072202, -1.16087, -3.60671, 0, 1, 0.6862745, 1,
-0.07144918, -0.8461291, -3.250492, 0, 1, 0.6941177, 1,
-0.06754215, 0.8641171, -1.753244, 0, 1, 0.7019608, 1,
-0.06636801, -0.6705242, -6.00059, 0, 1, 0.7058824, 1,
-0.06270596, -1.049178, -3.929054, 0, 1, 0.7137255, 1,
-0.05190403, 0.5598612, -0.8776981, 0, 1, 0.7176471, 1,
-0.05183398, 1.68932, 0.1652831, 0, 1, 0.7254902, 1,
-0.04904048, 0.3532663, 0.8066558, 0, 1, 0.7294118, 1,
-0.04562134, -0.2445079, -3.45423, 0, 1, 0.7372549, 1,
-0.04224199, -1.630799, -2.551066, 0, 1, 0.7411765, 1,
-0.03905021, -0.9609247, -5.096985, 0, 1, 0.7490196, 1,
-0.03710799, 0.9527402, -0.827319, 0, 1, 0.7529412, 1,
-0.03643268, -0.9391601, -3.992314, 0, 1, 0.7607843, 1,
-0.03457373, -1.769801, -2.686158, 0, 1, 0.7647059, 1,
-0.03337807, 0.6501119, 0.8223297, 0, 1, 0.772549, 1,
-0.02199794, -0.410724, -3.147724, 0, 1, 0.7764706, 1,
-0.0212719, -0.714448, -1.327329, 0, 1, 0.7843137, 1,
-0.01901736, -0.604275, -3.587874, 0, 1, 0.7882353, 1,
-0.01638655, 0.9169894, 0.7408838, 0, 1, 0.7960784, 1,
-0.01600878, -1.43442, -2.474804, 0, 1, 0.8039216, 1,
-0.01500307, 0.2304963, 0.2907868, 0, 1, 0.8078431, 1,
-0.01421241, -1.244307, -3.712126, 0, 1, 0.8156863, 1,
-0.01412707, 0.4256543, -0.219438, 0, 1, 0.8196079, 1,
-0.01125591, -1.609398, -2.757163, 0, 1, 0.827451, 1,
-0.0110724, -0.2444304, -3.343195, 0, 1, 0.8313726, 1,
-0.009728415, -0.6251833, -4.667766, 0, 1, 0.8392157, 1,
-0.008833348, 0.4534989, -0.8763373, 0, 1, 0.8431373, 1,
-0.003943994, -1.77926, -5.385993, 0, 1, 0.8509804, 1,
-0.003117533, -1.876423, -3.02768, 0, 1, 0.854902, 1,
-0.0003353601, 1.135248, 1.623211, 0, 1, 0.8627451, 1,
0.0005176603, 0.3605999, 0.7565033, 0, 1, 0.8666667, 1,
0.004964068, -1.110673, 2.319947, 0, 1, 0.8745098, 1,
0.007598225, -0.517962, 3.214504, 0, 1, 0.8784314, 1,
0.008607476, -0.498183, 4.086908, 0, 1, 0.8862745, 1,
0.01337072, 0.4293656, -0.724434, 0, 1, 0.8901961, 1,
0.01337657, 0.2879401, -0.08273304, 0, 1, 0.8980392, 1,
0.0135259, 0.6825024, -0.5019047, 0, 1, 0.9058824, 1,
0.01392716, 0.09072547, -0.4955348, 0, 1, 0.9098039, 1,
0.01711703, -0.195696, 2.455021, 0, 1, 0.9176471, 1,
0.0176372, -0.04198554, 3.951829, 0, 1, 0.9215686, 1,
0.01908496, -0.01877849, 0.6991697, 0, 1, 0.9294118, 1,
0.020053, -0.1973678, 2.299685, 0, 1, 0.9333333, 1,
0.02691017, 0.2318771, 0.474312, 0, 1, 0.9411765, 1,
0.0282892, -0.5871697, 2.74388, 0, 1, 0.945098, 1,
0.02988201, -0.386155, 3.174328, 0, 1, 0.9529412, 1,
0.03151394, -0.1021017, 3.135269, 0, 1, 0.9568627, 1,
0.03219621, -0.2071405, 2.820208, 0, 1, 0.9647059, 1,
0.03663364, -2.365433, 3.429285, 0, 1, 0.9686275, 1,
0.03676162, -0.7283427, 4.026091, 0, 1, 0.9764706, 1,
0.03804749, -0.1362752, 3.377902, 0, 1, 0.9803922, 1,
0.0383421, -0.2154711, 4.403111, 0, 1, 0.9882353, 1,
0.03953006, -0.3207367, 1.320518, 0, 1, 0.9921569, 1,
0.04465937, -1.300328, 2.544093, 0, 1, 1, 1,
0.04614595, -1.174825, 1.646236, 0, 0.9921569, 1, 1,
0.04658753, 1.155924, 0.3807333, 0, 0.9882353, 1, 1,
0.04914143, -0.0418225, 1.626307, 0, 0.9803922, 1, 1,
0.0523357, 0.078414, 0.6378054, 0, 0.9764706, 1, 1,
0.05246686, 0.5147062, -0.4338535, 0, 0.9686275, 1, 1,
0.05391613, -0.2876679, 2.563351, 0, 0.9647059, 1, 1,
0.05416206, 0.9249877, 0.2019874, 0, 0.9568627, 1, 1,
0.05720831, -2.332287, 3.536855, 0, 0.9529412, 1, 1,
0.05767006, -1.819703, 4.688542, 0, 0.945098, 1, 1,
0.05990618, 0.8185704, 0.5308096, 0, 0.9411765, 1, 1,
0.05998095, -0.6926215, 1.139033, 0, 0.9333333, 1, 1,
0.06728801, -2.405756, 2.543725, 0, 0.9294118, 1, 1,
0.06845047, -0.9032781, 2.928, 0, 0.9215686, 1, 1,
0.07380956, 0.2112605, 0.5377704, 0, 0.9176471, 1, 1,
0.07517132, -1.508169, 1.507554, 0, 0.9098039, 1, 1,
0.08023047, 0.723244, -0.03536874, 0, 0.9058824, 1, 1,
0.08043361, -0.3055876, 1.985354, 0, 0.8980392, 1, 1,
0.08199947, -1.140951, 3.198563, 0, 0.8901961, 1, 1,
0.08966421, -0.1682505, 3.57147, 0, 0.8862745, 1, 1,
0.09241953, 1.919235, 0.5281007, 0, 0.8784314, 1, 1,
0.09538555, -0.04826359, 0.9707597, 0, 0.8745098, 1, 1,
0.09554069, -1.019602, 5.126291, 0, 0.8666667, 1, 1,
0.1005651, 0.4485525, -0.6859934, 0, 0.8627451, 1, 1,
0.104412, 0.6114264, 0.3750283, 0, 0.854902, 1, 1,
0.1058293, 0.139061, 0.4054446, 0, 0.8509804, 1, 1,
0.1060534, -0.3288166, 2.793357, 0, 0.8431373, 1, 1,
0.1084954, 1.376212, 1.098906, 0, 0.8392157, 1, 1,
0.1085277, -0.7043401, 4.747797, 0, 0.8313726, 1, 1,
0.113142, -1.903477, 3.520337, 0, 0.827451, 1, 1,
0.1187879, 0.4238525, 1.594334, 0, 0.8196079, 1, 1,
0.12032, -0.5776038, 5.260658, 0, 0.8156863, 1, 1,
0.1205969, -1.629957, 4.851152, 0, 0.8078431, 1, 1,
0.1208498, 0.8420265, 0.2927976, 0, 0.8039216, 1, 1,
0.1235174, -0.8128347, 1.722271, 0, 0.7960784, 1, 1,
0.1315481, -0.5740013, 3.529031, 0, 0.7882353, 1, 1,
0.1350649, -1.162921, 2.806273, 0, 0.7843137, 1, 1,
0.1393311, 2.230257, -1.058892, 0, 0.7764706, 1, 1,
0.1409551, 0.2999378, 0.6930426, 0, 0.772549, 1, 1,
0.1410742, 0.8449948, -1.044461, 0, 0.7647059, 1, 1,
0.1448636, -1.446358, 4.658696, 0, 0.7607843, 1, 1,
0.1456127, 0.9172004, 0.7681391, 0, 0.7529412, 1, 1,
0.1461104, 0.01194959, 1.199679, 0, 0.7490196, 1, 1,
0.1470035, 1.03695, -0.4244196, 0, 0.7411765, 1, 1,
0.1470649, -0.8903193, 3.818928, 0, 0.7372549, 1, 1,
0.1494584, -1.238307, 3.796911, 0, 0.7294118, 1, 1,
0.1526057, -0.3040633, 2.585494, 0, 0.7254902, 1, 1,
0.1541986, -0.6654327, 2.697894, 0, 0.7176471, 1, 1,
0.1550001, -0.7332208, 2.694567, 0, 0.7137255, 1, 1,
0.1558492, 0.0939201, 1.086198, 0, 0.7058824, 1, 1,
0.1559565, 2.510325, 0.4942501, 0, 0.6980392, 1, 1,
0.1560801, 0.5533717, -0.2079486, 0, 0.6941177, 1, 1,
0.156315, -0.8657327, 3.617496, 0, 0.6862745, 1, 1,
0.1595155, -0.2921625, 3.244346, 0, 0.682353, 1, 1,
0.1613492, 1.839961, -0.6818737, 0, 0.6745098, 1, 1,
0.1617613, 1.484217, -0.1658375, 0, 0.6705883, 1, 1,
0.1744816, 0.6449808, -0.6325331, 0, 0.6627451, 1, 1,
0.1850509, 0.6599889, 0.5637994, 0, 0.6588235, 1, 1,
0.185812, -1.127507, 3.695965, 0, 0.6509804, 1, 1,
0.1875262, 0.3193348, -1.480605, 0, 0.6470588, 1, 1,
0.1901825, 1.683294, -0.5586407, 0, 0.6392157, 1, 1,
0.1939024, 0.9909642, 0.8124613, 0, 0.6352941, 1, 1,
0.1949166, 0.2176198, 1.488314, 0, 0.627451, 1, 1,
0.1961029, 0.5914258, -0.4026673, 0, 0.6235294, 1, 1,
0.2039336, 1.865272, -0.068328, 0, 0.6156863, 1, 1,
0.205904, 0.1879705, 0.2111324, 0, 0.6117647, 1, 1,
0.2088594, -0.782074, 2.988723, 0, 0.6039216, 1, 1,
0.211106, 0.5789946, -0.6864458, 0, 0.5960785, 1, 1,
0.2119988, -1.020223, 2.609988, 0, 0.5921569, 1, 1,
0.218462, -0.619715, 2.501008, 0, 0.5843138, 1, 1,
0.220223, -0.4247613, 0.1311455, 0, 0.5803922, 1, 1,
0.2267637, 0.5912135, -0.875738, 0, 0.572549, 1, 1,
0.226878, -1.924723, 3.46267, 0, 0.5686275, 1, 1,
0.2272702, 0.2881818, 2.786788, 0, 0.5607843, 1, 1,
0.2286248, -0.3887031, 3.928442, 0, 0.5568628, 1, 1,
0.2291158, 1.636423, -1.15016, 0, 0.5490196, 1, 1,
0.2297908, -0.6521379, 2.698136, 0, 0.5450981, 1, 1,
0.232998, -1.656128, 3.127582, 0, 0.5372549, 1, 1,
0.235803, -2.180804, 4.604258, 0, 0.5333334, 1, 1,
0.2371191, 1.485352, -1.290497, 0, 0.5254902, 1, 1,
0.2453944, 0.03628294, 0.3952138, 0, 0.5215687, 1, 1,
0.2482115, 1.451727, -1.275815, 0, 0.5137255, 1, 1,
0.2517471, -1.210318, 2.684103, 0, 0.509804, 1, 1,
0.2533538, 0.4364037, -0.6303151, 0, 0.5019608, 1, 1,
0.2565422, 0.4226019, 2.408356, 0, 0.4941176, 1, 1,
0.2568824, -1.200664, 4.186864, 0, 0.4901961, 1, 1,
0.2618039, -2.67189, 1.864037, 0, 0.4823529, 1, 1,
0.2622285, -0.008410076, 1.502376, 0, 0.4784314, 1, 1,
0.2628136, -0.913922, 3.890788, 0, 0.4705882, 1, 1,
0.2632313, 0.7226834, 1.720387, 0, 0.4666667, 1, 1,
0.2638764, 0.5073161, 1.48586, 0, 0.4588235, 1, 1,
0.2640284, 0.1274236, 1.330477, 0, 0.454902, 1, 1,
0.2680178, 0.02144569, 1.41803, 0, 0.4470588, 1, 1,
0.2680346, -1.651228, 3.554331, 0, 0.4431373, 1, 1,
0.270723, 1.603288, -0.4313243, 0, 0.4352941, 1, 1,
0.2758491, 2.500968, 1.401679, 0, 0.4313726, 1, 1,
0.2767423, 1.045385, 2.919996, 0, 0.4235294, 1, 1,
0.2776607, -0.4944788, 2.808224, 0, 0.4196078, 1, 1,
0.2781903, -0.7136677, 4.091058, 0, 0.4117647, 1, 1,
0.2794911, 0.1334392, 0.8858824, 0, 0.4078431, 1, 1,
0.2849151, 0.07617366, 0.1961695, 0, 0.4, 1, 1,
0.285149, -0.5106907, -0.04412814, 0, 0.3921569, 1, 1,
0.2894809, 0.05130546, 1.502517, 0, 0.3882353, 1, 1,
0.2906943, 0.4614784, -0.5152223, 0, 0.3803922, 1, 1,
0.2910552, 1.09279, -0.5943729, 0, 0.3764706, 1, 1,
0.2992557, -0.3434068, 1.241652, 0, 0.3686275, 1, 1,
0.2993557, 0.3140604, 1.738474, 0, 0.3647059, 1, 1,
0.3006419, -0.3305627, 0.1186635, 0, 0.3568628, 1, 1,
0.3007634, -0.7552165, 1.574197, 0, 0.3529412, 1, 1,
0.3035609, -0.258215, 1.238078, 0, 0.345098, 1, 1,
0.3080137, 0.6314705, -1.035388, 0, 0.3411765, 1, 1,
0.3111512, -0.1274183, 0.9764555, 0, 0.3333333, 1, 1,
0.3117477, 0.5381837, 1.366477, 0, 0.3294118, 1, 1,
0.3148457, 0.4874732, 0.102557, 0, 0.3215686, 1, 1,
0.315669, -1.41456, 2.804388, 0, 0.3176471, 1, 1,
0.322561, -1.884824, 2.768791, 0, 0.3098039, 1, 1,
0.3228441, 0.3016789, 0.8146402, 0, 0.3058824, 1, 1,
0.3238193, 1.235175, 0.1919769, 0, 0.2980392, 1, 1,
0.3283042, -0.6057428, 2.54977, 0, 0.2901961, 1, 1,
0.3287067, 0.4591828, 2.742522, 0, 0.2862745, 1, 1,
0.3288552, -0.7892444, 3.475356, 0, 0.2784314, 1, 1,
0.335235, -0.2905769, 1.675046, 0, 0.2745098, 1, 1,
0.3358174, 1.517982, 0.5811837, 0, 0.2666667, 1, 1,
0.33818, -1.106245, 2.234742, 0, 0.2627451, 1, 1,
0.342763, 0.8067119, 1.153786, 0, 0.254902, 1, 1,
0.3439281, 0.1003614, 1.863794, 0, 0.2509804, 1, 1,
0.3448029, 1.4674, -0.7131696, 0, 0.2431373, 1, 1,
0.3449797, -1.741119, 2.897111, 0, 0.2392157, 1, 1,
0.3466786, -1.184405, 2.264268, 0, 0.2313726, 1, 1,
0.3494965, -0.5880652, 2.166079, 0, 0.227451, 1, 1,
0.3544527, 0.8292783, 0.7619124, 0, 0.2196078, 1, 1,
0.3588253, 0.633072, 1.023966, 0, 0.2156863, 1, 1,
0.3605423, 1.200472, -1.056091, 0, 0.2078431, 1, 1,
0.361193, 0.06136568, 2.308507, 0, 0.2039216, 1, 1,
0.3622118, 0.1603293, 0.9061748, 0, 0.1960784, 1, 1,
0.3629171, 0.5451052, -0.5040678, 0, 0.1882353, 1, 1,
0.3659951, -0.6583375, 3.918881, 0, 0.1843137, 1, 1,
0.3699539, -2.050377, 3.252086, 0, 0.1764706, 1, 1,
0.3700626, 0.05312119, 1.203395, 0, 0.172549, 1, 1,
0.3706469, -1.577402, 3.022956, 0, 0.1647059, 1, 1,
0.3741209, -0.713473, 4.842481, 0, 0.1607843, 1, 1,
0.3758136, 0.8331621, 1.801508, 0, 0.1529412, 1, 1,
0.3805605, -0.605038, 3.978265, 0, 0.1490196, 1, 1,
0.381886, -1.5547, 1.151313, 0, 0.1411765, 1, 1,
0.3830678, -0.09095673, 1.584185, 0, 0.1372549, 1, 1,
0.4001223, -0.3569875, 3.993441, 0, 0.1294118, 1, 1,
0.403973, 0.6754862, 0.6209749, 0, 0.1254902, 1, 1,
0.4071615, -0.7533126, 1.531093, 0, 0.1176471, 1, 1,
0.4120369, -0.6012132, 2.097318, 0, 0.1137255, 1, 1,
0.4131322, 0.08939123, 1.342373, 0, 0.1058824, 1, 1,
0.4142607, 0.7873654, 0.3658639, 0, 0.09803922, 1, 1,
0.4197519, -1.151842, 2.516414, 0, 0.09411765, 1, 1,
0.4217175, -1.221177, 3.218395, 0, 0.08627451, 1, 1,
0.4259848, -0.2130219, 2.905087, 0, 0.08235294, 1, 1,
0.4330368, -1.984243, 1.555339, 0, 0.07450981, 1, 1,
0.441682, 0.5262451, 1.670362, 0, 0.07058824, 1, 1,
0.4429428, -0.2046501, 1.108277, 0, 0.0627451, 1, 1,
0.4450174, 1.479503, 1.216324, 0, 0.05882353, 1, 1,
0.4458562, 1.228183, 0.9411908, 0, 0.05098039, 1, 1,
0.4481732, 0.7347827, 0.02856934, 0, 0.04705882, 1, 1,
0.4487364, 0.434158, -0.05854313, 0, 0.03921569, 1, 1,
0.4498881, 0.04873596, 2.017014, 0, 0.03529412, 1, 1,
0.4598666, 0.6456445, -0.9034319, 0, 0.02745098, 1, 1,
0.4620367, -0.405034, 3.675166, 0, 0.02352941, 1, 1,
0.4632492, 2.322689, 0.9100997, 0, 0.01568628, 1, 1,
0.4633739, -0.9233855, 3.259325, 0, 0.01176471, 1, 1,
0.4646343, 1.031536, 0.03877718, 0, 0.003921569, 1, 1,
0.4647028, 0.1438558, 0.800802, 0.003921569, 0, 1, 1,
0.4694393, -0.09026176, 3.312537, 0.007843138, 0, 1, 1,
0.4714059, 0.7161272, 2.330704, 0.01568628, 0, 1, 1,
0.4714195, -0.01460148, 1.514121, 0.01960784, 0, 1, 1,
0.4716923, -0.07376568, 1.817853, 0.02745098, 0, 1, 1,
0.4877764, 1.125871, 0.2328941, 0.03137255, 0, 1, 1,
0.4955302, -0.7600518, 1.838887, 0.03921569, 0, 1, 1,
0.4992809, 0.5766058, 1.356901, 0.04313726, 0, 1, 1,
0.4996727, 0.1898615, 0.04015953, 0.05098039, 0, 1, 1,
0.4999591, 0.3098949, 2.646363, 0.05490196, 0, 1, 1,
0.5022918, -1.413685, 3.177801, 0.0627451, 0, 1, 1,
0.5027133, -0.4784589, 2.929856, 0.06666667, 0, 1, 1,
0.5034345, 0.7033393, 0.4829776, 0.07450981, 0, 1, 1,
0.5084382, -1.020683, 1.276529, 0.07843138, 0, 1, 1,
0.5115964, 0.1483519, 2.640279, 0.08627451, 0, 1, 1,
0.514842, 0.3649406, 0.5051315, 0.09019608, 0, 1, 1,
0.5180724, -1.145058, 1.486351, 0.09803922, 0, 1, 1,
0.5188659, 1.046286, 0.2530249, 0.1058824, 0, 1, 1,
0.5247155, -0.8339562, 2.681777, 0.1098039, 0, 1, 1,
0.5247609, 0.6643199, 2.644043, 0.1176471, 0, 1, 1,
0.5256308, -0.6194666, 2.325537, 0.1215686, 0, 1, 1,
0.5289676, -0.4800607, 1.367521, 0.1294118, 0, 1, 1,
0.529499, -0.9089704, 2.872481, 0.1333333, 0, 1, 1,
0.5296732, 1.044752, 2.647031, 0.1411765, 0, 1, 1,
0.5311608, -0.460255, 2.992386, 0.145098, 0, 1, 1,
0.5350119, -1.045346, 3.013731, 0.1529412, 0, 1, 1,
0.5351428, -0.7449267, 3.288015, 0.1568628, 0, 1, 1,
0.5359975, 0.1454046, 2.817145, 0.1647059, 0, 1, 1,
0.5429404, 0.825798, 0.1768421, 0.1686275, 0, 1, 1,
0.5447719, 0.05627726, 1.635695, 0.1764706, 0, 1, 1,
0.5455034, -0.9755955, 3.701542, 0.1803922, 0, 1, 1,
0.5494513, 0.6052434, 1.123805, 0.1882353, 0, 1, 1,
0.5496867, 1.953105, 1.355392, 0.1921569, 0, 1, 1,
0.5502291, 0.3129622, 0.6605181, 0.2, 0, 1, 1,
0.5530069, 1.287155, 1.183372, 0.2078431, 0, 1, 1,
0.5649022, -1.142145, 4.074594, 0.2117647, 0, 1, 1,
0.5679288, 1.565884, -0.8913289, 0.2196078, 0, 1, 1,
0.5691575, -0.1565292, 1.600415, 0.2235294, 0, 1, 1,
0.5698424, 0.07555698, 1.077356, 0.2313726, 0, 1, 1,
0.5839774, 0.03115386, 1.95884, 0.2352941, 0, 1, 1,
0.5846049, 1.485863, 0.5858605, 0.2431373, 0, 1, 1,
0.5852122, -0.05805071, 1.694585, 0.2470588, 0, 1, 1,
0.5929655, -0.9129664, 3.205792, 0.254902, 0, 1, 1,
0.5933297, 1.213714, -0.613147, 0.2588235, 0, 1, 1,
0.5947207, -0.6446503, 3.148125, 0.2666667, 0, 1, 1,
0.598453, -2.176991, 2.616437, 0.2705882, 0, 1, 1,
0.6004183, -0.9033161, 2.921318, 0.2784314, 0, 1, 1,
0.6037188, -0.643155, 2.986292, 0.282353, 0, 1, 1,
0.6043128, -0.3575189, 0.8149629, 0.2901961, 0, 1, 1,
0.6046767, -0.8869897, 2.338856, 0.2941177, 0, 1, 1,
0.6163881, 0.2799679, 0.4051048, 0.3019608, 0, 1, 1,
0.6189808, 0.1107782, 0.7511138, 0.3098039, 0, 1, 1,
0.6194562, 0.9665952, -0.6678996, 0.3137255, 0, 1, 1,
0.6227412, 0.7671344, -0.3229014, 0.3215686, 0, 1, 1,
0.6292332, 0.4046265, 3.1505, 0.3254902, 0, 1, 1,
0.6353126, 0.8784088, 2.402708, 0.3333333, 0, 1, 1,
0.6358797, -0.1916014, 2.248272, 0.3372549, 0, 1, 1,
0.6365905, -0.3521879, 3.953513, 0.345098, 0, 1, 1,
0.6370559, -0.456897, 2.086115, 0.3490196, 0, 1, 1,
0.6424128, -1.540716, 1.771569, 0.3568628, 0, 1, 1,
0.6502146, 0.4180179, -0.3637522, 0.3607843, 0, 1, 1,
0.6547423, -0.3505906, 1.31871, 0.3686275, 0, 1, 1,
0.6569182, 0.1165659, 1.379113, 0.372549, 0, 1, 1,
0.6614286, 0.4920263, 1.859567, 0.3803922, 0, 1, 1,
0.6633269, -0.2383687, 1.054156, 0.3843137, 0, 1, 1,
0.6653088, 0.8329262, -0.0436388, 0.3921569, 0, 1, 1,
0.6721806, -0.7486405, 3.106323, 0.3960784, 0, 1, 1,
0.6788256, -1.604146, 0.7742473, 0.4039216, 0, 1, 1,
0.6789181, -0.1315045, 0.9885258, 0.4117647, 0, 1, 1,
0.6821526, 0.3706832, 2.228967, 0.4156863, 0, 1, 1,
0.6824511, -0.315644, 1.879285, 0.4235294, 0, 1, 1,
0.6868333, -0.2635024, 1.326894, 0.427451, 0, 1, 1,
0.6883562, -0.4396871, 1.554495, 0.4352941, 0, 1, 1,
0.6937835, 0.2457193, 0.4196889, 0.4392157, 0, 1, 1,
0.6940111, -0.7268459, 1.136689, 0.4470588, 0, 1, 1,
0.694524, -1.113954, 4.320847, 0.4509804, 0, 1, 1,
0.6977276, 0.875704, 0.8402948, 0.4588235, 0, 1, 1,
0.7005585, -0.2715053, 0.8010549, 0.4627451, 0, 1, 1,
0.7013132, -0.5407491, 2.011967, 0.4705882, 0, 1, 1,
0.7013922, -0.1365121, 0.8291442, 0.4745098, 0, 1, 1,
0.7017445, -0.006736449, 1.624233, 0.4823529, 0, 1, 1,
0.703345, 1.457077, 1.225118, 0.4862745, 0, 1, 1,
0.705094, 1.20424, -1.12484, 0.4941176, 0, 1, 1,
0.707111, -1.085508, 3.901493, 0.5019608, 0, 1, 1,
0.7098796, -1.182738, 3.742821, 0.5058824, 0, 1, 1,
0.714985, 0.4236203, 0.8340436, 0.5137255, 0, 1, 1,
0.7248254, 0.1918987, 0.963378, 0.5176471, 0, 1, 1,
0.7264779, -0.3730032, 1.927163, 0.5254902, 0, 1, 1,
0.7286176, -0.5867367, 1.955624, 0.5294118, 0, 1, 1,
0.7444129, 0.2285587, 1.20474, 0.5372549, 0, 1, 1,
0.7451582, -2.282792, 1.777017, 0.5411765, 0, 1, 1,
0.7474855, 0.344669, 0.7193773, 0.5490196, 0, 1, 1,
0.7482272, 1.389974, 0.5667526, 0.5529412, 0, 1, 1,
0.7521091, -0.6592143, 3.379084, 0.5607843, 0, 1, 1,
0.7528689, -1.060059, 2.492011, 0.5647059, 0, 1, 1,
0.756884, -0.2664974, 1.435309, 0.572549, 0, 1, 1,
0.762023, 0.0506966, 1.352387, 0.5764706, 0, 1, 1,
0.7622435, -0.525144, 1.989643, 0.5843138, 0, 1, 1,
0.7642443, 0.3967946, 0.88596, 0.5882353, 0, 1, 1,
0.7668557, -0.07118969, 1.105182, 0.5960785, 0, 1, 1,
0.7700934, -1.126062, 0.8944501, 0.6039216, 0, 1, 1,
0.7718117, 0.9976512, 0.936491, 0.6078432, 0, 1, 1,
0.773258, -1.565958, 2.072937, 0.6156863, 0, 1, 1,
0.773545, 0.3645424, 1.813751, 0.6196079, 0, 1, 1,
0.776175, 0.5243286, 2.378836, 0.627451, 0, 1, 1,
0.7765411, -0.6914262, 2.479252, 0.6313726, 0, 1, 1,
0.7786756, 0.8972719, -0.193671, 0.6392157, 0, 1, 1,
0.780481, -1.963485, 1.274498, 0.6431373, 0, 1, 1,
0.7847402, -1.545123, 1.812307, 0.6509804, 0, 1, 1,
0.7879907, -0.6070911, 1.991055, 0.654902, 0, 1, 1,
0.7940192, 0.5148298, 0.9305418, 0.6627451, 0, 1, 1,
0.7986214, 0.0738991, 2.22835, 0.6666667, 0, 1, 1,
0.799231, 0.2600992, 3.703356, 0.6745098, 0, 1, 1,
0.8006952, 0.391232, 0.6872601, 0.6784314, 0, 1, 1,
0.8008518, 0.6078717, 0.160585, 0.6862745, 0, 1, 1,
0.8051204, 1.026322, 1.149115, 0.6901961, 0, 1, 1,
0.8070419, -0.7407891, 1.488539, 0.6980392, 0, 1, 1,
0.8078061, 0.1038607, 2.569549, 0.7058824, 0, 1, 1,
0.8115438, -1.827594, 1.397666, 0.7098039, 0, 1, 1,
0.8196228, -0.4221588, 0.8489101, 0.7176471, 0, 1, 1,
0.822398, 1.31352, 0.8493023, 0.7215686, 0, 1, 1,
0.8229424, 1.438214, 0.9296008, 0.7294118, 0, 1, 1,
0.8257294, -0.3531245, 1.759656, 0.7333333, 0, 1, 1,
0.8373625, -0.7891124, 2.012603, 0.7411765, 0, 1, 1,
0.8391657, -2.241425, 1.819049, 0.7450981, 0, 1, 1,
0.8397055, -0.3688047, -0.8899709, 0.7529412, 0, 1, 1,
0.8407915, -1.123026, 3.402339, 0.7568628, 0, 1, 1,
0.8422486, -0.405876, 1.517334, 0.7647059, 0, 1, 1,
0.8443922, 0.8816251, 0.5629473, 0.7686275, 0, 1, 1,
0.8455243, 1.336041, -0.6588926, 0.7764706, 0, 1, 1,
0.8600202, 0.1172109, 2.721364, 0.7803922, 0, 1, 1,
0.8674476, -0.2389996, 1.811354, 0.7882353, 0, 1, 1,
0.8701694, -1.341277, 3.07682, 0.7921569, 0, 1, 1,
0.8715158, -0.8095022, 1.732682, 0.8, 0, 1, 1,
0.8738482, 1.404184, 0.07998868, 0.8078431, 0, 1, 1,
0.8828811, -0.2797029, 2.679572, 0.8117647, 0, 1, 1,
0.8861848, -0.1719953, 1.467714, 0.8196079, 0, 1, 1,
0.8899401, -1.198806, 4.610088, 0.8235294, 0, 1, 1,
0.8948343, 0.7885692, 0.5943099, 0.8313726, 0, 1, 1,
0.8967218, 0.3699031, 1.315891, 0.8352941, 0, 1, 1,
0.8994055, -0.07211257, 1.805067, 0.8431373, 0, 1, 1,
0.9031081, 0.1481079, 2.521429, 0.8470588, 0, 1, 1,
0.9033803, 0.5060502, 2.15576, 0.854902, 0, 1, 1,
0.9102943, 0.9729089, -1.491323, 0.8588235, 0, 1, 1,
0.9127005, -0.3604517, 2.923017, 0.8666667, 0, 1, 1,
0.9133843, -0.2369356, 1.619013, 0.8705882, 0, 1, 1,
0.9178528, -1.441878, 2.973705, 0.8784314, 0, 1, 1,
0.9202694, -2.557197, 3.621979, 0.8823529, 0, 1, 1,
0.9208446, -0.8483593, 3.009944, 0.8901961, 0, 1, 1,
0.9215279, -1.937013, 2.352729, 0.8941177, 0, 1, 1,
0.9236245, 0.3931339, 0.2817437, 0.9019608, 0, 1, 1,
0.9269713, 0.9306062, 0.08665896, 0.9098039, 0, 1, 1,
0.9274964, 1.3124, 0.6464182, 0.9137255, 0, 1, 1,
0.9294616, -0.08408847, 2.388306, 0.9215686, 0, 1, 1,
0.9303315, 1.341445, 2.660547, 0.9254902, 0, 1, 1,
0.9326508, 1.615306, 0.746102, 0.9333333, 0, 1, 1,
0.9343634, 1.1653, 3.23261, 0.9372549, 0, 1, 1,
0.9347904, -0.3852929, 1.526457, 0.945098, 0, 1, 1,
0.9353713, -0.1923443, 1.10235, 0.9490196, 0, 1, 1,
0.937209, -0.5172244, 1.414569, 0.9568627, 0, 1, 1,
0.9382346, -0.5599633, 0.5191159, 0.9607843, 0, 1, 1,
0.9386922, 1.433387, -0.3038286, 0.9686275, 0, 1, 1,
0.941314, 0.6114922, 2.278533, 0.972549, 0, 1, 1,
0.9479285, -0.6729545, 2.387466, 0.9803922, 0, 1, 1,
0.9481291, -1.520353, 1.88965, 0.9843137, 0, 1, 1,
0.9560884, -1.900806, 1.645339, 0.9921569, 0, 1, 1,
0.9609309, 2.040302, 1.192431, 0.9960784, 0, 1, 1,
0.9659063, 0.5009401, 0.8083255, 1, 0, 0.9960784, 1,
0.9661483, 0.2077034, 0.4651051, 1, 0, 0.9882353, 1,
0.9751188, -0.3993061, -0.1563376, 1, 0, 0.9843137, 1,
0.9831097, 1.101912, 1.230731, 1, 0, 0.9764706, 1,
0.9842908, -1.201987, 4.327647, 1, 0, 0.972549, 1,
0.986483, 0.5732923, 1.726727, 1, 0, 0.9647059, 1,
0.988824, 1.384348, 1.05019, 1, 0, 0.9607843, 1,
0.9927547, 0.8053332, 1.363372, 1, 0, 0.9529412, 1,
0.9958592, 1.299345, 0.4158776, 1, 0, 0.9490196, 1,
0.9964819, 0.4097296, 2.417453, 1, 0, 0.9411765, 1,
0.9972847, 0.4670982, -0.3795083, 1, 0, 0.9372549, 1,
0.9977144, 1.409016, 1.139544, 1, 0, 0.9294118, 1,
1.024321, 0.8409589, 0.4474239, 1, 0, 0.9254902, 1,
1.029784, -1.639592, 2.97425, 1, 0, 0.9176471, 1,
1.04438, 0.2534065, 2.246576, 1, 0, 0.9137255, 1,
1.04806, 0.833973, 1.497782, 1, 0, 0.9058824, 1,
1.050411, -0.6106545, 1.899815, 1, 0, 0.9019608, 1,
1.054023, -1.889418, 3.088498, 1, 0, 0.8941177, 1,
1.054932, 0.09930802, 0.92737, 1, 0, 0.8862745, 1,
1.05577, 0.1596887, 1.730089, 1, 0, 0.8823529, 1,
1.067698, -0.1920816, 2.610218, 1, 0, 0.8745098, 1,
1.094249, 1.712794, 0.1020499, 1, 0, 0.8705882, 1,
1.099029, -0.9088501, 2.79489, 1, 0, 0.8627451, 1,
1.103027, 1.034034, 1.039992, 1, 0, 0.8588235, 1,
1.103033, 1.983186, 0.7752856, 1, 0, 0.8509804, 1,
1.112155, -1.023921, 2.928976, 1, 0, 0.8470588, 1,
1.117388, 0.02262442, 1.575035, 1, 0, 0.8392157, 1,
1.122105, -0.4659373, 0.4943687, 1, 0, 0.8352941, 1,
1.12784, 0.1853602, 1.537584, 1, 0, 0.827451, 1,
1.133428, 1.259955, -0.4222994, 1, 0, 0.8235294, 1,
1.136279, 0.1286427, 2.162496, 1, 0, 0.8156863, 1,
1.136581, -0.6741743, 2.312034, 1, 0, 0.8117647, 1,
1.137263, 1.479351, -0.02959605, 1, 0, 0.8039216, 1,
1.138445, 0.6498289, -0.6675763, 1, 0, 0.7960784, 1,
1.13922, 0.5243775, 0.717619, 1, 0, 0.7921569, 1,
1.147958, -0.5364455, 1.761898, 1, 0, 0.7843137, 1,
1.148705, -0.3321266, 3.991675, 1, 0, 0.7803922, 1,
1.149533, -1.443593, 2.967622, 1, 0, 0.772549, 1,
1.15099, 0.2588981, 1.349961, 1, 0, 0.7686275, 1,
1.153655, 1.288968, -0.3793801, 1, 0, 0.7607843, 1,
1.156738, -0.09247151, 1.541549, 1, 0, 0.7568628, 1,
1.177446, -0.1810884, 1.739116, 1, 0, 0.7490196, 1,
1.18268, -0.7687379, 1.753012, 1, 0, 0.7450981, 1,
1.183733, 0.1623872, 0.5482363, 1, 0, 0.7372549, 1,
1.185413, -0.04404803, 1.671134, 1, 0, 0.7333333, 1,
1.188415, -0.475766, 1.928572, 1, 0, 0.7254902, 1,
1.18944, 0.3452733, 0.2693297, 1, 0, 0.7215686, 1,
1.191988, -0.01044121, 2.425785, 1, 0, 0.7137255, 1,
1.197311, 0.09070733, 0.4497394, 1, 0, 0.7098039, 1,
1.207895, 1.570776, 1.202296, 1, 0, 0.7019608, 1,
1.217407, -0.09384823, 3.173273, 1, 0, 0.6941177, 1,
1.225228, 0.4024139, 1.944544, 1, 0, 0.6901961, 1,
1.231904, -0.5870558, 1.2905, 1, 0, 0.682353, 1,
1.234316, 0.5478781, 0.4821898, 1, 0, 0.6784314, 1,
1.241764, 1.112934, 0.7755645, 1, 0, 0.6705883, 1,
1.243964, -0.7627087, 3.486275, 1, 0, 0.6666667, 1,
1.246567, 0.9130201, 0.4667263, 1, 0, 0.6588235, 1,
1.247221, -0.2397368, 0.8153629, 1, 0, 0.654902, 1,
1.250666, -2.267072, 3.271367, 1, 0, 0.6470588, 1,
1.266229, 0.2263422, -0.0368516, 1, 0, 0.6431373, 1,
1.26648, 0.6535659, 0.6270645, 1, 0, 0.6352941, 1,
1.273279, 0.022474, 1.040942, 1, 0, 0.6313726, 1,
1.2742, -0.3933566, 2.547894, 1, 0, 0.6235294, 1,
1.274375, 0.5695419, 0.8401401, 1, 0, 0.6196079, 1,
1.283554, 0.9444793, 1.531213, 1, 0, 0.6117647, 1,
1.289638, 0.3699652, 0.9976671, 1, 0, 0.6078432, 1,
1.289677, -0.5123288, 1.010263, 1, 0, 0.6, 1,
1.290125, -0.4510443, 1.956906, 1, 0, 0.5921569, 1,
1.290962, -1.710169, 1.951775, 1, 0, 0.5882353, 1,
1.300486, -0.7479126, 0.3792627, 1, 0, 0.5803922, 1,
1.302692, -0.7070275, 1.520993, 1, 0, 0.5764706, 1,
1.307202, 1.307537, 0.2254756, 1, 0, 0.5686275, 1,
1.307635, 0.4990886, 2.320788, 1, 0, 0.5647059, 1,
1.312671, 1.038103, 1.258622, 1, 0, 0.5568628, 1,
1.318113, -2.662684, 3.4064, 1, 0, 0.5529412, 1,
1.323248, -0.9034281, 0.5389208, 1, 0, 0.5450981, 1,
1.325179, -0.417217, -0.3151933, 1, 0, 0.5411765, 1,
1.326792, 2.786706, 1.664051, 1, 0, 0.5333334, 1,
1.331517, 0.5040709, 1.571169, 1, 0, 0.5294118, 1,
1.336391, 1.668561, 0.8902015, 1, 0, 0.5215687, 1,
1.33761, -1.646638, 0.7626848, 1, 0, 0.5176471, 1,
1.338011, 1.728283, 0.6332733, 1, 0, 0.509804, 1,
1.341002, 0.08724067, 1.768353, 1, 0, 0.5058824, 1,
1.341949, 1.334291, 1.665746, 1, 0, 0.4980392, 1,
1.343399, 0.4331322, 1.337937, 1, 0, 0.4901961, 1,
1.348087, 1.414957, 0.7458563, 1, 0, 0.4862745, 1,
1.354948, -2.028718, 2.29736, 1, 0, 0.4784314, 1,
1.358522, 0.4548534, 0.4622589, 1, 0, 0.4745098, 1,
1.358901, -1.15529, 2.909545, 1, 0, 0.4666667, 1,
1.373826, 1.42626, 0.5973617, 1, 0, 0.4627451, 1,
1.378338, 0.2587761, 0.3463761, 1, 0, 0.454902, 1,
1.389486, 0.05956418, 1.518352, 1, 0, 0.4509804, 1,
1.389537, 1.205961, -0.4724742, 1, 0, 0.4431373, 1,
1.404385, -1.043474, 1.677415, 1, 0, 0.4392157, 1,
1.412485, -2.545274, 3.468416, 1, 0, 0.4313726, 1,
1.428588, 0.3499771, 3.993484, 1, 0, 0.427451, 1,
1.432835, -0.2426856, 2.213085, 1, 0, 0.4196078, 1,
1.438274, -1.013156, 4.022052, 1, 0, 0.4156863, 1,
1.438701, 1.727839, 1.330995, 1, 0, 0.4078431, 1,
1.453605, -0.8410515, 0.9542633, 1, 0, 0.4039216, 1,
1.457371, -0.3560892, 2.851114, 1, 0, 0.3960784, 1,
1.460539, 0.9540882, 1.031046, 1, 0, 0.3882353, 1,
1.467314, 0.6725053, 0.8904527, 1, 0, 0.3843137, 1,
1.473896, 0.6352502, 3.322219, 1, 0, 0.3764706, 1,
1.479263, -0.4656534, 2.365178, 1, 0, 0.372549, 1,
1.496504, -1.689429, 3.565117, 1, 0, 0.3647059, 1,
1.52255, -1.438693, 2.592232, 1, 0, 0.3607843, 1,
1.535597, 0.0741825, 2.275836, 1, 0, 0.3529412, 1,
1.543937, 0.5208067, 0.2482093, 1, 0, 0.3490196, 1,
1.558234, 1.037762, 1.091901, 1, 0, 0.3411765, 1,
1.560713, 2.128391, 1.37141, 1, 0, 0.3372549, 1,
1.571683, 0.09611833, 0.8326887, 1, 0, 0.3294118, 1,
1.572129, -1.178331, 1.131618, 1, 0, 0.3254902, 1,
1.575165, -0.1121281, 2.254633, 1, 0, 0.3176471, 1,
1.59907, -1.081476, 2.564605, 1, 0, 0.3137255, 1,
1.605538, -0.5326508, 3.512517, 1, 0, 0.3058824, 1,
1.622358, 1.044286, -0.3551142, 1, 0, 0.2980392, 1,
1.64115, 0.1123035, 1.838253, 1, 0, 0.2941177, 1,
1.642706, 0.4958407, 2.312274, 1, 0, 0.2862745, 1,
1.648425, 1.292894, 0.7618678, 1, 0, 0.282353, 1,
1.650395, -1.323619, 1.043763, 1, 0, 0.2745098, 1,
1.658474, 1.407873, 0.6873753, 1, 0, 0.2705882, 1,
1.690773, -0.7526573, 1.861056, 1, 0, 0.2627451, 1,
1.695281, -0.4365112, 0.8120939, 1, 0, 0.2588235, 1,
1.76955, 1.348745, 1.604136, 1, 0, 0.2509804, 1,
1.773713, -0.7114829, 1.790172, 1, 0, 0.2470588, 1,
1.778388, 0.9291571, 1.773641, 1, 0, 0.2392157, 1,
1.806386, -0.5370439, 0.7305106, 1, 0, 0.2352941, 1,
1.80681, 0.4417529, -0.2610621, 1, 0, 0.227451, 1,
1.809432, 1.500082, 0.05062276, 1, 0, 0.2235294, 1,
1.810044, -0.2396084, 2.075404, 1, 0, 0.2156863, 1,
1.82001, -0.2000141, 2.873496, 1, 0, 0.2117647, 1,
1.825084, 0.6221921, 4.203472, 1, 0, 0.2039216, 1,
1.831327, -2.062754, 2.712944, 1, 0, 0.1960784, 1,
1.834563, 1.292154, 1.410973, 1, 0, 0.1921569, 1,
1.843039, 0.1812654, 1.874385, 1, 0, 0.1843137, 1,
1.854255, -0.4854078, 2.780596, 1, 0, 0.1803922, 1,
1.867969, -1.969451, 1.427619, 1, 0, 0.172549, 1,
1.905725, 1.983986, 1.929106, 1, 0, 0.1686275, 1,
1.909417, 0.4791984, 2.135055, 1, 0, 0.1607843, 1,
1.932518, -2.165093, 2.411274, 1, 0, 0.1568628, 1,
1.945305, -0.8267884, 1.747205, 1, 0, 0.1490196, 1,
2.003465, 0.5330765, 3.489554, 1, 0, 0.145098, 1,
2.006069, -1.743423, 2.777231, 1, 0, 0.1372549, 1,
2.068714, -0.2600146, 1.946161, 1, 0, 0.1333333, 1,
2.093084, -0.6959653, 3.123823, 1, 0, 0.1254902, 1,
2.106124, -1.728538, 2.137363, 1, 0, 0.1215686, 1,
2.139985, -0.0427843, 1.667183, 1, 0, 0.1137255, 1,
2.167398, -1.121795, 1.426315, 1, 0, 0.1098039, 1,
2.190615, 0.8515573, 0.293319, 1, 0, 0.1019608, 1,
2.240155, -0.8198367, 2.094806, 1, 0, 0.09411765, 1,
2.245989, -0.2334633, 1.647244, 1, 0, 0.09019608, 1,
2.253351, 0.9998835, 2.614596, 1, 0, 0.08235294, 1,
2.287523, 2.824608, 1.018757, 1, 0, 0.07843138, 1,
2.309783, 0.09975795, 2.043774, 1, 0, 0.07058824, 1,
2.313333, 0.8442044, 1.895901, 1, 0, 0.06666667, 1,
2.338247, -0.9444281, 1.725783, 1, 0, 0.05882353, 1,
2.338292, -0.5452526, 2.20245, 1, 0, 0.05490196, 1,
2.433669, -0.8318014, 1.856379, 1, 0, 0.04705882, 1,
2.457153, -0.9040539, 2.914374, 1, 0, 0.04313726, 1,
2.480943, -0.5229952, 2.831742, 1, 0, 0.03529412, 1,
2.518787, -0.1869644, 2.632998, 1, 0, 0.03137255, 1,
2.57166, 0.9738299, 2.786329, 1, 0, 0.02352941, 1,
2.578917, -0.2790948, 1.715041, 1, 0, 0.01960784, 1,
2.719999, 0.03006546, 1.277508, 1, 0, 0.01176471, 1,
3.477857, -0.0963147, 0.8996028, 1, 0, 0.007843138, 1
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
0.1233943, -3.741618, -7.909372, 0, -0.5, 0.5, 0.5,
0.1233943, -3.741618, -7.909372, 1, -0.5, 0.5, 0.5,
0.1233943, -3.741618, -7.909372, 1, 1.5, 0.5, 0.5,
0.1233943, -3.741618, -7.909372, 0, 1.5, 0.5, 0.5
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
-4.368231, 0.02581859, -7.909372, 0, -0.5, 0.5, 0.5,
-4.368231, 0.02581859, -7.909372, 1, -0.5, 0.5, 0.5,
-4.368231, 0.02581859, -7.909372, 1, 1.5, 0.5, 0.5,
-4.368231, 0.02581859, -7.909372, 0, 1.5, 0.5, 0.5
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
-4.368231, -3.741618, -0.3699663, 0, -0.5, 0.5, 0.5,
-4.368231, -3.741618, -0.3699663, 1, -0.5, 0.5, 0.5,
-4.368231, -3.741618, -0.3699663, 1, 1.5, 0.5, 0.5,
-4.368231, -3.741618, -0.3699663, 0, 1.5, 0.5, 0.5
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
-3, -2.87221, -6.169509,
3, -2.87221, -6.169509,
-3, -2.87221, -6.169509,
-3, -3.017111, -6.459486,
-2, -2.87221, -6.169509,
-2, -3.017111, -6.459486,
-1, -2.87221, -6.169509,
-1, -3.017111, -6.459486,
0, -2.87221, -6.169509,
0, -3.017111, -6.459486,
1, -2.87221, -6.169509,
1, -3.017111, -6.459486,
2, -2.87221, -6.169509,
2, -3.017111, -6.459486,
3, -2.87221, -6.169509,
3, -3.017111, -6.459486
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
-3, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
-3, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
-3, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
-3, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
-2, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
-2, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
-2, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
-2, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
-1, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
-1, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
-1, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
-1, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
0, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
0, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
0, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
0, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
1, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
1, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
1, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
1, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
2, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
2, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
2, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
2, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5,
3, -3.306914, -7.039441, 0, -0.5, 0.5, 0.5,
3, -3.306914, -7.039441, 1, -0.5, 0.5, 0.5,
3, -3.306914, -7.039441, 1, 1.5, 0.5, 0.5,
3, -3.306914, -7.039441, 0, 1.5, 0.5, 0.5
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
-3.331702, -2, -6.169509,
-3.331702, 2, -6.169509,
-3.331702, -2, -6.169509,
-3.504457, -2, -6.459486,
-3.331702, -1, -6.169509,
-3.504457, -1, -6.459486,
-3.331702, 0, -6.169509,
-3.504457, 0, -6.459486,
-3.331702, 1, -6.169509,
-3.504457, 1, -6.459486,
-3.331702, 2, -6.169509,
-3.504457, 2, -6.459486
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
-3.849967, -2, -7.039441, 0, -0.5, 0.5, 0.5,
-3.849967, -2, -7.039441, 1, -0.5, 0.5, 0.5,
-3.849967, -2, -7.039441, 1, 1.5, 0.5, 0.5,
-3.849967, -2, -7.039441, 0, 1.5, 0.5, 0.5,
-3.849967, -1, -7.039441, 0, -0.5, 0.5, 0.5,
-3.849967, -1, -7.039441, 1, -0.5, 0.5, 0.5,
-3.849967, -1, -7.039441, 1, 1.5, 0.5, 0.5,
-3.849967, -1, -7.039441, 0, 1.5, 0.5, 0.5,
-3.849967, 0, -7.039441, 0, -0.5, 0.5, 0.5,
-3.849967, 0, -7.039441, 1, -0.5, 0.5, 0.5,
-3.849967, 0, -7.039441, 1, 1.5, 0.5, 0.5,
-3.849967, 0, -7.039441, 0, 1.5, 0.5, 0.5,
-3.849967, 1, -7.039441, 0, -0.5, 0.5, 0.5,
-3.849967, 1, -7.039441, 1, -0.5, 0.5, 0.5,
-3.849967, 1, -7.039441, 1, 1.5, 0.5, 0.5,
-3.849967, 1, -7.039441, 0, 1.5, 0.5, 0.5,
-3.849967, 2, -7.039441, 0, -0.5, 0.5, 0.5,
-3.849967, 2, -7.039441, 1, -0.5, 0.5, 0.5,
-3.849967, 2, -7.039441, 1, 1.5, 0.5, 0.5,
-3.849967, 2, -7.039441, 0, 1.5, 0.5, 0.5
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
-3.331702, -2.87221, -6,
-3.331702, -2.87221, 4,
-3.331702, -2.87221, -6,
-3.504457, -3.017111, -6,
-3.331702, -2.87221, -4,
-3.504457, -3.017111, -4,
-3.331702, -2.87221, -2,
-3.504457, -3.017111, -2,
-3.331702, -2.87221, 0,
-3.504457, -3.017111, 0,
-3.331702, -2.87221, 2,
-3.504457, -3.017111, 2,
-3.331702, -2.87221, 4,
-3.504457, -3.017111, 4
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
"-6",
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
-3.849967, -3.306914, -6, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -6, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -6, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, -6, 0, 1.5, 0.5, 0.5,
-3.849967, -3.306914, -4, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -4, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -4, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, -4, 0, 1.5, 0.5, 0.5,
-3.849967, -3.306914, -2, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -2, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, -2, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, -2, 0, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 0, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 0, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 0, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 0, 0, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 2, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 2, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 2, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 2, 0, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 4, 0, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 4, 1, -0.5, 0.5, 0.5,
-3.849967, -3.306914, 4, 1, 1.5, 0.5, 0.5,
-3.849967, -3.306914, 4, 0, 1.5, 0.5, 0.5
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
-3.331702, -2.87221, -6.169509,
-3.331702, 2.923847, -6.169509,
-3.331702, -2.87221, 5.429576,
-3.331702, 2.923847, 5.429576,
-3.331702, -2.87221, -6.169509,
-3.331702, -2.87221, 5.429576,
-3.331702, 2.923847, -6.169509,
-3.331702, 2.923847, 5.429576,
-3.331702, -2.87221, -6.169509,
3.57849, -2.87221, -6.169509,
-3.331702, -2.87221, 5.429576,
3.57849, -2.87221, 5.429576,
-3.331702, 2.923847, -6.169509,
3.57849, 2.923847, -6.169509,
-3.331702, 2.923847, 5.429576,
3.57849, 2.923847, 5.429576,
3.57849, -2.87221, -6.169509,
3.57849, 2.923847, -6.169509,
3.57849, -2.87221, 5.429576,
3.57849, 2.923847, 5.429576,
3.57849, -2.87221, -6.169509,
3.57849, -2.87221, 5.429576,
3.57849, 2.923847, -6.169509,
3.57849, 2.923847, 5.429576
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
var radius = 7.845769;
var distance = 34.90671;
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
mvMatrix.translate( -0.1233943, -0.02581859, 0.3699663 );
mvMatrix.scale( 1.227607, 1.463581, 0.7313507 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90671);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


