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
-3.074471, 0.5295146, -2.453019, 1, 0, 0, 1,
-3.019326, 1.362825, -0.6641755, 1, 0.007843138, 0, 1,
-2.876197, 1.496417, -0.07498959, 1, 0.01176471, 0, 1,
-2.825444, -0.1754875, -1.200269, 1, 0.01960784, 0, 1,
-2.78411, 0.1577751, -0.9300436, 1, 0.02352941, 0, 1,
-2.692281, 0.2573373, -1.568963, 1, 0.03137255, 0, 1,
-2.554862, 0.2108427, -1.103107, 1, 0.03529412, 0, 1,
-2.452683, -1.178678, -0.4527766, 1, 0.04313726, 0, 1,
-2.427192, 1.688818, -1.738093, 1, 0.04705882, 0, 1,
-2.388063, 0.1997603, -0.6278389, 1, 0.05490196, 0, 1,
-2.374611, -0.6713051, -0.4516116, 1, 0.05882353, 0, 1,
-2.31078, 0.3676433, -2.526629, 1, 0.06666667, 0, 1,
-2.310739, 1.001905, -2.462533, 1, 0.07058824, 0, 1,
-2.265965, -0.7681455, -2.759937, 1, 0.07843138, 0, 1,
-2.240908, 1.708337, -0.7838986, 1, 0.08235294, 0, 1,
-2.21456, -0.139489, -0.3521433, 1, 0.09019608, 0, 1,
-2.191252, -0.5076018, -0.7908891, 1, 0.09411765, 0, 1,
-2.159931, -0.06122621, -0.8383055, 1, 0.1019608, 0, 1,
-2.033224, 0.9823263, -1.719788, 1, 0.1098039, 0, 1,
-2.012748, -1.434644, -2.862144, 1, 0.1137255, 0, 1,
-2.010774, -1.025885, -1.82528, 1, 0.1215686, 0, 1,
-2.009873, 0.599381, -0.07014412, 1, 0.1254902, 0, 1,
-1.985006, -1.876644, -2.94626, 1, 0.1333333, 0, 1,
-1.953081, 0.815266, -2.200169, 1, 0.1372549, 0, 1,
-1.896481, 0.1351783, -0.9384859, 1, 0.145098, 0, 1,
-1.878797, -0.2872126, -1.641779, 1, 0.1490196, 0, 1,
-1.849733, -1.124547, -1.833801, 1, 0.1568628, 0, 1,
-1.844818, 1.00104, -1.050507, 1, 0.1607843, 0, 1,
-1.831756, -1.34674, -3.16089, 1, 0.1686275, 0, 1,
-1.806725, -0.1131626, -0.7077029, 1, 0.172549, 0, 1,
-1.805352, -0.5756971, -1.967525, 1, 0.1803922, 0, 1,
-1.75454, -0.5980049, -2.640604, 1, 0.1843137, 0, 1,
-1.739122, 0.3772753, -0.1550813, 1, 0.1921569, 0, 1,
-1.735809, -0.0170822, -2.709716, 1, 0.1960784, 0, 1,
-1.687727, 1.276341, -0.9671515, 1, 0.2039216, 0, 1,
-1.675475, 0.8791894, -2.047383, 1, 0.2117647, 0, 1,
-1.627421, -0.7810801, 0.3300866, 1, 0.2156863, 0, 1,
-1.611911, -1.125115, -1.408341, 1, 0.2235294, 0, 1,
-1.610574, 0.2850398, -1.435455, 1, 0.227451, 0, 1,
-1.607329, -1.47611, -2.06536, 1, 0.2352941, 0, 1,
-1.593787, -1.810207, -1.19665, 1, 0.2392157, 0, 1,
-1.592625, -0.6955942, -2.674795, 1, 0.2470588, 0, 1,
-1.582106, -1.849354, -1.50821, 1, 0.2509804, 0, 1,
-1.573023, 0.8333507, -0.6146746, 1, 0.2588235, 0, 1,
-1.571623, -0.2923285, -2.067789, 1, 0.2627451, 0, 1,
-1.569949, 0.3910141, -1.066957, 1, 0.2705882, 0, 1,
-1.56479, -0.8627193, -3.408452, 1, 0.2745098, 0, 1,
-1.56139, 0.4039232, -1.247254, 1, 0.282353, 0, 1,
-1.557694, 0.4368124, -2.502485, 1, 0.2862745, 0, 1,
-1.550628, -1.011207, -1.772035, 1, 0.2941177, 0, 1,
-1.548301, -1.824466, -2.903002, 1, 0.3019608, 0, 1,
-1.536242, -0.7075269, -3.337757, 1, 0.3058824, 0, 1,
-1.530706, 0.591284, -1.761311, 1, 0.3137255, 0, 1,
-1.5281, 0.5169607, -1.948815, 1, 0.3176471, 0, 1,
-1.500212, -0.794949, -1.440982, 1, 0.3254902, 0, 1,
-1.486425, 0.2070978, -0.528294, 1, 0.3294118, 0, 1,
-1.482158, -0.8079665, -3.557066, 1, 0.3372549, 0, 1,
-1.481068, 2.367471, -0.1236819, 1, 0.3411765, 0, 1,
-1.480954, 0.1499736, -0.1099812, 1, 0.3490196, 0, 1,
-1.476081, 0.3680412, -0.9916312, 1, 0.3529412, 0, 1,
-1.473843, 0.6796727, -0.2678736, 1, 0.3607843, 0, 1,
-1.473626, -0.4079632, -0.9601699, 1, 0.3647059, 0, 1,
-1.458869, -2.573489, -0.07961464, 1, 0.372549, 0, 1,
-1.458739, 0.7499653, -0.1787129, 1, 0.3764706, 0, 1,
-1.450695, 0.7196397, -1.624689, 1, 0.3843137, 0, 1,
-1.446347, -0.9741001, -2.57897, 1, 0.3882353, 0, 1,
-1.44528, 0.6659644, -0.4247747, 1, 0.3960784, 0, 1,
-1.437887, -0.3554547, -0.283974, 1, 0.4039216, 0, 1,
-1.435341, -0.6023441, -2.173462, 1, 0.4078431, 0, 1,
-1.434269, 0.6324399, 0.4927953, 1, 0.4156863, 0, 1,
-1.431512, 1.371709, -1.681325, 1, 0.4196078, 0, 1,
-1.429132, -1.076932, -1.960039, 1, 0.427451, 0, 1,
-1.419255, 0.920646, 0.6719583, 1, 0.4313726, 0, 1,
-1.416273, -0.2777257, -1.810578, 1, 0.4392157, 0, 1,
-1.415218, 0.4410815, -2.073711, 1, 0.4431373, 0, 1,
-1.40886, 0.6873192, -0.4277702, 1, 0.4509804, 0, 1,
-1.407021, -0.07541016, -2.207782, 1, 0.454902, 0, 1,
-1.40646, -0.275284, -2.811609, 1, 0.4627451, 0, 1,
-1.405861, 0.6757643, -1.566718, 1, 0.4666667, 0, 1,
-1.394697, 0.2182196, -2.757657, 1, 0.4745098, 0, 1,
-1.393085, 2.399344, -0.8323849, 1, 0.4784314, 0, 1,
-1.392513, -0.1130582, -2.121145, 1, 0.4862745, 0, 1,
-1.391275, 0.04776416, -0.9175618, 1, 0.4901961, 0, 1,
-1.3895, -0.4250614, -3.22001, 1, 0.4980392, 0, 1,
-1.380737, 1.658399, -0.6714341, 1, 0.5058824, 0, 1,
-1.371872, 0.4181996, -0.9789833, 1, 0.509804, 0, 1,
-1.361347, -2.136419, -3.156482, 1, 0.5176471, 0, 1,
-1.354695, -0.2087289, -3.00578, 1, 0.5215687, 0, 1,
-1.354607, 1.45488, -1.154987, 1, 0.5294118, 0, 1,
-1.33119, 1.726899, 0.2628722, 1, 0.5333334, 0, 1,
-1.330261, -0.5156422, -3.400198, 1, 0.5411765, 0, 1,
-1.324176, -1.10517, -2.403932, 1, 0.5450981, 0, 1,
-1.32162, 2.005227, -2.098129, 1, 0.5529412, 0, 1,
-1.31417, -0.952638, -3.238818, 1, 0.5568628, 0, 1,
-1.31097, -0.4911128, -2.190202, 1, 0.5647059, 0, 1,
-1.298164, 0.2362472, -0.7586862, 1, 0.5686275, 0, 1,
-1.291512, 0.9015068, -1.779741, 1, 0.5764706, 0, 1,
-1.289348, -1.26887, -3.008584, 1, 0.5803922, 0, 1,
-1.286167, 0.3791936, -1.646552, 1, 0.5882353, 0, 1,
-1.271028, -1.343033, -2.964816, 1, 0.5921569, 0, 1,
-1.267677, 1.488495, -0.3291067, 1, 0.6, 0, 1,
-1.266291, 0.6638243, -0.001428233, 1, 0.6078432, 0, 1,
-1.258031, 0.2751278, -0.4411127, 1, 0.6117647, 0, 1,
-1.2544, -0.2469231, -2.40309, 1, 0.6196079, 0, 1,
-1.253038, 0.9079281, -1.418152, 1, 0.6235294, 0, 1,
-1.25169, 0.2796518, -1.296531, 1, 0.6313726, 0, 1,
-1.24093, -0.5207048, -2.454208, 1, 0.6352941, 0, 1,
-1.236451, 1.274712, -1.760546, 1, 0.6431373, 0, 1,
-1.233474, 0.1215511, -1.088937, 1, 0.6470588, 0, 1,
-1.229401, -0.1538014, -2.636446, 1, 0.654902, 0, 1,
-1.229259, -1.474727, -3.331564, 1, 0.6588235, 0, 1,
-1.222208, 0.7302613, -0.781958, 1, 0.6666667, 0, 1,
-1.207211, 0.05439532, -0.2767064, 1, 0.6705883, 0, 1,
-1.205465, 1.064223, -1.724251, 1, 0.6784314, 0, 1,
-1.204231, -0.6197737, -2.138426, 1, 0.682353, 0, 1,
-1.19118, -0.5297496, -2.342954, 1, 0.6901961, 0, 1,
-1.184434, -2.052674, -2.166539, 1, 0.6941177, 0, 1,
-1.16915, -0.5463371, -2.212003, 1, 0.7019608, 0, 1,
-1.168651, 0.3669929, -2.361965, 1, 0.7098039, 0, 1,
-1.165258, -0.5237001, -2.82126, 1, 0.7137255, 0, 1,
-1.160347, 0.8793932, -0.8551347, 1, 0.7215686, 0, 1,
-1.156392, -1.732875, -2.66768, 1, 0.7254902, 0, 1,
-1.155849, 0.8219978, -0.8445974, 1, 0.7333333, 0, 1,
-1.150996, -0.4349013, -0.2674128, 1, 0.7372549, 0, 1,
-1.141843, -1.014248, -2.330577, 1, 0.7450981, 0, 1,
-1.116042, 0.7814577, -1.739205, 1, 0.7490196, 0, 1,
-1.1137, -0.2038886, -2.047141, 1, 0.7568628, 0, 1,
-1.111721, -0.09067494, -2.009198, 1, 0.7607843, 0, 1,
-1.111262, 2.349201, -1.599629, 1, 0.7686275, 0, 1,
-1.105151, 1.954312, -0.3548494, 1, 0.772549, 0, 1,
-1.101323, 1.030161, 0.3696353, 1, 0.7803922, 0, 1,
-1.095205, 0.4919613, -1.574952, 1, 0.7843137, 0, 1,
-1.0842, -0.296199, -2.643455, 1, 0.7921569, 0, 1,
-1.079122, -1.572186, -2.509905, 1, 0.7960784, 0, 1,
-1.07904, 0.8737287, -1.877014, 1, 0.8039216, 0, 1,
-1.069476, 0.8905634, -3.270717, 1, 0.8117647, 0, 1,
-1.062991, -0.1631694, -0.8511286, 1, 0.8156863, 0, 1,
-1.062028, 1.127009, -0.6024869, 1, 0.8235294, 0, 1,
-1.057095, -2.781827, -3.935593, 1, 0.827451, 0, 1,
-1.054222, 0.4680435, -1.324446, 1, 0.8352941, 0, 1,
-1.051352, -1.190989, -3.672406, 1, 0.8392157, 0, 1,
-1.049281, -0.6784208, -1.31577, 1, 0.8470588, 0, 1,
-1.047654, 0.9292696, -0.3548259, 1, 0.8509804, 0, 1,
-1.04285, 0.5139954, 0.2760362, 1, 0.8588235, 0, 1,
-1.0389, -0.3873354, -2.5844, 1, 0.8627451, 0, 1,
-1.032747, -1.965986, -3.975843, 1, 0.8705882, 0, 1,
-1.031785, -0.184141, -1.204821, 1, 0.8745098, 0, 1,
-1.029759, -0.3345799, -2.467825, 1, 0.8823529, 0, 1,
-1.029717, -0.3612588, -1.063277, 1, 0.8862745, 0, 1,
-1.026241, 1.532169, 0.2476502, 1, 0.8941177, 0, 1,
-1.019794, -0.09065558, -2.469783, 1, 0.8980392, 0, 1,
-1.019566, 0.610342, 0.1924988, 1, 0.9058824, 0, 1,
-1.01703, -0.5982504, -3.446822, 1, 0.9137255, 0, 1,
-1.014421, -1.173922, -1.497345, 1, 0.9176471, 0, 1,
-1.013545, -0.4422648, -1.206508, 1, 0.9254902, 0, 1,
-1.008765, 1.312195, -1.401541, 1, 0.9294118, 0, 1,
-1.008625, 0.8710505, 0.02592541, 1, 0.9372549, 0, 1,
-1.00355, 0.4793652, -1.584183, 1, 0.9411765, 0, 1,
-1.003121, -0.4040363, -2.380621, 1, 0.9490196, 0, 1,
-1.001069, 0.4077896, -0.8661004, 1, 0.9529412, 0, 1,
-0.9933737, 1.697063, 0.9541765, 1, 0.9607843, 0, 1,
-0.9656047, -0.5721275, -1.879219, 1, 0.9647059, 0, 1,
-0.9642452, -2.217421, -3.544317, 1, 0.972549, 0, 1,
-0.9609718, -0.723282, -2.46773, 1, 0.9764706, 0, 1,
-0.9607605, -1.179761, -3.471249, 1, 0.9843137, 0, 1,
-0.9596952, 0.219477, -1.18192, 1, 0.9882353, 0, 1,
-0.957356, 0.02655285, -2.44258, 1, 0.9960784, 0, 1,
-0.9534887, -0.6931179, -1.684146, 0.9960784, 1, 0, 1,
-0.9533498, 1.199051, -1.377591, 0.9921569, 1, 0, 1,
-0.9531386, 0.3775891, -1.496751, 0.9843137, 1, 0, 1,
-0.9494092, 1.126973, -0.5879796, 0.9803922, 1, 0, 1,
-0.9413143, -0.638073, -3.547386, 0.972549, 1, 0, 1,
-0.9391564, 1.039383, -0.6496191, 0.9686275, 1, 0, 1,
-0.9298544, -1.30917, -2.431329, 0.9607843, 1, 0, 1,
-0.9277012, -0.5325182, -1.435779, 0.9568627, 1, 0, 1,
-0.9273201, 1.401157, 0.5346362, 0.9490196, 1, 0, 1,
-0.9242855, -1.896039, -1.120909, 0.945098, 1, 0, 1,
-0.915902, -0.7579274, -0.9084079, 0.9372549, 1, 0, 1,
-0.9153526, -1.251568, -3.889577, 0.9333333, 1, 0, 1,
-0.9139417, -0.1562037, -2.294492, 0.9254902, 1, 0, 1,
-0.9088646, 0.2697882, -2.095112, 0.9215686, 1, 0, 1,
-0.9039907, -1.235804, -1.395097, 0.9137255, 1, 0, 1,
-0.9010469, -1.909271, -3.441286, 0.9098039, 1, 0, 1,
-0.8984058, 1.144469, -0.1508173, 0.9019608, 1, 0, 1,
-0.8944811, -1.950995, -1.211822, 0.8941177, 1, 0, 1,
-0.8826491, -1.595864, -3.983579, 0.8901961, 1, 0, 1,
-0.8813836, 0.7956795, 0.7817729, 0.8823529, 1, 0, 1,
-0.8810504, -3.631024, -1.877192, 0.8784314, 1, 0, 1,
-0.8743193, 0.5223311, -1.559353, 0.8705882, 1, 0, 1,
-0.8711541, 0.9652497, 0.6206445, 0.8666667, 1, 0, 1,
-0.8690317, -1.946655, -2.748432, 0.8588235, 1, 0, 1,
-0.8652534, -0.2687267, -1.079252, 0.854902, 1, 0, 1,
-0.8647397, 1.668388, -0.966406, 0.8470588, 1, 0, 1,
-0.8576646, 2.133016, -0.3078169, 0.8431373, 1, 0, 1,
-0.8569965, 0.2193524, -0.4562796, 0.8352941, 1, 0, 1,
-0.8561462, 0.003148023, -1.804591, 0.8313726, 1, 0, 1,
-0.8512911, 0.5698977, 0.416741, 0.8235294, 1, 0, 1,
-0.8502342, 0.8250746, -0.9387526, 0.8196079, 1, 0, 1,
-0.8486144, -0.1208977, -0.8042577, 0.8117647, 1, 0, 1,
-0.8473047, 0.05702091, -0.6048224, 0.8078431, 1, 0, 1,
-0.846568, -0.531309, -2.252176, 0.8, 1, 0, 1,
-0.8440788, -1.608015, -3.023008, 0.7921569, 1, 0, 1,
-0.840213, 0.6533769, 0.5437846, 0.7882353, 1, 0, 1,
-0.8393596, 0.4842269, -0.1995978, 0.7803922, 1, 0, 1,
-0.8348337, 0.7136195, -1.414707, 0.7764706, 1, 0, 1,
-0.8332824, 0.1970599, -1.752669, 0.7686275, 1, 0, 1,
-0.829859, 0.01505267, -0.4003258, 0.7647059, 1, 0, 1,
-0.8287488, 0.07093555, -2.290607, 0.7568628, 1, 0, 1,
-0.823257, -1.230875, -2.975667, 0.7529412, 1, 0, 1,
-0.8199328, -1.227043, -2.333276, 0.7450981, 1, 0, 1,
-0.8192084, -1.226223, -3.304308, 0.7411765, 1, 0, 1,
-0.8159441, 0.2229245, -2.076448, 0.7333333, 1, 0, 1,
-0.814312, -0.7614383, -2.174452, 0.7294118, 1, 0, 1,
-0.8125885, 0.9783218, -1.076775, 0.7215686, 1, 0, 1,
-0.8105567, 0.05632116, -0.9273533, 0.7176471, 1, 0, 1,
-0.798741, 0.3126137, -0.4656411, 0.7098039, 1, 0, 1,
-0.7986789, 1.361086, 0.1038702, 0.7058824, 1, 0, 1,
-0.7957591, -2.198006, -2.634669, 0.6980392, 1, 0, 1,
-0.795449, -1.600295, -3.001735, 0.6901961, 1, 0, 1,
-0.7942871, -1.849209, -1.434993, 0.6862745, 1, 0, 1,
-0.7939417, 0.02746609, -2.0342, 0.6784314, 1, 0, 1,
-0.7933028, 0.1348742, -1.271335, 0.6745098, 1, 0, 1,
-0.7904369, 0.9371578, -2.071198, 0.6666667, 1, 0, 1,
-0.7887354, 1.384406, 0.2928389, 0.6627451, 1, 0, 1,
-0.7882944, -0.9604534, -3.323589, 0.654902, 1, 0, 1,
-0.7880213, -0.8601263, -3.279343, 0.6509804, 1, 0, 1,
-0.7854768, -1.502798, -2.989958, 0.6431373, 1, 0, 1,
-0.7817016, -0.09341577, -1.805882, 0.6392157, 1, 0, 1,
-0.7808288, 0.4848849, -1.332916, 0.6313726, 1, 0, 1,
-0.7790449, -0.08530826, -2.315173, 0.627451, 1, 0, 1,
-0.7718605, -0.6297635, -2.280758, 0.6196079, 1, 0, 1,
-0.768419, -0.3050626, -1.900554, 0.6156863, 1, 0, 1,
-0.7683073, -0.9385457, -1.775859, 0.6078432, 1, 0, 1,
-0.767233, 0.6254265, 1.393117, 0.6039216, 1, 0, 1,
-0.7659562, 1.112395, -1.462394, 0.5960785, 1, 0, 1,
-0.7659028, 0.4468789, -0.9165694, 0.5882353, 1, 0, 1,
-0.7640595, 1.014189, 0.4747471, 0.5843138, 1, 0, 1,
-0.7571416, 0.5784169, -2.285001, 0.5764706, 1, 0, 1,
-0.7479436, -0.6496498, -1.077043, 0.572549, 1, 0, 1,
-0.744478, 0.9123002, -0.8566957, 0.5647059, 1, 0, 1,
-0.7391815, 0.4025056, -0.2674556, 0.5607843, 1, 0, 1,
-0.7270728, 0.4129061, -2.121424, 0.5529412, 1, 0, 1,
-0.7147464, 0.4961362, -0.6789659, 0.5490196, 1, 0, 1,
-0.7132866, 0.7788123, -2.112725, 0.5411765, 1, 0, 1,
-0.7032424, 0.8108188, -0.5526337, 0.5372549, 1, 0, 1,
-0.7001903, -0.3923947, -2.190361, 0.5294118, 1, 0, 1,
-0.6878137, 0.05695573, -1.622311, 0.5254902, 1, 0, 1,
-0.6877869, 0.8926021, 0.1106654, 0.5176471, 1, 0, 1,
-0.6859307, -0.5218992, -3.0988, 0.5137255, 1, 0, 1,
-0.6767169, 0.9595326, -1.237031, 0.5058824, 1, 0, 1,
-0.6726385, -0.8833536, -4.08233, 0.5019608, 1, 0, 1,
-0.6714347, -0.2989748, -2.802882, 0.4941176, 1, 0, 1,
-0.6693608, 0.05963278, -1.245406, 0.4862745, 1, 0, 1,
-0.6649499, 1.732113, -0.1179581, 0.4823529, 1, 0, 1,
-0.658966, -1.499028, -2.759713, 0.4745098, 1, 0, 1,
-0.6559277, -0.07228458, -1.236507, 0.4705882, 1, 0, 1,
-0.6524942, -0.4031114, -3.467336, 0.4627451, 1, 0, 1,
-0.6510834, 0.05786197, -1.072283, 0.4588235, 1, 0, 1,
-0.648313, -2.136928, -3.880239, 0.4509804, 1, 0, 1,
-0.644838, -0.8506401, -0.3911276, 0.4470588, 1, 0, 1,
-0.6379731, 0.4595307, -0.5088438, 0.4392157, 1, 0, 1,
-0.6342556, 1.062937, 0.8774001, 0.4352941, 1, 0, 1,
-0.6325684, -0.8637163, -1.04895, 0.427451, 1, 0, 1,
-0.6313728, 0.2995479, -1.341364, 0.4235294, 1, 0, 1,
-0.6295796, -1.139402, -3.292393, 0.4156863, 1, 0, 1,
-0.6281338, 1.464862, -1.925313, 0.4117647, 1, 0, 1,
-0.6260151, 1.37541, -1.051256, 0.4039216, 1, 0, 1,
-0.6214589, 0.1924096, -0.6050619, 0.3960784, 1, 0, 1,
-0.6195683, -0.7159213, -2.551354, 0.3921569, 1, 0, 1,
-0.6183987, 0.6020107, -1.119071, 0.3843137, 1, 0, 1,
-0.6183432, 0.4041458, -1.024862, 0.3803922, 1, 0, 1,
-0.6179129, -0.2651474, -2.078614, 0.372549, 1, 0, 1,
-0.6142944, 0.4715987, 0.1339054, 0.3686275, 1, 0, 1,
-0.6124101, 0.3002979, -0.9327497, 0.3607843, 1, 0, 1,
-0.6122382, 0.2799004, -0.6663725, 0.3568628, 1, 0, 1,
-0.6103153, 1.114092, 0.1985955, 0.3490196, 1, 0, 1,
-0.6102834, 1.355824, -0.6063964, 0.345098, 1, 0, 1,
-0.6071979, 0.2827763, -3.034495, 0.3372549, 1, 0, 1,
-0.6054479, -0.4916249, -1.768447, 0.3333333, 1, 0, 1,
-0.6038231, -1.226799, -3.517963, 0.3254902, 1, 0, 1,
-0.5997754, -1.626106, -1.048303, 0.3215686, 1, 0, 1,
-0.5994623, -0.6515461, -1.340305, 0.3137255, 1, 0, 1,
-0.599127, -0.9550437, -1.796288, 0.3098039, 1, 0, 1,
-0.5953814, -1.15148, -1.875594, 0.3019608, 1, 0, 1,
-0.5911604, -1.625882, -3.111172, 0.2941177, 1, 0, 1,
-0.5853818, 0.08396744, -2.374154, 0.2901961, 1, 0, 1,
-0.582471, -0.8691144, -0.7976927, 0.282353, 1, 0, 1,
-0.5790636, 2.366163, 0.8201141, 0.2784314, 1, 0, 1,
-0.5751902, 1.214131, 0.4203085, 0.2705882, 1, 0, 1,
-0.5751734, -0.08841311, -2.773368, 0.2666667, 1, 0, 1,
-0.5707137, -0.7212642, -3.443071, 0.2588235, 1, 0, 1,
-0.5646017, 0.2716985, -1.502295, 0.254902, 1, 0, 1,
-0.561596, -1.481311, -3.85987, 0.2470588, 1, 0, 1,
-0.5596906, 0.3340881, -1.338197, 0.2431373, 1, 0, 1,
-0.5535367, -1.954879, -3.73965, 0.2352941, 1, 0, 1,
-0.5521811, -2.86234, -2.781678, 0.2313726, 1, 0, 1,
-0.5504547, 1.774292, -0.1557697, 0.2235294, 1, 0, 1,
-0.5490218, 0.9762951, -0.4212559, 0.2196078, 1, 0, 1,
-0.5443756, -1.549245, -1.844581, 0.2117647, 1, 0, 1,
-0.5395476, -1.258563, -4.068309, 0.2078431, 1, 0, 1,
-0.5393041, -1.546317, -0.6202368, 0.2, 1, 0, 1,
-0.5382182, 0.007229919, -1.2774, 0.1921569, 1, 0, 1,
-0.5361426, 1.180848, -0.4798009, 0.1882353, 1, 0, 1,
-0.5344397, 0.9417065, 0.6212311, 0.1803922, 1, 0, 1,
-0.5321653, -0.3624781, -3.330216, 0.1764706, 1, 0, 1,
-0.5265429, -1.257316, -1.067737, 0.1686275, 1, 0, 1,
-0.5246439, 0.03220171, -1.284998, 0.1647059, 1, 0, 1,
-0.5239784, 0.270583, -0.6902769, 0.1568628, 1, 0, 1,
-0.5206154, -0.2890471, -3.206948, 0.1529412, 1, 0, 1,
-0.5168497, 0.07432449, -0.7556959, 0.145098, 1, 0, 1,
-0.5047833, 0.3350611, -0.8089129, 0.1411765, 1, 0, 1,
-0.4986194, -0.4711121, -2.41581, 0.1333333, 1, 0, 1,
-0.4964832, -0.6421389, -3.206672, 0.1294118, 1, 0, 1,
-0.4937602, -1.544712, -4.578544, 0.1215686, 1, 0, 1,
-0.4923874, -0.8252858, -1.124498, 0.1176471, 1, 0, 1,
-0.4921601, -0.9977225, -3.982264, 0.1098039, 1, 0, 1,
-0.4908749, 0.2724396, -0.5691353, 0.1058824, 1, 0, 1,
-0.4898665, 0.7292452, -1.205199, 0.09803922, 1, 0, 1,
-0.4898222, -0.3097068, -1.860802, 0.09019608, 1, 0, 1,
-0.4891701, -0.2360974, -3.489725, 0.08627451, 1, 0, 1,
-0.4872804, -2.784698, -1.156357, 0.07843138, 1, 0, 1,
-0.4851049, -1.747549, -3.65518, 0.07450981, 1, 0, 1,
-0.4843326, 1.495009, 0.5144826, 0.06666667, 1, 0, 1,
-0.4743905, -0.6522885, -2.450101, 0.0627451, 1, 0, 1,
-0.473839, -0.1989879, -1.16183, 0.05490196, 1, 0, 1,
-0.471099, -0.3332043, -4.21539, 0.05098039, 1, 0, 1,
-0.4701088, 1.636113, -2.002263, 0.04313726, 1, 0, 1,
-0.4665008, 0.03356328, -1.251806, 0.03921569, 1, 0, 1,
-0.4644, 1.279225, 0.05471448, 0.03137255, 1, 0, 1,
-0.4640556, 2.026573, 0.1080994, 0.02745098, 1, 0, 1,
-0.4599372, 0.664865, -2.27928, 0.01960784, 1, 0, 1,
-0.4585551, -1.030523, -1.356083, 0.01568628, 1, 0, 1,
-0.4570977, -0.7990022, -2.386136, 0.007843138, 1, 0, 1,
-0.4533468, 2.346269, -0.9068319, 0.003921569, 1, 0, 1,
-0.4528237, 1.920622, 1.430374, 0, 1, 0.003921569, 1,
-0.4517847, 1.429086, -0.2267903, 0, 1, 0.01176471, 1,
-0.451004, 0.1902748, -1.240531, 0, 1, 0.01568628, 1,
-0.4478143, 1.187407, 0.1908285, 0, 1, 0.02352941, 1,
-0.4426042, 0.8029086, 0.01391905, 0, 1, 0.02745098, 1,
-0.4414575, -0.4106468, -3.023526, 0, 1, 0.03529412, 1,
-0.4411977, -0.4359042, -3.181361, 0, 1, 0.03921569, 1,
-0.4411232, -0.2748087, -0.1124036, 0, 1, 0.04705882, 1,
-0.4406876, -1.056029, -1.886418, 0, 1, 0.05098039, 1,
-0.430585, -0.7669609, -2.373935, 0, 1, 0.05882353, 1,
-0.4281846, 1.479273, 1.294764, 0, 1, 0.0627451, 1,
-0.4275766, 0.753663, -1.90779, 0, 1, 0.07058824, 1,
-0.4246298, 0.6170205, -0.786729, 0, 1, 0.07450981, 1,
-0.4236661, 0.2404635, -1.034635, 0, 1, 0.08235294, 1,
-0.4234439, -0.004771596, -2.30918, 0, 1, 0.08627451, 1,
-0.4220943, -0.8577405, -2.794037, 0, 1, 0.09411765, 1,
-0.420525, 1.196242, -0.155327, 0, 1, 0.1019608, 1,
-0.4190249, -0.3796752, -2.199179, 0, 1, 0.1058824, 1,
-0.4168419, 1.828669, -0.48673, 0, 1, 0.1137255, 1,
-0.4167932, 1.123701, -2.754931, 0, 1, 0.1176471, 1,
-0.4103442, -1.03102, -4.099912, 0, 1, 0.1254902, 1,
-0.3993132, 0.2017552, -0.02409496, 0, 1, 0.1294118, 1,
-0.3958392, 0.3144249, -0.8641121, 0, 1, 0.1372549, 1,
-0.3946139, 0.4215227, -1.577875, 0, 1, 0.1411765, 1,
-0.3926054, -0.8741778, -3.951297, 0, 1, 0.1490196, 1,
-0.3892848, -0.05699015, -3.902074, 0, 1, 0.1529412, 1,
-0.386237, -1.146983, -2.499203, 0, 1, 0.1607843, 1,
-0.3838545, -0.5831381, -1.996652, 0, 1, 0.1647059, 1,
-0.3818299, -0.4049595, -2.205621, 0, 1, 0.172549, 1,
-0.3768969, -0.3159191, -2.752851, 0, 1, 0.1764706, 1,
-0.3764892, 1.353323, 0.6303754, 0, 1, 0.1843137, 1,
-0.3758659, 0.5507704, -0.8348179, 0, 1, 0.1882353, 1,
-0.3721306, 0.6544757, -1.357974, 0, 1, 0.1960784, 1,
-0.3702665, -1.271595, -3.651019, 0, 1, 0.2039216, 1,
-0.3573921, 0.1583457, 0.3081264, 0, 1, 0.2078431, 1,
-0.3563593, -0.8923586, -2.948632, 0, 1, 0.2156863, 1,
-0.3560416, 0.1518192, -0.1697672, 0, 1, 0.2196078, 1,
-0.3544436, -0.9941669, -2.867199, 0, 1, 0.227451, 1,
-0.3540444, -1.152903, -5.019096, 0, 1, 0.2313726, 1,
-0.3493866, -0.7504166, -2.095248, 0, 1, 0.2392157, 1,
-0.3452826, -0.002845632, -3.39124, 0, 1, 0.2431373, 1,
-0.3382514, -1.36567, -5.377847, 0, 1, 0.2509804, 1,
-0.337155, -0.5139929, -2.343381, 0, 1, 0.254902, 1,
-0.3348894, -0.2823861, -3.783238, 0, 1, 0.2627451, 1,
-0.3317382, 1.787782, -0.5348859, 0, 1, 0.2666667, 1,
-0.3312888, 0.4502198, 0.6304694, 0, 1, 0.2745098, 1,
-0.3279617, -0.5486037, -1.618965, 0, 1, 0.2784314, 1,
-0.3277109, 0.4837342, -0.1573239, 0, 1, 0.2862745, 1,
-0.3260326, 0.2291973, -0.2639836, 0, 1, 0.2901961, 1,
-0.3249138, 0.727161, 0.072869, 0, 1, 0.2980392, 1,
-0.3247371, -0.6820779, -2.460892, 0, 1, 0.3058824, 1,
-0.3229914, -1.019344, -1.806598, 0, 1, 0.3098039, 1,
-0.3183169, -1.202675, -3.708568, 0, 1, 0.3176471, 1,
-0.3151609, -0.9294255, -3.508377, 0, 1, 0.3215686, 1,
-0.3126614, 0.8926515, -2.179805, 0, 1, 0.3294118, 1,
-0.3096817, -1.4084, -1.870378, 0, 1, 0.3333333, 1,
-0.308713, -0.1416856, -2.202315, 0, 1, 0.3411765, 1,
-0.3082121, 1.725888, -1.416221, 0, 1, 0.345098, 1,
-0.2991596, 0.8297637, -0.8722532, 0, 1, 0.3529412, 1,
-0.2973896, -0.001519419, -3.461273, 0, 1, 0.3568628, 1,
-0.2857803, -0.3820391, -1.197585, 0, 1, 0.3647059, 1,
-0.2851333, 0.3280225, 0.0353578, 0, 1, 0.3686275, 1,
-0.2808149, -0.318272, -3.27352, 0, 1, 0.3764706, 1,
-0.2793672, -0.001597722, -2.132697, 0, 1, 0.3803922, 1,
-0.2773308, 0.04457621, -0.6567141, 0, 1, 0.3882353, 1,
-0.2754748, -0.2665004, -0.6959946, 0, 1, 0.3921569, 1,
-0.2661221, 0.2219133, -2.510389, 0, 1, 0.4, 1,
-0.2653059, 1.920364, -0.09440854, 0, 1, 0.4078431, 1,
-0.2633493, 0.05813077, 0.3834614, 0, 1, 0.4117647, 1,
-0.2608406, -0.6018427, -2.715875, 0, 1, 0.4196078, 1,
-0.2525456, 0.8137784, -0.7135967, 0, 1, 0.4235294, 1,
-0.2505954, -0.8870645, -1.28095, 0, 1, 0.4313726, 1,
-0.2463938, -0.4899148, -3.008201, 0, 1, 0.4352941, 1,
-0.2460742, -0.6165424, -3.87944, 0, 1, 0.4431373, 1,
-0.2459724, -1.197958, -3.405739, 0, 1, 0.4470588, 1,
-0.2458237, 0.3094929, 0.005477, 0, 1, 0.454902, 1,
-0.244057, -0.7801926, -2.268922, 0, 1, 0.4588235, 1,
-0.2403109, 1.364852, -0.2357545, 0, 1, 0.4666667, 1,
-0.2367407, -2.271137, -3.433357, 0, 1, 0.4705882, 1,
-0.227204, 0.6164053, -2.256973, 0, 1, 0.4784314, 1,
-0.2271871, 0.9594536, 0.2325569, 0, 1, 0.4823529, 1,
-0.2268148, 0.3111371, -1.247743, 0, 1, 0.4901961, 1,
-0.2239945, -0.517344, -1.373842, 0, 1, 0.4941176, 1,
-0.2220466, -0.4543189, -2.325386, 0, 1, 0.5019608, 1,
-0.2218294, 1.311056, 0.08561456, 0, 1, 0.509804, 1,
-0.2185866, 2.047649, 1.237179, 0, 1, 0.5137255, 1,
-0.2174294, 0.4079458, 0.1372273, 0, 1, 0.5215687, 1,
-0.215882, -0.4414987, -2.026183, 0, 1, 0.5254902, 1,
-0.2127032, -0.8224992, -3.134465, 0, 1, 0.5333334, 1,
-0.2114624, 0.3204185, 0.5541556, 0, 1, 0.5372549, 1,
-0.2092953, 0.5168073, -0.6602568, 0, 1, 0.5450981, 1,
-0.2089346, 0.2319219, -0.02103857, 0, 1, 0.5490196, 1,
-0.2031015, -0.7009419, -2.857477, 0, 1, 0.5568628, 1,
-0.2019285, -0.1928254, -2.583933, 0, 1, 0.5607843, 1,
-0.2000553, -0.9610347, -2.615933, 0, 1, 0.5686275, 1,
-0.1942268, -2.020965, -2.791714, 0, 1, 0.572549, 1,
-0.1920204, 0.5482223, 0.393119, 0, 1, 0.5803922, 1,
-0.1868367, -1.372931, -3.472975, 0, 1, 0.5843138, 1,
-0.185674, 0.9213189, -1.679, 0, 1, 0.5921569, 1,
-0.1809538, -0.6569304, -1.916442, 0, 1, 0.5960785, 1,
-0.1792993, -1.861066, -3.603263, 0, 1, 0.6039216, 1,
-0.1788592, -2.05534, -3.709764, 0, 1, 0.6117647, 1,
-0.1777623, 0.7815513, 0.511795, 0, 1, 0.6156863, 1,
-0.1772706, -0.7088187, -1.57365, 0, 1, 0.6235294, 1,
-0.1762436, -1.416355, -2.612462, 0, 1, 0.627451, 1,
-0.175661, 0.622476, 0.9119987, 0, 1, 0.6352941, 1,
-0.1736589, -0.8677, -3.439315, 0, 1, 0.6392157, 1,
-0.1717973, 0.2785203, -0.8673314, 0, 1, 0.6470588, 1,
-0.171074, 0.7597434, -0.9145499, 0, 1, 0.6509804, 1,
-0.1698384, -0.632528, -1.790298, 0, 1, 0.6588235, 1,
-0.1661918, 0.3723769, -1.091115, 0, 1, 0.6627451, 1,
-0.1638431, -0.9992992, -3.26754, 0, 1, 0.6705883, 1,
-0.1624758, -0.439729, -2.580314, 0, 1, 0.6745098, 1,
-0.1567675, 0.9877329, 0.4329417, 0, 1, 0.682353, 1,
-0.1547308, -0.1723496, -2.517884, 0, 1, 0.6862745, 1,
-0.1541406, 0.9488084, -0.9972503, 0, 1, 0.6941177, 1,
-0.1517751, -0.886305, -0.2821289, 0, 1, 0.7019608, 1,
-0.1503903, 0.5564677, -1.401722, 0, 1, 0.7058824, 1,
-0.1484488, 1.742632, -1.846408, 0, 1, 0.7137255, 1,
-0.1474135, 1.476064, -0.06798595, 0, 1, 0.7176471, 1,
-0.1428296, 2.390907, -0.8074729, 0, 1, 0.7254902, 1,
-0.1399304, 0.5225868, 1.844351, 0, 1, 0.7294118, 1,
-0.1370613, -0.3129433, -2.465064, 0, 1, 0.7372549, 1,
-0.1366718, -0.6865913, -5.033755, 0, 1, 0.7411765, 1,
-0.1343979, 0.0191763, -2.159038, 0, 1, 0.7490196, 1,
-0.1286537, 1.031007, -0.3714334, 0, 1, 0.7529412, 1,
-0.1252533, -0.1730034, -2.438255, 0, 1, 0.7607843, 1,
-0.1220031, 1.63645, 0.7783486, 0, 1, 0.7647059, 1,
-0.1197685, -1.365331, -3.261693, 0, 1, 0.772549, 1,
-0.1171592, 0.5413738, -0.06443408, 0, 1, 0.7764706, 1,
-0.1105266, -1.67719, -2.647259, 0, 1, 0.7843137, 1,
-0.1099366, -1.522205, -2.566228, 0, 1, 0.7882353, 1,
-0.108663, 0.1274162, -1.921356, 0, 1, 0.7960784, 1,
-0.100023, 0.54891, 1.386367, 0, 1, 0.8039216, 1,
-0.09957337, 0.3132426, 0.09541003, 0, 1, 0.8078431, 1,
-0.09500242, 0.5785339, 0.1304545, 0, 1, 0.8156863, 1,
-0.09203831, -0.9824919, -1.064938, 0, 1, 0.8196079, 1,
-0.09097386, -1.666733, -2.586103, 0, 1, 0.827451, 1,
-0.09052762, 0.01853361, -2.087934, 0, 1, 0.8313726, 1,
-0.09027559, -0.757907, -2.73838, 0, 1, 0.8392157, 1,
-0.08652885, -0.5239043, -2.597917, 0, 1, 0.8431373, 1,
-0.08505142, 0.1902141, -1.119989, 0, 1, 0.8509804, 1,
-0.08120001, 0.161419, 1.002702, 0, 1, 0.854902, 1,
-0.07904155, 0.7011149, -0.9162335, 0, 1, 0.8627451, 1,
-0.07847822, -0.03282416, -1.949909, 0, 1, 0.8666667, 1,
-0.0781517, 1.742188, -2.096452, 0, 1, 0.8745098, 1,
-0.07530193, -0.2411442, -3.199931, 0, 1, 0.8784314, 1,
-0.06776064, 0.2401396, -1.964002, 0, 1, 0.8862745, 1,
-0.06703375, -0.2334908, -3.566797, 0, 1, 0.8901961, 1,
-0.06180389, -1.110031, -5.258111, 0, 1, 0.8980392, 1,
-0.05682296, 0.7239002, 0.2232076, 0, 1, 0.9058824, 1,
-0.05451442, -0.3226423, -2.390546, 0, 1, 0.9098039, 1,
-0.05334269, 0.8137565, 2.243226, 0, 1, 0.9176471, 1,
-0.0468248, -0.3398073, -3.14995, 0, 1, 0.9215686, 1,
-0.04619689, 0.1822687, 1.032588, 0, 1, 0.9294118, 1,
-0.04178287, -2.292176, -2.993837, 0, 1, 0.9333333, 1,
-0.04090407, -1.083662, -3.139251, 0, 1, 0.9411765, 1,
-0.03896293, -0.7195926, -2.654125, 0, 1, 0.945098, 1,
-0.03790582, -1.444423, -1.82722, 0, 1, 0.9529412, 1,
-0.0376826, 1.039617, -0.670021, 0, 1, 0.9568627, 1,
-0.03764976, 0.2337919, -0.2433232, 0, 1, 0.9647059, 1,
-0.03460491, 0.4692365, 1.504329, 0, 1, 0.9686275, 1,
-0.03152787, -0.3151518, -3.893156, 0, 1, 0.9764706, 1,
-0.02693949, -0.5117831, -2.347704, 0, 1, 0.9803922, 1,
-0.02604698, -1.199495, -3.073788, 0, 1, 0.9882353, 1,
-0.01706773, -1.102805, -2.589828, 0, 1, 0.9921569, 1,
-0.01483975, 1.379766, 0.8518212, 0, 1, 1, 1,
-0.01412927, -0.4553611, -2.95535, 0, 0.9921569, 1, 1,
-0.01376483, 0.543269, -1.325457, 0, 0.9882353, 1, 1,
-0.01297307, 1.463473, 0.415156, 0, 0.9803922, 1, 1,
-0.01262466, -1.772739, -3.763592, 0, 0.9764706, 1, 1,
-0.009023285, -0.6333322, -4.320589, 0, 0.9686275, 1, 1,
-0.007603097, 2.802539, 0.144097, 0, 0.9647059, 1, 1,
-0.003761641, 1.075444, 2.834217, 0, 0.9568627, 1, 1,
-0.003010774, -1.172214, -3.854851, 0, 0.9529412, 1, 1,
0.002535988, 0.3676356, 0.7877793, 0, 0.945098, 1, 1,
0.003007545, -0.2219531, 3.692113, 0, 0.9411765, 1, 1,
0.00663498, -0.6308936, 4.424268, 0, 0.9333333, 1, 1,
0.007042899, -0.5456797, 5.858428, 0, 0.9294118, 1, 1,
0.007784702, 0.7092309, 0.1063403, 0, 0.9215686, 1, 1,
0.008867087, 1.332226, 0.2065772, 0, 0.9176471, 1, 1,
0.009560811, -1.016091, 3.104991, 0, 0.9098039, 1, 1,
0.009857957, 0.06583495, 0.3248614, 0, 0.9058824, 1, 1,
0.01056514, 0.7576665, -0.9542344, 0, 0.8980392, 1, 1,
0.01167537, -0.5832504, 2.43807, 0, 0.8901961, 1, 1,
0.01233708, 0.2503496, -1.206134, 0, 0.8862745, 1, 1,
0.01385739, 1.54136, -0.815928, 0, 0.8784314, 1, 1,
0.01423622, -0.6246285, 1.40735, 0, 0.8745098, 1, 1,
0.01498972, -0.05529434, 2.645517, 0, 0.8666667, 1, 1,
0.01539829, -1.38829, 1.879415, 0, 0.8627451, 1, 1,
0.02309602, 1.369399, 0.577691, 0, 0.854902, 1, 1,
0.02417176, -0.02641412, 1.170474, 0, 0.8509804, 1, 1,
0.02756516, 0.5415896, 2.5474, 0, 0.8431373, 1, 1,
0.03283322, -0.1217836, 4.246158, 0, 0.8392157, 1, 1,
0.03333814, -0.502355, 1.444797, 0, 0.8313726, 1, 1,
0.03488556, -1.100392, 3.290325, 0, 0.827451, 1, 1,
0.03531707, -0.985631, 3.45545, 0, 0.8196079, 1, 1,
0.03792909, -0.1178199, 3.538533, 0, 0.8156863, 1, 1,
0.03866516, -2.824053, 2.35531, 0, 0.8078431, 1, 1,
0.05077062, 2.123115, -0.1430741, 0, 0.8039216, 1, 1,
0.05112142, -1.805144, 3.589602, 0, 0.7960784, 1, 1,
0.05131381, -0.7753891, 1.865801, 0, 0.7882353, 1, 1,
0.05179562, -1.530108, 2.882939, 0, 0.7843137, 1, 1,
0.05799694, -1.161694, 3.240632, 0, 0.7764706, 1, 1,
0.05877206, -0.4435075, 2.300217, 0, 0.772549, 1, 1,
0.0600687, 0.203596, -0.3173611, 0, 0.7647059, 1, 1,
0.06160544, 0.1385425, 1.374504, 0, 0.7607843, 1, 1,
0.06324208, 0.8142892, -0.8312853, 0, 0.7529412, 1, 1,
0.06682195, -0.9504126, 2.936608, 0, 0.7490196, 1, 1,
0.06834867, 0.7242923, -0.983382, 0, 0.7411765, 1, 1,
0.07279649, -0.9178684, 3.677163, 0, 0.7372549, 1, 1,
0.07296788, 0.3097378, -1.143841, 0, 0.7294118, 1, 1,
0.07643586, 0.9666932, -1.334854, 0, 0.7254902, 1, 1,
0.07674797, -1.697528, 3.10577, 0, 0.7176471, 1, 1,
0.08022176, 0.8484555, 1.961373, 0, 0.7137255, 1, 1,
0.08148848, 0.4193987, 0.6491964, 0, 0.7058824, 1, 1,
0.08386118, 0.216471, 0.7107696, 0, 0.6980392, 1, 1,
0.08631005, 1.000441, 1.354352, 0, 0.6941177, 1, 1,
0.08644747, 1.637595, -1.041042, 0, 0.6862745, 1, 1,
0.08979072, 0.6734047, -0.3750909, 0, 0.682353, 1, 1,
0.09063443, 0.104634, 0.6315622, 0, 0.6745098, 1, 1,
0.09174284, 0.7971656, -0.8242689, 0, 0.6705883, 1, 1,
0.09396192, 0.1557452, 0.8482314, 0, 0.6627451, 1, 1,
0.1019303, 2.33577, 0.2131318, 0, 0.6588235, 1, 1,
0.104337, -1.466126, 4.071719, 0, 0.6509804, 1, 1,
0.1052462, -1.136298, 2.722899, 0, 0.6470588, 1, 1,
0.1052808, -0.8708917, 5.121765, 0, 0.6392157, 1, 1,
0.1056158, 0.2810519, -1.643461, 0, 0.6352941, 1, 1,
0.1062231, -0.6727306, 2.601531, 0, 0.627451, 1, 1,
0.1084925, -0.5095997, 2.055419, 0, 0.6235294, 1, 1,
0.1094365, 0.3189904, 0.9362321, 0, 0.6156863, 1, 1,
0.1110006, -0.5119895, 2.902388, 0, 0.6117647, 1, 1,
0.1118346, -0.2054523, 1.995955, 0, 0.6039216, 1, 1,
0.1130923, 0.2777943, 0.7539872, 0, 0.5960785, 1, 1,
0.1188217, 1.029473, -0.1872156, 0, 0.5921569, 1, 1,
0.1227269, -0.5864495, 2.629511, 0, 0.5843138, 1, 1,
0.126765, -0.9018014, 2.782055, 0, 0.5803922, 1, 1,
0.1279395, 0.7054968, 0.8624038, 0, 0.572549, 1, 1,
0.1299647, -0.537132, 4.018461, 0, 0.5686275, 1, 1,
0.1326747, -0.829844, 3.030802, 0, 0.5607843, 1, 1,
0.1337293, 1.287633, -0.3572743, 0, 0.5568628, 1, 1,
0.1362666, 0.2235695, -0.07053866, 0, 0.5490196, 1, 1,
0.1380118, 0.6061714, 0.06918593, 0, 0.5450981, 1, 1,
0.1411706, -2.436834, 2.721132, 0, 0.5372549, 1, 1,
0.1413665, -1.044498, 2.811845, 0, 0.5333334, 1, 1,
0.1432422, -0.1141717, 1.602338, 0, 0.5254902, 1, 1,
0.1458575, 0.2796066, 1.080222, 0, 0.5215687, 1, 1,
0.1481129, -1.120047, 4.051, 0, 0.5137255, 1, 1,
0.1495444, 0.7640802, 0.9239188, 0, 0.509804, 1, 1,
0.1519942, 0.4832424, 1.108783, 0, 0.5019608, 1, 1,
0.1523127, -0.8721912, 2.721392, 0, 0.4941176, 1, 1,
0.1567897, 0.8671589, -2.055101, 0, 0.4901961, 1, 1,
0.1601176, -1.400729, 3.720579, 0, 0.4823529, 1, 1,
0.1658984, -0.8331283, 3.49475, 0, 0.4784314, 1, 1,
0.1664544, -0.542743, 1.806751, 0, 0.4705882, 1, 1,
0.1726936, 1.484265, -0.4320258, 0, 0.4666667, 1, 1,
0.1729164, 0.9965758, -0.7010182, 0, 0.4588235, 1, 1,
0.1730614, -0.4837235, 1.346098, 0, 0.454902, 1, 1,
0.1754806, -1.234702, 1.550581, 0, 0.4470588, 1, 1,
0.1765626, 0.06938646, 2.128342, 0, 0.4431373, 1, 1,
0.1813042, 1.367327, -0.3976083, 0, 0.4352941, 1, 1,
0.181465, 0.1337624, 2.684212, 0, 0.4313726, 1, 1,
0.1844689, 1.953772, -0.5065519, 0, 0.4235294, 1, 1,
0.1872895, 0.04499719, 0.8298762, 0, 0.4196078, 1, 1,
0.1888209, -1.050116, 3.193352, 0, 0.4117647, 1, 1,
0.1946745, -0.2889184, 2.486471, 0, 0.4078431, 1, 1,
0.1947089, -0.4405209, 2.180597, 0, 0.4, 1, 1,
0.1954261, -0.7059254, 3.34717, 0, 0.3921569, 1, 1,
0.1970075, -0.1568688, 2.178925, 0, 0.3882353, 1, 1,
0.1989578, 0.5962332, 2.107157, 0, 0.3803922, 1, 1,
0.2002057, -0.4152163, 3.09736, 0, 0.3764706, 1, 1,
0.2007855, -0.8958779, 3.211303, 0, 0.3686275, 1, 1,
0.2025908, -0.7479078, 2.570407, 0, 0.3647059, 1, 1,
0.2125587, -0.1067954, 1.365052, 0, 0.3568628, 1, 1,
0.2137757, -0.7686747, 1.144933, 0, 0.3529412, 1, 1,
0.2167716, -0.03899205, 2.260516, 0, 0.345098, 1, 1,
0.2174411, 0.7606937, 1.038377, 0, 0.3411765, 1, 1,
0.2175757, 0.5210133, 0.5733151, 0, 0.3333333, 1, 1,
0.2178194, 0.03228987, 2.089302, 0, 0.3294118, 1, 1,
0.218838, 1.201393, 0.6105202, 0, 0.3215686, 1, 1,
0.2205163, -1.142657, 2.947276, 0, 0.3176471, 1, 1,
0.2244919, 0.06168844, 2.88477, 0, 0.3098039, 1, 1,
0.2245508, 0.7544571, -0.1747791, 0, 0.3058824, 1, 1,
0.2275912, 0.5492565, 1.388659, 0, 0.2980392, 1, 1,
0.2284966, 0.01234089, 2.268429, 0, 0.2901961, 1, 1,
0.2337583, -0.6685536, 2.444557, 0, 0.2862745, 1, 1,
0.2383906, 1.250772, 1.704661, 0, 0.2784314, 1, 1,
0.241019, -0.583223, 4.165931, 0, 0.2745098, 1, 1,
0.2412519, -0.3430614, 2.787297, 0, 0.2666667, 1, 1,
0.2414696, -0.4998383, 1.330985, 0, 0.2627451, 1, 1,
0.244736, -1.183837, 3.463906, 0, 0.254902, 1, 1,
0.2498312, 2.318054, -1.142418, 0, 0.2509804, 1, 1,
0.251401, 0.02485465, 3.081203, 0, 0.2431373, 1, 1,
0.2562989, 0.06569078, -0.07170559, 0, 0.2392157, 1, 1,
0.2580438, 1.607287, -0.08342481, 0, 0.2313726, 1, 1,
0.2607384, 0.05317182, 1.294751, 0, 0.227451, 1, 1,
0.2711529, -0.3851331, 2.526909, 0, 0.2196078, 1, 1,
0.2729179, 1.387932, -0.4087127, 0, 0.2156863, 1, 1,
0.2780552, 0.01884201, 1.216691, 0, 0.2078431, 1, 1,
0.2809955, 0.7464679, -0.04574086, 0, 0.2039216, 1, 1,
0.2831312, -0.3283478, 4.732252, 0, 0.1960784, 1, 1,
0.283457, -0.7128639, 3.692821, 0, 0.1882353, 1, 1,
0.2838852, 0.2807083, 0.3829212, 0, 0.1843137, 1, 1,
0.2852602, -1.643438, 2.828838, 0, 0.1764706, 1, 1,
0.2857923, 0.1552361, -0.2244351, 0, 0.172549, 1, 1,
0.2888339, 0.1487703, 1.419149, 0, 0.1647059, 1, 1,
0.2914685, 0.7184753, 0.8365789, 0, 0.1607843, 1, 1,
0.2987819, -1.996803, 3.306245, 0, 0.1529412, 1, 1,
0.2990626, 1.127789, 0.4757311, 0, 0.1490196, 1, 1,
0.303844, 0.6937635, 0.08210827, 0, 0.1411765, 1, 1,
0.3064599, -0.05091788, 2.344366, 0, 0.1372549, 1, 1,
0.321034, -0.8975681, 4.831466, 0, 0.1294118, 1, 1,
0.3214086, -0.08145967, 1.638206, 0, 0.1254902, 1, 1,
0.3236887, 0.6473584, 1.074086, 0, 0.1176471, 1, 1,
0.3246681, 0.06639375, 1.819427, 0, 0.1137255, 1, 1,
0.3295272, -1.138491, 3.157465, 0, 0.1058824, 1, 1,
0.3306044, -0.155523, 1.834199, 0, 0.09803922, 1, 1,
0.3316293, 1.714224, -0.9378812, 0, 0.09411765, 1, 1,
0.3331209, 0.8013688, 0.6765851, 0, 0.08627451, 1, 1,
0.3342832, -0.9982536, 2.428895, 0, 0.08235294, 1, 1,
0.3352048, -0.7882782, 1.674942, 0, 0.07450981, 1, 1,
0.3365798, 0.007144997, 1.559345, 0, 0.07058824, 1, 1,
0.3397509, -0.5235543, 3.353652, 0, 0.0627451, 1, 1,
0.3464725, 0.8711038, 1.831921, 0, 0.05882353, 1, 1,
0.3485148, 1.086361, 0.1753261, 0, 0.05098039, 1, 1,
0.3496349, 1.647668, 0.819293, 0, 0.04705882, 1, 1,
0.3511179, -1.100224, 3.439834, 0, 0.03921569, 1, 1,
0.3579946, 0.8766478, 0.4415406, 0, 0.03529412, 1, 1,
0.3596509, -0.7831034, 2.041003, 0, 0.02745098, 1, 1,
0.3667617, 0.2705722, 0.3509556, 0, 0.02352941, 1, 1,
0.3702405, -0.6608391, 3.70064, 0, 0.01568628, 1, 1,
0.3707329, 1.051346, 0.048411, 0, 0.01176471, 1, 1,
0.3716829, 0.658971, 2.268505, 0, 0.003921569, 1, 1,
0.3748553, -1.168091, 1.764775, 0.003921569, 0, 1, 1,
0.3756523, 0.7564185, 1.267377, 0.007843138, 0, 1, 1,
0.3785777, -0.2123875, 1.987714, 0.01568628, 0, 1, 1,
0.384122, -0.6920687, 3.021227, 0.01960784, 0, 1, 1,
0.3872116, -0.3612813, 2.496754, 0.02745098, 0, 1, 1,
0.3926984, 0.07634568, 1.385508, 0.03137255, 0, 1, 1,
0.3930503, 1.412152, -0.286421, 0.03921569, 0, 1, 1,
0.3946367, 0.07032424, 1.660327, 0.04313726, 0, 1, 1,
0.4003248, 0.5201397, 0.5001166, 0.05098039, 0, 1, 1,
0.4025419, -1.317101, 1.672142, 0.05490196, 0, 1, 1,
0.4076329, -1.357851, 2.460016, 0.0627451, 0, 1, 1,
0.4104577, -0.6902241, 2.147856, 0.06666667, 0, 1, 1,
0.4172788, 1.866869, 0.171226, 0.07450981, 0, 1, 1,
0.4186009, 0.0195233, 1.450383, 0.07843138, 0, 1, 1,
0.4248164, -1.829523, 4.723389, 0.08627451, 0, 1, 1,
0.4266747, -0.7817146, 2.451414, 0.09019608, 0, 1, 1,
0.4288299, 0.9297734, 1.779566, 0.09803922, 0, 1, 1,
0.4341219, -0.6505718, 3.478143, 0.1058824, 0, 1, 1,
0.4352479, -0.1943386, 3.025511, 0.1098039, 0, 1, 1,
0.443303, -0.774325, 3.520665, 0.1176471, 0, 1, 1,
0.4455909, -1.080432, 2.513837, 0.1215686, 0, 1, 1,
0.4457294, -0.03559285, 2.337909, 0.1294118, 0, 1, 1,
0.4466352, -0.9294984, 1.552759, 0.1333333, 0, 1, 1,
0.4468231, -0.703369, 2.292167, 0.1411765, 0, 1, 1,
0.4547171, -0.6303322, 1.481839, 0.145098, 0, 1, 1,
0.4579999, 1.331144, -0.1209748, 0.1529412, 0, 1, 1,
0.4633177, 1.747912, -0.3748436, 0.1568628, 0, 1, 1,
0.4667495, 1.703315, -0.3395588, 0.1647059, 0, 1, 1,
0.4679894, 0.3786936, -0.07939155, 0.1686275, 0, 1, 1,
0.4698587, -0.157663, 1.548146, 0.1764706, 0, 1, 1,
0.4708979, 0.1792051, 1.959958, 0.1803922, 0, 1, 1,
0.4720957, -2.686508, 1.474005, 0.1882353, 0, 1, 1,
0.4753148, 0.02185181, 1.309046, 0.1921569, 0, 1, 1,
0.4758067, -1.197363, 1.987917, 0.2, 0, 1, 1,
0.4806569, 0.8026856, -0.3923091, 0.2078431, 0, 1, 1,
0.481014, 0.6617525, 0.702534, 0.2117647, 0, 1, 1,
0.4858695, -1.481582, 3.240521, 0.2196078, 0, 1, 1,
0.4921475, -2.119532, 2.865935, 0.2235294, 0, 1, 1,
0.492808, 2.181143, 1.161445, 0.2313726, 0, 1, 1,
0.4944782, 1.418451, -0.5083936, 0.2352941, 0, 1, 1,
0.4979261, -1.055199, 1.963709, 0.2431373, 0, 1, 1,
0.5009859, 0.4934883, 2.195798, 0.2470588, 0, 1, 1,
0.5024339, -0.2248442, 2.080109, 0.254902, 0, 1, 1,
0.5043294, -1.581632, 3.734419, 0.2588235, 0, 1, 1,
0.5043955, 1.06854, 0.7093586, 0.2666667, 0, 1, 1,
0.5103841, -0.2182893, 2.049278, 0.2705882, 0, 1, 1,
0.5128806, 0.8050603, 1.495866, 0.2784314, 0, 1, 1,
0.5147858, 0.3963218, 2.552462, 0.282353, 0, 1, 1,
0.5165095, 0.06979746, 1.853523, 0.2901961, 0, 1, 1,
0.5166197, 1.404969, -1.321495, 0.2941177, 0, 1, 1,
0.5198213, -0.5767511, 3.623333, 0.3019608, 0, 1, 1,
0.5224223, 1.041708, -0.02961326, 0.3098039, 0, 1, 1,
0.5261025, -1.944628, 4.641904, 0.3137255, 0, 1, 1,
0.5347368, -0.3937649, 0.6513537, 0.3215686, 0, 1, 1,
0.5428765, 1.614207, 0.03611067, 0.3254902, 0, 1, 1,
0.5448424, 0.229911, 2.936649, 0.3333333, 0, 1, 1,
0.54593, 1.081186, -1.320817, 0.3372549, 0, 1, 1,
0.551181, -0.3095155, 1.247559, 0.345098, 0, 1, 1,
0.5526459, 0.1702272, 2.258835, 0.3490196, 0, 1, 1,
0.5529269, 0.828363, 1.475498, 0.3568628, 0, 1, 1,
0.5541121, 1.393143, 0.7085747, 0.3607843, 0, 1, 1,
0.5550312, 1.140895, -0.730841, 0.3686275, 0, 1, 1,
0.5562705, 0.5518359, 0.6552434, 0.372549, 0, 1, 1,
0.5570502, 1.448515, 0.7943059, 0.3803922, 0, 1, 1,
0.5602959, -1.277715, 3.490013, 0.3843137, 0, 1, 1,
0.5625724, 0.03174971, 2.532003, 0.3921569, 0, 1, 1,
0.5645692, 2.231643, -0.755962, 0.3960784, 0, 1, 1,
0.5714476, -0.4250918, 1.110623, 0.4039216, 0, 1, 1,
0.5735359, 0.04416298, 0.8710857, 0.4117647, 0, 1, 1,
0.5789745, -0.8411531, 3.165101, 0.4156863, 0, 1, 1,
0.5866709, -0.3219202, 3.272313, 0.4235294, 0, 1, 1,
0.5869167, 0.783262, 0.6036277, 0.427451, 0, 1, 1,
0.5903894, 0.08356559, 1.052164, 0.4352941, 0, 1, 1,
0.5906751, 0.2965082, 1.995646, 0.4392157, 0, 1, 1,
0.5944936, 1.163803, -0.1995298, 0.4470588, 0, 1, 1,
0.6054454, -0.8454438, 2.376415, 0.4509804, 0, 1, 1,
0.6085436, -0.9141397, 3.0099, 0.4588235, 0, 1, 1,
0.6100426, 0.05361857, 2.769225, 0.4627451, 0, 1, 1,
0.6105772, -0.7409667, 2.37433, 0.4705882, 0, 1, 1,
0.6132498, -0.1145651, 1.116532, 0.4745098, 0, 1, 1,
0.6146089, 2.367553, 0.06710239, 0.4823529, 0, 1, 1,
0.6226375, 0.01539118, 2.441059, 0.4862745, 0, 1, 1,
0.6261751, 0.4170238, 0.7974085, 0.4941176, 0, 1, 1,
0.6319917, -1.531467, 2.87769, 0.5019608, 0, 1, 1,
0.6328644, 0.1774196, -0.1267768, 0.5058824, 0, 1, 1,
0.6361625, 1.479896, 0.5222584, 0.5137255, 0, 1, 1,
0.6384605, 0.5048866, 1.075268, 0.5176471, 0, 1, 1,
0.6403319, 1.019998, -0.675199, 0.5254902, 0, 1, 1,
0.6403815, -0.1776889, 0.7838981, 0.5294118, 0, 1, 1,
0.6474327, -1.456867, 3.695074, 0.5372549, 0, 1, 1,
0.6475251, -0.1684134, 1.980897, 0.5411765, 0, 1, 1,
0.648186, 0.658386, 1.123381, 0.5490196, 0, 1, 1,
0.6483477, -0.1004702, 2.905281, 0.5529412, 0, 1, 1,
0.6507059, 0.5923174, 0.6271011, 0.5607843, 0, 1, 1,
0.6571294, 0.3460478, -0.472342, 0.5647059, 0, 1, 1,
0.6583063, -0.1628964, 2.115458, 0.572549, 0, 1, 1,
0.6596478, 1.096466, -0.394618, 0.5764706, 0, 1, 1,
0.6617451, -0.6225126, 2.185577, 0.5843138, 0, 1, 1,
0.6763554, 0.8097958, 2.334103, 0.5882353, 0, 1, 1,
0.6801566, 0.3964576, -0.8070576, 0.5960785, 0, 1, 1,
0.6857725, 0.9135055, -0.6500275, 0.6039216, 0, 1, 1,
0.6894085, -1.126845, 4.499094, 0.6078432, 0, 1, 1,
0.6911107, 1.968804, -1.007265, 0.6156863, 0, 1, 1,
0.7029517, -1.64596, 1.283481, 0.6196079, 0, 1, 1,
0.7076093, -1.627442, 2.592172, 0.627451, 0, 1, 1,
0.7159255, -0.551074, 2.084582, 0.6313726, 0, 1, 1,
0.7170262, -0.4265967, 2.238847, 0.6392157, 0, 1, 1,
0.7177922, -0.1992733, 2.47337, 0.6431373, 0, 1, 1,
0.7191725, 2.226603, -0.4549266, 0.6509804, 0, 1, 1,
0.7234058, 1.332519, 0.3270958, 0.654902, 0, 1, 1,
0.7238168, 1.022043, 0.3173867, 0.6627451, 0, 1, 1,
0.7419491, 0.08506991, 1.958915, 0.6666667, 0, 1, 1,
0.762455, -0.3005747, 1.039447, 0.6745098, 0, 1, 1,
0.763208, 0.4433428, 0.7893277, 0.6784314, 0, 1, 1,
0.7776003, -1.311141, 1.807544, 0.6862745, 0, 1, 1,
0.7795123, 1.895458, 1.369871, 0.6901961, 0, 1, 1,
0.7934992, 0.7630277, 2.272984, 0.6980392, 0, 1, 1,
0.7940118, 0.7917479, -0.1965194, 0.7058824, 0, 1, 1,
0.7948392, 0.06059536, -0.01058581, 0.7098039, 0, 1, 1,
0.7987196, -0.6227085, 2.682912, 0.7176471, 0, 1, 1,
0.8016214, -0.05542289, 2.000539, 0.7215686, 0, 1, 1,
0.8052483, -0.1749152, 1.098951, 0.7294118, 0, 1, 1,
0.8065489, -1.722704, 3.075972, 0.7333333, 0, 1, 1,
0.8229502, 0.5398493, 0.9081865, 0.7411765, 0, 1, 1,
0.8306198, -2.19678, 4.103708, 0.7450981, 0, 1, 1,
0.8355923, -1.334528, 2.303015, 0.7529412, 0, 1, 1,
0.8447926, 1.522484, 1.004823, 0.7568628, 0, 1, 1,
0.8544384, 0.5968384, 0.7293681, 0.7647059, 0, 1, 1,
0.8628746, 1.050233, 0.2166715, 0.7686275, 0, 1, 1,
0.8652951, -1.213483, 3.702385, 0.7764706, 0, 1, 1,
0.8670742, 1.222865, 0.4998314, 0.7803922, 0, 1, 1,
0.8685426, -0.09887972, 1.275996, 0.7882353, 0, 1, 1,
0.8731148, -0.1906801, 2.199466, 0.7921569, 0, 1, 1,
0.8775616, 0.1067003, 1.307881, 0.8, 0, 1, 1,
0.8807377, -0.2050153, 1.942967, 0.8078431, 0, 1, 1,
0.8833045, 0.09989213, 2.030094, 0.8117647, 0, 1, 1,
0.8873699, -0.06266233, 0.1417696, 0.8196079, 0, 1, 1,
0.8877348, -0.4871491, 3.66894, 0.8235294, 0, 1, 1,
0.89887, 1.194698, 0.1887655, 0.8313726, 0, 1, 1,
0.8991967, 0.2933584, 0.8145233, 0.8352941, 0, 1, 1,
0.9016191, 1.927238, 0.2359483, 0.8431373, 0, 1, 1,
0.9022887, 2.111009, 0.6098536, 0.8470588, 0, 1, 1,
0.9045386, 0.2413646, -1.27155, 0.854902, 0, 1, 1,
0.9078051, -1.709006, 2.606734, 0.8588235, 0, 1, 1,
0.9100103, 0.3663086, 0.2833043, 0.8666667, 0, 1, 1,
0.9103642, 0.7331781, 0.8198664, 0.8705882, 0, 1, 1,
0.9132767, -0.3842412, 0.9529372, 0.8784314, 0, 1, 1,
0.9139978, 0.3979416, 1.225995, 0.8823529, 0, 1, 1,
0.9152535, 0.911833, 1.85201, 0.8901961, 0, 1, 1,
0.9266801, -0.3246126, 2.182315, 0.8941177, 0, 1, 1,
0.9283261, -2.189713, 2.667698, 0.9019608, 0, 1, 1,
0.9468319, -0.3211701, 5.020028, 0.9098039, 0, 1, 1,
0.9473116, 0.5434489, -0.5798447, 0.9137255, 0, 1, 1,
0.9486945, -0.2630093, 2.289666, 0.9215686, 0, 1, 1,
0.9580674, 0.3878785, 0.05767888, 0.9254902, 0, 1, 1,
0.9625198, -0.07764707, 0.874485, 0.9333333, 0, 1, 1,
0.9650229, 0.07837754, 0.9283293, 0.9372549, 0, 1, 1,
0.9663541, 0.3234647, 1.546388, 0.945098, 0, 1, 1,
0.9747429, -0.6454777, 3.331824, 0.9490196, 0, 1, 1,
0.9776064, -0.6129619, 1.628293, 0.9568627, 0, 1, 1,
0.9856155, 0.5028655, 0.8468497, 0.9607843, 0, 1, 1,
0.9861521, 0.5166513, 3.077829, 0.9686275, 0, 1, 1,
0.9892174, -0.23647, 1.413318, 0.972549, 0, 1, 1,
0.989348, -0.3732878, 3.841908, 0.9803922, 0, 1, 1,
0.9910384, 0.432365, 2.609024, 0.9843137, 0, 1, 1,
0.9948253, -0.7037614, 2.728729, 0.9921569, 0, 1, 1,
0.9975614, -0.03987532, 1.031725, 0.9960784, 0, 1, 1,
1.002571, 0.08237322, 2.525856, 1, 0, 0.9960784, 1,
1.004935, -1.373036, 2.937489, 1, 0, 0.9882353, 1,
1.010186, 0.5987213, 1.016525, 1, 0, 0.9843137, 1,
1.014684, -0.1176586, 1.440406, 1, 0, 0.9764706, 1,
1.015718, 0.2047265, 2.399461, 1, 0, 0.972549, 1,
1.016691, -0.5163605, 3.15585, 1, 0, 0.9647059, 1,
1.022972, -0.6625563, 1.54294, 1, 0, 0.9607843, 1,
1.025335, 1.723791, 1.271211, 1, 0, 0.9529412, 1,
1.030689, -1.099605, 3.795939, 1, 0, 0.9490196, 1,
1.03187, -1.211797, 4.560735, 1, 0, 0.9411765, 1,
1.032054, 0.5198298, 1.851867, 1, 0, 0.9372549, 1,
1.035669, -0.7075277, 5.27054, 1, 0, 0.9294118, 1,
1.035829, -0.8008685, 2.449917, 1, 0, 0.9254902, 1,
1.040165, -0.3356197, 2.347835, 1, 0, 0.9176471, 1,
1.042792, -0.5512329, 3.396664, 1, 0, 0.9137255, 1,
1.043607, 1.945862, 0.979041, 1, 0, 0.9058824, 1,
1.053298, 0.1566962, 1.191831, 1, 0, 0.9019608, 1,
1.075408, 0.01723046, 1.189137, 1, 0, 0.8941177, 1,
1.081117, -0.5182629, 1.298359, 1, 0, 0.8862745, 1,
1.08659, -1.416212, 3.262474, 1, 0, 0.8823529, 1,
1.087767, -1.355807, 1.487945, 1, 0, 0.8745098, 1,
1.09463, -1.125168, 2.505543, 1, 0, 0.8705882, 1,
1.098941, 0.7142316, 1.162337, 1, 0, 0.8627451, 1,
1.106897, -0.5067937, 2.380942, 1, 0, 0.8588235, 1,
1.110569, 0.4362505, 0.6366805, 1, 0, 0.8509804, 1,
1.121454, -1.390347, 0.7897416, 1, 0, 0.8470588, 1,
1.127187, 1.12352, 1.102783, 1, 0, 0.8392157, 1,
1.1332, -1.556632, 3.246723, 1, 0, 0.8352941, 1,
1.133357, -1.171211, 3.656355, 1, 0, 0.827451, 1,
1.136594, 0.763992, 1.811242, 1, 0, 0.8235294, 1,
1.142858, 1.801609, 0.2390151, 1, 0, 0.8156863, 1,
1.146976, -1.254427, 2.069764, 1, 0, 0.8117647, 1,
1.149037, 0.4522498, -0.574043, 1, 0, 0.8039216, 1,
1.150357, 1.421128, -1.048683, 1, 0, 0.7960784, 1,
1.159599, 0.6399066, 0.8537129, 1, 0, 0.7921569, 1,
1.170552, 0.2400838, 1.138808, 1, 0, 0.7843137, 1,
1.173606, -0.0308274, 2.0687, 1, 0, 0.7803922, 1,
1.177119, 0.7003467, -0.3792196, 1, 0, 0.772549, 1,
1.182918, -2.212438, 3.900181, 1, 0, 0.7686275, 1,
1.183292, 0.2671008, 0.08006424, 1, 0, 0.7607843, 1,
1.183582, -0.007557689, 2.424435, 1, 0, 0.7568628, 1,
1.186072, 0.6494229, 1.120169, 1, 0, 0.7490196, 1,
1.189029, 1.460608, 0.9058813, 1, 0, 0.7450981, 1,
1.195998, 2.261979, 0.8498538, 1, 0, 0.7372549, 1,
1.197953, -0.4157256, 1.783049, 1, 0, 0.7333333, 1,
1.200794, -0.7722667, 1.814332, 1, 0, 0.7254902, 1,
1.202407, -0.2098894, 2.467866, 1, 0, 0.7215686, 1,
1.209202, 0.2080716, 0.862253, 1, 0, 0.7137255, 1,
1.210771, -0.9723662, 2.887805, 1, 0, 0.7098039, 1,
1.21303, -0.3865834, 1.103239, 1, 0, 0.7019608, 1,
1.215805, -0.8410383, 2.382433, 1, 0, 0.6941177, 1,
1.219015, 1.416694, -1.108272, 1, 0, 0.6901961, 1,
1.225059, 0.515795, 2.599204, 1, 0, 0.682353, 1,
1.225449, 0.2311396, 1.479069, 1, 0, 0.6784314, 1,
1.23163, 0.9512122, 0.5739586, 1, 0, 0.6705883, 1,
1.233612, -0.7216321, 1.607445, 1, 0, 0.6666667, 1,
1.240712, -0.1782644, 2.110387, 1, 0, 0.6588235, 1,
1.244416, 0.995933, 1.357054, 1, 0, 0.654902, 1,
1.24661, -0.1478881, 1.41565, 1, 0, 0.6470588, 1,
1.248672, 0.588276, 2.263841, 1, 0, 0.6431373, 1,
1.251957, 0.9890743, 0.5356886, 1, 0, 0.6352941, 1,
1.259874, 1.521006, 1.353661, 1, 0, 0.6313726, 1,
1.263344, -1.633143, 4.989478, 1, 0, 0.6235294, 1,
1.265157, -1.225722, 2.949898, 1, 0, 0.6196079, 1,
1.266061, -0.9127539, 0.9003506, 1, 0, 0.6117647, 1,
1.27866, 1.432672, 1.947998, 1, 0, 0.6078432, 1,
1.282363, 0.5119331, 0.7379308, 1, 0, 0.6, 1,
1.28714, 0.3758617, 1.880455, 1, 0, 0.5921569, 1,
1.305803, -0.4686868, 2.953177, 1, 0, 0.5882353, 1,
1.306984, 1.28923, -0.1503111, 1, 0, 0.5803922, 1,
1.313782, 2.975471, 1.549698, 1, 0, 0.5764706, 1,
1.323493, 0.4964749, 2.125651, 1, 0, 0.5686275, 1,
1.328174, -0.5294291, 5.416846, 1, 0, 0.5647059, 1,
1.329136, 2.27108, 1.826867, 1, 0, 0.5568628, 1,
1.339201, 0.09262203, 0.852799, 1, 0, 0.5529412, 1,
1.342591, 0.5466354, -0.0151208, 1, 0, 0.5450981, 1,
1.346154, 1.120215, 1.267715, 1, 0, 0.5411765, 1,
1.351421, 1.436537, -0.2085509, 1, 0, 0.5333334, 1,
1.351628, 0.6698625, 2.762808, 1, 0, 0.5294118, 1,
1.35448, 0.8476151, 3.033192, 1, 0, 0.5215687, 1,
1.357139, -1.311484, 2.603209, 1, 0, 0.5176471, 1,
1.363925, 1.26247, -0.4399517, 1, 0, 0.509804, 1,
1.369946, 0.4886062, -0.5050721, 1, 0, 0.5058824, 1,
1.384919, 1.704129, -0.7431541, 1, 0, 0.4980392, 1,
1.394996, 0.3576401, -0.8752613, 1, 0, 0.4901961, 1,
1.421079, 0.2362489, 0.9062698, 1, 0, 0.4862745, 1,
1.427379, 0.9775131, -0.8027682, 1, 0, 0.4784314, 1,
1.442856, -0.01596361, 2.581242, 1, 0, 0.4745098, 1,
1.443541, -0.5340138, 2.372242, 1, 0, 0.4666667, 1,
1.457232, -1.180052, 1.068216, 1, 0, 0.4627451, 1,
1.462633, 1.171144, -1.555562, 1, 0, 0.454902, 1,
1.471928, 0.2650109, 2.990299, 1, 0, 0.4509804, 1,
1.475069, 0.3223271, 0.69447, 1, 0, 0.4431373, 1,
1.494246, -0.6712124, 1.618402, 1, 0, 0.4392157, 1,
1.49956, -0.6017845, 1.086527, 1, 0, 0.4313726, 1,
1.502867, 0.3254149, 0.7092037, 1, 0, 0.427451, 1,
1.50704, -0.5970654, 1.692228, 1, 0, 0.4196078, 1,
1.512288, 0.6479602, 1.89278, 1, 0, 0.4156863, 1,
1.525967, 0.6714457, 1.702381, 1, 0, 0.4078431, 1,
1.53024, -2.04125, 3.07488, 1, 0, 0.4039216, 1,
1.531886, -1.270285, 2.294987, 1, 0, 0.3960784, 1,
1.532274, -0.3908779, 1.188832, 1, 0, 0.3882353, 1,
1.552741, -0.3541431, 2.318429, 1, 0, 0.3843137, 1,
1.585833, -0.3907696, 1.047447, 1, 0, 0.3764706, 1,
1.59367, 0.7383582, 1.439986, 1, 0, 0.372549, 1,
1.596528, 1.894575, -1.12318, 1, 0, 0.3647059, 1,
1.602032, 0.6267428, 0.08512469, 1, 0, 0.3607843, 1,
1.615492, -1.934518, 3.60842, 1, 0, 0.3529412, 1,
1.619202, 0.5904878, 1.211573, 1, 0, 0.3490196, 1,
1.644937, -1.719975, 3.908032, 1, 0, 0.3411765, 1,
1.652845, 0.2812202, 1.69165, 1, 0, 0.3372549, 1,
1.66033, 1.025526, 1.455388, 1, 0, 0.3294118, 1,
1.661433, 0.2010923, 3.127695, 1, 0, 0.3254902, 1,
1.676418, -0.3681065, 3.48603, 1, 0, 0.3176471, 1,
1.682491, -0.01820667, 1.949582, 1, 0, 0.3137255, 1,
1.694316, -1.47409, 0.9078225, 1, 0, 0.3058824, 1,
1.714049, 0.6681663, 0.4393222, 1, 0, 0.2980392, 1,
1.719803, 0.8035614, 2.034798, 1, 0, 0.2941177, 1,
1.733121, -0.5483772, 0.3412758, 1, 0, 0.2862745, 1,
1.741157, 1.594738, 0.3683606, 1, 0, 0.282353, 1,
1.749917, 0.4648457, 2.954249, 1, 0, 0.2745098, 1,
1.752936, -1.855411, 2.68665, 1, 0, 0.2705882, 1,
1.762912, 1.072108, -0.1252444, 1, 0, 0.2627451, 1,
1.785584, -1.066654, 3.488717, 1, 0, 0.2588235, 1,
1.791973, -0.09558234, 1.401673, 1, 0, 0.2509804, 1,
1.809075, -1.027261, 2.389747, 1, 0, 0.2470588, 1,
1.817215, -0.1619276, 1.98518, 1, 0, 0.2392157, 1,
1.82171, -0.3953811, 3.455933, 1, 0, 0.2352941, 1,
1.832196, -0.8599472, 1.840047, 1, 0, 0.227451, 1,
1.857184, 0.9331133, 4.063201, 1, 0, 0.2235294, 1,
1.864955, -0.4216251, 1.595231, 1, 0, 0.2156863, 1,
1.866475, -0.5196681, 2.601093, 1, 0, 0.2117647, 1,
1.898014, -1.15309, 3.086752, 1, 0, 0.2039216, 1,
1.930897, -0.9953686, 2.522611, 1, 0, 0.1960784, 1,
1.93662, 2.589694, -2.759687, 1, 0, 0.1921569, 1,
1.938594, 0.4186696, -0.09028784, 1, 0, 0.1843137, 1,
1.950709, 2.300871, -1.020804, 1, 0, 0.1803922, 1,
1.951733, 0.2421684, 0.3394218, 1, 0, 0.172549, 1,
1.961214, -0.283114, 0.5926247, 1, 0, 0.1686275, 1,
1.961216, -1.027513, 2.135469, 1, 0, 0.1607843, 1,
2.007621, -0.3029098, 2.602525, 1, 0, 0.1568628, 1,
2.015694, -0.231169, 0.2276654, 1, 0, 0.1490196, 1,
2.045289, 0.4864308, 1.493648, 1, 0, 0.145098, 1,
2.069418, -0.6283373, 0.5124483, 1, 0, 0.1372549, 1,
2.096821, -0.2609404, 1.915702, 1, 0, 0.1333333, 1,
2.108322, -0.2522726, 1.523691, 1, 0, 0.1254902, 1,
2.119872, -0.7840705, 1.553354, 1, 0, 0.1215686, 1,
2.155919, -0.5698985, 2.199936, 1, 0, 0.1137255, 1,
2.157856, -0.6644376, 3.837043, 1, 0, 0.1098039, 1,
2.175755, 0.7071719, -0.379511, 1, 0, 0.1019608, 1,
2.280297, 1.421502, 0.9902472, 1, 0, 0.09411765, 1,
2.294338, 0.5287826, 1.330842, 1, 0, 0.09019608, 1,
2.303486, 0.2731067, 1.415442, 1, 0, 0.08235294, 1,
2.408085, 0.3332992, 1.778431, 1, 0, 0.07843138, 1,
2.432774, -1.845962, 1.781317, 1, 0, 0.07058824, 1,
2.440412, 1.265674, 1.364952, 1, 0, 0.06666667, 1,
2.463017, 0.8778796, 0.07162937, 1, 0, 0.05882353, 1,
2.478719, 0.7890806, 0.06544479, 1, 0, 0.05490196, 1,
2.586654, -0.8325934, 2.152349, 1, 0, 0.04705882, 1,
2.614952, -1.12499, 1.59319, 1, 0, 0.04313726, 1,
2.687278, 0.6775238, 2.692871, 1, 0, 0.03529412, 1,
2.753329, 0.8126034, 2.447623, 1, 0, 0.03137255, 1,
2.770302, 0.4330472, 1.158476, 1, 0, 0.02352941, 1,
2.785359, 0.8759103, 1.126738, 1, 0, 0.01960784, 1,
2.926756, -0.3818357, 0.8435647, 1, 0, 0.01176471, 1,
3.238893, -0.6316356, 2.173527, 1, 0, 0.007843138, 1
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
0.08221066, -4.750825, -7.282396, 0, -0.5, 0.5, 0.5,
0.08221066, -4.750825, -7.282396, 1, -0.5, 0.5, 0.5,
0.08221066, -4.750825, -7.282396, 1, 1.5, 0.5, 0.5,
0.08221066, -4.750825, -7.282396, 0, 1.5, 0.5, 0.5
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
-4.144587, -0.3277769, -7.282396, 0, -0.5, 0.5, 0.5,
-4.144587, -0.3277769, -7.282396, 1, -0.5, 0.5, 0.5,
-4.144587, -0.3277769, -7.282396, 1, 1.5, 0.5, 0.5,
-4.144587, -0.3277769, -7.282396, 0, 1.5, 0.5, 0.5
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
-4.144587, -4.750825, 0.2402904, 0, -0.5, 0.5, 0.5,
-4.144587, -4.750825, 0.2402904, 1, -0.5, 0.5, 0.5,
-4.144587, -4.750825, 0.2402904, 1, 1.5, 0.5, 0.5,
-4.144587, -4.750825, 0.2402904, 0, 1.5, 0.5, 0.5
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
-3, -3.730122, -5.546391,
3, -3.730122, -5.546391,
-3, -3.730122, -5.546391,
-3, -3.900239, -5.835725,
-2, -3.730122, -5.546391,
-2, -3.900239, -5.835725,
-1, -3.730122, -5.546391,
-1, -3.900239, -5.835725,
0, -3.730122, -5.546391,
0, -3.900239, -5.835725,
1, -3.730122, -5.546391,
1, -3.900239, -5.835725,
2, -3.730122, -5.546391,
2, -3.900239, -5.835725,
3, -3.730122, -5.546391,
3, -3.900239, -5.835725
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
-3, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
-3, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
-3, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
-3, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
-2, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
-2, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
-2, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
-2, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
-1, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
-1, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
-1, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
-1, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
0, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
0, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
0, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
0, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
1, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
1, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
1, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
1, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
2, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
2, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
2, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
2, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5,
3, -4.240474, -6.414393, 0, -0.5, 0.5, 0.5,
3, -4.240474, -6.414393, 1, -0.5, 0.5, 0.5,
3, -4.240474, -6.414393, 1, 1.5, 0.5, 0.5,
3, -4.240474, -6.414393, 0, 1.5, 0.5, 0.5
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
-3.169172, -3, -5.546391,
-3.169172, 2, -5.546391,
-3.169172, -3, -5.546391,
-3.331741, -3, -5.835725,
-3.169172, -2, -5.546391,
-3.331741, -2, -5.835725,
-3.169172, -1, -5.546391,
-3.331741, -1, -5.835725,
-3.169172, 0, -5.546391,
-3.331741, 0, -5.835725,
-3.169172, 1, -5.546391,
-3.331741, 1, -5.835725,
-3.169172, 2, -5.546391,
-3.331741, 2, -5.835725
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
-3.656879, -3, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, -3, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, -3, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, -3, -6.414393, 0, 1.5, 0.5, 0.5,
-3.656879, -2, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, -2, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, -2, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, -2, -6.414393, 0, 1.5, 0.5, 0.5,
-3.656879, -1, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, -1, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, -1, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, -1, -6.414393, 0, 1.5, 0.5, 0.5,
-3.656879, 0, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, 0, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, 0, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, 0, -6.414393, 0, 1.5, 0.5, 0.5,
-3.656879, 1, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, 1, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, 1, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, 1, -6.414393, 0, 1.5, 0.5, 0.5,
-3.656879, 2, -6.414393, 0, -0.5, 0.5, 0.5,
-3.656879, 2, -6.414393, 1, -0.5, 0.5, 0.5,
-3.656879, 2, -6.414393, 1, 1.5, 0.5, 0.5,
-3.656879, 2, -6.414393, 0, 1.5, 0.5, 0.5
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
-3.169172, -3.730122, -4,
-3.169172, -3.730122, 4,
-3.169172, -3.730122, -4,
-3.331741, -3.900239, -4,
-3.169172, -3.730122, -2,
-3.331741, -3.900239, -2,
-3.169172, -3.730122, 0,
-3.331741, -3.900239, 0,
-3.169172, -3.730122, 2,
-3.331741, -3.900239, 2,
-3.169172, -3.730122, 4,
-3.331741, -3.900239, 4
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
-3.656879, -4.240474, -4, 0, -0.5, 0.5, 0.5,
-3.656879, -4.240474, -4, 1, -0.5, 0.5, 0.5,
-3.656879, -4.240474, -4, 1, 1.5, 0.5, 0.5,
-3.656879, -4.240474, -4, 0, 1.5, 0.5, 0.5,
-3.656879, -4.240474, -2, 0, -0.5, 0.5, 0.5,
-3.656879, -4.240474, -2, 1, -0.5, 0.5, 0.5,
-3.656879, -4.240474, -2, 1, 1.5, 0.5, 0.5,
-3.656879, -4.240474, -2, 0, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 0, 0, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 0, 1, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 0, 1, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 0, 0, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 2, 0, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 2, 1, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 2, 1, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 2, 0, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 4, 0, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 4, 1, -0.5, 0.5, 0.5,
-3.656879, -4.240474, 4, 1, 1.5, 0.5, 0.5,
-3.656879, -4.240474, 4, 0, 1.5, 0.5, 0.5
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
-3.169172, -3.730122, -5.546391,
-3.169172, 3.074568, -5.546391,
-3.169172, -3.730122, 6.026972,
-3.169172, 3.074568, 6.026972,
-3.169172, -3.730122, -5.546391,
-3.169172, -3.730122, 6.026972,
-3.169172, 3.074568, -5.546391,
-3.169172, 3.074568, 6.026972,
-3.169172, -3.730122, -5.546391,
3.333593, -3.730122, -5.546391,
-3.169172, -3.730122, 6.026972,
3.333593, -3.730122, 6.026972,
-3.169172, 3.074568, -5.546391,
3.333593, 3.074568, -5.546391,
-3.169172, 3.074568, 6.026972,
3.333593, 3.074568, 6.026972,
3.333593, -3.730122, -5.546391,
3.333593, 3.074568, -5.546391,
3.333593, -3.730122, 6.026972,
3.333593, 3.074568, 6.026972,
3.333593, -3.730122, -5.546391,
3.333593, -3.730122, 6.026972,
3.333593, 3.074568, -5.546391,
3.333593, 3.074568, 6.026972
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
var radius = 7.965668;
var distance = 35.44016;
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
mvMatrix.translate( -0.08221066, 0.3277769, -0.2402904 );
mvMatrix.scale( 1.324458, 1.265691, 0.7441775 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.44016);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-(2-chlorobenzyl)-3<-read.table("1-(2-chlorobenzyl)-3.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-(2-chlorobenzyl)-3$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzyl' not found
```

```r
y<-1-(2-chlorobenzyl)-3$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzyl' not found
```

```r
z<-1-(2-chlorobenzyl)-3$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzyl' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
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
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
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
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
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
var canvas = document.getElementById("testgl2textureCanvas");
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
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.074471, 0.5295146, -2.453019, 0, 0, 1, 1, 1,
-3.019326, 1.362825, -0.6641755, 1, 0, 0, 1, 1,
-2.876197, 1.496417, -0.07498959, 1, 0, 0, 1, 1,
-2.825444, -0.1754875, -1.200269, 1, 0, 0, 1, 1,
-2.78411, 0.1577751, -0.9300436, 1, 0, 0, 1, 1,
-2.692281, 0.2573373, -1.568963, 1, 0, 0, 1, 1,
-2.554862, 0.2108427, -1.103107, 0, 0, 0, 1, 1,
-2.452683, -1.178678, -0.4527766, 0, 0, 0, 1, 1,
-2.427192, 1.688818, -1.738093, 0, 0, 0, 1, 1,
-2.388063, 0.1997603, -0.6278389, 0, 0, 0, 1, 1,
-2.374611, -0.6713051, -0.4516116, 0, 0, 0, 1, 1,
-2.31078, 0.3676433, -2.526629, 0, 0, 0, 1, 1,
-2.310739, 1.001905, -2.462533, 0, 0, 0, 1, 1,
-2.265965, -0.7681455, -2.759937, 1, 1, 1, 1, 1,
-2.240908, 1.708337, -0.7838986, 1, 1, 1, 1, 1,
-2.21456, -0.139489, -0.3521433, 1, 1, 1, 1, 1,
-2.191252, -0.5076018, -0.7908891, 1, 1, 1, 1, 1,
-2.159931, -0.06122621, -0.8383055, 1, 1, 1, 1, 1,
-2.033224, 0.9823263, -1.719788, 1, 1, 1, 1, 1,
-2.012748, -1.434644, -2.862144, 1, 1, 1, 1, 1,
-2.010774, -1.025885, -1.82528, 1, 1, 1, 1, 1,
-2.009873, 0.599381, -0.07014412, 1, 1, 1, 1, 1,
-1.985006, -1.876644, -2.94626, 1, 1, 1, 1, 1,
-1.953081, 0.815266, -2.200169, 1, 1, 1, 1, 1,
-1.896481, 0.1351783, -0.9384859, 1, 1, 1, 1, 1,
-1.878797, -0.2872126, -1.641779, 1, 1, 1, 1, 1,
-1.849733, -1.124547, -1.833801, 1, 1, 1, 1, 1,
-1.844818, 1.00104, -1.050507, 1, 1, 1, 1, 1,
-1.831756, -1.34674, -3.16089, 0, 0, 1, 1, 1,
-1.806725, -0.1131626, -0.7077029, 1, 0, 0, 1, 1,
-1.805352, -0.5756971, -1.967525, 1, 0, 0, 1, 1,
-1.75454, -0.5980049, -2.640604, 1, 0, 0, 1, 1,
-1.739122, 0.3772753, -0.1550813, 1, 0, 0, 1, 1,
-1.735809, -0.0170822, -2.709716, 1, 0, 0, 1, 1,
-1.687727, 1.276341, -0.9671515, 0, 0, 0, 1, 1,
-1.675475, 0.8791894, -2.047383, 0, 0, 0, 1, 1,
-1.627421, -0.7810801, 0.3300866, 0, 0, 0, 1, 1,
-1.611911, -1.125115, -1.408341, 0, 0, 0, 1, 1,
-1.610574, 0.2850398, -1.435455, 0, 0, 0, 1, 1,
-1.607329, -1.47611, -2.06536, 0, 0, 0, 1, 1,
-1.593787, -1.810207, -1.19665, 0, 0, 0, 1, 1,
-1.592625, -0.6955942, -2.674795, 1, 1, 1, 1, 1,
-1.582106, -1.849354, -1.50821, 1, 1, 1, 1, 1,
-1.573023, 0.8333507, -0.6146746, 1, 1, 1, 1, 1,
-1.571623, -0.2923285, -2.067789, 1, 1, 1, 1, 1,
-1.569949, 0.3910141, -1.066957, 1, 1, 1, 1, 1,
-1.56479, -0.8627193, -3.408452, 1, 1, 1, 1, 1,
-1.56139, 0.4039232, -1.247254, 1, 1, 1, 1, 1,
-1.557694, 0.4368124, -2.502485, 1, 1, 1, 1, 1,
-1.550628, -1.011207, -1.772035, 1, 1, 1, 1, 1,
-1.548301, -1.824466, -2.903002, 1, 1, 1, 1, 1,
-1.536242, -0.7075269, -3.337757, 1, 1, 1, 1, 1,
-1.530706, 0.591284, -1.761311, 1, 1, 1, 1, 1,
-1.5281, 0.5169607, -1.948815, 1, 1, 1, 1, 1,
-1.500212, -0.794949, -1.440982, 1, 1, 1, 1, 1,
-1.486425, 0.2070978, -0.528294, 1, 1, 1, 1, 1,
-1.482158, -0.8079665, -3.557066, 0, 0, 1, 1, 1,
-1.481068, 2.367471, -0.1236819, 1, 0, 0, 1, 1,
-1.480954, 0.1499736, -0.1099812, 1, 0, 0, 1, 1,
-1.476081, 0.3680412, -0.9916312, 1, 0, 0, 1, 1,
-1.473843, 0.6796727, -0.2678736, 1, 0, 0, 1, 1,
-1.473626, -0.4079632, -0.9601699, 1, 0, 0, 1, 1,
-1.458869, -2.573489, -0.07961464, 0, 0, 0, 1, 1,
-1.458739, 0.7499653, -0.1787129, 0, 0, 0, 1, 1,
-1.450695, 0.7196397, -1.624689, 0, 0, 0, 1, 1,
-1.446347, -0.9741001, -2.57897, 0, 0, 0, 1, 1,
-1.44528, 0.6659644, -0.4247747, 0, 0, 0, 1, 1,
-1.437887, -0.3554547, -0.283974, 0, 0, 0, 1, 1,
-1.435341, -0.6023441, -2.173462, 0, 0, 0, 1, 1,
-1.434269, 0.6324399, 0.4927953, 1, 1, 1, 1, 1,
-1.431512, 1.371709, -1.681325, 1, 1, 1, 1, 1,
-1.429132, -1.076932, -1.960039, 1, 1, 1, 1, 1,
-1.419255, 0.920646, 0.6719583, 1, 1, 1, 1, 1,
-1.416273, -0.2777257, -1.810578, 1, 1, 1, 1, 1,
-1.415218, 0.4410815, -2.073711, 1, 1, 1, 1, 1,
-1.40886, 0.6873192, -0.4277702, 1, 1, 1, 1, 1,
-1.407021, -0.07541016, -2.207782, 1, 1, 1, 1, 1,
-1.40646, -0.275284, -2.811609, 1, 1, 1, 1, 1,
-1.405861, 0.6757643, -1.566718, 1, 1, 1, 1, 1,
-1.394697, 0.2182196, -2.757657, 1, 1, 1, 1, 1,
-1.393085, 2.399344, -0.8323849, 1, 1, 1, 1, 1,
-1.392513, -0.1130582, -2.121145, 1, 1, 1, 1, 1,
-1.391275, 0.04776416, -0.9175618, 1, 1, 1, 1, 1,
-1.3895, -0.4250614, -3.22001, 1, 1, 1, 1, 1,
-1.380737, 1.658399, -0.6714341, 0, 0, 1, 1, 1,
-1.371872, 0.4181996, -0.9789833, 1, 0, 0, 1, 1,
-1.361347, -2.136419, -3.156482, 1, 0, 0, 1, 1,
-1.354695, -0.2087289, -3.00578, 1, 0, 0, 1, 1,
-1.354607, 1.45488, -1.154987, 1, 0, 0, 1, 1,
-1.33119, 1.726899, 0.2628722, 1, 0, 0, 1, 1,
-1.330261, -0.5156422, -3.400198, 0, 0, 0, 1, 1,
-1.324176, -1.10517, -2.403932, 0, 0, 0, 1, 1,
-1.32162, 2.005227, -2.098129, 0, 0, 0, 1, 1,
-1.31417, -0.952638, -3.238818, 0, 0, 0, 1, 1,
-1.31097, -0.4911128, -2.190202, 0, 0, 0, 1, 1,
-1.298164, 0.2362472, -0.7586862, 0, 0, 0, 1, 1,
-1.291512, 0.9015068, -1.779741, 0, 0, 0, 1, 1,
-1.289348, -1.26887, -3.008584, 1, 1, 1, 1, 1,
-1.286167, 0.3791936, -1.646552, 1, 1, 1, 1, 1,
-1.271028, -1.343033, -2.964816, 1, 1, 1, 1, 1,
-1.267677, 1.488495, -0.3291067, 1, 1, 1, 1, 1,
-1.266291, 0.6638243, -0.001428233, 1, 1, 1, 1, 1,
-1.258031, 0.2751278, -0.4411127, 1, 1, 1, 1, 1,
-1.2544, -0.2469231, -2.40309, 1, 1, 1, 1, 1,
-1.253038, 0.9079281, -1.418152, 1, 1, 1, 1, 1,
-1.25169, 0.2796518, -1.296531, 1, 1, 1, 1, 1,
-1.24093, -0.5207048, -2.454208, 1, 1, 1, 1, 1,
-1.236451, 1.274712, -1.760546, 1, 1, 1, 1, 1,
-1.233474, 0.1215511, -1.088937, 1, 1, 1, 1, 1,
-1.229401, -0.1538014, -2.636446, 1, 1, 1, 1, 1,
-1.229259, -1.474727, -3.331564, 1, 1, 1, 1, 1,
-1.222208, 0.7302613, -0.781958, 1, 1, 1, 1, 1,
-1.207211, 0.05439532, -0.2767064, 0, 0, 1, 1, 1,
-1.205465, 1.064223, -1.724251, 1, 0, 0, 1, 1,
-1.204231, -0.6197737, -2.138426, 1, 0, 0, 1, 1,
-1.19118, -0.5297496, -2.342954, 1, 0, 0, 1, 1,
-1.184434, -2.052674, -2.166539, 1, 0, 0, 1, 1,
-1.16915, -0.5463371, -2.212003, 1, 0, 0, 1, 1,
-1.168651, 0.3669929, -2.361965, 0, 0, 0, 1, 1,
-1.165258, -0.5237001, -2.82126, 0, 0, 0, 1, 1,
-1.160347, 0.8793932, -0.8551347, 0, 0, 0, 1, 1,
-1.156392, -1.732875, -2.66768, 0, 0, 0, 1, 1,
-1.155849, 0.8219978, -0.8445974, 0, 0, 0, 1, 1,
-1.150996, -0.4349013, -0.2674128, 0, 0, 0, 1, 1,
-1.141843, -1.014248, -2.330577, 0, 0, 0, 1, 1,
-1.116042, 0.7814577, -1.739205, 1, 1, 1, 1, 1,
-1.1137, -0.2038886, -2.047141, 1, 1, 1, 1, 1,
-1.111721, -0.09067494, -2.009198, 1, 1, 1, 1, 1,
-1.111262, 2.349201, -1.599629, 1, 1, 1, 1, 1,
-1.105151, 1.954312, -0.3548494, 1, 1, 1, 1, 1,
-1.101323, 1.030161, 0.3696353, 1, 1, 1, 1, 1,
-1.095205, 0.4919613, -1.574952, 1, 1, 1, 1, 1,
-1.0842, -0.296199, -2.643455, 1, 1, 1, 1, 1,
-1.079122, -1.572186, -2.509905, 1, 1, 1, 1, 1,
-1.07904, 0.8737287, -1.877014, 1, 1, 1, 1, 1,
-1.069476, 0.8905634, -3.270717, 1, 1, 1, 1, 1,
-1.062991, -0.1631694, -0.8511286, 1, 1, 1, 1, 1,
-1.062028, 1.127009, -0.6024869, 1, 1, 1, 1, 1,
-1.057095, -2.781827, -3.935593, 1, 1, 1, 1, 1,
-1.054222, 0.4680435, -1.324446, 1, 1, 1, 1, 1,
-1.051352, -1.190989, -3.672406, 0, 0, 1, 1, 1,
-1.049281, -0.6784208, -1.31577, 1, 0, 0, 1, 1,
-1.047654, 0.9292696, -0.3548259, 1, 0, 0, 1, 1,
-1.04285, 0.5139954, 0.2760362, 1, 0, 0, 1, 1,
-1.0389, -0.3873354, -2.5844, 1, 0, 0, 1, 1,
-1.032747, -1.965986, -3.975843, 1, 0, 0, 1, 1,
-1.031785, -0.184141, -1.204821, 0, 0, 0, 1, 1,
-1.029759, -0.3345799, -2.467825, 0, 0, 0, 1, 1,
-1.029717, -0.3612588, -1.063277, 0, 0, 0, 1, 1,
-1.026241, 1.532169, 0.2476502, 0, 0, 0, 1, 1,
-1.019794, -0.09065558, -2.469783, 0, 0, 0, 1, 1,
-1.019566, 0.610342, 0.1924988, 0, 0, 0, 1, 1,
-1.01703, -0.5982504, -3.446822, 0, 0, 0, 1, 1,
-1.014421, -1.173922, -1.497345, 1, 1, 1, 1, 1,
-1.013545, -0.4422648, -1.206508, 1, 1, 1, 1, 1,
-1.008765, 1.312195, -1.401541, 1, 1, 1, 1, 1,
-1.008625, 0.8710505, 0.02592541, 1, 1, 1, 1, 1,
-1.00355, 0.4793652, -1.584183, 1, 1, 1, 1, 1,
-1.003121, -0.4040363, -2.380621, 1, 1, 1, 1, 1,
-1.001069, 0.4077896, -0.8661004, 1, 1, 1, 1, 1,
-0.9933737, 1.697063, 0.9541765, 1, 1, 1, 1, 1,
-0.9656047, -0.5721275, -1.879219, 1, 1, 1, 1, 1,
-0.9642452, -2.217421, -3.544317, 1, 1, 1, 1, 1,
-0.9609718, -0.723282, -2.46773, 1, 1, 1, 1, 1,
-0.9607605, -1.179761, -3.471249, 1, 1, 1, 1, 1,
-0.9596952, 0.219477, -1.18192, 1, 1, 1, 1, 1,
-0.957356, 0.02655285, -2.44258, 1, 1, 1, 1, 1,
-0.9534887, -0.6931179, -1.684146, 1, 1, 1, 1, 1,
-0.9533498, 1.199051, -1.377591, 0, 0, 1, 1, 1,
-0.9531386, 0.3775891, -1.496751, 1, 0, 0, 1, 1,
-0.9494092, 1.126973, -0.5879796, 1, 0, 0, 1, 1,
-0.9413143, -0.638073, -3.547386, 1, 0, 0, 1, 1,
-0.9391564, 1.039383, -0.6496191, 1, 0, 0, 1, 1,
-0.9298544, -1.30917, -2.431329, 1, 0, 0, 1, 1,
-0.9277012, -0.5325182, -1.435779, 0, 0, 0, 1, 1,
-0.9273201, 1.401157, 0.5346362, 0, 0, 0, 1, 1,
-0.9242855, -1.896039, -1.120909, 0, 0, 0, 1, 1,
-0.915902, -0.7579274, -0.9084079, 0, 0, 0, 1, 1,
-0.9153526, -1.251568, -3.889577, 0, 0, 0, 1, 1,
-0.9139417, -0.1562037, -2.294492, 0, 0, 0, 1, 1,
-0.9088646, 0.2697882, -2.095112, 0, 0, 0, 1, 1,
-0.9039907, -1.235804, -1.395097, 1, 1, 1, 1, 1,
-0.9010469, -1.909271, -3.441286, 1, 1, 1, 1, 1,
-0.8984058, 1.144469, -0.1508173, 1, 1, 1, 1, 1,
-0.8944811, -1.950995, -1.211822, 1, 1, 1, 1, 1,
-0.8826491, -1.595864, -3.983579, 1, 1, 1, 1, 1,
-0.8813836, 0.7956795, 0.7817729, 1, 1, 1, 1, 1,
-0.8810504, -3.631024, -1.877192, 1, 1, 1, 1, 1,
-0.8743193, 0.5223311, -1.559353, 1, 1, 1, 1, 1,
-0.8711541, 0.9652497, 0.6206445, 1, 1, 1, 1, 1,
-0.8690317, -1.946655, -2.748432, 1, 1, 1, 1, 1,
-0.8652534, -0.2687267, -1.079252, 1, 1, 1, 1, 1,
-0.8647397, 1.668388, -0.966406, 1, 1, 1, 1, 1,
-0.8576646, 2.133016, -0.3078169, 1, 1, 1, 1, 1,
-0.8569965, 0.2193524, -0.4562796, 1, 1, 1, 1, 1,
-0.8561462, 0.003148023, -1.804591, 1, 1, 1, 1, 1,
-0.8512911, 0.5698977, 0.416741, 0, 0, 1, 1, 1,
-0.8502342, 0.8250746, -0.9387526, 1, 0, 0, 1, 1,
-0.8486144, -0.1208977, -0.8042577, 1, 0, 0, 1, 1,
-0.8473047, 0.05702091, -0.6048224, 1, 0, 0, 1, 1,
-0.846568, -0.531309, -2.252176, 1, 0, 0, 1, 1,
-0.8440788, -1.608015, -3.023008, 1, 0, 0, 1, 1,
-0.840213, 0.6533769, 0.5437846, 0, 0, 0, 1, 1,
-0.8393596, 0.4842269, -0.1995978, 0, 0, 0, 1, 1,
-0.8348337, 0.7136195, -1.414707, 0, 0, 0, 1, 1,
-0.8332824, 0.1970599, -1.752669, 0, 0, 0, 1, 1,
-0.829859, 0.01505267, -0.4003258, 0, 0, 0, 1, 1,
-0.8287488, 0.07093555, -2.290607, 0, 0, 0, 1, 1,
-0.823257, -1.230875, -2.975667, 0, 0, 0, 1, 1,
-0.8199328, -1.227043, -2.333276, 1, 1, 1, 1, 1,
-0.8192084, -1.226223, -3.304308, 1, 1, 1, 1, 1,
-0.8159441, 0.2229245, -2.076448, 1, 1, 1, 1, 1,
-0.814312, -0.7614383, -2.174452, 1, 1, 1, 1, 1,
-0.8125885, 0.9783218, -1.076775, 1, 1, 1, 1, 1,
-0.8105567, 0.05632116, -0.9273533, 1, 1, 1, 1, 1,
-0.798741, 0.3126137, -0.4656411, 1, 1, 1, 1, 1,
-0.7986789, 1.361086, 0.1038702, 1, 1, 1, 1, 1,
-0.7957591, -2.198006, -2.634669, 1, 1, 1, 1, 1,
-0.795449, -1.600295, -3.001735, 1, 1, 1, 1, 1,
-0.7942871, -1.849209, -1.434993, 1, 1, 1, 1, 1,
-0.7939417, 0.02746609, -2.0342, 1, 1, 1, 1, 1,
-0.7933028, 0.1348742, -1.271335, 1, 1, 1, 1, 1,
-0.7904369, 0.9371578, -2.071198, 1, 1, 1, 1, 1,
-0.7887354, 1.384406, 0.2928389, 1, 1, 1, 1, 1,
-0.7882944, -0.9604534, -3.323589, 0, 0, 1, 1, 1,
-0.7880213, -0.8601263, -3.279343, 1, 0, 0, 1, 1,
-0.7854768, -1.502798, -2.989958, 1, 0, 0, 1, 1,
-0.7817016, -0.09341577, -1.805882, 1, 0, 0, 1, 1,
-0.7808288, 0.4848849, -1.332916, 1, 0, 0, 1, 1,
-0.7790449, -0.08530826, -2.315173, 1, 0, 0, 1, 1,
-0.7718605, -0.6297635, -2.280758, 0, 0, 0, 1, 1,
-0.768419, -0.3050626, -1.900554, 0, 0, 0, 1, 1,
-0.7683073, -0.9385457, -1.775859, 0, 0, 0, 1, 1,
-0.767233, 0.6254265, 1.393117, 0, 0, 0, 1, 1,
-0.7659562, 1.112395, -1.462394, 0, 0, 0, 1, 1,
-0.7659028, 0.4468789, -0.9165694, 0, 0, 0, 1, 1,
-0.7640595, 1.014189, 0.4747471, 0, 0, 0, 1, 1,
-0.7571416, 0.5784169, -2.285001, 1, 1, 1, 1, 1,
-0.7479436, -0.6496498, -1.077043, 1, 1, 1, 1, 1,
-0.744478, 0.9123002, -0.8566957, 1, 1, 1, 1, 1,
-0.7391815, 0.4025056, -0.2674556, 1, 1, 1, 1, 1,
-0.7270728, 0.4129061, -2.121424, 1, 1, 1, 1, 1,
-0.7147464, 0.4961362, -0.6789659, 1, 1, 1, 1, 1,
-0.7132866, 0.7788123, -2.112725, 1, 1, 1, 1, 1,
-0.7032424, 0.8108188, -0.5526337, 1, 1, 1, 1, 1,
-0.7001903, -0.3923947, -2.190361, 1, 1, 1, 1, 1,
-0.6878137, 0.05695573, -1.622311, 1, 1, 1, 1, 1,
-0.6877869, 0.8926021, 0.1106654, 1, 1, 1, 1, 1,
-0.6859307, -0.5218992, -3.0988, 1, 1, 1, 1, 1,
-0.6767169, 0.9595326, -1.237031, 1, 1, 1, 1, 1,
-0.6726385, -0.8833536, -4.08233, 1, 1, 1, 1, 1,
-0.6714347, -0.2989748, -2.802882, 1, 1, 1, 1, 1,
-0.6693608, 0.05963278, -1.245406, 0, 0, 1, 1, 1,
-0.6649499, 1.732113, -0.1179581, 1, 0, 0, 1, 1,
-0.658966, -1.499028, -2.759713, 1, 0, 0, 1, 1,
-0.6559277, -0.07228458, -1.236507, 1, 0, 0, 1, 1,
-0.6524942, -0.4031114, -3.467336, 1, 0, 0, 1, 1,
-0.6510834, 0.05786197, -1.072283, 1, 0, 0, 1, 1,
-0.648313, -2.136928, -3.880239, 0, 0, 0, 1, 1,
-0.644838, -0.8506401, -0.3911276, 0, 0, 0, 1, 1,
-0.6379731, 0.4595307, -0.5088438, 0, 0, 0, 1, 1,
-0.6342556, 1.062937, 0.8774001, 0, 0, 0, 1, 1,
-0.6325684, -0.8637163, -1.04895, 0, 0, 0, 1, 1,
-0.6313728, 0.2995479, -1.341364, 0, 0, 0, 1, 1,
-0.6295796, -1.139402, -3.292393, 0, 0, 0, 1, 1,
-0.6281338, 1.464862, -1.925313, 1, 1, 1, 1, 1,
-0.6260151, 1.37541, -1.051256, 1, 1, 1, 1, 1,
-0.6214589, 0.1924096, -0.6050619, 1, 1, 1, 1, 1,
-0.6195683, -0.7159213, -2.551354, 1, 1, 1, 1, 1,
-0.6183987, 0.6020107, -1.119071, 1, 1, 1, 1, 1,
-0.6183432, 0.4041458, -1.024862, 1, 1, 1, 1, 1,
-0.6179129, -0.2651474, -2.078614, 1, 1, 1, 1, 1,
-0.6142944, 0.4715987, 0.1339054, 1, 1, 1, 1, 1,
-0.6124101, 0.3002979, -0.9327497, 1, 1, 1, 1, 1,
-0.6122382, 0.2799004, -0.6663725, 1, 1, 1, 1, 1,
-0.6103153, 1.114092, 0.1985955, 1, 1, 1, 1, 1,
-0.6102834, 1.355824, -0.6063964, 1, 1, 1, 1, 1,
-0.6071979, 0.2827763, -3.034495, 1, 1, 1, 1, 1,
-0.6054479, -0.4916249, -1.768447, 1, 1, 1, 1, 1,
-0.6038231, -1.226799, -3.517963, 1, 1, 1, 1, 1,
-0.5997754, -1.626106, -1.048303, 0, 0, 1, 1, 1,
-0.5994623, -0.6515461, -1.340305, 1, 0, 0, 1, 1,
-0.599127, -0.9550437, -1.796288, 1, 0, 0, 1, 1,
-0.5953814, -1.15148, -1.875594, 1, 0, 0, 1, 1,
-0.5911604, -1.625882, -3.111172, 1, 0, 0, 1, 1,
-0.5853818, 0.08396744, -2.374154, 1, 0, 0, 1, 1,
-0.582471, -0.8691144, -0.7976927, 0, 0, 0, 1, 1,
-0.5790636, 2.366163, 0.8201141, 0, 0, 0, 1, 1,
-0.5751902, 1.214131, 0.4203085, 0, 0, 0, 1, 1,
-0.5751734, -0.08841311, -2.773368, 0, 0, 0, 1, 1,
-0.5707137, -0.7212642, -3.443071, 0, 0, 0, 1, 1,
-0.5646017, 0.2716985, -1.502295, 0, 0, 0, 1, 1,
-0.561596, -1.481311, -3.85987, 0, 0, 0, 1, 1,
-0.5596906, 0.3340881, -1.338197, 1, 1, 1, 1, 1,
-0.5535367, -1.954879, -3.73965, 1, 1, 1, 1, 1,
-0.5521811, -2.86234, -2.781678, 1, 1, 1, 1, 1,
-0.5504547, 1.774292, -0.1557697, 1, 1, 1, 1, 1,
-0.5490218, 0.9762951, -0.4212559, 1, 1, 1, 1, 1,
-0.5443756, -1.549245, -1.844581, 1, 1, 1, 1, 1,
-0.5395476, -1.258563, -4.068309, 1, 1, 1, 1, 1,
-0.5393041, -1.546317, -0.6202368, 1, 1, 1, 1, 1,
-0.5382182, 0.007229919, -1.2774, 1, 1, 1, 1, 1,
-0.5361426, 1.180848, -0.4798009, 1, 1, 1, 1, 1,
-0.5344397, 0.9417065, 0.6212311, 1, 1, 1, 1, 1,
-0.5321653, -0.3624781, -3.330216, 1, 1, 1, 1, 1,
-0.5265429, -1.257316, -1.067737, 1, 1, 1, 1, 1,
-0.5246439, 0.03220171, -1.284998, 1, 1, 1, 1, 1,
-0.5239784, 0.270583, -0.6902769, 1, 1, 1, 1, 1,
-0.5206154, -0.2890471, -3.206948, 0, 0, 1, 1, 1,
-0.5168497, 0.07432449, -0.7556959, 1, 0, 0, 1, 1,
-0.5047833, 0.3350611, -0.8089129, 1, 0, 0, 1, 1,
-0.4986194, -0.4711121, -2.41581, 1, 0, 0, 1, 1,
-0.4964832, -0.6421389, -3.206672, 1, 0, 0, 1, 1,
-0.4937602, -1.544712, -4.578544, 1, 0, 0, 1, 1,
-0.4923874, -0.8252858, -1.124498, 0, 0, 0, 1, 1,
-0.4921601, -0.9977225, -3.982264, 0, 0, 0, 1, 1,
-0.4908749, 0.2724396, -0.5691353, 0, 0, 0, 1, 1,
-0.4898665, 0.7292452, -1.205199, 0, 0, 0, 1, 1,
-0.4898222, -0.3097068, -1.860802, 0, 0, 0, 1, 1,
-0.4891701, -0.2360974, -3.489725, 0, 0, 0, 1, 1,
-0.4872804, -2.784698, -1.156357, 0, 0, 0, 1, 1,
-0.4851049, -1.747549, -3.65518, 1, 1, 1, 1, 1,
-0.4843326, 1.495009, 0.5144826, 1, 1, 1, 1, 1,
-0.4743905, -0.6522885, -2.450101, 1, 1, 1, 1, 1,
-0.473839, -0.1989879, -1.16183, 1, 1, 1, 1, 1,
-0.471099, -0.3332043, -4.21539, 1, 1, 1, 1, 1,
-0.4701088, 1.636113, -2.002263, 1, 1, 1, 1, 1,
-0.4665008, 0.03356328, -1.251806, 1, 1, 1, 1, 1,
-0.4644, 1.279225, 0.05471448, 1, 1, 1, 1, 1,
-0.4640556, 2.026573, 0.1080994, 1, 1, 1, 1, 1,
-0.4599372, 0.664865, -2.27928, 1, 1, 1, 1, 1,
-0.4585551, -1.030523, -1.356083, 1, 1, 1, 1, 1,
-0.4570977, -0.7990022, -2.386136, 1, 1, 1, 1, 1,
-0.4533468, 2.346269, -0.9068319, 1, 1, 1, 1, 1,
-0.4528237, 1.920622, 1.430374, 1, 1, 1, 1, 1,
-0.4517847, 1.429086, -0.2267903, 1, 1, 1, 1, 1,
-0.451004, 0.1902748, -1.240531, 0, 0, 1, 1, 1,
-0.4478143, 1.187407, 0.1908285, 1, 0, 0, 1, 1,
-0.4426042, 0.8029086, 0.01391905, 1, 0, 0, 1, 1,
-0.4414575, -0.4106468, -3.023526, 1, 0, 0, 1, 1,
-0.4411977, -0.4359042, -3.181361, 1, 0, 0, 1, 1,
-0.4411232, -0.2748087, -0.1124036, 1, 0, 0, 1, 1,
-0.4406876, -1.056029, -1.886418, 0, 0, 0, 1, 1,
-0.430585, -0.7669609, -2.373935, 0, 0, 0, 1, 1,
-0.4281846, 1.479273, 1.294764, 0, 0, 0, 1, 1,
-0.4275766, 0.753663, -1.90779, 0, 0, 0, 1, 1,
-0.4246298, 0.6170205, -0.786729, 0, 0, 0, 1, 1,
-0.4236661, 0.2404635, -1.034635, 0, 0, 0, 1, 1,
-0.4234439, -0.004771596, -2.30918, 0, 0, 0, 1, 1,
-0.4220943, -0.8577405, -2.794037, 1, 1, 1, 1, 1,
-0.420525, 1.196242, -0.155327, 1, 1, 1, 1, 1,
-0.4190249, -0.3796752, -2.199179, 1, 1, 1, 1, 1,
-0.4168419, 1.828669, -0.48673, 1, 1, 1, 1, 1,
-0.4167932, 1.123701, -2.754931, 1, 1, 1, 1, 1,
-0.4103442, -1.03102, -4.099912, 1, 1, 1, 1, 1,
-0.3993132, 0.2017552, -0.02409496, 1, 1, 1, 1, 1,
-0.3958392, 0.3144249, -0.8641121, 1, 1, 1, 1, 1,
-0.3946139, 0.4215227, -1.577875, 1, 1, 1, 1, 1,
-0.3926054, -0.8741778, -3.951297, 1, 1, 1, 1, 1,
-0.3892848, -0.05699015, -3.902074, 1, 1, 1, 1, 1,
-0.386237, -1.146983, -2.499203, 1, 1, 1, 1, 1,
-0.3838545, -0.5831381, -1.996652, 1, 1, 1, 1, 1,
-0.3818299, -0.4049595, -2.205621, 1, 1, 1, 1, 1,
-0.3768969, -0.3159191, -2.752851, 1, 1, 1, 1, 1,
-0.3764892, 1.353323, 0.6303754, 0, 0, 1, 1, 1,
-0.3758659, 0.5507704, -0.8348179, 1, 0, 0, 1, 1,
-0.3721306, 0.6544757, -1.357974, 1, 0, 0, 1, 1,
-0.3702665, -1.271595, -3.651019, 1, 0, 0, 1, 1,
-0.3573921, 0.1583457, 0.3081264, 1, 0, 0, 1, 1,
-0.3563593, -0.8923586, -2.948632, 1, 0, 0, 1, 1,
-0.3560416, 0.1518192, -0.1697672, 0, 0, 0, 1, 1,
-0.3544436, -0.9941669, -2.867199, 0, 0, 0, 1, 1,
-0.3540444, -1.152903, -5.019096, 0, 0, 0, 1, 1,
-0.3493866, -0.7504166, -2.095248, 0, 0, 0, 1, 1,
-0.3452826, -0.002845632, -3.39124, 0, 0, 0, 1, 1,
-0.3382514, -1.36567, -5.377847, 0, 0, 0, 1, 1,
-0.337155, -0.5139929, -2.343381, 0, 0, 0, 1, 1,
-0.3348894, -0.2823861, -3.783238, 1, 1, 1, 1, 1,
-0.3317382, 1.787782, -0.5348859, 1, 1, 1, 1, 1,
-0.3312888, 0.4502198, 0.6304694, 1, 1, 1, 1, 1,
-0.3279617, -0.5486037, -1.618965, 1, 1, 1, 1, 1,
-0.3277109, 0.4837342, -0.1573239, 1, 1, 1, 1, 1,
-0.3260326, 0.2291973, -0.2639836, 1, 1, 1, 1, 1,
-0.3249138, 0.727161, 0.072869, 1, 1, 1, 1, 1,
-0.3247371, -0.6820779, -2.460892, 1, 1, 1, 1, 1,
-0.3229914, -1.019344, -1.806598, 1, 1, 1, 1, 1,
-0.3183169, -1.202675, -3.708568, 1, 1, 1, 1, 1,
-0.3151609, -0.9294255, -3.508377, 1, 1, 1, 1, 1,
-0.3126614, 0.8926515, -2.179805, 1, 1, 1, 1, 1,
-0.3096817, -1.4084, -1.870378, 1, 1, 1, 1, 1,
-0.308713, -0.1416856, -2.202315, 1, 1, 1, 1, 1,
-0.3082121, 1.725888, -1.416221, 1, 1, 1, 1, 1,
-0.2991596, 0.8297637, -0.8722532, 0, 0, 1, 1, 1,
-0.2973896, -0.001519419, -3.461273, 1, 0, 0, 1, 1,
-0.2857803, -0.3820391, -1.197585, 1, 0, 0, 1, 1,
-0.2851333, 0.3280225, 0.0353578, 1, 0, 0, 1, 1,
-0.2808149, -0.318272, -3.27352, 1, 0, 0, 1, 1,
-0.2793672, -0.001597722, -2.132697, 1, 0, 0, 1, 1,
-0.2773308, 0.04457621, -0.6567141, 0, 0, 0, 1, 1,
-0.2754748, -0.2665004, -0.6959946, 0, 0, 0, 1, 1,
-0.2661221, 0.2219133, -2.510389, 0, 0, 0, 1, 1,
-0.2653059, 1.920364, -0.09440854, 0, 0, 0, 1, 1,
-0.2633493, 0.05813077, 0.3834614, 0, 0, 0, 1, 1,
-0.2608406, -0.6018427, -2.715875, 0, 0, 0, 1, 1,
-0.2525456, 0.8137784, -0.7135967, 0, 0, 0, 1, 1,
-0.2505954, -0.8870645, -1.28095, 1, 1, 1, 1, 1,
-0.2463938, -0.4899148, -3.008201, 1, 1, 1, 1, 1,
-0.2460742, -0.6165424, -3.87944, 1, 1, 1, 1, 1,
-0.2459724, -1.197958, -3.405739, 1, 1, 1, 1, 1,
-0.2458237, 0.3094929, 0.005477, 1, 1, 1, 1, 1,
-0.244057, -0.7801926, -2.268922, 1, 1, 1, 1, 1,
-0.2403109, 1.364852, -0.2357545, 1, 1, 1, 1, 1,
-0.2367407, -2.271137, -3.433357, 1, 1, 1, 1, 1,
-0.227204, 0.6164053, -2.256973, 1, 1, 1, 1, 1,
-0.2271871, 0.9594536, 0.2325569, 1, 1, 1, 1, 1,
-0.2268148, 0.3111371, -1.247743, 1, 1, 1, 1, 1,
-0.2239945, -0.517344, -1.373842, 1, 1, 1, 1, 1,
-0.2220466, -0.4543189, -2.325386, 1, 1, 1, 1, 1,
-0.2218294, 1.311056, 0.08561456, 1, 1, 1, 1, 1,
-0.2185866, 2.047649, 1.237179, 1, 1, 1, 1, 1,
-0.2174294, 0.4079458, 0.1372273, 0, 0, 1, 1, 1,
-0.215882, -0.4414987, -2.026183, 1, 0, 0, 1, 1,
-0.2127032, -0.8224992, -3.134465, 1, 0, 0, 1, 1,
-0.2114624, 0.3204185, 0.5541556, 1, 0, 0, 1, 1,
-0.2092953, 0.5168073, -0.6602568, 1, 0, 0, 1, 1,
-0.2089346, 0.2319219, -0.02103857, 1, 0, 0, 1, 1,
-0.2031015, -0.7009419, -2.857477, 0, 0, 0, 1, 1,
-0.2019285, -0.1928254, -2.583933, 0, 0, 0, 1, 1,
-0.2000553, -0.9610347, -2.615933, 0, 0, 0, 1, 1,
-0.1942268, -2.020965, -2.791714, 0, 0, 0, 1, 1,
-0.1920204, 0.5482223, 0.393119, 0, 0, 0, 1, 1,
-0.1868367, -1.372931, -3.472975, 0, 0, 0, 1, 1,
-0.185674, 0.9213189, -1.679, 0, 0, 0, 1, 1,
-0.1809538, -0.6569304, -1.916442, 1, 1, 1, 1, 1,
-0.1792993, -1.861066, -3.603263, 1, 1, 1, 1, 1,
-0.1788592, -2.05534, -3.709764, 1, 1, 1, 1, 1,
-0.1777623, 0.7815513, 0.511795, 1, 1, 1, 1, 1,
-0.1772706, -0.7088187, -1.57365, 1, 1, 1, 1, 1,
-0.1762436, -1.416355, -2.612462, 1, 1, 1, 1, 1,
-0.175661, 0.622476, 0.9119987, 1, 1, 1, 1, 1,
-0.1736589, -0.8677, -3.439315, 1, 1, 1, 1, 1,
-0.1717973, 0.2785203, -0.8673314, 1, 1, 1, 1, 1,
-0.171074, 0.7597434, -0.9145499, 1, 1, 1, 1, 1,
-0.1698384, -0.632528, -1.790298, 1, 1, 1, 1, 1,
-0.1661918, 0.3723769, -1.091115, 1, 1, 1, 1, 1,
-0.1638431, -0.9992992, -3.26754, 1, 1, 1, 1, 1,
-0.1624758, -0.439729, -2.580314, 1, 1, 1, 1, 1,
-0.1567675, 0.9877329, 0.4329417, 1, 1, 1, 1, 1,
-0.1547308, -0.1723496, -2.517884, 0, 0, 1, 1, 1,
-0.1541406, 0.9488084, -0.9972503, 1, 0, 0, 1, 1,
-0.1517751, -0.886305, -0.2821289, 1, 0, 0, 1, 1,
-0.1503903, 0.5564677, -1.401722, 1, 0, 0, 1, 1,
-0.1484488, 1.742632, -1.846408, 1, 0, 0, 1, 1,
-0.1474135, 1.476064, -0.06798595, 1, 0, 0, 1, 1,
-0.1428296, 2.390907, -0.8074729, 0, 0, 0, 1, 1,
-0.1399304, 0.5225868, 1.844351, 0, 0, 0, 1, 1,
-0.1370613, -0.3129433, -2.465064, 0, 0, 0, 1, 1,
-0.1366718, -0.6865913, -5.033755, 0, 0, 0, 1, 1,
-0.1343979, 0.0191763, -2.159038, 0, 0, 0, 1, 1,
-0.1286537, 1.031007, -0.3714334, 0, 0, 0, 1, 1,
-0.1252533, -0.1730034, -2.438255, 0, 0, 0, 1, 1,
-0.1220031, 1.63645, 0.7783486, 1, 1, 1, 1, 1,
-0.1197685, -1.365331, -3.261693, 1, 1, 1, 1, 1,
-0.1171592, 0.5413738, -0.06443408, 1, 1, 1, 1, 1,
-0.1105266, -1.67719, -2.647259, 1, 1, 1, 1, 1,
-0.1099366, -1.522205, -2.566228, 1, 1, 1, 1, 1,
-0.108663, 0.1274162, -1.921356, 1, 1, 1, 1, 1,
-0.100023, 0.54891, 1.386367, 1, 1, 1, 1, 1,
-0.09957337, 0.3132426, 0.09541003, 1, 1, 1, 1, 1,
-0.09500242, 0.5785339, 0.1304545, 1, 1, 1, 1, 1,
-0.09203831, -0.9824919, -1.064938, 1, 1, 1, 1, 1,
-0.09097386, -1.666733, -2.586103, 1, 1, 1, 1, 1,
-0.09052762, 0.01853361, -2.087934, 1, 1, 1, 1, 1,
-0.09027559, -0.757907, -2.73838, 1, 1, 1, 1, 1,
-0.08652885, -0.5239043, -2.597917, 1, 1, 1, 1, 1,
-0.08505142, 0.1902141, -1.119989, 1, 1, 1, 1, 1,
-0.08120001, 0.161419, 1.002702, 0, 0, 1, 1, 1,
-0.07904155, 0.7011149, -0.9162335, 1, 0, 0, 1, 1,
-0.07847822, -0.03282416, -1.949909, 1, 0, 0, 1, 1,
-0.0781517, 1.742188, -2.096452, 1, 0, 0, 1, 1,
-0.07530193, -0.2411442, -3.199931, 1, 0, 0, 1, 1,
-0.06776064, 0.2401396, -1.964002, 1, 0, 0, 1, 1,
-0.06703375, -0.2334908, -3.566797, 0, 0, 0, 1, 1,
-0.06180389, -1.110031, -5.258111, 0, 0, 0, 1, 1,
-0.05682296, 0.7239002, 0.2232076, 0, 0, 0, 1, 1,
-0.05451442, -0.3226423, -2.390546, 0, 0, 0, 1, 1,
-0.05334269, 0.8137565, 2.243226, 0, 0, 0, 1, 1,
-0.0468248, -0.3398073, -3.14995, 0, 0, 0, 1, 1,
-0.04619689, 0.1822687, 1.032588, 0, 0, 0, 1, 1,
-0.04178287, -2.292176, -2.993837, 1, 1, 1, 1, 1,
-0.04090407, -1.083662, -3.139251, 1, 1, 1, 1, 1,
-0.03896293, -0.7195926, -2.654125, 1, 1, 1, 1, 1,
-0.03790582, -1.444423, -1.82722, 1, 1, 1, 1, 1,
-0.0376826, 1.039617, -0.670021, 1, 1, 1, 1, 1,
-0.03764976, 0.2337919, -0.2433232, 1, 1, 1, 1, 1,
-0.03460491, 0.4692365, 1.504329, 1, 1, 1, 1, 1,
-0.03152787, -0.3151518, -3.893156, 1, 1, 1, 1, 1,
-0.02693949, -0.5117831, -2.347704, 1, 1, 1, 1, 1,
-0.02604698, -1.199495, -3.073788, 1, 1, 1, 1, 1,
-0.01706773, -1.102805, -2.589828, 1, 1, 1, 1, 1,
-0.01483975, 1.379766, 0.8518212, 1, 1, 1, 1, 1,
-0.01412927, -0.4553611, -2.95535, 1, 1, 1, 1, 1,
-0.01376483, 0.543269, -1.325457, 1, 1, 1, 1, 1,
-0.01297307, 1.463473, 0.415156, 1, 1, 1, 1, 1,
-0.01262466, -1.772739, -3.763592, 0, 0, 1, 1, 1,
-0.009023285, -0.6333322, -4.320589, 1, 0, 0, 1, 1,
-0.007603097, 2.802539, 0.144097, 1, 0, 0, 1, 1,
-0.003761641, 1.075444, 2.834217, 1, 0, 0, 1, 1,
-0.003010774, -1.172214, -3.854851, 1, 0, 0, 1, 1,
0.002535988, 0.3676356, 0.7877793, 1, 0, 0, 1, 1,
0.003007545, -0.2219531, 3.692113, 0, 0, 0, 1, 1,
0.00663498, -0.6308936, 4.424268, 0, 0, 0, 1, 1,
0.007042899, -0.5456797, 5.858428, 0, 0, 0, 1, 1,
0.007784702, 0.7092309, 0.1063403, 0, 0, 0, 1, 1,
0.008867087, 1.332226, 0.2065772, 0, 0, 0, 1, 1,
0.009560811, -1.016091, 3.104991, 0, 0, 0, 1, 1,
0.009857957, 0.06583495, 0.3248614, 0, 0, 0, 1, 1,
0.01056514, 0.7576665, -0.9542344, 1, 1, 1, 1, 1,
0.01167537, -0.5832504, 2.43807, 1, 1, 1, 1, 1,
0.01233708, 0.2503496, -1.206134, 1, 1, 1, 1, 1,
0.01385739, 1.54136, -0.815928, 1, 1, 1, 1, 1,
0.01423622, -0.6246285, 1.40735, 1, 1, 1, 1, 1,
0.01498972, -0.05529434, 2.645517, 1, 1, 1, 1, 1,
0.01539829, -1.38829, 1.879415, 1, 1, 1, 1, 1,
0.02309602, 1.369399, 0.577691, 1, 1, 1, 1, 1,
0.02417176, -0.02641412, 1.170474, 1, 1, 1, 1, 1,
0.02756516, 0.5415896, 2.5474, 1, 1, 1, 1, 1,
0.03283322, -0.1217836, 4.246158, 1, 1, 1, 1, 1,
0.03333814, -0.502355, 1.444797, 1, 1, 1, 1, 1,
0.03488556, -1.100392, 3.290325, 1, 1, 1, 1, 1,
0.03531707, -0.985631, 3.45545, 1, 1, 1, 1, 1,
0.03792909, -0.1178199, 3.538533, 1, 1, 1, 1, 1,
0.03866516, -2.824053, 2.35531, 0, 0, 1, 1, 1,
0.05077062, 2.123115, -0.1430741, 1, 0, 0, 1, 1,
0.05112142, -1.805144, 3.589602, 1, 0, 0, 1, 1,
0.05131381, -0.7753891, 1.865801, 1, 0, 0, 1, 1,
0.05179562, -1.530108, 2.882939, 1, 0, 0, 1, 1,
0.05799694, -1.161694, 3.240632, 1, 0, 0, 1, 1,
0.05877206, -0.4435075, 2.300217, 0, 0, 0, 1, 1,
0.0600687, 0.203596, -0.3173611, 0, 0, 0, 1, 1,
0.06160544, 0.1385425, 1.374504, 0, 0, 0, 1, 1,
0.06324208, 0.8142892, -0.8312853, 0, 0, 0, 1, 1,
0.06682195, -0.9504126, 2.936608, 0, 0, 0, 1, 1,
0.06834867, 0.7242923, -0.983382, 0, 0, 0, 1, 1,
0.07279649, -0.9178684, 3.677163, 0, 0, 0, 1, 1,
0.07296788, 0.3097378, -1.143841, 1, 1, 1, 1, 1,
0.07643586, 0.9666932, -1.334854, 1, 1, 1, 1, 1,
0.07674797, -1.697528, 3.10577, 1, 1, 1, 1, 1,
0.08022176, 0.8484555, 1.961373, 1, 1, 1, 1, 1,
0.08148848, 0.4193987, 0.6491964, 1, 1, 1, 1, 1,
0.08386118, 0.216471, 0.7107696, 1, 1, 1, 1, 1,
0.08631005, 1.000441, 1.354352, 1, 1, 1, 1, 1,
0.08644747, 1.637595, -1.041042, 1, 1, 1, 1, 1,
0.08979072, 0.6734047, -0.3750909, 1, 1, 1, 1, 1,
0.09063443, 0.104634, 0.6315622, 1, 1, 1, 1, 1,
0.09174284, 0.7971656, -0.8242689, 1, 1, 1, 1, 1,
0.09396192, 0.1557452, 0.8482314, 1, 1, 1, 1, 1,
0.1019303, 2.33577, 0.2131318, 1, 1, 1, 1, 1,
0.104337, -1.466126, 4.071719, 1, 1, 1, 1, 1,
0.1052462, -1.136298, 2.722899, 1, 1, 1, 1, 1,
0.1052808, -0.8708917, 5.121765, 0, 0, 1, 1, 1,
0.1056158, 0.2810519, -1.643461, 1, 0, 0, 1, 1,
0.1062231, -0.6727306, 2.601531, 1, 0, 0, 1, 1,
0.1084925, -0.5095997, 2.055419, 1, 0, 0, 1, 1,
0.1094365, 0.3189904, 0.9362321, 1, 0, 0, 1, 1,
0.1110006, -0.5119895, 2.902388, 1, 0, 0, 1, 1,
0.1118346, -0.2054523, 1.995955, 0, 0, 0, 1, 1,
0.1130923, 0.2777943, 0.7539872, 0, 0, 0, 1, 1,
0.1188217, 1.029473, -0.1872156, 0, 0, 0, 1, 1,
0.1227269, -0.5864495, 2.629511, 0, 0, 0, 1, 1,
0.126765, -0.9018014, 2.782055, 0, 0, 0, 1, 1,
0.1279395, 0.7054968, 0.8624038, 0, 0, 0, 1, 1,
0.1299647, -0.537132, 4.018461, 0, 0, 0, 1, 1,
0.1326747, -0.829844, 3.030802, 1, 1, 1, 1, 1,
0.1337293, 1.287633, -0.3572743, 1, 1, 1, 1, 1,
0.1362666, 0.2235695, -0.07053866, 1, 1, 1, 1, 1,
0.1380118, 0.6061714, 0.06918593, 1, 1, 1, 1, 1,
0.1411706, -2.436834, 2.721132, 1, 1, 1, 1, 1,
0.1413665, -1.044498, 2.811845, 1, 1, 1, 1, 1,
0.1432422, -0.1141717, 1.602338, 1, 1, 1, 1, 1,
0.1458575, 0.2796066, 1.080222, 1, 1, 1, 1, 1,
0.1481129, -1.120047, 4.051, 1, 1, 1, 1, 1,
0.1495444, 0.7640802, 0.9239188, 1, 1, 1, 1, 1,
0.1519942, 0.4832424, 1.108783, 1, 1, 1, 1, 1,
0.1523127, -0.8721912, 2.721392, 1, 1, 1, 1, 1,
0.1567897, 0.8671589, -2.055101, 1, 1, 1, 1, 1,
0.1601176, -1.400729, 3.720579, 1, 1, 1, 1, 1,
0.1658984, -0.8331283, 3.49475, 1, 1, 1, 1, 1,
0.1664544, -0.542743, 1.806751, 0, 0, 1, 1, 1,
0.1726936, 1.484265, -0.4320258, 1, 0, 0, 1, 1,
0.1729164, 0.9965758, -0.7010182, 1, 0, 0, 1, 1,
0.1730614, -0.4837235, 1.346098, 1, 0, 0, 1, 1,
0.1754806, -1.234702, 1.550581, 1, 0, 0, 1, 1,
0.1765626, 0.06938646, 2.128342, 1, 0, 0, 1, 1,
0.1813042, 1.367327, -0.3976083, 0, 0, 0, 1, 1,
0.181465, 0.1337624, 2.684212, 0, 0, 0, 1, 1,
0.1844689, 1.953772, -0.5065519, 0, 0, 0, 1, 1,
0.1872895, 0.04499719, 0.8298762, 0, 0, 0, 1, 1,
0.1888209, -1.050116, 3.193352, 0, 0, 0, 1, 1,
0.1946745, -0.2889184, 2.486471, 0, 0, 0, 1, 1,
0.1947089, -0.4405209, 2.180597, 0, 0, 0, 1, 1,
0.1954261, -0.7059254, 3.34717, 1, 1, 1, 1, 1,
0.1970075, -0.1568688, 2.178925, 1, 1, 1, 1, 1,
0.1989578, 0.5962332, 2.107157, 1, 1, 1, 1, 1,
0.2002057, -0.4152163, 3.09736, 1, 1, 1, 1, 1,
0.2007855, -0.8958779, 3.211303, 1, 1, 1, 1, 1,
0.2025908, -0.7479078, 2.570407, 1, 1, 1, 1, 1,
0.2125587, -0.1067954, 1.365052, 1, 1, 1, 1, 1,
0.2137757, -0.7686747, 1.144933, 1, 1, 1, 1, 1,
0.2167716, -0.03899205, 2.260516, 1, 1, 1, 1, 1,
0.2174411, 0.7606937, 1.038377, 1, 1, 1, 1, 1,
0.2175757, 0.5210133, 0.5733151, 1, 1, 1, 1, 1,
0.2178194, 0.03228987, 2.089302, 1, 1, 1, 1, 1,
0.218838, 1.201393, 0.6105202, 1, 1, 1, 1, 1,
0.2205163, -1.142657, 2.947276, 1, 1, 1, 1, 1,
0.2244919, 0.06168844, 2.88477, 1, 1, 1, 1, 1,
0.2245508, 0.7544571, -0.1747791, 0, 0, 1, 1, 1,
0.2275912, 0.5492565, 1.388659, 1, 0, 0, 1, 1,
0.2284966, 0.01234089, 2.268429, 1, 0, 0, 1, 1,
0.2337583, -0.6685536, 2.444557, 1, 0, 0, 1, 1,
0.2383906, 1.250772, 1.704661, 1, 0, 0, 1, 1,
0.241019, -0.583223, 4.165931, 1, 0, 0, 1, 1,
0.2412519, -0.3430614, 2.787297, 0, 0, 0, 1, 1,
0.2414696, -0.4998383, 1.330985, 0, 0, 0, 1, 1,
0.244736, -1.183837, 3.463906, 0, 0, 0, 1, 1,
0.2498312, 2.318054, -1.142418, 0, 0, 0, 1, 1,
0.251401, 0.02485465, 3.081203, 0, 0, 0, 1, 1,
0.2562989, 0.06569078, -0.07170559, 0, 0, 0, 1, 1,
0.2580438, 1.607287, -0.08342481, 0, 0, 0, 1, 1,
0.2607384, 0.05317182, 1.294751, 1, 1, 1, 1, 1,
0.2711529, -0.3851331, 2.526909, 1, 1, 1, 1, 1,
0.2729179, 1.387932, -0.4087127, 1, 1, 1, 1, 1,
0.2780552, 0.01884201, 1.216691, 1, 1, 1, 1, 1,
0.2809955, 0.7464679, -0.04574086, 1, 1, 1, 1, 1,
0.2831312, -0.3283478, 4.732252, 1, 1, 1, 1, 1,
0.283457, -0.7128639, 3.692821, 1, 1, 1, 1, 1,
0.2838852, 0.2807083, 0.3829212, 1, 1, 1, 1, 1,
0.2852602, -1.643438, 2.828838, 1, 1, 1, 1, 1,
0.2857923, 0.1552361, -0.2244351, 1, 1, 1, 1, 1,
0.2888339, 0.1487703, 1.419149, 1, 1, 1, 1, 1,
0.2914685, 0.7184753, 0.8365789, 1, 1, 1, 1, 1,
0.2987819, -1.996803, 3.306245, 1, 1, 1, 1, 1,
0.2990626, 1.127789, 0.4757311, 1, 1, 1, 1, 1,
0.303844, 0.6937635, 0.08210827, 1, 1, 1, 1, 1,
0.3064599, -0.05091788, 2.344366, 0, 0, 1, 1, 1,
0.321034, -0.8975681, 4.831466, 1, 0, 0, 1, 1,
0.3214086, -0.08145967, 1.638206, 1, 0, 0, 1, 1,
0.3236887, 0.6473584, 1.074086, 1, 0, 0, 1, 1,
0.3246681, 0.06639375, 1.819427, 1, 0, 0, 1, 1,
0.3295272, -1.138491, 3.157465, 1, 0, 0, 1, 1,
0.3306044, -0.155523, 1.834199, 0, 0, 0, 1, 1,
0.3316293, 1.714224, -0.9378812, 0, 0, 0, 1, 1,
0.3331209, 0.8013688, 0.6765851, 0, 0, 0, 1, 1,
0.3342832, -0.9982536, 2.428895, 0, 0, 0, 1, 1,
0.3352048, -0.7882782, 1.674942, 0, 0, 0, 1, 1,
0.3365798, 0.007144997, 1.559345, 0, 0, 0, 1, 1,
0.3397509, -0.5235543, 3.353652, 0, 0, 0, 1, 1,
0.3464725, 0.8711038, 1.831921, 1, 1, 1, 1, 1,
0.3485148, 1.086361, 0.1753261, 1, 1, 1, 1, 1,
0.3496349, 1.647668, 0.819293, 1, 1, 1, 1, 1,
0.3511179, -1.100224, 3.439834, 1, 1, 1, 1, 1,
0.3579946, 0.8766478, 0.4415406, 1, 1, 1, 1, 1,
0.3596509, -0.7831034, 2.041003, 1, 1, 1, 1, 1,
0.3667617, 0.2705722, 0.3509556, 1, 1, 1, 1, 1,
0.3702405, -0.6608391, 3.70064, 1, 1, 1, 1, 1,
0.3707329, 1.051346, 0.048411, 1, 1, 1, 1, 1,
0.3716829, 0.658971, 2.268505, 1, 1, 1, 1, 1,
0.3748553, -1.168091, 1.764775, 1, 1, 1, 1, 1,
0.3756523, 0.7564185, 1.267377, 1, 1, 1, 1, 1,
0.3785777, -0.2123875, 1.987714, 1, 1, 1, 1, 1,
0.384122, -0.6920687, 3.021227, 1, 1, 1, 1, 1,
0.3872116, -0.3612813, 2.496754, 1, 1, 1, 1, 1,
0.3926984, 0.07634568, 1.385508, 0, 0, 1, 1, 1,
0.3930503, 1.412152, -0.286421, 1, 0, 0, 1, 1,
0.3946367, 0.07032424, 1.660327, 1, 0, 0, 1, 1,
0.4003248, 0.5201397, 0.5001166, 1, 0, 0, 1, 1,
0.4025419, -1.317101, 1.672142, 1, 0, 0, 1, 1,
0.4076329, -1.357851, 2.460016, 1, 0, 0, 1, 1,
0.4104577, -0.6902241, 2.147856, 0, 0, 0, 1, 1,
0.4172788, 1.866869, 0.171226, 0, 0, 0, 1, 1,
0.4186009, 0.0195233, 1.450383, 0, 0, 0, 1, 1,
0.4248164, -1.829523, 4.723389, 0, 0, 0, 1, 1,
0.4266747, -0.7817146, 2.451414, 0, 0, 0, 1, 1,
0.4288299, 0.9297734, 1.779566, 0, 0, 0, 1, 1,
0.4341219, -0.6505718, 3.478143, 0, 0, 0, 1, 1,
0.4352479, -0.1943386, 3.025511, 1, 1, 1, 1, 1,
0.443303, -0.774325, 3.520665, 1, 1, 1, 1, 1,
0.4455909, -1.080432, 2.513837, 1, 1, 1, 1, 1,
0.4457294, -0.03559285, 2.337909, 1, 1, 1, 1, 1,
0.4466352, -0.9294984, 1.552759, 1, 1, 1, 1, 1,
0.4468231, -0.703369, 2.292167, 1, 1, 1, 1, 1,
0.4547171, -0.6303322, 1.481839, 1, 1, 1, 1, 1,
0.4579999, 1.331144, -0.1209748, 1, 1, 1, 1, 1,
0.4633177, 1.747912, -0.3748436, 1, 1, 1, 1, 1,
0.4667495, 1.703315, -0.3395588, 1, 1, 1, 1, 1,
0.4679894, 0.3786936, -0.07939155, 1, 1, 1, 1, 1,
0.4698587, -0.157663, 1.548146, 1, 1, 1, 1, 1,
0.4708979, 0.1792051, 1.959958, 1, 1, 1, 1, 1,
0.4720957, -2.686508, 1.474005, 1, 1, 1, 1, 1,
0.4753148, 0.02185181, 1.309046, 1, 1, 1, 1, 1,
0.4758067, -1.197363, 1.987917, 0, 0, 1, 1, 1,
0.4806569, 0.8026856, -0.3923091, 1, 0, 0, 1, 1,
0.481014, 0.6617525, 0.702534, 1, 0, 0, 1, 1,
0.4858695, -1.481582, 3.240521, 1, 0, 0, 1, 1,
0.4921475, -2.119532, 2.865935, 1, 0, 0, 1, 1,
0.492808, 2.181143, 1.161445, 1, 0, 0, 1, 1,
0.4944782, 1.418451, -0.5083936, 0, 0, 0, 1, 1,
0.4979261, -1.055199, 1.963709, 0, 0, 0, 1, 1,
0.5009859, 0.4934883, 2.195798, 0, 0, 0, 1, 1,
0.5024339, -0.2248442, 2.080109, 0, 0, 0, 1, 1,
0.5043294, -1.581632, 3.734419, 0, 0, 0, 1, 1,
0.5043955, 1.06854, 0.7093586, 0, 0, 0, 1, 1,
0.5103841, -0.2182893, 2.049278, 0, 0, 0, 1, 1,
0.5128806, 0.8050603, 1.495866, 1, 1, 1, 1, 1,
0.5147858, 0.3963218, 2.552462, 1, 1, 1, 1, 1,
0.5165095, 0.06979746, 1.853523, 1, 1, 1, 1, 1,
0.5166197, 1.404969, -1.321495, 1, 1, 1, 1, 1,
0.5198213, -0.5767511, 3.623333, 1, 1, 1, 1, 1,
0.5224223, 1.041708, -0.02961326, 1, 1, 1, 1, 1,
0.5261025, -1.944628, 4.641904, 1, 1, 1, 1, 1,
0.5347368, -0.3937649, 0.6513537, 1, 1, 1, 1, 1,
0.5428765, 1.614207, 0.03611067, 1, 1, 1, 1, 1,
0.5448424, 0.229911, 2.936649, 1, 1, 1, 1, 1,
0.54593, 1.081186, -1.320817, 1, 1, 1, 1, 1,
0.551181, -0.3095155, 1.247559, 1, 1, 1, 1, 1,
0.5526459, 0.1702272, 2.258835, 1, 1, 1, 1, 1,
0.5529269, 0.828363, 1.475498, 1, 1, 1, 1, 1,
0.5541121, 1.393143, 0.7085747, 1, 1, 1, 1, 1,
0.5550312, 1.140895, -0.730841, 0, 0, 1, 1, 1,
0.5562705, 0.5518359, 0.6552434, 1, 0, 0, 1, 1,
0.5570502, 1.448515, 0.7943059, 1, 0, 0, 1, 1,
0.5602959, -1.277715, 3.490013, 1, 0, 0, 1, 1,
0.5625724, 0.03174971, 2.532003, 1, 0, 0, 1, 1,
0.5645692, 2.231643, -0.755962, 1, 0, 0, 1, 1,
0.5714476, -0.4250918, 1.110623, 0, 0, 0, 1, 1,
0.5735359, 0.04416298, 0.8710857, 0, 0, 0, 1, 1,
0.5789745, -0.8411531, 3.165101, 0, 0, 0, 1, 1,
0.5866709, -0.3219202, 3.272313, 0, 0, 0, 1, 1,
0.5869167, 0.783262, 0.6036277, 0, 0, 0, 1, 1,
0.5903894, 0.08356559, 1.052164, 0, 0, 0, 1, 1,
0.5906751, 0.2965082, 1.995646, 0, 0, 0, 1, 1,
0.5944936, 1.163803, -0.1995298, 1, 1, 1, 1, 1,
0.6054454, -0.8454438, 2.376415, 1, 1, 1, 1, 1,
0.6085436, -0.9141397, 3.0099, 1, 1, 1, 1, 1,
0.6100426, 0.05361857, 2.769225, 1, 1, 1, 1, 1,
0.6105772, -0.7409667, 2.37433, 1, 1, 1, 1, 1,
0.6132498, -0.1145651, 1.116532, 1, 1, 1, 1, 1,
0.6146089, 2.367553, 0.06710239, 1, 1, 1, 1, 1,
0.6226375, 0.01539118, 2.441059, 1, 1, 1, 1, 1,
0.6261751, 0.4170238, 0.7974085, 1, 1, 1, 1, 1,
0.6319917, -1.531467, 2.87769, 1, 1, 1, 1, 1,
0.6328644, 0.1774196, -0.1267768, 1, 1, 1, 1, 1,
0.6361625, 1.479896, 0.5222584, 1, 1, 1, 1, 1,
0.6384605, 0.5048866, 1.075268, 1, 1, 1, 1, 1,
0.6403319, 1.019998, -0.675199, 1, 1, 1, 1, 1,
0.6403815, -0.1776889, 0.7838981, 1, 1, 1, 1, 1,
0.6474327, -1.456867, 3.695074, 0, 0, 1, 1, 1,
0.6475251, -0.1684134, 1.980897, 1, 0, 0, 1, 1,
0.648186, 0.658386, 1.123381, 1, 0, 0, 1, 1,
0.6483477, -0.1004702, 2.905281, 1, 0, 0, 1, 1,
0.6507059, 0.5923174, 0.6271011, 1, 0, 0, 1, 1,
0.6571294, 0.3460478, -0.472342, 1, 0, 0, 1, 1,
0.6583063, -0.1628964, 2.115458, 0, 0, 0, 1, 1,
0.6596478, 1.096466, -0.394618, 0, 0, 0, 1, 1,
0.6617451, -0.6225126, 2.185577, 0, 0, 0, 1, 1,
0.6763554, 0.8097958, 2.334103, 0, 0, 0, 1, 1,
0.6801566, 0.3964576, -0.8070576, 0, 0, 0, 1, 1,
0.6857725, 0.9135055, -0.6500275, 0, 0, 0, 1, 1,
0.6894085, -1.126845, 4.499094, 0, 0, 0, 1, 1,
0.6911107, 1.968804, -1.007265, 1, 1, 1, 1, 1,
0.7029517, -1.64596, 1.283481, 1, 1, 1, 1, 1,
0.7076093, -1.627442, 2.592172, 1, 1, 1, 1, 1,
0.7159255, -0.551074, 2.084582, 1, 1, 1, 1, 1,
0.7170262, -0.4265967, 2.238847, 1, 1, 1, 1, 1,
0.7177922, -0.1992733, 2.47337, 1, 1, 1, 1, 1,
0.7191725, 2.226603, -0.4549266, 1, 1, 1, 1, 1,
0.7234058, 1.332519, 0.3270958, 1, 1, 1, 1, 1,
0.7238168, 1.022043, 0.3173867, 1, 1, 1, 1, 1,
0.7419491, 0.08506991, 1.958915, 1, 1, 1, 1, 1,
0.762455, -0.3005747, 1.039447, 1, 1, 1, 1, 1,
0.763208, 0.4433428, 0.7893277, 1, 1, 1, 1, 1,
0.7776003, -1.311141, 1.807544, 1, 1, 1, 1, 1,
0.7795123, 1.895458, 1.369871, 1, 1, 1, 1, 1,
0.7934992, 0.7630277, 2.272984, 1, 1, 1, 1, 1,
0.7940118, 0.7917479, -0.1965194, 0, 0, 1, 1, 1,
0.7948392, 0.06059536, -0.01058581, 1, 0, 0, 1, 1,
0.7987196, -0.6227085, 2.682912, 1, 0, 0, 1, 1,
0.8016214, -0.05542289, 2.000539, 1, 0, 0, 1, 1,
0.8052483, -0.1749152, 1.098951, 1, 0, 0, 1, 1,
0.8065489, -1.722704, 3.075972, 1, 0, 0, 1, 1,
0.8229502, 0.5398493, 0.9081865, 0, 0, 0, 1, 1,
0.8306198, -2.19678, 4.103708, 0, 0, 0, 1, 1,
0.8355923, -1.334528, 2.303015, 0, 0, 0, 1, 1,
0.8447926, 1.522484, 1.004823, 0, 0, 0, 1, 1,
0.8544384, 0.5968384, 0.7293681, 0, 0, 0, 1, 1,
0.8628746, 1.050233, 0.2166715, 0, 0, 0, 1, 1,
0.8652951, -1.213483, 3.702385, 0, 0, 0, 1, 1,
0.8670742, 1.222865, 0.4998314, 1, 1, 1, 1, 1,
0.8685426, -0.09887972, 1.275996, 1, 1, 1, 1, 1,
0.8731148, -0.1906801, 2.199466, 1, 1, 1, 1, 1,
0.8775616, 0.1067003, 1.307881, 1, 1, 1, 1, 1,
0.8807377, -0.2050153, 1.942967, 1, 1, 1, 1, 1,
0.8833045, 0.09989213, 2.030094, 1, 1, 1, 1, 1,
0.8873699, -0.06266233, 0.1417696, 1, 1, 1, 1, 1,
0.8877348, -0.4871491, 3.66894, 1, 1, 1, 1, 1,
0.89887, 1.194698, 0.1887655, 1, 1, 1, 1, 1,
0.8991967, 0.2933584, 0.8145233, 1, 1, 1, 1, 1,
0.9016191, 1.927238, 0.2359483, 1, 1, 1, 1, 1,
0.9022887, 2.111009, 0.6098536, 1, 1, 1, 1, 1,
0.9045386, 0.2413646, -1.27155, 1, 1, 1, 1, 1,
0.9078051, -1.709006, 2.606734, 1, 1, 1, 1, 1,
0.9100103, 0.3663086, 0.2833043, 1, 1, 1, 1, 1,
0.9103642, 0.7331781, 0.8198664, 0, 0, 1, 1, 1,
0.9132767, -0.3842412, 0.9529372, 1, 0, 0, 1, 1,
0.9139978, 0.3979416, 1.225995, 1, 0, 0, 1, 1,
0.9152535, 0.911833, 1.85201, 1, 0, 0, 1, 1,
0.9266801, -0.3246126, 2.182315, 1, 0, 0, 1, 1,
0.9283261, -2.189713, 2.667698, 1, 0, 0, 1, 1,
0.9468319, -0.3211701, 5.020028, 0, 0, 0, 1, 1,
0.9473116, 0.5434489, -0.5798447, 0, 0, 0, 1, 1,
0.9486945, -0.2630093, 2.289666, 0, 0, 0, 1, 1,
0.9580674, 0.3878785, 0.05767888, 0, 0, 0, 1, 1,
0.9625198, -0.07764707, 0.874485, 0, 0, 0, 1, 1,
0.9650229, 0.07837754, 0.9283293, 0, 0, 0, 1, 1,
0.9663541, 0.3234647, 1.546388, 0, 0, 0, 1, 1,
0.9747429, -0.6454777, 3.331824, 1, 1, 1, 1, 1,
0.9776064, -0.6129619, 1.628293, 1, 1, 1, 1, 1,
0.9856155, 0.5028655, 0.8468497, 1, 1, 1, 1, 1,
0.9861521, 0.5166513, 3.077829, 1, 1, 1, 1, 1,
0.9892174, -0.23647, 1.413318, 1, 1, 1, 1, 1,
0.989348, -0.3732878, 3.841908, 1, 1, 1, 1, 1,
0.9910384, 0.432365, 2.609024, 1, 1, 1, 1, 1,
0.9948253, -0.7037614, 2.728729, 1, 1, 1, 1, 1,
0.9975614, -0.03987532, 1.031725, 1, 1, 1, 1, 1,
1.002571, 0.08237322, 2.525856, 1, 1, 1, 1, 1,
1.004935, -1.373036, 2.937489, 1, 1, 1, 1, 1,
1.010186, 0.5987213, 1.016525, 1, 1, 1, 1, 1,
1.014684, -0.1176586, 1.440406, 1, 1, 1, 1, 1,
1.015718, 0.2047265, 2.399461, 1, 1, 1, 1, 1,
1.016691, -0.5163605, 3.15585, 1, 1, 1, 1, 1,
1.022972, -0.6625563, 1.54294, 0, 0, 1, 1, 1,
1.025335, 1.723791, 1.271211, 1, 0, 0, 1, 1,
1.030689, -1.099605, 3.795939, 1, 0, 0, 1, 1,
1.03187, -1.211797, 4.560735, 1, 0, 0, 1, 1,
1.032054, 0.5198298, 1.851867, 1, 0, 0, 1, 1,
1.035669, -0.7075277, 5.27054, 1, 0, 0, 1, 1,
1.035829, -0.8008685, 2.449917, 0, 0, 0, 1, 1,
1.040165, -0.3356197, 2.347835, 0, 0, 0, 1, 1,
1.042792, -0.5512329, 3.396664, 0, 0, 0, 1, 1,
1.043607, 1.945862, 0.979041, 0, 0, 0, 1, 1,
1.053298, 0.1566962, 1.191831, 0, 0, 0, 1, 1,
1.075408, 0.01723046, 1.189137, 0, 0, 0, 1, 1,
1.081117, -0.5182629, 1.298359, 0, 0, 0, 1, 1,
1.08659, -1.416212, 3.262474, 1, 1, 1, 1, 1,
1.087767, -1.355807, 1.487945, 1, 1, 1, 1, 1,
1.09463, -1.125168, 2.505543, 1, 1, 1, 1, 1,
1.098941, 0.7142316, 1.162337, 1, 1, 1, 1, 1,
1.106897, -0.5067937, 2.380942, 1, 1, 1, 1, 1,
1.110569, 0.4362505, 0.6366805, 1, 1, 1, 1, 1,
1.121454, -1.390347, 0.7897416, 1, 1, 1, 1, 1,
1.127187, 1.12352, 1.102783, 1, 1, 1, 1, 1,
1.1332, -1.556632, 3.246723, 1, 1, 1, 1, 1,
1.133357, -1.171211, 3.656355, 1, 1, 1, 1, 1,
1.136594, 0.763992, 1.811242, 1, 1, 1, 1, 1,
1.142858, 1.801609, 0.2390151, 1, 1, 1, 1, 1,
1.146976, -1.254427, 2.069764, 1, 1, 1, 1, 1,
1.149037, 0.4522498, -0.574043, 1, 1, 1, 1, 1,
1.150357, 1.421128, -1.048683, 1, 1, 1, 1, 1,
1.159599, 0.6399066, 0.8537129, 0, 0, 1, 1, 1,
1.170552, 0.2400838, 1.138808, 1, 0, 0, 1, 1,
1.173606, -0.0308274, 2.0687, 1, 0, 0, 1, 1,
1.177119, 0.7003467, -0.3792196, 1, 0, 0, 1, 1,
1.182918, -2.212438, 3.900181, 1, 0, 0, 1, 1,
1.183292, 0.2671008, 0.08006424, 1, 0, 0, 1, 1,
1.183582, -0.007557689, 2.424435, 0, 0, 0, 1, 1,
1.186072, 0.6494229, 1.120169, 0, 0, 0, 1, 1,
1.189029, 1.460608, 0.9058813, 0, 0, 0, 1, 1,
1.195998, 2.261979, 0.8498538, 0, 0, 0, 1, 1,
1.197953, -0.4157256, 1.783049, 0, 0, 0, 1, 1,
1.200794, -0.7722667, 1.814332, 0, 0, 0, 1, 1,
1.202407, -0.2098894, 2.467866, 0, 0, 0, 1, 1,
1.209202, 0.2080716, 0.862253, 1, 1, 1, 1, 1,
1.210771, -0.9723662, 2.887805, 1, 1, 1, 1, 1,
1.21303, -0.3865834, 1.103239, 1, 1, 1, 1, 1,
1.215805, -0.8410383, 2.382433, 1, 1, 1, 1, 1,
1.219015, 1.416694, -1.108272, 1, 1, 1, 1, 1,
1.225059, 0.515795, 2.599204, 1, 1, 1, 1, 1,
1.225449, 0.2311396, 1.479069, 1, 1, 1, 1, 1,
1.23163, 0.9512122, 0.5739586, 1, 1, 1, 1, 1,
1.233612, -0.7216321, 1.607445, 1, 1, 1, 1, 1,
1.240712, -0.1782644, 2.110387, 1, 1, 1, 1, 1,
1.244416, 0.995933, 1.357054, 1, 1, 1, 1, 1,
1.24661, -0.1478881, 1.41565, 1, 1, 1, 1, 1,
1.248672, 0.588276, 2.263841, 1, 1, 1, 1, 1,
1.251957, 0.9890743, 0.5356886, 1, 1, 1, 1, 1,
1.259874, 1.521006, 1.353661, 1, 1, 1, 1, 1,
1.263344, -1.633143, 4.989478, 0, 0, 1, 1, 1,
1.265157, -1.225722, 2.949898, 1, 0, 0, 1, 1,
1.266061, -0.9127539, 0.9003506, 1, 0, 0, 1, 1,
1.27866, 1.432672, 1.947998, 1, 0, 0, 1, 1,
1.282363, 0.5119331, 0.7379308, 1, 0, 0, 1, 1,
1.28714, 0.3758617, 1.880455, 1, 0, 0, 1, 1,
1.305803, -0.4686868, 2.953177, 0, 0, 0, 1, 1,
1.306984, 1.28923, -0.1503111, 0, 0, 0, 1, 1,
1.313782, 2.975471, 1.549698, 0, 0, 0, 1, 1,
1.323493, 0.4964749, 2.125651, 0, 0, 0, 1, 1,
1.328174, -0.5294291, 5.416846, 0, 0, 0, 1, 1,
1.329136, 2.27108, 1.826867, 0, 0, 0, 1, 1,
1.339201, 0.09262203, 0.852799, 0, 0, 0, 1, 1,
1.342591, 0.5466354, -0.0151208, 1, 1, 1, 1, 1,
1.346154, 1.120215, 1.267715, 1, 1, 1, 1, 1,
1.351421, 1.436537, -0.2085509, 1, 1, 1, 1, 1,
1.351628, 0.6698625, 2.762808, 1, 1, 1, 1, 1,
1.35448, 0.8476151, 3.033192, 1, 1, 1, 1, 1,
1.357139, -1.311484, 2.603209, 1, 1, 1, 1, 1,
1.363925, 1.26247, -0.4399517, 1, 1, 1, 1, 1,
1.369946, 0.4886062, -0.5050721, 1, 1, 1, 1, 1,
1.384919, 1.704129, -0.7431541, 1, 1, 1, 1, 1,
1.394996, 0.3576401, -0.8752613, 1, 1, 1, 1, 1,
1.421079, 0.2362489, 0.9062698, 1, 1, 1, 1, 1,
1.427379, 0.9775131, -0.8027682, 1, 1, 1, 1, 1,
1.442856, -0.01596361, 2.581242, 1, 1, 1, 1, 1,
1.443541, -0.5340138, 2.372242, 1, 1, 1, 1, 1,
1.457232, -1.180052, 1.068216, 1, 1, 1, 1, 1,
1.462633, 1.171144, -1.555562, 0, 0, 1, 1, 1,
1.471928, 0.2650109, 2.990299, 1, 0, 0, 1, 1,
1.475069, 0.3223271, 0.69447, 1, 0, 0, 1, 1,
1.494246, -0.6712124, 1.618402, 1, 0, 0, 1, 1,
1.49956, -0.6017845, 1.086527, 1, 0, 0, 1, 1,
1.502867, 0.3254149, 0.7092037, 1, 0, 0, 1, 1,
1.50704, -0.5970654, 1.692228, 0, 0, 0, 1, 1,
1.512288, 0.6479602, 1.89278, 0, 0, 0, 1, 1,
1.525967, 0.6714457, 1.702381, 0, 0, 0, 1, 1,
1.53024, -2.04125, 3.07488, 0, 0, 0, 1, 1,
1.531886, -1.270285, 2.294987, 0, 0, 0, 1, 1,
1.532274, -0.3908779, 1.188832, 0, 0, 0, 1, 1,
1.552741, -0.3541431, 2.318429, 0, 0, 0, 1, 1,
1.585833, -0.3907696, 1.047447, 1, 1, 1, 1, 1,
1.59367, 0.7383582, 1.439986, 1, 1, 1, 1, 1,
1.596528, 1.894575, -1.12318, 1, 1, 1, 1, 1,
1.602032, 0.6267428, 0.08512469, 1, 1, 1, 1, 1,
1.615492, -1.934518, 3.60842, 1, 1, 1, 1, 1,
1.619202, 0.5904878, 1.211573, 1, 1, 1, 1, 1,
1.644937, -1.719975, 3.908032, 1, 1, 1, 1, 1,
1.652845, 0.2812202, 1.69165, 1, 1, 1, 1, 1,
1.66033, 1.025526, 1.455388, 1, 1, 1, 1, 1,
1.661433, 0.2010923, 3.127695, 1, 1, 1, 1, 1,
1.676418, -0.3681065, 3.48603, 1, 1, 1, 1, 1,
1.682491, -0.01820667, 1.949582, 1, 1, 1, 1, 1,
1.694316, -1.47409, 0.9078225, 1, 1, 1, 1, 1,
1.714049, 0.6681663, 0.4393222, 1, 1, 1, 1, 1,
1.719803, 0.8035614, 2.034798, 1, 1, 1, 1, 1,
1.733121, -0.5483772, 0.3412758, 0, 0, 1, 1, 1,
1.741157, 1.594738, 0.3683606, 1, 0, 0, 1, 1,
1.749917, 0.4648457, 2.954249, 1, 0, 0, 1, 1,
1.752936, -1.855411, 2.68665, 1, 0, 0, 1, 1,
1.762912, 1.072108, -0.1252444, 1, 0, 0, 1, 1,
1.785584, -1.066654, 3.488717, 1, 0, 0, 1, 1,
1.791973, -0.09558234, 1.401673, 0, 0, 0, 1, 1,
1.809075, -1.027261, 2.389747, 0, 0, 0, 1, 1,
1.817215, -0.1619276, 1.98518, 0, 0, 0, 1, 1,
1.82171, -0.3953811, 3.455933, 0, 0, 0, 1, 1,
1.832196, -0.8599472, 1.840047, 0, 0, 0, 1, 1,
1.857184, 0.9331133, 4.063201, 0, 0, 0, 1, 1,
1.864955, -0.4216251, 1.595231, 0, 0, 0, 1, 1,
1.866475, -0.5196681, 2.601093, 1, 1, 1, 1, 1,
1.898014, -1.15309, 3.086752, 1, 1, 1, 1, 1,
1.930897, -0.9953686, 2.522611, 1, 1, 1, 1, 1,
1.93662, 2.589694, -2.759687, 1, 1, 1, 1, 1,
1.938594, 0.4186696, -0.09028784, 1, 1, 1, 1, 1,
1.950709, 2.300871, -1.020804, 1, 1, 1, 1, 1,
1.951733, 0.2421684, 0.3394218, 1, 1, 1, 1, 1,
1.961214, -0.283114, 0.5926247, 1, 1, 1, 1, 1,
1.961216, -1.027513, 2.135469, 1, 1, 1, 1, 1,
2.007621, -0.3029098, 2.602525, 1, 1, 1, 1, 1,
2.015694, -0.231169, 0.2276654, 1, 1, 1, 1, 1,
2.045289, 0.4864308, 1.493648, 1, 1, 1, 1, 1,
2.069418, -0.6283373, 0.5124483, 1, 1, 1, 1, 1,
2.096821, -0.2609404, 1.915702, 1, 1, 1, 1, 1,
2.108322, -0.2522726, 1.523691, 1, 1, 1, 1, 1,
2.119872, -0.7840705, 1.553354, 0, 0, 1, 1, 1,
2.155919, -0.5698985, 2.199936, 1, 0, 0, 1, 1,
2.157856, -0.6644376, 3.837043, 1, 0, 0, 1, 1,
2.175755, 0.7071719, -0.379511, 1, 0, 0, 1, 1,
2.280297, 1.421502, 0.9902472, 1, 0, 0, 1, 1,
2.294338, 0.5287826, 1.330842, 1, 0, 0, 1, 1,
2.303486, 0.2731067, 1.415442, 0, 0, 0, 1, 1,
2.408085, 0.3332992, 1.778431, 0, 0, 0, 1, 1,
2.432774, -1.845962, 1.781317, 0, 0, 0, 1, 1,
2.440412, 1.265674, 1.364952, 0, 0, 0, 1, 1,
2.463017, 0.8778796, 0.07162937, 0, 0, 0, 1, 1,
2.478719, 0.7890806, 0.06544479, 0, 0, 0, 1, 1,
2.586654, -0.8325934, 2.152349, 0, 0, 0, 1, 1,
2.614952, -1.12499, 1.59319, 1, 1, 1, 1, 1,
2.687278, 0.6775238, 2.692871, 1, 1, 1, 1, 1,
2.753329, 0.8126034, 2.447623, 1, 1, 1, 1, 1,
2.770302, 0.4330472, 1.158476, 1, 1, 1, 1, 1,
2.785359, 0.8759103, 1.126738, 1, 1, 1, 1, 1,
2.926756, -0.3818357, 0.8435647, 1, 1, 1, 1, 1,
3.238893, -0.6316356, 2.173527, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
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
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.813806;
var distance = 34.47058;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.08221054, 0.3277769, -0.2402904 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47058);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
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
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>