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
-3.011183, -0.1667489, 1.010708, 1, 0, 0, 1,
-2.886453, 0.2246343, -3.851932, 1, 0.007843138, 0, 1,
-2.647942, -1.613243, -2.511045, 1, 0.01176471, 0, 1,
-2.618553, 0.19778, -2.380851, 1, 0.01960784, 0, 1,
-2.565178, -1.28139, -2.364448, 1, 0.02352941, 0, 1,
-2.561662, 1.192561, -0.7650875, 1, 0.03137255, 0, 1,
-2.500228, 3.005551, 0.9378779, 1, 0.03529412, 0, 1,
-2.447092, -1.033952, -3.085222, 1, 0.04313726, 0, 1,
-2.445672, 0.1491176, -0.05013518, 1, 0.04705882, 0, 1,
-2.31069, 0.8197189, 0.1966324, 1, 0.05490196, 0, 1,
-2.289223, 1.749807, -1.105533, 1, 0.05882353, 0, 1,
-2.269318, 1.355337, 0.7238482, 1, 0.06666667, 0, 1,
-2.233666, 0.9778582, -0.8134373, 1, 0.07058824, 0, 1,
-2.220964, -0.2881634, -0.9496234, 1, 0.07843138, 0, 1,
-2.193769, 0.1591689, -0.9330323, 1, 0.08235294, 0, 1,
-2.124642, -1.067784, -3.394664, 1, 0.09019608, 0, 1,
-2.117244, 1.495289, -0.6047905, 1, 0.09411765, 0, 1,
-2.091398, -0.7365522, -1.314947, 1, 0.1019608, 0, 1,
-2.085495, -0.1165489, -0.2138722, 1, 0.1098039, 0, 1,
-2.083215, -0.003511719, -0.7540895, 1, 0.1137255, 0, 1,
-2.072993, 0.1220648, -1.185566, 1, 0.1215686, 0, 1,
-2.053575, -0.001252431, -1.894649, 1, 0.1254902, 0, 1,
-2.034802, -0.2019994, -2.152229, 1, 0.1333333, 0, 1,
-2.033898, -0.680853, -2.818517, 1, 0.1372549, 0, 1,
-2.026216, 0.3062586, -2.752133, 1, 0.145098, 0, 1,
-2.01914, 0.1197945, -1.333305, 1, 0.1490196, 0, 1,
-2.016345, 0.4455512, -1.800282, 1, 0.1568628, 0, 1,
-1.984784, -2.448323, -1.698051, 1, 0.1607843, 0, 1,
-1.937456, 0.8688031, -0.0933494, 1, 0.1686275, 0, 1,
-1.935578, 0.1882187, -1.433508, 1, 0.172549, 0, 1,
-1.933799, -1.817739, -3.356049, 1, 0.1803922, 0, 1,
-1.927943, 0.02777248, -4.204576, 1, 0.1843137, 0, 1,
-1.903162, 1.280625, -0.8251148, 1, 0.1921569, 0, 1,
-1.89984, -0.4558244, -2.402148, 1, 0.1960784, 0, 1,
-1.875534, -1.057954, -0.8912047, 1, 0.2039216, 0, 1,
-1.874592, -1.246971, -3.014351, 1, 0.2117647, 0, 1,
-1.85454, 1.368627, -0.5792227, 1, 0.2156863, 0, 1,
-1.847672, 0.006072183, -2.931001, 1, 0.2235294, 0, 1,
-1.837069, 0.8841968, -1.891613, 1, 0.227451, 0, 1,
-1.811331, -0.4287441, -1.65917, 1, 0.2352941, 0, 1,
-1.787322, -0.6260647, -0.7632036, 1, 0.2392157, 0, 1,
-1.783274, -1.077389, -3.293737, 1, 0.2470588, 0, 1,
-1.755989, -0.4903335, -2.014194, 1, 0.2509804, 0, 1,
-1.744303, 0.8183039, -1.842813, 1, 0.2588235, 0, 1,
-1.72761, -0.1612268, -3.823152, 1, 0.2627451, 0, 1,
-1.725214, 0.5354894, -1.917085, 1, 0.2705882, 0, 1,
-1.722873, -0.6520369, -2.240365, 1, 0.2745098, 0, 1,
-1.71547, 0.5319052, -2.029768, 1, 0.282353, 0, 1,
-1.713328, 1.001872, -1.216843, 1, 0.2862745, 0, 1,
-1.703837, -0.5328789, -2.488108, 1, 0.2941177, 0, 1,
-1.701762, -0.9338881, -0.8728771, 1, 0.3019608, 0, 1,
-1.672737, 2.565521, -0.7223775, 1, 0.3058824, 0, 1,
-1.664804, -0.7186835, -2.07436, 1, 0.3137255, 0, 1,
-1.658957, -0.4535244, -2.824617, 1, 0.3176471, 0, 1,
-1.658939, 0.2394776, -0.563592, 1, 0.3254902, 0, 1,
-1.641983, -0.3792521, -3.408421, 1, 0.3294118, 0, 1,
-1.614932, -1.026692, -3.382552, 1, 0.3372549, 0, 1,
-1.594107, 0.1338967, 0.002696512, 1, 0.3411765, 0, 1,
-1.576627, 0.743964, -1.314317, 1, 0.3490196, 0, 1,
-1.569506, -1.2062, -2.549039, 1, 0.3529412, 0, 1,
-1.566155, 0.6602172, -2.79164, 1, 0.3607843, 0, 1,
-1.55886, 1.663209, -0.2879265, 1, 0.3647059, 0, 1,
-1.558172, -0.1239953, -0.3530045, 1, 0.372549, 0, 1,
-1.557843, -1.092821, -2.413763, 1, 0.3764706, 0, 1,
-1.5468, 0.4818272, -1.242086, 1, 0.3843137, 0, 1,
-1.546162, 0.56628, -1.121142, 1, 0.3882353, 0, 1,
-1.534798, 2.200345, -0.4259983, 1, 0.3960784, 0, 1,
-1.53174, 1.703746, -0.1688933, 1, 0.4039216, 0, 1,
-1.529852, -0.8226214, -2.003892, 1, 0.4078431, 0, 1,
-1.529152, 1.026441, -0.4448024, 1, 0.4156863, 0, 1,
-1.505288, -0.7987842, -2.38901, 1, 0.4196078, 0, 1,
-1.501731, 0.226435, -1.258335, 1, 0.427451, 0, 1,
-1.501629, 0.8205364, 0.05690894, 1, 0.4313726, 0, 1,
-1.497411, 0.3422971, -1.093098, 1, 0.4392157, 0, 1,
-1.496117, 0.8366445, -2.037666, 1, 0.4431373, 0, 1,
-1.475942, -2.021483, -1.786334, 1, 0.4509804, 0, 1,
-1.453526, 0.5930066, -0.787785, 1, 0.454902, 0, 1,
-1.449954, 1.721171, -0.8548026, 1, 0.4627451, 0, 1,
-1.445431, -0.5417244, -1.197338, 1, 0.4666667, 0, 1,
-1.441308, 0.2713403, 0.08155299, 1, 0.4745098, 0, 1,
-1.438377, -0.8821973, -1.729873, 1, 0.4784314, 0, 1,
-1.435327, 1.596542, 0.1952042, 1, 0.4862745, 0, 1,
-1.423202, 0.3856749, -0.9487042, 1, 0.4901961, 0, 1,
-1.415723, -0.6324033, -2.181346, 1, 0.4980392, 0, 1,
-1.414987, -2.255363, -1.874314, 1, 0.5058824, 0, 1,
-1.408698, -0.4463862, -2.167098, 1, 0.509804, 0, 1,
-1.40536, 0.4075047, -1.601777, 1, 0.5176471, 0, 1,
-1.404347, 0.3901197, -2.643089, 1, 0.5215687, 0, 1,
-1.398397, -0.9156536, -2.456677, 1, 0.5294118, 0, 1,
-1.392536, -0.3821881, -1.126231, 1, 0.5333334, 0, 1,
-1.385849, 1.222469, -0.5153661, 1, 0.5411765, 0, 1,
-1.376953, 0.05933334, -3.119708, 1, 0.5450981, 0, 1,
-1.372831, 0.2952219, -0.5832155, 1, 0.5529412, 0, 1,
-1.369999, 1.281764, 1.074014, 1, 0.5568628, 0, 1,
-1.353795, -0.02499562, -1.530537, 1, 0.5647059, 0, 1,
-1.339516, 0.6795739, 0.00942083, 1, 0.5686275, 0, 1,
-1.339339, -1.746418, -1.598149, 1, 0.5764706, 0, 1,
-1.32951, -0.02750714, -1.172525, 1, 0.5803922, 0, 1,
-1.325337, 2.187815, -1.302832, 1, 0.5882353, 0, 1,
-1.32488, -1.03638, -2.567394, 1, 0.5921569, 0, 1,
-1.315252, 1.299725, 0.623512, 1, 0.6, 0, 1,
-1.297058, 0.4067025, -1.142402, 1, 0.6078432, 0, 1,
-1.289784, -0.795499, -0.9341208, 1, 0.6117647, 0, 1,
-1.287644, 0.2744412, -0.2593176, 1, 0.6196079, 0, 1,
-1.271866, -1.854507, -2.73812, 1, 0.6235294, 0, 1,
-1.247463, -1.027657, -2.319926, 1, 0.6313726, 0, 1,
-1.245289, -0.8208864, -1.069398, 1, 0.6352941, 0, 1,
-1.244135, -0.7391793, -1.828996, 1, 0.6431373, 0, 1,
-1.238532, 0.4427094, -1.881859, 1, 0.6470588, 0, 1,
-1.233824, -0.627136, -0.5821518, 1, 0.654902, 0, 1,
-1.233744, -0.3219468, -3.524138, 1, 0.6588235, 0, 1,
-1.219665, 0.5520772, -1.837165, 1, 0.6666667, 0, 1,
-1.217903, -0.8243281, -4.329327, 1, 0.6705883, 0, 1,
-1.210124, 1.266156, -1.229106, 1, 0.6784314, 0, 1,
-1.207382, -0.7933789, -2.04701, 1, 0.682353, 0, 1,
-1.207079, -1.967105, -3.452154, 1, 0.6901961, 0, 1,
-1.200387, 0.3964998, 0.01294518, 1, 0.6941177, 0, 1,
-1.196588, 0.8755128, -1.961071, 1, 0.7019608, 0, 1,
-1.186695, 0.07762574, -1.357165, 1, 0.7098039, 0, 1,
-1.184326, -0.3280782, -1.085899, 1, 0.7137255, 0, 1,
-1.181578, 1.211595, -0.5653837, 1, 0.7215686, 0, 1,
-1.176075, 0.3200789, -1.335869, 1, 0.7254902, 0, 1,
-1.172235, -1.443519, -0.1677386, 1, 0.7333333, 0, 1,
-1.167181, -0.3667467, -1.703745, 1, 0.7372549, 0, 1,
-1.142661, 0.04249319, 1.20341, 1, 0.7450981, 0, 1,
-1.142292, -1.003892, -2.349859, 1, 0.7490196, 0, 1,
-1.129399, 1.047879, -1.559499, 1, 0.7568628, 0, 1,
-1.126879, 0.01631496, -4.238616, 1, 0.7607843, 0, 1,
-1.118891, 0.1435323, -0.349702, 1, 0.7686275, 0, 1,
-1.094675, 0.8484818, -2.157033, 1, 0.772549, 0, 1,
-1.093143, -0.2983111, -0.5174938, 1, 0.7803922, 0, 1,
-1.08145, 1.991012, 1.142239, 1, 0.7843137, 0, 1,
-1.068783, -0.7486936, -1.298168, 1, 0.7921569, 0, 1,
-1.065793, 0.5377174, -1.445662, 1, 0.7960784, 0, 1,
-1.051813, -0.7167796, -3.044882, 1, 0.8039216, 0, 1,
-1.046541, -0.4851511, -2.013092, 1, 0.8117647, 0, 1,
-1.036973, 2.423289, -0.7964181, 1, 0.8156863, 0, 1,
-1.03162, 0.1320396, -0.09797396, 1, 0.8235294, 0, 1,
-1.026059, -0.2207971, -1.240037, 1, 0.827451, 0, 1,
-1.024729, -1.798408, -2.724055, 1, 0.8352941, 0, 1,
-1.021373, 0.3750665, -2.140311, 1, 0.8392157, 0, 1,
-1.020569, -1.047673, -1.809634, 1, 0.8470588, 0, 1,
-1.019995, 1.259427, -2.468655, 1, 0.8509804, 0, 1,
-1.015675, 0.4574401, -0.4513958, 1, 0.8588235, 0, 1,
-1.015199, 1.437926, 0.3764623, 1, 0.8627451, 0, 1,
-1.014299, -1.040121, -1.704692, 1, 0.8705882, 0, 1,
-1.013334, 0.5323377, -2.28049, 1, 0.8745098, 0, 1,
-1.010966, 0.3564672, -2.559646, 1, 0.8823529, 0, 1,
-0.99225, -1.458549, -2.695817, 1, 0.8862745, 0, 1,
-0.9920544, 0.1559746, 0.2114505, 1, 0.8941177, 0, 1,
-0.978673, -0.3972338, -2.235743, 1, 0.8980392, 0, 1,
-0.9778881, -0.6759428, 0.02723157, 1, 0.9058824, 0, 1,
-0.9672697, 1.846699, -1.332005, 1, 0.9137255, 0, 1,
-0.9624536, 0.9151232, -0.9564964, 1, 0.9176471, 0, 1,
-0.9590448, 1.875814, -1.216259, 1, 0.9254902, 0, 1,
-0.9563778, -1.512585, -3.432834, 1, 0.9294118, 0, 1,
-0.9524007, 0.4820307, -0.06344126, 1, 0.9372549, 0, 1,
-0.9479655, -1.859871, -3.146356, 1, 0.9411765, 0, 1,
-0.9417737, -0.6327612, -3.416453, 1, 0.9490196, 0, 1,
-0.9388719, 0.03153403, -1.514166, 1, 0.9529412, 0, 1,
-0.9305563, -0.5717868, -2.260012, 1, 0.9607843, 0, 1,
-0.928053, -3.624864, -3.132418, 1, 0.9647059, 0, 1,
-0.9263565, 0.5492052, -0.04438414, 1, 0.972549, 0, 1,
-0.9208007, -0.1255292, -2.207994, 1, 0.9764706, 0, 1,
-0.9179279, -0.6137671, -2.826544, 1, 0.9843137, 0, 1,
-0.9136629, -1.370274, -2.86836, 1, 0.9882353, 0, 1,
-0.9069811, 0.8346654, -1.213187, 1, 0.9960784, 0, 1,
-0.9036815, 1.552401, -0.7697247, 0.9960784, 1, 0, 1,
-0.8984339, 0.9838488, -1.170151, 0.9921569, 1, 0, 1,
-0.898257, 1.385881, -1.736881, 0.9843137, 1, 0, 1,
-0.898199, -0.5513729, -2.83168, 0.9803922, 1, 0, 1,
-0.8969792, -1.775306, -1.076272, 0.972549, 1, 0, 1,
-0.8914624, 0.1523532, -1.813572, 0.9686275, 1, 0, 1,
-0.8908131, 1.026598, 0.6018628, 0.9607843, 1, 0, 1,
-0.8859684, 1.325282, -0.7120157, 0.9568627, 1, 0, 1,
-0.8850868, -1.204656, -5.406609, 0.9490196, 1, 0, 1,
-0.8843792, 0.5241006, -1.807802, 0.945098, 1, 0, 1,
-0.8807802, -0.6660765, -2.220247, 0.9372549, 1, 0, 1,
-0.8772053, 0.5139558, -2.10625, 0.9333333, 1, 0, 1,
-0.8740393, -0.3586897, -2.104726, 0.9254902, 1, 0, 1,
-0.872964, 0.1586803, -1.736673, 0.9215686, 1, 0, 1,
-0.8722692, -0.5174615, -2.995917, 0.9137255, 1, 0, 1,
-0.8718514, -1.028187, -1.332074, 0.9098039, 1, 0, 1,
-0.8713839, 1.303995, -1.074671, 0.9019608, 1, 0, 1,
-0.8698916, -0.1311107, -2.459097, 0.8941177, 1, 0, 1,
-0.8637514, 0.2118612, -0.06868245, 0.8901961, 1, 0, 1,
-0.8634745, -1.847504, -1.440055, 0.8823529, 1, 0, 1,
-0.8604575, 0.2120164, 0.9137195, 0.8784314, 1, 0, 1,
-0.8519329, -0.3132151, -1.28995, 0.8705882, 1, 0, 1,
-0.8507738, 1.815303, -0.5897682, 0.8666667, 1, 0, 1,
-0.8449473, -0.5494545, -3.463306, 0.8588235, 1, 0, 1,
-0.836818, -0.2330048, -2.062557, 0.854902, 1, 0, 1,
-0.8349181, -0.9366542, -0.9196975, 0.8470588, 1, 0, 1,
-0.8322526, 0.3016005, -1.886806, 0.8431373, 1, 0, 1,
-0.8311327, 0.08645921, 0.6750404, 0.8352941, 1, 0, 1,
-0.8254452, 1.089684, -0.2180075, 0.8313726, 1, 0, 1,
-0.8247152, -0.8869372, -1.684646, 0.8235294, 1, 0, 1,
-0.8170068, -1.7403, -3.290949, 0.8196079, 1, 0, 1,
-0.8108509, 0.7950755, -2.119244, 0.8117647, 1, 0, 1,
-0.8070617, 1.280337, -1.824919, 0.8078431, 1, 0, 1,
-0.8048753, 0.7290105, -1.822266, 0.8, 1, 0, 1,
-0.8010049, 0.2386944, -1.264828, 0.7921569, 1, 0, 1,
-0.7961638, -0.3308073, -2.984866, 0.7882353, 1, 0, 1,
-0.7908344, -0.3269197, -2.223142, 0.7803922, 1, 0, 1,
-0.7883829, 0.2486397, -3.500274, 0.7764706, 1, 0, 1,
-0.7801538, -1.389768, -2.021322, 0.7686275, 1, 0, 1,
-0.7782077, 0.5527049, -0.08771211, 0.7647059, 1, 0, 1,
-0.7769026, -0.2539791, -1.805358, 0.7568628, 1, 0, 1,
-0.774684, -0.5265586, -1.491407, 0.7529412, 1, 0, 1,
-0.7738356, 0.8425854, 0.9132942, 0.7450981, 1, 0, 1,
-0.7713812, 0.6824943, 1.036555, 0.7411765, 1, 0, 1,
-0.7692562, 1.378697, -1.203454, 0.7333333, 1, 0, 1,
-0.7646656, 0.0228828, -1.353502, 0.7294118, 1, 0, 1,
-0.756439, -0.7442536, -1.379053, 0.7215686, 1, 0, 1,
-0.7555911, -0.15954, -2.430722, 0.7176471, 1, 0, 1,
-0.7459616, -0.9036025, -1.820105, 0.7098039, 1, 0, 1,
-0.7437925, 0.6071376, -2.061096, 0.7058824, 1, 0, 1,
-0.7422613, -0.1745005, -1.083721, 0.6980392, 1, 0, 1,
-0.7397363, -0.5954554, -3.469076, 0.6901961, 1, 0, 1,
-0.7379473, -0.9407799, -3.420588, 0.6862745, 1, 0, 1,
-0.7341271, -0.4469298, -4.213243, 0.6784314, 1, 0, 1,
-0.7302077, -0.8490802, -1.744642, 0.6745098, 1, 0, 1,
-0.7267755, 0.7163581, -1.409226, 0.6666667, 1, 0, 1,
-0.7196474, 0.8852521, -0.7439628, 0.6627451, 1, 0, 1,
-0.7156201, -0.7617937, -2.858567, 0.654902, 1, 0, 1,
-0.7117849, -0.2162878, -1.689682, 0.6509804, 1, 0, 1,
-0.7080915, 0.5481756, -1.975833, 0.6431373, 1, 0, 1,
-0.7060426, 0.3072456, -2.239066, 0.6392157, 1, 0, 1,
-0.705533, -2.258472, -3.450478, 0.6313726, 1, 0, 1,
-0.7029713, 0.346826, -1.997038, 0.627451, 1, 0, 1,
-0.7012236, -0.5695593, -2.029077, 0.6196079, 1, 0, 1,
-0.700071, 1.726317, 0.2111933, 0.6156863, 1, 0, 1,
-0.6973643, -0.7918801, -3.095845, 0.6078432, 1, 0, 1,
-0.6970803, -0.04274387, -2.421261, 0.6039216, 1, 0, 1,
-0.6918697, 0.1363601, -0.8233012, 0.5960785, 1, 0, 1,
-0.690326, -1.54117, -0.8587884, 0.5882353, 1, 0, 1,
-0.6889515, -1.237347, -3.102451, 0.5843138, 1, 0, 1,
-0.6798971, -0.989642, -2.891369, 0.5764706, 1, 0, 1,
-0.6740265, -1.239407, -3.341438, 0.572549, 1, 0, 1,
-0.6667187, 0.7976969, -0.4638422, 0.5647059, 1, 0, 1,
-0.6601326, 0.8172416, -3.678133, 0.5607843, 1, 0, 1,
-0.6583359, 2.053306, -0.2316711, 0.5529412, 1, 0, 1,
-0.6575614, 0.9321563, 0.808317, 0.5490196, 1, 0, 1,
-0.6558062, -0.0944792, -0.9793332, 0.5411765, 1, 0, 1,
-0.6557266, 1.13756, -0.7722248, 0.5372549, 1, 0, 1,
-0.6505755, -0.008735444, -1.623937, 0.5294118, 1, 0, 1,
-0.6471184, -0.7137222, -3.245678, 0.5254902, 1, 0, 1,
-0.6389869, -0.1632665, -2.325003, 0.5176471, 1, 0, 1,
-0.6370443, -0.1932304, -1.038503, 0.5137255, 1, 0, 1,
-0.6326672, 0.4470159, -0.4917372, 0.5058824, 1, 0, 1,
-0.6263785, -0.8358663, -0.4886246, 0.5019608, 1, 0, 1,
-0.6227822, 1.793466, 0.04120339, 0.4941176, 1, 0, 1,
-0.6206958, -0.7741783, -2.648259, 0.4862745, 1, 0, 1,
-0.6194101, 1.244912, -1.96359, 0.4823529, 1, 0, 1,
-0.6166673, 1.094411, -0.3897379, 0.4745098, 1, 0, 1,
-0.6149481, -0.147083, -1.223411, 0.4705882, 1, 0, 1,
-0.6098204, 0.3128123, -1.18545, 0.4627451, 1, 0, 1,
-0.6095319, -0.5000778, -3.983526, 0.4588235, 1, 0, 1,
-0.603522, -0.1211932, -1.298082, 0.4509804, 1, 0, 1,
-0.601593, 0.0842301, 0.2847509, 0.4470588, 1, 0, 1,
-0.6012689, 0.1521769, -3.368305, 0.4392157, 1, 0, 1,
-0.5941731, -0.2755144, -2.924762, 0.4352941, 1, 0, 1,
-0.587689, 0.9901868, 0.5572229, 0.427451, 1, 0, 1,
-0.5850943, -0.2633062, -2.689678, 0.4235294, 1, 0, 1,
-0.5846587, 0.994812, 1.091113, 0.4156863, 1, 0, 1,
-0.5830768, 0.2844195, -0.07819717, 0.4117647, 1, 0, 1,
-0.5818352, 0.9849157, 0.4214737, 0.4039216, 1, 0, 1,
-0.5782648, 1.282855, -1.715233, 0.3960784, 1, 0, 1,
-0.5773178, -0.1432739, -3.182954, 0.3921569, 1, 0, 1,
-0.572978, -0.8715463, -1.446588, 0.3843137, 1, 0, 1,
-0.5715806, -0.1314351, -1.183289, 0.3803922, 1, 0, 1,
-0.5685868, 0.8303985, 0.6110286, 0.372549, 1, 0, 1,
-0.5670712, -0.4972418, -2.256936, 0.3686275, 1, 0, 1,
-0.5604336, -0.3306776, -1.915364, 0.3607843, 1, 0, 1,
-0.5583677, 0.6269677, 0.06896318, 0.3568628, 1, 0, 1,
-0.552204, -0.3909898, -2.382141, 0.3490196, 1, 0, 1,
-0.5516781, -0.3710363, -2.117717, 0.345098, 1, 0, 1,
-0.5494703, 1.26013, -0.7210915, 0.3372549, 1, 0, 1,
-0.5494558, 0.759095, -1.587187, 0.3333333, 1, 0, 1,
-0.5452426, 0.2849887, -0.5008074, 0.3254902, 1, 0, 1,
-0.544119, 0.4625952, -4.090223, 0.3215686, 1, 0, 1,
-0.5436161, 1.017206, 1.109581, 0.3137255, 1, 0, 1,
-0.5435624, 1.97689, -1.968337, 0.3098039, 1, 0, 1,
-0.5397354, 0.4235281, -1.115762, 0.3019608, 1, 0, 1,
-0.5387464, 0.8438948, -0.9123032, 0.2941177, 1, 0, 1,
-0.538384, -1.340854, -1.886604, 0.2901961, 1, 0, 1,
-0.5340829, 0.3439156, -2.172216, 0.282353, 1, 0, 1,
-0.5337148, 0.300724, 0.116032, 0.2784314, 1, 0, 1,
-0.5327386, 0.2110993, -1.640073, 0.2705882, 1, 0, 1,
-0.5297007, -0.6421099, -2.324764, 0.2666667, 1, 0, 1,
-0.52376, 0.3360515, -1.092488, 0.2588235, 1, 0, 1,
-0.5192828, 0.4034525, -0.057744, 0.254902, 1, 0, 1,
-0.5124847, 1.043186, -0.561359, 0.2470588, 1, 0, 1,
-0.5105864, 0.723623, 1.510961, 0.2431373, 1, 0, 1,
-0.5051565, -0.4690547, -0.3759336, 0.2352941, 1, 0, 1,
-0.5046154, 1.752016, 0.2429919, 0.2313726, 1, 0, 1,
-0.4979737, 0.1293532, -2.276548, 0.2235294, 1, 0, 1,
-0.4950447, 0.8555028, 0.2038909, 0.2196078, 1, 0, 1,
-0.4870982, 2.105062, 0.2112007, 0.2117647, 1, 0, 1,
-0.4820256, -0.2848094, -2.40328, 0.2078431, 1, 0, 1,
-0.477269, 0.2083371, -0.9356289, 0.2, 1, 0, 1,
-0.477138, -1.107742, -4.254682, 0.1921569, 1, 0, 1,
-0.4749446, -0.08281908, -3.331846, 0.1882353, 1, 0, 1,
-0.465496, -1.227564, -2.257152, 0.1803922, 1, 0, 1,
-0.4606614, -0.6029315, -2.730558, 0.1764706, 1, 0, 1,
-0.4604352, -0.5961857, -2.529305, 0.1686275, 1, 0, 1,
-0.4572491, -1.065146, -1.734442, 0.1647059, 1, 0, 1,
-0.4557792, -1.523444, -3.282016, 0.1568628, 1, 0, 1,
-0.4548968, 2.063488, -0.7541752, 0.1529412, 1, 0, 1,
-0.4501051, 0.9337069, -0.6184658, 0.145098, 1, 0, 1,
-0.4451853, 1.943928, 0.2668316, 0.1411765, 1, 0, 1,
-0.4437286, -0.3803725, -3.587712, 0.1333333, 1, 0, 1,
-0.4423862, -2.336699, -2.148092, 0.1294118, 1, 0, 1,
-0.4416036, -0.6683081, -3.153623, 0.1215686, 1, 0, 1,
-0.4395531, -0.7993722, -2.392571, 0.1176471, 1, 0, 1,
-0.4358898, -1.753812, -3.700632, 0.1098039, 1, 0, 1,
-0.4288422, -0.2102381, -1.471774, 0.1058824, 1, 0, 1,
-0.4258662, 0.5788599, -1.501706, 0.09803922, 1, 0, 1,
-0.4256138, 1.618052, -0.162074, 0.09019608, 1, 0, 1,
-0.4213308, -1.586957, -2.065645, 0.08627451, 1, 0, 1,
-0.4196773, -0.1544476, -1.592266, 0.07843138, 1, 0, 1,
-0.4045599, -0.9924341, -4.112952, 0.07450981, 1, 0, 1,
-0.4013239, 1.617284, 0.2689001, 0.06666667, 1, 0, 1,
-0.3967392, -0.2583983, -2.52517, 0.0627451, 1, 0, 1,
-0.3896418, 0.844072, 0.1631871, 0.05490196, 1, 0, 1,
-0.3883808, 0.1517126, -1.318406, 0.05098039, 1, 0, 1,
-0.3880446, -0.1471792, 0.8120558, 0.04313726, 1, 0, 1,
-0.3841943, -0.1820101, -0.6314811, 0.03921569, 1, 0, 1,
-0.3786731, -1.06476, -4.111925, 0.03137255, 1, 0, 1,
-0.3683087, -0.472156, -3.780611, 0.02745098, 1, 0, 1,
-0.3681422, 0.9353142, -0.9513355, 0.01960784, 1, 0, 1,
-0.3678814, -0.3211141, -0.08814624, 0.01568628, 1, 0, 1,
-0.3587755, 0.4108623, -0.009200133, 0.007843138, 1, 0, 1,
-0.3571995, 0.2113643, -2.142923, 0.003921569, 1, 0, 1,
-0.3552558, -1.653243, -4.732315, 0, 1, 0.003921569, 1,
-0.3545336, -0.3602977, -3.290663, 0, 1, 0.01176471, 1,
-0.3544839, 1.343183, 0.04574043, 0, 1, 0.01568628, 1,
-0.3512813, -1.322381, -3.810521, 0, 1, 0.02352941, 1,
-0.351139, 0.657304, -0.2496586, 0, 1, 0.02745098, 1,
-0.3503664, -0.5723574, -1.975418, 0, 1, 0.03529412, 1,
-0.3495935, 0.7433363, 0.2029518, 0, 1, 0.03921569, 1,
-0.342615, 1.78423, -0.6389984, 0, 1, 0.04705882, 1,
-0.3422374, 1.061462, -0.8978527, 0, 1, 0.05098039, 1,
-0.3403461, 1.089393, 0.4749067, 0, 1, 0.05882353, 1,
-0.3390238, -0.1042209, -2.42525, 0, 1, 0.0627451, 1,
-0.3308079, 1.414102, -1.557843, 0, 1, 0.07058824, 1,
-0.3304689, -2.051727, -3.884546, 0, 1, 0.07450981, 1,
-0.3234309, -0.319661, -0.6277978, 0, 1, 0.08235294, 1,
-0.3232861, -0.02808018, -0.6401194, 0, 1, 0.08627451, 1,
-0.3205973, 1.282493, 0.1346108, 0, 1, 0.09411765, 1,
-0.3198369, -0.219759, -1.796384, 0, 1, 0.1019608, 1,
-0.3195476, -0.6393416, -1.706813, 0, 1, 0.1058824, 1,
-0.3092465, -1.524796, -3.384948, 0, 1, 0.1137255, 1,
-0.307554, 0.3080492, -2.225252, 0, 1, 0.1176471, 1,
-0.3037324, -0.4532176, -3.889826, 0, 1, 0.1254902, 1,
-0.3006545, 0.934778, -2.413855, 0, 1, 0.1294118, 1,
-0.2984358, -0.00233715, -2.785922, 0, 1, 0.1372549, 1,
-0.2974025, -0.511119, -2.520179, 0, 1, 0.1411765, 1,
-0.2928245, 2.532724, 1.244354, 0, 1, 0.1490196, 1,
-0.2910123, 0.1673121, -1.566745, 0, 1, 0.1529412, 1,
-0.2897999, 0.4198753, -0.125813, 0, 1, 0.1607843, 1,
-0.2820916, -0.1200883, -1.475658, 0, 1, 0.1647059, 1,
-0.2806402, -0.2300293, -2.640491, 0, 1, 0.172549, 1,
-0.2787858, 1.518081, 0.7793587, 0, 1, 0.1764706, 1,
-0.277611, 1.76203, 1.120314, 0, 1, 0.1843137, 1,
-0.2723044, 0.4686228, -1.711441, 0, 1, 0.1882353, 1,
-0.2702607, 0.5971942, 0.5486152, 0, 1, 0.1960784, 1,
-0.2696659, -0.8537905, -1.820162, 0, 1, 0.2039216, 1,
-0.2658317, 0.5750571, 0.4900358, 0, 1, 0.2078431, 1,
-0.263411, 0.8078244, 0.6668389, 0, 1, 0.2156863, 1,
-0.2628469, -0.08764447, -0.05490835, 0, 1, 0.2196078, 1,
-0.2619101, 0.1306091, -1.788322, 0, 1, 0.227451, 1,
-0.2595368, -0.06597918, -1.848463, 0, 1, 0.2313726, 1,
-0.2572774, 0.2125042, -0.9868687, 0, 1, 0.2392157, 1,
-0.2553806, 0.09861831, -0.9918954, 0, 1, 0.2431373, 1,
-0.2520081, 0.729337, -0.5540491, 0, 1, 0.2509804, 1,
-0.251567, -0.5918754, -3.491493, 0, 1, 0.254902, 1,
-0.2510088, -0.3645746, -2.130518, 0, 1, 0.2627451, 1,
-0.2495249, 0.06559303, -2.264507, 0, 1, 0.2666667, 1,
-0.2483009, 0.2061569, -2.994519, 0, 1, 0.2745098, 1,
-0.2414672, -0.06945129, -2.488126, 0, 1, 0.2784314, 1,
-0.2412116, -0.1487274, -3.781615, 0, 1, 0.2862745, 1,
-0.2391076, -1.056152, -3.063967, 0, 1, 0.2901961, 1,
-0.2381684, -0.2829681, -1.676159, 0, 1, 0.2980392, 1,
-0.2331494, 0.954143, -0.5714459, 0, 1, 0.3058824, 1,
-0.2321212, -0.01414972, -2.791095, 0, 1, 0.3098039, 1,
-0.2320084, 1.70346, 0.009797499, 0, 1, 0.3176471, 1,
-0.2282492, 0.2533855, -1.213238, 0, 1, 0.3215686, 1,
-0.2282412, -1.017871, -2.114292, 0, 1, 0.3294118, 1,
-0.2261419, 0.7685841, 0.5643409, 0, 1, 0.3333333, 1,
-0.2245386, -0.5873745, -3.232335, 0, 1, 0.3411765, 1,
-0.2239032, 0.23573, -0.515835, 0, 1, 0.345098, 1,
-0.2234021, -1.523884, -3.128928, 0, 1, 0.3529412, 1,
-0.2112996, -0.03436894, -2.066498, 0, 1, 0.3568628, 1,
-0.2098354, 1.555381, 1.519185, 0, 1, 0.3647059, 1,
-0.2072294, 0.4835556, 0.2178741, 0, 1, 0.3686275, 1,
-0.2067769, 0.2475756, -1.511109, 0, 1, 0.3764706, 1,
-0.2013953, 0.5162496, 1.306176, 0, 1, 0.3803922, 1,
-0.1962002, -0.6005974, -2.322467, 0, 1, 0.3882353, 1,
-0.1956906, 0.1520435, -2.012332, 0, 1, 0.3921569, 1,
-0.1943313, -0.7496808, -3.157801, 0, 1, 0.4, 1,
-0.1905909, 0.3740295, 0.5968531, 0, 1, 0.4078431, 1,
-0.1878704, 0.0100443, -1.237668, 0, 1, 0.4117647, 1,
-0.1859893, 1.978076, -0.403398, 0, 1, 0.4196078, 1,
-0.1816484, 0.8122638, -0.523576, 0, 1, 0.4235294, 1,
-0.18073, -0.04860525, -1.577469, 0, 1, 0.4313726, 1,
-0.1789419, 0.1616772, -0.7235622, 0, 1, 0.4352941, 1,
-0.1742236, -0.2468173, -1.359793, 0, 1, 0.4431373, 1,
-0.1730581, -0.08492897, -2.553501, 0, 1, 0.4470588, 1,
-0.1720164, 1.108554, 0.8808091, 0, 1, 0.454902, 1,
-0.1719231, -0.5055948, -3.33367, 0, 1, 0.4588235, 1,
-0.1718212, -0.2527642, -2.927477, 0, 1, 0.4666667, 1,
-0.1709441, -0.800701, -2.693773, 0, 1, 0.4705882, 1,
-0.1669561, 0.3054265, -1.209046, 0, 1, 0.4784314, 1,
-0.1649724, 0.7468831, -1.261125, 0, 1, 0.4823529, 1,
-0.1622339, -0.5630393, -2.772823, 0, 1, 0.4901961, 1,
-0.1618149, -0.1043292, -2.19159, 0, 1, 0.4941176, 1,
-0.1585441, -1.323247, -3.418365, 0, 1, 0.5019608, 1,
-0.158296, -0.8545951, -3.721948, 0, 1, 0.509804, 1,
-0.1579214, -0.4283868, -2.848492, 0, 1, 0.5137255, 1,
-0.155865, 0.5124992, 0.1680523, 0, 1, 0.5215687, 1,
-0.1558018, -0.9417713, -1.453751, 0, 1, 0.5254902, 1,
-0.1503523, 1.147459, 0.240837, 0, 1, 0.5333334, 1,
-0.1494524, 0.9397219, 0.2041231, 0, 1, 0.5372549, 1,
-0.1490726, 0.2137621, -2.3304, 0, 1, 0.5450981, 1,
-0.1489146, -0.5195315, -2.830348, 0, 1, 0.5490196, 1,
-0.1407366, 0.1825299, -0.1018855, 0, 1, 0.5568628, 1,
-0.1399638, 0.3883725, -0.5294051, 0, 1, 0.5607843, 1,
-0.1363769, 1.857453, -0.9277595, 0, 1, 0.5686275, 1,
-0.1342641, 2.081398, 1.379818, 0, 1, 0.572549, 1,
-0.1263001, 0.6076159, -0.4555971, 0, 1, 0.5803922, 1,
-0.1206343, 1.382709, 1.951673, 0, 1, 0.5843138, 1,
-0.1194409, 0.7841188, 1.64494, 0, 1, 0.5921569, 1,
-0.1062246, 1.420166, 1.962566, 0, 1, 0.5960785, 1,
-0.1058618, -1.271747, -1.978126, 0, 1, 0.6039216, 1,
-0.09662455, 1.910922, -0.7576131, 0, 1, 0.6117647, 1,
-0.09479937, -0.4011669, -2.739029, 0, 1, 0.6156863, 1,
-0.09319139, 0.5353538, 1.211335, 0, 1, 0.6235294, 1,
-0.0905979, -0.3468416, -3.442986, 0, 1, 0.627451, 1,
-0.08942513, 0.06284529, -1.299753, 0, 1, 0.6352941, 1,
-0.08930618, 0.08365863, -2.181414, 0, 1, 0.6392157, 1,
-0.08779498, -0.9838156, -4.627891, 0, 1, 0.6470588, 1,
-0.08482171, 0.2762775, -2.216667, 0, 1, 0.6509804, 1,
-0.08140348, 0.7125232, 1.306821, 0, 1, 0.6588235, 1,
-0.07724887, 0.4950188, -0.6350765, 0, 1, 0.6627451, 1,
-0.07476102, -0.2741009, -2.728718, 0, 1, 0.6705883, 1,
-0.074674, 2.637847, 0.2616568, 0, 1, 0.6745098, 1,
-0.07271431, 0.5131622, 0.5993663, 0, 1, 0.682353, 1,
-0.07143507, -1.828173, -3.61734, 0, 1, 0.6862745, 1,
-0.07108537, -0.756192, -2.738381, 0, 1, 0.6941177, 1,
-0.0700241, 0.5893223, 1.778989, 0, 1, 0.7019608, 1,
-0.06895989, -0.8546575, -2.817745, 0, 1, 0.7058824, 1,
-0.06403384, -0.04618289, -2.782608, 0, 1, 0.7137255, 1,
-0.06396428, 1.918924, -0.09700408, 0, 1, 0.7176471, 1,
-0.06278872, -0.4400792, -4.576766, 0, 1, 0.7254902, 1,
-0.06212011, -0.545122, -3.089141, 0, 1, 0.7294118, 1,
-0.05695647, -0.4948416, -4.118787, 0, 1, 0.7372549, 1,
-0.05613026, -0.7443281, -4.306871, 0, 1, 0.7411765, 1,
-0.0555849, -0.1075071, -3.317695, 0, 1, 0.7490196, 1,
-0.05474863, 0.9530537, 0.4781885, 0, 1, 0.7529412, 1,
-0.05460243, 1.669624, 1.557215, 0, 1, 0.7607843, 1,
-0.05370085, 0.1488088, -2.147018, 0, 1, 0.7647059, 1,
-0.05271128, -1.282676, -3.504841, 0, 1, 0.772549, 1,
-0.05266196, 1.214572, 0.2111299, 0, 1, 0.7764706, 1,
-0.0520301, -0.732765, -2.451029, 0, 1, 0.7843137, 1,
-0.05188014, 0.9068925, 1.722589, 0, 1, 0.7882353, 1,
-0.05147924, 1.187801, 1.453294, 0, 1, 0.7960784, 1,
-0.0496191, -0.3355412, -2.267323, 0, 1, 0.8039216, 1,
-0.04536736, -1.209424, -3.750084, 0, 1, 0.8078431, 1,
-0.04319554, 0.3403946, -0.97047, 0, 1, 0.8156863, 1,
-0.04311393, -0.1004219, -2.903916, 0, 1, 0.8196079, 1,
-0.04220163, 0.1902475, -0.7499371, 0, 1, 0.827451, 1,
-0.04137655, -0.9382424, -4.081821, 0, 1, 0.8313726, 1,
-0.03799286, -0.7709109, -3.485988, 0, 1, 0.8392157, 1,
-0.03751891, 1.072708, -1.478204, 0, 1, 0.8431373, 1,
-0.03536144, -0.2573296, -3.323252, 0, 1, 0.8509804, 1,
-0.03491357, -0.2084547, -3.156843, 0, 1, 0.854902, 1,
-0.03281044, -0.902198, -2.850047, 0, 1, 0.8627451, 1,
-0.03167387, -0.5061216, -3.47016, 0, 1, 0.8666667, 1,
-0.03152535, 0.519659, 0.1591036, 0, 1, 0.8745098, 1,
-0.02586613, 0.9072747, -0.9507053, 0, 1, 0.8784314, 1,
-0.01652915, 0.9841628, -0.3038802, 0, 1, 0.8862745, 1,
-0.01565235, -0.9827098, -2.822838, 0, 1, 0.8901961, 1,
-0.01030246, -1.026281, -1.79566, 0, 1, 0.8980392, 1,
-0.009029687, 0.3878372, -1.213472, 0, 1, 0.9058824, 1,
-0.004470997, 0.2535585, 0.08275719, 0, 1, 0.9098039, 1,
-0.0002564826, 1.806542, 1.415167, 0, 1, 0.9176471, 1,
0.0007863441, 0.8094683, -0.2340032, 0, 1, 0.9215686, 1,
0.00428897, 1.711245, 0.2836581, 0, 1, 0.9294118, 1,
0.005016695, -0.002914926, 2.712347, 0, 1, 0.9333333, 1,
0.01335929, -0.586014, 2.943352, 0, 1, 0.9411765, 1,
0.01358781, 0.2998099, -0.7316456, 0, 1, 0.945098, 1,
0.01739071, 0.904799, 0.4954888, 0, 1, 0.9529412, 1,
0.01975961, -1.992072, 3.273735, 0, 1, 0.9568627, 1,
0.02266202, -0.933126, 4.434764, 0, 1, 0.9647059, 1,
0.02593123, 1.123691, 0.6438192, 0, 1, 0.9686275, 1,
0.02618775, 0.8609844, 0.6321594, 0, 1, 0.9764706, 1,
0.02648482, -0.8076995, 3.340148, 0, 1, 0.9803922, 1,
0.02696946, 0.09161055, 1.763971, 0, 1, 0.9882353, 1,
0.02807289, 1.092547, -0.8495259, 0, 1, 0.9921569, 1,
0.02816563, -0.5174145, 2.946689, 0, 1, 1, 1,
0.03010605, -1.170044, 2.987675, 0, 0.9921569, 1, 1,
0.03141682, -1.137259, 5.189524, 0, 0.9882353, 1, 1,
0.03181748, -1.370935, 3.533268, 0, 0.9803922, 1, 1,
0.03190431, -0.1414191, 1.477061, 0, 0.9764706, 1, 1,
0.03728321, -1.026063, 4.588187, 0, 0.9686275, 1, 1,
0.03812948, 1.763824, -1.153672, 0, 0.9647059, 1, 1,
0.0439479, 1.011122, -1.044888, 0, 0.9568627, 1, 1,
0.05025091, 0.3116639, -0.1083985, 0, 0.9529412, 1, 1,
0.05084603, 0.8244678, 0.57853, 0, 0.945098, 1, 1,
0.05135685, 1.297505, -0.2140806, 0, 0.9411765, 1, 1,
0.05219667, 0.8007677, -0.4735345, 0, 0.9333333, 1, 1,
0.05416688, 0.8137245, 1.849035, 0, 0.9294118, 1, 1,
0.06083339, -0.1523747, 2.236666, 0, 0.9215686, 1, 1,
0.06172656, -0.4946171, 3.800604, 0, 0.9176471, 1, 1,
0.06210706, 0.9162805, -0.1830784, 0, 0.9098039, 1, 1,
0.06322747, 1.666252, -1.415025, 0, 0.9058824, 1, 1,
0.06750334, -0.2048927, 3.032337, 0, 0.8980392, 1, 1,
0.07096577, -0.3080911, 3.940286, 0, 0.8901961, 1, 1,
0.07130934, 0.03545213, 0.5364575, 0, 0.8862745, 1, 1,
0.07638876, 0.09792103, 3.227882, 0, 0.8784314, 1, 1,
0.07807763, -1.807728, 3.134204, 0, 0.8745098, 1, 1,
0.08019879, 1.419784, 1.687501, 0, 0.8666667, 1, 1,
0.08252931, 0.08740629, 1.204979, 0, 0.8627451, 1, 1,
0.08761913, 0.134037, 1.023048, 0, 0.854902, 1, 1,
0.08860116, -0.459249, 3.142004, 0, 0.8509804, 1, 1,
0.08863957, -1.861049, 4.799964, 0, 0.8431373, 1, 1,
0.09285606, -0.1970253, 1.839208, 0, 0.8392157, 1, 1,
0.09648818, 1.975687, -0.3871128, 0, 0.8313726, 1, 1,
0.09928428, -2.024276, 4.646384, 0, 0.827451, 1, 1,
0.1050682, 0.2665074, 1.16506, 0, 0.8196079, 1, 1,
0.1081216, -0.7383128, 1.956377, 0, 0.8156863, 1, 1,
0.1089406, 0.3391108, 0.2587068, 0, 0.8078431, 1, 1,
0.1100658, -0.1097024, 1.064643, 0, 0.8039216, 1, 1,
0.1167815, -0.3010368, 3.689206, 0, 0.7960784, 1, 1,
0.1181074, 0.2644916, -0.2067364, 0, 0.7882353, 1, 1,
0.12157, -0.8262977, 1.853684, 0, 0.7843137, 1, 1,
0.1254215, -0.7037836, 2.733969, 0, 0.7764706, 1, 1,
0.1285918, 0.1291899, 0.07126818, 0, 0.772549, 1, 1,
0.1313324, 0.4113773, -0.6645756, 0, 0.7647059, 1, 1,
0.1316716, 0.504167, 0.8914258, 0, 0.7607843, 1, 1,
0.1342806, 0.8878272, -0.04408998, 0, 0.7529412, 1, 1,
0.1343088, -0.4353162, 2.445692, 0, 0.7490196, 1, 1,
0.1392591, -0.4216365, 2.035574, 0, 0.7411765, 1, 1,
0.1394015, 0.4738685, -0.9032245, 0, 0.7372549, 1, 1,
0.14664, -0.1663733, 3.458207, 0, 0.7294118, 1, 1,
0.1483888, -0.4604377, 2.871875, 0, 0.7254902, 1, 1,
0.1497581, -0.3684873, 3.036428, 0, 0.7176471, 1, 1,
0.1508029, 1.056271, 0.4923142, 0, 0.7137255, 1, 1,
0.1587882, 1.501685, 0.8515412, 0, 0.7058824, 1, 1,
0.1624917, -0.2287283, 1.839462, 0, 0.6980392, 1, 1,
0.1633377, -3.266349, 4.713583, 0, 0.6941177, 1, 1,
0.1633431, -1.053961, 2.976057, 0, 0.6862745, 1, 1,
0.1646024, -0.6632323, 3.335895, 0, 0.682353, 1, 1,
0.16569, -0.5397068, 1.200451, 0, 0.6745098, 1, 1,
0.166588, -1.004954, 2.933782, 0, 0.6705883, 1, 1,
0.1667239, 1.199374, -1.267779, 0, 0.6627451, 1, 1,
0.1677107, -1.041821, 4.051886, 0, 0.6588235, 1, 1,
0.1677212, -0.1032233, 1.442109, 0, 0.6509804, 1, 1,
0.1701369, -1.249642, 2.790541, 0, 0.6470588, 1, 1,
0.1710395, 1.117085, 1.626539, 0, 0.6392157, 1, 1,
0.1711672, -1.294242, 2.942739, 0, 0.6352941, 1, 1,
0.1719783, 0.6736488, -0.8958827, 0, 0.627451, 1, 1,
0.1720788, 0.2271729, -0.2646444, 0, 0.6235294, 1, 1,
0.1721984, -1.369119, 1.851076, 0, 0.6156863, 1, 1,
0.1831619, 0.01948946, 2.075333, 0, 0.6117647, 1, 1,
0.1844959, -0.3966917, 0.3858612, 0, 0.6039216, 1, 1,
0.1854997, 0.2372258, 0.4498414, 0, 0.5960785, 1, 1,
0.1865067, 0.3625513, 0.9613808, 0, 0.5921569, 1, 1,
0.1908415, 0.162958, 2.327382, 0, 0.5843138, 1, 1,
0.194135, -0.5013527, 5.494962, 0, 0.5803922, 1, 1,
0.1980131, -0.1474319, 2.70831, 0, 0.572549, 1, 1,
0.2014218, 0.8521758, 0.04766866, 0, 0.5686275, 1, 1,
0.2046413, 0.483982, 0.5306367, 0, 0.5607843, 1, 1,
0.2047624, 0.2844582, 1.954762, 0, 0.5568628, 1, 1,
0.2065199, -0.205356, 0.8434345, 0, 0.5490196, 1, 1,
0.2141594, -0.01878103, 0.917913, 0, 0.5450981, 1, 1,
0.2143266, -0.9811114, 1.925571, 0, 0.5372549, 1, 1,
0.215578, 0.8954083, 1.50471, 0, 0.5333334, 1, 1,
0.2170834, -1.131722, 2.805018, 0, 0.5254902, 1, 1,
0.2223099, -0.2666276, 2.066673, 0, 0.5215687, 1, 1,
0.2266196, 0.3337871, 0.5819884, 0, 0.5137255, 1, 1,
0.2293164, 0.0733045, 1.983766, 0, 0.509804, 1, 1,
0.239903, -0.4615818, 4.523941, 0, 0.5019608, 1, 1,
0.2442733, -1.066423, 4.315682, 0, 0.4941176, 1, 1,
0.2458214, -0.738732, 2.194766, 0, 0.4901961, 1, 1,
0.2470938, -0.5180065, 2.596778, 0, 0.4823529, 1, 1,
0.2534733, 2.795789, 0.3609236, 0, 0.4784314, 1, 1,
0.2555332, 0.938894, 1.271209, 0, 0.4705882, 1, 1,
0.2575848, -0.3953879, 3.917417, 0, 0.4666667, 1, 1,
0.2587583, 1.25479, 1.532174, 0, 0.4588235, 1, 1,
0.2605494, 1.60029, -0.2953538, 0, 0.454902, 1, 1,
0.2610121, -0.07882412, 3.523103, 0, 0.4470588, 1, 1,
0.2619168, 0.4629746, -1.215725, 0, 0.4431373, 1, 1,
0.2633285, -0.1221347, 0.2191024, 0, 0.4352941, 1, 1,
0.2656223, -0.1269959, 2.197263, 0, 0.4313726, 1, 1,
0.2663814, -0.2194198, -0.309684, 0, 0.4235294, 1, 1,
0.2677557, 0.4878416, 0.606629, 0, 0.4196078, 1, 1,
0.2685652, -1.50568, 4.095539, 0, 0.4117647, 1, 1,
0.268924, 0.8946446, -1.479891, 0, 0.4078431, 1, 1,
0.2696718, 2.411902, -1.031895, 0, 0.4, 1, 1,
0.2714176, 1.073112, -0.6465967, 0, 0.3921569, 1, 1,
0.2732797, -0.7291987, 2.209456, 0, 0.3882353, 1, 1,
0.2763435, -2.412832, 3.634048, 0, 0.3803922, 1, 1,
0.2772842, -0.9845675, 1.836574, 0, 0.3764706, 1, 1,
0.2776453, -1.367791, 5.196986, 0, 0.3686275, 1, 1,
0.2788968, -0.3559298, 2.747772, 0, 0.3647059, 1, 1,
0.2802114, 0.4874406, 0.3516605, 0, 0.3568628, 1, 1,
0.2855265, 0.128206, 2.346946, 0, 0.3529412, 1, 1,
0.2878165, -0.8447198, 2.709536, 0, 0.345098, 1, 1,
0.2907207, 0.6580603, 0.971359, 0, 0.3411765, 1, 1,
0.2966758, 1.763435, -0.4133464, 0, 0.3333333, 1, 1,
0.3044415, 1.031879, -0.4774331, 0, 0.3294118, 1, 1,
0.3108965, -0.3318223, 2.506711, 0, 0.3215686, 1, 1,
0.3119325, 2.0381, 0.1091829, 0, 0.3176471, 1, 1,
0.3177935, 0.2174432, -0.1696789, 0, 0.3098039, 1, 1,
0.3213375, 0.7853083, -0.4490669, 0, 0.3058824, 1, 1,
0.3215762, -1.61337, 3.046039, 0, 0.2980392, 1, 1,
0.3266175, -0.2121241, 2.40287, 0, 0.2901961, 1, 1,
0.3284522, 0.8597808, -0.7977333, 0, 0.2862745, 1, 1,
0.329589, -2.164757, 1.998983, 0, 0.2784314, 1, 1,
0.3327322, -0.5944281, 4.847064, 0, 0.2745098, 1, 1,
0.3333963, 0.4957864, -0.8422852, 0, 0.2666667, 1, 1,
0.3353586, -1.781244, 1.507888, 0, 0.2627451, 1, 1,
0.3367328, -0.4305437, 2.65048, 0, 0.254902, 1, 1,
0.3394206, 1.733511, -1.177179, 0, 0.2509804, 1, 1,
0.339667, 0.4111697, 0.9617785, 0, 0.2431373, 1, 1,
0.3413558, 0.3221213, 0.9295232, 0, 0.2392157, 1, 1,
0.3444467, 1.265705, 0.06526989, 0, 0.2313726, 1, 1,
0.3458841, -0.2131535, 2.727075, 0, 0.227451, 1, 1,
0.346304, -0.7485469, 2.714732, 0, 0.2196078, 1, 1,
0.3503123, 0.8239692, -1.004921, 0, 0.2156863, 1, 1,
0.3504961, 0.249864, 1.02315, 0, 0.2078431, 1, 1,
0.3506132, 0.7716493, -0.2181599, 0, 0.2039216, 1, 1,
0.3512206, 0.9426543, -0.4091302, 0, 0.1960784, 1, 1,
0.3599235, -1.996417, 2.51264, 0, 0.1882353, 1, 1,
0.3624369, 1.644787, -1.249206, 0, 0.1843137, 1, 1,
0.362581, -0.05058268, 2.113558, 0, 0.1764706, 1, 1,
0.3660567, 0.7507113, 2.189582, 0, 0.172549, 1, 1,
0.3682888, -1.442797, 1.382517, 0, 0.1647059, 1, 1,
0.3708135, -0.5880226, 0.6942655, 0, 0.1607843, 1, 1,
0.3731275, -0.3579303, 2.82392, 0, 0.1529412, 1, 1,
0.3832147, 0.3437617, 1.918539, 0, 0.1490196, 1, 1,
0.3853891, 1.922166, 1.038975, 0, 0.1411765, 1, 1,
0.3884318, 1.233955, -0.4073906, 0, 0.1372549, 1, 1,
0.3913206, -1.618738, 1.653018, 0, 0.1294118, 1, 1,
0.3951627, -0.6818611, 3.89151, 0, 0.1254902, 1, 1,
0.3982769, -0.3957816, 2.044377, 0, 0.1176471, 1, 1,
0.4002044, -0.4314618, 3.047115, 0, 0.1137255, 1, 1,
0.4014082, 0.9477598, -0.02524491, 0, 0.1058824, 1, 1,
0.4028302, -0.4437412, 2.268365, 0, 0.09803922, 1, 1,
0.4056021, 0.8319153, 1.482365, 0, 0.09411765, 1, 1,
0.4066153, -0.6917597, 0.9436076, 0, 0.08627451, 1, 1,
0.4079081, 1.347591, 1.948969, 0, 0.08235294, 1, 1,
0.4112408, -0.7479978, 4.567977, 0, 0.07450981, 1, 1,
0.413066, 0.2715509, -0.1511488, 0, 0.07058824, 1, 1,
0.4217233, -2.050279, 2.605789, 0, 0.0627451, 1, 1,
0.4278116, 0.417245, 0.637383, 0, 0.05882353, 1, 1,
0.4281595, 0.2354658, -0.425288, 0, 0.05098039, 1, 1,
0.4285432, 0.3558787, 1.638095, 0, 0.04705882, 1, 1,
0.4288095, -0.4138718, 2.403168, 0, 0.03921569, 1, 1,
0.4307597, 0.03878692, 1.103366, 0, 0.03529412, 1, 1,
0.4376001, 0.2434513, 0.3607945, 0, 0.02745098, 1, 1,
0.4388512, -0.7072265, 2.448682, 0, 0.02352941, 1, 1,
0.4403331, -0.8750865, 3.242144, 0, 0.01568628, 1, 1,
0.4549575, 1.833454, 1.124943, 0, 0.01176471, 1, 1,
0.4553261, 0.5015594, -0.053901, 0, 0.003921569, 1, 1,
0.4562409, 0.383875, 0.291737, 0.003921569, 0, 1, 1,
0.4609098, -1.133573, 3.459834, 0.007843138, 0, 1, 1,
0.4627806, -0.439613, 3.658385, 0.01568628, 0, 1, 1,
0.4637865, 0.4657455, 1.313593, 0.01960784, 0, 1, 1,
0.4709722, -0.3914824, 2.878834, 0.02745098, 0, 1, 1,
0.4747859, -1.047964, 2.231102, 0.03137255, 0, 1, 1,
0.4756309, -0.2034677, 2.232878, 0.03921569, 0, 1, 1,
0.4770201, -0.3948206, 2.584785, 0.04313726, 0, 1, 1,
0.4843524, 1.202459, 0.4969164, 0.05098039, 0, 1, 1,
0.4877489, 0.4292988, 0.4736161, 0.05490196, 0, 1, 1,
0.4903737, 0.4425815, -0.6817673, 0.0627451, 0, 1, 1,
0.495907, 1.509695, -0.3085656, 0.06666667, 0, 1, 1,
0.4963893, -1.535591, 1.602869, 0.07450981, 0, 1, 1,
0.4965518, -0.2236208, 2.087783, 0.07843138, 0, 1, 1,
0.4991331, -0.2389452, 2.026704, 0.08627451, 0, 1, 1,
0.4994033, -0.7074219, 2.220641, 0.09019608, 0, 1, 1,
0.5031376, 0.7130629, 0.6945576, 0.09803922, 0, 1, 1,
0.5041419, -0.0255087, 0.9979665, 0.1058824, 0, 1, 1,
0.5106869, -0.5770255, 1.486658, 0.1098039, 0, 1, 1,
0.510849, 0.8122099, 1.325072, 0.1176471, 0, 1, 1,
0.5128859, 0.3721931, 1.213993, 0.1215686, 0, 1, 1,
0.5183859, -0.5707136, 2.59874, 0.1294118, 0, 1, 1,
0.5240264, 1.546553, 0.7989228, 0.1333333, 0, 1, 1,
0.5283138, -1.923599, 4.00076, 0.1411765, 0, 1, 1,
0.5290668, 0.5488873, 1.30818, 0.145098, 0, 1, 1,
0.5308111, 1.99022, 0.8736345, 0.1529412, 0, 1, 1,
0.5308362, 1.080693, 0.5932152, 0.1568628, 0, 1, 1,
0.531251, 0.3069249, -0.7131851, 0.1647059, 0, 1, 1,
0.533883, 0.506938, 0.2806915, 0.1686275, 0, 1, 1,
0.536826, 0.553785, 0.658429, 0.1764706, 0, 1, 1,
0.5373849, 0.7216941, -1.399822, 0.1803922, 0, 1, 1,
0.538802, 1.08871, -0.8456298, 0.1882353, 0, 1, 1,
0.5453019, 0.3345745, 2.206655, 0.1921569, 0, 1, 1,
0.5499933, 0.5721024, -0.3017104, 0.2, 0, 1, 1,
0.5500066, 0.668286, 0.3459648, 0.2078431, 0, 1, 1,
0.5527248, 0.4973606, -1.262053, 0.2117647, 0, 1, 1,
0.5529488, 0.6599044, -0.8147556, 0.2196078, 0, 1, 1,
0.5558516, 0.3557618, 1.17429, 0.2235294, 0, 1, 1,
0.5624609, 1.076518, -0.02272818, 0.2313726, 0, 1, 1,
0.5635417, 0.7456836, 1.294738, 0.2352941, 0, 1, 1,
0.5706978, 0.06460492, 0.2226097, 0.2431373, 0, 1, 1,
0.5718063, -0.608201, 0.6847939, 0.2470588, 0, 1, 1,
0.5788711, 0.4991751, 1.368742, 0.254902, 0, 1, 1,
0.5811465, -1.537585, 0.4004273, 0.2588235, 0, 1, 1,
0.5828076, -1.389805, 3.255395, 0.2666667, 0, 1, 1,
0.5851483, -1.725179, 1.575697, 0.2705882, 0, 1, 1,
0.5885204, -1.010534, 3.190556, 0.2784314, 0, 1, 1,
0.5961201, -1.49168, 4.540697, 0.282353, 0, 1, 1,
0.6002437, -0.4040617, 2.725806, 0.2901961, 0, 1, 1,
0.6030218, 0.04133335, 0.4588239, 0.2941177, 0, 1, 1,
0.6055615, -1.765825, 4.355876, 0.3019608, 0, 1, 1,
0.6127998, -0.06858844, 0.5547805, 0.3098039, 0, 1, 1,
0.6172101, -0.2832249, 3.005183, 0.3137255, 0, 1, 1,
0.6195493, 1.081965, 1.56187, 0.3215686, 0, 1, 1,
0.6212651, -1.16281, 2.67677, 0.3254902, 0, 1, 1,
0.6243156, 1.608854, -1.294028, 0.3333333, 0, 1, 1,
0.6244303, -1.391369, 4.540296, 0.3372549, 0, 1, 1,
0.6252101, 1.674325, -0.63721, 0.345098, 0, 1, 1,
0.6259697, -1.621589, 3.440803, 0.3490196, 0, 1, 1,
0.6275361, 0.6182533, 2.235018, 0.3568628, 0, 1, 1,
0.6278861, 1.041971, 1.692969, 0.3607843, 0, 1, 1,
0.6301693, 0.4077899, 1.600183, 0.3686275, 0, 1, 1,
0.6326222, 0.02982729, 0.6839007, 0.372549, 0, 1, 1,
0.6344103, 1.885729, 1.273054, 0.3803922, 0, 1, 1,
0.636802, 0.788966, -1.703268, 0.3843137, 0, 1, 1,
0.6383588, -0.8383392, 1.680399, 0.3921569, 0, 1, 1,
0.6393459, 2.062032, -0.04406258, 0.3960784, 0, 1, 1,
0.6523136, 1.318288, 1.363043, 0.4039216, 0, 1, 1,
0.6530144, 0.5838565, -0.2667056, 0.4117647, 0, 1, 1,
0.6536233, -0.3697142, 1.481901, 0.4156863, 0, 1, 1,
0.6599027, -0.8422881, 3.643557, 0.4235294, 0, 1, 1,
0.6659331, -0.5480166, -0.2057397, 0.427451, 0, 1, 1,
0.6728129, -0.3891164, 2.969352, 0.4352941, 0, 1, 1,
0.6749439, -1.418327, 2.754394, 0.4392157, 0, 1, 1,
0.6775647, 0.5973702, -0.1971088, 0.4470588, 0, 1, 1,
0.6831641, -0.7190759, 3.80261, 0.4509804, 0, 1, 1,
0.6940748, -0.02438702, 1.586373, 0.4588235, 0, 1, 1,
0.6949281, 0.4239681, 2.556854, 0.4627451, 0, 1, 1,
0.6958079, -2.141483, 3.974703, 0.4705882, 0, 1, 1,
0.6973393, -1.19357, 3.971237, 0.4745098, 0, 1, 1,
0.6993249, 0.1950493, -0.1176035, 0.4823529, 0, 1, 1,
0.7002053, -1.238699, 2.775975, 0.4862745, 0, 1, 1,
0.7019135, -0.9860245, 3.400515, 0.4941176, 0, 1, 1,
0.7040707, -0.7036331, 4.805474, 0.5019608, 0, 1, 1,
0.7045043, -1.640486, 3.119564, 0.5058824, 0, 1, 1,
0.7076598, 0.3713776, 1.210877, 0.5137255, 0, 1, 1,
0.7085121, -1.307825, 4.230046, 0.5176471, 0, 1, 1,
0.708746, -0.3189072, 0.03921829, 0.5254902, 0, 1, 1,
0.7092673, 0.1866743, 1.377801, 0.5294118, 0, 1, 1,
0.7146848, 0.2382579, 0.3195648, 0.5372549, 0, 1, 1,
0.7153552, 0.6343219, 0.5813258, 0.5411765, 0, 1, 1,
0.7177272, -0.8799706, 2.378309, 0.5490196, 0, 1, 1,
0.718739, -0.6742886, 2.310984, 0.5529412, 0, 1, 1,
0.720362, -0.224581, 1.663805, 0.5607843, 0, 1, 1,
0.7205632, -0.3383688, 1.111145, 0.5647059, 0, 1, 1,
0.7217675, -0.1430831, 3.014863, 0.572549, 0, 1, 1,
0.7248188, 0.7864717, -0.1839899, 0.5764706, 0, 1, 1,
0.7251173, -1.310034, 3.464865, 0.5843138, 0, 1, 1,
0.7258806, -0.4962499, 0.1521326, 0.5882353, 0, 1, 1,
0.7296699, -0.6238642, 3.95731, 0.5960785, 0, 1, 1,
0.7304527, 0.8253847, 1.197944, 0.6039216, 0, 1, 1,
0.7315021, -0.2144274, 0.187576, 0.6078432, 0, 1, 1,
0.7324468, 0.1108808, 1.408605, 0.6156863, 0, 1, 1,
0.7328448, -0.84462, 1.65948, 0.6196079, 0, 1, 1,
0.7344971, -0.8137664, 2.87299, 0.627451, 0, 1, 1,
0.7416238, -0.3909461, 1.212114, 0.6313726, 0, 1, 1,
0.7420593, -0.3818486, 1.513109, 0.6392157, 0, 1, 1,
0.7451565, 0.100957, 1.267159, 0.6431373, 0, 1, 1,
0.7465792, 0.3735664, 1.81615, 0.6509804, 0, 1, 1,
0.7466283, -2.248083, 2.640704, 0.654902, 0, 1, 1,
0.7483152, 1.351647, -0.1570121, 0.6627451, 0, 1, 1,
0.7487988, -0.9526062, 2.845097, 0.6666667, 0, 1, 1,
0.7546244, 0.6019545, -1.422768, 0.6745098, 0, 1, 1,
0.7648326, -0.2197303, 0.5454337, 0.6784314, 0, 1, 1,
0.7662871, -1.580318, 1.046531, 0.6862745, 0, 1, 1,
0.7722318, 1.382874, 0.203308, 0.6901961, 0, 1, 1,
0.7730917, 0.6900426, -0.3204326, 0.6980392, 0, 1, 1,
0.7769702, 1.635101, 1.219895, 0.7058824, 0, 1, 1,
0.7779811, -0.3960711, 1.617703, 0.7098039, 0, 1, 1,
0.7801557, 1.111216, 2.119383, 0.7176471, 0, 1, 1,
0.7808298, -0.5725936, 0.5473076, 0.7215686, 0, 1, 1,
0.7809314, -0.8557749, 1.139255, 0.7294118, 0, 1, 1,
0.7815284, -0.3844391, 1.782971, 0.7333333, 0, 1, 1,
0.7827345, -0.9467269, 2.047821, 0.7411765, 0, 1, 1,
0.7855629, -0.8529792, 1.947291, 0.7450981, 0, 1, 1,
0.7859287, -0.6260725, 1.622017, 0.7529412, 0, 1, 1,
0.7873408, -1.075756, 2.628697, 0.7568628, 0, 1, 1,
0.7883685, -0.5247879, 1.931247, 0.7647059, 0, 1, 1,
0.788865, -2.076876, 2.490697, 0.7686275, 0, 1, 1,
0.7891394, -1.419412, 3.430145, 0.7764706, 0, 1, 1,
0.7913772, -0.8999024, 0.6137351, 0.7803922, 0, 1, 1,
0.7921585, -1.733364, 2.857703, 0.7882353, 0, 1, 1,
0.792163, 1.368035, 0.5778452, 0.7921569, 0, 1, 1,
0.7935177, 0.7649207, -0.1093093, 0.8, 0, 1, 1,
0.8047444, -0.3563856, 1.426984, 0.8078431, 0, 1, 1,
0.8061593, -0.7484986, 1.462359, 0.8117647, 0, 1, 1,
0.8066162, -0.5084525, 2.840348, 0.8196079, 0, 1, 1,
0.8133904, 0.3717587, 1.607426, 0.8235294, 0, 1, 1,
0.8135132, -3.775679, 4.932468, 0.8313726, 0, 1, 1,
0.8155862, 1.572501, -0.773311, 0.8352941, 0, 1, 1,
0.8169115, -0.2771494, 1.874643, 0.8431373, 0, 1, 1,
0.8237312, 0.1069635, 2.874796, 0.8470588, 0, 1, 1,
0.8240542, -1.544667, 3.509897, 0.854902, 0, 1, 1,
0.8258934, 2.045258, 0.3927571, 0.8588235, 0, 1, 1,
0.8270234, 0.2680673, 1.537238, 0.8666667, 0, 1, 1,
0.8327572, -0.6890329, 1.398182, 0.8705882, 0, 1, 1,
0.8349872, -1.513229, 2.194784, 0.8784314, 0, 1, 1,
0.8443351, 0.1363234, 1.674066, 0.8823529, 0, 1, 1,
0.8485907, -1.275816, 2.247967, 0.8901961, 0, 1, 1,
0.852688, 0.5286235, 0.4185135, 0.8941177, 0, 1, 1,
0.8536459, -0.8726085, 2.468149, 0.9019608, 0, 1, 1,
0.8538881, 1.223422, -1.616766, 0.9098039, 0, 1, 1,
0.8543588, 0.7856747, 1.217388, 0.9137255, 0, 1, 1,
0.8620942, -1.641067, 1.452893, 0.9215686, 0, 1, 1,
0.8624623, -0.07033204, 2.425579, 0.9254902, 0, 1, 1,
0.8634611, -0.08449291, 1.437675, 0.9333333, 0, 1, 1,
0.8736889, -0.1094494, 1.021797, 0.9372549, 0, 1, 1,
0.8767176, 0.2982321, 1.829307, 0.945098, 0, 1, 1,
0.8800498, -0.4998477, 2.694631, 0.9490196, 0, 1, 1,
0.8826214, 0.6967241, 1.196196, 0.9568627, 0, 1, 1,
0.8865312, -1.571487, 5.494569, 0.9607843, 0, 1, 1,
0.8874774, 0.6003551, 0.01735762, 0.9686275, 0, 1, 1,
0.8886997, 0.3988423, 1.422789, 0.972549, 0, 1, 1,
0.8908042, -0.005521205, 1.746013, 0.9803922, 0, 1, 1,
0.8912963, -1.230997, 0.4553322, 0.9843137, 0, 1, 1,
0.8962852, -1.530104, 2.924649, 0.9921569, 0, 1, 1,
0.8985867, -0.2411878, 2.522628, 0.9960784, 0, 1, 1,
0.9134646, 0.9396487, -0.2663049, 1, 0, 0.9960784, 1,
0.9150618, 0.4371399, -0.4067502, 1, 0, 0.9882353, 1,
0.9169059, 2.262088, 0.8392774, 1, 0, 0.9843137, 1,
0.9190765, -0.448615, 4.435059, 1, 0, 0.9764706, 1,
0.9240172, -1.408892, 2.562238, 1, 0, 0.972549, 1,
0.9246022, 0.4645794, 0.1886724, 1, 0, 0.9647059, 1,
0.9247033, -0.5794858, 2.384607, 1, 0, 0.9607843, 1,
0.925893, 2.119903, -0.8145938, 1, 0, 0.9529412, 1,
0.927933, 1.071345, 0.5636081, 1, 0, 0.9490196, 1,
0.9330016, -0.2971591, 1.294177, 1, 0, 0.9411765, 1,
0.9392883, 1.124637, 0.1967431, 1, 0, 0.9372549, 1,
0.94343, -0.4260534, 2.742205, 1, 0, 0.9294118, 1,
0.9551867, 1.399644, -0.04561386, 1, 0, 0.9254902, 1,
0.9569046, -0.8221893, 2.912897, 1, 0, 0.9176471, 1,
0.9597941, 0.6192645, 1.637317, 1, 0, 0.9137255, 1,
0.967499, -1.244594, 3.098141, 1, 0, 0.9058824, 1,
0.9718676, 1.042123, 1.444695, 1, 0, 0.9019608, 1,
0.9727841, -0.1413816, 2.766334, 1, 0, 0.8941177, 1,
0.9742423, -0.4017017, 2.577532, 1, 0, 0.8862745, 1,
0.9758308, 0.2874304, -0.8793607, 1, 0, 0.8823529, 1,
0.9769334, 0.8417969, 0.03721733, 1, 0, 0.8745098, 1,
0.9857736, -1.612155, 2.673255, 1, 0, 0.8705882, 1,
0.9900601, -0.3537391, 3.206919, 1, 0, 0.8627451, 1,
1.009034, -0.3418371, 1.990738, 1, 0, 0.8588235, 1,
1.021297, 0.5217746, -0.2158852, 1, 0, 0.8509804, 1,
1.023873, -0.8990411, 1.694161, 1, 0, 0.8470588, 1,
1.024267, -1.864619, 2.632285, 1, 0, 0.8392157, 1,
1.02532, -0.8767451, 3.144801, 1, 0, 0.8352941, 1,
1.034343, 0.9290642, 1.431721, 1, 0, 0.827451, 1,
1.036245, -0.5106648, 0.6122157, 1, 0, 0.8235294, 1,
1.040433, 1.630975, 0.7106411, 1, 0, 0.8156863, 1,
1.043865, 1.45419, -0.3485061, 1, 0, 0.8117647, 1,
1.045872, 0.3043625, 0.6020373, 1, 0, 0.8039216, 1,
1.047036, -1.173964, 3.187141, 1, 0, 0.7960784, 1,
1.048825, 0.7244712, 0.2564371, 1, 0, 0.7921569, 1,
1.049017, 0.8996972, 1.589227, 1, 0, 0.7843137, 1,
1.049631, -0.4580794, 0.3183947, 1, 0, 0.7803922, 1,
1.059214, 0.1492791, 2.135006, 1, 0, 0.772549, 1,
1.063152, 1.356408, 0.2084205, 1, 0, 0.7686275, 1,
1.064092, 0.3502784, 1.598974, 1, 0, 0.7607843, 1,
1.071007, -0.4238726, 3.102836, 1, 0, 0.7568628, 1,
1.071376, 0.298558, 0.2950656, 1, 0, 0.7490196, 1,
1.07364, 0.1815167, 2.48058, 1, 0, 0.7450981, 1,
1.081598, 0.6465323, 1.757239, 1, 0, 0.7372549, 1,
1.082374, 1.025393, 4.786941, 1, 0, 0.7333333, 1,
1.084529, -0.3212486, 2.369082, 1, 0, 0.7254902, 1,
1.093467, -1.386777, 3.56513, 1, 0, 0.7215686, 1,
1.102301, 0.6750163, 1.647503, 1, 0, 0.7137255, 1,
1.104267, 0.7320994, 1.007353, 1, 0, 0.7098039, 1,
1.117175, -0.1871796, 1.962757, 1, 0, 0.7019608, 1,
1.117674, 0.9317148, 1.665483, 1, 0, 0.6941177, 1,
1.120975, 0.5838963, 1.204948, 1, 0, 0.6901961, 1,
1.122642, -0.9298046, 3.153035, 1, 0, 0.682353, 1,
1.124143, -1.377917, 4.153688, 1, 0, 0.6784314, 1,
1.126841, 1.062718, -0.1462212, 1, 0, 0.6705883, 1,
1.132612, 0.01500143, 0.56976, 1, 0, 0.6666667, 1,
1.136151, -0.31525, 3.246658, 1, 0, 0.6588235, 1,
1.143238, 0.1127091, 0.8199653, 1, 0, 0.654902, 1,
1.156596, 1.153131, 0.937462, 1, 0, 0.6470588, 1,
1.172352, 1.159589, 0.7767127, 1, 0, 0.6431373, 1,
1.176322, 0.2472507, 2.398057, 1, 0, 0.6352941, 1,
1.182663, 1.172104, 1.339124, 1, 0, 0.6313726, 1,
1.18482, 0.1409311, 2.388704, 1, 0, 0.6235294, 1,
1.189267, 3.207026, -0.04302494, 1, 0, 0.6196079, 1,
1.190735, 0.1134198, 2.838464, 1, 0, 0.6117647, 1,
1.196844, -1.426149, 2.364501, 1, 0, 0.6078432, 1,
1.210084, 0.7696331, 1.286584, 1, 0, 0.6, 1,
1.216474, -1.075038, 2.04704, 1, 0, 0.5921569, 1,
1.219791, -0.1973766, 1.870029, 1, 0, 0.5882353, 1,
1.223579, -0.3120562, 1.232228, 1, 0, 0.5803922, 1,
1.224581, 0.6876097, 1.541519, 1, 0, 0.5764706, 1,
1.229444, -0.3915287, -0.0396604, 1, 0, 0.5686275, 1,
1.233706, 1.522952, 0.567306, 1, 0, 0.5647059, 1,
1.24171, -0.2656623, 1.496628, 1, 0, 0.5568628, 1,
1.243743, -0.342742, 2.49964, 1, 0, 0.5529412, 1,
1.244011, -0.06703377, 0.6898584, 1, 0, 0.5450981, 1,
1.246493, 0.4982561, 0.1389953, 1, 0, 0.5411765, 1,
1.264568, -0.1513438, 2.626887, 1, 0, 0.5333334, 1,
1.266777, -1.293611, 2.155716, 1, 0, 0.5294118, 1,
1.272193, -2.043318, 3.252214, 1, 0, 0.5215687, 1,
1.276573, -2.157499, 2.995051, 1, 0, 0.5176471, 1,
1.276827, -1.200105, 3.713132, 1, 0, 0.509804, 1,
1.288159, 1.667313, 0.9245897, 1, 0, 0.5058824, 1,
1.291564, -1.333197, 4.1009, 1, 0, 0.4980392, 1,
1.307766, 0.2662548, 1.959441, 1, 0, 0.4901961, 1,
1.31054, 0.5108411, 2.23133, 1, 0, 0.4862745, 1,
1.314422, -0.8842999, 1.351112, 1, 0, 0.4784314, 1,
1.317864, -0.9233001, 2.925988, 1, 0, 0.4745098, 1,
1.326926, -1.095421, 2.619839, 1, 0, 0.4666667, 1,
1.330045, 0.7605146, -0.006279365, 1, 0, 0.4627451, 1,
1.33402, -0.3739183, 1.31337, 1, 0, 0.454902, 1,
1.339093, -1.225353, 1.694164, 1, 0, 0.4509804, 1,
1.353745, -0.4123019, 0.1848519, 1, 0, 0.4431373, 1,
1.367767, 0.3394166, 0.4447287, 1, 0, 0.4392157, 1,
1.379348, -1.427333, 2.438311, 1, 0, 0.4313726, 1,
1.398369, -0.7433742, 3.205477, 1, 0, 0.427451, 1,
1.40135, 1.342861, 0.9147763, 1, 0, 0.4196078, 1,
1.405965, 0.6749867, 0.9888326, 1, 0, 0.4156863, 1,
1.422098, -0.319011, 2.7112, 1, 0, 0.4078431, 1,
1.441464, 1.945262, -1.049152, 1, 0, 0.4039216, 1,
1.446299, 1.025308, 1.872763, 1, 0, 0.3960784, 1,
1.448471, -0.1923985, -0.7276859, 1, 0, 0.3882353, 1,
1.453342, 0.003362949, 0.06098209, 1, 0, 0.3843137, 1,
1.463421, 0.9043566, -0.2920142, 1, 0, 0.3764706, 1,
1.466662, 0.05579073, -0.2733523, 1, 0, 0.372549, 1,
1.477142, -0.06809498, 1.702918, 1, 0, 0.3647059, 1,
1.484379, -0.1712467, 1.984342, 1, 0, 0.3607843, 1,
1.485499, 0.1059305, 3.223003, 1, 0, 0.3529412, 1,
1.497527, -0.166869, 0.5322238, 1, 0, 0.3490196, 1,
1.521531, -0.09874, 2.599929, 1, 0, 0.3411765, 1,
1.538625, -0.3618727, 3.104025, 1, 0, 0.3372549, 1,
1.544378, 0.8495319, -0.2252315, 1, 0, 0.3294118, 1,
1.552681, -0.949102, 2.097135, 1, 0, 0.3254902, 1,
1.558268, -0.1032246, 0.7051953, 1, 0, 0.3176471, 1,
1.561258, 0.1585557, 0.9753094, 1, 0, 0.3137255, 1,
1.571836, -1.16754, 1.603315, 1, 0, 0.3058824, 1,
1.590841, -0.6910818, 3.36423, 1, 0, 0.2980392, 1,
1.633592, -0.3799295, 2.835963, 1, 0, 0.2941177, 1,
1.663435, -0.6293702, 2.216451, 1, 0, 0.2862745, 1,
1.668281, -1.510122, 2.56523, 1, 0, 0.282353, 1,
1.674773, 1.169425, 1.571561, 1, 0, 0.2745098, 1,
1.683956, -0.01638965, 3.449937, 1, 0, 0.2705882, 1,
1.685882, 1.085229, 1.528332, 1, 0, 0.2627451, 1,
1.721884, 0.2564679, 0.7887276, 1, 0, 0.2588235, 1,
1.72966, -0.2737175, 1.685518, 1, 0, 0.2509804, 1,
1.746063, 0.3626017, 0.7067255, 1, 0, 0.2470588, 1,
1.748746, -0.9880708, 3.095574, 1, 0, 0.2392157, 1,
1.750437, -0.401443, 2.613332, 1, 0, 0.2352941, 1,
1.760753, 0.8119891, 0.9518222, 1, 0, 0.227451, 1,
1.767477, 0.883103, 0.5830524, 1, 0, 0.2235294, 1,
1.777719, -0.3612094, 1.931716, 1, 0, 0.2156863, 1,
1.797299, -0.01718043, 2.073279, 1, 0, 0.2117647, 1,
1.819025, -0.2225153, 2.225062, 1, 0, 0.2039216, 1,
1.833059, -0.500339, 4.400033, 1, 0, 0.1960784, 1,
1.844608, -0.3871844, 3.144207, 1, 0, 0.1921569, 1,
1.844818, -0.1917268, -0.02495099, 1, 0, 0.1843137, 1,
1.854317, 0.4294397, 1.786441, 1, 0, 0.1803922, 1,
1.890236, 0.1650375, 3.900071, 1, 0, 0.172549, 1,
1.900966, -0.3022319, 1.532655, 1, 0, 0.1686275, 1,
1.915968, 0.1200503, 0.8354433, 1, 0, 0.1607843, 1,
1.936875, -0.9569963, 2.29294, 1, 0, 0.1568628, 1,
1.946479, -0.8844336, 1.667509, 1, 0, 0.1490196, 1,
1.959062, -0.7924281, 0.6904701, 1, 0, 0.145098, 1,
1.965089, 0.2241282, 0.6018167, 1, 0, 0.1372549, 1,
1.965385, 0.02168888, 1.003928, 1, 0, 0.1333333, 1,
2.003, 0.7457748, 2.949265, 1, 0, 0.1254902, 1,
2.024242, 1.268372, -0.1645502, 1, 0, 0.1215686, 1,
2.06175, -0.1009709, -1.165817, 1, 0, 0.1137255, 1,
2.069595, -0.9909452, 3.041882, 1, 0, 0.1098039, 1,
2.137983, -0.3193355, 0.3666679, 1, 0, 0.1019608, 1,
2.140058, -1.016829, 1.406102, 1, 0, 0.09411765, 1,
2.15587, 0.374595, 1.470093, 1, 0, 0.09019608, 1,
2.163133, -1.077536, 1.558976, 1, 0, 0.08235294, 1,
2.24856, -0.6918107, 1.75939, 1, 0, 0.07843138, 1,
2.266008, 0.8749635, 1.707838, 1, 0, 0.07058824, 1,
2.270533, -0.5954198, 3.165484, 1, 0, 0.06666667, 1,
2.292484, -0.6681203, 1.989099, 1, 0, 0.05882353, 1,
2.299314, -1.0438, 2.428832, 1, 0, 0.05490196, 1,
2.303427, -1.142745, 1.744105, 1, 0, 0.04705882, 1,
2.303524, 0.1063362, 1.061066, 1, 0, 0.04313726, 1,
2.349936, -1.34846, 1.823697, 1, 0, 0.03529412, 1,
2.392326, -0.7106016, 2.123357, 1, 0, 0.03137255, 1,
2.590831, 0.4996288, 0.9262506, 1, 0, 0.02352941, 1,
2.591969, -0.0007399279, 1.117591, 1, 0, 0.01960784, 1,
2.866186, 0.9737399, 1.732252, 1, 0, 0.01176471, 1,
3.33251, 0.7556008, 0.8176463, 1, 0, 0.007843138, 1
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
0.1606635, -4.959248, -7.254426, 0, -0.5, 0.5, 0.5,
0.1606635, -4.959248, -7.254426, 1, -0.5, 0.5, 0.5,
0.1606635, -4.959248, -7.254426, 1, 1.5, 0.5, 0.5,
0.1606635, -4.959248, -7.254426, 0, 1.5, 0.5, 0.5
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
-4.086439, -0.2843267, -7.254426, 0, -0.5, 0.5, 0.5,
-4.086439, -0.2843267, -7.254426, 1, -0.5, 0.5, 0.5,
-4.086439, -0.2843267, -7.254426, 1, 1.5, 0.5, 0.5,
-4.086439, -0.2843267, -7.254426, 0, 1.5, 0.5, 0.5
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
-4.086439, -4.959248, 0.04417658, 0, -0.5, 0.5, 0.5,
-4.086439, -4.959248, 0.04417658, 1, -0.5, 0.5, 0.5,
-4.086439, -4.959248, 0.04417658, 1, 1.5, 0.5, 0.5,
-4.086439, -4.959248, 0.04417658, 0, 1.5, 0.5, 0.5
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
-3, -3.88042, -5.570133,
3, -3.88042, -5.570133,
-3, -3.88042, -5.570133,
-3, -4.060225, -5.850848,
-2, -3.88042, -5.570133,
-2, -4.060225, -5.850848,
-1, -3.88042, -5.570133,
-1, -4.060225, -5.850848,
0, -3.88042, -5.570133,
0, -4.060225, -5.850848,
1, -3.88042, -5.570133,
1, -4.060225, -5.850848,
2, -3.88042, -5.570133,
2, -4.060225, -5.850848,
3, -3.88042, -5.570133,
3, -4.060225, -5.850848
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
-3, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
-3, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
-3, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
-3, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
-2, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
-2, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
-2, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
-2, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
-1, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
-1, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
-1, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
-1, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
0, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
0, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
0, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
0, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
1, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
1, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
1, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
1, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
2, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
2, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
2, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
2, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5,
3, -4.419834, -6.412279, 0, -0.5, 0.5, 0.5,
3, -4.419834, -6.412279, 1, -0.5, 0.5, 0.5,
3, -4.419834, -6.412279, 1, 1.5, 0.5, 0.5,
3, -4.419834, -6.412279, 0, 1.5, 0.5, 0.5
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
-3.106338, -3, -5.570133,
-3.106338, 3, -5.570133,
-3.106338, -3, -5.570133,
-3.269688, -3, -5.850848,
-3.106338, -2, -5.570133,
-3.269688, -2, -5.850848,
-3.106338, -1, -5.570133,
-3.269688, -1, -5.850848,
-3.106338, 0, -5.570133,
-3.269688, 0, -5.850848,
-3.106338, 1, -5.570133,
-3.269688, 1, -5.850848,
-3.106338, 2, -5.570133,
-3.269688, 2, -5.850848,
-3.106338, 3, -5.570133,
-3.269688, 3, -5.850848
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
-3.596388, -3, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, -3, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, -3, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, -3, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, -2, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, -2, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, -2, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, -2, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, -1, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, -1, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, -1, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, -1, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, 0, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, 0, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, 0, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, 0, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, 1, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, 1, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, 1, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, 1, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, 2, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, 2, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, 2, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, 2, -6.412279, 0, 1.5, 0.5, 0.5,
-3.596388, 3, -6.412279, 0, -0.5, 0.5, 0.5,
-3.596388, 3, -6.412279, 1, -0.5, 0.5, 0.5,
-3.596388, 3, -6.412279, 1, 1.5, 0.5, 0.5,
-3.596388, 3, -6.412279, 0, 1.5, 0.5, 0.5
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
-3.106338, -3.88042, -4,
-3.106338, -3.88042, 4,
-3.106338, -3.88042, -4,
-3.269688, -4.060225, -4,
-3.106338, -3.88042, -2,
-3.269688, -4.060225, -2,
-3.106338, -3.88042, 0,
-3.269688, -4.060225, 0,
-3.106338, -3.88042, 2,
-3.269688, -4.060225, 2,
-3.106338, -3.88042, 4,
-3.269688, -4.060225, 4
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
-3.596388, -4.419834, -4, 0, -0.5, 0.5, 0.5,
-3.596388, -4.419834, -4, 1, -0.5, 0.5, 0.5,
-3.596388, -4.419834, -4, 1, 1.5, 0.5, 0.5,
-3.596388, -4.419834, -4, 0, 1.5, 0.5, 0.5,
-3.596388, -4.419834, -2, 0, -0.5, 0.5, 0.5,
-3.596388, -4.419834, -2, 1, -0.5, 0.5, 0.5,
-3.596388, -4.419834, -2, 1, 1.5, 0.5, 0.5,
-3.596388, -4.419834, -2, 0, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 0, 0, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 0, 1, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 0, 1, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 0, 0, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 2, 0, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 2, 1, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 2, 1, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 2, 0, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 4, 0, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 4, 1, -0.5, 0.5, 0.5,
-3.596388, -4.419834, 4, 1, 1.5, 0.5, 0.5,
-3.596388, -4.419834, 4, 0, 1.5, 0.5, 0.5
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
-3.106338, -3.88042, -5.570133,
-3.106338, 3.311767, -5.570133,
-3.106338, -3.88042, 5.658486,
-3.106338, 3.311767, 5.658486,
-3.106338, -3.88042, -5.570133,
-3.106338, -3.88042, 5.658486,
-3.106338, 3.311767, -5.570133,
-3.106338, 3.311767, 5.658486,
-3.106338, -3.88042, -5.570133,
3.427665, -3.88042, -5.570133,
-3.106338, -3.88042, 5.658486,
3.427665, -3.88042, 5.658486,
-3.106338, 3.311767, -5.570133,
3.427665, 3.311767, -5.570133,
-3.106338, 3.311767, 5.658486,
3.427665, 3.311767, 5.658486,
3.427665, -3.88042, -5.570133,
3.427665, 3.311767, -5.570133,
3.427665, -3.88042, 5.658486,
3.427665, 3.311767, 5.658486,
3.427665, -3.88042, -5.570133,
3.427665, -3.88042, 5.658486,
3.427665, 3.311767, -5.570133,
3.427665, 3.311767, 5.658486
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
var radius = 7.929254;
var distance = 35.27815;
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
mvMatrix.translate( -0.1606635, 0.2843267, -0.04417658 );
mvMatrix.scale( 1.3121, 1.192025, 0.7635191 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27815);
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


