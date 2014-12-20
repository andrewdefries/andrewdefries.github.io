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
-2.860845, -1.541733, -2.764434, 1, 0, 0, 1,
-2.575321, 0.5543892, -1.789705, 1, 0.007843138, 0, 1,
-2.508094, -2.470676, -2.897537, 1, 0.01176471, 0, 1,
-2.499991, 0.469899, -2.889316, 1, 0.01960784, 0, 1,
-2.274264, -0.06445107, -1.183969, 1, 0.02352941, 0, 1,
-2.26793, 0.2098218, -1.959002, 1, 0.03137255, 0, 1,
-2.247658, -1.024192, -2.453186, 1, 0.03529412, 0, 1,
-2.188247, -0.08022271, -1.010972, 1, 0.04313726, 0, 1,
-2.15161, 1.878379, 0.6353209, 1, 0.04705882, 0, 1,
-2.082513, -0.2701602, -0.3194836, 1, 0.05490196, 0, 1,
-2.012385, 0.110549, -2.9062, 1, 0.05882353, 0, 1,
-2.003068, 1.837772, 0.003188998, 1, 0.06666667, 0, 1,
-1.990967, -1.51994, -3.454333, 1, 0.07058824, 0, 1,
-1.940017, -0.2332428, -2.723831, 1, 0.07843138, 0, 1,
-1.932326, 0.7040269, -2.572668, 1, 0.08235294, 0, 1,
-1.926082, 0.6066622, -2.473701, 1, 0.09019608, 0, 1,
-1.916051, 0.5991779, -1.584925, 1, 0.09411765, 0, 1,
-1.904747, -1.147033, -1.63337, 1, 0.1019608, 0, 1,
-1.898325, -0.3706645, -0.5767782, 1, 0.1098039, 0, 1,
-1.892515, -0.4895535, -2.748134, 1, 0.1137255, 0, 1,
-1.858441, -1.397428, -0.7440259, 1, 0.1215686, 0, 1,
-1.856779, 1.615218, -0.2428313, 1, 0.1254902, 0, 1,
-1.852312, -0.2784903, -1.876574, 1, 0.1333333, 0, 1,
-1.829402, 0.3408222, -1.03924, 1, 0.1372549, 0, 1,
-1.808352, -0.4927054, -2.811313, 1, 0.145098, 0, 1,
-1.801061, -0.9911638, -2.941882, 1, 0.1490196, 0, 1,
-1.797157, -1.879317, -3.56526, 1, 0.1568628, 0, 1,
-1.793671, 1.057525, -2.019946, 1, 0.1607843, 0, 1,
-1.778612, 0.5935856, -1.353894, 1, 0.1686275, 0, 1,
-1.771958, -1.042946, -2.695321, 1, 0.172549, 0, 1,
-1.765897, 1.238433, -1.338025, 1, 0.1803922, 0, 1,
-1.763567, -0.4191059, -3.397367, 1, 0.1843137, 0, 1,
-1.754742, 0.6956069, -2.076069, 1, 0.1921569, 0, 1,
-1.754638, -1.278554, -1.598489, 1, 0.1960784, 0, 1,
-1.739121, 0.3178431, -1.255132, 1, 0.2039216, 0, 1,
-1.735832, -1.441881, -1.718564, 1, 0.2117647, 0, 1,
-1.722968, 0.9518819, -0.4348441, 1, 0.2156863, 0, 1,
-1.719694, -2.181247, -1.725121, 1, 0.2235294, 0, 1,
-1.709391, -0.1243015, -0.8612137, 1, 0.227451, 0, 1,
-1.705854, -0.00609114, -0.6051579, 1, 0.2352941, 0, 1,
-1.70434, 0.1194357, -2.523962, 1, 0.2392157, 0, 1,
-1.701335, 0.9055255, -0.1772861, 1, 0.2470588, 0, 1,
-1.689725, -1.807053, -1.169551, 1, 0.2509804, 0, 1,
-1.683111, -0.4323001, -3.594436, 1, 0.2588235, 0, 1,
-1.676713, 1.470701, -1.099034, 1, 0.2627451, 0, 1,
-1.674294, 0.4746832, -1.797123, 1, 0.2705882, 0, 1,
-1.662249, 1.090373, -2.90594, 1, 0.2745098, 0, 1,
-1.651685, 1.075281, -1.845901, 1, 0.282353, 0, 1,
-1.635155, 1.063884, -0.6020751, 1, 0.2862745, 0, 1,
-1.63223, -0.3094389, -1.339938, 1, 0.2941177, 0, 1,
-1.6286, -2.049545, -3.143222, 1, 0.3019608, 0, 1,
-1.627376, -0.9411016, -2.201159, 1, 0.3058824, 0, 1,
-1.627187, 0.4809537, -0.6597768, 1, 0.3137255, 0, 1,
-1.596085, 0.1209329, -0.9945498, 1, 0.3176471, 0, 1,
-1.588093, -1.499193, -1.562996, 1, 0.3254902, 0, 1,
-1.583191, 0.3204488, -1.752239, 1, 0.3294118, 0, 1,
-1.523407, -1.755297, -1.808105, 1, 0.3372549, 0, 1,
-1.516575, 0.1257897, -1.929809, 1, 0.3411765, 0, 1,
-1.475567, 0.9280449, -0.4269409, 1, 0.3490196, 0, 1,
-1.469259, -0.2483439, -3.369042, 1, 0.3529412, 0, 1,
-1.440815, 0.5167825, -1.039879, 1, 0.3607843, 0, 1,
-1.438247, 0.06615646, -1.061426, 1, 0.3647059, 0, 1,
-1.438179, -0.8984178, -1.629586, 1, 0.372549, 0, 1,
-1.436305, 1.453824, -0.7306699, 1, 0.3764706, 0, 1,
-1.409196, 0.4886396, -2.264183, 1, 0.3843137, 0, 1,
-1.408067, -1.709925, -3.206022, 1, 0.3882353, 0, 1,
-1.402455, 0.4307266, -1.45732, 1, 0.3960784, 0, 1,
-1.398649, 1.605606, -0.2650774, 1, 0.4039216, 0, 1,
-1.398415, -1.0392, -3.760678, 1, 0.4078431, 0, 1,
-1.389344, 0.8587496, -3.656303, 1, 0.4156863, 0, 1,
-1.384091, -1.404657, -2.5272, 1, 0.4196078, 0, 1,
-1.369822, -0.5389439, -3.032967, 1, 0.427451, 0, 1,
-1.347342, -0.2908831, -0.2313414, 1, 0.4313726, 0, 1,
-1.347204, -1.117779, -2.596167, 1, 0.4392157, 0, 1,
-1.335765, -0.8558026, -2.332073, 1, 0.4431373, 0, 1,
-1.333909, -1.227552, -3.473126, 1, 0.4509804, 0, 1,
-1.318138, -0.9876958, -1.962662, 1, 0.454902, 0, 1,
-1.317176, 1.279082, -1.811272, 1, 0.4627451, 0, 1,
-1.31687, -0.7980167, -3.239817, 1, 0.4666667, 0, 1,
-1.312284, 1.455261, -0.1401229, 1, 0.4745098, 0, 1,
-1.311563, 0.5099294, -0.7763897, 1, 0.4784314, 0, 1,
-1.307406, 1.902574, 1.411765, 1, 0.4862745, 0, 1,
-1.3058, -0.2631153, -2.956779, 1, 0.4901961, 0, 1,
-1.304095, 0.6241522, -2.239631, 1, 0.4980392, 0, 1,
-1.299248, -0.4376937, -0.06543375, 1, 0.5058824, 0, 1,
-1.298545, -0.2206495, -3.245081, 1, 0.509804, 0, 1,
-1.297388, 0.1825361, -3.215735, 1, 0.5176471, 0, 1,
-1.295125, -1.430111, -2.190209, 1, 0.5215687, 0, 1,
-1.290297, 1.257267, -0.1868922, 1, 0.5294118, 0, 1,
-1.286097, 0.4631781, -1.44602, 1, 0.5333334, 0, 1,
-1.284978, 0.7472804, -1.367971, 1, 0.5411765, 0, 1,
-1.281851, -0.148641, 0.7348034, 1, 0.5450981, 0, 1,
-1.281629, 0.2989014, -1.11111, 1, 0.5529412, 0, 1,
-1.272399, 0.3372017, -1.353719, 1, 0.5568628, 0, 1,
-1.252317, 0.5997145, -1.110523, 1, 0.5647059, 0, 1,
-1.251266, -0.911245, -3.452556, 1, 0.5686275, 0, 1,
-1.245771, -0.1895272, -0.8164609, 1, 0.5764706, 0, 1,
-1.245672, 0.31002, -1.55217, 1, 0.5803922, 0, 1,
-1.23554, 1.216296, -0.9296095, 1, 0.5882353, 0, 1,
-1.233255, 0.2011376, -1.477398, 1, 0.5921569, 0, 1,
-1.232492, -1.501034, -2.945684, 1, 0.6, 0, 1,
-1.231978, -0.3486414, -1.461637, 1, 0.6078432, 0, 1,
-1.217685, 0.5244533, -2.025456, 1, 0.6117647, 0, 1,
-1.216067, -0.4310243, -0.7942878, 1, 0.6196079, 0, 1,
-1.204842, 0.3772636, -0.5464671, 1, 0.6235294, 0, 1,
-1.198022, -0.2024087, -1.12395, 1, 0.6313726, 0, 1,
-1.197868, -0.380376, -2.750923, 1, 0.6352941, 0, 1,
-1.193988, -0.9647734, -1.133929, 1, 0.6431373, 0, 1,
-1.190003, -0.2806306, -2.791544, 1, 0.6470588, 0, 1,
-1.177393, 0.04301843, 1.000879, 1, 0.654902, 0, 1,
-1.175143, -1.159574, -2.404483, 1, 0.6588235, 0, 1,
-1.171052, 0.0506421, -3.506635, 1, 0.6666667, 0, 1,
-1.164388, 0.2375537, -0.2583054, 1, 0.6705883, 0, 1,
-1.164319, -1.365749, -4.631786, 1, 0.6784314, 0, 1,
-1.160516, -2.029655, -2.249734, 1, 0.682353, 0, 1,
-1.150531, 0.8217226, -1.08942, 1, 0.6901961, 0, 1,
-1.147127, -0.06791227, -2.198533, 1, 0.6941177, 0, 1,
-1.145604, 1.284854, 0.3529742, 1, 0.7019608, 0, 1,
-1.143278, 1.174288, -0.07360069, 1, 0.7098039, 0, 1,
-1.137443, -0.3221295, -1.425929, 1, 0.7137255, 0, 1,
-1.136461, -0.372598, -0.243091, 1, 0.7215686, 0, 1,
-1.12973, -0.1313688, -3.035566, 1, 0.7254902, 0, 1,
-1.127828, 1.209901, -0.1115897, 1, 0.7333333, 0, 1,
-1.125932, 1.382443, 0.7366734, 1, 0.7372549, 0, 1,
-1.1231, -1.389414, -2.028395, 1, 0.7450981, 0, 1,
-1.119934, 1.240129, -0.2933218, 1, 0.7490196, 0, 1,
-1.11984, -0.1483388, -2.520483, 1, 0.7568628, 0, 1,
-1.119303, 0.7636874, -1.144848, 1, 0.7607843, 0, 1,
-1.119193, 0.9514593, -0.07398637, 1, 0.7686275, 0, 1,
-1.114401, -0.2083972, -1.4586, 1, 0.772549, 0, 1,
-1.111942, 2.590189, 0.5387232, 1, 0.7803922, 0, 1,
-1.110108, 0.4344761, -1.132792, 1, 0.7843137, 0, 1,
-1.108548, 0.001771123, -2.355427, 1, 0.7921569, 0, 1,
-1.100626, -0.9157519, -2.060203, 1, 0.7960784, 0, 1,
-1.09422, 0.9696001, -0.381409, 1, 0.8039216, 0, 1,
-1.091377, 1.436137, -1.620294, 1, 0.8117647, 0, 1,
-1.090981, 0.818327, -0.5899316, 1, 0.8156863, 0, 1,
-1.08916, 0.3847984, -1.31096, 1, 0.8235294, 0, 1,
-1.084984, 0.110018, -0.5795657, 1, 0.827451, 0, 1,
-1.084814, -1.253213, -0.2943675, 1, 0.8352941, 0, 1,
-1.08161, 0.9785756, 0.8932822, 1, 0.8392157, 0, 1,
-1.080211, 1.032818, -0.1855493, 1, 0.8470588, 0, 1,
-1.077608, 0.05939562, -0.6254367, 1, 0.8509804, 0, 1,
-1.073562, 1.766711, 0.6929581, 1, 0.8588235, 0, 1,
-1.069465, -0.04007238, -1.624385, 1, 0.8627451, 0, 1,
-1.067035, -0.4015972, -2.65208, 1, 0.8705882, 0, 1,
-1.05675, -1.1752, -2.452949, 1, 0.8745098, 0, 1,
-1.050464, -0.2594239, -2.367385, 1, 0.8823529, 0, 1,
-1.042987, -0.1392967, -3.50151, 1, 0.8862745, 0, 1,
-1.036385, 0.7370276, -1.704293, 1, 0.8941177, 0, 1,
-1.03416, -0.0499418, -2.304011, 1, 0.8980392, 0, 1,
-1.030798, -1.010407, -1.317416, 1, 0.9058824, 0, 1,
-1.029876, 1.336483, -1.691472, 1, 0.9137255, 0, 1,
-1.025698, 0.3737534, -1.892101, 1, 0.9176471, 0, 1,
-1.022864, -1.881196, -4.699223, 1, 0.9254902, 0, 1,
-1.015159, -0.002776935, -2.141436, 1, 0.9294118, 0, 1,
-1.00425, -1.022281, -2.819559, 1, 0.9372549, 0, 1,
-0.9968833, -1.722961, -1.526042, 1, 0.9411765, 0, 1,
-0.9942034, 0.0358275, -1.227486, 1, 0.9490196, 0, 1,
-0.9930412, 0.04022692, -0.8843949, 1, 0.9529412, 0, 1,
-0.9876374, -0.5996915, -3.459097, 1, 0.9607843, 0, 1,
-0.9855827, 1.972927, 0.8775914, 1, 0.9647059, 0, 1,
-0.9849928, -0.4537247, -0.7485849, 1, 0.972549, 0, 1,
-0.9843275, -1.33341, -4.201779, 1, 0.9764706, 0, 1,
-0.978577, -1.156066, -2.943454, 1, 0.9843137, 0, 1,
-0.9759148, -0.6305259, -1.99363, 1, 0.9882353, 0, 1,
-0.9739962, 0.1657752, -1.778656, 1, 0.9960784, 0, 1,
-0.9725875, -1.11469, -2.436076, 0.9960784, 1, 0, 1,
-0.9717045, 0.5516765, -0.3563975, 0.9921569, 1, 0, 1,
-0.9706666, -0.3164642, -3.362537, 0.9843137, 1, 0, 1,
-0.9683898, -0.151705, -0.8960082, 0.9803922, 1, 0, 1,
-0.9615124, 0.6409607, -1.085241, 0.972549, 1, 0, 1,
-0.9591308, -0.6088634, -2.398089, 0.9686275, 1, 0, 1,
-0.9562162, -0.212811, -2.84798, 0.9607843, 1, 0, 1,
-0.9502615, -0.5168587, -0.6282136, 0.9568627, 1, 0, 1,
-0.9475947, -0.3440257, -1.97653, 0.9490196, 1, 0, 1,
-0.9467658, -0.1957157, -0.2643239, 0.945098, 1, 0, 1,
-0.9426875, 1.897707, -1.304393, 0.9372549, 1, 0, 1,
-0.9342844, 1.370976, -0.3400521, 0.9333333, 1, 0, 1,
-0.929703, 0.1762388, -1.433618, 0.9254902, 1, 0, 1,
-0.9265701, 0.6471052, -0.5751831, 0.9215686, 1, 0, 1,
-0.9244788, -0.6474457, -2.009084, 0.9137255, 1, 0, 1,
-0.9213758, 0.1355587, 0.1368344, 0.9098039, 1, 0, 1,
-0.9207551, 1.751282, -1.293667, 0.9019608, 1, 0, 1,
-0.9203865, -0.2509207, -1.520521, 0.8941177, 1, 0, 1,
-0.9127145, -1.52539, -2.30226, 0.8901961, 1, 0, 1,
-0.9016692, 1.399922, -2.195962, 0.8823529, 1, 0, 1,
-0.8985229, 0.7903072, -1.738383, 0.8784314, 1, 0, 1,
-0.8934331, 0.832396, -0.9337882, 0.8705882, 1, 0, 1,
-0.8927792, -0.4559948, 0.09030306, 0.8666667, 1, 0, 1,
-0.8921273, -0.1249318, -1.687405, 0.8588235, 1, 0, 1,
-0.8902358, 0.6820958, -0.8929589, 0.854902, 1, 0, 1,
-0.8887329, -1.012826, -2.511556, 0.8470588, 1, 0, 1,
-0.8880593, -0.3524171, -2.677681, 0.8431373, 1, 0, 1,
-0.8742245, 0.5567189, -0.2199335, 0.8352941, 1, 0, 1,
-0.8725895, -2.66128, -3.129176, 0.8313726, 1, 0, 1,
-0.8721876, -1.258374, -4.708398, 0.8235294, 1, 0, 1,
-0.8711323, -0.1216031, -1.273982, 0.8196079, 1, 0, 1,
-0.8696323, 0.7729225, -0.1036685, 0.8117647, 1, 0, 1,
-0.8658385, 0.7111071, -1.113747, 0.8078431, 1, 0, 1,
-0.8636991, -0.1418592, 0.08337356, 0.8, 1, 0, 1,
-0.8611605, 0.1523266, -3.179388, 0.7921569, 1, 0, 1,
-0.859257, 0.5409296, 0.4862121, 0.7882353, 1, 0, 1,
-0.8583823, -0.2792179, -2.415745, 0.7803922, 1, 0, 1,
-0.8533403, -0.3893573, -2.65265, 0.7764706, 1, 0, 1,
-0.8458738, 0.4562677, -1.343635, 0.7686275, 1, 0, 1,
-0.8403597, 0.1964867, -1.205359, 0.7647059, 1, 0, 1,
-0.825065, 0.02750086, 0.5440146, 0.7568628, 1, 0, 1,
-0.8246992, -1.6251, -3.484684, 0.7529412, 1, 0, 1,
-0.8227324, 0.1578811, -2.351672, 0.7450981, 1, 0, 1,
-0.8223112, -0.2139117, -1.971138, 0.7411765, 1, 0, 1,
-0.816004, 0.3956245, 0.3517686, 0.7333333, 1, 0, 1,
-0.811164, 1.538721, -1.643422, 0.7294118, 1, 0, 1,
-0.8098654, 0.1812421, -0.8876587, 0.7215686, 1, 0, 1,
-0.8060259, -0.4277755, -2.665755, 0.7176471, 1, 0, 1,
-0.7859635, -0.1364879, -1.731136, 0.7098039, 1, 0, 1,
-0.7811005, -0.7853921, -2.35252, 0.7058824, 1, 0, 1,
-0.7803186, 0.2614763, -2.505872, 0.6980392, 1, 0, 1,
-0.779903, 2.129495, 1.835871, 0.6901961, 1, 0, 1,
-0.7732404, 1.70579, -0.8909881, 0.6862745, 1, 0, 1,
-0.7731358, -1.076087, -2.26192, 0.6784314, 1, 0, 1,
-0.7717296, -0.9989074, -2.906807, 0.6745098, 1, 0, 1,
-0.7690814, -1.005164, -4.499269, 0.6666667, 1, 0, 1,
-0.7680224, -0.3963402, -1.203189, 0.6627451, 1, 0, 1,
-0.7615069, 0.6822492, -0.2803447, 0.654902, 1, 0, 1,
-0.7602403, -0.9091129, -0.9962143, 0.6509804, 1, 0, 1,
-0.7601476, 0.1676966, -1.262019, 0.6431373, 1, 0, 1,
-0.7599404, -0.6072812, -0.6515002, 0.6392157, 1, 0, 1,
-0.7577689, -0.2380766, -2.188251, 0.6313726, 1, 0, 1,
-0.7576233, -0.5912753, -3.961441, 0.627451, 1, 0, 1,
-0.7524922, -0.5062039, -2.042341, 0.6196079, 1, 0, 1,
-0.752059, -0.6833607, -1.9101, 0.6156863, 1, 0, 1,
-0.7508122, 0.1289915, -1.727556, 0.6078432, 1, 0, 1,
-0.7455685, -0.8084114, -0.8384011, 0.6039216, 1, 0, 1,
-0.7448626, -1.245458, -3.761734, 0.5960785, 1, 0, 1,
-0.7432987, -0.2361013, -0.3356803, 0.5882353, 1, 0, 1,
-0.7411439, -0.3280906, -0.8808069, 0.5843138, 1, 0, 1,
-0.7404368, -0.6437693, -2.31267, 0.5764706, 1, 0, 1,
-0.7340522, 0.8917169, -0.3970614, 0.572549, 1, 0, 1,
-0.7314324, -0.128621, -4.226389, 0.5647059, 1, 0, 1,
-0.7295885, 0.299024, -2.048801, 0.5607843, 1, 0, 1,
-0.7282926, 0.9368671, -1.045025, 0.5529412, 1, 0, 1,
-0.7276106, 0.7310758, -0.7455747, 0.5490196, 1, 0, 1,
-0.7257728, -0.5710268, -0.2210995, 0.5411765, 1, 0, 1,
-0.7228103, 2.358123, -0.1570304, 0.5372549, 1, 0, 1,
-0.7153856, -0.8682882, -4.563214, 0.5294118, 1, 0, 1,
-0.7152334, -1.301729, -1.983099, 0.5254902, 1, 0, 1,
-0.709421, -0.1647568, -2.817801, 0.5176471, 1, 0, 1,
-0.7073007, 0.4163992, 0.1468132, 0.5137255, 1, 0, 1,
-0.7027991, -0.9385388, -3.182663, 0.5058824, 1, 0, 1,
-0.6966879, -1.096629, -2.47861, 0.5019608, 1, 0, 1,
-0.6929845, -0.03812555, -0.7938219, 0.4941176, 1, 0, 1,
-0.6914183, -1.150152, -3.356514, 0.4862745, 1, 0, 1,
-0.689837, 0.3036723, -1.790076, 0.4823529, 1, 0, 1,
-0.6887393, -0.1081406, -0.5726805, 0.4745098, 1, 0, 1,
-0.6881989, 0.4510468, -2.091826, 0.4705882, 1, 0, 1,
-0.687125, 2.533909, -1.121224, 0.4627451, 1, 0, 1,
-0.6847414, -0.4636433, -2.111968, 0.4588235, 1, 0, 1,
-0.6818699, -0.3421026, -1.288364, 0.4509804, 1, 0, 1,
-0.6805394, -0.3353064, -1.063779, 0.4470588, 1, 0, 1,
-0.6717185, 0.4194337, -1.27988, 0.4392157, 1, 0, 1,
-0.6657895, 0.3553401, -0.7751038, 0.4352941, 1, 0, 1,
-0.6605182, -0.008323445, -0.05480459, 0.427451, 1, 0, 1,
-0.6538086, -0.95309, -2.256444, 0.4235294, 1, 0, 1,
-0.6514712, -1.419046, -2.486955, 0.4156863, 1, 0, 1,
-0.6510919, -1.71294, -4.039753, 0.4117647, 1, 0, 1,
-0.6499797, -1.089597, -2.948175, 0.4039216, 1, 0, 1,
-0.6467878, -0.1164619, -2.452412, 0.3960784, 1, 0, 1,
-0.645318, -0.335445, -2.764326, 0.3921569, 1, 0, 1,
-0.6421525, -0.6165128, -1.636576, 0.3843137, 1, 0, 1,
-0.6363865, -0.09957395, -0.2166028, 0.3803922, 1, 0, 1,
-0.6306396, 0.1639216, -1.212011, 0.372549, 1, 0, 1,
-0.6296098, 0.7871836, -1.192088, 0.3686275, 1, 0, 1,
-0.6253337, 1.169085, 0.6861441, 0.3607843, 1, 0, 1,
-0.6176255, -0.06643278, -2.52889, 0.3568628, 1, 0, 1,
-0.6152085, -1.208847, -1.840532, 0.3490196, 1, 0, 1,
-0.6150604, 1.873824, -0.9706272, 0.345098, 1, 0, 1,
-0.612704, 0.3892085, -2.77744, 0.3372549, 1, 0, 1,
-0.6117767, -1.426587, -3.671559, 0.3333333, 1, 0, 1,
-0.6076959, -0.9540045, -2.332866, 0.3254902, 1, 0, 1,
-0.6042753, -1.408178, -2.045972, 0.3215686, 1, 0, 1,
-0.6019735, -0.7490029, -0.7934566, 0.3137255, 1, 0, 1,
-0.6018207, 0.366179, -1.847868, 0.3098039, 1, 0, 1,
-0.600808, -0.2692208, -3.123281, 0.3019608, 1, 0, 1,
-0.5986202, -0.3316487, -2.443987, 0.2941177, 1, 0, 1,
-0.5974202, 0.0845117, -1.619987, 0.2901961, 1, 0, 1,
-0.5940018, -1.176491, -2.581045, 0.282353, 1, 0, 1,
-0.5905087, -0.102281, -2.501359, 0.2784314, 1, 0, 1,
-0.5777825, 0.2469101, -1.651353, 0.2705882, 1, 0, 1,
-0.5737419, -0.814326, -2.599213, 0.2666667, 1, 0, 1,
-0.5711724, 0.7971958, -0.2818209, 0.2588235, 1, 0, 1,
-0.5687965, 0.9713114, -2.197219, 0.254902, 1, 0, 1,
-0.5660744, -0.4019736, -0.8843483, 0.2470588, 1, 0, 1,
-0.5535244, 1.803757, 0.06474074, 0.2431373, 1, 0, 1,
-0.5527146, -0.9488366, -3.082203, 0.2352941, 1, 0, 1,
-0.5510896, 0.4709936, -2.774801, 0.2313726, 1, 0, 1,
-0.5503557, -0.3435103, -2.574283, 0.2235294, 1, 0, 1,
-0.5483188, -0.01796986, -1.723834, 0.2196078, 1, 0, 1,
-0.5482966, -2.413599, -3.434954, 0.2117647, 1, 0, 1,
-0.5464244, 0.5350195, 0.6684438, 0.2078431, 1, 0, 1,
-0.5450056, 0.4087847, 0.03581222, 0.2, 1, 0, 1,
-0.5364364, -1.851071, -1.58147, 0.1921569, 1, 0, 1,
-0.5330655, -1.383682, -2.448591, 0.1882353, 1, 0, 1,
-0.5315014, -1.090399, -1.460411, 0.1803922, 1, 0, 1,
-0.5258569, -0.6639413, 0.2121487, 0.1764706, 1, 0, 1,
-0.5228154, 0.1867014, -0.476067, 0.1686275, 1, 0, 1,
-0.5152214, -0.2892919, -2.649686, 0.1647059, 1, 0, 1,
-0.5147786, -0.4479259, -2.350965, 0.1568628, 1, 0, 1,
-0.5141479, -0.07753921, -0.6740255, 0.1529412, 1, 0, 1,
-0.5136732, 0.2533978, -1.401941, 0.145098, 1, 0, 1,
-0.5128075, 2.056967, 0.03374878, 0.1411765, 1, 0, 1,
-0.5091167, -0.8460124, -2.741979, 0.1333333, 1, 0, 1,
-0.5067567, 0.6713958, -1.25327, 0.1294118, 1, 0, 1,
-0.5048503, 0.3954572, -0.1276743, 0.1215686, 1, 0, 1,
-0.4986146, -0.8366447, -2.850881, 0.1176471, 1, 0, 1,
-0.4926498, -0.8765223, -2.29377, 0.1098039, 1, 0, 1,
-0.4908242, -1.069551, -1.672381, 0.1058824, 1, 0, 1,
-0.4902233, -0.765522, -2.508582, 0.09803922, 1, 0, 1,
-0.4847834, -1.05781, -1.315731, 0.09019608, 1, 0, 1,
-0.4814824, 1.964953, 0.3427247, 0.08627451, 1, 0, 1,
-0.4804814, 0.8723646, -0.898472, 0.07843138, 1, 0, 1,
-0.4795002, -1.194092, -4.932727, 0.07450981, 1, 0, 1,
-0.4780179, -0.9966413, -1.713279, 0.06666667, 1, 0, 1,
-0.4732116, 0.9026031, 0.6436728, 0.0627451, 1, 0, 1,
-0.4723078, -1.495855, -2.51247, 0.05490196, 1, 0, 1,
-0.4704489, 1.669096, -2.272587, 0.05098039, 1, 0, 1,
-0.4696857, -0.5618997, -3.611874, 0.04313726, 1, 0, 1,
-0.4684576, -0.1466159, -1.1055, 0.03921569, 1, 0, 1,
-0.4656686, -2.153851, -1.759382, 0.03137255, 1, 0, 1,
-0.4622433, 1.016688, -0.3182793, 0.02745098, 1, 0, 1,
-0.4586327, -0.629114, -2.089957, 0.01960784, 1, 0, 1,
-0.4523302, 0.2527231, -1.434844, 0.01568628, 1, 0, 1,
-0.4516198, 0.02569022, -1.039598, 0.007843138, 1, 0, 1,
-0.4447952, 1.221695, -0.5992017, 0.003921569, 1, 0, 1,
-0.4417934, -0.003055654, -0.833941, 0, 1, 0.003921569, 1,
-0.4411907, -1.201702, -4.463008, 0, 1, 0.01176471, 1,
-0.4390307, 0.6265922, -2.788757, 0, 1, 0.01568628, 1,
-0.4332319, -0.5631163, -3.924368, 0, 1, 0.02352941, 1,
-0.4320902, 0.02485128, 1.324427, 0, 1, 0.02745098, 1,
-0.4258854, 0.3411285, -0.8846442, 0, 1, 0.03529412, 1,
-0.4233556, -1.013071, -2.440622, 0, 1, 0.03921569, 1,
-0.4228868, 0.02371381, -1.663945, 0, 1, 0.04705882, 1,
-0.4173404, -0.8089511, -2.915535, 0, 1, 0.05098039, 1,
-0.4127527, 1.723988, 0.7894663, 0, 1, 0.05882353, 1,
-0.411744, 0.2055774, -2.176063, 0, 1, 0.0627451, 1,
-0.4088759, 1.74038, -0.2443232, 0, 1, 0.07058824, 1,
-0.4087114, -1.457369, -4.82257, 0, 1, 0.07450981, 1,
-0.4069138, 1.327136, 0.5749615, 0, 1, 0.08235294, 1,
-0.4010875, 1.375372, -0.1988329, 0, 1, 0.08627451, 1,
-0.3955036, 1.524683, 0.6067904, 0, 1, 0.09411765, 1,
-0.3923437, -2.341108, -1.946518, 0, 1, 0.1019608, 1,
-0.3894105, -0.4485448, -3.171004, 0, 1, 0.1058824, 1,
-0.3816615, -1.256461, -2.110153, 0, 1, 0.1137255, 1,
-0.380817, 1.100513, -1.564691, 0, 1, 0.1176471, 1,
-0.3774695, 1.107913, -2.000265, 0, 1, 0.1254902, 1,
-0.3763104, -0.9847165, -4.022172, 0, 1, 0.1294118, 1,
-0.3745744, -0.1150788, -1.742932, 0, 1, 0.1372549, 1,
-0.3745441, 0.519882, 0.3138073, 0, 1, 0.1411765, 1,
-0.3726494, 0.2750992, 0.2192388, 0, 1, 0.1490196, 1,
-0.372072, -0.02999674, -3.054354, 0, 1, 0.1529412, 1,
-0.3711433, -1.069457, -1.98953, 0, 1, 0.1607843, 1,
-0.3709152, 0.68493, -1.190446, 0, 1, 0.1647059, 1,
-0.3703452, -0.1600172, -2.523048, 0, 1, 0.172549, 1,
-0.3596608, 0.1477119, -1.352268, 0, 1, 0.1764706, 1,
-0.3578235, 0.791187, -0.9864886, 0, 1, 0.1843137, 1,
-0.3578143, -0.4700373, -3.790187, 0, 1, 0.1882353, 1,
-0.3548885, -3.246501, -2.675776, 0, 1, 0.1960784, 1,
-0.3544259, -0.6537725, -1.528758, 0, 1, 0.2039216, 1,
-0.3540601, 0.6866487, 0.1239628, 0, 1, 0.2078431, 1,
-0.352824, -1.106378, -4.087563, 0, 1, 0.2156863, 1,
-0.3488622, 0.3396808, -1.606145, 0, 1, 0.2196078, 1,
-0.348804, -0.9874824, -4.260186, 0, 1, 0.227451, 1,
-0.3453675, -0.615373, -2.318802, 0, 1, 0.2313726, 1,
-0.3450296, -0.7261786, -3.711565, 0, 1, 0.2392157, 1,
-0.3428098, 0.7015053, 0.1923624, 0, 1, 0.2431373, 1,
-0.3387285, 0.411663, -0.06162647, 0, 1, 0.2509804, 1,
-0.3377775, 0.4682775, -1.697114, 0, 1, 0.254902, 1,
-0.3352984, -0.09634186, -2.185429, 0, 1, 0.2627451, 1,
-0.332343, 1.933836, -0.4611623, 0, 1, 0.2666667, 1,
-0.3321727, 1.591303, 1.198853, 0, 1, 0.2745098, 1,
-0.3311726, -0.07176939, -3.932801, 0, 1, 0.2784314, 1,
-0.3252192, 1.869553, -2.230386, 0, 1, 0.2862745, 1,
-0.3231599, -0.4518969, -2.248093, 0, 1, 0.2901961, 1,
-0.3116665, 1.654968, 0.06941626, 0, 1, 0.2980392, 1,
-0.3112916, 0.3034571, -0.3352679, 0, 1, 0.3058824, 1,
-0.3075764, -0.4337707, -2.060482, 0, 1, 0.3098039, 1,
-0.3025132, -0.8852689, -2.310624, 0, 1, 0.3176471, 1,
-0.2971281, 1.410792, -0.3058778, 0, 1, 0.3215686, 1,
-0.2949236, -0.2685607, -1.935665, 0, 1, 0.3294118, 1,
-0.2925324, 0.7688531, -1.207902, 0, 1, 0.3333333, 1,
-0.2924418, 0.6151728, -1.341083, 0, 1, 0.3411765, 1,
-0.2909382, 0.07516415, -1.950582, 0, 1, 0.345098, 1,
-0.2898064, -1.917236, -1.777131, 0, 1, 0.3529412, 1,
-0.2891026, 0.5259424, 1.49464, 0, 1, 0.3568628, 1,
-0.2868061, 1.132144, -1.903561, 0, 1, 0.3647059, 1,
-0.2846608, 0.2975483, -1.358296, 0, 1, 0.3686275, 1,
-0.2826912, -0.8722318, -1.93397, 0, 1, 0.3764706, 1,
-0.2805486, 0.7729916, -0.9266551, 0, 1, 0.3803922, 1,
-0.2791861, -0.0210568, -1.795221, 0, 1, 0.3882353, 1,
-0.2760517, 0.1694286, 0.230619, 0, 1, 0.3921569, 1,
-0.272909, 1.29952, -0.118971, 0, 1, 0.4, 1,
-0.2713556, 1.059875, -1.663248, 0, 1, 0.4078431, 1,
-0.2696464, 0.3140194, -2.058512, 0, 1, 0.4117647, 1,
-0.2685856, 0.3995402, 1.430921, 0, 1, 0.4196078, 1,
-0.2656473, -1.585616, -2.834899, 0, 1, 0.4235294, 1,
-0.2612756, 1.491554, 0.1281014, 0, 1, 0.4313726, 1,
-0.258561, 0.2248515, -0.3062047, 0, 1, 0.4352941, 1,
-0.2476587, -0.5059506, -2.375775, 0, 1, 0.4431373, 1,
-0.2466938, 1.079507, 0.4599863, 0, 1, 0.4470588, 1,
-0.2386895, 1.701163, 0.9927541, 0, 1, 0.454902, 1,
-0.2381604, 0.7539225, -1.757634, 0, 1, 0.4588235, 1,
-0.2314913, -1.051208, -4.081717, 0, 1, 0.4666667, 1,
-0.2278453, 0.5611925, 0.0005278207, 0, 1, 0.4705882, 1,
-0.2147941, -2.024218, -3.7008, 0, 1, 0.4784314, 1,
-0.2138398, 0.848237, -0.9563449, 0, 1, 0.4823529, 1,
-0.2081683, -0.8377954, -1.94931, 0, 1, 0.4901961, 1,
-0.2056731, 0.6901027, -1.651122, 0, 1, 0.4941176, 1,
-0.20493, -0.3399444, -2.656926, 0, 1, 0.5019608, 1,
-0.2034499, -1.420629, -4.062836, 0, 1, 0.509804, 1,
-0.1972356, -0.03086347, -0.5783886, 0, 1, 0.5137255, 1,
-0.1933332, -1.934296, -3.441445, 0, 1, 0.5215687, 1,
-0.1929455, -0.04941966, -1.032545, 0, 1, 0.5254902, 1,
-0.1919714, 0.9872628, -0.06897205, 0, 1, 0.5333334, 1,
-0.1868823, -0.9183159, -2.550004, 0, 1, 0.5372549, 1,
-0.1854072, 0.6532428, -0.1061014, 0, 1, 0.5450981, 1,
-0.1789295, 2.529276, 0.9746271, 0, 1, 0.5490196, 1,
-0.1767208, 0.2600897, -1.15951, 0, 1, 0.5568628, 1,
-0.1731557, 1.65651, -1.122715, 0, 1, 0.5607843, 1,
-0.1674633, 0.5513138, -0.1132722, 0, 1, 0.5686275, 1,
-0.1658927, -0.4530363, -4.074988, 0, 1, 0.572549, 1,
-0.1621004, 1.358189, -1.629171, 0, 1, 0.5803922, 1,
-0.1592197, 2.213659, 0.7406917, 0, 1, 0.5843138, 1,
-0.1489534, -0.963595, -3.33218, 0, 1, 0.5921569, 1,
-0.1452002, -0.02511062, -1.525907, 0, 1, 0.5960785, 1,
-0.1443663, -0.4417602, -2.554122, 0, 1, 0.6039216, 1,
-0.1443166, 0.5780789, 0.2430332, 0, 1, 0.6117647, 1,
-0.1441226, -0.4878296, -2.047189, 0, 1, 0.6156863, 1,
-0.1395629, 0.4835565, -1.638716, 0, 1, 0.6235294, 1,
-0.1392825, -1.227833, -2.792811, 0, 1, 0.627451, 1,
-0.1374056, 1.181525, -1.500291, 0, 1, 0.6352941, 1,
-0.1372936, 2.562337, -0.6154521, 0, 1, 0.6392157, 1,
-0.136702, 0.04626164, -1.371467, 0, 1, 0.6470588, 1,
-0.136446, 0.162022, 0.5110624, 0, 1, 0.6509804, 1,
-0.1360606, 0.1384766, -0.2809341, 0, 1, 0.6588235, 1,
-0.1358436, -0.3275555, -3.474221, 0, 1, 0.6627451, 1,
-0.1306844, -0.1345142, -2.540207, 0, 1, 0.6705883, 1,
-0.1305696, -1.813396, -4.219261, 0, 1, 0.6745098, 1,
-0.129337, 0.626942, -1.324731, 0, 1, 0.682353, 1,
-0.1240988, -0.4414513, -4.651871, 0, 1, 0.6862745, 1,
-0.1237065, -1.494193, -2.19402, 0, 1, 0.6941177, 1,
-0.1232681, 0.666028, -1.736123, 0, 1, 0.7019608, 1,
-0.1200472, 2.496941, -0.8383969, 0, 1, 0.7058824, 1,
-0.1197115, 0.861055, 1.763676, 0, 1, 0.7137255, 1,
-0.1149598, -0.6054893, -2.122321, 0, 1, 0.7176471, 1,
-0.114481, 0.01088989, 0.3589263, 0, 1, 0.7254902, 1,
-0.1075128, 1.319654, -0.2112084, 0, 1, 0.7294118, 1,
-0.1070218, -1.94284, -3.147775, 0, 1, 0.7372549, 1,
-0.1031634, -0.232297, -2.384027, 0, 1, 0.7411765, 1,
-0.1005704, 0.4906784, -0.3885409, 0, 1, 0.7490196, 1,
-0.09995457, 1.083112, -0.5795419, 0, 1, 0.7529412, 1,
-0.09372152, -0.9530888, -3.57144, 0, 1, 0.7607843, 1,
-0.09265399, -1.196979, -2.370999, 0, 1, 0.7647059, 1,
-0.09224085, -0.3894393, -2.627005, 0, 1, 0.772549, 1,
-0.08607449, 0.0749891, -1.468845, 0, 1, 0.7764706, 1,
-0.08088025, 1.806391, 1.317933, 0, 1, 0.7843137, 1,
-0.07537441, -1.98947, -5.12229, 0, 1, 0.7882353, 1,
-0.06834508, -0.05095389, -2.860477, 0, 1, 0.7960784, 1,
-0.06638034, -0.3765585, -2.453966, 0, 1, 0.8039216, 1,
-0.06459863, 0.5926912, -1.702657, 0, 1, 0.8078431, 1,
-0.06145591, 0.9546278, -0.3620174, 0, 1, 0.8156863, 1,
-0.05995506, 0.8696322, -1.107445, 0, 1, 0.8196079, 1,
-0.0598851, 1.463768, 1.13039, 0, 1, 0.827451, 1,
-0.05825125, -2.68172, -3.816976, 0, 1, 0.8313726, 1,
-0.0576021, 0.2294243, -0.3076935, 0, 1, 0.8392157, 1,
-0.05613563, -0.5295208, -2.147429, 0, 1, 0.8431373, 1,
-0.05592694, 2.002897, -0.586662, 0, 1, 0.8509804, 1,
-0.05566305, 1.473591, -1.090959, 0, 1, 0.854902, 1,
-0.05487097, -0.4855459, -2.812219, 0, 1, 0.8627451, 1,
-0.05192498, -1.87825, -2.792432, 0, 1, 0.8666667, 1,
-0.05190042, -2.065312, -2.916667, 0, 1, 0.8745098, 1,
-0.05027796, 1.56524, -1.454693, 0, 1, 0.8784314, 1,
-0.04918535, 0.3921375, -0.4255049, 0, 1, 0.8862745, 1,
-0.04913231, -0.07908688, -0.2783125, 0, 1, 0.8901961, 1,
-0.04626559, -0.976155, -2.340376, 0, 1, 0.8980392, 1,
-0.04606569, -0.1705212, -2.176419, 0, 1, 0.9058824, 1,
-0.04178481, -0.04744913, -0.6151468, 0, 1, 0.9098039, 1,
-0.04020676, 0.08220731, 1.720166, 0, 1, 0.9176471, 1,
-0.03890254, -0.520974, -3.252941, 0, 1, 0.9215686, 1,
-0.03667983, -0.697507, -3.008481, 0, 1, 0.9294118, 1,
-0.0337456, 0.8263455, -0.2701748, 0, 1, 0.9333333, 1,
-0.02911275, -0.7622137, -3.333554, 0, 1, 0.9411765, 1,
-0.0285379, 2.010137, 0.4815714, 0, 1, 0.945098, 1,
-0.0272925, -0.6157587, -2.464388, 0, 1, 0.9529412, 1,
-0.01701254, -0.7376896, -3.990655, 0, 1, 0.9568627, 1,
-0.01508239, -0.3408314, -1.426889, 0, 1, 0.9647059, 1,
-0.01477196, -1.105762, -2.33121, 0, 1, 0.9686275, 1,
-0.01360986, 0.127637, 1.659841, 0, 1, 0.9764706, 1,
-0.01169336, -0.05251908, -4.1469, 0, 1, 0.9803922, 1,
-0.008957038, -0.6912395, -2.645032, 0, 1, 0.9882353, 1,
-0.005377574, 0.4208981, -0.6754893, 0, 1, 0.9921569, 1,
0.002803394, -2.125721, 2.563409, 0, 1, 1, 1,
0.004259739, -0.4968989, 2.847199, 0, 0.9921569, 1, 1,
0.006790825, -2.046885, 2.786584, 0, 0.9882353, 1, 1,
0.01083804, 0.08869293, 0.1657231, 0, 0.9803922, 1, 1,
0.01299515, -1.408082, 3.625208, 0, 0.9764706, 1, 1,
0.01507959, 0.4816533, 0.3573793, 0, 0.9686275, 1, 1,
0.01933342, 0.04777417, 1.336763, 0, 0.9647059, 1, 1,
0.02161892, -0.1063465, 2.517454, 0, 0.9568627, 1, 1,
0.0221295, 1.016145, 1.677549, 0, 0.9529412, 1, 1,
0.02943618, -0.1723408, 3.753294, 0, 0.945098, 1, 1,
0.03234098, 0.5255119, 0.6033885, 0, 0.9411765, 1, 1,
0.0324945, 0.06358892, 1.390528, 0, 0.9333333, 1, 1,
0.03819773, -0.173587, 3.212609, 0, 0.9294118, 1, 1,
0.039109, 1.217634, -1.525485, 0, 0.9215686, 1, 1,
0.04265163, -0.09758389, 1.927183, 0, 0.9176471, 1, 1,
0.05548136, -0.3118931, 2.670541, 0, 0.9098039, 1, 1,
0.05773941, 1.437567, -0.361407, 0, 0.9058824, 1, 1,
0.05945704, 0.4353034, 2.126446, 0, 0.8980392, 1, 1,
0.06007688, -1.633445, 3.292161, 0, 0.8901961, 1, 1,
0.06740429, 1.830999, 0.1204879, 0, 0.8862745, 1, 1,
0.06815103, 0.1256931, 0.6547987, 0, 0.8784314, 1, 1,
0.07455022, 0.8919873, -0.8847543, 0, 0.8745098, 1, 1,
0.07508881, -0.05084515, 1.229643, 0, 0.8666667, 1, 1,
0.07684152, -0.3900267, 1.857185, 0, 0.8627451, 1, 1,
0.08053292, -0.1650094, 2.667444, 0, 0.854902, 1, 1,
0.08140014, -0.1945919, 2.35805, 0, 0.8509804, 1, 1,
0.08245127, -2.118251, 2.541868, 0, 0.8431373, 1, 1,
0.08582182, -0.769311, 3.329092, 0, 0.8392157, 1, 1,
0.08680514, 0.4516543, 0.8861066, 0, 0.8313726, 1, 1,
0.08878355, 0.880411, -2.093101, 0, 0.827451, 1, 1,
0.09024494, 1.818356, -0.3977973, 0, 0.8196079, 1, 1,
0.09315405, 1.662056, 0.2233162, 0, 0.8156863, 1, 1,
0.09439133, 0.3550173, -0.05067132, 0, 0.8078431, 1, 1,
0.0974291, 0.8762841, 0.564453, 0, 0.8039216, 1, 1,
0.09857304, -0.7013013, 1.895759, 0, 0.7960784, 1, 1,
0.09916005, -0.8911321, 4.237136, 0, 0.7882353, 1, 1,
0.1002303, 0.373305, -0.02066516, 0, 0.7843137, 1, 1,
0.1057243, -0.4191528, 2.629075, 0, 0.7764706, 1, 1,
0.1138947, 1.116386, -1.496763, 0, 0.772549, 1, 1,
0.1193063, -0.5037093, 5.306405, 0, 0.7647059, 1, 1,
0.1206301, 0.7724128, 0.0389578, 0, 0.7607843, 1, 1,
0.1227382, 0.5634789, -1.592889, 0, 0.7529412, 1, 1,
0.1263105, -0.1504056, 2.802039, 0, 0.7490196, 1, 1,
0.1266482, 1.747269, 0.427991, 0, 0.7411765, 1, 1,
0.1317764, 0.6542812, 1.251887, 0, 0.7372549, 1, 1,
0.1320143, 0.8282377, 0.7358345, 0, 0.7294118, 1, 1,
0.1334996, -1.152761, 4.151238, 0, 0.7254902, 1, 1,
0.1354784, 1.302151, 0.8946673, 0, 0.7176471, 1, 1,
0.1357387, -0.1392588, 1.350486, 0, 0.7137255, 1, 1,
0.138057, -0.2843276, 3.163366, 0, 0.7058824, 1, 1,
0.1383174, 0.5896643, 0.7910613, 0, 0.6980392, 1, 1,
0.1395738, 0.2641568, 0.3303812, 0, 0.6941177, 1, 1,
0.143626, 0.438898, 0.6817181, 0, 0.6862745, 1, 1,
0.1446813, -2.020993, 2.176597, 0, 0.682353, 1, 1,
0.1468106, 0.3366813, 0.2095049, 0, 0.6745098, 1, 1,
0.1478551, -0.1209976, 1.623556, 0, 0.6705883, 1, 1,
0.1498954, -0.9480841, 4.335685, 0, 0.6627451, 1, 1,
0.1507577, 0.4098665, 0.390033, 0, 0.6588235, 1, 1,
0.1507976, 1.40223, 1.067732, 0, 0.6509804, 1, 1,
0.1511631, 2.258597, -0.6547763, 0, 0.6470588, 1, 1,
0.1530358, -1.354921, 4.038407, 0, 0.6392157, 1, 1,
0.1542121, -0.4523904, 3.288675, 0, 0.6352941, 1, 1,
0.1542588, -1.599109, 3.063818, 0, 0.627451, 1, 1,
0.1544725, 1.666365, -0.851011, 0, 0.6235294, 1, 1,
0.1588221, 0.8746828, 2.182424, 0, 0.6156863, 1, 1,
0.160544, 2.461291, -1.917241, 0, 0.6117647, 1, 1,
0.1647233, -0.7772596, 2.225579, 0, 0.6039216, 1, 1,
0.166605, -0.6922356, 3.243189, 0, 0.5960785, 1, 1,
0.1701353, -0.7197342, 2.628684, 0, 0.5921569, 1, 1,
0.1742437, -1.773492, 4.272042, 0, 0.5843138, 1, 1,
0.177107, -0.03587396, 1.65195, 0, 0.5803922, 1, 1,
0.1791352, -0.336553, 1.647513, 0, 0.572549, 1, 1,
0.1843534, -1.926001, 2.928213, 0, 0.5686275, 1, 1,
0.1872272, -0.9716896, 3.545173, 0, 0.5607843, 1, 1,
0.1879783, 0.5223491, -1.549801, 0, 0.5568628, 1, 1,
0.1907744, -1.557745, 2.089329, 0, 0.5490196, 1, 1,
0.1917446, -0.7132688, 3.705509, 0, 0.5450981, 1, 1,
0.1937073, -0.297976, 2.384742, 0, 0.5372549, 1, 1,
0.1986814, 0.05948415, 1.149894, 0, 0.5333334, 1, 1,
0.2006893, -1.924802, 3.796504, 0, 0.5254902, 1, 1,
0.2055472, 0.5819357, 0.1246952, 0, 0.5215687, 1, 1,
0.209769, 1.078009, 0.6257855, 0, 0.5137255, 1, 1,
0.2111209, 0.3486847, 1.09598, 0, 0.509804, 1, 1,
0.2126885, -0.1874395, 0.6053802, 0, 0.5019608, 1, 1,
0.2140235, 1.207804, -0.6233792, 0, 0.4941176, 1, 1,
0.220778, -2.096083, 3.547433, 0, 0.4901961, 1, 1,
0.2225056, 0.3828503, 1.908831, 0, 0.4823529, 1, 1,
0.222826, -0.6884253, 3.079659, 0, 0.4784314, 1, 1,
0.2238528, 1.543574, 0.2013991, 0, 0.4705882, 1, 1,
0.226331, -2.159513, 3.132471, 0, 0.4666667, 1, 1,
0.2268248, -0.2309934, 2.938778, 0, 0.4588235, 1, 1,
0.2289762, 1.043386, 0.5358034, 0, 0.454902, 1, 1,
0.2298137, -1.153389, 2.317149, 0, 0.4470588, 1, 1,
0.2327546, 0.8750484, 1.252961, 0, 0.4431373, 1, 1,
0.234129, -0.7955385, 2.423391, 0, 0.4352941, 1, 1,
0.2350438, -0.5376977, 2.109571, 0, 0.4313726, 1, 1,
0.2357388, -0.3236762, 1.861632, 0, 0.4235294, 1, 1,
0.237887, -1.926582, 1.739667, 0, 0.4196078, 1, 1,
0.2410057, -0.7790381, 1.650655, 0, 0.4117647, 1, 1,
0.2414796, 0.2675664, -1.495594, 0, 0.4078431, 1, 1,
0.2442806, -0.5799573, 2.37343, 0, 0.4, 1, 1,
0.251741, -1.543977, 4.397478, 0, 0.3921569, 1, 1,
0.2567363, 1.353043, 1.611026, 0, 0.3882353, 1, 1,
0.2605155, 0.64209, -1.280375, 0, 0.3803922, 1, 1,
0.2657938, -0.3461007, 2.550117, 0, 0.3764706, 1, 1,
0.2664194, -0.01323529, 0.7039643, 0, 0.3686275, 1, 1,
0.2665196, -0.3532144, 4.679398, 0, 0.3647059, 1, 1,
0.2688636, 0.9094232, -0.1191893, 0, 0.3568628, 1, 1,
0.2716009, -0.1388959, 1.496184, 0, 0.3529412, 1, 1,
0.2840953, -1.800008, 2.292928, 0, 0.345098, 1, 1,
0.289862, 1.041493, -1.063064, 0, 0.3411765, 1, 1,
0.290874, 1.155403, -1.479544, 0, 0.3333333, 1, 1,
0.2966022, 0.4061174, 0.5130168, 0, 0.3294118, 1, 1,
0.3035793, 0.9335276, -0.3221315, 0, 0.3215686, 1, 1,
0.3041709, 0.1678029, 1.322644, 0, 0.3176471, 1, 1,
0.310187, 0.305769, -1.090319, 0, 0.3098039, 1, 1,
0.3136683, -0.3104935, 2.810107, 0, 0.3058824, 1, 1,
0.3154379, 1.845227, 0.63998, 0, 0.2980392, 1, 1,
0.3187257, -0.2453476, 2.200716, 0, 0.2901961, 1, 1,
0.3193445, -1.243392, 3.721959, 0, 0.2862745, 1, 1,
0.3196019, 0.3560691, 0.2460271, 0, 0.2784314, 1, 1,
0.3234533, -1.198923, 3.220843, 0, 0.2745098, 1, 1,
0.3275991, -0.1983308, 2.52621, 0, 0.2666667, 1, 1,
0.3306023, 0.01020429, 2.377109, 0, 0.2627451, 1, 1,
0.3309774, 0.003895158, 2.137554, 0, 0.254902, 1, 1,
0.3381326, -0.8388454, 3.498823, 0, 0.2509804, 1, 1,
0.3420529, -0.7634731, 2.876894, 0, 0.2431373, 1, 1,
0.3448129, 1.495061, -0.3572521, 0, 0.2392157, 1, 1,
0.3464432, -1.521896, 3.011024, 0, 0.2313726, 1, 1,
0.3550004, -1.254404, 1.269734, 0, 0.227451, 1, 1,
0.3618079, 2.261707, 0.6802168, 0, 0.2196078, 1, 1,
0.3676153, -1.228914, 2.068939, 0, 0.2156863, 1, 1,
0.3698371, 0.1994678, 1.872899, 0, 0.2078431, 1, 1,
0.3736312, 1.153884, -0.1511538, 0, 0.2039216, 1, 1,
0.3776288, -0.6608813, 1.610669, 0, 0.1960784, 1, 1,
0.3780806, 0.1751163, 1.096851, 0, 0.1882353, 1, 1,
0.3851656, 0.7137099, -1.379957, 0, 0.1843137, 1, 1,
0.3854644, 0.05059435, 0.8969172, 0, 0.1764706, 1, 1,
0.3888195, 0.2267937, 2.107837, 0, 0.172549, 1, 1,
0.3897617, 0.1763694, 0.01471783, 0, 0.1647059, 1, 1,
0.391435, 0.621175, 0.6665555, 0, 0.1607843, 1, 1,
0.3954203, 0.5602534, -0.3126702, 0, 0.1529412, 1, 1,
0.3956068, -1.446415, 3.145251, 0, 0.1490196, 1, 1,
0.3965015, -3.249273, 5.369717, 0, 0.1411765, 1, 1,
0.40174, -0.4118747, 0.8639554, 0, 0.1372549, 1, 1,
0.4039422, -0.3809464, 2.651972, 0, 0.1294118, 1, 1,
0.4076595, -0.1708704, 2.486738, 0, 0.1254902, 1, 1,
0.4078192, 0.4815107, 0.166365, 0, 0.1176471, 1, 1,
0.4113803, -0.3162468, 1.119184, 0, 0.1137255, 1, 1,
0.4131774, 1.10447, -1.403132, 0, 0.1058824, 1, 1,
0.4203856, 1.179217, 1.009854, 0, 0.09803922, 1, 1,
0.4234958, 1.273071, -0.9441239, 0, 0.09411765, 1, 1,
0.4294762, -1.399761, 2.805747, 0, 0.08627451, 1, 1,
0.4297989, 0.3540252, 2.915859, 0, 0.08235294, 1, 1,
0.4299157, -0.6314844, 3.085397, 0, 0.07450981, 1, 1,
0.4313878, 0.6868167, -1.627766, 0, 0.07058824, 1, 1,
0.4316061, -2.091067, 4.360729, 0, 0.0627451, 1, 1,
0.4374943, 1.85272, 1.109364, 0, 0.05882353, 1, 1,
0.4394217, -0.1559775, 3.679941, 0, 0.05098039, 1, 1,
0.4395009, -0.7064264, 4.421785, 0, 0.04705882, 1, 1,
0.4430431, 0.6443511, -1.143621, 0, 0.03921569, 1, 1,
0.4447745, 0.7935591, 0.2251108, 0, 0.03529412, 1, 1,
0.4474997, 0.638279, 0.7552558, 0, 0.02745098, 1, 1,
0.4511914, 0.6058636, 1.327127, 0, 0.02352941, 1, 1,
0.4534552, -0.9594197, 2.452569, 0, 0.01568628, 1, 1,
0.459624, -0.9700487, 1.3975, 0, 0.01176471, 1, 1,
0.4607572, -0.8659142, 3.179432, 0, 0.003921569, 1, 1,
0.4622813, 0.3409418, 2.432147, 0.003921569, 0, 1, 1,
0.4645056, -0.1150802, 2.459774, 0.007843138, 0, 1, 1,
0.4655301, -0.686659, 1.556738, 0.01568628, 0, 1, 1,
0.4658982, -1.638628, 3.180267, 0.01960784, 0, 1, 1,
0.4667977, 0.2767272, -0.05722348, 0.02745098, 0, 1, 1,
0.4676304, 0.2228846, 1.863385, 0.03137255, 0, 1, 1,
0.4721109, -0.394272, 2.771102, 0.03921569, 0, 1, 1,
0.4724933, -0.05376457, 0.7437769, 0.04313726, 0, 1, 1,
0.4730941, 1.562833, -1.126952, 0.05098039, 0, 1, 1,
0.4750631, -0.9904345, 2.747714, 0.05490196, 0, 1, 1,
0.4782171, -0.2440538, 1.705023, 0.0627451, 0, 1, 1,
0.4790644, 0.6021031, 1.828904, 0.06666667, 0, 1, 1,
0.4808162, -1.247991, 2.682422, 0.07450981, 0, 1, 1,
0.4826939, 0.3952372, -0.4349018, 0.07843138, 0, 1, 1,
0.4859332, -0.5954792, 0.2965743, 0.08627451, 0, 1, 1,
0.4870385, -0.9108421, 4.392292, 0.09019608, 0, 1, 1,
0.4888239, 0.5588705, -0.2807918, 0.09803922, 0, 1, 1,
0.5011793, -0.9748294, 4.444898, 0.1058824, 0, 1, 1,
0.5028068, -0.4524568, 2.138927, 0.1098039, 0, 1, 1,
0.5038091, 0.4938346, 2.101347, 0.1176471, 0, 1, 1,
0.5093672, 0.6474336, 0.8361567, 0.1215686, 0, 1, 1,
0.5094836, 0.1248569, 0.4550976, 0.1294118, 0, 1, 1,
0.5099871, -1.617474, 4.786853, 0.1333333, 0, 1, 1,
0.5137563, 0.9636892, 1.118203, 0.1411765, 0, 1, 1,
0.5151389, 1.23482, 0.7177887, 0.145098, 0, 1, 1,
0.5209168, 1.379654, 0.01173434, 0.1529412, 0, 1, 1,
0.5222284, 1.885649, -0.2990556, 0.1568628, 0, 1, 1,
0.5224673, 0.5851997, 3.778262, 0.1647059, 0, 1, 1,
0.5230618, 0.3052959, -1.180159, 0.1686275, 0, 1, 1,
0.5278872, 0.4876984, 0.5616041, 0.1764706, 0, 1, 1,
0.5283719, 2.052492, -0.8463978, 0.1803922, 0, 1, 1,
0.5310229, 0.2079018, 0.007032937, 0.1882353, 0, 1, 1,
0.5326272, 0.3655837, 0.5821943, 0.1921569, 0, 1, 1,
0.5359021, -1.081514, 3.035004, 0.2, 0, 1, 1,
0.5365901, -0.4574758, 2.66053, 0.2078431, 0, 1, 1,
0.5369255, 0.2896899, 1.109125, 0.2117647, 0, 1, 1,
0.5480843, 0.302756, 1.771242, 0.2196078, 0, 1, 1,
0.5482844, 0.8821195, -1.100946, 0.2235294, 0, 1, 1,
0.549298, 0.8949593, 0.3367082, 0.2313726, 0, 1, 1,
0.5544569, 1.581016, 0.8239221, 0.2352941, 0, 1, 1,
0.5656509, -0.3634789, 0.5400312, 0.2431373, 0, 1, 1,
0.5687803, -0.1618461, 0.8388011, 0.2470588, 0, 1, 1,
0.5718269, 0.03803801, 2.339158, 0.254902, 0, 1, 1,
0.5740795, 1.658248, -0.2077359, 0.2588235, 0, 1, 1,
0.578599, 0.4681454, 1.064613, 0.2666667, 0, 1, 1,
0.5844848, 0.5112085, 0.8073532, 0.2705882, 0, 1, 1,
0.5909144, -0.8016254, 3.141234, 0.2784314, 0, 1, 1,
0.5918924, -0.5173296, 3.984808, 0.282353, 0, 1, 1,
0.59553, 0.316463, 1.315838, 0.2901961, 0, 1, 1,
0.5963808, 0.2370262, 0.7229477, 0.2941177, 0, 1, 1,
0.5997295, 0.2196128, 2.527179, 0.3019608, 0, 1, 1,
0.5998068, -0.174656, 3.556644, 0.3098039, 0, 1, 1,
0.6007831, -0.4407423, 4.077903, 0.3137255, 0, 1, 1,
0.6033446, 0.1555044, 0.5317469, 0.3215686, 0, 1, 1,
0.609151, 0.2371547, 1.011028, 0.3254902, 0, 1, 1,
0.6099888, -0.4884109, 2.870163, 0.3333333, 0, 1, 1,
0.6106901, -0.8087131, 2.573119, 0.3372549, 0, 1, 1,
0.6197883, -0.02662174, 3.193711, 0.345098, 0, 1, 1,
0.6208476, -1.337665, 2.925776, 0.3490196, 0, 1, 1,
0.6209968, 0.02991052, 1.481306, 0.3568628, 0, 1, 1,
0.6232529, -0.9346138, 3.010081, 0.3607843, 0, 1, 1,
0.6293341, 0.6632923, 1.480637, 0.3686275, 0, 1, 1,
0.6303229, -0.3756288, 4.044354, 0.372549, 0, 1, 1,
0.6308676, 0.6664819, 0.3925833, 0.3803922, 0, 1, 1,
0.6322362, -1.285127, 2.670405, 0.3843137, 0, 1, 1,
0.6323397, -0.105423, 1.031595, 0.3921569, 0, 1, 1,
0.6331881, -0.1822257, 2.29979, 0.3960784, 0, 1, 1,
0.6373869, -0.02624643, 2.590853, 0.4039216, 0, 1, 1,
0.6381524, 1.332754, 0.2811394, 0.4117647, 0, 1, 1,
0.6388634, -0.597633, 2.066796, 0.4156863, 0, 1, 1,
0.6407986, 0.5876596, 1.117146, 0.4235294, 0, 1, 1,
0.6411396, 1.093305, -0.1316173, 0.427451, 0, 1, 1,
0.6413115, -0.09809699, 2.375516, 0.4352941, 0, 1, 1,
0.6454088, 0.1967805, 1.535157, 0.4392157, 0, 1, 1,
0.6480466, -0.5272003, 2.111874, 0.4470588, 0, 1, 1,
0.6483839, 1.832325, 1.477196, 0.4509804, 0, 1, 1,
0.6506327, 0.2060585, 2.346432, 0.4588235, 0, 1, 1,
0.6513982, 1.166152, 0.5738766, 0.4627451, 0, 1, 1,
0.6522606, -0.5713482, 3.573124, 0.4705882, 0, 1, 1,
0.652563, 0.4262816, 2.373698, 0.4745098, 0, 1, 1,
0.6553105, -0.613008, 3.895608, 0.4823529, 0, 1, 1,
0.656498, 0.924307, -1.591078, 0.4862745, 0, 1, 1,
0.6569738, 0.2901743, 0.8025184, 0.4941176, 0, 1, 1,
0.6582314, 0.4710873, 0.6668032, 0.5019608, 0, 1, 1,
0.6584284, 0.4624737, 2.578076, 0.5058824, 0, 1, 1,
0.6614961, -0.3463503, 2.781856, 0.5137255, 0, 1, 1,
0.6625817, 1.469732, -1.940761, 0.5176471, 0, 1, 1,
0.6659235, -1.196732, 3.266435, 0.5254902, 0, 1, 1,
0.6660503, 0.9880369, 1.598616, 0.5294118, 0, 1, 1,
0.6682099, 0.2209746, -0.8945549, 0.5372549, 0, 1, 1,
0.6802979, -1.572529, 0.9437092, 0.5411765, 0, 1, 1,
0.6833224, -0.4952655, 3.349676, 0.5490196, 0, 1, 1,
0.6842796, 1.776038, -0.7037301, 0.5529412, 0, 1, 1,
0.6883527, 0.7723756, -0.3818676, 0.5607843, 0, 1, 1,
0.6891539, 0.9038196, 1.276849, 0.5647059, 0, 1, 1,
0.692877, -1.328445, 2.392339, 0.572549, 0, 1, 1,
0.6937402, 0.484006, -0.02024866, 0.5764706, 0, 1, 1,
0.6944284, 0.2822804, -0.1356006, 0.5843138, 0, 1, 1,
0.6959594, -1.585859, 2.209881, 0.5882353, 0, 1, 1,
0.6968197, 0.8298512, 1.012734, 0.5960785, 0, 1, 1,
0.6991303, 0.6844355, 0.3870258, 0.6039216, 0, 1, 1,
0.7068078, 0.5462942, 0.09346142, 0.6078432, 0, 1, 1,
0.7093843, -0.5470283, 1.664706, 0.6156863, 0, 1, 1,
0.7121378, -0.2512913, 0.177607, 0.6196079, 0, 1, 1,
0.7136027, 0.2152537, 0.07241984, 0.627451, 0, 1, 1,
0.7151689, -0.4799636, 1.342604, 0.6313726, 0, 1, 1,
0.7158378, 1.383279, -0.5990849, 0.6392157, 0, 1, 1,
0.7185345, 1.601924, -1.266456, 0.6431373, 0, 1, 1,
0.7222717, -0.2953922, 1.715684, 0.6509804, 0, 1, 1,
0.7248069, 0.1597975, 0.5104463, 0.654902, 0, 1, 1,
0.730249, 1.166351, 0.7841784, 0.6627451, 0, 1, 1,
0.7357646, -0.9360847, 2.449691, 0.6666667, 0, 1, 1,
0.7371498, 0.3055926, 0.4938944, 0.6745098, 0, 1, 1,
0.7408212, -0.3460932, 1.915614, 0.6784314, 0, 1, 1,
0.7492056, -1.037259, 2.486845, 0.6862745, 0, 1, 1,
0.7531459, 1.022043, 1.579175, 0.6901961, 0, 1, 1,
0.7567214, -0.4455671, 3.286993, 0.6980392, 0, 1, 1,
0.7584296, 2.19578, 1.40071, 0.7058824, 0, 1, 1,
0.7596117, 1.418151, -1.218712, 0.7098039, 0, 1, 1,
0.7614181, 0.9097317, -0.002819445, 0.7176471, 0, 1, 1,
0.7628473, -0.4132063, 3.062563, 0.7215686, 0, 1, 1,
0.7661152, 0.04237381, 3.00171, 0.7294118, 0, 1, 1,
0.774949, 0.5188044, 0.5902929, 0.7333333, 0, 1, 1,
0.7763207, 0.9710516, 1.968386, 0.7411765, 0, 1, 1,
0.7774004, 0.1312466, 1.389671, 0.7450981, 0, 1, 1,
0.7827367, -0.1755785, 0.6567245, 0.7529412, 0, 1, 1,
0.7845679, 0.7835903, -1.094966, 0.7568628, 0, 1, 1,
0.7886936, -0.6720537, 1.969648, 0.7647059, 0, 1, 1,
0.7887088, 1.794992, -1.191701, 0.7686275, 0, 1, 1,
0.7892969, -1.383218, 3.47812, 0.7764706, 0, 1, 1,
0.7918038, 0.1110361, 2.200652, 0.7803922, 0, 1, 1,
0.7945449, 1.3279, 2.522485, 0.7882353, 0, 1, 1,
0.7980115, -0.04729448, 2.900488, 0.7921569, 0, 1, 1,
0.8076558, 0.6423794, 2.794078, 0.8, 0, 1, 1,
0.8095312, -0.6821139, 1.723115, 0.8078431, 0, 1, 1,
0.8115724, 0.7066898, 2.073785, 0.8117647, 0, 1, 1,
0.815191, 0.9005169, 0.4297225, 0.8196079, 0, 1, 1,
0.8206956, -1.025592, 3.171706, 0.8235294, 0, 1, 1,
0.8211171, -0.5301283, 1.459266, 0.8313726, 0, 1, 1,
0.8328753, -0.3489912, 2.41137, 0.8352941, 0, 1, 1,
0.834024, 1.415896, 0.5208207, 0.8431373, 0, 1, 1,
0.8393292, 1.120209, 1.721188, 0.8470588, 0, 1, 1,
0.8410391, 1.356936, 0.7539691, 0.854902, 0, 1, 1,
0.8560137, 1.044711, 0.5809029, 0.8588235, 0, 1, 1,
0.8593819, 1.524956, -0.8706596, 0.8666667, 0, 1, 1,
0.861242, 1.176772, 0.9984828, 0.8705882, 0, 1, 1,
0.8666073, 0.3365656, 0.8126616, 0.8784314, 0, 1, 1,
0.8668975, -0.2174453, 3.425791, 0.8823529, 0, 1, 1,
0.8723202, 0.02418889, 1.072528, 0.8901961, 0, 1, 1,
0.8744659, 0.9816759, -1.743168, 0.8941177, 0, 1, 1,
0.8768994, -0.7798687, 2.919063, 0.9019608, 0, 1, 1,
0.8796098, -0.6546786, 2.139179, 0.9098039, 0, 1, 1,
0.8813998, 0.5436753, -1.194135, 0.9137255, 0, 1, 1,
0.8816019, 0.3670219, -0.2113772, 0.9215686, 0, 1, 1,
0.883956, -0.4628383, 1.436796, 0.9254902, 0, 1, 1,
0.890443, -0.2323256, 3.516366, 0.9333333, 0, 1, 1,
0.8904937, 0.9092375, 3.050958, 0.9372549, 0, 1, 1,
0.8916714, -0.8744328, 2.057653, 0.945098, 0, 1, 1,
0.8949959, -1.086913, 3.667691, 0.9490196, 0, 1, 1,
0.8954895, 0.1545045, 3.118964, 0.9568627, 0, 1, 1,
0.8966417, -0.2288837, 1.985974, 0.9607843, 0, 1, 1,
0.9064249, 0.06089818, 1.392985, 0.9686275, 0, 1, 1,
0.9097139, 0.7412975, 2.411995, 0.972549, 0, 1, 1,
0.9216448, -0.3673143, 2.327682, 0.9803922, 0, 1, 1,
0.9311663, -0.9001303, 3.321767, 0.9843137, 0, 1, 1,
0.9348136, -1.267213, 3.311788, 0.9921569, 0, 1, 1,
0.9371811, -0.4634359, 2.657583, 0.9960784, 0, 1, 1,
0.9376094, -0.7462202, 1.837131, 1, 0, 0.9960784, 1,
0.9467171, 1.539851, -2.59609, 1, 0, 0.9882353, 1,
0.9482322, -0.07475646, 0.524677, 1, 0, 0.9843137, 1,
0.9501271, 1.55356, 1.199834, 1, 0, 0.9764706, 1,
0.9615622, 2.587824, -1.928596, 1, 0, 0.972549, 1,
0.9628559, 0.5943128, 3.446267, 1, 0, 0.9647059, 1,
0.9726429, 0.1420367, 1.276129, 1, 0, 0.9607843, 1,
0.9761496, 0.7255226, 1.638222, 1, 0, 0.9529412, 1,
0.9809421, 0.4425633, 0.8976885, 1, 0, 0.9490196, 1,
0.9821939, 2.472771, 0.7415786, 1, 0, 0.9411765, 1,
0.9832144, -0.6868248, 2.085133, 1, 0, 0.9372549, 1,
0.9859504, -2.148325, 0.5328721, 1, 0, 0.9294118, 1,
0.990585, 2.520087, -0.1891642, 1, 0, 0.9254902, 1,
0.991926, -0.2143331, 1.867005, 1, 0, 0.9176471, 1,
0.9928266, -2.366673, 3.155569, 1, 0, 0.9137255, 1,
0.9941847, -0.3779475, 0.5771878, 1, 0, 0.9058824, 1,
0.9946974, 0.8270311, 0.783823, 1, 0, 0.9019608, 1,
1.000175, 0.9231976, 0.08297677, 1, 0, 0.8941177, 1,
1.009834, -0.4582693, 0.564781, 1, 0, 0.8862745, 1,
1.026126, 0.8081762, 0.9717784, 1, 0, 0.8823529, 1,
1.052904, -0.4266265, 1.893263, 1, 0, 0.8745098, 1,
1.061441, -2.114897, 2.320329, 1, 0, 0.8705882, 1,
1.062725, -0.9719874, 2.998621, 1, 0, 0.8627451, 1,
1.063771, -1.209455, 1.153182, 1, 0, 0.8588235, 1,
1.064756, -0.7201725, 1.934192, 1, 0, 0.8509804, 1,
1.068257, -1.018733, 1.46797, 1, 0, 0.8470588, 1,
1.06902, 0.1386071, -0.1214501, 1, 0, 0.8392157, 1,
1.080602, 0.9212396, 1.772969, 1, 0, 0.8352941, 1,
1.083364, 0.04162225, 2.069607, 1, 0, 0.827451, 1,
1.092047, -0.3411008, 2.228225, 1, 0, 0.8235294, 1,
1.099139, -0.3345685, 1.291271, 1, 0, 0.8156863, 1,
1.101136, 0.9315165, 1.993375, 1, 0, 0.8117647, 1,
1.102491, 0.3435897, 2.085823, 1, 0, 0.8039216, 1,
1.106886, 0.1084265, 0.8333449, 1, 0, 0.7960784, 1,
1.108375, 0.3228706, 3.107845, 1, 0, 0.7921569, 1,
1.109609, -0.8503131, 3.556669, 1, 0, 0.7843137, 1,
1.112479, 0.4276129, 2.057134, 1, 0, 0.7803922, 1,
1.113513, 0.247275, 1.226433, 1, 0, 0.772549, 1,
1.121009, 0.3295618, 0.8737645, 1, 0, 0.7686275, 1,
1.121911, -0.3798665, 0.1975132, 1, 0, 0.7607843, 1,
1.136878, 0.3403234, 1.846663, 1, 0, 0.7568628, 1,
1.143273, 1.088405, 0.4338204, 1, 0, 0.7490196, 1,
1.146418, -1.613494, 3.42344, 1, 0, 0.7450981, 1,
1.155057, -0.5157728, 1.841153, 1, 0, 0.7372549, 1,
1.157415, 0.3739066, 2.733498, 1, 0, 0.7333333, 1,
1.163932, 0.6296854, 1.369539, 1, 0, 0.7254902, 1,
1.174376, 2.083849, 0.5633962, 1, 0, 0.7215686, 1,
1.176576, 0.3081967, 1.51914, 1, 0, 0.7137255, 1,
1.178239, -1.870166, 2.813316, 1, 0, 0.7098039, 1,
1.190423, 1.087159, 1.055865, 1, 0, 0.7019608, 1,
1.191686, -0.9436774, 1.740494, 1, 0, 0.6941177, 1,
1.194155, 0.3309485, 0.04176242, 1, 0, 0.6901961, 1,
1.196005, 0.5860329, 0.482081, 1, 0, 0.682353, 1,
1.197444, 0.9183393, 1.412622, 1, 0, 0.6784314, 1,
1.206785, -0.7815043, 1.279014, 1, 0, 0.6705883, 1,
1.217656, -0.5647658, 2.82426, 1, 0, 0.6666667, 1,
1.233977, -0.8236016, 2.785784, 1, 0, 0.6588235, 1,
1.239709, -1.345973, 2.738351, 1, 0, 0.654902, 1,
1.246076, 1.145267, 0.2271419, 1, 0, 0.6470588, 1,
1.251205, 0.2378635, 2.846398, 1, 0, 0.6431373, 1,
1.252067, 1.292533, 1.727539, 1, 0, 0.6352941, 1,
1.253831, -0.4437097, 2.499269, 1, 0, 0.6313726, 1,
1.255318, -0.1650084, 0.1718179, 1, 0, 0.6235294, 1,
1.256251, 0.7691592, -0.3459073, 1, 0, 0.6196079, 1,
1.261173, 0.03528528, 1.946225, 1, 0, 0.6117647, 1,
1.276336, 1.563059, 0.6054814, 1, 0, 0.6078432, 1,
1.280829, 1.310003, 1.046283, 1, 0, 0.6, 1,
1.282881, -0.7762809, 3.778229, 1, 0, 0.5921569, 1,
1.284207, -0.07682002, 0.2743858, 1, 0, 0.5882353, 1,
1.28638, 0.6209598, 0.4375957, 1, 0, 0.5803922, 1,
1.31, -0.07278089, 2.552862, 1, 0, 0.5764706, 1,
1.310736, -0.8105564, 2.928921, 1, 0, 0.5686275, 1,
1.316511, -0.7927215, 1.358027, 1, 0, 0.5647059, 1,
1.331944, 0.1892363, 0.8588995, 1, 0, 0.5568628, 1,
1.333515, -0.6282463, 0.4457459, 1, 0, 0.5529412, 1,
1.335992, -0.8677369, 1.180572, 1, 0, 0.5450981, 1,
1.342239, 0.02821445, 3.100117, 1, 0, 0.5411765, 1,
1.348186, 1.128835, 1.744798, 1, 0, 0.5333334, 1,
1.349977, 0.6272344, 1.132867, 1, 0, 0.5294118, 1,
1.351189, 0.6938619, 1.483224, 1, 0, 0.5215687, 1,
1.357721, 1.141592, 0.8784488, 1, 0, 0.5176471, 1,
1.36489, 0.7189456, 0.7935556, 1, 0, 0.509804, 1,
1.369394, 0.4771737, 1.209795, 1, 0, 0.5058824, 1,
1.377311, -0.8514281, 4.579944, 1, 0, 0.4980392, 1,
1.382314, -0.3043167, 2.520053, 1, 0, 0.4901961, 1,
1.397237, 0.0475824, 1.316161, 1, 0, 0.4862745, 1,
1.397939, -1.282014, 2.296167, 1, 0, 0.4784314, 1,
1.40322, 1.582147, 0.7554957, 1, 0, 0.4745098, 1,
1.405269, 0.5178174, -5.92356e-06, 1, 0, 0.4666667, 1,
1.40881, -1.117091, 3.382017, 1, 0, 0.4627451, 1,
1.410178, -0.8199931, 1.13114, 1, 0, 0.454902, 1,
1.417142, -1.046089, 3.502569, 1, 0, 0.4509804, 1,
1.418167, -1.395996, 1.282473, 1, 0, 0.4431373, 1,
1.425009, 0.7590087, -0.5808172, 1, 0, 0.4392157, 1,
1.427957, 1.680838, 0.01560566, 1, 0, 0.4313726, 1,
1.435043, 0.6302184, 0.8502489, 1, 0, 0.427451, 1,
1.448413, -1.46964, 2.162398, 1, 0, 0.4196078, 1,
1.451296, -0.8214865, 1.406097, 1, 0, 0.4156863, 1,
1.463767, -0.1727086, 0.467331, 1, 0, 0.4078431, 1,
1.465146, -1.704504, 2.176202, 1, 0, 0.4039216, 1,
1.477654, -0.144678, 3.157783, 1, 0, 0.3960784, 1,
1.480282, 0.0955574, 2.756763, 1, 0, 0.3882353, 1,
1.481427, 0.7275077, 0.9862041, 1, 0, 0.3843137, 1,
1.482538, 0.316299, 3.001122, 1, 0, 0.3764706, 1,
1.485726, -0.1441166, 2.019981, 1, 0, 0.372549, 1,
1.487848, 0.05824769, 1.312339, 1, 0, 0.3647059, 1,
1.492496, -0.3748962, 2.524688, 1, 0, 0.3607843, 1,
1.494142, 0.6741567, 2.898346, 1, 0, 0.3529412, 1,
1.500729, -0.4957848, 0.7062991, 1, 0, 0.3490196, 1,
1.501421, 0.3427469, 0.7664214, 1, 0, 0.3411765, 1,
1.502001, -0.4562221, 3.747222, 1, 0, 0.3372549, 1,
1.540141, -1.270974, 2.279268, 1, 0, 0.3294118, 1,
1.545725, 0.3896526, 2.822639, 1, 0, 0.3254902, 1,
1.546914, 0.5977857, 1.100701, 1, 0, 0.3176471, 1,
1.564471, -0.3133084, 1.32096, 1, 0, 0.3137255, 1,
1.582531, 0.6662887, 1.419144, 1, 0, 0.3058824, 1,
1.588875, -0.5625315, 2.454002, 1, 0, 0.2980392, 1,
1.609416, 1.091453, 0.9102304, 1, 0, 0.2941177, 1,
1.63129, 0.5349271, 1.439873, 1, 0, 0.2862745, 1,
1.672221, 1.550226, 0.9847261, 1, 0, 0.282353, 1,
1.678921, 0.7678999, 0.7838628, 1, 0, 0.2745098, 1,
1.680691, 0.006341899, 2.134042, 1, 0, 0.2705882, 1,
1.683007, 0.5406973, 1.5458, 1, 0, 0.2627451, 1,
1.691168, -0.2043798, 1.343327, 1, 0, 0.2588235, 1,
1.727276, -0.8232621, 3.125657, 1, 0, 0.2509804, 1,
1.755942, 0.2230338, 0.4852736, 1, 0, 0.2470588, 1,
1.788236, 0.8112082, 1.196748, 1, 0, 0.2392157, 1,
1.803816, 0.5196257, 1.720234, 1, 0, 0.2352941, 1,
1.809115, -0.5581828, 2.550511, 1, 0, 0.227451, 1,
1.809154, 0.3611474, 1.01062, 1, 0, 0.2235294, 1,
1.840111, -1.147813, 0.8027648, 1, 0, 0.2156863, 1,
1.884365, -1.810628, 3.527381, 1, 0, 0.2117647, 1,
1.887999, -0.03069511, 1.482947, 1, 0, 0.2039216, 1,
1.894187, 1.141613, -0.2179309, 1, 0, 0.1960784, 1,
1.897825, -0.6227323, 1.687016, 1, 0, 0.1921569, 1,
1.937253, 0.499907, 1.739649, 1, 0, 0.1843137, 1,
1.946316, -0.5459877, 2.845512, 1, 0, 0.1803922, 1,
1.952459, 0.9458237, 3.036644, 1, 0, 0.172549, 1,
1.961828, 1.575759, 0.7992331, 1, 0, 0.1686275, 1,
1.964168, 0.5145515, 1.529743, 1, 0, 0.1607843, 1,
1.999318, -0.5925292, 1.269512, 1, 0, 0.1568628, 1,
2.041852, 0.4205691, 0.4313428, 1, 0, 0.1490196, 1,
2.055998, -0.1127611, 0.1784024, 1, 0, 0.145098, 1,
2.058253, -0.5314071, 1.974748, 1, 0, 0.1372549, 1,
2.059643, 0.7466426, 1.330486, 1, 0, 0.1333333, 1,
2.107672, 0.1805367, 1.450129, 1, 0, 0.1254902, 1,
2.125317, 0.5105612, -0.5145736, 1, 0, 0.1215686, 1,
2.133007, 1.105343, 0.6330988, 1, 0, 0.1137255, 1,
2.141776, 0.1180677, 1.49537, 1, 0, 0.1098039, 1,
2.145428, 0.7612318, 0.9352051, 1, 0, 0.1019608, 1,
2.159057, -0.7188892, 1.0927, 1, 0, 0.09411765, 1,
2.171998, 0.2481549, 1.660156, 1, 0, 0.09019608, 1,
2.198679, -0.9585627, 0.5380757, 1, 0, 0.08235294, 1,
2.201751, 0.7742486, 2.523109, 1, 0, 0.07843138, 1,
2.229436, -1.692296, 3.504448, 1, 0, 0.07058824, 1,
2.239144, -2.091133, 3.435901, 1, 0, 0.06666667, 1,
2.356405, 1.094584, 0.7152193, 1, 0, 0.05882353, 1,
2.539139, -0.2555114, 2.441844, 1, 0, 0.05490196, 1,
2.541765, 1.017534, -0.08851005, 1, 0, 0.04705882, 1,
2.617748, -0.2427932, 1.807062, 1, 0, 0.04313726, 1,
2.723572, -0.7337562, 2.267176, 1, 0, 0.03529412, 1,
2.746812, -0.929713, 1.937844, 1, 0, 0.03137255, 1,
2.924028, 0.6921223, 1.187328, 1, 0, 0.02352941, 1,
3.182471, -0.1380375, 1.054679, 1, 0, 0.01960784, 1,
3.24689, -0.609106, 2.4566, 1, 0, 0.01176471, 1,
3.319382, 0.2563372, 2.686078, 1, 0, 0.007843138, 1
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
0.2292687, -4.239061, -6.900685, 0, -0.5, 0.5, 0.5,
0.2292687, -4.239061, -6.900685, 1, -0.5, 0.5, 0.5,
0.2292687, -4.239061, -6.900685, 1, 1.5, 0.5, 0.5,
0.2292687, -4.239061, -6.900685, 0, 1.5, 0.5, 0.5
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
-3.908394, -0.329542, -6.900685, 0, -0.5, 0.5, 0.5,
-3.908394, -0.329542, -6.900685, 1, -0.5, 0.5, 0.5,
-3.908394, -0.329542, -6.900685, 1, 1.5, 0.5, 0.5,
-3.908394, -0.329542, -6.900685, 0, 1.5, 0.5, 0.5
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
-3.908394, -4.239061, 0.1237137, 0, -0.5, 0.5, 0.5,
-3.908394, -4.239061, 0.1237137, 1, -0.5, 0.5, 0.5,
-3.908394, -4.239061, 0.1237137, 1, 1.5, 0.5, 0.5,
-3.908394, -4.239061, 0.1237137, 0, 1.5, 0.5, 0.5
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
-2, -3.336865, -5.27967,
3, -3.336865, -5.27967,
-2, -3.336865, -5.27967,
-2, -3.487231, -5.549839,
-1, -3.336865, -5.27967,
-1, -3.487231, -5.549839,
0, -3.336865, -5.27967,
0, -3.487231, -5.549839,
1, -3.336865, -5.27967,
1, -3.487231, -5.549839,
2, -3.336865, -5.27967,
2, -3.487231, -5.549839,
3, -3.336865, -5.27967,
3, -3.487231, -5.549839
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
-2, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
-2, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
-2, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
-2, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5,
-1, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
-1, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
-1, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
-1, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5,
0, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
0, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
0, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
0, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5,
1, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
1, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
1, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
1, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5,
2, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
2, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
2, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
2, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5,
3, -3.787963, -6.090177, 0, -0.5, 0.5, 0.5,
3, -3.787963, -6.090177, 1, -0.5, 0.5, 0.5,
3, -3.787963, -6.090177, 1, 1.5, 0.5, 0.5,
3, -3.787963, -6.090177, 0, 1.5, 0.5, 0.5
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
-2.953548, -3, -5.27967,
-2.953548, 2, -5.27967,
-2.953548, -3, -5.27967,
-3.112689, -3, -5.549839,
-2.953548, -2, -5.27967,
-3.112689, -2, -5.549839,
-2.953548, -1, -5.27967,
-3.112689, -1, -5.549839,
-2.953548, 0, -5.27967,
-3.112689, 0, -5.549839,
-2.953548, 1, -5.27967,
-3.112689, 1, -5.549839,
-2.953548, 2, -5.27967,
-3.112689, 2, -5.549839
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
-3.430971, -3, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, -3, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, -3, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, -3, -6.090177, 0, 1.5, 0.5, 0.5,
-3.430971, -2, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, -2, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, -2, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, -2, -6.090177, 0, 1.5, 0.5, 0.5,
-3.430971, -1, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, -1, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, -1, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, -1, -6.090177, 0, 1.5, 0.5, 0.5,
-3.430971, 0, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, 0, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, 0, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, 0, -6.090177, 0, 1.5, 0.5, 0.5,
-3.430971, 1, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, 1, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, 1, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, 1, -6.090177, 0, 1.5, 0.5, 0.5,
-3.430971, 2, -6.090177, 0, -0.5, 0.5, 0.5,
-3.430971, 2, -6.090177, 1, -0.5, 0.5, 0.5,
-3.430971, 2, -6.090177, 1, 1.5, 0.5, 0.5,
-3.430971, 2, -6.090177, 0, 1.5, 0.5, 0.5
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
-2.953548, -3.336865, -4,
-2.953548, -3.336865, 4,
-2.953548, -3.336865, -4,
-3.112689, -3.487231, -4,
-2.953548, -3.336865, -2,
-3.112689, -3.487231, -2,
-2.953548, -3.336865, 0,
-3.112689, -3.487231, 0,
-2.953548, -3.336865, 2,
-3.112689, -3.487231, 2,
-2.953548, -3.336865, 4,
-3.112689, -3.487231, 4
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
-3.430971, -3.787963, -4, 0, -0.5, 0.5, 0.5,
-3.430971, -3.787963, -4, 1, -0.5, 0.5, 0.5,
-3.430971, -3.787963, -4, 1, 1.5, 0.5, 0.5,
-3.430971, -3.787963, -4, 0, 1.5, 0.5, 0.5,
-3.430971, -3.787963, -2, 0, -0.5, 0.5, 0.5,
-3.430971, -3.787963, -2, 1, -0.5, 0.5, 0.5,
-3.430971, -3.787963, -2, 1, 1.5, 0.5, 0.5,
-3.430971, -3.787963, -2, 0, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 0, 0, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 0, 1, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 0, 1, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 0, 0, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 2, 0, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 2, 1, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 2, 1, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 2, 0, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 4, 0, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 4, 1, -0.5, 0.5, 0.5,
-3.430971, -3.787963, 4, 1, 1.5, 0.5, 0.5,
-3.430971, -3.787963, 4, 0, 1.5, 0.5, 0.5
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
-2.953548, -3.336865, -5.27967,
-2.953548, 2.677781, -5.27967,
-2.953548, -3.336865, 5.527097,
-2.953548, 2.677781, 5.527097,
-2.953548, -3.336865, -5.27967,
-2.953548, -3.336865, 5.527097,
-2.953548, 2.677781, -5.27967,
-2.953548, 2.677781, 5.527097,
-2.953548, -3.336865, -5.27967,
3.412086, -3.336865, -5.27967,
-2.953548, -3.336865, 5.527097,
3.412086, -3.336865, 5.527097,
-2.953548, 2.677781, -5.27967,
3.412086, 2.677781, -5.27967,
-2.953548, 2.677781, 5.527097,
3.412086, 2.677781, 5.527097,
3.412086, -3.336865, -5.27967,
3.412086, 2.677781, -5.27967,
3.412086, -3.336865, 5.527097,
3.412086, 2.677781, 5.527097,
3.412086, -3.336865, -5.27967,
3.412086, -3.336865, 5.527097,
3.412086, 2.677781, -5.27967,
3.412086, 2.677781, 5.527097
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
var radius = 7.427581;
var distance = 33.04615;
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
mvMatrix.translate( -0.2292687, 0.329542, -0.1237137 );
mvMatrix.scale( 1.261594, 1.335215, 0.7431312 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.04615);
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


