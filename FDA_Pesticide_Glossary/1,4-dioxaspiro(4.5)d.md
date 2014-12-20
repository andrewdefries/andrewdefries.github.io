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
-3.477301, -0.5854515, -3.42576, 1, 0, 0, 1,
-3.049517, -0.05985837, -1.510386, 1, 0.007843138, 0, 1,
-3.048481, -0.6125345, -0.6545812, 1, 0.01176471, 0, 1,
-2.825265, 0.1443705, -1.399558, 1, 0.01960784, 0, 1,
-2.713021, -0.3742552, -1.455643, 1, 0.02352941, 0, 1,
-2.686892, 0.3555079, -1.849371, 1, 0.03137255, 0, 1,
-2.679276, 2.705712, -0.669828, 1, 0.03529412, 0, 1,
-2.67146, -2.796066, -1.561268, 1, 0.04313726, 0, 1,
-2.630009, -0.6149451, -2.610039, 1, 0.04705882, 0, 1,
-2.612172, 0.3310847, -2.517776, 1, 0.05490196, 0, 1,
-2.497432, -0.1448238, -0.9045016, 1, 0.05882353, 0, 1,
-2.48625, 1.563275, -0.6425892, 1, 0.06666667, 0, 1,
-2.410133, 0.8356282, -1.929384, 1, 0.07058824, 0, 1,
-2.250313, 1.149301, -0.4262943, 1, 0.07843138, 0, 1,
-2.224953, 0.07434049, 0.3165887, 1, 0.08235294, 0, 1,
-2.211981, 1.980209, -0.2155172, 1, 0.09019608, 0, 1,
-2.188783, -0.0862219, 0.2654501, 1, 0.09411765, 0, 1,
-2.162151, 0.8477696, -1.360072, 1, 0.1019608, 0, 1,
-2.145321, 0.9565179, 1.34859, 1, 0.1098039, 0, 1,
-2.140585, 1.381026, -0.272851, 1, 0.1137255, 0, 1,
-2.120135, 0.2163579, -0.9633096, 1, 0.1215686, 0, 1,
-2.110557, -0.04396962, -2.553537, 1, 0.1254902, 0, 1,
-2.107086, -0.1878113, -3.986909, 1, 0.1333333, 0, 1,
-2.030186, -1.180979, -3.336643, 1, 0.1372549, 0, 1,
-1.975314, -0.7569851, -1.797397, 1, 0.145098, 0, 1,
-1.974418, 0.5442192, -2.236359, 1, 0.1490196, 0, 1,
-1.971623, 0.08484924, -0.2956469, 1, 0.1568628, 0, 1,
-1.96998, 1.187964, -2.048691, 1, 0.1607843, 0, 1,
-1.963375, 0.4793761, -1.078168, 1, 0.1686275, 0, 1,
-1.950583, -0.08550786, -0.8266069, 1, 0.172549, 0, 1,
-1.933315, -2.204852, -0.4565707, 1, 0.1803922, 0, 1,
-1.923087, 0.03233349, -0.5424035, 1, 0.1843137, 0, 1,
-1.902359, 1.789819, -0.5395654, 1, 0.1921569, 0, 1,
-1.892823, 0.5745689, -2.252347, 1, 0.1960784, 0, 1,
-1.890098, 1.080752, -1.071114, 1, 0.2039216, 0, 1,
-1.883488, 0.4529406, -2.265856, 1, 0.2117647, 0, 1,
-1.865816, 0.8447633, -2.018247, 1, 0.2156863, 0, 1,
-1.851416, 0.7399285, -1.377051, 1, 0.2235294, 0, 1,
-1.848981, -0.475523, -1.395656, 1, 0.227451, 0, 1,
-1.848516, -0.4946495, -0.5184894, 1, 0.2352941, 0, 1,
-1.844603, 0.2790622, -3.653718, 1, 0.2392157, 0, 1,
-1.800994, -0.1224919, -1.187475, 1, 0.2470588, 0, 1,
-1.754639, -0.1303188, -1.05605, 1, 0.2509804, 0, 1,
-1.719612, -0.6202331, -2.235983, 1, 0.2588235, 0, 1,
-1.714494, 0.06170318, -0.6129036, 1, 0.2627451, 0, 1,
-1.713666, -1.405758, -2.973755, 1, 0.2705882, 0, 1,
-1.71167, -1.332949, -2.713354, 1, 0.2745098, 0, 1,
-1.700438, -0.3197842, -2.074707, 1, 0.282353, 0, 1,
-1.699115, 1.176931, -1.886416, 1, 0.2862745, 0, 1,
-1.668653, -0.6348153, -0.7220389, 1, 0.2941177, 0, 1,
-1.660756, -0.2762236, -3.226958, 1, 0.3019608, 0, 1,
-1.65138, 1.013841, -1.702989, 1, 0.3058824, 0, 1,
-1.647526, -1.678848, -1.313443, 1, 0.3137255, 0, 1,
-1.646245, -0.2001851, -0.5555681, 1, 0.3176471, 0, 1,
-1.64095, -0.2087348, -2.16775, 1, 0.3254902, 0, 1,
-1.639102, -0.4659712, -1.125768, 1, 0.3294118, 0, 1,
-1.62721, 1.396062, -2.412015, 1, 0.3372549, 0, 1,
-1.623791, 0.8773171, -0.5898174, 1, 0.3411765, 0, 1,
-1.567065, 1.279886, -3.188968, 1, 0.3490196, 0, 1,
-1.563369, 2.227656, 0.9738835, 1, 0.3529412, 0, 1,
-1.552572, -0.1554677, -2.645878, 1, 0.3607843, 0, 1,
-1.539089, -0.5364737, -1.989908, 1, 0.3647059, 0, 1,
-1.524856, -2.715641, -2.885392, 1, 0.372549, 0, 1,
-1.516148, -0.757709, -3.086528, 1, 0.3764706, 0, 1,
-1.508335, 1.016865, -0.5246905, 1, 0.3843137, 0, 1,
-1.50537, 0.2112382, -2.094327, 1, 0.3882353, 0, 1,
-1.504251, 0.1520075, -1.064875, 1, 0.3960784, 0, 1,
-1.504176, -0.3545503, -1.789835, 1, 0.4039216, 0, 1,
-1.479653, -0.6038418, -1.863495, 1, 0.4078431, 0, 1,
-1.478642, -0.8274295, -1.711543, 1, 0.4156863, 0, 1,
-1.478062, -1.692931, -3.116293, 1, 0.4196078, 0, 1,
-1.470087, 0.5954724, -1.583271, 1, 0.427451, 0, 1,
-1.468861, 0.6988145, -1.952158, 1, 0.4313726, 0, 1,
-1.447594, -0.9941522, -3.061477, 1, 0.4392157, 0, 1,
-1.438442, 0.7612909, 1.018082, 1, 0.4431373, 0, 1,
-1.43444, 1.5948, -0.2234063, 1, 0.4509804, 0, 1,
-1.422392, -0.83558, -2.548297, 1, 0.454902, 0, 1,
-1.420663, 0.1199146, -2.102736, 1, 0.4627451, 0, 1,
-1.412031, 0.5627244, -1.329448, 1, 0.4666667, 0, 1,
-1.405583, 0.6839222, 0.07801024, 1, 0.4745098, 0, 1,
-1.383144, 0.5800637, -1.818653, 1, 0.4784314, 0, 1,
-1.377814, 0.611994, -1.327544, 1, 0.4862745, 0, 1,
-1.365281, 0.158966, -1.080293, 1, 0.4901961, 0, 1,
-1.345519, 0.9312068, -0.08372653, 1, 0.4980392, 0, 1,
-1.340939, -1.142292, -2.097346, 1, 0.5058824, 0, 1,
-1.339968, 0.3511271, -0.5560295, 1, 0.509804, 0, 1,
-1.336408, 0.3879757, -1.784409, 1, 0.5176471, 0, 1,
-1.333096, 0.2597614, -1.796414, 1, 0.5215687, 0, 1,
-1.331028, -1.604898, -3.914017, 1, 0.5294118, 0, 1,
-1.315866, -0.9073907, 0.7002711, 1, 0.5333334, 0, 1,
-1.308645, 1.347242, -0.7296764, 1, 0.5411765, 0, 1,
-1.301713, -0.8640932, -2.751941, 1, 0.5450981, 0, 1,
-1.290246, 0.4525059, -0.1944099, 1, 0.5529412, 0, 1,
-1.285857, 1.6673, 1.051178, 1, 0.5568628, 0, 1,
-1.277476, 0.7566789, -0.8321949, 1, 0.5647059, 0, 1,
-1.26714, 0.5698137, -0.8115147, 1, 0.5686275, 0, 1,
-1.263852, 2.100133, -1.592549, 1, 0.5764706, 0, 1,
-1.253082, -0.1131737, -1.824795, 1, 0.5803922, 0, 1,
-1.252506, 1.563015, 0.3241565, 1, 0.5882353, 0, 1,
-1.249102, -1.718157, -2.091563, 1, 0.5921569, 0, 1,
-1.248134, 2.505873, 0.3937908, 1, 0.6, 0, 1,
-1.231259, -1.358976, -3.22328, 1, 0.6078432, 0, 1,
-1.22749, -0.3446026, -2.978396, 1, 0.6117647, 0, 1,
-1.222884, 0.876365, -0.7257057, 1, 0.6196079, 0, 1,
-1.222029, 0.2641649, -0.8560629, 1, 0.6235294, 0, 1,
-1.214257, -1.007554, -1.415694, 1, 0.6313726, 0, 1,
-1.213394, 0.09816252, -0.407651, 1, 0.6352941, 0, 1,
-1.202702, 1.031459, -1.155079, 1, 0.6431373, 0, 1,
-1.197423, 0.4882053, -1.168897, 1, 0.6470588, 0, 1,
-1.196951, -0.7533602, -0.3109759, 1, 0.654902, 0, 1,
-1.195315, 0.7829651, -0.342474, 1, 0.6588235, 0, 1,
-1.18846, -0.1119548, -1.34223, 1, 0.6666667, 0, 1,
-1.181996, 3.209343, 0.07019024, 1, 0.6705883, 0, 1,
-1.180494, 0.3790417, -1.824381, 1, 0.6784314, 0, 1,
-1.176604, -0.1943246, -1.69743, 1, 0.682353, 0, 1,
-1.176217, -1.069231, -4.667299, 1, 0.6901961, 0, 1,
-1.157958, -1.735226, -2.308434, 1, 0.6941177, 0, 1,
-1.15554, 1.353765, -1.965043, 1, 0.7019608, 0, 1,
-1.14572, -1.019196, -2.958398, 1, 0.7098039, 0, 1,
-1.137601, -0.2137814, -2.040259, 1, 0.7137255, 0, 1,
-1.135411, -0.7104301, -0.2678453, 1, 0.7215686, 0, 1,
-1.134095, -0.4389331, -2.823839, 1, 0.7254902, 0, 1,
-1.131651, 0.1270905, -2.495868, 1, 0.7333333, 0, 1,
-1.127298, 0.4971631, 0.5432265, 1, 0.7372549, 0, 1,
-1.123324, -0.2226212, -1.196163, 1, 0.7450981, 0, 1,
-1.123294, 0.1872924, -1.57828, 1, 0.7490196, 0, 1,
-1.117318, 0.007568614, -0.4504138, 1, 0.7568628, 0, 1,
-1.111359, 0.06551804, -3.639479, 1, 0.7607843, 0, 1,
-1.107903, 0.8392813, -0.9174948, 1, 0.7686275, 0, 1,
-1.099039, -0.08784239, -2.774876, 1, 0.772549, 0, 1,
-1.085408, 0.01900085, -1.590779, 1, 0.7803922, 0, 1,
-1.085375, -0.07217044, -2.37487, 1, 0.7843137, 0, 1,
-1.080762, 0.2112712, 1.111311, 1, 0.7921569, 0, 1,
-1.080131, 0.2731693, -1.90948, 1, 0.7960784, 0, 1,
-1.072111, 0.4804245, -2.036495, 1, 0.8039216, 0, 1,
-1.066868, -1.170523, -3.108468, 1, 0.8117647, 0, 1,
-1.065305, 1.34467, 0.9416927, 1, 0.8156863, 0, 1,
-1.059787, 1.374997, -0.0765558, 1, 0.8235294, 0, 1,
-1.058508, 1.644007, 0.1767406, 1, 0.827451, 0, 1,
-1.058118, -1.544845, -4.043852, 1, 0.8352941, 0, 1,
-1.050467, -0.9563363, -4.27143, 1, 0.8392157, 0, 1,
-1.050298, 0.8269307, -3.622657, 1, 0.8470588, 0, 1,
-1.037658, -0.6731722, -1.305273, 1, 0.8509804, 0, 1,
-1.031649, 0.9668422, -0.381836, 1, 0.8588235, 0, 1,
-1.029655, -0.8472686, -2.681843, 1, 0.8627451, 0, 1,
-1.018638, -0.02543441, -2.979656, 1, 0.8705882, 0, 1,
-1.01388, -0.3245353, -0.9159086, 1, 0.8745098, 0, 1,
-1.010951, 1.289293, -2.796342, 1, 0.8823529, 0, 1,
-1.001072, -0.5961366, -2.915582, 1, 0.8862745, 0, 1,
-0.9983257, -0.6836499, -3.00404, 1, 0.8941177, 0, 1,
-0.9962162, 2.007555, 1.447441, 1, 0.8980392, 0, 1,
-0.9928615, 2.255515, 0.180108, 1, 0.9058824, 0, 1,
-0.9766347, 1.146944, -1.725502, 1, 0.9137255, 0, 1,
-0.9764544, -1.257624, -2.324244, 1, 0.9176471, 0, 1,
-0.9762388, -1.178893, -1.21207, 1, 0.9254902, 0, 1,
-0.969521, -0.9649358, -2.176408, 1, 0.9294118, 0, 1,
-0.9689002, -0.4682118, -3.653647, 1, 0.9372549, 0, 1,
-0.9654877, 1.321459, -0.7708101, 1, 0.9411765, 0, 1,
-0.9636573, 2.800318, 0.1226192, 1, 0.9490196, 0, 1,
-0.9620273, -0.5427202, -2.290024, 1, 0.9529412, 0, 1,
-0.9602619, 1.571274, -0.07926781, 1, 0.9607843, 0, 1,
-0.9570066, -0.518766, -1.953731, 1, 0.9647059, 0, 1,
-0.9489356, 0.8257082, -0.5638551, 1, 0.972549, 0, 1,
-0.9339437, 0.9528835, -1.686915, 1, 0.9764706, 0, 1,
-0.932451, 1.639689, -1.502307, 1, 0.9843137, 0, 1,
-0.9291028, 1.670161, -2.071649, 1, 0.9882353, 0, 1,
-0.9285673, 0.1635255, -2.174789, 1, 0.9960784, 0, 1,
-0.9260327, -0.4524306, -1.21329, 0.9960784, 1, 0, 1,
-0.9250636, 1.315473, 0.02233966, 0.9921569, 1, 0, 1,
-0.9209875, -0.8092651, -3.163323, 0.9843137, 1, 0, 1,
-0.9175185, -1.036833, -1.663499, 0.9803922, 1, 0, 1,
-0.9159398, -1.360326, -3.09258, 0.972549, 1, 0, 1,
-0.9120321, 1.918466, 0.09417999, 0.9686275, 1, 0, 1,
-0.9073997, -1.269608, -0.5046514, 0.9607843, 1, 0, 1,
-0.9038904, 0.7047009, -0.4669623, 0.9568627, 1, 0, 1,
-0.8953342, 1.025259, -0.3389273, 0.9490196, 1, 0, 1,
-0.8815753, 0.08058854, -2.20194, 0.945098, 1, 0, 1,
-0.8804086, 0.6009659, -0.5626355, 0.9372549, 1, 0, 1,
-0.8801314, -0.6368919, -0.9064067, 0.9333333, 1, 0, 1,
-0.878638, -0.7646607, -1.231727, 0.9254902, 1, 0, 1,
-0.8753682, -0.8991454, -3.567163, 0.9215686, 1, 0, 1,
-0.8659045, -1.204887, -3.194879, 0.9137255, 1, 0, 1,
-0.8618724, -0.3547755, -3.353562, 0.9098039, 1, 0, 1,
-0.8562935, 0.03533569, 0.2821132, 0.9019608, 1, 0, 1,
-0.8538286, 0.9271992, 0.5616493, 0.8941177, 1, 0, 1,
-0.8464571, -1.475565, -1.795802, 0.8901961, 1, 0, 1,
-0.8450162, 0.9053707, -2.495366, 0.8823529, 1, 0, 1,
-0.8375994, 0.5389373, -1.982605, 0.8784314, 1, 0, 1,
-0.833742, 0.1521496, -1.453893, 0.8705882, 1, 0, 1,
-0.8329796, -0.2184491, -1.169787, 0.8666667, 1, 0, 1,
-0.8232966, 0.6600323, -0.8618825, 0.8588235, 1, 0, 1,
-0.821211, 1.03789, 2.507623, 0.854902, 1, 0, 1,
-0.8210611, 0.129965, -0.4207234, 0.8470588, 1, 0, 1,
-0.8190105, -1.627011, -3.404643, 0.8431373, 1, 0, 1,
-0.8165365, -1.595471, -1.963707, 0.8352941, 1, 0, 1,
-0.8150706, 1.935816, -0.2360618, 0.8313726, 1, 0, 1,
-0.8114363, -0.00861029, -1.255951, 0.8235294, 1, 0, 1,
-0.809148, -1.807287, -2.85571, 0.8196079, 1, 0, 1,
-0.80845, 0.07461844, -0.3975953, 0.8117647, 1, 0, 1,
-0.8063377, 0.7664682, -1.582751, 0.8078431, 1, 0, 1,
-0.8051056, 0.2663364, -0.9092822, 0.8, 1, 0, 1,
-0.80076, -0.4998142, -1.911354, 0.7921569, 1, 0, 1,
-0.7930318, -0.886719, -1.505869, 0.7882353, 1, 0, 1,
-0.7900296, 0.5504872, -1.307442, 0.7803922, 1, 0, 1,
-0.7869543, 0.5093773, -0.8786984, 0.7764706, 1, 0, 1,
-0.7823108, 1.222756, 0.1172153, 0.7686275, 1, 0, 1,
-0.7820675, -0.2048574, -4.051912, 0.7647059, 1, 0, 1,
-0.78196, -0.950727, -2.348045, 0.7568628, 1, 0, 1,
-0.7781652, -0.5936818, -3.126949, 0.7529412, 1, 0, 1,
-0.770416, -1.271142, -2.815374, 0.7450981, 1, 0, 1,
-0.7633467, 0.09384345, -0.7605856, 0.7411765, 1, 0, 1,
-0.7616857, 0.01443369, 0.1367666, 0.7333333, 1, 0, 1,
-0.7542732, 1.132812, -0.1475882, 0.7294118, 1, 0, 1,
-0.7494842, 0.1839695, -1.946637, 0.7215686, 1, 0, 1,
-0.7475926, -2.164915, -2.620648, 0.7176471, 1, 0, 1,
-0.7465563, 0.1710205, -0.7904608, 0.7098039, 1, 0, 1,
-0.7462913, -0.9687276, -2.54823, 0.7058824, 1, 0, 1,
-0.7458956, 0.423241, -0.9269891, 0.6980392, 1, 0, 1,
-0.7413085, 1.126321, -1.782849, 0.6901961, 1, 0, 1,
-0.7406355, -0.56253, -1.440542, 0.6862745, 1, 0, 1,
-0.7334409, 0.3164175, -0.04423292, 0.6784314, 1, 0, 1,
-0.7329772, -1.031101, -2.654583, 0.6745098, 1, 0, 1,
-0.7317106, -0.0589056, -1.617924, 0.6666667, 1, 0, 1,
-0.7302416, 0.2043627, -1.587435, 0.6627451, 1, 0, 1,
-0.7297568, 1.811047, -3.176097, 0.654902, 1, 0, 1,
-0.7203223, 1.316023, -1.097523, 0.6509804, 1, 0, 1,
-0.7162575, 2.250969, -0.5835807, 0.6431373, 1, 0, 1,
-0.7146867, 0.7660915, 0.4655796, 0.6392157, 1, 0, 1,
-0.7099057, -0.47023, -2.532059, 0.6313726, 1, 0, 1,
-0.7037563, 0.1062201, -2.992812, 0.627451, 1, 0, 1,
-0.7018053, 0.2538604, -1.931785, 0.6196079, 1, 0, 1,
-0.6998678, 0.07214957, -1.697157, 0.6156863, 1, 0, 1,
-0.6861486, 1.876826, 0.8793756, 0.6078432, 1, 0, 1,
-0.6851299, 0.6404721, -1.00962, 0.6039216, 1, 0, 1,
-0.6850455, -0.287769, -0.6806337, 0.5960785, 1, 0, 1,
-0.6805436, -0.05909148, -2.569937, 0.5882353, 1, 0, 1,
-0.6769828, 0.3850496, -2.849895, 0.5843138, 1, 0, 1,
-0.6768587, -0.7042228, -4.792052, 0.5764706, 1, 0, 1,
-0.6768115, 0.262825, 0.429997, 0.572549, 1, 0, 1,
-0.6751912, -1.092762, -2.387769, 0.5647059, 1, 0, 1,
-0.6747004, -0.8669951, -2.419205, 0.5607843, 1, 0, 1,
-0.6656336, -0.2395741, -3.075803, 0.5529412, 1, 0, 1,
-0.6653894, -0.368528, -0.3752018, 0.5490196, 1, 0, 1,
-0.6554933, 0.4399044, -0.6332663, 0.5411765, 1, 0, 1,
-0.6546599, -0.5342247, -3.162494, 0.5372549, 1, 0, 1,
-0.6525161, 0.02255453, -0.3612619, 0.5294118, 1, 0, 1,
-0.652044, 1.942365, -0.3762966, 0.5254902, 1, 0, 1,
-0.6434839, 1.313124, -2.064716, 0.5176471, 1, 0, 1,
-0.6398922, -0.352056, -3.92337, 0.5137255, 1, 0, 1,
-0.6382262, -2.205798, -2.935816, 0.5058824, 1, 0, 1,
-0.632938, -0.714783, -1.400278, 0.5019608, 1, 0, 1,
-0.6283458, -0.5064006, -2.110162, 0.4941176, 1, 0, 1,
-0.6249331, 0.6091087, -0.7139463, 0.4862745, 1, 0, 1,
-0.6230488, -0.815495, -2.718232, 0.4823529, 1, 0, 1,
-0.6206705, 0.1474925, -1.296197, 0.4745098, 1, 0, 1,
-0.6197508, 0.7180946, -1.132946, 0.4705882, 1, 0, 1,
-0.619374, -1.944417, -3.54127, 0.4627451, 1, 0, 1,
-0.6190746, 0.5718647, -0.4575941, 0.4588235, 1, 0, 1,
-0.6154252, 0.6421484, -0.3229249, 0.4509804, 1, 0, 1,
-0.6153231, -0.5933275, -0.578933, 0.4470588, 1, 0, 1,
-0.6107873, 1.368041, -2.735777, 0.4392157, 1, 0, 1,
-0.6070951, 0.5919488, 1.121929, 0.4352941, 1, 0, 1,
-0.6059688, -0.09749083, -0.9531269, 0.427451, 1, 0, 1,
-0.60524, 0.7566226, -2.09129, 0.4235294, 1, 0, 1,
-0.6032518, 1.272471, -0.5612059, 0.4156863, 1, 0, 1,
-0.5992411, 0.6704327, 0.5685214, 0.4117647, 1, 0, 1,
-0.5930769, 1.064947, -0.4460926, 0.4039216, 1, 0, 1,
-0.5915532, 0.9289863, -0.8235984, 0.3960784, 1, 0, 1,
-0.5895863, -1.324564, -5.808078, 0.3921569, 1, 0, 1,
-0.5866699, 0.6804469, 0.04479313, 0.3843137, 1, 0, 1,
-0.5848655, -1.677528, -2.44174, 0.3803922, 1, 0, 1,
-0.5810701, -0.2253671, -1.166666, 0.372549, 1, 0, 1,
-0.5761961, -1.111854, -3.177485, 0.3686275, 1, 0, 1,
-0.5728843, 0.2494183, -1.470146, 0.3607843, 1, 0, 1,
-0.570312, 2.223202, -0.1424631, 0.3568628, 1, 0, 1,
-0.5695, -0.9265422, -3.482896, 0.3490196, 1, 0, 1,
-0.5688672, 0.02379027, -2.212078, 0.345098, 1, 0, 1,
-0.5665781, -0.2980269, -1.399869, 0.3372549, 1, 0, 1,
-0.5657833, -1.043909, -1.738148, 0.3333333, 1, 0, 1,
-0.5657184, -0.1132736, -2.055115, 0.3254902, 1, 0, 1,
-0.5648434, 1.350639, -1.523102, 0.3215686, 1, 0, 1,
-0.5646849, -0.4781932, -3.037882, 0.3137255, 1, 0, 1,
-0.5632696, -0.5714788, -3.766202, 0.3098039, 1, 0, 1,
-0.5608257, -0.3740215, -0.8327405, 0.3019608, 1, 0, 1,
-0.5478601, 1.208555, -0.644109, 0.2941177, 1, 0, 1,
-0.5477756, 0.8246343, -0.3232396, 0.2901961, 1, 0, 1,
-0.5476295, 0.01632947, -2.224447, 0.282353, 1, 0, 1,
-0.5468979, -1.516039, -2.519827, 0.2784314, 1, 0, 1,
-0.5450942, -1.233844, -3.867414, 0.2705882, 1, 0, 1,
-0.5436129, -0.1450518, -2.532748, 0.2666667, 1, 0, 1,
-0.5388389, -0.206321, -2.144416, 0.2588235, 1, 0, 1,
-0.5356213, 0.4902802, -0.2067848, 0.254902, 1, 0, 1,
-0.5330589, -0.2006504, -0.9547501, 0.2470588, 1, 0, 1,
-0.5259873, 0.2074662, -1.322214, 0.2431373, 1, 0, 1,
-0.5207788, -1.454906, -3.414279, 0.2352941, 1, 0, 1,
-0.519061, -0.09776711, -2.082883, 0.2313726, 1, 0, 1,
-0.5181549, 0.3440332, -1.12205, 0.2235294, 1, 0, 1,
-0.5171138, -0.2258703, -0.2756856, 0.2196078, 1, 0, 1,
-0.5076106, 0.1744067, 0.6807666, 0.2117647, 1, 0, 1,
-0.5066639, -0.316883, -1.270216, 0.2078431, 1, 0, 1,
-0.505631, 0.8478023, -0.1234111, 0.2, 1, 0, 1,
-0.504811, -2.031939, -4.200357, 0.1921569, 1, 0, 1,
-0.5003374, 1.727802, -0.3769849, 0.1882353, 1, 0, 1,
-0.4963843, -0.8355559, -1.852694, 0.1803922, 1, 0, 1,
-0.4958411, -1.25538, -3.001749, 0.1764706, 1, 0, 1,
-0.4900191, 0.3693061, -1.792597, 0.1686275, 1, 0, 1,
-0.4773027, -0.2889848, -2.800779, 0.1647059, 1, 0, 1,
-0.4760805, 1.510677, 0.9710574, 0.1568628, 1, 0, 1,
-0.471395, -0.529073, -3.009293, 0.1529412, 1, 0, 1,
-0.4603284, 0.1990001, -2.160986, 0.145098, 1, 0, 1,
-0.4574108, -0.3170042, -1.869574, 0.1411765, 1, 0, 1,
-0.4549882, 1.240372, -0.7601731, 0.1333333, 1, 0, 1,
-0.4537819, -0.7269655, 0.8373649, 0.1294118, 1, 0, 1,
-0.4473244, 0.8562307, -0.1735856, 0.1215686, 1, 0, 1,
-0.434344, -0.8301819, -2.324702, 0.1176471, 1, 0, 1,
-0.4339929, 0.6062567, -1.052564, 0.1098039, 1, 0, 1,
-0.4337351, 0.0868163, 0.05339089, 0.1058824, 1, 0, 1,
-0.4310761, 2.177223, 2.2929, 0.09803922, 1, 0, 1,
-0.4264718, -0.8875544, -1.454746, 0.09019608, 1, 0, 1,
-0.4196484, -0.1519013, -3.184741, 0.08627451, 1, 0, 1,
-0.4191638, 0.8615158, 0.1346242, 0.07843138, 1, 0, 1,
-0.4189677, 0.3700121, -1.455942, 0.07450981, 1, 0, 1,
-0.4095021, -0.3679119, -1.536539, 0.06666667, 1, 0, 1,
-0.4076451, -1.589929, -3.231906, 0.0627451, 1, 0, 1,
-0.4033275, -0.9617087, -1.392288, 0.05490196, 1, 0, 1,
-0.4006751, -0.2395724, -1.911949, 0.05098039, 1, 0, 1,
-0.4000072, -0.4811376, -2.037501, 0.04313726, 1, 0, 1,
-0.398522, 1.588589, -0.9105153, 0.03921569, 1, 0, 1,
-0.3964672, 0.04925808, -1.19287, 0.03137255, 1, 0, 1,
-0.395384, 1.550993, -0.07943188, 0.02745098, 1, 0, 1,
-0.3951449, -0.1154024, -3.455609, 0.01960784, 1, 0, 1,
-0.3947684, -0.0804472, -1.388675, 0.01568628, 1, 0, 1,
-0.3920141, -1.065854, -2.600785, 0.007843138, 1, 0, 1,
-0.3862214, -0.6524032, -4.82082, 0.003921569, 1, 0, 1,
-0.3844901, -1.504044, -4.517879, 0, 1, 0.003921569, 1,
-0.3826702, -1.298036, -2.843833, 0, 1, 0.01176471, 1,
-0.3824959, -0.1568847, -1.478688, 0, 1, 0.01568628, 1,
-0.3731979, -0.7052041, -2.538538, 0, 1, 0.02352941, 1,
-0.3729586, -0.6510975, -3.146973, 0, 1, 0.02745098, 1,
-0.3703798, -0.009138715, -4.17337, 0, 1, 0.03529412, 1,
-0.3677318, 1.782457, -0.08225853, 0, 1, 0.03921569, 1,
-0.3636696, 0.1204383, -0.4926884, 0, 1, 0.04705882, 1,
-0.3631642, 0.409598, -0.9662328, 0, 1, 0.05098039, 1,
-0.360698, -0.09195029, -2.207123, 0, 1, 0.05882353, 1,
-0.3601421, -0.8030751, -3.052416, 0, 1, 0.0627451, 1,
-0.3587151, 1.538495, -0.1832774, 0, 1, 0.07058824, 1,
-0.3559616, -0.4910217, -3.123116, 0, 1, 0.07450981, 1,
-0.3556786, 0.1409033, -2.268488, 0, 1, 0.08235294, 1,
-0.3546027, -2.28242, -2.651525, 0, 1, 0.08627451, 1,
-0.3476579, 1.996579, -0.618872, 0, 1, 0.09411765, 1,
-0.342101, 0.3250476, -0.3129705, 0, 1, 0.1019608, 1,
-0.3398237, -0.34569, -2.374654, 0, 1, 0.1058824, 1,
-0.3295226, 0.113929, -1.428568, 0, 1, 0.1137255, 1,
-0.3284527, -1.194631, -2.241373, 0, 1, 0.1176471, 1,
-0.3230449, 1.410934, -0.2380798, 0, 1, 0.1254902, 1,
-0.3226095, -0.3196206, -2.404861, 0, 1, 0.1294118, 1,
-0.3199113, 1.016508, -1.246315, 0, 1, 0.1372549, 1,
-0.3161719, 0.09402884, 1.051297, 0, 1, 0.1411765, 1,
-0.3147876, 0.8275039, 1.385596, 0, 1, 0.1490196, 1,
-0.3127363, -2.224713, -2.667223, 0, 1, 0.1529412, 1,
-0.3105242, -0.2502675, -3.248501, 0, 1, 0.1607843, 1,
-0.304863, 0.1646394, -1.573137, 0, 1, 0.1647059, 1,
-0.3037814, 0.1537323, 1.343182, 0, 1, 0.172549, 1,
-0.3034061, -0.643562, -3.604129, 0, 1, 0.1764706, 1,
-0.2907368, 0.1559176, 0.3605699, 0, 1, 0.1843137, 1,
-0.2896526, 0.539184, -0.4270797, 0, 1, 0.1882353, 1,
-0.2876354, -0.3298886, -1.548055, 0, 1, 0.1960784, 1,
-0.2875835, 0.3807223, -0.8975098, 0, 1, 0.2039216, 1,
-0.284508, 0.2515268, -1.495308, 0, 1, 0.2078431, 1,
-0.2844344, 0.2838977, -1.888077, 0, 1, 0.2156863, 1,
-0.2840478, -1.262411, -3.904122, 0, 1, 0.2196078, 1,
-0.2837035, -0.1933377, -2.645849, 0, 1, 0.227451, 1,
-0.2819135, -1.059179, -2.212383, 0, 1, 0.2313726, 1,
-0.2799716, 1.139758, 0.6042984, 0, 1, 0.2392157, 1,
-0.2788932, 1.344058, -0.455342, 0, 1, 0.2431373, 1,
-0.272118, -0.8883405, -4.2212, 0, 1, 0.2509804, 1,
-0.2704839, -1.84745, -4.148863, 0, 1, 0.254902, 1,
-0.2629275, 0.5070344, 0.446346, 0, 1, 0.2627451, 1,
-0.2575946, -1.093061, -3.347167, 0, 1, 0.2666667, 1,
-0.2551698, 0.6676858, -0.3035285, 0, 1, 0.2745098, 1,
-0.2551445, 0.2179452, -1.274212, 0, 1, 0.2784314, 1,
-0.251095, -1.221681, -4.090771, 0, 1, 0.2862745, 1,
-0.2500639, 0.4896273, 0.3788856, 0, 1, 0.2901961, 1,
-0.2472193, 0.6305761, 0.01125242, 0, 1, 0.2980392, 1,
-0.2452166, -0.06878216, -4.825524, 0, 1, 0.3058824, 1,
-0.2447629, 0.7538242, -0.2226106, 0, 1, 0.3098039, 1,
-0.2384938, -0.5329653, -2.753606, 0, 1, 0.3176471, 1,
-0.2353335, 0.2446538, -1.892806, 0, 1, 0.3215686, 1,
-0.2267572, 1.526399, 0.03351553, 0, 1, 0.3294118, 1,
-0.2231384, -0.9161628, -4.423753, 0, 1, 0.3333333, 1,
-0.220804, -0.2326596, -1.589926, 0, 1, 0.3411765, 1,
-0.2201137, -1.125241, -3.044481, 0, 1, 0.345098, 1,
-0.2182547, -0.4061391, -2.0457, 0, 1, 0.3529412, 1,
-0.2102897, -0.4262146, -2.028695, 0, 1, 0.3568628, 1,
-0.2097321, -0.337582, -2.127536, 0, 1, 0.3647059, 1,
-0.2075386, -1.378477, -3.181533, 0, 1, 0.3686275, 1,
-0.206848, 0.2986401, -0.57577, 0, 1, 0.3764706, 1,
-0.2060347, -0.922079, -4.135235, 0, 1, 0.3803922, 1,
-0.2047666, -1.012559, -3.467912, 0, 1, 0.3882353, 1,
-0.2031446, -1.069184, -1.999934, 0, 1, 0.3921569, 1,
-0.1979107, -0.3602818, -3.775037, 0, 1, 0.4, 1,
-0.1956281, 2.00707, -0.6378524, 0, 1, 0.4078431, 1,
-0.1932082, 0.78328, -0.444347, 0, 1, 0.4117647, 1,
-0.1928827, 1.037117, 0.3323157, 0, 1, 0.4196078, 1,
-0.1919439, -0.5821137, -2.87205, 0, 1, 0.4235294, 1,
-0.1904576, 0.6228207, -0.8284919, 0, 1, 0.4313726, 1,
-0.1872651, -0.1793722, -0.9780281, 0, 1, 0.4352941, 1,
-0.186449, -1.430484, -2.810163, 0, 1, 0.4431373, 1,
-0.1816244, 0.06390551, 0.2631861, 0, 1, 0.4470588, 1,
-0.180875, 0.2517214, -1.768063, 0, 1, 0.454902, 1,
-0.179377, 0.4680537, -1.661773, 0, 1, 0.4588235, 1,
-0.1780553, -0.3777452, -2.122786, 0, 1, 0.4666667, 1,
-0.1766434, -1.2929, -3.707405, 0, 1, 0.4705882, 1,
-0.1702992, -0.7071001, -3.235649, 0, 1, 0.4784314, 1,
-0.1673183, 0.5322471, -0.393336, 0, 1, 0.4823529, 1,
-0.1652238, 1.867448, -0.1237307, 0, 1, 0.4901961, 1,
-0.162669, -0.7870291, -3.27986, 0, 1, 0.4941176, 1,
-0.1602252, -1.264324, 0.04172174, 0, 1, 0.5019608, 1,
-0.1580785, 0.6613576, -0.3812391, 0, 1, 0.509804, 1,
-0.1513356, -1.701339, -2.402261, 0, 1, 0.5137255, 1,
-0.1500679, 0.1838351, -1.757253, 0, 1, 0.5215687, 1,
-0.1493318, -1.77387, -3.43744, 0, 1, 0.5254902, 1,
-0.1480476, -0.5811284, -1.907574, 0, 1, 0.5333334, 1,
-0.1475513, 0.1156056, -1.028858, 0, 1, 0.5372549, 1,
-0.1458583, -1.753568, -2.987708, 0, 1, 0.5450981, 1,
-0.145004, -0.3021309, -1.730248, 0, 1, 0.5490196, 1,
-0.1403466, -1.829719, -3.698378, 0, 1, 0.5568628, 1,
-0.1322952, 1.101381, 0.1603573, 0, 1, 0.5607843, 1,
-0.1215059, 0.6135697, -1.087642, 0, 1, 0.5686275, 1,
-0.1213784, -0.02945117, -2.524981, 0, 1, 0.572549, 1,
-0.1190076, -0.56415, -1.741448, 0, 1, 0.5803922, 1,
-0.1152855, -2.051738, -3.248653, 0, 1, 0.5843138, 1,
-0.1119594, -0.4607035, -3.522586, 0, 1, 0.5921569, 1,
-0.1116177, -0.1558087, -2.54914, 0, 1, 0.5960785, 1,
-0.109965, -0.2290501, -3.767197, 0, 1, 0.6039216, 1,
-0.1071229, -0.8398886, -1.673013, 0, 1, 0.6117647, 1,
-0.106587, 0.5868704, 0.737832, 0, 1, 0.6156863, 1,
-0.1004659, -0.2759396, -0.3543154, 0, 1, 0.6235294, 1,
-0.09849565, 0.5248674, 0.9205342, 0, 1, 0.627451, 1,
-0.09669561, -1.250664, -2.385217, 0, 1, 0.6352941, 1,
-0.09622157, 1.794296, -0.3577391, 0, 1, 0.6392157, 1,
-0.09322991, -0.2468966, -1.529002, 0, 1, 0.6470588, 1,
-0.08885065, 0.4368353, 0.08886147, 0, 1, 0.6509804, 1,
-0.08862814, -0.6803799, -2.465792, 0, 1, 0.6588235, 1,
-0.08372282, 0.6766741, 0.1102865, 0, 1, 0.6627451, 1,
-0.08178785, -0.8264335, -3.49616, 0, 1, 0.6705883, 1,
-0.08081695, 1.674255, 0.2106686, 0, 1, 0.6745098, 1,
-0.07907017, 1.691715, -1.707609, 0, 1, 0.682353, 1,
-0.07900487, -0.336478, -3.463618, 0, 1, 0.6862745, 1,
-0.07319313, -1.764694, -3.991248, 0, 1, 0.6941177, 1,
-0.07277082, -1.048065, -3.334516, 0, 1, 0.7019608, 1,
-0.07064863, 0.2846773, -0.1013901, 0, 1, 0.7058824, 1,
-0.06766915, 0.8732372, -0.3349522, 0, 1, 0.7137255, 1,
-0.06724175, 1.251546, 0.1675744, 0, 1, 0.7176471, 1,
-0.06706069, 0.2084109, -1.084635, 0, 1, 0.7254902, 1,
-0.06665432, -1.146577, -2.432233, 0, 1, 0.7294118, 1,
-0.06268308, 0.2593974, 0.436106, 0, 1, 0.7372549, 1,
-0.05558437, 1.581191, -1.694217, 0, 1, 0.7411765, 1,
-0.05443108, 0.2418901, 0.736186, 0, 1, 0.7490196, 1,
-0.05280499, -0.04876352, -0.7145533, 0, 1, 0.7529412, 1,
-0.05143339, -0.02539651, -1.506564, 0, 1, 0.7607843, 1,
-0.04853479, 1.056282, 0.3231328, 0, 1, 0.7647059, 1,
-0.04734476, -0.6317461, -4.727887, 0, 1, 0.772549, 1,
-0.04544262, 0.1613159, -0.4563036, 0, 1, 0.7764706, 1,
-0.04414331, 1.321607, 0.5768198, 0, 1, 0.7843137, 1,
-0.03731257, 1.854307, -0.2009231, 0, 1, 0.7882353, 1,
-0.02953434, 1.516347, 1.882935, 0, 1, 0.7960784, 1,
-0.02790234, -1.803118, -3.567714, 0, 1, 0.8039216, 1,
-0.02534631, -0.3095422, -2.872326, 0, 1, 0.8078431, 1,
-0.02394846, 0.08172399, -0.5654259, 0, 1, 0.8156863, 1,
-0.02227162, -1.255043, -2.123731, 0, 1, 0.8196079, 1,
-0.01916599, 1.658008, -0.1427294, 0, 1, 0.827451, 1,
-0.01839407, -0.7844794, -3.041904, 0, 1, 0.8313726, 1,
-0.01255493, -0.4217092, -2.729033, 0, 1, 0.8392157, 1,
-0.007454672, 0.08319584, -0.08152751, 0, 1, 0.8431373, 1,
-0.006922511, 0.6186656, 0.7713254, 0, 1, 0.8509804, 1,
-0.006731895, -0.7878849, -3.057113, 0, 1, 0.854902, 1,
-0.006651345, 0.02528567, -1.108514, 0, 1, 0.8627451, 1,
-0.00521693, 0.5618501, -1.023485, 0, 1, 0.8666667, 1,
0.001501372, 0.3405624, -0.2424582, 0, 1, 0.8745098, 1,
0.005621903, -0.0788127, 3.861347, 0, 1, 0.8784314, 1,
0.01126258, 0.1545908, -1.691794, 0, 1, 0.8862745, 1,
0.01383346, 0.2991198, 0.437501, 0, 1, 0.8901961, 1,
0.0161824, -0.2202331, 5.239313, 0, 1, 0.8980392, 1,
0.02153961, -0.4157067, 3.084081, 0, 1, 0.9058824, 1,
0.02223326, 1.545928, -0.006487617, 0, 1, 0.9098039, 1,
0.02253096, -0.4687538, 3.266065, 0, 1, 0.9176471, 1,
0.0236531, 0.9659365, 0.9297371, 0, 1, 0.9215686, 1,
0.0238324, 1.165223, 2.128165, 0, 1, 0.9294118, 1,
0.02450105, 0.07926498, -0.368966, 0, 1, 0.9333333, 1,
0.02623948, 2.12453, -2.150783, 0, 1, 0.9411765, 1,
0.02898039, 1.642288, -0.6183698, 0, 1, 0.945098, 1,
0.02900661, -1.112975, 2.398079, 0, 1, 0.9529412, 1,
0.0295841, 1.152296, 0.1270691, 0, 1, 0.9568627, 1,
0.02981134, 0.2599753, -0.3181915, 0, 1, 0.9647059, 1,
0.03380619, -1.032965, 2.688506, 0, 1, 0.9686275, 1,
0.03453467, -0.4275068, 4.166721, 0, 1, 0.9764706, 1,
0.03511482, 0.9477412, -0.706892, 0, 1, 0.9803922, 1,
0.03714429, 1.043487, -1.315709, 0, 1, 0.9882353, 1,
0.04498081, 0.2566091, 0.09858156, 0, 1, 0.9921569, 1,
0.0466589, -0.3354295, 3.085117, 0, 1, 1, 1,
0.04748334, 0.3750334, 0.816842, 0, 0.9921569, 1, 1,
0.05354046, -1.465427, 3.780735, 0, 0.9882353, 1, 1,
0.05388593, -0.920294, 4.118053, 0, 0.9803922, 1, 1,
0.05451028, 1.888063, 0.6044535, 0, 0.9764706, 1, 1,
0.05551483, -0.9673818, 2.121039, 0, 0.9686275, 1, 1,
0.06504144, 0.1805093, -0.2254848, 0, 0.9647059, 1, 1,
0.06717686, -0.3829092, 3.77269, 0, 0.9568627, 1, 1,
0.0674521, 0.04036551, 0.1682565, 0, 0.9529412, 1, 1,
0.07114808, 0.3540922, 0.07103746, 0, 0.945098, 1, 1,
0.07200357, 2.257166, 0.423202, 0, 0.9411765, 1, 1,
0.0739397, -0.8582324, 2.853291, 0, 0.9333333, 1, 1,
0.07428216, 1.167568, -1.161501, 0, 0.9294118, 1, 1,
0.07658368, 0.8352147, 0.551743, 0, 0.9215686, 1, 1,
0.07773601, 1.513575, 0.5635616, 0, 0.9176471, 1, 1,
0.08096853, 1.07086, 0.4806213, 0, 0.9098039, 1, 1,
0.08136097, -0.291834, 2.526924, 0, 0.9058824, 1, 1,
0.09301853, -0.4794106, 3.38335, 0, 0.8980392, 1, 1,
0.09334797, -0.2653265, 2.82628, 0, 0.8901961, 1, 1,
0.09655203, -0.727301, 3.463029, 0, 0.8862745, 1, 1,
0.1034138, -1.08458, 3.011853, 0, 0.8784314, 1, 1,
0.1060188, -0.2201256, 2.80485, 0, 0.8745098, 1, 1,
0.1094396, 0.2669224, 1.215728, 0, 0.8666667, 1, 1,
0.1098073, 2.369467, -0.855158, 0, 0.8627451, 1, 1,
0.1101819, 2.077856, -1.229734, 0, 0.854902, 1, 1,
0.1104153, 0.1486982, -0.1214199, 0, 0.8509804, 1, 1,
0.1121467, -1.159332, 2.210205, 0, 0.8431373, 1, 1,
0.1156533, 1.122675, -0.9935514, 0, 0.8392157, 1, 1,
0.1158941, -0.3071925, 3.512275, 0, 0.8313726, 1, 1,
0.1160648, 0.2079275, -0.1349533, 0, 0.827451, 1, 1,
0.1163165, -0.6026383, 4.964335, 0, 0.8196079, 1, 1,
0.1193258, -0.4821562, 2.713985, 0, 0.8156863, 1, 1,
0.1229058, -0.5448549, 3.803061, 0, 0.8078431, 1, 1,
0.1285695, 1.287894, -1.903361, 0, 0.8039216, 1, 1,
0.1300156, 0.05951256, 2.649646, 0, 0.7960784, 1, 1,
0.1321087, -0.6432348, 4.854776, 0, 0.7882353, 1, 1,
0.1332608, -1.095803, 3.930954, 0, 0.7843137, 1, 1,
0.1395468, 0.7006931, -0.5573669, 0, 0.7764706, 1, 1,
0.1448191, 0.6131843, -0.1347639, 0, 0.772549, 1, 1,
0.1472563, -0.764402, 1.758216, 0, 0.7647059, 1, 1,
0.1493193, 1.320093, 0.9392858, 0, 0.7607843, 1, 1,
0.1576479, -0.4669307, 3.124113, 0, 0.7529412, 1, 1,
0.1583622, 0.9018607, 0.7289374, 0, 0.7490196, 1, 1,
0.1598362, -0.8522161, 2.285371, 0, 0.7411765, 1, 1,
0.1603161, 0.7977703, -1.095894, 0, 0.7372549, 1, 1,
0.1605244, 0.1858082, -0.1996401, 0, 0.7294118, 1, 1,
0.1614197, 1.475328, 0.2637586, 0, 0.7254902, 1, 1,
0.1649043, 1.766767, -0.811201, 0, 0.7176471, 1, 1,
0.1727795, 0.3453203, 1.441041, 0, 0.7137255, 1, 1,
0.1823753, -0.09553459, 0.5794984, 0, 0.7058824, 1, 1,
0.1829443, -0.496204, 1.866526, 0, 0.6980392, 1, 1,
0.1876142, -1.747079, 4.942855, 0, 0.6941177, 1, 1,
0.1887447, -0.1847641, 2.923111, 0, 0.6862745, 1, 1,
0.1914526, 0.1578062, 0.7211178, 0, 0.682353, 1, 1,
0.1935409, 0.3901019, 1.427407, 0, 0.6745098, 1, 1,
0.1975592, 1.066036, -0.4225547, 0, 0.6705883, 1, 1,
0.1977069, -0.4541738, 2.40027, 0, 0.6627451, 1, 1,
0.2039353, -0.3287368, 2.222856, 0, 0.6588235, 1, 1,
0.2063508, -0.0541574, 3.193897, 0, 0.6509804, 1, 1,
0.207936, 0.643003, -0.01609027, 0, 0.6470588, 1, 1,
0.210052, 0.7608722, -0.3956312, 0, 0.6392157, 1, 1,
0.2108861, 1.179869, -0.09619749, 0, 0.6352941, 1, 1,
0.2124132, -0.1789684, 1.235139, 0, 0.627451, 1, 1,
0.2195166, -0.5613722, 3.402582, 0, 0.6235294, 1, 1,
0.2245825, -0.07641395, 2.479388, 0, 0.6156863, 1, 1,
0.2272183, -0.5454751, 2.892845, 0, 0.6117647, 1, 1,
0.2319395, 0.4963371, -1.102117, 0, 0.6039216, 1, 1,
0.2320081, 0.0114853, 0.06845348, 0, 0.5960785, 1, 1,
0.2321524, 0.3227516, 1.578645, 0, 0.5921569, 1, 1,
0.2366862, 1.730381, 0.06318667, 0, 0.5843138, 1, 1,
0.240769, 1.361843, 2.380094, 0, 0.5803922, 1, 1,
0.2471531, 0.6251435, 1.309025, 0, 0.572549, 1, 1,
0.2472655, 0.0195202, 2.591658, 0, 0.5686275, 1, 1,
0.2494036, 0.5723552, -0.403354, 0, 0.5607843, 1, 1,
0.2497248, -0.2805953, 2.771857, 0, 0.5568628, 1, 1,
0.2545298, -0.8944472, 3.329972, 0, 0.5490196, 1, 1,
0.255968, 0.07134203, 1.544809, 0, 0.5450981, 1, 1,
0.2578378, -0.2608175, 4.028522, 0, 0.5372549, 1, 1,
0.2639868, -1.72824, 5.401155, 0, 0.5333334, 1, 1,
0.2670355, -1.956854, 2.585901, 0, 0.5254902, 1, 1,
0.2672529, 0.4437296, -0.008742198, 0, 0.5215687, 1, 1,
0.2679943, 0.5259997, 1.954376, 0, 0.5137255, 1, 1,
0.2721712, 1.058864, 0.5411737, 0, 0.509804, 1, 1,
0.2771349, -0.8297135, 1.775049, 0, 0.5019608, 1, 1,
0.2785691, -0.743885, 4.4241, 0, 0.4941176, 1, 1,
0.2790776, 1.016906, -0.7503155, 0, 0.4901961, 1, 1,
0.2825724, -0.153934, 1.373968, 0, 0.4823529, 1, 1,
0.2838567, 0.441183, 1.289506, 0, 0.4784314, 1, 1,
0.2872655, 0.6556772, 0.7498047, 0, 0.4705882, 1, 1,
0.2904834, 0.1587124, 0.3422658, 0, 0.4666667, 1, 1,
0.2946827, -0.7679819, 1.745115, 0, 0.4588235, 1, 1,
0.295353, -0.1357554, 1.307026, 0, 0.454902, 1, 1,
0.2954866, 1.197855, -0.6763753, 0, 0.4470588, 1, 1,
0.3005937, -0.9551672, 1.079389, 0, 0.4431373, 1, 1,
0.3031088, -0.3776684, 3.651097, 0, 0.4352941, 1, 1,
0.3078485, 0.09066182, 0.9497135, 0, 0.4313726, 1, 1,
0.308905, 0.09021827, 3.389148, 0, 0.4235294, 1, 1,
0.3090793, -0.7983866, 2.978602, 0, 0.4196078, 1, 1,
0.3115623, 0.02401217, 2.216176, 0, 0.4117647, 1, 1,
0.3132327, 0.3253596, 2.458484, 0, 0.4078431, 1, 1,
0.3154352, -0.8141958, 1.705841, 0, 0.4, 1, 1,
0.3156275, 1.608209, -0.8965321, 0, 0.3921569, 1, 1,
0.3165619, 0.9845167, -1.264832, 0, 0.3882353, 1, 1,
0.3178034, -0.3094129, 1.578758, 0, 0.3803922, 1, 1,
0.3201363, -0.2543859, 2.853714, 0, 0.3764706, 1, 1,
0.3231046, 1.187313, -1.718071, 0, 0.3686275, 1, 1,
0.3240386, 0.1247898, 1.449837, 0, 0.3647059, 1, 1,
0.3266751, -0.7791713, 3.226191, 0, 0.3568628, 1, 1,
0.327372, -0.8692215, 2.448559, 0, 0.3529412, 1, 1,
0.3297227, 1.11923, 0.8568319, 0, 0.345098, 1, 1,
0.3309005, -0.6276199, 3.045224, 0, 0.3411765, 1, 1,
0.3312913, -0.3761091, 1.894474, 0, 0.3333333, 1, 1,
0.3334183, 2.198117, 0.8152478, 0, 0.3294118, 1, 1,
0.3350294, 0.500755, 0.8740751, 0, 0.3215686, 1, 1,
0.3425092, -0.7556949, 2.546705, 0, 0.3176471, 1, 1,
0.3429983, -0.3124422, 0.2868492, 0, 0.3098039, 1, 1,
0.3431476, -2.136722, 3.361744, 0, 0.3058824, 1, 1,
0.3441193, -0.7420526, 2.411108, 0, 0.2980392, 1, 1,
0.3469364, -0.5725246, 2.997195, 0, 0.2901961, 1, 1,
0.3489701, -1.179381, 3.275276, 0, 0.2862745, 1, 1,
0.3496419, -0.7578038, 3.203095, 0, 0.2784314, 1, 1,
0.3499906, -0.6619528, 2.617688, 0, 0.2745098, 1, 1,
0.3535384, -0.09308609, 1.628959, 0, 0.2666667, 1, 1,
0.3538421, 1.198095, 0.2235015, 0, 0.2627451, 1, 1,
0.3575217, -1.008076, 2.448706, 0, 0.254902, 1, 1,
0.3646973, -0.296113, 3.50029, 0, 0.2509804, 1, 1,
0.3650116, -0.3114634, 1.475163, 0, 0.2431373, 1, 1,
0.3692222, -0.15554, 2.130547, 0, 0.2392157, 1, 1,
0.3697125, 0.2187071, 0.8357006, 0, 0.2313726, 1, 1,
0.3723213, -0.08043253, 2.289307, 0, 0.227451, 1, 1,
0.3726495, -0.4537376, 1.610549, 0, 0.2196078, 1, 1,
0.3732046, 0.08985869, 1.610901, 0, 0.2156863, 1, 1,
0.3756698, 0.3782535, 0.9991868, 0, 0.2078431, 1, 1,
0.3757966, -0.7640363, 0.7413604, 0, 0.2039216, 1, 1,
0.3758408, 0.727511, 0.6719467, 0, 0.1960784, 1, 1,
0.3783813, -0.9397563, 1.200153, 0, 0.1882353, 1, 1,
0.3789629, 0.4906858, -0.8139369, 0, 0.1843137, 1, 1,
0.3844683, 0.004050016, 1.250312, 0, 0.1764706, 1, 1,
0.3846208, 0.6774141, 1.618844, 0, 0.172549, 1, 1,
0.3875569, -2.180026, 2.654495, 0, 0.1647059, 1, 1,
0.3882781, 0.1404915, -0.5188791, 0, 0.1607843, 1, 1,
0.3884322, -1.261778, 1.888437, 0, 0.1529412, 1, 1,
0.3891377, -0.1768054, 2.283114, 0, 0.1490196, 1, 1,
0.3919558, -0.3388642, 2.109195, 0, 0.1411765, 1, 1,
0.3958189, -0.8300902, 5.060346, 0, 0.1372549, 1, 1,
0.3962908, 0.2823564, 0.39017, 0, 0.1294118, 1, 1,
0.3963782, 0.3573971, 0.7401975, 0, 0.1254902, 1, 1,
0.3970343, -1.931998, 3.300941, 0, 0.1176471, 1, 1,
0.3976716, -0.5243394, 2.390675, 0, 0.1137255, 1, 1,
0.3998258, 1.536913, -0.6115945, 0, 0.1058824, 1, 1,
0.4006658, -0.5817298, 4.400873, 0, 0.09803922, 1, 1,
0.4026389, 0.9020291, 0.1174182, 0, 0.09411765, 1, 1,
0.4033952, -0.5238497, 2.78604, 0, 0.08627451, 1, 1,
0.4043468, 0.5762737, 2.053922, 0, 0.08235294, 1, 1,
0.4045381, 1.697834, -1.571326, 0, 0.07450981, 1, 1,
0.4055759, 1.569725, 0.2780135, 0, 0.07058824, 1, 1,
0.4068069, -1.215973, 4.553792, 0, 0.0627451, 1, 1,
0.4068456, -1.240007, 2.372509, 0, 0.05882353, 1, 1,
0.408379, -0.267655, 2.307789, 0, 0.05098039, 1, 1,
0.4098228, 1.643275, 0.3595224, 0, 0.04705882, 1, 1,
0.4112038, -0.5266392, 2.124915, 0, 0.03921569, 1, 1,
0.411221, 0.04111965, 1.724402, 0, 0.03529412, 1, 1,
0.4140022, 1.51608, -0.4205786, 0, 0.02745098, 1, 1,
0.4162666, -0.5699883, 4.072894, 0, 0.02352941, 1, 1,
0.4196287, -1.218566, 2.200069, 0, 0.01568628, 1, 1,
0.4201375, 0.0309109, 1.835267, 0, 0.01176471, 1, 1,
0.4231751, -0.2460562, 3.514449, 0, 0.003921569, 1, 1,
0.4275799, 0.07630294, 0.7903828, 0.003921569, 0, 1, 1,
0.4298977, -0.3581472, 1.862649, 0.007843138, 0, 1, 1,
0.4344858, 2.189129, 0.582179, 0.01568628, 0, 1, 1,
0.4375787, -0.7707106, 3.331861, 0.01960784, 0, 1, 1,
0.4384994, -0.1719251, 5.021973, 0.02745098, 0, 1, 1,
0.4403864, 0.1048793, 1.646896, 0.03137255, 0, 1, 1,
0.4438517, -0.5539114, 2.28328, 0.03921569, 0, 1, 1,
0.4599789, -0.7246599, 2.409529, 0.04313726, 0, 1, 1,
0.4608191, 0.1339064, 1.795878, 0.05098039, 0, 1, 1,
0.4627428, -0.8830172, 4.062987, 0.05490196, 0, 1, 1,
0.4638512, 0.0420157, 3.273742, 0.0627451, 0, 1, 1,
0.4639142, 1.226715, -0.7785362, 0.06666667, 0, 1, 1,
0.4690096, -0.01747075, 3.000555, 0.07450981, 0, 1, 1,
0.4714866, -0.2274659, 2.280586, 0.07843138, 0, 1, 1,
0.4716597, 0.6701599, 1.643214, 0.08627451, 0, 1, 1,
0.4746397, -1.984972, 2.531329, 0.09019608, 0, 1, 1,
0.4836811, 0.4263012, 0.6846176, 0.09803922, 0, 1, 1,
0.4863704, 0.1335615, 2.359833, 0.1058824, 0, 1, 1,
0.4876466, 2.801252, 1.983841, 0.1098039, 0, 1, 1,
0.4882826, -0.401404, 3.570879, 0.1176471, 0, 1, 1,
0.4964795, -1.077914, 2.739841, 0.1215686, 0, 1, 1,
0.5001615, 0.9777032, -0.1058618, 0.1294118, 0, 1, 1,
0.5018178, -0.1185413, 1.927485, 0.1333333, 0, 1, 1,
0.5070857, -0.5947641, 2.315315, 0.1411765, 0, 1, 1,
0.5142819, -0.04352974, -0.9337276, 0.145098, 0, 1, 1,
0.51761, -1.186922, 3.172735, 0.1529412, 0, 1, 1,
0.5180026, -0.5618417, 1.264642, 0.1568628, 0, 1, 1,
0.5194021, -0.7088969, 2.901898, 0.1647059, 0, 1, 1,
0.5259059, -1.49528, 1.76827, 0.1686275, 0, 1, 1,
0.5266558, -1.342769, 3.686385, 0.1764706, 0, 1, 1,
0.5276617, -1.311131, 2.410894, 0.1803922, 0, 1, 1,
0.5320936, -0.7158553, 3.533318, 0.1882353, 0, 1, 1,
0.532869, 0.1084012, -0.3370791, 0.1921569, 0, 1, 1,
0.5330226, -0.9412385, 3.653802, 0.2, 0, 1, 1,
0.5353389, -0.1264231, 0.5086616, 0.2078431, 0, 1, 1,
0.5381786, 1.145432, 1.125925, 0.2117647, 0, 1, 1,
0.5389957, 0.2783187, -1.114266, 0.2196078, 0, 1, 1,
0.5408458, -0.3921987, 1.236663, 0.2235294, 0, 1, 1,
0.5461833, 1.135101, 0.5423777, 0.2313726, 0, 1, 1,
0.5462904, -0.1219174, -0.04081805, 0.2352941, 0, 1, 1,
0.5472993, -1.502299, 2.808356, 0.2431373, 0, 1, 1,
0.549056, -0.2267696, 2.180023, 0.2470588, 0, 1, 1,
0.5511469, -0.8242542, 2.737887, 0.254902, 0, 1, 1,
0.5551695, -0.006300685, 3.71746, 0.2588235, 0, 1, 1,
0.558527, 0.8117236, 0.1074217, 0.2666667, 0, 1, 1,
0.560519, 0.238405, 2.400088, 0.2705882, 0, 1, 1,
0.5612862, 1.682293, 0.3109097, 0.2784314, 0, 1, 1,
0.5691013, 0.9128958, -0.4417917, 0.282353, 0, 1, 1,
0.5707754, -0.2029297, 2.538663, 0.2901961, 0, 1, 1,
0.5758095, 0.1682687, 1.763625, 0.2941177, 0, 1, 1,
0.5795028, 0.4339496, 0.3815947, 0.3019608, 0, 1, 1,
0.5825123, -0.2529613, 4.759686, 0.3098039, 0, 1, 1,
0.5850977, -0.0007366833, 1.873637, 0.3137255, 0, 1, 1,
0.5856493, 0.06747919, 1.593859, 0.3215686, 0, 1, 1,
0.5927572, -0.4540342, 1.331702, 0.3254902, 0, 1, 1,
0.5950954, -1.180834, 2.352446, 0.3333333, 0, 1, 1,
0.5956546, -0.08866747, 0.006313133, 0.3372549, 0, 1, 1,
0.6001042, -0.8432815, 1.275929, 0.345098, 0, 1, 1,
0.6042466, 1.210639, 0.2815644, 0.3490196, 0, 1, 1,
0.6047736, -0.5884208, 0.5736544, 0.3568628, 0, 1, 1,
0.6050375, -0.04828991, 0.8379949, 0.3607843, 0, 1, 1,
0.609023, -0.1391892, 1.611088, 0.3686275, 0, 1, 1,
0.6090854, 0.6166019, -0.142209, 0.372549, 0, 1, 1,
0.6181392, 0.6510189, 2.14141, 0.3803922, 0, 1, 1,
0.6269611, 1.500291, 0.9688124, 0.3843137, 0, 1, 1,
0.6386157, 0.4136358, 1.122282, 0.3921569, 0, 1, 1,
0.6403055, 0.1604572, 0.7233573, 0.3960784, 0, 1, 1,
0.6432942, -0.9973382, 1.241268, 0.4039216, 0, 1, 1,
0.6437752, 0.3617143, 0.2858701, 0.4117647, 0, 1, 1,
0.644529, -0.3844201, 2.851309, 0.4156863, 0, 1, 1,
0.6483148, -0.5905216, 2.786553, 0.4235294, 0, 1, 1,
0.6500929, -0.4375604, -0.7950497, 0.427451, 0, 1, 1,
0.6555853, -0.226104, 1.717004, 0.4352941, 0, 1, 1,
0.6559579, -0.7800821, 4.449467, 0.4392157, 0, 1, 1,
0.6639245, 3.437803, -0.2587763, 0.4470588, 0, 1, 1,
0.6664717, -1.007283, 1.989272, 0.4509804, 0, 1, 1,
0.6721845, 1.616458, -0.7986941, 0.4588235, 0, 1, 1,
0.6796182, 0.4091307, 1.18114, 0.4627451, 0, 1, 1,
0.6828451, -1.087363, 3.809283, 0.4705882, 0, 1, 1,
0.6926551, -0.1989601, 0.5466173, 0.4745098, 0, 1, 1,
0.6927971, -0.1456639, -0.298967, 0.4823529, 0, 1, 1,
0.6929095, -1.245749, 0.7459549, 0.4862745, 0, 1, 1,
0.6982694, 0.3474171, 1.823235, 0.4941176, 0, 1, 1,
0.6985564, -0.7537132, 2.821059, 0.5019608, 0, 1, 1,
0.6990717, 1.339684, -1.218264, 0.5058824, 0, 1, 1,
0.7088744, -0.7822476, 3.336388, 0.5137255, 0, 1, 1,
0.7102062, -0.4215145, 3.007463, 0.5176471, 0, 1, 1,
0.7115511, 2.740983, 1.906273, 0.5254902, 0, 1, 1,
0.7123743, -0.2215214, 0.6792557, 0.5294118, 0, 1, 1,
0.7129962, 0.2245048, 2.162, 0.5372549, 0, 1, 1,
0.7139447, 1.441434, 1.246381, 0.5411765, 0, 1, 1,
0.7248489, 0.5700339, 1.595633, 0.5490196, 0, 1, 1,
0.7268146, 0.04346717, 2.238284, 0.5529412, 0, 1, 1,
0.7276247, -0.1842807, 1.656596, 0.5607843, 0, 1, 1,
0.7306044, -0.3183503, 3.318614, 0.5647059, 0, 1, 1,
0.7312806, -0.4062774, 1.832531, 0.572549, 0, 1, 1,
0.7358518, -0.637549, 3.31745, 0.5764706, 0, 1, 1,
0.7384495, 1.02863, 1.858804, 0.5843138, 0, 1, 1,
0.7415882, 0.9063756, 0.3420766, 0.5882353, 0, 1, 1,
0.7433041, 0.3702007, 0.09091283, 0.5960785, 0, 1, 1,
0.7463298, 0.08987894, 1.238657, 0.6039216, 0, 1, 1,
0.7486736, 1.001996, 2.366306, 0.6078432, 0, 1, 1,
0.7615527, -0.9476284, 2.903883, 0.6156863, 0, 1, 1,
0.7632353, 0.3419548, 1.196357, 0.6196079, 0, 1, 1,
0.7635838, -0.2783608, 2.336728, 0.627451, 0, 1, 1,
0.7638366, 0.8062275, 1.089244, 0.6313726, 0, 1, 1,
0.7659519, -0.6060227, 1.168164, 0.6392157, 0, 1, 1,
0.7690074, 1.97669, 1.838864, 0.6431373, 0, 1, 1,
0.7717298, -0.1915546, 0.5654284, 0.6509804, 0, 1, 1,
0.7755783, -0.2797064, 1.071848, 0.654902, 0, 1, 1,
0.7770788, -0.7876006, 2.48293, 0.6627451, 0, 1, 1,
0.7806224, -1.069062, 1.068015, 0.6666667, 0, 1, 1,
0.7819409, 1.04674, 0.1933105, 0.6745098, 0, 1, 1,
0.7821336, -0.5472915, 1.605585, 0.6784314, 0, 1, 1,
0.7845424, 1.049239, 0.6078672, 0.6862745, 0, 1, 1,
0.7849422, -2.326559, 3.059119, 0.6901961, 0, 1, 1,
0.7890919, -1.807064, 3.222769, 0.6980392, 0, 1, 1,
0.792169, -1.069318, 2.833797, 0.7058824, 0, 1, 1,
0.8024804, -0.7150194, 0.1532071, 0.7098039, 0, 1, 1,
0.8106673, -0.01786002, 3.071991, 0.7176471, 0, 1, 1,
0.8108879, -1.416309, 2.244821, 0.7215686, 0, 1, 1,
0.8159589, 1.161395, 2.011119, 0.7294118, 0, 1, 1,
0.8165463, -0.4678205, 1.656726, 0.7333333, 0, 1, 1,
0.827502, 0.4279272, 1.05699, 0.7411765, 0, 1, 1,
0.8304429, -2.533304, 2.665754, 0.7450981, 0, 1, 1,
0.8313227, 0.05444486, 2.488383, 0.7529412, 0, 1, 1,
0.8362421, -0.5747103, 3.48888, 0.7568628, 0, 1, 1,
0.8434018, 0.1821525, 1.605794, 0.7647059, 0, 1, 1,
0.8444328, -0.4537549, 0.6425582, 0.7686275, 0, 1, 1,
0.846231, -0.4787941, 1.322858, 0.7764706, 0, 1, 1,
0.8463416, -0.5451941, 1.361401, 0.7803922, 0, 1, 1,
0.84712, 0.3233224, 0.09533247, 0.7882353, 0, 1, 1,
0.852607, 0.0499618, 2.283306, 0.7921569, 0, 1, 1,
0.8549076, 0.6845387, 0.2436789, 0.8, 0, 1, 1,
0.8572537, -1.247252, 3.526096, 0.8078431, 0, 1, 1,
0.8593679, -0.7515073, 0.7018442, 0.8117647, 0, 1, 1,
0.8690568, -0.6283073, 1.049402, 0.8196079, 0, 1, 1,
0.873551, 0.7686826, 0.7027677, 0.8235294, 0, 1, 1,
0.8782145, -0.9863582, 2.775752, 0.8313726, 0, 1, 1,
0.8792735, -0.2107703, 3.509159, 0.8352941, 0, 1, 1,
0.8809353, 1.718105, 0.3197423, 0.8431373, 0, 1, 1,
0.8815241, 1.331207, 1.691117, 0.8470588, 0, 1, 1,
0.8876019, -1.336879, 2.940354, 0.854902, 0, 1, 1,
0.8879537, -1.261552, 2.90428, 0.8588235, 0, 1, 1,
0.9056925, -0.7666093, 2.948331, 0.8666667, 0, 1, 1,
0.9162784, -1.028238, 3.559387, 0.8705882, 0, 1, 1,
0.9222899, -0.9437989, 4.246421, 0.8784314, 0, 1, 1,
0.923661, 0.6383767, 1.118023, 0.8823529, 0, 1, 1,
0.9312199, -0.2196414, -0.7758089, 0.8901961, 0, 1, 1,
0.9341382, 1.207447, -0.4092603, 0.8941177, 0, 1, 1,
0.9355327, -2.254, 3.867813, 0.9019608, 0, 1, 1,
0.9367766, 0.3045573, 1.472358, 0.9098039, 0, 1, 1,
0.9378049, -0.005862963, 1.54015, 0.9137255, 0, 1, 1,
0.9473116, 0.2151549, 3.132181, 0.9215686, 0, 1, 1,
0.9780363, -0.5960712, 2.977339, 0.9254902, 0, 1, 1,
0.9821681, 1.503031, -0.3693895, 0.9333333, 0, 1, 1,
0.991208, -0.4718491, 3.191753, 0.9372549, 0, 1, 1,
1.008086, -0.08011238, 2.108204, 0.945098, 0, 1, 1,
1.011264, -0.9315933, 3.163471, 0.9490196, 0, 1, 1,
1.013269, -0.3701551, 2.352262, 0.9568627, 0, 1, 1,
1.01652, 0.3891437, 2.055817, 0.9607843, 0, 1, 1,
1.019611, 0.9129754, 0.8155746, 0.9686275, 0, 1, 1,
1.020427, 0.8697903, 0.1352658, 0.972549, 0, 1, 1,
1.021941, 0.5544029, 1.093635, 0.9803922, 0, 1, 1,
1.023415, -0.03305378, 2.887087, 0.9843137, 0, 1, 1,
1.026751, 0.08066826, 0.5245342, 0.9921569, 0, 1, 1,
1.02692, 0.3344876, 0.8543062, 0.9960784, 0, 1, 1,
1.044178, -1.359921, 1.434782, 1, 0, 0.9960784, 1,
1.05935, -0.350977, 2.328249, 1, 0, 0.9882353, 1,
1.068887, 0.2479396, 1.563182, 1, 0, 0.9843137, 1,
1.069637, -1.537992, 2.77753, 1, 0, 0.9764706, 1,
1.069961, -0.9529729, 1.842194, 1, 0, 0.972549, 1,
1.072464, 0.9021544, -0.450712, 1, 0, 0.9647059, 1,
1.075099, 0.3004402, 0.6909952, 1, 0, 0.9607843, 1,
1.078658, 0.6665484, 0.8697724, 1, 0, 0.9529412, 1,
1.086388, 0.7051897, 1.452332, 1, 0, 0.9490196, 1,
1.090789, 1.69638, 0.6523989, 1, 0, 0.9411765, 1,
1.09509, -0.6200368, 2.288877, 1, 0, 0.9372549, 1,
1.115621, 1.201456, 0.2785465, 1, 0, 0.9294118, 1,
1.118067, -1.692909, 1.89567, 1, 0, 0.9254902, 1,
1.123388, 0.3962288, 1.99971, 1, 0, 0.9176471, 1,
1.128298, 0.3966789, 1.928851, 1, 0, 0.9137255, 1,
1.131147, 1.050219, -0.1992732, 1, 0, 0.9058824, 1,
1.13351, 1.342522, 1.977988, 1, 0, 0.9019608, 1,
1.137992, -0.6900927, 2.052362, 1, 0, 0.8941177, 1,
1.138011, 0.01443922, 3.044141, 1, 0, 0.8862745, 1,
1.138349, 0.2475044, 0.8876315, 1, 0, 0.8823529, 1,
1.138436, -0.6767215, 2.180032, 1, 0, 0.8745098, 1,
1.139569, -0.3989998, -0.3760813, 1, 0, 0.8705882, 1,
1.143336, -0.4426512, 1.691224, 1, 0, 0.8627451, 1,
1.155539, 1.38698, 0.7826124, 1, 0, 0.8588235, 1,
1.155968, -0.2445759, 0.6006349, 1, 0, 0.8509804, 1,
1.157377, -0.361554, 2.791003, 1, 0, 0.8470588, 1,
1.159338, -0.5863971, 1.25483, 1, 0, 0.8392157, 1,
1.173668, 0.3114304, 0.1680065, 1, 0, 0.8352941, 1,
1.1743, -0.1842709, 2.698801, 1, 0, 0.827451, 1,
1.185863, 1.609388, -0.3559305, 1, 0, 0.8235294, 1,
1.195642, -0.2740275, -0.5392342, 1, 0, 0.8156863, 1,
1.199548, 0.4174302, 1.801073, 1, 0, 0.8117647, 1,
1.213651, -0.5858819, 0.9371542, 1, 0, 0.8039216, 1,
1.214086, 0.8430453, 3.54089, 1, 0, 0.7960784, 1,
1.215898, 0.09136358, 0.9975667, 1, 0, 0.7921569, 1,
1.23235, 1.238344, 1.356994, 1, 0, 0.7843137, 1,
1.235831, 0.4977462, 2.811049, 1, 0, 0.7803922, 1,
1.236858, -1.000103, 2.681273, 1, 0, 0.772549, 1,
1.242989, -1.391207, 2.844971, 1, 0, 0.7686275, 1,
1.245145, 0.6152743, -0.1437427, 1, 0, 0.7607843, 1,
1.250355, 1.048027, 0.6570975, 1, 0, 0.7568628, 1,
1.251599, 0.1473172, 1.482506, 1, 0, 0.7490196, 1,
1.253993, -0.5181265, 1.842831, 1, 0, 0.7450981, 1,
1.257332, -0.7152165, 1.251883, 1, 0, 0.7372549, 1,
1.258867, -0.146872, 0.9771065, 1, 0, 0.7333333, 1,
1.261514, 0.711946, 1.73828, 1, 0, 0.7254902, 1,
1.263114, -0.5587041, 1.90414, 1, 0, 0.7215686, 1,
1.28, 0.8940809, 0.2460924, 1, 0, 0.7137255, 1,
1.28158, -0.3937726, 2.859399, 1, 0, 0.7098039, 1,
1.294258, 0.9431347, 0.2897792, 1, 0, 0.7019608, 1,
1.296846, -0.02486651, 0.6674887, 1, 0, 0.6941177, 1,
1.301152, -0.2644926, 2.563935, 1, 0, 0.6901961, 1,
1.30191, -0.7909462, 0.7256737, 1, 0, 0.682353, 1,
1.309185, 1.489528, 1.032013, 1, 0, 0.6784314, 1,
1.31631, -0.6374747, 2.319137, 1, 0, 0.6705883, 1,
1.31664, -0.4837237, 2.274229, 1, 0, 0.6666667, 1,
1.319089, 0.2254889, 1.493354, 1, 0, 0.6588235, 1,
1.322113, -0.3390673, 2.12954, 1, 0, 0.654902, 1,
1.325765, 0.123364, 3.598389, 1, 0, 0.6470588, 1,
1.326299, -0.1044614, 1.69661, 1, 0, 0.6431373, 1,
1.332395, -1.206529, 2.671038, 1, 0, 0.6352941, 1,
1.3335, 0.4239855, 3.053782, 1, 0, 0.6313726, 1,
1.335372, 0.3736716, 2.599661, 1, 0, 0.6235294, 1,
1.335661, 1.025533, 1.294358, 1, 0, 0.6196079, 1,
1.345507, -1.37784, 3.037177, 1, 0, 0.6117647, 1,
1.351444, 1.434261, -0.05744094, 1, 0, 0.6078432, 1,
1.351458, -1.139298, 1.515811, 1, 0, 0.6, 1,
1.359202, -0.7064358, 1.539903, 1, 0, 0.5921569, 1,
1.370109, -2.871047, 3.583905, 1, 0, 0.5882353, 1,
1.370359, 1.094005, -0.266671, 1, 0, 0.5803922, 1,
1.371749, -0.3385586, 4.265671, 1, 0, 0.5764706, 1,
1.379435, 1.418705, -0.03672921, 1, 0, 0.5686275, 1,
1.388353, 1.434543, 1.48308, 1, 0, 0.5647059, 1,
1.401007, -0.1881757, 1.309887, 1, 0, 0.5568628, 1,
1.401014, 0.7529551, 0.3363697, 1, 0, 0.5529412, 1,
1.405573, -0.2033578, 2.392336, 1, 0, 0.5450981, 1,
1.409559, 0.258952, -0.8929865, 1, 0, 0.5411765, 1,
1.410467, -0.7681918, 1.735759, 1, 0, 0.5333334, 1,
1.421816, -1.631472, 2.890592, 1, 0, 0.5294118, 1,
1.42867, 0.4615724, 1.914246, 1, 0, 0.5215687, 1,
1.431715, 0.5779334, -0.0477333, 1, 0, 0.5176471, 1,
1.453684, 1.131514, 1.575007, 1, 0, 0.509804, 1,
1.455566, 0.7493496, 1.59336, 1, 0, 0.5058824, 1,
1.462597, -0.387984, 0.6959221, 1, 0, 0.4980392, 1,
1.46642, 0.5157568, 1.526146, 1, 0, 0.4901961, 1,
1.468076, 0.2091983, 1.205995, 1, 0, 0.4862745, 1,
1.470364, 0.0406037, 1.99466, 1, 0, 0.4784314, 1,
1.470926, 1.197809, 0.09631931, 1, 0, 0.4745098, 1,
1.476903, 0.4966245, 2.881421, 1, 0, 0.4666667, 1,
1.485759, 0.6071945, 1.730275, 1, 0, 0.4627451, 1,
1.487009, 0.3139844, 2.195112, 1, 0, 0.454902, 1,
1.493369, 0.2559092, 0.1992657, 1, 0, 0.4509804, 1,
1.494482, -1.219808, 2.030498, 1, 0, 0.4431373, 1,
1.511854, 0.1835193, 2.447629, 1, 0, 0.4392157, 1,
1.517819, 0.8795491, 1.633188, 1, 0, 0.4313726, 1,
1.519074, -1.395341, 2.884425, 1, 0, 0.427451, 1,
1.524323, 1.220197, 0.8137901, 1, 0, 0.4196078, 1,
1.525469, -1.365298, 2.781801, 1, 0, 0.4156863, 1,
1.526798, -0.07111812, 3.884221, 1, 0, 0.4078431, 1,
1.531647, 0.7152367, 1.923114, 1, 0, 0.4039216, 1,
1.54576, 0.6800411, 1.061232, 1, 0, 0.3960784, 1,
1.546271, 0.1533258, -0.2832329, 1, 0, 0.3882353, 1,
1.546608, -1.175722, 1.547818, 1, 0, 0.3843137, 1,
1.552705, -2.478708, 2.782136, 1, 0, 0.3764706, 1,
1.555434, -0.6404624, 0.9796461, 1, 0, 0.372549, 1,
1.576345, 0.02595282, 1.988317, 1, 0, 0.3647059, 1,
1.577469, 1.77324, 0.4390889, 1, 0, 0.3607843, 1,
1.605624, 1.174202, -1.743713, 1, 0, 0.3529412, 1,
1.610259, -0.4446369, 2.08, 1, 0, 0.3490196, 1,
1.62585, -0.6491404, 1.330359, 1, 0, 0.3411765, 1,
1.646558, -0.1641435, 3.463307, 1, 0, 0.3372549, 1,
1.650579, -0.9087502, 4.080391, 1, 0, 0.3294118, 1,
1.658656, -0.4727017, 1.754567, 1, 0, 0.3254902, 1,
1.659876, -1.893613, 1.766378, 1, 0, 0.3176471, 1,
1.665012, 0.2922836, 2.827836, 1, 0, 0.3137255, 1,
1.682444, -1.879129, 1.058255, 1, 0, 0.3058824, 1,
1.683668, -0.03427996, 1.128949, 1, 0, 0.2980392, 1,
1.707592, -0.03256432, 1.65691, 1, 0, 0.2941177, 1,
1.709514, -1.044383, 2.041994, 1, 0, 0.2862745, 1,
1.742465, 1.672688, 1.635514, 1, 0, 0.282353, 1,
1.747235, -0.1525446, 0.963093, 1, 0, 0.2745098, 1,
1.749188, -0.3961933, 3.2906, 1, 0, 0.2705882, 1,
1.762621, 0.7808124, 0.5819388, 1, 0, 0.2627451, 1,
1.76967, -0.6524806, -1.287794, 1, 0, 0.2588235, 1,
1.773293, 0.6173452, 2.544063, 1, 0, 0.2509804, 1,
1.814694, -0.5008048, 0.1557419, 1, 0, 0.2470588, 1,
1.826452, 0.5678346, 0.8707086, 1, 0, 0.2392157, 1,
1.84571, -0.3125769, 2.030571, 1, 0, 0.2352941, 1,
1.85284, 0.6700605, 1.616612, 1, 0, 0.227451, 1,
1.871169, 1.457711, 1.802075, 1, 0, 0.2235294, 1,
1.876225, -0.6151612, 1.22665, 1, 0, 0.2156863, 1,
1.880455, -0.4620702, 1.659343, 1, 0, 0.2117647, 1,
1.885216, -0.03903372, 1.342149, 1, 0, 0.2039216, 1,
1.886455, -0.1333478, 2.439603, 1, 0, 0.1960784, 1,
1.902402, -0.00246947, 0.2505577, 1, 0, 0.1921569, 1,
1.916793, 1.144094, -0.07716314, 1, 0, 0.1843137, 1,
1.927768, 0.3282825, 1.513736, 1, 0, 0.1803922, 1,
1.949359, 0.3453645, 0.6226289, 1, 0, 0.172549, 1,
1.963182, -1.657446, 1.690572, 1, 0, 0.1686275, 1,
1.967567, -1.577969, 2.407513, 1, 0, 0.1607843, 1,
2.014489, 0.1135294, 1.049367, 1, 0, 0.1568628, 1,
2.029033, 0.1411674, 0.2242078, 1, 0, 0.1490196, 1,
2.048044, -1.144691, 0.8270209, 1, 0, 0.145098, 1,
2.058219, -0.01801173, 0.8498053, 1, 0, 0.1372549, 1,
2.100403, -1.710566, 2.411216, 1, 0, 0.1333333, 1,
2.104542, 0.5648791, 1.499889, 1, 0, 0.1254902, 1,
2.11317, 0.4534675, 1.65606, 1, 0, 0.1215686, 1,
2.153732, -0.8215305, 2.624765, 1, 0, 0.1137255, 1,
2.162764, 1.175695, 0.08070657, 1, 0, 0.1098039, 1,
2.182577, -0.2084328, 2.206683, 1, 0, 0.1019608, 1,
2.196302, -0.002693557, 0.6783937, 1, 0, 0.09411765, 1,
2.218336, -0.7338055, 0.5941107, 1, 0, 0.09019608, 1,
2.245246, -0.9428897, 3.023967, 1, 0, 0.08235294, 1,
2.277962, 0.038812, 2.306259, 1, 0, 0.07843138, 1,
2.292724, -0.1329935, 0.8786447, 1, 0, 0.07058824, 1,
2.383899, 1.003475, 0.4244897, 1, 0, 0.06666667, 1,
2.413496, -0.3834544, 2.131864, 1, 0, 0.05882353, 1,
2.52069, -0.7697877, 1.973557, 1, 0, 0.05490196, 1,
2.555548, -0.5160717, 1.181643, 1, 0, 0.04705882, 1,
2.593142, 0.5559056, 0.8084781, 1, 0, 0.04313726, 1,
2.663055, -0.5072181, 0.8460991, 1, 0, 0.03529412, 1,
2.668317, 0.2817215, 0.06306835, 1, 0, 0.03137255, 1,
2.726572, 0.3003703, 1.61068, 1, 0, 0.02352941, 1,
2.778301, 0.4738032, 3.316701, 1, 0, 0.01960784, 1,
2.971383, 0.4644243, 1.507234, 1, 0, 0.01176471, 1,
3.801562, -1.959547, 0.924663, 1, 0, 0.007843138, 1
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
0.1621304, -3.940397, -7.708043, 0, -0.5, 0.5, 0.5,
0.1621304, -3.940397, -7.708043, 1, -0.5, 0.5, 0.5,
0.1621304, -3.940397, -7.708043, 1, 1.5, 0.5, 0.5,
0.1621304, -3.940397, -7.708043, 0, 1.5, 0.5, 0.5
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
-4.711069, 0.2833781, -7.708043, 0, -0.5, 0.5, 0.5,
-4.711069, 0.2833781, -7.708043, 1, -0.5, 0.5, 0.5,
-4.711069, 0.2833781, -7.708043, 1, 1.5, 0.5, 0.5,
-4.711069, 0.2833781, -7.708043, 0, 1.5, 0.5, 0.5
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
-4.711069, -3.940397, -0.2034612, 0, -0.5, 0.5, 0.5,
-4.711069, -3.940397, -0.2034612, 1, -0.5, 0.5, 0.5,
-4.711069, -3.940397, -0.2034612, 1, 1.5, 0.5, 0.5,
-4.711069, -3.940397, -0.2034612, 0, 1.5, 0.5, 0.5
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
-2, -2.965679, -5.976216,
2, -2.965679, -5.976216,
-2, -2.965679, -5.976216,
-2, -3.128132, -6.264854,
0, -2.965679, -5.976216,
0, -3.128132, -6.264854,
2, -2.965679, -5.976216,
2, -3.128132, -6.264854
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
"0",
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
-2, -3.453038, -6.84213, 0, -0.5, 0.5, 0.5,
-2, -3.453038, -6.84213, 1, -0.5, 0.5, 0.5,
-2, -3.453038, -6.84213, 1, 1.5, 0.5, 0.5,
-2, -3.453038, -6.84213, 0, 1.5, 0.5, 0.5,
0, -3.453038, -6.84213, 0, -0.5, 0.5, 0.5,
0, -3.453038, -6.84213, 1, -0.5, 0.5, 0.5,
0, -3.453038, -6.84213, 1, 1.5, 0.5, 0.5,
0, -3.453038, -6.84213, 0, 1.5, 0.5, 0.5,
2, -3.453038, -6.84213, 0, -0.5, 0.5, 0.5,
2, -3.453038, -6.84213, 1, -0.5, 0.5, 0.5,
2, -3.453038, -6.84213, 1, 1.5, 0.5, 0.5,
2, -3.453038, -6.84213, 0, 1.5, 0.5, 0.5
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
-3.586484, -2, -5.976216,
-3.586484, 3, -5.976216,
-3.586484, -2, -5.976216,
-3.773915, -2, -6.264854,
-3.586484, -1, -5.976216,
-3.773915, -1, -6.264854,
-3.586484, 0, -5.976216,
-3.773915, 0, -6.264854,
-3.586484, 1, -5.976216,
-3.773915, 1, -6.264854,
-3.586484, 2, -5.976216,
-3.773915, 2, -6.264854,
-3.586484, 3, -5.976216,
-3.773915, 3, -6.264854
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
-4.148777, -2, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, -2, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, -2, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, -2, -6.84213, 0, 1.5, 0.5, 0.5,
-4.148777, -1, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, -1, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, -1, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, -1, -6.84213, 0, 1.5, 0.5, 0.5,
-4.148777, 0, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, 0, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, 0, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, 0, -6.84213, 0, 1.5, 0.5, 0.5,
-4.148777, 1, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, 1, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, 1, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, 1, -6.84213, 0, 1.5, 0.5, 0.5,
-4.148777, 2, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, 2, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, 2, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, 2, -6.84213, 0, 1.5, 0.5, 0.5,
-4.148777, 3, -6.84213, 0, -0.5, 0.5, 0.5,
-4.148777, 3, -6.84213, 1, -0.5, 0.5, 0.5,
-4.148777, 3, -6.84213, 1, 1.5, 0.5, 0.5,
-4.148777, 3, -6.84213, 0, 1.5, 0.5, 0.5
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
-3.586484, -2.965679, -4,
-3.586484, -2.965679, 4,
-3.586484, -2.965679, -4,
-3.773915, -3.128132, -4,
-3.586484, -2.965679, -2,
-3.773915, -3.128132, -2,
-3.586484, -2.965679, 0,
-3.773915, -3.128132, 0,
-3.586484, -2.965679, 2,
-3.773915, -3.128132, 2,
-3.586484, -2.965679, 4,
-3.773915, -3.128132, 4
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
-4.148777, -3.453038, -4, 0, -0.5, 0.5, 0.5,
-4.148777, -3.453038, -4, 1, -0.5, 0.5, 0.5,
-4.148777, -3.453038, -4, 1, 1.5, 0.5, 0.5,
-4.148777, -3.453038, -4, 0, 1.5, 0.5, 0.5,
-4.148777, -3.453038, -2, 0, -0.5, 0.5, 0.5,
-4.148777, -3.453038, -2, 1, -0.5, 0.5, 0.5,
-4.148777, -3.453038, -2, 1, 1.5, 0.5, 0.5,
-4.148777, -3.453038, -2, 0, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 0, 0, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 0, 1, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 0, 1, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 0, 0, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 2, 0, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 2, 1, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 2, 1, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 2, 0, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 4, 0, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 4, 1, -0.5, 0.5, 0.5,
-4.148777, -3.453038, 4, 1, 1.5, 0.5, 0.5,
-4.148777, -3.453038, 4, 0, 1.5, 0.5, 0.5
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
-3.586484, -2.965679, -5.976216,
-3.586484, 3.532435, -5.976216,
-3.586484, -2.965679, 5.569294,
-3.586484, 3.532435, 5.569294,
-3.586484, -2.965679, -5.976216,
-3.586484, -2.965679, 5.569294,
-3.586484, 3.532435, -5.976216,
-3.586484, 3.532435, 5.569294,
-3.586484, -2.965679, -5.976216,
3.910745, -2.965679, -5.976216,
-3.586484, -2.965679, 5.569294,
3.910745, -2.965679, 5.569294,
-3.586484, 3.532435, -5.976216,
3.910745, 3.532435, -5.976216,
-3.586484, 3.532435, 5.569294,
3.910745, 3.532435, 5.569294,
3.910745, -2.965679, -5.976216,
3.910745, 3.532435, -5.976216,
3.910745, -2.965679, 5.569294,
3.910745, 3.532435, 5.569294,
3.910745, -2.965679, -5.976216,
3.910745, -2.965679, 5.569294,
3.910745, 3.532435, -5.976216,
3.910745, 3.532435, 5.569294
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
var radius = 8.128664;
var distance = 36.16534;
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
mvMatrix.translate( -0.1621304, -0.2833781, 0.2034612 );
mvMatrix.scale( 1.172282, 1.352526, 0.7612371 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.16534);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


