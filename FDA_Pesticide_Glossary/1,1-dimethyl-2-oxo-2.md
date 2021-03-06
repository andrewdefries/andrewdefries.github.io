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
-3.01238, 0.626839, 0.6670624, 1, 0, 0, 1,
-2.940397, 1.600141, -0.03341503, 1, 0.007843138, 0, 1,
-2.845643, -3.149077, -2.264596, 1, 0.01176471, 0, 1,
-2.728042, -0.7027112, -0.996916, 1, 0.01960784, 0, 1,
-2.707385, 1.108535, 0.2878557, 1, 0.02352941, 0, 1,
-2.612357, -0.6472315, -0.614679, 1, 0.03137255, 0, 1,
-2.574471, -0.2056191, -2.262624, 1, 0.03529412, 0, 1,
-2.462577, -2.278697, -2.910558, 1, 0.04313726, 0, 1,
-2.419782, 0.9716781, -1.457856, 1, 0.04705882, 0, 1,
-2.386589, 0.07789983, -0.4862727, 1, 0.05490196, 0, 1,
-2.349627, -0.3323036, -2.96342, 1, 0.05882353, 0, 1,
-2.342534, 1.218203, -0.436455, 1, 0.06666667, 0, 1,
-2.321868, 0.08689382, -4.36786, 1, 0.07058824, 0, 1,
-2.28174, -0.7062778, -1.481467, 1, 0.07843138, 0, 1,
-2.272968, 0.8168046, -1.905015, 1, 0.08235294, 0, 1,
-2.269083, -0.3514798, -1.26824, 1, 0.09019608, 0, 1,
-2.260166, -1.999264, -1.73416, 1, 0.09411765, 0, 1,
-2.250396, -0.5859539, -2.526057, 1, 0.1019608, 0, 1,
-2.225229, 1.638894, 0.09834279, 1, 0.1098039, 0, 1,
-2.1966, -0.2666676, -0.9068562, 1, 0.1137255, 0, 1,
-2.192816, 0.4500799, -2.166908, 1, 0.1215686, 0, 1,
-2.151431, -1.62336, -3.096966, 1, 0.1254902, 0, 1,
-2.133139, 0.1434781, -2.593097, 1, 0.1333333, 0, 1,
-2.057362, 1.939371, -1.483192, 1, 0.1372549, 0, 1,
-1.985288, 0.5255648, -2.06372, 1, 0.145098, 0, 1,
-1.964017, 0.8378444, -0.0121437, 1, 0.1490196, 0, 1,
-1.94083, 0.2690573, -1.170828, 1, 0.1568628, 0, 1,
-1.925148, 1.791783, -2.683628, 1, 0.1607843, 0, 1,
-1.920103, -0.8689798, -2.113955, 1, 0.1686275, 0, 1,
-1.894772, 0.05562837, -0.4919802, 1, 0.172549, 0, 1,
-1.892748, -0.1321616, -2.764559, 1, 0.1803922, 0, 1,
-1.868352, -0.7303988, -2.374233, 1, 0.1843137, 0, 1,
-1.859681, 0.1836675, -0.6399455, 1, 0.1921569, 0, 1,
-1.826442, -0.01273047, -2.78661, 1, 0.1960784, 0, 1,
-1.820991, 0.3526954, -0.2196925, 1, 0.2039216, 0, 1,
-1.816939, -0.6561012, -1.53645, 1, 0.2117647, 0, 1,
-1.816672, -1.121808, -2.540634, 1, 0.2156863, 0, 1,
-1.815964, -1.128506, -1.466146, 1, 0.2235294, 0, 1,
-1.76982, 0.8122689, 1.419106, 1, 0.227451, 0, 1,
-1.766234, -0.2087996, 0.7709264, 1, 0.2352941, 0, 1,
-1.759149, -1.533247, -3.587478, 1, 0.2392157, 0, 1,
-1.746977, -1.406885, -3.404215, 1, 0.2470588, 0, 1,
-1.680566, 1.486033, -0.4707235, 1, 0.2509804, 0, 1,
-1.674523, 1.267123, -1.85625, 1, 0.2588235, 0, 1,
-1.645443, -0.08754969, -1.940491, 1, 0.2627451, 0, 1,
-1.596594, -2.02604, -3.127263, 1, 0.2705882, 0, 1,
-1.592547, -0.7024132, -2.510281, 1, 0.2745098, 0, 1,
-1.590326, -0.7436938, -3.108892, 1, 0.282353, 0, 1,
-1.585421, 0.3685713, -1.078116, 1, 0.2862745, 0, 1,
-1.581843, 0.4470868, 0.9793875, 1, 0.2941177, 0, 1,
-1.561238, 0.7520493, -1.960535, 1, 0.3019608, 0, 1,
-1.552806, -1.835466, -1.749205, 1, 0.3058824, 0, 1,
-1.548734, -1.250484, -1.304209, 1, 0.3137255, 0, 1,
-1.536541, -0.1622657, -0.4234949, 1, 0.3176471, 0, 1,
-1.490991, 0.3474778, -1.38246, 1, 0.3254902, 0, 1,
-1.489058, 2.123939, -0.1633783, 1, 0.3294118, 0, 1,
-1.471105, 0.03756396, -1.556567, 1, 0.3372549, 0, 1,
-1.464987, -0.4609736, -2.20046, 1, 0.3411765, 0, 1,
-1.448247, -0.5049638, -0.2823713, 1, 0.3490196, 0, 1,
-1.431558, -0.7475966, -1.294744, 1, 0.3529412, 0, 1,
-1.421825, -1.071388, -1.326348, 1, 0.3607843, 0, 1,
-1.403728, -1.311456, -2.666761, 1, 0.3647059, 0, 1,
-1.40337, 0.7046782, -0.7163497, 1, 0.372549, 0, 1,
-1.388821, -0.01552418, -2.183852, 1, 0.3764706, 0, 1,
-1.370576, 1.153339, -1.610262, 1, 0.3843137, 0, 1,
-1.35187, 0.8805999, 0.6245397, 1, 0.3882353, 0, 1,
-1.351793, -1.154076, -1.473745, 1, 0.3960784, 0, 1,
-1.332862, -1.823308, -3.713806, 1, 0.4039216, 0, 1,
-1.328087, 0.1098094, -0.9061064, 1, 0.4078431, 0, 1,
-1.326938, -0.9263272, -1.541315, 1, 0.4156863, 0, 1,
-1.326834, 0.9082885, -1.279185, 1, 0.4196078, 0, 1,
-1.32129, -1.565036, -2.674752, 1, 0.427451, 0, 1,
-1.320629, -0.5290998, -1.214521, 1, 0.4313726, 0, 1,
-1.314176, -0.7133129, -3.062781, 1, 0.4392157, 0, 1,
-1.31258, 0.3162133, -1.329554, 1, 0.4431373, 0, 1,
-1.293724, -1.330929, -1.540009, 1, 0.4509804, 0, 1,
-1.285255, 0.4675322, -0.451352, 1, 0.454902, 0, 1,
-1.28139, -0.7672099, -3.760265, 1, 0.4627451, 0, 1,
-1.274332, -0.2866253, -3.338802, 1, 0.4666667, 0, 1,
-1.269097, 0.958677, -1.377139, 1, 0.4745098, 0, 1,
-1.26838, 0.4315552, -2.348499, 1, 0.4784314, 0, 1,
-1.265823, -0.1095315, -0.4998333, 1, 0.4862745, 0, 1,
-1.260644, 0.7124457, -0.3811598, 1, 0.4901961, 0, 1,
-1.25926, -0.8186073, -0.6444203, 1, 0.4980392, 0, 1,
-1.257708, -0.6677486, -3.271302, 1, 0.5058824, 0, 1,
-1.25493, -0.3574456, -3.812387, 1, 0.509804, 0, 1,
-1.249716, 0.3419058, -1.809605, 1, 0.5176471, 0, 1,
-1.24587, 1.058618, -0.5493027, 1, 0.5215687, 0, 1,
-1.221929, 0.5825201, -0.9225054, 1, 0.5294118, 0, 1,
-1.219723, 1.558724, -0.8958862, 1, 0.5333334, 0, 1,
-1.219471, 0.386463, -1.196155, 1, 0.5411765, 0, 1,
-1.214775, -0.7088629, -1.801167, 1, 0.5450981, 0, 1,
-1.204815, -0.1155847, -0.9337919, 1, 0.5529412, 0, 1,
-1.198485, -0.001446038, -0.7456544, 1, 0.5568628, 0, 1,
-1.196247, 0.4043292, -2.374736, 1, 0.5647059, 0, 1,
-1.190901, -1.355445, -2.426246, 1, 0.5686275, 0, 1,
-1.188697, -0.7440497, -0.3258295, 1, 0.5764706, 0, 1,
-1.185282, 0.06669463, -2.358199, 1, 0.5803922, 0, 1,
-1.159599, -1.989511, -3.463373, 1, 0.5882353, 0, 1,
-1.152092, 2.06358, -1.128779, 1, 0.5921569, 0, 1,
-1.148076, -1.421528, -2.038674, 1, 0.6, 0, 1,
-1.146691, 0.1502485, -2.496017, 1, 0.6078432, 0, 1,
-1.146291, -0.1582787, 0.6166165, 1, 0.6117647, 0, 1,
-1.144724, 1.641356, -0.1688811, 1, 0.6196079, 0, 1,
-1.144505, -1.978532, -3.52636, 1, 0.6235294, 0, 1,
-1.136785, -0.5964116, -2.070177, 1, 0.6313726, 0, 1,
-1.133217, 0.199964, -2.155718, 1, 0.6352941, 0, 1,
-1.126421, -0.3868253, -1.138035, 1, 0.6431373, 0, 1,
-1.121311, 0.138749, -1.64878, 1, 0.6470588, 0, 1,
-1.120174, -1.49895, -3.041509, 1, 0.654902, 0, 1,
-1.119688, -1.074528, -0.6513709, 1, 0.6588235, 0, 1,
-1.11809, 0.3918334, -2.387301, 1, 0.6666667, 0, 1,
-1.111411, 0.6532207, 0.1024369, 1, 0.6705883, 0, 1,
-1.106011, 0.8120157, 0.07707638, 1, 0.6784314, 0, 1,
-1.103933, 0.7230183, -1.66969, 1, 0.682353, 0, 1,
-1.10392, 0.1837256, -2.321061, 1, 0.6901961, 0, 1,
-1.09444, 0.2431273, -2.145423, 1, 0.6941177, 0, 1,
-1.092535, -0.1169448, -0.1583522, 1, 0.7019608, 0, 1,
-1.075081, -1.168921, -3.685711, 1, 0.7098039, 0, 1,
-1.074048, -0.1590271, -2.274849, 1, 0.7137255, 0, 1,
-1.072751, 1.485762, -1.557268, 1, 0.7215686, 0, 1,
-1.072563, 0.2891944, -0.8333661, 1, 0.7254902, 0, 1,
-1.058229, 0.1989416, -3.210561, 1, 0.7333333, 0, 1,
-1.058162, -0.5891574, -0.9761842, 1, 0.7372549, 0, 1,
-1.050641, -0.5639479, -2.038863, 1, 0.7450981, 0, 1,
-1.042682, -0.879767, -3.455287, 1, 0.7490196, 0, 1,
-1.036542, 0.1686653, -2.589565, 1, 0.7568628, 0, 1,
-1.03053, -0.1892023, -1.98223, 1, 0.7607843, 0, 1,
-1.030266, -1.882538, -1.039551, 1, 0.7686275, 0, 1,
-1.026587, -0.3052549, -3.04023, 1, 0.772549, 0, 1,
-1.02371, -0.408969, -1.998053, 1, 0.7803922, 0, 1,
-1.023367, 0.7010659, -0.6497664, 1, 0.7843137, 0, 1,
-1.021252, 0.4906373, -2.338248, 1, 0.7921569, 0, 1,
-1.006571, 1.680441, -0.5578663, 1, 0.7960784, 0, 1,
-0.9964687, -1.188392, -2.229818, 1, 0.8039216, 0, 1,
-0.9912621, 1.340832, -1.614292, 1, 0.8117647, 0, 1,
-0.9911612, 0.7441469, -1.32559, 1, 0.8156863, 0, 1,
-0.9694776, -1.190683, -2.581478, 1, 0.8235294, 0, 1,
-0.9676942, 0.2267108, -1.875827, 1, 0.827451, 0, 1,
-0.9623309, 1.244617, -0.9859611, 1, 0.8352941, 0, 1,
-0.9592714, -0.30926, -1.456172, 1, 0.8392157, 0, 1,
-0.9530046, 0.7317851, -0.67305, 1, 0.8470588, 0, 1,
-0.9522043, 0.7372326, -0.6993188, 1, 0.8509804, 0, 1,
-0.9375607, 0.5185016, -1.498556, 1, 0.8588235, 0, 1,
-0.9348781, 0.1240537, -2.58532, 1, 0.8627451, 0, 1,
-0.9339555, 1.190935, 0.4661425, 1, 0.8705882, 0, 1,
-0.9318959, 0.6435594, -0.2681645, 1, 0.8745098, 0, 1,
-0.9263404, -0.9694341, -3.370245, 1, 0.8823529, 0, 1,
-0.9219513, -0.9065119, -2.831544, 1, 0.8862745, 0, 1,
-0.9211258, -0.8910873, -0.2231411, 1, 0.8941177, 0, 1,
-0.9203394, 0.1528925, -1.759905, 1, 0.8980392, 0, 1,
-0.9194866, 0.3723249, -1.605507, 1, 0.9058824, 0, 1,
-0.9190117, -0.2878233, -2.283536, 1, 0.9137255, 0, 1,
-0.9179859, -0.5489216, -1.408507, 1, 0.9176471, 0, 1,
-0.9171343, 0.6320668, -1.988494, 1, 0.9254902, 0, 1,
-0.9108923, 1.411312, 1.393949, 1, 0.9294118, 0, 1,
-0.9096994, 0.1923436, -0.9204767, 1, 0.9372549, 0, 1,
-0.9090549, -0.5339292, -1.134484, 1, 0.9411765, 0, 1,
-0.902516, 0.5924286, -2.047986, 1, 0.9490196, 0, 1,
-0.9013981, 0.4393683, -1.254006, 1, 0.9529412, 0, 1,
-0.8972973, 0.7184616, -0.1826607, 1, 0.9607843, 0, 1,
-0.8951504, -0.3188665, -1.578467, 1, 0.9647059, 0, 1,
-0.893344, 0.3756224, -2.881819, 1, 0.972549, 0, 1,
-0.890385, -1.219405, -1.753415, 1, 0.9764706, 0, 1,
-0.88528, 0.2181371, -1.070323, 1, 0.9843137, 0, 1,
-0.884706, 0.7444908, -1.217468, 1, 0.9882353, 0, 1,
-0.8772114, 0.01584865, -4.208828, 1, 0.9960784, 0, 1,
-0.8763694, 0.8116925, -2.574765, 0.9960784, 1, 0, 1,
-0.8758715, 0.285709, -0.7758526, 0.9921569, 1, 0, 1,
-0.8730711, 1.343331, -1.015802, 0.9843137, 1, 0, 1,
-0.8680037, 0.2764346, -0.4641035, 0.9803922, 1, 0, 1,
-0.8613704, -1.550403, -1.798487, 0.972549, 1, 0, 1,
-0.8576723, -0.03872771, -0.4886042, 0.9686275, 1, 0, 1,
-0.8561944, 0.04240225, -1.502261, 0.9607843, 1, 0, 1,
-0.8536257, 0.1713724, -2.198217, 0.9568627, 1, 0, 1,
-0.8527241, -0.3552605, -2.788834, 0.9490196, 1, 0, 1,
-0.8496866, 1.327687, -0.3878576, 0.945098, 1, 0, 1,
-0.8427103, 0.03719055, 0.7043358, 0.9372549, 1, 0, 1,
-0.8426523, 0.6592223, 0.5403441, 0.9333333, 1, 0, 1,
-0.8351082, -0.4114656, -3.360885, 0.9254902, 1, 0, 1,
-0.8325122, 0.7599548, -2.324716, 0.9215686, 1, 0, 1,
-0.8270712, -0.8765904, -2.586421, 0.9137255, 1, 0, 1,
-0.8228307, -0.08638206, -2.072691, 0.9098039, 1, 0, 1,
-0.8206673, -0.955524, -0.5437345, 0.9019608, 1, 0, 1,
-0.8186677, 0.7133857, -1.291324, 0.8941177, 1, 0, 1,
-0.8131309, 0.8689446, -0.5056818, 0.8901961, 1, 0, 1,
-0.8031173, -0.4681067, -1.349317, 0.8823529, 1, 0, 1,
-0.802708, 0.03929671, -2.077909, 0.8784314, 1, 0, 1,
-0.8025943, -0.7465768, -2.551706, 0.8705882, 1, 0, 1,
-0.8017967, 1.076571, 0.105861, 0.8666667, 1, 0, 1,
-0.7963017, -1.184337, -3.832622, 0.8588235, 1, 0, 1,
-0.7909811, -1.439294, -1.879834, 0.854902, 1, 0, 1,
-0.7898421, 0.4424492, -1.575646, 0.8470588, 1, 0, 1,
-0.7836753, -0.5188279, -0.6760141, 0.8431373, 1, 0, 1,
-0.7830523, 0.5956541, -1.293785, 0.8352941, 1, 0, 1,
-0.7786948, 0.5138189, -2.372902, 0.8313726, 1, 0, 1,
-0.7752222, 0.2094451, -0.5176563, 0.8235294, 1, 0, 1,
-0.7692227, 0.6041229, -1.588986, 0.8196079, 1, 0, 1,
-0.7632527, 0.9231582, -1.034774, 0.8117647, 1, 0, 1,
-0.7631755, -1.169967, -2.608861, 0.8078431, 1, 0, 1,
-0.7610202, 0.04281972, -1.096045, 0.8, 1, 0, 1,
-0.7527257, -1.354145, -1.478428, 0.7921569, 1, 0, 1,
-0.7411605, -0.01149207, -2.256624, 0.7882353, 1, 0, 1,
-0.7395291, -1.080653, -1.924027, 0.7803922, 1, 0, 1,
-0.7334774, -0.7464863, -1.339328, 0.7764706, 1, 0, 1,
-0.7258078, 0.6912214, -0.8063641, 0.7686275, 1, 0, 1,
-0.7231148, 0.1761176, -1.0262, 0.7647059, 1, 0, 1,
-0.7119784, -0.6183349, -2.214347, 0.7568628, 1, 0, 1,
-0.7093211, -0.3239693, -1.252787, 0.7529412, 1, 0, 1,
-0.7081262, -0.6050184, -1.772132, 0.7450981, 1, 0, 1,
-0.7074928, 0.5371033, 0.7296307, 0.7411765, 1, 0, 1,
-0.7073887, 0.3442414, -0.5637862, 0.7333333, 1, 0, 1,
-0.7062821, 0.4771283, -1.521685, 0.7294118, 1, 0, 1,
-0.7038525, 0.1123397, -1.66336, 0.7215686, 1, 0, 1,
-0.7035999, 0.5293626, -0.9583498, 0.7176471, 1, 0, 1,
-0.7034761, 1.883519, 0.06710147, 0.7098039, 1, 0, 1,
-0.6945884, 0.4384283, -1.361726, 0.7058824, 1, 0, 1,
-0.6922768, -0.8350188, -1.579248, 0.6980392, 1, 0, 1,
-0.6895369, -1.196769, -2.631906, 0.6901961, 1, 0, 1,
-0.6865177, -1.371785, -1.593677, 0.6862745, 1, 0, 1,
-0.6846545, -1.641842, -4.683613, 0.6784314, 1, 0, 1,
-0.6751332, -0.2809308, -3.025563, 0.6745098, 1, 0, 1,
-0.6693094, 1.303393, -0.3253009, 0.6666667, 1, 0, 1,
-0.668258, 0.7210324, -0.9745584, 0.6627451, 1, 0, 1,
-0.6668169, 0.6362808, -2.344282, 0.654902, 1, 0, 1,
-0.6638297, -1.509652, -4.552306, 0.6509804, 1, 0, 1,
-0.6615348, -1.639794, -2.099706, 0.6431373, 1, 0, 1,
-0.6604502, -1.038934, -2.031336, 0.6392157, 1, 0, 1,
-0.6578965, 0.8132697, -0.4668096, 0.6313726, 1, 0, 1,
-0.6548197, -0.9008288, -1.677998, 0.627451, 1, 0, 1,
-0.6496224, 1.400679, -0.7725051, 0.6196079, 1, 0, 1,
-0.6441107, 0.04845028, -2.422017, 0.6156863, 1, 0, 1,
-0.6417991, 1.504242, 0.1958415, 0.6078432, 1, 0, 1,
-0.6301675, 0.3514958, -0.66477, 0.6039216, 1, 0, 1,
-0.6286612, -0.3328005, -3.079016, 0.5960785, 1, 0, 1,
-0.6267273, -1.071312, -3.038081, 0.5882353, 1, 0, 1,
-0.6254433, 0.7729258, -2.260241, 0.5843138, 1, 0, 1,
-0.6244205, 0.4890229, -0.8300294, 0.5764706, 1, 0, 1,
-0.6199431, -1.998828, -2.310205, 0.572549, 1, 0, 1,
-0.608789, 0.8518854, -0.8233011, 0.5647059, 1, 0, 1,
-0.6078594, -1.231815, -3.965171, 0.5607843, 1, 0, 1,
-0.6072524, 0.6140492, -0.1413708, 0.5529412, 1, 0, 1,
-0.6054583, 0.3437359, -1.850476, 0.5490196, 1, 0, 1,
-0.6052197, -0.1698692, -1.38903, 0.5411765, 1, 0, 1,
-0.6027601, -2.711282, -3.349075, 0.5372549, 1, 0, 1,
-0.6013542, 0.6821326, -1.16856, 0.5294118, 1, 0, 1,
-0.5984653, 0.6356665, -0.78513, 0.5254902, 1, 0, 1,
-0.5968218, -0.3811993, -1.490415, 0.5176471, 1, 0, 1,
-0.5935903, -0.3910098, -3.2636, 0.5137255, 1, 0, 1,
-0.5847872, -1.008428, -4.246631, 0.5058824, 1, 0, 1,
-0.5844163, 2.923699, -0.4123228, 0.5019608, 1, 0, 1,
-0.5808015, -0.3136567, -3.14207, 0.4941176, 1, 0, 1,
-0.5766323, -0.4052766, -2.262087, 0.4862745, 1, 0, 1,
-0.5703749, 1.715005, -1.499102, 0.4823529, 1, 0, 1,
-0.5699161, 1.783275, 0.2038209, 0.4745098, 1, 0, 1,
-0.5665525, -1.283538, -3.877689, 0.4705882, 1, 0, 1,
-0.5649055, 0.0718021, -0.770829, 0.4627451, 1, 0, 1,
-0.5648487, -0.8805019, -1.884952, 0.4588235, 1, 0, 1,
-0.5641744, 0.5906512, -0.7447251, 0.4509804, 1, 0, 1,
-0.5638092, 0.01902916, -0.796046, 0.4470588, 1, 0, 1,
-0.5601102, -0.09822799, -3.489106, 0.4392157, 1, 0, 1,
-0.5584422, -0.3752797, -1.645643, 0.4352941, 1, 0, 1,
-0.5563148, -0.4110334, -2.015496, 0.427451, 1, 0, 1,
-0.5544967, 0.6421968, -1.415267, 0.4235294, 1, 0, 1,
-0.5495798, 2.285392, -0.330583, 0.4156863, 1, 0, 1,
-0.5485622, 0.6285077, -1.235704, 0.4117647, 1, 0, 1,
-0.5473688, 0.9316462, -0.1013768, 0.4039216, 1, 0, 1,
-0.5465824, -0.7891316, -3.190995, 0.3960784, 1, 0, 1,
-0.5446569, 1.398195, -0.2990197, 0.3921569, 1, 0, 1,
-0.5404928, -0.9911987, -3.518779, 0.3843137, 1, 0, 1,
-0.536466, -1.099139, -3.221287, 0.3803922, 1, 0, 1,
-0.5307411, 1.745172, 0.06723808, 0.372549, 1, 0, 1,
-0.5298757, 1.560968, -1.59033, 0.3686275, 1, 0, 1,
-0.5287802, -0.2270979, -4.138735, 0.3607843, 1, 0, 1,
-0.5280128, 0.9566523, -0.2175639, 0.3568628, 1, 0, 1,
-0.5243577, 1.240723, 0.3158869, 0.3490196, 1, 0, 1,
-0.5212894, 0.04746805, -0.4909621, 0.345098, 1, 0, 1,
-0.52026, -0.9203268, -2.745085, 0.3372549, 1, 0, 1,
-0.5172108, 1.06749, 0.7381568, 0.3333333, 1, 0, 1,
-0.5171435, -0.5979512, -3.330736, 0.3254902, 1, 0, 1,
-0.5164918, -0.5792393, -2.49529, 0.3215686, 1, 0, 1,
-0.5153144, 0.221035, -1.960242, 0.3137255, 1, 0, 1,
-0.5114062, -0.02376004, -0.01122129, 0.3098039, 1, 0, 1,
-0.5092827, 0.7590004, -2.627623, 0.3019608, 1, 0, 1,
-0.5090327, 1.461485, -1.573036, 0.2941177, 1, 0, 1,
-0.5084661, -0.182735, -3.197748, 0.2901961, 1, 0, 1,
-0.5066585, -0.1539358, -4.491234, 0.282353, 1, 0, 1,
-0.5055109, 0.8231453, -0.03306779, 0.2784314, 1, 0, 1,
-0.5026407, 0.3995097, -2.21217, 0.2705882, 1, 0, 1,
-0.5026336, -0.3538361, -2.261829, 0.2666667, 1, 0, 1,
-0.4987378, -0.07958232, -1.531631, 0.2588235, 1, 0, 1,
-0.4981068, 0.7211438, -1.107891, 0.254902, 1, 0, 1,
-0.497383, 0.6478546, 0.8190545, 0.2470588, 1, 0, 1,
-0.4960858, 1.694142, 0.486378, 0.2431373, 1, 0, 1,
-0.4911539, -2.340226, -3.581923, 0.2352941, 1, 0, 1,
-0.4875722, 1.05251, -0.1146622, 0.2313726, 1, 0, 1,
-0.4855706, 0.5375727, -0.1000758, 0.2235294, 1, 0, 1,
-0.4847611, -0.7490293, -3.745006, 0.2196078, 1, 0, 1,
-0.480761, 1.354641, -0.7532552, 0.2117647, 1, 0, 1,
-0.4797255, 1.132136, 1.055012, 0.2078431, 1, 0, 1,
-0.4768189, 2.367531, -0.9634207, 0.2, 1, 0, 1,
-0.4730627, -0.09301047, -2.598217, 0.1921569, 1, 0, 1,
-0.4722734, 0.7848678, -0.7985414, 0.1882353, 1, 0, 1,
-0.4699549, -0.2995321, -2.403615, 0.1803922, 1, 0, 1,
-0.4661165, -0.3085792, -3.041051, 0.1764706, 1, 0, 1,
-0.4642378, -0.8048589, -2.883199, 0.1686275, 1, 0, 1,
-0.4636047, -0.8676546, -3.854641, 0.1647059, 1, 0, 1,
-0.4623049, -0.3900556, 0.8226846, 0.1568628, 1, 0, 1,
-0.4556976, 1.927259, -0.8746834, 0.1529412, 1, 0, 1,
-0.4541677, 0.03182686, -0.7046516, 0.145098, 1, 0, 1,
-0.4528605, 0.2651083, -0.6545704, 0.1411765, 1, 0, 1,
-0.4513777, 0.8702289, -1.057228, 0.1333333, 1, 0, 1,
-0.4435392, -0.6543833, -2.776566, 0.1294118, 1, 0, 1,
-0.4427012, 0.6964274, -0.9508802, 0.1215686, 1, 0, 1,
-0.4422949, 0.9882641, -0.5806391, 0.1176471, 1, 0, 1,
-0.4408535, 0.2535979, -3.426317, 0.1098039, 1, 0, 1,
-0.4352814, -0.8308498, -2.568566, 0.1058824, 1, 0, 1,
-0.4342013, -0.3919513, -2.275291, 0.09803922, 1, 0, 1,
-0.4331052, 1.011578, 1.206674, 0.09019608, 1, 0, 1,
-0.4317613, -1.298005, -0.7697902, 0.08627451, 1, 0, 1,
-0.4291743, -0.3596734, -1.11309, 0.07843138, 1, 0, 1,
-0.4258534, -0.1577319, -3.179943, 0.07450981, 1, 0, 1,
-0.4232214, 2.494501, 0.6918107, 0.06666667, 1, 0, 1,
-0.422433, -1.001928, -4.0322, 0.0627451, 1, 0, 1,
-0.4202517, -0.4404288, -1.66721, 0.05490196, 1, 0, 1,
-0.4183905, 0.8677835, 0.7969076, 0.05098039, 1, 0, 1,
-0.4169036, 0.8717293, 0.4824336, 0.04313726, 1, 0, 1,
-0.415684, -0.9005148, -1.485907, 0.03921569, 1, 0, 1,
-0.4105957, 1.018329, -0.3138015, 0.03137255, 1, 0, 1,
-0.4084288, 0.8399416, -1.808616, 0.02745098, 1, 0, 1,
-0.4077196, 2.359438, 1.473314, 0.01960784, 1, 0, 1,
-0.4071426, 0.2402135, -1.378378, 0.01568628, 1, 0, 1,
-0.4024314, -1.804384, 0.5142734, 0.007843138, 1, 0, 1,
-0.4014367, -0.4249119, -2.208601, 0.003921569, 1, 0, 1,
-0.4007478, -1.303575, -2.743585, 0, 1, 0.003921569, 1,
-0.3919857, 0.4574677, -1.206239, 0, 1, 0.01176471, 1,
-0.3888115, -1.190404, -3.459978, 0, 1, 0.01568628, 1,
-0.3874022, -0.2374772, -0.9380836, 0, 1, 0.02352941, 1,
-0.3870195, 1.049313, -0.1242616, 0, 1, 0.02745098, 1,
-0.3802501, 0.7828608, 0.2978778, 0, 1, 0.03529412, 1,
-0.377739, -0.76667, -3.168986, 0, 1, 0.03921569, 1,
-0.3750404, 0.8797094, -0.757791, 0, 1, 0.04705882, 1,
-0.3738634, 0.2199332, -0.5853036, 0, 1, 0.05098039, 1,
-0.3724318, 1.062613, 1.398997, 0, 1, 0.05882353, 1,
-0.3701211, -0.3395621, -2.403123, 0, 1, 0.0627451, 1,
-0.369368, 0.132511, -2.056134, 0, 1, 0.07058824, 1,
-0.3669745, -0.3378022, -3.087478, 0, 1, 0.07450981, 1,
-0.3652483, 0.3775077, -0.1000502, 0, 1, 0.08235294, 1,
-0.3620272, 0.8922963, 1.935868, 0, 1, 0.08627451, 1,
-0.3617344, -1.570532, -4.108856, 0, 1, 0.09411765, 1,
-0.3615839, -0.94491, -1.39749, 0, 1, 0.1019608, 1,
-0.3610088, -0.5317643, -2.034075, 0, 1, 0.1058824, 1,
-0.3598489, -0.9653864, -1.799397, 0, 1, 0.1137255, 1,
-0.3591536, 0.2169598, -0.898596, 0, 1, 0.1176471, 1,
-0.3582161, -0.5734144, -2.157674, 0, 1, 0.1254902, 1,
-0.3562743, -1.087666, -4.626557, 0, 1, 0.1294118, 1,
-0.3545343, 0.2977214, -2.070625, 0, 1, 0.1372549, 1,
-0.3515718, -0.4127606, -1.890912, 0, 1, 0.1411765, 1,
-0.3509413, 0.5941015, -2.237147, 0, 1, 0.1490196, 1,
-0.3497993, 1.449358, -0.139119, 0, 1, 0.1529412, 1,
-0.3487112, 0.2720312, 1.536714, 0, 1, 0.1607843, 1,
-0.346089, 0.173241, -1.160649, 0, 1, 0.1647059, 1,
-0.3459404, 0.3506174, -2.570682, 0, 1, 0.172549, 1,
-0.3452953, -0.3859505, -1.562818, 0, 1, 0.1764706, 1,
-0.3412754, -1.922881, -3.23141, 0, 1, 0.1843137, 1,
-0.3411027, -0.6644473, -1.118955, 0, 1, 0.1882353, 1,
-0.3405737, 1.228563, -0.9539377, 0, 1, 0.1960784, 1,
-0.3368538, 0.1461269, -0.4703426, 0, 1, 0.2039216, 1,
-0.3365952, -0.1727889, -3.316021, 0, 1, 0.2078431, 1,
-0.3350786, -1.597894, -2.818414, 0, 1, 0.2156863, 1,
-0.3320147, 1.839736, -0.1152053, 0, 1, 0.2196078, 1,
-0.3306939, -2.138981, -2.565655, 0, 1, 0.227451, 1,
-0.3289235, -0.09448516, -3.018652, 0, 1, 0.2313726, 1,
-0.3285104, -0.1374635, -1.376538, 0, 1, 0.2392157, 1,
-0.3274424, -1.042195, -4.048433, 0, 1, 0.2431373, 1,
-0.3203091, 1.111012, 0.7814832, 0, 1, 0.2509804, 1,
-0.3135305, -0.05877719, -3.186331, 0, 1, 0.254902, 1,
-0.3121825, -1.709383, -1.963228, 0, 1, 0.2627451, 1,
-0.3113429, -0.06824487, -0.8518521, 0, 1, 0.2666667, 1,
-0.3073223, -0.3182225, -1.678449, 0, 1, 0.2745098, 1,
-0.3058107, 0.8245392, 0.2799999, 0, 1, 0.2784314, 1,
-0.304132, -0.04148417, -1.166355, 0, 1, 0.2862745, 1,
-0.303936, -1.880369, -3.686459, 0, 1, 0.2901961, 1,
-0.3037233, 0.9217018, -0.3068381, 0, 1, 0.2980392, 1,
-0.3017363, -1.075286, -3.151546, 0, 1, 0.3058824, 1,
-0.2960119, 1.65531, -1.78738, 0, 1, 0.3098039, 1,
-0.2926939, -1.33753, -3.813725, 0, 1, 0.3176471, 1,
-0.2912088, -1.932102, -3.291131, 0, 1, 0.3215686, 1,
-0.2903118, 0.9629009, -0.4868865, 0, 1, 0.3294118, 1,
-0.2851137, -1.049506, -3.84426, 0, 1, 0.3333333, 1,
-0.2817914, -0.03115211, -1.665119, 0, 1, 0.3411765, 1,
-0.2810779, -0.8643118, -0.9672939, 0, 1, 0.345098, 1,
-0.2782277, 1.004644, -0.5268378, 0, 1, 0.3529412, 1,
-0.2750287, -0.8431323, -1.973587, 0, 1, 0.3568628, 1,
-0.2744649, 0.8686323, -1.157602, 0, 1, 0.3647059, 1,
-0.2694988, -0.7525671, -3.682337, 0, 1, 0.3686275, 1,
-0.2679589, 0.4552864, -0.05954606, 0, 1, 0.3764706, 1,
-0.2653258, -0.9099354, -4.57611, 0, 1, 0.3803922, 1,
-0.2620054, 2.341509, 0.5282019, 0, 1, 0.3882353, 1,
-0.2570002, 0.1743518, -2.447418, 0, 1, 0.3921569, 1,
-0.2569378, 1.806613, 3.440205, 0, 1, 0.4, 1,
-0.2538546, -0.6687843, -3.138739, 0, 1, 0.4078431, 1,
-0.2519749, -0.09431562, -3.340185, 0, 1, 0.4117647, 1,
-0.2474268, 0.6365758, -1.781016, 0, 1, 0.4196078, 1,
-0.239672, 0.8092422, 0.2584595, 0, 1, 0.4235294, 1,
-0.2396565, -0.9195243, -3.622074, 0, 1, 0.4313726, 1,
-0.2396532, 0.2223876, 0.2403884, 0, 1, 0.4352941, 1,
-0.2392783, 0.4630117, -1.46394, 0, 1, 0.4431373, 1,
-0.2378715, 1.49787, -0.9496858, 0, 1, 0.4470588, 1,
-0.2353641, -0.1259554, -2.964533, 0, 1, 0.454902, 1,
-0.2342688, 0.7551323, 0.04666255, 0, 1, 0.4588235, 1,
-0.2340776, 0.9283069, 0.3341309, 0, 1, 0.4666667, 1,
-0.2305111, 1.512634, 0.8475627, 0, 1, 0.4705882, 1,
-0.2272763, -0.6464968, -1.65348, 0, 1, 0.4784314, 1,
-0.2257365, 0.07676873, -1.693364, 0, 1, 0.4823529, 1,
-0.2247001, 0.05145732, -3.013032, 0, 1, 0.4901961, 1,
-0.2240581, -0.1143619, -0.9469385, 0, 1, 0.4941176, 1,
-0.2173154, 0.7476857, 1.74224, 0, 1, 0.5019608, 1,
-0.2172624, 1.166617, 1.469049, 0, 1, 0.509804, 1,
-0.2140094, 0.434488, 0.7037945, 0, 1, 0.5137255, 1,
-0.213853, -1.210471, -2.739178, 0, 1, 0.5215687, 1,
-0.2120822, 0.07423852, -2.170533, 0, 1, 0.5254902, 1,
-0.2069377, 0.2775583, -1.629525, 0, 1, 0.5333334, 1,
-0.2035357, 0.2805718, -0.5676562, 0, 1, 0.5372549, 1,
-0.2005727, 0.7108794, -2.55212, 0, 1, 0.5450981, 1,
-0.1999907, -1.338507, -2.281794, 0, 1, 0.5490196, 1,
-0.198931, -1.427895, -5.113976, 0, 1, 0.5568628, 1,
-0.19748, -0.1375907, -3.661965, 0, 1, 0.5607843, 1,
-0.194894, -1.761853, -3.732714, 0, 1, 0.5686275, 1,
-0.1944738, 1.791252, 0.6927946, 0, 1, 0.572549, 1,
-0.1930882, 0.8433352, 1.069781, 0, 1, 0.5803922, 1,
-0.1884505, 2.65892, -0.3899122, 0, 1, 0.5843138, 1,
-0.1850693, 0.4620867, 0.1324399, 0, 1, 0.5921569, 1,
-0.1837056, 1.650737, 1.028725, 0, 1, 0.5960785, 1,
-0.1829782, 1.19412, -0.7294635, 0, 1, 0.6039216, 1,
-0.1753028, 1.647464, -0.8241495, 0, 1, 0.6117647, 1,
-0.1716031, -1.928602, -1.299152, 0, 1, 0.6156863, 1,
-0.1660127, -0.8135174, -2.655433, 0, 1, 0.6235294, 1,
-0.1544338, 0.8463433, 0.3094437, 0, 1, 0.627451, 1,
-0.1515437, -0.04099572, -1.200374, 0, 1, 0.6352941, 1,
-0.1502142, -0.3661991, -1.612916, 0, 1, 0.6392157, 1,
-0.1492414, -0.3040753, -2.634295, 0, 1, 0.6470588, 1,
-0.1452707, -1.858089, -3.837283, 0, 1, 0.6509804, 1,
-0.1430747, 1.404525, 0.245026, 0, 1, 0.6588235, 1,
-0.1413074, 0.5750087, 0.6342398, 0, 1, 0.6627451, 1,
-0.1397896, -0.3559237, -2.75199, 0, 1, 0.6705883, 1,
-0.1384553, -1.187004, -3.045243, 0, 1, 0.6745098, 1,
-0.137379, 0.690098, 0.5848694, 0, 1, 0.682353, 1,
-0.1299358, -1.28223, -2.047103, 0, 1, 0.6862745, 1,
-0.1286823, 1.218533, -0.4950249, 0, 1, 0.6941177, 1,
-0.1229919, 0.6325517, 1.482459, 0, 1, 0.7019608, 1,
-0.1209669, -0.206023, -2.230842, 0, 1, 0.7058824, 1,
-0.1187032, -1.521923, -4.114032, 0, 1, 0.7137255, 1,
-0.1174035, -0.2210486, -2.348425, 0, 1, 0.7176471, 1,
-0.1167392, 2.353467, 1.196582, 0, 1, 0.7254902, 1,
-0.1159639, 0.3886352, 1.933487, 0, 1, 0.7294118, 1,
-0.1137556, -0.1938643, -2.480671, 0, 1, 0.7372549, 1,
-0.1133878, 1.867836, 0.5877293, 0, 1, 0.7411765, 1,
-0.1110458, -0.07306287, -4.009902, 0, 1, 0.7490196, 1,
-0.1100847, 0.002076222, -2.367886, 0, 1, 0.7529412, 1,
-0.109209, 0.9899883, 0.5213891, 0, 1, 0.7607843, 1,
-0.1038908, 0.6681508, 0.1296573, 0, 1, 0.7647059, 1,
-0.1022456, -1.707513, -3.133185, 0, 1, 0.772549, 1,
-0.09862445, -0.8469903, -1.935824, 0, 1, 0.7764706, 1,
-0.08973511, 3.119743, 0.01039545, 0, 1, 0.7843137, 1,
-0.08734251, 0.2026539, 0.9460027, 0, 1, 0.7882353, 1,
-0.08454513, 0.5802451, -0.816453, 0, 1, 0.7960784, 1,
-0.08309112, 1.486807, -0.5056998, 0, 1, 0.8039216, 1,
-0.08127426, -0.7061116, -2.938408, 0, 1, 0.8078431, 1,
-0.07877618, -0.1929565, -1.929627, 0, 1, 0.8156863, 1,
-0.07303637, 0.8917723, -0.7860837, 0, 1, 0.8196079, 1,
-0.07186592, 1.238987, 1.6981, 0, 1, 0.827451, 1,
-0.06453801, 0.593434, -1.266864, 0, 1, 0.8313726, 1,
-0.06253841, 0.2147418, 0.1665962, 0, 1, 0.8392157, 1,
-0.06225517, -1.194852, -3.784792, 0, 1, 0.8431373, 1,
-0.060137, -2.008482, -1.54005, 0, 1, 0.8509804, 1,
-0.05734697, -1.633659, -2.58128, 0, 1, 0.854902, 1,
-0.05707088, -0.8009713, -2.993371, 0, 1, 0.8627451, 1,
-0.05379335, -1.379242, -3.516243, 0, 1, 0.8666667, 1,
-0.05164554, 0.7028013, 0.5313547, 0, 1, 0.8745098, 1,
-0.0450712, 0.2662272, -0.907656, 0, 1, 0.8784314, 1,
-0.04151388, 0.6435694, 1.608491, 0, 1, 0.8862745, 1,
-0.04128067, -0.0342748, -0.04318646, 0, 1, 0.8901961, 1,
-0.03856598, -0.0975748, -1.788534, 0, 1, 0.8980392, 1,
-0.03828289, -1.324677, -3.050938, 0, 1, 0.9058824, 1,
-0.02385941, -0.172322, -1.405782, 0, 1, 0.9098039, 1,
-0.0235677, -0.01190174, -1.11996, 0, 1, 0.9176471, 1,
-0.02175835, -0.4644475, -4.407872, 0, 1, 0.9215686, 1,
-0.01517198, 0.2258898, -0.5620785, 0, 1, 0.9294118, 1,
-0.01441781, 1.74507, -2.427294, 0, 1, 0.9333333, 1,
-0.01119377, 1.293683, 0.06572886, 0, 1, 0.9411765, 1,
-0.01105353, -0.6550301, -1.133308, 0, 1, 0.945098, 1,
-0.009044409, -1.725573, -2.958569, 0, 1, 0.9529412, 1,
-0.008749915, -2.247139, -4.421381, 0, 1, 0.9568627, 1,
-0.008071534, 0.2597205, -0.1446325, 0, 1, 0.9647059, 1,
-0.006304881, -0.6374934, -4.483479, 0, 1, 0.9686275, 1,
0.003226409, 0.07566866, 0.4025221, 0, 1, 0.9764706, 1,
0.006781258, 0.1392557, -1.50407, 0, 1, 0.9803922, 1,
0.008703603, -0.5386605, 2.936523, 0, 1, 0.9882353, 1,
0.01245024, -0.06768848, 3.068897, 0, 1, 0.9921569, 1,
0.01246909, 1.233117, 0.1801522, 0, 1, 1, 1,
0.0136305, 1.454649, -0.06180277, 0, 0.9921569, 1, 1,
0.01444105, -0.07075469, 2.06012, 0, 0.9882353, 1, 1,
0.01650354, -0.6508105, 1.843769, 0, 0.9803922, 1, 1,
0.01660967, 0.3339177, 2.192786, 0, 0.9764706, 1, 1,
0.0201288, 0.7080177, 0.2381485, 0, 0.9686275, 1, 1,
0.02677187, -1.546676, 2.73924, 0, 0.9647059, 1, 1,
0.03339523, 1.344762, 0.7417954, 0, 0.9568627, 1, 1,
0.03451132, 1.047573, 1.568462, 0, 0.9529412, 1, 1,
0.03549638, 0.8199024, -1.078741, 0, 0.945098, 1, 1,
0.04817999, 1.446175, -0.3663623, 0, 0.9411765, 1, 1,
0.04856121, 0.7837834, -1.023446, 0, 0.9333333, 1, 1,
0.05261219, -1.723046, 2.030797, 0, 0.9294118, 1, 1,
0.05519565, -0.03242666, 2.009705, 0, 0.9215686, 1, 1,
0.06045511, 0.7228314, -0.1137761, 0, 0.9176471, 1, 1,
0.06716055, 1.39424, 0.3135672, 0, 0.9098039, 1, 1,
0.06789425, -0.9407996, 4.067637, 0, 0.9058824, 1, 1,
0.07635032, 0.1818119, 0.8912423, 0, 0.8980392, 1, 1,
0.07891937, -0.07119782, 2.893689, 0, 0.8901961, 1, 1,
0.08274241, -0.2491707, 2.406134, 0, 0.8862745, 1, 1,
0.08355401, 1.282289, 0.233493, 0, 0.8784314, 1, 1,
0.08403888, 0.7700428, -0.09536002, 0, 0.8745098, 1, 1,
0.08425429, -1.140816, 3.171352, 0, 0.8666667, 1, 1,
0.08514263, -1.382539, 3.201558, 0, 0.8627451, 1, 1,
0.08717009, 1.104542, 0.2822729, 0, 0.854902, 1, 1,
0.08757268, 1.096778, 0.5408691, 0, 0.8509804, 1, 1,
0.09387675, 0.08505153, 0.7856704, 0, 0.8431373, 1, 1,
0.09627577, 1.345957, 1.04196, 0, 0.8392157, 1, 1,
0.1002292, -0.5448014, 2.549669, 0, 0.8313726, 1, 1,
0.1020525, 1.343597, 0.3499205, 0, 0.827451, 1, 1,
0.1054771, 0.2237677, 1.281532, 0, 0.8196079, 1, 1,
0.1105664, -0.06424043, 3.207709, 0, 0.8156863, 1, 1,
0.1110042, -1.167688, 3.052509, 0, 0.8078431, 1, 1,
0.1138284, 1.032204, 0.7015153, 0, 0.8039216, 1, 1,
0.1153858, 0.2798302, 2.384192, 0, 0.7960784, 1, 1,
0.1157075, 0.3295455, 2.92544, 0, 0.7882353, 1, 1,
0.1160296, -0.4940812, 2.874779, 0, 0.7843137, 1, 1,
0.1221947, 0.877333, 1.459366, 0, 0.7764706, 1, 1,
0.1244915, -0.5800995, 4.043819, 0, 0.772549, 1, 1,
0.1357986, -0.3949106, 3.700795, 0, 0.7647059, 1, 1,
0.1410023, -0.5281361, 1.192671, 0, 0.7607843, 1, 1,
0.1418278, -0.7556468, 2.559939, 0, 0.7529412, 1, 1,
0.1423559, 1.041012, -1.018439, 0, 0.7490196, 1, 1,
0.1472467, 0.1402334, -0.1021065, 0, 0.7411765, 1, 1,
0.1495167, -1.29574, 3.996602, 0, 0.7372549, 1, 1,
0.1497123, 0.3214411, 0.8119054, 0, 0.7294118, 1, 1,
0.1505982, -0.223965, 2.083438, 0, 0.7254902, 1, 1,
0.1525183, 0.7631836, -0.05714311, 0, 0.7176471, 1, 1,
0.1533611, -0.5625338, 0.6453229, 0, 0.7137255, 1, 1,
0.158597, 0.3993982, 0.1989196, 0, 0.7058824, 1, 1,
0.1602854, 0.06359766, 0.941475, 0, 0.6980392, 1, 1,
0.1621419, 1.896829, 0.6878667, 0, 0.6941177, 1, 1,
0.165434, -1.487339, 0.5437283, 0, 0.6862745, 1, 1,
0.1665249, 1.215728, 0.01741458, 0, 0.682353, 1, 1,
0.1667081, -0.3740815, 3.132045, 0, 0.6745098, 1, 1,
0.1704341, 0.3603462, -0.6641365, 0, 0.6705883, 1, 1,
0.1704521, -0.511622, 2.921134, 0, 0.6627451, 1, 1,
0.1804277, -1.239787, 2.914528, 0, 0.6588235, 1, 1,
0.1851885, -2.006658, 3.148859, 0, 0.6509804, 1, 1,
0.1860949, -0.5701951, 3.606929, 0, 0.6470588, 1, 1,
0.186624, 1.806876, 0.7633181, 0, 0.6392157, 1, 1,
0.1891716, 0.8610728, -1.499594, 0, 0.6352941, 1, 1,
0.1966983, -0.9087618, 3.378817, 0, 0.627451, 1, 1,
0.1988733, 1.306083, -0.3447638, 0, 0.6235294, 1, 1,
0.1993134, 1.478369, 0.3338283, 0, 0.6156863, 1, 1,
0.2027748, 0.4492671, 1.533738, 0, 0.6117647, 1, 1,
0.2029049, -0.4282814, 1.894615, 0, 0.6039216, 1, 1,
0.2099933, -1.395115, 3.206626, 0, 0.5960785, 1, 1,
0.212733, 0.9823809, 2.172252, 0, 0.5921569, 1, 1,
0.2145087, 0.4656736, 0.296322, 0, 0.5843138, 1, 1,
0.2164194, 0.7966764, -0.04050735, 0, 0.5803922, 1, 1,
0.2218852, -0.7241769, 2.402298, 0, 0.572549, 1, 1,
0.2231721, -1.292323, 2.392617, 0, 0.5686275, 1, 1,
0.2237693, 0.4464971, 1.877565, 0, 0.5607843, 1, 1,
0.2278863, -0.8497483, 2.096188, 0, 0.5568628, 1, 1,
0.2309846, 0.9507625, 1.806844, 0, 0.5490196, 1, 1,
0.2310144, -0.7938805, 3.78039, 0, 0.5450981, 1, 1,
0.2354504, -0.9217368, 4.462685, 0, 0.5372549, 1, 1,
0.2365995, 0.2871697, -1.232716, 0, 0.5333334, 1, 1,
0.2383944, -0.881105, 5.262822, 0, 0.5254902, 1, 1,
0.2427308, -0.2343317, 3.180995, 0, 0.5215687, 1, 1,
0.2441079, -0.6707276, 2.790812, 0, 0.5137255, 1, 1,
0.248537, -1.013655, 2.610279, 0, 0.509804, 1, 1,
0.2487669, -0.02475691, 1.284536, 0, 0.5019608, 1, 1,
0.2496937, -0.1480284, 2.669982, 0, 0.4941176, 1, 1,
0.2534409, -1.088917, 2.532379, 0, 0.4901961, 1, 1,
0.2539321, -0.5807039, 3.585143, 0, 0.4823529, 1, 1,
0.2546755, 0.06326178, 0.9071513, 0, 0.4784314, 1, 1,
0.2559179, 1.817546, -0.8521787, 0, 0.4705882, 1, 1,
0.2584654, -0.5981812, 2.946949, 0, 0.4666667, 1, 1,
0.2594995, 0.7736993, 2.155293, 0, 0.4588235, 1, 1,
0.2599254, 1.640361, 0.2861808, 0, 0.454902, 1, 1,
0.265191, 1.079193, 1.266114, 0, 0.4470588, 1, 1,
0.2665634, 0.6934875, 0.3466227, 0, 0.4431373, 1, 1,
0.270126, 0.1526983, 1.752541, 0, 0.4352941, 1, 1,
0.2758439, -0.3839036, 1.733569, 0, 0.4313726, 1, 1,
0.2762283, 0.7034137, 0.732953, 0, 0.4235294, 1, 1,
0.2785676, -0.2311378, 1.439495, 0, 0.4196078, 1, 1,
0.2790886, 1.256187, 0.2756199, 0, 0.4117647, 1, 1,
0.279342, -0.01352767, 2.336084, 0, 0.4078431, 1, 1,
0.2832666, -0.8025656, 3.770694, 0, 0.4, 1, 1,
0.2844888, 2.808815, 1.62197, 0, 0.3921569, 1, 1,
0.2853227, -0.2501731, 2.78009, 0, 0.3882353, 1, 1,
0.2889172, 0.4681307, 2.102035, 0, 0.3803922, 1, 1,
0.2900359, -0.6597359, 3.096295, 0, 0.3764706, 1, 1,
0.2914832, 1.190356, -0.1596437, 0, 0.3686275, 1, 1,
0.299275, 0.06444602, -0.519746, 0, 0.3647059, 1, 1,
0.3022807, 0.3298934, 0.8132865, 0, 0.3568628, 1, 1,
0.3027557, -0.06145008, 1.167381, 0, 0.3529412, 1, 1,
0.3052188, -0.1234717, 0.7573824, 0, 0.345098, 1, 1,
0.3063751, -1.919711, 3.96192, 0, 0.3411765, 1, 1,
0.3069628, 1.017357, 0.5407754, 0, 0.3333333, 1, 1,
0.309479, 0.3237102, 1.145754, 0, 0.3294118, 1, 1,
0.310003, -0.7117509, 3.678832, 0, 0.3215686, 1, 1,
0.3126121, 0.2807913, -1.717048, 0, 0.3176471, 1, 1,
0.3153874, 1.427534, 1.461007, 0, 0.3098039, 1, 1,
0.3160545, -0.3468119, 2.649332, 0, 0.3058824, 1, 1,
0.3161238, -0.3645979, 2.538718, 0, 0.2980392, 1, 1,
0.3161435, -1.121915, 1.856019, 0, 0.2901961, 1, 1,
0.3201326, 0.6463249, 0.8369005, 0, 0.2862745, 1, 1,
0.3289982, -0.4492449, 3.117561, 0, 0.2784314, 1, 1,
0.3292517, -0.9979473, 4.657544, 0, 0.2745098, 1, 1,
0.340373, 0.9518861, 0.2057652, 0, 0.2666667, 1, 1,
0.3410567, -0.9485388, 2.515394, 0, 0.2627451, 1, 1,
0.3411057, 0.01204949, 2.326398, 0, 0.254902, 1, 1,
0.3427321, -0.6609399, 2.240858, 0, 0.2509804, 1, 1,
0.3434269, -2.022553, 3.110819, 0, 0.2431373, 1, 1,
0.3440505, 0.8287172, 0.4444653, 0, 0.2392157, 1, 1,
0.3454702, -2.236955, 3.122051, 0, 0.2313726, 1, 1,
0.3469929, -0.2960986, 1.745291, 0, 0.227451, 1, 1,
0.3484163, -0.4466265, 2.041328, 0, 0.2196078, 1, 1,
0.3622696, -0.3916916, 3.19562, 0, 0.2156863, 1, 1,
0.3627557, 0.06933339, 0.7507944, 0, 0.2078431, 1, 1,
0.3641974, -0.8014598, 3.563211, 0, 0.2039216, 1, 1,
0.3696506, 0.5801913, 0.7695029, 0, 0.1960784, 1, 1,
0.3722081, 0.04575058, 0.9528528, 0, 0.1882353, 1, 1,
0.3749945, -0.9620966, 1.60145, 0, 0.1843137, 1, 1,
0.3789519, -0.2076564, 1.045128, 0, 0.1764706, 1, 1,
0.3803293, 0.6575917, -0.52278, 0, 0.172549, 1, 1,
0.3824389, -0.3622971, 2.622505, 0, 0.1647059, 1, 1,
0.387298, 0.9649528, 0.2466297, 0, 0.1607843, 1, 1,
0.3886189, -0.8649857, 2.825494, 0, 0.1529412, 1, 1,
0.3916225, -0.05015235, 1.023088, 0, 0.1490196, 1, 1,
0.3950318, -1.606165, 3.872753, 0, 0.1411765, 1, 1,
0.3996261, 0.7558469, 0.1061833, 0, 0.1372549, 1, 1,
0.4035301, 0.7382556, -0.876802, 0, 0.1294118, 1, 1,
0.4039779, -0.05655037, 1.863537, 0, 0.1254902, 1, 1,
0.4054968, 1.402653, 1.081656, 0, 0.1176471, 1, 1,
0.4065767, -1.277281, 3.268516, 0, 0.1137255, 1, 1,
0.4079755, 0.8321217, 0.9381074, 0, 0.1058824, 1, 1,
0.4081553, 0.2888682, 1.134112, 0, 0.09803922, 1, 1,
0.4114712, -0.4737769, 2.937204, 0, 0.09411765, 1, 1,
0.4131413, 0.4762076, -1.303879, 0, 0.08627451, 1, 1,
0.4177552, -1.082778, 4.111557, 0, 0.08235294, 1, 1,
0.4185696, 1.874829, 0.6210208, 0, 0.07450981, 1, 1,
0.4219805, 0.1934674, -0.3807679, 0, 0.07058824, 1, 1,
0.4272673, 0.4488866, -0.4197113, 0, 0.0627451, 1, 1,
0.4311552, -0.2392416, 2.00618, 0, 0.05882353, 1, 1,
0.431908, 0.02947151, 0.9186745, 0, 0.05098039, 1, 1,
0.4353522, -0.6851937, 2.357346, 0, 0.04705882, 1, 1,
0.439265, -0.06522307, -0.06347524, 0, 0.03921569, 1, 1,
0.4409134, 1.737992, 1.149017, 0, 0.03529412, 1, 1,
0.4414753, 0.7595877, 0.1089055, 0, 0.02745098, 1, 1,
0.4425716, 0.5100463, 0.2865429, 0, 0.02352941, 1, 1,
0.4461885, -2.710421, 4.350056, 0, 0.01568628, 1, 1,
0.4465415, -0.4840788, 2.466697, 0, 0.01176471, 1, 1,
0.4492425, 0.7761703, 1.640568, 0, 0.003921569, 1, 1,
0.4522284, -0.3501253, 2.399848, 0.003921569, 0, 1, 1,
0.4543294, -0.9904963, 3.084489, 0.007843138, 0, 1, 1,
0.4560455, 0.03761922, -0.7445714, 0.01568628, 0, 1, 1,
0.4571097, 0.8943685, 0.1173168, 0.01960784, 0, 1, 1,
0.4571135, 0.9091086, 0.002583388, 0.02745098, 0, 1, 1,
0.469445, 0.5239328, 1.483044, 0.03137255, 0, 1, 1,
0.4731629, 0.9591744, -0.5349081, 0.03921569, 0, 1, 1,
0.4773016, 1.602753, -0.4056579, 0.04313726, 0, 1, 1,
0.4789484, 0.9940962, 0.7919218, 0.05098039, 0, 1, 1,
0.4834222, 0.4531879, 0.5507699, 0.05490196, 0, 1, 1,
0.4907422, 0.668282, 1.140501, 0.0627451, 0, 1, 1,
0.4919625, 0.6487327, 2.172054, 0.06666667, 0, 1, 1,
0.4928403, -0.5029622, 1.415548, 0.07450981, 0, 1, 1,
0.494718, -1.015421, 4.687884, 0.07843138, 0, 1, 1,
0.496221, 0.1176235, 2.204355, 0.08627451, 0, 1, 1,
0.5045676, 0.1385538, 0.4494346, 0.09019608, 0, 1, 1,
0.5084102, -0.558437, 0.6649113, 0.09803922, 0, 1, 1,
0.5154872, 0.7198695, 0.04122971, 0.1058824, 0, 1, 1,
0.5245801, 0.6010983, 0.3691962, 0.1098039, 0, 1, 1,
0.5258027, -0.6008716, 3.823124, 0.1176471, 0, 1, 1,
0.5283362, -1.894672, 3.221247, 0.1215686, 0, 1, 1,
0.5355801, -0.8544629, 5.078918, 0.1294118, 0, 1, 1,
0.5370472, -0.484606, 0.4707134, 0.1333333, 0, 1, 1,
0.5421689, -0.003325169, 2.237573, 0.1411765, 0, 1, 1,
0.5436649, -1.193849, 2.958621, 0.145098, 0, 1, 1,
0.5441236, -0.873158, 1.620756, 0.1529412, 0, 1, 1,
0.5469698, 0.5012974, 1.70123, 0.1568628, 0, 1, 1,
0.5509852, 0.2039222, 1.757602, 0.1647059, 0, 1, 1,
0.5563549, 1.087722, 2.645296, 0.1686275, 0, 1, 1,
0.5574815, 1.008048, 2.251778, 0.1764706, 0, 1, 1,
0.5601225, -1.250032, 2.934148, 0.1803922, 0, 1, 1,
0.5640713, -0.2929387, 3.34529, 0.1882353, 0, 1, 1,
0.5642477, -0.1253155, 0.5818558, 0.1921569, 0, 1, 1,
0.5658007, 0.06977066, 2.712746, 0.2, 0, 1, 1,
0.5698905, -2.237137, 1.786694, 0.2078431, 0, 1, 1,
0.5728911, -0.6593768, 2.435265, 0.2117647, 0, 1, 1,
0.5764909, 0.2791264, 0.9967395, 0.2196078, 0, 1, 1,
0.5767536, -0.582191, 3.415887, 0.2235294, 0, 1, 1,
0.5812347, -0.00217212, 0.7286456, 0.2313726, 0, 1, 1,
0.5837418, 0.6234071, 1.104621, 0.2352941, 0, 1, 1,
0.5895281, 1.145217, -0.5772449, 0.2431373, 0, 1, 1,
0.5914524, 1.038761, 0.5229427, 0.2470588, 0, 1, 1,
0.5942175, -0.01971365, 1.130872, 0.254902, 0, 1, 1,
0.5975615, -1.135914, 2.896585, 0.2588235, 0, 1, 1,
0.5995973, -1.144763, 2.309016, 0.2666667, 0, 1, 1,
0.6014182, -0.839839, 2.617571, 0.2705882, 0, 1, 1,
0.6031509, 0.8043946, 0.08724865, 0.2784314, 0, 1, 1,
0.6056866, 1.163384, -0.7044023, 0.282353, 0, 1, 1,
0.6084933, 0.6532089, 0.9554319, 0.2901961, 0, 1, 1,
0.6087045, -2.171193, 3.680194, 0.2941177, 0, 1, 1,
0.6121177, 0.7234643, 0.6983126, 0.3019608, 0, 1, 1,
0.6126443, -2.664848, 3.255462, 0.3098039, 0, 1, 1,
0.6194015, -0.2012128, 0.9591538, 0.3137255, 0, 1, 1,
0.6220719, 1.243581, 0.4863929, 0.3215686, 0, 1, 1,
0.6260737, -1.238707, 1.185201, 0.3254902, 0, 1, 1,
0.627964, 0.1281777, -1.259932, 0.3333333, 0, 1, 1,
0.6344637, -0.5342536, 1.991944, 0.3372549, 0, 1, 1,
0.6344786, -0.9010484, 2.177786, 0.345098, 0, 1, 1,
0.6426875, 0.3181936, -0.1829756, 0.3490196, 0, 1, 1,
0.6428319, -0.8289635, 2.600694, 0.3568628, 0, 1, 1,
0.6449665, -0.08799851, 2.626236, 0.3607843, 0, 1, 1,
0.6454119, -1.830877, 1.957434, 0.3686275, 0, 1, 1,
0.6473441, 0.1017662, 1.548166, 0.372549, 0, 1, 1,
0.6497466, -0.5342802, 2.711096, 0.3803922, 0, 1, 1,
0.6533425, 1.294676, -0.658461, 0.3843137, 0, 1, 1,
0.6558632, -0.0447879, 1.617911, 0.3921569, 0, 1, 1,
0.6578196, 0.5105665, 1.89948, 0.3960784, 0, 1, 1,
0.6635534, 1.517807, 1.70784, 0.4039216, 0, 1, 1,
0.6645793, -1.184773, 2.521436, 0.4117647, 0, 1, 1,
0.6651921, -1.779458, 0.6101766, 0.4156863, 0, 1, 1,
0.6652897, -1.884362, 1.17529, 0.4235294, 0, 1, 1,
0.6676982, -0.7023073, 2.948447, 0.427451, 0, 1, 1,
0.6684405, 1.501217, -0.4097074, 0.4352941, 0, 1, 1,
0.6693387, -1.626271, 3.484338, 0.4392157, 0, 1, 1,
0.6707996, -0.6689485, 2.94956, 0.4470588, 0, 1, 1,
0.6728591, -0.2961426, 1.013434, 0.4509804, 0, 1, 1,
0.6758308, -0.913374, 2.450894, 0.4588235, 0, 1, 1,
0.6767687, -1.324979, 2.083074, 0.4627451, 0, 1, 1,
0.6768363, -1.657871, 4.359701, 0.4705882, 0, 1, 1,
0.6786822, -1.31377, 1.892206, 0.4745098, 0, 1, 1,
0.6807919, 1.192871, 0.1772099, 0.4823529, 0, 1, 1,
0.6818582, 0.6960984, 1.658799, 0.4862745, 0, 1, 1,
0.682931, -0.6529229, 3.047046, 0.4941176, 0, 1, 1,
0.6857325, 0.8965903, 1.839934, 0.5019608, 0, 1, 1,
0.691604, -0.5498956, 2.716803, 0.5058824, 0, 1, 1,
0.6933843, -1.048096, 3.883808, 0.5137255, 0, 1, 1,
0.7000394, 0.06451321, -1.650822, 0.5176471, 0, 1, 1,
0.7029213, -0.6850296, 1.318381, 0.5254902, 0, 1, 1,
0.7044428, -0.6926705, 2.409307, 0.5294118, 0, 1, 1,
0.7073637, -0.2806447, 2.515095, 0.5372549, 0, 1, 1,
0.7084444, 1.444427, 0.8431557, 0.5411765, 0, 1, 1,
0.711821, 0.9992993, 0.5960133, 0.5490196, 0, 1, 1,
0.7131113, -1.038419, 1.275903, 0.5529412, 0, 1, 1,
0.7134662, 0.6951501, 1.924168, 0.5607843, 0, 1, 1,
0.7178029, 0.5367037, 2.423476, 0.5647059, 0, 1, 1,
0.7184178, -0.147409, 1.513123, 0.572549, 0, 1, 1,
0.723173, 1.407334, 1.300885, 0.5764706, 0, 1, 1,
0.7319877, 2.298582, -0.1616686, 0.5843138, 0, 1, 1,
0.7339509, -0.9115342, 3.073872, 0.5882353, 0, 1, 1,
0.7341731, -0.7117913, 2.780878, 0.5960785, 0, 1, 1,
0.7348617, 1.337628, -0.4139681, 0.6039216, 0, 1, 1,
0.7365575, 0.6831474, -0.6458024, 0.6078432, 0, 1, 1,
0.7365968, 1.773139, -1.175901, 0.6156863, 0, 1, 1,
0.7451242, -0.5182493, 2.711705, 0.6196079, 0, 1, 1,
0.7459074, 1.590165, 0.5237149, 0.627451, 0, 1, 1,
0.7460721, 1.463566, 0.7596595, 0.6313726, 0, 1, 1,
0.7479224, -0.2135449, 2.743542, 0.6392157, 0, 1, 1,
0.750936, 0.667753, 3.393559, 0.6431373, 0, 1, 1,
0.752386, 0.1301142, 0.4595473, 0.6509804, 0, 1, 1,
0.7533532, 1.840565, 0.1668169, 0.654902, 0, 1, 1,
0.75449, 1.434231, 0.9910733, 0.6627451, 0, 1, 1,
0.7546132, -2.320578, 1.687123, 0.6666667, 0, 1, 1,
0.7596725, 0.4531519, -0.9843424, 0.6745098, 0, 1, 1,
0.7683981, -0.4320998, 1.71879, 0.6784314, 0, 1, 1,
0.7787631, 0.04332137, 2.278113, 0.6862745, 0, 1, 1,
0.7814653, -0.1154316, 2.091353, 0.6901961, 0, 1, 1,
0.7839735, -0.9626524, 2.134764, 0.6980392, 0, 1, 1,
0.7857881, 0.6100046, 0.6233766, 0.7058824, 0, 1, 1,
0.7869837, 0.640332, 1.540775, 0.7098039, 0, 1, 1,
0.7874904, -1.294201, 2.879786, 0.7176471, 0, 1, 1,
0.7888727, 0.1118097, 0.2156333, 0.7215686, 0, 1, 1,
0.7890672, 0.7100641, -0.2942774, 0.7294118, 0, 1, 1,
0.7904164, 1.540828, 1.544943, 0.7333333, 0, 1, 1,
0.7936772, 1.01408, 0.2853649, 0.7411765, 0, 1, 1,
0.7940123, -0.2019511, 1.703132, 0.7450981, 0, 1, 1,
0.7951655, 1.151232, 0.7249269, 0.7529412, 0, 1, 1,
0.7955571, -0.7992876, 1.3598, 0.7568628, 0, 1, 1,
0.7975657, 0.7951322, 0.4364039, 0.7647059, 0, 1, 1,
0.8017802, -0.0435943, 1.739106, 0.7686275, 0, 1, 1,
0.8084515, 0.6263288, -1.361783, 0.7764706, 0, 1, 1,
0.8101345, -1.596349, 5.597425, 0.7803922, 0, 1, 1,
0.8174381, -0.9072174, 2.477592, 0.7882353, 0, 1, 1,
0.8221581, -0.6194121, 0.7061197, 0.7921569, 0, 1, 1,
0.8342732, -1.020504, 2.591624, 0.8, 0, 1, 1,
0.8357357, 0.736261, -0.106462, 0.8078431, 0, 1, 1,
0.8384048, -1.347152, 2.923502, 0.8117647, 0, 1, 1,
0.8490065, -0.409279, 0.7374737, 0.8196079, 0, 1, 1,
0.8502579, -0.877721, 3.872939, 0.8235294, 0, 1, 1,
0.8517501, 0.07939627, 3.082053, 0.8313726, 0, 1, 1,
0.8522719, 1.51962, 1.18991, 0.8352941, 0, 1, 1,
0.8541788, 0.09346444, 2.627249, 0.8431373, 0, 1, 1,
0.8648798, 0.2558661, 1.384788, 0.8470588, 0, 1, 1,
0.8660457, 1.070203, -2.308525, 0.854902, 0, 1, 1,
0.8669693, 1.235825, 0.5237922, 0.8588235, 0, 1, 1,
0.869261, 0.3467773, 1.975883, 0.8666667, 0, 1, 1,
0.8742948, 0.7004716, 2.933194, 0.8705882, 0, 1, 1,
0.8932473, 1.52653, 0.0213337, 0.8784314, 0, 1, 1,
0.8952425, -1.016806, 1.990427, 0.8823529, 0, 1, 1,
0.8989952, -0.5314664, 2.930951, 0.8901961, 0, 1, 1,
0.9038665, 0.1106547, 1.156114, 0.8941177, 0, 1, 1,
0.9057031, -0.03791074, 3.907095, 0.9019608, 0, 1, 1,
0.9064968, 0.9780196, 0.6143626, 0.9098039, 0, 1, 1,
0.9071925, 0.01521479, 1.754754, 0.9137255, 0, 1, 1,
0.9114634, 0.4347459, 2.224415, 0.9215686, 0, 1, 1,
0.9227822, -0.7528337, 1.84908, 0.9254902, 0, 1, 1,
0.9279596, 0.2683589, 0.7313225, 0.9333333, 0, 1, 1,
0.9308442, 0.1680427, 1.720165, 0.9372549, 0, 1, 1,
0.94103, 0.610917, -0.07714949, 0.945098, 0, 1, 1,
0.9472013, 0.143437, 2.096212, 0.9490196, 0, 1, 1,
0.9484012, 0.09954919, 1.518407, 0.9568627, 0, 1, 1,
0.9486095, 0.2412419, 0.768316, 0.9607843, 0, 1, 1,
0.948965, 0.1091017, 0.8002837, 0.9686275, 0, 1, 1,
0.9491681, 0.5006034, -0.7200328, 0.972549, 0, 1, 1,
0.9512693, 0.3041398, 0.9211017, 0.9803922, 0, 1, 1,
0.953382, 0.06856602, 2.299011, 0.9843137, 0, 1, 1,
0.9573071, -0.682812, 3.445534, 0.9921569, 0, 1, 1,
0.9578099, 2.062875, 1.00112, 0.9960784, 0, 1, 1,
0.9619249, -0.350334, 1.494827, 1, 0, 0.9960784, 1,
0.9751012, 1.102518, 1.258086, 1, 0, 0.9882353, 1,
0.9754764, 0.1026674, 2.891511, 1, 0, 0.9843137, 1,
0.9861333, 1.265992, 1.489209, 1, 0, 0.9764706, 1,
0.9886988, -0.332541, 1.045941, 1, 0, 0.972549, 1,
0.9935296, 2.416021, -0.1592168, 1, 0, 0.9647059, 1,
0.9951149, -0.5307898, 1.649093, 1, 0, 0.9607843, 1,
0.9956892, 2.624538, 1.741133, 1, 0, 0.9529412, 1,
0.998091, 0.1171886, 2.725164, 1, 0, 0.9490196, 1,
1.004815, -0.3379418, 2.126759, 1, 0, 0.9411765, 1,
1.007212, 0.9969717, 1.510081, 1, 0, 0.9372549, 1,
1.010598, -0.5514578, 3.126582, 1, 0, 0.9294118, 1,
1.021881, 0.3296768, 0.9360029, 1, 0, 0.9254902, 1,
1.033421, 0.1125487, 1.469028, 1, 0, 0.9176471, 1,
1.037151, -1.331876, 2.040227, 1, 0, 0.9137255, 1,
1.042621, 0.00577915, 1.920452, 1, 0, 0.9058824, 1,
1.046363, -0.3615286, 0.5371585, 1, 0, 0.9019608, 1,
1.046934, 0.3756307, 1.099236, 1, 0, 0.8941177, 1,
1.048837, -0.5734242, 2.82449, 1, 0, 0.8862745, 1,
1.060843, -0.2179308, -0.101955, 1, 0, 0.8823529, 1,
1.062579, -0.02822336, 3.083902, 1, 0, 0.8745098, 1,
1.068723, 0.6439579, -0.7317239, 1, 0, 0.8705882, 1,
1.071575, -0.6793125, 1.507192, 1, 0, 0.8627451, 1,
1.073974, -0.8239564, 2.458122, 1, 0, 0.8588235, 1,
1.078036, -0.8255561, 1.361499, 1, 0, 0.8509804, 1,
1.07845, -0.9485953, 1.89294, 1, 0, 0.8470588, 1,
1.093292, 1.36147, 0.779762, 1, 0, 0.8392157, 1,
1.098629, 1.162907, 2.836197, 1, 0, 0.8352941, 1,
1.102148, 0.3382784, 2.263337, 1, 0, 0.827451, 1,
1.110161, 1.076074, 1.177856, 1, 0, 0.8235294, 1,
1.121587, 0.01667447, 1.058343, 1, 0, 0.8156863, 1,
1.122968, 0.3453997, 1.203812, 1, 0, 0.8117647, 1,
1.143311, 0.7960309, 2.786904, 1, 0, 0.8039216, 1,
1.162027, 0.5003372, -0.6066657, 1, 0, 0.7960784, 1,
1.167735, -1.942221, 4.006776, 1, 0, 0.7921569, 1,
1.16836, -1.55575, 0.5802294, 1, 0, 0.7843137, 1,
1.174257, 1.637674, 0.1911383, 1, 0, 0.7803922, 1,
1.176022, 1.542249, 1.092686, 1, 0, 0.772549, 1,
1.17704, -1.03627, 3.375382, 1, 0, 0.7686275, 1,
1.179431, -2.087037, 2.374902, 1, 0, 0.7607843, 1,
1.188566, 1.371076, 1.589893, 1, 0, 0.7568628, 1,
1.189437, 1.367541, -1.442983, 1, 0, 0.7490196, 1,
1.191609, -0.1367559, 2.143891, 1, 0, 0.7450981, 1,
1.192818, -0.4457189, 1.701026, 1, 0, 0.7372549, 1,
1.197675, -0.1180882, 2.519558, 1, 0, 0.7333333, 1,
1.210327, -0.677953, 3.055972, 1, 0, 0.7254902, 1,
1.212675, -1.329138, 2.778158, 1, 0, 0.7215686, 1,
1.215328, 0.1490241, 1.580756, 1, 0, 0.7137255, 1,
1.218535, -2.279813, 2.10696, 1, 0, 0.7098039, 1,
1.220914, -0.1216357, 1.187391, 1, 0, 0.7019608, 1,
1.223871, 0.006651505, 1.990785, 1, 0, 0.6941177, 1,
1.231721, -0.4987687, 0.6921687, 1, 0, 0.6901961, 1,
1.236208, -0.5988314, 2.435596, 1, 0, 0.682353, 1,
1.246989, 0.4170885, 2.22779, 1, 0, 0.6784314, 1,
1.268898, -1.968886, 2.422112, 1, 0, 0.6705883, 1,
1.270573, -0.9035852, 1.523108, 1, 0, 0.6666667, 1,
1.271849, -1.19149, 1.980527, 1, 0, 0.6588235, 1,
1.274336, -0.7571086, 3.4392, 1, 0, 0.654902, 1,
1.279305, -1.107176, 2.341456, 1, 0, 0.6470588, 1,
1.280308, -1.672514, 2.23578, 1, 0, 0.6431373, 1,
1.285505, 1.675773, -0.1426827, 1, 0, 0.6352941, 1,
1.296839, -0.8681212, 1.68244, 1, 0, 0.6313726, 1,
1.307588, 0.1702387, 2.307861, 1, 0, 0.6235294, 1,
1.320817, 0.06798715, 2.525391, 1, 0, 0.6196079, 1,
1.32959, 0.9704017, 0.3503489, 1, 0, 0.6117647, 1,
1.333647, -0.06300423, -0.1694753, 1, 0, 0.6078432, 1,
1.342595, 0.5790758, 1.535677, 1, 0, 0.6, 1,
1.347547, 0.7700176, 0.008318551, 1, 0, 0.5921569, 1,
1.349866, 2.855016, 0.2395044, 1, 0, 0.5882353, 1,
1.35131, 1.347021, 0.8138723, 1, 0, 0.5803922, 1,
1.352554, 1.634878, 1.148906, 1, 0, 0.5764706, 1,
1.357268, -1.347671, 3.050835, 1, 0, 0.5686275, 1,
1.374976, -0.1151041, 0.04815023, 1, 0, 0.5647059, 1,
1.380259, 0.04015625, 1.140123, 1, 0, 0.5568628, 1,
1.386976, -0.6769921, 3.863953, 1, 0, 0.5529412, 1,
1.389943, -0.2438348, 1.270594, 1, 0, 0.5450981, 1,
1.398198, 1.279965, -0.5031798, 1, 0, 0.5411765, 1,
1.409058, 0.2488951, 3.104873, 1, 0, 0.5333334, 1,
1.410588, 0.6117433, 0.2611666, 1, 0, 0.5294118, 1,
1.41235, 1.565634, 0.5127209, 1, 0, 0.5215687, 1,
1.419981, -1.049526, 1.333449, 1, 0, 0.5176471, 1,
1.42091, 0.722894, 0.5036592, 1, 0, 0.509804, 1,
1.422407, 0.8140432, 0.1476904, 1, 0, 0.5058824, 1,
1.42697, 1.324842, 1.799226, 1, 0, 0.4980392, 1,
1.4322, -1.685384, -0.08674312, 1, 0, 0.4901961, 1,
1.439344, 0.3144425, 2.12726, 1, 0, 0.4862745, 1,
1.443551, -1.779099, 1.194626, 1, 0, 0.4784314, 1,
1.444113, -0.1767246, 1.376439, 1, 0, 0.4745098, 1,
1.449955, -0.4178053, 0.2485537, 1, 0, 0.4666667, 1,
1.451168, -2.054445, 1.389789, 1, 0, 0.4627451, 1,
1.454172, -1.172741, 3.306051, 1, 0, 0.454902, 1,
1.457229, -0.5086747, 1.459893, 1, 0, 0.4509804, 1,
1.457953, 1.580976, -0.02941459, 1, 0, 0.4431373, 1,
1.470784, -0.9394217, 4.737734, 1, 0, 0.4392157, 1,
1.471316, -0.950935, 1.220887, 1, 0, 0.4313726, 1,
1.48121, -0.368432, 1.68827, 1, 0, 0.427451, 1,
1.486535, -0.5023394, 3.822933, 1, 0, 0.4196078, 1,
1.501112, 0.682725, 0.4894173, 1, 0, 0.4156863, 1,
1.516757, 0.3455124, 2.319471, 1, 0, 0.4078431, 1,
1.527227, 2.053648, -1.241277, 1, 0, 0.4039216, 1,
1.527318, 0.1236668, 0.7577459, 1, 0, 0.3960784, 1,
1.531279, 1.051427, 0.9772034, 1, 0, 0.3882353, 1,
1.547403, -0.9510986, 1.416336, 1, 0, 0.3843137, 1,
1.547445, 1.123861, 0.1609325, 1, 0, 0.3764706, 1,
1.549855, 0.8863254, -0.6022772, 1, 0, 0.372549, 1,
1.558198, -0.7298427, 1.389902, 1, 0, 0.3647059, 1,
1.578187, -0.2761533, 1.72261, 1, 0, 0.3607843, 1,
1.578245, 0.7380513, 2.954046, 1, 0, 0.3529412, 1,
1.579445, -1.435591, 4.00597, 1, 0, 0.3490196, 1,
1.592517, -0.2440985, 3.009562, 1, 0, 0.3411765, 1,
1.602316, 0.2515314, 2.095853, 1, 0, 0.3372549, 1,
1.615566, 0.5169854, 0.006383592, 1, 0, 0.3294118, 1,
1.618837, 0.1341256, 0.653358, 1, 0, 0.3254902, 1,
1.623325, 0.9707419, 1.064955, 1, 0, 0.3176471, 1,
1.63206, -1.004519, 1.942635, 1, 0, 0.3137255, 1,
1.645805, 0.2449247, 2.361561, 1, 0, 0.3058824, 1,
1.652426, -0.2963159, 2.222025, 1, 0, 0.2980392, 1,
1.652426, 0.7759126, 0.3141343, 1, 0, 0.2941177, 1,
1.695967, -0.299146, 0.1873377, 1, 0, 0.2862745, 1,
1.70161, 0.2013548, 1.181412, 1, 0, 0.282353, 1,
1.719939, 0.8744045, 2.582951, 1, 0, 0.2745098, 1,
1.741708, -0.9341421, 2.149715, 1, 0, 0.2705882, 1,
1.775087, -0.7386116, 2.971864, 1, 0, 0.2627451, 1,
1.778994, -0.5865123, 1.919665, 1, 0, 0.2588235, 1,
1.803216, -0.1202256, 0.9452795, 1, 0, 0.2509804, 1,
1.803514, -0.3478045, 0.8439553, 1, 0, 0.2470588, 1,
1.80923, -0.8576051, 2.673188, 1, 0, 0.2392157, 1,
1.817062, 0.5891601, 2.077366, 1, 0, 0.2352941, 1,
1.817078, 0.6392, -0.2505675, 1, 0, 0.227451, 1,
1.826504, 1.2691, 2.891686, 1, 0, 0.2235294, 1,
1.855397, -1.574538, 3.181205, 1, 0, 0.2156863, 1,
1.860719, -1.463252, 2.235578, 1, 0, 0.2117647, 1,
1.875137, -0.08900114, 1.4175, 1, 0, 0.2039216, 1,
1.916662, -1.626176, 2.095225, 1, 0, 0.1960784, 1,
1.927194, 1.11839, 1.221831, 1, 0, 0.1921569, 1,
1.931155, -0.4674746, 1.996956, 1, 0, 0.1843137, 1,
1.941206, -0.5626101, 1.328951, 1, 0, 0.1803922, 1,
1.947197, -0.3102276, 2.345095, 1, 0, 0.172549, 1,
1.982199, 0.4639091, 1.212643, 1, 0, 0.1686275, 1,
1.985921, -0.03355286, 2.548679, 1, 0, 0.1607843, 1,
1.995162, -0.3680474, 2.336166, 1, 0, 0.1568628, 1,
2.002131, 1.128209, 1.851557, 1, 0, 0.1490196, 1,
2.050326, 0.7878498, 2.884874, 1, 0, 0.145098, 1,
2.062147, 0.1495803, 1.149097, 1, 0, 0.1372549, 1,
2.070005, 1.739302, 0.7870363, 1, 0, 0.1333333, 1,
2.074988, -2.558977, 1.483468, 1, 0, 0.1254902, 1,
2.090965, -0.2437887, 2.363462, 1, 0, 0.1215686, 1,
2.133377, 0.2250171, 3.079668, 1, 0, 0.1137255, 1,
2.134887, 1.551615, 0.03809289, 1, 0, 0.1098039, 1,
2.139876, -0.2283081, 2.09165, 1, 0, 0.1019608, 1,
2.153695, 1.387489, 0.98082, 1, 0, 0.09411765, 1,
2.198452, 0.3813923, 1.260205, 1, 0, 0.09019608, 1,
2.208587, -0.9668031, 1.209318, 1, 0, 0.08235294, 1,
2.213377, 0.2748445, 2.993618, 1, 0, 0.07843138, 1,
2.35707, 2.575504, 0.7146466, 1, 0, 0.07058824, 1,
2.37956, 0.1635488, 2.525651, 1, 0, 0.06666667, 1,
2.382329, -0.7389299, 2.583469, 1, 0, 0.05882353, 1,
2.457559, -0.09083635, 2.132243, 1, 0, 0.05490196, 1,
2.479368, -0.8023496, 0.01839671, 1, 0, 0.04705882, 1,
2.4953, 1.858923, 0.8794507, 1, 0, 0.04313726, 1,
2.526649, -0.0005495616, 3.168571, 1, 0, 0.03529412, 1,
2.546539, 0.04326402, 1.717794, 1, 0, 0.03137255, 1,
2.586038, 0.09648229, 2.216303, 1, 0, 0.02352941, 1,
3.048573, 0.2844833, 0.5144734, 1, 0, 0.01960784, 1,
3.084538, 0.853786, 1.415409, 1, 0, 0.01176471, 1,
3.092345, -0.6749181, 2.388842, 1, 0, 0.007843138, 1
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
0.0399822, -4.211642, -6.929558, 0, -0.5, 0.5, 0.5,
0.0399822, -4.211642, -6.929558, 1, -0.5, 0.5, 0.5,
0.0399822, -4.211642, -6.929558, 1, 1.5, 0.5, 0.5,
0.0399822, -4.211642, -6.929558, 0, 1.5, 0.5, 0.5
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
-4.047131, -0.01466691, -6.929558, 0, -0.5, 0.5, 0.5,
-4.047131, -0.01466691, -6.929558, 1, -0.5, 0.5, 0.5,
-4.047131, -0.01466691, -6.929558, 1, 1.5, 0.5, 0.5,
-4.047131, -0.01466691, -6.929558, 0, 1.5, 0.5, 0.5
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
-4.047131, -4.211642, 0.2417245, 0, -0.5, 0.5, 0.5,
-4.047131, -4.211642, 0.2417245, 1, -0.5, 0.5, 0.5,
-4.047131, -4.211642, 0.2417245, 1, 1.5, 0.5, 0.5,
-4.047131, -4.211642, 0.2417245, 0, 1.5, 0.5, 0.5
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
-3, -3.243109, -5.274647,
3, -3.243109, -5.274647,
-3, -3.243109, -5.274647,
-3, -3.404532, -5.550466,
-2, -3.243109, -5.274647,
-2, -3.404532, -5.550466,
-1, -3.243109, -5.274647,
-1, -3.404532, -5.550466,
0, -3.243109, -5.274647,
0, -3.404532, -5.550466,
1, -3.243109, -5.274647,
1, -3.404532, -5.550466,
2, -3.243109, -5.274647,
2, -3.404532, -5.550466,
3, -3.243109, -5.274647,
3, -3.404532, -5.550466
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
-3, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
-3, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
-3, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
-3, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
-2, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
-2, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
-2, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
-2, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
-1, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
-1, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
-1, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
-1, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
0, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
0, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
0, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
0, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
1, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
1, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
1, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
1, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
2, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
2, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
2, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
2, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5,
3, -3.727376, -6.102103, 0, -0.5, 0.5, 0.5,
3, -3.727376, -6.102103, 1, -0.5, 0.5, 0.5,
3, -3.727376, -6.102103, 1, 1.5, 0.5, 0.5,
3, -3.727376, -6.102103, 0, 1.5, 0.5, 0.5
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
-3.103951, -3, -5.274647,
-3.103951, 3, -5.274647,
-3.103951, -3, -5.274647,
-3.261148, -3, -5.550466,
-3.103951, -2, -5.274647,
-3.261148, -2, -5.550466,
-3.103951, -1, -5.274647,
-3.261148, -1, -5.550466,
-3.103951, 0, -5.274647,
-3.261148, 0, -5.550466,
-3.103951, 1, -5.274647,
-3.261148, 1, -5.550466,
-3.103951, 2, -5.274647,
-3.261148, 2, -5.550466,
-3.103951, 3, -5.274647,
-3.261148, 3, -5.550466
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
-3.575541, -3, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, -3, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, -3, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, -3, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, -2, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, -2, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, -2, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, -2, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, -1, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, -1, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, -1, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, -1, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, 0, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, 0, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, 0, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, 0, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, 1, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, 1, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, 1, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, 1, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, 2, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, 2, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, 2, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, 2, -6.102103, 0, 1.5, 0.5, 0.5,
-3.575541, 3, -6.102103, 0, -0.5, 0.5, 0.5,
-3.575541, 3, -6.102103, 1, -0.5, 0.5, 0.5,
-3.575541, 3, -6.102103, 1, 1.5, 0.5, 0.5,
-3.575541, 3, -6.102103, 0, 1.5, 0.5, 0.5
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
-3.103951, -3.243109, -4,
-3.103951, -3.243109, 4,
-3.103951, -3.243109, -4,
-3.261148, -3.404532, -4,
-3.103951, -3.243109, -2,
-3.261148, -3.404532, -2,
-3.103951, -3.243109, 0,
-3.261148, -3.404532, 0,
-3.103951, -3.243109, 2,
-3.261148, -3.404532, 2,
-3.103951, -3.243109, 4,
-3.261148, -3.404532, 4
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
-3.575541, -3.727376, -4, 0, -0.5, 0.5, 0.5,
-3.575541, -3.727376, -4, 1, -0.5, 0.5, 0.5,
-3.575541, -3.727376, -4, 1, 1.5, 0.5, 0.5,
-3.575541, -3.727376, -4, 0, 1.5, 0.5, 0.5,
-3.575541, -3.727376, -2, 0, -0.5, 0.5, 0.5,
-3.575541, -3.727376, -2, 1, -0.5, 0.5, 0.5,
-3.575541, -3.727376, -2, 1, 1.5, 0.5, 0.5,
-3.575541, -3.727376, -2, 0, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 0, 0, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 0, 1, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 0, 1, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 0, 0, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 2, 0, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 2, 1, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 2, 1, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 2, 0, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 4, 0, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 4, 1, -0.5, 0.5, 0.5,
-3.575541, -3.727376, 4, 1, 1.5, 0.5, 0.5,
-3.575541, -3.727376, 4, 0, 1.5, 0.5, 0.5
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
-3.103951, -3.243109, -5.274647,
-3.103951, 3.213776, -5.274647,
-3.103951, -3.243109, 5.758096,
-3.103951, 3.213776, 5.758096,
-3.103951, -3.243109, -5.274647,
-3.103951, -3.243109, 5.758096,
-3.103951, 3.213776, -5.274647,
-3.103951, 3.213776, 5.758096,
-3.103951, -3.243109, -5.274647,
3.183916, -3.243109, -5.274647,
-3.103951, -3.243109, 5.758096,
3.183916, -3.243109, 5.758096,
-3.103951, 3.213776, -5.274647,
3.183916, 3.213776, -5.274647,
-3.103951, 3.213776, 5.758096,
3.183916, 3.213776, 5.758096,
3.183916, -3.243109, -5.274647,
3.183916, 3.213776, -5.274647,
3.183916, -3.243109, 5.758096,
3.183916, 3.213776, 5.758096,
3.183916, -3.243109, -5.274647,
3.183916, -3.243109, 5.758096,
3.183916, 3.213776, -5.274647,
3.183916, 3.213776, 5.758096
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
var radius = 7.607116;
var distance = 33.84492;
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
mvMatrix.translate( -0.0399822, 0.01466691, -0.2417245 );
mvMatrix.scale( 1.308069, 1.273828, 0.7455048 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84492);
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


