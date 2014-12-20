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
-2.779275, 0.378496, -1.738304, 1, 0, 0, 1,
-2.752978, -0.1570643, -2.392297, 1, 0.007843138, 0, 1,
-2.61012, -0.6849871, -1.934878, 1, 0.01176471, 0, 1,
-2.576862, -0.04539412, -0.1898833, 1, 0.01960784, 0, 1,
-2.530978, 2.090183, 0.3091192, 1, 0.02352941, 0, 1,
-2.441839, 0.1529155, -1.272911, 1, 0.03137255, 0, 1,
-2.433942, 0.1428799, -1.779262, 1, 0.03529412, 0, 1,
-2.248266, -1.56076, -1.58936, 1, 0.04313726, 0, 1,
-2.241186, 0.2632484, -0.1021057, 1, 0.04705882, 0, 1,
-2.240813, -1.286508, -2.789342, 1, 0.05490196, 0, 1,
-2.196834, -0.858234, -1.412418, 1, 0.05882353, 0, 1,
-2.170573, 2.224784, 0.2204381, 1, 0.06666667, 0, 1,
-2.146613, -0.8065279, -1.453634, 1, 0.07058824, 0, 1,
-2.131751, 2.160363, -0.3889085, 1, 0.07843138, 0, 1,
-2.119268, 0.5728078, -1.761772, 1, 0.08235294, 0, 1,
-2.105352, 0.01432856, -1.372909, 1, 0.09019608, 0, 1,
-2.098177, -0.6218209, -2.663247, 1, 0.09411765, 0, 1,
-2.07799, 0.4058942, -0.7049431, 1, 0.1019608, 0, 1,
-2.022832, 0.9849568, -0.3321725, 1, 0.1098039, 0, 1,
-1.996733, 1.069659, 0.04530868, 1, 0.1137255, 0, 1,
-1.9931, 0.249734, -1.542343, 1, 0.1215686, 0, 1,
-1.982365, 0.2766057, -1.606488, 1, 0.1254902, 0, 1,
-1.926328, 1.24206, -2.498111, 1, 0.1333333, 0, 1,
-1.902085, -1.206597, -1.614244, 1, 0.1372549, 0, 1,
-1.886176, -0.9073498, -2.948268, 1, 0.145098, 0, 1,
-1.884347, 0.01896379, -2.213172, 1, 0.1490196, 0, 1,
-1.878228, -2.137301, -2.010582, 1, 0.1568628, 0, 1,
-1.863261, 1.027469, -2.242265, 1, 0.1607843, 0, 1,
-1.852745, 3.555491, -0.4070326, 1, 0.1686275, 0, 1,
-1.834787, -1.479499, -1.585705, 1, 0.172549, 0, 1,
-1.828503, 1.066558, -2.607769, 1, 0.1803922, 0, 1,
-1.805953, -0.9581653, -4.508729, 1, 0.1843137, 0, 1,
-1.796828, -0.3249361, -3.347831, 1, 0.1921569, 0, 1,
-1.776764, 1.698003, -0.2013795, 1, 0.1960784, 0, 1,
-1.771752, -0.0482938, -2.732102, 1, 0.2039216, 0, 1,
-1.761817, 0.8081193, -2.76153, 1, 0.2117647, 0, 1,
-1.758978, -1.126354, -0.259953, 1, 0.2156863, 0, 1,
-1.752787, -0.6093131, -2.457803, 1, 0.2235294, 0, 1,
-1.738146, 0.6930766, -2.758878, 1, 0.227451, 0, 1,
-1.699187, 0.5072761, 0.06877095, 1, 0.2352941, 0, 1,
-1.697098, 1.733844, -1.519038, 1, 0.2392157, 0, 1,
-1.675772, -0.2029874, -2.084336, 1, 0.2470588, 0, 1,
-1.673716, 1.291876, -2.111593, 1, 0.2509804, 0, 1,
-1.650383, 2.374236, -0.3763235, 1, 0.2588235, 0, 1,
-1.6487, 0.8848184, -0.5282438, 1, 0.2627451, 0, 1,
-1.633146, 0.04739654, -2.361357, 1, 0.2705882, 0, 1,
-1.628754, -0.5081662, -0.9957608, 1, 0.2745098, 0, 1,
-1.628283, -0.5316414, -2.1586, 1, 0.282353, 0, 1,
-1.620128, 1.642366, -2.960237, 1, 0.2862745, 0, 1,
-1.618204, -1.426346, -1.98503, 1, 0.2941177, 0, 1,
-1.617973, 0.02649902, -1.164609, 1, 0.3019608, 0, 1,
-1.599439, -0.6867431, -1.492638, 1, 0.3058824, 0, 1,
-1.595951, 1.604995, -1.397459, 1, 0.3137255, 0, 1,
-1.592182, -0.9010221, -2.378153, 1, 0.3176471, 0, 1,
-1.589682, -3.016999, -2.499778, 1, 0.3254902, 0, 1,
-1.576375, -0.8709868, -3.751321, 1, 0.3294118, 0, 1,
-1.574722, 0.001715497, 0.4523191, 1, 0.3372549, 0, 1,
-1.568265, -0.2190729, -1.799872, 1, 0.3411765, 0, 1,
-1.566886, -1.28515, -2.492466, 1, 0.3490196, 0, 1,
-1.56286, -0.2847009, -1.543129, 1, 0.3529412, 0, 1,
-1.555484, -1.249212, -2.337416, 1, 0.3607843, 0, 1,
-1.546528, 0.3662272, -1.478052, 1, 0.3647059, 0, 1,
-1.537776, -0.7239605, -2.97861, 1, 0.372549, 0, 1,
-1.53765, -0.122982, -0.8721765, 1, 0.3764706, 0, 1,
-1.53291, -1.387073, -1.698957, 1, 0.3843137, 0, 1,
-1.518994, 0.2015447, -1.987962, 1, 0.3882353, 0, 1,
-1.517761, 1.185844, -1.407692, 1, 0.3960784, 0, 1,
-1.483542, 1.783535, -0.7213292, 1, 0.4039216, 0, 1,
-1.480371, -0.1724353, -1.633068, 1, 0.4078431, 0, 1,
-1.451332, 0.8983172, -1.138144, 1, 0.4156863, 0, 1,
-1.447053, 1.081666, -1.758592, 1, 0.4196078, 0, 1,
-1.442371, 1.115909, -0.9909127, 1, 0.427451, 0, 1,
-1.437617, -0.07677919, -2.498102, 1, 0.4313726, 0, 1,
-1.419921, -1.906893, -1.577548, 1, 0.4392157, 0, 1,
-1.419795, -1.08404, -1.231409, 1, 0.4431373, 0, 1,
-1.412414, -0.6755486, -2.168329, 1, 0.4509804, 0, 1,
-1.409583, 0.0995495, -2.031015, 1, 0.454902, 0, 1,
-1.405914, -0.9927869, -1.805135, 1, 0.4627451, 0, 1,
-1.398216, -0.4649358, -1.465021, 1, 0.4666667, 0, 1,
-1.387512, -1.26281, -1.350196, 1, 0.4745098, 0, 1,
-1.385147, -0.2981227, -1.750985, 1, 0.4784314, 0, 1,
-1.370536, -0.6412764, -4.014533, 1, 0.4862745, 0, 1,
-1.36108, -1.383661, -2.808123, 1, 0.4901961, 0, 1,
-1.349764, -1.100432, -1.669027, 1, 0.4980392, 0, 1,
-1.34436, 0.01941818, -3.204588, 1, 0.5058824, 0, 1,
-1.34426, 1.012936, -0.3451709, 1, 0.509804, 0, 1,
-1.343837, -2.288198, -1.792461, 1, 0.5176471, 0, 1,
-1.341462, 0.7642642, -2.156416, 1, 0.5215687, 0, 1,
-1.333346, 0.2332225, -0.01673394, 1, 0.5294118, 0, 1,
-1.329563, 1.566073, -0.8817885, 1, 0.5333334, 0, 1,
-1.322645, 1.11109, -0.760691, 1, 0.5411765, 0, 1,
-1.318305, -1.293396, -1.414652, 1, 0.5450981, 0, 1,
-1.313745, 1.617334, -0.27939, 1, 0.5529412, 0, 1,
-1.303839, 0.3249866, -0.7816674, 1, 0.5568628, 0, 1,
-1.295509, 0.5842752, 0.2064491, 1, 0.5647059, 0, 1,
-1.283416, -0.1003927, -2.697871, 1, 0.5686275, 0, 1,
-1.28037, 0.08130921, -0.04591426, 1, 0.5764706, 0, 1,
-1.277484, -1.90812, -3.532689, 1, 0.5803922, 0, 1,
-1.276339, 1.586541, -2.849629, 1, 0.5882353, 0, 1,
-1.276058, 0.3243195, -0.9833456, 1, 0.5921569, 0, 1,
-1.274404, -0.3876089, -2.146544, 1, 0.6, 0, 1,
-1.264774, -0.1650892, -1.42807, 1, 0.6078432, 0, 1,
-1.263593, 1.147653, -1.886388, 1, 0.6117647, 0, 1,
-1.260565, 0.7048656, -1.522215, 1, 0.6196079, 0, 1,
-1.254298, 2.073175, -1.342424, 1, 0.6235294, 0, 1,
-1.246908, 0.5834468, -1.329233, 1, 0.6313726, 0, 1,
-1.246484, 1.35555, 0.042554, 1, 0.6352941, 0, 1,
-1.245507, 0.9817376, -2.615968, 1, 0.6431373, 0, 1,
-1.239437, -1.404147, -2.465123, 1, 0.6470588, 0, 1,
-1.234664, -0.7754588, -2.648887, 1, 0.654902, 0, 1,
-1.229894, -0.6056603, -2.464543, 1, 0.6588235, 0, 1,
-1.223419, -1.994714, -3.626382, 1, 0.6666667, 0, 1,
-1.207339, 0.1923494, -0.6486378, 1, 0.6705883, 0, 1,
-1.206704, 0.3545909, -1.686943, 1, 0.6784314, 0, 1,
-1.203606, -0.9224376, -1.69296, 1, 0.682353, 0, 1,
-1.199862, 2.623177, -2.425703, 1, 0.6901961, 0, 1,
-1.1898, 0.3667045, -2.934347, 1, 0.6941177, 0, 1,
-1.185451, 0.6453003, 0.002114206, 1, 0.7019608, 0, 1,
-1.182042, -1.463651, -2.385777, 1, 0.7098039, 0, 1,
-1.181421, 0.5088877, -0.329092, 1, 0.7137255, 0, 1,
-1.180636, -1.162139, -2.056498, 1, 0.7215686, 0, 1,
-1.174608, 0.7824053, -0.8743498, 1, 0.7254902, 0, 1,
-1.172726, -1.22012, -2.242977, 1, 0.7333333, 0, 1,
-1.166547, -0.4507046, -0.9419458, 1, 0.7372549, 0, 1,
-1.164114, 0.713091, -3.492266, 1, 0.7450981, 0, 1,
-1.159393, 1.477269, -0.09191535, 1, 0.7490196, 0, 1,
-1.158178, -0.5676895, -2.858714, 1, 0.7568628, 0, 1,
-1.154248, -0.5909035, -4.39621, 1, 0.7607843, 0, 1,
-1.151658, 0.1945506, -0.9155884, 1, 0.7686275, 0, 1,
-1.1515, -1.487594, -2.730402, 1, 0.772549, 0, 1,
-1.14669, -0.3809854, -1.549092, 1, 0.7803922, 0, 1,
-1.144547, -1.546143, -2.635934, 1, 0.7843137, 0, 1,
-1.144212, 0.05165547, -2.046266, 1, 0.7921569, 0, 1,
-1.142919, 0.04589029, -1.291419, 1, 0.7960784, 0, 1,
-1.140918, 1.439398, -0.3930371, 1, 0.8039216, 0, 1,
-1.131213, -0.5927173, -0.5178804, 1, 0.8117647, 0, 1,
-1.12437, 1.296287, -0.4690518, 1, 0.8156863, 0, 1,
-1.122091, 0.02145646, -2.97069, 1, 0.8235294, 0, 1,
-1.115826, -0.3205231, -3.563673, 1, 0.827451, 0, 1,
-1.109423, 2.035755, 1.068875, 1, 0.8352941, 0, 1,
-1.106884, -0.8598491, -2.775429, 1, 0.8392157, 0, 1,
-1.100394, -1.795941, -1.278272, 1, 0.8470588, 0, 1,
-1.098427, 0.3707842, -2.198735, 1, 0.8509804, 0, 1,
-1.096632, -2.06487, -4.626008, 1, 0.8588235, 0, 1,
-1.096341, -0.3823061, -0.1069792, 1, 0.8627451, 0, 1,
-1.086983, -0.8056828, -1.599622, 1, 0.8705882, 0, 1,
-1.083944, -1.452466, -3.419407, 1, 0.8745098, 0, 1,
-1.080795, 0.655767, -4.053876, 1, 0.8823529, 0, 1,
-1.076591, -0.4297738, -2.862357, 1, 0.8862745, 0, 1,
-1.073963, -0.7994604, -0.9529861, 1, 0.8941177, 0, 1,
-1.07012, 1.361665, -0.199739, 1, 0.8980392, 0, 1,
-1.058865, 0.6032393, -2.337687, 1, 0.9058824, 0, 1,
-1.055175, -0.6685093, -3.866329, 1, 0.9137255, 0, 1,
-1.052118, -1.920009, -3.240621, 1, 0.9176471, 0, 1,
-1.049535, -0.6943, -3.227722, 1, 0.9254902, 0, 1,
-1.048367, -1.112583, -1.56932, 1, 0.9294118, 0, 1,
-1.041797, 1.196888, -0.3357444, 1, 0.9372549, 0, 1,
-1.037316, 0.8732193, -0.8349417, 1, 0.9411765, 0, 1,
-1.03558, 1.028539, -0.8569794, 1, 0.9490196, 0, 1,
-1.034862, 0.9382729, -0.1987071, 1, 0.9529412, 0, 1,
-1.024879, -1.747716, -0.8174887, 1, 0.9607843, 0, 1,
-1.024637, 0.9194254, -1.958961, 1, 0.9647059, 0, 1,
-1.014575, -1.114193, -1.611717, 1, 0.972549, 0, 1,
-1.009003, -0.03185034, -2.664795, 1, 0.9764706, 0, 1,
-1.008395, 1.19874, -2.444767, 1, 0.9843137, 0, 1,
-1.006846, -0.2946693, -0.8997083, 1, 0.9882353, 0, 1,
-1.001904, 1.425109, -0.3501032, 1, 0.9960784, 0, 1,
-1.000043, 0.5634643, -2.546829, 0.9960784, 1, 0, 1,
-0.9975933, -0.7640358, -2.862843, 0.9921569, 1, 0, 1,
-0.9972304, 0.9527208, 0.05236294, 0.9843137, 1, 0, 1,
-0.9949605, -0.3436606, -3.103829, 0.9803922, 1, 0, 1,
-0.9935762, -0.548582, -3.184849, 0.972549, 1, 0, 1,
-0.9855186, 0.5056751, -0.7292809, 0.9686275, 1, 0, 1,
-0.9834552, -0.5045034, -2.467552, 0.9607843, 1, 0, 1,
-0.981997, 1.19321, -1.141166, 0.9568627, 1, 0, 1,
-0.9742017, -0.3989807, -2.514868, 0.9490196, 1, 0, 1,
-0.966316, -0.9476453, -4.496019, 0.945098, 1, 0, 1,
-0.9656339, -1.519842, -1.607886, 0.9372549, 1, 0, 1,
-0.9631279, -1.054192, -3.740362, 0.9333333, 1, 0, 1,
-0.9612992, 1.002971, 0.5588337, 0.9254902, 1, 0, 1,
-0.9504051, -0.7714074, -0.7388927, 0.9215686, 1, 0, 1,
-0.9488564, -0.06767728, 0.4960646, 0.9137255, 1, 0, 1,
-0.9380174, 0.7880602, -2.183447, 0.9098039, 1, 0, 1,
-0.9277788, 0.4508333, -0.4311187, 0.9019608, 1, 0, 1,
-0.9252041, 1.015471, -0.3740098, 0.8941177, 1, 0, 1,
-0.9148889, 0.5687208, -1.27441, 0.8901961, 1, 0, 1,
-0.9076809, -0.386799, -2.23849, 0.8823529, 1, 0, 1,
-0.9016946, -1.102731, -2.62756, 0.8784314, 1, 0, 1,
-0.8990113, -0.8048328, -2.240258, 0.8705882, 1, 0, 1,
-0.8823208, 0.8407161, -1.002635, 0.8666667, 1, 0, 1,
-0.8781546, -1.664156, -1.092151, 0.8588235, 1, 0, 1,
-0.8745103, 0.5464297, -2.496238, 0.854902, 1, 0, 1,
-0.8732768, 0.4667691, -0.5843126, 0.8470588, 1, 0, 1,
-0.8649286, 0.3102917, -2.506466, 0.8431373, 1, 0, 1,
-0.8630547, -0.1824872, -0.9750314, 0.8352941, 1, 0, 1,
-0.8619312, -1.59603, -2.33928, 0.8313726, 1, 0, 1,
-0.8609039, -1.830706, -5.286362, 0.8235294, 1, 0, 1,
-0.8473111, 0.4142926, 0.8186706, 0.8196079, 1, 0, 1,
-0.8446454, 0.2796567, -1.169954, 0.8117647, 1, 0, 1,
-0.8332273, 0.6870514, -0.05920159, 0.8078431, 1, 0, 1,
-0.8316715, 0.3524731, -1.463245, 0.8, 1, 0, 1,
-0.8280193, -1.187221, -1.979579, 0.7921569, 1, 0, 1,
-0.8263842, -0.2092049, -1.211993, 0.7882353, 1, 0, 1,
-0.8206497, -0.6261744, -3.135046, 0.7803922, 1, 0, 1,
-0.820518, 1.043443, 0.9816607, 0.7764706, 1, 0, 1,
-0.810056, 0.6405088, 1.317843, 0.7686275, 1, 0, 1,
-0.8060464, 0.5440632, -2.17019, 0.7647059, 1, 0, 1,
-0.8004678, -0.3199899, -1.998715, 0.7568628, 1, 0, 1,
-0.7921376, 1.382218, -1.055352, 0.7529412, 1, 0, 1,
-0.7891449, -0.4389248, -1.288736, 0.7450981, 1, 0, 1,
-0.7864131, -1.670868, -4.133811, 0.7411765, 1, 0, 1,
-0.7800341, 0.2217624, -0.386761, 0.7333333, 1, 0, 1,
-0.7691069, -0.03866712, -1.23115, 0.7294118, 1, 0, 1,
-0.7577168, -0.3650175, -0.9260119, 0.7215686, 1, 0, 1,
-0.7534376, -0.2939664, -2.729915, 0.7176471, 1, 0, 1,
-0.7533338, 1.401023, -2.578609, 0.7098039, 1, 0, 1,
-0.7532432, -1.220726, -1.350605, 0.7058824, 1, 0, 1,
-0.7484177, -1.390147, -2.242751, 0.6980392, 1, 0, 1,
-0.7476254, 1.111075, -0.3578726, 0.6901961, 1, 0, 1,
-0.7445129, -0.9906884, -3.218394, 0.6862745, 1, 0, 1,
-0.7376712, -0.3720955, -0.6075273, 0.6784314, 1, 0, 1,
-0.7368982, -0.1673644, -1.170292, 0.6745098, 1, 0, 1,
-0.7298546, 0.6442868, 1.023638, 0.6666667, 1, 0, 1,
-0.7245589, -0.8546676, -1.406597, 0.6627451, 1, 0, 1,
-0.7227324, 2.9552, -1.09868, 0.654902, 1, 0, 1,
-0.7169888, -0.1169515, -1.125738, 0.6509804, 1, 0, 1,
-0.7163077, 0.4209455, -1.2716, 0.6431373, 1, 0, 1,
-0.7155007, 1.166814, -0.198472, 0.6392157, 1, 0, 1,
-0.7116481, -0.7241839, -2.917405, 0.6313726, 1, 0, 1,
-0.7036442, 0.4729558, -0.6505792, 0.627451, 1, 0, 1,
-0.7009661, -0.7267127, -1.954085, 0.6196079, 1, 0, 1,
-0.6977202, -0.418192, -2.31972, 0.6156863, 1, 0, 1,
-0.6966679, -0.663056, -1.609054, 0.6078432, 1, 0, 1,
-0.6959335, 0.6221359, -1.427161, 0.6039216, 1, 0, 1,
-0.6929845, 0.8992395, -1.519407, 0.5960785, 1, 0, 1,
-0.6929415, 1.299351, -1.051288, 0.5882353, 1, 0, 1,
-0.6921853, 0.817206, -3.088352, 0.5843138, 1, 0, 1,
-0.6890806, 0.7224323, -0.7512998, 0.5764706, 1, 0, 1,
-0.6866961, 0.3157996, -0.1461058, 0.572549, 1, 0, 1,
-0.6863819, -1.628983, -2.974629, 0.5647059, 1, 0, 1,
-0.6841587, -0.2531119, -1.614542, 0.5607843, 1, 0, 1,
-0.6840825, -0.2322511, -2.038454, 0.5529412, 1, 0, 1,
-0.6835175, -2.784472, -3.556239, 0.5490196, 1, 0, 1,
-0.6807599, 0.9603572, -1.141422, 0.5411765, 1, 0, 1,
-0.6802801, 0.2514179, -1.366976, 0.5372549, 1, 0, 1,
-0.6764723, -0.08430633, -1.706202, 0.5294118, 1, 0, 1,
-0.6732759, 2.142711, 0.7739098, 0.5254902, 1, 0, 1,
-0.6677158, -2.08655, -3.681482, 0.5176471, 1, 0, 1,
-0.6650369, 0.7370892, 0.2615996, 0.5137255, 1, 0, 1,
-0.6638812, 0.04935184, 0.1163668, 0.5058824, 1, 0, 1,
-0.6612424, -1.029208, -2.750995, 0.5019608, 1, 0, 1,
-0.6610543, 1.626121, -0.1224011, 0.4941176, 1, 0, 1,
-0.6568938, 0.9217933, -0.02887483, 0.4862745, 1, 0, 1,
-0.655325, 1.998804, 0.6446042, 0.4823529, 1, 0, 1,
-0.6546221, 1.943328, -2.102781, 0.4745098, 1, 0, 1,
-0.6496038, 0.09061167, -3.325338, 0.4705882, 1, 0, 1,
-0.6468238, 0.161696, -0.6992599, 0.4627451, 1, 0, 1,
-0.636278, -1.108352, -2.651576, 0.4588235, 1, 0, 1,
-0.6311166, -0.6256078, -2.036114, 0.4509804, 1, 0, 1,
-0.6303, 0.4212558, -1.758276, 0.4470588, 1, 0, 1,
-0.628032, -1.152076, -2.237336, 0.4392157, 1, 0, 1,
-0.6139748, -1.809768, -2.844053, 0.4352941, 1, 0, 1,
-0.6090593, -1.507441, -1.870112, 0.427451, 1, 0, 1,
-0.6057888, -0.9828015, -2.832345, 0.4235294, 1, 0, 1,
-0.6037695, -0.007429038, -3.85325, 0.4156863, 1, 0, 1,
-0.6013801, -1.309901, -2.385055, 0.4117647, 1, 0, 1,
-0.5961846, -1.504553, -3.148333, 0.4039216, 1, 0, 1,
-0.5954149, 0.9465081, -1.823697, 0.3960784, 1, 0, 1,
-0.591614, -1.398784, -3.134409, 0.3921569, 1, 0, 1,
-0.5910379, 0.2056028, -2.320826, 0.3843137, 1, 0, 1,
-0.5882131, -0.1122105, -1.504278, 0.3803922, 1, 0, 1,
-0.5853705, 0.2800702, -1.278669, 0.372549, 1, 0, 1,
-0.5851754, -0.1116986, -1.307572, 0.3686275, 1, 0, 1,
-0.5761381, 0.05528219, -0.8891968, 0.3607843, 1, 0, 1,
-0.5705819, -0.9074597, -1.497363, 0.3568628, 1, 0, 1,
-0.5672916, -0.7496807, -1.945756, 0.3490196, 1, 0, 1,
-0.5625847, -0.8414296, -3.211552, 0.345098, 1, 0, 1,
-0.5624509, 0.5363181, -0.7863097, 0.3372549, 1, 0, 1,
-0.562358, -1.034892, -2.553181, 0.3333333, 1, 0, 1,
-0.5604392, -0.7238234, -3.917891, 0.3254902, 1, 0, 1,
-0.560082, 0.5853742, -0.6622629, 0.3215686, 1, 0, 1,
-0.5600795, -1.918946, -5.103568, 0.3137255, 1, 0, 1,
-0.5589381, 1.464122, -0.05580683, 0.3098039, 1, 0, 1,
-0.5548587, 1.516796, 0.4631108, 0.3019608, 1, 0, 1,
-0.5545606, -0.9535239, -5.249964, 0.2941177, 1, 0, 1,
-0.553717, 0.163155, -1.783132, 0.2901961, 1, 0, 1,
-0.553351, 1.182141, -0.4611702, 0.282353, 1, 0, 1,
-0.5499702, -0.3730401, -1.115131, 0.2784314, 1, 0, 1,
-0.542332, -1.279479, -2.418892, 0.2705882, 1, 0, 1,
-0.5388827, -0.3079889, -2.811065, 0.2666667, 1, 0, 1,
-0.5370627, 0.9488924, -1.991665, 0.2588235, 1, 0, 1,
-0.5339692, -1.419314, -3.874854, 0.254902, 1, 0, 1,
-0.5305216, -0.6264727, -2.254444, 0.2470588, 1, 0, 1,
-0.5291313, 0.2718636, -0.9639273, 0.2431373, 1, 0, 1,
-0.5158385, 0.2394452, -1.714777, 0.2352941, 1, 0, 1,
-0.5155372, -0.930406, -2.351796, 0.2313726, 1, 0, 1,
-0.5140579, -0.3217212, -1.438619, 0.2235294, 1, 0, 1,
-0.5073799, 0.1641573, 0.3476626, 0.2196078, 1, 0, 1,
-0.5053236, -1.006203, -1.463672, 0.2117647, 1, 0, 1,
-0.497754, 1.461379, -1.080119, 0.2078431, 1, 0, 1,
-0.4937049, 0.2826292, -0.7104632, 0.2, 1, 0, 1,
-0.49271, -2.131854, -4.771981, 0.1921569, 1, 0, 1,
-0.4921688, 1.239808, -1.658456, 0.1882353, 1, 0, 1,
-0.488885, -0.1570397, -0.8429924, 0.1803922, 1, 0, 1,
-0.4838602, 0.340971, -0.5537989, 0.1764706, 1, 0, 1,
-0.4829616, 0.1354683, -1.126295, 0.1686275, 1, 0, 1,
-0.4796634, -0.1937125, -2.75645, 0.1647059, 1, 0, 1,
-0.4754505, -0.8728903, -3.458559, 0.1568628, 1, 0, 1,
-0.4744713, -1.879146, -0.5468839, 0.1529412, 1, 0, 1,
-0.4736724, 0.312187, -1.87334, 0.145098, 1, 0, 1,
-0.4718778, 0.1560094, -1.53425, 0.1411765, 1, 0, 1,
-0.4712367, 0.1214085, -0.9681517, 0.1333333, 1, 0, 1,
-0.4678336, -0.9797905, -3.429561, 0.1294118, 1, 0, 1,
-0.466718, 1.158888, 1.292917, 0.1215686, 1, 0, 1,
-0.4621134, 0.531758, -1.346383, 0.1176471, 1, 0, 1,
-0.4597888, 0.8524926, 0.04127387, 0.1098039, 1, 0, 1,
-0.4576029, -0.422952, -1.773178, 0.1058824, 1, 0, 1,
-0.4521106, -0.06901678, -3.011252, 0.09803922, 1, 0, 1,
-0.4505974, 1.163502, -0.8233436, 0.09019608, 1, 0, 1,
-0.4485643, 1.269431, -1.219207, 0.08627451, 1, 0, 1,
-0.445915, 0.9529611, -0.8370932, 0.07843138, 1, 0, 1,
-0.4453277, -1.90389, -3.416761, 0.07450981, 1, 0, 1,
-0.441665, -0.9967415, -2.433298, 0.06666667, 1, 0, 1,
-0.4358704, 0.2931393, -2.307482, 0.0627451, 1, 0, 1,
-0.4342931, 0.3171045, -0.5552724, 0.05490196, 1, 0, 1,
-0.4325888, 0.7297043, 0.4602059, 0.05098039, 1, 0, 1,
-0.4316255, -0.7534772, -2.491335, 0.04313726, 1, 0, 1,
-0.4291251, -0.2349866, -2.602046, 0.03921569, 1, 0, 1,
-0.4282131, -2.083942, -1.936286, 0.03137255, 1, 0, 1,
-0.4258156, -1.069294, -2.858981, 0.02745098, 1, 0, 1,
-0.4220242, 0.5547583, -0.5382999, 0.01960784, 1, 0, 1,
-0.4219951, 0.404669, -1.658681, 0.01568628, 1, 0, 1,
-0.4186357, 0.301313, -2.588957, 0.007843138, 1, 0, 1,
-0.4178677, 1.049651, -1.774806, 0.003921569, 1, 0, 1,
-0.4162889, -1.088567, -3.167586, 0, 1, 0.003921569, 1,
-0.4140703, -1.506989, -2.891599, 0, 1, 0.01176471, 1,
-0.4125694, -0.7813815, -0.9799893, 0, 1, 0.01568628, 1,
-0.4091204, 0.2310849, -1.314927, 0, 1, 0.02352941, 1,
-0.4071777, 2.73434, -0.34998, 0, 1, 0.02745098, 1,
-0.4051001, 2.096615, -0.05005541, 0, 1, 0.03529412, 1,
-0.3996339, 0.4574181, -0.5386265, 0, 1, 0.03921569, 1,
-0.3978202, 0.8334503, 0.6902185, 0, 1, 0.04705882, 1,
-0.3974913, -0.4464258, -3.325996, 0, 1, 0.05098039, 1,
-0.3960546, -0.3585495, -1.940368, 0, 1, 0.05882353, 1,
-0.3947813, 0.03579859, -1.960928, 0, 1, 0.0627451, 1,
-0.3941206, 0.9393417, -1.525664, 0, 1, 0.07058824, 1,
-0.3913958, -1.416437, -3.041273, 0, 1, 0.07450981, 1,
-0.3877663, -1.327183, -1.895959, 0, 1, 0.08235294, 1,
-0.3844172, -1.257548, -3.184636, 0, 1, 0.08627451, 1,
-0.3839544, -1.579165, -2.63013, 0, 1, 0.09411765, 1,
-0.3815633, -0.7797307, -1.467021, 0, 1, 0.1019608, 1,
-0.3772426, -0.6308639, -2.5453, 0, 1, 0.1058824, 1,
-0.3678989, -0.5285841, -4.040471, 0, 1, 0.1137255, 1,
-0.3668239, 1.775949, -0.3478311, 0, 1, 0.1176471, 1,
-0.3609736, -0.1302194, -1.790739, 0, 1, 0.1254902, 1,
-0.3604599, 0.8466698, 0.9580469, 0, 1, 0.1294118, 1,
-0.3595434, -0.8861914, -1.498201, 0, 1, 0.1372549, 1,
-0.3512118, 1.933269, 1.1663, 0, 1, 0.1411765, 1,
-0.3456373, -0.9246231, -3.029322, 0, 1, 0.1490196, 1,
-0.339368, -0.2771523, -1.978054, 0, 1, 0.1529412, 1,
-0.3363996, -0.8071286, -1.244988, 0, 1, 0.1607843, 1,
-0.332088, -1.449935, -2.644263, 0, 1, 0.1647059, 1,
-0.3240762, -0.7291476, -3.87704, 0, 1, 0.172549, 1,
-0.3238428, -0.1450302, -3.728994, 0, 1, 0.1764706, 1,
-0.3212291, -0.5768204, -1.71234, 0, 1, 0.1843137, 1,
-0.3206222, 0.2729709, -1.424451, 0, 1, 0.1882353, 1,
-0.3189764, -0.555794, -2.024967, 0, 1, 0.1960784, 1,
-0.3184869, -0.3433739, -1.560053, 0, 1, 0.2039216, 1,
-0.3173029, -1.054788, -2.529212, 0, 1, 0.2078431, 1,
-0.3136058, 0.7126386, 0.1666016, 0, 1, 0.2156863, 1,
-0.3123876, 1.128811, -1.672605, 0, 1, 0.2196078, 1,
-0.3095793, 2.04241, -1.974937, 0, 1, 0.227451, 1,
-0.3070851, 0.4078395, -0.3339279, 0, 1, 0.2313726, 1,
-0.3058709, 0.5203004, -1.607316, 0, 1, 0.2392157, 1,
-0.3027968, -1.245259, -1.975494, 0, 1, 0.2431373, 1,
-0.2980706, -0.6936639, -3.925781, 0, 1, 0.2509804, 1,
-0.2971231, -1.77378, -1.835475, 0, 1, 0.254902, 1,
-0.286911, 0.8869765, -1.483266, 0, 1, 0.2627451, 1,
-0.2868842, -0.3685973, -2.115916, 0, 1, 0.2666667, 1,
-0.2804074, -1.944765, -3.409281, 0, 1, 0.2745098, 1,
-0.280188, -1.786927, -3.207504, 0, 1, 0.2784314, 1,
-0.2798888, 1.498192, -0.4536344, 0, 1, 0.2862745, 1,
-0.2741478, -0.4978322, -2.525357, 0, 1, 0.2901961, 1,
-0.2727506, 0.7526578, -0.5205052, 0, 1, 0.2980392, 1,
-0.2725548, -1.105822, -4.494477, 0, 1, 0.3058824, 1,
-0.2694558, -0.3105577, -2.575874, 0, 1, 0.3098039, 1,
-0.2681653, -1.455977, -3.342011, 0, 1, 0.3176471, 1,
-0.2618962, -0.8287885, -3.706729, 0, 1, 0.3215686, 1,
-0.2590647, 0.1751401, -1.574063, 0, 1, 0.3294118, 1,
-0.2579167, -0.3774716, -2.816997, 0, 1, 0.3333333, 1,
-0.2569568, 1.422181, 1.265361, 0, 1, 0.3411765, 1,
-0.2537771, 0.01991364, -1.450581, 0, 1, 0.345098, 1,
-0.2508467, -0.1679387, -2.462985, 0, 1, 0.3529412, 1,
-0.247405, -2.326669, -3.271825, 0, 1, 0.3568628, 1,
-0.2453239, -1.091875, -4.955865, 0, 1, 0.3647059, 1,
-0.2430151, -0.806724, -2.432828, 0, 1, 0.3686275, 1,
-0.2424657, 1.855786, 1.201496, 0, 1, 0.3764706, 1,
-0.2413588, 1.034196, -0.4378152, 0, 1, 0.3803922, 1,
-0.2399901, -0.8042785, -3.279124, 0, 1, 0.3882353, 1,
-0.2389343, 1.436173, -0.2767447, 0, 1, 0.3921569, 1,
-0.2351538, 1.831176, 1.480959, 0, 1, 0.4, 1,
-0.2346151, 0.9372551, -1.426769, 0, 1, 0.4078431, 1,
-0.2328541, 0.6468085, 0.3118859, 0, 1, 0.4117647, 1,
-0.2267956, 0.1778918, -0.3271292, 0, 1, 0.4196078, 1,
-0.2265155, -0.3607354, -2.048874, 0, 1, 0.4235294, 1,
-0.2248923, 0.08682049, -0.1787664, 0, 1, 0.4313726, 1,
-0.2223414, -1.877873, -3.115715, 0, 1, 0.4352941, 1,
-0.2193849, 1.051256, 0.7601873, 0, 1, 0.4431373, 1,
-0.213431, -0.4791331, -3.575825, 0, 1, 0.4470588, 1,
-0.2014492, 0.309541, -0.339703, 0, 1, 0.454902, 1,
-0.1999161, 0.7225005, 1.248323, 0, 1, 0.4588235, 1,
-0.1985337, 1.333499, 0.4965495, 0, 1, 0.4666667, 1,
-0.1984356, -0.545965, -3.258873, 0, 1, 0.4705882, 1,
-0.1981167, 0.8333049, -1.642098, 0, 1, 0.4784314, 1,
-0.1958546, -0.8739489, -3.3898, 0, 1, 0.4823529, 1,
-0.195577, 0.4306763, -0.4062534, 0, 1, 0.4901961, 1,
-0.1917514, 1.116836, -0.1241467, 0, 1, 0.4941176, 1,
-0.1899484, 0.2607662, -1.208956, 0, 1, 0.5019608, 1,
-0.1783012, 0.7840986, 1.170438, 0, 1, 0.509804, 1,
-0.1750873, 0.8746191, 0.6960214, 0, 1, 0.5137255, 1,
-0.1740103, 0.04316673, -0.4283913, 0, 1, 0.5215687, 1,
-0.1737065, -2.095529, -4.423167, 0, 1, 0.5254902, 1,
-0.1715249, 0.5870076, 1.347515, 0, 1, 0.5333334, 1,
-0.1694765, -1.125736, -2.360337, 0, 1, 0.5372549, 1,
-0.164931, -0.914899, -3.196105, 0, 1, 0.5450981, 1,
-0.1629965, 0.6339538, -0.3714812, 0, 1, 0.5490196, 1,
-0.1596759, 0.3075937, 0.2867427, 0, 1, 0.5568628, 1,
-0.1593018, -0.8301648, -1.368183, 0, 1, 0.5607843, 1,
-0.142334, -1.69889, -1.890607, 0, 1, 0.5686275, 1,
-0.134233, 1.257659, -1.142699, 0, 1, 0.572549, 1,
-0.1277661, 0.653917, 1.794284, 0, 1, 0.5803922, 1,
-0.1266767, -0.08594304, -2.310892, 0, 1, 0.5843138, 1,
-0.1254393, -1.26411, -3.634426, 0, 1, 0.5921569, 1,
-0.1233649, 1.215636, -1.640304, 0, 1, 0.5960785, 1,
-0.1202777, -0.2151698, -2.227277, 0, 1, 0.6039216, 1,
-0.1186123, 0.6485772, 0.04038086, 0, 1, 0.6117647, 1,
-0.1180275, -0.7385286, -2.861177, 0, 1, 0.6156863, 1,
-0.1163967, -0.4214665, -2.772023, 0, 1, 0.6235294, 1,
-0.1117502, 0.6161253, -1.38776, 0, 1, 0.627451, 1,
-0.1106886, -0.7690248, -3.898517, 0, 1, 0.6352941, 1,
-0.1091135, -1.329741, -2.520063, 0, 1, 0.6392157, 1,
-0.1008908, -0.5309999, -3.278385, 0, 1, 0.6470588, 1,
-0.09707727, -0.5789626, -2.029426, 0, 1, 0.6509804, 1,
-0.09674621, 0.2030998, -0.9997224, 0, 1, 0.6588235, 1,
-0.09614331, 0.03009073, -1.035831, 0, 1, 0.6627451, 1,
-0.09496198, -0.3353509, -2.974384, 0, 1, 0.6705883, 1,
-0.09267594, 1.058879, -0.9370903, 0, 1, 0.6745098, 1,
-0.09145886, -0.9736577, -2.767197, 0, 1, 0.682353, 1,
-0.08815369, 0.03931389, -0.77768, 0, 1, 0.6862745, 1,
-0.08595791, -1.547416, -1.534762, 0, 1, 0.6941177, 1,
-0.08560531, 0.7160915, 0.5099119, 0, 1, 0.7019608, 1,
-0.08019033, 0.2162551, -1.115038, 0, 1, 0.7058824, 1,
-0.07637556, -2.010344, -3.842426, 0, 1, 0.7137255, 1,
-0.07029393, -1.125694, -2.126024, 0, 1, 0.7176471, 1,
-0.06658278, 0.1968217, -2.00502, 0, 1, 0.7254902, 1,
-0.06477571, -0.6776817, -2.362253, 0, 1, 0.7294118, 1,
-0.06413305, -0.3639224, -3.299136, 0, 1, 0.7372549, 1,
-0.06051354, -1.509169, -2.919951, 0, 1, 0.7411765, 1,
-0.05899628, 0.8145168, 1.948478, 0, 1, 0.7490196, 1,
-0.05857073, -1.224958, -2.551826, 0, 1, 0.7529412, 1,
-0.05819307, -0.9190421, -2.079752, 0, 1, 0.7607843, 1,
-0.05692428, 0.5480801, -1.164721, 0, 1, 0.7647059, 1,
-0.05528781, 1.973116, 0.3743955, 0, 1, 0.772549, 1,
-0.05185885, -0.3510837, -3.601843, 0, 1, 0.7764706, 1,
-0.04807399, -1.182675, -2.573351, 0, 1, 0.7843137, 1,
-0.04614108, -0.7487625, -2.721092, 0, 1, 0.7882353, 1,
-0.04463787, -0.6303954, -2.93524, 0, 1, 0.7960784, 1,
-0.04433632, 0.1641728, 1.04613, 0, 1, 0.8039216, 1,
-0.04302331, 0.6502033, -1.304957, 0, 1, 0.8078431, 1,
-0.04082347, -0.3250191, -3.069325, 0, 1, 0.8156863, 1,
-0.03598167, -0.2831961, -4.258068, 0, 1, 0.8196079, 1,
-0.0354564, -0.1447871, -2.065809, 0, 1, 0.827451, 1,
-0.03442432, 0.6254623, 0.9173961, 0, 1, 0.8313726, 1,
-0.03086935, -0.6411232, -4.596242, 0, 1, 0.8392157, 1,
-0.02906829, 0.4093166, 0.4057384, 0, 1, 0.8431373, 1,
-0.02853997, -0.2832004, -3.37472, 0, 1, 0.8509804, 1,
-0.0274179, -0.1897637, -3.485412, 0, 1, 0.854902, 1,
-0.02685636, 0.4139946, 0.7984152, 0, 1, 0.8627451, 1,
-0.02645982, -1.293437, -3.632249, 0, 1, 0.8666667, 1,
-0.02575815, -0.8363823, -1.529866, 0, 1, 0.8745098, 1,
-0.02431067, 0.7653867, -1.154115, 0, 1, 0.8784314, 1,
-0.02407731, -0.9484202, -3.304703, 0, 1, 0.8862745, 1,
-0.0238015, -0.3022226, -2.833387, 0, 1, 0.8901961, 1,
-0.02344608, -0.8205621, -2.412735, 0, 1, 0.8980392, 1,
-0.02219154, -1.533718, -3.162655, 0, 1, 0.9058824, 1,
-0.0213402, 2.418651, -0.4521329, 0, 1, 0.9098039, 1,
-0.01695808, 2.313209, -1.216803, 0, 1, 0.9176471, 1,
-0.01539388, -0.3679373, -2.542497, 0, 1, 0.9215686, 1,
-0.01358636, -0.3382592, -4.360876, 0, 1, 0.9294118, 1,
-0.0101817, -0.5365803, -2.200829, 0, 1, 0.9333333, 1,
-0.009839674, 0.1928479, 0.8897606, 0, 1, 0.9411765, 1,
-0.009110698, -0.4771422, -4.212814, 0, 1, 0.945098, 1,
-0.005503817, 1.408132, -0.4542172, 0, 1, 0.9529412, 1,
0.005109446, 1.41915, -0.7280081, 0, 1, 0.9568627, 1,
0.01820884, 0.2843577, -2.22534, 0, 1, 0.9647059, 1,
0.02374952, 0.8766019, -0.9046392, 0, 1, 0.9686275, 1,
0.0302924, 0.1879128, -0.1936207, 0, 1, 0.9764706, 1,
0.03181655, 0.7669795, -0.3484546, 0, 1, 0.9803922, 1,
0.04092023, 0.1754285, -1.593367, 0, 1, 0.9882353, 1,
0.04587673, 0.709116, 0.124686, 0, 1, 0.9921569, 1,
0.05155731, -0.405446, 3.889684, 0, 1, 1, 1,
0.05297584, 1.476608, -0.8197477, 0, 0.9921569, 1, 1,
0.05717937, -0.7890124, 3.252021, 0, 0.9882353, 1, 1,
0.06271438, -1.428266, 4.45232, 0, 0.9803922, 1, 1,
0.06424215, -1.626104, 1.881156, 0, 0.9764706, 1, 1,
0.06463934, 0.04750016, 1.438985, 0, 0.9686275, 1, 1,
0.06614029, 1.421138, -0.1219044, 0, 0.9647059, 1, 1,
0.06676315, 0.939591, -0.521852, 0, 0.9568627, 1, 1,
0.0671099, 0.8986066, -1.344324, 0, 0.9529412, 1, 1,
0.06713615, -0.7788157, 2.942512, 0, 0.945098, 1, 1,
0.07349963, -1.039531, 3.138265, 0, 0.9411765, 1, 1,
0.08399303, -1.127959, 0.6992593, 0, 0.9333333, 1, 1,
0.08485176, 2.032416, 0.9118696, 0, 0.9294118, 1, 1,
0.08684863, 0.08514046, 0.7438831, 0, 0.9215686, 1, 1,
0.09213659, 0.2568774, -1.101915, 0, 0.9176471, 1, 1,
0.09354424, 1.373748, 0.9097147, 0, 0.9098039, 1, 1,
0.09577463, 1.013075, -0.7399707, 0, 0.9058824, 1, 1,
0.0995995, -0.42749, 3.306033, 0, 0.8980392, 1, 1,
0.103628, 0.01838635, 2.23672, 0, 0.8901961, 1, 1,
0.1061027, 0.03087992, 0.8888475, 0, 0.8862745, 1, 1,
0.1124913, 1.356593, -0.5829327, 0, 0.8784314, 1, 1,
0.1128261, 2.171362, 1.390555, 0, 0.8745098, 1, 1,
0.1180175, 0.3591519, 0.7383766, 0, 0.8666667, 1, 1,
0.1182317, -1.8943, 4.239882, 0, 0.8627451, 1, 1,
0.1239512, 1.558316, -0.4987943, 0, 0.854902, 1, 1,
0.1243707, -0.6213854, 3.35111, 0, 0.8509804, 1, 1,
0.1262472, 1.13715, -0.1600802, 0, 0.8431373, 1, 1,
0.1263971, 1.643402, 2.275091, 0, 0.8392157, 1, 1,
0.1277438, -0.6072043, 3.92257, 0, 0.8313726, 1, 1,
0.1280469, 1.522135, 0.0258267, 0, 0.827451, 1, 1,
0.1291348, 2.116271, 0.6143606, 0, 0.8196079, 1, 1,
0.1302898, 0.3554496, 2.444293, 0, 0.8156863, 1, 1,
0.1314486, 0.3210459, -1.182627, 0, 0.8078431, 1, 1,
0.1327662, -0.1160459, 1.58661, 0, 0.8039216, 1, 1,
0.1374812, 0.3444619, -1.007421, 0, 0.7960784, 1, 1,
0.1430099, -0.1759789, 1.768736, 0, 0.7882353, 1, 1,
0.1440725, 0.4448612, -0.5048805, 0, 0.7843137, 1, 1,
0.1547357, -1.836922, 3.099479, 0, 0.7764706, 1, 1,
0.1555982, 0.2310715, 2.472363, 0, 0.772549, 1, 1,
0.1569803, 1.019174, -0.2520777, 0, 0.7647059, 1, 1,
0.1609817, 0.6725687, 1.671329, 0, 0.7607843, 1, 1,
0.1613029, -0.3374023, 2.15602, 0, 0.7529412, 1, 1,
0.1617043, -0.8168799, 1.625372, 0, 0.7490196, 1, 1,
0.1629565, 0.4099337, 2.135839, 0, 0.7411765, 1, 1,
0.1631356, -0.6521435, 3.10477, 0, 0.7372549, 1, 1,
0.1658695, -0.2740144, 3.762332, 0, 0.7294118, 1, 1,
0.1659537, -1.111524, 3.774261, 0, 0.7254902, 1, 1,
0.1660818, 0.8744442, 0.362165, 0, 0.7176471, 1, 1,
0.1756065, -0.2975061, 1.774106, 0, 0.7137255, 1, 1,
0.1806224, -1.041129, 4.35224, 0, 0.7058824, 1, 1,
0.1820346, -0.3373473, 1.521226, 0, 0.6980392, 1, 1,
0.1822045, -0.8834461, 4.986683, 0, 0.6941177, 1, 1,
0.1823312, 0.1294183, 1.120164, 0, 0.6862745, 1, 1,
0.1834794, 0.57254, -0.6831731, 0, 0.682353, 1, 1,
0.1847949, -0.7606454, 3.481315, 0, 0.6745098, 1, 1,
0.1865413, -2.304267, 2.549091, 0, 0.6705883, 1, 1,
0.1887721, -2.418387, 2.50972, 0, 0.6627451, 1, 1,
0.1935702, 1.467936, -0.6280113, 0, 0.6588235, 1, 1,
0.1943967, 2.460355, -0.9618065, 0, 0.6509804, 1, 1,
0.1950418, -0.5174915, 2.301997, 0, 0.6470588, 1, 1,
0.1989028, 1.667458, 0.2434678, 0, 0.6392157, 1, 1,
0.2011071, 2.972106, 0.1864226, 0, 0.6352941, 1, 1,
0.2096144, 1.962726, 0.2631621, 0, 0.627451, 1, 1,
0.2117988, -0.1214406, 0.3037755, 0, 0.6235294, 1, 1,
0.2155963, 0.8628531, -0.1957989, 0, 0.6156863, 1, 1,
0.216152, -1.6448, 1.921669, 0, 0.6117647, 1, 1,
0.2169039, 0.253959, -0.9696556, 0, 0.6039216, 1, 1,
0.2174774, 1.209381, 0.5828817, 0, 0.5960785, 1, 1,
0.2176827, -1.544432, 2.122803, 0, 0.5921569, 1, 1,
0.2180355, -0.7552646, 1.923751, 0, 0.5843138, 1, 1,
0.2184128, 0.2394404, -0.7701019, 0, 0.5803922, 1, 1,
0.2216013, 0.7527834, 0.456227, 0, 0.572549, 1, 1,
0.2343418, 1.280804, 0.6828914, 0, 0.5686275, 1, 1,
0.2348501, -0.2008856, 2.526678, 0, 0.5607843, 1, 1,
0.2363456, -0.5082986, 2.38609, 0, 0.5568628, 1, 1,
0.2386763, -0.8761398, 2.673237, 0, 0.5490196, 1, 1,
0.2394753, -0.0893975, -1.175935, 0, 0.5450981, 1, 1,
0.2400265, -0.4541897, 1.426929, 0, 0.5372549, 1, 1,
0.2410574, -0.02605777, 0.05845963, 0, 0.5333334, 1, 1,
0.2430318, -2.076188, 3.885607, 0, 0.5254902, 1, 1,
0.2436476, 0.9825189, 0.9682604, 0, 0.5215687, 1, 1,
0.2452341, 0.06924696, 0.6460767, 0, 0.5137255, 1, 1,
0.2462663, 0.3215246, 1.466173, 0, 0.509804, 1, 1,
0.2472042, 0.1576907, 0.2699677, 0, 0.5019608, 1, 1,
0.2494121, -0.2939623, 1.379681, 0, 0.4941176, 1, 1,
0.2507935, -0.04209689, 1.627143, 0, 0.4901961, 1, 1,
0.2566143, 0.9449464, 0.5624384, 0, 0.4823529, 1, 1,
0.2595646, -1.208006, 0.9608978, 0, 0.4784314, 1, 1,
0.2602068, 1.068295, 1.129583, 0, 0.4705882, 1, 1,
0.2613537, -0.4485566, 2.258513, 0, 0.4666667, 1, 1,
0.2632928, 0.8880296, -0.2906796, 0, 0.4588235, 1, 1,
0.2633254, -0.0996452, 1.615332, 0, 0.454902, 1, 1,
0.2649998, 0.2092952, 0.3545332, 0, 0.4470588, 1, 1,
0.2671268, 0.4035227, 0.5785921, 0, 0.4431373, 1, 1,
0.2718867, 0.2010131, -0.2058812, 0, 0.4352941, 1, 1,
0.2753035, 0.2523042, -1.127439, 0, 0.4313726, 1, 1,
0.2778178, -1.203758, 2.258482, 0, 0.4235294, 1, 1,
0.2812521, 0.3505808, 2.918508, 0, 0.4196078, 1, 1,
0.2834454, -0.3521455, 2.036896, 0, 0.4117647, 1, 1,
0.2938025, -0.616444, 4.532012, 0, 0.4078431, 1, 1,
0.294023, -0.6322792, 2.004207, 0, 0.4, 1, 1,
0.2950868, 0.2493531, 1.060437, 0, 0.3921569, 1, 1,
0.2985907, -0.4583779, 2.744014, 0, 0.3882353, 1, 1,
0.3043081, -0.09970311, 3.360601, 0, 0.3803922, 1, 1,
0.3059233, -0.6199826, 1.905015, 0, 0.3764706, 1, 1,
0.3064254, -0.05288218, 2.29176, 0, 0.3686275, 1, 1,
0.3106428, 0.3688587, 0.8444659, 0, 0.3647059, 1, 1,
0.3164223, 0.06829282, 2.025672, 0, 0.3568628, 1, 1,
0.3205491, 0.6894349, 1.570509, 0, 0.3529412, 1, 1,
0.3205646, -0.5655979, 2.892062, 0, 0.345098, 1, 1,
0.3312717, 0.9968027, -1.100859, 0, 0.3411765, 1, 1,
0.3321374, 0.9714156, 0.3763468, 0, 0.3333333, 1, 1,
0.3356898, -0.6422142, 3.815365, 0, 0.3294118, 1, 1,
0.3386038, -0.7293392, 1.917619, 0, 0.3215686, 1, 1,
0.3460539, -0.2105236, 3.625639, 0, 0.3176471, 1, 1,
0.3503813, 0.7776328, 2.064958, 0, 0.3098039, 1, 1,
0.3504876, 0.06967445, 2.18288, 0, 0.3058824, 1, 1,
0.3516563, 0.4406099, 1.172101, 0, 0.2980392, 1, 1,
0.3546728, 1.127165, -0.2241138, 0, 0.2901961, 1, 1,
0.3585347, -0.1160317, 1.929274, 0, 0.2862745, 1, 1,
0.3602599, 1.764475, -0.7092637, 0, 0.2784314, 1, 1,
0.3621011, 1.677169, 0.6718634, 0, 0.2745098, 1, 1,
0.3688194, -0.8928601, 2.565011, 0, 0.2666667, 1, 1,
0.369589, -0.001823615, 0.5302328, 0, 0.2627451, 1, 1,
0.3698457, 0.5632542, 1.247894, 0, 0.254902, 1, 1,
0.3699408, 0.2228831, 0.6664099, 0, 0.2509804, 1, 1,
0.3705693, 0.2109208, 0.7683554, 0, 0.2431373, 1, 1,
0.3710081, 0.1119554, 1.088026, 0, 0.2392157, 1, 1,
0.3894241, 0.3970266, 1.441194, 0, 0.2313726, 1, 1,
0.3953427, 0.1186762, 1.674603, 0, 0.227451, 1, 1,
0.398411, -0.1340374, 2.419191, 0, 0.2196078, 1, 1,
0.4007195, -0.9005771, 2.549666, 0, 0.2156863, 1, 1,
0.4012234, 0.6824692, -0.02119803, 0, 0.2078431, 1, 1,
0.4057473, -0.1448037, 0.7488238, 0, 0.2039216, 1, 1,
0.4188949, 0.3624025, 1.197927, 0, 0.1960784, 1, 1,
0.4189227, -0.8974457, 3.739383, 0, 0.1882353, 1, 1,
0.4258575, -0.05239055, 1.636783, 0, 0.1843137, 1, 1,
0.4267896, 0.4665176, -1.713731, 0, 0.1764706, 1, 1,
0.4275325, -0.955595, 3.105429, 0, 0.172549, 1, 1,
0.428508, -0.4521641, 3.901082, 0, 0.1647059, 1, 1,
0.4335853, 0.06085328, 0.5126541, 0, 0.1607843, 1, 1,
0.4337526, 1.332091, -0.5917724, 0, 0.1529412, 1, 1,
0.4356792, -0.7228917, 3.631107, 0, 0.1490196, 1, 1,
0.4399081, 0.1602034, 1.745818, 0, 0.1411765, 1, 1,
0.4417261, 1.006312, 1.479484, 0, 0.1372549, 1, 1,
0.4434485, 0.5922514, 0.1949865, 0, 0.1294118, 1, 1,
0.4467512, 1.049854, 0.8676875, 0, 0.1254902, 1, 1,
0.449599, -0.8627695, 0.3145549, 0, 0.1176471, 1, 1,
0.4510967, -1.372647, 3.990446, 0, 0.1137255, 1, 1,
0.4583434, -1.455995, 2.463133, 0, 0.1058824, 1, 1,
0.4651853, 1.148227, -0.2898824, 0, 0.09803922, 1, 1,
0.4652905, -0.1317413, 1.44432, 0, 0.09411765, 1, 1,
0.468859, -1.045722, 2.803937, 0, 0.08627451, 1, 1,
0.469519, 0.3963554, 2.621965, 0, 0.08235294, 1, 1,
0.4705723, -1.216597, 3.235042, 0, 0.07450981, 1, 1,
0.4758126, 0.6592106, 1.566712, 0, 0.07058824, 1, 1,
0.4818237, 0.6818016, 1.048254, 0, 0.0627451, 1, 1,
0.4836439, 0.6659288, 0.9504313, 0, 0.05882353, 1, 1,
0.4846471, 0.002304333, 1.324937, 0, 0.05098039, 1, 1,
0.4847854, -0.4609276, 1.52582, 0, 0.04705882, 1, 1,
0.4923578, -0.713475, 5.188914, 0, 0.03921569, 1, 1,
0.4990492, -0.7748187, 4.121358, 0, 0.03529412, 1, 1,
0.5036947, 0.01829312, 0.6368449, 0, 0.02745098, 1, 1,
0.5125169, -0.0554111, 1.025757, 0, 0.02352941, 1, 1,
0.5158772, 0.2800569, 0.2331671, 0, 0.01568628, 1, 1,
0.5170204, 1.053709, 0.02718573, 0, 0.01176471, 1, 1,
0.5175939, 0.934175, 1.054483, 0, 0.003921569, 1, 1,
0.5182839, -0.1173289, 2.665155, 0.003921569, 0, 1, 1,
0.5213282, -1.313074, 3.548017, 0.007843138, 0, 1, 1,
0.5234264, -0.7036797, 3.203846, 0.01568628, 0, 1, 1,
0.5310649, 1.036875, -0.8330056, 0.01960784, 0, 1, 1,
0.5318043, 0.4690031, 0.9215595, 0.02745098, 0, 1, 1,
0.5320988, -0.2562596, 1.539429, 0.03137255, 0, 1, 1,
0.5352107, -2.192999, 3.182409, 0.03921569, 0, 1, 1,
0.5366871, -1.295341, 4.197293, 0.04313726, 0, 1, 1,
0.537199, 0.569971, 1.584296, 0.05098039, 0, 1, 1,
0.5432639, 2.324065, 0.3824715, 0.05490196, 0, 1, 1,
0.5441275, -1.422665, 2.105539, 0.0627451, 0, 1, 1,
0.5452439, 0.5431471, 1.475546, 0.06666667, 0, 1, 1,
0.5484056, -0.4857919, 1.730382, 0.07450981, 0, 1, 1,
0.5487918, -0.6648608, 2.201562, 0.07843138, 0, 1, 1,
0.5520377, -0.2919679, -0.1443406, 0.08627451, 0, 1, 1,
0.5565646, 2.223721, -0.7509336, 0.09019608, 0, 1, 1,
0.5582231, -0.07325459, 0.4011929, 0.09803922, 0, 1, 1,
0.5646186, 0.9757623, -0.2143565, 0.1058824, 0, 1, 1,
0.5678083, -0.9033552, 3.799098, 0.1098039, 0, 1, 1,
0.5695006, -1.778309, 3.028109, 0.1176471, 0, 1, 1,
0.5720042, -1.510654, 2.355649, 0.1215686, 0, 1, 1,
0.5748325, 1.927513, -1.108912, 0.1294118, 0, 1, 1,
0.5763893, -0.2891287, 4.504619, 0.1333333, 0, 1, 1,
0.5805982, -0.8135012, 2.290732, 0.1411765, 0, 1, 1,
0.5909107, 1.531106, -0.1242962, 0.145098, 0, 1, 1,
0.5925112, -0.7184651, 2.806493, 0.1529412, 0, 1, 1,
0.593697, 0.5507795, -1.299235, 0.1568628, 0, 1, 1,
0.5951972, 2.636945, -1.2625, 0.1647059, 0, 1, 1,
0.5954254, 1.204702, 0.8994048, 0.1686275, 0, 1, 1,
0.596671, 1.63221, 2.54328, 0.1764706, 0, 1, 1,
0.5970933, -0.7282633, 3.656493, 0.1803922, 0, 1, 1,
0.597712, -1.073623, 2.24785, 0.1882353, 0, 1, 1,
0.6025756, 0.8366973, 2.936543, 0.1921569, 0, 1, 1,
0.6057065, 0.2707723, 0.8356087, 0.2, 0, 1, 1,
0.6062582, -1.255853, 2.255478, 0.2078431, 0, 1, 1,
0.6075956, -1.788926, 3.653655, 0.2117647, 0, 1, 1,
0.6080059, -0.4925011, 0.7157643, 0.2196078, 0, 1, 1,
0.6106072, -0.4162273, 2.880137, 0.2235294, 0, 1, 1,
0.6138455, -0.4829531, 2.830357, 0.2313726, 0, 1, 1,
0.6151748, -0.6587685, 3.157831, 0.2352941, 0, 1, 1,
0.6165684, -0.1837413, 1.972504, 0.2431373, 0, 1, 1,
0.6207861, -0.1067952, 3.741594, 0.2470588, 0, 1, 1,
0.6213475, 1.83335, 0.7910374, 0.254902, 0, 1, 1,
0.6254113, -0.180793, 2.014721, 0.2588235, 0, 1, 1,
0.6257821, 1.868217, 0.4914873, 0.2666667, 0, 1, 1,
0.6263742, -0.1751018, 2.913267, 0.2705882, 0, 1, 1,
0.6291788, 1.106243, 1.05121, 0.2784314, 0, 1, 1,
0.6351113, -1.087104, 2.387067, 0.282353, 0, 1, 1,
0.636548, 0.6463132, -0.2998883, 0.2901961, 0, 1, 1,
0.6466379, -0.1442432, -0.2044578, 0.2941177, 0, 1, 1,
0.6489676, -1.750588, 1.04661, 0.3019608, 0, 1, 1,
0.6497067, -0.24486, 0.604317, 0.3098039, 0, 1, 1,
0.6521342, 1.453384, -0.5244707, 0.3137255, 0, 1, 1,
0.6543874, -0.9874373, 3.58695, 0.3215686, 0, 1, 1,
0.6552925, 1.888579, -0.4971376, 0.3254902, 0, 1, 1,
0.658973, -1.200111, 3.390712, 0.3333333, 0, 1, 1,
0.6590352, -0.7566273, 3.502371, 0.3372549, 0, 1, 1,
0.6658419, -0.514539, 0.4257578, 0.345098, 0, 1, 1,
0.6664284, 0.1205731, 2.53479, 0.3490196, 0, 1, 1,
0.6769705, 0.9395978, -0.2025011, 0.3568628, 0, 1, 1,
0.6779065, 0.7827691, 0.654774, 0.3607843, 0, 1, 1,
0.6813359, -0.3272821, 0.3170327, 0.3686275, 0, 1, 1,
0.6837592, -0.9119354, 2.047666, 0.372549, 0, 1, 1,
0.6838699, -0.04982625, 3.39241, 0.3803922, 0, 1, 1,
0.6844251, 0.1549456, 1.819887, 0.3843137, 0, 1, 1,
0.6852643, -0.6079189, 3.235012, 0.3921569, 0, 1, 1,
0.6858813, 0.02244913, 0.632888, 0.3960784, 0, 1, 1,
0.6878628, -0.01282341, 0.6669135, 0.4039216, 0, 1, 1,
0.6919844, -0.007921924, -0.17203, 0.4117647, 0, 1, 1,
0.6948628, -0.2923698, 0.2686024, 0.4156863, 0, 1, 1,
0.7001144, 0.1724826, 0.5478792, 0.4235294, 0, 1, 1,
0.7070136, 1.0044, -0.06089296, 0.427451, 0, 1, 1,
0.7094658, -0.3951062, -0.4984632, 0.4352941, 0, 1, 1,
0.7095892, 0.5917922, -0.1546104, 0.4392157, 0, 1, 1,
0.7099931, 0.6302174, 0.974236, 0.4470588, 0, 1, 1,
0.7109745, 0.5099487, 0.259205, 0.4509804, 0, 1, 1,
0.7134518, 1.347694, 1.800878, 0.4588235, 0, 1, 1,
0.7158338, -0.9603246, 1.966991, 0.4627451, 0, 1, 1,
0.7197214, -1.678234, 3.812071, 0.4705882, 0, 1, 1,
0.7198671, 0.3839742, 0.6254314, 0.4745098, 0, 1, 1,
0.7276266, 0.01749122, 1.612582, 0.4823529, 0, 1, 1,
0.7385446, 0.7567826, 1.266075, 0.4862745, 0, 1, 1,
0.7447345, -1.16753, 1.953399, 0.4941176, 0, 1, 1,
0.7475396, 1.441771, -0.05261694, 0.5019608, 0, 1, 1,
0.7489955, 0.9932584, 0.7925594, 0.5058824, 0, 1, 1,
0.7500048, 1.027692, 0.9639333, 0.5137255, 0, 1, 1,
0.7610132, 3.367994, 1.591441, 0.5176471, 0, 1, 1,
0.7642906, 0.6829274, 0.9699486, 0.5254902, 0, 1, 1,
0.7674531, -0.4967317, 1.940021, 0.5294118, 0, 1, 1,
0.7676637, -1.686641, 2.982705, 0.5372549, 0, 1, 1,
0.7678177, 0.01558344, 1.666856, 0.5411765, 0, 1, 1,
0.7679877, 0.5059643, 0.06877992, 0.5490196, 0, 1, 1,
0.7683617, -0.9186127, 2.333663, 0.5529412, 0, 1, 1,
0.7700845, -1.750953, 1.944777, 0.5607843, 0, 1, 1,
0.7811959, -0.5108712, 3.089333, 0.5647059, 0, 1, 1,
0.7817045, 0.725336, -0.4381719, 0.572549, 0, 1, 1,
0.7830563, 1.590471, 0.4412046, 0.5764706, 0, 1, 1,
0.7852517, 1.28401, 1.812931, 0.5843138, 0, 1, 1,
0.7875651, -2.240432, 3.588147, 0.5882353, 0, 1, 1,
0.789089, 1.009556, 0.4943741, 0.5960785, 0, 1, 1,
0.7913637, 1.165702, 0.4728552, 0.6039216, 0, 1, 1,
0.7969765, 0.05761316, 1.973784, 0.6078432, 0, 1, 1,
0.8001941, 0.2451342, 1.556679, 0.6156863, 0, 1, 1,
0.8036556, -0.2315526, 1.092882, 0.6196079, 0, 1, 1,
0.8040329, 0.03156536, 2.285061, 0.627451, 0, 1, 1,
0.8057062, -1.506602, 3.542248, 0.6313726, 0, 1, 1,
0.8097619, -0.8926431, 3.116505, 0.6392157, 0, 1, 1,
0.814989, 0.5034831, 1.238088, 0.6431373, 0, 1, 1,
0.8192834, -0.7812248, 2.337025, 0.6509804, 0, 1, 1,
0.8228597, -1.484813, 3.97745, 0.654902, 0, 1, 1,
0.8274259, 0.9952914, 1.369729, 0.6627451, 0, 1, 1,
0.8287711, -0.7533048, 2.302226, 0.6666667, 0, 1, 1,
0.8306859, -2.409272, 3.514056, 0.6745098, 0, 1, 1,
0.8322992, -0.8064247, 2.306606, 0.6784314, 0, 1, 1,
0.8379088, -0.1163966, 3.557818, 0.6862745, 0, 1, 1,
0.8532371, 0.5039551, -0.648955, 0.6901961, 0, 1, 1,
0.867402, 0.6579889, 0.1162816, 0.6980392, 0, 1, 1,
0.8687017, -1.129654, 1.496365, 0.7058824, 0, 1, 1,
0.8702354, -0.2553327, 2.3632, 0.7098039, 0, 1, 1,
0.8744321, -0.6601002, 2.926699, 0.7176471, 0, 1, 1,
0.8825058, -0.4940332, 0.2301698, 0.7215686, 0, 1, 1,
0.8832026, 0.2829577, 0.03284224, 0.7294118, 0, 1, 1,
0.886272, 1.542142, 0.4516956, 0.7333333, 0, 1, 1,
0.8866277, -0.2489327, -0.1245419, 0.7411765, 0, 1, 1,
0.8991936, 1.588043, 2.440956, 0.7450981, 0, 1, 1,
0.9015304, -0.03614819, 3.476332, 0.7529412, 0, 1, 1,
0.9031712, 2.319399, -1.47185, 0.7568628, 0, 1, 1,
0.9083753, 0.6698428, 0.6531348, 0.7647059, 0, 1, 1,
0.9240159, 0.3000382, 0.3565135, 0.7686275, 0, 1, 1,
0.924876, 0.7640343, 0.9897885, 0.7764706, 0, 1, 1,
0.9390591, -0.5984643, -0.4676614, 0.7803922, 0, 1, 1,
0.9506938, 1.231302, 1.143162, 0.7882353, 0, 1, 1,
0.9507027, -1.151531, 2.058779, 0.7921569, 0, 1, 1,
0.9534706, 1.251119, 0.0859533, 0.8, 0, 1, 1,
0.9554935, -0.8516711, 0.9117664, 0.8078431, 0, 1, 1,
0.9570712, 0.5635727, 1.06288, 0.8117647, 0, 1, 1,
0.9582371, -0.8154799, 2.551878, 0.8196079, 0, 1, 1,
0.9622514, 0.6415562, 0.2490761, 0.8235294, 0, 1, 1,
0.9627689, 1.563459, -0.09919887, 0.8313726, 0, 1, 1,
0.9652536, -0.4984621, 2.789253, 0.8352941, 0, 1, 1,
0.9658504, -0.9001341, 2.234688, 0.8431373, 0, 1, 1,
0.9684634, -0.05148834, 1.45802, 0.8470588, 0, 1, 1,
0.9708729, 0.1260188, 1.432359, 0.854902, 0, 1, 1,
0.9713177, -0.7126451, 4.564811, 0.8588235, 0, 1, 1,
0.9780632, -0.7356654, 2.925508, 0.8666667, 0, 1, 1,
0.9783705, -0.3732249, 2.602629, 0.8705882, 0, 1, 1,
0.9801962, -0.980355, 2.576276, 0.8784314, 0, 1, 1,
0.9833267, -0.2252467, 2.71095, 0.8823529, 0, 1, 1,
0.988985, -0.5772499, 1.015426, 0.8901961, 0, 1, 1,
0.9981763, 1.142932, 0.1198681, 0.8941177, 0, 1, 1,
0.9994802, 1.314919, 0.7766293, 0.9019608, 0, 1, 1,
1.002912, -1.473716, 2.882087, 0.9098039, 0, 1, 1,
1.006529, -0.3443308, 1.525484, 0.9137255, 0, 1, 1,
1.015214, 1.045423, 0.5700442, 0.9215686, 0, 1, 1,
1.020239, 0.2887892, 0.5792637, 0.9254902, 0, 1, 1,
1.020859, -0.08275487, 2.336704, 0.9333333, 0, 1, 1,
1.021587, -0.5153947, 0.6688145, 0.9372549, 0, 1, 1,
1.026095, -0.7533642, 2.360977, 0.945098, 0, 1, 1,
1.038127, 1.614518, 1.752646, 0.9490196, 0, 1, 1,
1.041696, 0.4578779, 0.5041817, 0.9568627, 0, 1, 1,
1.052792, 0.06236717, -0.1413768, 0.9607843, 0, 1, 1,
1.053605, 0.176867, 1.208655, 0.9686275, 0, 1, 1,
1.056198, -1.005835, 1.848912, 0.972549, 0, 1, 1,
1.060621, -0.2499145, 2.248698, 0.9803922, 0, 1, 1,
1.069233, 0.5571051, 1.238215, 0.9843137, 0, 1, 1,
1.072031, 0.1470259, 2.21282, 0.9921569, 0, 1, 1,
1.073775, 0.650394, 2.494798, 0.9960784, 0, 1, 1,
1.094172, 0.6849006, -1.609951, 1, 0, 0.9960784, 1,
1.098759, -1.733867, 2.562634, 1, 0, 0.9882353, 1,
1.103777, 1.258035, 0.8300012, 1, 0, 0.9843137, 1,
1.10517, -0.3234892, 0.8486484, 1, 0, 0.9764706, 1,
1.117659, -0.6450917, 0.936432, 1, 0, 0.972549, 1,
1.118134, -1.187901, 2.887398, 1, 0, 0.9647059, 1,
1.118384, 0.4541894, 0.4786136, 1, 0, 0.9607843, 1,
1.124196, -0.5981568, 2.135484, 1, 0, 0.9529412, 1,
1.128063, -0.238985, 1.080119, 1, 0, 0.9490196, 1,
1.137239, 0.3992717, 0.02107895, 1, 0, 0.9411765, 1,
1.140135, 0.2118534, 2.76027, 1, 0, 0.9372549, 1,
1.14044, -0.8541648, 1.332455, 1, 0, 0.9294118, 1,
1.140591, -0.3050285, 2.30986, 1, 0, 0.9254902, 1,
1.147939, -0.5671329, 2.615937, 1, 0, 0.9176471, 1,
1.150914, 2.106806, 0.5139459, 1, 0, 0.9137255, 1,
1.158154, -1.339139, 2.200465, 1, 0, 0.9058824, 1,
1.161041, -0.975102, 0.3084415, 1, 0, 0.9019608, 1,
1.161265, -0.8333619, 3.186958, 1, 0, 0.8941177, 1,
1.162474, 0.7460199, 0.3446126, 1, 0, 0.8862745, 1,
1.170764, -0.2552814, 1.506151, 1, 0, 0.8823529, 1,
1.177179, 0.5985361, 2.141675, 1, 0, 0.8745098, 1,
1.179263, -1.401139, 4.226855, 1, 0, 0.8705882, 1,
1.189898, -0.4912007, 1.528945, 1, 0, 0.8627451, 1,
1.198316, 0.2330099, 0.8213535, 1, 0, 0.8588235, 1,
1.204234, 0.3224996, 1.663842, 1, 0, 0.8509804, 1,
1.207646, 0.7167236, -0.08089601, 1, 0, 0.8470588, 1,
1.226617, -2.308455, 3.14515, 1, 0, 0.8392157, 1,
1.234496, 0.969213, 0.1860065, 1, 0, 0.8352941, 1,
1.235142, 0.9382433, 2.458329, 1, 0, 0.827451, 1,
1.235927, -0.3120457, 2.939835, 1, 0, 0.8235294, 1,
1.236878, -0.6488522, 2.31431, 1, 0, 0.8156863, 1,
1.240223, 0.0165385, 0.5300781, 1, 0, 0.8117647, 1,
1.240559, 1.33694, -0.8281965, 1, 0, 0.8039216, 1,
1.258498, -0.005589142, 2.009954, 1, 0, 0.7960784, 1,
1.25977, 0.4018261, 1.577777, 1, 0, 0.7921569, 1,
1.270259, -0.8283069, 2.407982, 1, 0, 0.7843137, 1,
1.271315, -0.3893111, 1.006612, 1, 0, 0.7803922, 1,
1.285161, -0.2010236, 2.053859, 1, 0, 0.772549, 1,
1.287707, 0.4915058, 1.623538, 1, 0, 0.7686275, 1,
1.289095, -1.272861, 1.063858, 1, 0, 0.7607843, 1,
1.290917, -0.568242, 0.6223693, 1, 0, 0.7568628, 1,
1.296026, 0.7575344, 1.371164, 1, 0, 0.7490196, 1,
1.296153, 0.9207572, 1.054694, 1, 0, 0.7450981, 1,
1.297789, 0.4248818, 0.8794933, 1, 0, 0.7372549, 1,
1.297915, 0.004600292, 0.7941594, 1, 0, 0.7333333, 1,
1.302055, -0.8224831, 2.729227, 1, 0, 0.7254902, 1,
1.302321, -1.656623, 3.101962, 1, 0, 0.7215686, 1,
1.302455, 0.04117807, 1.549446, 1, 0, 0.7137255, 1,
1.30547, -0.1810094, 1.820491, 1, 0, 0.7098039, 1,
1.321292, 0.08834593, 2.011507, 1, 0, 0.7019608, 1,
1.322406, 0.930991, 1.986932, 1, 0, 0.6941177, 1,
1.324865, 1.564661, 0.9643245, 1, 0, 0.6901961, 1,
1.32978, 0.1970668, 1.193959, 1, 0, 0.682353, 1,
1.333546, 1.143364, -0.1747632, 1, 0, 0.6784314, 1,
1.338786, -1.013239, 1.187719, 1, 0, 0.6705883, 1,
1.339396, -1.319432, 1.365228, 1, 0, 0.6666667, 1,
1.343486, 0.6906462, 0.4614383, 1, 0, 0.6588235, 1,
1.348212, 0.05561435, 2.36526, 1, 0, 0.654902, 1,
1.348511, 1.170702, 0.7906856, 1, 0, 0.6470588, 1,
1.358532, 0.8343889, -1.236792, 1, 0, 0.6431373, 1,
1.367091, -0.3435675, 0.05916771, 1, 0, 0.6352941, 1,
1.372243, -1.151712, 2.291024, 1, 0, 0.6313726, 1,
1.376202, 1.283602, 0.2752952, 1, 0, 0.6235294, 1,
1.380643, -0.01722688, 2.823437, 1, 0, 0.6196079, 1,
1.382496, 0.512316, 0.6733774, 1, 0, 0.6117647, 1,
1.399083, 1.129123, 2.199349, 1, 0, 0.6078432, 1,
1.400624, 3.264144, 0.9292786, 1, 0, 0.6, 1,
1.401044, 0.2974609, -0.02199675, 1, 0, 0.5921569, 1,
1.404614, 1.092334, 0.7475379, 1, 0, 0.5882353, 1,
1.405113, -0.4544298, 1.761842, 1, 0, 0.5803922, 1,
1.415994, 0.9122739, 1.427389, 1, 0, 0.5764706, 1,
1.417254, 0.8267009, 1.983271, 1, 0, 0.5686275, 1,
1.426114, 1.608597, -1.554651, 1, 0, 0.5647059, 1,
1.426695, -0.6353729, 2.639919, 1, 0, 0.5568628, 1,
1.426856, -0.3949763, 0.5209646, 1, 0, 0.5529412, 1,
1.429238, -2.128983, 1.523575, 1, 0, 0.5450981, 1,
1.430662, 0.35958, 1.70118, 1, 0, 0.5411765, 1,
1.43561, -0.982884, 1.27691, 1, 0, 0.5333334, 1,
1.445075, 0.1913137, 1.293472, 1, 0, 0.5294118, 1,
1.454812, 0.2981332, 1.731541, 1, 0, 0.5215687, 1,
1.455065, 1.059677, 0.6726408, 1, 0, 0.5176471, 1,
1.464141, -0.5074663, 0.9171084, 1, 0, 0.509804, 1,
1.465321, -0.7958337, 2.745478, 1, 0, 0.5058824, 1,
1.466136, 0.03741636, 1.574887, 1, 0, 0.4980392, 1,
1.476484, 2.737069, 0.7264934, 1, 0, 0.4901961, 1,
1.487442, 2.38566, -0.5320845, 1, 0, 0.4862745, 1,
1.509767, 0.7702411, 2.522811, 1, 0, 0.4784314, 1,
1.51162, -1.230123, 0.8460754, 1, 0, 0.4745098, 1,
1.51821, 1.884966, 1.207266, 1, 0, 0.4666667, 1,
1.522308, 0.6942008, 0.6608824, 1, 0, 0.4627451, 1,
1.522427, -0.3407691, 1.095381, 1, 0, 0.454902, 1,
1.524185, -0.3824998, 0.2762293, 1, 0, 0.4509804, 1,
1.524812, -0.2374834, 1.797607, 1, 0, 0.4431373, 1,
1.526695, -0.1404176, 1.110088, 1, 0, 0.4392157, 1,
1.533473, 1.485485, -0.04419581, 1, 0, 0.4313726, 1,
1.546958, -1.204866, 2.219665, 1, 0, 0.427451, 1,
1.548585, 1.190274, 0.7446327, 1, 0, 0.4196078, 1,
1.549078, 0.4314454, 1.47232, 1, 0, 0.4156863, 1,
1.558241, 1.533238, 1.214712, 1, 0, 0.4078431, 1,
1.559271, 0.9319026, -3.139922e-05, 1, 0, 0.4039216, 1,
1.575434, 0.4921218, 0.5254891, 1, 0, 0.3960784, 1,
1.585034, -1.525985, 1.854228, 1, 0, 0.3882353, 1,
1.593714, -1.797784, 2.230216, 1, 0, 0.3843137, 1,
1.602295, -1.105717, 0.4330901, 1, 0, 0.3764706, 1,
1.611071, -0.1423193, 1.573323, 1, 0, 0.372549, 1,
1.617018, -0.2573794, 0.8099102, 1, 0, 0.3647059, 1,
1.638241, 2.155385, 1.606333, 1, 0, 0.3607843, 1,
1.642682, 0.9473129, 2.116851, 1, 0, 0.3529412, 1,
1.64631, 1.433822, -0.7850525, 1, 0, 0.3490196, 1,
1.674029, -0.4478059, 1.74422, 1, 0, 0.3411765, 1,
1.677953, 1.02757, 1.345114, 1, 0, 0.3372549, 1,
1.6953, 1.189862, 2.393547, 1, 0, 0.3294118, 1,
1.712553, 0.5810293, 0.7148171, 1, 0, 0.3254902, 1,
1.75892, 1.398826, 1.37095, 1, 0, 0.3176471, 1,
1.778797, -0.7790816, 1.981693, 1, 0, 0.3137255, 1,
1.79434, 0.6561687, 2.470387, 1, 0, 0.3058824, 1,
1.795205, -0.116324, 2.43176, 1, 0, 0.2980392, 1,
1.813528, 1.523112, 2.229744, 1, 0, 0.2941177, 1,
1.827837, -0.6270993, 1.816666, 1, 0, 0.2862745, 1,
1.830508, 0.9220778, 0.1195542, 1, 0, 0.282353, 1,
1.834143, 1.467069, 0.6559951, 1, 0, 0.2745098, 1,
1.837445, -0.3137026, 2.617445, 1, 0, 0.2705882, 1,
1.841827, -0.3353028, 0.9469879, 1, 0, 0.2627451, 1,
1.866651, -0.7872595, 1.641024, 1, 0, 0.2588235, 1,
1.887306, -1.311939, 2.260793, 1, 0, 0.2509804, 1,
1.888997, -0.06592381, 2.160938, 1, 0, 0.2470588, 1,
1.890158, -0.9449664, 2.12126, 1, 0, 0.2392157, 1,
1.917634, -1.456111, 2.476631, 1, 0, 0.2352941, 1,
1.919313, -0.5995784, 2.857145, 1, 0, 0.227451, 1,
1.9222, 0.4660669, 0.7915792, 1, 0, 0.2235294, 1,
1.943401, 0.9747938, -0.00216638, 1, 0, 0.2156863, 1,
1.971906, -1.092086, 0.7347941, 1, 0, 0.2117647, 1,
2.002606, 0.871388, 1.957306, 1, 0, 0.2039216, 1,
2.015462, -1.805909, 1.2004, 1, 0, 0.1960784, 1,
2.047268, 0.9608701, 1.65021, 1, 0, 0.1921569, 1,
2.05136, -0.3055166, 0.9128878, 1, 0, 0.1843137, 1,
2.06491, -0.8111261, 0.3145126, 1, 0, 0.1803922, 1,
2.076372, -2.04268, 1.794544, 1, 0, 0.172549, 1,
2.096013, -1.076981, 1.318294, 1, 0, 0.1686275, 1,
2.106134, -1.240292, 0.8938667, 1, 0, 0.1607843, 1,
2.107044, -0.4314505, 1.183427, 1, 0, 0.1568628, 1,
2.112873, 0.8390993, 0.775754, 1, 0, 0.1490196, 1,
2.132269, 1.091265, 1.458385, 1, 0, 0.145098, 1,
2.153607, -1.367942, 2.69749, 1, 0, 0.1372549, 1,
2.164189, 0.3745134, 1.521949, 1, 0, 0.1333333, 1,
2.198201, -1.482514, 4.0387, 1, 0, 0.1254902, 1,
2.22118, -1.788, 1.03499, 1, 0, 0.1215686, 1,
2.224653, -0.846714, 2.0747, 1, 0, 0.1137255, 1,
2.247099, 0.5577465, 2.687041, 1, 0, 0.1098039, 1,
2.254226, 0.3663936, 1.879369, 1, 0, 0.1019608, 1,
2.292474, 0.5440302, 3.001315, 1, 0, 0.09411765, 1,
2.308492, 0.4627441, 0.5970121, 1, 0, 0.09019608, 1,
2.351318, 1.154366, -1.535485, 1, 0, 0.08235294, 1,
2.351358, -1.633326, -2.10608, 1, 0, 0.07843138, 1,
2.393052, -0.9107519, 0.6109004, 1, 0, 0.07058824, 1,
2.530535, 1.213366, 1.896978, 1, 0, 0.06666667, 1,
2.616212, -1.245313, 2.261004, 1, 0, 0.05882353, 1,
2.673584, -1.685928, 3.217056, 1, 0, 0.05490196, 1,
2.696485, -0.7534589, 2.454906, 1, 0, 0.04705882, 1,
2.750779, 0.4277335, 0.4341277, 1, 0, 0.04313726, 1,
2.751706, -1.206425, 1.587943, 1, 0, 0.03529412, 1,
2.770254, -1.037868, 1.986703, 1, 0, 0.03137255, 1,
2.841959, 1.62877, 0.33683, 1, 0, 0.02352941, 1,
2.8435, 0.4370422, -0.1216592, 1, 0, 0.01960784, 1,
3.358452, 0.1710144, 1.73718, 1, 0, 0.01176471, 1,
3.44006, 0.3266686, 0.6364976, 1, 0, 0.007843138, 1
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
0.3303927, -4.131036, -7.061921, 0, -0.5, 0.5, 0.5,
0.3303927, -4.131036, -7.061921, 1, -0.5, 0.5, 0.5,
0.3303927, -4.131036, -7.061921, 1, 1.5, 0.5, 0.5,
0.3303927, -4.131036, -7.061921, 0, 1.5, 0.5, 0.5
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
-3.833452, 0.269246, -7.061921, 0, -0.5, 0.5, 0.5,
-3.833452, 0.269246, -7.061921, 1, -0.5, 0.5, 0.5,
-3.833452, 0.269246, -7.061921, 1, 1.5, 0.5, 0.5,
-3.833452, 0.269246, -7.061921, 0, 1.5, 0.5, 0.5
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
-3.833452, -4.131036, -0.0487237, 0, -0.5, 0.5, 0.5,
-3.833452, -4.131036, -0.0487237, 1, -0.5, 0.5, 0.5,
-3.833452, -4.131036, -0.0487237, 1, 1.5, 0.5, 0.5,
-3.833452, -4.131036, -0.0487237, 0, 1.5, 0.5, 0.5
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
-2, -3.115586, -5.443491,
3, -3.115586, -5.443491,
-2, -3.115586, -5.443491,
-2, -3.284828, -5.713229,
-1, -3.115586, -5.443491,
-1, -3.284828, -5.713229,
0, -3.115586, -5.443491,
0, -3.284828, -5.713229,
1, -3.115586, -5.443491,
1, -3.284828, -5.713229,
2, -3.115586, -5.443491,
2, -3.284828, -5.713229,
3, -3.115586, -5.443491,
3, -3.284828, -5.713229
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
-2, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
-2, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
-2, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
-2, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5,
-1, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
-1, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
-1, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
-1, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5,
0, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
0, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
0, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
0, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5,
1, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
1, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
1, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
1, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5,
2, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
2, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
2, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
2, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5,
3, -3.623311, -6.252706, 0, -0.5, 0.5, 0.5,
3, -3.623311, -6.252706, 1, -0.5, 0.5, 0.5,
3, -3.623311, -6.252706, 1, 1.5, 0.5, 0.5,
3, -3.623311, -6.252706, 0, 1.5, 0.5, 0.5
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
-2.872565, -3, -5.443491,
-2.872565, 3, -5.443491,
-2.872565, -3, -5.443491,
-3.032713, -3, -5.713229,
-2.872565, -2, -5.443491,
-3.032713, -2, -5.713229,
-2.872565, -1, -5.443491,
-3.032713, -1, -5.713229,
-2.872565, 0, -5.443491,
-3.032713, 0, -5.713229,
-2.872565, 1, -5.443491,
-3.032713, 1, -5.713229,
-2.872565, 2, -5.443491,
-3.032713, 2, -5.713229,
-2.872565, 3, -5.443491,
-3.032713, 3, -5.713229
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
-3.353008, -3, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, -3, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, -3, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, -3, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, -2, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, -2, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, -2, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, -2, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, -1, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, -1, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, -1, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, -1, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, 0, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, 0, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, 0, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, 0, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, 1, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, 1, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, 1, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, 1, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, 2, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, 2, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, 2, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, 2, -6.252706, 0, 1.5, 0.5, 0.5,
-3.353008, 3, -6.252706, 0, -0.5, 0.5, 0.5,
-3.353008, 3, -6.252706, 1, -0.5, 0.5, 0.5,
-3.353008, 3, -6.252706, 1, 1.5, 0.5, 0.5,
-3.353008, 3, -6.252706, 0, 1.5, 0.5, 0.5
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
-2.872565, -3.115586, -4,
-2.872565, -3.115586, 4,
-2.872565, -3.115586, -4,
-3.032713, -3.284828, -4,
-2.872565, -3.115586, -2,
-3.032713, -3.284828, -2,
-2.872565, -3.115586, 0,
-3.032713, -3.284828, 0,
-2.872565, -3.115586, 2,
-3.032713, -3.284828, 2,
-2.872565, -3.115586, 4,
-3.032713, -3.284828, 4
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
-3.353008, -3.623311, -4, 0, -0.5, 0.5, 0.5,
-3.353008, -3.623311, -4, 1, -0.5, 0.5, 0.5,
-3.353008, -3.623311, -4, 1, 1.5, 0.5, 0.5,
-3.353008, -3.623311, -4, 0, 1.5, 0.5, 0.5,
-3.353008, -3.623311, -2, 0, -0.5, 0.5, 0.5,
-3.353008, -3.623311, -2, 1, -0.5, 0.5, 0.5,
-3.353008, -3.623311, -2, 1, 1.5, 0.5, 0.5,
-3.353008, -3.623311, -2, 0, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 0, 0, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 0, 1, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 0, 1, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 0, 0, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 2, 0, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 2, 1, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 2, 1, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 2, 0, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 4, 0, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 4, 1, -0.5, 0.5, 0.5,
-3.353008, -3.623311, 4, 1, 1.5, 0.5, 0.5,
-3.353008, -3.623311, 4, 0, 1.5, 0.5, 0.5
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
-2.872565, -3.115586, -5.443491,
-2.872565, 3.654078, -5.443491,
-2.872565, -3.115586, 5.346044,
-2.872565, 3.654078, 5.346044,
-2.872565, -3.115586, -5.443491,
-2.872565, -3.115586, 5.346044,
-2.872565, 3.654078, -5.443491,
-2.872565, 3.654078, 5.346044,
-2.872565, -3.115586, -5.443491,
3.53335, -3.115586, -5.443491,
-2.872565, -3.115586, 5.346044,
3.53335, -3.115586, 5.346044,
-2.872565, 3.654078, -5.443491,
3.53335, 3.654078, -5.443491,
-2.872565, 3.654078, 5.346044,
3.53335, 3.654078, 5.346044,
3.53335, -3.115586, -5.443491,
3.53335, 3.654078, -5.443491,
3.53335, -3.115586, 5.346044,
3.53335, 3.654078, 5.346044,
3.53335, -3.115586, -5.443491,
3.53335, -3.115586, 5.346044,
3.53335, 3.654078, -5.443491,
3.53335, 3.654078, 5.346044
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
var radius = 7.613263;
var distance = 33.87226;
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
mvMatrix.translate( -0.3303927, -0.269246, 0.0487237 );
mvMatrix.scale( 1.285001, 1.215955, 0.7629253 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87226);
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


