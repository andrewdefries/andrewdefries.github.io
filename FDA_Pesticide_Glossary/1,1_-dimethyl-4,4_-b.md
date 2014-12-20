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
-3.182545, -0.7185505, -1.413064, 1, 0, 0, 1,
-3.035724, 2.597529, -1.601173, 1, 0.007843138, 0, 1,
-2.968427, 0.6942952, -2.376746, 1, 0.01176471, 0, 1,
-2.79278, -1.060676, -1.5337, 1, 0.01960784, 0, 1,
-2.771508, 0.09470836, -0.08631312, 1, 0.02352941, 0, 1,
-2.715131, 0.03387541, -1.799513, 1, 0.03137255, 0, 1,
-2.62844, -0.9007949, -2.70072, 1, 0.03529412, 0, 1,
-2.595037, -0.6794072, -0.5239902, 1, 0.04313726, 0, 1,
-2.504149, 0.1026743, -1.021049, 1, 0.04705882, 0, 1,
-2.483603, -0.8880783, -2.093254, 1, 0.05490196, 0, 1,
-2.402629, -1.540144, -2.473725, 1, 0.05882353, 0, 1,
-2.365528, -0.4056731, -1.181545, 1, 0.06666667, 0, 1,
-2.358345, -0.03216145, -2.426992, 1, 0.07058824, 0, 1,
-2.338912, 0.4124975, -0.4507779, 1, 0.07843138, 0, 1,
-2.326367, 1.013443, -1.110118, 1, 0.08235294, 0, 1,
-2.262081, 1.261302, -1.195779, 1, 0.09019608, 0, 1,
-2.259673, 0.8490571, -1.526627, 1, 0.09411765, 0, 1,
-2.239888, -0.9064236, -2.473646, 1, 0.1019608, 0, 1,
-2.204761, -1.684212, -1.545007, 1, 0.1098039, 0, 1,
-2.192919, 0.9764341, -0.4944296, 1, 0.1137255, 0, 1,
-2.184683, -0.180375, -1.847818, 1, 0.1215686, 0, 1,
-2.134834, 1.224622, -0.74651, 1, 0.1254902, 0, 1,
-2.086793, -2.763789, -4.417398, 1, 0.1333333, 0, 1,
-2.033148, 1.07101, -1.172484, 1, 0.1372549, 0, 1,
-2.017295, 0.930775, -0.3896096, 1, 0.145098, 0, 1,
-1.984958, -0.2331693, -0.4767778, 1, 0.1490196, 0, 1,
-1.962951, 0.3648689, -0.5213012, 1, 0.1568628, 0, 1,
-1.880039, 1.310625, 0.2081976, 1, 0.1607843, 0, 1,
-1.849045, -0.4196079, -0.5809678, 1, 0.1686275, 0, 1,
-1.82454, 1.229814, -0.06735758, 1, 0.172549, 0, 1,
-1.823879, 0.3216006, -0.6033844, 1, 0.1803922, 0, 1,
-1.808781, 0.6942091, -0.5012019, 1, 0.1843137, 0, 1,
-1.793176, 0.3938783, -1.220291, 1, 0.1921569, 0, 1,
-1.786449, 0.5868728, -1.113052, 1, 0.1960784, 0, 1,
-1.779553, 0.20405, -1.371317, 1, 0.2039216, 0, 1,
-1.777944, 1.39766, -1.209584, 1, 0.2117647, 0, 1,
-1.752554, 0.4609117, -2.326863, 1, 0.2156863, 0, 1,
-1.728359, 0.2773379, -1.475566, 1, 0.2235294, 0, 1,
-1.715632, 1.162397, -2.07005, 1, 0.227451, 0, 1,
-1.712423, 0.6304754, 0.8726932, 1, 0.2352941, 0, 1,
-1.711542, -1.149802, -2.424521, 1, 0.2392157, 0, 1,
-1.701308, -1.315001, -2.146935, 1, 0.2470588, 0, 1,
-1.695635, -0.4384329, -0.9887562, 1, 0.2509804, 0, 1,
-1.685196, 1.968394, 0.2834695, 1, 0.2588235, 0, 1,
-1.647374, 0.6020845, -2.406786, 1, 0.2627451, 0, 1,
-1.63828, 0.2115969, -2.935403, 1, 0.2705882, 0, 1,
-1.634192, 0.5604289, 0.0208618, 1, 0.2745098, 0, 1,
-1.620548, 0.7735872, -2.760953, 1, 0.282353, 0, 1,
-1.606359, 2.520651, -0.6249114, 1, 0.2862745, 0, 1,
-1.597549, -0.5166092, -1.268601, 1, 0.2941177, 0, 1,
-1.591481, -0.3709721, -0.4385562, 1, 0.3019608, 0, 1,
-1.582214, 1.480953, -1.172705, 1, 0.3058824, 0, 1,
-1.581211, 1.251974, -0.4119901, 1, 0.3137255, 0, 1,
-1.575817, 1.185398, -1.364592, 1, 0.3176471, 0, 1,
-1.568505, 1.270808, -1.757661, 1, 0.3254902, 0, 1,
-1.55554, -0.02693987, -1.663962, 1, 0.3294118, 0, 1,
-1.553605, -0.02076442, -1.31252, 1, 0.3372549, 0, 1,
-1.546578, 0.1322209, -2.079988, 1, 0.3411765, 0, 1,
-1.540547, 0.5131406, -0.1737494, 1, 0.3490196, 0, 1,
-1.523907, -0.6123363, -3.059333, 1, 0.3529412, 0, 1,
-1.508143, -0.3359831, -0.3635008, 1, 0.3607843, 0, 1,
-1.503692, 0.8746989, 0.200232, 1, 0.3647059, 0, 1,
-1.478023, -0.713395, -2.813284, 1, 0.372549, 0, 1,
-1.477101, 0.6174932, -1.48806, 1, 0.3764706, 0, 1,
-1.47531, -0.613992, -2.296085, 1, 0.3843137, 0, 1,
-1.470242, -0.2715956, -0.898291, 1, 0.3882353, 0, 1,
-1.459836, 1.017255, -0.3721878, 1, 0.3960784, 0, 1,
-1.453701, -1.123086, -0.02425795, 1, 0.4039216, 0, 1,
-1.452258, -0.2857139, -3.7577, 1, 0.4078431, 0, 1,
-1.42831, -0.02113295, -0.2797236, 1, 0.4156863, 0, 1,
-1.422852, -0.4845825, -2.740097, 1, 0.4196078, 0, 1,
-1.415712, -0.3022544, -0.7813551, 1, 0.427451, 0, 1,
-1.415265, -0.02340643, -1.213286, 1, 0.4313726, 0, 1,
-1.410958, 0.7645333, -2.854103, 1, 0.4392157, 0, 1,
-1.39212, 2.181871, 1.707181, 1, 0.4431373, 0, 1,
-1.370924, -1.680366, -2.12723, 1, 0.4509804, 0, 1,
-1.358088, -0.4728481, -0.491365, 1, 0.454902, 0, 1,
-1.351437, 0.9411956, 0.3504179, 1, 0.4627451, 0, 1,
-1.350364, -0.04520869, -1.005722, 1, 0.4666667, 0, 1,
-1.3487, -1.60083, -2.584071, 1, 0.4745098, 0, 1,
-1.347323, 0.4430499, -2.196907, 1, 0.4784314, 0, 1,
-1.340961, -0.8116847, -2.982362, 1, 0.4862745, 0, 1,
-1.340288, -0.7542616, -1.350197, 1, 0.4901961, 0, 1,
-1.336859, 1.641286, -1.163147, 1, 0.4980392, 0, 1,
-1.335889, 0.1435935, -1.41951, 1, 0.5058824, 0, 1,
-1.326838, 0.4786952, -0.1688598, 1, 0.509804, 0, 1,
-1.31004, -0.5972499, -3.037206, 1, 0.5176471, 0, 1,
-1.303832, -1.466212, -3.731009, 1, 0.5215687, 0, 1,
-1.302153, 0.9822396, -1.487776, 1, 0.5294118, 0, 1,
-1.285976, -0.3923963, -1.455616, 1, 0.5333334, 0, 1,
-1.270587, -1.875671, -1.742023, 1, 0.5411765, 0, 1,
-1.266067, -0.5568653, -3.629531, 1, 0.5450981, 0, 1,
-1.265869, 1.08151, -1.318612, 1, 0.5529412, 0, 1,
-1.264546, 0.01997819, -0.9097817, 1, 0.5568628, 0, 1,
-1.23677, 0.5833859, -1.245915, 1, 0.5647059, 0, 1,
-1.227035, -0.6981728, -2.720779, 1, 0.5686275, 0, 1,
-1.226699, 1.153452, -1.028435, 1, 0.5764706, 0, 1,
-1.224835, 0.3525455, 0.1709262, 1, 0.5803922, 0, 1,
-1.204425, -0.5227582, -2.506755, 1, 0.5882353, 0, 1,
-1.201571, 1.011412, -0.2867837, 1, 0.5921569, 0, 1,
-1.200539, -0.1305054, -0.6214384, 1, 0.6, 0, 1,
-1.198787, -1.086429, -1.782349, 1, 0.6078432, 0, 1,
-1.197294, 1.24163, -1.213565, 1, 0.6117647, 0, 1,
-1.195605, 0.000354262, -1.168679, 1, 0.6196079, 0, 1,
-1.188796, -0.3416326, -2.763691, 1, 0.6235294, 0, 1,
-1.184023, 0.2888624, -2.141531, 1, 0.6313726, 0, 1,
-1.175073, 1.225853, 0.7893465, 1, 0.6352941, 0, 1,
-1.165605, -0.1711858, -0.5107455, 1, 0.6431373, 0, 1,
-1.163134, 0.04647965, -0.7262564, 1, 0.6470588, 0, 1,
-1.162471, 0.7683644, -0.9184813, 1, 0.654902, 0, 1,
-1.157314, -0.9344615, -0.7176563, 1, 0.6588235, 0, 1,
-1.155648, -1.324649, -2.617358, 1, 0.6666667, 0, 1,
-1.151848, 0.006712913, -0.9338458, 1, 0.6705883, 0, 1,
-1.151387, -0.3313245, -2.188716, 1, 0.6784314, 0, 1,
-1.148262, -0.673467, -1.659894, 1, 0.682353, 0, 1,
-1.145376, 1.175765, 0.997705, 1, 0.6901961, 0, 1,
-1.144522, 2.120079, -2.361419, 1, 0.6941177, 0, 1,
-1.143393, -0.1988035, -2.953712, 1, 0.7019608, 0, 1,
-1.14055, 0.03538552, -0.3045103, 1, 0.7098039, 0, 1,
-1.127837, -0.0731222, -3.705424, 1, 0.7137255, 0, 1,
-1.115519, 1.396759, -2.74838, 1, 0.7215686, 0, 1,
-1.113774, 0.5909168, -0.3444319, 1, 0.7254902, 0, 1,
-1.111115, -0.311487, -0.432913, 1, 0.7333333, 0, 1,
-1.09375, -0.9529643, -2.126867, 1, 0.7372549, 0, 1,
-1.088743, 0.1693866, 0.1841483, 1, 0.7450981, 0, 1,
-1.082159, -0.1859338, -0.6360367, 1, 0.7490196, 0, 1,
-1.079796, 0.7274392, 0.1782948, 1, 0.7568628, 0, 1,
-1.079583, 0.8907018, -0.7115964, 1, 0.7607843, 0, 1,
-1.079175, -0.1169985, -2.876777, 1, 0.7686275, 0, 1,
-1.076828, -0.4891499, -2.961963, 1, 0.772549, 0, 1,
-1.071672, -0.01162502, -1.147217, 1, 0.7803922, 0, 1,
-1.069088, -0.5641693, -3.205194, 1, 0.7843137, 0, 1,
-1.067262, 0.6425886, 0.8806459, 1, 0.7921569, 0, 1,
-1.064668, 0.9054224, -0.3465379, 1, 0.7960784, 0, 1,
-1.062815, 0.1790163, -1.834884, 1, 0.8039216, 0, 1,
-1.056331, 0.2336597, -1.734478, 1, 0.8117647, 0, 1,
-1.055503, 2.23048, -1.343433, 1, 0.8156863, 0, 1,
-1.048177, -0.4021789, -1.406373, 1, 0.8235294, 0, 1,
-1.04558, 1.726208, -1.042918, 1, 0.827451, 0, 1,
-1.028854, 0.2084658, -2.531027, 1, 0.8352941, 0, 1,
-1.02458, 0.7214087, -1.024714, 1, 0.8392157, 0, 1,
-1.024143, -0.8068075, -0.8468761, 1, 0.8470588, 0, 1,
-1.016539, 0.04718835, -0.3771312, 1, 0.8509804, 0, 1,
-1.014309, 1.615808, -1.514756, 1, 0.8588235, 0, 1,
-1.012899, 0.3806418, -0.4550685, 1, 0.8627451, 0, 1,
-1.012703, -0.7592562, -2.355267, 1, 0.8705882, 0, 1,
-1.009148, -0.2574948, -1.240917, 1, 0.8745098, 0, 1,
-1.007114, -1.072483, -2.737884, 1, 0.8823529, 0, 1,
-1.00644, -2.319768, -4.333038, 1, 0.8862745, 0, 1,
-0.9986647, -0.4750052, -2.379066, 1, 0.8941177, 0, 1,
-0.9863678, -2.184937, -3.277262, 1, 0.8980392, 0, 1,
-0.9858431, 0.7163271, -0.8114796, 1, 0.9058824, 0, 1,
-0.9813299, -0.3144988, -2.162313, 1, 0.9137255, 0, 1,
-0.9807963, 0.812187, -1.524118, 1, 0.9176471, 0, 1,
-0.9754202, -0.9591072, -2.503009, 1, 0.9254902, 0, 1,
-0.9752426, 2.209128, -2.119529, 1, 0.9294118, 0, 1,
-0.9728407, 0.4571158, 0.3092526, 1, 0.9372549, 0, 1,
-0.9621214, 0.615082, -1.487537, 1, 0.9411765, 0, 1,
-0.9602956, -0.4271789, -2.562869, 1, 0.9490196, 0, 1,
-0.9587799, 0.0936275, -1.175244, 1, 0.9529412, 0, 1,
-0.9524712, -2.288315, -3.229173, 1, 0.9607843, 0, 1,
-0.9451973, -0.2005182, -2.010894, 1, 0.9647059, 0, 1,
-0.9430382, 0.9982255, -2.36992, 1, 0.972549, 0, 1,
-0.9313537, -0.1899034, -2.020979, 1, 0.9764706, 0, 1,
-0.9300035, -1.135072, -3.232042, 1, 0.9843137, 0, 1,
-0.9294201, -0.6553984, -2.161828, 1, 0.9882353, 0, 1,
-0.9270121, -0.7513645, -1.590233, 1, 0.9960784, 0, 1,
-0.9266436, -0.1232406, -1.530441, 0.9960784, 1, 0, 1,
-0.9240979, 0.127786, -0.6563209, 0.9921569, 1, 0, 1,
-0.9186717, -0.1580684, -0.8393431, 0.9843137, 1, 0, 1,
-0.9161598, -0.6348021, -2.705888, 0.9803922, 1, 0, 1,
-0.9139723, 0.1173253, -0.653717, 0.972549, 1, 0, 1,
-0.9005077, -2.038935, -2.965014, 0.9686275, 1, 0, 1,
-0.8901756, 1.700638, 1.293354, 0.9607843, 1, 0, 1,
-0.8894805, -0.3144565, -2.639917, 0.9568627, 1, 0, 1,
-0.887279, 0.2563474, -2.932624, 0.9490196, 1, 0, 1,
-0.8733684, -2.190387, -4.366433, 0.945098, 1, 0, 1,
-0.8667163, 1.121285, -0.02697769, 0.9372549, 1, 0, 1,
-0.8657609, -0.5067188, -3.078458, 0.9333333, 1, 0, 1,
-0.8635321, 0.1240074, -0.187231, 0.9254902, 1, 0, 1,
-0.8495759, -1.35829, -2.762048, 0.9215686, 1, 0, 1,
-0.8462448, 0.98678, -1.95661, 0.9137255, 1, 0, 1,
-0.8461161, 0.2238445, -1.423498, 0.9098039, 1, 0, 1,
-0.8459072, 0.2101661, -1.118593, 0.9019608, 1, 0, 1,
-0.8414398, 0.8754082, 0.2090372, 0.8941177, 1, 0, 1,
-0.8407851, -1.785093, -4.080843, 0.8901961, 1, 0, 1,
-0.837605, -1.426876, -2.812724, 0.8823529, 1, 0, 1,
-0.8358115, 0.02180366, -2.140812, 0.8784314, 1, 0, 1,
-0.8349251, -0.745573, -2.767339, 0.8705882, 1, 0, 1,
-0.826202, -0.8836699, -2.119972, 0.8666667, 1, 0, 1,
-0.8252901, -0.4903603, -3.109361, 0.8588235, 1, 0, 1,
-0.82204, 0.3916818, -0.9489329, 0.854902, 1, 0, 1,
-0.8196983, 1.843061, -1.315057, 0.8470588, 1, 0, 1,
-0.8149735, 1.183867, -1.034757, 0.8431373, 1, 0, 1,
-0.809285, 0.5990781, -0.1565269, 0.8352941, 1, 0, 1,
-0.8087608, -0.9408157, -3.567961, 0.8313726, 1, 0, 1,
-0.8052174, 0.5545902, -2.970336, 0.8235294, 1, 0, 1,
-0.8019137, 0.5116284, 1.004097, 0.8196079, 1, 0, 1,
-0.7976731, -0.1058946, -3.660066, 0.8117647, 1, 0, 1,
-0.7967574, -0.292629, -1.227376, 0.8078431, 1, 0, 1,
-0.7923373, 1.73889, 0.08483741, 0.8, 1, 0, 1,
-0.7822674, 0.7388752, -1.154339, 0.7921569, 1, 0, 1,
-0.7755114, -1.755791, -1.319122, 0.7882353, 1, 0, 1,
-0.7702116, 1.546971, -0.2039248, 0.7803922, 1, 0, 1,
-0.7640982, -0.5526282, -2.395565, 0.7764706, 1, 0, 1,
-0.7637835, -0.8383166, -2.091389, 0.7686275, 1, 0, 1,
-0.7628781, 0.2688668, -0.09346119, 0.7647059, 1, 0, 1,
-0.7569531, -0.8021314, -2.954123, 0.7568628, 1, 0, 1,
-0.7547657, -0.5113052, -3.347377, 0.7529412, 1, 0, 1,
-0.7525224, 0.1144929, 0.3391231, 0.7450981, 1, 0, 1,
-0.7511844, -0.147009, -1.32412, 0.7411765, 1, 0, 1,
-0.7507289, 0.1988837, 0.2642731, 0.7333333, 1, 0, 1,
-0.7507077, 0.751755, -0.2356126, 0.7294118, 1, 0, 1,
-0.7429318, -0.2609338, -1.451163, 0.7215686, 1, 0, 1,
-0.7324506, -0.8281788, -2.653061, 0.7176471, 1, 0, 1,
-0.7319123, 0.9867831, 0.093121, 0.7098039, 1, 0, 1,
-0.7314481, 0.02290519, -1.702868, 0.7058824, 1, 0, 1,
-0.7266673, -0.1957746, -2.220582, 0.6980392, 1, 0, 1,
-0.7251287, -0.4450845, -3.639476, 0.6901961, 1, 0, 1,
-0.7231483, -1.277065, -1.869168, 0.6862745, 1, 0, 1,
-0.7224482, 1.004584, 1.729728, 0.6784314, 1, 0, 1,
-0.7180521, -1.043559, -3.063052, 0.6745098, 1, 0, 1,
-0.7151318, -0.346312, -1.565624, 0.6666667, 1, 0, 1,
-0.710248, -1.234723, -3.714072, 0.6627451, 1, 0, 1,
-0.7080628, -0.6610348, -3.197496, 0.654902, 1, 0, 1,
-0.703761, -0.05869606, -2.413447, 0.6509804, 1, 0, 1,
-0.7018961, 0.1313991, -2.924407, 0.6431373, 1, 0, 1,
-0.7015308, -1.421722, -3.933837, 0.6392157, 1, 0, 1,
-0.7007711, -1.606075, -1.892743, 0.6313726, 1, 0, 1,
-0.699743, -0.1285098, -1.447422, 0.627451, 1, 0, 1,
-0.699218, 2.363498, -0.01756676, 0.6196079, 1, 0, 1,
-0.6933827, -0.5817506, -1.477392, 0.6156863, 1, 0, 1,
-0.6931807, -1.300375, -3.122072, 0.6078432, 1, 0, 1,
-0.6931054, 0.8283668, -3.07384, 0.6039216, 1, 0, 1,
-0.6901039, -1.302255, -2.003248, 0.5960785, 1, 0, 1,
-0.6894227, 0.5960919, -1.332372, 0.5882353, 1, 0, 1,
-0.6867631, -0.9599604, -3.39815, 0.5843138, 1, 0, 1,
-0.6819088, 0.07480097, -1.451664, 0.5764706, 1, 0, 1,
-0.6771215, -0.3759128, -1.231092, 0.572549, 1, 0, 1,
-0.6728266, -0.4214225, -0.06011388, 0.5647059, 1, 0, 1,
-0.6723101, -0.4782263, -2.938989, 0.5607843, 1, 0, 1,
-0.6683993, -0.4442868, -2.975716, 0.5529412, 1, 0, 1,
-0.668027, -1.067347, -2.210414, 0.5490196, 1, 0, 1,
-0.667829, 2.510054, 0.8779893, 0.5411765, 1, 0, 1,
-0.6647498, -1.124211, -3.022735, 0.5372549, 1, 0, 1,
-0.6593953, 0.3298564, -2.707823, 0.5294118, 1, 0, 1,
-0.657162, 0.03777349, -0.7694964, 0.5254902, 1, 0, 1,
-0.651792, -1.720674, -2.151245, 0.5176471, 1, 0, 1,
-0.6513525, 0.9662085, -0.6164353, 0.5137255, 1, 0, 1,
-0.6494635, -0.810684, -1.871615, 0.5058824, 1, 0, 1,
-0.6390045, -0.7964349, -3.878242, 0.5019608, 1, 0, 1,
-0.6309385, -1.304653, -1.969482, 0.4941176, 1, 0, 1,
-0.6297282, -0.8363582, -2.321771, 0.4862745, 1, 0, 1,
-0.6288999, -0.4270159, -0.2215195, 0.4823529, 1, 0, 1,
-0.6257263, -1.454864, -1.598953, 0.4745098, 1, 0, 1,
-0.6227124, -0.1651167, -2.871619, 0.4705882, 1, 0, 1,
-0.6191091, -2.696263, -2.632538, 0.4627451, 1, 0, 1,
-0.6182246, -1.032261, -1.602973, 0.4588235, 1, 0, 1,
-0.6109151, 0.3365381, -1.795151, 0.4509804, 1, 0, 1,
-0.6026796, 0.8438109, -0.1704796, 0.4470588, 1, 0, 1,
-0.5997341, -1.206068, -1.51403, 0.4392157, 1, 0, 1,
-0.5963934, 0.02372864, -1.36394, 0.4352941, 1, 0, 1,
-0.5910617, 0.9812185, -1.213619, 0.427451, 1, 0, 1,
-0.5871086, 0.6219375, -1.315962, 0.4235294, 1, 0, 1,
-0.5859292, 1.023824, -0.317081, 0.4156863, 1, 0, 1,
-0.5852115, -0.2072279, -1.897383, 0.4117647, 1, 0, 1,
-0.583441, -0.9491261, -1.721451, 0.4039216, 1, 0, 1,
-0.5784422, -1.494663, -3.573296, 0.3960784, 1, 0, 1,
-0.5684996, 1.310491, 0.2342656, 0.3921569, 1, 0, 1,
-0.5681624, -0.4239376, -1.816761, 0.3843137, 1, 0, 1,
-0.5636132, -0.1496452, -1.885711, 0.3803922, 1, 0, 1,
-0.5616595, 0.2417939, -0.578102, 0.372549, 1, 0, 1,
-0.5606205, 1.061471, -1.271681, 0.3686275, 1, 0, 1,
-0.5591158, -1.684316, -2.542796, 0.3607843, 1, 0, 1,
-0.5557606, 0.5363295, -1.394018, 0.3568628, 1, 0, 1,
-0.5554559, 1.163558, 0.06433313, 0.3490196, 1, 0, 1,
-0.554725, 1.217397, -0.4030112, 0.345098, 1, 0, 1,
-0.552901, 1.45697, -1.055738, 0.3372549, 1, 0, 1,
-0.5528556, -0.20584, -2.981211, 0.3333333, 1, 0, 1,
-0.546824, 0.3252712, -0.3154095, 0.3254902, 1, 0, 1,
-0.544952, -0.627803, -2.439686, 0.3215686, 1, 0, 1,
-0.5428384, 2.10864, -0.3911726, 0.3137255, 1, 0, 1,
-0.5414793, -0.2737285, -4.164591, 0.3098039, 1, 0, 1,
-0.5378522, 0.4361204, -0.7687058, 0.3019608, 1, 0, 1,
-0.5377351, -0.4234127, -2.579752, 0.2941177, 1, 0, 1,
-0.5363322, 0.3605024, -1.372306, 0.2901961, 1, 0, 1,
-0.5327372, -0.6217615, -2.302639, 0.282353, 1, 0, 1,
-0.531972, 0.2629696, -1.111678, 0.2784314, 1, 0, 1,
-0.5313938, 2.421894, -0.1623611, 0.2705882, 1, 0, 1,
-0.5289211, 0.4491178, -0.6825816, 0.2666667, 1, 0, 1,
-0.5268399, 0.1253269, -0.4538536, 0.2588235, 1, 0, 1,
-0.5265374, 1.418717, -0.9771188, 0.254902, 1, 0, 1,
-0.5257514, -0.587086, -0.4637263, 0.2470588, 1, 0, 1,
-0.5248147, -0.376183, -2.484799, 0.2431373, 1, 0, 1,
-0.5219429, 0.5695265, -0.4644683, 0.2352941, 1, 0, 1,
-0.5120646, 0.7190765, -0.9516808, 0.2313726, 1, 0, 1,
-0.5080597, -1.096674, -2.14137, 0.2235294, 1, 0, 1,
-0.5071971, 0.04079464, 0.02632327, 0.2196078, 1, 0, 1,
-0.5038477, -2.094785, -1.683128, 0.2117647, 1, 0, 1,
-0.4952177, -0.09127835, -1.661045, 0.2078431, 1, 0, 1,
-0.4908427, 0.2127612, -2.365809, 0.2, 1, 0, 1,
-0.4893366, -1.188196, -2.450866, 0.1921569, 1, 0, 1,
-0.4892939, 0.2136602, -1.637936, 0.1882353, 1, 0, 1,
-0.4871195, 0.3699932, -2.279095, 0.1803922, 1, 0, 1,
-0.4844871, 0.2018928, 0.02351659, 0.1764706, 1, 0, 1,
-0.4823043, -0.2972822, -2.993618, 0.1686275, 1, 0, 1,
-0.4778687, -0.576521, -1.980877, 0.1647059, 1, 0, 1,
-0.4756314, -1.584952, -1.000864, 0.1568628, 1, 0, 1,
-0.4753358, 0.1188786, -1.033027, 0.1529412, 1, 0, 1,
-0.4748108, 0.1194216, -0.6878622, 0.145098, 1, 0, 1,
-0.4726301, -0.01995342, -2.988347, 0.1411765, 1, 0, 1,
-0.4726181, 1.833865, 0.7419435, 0.1333333, 1, 0, 1,
-0.4698211, -0.7146403, -3.314628, 0.1294118, 1, 0, 1,
-0.4663687, 0.02897149, -1.9155, 0.1215686, 1, 0, 1,
-0.4657436, 0.08729097, -0.8004023, 0.1176471, 1, 0, 1,
-0.4612763, 1.126235, 0.5192581, 0.1098039, 1, 0, 1,
-0.4605162, 0.523508, -0.00330224, 0.1058824, 1, 0, 1,
-0.4545905, -0.8754298, -2.12719, 0.09803922, 1, 0, 1,
-0.4511092, 1.856035, 0.05949835, 0.09019608, 1, 0, 1,
-0.4465224, -0.08880253, -1.462672, 0.08627451, 1, 0, 1,
-0.4460327, 0.3871639, -0.978501, 0.07843138, 1, 0, 1,
-0.4460111, -0.8626029, -1.190564, 0.07450981, 1, 0, 1,
-0.4444138, -1.635034, -3.981261, 0.06666667, 1, 0, 1,
-0.4425328, 1.275021, 0.1852924, 0.0627451, 1, 0, 1,
-0.4364405, -1.102478, -2.679713, 0.05490196, 1, 0, 1,
-0.4358002, -1.195668, -4.156618, 0.05098039, 1, 0, 1,
-0.4355192, -0.3142793, -1.373275, 0.04313726, 1, 0, 1,
-0.4348818, 0.9720132, -1.802839, 0.03921569, 1, 0, 1,
-0.4317747, -0.5211485, -2.152899, 0.03137255, 1, 0, 1,
-0.430757, -0.1645082, -2.270661, 0.02745098, 1, 0, 1,
-0.4303951, 1.14552, -1.357701, 0.01960784, 1, 0, 1,
-0.4272631, -0.4093519, -4.056742, 0.01568628, 1, 0, 1,
-0.4272094, 0.2453283, -0.8272083, 0.007843138, 1, 0, 1,
-0.4240802, 1.879304, -0.9399608, 0.003921569, 1, 0, 1,
-0.4229704, 0.9208207, -0.9362034, 0, 1, 0.003921569, 1,
-0.4225557, 1.338332, -0.7279951, 0, 1, 0.01176471, 1,
-0.4113992, -0.254339, -2.6134, 0, 1, 0.01568628, 1,
-0.4090813, 1.614638, 1.3315, 0, 1, 0.02352941, 1,
-0.4074563, 0.8166133, -1.227386, 0, 1, 0.02745098, 1,
-0.4043417, -0.6403658, -2.978256, 0, 1, 0.03529412, 1,
-0.4019747, -0.9829427, -3.285702, 0, 1, 0.03921569, 1,
-0.4015516, 0.2071936, -0.70468, 0, 1, 0.04705882, 1,
-0.4001446, 0.4955244, -0.479349, 0, 1, 0.05098039, 1,
-0.3992682, 0.8070113, -1.228003, 0, 1, 0.05882353, 1,
-0.3977115, 1.621943, -1.287999, 0, 1, 0.0627451, 1,
-0.3952362, 0.1201569, -1.113008, 0, 1, 0.07058824, 1,
-0.3852575, 2.031918, 0.669027, 0, 1, 0.07450981, 1,
-0.3837834, -1.907028, -2.435289, 0, 1, 0.08235294, 1,
-0.3821925, -0.01779722, -1.568831, 0, 1, 0.08627451, 1,
-0.3804227, -1.492533, -1.914395, 0, 1, 0.09411765, 1,
-0.3799502, -0.51191, -2.551055, 0, 1, 0.1019608, 1,
-0.3798, -1.011989, -2.951993, 0, 1, 0.1058824, 1,
-0.3779651, -2.047025, 0.414326, 0, 1, 0.1137255, 1,
-0.3775181, 0.1191306, -1.861616, 0, 1, 0.1176471, 1,
-0.3744498, -0.1268245, -1.102141, 0, 1, 0.1254902, 1,
-0.3737359, -0.3064419, -1.275143, 0, 1, 0.1294118, 1,
-0.3736089, -0.3006979, -2.649369, 0, 1, 0.1372549, 1,
-0.3674342, -2.099366, -2.981832, 0, 1, 0.1411765, 1,
-0.3672024, -0.07679869, -2.276365, 0, 1, 0.1490196, 1,
-0.3640947, 1.39328, -0.4584048, 0, 1, 0.1529412, 1,
-0.3609059, -0.137404, -3.605716, 0, 1, 0.1607843, 1,
-0.3603601, 0.1037553, -1.8294, 0, 1, 0.1647059, 1,
-0.3563603, 1.056501, 0.2802266, 0, 1, 0.172549, 1,
-0.3527601, 0.05301116, -0.5201765, 0, 1, 0.1764706, 1,
-0.3505303, 0.1585521, -1.073313, 0, 1, 0.1843137, 1,
-0.3494334, 0.1979451, 0.4644372, 0, 1, 0.1882353, 1,
-0.3493322, 0.2053681, 0.6658555, 0, 1, 0.1960784, 1,
-0.3470254, -0.06908325, -2.290372, 0, 1, 0.2039216, 1,
-0.345834, -2.085035, -2.640502, 0, 1, 0.2078431, 1,
-0.3445296, 0.1283698, -0.9285496, 0, 1, 0.2156863, 1,
-0.3410775, 0.4288001, -0.2077605, 0, 1, 0.2196078, 1,
-0.3409522, 0.1536721, -2.194449, 0, 1, 0.227451, 1,
-0.3340919, 0.02185751, 0.01935397, 0, 1, 0.2313726, 1,
-0.3240608, 0.6837665, -0.2950446, 0, 1, 0.2392157, 1,
-0.3210514, 0.9585952, 1.320928, 0, 1, 0.2431373, 1,
-0.3198507, 0.77833, -0.164607, 0, 1, 0.2509804, 1,
-0.3194453, -1.44519, -3.02419, 0, 1, 0.254902, 1,
-0.3159825, -1.979594, -2.767212, 0, 1, 0.2627451, 1,
-0.3153495, 1.268705, -0.4745182, 0, 1, 0.2666667, 1,
-0.3150552, 0.4138758, 0.1359631, 0, 1, 0.2745098, 1,
-0.3118773, 0.5320402, 0.003471492, 0, 1, 0.2784314, 1,
-0.3111261, -0.2558032, -1.529816, 0, 1, 0.2862745, 1,
-0.3103243, -0.4209639, -3.483221, 0, 1, 0.2901961, 1,
-0.3100675, 0.06148465, -1.943768, 0, 1, 0.2980392, 1,
-0.3091756, -1.456256, -1.62181, 0, 1, 0.3058824, 1,
-0.3064919, 2.06627, 1.079068, 0, 1, 0.3098039, 1,
-0.2943773, -0.5492954, -3.966294, 0, 1, 0.3176471, 1,
-0.2823125, 0.3725988, 0.04967792, 0, 1, 0.3215686, 1,
-0.2811219, 0.06598698, -1.455029, 0, 1, 0.3294118, 1,
-0.2785251, -0.2395781, -2.330759, 0, 1, 0.3333333, 1,
-0.2776784, 0.2248487, -3.197039, 0, 1, 0.3411765, 1,
-0.2766843, -0.6827098, -3.012667, 0, 1, 0.345098, 1,
-0.2758254, -0.3398462, -1.416481, 0, 1, 0.3529412, 1,
-0.2719792, -1.369943, -1.411941, 0, 1, 0.3568628, 1,
-0.2675977, -0.4148304, -2.331682, 0, 1, 0.3647059, 1,
-0.2652068, -1.496888, -3.304455, 0, 1, 0.3686275, 1,
-0.2644065, -1.374195, -2.664407, 0, 1, 0.3764706, 1,
-0.2582581, -0.4091543, -2.405584, 0, 1, 0.3803922, 1,
-0.258251, 0.3779051, 1.696782, 0, 1, 0.3882353, 1,
-0.2579702, -0.3227101, -3.396599, 0, 1, 0.3921569, 1,
-0.2482826, 0.5779626, -1.066489, 0, 1, 0.4, 1,
-0.2462209, -0.7044609, -3.209405, 0, 1, 0.4078431, 1,
-0.2455039, -1.088978, -2.994422, 0, 1, 0.4117647, 1,
-0.2453566, -0.8610569, -3.823025, 0, 1, 0.4196078, 1,
-0.2450165, 1.785874, -0.986925, 0, 1, 0.4235294, 1,
-0.2422927, -0.4301441, -2.17273, 0, 1, 0.4313726, 1,
-0.2394126, -0.07191276, -1.982707, 0, 1, 0.4352941, 1,
-0.2371532, 0.5841408, 0.8527392, 0, 1, 0.4431373, 1,
-0.2348455, -0.5139537, -1.950374, 0, 1, 0.4470588, 1,
-0.2328656, 0.9346588, -0.5115802, 0, 1, 0.454902, 1,
-0.2320461, -1.118212, -2.835708, 0, 1, 0.4588235, 1,
-0.2301218, -0.5333306, -2.472255, 0, 1, 0.4666667, 1,
-0.2283779, 1.383993, 0.5934185, 0, 1, 0.4705882, 1,
-0.2282731, -0.9407425, -2.626497, 0, 1, 0.4784314, 1,
-0.2263425, 0.5259153, -1.688027, 0, 1, 0.4823529, 1,
-0.2243012, -0.3768476, -2.223376, 0, 1, 0.4901961, 1,
-0.2214476, -1.008624, -3.573514, 0, 1, 0.4941176, 1,
-0.2210293, 0.6403997, 0.4606219, 0, 1, 0.5019608, 1,
-0.2170784, -1.989094, -3.380672, 0, 1, 0.509804, 1,
-0.2165924, 2.515315, -0.7960764, 0, 1, 0.5137255, 1,
-0.2164103, 0.6317556, 1.740453, 0, 1, 0.5215687, 1,
-0.2118437, -0.5317723, -3.168126, 0, 1, 0.5254902, 1,
-0.2107598, 0.4084714, -1.338937, 0, 1, 0.5333334, 1,
-0.204386, -1.317056, -1.537706, 0, 1, 0.5372549, 1,
-0.2028907, -0.7618759, -2.825422, 0, 1, 0.5450981, 1,
-0.2022377, 0.3238095, -1.466788, 0, 1, 0.5490196, 1,
-0.2009914, 0.3370261, -1.740367, 0, 1, 0.5568628, 1,
-0.1996819, -2.414335, -3.803208, 0, 1, 0.5607843, 1,
-0.1963301, -0.9265899, -1.500397, 0, 1, 0.5686275, 1,
-0.1958466, 1.298125, -2.011544, 0, 1, 0.572549, 1,
-0.1920794, 0.4255067, 0.764034, 0, 1, 0.5803922, 1,
-0.1897431, -0.4121496, -2.41893, 0, 1, 0.5843138, 1,
-0.1889027, 0.3274171, -2.350187, 0, 1, 0.5921569, 1,
-0.1875441, 0.3629942, -0.8002899, 0, 1, 0.5960785, 1,
-0.1869006, 0.6835189, -0.42068, 0, 1, 0.6039216, 1,
-0.1780568, -0.04230903, -3.424599, 0, 1, 0.6117647, 1,
-0.1779534, -0.9423425, -3.532334, 0, 1, 0.6156863, 1,
-0.1746492, -1.645298, -4.179959, 0, 1, 0.6235294, 1,
-0.1741086, -0.603137, -2.289936, 0, 1, 0.627451, 1,
-0.1708911, -0.1962815, -1.225392, 0, 1, 0.6352941, 1,
-0.167369, 1.904252, -0.8474656, 0, 1, 0.6392157, 1,
-0.1659235, -0.4954048, -1.774011, 0, 1, 0.6470588, 1,
-0.1653367, 0.3777187, -1.906419, 0, 1, 0.6509804, 1,
-0.1643601, 0.9025754, -0.6592278, 0, 1, 0.6588235, 1,
-0.161781, 0.8007454, 0.210247, 0, 1, 0.6627451, 1,
-0.1604219, 2.336709, -0.600832, 0, 1, 0.6705883, 1,
-0.1575489, 0.1014303, -1.351247, 0, 1, 0.6745098, 1,
-0.1548386, 0.2843791, 0.5628909, 0, 1, 0.682353, 1,
-0.1518498, 1.102204, -1.569692, 0, 1, 0.6862745, 1,
-0.1494508, 0.4665832, 0.5116755, 0, 1, 0.6941177, 1,
-0.1456529, 1.302936, -0.4693952, 0, 1, 0.7019608, 1,
-0.1447943, -0.877548, -2.765295, 0, 1, 0.7058824, 1,
-0.1395355, 0.6390673, -1.560376, 0, 1, 0.7137255, 1,
-0.1388626, -1.027427, -2.183358, 0, 1, 0.7176471, 1,
-0.1378192, -0.2185784, -1.866697, 0, 1, 0.7254902, 1,
-0.1366788, 0.4719754, 0.1789183, 0, 1, 0.7294118, 1,
-0.1366175, 2.22175, -1.608705, 0, 1, 0.7372549, 1,
-0.1351739, -0.3261684, -1.757118, 0, 1, 0.7411765, 1,
-0.1269895, -1.188161, -3.2983, 0, 1, 0.7490196, 1,
-0.1269842, 0.02700937, -1.445518, 0, 1, 0.7529412, 1,
-0.1250692, 0.530657, -0.1062403, 0, 1, 0.7607843, 1,
-0.1243742, -1.510455, -2.618795, 0, 1, 0.7647059, 1,
-0.1230934, 0.4344738, -1.40063, 0, 1, 0.772549, 1,
-0.1215651, -0.5064422, -4.159103, 0, 1, 0.7764706, 1,
-0.1158106, 1.193676, 0.6931168, 0, 1, 0.7843137, 1,
-0.1119261, 0.1285098, -1.178255, 0, 1, 0.7882353, 1,
-0.1112643, -0.76165, -3.712402, 0, 1, 0.7960784, 1,
-0.1078972, -1.318081, -1.531182, 0, 1, 0.8039216, 1,
-0.1059928, 0.3589059, 0.08411505, 0, 1, 0.8078431, 1,
-0.1030603, 0.1158764, -0.6029457, 0, 1, 0.8156863, 1,
-0.09782088, -0.06040516, -0.455222, 0, 1, 0.8196079, 1,
-0.09075181, 0.03322504, 0.03779716, 0, 1, 0.827451, 1,
-0.08816969, -0.1560438, -2.17485, 0, 1, 0.8313726, 1,
-0.08083533, -0.795521, -3.57087, 0, 1, 0.8392157, 1,
-0.07811049, -1.030663, -4.10447, 0, 1, 0.8431373, 1,
-0.07616875, 1.43631, 1.533742, 0, 1, 0.8509804, 1,
-0.07257778, 0.7923126, 0.8206372, 0, 1, 0.854902, 1,
-0.06779741, 1.481048, -0.1155839, 0, 1, 0.8627451, 1,
-0.06765897, 1.651616, -1.739654, 0, 1, 0.8666667, 1,
-0.06447853, 0.6577363, 0.3351579, 0, 1, 0.8745098, 1,
-0.06098177, 0.7931364, 0.5713305, 0, 1, 0.8784314, 1,
-0.054647, -1.222601, -3.625487, 0, 1, 0.8862745, 1,
-0.05202158, 0.1194207, -1.824578, 0, 1, 0.8901961, 1,
-0.05121798, 0.7852389, 1.286448, 0, 1, 0.8980392, 1,
-0.05036036, 0.6349879, 1.17912, 0, 1, 0.9058824, 1,
-0.04741783, 1.165979, 1.061165, 0, 1, 0.9098039, 1,
-0.04688157, -0.4017761, -4.010684, 0, 1, 0.9176471, 1,
-0.04384169, 1.227991, 0.3518854, 0, 1, 0.9215686, 1,
-0.04071211, 1.004939, -0.5073052, 0, 1, 0.9294118, 1,
-0.03944091, 0.5114338, -0.5313532, 0, 1, 0.9333333, 1,
-0.03320996, 0.9970567, 0.328719, 0, 1, 0.9411765, 1,
-0.02976713, -0.7058689, -0.638137, 0, 1, 0.945098, 1,
-0.02877247, 1.46384, 1.241524, 0, 1, 0.9529412, 1,
-0.02800558, 0.428588, -0.8508411, 0, 1, 0.9568627, 1,
-0.02522392, -0.7210941, -2.552361, 0, 1, 0.9647059, 1,
-0.01831002, 0.815244, 0.4281799, 0, 1, 0.9686275, 1,
-0.004651895, -0.2839584, -1.181471, 0, 1, 0.9764706, 1,
-0.004173225, 0.5918061, 0.2869503, 0, 1, 0.9803922, 1,
0.002729661, 0.01764974, 0.6366466, 0, 1, 0.9882353, 1,
0.002906522, 0.3137065, -0.2150502, 0, 1, 0.9921569, 1,
0.003820353, 0.977855, 0.3192793, 0, 1, 1, 1,
0.005021852, -2.10476, 1.345971, 0, 0.9921569, 1, 1,
0.00508849, -0.03857401, 3.281484, 0, 0.9882353, 1, 1,
0.009138679, -1.172551, 2.199561, 0, 0.9803922, 1, 1,
0.01238679, 0.7341776, 0.6518504, 0, 0.9764706, 1, 1,
0.01525235, -0.6408986, 1.694136, 0, 0.9686275, 1, 1,
0.01624425, 1.870538, 0.1645485, 0, 0.9647059, 1, 1,
0.01829586, -1.472259, 2.614794, 0, 0.9568627, 1, 1,
0.01913929, -2.60684, 5.740675, 0, 0.9529412, 1, 1,
0.02262996, 0.3572053, -0.7606429, 0, 0.945098, 1, 1,
0.02332944, -2.221097, 4.119413, 0, 0.9411765, 1, 1,
0.02597107, -0.3036251, 3.081332, 0, 0.9333333, 1, 1,
0.02794557, -0.6539888, 4.844405, 0, 0.9294118, 1, 1,
0.03062884, -0.8563063, 3.310965, 0, 0.9215686, 1, 1,
0.03115953, 0.6539282, -0.1099091, 0, 0.9176471, 1, 1,
0.03116497, 1.267137, 0.3158625, 0, 0.9098039, 1, 1,
0.03166642, 1.183754, 0.6313027, 0, 0.9058824, 1, 1,
0.03288658, -0.2877282, 2.651887, 0, 0.8980392, 1, 1,
0.03383288, 2.37241, 0.2870646, 0, 0.8901961, 1, 1,
0.03464094, -0.8489329, 0.6333318, 0, 0.8862745, 1, 1,
0.03515814, -0.4743434, 2.433532, 0, 0.8784314, 1, 1,
0.04177785, -0.5919895, 3.451574, 0, 0.8745098, 1, 1,
0.04195267, -0.4443986, 1.499964, 0, 0.8666667, 1, 1,
0.04628598, 0.4873222, 1.832586, 0, 0.8627451, 1, 1,
0.05698017, -1.224062, 2.073869, 0, 0.854902, 1, 1,
0.05774704, 1.316763, -0.4340452, 0, 0.8509804, 1, 1,
0.0591878, -1.9699, 4.990326, 0, 0.8431373, 1, 1,
0.06343144, 0.8221717, 0.6637174, 0, 0.8392157, 1, 1,
0.06646644, 0.490329, -1.54234, 0, 0.8313726, 1, 1,
0.06736909, -1.806383, 3.380026, 0, 0.827451, 1, 1,
0.06978928, 0.4514128, 0.2687581, 0, 0.8196079, 1, 1,
0.0730416, 0.2724762, -0.5187883, 0, 0.8156863, 1, 1,
0.076596, -0.9788353, 5.406556, 0, 0.8078431, 1, 1,
0.08055549, 1.864523, -0.2246916, 0, 0.8039216, 1, 1,
0.08244528, 1.162955, 0.8750419, 0, 0.7960784, 1, 1,
0.08526275, -2.081179, 0.9781159, 0, 0.7882353, 1, 1,
0.08695848, 0.2720733, -0.169541, 0, 0.7843137, 1, 1,
0.09043057, -0.4354115, 3.598092, 0, 0.7764706, 1, 1,
0.09150806, 0.8066548, 0.1659121, 0, 0.772549, 1, 1,
0.09371157, -0.06527712, 3.347626, 0, 0.7647059, 1, 1,
0.09795871, -1.705318, 1.903761, 0, 0.7607843, 1, 1,
0.09809955, -1.333572, 3.933977, 0, 0.7529412, 1, 1,
0.09871494, 1.822931, -0.9633608, 0, 0.7490196, 1, 1,
0.1008665, -0.6719096, 2.907989, 0, 0.7411765, 1, 1,
0.1079261, -1.304515, 2.737413, 0, 0.7372549, 1, 1,
0.1082406, 0.6963161, -0.4719704, 0, 0.7294118, 1, 1,
0.1097992, -0.5258162, 1.819425, 0, 0.7254902, 1, 1,
0.1131596, 0.8815802, 0.4049966, 0, 0.7176471, 1, 1,
0.1137861, -0.9536639, 3.299233, 0, 0.7137255, 1, 1,
0.1173005, -1.142036, 2.41818, 0, 0.7058824, 1, 1,
0.1177295, 2.106084, -1.173013, 0, 0.6980392, 1, 1,
0.1180947, -1.16063, 4.717742, 0, 0.6941177, 1, 1,
0.1185085, 1.961751, -0.6001113, 0, 0.6862745, 1, 1,
0.1219752, 1.484095, 0.2349452, 0, 0.682353, 1, 1,
0.1222543, -1.299527, 3.262114, 0, 0.6745098, 1, 1,
0.1241759, -0.8153016, 4.212402, 0, 0.6705883, 1, 1,
0.1266288, 0.8067437, 0.4689972, 0, 0.6627451, 1, 1,
0.1326474, -1.205958, 3.848838, 0, 0.6588235, 1, 1,
0.1427955, 0.7484775, 0.03005443, 0, 0.6509804, 1, 1,
0.1429037, -0.5370192, 1.598802, 0, 0.6470588, 1, 1,
0.1482131, -0.2178809, 2.438123, 0, 0.6392157, 1, 1,
0.1500311, 1.819339, -0.02471193, 0, 0.6352941, 1, 1,
0.1519066, -0.6680408, 3.888586, 0, 0.627451, 1, 1,
0.1523965, 0.8411517, -1.353065, 0, 0.6235294, 1, 1,
0.153409, -0.9381341, 2.789232, 0, 0.6156863, 1, 1,
0.1538338, -0.3364327, 3.878556, 0, 0.6117647, 1, 1,
0.1552923, -0.488686, 2.786456, 0, 0.6039216, 1, 1,
0.1666167, -1.668166, 3.655682, 0, 0.5960785, 1, 1,
0.1686202, -0.1732722, 1.6127, 0, 0.5921569, 1, 1,
0.1695358, 0.5932713, 1.040211, 0, 0.5843138, 1, 1,
0.1720855, -0.5321528, 2.364372, 0, 0.5803922, 1, 1,
0.1724915, -0.192132, 3.707161, 0, 0.572549, 1, 1,
0.17344, -0.859386, 1.45457, 0, 0.5686275, 1, 1,
0.1740246, -0.09706944, 2.841828, 0, 0.5607843, 1, 1,
0.1743332, 1.61007, 0.7401399, 0, 0.5568628, 1, 1,
0.1766628, 1.603167, -0.7985974, 0, 0.5490196, 1, 1,
0.1800367, -1.622497, 5.414265, 0, 0.5450981, 1, 1,
0.18587, 1.43753, -0.03046631, 0, 0.5372549, 1, 1,
0.1898915, -0.7256538, 3.112787, 0, 0.5333334, 1, 1,
0.1922062, 2.262321, -1.154807, 0, 0.5254902, 1, 1,
0.1928124, 0.4887806, 1.348, 0, 0.5215687, 1, 1,
0.1939782, -1.021639, 3.606411, 0, 0.5137255, 1, 1,
0.1944068, 0.06231842, 0.8939435, 0, 0.509804, 1, 1,
0.1991902, -0.6041496, 3.225455, 0, 0.5019608, 1, 1,
0.201874, 0.1566224, 0.5212609, 0, 0.4941176, 1, 1,
0.2063281, 1.625193, 0.7070237, 0, 0.4901961, 1, 1,
0.2099179, 0.3624139, 0.1996579, 0, 0.4823529, 1, 1,
0.2153976, 0.09963818, -0.4021855, 0, 0.4784314, 1, 1,
0.2154644, -0.3709981, 2.1885, 0, 0.4705882, 1, 1,
0.220866, 0.151133, 0.296903, 0, 0.4666667, 1, 1,
0.2226712, 0.2364997, 0.2869478, 0, 0.4588235, 1, 1,
0.2253319, 0.1754658, 0.4515703, 0, 0.454902, 1, 1,
0.2256343, -0.8576272, 3.286308, 0, 0.4470588, 1, 1,
0.2275605, -0.2909725, 1.416108, 0, 0.4431373, 1, 1,
0.2280912, 1.247985, 0.5410286, 0, 0.4352941, 1, 1,
0.2288718, 1.892545, 1.252681, 0, 0.4313726, 1, 1,
0.2329545, -1.033734, 3.267768, 0, 0.4235294, 1, 1,
0.2338194, -3.514079, 3.802385, 0, 0.4196078, 1, 1,
0.2445844, 0.07290425, 1.032309, 0, 0.4117647, 1, 1,
0.2452862, -0.2282965, 0.5994739, 0, 0.4078431, 1, 1,
0.2465647, -0.8973699, 3.284684, 0, 0.4, 1, 1,
0.2483253, -1.711609, 1.230862, 0, 0.3921569, 1, 1,
0.2487968, 1.921186, -0.5978737, 0, 0.3882353, 1, 1,
0.2533869, 0.1642024, 2.019433, 0, 0.3803922, 1, 1,
0.2537553, -1.423849, 3.123232, 0, 0.3764706, 1, 1,
0.263192, 0.6361508, 0.5435583, 0, 0.3686275, 1, 1,
0.2660042, -1.754143, 4.031203, 0, 0.3647059, 1, 1,
0.2674225, -0.291402, 2.528392, 0, 0.3568628, 1, 1,
0.268365, 0.5812923, -0.3128056, 0, 0.3529412, 1, 1,
0.2703738, -1.304881, 1.363568, 0, 0.345098, 1, 1,
0.2722609, 0.57522, 1.771969, 0, 0.3411765, 1, 1,
0.2769653, -0.9395855, 2.584861, 0, 0.3333333, 1, 1,
0.2793065, 0.2029586, 0.7661261, 0, 0.3294118, 1, 1,
0.279804, 1.640368, -0.2869805, 0, 0.3215686, 1, 1,
0.280079, 0.2367283, 0.4510379, 0, 0.3176471, 1, 1,
0.2816312, 2.985993, 0.09729032, 0, 0.3098039, 1, 1,
0.2831401, -0.6261867, 2.938735, 0, 0.3058824, 1, 1,
0.283863, 0.4788169, 2.270621, 0, 0.2980392, 1, 1,
0.2844546, 0.613672, -0.3061691, 0, 0.2901961, 1, 1,
0.2872737, 0.0009869979, 2.663957, 0, 0.2862745, 1, 1,
0.2879838, -0.7528929, 3.105579, 0, 0.2784314, 1, 1,
0.2891312, 0.8326027, 1.186598, 0, 0.2745098, 1, 1,
0.2919815, 0.4234568, 1.848945, 0, 0.2666667, 1, 1,
0.2972279, 0.8570282, 1.34762, 0, 0.2627451, 1, 1,
0.3070643, 2.39379, 1.553994, 0, 0.254902, 1, 1,
0.3156541, 0.4242252, 0.9927298, 0, 0.2509804, 1, 1,
0.3175681, 1.549838, 0.05277443, 0, 0.2431373, 1, 1,
0.3179075, 0.6886483, -0.08852313, 0, 0.2392157, 1, 1,
0.3232202, 0.09137721, 2.976244, 0, 0.2313726, 1, 1,
0.3255663, 0.1196806, 0.08296458, 0, 0.227451, 1, 1,
0.3256305, 1.11965, 0.7042111, 0, 0.2196078, 1, 1,
0.3383717, 1.296353, 0.58771, 0, 0.2156863, 1, 1,
0.3412457, 0.4768173, 2.165998, 0, 0.2078431, 1, 1,
0.3431858, -0.4306258, 4.413019, 0, 0.2039216, 1, 1,
0.3446106, 0.4727682, 2.104276, 0, 0.1960784, 1, 1,
0.3462901, 0.1995672, 1.247778, 0, 0.1882353, 1, 1,
0.3469402, -1.4078, 3.190192, 0, 0.1843137, 1, 1,
0.3471253, -1.366684, 1.158457, 0, 0.1764706, 1, 1,
0.3580428, 2.246468, -0.6678305, 0, 0.172549, 1, 1,
0.3615797, -1.723835, 2.380546, 0, 0.1647059, 1, 1,
0.3641476, -0.6273992, 2.208964, 0, 0.1607843, 1, 1,
0.3679557, 0.05243093, 1.925315, 0, 0.1529412, 1, 1,
0.3715806, 0.8557764, 0.04177579, 0, 0.1490196, 1, 1,
0.3736756, 0.2329945, 2.352589, 0, 0.1411765, 1, 1,
0.3747929, 0.7005593, 0.8898445, 0, 0.1372549, 1, 1,
0.3804328, 0.969419, 2.127573, 0, 0.1294118, 1, 1,
0.3894502, -0.9374105, 3.409561, 0, 0.1254902, 1, 1,
0.3899539, 1.533524, -0.3856082, 0, 0.1176471, 1, 1,
0.3939481, 1.763194, -2.001061, 0, 0.1137255, 1, 1,
0.3946531, -1.039301, 3.402419, 0, 0.1058824, 1, 1,
0.3948327, -0.3265633, 3.920264, 0, 0.09803922, 1, 1,
0.3973711, 0.7108776, 0.8336419, 0, 0.09411765, 1, 1,
0.399224, 0.4049364, 0.4238726, 0, 0.08627451, 1, 1,
0.3992465, 1.654875, 0.3160875, 0, 0.08235294, 1, 1,
0.3993994, 0.2722998, -0.918665, 0, 0.07450981, 1, 1,
0.4024282, 0.001939758, 1.796774, 0, 0.07058824, 1, 1,
0.4070912, -1.750068, 1.129439, 0, 0.0627451, 1, 1,
0.4114586, -0.3887019, 0.9663921, 0, 0.05882353, 1, 1,
0.4170199, -0.6023021, 2.531549, 0, 0.05098039, 1, 1,
0.4174795, -0.09786324, 1.410684, 0, 0.04705882, 1, 1,
0.4201311, 0.8031588, 0.1212113, 0, 0.03921569, 1, 1,
0.4253659, -0.3203583, 1.629172, 0, 0.03529412, 1, 1,
0.4255425, -0.976661, 2.000363, 0, 0.02745098, 1, 1,
0.4255553, 0.2421775, 0.368015, 0, 0.02352941, 1, 1,
0.4365159, -1.548284, 0.8607879, 0, 0.01568628, 1, 1,
0.4423127, -0.1958085, 2.98148, 0, 0.01176471, 1, 1,
0.4439518, -0.67874, 1.3163, 0, 0.003921569, 1, 1,
0.4441207, 1.058752, 0.07000584, 0.003921569, 0, 1, 1,
0.4479908, -0.4820882, 2.421049, 0.007843138, 0, 1, 1,
0.455285, -0.3898954, 1.520664, 0.01568628, 0, 1, 1,
0.4567146, -0.5802332, 1.527362, 0.01960784, 0, 1, 1,
0.4580165, 0.02325507, 1.80218, 0.02745098, 0, 1, 1,
0.4585222, -1.318284, 3.162901, 0.03137255, 0, 1, 1,
0.4629266, -1.119251, 3.973006, 0.03921569, 0, 1, 1,
0.4635935, 2.002103, -1.444594, 0.04313726, 0, 1, 1,
0.46521, -0.7205071, 3.293337, 0.05098039, 0, 1, 1,
0.4654314, 0.04352125, 2.840564, 0.05490196, 0, 1, 1,
0.4673147, -0.1124895, 2.658829, 0.0627451, 0, 1, 1,
0.4683911, -0.5912997, 3.49785, 0.06666667, 0, 1, 1,
0.469399, -0.03907545, 1.227367, 0.07450981, 0, 1, 1,
0.4734599, -1.242808, 3.87782, 0.07843138, 0, 1, 1,
0.4765222, 1.041969, -1.942638, 0.08627451, 0, 1, 1,
0.4772291, 2.479631, -0.1707181, 0.09019608, 0, 1, 1,
0.4825145, -0.3730103, 1.887503, 0.09803922, 0, 1, 1,
0.4869697, 0.1943692, -0.7855946, 0.1058824, 0, 1, 1,
0.4899676, -1.209395, 2.858856, 0.1098039, 0, 1, 1,
0.4935809, 0.9951725, 0.7221674, 0.1176471, 0, 1, 1,
0.4956878, -0.1258277, 2.840595, 0.1215686, 0, 1, 1,
0.4959311, 0.9367737, 1.086259, 0.1294118, 0, 1, 1,
0.4977262, -0.2818741, 0.8443525, 0.1333333, 0, 1, 1,
0.5000499, 1.49023, -0.06033127, 0.1411765, 0, 1, 1,
0.5014301, -0.7170405, 1.256328, 0.145098, 0, 1, 1,
0.5063246, 0.6119833, 2.047693, 0.1529412, 0, 1, 1,
0.5072066, -0.4270917, 2.820361, 0.1568628, 0, 1, 1,
0.5085742, 0.8933342, -1.630857, 0.1647059, 0, 1, 1,
0.5089152, 0.2831346, -0.4702923, 0.1686275, 0, 1, 1,
0.5113999, -0.7465398, 1.902506, 0.1764706, 0, 1, 1,
0.5153071, -0.3271782, 1.979011, 0.1803922, 0, 1, 1,
0.5173512, 0.9747087, -1.143009, 0.1882353, 0, 1, 1,
0.5185046, -1.25686, 2.989657, 0.1921569, 0, 1, 1,
0.5197068, 0.2461271, -0.1563539, 0.2, 0, 1, 1,
0.5210257, 0.4762782, 2.251451, 0.2078431, 0, 1, 1,
0.534247, 0.5986068, -0.2698151, 0.2117647, 0, 1, 1,
0.5375381, -0.7516381, 2.13801, 0.2196078, 0, 1, 1,
0.539383, 2.602305, 0.5670602, 0.2235294, 0, 1, 1,
0.5404482, 1.435404, -0.2539064, 0.2313726, 0, 1, 1,
0.541581, -0.8567021, 1.538999, 0.2352941, 0, 1, 1,
0.5464209, 0.5729783, 1.858466, 0.2431373, 0, 1, 1,
0.5527564, -0.7372745, 2.691557, 0.2470588, 0, 1, 1,
0.5544194, 1.471199, 0.8316011, 0.254902, 0, 1, 1,
0.554612, -0.403681, 3.572496, 0.2588235, 0, 1, 1,
0.5591845, -1.036269, 2.532397, 0.2666667, 0, 1, 1,
0.5605571, -0.352016, 3.047677, 0.2705882, 0, 1, 1,
0.5671961, -0.8055286, 2.257569, 0.2784314, 0, 1, 1,
0.5738685, 1.032206, 2.810583, 0.282353, 0, 1, 1,
0.5809308, -0.547502, 0.7513902, 0.2901961, 0, 1, 1,
0.5833707, -0.7237171, 3.114816, 0.2941177, 0, 1, 1,
0.5844814, 1.182465, 2.249708, 0.3019608, 0, 1, 1,
0.588077, 0.8074037, 1.356086, 0.3098039, 0, 1, 1,
0.5892626, 0.03225979, 1.934272, 0.3137255, 0, 1, 1,
0.5905614, -0.5893409, 3.101932, 0.3215686, 0, 1, 1,
0.5927361, -0.5177949, 4.421268, 0.3254902, 0, 1, 1,
0.5975525, -1.892536, 1.811561, 0.3333333, 0, 1, 1,
0.5976043, 0.7982523, 0.3148039, 0.3372549, 0, 1, 1,
0.6004554, -0.6445224, 3.84756, 0.345098, 0, 1, 1,
0.6029012, -0.5728661, 2.937423, 0.3490196, 0, 1, 1,
0.6030561, 0.8679792, -0.1936686, 0.3568628, 0, 1, 1,
0.6034039, 2.266712, -0.334474, 0.3607843, 0, 1, 1,
0.604908, 1.145476, 0.8286756, 0.3686275, 0, 1, 1,
0.6054179, 0.186248, -0.1800625, 0.372549, 0, 1, 1,
0.6181626, -1.291492, 1.010118, 0.3803922, 0, 1, 1,
0.6220512, -0.6135082, 2.364555, 0.3843137, 0, 1, 1,
0.6243805, 0.5734172, -0.7751453, 0.3921569, 0, 1, 1,
0.6257699, 0.6617734, -0.2122444, 0.3960784, 0, 1, 1,
0.6323935, -0.05284579, -0.1226689, 0.4039216, 0, 1, 1,
0.6375577, -0.6722807, 2.62888, 0.4117647, 0, 1, 1,
0.6379268, -2.183616, 0.5165985, 0.4156863, 0, 1, 1,
0.6422858, 0.2564621, 1.327772, 0.4235294, 0, 1, 1,
0.6494604, 0.4073428, 0.8147964, 0.427451, 0, 1, 1,
0.6521589, -0.01195238, 0.2593556, 0.4352941, 0, 1, 1,
0.6539349, 0.144267, 2.589366, 0.4392157, 0, 1, 1,
0.655544, 0.03702832, 3.349761, 0.4470588, 0, 1, 1,
0.6565093, 0.235311, 2.05012, 0.4509804, 0, 1, 1,
0.6618934, 1.580293, 1.38636, 0.4588235, 0, 1, 1,
0.6631904, -0.05381539, 2.206999, 0.4627451, 0, 1, 1,
0.6639439, 0.04003196, 2.088665, 0.4705882, 0, 1, 1,
0.6642323, 1.293632, 0.8684519, 0.4745098, 0, 1, 1,
0.6645108, -1.309093, 2.624934, 0.4823529, 0, 1, 1,
0.6677007, 1.326864, 0.2909895, 0.4862745, 0, 1, 1,
0.6722373, -0.4532773, 0.7580104, 0.4941176, 0, 1, 1,
0.6836166, 0.7087293, 0.347627, 0.5019608, 0, 1, 1,
0.6876666, -1.401227, 3.258306, 0.5058824, 0, 1, 1,
0.6942629, -1.738586, 3.142891, 0.5137255, 0, 1, 1,
0.695709, -0.3560435, 1.100585, 0.5176471, 0, 1, 1,
0.6987834, 0.6736413, -0.07391612, 0.5254902, 0, 1, 1,
0.7003206, 0.4210557, -0.3254048, 0.5294118, 0, 1, 1,
0.7090334, -0.7455325, 0.2188425, 0.5372549, 0, 1, 1,
0.709909, -0.4363367, 2.939144, 0.5411765, 0, 1, 1,
0.7125346, 0.0698916, 1.707798, 0.5490196, 0, 1, 1,
0.7127906, 0.09234673, 1.867912, 0.5529412, 0, 1, 1,
0.7169124, -1.106776, 2.444663, 0.5607843, 0, 1, 1,
0.7191286, -0.4428297, 1.575935, 0.5647059, 0, 1, 1,
0.7199771, 0.4248165, 2.269247, 0.572549, 0, 1, 1,
0.7264723, 0.269611, 0.9835547, 0.5764706, 0, 1, 1,
0.726598, 0.6339551, -0.3987961, 0.5843138, 0, 1, 1,
0.7286251, 0.8885238, -0.04753409, 0.5882353, 0, 1, 1,
0.7356123, 0.2982176, 0.4514495, 0.5960785, 0, 1, 1,
0.7422718, 0.004909683, 1.484983, 0.6039216, 0, 1, 1,
0.7465722, 1.734851, 0.6215228, 0.6078432, 0, 1, 1,
0.7471692, -0.3194403, 1.996449, 0.6156863, 0, 1, 1,
0.7508423, -0.6679778, 1.914541, 0.6196079, 0, 1, 1,
0.7552261, -0.0576565, 2.864381, 0.627451, 0, 1, 1,
0.7612576, -0.8648509, 3.600698, 0.6313726, 0, 1, 1,
0.7625465, -0.001158818, 1.072666, 0.6392157, 0, 1, 1,
0.7627072, 0.05770544, 1.768726, 0.6431373, 0, 1, 1,
0.7629641, -2.694085, 2.533315, 0.6509804, 0, 1, 1,
0.7656916, 0.4865729, 1.261874, 0.654902, 0, 1, 1,
0.7663572, -0.9066735, 2.839992, 0.6627451, 0, 1, 1,
0.7692755, 0.3364756, 1.655677, 0.6666667, 0, 1, 1,
0.7719035, -0.9779443, -0.08956664, 0.6745098, 0, 1, 1,
0.7739318, -0.2256913, 4.40954, 0.6784314, 0, 1, 1,
0.7758691, 0.6208956, -0.5033354, 0.6862745, 0, 1, 1,
0.7764907, 0.004391418, -0.1712757, 0.6901961, 0, 1, 1,
0.7822532, -1.294822, 4.064257, 0.6980392, 0, 1, 1,
0.7836069, 1.400947, -1.289868, 0.7058824, 0, 1, 1,
0.7864882, 0.3050342, 1.721063, 0.7098039, 0, 1, 1,
0.787416, -1.589152, 2.51139, 0.7176471, 0, 1, 1,
0.7903404, 1.137465, -0.5128301, 0.7215686, 0, 1, 1,
0.791705, 0.05156512, 1.402701, 0.7294118, 0, 1, 1,
0.8051022, 1.500462, 1.261692, 0.7333333, 0, 1, 1,
0.8074927, -1.243531, 2.119565, 0.7411765, 0, 1, 1,
0.8083292, -0.5565721, 2.835227, 0.7450981, 0, 1, 1,
0.8109801, 0.9585071, -1.140468, 0.7529412, 0, 1, 1,
0.8117805, -0.3943993, 2.822961, 0.7568628, 0, 1, 1,
0.825381, -0.5579502, 2.112445, 0.7647059, 0, 1, 1,
0.8262474, -1.134028, 3.263453, 0.7686275, 0, 1, 1,
0.8263642, -0.2341676, 2.170243, 0.7764706, 0, 1, 1,
0.8354499, -0.7196989, 1.145915, 0.7803922, 0, 1, 1,
0.836939, -0.8559973, 2.732366, 0.7882353, 0, 1, 1,
0.837259, -1.248789, 0.2586736, 0.7921569, 0, 1, 1,
0.8383544, -1.146239, 0.553752, 0.8, 0, 1, 1,
0.841947, 1.050679, 0.4507707, 0.8078431, 0, 1, 1,
0.8467149, 0.2775557, 3.419156, 0.8117647, 0, 1, 1,
0.8485898, -0.3022019, 1.374938, 0.8196079, 0, 1, 1,
0.8499858, -1.472352, 2.472178, 0.8235294, 0, 1, 1,
0.8518924, 0.9064032, 0.6095229, 0.8313726, 0, 1, 1,
0.8520523, 1.3805, -0.4241706, 0.8352941, 0, 1, 1,
0.8569165, -0.02848841, 1.523654, 0.8431373, 0, 1, 1,
0.8582084, 0.8163111, -0.6299479, 0.8470588, 0, 1, 1,
0.8650198, 0.8641874, -0.1628864, 0.854902, 0, 1, 1,
0.8686839, 0.324905, 1.903723, 0.8588235, 0, 1, 1,
0.8710701, -1.214824, 4.190311, 0.8666667, 0, 1, 1,
0.8717268, -1.067094, 1.432181, 0.8705882, 0, 1, 1,
0.8890142, 0.07889022, -1.336487, 0.8784314, 0, 1, 1,
0.8922443, 1.103722, 1.048252, 0.8823529, 0, 1, 1,
0.8931031, 1.034952, 1.841376, 0.8901961, 0, 1, 1,
0.8937283, -0.4891627, 1.998785, 0.8941177, 0, 1, 1,
0.9016167, 0.2969621, 2.463313, 0.9019608, 0, 1, 1,
0.9081658, 1.217167, 0.2795147, 0.9098039, 0, 1, 1,
0.914181, 0.2880919, 0.7222065, 0.9137255, 0, 1, 1,
0.9212041, 0.5765826, 0.411832, 0.9215686, 0, 1, 1,
0.9291098, -1.546567, 3.805992, 0.9254902, 0, 1, 1,
0.93186, 0.9280567, -0.9345055, 0.9333333, 0, 1, 1,
0.9357747, -0.4633996, 3.290711, 0.9372549, 0, 1, 1,
0.937116, -1.381845, 2.814925, 0.945098, 0, 1, 1,
0.9399426, 1.342737, 1.16157, 0.9490196, 0, 1, 1,
0.9416533, -0.315626, 1.213892, 0.9568627, 0, 1, 1,
0.9417423, -0.4017532, 1.781088, 0.9607843, 0, 1, 1,
0.9438134, -1.048912, 1.749067, 0.9686275, 0, 1, 1,
0.9441295, -0.5664439, 1.175433, 0.972549, 0, 1, 1,
0.9542617, 0.4872356, -1.144512, 0.9803922, 0, 1, 1,
0.9547257, -0.286562, 0.08314968, 0.9843137, 0, 1, 1,
0.9577382, 0.0979262, 1.427105, 0.9921569, 0, 1, 1,
0.9584986, 0.3763729, 1.30847, 0.9960784, 0, 1, 1,
0.9606774, 0.8422847, 0.2929166, 1, 0, 0.9960784, 1,
0.9643867, -1.074085, 1.561105, 1, 0, 0.9882353, 1,
0.969757, 0.4766857, 0.03224627, 1, 0, 0.9843137, 1,
0.982178, 0.7068924, 0.7986393, 1, 0, 0.9764706, 1,
0.9874802, -1.880415, 1.973196, 1, 0, 0.972549, 1,
0.9957189, 1.03994, 1.15923, 1, 0, 0.9647059, 1,
1.002224, 0.3996343, 1.334903, 1, 0, 0.9607843, 1,
1.003163, -1.056597, 1.76676, 1, 0, 0.9529412, 1,
1.007905, 0.1217824, 2.226417, 1, 0, 0.9490196, 1,
1.020476, -0.1608209, 2.120244, 1, 0, 0.9411765, 1,
1.021991, -0.238792, -0.847933, 1, 0, 0.9372549, 1,
1.02814, 0.3949299, 1.497889, 1, 0, 0.9294118, 1,
1.031728, -0.9499015, 2.843861, 1, 0, 0.9254902, 1,
1.032468, -0.8379875, 2.064533, 1, 0, 0.9176471, 1,
1.035164, -0.6214257, 3.60511, 1, 0, 0.9137255, 1,
1.037259, 0.7139169, 1.403759, 1, 0, 0.9058824, 1,
1.040051, 0.6016169, 2.156518, 1, 0, 0.9019608, 1,
1.045758, 2.11475, 1.117808, 1, 0, 0.8941177, 1,
1.047563, 1.323072, 0.7272465, 1, 0, 0.8862745, 1,
1.05432, -0.2637089, 1.84327, 1, 0, 0.8823529, 1,
1.057483, 0.05537177, 1.639509, 1, 0, 0.8745098, 1,
1.057535, 0.7796226, 0.9073064, 1, 0, 0.8705882, 1,
1.058162, 0.4462079, 1.146869, 1, 0, 0.8627451, 1,
1.061304, 0.5682048, 1.218881, 1, 0, 0.8588235, 1,
1.062549, -1.263432, 1.432837, 1, 0, 0.8509804, 1,
1.069551, 1.281859, -0.8300294, 1, 0, 0.8470588, 1,
1.070285, -2.670514, 3.099017, 1, 0, 0.8392157, 1,
1.083004, -1.849028, 2.291165, 1, 0, 0.8352941, 1,
1.086747, 0.912287, 1.300316, 1, 0, 0.827451, 1,
1.093222, -0.6454322, 1.86157, 1, 0, 0.8235294, 1,
1.09721, -1.392487, 3.55179, 1, 0, 0.8156863, 1,
1.098907, 1.314215, 0.5063213, 1, 0, 0.8117647, 1,
1.10177, 1.685136, -0.5578261, 1, 0, 0.8039216, 1,
1.115724, 0.1792297, 1.072447, 1, 0, 0.7960784, 1,
1.117429, 0.1999234, 1.334581, 1, 0, 0.7921569, 1,
1.144544, -0.2103563, 0.9673245, 1, 0, 0.7843137, 1,
1.15393, 0.9714202, 0.08186857, 1, 0, 0.7803922, 1,
1.163877, 1.152134, 0.7138088, 1, 0, 0.772549, 1,
1.16587, -0.6825464, 3.18794, 1, 0, 0.7686275, 1,
1.166744, 1.665667, 2.209111, 1, 0, 0.7607843, 1,
1.204116, 0.2530106, 0.5368459, 1, 0, 0.7568628, 1,
1.210724, 0.8971974, 0.3388384, 1, 0, 0.7490196, 1,
1.224229, 0.6232591, 0.9060614, 1, 0, 0.7450981, 1,
1.227543, -0.373787, 2.724636, 1, 0, 0.7372549, 1,
1.233879, 0.4384269, 0.7637208, 1, 0, 0.7333333, 1,
1.237723, 0.8480038, 0.4745861, 1, 0, 0.7254902, 1,
1.240369, -1.661698, 3.424945, 1, 0, 0.7215686, 1,
1.243238, -0.2908812, 1.312871, 1, 0, 0.7137255, 1,
1.248594, 0.5299786, 2.719925, 1, 0, 0.7098039, 1,
1.256877, 0.2882208, 0.5659226, 1, 0, 0.7019608, 1,
1.258832, 0.5939283, 0.28355, 1, 0, 0.6941177, 1,
1.259805, 0.4568768, 0.696644, 1, 0, 0.6901961, 1,
1.261752, -0.3045702, 1.793657, 1, 0, 0.682353, 1,
1.266063, -0.2872841, 1.540481, 1, 0, 0.6784314, 1,
1.270161, -0.3795961, 1.888217, 1, 0, 0.6705883, 1,
1.272241, -1.17186, 4.116196, 1, 0, 0.6666667, 1,
1.273579, 0.6274498, 3.104546, 1, 0, 0.6588235, 1,
1.279556, -2.165293, 2.757315, 1, 0, 0.654902, 1,
1.283757, -0.8342687, 1.908515, 1, 0, 0.6470588, 1,
1.289219, 0.7040848, -1.349266, 1, 0, 0.6431373, 1,
1.291299, 0.2450108, 2.277989, 1, 0, 0.6352941, 1,
1.292142, -1.742856, 1.244684, 1, 0, 0.6313726, 1,
1.297807, 0.2679424, 0.59631, 1, 0, 0.6235294, 1,
1.314566, -0.4268427, 0.1168805, 1, 0, 0.6196079, 1,
1.32374, -1.49763, 1.789196, 1, 0, 0.6117647, 1,
1.324008, -0.5238997, 1.271852, 1, 0, 0.6078432, 1,
1.328787, -0.2892187, 2.266692, 1, 0, 0.6, 1,
1.33489, 1.90902, 1.51895, 1, 0, 0.5921569, 1,
1.340968, 1.614162, 2.096396, 1, 0, 0.5882353, 1,
1.343614, -0.3285275, 1.523942, 1, 0, 0.5803922, 1,
1.345889, 0.7798879, 4.012644, 1, 0, 0.5764706, 1,
1.351236, -0.3419232, 1.99253, 1, 0, 0.5686275, 1,
1.353307, 0.4313299, 2.167133, 1, 0, 0.5647059, 1,
1.368162, -2.273551, 2.43148, 1, 0, 0.5568628, 1,
1.372043, 0.1258999, 0.4406201, 1, 0, 0.5529412, 1,
1.376371, -1.090335, 2.23507, 1, 0, 0.5450981, 1,
1.376856, -1.185956, 1.666064, 1, 0, 0.5411765, 1,
1.377259, -1.238677, 2.740185, 1, 0, 0.5333334, 1,
1.381697, -1.139683, 1.750194, 1, 0, 0.5294118, 1,
1.383164, -2.306223, 2.098801, 1, 0, 0.5215687, 1,
1.391513, -0.8862064, 3.021796, 1, 0, 0.5176471, 1,
1.411535, -0.4239191, 0.4345533, 1, 0, 0.509804, 1,
1.412643, 0.3062336, 1.188722, 1, 0, 0.5058824, 1,
1.412867, 1.500914, 1.99405, 1, 0, 0.4980392, 1,
1.416492, 0.8026608, -0.2819158, 1, 0, 0.4901961, 1,
1.422912, -1.251743, 1.189646, 1, 0, 0.4862745, 1,
1.447147, 0.4058471, 2.023213, 1, 0, 0.4784314, 1,
1.458543, 0.9260246, -0.6788437, 1, 0, 0.4745098, 1,
1.460378, -1.149677, 0.03346612, 1, 0, 0.4666667, 1,
1.463915, 1.590981, 1.692021, 1, 0, 0.4627451, 1,
1.476282, -1.249696, 2.73424, 1, 0, 0.454902, 1,
1.484332, 0.5083345, 2.02928, 1, 0, 0.4509804, 1,
1.500334, -0.0619629, 1.267421, 1, 0, 0.4431373, 1,
1.504974, -1.07752, 1.505604, 1, 0, 0.4392157, 1,
1.511756, 1.311139, 1.176643, 1, 0, 0.4313726, 1,
1.511944, 0.6715347, 0.2707167, 1, 0, 0.427451, 1,
1.513899, 0.7854545, -0.02834645, 1, 0, 0.4196078, 1,
1.514111, -1.554559, 0.9126325, 1, 0, 0.4156863, 1,
1.515327, -0.1230981, 2.606228, 1, 0, 0.4078431, 1,
1.54547, 1.255115, -0.3630705, 1, 0, 0.4039216, 1,
1.58209, -0.9192191, 3.392176, 1, 0, 0.3960784, 1,
1.595346, -0.341053, 1.687281, 1, 0, 0.3882353, 1,
1.598011, 0.4811184, 1.432503, 1, 0, 0.3843137, 1,
1.605902, -0.1670917, 3.264334, 1, 0, 0.3764706, 1,
1.622202, 0.4679476, -0.2795329, 1, 0, 0.372549, 1,
1.624703, 1.123874, 1.7474, 1, 0, 0.3647059, 1,
1.638778, 0.07370968, 0.586274, 1, 0, 0.3607843, 1,
1.646619, -0.1754202, 1.823259, 1, 0, 0.3529412, 1,
1.651234, 1.410413, -0.1534314, 1, 0, 0.3490196, 1,
1.65664, -0.7050646, -0.322009, 1, 0, 0.3411765, 1,
1.657766, -0.6282723, 0.7235412, 1, 0, 0.3372549, 1,
1.657985, 1.435952, 1.668992, 1, 0, 0.3294118, 1,
1.666512, 0.8185948, 0.7672209, 1, 0, 0.3254902, 1,
1.66731, -0.8460817, 1.727911, 1, 0, 0.3176471, 1,
1.678972, 0.820587, 0.02928554, 1, 0, 0.3137255, 1,
1.705563, 1.028343, 1.791819, 1, 0, 0.3058824, 1,
1.748349, -1.248255, 3.784594, 1, 0, 0.2980392, 1,
1.760157, 0.0438223, 2.529046, 1, 0, 0.2941177, 1,
1.761311, -1.252117, 2.451213, 1, 0, 0.2862745, 1,
1.771259, -0.3677611, 1.678599, 1, 0, 0.282353, 1,
1.774681, -0.3299696, 0.5647939, 1, 0, 0.2745098, 1,
1.784442, -1.498709, 1.073005, 1, 0, 0.2705882, 1,
1.789746, 0.298472, 1.234569, 1, 0, 0.2627451, 1,
1.795139, -2.076628, 2.757095, 1, 0, 0.2588235, 1,
1.795645, 0.5612209, 2.325731, 1, 0, 0.2509804, 1,
1.796847, -0.7728956, 2.018744, 1, 0, 0.2470588, 1,
1.796861, -0.4170778, 1.962717, 1, 0, 0.2392157, 1,
1.798235, 1.33554, 1.409705, 1, 0, 0.2352941, 1,
1.804278, 1.085513, 1.390108, 1, 0, 0.227451, 1,
1.81283, 0.3684113, 1.153278, 1, 0, 0.2235294, 1,
1.813141, -0.6700931, 2.426438, 1, 0, 0.2156863, 1,
1.826061, -0.1553906, 0.8517426, 1, 0, 0.2117647, 1,
1.830731, -0.2041541, 4.150777, 1, 0, 0.2039216, 1,
1.832304, 0.8298423, 0.7501903, 1, 0, 0.1960784, 1,
1.83672, 0.3529105, 1.612648, 1, 0, 0.1921569, 1,
1.838325, -1.421201, 3.739249, 1, 0, 0.1843137, 1,
1.844333, 1.184915, 0.1953017, 1, 0, 0.1803922, 1,
1.848785, -0.704626, 2.08076, 1, 0, 0.172549, 1,
1.851838, 0.5037772, 1.075278, 1, 0, 0.1686275, 1,
1.859099, -0.4054578, 3.16024, 1, 0, 0.1607843, 1,
1.905875, -1.723085, 1.796857, 1, 0, 0.1568628, 1,
1.907394, -0.003328449, 0.4542396, 1, 0, 0.1490196, 1,
1.910591, 0.5926128, 1.148468, 1, 0, 0.145098, 1,
1.935797, -0.9181063, 2.4754, 1, 0, 0.1372549, 1,
1.947633, 0.4120637, 0.3670586, 1, 0, 0.1333333, 1,
1.95292, -0.1735608, 1.975073, 1, 0, 0.1254902, 1,
1.963398, 1.127411, 2.025272, 1, 0, 0.1215686, 1,
1.982462, -0.05167852, 1.890874, 1, 0, 0.1137255, 1,
1.98414, -1.295705, 2.149725, 1, 0, 0.1098039, 1,
1.993976, 0.581071, 0.5574283, 1, 0, 0.1019608, 1,
2.019615, 0.419398, 0.7514823, 1, 0, 0.09411765, 1,
2.038767, 1.094212, 2.904436, 1, 0, 0.09019608, 1,
2.063325, -0.6863325, 2.689907, 1, 0, 0.08235294, 1,
2.106361, 1.062554, 1.44032, 1, 0, 0.07843138, 1,
2.137087, 1.931247, 0.552588, 1, 0, 0.07058824, 1,
2.290423, -0.1611396, 0.9426039, 1, 0, 0.06666667, 1,
2.301752, 2.359962, 1.765815, 1, 0, 0.05882353, 1,
2.31416, 0.694201, 0.9718884, 1, 0, 0.05490196, 1,
2.421104, -0.8272908, 0.05585893, 1, 0, 0.04705882, 1,
2.424243, -1.26549, 0.7485641, 1, 0, 0.04313726, 1,
2.424681, 0.6226528, -0.9873027, 1, 0, 0.03529412, 1,
2.449709, -1.087997, 2.483876, 1, 0, 0.03137255, 1,
2.459529, -0.7835028, 3.290373, 1, 0, 0.02352941, 1,
2.566615, 0.1676923, 1.86208, 1, 0, 0.01960784, 1,
2.623373, -0.04171128, 1.069522, 1, 0, 0.01176471, 1,
2.730311, -1.036227, 4.09852, 1, 0, 0.007843138, 1
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
-0.2261167, -4.615841, -6.139192, 0, -0.5, 0.5, 0.5,
-0.2261167, -4.615841, -6.139192, 1, -0.5, 0.5, 0.5,
-0.2261167, -4.615841, -6.139192, 1, 1.5, 0.5, 0.5,
-0.2261167, -4.615841, -6.139192, 0, 1.5, 0.5, 0.5
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
-4.184774, -0.2640431, -6.139192, 0, -0.5, 0.5, 0.5,
-4.184774, -0.2640431, -6.139192, 1, -0.5, 0.5, 0.5,
-4.184774, -0.2640431, -6.139192, 1, 1.5, 0.5, 0.5,
-4.184774, -0.2640431, -6.139192, 0, 1.5, 0.5, 0.5
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
-4.184774, -4.615841, 0.6616385, 0, -0.5, 0.5, 0.5,
-4.184774, -4.615841, 0.6616385, 1, -0.5, 0.5, 0.5,
-4.184774, -4.615841, 0.6616385, 1, 1.5, 0.5, 0.5,
-4.184774, -4.615841, 0.6616385, 0, 1.5, 0.5, 0.5
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
-3, -3.61158, -4.569769,
2, -3.61158, -4.569769,
-3, -3.61158, -4.569769,
-3, -3.778957, -4.83134,
-2, -3.61158, -4.569769,
-2, -3.778957, -4.83134,
-1, -3.61158, -4.569769,
-1, -3.778957, -4.83134,
0, -3.61158, -4.569769,
0, -3.778957, -4.83134,
1, -3.61158, -4.569769,
1, -3.778957, -4.83134,
2, -3.61158, -4.569769,
2, -3.778957, -4.83134
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
-3, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
-3, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
-3, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
-3, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5,
-2, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
-2, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
-2, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
-2, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5,
-1, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
-1, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
-1, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
-1, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5,
0, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
0, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
0, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
0, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5,
1, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
1, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
1, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
1, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5,
2, -4.11371, -5.354481, 0, -0.5, 0.5, 0.5,
2, -4.11371, -5.354481, 1, -0.5, 0.5, 0.5,
2, -4.11371, -5.354481, 1, 1.5, 0.5, 0.5,
2, -4.11371, -5.354481, 0, 1.5, 0.5, 0.5
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
-3.271238, -3, -4.569769,
-3.271238, 2, -4.569769,
-3.271238, -3, -4.569769,
-3.423494, -3, -4.83134,
-3.271238, -2, -4.569769,
-3.423494, -2, -4.83134,
-3.271238, -1, -4.569769,
-3.423494, -1, -4.83134,
-3.271238, 0, -4.569769,
-3.423494, 0, -4.83134,
-3.271238, 1, -4.569769,
-3.423494, 1, -4.83134,
-3.271238, 2, -4.569769,
-3.423494, 2, -4.83134
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
-3.728006, -3, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, -3, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, -3, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, -3, -5.354481, 0, 1.5, 0.5, 0.5,
-3.728006, -2, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, -2, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, -2, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, -2, -5.354481, 0, 1.5, 0.5, 0.5,
-3.728006, -1, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, -1, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, -1, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, -1, -5.354481, 0, 1.5, 0.5, 0.5,
-3.728006, 0, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, 0, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, 0, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, 0, -5.354481, 0, 1.5, 0.5, 0.5,
-3.728006, 1, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, 1, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, 1, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, 1, -5.354481, 0, 1.5, 0.5, 0.5,
-3.728006, 2, -5.354481, 0, -0.5, 0.5, 0.5,
-3.728006, 2, -5.354481, 1, -0.5, 0.5, 0.5,
-3.728006, 2, -5.354481, 1, 1.5, 0.5, 0.5,
-3.728006, 2, -5.354481, 0, 1.5, 0.5, 0.5
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
-3.271238, -3.61158, -4,
-3.271238, -3.61158, 4,
-3.271238, -3.61158, -4,
-3.423494, -3.778957, -4,
-3.271238, -3.61158, -2,
-3.423494, -3.778957, -2,
-3.271238, -3.61158, 0,
-3.423494, -3.778957, 0,
-3.271238, -3.61158, 2,
-3.423494, -3.778957, 2,
-3.271238, -3.61158, 4,
-3.423494, -3.778957, 4
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
-3.728006, -4.11371, -4, 0, -0.5, 0.5, 0.5,
-3.728006, -4.11371, -4, 1, -0.5, 0.5, 0.5,
-3.728006, -4.11371, -4, 1, 1.5, 0.5, 0.5,
-3.728006, -4.11371, -4, 0, 1.5, 0.5, 0.5,
-3.728006, -4.11371, -2, 0, -0.5, 0.5, 0.5,
-3.728006, -4.11371, -2, 1, -0.5, 0.5, 0.5,
-3.728006, -4.11371, -2, 1, 1.5, 0.5, 0.5,
-3.728006, -4.11371, -2, 0, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 0, 0, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 0, 1, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 0, 1, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 0, 0, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 2, 0, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 2, 1, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 2, 1, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 2, 0, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 4, 0, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 4, 1, -0.5, 0.5, 0.5,
-3.728006, -4.11371, 4, 1, 1.5, 0.5, 0.5,
-3.728006, -4.11371, 4, 0, 1.5, 0.5, 0.5
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
-3.271238, -3.61158, -4.569769,
-3.271238, 3.083494, -4.569769,
-3.271238, -3.61158, 5.893046,
-3.271238, 3.083494, 5.893046,
-3.271238, -3.61158, -4.569769,
-3.271238, -3.61158, 5.893046,
-3.271238, 3.083494, -4.569769,
-3.271238, 3.083494, 5.893046,
-3.271238, -3.61158, -4.569769,
2.819004, -3.61158, -4.569769,
-3.271238, -3.61158, 5.893046,
2.819004, -3.61158, 5.893046,
-3.271238, 3.083494, -4.569769,
2.819004, 3.083494, -4.569769,
-3.271238, 3.083494, 5.893046,
2.819004, 3.083494, 5.893046,
2.819004, -3.61158, -4.569769,
2.819004, 3.083494, -4.569769,
2.819004, -3.61158, 5.893046,
2.819004, 3.083494, 5.893046,
2.819004, -3.61158, -4.569769,
2.819004, -3.61158, 5.893046,
2.819004, 3.083494, -4.569769,
2.819004, 3.083494, 5.893046
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
var radius = 7.387204;
var distance = 32.8665;
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
mvMatrix.translate( 0.2261167, 0.2640431, -0.6616385 );
mvMatrix.scale( 1.311473, 1.192995, 0.7633881 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.8665);
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


