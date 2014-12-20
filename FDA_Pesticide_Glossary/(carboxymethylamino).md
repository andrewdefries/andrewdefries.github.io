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
-3.214626, 0.2697749, -0.5156612, 1, 0, 0, 1,
-2.991301, 0.04055937, -1.996899, 1, 0.007843138, 0, 1,
-2.91022, 0.991098, -2.855441, 1, 0.01176471, 0, 1,
-2.72671, -0.4649173, -3.113564, 1, 0.01960784, 0, 1,
-2.596126, -0.1423736, -1.51542, 1, 0.02352941, 0, 1,
-2.524374, -1.064116, -1.075245, 1, 0.03137255, 0, 1,
-2.458208, 0.3986567, -2.428683, 1, 0.03529412, 0, 1,
-2.320047, -0.6415753, 0.5309997, 1, 0.04313726, 0, 1,
-2.31933, 0.7717443, -2.849829, 1, 0.04705882, 0, 1,
-2.306599, -0.04014717, -0.3262487, 1, 0.05490196, 0, 1,
-2.262695, -0.1902636, -0.8996582, 1, 0.05882353, 0, 1,
-2.256361, 1.182287, -1.506031, 1, 0.06666667, 0, 1,
-2.254645, 0.469552, -0.4428124, 1, 0.07058824, 0, 1,
-2.183878, -0.8690042, -1.747527, 1, 0.07843138, 0, 1,
-2.172218, 0.1511648, -1.521094, 1, 0.08235294, 0, 1,
-2.17091, 1.208229, -2.283467, 1, 0.09019608, 0, 1,
-2.146682, 0.8819816, 0.246124, 1, 0.09411765, 0, 1,
-2.133234, 2.058336, -1.470731, 1, 0.1019608, 0, 1,
-2.107847, -1.510456, -2.919862, 1, 0.1098039, 0, 1,
-2.068393, -0.7276996, -0.981057, 1, 0.1137255, 0, 1,
-2.038506, -0.5714489, -3.769689, 1, 0.1215686, 0, 1,
-2.02388, -0.08053964, -1.905232, 1, 0.1254902, 0, 1,
-1.989791, 1.020947, -3.624805, 1, 0.1333333, 0, 1,
-1.986589, -0.177819, -2.383807, 1, 0.1372549, 0, 1,
-1.959702, -1.13383, -1.159874, 1, 0.145098, 0, 1,
-1.938727, -0.2216191, -3.687428, 1, 0.1490196, 0, 1,
-1.913187, 1.188251, -1.416217, 1, 0.1568628, 0, 1,
-1.900858, -0.667556, -2.635933, 1, 0.1607843, 0, 1,
-1.899431, 0.2024557, -1.984434, 1, 0.1686275, 0, 1,
-1.890413, 1.471255, -0.4219539, 1, 0.172549, 0, 1,
-1.880448, -0.1644933, 0.01185634, 1, 0.1803922, 0, 1,
-1.872179, -1.645192, -2.063533, 1, 0.1843137, 0, 1,
-1.869953, 0.5818963, -1.256127, 1, 0.1921569, 0, 1,
-1.849976, -0.6262121, -1.614763, 1, 0.1960784, 0, 1,
-1.84555, -1.142137, -0.8080027, 1, 0.2039216, 0, 1,
-1.844414, -0.2705433, -3.568825, 1, 0.2117647, 0, 1,
-1.84431, 0.4913656, -1.302284, 1, 0.2156863, 0, 1,
-1.833234, 0.5629289, -0.8188255, 1, 0.2235294, 0, 1,
-1.825968, 1.04415, -0.7472422, 1, 0.227451, 0, 1,
-1.824891, -1.294223, -2.322521, 1, 0.2352941, 0, 1,
-1.819188, -1.200707, -2.512478, 1, 0.2392157, 0, 1,
-1.812484, 0.4315822, -1.459594, 1, 0.2470588, 0, 1,
-1.811868, -2.634172, -5.288004, 1, 0.2509804, 0, 1,
-1.808342, -0.1941069, -1.681209, 1, 0.2588235, 0, 1,
-1.801831, -0.2364997, -1.514766, 1, 0.2627451, 0, 1,
-1.79193, 1.108347, 0.02446144, 1, 0.2705882, 0, 1,
-1.786359, 0.6885791, -0.9459661, 1, 0.2745098, 0, 1,
-1.779701, 0.6989466, 1.168594, 1, 0.282353, 0, 1,
-1.745426, -0.2957259, -0.1814209, 1, 0.2862745, 0, 1,
-1.734893, -0.2324237, 0.1395966, 1, 0.2941177, 0, 1,
-1.71121, 2.158789, -1.759059, 1, 0.3019608, 0, 1,
-1.709242, -0.04855302, -0.7287742, 1, 0.3058824, 0, 1,
-1.695924, -0.4201699, -2.182347, 1, 0.3137255, 0, 1,
-1.685627, -0.1426217, -0.570832, 1, 0.3176471, 0, 1,
-1.667527, 0.7181886, 0.3369852, 1, 0.3254902, 0, 1,
-1.667525, -0.9510534, -1.209916, 1, 0.3294118, 0, 1,
-1.663118, -1.619778, -5.126918, 1, 0.3372549, 0, 1,
-1.662183, -0.7929054, -1.194423, 1, 0.3411765, 0, 1,
-1.648183, 0.9396918, -2.138108, 1, 0.3490196, 0, 1,
-1.642558, -0.1354681, -2.11539, 1, 0.3529412, 0, 1,
-1.626156, 0.3839968, -2.153829, 1, 0.3607843, 0, 1,
-1.624875, -0.9555705, -0.5026232, 1, 0.3647059, 0, 1,
-1.611371, 0.2965444, -1.01587, 1, 0.372549, 0, 1,
-1.598718, 1.445108, -1.3277, 1, 0.3764706, 0, 1,
-1.588634, 1.357426, 0.1481483, 1, 0.3843137, 0, 1,
-1.580835, -0.005894923, -3.158494, 1, 0.3882353, 0, 1,
-1.576328, 0.1082807, -1.8848, 1, 0.3960784, 0, 1,
-1.562139, 0.5726711, -1.050002, 1, 0.4039216, 0, 1,
-1.562043, 0.5760225, -2.346797, 1, 0.4078431, 0, 1,
-1.557804, 0.1721786, -2.250896, 1, 0.4156863, 0, 1,
-1.557516, 0.3267657, -3.164621, 1, 0.4196078, 0, 1,
-1.554028, 0.2939131, -1.261514, 1, 0.427451, 0, 1,
-1.54346, -0.4350243, -2.072856, 1, 0.4313726, 0, 1,
-1.540982, -0.5190894, -3.638873, 1, 0.4392157, 0, 1,
-1.534854, -1.805106, -3.731572, 1, 0.4431373, 0, 1,
-1.533884, -1.443085, -1.327935, 1, 0.4509804, 0, 1,
-1.515044, 1.787366, 0.1799755, 1, 0.454902, 0, 1,
-1.503217, 1.473791, -0.4514844, 1, 0.4627451, 0, 1,
-1.499809, 0.5800799, -0.6401945, 1, 0.4666667, 0, 1,
-1.493431, -0.9524038, -2.09577, 1, 0.4745098, 0, 1,
-1.491093, 1.094095, -0.3788151, 1, 0.4784314, 0, 1,
-1.483538, 0.6273129, -0.4628112, 1, 0.4862745, 0, 1,
-1.483522, -1.121166, -1.833948, 1, 0.4901961, 0, 1,
-1.471227, 0.2541804, -3.189199, 1, 0.4980392, 0, 1,
-1.461067, 0.2666313, -0.3433701, 1, 0.5058824, 0, 1,
-1.453376, 0.1560301, -0.638262, 1, 0.509804, 0, 1,
-1.450558, -0.134711, -2.059426, 1, 0.5176471, 0, 1,
-1.447631, 0.4805804, 0.03647227, 1, 0.5215687, 0, 1,
-1.438896, 0.9278655, 0.1979899, 1, 0.5294118, 0, 1,
-1.43676, -1.286858, -1.096944, 1, 0.5333334, 0, 1,
-1.426294, -0.8818837, -3.521043, 1, 0.5411765, 0, 1,
-1.405768, -0.350522, -3.484376, 1, 0.5450981, 0, 1,
-1.392693, -0.1114438, -1.997148, 1, 0.5529412, 0, 1,
-1.391299, 0.3418484, -0.3052382, 1, 0.5568628, 0, 1,
-1.389202, -0.8169417, -4.839697, 1, 0.5647059, 0, 1,
-1.384543, 1.318816, -0.8606595, 1, 0.5686275, 0, 1,
-1.377219, -0.7870566, -0.6104446, 1, 0.5764706, 0, 1,
-1.373666, 1.648127, -1.40289, 1, 0.5803922, 0, 1,
-1.369913, 1.20827, -0.671753, 1, 0.5882353, 0, 1,
-1.369609, 0.2002024, -1.963421, 1, 0.5921569, 0, 1,
-1.367172, 0.4028457, -2.50702, 1, 0.6, 0, 1,
-1.359538, -0.03839898, -1.118509, 1, 0.6078432, 0, 1,
-1.359164, -0.3146693, -1.460224, 1, 0.6117647, 0, 1,
-1.355041, -1.499293, -0.8470892, 1, 0.6196079, 0, 1,
-1.352475, -1.735886, -2.425104, 1, 0.6235294, 0, 1,
-1.33312, -0.5177594, -1.573917, 1, 0.6313726, 0, 1,
-1.326448, 0.4263483, -0.08018741, 1, 0.6352941, 0, 1,
-1.325813, 1.479659, 0.869348, 1, 0.6431373, 0, 1,
-1.321721, -0.8684568, -3.491816, 1, 0.6470588, 0, 1,
-1.316528, -0.03504832, -2.310242, 1, 0.654902, 0, 1,
-1.313579, 1.66398, -1.531254, 1, 0.6588235, 0, 1,
-1.311697, -0.8626064, -0.6119096, 1, 0.6666667, 0, 1,
-1.309765, -0.3439668, -2.956536, 1, 0.6705883, 0, 1,
-1.307713, -0.3294436, -2.404662, 1, 0.6784314, 0, 1,
-1.307441, -0.2683553, -2.117741, 1, 0.682353, 0, 1,
-1.306643, -1.717154, -2.487255, 1, 0.6901961, 0, 1,
-1.305428, 1.539198, -0.6552513, 1, 0.6941177, 0, 1,
-1.289, -0.7451034, -1.245734, 1, 0.7019608, 0, 1,
-1.272362, 0.09638935, -2.203139, 1, 0.7098039, 0, 1,
-1.270359, -1.136956, -1.703652, 1, 0.7137255, 0, 1,
-1.266411, -1.887212, -1.562075, 1, 0.7215686, 0, 1,
-1.261545, -0.2270002, -2.258733, 1, 0.7254902, 0, 1,
-1.258681, 0.3526068, -1.264027, 1, 0.7333333, 0, 1,
-1.257537, 0.6472909, -2.047582, 1, 0.7372549, 0, 1,
-1.257491, 2.276572, -2.22142, 1, 0.7450981, 0, 1,
-1.25485, -0.4411569, -0.9941485, 1, 0.7490196, 0, 1,
-1.250389, 1.019788, -0.2940116, 1, 0.7568628, 0, 1,
-1.24835, -0.05605059, -1.124167, 1, 0.7607843, 0, 1,
-1.243877, 1.788957, 0.1675895, 1, 0.7686275, 0, 1,
-1.234946, -0.5249316, -2.219539, 1, 0.772549, 0, 1,
-1.231348, 0.8853931, -0.851642, 1, 0.7803922, 0, 1,
-1.225434, 0.1254753, -3.287281, 1, 0.7843137, 0, 1,
-1.220263, -0.1623354, -2.386814, 1, 0.7921569, 0, 1,
-1.214985, -0.2242842, -1.13203, 1, 0.7960784, 0, 1,
-1.20591, -0.4302478, -1.492585, 1, 0.8039216, 0, 1,
-1.205419, -1.12637, -2.80769, 1, 0.8117647, 0, 1,
-1.191269, 0.07138666, -1.624977, 1, 0.8156863, 0, 1,
-1.185345, 0.8593659, -1.31053, 1, 0.8235294, 0, 1,
-1.183944, -0.4216284, -1.361156, 1, 0.827451, 0, 1,
-1.17642, -1.916824, -2.711517, 1, 0.8352941, 0, 1,
-1.173152, 0.2855374, 0.1700729, 1, 0.8392157, 0, 1,
-1.172039, -0.8187003, -1.228791, 1, 0.8470588, 0, 1,
-1.169486, 0.04213617, -0.9741314, 1, 0.8509804, 0, 1,
-1.169249, -0.3905382, -2.102136, 1, 0.8588235, 0, 1,
-1.164977, -0.7374989, -2.243193, 1, 0.8627451, 0, 1,
-1.14688, 1.637918, -0.6319939, 1, 0.8705882, 0, 1,
-1.146009, 2.650664, 1.131897, 1, 0.8745098, 0, 1,
-1.139074, -0.1358147, -1.69082, 1, 0.8823529, 0, 1,
-1.136527, -0.596908, -0.9473704, 1, 0.8862745, 0, 1,
-1.123308, -0.3141025, -1.273954, 1, 0.8941177, 0, 1,
-1.121046, 0.6404375, -1.550716, 1, 0.8980392, 0, 1,
-1.11935, -0.4039267, -2.624146, 1, 0.9058824, 0, 1,
-1.118086, 0.8805033, -1.487202, 1, 0.9137255, 0, 1,
-1.101042, 0.6910113, 0.200183, 1, 0.9176471, 0, 1,
-1.098904, 1.266132, -1.249547, 1, 0.9254902, 0, 1,
-1.092413, -0.7406849, -0.7857925, 1, 0.9294118, 0, 1,
-1.086197, 0.2601691, -1.906487, 1, 0.9372549, 0, 1,
-1.084517, 1.373652, -0.0990435, 1, 0.9411765, 0, 1,
-1.069312, 0.9655839, -1.119482, 1, 0.9490196, 0, 1,
-1.064237, 0.2255653, 0.7899731, 1, 0.9529412, 0, 1,
-1.059526, -1.622325, -2.004303, 1, 0.9607843, 0, 1,
-1.059133, 1.06377, -0.5007651, 1, 0.9647059, 0, 1,
-1.047968, -1.128195, -2.854982, 1, 0.972549, 0, 1,
-1.046506, 0.3700313, -1.256953, 1, 0.9764706, 0, 1,
-1.042845, -0.3353897, -2.013661, 1, 0.9843137, 0, 1,
-1.041788, -1.326064, -2.513439, 1, 0.9882353, 0, 1,
-1.034002, 0.9380851, -0.4481477, 1, 0.9960784, 0, 1,
-1.027555, -1.298978, -2.281098, 0.9960784, 1, 0, 1,
-1.016149, -0.6146645, -1.879137, 0.9921569, 1, 0, 1,
-1.012114, -1.087062, -2.542468, 0.9843137, 1, 0, 1,
-1.010332, -1.927734, -4.907912, 0.9803922, 1, 0, 1,
-1.007486, -0.5021731, -1.290756, 0.972549, 1, 0, 1,
-1.001325, 1.49509, 1.286648, 0.9686275, 1, 0, 1,
-1.001276, 2.135567, -0.3034493, 0.9607843, 1, 0, 1,
-1.000904, 0.9205267, -0.6721154, 0.9568627, 1, 0, 1,
-1.000668, 0.1914893, -0.1856545, 0.9490196, 1, 0, 1,
-0.9974385, 0.3204964, 0.1864379, 0.945098, 1, 0, 1,
-0.995463, -0.8095407, -3.28797, 0.9372549, 1, 0, 1,
-0.9945926, 0.9670396, 0.5112575, 0.9333333, 1, 0, 1,
-0.9930536, -1.134312, -2.141132, 0.9254902, 1, 0, 1,
-0.9896696, -0.8962752, -2.573156, 0.9215686, 1, 0, 1,
-0.9861538, -0.3314342, -3.169419, 0.9137255, 1, 0, 1,
-0.9851951, -0.6379933, -1.176237, 0.9098039, 1, 0, 1,
-0.9841465, 0.9984829, -0.8589285, 0.9019608, 1, 0, 1,
-0.9822821, 0.6720222, -1.711399, 0.8941177, 1, 0, 1,
-0.978663, 2.265827, -0.04824002, 0.8901961, 1, 0, 1,
-0.9707379, -0.164441, -2.029295, 0.8823529, 1, 0, 1,
-0.9700041, -1.055642, -1.203855, 0.8784314, 1, 0, 1,
-0.969192, 1.327388, -0.6686106, 0.8705882, 1, 0, 1,
-0.9666478, -0.1586479, -1.800212, 0.8666667, 1, 0, 1,
-0.9639103, -0.6545098, -2.924201, 0.8588235, 1, 0, 1,
-0.9634683, -0.05646852, -3.591199, 0.854902, 1, 0, 1,
-0.9586681, -0.6510313, -1.260537, 0.8470588, 1, 0, 1,
-0.9479309, -1.01898, -0.9688633, 0.8431373, 1, 0, 1,
-0.9476333, 0.2604391, -2.348798, 0.8352941, 1, 0, 1,
-0.9426271, -0.4891748, -2.467137, 0.8313726, 1, 0, 1,
-0.9412773, 1.087523, -3.255983, 0.8235294, 1, 0, 1,
-0.9343884, 0.06202411, -3.449116, 0.8196079, 1, 0, 1,
-0.924125, 1.711723, -0.4851143, 0.8117647, 1, 0, 1,
-0.919255, 0.170056, -1.853181, 0.8078431, 1, 0, 1,
-0.9118719, 0.1741821, -2.509181, 0.8, 1, 0, 1,
-0.9082404, -0.3845384, -1.604535, 0.7921569, 1, 0, 1,
-0.9080445, -0.4558991, -2.909005, 0.7882353, 1, 0, 1,
-0.9078895, -0.3094231, -0.3559876, 0.7803922, 1, 0, 1,
-0.9071021, 0.3004274, -1.537545, 0.7764706, 1, 0, 1,
-0.8991722, 1.238807, -2.113669, 0.7686275, 1, 0, 1,
-0.8944644, 0.3362787, -0.8047538, 0.7647059, 1, 0, 1,
-0.8906893, -0.2460313, -0.9398832, 0.7568628, 1, 0, 1,
-0.8859532, -1.467752, -3.520241, 0.7529412, 1, 0, 1,
-0.8839899, 0.7985872, -0.660723, 0.7450981, 1, 0, 1,
-0.8809473, -0.8343675, -2.036746, 0.7411765, 1, 0, 1,
-0.8791953, -0.2170612, -3.054894, 0.7333333, 1, 0, 1,
-0.8762711, -0.01929954, -1.778567, 0.7294118, 1, 0, 1,
-0.8638058, 1.32526, -0.819487, 0.7215686, 1, 0, 1,
-0.8614756, -1.068796, -2.436607, 0.7176471, 1, 0, 1,
-0.8578958, -1.535249, -1.701022, 0.7098039, 1, 0, 1,
-0.8513361, 0.08695644, -2.441934, 0.7058824, 1, 0, 1,
-0.847631, 1.832957, -1.99456, 0.6980392, 1, 0, 1,
-0.844268, -1.03265, -4.45477, 0.6901961, 1, 0, 1,
-0.8422602, 0.0624194, -3.615963, 0.6862745, 1, 0, 1,
-0.840367, 0.9115366, 0.4191182, 0.6784314, 1, 0, 1,
-0.8391855, -0.9990929, -4.243647, 0.6745098, 1, 0, 1,
-0.8322207, 0.7238603, -0.6055297, 0.6666667, 1, 0, 1,
-0.826869, -0.01410476, -2.094852, 0.6627451, 1, 0, 1,
-0.8268204, -0.08919084, -3.147149, 0.654902, 1, 0, 1,
-0.8224344, 2.600287, -1.156963, 0.6509804, 1, 0, 1,
-0.8212218, -0.08945455, -2.051033, 0.6431373, 1, 0, 1,
-0.8192092, 1.742034, -1.537104, 0.6392157, 1, 0, 1,
-0.8158386, 1.196283, 0.9682689, 0.6313726, 1, 0, 1,
-0.8154492, -1.143305, -4.309896, 0.627451, 1, 0, 1,
-0.8130291, 0.6325642, -2.534421, 0.6196079, 1, 0, 1,
-0.8097577, -0.06024812, -2.211799, 0.6156863, 1, 0, 1,
-0.8093743, -0.03682436, -2.903486, 0.6078432, 1, 0, 1,
-0.7999845, 0.9018895, -1.335799, 0.6039216, 1, 0, 1,
-0.7990414, 0.239123, -1.558765, 0.5960785, 1, 0, 1,
-0.7966896, -1.344796, -2.209482, 0.5882353, 1, 0, 1,
-0.791642, 1.114192, -0.5928076, 0.5843138, 1, 0, 1,
-0.7870734, 0.4557773, -2.314723, 0.5764706, 1, 0, 1,
-0.7866414, -1.247912, -3.062658, 0.572549, 1, 0, 1,
-0.775857, -0.2438423, -0.7732845, 0.5647059, 1, 0, 1,
-0.7727382, 0.8143955, 0.4610193, 0.5607843, 1, 0, 1,
-0.7717137, 0.0951997, -0.847064, 0.5529412, 1, 0, 1,
-0.7717035, -0.3221421, -2.42273, 0.5490196, 1, 0, 1,
-0.7694113, -0.3462555, -0.870332, 0.5411765, 1, 0, 1,
-0.7672948, -1.202466, -2.002479, 0.5372549, 1, 0, 1,
-0.7622635, -1.822398, -3.19632, 0.5294118, 1, 0, 1,
-0.761954, -0.1017705, -1.172241, 0.5254902, 1, 0, 1,
-0.7538862, -0.706967, -1.115274, 0.5176471, 1, 0, 1,
-0.7528154, -0.1428779, -1.905048, 0.5137255, 1, 0, 1,
-0.7520657, 0.2590645, -1.601793, 0.5058824, 1, 0, 1,
-0.7496248, -0.1419543, -2.118614, 0.5019608, 1, 0, 1,
-0.744853, 1.08223, -0.3668526, 0.4941176, 1, 0, 1,
-0.7447032, -0.6634431, -2.724556, 0.4862745, 1, 0, 1,
-0.7440793, -0.7107744, -1.680324, 0.4823529, 1, 0, 1,
-0.735501, -0.4663416, -2.325716, 0.4745098, 1, 0, 1,
-0.7339661, -0.1675538, -0.9175975, 0.4705882, 1, 0, 1,
-0.7334976, -0.7556257, -2.700302, 0.4627451, 1, 0, 1,
-0.7255505, 0.7289385, -0.677869, 0.4588235, 1, 0, 1,
-0.7236879, 0.6680418, -1.583799, 0.4509804, 1, 0, 1,
-0.7231742, -1.194048, -2.859256, 0.4470588, 1, 0, 1,
-0.7206357, -0.9872772, -2.699434, 0.4392157, 1, 0, 1,
-0.7187355, -0.6637919, -2.952363, 0.4352941, 1, 0, 1,
-0.7131436, -1.873798, -2.536207, 0.427451, 1, 0, 1,
-0.7090934, 1.324815, -1.345447, 0.4235294, 1, 0, 1,
-0.6999947, -1.798184, -2.685691, 0.4156863, 1, 0, 1,
-0.6848963, 0.2245143, -2.242313, 0.4117647, 1, 0, 1,
-0.6841687, 0.493687, -2.160093, 0.4039216, 1, 0, 1,
-0.6840602, -0.736702, -3.638888, 0.3960784, 1, 0, 1,
-0.6832525, -0.4970315, -2.020776, 0.3921569, 1, 0, 1,
-0.6818022, -1.156932, -2.884105, 0.3843137, 1, 0, 1,
-0.677518, 1.65932, 1.95631, 0.3803922, 1, 0, 1,
-0.6708581, 0.1316749, -1.087975, 0.372549, 1, 0, 1,
-0.6620819, 0.3022395, 0.6386841, 0.3686275, 1, 0, 1,
-0.6578896, 0.3081751, 0.4744835, 0.3607843, 1, 0, 1,
-0.6509193, 1.761088, -0.4696291, 0.3568628, 1, 0, 1,
-0.650269, 0.5672213, -1.203033, 0.3490196, 1, 0, 1,
-0.6450909, 1.214334, -0.6851327, 0.345098, 1, 0, 1,
-0.6374612, -0.3309826, -1.24551, 0.3372549, 1, 0, 1,
-0.6337773, 0.1739205, -1.159478, 0.3333333, 1, 0, 1,
-0.62658, -0.223835, -3.207893, 0.3254902, 1, 0, 1,
-0.6235502, 0.3735404, -1.059064, 0.3215686, 1, 0, 1,
-0.622448, -1.677922, -2.14192, 0.3137255, 1, 0, 1,
-0.6201842, -0.3715022, -3.181617, 0.3098039, 1, 0, 1,
-0.6183301, 1.121498, -0.2548833, 0.3019608, 1, 0, 1,
-0.6177638, 0.5377953, -0.4308226, 0.2941177, 1, 0, 1,
-0.6166915, -1.253535, -2.16635, 0.2901961, 1, 0, 1,
-0.6166317, -0.8961696, -2.762224, 0.282353, 1, 0, 1,
-0.6160192, 1.399568, 0.3044568, 0.2784314, 1, 0, 1,
-0.6148915, 0.08338182, -2.927931, 0.2705882, 1, 0, 1,
-0.6055024, -0.7742956, -1.460104, 0.2666667, 1, 0, 1,
-0.6036193, -0.3077781, -0.2396667, 0.2588235, 1, 0, 1,
-0.5967665, -1.547908, -3.172937, 0.254902, 1, 0, 1,
-0.5952309, -0.1329656, -2.252154, 0.2470588, 1, 0, 1,
-0.5907067, 0.6821142, 1.024617, 0.2431373, 1, 0, 1,
-0.5903391, 1.099833, -0.3459502, 0.2352941, 1, 0, 1,
-0.5800129, 0.5989072, -0.5438409, 0.2313726, 1, 0, 1,
-0.5753254, 0.4898672, 1.785931, 0.2235294, 1, 0, 1,
-0.5736652, -1.456321, -1.653512, 0.2196078, 1, 0, 1,
-0.5705296, 0.2939038, -2.133554, 0.2117647, 1, 0, 1,
-0.5670985, 0.09255032, -4.227996, 0.2078431, 1, 0, 1,
-0.5668205, -1.568314, -3.073513, 0.2, 1, 0, 1,
-0.5613499, 0.752326, -1.923872, 0.1921569, 1, 0, 1,
-0.5557041, 2.131365, 0.02506511, 0.1882353, 1, 0, 1,
-0.5478744, 2.2451, 2.360345, 0.1803922, 1, 0, 1,
-0.546135, 1.379096, -0.6140211, 0.1764706, 1, 0, 1,
-0.5432143, -0.2933398, -2.362463, 0.1686275, 1, 0, 1,
-0.5397698, -0.01010432, -1.61283, 0.1647059, 1, 0, 1,
-0.5333239, 1.360474, 0.3708194, 0.1568628, 1, 0, 1,
-0.5304039, 0.5553058, -0.9514202, 0.1529412, 1, 0, 1,
-0.5275981, -1.112123, -2.614898, 0.145098, 1, 0, 1,
-0.5269836, 0.4339397, -2.021833, 0.1411765, 1, 0, 1,
-0.5184684, 0.4141975, -0.3084767, 0.1333333, 1, 0, 1,
-0.5178403, 0.1559559, -3.403835, 0.1294118, 1, 0, 1,
-0.5156618, -0.8256233, -1.730276, 0.1215686, 1, 0, 1,
-0.5130666, 0.3648341, -1.387178, 0.1176471, 1, 0, 1,
-0.508898, -0.4303427, -1.635206, 0.1098039, 1, 0, 1,
-0.504998, 0.7028307, -0.02513031, 0.1058824, 1, 0, 1,
-0.50116, 0.4060286, -1.021348, 0.09803922, 1, 0, 1,
-0.4995015, 0.01731896, -2.111068, 0.09019608, 1, 0, 1,
-0.4963992, 0.4258248, -0.465774, 0.08627451, 1, 0, 1,
-0.4864806, -0.00388817, -0.6947656, 0.07843138, 1, 0, 1,
-0.4864595, -0.6200203, -3.067965, 0.07450981, 1, 0, 1,
-0.4852365, -1.612017, -2.960232, 0.06666667, 1, 0, 1,
-0.4836479, -0.1345696, -1.010943, 0.0627451, 1, 0, 1,
-0.4723312, -0.9644352, -2.784783, 0.05490196, 1, 0, 1,
-0.4702769, 0.9430279, 0.2366615, 0.05098039, 1, 0, 1,
-0.4674963, 0.9661338, 0.1954658, 0.04313726, 1, 0, 1,
-0.4664704, 0.9681706, -1.814883, 0.03921569, 1, 0, 1,
-0.4560198, 0.9859474, -0.6322618, 0.03137255, 1, 0, 1,
-0.4540765, -1.690328, -0.8403951, 0.02745098, 1, 0, 1,
-0.4528819, 1.274399, -0.2040536, 0.01960784, 1, 0, 1,
-0.4520968, 0.6140595, 0.1821345, 0.01568628, 1, 0, 1,
-0.4436567, 0.7288048, -2.224966, 0.007843138, 1, 0, 1,
-0.4432658, 1.280712, -2.498159, 0.003921569, 1, 0, 1,
-0.4427862, 0.3115965, -1.668753, 0, 1, 0.003921569, 1,
-0.4413671, 1.251698, -1.875868, 0, 1, 0.01176471, 1,
-0.4381576, -1.182939, -3.132719, 0, 1, 0.01568628, 1,
-0.4353411, 1.11885, 1.14599, 0, 1, 0.02352941, 1,
-0.4324611, -0.208501, -2.395976, 0, 1, 0.02745098, 1,
-0.4305071, 0.7642326, -1.95185, 0, 1, 0.03529412, 1,
-0.4244309, 0.01354723, -0.3991933, 0, 1, 0.03921569, 1,
-0.4215019, -0.1313145, -0.6771339, 0, 1, 0.04705882, 1,
-0.4194398, -1.666738, -3.641769, 0, 1, 0.05098039, 1,
-0.4171563, 1.502715, 0.2377671, 0, 1, 0.05882353, 1,
-0.4142917, -1.753816, -3.082347, 0, 1, 0.0627451, 1,
-0.4104382, 0.09454688, 0.1212742, 0, 1, 0.07058824, 1,
-0.409866, 0.2295574, -2.419312, 0, 1, 0.07450981, 1,
-0.4083521, -0.05123882, -0.6755726, 0, 1, 0.08235294, 1,
-0.4083416, -0.4180264, -3.411079, 0, 1, 0.08627451, 1,
-0.4039183, 2.07825, -0.8070033, 0, 1, 0.09411765, 1,
-0.4039028, -0.6037167, -2.673753, 0, 1, 0.1019608, 1,
-0.4019136, 0.2099476, -0.8924514, 0, 1, 0.1058824, 1,
-0.4006205, -0.8720289, -1.056678, 0, 1, 0.1137255, 1,
-0.4003384, 1.623819, 0.6088448, 0, 1, 0.1176471, 1,
-0.4002763, 1.144951, -1.790569, 0, 1, 0.1254902, 1,
-0.3992595, 0.08950403, 1.3161, 0, 1, 0.1294118, 1,
-0.3922269, -0.8106175, -1.936422, 0, 1, 0.1372549, 1,
-0.3892918, 0.8225108, -1.179501, 0, 1, 0.1411765, 1,
-0.3844579, -1.070744, -2.264952, 0, 1, 0.1490196, 1,
-0.383083, 0.1893005, -0.09349816, 0, 1, 0.1529412, 1,
-0.3816872, 0.3169272, -2.290061, 0, 1, 0.1607843, 1,
-0.3785068, -0.6750056, -3.530288, 0, 1, 0.1647059, 1,
-0.3778374, 0.08650792, -2.563186, 0, 1, 0.172549, 1,
-0.3743375, -1.408561, -2.836112, 0, 1, 0.1764706, 1,
-0.3739581, 0.1478243, -1.267889, 0, 1, 0.1843137, 1,
-0.3718856, -1.277417, -2.616157, 0, 1, 0.1882353, 1,
-0.3679239, -2.01288, -3.032453, 0, 1, 0.1960784, 1,
-0.3652537, 0.8651022, -0.6264514, 0, 1, 0.2039216, 1,
-0.3638078, 0.724322, -0.5362152, 0, 1, 0.2078431, 1,
-0.3604057, -0.8977048, -2.795549, 0, 1, 0.2156863, 1,
-0.359149, -0.3912855, -2.152173, 0, 1, 0.2196078, 1,
-0.3581329, 1.118183, -0.5208943, 0, 1, 0.227451, 1,
-0.3513015, -0.3122596, -0.07540027, 0, 1, 0.2313726, 1,
-0.3508058, 1.049439, 0.2026455, 0, 1, 0.2392157, 1,
-0.3489375, 1.127791, -1.033741, 0, 1, 0.2431373, 1,
-0.3482626, -1.583691, -5.347286, 0, 1, 0.2509804, 1,
-0.3436033, 0.4092509, 0.7039694, 0, 1, 0.254902, 1,
-0.3432394, 0.6617754, -0.0859339, 0, 1, 0.2627451, 1,
-0.3401879, 0.9302365, -0.770276, 0, 1, 0.2666667, 1,
-0.3376468, 0.4843217, 0.4046949, 0, 1, 0.2745098, 1,
-0.3374683, 1.066844, -0.01038028, 0, 1, 0.2784314, 1,
-0.3371195, 0.5413283, -0.3293903, 0, 1, 0.2862745, 1,
-0.3370052, -0.6419731, -3.727763, 0, 1, 0.2901961, 1,
-0.3336201, 1.173038, 0.9098009, 0, 1, 0.2980392, 1,
-0.3324906, 0.4917524, -0.7180865, 0, 1, 0.3058824, 1,
-0.3314567, 1.49382, -1.320308, 0, 1, 0.3098039, 1,
-0.3314399, -2.352422, -3.847645, 0, 1, 0.3176471, 1,
-0.3291988, -0.5187938, -3.352402, 0, 1, 0.3215686, 1,
-0.3270548, -1.193131, -3.212082, 0, 1, 0.3294118, 1,
-0.3268767, 0.6831581, 0.02866069, 0, 1, 0.3333333, 1,
-0.323793, 0.1855166, -0.3025996, 0, 1, 0.3411765, 1,
-0.321645, -0.02756847, -0.309503, 0, 1, 0.345098, 1,
-0.3212121, -1.527333, -2.38362, 0, 1, 0.3529412, 1,
-0.3188496, 0.1422803, -1.880976, 0, 1, 0.3568628, 1,
-0.3123314, 0.5207784, 0.8967489, 0, 1, 0.3647059, 1,
-0.3122316, 1.254236, 1.088478, 0, 1, 0.3686275, 1,
-0.3111465, -0.4473609, -3.188421, 0, 1, 0.3764706, 1,
-0.30937, -1.209564, -2.827271, 0, 1, 0.3803922, 1,
-0.3066716, -0.1679332, -1.178257, 0, 1, 0.3882353, 1,
-0.3065474, 0.6244725, 0.09550091, 0, 1, 0.3921569, 1,
-0.2999024, -0.5139187, -2.71532, 0, 1, 0.4, 1,
-0.2979731, 1.465743, -1.41929, 0, 1, 0.4078431, 1,
-0.2964097, 0.8532141, -0.803361, 0, 1, 0.4117647, 1,
-0.2942966, 1.428644, -1.577259, 0, 1, 0.4196078, 1,
-0.2918081, -0.5654373, -3.717531, 0, 1, 0.4235294, 1,
-0.2871919, 1.064041, -0.5871802, 0, 1, 0.4313726, 1,
-0.2802342, 0.2561249, -1.329991, 0, 1, 0.4352941, 1,
-0.2794271, 1.203535, 0.151507, 0, 1, 0.4431373, 1,
-0.2793407, -1.182404, -3.3613, 0, 1, 0.4470588, 1,
-0.2768009, 0.3097053, -0.7255433, 0, 1, 0.454902, 1,
-0.2758214, 0.8228081, 1.115666, 0, 1, 0.4588235, 1,
-0.2633035, -0.1693315, -1.442065, 0, 1, 0.4666667, 1,
-0.2616019, 2.269056, -0.355177, 0, 1, 0.4705882, 1,
-0.2605275, 0.6090578, -1.121738, 0, 1, 0.4784314, 1,
-0.2573946, 0.4091691, -2.147093, 0, 1, 0.4823529, 1,
-0.2538103, 0.1716547, -1.318532, 0, 1, 0.4901961, 1,
-0.2536767, -0.9450787, -3.217932, 0, 1, 0.4941176, 1,
-0.2510472, -0.6970495, -2.090693, 0, 1, 0.5019608, 1,
-0.2462304, -2.047069, -1.262973, 0, 1, 0.509804, 1,
-0.2363161, -0.06231676, -1.931895, 0, 1, 0.5137255, 1,
-0.2341775, -0.5509731, -4.629929, 0, 1, 0.5215687, 1,
-0.2310491, 0.2758967, -1.458936, 0, 1, 0.5254902, 1,
-0.2262947, 0.8362198, 1.863779, 0, 1, 0.5333334, 1,
-0.2245909, 1.054817, 0.1051266, 0, 1, 0.5372549, 1,
-0.2243846, 1.532645, 0.2648989, 0, 1, 0.5450981, 1,
-0.2234799, -0.3711939, -2.712521, 0, 1, 0.5490196, 1,
-0.2226326, -0.6650282, -3.014539, 0, 1, 0.5568628, 1,
-0.2226291, -2.088679, -1.748034, 0, 1, 0.5607843, 1,
-0.2224086, -0.69456, -1.685547, 0, 1, 0.5686275, 1,
-0.2201703, -1.311689, -2.662788, 0, 1, 0.572549, 1,
-0.2108962, 2.185212, -1.031505, 0, 1, 0.5803922, 1,
-0.2094134, 0.8263558, -0.8095189, 0, 1, 0.5843138, 1,
-0.2058578, -1.246735, -3.059216, 0, 1, 0.5921569, 1,
-0.2051639, 0.8489137, -1.29989, 0, 1, 0.5960785, 1,
-0.2048494, 1.765974, -0.3957042, 0, 1, 0.6039216, 1,
-0.2007328, 1.498853, 1.28702, 0, 1, 0.6117647, 1,
-0.1994272, -0.961704, -5.386374, 0, 1, 0.6156863, 1,
-0.1950338, -0.3934722, -0.6031057, 0, 1, 0.6235294, 1,
-0.1922726, 1.012199, 0.4029426, 0, 1, 0.627451, 1,
-0.1894662, -1.542928, -3.218482, 0, 1, 0.6352941, 1,
-0.1877237, 2.207357, -1.014474, 0, 1, 0.6392157, 1,
-0.1870692, 2.339621, -1.237749, 0, 1, 0.6470588, 1,
-0.1842132, 0.1478154, -1.918785, 0, 1, 0.6509804, 1,
-0.1816843, 0.621979, -1.218242, 0, 1, 0.6588235, 1,
-0.1769535, 0.2909442, -0.9493038, 0, 1, 0.6627451, 1,
-0.1766509, -1.88693, -4.176444, 0, 1, 0.6705883, 1,
-0.176332, 0.7458516, -0.3663147, 0, 1, 0.6745098, 1,
-0.1609474, 0.06294505, 0.2529329, 0, 1, 0.682353, 1,
-0.1602201, -1.013115, -4.188914, 0, 1, 0.6862745, 1,
-0.1566643, -0.8084459, -3.094211, 0, 1, 0.6941177, 1,
-0.1555485, -0.8690059, -3.029075, 0, 1, 0.7019608, 1,
-0.1536212, 0.06936099, -2.122413, 0, 1, 0.7058824, 1,
-0.153388, 0.9519981, 0.1128902, 0, 1, 0.7137255, 1,
-0.1518485, 1.265295, -1.1012, 0, 1, 0.7176471, 1,
-0.1499375, 1.664747, 0.2038776, 0, 1, 0.7254902, 1,
-0.1498252, 1.03363, -0.1202066, 0, 1, 0.7294118, 1,
-0.1478881, -0.6909568, -2.465349, 0, 1, 0.7372549, 1,
-0.1468436, -1.468419, -2.625197, 0, 1, 0.7411765, 1,
-0.1453182, 0.6205232, 5.066918e-05, 0, 1, 0.7490196, 1,
-0.144203, 0.7187079, 1.16988, 0, 1, 0.7529412, 1,
-0.1425894, 2.535945, 0.3258243, 0, 1, 0.7607843, 1,
-0.1412339, 1.246694, -0.04667731, 0, 1, 0.7647059, 1,
-0.1375498, -0.5790437, -2.208091, 0, 1, 0.772549, 1,
-0.1314798, 0.4972949, 1.766153, 0, 1, 0.7764706, 1,
-0.1305721, -1.702894, -2.715068, 0, 1, 0.7843137, 1,
-0.1301104, 1.280607, 0.0533938, 0, 1, 0.7882353, 1,
-0.1279133, 0.1823745, -1.435066, 0, 1, 0.7960784, 1,
-0.1265479, 1.039847, 0.8145922, 0, 1, 0.8039216, 1,
-0.1205045, 1.183727, 0.3851931, 0, 1, 0.8078431, 1,
-0.1095425, -0.958223, -3.908669, 0, 1, 0.8156863, 1,
-0.1089414, 0.7866784, 0.1019959, 0, 1, 0.8196079, 1,
-0.1060629, 0.7265548, -0.4774434, 0, 1, 0.827451, 1,
-0.1035778, -0.6214762, -3.584333, 0, 1, 0.8313726, 1,
-0.1022697, -0.0626743, -2.337767, 0, 1, 0.8392157, 1,
-0.1016013, 0.05561532, -1.20378, 0, 1, 0.8431373, 1,
-0.09924023, 1.159397, -0.4185408, 0, 1, 0.8509804, 1,
-0.096999, 0.3193094, 0.2287758, 0, 1, 0.854902, 1,
-0.09306867, 0.4207889, 1.749933, 0, 1, 0.8627451, 1,
-0.09185757, -0.5251187, -1.091351, 0, 1, 0.8666667, 1,
-0.09082484, -1.119511, -5.074015, 0, 1, 0.8745098, 1,
-0.08865687, 0.6073969, 0.5239689, 0, 1, 0.8784314, 1,
-0.08795577, -0.499387, -3.132015, 0, 1, 0.8862745, 1,
-0.08580869, 0.1038426, -0.7587103, 0, 1, 0.8901961, 1,
-0.08448274, -1.175962, -3.801937, 0, 1, 0.8980392, 1,
-0.08303875, -1.458477, -2.858967, 0, 1, 0.9058824, 1,
-0.08298693, 2.198289, -0.1358059, 0, 1, 0.9098039, 1,
-0.0824691, -0.9087284, -1.748341, 0, 1, 0.9176471, 1,
-0.07874691, 1.00046, 0.1262463, 0, 1, 0.9215686, 1,
-0.07787725, 2.050446, 0.3578533, 0, 1, 0.9294118, 1,
-0.07706102, 1.666273, 0.9013542, 0, 1, 0.9333333, 1,
-0.07608084, -0.767227, -2.771962, 0, 1, 0.9411765, 1,
-0.07574717, 1.163845, -0.9278226, 0, 1, 0.945098, 1,
-0.07277001, 2.551964, 0.4367636, 0, 1, 0.9529412, 1,
-0.07197723, -0.3014425, -4.065555, 0, 1, 0.9568627, 1,
-0.07112429, -0.4200628, -3.805221, 0, 1, 0.9647059, 1,
-0.07111023, -1.400662, -3.610037, 0, 1, 0.9686275, 1,
-0.06909765, 1.013087, -1.82011, 0, 1, 0.9764706, 1,
-0.06721981, 0.880249, 0.01836169, 0, 1, 0.9803922, 1,
-0.06554274, -1.413288, -3.886667, 0, 1, 0.9882353, 1,
-0.06485283, -1.029923, -4.237086, 0, 1, 0.9921569, 1,
-0.06424193, 0.9544256, 0.6083888, 0, 1, 1, 1,
-0.06330894, 0.4234676, 0.06419007, 0, 0.9921569, 1, 1,
-0.05943263, 1.369698, 0.5155275, 0, 0.9882353, 1, 1,
-0.05561174, -1.354634, -3.992826, 0, 0.9803922, 1, 1,
-0.05385118, 1.12777, -2.896956, 0, 0.9764706, 1, 1,
-0.05343641, 0.5297725, -0.6374085, 0, 0.9686275, 1, 1,
-0.04756787, -0.9761017, -2.7133, 0, 0.9647059, 1, 1,
-0.04612777, -1.155799, -3.995113, 0, 0.9568627, 1, 1,
-0.04265344, 0.776836, -0.7319465, 0, 0.9529412, 1, 1,
-0.03834631, 0.6928598, -1.453502, 0, 0.945098, 1, 1,
-0.03748896, 0.6353739, 2.657073, 0, 0.9411765, 1, 1,
-0.03606676, -0.005182927, -0.5837924, 0, 0.9333333, 1, 1,
-0.03345948, 0.5102507, -0.6707212, 0, 0.9294118, 1, 1,
-0.03342982, -0.2568114, -3.369551, 0, 0.9215686, 1, 1,
-0.03070426, 1.285803, -0.9277126, 0, 0.9176471, 1, 1,
-0.02131604, 0.2272629, 0.6785296, 0, 0.9098039, 1, 1,
-0.01808139, -0.2766636, -3.636541, 0, 0.9058824, 1, 1,
-0.01584839, 0.2972251, -1.65744, 0, 0.8980392, 1, 1,
-0.01328905, -0.5541645, -2.856532, 0, 0.8901961, 1, 1,
-0.01290188, 0.0546932, -1.771698, 0, 0.8862745, 1, 1,
-0.006238297, 0.1496135, 1.806873, 0, 0.8784314, 1, 1,
-0.005741111, 0.1367759, -0.8409619, 0, 0.8745098, 1, 1,
-0.004859637, -0.6667991, -3.805569, 0, 0.8666667, 1, 1,
-0.002942106, -0.5798704, -2.951337, 0, 0.8627451, 1, 1,
-0.002367114, -0.01600813, -2.8726, 0, 0.854902, 1, 1,
0.003797764, -0.5919771, 1.736089, 0, 0.8509804, 1, 1,
0.004274088, 2.008015, 0.210898, 0, 0.8431373, 1, 1,
0.004505062, 0.4822308, 0.2193228, 0, 0.8392157, 1, 1,
0.004588811, 0.1310544, 1.275563, 0, 0.8313726, 1, 1,
0.00549008, 0.2214787, -0.1584132, 0, 0.827451, 1, 1,
0.006941828, 0.8414613, -0.1297257, 0, 0.8196079, 1, 1,
0.01091783, -0.1091773, 4.597678, 0, 0.8156863, 1, 1,
0.011416, -1.317607, 3.865969, 0, 0.8078431, 1, 1,
0.02093198, -0.2424345, 2.581602, 0, 0.8039216, 1, 1,
0.02768484, -1.509737, 1.698579, 0, 0.7960784, 1, 1,
0.03009743, 0.5165792, -0.3257422, 0, 0.7882353, 1, 1,
0.03206008, -0.6300334, 1.558929, 0, 0.7843137, 1, 1,
0.03568735, 0.7420635, 0.06876822, 0, 0.7764706, 1, 1,
0.03679393, -0.6187014, 2.484915, 0, 0.772549, 1, 1,
0.03719978, -0.4585868, 3.061793, 0, 0.7647059, 1, 1,
0.04040574, 0.7277593, -1.73061, 0, 0.7607843, 1, 1,
0.04068329, -2.248986, 3.694236, 0, 0.7529412, 1, 1,
0.04287539, 0.6045901, -0.1054576, 0, 0.7490196, 1, 1,
0.04637845, -0.3657746, 4.716594, 0, 0.7411765, 1, 1,
0.04663187, -0.7320385, 2.068373, 0, 0.7372549, 1, 1,
0.04757362, -0.2050743, 2.302069, 0, 0.7294118, 1, 1,
0.04938367, -0.3897021, 2.60813, 0, 0.7254902, 1, 1,
0.05105975, -0.6345642, 2.201461, 0, 0.7176471, 1, 1,
0.05129004, 0.4246085, 0.3085737, 0, 0.7137255, 1, 1,
0.05518718, 1.073518, 2.152996, 0, 0.7058824, 1, 1,
0.059085, -0.1521204, 2.686744, 0, 0.6980392, 1, 1,
0.06048402, 1.380226, 1.683482, 0, 0.6941177, 1, 1,
0.06232971, 0.3538635, -2.111239, 0, 0.6862745, 1, 1,
0.06267654, -0.9883897, 1.844932, 0, 0.682353, 1, 1,
0.0661436, 0.4907972, -0.1106009, 0, 0.6745098, 1, 1,
0.07230915, -0.5665728, 2.652331, 0, 0.6705883, 1, 1,
0.07384551, 0.5628068, 0.2792472, 0, 0.6627451, 1, 1,
0.07634736, -1.581377, 3.233949, 0, 0.6588235, 1, 1,
0.08047843, -0.2464387, 4.498024, 0, 0.6509804, 1, 1,
0.08233839, 0.4677715, 0.9729752, 0, 0.6470588, 1, 1,
0.08266822, 1.166472, 0.3025542, 0, 0.6392157, 1, 1,
0.08738061, 0.07005861, -0.09063372, 0, 0.6352941, 1, 1,
0.08742525, -0.4421545, 3.927263, 0, 0.627451, 1, 1,
0.09157671, 0.7977304, -0.1129232, 0, 0.6235294, 1, 1,
0.09229334, 0.3500208, -0.8429974, 0, 0.6156863, 1, 1,
0.09495998, 1.508452, 1.09307, 0, 0.6117647, 1, 1,
0.09530552, 0.4960677, -1.374059, 0, 0.6039216, 1, 1,
0.09541854, -1.129176, 2.738458, 0, 0.5960785, 1, 1,
0.09605794, -1.871038, 2.358548, 0, 0.5921569, 1, 1,
0.1055727, -0.2198163, 3.447379, 0, 0.5843138, 1, 1,
0.1100241, -0.6735674, 4.086265, 0, 0.5803922, 1, 1,
0.1100552, -0.3934612, 3.627057, 0, 0.572549, 1, 1,
0.1116065, -0.718605, 3.583355, 0, 0.5686275, 1, 1,
0.1121072, -0.1497374, 1.396677, 0, 0.5607843, 1, 1,
0.1173433, -0.3451232, 3.12521, 0, 0.5568628, 1, 1,
0.1194184, 0.8148594, -1.153514, 0, 0.5490196, 1, 1,
0.1243403, 1.767438, -0.6653459, 0, 0.5450981, 1, 1,
0.130307, 0.4479178, 1.54051, 0, 0.5372549, 1, 1,
0.1312283, 2.015869, 0.4855065, 0, 0.5333334, 1, 1,
0.1342965, 0.489074, 2.661621, 0, 0.5254902, 1, 1,
0.1346733, 0.527262, 1.454446, 0, 0.5215687, 1, 1,
0.1354181, 1.343813, -0.4981261, 0, 0.5137255, 1, 1,
0.1361504, 0.01818284, 1.907799, 0, 0.509804, 1, 1,
0.1417284, 0.1887283, 1.579189, 0, 0.5019608, 1, 1,
0.144142, 0.4228661, -1.154868, 0, 0.4941176, 1, 1,
0.145506, 0.5464164, 0.8510608, 0, 0.4901961, 1, 1,
0.1476541, 0.1385537, 1.98671, 0, 0.4823529, 1, 1,
0.1482422, 1.039199, 0.05514329, 0, 0.4784314, 1, 1,
0.1514932, -0.7117007, 3.120611, 0, 0.4705882, 1, 1,
0.15255, -0.993822, 2.687821, 0, 0.4666667, 1, 1,
0.1577596, 1.613787, -0.09415016, 0, 0.4588235, 1, 1,
0.1595715, 0.7016429, 0.9188657, 0, 0.454902, 1, 1,
0.1628864, -0.08647038, 1.582222, 0, 0.4470588, 1, 1,
0.1660464, 0.01445341, 3.1301, 0, 0.4431373, 1, 1,
0.1675561, 0.576847, 0.7803184, 0, 0.4352941, 1, 1,
0.1697473, 1.49508, -0.4451619, 0, 0.4313726, 1, 1,
0.1697986, 2.087277, -0.8398383, 0, 0.4235294, 1, 1,
0.1722464, -0.1167994, 2.788661, 0, 0.4196078, 1, 1,
0.1758756, -2.155816, 2.363098, 0, 0.4117647, 1, 1,
0.1781535, -0.3545061, 1.567955, 0, 0.4078431, 1, 1,
0.1805847, 0.2340658, -0.322369, 0, 0.4, 1, 1,
0.183272, 1.591526, 0.5682358, 0, 0.3921569, 1, 1,
0.1846141, -0.2015096, 1.562307, 0, 0.3882353, 1, 1,
0.1871126, 0.5378247, 0.5660396, 0, 0.3803922, 1, 1,
0.1953586, 0.006827796, 0.7098989, 0, 0.3764706, 1, 1,
0.2004628, -1.289228, 2.230214, 0, 0.3686275, 1, 1,
0.2009861, -0.2866774, 3.343439, 0, 0.3647059, 1, 1,
0.2035308, 0.5280402, -0.1307548, 0, 0.3568628, 1, 1,
0.2046563, 0.09661876, -0.9239287, 0, 0.3529412, 1, 1,
0.2093494, -1.355801, 4.875625, 0, 0.345098, 1, 1,
0.2098066, 0.8286986, 0.9094412, 0, 0.3411765, 1, 1,
0.21066, -1.371738, 3.025425, 0, 0.3333333, 1, 1,
0.2128026, 0.5980719, 0.1531139, 0, 0.3294118, 1, 1,
0.217435, 0.7266753, 0.2502467, 0, 0.3215686, 1, 1,
0.2204265, 0.67758, -0.2471707, 0, 0.3176471, 1, 1,
0.2213021, -0.1023268, 0.980703, 0, 0.3098039, 1, 1,
0.2230309, -0.1278939, 2.837521, 0, 0.3058824, 1, 1,
0.2311529, 2.514107, -0.9985184, 0, 0.2980392, 1, 1,
0.2341009, 0.4966179, 0.1892385, 0, 0.2901961, 1, 1,
0.2368204, 0.3884744, 0.9465212, 0, 0.2862745, 1, 1,
0.2438329, 0.6710301, -0.155617, 0, 0.2784314, 1, 1,
0.244156, 0.4450648, 0.3400573, 0, 0.2745098, 1, 1,
0.2458314, 0.2050207, 0.8207217, 0, 0.2666667, 1, 1,
0.2471365, -1.014021, 3.864897, 0, 0.2627451, 1, 1,
0.2483082, 0.4000044, 1.743408, 0, 0.254902, 1, 1,
0.2494594, 0.06923348, 1.468418, 0, 0.2509804, 1, 1,
0.2514129, -1.472239, 2.590287, 0, 0.2431373, 1, 1,
0.2528479, 0.415619, 0.6426173, 0, 0.2392157, 1, 1,
0.2539119, 0.1429842, 0.5680172, 0, 0.2313726, 1, 1,
0.2558936, 0.09545507, 1.628217, 0, 0.227451, 1, 1,
0.2638451, -0.5390307, 1.783701, 0, 0.2196078, 1, 1,
0.2731307, 0.4277779, -1.175012, 0, 0.2156863, 1, 1,
0.2731583, -1.753359, 2.831124, 0, 0.2078431, 1, 1,
0.2765654, 0.5444402, 1.480169, 0, 0.2039216, 1, 1,
0.2791631, -1.128851, 1.267028, 0, 0.1960784, 1, 1,
0.2796922, 1.186617, -0.2305733, 0, 0.1882353, 1, 1,
0.2837661, 1.368082, 2.054753, 0, 0.1843137, 1, 1,
0.2847212, 1.781488, 1.897944, 0, 0.1764706, 1, 1,
0.290356, -1.099629, 3.868481, 0, 0.172549, 1, 1,
0.295553, 1.037745, 0.05538317, 0, 0.1647059, 1, 1,
0.2996743, 0.6855829, 1.047547, 0, 0.1607843, 1, 1,
0.3141353, -0.0337458, 2.729564, 0, 0.1529412, 1, 1,
0.3146282, 0.3143321, 0.8896211, 0, 0.1490196, 1, 1,
0.3157088, -0.4327164, 0.8526902, 0, 0.1411765, 1, 1,
0.3162682, 1.867638, 1.795815, 0, 0.1372549, 1, 1,
0.3209022, -1.518873, 2.54472, 0, 0.1294118, 1, 1,
0.321836, -0.6635802, 4.198949, 0, 0.1254902, 1, 1,
0.3220997, -0.3561679, 0.4379112, 0, 0.1176471, 1, 1,
0.3370175, 1.474305, -1.176419, 0, 0.1137255, 1, 1,
0.3412452, 1.698102, 1.186994, 0, 0.1058824, 1, 1,
0.3426266, 0.3110019, 0.6576271, 0, 0.09803922, 1, 1,
0.3430074, -0.9297085, 1.554069, 0, 0.09411765, 1, 1,
0.3439466, -2.891359, 3.297055, 0, 0.08627451, 1, 1,
0.3457573, -1.062409, 2.992698, 0, 0.08235294, 1, 1,
0.3477651, 1.272507, -0.4840724, 0, 0.07450981, 1, 1,
0.3486376, 0.913425, -0.3361943, 0, 0.07058824, 1, 1,
0.3550793, 0.9010072, 1.924689, 0, 0.0627451, 1, 1,
0.3601581, 1.121868, 0.03085566, 0, 0.05882353, 1, 1,
0.368841, 0.1366775, 1.36741, 0, 0.05098039, 1, 1,
0.3710866, -0.2833388, 2.314952, 0, 0.04705882, 1, 1,
0.3734673, 0.3232281, 0.251178, 0, 0.03921569, 1, 1,
0.3738887, -1.028926, 3.888197, 0, 0.03529412, 1, 1,
0.3746696, -0.3250907, 2.61252, 0, 0.02745098, 1, 1,
0.3761073, -0.1215248, 1.801054, 0, 0.02352941, 1, 1,
0.3776818, -1.003703, 1.773043, 0, 0.01568628, 1, 1,
0.3802853, 0.03007251, 0.8970781, 0, 0.01176471, 1, 1,
0.3855318, -1.120185, 0.2303826, 0, 0.003921569, 1, 1,
0.3856123, -0.01250436, 1.088508, 0.003921569, 0, 1, 1,
0.387376, 0.5740781, 1.54498, 0.007843138, 0, 1, 1,
0.3928373, -1.02233, 3.624135, 0.01568628, 0, 1, 1,
0.3929656, 0.6714454, 0.9323562, 0.01960784, 0, 1, 1,
0.3933963, 0.07020821, 0.5485771, 0.02745098, 0, 1, 1,
0.398925, -1.719233, 2.44216, 0.03137255, 0, 1, 1,
0.4011169, -0.2190032, 1.526947, 0.03921569, 0, 1, 1,
0.4041503, -0.3136376, 4.742013, 0.04313726, 0, 1, 1,
0.4052574, 0.81675, -0.1407878, 0.05098039, 0, 1, 1,
0.4068107, -0.0379817, 3.91617, 0.05490196, 0, 1, 1,
0.4095415, -0.8387654, 2.530074, 0.0627451, 0, 1, 1,
0.4105967, 0.6904358, 1.806264, 0.06666667, 0, 1, 1,
0.4114842, 0.4549605, -0.02422106, 0.07450981, 0, 1, 1,
0.4116471, 0.6029066, 0.637875, 0.07843138, 0, 1, 1,
0.4179676, 0.3831509, 0.3387768, 0.08627451, 0, 1, 1,
0.4186086, -0.1249849, 2.476294, 0.09019608, 0, 1, 1,
0.4186328, 1.677192, 1.189259, 0.09803922, 0, 1, 1,
0.419247, -0.01101142, 1.714125, 0.1058824, 0, 1, 1,
0.4202464, -1.141037, 2.744661, 0.1098039, 0, 1, 1,
0.421571, 0.6191546, -0.06120226, 0.1176471, 0, 1, 1,
0.4262562, -0.9458596, 2.123003, 0.1215686, 0, 1, 1,
0.4271296, -0.8499206, 3.132411, 0.1294118, 0, 1, 1,
0.4275271, -1.100475, 3.694156, 0.1333333, 0, 1, 1,
0.4275672, 0.1718901, 1.729008, 0.1411765, 0, 1, 1,
0.4329103, -0.8461856, 1.788118, 0.145098, 0, 1, 1,
0.4354313, 0.6561767, -0.0662884, 0.1529412, 0, 1, 1,
0.4366369, -0.3976557, 2.376061, 0.1568628, 0, 1, 1,
0.4386658, 1.878177, -0.7631218, 0.1647059, 0, 1, 1,
0.4396073, 0.5675763, -0.00621017, 0.1686275, 0, 1, 1,
0.4397493, -1.058867, 2.815372, 0.1764706, 0, 1, 1,
0.4449668, -0.4064635, 2.378881, 0.1803922, 0, 1, 1,
0.4463475, 0.3015534, -0.7326977, 0.1882353, 0, 1, 1,
0.4484588, 1.360613, 0.9318844, 0.1921569, 0, 1, 1,
0.4509892, 0.4251766, 1.393605, 0.2, 0, 1, 1,
0.4525704, -0.3586479, 1.7581, 0.2078431, 0, 1, 1,
0.4553702, -0.03465776, 2.149937, 0.2117647, 0, 1, 1,
0.4571646, 0.6238083, 0.7654812, 0.2196078, 0, 1, 1,
0.4588401, 0.907023, 1.305717, 0.2235294, 0, 1, 1,
0.459365, 0.1155094, 1.576711, 0.2313726, 0, 1, 1,
0.4616478, 0.7589949, 1.014242, 0.2352941, 0, 1, 1,
0.4627285, 0.02801043, 0.1679619, 0.2431373, 0, 1, 1,
0.4650565, 0.2127323, 2.409222, 0.2470588, 0, 1, 1,
0.4660922, -0.3165642, 1.545081, 0.254902, 0, 1, 1,
0.4722398, 0.316847, 1.093846, 0.2588235, 0, 1, 1,
0.473119, -1.315551, 2.998533, 0.2666667, 0, 1, 1,
0.4740329, 0.2665339, 2.025295, 0.2705882, 0, 1, 1,
0.4810793, -0.2559639, 2.653589, 0.2784314, 0, 1, 1,
0.4834781, -0.5463234, 3.104085, 0.282353, 0, 1, 1,
0.4865445, 1.932024, 1.039506, 0.2901961, 0, 1, 1,
0.4885395, 0.6519483, 0.06929952, 0.2941177, 0, 1, 1,
0.496989, -2.398621, 4.887931, 0.3019608, 0, 1, 1,
0.4970832, 2.298428, -0.505829, 0.3098039, 0, 1, 1,
0.498548, 0.6185055, 0.9182496, 0.3137255, 0, 1, 1,
0.503611, 0.2868739, -0.4180116, 0.3215686, 0, 1, 1,
0.5040024, 0.8013264, 0.7632634, 0.3254902, 0, 1, 1,
0.5103256, 0.4059955, 1.618257, 0.3333333, 0, 1, 1,
0.5141849, -0.1815925, 1.500123, 0.3372549, 0, 1, 1,
0.515443, 0.9262045, 0.0587474, 0.345098, 0, 1, 1,
0.5190887, 2.212842, -0.1025997, 0.3490196, 0, 1, 1,
0.5269922, 0.8834125, 1.452395, 0.3568628, 0, 1, 1,
0.5299725, -0.6352905, 3.70162, 0.3607843, 0, 1, 1,
0.5336712, -0.4609441, 2.582615, 0.3686275, 0, 1, 1,
0.5362336, 0.4217922, -0.739335, 0.372549, 0, 1, 1,
0.5363785, 0.4777128, 2.394916, 0.3803922, 0, 1, 1,
0.5367948, 1.667085, 1.536377, 0.3843137, 0, 1, 1,
0.5401251, 1.424999, 0.4788446, 0.3921569, 0, 1, 1,
0.5440246, -1.069658, 2.33776, 0.3960784, 0, 1, 1,
0.5447551, 1.957062, -0.9296986, 0.4039216, 0, 1, 1,
0.5467085, -0.09119862, 2.402836, 0.4117647, 0, 1, 1,
0.5550933, -0.1340894, 3.267302, 0.4156863, 0, 1, 1,
0.5554932, -0.9072971, 0.7077742, 0.4235294, 0, 1, 1,
0.5562917, 0.1546989, 0.5074751, 0.427451, 0, 1, 1,
0.5565581, 0.1156293, 3.874295, 0.4352941, 0, 1, 1,
0.5569215, -1.462911, 2.815704, 0.4392157, 0, 1, 1,
0.558836, 0.2550478, -0.03088401, 0.4470588, 0, 1, 1,
0.5628848, -0.158309, 2.393562, 0.4509804, 0, 1, 1,
0.5689502, 2.227032, 1.143697, 0.4588235, 0, 1, 1,
0.5732383, 1.375074, 0.5491251, 0.4627451, 0, 1, 1,
0.5732728, 0.1041492, 2.04986, 0.4705882, 0, 1, 1,
0.5763072, -1.295662, 3.557873, 0.4745098, 0, 1, 1,
0.577769, -0.2983913, 1.220093, 0.4823529, 0, 1, 1,
0.5783674, 0.4684997, 1.901428, 0.4862745, 0, 1, 1,
0.5788168, -1.089704, 1.38365, 0.4941176, 0, 1, 1,
0.578901, -1.171188, 3.327339, 0.5019608, 0, 1, 1,
0.5793275, -1.144291, 0.9637538, 0.5058824, 0, 1, 1,
0.5833589, 0.06621204, 1.454042, 0.5137255, 0, 1, 1,
0.592051, 0.4810067, -0.7784708, 0.5176471, 0, 1, 1,
0.5926237, -0.7354155, 0.7656839, 0.5254902, 0, 1, 1,
0.5927242, -1.680377, 2.773264, 0.5294118, 0, 1, 1,
0.595368, -0.3073978, 3.318238, 0.5372549, 0, 1, 1,
0.595582, 0.5823097, -1.226298, 0.5411765, 0, 1, 1,
0.5974557, 0.4788836, -0.2173164, 0.5490196, 0, 1, 1,
0.6003885, 1.351898, 2.045474, 0.5529412, 0, 1, 1,
0.6022261, 0.7848036, 0.7406703, 0.5607843, 0, 1, 1,
0.6038496, 0.2262376, 1.959454, 0.5647059, 0, 1, 1,
0.6040931, 0.8064982, -0.4666279, 0.572549, 0, 1, 1,
0.6041116, -1.222699, 1.404123, 0.5764706, 0, 1, 1,
0.6061313, 0.7872916, 0.07877972, 0.5843138, 0, 1, 1,
0.6064358, 1.146369, 0.5162672, 0.5882353, 0, 1, 1,
0.6070891, 1.306605, 1.805928, 0.5960785, 0, 1, 1,
0.6101367, 0.386206, 0.3694268, 0.6039216, 0, 1, 1,
0.6170259, 1.424699, 2.157379, 0.6078432, 0, 1, 1,
0.6200641, -1.101761, 1.595505, 0.6156863, 0, 1, 1,
0.6242698, -0.9159558, 3.392932, 0.6196079, 0, 1, 1,
0.6304914, 1.046139, 0.7568159, 0.627451, 0, 1, 1,
0.631253, 1.554025, -0.3918568, 0.6313726, 0, 1, 1,
0.6331829, -1.712498, 2.215112, 0.6392157, 0, 1, 1,
0.6376119, 0.7092624, -0.3979597, 0.6431373, 0, 1, 1,
0.6384931, -0.1519185, 3.963132, 0.6509804, 0, 1, 1,
0.6387482, -0.02031841, 0.8660315, 0.654902, 0, 1, 1,
0.6399893, -0.7467179, 1.939704, 0.6627451, 0, 1, 1,
0.6422353, 0.8967243, 0.5361951, 0.6666667, 0, 1, 1,
0.643475, 0.5876042, -1.363031, 0.6745098, 0, 1, 1,
0.6453467, -0.7723387, 2.79768, 0.6784314, 0, 1, 1,
0.6457675, 0.5495777, 1.38737, 0.6862745, 0, 1, 1,
0.6515526, -0.8614255, 2.471945, 0.6901961, 0, 1, 1,
0.6608991, -0.2961789, 2.56696, 0.6980392, 0, 1, 1,
0.6679325, 0.09770133, 1.951517, 0.7058824, 0, 1, 1,
0.6713917, -0.79129, 3.148277, 0.7098039, 0, 1, 1,
0.6725344, 0.6193385, 2.613496, 0.7176471, 0, 1, 1,
0.6796956, 1.558298, 1.269386, 0.7215686, 0, 1, 1,
0.6820403, 1.264504, 0.3548994, 0.7294118, 0, 1, 1,
0.6824504, -0.9129403, 3.456814, 0.7333333, 0, 1, 1,
0.6845924, 0.8421479, 1.690669, 0.7411765, 0, 1, 1,
0.6892392, -0.3487414, 2.928719, 0.7450981, 0, 1, 1,
0.6904843, -0.7957944, 1.733027, 0.7529412, 0, 1, 1,
0.6912372, 0.8284466, -0.02343051, 0.7568628, 0, 1, 1,
0.697781, 1.331959, 1.698009, 0.7647059, 0, 1, 1,
0.7000889, 0.1588111, 1.29867, 0.7686275, 0, 1, 1,
0.7011303, -1.406032, 2.861332, 0.7764706, 0, 1, 1,
0.7029957, -0.4713308, 1.203984, 0.7803922, 0, 1, 1,
0.7077813, 0.5267466, -1.010373, 0.7882353, 0, 1, 1,
0.7190875, 0.1501783, 2.712397, 0.7921569, 0, 1, 1,
0.724135, -1.097709, 1.65293, 0.8, 0, 1, 1,
0.7342815, 1.544001, -0.2951426, 0.8078431, 0, 1, 1,
0.7371374, 1.20568, -0.7668014, 0.8117647, 0, 1, 1,
0.7466747, 0.3066597, 2.926875, 0.8196079, 0, 1, 1,
0.7510211, -1.069003, 2.840021, 0.8235294, 0, 1, 1,
0.7557932, 0.3993614, 1.40326, 0.8313726, 0, 1, 1,
0.7611188, -0.4013236, 3.279449, 0.8352941, 0, 1, 1,
0.7640954, -0.8707511, 1.890794, 0.8431373, 0, 1, 1,
0.7657766, -0.1707319, 1.079156, 0.8470588, 0, 1, 1,
0.7689303, 0.1762845, 1.354483, 0.854902, 0, 1, 1,
0.7703295, -1.431782, 1.957296, 0.8588235, 0, 1, 1,
0.7749701, 0.283583, 2.898553, 0.8666667, 0, 1, 1,
0.7781675, 2.59074, -0.8206586, 0.8705882, 0, 1, 1,
0.7787947, 0.1601042, 0.3024755, 0.8784314, 0, 1, 1,
0.7815629, 0.2534062, 0.09963191, 0.8823529, 0, 1, 1,
0.7892632, 1.331088, 1.361678, 0.8901961, 0, 1, 1,
0.7930164, -0.3483178, 0.3574249, 0.8941177, 0, 1, 1,
0.7948402, -0.7069257, 2.65799, 0.9019608, 0, 1, 1,
0.7967906, -0.2601982, -0.1155518, 0.9098039, 0, 1, 1,
0.7990837, 0.3266694, 3.407894, 0.9137255, 0, 1, 1,
0.80209, -2.184414, 3.728599, 0.9215686, 0, 1, 1,
0.8078057, 0.8886561, -1.025982, 0.9254902, 0, 1, 1,
0.8082606, -0.943818, 0.8859214, 0.9333333, 0, 1, 1,
0.8083507, 0.2399812, 1.112594, 0.9372549, 0, 1, 1,
0.8102774, -0.2411556, 3.143994, 0.945098, 0, 1, 1,
0.810987, 0.1866792, 2.122299, 0.9490196, 0, 1, 1,
0.8163471, -0.2990453, 1.949974, 0.9568627, 0, 1, 1,
0.8176953, -0.8789132, 2.36484, 0.9607843, 0, 1, 1,
0.8186072, 0.5946916, 2.026957, 0.9686275, 0, 1, 1,
0.8192283, 0.4567856, -0.7884714, 0.972549, 0, 1, 1,
0.8259404, 0.2190028, 1.352061, 0.9803922, 0, 1, 1,
0.8294201, 0.453842, 0.8978686, 0.9843137, 0, 1, 1,
0.8371832, 0.7128215, 0.5087566, 0.9921569, 0, 1, 1,
0.8399711, 1.025619, 0.7575553, 0.9960784, 0, 1, 1,
0.8402739, 1.001385, 1.933311, 1, 0, 0.9960784, 1,
0.8428025, 0.01797654, 2.804105, 1, 0, 0.9882353, 1,
0.8459931, 1.016368, 0.01649854, 1, 0, 0.9843137, 1,
0.8506366, 0.6821168, -1.059168, 1, 0, 0.9764706, 1,
0.8533146, 1.158509, -0.01245408, 1, 0, 0.972549, 1,
0.8626369, -1.058607, 1.87695, 1, 0, 0.9647059, 1,
0.863192, 0.4738233, 0.2390805, 1, 0, 0.9607843, 1,
0.8681262, 0.3752044, 1.189254, 1, 0, 0.9529412, 1,
0.8773245, -0.7351752, 3.867845, 1, 0, 0.9490196, 1,
0.890056, -0.08847837, 2.844105, 1, 0, 0.9411765, 1,
0.8902975, 0.8171372, -0.1898779, 1, 0, 0.9372549, 1,
0.8977274, 0.7384084, 2.406437, 1, 0, 0.9294118, 1,
0.9022784, 1.356246, -0.6110216, 1, 0, 0.9254902, 1,
0.9126733, 0.3379281, 2.338383, 1, 0, 0.9176471, 1,
0.9128547, -1.016479, 1.36278, 1, 0, 0.9137255, 1,
0.9178765, -0.9161189, 2.408508, 1, 0, 0.9058824, 1,
0.9219142, 0.4386432, 1.362191, 1, 0, 0.9019608, 1,
0.9240359, 0.2437095, 0.5196904, 1, 0, 0.8941177, 1,
0.9254394, -1.091906, 3.988701, 1, 0, 0.8862745, 1,
0.9260429, 0.5642297, 0.308769, 1, 0, 0.8823529, 1,
0.9306484, -1.724422, 1.836223, 1, 0, 0.8745098, 1,
0.9346567, 0.5268275, 2.278863, 1, 0, 0.8705882, 1,
0.9628274, -0.6230399, 1.68753, 1, 0, 0.8627451, 1,
0.9632164, 1.585819, -0.09968457, 1, 0, 0.8588235, 1,
0.9638841, 0.05817273, 0.8080743, 1, 0, 0.8509804, 1,
0.9722044, -0.7914408, 2.499656, 1, 0, 0.8470588, 1,
0.9736645, -0.2911392, 1.980854, 1, 0, 0.8392157, 1,
0.9802138, -0.1725166, 1.030455, 1, 0, 0.8352941, 1,
0.9811705, 0.3368855, 2.478777, 1, 0, 0.827451, 1,
0.9867822, -0.7201281, -0.2984667, 1, 0, 0.8235294, 1,
0.9877831, 0.6615895, 0.4217721, 1, 0, 0.8156863, 1,
0.9931762, 0.9531907, 0.1659529, 1, 0, 0.8117647, 1,
1.000894, 0.7693307, 1.438874, 1, 0, 0.8039216, 1,
1.013248, 2.436187, 1.112783, 1, 0, 0.7960784, 1,
1.016449, 1.046096, 2.040959, 1, 0, 0.7921569, 1,
1.026638, -0.5009907, 2.060943, 1, 0, 0.7843137, 1,
1.0402, 0.2267741, 1.812439, 1, 0, 0.7803922, 1,
1.04025, 1.828252, 0.290252, 1, 0, 0.772549, 1,
1.041846, -0.9580234, 1.236271, 1, 0, 0.7686275, 1,
1.044677, -1.892817, 4.071717, 1, 0, 0.7607843, 1,
1.049844, -2.086546, 3.188454, 1, 0, 0.7568628, 1,
1.051207, -1.073561, 2.11975, 1, 0, 0.7490196, 1,
1.062594, 0.05132614, 1.04839, 1, 0, 0.7450981, 1,
1.066949, -0.8674728, 1.361406, 1, 0, 0.7372549, 1,
1.069878, -0.2829406, 2.027285, 1, 0, 0.7333333, 1,
1.072463, -2.072545, 3.190883, 1, 0, 0.7254902, 1,
1.090885, 0.9031053, 2.030923, 1, 0, 0.7215686, 1,
1.094262, -0.5708903, 1.62908, 1, 0, 0.7137255, 1,
1.102565, -0.3841197, 1.575618, 1, 0, 0.7098039, 1,
1.104649, -1.35544, 2.196675, 1, 0, 0.7019608, 1,
1.118335, 0.3812741, 1.364894, 1, 0, 0.6941177, 1,
1.126009, 0.7530822, 1.838111, 1, 0, 0.6901961, 1,
1.138676, 0.9603693, -0.946718, 1, 0, 0.682353, 1,
1.140959, -0.5554969, 1.373893, 1, 0, 0.6784314, 1,
1.141276, -1.609395, 2.421326, 1, 0, 0.6705883, 1,
1.142205, 0.9770716, 1.012327, 1, 0, 0.6666667, 1,
1.144079, -0.5692127, 3.086917, 1, 0, 0.6588235, 1,
1.150038, -1.102847, 3.321815, 1, 0, 0.654902, 1,
1.156939, -0.1227512, -0.2384702, 1, 0, 0.6470588, 1,
1.164668, 0.4275658, 0.4422412, 1, 0, 0.6431373, 1,
1.171455, -1.983794, 2.368234, 1, 0, 0.6352941, 1,
1.174805, -0.7353154, 4.431866, 1, 0, 0.6313726, 1,
1.181384, -1.003887, 1.967788, 1, 0, 0.6235294, 1,
1.198316, -1.178062, 1.912537, 1, 0, 0.6196079, 1,
1.204944, -0.7529167, 2.956136, 1, 0, 0.6117647, 1,
1.208492, 0.45877, 2.845614, 1, 0, 0.6078432, 1,
1.209372, -0.6355645, 2.356594, 1, 0, 0.6, 1,
1.224319, -1.37566, 2.031837, 1, 0, 0.5921569, 1,
1.226433, 1.869801, 0.7563093, 1, 0, 0.5882353, 1,
1.229678, 1.361496, -0.4958282, 1, 0, 0.5803922, 1,
1.230916, -1.781439, 1.745261, 1, 0, 0.5764706, 1,
1.236398, -0.233632, 0.5054757, 1, 0, 0.5686275, 1,
1.240521, 1.612385, 0.000619602, 1, 0, 0.5647059, 1,
1.242824, -0.651167, 3.494404, 1, 0, 0.5568628, 1,
1.249614, -1.077793, 1.252054, 1, 0, 0.5529412, 1,
1.251596, -1.283703, 1.612632, 1, 0, 0.5450981, 1,
1.268633, -0.6958607, 1.951903, 1, 0, 0.5411765, 1,
1.272342, -0.7681296, 1.458807, 1, 0, 0.5333334, 1,
1.292745, -1.490584, 3.086749, 1, 0, 0.5294118, 1,
1.302209, -3.264994, 3.51049, 1, 0, 0.5215687, 1,
1.305496, -0.1541592, 2.869549, 1, 0, 0.5176471, 1,
1.310234, 0.7009293, 0.0508585, 1, 0, 0.509804, 1,
1.322678, 1.178434, 0.2581535, 1, 0, 0.5058824, 1,
1.329087, -0.5646566, 1.827076, 1, 0, 0.4980392, 1,
1.329936, 0.4070885, 1.438168, 1, 0, 0.4901961, 1,
1.337919, 0.7183892, 1.493397, 1, 0, 0.4862745, 1,
1.349403, -0.899278, 2.455084, 1, 0, 0.4784314, 1,
1.3547, 0.2741889, 1.249099, 1, 0, 0.4745098, 1,
1.357225, 0.5023338, 2.25074, 1, 0, 0.4666667, 1,
1.359932, -0.5853068, 3.974159, 1, 0, 0.4627451, 1,
1.363716, -0.7513175, 2.32387, 1, 0, 0.454902, 1,
1.367264, -0.9934193, 3.253953, 1, 0, 0.4509804, 1,
1.368663, 0.970886, 0.5126066, 1, 0, 0.4431373, 1,
1.376057, 0.3997418, 1.066674, 1, 0, 0.4392157, 1,
1.376327, 0.8633456, 0.4831004, 1, 0, 0.4313726, 1,
1.378152, -1.332772, 2.222564, 1, 0, 0.427451, 1,
1.396109, 0.4380474, 3.1125, 1, 0, 0.4196078, 1,
1.397075, 1.068246, 0.4834607, 1, 0, 0.4156863, 1,
1.40475, 1.01974, -0.451603, 1, 0, 0.4078431, 1,
1.410483, -0.8627858, 0.666154, 1, 0, 0.4039216, 1,
1.42454, -0.06540801, 1.484235, 1, 0, 0.3960784, 1,
1.425778, 0.5881184, 1.271415, 1, 0, 0.3882353, 1,
1.427131, -0.01612629, 0.9513466, 1, 0, 0.3843137, 1,
1.436191, -0.9537911, 1.840164, 1, 0, 0.3764706, 1,
1.437352, 0.1532448, -0.5176539, 1, 0, 0.372549, 1,
1.438985, -0.6115709, 1.801994, 1, 0, 0.3647059, 1,
1.443583, 0.8643916, -1.423727, 1, 0, 0.3607843, 1,
1.445473, -1.312576, 2.241421, 1, 0, 0.3529412, 1,
1.460268, 0.7426947, 0.933251, 1, 0, 0.3490196, 1,
1.465927, 0.452546, 1.836114, 1, 0, 0.3411765, 1,
1.468494, 1.355274, 1.478108, 1, 0, 0.3372549, 1,
1.480804, 0.2835251, 2.109229, 1, 0, 0.3294118, 1,
1.482218, 0.6674714, 0.4720192, 1, 0, 0.3254902, 1,
1.517491, -0.7587628, 2.973867, 1, 0, 0.3176471, 1,
1.520039, -0.8351263, 1.294997, 1, 0, 0.3137255, 1,
1.527088, -1.087889, 0.934782, 1, 0, 0.3058824, 1,
1.54623, 1.319256, 1.178691, 1, 0, 0.2980392, 1,
1.548304, -0.06054897, 0.7063571, 1, 0, 0.2941177, 1,
1.549984, 1.300611, 1.669634, 1, 0, 0.2862745, 1,
1.56497, 1.258044, 1.697593, 1, 0, 0.282353, 1,
1.58259, -0.02129153, 1.578363, 1, 0, 0.2745098, 1,
1.598215, 1.555754, -1.55694, 1, 0, 0.2705882, 1,
1.60896, -0.01536498, 2.16323, 1, 0, 0.2627451, 1,
1.612452, -0.4903239, 0.7878047, 1, 0, 0.2588235, 1,
1.621178, -0.2856968, 2.256688, 1, 0, 0.2509804, 1,
1.651129, 0.141391, 2.416106, 1, 0, 0.2470588, 1,
1.66025, 0.7933766, -0.07392558, 1, 0, 0.2392157, 1,
1.693402, 0.1212212, 0.7299126, 1, 0, 0.2352941, 1,
1.701307, -1.166004, 0.7964467, 1, 0, 0.227451, 1,
1.703696, 0.1191955, 2.091986, 1, 0, 0.2235294, 1,
1.717862, -0.1808871, 0.9807546, 1, 0, 0.2156863, 1,
1.749627, 1.713337, 0.7042968, 1, 0, 0.2117647, 1,
1.759901, -1.40062, 3.496214, 1, 0, 0.2039216, 1,
1.776338, -0.3010117, 3.479189, 1, 0, 0.1960784, 1,
1.784986, -1.415494, 2.788079, 1, 0, 0.1921569, 1,
1.786901, 0.3765491, -0.4092427, 1, 0, 0.1843137, 1,
1.792995, -0.2285258, 0.6538932, 1, 0, 0.1803922, 1,
1.815951, -0.3077933, 1.4196, 1, 0, 0.172549, 1,
1.842049, 1.870984, 1.208894, 1, 0, 0.1686275, 1,
1.845306, 0.3145159, 0.580586, 1, 0, 0.1607843, 1,
1.863446, -0.05246131, 2.661576, 1, 0, 0.1568628, 1,
1.869517, 0.3851036, -0.347461, 1, 0, 0.1490196, 1,
1.896356, -0.08478456, -0.58095, 1, 0, 0.145098, 1,
1.927105, -0.1766617, 1.152782, 1, 0, 0.1372549, 1,
1.951092, 0.2366026, 3.547163, 1, 0, 0.1333333, 1,
1.952739, 0.2177349, 2.18487, 1, 0, 0.1254902, 1,
1.97478, 0.4482969, 1.973845, 1, 0, 0.1215686, 1,
2.001079, 0.03941587, 1.276622, 1, 0, 0.1137255, 1,
2.009488, -0.8733287, 1.782843, 1, 0, 0.1098039, 1,
2.059202, 0.7367473, 0.5349623, 1, 0, 0.1019608, 1,
2.066332, -0.248533, 1.674767, 1, 0, 0.09411765, 1,
2.089227, 2.200449, 1.2944, 1, 0, 0.09019608, 1,
2.119409, 0.9581624, 1.064773, 1, 0, 0.08235294, 1,
2.170575, 1.33032, 0.4941184, 1, 0, 0.07843138, 1,
2.204988, -0.1076262, 0.4608994, 1, 0, 0.07058824, 1,
2.241684, -0.7312072, 3.282774, 1, 0, 0.06666667, 1,
2.276522, -0.3512357, 1.036001, 1, 0, 0.05882353, 1,
2.296958, -0.4099458, 1.485358, 1, 0, 0.05490196, 1,
2.403922, 1.969837, 0.7932562, 1, 0, 0.04705882, 1,
2.411228, 0.002966757, 0.2107525, 1, 0, 0.04313726, 1,
2.46345, 0.4838623, 0.8833267, 1, 0, 0.03529412, 1,
2.480212, 0.4487019, 0.6921172, 1, 0, 0.03137255, 1,
2.48818, -0.9946406, 2.202079, 1, 0, 0.02352941, 1,
2.574224, 0.2438271, 2.76505, 1, 0, 0.01960784, 1,
2.758797, -0.7369004, 4.537293, 1, 0, 0.01176471, 1,
2.973554, 0.5705305, 0.2769762, 1, 0, 0.007843138, 1
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
-0.1205359, -4.267698, -7.127869, 0, -0.5, 0.5, 0.5,
-0.1205359, -4.267698, -7.127869, 1, -0.5, 0.5, 0.5,
-0.1205359, -4.267698, -7.127869, 1, 1.5, 0.5, 0.5,
-0.1205359, -4.267698, -7.127869, 0, 1.5, 0.5, 0.5
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
-4.263523, -0.307165, -7.127869, 0, -0.5, 0.5, 0.5,
-4.263523, -0.307165, -7.127869, 1, -0.5, 0.5, 0.5,
-4.263523, -0.307165, -7.127869, 1, 1.5, 0.5, 0.5,
-4.263523, -0.307165, -7.127869, 0, 1.5, 0.5, 0.5
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
-4.263523, -4.267698, -0.2492216, 0, -0.5, 0.5, 0.5,
-4.263523, -4.267698, -0.2492216, 1, -0.5, 0.5, 0.5,
-4.263523, -4.267698, -0.2492216, 1, 1.5, 0.5, 0.5,
-4.263523, -4.267698, -0.2492216, 0, 1.5, 0.5, 0.5
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
-3, -3.353729, -5.540489,
2, -3.353729, -5.540489,
-3, -3.353729, -5.540489,
-3, -3.506057, -5.805052,
-2, -3.353729, -5.540489,
-2, -3.506057, -5.805052,
-1, -3.353729, -5.540489,
-1, -3.506057, -5.805052,
0, -3.353729, -5.540489,
0, -3.506057, -5.805052,
1, -3.353729, -5.540489,
1, -3.506057, -5.805052,
2, -3.353729, -5.540489,
2, -3.506057, -5.805052
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
-3, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
-3, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
-3, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
-3, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5,
-2, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
-2, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
-2, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
-2, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5,
-1, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
-1, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
-1, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
-1, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5,
0, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
0, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
0, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
0, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5,
1, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
1, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
1, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
1, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5,
2, -3.810713, -6.334179, 0, -0.5, 0.5, 0.5,
2, -3.810713, -6.334179, 1, -0.5, 0.5, 0.5,
2, -3.810713, -6.334179, 1, 1.5, 0.5, 0.5,
2, -3.810713, -6.334179, 0, 1.5, 0.5, 0.5
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
-3.307449, -3, -5.540489,
-3.307449, 2, -5.540489,
-3.307449, -3, -5.540489,
-3.466794, -3, -5.805052,
-3.307449, -2, -5.540489,
-3.466794, -2, -5.805052,
-3.307449, -1, -5.540489,
-3.466794, -1, -5.805052,
-3.307449, 0, -5.540489,
-3.466794, 0, -5.805052,
-3.307449, 1, -5.540489,
-3.466794, 1, -5.805052,
-3.307449, 2, -5.540489,
-3.466794, 2, -5.805052
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
-3.785486, -3, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, -3, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, -3, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, -3, -6.334179, 0, 1.5, 0.5, 0.5,
-3.785486, -2, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, -2, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, -2, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, -2, -6.334179, 0, 1.5, 0.5, 0.5,
-3.785486, -1, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, -1, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, -1, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, -1, -6.334179, 0, 1.5, 0.5, 0.5,
-3.785486, 0, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, 0, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, 0, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, 0, -6.334179, 0, 1.5, 0.5, 0.5,
-3.785486, 1, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, 1, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, 1, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, 1, -6.334179, 0, 1.5, 0.5, 0.5,
-3.785486, 2, -6.334179, 0, -0.5, 0.5, 0.5,
-3.785486, 2, -6.334179, 1, -0.5, 0.5, 0.5,
-3.785486, 2, -6.334179, 1, 1.5, 0.5, 0.5,
-3.785486, 2, -6.334179, 0, 1.5, 0.5, 0.5
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
-3.307449, -3.353729, -4,
-3.307449, -3.353729, 4,
-3.307449, -3.353729, -4,
-3.466794, -3.506057, -4,
-3.307449, -3.353729, -2,
-3.466794, -3.506057, -2,
-3.307449, -3.353729, 0,
-3.466794, -3.506057, 0,
-3.307449, -3.353729, 2,
-3.466794, -3.506057, 2,
-3.307449, -3.353729, 4,
-3.466794, -3.506057, 4
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
-3.785486, -3.810713, -4, 0, -0.5, 0.5, 0.5,
-3.785486, -3.810713, -4, 1, -0.5, 0.5, 0.5,
-3.785486, -3.810713, -4, 1, 1.5, 0.5, 0.5,
-3.785486, -3.810713, -4, 0, 1.5, 0.5, 0.5,
-3.785486, -3.810713, -2, 0, -0.5, 0.5, 0.5,
-3.785486, -3.810713, -2, 1, -0.5, 0.5, 0.5,
-3.785486, -3.810713, -2, 1, 1.5, 0.5, 0.5,
-3.785486, -3.810713, -2, 0, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 0, 0, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 0, 1, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 0, 1, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 0, 0, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 2, 0, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 2, 1, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 2, 1, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 2, 0, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 4, 0, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 4, 1, -0.5, 0.5, 0.5,
-3.785486, -3.810713, 4, 1, 1.5, 0.5, 0.5,
-3.785486, -3.810713, 4, 0, 1.5, 0.5, 0.5
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
-3.307449, -3.353729, -5.540489,
-3.307449, 2.739399, -5.540489,
-3.307449, -3.353729, 5.042046,
-3.307449, 2.739399, 5.042046,
-3.307449, -3.353729, -5.540489,
-3.307449, -3.353729, 5.042046,
-3.307449, 2.739399, -5.540489,
-3.307449, 2.739399, 5.042046,
-3.307449, -3.353729, -5.540489,
3.066377, -3.353729, -5.540489,
-3.307449, -3.353729, 5.042046,
3.066377, -3.353729, 5.042046,
-3.307449, 2.739399, -5.540489,
3.066377, 2.739399, -5.540489,
-3.307449, 2.739399, 5.042046,
3.066377, 2.739399, 5.042046,
3.066377, -3.353729, -5.540489,
3.066377, 2.739399, -5.540489,
3.066377, -3.353729, 5.042046,
3.066377, 2.739399, 5.042046,
3.066377, -3.353729, -5.540489,
3.066377, -3.353729, 5.042046,
3.066377, 2.739399, -5.540489,
3.066377, 2.739399, 5.042046
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
var radius = 7.355414;
var distance = 32.72507;
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
mvMatrix.translate( 0.1205359, 0.307165, 0.2492216 );
mvMatrix.scale( 1.24773, 1.305211, 0.751504 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.72507);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
(carboxymethylamino)<-read.table("(carboxymethylamino).xyz", skip=1)
```

```
## Error in (carboxymethylamino) <- read.table("(carboxymethylamino).xyz", : object 'carboxymethylamino' not found
```

```r
x<-(carboxymethylamino)$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxymethylamino' not found
```

```r
y<-(carboxymethylamino)$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxymethylamino' not found
```

```r
z<-(carboxymethylamino)$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxymethylamino' not found
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
-3.214626, 0.2697749, -0.5156612, 0, 0, 1, 1, 1,
-2.991301, 0.04055937, -1.996899, 1, 0, 0, 1, 1,
-2.91022, 0.991098, -2.855441, 1, 0, 0, 1, 1,
-2.72671, -0.4649173, -3.113564, 1, 0, 0, 1, 1,
-2.596126, -0.1423736, -1.51542, 1, 0, 0, 1, 1,
-2.524374, -1.064116, -1.075245, 1, 0, 0, 1, 1,
-2.458208, 0.3986567, -2.428683, 0, 0, 0, 1, 1,
-2.320047, -0.6415753, 0.5309997, 0, 0, 0, 1, 1,
-2.31933, 0.7717443, -2.849829, 0, 0, 0, 1, 1,
-2.306599, -0.04014717, -0.3262487, 0, 0, 0, 1, 1,
-2.262695, -0.1902636, -0.8996582, 0, 0, 0, 1, 1,
-2.256361, 1.182287, -1.506031, 0, 0, 0, 1, 1,
-2.254645, 0.469552, -0.4428124, 0, 0, 0, 1, 1,
-2.183878, -0.8690042, -1.747527, 1, 1, 1, 1, 1,
-2.172218, 0.1511648, -1.521094, 1, 1, 1, 1, 1,
-2.17091, 1.208229, -2.283467, 1, 1, 1, 1, 1,
-2.146682, 0.8819816, 0.246124, 1, 1, 1, 1, 1,
-2.133234, 2.058336, -1.470731, 1, 1, 1, 1, 1,
-2.107847, -1.510456, -2.919862, 1, 1, 1, 1, 1,
-2.068393, -0.7276996, -0.981057, 1, 1, 1, 1, 1,
-2.038506, -0.5714489, -3.769689, 1, 1, 1, 1, 1,
-2.02388, -0.08053964, -1.905232, 1, 1, 1, 1, 1,
-1.989791, 1.020947, -3.624805, 1, 1, 1, 1, 1,
-1.986589, -0.177819, -2.383807, 1, 1, 1, 1, 1,
-1.959702, -1.13383, -1.159874, 1, 1, 1, 1, 1,
-1.938727, -0.2216191, -3.687428, 1, 1, 1, 1, 1,
-1.913187, 1.188251, -1.416217, 1, 1, 1, 1, 1,
-1.900858, -0.667556, -2.635933, 1, 1, 1, 1, 1,
-1.899431, 0.2024557, -1.984434, 0, 0, 1, 1, 1,
-1.890413, 1.471255, -0.4219539, 1, 0, 0, 1, 1,
-1.880448, -0.1644933, 0.01185634, 1, 0, 0, 1, 1,
-1.872179, -1.645192, -2.063533, 1, 0, 0, 1, 1,
-1.869953, 0.5818963, -1.256127, 1, 0, 0, 1, 1,
-1.849976, -0.6262121, -1.614763, 1, 0, 0, 1, 1,
-1.84555, -1.142137, -0.8080027, 0, 0, 0, 1, 1,
-1.844414, -0.2705433, -3.568825, 0, 0, 0, 1, 1,
-1.84431, 0.4913656, -1.302284, 0, 0, 0, 1, 1,
-1.833234, 0.5629289, -0.8188255, 0, 0, 0, 1, 1,
-1.825968, 1.04415, -0.7472422, 0, 0, 0, 1, 1,
-1.824891, -1.294223, -2.322521, 0, 0, 0, 1, 1,
-1.819188, -1.200707, -2.512478, 0, 0, 0, 1, 1,
-1.812484, 0.4315822, -1.459594, 1, 1, 1, 1, 1,
-1.811868, -2.634172, -5.288004, 1, 1, 1, 1, 1,
-1.808342, -0.1941069, -1.681209, 1, 1, 1, 1, 1,
-1.801831, -0.2364997, -1.514766, 1, 1, 1, 1, 1,
-1.79193, 1.108347, 0.02446144, 1, 1, 1, 1, 1,
-1.786359, 0.6885791, -0.9459661, 1, 1, 1, 1, 1,
-1.779701, 0.6989466, 1.168594, 1, 1, 1, 1, 1,
-1.745426, -0.2957259, -0.1814209, 1, 1, 1, 1, 1,
-1.734893, -0.2324237, 0.1395966, 1, 1, 1, 1, 1,
-1.71121, 2.158789, -1.759059, 1, 1, 1, 1, 1,
-1.709242, -0.04855302, -0.7287742, 1, 1, 1, 1, 1,
-1.695924, -0.4201699, -2.182347, 1, 1, 1, 1, 1,
-1.685627, -0.1426217, -0.570832, 1, 1, 1, 1, 1,
-1.667527, 0.7181886, 0.3369852, 1, 1, 1, 1, 1,
-1.667525, -0.9510534, -1.209916, 1, 1, 1, 1, 1,
-1.663118, -1.619778, -5.126918, 0, 0, 1, 1, 1,
-1.662183, -0.7929054, -1.194423, 1, 0, 0, 1, 1,
-1.648183, 0.9396918, -2.138108, 1, 0, 0, 1, 1,
-1.642558, -0.1354681, -2.11539, 1, 0, 0, 1, 1,
-1.626156, 0.3839968, -2.153829, 1, 0, 0, 1, 1,
-1.624875, -0.9555705, -0.5026232, 1, 0, 0, 1, 1,
-1.611371, 0.2965444, -1.01587, 0, 0, 0, 1, 1,
-1.598718, 1.445108, -1.3277, 0, 0, 0, 1, 1,
-1.588634, 1.357426, 0.1481483, 0, 0, 0, 1, 1,
-1.580835, -0.005894923, -3.158494, 0, 0, 0, 1, 1,
-1.576328, 0.1082807, -1.8848, 0, 0, 0, 1, 1,
-1.562139, 0.5726711, -1.050002, 0, 0, 0, 1, 1,
-1.562043, 0.5760225, -2.346797, 0, 0, 0, 1, 1,
-1.557804, 0.1721786, -2.250896, 1, 1, 1, 1, 1,
-1.557516, 0.3267657, -3.164621, 1, 1, 1, 1, 1,
-1.554028, 0.2939131, -1.261514, 1, 1, 1, 1, 1,
-1.54346, -0.4350243, -2.072856, 1, 1, 1, 1, 1,
-1.540982, -0.5190894, -3.638873, 1, 1, 1, 1, 1,
-1.534854, -1.805106, -3.731572, 1, 1, 1, 1, 1,
-1.533884, -1.443085, -1.327935, 1, 1, 1, 1, 1,
-1.515044, 1.787366, 0.1799755, 1, 1, 1, 1, 1,
-1.503217, 1.473791, -0.4514844, 1, 1, 1, 1, 1,
-1.499809, 0.5800799, -0.6401945, 1, 1, 1, 1, 1,
-1.493431, -0.9524038, -2.09577, 1, 1, 1, 1, 1,
-1.491093, 1.094095, -0.3788151, 1, 1, 1, 1, 1,
-1.483538, 0.6273129, -0.4628112, 1, 1, 1, 1, 1,
-1.483522, -1.121166, -1.833948, 1, 1, 1, 1, 1,
-1.471227, 0.2541804, -3.189199, 1, 1, 1, 1, 1,
-1.461067, 0.2666313, -0.3433701, 0, 0, 1, 1, 1,
-1.453376, 0.1560301, -0.638262, 1, 0, 0, 1, 1,
-1.450558, -0.134711, -2.059426, 1, 0, 0, 1, 1,
-1.447631, 0.4805804, 0.03647227, 1, 0, 0, 1, 1,
-1.438896, 0.9278655, 0.1979899, 1, 0, 0, 1, 1,
-1.43676, -1.286858, -1.096944, 1, 0, 0, 1, 1,
-1.426294, -0.8818837, -3.521043, 0, 0, 0, 1, 1,
-1.405768, -0.350522, -3.484376, 0, 0, 0, 1, 1,
-1.392693, -0.1114438, -1.997148, 0, 0, 0, 1, 1,
-1.391299, 0.3418484, -0.3052382, 0, 0, 0, 1, 1,
-1.389202, -0.8169417, -4.839697, 0, 0, 0, 1, 1,
-1.384543, 1.318816, -0.8606595, 0, 0, 0, 1, 1,
-1.377219, -0.7870566, -0.6104446, 0, 0, 0, 1, 1,
-1.373666, 1.648127, -1.40289, 1, 1, 1, 1, 1,
-1.369913, 1.20827, -0.671753, 1, 1, 1, 1, 1,
-1.369609, 0.2002024, -1.963421, 1, 1, 1, 1, 1,
-1.367172, 0.4028457, -2.50702, 1, 1, 1, 1, 1,
-1.359538, -0.03839898, -1.118509, 1, 1, 1, 1, 1,
-1.359164, -0.3146693, -1.460224, 1, 1, 1, 1, 1,
-1.355041, -1.499293, -0.8470892, 1, 1, 1, 1, 1,
-1.352475, -1.735886, -2.425104, 1, 1, 1, 1, 1,
-1.33312, -0.5177594, -1.573917, 1, 1, 1, 1, 1,
-1.326448, 0.4263483, -0.08018741, 1, 1, 1, 1, 1,
-1.325813, 1.479659, 0.869348, 1, 1, 1, 1, 1,
-1.321721, -0.8684568, -3.491816, 1, 1, 1, 1, 1,
-1.316528, -0.03504832, -2.310242, 1, 1, 1, 1, 1,
-1.313579, 1.66398, -1.531254, 1, 1, 1, 1, 1,
-1.311697, -0.8626064, -0.6119096, 1, 1, 1, 1, 1,
-1.309765, -0.3439668, -2.956536, 0, 0, 1, 1, 1,
-1.307713, -0.3294436, -2.404662, 1, 0, 0, 1, 1,
-1.307441, -0.2683553, -2.117741, 1, 0, 0, 1, 1,
-1.306643, -1.717154, -2.487255, 1, 0, 0, 1, 1,
-1.305428, 1.539198, -0.6552513, 1, 0, 0, 1, 1,
-1.289, -0.7451034, -1.245734, 1, 0, 0, 1, 1,
-1.272362, 0.09638935, -2.203139, 0, 0, 0, 1, 1,
-1.270359, -1.136956, -1.703652, 0, 0, 0, 1, 1,
-1.266411, -1.887212, -1.562075, 0, 0, 0, 1, 1,
-1.261545, -0.2270002, -2.258733, 0, 0, 0, 1, 1,
-1.258681, 0.3526068, -1.264027, 0, 0, 0, 1, 1,
-1.257537, 0.6472909, -2.047582, 0, 0, 0, 1, 1,
-1.257491, 2.276572, -2.22142, 0, 0, 0, 1, 1,
-1.25485, -0.4411569, -0.9941485, 1, 1, 1, 1, 1,
-1.250389, 1.019788, -0.2940116, 1, 1, 1, 1, 1,
-1.24835, -0.05605059, -1.124167, 1, 1, 1, 1, 1,
-1.243877, 1.788957, 0.1675895, 1, 1, 1, 1, 1,
-1.234946, -0.5249316, -2.219539, 1, 1, 1, 1, 1,
-1.231348, 0.8853931, -0.851642, 1, 1, 1, 1, 1,
-1.225434, 0.1254753, -3.287281, 1, 1, 1, 1, 1,
-1.220263, -0.1623354, -2.386814, 1, 1, 1, 1, 1,
-1.214985, -0.2242842, -1.13203, 1, 1, 1, 1, 1,
-1.20591, -0.4302478, -1.492585, 1, 1, 1, 1, 1,
-1.205419, -1.12637, -2.80769, 1, 1, 1, 1, 1,
-1.191269, 0.07138666, -1.624977, 1, 1, 1, 1, 1,
-1.185345, 0.8593659, -1.31053, 1, 1, 1, 1, 1,
-1.183944, -0.4216284, -1.361156, 1, 1, 1, 1, 1,
-1.17642, -1.916824, -2.711517, 1, 1, 1, 1, 1,
-1.173152, 0.2855374, 0.1700729, 0, 0, 1, 1, 1,
-1.172039, -0.8187003, -1.228791, 1, 0, 0, 1, 1,
-1.169486, 0.04213617, -0.9741314, 1, 0, 0, 1, 1,
-1.169249, -0.3905382, -2.102136, 1, 0, 0, 1, 1,
-1.164977, -0.7374989, -2.243193, 1, 0, 0, 1, 1,
-1.14688, 1.637918, -0.6319939, 1, 0, 0, 1, 1,
-1.146009, 2.650664, 1.131897, 0, 0, 0, 1, 1,
-1.139074, -0.1358147, -1.69082, 0, 0, 0, 1, 1,
-1.136527, -0.596908, -0.9473704, 0, 0, 0, 1, 1,
-1.123308, -0.3141025, -1.273954, 0, 0, 0, 1, 1,
-1.121046, 0.6404375, -1.550716, 0, 0, 0, 1, 1,
-1.11935, -0.4039267, -2.624146, 0, 0, 0, 1, 1,
-1.118086, 0.8805033, -1.487202, 0, 0, 0, 1, 1,
-1.101042, 0.6910113, 0.200183, 1, 1, 1, 1, 1,
-1.098904, 1.266132, -1.249547, 1, 1, 1, 1, 1,
-1.092413, -0.7406849, -0.7857925, 1, 1, 1, 1, 1,
-1.086197, 0.2601691, -1.906487, 1, 1, 1, 1, 1,
-1.084517, 1.373652, -0.0990435, 1, 1, 1, 1, 1,
-1.069312, 0.9655839, -1.119482, 1, 1, 1, 1, 1,
-1.064237, 0.2255653, 0.7899731, 1, 1, 1, 1, 1,
-1.059526, -1.622325, -2.004303, 1, 1, 1, 1, 1,
-1.059133, 1.06377, -0.5007651, 1, 1, 1, 1, 1,
-1.047968, -1.128195, -2.854982, 1, 1, 1, 1, 1,
-1.046506, 0.3700313, -1.256953, 1, 1, 1, 1, 1,
-1.042845, -0.3353897, -2.013661, 1, 1, 1, 1, 1,
-1.041788, -1.326064, -2.513439, 1, 1, 1, 1, 1,
-1.034002, 0.9380851, -0.4481477, 1, 1, 1, 1, 1,
-1.027555, -1.298978, -2.281098, 1, 1, 1, 1, 1,
-1.016149, -0.6146645, -1.879137, 0, 0, 1, 1, 1,
-1.012114, -1.087062, -2.542468, 1, 0, 0, 1, 1,
-1.010332, -1.927734, -4.907912, 1, 0, 0, 1, 1,
-1.007486, -0.5021731, -1.290756, 1, 0, 0, 1, 1,
-1.001325, 1.49509, 1.286648, 1, 0, 0, 1, 1,
-1.001276, 2.135567, -0.3034493, 1, 0, 0, 1, 1,
-1.000904, 0.9205267, -0.6721154, 0, 0, 0, 1, 1,
-1.000668, 0.1914893, -0.1856545, 0, 0, 0, 1, 1,
-0.9974385, 0.3204964, 0.1864379, 0, 0, 0, 1, 1,
-0.995463, -0.8095407, -3.28797, 0, 0, 0, 1, 1,
-0.9945926, 0.9670396, 0.5112575, 0, 0, 0, 1, 1,
-0.9930536, -1.134312, -2.141132, 0, 0, 0, 1, 1,
-0.9896696, -0.8962752, -2.573156, 0, 0, 0, 1, 1,
-0.9861538, -0.3314342, -3.169419, 1, 1, 1, 1, 1,
-0.9851951, -0.6379933, -1.176237, 1, 1, 1, 1, 1,
-0.9841465, 0.9984829, -0.8589285, 1, 1, 1, 1, 1,
-0.9822821, 0.6720222, -1.711399, 1, 1, 1, 1, 1,
-0.978663, 2.265827, -0.04824002, 1, 1, 1, 1, 1,
-0.9707379, -0.164441, -2.029295, 1, 1, 1, 1, 1,
-0.9700041, -1.055642, -1.203855, 1, 1, 1, 1, 1,
-0.969192, 1.327388, -0.6686106, 1, 1, 1, 1, 1,
-0.9666478, -0.1586479, -1.800212, 1, 1, 1, 1, 1,
-0.9639103, -0.6545098, -2.924201, 1, 1, 1, 1, 1,
-0.9634683, -0.05646852, -3.591199, 1, 1, 1, 1, 1,
-0.9586681, -0.6510313, -1.260537, 1, 1, 1, 1, 1,
-0.9479309, -1.01898, -0.9688633, 1, 1, 1, 1, 1,
-0.9476333, 0.2604391, -2.348798, 1, 1, 1, 1, 1,
-0.9426271, -0.4891748, -2.467137, 1, 1, 1, 1, 1,
-0.9412773, 1.087523, -3.255983, 0, 0, 1, 1, 1,
-0.9343884, 0.06202411, -3.449116, 1, 0, 0, 1, 1,
-0.924125, 1.711723, -0.4851143, 1, 0, 0, 1, 1,
-0.919255, 0.170056, -1.853181, 1, 0, 0, 1, 1,
-0.9118719, 0.1741821, -2.509181, 1, 0, 0, 1, 1,
-0.9082404, -0.3845384, -1.604535, 1, 0, 0, 1, 1,
-0.9080445, -0.4558991, -2.909005, 0, 0, 0, 1, 1,
-0.9078895, -0.3094231, -0.3559876, 0, 0, 0, 1, 1,
-0.9071021, 0.3004274, -1.537545, 0, 0, 0, 1, 1,
-0.8991722, 1.238807, -2.113669, 0, 0, 0, 1, 1,
-0.8944644, 0.3362787, -0.8047538, 0, 0, 0, 1, 1,
-0.8906893, -0.2460313, -0.9398832, 0, 0, 0, 1, 1,
-0.8859532, -1.467752, -3.520241, 0, 0, 0, 1, 1,
-0.8839899, 0.7985872, -0.660723, 1, 1, 1, 1, 1,
-0.8809473, -0.8343675, -2.036746, 1, 1, 1, 1, 1,
-0.8791953, -0.2170612, -3.054894, 1, 1, 1, 1, 1,
-0.8762711, -0.01929954, -1.778567, 1, 1, 1, 1, 1,
-0.8638058, 1.32526, -0.819487, 1, 1, 1, 1, 1,
-0.8614756, -1.068796, -2.436607, 1, 1, 1, 1, 1,
-0.8578958, -1.535249, -1.701022, 1, 1, 1, 1, 1,
-0.8513361, 0.08695644, -2.441934, 1, 1, 1, 1, 1,
-0.847631, 1.832957, -1.99456, 1, 1, 1, 1, 1,
-0.844268, -1.03265, -4.45477, 1, 1, 1, 1, 1,
-0.8422602, 0.0624194, -3.615963, 1, 1, 1, 1, 1,
-0.840367, 0.9115366, 0.4191182, 1, 1, 1, 1, 1,
-0.8391855, -0.9990929, -4.243647, 1, 1, 1, 1, 1,
-0.8322207, 0.7238603, -0.6055297, 1, 1, 1, 1, 1,
-0.826869, -0.01410476, -2.094852, 1, 1, 1, 1, 1,
-0.8268204, -0.08919084, -3.147149, 0, 0, 1, 1, 1,
-0.8224344, 2.600287, -1.156963, 1, 0, 0, 1, 1,
-0.8212218, -0.08945455, -2.051033, 1, 0, 0, 1, 1,
-0.8192092, 1.742034, -1.537104, 1, 0, 0, 1, 1,
-0.8158386, 1.196283, 0.9682689, 1, 0, 0, 1, 1,
-0.8154492, -1.143305, -4.309896, 1, 0, 0, 1, 1,
-0.8130291, 0.6325642, -2.534421, 0, 0, 0, 1, 1,
-0.8097577, -0.06024812, -2.211799, 0, 0, 0, 1, 1,
-0.8093743, -0.03682436, -2.903486, 0, 0, 0, 1, 1,
-0.7999845, 0.9018895, -1.335799, 0, 0, 0, 1, 1,
-0.7990414, 0.239123, -1.558765, 0, 0, 0, 1, 1,
-0.7966896, -1.344796, -2.209482, 0, 0, 0, 1, 1,
-0.791642, 1.114192, -0.5928076, 0, 0, 0, 1, 1,
-0.7870734, 0.4557773, -2.314723, 1, 1, 1, 1, 1,
-0.7866414, -1.247912, -3.062658, 1, 1, 1, 1, 1,
-0.775857, -0.2438423, -0.7732845, 1, 1, 1, 1, 1,
-0.7727382, 0.8143955, 0.4610193, 1, 1, 1, 1, 1,
-0.7717137, 0.0951997, -0.847064, 1, 1, 1, 1, 1,
-0.7717035, -0.3221421, -2.42273, 1, 1, 1, 1, 1,
-0.7694113, -0.3462555, -0.870332, 1, 1, 1, 1, 1,
-0.7672948, -1.202466, -2.002479, 1, 1, 1, 1, 1,
-0.7622635, -1.822398, -3.19632, 1, 1, 1, 1, 1,
-0.761954, -0.1017705, -1.172241, 1, 1, 1, 1, 1,
-0.7538862, -0.706967, -1.115274, 1, 1, 1, 1, 1,
-0.7528154, -0.1428779, -1.905048, 1, 1, 1, 1, 1,
-0.7520657, 0.2590645, -1.601793, 1, 1, 1, 1, 1,
-0.7496248, -0.1419543, -2.118614, 1, 1, 1, 1, 1,
-0.744853, 1.08223, -0.3668526, 1, 1, 1, 1, 1,
-0.7447032, -0.6634431, -2.724556, 0, 0, 1, 1, 1,
-0.7440793, -0.7107744, -1.680324, 1, 0, 0, 1, 1,
-0.735501, -0.4663416, -2.325716, 1, 0, 0, 1, 1,
-0.7339661, -0.1675538, -0.9175975, 1, 0, 0, 1, 1,
-0.7334976, -0.7556257, -2.700302, 1, 0, 0, 1, 1,
-0.7255505, 0.7289385, -0.677869, 1, 0, 0, 1, 1,
-0.7236879, 0.6680418, -1.583799, 0, 0, 0, 1, 1,
-0.7231742, -1.194048, -2.859256, 0, 0, 0, 1, 1,
-0.7206357, -0.9872772, -2.699434, 0, 0, 0, 1, 1,
-0.7187355, -0.6637919, -2.952363, 0, 0, 0, 1, 1,
-0.7131436, -1.873798, -2.536207, 0, 0, 0, 1, 1,
-0.7090934, 1.324815, -1.345447, 0, 0, 0, 1, 1,
-0.6999947, -1.798184, -2.685691, 0, 0, 0, 1, 1,
-0.6848963, 0.2245143, -2.242313, 1, 1, 1, 1, 1,
-0.6841687, 0.493687, -2.160093, 1, 1, 1, 1, 1,
-0.6840602, -0.736702, -3.638888, 1, 1, 1, 1, 1,
-0.6832525, -0.4970315, -2.020776, 1, 1, 1, 1, 1,
-0.6818022, -1.156932, -2.884105, 1, 1, 1, 1, 1,
-0.677518, 1.65932, 1.95631, 1, 1, 1, 1, 1,
-0.6708581, 0.1316749, -1.087975, 1, 1, 1, 1, 1,
-0.6620819, 0.3022395, 0.6386841, 1, 1, 1, 1, 1,
-0.6578896, 0.3081751, 0.4744835, 1, 1, 1, 1, 1,
-0.6509193, 1.761088, -0.4696291, 1, 1, 1, 1, 1,
-0.650269, 0.5672213, -1.203033, 1, 1, 1, 1, 1,
-0.6450909, 1.214334, -0.6851327, 1, 1, 1, 1, 1,
-0.6374612, -0.3309826, -1.24551, 1, 1, 1, 1, 1,
-0.6337773, 0.1739205, -1.159478, 1, 1, 1, 1, 1,
-0.62658, -0.223835, -3.207893, 1, 1, 1, 1, 1,
-0.6235502, 0.3735404, -1.059064, 0, 0, 1, 1, 1,
-0.622448, -1.677922, -2.14192, 1, 0, 0, 1, 1,
-0.6201842, -0.3715022, -3.181617, 1, 0, 0, 1, 1,
-0.6183301, 1.121498, -0.2548833, 1, 0, 0, 1, 1,
-0.6177638, 0.5377953, -0.4308226, 1, 0, 0, 1, 1,
-0.6166915, -1.253535, -2.16635, 1, 0, 0, 1, 1,
-0.6166317, -0.8961696, -2.762224, 0, 0, 0, 1, 1,
-0.6160192, 1.399568, 0.3044568, 0, 0, 0, 1, 1,
-0.6148915, 0.08338182, -2.927931, 0, 0, 0, 1, 1,
-0.6055024, -0.7742956, -1.460104, 0, 0, 0, 1, 1,
-0.6036193, -0.3077781, -0.2396667, 0, 0, 0, 1, 1,
-0.5967665, -1.547908, -3.172937, 0, 0, 0, 1, 1,
-0.5952309, -0.1329656, -2.252154, 0, 0, 0, 1, 1,
-0.5907067, 0.6821142, 1.024617, 1, 1, 1, 1, 1,
-0.5903391, 1.099833, -0.3459502, 1, 1, 1, 1, 1,
-0.5800129, 0.5989072, -0.5438409, 1, 1, 1, 1, 1,
-0.5753254, 0.4898672, 1.785931, 1, 1, 1, 1, 1,
-0.5736652, -1.456321, -1.653512, 1, 1, 1, 1, 1,
-0.5705296, 0.2939038, -2.133554, 1, 1, 1, 1, 1,
-0.5670985, 0.09255032, -4.227996, 1, 1, 1, 1, 1,
-0.5668205, -1.568314, -3.073513, 1, 1, 1, 1, 1,
-0.5613499, 0.752326, -1.923872, 1, 1, 1, 1, 1,
-0.5557041, 2.131365, 0.02506511, 1, 1, 1, 1, 1,
-0.5478744, 2.2451, 2.360345, 1, 1, 1, 1, 1,
-0.546135, 1.379096, -0.6140211, 1, 1, 1, 1, 1,
-0.5432143, -0.2933398, -2.362463, 1, 1, 1, 1, 1,
-0.5397698, -0.01010432, -1.61283, 1, 1, 1, 1, 1,
-0.5333239, 1.360474, 0.3708194, 1, 1, 1, 1, 1,
-0.5304039, 0.5553058, -0.9514202, 0, 0, 1, 1, 1,
-0.5275981, -1.112123, -2.614898, 1, 0, 0, 1, 1,
-0.5269836, 0.4339397, -2.021833, 1, 0, 0, 1, 1,
-0.5184684, 0.4141975, -0.3084767, 1, 0, 0, 1, 1,
-0.5178403, 0.1559559, -3.403835, 1, 0, 0, 1, 1,
-0.5156618, -0.8256233, -1.730276, 1, 0, 0, 1, 1,
-0.5130666, 0.3648341, -1.387178, 0, 0, 0, 1, 1,
-0.508898, -0.4303427, -1.635206, 0, 0, 0, 1, 1,
-0.504998, 0.7028307, -0.02513031, 0, 0, 0, 1, 1,
-0.50116, 0.4060286, -1.021348, 0, 0, 0, 1, 1,
-0.4995015, 0.01731896, -2.111068, 0, 0, 0, 1, 1,
-0.4963992, 0.4258248, -0.465774, 0, 0, 0, 1, 1,
-0.4864806, -0.00388817, -0.6947656, 0, 0, 0, 1, 1,
-0.4864595, -0.6200203, -3.067965, 1, 1, 1, 1, 1,
-0.4852365, -1.612017, -2.960232, 1, 1, 1, 1, 1,
-0.4836479, -0.1345696, -1.010943, 1, 1, 1, 1, 1,
-0.4723312, -0.9644352, -2.784783, 1, 1, 1, 1, 1,
-0.4702769, 0.9430279, 0.2366615, 1, 1, 1, 1, 1,
-0.4674963, 0.9661338, 0.1954658, 1, 1, 1, 1, 1,
-0.4664704, 0.9681706, -1.814883, 1, 1, 1, 1, 1,
-0.4560198, 0.9859474, -0.6322618, 1, 1, 1, 1, 1,
-0.4540765, -1.690328, -0.8403951, 1, 1, 1, 1, 1,
-0.4528819, 1.274399, -0.2040536, 1, 1, 1, 1, 1,
-0.4520968, 0.6140595, 0.1821345, 1, 1, 1, 1, 1,
-0.4436567, 0.7288048, -2.224966, 1, 1, 1, 1, 1,
-0.4432658, 1.280712, -2.498159, 1, 1, 1, 1, 1,
-0.4427862, 0.3115965, -1.668753, 1, 1, 1, 1, 1,
-0.4413671, 1.251698, -1.875868, 1, 1, 1, 1, 1,
-0.4381576, -1.182939, -3.132719, 0, 0, 1, 1, 1,
-0.4353411, 1.11885, 1.14599, 1, 0, 0, 1, 1,
-0.4324611, -0.208501, -2.395976, 1, 0, 0, 1, 1,
-0.4305071, 0.7642326, -1.95185, 1, 0, 0, 1, 1,
-0.4244309, 0.01354723, -0.3991933, 1, 0, 0, 1, 1,
-0.4215019, -0.1313145, -0.6771339, 1, 0, 0, 1, 1,
-0.4194398, -1.666738, -3.641769, 0, 0, 0, 1, 1,
-0.4171563, 1.502715, 0.2377671, 0, 0, 0, 1, 1,
-0.4142917, -1.753816, -3.082347, 0, 0, 0, 1, 1,
-0.4104382, 0.09454688, 0.1212742, 0, 0, 0, 1, 1,
-0.409866, 0.2295574, -2.419312, 0, 0, 0, 1, 1,
-0.4083521, -0.05123882, -0.6755726, 0, 0, 0, 1, 1,
-0.4083416, -0.4180264, -3.411079, 0, 0, 0, 1, 1,
-0.4039183, 2.07825, -0.8070033, 1, 1, 1, 1, 1,
-0.4039028, -0.6037167, -2.673753, 1, 1, 1, 1, 1,
-0.4019136, 0.2099476, -0.8924514, 1, 1, 1, 1, 1,
-0.4006205, -0.8720289, -1.056678, 1, 1, 1, 1, 1,
-0.4003384, 1.623819, 0.6088448, 1, 1, 1, 1, 1,
-0.4002763, 1.144951, -1.790569, 1, 1, 1, 1, 1,
-0.3992595, 0.08950403, 1.3161, 1, 1, 1, 1, 1,
-0.3922269, -0.8106175, -1.936422, 1, 1, 1, 1, 1,
-0.3892918, 0.8225108, -1.179501, 1, 1, 1, 1, 1,
-0.3844579, -1.070744, -2.264952, 1, 1, 1, 1, 1,
-0.383083, 0.1893005, -0.09349816, 1, 1, 1, 1, 1,
-0.3816872, 0.3169272, -2.290061, 1, 1, 1, 1, 1,
-0.3785068, -0.6750056, -3.530288, 1, 1, 1, 1, 1,
-0.3778374, 0.08650792, -2.563186, 1, 1, 1, 1, 1,
-0.3743375, -1.408561, -2.836112, 1, 1, 1, 1, 1,
-0.3739581, 0.1478243, -1.267889, 0, 0, 1, 1, 1,
-0.3718856, -1.277417, -2.616157, 1, 0, 0, 1, 1,
-0.3679239, -2.01288, -3.032453, 1, 0, 0, 1, 1,
-0.3652537, 0.8651022, -0.6264514, 1, 0, 0, 1, 1,
-0.3638078, 0.724322, -0.5362152, 1, 0, 0, 1, 1,
-0.3604057, -0.8977048, -2.795549, 1, 0, 0, 1, 1,
-0.359149, -0.3912855, -2.152173, 0, 0, 0, 1, 1,
-0.3581329, 1.118183, -0.5208943, 0, 0, 0, 1, 1,
-0.3513015, -0.3122596, -0.07540027, 0, 0, 0, 1, 1,
-0.3508058, 1.049439, 0.2026455, 0, 0, 0, 1, 1,
-0.3489375, 1.127791, -1.033741, 0, 0, 0, 1, 1,
-0.3482626, -1.583691, -5.347286, 0, 0, 0, 1, 1,
-0.3436033, 0.4092509, 0.7039694, 0, 0, 0, 1, 1,
-0.3432394, 0.6617754, -0.0859339, 1, 1, 1, 1, 1,
-0.3401879, 0.9302365, -0.770276, 1, 1, 1, 1, 1,
-0.3376468, 0.4843217, 0.4046949, 1, 1, 1, 1, 1,
-0.3374683, 1.066844, -0.01038028, 1, 1, 1, 1, 1,
-0.3371195, 0.5413283, -0.3293903, 1, 1, 1, 1, 1,
-0.3370052, -0.6419731, -3.727763, 1, 1, 1, 1, 1,
-0.3336201, 1.173038, 0.9098009, 1, 1, 1, 1, 1,
-0.3324906, 0.4917524, -0.7180865, 1, 1, 1, 1, 1,
-0.3314567, 1.49382, -1.320308, 1, 1, 1, 1, 1,
-0.3314399, -2.352422, -3.847645, 1, 1, 1, 1, 1,
-0.3291988, -0.5187938, -3.352402, 1, 1, 1, 1, 1,
-0.3270548, -1.193131, -3.212082, 1, 1, 1, 1, 1,
-0.3268767, 0.6831581, 0.02866069, 1, 1, 1, 1, 1,
-0.323793, 0.1855166, -0.3025996, 1, 1, 1, 1, 1,
-0.321645, -0.02756847, -0.309503, 1, 1, 1, 1, 1,
-0.3212121, -1.527333, -2.38362, 0, 0, 1, 1, 1,
-0.3188496, 0.1422803, -1.880976, 1, 0, 0, 1, 1,
-0.3123314, 0.5207784, 0.8967489, 1, 0, 0, 1, 1,
-0.3122316, 1.254236, 1.088478, 1, 0, 0, 1, 1,
-0.3111465, -0.4473609, -3.188421, 1, 0, 0, 1, 1,
-0.30937, -1.209564, -2.827271, 1, 0, 0, 1, 1,
-0.3066716, -0.1679332, -1.178257, 0, 0, 0, 1, 1,
-0.3065474, 0.6244725, 0.09550091, 0, 0, 0, 1, 1,
-0.2999024, -0.5139187, -2.71532, 0, 0, 0, 1, 1,
-0.2979731, 1.465743, -1.41929, 0, 0, 0, 1, 1,
-0.2964097, 0.8532141, -0.803361, 0, 0, 0, 1, 1,
-0.2942966, 1.428644, -1.577259, 0, 0, 0, 1, 1,
-0.2918081, -0.5654373, -3.717531, 0, 0, 0, 1, 1,
-0.2871919, 1.064041, -0.5871802, 1, 1, 1, 1, 1,
-0.2802342, 0.2561249, -1.329991, 1, 1, 1, 1, 1,
-0.2794271, 1.203535, 0.151507, 1, 1, 1, 1, 1,
-0.2793407, -1.182404, -3.3613, 1, 1, 1, 1, 1,
-0.2768009, 0.3097053, -0.7255433, 1, 1, 1, 1, 1,
-0.2758214, 0.8228081, 1.115666, 1, 1, 1, 1, 1,
-0.2633035, -0.1693315, -1.442065, 1, 1, 1, 1, 1,
-0.2616019, 2.269056, -0.355177, 1, 1, 1, 1, 1,
-0.2605275, 0.6090578, -1.121738, 1, 1, 1, 1, 1,
-0.2573946, 0.4091691, -2.147093, 1, 1, 1, 1, 1,
-0.2538103, 0.1716547, -1.318532, 1, 1, 1, 1, 1,
-0.2536767, -0.9450787, -3.217932, 1, 1, 1, 1, 1,
-0.2510472, -0.6970495, -2.090693, 1, 1, 1, 1, 1,
-0.2462304, -2.047069, -1.262973, 1, 1, 1, 1, 1,
-0.2363161, -0.06231676, -1.931895, 1, 1, 1, 1, 1,
-0.2341775, -0.5509731, -4.629929, 0, 0, 1, 1, 1,
-0.2310491, 0.2758967, -1.458936, 1, 0, 0, 1, 1,
-0.2262947, 0.8362198, 1.863779, 1, 0, 0, 1, 1,
-0.2245909, 1.054817, 0.1051266, 1, 0, 0, 1, 1,
-0.2243846, 1.532645, 0.2648989, 1, 0, 0, 1, 1,
-0.2234799, -0.3711939, -2.712521, 1, 0, 0, 1, 1,
-0.2226326, -0.6650282, -3.014539, 0, 0, 0, 1, 1,
-0.2226291, -2.088679, -1.748034, 0, 0, 0, 1, 1,
-0.2224086, -0.69456, -1.685547, 0, 0, 0, 1, 1,
-0.2201703, -1.311689, -2.662788, 0, 0, 0, 1, 1,
-0.2108962, 2.185212, -1.031505, 0, 0, 0, 1, 1,
-0.2094134, 0.8263558, -0.8095189, 0, 0, 0, 1, 1,
-0.2058578, -1.246735, -3.059216, 0, 0, 0, 1, 1,
-0.2051639, 0.8489137, -1.29989, 1, 1, 1, 1, 1,
-0.2048494, 1.765974, -0.3957042, 1, 1, 1, 1, 1,
-0.2007328, 1.498853, 1.28702, 1, 1, 1, 1, 1,
-0.1994272, -0.961704, -5.386374, 1, 1, 1, 1, 1,
-0.1950338, -0.3934722, -0.6031057, 1, 1, 1, 1, 1,
-0.1922726, 1.012199, 0.4029426, 1, 1, 1, 1, 1,
-0.1894662, -1.542928, -3.218482, 1, 1, 1, 1, 1,
-0.1877237, 2.207357, -1.014474, 1, 1, 1, 1, 1,
-0.1870692, 2.339621, -1.237749, 1, 1, 1, 1, 1,
-0.1842132, 0.1478154, -1.918785, 1, 1, 1, 1, 1,
-0.1816843, 0.621979, -1.218242, 1, 1, 1, 1, 1,
-0.1769535, 0.2909442, -0.9493038, 1, 1, 1, 1, 1,
-0.1766509, -1.88693, -4.176444, 1, 1, 1, 1, 1,
-0.176332, 0.7458516, -0.3663147, 1, 1, 1, 1, 1,
-0.1609474, 0.06294505, 0.2529329, 1, 1, 1, 1, 1,
-0.1602201, -1.013115, -4.188914, 0, 0, 1, 1, 1,
-0.1566643, -0.8084459, -3.094211, 1, 0, 0, 1, 1,
-0.1555485, -0.8690059, -3.029075, 1, 0, 0, 1, 1,
-0.1536212, 0.06936099, -2.122413, 1, 0, 0, 1, 1,
-0.153388, 0.9519981, 0.1128902, 1, 0, 0, 1, 1,
-0.1518485, 1.265295, -1.1012, 1, 0, 0, 1, 1,
-0.1499375, 1.664747, 0.2038776, 0, 0, 0, 1, 1,
-0.1498252, 1.03363, -0.1202066, 0, 0, 0, 1, 1,
-0.1478881, -0.6909568, -2.465349, 0, 0, 0, 1, 1,
-0.1468436, -1.468419, -2.625197, 0, 0, 0, 1, 1,
-0.1453182, 0.6205232, 5.066918e-05, 0, 0, 0, 1, 1,
-0.144203, 0.7187079, 1.16988, 0, 0, 0, 1, 1,
-0.1425894, 2.535945, 0.3258243, 0, 0, 0, 1, 1,
-0.1412339, 1.246694, -0.04667731, 1, 1, 1, 1, 1,
-0.1375498, -0.5790437, -2.208091, 1, 1, 1, 1, 1,
-0.1314798, 0.4972949, 1.766153, 1, 1, 1, 1, 1,
-0.1305721, -1.702894, -2.715068, 1, 1, 1, 1, 1,
-0.1301104, 1.280607, 0.0533938, 1, 1, 1, 1, 1,
-0.1279133, 0.1823745, -1.435066, 1, 1, 1, 1, 1,
-0.1265479, 1.039847, 0.8145922, 1, 1, 1, 1, 1,
-0.1205045, 1.183727, 0.3851931, 1, 1, 1, 1, 1,
-0.1095425, -0.958223, -3.908669, 1, 1, 1, 1, 1,
-0.1089414, 0.7866784, 0.1019959, 1, 1, 1, 1, 1,
-0.1060629, 0.7265548, -0.4774434, 1, 1, 1, 1, 1,
-0.1035778, -0.6214762, -3.584333, 1, 1, 1, 1, 1,
-0.1022697, -0.0626743, -2.337767, 1, 1, 1, 1, 1,
-0.1016013, 0.05561532, -1.20378, 1, 1, 1, 1, 1,
-0.09924023, 1.159397, -0.4185408, 1, 1, 1, 1, 1,
-0.096999, 0.3193094, 0.2287758, 0, 0, 1, 1, 1,
-0.09306867, 0.4207889, 1.749933, 1, 0, 0, 1, 1,
-0.09185757, -0.5251187, -1.091351, 1, 0, 0, 1, 1,
-0.09082484, -1.119511, -5.074015, 1, 0, 0, 1, 1,
-0.08865687, 0.6073969, 0.5239689, 1, 0, 0, 1, 1,
-0.08795577, -0.499387, -3.132015, 1, 0, 0, 1, 1,
-0.08580869, 0.1038426, -0.7587103, 0, 0, 0, 1, 1,
-0.08448274, -1.175962, -3.801937, 0, 0, 0, 1, 1,
-0.08303875, -1.458477, -2.858967, 0, 0, 0, 1, 1,
-0.08298693, 2.198289, -0.1358059, 0, 0, 0, 1, 1,
-0.0824691, -0.9087284, -1.748341, 0, 0, 0, 1, 1,
-0.07874691, 1.00046, 0.1262463, 0, 0, 0, 1, 1,
-0.07787725, 2.050446, 0.3578533, 0, 0, 0, 1, 1,
-0.07706102, 1.666273, 0.9013542, 1, 1, 1, 1, 1,
-0.07608084, -0.767227, -2.771962, 1, 1, 1, 1, 1,
-0.07574717, 1.163845, -0.9278226, 1, 1, 1, 1, 1,
-0.07277001, 2.551964, 0.4367636, 1, 1, 1, 1, 1,
-0.07197723, -0.3014425, -4.065555, 1, 1, 1, 1, 1,
-0.07112429, -0.4200628, -3.805221, 1, 1, 1, 1, 1,
-0.07111023, -1.400662, -3.610037, 1, 1, 1, 1, 1,
-0.06909765, 1.013087, -1.82011, 1, 1, 1, 1, 1,
-0.06721981, 0.880249, 0.01836169, 1, 1, 1, 1, 1,
-0.06554274, -1.413288, -3.886667, 1, 1, 1, 1, 1,
-0.06485283, -1.029923, -4.237086, 1, 1, 1, 1, 1,
-0.06424193, 0.9544256, 0.6083888, 1, 1, 1, 1, 1,
-0.06330894, 0.4234676, 0.06419007, 1, 1, 1, 1, 1,
-0.05943263, 1.369698, 0.5155275, 1, 1, 1, 1, 1,
-0.05561174, -1.354634, -3.992826, 1, 1, 1, 1, 1,
-0.05385118, 1.12777, -2.896956, 0, 0, 1, 1, 1,
-0.05343641, 0.5297725, -0.6374085, 1, 0, 0, 1, 1,
-0.04756787, -0.9761017, -2.7133, 1, 0, 0, 1, 1,
-0.04612777, -1.155799, -3.995113, 1, 0, 0, 1, 1,
-0.04265344, 0.776836, -0.7319465, 1, 0, 0, 1, 1,
-0.03834631, 0.6928598, -1.453502, 1, 0, 0, 1, 1,
-0.03748896, 0.6353739, 2.657073, 0, 0, 0, 1, 1,
-0.03606676, -0.005182927, -0.5837924, 0, 0, 0, 1, 1,
-0.03345948, 0.5102507, -0.6707212, 0, 0, 0, 1, 1,
-0.03342982, -0.2568114, -3.369551, 0, 0, 0, 1, 1,
-0.03070426, 1.285803, -0.9277126, 0, 0, 0, 1, 1,
-0.02131604, 0.2272629, 0.6785296, 0, 0, 0, 1, 1,
-0.01808139, -0.2766636, -3.636541, 0, 0, 0, 1, 1,
-0.01584839, 0.2972251, -1.65744, 1, 1, 1, 1, 1,
-0.01328905, -0.5541645, -2.856532, 1, 1, 1, 1, 1,
-0.01290188, 0.0546932, -1.771698, 1, 1, 1, 1, 1,
-0.006238297, 0.1496135, 1.806873, 1, 1, 1, 1, 1,
-0.005741111, 0.1367759, -0.8409619, 1, 1, 1, 1, 1,
-0.004859637, -0.6667991, -3.805569, 1, 1, 1, 1, 1,
-0.002942106, -0.5798704, -2.951337, 1, 1, 1, 1, 1,
-0.002367114, -0.01600813, -2.8726, 1, 1, 1, 1, 1,
0.003797764, -0.5919771, 1.736089, 1, 1, 1, 1, 1,
0.004274088, 2.008015, 0.210898, 1, 1, 1, 1, 1,
0.004505062, 0.4822308, 0.2193228, 1, 1, 1, 1, 1,
0.004588811, 0.1310544, 1.275563, 1, 1, 1, 1, 1,
0.00549008, 0.2214787, -0.1584132, 1, 1, 1, 1, 1,
0.006941828, 0.8414613, -0.1297257, 1, 1, 1, 1, 1,
0.01091783, -0.1091773, 4.597678, 1, 1, 1, 1, 1,
0.011416, -1.317607, 3.865969, 0, 0, 1, 1, 1,
0.02093198, -0.2424345, 2.581602, 1, 0, 0, 1, 1,
0.02768484, -1.509737, 1.698579, 1, 0, 0, 1, 1,
0.03009743, 0.5165792, -0.3257422, 1, 0, 0, 1, 1,
0.03206008, -0.6300334, 1.558929, 1, 0, 0, 1, 1,
0.03568735, 0.7420635, 0.06876822, 1, 0, 0, 1, 1,
0.03679393, -0.6187014, 2.484915, 0, 0, 0, 1, 1,
0.03719978, -0.4585868, 3.061793, 0, 0, 0, 1, 1,
0.04040574, 0.7277593, -1.73061, 0, 0, 0, 1, 1,
0.04068329, -2.248986, 3.694236, 0, 0, 0, 1, 1,
0.04287539, 0.6045901, -0.1054576, 0, 0, 0, 1, 1,
0.04637845, -0.3657746, 4.716594, 0, 0, 0, 1, 1,
0.04663187, -0.7320385, 2.068373, 0, 0, 0, 1, 1,
0.04757362, -0.2050743, 2.302069, 1, 1, 1, 1, 1,
0.04938367, -0.3897021, 2.60813, 1, 1, 1, 1, 1,
0.05105975, -0.6345642, 2.201461, 1, 1, 1, 1, 1,
0.05129004, 0.4246085, 0.3085737, 1, 1, 1, 1, 1,
0.05518718, 1.073518, 2.152996, 1, 1, 1, 1, 1,
0.059085, -0.1521204, 2.686744, 1, 1, 1, 1, 1,
0.06048402, 1.380226, 1.683482, 1, 1, 1, 1, 1,
0.06232971, 0.3538635, -2.111239, 1, 1, 1, 1, 1,
0.06267654, -0.9883897, 1.844932, 1, 1, 1, 1, 1,
0.0661436, 0.4907972, -0.1106009, 1, 1, 1, 1, 1,
0.07230915, -0.5665728, 2.652331, 1, 1, 1, 1, 1,
0.07384551, 0.5628068, 0.2792472, 1, 1, 1, 1, 1,
0.07634736, -1.581377, 3.233949, 1, 1, 1, 1, 1,
0.08047843, -0.2464387, 4.498024, 1, 1, 1, 1, 1,
0.08233839, 0.4677715, 0.9729752, 1, 1, 1, 1, 1,
0.08266822, 1.166472, 0.3025542, 0, 0, 1, 1, 1,
0.08738061, 0.07005861, -0.09063372, 1, 0, 0, 1, 1,
0.08742525, -0.4421545, 3.927263, 1, 0, 0, 1, 1,
0.09157671, 0.7977304, -0.1129232, 1, 0, 0, 1, 1,
0.09229334, 0.3500208, -0.8429974, 1, 0, 0, 1, 1,
0.09495998, 1.508452, 1.09307, 1, 0, 0, 1, 1,
0.09530552, 0.4960677, -1.374059, 0, 0, 0, 1, 1,
0.09541854, -1.129176, 2.738458, 0, 0, 0, 1, 1,
0.09605794, -1.871038, 2.358548, 0, 0, 0, 1, 1,
0.1055727, -0.2198163, 3.447379, 0, 0, 0, 1, 1,
0.1100241, -0.6735674, 4.086265, 0, 0, 0, 1, 1,
0.1100552, -0.3934612, 3.627057, 0, 0, 0, 1, 1,
0.1116065, -0.718605, 3.583355, 0, 0, 0, 1, 1,
0.1121072, -0.1497374, 1.396677, 1, 1, 1, 1, 1,
0.1173433, -0.3451232, 3.12521, 1, 1, 1, 1, 1,
0.1194184, 0.8148594, -1.153514, 1, 1, 1, 1, 1,
0.1243403, 1.767438, -0.6653459, 1, 1, 1, 1, 1,
0.130307, 0.4479178, 1.54051, 1, 1, 1, 1, 1,
0.1312283, 2.015869, 0.4855065, 1, 1, 1, 1, 1,
0.1342965, 0.489074, 2.661621, 1, 1, 1, 1, 1,
0.1346733, 0.527262, 1.454446, 1, 1, 1, 1, 1,
0.1354181, 1.343813, -0.4981261, 1, 1, 1, 1, 1,
0.1361504, 0.01818284, 1.907799, 1, 1, 1, 1, 1,
0.1417284, 0.1887283, 1.579189, 1, 1, 1, 1, 1,
0.144142, 0.4228661, -1.154868, 1, 1, 1, 1, 1,
0.145506, 0.5464164, 0.8510608, 1, 1, 1, 1, 1,
0.1476541, 0.1385537, 1.98671, 1, 1, 1, 1, 1,
0.1482422, 1.039199, 0.05514329, 1, 1, 1, 1, 1,
0.1514932, -0.7117007, 3.120611, 0, 0, 1, 1, 1,
0.15255, -0.993822, 2.687821, 1, 0, 0, 1, 1,
0.1577596, 1.613787, -0.09415016, 1, 0, 0, 1, 1,
0.1595715, 0.7016429, 0.9188657, 1, 0, 0, 1, 1,
0.1628864, -0.08647038, 1.582222, 1, 0, 0, 1, 1,
0.1660464, 0.01445341, 3.1301, 1, 0, 0, 1, 1,
0.1675561, 0.576847, 0.7803184, 0, 0, 0, 1, 1,
0.1697473, 1.49508, -0.4451619, 0, 0, 0, 1, 1,
0.1697986, 2.087277, -0.8398383, 0, 0, 0, 1, 1,
0.1722464, -0.1167994, 2.788661, 0, 0, 0, 1, 1,
0.1758756, -2.155816, 2.363098, 0, 0, 0, 1, 1,
0.1781535, -0.3545061, 1.567955, 0, 0, 0, 1, 1,
0.1805847, 0.2340658, -0.322369, 0, 0, 0, 1, 1,
0.183272, 1.591526, 0.5682358, 1, 1, 1, 1, 1,
0.1846141, -0.2015096, 1.562307, 1, 1, 1, 1, 1,
0.1871126, 0.5378247, 0.5660396, 1, 1, 1, 1, 1,
0.1953586, 0.006827796, 0.7098989, 1, 1, 1, 1, 1,
0.2004628, -1.289228, 2.230214, 1, 1, 1, 1, 1,
0.2009861, -0.2866774, 3.343439, 1, 1, 1, 1, 1,
0.2035308, 0.5280402, -0.1307548, 1, 1, 1, 1, 1,
0.2046563, 0.09661876, -0.9239287, 1, 1, 1, 1, 1,
0.2093494, -1.355801, 4.875625, 1, 1, 1, 1, 1,
0.2098066, 0.8286986, 0.9094412, 1, 1, 1, 1, 1,
0.21066, -1.371738, 3.025425, 1, 1, 1, 1, 1,
0.2128026, 0.5980719, 0.1531139, 1, 1, 1, 1, 1,
0.217435, 0.7266753, 0.2502467, 1, 1, 1, 1, 1,
0.2204265, 0.67758, -0.2471707, 1, 1, 1, 1, 1,
0.2213021, -0.1023268, 0.980703, 1, 1, 1, 1, 1,
0.2230309, -0.1278939, 2.837521, 0, 0, 1, 1, 1,
0.2311529, 2.514107, -0.9985184, 1, 0, 0, 1, 1,
0.2341009, 0.4966179, 0.1892385, 1, 0, 0, 1, 1,
0.2368204, 0.3884744, 0.9465212, 1, 0, 0, 1, 1,
0.2438329, 0.6710301, -0.155617, 1, 0, 0, 1, 1,
0.244156, 0.4450648, 0.3400573, 1, 0, 0, 1, 1,
0.2458314, 0.2050207, 0.8207217, 0, 0, 0, 1, 1,
0.2471365, -1.014021, 3.864897, 0, 0, 0, 1, 1,
0.2483082, 0.4000044, 1.743408, 0, 0, 0, 1, 1,
0.2494594, 0.06923348, 1.468418, 0, 0, 0, 1, 1,
0.2514129, -1.472239, 2.590287, 0, 0, 0, 1, 1,
0.2528479, 0.415619, 0.6426173, 0, 0, 0, 1, 1,
0.2539119, 0.1429842, 0.5680172, 0, 0, 0, 1, 1,
0.2558936, 0.09545507, 1.628217, 1, 1, 1, 1, 1,
0.2638451, -0.5390307, 1.783701, 1, 1, 1, 1, 1,
0.2731307, 0.4277779, -1.175012, 1, 1, 1, 1, 1,
0.2731583, -1.753359, 2.831124, 1, 1, 1, 1, 1,
0.2765654, 0.5444402, 1.480169, 1, 1, 1, 1, 1,
0.2791631, -1.128851, 1.267028, 1, 1, 1, 1, 1,
0.2796922, 1.186617, -0.2305733, 1, 1, 1, 1, 1,
0.2837661, 1.368082, 2.054753, 1, 1, 1, 1, 1,
0.2847212, 1.781488, 1.897944, 1, 1, 1, 1, 1,
0.290356, -1.099629, 3.868481, 1, 1, 1, 1, 1,
0.295553, 1.037745, 0.05538317, 1, 1, 1, 1, 1,
0.2996743, 0.6855829, 1.047547, 1, 1, 1, 1, 1,
0.3141353, -0.0337458, 2.729564, 1, 1, 1, 1, 1,
0.3146282, 0.3143321, 0.8896211, 1, 1, 1, 1, 1,
0.3157088, -0.4327164, 0.8526902, 1, 1, 1, 1, 1,
0.3162682, 1.867638, 1.795815, 0, 0, 1, 1, 1,
0.3209022, -1.518873, 2.54472, 1, 0, 0, 1, 1,
0.321836, -0.6635802, 4.198949, 1, 0, 0, 1, 1,
0.3220997, -0.3561679, 0.4379112, 1, 0, 0, 1, 1,
0.3370175, 1.474305, -1.176419, 1, 0, 0, 1, 1,
0.3412452, 1.698102, 1.186994, 1, 0, 0, 1, 1,
0.3426266, 0.3110019, 0.6576271, 0, 0, 0, 1, 1,
0.3430074, -0.9297085, 1.554069, 0, 0, 0, 1, 1,
0.3439466, -2.891359, 3.297055, 0, 0, 0, 1, 1,
0.3457573, -1.062409, 2.992698, 0, 0, 0, 1, 1,
0.3477651, 1.272507, -0.4840724, 0, 0, 0, 1, 1,
0.3486376, 0.913425, -0.3361943, 0, 0, 0, 1, 1,
0.3550793, 0.9010072, 1.924689, 0, 0, 0, 1, 1,
0.3601581, 1.121868, 0.03085566, 1, 1, 1, 1, 1,
0.368841, 0.1366775, 1.36741, 1, 1, 1, 1, 1,
0.3710866, -0.2833388, 2.314952, 1, 1, 1, 1, 1,
0.3734673, 0.3232281, 0.251178, 1, 1, 1, 1, 1,
0.3738887, -1.028926, 3.888197, 1, 1, 1, 1, 1,
0.3746696, -0.3250907, 2.61252, 1, 1, 1, 1, 1,
0.3761073, -0.1215248, 1.801054, 1, 1, 1, 1, 1,
0.3776818, -1.003703, 1.773043, 1, 1, 1, 1, 1,
0.3802853, 0.03007251, 0.8970781, 1, 1, 1, 1, 1,
0.3855318, -1.120185, 0.2303826, 1, 1, 1, 1, 1,
0.3856123, -0.01250436, 1.088508, 1, 1, 1, 1, 1,
0.387376, 0.5740781, 1.54498, 1, 1, 1, 1, 1,
0.3928373, -1.02233, 3.624135, 1, 1, 1, 1, 1,
0.3929656, 0.6714454, 0.9323562, 1, 1, 1, 1, 1,
0.3933963, 0.07020821, 0.5485771, 1, 1, 1, 1, 1,
0.398925, -1.719233, 2.44216, 0, 0, 1, 1, 1,
0.4011169, -0.2190032, 1.526947, 1, 0, 0, 1, 1,
0.4041503, -0.3136376, 4.742013, 1, 0, 0, 1, 1,
0.4052574, 0.81675, -0.1407878, 1, 0, 0, 1, 1,
0.4068107, -0.0379817, 3.91617, 1, 0, 0, 1, 1,
0.4095415, -0.8387654, 2.530074, 1, 0, 0, 1, 1,
0.4105967, 0.6904358, 1.806264, 0, 0, 0, 1, 1,
0.4114842, 0.4549605, -0.02422106, 0, 0, 0, 1, 1,
0.4116471, 0.6029066, 0.637875, 0, 0, 0, 1, 1,
0.4179676, 0.3831509, 0.3387768, 0, 0, 0, 1, 1,
0.4186086, -0.1249849, 2.476294, 0, 0, 0, 1, 1,
0.4186328, 1.677192, 1.189259, 0, 0, 0, 1, 1,
0.419247, -0.01101142, 1.714125, 0, 0, 0, 1, 1,
0.4202464, -1.141037, 2.744661, 1, 1, 1, 1, 1,
0.421571, 0.6191546, -0.06120226, 1, 1, 1, 1, 1,
0.4262562, -0.9458596, 2.123003, 1, 1, 1, 1, 1,
0.4271296, -0.8499206, 3.132411, 1, 1, 1, 1, 1,
0.4275271, -1.100475, 3.694156, 1, 1, 1, 1, 1,
0.4275672, 0.1718901, 1.729008, 1, 1, 1, 1, 1,
0.4329103, -0.8461856, 1.788118, 1, 1, 1, 1, 1,
0.4354313, 0.6561767, -0.0662884, 1, 1, 1, 1, 1,
0.4366369, -0.3976557, 2.376061, 1, 1, 1, 1, 1,
0.4386658, 1.878177, -0.7631218, 1, 1, 1, 1, 1,
0.4396073, 0.5675763, -0.00621017, 1, 1, 1, 1, 1,
0.4397493, -1.058867, 2.815372, 1, 1, 1, 1, 1,
0.4449668, -0.4064635, 2.378881, 1, 1, 1, 1, 1,
0.4463475, 0.3015534, -0.7326977, 1, 1, 1, 1, 1,
0.4484588, 1.360613, 0.9318844, 1, 1, 1, 1, 1,
0.4509892, 0.4251766, 1.393605, 0, 0, 1, 1, 1,
0.4525704, -0.3586479, 1.7581, 1, 0, 0, 1, 1,
0.4553702, -0.03465776, 2.149937, 1, 0, 0, 1, 1,
0.4571646, 0.6238083, 0.7654812, 1, 0, 0, 1, 1,
0.4588401, 0.907023, 1.305717, 1, 0, 0, 1, 1,
0.459365, 0.1155094, 1.576711, 1, 0, 0, 1, 1,
0.4616478, 0.7589949, 1.014242, 0, 0, 0, 1, 1,
0.4627285, 0.02801043, 0.1679619, 0, 0, 0, 1, 1,
0.4650565, 0.2127323, 2.409222, 0, 0, 0, 1, 1,
0.4660922, -0.3165642, 1.545081, 0, 0, 0, 1, 1,
0.4722398, 0.316847, 1.093846, 0, 0, 0, 1, 1,
0.473119, -1.315551, 2.998533, 0, 0, 0, 1, 1,
0.4740329, 0.2665339, 2.025295, 0, 0, 0, 1, 1,
0.4810793, -0.2559639, 2.653589, 1, 1, 1, 1, 1,
0.4834781, -0.5463234, 3.104085, 1, 1, 1, 1, 1,
0.4865445, 1.932024, 1.039506, 1, 1, 1, 1, 1,
0.4885395, 0.6519483, 0.06929952, 1, 1, 1, 1, 1,
0.496989, -2.398621, 4.887931, 1, 1, 1, 1, 1,
0.4970832, 2.298428, -0.505829, 1, 1, 1, 1, 1,
0.498548, 0.6185055, 0.9182496, 1, 1, 1, 1, 1,
0.503611, 0.2868739, -0.4180116, 1, 1, 1, 1, 1,
0.5040024, 0.8013264, 0.7632634, 1, 1, 1, 1, 1,
0.5103256, 0.4059955, 1.618257, 1, 1, 1, 1, 1,
0.5141849, -0.1815925, 1.500123, 1, 1, 1, 1, 1,
0.515443, 0.9262045, 0.0587474, 1, 1, 1, 1, 1,
0.5190887, 2.212842, -0.1025997, 1, 1, 1, 1, 1,
0.5269922, 0.8834125, 1.452395, 1, 1, 1, 1, 1,
0.5299725, -0.6352905, 3.70162, 1, 1, 1, 1, 1,
0.5336712, -0.4609441, 2.582615, 0, 0, 1, 1, 1,
0.5362336, 0.4217922, -0.739335, 1, 0, 0, 1, 1,
0.5363785, 0.4777128, 2.394916, 1, 0, 0, 1, 1,
0.5367948, 1.667085, 1.536377, 1, 0, 0, 1, 1,
0.5401251, 1.424999, 0.4788446, 1, 0, 0, 1, 1,
0.5440246, -1.069658, 2.33776, 1, 0, 0, 1, 1,
0.5447551, 1.957062, -0.9296986, 0, 0, 0, 1, 1,
0.5467085, -0.09119862, 2.402836, 0, 0, 0, 1, 1,
0.5550933, -0.1340894, 3.267302, 0, 0, 0, 1, 1,
0.5554932, -0.9072971, 0.7077742, 0, 0, 0, 1, 1,
0.5562917, 0.1546989, 0.5074751, 0, 0, 0, 1, 1,
0.5565581, 0.1156293, 3.874295, 0, 0, 0, 1, 1,
0.5569215, -1.462911, 2.815704, 0, 0, 0, 1, 1,
0.558836, 0.2550478, -0.03088401, 1, 1, 1, 1, 1,
0.5628848, -0.158309, 2.393562, 1, 1, 1, 1, 1,
0.5689502, 2.227032, 1.143697, 1, 1, 1, 1, 1,
0.5732383, 1.375074, 0.5491251, 1, 1, 1, 1, 1,
0.5732728, 0.1041492, 2.04986, 1, 1, 1, 1, 1,
0.5763072, -1.295662, 3.557873, 1, 1, 1, 1, 1,
0.577769, -0.2983913, 1.220093, 1, 1, 1, 1, 1,
0.5783674, 0.4684997, 1.901428, 1, 1, 1, 1, 1,
0.5788168, -1.089704, 1.38365, 1, 1, 1, 1, 1,
0.578901, -1.171188, 3.327339, 1, 1, 1, 1, 1,
0.5793275, -1.144291, 0.9637538, 1, 1, 1, 1, 1,
0.5833589, 0.06621204, 1.454042, 1, 1, 1, 1, 1,
0.592051, 0.4810067, -0.7784708, 1, 1, 1, 1, 1,
0.5926237, -0.7354155, 0.7656839, 1, 1, 1, 1, 1,
0.5927242, -1.680377, 2.773264, 1, 1, 1, 1, 1,
0.595368, -0.3073978, 3.318238, 0, 0, 1, 1, 1,
0.595582, 0.5823097, -1.226298, 1, 0, 0, 1, 1,
0.5974557, 0.4788836, -0.2173164, 1, 0, 0, 1, 1,
0.6003885, 1.351898, 2.045474, 1, 0, 0, 1, 1,
0.6022261, 0.7848036, 0.7406703, 1, 0, 0, 1, 1,
0.6038496, 0.2262376, 1.959454, 1, 0, 0, 1, 1,
0.6040931, 0.8064982, -0.4666279, 0, 0, 0, 1, 1,
0.6041116, -1.222699, 1.404123, 0, 0, 0, 1, 1,
0.6061313, 0.7872916, 0.07877972, 0, 0, 0, 1, 1,
0.6064358, 1.146369, 0.5162672, 0, 0, 0, 1, 1,
0.6070891, 1.306605, 1.805928, 0, 0, 0, 1, 1,
0.6101367, 0.386206, 0.3694268, 0, 0, 0, 1, 1,
0.6170259, 1.424699, 2.157379, 0, 0, 0, 1, 1,
0.6200641, -1.101761, 1.595505, 1, 1, 1, 1, 1,
0.6242698, -0.9159558, 3.392932, 1, 1, 1, 1, 1,
0.6304914, 1.046139, 0.7568159, 1, 1, 1, 1, 1,
0.631253, 1.554025, -0.3918568, 1, 1, 1, 1, 1,
0.6331829, -1.712498, 2.215112, 1, 1, 1, 1, 1,
0.6376119, 0.7092624, -0.3979597, 1, 1, 1, 1, 1,
0.6384931, -0.1519185, 3.963132, 1, 1, 1, 1, 1,
0.6387482, -0.02031841, 0.8660315, 1, 1, 1, 1, 1,
0.6399893, -0.7467179, 1.939704, 1, 1, 1, 1, 1,
0.6422353, 0.8967243, 0.5361951, 1, 1, 1, 1, 1,
0.643475, 0.5876042, -1.363031, 1, 1, 1, 1, 1,
0.6453467, -0.7723387, 2.79768, 1, 1, 1, 1, 1,
0.6457675, 0.5495777, 1.38737, 1, 1, 1, 1, 1,
0.6515526, -0.8614255, 2.471945, 1, 1, 1, 1, 1,
0.6608991, -0.2961789, 2.56696, 1, 1, 1, 1, 1,
0.6679325, 0.09770133, 1.951517, 0, 0, 1, 1, 1,
0.6713917, -0.79129, 3.148277, 1, 0, 0, 1, 1,
0.6725344, 0.6193385, 2.613496, 1, 0, 0, 1, 1,
0.6796956, 1.558298, 1.269386, 1, 0, 0, 1, 1,
0.6820403, 1.264504, 0.3548994, 1, 0, 0, 1, 1,
0.6824504, -0.9129403, 3.456814, 1, 0, 0, 1, 1,
0.6845924, 0.8421479, 1.690669, 0, 0, 0, 1, 1,
0.6892392, -0.3487414, 2.928719, 0, 0, 0, 1, 1,
0.6904843, -0.7957944, 1.733027, 0, 0, 0, 1, 1,
0.6912372, 0.8284466, -0.02343051, 0, 0, 0, 1, 1,
0.697781, 1.331959, 1.698009, 0, 0, 0, 1, 1,
0.7000889, 0.1588111, 1.29867, 0, 0, 0, 1, 1,
0.7011303, -1.406032, 2.861332, 0, 0, 0, 1, 1,
0.7029957, -0.4713308, 1.203984, 1, 1, 1, 1, 1,
0.7077813, 0.5267466, -1.010373, 1, 1, 1, 1, 1,
0.7190875, 0.1501783, 2.712397, 1, 1, 1, 1, 1,
0.724135, -1.097709, 1.65293, 1, 1, 1, 1, 1,
0.7342815, 1.544001, -0.2951426, 1, 1, 1, 1, 1,
0.7371374, 1.20568, -0.7668014, 1, 1, 1, 1, 1,
0.7466747, 0.3066597, 2.926875, 1, 1, 1, 1, 1,
0.7510211, -1.069003, 2.840021, 1, 1, 1, 1, 1,
0.7557932, 0.3993614, 1.40326, 1, 1, 1, 1, 1,
0.7611188, -0.4013236, 3.279449, 1, 1, 1, 1, 1,
0.7640954, -0.8707511, 1.890794, 1, 1, 1, 1, 1,
0.7657766, -0.1707319, 1.079156, 1, 1, 1, 1, 1,
0.7689303, 0.1762845, 1.354483, 1, 1, 1, 1, 1,
0.7703295, -1.431782, 1.957296, 1, 1, 1, 1, 1,
0.7749701, 0.283583, 2.898553, 1, 1, 1, 1, 1,
0.7781675, 2.59074, -0.8206586, 0, 0, 1, 1, 1,
0.7787947, 0.1601042, 0.3024755, 1, 0, 0, 1, 1,
0.7815629, 0.2534062, 0.09963191, 1, 0, 0, 1, 1,
0.7892632, 1.331088, 1.361678, 1, 0, 0, 1, 1,
0.7930164, -0.3483178, 0.3574249, 1, 0, 0, 1, 1,
0.7948402, -0.7069257, 2.65799, 1, 0, 0, 1, 1,
0.7967906, -0.2601982, -0.1155518, 0, 0, 0, 1, 1,
0.7990837, 0.3266694, 3.407894, 0, 0, 0, 1, 1,
0.80209, -2.184414, 3.728599, 0, 0, 0, 1, 1,
0.8078057, 0.8886561, -1.025982, 0, 0, 0, 1, 1,
0.8082606, -0.943818, 0.8859214, 0, 0, 0, 1, 1,
0.8083507, 0.2399812, 1.112594, 0, 0, 0, 1, 1,
0.8102774, -0.2411556, 3.143994, 0, 0, 0, 1, 1,
0.810987, 0.1866792, 2.122299, 1, 1, 1, 1, 1,
0.8163471, -0.2990453, 1.949974, 1, 1, 1, 1, 1,
0.8176953, -0.8789132, 2.36484, 1, 1, 1, 1, 1,
0.8186072, 0.5946916, 2.026957, 1, 1, 1, 1, 1,
0.8192283, 0.4567856, -0.7884714, 1, 1, 1, 1, 1,
0.8259404, 0.2190028, 1.352061, 1, 1, 1, 1, 1,
0.8294201, 0.453842, 0.8978686, 1, 1, 1, 1, 1,
0.8371832, 0.7128215, 0.5087566, 1, 1, 1, 1, 1,
0.8399711, 1.025619, 0.7575553, 1, 1, 1, 1, 1,
0.8402739, 1.001385, 1.933311, 1, 1, 1, 1, 1,
0.8428025, 0.01797654, 2.804105, 1, 1, 1, 1, 1,
0.8459931, 1.016368, 0.01649854, 1, 1, 1, 1, 1,
0.8506366, 0.6821168, -1.059168, 1, 1, 1, 1, 1,
0.8533146, 1.158509, -0.01245408, 1, 1, 1, 1, 1,
0.8626369, -1.058607, 1.87695, 1, 1, 1, 1, 1,
0.863192, 0.4738233, 0.2390805, 0, 0, 1, 1, 1,
0.8681262, 0.3752044, 1.189254, 1, 0, 0, 1, 1,
0.8773245, -0.7351752, 3.867845, 1, 0, 0, 1, 1,
0.890056, -0.08847837, 2.844105, 1, 0, 0, 1, 1,
0.8902975, 0.8171372, -0.1898779, 1, 0, 0, 1, 1,
0.8977274, 0.7384084, 2.406437, 1, 0, 0, 1, 1,
0.9022784, 1.356246, -0.6110216, 0, 0, 0, 1, 1,
0.9126733, 0.3379281, 2.338383, 0, 0, 0, 1, 1,
0.9128547, -1.016479, 1.36278, 0, 0, 0, 1, 1,
0.9178765, -0.9161189, 2.408508, 0, 0, 0, 1, 1,
0.9219142, 0.4386432, 1.362191, 0, 0, 0, 1, 1,
0.9240359, 0.2437095, 0.5196904, 0, 0, 0, 1, 1,
0.9254394, -1.091906, 3.988701, 0, 0, 0, 1, 1,
0.9260429, 0.5642297, 0.308769, 1, 1, 1, 1, 1,
0.9306484, -1.724422, 1.836223, 1, 1, 1, 1, 1,
0.9346567, 0.5268275, 2.278863, 1, 1, 1, 1, 1,
0.9628274, -0.6230399, 1.68753, 1, 1, 1, 1, 1,
0.9632164, 1.585819, -0.09968457, 1, 1, 1, 1, 1,
0.9638841, 0.05817273, 0.8080743, 1, 1, 1, 1, 1,
0.9722044, -0.7914408, 2.499656, 1, 1, 1, 1, 1,
0.9736645, -0.2911392, 1.980854, 1, 1, 1, 1, 1,
0.9802138, -0.1725166, 1.030455, 1, 1, 1, 1, 1,
0.9811705, 0.3368855, 2.478777, 1, 1, 1, 1, 1,
0.9867822, -0.7201281, -0.2984667, 1, 1, 1, 1, 1,
0.9877831, 0.6615895, 0.4217721, 1, 1, 1, 1, 1,
0.9931762, 0.9531907, 0.1659529, 1, 1, 1, 1, 1,
1.000894, 0.7693307, 1.438874, 1, 1, 1, 1, 1,
1.013248, 2.436187, 1.112783, 1, 1, 1, 1, 1,
1.016449, 1.046096, 2.040959, 0, 0, 1, 1, 1,
1.026638, -0.5009907, 2.060943, 1, 0, 0, 1, 1,
1.0402, 0.2267741, 1.812439, 1, 0, 0, 1, 1,
1.04025, 1.828252, 0.290252, 1, 0, 0, 1, 1,
1.041846, -0.9580234, 1.236271, 1, 0, 0, 1, 1,
1.044677, -1.892817, 4.071717, 1, 0, 0, 1, 1,
1.049844, -2.086546, 3.188454, 0, 0, 0, 1, 1,
1.051207, -1.073561, 2.11975, 0, 0, 0, 1, 1,
1.062594, 0.05132614, 1.04839, 0, 0, 0, 1, 1,
1.066949, -0.8674728, 1.361406, 0, 0, 0, 1, 1,
1.069878, -0.2829406, 2.027285, 0, 0, 0, 1, 1,
1.072463, -2.072545, 3.190883, 0, 0, 0, 1, 1,
1.090885, 0.9031053, 2.030923, 0, 0, 0, 1, 1,
1.094262, -0.5708903, 1.62908, 1, 1, 1, 1, 1,
1.102565, -0.3841197, 1.575618, 1, 1, 1, 1, 1,
1.104649, -1.35544, 2.196675, 1, 1, 1, 1, 1,
1.118335, 0.3812741, 1.364894, 1, 1, 1, 1, 1,
1.126009, 0.7530822, 1.838111, 1, 1, 1, 1, 1,
1.138676, 0.9603693, -0.946718, 1, 1, 1, 1, 1,
1.140959, -0.5554969, 1.373893, 1, 1, 1, 1, 1,
1.141276, -1.609395, 2.421326, 1, 1, 1, 1, 1,
1.142205, 0.9770716, 1.012327, 1, 1, 1, 1, 1,
1.144079, -0.5692127, 3.086917, 1, 1, 1, 1, 1,
1.150038, -1.102847, 3.321815, 1, 1, 1, 1, 1,
1.156939, -0.1227512, -0.2384702, 1, 1, 1, 1, 1,
1.164668, 0.4275658, 0.4422412, 1, 1, 1, 1, 1,
1.171455, -1.983794, 2.368234, 1, 1, 1, 1, 1,
1.174805, -0.7353154, 4.431866, 1, 1, 1, 1, 1,
1.181384, -1.003887, 1.967788, 0, 0, 1, 1, 1,
1.198316, -1.178062, 1.912537, 1, 0, 0, 1, 1,
1.204944, -0.7529167, 2.956136, 1, 0, 0, 1, 1,
1.208492, 0.45877, 2.845614, 1, 0, 0, 1, 1,
1.209372, -0.6355645, 2.356594, 1, 0, 0, 1, 1,
1.224319, -1.37566, 2.031837, 1, 0, 0, 1, 1,
1.226433, 1.869801, 0.7563093, 0, 0, 0, 1, 1,
1.229678, 1.361496, -0.4958282, 0, 0, 0, 1, 1,
1.230916, -1.781439, 1.745261, 0, 0, 0, 1, 1,
1.236398, -0.233632, 0.5054757, 0, 0, 0, 1, 1,
1.240521, 1.612385, 0.000619602, 0, 0, 0, 1, 1,
1.242824, -0.651167, 3.494404, 0, 0, 0, 1, 1,
1.249614, -1.077793, 1.252054, 0, 0, 0, 1, 1,
1.251596, -1.283703, 1.612632, 1, 1, 1, 1, 1,
1.268633, -0.6958607, 1.951903, 1, 1, 1, 1, 1,
1.272342, -0.7681296, 1.458807, 1, 1, 1, 1, 1,
1.292745, -1.490584, 3.086749, 1, 1, 1, 1, 1,
1.302209, -3.264994, 3.51049, 1, 1, 1, 1, 1,
1.305496, -0.1541592, 2.869549, 1, 1, 1, 1, 1,
1.310234, 0.7009293, 0.0508585, 1, 1, 1, 1, 1,
1.322678, 1.178434, 0.2581535, 1, 1, 1, 1, 1,
1.329087, -0.5646566, 1.827076, 1, 1, 1, 1, 1,
1.329936, 0.4070885, 1.438168, 1, 1, 1, 1, 1,
1.337919, 0.7183892, 1.493397, 1, 1, 1, 1, 1,
1.349403, -0.899278, 2.455084, 1, 1, 1, 1, 1,
1.3547, 0.2741889, 1.249099, 1, 1, 1, 1, 1,
1.357225, 0.5023338, 2.25074, 1, 1, 1, 1, 1,
1.359932, -0.5853068, 3.974159, 1, 1, 1, 1, 1,
1.363716, -0.7513175, 2.32387, 0, 0, 1, 1, 1,
1.367264, -0.9934193, 3.253953, 1, 0, 0, 1, 1,
1.368663, 0.970886, 0.5126066, 1, 0, 0, 1, 1,
1.376057, 0.3997418, 1.066674, 1, 0, 0, 1, 1,
1.376327, 0.8633456, 0.4831004, 1, 0, 0, 1, 1,
1.378152, -1.332772, 2.222564, 1, 0, 0, 1, 1,
1.396109, 0.4380474, 3.1125, 0, 0, 0, 1, 1,
1.397075, 1.068246, 0.4834607, 0, 0, 0, 1, 1,
1.40475, 1.01974, -0.451603, 0, 0, 0, 1, 1,
1.410483, -0.8627858, 0.666154, 0, 0, 0, 1, 1,
1.42454, -0.06540801, 1.484235, 0, 0, 0, 1, 1,
1.425778, 0.5881184, 1.271415, 0, 0, 0, 1, 1,
1.427131, -0.01612629, 0.9513466, 0, 0, 0, 1, 1,
1.436191, -0.9537911, 1.840164, 1, 1, 1, 1, 1,
1.437352, 0.1532448, -0.5176539, 1, 1, 1, 1, 1,
1.438985, -0.6115709, 1.801994, 1, 1, 1, 1, 1,
1.443583, 0.8643916, -1.423727, 1, 1, 1, 1, 1,
1.445473, -1.312576, 2.241421, 1, 1, 1, 1, 1,
1.460268, 0.7426947, 0.933251, 1, 1, 1, 1, 1,
1.465927, 0.452546, 1.836114, 1, 1, 1, 1, 1,
1.468494, 1.355274, 1.478108, 1, 1, 1, 1, 1,
1.480804, 0.2835251, 2.109229, 1, 1, 1, 1, 1,
1.482218, 0.6674714, 0.4720192, 1, 1, 1, 1, 1,
1.517491, -0.7587628, 2.973867, 1, 1, 1, 1, 1,
1.520039, -0.8351263, 1.294997, 1, 1, 1, 1, 1,
1.527088, -1.087889, 0.934782, 1, 1, 1, 1, 1,
1.54623, 1.319256, 1.178691, 1, 1, 1, 1, 1,
1.548304, -0.06054897, 0.7063571, 1, 1, 1, 1, 1,
1.549984, 1.300611, 1.669634, 0, 0, 1, 1, 1,
1.56497, 1.258044, 1.697593, 1, 0, 0, 1, 1,
1.58259, -0.02129153, 1.578363, 1, 0, 0, 1, 1,
1.598215, 1.555754, -1.55694, 1, 0, 0, 1, 1,
1.60896, -0.01536498, 2.16323, 1, 0, 0, 1, 1,
1.612452, -0.4903239, 0.7878047, 1, 0, 0, 1, 1,
1.621178, -0.2856968, 2.256688, 0, 0, 0, 1, 1,
1.651129, 0.141391, 2.416106, 0, 0, 0, 1, 1,
1.66025, 0.7933766, -0.07392558, 0, 0, 0, 1, 1,
1.693402, 0.1212212, 0.7299126, 0, 0, 0, 1, 1,
1.701307, -1.166004, 0.7964467, 0, 0, 0, 1, 1,
1.703696, 0.1191955, 2.091986, 0, 0, 0, 1, 1,
1.717862, -0.1808871, 0.9807546, 0, 0, 0, 1, 1,
1.749627, 1.713337, 0.7042968, 1, 1, 1, 1, 1,
1.759901, -1.40062, 3.496214, 1, 1, 1, 1, 1,
1.776338, -0.3010117, 3.479189, 1, 1, 1, 1, 1,
1.784986, -1.415494, 2.788079, 1, 1, 1, 1, 1,
1.786901, 0.3765491, -0.4092427, 1, 1, 1, 1, 1,
1.792995, -0.2285258, 0.6538932, 1, 1, 1, 1, 1,
1.815951, -0.3077933, 1.4196, 1, 1, 1, 1, 1,
1.842049, 1.870984, 1.208894, 1, 1, 1, 1, 1,
1.845306, 0.3145159, 0.580586, 1, 1, 1, 1, 1,
1.863446, -0.05246131, 2.661576, 1, 1, 1, 1, 1,
1.869517, 0.3851036, -0.347461, 1, 1, 1, 1, 1,
1.896356, -0.08478456, -0.58095, 1, 1, 1, 1, 1,
1.927105, -0.1766617, 1.152782, 1, 1, 1, 1, 1,
1.951092, 0.2366026, 3.547163, 1, 1, 1, 1, 1,
1.952739, 0.2177349, 2.18487, 1, 1, 1, 1, 1,
1.97478, 0.4482969, 1.973845, 0, 0, 1, 1, 1,
2.001079, 0.03941587, 1.276622, 1, 0, 0, 1, 1,
2.009488, -0.8733287, 1.782843, 1, 0, 0, 1, 1,
2.059202, 0.7367473, 0.5349623, 1, 0, 0, 1, 1,
2.066332, -0.248533, 1.674767, 1, 0, 0, 1, 1,
2.089227, 2.200449, 1.2944, 1, 0, 0, 1, 1,
2.119409, 0.9581624, 1.064773, 0, 0, 0, 1, 1,
2.170575, 1.33032, 0.4941184, 0, 0, 0, 1, 1,
2.204988, -0.1076262, 0.4608994, 0, 0, 0, 1, 1,
2.241684, -0.7312072, 3.282774, 0, 0, 0, 1, 1,
2.276522, -0.3512357, 1.036001, 0, 0, 0, 1, 1,
2.296958, -0.4099458, 1.485358, 0, 0, 0, 1, 1,
2.403922, 1.969837, 0.7932562, 0, 0, 0, 1, 1,
2.411228, 0.002966757, 0.2107525, 1, 1, 1, 1, 1,
2.46345, 0.4838623, 0.8833267, 1, 1, 1, 1, 1,
2.480212, 0.4487019, 0.6921172, 1, 1, 1, 1, 1,
2.48818, -0.9946406, 2.202079, 1, 1, 1, 1, 1,
2.574224, 0.2438271, 2.76505, 1, 1, 1, 1, 1,
2.758797, -0.7369004, 4.537293, 1, 1, 1, 1, 1,
2.973554, 0.5705305, 0.2769762, 1, 1, 1, 1, 1
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
var radius = 9.209216;
var distance = 32.34698;
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
mvMatrix.translate( 0.120536, 0.3071649, 0.2492216 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.34698);
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
