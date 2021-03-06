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
-3.766292, 0.5185385, -1.152927, 1, 0, 0, 1,
-3.171721, 0.2147426, -1.322311, 1, 0.007843138, 0, 1,
-2.812074, 1.519511, -2.003476, 1, 0.01176471, 0, 1,
-2.761781, 0.04540117, -0.6784868, 1, 0.01960784, 0, 1,
-2.750383, 2.030165, -2.275503, 1, 0.02352941, 0, 1,
-2.711687, 0.10347, -3.777739, 1, 0.03137255, 0, 1,
-2.493144, -0.7223363, -0.4245245, 1, 0.03529412, 0, 1,
-2.482269, -1.678382, -3.107939, 1, 0.04313726, 0, 1,
-2.460685, -1.037107, -2.323321, 1, 0.04705882, 0, 1,
-2.455914, -0.938929, -0.6848769, 1, 0.05490196, 0, 1,
-2.439317, -0.2738912, -1.326631, 1, 0.05882353, 0, 1,
-2.41923, 0.1628451, -1.085206, 1, 0.06666667, 0, 1,
-2.367029, -2.100099, -1.875692, 1, 0.07058824, 0, 1,
-2.31014, 0.6185158, -1.688807, 1, 0.07843138, 0, 1,
-2.266989, 0.648329, -0.06431721, 1, 0.08235294, 0, 1,
-2.225026, 0.5829625, -1.26645, 1, 0.09019608, 0, 1,
-2.223416, 0.5993827, -0.816738, 1, 0.09411765, 0, 1,
-2.177155, -0.5958823, -1.086879, 1, 0.1019608, 0, 1,
-2.168926, -1.204988, -1.825692, 1, 0.1098039, 0, 1,
-2.16275, 0.3471466, -1.102935, 1, 0.1137255, 0, 1,
-2.116955, -0.07864989, -3.623418, 1, 0.1215686, 0, 1,
-2.089519, 0.662116, -2.5864, 1, 0.1254902, 0, 1,
-2.046995, -0.5241684, -2.266466, 1, 0.1333333, 0, 1,
-2.037641, -1.392756, -4.215147, 1, 0.1372549, 0, 1,
-2.008773, -0.9725416, -1.690864, 1, 0.145098, 0, 1,
-1.972045, -0.01364031, -2.811379, 1, 0.1490196, 0, 1,
-1.951882, -0.8567894, 0.3328457, 1, 0.1568628, 0, 1,
-1.931892, 1.711772, -1.467234, 1, 0.1607843, 0, 1,
-1.904474, 0.457005, -2.181199, 1, 0.1686275, 0, 1,
-1.904065, -0.3204459, -1.749125, 1, 0.172549, 0, 1,
-1.896733, 0.2714772, -2.443406, 1, 0.1803922, 0, 1,
-1.893201, 1.114016, 1.002558, 1, 0.1843137, 0, 1,
-1.858617, -1.194857, -1.575247, 1, 0.1921569, 0, 1,
-1.855863, 0.2797901, -0.8243136, 1, 0.1960784, 0, 1,
-1.846471, 0.9758325, -1.692746, 1, 0.2039216, 0, 1,
-1.843647, 1.192885, -0.7832797, 1, 0.2117647, 0, 1,
-1.81289, -0.1576659, -1.431135, 1, 0.2156863, 0, 1,
-1.812286, 0.4251345, -2.071931, 1, 0.2235294, 0, 1,
-1.807815, 0.5647072, -1.254796, 1, 0.227451, 0, 1,
-1.799776, -0.3887543, -1.725617, 1, 0.2352941, 0, 1,
-1.780433, -2.108113, -2.236317, 1, 0.2392157, 0, 1,
-1.776367, -0.9060597, -4.390316, 1, 0.2470588, 0, 1,
-1.77442, -0.8485653, -0.1375545, 1, 0.2509804, 0, 1,
-1.765599, -0.01871481, -1.381554, 1, 0.2588235, 0, 1,
-1.72989, 2.195532, -0.9345685, 1, 0.2627451, 0, 1,
-1.716421, -3.325203, -0.5393587, 1, 0.2705882, 0, 1,
-1.715311, 1.431537, -0.3481161, 1, 0.2745098, 0, 1,
-1.715197, -0.9378709, -3.051629, 1, 0.282353, 0, 1,
-1.709391, 0.6900069, -2.914915, 1, 0.2862745, 0, 1,
-1.703355, -2.319303, -2.428665, 1, 0.2941177, 0, 1,
-1.70255, 0.3854536, -1.372145, 1, 0.3019608, 0, 1,
-1.701295, 0.1368869, -1.436426, 1, 0.3058824, 0, 1,
-1.697, 0.4313777, -2.008279, 1, 0.3137255, 0, 1,
-1.669281, -0.3956632, -2.501547, 1, 0.3176471, 0, 1,
-1.663443, -0.149165, -1.366458, 1, 0.3254902, 0, 1,
-1.662448, 0.2176618, -1.336376, 1, 0.3294118, 0, 1,
-1.661127, 0.1659164, -0.8642048, 1, 0.3372549, 0, 1,
-1.65263, -0.3786725, -2.327654, 1, 0.3411765, 0, 1,
-1.638548, -2.272428, -0.967975, 1, 0.3490196, 0, 1,
-1.615362, -0.515128, -1.121364, 1, 0.3529412, 0, 1,
-1.614266, 0.1833097, -1.400609, 1, 0.3607843, 0, 1,
-1.610615, -0.3298355, -1.848119, 1, 0.3647059, 0, 1,
-1.588968, -0.2433543, -1.74506, 1, 0.372549, 0, 1,
-1.58723, 0.4058153, -1.05023, 1, 0.3764706, 0, 1,
-1.568718, -0.2809404, -1.565067, 1, 0.3843137, 0, 1,
-1.55045, 0.5376002, -2.60741, 1, 0.3882353, 0, 1,
-1.537213, -0.1548636, 0.7019163, 1, 0.3960784, 0, 1,
-1.529588, -0.3616641, -3.843177, 1, 0.4039216, 0, 1,
-1.527927, 0.1382909, -1.007284, 1, 0.4078431, 0, 1,
-1.517642, 0.3288096, -3.000567, 1, 0.4156863, 0, 1,
-1.513231, 0.06653568, -2.54619, 1, 0.4196078, 0, 1,
-1.51144, 0.575766, 0.1442532, 1, 0.427451, 0, 1,
-1.511159, -1.045518, -1.587707, 1, 0.4313726, 0, 1,
-1.500728, -0.3335318, -0.8303931, 1, 0.4392157, 0, 1,
-1.496718, 0.181927, 1.235487, 1, 0.4431373, 0, 1,
-1.495418, 0.3214335, -2.663401, 1, 0.4509804, 0, 1,
-1.492813, 2.122678, -0.6808268, 1, 0.454902, 0, 1,
-1.47565, -0.7783956, -2.154364, 1, 0.4627451, 0, 1,
-1.459645, -2.674263, -3.184092, 1, 0.4666667, 0, 1,
-1.455285, 0.6407095, -1.931752, 1, 0.4745098, 0, 1,
-1.446316, -0.9453436, -1.845445, 1, 0.4784314, 0, 1,
-1.443387, 1.311511, -1.176123, 1, 0.4862745, 0, 1,
-1.440393, 0.7487611, 1.024425, 1, 0.4901961, 0, 1,
-1.417927, -1.275156, -3.567602, 1, 0.4980392, 0, 1,
-1.412386, -1.672116, -1.918941, 1, 0.5058824, 0, 1,
-1.408686, 0.4938113, -1.828281, 1, 0.509804, 0, 1,
-1.407031, 0.2702087, -2.026563, 1, 0.5176471, 0, 1,
-1.403648, 0.6094977, 0.299074, 1, 0.5215687, 0, 1,
-1.403028, 0.1460171, -3.727029, 1, 0.5294118, 0, 1,
-1.390785, -0.2077832, -1.01305, 1, 0.5333334, 0, 1,
-1.375579, -0.7066334, -1.554268, 1, 0.5411765, 0, 1,
-1.371509, -1.18048, -2.44274, 1, 0.5450981, 0, 1,
-1.36086, -2.528936, -1.054303, 1, 0.5529412, 0, 1,
-1.346585, -1.971089, -1.903191, 1, 0.5568628, 0, 1,
-1.343521, -0.138632, -1.70859, 1, 0.5647059, 0, 1,
-1.332249, 1.218748, -0.9077269, 1, 0.5686275, 0, 1,
-1.323707, 1.485283, -0.7678274, 1, 0.5764706, 0, 1,
-1.319557, 0.7561182, -0.8800383, 1, 0.5803922, 0, 1,
-1.31871, -0.4890447, -2.82981, 1, 0.5882353, 0, 1,
-1.317671, 0.3788123, -1.840252, 1, 0.5921569, 0, 1,
-1.31709, 0.5179662, -2.03242, 1, 0.6, 0, 1,
-1.316017, 0.8173087, -0.4103803, 1, 0.6078432, 0, 1,
-1.313798, 1.125644, -0.4977678, 1, 0.6117647, 0, 1,
-1.301889, -0.1245278, -2.291503, 1, 0.6196079, 0, 1,
-1.298579, 0.1573676, -1.378202, 1, 0.6235294, 0, 1,
-1.285035, -0.3630401, -2.901666, 1, 0.6313726, 0, 1,
-1.279648, -1.0533, -1.342214, 1, 0.6352941, 0, 1,
-1.2675, -0.2940736, -0.9441758, 1, 0.6431373, 0, 1,
-1.262378, 0.5572959, 0.1658418, 1, 0.6470588, 0, 1,
-1.259501, 1.020345, -0.6477476, 1, 0.654902, 0, 1,
-1.259035, 1.627844, 0.03146958, 1, 0.6588235, 0, 1,
-1.257652, -0.8809664, -1.120665, 1, 0.6666667, 0, 1,
-1.247979, 0.7588585, -2.172807, 1, 0.6705883, 0, 1,
-1.246558, -1.14401, -2.575666, 1, 0.6784314, 0, 1,
-1.246306, -0.9059288, -2.99741, 1, 0.682353, 0, 1,
-1.244241, -0.7037511, -3.308916, 1, 0.6901961, 0, 1,
-1.243975, -0.7015408, -1.431201, 1, 0.6941177, 0, 1,
-1.238547, -0.50832, -2.893659, 1, 0.7019608, 0, 1,
-1.235971, -1.265333, -4.195992, 1, 0.7098039, 0, 1,
-1.235494, -0.4790729, -0.3740003, 1, 0.7137255, 0, 1,
-1.232515, 0.04398321, -1.054534, 1, 0.7215686, 0, 1,
-1.225806, 0.3827333, -1.202415, 1, 0.7254902, 0, 1,
-1.217873, 0.1352014, -2.351705, 1, 0.7333333, 0, 1,
-1.217486, 1.203933, 0.207725, 1, 0.7372549, 0, 1,
-1.209337, -0.2384238, -4.417466, 1, 0.7450981, 0, 1,
-1.205298, -1.628933, -1.734978, 1, 0.7490196, 0, 1,
-1.203723, 0.2294448, -1.761733, 1, 0.7568628, 0, 1,
-1.195628, -2.079452, -2.131685, 1, 0.7607843, 0, 1,
-1.186026, -0.610317, -0.9921645, 1, 0.7686275, 0, 1,
-1.184672, 1.511014, -0.7781832, 1, 0.772549, 0, 1,
-1.174611, -1.596224, -2.371609, 1, 0.7803922, 0, 1,
-1.17246, 0.0942492, -2.144821, 1, 0.7843137, 0, 1,
-1.162472, -0.9826052, -1.871593, 1, 0.7921569, 0, 1,
-1.155592, 1.442626, -0.199424, 1, 0.7960784, 0, 1,
-1.154569, 1.369589, -0.559857, 1, 0.8039216, 0, 1,
-1.153427, -0.286905, -1.966014, 1, 0.8117647, 0, 1,
-1.14781, -1.54989, -1.875569, 1, 0.8156863, 0, 1,
-1.143595, -0.4118422, -1.883297, 1, 0.8235294, 0, 1,
-1.127024, 0.05324011, -3.219796, 1, 0.827451, 0, 1,
-1.126435, 0.6459009, 0.7580571, 1, 0.8352941, 0, 1,
-1.121196, 0.3914323, -2.485864, 1, 0.8392157, 0, 1,
-1.110963, 1.447286, -0.2793338, 1, 0.8470588, 0, 1,
-1.091185, -0.5498936, -1.477843, 1, 0.8509804, 0, 1,
-1.090424, -0.2527418, -1.222431, 1, 0.8588235, 0, 1,
-1.08898, 0.8625554, -1.694108, 1, 0.8627451, 0, 1,
-1.081989, 0.5601848, -0.6016914, 1, 0.8705882, 0, 1,
-1.075709, -1.325624, -1.714432, 1, 0.8745098, 0, 1,
-1.0724, -0.7093973, -1.23174, 1, 0.8823529, 0, 1,
-1.066705, 1.266649, -0.5902476, 1, 0.8862745, 0, 1,
-1.064946, 1.299737, 0.2263302, 1, 0.8941177, 0, 1,
-1.064546, 0.2790155, -2.646151, 1, 0.8980392, 0, 1,
-1.063768, 0.1994947, -2.559097, 1, 0.9058824, 0, 1,
-1.061615, 0.7384741, 0.006489588, 1, 0.9137255, 0, 1,
-1.054023, 0.1663495, -1.786414, 1, 0.9176471, 0, 1,
-1.053093, -1.065194, -2.285616, 1, 0.9254902, 0, 1,
-1.05104, -0.321816, -2.690123, 1, 0.9294118, 0, 1,
-1.047985, -0.3183034, -2.623573, 1, 0.9372549, 0, 1,
-1.044398, 0.9528607, -1.195204, 1, 0.9411765, 0, 1,
-1.035178, -0.688254, -1.589022, 1, 0.9490196, 0, 1,
-1.033984, 2.325883, 0.5073612, 1, 0.9529412, 0, 1,
-1.032919, 0.672998, -1.345563, 1, 0.9607843, 0, 1,
-1.027851, -1.447132, -1.708192, 1, 0.9647059, 0, 1,
-1.023778, 2.135503, -0.392825, 1, 0.972549, 0, 1,
-1.022416, 0.4909838, -0.7859625, 1, 0.9764706, 0, 1,
-1.021085, -0.8968689, -3.105062, 1, 0.9843137, 0, 1,
-1.017852, -0.353025, -1.89476, 1, 0.9882353, 0, 1,
-1.01655, 1.092914, -1.843601, 1, 0.9960784, 0, 1,
-1.013801, -1.726395, -3.308738, 0.9960784, 1, 0, 1,
-1.011811, 1.865391, -1.067139, 0.9921569, 1, 0, 1,
-1.010332, -1.570505, -1.986914, 0.9843137, 1, 0, 1,
-1.001352, 1.300835, 1.045818, 0.9803922, 1, 0, 1,
-1.00101, 0.0129559, -2.903948, 0.972549, 1, 0, 1,
-0.9942327, 1.829095, -0.2791929, 0.9686275, 1, 0, 1,
-0.9883316, -0.2926592, -1.837313, 0.9607843, 1, 0, 1,
-0.9782817, -0.2090435, -1.357764, 0.9568627, 1, 0, 1,
-0.9733582, 0.6375719, -1.008134, 0.9490196, 1, 0, 1,
-0.9726261, 1.376709, 0.655466, 0.945098, 1, 0, 1,
-0.9725389, -0.1721997, -1.056317, 0.9372549, 1, 0, 1,
-0.964206, 0.2446024, -1.80893, 0.9333333, 1, 0, 1,
-0.961969, -0.03843524, -0.6168366, 0.9254902, 1, 0, 1,
-0.9569105, -0.3709802, -3.564523, 0.9215686, 1, 0, 1,
-0.9551422, 0.02840914, -2.538854, 0.9137255, 1, 0, 1,
-0.9534252, 2.18978, -2.751622, 0.9098039, 1, 0, 1,
-0.9433317, -0.1030934, -0.4691113, 0.9019608, 1, 0, 1,
-0.9406974, -0.6056622, -2.874082, 0.8941177, 1, 0, 1,
-0.9375679, -1.962519, -3.848977, 0.8901961, 1, 0, 1,
-0.9366052, 0.2612593, 0.8494317, 0.8823529, 1, 0, 1,
-0.9275361, 0.3340601, -2.445632, 0.8784314, 1, 0, 1,
-0.9195654, -1.622862, -2.639751, 0.8705882, 1, 0, 1,
-0.9194806, 2.411701, -0.07221583, 0.8666667, 1, 0, 1,
-0.9193003, -0.9546301, -2.053316, 0.8588235, 1, 0, 1,
-0.9129462, 0.8976288, -1.443458, 0.854902, 1, 0, 1,
-0.9015007, -1.515481, -2.708492, 0.8470588, 1, 0, 1,
-0.8861662, 0.1543544, -0.9028385, 0.8431373, 1, 0, 1,
-0.8857402, 1.369957, 0.4517388, 0.8352941, 1, 0, 1,
-0.8847423, -0.3435299, -2.680456, 0.8313726, 1, 0, 1,
-0.8826366, 2.218003, 0.7022805, 0.8235294, 1, 0, 1,
-0.8762403, -0.5579692, -2.703823, 0.8196079, 1, 0, 1,
-0.8753387, 2.575888, -0.3899397, 0.8117647, 1, 0, 1,
-0.8718746, 0.7075818, -1.162528, 0.8078431, 1, 0, 1,
-0.8708834, -0.2847498, -1.200291, 0.8, 1, 0, 1,
-0.8705275, 0.725859, -1.39581, 0.7921569, 1, 0, 1,
-0.8633189, -0.4256012, -3.08361, 0.7882353, 1, 0, 1,
-0.8626598, 0.397363, 0.008476221, 0.7803922, 1, 0, 1,
-0.8612821, 0.1873899, -4.017708, 0.7764706, 1, 0, 1,
-0.860298, -0.9549798, -2.797915, 0.7686275, 1, 0, 1,
-0.855799, -1.364002, -3.497303, 0.7647059, 1, 0, 1,
-0.8468376, -0.8286408, -2.654576, 0.7568628, 1, 0, 1,
-0.8450634, 0.9098102, -0.5535633, 0.7529412, 1, 0, 1,
-0.8364493, -1.676418, -3.431297, 0.7450981, 1, 0, 1,
-0.8326252, -1.449589, -2.96367, 0.7411765, 1, 0, 1,
-0.8308782, 0.2222317, -1.567831, 0.7333333, 1, 0, 1,
-0.8265428, -2.278557, -3.018376, 0.7294118, 1, 0, 1,
-0.8265004, -0.2271955, -3.364479, 0.7215686, 1, 0, 1,
-0.8226215, -0.01597001, -2.264054, 0.7176471, 1, 0, 1,
-0.8220447, 0.05160746, -0.3633956, 0.7098039, 1, 0, 1,
-0.8187146, 0.9594002, -0.3317951, 0.7058824, 1, 0, 1,
-0.8124869, -1.931144, -2.717189, 0.6980392, 1, 0, 1,
-0.794236, 0.2506565, -1.614146, 0.6901961, 1, 0, 1,
-0.7920913, -0.7093188, -2.323555, 0.6862745, 1, 0, 1,
-0.7913229, -0.6113226, -3.032778, 0.6784314, 1, 0, 1,
-0.7876996, -1.687359, -3.220797, 0.6745098, 1, 0, 1,
-0.7830524, -0.06307324, -0.6589078, 0.6666667, 1, 0, 1,
-0.7746281, 0.9587544, 0.4972172, 0.6627451, 1, 0, 1,
-0.7663833, -0.5740997, -1.436088, 0.654902, 1, 0, 1,
-0.7656868, -0.008462701, -0.0003639938, 0.6509804, 1, 0, 1,
-0.7632927, 0.8440516, -1.412406, 0.6431373, 1, 0, 1,
-0.7628811, -1.259966, -3.406229, 0.6392157, 1, 0, 1,
-0.7613318, -1.137486, -3.635575, 0.6313726, 1, 0, 1,
-0.7483948, 0.4643948, -1.735244, 0.627451, 1, 0, 1,
-0.7460904, 0.604947, -1.371396, 0.6196079, 1, 0, 1,
-0.7394007, 0.7599466, 1.643616, 0.6156863, 1, 0, 1,
-0.7307322, -1.559474, -2.326146, 0.6078432, 1, 0, 1,
-0.7295818, 0.527271, -0.4812662, 0.6039216, 1, 0, 1,
-0.7264463, -0.2571386, -1.278528, 0.5960785, 1, 0, 1,
-0.7251021, -0.9949677, -3.092095, 0.5882353, 1, 0, 1,
-0.7200193, -0.6606661, -1.271898, 0.5843138, 1, 0, 1,
-0.7184092, -0.6662354, -2.800704, 0.5764706, 1, 0, 1,
-0.7171705, 0.9567505, 0.8984008, 0.572549, 1, 0, 1,
-0.7138335, 0.7391272, 0.06973848, 0.5647059, 1, 0, 1,
-0.7092903, 0.7769598, -0.1656464, 0.5607843, 1, 0, 1,
-0.7039004, 0.6833831, -0.6573094, 0.5529412, 1, 0, 1,
-0.6977252, 1.376507, 1.611126, 0.5490196, 1, 0, 1,
-0.6953406, 1.74006, 1.331627, 0.5411765, 1, 0, 1,
-0.6921211, -1.785633, -4.575896, 0.5372549, 1, 0, 1,
-0.6918904, 0.4571092, 0.2262079, 0.5294118, 1, 0, 1,
-0.6905982, -0.2762076, -1.273227, 0.5254902, 1, 0, 1,
-0.6880304, 0.4012291, -1.4411, 0.5176471, 1, 0, 1,
-0.6814543, -0.2203517, -1.022567, 0.5137255, 1, 0, 1,
-0.6798376, 0.8740839, -3.799138, 0.5058824, 1, 0, 1,
-0.6765999, -1.014227, -3.095052, 0.5019608, 1, 0, 1,
-0.6763463, 0.6837349, -0.8442166, 0.4941176, 1, 0, 1,
-0.6755118, -0.0626905, -1.306425, 0.4862745, 1, 0, 1,
-0.6738296, -0.5617967, -1.351129, 0.4823529, 1, 0, 1,
-0.673168, 1.137907, -0.4290676, 0.4745098, 1, 0, 1,
-0.6707837, -0.6521133, -2.206644, 0.4705882, 1, 0, 1,
-0.6699709, -0.9079455, -3.291774, 0.4627451, 1, 0, 1,
-0.6677169, -1.229436, -2.397258, 0.4588235, 1, 0, 1,
-0.665377, 0.7544047, -0.3644097, 0.4509804, 1, 0, 1,
-0.65544, 1.394127, -1.305602, 0.4470588, 1, 0, 1,
-0.6553209, -0.4731992, -0.3264846, 0.4392157, 1, 0, 1,
-0.6514828, -1.198689, -1.805641, 0.4352941, 1, 0, 1,
-0.6491207, -0.7720524, -2.968099, 0.427451, 1, 0, 1,
-0.647315, -0.06457043, -2.761169, 0.4235294, 1, 0, 1,
-0.6438586, 1.384585, 0.0561208, 0.4156863, 1, 0, 1,
-0.6395129, -0.4985934, -2.53815, 0.4117647, 1, 0, 1,
-0.6382369, 1.508462, -0.156114, 0.4039216, 1, 0, 1,
-0.6352527, 0.0696746, -1.621903, 0.3960784, 1, 0, 1,
-0.6283015, -0.2973419, -0.7718371, 0.3921569, 1, 0, 1,
-0.6239582, -0.05444483, -2.181321, 0.3843137, 1, 0, 1,
-0.6238388, 0.5341009, -0.3129274, 0.3803922, 1, 0, 1,
-0.6212866, 0.9778513, -0.6218617, 0.372549, 1, 0, 1,
-0.6209056, 0.2490598, -0.4073739, 0.3686275, 1, 0, 1,
-0.6137105, 0.5131649, 0.7344028, 0.3607843, 1, 0, 1,
-0.6128863, 1.481607, -0.2996382, 0.3568628, 1, 0, 1,
-0.6116691, 0.3699203, -1.264658, 0.3490196, 1, 0, 1,
-0.6076357, -0.8677864, -2.342104, 0.345098, 1, 0, 1,
-0.6074038, 0.6242064, 0.4190229, 0.3372549, 1, 0, 1,
-0.6068994, -0.82327, -3.069559, 0.3333333, 1, 0, 1,
-0.6058606, -1.582393, -1.393523, 0.3254902, 1, 0, 1,
-0.6038417, 0.3247516, 0.3047481, 0.3215686, 1, 0, 1,
-0.5890877, 1.725121, -0.4722289, 0.3137255, 1, 0, 1,
-0.5889542, -0.4302397, -3.085752, 0.3098039, 1, 0, 1,
-0.5855337, 1.73572, -1.046804, 0.3019608, 1, 0, 1,
-0.5680854, -0.6019165, -2.907629, 0.2941177, 1, 0, 1,
-0.5671793, 1.84432, -0.5812856, 0.2901961, 1, 0, 1,
-0.5655256, -0.109786, -3.723881, 0.282353, 1, 0, 1,
-0.5623219, 0.3009919, -2.060166, 0.2784314, 1, 0, 1,
-0.5582885, 0.6329101, -1.802763, 0.2705882, 1, 0, 1,
-0.557138, -1.677037, -2.008807, 0.2666667, 1, 0, 1,
-0.553498, 1.200251, -1.195399, 0.2588235, 1, 0, 1,
-0.5527294, 0.06382199, -2.523601, 0.254902, 1, 0, 1,
-0.5519665, 0.03708783, 0.2957511, 0.2470588, 1, 0, 1,
-0.5497925, 0.4447667, -1.732198, 0.2431373, 1, 0, 1,
-0.54708, -0.9988616, -3.402455, 0.2352941, 1, 0, 1,
-0.5448794, 1.101307, -0.9644488, 0.2313726, 1, 0, 1,
-0.5419156, 0.8829094, -0.3065105, 0.2235294, 1, 0, 1,
-0.5403629, 0.3447959, -1.835981, 0.2196078, 1, 0, 1,
-0.5349542, -0.7185083, -3.33516, 0.2117647, 1, 0, 1,
-0.5312116, 0.2040086, -0.5986407, 0.2078431, 1, 0, 1,
-0.5287119, 0.1338076, 1.308218, 0.2, 1, 0, 1,
-0.5279939, -0.6477448, -2.383853, 0.1921569, 1, 0, 1,
-0.527276, -0.4188346, -3.020199, 0.1882353, 1, 0, 1,
-0.5248542, -1.447712, -2.924657, 0.1803922, 1, 0, 1,
-0.5230497, -0.2411388, -1.944213, 0.1764706, 1, 0, 1,
-0.5160943, -0.5670428, -2.425068, 0.1686275, 1, 0, 1,
-0.5157748, -0.7942918, -1.664413, 0.1647059, 1, 0, 1,
-0.5153647, -1.030924, -1.862528, 0.1568628, 1, 0, 1,
-0.51231, -1.58007, -0.3030944, 0.1529412, 1, 0, 1,
-0.5115475, 1.74494, -0.967835, 0.145098, 1, 0, 1,
-0.5092551, -0.1543276, -3.22648, 0.1411765, 1, 0, 1,
-0.5052984, 1.283034, -0.4427988, 0.1333333, 1, 0, 1,
-0.5014321, -1.910128, -1.671636, 0.1294118, 1, 0, 1,
-0.4996386, 1.251779, -0.1488173, 0.1215686, 1, 0, 1,
-0.4985119, -0.5365835, -3.625929, 0.1176471, 1, 0, 1,
-0.4891382, -0.9872193, -3.161515, 0.1098039, 1, 0, 1,
-0.4867302, 1.062111, -0.1564894, 0.1058824, 1, 0, 1,
-0.478337, -1.434088, -2.670283, 0.09803922, 1, 0, 1,
-0.4781928, 1.439981, -1.428142, 0.09019608, 1, 0, 1,
-0.475408, -0.6393978, -3.421328, 0.08627451, 1, 0, 1,
-0.4724399, 2.179136, 2.377717, 0.07843138, 1, 0, 1,
-0.4704431, -2.390813, -3.037893, 0.07450981, 1, 0, 1,
-0.4677688, 0.641439, -1.108951, 0.06666667, 1, 0, 1,
-0.4665083, 1.560543, 1.301417, 0.0627451, 1, 0, 1,
-0.4646617, 0.5349025, -2.796872e-05, 0.05490196, 1, 0, 1,
-0.4614036, 1.584588, -1.580065, 0.05098039, 1, 0, 1,
-0.4608119, 0.1241605, -0.5347961, 0.04313726, 1, 0, 1,
-0.45894, 0.9926042, 0.2660889, 0.03921569, 1, 0, 1,
-0.4572416, 0.3200983, -1.024213, 0.03137255, 1, 0, 1,
-0.4562194, 0.06553718, -0.3273059, 0.02745098, 1, 0, 1,
-0.4520049, 0.0440969, -1.453765, 0.01960784, 1, 0, 1,
-0.4513658, -1.644875, -4.299304, 0.01568628, 1, 0, 1,
-0.4502017, 1.059592, -2.453556, 0.007843138, 1, 0, 1,
-0.4477628, -2.131297, -2.694129, 0.003921569, 1, 0, 1,
-0.4476451, -1.334312, -3.247522, 0, 1, 0.003921569, 1,
-0.444534, 0.8151668, -1.201586, 0, 1, 0.01176471, 1,
-0.4424129, -0.8000207, -0.7679397, 0, 1, 0.01568628, 1,
-0.4321203, 1.287039, -0.7282077, 0, 1, 0.02352941, 1,
-0.4256266, 0.5225064, -0.7556193, 0, 1, 0.02745098, 1,
-0.4248666, -0.1384417, -0.9124631, 0, 1, 0.03529412, 1,
-0.4177199, 0.06365652, -1.015512, 0, 1, 0.03921569, 1,
-0.4169331, 0.5848466, 0.8259988, 0, 1, 0.04705882, 1,
-0.4146543, -0.607838, -2.41507, 0, 1, 0.05098039, 1,
-0.4140385, -0.5962285, -1.713948, 0, 1, 0.05882353, 1,
-0.4119142, 0.3941576, -0.8173087, 0, 1, 0.0627451, 1,
-0.4054804, 0.290361, -1.924007, 0, 1, 0.07058824, 1,
-0.4008417, -0.6006749, -3.959764, 0, 1, 0.07450981, 1,
-0.3960194, 0.6353927, -1.515987, 0, 1, 0.08235294, 1,
-0.3898407, -0.2641844, -0.9579826, 0, 1, 0.08627451, 1,
-0.3805797, -0.366782, -2.545073, 0, 1, 0.09411765, 1,
-0.3746881, 0.4735366, -0.3581745, 0, 1, 0.1019608, 1,
-0.3741749, -0.507068, -1.837328, 0, 1, 0.1058824, 1,
-0.3735463, -1.299133, -3.292995, 0, 1, 0.1137255, 1,
-0.3692959, -0.1520085, -3.282465, 0, 1, 0.1176471, 1,
-0.3649326, -0.3212008, -0.3023962, 0, 1, 0.1254902, 1,
-0.3600993, -0.2582384, -3.037502, 0, 1, 0.1294118, 1,
-0.3591151, -0.06649197, -1.272862, 0, 1, 0.1372549, 1,
-0.3582258, 1.348158, 0.5743423, 0, 1, 0.1411765, 1,
-0.3528337, -0.1180445, -1.561454, 0, 1, 0.1490196, 1,
-0.3518449, 0.5728287, 0.8725514, 0, 1, 0.1529412, 1,
-0.3497594, -0.7690884, -4.151941, 0, 1, 0.1607843, 1,
-0.3492365, -0.798795, -1.687623, 0, 1, 0.1647059, 1,
-0.3460245, 0.4708078, 0.3460919, 0, 1, 0.172549, 1,
-0.3457659, 1.172071, -0.4083944, 0, 1, 0.1764706, 1,
-0.3447608, -0.8242858, -3.985112, 0, 1, 0.1843137, 1,
-0.3431438, -0.3997048, -2.462391, 0, 1, 0.1882353, 1,
-0.3409035, -0.3310063, -2.908881, 0, 1, 0.1960784, 1,
-0.3374807, 0.3503606, 0.3206605, 0, 1, 0.2039216, 1,
-0.3368118, 1.018669, 0.01829511, 0, 1, 0.2078431, 1,
-0.3336089, 0.01846576, -0.3564718, 0, 1, 0.2156863, 1,
-0.3333314, -0.7407812, -1.222129, 0, 1, 0.2196078, 1,
-0.3281445, -1.28087, -2.125555, 0, 1, 0.227451, 1,
-0.3251754, 1.198976, 1.496563, 0, 1, 0.2313726, 1,
-0.3233503, -0.04730208, -1.900743, 0, 1, 0.2392157, 1,
-0.315914, 0.6754283, 0.4105087, 0, 1, 0.2431373, 1,
-0.313341, 1.275748, -1.371063, 0, 1, 0.2509804, 1,
-0.305636, 0.7133764, -0.76456, 0, 1, 0.254902, 1,
-0.2996192, -0.3386634, -2.899156, 0, 1, 0.2627451, 1,
-0.2923907, -0.6542018, -2.818833, 0, 1, 0.2666667, 1,
-0.2894356, -1.656185, -3.642482, 0, 1, 0.2745098, 1,
-0.2867379, -0.404837, -2.05557, 0, 1, 0.2784314, 1,
-0.2860775, -1.421402, -2.457318, 0, 1, 0.2862745, 1,
-0.2852552, 0.04304009, -2.270785, 0, 1, 0.2901961, 1,
-0.2848386, 1.047309, -0.5165665, 0, 1, 0.2980392, 1,
-0.2825617, -0.8224841, -2.311176, 0, 1, 0.3058824, 1,
-0.2814775, -0.5714595, -2.614035, 0, 1, 0.3098039, 1,
-0.2789482, 0.3229087, -1.606581, 0, 1, 0.3176471, 1,
-0.2711909, 0.142072, -0.9400184, 0, 1, 0.3215686, 1,
-0.2707501, -0.3042834, -2.331893, 0, 1, 0.3294118, 1,
-0.2671177, 0.688693, -1.687534, 0, 1, 0.3333333, 1,
-0.2629762, 0.05986386, -1.23791, 0, 1, 0.3411765, 1,
-0.2586816, -0.5242866, -2.75515, 0, 1, 0.345098, 1,
-0.2536323, -1.056059, -4.0106, 0, 1, 0.3529412, 1,
-0.253049, 1.082012, -1.553295, 0, 1, 0.3568628, 1,
-0.2491282, 0.09864797, -0.5119351, 0, 1, 0.3647059, 1,
-0.2451953, -0.6934382, -3.412843, 0, 1, 0.3686275, 1,
-0.2446392, 0.4310678, -0.5546298, 0, 1, 0.3764706, 1,
-0.2433187, 0.1883382, -1.914992, 0, 1, 0.3803922, 1,
-0.2417015, -1.113846, -1.784317, 0, 1, 0.3882353, 1,
-0.2392461, -1.602318, -5.042826, 0, 1, 0.3921569, 1,
-0.233229, -0.3714873, -3.078525, 0, 1, 0.4, 1,
-0.2328348, -0.3652325, -3.958571, 0, 1, 0.4078431, 1,
-0.2325012, -0.3728435, -2.492223, 0, 1, 0.4117647, 1,
-0.2323477, 0.5107228, -0.4311911, 0, 1, 0.4196078, 1,
-0.2241301, -0.626771, -1.681186, 0, 1, 0.4235294, 1,
-0.223695, -0.07909657, -2.310072, 0, 1, 0.4313726, 1,
-0.2180152, 1.860202, -0.7149394, 0, 1, 0.4352941, 1,
-0.2165196, -1.455935, -5.56724, 0, 1, 0.4431373, 1,
-0.2162331, 0.0655042, -0.7854171, 0, 1, 0.4470588, 1,
-0.2160128, 0.6689138, -0.6824774, 0, 1, 0.454902, 1,
-0.2158692, -1.073678, -3.647088, 0, 1, 0.4588235, 1,
-0.2072608, 0.004849207, -1.369063, 0, 1, 0.4666667, 1,
-0.2064674, 1.448986, -0.4593827, 0, 1, 0.4705882, 1,
-0.2017243, 0.675006, -0.2644985, 0, 1, 0.4784314, 1,
-0.2014071, -1.873534, -2.655294, 0, 1, 0.4823529, 1,
-0.2005923, 1.45169, 0.2943797, 0, 1, 0.4901961, 1,
-0.1919259, 2.267225, 0.5752047, 0, 1, 0.4941176, 1,
-0.1916913, 0.550382, -1.631491, 0, 1, 0.5019608, 1,
-0.1916256, 0.5991752, 1.831465, 0, 1, 0.509804, 1,
-0.1841952, 1.140492, -1.38881, 0, 1, 0.5137255, 1,
-0.18383, 0.9937817, 0.771893, 0, 1, 0.5215687, 1,
-0.1821037, 0.3749275, 0.4403039, 0, 1, 0.5254902, 1,
-0.1749849, -0.1781666, -3.160462, 0, 1, 0.5333334, 1,
-0.1679103, 0.8361718, -0.555971, 0, 1, 0.5372549, 1,
-0.1614294, 0.5252656, -0.6635343, 0, 1, 0.5450981, 1,
-0.1583088, -0.2352729, -1.172349, 0, 1, 0.5490196, 1,
-0.1575391, 1.284824, -0.5491434, 0, 1, 0.5568628, 1,
-0.1568858, 0.1417023, -1.011705, 0, 1, 0.5607843, 1,
-0.1546468, 1.813648, 0.09836143, 0, 1, 0.5686275, 1,
-0.1524697, 1.472955, -0.6893798, 0, 1, 0.572549, 1,
-0.1499474, -0.1843043, -4.415439, 0, 1, 0.5803922, 1,
-0.1449387, 0.7445945, -1.486977, 0, 1, 0.5843138, 1,
-0.1430068, 0.9853281, -0.3423216, 0, 1, 0.5921569, 1,
-0.1417693, 1.228677, -1.360891, 0, 1, 0.5960785, 1,
-0.1400874, -0.3338709, -2.831286, 0, 1, 0.6039216, 1,
-0.1318981, -1.359058, -4.421818, 0, 1, 0.6117647, 1,
-0.1315794, -0.3709694, -3.518016, 0, 1, 0.6156863, 1,
-0.1294691, 0.2190553, -0.2713795, 0, 1, 0.6235294, 1,
-0.1281571, 0.2319547, -0.09795961, 0, 1, 0.627451, 1,
-0.1278524, -1.11981, -4.346114, 0, 1, 0.6352941, 1,
-0.126133, 0.229258, -1.716637, 0, 1, 0.6392157, 1,
-0.1254999, 0.02795844, -0.5329258, 0, 1, 0.6470588, 1,
-0.1224839, 1.760761, -1.618953, 0, 1, 0.6509804, 1,
-0.1206166, 1.83156, 0.1963407, 0, 1, 0.6588235, 1,
-0.11875, 0.4291964, -1.318218, 0, 1, 0.6627451, 1,
-0.1176672, 0.4658801, -0.4101462, 0, 1, 0.6705883, 1,
-0.1158422, 0.1565053, -1.251483, 0, 1, 0.6745098, 1,
-0.1133375, -0.04195791, -1.954356, 0, 1, 0.682353, 1,
-0.1100971, 1.463081, -0.4940385, 0, 1, 0.6862745, 1,
-0.1047538, -0.1348157, -3.304418, 0, 1, 0.6941177, 1,
-0.10284, 1.239968, 0.6903591, 0, 1, 0.7019608, 1,
-0.1005333, -0.1967937, -2.368912, 0, 1, 0.7058824, 1,
-0.09868065, 0.4473623, 0.2193727, 0, 1, 0.7137255, 1,
-0.09270328, -1.816752, -4.627891, 0, 1, 0.7176471, 1,
-0.08829843, -1.530364, -0.3131374, 0, 1, 0.7254902, 1,
-0.0879353, -1.657443, -3.459492, 0, 1, 0.7294118, 1,
-0.08705392, 0.2455282, -0.8727077, 0, 1, 0.7372549, 1,
-0.0869306, 1.385821, -0.4849518, 0, 1, 0.7411765, 1,
-0.08547609, -0.178012, -2.865072, 0, 1, 0.7490196, 1,
-0.08042181, 0.3212487, 0.7158743, 0, 1, 0.7529412, 1,
-0.07848553, -0.3278279, -4.0139, 0, 1, 0.7607843, 1,
-0.07705582, 1.142817, 0.5850017, 0, 1, 0.7647059, 1,
-0.07500046, 1.44754, 0.6630709, 0, 1, 0.772549, 1,
-0.07343711, 1.181832, 0.8775483, 0, 1, 0.7764706, 1,
-0.07289735, 0.4123773, -0.8600237, 0, 1, 0.7843137, 1,
-0.0716705, 0.5104675, 0.06273707, 0, 1, 0.7882353, 1,
-0.07130948, 1.092012, 0.03753843, 0, 1, 0.7960784, 1,
-0.07077282, -0.9613663, -3.953534, 0, 1, 0.8039216, 1,
-0.07076737, 0.7321746, -1.454345, 0, 1, 0.8078431, 1,
-0.067455, -0.1921122, -1.764966, 0, 1, 0.8156863, 1,
-0.06716643, -0.8078388, -3.266737, 0, 1, 0.8196079, 1,
-0.06360036, -1.082523, -3.849183, 0, 1, 0.827451, 1,
-0.06243754, -0.434443, -3.583342, 0, 1, 0.8313726, 1,
-0.06041564, 1.349768, -1.08839, 0, 1, 0.8392157, 1,
-0.05826899, -0.4481261, -2.456222, 0, 1, 0.8431373, 1,
-0.05551523, -0.06193751, -3.059417, 0, 1, 0.8509804, 1,
-0.0553854, -0.4865938, -1.014214, 0, 1, 0.854902, 1,
-0.05447102, -1.165244, -3.124658, 0, 1, 0.8627451, 1,
-0.0528314, 0.9603652, 1.413106, 0, 1, 0.8666667, 1,
-0.04702539, -0.6343592, -2.707322, 0, 1, 0.8745098, 1,
-0.04276561, -0.9154252, -2.549513, 0, 1, 0.8784314, 1,
-0.03764974, -0.7191073, -2.516567, 0, 1, 0.8862745, 1,
-0.0372878, 0.4062386, 0.6672819, 0, 1, 0.8901961, 1,
-0.03649246, -0.7290291, -2.91458, 0, 1, 0.8980392, 1,
-0.03449564, 0.2827118, -2.482088, 0, 1, 0.9058824, 1,
-0.03387523, -0.2370007, -4.559829, 0, 1, 0.9098039, 1,
-0.02808136, -0.3576973, -4.067141, 0, 1, 0.9176471, 1,
-0.02797759, -1.135719, -1.959713, 0, 1, 0.9215686, 1,
-0.02690978, 0.1147344, 0.5223102, 0, 1, 0.9294118, 1,
-0.02203631, -0.5903012, -1.613182, 0, 1, 0.9333333, 1,
-0.02177833, 2.093212, 0.6830351, 0, 1, 0.9411765, 1,
-0.01729169, -0.08707488, -2.965315, 0, 1, 0.945098, 1,
-0.01499273, 0.55106, -0.8090063, 0, 1, 0.9529412, 1,
-0.004375814, 1.433599, -0.8466889, 0, 1, 0.9568627, 1,
-0.002497181, -0.2045788, -2.035578, 0, 1, 0.9647059, 1,
0.0007177, -1.357048, 2.634965, 0, 1, 0.9686275, 1,
0.001542017, -0.205479, 1.952438, 0, 1, 0.9764706, 1,
0.004220464, -0.1154963, 2.504586, 0, 1, 0.9803922, 1,
0.01015719, 0.5736893, 1.284618, 0, 1, 0.9882353, 1,
0.01041799, -0.3160486, 4.312742, 0, 1, 0.9921569, 1,
0.01071245, -0.8716687, 3.145559, 0, 1, 1, 1,
0.01162277, 0.07571044, -1.004792, 0, 0.9921569, 1, 1,
0.01261499, 1.257678, -1.014533, 0, 0.9882353, 1, 1,
0.01507078, 1.441496, -0.8005877, 0, 0.9803922, 1, 1,
0.01565754, -0.7358677, 3.297848, 0, 0.9764706, 1, 1,
0.01566492, -1.189152, 2.711132, 0, 0.9686275, 1, 1,
0.01925717, -0.161643, 3.133772, 0, 0.9647059, 1, 1,
0.02020385, -0.596812, 3.723359, 0, 0.9568627, 1, 1,
0.02453703, 0.3301914, -0.6868761, 0, 0.9529412, 1, 1,
0.0245509, -0.1662076, 3.01745, 0, 0.945098, 1, 1,
0.02771888, 1.318353, 1.094409, 0, 0.9411765, 1, 1,
0.03591473, -0.2949577, 1.515575, 0, 0.9333333, 1, 1,
0.03661621, -0.2983014, 2.903583, 0, 0.9294118, 1, 1,
0.04093364, 2.640013, -0.03653885, 0, 0.9215686, 1, 1,
0.0471242, -1.401557, 2.094066, 0, 0.9176471, 1, 1,
0.06255793, 0.3890784, -0.8867787, 0, 0.9098039, 1, 1,
0.06279456, -0.2477179, 2.012783, 0, 0.9058824, 1, 1,
0.0730257, 1.509452, -0.07000432, 0, 0.8980392, 1, 1,
0.07466768, 0.1349801, 0.4775538, 0, 0.8901961, 1, 1,
0.07545534, -1.373817, 3.531286, 0, 0.8862745, 1, 1,
0.07605463, -0.120733, 2.632511, 0, 0.8784314, 1, 1,
0.07790055, -1.193803, 2.966867, 0, 0.8745098, 1, 1,
0.07897188, -1.054871, 2.293983, 0, 0.8666667, 1, 1,
0.07977985, -1.899486, 2.140126, 0, 0.8627451, 1, 1,
0.08251909, 0.777016, -0.1573268, 0, 0.854902, 1, 1,
0.08281202, -1.763581, 3.919735, 0, 0.8509804, 1, 1,
0.08500393, 0.4445018, -0.7072134, 0, 0.8431373, 1, 1,
0.08548159, 0.8004802, 0.0008867673, 0, 0.8392157, 1, 1,
0.08620607, -0.2447509, 1.391755, 0, 0.8313726, 1, 1,
0.09091904, -1.028184, 3.607397, 0, 0.827451, 1, 1,
0.09111775, 0.163808, 1.92412, 0, 0.8196079, 1, 1,
0.09438705, -1.648708, 3.11565, 0, 0.8156863, 1, 1,
0.09554481, -0.6370423, 1.01679, 0, 0.8078431, 1, 1,
0.09572534, -1.174633, 2.216511, 0, 0.8039216, 1, 1,
0.1029366, 0.2965994, -1.353873, 0, 0.7960784, 1, 1,
0.1037864, -1.99961, 1.833407, 0, 0.7882353, 1, 1,
0.1062805, 0.9303246, -0.9181023, 0, 0.7843137, 1, 1,
0.106398, -0.6083043, 3.426158, 0, 0.7764706, 1, 1,
0.1113446, 0.04584044, 0.6769609, 0, 0.772549, 1, 1,
0.1156167, 0.9355131, -2.535025, 0, 0.7647059, 1, 1,
0.119624, 0.1172508, 2.053689, 0, 0.7607843, 1, 1,
0.1214434, 0.609704, -0.5044807, 0, 0.7529412, 1, 1,
0.1223354, 0.3781093, -1.579091, 0, 0.7490196, 1, 1,
0.1268482, -0.4588941, 3.244671, 0, 0.7411765, 1, 1,
0.1319645, 0.3477104, 0.8612983, 0, 0.7372549, 1, 1,
0.1357072, -1.653126, 4.393948, 0, 0.7294118, 1, 1,
0.1369022, -0.31912, 1.580872, 0, 0.7254902, 1, 1,
0.1383505, -0.8695024, 1.989217, 0, 0.7176471, 1, 1,
0.1398305, -0.4747897, 5.182433, 0, 0.7137255, 1, 1,
0.140276, 1.723288, 0.7098085, 0, 0.7058824, 1, 1,
0.1502413, -0.4466124, 3.551456, 0, 0.6980392, 1, 1,
0.1510589, 0.3959609, 0.2380373, 0, 0.6941177, 1, 1,
0.1517381, 0.2890575, 0.5943904, 0, 0.6862745, 1, 1,
0.1570683, 1.149667, -1.315085, 0, 0.682353, 1, 1,
0.1572977, 0.5504098, 0.804279, 0, 0.6745098, 1, 1,
0.1594247, -0.8790457, 3.067104, 0, 0.6705883, 1, 1,
0.1631883, 1.131106, -2.94342, 0, 0.6627451, 1, 1,
0.1638025, 0.4296739, 0.6191985, 0, 0.6588235, 1, 1,
0.1638221, 0.03300953, 0.18999, 0, 0.6509804, 1, 1,
0.1665643, -1.322989, 2.70143, 0, 0.6470588, 1, 1,
0.1737668, -0.5246116, 2.325103, 0, 0.6392157, 1, 1,
0.174845, 1.309022, 1.155031, 0, 0.6352941, 1, 1,
0.1757401, 1.484253, -1.386131, 0, 0.627451, 1, 1,
0.1763491, 0.2265632, -0.3144527, 0, 0.6235294, 1, 1,
0.181071, -0.3471008, 0.8689007, 0, 0.6156863, 1, 1,
0.1834746, 1.377259, 0.4221294, 0, 0.6117647, 1, 1,
0.1896769, -0.1701142, 2.241506, 0, 0.6039216, 1, 1,
0.1908856, 0.3469588, -0.2312313, 0, 0.5960785, 1, 1,
0.1965856, 1.154006, -0.08996372, 0, 0.5921569, 1, 1,
0.1982075, 1.044947, 1.457138, 0, 0.5843138, 1, 1,
0.2014444, -0.2092145, 3.970226, 0, 0.5803922, 1, 1,
0.2027565, -0.1166597, 2.105553, 0, 0.572549, 1, 1,
0.2089085, -0.252889, 2.452958, 0, 0.5686275, 1, 1,
0.2107365, -0.4659263, 0.8515806, 0, 0.5607843, 1, 1,
0.2107886, -0.1827692, 1.377323, 0, 0.5568628, 1, 1,
0.2148338, -0.1685285, 4.318506, 0, 0.5490196, 1, 1,
0.2157897, -0.4847478, 1.836802, 0, 0.5450981, 1, 1,
0.2171001, 0.7077445, -1.648218, 0, 0.5372549, 1, 1,
0.2180697, -1.438324, 3.820436, 0, 0.5333334, 1, 1,
0.2201219, -0.3740178, 3.567497, 0, 0.5254902, 1, 1,
0.2226862, 0.4191016, -0.5986587, 0, 0.5215687, 1, 1,
0.2263305, -1.16814, 2.3625, 0, 0.5137255, 1, 1,
0.2314029, 1.117336, -0.3501141, 0, 0.509804, 1, 1,
0.2370088, -0.8070741, 2.698164, 0, 0.5019608, 1, 1,
0.2388962, -0.770259, 3.308107, 0, 0.4941176, 1, 1,
0.2389361, 0.7486442, 1.759969, 0, 0.4901961, 1, 1,
0.2391108, 0.01748569, 0.9181616, 0, 0.4823529, 1, 1,
0.2407757, 1.134792, -0.05057818, 0, 0.4784314, 1, 1,
0.2434253, 0.3036687, -0.08487181, 0, 0.4705882, 1, 1,
0.2494352, 0.7167623, 0.4930212, 0, 0.4666667, 1, 1,
0.2520609, 0.9626562, 1.57801, 0, 0.4588235, 1, 1,
0.252181, 0.5646109, -0.1183229, 0, 0.454902, 1, 1,
0.2587532, 0.9572895, 0.5554826, 0, 0.4470588, 1, 1,
0.2644317, 0.9104083, 0.0009770651, 0, 0.4431373, 1, 1,
0.2668376, 0.1794473, 2.46123, 0, 0.4352941, 1, 1,
0.2677972, -0.688344, 2.196955, 0, 0.4313726, 1, 1,
0.2716488, -0.3787889, 2.521031, 0, 0.4235294, 1, 1,
0.2773931, -0.3353048, 1.744084, 0, 0.4196078, 1, 1,
0.2781739, 0.6434392, 1.98248, 0, 0.4117647, 1, 1,
0.2783141, -1.253701, 3.914209, 0, 0.4078431, 1, 1,
0.2789487, -0.2724004, 2.982036, 0, 0.4, 1, 1,
0.2807045, -0.3225435, 1.212099, 0, 0.3921569, 1, 1,
0.2850032, 0.6723812, -0.5105217, 0, 0.3882353, 1, 1,
0.294275, 0.8613399, 1.112865, 0, 0.3803922, 1, 1,
0.2946309, -0.7070017, 3.455451, 0, 0.3764706, 1, 1,
0.2959689, -1.053889, 2.66168, 0, 0.3686275, 1, 1,
0.3024166, -1.183631, 1.523045, 0, 0.3647059, 1, 1,
0.3123152, 1.334866, 0.7796162, 0, 0.3568628, 1, 1,
0.3133342, 0.7006624, -0.3811178, 0, 0.3529412, 1, 1,
0.313821, 0.7424585, -0.98926, 0, 0.345098, 1, 1,
0.3159287, -0.7754687, 1.538136, 0, 0.3411765, 1, 1,
0.3163708, 0.9765728, -0.05786246, 0, 0.3333333, 1, 1,
0.3210567, -0.3569688, 2.405722, 0, 0.3294118, 1, 1,
0.3284951, -0.07807991, 2.330948, 0, 0.3215686, 1, 1,
0.3314935, -1.841134, 2.949716, 0, 0.3176471, 1, 1,
0.3321036, 0.8432562, 1.02725, 0, 0.3098039, 1, 1,
0.3359608, 0.3530832, 1.723873, 0, 0.3058824, 1, 1,
0.3361567, 0.794399, 0.07452966, 0, 0.2980392, 1, 1,
0.3375172, 0.5997488, 1.611949, 0, 0.2901961, 1, 1,
0.3447181, -1.154275, 1.451849, 0, 0.2862745, 1, 1,
0.3450565, 1.510989, 1.327505, 0, 0.2784314, 1, 1,
0.3544497, 1.406458, 0.5670414, 0, 0.2745098, 1, 1,
0.357326, -0.02698348, -0.554827, 0, 0.2666667, 1, 1,
0.3574195, 0.6398081, -0.3203566, 0, 0.2627451, 1, 1,
0.3579214, -1.653998, 3.077215, 0, 0.254902, 1, 1,
0.3581593, -0.0749219, 0.02605731, 0, 0.2509804, 1, 1,
0.3586049, 2.260193, -0.07492108, 0, 0.2431373, 1, 1,
0.3587521, 0.2114548, 0.460045, 0, 0.2392157, 1, 1,
0.3588875, -1.948571, 3.250804, 0, 0.2313726, 1, 1,
0.3592218, 0.4168556, 1.635263, 0, 0.227451, 1, 1,
0.3598571, -1.531269, 3.815434, 0, 0.2196078, 1, 1,
0.360645, 0.8010594, -0.5053655, 0, 0.2156863, 1, 1,
0.3651005, -1.054555, 1.829671, 0, 0.2078431, 1, 1,
0.3657601, 0.2407525, 1.728027, 0, 0.2039216, 1, 1,
0.36795, 2.227235, 0.2174157, 0, 0.1960784, 1, 1,
0.3688189, 0.6150627, 2.483527, 0, 0.1882353, 1, 1,
0.3693535, 0.04585922, 1.34631, 0, 0.1843137, 1, 1,
0.3783298, -0.8026394, 2.649218, 0, 0.1764706, 1, 1,
0.3786573, 1.192188, 0.0307555, 0, 0.172549, 1, 1,
0.3802041, -0.883437, 0.6738847, 0, 0.1647059, 1, 1,
0.3806111, 1.889195, 0.8766555, 0, 0.1607843, 1, 1,
0.381767, 0.5158305, 0.8996798, 0, 0.1529412, 1, 1,
0.3846912, -0.6820657, 2.993259, 0, 0.1490196, 1, 1,
0.3882506, -0.3814933, 2.053982, 0, 0.1411765, 1, 1,
0.3884362, -0.3551041, 1.836603, 0, 0.1372549, 1, 1,
0.3899412, -1.758566, 4.722578, 0, 0.1294118, 1, 1,
0.3917513, 0.7670428, -0.7441539, 0, 0.1254902, 1, 1,
0.3956842, 1.199437, 1.750232, 0, 0.1176471, 1, 1,
0.3994498, 1.700484, 0.5850722, 0, 0.1137255, 1, 1,
0.4014839, 0.6186302, 0.09524971, 0, 0.1058824, 1, 1,
0.403226, 0.07625923, 1.896454, 0, 0.09803922, 1, 1,
0.4065885, -0.6177793, 1.569974, 0, 0.09411765, 1, 1,
0.4124289, 0.7071399, -0.4896402, 0, 0.08627451, 1, 1,
0.4150429, 0.9508494, 0.1386631, 0, 0.08235294, 1, 1,
0.4156713, 0.6863049, -0.7688085, 0, 0.07450981, 1, 1,
0.4336359, 0.4646364, 1.721949, 0, 0.07058824, 1, 1,
0.433815, -0.4367732, 2.218039, 0, 0.0627451, 1, 1,
0.4368156, -1.125473, 1.851208, 0, 0.05882353, 1, 1,
0.4415115, -1.703437, 2.80333, 0, 0.05098039, 1, 1,
0.4421249, -1.169595, 0.9854729, 0, 0.04705882, 1, 1,
0.4503081, -0.1900149, 2.078449, 0, 0.03921569, 1, 1,
0.4509399, -0.1799242, 2.92643, 0, 0.03529412, 1, 1,
0.4510738, 0.7248101, -0.2953787, 0, 0.02745098, 1, 1,
0.4517695, -0.2271882, 2.446939, 0, 0.02352941, 1, 1,
0.4524163, 0.3356864, -0.08124384, 0, 0.01568628, 1, 1,
0.4678334, -1.061945, 1.636517, 0, 0.01176471, 1, 1,
0.4731624, 0.4710205, 1.330327, 0, 0.003921569, 1, 1,
0.4790508, 0.4013706, 0.9131796, 0.003921569, 0, 1, 1,
0.4804651, -0.9405302, 3.635497, 0.007843138, 0, 1, 1,
0.4879098, 0.3707184, 2.569219, 0.01568628, 0, 1, 1,
0.4887661, -0.1178912, 1.680948, 0.01960784, 0, 1, 1,
0.4959268, 0.2565632, 1.674536, 0.02745098, 0, 1, 1,
0.4981721, -0.7675166, 3.188592, 0.03137255, 0, 1, 1,
0.4988834, 1.295249, 0.9096251, 0.03921569, 0, 1, 1,
0.5010682, 0.3105657, 2.788148, 0.04313726, 0, 1, 1,
0.5021991, 0.6168817, -0.1737271, 0.05098039, 0, 1, 1,
0.5033779, 0.1852133, -0.8696921, 0.05490196, 0, 1, 1,
0.5048802, 1.170682, 0.03157061, 0.0627451, 0, 1, 1,
0.5053456, 0.7741327, 0.5624025, 0.06666667, 0, 1, 1,
0.5053544, 0.4745878, 2.462827, 0.07450981, 0, 1, 1,
0.5077175, -0.5993894, 2.178824, 0.07843138, 0, 1, 1,
0.510762, -0.3452657, 2.582056, 0.08627451, 0, 1, 1,
0.5128288, -0.2644384, 2.533948, 0.09019608, 0, 1, 1,
0.5174533, 0.715708, -0.7918694, 0.09803922, 0, 1, 1,
0.5253912, 1.282875, 0.4133121, 0.1058824, 0, 1, 1,
0.5294195, -1.701985, 1.113745, 0.1098039, 0, 1, 1,
0.530956, -1.523588, 2.485983, 0.1176471, 0, 1, 1,
0.5319371, -0.3966994, 2.927662, 0.1215686, 0, 1, 1,
0.5336335, 0.1804967, 0.401891, 0.1294118, 0, 1, 1,
0.5343429, -0.1857111, 2.603761, 0.1333333, 0, 1, 1,
0.5381358, -0.4846216, 2.996094, 0.1411765, 0, 1, 1,
0.5389135, 1.873294, -0.3410717, 0.145098, 0, 1, 1,
0.5392218, 0.1310026, 1.054031, 0.1529412, 0, 1, 1,
0.5395883, 0.6378878, 0.3067337, 0.1568628, 0, 1, 1,
0.5406236, 1.153309, 0.7439682, 0.1647059, 0, 1, 1,
0.5408115, -0.7010315, 1.701642, 0.1686275, 0, 1, 1,
0.5451881, 0.2162925, -0.2806495, 0.1764706, 0, 1, 1,
0.5493624, -0.06051278, 0.7021276, 0.1803922, 0, 1, 1,
0.5508385, -1.019581, 2.701162, 0.1882353, 0, 1, 1,
0.5546602, 0.5858951, 0.2852611, 0.1921569, 0, 1, 1,
0.5571561, 0.09345086, 2.195418, 0.2, 0, 1, 1,
0.5620161, 1.917163, -0.0199771, 0.2078431, 0, 1, 1,
0.564737, -0.3056745, 1.092907, 0.2117647, 0, 1, 1,
0.5676365, 1.281588, 0.3466639, 0.2196078, 0, 1, 1,
0.5680498, -0.3626101, 1.767932, 0.2235294, 0, 1, 1,
0.5734891, 0.8060099, -0.477295, 0.2313726, 0, 1, 1,
0.5765713, -0.5935812, 2.056192, 0.2352941, 0, 1, 1,
0.5778459, 2.414342, 0.5827836, 0.2431373, 0, 1, 1,
0.5820683, 0.8040951, 1.572747, 0.2470588, 0, 1, 1,
0.5836182, 0.6929544, 0.2009887, 0.254902, 0, 1, 1,
0.5837199, -0.4326397, 1.833555, 0.2588235, 0, 1, 1,
0.5851884, -1.615955, 3.932794, 0.2666667, 0, 1, 1,
0.5858876, -1.026027, 3.822968, 0.2705882, 0, 1, 1,
0.5864695, -2.671971, 2.051379, 0.2784314, 0, 1, 1,
0.5930415, -0.982603, 3.225541, 0.282353, 0, 1, 1,
0.5931417, 0.01617152, 2.018033, 0.2901961, 0, 1, 1,
0.5945245, 0.2496511, 2.025543, 0.2941177, 0, 1, 1,
0.6004035, 0.3347899, 0.4606127, 0.3019608, 0, 1, 1,
0.6022556, 0.3974454, -1.391612, 0.3098039, 0, 1, 1,
0.6053781, -1.578491, 2.80504, 0.3137255, 0, 1, 1,
0.6059016, -0.233626, 1.578502, 0.3215686, 0, 1, 1,
0.6129502, 0.3820629, 0.6307831, 0.3254902, 0, 1, 1,
0.6140721, 2.65891, -2.324667, 0.3333333, 0, 1, 1,
0.6177164, -1.252115, 2.735043, 0.3372549, 0, 1, 1,
0.6184835, -0.02178347, -0.3815041, 0.345098, 0, 1, 1,
0.6191745, -0.6199936, 3.522517, 0.3490196, 0, 1, 1,
0.6251541, 0.3058961, 0.6733282, 0.3568628, 0, 1, 1,
0.6276994, 1.570597, -0.290516, 0.3607843, 0, 1, 1,
0.6279897, 0.3808278, 1.721021, 0.3686275, 0, 1, 1,
0.6308814, 0.4739807, 1.426028, 0.372549, 0, 1, 1,
0.6315747, -0.5713027, 1.433578, 0.3803922, 0, 1, 1,
0.6343403, 1.859653, -0.6839516, 0.3843137, 0, 1, 1,
0.6394193, 0.19421, 2.328508, 0.3921569, 0, 1, 1,
0.6399826, -0.5343639, 1.99614, 0.3960784, 0, 1, 1,
0.6403158, 1.042952, -0.5414497, 0.4039216, 0, 1, 1,
0.6404051, 1.674963, 1.702631, 0.4117647, 0, 1, 1,
0.6427812, 0.8380653, -0.9108206, 0.4156863, 0, 1, 1,
0.6439657, 0.08537865, -0.2900793, 0.4235294, 0, 1, 1,
0.6451705, 0.9334031, 1.776322, 0.427451, 0, 1, 1,
0.6472271, -0.7605183, 2.104545, 0.4352941, 0, 1, 1,
0.6520098, 1.928967, -0.0841989, 0.4392157, 0, 1, 1,
0.6523742, 1.244581, 1.866926, 0.4470588, 0, 1, 1,
0.6539612, -1.172379, 1.508885, 0.4509804, 0, 1, 1,
0.6541021, 1.058225, -1.34953, 0.4588235, 0, 1, 1,
0.6568517, 0.05609535, 1.913765, 0.4627451, 0, 1, 1,
0.6615332, 0.1494128, 0.4278814, 0.4705882, 0, 1, 1,
0.6631248, -0.4666883, 3.178684, 0.4745098, 0, 1, 1,
0.6680197, -0.5424721, 0.2487059, 0.4823529, 0, 1, 1,
0.6691532, 1.733121, 0.2279589, 0.4862745, 0, 1, 1,
0.6712703, 0.7879031, 0.1396861, 0.4941176, 0, 1, 1,
0.6826538, 1.023298, 0.8976542, 0.5019608, 0, 1, 1,
0.6827541, 1.143596, -1.143444, 0.5058824, 0, 1, 1,
0.683099, 1.049891, -0.9465554, 0.5137255, 0, 1, 1,
0.6881062, 0.8708823, 0.6162395, 0.5176471, 0, 1, 1,
0.6888993, 0.1269051, 2.949797, 0.5254902, 0, 1, 1,
0.6980675, 1.459548, 2.16031, 0.5294118, 0, 1, 1,
0.699071, 1.884076, -0.2182783, 0.5372549, 0, 1, 1,
0.7046147, 0.53879, 1.09167, 0.5411765, 0, 1, 1,
0.7080091, 0.2194738, 2.418017, 0.5490196, 0, 1, 1,
0.7128332, -2.157678, 1.138718, 0.5529412, 0, 1, 1,
0.7190589, -0.05917071, 1.14417, 0.5607843, 0, 1, 1,
0.7194253, 0.808008, 0.9236875, 0.5647059, 0, 1, 1,
0.7363824, 1.558563, 1.33224, 0.572549, 0, 1, 1,
0.7370027, 0.8716009, -0.984154, 0.5764706, 0, 1, 1,
0.7414709, -0.803248, 2.85295, 0.5843138, 0, 1, 1,
0.7423529, 0.895091, 0.3826728, 0.5882353, 0, 1, 1,
0.7457632, 0.5628308, 0.9726624, 0.5960785, 0, 1, 1,
0.7460149, 0.2089409, 1.332457, 0.6039216, 0, 1, 1,
0.7474737, -0.5275278, 1.6014, 0.6078432, 0, 1, 1,
0.7518601, 0.3742518, 0.3255337, 0.6156863, 0, 1, 1,
0.7527073, 0.09546873, 2.162675, 0.6196079, 0, 1, 1,
0.765272, -0.07786747, 2.662665, 0.627451, 0, 1, 1,
0.7707732, -0.2219213, 1.953517, 0.6313726, 0, 1, 1,
0.7737468, -1.416805, 2.206106, 0.6392157, 0, 1, 1,
0.7766533, -0.291912, 0.8788158, 0.6431373, 0, 1, 1,
0.7786432, 0.7569725, 0.6221588, 0.6509804, 0, 1, 1,
0.7811667, 0.2669772, 0.1949372, 0.654902, 0, 1, 1,
0.7918627, -0.5931299, 1.973171, 0.6627451, 0, 1, 1,
0.7982532, 0.2058893, 1.683803, 0.6666667, 0, 1, 1,
0.7998701, -0.6351724, 1.292367, 0.6745098, 0, 1, 1,
0.8115362, 1.034059, -0.9688628, 0.6784314, 0, 1, 1,
0.8118612, 1.881305, 2.08576, 0.6862745, 0, 1, 1,
0.8172999, 0.01941869, 3.608464, 0.6901961, 0, 1, 1,
0.8177112, -0.0935559, -0.2129304, 0.6980392, 0, 1, 1,
0.819997, 0.7846833, -0.5945338, 0.7058824, 0, 1, 1,
0.8209195, 0.2365154, 5.620697, 0.7098039, 0, 1, 1,
0.8218598, 0.2719106, -0.5806469, 0.7176471, 0, 1, 1,
0.8227961, 0.9818909, 1.763042, 0.7215686, 0, 1, 1,
0.8236558, 2.321636, 0.3497662, 0.7294118, 0, 1, 1,
0.8349383, 1.187283, 1.247806, 0.7333333, 0, 1, 1,
0.8353223, 0.9895792, -0.5998416, 0.7411765, 0, 1, 1,
0.8378879, 0.6072423, 0.4935792, 0.7450981, 0, 1, 1,
0.8423045, 0.6314563, 0.8238038, 0.7529412, 0, 1, 1,
0.8494842, 1.120227, 1.113145, 0.7568628, 0, 1, 1,
0.8512475, -0.5303755, 0.254755, 0.7647059, 0, 1, 1,
0.8514556, 0.8442276, 0.4875945, 0.7686275, 0, 1, 1,
0.8545736, 0.795383, 0.8453617, 0.7764706, 0, 1, 1,
0.8653069, -1.053369, 2.089509, 0.7803922, 0, 1, 1,
0.8728378, -0.08936533, 0.3241751, 0.7882353, 0, 1, 1,
0.8734958, -0.2434051, 2.371129, 0.7921569, 0, 1, 1,
0.8774351, 0.9005066, 0.8054509, 0.8, 0, 1, 1,
0.8785303, 0.6533903, 1.778371, 0.8078431, 0, 1, 1,
0.8796209, 0.82265, -0.7023234, 0.8117647, 0, 1, 1,
0.8820093, 0.1451627, -0.2230608, 0.8196079, 0, 1, 1,
0.8830582, -0.4828728, 2.479897, 0.8235294, 0, 1, 1,
0.8884994, 0.6775747, -0.3338579, 0.8313726, 0, 1, 1,
0.8922926, -0.3043649, 2.395886, 0.8352941, 0, 1, 1,
0.9071255, -0.0529596, 2.057654, 0.8431373, 0, 1, 1,
0.9220906, -1.619667, 2.077717, 0.8470588, 0, 1, 1,
0.9229193, 1.441556, -0.9437567, 0.854902, 0, 1, 1,
0.9264089, -0.2159339, 1.149786, 0.8588235, 0, 1, 1,
0.9265267, -1.615513, 3.461679, 0.8666667, 0, 1, 1,
0.9300003, -0.9560459, -0.1472508, 0.8705882, 0, 1, 1,
0.9331446, 0.9770151, 0.3149196, 0.8784314, 0, 1, 1,
0.935775, 0.9291009, 1.248713, 0.8823529, 0, 1, 1,
0.9436631, -0.1646572, 1.150723, 0.8901961, 0, 1, 1,
0.9500422, -0.06797442, 0.1093126, 0.8941177, 0, 1, 1,
0.9512573, 0.555684, 0.2937868, 0.9019608, 0, 1, 1,
0.9529538, 2.085891, -0.5460726, 0.9098039, 0, 1, 1,
0.961241, 1.765181, -0.1270989, 0.9137255, 0, 1, 1,
0.9623348, 0.8888485, -1.068985, 0.9215686, 0, 1, 1,
0.9647133, 1.200059, 0.201036, 0.9254902, 0, 1, 1,
0.9650029, 0.2817127, 2.206527, 0.9333333, 0, 1, 1,
0.965189, 2.892544, 2.598689, 0.9372549, 0, 1, 1,
0.9668087, 0.4348488, -0.4835684, 0.945098, 0, 1, 1,
0.9731734, -0.7776783, 2.78555, 0.9490196, 0, 1, 1,
0.9739974, 0.8497729, 2.67409, 0.9568627, 0, 1, 1,
0.9772901, 0.2339968, 2.921398, 0.9607843, 0, 1, 1,
0.9781438, -1.188952, 2.351198, 0.9686275, 0, 1, 1,
0.9822552, 0.5280902, 0.6335332, 0.972549, 0, 1, 1,
0.9822583, 0.1042506, 0.6966978, 0.9803922, 0, 1, 1,
0.9870933, 0.2333482, 1.161028, 0.9843137, 0, 1, 1,
0.9880561, -0.6567352, 1.757833, 0.9921569, 0, 1, 1,
0.9982333, -0.8994633, 2.424214, 0.9960784, 0, 1, 1,
1.000351, -0.3499457, 0.9901985, 1, 0, 0.9960784, 1,
1.00493, 0.02887526, 0.694432, 1, 0, 0.9882353, 1,
1.015265, -0.5205908, 2.122537, 1, 0, 0.9843137, 1,
1.018616, 1.185903, -0.004762061, 1, 0, 0.9764706, 1,
1.028921, -0.4692998, 2.461439, 1, 0, 0.972549, 1,
1.035824, -0.1904808, 1.339834, 1, 0, 0.9647059, 1,
1.052754, 0.6551438, 2.998069, 1, 0, 0.9607843, 1,
1.054967, -0.6295831, 2.340058, 1, 0, 0.9529412, 1,
1.056381, 0.6126441, 0.3377513, 1, 0, 0.9490196, 1,
1.063307, -1.035124, 1.536495, 1, 0, 0.9411765, 1,
1.066008, -1.64398, 3.289044, 1, 0, 0.9372549, 1,
1.068408, 0.1908662, 0.8562012, 1, 0, 0.9294118, 1,
1.068485, -0.9617501, 3.495858, 1, 0, 0.9254902, 1,
1.07018, -0.4565485, 2.064911, 1, 0, 0.9176471, 1,
1.074186, -0.954381, 1.515348, 1, 0, 0.9137255, 1,
1.075603, -1.126704, 2.077141, 1, 0, 0.9058824, 1,
1.079842, -0.1117929, 3.334456, 1, 0, 0.9019608, 1,
1.07991, -1.843386, 4.616062, 1, 0, 0.8941177, 1,
1.090035, -1.887392, 4.026409, 1, 0, 0.8862745, 1,
1.090327, -0.05008094, 3.434292, 1, 0, 0.8823529, 1,
1.091734, 0.6697007, 0.6920806, 1, 0, 0.8745098, 1,
1.092262, 0.3165325, 0.5580474, 1, 0, 0.8705882, 1,
1.095925, -0.7006282, 1.008542, 1, 0, 0.8627451, 1,
1.09873, -0.7715444, 3.028818, 1, 0, 0.8588235, 1,
1.09901, -0.8225617, 4.400081, 1, 0, 0.8509804, 1,
1.101711, -0.0857896, 2.165689, 1, 0, 0.8470588, 1,
1.107426, 0.3344904, 1.931866, 1, 0, 0.8392157, 1,
1.122261, -0.3125647, 1.718923, 1, 0, 0.8352941, 1,
1.126075, 2.137315, 0.02914456, 1, 0, 0.827451, 1,
1.128169, 0.1972195, 0.8300955, 1, 0, 0.8235294, 1,
1.132653, 0.6391042, 0.7794934, 1, 0, 0.8156863, 1,
1.13474, 1.100098, -0.8059552, 1, 0, 0.8117647, 1,
1.137576, -0.5390002, 2.306708, 1, 0, 0.8039216, 1,
1.139393, -0.2113642, 2.997705, 1, 0, 0.7960784, 1,
1.155069, 0.6653241, 2.289713, 1, 0, 0.7921569, 1,
1.157708, -0.7616348, 3.252505, 1, 0, 0.7843137, 1,
1.164479, -0.5486839, 3.245097, 1, 0, 0.7803922, 1,
1.164793, -0.1562722, 1.654914, 1, 0, 0.772549, 1,
1.166583, -1.002014, 2.798983, 1, 0, 0.7686275, 1,
1.170888, -1.443204, 2.639373, 1, 0, 0.7607843, 1,
1.171935, -1.049115, 4.515978, 1, 0, 0.7568628, 1,
1.18832, 0.03076035, 1.001281, 1, 0, 0.7490196, 1,
1.191558, 0.8048027, 1.265501, 1, 0, 0.7450981, 1,
1.200154, 0.5594538, 0.6922617, 1, 0, 0.7372549, 1,
1.200447, 1.467438, -0.3512057, 1, 0, 0.7333333, 1,
1.208024, 0.07090446, -0.494248, 1, 0, 0.7254902, 1,
1.211532, 0.2800213, 2.632266, 1, 0, 0.7215686, 1,
1.21176, 0.6072358, 0.4901422, 1, 0, 0.7137255, 1,
1.215568, -1.628779, 1.629783, 1, 0, 0.7098039, 1,
1.217018, -1.391505, 1.918832, 1, 0, 0.7019608, 1,
1.226114, 0.3793476, 1.337694, 1, 0, 0.6941177, 1,
1.229277, 1.392248, -0.2740446, 1, 0, 0.6901961, 1,
1.232684, -0.8467471, 2.430798, 1, 0, 0.682353, 1,
1.233744, 1.245138, 0.07010123, 1, 0, 0.6784314, 1,
1.237784, 0.4571439, 2.486534, 1, 0, 0.6705883, 1,
1.23993, 0.9160005, 0.1154849, 1, 0, 0.6666667, 1,
1.242652, -0.7439291, 2.762099, 1, 0, 0.6588235, 1,
1.246971, -0.6327418, 0.3655917, 1, 0, 0.654902, 1,
1.247516, 0.7880843, 1.609366, 1, 0, 0.6470588, 1,
1.250317, -0.3412233, 1.92759, 1, 0, 0.6431373, 1,
1.251634, 0.3433092, 0.4313252, 1, 0, 0.6352941, 1,
1.252204, -0.1982188, 2.069981, 1, 0, 0.6313726, 1,
1.258853, -1.203412, 1.655197, 1, 0, 0.6235294, 1,
1.261035, -0.195176, -0.06554393, 1, 0, 0.6196079, 1,
1.263831, -0.09422899, 1.963328, 1, 0, 0.6117647, 1,
1.271228, -1.464481, 1.739843, 1, 0, 0.6078432, 1,
1.277561, 0.1655782, 1.296693, 1, 0, 0.6, 1,
1.282623, 1.120247, -0.4442248, 1, 0, 0.5921569, 1,
1.285989, -2.230592, 1.519434, 1, 0, 0.5882353, 1,
1.292827, -1.347995, 1.443303, 1, 0, 0.5803922, 1,
1.293992, -0.4403713, 2.665881, 1, 0, 0.5764706, 1,
1.294895, 0.6537966, 1.032265, 1, 0, 0.5686275, 1,
1.297024, -0.3740306, 2.361662, 1, 0, 0.5647059, 1,
1.29762, 0.7059941, 1.931707, 1, 0, 0.5568628, 1,
1.298739, -0.4476599, 2.420318, 1, 0, 0.5529412, 1,
1.306053, -0.2817211, 0.5315389, 1, 0, 0.5450981, 1,
1.312606, -0.263323, 0.1834902, 1, 0, 0.5411765, 1,
1.317478, -0.8013663, 2.609729, 1, 0, 0.5333334, 1,
1.317873, 0.2456384, 1.495915, 1, 0, 0.5294118, 1,
1.347904, 0.007525593, 0.3227156, 1, 0, 0.5215687, 1,
1.352315, 0.1818664, 3.311213, 1, 0, 0.5176471, 1,
1.352346, 0.2359175, 1.558298, 1, 0, 0.509804, 1,
1.364715, 1.410882, 1.435908, 1, 0, 0.5058824, 1,
1.390953, -0.8206546, 0.858444, 1, 0, 0.4980392, 1,
1.406523, 0.2326534, 1.014812, 1, 0, 0.4901961, 1,
1.412084, 0.5364356, 0.3004073, 1, 0, 0.4862745, 1,
1.413944, -2.251832, 2.6569, 1, 0, 0.4784314, 1,
1.415043, 0.07196127, 2.036441, 1, 0, 0.4745098, 1,
1.41716, -0.06898069, 4.258612, 1, 0, 0.4666667, 1,
1.425761, 0.909206, 0.7411823, 1, 0, 0.4627451, 1,
1.428739, 0.3383502, 2.516226, 1, 0, 0.454902, 1,
1.444528, 1.017734, -0.5385045, 1, 0, 0.4509804, 1,
1.444685, 0.7841643, 2.030387, 1, 0, 0.4431373, 1,
1.449273, 1.698252, -0.4356899, 1, 0, 0.4392157, 1,
1.459945, 1.361357, 2.093549, 1, 0, 0.4313726, 1,
1.467633, -1.415037, 1.647903, 1, 0, 0.427451, 1,
1.47013, -0.3023026, 2.026667, 1, 0, 0.4196078, 1,
1.48562, 0.8133542, 1.654895, 1, 0, 0.4156863, 1,
1.493528, -0.6087815, 3.630806, 1, 0, 0.4078431, 1,
1.500276, -1.316951, 2.704969, 1, 0, 0.4039216, 1,
1.500925, -0.6913044, 1.672992, 1, 0, 0.3960784, 1,
1.507105, 0.4667651, 1.584922, 1, 0, 0.3882353, 1,
1.510139, -0.1506144, 2.004505, 1, 0, 0.3843137, 1,
1.513051, -1.096341, 3.186346, 1, 0, 0.3764706, 1,
1.528919, 0.8291407, 1.558775, 1, 0, 0.372549, 1,
1.531034, -0.5976347, 3.327954, 1, 0, 0.3647059, 1,
1.533299, 0.402668, 1.600073, 1, 0, 0.3607843, 1,
1.536241, 0.9065403, 0.9246054, 1, 0, 0.3529412, 1,
1.556292, 0.05562547, 1.539728, 1, 0, 0.3490196, 1,
1.572695, -1.107254, 1.737834, 1, 0, 0.3411765, 1,
1.576152, 0.3635862, 2.302747, 1, 0, 0.3372549, 1,
1.580873, -1.957209, 1.533082, 1, 0, 0.3294118, 1,
1.580957, 1.066322, 2.209446, 1, 0, 0.3254902, 1,
1.582512, -1.382178, 0.7719949, 1, 0, 0.3176471, 1,
1.59357, -1.686802, 2.918373, 1, 0, 0.3137255, 1,
1.604659, -1.572776, 3.466254, 1, 0, 0.3058824, 1,
1.609643, 1.696684, 1.961987, 1, 0, 0.2980392, 1,
1.613765, -0.3733086, 0.8297114, 1, 0, 0.2941177, 1,
1.614285, -1.000125, 2.139241, 1, 0, 0.2862745, 1,
1.62046, 1.171706, 0.8861325, 1, 0, 0.282353, 1,
1.63701, 0.9015796, 2.36095, 1, 0, 0.2745098, 1,
1.638781, 1.091452, 1.310187, 1, 0, 0.2705882, 1,
1.647696, 1.562484, 0.07505918, 1, 0, 0.2627451, 1,
1.656917, -0.4701122, 2.063631, 1, 0, 0.2588235, 1,
1.65778, -0.1475608, 2.550756, 1, 0, 0.2509804, 1,
1.657854, -2.437093, 3.618791, 1, 0, 0.2470588, 1,
1.65925, 1.708091, 1.82319, 1, 0, 0.2392157, 1,
1.66688, 1.084588, 0.1311252, 1, 0, 0.2352941, 1,
1.667723, -1.135238, 3.426025, 1, 0, 0.227451, 1,
1.672521, -0.1327461, 2.220535, 1, 0, 0.2235294, 1,
1.689898, -0.6599293, 0.9300604, 1, 0, 0.2156863, 1,
1.69502, -0.1782214, 0.1570944, 1, 0, 0.2117647, 1,
1.706566, -0.02491036, 2.649322, 1, 0, 0.2039216, 1,
1.721179, 0.695675, 0.9216949, 1, 0, 0.1960784, 1,
1.733531, 1.106651, 0.4992075, 1, 0, 0.1921569, 1,
1.749032, 2.069147, 0.7360851, 1, 0, 0.1843137, 1,
1.751146, 0.9826819, 1.328223, 1, 0, 0.1803922, 1,
1.755051, 0.08651163, 2.414932, 1, 0, 0.172549, 1,
1.758077, -0.01884386, 0.06634538, 1, 0, 0.1686275, 1,
1.762332, -0.9519291, 2.440789, 1, 0, 0.1607843, 1,
1.772171, -1.25501, 1.471181, 1, 0, 0.1568628, 1,
1.776432, 0.5585263, 1.019586, 1, 0, 0.1490196, 1,
1.776462, -0.4684854, -0.5513792, 1, 0, 0.145098, 1,
1.794213, 1.125328, 0.1570365, 1, 0, 0.1372549, 1,
1.824008, -1.173046, 2.33027, 1, 0, 0.1333333, 1,
1.829693, -0.8130567, 1.99264, 1, 0, 0.1254902, 1,
1.830844, -1.586949, 1.902984, 1, 0, 0.1215686, 1,
1.836355, -0.6068228, 2.595541, 1, 0, 0.1137255, 1,
1.847681, 0.005157492, 1.527916, 1, 0, 0.1098039, 1,
1.879847, -0.4109159, 2.808135, 1, 0, 0.1019608, 1,
1.918141, 0.0542456, 3.306906, 1, 0, 0.09411765, 1,
1.926646, 0.5537808, 0.5784943, 1, 0, 0.09019608, 1,
1.948329, 0.8549469, 1.593924, 1, 0, 0.08235294, 1,
1.975491, -0.05242278, 1.747186, 1, 0, 0.07843138, 1,
1.98713, 0.3498187, 2.200516, 1, 0, 0.07058824, 1,
2.048384, 0.6453919, 2.080624, 1, 0, 0.06666667, 1,
2.049329, 1.597055, 1.549508, 1, 0, 0.05882353, 1,
2.100724, 1.146175, 0.6206713, 1, 0, 0.05490196, 1,
2.152273, 0.2022137, 2.513056, 1, 0, 0.04705882, 1,
2.205091, -0.4569038, 0.3230481, 1, 0, 0.04313726, 1,
2.263933, 0.5722267, 1.64196, 1, 0, 0.03529412, 1,
2.47477, 0.3813323, 1.530473, 1, 0, 0.03137255, 1,
2.532599, 0.1126406, 1.441899, 1, 0, 0.02352941, 1,
2.629095, 1.712816, -0.4923764, 1, 0, 0.01960784, 1,
2.636031, -0.2160619, 2.452666, 1, 0, 0.01176471, 1,
2.807341, 0.8899539, 1.668405, 1, 0, 0.007843138, 1
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
-0.4794754, -4.379111, -7.463595, 0, -0.5, 0.5, 0.5,
-0.4794754, -4.379111, -7.463595, 1, -0.5, 0.5, 0.5,
-0.4794754, -4.379111, -7.463595, 1, 1.5, 0.5, 0.5,
-0.4794754, -4.379111, -7.463595, 0, 1.5, 0.5, 0.5
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
-4.880522, -0.2163298, -7.463595, 0, -0.5, 0.5, 0.5,
-4.880522, -0.2163298, -7.463595, 1, -0.5, 0.5, 0.5,
-4.880522, -0.2163298, -7.463595, 1, 1.5, 0.5, 0.5,
-4.880522, -0.2163298, -7.463595, 0, 1.5, 0.5, 0.5
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
-4.880522, -4.379111, 0.02672839, 0, -0.5, 0.5, 0.5,
-4.880522, -4.379111, 0.02672839, 1, -0.5, 0.5, 0.5,
-4.880522, -4.379111, 0.02672839, 1, 1.5, 0.5, 0.5,
-4.880522, -4.379111, 0.02672839, 0, 1.5, 0.5, 0.5
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
-3, -3.418469, -5.735059,
2, -3.418469, -5.735059,
-3, -3.418469, -5.735059,
-3, -3.578576, -6.023149,
-2, -3.418469, -5.735059,
-2, -3.578576, -6.023149,
-1, -3.418469, -5.735059,
-1, -3.578576, -6.023149,
0, -3.418469, -5.735059,
0, -3.578576, -6.023149,
1, -3.418469, -5.735059,
1, -3.578576, -6.023149,
2, -3.418469, -5.735059,
2, -3.578576, -6.023149
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
-3, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
-3, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
-3, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
-3, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5,
-2, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
-2, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
-2, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
-2, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5,
-1, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
-1, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
-1, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
-1, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5,
0, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
0, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
0, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
0, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5,
1, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
1, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
1, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
1, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5,
2, -3.89879, -6.599328, 0, -0.5, 0.5, 0.5,
2, -3.89879, -6.599328, 1, -0.5, 0.5, 0.5,
2, -3.89879, -6.599328, 1, 1.5, 0.5, 0.5,
2, -3.89879, -6.599328, 0, 1.5, 0.5, 0.5
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
-3.864896, -3, -5.735059,
-3.864896, 2, -5.735059,
-3.864896, -3, -5.735059,
-4.034167, -3, -6.023149,
-3.864896, -2, -5.735059,
-4.034167, -2, -6.023149,
-3.864896, -1, -5.735059,
-4.034167, -1, -6.023149,
-3.864896, 0, -5.735059,
-4.034167, 0, -6.023149,
-3.864896, 1, -5.735059,
-4.034167, 1, -6.023149,
-3.864896, 2, -5.735059,
-4.034167, 2, -6.023149
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
-4.372709, -3, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, -3, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, -3, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, -3, -6.599328, 0, 1.5, 0.5, 0.5,
-4.372709, -2, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, -2, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, -2, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, -2, -6.599328, 0, 1.5, 0.5, 0.5,
-4.372709, -1, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, -1, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, -1, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, -1, -6.599328, 0, 1.5, 0.5, 0.5,
-4.372709, 0, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, 0, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, 0, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, 0, -6.599328, 0, 1.5, 0.5, 0.5,
-4.372709, 1, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, 1, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, 1, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, 1, -6.599328, 0, 1.5, 0.5, 0.5,
-4.372709, 2, -6.599328, 0, -0.5, 0.5, 0.5,
-4.372709, 2, -6.599328, 1, -0.5, 0.5, 0.5,
-4.372709, 2, -6.599328, 1, 1.5, 0.5, 0.5,
-4.372709, 2, -6.599328, 0, 1.5, 0.5, 0.5
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
-3.864896, -3.418469, -4,
-3.864896, -3.418469, 4,
-3.864896, -3.418469, -4,
-4.034167, -3.578576, -4,
-3.864896, -3.418469, -2,
-4.034167, -3.578576, -2,
-3.864896, -3.418469, 0,
-4.034167, -3.578576, 0,
-3.864896, -3.418469, 2,
-4.034167, -3.578576, 2,
-3.864896, -3.418469, 4,
-4.034167, -3.578576, 4
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
-4.372709, -3.89879, -4, 0, -0.5, 0.5, 0.5,
-4.372709, -3.89879, -4, 1, -0.5, 0.5, 0.5,
-4.372709, -3.89879, -4, 1, 1.5, 0.5, 0.5,
-4.372709, -3.89879, -4, 0, 1.5, 0.5, 0.5,
-4.372709, -3.89879, -2, 0, -0.5, 0.5, 0.5,
-4.372709, -3.89879, -2, 1, -0.5, 0.5, 0.5,
-4.372709, -3.89879, -2, 1, 1.5, 0.5, 0.5,
-4.372709, -3.89879, -2, 0, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 0, 0, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 0, 1, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 0, 1, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 0, 0, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 2, 0, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 2, 1, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 2, 1, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 2, 0, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 4, 0, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 4, 1, -0.5, 0.5, 0.5,
-4.372709, -3.89879, 4, 1, 1.5, 0.5, 0.5,
-4.372709, -3.89879, 4, 0, 1.5, 0.5, 0.5
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
-3.864896, -3.418469, -5.735059,
-3.864896, 2.98581, -5.735059,
-3.864896, -3.418469, 5.788516,
-3.864896, 2.98581, 5.788516,
-3.864896, -3.418469, -5.735059,
-3.864896, -3.418469, 5.788516,
-3.864896, 2.98581, -5.735059,
-3.864896, 2.98581, 5.788516,
-3.864896, -3.418469, -5.735059,
2.905945, -3.418469, -5.735059,
-3.864896, -3.418469, 5.788516,
2.905945, -3.418469, 5.788516,
-3.864896, 2.98581, -5.735059,
2.905945, 2.98581, -5.735059,
-3.864896, 2.98581, 5.788516,
2.905945, 2.98581, 5.788516,
2.905945, -3.418469, -5.735059,
2.905945, 2.98581, -5.735059,
2.905945, -3.418469, 5.788516,
2.905945, 2.98581, 5.788516,
2.905945, -3.418469, -5.735059,
2.905945, -3.418469, 5.788516,
2.905945, 2.98581, -5.735059,
2.905945, 2.98581, 5.788516
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
var radius = 7.913943;
var distance = 35.21003;
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
mvMatrix.translate( 0.4794754, 0.2163298, -0.02672839 );
mvMatrix.scale( 1.263759, 1.336093, 0.7425395 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21003);
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


