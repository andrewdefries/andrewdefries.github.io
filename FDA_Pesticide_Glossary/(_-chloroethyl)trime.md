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
-3.26312, 0.9613631, -1.189682, 1, 0, 0, 1,
-2.786843, -0.2422201, -1.795418, 1, 0.007843138, 0, 1,
-2.653374, -0.4522561, -1.432896, 1, 0.01176471, 0, 1,
-2.601273, -0.09603122, -1.471946, 1, 0.01960784, 0, 1,
-2.555685, -0.765938, -2.406418, 1, 0.02352941, 0, 1,
-2.426979, -0.3408395, -0.487646, 1, 0.03137255, 0, 1,
-2.397486, -1.052106, -2.254086, 1, 0.03529412, 0, 1,
-2.389949, 0.6910147, -1.413507, 1, 0.04313726, 0, 1,
-2.379664, -0.1836269, -1.058915, 1, 0.04705882, 0, 1,
-2.355299, -1.494139, -1.325775, 1, 0.05490196, 0, 1,
-2.344723, -1.283734, -1.004767, 1, 0.05882353, 0, 1,
-2.324937, 2.08909, -0.5393433, 1, 0.06666667, 0, 1,
-2.318755, 0.4641642, -1.59227, 1, 0.07058824, 0, 1,
-2.290375, -0.5447935, -0.6377163, 1, 0.07843138, 0, 1,
-2.274391, 1.15236, -1.855726, 1, 0.08235294, 0, 1,
-2.228092, -0.9104927, -1.265125, 1, 0.09019608, 0, 1,
-2.205609, 0.7953983, -2.431558, 1, 0.09411765, 0, 1,
-2.152497, 1.921701, 0.6146247, 1, 0.1019608, 0, 1,
-2.140726, -1.234786, -1.9596, 1, 0.1098039, 0, 1,
-2.116122, -0.6444913, -1.393226, 1, 0.1137255, 0, 1,
-2.080883, -1.145415, -1.094236, 1, 0.1215686, 0, 1,
-2.069152, 0.7933022, -0.7478231, 1, 0.1254902, 0, 1,
-2.063759, -0.3440769, -2.955636, 1, 0.1333333, 0, 1,
-2.061435, -1.216737, -3.075575, 1, 0.1372549, 0, 1,
-2.055566, -0.636133, -0.6575631, 1, 0.145098, 0, 1,
-2.042362, -0.3567983, -1.966914, 1, 0.1490196, 0, 1,
-2.034895, -0.2369741, -1.418015, 1, 0.1568628, 0, 1,
-2.027259, -0.1335505, -1.565439, 1, 0.1607843, 0, 1,
-2.021096, 1.40911, -2.033767, 1, 0.1686275, 0, 1,
-2.0135, 0.3855257, -1.327959, 1, 0.172549, 0, 1,
-2.0105, -0.3475607, -1.220434, 1, 0.1803922, 0, 1,
-1.986693, 1.245296, -0.4604603, 1, 0.1843137, 0, 1,
-1.977088, -0.1132674, -2.098477, 1, 0.1921569, 0, 1,
-1.952959, 1.525297, 0.6516645, 1, 0.1960784, 0, 1,
-1.918949, -1.436806, -3.476678, 1, 0.2039216, 0, 1,
-1.912488, -0.8173906, -1.533667, 1, 0.2117647, 0, 1,
-1.890869, 0.3271548, -0.9625386, 1, 0.2156863, 0, 1,
-1.876923, -0.05158371, -2.794628, 1, 0.2235294, 0, 1,
-1.869184, 1.620151, -0.5714648, 1, 0.227451, 0, 1,
-1.862058, -0.2214238, -1.914526, 1, 0.2352941, 0, 1,
-1.850775, 0.4102598, -1.044164, 1, 0.2392157, 0, 1,
-1.847489, 1.357628, -0.7771258, 1, 0.2470588, 0, 1,
-1.813349, -0.6432051, -1.947688, 1, 0.2509804, 0, 1,
-1.790146, 0.5182161, -1.396895, 1, 0.2588235, 0, 1,
-1.787011, -0.745714, -0.4529756, 1, 0.2627451, 0, 1,
-1.785625, -0.4885432, -2.415874, 1, 0.2705882, 0, 1,
-1.774529, 1.17628, -1.998864, 1, 0.2745098, 0, 1,
-1.719236, -0.3601505, -1.833419, 1, 0.282353, 0, 1,
-1.70824, 0.1469834, -2.674369, 1, 0.2862745, 0, 1,
-1.702133, 0.2158097, -1.421915, 1, 0.2941177, 0, 1,
-1.693803, -0.598851, -3.539217, 1, 0.3019608, 0, 1,
-1.69065, 0.3737179, -0.9811183, 1, 0.3058824, 0, 1,
-1.687317, -0.8549342, -1.539589, 1, 0.3137255, 0, 1,
-1.678975, -0.9460911, -2.568214, 1, 0.3176471, 0, 1,
-1.675804, 0.6880205, -0.3767313, 1, 0.3254902, 0, 1,
-1.670631, 0.2232141, -0.907904, 1, 0.3294118, 0, 1,
-1.669209, -0.1787556, -2.236082, 1, 0.3372549, 0, 1,
-1.66757, 2.096093, -1.281584, 1, 0.3411765, 0, 1,
-1.642756, 1.066002, -2.026905, 1, 0.3490196, 0, 1,
-1.621833, 0.7458259, -0.9588045, 1, 0.3529412, 0, 1,
-1.620403, 0.1989184, -1.687303, 1, 0.3607843, 0, 1,
-1.602322, 1.921093, 0.3895888, 1, 0.3647059, 0, 1,
-1.577818, -1.084605, -1.780422, 1, 0.372549, 0, 1,
-1.567958, 0.1050461, -2.315942, 1, 0.3764706, 0, 1,
-1.551215, -0.2044264, -2.84232, 1, 0.3843137, 0, 1,
-1.550722, -1.475752, -3.06959, 1, 0.3882353, 0, 1,
-1.536091, -0.6876768, -0.5996062, 1, 0.3960784, 0, 1,
-1.535436, 0.3277898, -0.4756965, 1, 0.4039216, 0, 1,
-1.529583, -1.229268, -1.973507, 1, 0.4078431, 0, 1,
-1.522869, -0.6052728, -1.48814, 1, 0.4156863, 0, 1,
-1.504522, 0.6592086, -2.409077, 1, 0.4196078, 0, 1,
-1.500154, 1.400773, -0.6322585, 1, 0.427451, 0, 1,
-1.494776, 0.4313872, -1.604792, 1, 0.4313726, 0, 1,
-1.480676, -0.6897905, -2.95948, 1, 0.4392157, 0, 1,
-1.479382, -1.598243, -2.54498, 1, 0.4431373, 0, 1,
-1.479186, 1.313811, -2.179484, 1, 0.4509804, 0, 1,
-1.477401, -0.8681214, -1.670051, 1, 0.454902, 0, 1,
-1.474163, -0.1155656, -1.887732, 1, 0.4627451, 0, 1,
-1.471412, -1.434459, -1.578278, 1, 0.4666667, 0, 1,
-1.457958, -0.2927805, -0.9185038, 1, 0.4745098, 0, 1,
-1.454697, 0.6145514, 0.01101433, 1, 0.4784314, 0, 1,
-1.444415, 0.9853135, -0.5207112, 1, 0.4862745, 0, 1,
-1.437031, -0.2503977, -0.3608654, 1, 0.4901961, 0, 1,
-1.432059, -0.3615753, -2.177555, 1, 0.4980392, 0, 1,
-1.42393, 0.01414861, -0.06672309, 1, 0.5058824, 0, 1,
-1.418938, 1.419858, -0.1301263, 1, 0.509804, 0, 1,
-1.413653, -1.604872, -2.463551, 1, 0.5176471, 0, 1,
-1.413209, -0.3188706, -2.577058, 1, 0.5215687, 0, 1,
-1.403473, 0.382835, -2.739399, 1, 0.5294118, 0, 1,
-1.402991, 0.234194, -2.405753, 1, 0.5333334, 0, 1,
-1.392937, 0.205532, -0.3144243, 1, 0.5411765, 0, 1,
-1.381686, 0.1888932, 0.3230211, 1, 0.5450981, 0, 1,
-1.378943, -1.765527, -2.556484, 1, 0.5529412, 0, 1,
-1.356585, 1.64829, -1.037386, 1, 0.5568628, 0, 1,
-1.349473, -1.113223, -2.13415, 1, 0.5647059, 0, 1,
-1.349261, -1.681905, -1.845365, 1, 0.5686275, 0, 1,
-1.343969, -0.1697108, -0.8028689, 1, 0.5764706, 0, 1,
-1.34353, 0.4158595, -0.1213976, 1, 0.5803922, 0, 1,
-1.333836, -0.7607592, -0.8957326, 1, 0.5882353, 0, 1,
-1.325891, 1.503607, -1.011878, 1, 0.5921569, 0, 1,
-1.320441, -0.682699, -3.89317, 1, 0.6, 0, 1,
-1.316458, -1.135229, -2.537336, 1, 0.6078432, 0, 1,
-1.308072, -1.501101, -4.279811, 1, 0.6117647, 0, 1,
-1.306046, 0.2434655, -1.776828, 1, 0.6196079, 0, 1,
-1.294716, -1.647473, -1.302557, 1, 0.6235294, 0, 1,
-1.290766, 0.7686511, -3.616952, 1, 0.6313726, 0, 1,
-1.279622, 0.2332074, 1.441876, 1, 0.6352941, 0, 1,
-1.257097, -1.213118, -1.683891, 1, 0.6431373, 0, 1,
-1.25415, 0.5725003, -1.781318, 1, 0.6470588, 0, 1,
-1.252925, 0.522181, -1.424886, 1, 0.654902, 0, 1,
-1.249178, 0.01787308, -2.382265, 1, 0.6588235, 0, 1,
-1.248777, 0.9551088, 0.02671709, 1, 0.6666667, 0, 1,
-1.243818, -0.2207198, -2.259744, 1, 0.6705883, 0, 1,
-1.236351, 0.1092153, -1.988465, 1, 0.6784314, 0, 1,
-1.233688, 0.8545973, -1.313021, 1, 0.682353, 0, 1,
-1.229664, 0.01176896, -2.035185, 1, 0.6901961, 0, 1,
-1.221735, -0.4629309, -0.4256352, 1, 0.6941177, 0, 1,
-1.220574, 1.186755, -1.175553, 1, 0.7019608, 0, 1,
-1.21694, 1.410726, 0.5640512, 1, 0.7098039, 0, 1,
-1.210021, 1.96577, 0.3371186, 1, 0.7137255, 0, 1,
-1.204545, 0.3480508, -2.326272, 1, 0.7215686, 0, 1,
-1.204236, -1.062033, -0.3743902, 1, 0.7254902, 0, 1,
-1.198227, 1.058459, 1.411756, 1, 0.7333333, 0, 1,
-1.193588, 0.6191738, 0.6947876, 1, 0.7372549, 0, 1,
-1.191518, -0.3375274, -1.782673, 1, 0.7450981, 0, 1,
-1.189026, -0.2479534, -1.206246, 1, 0.7490196, 0, 1,
-1.184973, -0.5469242, -0.5128217, 1, 0.7568628, 0, 1,
-1.181208, 1.03872, -0.3089113, 1, 0.7607843, 0, 1,
-1.179832, -0.2332824, -2.02197, 1, 0.7686275, 0, 1,
-1.168984, -1.58058, -3.175881, 1, 0.772549, 0, 1,
-1.167364, 0.7370979, -1.055753, 1, 0.7803922, 0, 1,
-1.158068, -0.0166038, -1.564575, 1, 0.7843137, 0, 1,
-1.156547, 0.2142756, -2.167945, 1, 0.7921569, 0, 1,
-1.15126, -1.829283, -2.765396, 1, 0.7960784, 0, 1,
-1.150569, -1.072376, -0.9297478, 1, 0.8039216, 0, 1,
-1.147854, 1.427968, -0.862707, 1, 0.8117647, 0, 1,
-1.146938, -0.411783, -2.29405, 1, 0.8156863, 0, 1,
-1.141076, -0.154501, -2.119279, 1, 0.8235294, 0, 1,
-1.130466, 0.5887111, -0.2500885, 1, 0.827451, 0, 1,
-1.12976, 2.266186, -1.296386, 1, 0.8352941, 0, 1,
-1.123752, -0.05199087, -0.9943045, 1, 0.8392157, 0, 1,
-1.115891, 1.961502, -2.486435, 1, 0.8470588, 0, 1,
-1.106467, 0.1316829, -1.262475, 1, 0.8509804, 0, 1,
-1.1024, 1.316107, -0.6401312, 1, 0.8588235, 0, 1,
-1.097515, -0.8265014, -2.741196, 1, 0.8627451, 0, 1,
-1.09471, -0.5116144, -3.459022, 1, 0.8705882, 0, 1,
-1.084502, -1.333082, -2.48573, 1, 0.8745098, 0, 1,
-1.077013, -0.6809312, -0.6598442, 1, 0.8823529, 0, 1,
-1.074552, -1.438292, -1.20098, 1, 0.8862745, 0, 1,
-1.069082, 0.8388829, -0.7096351, 1, 0.8941177, 0, 1,
-1.068455, 0.7957287, -2.708862, 1, 0.8980392, 0, 1,
-1.059177, 0.8214191, -2.474369, 1, 0.9058824, 0, 1,
-1.057782, -1.737624, -1.517159, 1, 0.9137255, 0, 1,
-1.053239, -1.352896, -2.10649, 1, 0.9176471, 0, 1,
-1.041208, -0.5317403, -1.893738, 1, 0.9254902, 0, 1,
-1.040194, -0.1049361, -1.640874, 1, 0.9294118, 0, 1,
-1.038651, -0.05786956, -0.09289266, 1, 0.9372549, 0, 1,
-1.037333, 0.215056, -2.871944, 1, 0.9411765, 0, 1,
-1.027039, -1.206428, -0.3417982, 1, 0.9490196, 0, 1,
-1.021434, -1.269034, -4.346423, 1, 0.9529412, 0, 1,
-1.01842, 0.4342725, -1.765968, 1, 0.9607843, 0, 1,
-1.015767, 0.4928488, 0.1459829, 1, 0.9647059, 0, 1,
-1.01, 0.08352681, -1.05242, 1, 0.972549, 0, 1,
-0.9897014, -0.1023882, -1.19707, 1, 0.9764706, 0, 1,
-0.9894154, -0.7312757, -2.761044, 1, 0.9843137, 0, 1,
-0.9889932, 0.5898328, -0.9454295, 1, 0.9882353, 0, 1,
-0.9889733, -1.634328, -2.243859, 1, 0.9960784, 0, 1,
-0.9873856, 1.091676, 0.8083459, 0.9960784, 1, 0, 1,
-0.9866161, -1.093568, -2.812022, 0.9921569, 1, 0, 1,
-0.9786178, 1.34514, -0.311909, 0.9843137, 1, 0, 1,
-0.9739699, -0.6524637, -1.699588, 0.9803922, 1, 0, 1,
-0.9700111, 1.627587, 0.8475834, 0.972549, 1, 0, 1,
-0.9696036, -1.301597, -3.236402, 0.9686275, 1, 0, 1,
-0.9645581, -0.6690966, -1.474843, 0.9607843, 1, 0, 1,
-0.9591601, -0.3398088, -2.604245, 0.9568627, 1, 0, 1,
-0.9563342, -0.6221131, -0.802501, 0.9490196, 1, 0, 1,
-0.9435635, 0.8439348, 1.011075, 0.945098, 1, 0, 1,
-0.9421513, -0.9902521, -1.998242, 0.9372549, 1, 0, 1,
-0.9402841, -0.2717361, -1.403154, 0.9333333, 1, 0, 1,
-0.9237471, -1.090197, -1.683462, 0.9254902, 1, 0, 1,
-0.9100628, 0.02341273, -0.152098, 0.9215686, 1, 0, 1,
-0.9049348, 2.034922, 0.812793, 0.9137255, 1, 0, 1,
-0.902283, 0.2389318, -1.389976, 0.9098039, 1, 0, 1,
-0.8975706, 0.1823933, -1.32709, 0.9019608, 1, 0, 1,
-0.8934335, 0.02388398, -2.654886, 0.8941177, 1, 0, 1,
-0.8925723, -1.06869, -3.03504, 0.8901961, 1, 0, 1,
-0.8925146, 0.1158443, -2.809165, 0.8823529, 1, 0, 1,
-0.8865426, 0.9795597, -0.8730627, 0.8784314, 1, 0, 1,
-0.8843323, 0.3780562, 0.3532015, 0.8705882, 1, 0, 1,
-0.8821625, -0.001767303, -0.8637367, 0.8666667, 1, 0, 1,
-0.8809343, -0.1971127, -3.066937, 0.8588235, 1, 0, 1,
-0.8775826, -0.1984569, -1.187548, 0.854902, 1, 0, 1,
-0.876526, 0.8620036, -1.272718, 0.8470588, 1, 0, 1,
-0.8690504, 0.2927689, -1.053915, 0.8431373, 1, 0, 1,
-0.8641077, 1.262749, -1.031955, 0.8352941, 1, 0, 1,
-0.8635445, -0.7698467, -4.609042, 0.8313726, 1, 0, 1,
-0.85721, 0.3008439, -0.02278794, 0.8235294, 1, 0, 1,
-0.8533476, 0.2903224, -1.220092, 0.8196079, 1, 0, 1,
-0.8479074, 1.496486, -0.1639905, 0.8117647, 1, 0, 1,
-0.8410617, 1.500675, -0.4996312, 0.8078431, 1, 0, 1,
-0.8410199, -0.1953106, -0.8045345, 0.8, 1, 0, 1,
-0.8370754, -0.4632054, -0.5965866, 0.7921569, 1, 0, 1,
-0.8238158, 0.9853172, -2.175691, 0.7882353, 1, 0, 1,
-0.8140921, -0.9932228, -2.19359, 0.7803922, 1, 0, 1,
-0.8140582, 1.295559, -1.061138, 0.7764706, 1, 0, 1,
-0.803326, -0.9104335, 0.2778153, 0.7686275, 1, 0, 1,
-0.8014726, -1.104985, -4.296385, 0.7647059, 1, 0, 1,
-0.7933736, -0.5989335, -1.739479, 0.7568628, 1, 0, 1,
-0.7870144, 1.074507, -2.161342, 0.7529412, 1, 0, 1,
-0.7800726, 0.295907, -0.4343784, 0.7450981, 1, 0, 1,
-0.7797588, -0.8826604, -2.920956, 0.7411765, 1, 0, 1,
-0.7797313, -0.09570133, -2.645933, 0.7333333, 1, 0, 1,
-0.7759086, 0.2087291, -1.87057, 0.7294118, 1, 0, 1,
-0.7754394, 1.327204, -0.9039958, 0.7215686, 1, 0, 1,
-0.7706574, 0.8617294, -1.613622, 0.7176471, 1, 0, 1,
-0.7630215, 0.1948373, -2.791778, 0.7098039, 1, 0, 1,
-0.7623877, 1.284472, -1.72877, 0.7058824, 1, 0, 1,
-0.7615387, 0.4365532, -2.807284, 0.6980392, 1, 0, 1,
-0.7539117, 0.2380102, 0.1201603, 0.6901961, 1, 0, 1,
-0.7529858, -0.4279379, -1.371305, 0.6862745, 1, 0, 1,
-0.7515104, 1.391007, -1.718215, 0.6784314, 1, 0, 1,
-0.7503115, -0.2076463, -1.692665, 0.6745098, 1, 0, 1,
-0.7472208, -0.3391769, -0.6075003, 0.6666667, 1, 0, 1,
-0.7463402, -0.7495232, -3.140597, 0.6627451, 1, 0, 1,
-0.7436324, -1.282439, -3.575876, 0.654902, 1, 0, 1,
-0.7432894, -0.5981562, -3.517348, 0.6509804, 1, 0, 1,
-0.7417774, -2.273657, -2.026148, 0.6431373, 1, 0, 1,
-0.7369781, -0.1784596, -2.312487, 0.6392157, 1, 0, 1,
-0.7340551, 0.7154752, -1.532785, 0.6313726, 1, 0, 1,
-0.7283737, -1.096255, -2.573346, 0.627451, 1, 0, 1,
-0.7262012, -0.02065233, -2.880292, 0.6196079, 1, 0, 1,
-0.7231494, 0.130085, 0.02124857, 0.6156863, 1, 0, 1,
-0.7226424, 0.01464228, -0.5369343, 0.6078432, 1, 0, 1,
-0.7156821, 1.572469, -1.258682, 0.6039216, 1, 0, 1,
-0.7094755, 1.737833, -1.420191, 0.5960785, 1, 0, 1,
-0.7025747, 1.440461, 0.6285582, 0.5882353, 1, 0, 1,
-0.7025202, 0.7234997, -0.1109565, 0.5843138, 1, 0, 1,
-0.6983668, 1.766474, -0.1159925, 0.5764706, 1, 0, 1,
-0.6957839, 2.600139, -0.2043346, 0.572549, 1, 0, 1,
-0.6951655, 0.8331655, -1.114311, 0.5647059, 1, 0, 1,
-0.6925111, -0.7431431, -3.360467, 0.5607843, 1, 0, 1,
-0.6912014, 1.141126, -1.248519, 0.5529412, 1, 0, 1,
-0.6815888, -0.5131744, -1.137905, 0.5490196, 1, 0, 1,
-0.6757626, 1.063821, -0.69991, 0.5411765, 1, 0, 1,
-0.6740631, -0.8789377, -3.181069, 0.5372549, 1, 0, 1,
-0.6733907, 1.543885, 0.6252373, 0.5294118, 1, 0, 1,
-0.6732504, 0.09268697, -0.2074237, 0.5254902, 1, 0, 1,
-0.6713203, 1.100861, -0.9787388, 0.5176471, 1, 0, 1,
-0.6653327, 0.4328513, -1.392088, 0.5137255, 1, 0, 1,
-0.6652963, -0.01704853, -0.850644, 0.5058824, 1, 0, 1,
-0.6640357, 0.4435969, -0.6770168, 0.5019608, 1, 0, 1,
-0.6588852, -0.9707857, -1.435989, 0.4941176, 1, 0, 1,
-0.6551938, -1.600487, -1.490556, 0.4862745, 1, 0, 1,
-0.6490696, -1.383737, -4.802575, 0.4823529, 1, 0, 1,
-0.6465185, -0.804461, -3.867724, 0.4745098, 1, 0, 1,
-0.6432685, 0.9186252, 2.208082, 0.4705882, 1, 0, 1,
-0.6371256, -0.933173, -3.374331, 0.4627451, 1, 0, 1,
-0.6332867, 0.7705858, -0.9300941, 0.4588235, 1, 0, 1,
-0.6332098, -0.09205159, -2.528204, 0.4509804, 1, 0, 1,
-0.6331451, -0.3674081, -1.585038, 0.4470588, 1, 0, 1,
-0.6309991, 0.7147811, 0.6348801, 0.4392157, 1, 0, 1,
-0.628904, -1.212076, -3.523797, 0.4352941, 1, 0, 1,
-0.6281981, -1.644972, -2.572498, 0.427451, 1, 0, 1,
-0.6278162, 1.336073, -2.067336, 0.4235294, 1, 0, 1,
-0.6268523, 0.7858117, -1.233847, 0.4156863, 1, 0, 1,
-0.6243066, -0.6145311, -1.560211, 0.4117647, 1, 0, 1,
-0.6172604, -0.04697482, -1.277296, 0.4039216, 1, 0, 1,
-0.6149066, 1.054948, 0.7491792, 0.3960784, 1, 0, 1,
-0.6066455, 0.3928176, -1.636973, 0.3921569, 1, 0, 1,
-0.6063847, 1.178424, 0.6104475, 0.3843137, 1, 0, 1,
-0.6040078, -0.4213374, -3.87733, 0.3803922, 1, 0, 1,
-0.6004584, -0.2080831, -0.3644884, 0.372549, 1, 0, 1,
-0.5901695, 1.844456, -1.111375, 0.3686275, 1, 0, 1,
-0.5890806, 1.42097, -1.006269, 0.3607843, 1, 0, 1,
-0.5870335, -1.140137, -2.578476, 0.3568628, 1, 0, 1,
-0.5863446, 1.260512, -1.575448, 0.3490196, 1, 0, 1,
-0.583887, 0.7059407, -2.44364, 0.345098, 1, 0, 1,
-0.5828303, 0.8477637, -1.646335, 0.3372549, 1, 0, 1,
-0.5781415, 0.1796819, -0.1170986, 0.3333333, 1, 0, 1,
-0.5750039, -0.4503973, -2.603236, 0.3254902, 1, 0, 1,
-0.5749406, 0.3033664, -2.382457, 0.3215686, 1, 0, 1,
-0.5705794, 0.5450323, 0.05538394, 0.3137255, 1, 0, 1,
-0.5700079, 0.1984286, -0.9365358, 0.3098039, 1, 0, 1,
-0.5695542, 0.2769776, -1.185066, 0.3019608, 1, 0, 1,
-0.565581, 0.7573137, -1.431753, 0.2941177, 1, 0, 1,
-0.5636938, -0.2688985, -0.7985004, 0.2901961, 1, 0, 1,
-0.5629389, -1.580008, -4.420914, 0.282353, 1, 0, 1,
-0.5613973, 1.069274, -0.4928301, 0.2784314, 1, 0, 1,
-0.5582822, -0.3132713, -1.17384, 0.2705882, 1, 0, 1,
-0.5554731, -0.6011627, -2.693875, 0.2666667, 1, 0, 1,
-0.5549721, -1.237525, -1.738398, 0.2588235, 1, 0, 1,
-0.5544707, 0.02680705, -0.6567152, 0.254902, 1, 0, 1,
-0.5544483, 1.035459, -1.741261, 0.2470588, 1, 0, 1,
-0.5521469, -0.9359659, -2.598214, 0.2431373, 1, 0, 1,
-0.5513147, 1.281834, 0.9067583, 0.2352941, 1, 0, 1,
-0.5500618, 0.774669, -1.275715, 0.2313726, 1, 0, 1,
-0.5499514, -0.1585766, -3.082722, 0.2235294, 1, 0, 1,
-0.545822, 0.8845851, -1.703507, 0.2196078, 1, 0, 1,
-0.5453789, -0.9264625, -1.593925, 0.2117647, 1, 0, 1,
-0.5449069, 1.391192, -1.297138, 0.2078431, 1, 0, 1,
-0.5437419, -0.813521, -3.00224, 0.2, 1, 0, 1,
-0.5419332, 0.26361, -0.8837011, 0.1921569, 1, 0, 1,
-0.5379134, -1.753594, -3.737226, 0.1882353, 1, 0, 1,
-0.5349519, 1.058324, -1.627191, 0.1803922, 1, 0, 1,
-0.5348855, -0.290266, -1.432605, 0.1764706, 1, 0, 1,
-0.5340009, -1.486162, -1.142301, 0.1686275, 1, 0, 1,
-0.5326456, 0.129935, -1.81881, 0.1647059, 1, 0, 1,
-0.5279252, 0.8593027, -2.370917, 0.1568628, 1, 0, 1,
-0.5276284, -1.836187, -4.500289, 0.1529412, 1, 0, 1,
-0.5274816, 0.6088835, -0.1118608, 0.145098, 1, 0, 1,
-0.5269154, 0.4624753, 0.520879, 0.1411765, 1, 0, 1,
-0.5262631, -0.8271496, -1.971546, 0.1333333, 1, 0, 1,
-0.5233608, 0.9713476, -0.7801278, 0.1294118, 1, 0, 1,
-0.5181298, 0.1501228, -0.72848, 0.1215686, 1, 0, 1,
-0.514446, -1.407204, -4.455099, 0.1176471, 1, 0, 1,
-0.5106829, -0.3405141, -3.118641, 0.1098039, 1, 0, 1,
-0.5077197, 1.013558, -2.565144, 0.1058824, 1, 0, 1,
-0.5046613, 0.9929619, -1.604803, 0.09803922, 1, 0, 1,
-0.4956181, -0.3046322, -2.787127, 0.09019608, 1, 0, 1,
-0.4864118, -0.03520235, -0.297872, 0.08627451, 1, 0, 1,
-0.4855804, -0.1766168, -0.5242181, 0.07843138, 1, 0, 1,
-0.4838937, 1.26375, -0.04530803, 0.07450981, 1, 0, 1,
-0.4801497, -0.6409373, -3.218348, 0.06666667, 1, 0, 1,
-0.479678, 0.1399489, -1.822136, 0.0627451, 1, 0, 1,
-0.4792977, 1.088363, -0.5962181, 0.05490196, 1, 0, 1,
-0.4786601, 0.6793664, -1.764688, 0.05098039, 1, 0, 1,
-0.4741017, -1.336427, -1.818631, 0.04313726, 1, 0, 1,
-0.4709155, 0.0777436, -0.4783861, 0.03921569, 1, 0, 1,
-0.4698935, -2.78277, -2.670117, 0.03137255, 1, 0, 1,
-0.4603906, -1.480802, -2.545537, 0.02745098, 1, 0, 1,
-0.4482725, -0.5302652, -1.683051, 0.01960784, 1, 0, 1,
-0.446321, 1.501586, -0.1721012, 0.01568628, 1, 0, 1,
-0.4391446, 0.04277706, -1.191977, 0.007843138, 1, 0, 1,
-0.4381406, 0.2774611, -1.286284, 0.003921569, 1, 0, 1,
-0.4375623, -1.331818, -3.262741, 0, 1, 0.003921569, 1,
-0.4360299, -0.9247407, -3.869771, 0, 1, 0.01176471, 1,
-0.4357556, 0.8989384, 0.2408719, 0, 1, 0.01568628, 1,
-0.4320783, 0.8882075, 0.294032, 0, 1, 0.02352941, 1,
-0.4312908, -0.2954467, -4.263679, 0, 1, 0.02745098, 1,
-0.4298484, 0.2183011, -0.05314014, 0, 1, 0.03529412, 1,
-0.4282688, 0.5571612, -1.494787, 0, 1, 0.03921569, 1,
-0.4271655, 0.650714, -0.3601141, 0, 1, 0.04705882, 1,
-0.4203684, 0.08375613, -1.298687, 0, 1, 0.05098039, 1,
-0.4193375, -0.9878624, -3.131999, 0, 1, 0.05882353, 1,
-0.4117617, 0.8957111, 1.131072, 0, 1, 0.0627451, 1,
-0.4117591, 0.5470235, 0.3834075, 0, 1, 0.07058824, 1,
-0.4107729, -0.8044042, -2.321432, 0, 1, 0.07450981, 1,
-0.409677, -1.203606, -1.985985, 0, 1, 0.08235294, 1,
-0.3888878, 0.05439745, -1.055037, 0, 1, 0.08627451, 1,
-0.3868898, -0.095901, -2.141008, 0, 1, 0.09411765, 1,
-0.3864041, -0.2022993, -1.669495, 0, 1, 0.1019608, 1,
-0.3847929, -1.223886, -3.002774, 0, 1, 0.1058824, 1,
-0.3837895, 0.1593177, -1.744226, 0, 1, 0.1137255, 1,
-0.3822007, 1.001449, -1.923325, 0, 1, 0.1176471, 1,
-0.3756444, 1.488251, 1.322407, 0, 1, 0.1254902, 1,
-0.3713902, 0.1139465, 0.6290074, 0, 1, 0.1294118, 1,
-0.3697776, -1.069355, -2.775968, 0, 1, 0.1372549, 1,
-0.3695438, -0.009854971, -0.3748147, 0, 1, 0.1411765, 1,
-0.3694119, -0.1245983, -1.801306, 0, 1, 0.1490196, 1,
-0.3687373, 0.6813311, -0.9713858, 0, 1, 0.1529412, 1,
-0.3641506, 1.067547, -1.68433, 0, 1, 0.1607843, 1,
-0.3611665, 1.385293, -1.613814, 0, 1, 0.1647059, 1,
-0.3604479, -0.06123951, -2.004262, 0, 1, 0.172549, 1,
-0.3585646, 0.9595923, 0.005681922, 0, 1, 0.1764706, 1,
-0.3569566, -0.9703391, -1.877203, 0, 1, 0.1843137, 1,
-0.3569427, 0.7797461, -0.832104, 0, 1, 0.1882353, 1,
-0.3505461, 0.1409972, -2.727453, 0, 1, 0.1960784, 1,
-0.3480526, 0.2990719, -0.3488518, 0, 1, 0.2039216, 1,
-0.3479807, 0.3171529, -2.637404, 0, 1, 0.2078431, 1,
-0.3432575, -0.815598, -3.196416, 0, 1, 0.2156863, 1,
-0.338725, -0.4826724, -3.344253, 0, 1, 0.2196078, 1,
-0.3384905, 0.2222626, -1.366018, 0, 1, 0.227451, 1,
-0.3369583, -1.10226, -1.926502, 0, 1, 0.2313726, 1,
-0.3345695, 1.682568, 0.5296721, 0, 1, 0.2392157, 1,
-0.3318979, 0.8727067, -0.2323248, 0, 1, 0.2431373, 1,
-0.3318573, 1.109917, 0.9727664, 0, 1, 0.2509804, 1,
-0.3254142, -1.076672, -4.667034, 0, 1, 0.254902, 1,
-0.3251098, -0.1087236, -1.631395, 0, 1, 0.2627451, 1,
-0.3197087, 0.4072987, -1.761793, 0, 1, 0.2666667, 1,
-0.3195264, 1.126787, -0.8486041, 0, 1, 0.2745098, 1,
-0.319434, -0.7690098, -1.625604, 0, 1, 0.2784314, 1,
-0.3152213, -1.565732, -2.044749, 0, 1, 0.2862745, 1,
-0.308399, 1.189011, -0.6913642, 0, 1, 0.2901961, 1,
-0.3075809, 0.4189268, -0.1199038, 0, 1, 0.2980392, 1,
-0.3060874, -2.620064, -1.328962, 0, 1, 0.3058824, 1,
-0.3041647, -0.1491367, -2.865221, 0, 1, 0.3098039, 1,
-0.303098, -0.4193713, -2.720827, 0, 1, 0.3176471, 1,
-0.2998059, -1.849677, -1.412137, 0, 1, 0.3215686, 1,
-0.2972954, 1.508177, 0.5469922, 0, 1, 0.3294118, 1,
-0.2955349, 0.5894585, -1.093897, 0, 1, 0.3333333, 1,
-0.2904776, 0.4948463, 1.424869, 0, 1, 0.3411765, 1,
-0.2898046, 3.046971, -1.579463, 0, 1, 0.345098, 1,
-0.2870557, -0.1472218, -2.112747, 0, 1, 0.3529412, 1,
-0.2802985, -0.1553867, -2.566583, 0, 1, 0.3568628, 1,
-0.2787444, 0.6396898, 1.336889, 0, 1, 0.3647059, 1,
-0.2746575, 1.577385, 0.00859593, 0, 1, 0.3686275, 1,
-0.2744931, -1.791158, -2.11619, 0, 1, 0.3764706, 1,
-0.2742647, 0.390327, -1.322171, 0, 1, 0.3803922, 1,
-0.2715322, 0.1509624, 0.8685755, 0, 1, 0.3882353, 1,
-0.2665838, 0.2114624, -0.9756216, 0, 1, 0.3921569, 1,
-0.2663641, -0.6817656, -2.238651, 0, 1, 0.4, 1,
-0.2550067, 1.009047, -0.2566139, 0, 1, 0.4078431, 1,
-0.2526656, 0.6100202, -0.5890584, 0, 1, 0.4117647, 1,
-0.2504204, 0.6488304, -0.02095456, 0, 1, 0.4196078, 1,
-0.2476831, -1.176373, -1.039697, 0, 1, 0.4235294, 1,
-0.2424249, -0.123199, -2.205312, 0, 1, 0.4313726, 1,
-0.2422265, 0.3537321, -0.6381267, 0, 1, 0.4352941, 1,
-0.2371932, -1.614173, -2.795608, 0, 1, 0.4431373, 1,
-0.2219061, 0.5843032, 1.16343, 0, 1, 0.4470588, 1,
-0.2158152, 1.055253, -0.3270795, 0, 1, 0.454902, 1,
-0.2150633, 0.6958262, 1.422171, 0, 1, 0.4588235, 1,
-0.2147247, 0.9585652, -0.7375154, 0, 1, 0.4666667, 1,
-0.2094512, -0.9821532, -3.658574, 0, 1, 0.4705882, 1,
-0.2074824, -0.5766976, -1.654841, 0, 1, 0.4784314, 1,
-0.2044559, 0.9319521, -1.134375, 0, 1, 0.4823529, 1,
-0.2037885, 0.06289867, -2.45166, 0, 1, 0.4901961, 1,
-0.2034249, -1.764082, -3.664567, 0, 1, 0.4941176, 1,
-0.2027297, -0.5543759, -3.062388, 0, 1, 0.5019608, 1,
-0.2003827, 2.138436, 0.89145, 0, 1, 0.509804, 1,
-0.1996219, 0.05144257, -1.857053, 0, 1, 0.5137255, 1,
-0.1991046, 0.3965397, 0.265247, 0, 1, 0.5215687, 1,
-0.1991008, 0.8571869, 0.6748517, 0, 1, 0.5254902, 1,
-0.1983174, -0.992391, -3.189375, 0, 1, 0.5333334, 1,
-0.1950387, -1.299558, -3.268839, 0, 1, 0.5372549, 1,
-0.1940976, 2.267433, -0.07831245, 0, 1, 0.5450981, 1,
-0.1933756, 1.700114, 0.7047071, 0, 1, 0.5490196, 1,
-0.1931037, 0.8500154, -0.4552871, 0, 1, 0.5568628, 1,
-0.1930835, 1.064701, -1.11823, 0, 1, 0.5607843, 1,
-0.1890954, 0.4755797, 0.5602475, 0, 1, 0.5686275, 1,
-0.1882018, 0.1123573, 0.03190611, 0, 1, 0.572549, 1,
-0.1869689, 0.500198, 0.02061466, 0, 1, 0.5803922, 1,
-0.1837839, -0.8651639, -0.8012294, 0, 1, 0.5843138, 1,
-0.1811949, -0.9458748, -4.892638, 0, 1, 0.5921569, 1,
-0.1775243, -0.7307107, -3.540946, 0, 1, 0.5960785, 1,
-0.1765814, -0.3906441, -0.7130752, 0, 1, 0.6039216, 1,
-0.1764789, -0.4623841, -1.885966, 0, 1, 0.6117647, 1,
-0.1760217, 0.6540322, 0.1133645, 0, 1, 0.6156863, 1,
-0.1746964, -0.26043, -2.649708, 0, 1, 0.6235294, 1,
-0.1653807, 0.4773176, 0.6741526, 0, 1, 0.627451, 1,
-0.1630611, 1.134458, -0.09383028, 0, 1, 0.6352941, 1,
-0.1625596, 0.4658801, -0.5011339, 0, 1, 0.6392157, 1,
-0.160672, -1.771331, -0.6944508, 0, 1, 0.6470588, 1,
-0.1605464, 0.2559921, -0.3767563, 0, 1, 0.6509804, 1,
-0.1597332, 0.1865117, -0.6659513, 0, 1, 0.6588235, 1,
-0.1597182, 0.3205352, 0.1472333, 0, 1, 0.6627451, 1,
-0.1529903, 1.912046, 0.1628527, 0, 1, 0.6705883, 1,
-0.1462349, 0.008518621, -1.58839, 0, 1, 0.6745098, 1,
-0.1447366, 0.2500365, 0.5339094, 0, 1, 0.682353, 1,
-0.1443913, 0.8269047, -0.8734321, 0, 1, 0.6862745, 1,
-0.1441041, 0.06405561, -1.064993, 0, 1, 0.6941177, 1,
-0.1404093, 0.8119311, -1.144953, 0, 1, 0.7019608, 1,
-0.1404069, 1.004972, 0.305234, 0, 1, 0.7058824, 1,
-0.1394874, 0.3321083, -0.09585758, 0, 1, 0.7137255, 1,
-0.1389634, 1.422018, -1.178922, 0, 1, 0.7176471, 1,
-0.1381559, 0.406849, 0.04738731, 0, 1, 0.7254902, 1,
-0.1371028, -1.195601, -2.936006, 0, 1, 0.7294118, 1,
-0.1359376, -1.259742, -4.499499, 0, 1, 0.7372549, 1,
-0.135232, -0.4186463, -1.69918, 0, 1, 0.7411765, 1,
-0.1346303, 0.1383325, 0.4522862, 0, 1, 0.7490196, 1,
-0.1309959, 0.7981976, 0.6200387, 0, 1, 0.7529412, 1,
-0.1287609, 0.6315331, 0.9150693, 0, 1, 0.7607843, 1,
-0.1249961, -2.18626, -4.554151, 0, 1, 0.7647059, 1,
-0.1223311, -1.723672, -3.303716, 0, 1, 0.772549, 1,
-0.1154375, -0.1303817, -2.325042, 0, 1, 0.7764706, 1,
-0.1151575, 1.307607, 0.8333042, 0, 1, 0.7843137, 1,
-0.1147275, -1.939532, -1.857911, 0, 1, 0.7882353, 1,
-0.1145753, -1.03409, -3.462154, 0, 1, 0.7960784, 1,
-0.1116921, 0.393427, 0.2787852, 0, 1, 0.8039216, 1,
-0.1081012, -1.187454, -1.991289, 0, 1, 0.8078431, 1,
-0.1076232, 0.2430109, -0.8476407, 0, 1, 0.8156863, 1,
-0.107282, 1.096696, 1.203133, 0, 1, 0.8196079, 1,
-0.09514965, 2.350695, -0.7101321, 0, 1, 0.827451, 1,
-0.09474458, 1.362902, 1.014439, 0, 1, 0.8313726, 1,
-0.08901516, -1.059733, -2.883511, 0, 1, 0.8392157, 1,
-0.08391625, -0.02567118, -2.230454, 0, 1, 0.8431373, 1,
-0.07819906, 1.421124, -1.647831, 0, 1, 0.8509804, 1,
-0.07605292, 0.6799492, 0.788488, 0, 1, 0.854902, 1,
-0.07546636, -0.2575193, -2.852069, 0, 1, 0.8627451, 1,
-0.06914608, -0.7137915, -3.619332, 0, 1, 0.8666667, 1,
-0.06290684, 0.9862446, -1.605107, 0, 1, 0.8745098, 1,
-0.06266245, -0.5635809, -3.255795, 0, 1, 0.8784314, 1,
-0.06070825, -0.8574932, -0.6631125, 0, 1, 0.8862745, 1,
-0.05572807, -0.6608791, -3.452269, 0, 1, 0.8901961, 1,
-0.0519419, 0.7469175, -0.2007887, 0, 1, 0.8980392, 1,
-0.05051931, 0.5968494, 0.4706903, 0, 1, 0.9058824, 1,
-0.04998857, 0.2488004, 0.1506177, 0, 1, 0.9098039, 1,
-0.04629754, -0.1173568, -4.638739, 0, 1, 0.9176471, 1,
-0.0458777, -0.3187789, -3.436937, 0, 1, 0.9215686, 1,
-0.04517313, -0.01981113, 0.1008443, 0, 1, 0.9294118, 1,
-0.03600914, 0.8262287, 0.967437, 0, 1, 0.9333333, 1,
-0.03201683, -1.135666, -2.644051, 0, 1, 0.9411765, 1,
-0.02851767, 0.3898477, 1.324845, 0, 1, 0.945098, 1,
-0.0247417, -1.192101, -3.072736, 0, 1, 0.9529412, 1,
-0.02160294, -0.06231889, -4.034133, 0, 1, 0.9568627, 1,
-0.01965176, -0.9153084, -3.513057, 0, 1, 0.9647059, 1,
-0.01804727, 1.309843, 0.4409137, 0, 1, 0.9686275, 1,
-0.01777943, 0.05003452, -1.788358, 0, 1, 0.9764706, 1,
-0.01708809, 1.062153, -0.2378808, 0, 1, 0.9803922, 1,
-0.01309025, -0.2046291, -3.377581, 0, 1, 0.9882353, 1,
-0.008893179, -1.177953, -2.593253, 0, 1, 0.9921569, 1,
-0.008433311, 1.010319, -0.5359288, 0, 1, 1, 1,
-0.007858471, -1.870848, -2.203815, 0, 0.9921569, 1, 1,
-0.006949724, 0.8022034, 0.0687922, 0, 0.9882353, 1, 1,
-0.004070404, -0.566441, -1.504446, 0, 0.9803922, 1, 1,
-0.001596625, -0.7223353, -4.721005, 0, 0.9764706, 1, 1,
0.001817317, 1.083462, 1.820039, 0, 0.9686275, 1, 1,
0.002792786, -0.9540946, 2.328923, 0, 0.9647059, 1, 1,
0.007134642, 1.715319, -0.7353199, 0, 0.9568627, 1, 1,
0.01375137, 0.5976072, -1.345922, 0, 0.9529412, 1, 1,
0.01512076, -0.5076057, 4.469266, 0, 0.945098, 1, 1,
0.01982407, -1.446363, 2.396832, 0, 0.9411765, 1, 1,
0.02155565, -0.5330561, 3.054, 0, 0.9333333, 1, 1,
0.02883207, -0.7770616, 3.847785, 0, 0.9294118, 1, 1,
0.03812288, 0.57539, -0.6885222, 0, 0.9215686, 1, 1,
0.03909182, 0.7871767, -0.7490983, 0, 0.9176471, 1, 1,
0.04100321, 1.661054, -1.630271, 0, 0.9098039, 1, 1,
0.04251337, 0.4056396, -0.5918912, 0, 0.9058824, 1, 1,
0.04802704, 0.539493, -1.167502, 0, 0.8980392, 1, 1,
0.0482402, -0.9653575, 3.787825, 0, 0.8901961, 1, 1,
0.05030341, 0.01122418, 2.28817, 0, 0.8862745, 1, 1,
0.05735971, -0.6814879, 2.608775, 0, 0.8784314, 1, 1,
0.05915467, -0.5568487, 4.465492, 0, 0.8745098, 1, 1,
0.06015305, 0.1892242, 0.1724741, 0, 0.8666667, 1, 1,
0.06172514, -1.821756, 2.302358, 0, 0.8627451, 1, 1,
0.06605285, 1.130483, -0.1930345, 0, 0.854902, 1, 1,
0.0662012, 0.01282505, 2.893676, 0, 0.8509804, 1, 1,
0.06656391, 0.4059574, 0.1990201, 0, 0.8431373, 1, 1,
0.08036208, -0.9470783, 3.074211, 0, 0.8392157, 1, 1,
0.08632919, -0.4173565, 3.521349, 0, 0.8313726, 1, 1,
0.09295214, -1.380209, 3.541261, 0, 0.827451, 1, 1,
0.09390289, 1.50122, -0.7192708, 0, 0.8196079, 1, 1,
0.09593315, 1.642205, 1.143132, 0, 0.8156863, 1, 1,
0.09610675, 0.1626069, -1.581542, 0, 0.8078431, 1, 1,
0.09685422, -0.7425336, 2.111492, 0, 0.8039216, 1, 1,
0.09919684, -0.477221, 1.691405, 0, 0.7960784, 1, 1,
0.1004762, -0.9715495, 2.807808, 0, 0.7882353, 1, 1,
0.100987, 0.8518084, -0.6669895, 0, 0.7843137, 1, 1,
0.1187421, 0.8229881, 1.288326, 0, 0.7764706, 1, 1,
0.118887, -0.1614487, 1.631625, 0, 0.772549, 1, 1,
0.1204119, -0.7459409, 2.512539, 0, 0.7647059, 1, 1,
0.1272231, 0.6752573, -1.238414, 0, 0.7607843, 1, 1,
0.1281839, -0.9566613, 3.237101, 0, 0.7529412, 1, 1,
0.1289905, 1.452533, -0.9321741, 0, 0.7490196, 1, 1,
0.1343352, 0.9096542, 0.6885281, 0, 0.7411765, 1, 1,
0.1374267, 0.07438853, 1.369583, 0, 0.7372549, 1, 1,
0.1386547, 1.289079, 1.03052, 0, 0.7294118, 1, 1,
0.138705, -1.066032, 4.570285, 0, 0.7254902, 1, 1,
0.1388255, 1.747079, -1.111177, 0, 0.7176471, 1, 1,
0.1417471, 0.7378054, -1.219918, 0, 0.7137255, 1, 1,
0.1437274, -1.86229, 1.262459, 0, 0.7058824, 1, 1,
0.1446633, -0.8658511, 1.826094, 0, 0.6980392, 1, 1,
0.1499213, 0.6678898, 1.038796, 0, 0.6941177, 1, 1,
0.1561099, -0.5947117, 1.861194, 0, 0.6862745, 1, 1,
0.1572611, 0.4534482, 1.346624, 0, 0.682353, 1, 1,
0.1610009, 0.1129871, 1.054624, 0, 0.6745098, 1, 1,
0.1632164, -0.3034322, 2.298895, 0, 0.6705883, 1, 1,
0.1646699, -0.6288991, 2.254684, 0, 0.6627451, 1, 1,
0.1652841, -0.04722085, 1.74712, 0, 0.6588235, 1, 1,
0.166117, -1.015358, 2.347991, 0, 0.6509804, 1, 1,
0.1667594, -1.234488, 2.482037, 0, 0.6470588, 1, 1,
0.1704981, 0.4789102, -0.2094387, 0, 0.6392157, 1, 1,
0.1722073, 0.1460039, 1.695732, 0, 0.6352941, 1, 1,
0.173277, 1.266712, -1.121468, 0, 0.627451, 1, 1,
0.1750356, -1.571507, 2.304193, 0, 0.6235294, 1, 1,
0.1756401, -0.7676495, 2.952506, 0, 0.6156863, 1, 1,
0.178214, 1.699094, 1.138379, 0, 0.6117647, 1, 1,
0.1824869, 1.769822, -0.3461093, 0, 0.6039216, 1, 1,
0.1827271, -1.258956, 3.453084, 0, 0.5960785, 1, 1,
0.1900603, 0.6630824, 0.3424088, 0, 0.5921569, 1, 1,
0.191454, 0.5339957, -0.713352, 0, 0.5843138, 1, 1,
0.1944828, 1.401921, 1.298987, 0, 0.5803922, 1, 1,
0.1951615, 0.3002256, 1.598279, 0, 0.572549, 1, 1,
0.2024305, -0.2155877, 3.271307, 0, 0.5686275, 1, 1,
0.2025347, 1.274666, 1.651602, 0, 0.5607843, 1, 1,
0.2036427, -1.226399, 4.093971, 0, 0.5568628, 1, 1,
0.2049039, -0.1121223, 2.445145, 0, 0.5490196, 1, 1,
0.2076884, -1.736444, 4.591411, 0, 0.5450981, 1, 1,
0.2084471, -0.4393794, 4.685913, 0, 0.5372549, 1, 1,
0.2086874, -0.6885316, 3.214787, 0, 0.5333334, 1, 1,
0.2128635, -2.8592, 3.49073, 0, 0.5254902, 1, 1,
0.2149042, 0.08385552, 0.9064177, 0, 0.5215687, 1, 1,
0.2158522, 0.0551798, -0.09961458, 0, 0.5137255, 1, 1,
0.2179564, 0.6347255, 0.7989515, 0, 0.509804, 1, 1,
0.2195538, 0.7286999, -0.1267062, 0, 0.5019608, 1, 1,
0.2196667, -0.3956212, 2.046362, 0, 0.4941176, 1, 1,
0.2307979, 0.862972, 1.327748, 0, 0.4901961, 1, 1,
0.2313403, 1.341272, 1.515274, 0, 0.4823529, 1, 1,
0.2361448, -1.142849, 3.593651, 0, 0.4784314, 1, 1,
0.2402033, -0.6679559, 1.11253, 0, 0.4705882, 1, 1,
0.2440644, -1.428472, 2.83847, 0, 0.4666667, 1, 1,
0.2476352, -1.134842, 4.26168, 0, 0.4588235, 1, 1,
0.248697, 1.747135, 0.1484344, 0, 0.454902, 1, 1,
0.2499433, -1.182137, 2.944776, 0, 0.4470588, 1, 1,
0.2523694, -0.04566427, 0.5039549, 0, 0.4431373, 1, 1,
0.25592, 1.103361, -0.3496427, 0, 0.4352941, 1, 1,
0.2561871, 0.2661767, 1.701835, 0, 0.4313726, 1, 1,
0.2567483, 0.185588, 0.8710582, 0, 0.4235294, 1, 1,
0.2569447, -0.2778714, 0.9217302, 0, 0.4196078, 1, 1,
0.2593755, -0.1275044, 2.124686, 0, 0.4117647, 1, 1,
0.2615526, -0.5553978, 2.183773, 0, 0.4078431, 1, 1,
0.263823, -0.4404149, 2.871121, 0, 0.4, 1, 1,
0.2685356, -1.759809, 1.73111, 0, 0.3921569, 1, 1,
0.2777826, 1.102885, -1.278884, 0, 0.3882353, 1, 1,
0.2844463, 2.78633, -0.8413406, 0, 0.3803922, 1, 1,
0.2846216, 0.5506406, -0.7003936, 0, 0.3764706, 1, 1,
0.2846505, -0.7209302, 1.483914, 0, 0.3686275, 1, 1,
0.2885179, -1.034801, 4.011223, 0, 0.3647059, 1, 1,
0.2888175, -0.6208331, 1.922639, 0, 0.3568628, 1, 1,
0.2907797, -0.08733784, 0.2599183, 0, 0.3529412, 1, 1,
0.2913754, -0.3625957, 3.433771, 0, 0.345098, 1, 1,
0.2924334, -1.461573, 4.482881, 0, 0.3411765, 1, 1,
0.2939399, -0.08105038, 1.330313, 0, 0.3333333, 1, 1,
0.2961432, -0.8969468, 3.020922, 0, 0.3294118, 1, 1,
0.2984583, 0.311867, 0.5689095, 0, 0.3215686, 1, 1,
0.3035507, -1.337312, 1.671485, 0, 0.3176471, 1, 1,
0.3045045, -0.5564895, 3.160228, 0, 0.3098039, 1, 1,
0.3054929, 0.354481, -1.362644, 0, 0.3058824, 1, 1,
0.3064898, -0.096183, 1.292465, 0, 0.2980392, 1, 1,
0.3083207, -1.035364, 2.982626, 0, 0.2901961, 1, 1,
0.3104557, -0.2817772, 0.7363188, 0, 0.2862745, 1, 1,
0.3125264, 1.590631, -0.8917402, 0, 0.2784314, 1, 1,
0.3172246, 1.880124, -0.2584575, 0, 0.2745098, 1, 1,
0.3176821, -1.13368, 1.29157, 0, 0.2666667, 1, 1,
0.3196556, -0.9071985, 1.803443, 0, 0.2627451, 1, 1,
0.321594, -0.1373357, 0.7222531, 0, 0.254902, 1, 1,
0.3254904, 2.083218, 0.2162196, 0, 0.2509804, 1, 1,
0.3283956, 0.1866003, -0.7480753, 0, 0.2431373, 1, 1,
0.3287091, 1.05275, 1.009076, 0, 0.2392157, 1, 1,
0.3297099, 0.9770453, 2.505463, 0, 0.2313726, 1, 1,
0.3316438, 0.4393305, 0.6586228, 0, 0.227451, 1, 1,
0.3350407, 1.282958, -1.066401, 0, 0.2196078, 1, 1,
0.3380893, 0.2620689, 0.2785237, 0, 0.2156863, 1, 1,
0.339375, -1.636772, 4.546557, 0, 0.2078431, 1, 1,
0.3412339, 0.4790104, 0.6637041, 0, 0.2039216, 1, 1,
0.347198, 0.5464346, 2.090562, 0, 0.1960784, 1, 1,
0.3478934, -1.286123, 2.506175, 0, 0.1882353, 1, 1,
0.3488006, -0.466387, 3.268405, 0, 0.1843137, 1, 1,
0.3495278, 0.559565, 2.091935, 0, 0.1764706, 1, 1,
0.3497615, 1.039303, 0.6905373, 0, 0.172549, 1, 1,
0.3520804, -0.1752285, 3.146079, 0, 0.1647059, 1, 1,
0.3540209, 0.7984226, 0.9340254, 0, 0.1607843, 1, 1,
0.3561419, -0.7277588, 2.048133, 0, 0.1529412, 1, 1,
0.3667647, 2.174425, 0.08463714, 0, 0.1490196, 1, 1,
0.3681706, -0.07345936, 0.5957477, 0, 0.1411765, 1, 1,
0.3689423, 0.05974345, 0.5040504, 0, 0.1372549, 1, 1,
0.3701629, 0.1975669, 2.889949, 0, 0.1294118, 1, 1,
0.3704169, -0.5995163, 1.532704, 0, 0.1254902, 1, 1,
0.3710305, -0.3796242, 2.751678, 0, 0.1176471, 1, 1,
0.3713028, 1.06318, -0.5850427, 0, 0.1137255, 1, 1,
0.3717659, 0.655075, 0.6009417, 0, 0.1058824, 1, 1,
0.3747937, -0.1935206, 3.829499, 0, 0.09803922, 1, 1,
0.3751952, 1.365391, 2.204144, 0, 0.09411765, 1, 1,
0.3755106, 0.821332, 1.159863, 0, 0.08627451, 1, 1,
0.3772173, -0.2986719, 1.417494, 0, 0.08235294, 1, 1,
0.3831942, -0.1066095, 1.592646, 0, 0.07450981, 1, 1,
0.388093, -0.2336396, 1.49373, 0, 0.07058824, 1, 1,
0.3892186, -1.037518, 3.15612, 0, 0.0627451, 1, 1,
0.3915167, 2.164364, 2.709959, 0, 0.05882353, 1, 1,
0.394311, -0.6670141, 3.287081, 0, 0.05098039, 1, 1,
0.3950599, 1.197626, -0.01426315, 0, 0.04705882, 1, 1,
0.3957605, -1.406335, 4.132054, 0, 0.03921569, 1, 1,
0.4000161, 0.3673528, -0.2384412, 0, 0.03529412, 1, 1,
0.4000433, 1.127012, -1.174227, 0, 0.02745098, 1, 1,
0.4001955, 1.302752, 0.3845058, 0, 0.02352941, 1, 1,
0.4019599, 0.291704, 0.7270055, 0, 0.01568628, 1, 1,
0.414258, 0.2875018, 2.58315, 0, 0.01176471, 1, 1,
0.4164609, -1.27068, 1.055838, 0, 0.003921569, 1, 1,
0.4172573, 0.2481233, 2.204652, 0.003921569, 0, 1, 1,
0.4202144, 0.4159571, 0.3822818, 0.007843138, 0, 1, 1,
0.4213295, -1.045693, 4.191278, 0.01568628, 0, 1, 1,
0.4245286, -0.7497932, 2.16644, 0.01960784, 0, 1, 1,
0.4251328, -1.295024, 2.814483, 0.02745098, 0, 1, 1,
0.4262723, -0.4015458, 3.050618, 0.03137255, 0, 1, 1,
0.4278847, 0.6628571, 2.305192, 0.03921569, 0, 1, 1,
0.4296806, 0.07745168, 1.038838, 0.04313726, 0, 1, 1,
0.432169, -0.4156318, 3.280303, 0.05098039, 0, 1, 1,
0.4339783, 0.16558, 1.052573, 0.05490196, 0, 1, 1,
0.4348339, -2.075854, 3.536704, 0.0627451, 0, 1, 1,
0.4360062, 1.143977, -1.312536, 0.06666667, 0, 1, 1,
0.4397388, -0.3506661, 3.84681, 0.07450981, 0, 1, 1,
0.4417602, -1.292804, 2.175847, 0.07843138, 0, 1, 1,
0.4430028, -0.5626507, 1.858312, 0.08627451, 0, 1, 1,
0.444856, 1.82165, 0.9595518, 0.09019608, 0, 1, 1,
0.4450243, 0.5266967, 0.2232224, 0.09803922, 0, 1, 1,
0.4490201, 0.5227746, 1.755225, 0.1058824, 0, 1, 1,
0.4512601, 0.8620758, -0.1659142, 0.1098039, 0, 1, 1,
0.4552436, 0.6115322, -0.7920214, 0.1176471, 0, 1, 1,
0.4553286, 1.066786, 0.2456353, 0.1215686, 0, 1, 1,
0.4564913, -1.256684, 1.14675, 0.1294118, 0, 1, 1,
0.4623535, 0.2015073, 3.233111, 0.1333333, 0, 1, 1,
0.4745421, -0.7360207, 2.854038, 0.1411765, 0, 1, 1,
0.4747231, 1.222137, 0.9140903, 0.145098, 0, 1, 1,
0.4796496, 1.001637, 0.7549192, 0.1529412, 0, 1, 1,
0.484356, -0.2015538, 2.911076, 0.1568628, 0, 1, 1,
0.4886161, 0.6504502, 1.920882, 0.1647059, 0, 1, 1,
0.4937664, 1.043583, 0.6804618, 0.1686275, 0, 1, 1,
0.4943737, -0.5602745, 4.026067, 0.1764706, 0, 1, 1,
0.4980206, -0.04937874, 2.000452, 0.1803922, 0, 1, 1,
0.5000167, -0.8482343, 4.326694, 0.1882353, 0, 1, 1,
0.5013139, 1.556996, 0.4076029, 0.1921569, 0, 1, 1,
0.5043371, -0.09452114, 2.337402, 0.2, 0, 1, 1,
0.5091856, 0.1218574, -0.1113511, 0.2078431, 0, 1, 1,
0.5151085, -0.0254691, 1.112986, 0.2117647, 0, 1, 1,
0.5156718, 0.5764449, -0.1018297, 0.2196078, 0, 1, 1,
0.5190336, 1.382738, -0.1372136, 0.2235294, 0, 1, 1,
0.5197148, -0.06488767, 2.336874, 0.2313726, 0, 1, 1,
0.5197907, 0.7893134, 0.1528064, 0.2352941, 0, 1, 1,
0.5210996, -0.1053217, 2.323406, 0.2431373, 0, 1, 1,
0.5212282, -0.9114438, 3.464938, 0.2470588, 0, 1, 1,
0.5283033, -0.9029179, 3.547279, 0.254902, 0, 1, 1,
0.5283757, 0.5982847, 0.5663571, 0.2588235, 0, 1, 1,
0.5301283, 1.566944, 1.314483, 0.2666667, 0, 1, 1,
0.5322022, 1.062973, 0.164722, 0.2705882, 0, 1, 1,
0.534364, -0.7775348, 2.288345, 0.2784314, 0, 1, 1,
0.5343972, 0.8366251, -0.2604385, 0.282353, 0, 1, 1,
0.5413029, -1.031879, 3.004684, 0.2901961, 0, 1, 1,
0.5422586, 0.2478704, 0.3266299, 0.2941177, 0, 1, 1,
0.5486868, 0.4645467, 1.079595, 0.3019608, 0, 1, 1,
0.5509578, -0.6325841, 1.689369, 0.3098039, 0, 1, 1,
0.5535358, 0.09939947, 1.65891, 0.3137255, 0, 1, 1,
0.5545287, -0.1836835, 2.215727, 0.3215686, 0, 1, 1,
0.5591375, -0.2918882, 1.449633, 0.3254902, 0, 1, 1,
0.5617878, -0.03875332, 1.54173, 0.3333333, 0, 1, 1,
0.5643938, 0.007802435, 2.910384, 0.3372549, 0, 1, 1,
0.5686442, -1.132585, 2.443735, 0.345098, 0, 1, 1,
0.5718057, -0.06371804, 0.9998501, 0.3490196, 0, 1, 1,
0.573624, 1.394054, 0.5285556, 0.3568628, 0, 1, 1,
0.5804722, 1.906719, 1.197369, 0.3607843, 0, 1, 1,
0.5850691, 0.5383945, -1.521338, 0.3686275, 0, 1, 1,
0.5926703, 1.039588, 1.352655, 0.372549, 0, 1, 1,
0.5949768, 0.1936603, -0.5637394, 0.3803922, 0, 1, 1,
0.5973259, 1.739089, -0.5229623, 0.3843137, 0, 1, 1,
0.6018164, 0.3211277, 1.960682, 0.3921569, 0, 1, 1,
0.6022287, -0.7677237, 4.059995, 0.3960784, 0, 1, 1,
0.6034486, -0.3650779, 2.3024, 0.4039216, 0, 1, 1,
0.6087759, -0.4028596, 1.571012, 0.4117647, 0, 1, 1,
0.6117377, 0.700602, 0.5408412, 0.4156863, 0, 1, 1,
0.6188421, 0.4107326, 0.7775515, 0.4235294, 0, 1, 1,
0.6212746, -0.6293722, 2.92551, 0.427451, 0, 1, 1,
0.6219562, -0.5404246, 3.468332, 0.4352941, 0, 1, 1,
0.623731, 0.7866239, 1.337433, 0.4392157, 0, 1, 1,
0.6285303, -1.41306, 3.419836, 0.4470588, 0, 1, 1,
0.6320735, -0.9437509, 3.244025, 0.4509804, 0, 1, 1,
0.6353757, 0.878711, 1.384392, 0.4588235, 0, 1, 1,
0.6514516, -0.9125138, 3.652122, 0.4627451, 0, 1, 1,
0.6581635, 0.054831, 1.201052, 0.4705882, 0, 1, 1,
0.663968, -0.5929268, 0.08232291, 0.4745098, 0, 1, 1,
0.6649309, 1.171163, -0.3225096, 0.4823529, 0, 1, 1,
0.6667497, 0.5874379, 1.732241, 0.4862745, 0, 1, 1,
0.6669482, 1.404991, 0.4899461, 0.4941176, 0, 1, 1,
0.6735609, -0.1878036, 2.501804, 0.5019608, 0, 1, 1,
0.6822322, 1.561595, 1.016723, 0.5058824, 0, 1, 1,
0.6837369, 0.5778199, 0.3677723, 0.5137255, 0, 1, 1,
0.6865649, 1.367948, 0.001071186, 0.5176471, 0, 1, 1,
0.6922384, -0.08459313, 1.100555, 0.5254902, 0, 1, 1,
0.6994218, -0.4387612, 1.937252, 0.5294118, 0, 1, 1,
0.700771, -0.1130979, 2.125391, 0.5372549, 0, 1, 1,
0.7008815, -1.641888, 1.183816, 0.5411765, 0, 1, 1,
0.7020493, 0.6129029, 0.6050965, 0.5490196, 0, 1, 1,
0.7021124, 0.05159166, 0.25138, 0.5529412, 0, 1, 1,
0.7029132, 0.4119333, 1.297981, 0.5607843, 0, 1, 1,
0.7050433, -2.595155, 1.408941, 0.5647059, 0, 1, 1,
0.7059817, 0.7374277, 0.3938703, 0.572549, 0, 1, 1,
0.7076022, 0.1947498, 0.1322412, 0.5764706, 0, 1, 1,
0.707699, 0.3742609, 0.8658011, 0.5843138, 0, 1, 1,
0.708237, -1.017785, 3.044397, 0.5882353, 0, 1, 1,
0.7178465, 0.06607857, 2.232533, 0.5960785, 0, 1, 1,
0.7210181, -0.4629106, -0.3515363, 0.6039216, 0, 1, 1,
0.7219011, -0.3001884, 0.8339785, 0.6078432, 0, 1, 1,
0.7222981, 0.8841788, 0.8282162, 0.6156863, 0, 1, 1,
0.722824, -2.237039, 3.70395, 0.6196079, 0, 1, 1,
0.7244836, 0.3859093, 0.7421011, 0.627451, 0, 1, 1,
0.7297246, 0.708528, 1.257921, 0.6313726, 0, 1, 1,
0.7348796, 1.708285, 2.940247, 0.6392157, 0, 1, 1,
0.7349412, 0.0688248, 1.566167, 0.6431373, 0, 1, 1,
0.7349438, -0.008814858, 2.142428, 0.6509804, 0, 1, 1,
0.7383886, -1.324348, 2.28309, 0.654902, 0, 1, 1,
0.744179, 2.288846, -0.9457365, 0.6627451, 0, 1, 1,
0.748787, 1.531109, 0.9701374, 0.6666667, 0, 1, 1,
0.7516378, 0.4737592, 1.867204, 0.6745098, 0, 1, 1,
0.7524109, -1.185456, 1.331542, 0.6784314, 0, 1, 1,
0.7649773, -0.07970516, 2.686288, 0.6862745, 0, 1, 1,
0.7662412, -0.910116, 3.185083, 0.6901961, 0, 1, 1,
0.7664738, 0.5644585, 0.7415975, 0.6980392, 0, 1, 1,
0.7676372, 0.3552454, -0.1527792, 0.7058824, 0, 1, 1,
0.769977, -0.3214476, 1.353485, 0.7098039, 0, 1, 1,
0.7703062, -1.268455, 2.000097, 0.7176471, 0, 1, 1,
0.7722202, 1.268605, -1.209085, 0.7215686, 0, 1, 1,
0.7752947, -0.6324817, 3.888217, 0.7294118, 0, 1, 1,
0.7882507, 2.24027, -0.7094844, 0.7333333, 0, 1, 1,
0.7901677, -1.503002, 1.863945, 0.7411765, 0, 1, 1,
0.7910174, 0.3855128, -1.299906, 0.7450981, 0, 1, 1,
0.7992741, 0.6318453, 0.8943967, 0.7529412, 0, 1, 1,
0.8102058, 1.006913, 1.129709, 0.7568628, 0, 1, 1,
0.8182831, -0.143312, 1.595532, 0.7647059, 0, 1, 1,
0.8233463, 0.08795846, 1.75171, 0.7686275, 0, 1, 1,
0.8246347, -0.794538, 2.563539, 0.7764706, 0, 1, 1,
0.8298566, -0.5010214, 1.195118, 0.7803922, 0, 1, 1,
0.8342488, -0.5440005, 2.466431, 0.7882353, 0, 1, 1,
0.8355582, 0.6250815, 1.75337, 0.7921569, 0, 1, 1,
0.8391699, -0.519636, 0.9637996, 0.8, 0, 1, 1,
0.8410965, 0.8613507, 0.3456414, 0.8078431, 0, 1, 1,
0.8421623, -0.4390953, 1.573742, 0.8117647, 0, 1, 1,
0.8460832, -0.1403619, 2.688464, 0.8196079, 0, 1, 1,
0.8461596, -0.07068235, 0.1932906, 0.8235294, 0, 1, 1,
0.8487376, -0.8145733, 1.973709, 0.8313726, 0, 1, 1,
0.8496382, -0.8092507, 1.494717, 0.8352941, 0, 1, 1,
0.8497359, 0.8020378, 0.4375776, 0.8431373, 0, 1, 1,
0.8525754, 1.166161, 1.600208, 0.8470588, 0, 1, 1,
0.8548632, -1.038378, 2.627765, 0.854902, 0, 1, 1,
0.8573495, -0.7985154, 0.4719647, 0.8588235, 0, 1, 1,
0.8723899, 0.5624232, 1.837269, 0.8666667, 0, 1, 1,
0.8734148, 0.8411081, 0.8484151, 0.8705882, 0, 1, 1,
0.87458, -1.280099, 3.9531, 0.8784314, 0, 1, 1,
0.8837429, -0.4184518, 2.702682, 0.8823529, 0, 1, 1,
0.8878164, -0.9342999, 1.536674, 0.8901961, 0, 1, 1,
0.8882908, 0.5586771, 1.317938, 0.8941177, 0, 1, 1,
0.8889585, 0.3159753, 2.576827, 0.9019608, 0, 1, 1,
0.8899055, -1.755769, 2.158754, 0.9098039, 0, 1, 1,
0.8949573, -0.02718657, 3.02383, 0.9137255, 0, 1, 1,
0.8949733, -0.3487516, 2.113333, 0.9215686, 0, 1, 1,
0.8952259, -1.716692, 2.808162, 0.9254902, 0, 1, 1,
0.8963622, -2.673707, 2.569651, 0.9333333, 0, 1, 1,
0.9003499, 0.1187023, 0.8863885, 0.9372549, 0, 1, 1,
0.9070094, 1.242335, 1.820922, 0.945098, 0, 1, 1,
0.9148948, -0.0950352, 0.2355011, 0.9490196, 0, 1, 1,
0.9155352, -2.227186, 1.846246, 0.9568627, 0, 1, 1,
0.9158769, 0.3530219, 1.001328, 0.9607843, 0, 1, 1,
0.9187353, -1.228147, 2.125571, 0.9686275, 0, 1, 1,
0.9204331, -0.9568817, 0.7428001, 0.972549, 0, 1, 1,
0.9209437, -0.8833065, 4.389384, 0.9803922, 0, 1, 1,
0.9321657, -0.5802898, 0.5550504, 0.9843137, 0, 1, 1,
0.9374889, 0.1758236, 0.3238781, 0.9921569, 0, 1, 1,
0.9381412, -0.7167233, 1.198544, 0.9960784, 0, 1, 1,
0.9549646, 0.5448264, 2.005793, 1, 0, 0.9960784, 1,
0.9579337, -0.6924806, 1.320789, 1, 0, 0.9882353, 1,
0.957976, -0.4786787, 2.774082, 1, 0, 0.9843137, 1,
0.9638185, 1.465663, 0.007327802, 1, 0, 0.9764706, 1,
0.9740525, 0.9503313, 1.598066, 1, 0, 0.972549, 1,
0.9893646, -1.470151, 2.652281, 1, 0, 0.9647059, 1,
0.9927107, -0.1056778, 1.245056, 1, 0, 0.9607843, 1,
0.9962998, -0.2391165, 3.35531, 1, 0, 0.9529412, 1,
1.006625, 1.0774, 1.325952, 1, 0, 0.9490196, 1,
1.007709, -0.05289718, 1.917558, 1, 0, 0.9411765, 1,
1.008563, -0.618551, 0.3136139, 1, 0, 0.9372549, 1,
1.017593, 1.201238, 1.469926, 1, 0, 0.9294118, 1,
1.018929, -1.816287, 2.326483, 1, 0, 0.9254902, 1,
1.023823, 1.047526, 0.1535883, 1, 0, 0.9176471, 1,
1.025428, 0.9855488, 1.434138, 1, 0, 0.9137255, 1,
1.026772, -1.486576, 3.26978, 1, 0, 0.9058824, 1,
1.0276, -1.192077, 3.162509, 1, 0, 0.9019608, 1,
1.028803, -0.5395198, 2.401774, 1, 0, 0.8941177, 1,
1.035704, -1.058301, 2.286567, 1, 0, 0.8862745, 1,
1.037654, -0.9299293, 1.049097, 1, 0, 0.8823529, 1,
1.043831, -0.6423225, 2.753956, 1, 0, 0.8745098, 1,
1.05293, 0.009344523, -0.5928946, 1, 0, 0.8705882, 1,
1.056785, -0.03737814, 0.3297422, 1, 0, 0.8627451, 1,
1.065952, 0.4582062, 0.2198392, 1, 0, 0.8588235, 1,
1.066129, 0.1378895, 1.238487, 1, 0, 0.8509804, 1,
1.067961, -0.07664172, -1.041523, 1, 0, 0.8470588, 1,
1.068832, -1.109692, 2.036198, 1, 0, 0.8392157, 1,
1.076282, -0.6446397, 2.443851, 1, 0, 0.8352941, 1,
1.083452, 0.9140599, 0.9067804, 1, 0, 0.827451, 1,
1.088681, 0.6130455, 0.9910812, 1, 0, 0.8235294, 1,
1.089069, -0.7618778, 1.642661, 1, 0, 0.8156863, 1,
1.091082, 0.07471005, -1.04052, 1, 0, 0.8117647, 1,
1.099587, -0.4934165, 1.702169, 1, 0, 0.8039216, 1,
1.100039, 0.8096012, -0.0142785, 1, 0, 0.7960784, 1,
1.104416, 0.2693097, 0.5246565, 1, 0, 0.7921569, 1,
1.10443, 0.4014347, 0.1984651, 1, 0, 0.7843137, 1,
1.107031, 1.360512, 1.643548, 1, 0, 0.7803922, 1,
1.109722, -1.868856, 4.953199, 1, 0, 0.772549, 1,
1.132182, 1.74375, 0.2225939, 1, 0, 0.7686275, 1,
1.13431, 0.2744778, -0.05699497, 1, 0, 0.7607843, 1,
1.143574, 2.020991, 1.063123, 1, 0, 0.7568628, 1,
1.173605, 0.5688555, 1.226635, 1, 0, 0.7490196, 1,
1.176305, -0.8359078, 4.014833, 1, 0, 0.7450981, 1,
1.176615, -1.504146, 3.247602, 1, 0, 0.7372549, 1,
1.17668, -0.57114, 2.251915, 1, 0, 0.7333333, 1,
1.178705, 0.7007687, 1.395777, 1, 0, 0.7254902, 1,
1.180086, -0.5627813, 1.985392, 1, 0, 0.7215686, 1,
1.182034, 1.047927, 2.038409, 1, 0, 0.7137255, 1,
1.185532, 1.281367, 0.08649774, 1, 0, 0.7098039, 1,
1.187646, -0.9695768, 2.594546, 1, 0, 0.7019608, 1,
1.194082, -0.3057424, 2.293652, 1, 0, 0.6941177, 1,
1.196362, 0.07044344, 2.152557, 1, 0, 0.6901961, 1,
1.199136, 1.439334, -0.1116694, 1, 0, 0.682353, 1,
1.206337, -0.2418096, 2.084457, 1, 0, 0.6784314, 1,
1.210938, -0.4822329, 3.132236, 1, 0, 0.6705883, 1,
1.22542, 1.210371, 0.3765545, 1, 0, 0.6666667, 1,
1.227388, -1.311283, 3.027878, 1, 0, 0.6588235, 1,
1.231657, -0.5374762, 3.001754, 1, 0, 0.654902, 1,
1.239879, -1.418949, 2.738869, 1, 0, 0.6470588, 1,
1.244123, -0.1921724, 1.48768, 1, 0, 0.6431373, 1,
1.250308, 0.2944566, 3.035568, 1, 0, 0.6352941, 1,
1.256694, 0.6540573, 0.751199, 1, 0, 0.6313726, 1,
1.261899, -0.1004221, 1.633499, 1, 0, 0.6235294, 1,
1.275917, -1.751402, 2.785427, 1, 0, 0.6196079, 1,
1.277407, 0.8940558, 0.2844796, 1, 0, 0.6117647, 1,
1.288807, 0.9265205, 2.589466, 1, 0, 0.6078432, 1,
1.298783, 0.832868, 1.279533, 1, 0, 0.6, 1,
1.303857, -0.2209606, 2.956905, 1, 0, 0.5921569, 1,
1.314053, -1.17854, 2.75458, 1, 0, 0.5882353, 1,
1.319567, -0.3416646, 2.215569, 1, 0, 0.5803922, 1,
1.320227, -0.4244627, 1.713847, 1, 0, 0.5764706, 1,
1.325379, 0.8086849, 1.078642, 1, 0, 0.5686275, 1,
1.325936, 2.273126, 1.0841, 1, 0, 0.5647059, 1,
1.337812, -0.6067902, 2.645833, 1, 0, 0.5568628, 1,
1.347449, 0.01881842, 1.242234, 1, 0, 0.5529412, 1,
1.348933, 1.392849, -0.1895846, 1, 0, 0.5450981, 1,
1.35034, -1.611781, 2.334098, 1, 0, 0.5411765, 1,
1.363118, -0.5160403, 2.134197, 1, 0, 0.5333334, 1,
1.368118, -1.132038, -0.1380118, 1, 0, 0.5294118, 1,
1.370182, 1.428777, 0.9183559, 1, 0, 0.5215687, 1,
1.378274, -1.630665, 1.241994, 1, 0, 0.5176471, 1,
1.387957, -1.091909, 1.599087, 1, 0, 0.509804, 1,
1.388493, -0.0235536, 0.1814651, 1, 0, 0.5058824, 1,
1.404683, -0.556885, 2.112419, 1, 0, 0.4980392, 1,
1.406763, 3.281152, 0.6643846, 1, 0, 0.4901961, 1,
1.41513, 0.9807561, 1.738647, 1, 0, 0.4862745, 1,
1.427042, 1.835577, 0.720235, 1, 0, 0.4784314, 1,
1.435496, -0.9983847, 1.173606, 1, 0, 0.4745098, 1,
1.436569, 1.461429, -0.09688842, 1, 0, 0.4666667, 1,
1.44295, 0.1074711, 1.876789, 1, 0, 0.4627451, 1,
1.448382, -0.5562905, 0.6440928, 1, 0, 0.454902, 1,
1.45033, 0.7469398, -0.1397181, 1, 0, 0.4509804, 1,
1.451694, -0.5025072, 1.783407, 1, 0, 0.4431373, 1,
1.486388, 0.9304003, 1.85803, 1, 0, 0.4392157, 1,
1.495983, 0.7430451, 1.288115, 1, 0, 0.4313726, 1,
1.499626, -0.6324238, 2.177141, 1, 0, 0.427451, 1,
1.507553, -0.0258293, 1.994125, 1, 0, 0.4196078, 1,
1.510149, -0.4129935, 1.629358, 1, 0, 0.4156863, 1,
1.524007, -0.3105135, 2.826145, 1, 0, 0.4078431, 1,
1.537388, 0.004741316, 0.7733486, 1, 0, 0.4039216, 1,
1.545926, -0.2998241, 2.304511, 1, 0, 0.3960784, 1,
1.549119, -0.2125621, 0.4966848, 1, 0, 0.3882353, 1,
1.549212, -1.117905, 2.169609, 1, 0, 0.3843137, 1,
1.553606, -0.1855892, 1.282146, 1, 0, 0.3764706, 1,
1.553692, -0.7266642, 2.385395, 1, 0, 0.372549, 1,
1.55686, 2.158323, -0.6554377, 1, 0, 0.3647059, 1,
1.568143, 0.6841255, 1.01968, 1, 0, 0.3607843, 1,
1.598658, 0.4644619, 1.070139, 1, 0, 0.3529412, 1,
1.607925, 0.8921315, 0.7884992, 1, 0, 0.3490196, 1,
1.609303, -0.06271299, 2.383329, 1, 0, 0.3411765, 1,
1.609601, 0.4557859, 0.968689, 1, 0, 0.3372549, 1,
1.62845, -1.152091, 0.3188245, 1, 0, 0.3294118, 1,
1.669461, 0.3597766, 2.536464, 1, 0, 0.3254902, 1,
1.669762, 1.798964, -0.2364434, 1, 0, 0.3176471, 1,
1.672697, -0.2629403, 1.757672, 1, 0, 0.3137255, 1,
1.726587, -0.4768681, 2.514124, 1, 0, 0.3058824, 1,
1.740329, -0.6776907, -0.1288593, 1, 0, 0.2980392, 1,
1.773185, -0.2817509, 2.475526, 1, 0, 0.2941177, 1,
1.787313, -0.1602909, 3.260183, 1, 0, 0.2862745, 1,
1.793435, 0.8193436, 2.292975, 1, 0, 0.282353, 1,
1.80261, 0.4352664, 0.9684986, 1, 0, 0.2745098, 1,
1.807917, 0.9858069, 1.781989, 1, 0, 0.2705882, 1,
1.809746, 0.6659987, 0.9800991, 1, 0, 0.2627451, 1,
1.829975, -1.377398, 3.60901, 1, 0, 0.2588235, 1,
1.837951, 1.252878, 1.075835, 1, 0, 0.2509804, 1,
1.841921, 2.067157, 1.604745, 1, 0, 0.2470588, 1,
1.854951, -0.1317662, 2.664243, 1, 0, 0.2392157, 1,
1.861597, 1.785444, -0.8044931, 1, 0, 0.2352941, 1,
1.861726, -0.06479665, 3.719895, 1, 0, 0.227451, 1,
1.866563, 1.475413, 2.584153, 1, 0, 0.2235294, 1,
1.904459, 0.1628122, 2.038035, 1, 0, 0.2156863, 1,
1.913448, -0.0610259, 0.6058131, 1, 0, 0.2117647, 1,
1.914965, 0.8795538, -0.2642884, 1, 0, 0.2039216, 1,
1.946388, -2.585359, 3.280262, 1, 0, 0.1960784, 1,
1.959632, -0.8858416, 1.168994, 1, 0, 0.1921569, 1,
1.961358, -1.013048, 1.777921, 1, 0, 0.1843137, 1,
1.973914, -1.424593, 2.459977, 1, 0, 0.1803922, 1,
1.977453, -2.123382, 3.463787, 1, 0, 0.172549, 1,
1.977512, -2.059534, 4.171685, 1, 0, 0.1686275, 1,
1.99785, 0.008843044, 0.8889884, 1, 0, 0.1607843, 1,
2.002627, -0.7432283, 2.543994, 1, 0, 0.1568628, 1,
2.015839, -0.1012267, 1.059471, 1, 0, 0.1490196, 1,
2.047132, 0.69924, 0.6937221, 1, 0, 0.145098, 1,
2.05097, -0.5321415, 0.3786493, 1, 0, 0.1372549, 1,
2.062175, -0.1693751, 1.582169, 1, 0, 0.1333333, 1,
2.078727, -0.8156728, 3.388794, 1, 0, 0.1254902, 1,
2.08427, -1.853851, 2.268396, 1, 0, 0.1215686, 1,
2.086174, 0.1901326, 1.190877, 1, 0, 0.1137255, 1,
2.1187, 0.2359179, 3.925042, 1, 0, 0.1098039, 1,
2.127544, -0.0962256, 2.01444, 1, 0, 0.1019608, 1,
2.163665, 0.5858275, 0.1633377, 1, 0, 0.09411765, 1,
2.206609, -1.806559, 3.386347, 1, 0, 0.09019608, 1,
2.219613, 1.013786, 0.8134386, 1, 0, 0.08235294, 1,
2.229908, -0.2038587, 0.9131384, 1, 0, 0.07843138, 1,
2.236789, 1.231441, 1.064105, 1, 0, 0.07058824, 1,
2.266024, -0.2952611, 3.127575, 1, 0, 0.06666667, 1,
2.293054, 0.5012558, -0.1608178, 1, 0, 0.05882353, 1,
2.293602, -0.5497535, 1.886428, 1, 0, 0.05490196, 1,
2.318463, 0.08024727, 2.548537, 1, 0, 0.04705882, 1,
2.427464, -0.3727487, 0.658585, 1, 0, 0.04313726, 1,
2.483863, 0.7529594, 1.537953, 1, 0, 0.03529412, 1,
2.488154, -0.4172918, 1.627895, 1, 0, 0.03137255, 1,
2.715247, 3.230615, 0.4241032, 1, 0, 0.02352941, 1,
2.801789, -0.2462989, 2.261178, 1, 0, 0.01960784, 1,
3.055262, -0.2103508, 3.017992, 1, 0, 0.01176471, 1,
3.179742, 0.1697498, 1.328327, 1, 0, 0.007843138, 1
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
-0.04168892, -3.89999, -6.561508, 0, -0.5, 0.5, 0.5,
-0.04168892, -3.89999, -6.561508, 1, -0.5, 0.5, 0.5,
-0.04168892, -3.89999, -6.561508, 1, 1.5, 0.5, 0.5,
-0.04168892, -3.89999, -6.561508, 0, 1.5, 0.5, 0.5
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
-4.355185, 0.2109759, -6.561508, 0, -0.5, 0.5, 0.5,
-4.355185, 0.2109759, -6.561508, 1, -0.5, 0.5, 0.5,
-4.355185, 0.2109759, -6.561508, 1, 1.5, 0.5, 0.5,
-4.355185, 0.2109759, -6.561508, 0, 1.5, 0.5, 0.5
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
-4.355185, -3.89999, 0.03028035, 0, -0.5, 0.5, 0.5,
-4.355185, -3.89999, 0.03028035, 1, -0.5, 0.5, 0.5,
-4.355185, -3.89999, 0.03028035, 1, 1.5, 0.5, 0.5,
-4.355185, -3.89999, 0.03028035, 0, 1.5, 0.5, 0.5
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
-3, -2.951306, -5.040326,
3, -2.951306, -5.040326,
-3, -2.951306, -5.040326,
-3, -3.10942, -5.293856,
-2, -2.951306, -5.040326,
-2, -3.10942, -5.293856,
-1, -2.951306, -5.040326,
-1, -3.10942, -5.293856,
0, -2.951306, -5.040326,
0, -3.10942, -5.293856,
1, -2.951306, -5.040326,
1, -3.10942, -5.293856,
2, -2.951306, -5.040326,
2, -3.10942, -5.293856,
3, -2.951306, -5.040326,
3, -3.10942, -5.293856
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
-3, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
-3, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
-3, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
-3, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
-2, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
-2, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
-2, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
-2, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
-1, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
-1, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
-1, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
-1, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
0, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
0, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
0, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
0, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
1, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
1, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
1, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
1, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
2, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
2, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
2, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
2, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5,
3, -3.425648, -5.800917, 0, -0.5, 0.5, 0.5,
3, -3.425648, -5.800917, 1, -0.5, 0.5, 0.5,
3, -3.425648, -5.800917, 1, 1.5, 0.5, 0.5,
3, -3.425648, -5.800917, 0, 1.5, 0.5, 0.5
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
-3.359763, -2, -5.040326,
-3.359763, 3, -5.040326,
-3.359763, -2, -5.040326,
-3.525666, -2, -5.293856,
-3.359763, -1, -5.040326,
-3.525666, -1, -5.293856,
-3.359763, 0, -5.040326,
-3.525666, 0, -5.293856,
-3.359763, 1, -5.040326,
-3.525666, 1, -5.293856,
-3.359763, 2, -5.040326,
-3.525666, 2, -5.293856,
-3.359763, 3, -5.040326,
-3.525666, 3, -5.293856
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
-3.857474, -2, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, -2, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, -2, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, -2, -5.800917, 0, 1.5, 0.5, 0.5,
-3.857474, -1, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, -1, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, -1, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, -1, -5.800917, 0, 1.5, 0.5, 0.5,
-3.857474, 0, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, 0, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, 0, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, 0, -5.800917, 0, 1.5, 0.5, 0.5,
-3.857474, 1, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, 1, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, 1, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, 1, -5.800917, 0, 1.5, 0.5, 0.5,
-3.857474, 2, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, 2, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, 2, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, 2, -5.800917, 0, 1.5, 0.5, 0.5,
-3.857474, 3, -5.800917, 0, -0.5, 0.5, 0.5,
-3.857474, 3, -5.800917, 1, -0.5, 0.5, 0.5,
-3.857474, 3, -5.800917, 1, 1.5, 0.5, 0.5,
-3.857474, 3, -5.800917, 0, 1.5, 0.5, 0.5
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
-3.359763, -2.951306, -4,
-3.359763, -2.951306, 4,
-3.359763, -2.951306, -4,
-3.525666, -3.10942, -4,
-3.359763, -2.951306, -2,
-3.525666, -3.10942, -2,
-3.359763, -2.951306, 0,
-3.525666, -3.10942, 0,
-3.359763, -2.951306, 2,
-3.525666, -3.10942, 2,
-3.359763, -2.951306, 4,
-3.525666, -3.10942, 4
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
-3.857474, -3.425648, -4, 0, -0.5, 0.5, 0.5,
-3.857474, -3.425648, -4, 1, -0.5, 0.5, 0.5,
-3.857474, -3.425648, -4, 1, 1.5, 0.5, 0.5,
-3.857474, -3.425648, -4, 0, 1.5, 0.5, 0.5,
-3.857474, -3.425648, -2, 0, -0.5, 0.5, 0.5,
-3.857474, -3.425648, -2, 1, -0.5, 0.5, 0.5,
-3.857474, -3.425648, -2, 1, 1.5, 0.5, 0.5,
-3.857474, -3.425648, -2, 0, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 0, 0, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 0, 1, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 0, 1, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 0, 0, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 2, 0, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 2, 1, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 2, 1, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 2, 0, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 4, 0, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 4, 1, -0.5, 0.5, 0.5,
-3.857474, -3.425648, 4, 1, 1.5, 0.5, 0.5,
-3.857474, -3.425648, 4, 0, 1.5, 0.5, 0.5
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
-3.359763, -2.951306, -5.040326,
-3.359763, 3.373257, -5.040326,
-3.359763, -2.951306, 5.100886,
-3.359763, 3.373257, 5.100886,
-3.359763, -2.951306, -5.040326,
-3.359763, -2.951306, 5.100886,
-3.359763, 3.373257, -5.040326,
-3.359763, 3.373257, 5.100886,
-3.359763, -2.951306, -5.040326,
3.276385, -2.951306, -5.040326,
-3.359763, -2.951306, 5.100886,
3.276385, -2.951306, 5.100886,
-3.359763, 3.373257, -5.040326,
3.276385, 3.373257, -5.040326,
-3.359763, 3.373257, 5.100886,
3.276385, 3.373257, 5.100886,
3.276385, -2.951306, -5.040326,
3.276385, 3.373257, -5.040326,
3.276385, -2.951306, 5.100886,
3.276385, 3.373257, 5.100886,
3.276385, -2.951306, -5.040326,
3.276385, -2.951306, 5.100886,
3.276385, 3.373257, -5.040326,
3.276385, 3.373257, 5.100886
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
var radius = 7.299785;
var distance = 32.47757;
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
mvMatrix.translate( 0.04168892, -0.2109759, -0.03028035 );
mvMatrix.scale( 1.189345, 1.247939, 0.7782768 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.47757);
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


