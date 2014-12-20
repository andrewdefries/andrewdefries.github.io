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
-3.482955, 1.490071, -0.6936553, 1, 0, 0, 1,
-2.987038, -0.9172381, -3.187562, 1, 0.007843138, 0, 1,
-2.856853, -0.6255193, -0.9434584, 1, 0.01176471, 0, 1,
-2.851909, 0.6819656, -2.791348, 1, 0.01960784, 0, 1,
-2.726935, 0.1952296, -2.037562, 1, 0.02352941, 0, 1,
-2.706702, 0.09717263, -2.360201, 1, 0.03137255, 0, 1,
-2.585884, -0.644472, -0.5487433, 1, 0.03529412, 0, 1,
-2.509836, -0.8024475, -3.137268, 1, 0.04313726, 0, 1,
-2.47016, 0.2992045, -1.44381, 1, 0.04705882, 0, 1,
-2.34555, -0.5994256, -2.312027, 1, 0.05490196, 0, 1,
-2.323049, 0.9108515, -2.24841, 1, 0.05882353, 0, 1,
-2.285535, -0.127284, -2.902828, 1, 0.06666667, 0, 1,
-2.281421, -1.53802, -3.443039, 1, 0.07058824, 0, 1,
-2.231192, 0.116524, -1.897907, 1, 0.07843138, 0, 1,
-2.216182, 1.868252, -0.6688607, 1, 0.08235294, 0, 1,
-2.171843, 0.6128355, -0.2239164, 1, 0.09019608, 0, 1,
-2.162419, 0.3841928, -1.472916, 1, 0.09411765, 0, 1,
-2.150748, -0.695537, -2.204926, 1, 0.1019608, 0, 1,
-2.080792, 1.716067, -2.691728, 1, 0.1098039, 0, 1,
-2.060211, -0.2922131, -1.254464, 1, 0.1137255, 0, 1,
-1.948875, 1.95174, -0.877233, 1, 0.1215686, 0, 1,
-1.935261, 0.1003531, -1.797675, 1, 0.1254902, 0, 1,
-1.863721, 1.349391, 0.002010624, 1, 0.1333333, 0, 1,
-1.856271, 0.82196, -0.8690444, 1, 0.1372549, 0, 1,
-1.838828, 0.8417424, -1.485106, 1, 0.145098, 0, 1,
-1.82911, -0.8268551, -2.957459, 1, 0.1490196, 0, 1,
-1.816138, -0.3976215, -0.4672442, 1, 0.1568628, 0, 1,
-1.809327, -0.2101763, -0.03394359, 1, 0.1607843, 0, 1,
-1.803326, -0.8688879, 1.035209, 1, 0.1686275, 0, 1,
-1.798621, 1.363731, -0.1028934, 1, 0.172549, 0, 1,
-1.79639, -0.001358298, 0.01129829, 1, 0.1803922, 0, 1,
-1.787111, -0.5022694, -1.615682, 1, 0.1843137, 0, 1,
-1.750033, -0.8586637, -2.41407, 1, 0.1921569, 0, 1,
-1.73788, -0.5639437, -2.646438, 1, 0.1960784, 0, 1,
-1.723629, 0.6089946, -2.398237, 1, 0.2039216, 0, 1,
-1.709479, 0.33068, -2.051816, 1, 0.2117647, 0, 1,
-1.691724, -1.606712, -1.735343, 1, 0.2156863, 0, 1,
-1.690416, -0.2139651, -2.891691, 1, 0.2235294, 0, 1,
-1.688984, 1.21001, -1.762954, 1, 0.227451, 0, 1,
-1.688536, -0.2399593, -2.381009, 1, 0.2352941, 0, 1,
-1.682828, 0.7250397, -0.107652, 1, 0.2392157, 0, 1,
-1.648761, 0.9847621, -2.201896, 1, 0.2470588, 0, 1,
-1.621481, -0.4696165, -3.017963, 1, 0.2509804, 0, 1,
-1.615303, -0.8615615, -3.026099, 1, 0.2588235, 0, 1,
-1.612029, 2.003631, -1.008622, 1, 0.2627451, 0, 1,
-1.611047, 1.13255, -0.9713959, 1, 0.2705882, 0, 1,
-1.608603, 0.4894817, -0.2369288, 1, 0.2745098, 0, 1,
-1.597241, 1.336665, -0.03308289, 1, 0.282353, 0, 1,
-1.590963, -1.390604, -2.325186, 1, 0.2862745, 0, 1,
-1.576041, -2.034631, -1.246974, 1, 0.2941177, 0, 1,
-1.559861, 0.8146682, -1.066945, 1, 0.3019608, 0, 1,
-1.551654, 0.007646904, -0.5361143, 1, 0.3058824, 0, 1,
-1.549177, -0.2924416, -0.7738887, 1, 0.3137255, 0, 1,
-1.54395, 0.953475, -0.8823678, 1, 0.3176471, 0, 1,
-1.540121, 2.167571, -1.192998, 1, 0.3254902, 0, 1,
-1.537277, 0.1795289, -1.394078, 1, 0.3294118, 0, 1,
-1.536854, 0.7026116, -1.895057, 1, 0.3372549, 0, 1,
-1.51541, -0.2397507, -0.5640898, 1, 0.3411765, 0, 1,
-1.495648, -0.9218252, -0.4406886, 1, 0.3490196, 0, 1,
-1.491062, -0.9241568, -2.090796, 1, 0.3529412, 0, 1,
-1.486174, 1.773144, -1.188135, 1, 0.3607843, 0, 1,
-1.474204, 0.1432835, -2.815533, 1, 0.3647059, 0, 1,
-1.45964, 1.311354, -1.254647, 1, 0.372549, 0, 1,
-1.443531, -0.2958115, -0.7550609, 1, 0.3764706, 0, 1,
-1.442469, -2.169255, -3.078369, 1, 0.3843137, 0, 1,
-1.413461, -0.1512771, -2.45124, 1, 0.3882353, 0, 1,
-1.392866, -1.586176, -2.178003, 1, 0.3960784, 0, 1,
-1.392335, 0.8294727, -1.058233, 1, 0.4039216, 0, 1,
-1.39117, 0.1361508, -2.32959, 1, 0.4078431, 0, 1,
-1.391136, -0.09998558, -0.3201561, 1, 0.4156863, 0, 1,
-1.361226, 0.7637139, -1.504587, 1, 0.4196078, 0, 1,
-1.346778, -0.5389971, -3.720668, 1, 0.427451, 0, 1,
-1.343503, 0.3851823, -0.7664753, 1, 0.4313726, 0, 1,
-1.332834, -0.7098873, -0.2816067, 1, 0.4392157, 0, 1,
-1.312872, 0.2477077, -2.023174, 1, 0.4431373, 0, 1,
-1.289898, 1.44608, -2.337837, 1, 0.4509804, 0, 1,
-1.288954, 0.9745526, 1.6595, 1, 0.454902, 0, 1,
-1.280309, -0.6183469, -0.6800915, 1, 0.4627451, 0, 1,
-1.263816, -0.2394504, -0.7693462, 1, 0.4666667, 0, 1,
-1.260659, 0.6478466, -1.294488, 1, 0.4745098, 0, 1,
-1.252555, -1.120558, -2.914383, 1, 0.4784314, 0, 1,
-1.246731, 1.00093, 0.2023981, 1, 0.4862745, 0, 1,
-1.234255, 1.583333, 0.1829471, 1, 0.4901961, 0, 1,
-1.232318, -0.2134057, -1.980486, 1, 0.4980392, 0, 1,
-1.207559, 1.067649, -0.6313818, 1, 0.5058824, 0, 1,
-1.204278, -0.8833805, 0.1435165, 1, 0.509804, 0, 1,
-1.197526, 0.09304793, -1.689306, 1, 0.5176471, 0, 1,
-1.193916, 0.1481949, -2.365689, 1, 0.5215687, 0, 1,
-1.179402, 0.8397734, -2.51452, 1, 0.5294118, 0, 1,
-1.174799, -0.0991101, -2.284675, 1, 0.5333334, 0, 1,
-1.169168, 1.715881, -0.7141435, 1, 0.5411765, 0, 1,
-1.166325, -0.2846048, -2.847749, 1, 0.5450981, 0, 1,
-1.138587, -0.03152292, -2.367257, 1, 0.5529412, 0, 1,
-1.137029, 0.4791522, -0.9479919, 1, 0.5568628, 0, 1,
-1.136014, 0.5288814, -2.150635, 1, 0.5647059, 0, 1,
-1.134864, 0.4568252, -2.538585, 1, 0.5686275, 0, 1,
-1.133404, -0.4047485, -2.70069, 1, 0.5764706, 0, 1,
-1.132857, 1.703569, -0.8902611, 1, 0.5803922, 0, 1,
-1.127238, -0.7727703, -2.82553, 1, 0.5882353, 0, 1,
-1.125934, 1.193717, -0.1691439, 1, 0.5921569, 0, 1,
-1.12186, 0.9882005, -1.717075, 1, 0.6, 0, 1,
-1.121451, -2.363931, -1.011381, 1, 0.6078432, 0, 1,
-1.11676, -0.1704552, -2.739719, 1, 0.6117647, 0, 1,
-1.115088, -1.708566, -2.281911, 1, 0.6196079, 0, 1,
-1.114203, 0.3220515, -1.272306, 1, 0.6235294, 0, 1,
-1.109001, 0.5951322, -0.4337513, 1, 0.6313726, 0, 1,
-1.108884, 1.690303, -1.507727, 1, 0.6352941, 0, 1,
-1.101534, -0.8227144, -2.717885, 1, 0.6431373, 0, 1,
-1.09898, -0.1569431, -2.953035, 1, 0.6470588, 0, 1,
-1.093091, 0.7568047, 0.234753, 1, 0.654902, 0, 1,
-1.091374, 0.2512046, -1.330892, 1, 0.6588235, 0, 1,
-1.089795, -0.414407, -1.875927, 1, 0.6666667, 0, 1,
-1.088627, -0.8874786, -2.157301, 1, 0.6705883, 0, 1,
-1.086775, 0.2536269, -0.4388753, 1, 0.6784314, 0, 1,
-1.083706, -0.9887483, -2.887866, 1, 0.682353, 0, 1,
-1.081888, 1.563879, -0.7587113, 1, 0.6901961, 0, 1,
-1.078098, -1.41757, -1.719686, 1, 0.6941177, 0, 1,
-1.06587, 0.3927517, -0.2537448, 1, 0.7019608, 0, 1,
-1.064613, -0.2658491, -2.373078, 1, 0.7098039, 0, 1,
-1.055235, 0.1641053, -0.2554354, 1, 0.7137255, 0, 1,
-1.055012, 0.8447025, 1.086135, 1, 0.7215686, 0, 1,
-1.054932, 0.6020465, -1.445356, 1, 0.7254902, 0, 1,
-1.054787, 0.7926043, -0.8189193, 1, 0.7333333, 0, 1,
-1.047103, 0.06066509, -0.7105275, 1, 0.7372549, 0, 1,
-1.046821, -1.305845, -3.140414, 1, 0.7450981, 0, 1,
-1.043211, -2.077678, -2.662318, 1, 0.7490196, 0, 1,
-1.030345, 0.06763865, -1.830613, 1, 0.7568628, 0, 1,
-1.028747, -0.775874, -1.097408, 1, 0.7607843, 0, 1,
-1.026347, -0.8017492, -2.607453, 1, 0.7686275, 0, 1,
-1.022606, 2.215591, 0.1480624, 1, 0.772549, 0, 1,
-1.021089, -0.401652, -2.102232, 1, 0.7803922, 0, 1,
-1.012833, 1.773806, 0.3151804, 1, 0.7843137, 0, 1,
-1.004423, -0.5411785, -1.413535, 1, 0.7921569, 0, 1,
-1.00115, -1.062202, -2.056535, 1, 0.7960784, 0, 1,
-1.000739, -0.2503875, -3.038399, 1, 0.8039216, 0, 1,
-0.9823753, 0.7617003, -1.054638, 1, 0.8117647, 0, 1,
-0.9791627, -0.2982911, -2.546611, 1, 0.8156863, 0, 1,
-0.9770157, -1.363861, -3.281494, 1, 0.8235294, 0, 1,
-0.9702742, -0.2656608, -0.04579496, 1, 0.827451, 0, 1,
-0.9598641, -0.09409658, -1.27247, 1, 0.8352941, 0, 1,
-0.9573646, -0.6023057, -1.753013, 1, 0.8392157, 0, 1,
-0.9555404, -0.008157364, -2.728856, 1, 0.8470588, 0, 1,
-0.943122, 0.4990247, -1.218322, 1, 0.8509804, 0, 1,
-0.9410552, -0.6501777, -2.950588, 1, 0.8588235, 0, 1,
-0.9357542, 0.9029245, -1.286965, 1, 0.8627451, 0, 1,
-0.9349577, 0.4348978, 0.5949895, 1, 0.8705882, 0, 1,
-0.9315776, 0.5449423, -1.895867, 1, 0.8745098, 0, 1,
-0.9180991, -0.3235195, -0.3670946, 1, 0.8823529, 0, 1,
-0.9104523, -0.7002541, -2.215042, 1, 0.8862745, 0, 1,
-0.9097061, -1.728638, -2.726441, 1, 0.8941177, 0, 1,
-0.9087518, 0.2393034, -1.847831, 1, 0.8980392, 0, 1,
-0.9076946, 2.170547, -1.463451, 1, 0.9058824, 0, 1,
-0.9071737, -1.111483, -2.643473, 1, 0.9137255, 0, 1,
-0.9018801, 1.011734, -0.7691691, 1, 0.9176471, 0, 1,
-0.8931713, 0.8970631, -1.794615, 1, 0.9254902, 0, 1,
-0.8894796, -1.199731, -3.550184, 1, 0.9294118, 0, 1,
-0.8850242, 0.173338, -2.879287, 1, 0.9372549, 0, 1,
-0.8843032, 0.7143997, -2.479041, 1, 0.9411765, 0, 1,
-0.8841485, -1.885655, -3.247479, 1, 0.9490196, 0, 1,
-0.8811511, 0.1522707, 0.4893001, 1, 0.9529412, 0, 1,
-0.880741, -1.403324, -3.637429, 1, 0.9607843, 0, 1,
-0.8750586, 0.933094, -0.5042176, 1, 0.9647059, 0, 1,
-0.8708441, 2.094841, 1.237351, 1, 0.972549, 0, 1,
-0.8679998, -0.01629226, -2.406477, 1, 0.9764706, 0, 1,
-0.8658867, -0.9781158, -1.445536, 1, 0.9843137, 0, 1,
-0.8646114, -0.08977047, -1.141043, 1, 0.9882353, 0, 1,
-0.8625136, -0.541541, -0.7431849, 1, 0.9960784, 0, 1,
-0.8611881, 1.32161, -1.097435, 0.9960784, 1, 0, 1,
-0.8592498, 0.6329185, 0.5575677, 0.9921569, 1, 0, 1,
-0.8587344, -1.140321, -4.384778, 0.9843137, 1, 0, 1,
-0.8577796, 0.4823182, -2.188366, 0.9803922, 1, 0, 1,
-0.856703, -0.5246854, -1.281184, 0.972549, 1, 0, 1,
-0.8521145, 0.3343444, -0.5376379, 0.9686275, 1, 0, 1,
-0.8484654, -1.312932, -2.491478, 0.9607843, 1, 0, 1,
-0.8458991, 1.901141, 0.2137133, 0.9568627, 1, 0, 1,
-0.8447445, 0.9580435, -0.9746715, 0.9490196, 1, 0, 1,
-0.8412859, 0.1546452, -3.423843, 0.945098, 1, 0, 1,
-0.8403611, -0.169014, -1.590703, 0.9372549, 1, 0, 1,
-0.8388605, -0.7889137, -1.068355, 0.9333333, 1, 0, 1,
-0.8384821, -0.4727121, -1.431139, 0.9254902, 1, 0, 1,
-0.8375548, -1.142477, -2.858372, 0.9215686, 1, 0, 1,
-0.8371765, -0.1402386, -2.103074, 0.9137255, 1, 0, 1,
-0.8356165, 0.4383348, -0.6829566, 0.9098039, 1, 0, 1,
-0.8340579, 0.8109277, -1.76983, 0.9019608, 1, 0, 1,
-0.8322427, -0.2368719, -1.408791, 0.8941177, 1, 0, 1,
-0.8199599, 0.8050103, -2.638975, 0.8901961, 1, 0, 1,
-0.8197359, -2.154154, -3.671023, 0.8823529, 1, 0, 1,
-0.8169215, 0.8209339, 0.1575236, 0.8784314, 1, 0, 1,
-0.8158966, -0.4657769, -3.379954, 0.8705882, 1, 0, 1,
-0.8152832, -1.828203, -2.813793, 0.8666667, 1, 0, 1,
-0.8131847, -2.009496, -1.916646, 0.8588235, 1, 0, 1,
-0.812416, 0.1352848, -2.899927, 0.854902, 1, 0, 1,
-0.8123268, 1.415944, 0.2363927, 0.8470588, 1, 0, 1,
-0.8099614, -0.2433873, -1.810861, 0.8431373, 1, 0, 1,
-0.8082479, 0.7829896, -0.3338708, 0.8352941, 1, 0, 1,
-0.7992541, 1.152126, -1.572526, 0.8313726, 1, 0, 1,
-0.798207, -0.8644943, -3.079869, 0.8235294, 1, 0, 1,
-0.7975684, 1.045765, -1.009572, 0.8196079, 1, 0, 1,
-0.7971956, -0.2589743, -2.907401, 0.8117647, 1, 0, 1,
-0.7925696, -1.730951, -1.203251, 0.8078431, 1, 0, 1,
-0.7835873, -0.6703687, -2.061129, 0.8, 1, 0, 1,
-0.7765247, 0.9208496, 0.7822563, 0.7921569, 1, 0, 1,
-0.773782, 1.016849, 0.5324942, 0.7882353, 1, 0, 1,
-0.7728164, 2.028092, -1.76509, 0.7803922, 1, 0, 1,
-0.7693097, -0.2784867, -1.611816, 0.7764706, 1, 0, 1,
-0.7564892, 0.4124959, 0.5043367, 0.7686275, 1, 0, 1,
-0.7546417, -1.324649, -4.186557, 0.7647059, 1, 0, 1,
-0.7478206, -0.6855764, -2.345714, 0.7568628, 1, 0, 1,
-0.7429191, 0.6951537, -0.464498, 0.7529412, 1, 0, 1,
-0.7426581, 1.474855, -0.1437747, 0.7450981, 1, 0, 1,
-0.7426116, -0.429821, -3.456723, 0.7411765, 1, 0, 1,
-0.7398284, -1.617121, -1.955797, 0.7333333, 1, 0, 1,
-0.7391455, 1.294374, -0.9125082, 0.7294118, 1, 0, 1,
-0.7385878, -0.5802869, -2.245, 0.7215686, 1, 0, 1,
-0.7366842, 1.143991, 0.3196182, 0.7176471, 1, 0, 1,
-0.7348192, -0.6046049, -1.280554, 0.7098039, 1, 0, 1,
-0.726248, -2.331113, -2.797759, 0.7058824, 1, 0, 1,
-0.72222, -0.8330992, -0.7870297, 0.6980392, 1, 0, 1,
-0.7168694, -0.6093974, -1.922762, 0.6901961, 1, 0, 1,
-0.7149868, -0.6720176, -2.070227, 0.6862745, 1, 0, 1,
-0.714169, -0.03634503, -1.244411, 0.6784314, 1, 0, 1,
-0.7103422, -0.9754418, -2.791778, 0.6745098, 1, 0, 1,
-0.7089145, 0.307732, 0.8083043, 0.6666667, 1, 0, 1,
-0.7084709, -1.202745, -3.123456, 0.6627451, 1, 0, 1,
-0.7072664, -1.966717, -1.527368, 0.654902, 1, 0, 1,
-0.7020131, 0.8944592, -0.803783, 0.6509804, 1, 0, 1,
-0.7012143, 0.3521999, -1.911766, 0.6431373, 1, 0, 1,
-0.7000346, -0.3853882, -2.355498, 0.6392157, 1, 0, 1,
-0.6992353, 0.3719643, 0.128157, 0.6313726, 1, 0, 1,
-0.6984724, -1.061416, -1.876701, 0.627451, 1, 0, 1,
-0.6939428, -0.5656632, -0.4596285, 0.6196079, 1, 0, 1,
-0.6933231, 0.6245721, -1.208985, 0.6156863, 1, 0, 1,
-0.6888354, -1.308182, -2.511575, 0.6078432, 1, 0, 1,
-0.6835343, 0.689906, -2.679447, 0.6039216, 1, 0, 1,
-0.6799567, -0.04934906, -1.593048, 0.5960785, 1, 0, 1,
-0.6780328, -0.5520808, -1.779539, 0.5882353, 1, 0, 1,
-0.6773437, 0.1218647, -3.918008, 0.5843138, 1, 0, 1,
-0.676361, -0.8630961, -2.450835, 0.5764706, 1, 0, 1,
-0.6759623, 1.58774, 0.1005776, 0.572549, 1, 0, 1,
-0.6734177, 0.1573683, -1.817181, 0.5647059, 1, 0, 1,
-0.6728805, 1.755972, 0.6644038, 0.5607843, 1, 0, 1,
-0.6701551, 1.085506, 1.285949, 0.5529412, 1, 0, 1,
-0.6696348, -0.223871, -3.08446, 0.5490196, 1, 0, 1,
-0.669284, 0.6559677, -2.010402, 0.5411765, 1, 0, 1,
-0.6675634, 0.3791319, -2.359189, 0.5372549, 1, 0, 1,
-0.6674603, 0.5808822, -0.8439546, 0.5294118, 1, 0, 1,
-0.6667226, 0.02407355, -1.41122, 0.5254902, 1, 0, 1,
-0.6653602, 1.543611, -0.2435531, 0.5176471, 1, 0, 1,
-0.6633621, -0.06560953, -1.547071, 0.5137255, 1, 0, 1,
-0.6614995, -0.2735218, -1.421991, 0.5058824, 1, 0, 1,
-0.6581986, -0.8583921, -2.653511, 0.5019608, 1, 0, 1,
-0.6561576, -1.015359, -1.915948, 0.4941176, 1, 0, 1,
-0.6503677, -1.40183, -1.811966, 0.4862745, 1, 0, 1,
-0.6491802, -1.069278, -1.240616, 0.4823529, 1, 0, 1,
-0.6472226, -0.1909276, -0.2561533, 0.4745098, 1, 0, 1,
-0.645785, -0.1673319, -0.3267641, 0.4705882, 1, 0, 1,
-0.6398414, 2.385282, -0.109871, 0.4627451, 1, 0, 1,
-0.6398205, -0.6146542, -2.466435, 0.4588235, 1, 0, 1,
-0.6369655, -2.139145, -1.407605, 0.4509804, 1, 0, 1,
-0.6304707, 0.665252, -1.734283, 0.4470588, 1, 0, 1,
-0.6290388, 0.9961199, 0.1742607, 0.4392157, 1, 0, 1,
-0.6273671, -2.868112, -1.875005, 0.4352941, 1, 0, 1,
-0.6165577, -0.4586856, -2.197001, 0.427451, 1, 0, 1,
-0.6150259, -0.006697311, -0.9160177, 0.4235294, 1, 0, 1,
-0.6136846, 0.5921422, -1.101686, 0.4156863, 1, 0, 1,
-0.6123086, -0.5034341, -2.512425, 0.4117647, 1, 0, 1,
-0.6117347, -1.040173, -3.532046, 0.4039216, 1, 0, 1,
-0.6041763, 1.087295, 1.34457, 0.3960784, 1, 0, 1,
-0.5983676, 0.4744039, -1.554309, 0.3921569, 1, 0, 1,
-0.5935219, 0.01113594, -2.655229, 0.3843137, 1, 0, 1,
-0.5909429, -0.9328172, -0.982462, 0.3803922, 1, 0, 1,
-0.5871546, -0.5784013, -2.796732, 0.372549, 1, 0, 1,
-0.5854348, 0.1565185, -1.498161, 0.3686275, 1, 0, 1,
-0.5848089, -0.002519448, -1.845925, 0.3607843, 1, 0, 1,
-0.5838191, 1.009982, 0.471465, 0.3568628, 1, 0, 1,
-0.5824986, 0.3603322, -2.283001, 0.3490196, 1, 0, 1,
-0.5813541, 0.9877955, 1.648826, 0.345098, 1, 0, 1,
-0.5732037, -1.746832, -2.46358, 0.3372549, 1, 0, 1,
-0.5674087, -0.02398904, -1.392705, 0.3333333, 1, 0, 1,
-0.5569213, -0.5477923, -2.115638, 0.3254902, 1, 0, 1,
-0.5496358, 0.1104237, -1.388145, 0.3215686, 1, 0, 1,
-0.5442811, -0.9973102, -1.848935, 0.3137255, 1, 0, 1,
-0.5429767, 0.5370432, -1.63099, 0.3098039, 1, 0, 1,
-0.5390168, 1.13637, 0.1885493, 0.3019608, 1, 0, 1,
-0.5252363, -1.106846, -0.992741, 0.2941177, 1, 0, 1,
-0.5203621, -1.896835, -0.9056208, 0.2901961, 1, 0, 1,
-0.5179567, 0.05132384, -0.3569939, 0.282353, 1, 0, 1,
-0.5171934, -1.292138, -1.581196, 0.2784314, 1, 0, 1,
-0.5164747, -0.1781845, -2.937071, 0.2705882, 1, 0, 1,
-0.5156954, 1.066781, -0.3431684, 0.2666667, 1, 0, 1,
-0.5133126, 0.05025872, -0.8929467, 0.2588235, 1, 0, 1,
-0.5132033, -1.126804, -3.523154, 0.254902, 1, 0, 1,
-0.5112523, 0.3845424, -0.01725717, 0.2470588, 1, 0, 1,
-0.511047, -0.4709823, -3.31973, 0.2431373, 1, 0, 1,
-0.5087757, -0.7809203, -3.143293, 0.2352941, 1, 0, 1,
-0.5074375, -0.2218492, -4.196001, 0.2313726, 1, 0, 1,
-0.4975888, 0.9361671, 0.4795924, 0.2235294, 1, 0, 1,
-0.4898214, 1.00765, 0.1630395, 0.2196078, 1, 0, 1,
-0.4898207, -0.01483473, -2.273695, 0.2117647, 1, 0, 1,
-0.4864671, -1.304199, -3.055027, 0.2078431, 1, 0, 1,
-0.4806733, 0.6545627, -0.9077719, 0.2, 1, 0, 1,
-0.4789523, 0.56374, -0.8532279, 0.1921569, 1, 0, 1,
-0.4764638, 0.1263836, -2.027345, 0.1882353, 1, 0, 1,
-0.4701973, -0.6088248, -3.764977, 0.1803922, 1, 0, 1,
-0.4670263, -0.477133, -4.56927, 0.1764706, 1, 0, 1,
-0.4639315, -1.057691, -2.297345, 0.1686275, 1, 0, 1,
-0.4586966, 0.7849801, 0.4584263, 0.1647059, 1, 0, 1,
-0.4583096, 0.288875, -1.311601, 0.1568628, 1, 0, 1,
-0.4577069, 0.8817996, -0.4691567, 0.1529412, 1, 0, 1,
-0.4574425, 0.9300233, -1.429394, 0.145098, 1, 0, 1,
-0.4556773, -0.3200493, -1.581426, 0.1411765, 1, 0, 1,
-0.4539524, 0.986737, 0.08321097, 0.1333333, 1, 0, 1,
-0.4480802, 0.1792977, -4.04836, 0.1294118, 1, 0, 1,
-0.4460739, 0.9240911, -0.0383281, 0.1215686, 1, 0, 1,
-0.4389094, -1.482479, -1.524267, 0.1176471, 1, 0, 1,
-0.4386847, -1.352347, -0.7079703, 0.1098039, 1, 0, 1,
-0.4331407, 0.05080554, -1.473912, 0.1058824, 1, 0, 1,
-0.4329765, 1.4284, -0.6964653, 0.09803922, 1, 0, 1,
-0.4314697, 0.9913148, -1.297638, 0.09019608, 1, 0, 1,
-0.4284166, 0.5911626, -0.8170013, 0.08627451, 1, 0, 1,
-0.4249925, 1.866801, -1.368307, 0.07843138, 1, 0, 1,
-0.4242474, -0.8832452, -3.117753, 0.07450981, 1, 0, 1,
-0.4202534, 0.4516368, -1.72243, 0.06666667, 1, 0, 1,
-0.4198848, 0.3630572, -0.9450902, 0.0627451, 1, 0, 1,
-0.4188937, -0.8176062, -2.889119, 0.05490196, 1, 0, 1,
-0.4187931, -1.571369, -1.540288, 0.05098039, 1, 0, 1,
-0.4185787, -0.2266263, -3.140776, 0.04313726, 1, 0, 1,
-0.4147485, -0.2525314, -2.322744, 0.03921569, 1, 0, 1,
-0.4105626, -0.2575343, -3.21808, 0.03137255, 1, 0, 1,
-0.4094321, -1.058346, -2.506372, 0.02745098, 1, 0, 1,
-0.4086257, 0.6857059, -2.484968, 0.01960784, 1, 0, 1,
-0.4048436, -0.2325817, -1.378105, 0.01568628, 1, 0, 1,
-0.4000185, -1.148198, -1.961246, 0.007843138, 1, 0, 1,
-0.3983395, -0.2960717, -2.436849, 0.003921569, 1, 0, 1,
-0.3971261, 0.7341945, -0.04110138, 0, 1, 0.003921569, 1,
-0.3946241, -0.4200474, -2.729336, 0, 1, 0.01176471, 1,
-0.3929648, 1.689733, -1.115365, 0, 1, 0.01568628, 1,
-0.3916405, 1.669885, -1.983975, 0, 1, 0.02352941, 1,
-0.3883227, 0.3592774, -1.259962, 0, 1, 0.02745098, 1,
-0.3880557, -0.5998471, -4.482585, 0, 1, 0.03529412, 1,
-0.3829629, -0.5153975, -0.6098539, 0, 1, 0.03921569, 1,
-0.3807126, 1.184102, -0.5633962, 0, 1, 0.04705882, 1,
-0.3779535, -2.598849, -3.298694, 0, 1, 0.05098039, 1,
-0.3747581, -1.989305, -1.365104, 0, 1, 0.05882353, 1,
-0.3692365, -0.4871954, -1.724291, 0, 1, 0.0627451, 1,
-0.36876, -0.03499454, -2.323608, 0, 1, 0.07058824, 1,
-0.3595942, -0.2757853, -1.151304, 0, 1, 0.07450981, 1,
-0.354924, -1.104981, -2.36233, 0, 1, 0.08235294, 1,
-0.3507241, -1.095791, -0.5103867, 0, 1, 0.08627451, 1,
-0.3463865, -0.196761, -1.812037, 0, 1, 0.09411765, 1,
-0.3378681, 0.6684271, 0.3926133, 0, 1, 0.1019608, 1,
-0.3347296, 2.60648, -1.351646, 0, 1, 0.1058824, 1,
-0.3326823, -0.4139349, -1.597149, 0, 1, 0.1137255, 1,
-0.3322803, -1.291636, -3.20426, 0, 1, 0.1176471, 1,
-0.3285972, -0.5164023, -1.973543, 0, 1, 0.1254902, 1,
-0.326351, -0.5663175, -2.485375, 0, 1, 0.1294118, 1,
-0.3252213, 2.279271, 0.3697301, 0, 1, 0.1372549, 1,
-0.3231929, 0.268244, -2.004396, 0, 1, 0.1411765, 1,
-0.322928, -0.2758081, 0.1598165, 0, 1, 0.1490196, 1,
-0.3220447, -1.127058, -3.229468, 0, 1, 0.1529412, 1,
-0.3210036, -0.7354124, -3.661677, 0, 1, 0.1607843, 1,
-0.3198243, -0.5189844, -2.56368, 0, 1, 0.1647059, 1,
-0.3162036, 0.2312076, -1.17456, 0, 1, 0.172549, 1,
-0.3107894, -0.07159903, -1.917795, 0, 1, 0.1764706, 1,
-0.3100458, 0.6896487, 0.024313, 0, 1, 0.1843137, 1,
-0.3070381, -0.08745533, -2.633649, 0, 1, 0.1882353, 1,
-0.3069482, -1.087323, -4.714036, 0, 1, 0.1960784, 1,
-0.3025548, -0.6497597, -3.316482, 0, 1, 0.2039216, 1,
-0.300478, 0.4526622, -0.5070655, 0, 1, 0.2078431, 1,
-0.2997836, 0.0420585, -2.771277, 0, 1, 0.2156863, 1,
-0.299668, -1.597769, -4.288881, 0, 1, 0.2196078, 1,
-0.29809, 0.4044356, -1.702977, 0, 1, 0.227451, 1,
-0.2973716, -0.5449783, -4.131195, 0, 1, 0.2313726, 1,
-0.2950308, -0.9488661, -2.635333, 0, 1, 0.2392157, 1,
-0.2923112, -1.088202, -3.662592, 0, 1, 0.2431373, 1,
-0.2922614, 2.057282, -0.9362137, 0, 1, 0.2509804, 1,
-0.291957, 0.686668, 1.216777, 0, 1, 0.254902, 1,
-0.2866418, -0.7996407, -3.116729, 0, 1, 0.2627451, 1,
-0.2843291, -1.370522, -2.716977, 0, 1, 0.2666667, 1,
-0.2833529, -0.1920442, -2.138806, 0, 1, 0.2745098, 1,
-0.2689732, -0.008214858, -2.352187, 0, 1, 0.2784314, 1,
-0.2680879, 0.1259452, -1.266895, 0, 1, 0.2862745, 1,
-0.2645671, -0.1832996, -0.5354837, 0, 1, 0.2901961, 1,
-0.2590289, -1.368179, -4.360836, 0, 1, 0.2980392, 1,
-0.2568775, 0.7562796, -1.015315, 0, 1, 0.3058824, 1,
-0.2539725, -0.567408, -0.8606282, 0, 1, 0.3098039, 1,
-0.2537533, -0.5039197, -3.545511, 0, 1, 0.3176471, 1,
-0.252645, 0.4417103, -1.151816, 0, 1, 0.3215686, 1,
-0.2482199, -0.4213644, -1.959732, 0, 1, 0.3294118, 1,
-0.246215, 1.02097, 1.101772, 0, 1, 0.3333333, 1,
-0.2454549, -1.747993, -5.375904, 0, 1, 0.3411765, 1,
-0.2438538, -0.328642, -2.471634, 0, 1, 0.345098, 1,
-0.2435745, 0.241663, -0.9970658, 0, 1, 0.3529412, 1,
-0.2364702, 0.2684551, -0.7336544, 0, 1, 0.3568628, 1,
-0.2360564, -0.2878254, -2.005447, 0, 1, 0.3647059, 1,
-0.233776, 0.08305254, -1.866549, 0, 1, 0.3686275, 1,
-0.2326129, -0.6588833, -0.6605822, 0, 1, 0.3764706, 1,
-0.2316317, -1.124839, -3.492315, 0, 1, 0.3803922, 1,
-0.2250275, 0.5937478, 1.744205, 0, 1, 0.3882353, 1,
-0.2246301, 0.6847322, -0.5416791, 0, 1, 0.3921569, 1,
-0.2125393, -0.9055768, -3.412807, 0, 1, 0.4, 1,
-0.2123937, -1.354564, -2.821084, 0, 1, 0.4078431, 1,
-0.2123809, 1.02768, -0.445873, 0, 1, 0.4117647, 1,
-0.2105914, -1.073884, -3.78193, 0, 1, 0.4196078, 1,
-0.2100996, 0.7617134, 0.874199, 0, 1, 0.4235294, 1,
-0.2099821, -0.9543136, -3.767754, 0, 1, 0.4313726, 1,
-0.2033722, 1.013721, 0.1990585, 0, 1, 0.4352941, 1,
-0.2029672, 0.8472491, 0.9819554, 0, 1, 0.4431373, 1,
-0.200547, -1.021272, -4.811821, 0, 1, 0.4470588, 1,
-0.2004904, 0.5318704, -0.05154201, 0, 1, 0.454902, 1,
-0.1995959, -0.04463949, -3.593081, 0, 1, 0.4588235, 1,
-0.1993724, -0.07486921, -1.273628, 0, 1, 0.4666667, 1,
-0.1979239, 1.171908, 0.2415329, 0, 1, 0.4705882, 1,
-0.1973291, -1.5029, -3.724217, 0, 1, 0.4784314, 1,
-0.1969714, 1.026116, -0.08942954, 0, 1, 0.4823529, 1,
-0.1951615, 2.578722, 1.612188, 0, 1, 0.4901961, 1,
-0.1916665, -1.082455, -3.896572, 0, 1, 0.4941176, 1,
-0.1829695, -1.676995, -1.829527, 0, 1, 0.5019608, 1,
-0.1829318, -1.850644, -4.826874, 0, 1, 0.509804, 1,
-0.1822982, -1.039246, -3.251028, 0, 1, 0.5137255, 1,
-0.1812758, -0.1639284, -1.844159, 0, 1, 0.5215687, 1,
-0.1809103, -1.002509, -2.397855, 0, 1, 0.5254902, 1,
-0.1767537, -0.3007445, -1.658558, 0, 1, 0.5333334, 1,
-0.1753637, -2.109185, -1.941669, 0, 1, 0.5372549, 1,
-0.173431, 0.6771259, 0.6828879, 0, 1, 0.5450981, 1,
-0.1704425, 0.3016696, -1.435277, 0, 1, 0.5490196, 1,
-0.1685469, 1.278126, -1.576261, 0, 1, 0.5568628, 1,
-0.1682714, 0.8457334, -0.5962803, 0, 1, 0.5607843, 1,
-0.165868, -0.1687708, -0.9159304, 0, 1, 0.5686275, 1,
-0.1653144, -2.207087, -3.715087, 0, 1, 0.572549, 1,
-0.1645225, 0.4855008, -0.17348, 0, 1, 0.5803922, 1,
-0.1616175, 0.6427588, 0.662201, 0, 1, 0.5843138, 1,
-0.1587318, -1.548791, -2.849036, 0, 1, 0.5921569, 1,
-0.1578712, -0.9536466, -3.210599, 0, 1, 0.5960785, 1,
-0.1573501, 0.779241, -0.07739423, 0, 1, 0.6039216, 1,
-0.1562438, -1.13787, -2.831977, 0, 1, 0.6117647, 1,
-0.1552329, 0.3172437, 0.3611323, 0, 1, 0.6156863, 1,
-0.1538858, 2.043403, -2.102861, 0, 1, 0.6235294, 1,
-0.1454051, 0.8175397, -0.02793161, 0, 1, 0.627451, 1,
-0.1428267, -0.538178, -3.269381, 0, 1, 0.6352941, 1,
-0.1378454, 0.9302164, -1.372719, 0, 1, 0.6392157, 1,
-0.1363379, -0.0851329, -2.897126, 0, 1, 0.6470588, 1,
-0.1342502, 0.4666487, 0.1685986, 0, 1, 0.6509804, 1,
-0.1338687, -0.0571449, -1.595803, 0, 1, 0.6588235, 1,
-0.1322878, -0.692317, -3.24962, 0, 1, 0.6627451, 1,
-0.1258165, -0.5786657, -2.308408, 0, 1, 0.6705883, 1,
-0.1227294, 0.2250267, 0.4167608, 0, 1, 0.6745098, 1,
-0.1206391, -0.7120371, -4.924438, 0, 1, 0.682353, 1,
-0.1202518, -0.598878, -4.556575, 0, 1, 0.6862745, 1,
-0.1146375, 1.793, -0.6358423, 0, 1, 0.6941177, 1,
-0.1141588, -0.2754929, -2.420595, 0, 1, 0.7019608, 1,
-0.1096522, -1.396342, -3.954272, 0, 1, 0.7058824, 1,
-0.1087863, 0.4916837, -1.513465, 0, 1, 0.7137255, 1,
-0.1022841, 0.6030829, -0.02984059, 0, 1, 0.7176471, 1,
-0.1014665, 2.264136, -0.2812525, 0, 1, 0.7254902, 1,
-0.101222, -1.078511, -2.385998, 0, 1, 0.7294118, 1,
-0.1000255, 1.029769, 0.5351951, 0, 1, 0.7372549, 1,
-0.1000233, -0.7509174, -3.804555, 0, 1, 0.7411765, 1,
-0.08842383, 1.239277, 0.5133319, 0, 1, 0.7490196, 1,
-0.08631214, 0.04207632, -0.8168921, 0, 1, 0.7529412, 1,
-0.08523746, 0.9437888, -0.7975525, 0, 1, 0.7607843, 1,
-0.07304271, 0.1690732, -1.020404, 0, 1, 0.7647059, 1,
-0.07246169, 0.259108, -0.1995598, 0, 1, 0.772549, 1,
-0.07226896, -0.1430353, -3.175509, 0, 1, 0.7764706, 1,
-0.07194638, -1.456792, -3.381118, 0, 1, 0.7843137, 1,
-0.07011356, -0.1590113, -2.478235, 0, 1, 0.7882353, 1,
-0.06899417, 0.5590128, 0.4771717, 0, 1, 0.7960784, 1,
-0.06696992, -1.724605, -4.068604, 0, 1, 0.8039216, 1,
-0.06562895, -0.5811335, -4.208287, 0, 1, 0.8078431, 1,
-0.06427167, 0.7528632, -0.1786101, 0, 1, 0.8156863, 1,
-0.06393068, 1.536355, 0.2469149, 0, 1, 0.8196079, 1,
-0.06361719, 0.8196374, -0.296921, 0, 1, 0.827451, 1,
-0.06355093, 0.9952537, -0.4055729, 0, 1, 0.8313726, 1,
-0.06149279, 0.743302, -0.7089282, 0, 1, 0.8392157, 1,
-0.0607877, 0.7810183, 0.369145, 0, 1, 0.8431373, 1,
-0.06017962, -0.4164712, -3.017554, 0, 1, 0.8509804, 1,
-0.05765698, 0.6254075, -0.2324853, 0, 1, 0.854902, 1,
-0.05379165, -0.4263262, -3.570774, 0, 1, 0.8627451, 1,
-0.04390426, 0.4008904, -1.645063, 0, 1, 0.8666667, 1,
-0.04347983, -0.2460535, -3.107688, 0, 1, 0.8745098, 1,
-0.03415463, -1.662935, -1.465637, 0, 1, 0.8784314, 1,
-0.0285414, -0.3234175, -2.965809, 0, 1, 0.8862745, 1,
-0.02508878, 0.9642758, -0.8129388, 0, 1, 0.8901961, 1,
-0.02409314, 1.346096, -0.3535907, 0, 1, 0.8980392, 1,
-0.02359508, -0.4589944, -3.144077, 0, 1, 0.9058824, 1,
-0.02265296, 0.8616031, 2.084791, 0, 1, 0.9098039, 1,
-0.016902, -0.6098228, -2.241399, 0, 1, 0.9176471, 1,
-0.0165563, 0.4075572, -3.247588, 0, 1, 0.9215686, 1,
-0.01622704, -0.5053948, -3.065787, 0, 1, 0.9294118, 1,
-0.01498584, -0.8163618, -4.019161, 0, 1, 0.9333333, 1,
-0.005606112, -0.3415184, -4.063128, 0, 1, 0.9411765, 1,
0.00373598, -0.4945099, 3.594489, 0, 1, 0.945098, 1,
0.004386306, -1.048989, 2.258277, 0, 1, 0.9529412, 1,
0.008590882, -1.396139, 4.202468, 0, 1, 0.9568627, 1,
0.009289131, -0.02223714, 3.767158, 0, 1, 0.9647059, 1,
0.01056884, -1.705326, 0.1460599, 0, 1, 0.9686275, 1,
0.0120575, -1.087907, 2.58975, 0, 1, 0.9764706, 1,
0.02146623, -0.8901005, 1.327807, 0, 1, 0.9803922, 1,
0.02340747, -0.890264, 4.488482, 0, 1, 0.9882353, 1,
0.02776338, -0.8148528, 1.997712, 0, 1, 0.9921569, 1,
0.02827591, 0.807154, -0.790495, 0, 1, 1, 1,
0.02850038, -1.668969, 4.329512, 0, 0.9921569, 1, 1,
0.02908218, -0.4472153, 1.278126, 0, 0.9882353, 1, 1,
0.03450608, 1.875574, 0.07434215, 0, 0.9803922, 1, 1,
0.0349482, -2.159122, 3.113412, 0, 0.9764706, 1, 1,
0.03511318, 0.4019788, -1.235676, 0, 0.9686275, 1, 1,
0.03536804, -0.1191355, 2.918602, 0, 0.9647059, 1, 1,
0.03695335, -0.2742346, 1.944496, 0, 0.9568627, 1, 1,
0.04455241, -2.447428, 1.583359, 0, 0.9529412, 1, 1,
0.0472609, -0.3239916, 4.364091, 0, 0.945098, 1, 1,
0.0505714, 0.9770167, 0.8141396, 0, 0.9411765, 1, 1,
0.0541006, -0.811466, 3.438286, 0, 0.9333333, 1, 1,
0.0541872, 0.5814207, 0.4763885, 0, 0.9294118, 1, 1,
0.05923074, -0.07649853, 2.202872, 0, 0.9215686, 1, 1,
0.06333486, 0.2554177, 0.6049791, 0, 0.9176471, 1, 1,
0.06558745, -0.907101, 2.432082, 0, 0.9098039, 1, 1,
0.06680679, -0.5306923, 3.49702, 0, 0.9058824, 1, 1,
0.06937759, 1.122679, 0.8013347, 0, 0.8980392, 1, 1,
0.06989305, 0.6660177, 0.2271716, 0, 0.8901961, 1, 1,
0.07242213, -0.2103121, 3.526468, 0, 0.8862745, 1, 1,
0.07420719, -0.05452212, 2.02846, 0, 0.8784314, 1, 1,
0.07667229, -0.1426241, 2.593824, 0, 0.8745098, 1, 1,
0.07844651, 1.094366, 1.598072, 0, 0.8666667, 1, 1,
0.0793933, -1.109552, 3.175842, 0, 0.8627451, 1, 1,
0.08014334, 0.7443557, 0.2743244, 0, 0.854902, 1, 1,
0.08084985, -1.096252, 3.447615, 0, 0.8509804, 1, 1,
0.08256905, -0.2758916, 2.87198, 0, 0.8431373, 1, 1,
0.08306962, -1.558045, 3.119765, 0, 0.8392157, 1, 1,
0.09094454, 0.6679032, 0.7960343, 0, 0.8313726, 1, 1,
0.09853633, -0.1632798, 1.400136, 0, 0.827451, 1, 1,
0.1019897, -1.387761, 2.309469, 0, 0.8196079, 1, 1,
0.104423, 0.4440219, 1.426957, 0, 0.8156863, 1, 1,
0.104831, 0.264179, 0.2654528, 0, 0.8078431, 1, 1,
0.1057112, 1.336697, -1.417705, 0, 0.8039216, 1, 1,
0.1077054, 0.7352475, 0.5821862, 0, 0.7960784, 1, 1,
0.1079746, -1.524134, 3.63398, 0, 0.7882353, 1, 1,
0.1112243, 0.2629904, 1.361732, 0, 0.7843137, 1, 1,
0.1162116, -0.1140755, 2.854857, 0, 0.7764706, 1, 1,
0.1169691, -0.6814872, 1.913189, 0, 0.772549, 1, 1,
0.1205522, -0.05903362, 2.050949, 0, 0.7647059, 1, 1,
0.126004, 1.78929, 0.2206709, 0, 0.7607843, 1, 1,
0.1290945, 0.715353, -0.2657018, 0, 0.7529412, 1, 1,
0.12962, 0.9392584, 1.581814, 0, 0.7490196, 1, 1,
0.1306751, -1.062495, 3.980371, 0, 0.7411765, 1, 1,
0.1371535, -0.1996376, 2.488085, 0, 0.7372549, 1, 1,
0.1375807, -0.4280796, 2.676118, 0, 0.7294118, 1, 1,
0.1454439, 0.349724, -0.5501457, 0, 0.7254902, 1, 1,
0.1524865, 0.5834794, 2.188756, 0, 0.7176471, 1, 1,
0.1528103, -0.2403005, 1.665479, 0, 0.7137255, 1, 1,
0.1554982, -0.7578615, 3.00257, 0, 0.7058824, 1, 1,
0.1596795, -0.213722, 0.497483, 0, 0.6980392, 1, 1,
0.1616329, -1.435735, 4.114088, 0, 0.6941177, 1, 1,
0.1642931, -0.7005038, 4.543112, 0, 0.6862745, 1, 1,
0.1698288, 0.02450934, 1.390845, 0, 0.682353, 1, 1,
0.175835, -0.9321529, 2.495113, 0, 0.6745098, 1, 1,
0.1796433, 0.8275837, 0.3778668, 0, 0.6705883, 1, 1,
0.1819412, -0.6849604, 1.846736, 0, 0.6627451, 1, 1,
0.1823608, 0.3594418, 1.290843, 0, 0.6588235, 1, 1,
0.1832836, -1.382866, 3.219359, 0, 0.6509804, 1, 1,
0.1849289, -0.1887379, 2.535265, 0, 0.6470588, 1, 1,
0.1903661, -1.498252, 2.695243, 0, 0.6392157, 1, 1,
0.1904109, 0.566648, 0.7520399, 0, 0.6352941, 1, 1,
0.1908635, 0.04155467, -1.241266, 0, 0.627451, 1, 1,
0.1947037, -1.259352, 4.149719, 0, 0.6235294, 1, 1,
0.195102, 0.4022135, 1.435649, 0, 0.6156863, 1, 1,
0.1957016, -1.374, 5.10346, 0, 0.6117647, 1, 1,
0.1979285, 0.9923682, 0.8550953, 0, 0.6039216, 1, 1,
0.201146, 0.1491407, -0.06849327, 0, 0.5960785, 1, 1,
0.2028752, -0.2108493, 3.546781, 0, 0.5921569, 1, 1,
0.2036547, -0.006756393, 3.266512, 0, 0.5843138, 1, 1,
0.2078452, 0.7542862, -0.01379166, 0, 0.5803922, 1, 1,
0.2115834, 0.05244691, 1.923997, 0, 0.572549, 1, 1,
0.2147097, -0.4149454, 3.945436, 0, 0.5686275, 1, 1,
0.216153, 0.07304139, 0.07786906, 0, 0.5607843, 1, 1,
0.2166628, 1.362403, 1.073303, 0, 0.5568628, 1, 1,
0.226437, 1.034837, -1.448176, 0, 0.5490196, 1, 1,
0.2295655, 0.2086278, 1.487173, 0, 0.5450981, 1, 1,
0.2308834, 0.05204752, -0.2037957, 0, 0.5372549, 1, 1,
0.231596, 0.3021715, 0.08167087, 0, 0.5333334, 1, 1,
0.2317902, -0.9908174, 2.718491, 0, 0.5254902, 1, 1,
0.2340876, 1.084542, -1.586965, 0, 0.5215687, 1, 1,
0.2349916, -0.006677836, 0.2208302, 0, 0.5137255, 1, 1,
0.2360525, -0.9859015, 3.353426, 0, 0.509804, 1, 1,
0.2360731, -0.9669373, 3.451977, 0, 0.5019608, 1, 1,
0.2381536, 0.548243, 1.061958, 0, 0.4941176, 1, 1,
0.2420155, -0.1209498, 0.453079, 0, 0.4901961, 1, 1,
0.2420713, -0.9176327, 2.723464, 0, 0.4823529, 1, 1,
0.2463994, 1.030677, -0.6270279, 0, 0.4784314, 1, 1,
0.2481823, 0.4854383, 0.9447206, 0, 0.4705882, 1, 1,
0.2488869, 0.2931667, 0.6959563, 0, 0.4666667, 1, 1,
0.2530285, 0.006409712, 1.33993, 0, 0.4588235, 1, 1,
0.2536871, -0.4505612, 3.212788, 0, 0.454902, 1, 1,
0.2583325, -0.7258827, 2.937038, 0, 0.4470588, 1, 1,
0.2606602, -0.8302557, 1.323046, 0, 0.4431373, 1, 1,
0.2618341, 0.7082475, 0.8982098, 0, 0.4352941, 1, 1,
0.2675591, 1.236547, 1.413237, 0, 0.4313726, 1, 1,
0.2724826, -1.101544, 1.297486, 0, 0.4235294, 1, 1,
0.2741586, 1.10046, -1.186777, 0, 0.4196078, 1, 1,
0.2749811, -1.622703, 4.407108, 0, 0.4117647, 1, 1,
0.2765614, 0.3206029, 1.617748, 0, 0.4078431, 1, 1,
0.2853041, -2.313599, 1.983246, 0, 0.4, 1, 1,
0.2875294, -1.064883, 1.925385, 0, 0.3921569, 1, 1,
0.2920944, 0.7585803, 0.8315123, 0, 0.3882353, 1, 1,
0.2923777, -1.006168, 3.268484, 0, 0.3803922, 1, 1,
0.2939993, -0.9331268, 2.701905, 0, 0.3764706, 1, 1,
0.2946709, 1.470747, 0.8120266, 0, 0.3686275, 1, 1,
0.2968715, -0.9673344, 2.851191, 0, 0.3647059, 1, 1,
0.3022242, 0.4531419, -0.1633742, 0, 0.3568628, 1, 1,
0.3035382, 2.410383, 0.7327901, 0, 0.3529412, 1, 1,
0.3083166, -0.9474327, 3.279115, 0, 0.345098, 1, 1,
0.3110972, -2.769841, 1.342057, 0, 0.3411765, 1, 1,
0.3129247, 0.5527177, 2.34261, 0, 0.3333333, 1, 1,
0.3157538, 0.7745584, -1.28457, 0, 0.3294118, 1, 1,
0.3158255, -0.5649554, 2.430189, 0, 0.3215686, 1, 1,
0.3160908, 0.01407251, 2.025661, 0, 0.3176471, 1, 1,
0.3201466, 1.082095, 3.429001, 0, 0.3098039, 1, 1,
0.3225034, 0.8198897, 0.0423927, 0, 0.3058824, 1, 1,
0.3283436, -0.6893097, 2.001487, 0, 0.2980392, 1, 1,
0.3311773, -0.4052867, 1.785437, 0, 0.2901961, 1, 1,
0.3345428, -0.3255192, 1.188141, 0, 0.2862745, 1, 1,
0.3416511, 1.625547, -0.2147139, 0, 0.2784314, 1, 1,
0.3421035, -1.362592, 1.852285, 0, 0.2745098, 1, 1,
0.3424602, 0.3813265, 0.3035574, 0, 0.2666667, 1, 1,
0.3438188, -0.5019519, 1.521231, 0, 0.2627451, 1, 1,
0.349282, -0.7929978, 4.538311, 0, 0.254902, 1, 1,
0.3554412, 0.2439472, 0.2360373, 0, 0.2509804, 1, 1,
0.3617595, -0.02144101, 1.564821, 0, 0.2431373, 1, 1,
0.3632555, -0.3319654, 2.30972, 0, 0.2392157, 1, 1,
0.3657378, -0.7127113, 2.341621, 0, 0.2313726, 1, 1,
0.3674605, -0.7975471, 2.028355, 0, 0.227451, 1, 1,
0.3684054, 0.3109097, -0.1374778, 0, 0.2196078, 1, 1,
0.3689066, 0.2557864, 0.3986735, 0, 0.2156863, 1, 1,
0.3704318, -0.4019592, 2.222781, 0, 0.2078431, 1, 1,
0.3713917, 1.426503, 0.1097404, 0, 0.2039216, 1, 1,
0.3738794, 0.07988031, 0.1140516, 0, 0.1960784, 1, 1,
0.3744706, 1.724564, 1.883132, 0, 0.1882353, 1, 1,
0.3800409, -0.525862, 3.057316, 0, 0.1843137, 1, 1,
0.381647, -1.429194, 3.196045, 0, 0.1764706, 1, 1,
0.3818032, 0.5732645, 0.9253491, 0, 0.172549, 1, 1,
0.3824202, -0.4074565, 1.402305, 0, 0.1647059, 1, 1,
0.3862736, -0.9014216, 3.073223, 0, 0.1607843, 1, 1,
0.3901874, 2.266243, 0.620792, 0, 0.1529412, 1, 1,
0.390409, 1.470592, -1.152999, 0, 0.1490196, 1, 1,
0.3908333, -0.442053, 2.974862, 0, 0.1411765, 1, 1,
0.3909961, -0.2709323, 0.9460503, 0, 0.1372549, 1, 1,
0.3950904, 1.130038, -0.4468351, 0, 0.1294118, 1, 1,
0.3952014, 0.1755816, 0.2084482, 0, 0.1254902, 1, 1,
0.3969721, -1.430081, 4.398425, 0, 0.1176471, 1, 1,
0.397424, -1.496126, 1.028806, 0, 0.1137255, 1, 1,
0.4037083, 1.4079, -0.8159064, 0, 0.1058824, 1, 1,
0.4048688, -0.4583934, 2.868646, 0, 0.09803922, 1, 1,
0.4060979, 1.479803, 1.272769, 0, 0.09411765, 1, 1,
0.4070413, -1.127945, 3.200117, 0, 0.08627451, 1, 1,
0.4077623, 0.5694073, -0.4489312, 0, 0.08235294, 1, 1,
0.4078701, -0.1270557, 3.295971, 0, 0.07450981, 1, 1,
0.4083315, -0.9459776, 3.15558, 0, 0.07058824, 1, 1,
0.4091822, 1.473794, 0.6060542, 0, 0.0627451, 1, 1,
0.4103929, 0.8449424, 0.9715368, 0, 0.05882353, 1, 1,
0.4160387, 2.604029, 0.5039163, 0, 0.05098039, 1, 1,
0.4166065, -0.5148277, 3.117292, 0, 0.04705882, 1, 1,
0.4214674, -0.171514, 1.693453, 0, 0.03921569, 1, 1,
0.4215299, 0.772611, -0.3068171, 0, 0.03529412, 1, 1,
0.4219385, -1.155034, 2.68049, 0, 0.02745098, 1, 1,
0.4239402, -1.666506, 1.819902, 0, 0.02352941, 1, 1,
0.4241712, 0.9996705, -1.293658, 0, 0.01568628, 1, 1,
0.4254534, 0.154101, 0.663671, 0, 0.01176471, 1, 1,
0.430409, -0.5893118, 1.850582, 0, 0.003921569, 1, 1,
0.4321398, -0.4992485, 2.109107, 0.003921569, 0, 1, 1,
0.4354717, -0.05826669, 1.32889, 0.007843138, 0, 1, 1,
0.4366155, -0.2044884, 1.207584, 0.01568628, 0, 1, 1,
0.4369365, -2.029883, 3.140366, 0.01960784, 0, 1, 1,
0.4394567, 0.5206133, 0.6613616, 0.02745098, 0, 1, 1,
0.4435261, -0.7064328, 1.779882, 0.03137255, 0, 1, 1,
0.449174, -1.072892, 3.158012, 0.03921569, 0, 1, 1,
0.4492982, -1.256659, 2.349304, 0.04313726, 0, 1, 1,
0.4495431, -2.107257, 2.108978, 0.05098039, 0, 1, 1,
0.4508881, -0.2915218, 0.5333658, 0.05490196, 0, 1, 1,
0.4514241, -1.353722, 2.873778, 0.0627451, 0, 1, 1,
0.4545091, 0.344386, 2.027991, 0.06666667, 0, 1, 1,
0.4555497, -0.6066377, 3.197707, 0.07450981, 0, 1, 1,
0.4573825, -1.535094, 3.406244, 0.07843138, 0, 1, 1,
0.4577544, -2.899321, 3.70428, 0.08627451, 0, 1, 1,
0.457771, 2.30829, -0.5422523, 0.09019608, 0, 1, 1,
0.4656129, -0.09578744, 1.073705, 0.09803922, 0, 1, 1,
0.4661349, -2.704399, 1.95174, 0.1058824, 0, 1, 1,
0.4676455, -1.036035, 3.245427, 0.1098039, 0, 1, 1,
0.4743246, -0.08138859, 3.382765, 0.1176471, 0, 1, 1,
0.4775523, -0.8098525, 0.4225345, 0.1215686, 0, 1, 1,
0.4793007, 0.5770305, -0.2078298, 0.1294118, 0, 1, 1,
0.4957643, 0.8644838, 0.6835831, 0.1333333, 0, 1, 1,
0.4979065, -0.3885437, 2.441749, 0.1411765, 0, 1, 1,
0.5010111, -0.2386004, 0.3006244, 0.145098, 0, 1, 1,
0.5023694, -1.932955, 2.366965, 0.1529412, 0, 1, 1,
0.5032769, 0.5126897, -0.4432737, 0.1568628, 0, 1, 1,
0.5129862, -0.2685205, 3.062145, 0.1647059, 0, 1, 1,
0.5143659, -0.02702211, 2.261064, 0.1686275, 0, 1, 1,
0.5183135, 1.019325, 0.8414072, 0.1764706, 0, 1, 1,
0.5189749, 1.012276, -0.2185735, 0.1803922, 0, 1, 1,
0.5209147, 1.442218, 0.2479878, 0.1882353, 0, 1, 1,
0.5228919, -0.7482803, 1.07323, 0.1921569, 0, 1, 1,
0.5230274, 0.8836186, 0.7646859, 0.2, 0, 1, 1,
0.5249146, -0.8139419, 2.492073, 0.2078431, 0, 1, 1,
0.5266114, 1.229403, -0.2431861, 0.2117647, 0, 1, 1,
0.5418436, 1.143529, 0.4376913, 0.2196078, 0, 1, 1,
0.5421718, 0.06091568, 0.8948481, 0.2235294, 0, 1, 1,
0.5472737, 0.5171548, 1.075606, 0.2313726, 0, 1, 1,
0.5483462, -0.5735769, 1.85006, 0.2352941, 0, 1, 1,
0.5489301, 1.468549, 2.204672, 0.2431373, 0, 1, 1,
0.5537411, -0.3134137, 1.305815, 0.2470588, 0, 1, 1,
0.5563743, 0.2185071, 2.508781, 0.254902, 0, 1, 1,
0.5604869, -0.5823886, 2.241061, 0.2588235, 0, 1, 1,
0.5609312, -0.7763269, 3.675453, 0.2666667, 0, 1, 1,
0.5622764, -1.22861, 1.403865, 0.2705882, 0, 1, 1,
0.5629557, 0.001639225, 1.449673, 0.2784314, 0, 1, 1,
0.5682576, -1.134214, 1.533409, 0.282353, 0, 1, 1,
0.5740471, -0.4729905, 2.056264, 0.2901961, 0, 1, 1,
0.5741245, -1.443307, 3.618511, 0.2941177, 0, 1, 1,
0.5743091, 0.6693574, 2.767462, 0.3019608, 0, 1, 1,
0.5752805, -0.2228274, 1.477036, 0.3098039, 0, 1, 1,
0.5781091, 0.8046809, 0.1519615, 0.3137255, 0, 1, 1,
0.5835705, 1.836315, -0.7158141, 0.3215686, 0, 1, 1,
0.5872179, 2.44927, 0.9574766, 0.3254902, 0, 1, 1,
0.5897998, 0.6725408, -0.6484004, 0.3333333, 0, 1, 1,
0.590502, 0.5170511, 0.1509643, 0.3372549, 0, 1, 1,
0.5910079, -1.221306, 3.071133, 0.345098, 0, 1, 1,
0.5916228, 0.5040071, 0.5866699, 0.3490196, 0, 1, 1,
0.5967308, 1.290385, 2.022187, 0.3568628, 0, 1, 1,
0.5989889, 1.652264, -0.1893354, 0.3607843, 0, 1, 1,
0.6004097, 1.974835, -0.2012963, 0.3686275, 0, 1, 1,
0.6031685, 0.5189462, 0.231119, 0.372549, 0, 1, 1,
0.603431, 0.201498, 2.311877, 0.3803922, 0, 1, 1,
0.6042643, 0.5964623, 0.7116619, 0.3843137, 0, 1, 1,
0.6064756, -1.183511, 2.658636, 0.3921569, 0, 1, 1,
0.6064809, -1.474793, 4.048897, 0.3960784, 0, 1, 1,
0.6079965, 2.354914, 2.555576, 0.4039216, 0, 1, 1,
0.6096494, -0.7261367, 2.396584, 0.4117647, 0, 1, 1,
0.6109827, 0.411125, 2.471158, 0.4156863, 0, 1, 1,
0.6128436, -1.44138, 4.194008, 0.4235294, 0, 1, 1,
0.6131589, -0.8450309, 0.9610298, 0.427451, 0, 1, 1,
0.6256558, -1.73479, 3.074711, 0.4352941, 0, 1, 1,
0.6310685, 0.2935764, 1.78845, 0.4392157, 0, 1, 1,
0.6334081, -1.638066, 2.752727, 0.4470588, 0, 1, 1,
0.6382405, 2.253097, 0.5160561, 0.4509804, 0, 1, 1,
0.6391053, -0.2951186, 1.827225, 0.4588235, 0, 1, 1,
0.6429426, -0.1547833, 1.900828, 0.4627451, 0, 1, 1,
0.6430074, -0.9200873, 2.863338, 0.4705882, 0, 1, 1,
0.6476179, -2.110733, 5.07065, 0.4745098, 0, 1, 1,
0.6478482, 1.136743, 0.4596271, 0.4823529, 0, 1, 1,
0.650796, 0.6114487, -0.06056902, 0.4862745, 0, 1, 1,
0.654551, 0.629971, 0.8764984, 0.4941176, 0, 1, 1,
0.6568176, 0.08680143, 0.9629524, 0.5019608, 0, 1, 1,
0.6617696, -0.06444073, 3.683965, 0.5058824, 0, 1, 1,
0.6637269, -0.2709801, 3.67793, 0.5137255, 0, 1, 1,
0.6653422, -1.431077, 4.329443, 0.5176471, 0, 1, 1,
0.6707649, -0.3976085, 2.309884, 0.5254902, 0, 1, 1,
0.6749576, 1.329107, 0.9330931, 0.5294118, 0, 1, 1,
0.6783139, 1.68266, 1.646069, 0.5372549, 0, 1, 1,
0.6785015, -0.8293189, 2.15689, 0.5411765, 0, 1, 1,
0.6830667, -1.088739, 3.426734, 0.5490196, 0, 1, 1,
0.7047091, 1.90319, -0.8116379, 0.5529412, 0, 1, 1,
0.7059987, -0.6395882, 2.722366, 0.5607843, 0, 1, 1,
0.712007, 0.732989, 1.333518, 0.5647059, 0, 1, 1,
0.7151742, -0.5015082, 0.5395679, 0.572549, 0, 1, 1,
0.7169577, -2.147003, 2.542073, 0.5764706, 0, 1, 1,
0.7295256, -0.3577528, 1.44642, 0.5843138, 0, 1, 1,
0.7349755, 1.279407, 1.221016, 0.5882353, 0, 1, 1,
0.7398657, -0.2835022, 2.953459, 0.5960785, 0, 1, 1,
0.7488241, -0.7526945, 2.613712, 0.6039216, 0, 1, 1,
0.7503795, 0.07062099, 1.183197, 0.6078432, 0, 1, 1,
0.7512231, -0.5787745, 2.564839, 0.6156863, 0, 1, 1,
0.7529242, -1.664675, 2.715683, 0.6196079, 0, 1, 1,
0.7545566, 0.4347947, 1.909869, 0.627451, 0, 1, 1,
0.7572308, -0.3896969, 2.118296, 0.6313726, 0, 1, 1,
0.7599901, 0.508639, 1.904871, 0.6392157, 0, 1, 1,
0.7618629, 0.5341433, 1.46438, 0.6431373, 0, 1, 1,
0.7692671, 0.2497764, 0.1242506, 0.6509804, 0, 1, 1,
0.7696223, -0.3021429, 3.622576, 0.654902, 0, 1, 1,
0.7745577, 0.7344214, 0.3473199, 0.6627451, 0, 1, 1,
0.7751343, -1.0223, -0.2104944, 0.6666667, 0, 1, 1,
0.7790586, 0.8121502, 1.215512, 0.6745098, 0, 1, 1,
0.7874327, 0.2586412, 0.06042155, 0.6784314, 0, 1, 1,
0.7955154, -0.794692, 1.294519, 0.6862745, 0, 1, 1,
0.801987, -0.1380971, 1.125214, 0.6901961, 0, 1, 1,
0.8043529, -0.3197525, 0.9232682, 0.6980392, 0, 1, 1,
0.8121586, 0.5562383, -0.07632393, 0.7058824, 0, 1, 1,
0.8156988, 0.7296047, 1.798259, 0.7098039, 0, 1, 1,
0.8170252, 2.046619, 0.2506002, 0.7176471, 0, 1, 1,
0.8215159, 2.096648, 2.435615, 0.7215686, 0, 1, 1,
0.8233266, 1.591465, 1.129972, 0.7294118, 0, 1, 1,
0.8239496, 1.060824, 0.6321749, 0.7333333, 0, 1, 1,
0.8241944, -0.09253661, 3.223588, 0.7411765, 0, 1, 1,
0.8271604, 0.5677987, 0.09102926, 0.7450981, 0, 1, 1,
0.8324181, 0.2618403, 2.805813, 0.7529412, 0, 1, 1,
0.8365306, 0.9633505, 2.278533, 0.7568628, 0, 1, 1,
0.8375041, -0.7399393, -0.7191451, 0.7647059, 0, 1, 1,
0.8386556, 0.6383143, 1.869685, 0.7686275, 0, 1, 1,
0.8447696, -0.7728599, 1.441083, 0.7764706, 0, 1, 1,
0.8492783, -0.7858317, 1.621971, 0.7803922, 0, 1, 1,
0.8522412, 1.727428, -0.08578705, 0.7882353, 0, 1, 1,
0.8593844, -2.187809, 2.594488, 0.7921569, 0, 1, 1,
0.8634899, -1.259547, 1.77081, 0.8, 0, 1, 1,
0.8674552, 0.9792665, 1.030966, 0.8078431, 0, 1, 1,
0.8691619, 0.3650587, 0.7329564, 0.8117647, 0, 1, 1,
0.885332, -0.05129934, 0.6657203, 0.8196079, 0, 1, 1,
0.8861389, 0.2509994, 0.4467982, 0.8235294, 0, 1, 1,
0.8864421, 1.440902, -0.2591773, 0.8313726, 0, 1, 1,
0.8906839, -0.5219509, 1.855419, 0.8352941, 0, 1, 1,
0.8937224, -0.4477973, 2.389729, 0.8431373, 0, 1, 1,
0.8938041, 1.096644, 1.259059, 0.8470588, 0, 1, 1,
0.8944184, 0.5652748, -0.8817052, 0.854902, 0, 1, 1,
0.9019439, -0.04290203, 1.852436, 0.8588235, 0, 1, 1,
0.9032577, -0.5475823, 2.739103, 0.8666667, 0, 1, 1,
0.9090618, 0.5783214, 1.208469, 0.8705882, 0, 1, 1,
0.9167762, -1.203723, 2.409032, 0.8784314, 0, 1, 1,
0.9228317, 0.9011476, 1.348026, 0.8823529, 0, 1, 1,
0.9265717, -0.3595646, 2.834425, 0.8901961, 0, 1, 1,
0.9270236, 0.7687858, -0.01610201, 0.8941177, 0, 1, 1,
0.9281177, 1.307552, 2.947887, 0.9019608, 0, 1, 1,
0.9302412, 0.1149892, 2.40105, 0.9098039, 0, 1, 1,
0.9316939, 0.2288309, 0.1416673, 0.9137255, 0, 1, 1,
0.9319509, 0.4802024, 1.336792, 0.9215686, 0, 1, 1,
0.9412357, 0.8683489, -1.913301, 0.9254902, 0, 1, 1,
0.9459129, -0.7244179, 1.974405, 0.9333333, 0, 1, 1,
0.9497812, 0.7121478, 1.915526, 0.9372549, 0, 1, 1,
0.9569881, 0.2279233, 1.444165, 0.945098, 0, 1, 1,
0.9593652, -1.127064, 0.0812009, 0.9490196, 0, 1, 1,
0.9595616, -1.476586, 1.282987, 0.9568627, 0, 1, 1,
0.9597564, -1.471056, 2.27897, 0.9607843, 0, 1, 1,
0.9604393, 0.4010596, 1.144104, 0.9686275, 0, 1, 1,
0.9617677, -0.5058243, 1.530743, 0.972549, 0, 1, 1,
0.9654893, 0.7785748, 1.690904, 0.9803922, 0, 1, 1,
0.9656724, -0.4668527, 2.789037, 0.9843137, 0, 1, 1,
0.9694119, -0.5595301, 3.911718, 0.9921569, 0, 1, 1,
0.9720001, -0.6147996, 2.272966, 0.9960784, 0, 1, 1,
0.9735, -0.60054, 3.566227, 1, 0, 0.9960784, 1,
0.9754598, 0.6115079, 1.663181, 1, 0, 0.9882353, 1,
0.9776015, 1.426765, 0.3693426, 1, 0, 0.9843137, 1,
0.9795467, 0.6352937, 1.718822, 1, 0, 0.9764706, 1,
0.9876332, 0.3704049, 0.243943, 1, 0, 0.972549, 1,
0.9975085, 1.554238, -3.053424, 1, 0, 0.9647059, 1,
0.9979585, -0.09438372, -0.408473, 1, 0, 0.9607843, 1,
0.9994828, 0.7442404, 3.148646, 1, 0, 0.9529412, 1,
1.000496, 0.9269363, 1.087642, 1, 0, 0.9490196, 1,
1.015417, -0.09325331, 2.770296, 1, 0, 0.9411765, 1,
1.018754, 1.744635, 1.319644, 1, 0, 0.9372549, 1,
1.038913, -1.31152, 0.4745673, 1, 0, 0.9294118, 1,
1.046127, 1.103375, 0.3848073, 1, 0, 0.9254902, 1,
1.059045, -0.1759437, 2.323436, 1, 0, 0.9176471, 1,
1.063707, 0.4275849, 0.6909077, 1, 0, 0.9137255, 1,
1.064278, 0.8088673, -2.331479, 1, 0, 0.9058824, 1,
1.068715, -1.007342, 1.763481, 1, 0, 0.9019608, 1,
1.078447, 0.2105363, 1.082058, 1, 0, 0.8941177, 1,
1.08664, -0.1446666, 2.609442, 1, 0, 0.8862745, 1,
1.087793, 0.5095048, 1.910846, 1, 0, 0.8823529, 1,
1.092115, -0.7915257, 0.9492747, 1, 0, 0.8745098, 1,
1.093136, -1.107376, 2.943734, 1, 0, 0.8705882, 1,
1.103027, 0.1702343, 1.032818, 1, 0, 0.8627451, 1,
1.106904, 0.1596124, 0.9306648, 1, 0, 0.8588235, 1,
1.111045, 0.6857769, 1.469039, 1, 0, 0.8509804, 1,
1.114367, 1.841779, 1.80561, 1, 0, 0.8470588, 1,
1.119422, -2.046925, 3.285802, 1, 0, 0.8392157, 1,
1.121825, 0.733118, 1.526729, 1, 0, 0.8352941, 1,
1.125291, -0.7092521, 1.740846, 1, 0, 0.827451, 1,
1.132222, -0.07127547, 1.851785, 1, 0, 0.8235294, 1,
1.136767, -1.5774, 1.585117, 1, 0, 0.8156863, 1,
1.137895, -0.952894, 3.413732, 1, 0, 0.8117647, 1,
1.140828, -1.755032, 2.762141, 1, 0, 0.8039216, 1,
1.147183, 1.580144, 0.1745314, 1, 0, 0.7960784, 1,
1.154323, 0.3156003, 0.6720321, 1, 0, 0.7921569, 1,
1.154671, -0.5454587, 1.952116, 1, 0, 0.7843137, 1,
1.168839, -2.123565, 3.784441, 1, 0, 0.7803922, 1,
1.181653, -0.08242156, 0.458351, 1, 0, 0.772549, 1,
1.190003, 0.7265005, 0.6542812, 1, 0, 0.7686275, 1,
1.191214, -1.194568, 1.568454, 1, 0, 0.7607843, 1,
1.191741, -1.181745, 2.149639, 1, 0, 0.7568628, 1,
1.194381, -1.577329, 3.389283, 1, 0, 0.7490196, 1,
1.197936, -0.4191554, 0.8095342, 1, 0, 0.7450981, 1,
1.19881, -1.100385, 1.785271, 1, 0, 0.7372549, 1,
1.208082, 0.361169, 2.640104, 1, 0, 0.7333333, 1,
1.208727, 0.5830804, -0.125497, 1, 0, 0.7254902, 1,
1.20921, 1.011796, -0.6960492, 1, 0, 0.7215686, 1,
1.213332, -1.153632, 2.520437, 1, 0, 0.7137255, 1,
1.221121, -0.0964527, 0.7949842, 1, 0, 0.7098039, 1,
1.226498, 1.794377, 1.754134, 1, 0, 0.7019608, 1,
1.226654, 0.9810579, 0.2879302, 1, 0, 0.6941177, 1,
1.227422, 0.5829952, 1.003264, 1, 0, 0.6901961, 1,
1.232379, -0.9725721, 1.419621, 1, 0, 0.682353, 1,
1.23384, -0.3568954, 0.4738182, 1, 0, 0.6784314, 1,
1.246808, 1.155044, 0.1564554, 1, 0, 0.6705883, 1,
1.247828, 0.6360908, 0.8358417, 1, 0, 0.6666667, 1,
1.248246, 0.00907037, 1.403865, 1, 0, 0.6588235, 1,
1.24853, 0.1037496, 1.953717, 1, 0, 0.654902, 1,
1.255284, -1.305787, 3.396199, 1, 0, 0.6470588, 1,
1.263722, 0.732583, 0.118397, 1, 0, 0.6431373, 1,
1.264037, 0.9524591, 1.108992, 1, 0, 0.6352941, 1,
1.278321, -0.2590524, 1.986504, 1, 0, 0.6313726, 1,
1.282947, -0.5110148, 2.075376, 1, 0, 0.6235294, 1,
1.283383, 0.06295402, -0.5022587, 1, 0, 0.6196079, 1,
1.285921, 0.8944784, 1.483856, 1, 0, 0.6117647, 1,
1.293381, 0.2946914, 2.01368, 1, 0, 0.6078432, 1,
1.299996, 1.273471, 3.752541, 1, 0, 0.6, 1,
1.325695, -0.2999794, 3.103573, 1, 0, 0.5921569, 1,
1.331424, 0.3754016, 1.201162, 1, 0, 0.5882353, 1,
1.346444, 0.6318587, 2.90301, 1, 0, 0.5803922, 1,
1.352556, -1.206307, 2.412924, 1, 0, 0.5764706, 1,
1.35616, -0.8167199, 2.28365, 1, 0, 0.5686275, 1,
1.365275, 0.09041147, 2.836203, 1, 0, 0.5647059, 1,
1.366252, -0.4645638, 0.7189203, 1, 0, 0.5568628, 1,
1.372808, 1.765179, 0.9229618, 1, 0, 0.5529412, 1,
1.381262, -0.06166219, 0.3364076, 1, 0, 0.5450981, 1,
1.389188, 0.932521, 0.7843321, 1, 0, 0.5411765, 1,
1.39884, 0.7985674, 0.3143461, 1, 0, 0.5333334, 1,
1.409516, 0.149756, 2.982195, 1, 0, 0.5294118, 1,
1.411959, 0.5632176, 0.8875846, 1, 0, 0.5215687, 1,
1.416975, 0.862098, 0.6761543, 1, 0, 0.5176471, 1,
1.429456, -0.06164687, -0.7905625, 1, 0, 0.509804, 1,
1.435922, 1.08935, 0.4862424, 1, 0, 0.5058824, 1,
1.438984, -0.2148368, 0.5966268, 1, 0, 0.4980392, 1,
1.441308, 0.4733475, 1.50356, 1, 0, 0.4901961, 1,
1.447001, -0.01701263, 0.7096048, 1, 0, 0.4862745, 1,
1.460544, 0.8915647, 0.07153168, 1, 0, 0.4784314, 1,
1.461271, -0.2589474, 2.725435, 1, 0, 0.4745098, 1,
1.469727, 1.126103, 0.9335786, 1, 0, 0.4666667, 1,
1.469826, 0.5243618, 3.750059, 1, 0, 0.4627451, 1,
1.477472, 1.116831, 1.763701, 1, 0, 0.454902, 1,
1.513041, -0.9671127, 2.65494, 1, 0, 0.4509804, 1,
1.513944, 1.098025, -0.2101316, 1, 0, 0.4431373, 1,
1.528499, -0.9914694, 1.6055, 1, 0, 0.4392157, 1,
1.530961, -0.07248928, 1.078708, 1, 0, 0.4313726, 1,
1.541968, -0.7191928, 1.924087, 1, 0, 0.427451, 1,
1.552292, -1.38302, 3.32614, 1, 0, 0.4196078, 1,
1.56019, -0.1917552, 2.108906, 1, 0, 0.4156863, 1,
1.565356, 0.3526401, 0.3266998, 1, 0, 0.4078431, 1,
1.566132, 1.38042, 1.738166, 1, 0, 0.4039216, 1,
1.57523, -0.9413177, 0.4856058, 1, 0, 0.3960784, 1,
1.582037, -0.06651205, 1.803167, 1, 0, 0.3882353, 1,
1.583203, -0.2852832, 1.748054, 1, 0, 0.3843137, 1,
1.586594, 1.174239, 3.618145, 1, 0, 0.3764706, 1,
1.589891, -0.4024603, 2.212115, 1, 0, 0.372549, 1,
1.591598, 0.6307244, 0.4716619, 1, 0, 0.3647059, 1,
1.599856, 1.300227, 0.859405, 1, 0, 0.3607843, 1,
1.602557, 0.3871697, 3.705242, 1, 0, 0.3529412, 1,
1.611972, 1.569736, 1.813096, 1, 0, 0.3490196, 1,
1.622857, 0.7426034, 2.299766, 1, 0, 0.3411765, 1,
1.642284, -1.435345, 1.777052, 1, 0, 0.3372549, 1,
1.647626, -0.2556852, 2.810083, 1, 0, 0.3294118, 1,
1.648159, 1.072041, 1.78701, 1, 0, 0.3254902, 1,
1.650668, -0.1317767, 1.241001, 1, 0, 0.3176471, 1,
1.668804, -0.381948, 2.14717, 1, 0, 0.3137255, 1,
1.683394, 1.614301, 1.640409, 1, 0, 0.3058824, 1,
1.683967, 0.2858445, 1.273922, 1, 0, 0.2980392, 1,
1.701558, 1.510201, 0.3993085, 1, 0, 0.2941177, 1,
1.712005, 2.338617, -0.1152456, 1, 0, 0.2862745, 1,
1.714922, 0.5042045, 2.141231, 1, 0, 0.282353, 1,
1.718516, -1.710519, 1.509319, 1, 0, 0.2745098, 1,
1.719133, 0.6100076, 1.895176, 1, 0, 0.2705882, 1,
1.722008, -1.190008, -0.08876588, 1, 0, 0.2627451, 1,
1.725656, 0.8202571, -0.2316726, 1, 0, 0.2588235, 1,
1.733692, -0.1688605, 1.867297, 1, 0, 0.2509804, 1,
1.752988, 1.493719, 1.888996, 1, 0, 0.2470588, 1,
1.759953, -0.8816478, 2.906436, 1, 0, 0.2392157, 1,
1.79257, 0.4299294, -0.3441324, 1, 0, 0.2352941, 1,
1.816797, 0.1801508, 1.03785, 1, 0, 0.227451, 1,
1.834612, -0.9285195, 2.934052, 1, 0, 0.2235294, 1,
1.83989, -0.5051278, -0.4484101, 1, 0, 0.2156863, 1,
1.85588, 3.023942, -1.151138, 1, 0, 0.2117647, 1,
1.85652, 1.032362, 1.706944, 1, 0, 0.2039216, 1,
1.879623, 1.012581, 2.477397, 1, 0, 0.1960784, 1,
1.896773, 0.1167241, 1.079085, 1, 0, 0.1921569, 1,
1.914842, -0.7347793, 1.233689, 1, 0, 0.1843137, 1,
2.013587, -0.3100543, 1.884067, 1, 0, 0.1803922, 1,
2.022813, 0.633676, 1.331665, 1, 0, 0.172549, 1,
2.088205, 2.245641, -0.1381579, 1, 0, 0.1686275, 1,
2.093987, 1.329339, 0.1482842, 1, 0, 0.1607843, 1,
2.10449, 0.7106418, 1.395248, 1, 0, 0.1568628, 1,
2.107304, 0.04145538, 1.156884, 1, 0, 0.1490196, 1,
2.122317, 1.579516, 0.3733975, 1, 0, 0.145098, 1,
2.13981, -0.2648735, 2.062071, 1, 0, 0.1372549, 1,
2.140991, -1.721739, 3.566069, 1, 0, 0.1333333, 1,
2.191533, 2.078099, 1.576106, 1, 0, 0.1254902, 1,
2.194119, 1.27956, 1.187642, 1, 0, 0.1215686, 1,
2.197965, -0.2666622, 3.39873, 1, 0, 0.1137255, 1,
2.218343, 0.5669181, 2.188082, 1, 0, 0.1098039, 1,
2.22158, -1.086589, 0.7777724, 1, 0, 0.1019608, 1,
2.292541, -0.867651, 2.89333, 1, 0, 0.09411765, 1,
2.326506, 0.1353426, 1.504151, 1, 0, 0.09019608, 1,
2.366248, 0.9179174, 2.019136, 1, 0, 0.08235294, 1,
2.409002, 0.1940474, 0.8759585, 1, 0, 0.07843138, 1,
2.430854, -1.216864, 0.644705, 1, 0, 0.07058824, 1,
2.483244, -0.1070369, 1.923113, 1, 0, 0.06666667, 1,
2.499703, -0.7643118, 0.6607407, 1, 0, 0.05882353, 1,
2.516206, 0.8415656, 2.40368, 1, 0, 0.05490196, 1,
2.549696, 0.6618615, 1.394253, 1, 0, 0.04705882, 1,
2.618804, -1.14992, 1.505324, 1, 0, 0.04313726, 1,
2.679358, -1.026107, 3.03514, 1, 0, 0.03529412, 1,
2.736874, -1.045491, 2.640044, 1, 0, 0.03137255, 1,
2.759202, 0.262102, 0.008292831, 1, 0, 0.02352941, 1,
2.835302, 0.7421404, 2.017727, 1, 0, 0.01960784, 1,
2.962186, 0.2848439, 1.777049, 1, 0, 0.01176471, 1,
3.056393, -0.650621, 1.045948, 1, 0, 0.007843138, 1
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
-0.2132809, -3.903314, -7.152156, 0, -0.5, 0.5, 0.5,
-0.2132809, -3.903314, -7.152156, 1, -0.5, 0.5, 0.5,
-0.2132809, -3.903314, -7.152156, 1, 1.5, 0.5, 0.5,
-0.2132809, -3.903314, -7.152156, 0, 1.5, 0.5, 0.5
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
-4.591374, 0.06231022, -7.152156, 0, -0.5, 0.5, 0.5,
-4.591374, 0.06231022, -7.152156, 1, -0.5, 0.5, 0.5,
-4.591374, 0.06231022, -7.152156, 1, 1.5, 0.5, 0.5,
-4.591374, 0.06231022, -7.152156, 0, 1.5, 0.5, 0.5
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
-4.591374, -3.903314, -0.1362219, 0, -0.5, 0.5, 0.5,
-4.591374, -3.903314, -0.1362219, 1, -0.5, 0.5, 0.5,
-4.591374, -3.903314, -0.1362219, 1, 1.5, 0.5, 0.5,
-4.591374, -3.903314, -0.1362219, 0, 1.5, 0.5, 0.5
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
-3, -2.98817, -5.533094,
3, -2.98817, -5.533094,
-3, -2.98817, -5.533094,
-3, -3.140694, -5.802938,
-2, -2.98817, -5.533094,
-2, -3.140694, -5.802938,
-1, -2.98817, -5.533094,
-1, -3.140694, -5.802938,
0, -2.98817, -5.533094,
0, -3.140694, -5.802938,
1, -2.98817, -5.533094,
1, -3.140694, -5.802938,
2, -2.98817, -5.533094,
2, -3.140694, -5.802938,
3, -2.98817, -5.533094,
3, -3.140694, -5.802938
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
-3, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
-3, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
-3, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
-3, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
-2, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
-2, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
-2, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
-2, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
-1, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
-1, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
-1, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
-1, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
0, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
0, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
0, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
0, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
1, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
1, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
1, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
1, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
2, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
2, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
2, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
2, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5,
3, -3.445742, -6.342625, 0, -0.5, 0.5, 0.5,
3, -3.445742, -6.342625, 1, -0.5, 0.5, 0.5,
3, -3.445742, -6.342625, 1, 1.5, 0.5, 0.5,
3, -3.445742, -6.342625, 0, 1.5, 0.5, 0.5
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
-3.581045, -2, -5.533094,
-3.581045, 3, -5.533094,
-3.581045, -2, -5.533094,
-3.749433, -2, -5.802938,
-3.581045, -1, -5.533094,
-3.749433, -1, -5.802938,
-3.581045, 0, -5.533094,
-3.749433, 0, -5.802938,
-3.581045, 1, -5.533094,
-3.749433, 1, -5.802938,
-3.581045, 2, -5.533094,
-3.749433, 2, -5.802938,
-3.581045, 3, -5.533094,
-3.749433, 3, -5.802938
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
-4.08621, -2, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, -2, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, -2, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, -2, -6.342625, 0, 1.5, 0.5, 0.5,
-4.08621, -1, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, -1, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, -1, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, -1, -6.342625, 0, 1.5, 0.5, 0.5,
-4.08621, 0, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, 0, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, 0, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, 0, -6.342625, 0, 1.5, 0.5, 0.5,
-4.08621, 1, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, 1, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, 1, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, 1, -6.342625, 0, 1.5, 0.5, 0.5,
-4.08621, 2, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, 2, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, 2, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, 2, -6.342625, 0, 1.5, 0.5, 0.5,
-4.08621, 3, -6.342625, 0, -0.5, 0.5, 0.5,
-4.08621, 3, -6.342625, 1, -0.5, 0.5, 0.5,
-4.08621, 3, -6.342625, 1, 1.5, 0.5, 0.5,
-4.08621, 3, -6.342625, 0, 1.5, 0.5, 0.5
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
-3.581045, -2.98817, -4,
-3.581045, -2.98817, 4,
-3.581045, -2.98817, -4,
-3.749433, -3.140694, -4,
-3.581045, -2.98817, -2,
-3.749433, -3.140694, -2,
-3.581045, -2.98817, 0,
-3.749433, -3.140694, 0,
-3.581045, -2.98817, 2,
-3.749433, -3.140694, 2,
-3.581045, -2.98817, 4,
-3.749433, -3.140694, 4
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
-4.08621, -3.445742, -4, 0, -0.5, 0.5, 0.5,
-4.08621, -3.445742, -4, 1, -0.5, 0.5, 0.5,
-4.08621, -3.445742, -4, 1, 1.5, 0.5, 0.5,
-4.08621, -3.445742, -4, 0, 1.5, 0.5, 0.5,
-4.08621, -3.445742, -2, 0, -0.5, 0.5, 0.5,
-4.08621, -3.445742, -2, 1, -0.5, 0.5, 0.5,
-4.08621, -3.445742, -2, 1, 1.5, 0.5, 0.5,
-4.08621, -3.445742, -2, 0, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 0, 0, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 0, 1, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 0, 1, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 0, 0, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 2, 0, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 2, 1, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 2, 1, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 2, 0, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 4, 0, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 4, 1, -0.5, 0.5, 0.5,
-4.08621, -3.445742, 4, 1, 1.5, 0.5, 0.5,
-4.08621, -3.445742, 4, 0, 1.5, 0.5, 0.5
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
-3.581045, -2.98817, -5.533094,
-3.581045, 3.11279, -5.533094,
-3.581045, -2.98817, 5.26065,
-3.581045, 3.11279, 5.26065,
-3.581045, -2.98817, -5.533094,
-3.581045, -2.98817, 5.26065,
-3.581045, 3.11279, -5.533094,
-3.581045, 3.11279, 5.26065,
-3.581045, -2.98817, -5.533094,
3.154483, -2.98817, -5.533094,
-3.581045, -2.98817, 5.26065,
3.154483, -2.98817, 5.26065,
-3.581045, 3.11279, -5.533094,
3.154483, 3.11279, -5.533094,
-3.581045, 3.11279, 5.26065,
3.154483, 3.11279, 5.26065,
3.154483, -2.98817, -5.533094,
3.154483, 3.11279, -5.533094,
3.154483, -2.98817, 5.26065,
3.154483, 3.11279, 5.26065,
3.154483, -2.98817, -5.533094,
3.154483, -2.98817, 5.26065,
3.154483, 3.11279, -5.533094,
3.154483, 3.11279, 5.26065
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
var radius = 7.534502;
var distance = 33.52185;
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
mvMatrix.translate( 0.2132809, -0.06231022, 0.1362219 );
mvMatrix.scale( 1.209475, 1.335274, 0.7547382 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52185);
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


