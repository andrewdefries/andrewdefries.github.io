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
-2.796291, 2.080554, 0.7891862, 1, 0, 0, 1,
-2.60586, -0.2882046, -2.214459, 1, 0.007843138, 0, 1,
-2.5373, -0.9301422, -1.414253, 1, 0.01176471, 0, 1,
-2.449579, 0.4919866, -0.01410744, 1, 0.01960784, 0, 1,
-2.416146, 0.2398098, -2.682807, 1, 0.02352941, 0, 1,
-2.415501, -0.54434, -2.438703, 1, 0.03137255, 0, 1,
-2.404253, 0.3439347, -0.0161577, 1, 0.03529412, 0, 1,
-2.386158, -1.335084, -2.228139, 1, 0.04313726, 0, 1,
-2.360472, -1.389304, -1.776449, 1, 0.04705882, 0, 1,
-2.331043, -0.9397332, -2.292407, 1, 0.05490196, 0, 1,
-2.284572, -0.1365451, -1.378288, 1, 0.05882353, 0, 1,
-2.265607, 0.03243771, -2.224438, 1, 0.06666667, 0, 1,
-2.220948, -0.06323908, -0.4716897, 1, 0.07058824, 0, 1,
-2.189876, 1.793066, -0.6759666, 1, 0.07843138, 0, 1,
-2.168874, 0.4848721, -1.247728, 1, 0.08235294, 0, 1,
-2.165857, -1.240218, -1.440719, 1, 0.09019608, 0, 1,
-2.14614, 0.4377173, -2.656142, 1, 0.09411765, 0, 1,
-2.098477, 1.511797, -1.400338, 1, 0.1019608, 0, 1,
-2.083055, 0.7661582, -0.8453965, 1, 0.1098039, 0, 1,
-2.036093, 0.2851329, -2.81135, 1, 0.1137255, 0, 1,
-2.035801, 0.2717164, -2.375576, 1, 0.1215686, 0, 1,
-2.022882, 3.304992, -0.6204109, 1, 0.1254902, 0, 1,
-1.974552, 0.8281853, -1.244862, 1, 0.1333333, 0, 1,
-1.968006, 1.890914, -1.841088, 1, 0.1372549, 0, 1,
-1.961262, -0.3150322, -1.547261, 1, 0.145098, 0, 1,
-1.938628, 1.174698, 0.76226, 1, 0.1490196, 0, 1,
-1.938504, 0.3130939, -0.3904325, 1, 0.1568628, 0, 1,
-1.872441, 0.4938746, -0.3768862, 1, 0.1607843, 0, 1,
-1.854657, 0.1767645, -2.876304, 1, 0.1686275, 0, 1,
-1.822001, 0.44482, -3.373133, 1, 0.172549, 0, 1,
-1.808852, 1.02062, -0.2877895, 1, 0.1803922, 0, 1,
-1.800486, 1.62044, -1.483733, 1, 0.1843137, 0, 1,
-1.784623, -1.646106, -1.725929, 1, 0.1921569, 0, 1,
-1.784544, 1.458955, -1.412085, 1, 0.1960784, 0, 1,
-1.762674, 0.6305552, -1.438997, 1, 0.2039216, 0, 1,
-1.752657, -0.1107617, -2.068327, 1, 0.2117647, 0, 1,
-1.727868, 0.1975696, -0.8594596, 1, 0.2156863, 0, 1,
-1.716768, -2.411126, -5.161614, 1, 0.2235294, 0, 1,
-1.658372, -0.04254717, -1.367669, 1, 0.227451, 0, 1,
-1.643111, 2.305723, -2.119385, 1, 0.2352941, 0, 1,
-1.642202, -0.4906413, -2.221068, 1, 0.2392157, 0, 1,
-1.635695, -0.9135549, -0.3244508, 1, 0.2470588, 0, 1,
-1.619834, -1.370294, -1.921935, 1, 0.2509804, 0, 1,
-1.613475, -0.5823167, -1.921319, 1, 0.2588235, 0, 1,
-1.601685, -0.7684405, -1.539721, 1, 0.2627451, 0, 1,
-1.600809, -1.113651, -2.434309, 1, 0.2705882, 0, 1,
-1.579013, 0.1719397, -1.846526, 1, 0.2745098, 0, 1,
-1.567612, -1.197694, -2.789208, 1, 0.282353, 0, 1,
-1.564641, -0.06573547, -2.082127, 1, 0.2862745, 0, 1,
-1.541408, -0.06832331, -3.04739, 1, 0.2941177, 0, 1,
-1.538021, -1.357445, -3.691172, 1, 0.3019608, 0, 1,
-1.505717, -1.393896, -2.675238, 1, 0.3058824, 0, 1,
-1.489639, 1.705216, -1.802538, 1, 0.3137255, 0, 1,
-1.476281, 0.4113313, 0.2841493, 1, 0.3176471, 0, 1,
-1.474849, 0.6021218, -0.968399, 1, 0.3254902, 0, 1,
-1.467245, -0.7887152, -1.708972, 1, 0.3294118, 0, 1,
-1.466412, 2.498671, -1.190871, 1, 0.3372549, 0, 1,
-1.460437, -0.06698733, -0.5659085, 1, 0.3411765, 0, 1,
-1.455348, 0.3878697, -1.959979, 1, 0.3490196, 0, 1,
-1.453055, 0.1636888, -1.223388, 1, 0.3529412, 0, 1,
-1.450593, 0.9310329, 0.105955, 1, 0.3607843, 0, 1,
-1.45041, -0.8735065, -2.608147, 1, 0.3647059, 0, 1,
-1.445346, -0.3198328, -1.940488, 1, 0.372549, 0, 1,
-1.443841, -0.9905245, -2.767662, 1, 0.3764706, 0, 1,
-1.44243, 1.246634, -1.916721, 1, 0.3843137, 0, 1,
-1.439196, 1.141061, -0.6735053, 1, 0.3882353, 0, 1,
-1.438449, 0.2894141, -1.191403, 1, 0.3960784, 0, 1,
-1.432728, 1.036099, 0.1121764, 1, 0.4039216, 0, 1,
-1.432123, 0.09466782, -1.873333, 1, 0.4078431, 0, 1,
-1.42527, -1.091595, -4.190393, 1, 0.4156863, 0, 1,
-1.424473, -0.5516096, -2.873222, 1, 0.4196078, 0, 1,
-1.410369, -0.73784, -3.506538, 1, 0.427451, 0, 1,
-1.409198, 0.5734866, 0.3187872, 1, 0.4313726, 0, 1,
-1.4061, -0.250436, -1.239225, 1, 0.4392157, 0, 1,
-1.403738, 1.399568, 0.6854511, 1, 0.4431373, 0, 1,
-1.393684, 0.4119761, -1.691365, 1, 0.4509804, 0, 1,
-1.39, 0.2295703, -0.9505118, 1, 0.454902, 0, 1,
-1.388972, 1.861903, -0.9143977, 1, 0.4627451, 0, 1,
-1.38593, 0.3876225, -2.347888, 1, 0.4666667, 0, 1,
-1.376687, 1.024368, -1.056491, 1, 0.4745098, 0, 1,
-1.376115, -0.5010251, -1.932725, 1, 0.4784314, 0, 1,
-1.376103, 1.817726, 0.101514, 1, 0.4862745, 0, 1,
-1.375363, 0.1655242, -2.062149, 1, 0.4901961, 0, 1,
-1.362902, -0.01948358, -1.250078, 1, 0.4980392, 0, 1,
-1.356769, -1.224352, -1.522069, 1, 0.5058824, 0, 1,
-1.348972, 0.647534, -0.9473443, 1, 0.509804, 0, 1,
-1.347819, 0.04275615, -1.488791, 1, 0.5176471, 0, 1,
-1.341988, 0.2777182, -2.521729, 1, 0.5215687, 0, 1,
-1.333711, 1.536599, -0.003991012, 1, 0.5294118, 0, 1,
-1.332592, 1.951794, -0.6906448, 1, 0.5333334, 0, 1,
-1.321234, -0.4063183, -1.455893, 1, 0.5411765, 0, 1,
-1.316629, -1.260719, -1.114805, 1, 0.5450981, 0, 1,
-1.311016, -0.1595772, -2.654953, 1, 0.5529412, 0, 1,
-1.309752, -0.6757984, -3.700875, 1, 0.5568628, 0, 1,
-1.295263, 0.08565294, -1.431164, 1, 0.5647059, 0, 1,
-1.280213, 1.017585, -0.2780347, 1, 0.5686275, 0, 1,
-1.273215, -1.609663, -1.777722, 1, 0.5764706, 0, 1,
-1.267631, -0.493537, -1.328187, 1, 0.5803922, 0, 1,
-1.265109, 0.7111699, -0.2909395, 1, 0.5882353, 0, 1,
-1.264423, -0.7594281, -1.531132, 1, 0.5921569, 0, 1,
-1.250454, 1.033979, -2.489806, 1, 0.6, 0, 1,
-1.250306, 0.6736442, -0.4366523, 1, 0.6078432, 0, 1,
-1.247529, -0.6266049, -2.983662, 1, 0.6117647, 0, 1,
-1.24378, -2.158833, -1.787242, 1, 0.6196079, 0, 1,
-1.23811, -0.4116056, -2.038108, 1, 0.6235294, 0, 1,
-1.231005, -0.7572219, -2.162986, 1, 0.6313726, 0, 1,
-1.22418, -1.88028, -0.3868547, 1, 0.6352941, 0, 1,
-1.223484, -1.84032, -0.7322968, 1, 0.6431373, 0, 1,
-1.216404, 0.9145917, -2.539489, 1, 0.6470588, 0, 1,
-1.210626, 0.5589088, -3.125698, 1, 0.654902, 0, 1,
-1.19626, 1.40135, 1.421842, 1, 0.6588235, 0, 1,
-1.19059, -0.5718258, -2.392134, 1, 0.6666667, 0, 1,
-1.190112, -0.6470219, -1.529812, 1, 0.6705883, 0, 1,
-1.184823, 2.591164, -1.724607, 1, 0.6784314, 0, 1,
-1.180837, 0.3074948, -2.163439, 1, 0.682353, 0, 1,
-1.173307, -0.1720031, -0.6169654, 1, 0.6901961, 0, 1,
-1.16866, 1.818328, -1.571542, 1, 0.6941177, 0, 1,
-1.162676, 0.6514992, -0.9862593, 1, 0.7019608, 0, 1,
-1.160954, 0.4669113, -1.78132, 1, 0.7098039, 0, 1,
-1.150404, -2.909961, -1.895809, 1, 0.7137255, 0, 1,
-1.137999, 0.1639418, -0.7432954, 1, 0.7215686, 0, 1,
-1.137681, 1.271442, -0.3125083, 1, 0.7254902, 0, 1,
-1.133262, -0.6452299, -3.013884, 1, 0.7333333, 0, 1,
-1.133194, 0.5376174, -1.455663, 1, 0.7372549, 0, 1,
-1.131997, 0.7132025, -0.01376707, 1, 0.7450981, 0, 1,
-1.123081, 0.06592627, -1.488045, 1, 0.7490196, 0, 1,
-1.121805, 0.1795833, -0.5496813, 1, 0.7568628, 0, 1,
-1.11608, 0.1550723, -3.149616, 1, 0.7607843, 0, 1,
-1.106207, -0.09297618, -1.807831, 1, 0.7686275, 0, 1,
-1.104461, 0.6352217, -2.844601, 1, 0.772549, 0, 1,
-1.095625, 0.05257022, -0.6982533, 1, 0.7803922, 0, 1,
-1.095333, 0.6521209, -1.141727, 1, 0.7843137, 0, 1,
-1.085505, 0.7757272, 0.07087526, 1, 0.7921569, 0, 1,
-1.081043, 0.8551894, -1.460504, 1, 0.7960784, 0, 1,
-1.079955, -0.7184077, -2.244944, 1, 0.8039216, 0, 1,
-1.079714, 1.385133, -0.734774, 1, 0.8117647, 0, 1,
-1.066203, 1.189739, -0.6638675, 1, 0.8156863, 0, 1,
-1.06013, -0.7029667, -3.97536, 1, 0.8235294, 0, 1,
-1.0558, 0.2642036, -1.853907, 1, 0.827451, 0, 1,
-1.052427, -0.2068203, -2.663754, 1, 0.8352941, 0, 1,
-1.049251, 0.1763298, -0.297421, 1, 0.8392157, 0, 1,
-1.032312, -0.5665363, -1.860148, 1, 0.8470588, 0, 1,
-1.030336, 0.6827881, -1.048205, 1, 0.8509804, 0, 1,
-1.026587, -0.6392119, -2.555748, 1, 0.8588235, 0, 1,
-1.019377, 2.46411, 0.006394678, 1, 0.8627451, 0, 1,
-1.016924, -0.07426359, -0.6842115, 1, 0.8705882, 0, 1,
-1.016069, 0.7409602, -1.238764, 1, 0.8745098, 0, 1,
-1.010455, 0.6989377, -2.980321, 1, 0.8823529, 0, 1,
-1.006827, -1.456678, -0.908796, 1, 0.8862745, 0, 1,
-1.006247, -0.6522116, -2.879678, 1, 0.8941177, 0, 1,
-1.004544, 1.122842, -0.8201829, 1, 0.8980392, 0, 1,
-1.004079, 2.574664, -0.9941621, 1, 0.9058824, 0, 1,
-0.9980999, -0.8733521, -3.254897, 1, 0.9137255, 0, 1,
-0.9941583, 0.3608479, -1.043081, 1, 0.9176471, 0, 1,
-0.993457, -1.952724, -3.08236, 1, 0.9254902, 0, 1,
-0.9925424, -0.3027191, -0.4587565, 1, 0.9294118, 0, 1,
-0.9895394, 0.06952324, -1.0461, 1, 0.9372549, 0, 1,
-0.986233, -0.4948858, -1.250849, 1, 0.9411765, 0, 1,
-0.98234, -0.972154, -3.661225, 1, 0.9490196, 0, 1,
-0.9817044, 1.131849, -0.7057202, 1, 0.9529412, 0, 1,
-0.9809782, -1.540381, -1.580948, 1, 0.9607843, 0, 1,
-0.9788916, 1.440062, -0.01614428, 1, 0.9647059, 0, 1,
-0.9748377, 0.99864, -1.635208, 1, 0.972549, 0, 1,
-0.9694057, 2.19321, -1.677491, 1, 0.9764706, 0, 1,
-0.947989, 0.9447871, -0.4257859, 1, 0.9843137, 0, 1,
-0.9458207, -1.613935, -3.187407, 1, 0.9882353, 0, 1,
-0.9444973, 0.4975061, -2.423974, 1, 0.9960784, 0, 1,
-0.9441855, 2.045155, -0.06409786, 0.9960784, 1, 0, 1,
-0.9408591, 1.056848, -0.4457633, 0.9921569, 1, 0, 1,
-0.9381519, 1.60379, 0.9272979, 0.9843137, 1, 0, 1,
-0.9358848, 0.7777673, -2.757429, 0.9803922, 1, 0, 1,
-0.9305056, -0.7095633, -1.037999, 0.972549, 1, 0, 1,
-0.9254864, 0.3254906, -2.362362, 0.9686275, 1, 0, 1,
-0.9217907, -0.4309484, -2.052316, 0.9607843, 1, 0, 1,
-0.9191314, 0.1940363, -0.8379791, 0.9568627, 1, 0, 1,
-0.9175265, 0.781673, -0.6239525, 0.9490196, 1, 0, 1,
-0.9157767, -1.956965, -2.893558, 0.945098, 1, 0, 1,
-0.90891, -0.2727382, -0.7732729, 0.9372549, 1, 0, 1,
-0.9082116, 1.95039, -2.177827, 0.9333333, 1, 0, 1,
-0.9047508, 0.2813224, -1.989733, 0.9254902, 1, 0, 1,
-0.9034591, 2.287846, 2.971311, 0.9215686, 1, 0, 1,
-0.902521, -0.4594857, -2.699664, 0.9137255, 1, 0, 1,
-0.900747, -0.4103509, -2.859742, 0.9098039, 1, 0, 1,
-0.8985763, -2.565408, -3.545548, 0.9019608, 1, 0, 1,
-0.8911659, 1.083932, -0.2360234, 0.8941177, 1, 0, 1,
-0.8893762, 0.1479863, -0.7751973, 0.8901961, 1, 0, 1,
-0.878059, 1.070929, -1.556004, 0.8823529, 1, 0, 1,
-0.8739327, -2.289538, -2.016739, 0.8784314, 1, 0, 1,
-0.8697919, 0.4191885, -0.03704135, 0.8705882, 1, 0, 1,
-0.8681955, -0.03061822, -1.026264, 0.8666667, 1, 0, 1,
-0.868016, 1.124783, -0.372488, 0.8588235, 1, 0, 1,
-0.8622685, 1.136024, -1.129895, 0.854902, 1, 0, 1,
-0.8618011, -0.9113799, -1.488329, 0.8470588, 1, 0, 1,
-0.8580906, -0.889816, -2.240025, 0.8431373, 1, 0, 1,
-0.85155, 1.257787, -1.473602, 0.8352941, 1, 0, 1,
-0.8446769, -1.100357, -2.553105, 0.8313726, 1, 0, 1,
-0.8443195, 0.9041908, -0.4741328, 0.8235294, 1, 0, 1,
-0.8438504, -1.013964, -1.744897, 0.8196079, 1, 0, 1,
-0.842388, 0.1770652, -2.296032, 0.8117647, 1, 0, 1,
-0.8415752, 1.032191, -3.210076, 0.8078431, 1, 0, 1,
-0.8390321, 0.5196292, -2.281607, 0.8, 1, 0, 1,
-0.8349105, -1.913437, -2.704774, 0.7921569, 1, 0, 1,
-0.8296235, -0.3510843, -3.144271, 0.7882353, 1, 0, 1,
-0.8296077, 0.8826512, 0.1774464, 0.7803922, 1, 0, 1,
-0.8289173, 2.011834, -0.8124647, 0.7764706, 1, 0, 1,
-0.8266588, -0.1530266, -1.516751, 0.7686275, 1, 0, 1,
-0.8258783, 0.3926957, 1.164127, 0.7647059, 1, 0, 1,
-0.8212433, 0.5311658, -0.5999047, 0.7568628, 1, 0, 1,
-0.8208595, 2.242259, 0.258306, 0.7529412, 1, 0, 1,
-0.8207341, -0.9061337, -2.47946, 0.7450981, 1, 0, 1,
-0.8174304, -0.6707621, -4.084001, 0.7411765, 1, 0, 1,
-0.8160946, -0.2410041, -2.206517, 0.7333333, 1, 0, 1,
-0.814571, -0.8869144, -0.7110268, 0.7294118, 1, 0, 1,
-0.8127823, -1.587523, -2.489596, 0.7215686, 1, 0, 1,
-0.8119329, 0.03055504, -0.3015835, 0.7176471, 1, 0, 1,
-0.8054857, 0.8417209, -1.618684, 0.7098039, 1, 0, 1,
-0.8041387, -0.7547092, -1.116636, 0.7058824, 1, 0, 1,
-0.7965379, -0.8052738, -3.496715, 0.6980392, 1, 0, 1,
-0.7938265, -0.2935537, -1.517888, 0.6901961, 1, 0, 1,
-0.7923124, 0.7094476, 0.179455, 0.6862745, 1, 0, 1,
-0.78901, 0.4108465, -1.507482, 0.6784314, 1, 0, 1,
-0.7882594, -0.4184693, -1.86894, 0.6745098, 1, 0, 1,
-0.7878878, 0.09310105, -2.602465, 0.6666667, 1, 0, 1,
-0.7811908, -3.644016, -3.318356, 0.6627451, 1, 0, 1,
-0.7646642, -0.1456357, -2.761141, 0.654902, 1, 0, 1,
-0.7644015, 0.5470008, -1.87982, 0.6509804, 1, 0, 1,
-0.7639329, 0.6783892, -0.7511851, 0.6431373, 1, 0, 1,
-0.7569039, -0.3418491, -2.871608, 0.6392157, 1, 0, 1,
-0.7432722, -0.8896973, -2.179245, 0.6313726, 1, 0, 1,
-0.7404667, -0.5353038, -1.678523, 0.627451, 1, 0, 1,
-0.7397144, 1.228332, -0.3824344, 0.6196079, 1, 0, 1,
-0.7337235, -0.8708934, -2.89784, 0.6156863, 1, 0, 1,
-0.7291149, 0.2864458, -2.070572, 0.6078432, 1, 0, 1,
-0.7249287, -0.4540265, -1.779424, 0.6039216, 1, 0, 1,
-0.7217427, 0.6530157, -2.39159, 0.5960785, 1, 0, 1,
-0.7186579, -1.650151, -3.317695, 0.5882353, 1, 0, 1,
-0.7152028, 0.1433444, -0.938379, 0.5843138, 1, 0, 1,
-0.7148074, 0.575191, -1.133968, 0.5764706, 1, 0, 1,
-0.7135564, 1.071199, -0.4739974, 0.572549, 1, 0, 1,
-0.7089313, -1.324072, -1.905842, 0.5647059, 1, 0, 1,
-0.7032102, -0.763738, -1.701139, 0.5607843, 1, 0, 1,
-0.7023806, -0.03462055, -2.238142, 0.5529412, 1, 0, 1,
-0.7016775, 0.7542737, -0.07771153, 0.5490196, 1, 0, 1,
-0.6990958, 0.07555611, -1.274638, 0.5411765, 1, 0, 1,
-0.6981925, 1.362497, -0.4614437, 0.5372549, 1, 0, 1,
-0.6921524, -0.5218031, -3.386973, 0.5294118, 1, 0, 1,
-0.6902639, -1.201626, -3.175824, 0.5254902, 1, 0, 1,
-0.6894472, 0.3854365, -1.332562, 0.5176471, 1, 0, 1,
-0.6866753, -0.6447307, -2.465062, 0.5137255, 1, 0, 1,
-0.6830913, 0.5074621, -0.9967329, 0.5058824, 1, 0, 1,
-0.6828688, 1.639767, 1.60399, 0.5019608, 1, 0, 1,
-0.6777109, 1.211827, -0.07630607, 0.4941176, 1, 0, 1,
-0.6723505, 0.6408992, 0.5256705, 0.4862745, 1, 0, 1,
-0.6719872, -2.196333, -2.135067, 0.4823529, 1, 0, 1,
-0.6690894, 1.118586, -0.1502482, 0.4745098, 1, 0, 1,
-0.6667699, -0.4751411, -0.3090643, 0.4705882, 1, 0, 1,
-0.6591594, -0.7249081, -2.463164, 0.4627451, 1, 0, 1,
-0.6543257, 0.5650502, 0.1952122, 0.4588235, 1, 0, 1,
-0.6536798, -1.500359, -3.115298, 0.4509804, 1, 0, 1,
-0.6535376, -0.4935597, -3.586859, 0.4470588, 1, 0, 1,
-0.6524958, -0.752459, -2.782479, 0.4392157, 1, 0, 1,
-0.6480178, 1.447407, -1.914683, 0.4352941, 1, 0, 1,
-0.6460915, 0.8743883, -1.664955, 0.427451, 1, 0, 1,
-0.6453418, -1.747624, -2.383277, 0.4235294, 1, 0, 1,
-0.6443958, -1.260333, -1.602283, 0.4156863, 1, 0, 1,
-0.6382274, 0.03819182, -0.3018336, 0.4117647, 1, 0, 1,
-0.6316501, 2.596132, -1.016728, 0.4039216, 1, 0, 1,
-0.631506, 0.4516266, -0.4084475, 0.3960784, 1, 0, 1,
-0.6309557, -1.071324, -2.843608, 0.3921569, 1, 0, 1,
-0.6256171, -0.7330745, -1.589768, 0.3843137, 1, 0, 1,
-0.6233332, -0.5260914, -1.723879, 0.3803922, 1, 0, 1,
-0.6221203, 0.3381474, -1.629432, 0.372549, 1, 0, 1,
-0.6126343, -1.549379, -2.569591, 0.3686275, 1, 0, 1,
-0.6087348, -0.6396949, -3.108553, 0.3607843, 1, 0, 1,
-0.6038932, 0.9757699, 0.3875957, 0.3568628, 1, 0, 1,
-0.602984, 0.893079, -0.3023497, 0.3490196, 1, 0, 1,
-0.6026997, -0.4717892, -2.196965, 0.345098, 1, 0, 1,
-0.5988943, 0.6843624, 2.253491, 0.3372549, 1, 0, 1,
-0.5919726, 1.4297, 0.9302786, 0.3333333, 1, 0, 1,
-0.5890872, 1.612477, 0.9982921, 0.3254902, 1, 0, 1,
-0.585151, -0.7431648, -2.22401, 0.3215686, 1, 0, 1,
-0.5842481, 1.213777, -1.585504, 0.3137255, 1, 0, 1,
-0.5809156, -1.410941, -3.103682, 0.3098039, 1, 0, 1,
-0.5804042, 0.8416293, -1.833202, 0.3019608, 1, 0, 1,
-0.5802854, 0.1727876, -0.63678, 0.2941177, 1, 0, 1,
-0.5799683, -0.1616676, -3.482564, 0.2901961, 1, 0, 1,
-0.5773308, -0.8970827, -2.832345, 0.282353, 1, 0, 1,
-0.5763775, 0.238639, -1.230838, 0.2784314, 1, 0, 1,
-0.5741581, -1.226883, -1.781627, 0.2705882, 1, 0, 1,
-0.5670864, -0.748705, -1.579096, 0.2666667, 1, 0, 1,
-0.5649242, 0.9861228, -2.319921, 0.2588235, 1, 0, 1,
-0.564317, 0.6107575, -1.112336, 0.254902, 1, 0, 1,
-0.5641224, 0.1705214, -1.271657, 0.2470588, 1, 0, 1,
-0.562731, -1.133105, -2.959154, 0.2431373, 1, 0, 1,
-0.5626614, 0.3289024, -2.518269, 0.2352941, 1, 0, 1,
-0.5622443, -0.6915625, -2.296408, 0.2313726, 1, 0, 1,
-0.5602903, -0.8539658, -1.544287, 0.2235294, 1, 0, 1,
-0.5537992, 0.5625806, -1.083192, 0.2196078, 1, 0, 1,
-0.5511577, -0.6529563, -4.101954, 0.2117647, 1, 0, 1,
-0.5495545, -0.3825931, -3.602321, 0.2078431, 1, 0, 1,
-0.5461787, 0.3580728, 0.9731924, 0.2, 1, 0, 1,
-0.5410889, 0.3603278, -2.20292, 0.1921569, 1, 0, 1,
-0.5409194, -0.3090119, -2.147389, 0.1882353, 1, 0, 1,
-0.5398753, 0.4440238, -1.007772, 0.1803922, 1, 0, 1,
-0.5339428, -0.09998342, -2.071685, 0.1764706, 1, 0, 1,
-0.5309356, 0.909161, -0.9899148, 0.1686275, 1, 0, 1,
-0.5305942, -0.2031186, -2.039935, 0.1647059, 1, 0, 1,
-0.522217, -0.2254129, -1.399119, 0.1568628, 1, 0, 1,
-0.5191024, 0.1862109, -1.787456, 0.1529412, 1, 0, 1,
-0.514295, 0.2362108, 0.4461369, 0.145098, 1, 0, 1,
-0.5077953, -0.5791127, -3.98071, 0.1411765, 1, 0, 1,
-0.5008551, 0.4187571, 1.393935, 0.1333333, 1, 0, 1,
-0.4873593, -0.2301931, -0.7280492, 0.1294118, 1, 0, 1,
-0.4816772, 1.459891, 0.149542, 0.1215686, 1, 0, 1,
-0.4796344, -1.099406, -2.375359, 0.1176471, 1, 0, 1,
-0.4749218, 0.640083, -2.562342, 0.1098039, 1, 0, 1,
-0.4712743, 1.580529, -1.009862, 0.1058824, 1, 0, 1,
-0.4684086, -0.5042189, -2.576907, 0.09803922, 1, 0, 1,
-0.467065, 2.418662, 0.2347556, 0.09019608, 1, 0, 1,
-0.4614449, 0.7365387, -1.88652, 0.08627451, 1, 0, 1,
-0.4608892, 0.261945, -2.208848, 0.07843138, 1, 0, 1,
-0.4576089, -1.091138, -2.704849, 0.07450981, 1, 0, 1,
-0.4541713, 0.4464239, -1.725197, 0.06666667, 1, 0, 1,
-0.4528098, 0.9462956, -0.128311, 0.0627451, 1, 0, 1,
-0.4493678, -0.8824576, -3.372512, 0.05490196, 1, 0, 1,
-0.4461134, -1.290973, -3.421564, 0.05098039, 1, 0, 1,
-0.4417001, -0.08779417, -1.167125, 0.04313726, 1, 0, 1,
-0.4408347, -0.3227579, -2.047053, 0.03921569, 1, 0, 1,
-0.4365681, 1.187694, 0.4418871, 0.03137255, 1, 0, 1,
-0.4336557, 0.0950617, -2.451257, 0.02745098, 1, 0, 1,
-0.4304011, -0.3076178, -3.231329, 0.01960784, 1, 0, 1,
-0.4274071, 0.06867975, -0.9475784, 0.01568628, 1, 0, 1,
-0.4205373, 1.049025, 0.1060976, 0.007843138, 1, 0, 1,
-0.420006, -0.02558023, -1.71018, 0.003921569, 1, 0, 1,
-0.4194877, 0.3072697, -2.056817, 0, 1, 0.003921569, 1,
-0.4194195, 0.3500644, -0.9648574, 0, 1, 0.01176471, 1,
-0.4178385, 1.373173, -0.1403134, 0, 1, 0.01568628, 1,
-0.4161396, -2.711873, -2.727777, 0, 1, 0.02352941, 1,
-0.4132472, 1.105306, -1.836589, 0, 1, 0.02745098, 1,
-0.4086791, -0.390105, -0.7740548, 0, 1, 0.03529412, 1,
-0.4028547, 1.225895, -1.264024, 0, 1, 0.03921569, 1,
-0.4027056, -0.9644272, -2.031135, 0, 1, 0.04705882, 1,
-0.3985058, -0.1845496, -2.353032, 0, 1, 0.05098039, 1,
-0.3947984, -0.616533, -2.456688, 0, 1, 0.05882353, 1,
-0.390302, -0.2814596, -3.330009, 0, 1, 0.0627451, 1,
-0.3896959, -0.5777161, -3.734863, 0, 1, 0.07058824, 1,
-0.3890463, -0.743673, -3.531613, 0, 1, 0.07450981, 1,
-0.3888348, 1.309415, 0.6657892, 0, 1, 0.08235294, 1,
-0.386512, 0.1729951, -2.003404, 0, 1, 0.08627451, 1,
-0.3848946, -0.4037176, -1.444217, 0, 1, 0.09411765, 1,
-0.3838452, 0.8321025, 1.008383, 0, 1, 0.1019608, 1,
-0.377797, -1.178279, -1.627198, 0, 1, 0.1058824, 1,
-0.3732866, -1.351275, -3.678138, 0, 1, 0.1137255, 1,
-0.3730195, -0.4520648, -2.819456, 0, 1, 0.1176471, 1,
-0.3715636, 0.2276876, -1.178776, 0, 1, 0.1254902, 1,
-0.3693153, -0.7725032, -1.714029, 0, 1, 0.1294118, 1,
-0.3662981, -0.2589148, -3.810758, 0, 1, 0.1372549, 1,
-0.3659109, -0.9585748, -4.718024, 0, 1, 0.1411765, 1,
-0.3627069, 0.5184934, 0.7457175, 0, 1, 0.1490196, 1,
-0.3611561, -0.4238044, -0.7836056, 0, 1, 0.1529412, 1,
-0.3557909, -0.7890525, -2.308998, 0, 1, 0.1607843, 1,
-0.3476157, -0.8104005, -0.7902222, 0, 1, 0.1647059, 1,
-0.3390447, -0.348953, -2.105652, 0, 1, 0.172549, 1,
-0.3375619, -0.01278735, -1.445111, 0, 1, 0.1764706, 1,
-0.3372107, -1.531127, -4.012473, 0, 1, 0.1843137, 1,
-0.3284264, -0.3757119, -3.330654, 0, 1, 0.1882353, 1,
-0.3269837, 0.2388537, -2.972254, 0, 1, 0.1960784, 1,
-0.3265435, 1.074703, 0.364569, 0, 1, 0.2039216, 1,
-0.3245254, -0.007326812, -0.1558338, 0, 1, 0.2078431, 1,
-0.3164035, -0.1896378, -0.9871015, 0, 1, 0.2156863, 1,
-0.3144584, 0.340805, -1.779013, 0, 1, 0.2196078, 1,
-0.3126181, -1.060137, -3.237402, 0, 1, 0.227451, 1,
-0.3104824, -1.136314, -2.461678, 0, 1, 0.2313726, 1,
-0.3053574, 0.4564359, -2.27385, 0, 1, 0.2392157, 1,
-0.3027303, -0.3026139, -0.3906179, 0, 1, 0.2431373, 1,
-0.2961276, 0.3887796, -0.9943885, 0, 1, 0.2509804, 1,
-0.2960004, -0.3953734, -1.991842, 0, 1, 0.254902, 1,
-0.293924, -0.5883421, -2.943527, 0, 1, 0.2627451, 1,
-0.2907423, -0.1406717, -2.775693, 0, 1, 0.2666667, 1,
-0.2903011, 1.931715, 0.4108603, 0, 1, 0.2745098, 1,
-0.2888442, 0.7118081, 1.232359, 0, 1, 0.2784314, 1,
-0.2886211, -0.5759469, -3.326195, 0, 1, 0.2862745, 1,
-0.2869235, -0.5737217, -3.189379, 0, 1, 0.2901961, 1,
-0.2794398, 0.9553438, 0.01002988, 0, 1, 0.2980392, 1,
-0.2784362, -0.1066994, -4.49509, 0, 1, 0.3058824, 1,
-0.2783711, 1.020946, 0.6903338, 0, 1, 0.3098039, 1,
-0.2692078, 0.2439974, -0.3270129, 0, 1, 0.3176471, 1,
-0.2672164, -0.06023177, -1.993101, 0, 1, 0.3215686, 1,
-0.2627432, 0.6926547, -0.597834, 0, 1, 0.3294118, 1,
-0.2617263, 1.376738, -0.07006606, 0, 1, 0.3333333, 1,
-0.2571836, 0.0917962, -1.382851, 0, 1, 0.3411765, 1,
-0.2534886, -0.3276538, -2.496869, 0, 1, 0.345098, 1,
-0.2525446, 0.4144043, -0.5296091, 0, 1, 0.3529412, 1,
-0.2511772, -0.3013758, -0.470502, 0, 1, 0.3568628, 1,
-0.2507961, -0.2052311, -0.3479933, 0, 1, 0.3647059, 1,
-0.2486427, -0.2945631, -2.212291, 0, 1, 0.3686275, 1,
-0.2444519, 1.14441, -0.3332877, 0, 1, 0.3764706, 1,
-0.2438745, 0.08084354, -0.9800438, 0, 1, 0.3803922, 1,
-0.2428504, -0.1451301, -2.204539, 0, 1, 0.3882353, 1,
-0.2423774, -1.486811, -3.766856, 0, 1, 0.3921569, 1,
-0.2418173, -1.160798, -2.624045, 0, 1, 0.4, 1,
-0.2412561, -0.1554943, -2.89214, 0, 1, 0.4078431, 1,
-0.2367026, -0.7700629, -3.22465, 0, 1, 0.4117647, 1,
-0.2328504, 1.056589, 0.1091541, 0, 1, 0.4196078, 1,
-0.2296598, -0.1533385, -2.369048, 0, 1, 0.4235294, 1,
-0.2294776, -0.1539766, -1.997766, 0, 1, 0.4313726, 1,
-0.2292133, -0.3382253, -3.407657, 0, 1, 0.4352941, 1,
-0.2278671, -0.03239053, -0.8921233, 0, 1, 0.4431373, 1,
-0.2274104, -0.1767047, -2.280528, 0, 1, 0.4470588, 1,
-0.2262557, -0.2492869, -1.013003, 0, 1, 0.454902, 1,
-0.2226557, 1.164621, -0.6450565, 0, 1, 0.4588235, 1,
-0.2223836, 2.262882, -0.2613881, 0, 1, 0.4666667, 1,
-0.2199497, 1.079116, -0.319466, 0, 1, 0.4705882, 1,
-0.2198459, 0.8116223, -1.349674, 0, 1, 0.4784314, 1,
-0.2161504, -0.1703574, -2.774957, 0, 1, 0.4823529, 1,
-0.2123368, 1.387108, 3.237674, 0, 1, 0.4901961, 1,
-0.2116575, 0.6546628, -0.294417, 0, 1, 0.4941176, 1,
-0.2113595, 0.434518, 1.215114, 0, 1, 0.5019608, 1,
-0.2078632, -0.2101009, -2.233452, 0, 1, 0.509804, 1,
-0.2072506, -0.5495853, -3.553091, 0, 1, 0.5137255, 1,
-0.2038127, 0.4159824, -2.406737, 0, 1, 0.5215687, 1,
-0.1992226, 1.965528, 1.174213, 0, 1, 0.5254902, 1,
-0.1985537, 0.9958508, -0.6872676, 0, 1, 0.5333334, 1,
-0.1976541, 0.4268531, -1.160726, 0, 1, 0.5372549, 1,
-0.1975852, 1.136268, -2.084591, 0, 1, 0.5450981, 1,
-0.1962573, -0.4274349, -3.821712, 0, 1, 0.5490196, 1,
-0.194633, 0.3403307, -0.1965349, 0, 1, 0.5568628, 1,
-0.194628, -0.9013487, -1.947835, 0, 1, 0.5607843, 1,
-0.1933685, 0.8803628, -0.6215158, 0, 1, 0.5686275, 1,
-0.1894887, 0.602832, 1.682192, 0, 1, 0.572549, 1,
-0.1883041, -1.382692, -4.510035, 0, 1, 0.5803922, 1,
-0.1865879, -1.277893, -4.286996, 0, 1, 0.5843138, 1,
-0.1855834, -0.6008151, -2.594851, 0, 1, 0.5921569, 1,
-0.1813921, -0.4031696, -4.111553, 0, 1, 0.5960785, 1,
-0.1781673, -1.846523, -3.040374, 0, 1, 0.6039216, 1,
-0.1737596, 0.1158263, 0.2614731, 0, 1, 0.6117647, 1,
-0.1687915, 3.034826, 1.426115, 0, 1, 0.6156863, 1,
-0.1612552, -1.109316, -3.191275, 0, 1, 0.6235294, 1,
-0.1596228, -0.9288715, -1.710101, 0, 1, 0.627451, 1,
-0.1574178, 0.7816641, -0.8410817, 0, 1, 0.6352941, 1,
-0.1545525, -1.214118, -3.239492, 0, 1, 0.6392157, 1,
-0.1494934, -0.8145965, -3.065774, 0, 1, 0.6470588, 1,
-0.1469698, -0.2753636, -2.095845, 0, 1, 0.6509804, 1,
-0.1469261, -0.2668141, -3.309947, 0, 1, 0.6588235, 1,
-0.1428757, -1.826867, -3.458272, 0, 1, 0.6627451, 1,
-0.1368944, -1.982893, -2.094332, 0, 1, 0.6705883, 1,
-0.1340301, 0.4501118, 0.03071201, 0, 1, 0.6745098, 1,
-0.1318783, -0.7952321, -1.816559, 0, 1, 0.682353, 1,
-0.1304415, 0.8902455, 1.281392, 0, 1, 0.6862745, 1,
-0.1204203, 0.7031229, 1.140542, 0, 1, 0.6941177, 1,
-0.1167411, -0.4563607, -2.614017, 0, 1, 0.7019608, 1,
-0.1160476, -0.06062678, 0.3093832, 0, 1, 0.7058824, 1,
-0.1129814, 0.8746986, -0.5178671, 0, 1, 0.7137255, 1,
-0.1120454, -0.7243611, -3.18329, 0, 1, 0.7176471, 1,
-0.1052495, 0.8669339, 0.03489526, 0, 1, 0.7254902, 1,
-0.1010891, -0.8490788, -2.137332, 0, 1, 0.7294118, 1,
-0.1007447, -0.178097, -1.190983, 0, 1, 0.7372549, 1,
-0.1007201, 0.003736218, -0.1796029, 0, 1, 0.7411765, 1,
-0.09724178, -0.615587, -3.380152, 0, 1, 0.7490196, 1,
-0.09458935, 0.1460028, -0.4039015, 0, 1, 0.7529412, 1,
-0.09342498, 0.3041145, -3.169258, 0, 1, 0.7607843, 1,
-0.0924861, 0.8613036, -0.8663872, 0, 1, 0.7647059, 1,
-0.09114984, -0.0936899, -1.848694, 0, 1, 0.772549, 1,
-0.08929382, 0.925246, -1.42577, 0, 1, 0.7764706, 1,
-0.0888673, -0.6981892, -3.346781, 0, 1, 0.7843137, 1,
-0.08571058, -1.174962, -3.546808, 0, 1, 0.7882353, 1,
-0.085212, 0.1145311, -0.03307298, 0, 1, 0.7960784, 1,
-0.08397266, -0.04044123, -2.512103, 0, 1, 0.8039216, 1,
-0.0719431, 1.346314, -1.881837, 0, 1, 0.8078431, 1,
-0.07113355, -1.454591, -3.385746, 0, 1, 0.8156863, 1,
-0.06945946, 0.3579518, 1.706718, 0, 1, 0.8196079, 1,
-0.06812065, 0.7981496, -0.03919494, 0, 1, 0.827451, 1,
-0.06230273, 0.6084121, -0.8473646, 0, 1, 0.8313726, 1,
-0.06118424, -0.4888929, -4.722534, 0, 1, 0.8392157, 1,
-0.05719278, -1.781859, -1.970034, 0, 1, 0.8431373, 1,
-0.05539363, 2.323644, 0.1448715, 0, 1, 0.8509804, 1,
-0.04783278, -0.2311428, -2.694322, 0, 1, 0.854902, 1,
-0.0466543, -0.4429124, -3.099505, 0, 1, 0.8627451, 1,
-0.04217586, 0.8474675, -0.06839742, 0, 1, 0.8666667, 1,
-0.0352695, -0.7410517, -2.670002, 0, 1, 0.8745098, 1,
-0.03514673, 0.7986112, -1.229151, 0, 1, 0.8784314, 1,
-0.03452247, 0.6445976, -0.6026933, 0, 1, 0.8862745, 1,
-0.0335041, 0.374775, -0.06913362, 0, 1, 0.8901961, 1,
-0.03121046, 0.6964111, -0.7763868, 0, 1, 0.8980392, 1,
-0.03014161, -0.229898, -3.847172, 0, 1, 0.9058824, 1,
-0.03001541, 1.486397, 0.7256826, 0, 1, 0.9098039, 1,
-0.01918079, 1.679722, -0.41239, 0, 1, 0.9176471, 1,
-0.01906461, 0.4447817, -0.1300055, 0, 1, 0.9215686, 1,
-0.01757812, -0.8571575, -2.913678, 0, 1, 0.9294118, 1,
-0.01006907, -0.7904824, -3.055481, 0, 1, 0.9333333, 1,
-0.009433785, -0.3424361, -2.803053, 0, 1, 0.9411765, 1,
-0.007184956, 0.9534863, 1.126639, 0, 1, 0.945098, 1,
-0.005951514, 0.3007772, 0.2916796, 0, 1, 0.9529412, 1,
-0.005930786, 1.262573, 0.3662681, 0, 1, 0.9568627, 1,
-0.002853929, -1.03949, -2.901965, 0, 1, 0.9647059, 1,
-0.002040824, 0.7480115, 2.309926, 0, 1, 0.9686275, 1,
-0.002006333, -0.6859545, -2.944284, 0, 1, 0.9764706, 1,
-0.0007584956, -0.1975305, -4.867128, 0, 1, 0.9803922, 1,
0.0001652931, 0.07324614, 0.3066379, 0, 1, 0.9882353, 1,
0.0005979054, -1.238906, 2.708256, 0, 1, 0.9921569, 1,
0.0007059444, -0.1283154, 4.219224, 0, 1, 1, 1,
0.003157408, -0.2491174, 1.573421, 0, 0.9921569, 1, 1,
0.003324975, 1.412353, -1.244038, 0, 0.9882353, 1, 1,
0.008241752, 1.4894, -1.114756, 0, 0.9803922, 1, 1,
0.01139514, -0.2712886, 3.975963, 0, 0.9764706, 1, 1,
0.01164268, -1.187556, 2.234327, 0, 0.9686275, 1, 1,
0.01264107, 0.3129642, -0.983133, 0, 0.9647059, 1, 1,
0.01272619, 0.2961935, -0.03042374, 0, 0.9568627, 1, 1,
0.01454895, -0.3451962, 3.88251, 0, 0.9529412, 1, 1,
0.01536036, 0.3785725, 0.06664236, 0, 0.945098, 1, 1,
0.01623095, 0.4628217, 1.372198, 0, 0.9411765, 1, 1,
0.0190945, -0.9630069, 3.029271, 0, 0.9333333, 1, 1,
0.02214854, -1.341112, 3.855952, 0, 0.9294118, 1, 1,
0.02311703, 0.1705517, -2.291273, 0, 0.9215686, 1, 1,
0.02935722, 0.5490265, 0.74549, 0, 0.9176471, 1, 1,
0.03195892, -0.1657408, 4.100337, 0, 0.9098039, 1, 1,
0.03325897, -0.8087033, 3.785383, 0, 0.9058824, 1, 1,
0.03495351, -2.336475, 3.843472, 0, 0.8980392, 1, 1,
0.03507553, 0.8954701, -0.03374987, 0, 0.8901961, 1, 1,
0.03632432, 1.015223, 0.4343854, 0, 0.8862745, 1, 1,
0.03765233, -0.2612619, 3.263083, 0, 0.8784314, 1, 1,
0.03848578, -0.5303923, 3.79592, 0, 0.8745098, 1, 1,
0.04071905, 0.7395566, 1.393682, 0, 0.8666667, 1, 1,
0.04520152, 0.1385004, 0.5777578, 0, 0.8627451, 1, 1,
0.04579238, -0.8076087, 2.832576, 0, 0.854902, 1, 1,
0.04810782, -0.5851285, 3.465946, 0, 0.8509804, 1, 1,
0.0489716, -1.292124, 3.210856, 0, 0.8431373, 1, 1,
0.04904753, -0.4072585, 3.844643, 0, 0.8392157, 1, 1,
0.05115713, 1.73769, -0.5768237, 0, 0.8313726, 1, 1,
0.0512441, -1.538036, 2.260695, 0, 0.827451, 1, 1,
0.0520569, -0.06244636, 2.17847, 0, 0.8196079, 1, 1,
0.05282579, -0.3530468, 1.565123, 0, 0.8156863, 1, 1,
0.05951148, -0.339357, 2.184505, 0, 0.8078431, 1, 1,
0.0613893, -0.445074, 4.078059, 0, 0.8039216, 1, 1,
0.06315555, 0.8633865, -0.3640321, 0, 0.7960784, 1, 1,
0.06727345, -0.5086444, 1.087294, 0, 0.7882353, 1, 1,
0.06994904, -0.443879, 2.472232, 0, 0.7843137, 1, 1,
0.07244512, 0.000850565, 1.826465, 0, 0.7764706, 1, 1,
0.07337256, 1.461007, 1.217049, 0, 0.772549, 1, 1,
0.07370762, 0.5663753, 0.2798251, 0, 0.7647059, 1, 1,
0.07754479, -1.561376, 3.452869, 0, 0.7607843, 1, 1,
0.07913239, 0.08759543, 1.311921, 0, 0.7529412, 1, 1,
0.07967532, 0.3701142, 2.901881, 0, 0.7490196, 1, 1,
0.08133807, 0.06382609, -1.113262, 0, 0.7411765, 1, 1,
0.08189502, 0.4030413, 0.6711118, 0, 0.7372549, 1, 1,
0.08383816, -0.4825957, 2.338275, 0, 0.7294118, 1, 1,
0.08608886, -0.1489495, 1.337578, 0, 0.7254902, 1, 1,
0.08639983, 0.620971, 0.06919601, 0, 0.7176471, 1, 1,
0.08940784, 1.33593, -1.271379, 0, 0.7137255, 1, 1,
0.09446738, 0.9347264, -1.075582, 0, 0.7058824, 1, 1,
0.09487227, 0.6400537, 1.788869, 0, 0.6980392, 1, 1,
0.09773476, -0.389497, 3.729998, 0, 0.6941177, 1, 1,
0.1011982, 0.03152642, 0.6273695, 0, 0.6862745, 1, 1,
0.1053639, 0.457638, 0.6851157, 0, 0.682353, 1, 1,
0.1117063, 0.4905967, -0.06931262, 0, 0.6745098, 1, 1,
0.1187446, 0.639046, -0.8280494, 0, 0.6705883, 1, 1,
0.1195678, 1.481533, -0.562429, 0, 0.6627451, 1, 1,
0.1218138, -0.5626745, 3.737939, 0, 0.6588235, 1, 1,
0.1234458, 0.5562679, -1.183258, 0, 0.6509804, 1, 1,
0.1253167, 0.7769898, -1.767156, 0, 0.6470588, 1, 1,
0.1255153, -1.442131, 3.584448, 0, 0.6392157, 1, 1,
0.1266214, -1.19707, 3.485886, 0, 0.6352941, 1, 1,
0.128831, -1.157273, 2.996713, 0, 0.627451, 1, 1,
0.1302711, -0.02078599, 2.315547, 0, 0.6235294, 1, 1,
0.1327153, -0.1611487, 1.752208, 0, 0.6156863, 1, 1,
0.1345234, 1.196695, 1.27978, 0, 0.6117647, 1, 1,
0.1414364, -0.4812787, 2.442329, 0, 0.6039216, 1, 1,
0.1423859, 0.1074156, 2.665598, 0, 0.5960785, 1, 1,
0.1425363, -0.2281421, 2.082638, 0, 0.5921569, 1, 1,
0.1475876, 1.200834, -1.412867, 0, 0.5843138, 1, 1,
0.1527622, 0.2431987, 0.7958487, 0, 0.5803922, 1, 1,
0.1536212, -1.902145, 3.276968, 0, 0.572549, 1, 1,
0.1550575, 1.365918, 0.7494358, 0, 0.5686275, 1, 1,
0.156008, 0.3396027, -0.068671, 0, 0.5607843, 1, 1,
0.1571484, 0.2952286, -0.04691542, 0, 0.5568628, 1, 1,
0.1614911, -0.4310311, 3.157762, 0, 0.5490196, 1, 1,
0.1658419, 0.1109858, 2.277893, 0, 0.5450981, 1, 1,
0.1658583, 1.361669, -0.5713038, 0, 0.5372549, 1, 1,
0.1664562, 1.042759, -1.338459, 0, 0.5333334, 1, 1,
0.1666507, 0.6493447, -1.952524, 0, 0.5254902, 1, 1,
0.1708736, 1.103236, -1.05424, 0, 0.5215687, 1, 1,
0.1721588, -1.429044, 3.085389, 0, 0.5137255, 1, 1,
0.172597, 0.3527724, 2.258011, 0, 0.509804, 1, 1,
0.1743794, -1.11297, 4.429252, 0, 0.5019608, 1, 1,
0.1801209, 0.4626324, 2.629406, 0, 0.4941176, 1, 1,
0.1807245, -0.5870358, 1.671269, 0, 0.4901961, 1, 1,
0.1871058, -1.047148, 2.794455, 0, 0.4823529, 1, 1,
0.1900648, 1.332705, -0.5682407, 0, 0.4784314, 1, 1,
0.1901806, -0.006269649, 1.585002, 0, 0.4705882, 1, 1,
0.1903295, 0.1027315, 1.718074, 0, 0.4666667, 1, 1,
0.1926273, 0.04131979, 2.583732, 0, 0.4588235, 1, 1,
0.1975244, -3.02585, 2.296473, 0, 0.454902, 1, 1,
0.1981939, 0.5122864, -2.153713, 0, 0.4470588, 1, 1,
0.201176, 1.199279, 1.095608, 0, 0.4431373, 1, 1,
0.2018463, -0.2394654, 2.926008, 0, 0.4352941, 1, 1,
0.2033881, 0.863745, 0.3835254, 0, 0.4313726, 1, 1,
0.2056112, 1.372293, 1.000883, 0, 0.4235294, 1, 1,
0.2060099, 0.5391918, 0.6665917, 0, 0.4196078, 1, 1,
0.2119144, 0.6018239, 1.358322, 0, 0.4117647, 1, 1,
0.2152563, -0.7146832, 1.848961, 0, 0.4078431, 1, 1,
0.2160338, -0.6293305, 2.523602, 0, 0.4, 1, 1,
0.2166847, 1.71117, 1.316374, 0, 0.3921569, 1, 1,
0.2192251, -0.1866191, 1.170798, 0, 0.3882353, 1, 1,
0.2207377, -1.069769, 1.409148, 0, 0.3803922, 1, 1,
0.2262269, -1.389674, 0.677079, 0, 0.3764706, 1, 1,
0.22925, -0.6918032, 2.773666, 0, 0.3686275, 1, 1,
0.2361979, 0.4038241, 0.335329, 0, 0.3647059, 1, 1,
0.2362408, -0.02158583, 2.276185, 0, 0.3568628, 1, 1,
0.2377835, 0.7324389, 0.9745905, 0, 0.3529412, 1, 1,
0.2389133, 1.252405, -1.179345, 0, 0.345098, 1, 1,
0.2438053, -1.558921, 3.033868, 0, 0.3411765, 1, 1,
0.2463338, -0.5031612, 2.875923, 0, 0.3333333, 1, 1,
0.248083, 0.2703276, 1.627321, 0, 0.3294118, 1, 1,
0.2498688, 0.4988694, 2.032764, 0, 0.3215686, 1, 1,
0.2506484, -1.478674, 3.102894, 0, 0.3176471, 1, 1,
0.2513806, 0.8568205, 0.1094823, 0, 0.3098039, 1, 1,
0.252687, -0.9067539, 3.245224, 0, 0.3058824, 1, 1,
0.2539737, -0.438758, 2.128625, 0, 0.2980392, 1, 1,
0.2561464, 0.6214374, 0.4422232, 0, 0.2901961, 1, 1,
0.2626721, 0.9871134, -0.4453206, 0, 0.2862745, 1, 1,
0.2635189, -1.149799, 3.015321, 0, 0.2784314, 1, 1,
0.2635942, -0.6373859, 2.318405, 0, 0.2745098, 1, 1,
0.2641278, -1.13358, 3.548799, 0, 0.2666667, 1, 1,
0.2702435, -3.081642, 3.058278, 0, 0.2627451, 1, 1,
0.2723936, -1.022937, 0.9416384, 0, 0.254902, 1, 1,
0.2744994, -0.06028539, 1.503757, 0, 0.2509804, 1, 1,
0.2745295, -0.2220044, 1.281963, 0, 0.2431373, 1, 1,
0.2755204, -1.501284, 2.155432, 0, 0.2392157, 1, 1,
0.2832398, 0.1625684, 2.131045, 0, 0.2313726, 1, 1,
0.2839987, 0.07789297, 0.6197568, 0, 0.227451, 1, 1,
0.2848198, 0.4600706, 0.4136823, 0, 0.2196078, 1, 1,
0.2900038, -0.9286696, 4.033421, 0, 0.2156863, 1, 1,
0.2938926, -0.6512343, 3.942335, 0, 0.2078431, 1, 1,
0.2979895, 1.828902, 0.4983692, 0, 0.2039216, 1, 1,
0.2999466, -0.2196188, 2.666899, 0, 0.1960784, 1, 1,
0.3012473, 0.9248514, -0.4664876, 0, 0.1882353, 1, 1,
0.3021888, 0.4822863, -0.6698719, 0, 0.1843137, 1, 1,
0.3073966, -1.912633, 4.04675, 0, 0.1764706, 1, 1,
0.3076355, 2.1378, -1.103212, 0, 0.172549, 1, 1,
0.3112128, -0.4497719, 4.471029, 0, 0.1647059, 1, 1,
0.3144106, 0.9796937, 1.351705, 0, 0.1607843, 1, 1,
0.3189736, 0.02279736, 1.258268, 0, 0.1529412, 1, 1,
0.3201273, -0.7488927, 0.7370149, 0, 0.1490196, 1, 1,
0.3202684, 1.590917, 0.1985931, 0, 0.1411765, 1, 1,
0.3224451, -0.5680412, 2.420748, 0, 0.1372549, 1, 1,
0.3234, 0.6781679, -0.9517041, 0, 0.1294118, 1, 1,
0.3238492, -0.3010843, 2.052938, 0, 0.1254902, 1, 1,
0.3254361, -2.041023, 1.833075, 0, 0.1176471, 1, 1,
0.3262607, -0.2788398, 3.991256, 0, 0.1137255, 1, 1,
0.3326469, -0.2648038, 2.141703, 0, 0.1058824, 1, 1,
0.333089, 0.6049305, 0.006827762, 0, 0.09803922, 1, 1,
0.3346765, 1.253612, 1.166689, 0, 0.09411765, 1, 1,
0.3354394, -1.376254, 2.509198, 0, 0.08627451, 1, 1,
0.3374575, -0.7164738, 3.691597, 0, 0.08235294, 1, 1,
0.3460029, 1.019518, -0.2329845, 0, 0.07450981, 1, 1,
0.3501278, -0.4633893, 3.661718, 0, 0.07058824, 1, 1,
0.355288, 0.7119334, 0.7975102, 0, 0.0627451, 1, 1,
0.357632, 0.326901, 2.145383, 0, 0.05882353, 1, 1,
0.3585677, 1.811693, -0.2966253, 0, 0.05098039, 1, 1,
0.3611923, 0.182519, 1.152815, 0, 0.04705882, 1, 1,
0.3621762, -0.9147919, 5.215482, 0, 0.03921569, 1, 1,
0.363148, -1.011388, 1.207865, 0, 0.03529412, 1, 1,
0.3655997, 0.3369409, 0.4827154, 0, 0.02745098, 1, 1,
0.3671969, -0.005490412, 3.109558, 0, 0.02352941, 1, 1,
0.36856, -0.7171222, 3.894379, 0, 0.01568628, 1, 1,
0.3694513, 1.237493, 1.671628, 0, 0.01176471, 1, 1,
0.3704687, 1.747543, 1.248678, 0, 0.003921569, 1, 1,
0.3718124, 0.3542089, 0.4281589, 0.003921569, 0, 1, 1,
0.3740922, -2.592918, 1.95323, 0.007843138, 0, 1, 1,
0.376307, -0.6159374, 1.988926, 0.01568628, 0, 1, 1,
0.3766597, 0.3638068, 0.01301701, 0.01960784, 0, 1, 1,
0.3776991, -0.1248805, 2.237312, 0.02745098, 0, 1, 1,
0.3794068, -0.3359092, 2.568026, 0.03137255, 0, 1, 1,
0.3798994, 1.533353, 0.3053884, 0.03921569, 0, 1, 1,
0.3805055, -0.8977138, 2.391953, 0.04313726, 0, 1, 1,
0.3817565, 0.3369978, 1.493294, 0.05098039, 0, 1, 1,
0.3839246, 1.009652, 0.8116478, 0.05490196, 0, 1, 1,
0.3864305, -0.3733192, 2.881064, 0.0627451, 0, 1, 1,
0.3931306, 0.005441742, 1.694079, 0.06666667, 0, 1, 1,
0.4017634, -0.9826295, 3.192978, 0.07450981, 0, 1, 1,
0.4115147, -2.191558, 2.317114, 0.07843138, 0, 1, 1,
0.416858, -0.429432, 2.858017, 0.08627451, 0, 1, 1,
0.4202112, -0.280149, 3.29053, 0.09019608, 0, 1, 1,
0.4211137, 1.043933, -0.3377077, 0.09803922, 0, 1, 1,
0.423913, 0.5913855, 1.857004, 0.1058824, 0, 1, 1,
0.42852, 1.301358, 0.8843438, 0.1098039, 0, 1, 1,
0.4300014, -0.9796886, 3.743196, 0.1176471, 0, 1, 1,
0.4303313, -0.10216, 0.4339743, 0.1215686, 0, 1, 1,
0.4329915, 0.6649979, 0.1180717, 0.1294118, 0, 1, 1,
0.433898, -0.3020988, 3.262347, 0.1333333, 0, 1, 1,
0.4366911, -0.9653559, 1.914283, 0.1411765, 0, 1, 1,
0.4385334, 0.9630649, 0.3013273, 0.145098, 0, 1, 1,
0.4385469, 1.435189, -0.6932099, 0.1529412, 0, 1, 1,
0.4386618, 0.04764295, 1.97446, 0.1568628, 0, 1, 1,
0.4404538, -0.9164142, 3.122506, 0.1647059, 0, 1, 1,
0.4429855, -0.9444396, 3.290495, 0.1686275, 0, 1, 1,
0.4444537, -0.9370511, 3.204755, 0.1764706, 0, 1, 1,
0.44649, 0.5089669, -0.1092911, 0.1803922, 0, 1, 1,
0.447443, 0.0004009923, 1.562663, 0.1882353, 0, 1, 1,
0.4481325, 1.358381, -0.3607785, 0.1921569, 0, 1, 1,
0.448386, 2.257168, 0.7323647, 0.2, 0, 1, 1,
0.4505158, 0.5755774, -1.278753, 0.2078431, 0, 1, 1,
0.4527044, 2.197703, -1.036721, 0.2117647, 0, 1, 1,
0.4535911, -0.304502, 3.622646, 0.2196078, 0, 1, 1,
0.457069, 0.1115114, 1.325171, 0.2235294, 0, 1, 1,
0.4582046, -1.090378, 1.876746, 0.2313726, 0, 1, 1,
0.4590985, 0.5486806, 2.205618, 0.2352941, 0, 1, 1,
0.4613087, 0.3861123, 0.8915728, 0.2431373, 0, 1, 1,
0.4614454, 0.5816789, -0.4558847, 0.2470588, 0, 1, 1,
0.4653232, 0.1347255, -0.5468156, 0.254902, 0, 1, 1,
0.4659378, 0.4272721, -0.8998723, 0.2588235, 0, 1, 1,
0.4679706, -0.5583646, 0.54526, 0.2666667, 0, 1, 1,
0.4715526, -0.3534959, 2.871968, 0.2705882, 0, 1, 1,
0.4728985, -0.2537901, 2.503426, 0.2784314, 0, 1, 1,
0.4773556, -0.7956059, 2.753016, 0.282353, 0, 1, 1,
0.4797581, -0.2887684, 3.344446, 0.2901961, 0, 1, 1,
0.4843342, 0.441987, 1.520578, 0.2941177, 0, 1, 1,
0.488711, 0.4718525, 3.1617, 0.3019608, 0, 1, 1,
0.4901785, 0.4059331, 0.9237041, 0.3098039, 0, 1, 1,
0.4909645, -0.5488185, 2.674282, 0.3137255, 0, 1, 1,
0.4933015, 1.287547, -2.272852, 0.3215686, 0, 1, 1,
0.4956648, -1.062995, 2.311274, 0.3254902, 0, 1, 1,
0.4978059, -0.2011764, 3.0108, 0.3333333, 0, 1, 1,
0.501057, 0.4487548, -0.08646619, 0.3372549, 0, 1, 1,
0.5016266, 1.422264, -0.2993791, 0.345098, 0, 1, 1,
0.5045884, -0.4928043, 2.213946, 0.3490196, 0, 1, 1,
0.5054604, 1.163374, -0.2007987, 0.3568628, 0, 1, 1,
0.5080336, 0.8614652, 0.306293, 0.3607843, 0, 1, 1,
0.5156648, -1.015819, 1.776469, 0.3686275, 0, 1, 1,
0.5164278, 1.807867, 1.440445, 0.372549, 0, 1, 1,
0.5220084, -1.453095, 2.263022, 0.3803922, 0, 1, 1,
0.5223943, -1.140293, 4.776939, 0.3843137, 0, 1, 1,
0.5299969, -0.6912241, 2.596697, 0.3921569, 0, 1, 1,
0.5317376, -0.2449093, 2.36642, 0.3960784, 0, 1, 1,
0.5388443, 1.614426, 1.107371, 0.4039216, 0, 1, 1,
0.542602, 1.627157, -1.244649, 0.4117647, 0, 1, 1,
0.5450867, 2.986764, 0.8971265, 0.4156863, 0, 1, 1,
0.5470726, 0.7082076, 2.525584, 0.4235294, 0, 1, 1,
0.5481775, -1.47471, 2.982295, 0.427451, 0, 1, 1,
0.5483115, -1.690632, 4.18713, 0.4352941, 0, 1, 1,
0.5632845, -1.135681, 1.721716, 0.4392157, 0, 1, 1,
0.56471, -1.33908, 2.241235, 0.4470588, 0, 1, 1,
0.5653007, 0.09114937, 2.477173, 0.4509804, 0, 1, 1,
0.5714579, -0.6686087, 1.262433, 0.4588235, 0, 1, 1,
0.5720932, 0.1486057, 1.443625, 0.4627451, 0, 1, 1,
0.5755302, -0.4293703, 2.29353, 0.4705882, 0, 1, 1,
0.5824243, 0.238842, 1.708361, 0.4745098, 0, 1, 1,
0.5850956, -1.118683, 3.189276, 0.4823529, 0, 1, 1,
0.5852028, 0.2945087, 0.6668581, 0.4862745, 0, 1, 1,
0.5886645, 0.02018, 1.086108, 0.4941176, 0, 1, 1,
0.5901222, -0.9606043, 3.406916, 0.5019608, 0, 1, 1,
0.5992576, -1.947801, 2.48794, 0.5058824, 0, 1, 1,
0.6045169, -0.02386303, 1.391212, 0.5137255, 0, 1, 1,
0.6057243, 1.477448, 0.5896385, 0.5176471, 0, 1, 1,
0.6125063, -1.030802, 2.253574, 0.5254902, 0, 1, 1,
0.6165062, 1.715425, 0.9977814, 0.5294118, 0, 1, 1,
0.6180266, 0.8469709, 1.160053, 0.5372549, 0, 1, 1,
0.6194119, -1.897626, 3.063617, 0.5411765, 0, 1, 1,
0.6224284, 0.4206157, 0.175766, 0.5490196, 0, 1, 1,
0.6272905, 1.25905, 1.734747, 0.5529412, 0, 1, 1,
0.6296334, -0.3126722, 3.364607, 0.5607843, 0, 1, 1,
0.63161, -1.207547, 3.142988, 0.5647059, 0, 1, 1,
0.6352693, -1.82776, 3.4196, 0.572549, 0, 1, 1,
0.6362864, 0.3019585, 1.79307, 0.5764706, 0, 1, 1,
0.6376346, -0.5996883, 1.950586, 0.5843138, 0, 1, 1,
0.6481797, 0.5405507, 0.3422716, 0.5882353, 0, 1, 1,
0.6569005, 0.615174, 1.616597, 0.5960785, 0, 1, 1,
0.657469, 0.2060765, -0.2960098, 0.6039216, 0, 1, 1,
0.6582647, 0.5965354, 2.280159, 0.6078432, 0, 1, 1,
0.6595802, -1.039017, 2.701662, 0.6156863, 0, 1, 1,
0.6619575, -0.5848939, 1.537779, 0.6196079, 0, 1, 1,
0.6639526, 0.4985455, -0.2747933, 0.627451, 0, 1, 1,
0.6646251, -1.616282, 1.997419, 0.6313726, 0, 1, 1,
0.6687986, -0.3993579, 3.720003, 0.6392157, 0, 1, 1,
0.6696708, -1.296915, 1.147766, 0.6431373, 0, 1, 1,
0.672094, 0.2949055, 3.182962, 0.6509804, 0, 1, 1,
0.6748778, 0.2633848, 0.4050515, 0.654902, 0, 1, 1,
0.6758773, 0.8257703, 0.3924389, 0.6627451, 0, 1, 1,
0.6862919, -0.9268987, 3.024216, 0.6666667, 0, 1, 1,
0.688203, -1.039197, 2.080338, 0.6745098, 0, 1, 1,
0.6917053, 0.646175, 1.356476, 0.6784314, 0, 1, 1,
0.6918905, -1.754718, 4.606316, 0.6862745, 0, 1, 1,
0.692287, 0.4011408, 2.479077, 0.6901961, 0, 1, 1,
0.6923337, -0.6073375, -0.85717, 0.6980392, 0, 1, 1,
0.7003109, 0.3564838, 0.8705376, 0.7058824, 0, 1, 1,
0.7035936, 1.184663, -1.1474, 0.7098039, 0, 1, 1,
0.7143064, -0.768939, 1.346609, 0.7176471, 0, 1, 1,
0.7214344, 0.6207628, 2.253071, 0.7215686, 0, 1, 1,
0.7278178, 0.06036261, 1.461616, 0.7294118, 0, 1, 1,
0.7298437, -0.7437848, 3.549208, 0.7333333, 0, 1, 1,
0.7316127, 0.9171538, 0.7339445, 0.7411765, 0, 1, 1,
0.7338666, 0.747133, -0.3258206, 0.7450981, 0, 1, 1,
0.743077, 0.869827, 1.558858, 0.7529412, 0, 1, 1,
0.7437991, 0.2259731, 0.7974466, 0.7568628, 0, 1, 1,
0.7528687, -2.452143, 3.431641, 0.7647059, 0, 1, 1,
0.756531, 0.2940859, 2.69566, 0.7686275, 0, 1, 1,
0.7608928, -0.9467332, 3.699208, 0.7764706, 0, 1, 1,
0.7611765, 1.520595, -0.06773159, 0.7803922, 0, 1, 1,
0.7659131, -0.3258766, 1.955871, 0.7882353, 0, 1, 1,
0.7666668, -0.4088007, 3.338773, 0.7921569, 0, 1, 1,
0.7668359, -1.549959, 1.593457, 0.8, 0, 1, 1,
0.7690912, 0.9015467, 1.143803, 0.8078431, 0, 1, 1,
0.7737166, -0.4032645, 0.5244707, 0.8117647, 0, 1, 1,
0.7858313, -1.092159, 2.107711, 0.8196079, 0, 1, 1,
0.7862049, -0.03552851, 1.186626, 0.8235294, 0, 1, 1,
0.7890155, 0.1282931, 1.298017, 0.8313726, 0, 1, 1,
0.7917157, -0.3994862, 1.278774, 0.8352941, 0, 1, 1,
0.8019865, -1.144636, 2.209764, 0.8431373, 0, 1, 1,
0.8052113, 0.1094259, 2.148889, 0.8470588, 0, 1, 1,
0.8114858, 0.5606242, 1.105682, 0.854902, 0, 1, 1,
0.812584, -0.2380481, 1.172424, 0.8588235, 0, 1, 1,
0.8166202, 0.5342518, 1.380071, 0.8666667, 0, 1, 1,
0.8166308, 1.13335, 1.51916, 0.8705882, 0, 1, 1,
0.820605, -0.9373662, 3.081054, 0.8784314, 0, 1, 1,
0.8227385, 0.8705513, 0.9728009, 0.8823529, 0, 1, 1,
0.8232728, -0.8496808, 2.526208, 0.8901961, 0, 1, 1,
0.8245237, -0.4897836, 1.323932, 0.8941177, 0, 1, 1,
0.8309578, 0.5237287, -0.03399966, 0.9019608, 0, 1, 1,
0.8391474, -1.823373, 3.128411, 0.9098039, 0, 1, 1,
0.8395612, 0.2056769, 0.7411183, 0.9137255, 0, 1, 1,
0.8437282, -0.6914889, -0.1645901, 0.9215686, 0, 1, 1,
0.8471711, 0.1506267, 1.212274, 0.9254902, 0, 1, 1,
0.8656258, -0.5059083, 2.783683, 0.9333333, 0, 1, 1,
0.8675461, 0.9988923, 2.704713, 0.9372549, 0, 1, 1,
0.8745528, 0.7778339, 0.07378882, 0.945098, 0, 1, 1,
0.8759016, 0.03577436, 0.8549362, 0.9490196, 0, 1, 1,
0.8785586, -3.119974, 3.205507, 0.9568627, 0, 1, 1,
0.8786138, 0.9488875, 2.096841, 0.9607843, 0, 1, 1,
0.8797176, -0.2380663, 1.215747, 0.9686275, 0, 1, 1,
0.8863383, 0.8350953, 0.4311745, 0.972549, 0, 1, 1,
0.888225, 0.4073206, 0.877997, 0.9803922, 0, 1, 1,
0.8909074, 0.3918146, 2.114948, 0.9843137, 0, 1, 1,
0.9068583, 0.8825944, 1.208098, 0.9921569, 0, 1, 1,
0.9089264, 0.6568303, 0.7058932, 0.9960784, 0, 1, 1,
0.9097362, -0.4539877, 2.955589, 1, 0, 0.9960784, 1,
0.9166074, 0.9184455, 1.669807, 1, 0, 0.9882353, 1,
0.9196559, 0.8835827, 0.4503444, 1, 0, 0.9843137, 1,
0.9200026, -0.7342572, -0.03436547, 1, 0, 0.9764706, 1,
0.9228035, -0.8268667, 2.785947, 1, 0, 0.972549, 1,
0.9241458, -1.011077, 3.079476, 1, 0, 0.9647059, 1,
0.928062, -0.1241483, 2.169822, 1, 0, 0.9607843, 1,
0.9291372, -1.944422, 2.283226, 1, 0, 0.9529412, 1,
0.9296451, -0.02409565, 0.5573648, 1, 0, 0.9490196, 1,
0.9322243, 0.9608215, 1.932197, 1, 0, 0.9411765, 1,
0.9323841, -0.02319921, 2.836172, 1, 0, 0.9372549, 1,
0.9353138, -0.8579048, 3.485457, 1, 0, 0.9294118, 1,
0.9390792, 0.6970161, -0.4379145, 1, 0, 0.9254902, 1,
0.9414401, -0.4173903, 0.1092188, 1, 0, 0.9176471, 1,
0.9455321, 0.2374656, 1.937759, 1, 0, 0.9137255, 1,
0.9473332, -0.04422206, 2.247537, 1, 0, 0.9058824, 1,
0.9487065, -0.3917306, 1.397994, 1, 0, 0.9019608, 1,
0.9496635, 0.205097, 3.032449, 1, 0, 0.8941177, 1,
0.9510912, 1.539564, -0.07708123, 1, 0, 0.8862745, 1,
0.9572084, 0.4309995, 0.673149, 1, 0, 0.8823529, 1,
0.9573534, 0.5973045, 1.207962, 1, 0, 0.8745098, 1,
0.9733842, -1.096932, 3.70105, 1, 0, 0.8705882, 1,
0.9745476, -0.7815959, 2.691775, 1, 0, 0.8627451, 1,
0.9864773, 0.6230018, 1.902225, 1, 0, 0.8588235, 1,
0.9865614, -0.7796052, 1.421347, 1, 0, 0.8509804, 1,
0.9924107, 0.157031, 4.525363, 1, 0, 0.8470588, 1,
1.000202, 1.197765, -0.3249948, 1, 0, 0.8392157, 1,
1.004335, 0.4553509, -0.6228967, 1, 0, 0.8352941, 1,
1.005848, -1.108504, 1.405943, 1, 0, 0.827451, 1,
1.013955, 0.2560724, 0.3161375, 1, 0, 0.8235294, 1,
1.015284, -0.2402976, 2.539934, 1, 0, 0.8156863, 1,
1.017445, 0.2594544, 0.8550233, 1, 0, 0.8117647, 1,
1.020685, 0.2755026, 2.235134, 1, 0, 0.8039216, 1,
1.021311, -0.8061056, 3.422038, 1, 0, 0.7960784, 1,
1.027524, -0.3661004, 0.4667326, 1, 0, 0.7921569, 1,
1.030196, 0.9007367, -0.4961624, 1, 0, 0.7843137, 1,
1.032987, -0.5816628, 1.152574, 1, 0, 0.7803922, 1,
1.038203, -0.3567722, 3.177281, 1, 0, 0.772549, 1,
1.038829, -0.7445586, 2.944097, 1, 0, 0.7686275, 1,
1.039042, -0.7263917, 0.9682422, 1, 0, 0.7607843, 1,
1.042573, -0.3571031, 1.889915, 1, 0, 0.7568628, 1,
1.045245, -0.5717012, 2.534159, 1, 0, 0.7490196, 1,
1.051908, -0.7045593, 2.851376, 1, 0, 0.7450981, 1,
1.061315, -0.8594487, 2.157506, 1, 0, 0.7372549, 1,
1.067625, 1.028644, 1.002984, 1, 0, 0.7333333, 1,
1.06993, 0.7554271, 0.9218749, 1, 0, 0.7254902, 1,
1.072983, -0.8365758, 1.177203, 1, 0, 0.7215686, 1,
1.073123, 1.476801, -0.05012265, 1, 0, 0.7137255, 1,
1.082578, 0.4348033, 0.4172124, 1, 0, 0.7098039, 1,
1.095285, -1.015032, 1.908341, 1, 0, 0.7019608, 1,
1.095415, 1.773113, 0.9737018, 1, 0, 0.6941177, 1,
1.098757, -1.116916, 2.137519, 1, 0, 0.6901961, 1,
1.101901, -0.3618223, 0.07152287, 1, 0, 0.682353, 1,
1.106397, 0.1197941, 1.221614, 1, 0, 0.6784314, 1,
1.106934, -0.397268, 1.147258, 1, 0, 0.6705883, 1,
1.107444, 0.3036117, -0.7613997, 1, 0, 0.6666667, 1,
1.108056, 0.2996171, -0.225743, 1, 0, 0.6588235, 1,
1.112378, -0.008054919, 0.6818857, 1, 0, 0.654902, 1,
1.113659, 0.005010793, 1.152607, 1, 0, 0.6470588, 1,
1.114267, -0.6562723, 0.6629061, 1, 0, 0.6431373, 1,
1.120155, 0.1343586, 1.852382, 1, 0, 0.6352941, 1,
1.123903, -0.6054408, 2.350104, 1, 0, 0.6313726, 1,
1.124157, -0.1354434, 1.463344, 1, 0, 0.6235294, 1,
1.133308, -1.778175, 2.441027, 1, 0, 0.6196079, 1,
1.16501, 0.04835558, 2.257781, 1, 0, 0.6117647, 1,
1.169841, -0.5153767, 2.098346, 1, 0, 0.6078432, 1,
1.185286, -0.1568918, 1.474416, 1, 0, 0.6, 1,
1.19905, -0.05058447, 1.617596, 1, 0, 0.5921569, 1,
1.19914, -1.11096, 4.043164, 1, 0, 0.5882353, 1,
1.199874, -0.2108521, 3.912139, 1, 0, 0.5803922, 1,
1.201515, 1.595352, 0.2165625, 1, 0, 0.5764706, 1,
1.204569, 0.9155039, 2.234325, 1, 0, 0.5686275, 1,
1.207279, -1.292744, 3.908732, 1, 0, 0.5647059, 1,
1.207539, -0.01877218, -0.2534046, 1, 0, 0.5568628, 1,
1.214348, 2.373702, -0.1394186, 1, 0, 0.5529412, 1,
1.215873, 1.221282, -0.2150883, 1, 0, 0.5450981, 1,
1.244688, -1.178734, 3.549593, 1, 0, 0.5411765, 1,
1.261674, -0.661368, 1.589365, 1, 0, 0.5333334, 1,
1.272844, -0.9619442, 2.118872, 1, 0, 0.5294118, 1,
1.282299, 0.762445, 3.003082, 1, 0, 0.5215687, 1,
1.289776, -1.575588, 1.61411, 1, 0, 0.5176471, 1,
1.293475, 0.9285051, 1.775463, 1, 0, 0.509804, 1,
1.303179, -0.2469316, 2.812261, 1, 0, 0.5058824, 1,
1.306775, 0.9004797, -0.5718443, 1, 0, 0.4980392, 1,
1.311346, 0.1804733, -0.4113651, 1, 0, 0.4901961, 1,
1.311828, -0.6952025, -0.2498199, 1, 0, 0.4862745, 1,
1.315497, 2.438666, 2.241802, 1, 0, 0.4784314, 1,
1.316246, 0.2232086, 0.9818755, 1, 0, 0.4745098, 1,
1.318891, 0.01312688, 1.746938, 1, 0, 0.4666667, 1,
1.319694, 0.02872041, 2.592261, 1, 0, 0.4627451, 1,
1.320432, -0.7775827, 1.435492, 1, 0, 0.454902, 1,
1.329423, -0.3713154, 1.258658, 1, 0, 0.4509804, 1,
1.337622, 0.096414, 2.388882, 1, 0, 0.4431373, 1,
1.338721, 0.8576829, 2.624434, 1, 0, 0.4392157, 1,
1.339148, -0.5215285, 1.910983, 1, 0, 0.4313726, 1,
1.343196, 0.6022816, 1.497766, 1, 0, 0.427451, 1,
1.350429, -1.21584, 2.560668, 1, 0, 0.4196078, 1,
1.356233, -0.1574993, 2.542792, 1, 0, 0.4156863, 1,
1.358086, -1.619164, 2.459555, 1, 0, 0.4078431, 1,
1.364077, 0.7023875, 2.268303, 1, 0, 0.4039216, 1,
1.366255, 0.4839637, 2.812896, 1, 0, 0.3960784, 1,
1.383711, -1.09298, 2.061468, 1, 0, 0.3882353, 1,
1.389312, 0.7117895, 1.207008, 1, 0, 0.3843137, 1,
1.391312, 0.3861735, 0.7457272, 1, 0, 0.3764706, 1,
1.403924, -1.905266, 2.101571, 1, 0, 0.372549, 1,
1.41381, 0.05149512, 0.7419118, 1, 0, 0.3647059, 1,
1.419717, -0.6371695, 1.515149, 1, 0, 0.3607843, 1,
1.436305, -1.364524, 1.142085, 1, 0, 0.3529412, 1,
1.438148, -0.1436167, 1.851895, 1, 0, 0.3490196, 1,
1.444501, -0.7793908, 1.632183, 1, 0, 0.3411765, 1,
1.449148, -0.1993286, 3.744005, 1, 0, 0.3372549, 1,
1.46182, 0.4120849, 1.048291, 1, 0, 0.3294118, 1,
1.461952, -0.5133113, -0.2716535, 1, 0, 0.3254902, 1,
1.474503, 0.4862971, 0.6571493, 1, 0, 0.3176471, 1,
1.481506, 0.5527158, 0.3636319, 1, 0, 0.3137255, 1,
1.486523, 0.8172817, -1.180895, 1, 0, 0.3058824, 1,
1.493862, 1.290162, 1.831576, 1, 0, 0.2980392, 1,
1.504804, 0.996187, 0.7324007, 1, 0, 0.2941177, 1,
1.505213, -0.2069339, 0.6277856, 1, 0, 0.2862745, 1,
1.526866, -0.8644522, 4.196669, 1, 0, 0.282353, 1,
1.533849, -0.1370022, 1.664849, 1, 0, 0.2745098, 1,
1.563007, -1.71832, 2.715088, 1, 0, 0.2705882, 1,
1.572605, 1.03652, 2.248215, 1, 0, 0.2627451, 1,
1.579513, 0.4102295, 0.3257993, 1, 0, 0.2588235, 1,
1.583362, -0.3858038, 2.710512, 1, 0, 0.2509804, 1,
1.586782, -0.5681011, 3.294164, 1, 0, 0.2470588, 1,
1.601853, -0.980933, 3.356923, 1, 0, 0.2392157, 1,
1.618652, 0.1959147, 0.9537923, 1, 0, 0.2352941, 1,
1.631698, 0.3942046, 1.533423, 1, 0, 0.227451, 1,
1.653906, -1.251355, -0.9438531, 1, 0, 0.2235294, 1,
1.667832, 0.7540626, -0.1522881, 1, 0, 0.2156863, 1,
1.674363, 1.571755, -0.2096551, 1, 0, 0.2117647, 1,
1.681841, 0.1706028, 2.414889, 1, 0, 0.2039216, 1,
1.690912, -0.07347243, 0.06347262, 1, 0, 0.1960784, 1,
1.717364, -0.2920994, 0.2301437, 1, 0, 0.1921569, 1,
1.740398, 1.53261, 0.1863737, 1, 0, 0.1843137, 1,
1.750576, 1.528255, 1.424403, 1, 0, 0.1803922, 1,
1.766751, 0.05691487, 0.8218966, 1, 0, 0.172549, 1,
1.779262, -1.946703, 1.69519, 1, 0, 0.1686275, 1,
1.789428, -0.1753696, -0.9573104, 1, 0, 0.1607843, 1,
1.800115, 0.87537, 1.787091, 1, 0, 0.1568628, 1,
1.808112, -0.3220521, 3.31586, 1, 0, 0.1490196, 1,
1.812281, -0.7672814, 2.309635, 1, 0, 0.145098, 1,
1.826877, 3.534759, 0.9988874, 1, 0, 0.1372549, 1,
1.829278, 0.09296318, 0.4540076, 1, 0, 0.1333333, 1,
1.844227, -0.2815965, 2.499301, 1, 0, 0.1254902, 1,
1.850484, -2.040703, 1.47966, 1, 0, 0.1215686, 1,
1.923998, 0.162783, -0.03844844, 1, 0, 0.1137255, 1,
1.929022, 0.1231069, 1.803045, 1, 0, 0.1098039, 1,
1.935054, 0.3423655, 1.759548, 1, 0, 0.1019608, 1,
1.938177, 0.7034019, 2.261159, 1, 0, 0.09411765, 1,
1.967983, -1.025721, 1.285789, 1, 0, 0.09019608, 1,
1.991785, 0.2176123, 2.678342, 1, 0, 0.08235294, 1,
2.008246, -1.595193, 2.037232, 1, 0, 0.07843138, 1,
2.02568, -0.4394733, -0.05349221, 1, 0, 0.07058824, 1,
2.039449, -0.5864704, 1.017544, 1, 0, 0.06666667, 1,
2.040901, -1.673963, 3.80532, 1, 0, 0.05882353, 1,
2.097853, -1.97757, 4.533468, 1, 0, 0.05490196, 1,
2.187733, -0.9259094, 1.985922, 1, 0, 0.04705882, 1,
2.192166, 0.912463, 0.8394927, 1, 0, 0.04313726, 1,
2.250725, 0.5192768, 0.1967724, 1, 0, 0.03529412, 1,
2.253758, 0.5671386, 1.851119, 1, 0, 0.03137255, 1,
2.571427, 0.4061512, -0.01051502, 1, 0, 0.02352941, 1,
2.715596, -1.742579, 3.058399, 1, 0, 0.01960784, 1,
3.119056, -0.1438145, 3.737106, 1, 0, 0.01176471, 1,
3.658795, 0.5128711, -0.2492101, 1, 0, 0.007843138, 1
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
0.431252, -4.860818, -6.920532, 0, -0.5, 0.5, 0.5,
0.431252, -4.860818, -6.920532, 1, -0.5, 0.5, 0.5,
0.431252, -4.860818, -6.920532, 1, 1.5, 0.5, 0.5,
0.431252, -4.860818, -6.920532, 0, 1.5, 0.5, 0.5
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
-3.890429, -0.05462813, -6.920532, 0, -0.5, 0.5, 0.5,
-3.890429, -0.05462813, -6.920532, 1, -0.5, 0.5, 0.5,
-3.890429, -0.05462813, -6.920532, 1, 1.5, 0.5, 0.5,
-3.890429, -0.05462813, -6.920532, 0, 1.5, 0.5, 0.5
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
-3.890429, -4.860818, 0.02693391, 0, -0.5, 0.5, 0.5,
-3.890429, -4.860818, 0.02693391, 1, -0.5, 0.5, 0.5,
-3.890429, -4.860818, 0.02693391, 1, 1.5, 0.5, 0.5,
-3.890429, -4.860818, 0.02693391, 0, 1.5, 0.5, 0.5
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
-2, -3.751697, -5.317271,
3, -3.751697, -5.317271,
-2, -3.751697, -5.317271,
-2, -3.936551, -5.584481,
-1, -3.751697, -5.317271,
-1, -3.936551, -5.584481,
0, -3.751697, -5.317271,
0, -3.936551, -5.584481,
1, -3.751697, -5.317271,
1, -3.936551, -5.584481,
2, -3.751697, -5.317271,
2, -3.936551, -5.584481,
3, -3.751697, -5.317271,
3, -3.936551, -5.584481
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
-2, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
-2, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
-2, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
-2, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5,
-1, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
-1, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
-1, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
-1, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5,
0, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
0, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
0, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
0, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5,
1, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
1, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
1, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
1, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5,
2, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
2, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
2, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
2, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5,
3, -4.306258, -6.118902, 0, -0.5, 0.5, 0.5,
3, -4.306258, -6.118902, 1, -0.5, 0.5, 0.5,
3, -4.306258, -6.118902, 1, 1.5, 0.5, 0.5,
3, -4.306258, -6.118902, 0, 1.5, 0.5, 0.5
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
-2.893118, -2, -5.317271,
-2.893118, 2, -5.317271,
-2.893118, -2, -5.317271,
-3.059336, -2, -5.584481,
-2.893118, 0, -5.317271,
-3.059336, 0, -5.584481,
-2.893118, 2, -5.317271,
-3.059336, 2, -5.584481
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
-3.391773, -2, -6.118902, 0, -0.5, 0.5, 0.5,
-3.391773, -2, -6.118902, 1, -0.5, 0.5, 0.5,
-3.391773, -2, -6.118902, 1, 1.5, 0.5, 0.5,
-3.391773, -2, -6.118902, 0, 1.5, 0.5, 0.5,
-3.391773, 0, -6.118902, 0, -0.5, 0.5, 0.5,
-3.391773, 0, -6.118902, 1, -0.5, 0.5, 0.5,
-3.391773, 0, -6.118902, 1, 1.5, 0.5, 0.5,
-3.391773, 0, -6.118902, 0, 1.5, 0.5, 0.5,
-3.391773, 2, -6.118902, 0, -0.5, 0.5, 0.5,
-3.391773, 2, -6.118902, 1, -0.5, 0.5, 0.5,
-3.391773, 2, -6.118902, 1, 1.5, 0.5, 0.5,
-3.391773, 2, -6.118902, 0, 1.5, 0.5, 0.5
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
-2.893118, -3.751697, -4,
-2.893118, -3.751697, 4,
-2.893118, -3.751697, -4,
-3.059336, -3.936551, -4,
-2.893118, -3.751697, -2,
-3.059336, -3.936551, -2,
-2.893118, -3.751697, 0,
-3.059336, -3.936551, 0,
-2.893118, -3.751697, 2,
-3.059336, -3.936551, 2,
-2.893118, -3.751697, 4,
-3.059336, -3.936551, 4
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
-3.391773, -4.306258, -4, 0, -0.5, 0.5, 0.5,
-3.391773, -4.306258, -4, 1, -0.5, 0.5, 0.5,
-3.391773, -4.306258, -4, 1, 1.5, 0.5, 0.5,
-3.391773, -4.306258, -4, 0, 1.5, 0.5, 0.5,
-3.391773, -4.306258, -2, 0, -0.5, 0.5, 0.5,
-3.391773, -4.306258, -2, 1, -0.5, 0.5, 0.5,
-3.391773, -4.306258, -2, 1, 1.5, 0.5, 0.5,
-3.391773, -4.306258, -2, 0, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 0, 0, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 0, 1, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 0, 1, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 0, 0, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 2, 0, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 2, 1, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 2, 1, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 2, 0, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 4, 0, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 4, 1, -0.5, 0.5, 0.5,
-3.391773, -4.306258, 4, 1, 1.5, 0.5, 0.5,
-3.391773, -4.306258, 4, 0, 1.5, 0.5, 0.5
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
-2.893118, -3.751697, -5.317271,
-2.893118, 3.642441, -5.317271,
-2.893118, -3.751697, 5.371139,
-2.893118, 3.642441, 5.371139,
-2.893118, -3.751697, -5.317271,
-2.893118, -3.751697, 5.371139,
-2.893118, 3.642441, -5.317271,
-2.893118, 3.642441, 5.371139,
-2.893118, -3.751697, -5.317271,
3.755622, -3.751697, -5.317271,
-2.893118, -3.751697, 5.371139,
3.755622, -3.751697, 5.371139,
-2.893118, 3.642441, -5.317271,
3.755622, 3.642441, -5.317271,
-2.893118, 3.642441, 5.371139,
3.755622, 3.642441, 5.371139,
3.755622, -3.751697, -5.317271,
3.755622, 3.642441, -5.317271,
3.755622, -3.751697, 5.371139,
3.755622, 3.642441, 5.371139,
3.755622, -3.751697, -5.317271,
3.755622, -3.751697, 5.371139,
3.755622, 3.642441, -5.317271,
3.755622, 3.642441, 5.371139
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
var radius = 7.795405;
var distance = 34.68264;
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
mvMatrix.translate( -0.431252, 0.05462813, -0.02693391 );
mvMatrix.scale( 1.267691, 1.139896, 0.7885687 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68264);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
(carboxymethylamino)<-read.table("(carboxymethylamino).xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.796291, 2.080554, 0.7891862, 0, 0, 1, 1, 1,
-2.60586, -0.2882046, -2.214459, 1, 0, 0, 1, 1,
-2.5373, -0.9301422, -1.414253, 1, 0, 0, 1, 1,
-2.449579, 0.4919866, -0.01410744, 1, 0, 0, 1, 1,
-2.416146, 0.2398098, -2.682807, 1, 0, 0, 1, 1,
-2.415501, -0.54434, -2.438703, 1, 0, 0, 1, 1,
-2.404253, 0.3439347, -0.0161577, 0, 0, 0, 1, 1,
-2.386158, -1.335084, -2.228139, 0, 0, 0, 1, 1,
-2.360472, -1.389304, -1.776449, 0, 0, 0, 1, 1,
-2.331043, -0.9397332, -2.292407, 0, 0, 0, 1, 1,
-2.284572, -0.1365451, -1.378288, 0, 0, 0, 1, 1,
-2.265607, 0.03243771, -2.224438, 0, 0, 0, 1, 1,
-2.220948, -0.06323908, -0.4716897, 0, 0, 0, 1, 1,
-2.189876, 1.793066, -0.6759666, 1, 1, 1, 1, 1,
-2.168874, 0.4848721, -1.247728, 1, 1, 1, 1, 1,
-2.165857, -1.240218, -1.440719, 1, 1, 1, 1, 1,
-2.14614, 0.4377173, -2.656142, 1, 1, 1, 1, 1,
-2.098477, 1.511797, -1.400338, 1, 1, 1, 1, 1,
-2.083055, 0.7661582, -0.8453965, 1, 1, 1, 1, 1,
-2.036093, 0.2851329, -2.81135, 1, 1, 1, 1, 1,
-2.035801, 0.2717164, -2.375576, 1, 1, 1, 1, 1,
-2.022882, 3.304992, -0.6204109, 1, 1, 1, 1, 1,
-1.974552, 0.8281853, -1.244862, 1, 1, 1, 1, 1,
-1.968006, 1.890914, -1.841088, 1, 1, 1, 1, 1,
-1.961262, -0.3150322, -1.547261, 1, 1, 1, 1, 1,
-1.938628, 1.174698, 0.76226, 1, 1, 1, 1, 1,
-1.938504, 0.3130939, -0.3904325, 1, 1, 1, 1, 1,
-1.872441, 0.4938746, -0.3768862, 1, 1, 1, 1, 1,
-1.854657, 0.1767645, -2.876304, 0, 0, 1, 1, 1,
-1.822001, 0.44482, -3.373133, 1, 0, 0, 1, 1,
-1.808852, 1.02062, -0.2877895, 1, 0, 0, 1, 1,
-1.800486, 1.62044, -1.483733, 1, 0, 0, 1, 1,
-1.784623, -1.646106, -1.725929, 1, 0, 0, 1, 1,
-1.784544, 1.458955, -1.412085, 1, 0, 0, 1, 1,
-1.762674, 0.6305552, -1.438997, 0, 0, 0, 1, 1,
-1.752657, -0.1107617, -2.068327, 0, 0, 0, 1, 1,
-1.727868, 0.1975696, -0.8594596, 0, 0, 0, 1, 1,
-1.716768, -2.411126, -5.161614, 0, 0, 0, 1, 1,
-1.658372, -0.04254717, -1.367669, 0, 0, 0, 1, 1,
-1.643111, 2.305723, -2.119385, 0, 0, 0, 1, 1,
-1.642202, -0.4906413, -2.221068, 0, 0, 0, 1, 1,
-1.635695, -0.9135549, -0.3244508, 1, 1, 1, 1, 1,
-1.619834, -1.370294, -1.921935, 1, 1, 1, 1, 1,
-1.613475, -0.5823167, -1.921319, 1, 1, 1, 1, 1,
-1.601685, -0.7684405, -1.539721, 1, 1, 1, 1, 1,
-1.600809, -1.113651, -2.434309, 1, 1, 1, 1, 1,
-1.579013, 0.1719397, -1.846526, 1, 1, 1, 1, 1,
-1.567612, -1.197694, -2.789208, 1, 1, 1, 1, 1,
-1.564641, -0.06573547, -2.082127, 1, 1, 1, 1, 1,
-1.541408, -0.06832331, -3.04739, 1, 1, 1, 1, 1,
-1.538021, -1.357445, -3.691172, 1, 1, 1, 1, 1,
-1.505717, -1.393896, -2.675238, 1, 1, 1, 1, 1,
-1.489639, 1.705216, -1.802538, 1, 1, 1, 1, 1,
-1.476281, 0.4113313, 0.2841493, 1, 1, 1, 1, 1,
-1.474849, 0.6021218, -0.968399, 1, 1, 1, 1, 1,
-1.467245, -0.7887152, -1.708972, 1, 1, 1, 1, 1,
-1.466412, 2.498671, -1.190871, 0, 0, 1, 1, 1,
-1.460437, -0.06698733, -0.5659085, 1, 0, 0, 1, 1,
-1.455348, 0.3878697, -1.959979, 1, 0, 0, 1, 1,
-1.453055, 0.1636888, -1.223388, 1, 0, 0, 1, 1,
-1.450593, 0.9310329, 0.105955, 1, 0, 0, 1, 1,
-1.45041, -0.8735065, -2.608147, 1, 0, 0, 1, 1,
-1.445346, -0.3198328, -1.940488, 0, 0, 0, 1, 1,
-1.443841, -0.9905245, -2.767662, 0, 0, 0, 1, 1,
-1.44243, 1.246634, -1.916721, 0, 0, 0, 1, 1,
-1.439196, 1.141061, -0.6735053, 0, 0, 0, 1, 1,
-1.438449, 0.2894141, -1.191403, 0, 0, 0, 1, 1,
-1.432728, 1.036099, 0.1121764, 0, 0, 0, 1, 1,
-1.432123, 0.09466782, -1.873333, 0, 0, 0, 1, 1,
-1.42527, -1.091595, -4.190393, 1, 1, 1, 1, 1,
-1.424473, -0.5516096, -2.873222, 1, 1, 1, 1, 1,
-1.410369, -0.73784, -3.506538, 1, 1, 1, 1, 1,
-1.409198, 0.5734866, 0.3187872, 1, 1, 1, 1, 1,
-1.4061, -0.250436, -1.239225, 1, 1, 1, 1, 1,
-1.403738, 1.399568, 0.6854511, 1, 1, 1, 1, 1,
-1.393684, 0.4119761, -1.691365, 1, 1, 1, 1, 1,
-1.39, 0.2295703, -0.9505118, 1, 1, 1, 1, 1,
-1.388972, 1.861903, -0.9143977, 1, 1, 1, 1, 1,
-1.38593, 0.3876225, -2.347888, 1, 1, 1, 1, 1,
-1.376687, 1.024368, -1.056491, 1, 1, 1, 1, 1,
-1.376115, -0.5010251, -1.932725, 1, 1, 1, 1, 1,
-1.376103, 1.817726, 0.101514, 1, 1, 1, 1, 1,
-1.375363, 0.1655242, -2.062149, 1, 1, 1, 1, 1,
-1.362902, -0.01948358, -1.250078, 1, 1, 1, 1, 1,
-1.356769, -1.224352, -1.522069, 0, 0, 1, 1, 1,
-1.348972, 0.647534, -0.9473443, 1, 0, 0, 1, 1,
-1.347819, 0.04275615, -1.488791, 1, 0, 0, 1, 1,
-1.341988, 0.2777182, -2.521729, 1, 0, 0, 1, 1,
-1.333711, 1.536599, -0.003991012, 1, 0, 0, 1, 1,
-1.332592, 1.951794, -0.6906448, 1, 0, 0, 1, 1,
-1.321234, -0.4063183, -1.455893, 0, 0, 0, 1, 1,
-1.316629, -1.260719, -1.114805, 0, 0, 0, 1, 1,
-1.311016, -0.1595772, -2.654953, 0, 0, 0, 1, 1,
-1.309752, -0.6757984, -3.700875, 0, 0, 0, 1, 1,
-1.295263, 0.08565294, -1.431164, 0, 0, 0, 1, 1,
-1.280213, 1.017585, -0.2780347, 0, 0, 0, 1, 1,
-1.273215, -1.609663, -1.777722, 0, 0, 0, 1, 1,
-1.267631, -0.493537, -1.328187, 1, 1, 1, 1, 1,
-1.265109, 0.7111699, -0.2909395, 1, 1, 1, 1, 1,
-1.264423, -0.7594281, -1.531132, 1, 1, 1, 1, 1,
-1.250454, 1.033979, -2.489806, 1, 1, 1, 1, 1,
-1.250306, 0.6736442, -0.4366523, 1, 1, 1, 1, 1,
-1.247529, -0.6266049, -2.983662, 1, 1, 1, 1, 1,
-1.24378, -2.158833, -1.787242, 1, 1, 1, 1, 1,
-1.23811, -0.4116056, -2.038108, 1, 1, 1, 1, 1,
-1.231005, -0.7572219, -2.162986, 1, 1, 1, 1, 1,
-1.22418, -1.88028, -0.3868547, 1, 1, 1, 1, 1,
-1.223484, -1.84032, -0.7322968, 1, 1, 1, 1, 1,
-1.216404, 0.9145917, -2.539489, 1, 1, 1, 1, 1,
-1.210626, 0.5589088, -3.125698, 1, 1, 1, 1, 1,
-1.19626, 1.40135, 1.421842, 1, 1, 1, 1, 1,
-1.19059, -0.5718258, -2.392134, 1, 1, 1, 1, 1,
-1.190112, -0.6470219, -1.529812, 0, 0, 1, 1, 1,
-1.184823, 2.591164, -1.724607, 1, 0, 0, 1, 1,
-1.180837, 0.3074948, -2.163439, 1, 0, 0, 1, 1,
-1.173307, -0.1720031, -0.6169654, 1, 0, 0, 1, 1,
-1.16866, 1.818328, -1.571542, 1, 0, 0, 1, 1,
-1.162676, 0.6514992, -0.9862593, 1, 0, 0, 1, 1,
-1.160954, 0.4669113, -1.78132, 0, 0, 0, 1, 1,
-1.150404, -2.909961, -1.895809, 0, 0, 0, 1, 1,
-1.137999, 0.1639418, -0.7432954, 0, 0, 0, 1, 1,
-1.137681, 1.271442, -0.3125083, 0, 0, 0, 1, 1,
-1.133262, -0.6452299, -3.013884, 0, 0, 0, 1, 1,
-1.133194, 0.5376174, -1.455663, 0, 0, 0, 1, 1,
-1.131997, 0.7132025, -0.01376707, 0, 0, 0, 1, 1,
-1.123081, 0.06592627, -1.488045, 1, 1, 1, 1, 1,
-1.121805, 0.1795833, -0.5496813, 1, 1, 1, 1, 1,
-1.11608, 0.1550723, -3.149616, 1, 1, 1, 1, 1,
-1.106207, -0.09297618, -1.807831, 1, 1, 1, 1, 1,
-1.104461, 0.6352217, -2.844601, 1, 1, 1, 1, 1,
-1.095625, 0.05257022, -0.6982533, 1, 1, 1, 1, 1,
-1.095333, 0.6521209, -1.141727, 1, 1, 1, 1, 1,
-1.085505, 0.7757272, 0.07087526, 1, 1, 1, 1, 1,
-1.081043, 0.8551894, -1.460504, 1, 1, 1, 1, 1,
-1.079955, -0.7184077, -2.244944, 1, 1, 1, 1, 1,
-1.079714, 1.385133, -0.734774, 1, 1, 1, 1, 1,
-1.066203, 1.189739, -0.6638675, 1, 1, 1, 1, 1,
-1.06013, -0.7029667, -3.97536, 1, 1, 1, 1, 1,
-1.0558, 0.2642036, -1.853907, 1, 1, 1, 1, 1,
-1.052427, -0.2068203, -2.663754, 1, 1, 1, 1, 1,
-1.049251, 0.1763298, -0.297421, 0, 0, 1, 1, 1,
-1.032312, -0.5665363, -1.860148, 1, 0, 0, 1, 1,
-1.030336, 0.6827881, -1.048205, 1, 0, 0, 1, 1,
-1.026587, -0.6392119, -2.555748, 1, 0, 0, 1, 1,
-1.019377, 2.46411, 0.006394678, 1, 0, 0, 1, 1,
-1.016924, -0.07426359, -0.6842115, 1, 0, 0, 1, 1,
-1.016069, 0.7409602, -1.238764, 0, 0, 0, 1, 1,
-1.010455, 0.6989377, -2.980321, 0, 0, 0, 1, 1,
-1.006827, -1.456678, -0.908796, 0, 0, 0, 1, 1,
-1.006247, -0.6522116, -2.879678, 0, 0, 0, 1, 1,
-1.004544, 1.122842, -0.8201829, 0, 0, 0, 1, 1,
-1.004079, 2.574664, -0.9941621, 0, 0, 0, 1, 1,
-0.9980999, -0.8733521, -3.254897, 0, 0, 0, 1, 1,
-0.9941583, 0.3608479, -1.043081, 1, 1, 1, 1, 1,
-0.993457, -1.952724, -3.08236, 1, 1, 1, 1, 1,
-0.9925424, -0.3027191, -0.4587565, 1, 1, 1, 1, 1,
-0.9895394, 0.06952324, -1.0461, 1, 1, 1, 1, 1,
-0.986233, -0.4948858, -1.250849, 1, 1, 1, 1, 1,
-0.98234, -0.972154, -3.661225, 1, 1, 1, 1, 1,
-0.9817044, 1.131849, -0.7057202, 1, 1, 1, 1, 1,
-0.9809782, -1.540381, -1.580948, 1, 1, 1, 1, 1,
-0.9788916, 1.440062, -0.01614428, 1, 1, 1, 1, 1,
-0.9748377, 0.99864, -1.635208, 1, 1, 1, 1, 1,
-0.9694057, 2.19321, -1.677491, 1, 1, 1, 1, 1,
-0.947989, 0.9447871, -0.4257859, 1, 1, 1, 1, 1,
-0.9458207, -1.613935, -3.187407, 1, 1, 1, 1, 1,
-0.9444973, 0.4975061, -2.423974, 1, 1, 1, 1, 1,
-0.9441855, 2.045155, -0.06409786, 1, 1, 1, 1, 1,
-0.9408591, 1.056848, -0.4457633, 0, 0, 1, 1, 1,
-0.9381519, 1.60379, 0.9272979, 1, 0, 0, 1, 1,
-0.9358848, 0.7777673, -2.757429, 1, 0, 0, 1, 1,
-0.9305056, -0.7095633, -1.037999, 1, 0, 0, 1, 1,
-0.9254864, 0.3254906, -2.362362, 1, 0, 0, 1, 1,
-0.9217907, -0.4309484, -2.052316, 1, 0, 0, 1, 1,
-0.9191314, 0.1940363, -0.8379791, 0, 0, 0, 1, 1,
-0.9175265, 0.781673, -0.6239525, 0, 0, 0, 1, 1,
-0.9157767, -1.956965, -2.893558, 0, 0, 0, 1, 1,
-0.90891, -0.2727382, -0.7732729, 0, 0, 0, 1, 1,
-0.9082116, 1.95039, -2.177827, 0, 0, 0, 1, 1,
-0.9047508, 0.2813224, -1.989733, 0, 0, 0, 1, 1,
-0.9034591, 2.287846, 2.971311, 0, 0, 0, 1, 1,
-0.902521, -0.4594857, -2.699664, 1, 1, 1, 1, 1,
-0.900747, -0.4103509, -2.859742, 1, 1, 1, 1, 1,
-0.8985763, -2.565408, -3.545548, 1, 1, 1, 1, 1,
-0.8911659, 1.083932, -0.2360234, 1, 1, 1, 1, 1,
-0.8893762, 0.1479863, -0.7751973, 1, 1, 1, 1, 1,
-0.878059, 1.070929, -1.556004, 1, 1, 1, 1, 1,
-0.8739327, -2.289538, -2.016739, 1, 1, 1, 1, 1,
-0.8697919, 0.4191885, -0.03704135, 1, 1, 1, 1, 1,
-0.8681955, -0.03061822, -1.026264, 1, 1, 1, 1, 1,
-0.868016, 1.124783, -0.372488, 1, 1, 1, 1, 1,
-0.8622685, 1.136024, -1.129895, 1, 1, 1, 1, 1,
-0.8618011, -0.9113799, -1.488329, 1, 1, 1, 1, 1,
-0.8580906, -0.889816, -2.240025, 1, 1, 1, 1, 1,
-0.85155, 1.257787, -1.473602, 1, 1, 1, 1, 1,
-0.8446769, -1.100357, -2.553105, 1, 1, 1, 1, 1,
-0.8443195, 0.9041908, -0.4741328, 0, 0, 1, 1, 1,
-0.8438504, -1.013964, -1.744897, 1, 0, 0, 1, 1,
-0.842388, 0.1770652, -2.296032, 1, 0, 0, 1, 1,
-0.8415752, 1.032191, -3.210076, 1, 0, 0, 1, 1,
-0.8390321, 0.5196292, -2.281607, 1, 0, 0, 1, 1,
-0.8349105, -1.913437, -2.704774, 1, 0, 0, 1, 1,
-0.8296235, -0.3510843, -3.144271, 0, 0, 0, 1, 1,
-0.8296077, 0.8826512, 0.1774464, 0, 0, 0, 1, 1,
-0.8289173, 2.011834, -0.8124647, 0, 0, 0, 1, 1,
-0.8266588, -0.1530266, -1.516751, 0, 0, 0, 1, 1,
-0.8258783, 0.3926957, 1.164127, 0, 0, 0, 1, 1,
-0.8212433, 0.5311658, -0.5999047, 0, 0, 0, 1, 1,
-0.8208595, 2.242259, 0.258306, 0, 0, 0, 1, 1,
-0.8207341, -0.9061337, -2.47946, 1, 1, 1, 1, 1,
-0.8174304, -0.6707621, -4.084001, 1, 1, 1, 1, 1,
-0.8160946, -0.2410041, -2.206517, 1, 1, 1, 1, 1,
-0.814571, -0.8869144, -0.7110268, 1, 1, 1, 1, 1,
-0.8127823, -1.587523, -2.489596, 1, 1, 1, 1, 1,
-0.8119329, 0.03055504, -0.3015835, 1, 1, 1, 1, 1,
-0.8054857, 0.8417209, -1.618684, 1, 1, 1, 1, 1,
-0.8041387, -0.7547092, -1.116636, 1, 1, 1, 1, 1,
-0.7965379, -0.8052738, -3.496715, 1, 1, 1, 1, 1,
-0.7938265, -0.2935537, -1.517888, 1, 1, 1, 1, 1,
-0.7923124, 0.7094476, 0.179455, 1, 1, 1, 1, 1,
-0.78901, 0.4108465, -1.507482, 1, 1, 1, 1, 1,
-0.7882594, -0.4184693, -1.86894, 1, 1, 1, 1, 1,
-0.7878878, 0.09310105, -2.602465, 1, 1, 1, 1, 1,
-0.7811908, -3.644016, -3.318356, 1, 1, 1, 1, 1,
-0.7646642, -0.1456357, -2.761141, 0, 0, 1, 1, 1,
-0.7644015, 0.5470008, -1.87982, 1, 0, 0, 1, 1,
-0.7639329, 0.6783892, -0.7511851, 1, 0, 0, 1, 1,
-0.7569039, -0.3418491, -2.871608, 1, 0, 0, 1, 1,
-0.7432722, -0.8896973, -2.179245, 1, 0, 0, 1, 1,
-0.7404667, -0.5353038, -1.678523, 1, 0, 0, 1, 1,
-0.7397144, 1.228332, -0.3824344, 0, 0, 0, 1, 1,
-0.7337235, -0.8708934, -2.89784, 0, 0, 0, 1, 1,
-0.7291149, 0.2864458, -2.070572, 0, 0, 0, 1, 1,
-0.7249287, -0.4540265, -1.779424, 0, 0, 0, 1, 1,
-0.7217427, 0.6530157, -2.39159, 0, 0, 0, 1, 1,
-0.7186579, -1.650151, -3.317695, 0, 0, 0, 1, 1,
-0.7152028, 0.1433444, -0.938379, 0, 0, 0, 1, 1,
-0.7148074, 0.575191, -1.133968, 1, 1, 1, 1, 1,
-0.7135564, 1.071199, -0.4739974, 1, 1, 1, 1, 1,
-0.7089313, -1.324072, -1.905842, 1, 1, 1, 1, 1,
-0.7032102, -0.763738, -1.701139, 1, 1, 1, 1, 1,
-0.7023806, -0.03462055, -2.238142, 1, 1, 1, 1, 1,
-0.7016775, 0.7542737, -0.07771153, 1, 1, 1, 1, 1,
-0.6990958, 0.07555611, -1.274638, 1, 1, 1, 1, 1,
-0.6981925, 1.362497, -0.4614437, 1, 1, 1, 1, 1,
-0.6921524, -0.5218031, -3.386973, 1, 1, 1, 1, 1,
-0.6902639, -1.201626, -3.175824, 1, 1, 1, 1, 1,
-0.6894472, 0.3854365, -1.332562, 1, 1, 1, 1, 1,
-0.6866753, -0.6447307, -2.465062, 1, 1, 1, 1, 1,
-0.6830913, 0.5074621, -0.9967329, 1, 1, 1, 1, 1,
-0.6828688, 1.639767, 1.60399, 1, 1, 1, 1, 1,
-0.6777109, 1.211827, -0.07630607, 1, 1, 1, 1, 1,
-0.6723505, 0.6408992, 0.5256705, 0, 0, 1, 1, 1,
-0.6719872, -2.196333, -2.135067, 1, 0, 0, 1, 1,
-0.6690894, 1.118586, -0.1502482, 1, 0, 0, 1, 1,
-0.6667699, -0.4751411, -0.3090643, 1, 0, 0, 1, 1,
-0.6591594, -0.7249081, -2.463164, 1, 0, 0, 1, 1,
-0.6543257, 0.5650502, 0.1952122, 1, 0, 0, 1, 1,
-0.6536798, -1.500359, -3.115298, 0, 0, 0, 1, 1,
-0.6535376, -0.4935597, -3.586859, 0, 0, 0, 1, 1,
-0.6524958, -0.752459, -2.782479, 0, 0, 0, 1, 1,
-0.6480178, 1.447407, -1.914683, 0, 0, 0, 1, 1,
-0.6460915, 0.8743883, -1.664955, 0, 0, 0, 1, 1,
-0.6453418, -1.747624, -2.383277, 0, 0, 0, 1, 1,
-0.6443958, -1.260333, -1.602283, 0, 0, 0, 1, 1,
-0.6382274, 0.03819182, -0.3018336, 1, 1, 1, 1, 1,
-0.6316501, 2.596132, -1.016728, 1, 1, 1, 1, 1,
-0.631506, 0.4516266, -0.4084475, 1, 1, 1, 1, 1,
-0.6309557, -1.071324, -2.843608, 1, 1, 1, 1, 1,
-0.6256171, -0.7330745, -1.589768, 1, 1, 1, 1, 1,
-0.6233332, -0.5260914, -1.723879, 1, 1, 1, 1, 1,
-0.6221203, 0.3381474, -1.629432, 1, 1, 1, 1, 1,
-0.6126343, -1.549379, -2.569591, 1, 1, 1, 1, 1,
-0.6087348, -0.6396949, -3.108553, 1, 1, 1, 1, 1,
-0.6038932, 0.9757699, 0.3875957, 1, 1, 1, 1, 1,
-0.602984, 0.893079, -0.3023497, 1, 1, 1, 1, 1,
-0.6026997, -0.4717892, -2.196965, 1, 1, 1, 1, 1,
-0.5988943, 0.6843624, 2.253491, 1, 1, 1, 1, 1,
-0.5919726, 1.4297, 0.9302786, 1, 1, 1, 1, 1,
-0.5890872, 1.612477, 0.9982921, 1, 1, 1, 1, 1,
-0.585151, -0.7431648, -2.22401, 0, 0, 1, 1, 1,
-0.5842481, 1.213777, -1.585504, 1, 0, 0, 1, 1,
-0.5809156, -1.410941, -3.103682, 1, 0, 0, 1, 1,
-0.5804042, 0.8416293, -1.833202, 1, 0, 0, 1, 1,
-0.5802854, 0.1727876, -0.63678, 1, 0, 0, 1, 1,
-0.5799683, -0.1616676, -3.482564, 1, 0, 0, 1, 1,
-0.5773308, -0.8970827, -2.832345, 0, 0, 0, 1, 1,
-0.5763775, 0.238639, -1.230838, 0, 0, 0, 1, 1,
-0.5741581, -1.226883, -1.781627, 0, 0, 0, 1, 1,
-0.5670864, -0.748705, -1.579096, 0, 0, 0, 1, 1,
-0.5649242, 0.9861228, -2.319921, 0, 0, 0, 1, 1,
-0.564317, 0.6107575, -1.112336, 0, 0, 0, 1, 1,
-0.5641224, 0.1705214, -1.271657, 0, 0, 0, 1, 1,
-0.562731, -1.133105, -2.959154, 1, 1, 1, 1, 1,
-0.5626614, 0.3289024, -2.518269, 1, 1, 1, 1, 1,
-0.5622443, -0.6915625, -2.296408, 1, 1, 1, 1, 1,
-0.5602903, -0.8539658, -1.544287, 1, 1, 1, 1, 1,
-0.5537992, 0.5625806, -1.083192, 1, 1, 1, 1, 1,
-0.5511577, -0.6529563, -4.101954, 1, 1, 1, 1, 1,
-0.5495545, -0.3825931, -3.602321, 1, 1, 1, 1, 1,
-0.5461787, 0.3580728, 0.9731924, 1, 1, 1, 1, 1,
-0.5410889, 0.3603278, -2.20292, 1, 1, 1, 1, 1,
-0.5409194, -0.3090119, -2.147389, 1, 1, 1, 1, 1,
-0.5398753, 0.4440238, -1.007772, 1, 1, 1, 1, 1,
-0.5339428, -0.09998342, -2.071685, 1, 1, 1, 1, 1,
-0.5309356, 0.909161, -0.9899148, 1, 1, 1, 1, 1,
-0.5305942, -0.2031186, -2.039935, 1, 1, 1, 1, 1,
-0.522217, -0.2254129, -1.399119, 1, 1, 1, 1, 1,
-0.5191024, 0.1862109, -1.787456, 0, 0, 1, 1, 1,
-0.514295, 0.2362108, 0.4461369, 1, 0, 0, 1, 1,
-0.5077953, -0.5791127, -3.98071, 1, 0, 0, 1, 1,
-0.5008551, 0.4187571, 1.393935, 1, 0, 0, 1, 1,
-0.4873593, -0.2301931, -0.7280492, 1, 0, 0, 1, 1,
-0.4816772, 1.459891, 0.149542, 1, 0, 0, 1, 1,
-0.4796344, -1.099406, -2.375359, 0, 0, 0, 1, 1,
-0.4749218, 0.640083, -2.562342, 0, 0, 0, 1, 1,
-0.4712743, 1.580529, -1.009862, 0, 0, 0, 1, 1,
-0.4684086, -0.5042189, -2.576907, 0, 0, 0, 1, 1,
-0.467065, 2.418662, 0.2347556, 0, 0, 0, 1, 1,
-0.4614449, 0.7365387, -1.88652, 0, 0, 0, 1, 1,
-0.4608892, 0.261945, -2.208848, 0, 0, 0, 1, 1,
-0.4576089, -1.091138, -2.704849, 1, 1, 1, 1, 1,
-0.4541713, 0.4464239, -1.725197, 1, 1, 1, 1, 1,
-0.4528098, 0.9462956, -0.128311, 1, 1, 1, 1, 1,
-0.4493678, -0.8824576, -3.372512, 1, 1, 1, 1, 1,
-0.4461134, -1.290973, -3.421564, 1, 1, 1, 1, 1,
-0.4417001, -0.08779417, -1.167125, 1, 1, 1, 1, 1,
-0.4408347, -0.3227579, -2.047053, 1, 1, 1, 1, 1,
-0.4365681, 1.187694, 0.4418871, 1, 1, 1, 1, 1,
-0.4336557, 0.0950617, -2.451257, 1, 1, 1, 1, 1,
-0.4304011, -0.3076178, -3.231329, 1, 1, 1, 1, 1,
-0.4274071, 0.06867975, -0.9475784, 1, 1, 1, 1, 1,
-0.4205373, 1.049025, 0.1060976, 1, 1, 1, 1, 1,
-0.420006, -0.02558023, -1.71018, 1, 1, 1, 1, 1,
-0.4194877, 0.3072697, -2.056817, 1, 1, 1, 1, 1,
-0.4194195, 0.3500644, -0.9648574, 1, 1, 1, 1, 1,
-0.4178385, 1.373173, -0.1403134, 0, 0, 1, 1, 1,
-0.4161396, -2.711873, -2.727777, 1, 0, 0, 1, 1,
-0.4132472, 1.105306, -1.836589, 1, 0, 0, 1, 1,
-0.4086791, -0.390105, -0.7740548, 1, 0, 0, 1, 1,
-0.4028547, 1.225895, -1.264024, 1, 0, 0, 1, 1,
-0.4027056, -0.9644272, -2.031135, 1, 0, 0, 1, 1,
-0.3985058, -0.1845496, -2.353032, 0, 0, 0, 1, 1,
-0.3947984, -0.616533, -2.456688, 0, 0, 0, 1, 1,
-0.390302, -0.2814596, -3.330009, 0, 0, 0, 1, 1,
-0.3896959, -0.5777161, -3.734863, 0, 0, 0, 1, 1,
-0.3890463, -0.743673, -3.531613, 0, 0, 0, 1, 1,
-0.3888348, 1.309415, 0.6657892, 0, 0, 0, 1, 1,
-0.386512, 0.1729951, -2.003404, 0, 0, 0, 1, 1,
-0.3848946, -0.4037176, -1.444217, 1, 1, 1, 1, 1,
-0.3838452, 0.8321025, 1.008383, 1, 1, 1, 1, 1,
-0.377797, -1.178279, -1.627198, 1, 1, 1, 1, 1,
-0.3732866, -1.351275, -3.678138, 1, 1, 1, 1, 1,
-0.3730195, -0.4520648, -2.819456, 1, 1, 1, 1, 1,
-0.3715636, 0.2276876, -1.178776, 1, 1, 1, 1, 1,
-0.3693153, -0.7725032, -1.714029, 1, 1, 1, 1, 1,
-0.3662981, -0.2589148, -3.810758, 1, 1, 1, 1, 1,
-0.3659109, -0.9585748, -4.718024, 1, 1, 1, 1, 1,
-0.3627069, 0.5184934, 0.7457175, 1, 1, 1, 1, 1,
-0.3611561, -0.4238044, -0.7836056, 1, 1, 1, 1, 1,
-0.3557909, -0.7890525, -2.308998, 1, 1, 1, 1, 1,
-0.3476157, -0.8104005, -0.7902222, 1, 1, 1, 1, 1,
-0.3390447, -0.348953, -2.105652, 1, 1, 1, 1, 1,
-0.3375619, -0.01278735, -1.445111, 1, 1, 1, 1, 1,
-0.3372107, -1.531127, -4.012473, 0, 0, 1, 1, 1,
-0.3284264, -0.3757119, -3.330654, 1, 0, 0, 1, 1,
-0.3269837, 0.2388537, -2.972254, 1, 0, 0, 1, 1,
-0.3265435, 1.074703, 0.364569, 1, 0, 0, 1, 1,
-0.3245254, -0.007326812, -0.1558338, 1, 0, 0, 1, 1,
-0.3164035, -0.1896378, -0.9871015, 1, 0, 0, 1, 1,
-0.3144584, 0.340805, -1.779013, 0, 0, 0, 1, 1,
-0.3126181, -1.060137, -3.237402, 0, 0, 0, 1, 1,
-0.3104824, -1.136314, -2.461678, 0, 0, 0, 1, 1,
-0.3053574, 0.4564359, -2.27385, 0, 0, 0, 1, 1,
-0.3027303, -0.3026139, -0.3906179, 0, 0, 0, 1, 1,
-0.2961276, 0.3887796, -0.9943885, 0, 0, 0, 1, 1,
-0.2960004, -0.3953734, -1.991842, 0, 0, 0, 1, 1,
-0.293924, -0.5883421, -2.943527, 1, 1, 1, 1, 1,
-0.2907423, -0.1406717, -2.775693, 1, 1, 1, 1, 1,
-0.2903011, 1.931715, 0.4108603, 1, 1, 1, 1, 1,
-0.2888442, 0.7118081, 1.232359, 1, 1, 1, 1, 1,
-0.2886211, -0.5759469, -3.326195, 1, 1, 1, 1, 1,
-0.2869235, -0.5737217, -3.189379, 1, 1, 1, 1, 1,
-0.2794398, 0.9553438, 0.01002988, 1, 1, 1, 1, 1,
-0.2784362, -0.1066994, -4.49509, 1, 1, 1, 1, 1,
-0.2783711, 1.020946, 0.6903338, 1, 1, 1, 1, 1,
-0.2692078, 0.2439974, -0.3270129, 1, 1, 1, 1, 1,
-0.2672164, -0.06023177, -1.993101, 1, 1, 1, 1, 1,
-0.2627432, 0.6926547, -0.597834, 1, 1, 1, 1, 1,
-0.2617263, 1.376738, -0.07006606, 1, 1, 1, 1, 1,
-0.2571836, 0.0917962, -1.382851, 1, 1, 1, 1, 1,
-0.2534886, -0.3276538, -2.496869, 1, 1, 1, 1, 1,
-0.2525446, 0.4144043, -0.5296091, 0, 0, 1, 1, 1,
-0.2511772, -0.3013758, -0.470502, 1, 0, 0, 1, 1,
-0.2507961, -0.2052311, -0.3479933, 1, 0, 0, 1, 1,
-0.2486427, -0.2945631, -2.212291, 1, 0, 0, 1, 1,
-0.2444519, 1.14441, -0.3332877, 1, 0, 0, 1, 1,
-0.2438745, 0.08084354, -0.9800438, 1, 0, 0, 1, 1,
-0.2428504, -0.1451301, -2.204539, 0, 0, 0, 1, 1,
-0.2423774, -1.486811, -3.766856, 0, 0, 0, 1, 1,
-0.2418173, -1.160798, -2.624045, 0, 0, 0, 1, 1,
-0.2412561, -0.1554943, -2.89214, 0, 0, 0, 1, 1,
-0.2367026, -0.7700629, -3.22465, 0, 0, 0, 1, 1,
-0.2328504, 1.056589, 0.1091541, 0, 0, 0, 1, 1,
-0.2296598, -0.1533385, -2.369048, 0, 0, 0, 1, 1,
-0.2294776, -0.1539766, -1.997766, 1, 1, 1, 1, 1,
-0.2292133, -0.3382253, -3.407657, 1, 1, 1, 1, 1,
-0.2278671, -0.03239053, -0.8921233, 1, 1, 1, 1, 1,
-0.2274104, -0.1767047, -2.280528, 1, 1, 1, 1, 1,
-0.2262557, -0.2492869, -1.013003, 1, 1, 1, 1, 1,
-0.2226557, 1.164621, -0.6450565, 1, 1, 1, 1, 1,
-0.2223836, 2.262882, -0.2613881, 1, 1, 1, 1, 1,
-0.2199497, 1.079116, -0.319466, 1, 1, 1, 1, 1,
-0.2198459, 0.8116223, -1.349674, 1, 1, 1, 1, 1,
-0.2161504, -0.1703574, -2.774957, 1, 1, 1, 1, 1,
-0.2123368, 1.387108, 3.237674, 1, 1, 1, 1, 1,
-0.2116575, 0.6546628, -0.294417, 1, 1, 1, 1, 1,
-0.2113595, 0.434518, 1.215114, 1, 1, 1, 1, 1,
-0.2078632, -0.2101009, -2.233452, 1, 1, 1, 1, 1,
-0.2072506, -0.5495853, -3.553091, 1, 1, 1, 1, 1,
-0.2038127, 0.4159824, -2.406737, 0, 0, 1, 1, 1,
-0.1992226, 1.965528, 1.174213, 1, 0, 0, 1, 1,
-0.1985537, 0.9958508, -0.6872676, 1, 0, 0, 1, 1,
-0.1976541, 0.4268531, -1.160726, 1, 0, 0, 1, 1,
-0.1975852, 1.136268, -2.084591, 1, 0, 0, 1, 1,
-0.1962573, -0.4274349, -3.821712, 1, 0, 0, 1, 1,
-0.194633, 0.3403307, -0.1965349, 0, 0, 0, 1, 1,
-0.194628, -0.9013487, -1.947835, 0, 0, 0, 1, 1,
-0.1933685, 0.8803628, -0.6215158, 0, 0, 0, 1, 1,
-0.1894887, 0.602832, 1.682192, 0, 0, 0, 1, 1,
-0.1883041, -1.382692, -4.510035, 0, 0, 0, 1, 1,
-0.1865879, -1.277893, -4.286996, 0, 0, 0, 1, 1,
-0.1855834, -0.6008151, -2.594851, 0, 0, 0, 1, 1,
-0.1813921, -0.4031696, -4.111553, 1, 1, 1, 1, 1,
-0.1781673, -1.846523, -3.040374, 1, 1, 1, 1, 1,
-0.1737596, 0.1158263, 0.2614731, 1, 1, 1, 1, 1,
-0.1687915, 3.034826, 1.426115, 1, 1, 1, 1, 1,
-0.1612552, -1.109316, -3.191275, 1, 1, 1, 1, 1,
-0.1596228, -0.9288715, -1.710101, 1, 1, 1, 1, 1,
-0.1574178, 0.7816641, -0.8410817, 1, 1, 1, 1, 1,
-0.1545525, -1.214118, -3.239492, 1, 1, 1, 1, 1,
-0.1494934, -0.8145965, -3.065774, 1, 1, 1, 1, 1,
-0.1469698, -0.2753636, -2.095845, 1, 1, 1, 1, 1,
-0.1469261, -0.2668141, -3.309947, 1, 1, 1, 1, 1,
-0.1428757, -1.826867, -3.458272, 1, 1, 1, 1, 1,
-0.1368944, -1.982893, -2.094332, 1, 1, 1, 1, 1,
-0.1340301, 0.4501118, 0.03071201, 1, 1, 1, 1, 1,
-0.1318783, -0.7952321, -1.816559, 1, 1, 1, 1, 1,
-0.1304415, 0.8902455, 1.281392, 0, 0, 1, 1, 1,
-0.1204203, 0.7031229, 1.140542, 1, 0, 0, 1, 1,
-0.1167411, -0.4563607, -2.614017, 1, 0, 0, 1, 1,
-0.1160476, -0.06062678, 0.3093832, 1, 0, 0, 1, 1,
-0.1129814, 0.8746986, -0.5178671, 1, 0, 0, 1, 1,
-0.1120454, -0.7243611, -3.18329, 1, 0, 0, 1, 1,
-0.1052495, 0.8669339, 0.03489526, 0, 0, 0, 1, 1,
-0.1010891, -0.8490788, -2.137332, 0, 0, 0, 1, 1,
-0.1007447, -0.178097, -1.190983, 0, 0, 0, 1, 1,
-0.1007201, 0.003736218, -0.1796029, 0, 0, 0, 1, 1,
-0.09724178, -0.615587, -3.380152, 0, 0, 0, 1, 1,
-0.09458935, 0.1460028, -0.4039015, 0, 0, 0, 1, 1,
-0.09342498, 0.3041145, -3.169258, 0, 0, 0, 1, 1,
-0.0924861, 0.8613036, -0.8663872, 1, 1, 1, 1, 1,
-0.09114984, -0.0936899, -1.848694, 1, 1, 1, 1, 1,
-0.08929382, 0.925246, -1.42577, 1, 1, 1, 1, 1,
-0.0888673, -0.6981892, -3.346781, 1, 1, 1, 1, 1,
-0.08571058, -1.174962, -3.546808, 1, 1, 1, 1, 1,
-0.085212, 0.1145311, -0.03307298, 1, 1, 1, 1, 1,
-0.08397266, -0.04044123, -2.512103, 1, 1, 1, 1, 1,
-0.0719431, 1.346314, -1.881837, 1, 1, 1, 1, 1,
-0.07113355, -1.454591, -3.385746, 1, 1, 1, 1, 1,
-0.06945946, 0.3579518, 1.706718, 1, 1, 1, 1, 1,
-0.06812065, 0.7981496, -0.03919494, 1, 1, 1, 1, 1,
-0.06230273, 0.6084121, -0.8473646, 1, 1, 1, 1, 1,
-0.06118424, -0.4888929, -4.722534, 1, 1, 1, 1, 1,
-0.05719278, -1.781859, -1.970034, 1, 1, 1, 1, 1,
-0.05539363, 2.323644, 0.1448715, 1, 1, 1, 1, 1,
-0.04783278, -0.2311428, -2.694322, 0, 0, 1, 1, 1,
-0.0466543, -0.4429124, -3.099505, 1, 0, 0, 1, 1,
-0.04217586, 0.8474675, -0.06839742, 1, 0, 0, 1, 1,
-0.0352695, -0.7410517, -2.670002, 1, 0, 0, 1, 1,
-0.03514673, 0.7986112, -1.229151, 1, 0, 0, 1, 1,
-0.03452247, 0.6445976, -0.6026933, 1, 0, 0, 1, 1,
-0.0335041, 0.374775, -0.06913362, 0, 0, 0, 1, 1,
-0.03121046, 0.6964111, -0.7763868, 0, 0, 0, 1, 1,
-0.03014161, -0.229898, -3.847172, 0, 0, 0, 1, 1,
-0.03001541, 1.486397, 0.7256826, 0, 0, 0, 1, 1,
-0.01918079, 1.679722, -0.41239, 0, 0, 0, 1, 1,
-0.01906461, 0.4447817, -0.1300055, 0, 0, 0, 1, 1,
-0.01757812, -0.8571575, -2.913678, 0, 0, 0, 1, 1,
-0.01006907, -0.7904824, -3.055481, 1, 1, 1, 1, 1,
-0.009433785, -0.3424361, -2.803053, 1, 1, 1, 1, 1,
-0.007184956, 0.9534863, 1.126639, 1, 1, 1, 1, 1,
-0.005951514, 0.3007772, 0.2916796, 1, 1, 1, 1, 1,
-0.005930786, 1.262573, 0.3662681, 1, 1, 1, 1, 1,
-0.002853929, -1.03949, -2.901965, 1, 1, 1, 1, 1,
-0.002040824, 0.7480115, 2.309926, 1, 1, 1, 1, 1,
-0.002006333, -0.6859545, -2.944284, 1, 1, 1, 1, 1,
-0.0007584956, -0.1975305, -4.867128, 1, 1, 1, 1, 1,
0.0001652931, 0.07324614, 0.3066379, 1, 1, 1, 1, 1,
0.0005979054, -1.238906, 2.708256, 1, 1, 1, 1, 1,
0.0007059444, -0.1283154, 4.219224, 1, 1, 1, 1, 1,
0.003157408, -0.2491174, 1.573421, 1, 1, 1, 1, 1,
0.003324975, 1.412353, -1.244038, 1, 1, 1, 1, 1,
0.008241752, 1.4894, -1.114756, 1, 1, 1, 1, 1,
0.01139514, -0.2712886, 3.975963, 0, 0, 1, 1, 1,
0.01164268, -1.187556, 2.234327, 1, 0, 0, 1, 1,
0.01264107, 0.3129642, -0.983133, 1, 0, 0, 1, 1,
0.01272619, 0.2961935, -0.03042374, 1, 0, 0, 1, 1,
0.01454895, -0.3451962, 3.88251, 1, 0, 0, 1, 1,
0.01536036, 0.3785725, 0.06664236, 1, 0, 0, 1, 1,
0.01623095, 0.4628217, 1.372198, 0, 0, 0, 1, 1,
0.0190945, -0.9630069, 3.029271, 0, 0, 0, 1, 1,
0.02214854, -1.341112, 3.855952, 0, 0, 0, 1, 1,
0.02311703, 0.1705517, -2.291273, 0, 0, 0, 1, 1,
0.02935722, 0.5490265, 0.74549, 0, 0, 0, 1, 1,
0.03195892, -0.1657408, 4.100337, 0, 0, 0, 1, 1,
0.03325897, -0.8087033, 3.785383, 0, 0, 0, 1, 1,
0.03495351, -2.336475, 3.843472, 1, 1, 1, 1, 1,
0.03507553, 0.8954701, -0.03374987, 1, 1, 1, 1, 1,
0.03632432, 1.015223, 0.4343854, 1, 1, 1, 1, 1,
0.03765233, -0.2612619, 3.263083, 1, 1, 1, 1, 1,
0.03848578, -0.5303923, 3.79592, 1, 1, 1, 1, 1,
0.04071905, 0.7395566, 1.393682, 1, 1, 1, 1, 1,
0.04520152, 0.1385004, 0.5777578, 1, 1, 1, 1, 1,
0.04579238, -0.8076087, 2.832576, 1, 1, 1, 1, 1,
0.04810782, -0.5851285, 3.465946, 1, 1, 1, 1, 1,
0.0489716, -1.292124, 3.210856, 1, 1, 1, 1, 1,
0.04904753, -0.4072585, 3.844643, 1, 1, 1, 1, 1,
0.05115713, 1.73769, -0.5768237, 1, 1, 1, 1, 1,
0.0512441, -1.538036, 2.260695, 1, 1, 1, 1, 1,
0.0520569, -0.06244636, 2.17847, 1, 1, 1, 1, 1,
0.05282579, -0.3530468, 1.565123, 1, 1, 1, 1, 1,
0.05951148, -0.339357, 2.184505, 0, 0, 1, 1, 1,
0.0613893, -0.445074, 4.078059, 1, 0, 0, 1, 1,
0.06315555, 0.8633865, -0.3640321, 1, 0, 0, 1, 1,
0.06727345, -0.5086444, 1.087294, 1, 0, 0, 1, 1,
0.06994904, -0.443879, 2.472232, 1, 0, 0, 1, 1,
0.07244512, 0.000850565, 1.826465, 1, 0, 0, 1, 1,
0.07337256, 1.461007, 1.217049, 0, 0, 0, 1, 1,
0.07370762, 0.5663753, 0.2798251, 0, 0, 0, 1, 1,
0.07754479, -1.561376, 3.452869, 0, 0, 0, 1, 1,
0.07913239, 0.08759543, 1.311921, 0, 0, 0, 1, 1,
0.07967532, 0.3701142, 2.901881, 0, 0, 0, 1, 1,
0.08133807, 0.06382609, -1.113262, 0, 0, 0, 1, 1,
0.08189502, 0.4030413, 0.6711118, 0, 0, 0, 1, 1,
0.08383816, -0.4825957, 2.338275, 1, 1, 1, 1, 1,
0.08608886, -0.1489495, 1.337578, 1, 1, 1, 1, 1,
0.08639983, 0.620971, 0.06919601, 1, 1, 1, 1, 1,
0.08940784, 1.33593, -1.271379, 1, 1, 1, 1, 1,
0.09446738, 0.9347264, -1.075582, 1, 1, 1, 1, 1,
0.09487227, 0.6400537, 1.788869, 1, 1, 1, 1, 1,
0.09773476, -0.389497, 3.729998, 1, 1, 1, 1, 1,
0.1011982, 0.03152642, 0.6273695, 1, 1, 1, 1, 1,
0.1053639, 0.457638, 0.6851157, 1, 1, 1, 1, 1,
0.1117063, 0.4905967, -0.06931262, 1, 1, 1, 1, 1,
0.1187446, 0.639046, -0.8280494, 1, 1, 1, 1, 1,
0.1195678, 1.481533, -0.562429, 1, 1, 1, 1, 1,
0.1218138, -0.5626745, 3.737939, 1, 1, 1, 1, 1,
0.1234458, 0.5562679, -1.183258, 1, 1, 1, 1, 1,
0.1253167, 0.7769898, -1.767156, 1, 1, 1, 1, 1,
0.1255153, -1.442131, 3.584448, 0, 0, 1, 1, 1,
0.1266214, -1.19707, 3.485886, 1, 0, 0, 1, 1,
0.128831, -1.157273, 2.996713, 1, 0, 0, 1, 1,
0.1302711, -0.02078599, 2.315547, 1, 0, 0, 1, 1,
0.1327153, -0.1611487, 1.752208, 1, 0, 0, 1, 1,
0.1345234, 1.196695, 1.27978, 1, 0, 0, 1, 1,
0.1414364, -0.4812787, 2.442329, 0, 0, 0, 1, 1,
0.1423859, 0.1074156, 2.665598, 0, 0, 0, 1, 1,
0.1425363, -0.2281421, 2.082638, 0, 0, 0, 1, 1,
0.1475876, 1.200834, -1.412867, 0, 0, 0, 1, 1,
0.1527622, 0.2431987, 0.7958487, 0, 0, 0, 1, 1,
0.1536212, -1.902145, 3.276968, 0, 0, 0, 1, 1,
0.1550575, 1.365918, 0.7494358, 0, 0, 0, 1, 1,
0.156008, 0.3396027, -0.068671, 1, 1, 1, 1, 1,
0.1571484, 0.2952286, -0.04691542, 1, 1, 1, 1, 1,
0.1614911, -0.4310311, 3.157762, 1, 1, 1, 1, 1,
0.1658419, 0.1109858, 2.277893, 1, 1, 1, 1, 1,
0.1658583, 1.361669, -0.5713038, 1, 1, 1, 1, 1,
0.1664562, 1.042759, -1.338459, 1, 1, 1, 1, 1,
0.1666507, 0.6493447, -1.952524, 1, 1, 1, 1, 1,
0.1708736, 1.103236, -1.05424, 1, 1, 1, 1, 1,
0.1721588, -1.429044, 3.085389, 1, 1, 1, 1, 1,
0.172597, 0.3527724, 2.258011, 1, 1, 1, 1, 1,
0.1743794, -1.11297, 4.429252, 1, 1, 1, 1, 1,
0.1801209, 0.4626324, 2.629406, 1, 1, 1, 1, 1,
0.1807245, -0.5870358, 1.671269, 1, 1, 1, 1, 1,
0.1871058, -1.047148, 2.794455, 1, 1, 1, 1, 1,
0.1900648, 1.332705, -0.5682407, 1, 1, 1, 1, 1,
0.1901806, -0.006269649, 1.585002, 0, 0, 1, 1, 1,
0.1903295, 0.1027315, 1.718074, 1, 0, 0, 1, 1,
0.1926273, 0.04131979, 2.583732, 1, 0, 0, 1, 1,
0.1975244, -3.02585, 2.296473, 1, 0, 0, 1, 1,
0.1981939, 0.5122864, -2.153713, 1, 0, 0, 1, 1,
0.201176, 1.199279, 1.095608, 1, 0, 0, 1, 1,
0.2018463, -0.2394654, 2.926008, 0, 0, 0, 1, 1,
0.2033881, 0.863745, 0.3835254, 0, 0, 0, 1, 1,
0.2056112, 1.372293, 1.000883, 0, 0, 0, 1, 1,
0.2060099, 0.5391918, 0.6665917, 0, 0, 0, 1, 1,
0.2119144, 0.6018239, 1.358322, 0, 0, 0, 1, 1,
0.2152563, -0.7146832, 1.848961, 0, 0, 0, 1, 1,
0.2160338, -0.6293305, 2.523602, 0, 0, 0, 1, 1,
0.2166847, 1.71117, 1.316374, 1, 1, 1, 1, 1,
0.2192251, -0.1866191, 1.170798, 1, 1, 1, 1, 1,
0.2207377, -1.069769, 1.409148, 1, 1, 1, 1, 1,
0.2262269, -1.389674, 0.677079, 1, 1, 1, 1, 1,
0.22925, -0.6918032, 2.773666, 1, 1, 1, 1, 1,
0.2361979, 0.4038241, 0.335329, 1, 1, 1, 1, 1,
0.2362408, -0.02158583, 2.276185, 1, 1, 1, 1, 1,
0.2377835, 0.7324389, 0.9745905, 1, 1, 1, 1, 1,
0.2389133, 1.252405, -1.179345, 1, 1, 1, 1, 1,
0.2438053, -1.558921, 3.033868, 1, 1, 1, 1, 1,
0.2463338, -0.5031612, 2.875923, 1, 1, 1, 1, 1,
0.248083, 0.2703276, 1.627321, 1, 1, 1, 1, 1,
0.2498688, 0.4988694, 2.032764, 1, 1, 1, 1, 1,
0.2506484, -1.478674, 3.102894, 1, 1, 1, 1, 1,
0.2513806, 0.8568205, 0.1094823, 1, 1, 1, 1, 1,
0.252687, -0.9067539, 3.245224, 0, 0, 1, 1, 1,
0.2539737, -0.438758, 2.128625, 1, 0, 0, 1, 1,
0.2561464, 0.6214374, 0.4422232, 1, 0, 0, 1, 1,
0.2626721, 0.9871134, -0.4453206, 1, 0, 0, 1, 1,
0.2635189, -1.149799, 3.015321, 1, 0, 0, 1, 1,
0.2635942, -0.6373859, 2.318405, 1, 0, 0, 1, 1,
0.2641278, -1.13358, 3.548799, 0, 0, 0, 1, 1,
0.2702435, -3.081642, 3.058278, 0, 0, 0, 1, 1,
0.2723936, -1.022937, 0.9416384, 0, 0, 0, 1, 1,
0.2744994, -0.06028539, 1.503757, 0, 0, 0, 1, 1,
0.2745295, -0.2220044, 1.281963, 0, 0, 0, 1, 1,
0.2755204, -1.501284, 2.155432, 0, 0, 0, 1, 1,
0.2832398, 0.1625684, 2.131045, 0, 0, 0, 1, 1,
0.2839987, 0.07789297, 0.6197568, 1, 1, 1, 1, 1,
0.2848198, 0.4600706, 0.4136823, 1, 1, 1, 1, 1,
0.2900038, -0.9286696, 4.033421, 1, 1, 1, 1, 1,
0.2938926, -0.6512343, 3.942335, 1, 1, 1, 1, 1,
0.2979895, 1.828902, 0.4983692, 1, 1, 1, 1, 1,
0.2999466, -0.2196188, 2.666899, 1, 1, 1, 1, 1,
0.3012473, 0.9248514, -0.4664876, 1, 1, 1, 1, 1,
0.3021888, 0.4822863, -0.6698719, 1, 1, 1, 1, 1,
0.3073966, -1.912633, 4.04675, 1, 1, 1, 1, 1,
0.3076355, 2.1378, -1.103212, 1, 1, 1, 1, 1,
0.3112128, -0.4497719, 4.471029, 1, 1, 1, 1, 1,
0.3144106, 0.9796937, 1.351705, 1, 1, 1, 1, 1,
0.3189736, 0.02279736, 1.258268, 1, 1, 1, 1, 1,
0.3201273, -0.7488927, 0.7370149, 1, 1, 1, 1, 1,
0.3202684, 1.590917, 0.1985931, 1, 1, 1, 1, 1,
0.3224451, -0.5680412, 2.420748, 0, 0, 1, 1, 1,
0.3234, 0.6781679, -0.9517041, 1, 0, 0, 1, 1,
0.3238492, -0.3010843, 2.052938, 1, 0, 0, 1, 1,
0.3254361, -2.041023, 1.833075, 1, 0, 0, 1, 1,
0.3262607, -0.2788398, 3.991256, 1, 0, 0, 1, 1,
0.3326469, -0.2648038, 2.141703, 1, 0, 0, 1, 1,
0.333089, 0.6049305, 0.006827762, 0, 0, 0, 1, 1,
0.3346765, 1.253612, 1.166689, 0, 0, 0, 1, 1,
0.3354394, -1.376254, 2.509198, 0, 0, 0, 1, 1,
0.3374575, -0.7164738, 3.691597, 0, 0, 0, 1, 1,
0.3460029, 1.019518, -0.2329845, 0, 0, 0, 1, 1,
0.3501278, -0.4633893, 3.661718, 0, 0, 0, 1, 1,
0.355288, 0.7119334, 0.7975102, 0, 0, 0, 1, 1,
0.357632, 0.326901, 2.145383, 1, 1, 1, 1, 1,
0.3585677, 1.811693, -0.2966253, 1, 1, 1, 1, 1,
0.3611923, 0.182519, 1.152815, 1, 1, 1, 1, 1,
0.3621762, -0.9147919, 5.215482, 1, 1, 1, 1, 1,
0.363148, -1.011388, 1.207865, 1, 1, 1, 1, 1,
0.3655997, 0.3369409, 0.4827154, 1, 1, 1, 1, 1,
0.3671969, -0.005490412, 3.109558, 1, 1, 1, 1, 1,
0.36856, -0.7171222, 3.894379, 1, 1, 1, 1, 1,
0.3694513, 1.237493, 1.671628, 1, 1, 1, 1, 1,
0.3704687, 1.747543, 1.248678, 1, 1, 1, 1, 1,
0.3718124, 0.3542089, 0.4281589, 1, 1, 1, 1, 1,
0.3740922, -2.592918, 1.95323, 1, 1, 1, 1, 1,
0.376307, -0.6159374, 1.988926, 1, 1, 1, 1, 1,
0.3766597, 0.3638068, 0.01301701, 1, 1, 1, 1, 1,
0.3776991, -0.1248805, 2.237312, 1, 1, 1, 1, 1,
0.3794068, -0.3359092, 2.568026, 0, 0, 1, 1, 1,
0.3798994, 1.533353, 0.3053884, 1, 0, 0, 1, 1,
0.3805055, -0.8977138, 2.391953, 1, 0, 0, 1, 1,
0.3817565, 0.3369978, 1.493294, 1, 0, 0, 1, 1,
0.3839246, 1.009652, 0.8116478, 1, 0, 0, 1, 1,
0.3864305, -0.3733192, 2.881064, 1, 0, 0, 1, 1,
0.3931306, 0.005441742, 1.694079, 0, 0, 0, 1, 1,
0.4017634, -0.9826295, 3.192978, 0, 0, 0, 1, 1,
0.4115147, -2.191558, 2.317114, 0, 0, 0, 1, 1,
0.416858, -0.429432, 2.858017, 0, 0, 0, 1, 1,
0.4202112, -0.280149, 3.29053, 0, 0, 0, 1, 1,
0.4211137, 1.043933, -0.3377077, 0, 0, 0, 1, 1,
0.423913, 0.5913855, 1.857004, 0, 0, 0, 1, 1,
0.42852, 1.301358, 0.8843438, 1, 1, 1, 1, 1,
0.4300014, -0.9796886, 3.743196, 1, 1, 1, 1, 1,
0.4303313, -0.10216, 0.4339743, 1, 1, 1, 1, 1,
0.4329915, 0.6649979, 0.1180717, 1, 1, 1, 1, 1,
0.433898, -0.3020988, 3.262347, 1, 1, 1, 1, 1,
0.4366911, -0.9653559, 1.914283, 1, 1, 1, 1, 1,
0.4385334, 0.9630649, 0.3013273, 1, 1, 1, 1, 1,
0.4385469, 1.435189, -0.6932099, 1, 1, 1, 1, 1,
0.4386618, 0.04764295, 1.97446, 1, 1, 1, 1, 1,
0.4404538, -0.9164142, 3.122506, 1, 1, 1, 1, 1,
0.4429855, -0.9444396, 3.290495, 1, 1, 1, 1, 1,
0.4444537, -0.9370511, 3.204755, 1, 1, 1, 1, 1,
0.44649, 0.5089669, -0.1092911, 1, 1, 1, 1, 1,
0.447443, 0.0004009923, 1.562663, 1, 1, 1, 1, 1,
0.4481325, 1.358381, -0.3607785, 1, 1, 1, 1, 1,
0.448386, 2.257168, 0.7323647, 0, 0, 1, 1, 1,
0.4505158, 0.5755774, -1.278753, 1, 0, 0, 1, 1,
0.4527044, 2.197703, -1.036721, 1, 0, 0, 1, 1,
0.4535911, -0.304502, 3.622646, 1, 0, 0, 1, 1,
0.457069, 0.1115114, 1.325171, 1, 0, 0, 1, 1,
0.4582046, -1.090378, 1.876746, 1, 0, 0, 1, 1,
0.4590985, 0.5486806, 2.205618, 0, 0, 0, 1, 1,
0.4613087, 0.3861123, 0.8915728, 0, 0, 0, 1, 1,
0.4614454, 0.5816789, -0.4558847, 0, 0, 0, 1, 1,
0.4653232, 0.1347255, -0.5468156, 0, 0, 0, 1, 1,
0.4659378, 0.4272721, -0.8998723, 0, 0, 0, 1, 1,
0.4679706, -0.5583646, 0.54526, 0, 0, 0, 1, 1,
0.4715526, -0.3534959, 2.871968, 0, 0, 0, 1, 1,
0.4728985, -0.2537901, 2.503426, 1, 1, 1, 1, 1,
0.4773556, -0.7956059, 2.753016, 1, 1, 1, 1, 1,
0.4797581, -0.2887684, 3.344446, 1, 1, 1, 1, 1,
0.4843342, 0.441987, 1.520578, 1, 1, 1, 1, 1,
0.488711, 0.4718525, 3.1617, 1, 1, 1, 1, 1,
0.4901785, 0.4059331, 0.9237041, 1, 1, 1, 1, 1,
0.4909645, -0.5488185, 2.674282, 1, 1, 1, 1, 1,
0.4933015, 1.287547, -2.272852, 1, 1, 1, 1, 1,
0.4956648, -1.062995, 2.311274, 1, 1, 1, 1, 1,
0.4978059, -0.2011764, 3.0108, 1, 1, 1, 1, 1,
0.501057, 0.4487548, -0.08646619, 1, 1, 1, 1, 1,
0.5016266, 1.422264, -0.2993791, 1, 1, 1, 1, 1,
0.5045884, -0.4928043, 2.213946, 1, 1, 1, 1, 1,
0.5054604, 1.163374, -0.2007987, 1, 1, 1, 1, 1,
0.5080336, 0.8614652, 0.306293, 1, 1, 1, 1, 1,
0.5156648, -1.015819, 1.776469, 0, 0, 1, 1, 1,
0.5164278, 1.807867, 1.440445, 1, 0, 0, 1, 1,
0.5220084, -1.453095, 2.263022, 1, 0, 0, 1, 1,
0.5223943, -1.140293, 4.776939, 1, 0, 0, 1, 1,
0.5299969, -0.6912241, 2.596697, 1, 0, 0, 1, 1,
0.5317376, -0.2449093, 2.36642, 1, 0, 0, 1, 1,
0.5388443, 1.614426, 1.107371, 0, 0, 0, 1, 1,
0.542602, 1.627157, -1.244649, 0, 0, 0, 1, 1,
0.5450867, 2.986764, 0.8971265, 0, 0, 0, 1, 1,
0.5470726, 0.7082076, 2.525584, 0, 0, 0, 1, 1,
0.5481775, -1.47471, 2.982295, 0, 0, 0, 1, 1,
0.5483115, -1.690632, 4.18713, 0, 0, 0, 1, 1,
0.5632845, -1.135681, 1.721716, 0, 0, 0, 1, 1,
0.56471, -1.33908, 2.241235, 1, 1, 1, 1, 1,
0.5653007, 0.09114937, 2.477173, 1, 1, 1, 1, 1,
0.5714579, -0.6686087, 1.262433, 1, 1, 1, 1, 1,
0.5720932, 0.1486057, 1.443625, 1, 1, 1, 1, 1,
0.5755302, -0.4293703, 2.29353, 1, 1, 1, 1, 1,
0.5824243, 0.238842, 1.708361, 1, 1, 1, 1, 1,
0.5850956, -1.118683, 3.189276, 1, 1, 1, 1, 1,
0.5852028, 0.2945087, 0.6668581, 1, 1, 1, 1, 1,
0.5886645, 0.02018, 1.086108, 1, 1, 1, 1, 1,
0.5901222, -0.9606043, 3.406916, 1, 1, 1, 1, 1,
0.5992576, -1.947801, 2.48794, 1, 1, 1, 1, 1,
0.6045169, -0.02386303, 1.391212, 1, 1, 1, 1, 1,
0.6057243, 1.477448, 0.5896385, 1, 1, 1, 1, 1,
0.6125063, -1.030802, 2.253574, 1, 1, 1, 1, 1,
0.6165062, 1.715425, 0.9977814, 1, 1, 1, 1, 1,
0.6180266, 0.8469709, 1.160053, 0, 0, 1, 1, 1,
0.6194119, -1.897626, 3.063617, 1, 0, 0, 1, 1,
0.6224284, 0.4206157, 0.175766, 1, 0, 0, 1, 1,
0.6272905, 1.25905, 1.734747, 1, 0, 0, 1, 1,
0.6296334, -0.3126722, 3.364607, 1, 0, 0, 1, 1,
0.63161, -1.207547, 3.142988, 1, 0, 0, 1, 1,
0.6352693, -1.82776, 3.4196, 0, 0, 0, 1, 1,
0.6362864, 0.3019585, 1.79307, 0, 0, 0, 1, 1,
0.6376346, -0.5996883, 1.950586, 0, 0, 0, 1, 1,
0.6481797, 0.5405507, 0.3422716, 0, 0, 0, 1, 1,
0.6569005, 0.615174, 1.616597, 0, 0, 0, 1, 1,
0.657469, 0.2060765, -0.2960098, 0, 0, 0, 1, 1,
0.6582647, 0.5965354, 2.280159, 0, 0, 0, 1, 1,
0.6595802, -1.039017, 2.701662, 1, 1, 1, 1, 1,
0.6619575, -0.5848939, 1.537779, 1, 1, 1, 1, 1,
0.6639526, 0.4985455, -0.2747933, 1, 1, 1, 1, 1,
0.6646251, -1.616282, 1.997419, 1, 1, 1, 1, 1,
0.6687986, -0.3993579, 3.720003, 1, 1, 1, 1, 1,
0.6696708, -1.296915, 1.147766, 1, 1, 1, 1, 1,
0.672094, 0.2949055, 3.182962, 1, 1, 1, 1, 1,
0.6748778, 0.2633848, 0.4050515, 1, 1, 1, 1, 1,
0.6758773, 0.8257703, 0.3924389, 1, 1, 1, 1, 1,
0.6862919, -0.9268987, 3.024216, 1, 1, 1, 1, 1,
0.688203, -1.039197, 2.080338, 1, 1, 1, 1, 1,
0.6917053, 0.646175, 1.356476, 1, 1, 1, 1, 1,
0.6918905, -1.754718, 4.606316, 1, 1, 1, 1, 1,
0.692287, 0.4011408, 2.479077, 1, 1, 1, 1, 1,
0.6923337, -0.6073375, -0.85717, 1, 1, 1, 1, 1,
0.7003109, 0.3564838, 0.8705376, 0, 0, 1, 1, 1,
0.7035936, 1.184663, -1.1474, 1, 0, 0, 1, 1,
0.7143064, -0.768939, 1.346609, 1, 0, 0, 1, 1,
0.7214344, 0.6207628, 2.253071, 1, 0, 0, 1, 1,
0.7278178, 0.06036261, 1.461616, 1, 0, 0, 1, 1,
0.7298437, -0.7437848, 3.549208, 1, 0, 0, 1, 1,
0.7316127, 0.9171538, 0.7339445, 0, 0, 0, 1, 1,
0.7338666, 0.747133, -0.3258206, 0, 0, 0, 1, 1,
0.743077, 0.869827, 1.558858, 0, 0, 0, 1, 1,
0.7437991, 0.2259731, 0.7974466, 0, 0, 0, 1, 1,
0.7528687, -2.452143, 3.431641, 0, 0, 0, 1, 1,
0.756531, 0.2940859, 2.69566, 0, 0, 0, 1, 1,
0.7608928, -0.9467332, 3.699208, 0, 0, 0, 1, 1,
0.7611765, 1.520595, -0.06773159, 1, 1, 1, 1, 1,
0.7659131, -0.3258766, 1.955871, 1, 1, 1, 1, 1,
0.7666668, -0.4088007, 3.338773, 1, 1, 1, 1, 1,
0.7668359, -1.549959, 1.593457, 1, 1, 1, 1, 1,
0.7690912, 0.9015467, 1.143803, 1, 1, 1, 1, 1,
0.7737166, -0.4032645, 0.5244707, 1, 1, 1, 1, 1,
0.7858313, -1.092159, 2.107711, 1, 1, 1, 1, 1,
0.7862049, -0.03552851, 1.186626, 1, 1, 1, 1, 1,
0.7890155, 0.1282931, 1.298017, 1, 1, 1, 1, 1,
0.7917157, -0.3994862, 1.278774, 1, 1, 1, 1, 1,
0.8019865, -1.144636, 2.209764, 1, 1, 1, 1, 1,
0.8052113, 0.1094259, 2.148889, 1, 1, 1, 1, 1,
0.8114858, 0.5606242, 1.105682, 1, 1, 1, 1, 1,
0.812584, -0.2380481, 1.172424, 1, 1, 1, 1, 1,
0.8166202, 0.5342518, 1.380071, 1, 1, 1, 1, 1,
0.8166308, 1.13335, 1.51916, 0, 0, 1, 1, 1,
0.820605, -0.9373662, 3.081054, 1, 0, 0, 1, 1,
0.8227385, 0.8705513, 0.9728009, 1, 0, 0, 1, 1,
0.8232728, -0.8496808, 2.526208, 1, 0, 0, 1, 1,
0.8245237, -0.4897836, 1.323932, 1, 0, 0, 1, 1,
0.8309578, 0.5237287, -0.03399966, 1, 0, 0, 1, 1,
0.8391474, -1.823373, 3.128411, 0, 0, 0, 1, 1,
0.8395612, 0.2056769, 0.7411183, 0, 0, 0, 1, 1,
0.8437282, -0.6914889, -0.1645901, 0, 0, 0, 1, 1,
0.8471711, 0.1506267, 1.212274, 0, 0, 0, 1, 1,
0.8656258, -0.5059083, 2.783683, 0, 0, 0, 1, 1,
0.8675461, 0.9988923, 2.704713, 0, 0, 0, 1, 1,
0.8745528, 0.7778339, 0.07378882, 0, 0, 0, 1, 1,
0.8759016, 0.03577436, 0.8549362, 1, 1, 1, 1, 1,
0.8785586, -3.119974, 3.205507, 1, 1, 1, 1, 1,
0.8786138, 0.9488875, 2.096841, 1, 1, 1, 1, 1,
0.8797176, -0.2380663, 1.215747, 1, 1, 1, 1, 1,
0.8863383, 0.8350953, 0.4311745, 1, 1, 1, 1, 1,
0.888225, 0.4073206, 0.877997, 1, 1, 1, 1, 1,
0.8909074, 0.3918146, 2.114948, 1, 1, 1, 1, 1,
0.9068583, 0.8825944, 1.208098, 1, 1, 1, 1, 1,
0.9089264, 0.6568303, 0.7058932, 1, 1, 1, 1, 1,
0.9097362, -0.4539877, 2.955589, 1, 1, 1, 1, 1,
0.9166074, 0.9184455, 1.669807, 1, 1, 1, 1, 1,
0.9196559, 0.8835827, 0.4503444, 1, 1, 1, 1, 1,
0.9200026, -0.7342572, -0.03436547, 1, 1, 1, 1, 1,
0.9228035, -0.8268667, 2.785947, 1, 1, 1, 1, 1,
0.9241458, -1.011077, 3.079476, 1, 1, 1, 1, 1,
0.928062, -0.1241483, 2.169822, 0, 0, 1, 1, 1,
0.9291372, -1.944422, 2.283226, 1, 0, 0, 1, 1,
0.9296451, -0.02409565, 0.5573648, 1, 0, 0, 1, 1,
0.9322243, 0.9608215, 1.932197, 1, 0, 0, 1, 1,
0.9323841, -0.02319921, 2.836172, 1, 0, 0, 1, 1,
0.9353138, -0.8579048, 3.485457, 1, 0, 0, 1, 1,
0.9390792, 0.6970161, -0.4379145, 0, 0, 0, 1, 1,
0.9414401, -0.4173903, 0.1092188, 0, 0, 0, 1, 1,
0.9455321, 0.2374656, 1.937759, 0, 0, 0, 1, 1,
0.9473332, -0.04422206, 2.247537, 0, 0, 0, 1, 1,
0.9487065, -0.3917306, 1.397994, 0, 0, 0, 1, 1,
0.9496635, 0.205097, 3.032449, 0, 0, 0, 1, 1,
0.9510912, 1.539564, -0.07708123, 0, 0, 0, 1, 1,
0.9572084, 0.4309995, 0.673149, 1, 1, 1, 1, 1,
0.9573534, 0.5973045, 1.207962, 1, 1, 1, 1, 1,
0.9733842, -1.096932, 3.70105, 1, 1, 1, 1, 1,
0.9745476, -0.7815959, 2.691775, 1, 1, 1, 1, 1,
0.9864773, 0.6230018, 1.902225, 1, 1, 1, 1, 1,
0.9865614, -0.7796052, 1.421347, 1, 1, 1, 1, 1,
0.9924107, 0.157031, 4.525363, 1, 1, 1, 1, 1,
1.000202, 1.197765, -0.3249948, 1, 1, 1, 1, 1,
1.004335, 0.4553509, -0.6228967, 1, 1, 1, 1, 1,
1.005848, -1.108504, 1.405943, 1, 1, 1, 1, 1,
1.013955, 0.2560724, 0.3161375, 1, 1, 1, 1, 1,
1.015284, -0.2402976, 2.539934, 1, 1, 1, 1, 1,
1.017445, 0.2594544, 0.8550233, 1, 1, 1, 1, 1,
1.020685, 0.2755026, 2.235134, 1, 1, 1, 1, 1,
1.021311, -0.8061056, 3.422038, 1, 1, 1, 1, 1,
1.027524, -0.3661004, 0.4667326, 0, 0, 1, 1, 1,
1.030196, 0.9007367, -0.4961624, 1, 0, 0, 1, 1,
1.032987, -0.5816628, 1.152574, 1, 0, 0, 1, 1,
1.038203, -0.3567722, 3.177281, 1, 0, 0, 1, 1,
1.038829, -0.7445586, 2.944097, 1, 0, 0, 1, 1,
1.039042, -0.7263917, 0.9682422, 1, 0, 0, 1, 1,
1.042573, -0.3571031, 1.889915, 0, 0, 0, 1, 1,
1.045245, -0.5717012, 2.534159, 0, 0, 0, 1, 1,
1.051908, -0.7045593, 2.851376, 0, 0, 0, 1, 1,
1.061315, -0.8594487, 2.157506, 0, 0, 0, 1, 1,
1.067625, 1.028644, 1.002984, 0, 0, 0, 1, 1,
1.06993, 0.7554271, 0.9218749, 0, 0, 0, 1, 1,
1.072983, -0.8365758, 1.177203, 0, 0, 0, 1, 1,
1.073123, 1.476801, -0.05012265, 1, 1, 1, 1, 1,
1.082578, 0.4348033, 0.4172124, 1, 1, 1, 1, 1,
1.095285, -1.015032, 1.908341, 1, 1, 1, 1, 1,
1.095415, 1.773113, 0.9737018, 1, 1, 1, 1, 1,
1.098757, -1.116916, 2.137519, 1, 1, 1, 1, 1,
1.101901, -0.3618223, 0.07152287, 1, 1, 1, 1, 1,
1.106397, 0.1197941, 1.221614, 1, 1, 1, 1, 1,
1.106934, -0.397268, 1.147258, 1, 1, 1, 1, 1,
1.107444, 0.3036117, -0.7613997, 1, 1, 1, 1, 1,
1.108056, 0.2996171, -0.225743, 1, 1, 1, 1, 1,
1.112378, -0.008054919, 0.6818857, 1, 1, 1, 1, 1,
1.113659, 0.005010793, 1.152607, 1, 1, 1, 1, 1,
1.114267, -0.6562723, 0.6629061, 1, 1, 1, 1, 1,
1.120155, 0.1343586, 1.852382, 1, 1, 1, 1, 1,
1.123903, -0.6054408, 2.350104, 1, 1, 1, 1, 1,
1.124157, -0.1354434, 1.463344, 0, 0, 1, 1, 1,
1.133308, -1.778175, 2.441027, 1, 0, 0, 1, 1,
1.16501, 0.04835558, 2.257781, 1, 0, 0, 1, 1,
1.169841, -0.5153767, 2.098346, 1, 0, 0, 1, 1,
1.185286, -0.1568918, 1.474416, 1, 0, 0, 1, 1,
1.19905, -0.05058447, 1.617596, 1, 0, 0, 1, 1,
1.19914, -1.11096, 4.043164, 0, 0, 0, 1, 1,
1.199874, -0.2108521, 3.912139, 0, 0, 0, 1, 1,
1.201515, 1.595352, 0.2165625, 0, 0, 0, 1, 1,
1.204569, 0.9155039, 2.234325, 0, 0, 0, 1, 1,
1.207279, -1.292744, 3.908732, 0, 0, 0, 1, 1,
1.207539, -0.01877218, -0.2534046, 0, 0, 0, 1, 1,
1.214348, 2.373702, -0.1394186, 0, 0, 0, 1, 1,
1.215873, 1.221282, -0.2150883, 1, 1, 1, 1, 1,
1.244688, -1.178734, 3.549593, 1, 1, 1, 1, 1,
1.261674, -0.661368, 1.589365, 1, 1, 1, 1, 1,
1.272844, -0.9619442, 2.118872, 1, 1, 1, 1, 1,
1.282299, 0.762445, 3.003082, 1, 1, 1, 1, 1,
1.289776, -1.575588, 1.61411, 1, 1, 1, 1, 1,
1.293475, 0.9285051, 1.775463, 1, 1, 1, 1, 1,
1.303179, -0.2469316, 2.812261, 1, 1, 1, 1, 1,
1.306775, 0.9004797, -0.5718443, 1, 1, 1, 1, 1,
1.311346, 0.1804733, -0.4113651, 1, 1, 1, 1, 1,
1.311828, -0.6952025, -0.2498199, 1, 1, 1, 1, 1,
1.315497, 2.438666, 2.241802, 1, 1, 1, 1, 1,
1.316246, 0.2232086, 0.9818755, 1, 1, 1, 1, 1,
1.318891, 0.01312688, 1.746938, 1, 1, 1, 1, 1,
1.319694, 0.02872041, 2.592261, 1, 1, 1, 1, 1,
1.320432, -0.7775827, 1.435492, 0, 0, 1, 1, 1,
1.329423, -0.3713154, 1.258658, 1, 0, 0, 1, 1,
1.337622, 0.096414, 2.388882, 1, 0, 0, 1, 1,
1.338721, 0.8576829, 2.624434, 1, 0, 0, 1, 1,
1.339148, -0.5215285, 1.910983, 1, 0, 0, 1, 1,
1.343196, 0.6022816, 1.497766, 1, 0, 0, 1, 1,
1.350429, -1.21584, 2.560668, 0, 0, 0, 1, 1,
1.356233, -0.1574993, 2.542792, 0, 0, 0, 1, 1,
1.358086, -1.619164, 2.459555, 0, 0, 0, 1, 1,
1.364077, 0.7023875, 2.268303, 0, 0, 0, 1, 1,
1.366255, 0.4839637, 2.812896, 0, 0, 0, 1, 1,
1.383711, -1.09298, 2.061468, 0, 0, 0, 1, 1,
1.389312, 0.7117895, 1.207008, 0, 0, 0, 1, 1,
1.391312, 0.3861735, 0.7457272, 1, 1, 1, 1, 1,
1.403924, -1.905266, 2.101571, 1, 1, 1, 1, 1,
1.41381, 0.05149512, 0.7419118, 1, 1, 1, 1, 1,
1.419717, -0.6371695, 1.515149, 1, 1, 1, 1, 1,
1.436305, -1.364524, 1.142085, 1, 1, 1, 1, 1,
1.438148, -0.1436167, 1.851895, 1, 1, 1, 1, 1,
1.444501, -0.7793908, 1.632183, 1, 1, 1, 1, 1,
1.449148, -0.1993286, 3.744005, 1, 1, 1, 1, 1,
1.46182, 0.4120849, 1.048291, 1, 1, 1, 1, 1,
1.461952, -0.5133113, -0.2716535, 1, 1, 1, 1, 1,
1.474503, 0.4862971, 0.6571493, 1, 1, 1, 1, 1,
1.481506, 0.5527158, 0.3636319, 1, 1, 1, 1, 1,
1.486523, 0.8172817, -1.180895, 1, 1, 1, 1, 1,
1.493862, 1.290162, 1.831576, 1, 1, 1, 1, 1,
1.504804, 0.996187, 0.7324007, 1, 1, 1, 1, 1,
1.505213, -0.2069339, 0.6277856, 0, 0, 1, 1, 1,
1.526866, -0.8644522, 4.196669, 1, 0, 0, 1, 1,
1.533849, -0.1370022, 1.664849, 1, 0, 0, 1, 1,
1.563007, -1.71832, 2.715088, 1, 0, 0, 1, 1,
1.572605, 1.03652, 2.248215, 1, 0, 0, 1, 1,
1.579513, 0.4102295, 0.3257993, 1, 0, 0, 1, 1,
1.583362, -0.3858038, 2.710512, 0, 0, 0, 1, 1,
1.586782, -0.5681011, 3.294164, 0, 0, 0, 1, 1,
1.601853, -0.980933, 3.356923, 0, 0, 0, 1, 1,
1.618652, 0.1959147, 0.9537923, 0, 0, 0, 1, 1,
1.631698, 0.3942046, 1.533423, 0, 0, 0, 1, 1,
1.653906, -1.251355, -0.9438531, 0, 0, 0, 1, 1,
1.667832, 0.7540626, -0.1522881, 0, 0, 0, 1, 1,
1.674363, 1.571755, -0.2096551, 1, 1, 1, 1, 1,
1.681841, 0.1706028, 2.414889, 1, 1, 1, 1, 1,
1.690912, -0.07347243, 0.06347262, 1, 1, 1, 1, 1,
1.717364, -0.2920994, 0.2301437, 1, 1, 1, 1, 1,
1.740398, 1.53261, 0.1863737, 1, 1, 1, 1, 1,
1.750576, 1.528255, 1.424403, 1, 1, 1, 1, 1,
1.766751, 0.05691487, 0.8218966, 1, 1, 1, 1, 1,
1.779262, -1.946703, 1.69519, 1, 1, 1, 1, 1,
1.789428, -0.1753696, -0.9573104, 1, 1, 1, 1, 1,
1.800115, 0.87537, 1.787091, 1, 1, 1, 1, 1,
1.808112, -0.3220521, 3.31586, 1, 1, 1, 1, 1,
1.812281, -0.7672814, 2.309635, 1, 1, 1, 1, 1,
1.826877, 3.534759, 0.9988874, 1, 1, 1, 1, 1,
1.829278, 0.09296318, 0.4540076, 1, 1, 1, 1, 1,
1.844227, -0.2815965, 2.499301, 1, 1, 1, 1, 1,
1.850484, -2.040703, 1.47966, 0, 0, 1, 1, 1,
1.923998, 0.162783, -0.03844844, 1, 0, 0, 1, 1,
1.929022, 0.1231069, 1.803045, 1, 0, 0, 1, 1,
1.935054, 0.3423655, 1.759548, 1, 0, 0, 1, 1,
1.938177, 0.7034019, 2.261159, 1, 0, 0, 1, 1,
1.967983, -1.025721, 1.285789, 1, 0, 0, 1, 1,
1.991785, 0.2176123, 2.678342, 0, 0, 0, 1, 1,
2.008246, -1.595193, 2.037232, 0, 0, 0, 1, 1,
2.02568, -0.4394733, -0.05349221, 0, 0, 0, 1, 1,
2.039449, -0.5864704, 1.017544, 0, 0, 0, 1, 1,
2.040901, -1.673963, 3.80532, 0, 0, 0, 1, 1,
2.097853, -1.97757, 4.533468, 0, 0, 0, 1, 1,
2.187733, -0.9259094, 1.985922, 0, 0, 0, 1, 1,
2.192166, 0.912463, 0.8394927, 1, 1, 1, 1, 1,
2.250725, 0.5192768, 0.1967724, 1, 1, 1, 1, 1,
2.253758, 0.5671386, 1.851119, 1, 1, 1, 1, 1,
2.571427, 0.4061512, -0.01051502, 1, 1, 1, 1, 1,
2.715596, -1.742579, 3.058399, 1, 1, 1, 1, 1,
3.119056, -0.1438145, 3.737106, 1, 1, 1, 1, 1,
3.658795, 0.5128711, -0.2492101, 1, 1, 1, 1, 1
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
var radius = 9.667037;
var distance = 33.95506;
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
mvMatrix.translate( -0.431252, 0.0546279, -0.02693391 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95506);
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
