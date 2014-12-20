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
-3.358632, -2.014013, -3.384384, 1, 0, 0, 1,
-3.029475, 0.2430043, -1.290059, 1, 0.007843138, 0, 1,
-2.919343, 0.3610204, -1.330203, 1, 0.01176471, 0, 1,
-2.680823, -0.7605009, -1.47222, 1, 0.01960784, 0, 1,
-2.678415, 1.378991, -0.6349034, 1, 0.02352941, 0, 1,
-2.636169, 0.6742718, -0.4889304, 1, 0.03137255, 0, 1,
-2.493713, 0.5300677, -1.617507, 1, 0.03529412, 0, 1,
-2.483408, -3.631363, -2.000937, 1, 0.04313726, 0, 1,
-2.448046, -0.4678563, -3.030385, 1, 0.04705882, 0, 1,
-2.437475, 0.3241351, -0.9815504, 1, 0.05490196, 0, 1,
-2.409797, -0.5231925, -0.5024273, 1, 0.05882353, 0, 1,
-2.405663, -0.4355082, -1.041204, 1, 0.06666667, 0, 1,
-2.398691, -1.100052, 0.547856, 1, 0.07058824, 0, 1,
-2.3676, 0.02385582, -2.89093, 1, 0.07843138, 0, 1,
-2.299906, 0.2890661, 1.138829, 1, 0.08235294, 0, 1,
-2.265884, 1.238416, -2.548027, 1, 0.09019608, 0, 1,
-2.252066, 1.838788, -1.71728, 1, 0.09411765, 0, 1,
-2.158364, 0.3599496, -1.538164, 1, 0.1019608, 0, 1,
-2.142359, -1.245485, -2.50292, 1, 0.1098039, 0, 1,
-2.115065, 0.1347676, -2.512752, 1, 0.1137255, 0, 1,
-2.085101, 1.608268, -0.9932222, 1, 0.1215686, 0, 1,
-2.058787, 1.872433, -2.511818, 1, 0.1254902, 0, 1,
-2.025074, 0.9703618, -1.29076, 1, 0.1333333, 0, 1,
-2.021135, -1.523707, -3.869147, 1, 0.1372549, 0, 1,
-1.996061, -0.6589723, -1.892035, 1, 0.145098, 0, 1,
-1.960383, -0.3094592, -1.69387, 1, 0.1490196, 0, 1,
-1.957403, -0.8517748, -3.57652, 1, 0.1568628, 0, 1,
-1.950188, -1.414547, -2.842943, 1, 0.1607843, 0, 1,
-1.932616, -1.105693, -2.906824, 1, 0.1686275, 0, 1,
-1.924168, -0.8041002, -0.7878187, 1, 0.172549, 0, 1,
-1.915335, 0.5100605, -1.371764, 1, 0.1803922, 0, 1,
-1.874357, 1.051385, -1.346589, 1, 0.1843137, 0, 1,
-1.873181, 1.028502, -2.385231, 1, 0.1921569, 0, 1,
-1.820616, 0.6830983, -0.7470905, 1, 0.1960784, 0, 1,
-1.814232, 0.5933817, -1.355521, 1, 0.2039216, 0, 1,
-1.812653, 0.1466547, 1.059922, 1, 0.2117647, 0, 1,
-1.812426, 0.6934012, 0.6167991, 1, 0.2156863, 0, 1,
-1.785576, 0.4130963, 0.1347061, 1, 0.2235294, 0, 1,
-1.781715, -1.321553, -3.640857, 1, 0.227451, 0, 1,
-1.773197, 0.2032017, -2.487959, 1, 0.2352941, 0, 1,
-1.768484, -2.087004, -0.6447099, 1, 0.2392157, 0, 1,
-1.762533, 0.03658371, -0.8100194, 1, 0.2470588, 0, 1,
-1.761566, 0.3024944, -0.5251889, 1, 0.2509804, 0, 1,
-1.756988, 0.01333541, -2.018616, 1, 0.2588235, 0, 1,
-1.750483, -1.83298, -2.425047, 1, 0.2627451, 0, 1,
-1.748554, 0.07424383, -2.159682, 1, 0.2705882, 0, 1,
-1.716897, -1.125043, -0.636728, 1, 0.2745098, 0, 1,
-1.712927, -0.1181165, -0.5827263, 1, 0.282353, 0, 1,
-1.705924, 0.5839853, -1.899243, 1, 0.2862745, 0, 1,
-1.705076, -0.2097095, -1.257522, 1, 0.2941177, 0, 1,
-1.691295, 0.07593548, -1.29916, 1, 0.3019608, 0, 1,
-1.682394, 0.7434877, -1.36878, 1, 0.3058824, 0, 1,
-1.681534, -0.1821551, -2.145632, 1, 0.3137255, 0, 1,
-1.680875, -0.1092439, -2.056129, 1, 0.3176471, 0, 1,
-1.67896, 0.4516291, -2.716196, 1, 0.3254902, 0, 1,
-1.665879, 0.9505573, -0.6251339, 1, 0.3294118, 0, 1,
-1.659, -0.8104909, -3.409677, 1, 0.3372549, 0, 1,
-1.650197, -0.02314895, -0.2220801, 1, 0.3411765, 0, 1,
-1.645962, 1.697701, -0.1684695, 1, 0.3490196, 0, 1,
-1.639526, -1.148152, -2.381345, 1, 0.3529412, 0, 1,
-1.63835, 0.1923324, -1.875604, 1, 0.3607843, 0, 1,
-1.633735, -1.179117, -3.167992, 1, 0.3647059, 0, 1,
-1.623628, 0.2167212, -1.161806, 1, 0.372549, 0, 1,
-1.619662, 0.5237149, -1.703516, 1, 0.3764706, 0, 1,
-1.6188, 0.5421166, -0.9939916, 1, 0.3843137, 0, 1,
-1.614089, 0.5696086, -0.9880141, 1, 0.3882353, 0, 1,
-1.613172, 1.536852, -0.771198, 1, 0.3960784, 0, 1,
-1.60017, 0.6556724, -1.642386, 1, 0.4039216, 0, 1,
-1.587975, -1.34029, -0.919188, 1, 0.4078431, 0, 1,
-1.567902, 0.05967336, -2.286448, 1, 0.4156863, 0, 1,
-1.567042, 0.1998289, -2.763924, 1, 0.4196078, 0, 1,
-1.552168, -0.1759265, -1.338129, 1, 0.427451, 0, 1,
-1.551327, 1.073577, -1.676684, 1, 0.4313726, 0, 1,
-1.549585, 0.1145597, -1.453352, 1, 0.4392157, 0, 1,
-1.54763, 0.658114, -1.818723, 1, 0.4431373, 0, 1,
-1.537731, 0.2749289, -0.8158566, 1, 0.4509804, 0, 1,
-1.535246, -0.03490874, -1.784615, 1, 0.454902, 0, 1,
-1.532905, 1.181071, -0.8384827, 1, 0.4627451, 0, 1,
-1.529881, 0.3973387, 1.278613, 1, 0.4666667, 0, 1,
-1.529731, -0.8959433, -1.288592, 1, 0.4745098, 0, 1,
-1.520416, 0.3132204, -1.7459, 1, 0.4784314, 0, 1,
-1.515881, 0.8866289, -2.540604, 1, 0.4862745, 0, 1,
-1.513778, -0.7452964, -2.368006, 1, 0.4901961, 0, 1,
-1.511961, 0.6871868, -0.8239766, 1, 0.4980392, 0, 1,
-1.50524, 0.4712048, -2.16432, 1, 0.5058824, 0, 1,
-1.504367, 0.1618836, -1.106446, 1, 0.509804, 0, 1,
-1.502964, 0.542179, 0.2922136, 1, 0.5176471, 0, 1,
-1.481738, -0.9837933, -3.328327, 1, 0.5215687, 0, 1,
-1.470985, 0.912451, -3.032963, 1, 0.5294118, 0, 1,
-1.461589, 0.1909477, -4.130674, 1, 0.5333334, 0, 1,
-1.458396, 0.6940402, 0.798569, 1, 0.5411765, 0, 1,
-1.458052, 0.5267211, -0.1018286, 1, 0.5450981, 0, 1,
-1.455275, 0.249447, -2.246214, 1, 0.5529412, 0, 1,
-1.452516, 1.250391, -0.05558846, 1, 0.5568628, 0, 1,
-1.445041, 0.2141258, -1.475135, 1, 0.5647059, 0, 1,
-1.44057, -1.585468, -1.223822, 1, 0.5686275, 0, 1,
-1.435864, -0.6048703, -2.483657, 1, 0.5764706, 0, 1,
-1.435425, -1.77503, -3.511944, 1, 0.5803922, 0, 1,
-1.426311, -1.219745, -1.898288, 1, 0.5882353, 0, 1,
-1.425764, 0.5655493, -1.809135, 1, 0.5921569, 0, 1,
-1.416684, -1.263271, -1.762008, 1, 0.6, 0, 1,
-1.414898, 1.958145, -0.5924646, 1, 0.6078432, 0, 1,
-1.414534, 0.04124318, -0.3608744, 1, 0.6117647, 0, 1,
-1.413208, -1.123335, -2.960606, 1, 0.6196079, 0, 1,
-1.408929, -0.1370338, -1.801515, 1, 0.6235294, 0, 1,
-1.403615, 1.077333, -1.192861, 1, 0.6313726, 0, 1,
-1.399105, 1.795624, -2.126489, 1, 0.6352941, 0, 1,
-1.395325, -0.7599837, -2.20052, 1, 0.6431373, 0, 1,
-1.395302, -0.6173017, -1.878988, 1, 0.6470588, 0, 1,
-1.375081, 0.97148, -2.452168, 1, 0.654902, 0, 1,
-1.374197, 0.1668176, -1.417392, 1, 0.6588235, 0, 1,
-1.368267, -0.4680349, -1.034769, 1, 0.6666667, 0, 1,
-1.363742, -1.100125, -0.0243359, 1, 0.6705883, 0, 1,
-1.361578, -1.671538, -2.219126, 1, 0.6784314, 0, 1,
-1.353899, 0.9468501, -0.2780503, 1, 0.682353, 0, 1,
-1.345969, -1.266881, -0.5694461, 1, 0.6901961, 0, 1,
-1.339673, -0.9094963, -3.838206, 1, 0.6941177, 0, 1,
-1.334148, -1.08483, -2.940728, 1, 0.7019608, 0, 1,
-1.333964, -0.2395946, -1.205416, 1, 0.7098039, 0, 1,
-1.326708, -1.508895, -1.874673, 1, 0.7137255, 0, 1,
-1.321586, 0.04698931, -2.651564, 1, 0.7215686, 0, 1,
-1.320254, -0.5935007, -1.870896, 1, 0.7254902, 0, 1,
-1.3167, -0.1108765, -2.037552, 1, 0.7333333, 0, 1,
-1.312667, 0.416816, -1.101938, 1, 0.7372549, 0, 1,
-1.310205, -0.1672927, -0.9388527, 1, 0.7450981, 0, 1,
-1.30383, 1.35474, -1.12656, 1, 0.7490196, 0, 1,
-1.290505, 1.325101, -0.1187148, 1, 0.7568628, 0, 1,
-1.272103, -0.4994222, -0.7111149, 1, 0.7607843, 0, 1,
-1.269673, -0.4867163, -1.820029, 1, 0.7686275, 0, 1,
-1.266724, -1.20415, -2.822371, 1, 0.772549, 0, 1,
-1.26156, 0.6101236, -2.240822, 1, 0.7803922, 0, 1,
-1.255509, 0.7924919, -1.048768, 1, 0.7843137, 0, 1,
-1.25339, 0.2388892, -0.863131, 1, 0.7921569, 0, 1,
-1.252052, 0.02720622, -3.279353, 1, 0.7960784, 0, 1,
-1.248687, -1.182533, -3.49298, 1, 0.8039216, 0, 1,
-1.246564, -0.2816883, -1.790058, 1, 0.8117647, 0, 1,
-1.243585, -0.1606394, -3.32571, 1, 0.8156863, 0, 1,
-1.229134, 0.007514059, -1.15108, 1, 0.8235294, 0, 1,
-1.228905, -0.02746726, -1.803862, 1, 0.827451, 0, 1,
-1.222622, 1.223805, -0.7313713, 1, 0.8352941, 0, 1,
-1.220163, -1.571291, -3.338901, 1, 0.8392157, 0, 1,
-1.213702, -0.0142008, -1.762775, 1, 0.8470588, 0, 1,
-1.204783, 1.350163, -0.4510611, 1, 0.8509804, 0, 1,
-1.199097, 0.06095076, -1.928002, 1, 0.8588235, 0, 1,
-1.186661, -1.007081, -0.560595, 1, 0.8627451, 0, 1,
-1.186415, -1.149192, -2.695215, 1, 0.8705882, 0, 1,
-1.177192, -0.5639611, -0.4163726, 1, 0.8745098, 0, 1,
-1.171572, -1.839347, -2.877343, 1, 0.8823529, 0, 1,
-1.16876, 2.02238, 0.8680267, 1, 0.8862745, 0, 1,
-1.159853, 0.3533226, -0.9872477, 1, 0.8941177, 0, 1,
-1.156621, -0.5989635, -1.317784, 1, 0.8980392, 0, 1,
-1.147375, -0.02954665, -0.9197831, 1, 0.9058824, 0, 1,
-1.145338, 2.574167, 0.550847, 1, 0.9137255, 0, 1,
-1.144771, 0.0346032, -2.424407, 1, 0.9176471, 0, 1,
-1.109899, 0.2933584, -3.05641, 1, 0.9254902, 0, 1,
-1.103144, 0.3524458, -1.630752, 1, 0.9294118, 0, 1,
-1.102994, 0.825976, -0.5544194, 1, 0.9372549, 0, 1,
-1.102739, -0.3372061, -0.6930853, 1, 0.9411765, 0, 1,
-1.098884, 0.6995348, -0.4732345, 1, 0.9490196, 0, 1,
-1.092927, -0.3659108, -1.533866, 1, 0.9529412, 0, 1,
-1.092253, 1.18927, -1.566864, 1, 0.9607843, 0, 1,
-1.086315, 0.2176437, -0.9329205, 1, 0.9647059, 0, 1,
-1.08585, -0.1404057, -1.87229, 1, 0.972549, 0, 1,
-1.070096, -0.01719909, -0.02671505, 1, 0.9764706, 0, 1,
-1.067443, 0.4033729, -1.459426, 1, 0.9843137, 0, 1,
-1.062791, 0.2382386, -1.660202, 1, 0.9882353, 0, 1,
-1.061594, 1.077156, 1.165495, 1, 0.9960784, 0, 1,
-1.059212, -0.05139975, -2.849264, 0.9960784, 1, 0, 1,
-1.048726, 1.570961, -1.024705, 0.9921569, 1, 0, 1,
-1.045708, -1.892544, -2.101029, 0.9843137, 1, 0, 1,
-1.045216, 1.21985, -1.465334, 0.9803922, 1, 0, 1,
-1.039657, -0.7274175, -2.041786, 0.972549, 1, 0, 1,
-1.039631, -0.3725662, -3.454068, 0.9686275, 1, 0, 1,
-1.036809, 0.5345433, -1.826702, 0.9607843, 1, 0, 1,
-1.032024, -1.772661, -3.67459, 0.9568627, 1, 0, 1,
-1.025429, 1.886017, -0.8026048, 0.9490196, 1, 0, 1,
-1.02464, -1.567815, -2.487092, 0.945098, 1, 0, 1,
-1.022637, -1.729747, -3.460591, 0.9372549, 1, 0, 1,
-1.020154, -1.830132, -1.556821, 0.9333333, 1, 0, 1,
-1.017531, 0.8206508, -1.227678, 0.9254902, 1, 0, 1,
-1.00756, -0.06238599, -0.8426204, 0.9215686, 1, 0, 1,
-1.001649, -1.002637, -2.874524, 0.9137255, 1, 0, 1,
-0.9948288, -1.048422, -3.822906, 0.9098039, 1, 0, 1,
-0.9942217, 0.07316005, -0.6466379, 0.9019608, 1, 0, 1,
-0.9941958, -0.692807, -2.492312, 0.8941177, 1, 0, 1,
-0.992639, 0.6691859, -2.186435, 0.8901961, 1, 0, 1,
-0.9819205, 0.6536296, -1.605693, 0.8823529, 1, 0, 1,
-0.9756017, 1.520294, 0.386242, 0.8784314, 1, 0, 1,
-0.9747905, 0.4687258, -0.6779538, 0.8705882, 1, 0, 1,
-0.9666452, -0.7364173, -1.878272, 0.8666667, 1, 0, 1,
-0.9629056, 0.636034, -0.509521, 0.8588235, 1, 0, 1,
-0.9516668, -1.784035, -1.524256, 0.854902, 1, 0, 1,
-0.9500805, 0.5198162, -0.7934454, 0.8470588, 1, 0, 1,
-0.9492114, 0.6043622, -2.946896, 0.8431373, 1, 0, 1,
-0.9457564, 0.4355167, -1.473035, 0.8352941, 1, 0, 1,
-0.9407625, 0.6340883, 0.8500665, 0.8313726, 1, 0, 1,
-0.9406221, -0.3971415, -1.430023, 0.8235294, 1, 0, 1,
-0.9399549, 0.2680362, -1.387725, 0.8196079, 1, 0, 1,
-0.9388334, 1.752761, 0.320761, 0.8117647, 1, 0, 1,
-0.9385659, -1.790395, -0.8121977, 0.8078431, 1, 0, 1,
-0.9289337, -1.690678, -2.737762, 0.8, 1, 0, 1,
-0.9276518, -1.125316, -1.061608, 0.7921569, 1, 0, 1,
-0.9227102, 0.9488614, -1.914695, 0.7882353, 1, 0, 1,
-0.9212369, 0.4905168, 0.6298658, 0.7803922, 1, 0, 1,
-0.9183716, 0.5681134, -0.8201338, 0.7764706, 1, 0, 1,
-0.9171218, -0.2539247, -1.685588, 0.7686275, 1, 0, 1,
-0.9171079, -1.418968, -2.876346, 0.7647059, 1, 0, 1,
-0.9134535, -0.05119886, -1.521549, 0.7568628, 1, 0, 1,
-0.9128107, -0.9196528, -1.939726, 0.7529412, 1, 0, 1,
-0.9124839, -1.033818, -2.354642, 0.7450981, 1, 0, 1,
-0.9066715, 0.4134354, -0.3697397, 0.7411765, 1, 0, 1,
-0.9027135, -0.3145417, -2.326722, 0.7333333, 1, 0, 1,
-0.9023818, 0.4682099, -0.2510773, 0.7294118, 1, 0, 1,
-0.8967854, 0.7758287, -0.4602529, 0.7215686, 1, 0, 1,
-0.8951568, 0.04284323, -2.788279, 0.7176471, 1, 0, 1,
-0.8919543, 0.344568, -1.750733, 0.7098039, 1, 0, 1,
-0.8835036, 0.6248007, -1.597489, 0.7058824, 1, 0, 1,
-0.8821058, -0.1477416, -1.196439, 0.6980392, 1, 0, 1,
-0.881811, -0.6709614, -3.242028, 0.6901961, 1, 0, 1,
-0.8813983, -0.1490573, -1.688503, 0.6862745, 1, 0, 1,
-0.8795109, 2.408012, -0.1967401, 0.6784314, 1, 0, 1,
-0.8672957, 0.4707898, -2.003356, 0.6745098, 1, 0, 1,
-0.862557, 0.07688212, -1.648228, 0.6666667, 1, 0, 1,
-0.8562734, 0.7260149, -0.8094543, 0.6627451, 1, 0, 1,
-0.8471133, -0.682009, -3.046665, 0.654902, 1, 0, 1,
-0.8436021, 0.7509112, -1.351507, 0.6509804, 1, 0, 1,
-0.8407874, -1.40369, -2.713964, 0.6431373, 1, 0, 1,
-0.8390326, 0.201951, -0.2239037, 0.6392157, 1, 0, 1,
-0.8297355, -1.098849, -2.355824, 0.6313726, 1, 0, 1,
-0.8194272, 0.3562653, -0.2802395, 0.627451, 1, 0, 1,
-0.8176078, 1.62257, -1.00414, 0.6196079, 1, 0, 1,
-0.8145322, 0.5424002, -2.403834, 0.6156863, 1, 0, 1,
-0.8142508, -1.003307, -3.11118, 0.6078432, 1, 0, 1,
-0.8132257, 1.254709, 1.095262, 0.6039216, 1, 0, 1,
-0.8108694, -1.999596, -1.900317, 0.5960785, 1, 0, 1,
-0.81034, 1.826771, -1.384654, 0.5882353, 1, 0, 1,
-0.8048678, 0.8592538, -1.921155, 0.5843138, 1, 0, 1,
-0.7994115, 0.8546816, -1.860498, 0.5764706, 1, 0, 1,
-0.7973126, -0.9882365, -3.437154, 0.572549, 1, 0, 1,
-0.7957444, -0.3637971, -2.29589, 0.5647059, 1, 0, 1,
-0.795327, -1.98304, -4.141657, 0.5607843, 1, 0, 1,
-0.7889082, 1.362984, -1.235886, 0.5529412, 1, 0, 1,
-0.7855469, 0.6733548, 1.787386, 0.5490196, 1, 0, 1,
-0.7792454, 0.3287039, -1.759093, 0.5411765, 1, 0, 1,
-0.7699221, -0.1584747, -1.954756, 0.5372549, 1, 0, 1,
-0.7523515, -1.311076, -1.900813, 0.5294118, 1, 0, 1,
-0.7419815, -2.506787, -1.827751, 0.5254902, 1, 0, 1,
-0.7398158, 1.441712, 1.302055, 0.5176471, 1, 0, 1,
-0.733359, -1.166137, -2.59816, 0.5137255, 1, 0, 1,
-0.7256338, 1.365909, -0.4123094, 0.5058824, 1, 0, 1,
-0.7254039, -1.398051, -2.199537, 0.5019608, 1, 0, 1,
-0.7211537, -0.9467641, -1.034108, 0.4941176, 1, 0, 1,
-0.7191851, -0.7145641, -2.059111, 0.4862745, 1, 0, 1,
-0.7188456, 0.2008593, -1.982345, 0.4823529, 1, 0, 1,
-0.7183357, -0.8363221, -1.716777, 0.4745098, 1, 0, 1,
-0.7159417, 0.8904244, -1.364252, 0.4705882, 1, 0, 1,
-0.7135387, 0.505941, -0.327506, 0.4627451, 1, 0, 1,
-0.71353, -1.824777, -1.910783, 0.4588235, 1, 0, 1,
-0.7131868, 0.7308558, 0.6157539, 0.4509804, 1, 0, 1,
-0.7085894, 0.2547312, -2.779544, 0.4470588, 1, 0, 1,
-0.7083757, -0.5039064, -2.383439, 0.4392157, 1, 0, 1,
-0.7082586, 0.8059756, -0.3488619, 0.4352941, 1, 0, 1,
-0.7019012, 0.8079876, 0.2507679, 0.427451, 1, 0, 1,
-0.6992427, 1.194063, -0.007762497, 0.4235294, 1, 0, 1,
-0.6908914, 0.1293433, -2.504946, 0.4156863, 1, 0, 1,
-0.6885648, 0.7226527, -1.733589, 0.4117647, 1, 0, 1,
-0.6823214, -0.003593069, -1.386961, 0.4039216, 1, 0, 1,
-0.6813232, -0.7510881, -3.624712, 0.3960784, 1, 0, 1,
-0.675388, 1.089568, -1.607966, 0.3921569, 1, 0, 1,
-0.6742448, 0.1025625, -0.7009169, 0.3843137, 1, 0, 1,
-0.6693712, -0.4699192, -0.9206136, 0.3803922, 1, 0, 1,
-0.6624927, -0.7515233, -2.343392, 0.372549, 1, 0, 1,
-0.6480901, 0.08979927, -0.4079967, 0.3686275, 1, 0, 1,
-0.6455569, 1.060759, -0.838342, 0.3607843, 1, 0, 1,
-0.6436278, 0.03340488, -2.181385, 0.3568628, 1, 0, 1,
-0.6410967, -0.3733398, -0.9293787, 0.3490196, 1, 0, 1,
-0.6350214, -0.5914702, -2.059437, 0.345098, 1, 0, 1,
-0.6208358, 0.6983165, -0.4579229, 0.3372549, 1, 0, 1,
-0.6206264, -1.05513, -3.416128, 0.3333333, 1, 0, 1,
-0.6176025, 0.2481744, -1.729092, 0.3254902, 1, 0, 1,
-0.6161718, 0.8967782, -0.2197085, 0.3215686, 1, 0, 1,
-0.6084012, -0.2095281, -3.556666, 0.3137255, 1, 0, 1,
-0.6068133, 0.9245269, -0.2880989, 0.3098039, 1, 0, 1,
-0.6053429, -1.191785, -1.223659, 0.3019608, 1, 0, 1,
-0.6045366, 0.6886146, 0.5503855, 0.2941177, 1, 0, 1,
-0.6033435, -0.6297445, -3.746503, 0.2901961, 1, 0, 1,
-0.5987018, 0.9127278, -0.3343015, 0.282353, 1, 0, 1,
-0.5949587, -0.03481205, -1.285581, 0.2784314, 1, 0, 1,
-0.5909944, 1.749328, 0.1491569, 0.2705882, 1, 0, 1,
-0.5883541, 0.3163564, -0.2397534, 0.2666667, 1, 0, 1,
-0.5831235, -0.2487021, -3.238628, 0.2588235, 1, 0, 1,
-0.576232, -1.022521, -2.943497, 0.254902, 1, 0, 1,
-0.5761991, -0.4863842, -3.607307, 0.2470588, 1, 0, 1,
-0.5711389, 0.1381237, -2.582554, 0.2431373, 1, 0, 1,
-0.5702637, -0.4923564, -2.323507, 0.2352941, 1, 0, 1,
-0.5598668, 0.9927425, -0.7804552, 0.2313726, 1, 0, 1,
-0.5567102, -1.524936, -4.845906, 0.2235294, 1, 0, 1,
-0.5555688, 0.804526, -0.5604878, 0.2196078, 1, 0, 1,
-0.5533029, -0.09614511, -0.2710659, 0.2117647, 1, 0, 1,
-0.5484833, -0.5566332, -1.658062, 0.2078431, 1, 0, 1,
-0.5463593, -2.238557, -2.951288, 0.2, 1, 0, 1,
-0.546226, 0.4724544, -1.415942, 0.1921569, 1, 0, 1,
-0.5445547, -0.5470029, -4.317468, 0.1882353, 1, 0, 1,
-0.5423059, 0.5539575, -1.444806, 0.1803922, 1, 0, 1,
-0.5405055, 0.2735936, -0.1374274, 0.1764706, 1, 0, 1,
-0.5374444, 1.364226, -1.102109, 0.1686275, 1, 0, 1,
-0.5360309, 0.04499739, 0.4076748, 0.1647059, 1, 0, 1,
-0.5341629, -0.482437, -2.543086, 0.1568628, 1, 0, 1,
-0.5313681, 0.3267772, -1.994198, 0.1529412, 1, 0, 1,
-0.5267264, 0.315015, -1.584676, 0.145098, 1, 0, 1,
-0.5256447, 0.444191, 0.5251824, 0.1411765, 1, 0, 1,
-0.5254026, 0.8707605, 0.05248728, 0.1333333, 1, 0, 1,
-0.5214108, -1.045648, -2.811272, 0.1294118, 1, 0, 1,
-0.5139606, -0.3356995, -2.163523, 0.1215686, 1, 0, 1,
-0.5130078, 0.7194723, -1.720196, 0.1176471, 1, 0, 1,
-0.5117407, 0.5981002, -0.603465, 0.1098039, 1, 0, 1,
-0.5020031, 0.02297945, -1.219934, 0.1058824, 1, 0, 1,
-0.5008973, -1.098476, -3.404501, 0.09803922, 1, 0, 1,
-0.4928994, -0.6911973, -2.122607, 0.09019608, 1, 0, 1,
-0.4903257, 0.08213938, -2.467611, 0.08627451, 1, 0, 1,
-0.487434, 0.1923378, -3.826115, 0.07843138, 1, 0, 1,
-0.4847647, -1.246656, -3.813222, 0.07450981, 1, 0, 1,
-0.4825481, 1.07968, -1.689073, 0.06666667, 1, 0, 1,
-0.47981, 0.2439203, 0.8956168, 0.0627451, 1, 0, 1,
-0.4742772, -1.878462, -3.121873, 0.05490196, 1, 0, 1,
-0.4728789, 0.8598852, -1.27205, 0.05098039, 1, 0, 1,
-0.4692659, 0.8288689, -0.3204042, 0.04313726, 1, 0, 1,
-0.4670453, -0.8949794, -3.395976, 0.03921569, 1, 0, 1,
-0.4642652, 2.473096, -0.6553515, 0.03137255, 1, 0, 1,
-0.462155, -0.1993864, -1.564054, 0.02745098, 1, 0, 1,
-0.4606048, -0.8636428, -4.544197, 0.01960784, 1, 0, 1,
-0.4599576, -0.7606114, -0.5942404, 0.01568628, 1, 0, 1,
-0.4595168, 0.02022586, 0.1817976, 0.007843138, 1, 0, 1,
-0.4553672, 0.7622821, -0.442793, 0.003921569, 1, 0, 1,
-0.4539371, 1.414973, -0.5237447, 0, 1, 0.003921569, 1,
-0.4522256, -0.3584603, -1.550894, 0, 1, 0.01176471, 1,
-0.4485713, 2.008661, -0.08983248, 0, 1, 0.01568628, 1,
-0.438758, 0.5181258, -2.111162, 0, 1, 0.02352941, 1,
-0.4324674, 2.029016, 0.9374163, 0, 1, 0.02745098, 1,
-0.431832, 0.6565903, -0.6257144, 0, 1, 0.03529412, 1,
-0.4314432, -1.020056, -3.066894, 0, 1, 0.03921569, 1,
-0.4307681, 0.6627485, -0.8297758, 0, 1, 0.04705882, 1,
-0.4294309, -2.037401, -3.479156, 0, 1, 0.05098039, 1,
-0.4294284, 2.717891, 1.533656, 0, 1, 0.05882353, 1,
-0.4276018, -2.870324, -2.533284, 0, 1, 0.0627451, 1,
-0.4237827, 0.3696914, -0.8532353, 0, 1, 0.07058824, 1,
-0.4170818, -0.515532, -3.470961, 0, 1, 0.07450981, 1,
-0.416993, 1.015194, -1.088755, 0, 1, 0.08235294, 1,
-0.4162313, 0.12533, -1.55131, 0, 1, 0.08627451, 1,
-0.4159359, 0.0594654, -3.110543, 0, 1, 0.09411765, 1,
-0.4146387, 0.2420931, -0.4353647, 0, 1, 0.1019608, 1,
-0.4134938, -0.6542059, -3.499669, 0, 1, 0.1058824, 1,
-0.4129757, 1.629135, -0.5477799, 0, 1, 0.1137255, 1,
-0.4060521, 0.2307382, -2.699153, 0, 1, 0.1176471, 1,
-0.40534, -0.5856358, -1.819512, 0, 1, 0.1254902, 1,
-0.4040905, 1.731099, -0.945543, 0, 1, 0.1294118, 1,
-0.4018485, 0.5593053, -0.2132464, 0, 1, 0.1372549, 1,
-0.4006997, 0.900072, 1.084732, 0, 1, 0.1411765, 1,
-0.3990978, 0.1061779, -2.11173, 0, 1, 0.1490196, 1,
-0.395081, 0.3001835, -1.903242, 0, 1, 0.1529412, 1,
-0.392688, -1.211694, -2.910024, 0, 1, 0.1607843, 1,
-0.3910305, -0.65495, -3.085761, 0, 1, 0.1647059, 1,
-0.3874037, 0.6834584, -0.4707304, 0, 1, 0.172549, 1,
-0.3812762, -0.8860722, -3.576872, 0, 1, 0.1764706, 1,
-0.3812247, 0.952409, -0.4807527, 0, 1, 0.1843137, 1,
-0.3782264, 0.7819582, -1.720194, 0, 1, 0.1882353, 1,
-0.3767155, -0.6651989, -3.117576, 0, 1, 0.1960784, 1,
-0.3765408, -0.9012107, -3.27875, 0, 1, 0.2039216, 1,
-0.3667215, -1.688082, -2.973083, 0, 1, 0.2078431, 1,
-0.3621786, 0.6020741, -1.507542, 0, 1, 0.2156863, 1,
-0.3578075, 0.5969831, -0.0872713, 0, 1, 0.2196078, 1,
-0.3542646, 0.3323711, 0.5206828, 0, 1, 0.227451, 1,
-0.3531478, 0.7064552, 0.3647773, 0, 1, 0.2313726, 1,
-0.3503333, 0.6522892, -0.3695221, 0, 1, 0.2392157, 1,
-0.3469956, 0.2069799, -0.5610735, 0, 1, 0.2431373, 1,
-0.3396643, 0.9568102, 0.6424699, 0, 1, 0.2509804, 1,
-0.3277467, 1.467518, -1.045237, 0, 1, 0.254902, 1,
-0.3271469, 0.999571, 0.8018615, 0, 1, 0.2627451, 1,
-0.3251554, -0.5632238, -2.434532, 0, 1, 0.2666667, 1,
-0.3224652, -1.245147, -2.307396, 0, 1, 0.2745098, 1,
-0.3157905, -0.7732617, -1.499528, 0, 1, 0.2784314, 1,
-0.3154894, -0.266386, -1.396421, 0, 1, 0.2862745, 1,
-0.3153294, 0.4176257, -0.4442257, 0, 1, 0.2901961, 1,
-0.3136638, -1.156924, -3.447353, 0, 1, 0.2980392, 1,
-0.3135615, -1.212765, -0.726002, 0, 1, 0.3058824, 1,
-0.3030038, 0.7279619, -0.7830949, 0, 1, 0.3098039, 1,
-0.3026606, -0.338924, -2.103398, 0, 1, 0.3176471, 1,
-0.3008923, -0.527159, -1.713184, 0, 1, 0.3215686, 1,
-0.2923812, 1.04959, 0.8246228, 0, 1, 0.3294118, 1,
-0.2901132, -1.655616, -3.475282, 0, 1, 0.3333333, 1,
-0.2890068, -0.9777949, -3.142114, 0, 1, 0.3411765, 1,
-0.2862614, -1.36076, -1.878944, 0, 1, 0.345098, 1,
-0.2844352, 1.639275, 0.6024889, 0, 1, 0.3529412, 1,
-0.2842951, -0.6506079, -0.6485838, 0, 1, 0.3568628, 1,
-0.2834072, -0.03512911, -2.533884, 0, 1, 0.3647059, 1,
-0.2820489, 0.6564981, -0.2895505, 0, 1, 0.3686275, 1,
-0.2766514, -0.4833308, -2.361835, 0, 1, 0.3764706, 1,
-0.2748272, 1.299524, -1.011983, 0, 1, 0.3803922, 1,
-0.2739643, 1.872362, -0.6779436, 0, 1, 0.3882353, 1,
-0.270588, 0.1341593, -0.6192536, 0, 1, 0.3921569, 1,
-0.2700812, 1.120816, 1.820789, 0, 1, 0.4, 1,
-0.2687308, 0.8880389, -0.8095086, 0, 1, 0.4078431, 1,
-0.2658044, -0.06693439, -0.07998841, 0, 1, 0.4117647, 1,
-0.2599347, -0.5624743, -1.557901, 0, 1, 0.4196078, 1,
-0.2542311, 0.6902497, -2.074339, 0, 1, 0.4235294, 1,
-0.2528766, 0.8733957, -0.2459825, 0, 1, 0.4313726, 1,
-0.2506098, 0.1901476, -0.4245088, 0, 1, 0.4352941, 1,
-0.2483749, -1.249638, -3.534832, 0, 1, 0.4431373, 1,
-0.2435257, 1.403511, 0.3098547, 0, 1, 0.4470588, 1,
-0.234246, 0.1401993, -1.734517, 0, 1, 0.454902, 1,
-0.2336612, 0.990437, -0.583344, 0, 1, 0.4588235, 1,
-0.2331855, -1.343431, -3.443557, 0, 1, 0.4666667, 1,
-0.2331379, 1.172845, 0.2727351, 0, 1, 0.4705882, 1,
-0.2313601, 1.494801, 0.08974699, 0, 1, 0.4784314, 1,
-0.2268332, -2.317653, -3.924206, 0, 1, 0.4823529, 1,
-0.225783, -1.175393, -1.231914, 0, 1, 0.4901961, 1,
-0.2240632, 0.1181523, -1.181648, 0, 1, 0.4941176, 1,
-0.2223122, 0.09087374, 0.8256225, 0, 1, 0.5019608, 1,
-0.2191634, 0.214389, 0.07967035, 0, 1, 0.509804, 1,
-0.2175842, 1.095996, -2.642398, 0, 1, 0.5137255, 1,
-0.2157247, 0.6233922, -1.318423, 0, 1, 0.5215687, 1,
-0.2152431, 1.412785, 0.7929481, 0, 1, 0.5254902, 1,
-0.2131807, -0.2605137, -0.9514409, 0, 1, 0.5333334, 1,
-0.2112397, -1.471705, -3.627318, 0, 1, 0.5372549, 1,
-0.2072687, -0.7969103, -3.158558, 0, 1, 0.5450981, 1,
-0.2071761, -0.4994332, -3.375391, 0, 1, 0.5490196, 1,
-0.2067416, 0.8677266, 0.1330425, 0, 1, 0.5568628, 1,
-0.2048299, -0.2532827, -2.806408, 0, 1, 0.5607843, 1,
-0.1983835, -0.846006, -3.795239, 0, 1, 0.5686275, 1,
-0.1962413, 0.3552764, 0.3457021, 0, 1, 0.572549, 1,
-0.1958508, -0.02662499, -1.069485, 0, 1, 0.5803922, 1,
-0.1956676, -1.229597, -1.99486, 0, 1, 0.5843138, 1,
-0.1884011, 0.1843358, -2.549335, 0, 1, 0.5921569, 1,
-0.1881415, 0.09542935, 0.08164676, 0, 1, 0.5960785, 1,
-0.1866729, -0.8771392, -2.183727, 0, 1, 0.6039216, 1,
-0.1838693, 0.5342711, -1.024918, 0, 1, 0.6117647, 1,
-0.181321, -0.2823896, -0.7415774, 0, 1, 0.6156863, 1,
-0.1805892, 1.419826, -0.3093707, 0, 1, 0.6235294, 1,
-0.1784616, 1.551209, 0.5446151, 0, 1, 0.627451, 1,
-0.1771802, -0.4871686, -0.9506782, 0, 1, 0.6352941, 1,
-0.1764173, -0.9484905, -2.035619, 0, 1, 0.6392157, 1,
-0.1733307, -0.1096475, -3.066108, 0, 1, 0.6470588, 1,
-0.1733012, 0.3180268, -1.657036, 0, 1, 0.6509804, 1,
-0.167429, -0.01422667, -2.758162, 0, 1, 0.6588235, 1,
-0.1661275, -0.3658368, -3.048429, 0, 1, 0.6627451, 1,
-0.1659396, 1.116441, 0.3298281, 0, 1, 0.6705883, 1,
-0.1633604, -0.8313697, -4.37361, 0, 1, 0.6745098, 1,
-0.1623521, -0.77366, -2.328327, 0, 1, 0.682353, 1,
-0.1604452, 0.4733384, -0.124257, 0, 1, 0.6862745, 1,
-0.1563686, 0.04507232, -0.7733487, 0, 1, 0.6941177, 1,
-0.1502974, -1.382795, -3.263813, 0, 1, 0.7019608, 1,
-0.1497717, 0.2168593, -0.2744944, 0, 1, 0.7058824, 1,
-0.1377466, -0.2882422, -2.187293, 0, 1, 0.7137255, 1,
-0.1257099, 0.1414158, -0.5259307, 0, 1, 0.7176471, 1,
-0.1253186, -0.5206802, -3.087136, 0, 1, 0.7254902, 1,
-0.1235413, 0.5908203, 0.2983606, 0, 1, 0.7294118, 1,
-0.1199011, 0.9524863, -0.135272, 0, 1, 0.7372549, 1,
-0.1188249, 0.1178193, 0.4538079, 0, 1, 0.7411765, 1,
-0.1161825, 1.271336, 0.1314636, 0, 1, 0.7490196, 1,
-0.1126501, -0.510233, -4.401784, 0, 1, 0.7529412, 1,
-0.1084347, -0.8625322, -2.953565, 0, 1, 0.7607843, 1,
-0.1064171, -0.5358009, -4.18189, 0, 1, 0.7647059, 1,
-0.1043479, 0.72154, 0.1883155, 0, 1, 0.772549, 1,
-0.09375416, -1.584528, -3.142825, 0, 1, 0.7764706, 1,
-0.09275928, 0.6242895, -0.2400791, 0, 1, 0.7843137, 1,
-0.09159855, -1.173252, -3.823427, 0, 1, 0.7882353, 1,
-0.09068477, 1.715562, 0.07982951, 0, 1, 0.7960784, 1,
-0.08885828, 0.2187136, -0.2810586, 0, 1, 0.8039216, 1,
-0.08852741, -0.2587789, -3.318707, 0, 1, 0.8078431, 1,
-0.086352, 1.777109, 0.7693623, 0, 1, 0.8156863, 1,
-0.08599769, -0.4203546, -2.925384, 0, 1, 0.8196079, 1,
-0.08575784, 0.05016351, -1.914518, 0, 1, 0.827451, 1,
-0.08214655, 0.6214579, 0.07946947, 0, 1, 0.8313726, 1,
-0.07969669, -0.5248855, -3.30027, 0, 1, 0.8392157, 1,
-0.07600123, 0.743812, -0.7588204, 0, 1, 0.8431373, 1,
-0.07568236, 0.08279201, -1.183145, 0, 1, 0.8509804, 1,
-0.07263749, -0.03692663, -2.388621, 0, 1, 0.854902, 1,
-0.07239008, -1.299157, -4.413099, 0, 1, 0.8627451, 1,
-0.06994238, -0.5967186, -3.308061, 0, 1, 0.8666667, 1,
-0.0696688, 0.2971669, 2.004545, 0, 1, 0.8745098, 1,
-0.06777324, 0.2383805, 1.293892, 0, 1, 0.8784314, 1,
-0.06635787, 0.4765314, -1.82851, 0, 1, 0.8862745, 1,
-0.06313181, 1.330919, -0.1971308, 0, 1, 0.8901961, 1,
-0.05685529, 1.71862, -0.3914742, 0, 1, 0.8980392, 1,
-0.04738518, -1.753399, -2.084835, 0, 1, 0.9058824, 1,
-0.04622675, 2.071733, 0.3743492, 0, 1, 0.9098039, 1,
-0.04037376, 0.4003803, 1.175193, 0, 1, 0.9176471, 1,
-0.03746396, -0.1319872, -2.619056, 0, 1, 0.9215686, 1,
-0.03625829, -0.99709, -2.733363, 0, 1, 0.9294118, 1,
-0.03564845, -1.15881, -4.561028, 0, 1, 0.9333333, 1,
-0.03534846, -0.2731393, -2.384748, 0, 1, 0.9411765, 1,
-0.03334561, 1.713665, 0.6437058, 0, 1, 0.945098, 1,
-0.03034737, 0.4119597, 1.130678, 0, 1, 0.9529412, 1,
-0.02914202, -0.4102188, -1.994282, 0, 1, 0.9568627, 1,
-0.02767376, -0.2065872, -3.22103, 0, 1, 0.9647059, 1,
-0.02677392, -0.1461714, -2.890794, 0, 1, 0.9686275, 1,
-0.02595918, 0.3396095, 1.289111, 0, 1, 0.9764706, 1,
-0.02270214, 0.3736917, -0.4273561, 0, 1, 0.9803922, 1,
-0.01777932, 0.6858361, 0.2174055, 0, 1, 0.9882353, 1,
-0.01407957, 2.446527, 0.1001983, 0, 1, 0.9921569, 1,
-0.01308674, -0.8715898, -3.533595, 0, 1, 1, 1,
-0.008490814, -1.356461, -1.409564, 0, 0.9921569, 1, 1,
-0.002550689, -1.093778, -3.573395, 0, 0.9882353, 1, 1,
-0.001333655, 2.134303, 1.455627, 0, 0.9803922, 1, 1,
0.002566301, -1.240528, 2.94501, 0, 0.9764706, 1, 1,
0.003262945, -1.389164, 2.738269, 0, 0.9686275, 1, 1,
0.003582447, 0.2405053, -0.5031667, 0, 0.9647059, 1, 1,
0.007142662, 0.6330292, -0.7606499, 0, 0.9568627, 1, 1,
0.007515072, -2.014316, 2.879747, 0, 0.9529412, 1, 1,
0.007812961, -1.41978, 2.65365, 0, 0.945098, 1, 1,
0.01416898, 0.6840102, 0.4262088, 0, 0.9411765, 1, 1,
0.01628239, 1.347229, -0.4288936, 0, 0.9333333, 1, 1,
0.01855755, -0.3813288, 3.131996, 0, 0.9294118, 1, 1,
0.02040915, 1.388662, -0.8726003, 0, 0.9215686, 1, 1,
0.021162, 0.2189395, 0.9134769, 0, 0.9176471, 1, 1,
0.02256065, 1.289587, -0.4513938, 0, 0.9098039, 1, 1,
0.02429101, -1.278122, 3.775345, 0, 0.9058824, 1, 1,
0.02780264, -0.8910074, 3.077394, 0, 0.8980392, 1, 1,
0.02960319, -0.1328913, 1.649092, 0, 0.8901961, 1, 1,
0.03012309, 0.9130114, 2.393928, 0, 0.8862745, 1, 1,
0.03029558, 0.6803159, 0.4258747, 0, 0.8784314, 1, 1,
0.03080477, -0.2082072, 3.028456, 0, 0.8745098, 1, 1,
0.03095568, -0.5940825, -0.8829648, 0, 0.8666667, 1, 1,
0.03103665, 2.032392, 0.8511031, 0, 0.8627451, 1, 1,
0.03310969, 0.3957504, 1.657234, 0, 0.854902, 1, 1,
0.03447516, 0.4808201, 0.9506991, 0, 0.8509804, 1, 1,
0.04366982, -0.05661016, 3.693002, 0, 0.8431373, 1, 1,
0.04460374, -1.472427, 2.813107, 0, 0.8392157, 1, 1,
0.04473362, -0.3500745, 2.753057, 0, 0.8313726, 1, 1,
0.05274547, -1.193703, 2.981402, 0, 0.827451, 1, 1,
0.05375458, 0.3477092, -1.251087, 0, 0.8196079, 1, 1,
0.05456942, 0.5347404, -0.4771769, 0, 0.8156863, 1, 1,
0.05958826, 0.3225386, 0.3898454, 0, 0.8078431, 1, 1,
0.0606832, -0.9701015, 4.573246, 0, 0.8039216, 1, 1,
0.06089394, 0.003108605, 0.3516272, 0, 0.7960784, 1, 1,
0.06272928, -1.021588, 2.598764, 0, 0.7882353, 1, 1,
0.06629203, 3.141901, -0.983887, 0, 0.7843137, 1, 1,
0.07027356, 0.3931976, 1.262281, 0, 0.7764706, 1, 1,
0.07089142, 0.1745244, -0.6155805, 0, 0.772549, 1, 1,
0.0728471, -0.2466066, 3.265725, 0, 0.7647059, 1, 1,
0.07339902, -0.4406075, 1.284919, 0, 0.7607843, 1, 1,
0.07407269, 0.7600214, -0.924191, 0, 0.7529412, 1, 1,
0.07435559, 1.667341, 0.1433325, 0, 0.7490196, 1, 1,
0.07618686, -2.819771, 3.99497, 0, 0.7411765, 1, 1,
0.07688347, 0.9893035, -0.09682367, 0, 0.7372549, 1, 1,
0.07872213, -0.003772349, 2.615716, 0, 0.7294118, 1, 1,
0.07911702, 0.2497341, 0.7627203, 0, 0.7254902, 1, 1,
0.08089282, 0.07618169, 0.07809009, 0, 0.7176471, 1, 1,
0.08403966, 0.3888058, -0.3553039, 0, 0.7137255, 1, 1,
0.08418225, 0.6970351, 0.8889995, 0, 0.7058824, 1, 1,
0.08473131, 1.114869, 1.100192, 0, 0.6980392, 1, 1,
0.08622118, -0.05804088, 2.714561, 0, 0.6941177, 1, 1,
0.0863104, -1.674105, 1.627245, 0, 0.6862745, 1, 1,
0.08674079, -0.2485166, 4.169487, 0, 0.682353, 1, 1,
0.09111561, 1.34168, 1.029742, 0, 0.6745098, 1, 1,
0.09388835, 0.3934729, 1.414048, 0, 0.6705883, 1, 1,
0.09464006, 0.6253465, -0.3243707, 0, 0.6627451, 1, 1,
0.09614588, -0.3585944, 2.937013, 0, 0.6588235, 1, 1,
0.1009069, -0.3352369, 4.8348, 0, 0.6509804, 1, 1,
0.1069463, -1.892444, 1.937336, 0, 0.6470588, 1, 1,
0.1093822, -0.4175718, 2.348366, 0, 0.6392157, 1, 1,
0.1115507, -0.06025135, 1.46025, 0, 0.6352941, 1, 1,
0.1177539, 0.4020231, 1.46108, 0, 0.627451, 1, 1,
0.119401, 1.218669, 0.4420711, 0, 0.6235294, 1, 1,
0.1280144, 1.274868, -0.003820821, 0, 0.6156863, 1, 1,
0.1293886, -0.7273826, 2.613614, 0, 0.6117647, 1, 1,
0.1309614, 0.1127365, 1.623305, 0, 0.6039216, 1, 1,
0.1332431, 0.6365719, -0.1773766, 0, 0.5960785, 1, 1,
0.1367665, 0.1405878, 1.807218, 0, 0.5921569, 1, 1,
0.1422163, -1.148996, 2.526999, 0, 0.5843138, 1, 1,
0.1459281, 0.7805619, 0.9653819, 0, 0.5803922, 1, 1,
0.1461945, 0.4735958, 0.7569414, 0, 0.572549, 1, 1,
0.146593, -0.897169, 3.332306, 0, 0.5686275, 1, 1,
0.1512786, -1.052463, 2.928216, 0, 0.5607843, 1, 1,
0.1526831, 0.3107376, -0.07540468, 0, 0.5568628, 1, 1,
0.1531032, 0.7349647, -0.9526545, 0, 0.5490196, 1, 1,
0.1556578, 1.785983, -0.09267067, 0, 0.5450981, 1, 1,
0.1571068, -1.898742, 1.018945, 0, 0.5372549, 1, 1,
0.1589122, -0.5677484, 1.674306, 0, 0.5333334, 1, 1,
0.1659797, 0.9695811, -0.1116532, 0, 0.5254902, 1, 1,
0.1675995, 0.5046307, -0.425471, 0, 0.5215687, 1, 1,
0.1693092, 1.572938, 0.4788323, 0, 0.5137255, 1, 1,
0.1715807, -1.429348, 2.15583, 0, 0.509804, 1, 1,
0.1768019, 0.5481317, 0.4759217, 0, 0.5019608, 1, 1,
0.1769963, -0.3108553, 1.701512, 0, 0.4941176, 1, 1,
0.1795642, 1.377203, 1.32038, 0, 0.4901961, 1, 1,
0.1797313, 1.007261, -0.8448837, 0, 0.4823529, 1, 1,
0.1819611, 1.885764, 1.602998, 0, 0.4784314, 1, 1,
0.1825767, 1.089124, -0.123908, 0, 0.4705882, 1, 1,
0.1831429, 0.3671262, 0.7138306, 0, 0.4666667, 1, 1,
0.1833795, 0.9186643, 1.885277, 0, 0.4588235, 1, 1,
0.1908321, -0.510118, 2.542514, 0, 0.454902, 1, 1,
0.1928204, 0.3476139, 0.4035812, 0, 0.4470588, 1, 1,
0.1930362, 1.601152, -0.7314199, 0, 0.4431373, 1, 1,
0.1955083, -0.2059131, 2.537281, 0, 0.4352941, 1, 1,
0.1963128, -0.3241761, 2.802829, 0, 0.4313726, 1, 1,
0.1973653, 0.7993826, 1.664156, 0, 0.4235294, 1, 1,
0.1987658, -1.17653, 2.496039, 0, 0.4196078, 1, 1,
0.199573, -1.381901, 4.216187, 0, 0.4117647, 1, 1,
0.2019881, -0.2609915, 3.055662, 0, 0.4078431, 1, 1,
0.2022399, 0.4988327, 0.2416535, 0, 0.4, 1, 1,
0.2040284, -0.7465024, 2.432892, 0, 0.3921569, 1, 1,
0.2058934, -0.9054668, 2.738432, 0, 0.3882353, 1, 1,
0.2059719, 1.189412, 0.3788254, 0, 0.3803922, 1, 1,
0.2064648, 0.05503152, 1.892015, 0, 0.3764706, 1, 1,
0.2156132, -0.6112052, 3.803287, 0, 0.3686275, 1, 1,
0.2209277, -0.02733427, 2.574056, 0, 0.3647059, 1, 1,
0.2277854, 0.6574878, -1.237657, 0, 0.3568628, 1, 1,
0.2278835, -0.2664077, 1.109802, 0, 0.3529412, 1, 1,
0.2296096, -0.3877862, 1.370063, 0, 0.345098, 1, 1,
0.2305812, 0.08815006, 1.427644, 0, 0.3411765, 1, 1,
0.233166, 0.7092075, 1.655978, 0, 0.3333333, 1, 1,
0.23568, -0.9884114, -0.1353782, 0, 0.3294118, 1, 1,
0.241103, -1.070427, 2.912323, 0, 0.3215686, 1, 1,
0.2444028, 0.2812914, 0.5708023, 0, 0.3176471, 1, 1,
0.2507906, 0.5454231, 0.8919749, 0, 0.3098039, 1, 1,
0.2537617, 0.771879, -0.9382048, 0, 0.3058824, 1, 1,
0.2556891, 0.4330792, 1.628744, 0, 0.2980392, 1, 1,
0.256938, 0.1220244, 2.260435, 0, 0.2901961, 1, 1,
0.2578106, -0.9834266, 0.8246311, 0, 0.2862745, 1, 1,
0.2595214, -0.1793691, 2.4206, 0, 0.2784314, 1, 1,
0.2609346, -0.2304598, 3.20266, 0, 0.2745098, 1, 1,
0.2617873, -0.8262343, 2.310083, 0, 0.2666667, 1, 1,
0.2797139, -1.116444, 5.113741, 0, 0.2627451, 1, 1,
0.2813245, 0.05972994, 1.389677, 0, 0.254902, 1, 1,
0.2822391, -0.3592111, 0.6458834, 0, 0.2509804, 1, 1,
0.2825177, -0.8688132, 1.314181, 0, 0.2431373, 1, 1,
0.2850073, -0.3970026, 3.081115, 0, 0.2392157, 1, 1,
0.2985525, -1.276943, 3.918107, 0, 0.2313726, 1, 1,
0.2994224, -1.276187, 2.933486, 0, 0.227451, 1, 1,
0.2995596, 2.08159, 2.160803, 0, 0.2196078, 1, 1,
0.3003352, 1.882055, -0.788385, 0, 0.2156863, 1, 1,
0.300803, 0.9298609, 0.754091, 0, 0.2078431, 1, 1,
0.3064223, -0.4949462, 1.877018, 0, 0.2039216, 1, 1,
0.308428, 2.202288, -1.447577, 0, 0.1960784, 1, 1,
0.3113261, -0.6562765, 4.389654, 0, 0.1882353, 1, 1,
0.3179704, -0.5475358, 3.787674, 0, 0.1843137, 1, 1,
0.3198378, -1.844458, 1.736338, 0, 0.1764706, 1, 1,
0.31989, -0.03244783, 0.6466843, 0, 0.172549, 1, 1,
0.3267845, -0.6955641, 3.552367, 0, 0.1647059, 1, 1,
0.3275725, -1.500652, 2.608706, 0, 0.1607843, 1, 1,
0.3283042, 0.3951826, 2.53454, 0, 0.1529412, 1, 1,
0.3301934, 1.82924, -0.1260197, 0, 0.1490196, 1, 1,
0.3352119, -1.53309, 2.499259, 0, 0.1411765, 1, 1,
0.3415495, 0.1028669, 2.482135, 0, 0.1372549, 1, 1,
0.3416079, -0.6923168, 1.84389, 0, 0.1294118, 1, 1,
0.342337, 0.2718528, 2.282282, 0, 0.1254902, 1, 1,
0.3473476, 0.7160096, 1.43039, 0, 0.1176471, 1, 1,
0.3485874, -1.074446, 2.521739, 0, 0.1137255, 1, 1,
0.3501324, 0.3192263, 0.7013464, 0, 0.1058824, 1, 1,
0.351781, -0.4326385, 1.818827, 0, 0.09803922, 1, 1,
0.3523934, -1.838303, 1.670879, 0, 0.09411765, 1, 1,
0.3554328, 0.2404236, 0.7840828, 0, 0.08627451, 1, 1,
0.3605207, -0.2022091, 1.685444, 0, 0.08235294, 1, 1,
0.3631116, -0.4256372, 2.35068, 0, 0.07450981, 1, 1,
0.3650216, 0.3437496, 1.042246, 0, 0.07058824, 1, 1,
0.3728721, -1.40406, 2.101009, 0, 0.0627451, 1, 1,
0.3755981, -0.8318828, 2.999001, 0, 0.05882353, 1, 1,
0.3761117, -1.865388, 2.555841, 0, 0.05098039, 1, 1,
0.3764518, -1.660411, 2.683238, 0, 0.04705882, 1, 1,
0.3802139, 0.9182177, -0.09588853, 0, 0.03921569, 1, 1,
0.3816391, -0.334929, -0.8181095, 0, 0.03529412, 1, 1,
0.3864558, -0.1375927, 2.754161, 0, 0.02745098, 1, 1,
0.3885167, 0.3513002, -1.451222, 0, 0.02352941, 1, 1,
0.3941498, 1.015204, 0.128955, 0, 0.01568628, 1, 1,
0.396879, -1.547161, 3.502515, 0, 0.01176471, 1, 1,
0.4003589, -1.140072, 3.245561, 0, 0.003921569, 1, 1,
0.404029, -0.2358667, 4.803217, 0.003921569, 0, 1, 1,
0.4139034, -0.3756125, 1.07635, 0.007843138, 0, 1, 1,
0.4158826, -0.01317989, 0.7817955, 0.01568628, 0, 1, 1,
0.418331, 0.8232253, 0.4618357, 0.01960784, 0, 1, 1,
0.4185222, -0.1504751, 1.374853, 0.02745098, 0, 1, 1,
0.4217229, -1.869232, 3.765926, 0.03137255, 0, 1, 1,
0.4270891, 0.5442867, 0.8189685, 0.03921569, 0, 1, 1,
0.4309578, -0.7262389, 2.884342, 0.04313726, 0, 1, 1,
0.4374515, -0.07981687, 0.1926633, 0.05098039, 0, 1, 1,
0.4391037, -2.691374, 3.820215, 0.05490196, 0, 1, 1,
0.4445798, 0.3459386, 0.8325511, 0.0627451, 0, 1, 1,
0.4468882, -0.455108, 2.7037, 0.06666667, 0, 1, 1,
0.451139, 1.10588, 1.063945, 0.07450981, 0, 1, 1,
0.4516665, 1.341308, -0.531482, 0.07843138, 0, 1, 1,
0.4518052, -1.098886, 2.412081, 0.08627451, 0, 1, 1,
0.4540957, 0.5961324, 1.17828, 0.09019608, 0, 1, 1,
0.4544523, -1.651209, 2.599655, 0.09803922, 0, 1, 1,
0.4546805, 0.9710472, 0.2099328, 0.1058824, 0, 1, 1,
0.4632459, -1.489508, 1.956762, 0.1098039, 0, 1, 1,
0.4652593, -0.7816424, 1.821543, 0.1176471, 0, 1, 1,
0.4664695, 0.2186887, 1.810208, 0.1215686, 0, 1, 1,
0.4697023, 1.959824, -0.2535162, 0.1294118, 0, 1, 1,
0.4704791, 0.4837886, 0.9954308, 0.1333333, 0, 1, 1,
0.4730893, -0.05235332, -0.164421, 0.1411765, 0, 1, 1,
0.4736967, -0.1174238, 2.056427, 0.145098, 0, 1, 1,
0.4744544, -0.492829, 3.092012, 0.1529412, 0, 1, 1,
0.4762969, 0.5063834, 1.731943, 0.1568628, 0, 1, 1,
0.4798291, -1.18578, 2.058268, 0.1647059, 0, 1, 1,
0.4835497, 0.4809151, 0.7526104, 0.1686275, 0, 1, 1,
0.4851647, 0.2386345, 3.653403, 0.1764706, 0, 1, 1,
0.4853497, -0.9789919, 2.913096, 0.1803922, 0, 1, 1,
0.4876035, 0.7397662, -0.543119, 0.1882353, 0, 1, 1,
0.4882775, -0.06100672, 1.075848, 0.1921569, 0, 1, 1,
0.488458, -0.6652532, 2.682204, 0.2, 0, 1, 1,
0.4912737, 0.5687761, 0.7393371, 0.2078431, 0, 1, 1,
0.492764, 0.5941415, 0.5644647, 0.2117647, 0, 1, 1,
0.4930319, 0.4260032, 1.602439, 0.2196078, 0, 1, 1,
0.493248, -1.240414, 3.671545, 0.2235294, 0, 1, 1,
0.4969197, 1.534104, 1.69674, 0.2313726, 0, 1, 1,
0.5003079, 0.4040574, 0.1452384, 0.2352941, 0, 1, 1,
0.5026938, -0.6991521, 3.118391, 0.2431373, 0, 1, 1,
0.5038298, -2.300774, 3.218744, 0.2470588, 0, 1, 1,
0.5046844, 0.490216, 0.3217028, 0.254902, 0, 1, 1,
0.5079509, 0.4303197, 0.1564297, 0.2588235, 0, 1, 1,
0.5086141, 1.203976, -0.8496657, 0.2666667, 0, 1, 1,
0.5108089, -0.9546259, 2.875582, 0.2705882, 0, 1, 1,
0.511107, 0.5644107, 1.324196, 0.2784314, 0, 1, 1,
0.5128137, 0.7050232, 1.493897, 0.282353, 0, 1, 1,
0.5194902, -0.736581, 4.366133, 0.2901961, 0, 1, 1,
0.5233971, 1.015156, 0.9026046, 0.2941177, 0, 1, 1,
0.5271259, 1.939556, -0.08094999, 0.3019608, 0, 1, 1,
0.5282881, 0.0723653, 2.07457, 0.3098039, 0, 1, 1,
0.5303845, 0.8995386, -1.2711, 0.3137255, 0, 1, 1,
0.5313721, 1.386889, 0.4491378, 0.3215686, 0, 1, 1,
0.5362903, -0.2105781, 2.782776, 0.3254902, 0, 1, 1,
0.5384582, 1.236046, 0.3512428, 0.3333333, 0, 1, 1,
0.5417581, -0.6680589, 1.120288, 0.3372549, 0, 1, 1,
0.5429519, 0.1869827, -0.3192886, 0.345098, 0, 1, 1,
0.5486099, 0.5156527, -0.3376139, 0.3490196, 0, 1, 1,
0.5488828, 0.103887, 0.7772869, 0.3568628, 0, 1, 1,
0.5500318, -0.02723574, 1.187303, 0.3607843, 0, 1, 1,
0.552204, -0.11382, 2.76651, 0.3686275, 0, 1, 1,
0.556964, 1.943851, 3.070493, 0.372549, 0, 1, 1,
0.5581972, -0.5777257, 2.574348, 0.3803922, 0, 1, 1,
0.5601522, 1.190164, 1.226612, 0.3843137, 0, 1, 1,
0.5688512, -0.4863367, 0.9820023, 0.3921569, 0, 1, 1,
0.573122, -0.2395805, 1.424729, 0.3960784, 0, 1, 1,
0.5745665, 0.2299472, 0.9114954, 0.4039216, 0, 1, 1,
0.5774612, -0.1991733, 1.894939, 0.4117647, 0, 1, 1,
0.583793, -0.04803503, 2.075341, 0.4156863, 0, 1, 1,
0.5881982, 0.729633, 0.2533186, 0.4235294, 0, 1, 1,
0.5942004, -0.5419703, 3.456826, 0.427451, 0, 1, 1,
0.5963192, -0.07670757, 1.200957, 0.4352941, 0, 1, 1,
0.5971561, 0.08076141, 2.148016, 0.4392157, 0, 1, 1,
0.5975756, -1.231521, 3.330836, 0.4470588, 0, 1, 1,
0.6005203, 0.1222606, -0.4575064, 0.4509804, 0, 1, 1,
0.6018737, 0.1466617, 1.239438, 0.4588235, 0, 1, 1,
0.6056871, -1.256689, 1.02219, 0.4627451, 0, 1, 1,
0.6098861, -0.4405531, 1.735561, 0.4705882, 0, 1, 1,
0.6109508, -1.113765, 3.801031, 0.4745098, 0, 1, 1,
0.6112137, 1.344693, 0.1209208, 0.4823529, 0, 1, 1,
0.6127622, -0.4774631, 1.676606, 0.4862745, 0, 1, 1,
0.6198916, -1.498273, 2.719249, 0.4941176, 0, 1, 1,
0.6227043, -0.6226474, 2.217707, 0.5019608, 0, 1, 1,
0.6307502, 0.7681823, 0.7833944, 0.5058824, 0, 1, 1,
0.6430671, -1.428666, 1.253804, 0.5137255, 0, 1, 1,
0.643391, 0.477042, 3.180785, 0.5176471, 0, 1, 1,
0.6458291, -0.4272582, 2.775291, 0.5254902, 0, 1, 1,
0.6499104, -0.5505145, 1.454065, 0.5294118, 0, 1, 1,
0.6503404, -1.154327, 3.595353, 0.5372549, 0, 1, 1,
0.6567846, -0.1813305, 1.359833, 0.5411765, 0, 1, 1,
0.658751, 1.472864, 0.2975151, 0.5490196, 0, 1, 1,
0.6602311, -0.8571213, 1.375255, 0.5529412, 0, 1, 1,
0.6611933, 0.9901241, -0.5205665, 0.5607843, 0, 1, 1,
0.6699004, 0.1472963, 4.116807, 0.5647059, 0, 1, 1,
0.6716701, -0.103512, 1.958828, 0.572549, 0, 1, 1,
0.6789601, -0.6972225, 1.858241, 0.5764706, 0, 1, 1,
0.6896618, -0.1549456, 1.21576, 0.5843138, 0, 1, 1,
0.7084743, 1.244037, 0.3198372, 0.5882353, 0, 1, 1,
0.7101564, 0.4319373, 0.740513, 0.5960785, 0, 1, 1,
0.7112096, -0.1010588, 1.633574, 0.6039216, 0, 1, 1,
0.7129301, -0.6929945, 2.959176, 0.6078432, 0, 1, 1,
0.7182851, 1.145344, -0.8231456, 0.6156863, 0, 1, 1,
0.7212182, 0.7069858, 2.121313, 0.6196079, 0, 1, 1,
0.7217974, -0.9224856, 3.096025, 0.627451, 0, 1, 1,
0.7225314, 1.27204, -0.09541604, 0.6313726, 0, 1, 1,
0.7231148, -0.2568406, 2.343584, 0.6392157, 0, 1, 1,
0.7253474, 1.55655, 2.275691, 0.6431373, 0, 1, 1,
0.7301562, -3.538657, 2.792036, 0.6509804, 0, 1, 1,
0.7327824, -0.1980888, 2.154201, 0.654902, 0, 1, 1,
0.7400468, -0.6482207, 4.211083, 0.6627451, 0, 1, 1,
0.7507742, -0.9048533, 1.849228, 0.6666667, 0, 1, 1,
0.7522674, -1.432589, 2.616077, 0.6745098, 0, 1, 1,
0.7550753, 1.799129, 0.8356915, 0.6784314, 0, 1, 1,
0.7577901, 1.787827, -1.179408, 0.6862745, 0, 1, 1,
0.7605773, 0.3399352, -1.059692, 0.6901961, 0, 1, 1,
0.7614273, 0.8281824, 1.480442, 0.6980392, 0, 1, 1,
0.769173, -0.4864599, 3.85948, 0.7058824, 0, 1, 1,
0.7775623, 0.5308775, 0.7176425, 0.7098039, 0, 1, 1,
0.7864583, 1.063698, 1.571234, 0.7176471, 0, 1, 1,
0.7871888, -0.2052303, 3.259472, 0.7215686, 0, 1, 1,
0.7891762, -0.2891481, 1.962679, 0.7294118, 0, 1, 1,
0.790164, -0.2094357, 1.817628, 0.7333333, 0, 1, 1,
0.7917759, -1.070238, 3.678227, 0.7411765, 0, 1, 1,
0.7929564, -0.08272327, 0.4975591, 0.7450981, 0, 1, 1,
0.7940088, 0.7819427, -0.4036528, 0.7529412, 0, 1, 1,
0.7977985, 1.156675, 1.3156, 0.7568628, 0, 1, 1,
0.802092, -0.3120123, 0.6752536, 0.7647059, 0, 1, 1,
0.8052589, 0.5136687, 1.561541, 0.7686275, 0, 1, 1,
0.8076522, -1.187676, 3.682557, 0.7764706, 0, 1, 1,
0.8085942, -0.6756366, 2.035571, 0.7803922, 0, 1, 1,
0.8124331, 0.811902, 0.4444863, 0.7882353, 0, 1, 1,
0.8139059, 0.9389399, -1.487661, 0.7921569, 0, 1, 1,
0.8227925, -0.3299045, 3.727228, 0.8, 0, 1, 1,
0.8319409, 0.2100761, 1.329968, 0.8078431, 0, 1, 1,
0.8340807, -1.171925, 1.257303, 0.8117647, 0, 1, 1,
0.836206, -0.9897586, 2.680247, 0.8196079, 0, 1, 1,
0.8370388, -0.2770942, 1.014439, 0.8235294, 0, 1, 1,
0.8440288, 1.424824, 0.5195631, 0.8313726, 0, 1, 1,
0.8444456, -0.642958, 2.351071, 0.8352941, 0, 1, 1,
0.8482604, 0.4052297, 1.231932, 0.8431373, 0, 1, 1,
0.852236, 0.07221553, 2.755705, 0.8470588, 0, 1, 1,
0.8647855, 0.3566043, 0.8601154, 0.854902, 0, 1, 1,
0.8965917, -0.3417968, 2.226425, 0.8588235, 0, 1, 1,
0.8985889, 0.5586351, 1.90477, 0.8666667, 0, 1, 1,
0.9018747, 0.6458066, -0.04059052, 0.8705882, 0, 1, 1,
0.9028999, 0.6809466, 0.3453892, 0.8784314, 0, 1, 1,
0.9043041, -0.28199, 1.868106, 0.8823529, 0, 1, 1,
0.9043222, -1.429909, 2.68259, 0.8901961, 0, 1, 1,
0.9130918, -1.761464, 2.510686, 0.8941177, 0, 1, 1,
0.9131168, 1.939294, 1.094195, 0.9019608, 0, 1, 1,
0.9175321, -0.8842918, 3.838979, 0.9098039, 0, 1, 1,
0.9212369, -0.1013086, 1.900792, 0.9137255, 0, 1, 1,
0.9226176, -0.3004096, 2.501868, 0.9215686, 0, 1, 1,
0.9232906, 0.6147325, 1.831636, 0.9254902, 0, 1, 1,
0.9238811, 0.4826115, 0.5669482, 0.9333333, 0, 1, 1,
0.9243501, 1.017789, 1.245849, 0.9372549, 0, 1, 1,
0.9323445, 0.716717, -0.6228555, 0.945098, 0, 1, 1,
0.932878, 0.1848498, 2.576652, 0.9490196, 0, 1, 1,
0.9374716, 0.005716842, -1.397877, 0.9568627, 0, 1, 1,
0.9452363, 1.478706, 0.3588804, 0.9607843, 0, 1, 1,
0.9471889, -0.7957365, 3.656963, 0.9686275, 0, 1, 1,
0.9483814, 0.6018254, 1.189184, 0.972549, 0, 1, 1,
0.9484193, -0.5797459, 3.923617, 0.9803922, 0, 1, 1,
0.9502286, -0.1638958, 0.3167085, 0.9843137, 0, 1, 1,
0.9516636, -0.9693809, 1.072247, 0.9921569, 0, 1, 1,
0.955353, -0.9425463, 0.7999827, 0.9960784, 0, 1, 1,
0.9676154, -0.2094604, 2.356414, 1, 0, 0.9960784, 1,
0.9701468, -0.3655684, 1.753229, 1, 0, 0.9882353, 1,
0.9706783, -0.1961066, 0.9558743, 1, 0, 0.9843137, 1,
0.9752337, -1.013309, 4.117797, 1, 0, 0.9764706, 1,
0.9778445, 0.04480523, 0.8425009, 1, 0, 0.972549, 1,
0.9832647, 1.49234, 0.03577271, 1, 0, 0.9647059, 1,
0.9841638, -0.2871732, 1.831641, 1, 0, 0.9607843, 1,
0.9844047, -0.6528531, 3.219337, 1, 0, 0.9529412, 1,
0.9912293, -0.3151045, 2.402332, 1, 0, 0.9490196, 1,
0.993206, 1.582334, 2.39326, 1, 0, 0.9411765, 1,
0.9941978, -1.304757, 0.1408951, 1, 0, 0.9372549, 1,
0.9962326, 0.9639856, 1.440319, 1, 0, 0.9294118, 1,
0.9984888, 0.2053292, 0.5822499, 1, 0, 0.9254902, 1,
1.003678, 0.4109918, 0.2460697, 1, 0, 0.9176471, 1,
1.014538, -0.9065671, 3.457093, 1, 0, 0.9137255, 1,
1.02152, 1.131408, -0.4314938, 1, 0, 0.9058824, 1,
1.02927, 0.8344977, 0.4924987, 1, 0, 0.9019608, 1,
1.037193, -0.5407436, 0.9123592, 1, 0, 0.8941177, 1,
1.045116, 0.7070542, 0.1714591, 1, 0, 0.8862745, 1,
1.045362, -0.3362655, 1.06052, 1, 0, 0.8823529, 1,
1.046382, 2.620478, -0.5355349, 1, 0, 0.8745098, 1,
1.048617, -1.677881, 1.919698, 1, 0, 0.8705882, 1,
1.059721, -1.917414, 2.408872, 1, 0, 0.8627451, 1,
1.061913, 0.1701896, 1.406014, 1, 0, 0.8588235, 1,
1.06685, 1.460019, -2.246405, 1, 0, 0.8509804, 1,
1.073278, 0.6902907, 0.5038925, 1, 0, 0.8470588, 1,
1.077793, -1.701962, 2.042057, 1, 0, 0.8392157, 1,
1.088412, -1.333365, 3.569574, 1, 0, 0.8352941, 1,
1.090538, -0.5232614, 0.780314, 1, 0, 0.827451, 1,
1.092016, -0.894242, 2.183184, 1, 0, 0.8235294, 1,
1.112187, 0.5257515, 1.173221, 1, 0, 0.8156863, 1,
1.113704, -0.04306988, 1.077217, 1, 0, 0.8117647, 1,
1.120264, 0.3068704, 1.705457, 1, 0, 0.8039216, 1,
1.124757, 0.9154647, 1.698742, 1, 0, 0.7960784, 1,
1.129737, 0.9142327, 0.2668218, 1, 0, 0.7921569, 1,
1.133749, -1.187105, 2.348759, 1, 0, 0.7843137, 1,
1.134592, -0.5497938, 2.243755, 1, 0, 0.7803922, 1,
1.134788, 0.9800202, 0.7013223, 1, 0, 0.772549, 1,
1.134964, 1.677649, -0.4259782, 1, 0, 0.7686275, 1,
1.138692, -1.344868, 2.109774, 1, 0, 0.7607843, 1,
1.138757, 0.08036582, 2.70648, 1, 0, 0.7568628, 1,
1.145833, -1.082118, 1.74341, 1, 0, 0.7490196, 1,
1.147112, 0.2520219, 2.201998, 1, 0, 0.7450981, 1,
1.149108, 0.04513969, 1.699483, 1, 0, 0.7372549, 1,
1.158746, 0.8760079, 0.8466834, 1, 0, 0.7333333, 1,
1.16005, 0.5922415, 2.180245, 1, 0, 0.7254902, 1,
1.166719, -1.93453, 2.49702, 1, 0, 0.7215686, 1,
1.169917, 0.8964087, 0.547069, 1, 0, 0.7137255, 1,
1.173985, -0.6211526, 2.674892, 1, 0, 0.7098039, 1,
1.180341, 0.6256923, 2.104145, 1, 0, 0.7019608, 1,
1.183219, 0.5766433, 1.005829, 1, 0, 0.6941177, 1,
1.187559, -0.06806341, 1.459203, 1, 0, 0.6901961, 1,
1.191917, -0.1864332, 2.585747, 1, 0, 0.682353, 1,
1.198879, -0.1268356, 1.589131, 1, 0, 0.6784314, 1,
1.206631, 0.07077239, 2.17414, 1, 0, 0.6705883, 1,
1.20858, 1.67284, -0.04273714, 1, 0, 0.6666667, 1,
1.226361, 1.46042, 0.9255587, 1, 0, 0.6588235, 1,
1.226815, -0.9057178, 2.58556, 1, 0, 0.654902, 1,
1.233215, -1.539813, 2.599831, 1, 0, 0.6470588, 1,
1.236982, -0.09174939, 0.7075558, 1, 0, 0.6431373, 1,
1.251574, -0.6811455, 0.9288027, 1, 0, 0.6352941, 1,
1.252736, 1.789974, -1.016913, 1, 0, 0.6313726, 1,
1.256288, 1.239057, 2.824778, 1, 0, 0.6235294, 1,
1.256299, 0.2021104, 1.853739, 1, 0, 0.6196079, 1,
1.258558, -0.1817234, 1.031223, 1, 0, 0.6117647, 1,
1.261526, -1.451879, 3.901072, 1, 0, 0.6078432, 1,
1.270622, -1.385744, 2.681629, 1, 0, 0.6, 1,
1.275507, -1.310925, 0.2748725, 1, 0, 0.5921569, 1,
1.284311, -0.3665541, 1.078495, 1, 0, 0.5882353, 1,
1.292481, -0.376434, 2.03869, 1, 0, 0.5803922, 1,
1.306219, 0.4174262, 3.16214, 1, 0, 0.5764706, 1,
1.31732, 0.4347892, 1.423403, 1, 0, 0.5686275, 1,
1.320513, 0.2097864, 1.542691, 1, 0, 0.5647059, 1,
1.323142, -0.7616337, 2.191218, 1, 0, 0.5568628, 1,
1.325289, -1.059787, 2.871359, 1, 0, 0.5529412, 1,
1.328058, 0.8147485, -0.679806, 1, 0, 0.5450981, 1,
1.332002, 0.5805066, 1.643533, 1, 0, 0.5411765, 1,
1.334446, 0.3891654, 1.416529, 1, 0, 0.5333334, 1,
1.343807, 0.6955131, 2.004964, 1, 0, 0.5294118, 1,
1.34802, -1.476794, 2.899621, 1, 0, 0.5215687, 1,
1.350921, 0.1566443, 0.4075442, 1, 0, 0.5176471, 1,
1.352101, 0.988144, 2.24111, 1, 0, 0.509804, 1,
1.353445, -2.469458, 2.605719, 1, 0, 0.5058824, 1,
1.361566, 1.726057, 1.305055, 1, 0, 0.4980392, 1,
1.368386, 0.312205, 2.609156, 1, 0, 0.4901961, 1,
1.371741, 0.4561367, 0.8642194, 1, 0, 0.4862745, 1,
1.373165, -1.419371, 0.0308762, 1, 0, 0.4784314, 1,
1.374781, -1.768135, 2.722803, 1, 0, 0.4745098, 1,
1.376342, -1.716557, 2.55834, 1, 0, 0.4666667, 1,
1.377809, -1.073197, 3.477103, 1, 0, 0.4627451, 1,
1.380136, 0.9005827, -0.4918362, 1, 0, 0.454902, 1,
1.390998, -1.210767, 2.966571, 1, 0, 0.4509804, 1,
1.405229, 1.240646, 2.873578, 1, 0, 0.4431373, 1,
1.410785, 0.7169229, 0.838433, 1, 0, 0.4392157, 1,
1.413177, -0.05565596, 2.050666, 1, 0, 0.4313726, 1,
1.425222, -0.6517337, 2.97631, 1, 0, 0.427451, 1,
1.426493, 0.5339683, 0.496673, 1, 0, 0.4196078, 1,
1.433104, 0.6770428, 0.498072, 1, 0, 0.4156863, 1,
1.44656, 0.3878364, -1.460762, 1, 0, 0.4078431, 1,
1.450204, 0.3180645, 0.5243839, 1, 0, 0.4039216, 1,
1.456711, 0.06235153, 1.75432, 1, 0, 0.3960784, 1,
1.457746, 0.1385666, 1.952644, 1, 0, 0.3882353, 1,
1.459729, 0.8531586, 1.551755, 1, 0, 0.3843137, 1,
1.476949, -0.5912041, 1.487746, 1, 0, 0.3764706, 1,
1.49325, -1.601948, 0.8363112, 1, 0, 0.372549, 1,
1.504013, -0.08418664, 1.799799, 1, 0, 0.3647059, 1,
1.511794, -0.2433661, 2.054401, 1, 0, 0.3607843, 1,
1.518514, 0.468964, 0.9504462, 1, 0, 0.3529412, 1,
1.519017, 0.6355178, 0.8137469, 1, 0, 0.3490196, 1,
1.52747, -0.173989, 1.56495, 1, 0, 0.3411765, 1,
1.540385, -0.9554476, 3.42282, 1, 0, 0.3372549, 1,
1.544206, -0.2687746, 2.544768, 1, 0, 0.3294118, 1,
1.556369, 2.762994, 1.431191, 1, 0, 0.3254902, 1,
1.568015, -1.490765, 3.479496, 1, 0, 0.3176471, 1,
1.574157, -0.416157, 1.572173, 1, 0, 0.3137255, 1,
1.584274, 1.138424, 1.848624, 1, 0, 0.3058824, 1,
1.590315, 0.2576021, 0.6095412, 1, 0, 0.2980392, 1,
1.598962, -0.2481248, 1.199181, 1, 0, 0.2941177, 1,
1.617701, -1.109539, 1.675977, 1, 0, 0.2862745, 1,
1.619392, -0.8307645, 1.158136, 1, 0, 0.282353, 1,
1.62344, 1.828474, 0.890156, 1, 0, 0.2745098, 1,
1.624433, 2.461864, 0.06538195, 1, 0, 0.2705882, 1,
1.632065, 2.260259, 2.492091, 1, 0, 0.2627451, 1,
1.645311, -0.7370076, 2.160301, 1, 0, 0.2588235, 1,
1.649288, 0.504322, 1.07982, 1, 0, 0.2509804, 1,
1.653054, -1.607562, 2.558209, 1, 0, 0.2470588, 1,
1.658288, -0.4927385, 2.608466, 1, 0, 0.2392157, 1,
1.66054, 0.3245315, 2.266938, 1, 0, 0.2352941, 1,
1.660799, -0.7390497, 3.249494, 1, 0, 0.227451, 1,
1.673008, -2.495659, 1.485497, 1, 0, 0.2235294, 1,
1.673119, 0.2202548, -0.05411762, 1, 0, 0.2156863, 1,
1.700763, 1.53907, 1.430723, 1, 0, 0.2117647, 1,
1.705413, -1.158405, 2.057214, 1, 0, 0.2039216, 1,
1.707915, 2.049034, -0.2130815, 1, 0, 0.1960784, 1,
1.714076, -0.8302114, 1.61169, 1, 0, 0.1921569, 1,
1.73963, 1.457805, 0.640647, 1, 0, 0.1843137, 1,
1.761035, -1.132342, 2.117661, 1, 0, 0.1803922, 1,
1.763053, 0.2396529, 0.5094974, 1, 0, 0.172549, 1,
1.763354, -0.2520887, 0.698797, 1, 0, 0.1686275, 1,
1.773335, -1.198805, 1.33823, 1, 0, 0.1607843, 1,
1.783436, 1.984641, 0.2552923, 1, 0, 0.1568628, 1,
1.786953, 0.6770913, -0.1795601, 1, 0, 0.1490196, 1,
1.815406, 0.4123125, 1.62644, 1, 0, 0.145098, 1,
1.895227, -0.3566196, 1.72585, 1, 0, 0.1372549, 1,
1.947715, -1.305152, 2.115646, 1, 0, 0.1333333, 1,
1.952988, 0.7342305, 0.8591775, 1, 0, 0.1254902, 1,
1.984145, -1.038984, 4.219704, 1, 0, 0.1215686, 1,
2.031094, -0.9151178, 1.732778, 1, 0, 0.1137255, 1,
2.061488, -1.192706, 2.389634, 1, 0, 0.1098039, 1,
2.066476, -0.5163895, 2.043645, 1, 0, 0.1019608, 1,
2.098884, 0.2124838, 1.500613, 1, 0, 0.09411765, 1,
2.200984, -0.2047848, 2.837843, 1, 0, 0.09019608, 1,
2.23866, 0.5433226, 1.086599, 1, 0, 0.08235294, 1,
2.243808, 1.941994, 0.6488475, 1, 0, 0.07843138, 1,
2.350244, 0.688462, 2.162238, 1, 0, 0.07058824, 1,
2.351891, 1.200885, -0.1482433, 1, 0, 0.06666667, 1,
2.432934, 0.00406549, 0.64503, 1, 0, 0.05882353, 1,
2.47472, 0.9158772, 1.228593, 1, 0, 0.05490196, 1,
2.478428, -1.360279, 1.142621, 1, 0, 0.04705882, 1,
2.649757, -0.8562404, 1.96137, 1, 0, 0.04313726, 1,
2.822718, -0.6479884, 2.946816, 1, 0, 0.03529412, 1,
2.918086, 0.1992229, 0.3850045, 1, 0, 0.03137255, 1,
2.957451, -0.7383354, 2.006114, 1, 0, 0.02352941, 1,
3.127899, -0.280487, 1.491811, 1, 0, 0.01960784, 1,
3.211288, 0.847721, 0.8206786, 1, 0, 0.01176471, 1,
3.28911, 0.5668094, 2.744705, 1, 0, 0.007843138, 1
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
-0.03476131, -4.779431, -6.534066, 0, -0.5, 0.5, 0.5,
-0.03476131, -4.779431, -6.534066, 1, -0.5, 0.5, 0.5,
-0.03476131, -4.779431, -6.534066, 1, 1.5, 0.5, 0.5,
-0.03476131, -4.779431, -6.534066, 0, 1.5, 0.5, 0.5
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
-4.485425, -0.2447308, -6.534066, 0, -0.5, 0.5, 0.5,
-4.485425, -0.2447308, -6.534066, 1, -0.5, 0.5, 0.5,
-4.485425, -0.2447308, -6.534066, 1, 1.5, 0.5, 0.5,
-4.485425, -0.2447308, -6.534066, 0, 1.5, 0.5, 0.5
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
-4.485425, -4.779431, 0.1339176, 0, -0.5, 0.5, 0.5,
-4.485425, -4.779431, 0.1339176, 1, -0.5, 0.5, 0.5,
-4.485425, -4.779431, 0.1339176, 1, 1.5, 0.5, 0.5,
-4.485425, -4.779431, 0.1339176, 0, 1.5, 0.5, 0.5
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
-3, -3.732962, -4.9953,
3, -3.732962, -4.9953,
-3, -3.732962, -4.9953,
-3, -3.907373, -5.251761,
-2, -3.732962, -4.9953,
-2, -3.907373, -5.251761,
-1, -3.732962, -4.9953,
-1, -3.907373, -5.251761,
0, -3.732962, -4.9953,
0, -3.907373, -5.251761,
1, -3.732962, -4.9953,
1, -3.907373, -5.251761,
2, -3.732962, -4.9953,
2, -3.907373, -5.251761,
3, -3.732962, -4.9953,
3, -3.907373, -5.251761
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
-3, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
-3, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
-3, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
-3, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
-2, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
-2, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
-2, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
-2, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
-1, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
-1, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
-1, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
-1, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
0, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
0, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
0, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
0, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
1, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
1, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
1, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
1, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
2, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
2, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
2, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
2, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5,
3, -4.256196, -5.764683, 0, -0.5, 0.5, 0.5,
3, -4.256196, -5.764683, 1, -0.5, 0.5, 0.5,
3, -4.256196, -5.764683, 1, 1.5, 0.5, 0.5,
3, -4.256196, -5.764683, 0, 1.5, 0.5, 0.5
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
-3.458349, -3, -4.9953,
-3.458349, 3, -4.9953,
-3.458349, -3, -4.9953,
-3.629528, -3, -5.251761,
-3.458349, -2, -4.9953,
-3.629528, -2, -5.251761,
-3.458349, -1, -4.9953,
-3.629528, -1, -5.251761,
-3.458349, 0, -4.9953,
-3.629528, 0, -5.251761,
-3.458349, 1, -4.9953,
-3.629528, 1, -5.251761,
-3.458349, 2, -4.9953,
-3.629528, 2, -5.251761,
-3.458349, 3, -4.9953,
-3.629528, 3, -5.251761
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
-3.971887, -3, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, -3, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, -3, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, -3, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, -2, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, -2, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, -2, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, -2, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, -1, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, -1, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, -1, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, -1, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, 0, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, 0, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, 0, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, 0, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, 1, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, 1, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, 1, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, 1, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, 2, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, 2, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, 2, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, 2, -5.764683, 0, 1.5, 0.5, 0.5,
-3.971887, 3, -5.764683, 0, -0.5, 0.5, 0.5,
-3.971887, 3, -5.764683, 1, -0.5, 0.5, 0.5,
-3.971887, 3, -5.764683, 1, 1.5, 0.5, 0.5,
-3.971887, 3, -5.764683, 0, 1.5, 0.5, 0.5
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
-3.458349, -3.732962, -4,
-3.458349, -3.732962, 4,
-3.458349, -3.732962, -4,
-3.629528, -3.907373, -4,
-3.458349, -3.732962, -2,
-3.629528, -3.907373, -2,
-3.458349, -3.732962, 0,
-3.629528, -3.907373, 0,
-3.458349, -3.732962, 2,
-3.629528, -3.907373, 2,
-3.458349, -3.732962, 4,
-3.629528, -3.907373, 4
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
-3.971887, -4.256196, -4, 0, -0.5, 0.5, 0.5,
-3.971887, -4.256196, -4, 1, -0.5, 0.5, 0.5,
-3.971887, -4.256196, -4, 1, 1.5, 0.5, 0.5,
-3.971887, -4.256196, -4, 0, 1.5, 0.5, 0.5,
-3.971887, -4.256196, -2, 0, -0.5, 0.5, 0.5,
-3.971887, -4.256196, -2, 1, -0.5, 0.5, 0.5,
-3.971887, -4.256196, -2, 1, 1.5, 0.5, 0.5,
-3.971887, -4.256196, -2, 0, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 0, 0, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 0, 1, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 0, 1, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 0, 0, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 2, 0, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 2, 1, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 2, 1, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 2, 0, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 4, 0, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 4, 1, -0.5, 0.5, 0.5,
-3.971887, -4.256196, 4, 1, 1.5, 0.5, 0.5,
-3.971887, -4.256196, 4, 0, 1.5, 0.5, 0.5
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
-3.458349, -3.732962, -4.9953,
-3.458349, 3.2435, -4.9953,
-3.458349, -3.732962, 5.263135,
-3.458349, 3.2435, 5.263135,
-3.458349, -3.732962, -4.9953,
-3.458349, -3.732962, 5.263135,
-3.458349, 3.2435, -4.9953,
-3.458349, 3.2435, 5.263135,
-3.458349, -3.732962, -4.9953,
3.388826, -3.732962, -4.9953,
-3.458349, -3.732962, 5.263135,
3.388826, -3.732962, 5.263135,
-3.458349, 3.2435, -4.9953,
3.388826, 3.2435, -4.9953,
-3.458349, 3.2435, 5.263135,
3.388826, 3.2435, 5.263135,
3.388826, -3.732962, -4.9953,
3.388826, 3.2435, -4.9953,
3.388826, -3.732962, 5.263135,
3.388826, 3.2435, 5.263135,
3.388826, -3.732962, -4.9953,
3.388826, -3.732962, 5.263135,
3.388826, 3.2435, -4.9953,
3.388826, 3.2435, 5.263135
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
var radius = 7.566532;
var distance = 33.66435;
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
mvMatrix.translate( 0.03476131, 0.2447308, -0.1339176 );
mvMatrix.scale( 1.194811, 1.172669, 0.797498 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66435);
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


