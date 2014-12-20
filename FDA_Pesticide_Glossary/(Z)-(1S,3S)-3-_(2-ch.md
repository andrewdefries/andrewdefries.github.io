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
-3.531771, 2.433554, -0.5099881, 1, 0, 0, 1,
-3.185433, -0.9335591, -2.351055, 1, 0.007843138, 0, 1,
-2.960603, -0.5157153, -3.795358, 1, 0.01176471, 0, 1,
-2.911422, 0.7075537, -1.449125, 1, 0.01960784, 0, 1,
-2.801285, 0.02345797, 0.293383, 1, 0.02352941, 0, 1,
-2.716273, 1.117437, -0.1236437, 1, 0.03137255, 0, 1,
-2.677539, 1.415297, -1.072114, 1, 0.03529412, 0, 1,
-2.643035, -0.2651467, -1.828936, 1, 0.04313726, 0, 1,
-2.598897, -0.6507874, -3.063952, 1, 0.04705882, 0, 1,
-2.571029, -0.6120784, -1.545842, 1, 0.05490196, 0, 1,
-2.470809, 0.002533329, -1.368865, 1, 0.05882353, 0, 1,
-2.440781, -1.310366, -1.70248, 1, 0.06666667, 0, 1,
-2.418804, 1.012655, -2.390552, 1, 0.07058824, 0, 1,
-2.376363, -0.6619601, -1.903073, 1, 0.07843138, 0, 1,
-2.332037, 0.5744711, -0.6748167, 1, 0.08235294, 0, 1,
-2.312969, -0.6184754, -2.071316, 1, 0.09019608, 0, 1,
-2.260238, -1.171025, -2.713211, 1, 0.09411765, 0, 1,
-2.253532, 1.323581, -0.09657745, 1, 0.1019608, 0, 1,
-2.243359, 1.321129, -1.850244, 1, 0.1098039, 0, 1,
-2.242563, 0.6793699, -1.092286, 1, 0.1137255, 0, 1,
-2.178237, -0.3827017, -2.283451, 1, 0.1215686, 0, 1,
-2.120482, 0.2765822, -2.92263, 1, 0.1254902, 0, 1,
-2.113383, 0.04018769, -1.497597, 1, 0.1333333, 0, 1,
-2.10253, 0.614953, 0.1096647, 1, 0.1372549, 0, 1,
-2.090141, 1.893177, -0.1324328, 1, 0.145098, 0, 1,
-2.08289, 0.5085978, -2.128693, 1, 0.1490196, 0, 1,
-2.064636, -0.8039562, -1.941607, 1, 0.1568628, 0, 1,
-2.045345, 0.3820661, -1.873355, 1, 0.1607843, 0, 1,
-2.043387, 0.6490557, -1.738693, 1, 0.1686275, 0, 1,
-2.029612, -0.9884051, -0.2621435, 1, 0.172549, 0, 1,
-1.991777, -0.85965, -1.941538, 1, 0.1803922, 0, 1,
-1.987835, -0.1756158, -0.9920437, 1, 0.1843137, 0, 1,
-1.98713, 0.7325109, -2.381685, 1, 0.1921569, 0, 1,
-1.972876, 0.2236578, -2.467019, 1, 0.1960784, 0, 1,
-1.965196, -1.65773, -0.8482069, 1, 0.2039216, 0, 1,
-1.961335, 0.02595268, -1.81476, 1, 0.2117647, 0, 1,
-1.922965, 1.723709, -0.8809639, 1, 0.2156863, 0, 1,
-1.913541, 0.2951102, -1.651572, 1, 0.2235294, 0, 1,
-1.913408, 0.9792691, 0.651336, 1, 0.227451, 0, 1,
-1.913078, 1.098, 0.08763874, 1, 0.2352941, 0, 1,
-1.898948, -0.7588899, -2.522501, 1, 0.2392157, 0, 1,
-1.897011, -0.3081185, -1.377558, 1, 0.2470588, 0, 1,
-1.872162, -0.6144475, -3.145372, 1, 0.2509804, 0, 1,
-1.854505, 0.5872923, -0.3448538, 1, 0.2588235, 0, 1,
-1.825774, -0.9232258, -1.632035, 1, 0.2627451, 0, 1,
-1.817755, -0.03047815, -0.7523443, 1, 0.2705882, 0, 1,
-1.78972, 0.2626263, -0.6667556, 1, 0.2745098, 0, 1,
-1.781926, -0.4092721, -2.839536, 1, 0.282353, 0, 1,
-1.765674, -0.4106411, -1.557357, 1, 0.2862745, 0, 1,
-1.742677, 0.6993716, 0.07925523, 1, 0.2941177, 0, 1,
-1.73927, 1.931127, -0.6776595, 1, 0.3019608, 0, 1,
-1.666361, -0.5307922, -2.926754, 1, 0.3058824, 0, 1,
-1.646915, -0.7653649, -1.748602, 1, 0.3137255, 0, 1,
-1.646667, -0.9205995, -3.444674, 1, 0.3176471, 0, 1,
-1.61423, 0.509086, -0.2752755, 1, 0.3254902, 0, 1,
-1.605512, 0.4488682, -0.6519675, 1, 0.3294118, 0, 1,
-1.595234, 2.069664, -1.805788, 1, 0.3372549, 0, 1,
-1.588099, 0.8547903, -1.651563, 1, 0.3411765, 0, 1,
-1.579969, -1.021466, -2.145895, 1, 0.3490196, 0, 1,
-1.568688, -0.8659365, -1.765592, 1, 0.3529412, 0, 1,
-1.566767, -1.220397, -2.267616, 1, 0.3607843, 0, 1,
-1.555361, -1.220325, -1.618146, 1, 0.3647059, 0, 1,
-1.554568, -0.819594, -1.909743, 1, 0.372549, 0, 1,
-1.54806, 0.6521641, -2.104603, 1, 0.3764706, 0, 1,
-1.52775, 1.012179, -0.9247353, 1, 0.3843137, 0, 1,
-1.521241, -0.6527689, -0.1686361, 1, 0.3882353, 0, 1,
-1.518676, 0.3549763, -1.14791, 1, 0.3960784, 0, 1,
-1.515794, 0.6726884, -0.6278476, 1, 0.4039216, 0, 1,
-1.51434, -0.4836038, -0.891749, 1, 0.4078431, 0, 1,
-1.508924, -0.5344352, -2.975335, 1, 0.4156863, 0, 1,
-1.50121, 1.505139, -0.6303541, 1, 0.4196078, 0, 1,
-1.500187, -0.8023373, -3.100266, 1, 0.427451, 0, 1,
-1.494508, -1.140722, -2.153286, 1, 0.4313726, 0, 1,
-1.459791, 1.285995, -1.015089, 1, 0.4392157, 0, 1,
-1.459778, 1.149737, 0.06641345, 1, 0.4431373, 0, 1,
-1.453759, -0.3077421, -2.34081, 1, 0.4509804, 0, 1,
-1.452082, -0.01049434, -4.054779, 1, 0.454902, 0, 1,
-1.442888, -0.1567935, -3.207953, 1, 0.4627451, 0, 1,
-1.424915, 0.714377, -1.499239, 1, 0.4666667, 0, 1,
-1.423895, 0.2488024, -1.753897, 1, 0.4745098, 0, 1,
-1.420442, -0.8975548, -0.1239737, 1, 0.4784314, 0, 1,
-1.416331, -1.308753, -2.491393, 1, 0.4862745, 0, 1,
-1.414782, 0.494962, -2.109415, 1, 0.4901961, 0, 1,
-1.405705, -0.9044717, -3.193136, 1, 0.4980392, 0, 1,
-1.403848, 1.38487, -1.169856, 1, 0.5058824, 0, 1,
-1.397957, 0.8322196, -1.951935, 1, 0.509804, 0, 1,
-1.392291, -1.630037, -4.324194, 1, 0.5176471, 0, 1,
-1.384727, -0.8488894, -1.814772, 1, 0.5215687, 0, 1,
-1.381705, 0.3262827, -0.9479209, 1, 0.5294118, 0, 1,
-1.380251, 1.270629, -1.990222, 1, 0.5333334, 0, 1,
-1.380138, 1.279415, -1.702185, 1, 0.5411765, 0, 1,
-1.375046, -0.5771663, -1.369888, 1, 0.5450981, 0, 1,
-1.367107, 1.842213, -0.6468684, 1, 0.5529412, 0, 1,
-1.3622, 0.3204502, -2.97894, 1, 0.5568628, 0, 1,
-1.343848, -0.4288054, -1.930189, 1, 0.5647059, 0, 1,
-1.337138, 1.107619, -0.4815371, 1, 0.5686275, 0, 1,
-1.318523, -0.4849333, -1.915925, 1, 0.5764706, 0, 1,
-1.310189, -0.3985644, -0.4076926, 1, 0.5803922, 0, 1,
-1.301181, -0.8793097, -0.7950007, 1, 0.5882353, 0, 1,
-1.296667, -0.7858393, -0.9397381, 1, 0.5921569, 0, 1,
-1.294439, -1.597917, -2.893043, 1, 0.6, 0, 1,
-1.29117, -0.3388932, -1.710159, 1, 0.6078432, 0, 1,
-1.282483, 0.8819311, -0.6985681, 1, 0.6117647, 0, 1,
-1.275928, 1.480502, -0.6028818, 1, 0.6196079, 0, 1,
-1.267936, -1.900906, -2.380065, 1, 0.6235294, 0, 1,
-1.26448, 0.3875133, -2.276983, 1, 0.6313726, 0, 1,
-1.26266, 0.6665454, -0.8064697, 1, 0.6352941, 0, 1,
-1.260809, 1.066269, -0.08274175, 1, 0.6431373, 0, 1,
-1.259538, 0.262767, -1.535318, 1, 0.6470588, 0, 1,
-1.256974, 0.02938441, -1.850902, 1, 0.654902, 0, 1,
-1.250405, -0.543284, -0.6384061, 1, 0.6588235, 0, 1,
-1.244113, -1.079918, -1.082022, 1, 0.6666667, 0, 1,
-1.22457, 0.692632, -0.8587167, 1, 0.6705883, 0, 1,
-1.21871, -0.792143, -2.220099, 1, 0.6784314, 0, 1,
-1.185099, 0.002688296, -2.529234, 1, 0.682353, 0, 1,
-1.177583, -0.04184991, -1.190439, 1, 0.6901961, 0, 1,
-1.170698, -0.401462, -0.2460092, 1, 0.6941177, 0, 1,
-1.160203, -0.413394, -1.198635, 1, 0.7019608, 0, 1,
-1.157779, -0.6600903, -1.037451, 1, 0.7098039, 0, 1,
-1.157052, 0.5936512, -0.1252496, 1, 0.7137255, 0, 1,
-1.15585, -0.1321863, -2.288985, 1, 0.7215686, 0, 1,
-1.149499, 1.588397, -0.1038587, 1, 0.7254902, 0, 1,
-1.135163, -0.1147881, -2.622834, 1, 0.7333333, 0, 1,
-1.130715, 0.08954953, -1.714804, 1, 0.7372549, 0, 1,
-1.124761, -1.558361, -4.124606, 1, 0.7450981, 0, 1,
-1.120096, 0.06486947, -2.589824, 1, 0.7490196, 0, 1,
-1.119767, 0.220015, -2.938353, 1, 0.7568628, 0, 1,
-1.117997, 0.6677505, -1.331588, 1, 0.7607843, 0, 1,
-1.114549, 0.9494649, -1.263197, 1, 0.7686275, 0, 1,
-1.108477, -0.4733127, -0.5523049, 1, 0.772549, 0, 1,
-1.106855, -0.9152053, -3.481093, 1, 0.7803922, 0, 1,
-1.106768, 0.1841338, -0.1586358, 1, 0.7843137, 0, 1,
-1.106246, -1.108344, -1.726448, 1, 0.7921569, 0, 1,
-1.104108, -1.205451, -1.448733, 1, 0.7960784, 0, 1,
-1.102194, 1.077212, -0.7567805, 1, 0.8039216, 0, 1,
-1.100726, 0.6175388, 1.067842, 1, 0.8117647, 0, 1,
-1.094667, -0.7000705, -0.623298, 1, 0.8156863, 0, 1,
-1.092986, 0.4752616, -1.340634, 1, 0.8235294, 0, 1,
-1.086247, 0.4792816, -1.326714, 1, 0.827451, 0, 1,
-1.083286, -0.2785804, -2.503674, 1, 0.8352941, 0, 1,
-1.078065, -0.3613335, -0.9190002, 1, 0.8392157, 0, 1,
-1.07742, 1.66949, -0.6847199, 1, 0.8470588, 0, 1,
-1.069546, -0.3541746, -0.8987743, 1, 0.8509804, 0, 1,
-1.066462, 1.053113, -0.03742163, 1, 0.8588235, 0, 1,
-1.057587, 0.2005716, -2.760801, 1, 0.8627451, 0, 1,
-1.053568, 0.1352316, 0.09398668, 1, 0.8705882, 0, 1,
-1.049262, 1.580473, 0.7837859, 1, 0.8745098, 0, 1,
-1.042987, 0.134239, -1.10532, 1, 0.8823529, 0, 1,
-1.040931, -0.0296058, -0.7201726, 1, 0.8862745, 0, 1,
-1.040831, -0.7567207, 0.2540278, 1, 0.8941177, 0, 1,
-1.034879, -1.004308, -2.245107, 1, 0.8980392, 0, 1,
-1.031308, 2.814228, -2.160986, 1, 0.9058824, 0, 1,
-1.027419, -1.464714, -3.093787, 1, 0.9137255, 0, 1,
-1.022685, 0.6552498, -0.8387236, 1, 0.9176471, 0, 1,
-1.016731, 0.2248545, -2.206498, 1, 0.9254902, 0, 1,
-1.013741, 1.32967, -1.164797, 1, 0.9294118, 0, 1,
-1.000759, -0.5348662, -0.8851922, 1, 0.9372549, 0, 1,
-0.9979625, 0.01321483, -0.9526736, 1, 0.9411765, 0, 1,
-0.9908026, -0.08807531, -0.1515734, 1, 0.9490196, 0, 1,
-0.981763, 0.512003, -0.3737109, 1, 0.9529412, 0, 1,
-0.9769385, -0.474835, -0.5542998, 1, 0.9607843, 0, 1,
-0.9750146, 0.9664806, -1.67968, 1, 0.9647059, 0, 1,
-0.9707233, -3.081626, -3.038855, 1, 0.972549, 0, 1,
-0.9665641, -1.842082, 0.1764267, 1, 0.9764706, 0, 1,
-0.9664316, 1.209263, -1.470944, 1, 0.9843137, 0, 1,
-0.9653445, -0.4051521, -1.642146, 1, 0.9882353, 0, 1,
-0.9636262, -1.847979, -2.523972, 1, 0.9960784, 0, 1,
-0.9608704, -0.7171144, -1.199571, 0.9960784, 1, 0, 1,
-0.9608017, 0.3050483, -1.00825, 0.9921569, 1, 0, 1,
-0.9552213, -1.676476, -3.614669, 0.9843137, 1, 0, 1,
-0.9480722, 0.3282762, -1.23627, 0.9803922, 1, 0, 1,
-0.942617, 0.3175418, -1.946565, 0.972549, 1, 0, 1,
-0.9324184, -0.8122755, -1.179238, 0.9686275, 1, 0, 1,
-0.9300141, 0.3559086, 1.408103, 0.9607843, 1, 0, 1,
-0.92785, -0.03244225, -0.7327042, 0.9568627, 1, 0, 1,
-0.9262367, 0.9733813, 0.3325973, 0.9490196, 1, 0, 1,
-0.9247431, -0.4622735, -1.762002, 0.945098, 1, 0, 1,
-0.9220067, 0.8432449, -1.197705, 0.9372549, 1, 0, 1,
-0.9141368, -0.598463, -1.353135, 0.9333333, 1, 0, 1,
-0.8962712, -0.03986107, -0.3425075, 0.9254902, 1, 0, 1,
-0.8803159, -1.639831, -2.802423, 0.9215686, 1, 0, 1,
-0.8787647, -0.6078631, -1.978747, 0.9137255, 1, 0, 1,
-0.8726416, -0.2040403, -2.692375, 0.9098039, 1, 0, 1,
-0.8692271, 0.1107614, -2.161627, 0.9019608, 1, 0, 1,
-0.8679858, -0.6037121, -3.828273, 0.8941177, 1, 0, 1,
-0.8668164, 1.303444, -1.180209, 0.8901961, 1, 0, 1,
-0.8624335, 0.5292951, -1.820091, 0.8823529, 1, 0, 1,
-0.8621622, -1.140797, -3.858549, 0.8784314, 1, 0, 1,
-0.8578197, 0.2630647, -1.271305, 0.8705882, 1, 0, 1,
-0.8482184, 0.1887749, -1.525713, 0.8666667, 1, 0, 1,
-0.842528, 0.7472427, -1.228994, 0.8588235, 1, 0, 1,
-0.8416472, -0.1688915, -2.392715, 0.854902, 1, 0, 1,
-0.8396983, 0.09073518, -1.696182, 0.8470588, 1, 0, 1,
-0.837418, -1.6236, -2.087781, 0.8431373, 1, 0, 1,
-0.8364319, 1.024099, 0.698989, 0.8352941, 1, 0, 1,
-0.8339144, -0.1971522, -2.317072, 0.8313726, 1, 0, 1,
-0.8286756, -0.1507603, -1.776223, 0.8235294, 1, 0, 1,
-0.8267765, 0.2341616, -0.2597391, 0.8196079, 1, 0, 1,
-0.824881, 1.522893, -0.6279781, 0.8117647, 1, 0, 1,
-0.8216815, -0.3605604, -2.991288, 0.8078431, 1, 0, 1,
-0.8216811, -0.1776681, -0.8640062, 0.8, 1, 0, 1,
-0.8175681, -0.8660249, -1.742488, 0.7921569, 1, 0, 1,
-0.8169347, 0.3946824, -0.1570737, 0.7882353, 1, 0, 1,
-0.8165268, -0.7393094, -2.31411, 0.7803922, 1, 0, 1,
-0.8145551, 0.238431, -1.908546, 0.7764706, 1, 0, 1,
-0.8139615, -1.005388, -1.633542, 0.7686275, 1, 0, 1,
-0.8124945, 0.8117597, 0.9336661, 0.7647059, 1, 0, 1,
-0.8074527, -0.8203217, -1.672511, 0.7568628, 1, 0, 1,
-0.8021832, 2.695468, -0.5599589, 0.7529412, 1, 0, 1,
-0.801656, 0.1357356, -0.5887511, 0.7450981, 1, 0, 1,
-0.7992422, -0.9903659, -1.436987, 0.7411765, 1, 0, 1,
-0.7982258, -0.1356953, -2.556011, 0.7333333, 1, 0, 1,
-0.7955666, -1.532163, -2.657472, 0.7294118, 1, 0, 1,
-0.7937765, 0.6043438, -0.1933706, 0.7215686, 1, 0, 1,
-0.7923927, -0.9682486, -3.374043, 0.7176471, 1, 0, 1,
-0.7878159, 1.599432, -0.2226949, 0.7098039, 1, 0, 1,
-0.7872425, 0.08327337, -0.6563088, 0.7058824, 1, 0, 1,
-0.7871869, 0.5300587, 0.904573, 0.6980392, 1, 0, 1,
-0.7842292, -1.071137, -1.459848, 0.6901961, 1, 0, 1,
-0.7828065, -2.848562, -3.670648, 0.6862745, 1, 0, 1,
-0.778247, 0.2902293, -2.059403, 0.6784314, 1, 0, 1,
-0.767974, 0.7309458, -1.997909, 0.6745098, 1, 0, 1,
-0.7671092, 1.031868, 0.2043613, 0.6666667, 1, 0, 1,
-0.7660639, -0.3009498, -3.121198, 0.6627451, 1, 0, 1,
-0.7660615, -1.218565, -1.859637, 0.654902, 1, 0, 1,
-0.7658827, 0.1197665, -1.827511, 0.6509804, 1, 0, 1,
-0.7556157, 0.698599, -0.2034322, 0.6431373, 1, 0, 1,
-0.754896, 0.06590524, -3.028407, 0.6392157, 1, 0, 1,
-0.7537165, -0.8589477, -0.9522061, 0.6313726, 1, 0, 1,
-0.7526808, -0.7607946, -3.935221, 0.627451, 1, 0, 1,
-0.7519572, 0.02281049, 0.5127243, 0.6196079, 1, 0, 1,
-0.7513037, -0.5844839, -1.440523, 0.6156863, 1, 0, 1,
-0.747941, 0.3463267, -1.817459, 0.6078432, 1, 0, 1,
-0.7462142, -0.6191533, -1.615429, 0.6039216, 1, 0, 1,
-0.74471, -0.1987093, -0.837488, 0.5960785, 1, 0, 1,
-0.7293714, -1.041149, -3.288901, 0.5882353, 1, 0, 1,
-0.7108669, 1.061408, -1.220801, 0.5843138, 1, 0, 1,
-0.7106825, -1.240764, -3.809395, 0.5764706, 1, 0, 1,
-0.7097391, 0.8849397, -0.2388874, 0.572549, 1, 0, 1,
-0.7007325, -1.180941, -3.034224, 0.5647059, 1, 0, 1,
-0.69956, 0.4425517, -0.4956126, 0.5607843, 1, 0, 1,
-0.6994568, 0.2224125, -3.111897, 0.5529412, 1, 0, 1,
-0.6972292, -1.272412, -2.181776, 0.5490196, 1, 0, 1,
-0.6958202, -0.857115, -2.049731, 0.5411765, 1, 0, 1,
-0.6954525, -0.2993037, 0.1165112, 0.5372549, 1, 0, 1,
-0.6903998, 0.2431441, -2.143053, 0.5294118, 1, 0, 1,
-0.6863068, -0.4891862, -4.070221, 0.5254902, 1, 0, 1,
-0.6853335, 0.02201743, 0.2259004, 0.5176471, 1, 0, 1,
-0.6848282, -0.608632, -1.52316, 0.5137255, 1, 0, 1,
-0.6822725, -1.624914, -2.044401, 0.5058824, 1, 0, 1,
-0.6773639, -0.6330897, -2.461988, 0.5019608, 1, 0, 1,
-0.6767614, 0.1443125, -1.932555, 0.4941176, 1, 0, 1,
-0.6753284, 1.276386, -1.971344, 0.4862745, 1, 0, 1,
-0.6743652, -0.3901049, -0.725764, 0.4823529, 1, 0, 1,
-0.6739398, -1.46929, -2.179006, 0.4745098, 1, 0, 1,
-0.6720104, 0.1980704, -0.8957944, 0.4705882, 1, 0, 1,
-0.6705626, 0.2416867, -1.642174, 0.4627451, 1, 0, 1,
-0.6639845, 0.3585577, -1.581263, 0.4588235, 1, 0, 1,
-0.6546569, -0.7214964, -2.902233, 0.4509804, 1, 0, 1,
-0.6542632, 0.6871923, -0.5801432, 0.4470588, 1, 0, 1,
-0.6500345, -0.6744732, -3.432462, 0.4392157, 1, 0, 1,
-0.6499331, 0.5205008, -1.420098, 0.4352941, 1, 0, 1,
-0.6489175, -0.8508132, -1.343322, 0.427451, 1, 0, 1,
-0.6482651, -0.9249268, -2.688391, 0.4235294, 1, 0, 1,
-0.6467264, 1.618096, -1.114659, 0.4156863, 1, 0, 1,
-0.6466406, -0.557963, -3.37396, 0.4117647, 1, 0, 1,
-0.6458699, -0.3474856, -1.705569, 0.4039216, 1, 0, 1,
-0.6372208, -0.5532228, -1.377857, 0.3960784, 1, 0, 1,
-0.6272315, 0.3288008, -1.826135, 0.3921569, 1, 0, 1,
-0.6272249, -0.6106735, -1.476603, 0.3843137, 1, 0, 1,
-0.6224888, 0.1365384, -1.304588, 0.3803922, 1, 0, 1,
-0.6157248, 0.709475, -1.298721, 0.372549, 1, 0, 1,
-0.6105173, -0.3698606, -2.823933, 0.3686275, 1, 0, 1,
-0.6056082, -0.5492519, -1.576879, 0.3607843, 1, 0, 1,
-0.600115, 0.628631, -0.2204562, 0.3568628, 1, 0, 1,
-0.5992863, 0.9942124, -0.1249939, 0.3490196, 1, 0, 1,
-0.5921565, -1.011662, -3.650612, 0.345098, 1, 0, 1,
-0.5916904, -1.659335, -2.558732, 0.3372549, 1, 0, 1,
-0.5914814, -1.279338, -3.586567, 0.3333333, 1, 0, 1,
-0.5897089, 1.107528, 1.126727, 0.3254902, 1, 0, 1,
-0.5890748, -0.6407982, -3.810757, 0.3215686, 1, 0, 1,
-0.5831195, 0.1273288, -0.1046768, 0.3137255, 1, 0, 1,
-0.5792307, 1.062545, 0.9712829, 0.3098039, 1, 0, 1,
-0.5647576, -0.26092, -3.020057, 0.3019608, 1, 0, 1,
-0.5614882, -0.09362056, -1.859489, 0.2941177, 1, 0, 1,
-0.555522, 1.658747, -2.059848, 0.2901961, 1, 0, 1,
-0.5424604, -0.4343671, -3.935059, 0.282353, 1, 0, 1,
-0.5423764, 0.5470642, -1.27343, 0.2784314, 1, 0, 1,
-0.5420327, -0.2397725, -2.801549, 0.2705882, 1, 0, 1,
-0.5408871, 0.09307267, -0.8595931, 0.2666667, 1, 0, 1,
-0.5401628, 1.331823, 0.5612376, 0.2588235, 1, 0, 1,
-0.538262, -0.6049473, -2.775737, 0.254902, 1, 0, 1,
-0.5376226, -0.2739029, -2.575337, 0.2470588, 1, 0, 1,
-0.5309577, 0.7625089, 0.9861232, 0.2431373, 1, 0, 1,
-0.5292704, 0.4283958, -0.2382496, 0.2352941, 1, 0, 1,
-0.5283959, -2.092316, -0.7191252, 0.2313726, 1, 0, 1,
-0.5242617, -0.206579, -1.030182, 0.2235294, 1, 0, 1,
-0.5214145, 1.299338, -0.7387462, 0.2196078, 1, 0, 1,
-0.5210935, 0.1876644, -2.223483, 0.2117647, 1, 0, 1,
-0.5207965, -2.297004, -2.301304, 0.2078431, 1, 0, 1,
-0.5080658, -1.137912, -3.184513, 0.2, 1, 0, 1,
-0.5056459, 0.9477807, -1.542873, 0.1921569, 1, 0, 1,
-0.5056171, -0.9887582, -2.784151, 0.1882353, 1, 0, 1,
-0.5049418, -0.01616025, -1.898059, 0.1803922, 1, 0, 1,
-0.5033938, 0.2640229, -0.2043318, 0.1764706, 1, 0, 1,
-0.500228, 0.6336962, -0.3661853, 0.1686275, 1, 0, 1,
-0.4957974, 1.611417, -1.503132, 0.1647059, 1, 0, 1,
-0.4947091, -1.124867, -2.075161, 0.1568628, 1, 0, 1,
-0.4926179, -0.08709749, -0.8985708, 0.1529412, 1, 0, 1,
-0.4921329, 0.3240818, -0.1131419, 0.145098, 1, 0, 1,
-0.4916968, 0.2950043, -1.093534, 0.1411765, 1, 0, 1,
-0.4911908, 0.1307863, -0.453242, 0.1333333, 1, 0, 1,
-0.4756961, 0.6524764, -2.558568, 0.1294118, 1, 0, 1,
-0.4729327, 0.8385487, 0.4581106, 0.1215686, 1, 0, 1,
-0.4691998, -0.1170837, -1.122867, 0.1176471, 1, 0, 1,
-0.4670388, 0.1488538, -0.7569196, 0.1098039, 1, 0, 1,
-0.4647846, 1.010426, 0.5808374, 0.1058824, 1, 0, 1,
-0.4572387, -0.1420192, -0.5123755, 0.09803922, 1, 0, 1,
-0.455417, -0.7427173, -1.46092, 0.09019608, 1, 0, 1,
-0.4535756, -0.6160349, -2.395329, 0.08627451, 1, 0, 1,
-0.4495716, -1.110201, -1.792051, 0.07843138, 1, 0, 1,
-0.4430856, -0.3158431, -3.541015, 0.07450981, 1, 0, 1,
-0.4426197, 0.1895514, -2.615371, 0.06666667, 1, 0, 1,
-0.4373723, 0.8772038, 0.6395702, 0.0627451, 1, 0, 1,
-0.4362438, -1.350916, -3.201165, 0.05490196, 1, 0, 1,
-0.4305009, -0.8981906, -3.976832, 0.05098039, 1, 0, 1,
-0.4301966, 0.1618125, -1.336932, 0.04313726, 1, 0, 1,
-0.4248115, 1.331322, 0.8431886, 0.03921569, 1, 0, 1,
-0.4246022, -3.175501, -3.09146, 0.03137255, 1, 0, 1,
-0.4238055, -0.5113595, -3.044423, 0.02745098, 1, 0, 1,
-0.4191351, -1.339414, -1.762163, 0.01960784, 1, 0, 1,
-0.4184019, 0.3141213, -0.3290962, 0.01568628, 1, 0, 1,
-0.4162378, -1.148818, -2.441156, 0.007843138, 1, 0, 1,
-0.4125566, -0.9379146, -3.55106, 0.003921569, 1, 0, 1,
-0.4125366, 0.1116738, -0.5530512, 0, 1, 0.003921569, 1,
-0.4119242, -1.498108, -2.600584, 0, 1, 0.01176471, 1,
-0.4049999, 0.5622544, -3.300468, 0, 1, 0.01568628, 1,
-0.4047345, 1.645739, -0.4301968, 0, 1, 0.02352941, 1,
-0.4025459, -1.823337, -2.321945, 0, 1, 0.02745098, 1,
-0.3964032, 1.134191, 0.199266, 0, 1, 0.03529412, 1,
-0.396396, -0.3313794, -1.502935, 0, 1, 0.03921569, 1,
-0.3943022, 0.1831787, -2.196813, 0, 1, 0.04705882, 1,
-0.3909254, -0.7570307, -3.275561, 0, 1, 0.05098039, 1,
-0.3900136, 1.119205, -1.460131, 0, 1, 0.05882353, 1,
-0.3790229, 0.4871728, 0.5554152, 0, 1, 0.0627451, 1,
-0.3773806, -0.01680478, -1.373622, 0, 1, 0.07058824, 1,
-0.3758387, 0.7947798, -2.193146, 0, 1, 0.07450981, 1,
-0.3755768, 2.246125, 1.100267, 0, 1, 0.08235294, 1,
-0.3751466, 0.1665911, -0.9880623, 0, 1, 0.08627451, 1,
-0.3663236, -1.004668, -3.308916, 0, 1, 0.09411765, 1,
-0.3657542, -1.155878, -2.372208, 0, 1, 0.1019608, 1,
-0.3640403, 2.081792, 0.1435137, 0, 1, 0.1058824, 1,
-0.3635205, 2.398494, -0.3308661, 0, 1, 0.1137255, 1,
-0.359153, -0.3115827, -4.71683, 0, 1, 0.1176471, 1,
-0.3588793, 0.8316966, 0.7033445, 0, 1, 0.1254902, 1,
-0.3583369, -1.225548, -2.276118, 0, 1, 0.1294118, 1,
-0.3572112, 0.03968508, -0.9766319, 0, 1, 0.1372549, 1,
-0.3567708, 0.06543961, -3.442364, 0, 1, 0.1411765, 1,
-0.3563761, -0.5707526, -1.613042, 0, 1, 0.1490196, 1,
-0.3548046, -1.579658, -3.645768, 0, 1, 0.1529412, 1,
-0.3531389, 2.320894, -0.8212504, 0, 1, 0.1607843, 1,
-0.3501208, 2.828291, -0.1954678, 0, 1, 0.1647059, 1,
-0.3488459, 0.4680527, -1.609824, 0, 1, 0.172549, 1,
-0.3464862, -0.7636121, -1.754843, 0, 1, 0.1764706, 1,
-0.3444847, 0.4115917, -0.06493539, 0, 1, 0.1843137, 1,
-0.338192, 0.6277341, 1.294449, 0, 1, 0.1882353, 1,
-0.3353087, 1.059739, -1.726424, 0, 1, 0.1960784, 1,
-0.3342741, -0.8124551, -5.185294, 0, 1, 0.2039216, 1,
-0.3335712, 0.9837183, 1.632849, 0, 1, 0.2078431, 1,
-0.3289324, 0.1201643, 0.2536292, 0, 1, 0.2156863, 1,
-0.3249719, 0.02392999, -2.190903, 0, 1, 0.2196078, 1,
-0.3191088, -1.571672, -2.992839, 0, 1, 0.227451, 1,
-0.3143648, -0.6086764, -2.383852, 0, 1, 0.2313726, 1,
-0.3107752, -0.4707714, -3.609111, 0, 1, 0.2392157, 1,
-0.2986064, 0.9916686, 1.445179, 0, 1, 0.2431373, 1,
-0.2938419, 0.8671356, 1.094341, 0, 1, 0.2509804, 1,
-0.2930646, -1.553678, -2.947865, 0, 1, 0.254902, 1,
-0.2916919, 0.2686404, 1.147821, 0, 1, 0.2627451, 1,
-0.286086, 0.6417544, -0.3496034, 0, 1, 0.2666667, 1,
-0.2841442, 0.001905963, -0.5758765, 0, 1, 0.2745098, 1,
-0.28222, 0.6179647, -0.2333996, 0, 1, 0.2784314, 1,
-0.2821319, -0.5285146, -1.645707, 0, 1, 0.2862745, 1,
-0.2817726, 1.247836, 0.7809379, 0, 1, 0.2901961, 1,
-0.2721135, -0.9791424, -4.140386, 0, 1, 0.2980392, 1,
-0.2710559, -1.185085, -2.497729, 0, 1, 0.3058824, 1,
-0.2703197, 0.02353078, -1.13135, 0, 1, 0.3098039, 1,
-0.2685429, 0.7688016, -0.7354777, 0, 1, 0.3176471, 1,
-0.2665368, -1.485313, -4.835479, 0, 1, 0.3215686, 1,
-0.260652, 0.01183703, -2.320312, 0, 1, 0.3294118, 1,
-0.2541218, 0.002813498, -1.837454, 0, 1, 0.3333333, 1,
-0.2519965, 1.206161, -0.7774974, 0, 1, 0.3411765, 1,
-0.2496621, -0.4741101, -1.176381, 0, 1, 0.345098, 1,
-0.2457784, 0.7452109, -0.07421141, 0, 1, 0.3529412, 1,
-0.2391122, 0.2258188, -1.967984, 0, 1, 0.3568628, 1,
-0.2377091, 0.58529, -0.8297818, 0, 1, 0.3647059, 1,
-0.236185, 0.2850896, 0.3897876, 0, 1, 0.3686275, 1,
-0.2345799, -2.114988, -0.9238111, 0, 1, 0.3764706, 1,
-0.2308161, -0.7092938, -3.377918, 0, 1, 0.3803922, 1,
-0.2307868, -0.203667, -1.885222, 0, 1, 0.3882353, 1,
-0.2301382, -0.3931203, -2.203916, 0, 1, 0.3921569, 1,
-0.2276551, -1.365714, -2.246601, 0, 1, 0.4, 1,
-0.2259027, -1.296722, -3.477501, 0, 1, 0.4078431, 1,
-0.2233766, -0.2800775, 0.236922, 0, 1, 0.4117647, 1,
-0.2186515, 0.4272116, 0.8390013, 0, 1, 0.4196078, 1,
-0.21791, 0.1607721, -2.895731, 0, 1, 0.4235294, 1,
-0.2170005, 1.509942, -0.4175367, 0, 1, 0.4313726, 1,
-0.2154619, -1.263667, -3.381369, 0, 1, 0.4352941, 1,
-0.2144475, 0.4872595, -1.964253, 0, 1, 0.4431373, 1,
-0.213849, -0.5508748, -2.38106, 0, 1, 0.4470588, 1,
-0.2115309, -0.950859, -1.519409, 0, 1, 0.454902, 1,
-0.2071467, -0.9179056, -1.779509, 0, 1, 0.4588235, 1,
-0.2062186, -1.102696, -1.587417, 0, 1, 0.4666667, 1,
-0.2020096, -0.5508646, -3.641946, 0, 1, 0.4705882, 1,
-0.1996689, -1.839494, -5.705482, 0, 1, 0.4784314, 1,
-0.1951492, -0.5434367, -0.5080345, 0, 1, 0.4823529, 1,
-0.1901502, -0.934488, -4.299194, 0, 1, 0.4901961, 1,
-0.1896587, -0.4988993, -3.813212, 0, 1, 0.4941176, 1,
-0.1886583, 1.321662, 0.5140767, 0, 1, 0.5019608, 1,
-0.1884953, -0.09188936, -1.945996, 0, 1, 0.509804, 1,
-0.1851447, 0.1816736, -1.633042, 0, 1, 0.5137255, 1,
-0.1802253, 0.6734999, 0.9074131, 0, 1, 0.5215687, 1,
-0.1796247, -0.2060297, -2.187911, 0, 1, 0.5254902, 1,
-0.1756333, 0.09537595, -0.06204101, 0, 1, 0.5333334, 1,
-0.1712145, 0.3153588, 0.3585927, 0, 1, 0.5372549, 1,
-0.169131, 1.332304, -1.131716, 0, 1, 0.5450981, 1,
-0.1686242, -1.520809, -1.920888, 0, 1, 0.5490196, 1,
-0.1676413, 0.1924371, -1.214884, 0, 1, 0.5568628, 1,
-0.1565593, -1.134692, -4.335303, 0, 1, 0.5607843, 1,
-0.155105, 0.5614589, -0.5985416, 0, 1, 0.5686275, 1,
-0.14268, 0.502096, -0.4402073, 0, 1, 0.572549, 1,
-0.1425643, 0.328793, 0.3434152, 0, 1, 0.5803922, 1,
-0.1294791, 0.9936603, -0.8587574, 0, 1, 0.5843138, 1,
-0.1263318, 0.4909573, -1.677725, 0, 1, 0.5921569, 1,
-0.1258721, 2.049057, 1.668826, 0, 1, 0.5960785, 1,
-0.1245579, -1.842347, -4.056826, 0, 1, 0.6039216, 1,
-0.1205028, 1.541371, -2.243158, 0, 1, 0.6117647, 1,
-0.1194432, 0.5537778, -1.47504, 0, 1, 0.6156863, 1,
-0.1150502, 1.24846, -1.125022, 0, 1, 0.6235294, 1,
-0.1032678, -0.4789853, -1.841985, 0, 1, 0.627451, 1,
-0.09999513, -0.8747618, -2.598087, 0, 1, 0.6352941, 1,
-0.09802578, 0.7369378, -0.1954811, 0, 1, 0.6392157, 1,
-0.09627563, -1.204341, -4.519726, 0, 1, 0.6470588, 1,
-0.09526674, -0.6125862, -3.282226, 0, 1, 0.6509804, 1,
-0.08990347, 1.037658, -0.1754764, 0, 1, 0.6588235, 1,
-0.0897752, 0.8011779, -1.578397, 0, 1, 0.6627451, 1,
-0.08489034, 1.084013, -0.1503928, 0, 1, 0.6705883, 1,
-0.08479521, 0.9681162, 1.167733, 0, 1, 0.6745098, 1,
-0.07738546, -1.116043, -2.125339, 0, 1, 0.682353, 1,
-0.07388859, 1.433657, 1.150658, 0, 1, 0.6862745, 1,
-0.06846324, 0.7507018, -0.7066457, 0, 1, 0.6941177, 1,
-0.06845096, 0.6677239, -0.08682636, 0, 1, 0.7019608, 1,
-0.06773479, 0.6200206, 1.047586, 0, 1, 0.7058824, 1,
-0.06316209, 2.273543, -0.3148262, 0, 1, 0.7137255, 1,
-0.0618471, -2.195212, -4.08663, 0, 1, 0.7176471, 1,
-0.06166082, -0.2053016, -1.786987, 0, 1, 0.7254902, 1,
-0.06145791, -0.4636507, -3.42057, 0, 1, 0.7294118, 1,
-0.06141143, 0.2154267, -0.5719936, 0, 1, 0.7372549, 1,
-0.06097395, 0.2815229, -0.4881575, 0, 1, 0.7411765, 1,
-0.06087294, -0.1707518, -1.945261, 0, 1, 0.7490196, 1,
-0.05871282, -0.6936662, -3.607446, 0, 1, 0.7529412, 1,
-0.05703027, -0.138193, -5.781633, 0, 1, 0.7607843, 1,
-0.05088507, -0.435269, -3.609282, 0, 1, 0.7647059, 1,
-0.04665329, -0.1588438, -3.90309, 0, 1, 0.772549, 1,
-0.04284579, -0.6315996, -3.139098, 0, 1, 0.7764706, 1,
-0.04240182, 0.9742375, -0.8860367, 0, 1, 0.7843137, 1,
-0.04008333, 0.2962265, 1.334828, 0, 1, 0.7882353, 1,
-0.03991558, -0.2724103, -4.031208, 0, 1, 0.7960784, 1,
-0.03964918, 0.1444363, -0.8072582, 0, 1, 0.8039216, 1,
-0.03766423, 2.744135, -0.908766, 0, 1, 0.8078431, 1,
-0.03516157, 0.802183, 1.367374, 0, 1, 0.8156863, 1,
-0.03333094, 1.823156, -1.655058, 0, 1, 0.8196079, 1,
-0.03040378, 0.4592207, 0.5097227, 0, 1, 0.827451, 1,
-0.02916951, -0.1751248, -2.57038, 0, 1, 0.8313726, 1,
-0.02427347, 1.079312, -1.395094, 0, 1, 0.8392157, 1,
-0.02320696, 0.02738036, -0.8383321, 0, 1, 0.8431373, 1,
-0.02232604, -0.5926919, -2.922197, 0, 1, 0.8509804, 1,
-0.0206538, -0.1739876, -3.75084, 0, 1, 0.854902, 1,
-0.02017326, 0.6953756, 0.7981163, 0, 1, 0.8627451, 1,
-0.01761519, -0.5155296, -3.010501, 0, 1, 0.8666667, 1,
-0.01625852, -0.3427543, -4.311043, 0, 1, 0.8745098, 1,
-0.01490179, -0.4816642, -3.562685, 0, 1, 0.8784314, 1,
-0.007833126, 0.3784805, -1.299888, 0, 1, 0.8862745, 1,
-0.002573063, -0.4322292, -2.661, 0, 1, 0.8901961, 1,
-0.002205669, -1.121101, -3.363494, 0, 1, 0.8980392, 1,
0.0133907, -3.098575, 2.599286, 0, 1, 0.9058824, 1,
0.01579772, -0.8198284, 2.202002, 0, 1, 0.9098039, 1,
0.01707562, 0.01029173, 2.62551, 0, 1, 0.9176471, 1,
0.02104368, -0.497178, 4.057768, 0, 1, 0.9215686, 1,
0.03120005, 0.4531974, -0.873187, 0, 1, 0.9294118, 1,
0.03571843, -0.6325919, 2.530302, 0, 1, 0.9333333, 1,
0.03878802, -1.304336, 4.242383, 0, 1, 0.9411765, 1,
0.039278, -0.06904719, 1.880123, 0, 1, 0.945098, 1,
0.03986809, 1.266874, 0.5141883, 0, 1, 0.9529412, 1,
0.04193795, -0.4045129, 5.417447, 0, 1, 0.9568627, 1,
0.04705391, -0.4187327, 2.470206, 0, 1, 0.9647059, 1,
0.05368602, -0.4052343, 3.020922, 0, 1, 0.9686275, 1,
0.05784771, 0.42494, 0.2489224, 0, 1, 0.9764706, 1,
0.0582153, -0.1800375, 1.926767, 0, 1, 0.9803922, 1,
0.06076963, -0.3549622, 3.325517, 0, 1, 0.9882353, 1,
0.06617256, 0.5824345, -0.8112785, 0, 1, 0.9921569, 1,
0.06637232, -1.114263, 3.055274, 0, 1, 1, 1,
0.07329702, 1.505187, -0.3962636, 0, 0.9921569, 1, 1,
0.07641187, -0.5550055, 2.479125, 0, 0.9882353, 1, 1,
0.07790379, 0.09622198, 1.016825, 0, 0.9803922, 1, 1,
0.07859667, 2.258384, -0.4296894, 0, 0.9764706, 1, 1,
0.07938124, 0.8364868, 1.214229, 0, 0.9686275, 1, 1,
0.08013622, -0.3876181, 2.504451, 0, 0.9647059, 1, 1,
0.08240828, 0.7213599, 0.9023402, 0, 0.9568627, 1, 1,
0.08500995, -0.5183211, 3.754295, 0, 0.9529412, 1, 1,
0.08549621, 0.223501, -0.06288396, 0, 0.945098, 1, 1,
0.08675662, 0.3514637, 1.945047, 0, 0.9411765, 1, 1,
0.08873991, 1.326002, 0.6929134, 0, 0.9333333, 1, 1,
0.08917865, -0.9887003, 3.128324, 0, 0.9294118, 1, 1,
0.09119371, 0.7013596, -0.9075268, 0, 0.9215686, 1, 1,
0.0937364, -1.23093, 2.741302, 0, 0.9176471, 1, 1,
0.09395013, -1.201169, 4.05532, 0, 0.9098039, 1, 1,
0.09702709, -0.5267481, 4.400701, 0, 0.9058824, 1, 1,
0.0985682, 1.348945, 0.3255741, 0, 0.8980392, 1, 1,
0.09873816, -0.04155289, 2.164224, 0, 0.8901961, 1, 1,
0.104271, -0.6596003, 3.212745, 0, 0.8862745, 1, 1,
0.1050545, 0.6666072, 0.9872909, 0, 0.8784314, 1, 1,
0.1077003, 0.8935781, 0.1681366, 0, 0.8745098, 1, 1,
0.109086, -0.8934744, 3.398652, 0, 0.8666667, 1, 1,
0.1094895, -0.4589543, 3.007788, 0, 0.8627451, 1, 1,
0.1097067, 1.269672, -0.3294618, 0, 0.854902, 1, 1,
0.1108451, -0.9657016, 2.594999, 0, 0.8509804, 1, 1,
0.1120184, 1.821881, 0.7879317, 0, 0.8431373, 1, 1,
0.1135787, 0.7521341, 1.437133, 0, 0.8392157, 1, 1,
0.1135921, -0.6774806, 2.857437, 0, 0.8313726, 1, 1,
0.1151369, -0.70196, 2.896504, 0, 0.827451, 1, 1,
0.1159027, -0.9333135, 2.04214, 0, 0.8196079, 1, 1,
0.1175215, -0.5469359, 1.805145, 0, 0.8156863, 1, 1,
0.1232857, -1.693427, 3.777139, 0, 0.8078431, 1, 1,
0.1257847, 1.31656, -0.7127837, 0, 0.8039216, 1, 1,
0.1288965, 0.6917427, 0.5968988, 0, 0.7960784, 1, 1,
0.1332588, -0.5053186, 3.124342, 0, 0.7882353, 1, 1,
0.1345687, -0.02612534, 1.538754, 0, 0.7843137, 1, 1,
0.135092, -1.308049, 4.83715, 0, 0.7764706, 1, 1,
0.137622, 0.9366596, 0.6709731, 0, 0.772549, 1, 1,
0.137788, -0.2948636, 1.931051, 0, 0.7647059, 1, 1,
0.1378023, 0.0861036, 1.57495, 0, 0.7607843, 1, 1,
0.1381735, -1.942664, 3.404035, 0, 0.7529412, 1, 1,
0.1405136, 0.4210456, 1.286166, 0, 0.7490196, 1, 1,
0.1406845, -0.0252105, 1.266207, 0, 0.7411765, 1, 1,
0.1413216, -0.7891334, 1.735023, 0, 0.7372549, 1, 1,
0.1450314, -0.6207599, 3.333861, 0, 0.7294118, 1, 1,
0.146355, 0.06883087, 1.427621, 0, 0.7254902, 1, 1,
0.1471205, -0.6202169, 3.140947, 0, 0.7176471, 1, 1,
0.1503739, 0.904189, -0.5085244, 0, 0.7137255, 1, 1,
0.1504363, -0.441251, 2.715806, 0, 0.7058824, 1, 1,
0.1506442, -0.1513756, 1.728988, 0, 0.6980392, 1, 1,
0.1517643, -0.9769212, 3.776434, 0, 0.6941177, 1, 1,
0.151998, -1.396317, 0.8623863, 0, 0.6862745, 1, 1,
0.1548618, 0.9088264, 1.811783, 0, 0.682353, 1, 1,
0.1613272, 0.5142445, -0.1568101, 0, 0.6745098, 1, 1,
0.1631448, -0.3698159, 2.718491, 0, 0.6705883, 1, 1,
0.1649447, -0.3719676, 2.98713, 0, 0.6627451, 1, 1,
0.1683837, -2.118749, 4.393543, 0, 0.6588235, 1, 1,
0.173793, 2.026985, 1.634853, 0, 0.6509804, 1, 1,
0.17959, -0.2795387, 3.690045, 0, 0.6470588, 1, 1,
0.1803641, -0.01177458, 1.256348, 0, 0.6392157, 1, 1,
0.1821779, 0.2801317, 0.2114817, 0, 0.6352941, 1, 1,
0.1828104, -1.595309, 2.909006, 0, 0.627451, 1, 1,
0.1832514, -1.297913, 4.021633, 0, 0.6235294, 1, 1,
0.1839888, -1.066851, 2.134489, 0, 0.6156863, 1, 1,
0.1893507, 0.1502662, 1.388363, 0, 0.6117647, 1, 1,
0.19362, -1.536427, 2.509093, 0, 0.6039216, 1, 1,
0.1973584, -1.657805, 4.823088, 0, 0.5960785, 1, 1,
0.2009329, -1.188964, 4.545338, 0, 0.5921569, 1, 1,
0.2018996, 0.3826288, 0.6287516, 0, 0.5843138, 1, 1,
0.2068473, -0.118817, 2.554526, 0, 0.5803922, 1, 1,
0.2099589, 1.579064, 0.943955, 0, 0.572549, 1, 1,
0.2140042, 0.464696, 0.1885592, 0, 0.5686275, 1, 1,
0.2143251, 1.177032, 0.7482218, 0, 0.5607843, 1, 1,
0.2196533, 3.037883, -0.3869773, 0, 0.5568628, 1, 1,
0.2235843, -0.9047635, 3.610618, 0, 0.5490196, 1, 1,
0.2254291, -1.165678, 3.483783, 0, 0.5450981, 1, 1,
0.2284463, -0.4996822, 0.8948886, 0, 0.5372549, 1, 1,
0.2354463, -1.047724, 3.851162, 0, 0.5333334, 1, 1,
0.251909, 1.942906, -0.06003336, 0, 0.5254902, 1, 1,
0.2528382, 0.460652, 0.8322909, 0, 0.5215687, 1, 1,
0.2538478, 0.3134954, -0.4352183, 0, 0.5137255, 1, 1,
0.2542281, -1.459709, 3.592006, 0, 0.509804, 1, 1,
0.25825, -0.9332097, 2.552711, 0, 0.5019608, 1, 1,
0.2605229, 0.2429377, 1.299868, 0, 0.4941176, 1, 1,
0.2607632, 0.8782127, -0.6240376, 0, 0.4901961, 1, 1,
0.2608514, 0.31419, 0.1004547, 0, 0.4823529, 1, 1,
0.2610727, 1.097326, -1.192001, 0, 0.4784314, 1, 1,
0.2648582, -0.2724809, 3.299656, 0, 0.4705882, 1, 1,
0.2679273, 2.628665, -1.22538, 0, 0.4666667, 1, 1,
0.2718737, 0.1691632, 0.02796325, 0, 0.4588235, 1, 1,
0.2765201, 0.008299518, 1.045091, 0, 0.454902, 1, 1,
0.2788662, -0.4746164, 2.766808, 0, 0.4470588, 1, 1,
0.2806658, -1.051965, 4.242855, 0, 0.4431373, 1, 1,
0.2812755, -0.09616882, 2.253009, 0, 0.4352941, 1, 1,
0.282951, 0.5170318, -0.3074954, 0, 0.4313726, 1, 1,
0.2836225, 0.6915596, -0.7461146, 0, 0.4235294, 1, 1,
0.2854266, 1.715529, 1.186121, 0, 0.4196078, 1, 1,
0.2891099, -0.01996082, 0.7505915, 0, 0.4117647, 1, 1,
0.2908946, 0.1143215, 3.315568, 0, 0.4078431, 1, 1,
0.2916966, -0.2762267, 2.808902, 0, 0.4, 1, 1,
0.3012232, 0.2057943, 1.111636, 0, 0.3921569, 1, 1,
0.3059038, -2.739591, 4.51677, 0, 0.3882353, 1, 1,
0.3075408, -0.6513264, 3.377332, 0, 0.3803922, 1, 1,
0.3084782, 0.7303947, 0.1635278, 0, 0.3764706, 1, 1,
0.3158978, 0.4537703, 0.6936327, 0, 0.3686275, 1, 1,
0.3193976, 1.591544, -0.1766501, 0, 0.3647059, 1, 1,
0.3220738, -0.7492929, 0.7160168, 0, 0.3568628, 1, 1,
0.322831, -0.3294728, 4.232784, 0, 0.3529412, 1, 1,
0.3271949, -0.5682659, 2.554655, 0, 0.345098, 1, 1,
0.3272463, 0.8029196, 0.01436164, 0, 0.3411765, 1, 1,
0.3310337, 1.325667, -2.081571, 0, 0.3333333, 1, 1,
0.3324631, -0.2972665, 0.03357004, 0, 0.3294118, 1, 1,
0.334155, 0.2435265, 1.952968, 0, 0.3215686, 1, 1,
0.3343961, 0.4292355, -0.03177669, 0, 0.3176471, 1, 1,
0.3346838, -0.5295084, 4.29761, 0, 0.3098039, 1, 1,
0.3356043, 0.07276019, -0.5946166, 0, 0.3058824, 1, 1,
0.3399051, -0.5699482, 2.97768, 0, 0.2980392, 1, 1,
0.3421096, 0.3743543, 1.651356, 0, 0.2901961, 1, 1,
0.3443615, 1.090116, 1.460841, 0, 0.2862745, 1, 1,
0.3479626, -0.9695237, 2.569319, 0, 0.2784314, 1, 1,
0.3532349, -0.3295654, 3.332703, 0, 0.2745098, 1, 1,
0.3537027, 0.8084882, 1.881703, 0, 0.2666667, 1, 1,
0.3542089, -1.319199, 2.557954, 0, 0.2627451, 1, 1,
0.355855, 0.7226751, 0.3609312, 0, 0.254902, 1, 1,
0.3569573, -0.4325786, 2.255369, 0, 0.2509804, 1, 1,
0.3575715, -1.447991, 3.916873, 0, 0.2431373, 1, 1,
0.3607143, -0.2835849, 1.759156, 0, 0.2392157, 1, 1,
0.362884, -1.263514, 0.5352839, 0, 0.2313726, 1, 1,
0.3667692, -0.8978015, 2.937925, 0, 0.227451, 1, 1,
0.3668451, 0.3634496, 0.9407684, 0, 0.2196078, 1, 1,
0.3678988, -1.569072, 2.602107, 0, 0.2156863, 1, 1,
0.3697743, -0.3983988, 3.606457, 0, 0.2078431, 1, 1,
0.3703972, 0.4428807, 1.355444, 0, 0.2039216, 1, 1,
0.3717458, 0.6198239, -0.3715957, 0, 0.1960784, 1, 1,
0.3765229, 1.310192, 0.6164873, 0, 0.1882353, 1, 1,
0.3823541, -0.3563159, 3.448933, 0, 0.1843137, 1, 1,
0.3927946, 0.6449796, -0.2047475, 0, 0.1764706, 1, 1,
0.3949033, -0.1594672, 2.503502, 0, 0.172549, 1, 1,
0.3967522, 0.5653423, -0.1087688, 0, 0.1647059, 1, 1,
0.3975956, -0.8160589, 2.456381, 0, 0.1607843, 1, 1,
0.3978795, -0.4008226, 1.636362, 0, 0.1529412, 1, 1,
0.4063609, -2.068131, 3.602584, 0, 0.1490196, 1, 1,
0.4094711, 0.9189507, 0.777918, 0, 0.1411765, 1, 1,
0.4196693, -0.05599209, 0.7464586, 0, 0.1372549, 1, 1,
0.4235561, 0.6300154, 0.1599535, 0, 0.1294118, 1, 1,
0.4244657, -0.1764218, 3.232737, 0, 0.1254902, 1, 1,
0.4250067, 0.05177297, 1.61747, 0, 0.1176471, 1, 1,
0.4274143, -0.9870339, 1.122573, 0, 0.1137255, 1, 1,
0.4297542, 0.5468908, 2.389499, 0, 0.1058824, 1, 1,
0.4328724, -0.5618595, 0.8568444, 0, 0.09803922, 1, 1,
0.4347362, 0.665799, 1.54597, 0, 0.09411765, 1, 1,
0.4361702, 1.8423, 0.1826594, 0, 0.08627451, 1, 1,
0.4394104, 0.118043, 1.210268, 0, 0.08235294, 1, 1,
0.4399619, 0.4786668, 0.5722296, 0, 0.07450981, 1, 1,
0.4403338, -0.1892687, 0.4412546, 0, 0.07058824, 1, 1,
0.440571, -2.132148, 2.726516, 0, 0.0627451, 1, 1,
0.4414982, 0.2004868, 1.462182, 0, 0.05882353, 1, 1,
0.444851, -2.085252, 2.983, 0, 0.05098039, 1, 1,
0.4453484, 0.7861392, 0.2991312, 0, 0.04705882, 1, 1,
0.4474451, 0.9965836, -0.4545255, 0, 0.03921569, 1, 1,
0.4488295, -0.7842258, 3.859177, 0, 0.03529412, 1, 1,
0.4544992, -0.667534, 5.423099, 0, 0.02745098, 1, 1,
0.4556417, 0.4779838, 1.53944, 0, 0.02352941, 1, 1,
0.4574593, 0.2550648, 0.9789525, 0, 0.01568628, 1, 1,
0.457814, -0.8505964, 2.233096, 0, 0.01176471, 1, 1,
0.4604348, -0.9173953, 1.49957, 0, 0.003921569, 1, 1,
0.4636879, -0.3985653, 2.720381, 0.003921569, 0, 1, 1,
0.467531, -1.170861, 3.021519, 0.007843138, 0, 1, 1,
0.4707295, 1.108112, -0.331081, 0.01568628, 0, 1, 1,
0.471851, -0.1006439, 1.835686, 0.01960784, 0, 1, 1,
0.4725824, -0.05916415, 2.4175, 0.02745098, 0, 1, 1,
0.4791949, -1.169595, 2.591357, 0.03137255, 0, 1, 1,
0.4796032, -0.7174606, 3.073063, 0.03921569, 0, 1, 1,
0.4803477, 0.1305207, 0.5972559, 0.04313726, 0, 1, 1,
0.490061, 0.7611176, 1.574024, 0.05098039, 0, 1, 1,
0.4915661, 0.8377085, 1.652157, 0.05490196, 0, 1, 1,
0.4932528, -0.9641351, 3.347141, 0.0627451, 0, 1, 1,
0.4948732, 0.2831951, -0.03518365, 0.06666667, 0, 1, 1,
0.4998147, 1.155918, -0.1099532, 0.07450981, 0, 1, 1,
0.4998383, -0.2295864, 1.422554, 0.07843138, 0, 1, 1,
0.5065304, -2.163436, 5.863666, 0.08627451, 0, 1, 1,
0.5111875, -0.005840515, 0.9222738, 0.09019608, 0, 1, 1,
0.5163439, 1.379474, 1.04093, 0.09803922, 0, 1, 1,
0.5242452, -0.8788701, 3.096423, 0.1058824, 0, 1, 1,
0.5252603, 0.3384367, 0.3327935, 0.1098039, 0, 1, 1,
0.5365575, -1.314929, 3.610222, 0.1176471, 0, 1, 1,
0.5381128, 0.4001079, 0.8652596, 0.1215686, 0, 1, 1,
0.5386152, -0.1824722, 2.065925, 0.1294118, 0, 1, 1,
0.5386709, -0.1695005, 0.9088147, 0.1333333, 0, 1, 1,
0.5396866, -0.1400657, 1.592821, 0.1411765, 0, 1, 1,
0.5409126, 1.119526, 0.01766494, 0.145098, 0, 1, 1,
0.5411007, 1.513829, 0.7481924, 0.1529412, 0, 1, 1,
0.5415734, 1.161768, 0.9523165, 0.1568628, 0, 1, 1,
0.5423685, -0.2548847, 1.426148, 0.1647059, 0, 1, 1,
0.5432096, 0.6427188, 0.2755968, 0.1686275, 0, 1, 1,
0.5434018, 1.292931, 0.9642316, 0.1764706, 0, 1, 1,
0.5440206, -0.5057729, 1.737739, 0.1803922, 0, 1, 1,
0.5440901, 1.455103, 0.1270488, 0.1882353, 0, 1, 1,
0.5477554, -0.1381196, 0.6594968, 0.1921569, 0, 1, 1,
0.5481899, -0.5021651, 2.864965, 0.2, 0, 1, 1,
0.5501997, -0.452798, 2.972735, 0.2078431, 0, 1, 1,
0.5532896, -0.1413599, 2.077419, 0.2117647, 0, 1, 1,
0.5593538, 0.5554255, 2.219196, 0.2196078, 0, 1, 1,
0.5631192, -0.9001158, 3.407273, 0.2235294, 0, 1, 1,
0.5870903, -1.330027, 2.232412, 0.2313726, 0, 1, 1,
0.587537, 0.3042863, 0.7989079, 0.2352941, 0, 1, 1,
0.5887585, 0.1190102, 0.4630148, 0.2431373, 0, 1, 1,
0.5939414, -0.07756953, 2.120675, 0.2470588, 0, 1, 1,
0.5955582, -0.1072969, 1.218179, 0.254902, 0, 1, 1,
0.595638, 2.855229, 0.5437157, 0.2588235, 0, 1, 1,
0.5968446, -0.7908621, 1.942446, 0.2666667, 0, 1, 1,
0.6003023, 1.646379, 0.526876, 0.2705882, 0, 1, 1,
0.6009844, 0.1157762, 1.120235, 0.2784314, 0, 1, 1,
0.6036654, 0.894599, -2.035374, 0.282353, 0, 1, 1,
0.6103449, 1.255107, 1.023988, 0.2901961, 0, 1, 1,
0.6117113, 0.9708096, 0.5139596, 0.2941177, 0, 1, 1,
0.6131905, -1.676584, 2.197059, 0.3019608, 0, 1, 1,
0.6158893, -0.9002064, 1.15256, 0.3098039, 0, 1, 1,
0.616544, 1.411303, 0.04506982, 0.3137255, 0, 1, 1,
0.6178963, 1.119913, 2.379864, 0.3215686, 0, 1, 1,
0.6240296, 0.05073697, 2.147579, 0.3254902, 0, 1, 1,
0.6342916, 0.7889358, 1.221688, 0.3333333, 0, 1, 1,
0.6410277, -0.2257518, 1.861446, 0.3372549, 0, 1, 1,
0.6411879, 0.3147389, 2.514276, 0.345098, 0, 1, 1,
0.6452213, -0.4813298, 2.53272, 0.3490196, 0, 1, 1,
0.6480895, -0.4286258, 1.458714, 0.3568628, 0, 1, 1,
0.6539984, -0.4320758, 2.572016, 0.3607843, 0, 1, 1,
0.6540599, 0.735458, 1.868462, 0.3686275, 0, 1, 1,
0.656661, -0.09232792, 2.07355, 0.372549, 0, 1, 1,
0.6627964, 0.5151342, 1.014552, 0.3803922, 0, 1, 1,
0.6634992, -1.158617, 3.854363, 0.3843137, 0, 1, 1,
0.6635801, 0.06197809, 1.218751, 0.3921569, 0, 1, 1,
0.6650764, 0.7518166, -0.1624598, 0.3960784, 0, 1, 1,
0.6663606, 0.3953049, 2.901858, 0.4039216, 0, 1, 1,
0.6669422, -0.8402432, 2.871721, 0.4117647, 0, 1, 1,
0.6705211, 1.15688, 0.7550541, 0.4156863, 0, 1, 1,
0.6736813, -0.04685613, 2.104483, 0.4235294, 0, 1, 1,
0.6759431, -0.1930599, 1.883002, 0.427451, 0, 1, 1,
0.6774544, 1.185189, 0.6464185, 0.4352941, 0, 1, 1,
0.6810273, 0.6347821, 1.608478, 0.4392157, 0, 1, 1,
0.6815073, 1.040111, -1.39621, 0.4470588, 0, 1, 1,
0.6840585, -0.8872924, 1.40872, 0.4509804, 0, 1, 1,
0.685627, -0.5116708, 2.420773, 0.4588235, 0, 1, 1,
0.6887428, 0.6334228, 0.6123602, 0.4627451, 0, 1, 1,
0.6891157, 0.4297071, 2.069326, 0.4705882, 0, 1, 1,
0.6896675, 0.2305132, -0.06533618, 0.4745098, 0, 1, 1,
0.6936861, 0.7231339, 2.151005, 0.4823529, 0, 1, 1,
0.6936922, -1.566435, 2.136413, 0.4862745, 0, 1, 1,
0.6956969, -0.7299623, 2.693169, 0.4941176, 0, 1, 1,
0.6986377, 1.184853, 1.169864, 0.5019608, 0, 1, 1,
0.7136292, 1.054013, -0.7498935, 0.5058824, 0, 1, 1,
0.7154017, 0.9516382, 1.185946, 0.5137255, 0, 1, 1,
0.7156278, 1.904105, 1.527557, 0.5176471, 0, 1, 1,
0.724376, 0.02830039, 1.44687, 0.5254902, 0, 1, 1,
0.7247146, -2.432679, 3.134605, 0.5294118, 0, 1, 1,
0.7263596, -0.6339144, 1.491099, 0.5372549, 0, 1, 1,
0.7282449, 1.345051, 0.6620585, 0.5411765, 0, 1, 1,
0.7289786, 1.112258, 1.973623, 0.5490196, 0, 1, 1,
0.7331074, -0.5122274, 2.397891, 0.5529412, 0, 1, 1,
0.7344909, 0.07526897, 3.068089, 0.5607843, 0, 1, 1,
0.7374428, -0.6488254, 2.676764, 0.5647059, 0, 1, 1,
0.7377166, 1.191906, 1.381506, 0.572549, 0, 1, 1,
0.7399877, -1.353144, 1.640347, 0.5764706, 0, 1, 1,
0.7438875, -0.1924616, 2.166795, 0.5843138, 0, 1, 1,
0.752041, -0.4900117, 1.916789, 0.5882353, 0, 1, 1,
0.7538974, 1.948105, -0.6287849, 0.5960785, 0, 1, 1,
0.7550373, -2.12997, 2.33343, 0.6039216, 0, 1, 1,
0.760893, 1.509714, 0.608427, 0.6078432, 0, 1, 1,
0.769751, -0.06651462, 4.043937, 0.6156863, 0, 1, 1,
0.7740424, 1.705364, 2.201445, 0.6196079, 0, 1, 1,
0.7757331, 0.802193, -0.1470853, 0.627451, 0, 1, 1,
0.7760668, 1.306537, 1.420239, 0.6313726, 0, 1, 1,
0.781565, -0.4792168, 2.432867, 0.6392157, 0, 1, 1,
0.7816915, 0.3448848, 1.047632, 0.6431373, 0, 1, 1,
0.7820206, -0.003029204, 2.220985, 0.6509804, 0, 1, 1,
0.783007, 0.364211, -2.275823, 0.654902, 0, 1, 1,
0.784, 1.056453, 1.039906, 0.6627451, 0, 1, 1,
0.7874705, -0.1612639, 0.6667259, 0.6666667, 0, 1, 1,
0.7930382, -0.5899289, 3.473017, 0.6745098, 0, 1, 1,
0.7941645, 0.3770937, 2.294418, 0.6784314, 0, 1, 1,
0.796235, -0.7351474, 1.928925, 0.6862745, 0, 1, 1,
0.8022676, 1.046169, -0.4859397, 0.6901961, 0, 1, 1,
0.8096308, -0.6002643, 4.083292, 0.6980392, 0, 1, 1,
0.8115905, 1.654195, 1.327306, 0.7058824, 0, 1, 1,
0.8153268, 1.524239, 1.052097, 0.7098039, 0, 1, 1,
0.8171011, -0.05127327, 2.295897, 0.7176471, 0, 1, 1,
0.8289592, 0.4798753, 2.109663, 0.7215686, 0, 1, 1,
0.831221, 0.646575, -1.522883, 0.7294118, 0, 1, 1,
0.8317372, 0.5186653, 2.043715, 0.7333333, 0, 1, 1,
0.8340416, 1.247263, 0.3289273, 0.7411765, 0, 1, 1,
0.8372182, 0.1605543, 0.3630372, 0.7450981, 0, 1, 1,
0.8379556, 0.1329218, 0.2562932, 0.7529412, 0, 1, 1,
0.8418448, 1.858468, 2.004885, 0.7568628, 0, 1, 1,
0.8428937, 1.243725, 0.9870757, 0.7647059, 0, 1, 1,
0.8466694, 1.576405, 0.5656356, 0.7686275, 0, 1, 1,
0.851244, 0.7514384, 0.7086348, 0.7764706, 0, 1, 1,
0.8516677, 0.7400811, 1.804844, 0.7803922, 0, 1, 1,
0.8552382, -0.02882861, 0.7367257, 0.7882353, 0, 1, 1,
0.8573357, -1.176606, 0.9527758, 0.7921569, 0, 1, 1,
0.8590611, 0.4635438, 2.268126, 0.8, 0, 1, 1,
0.8604827, -1.190245, 2.189318, 0.8078431, 0, 1, 1,
0.8628175, -0.2187754, 1.273757, 0.8117647, 0, 1, 1,
0.8630041, 0.9008262, -0.9554772, 0.8196079, 0, 1, 1,
0.8634896, 0.1264918, 1.624096, 0.8235294, 0, 1, 1,
0.8644111, -0.5724518, 2.587714, 0.8313726, 0, 1, 1,
0.8753629, 0.2900673, 1.172092, 0.8352941, 0, 1, 1,
0.8755299, 0.1549904, 0.641673, 0.8431373, 0, 1, 1,
0.8758991, 1.912267, 1.601373, 0.8470588, 0, 1, 1,
0.8767019, -1.758694, 1.290015, 0.854902, 0, 1, 1,
0.8784235, 0.1872846, 2.22957, 0.8588235, 0, 1, 1,
0.8817407, -1.571497, 0.2101808, 0.8666667, 0, 1, 1,
0.8823637, 0.02919839, 1.54877, 0.8705882, 0, 1, 1,
0.8877413, 0.1246303, 0.4638093, 0.8784314, 0, 1, 1,
0.8879742, 1.164381, 0.2209025, 0.8823529, 0, 1, 1,
0.893463, 0.05276298, 2.793928, 0.8901961, 0, 1, 1,
0.9041262, -0.5247386, -0.01758432, 0.8941177, 0, 1, 1,
0.9069793, 0.3584123, 0.7108511, 0.9019608, 0, 1, 1,
0.913405, -0.1789799, 3.316042, 0.9098039, 0, 1, 1,
0.9204673, 0.1353731, 3.400192, 0.9137255, 0, 1, 1,
0.9241925, -0.1819402, 3.463858, 0.9215686, 0, 1, 1,
0.9313986, 1.257185, 0.9635841, 0.9254902, 0, 1, 1,
0.9342289, -1.417612, 3.00269, 0.9333333, 0, 1, 1,
0.9355977, 1.098068, -0.4274116, 0.9372549, 0, 1, 1,
0.9401453, 0.8423727, 0.4721344, 0.945098, 0, 1, 1,
0.9419245, 0.6926926, -0.1764679, 0.9490196, 0, 1, 1,
0.9451647, -1.386767, 2.696683, 0.9568627, 0, 1, 1,
0.9478207, -1.227696, 2.784463, 0.9607843, 0, 1, 1,
0.9721097, 0.2517552, 0.2304989, 0.9686275, 0, 1, 1,
0.9762762, -0.5639848, 2.630237, 0.972549, 0, 1, 1,
0.9795993, 0.6208894, 0.9289304, 0.9803922, 0, 1, 1,
0.9800538, 0.07492637, 2.491949, 0.9843137, 0, 1, 1,
0.9802663, 1.1521, -0.5824732, 0.9921569, 0, 1, 1,
0.9839967, -1.56309, 3.103866, 0.9960784, 0, 1, 1,
0.9847975, -1.435818, 3.022706, 1, 0, 0.9960784, 1,
0.987316, 0.2396591, 0.4726578, 1, 0, 0.9882353, 1,
0.9877186, -0.3391305, 1.540749, 1, 0, 0.9843137, 1,
0.989589, -0.560393, 2.175515, 1, 0, 0.9764706, 1,
1.00126, 1.282428, 2.251509, 1, 0, 0.972549, 1,
1.004892, -1.363986, 3.311966, 1, 0, 0.9647059, 1,
1.009749, 1.168048, 1.589753, 1, 0, 0.9607843, 1,
1.011747, 1.623979, 0.6584501, 1, 0, 0.9529412, 1,
1.019009, -0.741125, 1.708609, 1, 0, 0.9490196, 1,
1.023948, -0.3800485, 3.315875, 1, 0, 0.9411765, 1,
1.026761, 0.761129, 1.499161, 1, 0, 0.9372549, 1,
1.032958, -0.1918792, 0.9919477, 1, 0, 0.9294118, 1,
1.035024, 1.210823, -0.3382592, 1, 0, 0.9254902, 1,
1.039897, -0.06716751, 2.511277, 1, 0, 0.9176471, 1,
1.047966, 0.3737734, 1.910401, 1, 0, 0.9137255, 1,
1.050813, 0.6440811, 1.405499, 1, 0, 0.9058824, 1,
1.055235, -0.425384, 2.949826, 1, 0, 0.9019608, 1,
1.057289, 1.032282, 0.1560305, 1, 0, 0.8941177, 1,
1.057634, 0.0729121, 1.607359, 1, 0, 0.8862745, 1,
1.060237, 0.3565034, 0.2251637, 1, 0, 0.8823529, 1,
1.06606, -0.8029662, 1.986979, 1, 0, 0.8745098, 1,
1.067376, 1.03891, -0.03530306, 1, 0, 0.8705882, 1,
1.068976, 0.01195208, 2.838934, 1, 0, 0.8627451, 1,
1.070604, -1.457368, 2.675748, 1, 0, 0.8588235, 1,
1.070735, -0.4073606, 1.908678, 1, 0, 0.8509804, 1,
1.074127, -0.09023726, 1.886063, 1, 0, 0.8470588, 1,
1.083932, -0.08879744, 1.267108, 1, 0, 0.8392157, 1,
1.085898, 0.7182531, -0.669139, 1, 0, 0.8352941, 1,
1.089249, 0.2468598, 1.946406, 1, 0, 0.827451, 1,
1.093801, -0.04509281, 1.214707, 1, 0, 0.8235294, 1,
1.09527, 0.7395288, 2.585003, 1, 0, 0.8156863, 1,
1.099324, -1.084858, 3.551447, 1, 0, 0.8117647, 1,
1.099827, -0.8467017, 1.584958, 1, 0, 0.8039216, 1,
1.106241, 0.6253387, 2.547943, 1, 0, 0.7960784, 1,
1.106371, -2.626939, 3.691412, 1, 0, 0.7921569, 1,
1.107404, 0.5541705, 2.587987, 1, 0, 0.7843137, 1,
1.110789, -0.5453079, 1.071733, 1, 0, 0.7803922, 1,
1.117703, -1.180538, 2.858305, 1, 0, 0.772549, 1,
1.119097, -0.1505262, 1.198138, 1, 0, 0.7686275, 1,
1.120157, -0.1938795, 1.74006, 1, 0, 0.7607843, 1,
1.12505, -0.5002007, 2.566458, 1, 0, 0.7568628, 1,
1.12773, 0.2482811, 0.5766338, 1, 0, 0.7490196, 1,
1.132805, -0.7579774, 1.986108, 1, 0, 0.7450981, 1,
1.136718, -1.233594, 2.705682, 1, 0, 0.7372549, 1,
1.140506, 2.770859, -0.6316384, 1, 0, 0.7333333, 1,
1.142393, -0.8379229, 3.820968, 1, 0, 0.7254902, 1,
1.142843, 1.228239, -1.12247, 1, 0, 0.7215686, 1,
1.146901, 0.6863484, 0.6436223, 1, 0, 0.7137255, 1,
1.150536, 0.2303842, 0.4183602, 1, 0, 0.7098039, 1,
1.153069, -0.1596567, 1.864503, 1, 0, 0.7019608, 1,
1.159014, -0.5765259, 3.139261, 1, 0, 0.6941177, 1,
1.173951, -0.5057876, 2.04744, 1, 0, 0.6901961, 1,
1.173967, 0.02555548, 0.2370827, 1, 0, 0.682353, 1,
1.174917, 0.5484121, -1.302984, 1, 0, 0.6784314, 1,
1.177169, -1.649065, 3.645198, 1, 0, 0.6705883, 1,
1.203904, -1.198458, 3.292974, 1, 0, 0.6666667, 1,
1.205127, 1.587514, 0.6272526, 1, 0, 0.6588235, 1,
1.208029, 1.744615, 1.300053, 1, 0, 0.654902, 1,
1.231889, -0.1308007, 2.209596, 1, 0, 0.6470588, 1,
1.236349, 1.131215, -1.09748, 1, 0, 0.6431373, 1,
1.237741, 0.1738459, 0.9349083, 1, 0, 0.6352941, 1,
1.243226, 1.369499, 1.33122, 1, 0, 0.6313726, 1,
1.256896, 0.2164644, 2.014288, 1, 0, 0.6235294, 1,
1.265708, -0.1077208, 0.6027294, 1, 0, 0.6196079, 1,
1.281651, 1.620708, -0.1132067, 1, 0, 0.6117647, 1,
1.287057, -1.339925, 1.246081, 1, 0, 0.6078432, 1,
1.290305, -0.08863232, 0.913399, 1, 0, 0.6, 1,
1.290789, 0.1880987, 0.5107337, 1, 0, 0.5921569, 1,
1.294748, 1.13239, 2.360156, 1, 0, 0.5882353, 1,
1.299167, -0.0463396, 0.7708176, 1, 0, 0.5803922, 1,
1.299339, 0.5971244, 1.368681, 1, 0, 0.5764706, 1,
1.301469, 0.4426921, 0.6642847, 1, 0, 0.5686275, 1,
1.303109, -0.1264251, 2.064154, 1, 0, 0.5647059, 1,
1.307057, 2.488451, 1.399247, 1, 0, 0.5568628, 1,
1.315142, 0.3403257, 0.643609, 1, 0, 0.5529412, 1,
1.319528, -0.3260629, 1.23852, 1, 0, 0.5450981, 1,
1.340621, 0.2445097, 2.970806, 1, 0, 0.5411765, 1,
1.343264, 0.4205971, 1.464465, 1, 0, 0.5333334, 1,
1.346099, -0.3419285, 1.020548, 1, 0, 0.5294118, 1,
1.350697, 1.207409, 1.400779, 1, 0, 0.5215687, 1,
1.360629, -0.2480537, -0.376628, 1, 0, 0.5176471, 1,
1.363631, -0.7516211, 3.472196, 1, 0, 0.509804, 1,
1.390734, -1.726618, 2.827494, 1, 0, 0.5058824, 1,
1.394226, -0.5028263, 2.586329, 1, 0, 0.4980392, 1,
1.402632, -0.9645352, 1.302197, 1, 0, 0.4901961, 1,
1.410543, -1.565601, 3.479714, 1, 0, 0.4862745, 1,
1.413854, 0.5993095, 2.179247, 1, 0, 0.4784314, 1,
1.4224, 1.249814, 1.688233, 1, 0, 0.4745098, 1,
1.423638, 0.7742962, 0.2316756, 1, 0, 0.4666667, 1,
1.433353, 0.7384796, -0.6693842, 1, 0, 0.4627451, 1,
1.445229, -0.5737844, 0.8015592, 1, 0, 0.454902, 1,
1.4641, 0.1277453, 2.399066, 1, 0, 0.4509804, 1,
1.477019, -1.390965, 2.769084, 1, 0, 0.4431373, 1,
1.48522, -1.650397, -0.3646582, 1, 0, 0.4392157, 1,
1.486777, -0.3703275, 2.32411, 1, 0, 0.4313726, 1,
1.489504, 0.4887819, 1.971532, 1, 0, 0.427451, 1,
1.514999, 0.7856953, 0.985665, 1, 0, 0.4196078, 1,
1.523498, -0.7127918, -0.01558299, 1, 0, 0.4156863, 1,
1.525369, 0.9863727, 1.509443, 1, 0, 0.4078431, 1,
1.525419, -0.05792349, 1.552701, 1, 0, 0.4039216, 1,
1.536486, -0.02797456, 2.252998, 1, 0, 0.3960784, 1,
1.555302, -0.2193242, 0.8854685, 1, 0, 0.3882353, 1,
1.558655, -0.6737214, 0.7736984, 1, 0, 0.3843137, 1,
1.570584, 0.9010194, 1.847927, 1, 0, 0.3764706, 1,
1.579534, -0.5185276, 2.631983, 1, 0, 0.372549, 1,
1.581458, 1.183703, 0.4366297, 1, 0, 0.3647059, 1,
1.584028, -0.62312, 2.354446, 1, 0, 0.3607843, 1,
1.586684, -2.111183, 1.394646, 1, 0, 0.3529412, 1,
1.586965, 0.0545647, 1.70819, 1, 0, 0.3490196, 1,
1.59265, 0.7559534, 3.129726, 1, 0, 0.3411765, 1,
1.59282, -0.04858499, 0.206356, 1, 0, 0.3372549, 1,
1.593281, 2.291038, -0.2583099, 1, 0, 0.3294118, 1,
1.596978, 0.1930146, 0.1819629, 1, 0, 0.3254902, 1,
1.597994, 1.416311, 1.088645, 1, 0, 0.3176471, 1,
1.615861, -2.224361, 4.177295, 1, 0, 0.3137255, 1,
1.620238, -0.3343468, 3.77616, 1, 0, 0.3058824, 1,
1.626338, -1.227496, 1.119058, 1, 0, 0.2980392, 1,
1.630574, -0.3699051, -1.184904, 1, 0, 0.2941177, 1,
1.643907, 0.6650654, 1.715445, 1, 0, 0.2862745, 1,
1.64843, -0.1027497, -0.03323783, 1, 0, 0.282353, 1,
1.652356, 0.5497923, 1.124516, 1, 0, 0.2745098, 1,
1.670232, 1.520679, 2.524594, 1, 0, 0.2705882, 1,
1.688508, 0.5044752, 1.709457, 1, 0, 0.2627451, 1,
1.700216, -0.3530869, 1.720554, 1, 0, 0.2588235, 1,
1.716525, -0.9488351, 2.173417, 1, 0, 0.2509804, 1,
1.729369, 1.42391, -0.4982611, 1, 0, 0.2470588, 1,
1.73136, 0.51282, -0.771376, 1, 0, 0.2392157, 1,
1.736117, -0.1644342, 2.636639, 1, 0, 0.2352941, 1,
1.747021, 0.40751, -0.2632329, 1, 0, 0.227451, 1,
1.74922, 0.4617779, 0.5954239, 1, 0, 0.2235294, 1,
1.755039, 1.038243, 1.228729, 1, 0, 0.2156863, 1,
1.767844, -1.003949, 3.183368, 1, 0, 0.2117647, 1,
1.783245, 0.1628557, 1.348169, 1, 0, 0.2039216, 1,
1.804849, 0.2090448, 1.964527, 1, 0, 0.1960784, 1,
1.830868, -0.4737701, 2.555031, 1, 0, 0.1921569, 1,
1.842827, -0.6696069, 0.2886615, 1, 0, 0.1843137, 1,
1.843597, 0.06004059, -0.1132383, 1, 0, 0.1803922, 1,
1.849388, -1.904548, 2.053786, 1, 0, 0.172549, 1,
1.856865, 0.727035, 1.545736, 1, 0, 0.1686275, 1,
1.876301, 1.784415, 1.170481, 1, 0, 0.1607843, 1,
1.927032, -0.9989238, 0.9594635, 1, 0, 0.1568628, 1,
1.929071, 0.7715571, 0.01780319, 1, 0, 0.1490196, 1,
1.941725, -0.05586058, 2.589978, 1, 0, 0.145098, 1,
1.946809, 0.2108628, 2.071392, 1, 0, 0.1372549, 1,
1.981848, 0.2167056, 1.518235, 1, 0, 0.1333333, 1,
1.982718, 1.056657, 1.04792, 1, 0, 0.1254902, 1,
2.014049, 1.119965, -0.2182938, 1, 0, 0.1215686, 1,
2.01696, 0.5875538, 0.1058276, 1, 0, 0.1137255, 1,
2.018018, -0.3117001, 2.490055, 1, 0, 0.1098039, 1,
2.027174, 0.1749386, 2.160072, 1, 0, 0.1019608, 1,
2.055941, 0.2083518, 0.4253796, 1, 0, 0.09411765, 1,
2.068843, 0.3744068, 0.8814769, 1, 0, 0.09019608, 1,
2.084876, -1.3505, 2.055357, 1, 0, 0.08235294, 1,
2.101372, 0.9390357, 1.234832, 1, 0, 0.07843138, 1,
2.118242, 0.8425947, 1.384373, 1, 0, 0.07058824, 1,
2.157214, -0.7476111, 2.870014, 1, 0, 0.06666667, 1,
2.222372, 1.269884, 0.7868652, 1, 0, 0.05882353, 1,
2.245961, -0.09411612, 1.385285, 1, 0, 0.05490196, 1,
2.249375, -0.2018675, 0.593038, 1, 0, 0.04705882, 1,
2.264441, -0.9383163, 1.709946, 1, 0, 0.04313726, 1,
2.268346, -0.9757433, 2.428751, 1, 0, 0.03529412, 1,
2.546484, 0.4045736, 2.060637, 1, 0, 0.03137255, 1,
2.632744, 0.4327469, 1.382583, 1, 0, 0.02352941, 1,
2.636075, -0.09813695, 1.429907, 1, 0, 0.01960784, 1,
2.752764, -0.1011218, 2.165754, 1, 0, 0.01176471, 1,
2.830344, -1.501478, 3.49732, 1, 0, 0.007843138, 1
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
-0.3507134, -4.228669, -7.755512, 0, -0.5, 0.5, 0.5,
-0.3507134, -4.228669, -7.755512, 1, -0.5, 0.5, 0.5,
-0.3507134, -4.228669, -7.755512, 1, 1.5, 0.5, 0.5,
-0.3507134, -4.228669, -7.755512, 0, 1.5, 0.5, 0.5
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
-4.610149, -0.06880903, -7.755512, 0, -0.5, 0.5, 0.5,
-4.610149, -0.06880903, -7.755512, 1, -0.5, 0.5, 0.5,
-4.610149, -0.06880903, -7.755512, 1, 1.5, 0.5, 0.5,
-4.610149, -0.06880903, -7.755512, 0, 1.5, 0.5, 0.5
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
-4.610149, -4.228669, 0.0410161, 0, -0.5, 0.5, 0.5,
-4.610149, -4.228669, 0.0410161, 1, -0.5, 0.5, 0.5,
-4.610149, -4.228669, 0.0410161, 1, 1.5, 0.5, 0.5,
-4.610149, -4.228669, 0.0410161, 0, 1.5, 0.5, 0.5
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
-3, -3.268701, -5.956313,
2, -3.268701, -5.956313,
-3, -3.268701, -5.956313,
-3, -3.428696, -6.256179,
-2, -3.268701, -5.956313,
-2, -3.428696, -6.256179,
-1, -3.268701, -5.956313,
-1, -3.428696, -6.256179,
0, -3.268701, -5.956313,
0, -3.428696, -6.256179,
1, -3.268701, -5.956313,
1, -3.428696, -6.256179,
2, -3.268701, -5.956313,
2, -3.428696, -6.256179
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
-3, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
-3, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
-3, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
-3, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5,
-2, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
-2, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
-2, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
-2, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5,
-1, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
-1, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
-1, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
-1, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5,
0, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
0, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
0, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
0, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5,
1, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
1, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
1, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
1, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5,
2, -3.748685, -6.855912, 0, -0.5, 0.5, 0.5,
2, -3.748685, -6.855912, 1, -0.5, 0.5, 0.5,
2, -3.748685, -6.855912, 1, 1.5, 0.5, 0.5,
2, -3.748685, -6.855912, 0, 1.5, 0.5, 0.5
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
-3.627203, -3, -5.956313,
-3.627203, 3, -5.956313,
-3.627203, -3, -5.956313,
-3.791027, -3, -6.256179,
-3.627203, -2, -5.956313,
-3.791027, -2, -6.256179,
-3.627203, -1, -5.956313,
-3.791027, -1, -6.256179,
-3.627203, 0, -5.956313,
-3.791027, 0, -6.256179,
-3.627203, 1, -5.956313,
-3.791027, 1, -6.256179,
-3.627203, 2, -5.956313,
-3.791027, 2, -6.256179,
-3.627203, 3, -5.956313,
-3.791027, 3, -6.256179
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
-4.118676, -3, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, -3, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, -3, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, -3, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, -2, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, -2, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, -2, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, -2, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, -1, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, -1, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, -1, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, -1, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, 0, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, 0, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, 0, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, 0, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, 1, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, 1, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, 1, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, 1, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, 2, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, 2, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, 2, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, 2, -6.855912, 0, 1.5, 0.5, 0.5,
-4.118676, 3, -6.855912, 0, -0.5, 0.5, 0.5,
-4.118676, 3, -6.855912, 1, -0.5, 0.5, 0.5,
-4.118676, 3, -6.855912, 1, 1.5, 0.5, 0.5,
-4.118676, 3, -6.855912, 0, 1.5, 0.5, 0.5
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
-3.627203, -3.268701, -4,
-3.627203, -3.268701, 4,
-3.627203, -3.268701, -4,
-3.791027, -3.428696, -4,
-3.627203, -3.268701, -2,
-3.791027, -3.428696, -2,
-3.627203, -3.268701, 0,
-3.791027, -3.428696, 0,
-3.627203, -3.268701, 2,
-3.791027, -3.428696, 2,
-3.627203, -3.268701, 4,
-3.791027, -3.428696, 4
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
-4.118676, -3.748685, -4, 0, -0.5, 0.5, 0.5,
-4.118676, -3.748685, -4, 1, -0.5, 0.5, 0.5,
-4.118676, -3.748685, -4, 1, 1.5, 0.5, 0.5,
-4.118676, -3.748685, -4, 0, 1.5, 0.5, 0.5,
-4.118676, -3.748685, -2, 0, -0.5, 0.5, 0.5,
-4.118676, -3.748685, -2, 1, -0.5, 0.5, 0.5,
-4.118676, -3.748685, -2, 1, 1.5, 0.5, 0.5,
-4.118676, -3.748685, -2, 0, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 0, 0, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 0, 1, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 0, 1, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 0, 0, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 2, 0, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 2, 1, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 2, 1, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 2, 0, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 4, 0, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 4, 1, -0.5, 0.5, 0.5,
-4.118676, -3.748685, 4, 1, 1.5, 0.5, 0.5,
-4.118676, -3.748685, 4, 0, 1.5, 0.5, 0.5
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
-3.627203, -3.268701, -5.956313,
-3.627203, 3.131083, -5.956313,
-3.627203, -3.268701, 6.038345,
-3.627203, 3.131083, 6.038345,
-3.627203, -3.268701, -5.956313,
-3.627203, -3.268701, 6.038345,
-3.627203, 3.131083, -5.956313,
-3.627203, 3.131083, 6.038345,
-3.627203, -3.268701, -5.956313,
2.925776, -3.268701, -5.956313,
-3.627203, -3.268701, 6.038345,
2.925776, -3.268701, 6.038345,
-3.627203, 3.131083, -5.956313,
2.925776, 3.131083, -5.956313,
-3.627203, 3.131083, 6.038345,
2.925776, 3.131083, 6.038345,
2.925776, -3.268701, -5.956313,
2.925776, 3.131083, -5.956313,
2.925776, -3.268701, 6.038345,
2.925776, 3.131083, 6.038345,
2.925776, -3.268701, -5.956313,
2.925776, -3.268701, 6.038345,
2.925776, 3.131083, -5.956313,
2.925776, 3.131083, 6.038345
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
var radius = 8.058872;
var distance = 35.85484;
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
mvMatrix.translate( 0.3507134, 0.06880903, -0.0410161 );
mvMatrix.scale( 1.329687, 1.361516, 0.726441 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85484);
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


