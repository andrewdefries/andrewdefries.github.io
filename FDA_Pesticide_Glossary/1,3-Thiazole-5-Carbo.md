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
-3.387789, -0.04764443, -1.974509, 1, 0, 0, 1,
-3.223737, -0.2333405, -0.3485129, 1, 0.007843138, 0, 1,
-3.143152, -0.6461088, -4.898152, 1, 0.01176471, 0, 1,
-2.865251, -0.05468739, -1.267101, 1, 0.01960784, 0, 1,
-2.864208, 0.8228103, -0.5377084, 1, 0.02352941, 0, 1,
-2.70474, 0.9361891, -2.68755, 1, 0.03137255, 0, 1,
-2.550814, -0.9187227, -2.238857, 1, 0.03529412, 0, 1,
-2.547451, 0.8832039, -1.102218, 1, 0.04313726, 0, 1,
-2.453035, -0.2279782, -3.658521, 1, 0.04705882, 0, 1,
-2.366656, 0.2072547, -1.466628, 1, 0.05490196, 0, 1,
-2.363836, -1.136908, -3.472411, 1, 0.05882353, 0, 1,
-2.333857, -0.4688486, -2.104252, 1, 0.06666667, 0, 1,
-2.196883, 0.1007514, -0.5001187, 1, 0.07058824, 0, 1,
-2.183237, 0.4676036, 0.5072196, 1, 0.07843138, 0, 1,
-2.165945, -0.2553664, -0.4623426, 1, 0.08235294, 0, 1,
-2.146942, 0.3176099, -0.3156792, 1, 0.09019608, 0, 1,
-2.11229, 0.05371283, -1.953686, 1, 0.09411765, 0, 1,
-2.069682, -0.4657476, -0.8428161, 1, 0.1019608, 0, 1,
-2.05737, -0.4671202, -0.258309, 1, 0.1098039, 0, 1,
-2.052953, 0.2153694, -0.9736969, 1, 0.1137255, 0, 1,
-2.023341, 1.037877, -1.119853, 1, 0.1215686, 0, 1,
-1.991186, -0.3303293, -1.349647, 1, 0.1254902, 0, 1,
-1.990363, -0.02226004, -1.048244, 1, 0.1333333, 0, 1,
-1.976227, 0.7725211, -1.968545, 1, 0.1372549, 0, 1,
-1.961894, -1.578919, -0.3603382, 1, 0.145098, 0, 1,
-1.928373, -0.2361106, -0.7024689, 1, 0.1490196, 0, 1,
-1.916751, 0.02960068, -2.839119, 1, 0.1568628, 0, 1,
-1.904265, 1.022443, -1.826589, 1, 0.1607843, 0, 1,
-1.898109, 0.3909998, -1.743453, 1, 0.1686275, 0, 1,
-1.878051, -2.150258, -0.9265407, 1, 0.172549, 0, 1,
-1.82835, 0.4406416, -0.755482, 1, 0.1803922, 0, 1,
-1.826137, 0.007476258, -3.814605, 1, 0.1843137, 0, 1,
-1.808694, 0.5663252, -1.390238, 1, 0.1921569, 0, 1,
-1.791534, -0.4406359, -1.345587, 1, 0.1960784, 0, 1,
-1.782288, 0.01874828, -2.202018, 1, 0.2039216, 0, 1,
-1.780846, -1.004326, -2.190152, 1, 0.2117647, 0, 1,
-1.765498, 1.165025, 0.2840121, 1, 0.2156863, 0, 1,
-1.759386, 0.6447114, -0.267181, 1, 0.2235294, 0, 1,
-1.744924, 0.5613272, -2.345817, 1, 0.227451, 0, 1,
-1.739881, -0.4533219, -1.136923, 1, 0.2352941, 0, 1,
-1.732929, 1.210222, -0.5431564, 1, 0.2392157, 0, 1,
-1.729456, 1.446284, -1.880144, 1, 0.2470588, 0, 1,
-1.703078, 0.2703016, -0.2230323, 1, 0.2509804, 0, 1,
-1.676524, 0.07078964, -2.386708, 1, 0.2588235, 0, 1,
-1.67033, 0.2996095, -1.717472, 1, 0.2627451, 0, 1,
-1.666695, 1.013708, -2.78077, 1, 0.2705882, 0, 1,
-1.655847, 0.0193173, -2.541666, 1, 0.2745098, 0, 1,
-1.651853, 0.4368, -2.091044, 1, 0.282353, 0, 1,
-1.64699, -1.607171, -3.584373, 1, 0.2862745, 0, 1,
-1.63891, 0.4398855, -1.66214, 1, 0.2941177, 0, 1,
-1.632278, 0.03665221, -0.6999891, 1, 0.3019608, 0, 1,
-1.631711, 0.250444, -1.407638, 1, 0.3058824, 0, 1,
-1.624476, -0.03080667, -4.17487, 1, 0.3137255, 0, 1,
-1.617584, 0.01138726, -1.909186, 1, 0.3176471, 0, 1,
-1.595408, 0.01418377, -2.052314, 1, 0.3254902, 0, 1,
-1.589364, -0.3546179, -2.443108, 1, 0.3294118, 0, 1,
-1.584556, -0.7522392, -0.1643179, 1, 0.3372549, 0, 1,
-1.576721, 1.446271, -0.4334367, 1, 0.3411765, 0, 1,
-1.574962, -0.8975495, -2.736667, 1, 0.3490196, 0, 1,
-1.570284, 0.5649107, -1.651923, 1, 0.3529412, 0, 1,
-1.559982, 2.331295, 1.175901, 1, 0.3607843, 0, 1,
-1.552163, -0.480831, -1.74537, 1, 0.3647059, 0, 1,
-1.549088, -1.149833, -1.656348, 1, 0.372549, 0, 1,
-1.53052, -0.4100018, -2.091083, 1, 0.3764706, 0, 1,
-1.51801, 0.3325887, -2.043236, 1, 0.3843137, 0, 1,
-1.510242, 1.432776, -1.227259, 1, 0.3882353, 0, 1,
-1.509447, -0.5790223, -1.107949, 1, 0.3960784, 0, 1,
-1.505949, 0.5113299, -0.2725998, 1, 0.4039216, 0, 1,
-1.504516, -0.7889851, -1.326646, 1, 0.4078431, 0, 1,
-1.500726, 0.3316482, -1.587129, 1, 0.4156863, 0, 1,
-1.473545, -0.5146369, -3.433899, 1, 0.4196078, 0, 1,
-1.447193, -1.715297, -3.030959, 1, 0.427451, 0, 1,
-1.445112, -0.1082168, 0.0007587701, 1, 0.4313726, 0, 1,
-1.440233, -0.1982987, -1.152937, 1, 0.4392157, 0, 1,
-1.435386, -0.5250587, -2.015415, 1, 0.4431373, 0, 1,
-1.422638, -0.7245019, -2.00687, 1, 0.4509804, 0, 1,
-1.410475, 0.4259437, -1.264409, 1, 0.454902, 0, 1,
-1.401117, -0.843313, 0.1094785, 1, 0.4627451, 0, 1,
-1.39975, 1.244845, -2.415773, 1, 0.4666667, 0, 1,
-1.391068, -0.1033991, -1.588666, 1, 0.4745098, 0, 1,
-1.389613, -0.3171361, -1.73419, 1, 0.4784314, 0, 1,
-1.367231, -0.07887172, -3.154001, 1, 0.4862745, 0, 1,
-1.353203, -1.111035, -2.571991, 1, 0.4901961, 0, 1,
-1.351531, 0.6711113, -1.120245, 1, 0.4980392, 0, 1,
-1.348773, -1.306879, -2.749849, 1, 0.5058824, 0, 1,
-1.348549, 0.9083388, -3.078221, 1, 0.509804, 0, 1,
-1.341951, -1.117031, -2.232324, 1, 0.5176471, 0, 1,
-1.338727, -1.343274, -2.714115, 1, 0.5215687, 0, 1,
-1.3301, -0.03591197, -1.266902, 1, 0.5294118, 0, 1,
-1.328529, 2.008723, -1.53207, 1, 0.5333334, 0, 1,
-1.318714, 0.4686021, -0.8002895, 1, 0.5411765, 0, 1,
-1.301413, -1.578937, -1.474278, 1, 0.5450981, 0, 1,
-1.295694, 1.906684, -0.5384023, 1, 0.5529412, 0, 1,
-1.292593, -0.3185247, -0.960573, 1, 0.5568628, 0, 1,
-1.289, -0.7244018, -0.6701066, 1, 0.5647059, 0, 1,
-1.288753, 1.634216, -0.725033, 1, 0.5686275, 0, 1,
-1.286438, -0.9618763, -2.52067, 1, 0.5764706, 0, 1,
-1.283863, 1.01135, -3.394161, 1, 0.5803922, 0, 1,
-1.274662, 1.951375, -1.602724, 1, 0.5882353, 0, 1,
-1.274112, 0.6179892, -0.4390589, 1, 0.5921569, 0, 1,
-1.25664, -0.2694117, -1.010941, 1, 0.6, 0, 1,
-1.254315, -1.023302, -2.428752, 1, 0.6078432, 0, 1,
-1.250866, -0.2902544, -2.564762, 1, 0.6117647, 0, 1,
-1.248891, -0.5444813, -0.6581236, 1, 0.6196079, 0, 1,
-1.244195, 0.6236323, -2.775798, 1, 0.6235294, 0, 1,
-1.241351, -3.4328, -3.039734, 1, 0.6313726, 0, 1,
-1.235935, 0.3962766, -0.9182618, 1, 0.6352941, 0, 1,
-1.233267, 0.4928359, -0.6815249, 1, 0.6431373, 0, 1,
-1.232148, -0.7314875, -2.240502, 1, 0.6470588, 0, 1,
-1.222751, 0.426041, -0.2612647, 1, 0.654902, 0, 1,
-1.216742, 0.1962853, -0.1110309, 1, 0.6588235, 0, 1,
-1.213726, 0.4307826, -0.3678839, 1, 0.6666667, 0, 1,
-1.210027, -0.6379686, -1.461504, 1, 0.6705883, 0, 1,
-1.209963, -1.234919, -2.888059, 1, 0.6784314, 0, 1,
-1.207229, 1.10563, 0.4770033, 1, 0.682353, 0, 1,
-1.198346, -0.4245353, -1.942187, 1, 0.6901961, 0, 1,
-1.197321, 0.8122125, -2.661303, 1, 0.6941177, 0, 1,
-1.190222, 0.4671033, -1.399695, 1, 0.7019608, 0, 1,
-1.188198, 0.1240383, -0.90217, 1, 0.7098039, 0, 1,
-1.188175, -1.203137, -2.093098, 1, 0.7137255, 0, 1,
-1.186648, 1.590554, -0.2947657, 1, 0.7215686, 0, 1,
-1.186339, -0.2947435, 0.2506753, 1, 0.7254902, 0, 1,
-1.179684, 0.6228215, -0.9792266, 1, 0.7333333, 0, 1,
-1.178218, 0.09726194, 0.03458653, 1, 0.7372549, 0, 1,
-1.176873, 0.7459449, 0.04340752, 1, 0.7450981, 0, 1,
-1.176864, -0.1289394, -1.144132, 1, 0.7490196, 0, 1,
-1.175033, 1.611447, -3.417364, 1, 0.7568628, 0, 1,
-1.174745, 0.2971443, -2.603139, 1, 0.7607843, 0, 1,
-1.156912, -0.7475855, -3.404367, 1, 0.7686275, 0, 1,
-1.151389, -0.7789645, -2.023043, 1, 0.772549, 0, 1,
-1.146797, -0.577673, -1.873698, 1, 0.7803922, 0, 1,
-1.146726, 0.900246, -2.776289, 1, 0.7843137, 0, 1,
-1.138749, 0.1490294, -0.8569822, 1, 0.7921569, 0, 1,
-1.13633, -0.006214782, -1.74581, 1, 0.7960784, 0, 1,
-1.12776, 0.5784983, -1.237631, 1, 0.8039216, 0, 1,
-1.127708, -0.1009016, -0.8943152, 1, 0.8117647, 0, 1,
-1.127359, 1.47252, -0.1131307, 1, 0.8156863, 0, 1,
-1.124933, 1.203991, -0.1773428, 1, 0.8235294, 0, 1,
-1.113999, 1.013353, -0.2270686, 1, 0.827451, 0, 1,
-1.104452, -2.132879, -3.586995, 1, 0.8352941, 0, 1,
-1.101306, -0.1164161, -1.130096, 1, 0.8392157, 0, 1,
-1.096784, 1.693992, -0.8754462, 1, 0.8470588, 0, 1,
-1.095239, -1.446797, -1.674065, 1, 0.8509804, 0, 1,
-1.094042, -0.9356614, -1.645169, 1, 0.8588235, 0, 1,
-1.088723, 0.1155608, -1.511967, 1, 0.8627451, 0, 1,
-1.088703, 0.3323117, -2.649188, 1, 0.8705882, 0, 1,
-1.084726, 1.034387, -0.140766, 1, 0.8745098, 0, 1,
-1.074132, 1.324061, -0.6517987, 1, 0.8823529, 0, 1,
-1.06973, -2.603342, -2.323469, 1, 0.8862745, 0, 1,
-1.067955, 1.021336, -1.287227, 1, 0.8941177, 0, 1,
-1.064751, 1.330128, 0.5133318, 1, 0.8980392, 0, 1,
-1.06189, -1.802212, -3.063782, 1, 0.9058824, 0, 1,
-1.061321, -0.1989828, -3.504398, 1, 0.9137255, 0, 1,
-1.060418, -0.4023916, -2.209566, 1, 0.9176471, 0, 1,
-1.054361, -1.902741, -3.816692, 1, 0.9254902, 0, 1,
-1.049668, 1.147594, -1.764091, 1, 0.9294118, 0, 1,
-1.049426, 1.610006, -2.036359, 1, 0.9372549, 0, 1,
-1.047466, 1.597808, 0.1962266, 1, 0.9411765, 0, 1,
-1.039706, -1.737644, -2.227174, 1, 0.9490196, 0, 1,
-1.038922, 0.4516349, -1.373279, 1, 0.9529412, 0, 1,
-1.025786, -1.330168, -1.846502, 1, 0.9607843, 0, 1,
-1.022228, -1.989058, -1.76095, 1, 0.9647059, 0, 1,
-1.020243, -1.570076, -3.810358, 1, 0.972549, 0, 1,
-1.017985, -0.5779417, -1.676353, 1, 0.9764706, 0, 1,
-1.016147, 2.310491, -1.77176, 1, 0.9843137, 0, 1,
-1.014665, 0.7762388, -0.8339919, 1, 0.9882353, 0, 1,
-1.013225, -1.338418, -3.795088, 1, 0.9960784, 0, 1,
-1.009385, 1.010352, -2.20382, 0.9960784, 1, 0, 1,
-0.9963804, -0.04055384, -2.073954, 0.9921569, 1, 0, 1,
-0.9763721, 0.2914843, -1.490757, 0.9843137, 1, 0, 1,
-0.9535598, -0.04317212, -2.444932, 0.9803922, 1, 0, 1,
-0.9532278, -0.9477801, -4.650547, 0.972549, 1, 0, 1,
-0.9450722, 0.08126753, -2.418839, 0.9686275, 1, 0, 1,
-0.9327491, 0.900382, -1.332047, 0.9607843, 1, 0, 1,
-0.9243985, 1.193995, -0.5069901, 0.9568627, 1, 0, 1,
-0.9240503, -0.1476756, -1.536436, 0.9490196, 1, 0, 1,
-0.9212751, 0.2230367, -0.7801682, 0.945098, 1, 0, 1,
-0.9209007, 0.2459625, -0.967481, 0.9372549, 1, 0, 1,
-0.9205441, 0.8148804, 0.1128777, 0.9333333, 1, 0, 1,
-0.9194716, 0.0837823, -1.47949, 0.9254902, 1, 0, 1,
-0.9192077, -0.1344983, -3.453667, 0.9215686, 1, 0, 1,
-0.9178175, 0.3884959, -3.186604, 0.9137255, 1, 0, 1,
-0.9124376, -1.240858, -2.526279, 0.9098039, 1, 0, 1,
-0.9098927, -1.038469, -2.504818, 0.9019608, 1, 0, 1,
-0.9092665, -2.242029, -3.960167, 0.8941177, 1, 0, 1,
-0.9082109, -1.746799, -0.7340414, 0.8901961, 1, 0, 1,
-0.9046712, 0.7596693, -1.447497, 0.8823529, 1, 0, 1,
-0.9002588, 0.2847747, -2.245418, 0.8784314, 1, 0, 1,
-0.8998145, 0.657127, 0.1659039, 0.8705882, 1, 0, 1,
-0.8967882, -1.597125, -4.152738, 0.8666667, 1, 0, 1,
-0.8899222, -0.3422597, -1.714292, 0.8588235, 1, 0, 1,
-0.8845854, -0.497752, -2.253729, 0.854902, 1, 0, 1,
-0.8832251, -0.3174386, -1.074219, 0.8470588, 1, 0, 1,
-0.8817059, 1.809762, 0.7990994, 0.8431373, 1, 0, 1,
-0.8793957, -1.397037, -2.339865, 0.8352941, 1, 0, 1,
-0.8597174, 1.487679, -1.889781, 0.8313726, 1, 0, 1,
-0.8574454, 0.01776126, -2.433462, 0.8235294, 1, 0, 1,
-0.854989, -0.6624684, -2.800652, 0.8196079, 1, 0, 1,
-0.8542473, 1.60401, -0.2281334, 0.8117647, 1, 0, 1,
-0.8518323, 1.198659, -1.547295, 0.8078431, 1, 0, 1,
-0.8510861, -0.415741, -1.905339, 0.8, 1, 0, 1,
-0.8509587, -1.065085, -1.775406, 0.7921569, 1, 0, 1,
-0.8501354, 0.9468106, -1.441072, 0.7882353, 1, 0, 1,
-0.8477184, -0.6019643, -1.911452, 0.7803922, 1, 0, 1,
-0.8381189, 1.124745, 0.411466, 0.7764706, 1, 0, 1,
-0.8332943, 1.38557, -1.525745, 0.7686275, 1, 0, 1,
-0.8295331, -0.2901052, -1.74111, 0.7647059, 1, 0, 1,
-0.8262972, -1.308349, -1.060654, 0.7568628, 1, 0, 1,
-0.8229078, -0.2753132, -1.729863, 0.7529412, 1, 0, 1,
-0.8222169, 1.97119, 0.9533181, 0.7450981, 1, 0, 1,
-0.8216439, 1.472788, 0.5395167, 0.7411765, 1, 0, 1,
-0.817654, 0.7796414, -0.3948705, 0.7333333, 1, 0, 1,
-0.8121049, 1.479869, 0.16978, 0.7294118, 1, 0, 1,
-0.809025, 0.9140144, 0.07278366, 0.7215686, 1, 0, 1,
-0.8078527, 0.01853784, -0.8805782, 0.7176471, 1, 0, 1,
-0.8072553, -0.1803219, -0.1991313, 0.7098039, 1, 0, 1,
-0.802127, -0.1114759, -1.572011, 0.7058824, 1, 0, 1,
-0.7995322, 0.3530968, -0.9195762, 0.6980392, 1, 0, 1,
-0.7982953, -0.7505785, -1.690549, 0.6901961, 1, 0, 1,
-0.7939081, -0.5417985, -3.42592, 0.6862745, 1, 0, 1,
-0.7937524, 0.1021594, -1.060843, 0.6784314, 1, 0, 1,
-0.7909278, -2.318619, -2.734449, 0.6745098, 1, 0, 1,
-0.7909061, -0.0006288118, -2.18834, 0.6666667, 1, 0, 1,
-0.7852671, -0.9948187, -1.388549, 0.6627451, 1, 0, 1,
-0.7813165, 0.9639322, -0.9007687, 0.654902, 1, 0, 1,
-0.7766126, 0.2979172, -2.072091, 0.6509804, 1, 0, 1,
-0.7759529, -0.07174778, -1.401031, 0.6431373, 1, 0, 1,
-0.7754444, 0.05171474, -2.054955, 0.6392157, 1, 0, 1,
-0.7742841, 0.1604567, -3.962918, 0.6313726, 1, 0, 1,
-0.7726687, -0.746955, -2.773752, 0.627451, 1, 0, 1,
-0.7685019, -0.004339475, -1.753292, 0.6196079, 1, 0, 1,
-0.7633978, -0.1908347, -2.017292, 0.6156863, 1, 0, 1,
-0.7619142, -0.3341267, -2.51848, 0.6078432, 1, 0, 1,
-0.7551993, 0.6980158, -0.8195801, 0.6039216, 1, 0, 1,
-0.754774, -1.568967, -1.604921, 0.5960785, 1, 0, 1,
-0.7512494, -1.422137, -2.144353, 0.5882353, 1, 0, 1,
-0.7497419, 0.5752257, -1.302826, 0.5843138, 1, 0, 1,
-0.7407811, 0.7632599, 0.4207779, 0.5764706, 1, 0, 1,
-0.734303, 0.03792594, -0.7629974, 0.572549, 1, 0, 1,
-0.731266, 0.6993541, -0.8246607, 0.5647059, 1, 0, 1,
-0.7303807, 0.5064766, -1.202978, 0.5607843, 1, 0, 1,
-0.7301196, 1.258895, 0.2864885, 0.5529412, 1, 0, 1,
-0.7238253, 1.149998, -0.9765933, 0.5490196, 1, 0, 1,
-0.7230744, 0.1414338, -2.142056, 0.5411765, 1, 0, 1,
-0.7148644, 1.909876, -0.376039, 0.5372549, 1, 0, 1,
-0.7120107, 1.233176, -0.6558077, 0.5294118, 1, 0, 1,
-0.7107976, -1.203543, -2.669187, 0.5254902, 1, 0, 1,
-0.7103977, 0.7932378, -1.108367, 0.5176471, 1, 0, 1,
-0.7077243, 0.4102798, 0.0630016, 0.5137255, 1, 0, 1,
-0.7052948, -1.050076, -1.649562, 0.5058824, 1, 0, 1,
-0.70366, 0.845024, 0.2010456, 0.5019608, 1, 0, 1,
-0.6989074, 0.7585399, -1.313909, 0.4941176, 1, 0, 1,
-0.6953683, -0.3240628, -2.443032, 0.4862745, 1, 0, 1,
-0.6936436, -0.7040586, -1.687128, 0.4823529, 1, 0, 1,
-0.6923924, -2.303411, -3.679374, 0.4745098, 1, 0, 1,
-0.6890197, 0.6396335, -2.676318, 0.4705882, 1, 0, 1,
-0.6843423, 2.494083, -2.057502, 0.4627451, 1, 0, 1,
-0.6794544, 0.9112538, -1.129096, 0.4588235, 1, 0, 1,
-0.6772782, -0.2699841, -0.6504564, 0.4509804, 1, 0, 1,
-0.6742061, -0.5275844, -3.265545, 0.4470588, 1, 0, 1,
-0.6681222, -1.037952, -3.187617, 0.4392157, 1, 0, 1,
-0.6670902, 0.9948232, 1.149443, 0.4352941, 1, 0, 1,
-0.6667115, -0.7446999, -0.6150118, 0.427451, 1, 0, 1,
-0.6638443, 0.04197421, -2.226791, 0.4235294, 1, 0, 1,
-0.6618092, -1.004966, -4.42673, 0.4156863, 1, 0, 1,
-0.6594599, 0.5746021, -1.766965, 0.4117647, 1, 0, 1,
-0.6594313, -0.8304768, -2.499166, 0.4039216, 1, 0, 1,
-0.6579538, 1.231045, -0.08956163, 0.3960784, 1, 0, 1,
-0.6569612, -0.9782283, -2.945014, 0.3921569, 1, 0, 1,
-0.6561539, -1.568747, -2.242666, 0.3843137, 1, 0, 1,
-0.6540774, -1.872592, -2.973968, 0.3803922, 1, 0, 1,
-0.6532592, 0.3517441, -1.913098, 0.372549, 1, 0, 1,
-0.6532394, -0.9688131, -2.058521, 0.3686275, 1, 0, 1,
-0.6445959, -0.03385137, -1.520102, 0.3607843, 1, 0, 1,
-0.6415423, 0.7437406, -0.950855, 0.3568628, 1, 0, 1,
-0.63656, -0.3100647, -1.98609, 0.3490196, 1, 0, 1,
-0.636054, -0.9440877, -1.654157, 0.345098, 1, 0, 1,
-0.6314607, -0.9110369, -3.713557, 0.3372549, 1, 0, 1,
-0.6271427, -0.4247596, -4.023862, 0.3333333, 1, 0, 1,
-0.6245724, 0.3609268, -1.068349, 0.3254902, 1, 0, 1,
-0.6181306, 1.194782, -1.412699, 0.3215686, 1, 0, 1,
-0.615118, -0.2249435, -2.415652, 0.3137255, 1, 0, 1,
-0.6086658, 0.4474652, -0.03324445, 0.3098039, 1, 0, 1,
-0.6083519, -0.6089923, -2.371505, 0.3019608, 1, 0, 1,
-0.6065121, 0.2989102, -0.9689543, 0.2941177, 1, 0, 1,
-0.6013806, -0.6558101, -0.6895179, 0.2901961, 1, 0, 1,
-0.5980764, -0.8641281, -2.288233, 0.282353, 1, 0, 1,
-0.5934337, 1.577966, -1.462862, 0.2784314, 1, 0, 1,
-0.586174, 0.08699976, -1.394448, 0.2705882, 1, 0, 1,
-0.5837785, 0.6402879, -0.4255444, 0.2666667, 1, 0, 1,
-0.579134, 0.09472152, -0.1684964, 0.2588235, 1, 0, 1,
-0.5733976, 1.107243, -1.767686, 0.254902, 1, 0, 1,
-0.5716628, 0.5383047, -1.256994, 0.2470588, 1, 0, 1,
-0.5703911, 0.05769192, -1.183252, 0.2431373, 1, 0, 1,
-0.547357, -1.936057, -2.592737, 0.2352941, 1, 0, 1,
-0.5447304, -2.032809, -3.671744, 0.2313726, 1, 0, 1,
-0.5398242, -0.07686067, -0.8916369, 0.2235294, 1, 0, 1,
-0.5388714, -0.496537, -2.191959, 0.2196078, 1, 0, 1,
-0.5377538, -0.8391982, -4.863702, 0.2117647, 1, 0, 1,
-0.5368195, -0.1705485, -1.067861, 0.2078431, 1, 0, 1,
-0.5364294, -1.764769, -1.418165, 0.2, 1, 0, 1,
-0.5261576, -2.089358, -2.455456, 0.1921569, 1, 0, 1,
-0.5236759, 0.4996268, -0.7363329, 0.1882353, 1, 0, 1,
-0.5223954, 0.2128294, -1.63734, 0.1803922, 1, 0, 1,
-0.5193141, 0.5112012, -1.085754, 0.1764706, 1, 0, 1,
-0.5173664, 2.005986, -0.2282954, 0.1686275, 1, 0, 1,
-0.5162992, 0.643099, -0.2916827, 0.1647059, 1, 0, 1,
-0.5158905, 1.756675, -0.289814, 0.1568628, 1, 0, 1,
-0.5117207, -1.307858, -3.193523, 0.1529412, 1, 0, 1,
-0.5113534, -0.5431983, -3.106834, 0.145098, 1, 0, 1,
-0.509765, -1.594122, -1.512957, 0.1411765, 1, 0, 1,
-0.5018263, 1.915532, -0.5430544, 0.1333333, 1, 0, 1,
-0.5011642, -0.8063146, -0.6729369, 0.1294118, 1, 0, 1,
-0.4992491, 0.8734502, -1.287955, 0.1215686, 1, 0, 1,
-0.490992, 0.3293282, -3.008198, 0.1176471, 1, 0, 1,
-0.4873244, -0.2721336, -0.9534281, 0.1098039, 1, 0, 1,
-0.4819416, -0.1799039, -4.875523, 0.1058824, 1, 0, 1,
-0.4779445, -2.316701, -1.461968, 0.09803922, 1, 0, 1,
-0.4734001, -0.5420747, -0.861114, 0.09019608, 1, 0, 1,
-0.4731869, 0.3310708, -0.5977304, 0.08627451, 1, 0, 1,
-0.4689472, -0.9055805, -1.012935, 0.07843138, 1, 0, 1,
-0.4662832, 0.1667389, -1.573057, 0.07450981, 1, 0, 1,
-0.4624195, -0.2570234, -2.72906, 0.06666667, 1, 0, 1,
-0.4596432, -0.7645596, -3.730279, 0.0627451, 1, 0, 1,
-0.4469329, 0.4017979, -0.7080467, 0.05490196, 1, 0, 1,
-0.4454863, -1.387816, -3.567259, 0.05098039, 1, 0, 1,
-0.4442281, -1.367087, -2.095105, 0.04313726, 1, 0, 1,
-0.4363406, -0.380996, -3.459885, 0.03921569, 1, 0, 1,
-0.4360059, -1.08552, -2.390787, 0.03137255, 1, 0, 1,
-0.4337521, 0.6940262, -0.1985012, 0.02745098, 1, 0, 1,
-0.4335772, 1.108256, 0.3763354, 0.01960784, 1, 0, 1,
-0.4307083, -0.4410925, -2.39137, 0.01568628, 1, 0, 1,
-0.4277696, -2.186043, -2.555009, 0.007843138, 1, 0, 1,
-0.4244991, 1.42749, -1.166643, 0.003921569, 1, 0, 1,
-0.4219892, -0.5870396, -2.279905, 0, 1, 0.003921569, 1,
-0.4189069, -1.283573, -3.309849, 0, 1, 0.01176471, 1,
-0.4186567, 0.183923, -2.047734, 0, 1, 0.01568628, 1,
-0.4167986, 0.5025549, -0.218832, 0, 1, 0.02352941, 1,
-0.4137876, 0.0572412, -0.5991462, 0, 1, 0.02745098, 1,
-0.4128943, 0.3642505, -0.9457869, 0, 1, 0.03529412, 1,
-0.4082813, -1.240445, -1.453751, 0, 1, 0.03921569, 1,
-0.4065749, -0.0780511, -0.7996492, 0, 1, 0.04705882, 1,
-0.4038242, -0.2581332, -2.230716, 0, 1, 0.05098039, 1,
-0.3952804, 0.5055654, 0.2947324, 0, 1, 0.05882353, 1,
-0.3950281, 1.213149, -1.241369, 0, 1, 0.0627451, 1,
-0.3943948, -1.587029, -2.919978, 0, 1, 0.07058824, 1,
-0.3918111, 0.1068059, -1.822445, 0, 1, 0.07450981, 1,
-0.3879546, 0.8037758, -1.153436, 0, 1, 0.08235294, 1,
-0.3868687, 1.801188, -1.856078, 0, 1, 0.08627451, 1,
-0.386494, -1.86113, -2.315069, 0, 1, 0.09411765, 1,
-0.3849369, -0.2128587, -2.146525, 0, 1, 0.1019608, 1,
-0.38183, -0.1323257, -1.041452, 0, 1, 0.1058824, 1,
-0.373109, 0.3554909, -1.442881, 0, 1, 0.1137255, 1,
-0.3721365, 1.695612, -0.7070828, 0, 1, 0.1176471, 1,
-0.3707692, -0.2416002, -0.805342, 0, 1, 0.1254902, 1,
-0.3697944, -0.4983977, -4.976106, 0, 1, 0.1294118, 1,
-0.3696697, -0.5574618, -2.996289, 0, 1, 0.1372549, 1,
-0.3694282, -1.325567, -3.717014, 0, 1, 0.1411765, 1,
-0.3691572, -0.4068073, -1.153083, 0, 1, 0.1490196, 1,
-0.3676743, 1.281937, 0.02626825, 0, 1, 0.1529412, 1,
-0.3671425, 0.3372809, -2.17522, 0, 1, 0.1607843, 1,
-0.3640228, -1.489702, -2.891742, 0, 1, 0.1647059, 1,
-0.3582854, -0.4508084, -3.0377, 0, 1, 0.172549, 1,
-0.3570175, -0.3906175, -2.639182, 0, 1, 0.1764706, 1,
-0.3498924, 1.334396, -0.6494176, 0, 1, 0.1843137, 1,
-0.3343818, -1.225951, -3.67959, 0, 1, 0.1882353, 1,
-0.3328533, 1.999219, 0.3380505, 0, 1, 0.1960784, 1,
-0.3285593, -1.754827, -2.700929, 0, 1, 0.2039216, 1,
-0.3251928, -0.161592, -0.9437665, 0, 1, 0.2078431, 1,
-0.3203846, -0.01237757, -1.975332, 0, 1, 0.2156863, 1,
-0.3181771, -0.9839889, -2.195324, 0, 1, 0.2196078, 1,
-0.3126006, 0.5256357, -0.1901407, 0, 1, 0.227451, 1,
-0.3122563, 0.1828045, -1.603961, 0, 1, 0.2313726, 1,
-0.3077583, 0.35276, -0.562208, 0, 1, 0.2392157, 1,
-0.2959658, 0.9082595, -0.7440246, 0, 1, 0.2431373, 1,
-0.2916796, -1.404748, -2.256956, 0, 1, 0.2509804, 1,
-0.2857265, -0.3718013, -1.954774, 0, 1, 0.254902, 1,
-0.2854436, -0.06764308, -0.4969269, 0, 1, 0.2627451, 1,
-0.2834698, 1.288015, -0.810193, 0, 1, 0.2666667, 1,
-0.2811898, 0.3140877, 0.268156, 0, 1, 0.2745098, 1,
-0.2778517, 0.8053415, 0.2003423, 0, 1, 0.2784314, 1,
-0.275457, -0.2545013, -1.762219, 0, 1, 0.2862745, 1,
-0.2749052, 1.405245, 0.9509704, 0, 1, 0.2901961, 1,
-0.2706865, -0.9120764, -2.97209, 0, 1, 0.2980392, 1,
-0.2703075, 0.1671116, -0.07318561, 0, 1, 0.3058824, 1,
-0.27011, 1.146932, -0.560128, 0, 1, 0.3098039, 1,
-0.2698964, -0.3122234, -2.630579, 0, 1, 0.3176471, 1,
-0.2691419, 0.1547014, 0.7521326, 0, 1, 0.3215686, 1,
-0.2658927, -0.196372, -2.649253, 0, 1, 0.3294118, 1,
-0.2650536, 0.09848054, -0.9042006, 0, 1, 0.3333333, 1,
-0.2648557, -0.3592004, -4.43856, 0, 1, 0.3411765, 1,
-0.2634598, 1.078566, 0.6454551, 0, 1, 0.345098, 1,
-0.2615132, -0.7307947, -2.758976, 0, 1, 0.3529412, 1,
-0.2575362, 0.3662154, -0.2110793, 0, 1, 0.3568628, 1,
-0.2565021, -2.201351, -3.843589, 0, 1, 0.3647059, 1,
-0.2514184, -0.9194273, -2.934621, 0, 1, 0.3686275, 1,
-0.2490615, -0.860022, -3.412855, 0, 1, 0.3764706, 1,
-0.2483275, -0.9667498, -2.690309, 0, 1, 0.3803922, 1,
-0.2469026, -2.060748, -1.163844, 0, 1, 0.3882353, 1,
-0.242694, -0.1250744, -1.322035, 0, 1, 0.3921569, 1,
-0.2421809, 0.581027, -0.5951086, 0, 1, 0.4, 1,
-0.2375747, -1.896588, -3.057939, 0, 1, 0.4078431, 1,
-0.2347626, -0.2536656, -3.9499, 0, 1, 0.4117647, 1,
-0.2344143, -1.256786, -1.361709, 0, 1, 0.4196078, 1,
-0.2301089, -0.6681464, -1.583437, 0, 1, 0.4235294, 1,
-0.2299707, 1.032962, 0.3639151, 0, 1, 0.4313726, 1,
-0.2250521, 0.03669951, -2.057906, 0, 1, 0.4352941, 1,
-0.2246694, -1.397391, -3.336255, 0, 1, 0.4431373, 1,
-0.2228611, 1.864222, -1.71835, 0, 1, 0.4470588, 1,
-0.217214, -1.005288, -2.251815, 0, 1, 0.454902, 1,
-0.2131995, -1.104356, -2.96913, 0, 1, 0.4588235, 1,
-0.2099732, -0.02960727, -1.419074, 0, 1, 0.4666667, 1,
-0.2012773, 1.874182, -0.7555213, 0, 1, 0.4705882, 1,
-0.2009542, 0.4012318, 0.650955, 0, 1, 0.4784314, 1,
-0.2005052, -0.9956995, -2.996294, 0, 1, 0.4823529, 1,
-0.1995731, -0.1561338, -2.275267, 0, 1, 0.4901961, 1,
-0.1972174, 0.0399165, -1.198248, 0, 1, 0.4941176, 1,
-0.1936906, 1.24741, 1.188183, 0, 1, 0.5019608, 1,
-0.1935174, -0.1957816, -2.262423, 0, 1, 0.509804, 1,
-0.1920286, -2.319021, -1.506041, 0, 1, 0.5137255, 1,
-0.1918015, 1.217348, -0.5425438, 0, 1, 0.5215687, 1,
-0.1901809, 0.5103629, 1.532774, 0, 1, 0.5254902, 1,
-0.1882731, -0.7235069, -2.594759, 0, 1, 0.5333334, 1,
-0.1858235, -0.2120536, -3.479438, 0, 1, 0.5372549, 1,
-0.18574, 0.3045579, -0.06010426, 0, 1, 0.5450981, 1,
-0.1845016, -0.3956795, -3.773264, 0, 1, 0.5490196, 1,
-0.1827513, -1.826022, -1.562624, 0, 1, 0.5568628, 1,
-0.1809365, -1.766473, -2.451354, 0, 1, 0.5607843, 1,
-0.1774828, -1.157748, -2.145096, 0, 1, 0.5686275, 1,
-0.1770077, 0.6010394, 0.7650566, 0, 1, 0.572549, 1,
-0.1749225, 1.558085, -1.107722, 0, 1, 0.5803922, 1,
-0.1700013, -1.070045, -3.73985, 0, 1, 0.5843138, 1,
-0.1691494, -0.6609874, -2.110683, 0, 1, 0.5921569, 1,
-0.1689145, 0.1684553, -0.7977342, 0, 1, 0.5960785, 1,
-0.1677783, -2.217621, -2.915442, 0, 1, 0.6039216, 1,
-0.1659839, 0.609907, 0.07048757, 0, 1, 0.6117647, 1,
-0.164689, 0.6469409, -1.277692, 0, 1, 0.6156863, 1,
-0.1617088, 1.80197, 1.006029, 0, 1, 0.6235294, 1,
-0.1589961, 0.04696389, -0.1165168, 0, 1, 0.627451, 1,
-0.1567501, -0.3479854, -2.214417, 0, 1, 0.6352941, 1,
-0.155136, 0.4118367, -0.232573, 0, 1, 0.6392157, 1,
-0.154737, 1.620063, -0.7170184, 0, 1, 0.6470588, 1,
-0.1503087, 0.08353359, -1.761905, 0, 1, 0.6509804, 1,
-0.1480839, 1.30073, -1.385003, 0, 1, 0.6588235, 1,
-0.1452304, -0.02705008, -0.649056, 0, 1, 0.6627451, 1,
-0.1450649, -1.307064, -3.007394, 0, 1, 0.6705883, 1,
-0.1441343, -0.2881577, -2.082604, 0, 1, 0.6745098, 1,
-0.1435827, 1.626648, 2.279561, 0, 1, 0.682353, 1,
-0.1413759, 0.6749421, -2.111225, 0, 1, 0.6862745, 1,
-0.1407931, 0.4167986, 0.7040998, 0, 1, 0.6941177, 1,
-0.1405633, -1.198802, -4.135505, 0, 1, 0.7019608, 1,
-0.1374406, -0.2918067, -2.246687, 0, 1, 0.7058824, 1,
-0.1371386, 0.6173269, -0.6144933, 0, 1, 0.7137255, 1,
-0.1327998, -0.947444, -3.027355, 0, 1, 0.7176471, 1,
-0.1321603, 0.9231004, 0.4918705, 0, 1, 0.7254902, 1,
-0.1314668, -0.8852086, -3.024285, 0, 1, 0.7294118, 1,
-0.130614, -0.536077, -2.197694, 0, 1, 0.7372549, 1,
-0.129632, 1.402489, 0.6464074, 0, 1, 0.7411765, 1,
-0.1236771, 0.1998566, -0.5368504, 0, 1, 0.7490196, 1,
-0.1204304, 2.488944, 1.487211, 0, 1, 0.7529412, 1,
-0.1182177, 0.2977462, 0.1640473, 0, 1, 0.7607843, 1,
-0.1157395, -0.02264726, -1.216109, 0, 1, 0.7647059, 1,
-0.1073337, 0.3167493, -0.7333739, 0, 1, 0.772549, 1,
-0.1048939, -0.8009055, -3.54127, 0, 1, 0.7764706, 1,
-0.1042781, 0.2588858, 0.4570732, 0, 1, 0.7843137, 1,
-0.1027866, -1.298109, -2.47489, 0, 1, 0.7882353, 1,
-0.09199581, 1.650946, -0.6104573, 0, 1, 0.7960784, 1,
-0.09163171, 0.6958879, 0.3873561, 0, 1, 0.8039216, 1,
-0.09092029, 1.92708, 0.4299905, 0, 1, 0.8078431, 1,
-0.08967917, -1.018632, -3.571602, 0, 1, 0.8156863, 1,
-0.08706748, -1.131207, -2.388262, 0, 1, 0.8196079, 1,
-0.08224706, -0.6479109, -2.682349, 0, 1, 0.827451, 1,
-0.07843071, 1.468958, -1.48459, 0, 1, 0.8313726, 1,
-0.07665987, 2.552997, -1.310981, 0, 1, 0.8392157, 1,
-0.07586562, -1.067547, -5.28359, 0, 1, 0.8431373, 1,
-0.07536647, 0.8052425, 1.080195, 0, 1, 0.8509804, 1,
-0.0750218, -2.019294, -2.676594, 0, 1, 0.854902, 1,
-0.07409123, 0.8700373, -0.9563506, 0, 1, 0.8627451, 1,
-0.07206659, -0.4827972, -2.927125, 0, 1, 0.8666667, 1,
-0.06815267, 0.5507438, 0.09487499, 0, 1, 0.8745098, 1,
-0.06109972, -0.2464156, -3.39646, 0, 1, 0.8784314, 1,
-0.05831616, 0.706001, -2.164922, 0, 1, 0.8862745, 1,
-0.05819355, 0.7747201, 0.8720418, 0, 1, 0.8901961, 1,
-0.05415085, 0.4136586, 2.100491, 0, 1, 0.8980392, 1,
-0.05087342, -0.2619869, -1.505688, 0, 1, 0.9058824, 1,
-0.04979286, -1.078297, -3.130227, 0, 1, 0.9098039, 1,
-0.04455796, -0.2250654, -2.806164, 0, 1, 0.9176471, 1,
-0.04409503, 0.6385925, 0.009076239, 0, 1, 0.9215686, 1,
-0.0433019, 1.495376, -0.4394271, 0, 1, 0.9294118, 1,
-0.04213895, 0.9305113, -0.2095531, 0, 1, 0.9333333, 1,
-0.04149562, 0.4706037, 0.05060747, 0, 1, 0.9411765, 1,
-0.04053017, -1.586981, -1.639024, 0, 1, 0.945098, 1,
-0.03932012, -1.254578, -3.569978, 0, 1, 0.9529412, 1,
-0.03908772, -0.4366067, -2.000847, 0, 1, 0.9568627, 1,
-0.03735003, 1.509855, 0.3128797, 0, 1, 0.9647059, 1,
-0.03548025, 0.783271, -1.667978, 0, 1, 0.9686275, 1,
-0.03505934, -0.09425476, -0.5020233, 0, 1, 0.9764706, 1,
-0.03493498, 0.5568658, -0.8730009, 0, 1, 0.9803922, 1,
-0.0341887, 0.330786, 1.586133, 0, 1, 0.9882353, 1,
-0.02380694, -0.5605283, -3.005463, 0, 1, 0.9921569, 1,
-0.0232718, 0.6713974, -1.007864, 0, 1, 1, 1,
-0.01660281, 0.3813347, -0.6220247, 0, 0.9921569, 1, 1,
-0.01536747, -1.309832, -3.484646, 0, 0.9882353, 1, 1,
-0.01466848, -0.382462, -2.830844, 0, 0.9803922, 1, 1,
-0.01429311, 1.649534, -0.4341216, 0, 0.9764706, 1, 1,
-0.009395624, -0.05042143, -3.232507, 0, 0.9686275, 1, 1,
-0.00888851, -0.04413791, -2.21366, 0, 0.9647059, 1, 1,
-0.007120484, -0.9727378, -2.493417, 0, 0.9568627, 1, 1,
-0.006102294, 1.518531, -0.7350152, 0, 0.9529412, 1, 1,
-0.004115674, -0.9340905, -3.564313, 0, 0.945098, 1, 1,
-0.002483572, 0.6077495, 0.19197, 0, 0.9411765, 1, 1,
5.615339e-05, 1.743386, 0.3371275, 0, 0.9333333, 1, 1,
0.001253926, -0.1520338, 3.045211, 0, 0.9294118, 1, 1,
0.001428441, 0.520822, -0.6088451, 0, 0.9215686, 1, 1,
0.001496566, -1.259056, 3.05485, 0, 0.9176471, 1, 1,
0.01830185, -1.253561, 3.277519, 0, 0.9098039, 1, 1,
0.02169161, -0.9130429, 4.286816, 0, 0.9058824, 1, 1,
0.02171649, 1.463865, -1.182733, 0, 0.8980392, 1, 1,
0.02980576, 1.030057, -0.1644438, 0, 0.8901961, 1, 1,
0.03167253, -0.1652672, 2.021371, 0, 0.8862745, 1, 1,
0.03799371, 0.829217, 0.645059, 0, 0.8784314, 1, 1,
0.03827445, -0.2774966, 4.367133, 0, 0.8745098, 1, 1,
0.04374346, -0.6348069, 3.340607, 0, 0.8666667, 1, 1,
0.05211652, -0.8483201, 4.883739, 0, 0.8627451, 1, 1,
0.05459361, 0.3489555, -0.3431709, 0, 0.854902, 1, 1,
0.05991409, 0.4240313, 1.73274, 0, 0.8509804, 1, 1,
0.05997242, -0.1673334, 3.033784, 0, 0.8431373, 1, 1,
0.06061458, -1.090043, 1.662949, 0, 0.8392157, 1, 1,
0.06093921, 0.3630916, 0.3304817, 0, 0.8313726, 1, 1,
0.06150289, 1.64902, 0.1545226, 0, 0.827451, 1, 1,
0.06160807, -0.05890672, -0.1382724, 0, 0.8196079, 1, 1,
0.06412801, -0.4932871, 4.159255, 0, 0.8156863, 1, 1,
0.06493862, -1.67627, 3.394441, 0, 0.8078431, 1, 1,
0.06543641, -0.07806865, 3.033157, 0, 0.8039216, 1, 1,
0.06690633, -0.7619072, 4.284995, 0, 0.7960784, 1, 1,
0.06843217, -0.0338784, 3.015684, 0, 0.7882353, 1, 1,
0.07055732, -0.8453974, 0.8414109, 0, 0.7843137, 1, 1,
0.07087559, -0.4455732, 2.703975, 0, 0.7764706, 1, 1,
0.07122937, -1.650144, 2.593807, 0, 0.772549, 1, 1,
0.07157566, -2.199745, 4.040946, 0, 0.7647059, 1, 1,
0.07239538, 0.3665764, 2.031582, 0, 0.7607843, 1, 1,
0.07242452, 0.3000276, -0.4095486, 0, 0.7529412, 1, 1,
0.07712737, 2.006748, 0.672785, 0, 0.7490196, 1, 1,
0.08049024, -0.1048769, 2.634735, 0, 0.7411765, 1, 1,
0.0841606, 0.2405354, -0.1696955, 0, 0.7372549, 1, 1,
0.0855048, -0.8049195, 4.827728, 0, 0.7294118, 1, 1,
0.08632725, -0.3580995, 3.766323, 0, 0.7254902, 1, 1,
0.08802944, 1.787438, 1.60667, 0, 0.7176471, 1, 1,
0.0893567, -1.076553, 3.540368, 0, 0.7137255, 1, 1,
0.09031551, 1.295035, 0.04600008, 0, 0.7058824, 1, 1,
0.09128077, 0.3217177, 0.6215393, 0, 0.6980392, 1, 1,
0.09334341, -0.1649304, 0.5107337, 0, 0.6941177, 1, 1,
0.1001439, 0.2904532, 0.7753804, 0, 0.6862745, 1, 1,
0.1019418, -0.9757403, 1.327308, 0, 0.682353, 1, 1,
0.1022076, 1.543604, -0.5124424, 0, 0.6745098, 1, 1,
0.1029546, 0.6384997, -0.1794084, 0, 0.6705883, 1, 1,
0.1051953, 3.139951, 0.2720386, 0, 0.6627451, 1, 1,
0.1104376, 0.51022, -0.09562142, 0, 0.6588235, 1, 1,
0.1111993, -0.6447135, 3.334772, 0, 0.6509804, 1, 1,
0.1122685, 0.1222525, 1.669886, 0, 0.6470588, 1, 1,
0.1164786, -1.280533, 2.993989, 0, 0.6392157, 1, 1,
0.1178669, 0.8378367, 2.408873, 0, 0.6352941, 1, 1,
0.1191787, 0.2856269, -0.139222, 0, 0.627451, 1, 1,
0.1208028, 0.5240773, -0.9848056, 0, 0.6235294, 1, 1,
0.1222375, 1.065876, 0.7072495, 0, 0.6156863, 1, 1,
0.1239412, 0.4675197, 1.68913, 0, 0.6117647, 1, 1,
0.1262085, 0.4778276, -0.7404963, 0, 0.6039216, 1, 1,
0.1273574, -1.226493, 2.026885, 0, 0.5960785, 1, 1,
0.1274387, -2.11883, 3.399025, 0, 0.5921569, 1, 1,
0.132345, 0.5053691, 0.3259679, 0, 0.5843138, 1, 1,
0.1465801, 0.2501749, 1.240152, 0, 0.5803922, 1, 1,
0.1499172, -0.2827694, 2.605362, 0, 0.572549, 1, 1,
0.1507939, 0.4808491, 1.307581, 0, 0.5686275, 1, 1,
0.155526, -0.2293307, 3.387596, 0, 0.5607843, 1, 1,
0.1561868, 1.163825, -0.01782147, 0, 0.5568628, 1, 1,
0.1572111, 1.146791, -0.2318884, 0, 0.5490196, 1, 1,
0.1590963, -1.757956, 1.49928, 0, 0.5450981, 1, 1,
0.1639276, 0.538158, -0.02973653, 0, 0.5372549, 1, 1,
0.1645262, 0.02380827, 0.7237355, 0, 0.5333334, 1, 1,
0.1799705, -0.5611113, 2.817812, 0, 0.5254902, 1, 1,
0.1805625, 1.172706, 0.7467506, 0, 0.5215687, 1, 1,
0.1810136, -0.2347485, 0.859977, 0, 0.5137255, 1, 1,
0.1811981, 0.5367314, 0.3825825, 0, 0.509804, 1, 1,
0.1916787, -1.656835, 3.035077, 0, 0.5019608, 1, 1,
0.1926393, -0.3332356, 0.4567907, 0, 0.4941176, 1, 1,
0.1930645, -0.6329497, 2.589325, 0, 0.4901961, 1, 1,
0.194048, 0.1682143, 0.4286129, 0, 0.4823529, 1, 1,
0.1964964, 1.381908, 0.06501128, 0, 0.4784314, 1, 1,
0.2006616, 0.01423914, 0.5355149, 0, 0.4705882, 1, 1,
0.2048344, -0.4732848, 2.709697, 0, 0.4666667, 1, 1,
0.2114064, 1.581626, 1.020753, 0, 0.4588235, 1, 1,
0.212423, -0.5238063, 1.776682, 0, 0.454902, 1, 1,
0.2160541, 2.15579, 0.6728929, 0, 0.4470588, 1, 1,
0.2162472, 1.176118, 0.07279015, 0, 0.4431373, 1, 1,
0.2195438, -1.382305, 2.137048, 0, 0.4352941, 1, 1,
0.2217024, -0.1510707, 2.70427, 0, 0.4313726, 1, 1,
0.2246582, -0.6970055, 3.158267, 0, 0.4235294, 1, 1,
0.2246908, -0.04550233, 2.538291, 0, 0.4196078, 1, 1,
0.2252889, 0.5739956, -0.4138478, 0, 0.4117647, 1, 1,
0.2257551, -0.3144298, 2.474653, 0, 0.4078431, 1, 1,
0.2274123, 1.711107, 0.09095512, 0, 0.4, 1, 1,
0.2329964, 0.4321832, 1.201596, 0, 0.3921569, 1, 1,
0.2372939, -0.2206944, 2.837007, 0, 0.3882353, 1, 1,
0.2400537, 1.31101, 1.020688, 0, 0.3803922, 1, 1,
0.2433148, -0.4818886, 2.618129, 0, 0.3764706, 1, 1,
0.2434268, -0.3235424, 2.267635, 0, 0.3686275, 1, 1,
0.2436639, -1.51107, 3.817543, 0, 0.3647059, 1, 1,
0.2449137, -0.9586856, 0.4089936, 0, 0.3568628, 1, 1,
0.2463588, 0.7924007, -0.3251608, 0, 0.3529412, 1, 1,
0.2477099, 0.1681165, 0.2430422, 0, 0.345098, 1, 1,
0.2521191, 1.352838, -0.190619, 0, 0.3411765, 1, 1,
0.2557551, 0.1768249, 2.407257, 0, 0.3333333, 1, 1,
0.2585299, 0.1644443, 1.804053, 0, 0.3294118, 1, 1,
0.2595152, 1.514007, -0.3509121, 0, 0.3215686, 1, 1,
0.2602035, -0.4803129, 2.907475, 0, 0.3176471, 1, 1,
0.2619953, 0.8089755, -0.9028406, 0, 0.3098039, 1, 1,
0.2626536, -0.3254094, 3.356359, 0, 0.3058824, 1, 1,
0.262789, 1.220121, 0.3746083, 0, 0.2980392, 1, 1,
0.2666302, 2.196306, 0.9885944, 0, 0.2901961, 1, 1,
0.2667568, -0.2445944, 4.193874, 0, 0.2862745, 1, 1,
0.2679796, 0.6412207, 1.067726, 0, 0.2784314, 1, 1,
0.268281, -0.0628991, 1.120382, 0, 0.2745098, 1, 1,
0.2688366, 0.1254275, 0.08558751, 0, 0.2666667, 1, 1,
0.2723829, -1.565117, 2.740044, 0, 0.2627451, 1, 1,
0.2735228, 0.09204283, 1.524504, 0, 0.254902, 1, 1,
0.2740958, -0.5252255, 2.729707, 0, 0.2509804, 1, 1,
0.2748954, -2.59185, 2.206447, 0, 0.2431373, 1, 1,
0.2794243, -0.06836365, 2.590421, 0, 0.2392157, 1, 1,
0.2804922, 0.7459186, 0.09595459, 0, 0.2313726, 1, 1,
0.2835789, 0.4593855, 0.0048807, 0, 0.227451, 1, 1,
0.2837738, -0.9041861, 1.115834, 0, 0.2196078, 1, 1,
0.2858666, 0.5867919, 1.786127, 0, 0.2156863, 1, 1,
0.2864071, 0.9480505, 0.7355667, 0, 0.2078431, 1, 1,
0.2867909, -0.4760011, 1.998271, 0, 0.2039216, 1, 1,
0.2882666, 0.6419684, 0.5946543, 0, 0.1960784, 1, 1,
0.2889415, -0.9082299, 4.15104, 0, 0.1882353, 1, 1,
0.2940368, 0.01890386, 2.640455, 0, 0.1843137, 1, 1,
0.2942823, -1.412853, 3.028854, 0, 0.1764706, 1, 1,
0.2944993, 0.3578407, 0.3221996, 0, 0.172549, 1, 1,
0.2979625, 0.2698666, 0.2324122, 0, 0.1647059, 1, 1,
0.2984306, -1.525855, 3.219461, 0, 0.1607843, 1, 1,
0.2987275, 1.485844, 0.09326146, 0, 0.1529412, 1, 1,
0.2989645, 0.7401892, 0.2412581, 0, 0.1490196, 1, 1,
0.3010397, -0.586914, 3.415053, 0, 0.1411765, 1, 1,
0.3042377, 0.1035454, 1.00466, 0, 0.1372549, 1, 1,
0.3057152, 0.3842822, 0.5449005, 0, 0.1294118, 1, 1,
0.3108328, -1.596465, 2.132554, 0, 0.1254902, 1, 1,
0.3140436, -0.2364179, 3.192347, 0, 0.1176471, 1, 1,
0.3143902, 1.230475, -0.1662768, 0, 0.1137255, 1, 1,
0.3193587, 1.355637, 0.5362629, 0, 0.1058824, 1, 1,
0.3202405, 1.49621, 2.306621, 0, 0.09803922, 1, 1,
0.3232339, 1.387129, -0.7135978, 0, 0.09411765, 1, 1,
0.3254915, 0.7120075, -0.06967179, 0, 0.08627451, 1, 1,
0.3286571, 1.235338, -0.1798873, 0, 0.08235294, 1, 1,
0.3288117, 0.6684485, -0.26404, 0, 0.07450981, 1, 1,
0.3406738, -0.07821241, 3.315171, 0, 0.07058824, 1, 1,
0.3489624, 0.1440162, 1.602191, 0, 0.0627451, 1, 1,
0.3552213, -0.5415296, 2.72332, 0, 0.05882353, 1, 1,
0.3562075, 0.5512344, -0.6031408, 0, 0.05098039, 1, 1,
0.360383, -0.4474133, 3.847387, 0, 0.04705882, 1, 1,
0.3648102, -0.5509155, 4.088452, 0, 0.03921569, 1, 1,
0.3651772, 0.7288865, 1.210831, 0, 0.03529412, 1, 1,
0.3665265, -0.1964927, 0.9580507, 0, 0.02745098, 1, 1,
0.3688963, -0.2524827, 0.9869887, 0, 0.02352941, 1, 1,
0.3725043, -0.7284697, 1.414425, 0, 0.01568628, 1, 1,
0.3736972, 0.5479748, 0.1710394, 0, 0.01176471, 1, 1,
0.3746958, -0.6075732, 2.459278, 0, 0.003921569, 1, 1,
0.3761569, -0.8882835, 3.005352, 0.003921569, 0, 1, 1,
0.3763914, -0.06760341, 2.939893, 0.007843138, 0, 1, 1,
0.3776537, 1.195588, -0.09908219, 0.01568628, 0, 1, 1,
0.3778375, -0.5418085, 3.032631, 0.01960784, 0, 1, 1,
0.377842, 0.8401713, 2.398537, 0.02745098, 0, 1, 1,
0.378765, -1.51647, 2.927699, 0.03137255, 0, 1, 1,
0.3789327, -0.9425054, 2.215094, 0.03921569, 0, 1, 1,
0.3834859, -0.1767083, 0.9149767, 0.04313726, 0, 1, 1,
0.38868, -0.4765085, 1.811953, 0.05098039, 0, 1, 1,
0.3895392, -0.4323003, 1.126031, 0.05490196, 0, 1, 1,
0.3901873, 0.9619172, 0.2780289, 0.0627451, 0, 1, 1,
0.3928975, -0.5558093, 1.829091, 0.06666667, 0, 1, 1,
0.3937378, -0.9133835, 3.36268, 0.07450981, 0, 1, 1,
0.3974387, 1.130097, 0.5946808, 0.07843138, 0, 1, 1,
0.3983018, -0.8669807, 3.052656, 0.08627451, 0, 1, 1,
0.3992949, 3.000977, 1.018113, 0.09019608, 0, 1, 1,
0.4000708, -0.6126566, 2.850728, 0.09803922, 0, 1, 1,
0.4022905, 0.3652593, 0.8191372, 0.1058824, 0, 1, 1,
0.4050105, -1.189108, 3.333483, 0.1098039, 0, 1, 1,
0.4068723, -0.7088953, 3.385014, 0.1176471, 0, 1, 1,
0.4072476, 0.4533642, 2.585243, 0.1215686, 0, 1, 1,
0.4211009, 0.9765204, -0.07585552, 0.1294118, 0, 1, 1,
0.4219154, -0.09997583, 2.92922, 0.1333333, 0, 1, 1,
0.4251842, -0.7817585, 4.353548, 0.1411765, 0, 1, 1,
0.4322517, 1.686391, 0.3958514, 0.145098, 0, 1, 1,
0.4404427, 0.004311943, 2.592247, 0.1529412, 0, 1, 1,
0.4449027, 0.8243101, 0.713448, 0.1568628, 0, 1, 1,
0.4454523, 1.700268, 0.5566126, 0.1647059, 0, 1, 1,
0.4512965, -0.3503962, 3.335578, 0.1686275, 0, 1, 1,
0.456237, -1.320318, 1.229225, 0.1764706, 0, 1, 1,
0.4568061, 0.2646198, 0.6165488, 0.1803922, 0, 1, 1,
0.457521, 0.7530339, 2.281357, 0.1882353, 0, 1, 1,
0.4579817, 2.417853, 0.3071989, 0.1921569, 0, 1, 1,
0.4589269, 0.5101082, 1.090253, 0.2, 0, 1, 1,
0.4591672, 0.3538623, 0.5918717, 0.2078431, 0, 1, 1,
0.4598692, -2.609908, 2.740632, 0.2117647, 0, 1, 1,
0.4629765, 0.2665283, 0.1418285, 0.2196078, 0, 1, 1,
0.4648741, 1.137539, -2.592308, 0.2235294, 0, 1, 1,
0.4675474, -0.1767953, 1.209538, 0.2313726, 0, 1, 1,
0.4676463, 0.2921692, 0.9283172, 0.2352941, 0, 1, 1,
0.4711334, 0.8106535, 1.617852, 0.2431373, 0, 1, 1,
0.4712307, -0.687584, 4.159773, 0.2470588, 0, 1, 1,
0.4727079, 0.4516439, 2.446825, 0.254902, 0, 1, 1,
0.4745517, -1.867948, 0.8894708, 0.2588235, 0, 1, 1,
0.4749283, -0.2523904, 2.037294, 0.2666667, 0, 1, 1,
0.477169, 0.2810913, 1.132924, 0.2705882, 0, 1, 1,
0.4802733, -2.920473, 2.350544, 0.2784314, 0, 1, 1,
0.4820995, 2.255596, -0.4489425, 0.282353, 0, 1, 1,
0.483974, 0.331146, -0.1841951, 0.2901961, 0, 1, 1,
0.4843636, -1.366507, 2.712668, 0.2941177, 0, 1, 1,
0.4844148, -1.339096, 3.275312, 0.3019608, 0, 1, 1,
0.4847895, -0.8618998, 3.132754, 0.3098039, 0, 1, 1,
0.4861515, 1.211011, -0.2358761, 0.3137255, 0, 1, 1,
0.4887369, -0.6920656, 2.342068, 0.3215686, 0, 1, 1,
0.5053526, 1.63061, 0.2428144, 0.3254902, 0, 1, 1,
0.5103664, 1.057537, -0.4165267, 0.3333333, 0, 1, 1,
0.5119737, -1.391914, 2.57969, 0.3372549, 0, 1, 1,
0.5128883, 1.484117, 0.5553095, 0.345098, 0, 1, 1,
0.5135857, 0.864086, -0.6604087, 0.3490196, 0, 1, 1,
0.5165817, -1.653818, 1.223014, 0.3568628, 0, 1, 1,
0.5185397, -1.655565, 2.95107, 0.3607843, 0, 1, 1,
0.5242228, -0.3736194, 1.862105, 0.3686275, 0, 1, 1,
0.527067, 0.563179, 2.033834, 0.372549, 0, 1, 1,
0.5332077, -0.1490462, 3.00048, 0.3803922, 0, 1, 1,
0.5370346, 0.9839268, 0.8486086, 0.3843137, 0, 1, 1,
0.5403512, 1.880321, 0.180949, 0.3921569, 0, 1, 1,
0.5413938, 0.2209368, -0.09216414, 0.3960784, 0, 1, 1,
0.5439399, -1.432994, 0.9674252, 0.4039216, 0, 1, 1,
0.5469728, 0.4333435, 0.6775239, 0.4117647, 0, 1, 1,
0.54816, -0.2851742, 0.785263, 0.4156863, 0, 1, 1,
0.5491362, 0.5124117, -0.3490563, 0.4235294, 0, 1, 1,
0.5525872, -1.644793, 1.931512, 0.427451, 0, 1, 1,
0.5526915, -0.2618374, 1.171164, 0.4352941, 0, 1, 1,
0.5555501, -1.000986, 3.046131, 0.4392157, 0, 1, 1,
0.5556338, -0.9104351, 2.509973, 0.4470588, 0, 1, 1,
0.562023, -1.024565, 2.290136, 0.4509804, 0, 1, 1,
0.5651466, 0.3600293, 1.448294, 0.4588235, 0, 1, 1,
0.5658541, -0.2839211, 4.007253, 0.4627451, 0, 1, 1,
0.5816892, -0.002317643, 0.7063012, 0.4705882, 0, 1, 1,
0.5867557, -0.5126742, 6.677693, 0.4745098, 0, 1, 1,
0.5881562, -0.3663075, 2.727267, 0.4823529, 0, 1, 1,
0.5913261, 0.7340596, 0.9715416, 0.4862745, 0, 1, 1,
0.5922555, -0.01092605, 2.588884, 0.4941176, 0, 1, 1,
0.5947896, 0.1245266, 1.661258, 0.5019608, 0, 1, 1,
0.5965386, 0.4264438, 0.1922864, 0.5058824, 0, 1, 1,
0.601523, -0.4122994, 2.078923, 0.5137255, 0, 1, 1,
0.6024477, -0.6500952, 3.703727, 0.5176471, 0, 1, 1,
0.6028957, 0.6440392, -0.1556538, 0.5254902, 0, 1, 1,
0.6036942, 0.4661785, 1.837654, 0.5294118, 0, 1, 1,
0.6044409, -0.08593351, 0.8758371, 0.5372549, 0, 1, 1,
0.6048158, -2.119158, 3.124489, 0.5411765, 0, 1, 1,
0.6077435, -0.5119501, 2.838907, 0.5490196, 0, 1, 1,
0.6158681, 0.9576902, 1.581747, 0.5529412, 0, 1, 1,
0.6308475, -1.352427, 3.124859, 0.5607843, 0, 1, 1,
0.6314753, -0.9129596, 3.904001, 0.5647059, 0, 1, 1,
0.6350805, 0.1657308, 1.446416, 0.572549, 0, 1, 1,
0.6355604, 1.70987, -0.3841939, 0.5764706, 0, 1, 1,
0.6355615, 0.2468853, 2.352357, 0.5843138, 0, 1, 1,
0.6441725, 0.0278676, 0.1237728, 0.5882353, 0, 1, 1,
0.6461503, 0.3322535, -0.3095074, 0.5960785, 0, 1, 1,
0.6510797, 0.7714238, 0.7545813, 0.6039216, 0, 1, 1,
0.6620411, -0.1780214, 1.34508, 0.6078432, 0, 1, 1,
0.6648645, 0.6771345, 1.176702, 0.6156863, 0, 1, 1,
0.6663402, -0.1758652, 2.253958, 0.6196079, 0, 1, 1,
0.6681936, -0.8633196, 3.265227, 0.627451, 0, 1, 1,
0.6700495, -0.09208249, 1.744568, 0.6313726, 0, 1, 1,
0.6740596, 0.426563, 0.6014215, 0.6392157, 0, 1, 1,
0.6748518, -0.2929102, 1.543193, 0.6431373, 0, 1, 1,
0.682148, -1.348816, 0.7849929, 0.6509804, 0, 1, 1,
0.6828718, 0.2396757, 3.460879, 0.654902, 0, 1, 1,
0.683432, 0.504298, 0.8226757, 0.6627451, 0, 1, 1,
0.6834795, 0.1616028, 3.302979, 0.6666667, 0, 1, 1,
0.6839115, 1.787776, 0.7428172, 0.6745098, 0, 1, 1,
0.6846744, -0.6183377, 0.8874286, 0.6784314, 0, 1, 1,
0.6850164, -0.9073859, 1.608638, 0.6862745, 0, 1, 1,
0.6861954, -1.797607, 2.338599, 0.6901961, 0, 1, 1,
0.6930954, -0.004307188, 2.270704, 0.6980392, 0, 1, 1,
0.6997592, -0.1949829, 1.870553, 0.7058824, 0, 1, 1,
0.7027797, -1.191474, 3.314214, 0.7098039, 0, 1, 1,
0.7027811, -1.027489, 1.811781, 0.7176471, 0, 1, 1,
0.7036088, -0.08764996, 1.98719, 0.7215686, 0, 1, 1,
0.7071838, 0.03738108, 0.2535317, 0.7294118, 0, 1, 1,
0.707357, -1.478399, 2.719328, 0.7333333, 0, 1, 1,
0.7151805, -0.5278924, 2.728431, 0.7411765, 0, 1, 1,
0.7192532, 0.1033369, 1.092058, 0.7450981, 0, 1, 1,
0.7225499, -0.3536386, 3.221837, 0.7529412, 0, 1, 1,
0.7236848, 0.9167861, 0.5214434, 0.7568628, 0, 1, 1,
0.7243713, -1.119796, 3.409918, 0.7647059, 0, 1, 1,
0.7252828, 1.095651, 0.9806111, 0.7686275, 0, 1, 1,
0.7258272, 0.2082902, -0.5272319, 0.7764706, 0, 1, 1,
0.7365383, -1.551849, 4.643996, 0.7803922, 0, 1, 1,
0.7367912, 0.6231253, 1.106058, 0.7882353, 0, 1, 1,
0.7521167, -0.8259963, 3.310533, 0.7921569, 0, 1, 1,
0.7525251, -1.478345, 2.809975, 0.8, 0, 1, 1,
0.753081, 0.3496652, 1.50872, 0.8078431, 0, 1, 1,
0.7599593, -0.8532224, 2.583862, 0.8117647, 0, 1, 1,
0.7630424, -1.141875, 1.913166, 0.8196079, 0, 1, 1,
0.7654917, -1.09127, 2.900847, 0.8235294, 0, 1, 1,
0.7676715, -0.5467867, 2.404549, 0.8313726, 0, 1, 1,
0.770788, -0.3647083, 3.036961, 0.8352941, 0, 1, 1,
0.7736379, 1.296002, -1.002413, 0.8431373, 0, 1, 1,
0.7768189, -0.06415834, 1.002341, 0.8470588, 0, 1, 1,
0.7815537, -0.3158722, -0.3997054, 0.854902, 0, 1, 1,
0.7846339, 0.5994318, 0.1600794, 0.8588235, 0, 1, 1,
0.7846496, 0.08465861, 1.048323, 0.8666667, 0, 1, 1,
0.7915003, 1.374932, 0.5378177, 0.8705882, 0, 1, 1,
0.7944432, 1.360899, 0.5559983, 0.8784314, 0, 1, 1,
0.7977299, -0.4310735, 2.557259, 0.8823529, 0, 1, 1,
0.7985456, 0.2508321, 0.658592, 0.8901961, 0, 1, 1,
0.8007902, 0.744701, 3.003871, 0.8941177, 0, 1, 1,
0.8009794, -0.11468, 0.9318987, 0.9019608, 0, 1, 1,
0.8070627, 0.1326781, 2.428299, 0.9098039, 0, 1, 1,
0.8114381, 0.642619, 0.01784565, 0.9137255, 0, 1, 1,
0.8322011, -1.659725, 1.38738, 0.9215686, 0, 1, 1,
0.8348619, -0.05775276, 1.505886, 0.9254902, 0, 1, 1,
0.8381983, -0.326229, 2.528522, 0.9333333, 0, 1, 1,
0.8440552, 0.7036684, 0.7501947, 0.9372549, 0, 1, 1,
0.8456026, -0.0459835, 2.813761, 0.945098, 0, 1, 1,
0.8462927, 0.5874566, 1.88033, 0.9490196, 0, 1, 1,
0.8464539, -0.4730782, 1.750991, 0.9568627, 0, 1, 1,
0.8468104, 1.885977, 2.03941, 0.9607843, 0, 1, 1,
0.8482559, -1.085316, 2.293869, 0.9686275, 0, 1, 1,
0.855148, -0.8863443, 3.39574, 0.972549, 0, 1, 1,
0.8584378, 0.7593275, 1.491971, 0.9803922, 0, 1, 1,
0.8628888, -0.7515626, 1.021223, 0.9843137, 0, 1, 1,
0.8814408, -0.5031187, 2.797729, 0.9921569, 0, 1, 1,
0.8923014, -1.819172, 2.715746, 0.9960784, 0, 1, 1,
0.8953059, 1.142708, -0.2478476, 1, 0, 0.9960784, 1,
0.8981735, 0.5487289, -0.5212935, 1, 0, 0.9882353, 1,
0.8985668, -0.2156502, 2.348243, 1, 0, 0.9843137, 1,
0.9013233, -1.575161, 2.253177, 1, 0, 0.9764706, 1,
0.9057669, 1.006535, 0.8867924, 1, 0, 0.972549, 1,
0.9087635, -1.131329, 1.521783, 1, 0, 0.9647059, 1,
0.9242777, 0.5713394, 0.7021278, 1, 0, 0.9607843, 1,
0.9252817, 0.7799596, -0.06850506, 1, 0, 0.9529412, 1,
0.9256867, -0.2998614, 0.07492672, 1, 0, 0.9490196, 1,
0.9274743, 0.3798542, 1.765119, 1, 0, 0.9411765, 1,
0.9277936, 1.22504, 0.4646733, 1, 0, 0.9372549, 1,
0.9431121, -0.01999983, 1.316736, 1, 0, 0.9294118, 1,
0.9569517, 0.1378988, 1.241705, 1, 0, 0.9254902, 1,
0.9572127, 1.250509, 0.2823462, 1, 0, 0.9176471, 1,
0.9574728, 1.559673, -0.6781761, 1, 0, 0.9137255, 1,
0.9576839, -1.722776, 0.4955597, 1, 0, 0.9058824, 1,
0.9595962, 0.8608453, 0.06494626, 1, 0, 0.9019608, 1,
0.9616907, -0.5094411, 1.654357, 1, 0, 0.8941177, 1,
0.9640949, 1.766832, -0.1700149, 1, 0, 0.8862745, 1,
0.9694363, -0.2324746, 1.343625, 1, 0, 0.8823529, 1,
0.9747176, 0.2533472, 2.034514, 1, 0, 0.8745098, 1,
0.985713, 0.7991, 0.6885756, 1, 0, 0.8705882, 1,
0.9927806, 0.2873477, 1.150383, 1, 0, 0.8627451, 1,
0.996332, 1.262554, -0.6872502, 1, 0, 0.8588235, 1,
1.002739, -0.6235453, 2.588042, 1, 0, 0.8509804, 1,
1.006048, -0.8229883, 2.948126, 1, 0, 0.8470588, 1,
1.007627, -0.8772356, 2.294964, 1, 0, 0.8392157, 1,
1.017431, 0.2861317, 1.620907, 1, 0, 0.8352941, 1,
1.026007, -0.7451947, 1.206927, 1, 0, 0.827451, 1,
1.026393, 0.4996356, 2.316278, 1, 0, 0.8235294, 1,
1.029176, 0.4373924, 0.7431418, 1, 0, 0.8156863, 1,
1.031067, 1.475927, 2.201166, 1, 0, 0.8117647, 1,
1.048549, 0.04057557, 1.654143, 1, 0, 0.8039216, 1,
1.077351, 1.716264, 0.2874236, 1, 0, 0.7960784, 1,
1.079628, -1.326557, 3.767157, 1, 0, 0.7921569, 1,
1.081281, 1.03531, -0.1976636, 1, 0, 0.7843137, 1,
1.086639, -2.141967, 2.783118, 1, 0, 0.7803922, 1,
1.089343, -0.9642774, 3.086596, 1, 0, 0.772549, 1,
1.096298, -0.03791203, 0.2178331, 1, 0, 0.7686275, 1,
1.098887, -0.7133191, 2.908367, 1, 0, 0.7607843, 1,
1.112997, 0.8969955, 2.386395, 1, 0, 0.7568628, 1,
1.118903, -1.322655, 1.850472, 1, 0, 0.7490196, 1,
1.12619, -0.4616636, 1.374466, 1, 0, 0.7450981, 1,
1.126577, -1.940563, 0.6193033, 1, 0, 0.7372549, 1,
1.128844, 1.938317, 0.8255413, 1, 0, 0.7333333, 1,
1.129564, 0.4025551, 1.927363, 1, 0, 0.7254902, 1,
1.133664, 0.1185968, 0.8129699, 1, 0, 0.7215686, 1,
1.150407, 1.153277, 3.137469, 1, 0, 0.7137255, 1,
1.158129, 0.08252002, 2.396449, 1, 0, 0.7098039, 1,
1.161993, 0.1323916, 0.2044083, 1, 0, 0.7019608, 1,
1.164427, 1.269179, 1.383536, 1, 0, 0.6941177, 1,
1.164945, -0.836984, 2.394772, 1, 0, 0.6901961, 1,
1.170324, -1.976007, 3.84157, 1, 0, 0.682353, 1,
1.174259, 0.3163659, 1.53201, 1, 0, 0.6784314, 1,
1.175684, 1.191805, 0.8487461, 1, 0, 0.6705883, 1,
1.176361, -0.1061859, 2.976136, 1, 0, 0.6666667, 1,
1.178303, -0.9825833, 2.015095, 1, 0, 0.6588235, 1,
1.180016, 1.097611, -0.9655969, 1, 0, 0.654902, 1,
1.18076, -0.1259706, 1.532948, 1, 0, 0.6470588, 1,
1.186288, -2.198464, 4.071828, 1, 0, 0.6431373, 1,
1.187243, 1.605444, 0.4505992, 1, 0, 0.6352941, 1,
1.194815, 0.07977897, -0.4145322, 1, 0, 0.6313726, 1,
1.201265, -1.648553, 4.60183, 1, 0, 0.6235294, 1,
1.207021, -0.7881954, 3.6171, 1, 0, 0.6196079, 1,
1.213094, 0.7019941, 1.263628, 1, 0, 0.6117647, 1,
1.213827, -0.6591828, 1.6087, 1, 0, 0.6078432, 1,
1.220662, 0.0715633, 3.196256, 1, 0, 0.6, 1,
1.222059, -0.7224877, 2.942053, 1, 0, 0.5921569, 1,
1.230109, 0.6905252, -0.355392, 1, 0, 0.5882353, 1,
1.237344, -0.2465754, 2.008746, 1, 0, 0.5803922, 1,
1.254381, -1.137926, 3.079116, 1, 0, 0.5764706, 1,
1.262351, 0.5876878, 1.316777, 1, 0, 0.5686275, 1,
1.271354, -2.123842, 1.922871, 1, 0, 0.5647059, 1,
1.288539, 0.1267609, 1.103455, 1, 0, 0.5568628, 1,
1.291278, -0.6602618, 2.150007, 1, 0, 0.5529412, 1,
1.310897, 0.5320445, -0.2359952, 1, 0, 0.5450981, 1,
1.311207, -0.1918671, 2.097028, 1, 0, 0.5411765, 1,
1.320781, -0.5092338, 3.202644, 1, 0, 0.5333334, 1,
1.324174, -0.1025679, 0.6236104, 1, 0, 0.5294118, 1,
1.327502, 1.103179, 1.583126, 1, 0, 0.5215687, 1,
1.343027, 1.744336, 0.6011748, 1, 0, 0.5176471, 1,
1.348627, -0.04258658, 1.345225, 1, 0, 0.509804, 1,
1.355072, -0.4593826, 0.6529586, 1, 0, 0.5058824, 1,
1.361585, 1.089233, 0.5390282, 1, 0, 0.4980392, 1,
1.361974, -0.07388697, 1.483946, 1, 0, 0.4901961, 1,
1.380143, 0.9922317, 2.082425, 1, 0, 0.4862745, 1,
1.383973, -0.0743084, 2.23114, 1, 0, 0.4784314, 1,
1.384137, 0.4182251, 3.794503, 1, 0, 0.4745098, 1,
1.387262, -1.240533, 3.211155, 1, 0, 0.4666667, 1,
1.42295, -1.095173, 4.111443, 1, 0, 0.4627451, 1,
1.469965, -1.774157, 1.51242, 1, 0, 0.454902, 1,
1.476371, 0.5976649, 0.4497737, 1, 0, 0.4509804, 1,
1.490037, -0.5839703, 1.748299, 1, 0, 0.4431373, 1,
1.494059, 0.6311371, 1.546723, 1, 0, 0.4392157, 1,
1.494182, 1.173621, -0.6367359, 1, 0, 0.4313726, 1,
1.518052, -1.183634, 2.602326, 1, 0, 0.427451, 1,
1.522888, 0.1496387, 3.071643, 1, 0, 0.4196078, 1,
1.530214, -0.3759753, -0.1846101, 1, 0, 0.4156863, 1,
1.548985, -0.3194439, 1.206131, 1, 0, 0.4078431, 1,
1.559324, 0.3064288, 1.121859, 1, 0, 0.4039216, 1,
1.597188, 1.249304, 0.8983023, 1, 0, 0.3960784, 1,
1.606194, 0.4008552, 2.631974, 1, 0, 0.3882353, 1,
1.608047, -0.06375492, 0.2090018, 1, 0, 0.3843137, 1,
1.612837, -1.464292, 1.620423, 1, 0, 0.3764706, 1,
1.616511, 2.106457, 0.696972, 1, 0, 0.372549, 1,
1.616764, 0.8307663, 2.346561, 1, 0, 0.3647059, 1,
1.619032, 2.158226, 2.088159, 1, 0, 0.3607843, 1,
1.624035, -1.669062, 2.30334, 1, 0, 0.3529412, 1,
1.63007, 1.374664, 1.211375, 1, 0, 0.3490196, 1,
1.64211, -0.3961851, 2.792109, 1, 0, 0.3411765, 1,
1.649232, -0.02076388, 0.7387033, 1, 0, 0.3372549, 1,
1.656412, -0.7731165, 1.52398, 1, 0, 0.3294118, 1,
1.667738, 1.606289, 1.545295, 1, 0, 0.3254902, 1,
1.673732, 0.8168244, 0.828209, 1, 0, 0.3176471, 1,
1.674313, -0.9426761, 1.845113, 1, 0, 0.3137255, 1,
1.674827, -1.251093, 1.026703, 1, 0, 0.3058824, 1,
1.675861, 0.538434, 1.492994, 1, 0, 0.2980392, 1,
1.684214, 1.093652, 1.155534, 1, 0, 0.2941177, 1,
1.684651, -0.008186963, 0.1731303, 1, 0, 0.2862745, 1,
1.687525, -0.1159422, 0.6137349, 1, 0, 0.282353, 1,
1.687927, 1.826992, 0.2261558, 1, 0, 0.2745098, 1,
1.695536, 0.3604848, 0.9103006, 1, 0, 0.2705882, 1,
1.701945, 0.4998923, 1.716788, 1, 0, 0.2627451, 1,
1.711805, -1.299914, 2.397013, 1, 0, 0.2588235, 1,
1.749888, -0.7974159, 1.654604, 1, 0, 0.2509804, 1,
1.776843, -0.6161324, 2.24345, 1, 0, 0.2470588, 1,
1.784423, 0.4457287, 1.903283, 1, 0, 0.2392157, 1,
1.799122, 0.1903733, 1.837616, 1, 0, 0.2352941, 1,
1.810221, -0.7172252, 2.721561, 1, 0, 0.227451, 1,
1.818737, -0.9298923, 1.750145, 1, 0, 0.2235294, 1,
1.827324, -1.268769, 0.337622, 1, 0, 0.2156863, 1,
1.837595, -1.476089, 2.318664, 1, 0, 0.2117647, 1,
1.841064, -1.425622, 3.353617, 1, 0, 0.2039216, 1,
1.842563, 0.1622699, 1.018263, 1, 0, 0.1960784, 1,
1.879002, -0.2044056, 1.452892, 1, 0, 0.1921569, 1,
1.907387, 0.4055346, 2.563308, 1, 0, 0.1843137, 1,
1.93525, -2.056447, 2.096876, 1, 0, 0.1803922, 1,
1.965895, -0.2630732, 1.346891, 1, 0, 0.172549, 1,
1.978563, -0.645575, 1.805184, 1, 0, 0.1686275, 1,
1.987853, -0.1682055, 0.9955487, 1, 0, 0.1607843, 1,
1.995642, 0.4758309, 2.006018, 1, 0, 0.1568628, 1,
2.006265, -0.471953, 2.336438, 1, 0, 0.1490196, 1,
2.006356, -0.1250194, 2.507609, 1, 0, 0.145098, 1,
2.009685, 1.117673, -0.7868029, 1, 0, 0.1372549, 1,
2.011112, 1.76681, 1.025447, 1, 0, 0.1333333, 1,
2.026882, -0.9553865, 2.032257, 1, 0, 0.1254902, 1,
2.030921, 0.7911505, 1.836555, 1, 0, 0.1215686, 1,
2.141355, -0.2491876, 1.574963, 1, 0, 0.1137255, 1,
2.154776, 0.2778149, 2.329793, 1, 0, 0.1098039, 1,
2.167218, -0.1603846, 0.6902827, 1, 0, 0.1019608, 1,
2.176912, 1.003806, -1.159945, 1, 0, 0.09411765, 1,
2.211042, -0.3274931, 4.202862, 1, 0, 0.09019608, 1,
2.212135, 0.6505055, 0.8275348, 1, 0, 0.08235294, 1,
2.268404, -2.467116, 4.029927, 1, 0, 0.07843138, 1,
2.304114, -1.323117, 2.837562, 1, 0, 0.07058824, 1,
2.307168, -0.2494777, 2.43347, 1, 0, 0.06666667, 1,
2.401027, -0.5399123, -0.2557085, 1, 0, 0.05882353, 1,
2.428846, -0.3071619, 1.999026, 1, 0, 0.05490196, 1,
2.440821, 2.259837, 0.3657254, 1, 0, 0.04705882, 1,
2.467714, -0.1797017, 0.103582, 1, 0, 0.04313726, 1,
2.523548, -0.1888078, 2.21072, 1, 0, 0.03529412, 1,
2.60932, -0.2283319, 2.567268, 1, 0, 0.03137255, 1,
2.639294, -0.009093844, 2.338461, 1, 0, 0.02352941, 1,
2.737196, 1.086672, -0.8259816, 1, 0, 0.01960784, 1,
2.792041, -0.4192962, 1.065854, 1, 0, 0.01176471, 1,
2.867942, -0.2377706, 2.138308, 1, 0, 0.007843138, 1
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
-0.2599233, -4.546882, -7.311028, 0, -0.5, 0.5, 0.5,
-0.2599233, -4.546882, -7.311028, 1, -0.5, 0.5, 0.5,
-0.2599233, -4.546882, -7.311028, 1, 1.5, 0.5, 0.5,
-0.2599233, -4.546882, -7.311028, 0, 1.5, 0.5, 0.5
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
-4.448135, -0.1464244, -7.311028, 0, -0.5, 0.5, 0.5,
-4.448135, -0.1464244, -7.311028, 1, -0.5, 0.5, 0.5,
-4.448135, -0.1464244, -7.311028, 1, 1.5, 0.5, 0.5,
-4.448135, -0.1464244, -7.311028, 0, 1.5, 0.5, 0.5
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
-4.448135, -4.546882, 0.6970515, 0, -0.5, 0.5, 0.5,
-4.448135, -4.546882, 0.6970515, 1, -0.5, 0.5, 0.5,
-4.448135, -4.546882, 0.6970515, 1, 1.5, 0.5, 0.5,
-4.448135, -4.546882, 0.6970515, 0, 1.5, 0.5, 0.5
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
-3, -3.531392, -5.463009,
2, -3.531392, -5.463009,
-3, -3.531392, -5.463009,
-3, -3.70064, -5.771013,
-2, -3.531392, -5.463009,
-2, -3.70064, -5.771013,
-1, -3.531392, -5.463009,
-1, -3.70064, -5.771013,
0, -3.531392, -5.463009,
0, -3.70064, -5.771013,
1, -3.531392, -5.463009,
1, -3.70064, -5.771013,
2, -3.531392, -5.463009,
2, -3.70064, -5.771013
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
-3, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
-3, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
-3, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
-3, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5,
-2, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
-2, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
-2, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
-2, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5,
-1, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
-1, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
-1, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
-1, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5,
0, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
0, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
0, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
0, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5,
1, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
1, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
1, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
1, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5,
2, -4.039136, -6.387019, 0, -0.5, 0.5, 0.5,
2, -4.039136, -6.387019, 1, -0.5, 0.5, 0.5,
2, -4.039136, -6.387019, 1, 1.5, 0.5, 0.5,
2, -4.039136, -6.387019, 0, 1.5, 0.5, 0.5
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
-3.481625, -3, -5.463009,
-3.481625, 3, -5.463009,
-3.481625, -3, -5.463009,
-3.642709, -3, -5.771013,
-3.481625, -2, -5.463009,
-3.642709, -2, -5.771013,
-3.481625, -1, -5.463009,
-3.642709, -1, -5.771013,
-3.481625, 0, -5.463009,
-3.642709, 0, -5.771013,
-3.481625, 1, -5.463009,
-3.642709, 1, -5.771013,
-3.481625, 2, -5.463009,
-3.642709, 2, -5.771013,
-3.481625, 3, -5.463009,
-3.642709, 3, -5.771013
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
-3.96488, -3, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, -3, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, -3, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, -3, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, -2, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, -2, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, -2, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, -2, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, -1, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, -1, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, -1, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, -1, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, 0, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, 0, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, 0, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, 0, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, 1, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, 1, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, 1, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, 1, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, 2, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, 2, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, 2, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, 2, -6.387019, 0, 1.5, 0.5, 0.5,
-3.96488, 3, -6.387019, 0, -0.5, 0.5, 0.5,
-3.96488, 3, -6.387019, 1, -0.5, 0.5, 0.5,
-3.96488, 3, -6.387019, 1, 1.5, 0.5, 0.5,
-3.96488, 3, -6.387019, 0, 1.5, 0.5, 0.5
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
-3.481625, -3.531392, -4,
-3.481625, -3.531392, 6,
-3.481625, -3.531392, -4,
-3.642709, -3.70064, -4,
-3.481625, -3.531392, -2,
-3.642709, -3.70064, -2,
-3.481625, -3.531392, 0,
-3.642709, -3.70064, 0,
-3.481625, -3.531392, 2,
-3.642709, -3.70064, 2,
-3.481625, -3.531392, 4,
-3.642709, -3.70064, 4,
-3.481625, -3.531392, 6,
-3.642709, -3.70064, 6
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
"4",
"6"
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
-3.96488, -4.039136, -4, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, -4, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, -4, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, -4, 0, 1.5, 0.5, 0.5,
-3.96488, -4.039136, -2, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, -2, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, -2, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, -2, 0, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 0, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 0, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 0, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 0, 0, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 2, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 2, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 2, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 2, 0, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 4, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 4, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 4, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 4, 0, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 6, 0, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 6, 1, -0.5, 0.5, 0.5,
-3.96488, -4.039136, 6, 1, 1.5, 0.5, 0.5,
-3.96488, -4.039136, 6, 0, 1.5, 0.5, 0.5
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
-3.481625, -3.531392, -5.463009,
-3.481625, 3.238543, -5.463009,
-3.481625, -3.531392, 6.857112,
-3.481625, 3.238543, 6.857112,
-3.481625, -3.531392, -5.463009,
-3.481625, -3.531392, 6.857112,
-3.481625, 3.238543, -5.463009,
-3.481625, 3.238543, 6.857112,
-3.481625, -3.531392, -5.463009,
2.961778, -3.531392, -5.463009,
-3.481625, -3.531392, 6.857112,
2.961778, -3.531392, 6.857112,
-3.481625, 3.238543, -5.463009,
2.961778, 3.238543, -5.463009,
-3.481625, 3.238543, 6.857112,
2.961778, 3.238543, 6.857112,
2.961778, -3.531392, -5.463009,
2.961778, 3.238543, -5.463009,
2.961778, -3.531392, 6.857112,
2.961778, 3.238543, 6.857112,
2.961778, -3.531392, -5.463009,
2.961778, -3.531392, 6.857112,
2.961778, 3.238543, -5.463009,
2.961778, 3.238543, 6.857112
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
var radius = 8.257468;
var distance = 36.73841;
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
mvMatrix.translate( 0.2599233, 0.1464244, -0.6970515 );
mvMatrix.scale( 1.385625, 1.318792, 0.7246792 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.73841);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


