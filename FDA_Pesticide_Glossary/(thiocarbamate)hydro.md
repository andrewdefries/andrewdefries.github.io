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
-3.258883, -0.08175866, 1.109747, 1, 0, 0, 1,
-3.239095, 0.06885713, -0.501708, 1, 0.007843138, 0, 1,
-3.128524, 0.402081, -0.489507, 1, 0.01176471, 0, 1,
-3.072216, -0.1725428, -2.404579, 1, 0.01960784, 0, 1,
-2.667103, 0.395736, -0.6462442, 1, 0.02352941, 0, 1,
-2.601995, -1.271156, -1.052904, 1, 0.03137255, 0, 1,
-2.510371, -0.1853458, -0.1236651, 1, 0.03529412, 0, 1,
-2.496246, -0.1287293, -0.4416797, 1, 0.04313726, 0, 1,
-2.48784, 0.6047814, -2.700878, 1, 0.04705882, 0, 1,
-2.43751, -1.409864, -3.172017, 1, 0.05490196, 0, 1,
-2.416347, 0.03493521, -0.08950866, 1, 0.05882353, 0, 1,
-2.248202, 0.4479455, -1.229102, 1, 0.06666667, 0, 1,
-2.239171, -1.46833, -2.974941, 1, 0.07058824, 0, 1,
-2.206908, 1.441167, -1.657067, 1, 0.07843138, 0, 1,
-2.165287, -0.03247125, -1.09824, 1, 0.08235294, 0, 1,
-2.038248, 2.988276, 1.188378, 1, 0.09019608, 0, 1,
-1.952151, -0.2796737, -2.29979, 1, 0.09411765, 0, 1,
-1.946873, -0.09088853, -1.606254, 1, 0.1019608, 0, 1,
-1.933138, 0.3473508, -1.642355, 1, 0.1098039, 0, 1,
-1.922077, 0.4305369, -0.2379989, 1, 0.1137255, 0, 1,
-1.892965, -0.1805913, -1.481335, 1, 0.1215686, 0, 1,
-1.852552, -1.248385, -1.190423, 1, 0.1254902, 0, 1,
-1.841928, 0.5278249, -1.234365, 1, 0.1333333, 0, 1,
-1.814046, 1.388939, -2.374305, 1, 0.1372549, 0, 1,
-1.811656, 0.007434872, -2.362969, 1, 0.145098, 0, 1,
-1.807257, -2.061278, -2.461039, 1, 0.1490196, 0, 1,
-1.758973, 0.2366645, -0.9669452, 1, 0.1568628, 0, 1,
-1.752424, 0.5694585, -2.431541, 1, 0.1607843, 0, 1,
-1.742001, 1.618208, 0.2554254, 1, 0.1686275, 0, 1,
-1.731825, -0.3229326, -1.522981, 1, 0.172549, 0, 1,
-1.730863, -0.5023457, -0.496695, 1, 0.1803922, 0, 1,
-1.725589, 0.472212, -2.331336, 1, 0.1843137, 0, 1,
-1.724355, 1.898488, -1.103192, 1, 0.1921569, 0, 1,
-1.722591, -0.9425703, -0.3620352, 1, 0.1960784, 0, 1,
-1.699549, 1.412764, -0.08216418, 1, 0.2039216, 0, 1,
-1.681344, 0.7986001, 0.2668838, 1, 0.2117647, 0, 1,
-1.678092, 0.2277568, -1.449096, 1, 0.2156863, 0, 1,
-1.664293, 0.715605, -1.782729, 1, 0.2235294, 0, 1,
-1.662829, -0.06450843, -1.655168, 1, 0.227451, 0, 1,
-1.652322, -1.575281, -4.123311, 1, 0.2352941, 0, 1,
-1.64923, -1.957593, -3.548619, 1, 0.2392157, 0, 1,
-1.64353, -0.7249272, -2.732865, 1, 0.2470588, 0, 1,
-1.632252, -0.4222075, -2.950637, 1, 0.2509804, 0, 1,
-1.623529, -1.206883, -0.6696481, 1, 0.2588235, 0, 1,
-1.622244, 0.0476855, -1.252, 1, 0.2627451, 0, 1,
-1.616493, -0.633995, -2.685758, 1, 0.2705882, 0, 1,
-1.615306, 0.5845381, -1.963942, 1, 0.2745098, 0, 1,
-1.595651, -1.934284, -1.812792, 1, 0.282353, 0, 1,
-1.591011, -0.6520569, -1.214733, 1, 0.2862745, 0, 1,
-1.58647, 1.548684, -1.041021, 1, 0.2941177, 0, 1,
-1.577977, 0.0152123, -2.013343, 1, 0.3019608, 0, 1,
-1.572009, -1.09922, -2.161684, 1, 0.3058824, 0, 1,
-1.542789, 0.41107, -2.632904, 1, 0.3137255, 0, 1,
-1.542177, -1.228655, -3.545067, 1, 0.3176471, 0, 1,
-1.532689, 0.1487715, -0.04693154, 1, 0.3254902, 0, 1,
-1.523257, 1.167431, -1.935027, 1, 0.3294118, 0, 1,
-1.510851, 0.477293, -0.7295267, 1, 0.3372549, 0, 1,
-1.509783, 2.743362, -0.9363996, 1, 0.3411765, 0, 1,
-1.509025, 1.106277, -0.8505668, 1, 0.3490196, 0, 1,
-1.482966, 0.3750217, -1.334603, 1, 0.3529412, 0, 1,
-1.468476, 1.39479, -1.375536, 1, 0.3607843, 0, 1,
-1.459926, 1.295904, 0.2045279, 1, 0.3647059, 0, 1,
-1.452664, -1.034648, -1.510855, 1, 0.372549, 0, 1,
-1.44047, 0.4391055, -1.011823, 1, 0.3764706, 0, 1,
-1.438874, -0.1320924, -1.048724, 1, 0.3843137, 0, 1,
-1.420398, 1.191338, -1.303173, 1, 0.3882353, 0, 1,
-1.418729, -1.249003, -3.277946, 1, 0.3960784, 0, 1,
-1.409791, -1.119952, -2.774173, 1, 0.4039216, 0, 1,
-1.405735, -1.559515, -3.012383, 1, 0.4078431, 0, 1,
-1.396404, -0.06769261, -2.598961, 1, 0.4156863, 0, 1,
-1.388009, 1.469046, -1.123041, 1, 0.4196078, 0, 1,
-1.385731, 0.464074, -1.852653, 1, 0.427451, 0, 1,
-1.37773, -1.051378, -2.852, 1, 0.4313726, 0, 1,
-1.373362, 0.3511303, -1.50378, 1, 0.4392157, 0, 1,
-1.368858, -1.89123, -1.68665, 1, 0.4431373, 0, 1,
-1.36859, 1.732444, -1.361251, 1, 0.4509804, 0, 1,
-1.368555, 0.02082383, -1.079973, 1, 0.454902, 0, 1,
-1.365489, 0.3499957, -2.424829, 1, 0.4627451, 0, 1,
-1.362971, -0.5847744, -1.55985, 1, 0.4666667, 0, 1,
-1.36236, -1.186432, -1.87203, 1, 0.4745098, 0, 1,
-1.356487, 1.627323, -2.513234, 1, 0.4784314, 0, 1,
-1.34872, 0.08667118, -0.8447147, 1, 0.4862745, 0, 1,
-1.342953, -0.2302197, -4.451135, 1, 0.4901961, 0, 1,
-1.339055, -0.4810921, -1.191678, 1, 0.4980392, 0, 1,
-1.332008, -0.5139375, -0.4177165, 1, 0.5058824, 0, 1,
-1.331891, -0.2803062, -0.3950242, 1, 0.509804, 0, 1,
-1.323756, -0.229901, -2.693572, 1, 0.5176471, 0, 1,
-1.314086, 0.5236561, 0.2128841, 1, 0.5215687, 0, 1,
-1.313753, 0.4565644, -2.711684, 1, 0.5294118, 0, 1,
-1.313279, -0.4827669, -1.731813, 1, 0.5333334, 0, 1,
-1.306397, -0.03491482, -2.258906, 1, 0.5411765, 0, 1,
-1.297407, 0.4945593, -0.008041016, 1, 0.5450981, 0, 1,
-1.297105, -0.3212292, -0.9804434, 1, 0.5529412, 0, 1,
-1.292277, -1.317847, -2.497475, 1, 0.5568628, 0, 1,
-1.287452, 0.4571624, -1.655568, 1, 0.5647059, 0, 1,
-1.286381, -0.5863171, -2.980924, 1, 0.5686275, 0, 1,
-1.285338, -0.5687529, -1.878638, 1, 0.5764706, 0, 1,
-1.279513, -0.6082206, -1.835532, 1, 0.5803922, 0, 1,
-1.279233, 0.8383611, -2.663362, 1, 0.5882353, 0, 1,
-1.2644, -0.466073, -1.447318, 1, 0.5921569, 0, 1,
-1.258731, 1.630619, -0.6594701, 1, 0.6, 0, 1,
-1.257423, -0.8001508, -3.076777, 1, 0.6078432, 0, 1,
-1.25244, -1.355275, -1.375394, 1, 0.6117647, 0, 1,
-1.241131, 1.160014, -1.735614, 1, 0.6196079, 0, 1,
-1.230758, 1.598374, -0.639901, 1, 0.6235294, 0, 1,
-1.216496, 0.5187735, -0.3240233, 1, 0.6313726, 0, 1,
-1.212528, 0.46798, -0.2107896, 1, 0.6352941, 0, 1,
-1.207642, 1.519616, -1.338885, 1, 0.6431373, 0, 1,
-1.201511, -0.2025809, -0.9597883, 1, 0.6470588, 0, 1,
-1.20096, 0.002945783, -0.9905046, 1, 0.654902, 0, 1,
-1.194487, -0.9754347, 0.04605092, 1, 0.6588235, 0, 1,
-1.19083, 0.7301127, -1.696287, 1, 0.6666667, 0, 1,
-1.183455, 1.097645, -1.643192, 1, 0.6705883, 0, 1,
-1.182002, 0.2967327, -2.290897, 1, 0.6784314, 0, 1,
-1.180322, 1.235831, 0.2135141, 1, 0.682353, 0, 1,
-1.178443, -0.6915841, -1.286701, 1, 0.6901961, 0, 1,
-1.170641, -0.9103739, -1.598719, 1, 0.6941177, 0, 1,
-1.168447, -0.3439949, -4.209197, 1, 0.7019608, 0, 1,
-1.167233, -0.2183591, -1.253471, 1, 0.7098039, 0, 1,
-1.166261, 0.1608455, -2.390343, 1, 0.7137255, 0, 1,
-1.164554, -0.4849817, -3.05232, 1, 0.7215686, 0, 1,
-1.161642, 0.04506964, -0.8640026, 1, 0.7254902, 0, 1,
-1.155166, 0.8565364, 0.5532069, 1, 0.7333333, 0, 1,
-1.149055, 0.6079426, -1.667576, 1, 0.7372549, 0, 1,
-1.146026, 0.480581, -2.221514, 1, 0.7450981, 0, 1,
-1.140519, 0.532331, 0.3892896, 1, 0.7490196, 0, 1,
-1.137306, -0.4551168, -0.8872617, 1, 0.7568628, 0, 1,
-1.13268, -2.137264, -3.83732, 1, 0.7607843, 0, 1,
-1.129282, -0.3996557, -1.044483, 1, 0.7686275, 0, 1,
-1.105964, -0.7467448, -3.297009, 1, 0.772549, 0, 1,
-1.102718, -0.005735947, -3.268729, 1, 0.7803922, 0, 1,
-1.09997, -0.6512073, -1.731799, 1, 0.7843137, 0, 1,
-1.099708, 0.3168004, -0.7270521, 1, 0.7921569, 0, 1,
-1.097887, 0.2820764, -0.7475216, 1, 0.7960784, 0, 1,
-1.092522, 0.8581657, -0.05068114, 1, 0.8039216, 0, 1,
-1.089129, 1.5163, -0.6793296, 1, 0.8117647, 0, 1,
-1.086035, 0.3991163, -1.211187, 1, 0.8156863, 0, 1,
-1.06837, -1.516245, -2.596187, 1, 0.8235294, 0, 1,
-1.065725, -0.3346853, -2.233777, 1, 0.827451, 0, 1,
-1.051226, 1.006872, -1.799959, 1, 0.8352941, 0, 1,
-1.046474, -0.09715005, -2.078182, 1, 0.8392157, 0, 1,
-1.040485, -0.3375506, -1.477879, 1, 0.8470588, 0, 1,
-1.03721, 1.242567, -1.856708, 1, 0.8509804, 0, 1,
-1.034871, 0.2413851, -2.422985, 1, 0.8588235, 0, 1,
-1.034709, -0.5265437, -4.112866, 1, 0.8627451, 0, 1,
-1.029289, -1.003081, -2.885785, 1, 0.8705882, 0, 1,
-1.022024, -0.9771865, -1.696306, 1, 0.8745098, 0, 1,
-1.020867, -1.381921, -4.297854, 1, 0.8823529, 0, 1,
-1.004357, -0.7529103, -2.557985, 1, 0.8862745, 0, 1,
-1.001897, -0.5284703, -1.719525, 1, 0.8941177, 0, 1,
-1.000654, 0.8135904, -0.4756176, 1, 0.8980392, 0, 1,
-0.9976778, -0.5242221, -2.413845, 1, 0.9058824, 0, 1,
-0.9939205, -2.003423, -3.211894, 1, 0.9137255, 0, 1,
-0.9911441, -0.3141495, -1.102189, 1, 0.9176471, 0, 1,
-0.9724759, -1.092442, -2.379954, 1, 0.9254902, 0, 1,
-0.9715329, 0.5491254, 0.8195997, 1, 0.9294118, 0, 1,
-0.9681191, -0.2103545, -2.669158, 1, 0.9372549, 0, 1,
-0.9656194, -1.164392, -2.714552, 1, 0.9411765, 0, 1,
-0.9641586, -0.5695578, -2.038758, 1, 0.9490196, 0, 1,
-0.9623877, -1.163348, -3.233292, 1, 0.9529412, 0, 1,
-0.9614888, -1.676921, -3.015907, 1, 0.9607843, 0, 1,
-0.9538862, 0.02332597, -3.126045, 1, 0.9647059, 0, 1,
-0.9514529, -0.5286825, -3.025293, 1, 0.972549, 0, 1,
-0.9474483, 0.4986759, -2.02718, 1, 0.9764706, 0, 1,
-0.9422582, -1.721163, -3.214798, 1, 0.9843137, 0, 1,
-0.9414118, -0.9404993, -2.346107, 1, 0.9882353, 0, 1,
-0.9414033, -0.2591837, -1.385269, 1, 0.9960784, 0, 1,
-0.9399846, -0.6230596, -2.914659, 0.9960784, 1, 0, 1,
-0.9391112, 1.046641, -1.571757, 0.9921569, 1, 0, 1,
-0.9336297, -0.5941902, -2.474004, 0.9843137, 1, 0, 1,
-0.9323972, -1.32455, -1.639961, 0.9803922, 1, 0, 1,
-0.9267363, -0.2232363, -0.9024538, 0.972549, 1, 0, 1,
-0.9217803, 0.5571687, -1.143232, 0.9686275, 1, 0, 1,
-0.9210075, -0.6225139, -3.403682, 0.9607843, 1, 0, 1,
-0.9196817, -0.3633466, -1.530255, 0.9568627, 1, 0, 1,
-0.9166387, -0.9691306, -1.132529, 0.9490196, 1, 0, 1,
-0.9163185, 0.6281823, -0.6475877, 0.945098, 1, 0, 1,
-0.913224, 0.2144485, -1.012942, 0.9372549, 1, 0, 1,
-0.9114569, 1.495284, 0.03200193, 0.9333333, 1, 0, 1,
-0.9083335, 0.9138208, 1.361242, 0.9254902, 1, 0, 1,
-0.9008144, -1.446053, -1.449492, 0.9215686, 1, 0, 1,
-0.8969249, 1.030161, -0.4385331, 0.9137255, 1, 0, 1,
-0.8845365, -0.211445, -0.8011838, 0.9098039, 1, 0, 1,
-0.8809897, 0.5955024, -1.628987, 0.9019608, 1, 0, 1,
-0.880718, 1.16946, -1.42122, 0.8941177, 1, 0, 1,
-0.8799773, -0.7810096, -3.559573, 0.8901961, 1, 0, 1,
-0.8717554, -0.4217732, -2.049395, 0.8823529, 1, 0, 1,
-0.868125, -0.2017758, -1.64114, 0.8784314, 1, 0, 1,
-0.8617634, 0.3014065, -1.541862, 0.8705882, 1, 0, 1,
-0.8462981, -1.540433, -2.522309, 0.8666667, 1, 0, 1,
-0.8422836, -1.257119, -2.953283, 0.8588235, 1, 0, 1,
-0.8378729, 0.359943, -1.289647, 0.854902, 1, 0, 1,
-0.8377625, 0.9552805, -0.9569755, 0.8470588, 1, 0, 1,
-0.8327942, 0.3984592, -2.393856, 0.8431373, 1, 0, 1,
-0.8260594, 1.568566, 0.8075929, 0.8352941, 1, 0, 1,
-0.8251541, -0.8546792, -2.640529, 0.8313726, 1, 0, 1,
-0.8195543, 0.08357233, -1.206117, 0.8235294, 1, 0, 1,
-0.8185982, 0.3151365, 2.253126, 0.8196079, 1, 0, 1,
-0.8174137, 0.5071971, -1.711124, 0.8117647, 1, 0, 1,
-0.8166348, 0.08082151, -2.081756, 0.8078431, 1, 0, 1,
-0.8151242, -0.9429951, -2.7758, 0.8, 1, 0, 1,
-0.8145162, -0.4227928, -0.7918465, 0.7921569, 1, 0, 1,
-0.8135939, -0.1297462, -1.652549, 0.7882353, 1, 0, 1,
-0.8134914, -0.2548609, -2.429365, 0.7803922, 1, 0, 1,
-0.812962, 0.1638927, -2.346255, 0.7764706, 1, 0, 1,
-0.8104022, -0.4938878, -2.717861, 0.7686275, 1, 0, 1,
-0.8100085, -0.9531078, -1.736062, 0.7647059, 1, 0, 1,
-0.8096591, 0.1390691, -0.3669627, 0.7568628, 1, 0, 1,
-0.8055672, -0.1845015, -1.54188, 0.7529412, 1, 0, 1,
-0.8055621, -0.469085, -2.341077, 0.7450981, 1, 0, 1,
-0.7999331, 0.9502, -0.005679363, 0.7411765, 1, 0, 1,
-0.7994459, -1.067957, -2.998458, 0.7333333, 1, 0, 1,
-0.79693, 1.247561, 0.07182227, 0.7294118, 1, 0, 1,
-0.795406, -0.1840694, -1.512682, 0.7215686, 1, 0, 1,
-0.7946119, -0.06949377, -3.275573, 0.7176471, 1, 0, 1,
-0.7942219, 1.375054, 0.4197136, 0.7098039, 1, 0, 1,
-0.7935519, 1.291505, -2.304866, 0.7058824, 1, 0, 1,
-0.7871408, -0.1977108, -3.593798, 0.6980392, 1, 0, 1,
-0.7862975, 0.005560707, -0.8582188, 0.6901961, 1, 0, 1,
-0.7801647, -0.6053492, -2.412271, 0.6862745, 1, 0, 1,
-0.7727184, 0.562297, -1.039969, 0.6784314, 1, 0, 1,
-0.7712275, 0.5850537, -1.302889, 0.6745098, 1, 0, 1,
-0.7677808, -0.1279375, -2.624758, 0.6666667, 1, 0, 1,
-0.7644508, 1.175117, -0.03575588, 0.6627451, 1, 0, 1,
-0.7573316, -0.5417805, -2.080403, 0.654902, 1, 0, 1,
-0.7477702, -0.06431408, -2.015865, 0.6509804, 1, 0, 1,
-0.7383142, 1.329908, 0.1486686, 0.6431373, 1, 0, 1,
-0.7372465, -1.056233, -1.619751, 0.6392157, 1, 0, 1,
-0.7335407, 1.581473, -0.05664136, 0.6313726, 1, 0, 1,
-0.7221773, 1.255908, 0.1962844, 0.627451, 1, 0, 1,
-0.7206115, 0.06531955, -2.80543, 0.6196079, 1, 0, 1,
-0.7190153, -0.57297, -1.329145, 0.6156863, 1, 0, 1,
-0.7164932, -0.2713775, -1.308683, 0.6078432, 1, 0, 1,
-0.7162882, -0.4425116, -1.696845, 0.6039216, 1, 0, 1,
-0.7162871, -0.89465, -4.80735, 0.5960785, 1, 0, 1,
-0.7156421, -1.020205, -1.000785, 0.5882353, 1, 0, 1,
-0.7148765, 0.02230945, -2.097965, 0.5843138, 1, 0, 1,
-0.7083827, -0.3904702, 0.2022702, 0.5764706, 1, 0, 1,
-0.7054188, 0.6766673, 0.8228247, 0.572549, 1, 0, 1,
-0.704259, -0.4351562, -1.463378, 0.5647059, 1, 0, 1,
-0.6989518, 0.005529586, -0.7655056, 0.5607843, 1, 0, 1,
-0.6986265, -1.026012, -1.121171, 0.5529412, 1, 0, 1,
-0.6984976, -0.6985033, -3.862442, 0.5490196, 1, 0, 1,
-0.6972849, 0.2915801, -0.1003491, 0.5411765, 1, 0, 1,
-0.6874505, -1.293619, -5.259485, 0.5372549, 1, 0, 1,
-0.682241, 0.9682577, -2.312441, 0.5294118, 1, 0, 1,
-0.6821916, 1.141745, 0.7341117, 0.5254902, 1, 0, 1,
-0.6769416, 1.889289, -0.99283, 0.5176471, 1, 0, 1,
-0.6725804, 0.08723527, -2.044881, 0.5137255, 1, 0, 1,
-0.6717331, 0.6641891, -0.6477062, 0.5058824, 1, 0, 1,
-0.6678641, -0.2307577, -2.245077, 0.5019608, 1, 0, 1,
-0.6655028, 0.5032439, -1.743981, 0.4941176, 1, 0, 1,
-0.6620141, -1.307065, -1.597648, 0.4862745, 1, 0, 1,
-0.6602978, -0.7160194, -2.623102, 0.4823529, 1, 0, 1,
-0.6597673, -1.896135, -3.100395, 0.4745098, 1, 0, 1,
-0.6588988, 0.2539, 0.6172001, 0.4705882, 1, 0, 1,
-0.6539192, -1.492766, -2.847726, 0.4627451, 1, 0, 1,
-0.6365025, 0.03309551, -1.370694, 0.4588235, 1, 0, 1,
-0.6364958, 1.628355, 1.256596, 0.4509804, 1, 0, 1,
-0.6309708, 1.711028, -0.6352559, 0.4470588, 1, 0, 1,
-0.6300003, 0.8349653, -1.939674, 0.4392157, 1, 0, 1,
-0.6298857, -0.8136397, -1.091595, 0.4352941, 1, 0, 1,
-0.6294007, 1.458456, -0.3615892, 0.427451, 1, 0, 1,
-0.6271968, -0.4924664, -3.43748, 0.4235294, 1, 0, 1,
-0.6264338, -0.3438371, -1.016131, 0.4156863, 1, 0, 1,
-0.6250486, 0.8874279, -1.281249, 0.4117647, 1, 0, 1,
-0.6183847, -0.2938553, -1.005861, 0.4039216, 1, 0, 1,
-0.6182092, -0.4196903, -3.207558, 0.3960784, 1, 0, 1,
-0.6169755, 0.2935075, -1.929681, 0.3921569, 1, 0, 1,
-0.6163006, -0.1432052, -1.541157, 0.3843137, 1, 0, 1,
-0.614593, -0.2567798, -1.647244, 0.3803922, 1, 0, 1,
-0.6121398, 0.5510013, -1.842985, 0.372549, 1, 0, 1,
-0.6101589, -2.348154, -2.735458, 0.3686275, 1, 0, 1,
-0.6066701, -0.1203211, -0.8582397, 0.3607843, 1, 0, 1,
-0.6060145, 0.02646205, -1.854361, 0.3568628, 1, 0, 1,
-0.60598, 0.8263314, -1.298268, 0.3490196, 1, 0, 1,
-0.6056539, -1.102679, -3.324281, 0.345098, 1, 0, 1,
-0.5996953, -0.2894406, -2.107565, 0.3372549, 1, 0, 1,
-0.5984734, 0.3259965, 0.3741549, 0.3333333, 1, 0, 1,
-0.5910555, -0.5198955, -1.839349, 0.3254902, 1, 0, 1,
-0.5876325, 0.8139768, -1.347397, 0.3215686, 1, 0, 1,
-0.5864514, -0.1625601, -2.692587, 0.3137255, 1, 0, 1,
-0.580338, -0.6921434, -3.352929, 0.3098039, 1, 0, 1,
-0.5799953, -0.2569689, -1.874026, 0.3019608, 1, 0, 1,
-0.5771697, -0.8758851, -3.105579, 0.2941177, 1, 0, 1,
-0.5740982, -1.352232, -0.9611714, 0.2901961, 1, 0, 1,
-0.5722161, -1.312645, -3.981754, 0.282353, 1, 0, 1,
-0.5637062, -0.137191, -3.330235, 0.2784314, 1, 0, 1,
-0.5629774, -2.001879, -5.25113, 0.2705882, 1, 0, 1,
-0.5567585, -1.020998, -3.348933, 0.2666667, 1, 0, 1,
-0.5548655, -3.150025, -3.09092, 0.2588235, 1, 0, 1,
-0.5526245, 0.1770098, -3.268371, 0.254902, 1, 0, 1,
-0.5479308, -0.124745, -2.843442, 0.2470588, 1, 0, 1,
-0.546403, -1.250967, -3.406425, 0.2431373, 1, 0, 1,
-0.5368478, -0.1715171, -2.797579, 0.2352941, 1, 0, 1,
-0.5311915, -0.9271901, -3.20358, 0.2313726, 1, 0, 1,
-0.5233216, 0.7889107, -1.884929, 0.2235294, 1, 0, 1,
-0.5222111, -1.646813, -2.327592, 0.2196078, 1, 0, 1,
-0.5214678, -0.6720775, -2.099758, 0.2117647, 1, 0, 1,
-0.519821, -0.5320825, -3.839739, 0.2078431, 1, 0, 1,
-0.5172335, -0.7556505, -2.747028, 0.2, 1, 0, 1,
-0.5154596, 0.1046492, -0.5314066, 0.1921569, 1, 0, 1,
-0.5124428, 0.7150523, -0.1363207, 0.1882353, 1, 0, 1,
-0.5118287, 0.9668731, 0.5523127, 0.1803922, 1, 0, 1,
-0.5085432, 0.4192149, -1.005698, 0.1764706, 1, 0, 1,
-0.5078163, 0.4617212, -1.129093, 0.1686275, 1, 0, 1,
-0.5069354, -0.1431786, -1.900417, 0.1647059, 1, 0, 1,
-0.502853, -1.087644, -3.356521, 0.1568628, 1, 0, 1,
-0.4926935, -0.2771574, -3.099636, 0.1529412, 1, 0, 1,
-0.4925519, 1.88509, -1.934052, 0.145098, 1, 0, 1,
-0.4915247, 0.7267146, 0.7220878, 0.1411765, 1, 0, 1,
-0.4863447, -0.3651978, -0.8859059, 0.1333333, 1, 0, 1,
-0.4861209, -0.2674945, -2.061258, 0.1294118, 1, 0, 1,
-0.4857098, 2.475296, 1.014702, 0.1215686, 1, 0, 1,
-0.4806662, 0.04251625, -1.447085, 0.1176471, 1, 0, 1,
-0.4661033, -0.9065567, -2.223957, 0.1098039, 1, 0, 1,
-0.4619563, -1.89257, -3.748692, 0.1058824, 1, 0, 1,
-0.4610261, 1.260936, -1.642017, 0.09803922, 1, 0, 1,
-0.4609574, -1.415699, -3.234246, 0.09019608, 1, 0, 1,
-0.4599883, 0.4658273, -0.9595875, 0.08627451, 1, 0, 1,
-0.4559967, -1.053221, -2.936242, 0.07843138, 1, 0, 1,
-0.454706, -0.04531555, -1.186212, 0.07450981, 1, 0, 1,
-0.4535374, 2.758766, -1.104809, 0.06666667, 1, 0, 1,
-0.4533069, 0.1545641, -0.4022176, 0.0627451, 1, 0, 1,
-0.4493403, 3.076865, 0.004807788, 0.05490196, 1, 0, 1,
-0.4454829, 1.288195, -1.0064, 0.05098039, 1, 0, 1,
-0.4427783, -0.3157668, -2.035115, 0.04313726, 1, 0, 1,
-0.4422116, -0.1706534, -1.704448, 0.03921569, 1, 0, 1,
-0.439849, 0.1434796, -2.6612, 0.03137255, 1, 0, 1,
-0.4373104, 1.28008, -0.9887519, 0.02745098, 1, 0, 1,
-0.4303323, -0.9484572, -1.644428, 0.01960784, 1, 0, 1,
-0.4289505, -1.002817, -4.219242, 0.01568628, 1, 0, 1,
-0.4260533, 1.330027, 0.3956766, 0.007843138, 1, 0, 1,
-0.4258023, -0.1691922, -1.82082, 0.003921569, 1, 0, 1,
-0.4253113, 1.010247, -0.8312723, 0, 1, 0.003921569, 1,
-0.4251187, -2.473556, -2.000762, 0, 1, 0.01176471, 1,
-0.422504, -0.8869914, -2.509447, 0, 1, 0.01568628, 1,
-0.4201042, -0.1283247, -0.214683, 0, 1, 0.02352941, 1,
-0.4165417, -1.01013, -3.236711, 0, 1, 0.02745098, 1,
-0.4130759, 0.3893825, 0.4205416, 0, 1, 0.03529412, 1,
-0.4091, 1.289885, -1.213037, 0, 1, 0.03921569, 1,
-0.4064946, -0.4456745, -3.312145, 0, 1, 0.04705882, 1,
-0.40272, 0.05184248, -2.048821, 0, 1, 0.05098039, 1,
-0.4026814, 0.2904091, -1.744712, 0, 1, 0.05882353, 1,
-0.4024023, 0.3349695, 0.21207, 0, 1, 0.0627451, 1,
-0.4020477, 0.4264248, -0.2347897, 0, 1, 0.07058824, 1,
-0.3952371, -1.085537, -1.486409, 0, 1, 0.07450981, 1,
-0.3938723, 0.01981068, -1.607346, 0, 1, 0.08235294, 1,
-0.3934262, 2.241062, -0.6250315, 0, 1, 0.08627451, 1,
-0.3880349, 0.3131791, -0.9311625, 0, 1, 0.09411765, 1,
-0.3876624, -0.3996406, -2.589038, 0, 1, 0.1019608, 1,
-0.385702, 0.09773121, 0.06399557, 0, 1, 0.1058824, 1,
-0.3817941, -1.661029, -2.853096, 0, 1, 0.1137255, 1,
-0.3810834, -0.1689212, -2.164693, 0, 1, 0.1176471, 1,
-0.3797337, -0.7790319, -1.649702, 0, 1, 0.1254902, 1,
-0.3786094, 0.9365938, -0.01278395, 0, 1, 0.1294118, 1,
-0.3774007, 1.002223, -0.9341411, 0, 1, 0.1372549, 1,
-0.3761335, -0.807496, -1.481275, 0, 1, 0.1411765, 1,
-0.3691569, 1.278036, 0.5655114, 0, 1, 0.1490196, 1,
-0.3689126, -0.5426989, -2.281952, 0, 1, 0.1529412, 1,
-0.3673079, -0.7365836, -0.6809137, 0, 1, 0.1607843, 1,
-0.3654923, -0.739422, -2.394385, 0, 1, 0.1647059, 1,
-0.3633017, 0.9115088, -0.9671084, 0, 1, 0.172549, 1,
-0.3630823, 0.2088233, -1.032872, 0, 1, 0.1764706, 1,
-0.3626156, 0.0007499588, -1.37565, 0, 1, 0.1843137, 1,
-0.3558217, 0.3637688, 0.7545218, 0, 1, 0.1882353, 1,
-0.3508949, -0.2745536, -1.390444, 0, 1, 0.1960784, 1,
-0.348783, 1.717499, -0.4516202, 0, 1, 0.2039216, 1,
-0.3485339, -0.7875702, -4.189835, 0, 1, 0.2078431, 1,
-0.3479597, 0.6809956, -0.5043051, 0, 1, 0.2156863, 1,
-0.3464292, -0.9809155, -2.445401, 0, 1, 0.2196078, 1,
-0.3450881, 0.08518329, -0.5180338, 0, 1, 0.227451, 1,
-0.3440266, 2.30053, 1.37311, 0, 1, 0.2313726, 1,
-0.3410743, -0.4108194, -1.261305, 0, 1, 0.2392157, 1,
-0.3398628, 0.2139449, 0.154457, 0, 1, 0.2431373, 1,
-0.3394311, 0.8196521, -0.5785061, 0, 1, 0.2509804, 1,
-0.3358189, -0.3034406, -2.411818, 0, 1, 0.254902, 1,
-0.3350782, 0.1615127, -0.2905335, 0, 1, 0.2627451, 1,
-0.3339173, -0.6834372, -1.861695, 0, 1, 0.2666667, 1,
-0.3334297, -0.4985892, -1.12209, 0, 1, 0.2745098, 1,
-0.326297, -0.6363187, -2.464894, 0, 1, 0.2784314, 1,
-0.3224508, -0.5411801, -3.402107, 0, 1, 0.2862745, 1,
-0.3224427, -1.210728, -2.799204, 0, 1, 0.2901961, 1,
-0.3136207, -0.2112967, -3.185826, 0, 1, 0.2980392, 1,
-0.3121177, -1.718227, -3.579625, 0, 1, 0.3058824, 1,
-0.307652, -1.092049, -2.66471, 0, 1, 0.3098039, 1,
-0.3072341, 0.6417679, -0.4569213, 0, 1, 0.3176471, 1,
-0.3047495, 0.2396557, -1.287667, 0, 1, 0.3215686, 1,
-0.2976347, 0.2817646, -1.466866, 0, 1, 0.3294118, 1,
-0.2974882, -1.153246, -4.331381, 0, 1, 0.3333333, 1,
-0.2966659, 2.222916, -2.707278, 0, 1, 0.3411765, 1,
-0.2941175, -1.092782, -3.947157, 0, 1, 0.345098, 1,
-0.2890353, -1.030099, -1.859024, 0, 1, 0.3529412, 1,
-0.2884966, 0.1458796, 1.781093, 0, 1, 0.3568628, 1,
-0.2857487, 0.9881253, -1.063427, 0, 1, 0.3647059, 1,
-0.2800203, -0.06327178, -0.7006094, 0, 1, 0.3686275, 1,
-0.27831, -0.9477453, -4.592752, 0, 1, 0.3764706, 1,
-0.275898, -1.304162, -3.850474, 0, 1, 0.3803922, 1,
-0.2740472, 0.1117156, -2.262716, 0, 1, 0.3882353, 1,
-0.272046, -1.151004, -2.265207, 0, 1, 0.3921569, 1,
-0.265584, 1.591917, -1.106703, 0, 1, 0.4, 1,
-0.2644361, -0.950067, -2.642724, 0, 1, 0.4078431, 1,
-0.2626708, 0.07142328, -0.7101493, 0, 1, 0.4117647, 1,
-0.2620818, 1.232098, 0.6352974, 0, 1, 0.4196078, 1,
-0.2596322, -0.7248685, -3.766834, 0, 1, 0.4235294, 1,
-0.256697, -0.9781111, -2.470061, 0, 1, 0.4313726, 1,
-0.2535446, 0.4072796, 1.012485, 0, 1, 0.4352941, 1,
-0.2507916, -0.3763438, -2.139086, 0, 1, 0.4431373, 1,
-0.2472202, -0.6118708, -2.235231, 0, 1, 0.4470588, 1,
-0.2451778, 0.3635207, -1.196859, 0, 1, 0.454902, 1,
-0.2446911, -0.09778055, -1.730932, 0, 1, 0.4588235, 1,
-0.2432202, -1.662922, -3.678002, 0, 1, 0.4666667, 1,
-0.2432041, 0.278001, 0.1574086, 0, 1, 0.4705882, 1,
-0.2427574, 1.441182, -0.5199272, 0, 1, 0.4784314, 1,
-0.2401906, -1.832264, -3.701592, 0, 1, 0.4823529, 1,
-0.2375686, -1.836026, -1.877474, 0, 1, 0.4901961, 1,
-0.2360641, -0.8081731, -2.399595, 0, 1, 0.4941176, 1,
-0.2348005, 0.2255113, -1.595057, 0, 1, 0.5019608, 1,
-0.2331075, -0.223729, -2.303482, 0, 1, 0.509804, 1,
-0.2304231, -0.5324485, -2.503775, 0, 1, 0.5137255, 1,
-0.2294405, 0.3171571, -2.408182, 0, 1, 0.5215687, 1,
-0.2289874, 0.2816457, 1.127366, 0, 1, 0.5254902, 1,
-0.2263758, 0.669324, -1.253902, 0, 1, 0.5333334, 1,
-0.2256843, 0.05035853, -1.445614, 0, 1, 0.5372549, 1,
-0.224164, 0.122481, -0.8274483, 0, 1, 0.5450981, 1,
-0.2182312, -0.5300945, -3.78793, 0, 1, 0.5490196, 1,
-0.2163502, 1.577534, -1.921685, 0, 1, 0.5568628, 1,
-0.2155508, -1.215283, -2.913634, 0, 1, 0.5607843, 1,
-0.2107324, 0.2550642, -1.400719, 0, 1, 0.5686275, 1,
-0.2064918, -1.4289, -1.385154, 0, 1, 0.572549, 1,
-0.2010642, -0.8816467, -3.361523, 0, 1, 0.5803922, 1,
-0.1998204, 2.380651, 1.473036, 0, 1, 0.5843138, 1,
-0.1915856, 0.7973241, 0.3836509, 0, 1, 0.5921569, 1,
-0.1893437, 1.626472, -1.063375, 0, 1, 0.5960785, 1,
-0.1885615, -2.154337, -3.206725, 0, 1, 0.6039216, 1,
-0.1881859, 0.8390598, 1.160562, 0, 1, 0.6117647, 1,
-0.1852826, 0.4712132, 0.4961585, 0, 1, 0.6156863, 1,
-0.1850429, 0.2129474, 0.09349699, 0, 1, 0.6235294, 1,
-0.1829662, -0.4483686, -2.556502, 0, 1, 0.627451, 1,
-0.1810783, -0.2395849, -2.817412, 0, 1, 0.6352941, 1,
-0.180094, 0.6430898, 1.621225, 0, 1, 0.6392157, 1,
-0.1796794, -0.3289637, -2.35197, 0, 1, 0.6470588, 1,
-0.1788188, 0.2484087, -1.044919, 0, 1, 0.6509804, 1,
-0.172623, -0.1048882, -2.51688, 0, 1, 0.6588235, 1,
-0.1667513, -0.4077197, -2.484605, 0, 1, 0.6627451, 1,
-0.1659316, -2.018156, -4.448418, 0, 1, 0.6705883, 1,
-0.1650862, 1.811272, -1.034275, 0, 1, 0.6745098, 1,
-0.163208, -0.5445515, -5.337285, 0, 1, 0.682353, 1,
-0.1601996, -0.04176828, -2.712925, 0, 1, 0.6862745, 1,
-0.1584563, 0.1997554, 0.1969681, 0, 1, 0.6941177, 1,
-0.1539254, -0.07166144, -1.471128, 0, 1, 0.7019608, 1,
-0.1503768, -1.295189, -4.540218, 0, 1, 0.7058824, 1,
-0.1467755, -1.66792, -1.145303, 0, 1, 0.7137255, 1,
-0.144171, 0.6189847, 1.342145, 0, 1, 0.7176471, 1,
-0.1422342, -0.6173854, -1.890498, 0, 1, 0.7254902, 1,
-0.1416529, 0.3503395, -0.6510426, 0, 1, 0.7294118, 1,
-0.1408826, 0.5436363, -0.2249689, 0, 1, 0.7372549, 1,
-0.138085, -0.8858383, -2.361545, 0, 1, 0.7411765, 1,
-0.1356132, -1.163894, -2.761811, 0, 1, 0.7490196, 1,
-0.1337517, -0.009230882, -2.871294, 0, 1, 0.7529412, 1,
-0.1310048, -0.3246106, -3.881701, 0, 1, 0.7607843, 1,
-0.1280859, -0.2848109, -1.898438, 0, 1, 0.7647059, 1,
-0.1187247, -0.1257238, -1.832675, 0, 1, 0.772549, 1,
-0.1108579, -1.369662, -3.835404, 0, 1, 0.7764706, 1,
-0.1030945, -0.4927866, -3.988772, 0, 1, 0.7843137, 1,
-0.1013206, 0.4649743, 0.2378512, 0, 1, 0.7882353, 1,
-0.0989904, -0.7394058, -2.687771, 0, 1, 0.7960784, 1,
-0.09788214, -0.2398495, -2.330873, 0, 1, 0.8039216, 1,
-0.09777939, 1.400442, -1.606853, 0, 1, 0.8078431, 1,
-0.09753311, 0.8911017, 0.1195473, 0, 1, 0.8156863, 1,
-0.09479831, 2.062228, -0.2424535, 0, 1, 0.8196079, 1,
-0.09476557, -1.110331, -2.293205, 0, 1, 0.827451, 1,
-0.09130962, -0.2569034, -2.14289, 0, 1, 0.8313726, 1,
-0.06909587, 0.5877051, 1.462929, 0, 1, 0.8392157, 1,
-0.06856658, -1.706779, -3.462077, 0, 1, 0.8431373, 1,
-0.06612575, 0.5205558, 1.408649, 0, 1, 0.8509804, 1,
-0.06472994, -0.1577318, -3.98409, 0, 1, 0.854902, 1,
-0.06070005, 1.306344, 1.349012, 0, 1, 0.8627451, 1,
-0.05986535, 0.351597, -3.012132, 0, 1, 0.8666667, 1,
-0.05729485, 1.474797, -0.2169849, 0, 1, 0.8745098, 1,
-0.05714071, -1.426019, -2.369891, 0, 1, 0.8784314, 1,
-0.05635771, 1.394142, 1.922195, 0, 1, 0.8862745, 1,
-0.05184705, 1.268503, 0.1199278, 0, 1, 0.8901961, 1,
-0.04972684, 0.002213281, 0.6101841, 0, 1, 0.8980392, 1,
-0.04216284, -1.199511, -3.847602, 0, 1, 0.9058824, 1,
-0.03518209, -0.5740567, -4.568053, 0, 1, 0.9098039, 1,
-0.03437456, -0.2747966, -3.216941, 0, 1, 0.9176471, 1,
-0.03062951, -0.8608006, -3.434746, 0, 1, 0.9215686, 1,
-0.0292299, -0.772387, -3.00694, 0, 1, 0.9294118, 1,
-0.02900907, -0.8591121, -4.581744, 0, 1, 0.9333333, 1,
-0.01935664, -0.0832453, -2.030832, 0, 1, 0.9411765, 1,
-0.01873187, 1.434087, 2.975713, 0, 1, 0.945098, 1,
-0.01599524, 0.7079273, -0.5044911, 0, 1, 0.9529412, 1,
-0.0154705, -0.8767468, -1.423741, 0, 1, 0.9568627, 1,
-0.008963222, -0.06643064, -4.283711, 0, 1, 0.9647059, 1,
-0.006139375, 1.550102, -0.6138362, 0, 1, 0.9686275, 1,
-0.001202014, 0.07451501, -0.6603794, 0, 1, 0.9764706, 1,
-0.0005386762, -1.342184, -2.414307, 0, 1, 0.9803922, 1,
-0.0003464721, 0.2342521, 0.03903945, 0, 1, 0.9882353, 1,
0.009667506, -0.1716578, 2.290987, 0, 1, 0.9921569, 1,
0.01159196, 1.002622, 0.008239511, 0, 1, 1, 1,
0.01444125, 1.419977, -1.121472, 0, 0.9921569, 1, 1,
0.01605474, 0.6933867, 0.1897493, 0, 0.9882353, 1, 1,
0.01781576, 1.212795, 0.4632267, 0, 0.9803922, 1, 1,
0.02421215, -0.3501019, 2.25786, 0, 0.9764706, 1, 1,
0.02652631, 0.001581032, 1.808193, 0, 0.9686275, 1, 1,
0.02803262, -0.5896972, 2.315825, 0, 0.9647059, 1, 1,
0.03407153, -0.3395354, 4.43768, 0, 0.9568627, 1, 1,
0.03897944, 0.3524631, 1.35379, 0, 0.9529412, 1, 1,
0.05267892, 0.5054498, 1.373586, 0, 0.945098, 1, 1,
0.05348579, -0.862923, 3.925679, 0, 0.9411765, 1, 1,
0.06317815, 1.361613, -0.163614, 0, 0.9333333, 1, 1,
0.06560005, 0.4847688, 1.166489, 0, 0.9294118, 1, 1,
0.06798662, 1.199865, 1.103291, 0, 0.9215686, 1, 1,
0.07205561, 0.6286444, -1.543252, 0, 0.9176471, 1, 1,
0.07463996, 2.984473, 0.1024259, 0, 0.9098039, 1, 1,
0.07513722, 1.039889, -0.847564, 0, 0.9058824, 1, 1,
0.07607409, -0.09891145, 3.069457, 0, 0.8980392, 1, 1,
0.07727011, 1.158628, 0.04640298, 0, 0.8901961, 1, 1,
0.0839495, 0.4471295, -1.173503, 0, 0.8862745, 1, 1,
0.08443394, 1.635684, 0.936776, 0, 0.8784314, 1, 1,
0.08632797, -0.724362, 3.931263, 0, 0.8745098, 1, 1,
0.08810294, -1.282422, 3.977628, 0, 0.8666667, 1, 1,
0.08877806, -0.812325, 5.132505, 0, 0.8627451, 1, 1,
0.09217509, 0.6645545, -0.7925939, 0, 0.854902, 1, 1,
0.09232783, -0.005999095, 1.836458, 0, 0.8509804, 1, 1,
0.09347225, -0.3271054, 2.425455, 0, 0.8431373, 1, 1,
0.09473886, -0.668882, 0.1766621, 0, 0.8392157, 1, 1,
0.0963842, -1.473325, 0.4235042, 0, 0.8313726, 1, 1,
0.09692468, 0.4657309, 0.6473055, 0, 0.827451, 1, 1,
0.09721448, 0.3057525, 0.190984, 0, 0.8196079, 1, 1,
0.09799478, -0.8352066, 4.608667, 0, 0.8156863, 1, 1,
0.09820002, -0.2029727, 0.9508888, 0, 0.8078431, 1, 1,
0.09892339, -0.03908349, 1.842902, 0, 0.8039216, 1, 1,
0.1031493, 1.158378, -1.324626, 0, 0.7960784, 1, 1,
0.1045973, -0.7108977, 4.260523, 0, 0.7882353, 1, 1,
0.1051835, 0.1973638, 0.4028603, 0, 0.7843137, 1, 1,
0.1131164, 0.4621173, -0.2682335, 0, 0.7764706, 1, 1,
0.1131644, 0.6013647, 0.05486656, 0, 0.772549, 1, 1,
0.1192644, -1.40793, 3.678316, 0, 0.7647059, 1, 1,
0.1220534, 1.32675, -1.826058, 0, 0.7607843, 1, 1,
0.1229552, -0.1077277, 0.9850594, 0, 0.7529412, 1, 1,
0.1287989, 1.397831, -0.120039, 0, 0.7490196, 1, 1,
0.128906, -1.650981, 1.782876, 0, 0.7411765, 1, 1,
0.1302852, 0.07968691, 1.431898, 0, 0.7372549, 1, 1,
0.13089, -1.363658, 2.745029, 0, 0.7294118, 1, 1,
0.1353326, 1.659244, -2.082134, 0, 0.7254902, 1, 1,
0.1354956, 1.849243, 0.5513601, 0, 0.7176471, 1, 1,
0.1366365, 0.3826689, -0.4085111, 0, 0.7137255, 1, 1,
0.1373333, 0.5717812, 2.753879, 0, 0.7058824, 1, 1,
0.1412732, 1.229208, 0.1515024, 0, 0.6980392, 1, 1,
0.1423544, -0.4547639, 2.346835, 0, 0.6941177, 1, 1,
0.1540393, 1.18011, -0.2732383, 0, 0.6862745, 1, 1,
0.1547883, -0.9889886, 4.090193, 0, 0.682353, 1, 1,
0.1601347, -0.4398479, 2.844152, 0, 0.6745098, 1, 1,
0.1618674, -0.8746573, 4.018019, 0, 0.6705883, 1, 1,
0.1676859, -0.9877065, 3.201285, 0, 0.6627451, 1, 1,
0.171076, 0.9653634, 0.8280999, 0, 0.6588235, 1, 1,
0.1716984, -0.6805242, 2.742059, 0, 0.6509804, 1, 1,
0.1745081, 0.914744, -0.4405788, 0, 0.6470588, 1, 1,
0.1780637, 0.2647615, 1.799395, 0, 0.6392157, 1, 1,
0.1799538, -1.307372, 4.316622, 0, 0.6352941, 1, 1,
0.1803183, 1.667313, 0.174557, 0, 0.627451, 1, 1,
0.1803273, 0.1884531, 2.077996, 0, 0.6235294, 1, 1,
0.1820303, -0.4579493, 2.733552, 0, 0.6156863, 1, 1,
0.1820977, 1.010315, 0.3647618, 0, 0.6117647, 1, 1,
0.1825691, -0.3913282, 2.366158, 0, 0.6039216, 1, 1,
0.1864951, 0.7538205, -0.06721143, 0, 0.5960785, 1, 1,
0.1957378, 0.381375, -1.159428, 0, 0.5921569, 1, 1,
0.1973085, 0.1775107, 2.693964, 0, 0.5843138, 1, 1,
0.1984389, 1.421975, 0.7738735, 0, 0.5803922, 1, 1,
0.19954, -0.8522824, 1.485789, 0, 0.572549, 1, 1,
0.1998353, -0.09840089, 3.77317, 0, 0.5686275, 1, 1,
0.2019129, 1.239816, -0.05139028, 0, 0.5607843, 1, 1,
0.202694, 1.13179, -0.3483547, 0, 0.5568628, 1, 1,
0.2037974, 0.07921312, 1.938577, 0, 0.5490196, 1, 1,
0.2083226, -1.177882, 2.962045, 0, 0.5450981, 1, 1,
0.2093991, -0.4974845, 3.32909, 0, 0.5372549, 1, 1,
0.2100795, -0.9848301, 3.688559, 0, 0.5333334, 1, 1,
0.2123396, -1.990993, 4.432591, 0, 0.5254902, 1, 1,
0.2162477, 0.03942177, -0.3986676, 0, 0.5215687, 1, 1,
0.2181098, -0.426529, 2.497385, 0, 0.5137255, 1, 1,
0.2181209, 0.4774751, -0.01607757, 0, 0.509804, 1, 1,
0.2231293, 0.8539597, 0.6612551, 0, 0.5019608, 1, 1,
0.2251739, -0.7203094, 1.63256, 0, 0.4941176, 1, 1,
0.2263586, -0.8281059, 1.416604, 0, 0.4901961, 1, 1,
0.2362966, -0.6594859, 2.655524, 0, 0.4823529, 1, 1,
0.2368946, -1.02468, 4.48804, 0, 0.4784314, 1, 1,
0.2395137, 0.6822172, 0.3468056, 0, 0.4705882, 1, 1,
0.2474688, 0.9825026, 0.7631935, 0, 0.4666667, 1, 1,
0.2505858, -1.023867, 2.231287, 0, 0.4588235, 1, 1,
0.2511047, -0.4679267, 1.666414, 0, 0.454902, 1, 1,
0.2519957, 1.552879, 1.265668, 0, 0.4470588, 1, 1,
0.2534011, 0.02611551, 2.999154, 0, 0.4431373, 1, 1,
0.2556338, -0.010347, 3.022143, 0, 0.4352941, 1, 1,
0.2563551, -1.534944, 0.2232472, 0, 0.4313726, 1, 1,
0.258285, 0.5871168, 1.840197, 0, 0.4235294, 1, 1,
0.2600773, -0.08579279, 1.848206, 0, 0.4196078, 1, 1,
0.262321, 0.6339601, 1.875892, 0, 0.4117647, 1, 1,
0.2644539, -1.040781, 1.047413, 0, 0.4078431, 1, 1,
0.2649099, -0.7478211, 3.381549, 0, 0.4, 1, 1,
0.2669558, 0.5348264, 0.2125674, 0, 0.3921569, 1, 1,
0.2694857, 0.2509072, -0.486138, 0, 0.3882353, 1, 1,
0.2709877, 0.1645156, -1.011495, 0, 0.3803922, 1, 1,
0.2728258, 1.125462, 1.982328, 0, 0.3764706, 1, 1,
0.2743666, -1.027379, 3.236897, 0, 0.3686275, 1, 1,
0.2748393, 1.291566, 0.704473, 0, 0.3647059, 1, 1,
0.2751076, -0.08106389, 1.449214, 0, 0.3568628, 1, 1,
0.2865272, 1.375882, 0.6390957, 0, 0.3529412, 1, 1,
0.2898449, 0.1376588, 2.00797, 0, 0.345098, 1, 1,
0.2942414, -1.679526, 4.042542, 0, 0.3411765, 1, 1,
0.2965117, 0.8244942, 0.4856021, 0, 0.3333333, 1, 1,
0.2997104, -1.916686, 2.12569, 0, 0.3294118, 1, 1,
0.3012187, -0.6976917, 3.811735, 0, 0.3215686, 1, 1,
0.3012584, -0.2895082, 2.69787, 0, 0.3176471, 1, 1,
0.3029298, -0.06292973, 1.235754, 0, 0.3098039, 1, 1,
0.3090554, -0.4994092, 2.877827, 0, 0.3058824, 1, 1,
0.3193395, 0.7458477, 0.4228338, 0, 0.2980392, 1, 1,
0.3200043, -0.5548371, 4.055832, 0, 0.2901961, 1, 1,
0.3213804, 0.1390787, 1.141916, 0, 0.2862745, 1, 1,
0.3316276, 0.5436194, 1.302199, 0, 0.2784314, 1, 1,
0.3319039, 0.04810518, 2.098615, 0, 0.2745098, 1, 1,
0.3329692, 0.04136405, 1.047218, 0, 0.2666667, 1, 1,
0.3444957, 0.6004769, -0.6059025, 0, 0.2627451, 1, 1,
0.3563224, -2.311142, 2.035751, 0, 0.254902, 1, 1,
0.3565482, -0.3526872, 2.818712, 0, 0.2509804, 1, 1,
0.3622956, 0.5474532, 0.3824974, 0, 0.2431373, 1, 1,
0.36415, -2.20017, 1.7595, 0, 0.2392157, 1, 1,
0.3649844, -0.9385497, 4.458834, 0, 0.2313726, 1, 1,
0.3669897, 0.08470324, -0.749578, 0, 0.227451, 1, 1,
0.368653, -1.029922, 2.892922, 0, 0.2196078, 1, 1,
0.3753198, -2.227322, 1.858853, 0, 0.2156863, 1, 1,
0.3795984, -1.238306, 2.945743, 0, 0.2078431, 1, 1,
0.3810759, -0.6182178, 1.10898, 0, 0.2039216, 1, 1,
0.3821183, -1.306418, 3.257611, 0, 0.1960784, 1, 1,
0.3823462, 0.9691115, 0.009365578, 0, 0.1882353, 1, 1,
0.387023, -0.246955, 3.160377, 0, 0.1843137, 1, 1,
0.3878018, -0.9537899, 1.48619, 0, 0.1764706, 1, 1,
0.3879929, -0.9011007, 1.464023, 0, 0.172549, 1, 1,
0.3907327, -0.5564547, 1.361575, 0, 0.1647059, 1, 1,
0.3928837, 0.2947228, -0.5364808, 0, 0.1607843, 1, 1,
0.3934926, 0.5771276, -2.426003, 0, 0.1529412, 1, 1,
0.3988304, 0.8169755, 1.266801, 0, 0.1490196, 1, 1,
0.3991626, -0.1032038, 0.7057393, 0, 0.1411765, 1, 1,
0.4021209, -1.095419, 2.735672, 0, 0.1372549, 1, 1,
0.4037824, 1.747626, 2.222725, 0, 0.1294118, 1, 1,
0.4059715, 1.312097, -0.6427255, 0, 0.1254902, 1, 1,
0.4073861, 0.03441719, 1.93466, 0, 0.1176471, 1, 1,
0.4105163, -2.342095, 2.566446, 0, 0.1137255, 1, 1,
0.4130833, 0.7889683, 1.321084, 0, 0.1058824, 1, 1,
0.4131309, -1.355243, 2.373822, 0, 0.09803922, 1, 1,
0.4162892, 1.43216, 0.2215517, 0, 0.09411765, 1, 1,
0.416647, -0.4518979, 2.857414, 0, 0.08627451, 1, 1,
0.4190641, 1.138819, 1.221833, 0, 0.08235294, 1, 1,
0.4200021, -0.6084703, 1.914761, 0, 0.07450981, 1, 1,
0.4206817, 0.8582191, 0.9694919, 0, 0.07058824, 1, 1,
0.4222978, -1.306784, 2.634192, 0, 0.0627451, 1, 1,
0.4281174, 0.002352993, 1.612996, 0, 0.05882353, 1, 1,
0.4295312, 0.9855923, 0.3406903, 0, 0.05098039, 1, 1,
0.4298746, -0.8983305, 1.913575, 0, 0.04705882, 1, 1,
0.4322015, -0.3198675, 1.609968, 0, 0.03921569, 1, 1,
0.4331086, 0.4934374, 2.461066, 0, 0.03529412, 1, 1,
0.4346538, -0.1076162, 1.107948, 0, 0.02745098, 1, 1,
0.4359189, -1.921397, 3.286329, 0, 0.02352941, 1, 1,
0.4382092, 1.724472, -0.4371049, 0, 0.01568628, 1, 1,
0.4416182, -0.2378242, 1.855694, 0, 0.01176471, 1, 1,
0.4430305, 0.7586158, 2.87163, 0, 0.003921569, 1, 1,
0.4510291, 0.6639958, 0.6749337, 0.003921569, 0, 1, 1,
0.4525481, -0.2211521, 1.066911, 0.007843138, 0, 1, 1,
0.4539087, -1.035537, 2.12087, 0.01568628, 0, 1, 1,
0.4569061, 1.343508, 0.2829691, 0.01960784, 0, 1, 1,
0.4601459, -0.2265387, 1.458718, 0.02745098, 0, 1, 1,
0.4627731, 0.2472715, 0.1156477, 0.03137255, 0, 1, 1,
0.4664069, -0.787714, 2.686474, 0.03921569, 0, 1, 1,
0.4681289, 0.1053946, 1.92291, 0.04313726, 0, 1, 1,
0.46828, 1.493168, 1.210042, 0.05098039, 0, 1, 1,
0.4749251, -1.01755, 1.104137, 0.05490196, 0, 1, 1,
0.475502, 0.7277455, 0.6757641, 0.0627451, 0, 1, 1,
0.4758788, 0.9677317, -0.4070933, 0.06666667, 0, 1, 1,
0.4776234, 1.61308, -0.08590637, 0.07450981, 0, 1, 1,
0.4804519, 0.08818914, 1.282809, 0.07843138, 0, 1, 1,
0.482638, 0.3033036, 0.293914, 0.08627451, 0, 1, 1,
0.4829348, 0.2244092, 1.573986, 0.09019608, 0, 1, 1,
0.4834487, 0.7480508, 1.001258, 0.09803922, 0, 1, 1,
0.4851623, 0.8510449, -0.9912109, 0.1058824, 0, 1, 1,
0.4851846, 0.5155439, 0.2024648, 0.1098039, 0, 1, 1,
0.4852582, 0.8647456, 1.076998, 0.1176471, 0, 1, 1,
0.4862512, -0.4883094, 1.574876, 0.1215686, 0, 1, 1,
0.4863017, -1.3928, 3.540999, 0.1294118, 0, 1, 1,
0.4868104, 0.5628931, 0.2767636, 0.1333333, 0, 1, 1,
0.4892185, 1.960517, 1.694501, 0.1411765, 0, 1, 1,
0.4915394, -0.7594283, 1.963888, 0.145098, 0, 1, 1,
0.4965195, 0.3846407, 0.9947222, 0.1529412, 0, 1, 1,
0.4968844, 0.3884147, 0.9610806, 0.1568628, 0, 1, 1,
0.5014809, 1.147139, 0.3265852, 0.1647059, 0, 1, 1,
0.5049863, -0.7276007, 3.662295, 0.1686275, 0, 1, 1,
0.5055548, 1.819906, 0.08142086, 0.1764706, 0, 1, 1,
0.5058711, 0.7812526, 0.7862836, 0.1803922, 0, 1, 1,
0.5069708, -0.1477731, 2.183878, 0.1882353, 0, 1, 1,
0.5077569, -0.5846483, 4.52596, 0.1921569, 0, 1, 1,
0.5080508, 1.894331, -0.0707086, 0.2, 0, 1, 1,
0.5136284, 1.12433, 1.093981, 0.2078431, 0, 1, 1,
0.516668, -1.127058, 3.665944, 0.2117647, 0, 1, 1,
0.51965, 0.9385312, 1.174695, 0.2196078, 0, 1, 1,
0.5249366, 0.7904599, -0.2030923, 0.2235294, 0, 1, 1,
0.5262466, -0.8660495, 2.625684, 0.2313726, 0, 1, 1,
0.5269143, 0.3924002, 0.6579885, 0.2352941, 0, 1, 1,
0.5295342, -1.909034, 0.9711863, 0.2431373, 0, 1, 1,
0.5300556, 1.1742, 0.8592486, 0.2470588, 0, 1, 1,
0.5301708, 0.06608108, 0.7565818, 0.254902, 0, 1, 1,
0.5342814, -0.3972489, 2.555469, 0.2588235, 0, 1, 1,
0.5371356, 0.3797554, -0.2374878, 0.2666667, 0, 1, 1,
0.5436057, -2.487305, 4.323509, 0.2705882, 0, 1, 1,
0.5493442, -0.6685299, 2.716858, 0.2784314, 0, 1, 1,
0.5535203, -0.8964393, 2.36748, 0.282353, 0, 1, 1,
0.5580671, -1.395518, 3.353019, 0.2901961, 0, 1, 1,
0.558225, 0.555823, 1.148188, 0.2941177, 0, 1, 1,
0.5605276, 0.6060797, -0.03504062, 0.3019608, 0, 1, 1,
0.5646307, -0.5518597, 2.530682, 0.3098039, 0, 1, 1,
0.5682108, 0.4078299, 2.36641, 0.3137255, 0, 1, 1,
0.5704788, 0.4371992, 0.750133, 0.3215686, 0, 1, 1,
0.5708627, -0.1787433, 0.7566115, 0.3254902, 0, 1, 1,
0.5734476, 0.4697433, 1.961069, 0.3333333, 0, 1, 1,
0.5739608, 1.407791, -0.3364381, 0.3372549, 0, 1, 1,
0.5805591, 0.4586496, 1.678905, 0.345098, 0, 1, 1,
0.5851096, 0.2896723, 0.206761, 0.3490196, 0, 1, 1,
0.5870631, 0.441762, -0.4406704, 0.3568628, 0, 1, 1,
0.5876998, 0.2615405, 0.7123804, 0.3607843, 0, 1, 1,
0.5951013, 1.077886, -0.2600634, 0.3686275, 0, 1, 1,
0.5959288, 0.5427738, -0.8555054, 0.372549, 0, 1, 1,
0.5991537, 2.037365, 1.256566, 0.3803922, 0, 1, 1,
0.6030051, -0.299758, -0.7732325, 0.3843137, 0, 1, 1,
0.6051703, 1.061985, 1.300667, 0.3921569, 0, 1, 1,
0.6064895, -0.08910691, 2.294821, 0.3960784, 0, 1, 1,
0.6068095, 1.420111, -0.0616344, 0.4039216, 0, 1, 1,
0.6077132, -0.8062245, 0.6739777, 0.4117647, 0, 1, 1,
0.6084641, 0.6905248, -0.4382099, 0.4156863, 0, 1, 1,
0.6112944, -0.5244272, 2.148747, 0.4235294, 0, 1, 1,
0.613832, -0.7725217, 3.814599, 0.427451, 0, 1, 1,
0.6145524, 0.03342831, 3.013661, 0.4352941, 0, 1, 1,
0.6169688, 0.06302146, 0.977311, 0.4392157, 0, 1, 1,
0.6200663, 1.077651, 1.674226, 0.4470588, 0, 1, 1,
0.6252435, -0.05480741, 0.7005364, 0.4509804, 0, 1, 1,
0.6296051, 1.442014, 0.02377362, 0.4588235, 0, 1, 1,
0.6360717, 0.9824378, 1.312135, 0.4627451, 0, 1, 1,
0.6374812, -0.2649148, 2.426202, 0.4705882, 0, 1, 1,
0.6394691, -0.1403572, 2.908448, 0.4745098, 0, 1, 1,
0.6422076, 0.7789367, 0.3819994, 0.4823529, 0, 1, 1,
0.6476386, -0.7777832, 2.75554, 0.4862745, 0, 1, 1,
0.6512777, 0.7399148, 0.7702417, 0.4941176, 0, 1, 1,
0.6578851, -0.3858581, 1.100017, 0.5019608, 0, 1, 1,
0.6582721, -1.410187, 2.177825, 0.5058824, 0, 1, 1,
0.663173, 2.732777, 1.293344, 0.5137255, 0, 1, 1,
0.6680298, 0.3503029, 1.178513, 0.5176471, 0, 1, 1,
0.6750358, 0.4697274, 0.1048979, 0.5254902, 0, 1, 1,
0.6799561, 0.6343278, -0.9869474, 0.5294118, 0, 1, 1,
0.6836469, 0.08017915, 2.423315, 0.5372549, 0, 1, 1,
0.6840973, 1.186901, 1.458076, 0.5411765, 0, 1, 1,
0.6903802, 1.665443, 1.061864, 0.5490196, 0, 1, 1,
0.6906892, 0.3918545, 0.7976636, 0.5529412, 0, 1, 1,
0.6990983, -0.9313462, 3.073879, 0.5607843, 0, 1, 1,
0.7020583, -0.4355865, 1.691853, 0.5647059, 0, 1, 1,
0.7038063, 1.238576, 0.6923363, 0.572549, 0, 1, 1,
0.7049816, 0.3429804, 0.9181733, 0.5764706, 0, 1, 1,
0.7058812, -1.108341, 1.920661, 0.5843138, 0, 1, 1,
0.707428, 0.831725, 0.6420339, 0.5882353, 0, 1, 1,
0.7127138, -0.1277877, 1.993324, 0.5960785, 0, 1, 1,
0.7187804, 1.538435, 0.3962939, 0.6039216, 0, 1, 1,
0.7199677, -0.1120619, -0.6580253, 0.6078432, 0, 1, 1,
0.7199906, -0.5178207, 1.833675, 0.6156863, 0, 1, 1,
0.7205586, 0.8568756, 2.248425, 0.6196079, 0, 1, 1,
0.7224525, 0.5405364, 0.2790065, 0.627451, 0, 1, 1,
0.7230013, -2.257611, -0.136912, 0.6313726, 0, 1, 1,
0.7237752, 0.2896403, -0.08213448, 0.6392157, 0, 1, 1,
0.7256416, 1.200022, 1.318627, 0.6431373, 0, 1, 1,
0.7276226, 2.41113, 0.3418747, 0.6509804, 0, 1, 1,
0.7324254, 1.320416, 1.30617, 0.654902, 0, 1, 1,
0.7340928, -1.21511, 2.906058, 0.6627451, 0, 1, 1,
0.7347989, -1.413346, 3.737417, 0.6666667, 0, 1, 1,
0.7350615, 2.778581, 0.8774185, 0.6745098, 0, 1, 1,
0.7427426, 0.7302636, 2.036541, 0.6784314, 0, 1, 1,
0.7482463, -0.3400357, 0.2341852, 0.6862745, 0, 1, 1,
0.7746176, 1.056351, -1.07336, 0.6901961, 0, 1, 1,
0.7767627, 0.9331192, 0.9258505, 0.6980392, 0, 1, 1,
0.7776304, 0.2552753, -0.7324009, 0.7058824, 0, 1, 1,
0.778414, 0.3548266, 0.3856163, 0.7098039, 0, 1, 1,
0.7790961, -1.761134, 3.032022, 0.7176471, 0, 1, 1,
0.7800686, 1.114658, -2.592965, 0.7215686, 0, 1, 1,
0.7824218, 0.9070044, -0.04643396, 0.7294118, 0, 1, 1,
0.7826619, -0.6248249, 2.060632, 0.7333333, 0, 1, 1,
0.790777, -0.4139754, 4.126964, 0.7411765, 0, 1, 1,
0.7926349, -0.946741, 2.530626, 0.7450981, 0, 1, 1,
0.7990531, -0.9795457, 1.590476, 0.7529412, 0, 1, 1,
0.7997084, -0.6206946, 3.372124, 0.7568628, 0, 1, 1,
0.8023592, 1.198538, 0.549978, 0.7647059, 0, 1, 1,
0.8055744, 0.04489978, 1.015606, 0.7686275, 0, 1, 1,
0.8095751, -0.465391, 1.722375, 0.7764706, 0, 1, 1,
0.8104525, 1.408931, 1.795121, 0.7803922, 0, 1, 1,
0.8126271, -0.3528411, 2.703945, 0.7882353, 0, 1, 1,
0.8166913, -1.246002, 2.416455, 0.7921569, 0, 1, 1,
0.8194905, -1.01872, 3.689043, 0.8, 0, 1, 1,
0.8216406, 0.3277384, 2.823304, 0.8078431, 0, 1, 1,
0.824724, -1.734689, 4.768923, 0.8117647, 0, 1, 1,
0.8288942, -3.076712, 1.463019, 0.8196079, 0, 1, 1,
0.8310605, -1.332161, 2.977022, 0.8235294, 0, 1, 1,
0.8336406, 1.121072, 1.221314, 0.8313726, 0, 1, 1,
0.8360524, 3.0314, 0.2121858, 0.8352941, 0, 1, 1,
0.8454779, 0.3440775, 0.4815099, 0.8431373, 0, 1, 1,
0.8503761, 1.487752, 0.8094779, 0.8470588, 0, 1, 1,
0.8519964, 2.112756, 1.156407, 0.854902, 0, 1, 1,
0.8573503, -0.4802173, 2.707036, 0.8588235, 0, 1, 1,
0.8602925, 0.5532998, 0.473806, 0.8666667, 0, 1, 1,
0.8621096, 1.365861, -1.44888, 0.8705882, 0, 1, 1,
0.8629237, 1.132645, 0.3827753, 0.8784314, 0, 1, 1,
0.8637566, 0.3030142, 0.173744, 0.8823529, 0, 1, 1,
0.8655854, -1.004688, 1.270633, 0.8901961, 0, 1, 1,
0.8697155, 1.438376, -0.2527931, 0.8941177, 0, 1, 1,
0.8757476, 0.2487275, 0.3600519, 0.9019608, 0, 1, 1,
0.8778152, -0.4741167, 0.6296174, 0.9098039, 0, 1, 1,
0.878023, 1.531717, -0.2457013, 0.9137255, 0, 1, 1,
0.8793631, -0.8131962, 3.215242, 0.9215686, 0, 1, 1,
0.8853532, 0.4225027, 2.747595, 0.9254902, 0, 1, 1,
0.8866726, -0.4771549, 3.752766, 0.9333333, 0, 1, 1,
0.8942195, -0.1970056, 1.344714, 0.9372549, 0, 1, 1,
0.8975594, 0.487526, 1.004231, 0.945098, 0, 1, 1,
0.9015706, 0.3394476, 2.366717, 0.9490196, 0, 1, 1,
0.9032865, 0.9678415, 0.7262937, 0.9568627, 0, 1, 1,
0.9082497, 0.6878892, -0.7525036, 0.9607843, 0, 1, 1,
0.9152658, -1.256717, 1.323872, 0.9686275, 0, 1, 1,
0.9258767, -1.095277, 2.674652, 0.972549, 0, 1, 1,
0.9325452, -1.449315, 1.994071, 0.9803922, 0, 1, 1,
0.9353253, -0.6275069, 2.279955, 0.9843137, 0, 1, 1,
0.9369901, -0.7023928, 3.986953, 0.9921569, 0, 1, 1,
0.9397416, -0.03369934, 1.700938, 0.9960784, 0, 1, 1,
0.9407714, -0.8650207, 2.67538, 1, 0, 0.9960784, 1,
0.9458011, 0.2978589, 1.025937, 1, 0, 0.9882353, 1,
0.9483337, -1.062006, 3.248452, 1, 0, 0.9843137, 1,
0.9536949, -0.4986195, 2.969912, 1, 0, 0.9764706, 1,
0.9546278, 0.912637, 2.74044, 1, 0, 0.972549, 1,
0.9553819, 1.070089, 2.298577, 1, 0, 0.9647059, 1,
0.9657658, -1.249653, 2.58203, 1, 0, 0.9607843, 1,
0.969772, -1.392003, 3.327137, 1, 0, 0.9529412, 1,
0.973084, 0.3450542, 0.803989, 1, 0, 0.9490196, 1,
0.97711, -0.5292453, 3.980887, 1, 0, 0.9411765, 1,
0.9779663, -1.188552, 2.577497, 1, 0, 0.9372549, 1,
0.9799739, 1.136668, 0.3251914, 1, 0, 0.9294118, 1,
0.9807671, -0.6512319, 3.768213, 1, 0, 0.9254902, 1,
0.9852626, 0.3528039, -0.1780121, 1, 0, 0.9176471, 1,
0.9881467, -0.8307959, 3.282875, 1, 0, 0.9137255, 1,
0.9944111, -0.6154318, 2.775532, 1, 0, 0.9058824, 1,
0.9976327, -0.8071315, 0.8110399, 1, 0, 0.9019608, 1,
1.000327, -0.2842033, -0.07677196, 1, 0, 0.8941177, 1,
1.006727, -1.127957, 3.993979, 1, 0, 0.8862745, 1,
1.009676, -1.009603, 1.272193, 1, 0, 0.8823529, 1,
1.015208, 1.008207, 2.426775, 1, 0, 0.8745098, 1,
1.020227, 0.2978774, 2.382674, 1, 0, 0.8705882, 1,
1.033438, -0.7192105, 1.578649, 1, 0, 0.8627451, 1,
1.035896, 0.1376037, 0.7357848, 1, 0, 0.8588235, 1,
1.044304, -1.060092, 1.81611, 1, 0, 0.8509804, 1,
1.050175, 0.2380058, 2.610198, 1, 0, 0.8470588, 1,
1.052907, 1.210204, -0.3360766, 1, 0, 0.8392157, 1,
1.055248, 0.7306221, 1.023118, 1, 0, 0.8352941, 1,
1.059175, -0.3793399, 3.447671, 1, 0, 0.827451, 1,
1.060941, 0.6135421, -0.1208075, 1, 0, 0.8235294, 1,
1.067085, -0.8115014, 2.63079, 1, 0, 0.8156863, 1,
1.069623, 0.8862511, 1.517988, 1, 0, 0.8117647, 1,
1.069891, 0.3644241, 0.1114171, 1, 0, 0.8039216, 1,
1.074747, 0.2242995, -0.1013893, 1, 0, 0.7960784, 1,
1.077413, 0.8431028, 0.02144934, 1, 0, 0.7921569, 1,
1.078317, -0.2332005, 0.4417023, 1, 0, 0.7843137, 1,
1.083916, 2.407443, 1.632189, 1, 0, 0.7803922, 1,
1.085707, 0.7914049, -1.078667, 1, 0, 0.772549, 1,
1.08918, 1.177443, 0.5060831, 1, 0, 0.7686275, 1,
1.093439, -1.882279, 3.17937, 1, 0, 0.7607843, 1,
1.099909, 2.271223, -0.5171487, 1, 0, 0.7568628, 1,
1.100703, 0.5418071, 1.30024, 1, 0, 0.7490196, 1,
1.100799, 0.09248827, 0.3300183, 1, 0, 0.7450981, 1,
1.104093, -0.5572879, 3.050518, 1, 0, 0.7372549, 1,
1.116866, 0.01414005, 1.348572, 1, 0, 0.7333333, 1,
1.126235, 1.308299, 0.174097, 1, 0, 0.7254902, 1,
1.135713, -0.05006487, 1.278567, 1, 0, 0.7215686, 1,
1.143419, 0.5533965, -0.6355811, 1, 0, 0.7137255, 1,
1.148329, -0.6056516, 1.612941, 1, 0, 0.7098039, 1,
1.159576, -0.2471173, 1.55557, 1, 0, 0.7019608, 1,
1.166723, -0.1073181, 1.236877, 1, 0, 0.6941177, 1,
1.168162, 0.01621171, 1.888755, 1, 0, 0.6901961, 1,
1.175292, -0.3747018, 1.982511, 1, 0, 0.682353, 1,
1.175302, 1.058695, -0.2310912, 1, 0, 0.6784314, 1,
1.195321, 0.873798, -0.4776158, 1, 0, 0.6705883, 1,
1.200752, 0.5192263, -0.3029759, 1, 0, 0.6666667, 1,
1.203977, 0.1144428, 1.175658, 1, 0, 0.6588235, 1,
1.204602, -0.5297688, 1.842559, 1, 0, 0.654902, 1,
1.212996, 1.243058, 1.887458, 1, 0, 0.6470588, 1,
1.214422, -1.784718, 2.75015, 1, 0, 0.6431373, 1,
1.214554, -0.2657895, 2.485765, 1, 0, 0.6352941, 1,
1.218326, -0.1611654, 1.23184, 1, 0, 0.6313726, 1,
1.229584, 1.10769, -0.2334027, 1, 0, 0.6235294, 1,
1.232208, 0.7390569, 1.402436, 1, 0, 0.6196079, 1,
1.242146, 0.1134231, 1.745643, 1, 0, 0.6117647, 1,
1.244089, -0.3210995, 2.8824, 1, 0, 0.6078432, 1,
1.25386, -0.9127805, 3.631625, 1, 0, 0.6, 1,
1.253954, -1.491993, 3.803993, 1, 0, 0.5921569, 1,
1.258796, -0.5789441, 0.632397, 1, 0, 0.5882353, 1,
1.271595, 0.2025143, 1.364802, 1, 0, 0.5803922, 1,
1.275398, -0.4415057, 0.775925, 1, 0, 0.5764706, 1,
1.287014, 0.01138981, 1.150644, 1, 0, 0.5686275, 1,
1.293259, -0.3786752, 1.615232, 1, 0, 0.5647059, 1,
1.309939, 0.7145824, -0.9890198, 1, 0, 0.5568628, 1,
1.310347, 0.5807927, 0.3115137, 1, 0, 0.5529412, 1,
1.311925, -0.3587452, 1.517645, 1, 0, 0.5450981, 1,
1.316081, -1.238199, 0.2741432, 1, 0, 0.5411765, 1,
1.323038, -1.774977, 1.298949, 1, 0, 0.5333334, 1,
1.326068, 2.242174, 1.255602, 1, 0, 0.5294118, 1,
1.331231, -0.2674478, 3.302666, 1, 0, 0.5215687, 1,
1.332205, -0.708942, 2.771322, 1, 0, 0.5176471, 1,
1.333746, -0.4011188, 1.52221, 1, 0, 0.509804, 1,
1.335384, 0.9121333, 0.3769897, 1, 0, 0.5058824, 1,
1.348879, -0.9388539, 1.272808, 1, 0, 0.4980392, 1,
1.34912, -0.6483796, 1.185079, 1, 0, 0.4901961, 1,
1.356793, -0.6638505, 1.975615, 1, 0, 0.4862745, 1,
1.371134, 0.6758282, 2.289751, 1, 0, 0.4784314, 1,
1.376982, 0.3526762, 1.80628, 1, 0, 0.4745098, 1,
1.393796, 0.3928808, 2.044344, 1, 0, 0.4666667, 1,
1.399573, 1.497482, 0.4361635, 1, 0, 0.4627451, 1,
1.399744, -1.594328, 1.423566, 1, 0, 0.454902, 1,
1.413191, -1.864201, 1.717294, 1, 0, 0.4509804, 1,
1.422329, -1.43695, 3.849443, 1, 0, 0.4431373, 1,
1.451768, -0.9839436, 2.477164, 1, 0, 0.4392157, 1,
1.458831, -1.134732, 1.474685, 1, 0, 0.4313726, 1,
1.484398, -0.166205, 1.252038, 1, 0, 0.427451, 1,
1.492626, -0.7506777, 0.2213651, 1, 0, 0.4196078, 1,
1.504612, -0.9395045, 2.091158, 1, 0, 0.4156863, 1,
1.508246, -0.8669685, 0.2580225, 1, 0, 0.4078431, 1,
1.517211, 0.05573758, 2.100378, 1, 0, 0.4039216, 1,
1.519161, -0.1768163, 2.373926, 1, 0, 0.3960784, 1,
1.523622, -1.823726, 3.824355, 1, 0, 0.3882353, 1,
1.528827, 1.873977, -0.9479964, 1, 0, 0.3843137, 1,
1.546828, 0.3655436, 2.477514, 1, 0, 0.3764706, 1,
1.558634, -0.7421984, 0.515239, 1, 0, 0.372549, 1,
1.581031, -0.1711096, 2.79907, 1, 0, 0.3647059, 1,
1.603416, 1.868537, 0.8843641, 1, 0, 0.3607843, 1,
1.60646, 0.9603851, 1.286735, 1, 0, 0.3529412, 1,
1.610404, -0.2622827, 0.5608305, 1, 0, 0.3490196, 1,
1.616636, -0.9493394, 2.950112, 1, 0, 0.3411765, 1,
1.641364, -0.9244849, 2.482625, 1, 0, 0.3372549, 1,
1.64488, -1.183924, 2.7636, 1, 0, 0.3294118, 1,
1.657751, -1.779126, 3.269769, 1, 0, 0.3254902, 1,
1.664781, 1.110051, 2.436311, 1, 0, 0.3176471, 1,
1.691644, -0.3206978, 1.333419, 1, 0, 0.3137255, 1,
1.705253, 0.842155, 0.7558158, 1, 0, 0.3058824, 1,
1.709674, -1.635646, 4.12139, 1, 0, 0.2980392, 1,
1.719109, 0.271282, 0.6514989, 1, 0, 0.2941177, 1,
1.742118, 0.3667645, 1.103924, 1, 0, 0.2862745, 1,
1.754272, 1.931987, 1.580677, 1, 0, 0.282353, 1,
1.767516, -1.465815, 2.363765, 1, 0, 0.2745098, 1,
1.775118, 1.468847, 0.0590057, 1, 0, 0.2705882, 1,
1.779517, 0.8059251, 0.9642428, 1, 0, 0.2627451, 1,
1.806882, 0.03382558, 1.907498, 1, 0, 0.2588235, 1,
1.810841, -1.300302, 1.25385, 1, 0, 0.2509804, 1,
1.8147, 0.3924272, 1.758849, 1, 0, 0.2470588, 1,
1.824284, 0.01429127, 3.323979, 1, 0, 0.2392157, 1,
1.833045, 1.007921, 1.072174, 1, 0, 0.2352941, 1,
1.869779, 1.88719, 0.8215643, 1, 0, 0.227451, 1,
1.904763, -0.2513297, 1.236238, 1, 0, 0.2235294, 1,
1.907194, -0.3574313, 1.177245, 1, 0, 0.2156863, 1,
1.91111, 0.4619184, 1.768847, 1, 0, 0.2117647, 1,
1.913676, 1.315554, 0.3592864, 1, 0, 0.2039216, 1,
1.944357, 0.3233676, 0.8837938, 1, 0, 0.1960784, 1,
1.964632, 1.427018, 2.400178, 1, 0, 0.1921569, 1,
1.967556, -1.022086, 2.763578, 1, 0, 0.1843137, 1,
1.992576, -0.02192329, 2.455352, 1, 0, 0.1803922, 1,
2.000531, -0.07217724, 1.569744, 1, 0, 0.172549, 1,
2.01378, -0.3568618, 3.011694, 1, 0, 0.1686275, 1,
2.028399, 1.9312, 0.5609613, 1, 0, 0.1607843, 1,
2.034611, -0.774898, 1.049652, 1, 0, 0.1568628, 1,
2.047059, 2.813479, 0.328433, 1, 0, 0.1490196, 1,
2.073729, -0.4892247, 1.825763, 1, 0, 0.145098, 1,
2.075212, -0.5362505, 2.651154, 1, 0, 0.1372549, 1,
2.119558, 2.124599, 0.2032102, 1, 0, 0.1333333, 1,
2.155235, -0.6664806, 2.813681, 1, 0, 0.1254902, 1,
2.168789, 0.6294661, 0.3759377, 1, 0, 0.1215686, 1,
2.182721, 0.04421622, 0.9677442, 1, 0, 0.1137255, 1,
2.193196, -0.02876052, 2.769766, 1, 0, 0.1098039, 1,
2.211547, -2.116887, 2.052957, 1, 0, 0.1019608, 1,
2.224813, 0.1229032, 1.884352, 1, 0, 0.09411765, 1,
2.276675, 0.1264316, 3.13201, 1, 0, 0.09019608, 1,
2.301667, 0.9642773, 0.9903903, 1, 0, 0.08235294, 1,
2.316028, 0.2919759, 1.502862, 1, 0, 0.07843138, 1,
2.340188, 0.05722263, 2.831617, 1, 0, 0.07058824, 1,
2.451552, -0.8881718, 2.996798, 1, 0, 0.06666667, 1,
2.469283, 0.2736914, 1.621385, 1, 0, 0.05882353, 1,
2.491754, -0.00558784, 2.517256, 1, 0, 0.05490196, 1,
2.578678, -0.7683755, 4.085471, 1, 0, 0.04705882, 1,
2.763855, -0.7672359, 1.616823, 1, 0, 0.04313726, 1,
2.767934, 1.757081, 0.4714975, 1, 0, 0.03529412, 1,
2.791497, -0.3540109, 1.812953, 1, 0, 0.03137255, 1,
2.796678, 1.104663, 1.719032, 1, 0, 0.02352941, 1,
2.801035, -0.1451706, 1.528809, 1, 0, 0.01960784, 1,
2.834584, 0.2507685, 2.371449, 1, 0, 0.01176471, 1,
3.544435, 0.7779549, 0.8246709, 1, 0, 0.007843138, 1
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
0.1427758, -4.205483, -7.111914, 0, -0.5, 0.5, 0.5,
0.1427758, -4.205483, -7.111914, 1, -0.5, 0.5, 0.5,
0.1427758, -4.205483, -7.111914, 1, 1.5, 0.5, 0.5,
0.1427758, -4.205483, -7.111914, 0, 1.5, 0.5, 0.5
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
-4.412046, -0.03657997, -7.111914, 0, -0.5, 0.5, 0.5,
-4.412046, -0.03657997, -7.111914, 1, -0.5, 0.5, 0.5,
-4.412046, -0.03657997, -7.111914, 1, 1.5, 0.5, 0.5,
-4.412046, -0.03657997, -7.111914, 0, 1.5, 0.5, 0.5
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
-4.412046, -4.205483, -0.1023896, 0, -0.5, 0.5, 0.5,
-4.412046, -4.205483, -0.1023896, 1, -0.5, 0.5, 0.5,
-4.412046, -4.205483, -0.1023896, 1, 1.5, 0.5, 0.5,
-4.412046, -4.205483, -0.1023896, 0, 1.5, 0.5, 0.5
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
-3, -3.243428, -5.494331,
3, -3.243428, -5.494331,
-3, -3.243428, -5.494331,
-3, -3.403771, -5.763928,
-2, -3.243428, -5.494331,
-2, -3.403771, -5.763928,
-1, -3.243428, -5.494331,
-1, -3.403771, -5.763928,
0, -3.243428, -5.494331,
0, -3.403771, -5.763928,
1, -3.243428, -5.494331,
1, -3.403771, -5.763928,
2, -3.243428, -5.494331,
2, -3.403771, -5.763928,
3, -3.243428, -5.494331,
3, -3.403771, -5.763928
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
-3, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
-3, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
-3, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
-3, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
-2, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
-2, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
-2, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
-2, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
-1, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
-1, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
-1, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
-1, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
0, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
0, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
0, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
0, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
1, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
1, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
1, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
1, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
2, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
2, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
2, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
2, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5,
3, -3.724456, -6.303123, 0, -0.5, 0.5, 0.5,
3, -3.724456, -6.303123, 1, -0.5, 0.5, 0.5,
3, -3.724456, -6.303123, 1, 1.5, 0.5, 0.5,
3, -3.724456, -6.303123, 0, 1.5, 0.5, 0.5
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
-3.360933, -3, -5.494331,
-3.360933, 3, -5.494331,
-3.360933, -3, -5.494331,
-3.536119, -3, -5.763928,
-3.360933, -2, -5.494331,
-3.536119, -2, -5.763928,
-3.360933, -1, -5.494331,
-3.536119, -1, -5.763928,
-3.360933, 0, -5.494331,
-3.536119, 0, -5.763928,
-3.360933, 1, -5.494331,
-3.536119, 1, -5.763928,
-3.360933, 2, -5.494331,
-3.536119, 2, -5.763928,
-3.360933, 3, -5.494331,
-3.536119, 3, -5.763928
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
-3.88649, -3, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, -3, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, -3, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, -3, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, -2, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, -2, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, -2, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, -2, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, -1, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, -1, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, -1, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, -1, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, 0, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, 0, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, 0, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, 0, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, 1, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, 1, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, 1, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, 1, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, 2, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, 2, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, 2, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, 2, -6.303123, 0, 1.5, 0.5, 0.5,
-3.88649, 3, -6.303123, 0, -0.5, 0.5, 0.5,
-3.88649, 3, -6.303123, 1, -0.5, 0.5, 0.5,
-3.88649, 3, -6.303123, 1, 1.5, 0.5, 0.5,
-3.88649, 3, -6.303123, 0, 1.5, 0.5, 0.5
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
-3.360933, -3.243428, -4,
-3.360933, -3.243428, 4,
-3.360933, -3.243428, -4,
-3.536119, -3.403771, -4,
-3.360933, -3.243428, -2,
-3.536119, -3.403771, -2,
-3.360933, -3.243428, 0,
-3.536119, -3.403771, 0,
-3.360933, -3.243428, 2,
-3.536119, -3.403771, 2,
-3.360933, -3.243428, 4,
-3.536119, -3.403771, 4
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
-3.88649, -3.724456, -4, 0, -0.5, 0.5, 0.5,
-3.88649, -3.724456, -4, 1, -0.5, 0.5, 0.5,
-3.88649, -3.724456, -4, 1, 1.5, 0.5, 0.5,
-3.88649, -3.724456, -4, 0, 1.5, 0.5, 0.5,
-3.88649, -3.724456, -2, 0, -0.5, 0.5, 0.5,
-3.88649, -3.724456, -2, 1, -0.5, 0.5, 0.5,
-3.88649, -3.724456, -2, 1, 1.5, 0.5, 0.5,
-3.88649, -3.724456, -2, 0, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 0, 0, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 0, 1, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 0, 1, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 0, 0, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 2, 0, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 2, 1, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 2, 1, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 2, 0, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 4, 0, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 4, 1, -0.5, 0.5, 0.5,
-3.88649, -3.724456, 4, 1, 1.5, 0.5, 0.5,
-3.88649, -3.724456, 4, 0, 1.5, 0.5, 0.5
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
-3.360933, -3.243428, -5.494331,
-3.360933, 3.170269, -5.494331,
-3.360933, -3.243428, 5.289552,
-3.360933, 3.170269, 5.289552,
-3.360933, -3.243428, -5.494331,
-3.360933, -3.243428, 5.289552,
-3.360933, 3.170269, -5.494331,
-3.360933, 3.170269, 5.289552,
-3.360933, -3.243428, -5.494331,
3.646485, -3.243428, -5.494331,
-3.360933, -3.243428, 5.289552,
3.646485, -3.243428, 5.289552,
-3.360933, 3.170269, -5.494331,
3.646485, 3.170269, -5.494331,
-3.360933, 3.170269, 5.289552,
3.646485, 3.170269, 5.289552,
3.646485, -3.243428, -5.494331,
3.646485, 3.170269, -5.494331,
3.646485, -3.243428, 5.289552,
3.646485, 3.170269, 5.289552,
3.646485, -3.243428, -5.494331,
3.646485, -3.243428, 5.289552,
3.646485, 3.170269, -5.494331,
3.646485, 3.170269, 5.289552
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
var radius = 7.673945;
var distance = 34.14225;
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
mvMatrix.translate( -0.1427758, 0.03657997, 0.1023896 );
mvMatrix.scale( 1.184062, 1.293672, 0.7694092 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.14225);
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

