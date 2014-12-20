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
-3.22353, -0.4914015, -0.7834391, 1, 0, 0, 1,
-2.84733, 1.575113, -2.926103, 1, 0.007843138, 0, 1,
-2.791488, -1.983584, -2.620197, 1, 0.01176471, 0, 1,
-2.782067, 1.343014, -0.2457462, 1, 0.01960784, 0, 1,
-2.661682, -1.812321, -2.458458, 1, 0.02352941, 0, 1,
-2.621755, -0.8965383, -2.76518, 1, 0.03137255, 0, 1,
-2.522909, -2.405748, -1.724887, 1, 0.03529412, 0, 1,
-2.518996, 1.099171, -1.365812, 1, 0.04313726, 0, 1,
-2.386588, -1.179244, -2.271461, 1, 0.04705882, 0, 1,
-2.346164, -0.08959386, -1.708058, 1, 0.05490196, 0, 1,
-2.335227, -0.5787323, -0.3056146, 1, 0.05882353, 0, 1,
-2.325276, -0.1149836, -1.48143, 1, 0.06666667, 0, 1,
-2.295947, -1.197813, -0.4527448, 1, 0.07058824, 0, 1,
-2.249146, 0.9380169, -1.871676, 1, 0.07843138, 0, 1,
-2.237865, -0.1005647, -1.636456, 1, 0.08235294, 0, 1,
-2.204104, -1.421927, -2.994459, 1, 0.09019608, 0, 1,
-2.143724, 2.573404, -0.8392514, 1, 0.09411765, 0, 1,
-2.114352, -1.259148, -3.998204, 1, 0.1019608, 0, 1,
-2.100585, -0.3919977, -1.558387, 1, 0.1098039, 0, 1,
-2.091588, 0.3562523, -2.071627, 1, 0.1137255, 0, 1,
-2.071002, 0.6872382, -0.2095733, 1, 0.1215686, 0, 1,
-2.059343, -2.007546, -3.830953, 1, 0.1254902, 0, 1,
-2.048892, -0.2599301, -0.8517966, 1, 0.1333333, 0, 1,
-2.017165, -0.7829573, -2.229389, 1, 0.1372549, 0, 1,
-2.005151, -0.4979898, -2.383301, 1, 0.145098, 0, 1,
-1.952129, 1.241531, -1.825578, 1, 0.1490196, 0, 1,
-1.945151, 0.2041518, -3.040814, 1, 0.1568628, 0, 1,
-1.943531, 1.058456, -1.11016, 1, 0.1607843, 0, 1,
-1.930609, 0.1160199, -0.7781121, 1, 0.1686275, 0, 1,
-1.9229, -0.9315131, -1.351365, 1, 0.172549, 0, 1,
-1.904856, -0.8582141, -4.311874, 1, 0.1803922, 0, 1,
-1.879585, 1.090659, -1.471934, 1, 0.1843137, 0, 1,
-1.86744, 1.237667, -0.9485998, 1, 0.1921569, 0, 1,
-1.86552, -2.018696, -3.038111, 1, 0.1960784, 0, 1,
-1.852456, -0.691204, -1.293034, 1, 0.2039216, 0, 1,
-1.821323, 0.1098374, -3.100701, 1, 0.2117647, 0, 1,
-1.810032, 0.8238264, 0.1103179, 1, 0.2156863, 0, 1,
-1.805478, 1.719167, 0.1192278, 1, 0.2235294, 0, 1,
-1.795276, 1.086596, -0.5643529, 1, 0.227451, 0, 1,
-1.759725, 1.055553, 0.1975361, 1, 0.2352941, 0, 1,
-1.742315, -0.3778239, -1.075692, 1, 0.2392157, 0, 1,
-1.734464, -0.872865, -3.956403, 1, 0.2470588, 0, 1,
-1.729047, -0.6683116, -1.211993, 1, 0.2509804, 0, 1,
-1.728965, 1.109524, -1.234104, 1, 0.2588235, 0, 1,
-1.720726, -1.127091, -3.103517, 1, 0.2627451, 0, 1,
-1.706666, -0.02166195, -1.523469, 1, 0.2705882, 0, 1,
-1.706399, 0.1327948, 1.690639, 1, 0.2745098, 0, 1,
-1.699563, -1.080482, -1.825655, 1, 0.282353, 0, 1,
-1.695403, 1.429326, -1.203983, 1, 0.2862745, 0, 1,
-1.691, -0.0235525, -1.177457, 1, 0.2941177, 0, 1,
-1.677583, -0.1248671, -0.09758663, 1, 0.3019608, 0, 1,
-1.674699, 1.058203, -1.71007, 1, 0.3058824, 0, 1,
-1.662997, -0.1633075, -0.9053568, 1, 0.3137255, 0, 1,
-1.65001, -0.2374856, -1.898839, 1, 0.3176471, 0, 1,
-1.64842, -0.6886865, -2.190348, 1, 0.3254902, 0, 1,
-1.641176, -0.168601, -1.432764, 1, 0.3294118, 0, 1,
-1.641147, -0.627266, -2.36595, 1, 0.3372549, 0, 1,
-1.637728, 1.266423, 0.1462568, 1, 0.3411765, 0, 1,
-1.635798, -0.4186166, -1.372552, 1, 0.3490196, 0, 1,
-1.620291, 1.613313, -1.152996, 1, 0.3529412, 0, 1,
-1.611414, 1.248138, -2.16864, 1, 0.3607843, 0, 1,
-1.603958, 0.7318873, -0.2485215, 1, 0.3647059, 0, 1,
-1.590755, -1.397733, -2.034634, 1, 0.372549, 0, 1,
-1.587305, -0.495344, -2.675452, 1, 0.3764706, 0, 1,
-1.582825, 1.744086, 0.6833603, 1, 0.3843137, 0, 1,
-1.568934, -1.254017, -1.114295, 1, 0.3882353, 0, 1,
-1.564604, -0.006948296, -1.967933, 1, 0.3960784, 0, 1,
-1.562966, -1.087037, -3.104486, 1, 0.4039216, 0, 1,
-1.551545, -0.8886867, -2.975242, 1, 0.4078431, 0, 1,
-1.550559, 0.4362864, -1.149662, 1, 0.4156863, 0, 1,
-1.544938, -0.9949579, -3.234633, 1, 0.4196078, 0, 1,
-1.537433, 0.02773727, -1.825858, 1, 0.427451, 0, 1,
-1.525268, -0.6856387, -3.470013, 1, 0.4313726, 0, 1,
-1.52518, -1.482984, -2.732761, 1, 0.4392157, 0, 1,
-1.5225, 0.5939298, -0.2362472, 1, 0.4431373, 0, 1,
-1.52242, 0.6397415, -0.07819626, 1, 0.4509804, 0, 1,
-1.518918, 0.372463, -0.9137327, 1, 0.454902, 0, 1,
-1.517364, 0.2994491, 0.4571563, 1, 0.4627451, 0, 1,
-1.511358, 1.452706, -1.695426, 1, 0.4666667, 0, 1,
-1.50637, 0.03418442, -2.021673, 1, 0.4745098, 0, 1,
-1.491095, 0.04751703, -1.637331, 1, 0.4784314, 0, 1,
-1.481463, 0.2933114, -1.275646, 1, 0.4862745, 0, 1,
-1.480688, 0.8499882, 0.2418296, 1, 0.4901961, 0, 1,
-1.474677, -1.3806, -3.042614, 1, 0.4980392, 0, 1,
-1.471282, 2.059964, 0.6870098, 1, 0.5058824, 0, 1,
-1.449469, 0.982808, 0.03119538, 1, 0.509804, 0, 1,
-1.430311, -0.6975344, -2.909275, 1, 0.5176471, 0, 1,
-1.419052, 1.721939, -0.7870138, 1, 0.5215687, 0, 1,
-1.41734, -0.2223206, -1.664001, 1, 0.5294118, 0, 1,
-1.405993, -0.1626528, -1.928788, 1, 0.5333334, 0, 1,
-1.400451, 1.464582, -1.672363, 1, 0.5411765, 0, 1,
-1.390416, 0.0224685, 0.02253256, 1, 0.5450981, 0, 1,
-1.378835, 0.5013488, 0.230874, 1, 0.5529412, 0, 1,
-1.378552, 0.962537, -0.1236105, 1, 0.5568628, 0, 1,
-1.376596, -0.4148358, -3.68193, 1, 0.5647059, 0, 1,
-1.365146, -1.538933, -3.685847, 1, 0.5686275, 0, 1,
-1.363275, -0.4880905, -3.323228, 1, 0.5764706, 0, 1,
-1.358382, 1.895469, -1.067771, 1, 0.5803922, 0, 1,
-1.35608, 0.345492, -1.147786, 1, 0.5882353, 0, 1,
-1.349423, 0.8619792, -0.8439457, 1, 0.5921569, 0, 1,
-1.338321, 0.4650429, -1.099495, 1, 0.6, 0, 1,
-1.335353, -1.242795, -2.416376, 1, 0.6078432, 0, 1,
-1.332247, 0.3419503, -2.03452, 1, 0.6117647, 0, 1,
-1.323843, -2.104511, -3.743282, 1, 0.6196079, 0, 1,
-1.322101, -0.9312982, -2.067276, 1, 0.6235294, 0, 1,
-1.316129, -0.720177, -2.684045, 1, 0.6313726, 0, 1,
-1.315949, 0.09437536, -2.305967, 1, 0.6352941, 0, 1,
-1.311682, -0.1562984, -2.68423, 1, 0.6431373, 0, 1,
-1.30501, -0.2567627, -2.194707, 1, 0.6470588, 0, 1,
-1.30333, 0.1306839, -3.412835, 1, 0.654902, 0, 1,
-1.300229, -0.3211362, -3.111569, 1, 0.6588235, 0, 1,
-1.300196, 0.9511317, 0.04705568, 1, 0.6666667, 0, 1,
-1.297528, -0.9774405, -2.991644, 1, 0.6705883, 0, 1,
-1.294908, 0.6016059, -1.630272, 1, 0.6784314, 0, 1,
-1.290351, 1.046886, -0.2765444, 1, 0.682353, 0, 1,
-1.273963, 1.309194, 0.299609, 1, 0.6901961, 0, 1,
-1.272962, 0.1537604, -2.392711, 1, 0.6941177, 0, 1,
-1.269516, -0.04171355, -0.7585521, 1, 0.7019608, 0, 1,
-1.253332, -1.24867, -2.207567, 1, 0.7098039, 0, 1,
-1.25052, 0.8947629, 0.9267088, 1, 0.7137255, 0, 1,
-1.249478, 0.2256889, -2.970501, 1, 0.7215686, 0, 1,
-1.24689, -1.793128, -2.150239, 1, 0.7254902, 0, 1,
-1.238193, 0.5630646, -0.6019338, 1, 0.7333333, 0, 1,
-1.233946, -0.5864574, -1.583089, 1, 0.7372549, 0, 1,
-1.232826, -0.6577752, -1.785651, 1, 0.7450981, 0, 1,
-1.230366, -1.96854, -2.321689, 1, 0.7490196, 0, 1,
-1.230298, 1.154148, -2.314002, 1, 0.7568628, 0, 1,
-1.229914, 0.7043636, 0.8283635, 1, 0.7607843, 0, 1,
-1.22664, 1.26111, -0.4388949, 1, 0.7686275, 0, 1,
-1.223903, -0.3348957, -2.052513, 1, 0.772549, 0, 1,
-1.216689, -0.01168812, -0.7562922, 1, 0.7803922, 0, 1,
-1.212502, -1.644336, -2.696547, 1, 0.7843137, 0, 1,
-1.2112, -0.02973126, -0.6529654, 1, 0.7921569, 0, 1,
-1.207295, -2.424326, -1.6298, 1, 0.7960784, 0, 1,
-1.197638, -0.1262035, -1.362424, 1, 0.8039216, 0, 1,
-1.197093, 0.5817688, -3.643687, 1, 0.8117647, 0, 1,
-1.194722, 0.2174512, -2.459239, 1, 0.8156863, 0, 1,
-1.191722, 0.7017834, -2.435707, 1, 0.8235294, 0, 1,
-1.18952, -0.1538786, 0.6132185, 1, 0.827451, 0, 1,
-1.188295, 1.122402, -0.1159505, 1, 0.8352941, 0, 1,
-1.183875, -0.495556, -2.709135, 1, 0.8392157, 0, 1,
-1.182094, -1.888095, -3.357192, 1, 0.8470588, 0, 1,
-1.169157, -0.5024387, -2.944505, 1, 0.8509804, 0, 1,
-1.166105, 1.638942, -0.8577941, 1, 0.8588235, 0, 1,
-1.164666, -0.0505289, -0.8381008, 1, 0.8627451, 0, 1,
-1.162004, -0.4243021, -2.483522, 1, 0.8705882, 0, 1,
-1.157964, -0.06697087, -0.7223836, 1, 0.8745098, 0, 1,
-1.153235, 0.09672265, -1.958005, 1, 0.8823529, 0, 1,
-1.151622, 0.1098267, -1.034345, 1, 0.8862745, 0, 1,
-1.149503, 0.3950798, -0.9876255, 1, 0.8941177, 0, 1,
-1.146127, -0.4157353, -1.211583, 1, 0.8980392, 0, 1,
-1.137045, -0.5721816, -1.595413, 1, 0.9058824, 0, 1,
-1.135084, 0.2710216, -0.5691468, 1, 0.9137255, 0, 1,
-1.13333, 0.2117914, -3.121524, 1, 0.9176471, 0, 1,
-1.130711, -1.361593, -3.407929, 1, 0.9254902, 0, 1,
-1.119828, 0.1102429, -2.033961, 1, 0.9294118, 0, 1,
-1.118826, -0.01741726, -3.108178, 1, 0.9372549, 0, 1,
-1.113581, -0.1425036, -4.17813, 1, 0.9411765, 0, 1,
-1.110062, -2.643607, -2.776262, 1, 0.9490196, 0, 1,
-1.109817, 0.1178448, -1.754645, 1, 0.9529412, 0, 1,
-1.105948, -0.4099262, -2.74886, 1, 0.9607843, 0, 1,
-1.092943, 0.9576521, -0.4130488, 1, 0.9647059, 0, 1,
-1.090363, 2.617969, 0.2167106, 1, 0.972549, 0, 1,
-1.089336, -0.5176494, -1.709683, 1, 0.9764706, 0, 1,
-1.086908, 0.2939612, -2.577108, 1, 0.9843137, 0, 1,
-1.082834, 1.661953, -0.1555114, 1, 0.9882353, 0, 1,
-1.081198, 0.5482157, -0.1199694, 1, 0.9960784, 0, 1,
-1.071427, -0.6282094, -2.54714, 0.9960784, 1, 0, 1,
-1.069611, -0.3271485, -3.293716, 0.9921569, 1, 0, 1,
-1.050406, -0.1009117, -0.6358621, 0.9843137, 1, 0, 1,
-1.047362, 0.619072, -1.959341, 0.9803922, 1, 0, 1,
-1.04239, -0.4109814, -2.884459, 0.972549, 1, 0, 1,
-1.041325, -0.6593612, -1.240274, 0.9686275, 1, 0, 1,
-1.039565, -1.329051, -4.800024, 0.9607843, 1, 0, 1,
-1.039216, -1.344343, -2.661155, 0.9568627, 1, 0, 1,
-1.036577, -0.5214255, -3.597717, 0.9490196, 1, 0, 1,
-1.036271, 0.947691, -2.206543, 0.945098, 1, 0, 1,
-1.03553, 0.5341347, 0.3718755, 0.9372549, 1, 0, 1,
-1.03431, 0.8900012, -1.9609, 0.9333333, 1, 0, 1,
-1.028907, 0.5103046, -1.345145, 0.9254902, 1, 0, 1,
-1.023184, 0.05919094, -3.040607, 0.9215686, 1, 0, 1,
-1.022127, -0.829841, -2.721996, 0.9137255, 1, 0, 1,
-1.009458, -0.3264229, -1.329827, 0.9098039, 1, 0, 1,
-1.000978, 0.03240614, 0.7521399, 0.9019608, 1, 0, 1,
-0.9996438, -0.3537606, -0.9717645, 0.8941177, 1, 0, 1,
-0.9858371, 0.6105247, 0.6352615, 0.8901961, 1, 0, 1,
-0.9820623, -1.67809, -2.573164, 0.8823529, 1, 0, 1,
-0.9708083, -0.9602813, -1.603119, 0.8784314, 1, 0, 1,
-0.9645028, 0.12473, -0.2602322, 0.8705882, 1, 0, 1,
-0.9607312, 1.092638, -2.271116, 0.8666667, 1, 0, 1,
-0.9547368, 0.5106163, -1.178104, 0.8588235, 1, 0, 1,
-0.9496889, -1.955402, -2.692878, 0.854902, 1, 0, 1,
-0.9446486, 0.103336, -1.84268, 0.8470588, 1, 0, 1,
-0.9423744, -0.916181, -1.484504, 0.8431373, 1, 0, 1,
-0.9404464, -1.491526, -0.6010704, 0.8352941, 1, 0, 1,
-0.9400028, -1.551029, -2.215223, 0.8313726, 1, 0, 1,
-0.9251302, -1.133592, -2.322249, 0.8235294, 1, 0, 1,
-0.9243673, -1.766383, -3.870059, 0.8196079, 1, 0, 1,
-0.9195868, -0.9674912, -4.33115, 0.8117647, 1, 0, 1,
-0.9096655, -0.786374, -2.878478, 0.8078431, 1, 0, 1,
-0.905087, -0.8343764, -3.247141, 0.8, 1, 0, 1,
-0.9031156, -0.9613594, -0.2183904, 0.7921569, 1, 0, 1,
-0.900589, 0.5935867, -1.274687, 0.7882353, 1, 0, 1,
-0.8960102, 0.9034687, -1.453766, 0.7803922, 1, 0, 1,
-0.8919043, 1.045629, -0.1753785, 0.7764706, 1, 0, 1,
-0.8870566, -1.008978, -1.575904, 0.7686275, 1, 0, 1,
-0.8835808, 1.125642, 0.1820917, 0.7647059, 1, 0, 1,
-0.8803183, -0.03814068, -1.594847, 0.7568628, 1, 0, 1,
-0.8723807, -0.07763965, -2.130737, 0.7529412, 1, 0, 1,
-0.8698568, -0.1339038, -2.427072, 0.7450981, 1, 0, 1,
-0.860658, -0.1971944, -2.850395, 0.7411765, 1, 0, 1,
-0.8550213, 0.4840722, -2.613334, 0.7333333, 1, 0, 1,
-0.8547016, -0.9637699, -0.6839032, 0.7294118, 1, 0, 1,
-0.8543369, -0.774846, -2.175124, 0.7215686, 1, 0, 1,
-0.8474907, 0.7000543, -1.000451, 0.7176471, 1, 0, 1,
-0.845006, 0.9483986, -3.261933, 0.7098039, 1, 0, 1,
-0.8414862, -0.2209729, -0.4985519, 0.7058824, 1, 0, 1,
-0.8405692, 0.1713642, -1.335197, 0.6980392, 1, 0, 1,
-0.8328259, 0.05559118, -2.210718, 0.6901961, 1, 0, 1,
-0.8290715, -0.4488137, -2.483259, 0.6862745, 1, 0, 1,
-0.8264804, -0.2894086, -1.722167, 0.6784314, 1, 0, 1,
-0.8248352, -1.926141, -1.290833, 0.6745098, 1, 0, 1,
-0.8199864, 1.443891, -2.56501, 0.6666667, 1, 0, 1,
-0.8122863, -1.01707, -1.761933, 0.6627451, 1, 0, 1,
-0.8065263, -1.16105, -2.835549, 0.654902, 1, 0, 1,
-0.8056691, 0.8022122, -0.927701, 0.6509804, 1, 0, 1,
-0.8025537, 0.9312081, -0.03398189, 0.6431373, 1, 0, 1,
-0.7998598, 0.1656939, -0.7338813, 0.6392157, 1, 0, 1,
-0.7963485, 0.8283834, 0.2172618, 0.6313726, 1, 0, 1,
-0.7898359, -0.2205443, -1.859978, 0.627451, 1, 0, 1,
-0.7809238, -0.6644514, -2.794908, 0.6196079, 1, 0, 1,
-0.776683, -2.26737, -2.540666, 0.6156863, 1, 0, 1,
-0.7731965, 0.2834554, -2.217759, 0.6078432, 1, 0, 1,
-0.7727819, 0.5427713, -0.3998803, 0.6039216, 1, 0, 1,
-0.7711692, -0.03247226, -1.780474, 0.5960785, 1, 0, 1,
-0.7645065, -0.530152, -2.677314, 0.5882353, 1, 0, 1,
-0.75867, -0.2059171, 0.8102795, 0.5843138, 1, 0, 1,
-0.7568566, -0.9838724, -0.872365, 0.5764706, 1, 0, 1,
-0.7565663, -1.737544, -5.714975, 0.572549, 1, 0, 1,
-0.7503327, 0.06706002, -1.211808, 0.5647059, 1, 0, 1,
-0.7490018, -1.125906, -2.914656, 0.5607843, 1, 0, 1,
-0.7458014, -1.254474, -1.579252, 0.5529412, 1, 0, 1,
-0.7378385, 0.1375708, -3.356159, 0.5490196, 1, 0, 1,
-0.7363295, -0.6989726, -2.437748, 0.5411765, 1, 0, 1,
-0.7358633, 1.857895, -1.270086, 0.5372549, 1, 0, 1,
-0.7328733, 0.1437904, -3.524328, 0.5294118, 1, 0, 1,
-0.7278045, 0.5789127, -1.075071, 0.5254902, 1, 0, 1,
-0.7229367, 0.6089159, 0.1972066, 0.5176471, 1, 0, 1,
-0.7224838, 0.2667062, -1.055805, 0.5137255, 1, 0, 1,
-0.7174256, 0.6998332, -0.1197039, 0.5058824, 1, 0, 1,
-0.708077, 0.739112, 0.8472497, 0.5019608, 1, 0, 1,
-0.7073081, -1.773563, -3.333862, 0.4941176, 1, 0, 1,
-0.7031674, 0.4412573, -0.5082192, 0.4862745, 1, 0, 1,
-0.7021365, -1.30893, -0.5047951, 0.4823529, 1, 0, 1,
-0.6997487, -0.3273563, -1.127203, 0.4745098, 1, 0, 1,
-0.6954536, 0.001242808, -1.921049, 0.4705882, 1, 0, 1,
-0.6928271, 0.8551056, -0.8011132, 0.4627451, 1, 0, 1,
-0.6901636, 1.320553, -2.836029, 0.4588235, 1, 0, 1,
-0.6864214, -1.706147, -2.444454, 0.4509804, 1, 0, 1,
-0.6833237, 0.9091352, -1.755506, 0.4470588, 1, 0, 1,
-0.6828254, 1.19592, -0.922577, 0.4392157, 1, 0, 1,
-0.6814106, 0.610799, -1.404727, 0.4352941, 1, 0, 1,
-0.6783881, -1.776068, -3.714913, 0.427451, 1, 0, 1,
-0.670554, -0.8920724, -1.864067, 0.4235294, 1, 0, 1,
-0.6661582, 0.0121006, 0.1943215, 0.4156863, 1, 0, 1,
-0.6629406, -2.115386, -3.465665, 0.4117647, 1, 0, 1,
-0.6582259, -0.09191417, -0.2940788, 0.4039216, 1, 0, 1,
-0.654349, -0.169138, -3.276674, 0.3960784, 1, 0, 1,
-0.6538935, 1.317968, -1.627972, 0.3921569, 1, 0, 1,
-0.6496944, -0.2993818, -1.258472, 0.3843137, 1, 0, 1,
-0.649488, 0.03051966, -1.837286, 0.3803922, 1, 0, 1,
-0.6487255, 0.5007578, 0.293221, 0.372549, 1, 0, 1,
-0.6483917, -1.366644, -3.401279, 0.3686275, 1, 0, 1,
-0.6467964, 0.543507, -2.223236, 0.3607843, 1, 0, 1,
-0.6416026, -0.08913575, -0.7255427, 0.3568628, 1, 0, 1,
-0.6403034, -0.4350553, -2.522239, 0.3490196, 1, 0, 1,
-0.639742, -0.1630581, -2.869168, 0.345098, 1, 0, 1,
-0.636208, -0.6390836, -2.567544, 0.3372549, 1, 0, 1,
-0.6351541, -0.1214677, -2.237062, 0.3333333, 1, 0, 1,
-0.6306947, -1.714926, -1.624059, 0.3254902, 1, 0, 1,
-0.625779, -0.2313951, -1.411709, 0.3215686, 1, 0, 1,
-0.6245266, 0.8641785, -2.145855, 0.3137255, 1, 0, 1,
-0.6244248, -0.2817964, -1.207045, 0.3098039, 1, 0, 1,
-0.621198, -0.9071456, -3.424591, 0.3019608, 1, 0, 1,
-0.6123099, 0.211861, -1.444197, 0.2941177, 1, 0, 1,
-0.6094289, 2.250226, 0.0858364, 0.2901961, 1, 0, 1,
-0.6039498, -1.457306, -2.319417, 0.282353, 1, 0, 1,
-0.6015815, -0.3618513, -2.778875, 0.2784314, 1, 0, 1,
-0.5970128, -1.231494, -3.621299, 0.2705882, 1, 0, 1,
-0.5959622, 0.879765, -0.3046108, 0.2666667, 1, 0, 1,
-0.5899912, -0.7917219, -3.180048, 0.2588235, 1, 0, 1,
-0.584996, -0.5117286, -2.710173, 0.254902, 1, 0, 1,
-0.5848782, -0.5869039, -2.657199, 0.2470588, 1, 0, 1,
-0.5833718, 0.6669574, -0.5671626, 0.2431373, 1, 0, 1,
-0.5823863, -0.3319211, -2.447229, 0.2352941, 1, 0, 1,
-0.5813748, -1.417447, -3.602182, 0.2313726, 1, 0, 1,
-0.5770952, 1.356624, 0.2170759, 0.2235294, 1, 0, 1,
-0.5724958, -0.6097028, -2.742969, 0.2196078, 1, 0, 1,
-0.5700682, -0.4399685, -2.040618, 0.2117647, 1, 0, 1,
-0.5686265, -0.7666549, -1.572615, 0.2078431, 1, 0, 1,
-0.5673143, 0.5119062, -1.304528, 0.2, 1, 0, 1,
-0.5662274, 1.63348, 0.3288009, 0.1921569, 1, 0, 1,
-0.565971, 0.4417741, -2.308268, 0.1882353, 1, 0, 1,
-0.5645664, -0.4085228, -3.506109, 0.1803922, 1, 0, 1,
-0.5613706, -0.06044023, -0.8726396, 0.1764706, 1, 0, 1,
-0.561262, 0.09180751, -1.070133, 0.1686275, 1, 0, 1,
-0.560656, 0.8134279, -2.371477, 0.1647059, 1, 0, 1,
-0.5452808, 0.2045476, -1.739716, 0.1568628, 1, 0, 1,
-0.5435588, 1.294495, -1.091808, 0.1529412, 1, 0, 1,
-0.5432906, -0.6442187, -3.427217, 0.145098, 1, 0, 1,
-0.5432429, 1.324248, 0.4587544, 0.1411765, 1, 0, 1,
-0.5397291, -1.14123, -2.773987, 0.1333333, 1, 0, 1,
-0.5382745, 0.9848936, -0.4885628, 0.1294118, 1, 0, 1,
-0.5369486, -0.6574476, -3.8542, 0.1215686, 1, 0, 1,
-0.5338623, 1.486749, 0.5944284, 0.1176471, 1, 0, 1,
-0.5318811, -0.1391599, -1.286962, 0.1098039, 1, 0, 1,
-0.5278119, 0.6372969, -0.5598841, 0.1058824, 1, 0, 1,
-0.5267683, -2.155143, -2.625719, 0.09803922, 1, 0, 1,
-0.5234507, 1.189646, -3.07298, 0.09019608, 1, 0, 1,
-0.5227751, -2.184114, -2.084456, 0.08627451, 1, 0, 1,
-0.5185364, 0.5002849, -1.628462, 0.07843138, 1, 0, 1,
-0.5178386, 1.411712, -0.4388649, 0.07450981, 1, 0, 1,
-0.5115433, -0.1249529, -2.933554, 0.06666667, 1, 0, 1,
-0.508392, 0.5233574, -0.7638056, 0.0627451, 1, 0, 1,
-0.5065625, 0.5311433, 0.1487464, 0.05490196, 1, 0, 1,
-0.5033022, 0.4984115, -0.8641935, 0.05098039, 1, 0, 1,
-0.5015072, -0.6726819, -1.797583, 0.04313726, 1, 0, 1,
-0.5000596, -0.09104169, -0.4663051, 0.03921569, 1, 0, 1,
-0.4995797, 0.48463, -0.9254435, 0.03137255, 1, 0, 1,
-0.4986326, 0.1020066, -1.2417, 0.02745098, 1, 0, 1,
-0.4967394, 0.806877, -0.8727005, 0.01960784, 1, 0, 1,
-0.4956954, -1.146217, -1.470639, 0.01568628, 1, 0, 1,
-0.4956197, 0.3625517, -0.1237351, 0.007843138, 1, 0, 1,
-0.4956175, -0.4634115, -1.446066, 0.003921569, 1, 0, 1,
-0.4951351, 1.013088, -1.368076, 0, 1, 0.003921569, 1,
-0.485635, 0.9525129, -2.448671, 0, 1, 0.01176471, 1,
-0.4804251, 0.5345415, -2.016712, 0, 1, 0.01568628, 1,
-0.4778569, 1.60924, -1.759915, 0, 1, 0.02352941, 1,
-0.4757758, 0.03368595, -0.1984935, 0, 1, 0.02745098, 1,
-0.475739, 0.08294704, -0.1055302, 0, 1, 0.03529412, 1,
-0.4734859, 0.1327726, -1.50831, 0, 1, 0.03921569, 1,
-0.4732169, 0.5211818, 0.6769002, 0, 1, 0.04705882, 1,
-0.4656545, -0.7549576, -2.307459, 0, 1, 0.05098039, 1,
-0.4606255, -1.362171, -5.680169, 0, 1, 0.05882353, 1,
-0.4605119, 0.5966837, -0.7039168, 0, 1, 0.0627451, 1,
-0.4595292, 0.046956, -1.524557, 0, 1, 0.07058824, 1,
-0.4565184, -0.9389548, -3.09247, 0, 1, 0.07450981, 1,
-0.4455377, -0.1919644, -2.482486, 0, 1, 0.08235294, 1,
-0.4423066, -0.1469372, -2.851318, 0, 1, 0.08627451, 1,
-0.4403279, 0.05044237, -1.070306, 0, 1, 0.09411765, 1,
-0.430596, 0.2123028, -1.929837, 0, 1, 0.1019608, 1,
-0.4297586, -0.9144619, -2.492957, 0, 1, 0.1058824, 1,
-0.4193978, 0.273151, -1.691974, 0, 1, 0.1137255, 1,
-0.4183411, -0.6774347, -2.384993, 0, 1, 0.1176471, 1,
-0.4139436, 0.7757008, -1.003162, 0, 1, 0.1254902, 1,
-0.4133103, 0.8287906, -0.1749425, 0, 1, 0.1294118, 1,
-0.4088804, 0.1841959, -0.7886242, 0, 1, 0.1372549, 1,
-0.4083999, 1.268306, -1.308859, 0, 1, 0.1411765, 1,
-0.4076816, -0.202484, -2.720464, 0, 1, 0.1490196, 1,
-0.4067066, 0.4990987, -0.4321632, 0, 1, 0.1529412, 1,
-0.4037734, 0.3701731, 2.037902, 0, 1, 0.1607843, 1,
-0.4019307, -0.5125921, -3.526187, 0, 1, 0.1647059, 1,
-0.3969791, 0.8699777, -1.685479, 0, 1, 0.172549, 1,
-0.3969738, -1.594488, -2.007668, 0, 1, 0.1764706, 1,
-0.3951078, 0.9564645, -0.3600332, 0, 1, 0.1843137, 1,
-0.3883977, 0.5657832, -0.6419947, 0, 1, 0.1882353, 1,
-0.3851613, -1.043133, -3.730191, 0, 1, 0.1960784, 1,
-0.3816986, 1.886306, -0.2888316, 0, 1, 0.2039216, 1,
-0.3793426, 2.143573, 0.6180838, 0, 1, 0.2078431, 1,
-0.3781962, 2.086103, -0.1996287, 0, 1, 0.2156863, 1,
-0.3781513, -0.4852709, -0.6804854, 0, 1, 0.2196078, 1,
-0.3689017, 1.661054, 0.4821259, 0, 1, 0.227451, 1,
-0.3645258, -0.4552872, -2.396137, 0, 1, 0.2313726, 1,
-0.3583665, 0.01685074, -2.764184, 0, 1, 0.2392157, 1,
-0.3555149, -0.7554516, -2.224234, 0, 1, 0.2431373, 1,
-0.3538281, -0.09173188, -1.617324, 0, 1, 0.2509804, 1,
-0.3529636, -0.3175697, -2.192989, 0, 1, 0.254902, 1,
-0.3436777, 0.9556872, -1.389269, 0, 1, 0.2627451, 1,
-0.3433096, 1.734792, 0.3187101, 0, 1, 0.2666667, 1,
-0.342307, 2.525067, 0.3564907, 0, 1, 0.2745098, 1,
-0.339596, 0.1113272, -2.85368, 0, 1, 0.2784314, 1,
-0.3385935, -1.543058, -3.849307, 0, 1, 0.2862745, 1,
-0.338148, -0.4835859, -3.203481, 0, 1, 0.2901961, 1,
-0.3368913, 0.4649488, -1.163082, 0, 1, 0.2980392, 1,
-0.3359553, 1.523595, -0.08897652, 0, 1, 0.3058824, 1,
-0.3334996, -0.1000593, -1.254367, 0, 1, 0.3098039, 1,
-0.3332728, -0.8767125, -1.574184, 0, 1, 0.3176471, 1,
-0.3317073, -0.3772405, -3.108535, 0, 1, 0.3215686, 1,
-0.3285395, 0.2097813, -1.471138, 0, 1, 0.3294118, 1,
-0.3284939, -0.03269983, -2.492976, 0, 1, 0.3333333, 1,
-0.3212282, 0.2106112, -0.6482217, 0, 1, 0.3411765, 1,
-0.3170148, 1.776163, -0.1374717, 0, 1, 0.345098, 1,
-0.3090464, -0.186852, -3.156985, 0, 1, 0.3529412, 1,
-0.3066483, 0.4323898, -0.4422254, 0, 1, 0.3568628, 1,
-0.3058946, 0.4770158, -1.187704, 0, 1, 0.3647059, 1,
-0.304788, 0.4637985, 0.8166921, 0, 1, 0.3686275, 1,
-0.3035817, -0.9787678, -2.517201, 0, 1, 0.3764706, 1,
-0.2950441, 0.66307, 0.4687713, 0, 1, 0.3803922, 1,
-0.2917064, -0.7010205, -2.661899, 0, 1, 0.3882353, 1,
-0.2889699, -1.035245, -2.678388, 0, 1, 0.3921569, 1,
-0.2875122, -0.1496122, -2.236215, 0, 1, 0.4, 1,
-0.2805976, -0.1436729, -1.381612, 0, 1, 0.4078431, 1,
-0.2804202, 0.9178481, -1.6829, 0, 1, 0.4117647, 1,
-0.2797712, 0.6839746, -0.2920851, 0, 1, 0.4196078, 1,
-0.2774557, 0.4116547, -0.5931256, 0, 1, 0.4235294, 1,
-0.2773417, 0.9162493, 0.3599354, 0, 1, 0.4313726, 1,
-0.2737926, -0.9002382, -2.795985, 0, 1, 0.4352941, 1,
-0.2728135, 0.3031443, -0.4494462, 0, 1, 0.4431373, 1,
-0.2638293, 0.4535483, 0.6301213, 0, 1, 0.4470588, 1,
-0.2625043, 2.204024, -0.04734302, 0, 1, 0.454902, 1,
-0.2605823, 0.5876033, 0.3879616, 0, 1, 0.4588235, 1,
-0.2604739, -0.8651437, -4.59869, 0, 1, 0.4666667, 1,
-0.2586811, -1.111569, -3.006751, 0, 1, 0.4705882, 1,
-0.2566868, 0.5168247, -3.443887, 0, 1, 0.4784314, 1,
-0.2519026, -2.306766, -2.833395, 0, 1, 0.4823529, 1,
-0.2512805, 1.042664, -0.7402638, 0, 1, 0.4901961, 1,
-0.2480372, 0.008854141, -1.767961, 0, 1, 0.4941176, 1,
-0.2448014, -1.328281, -3.756172, 0, 1, 0.5019608, 1,
-0.2433394, 0.6033285, -1.310198, 0, 1, 0.509804, 1,
-0.236461, 0.5790716, 0.3283358, 0, 1, 0.5137255, 1,
-0.2150428, 0.8241254, -0.9329656, 0, 1, 0.5215687, 1,
-0.2083737, -1.527599, -3.45632, 0, 1, 0.5254902, 1,
-0.2032545, -1.592431, -2.672228, 0, 1, 0.5333334, 1,
-0.1843476, 0.5978204, -0.2187486, 0, 1, 0.5372549, 1,
-0.1817124, 0.8313681, -0.5699008, 0, 1, 0.5450981, 1,
-0.1812308, 0.9816245, 0.9506093, 0, 1, 0.5490196, 1,
-0.1787657, -1.019411, -3.792372, 0, 1, 0.5568628, 1,
-0.1781883, 2.231313, -0.115572, 0, 1, 0.5607843, 1,
-0.1729165, -0.350583, -3.799978, 0, 1, 0.5686275, 1,
-0.1698363, -1.421967, -0.9122407, 0, 1, 0.572549, 1,
-0.1689821, 0.9445723, -1.00504, 0, 1, 0.5803922, 1,
-0.1684712, 2.094526, -1.723072, 0, 1, 0.5843138, 1,
-0.1674831, -0.3961378, -2.468867, 0, 1, 0.5921569, 1,
-0.1665568, 1.251621, -0.2002508, 0, 1, 0.5960785, 1,
-0.1637045, -0.8512439, -3.228768, 0, 1, 0.6039216, 1,
-0.1553418, -0.7164254, -2.746084, 0, 1, 0.6117647, 1,
-0.1550351, -1.356284, -3.152039, 0, 1, 0.6156863, 1,
-0.1515453, -0.3080951, -2.608229, 0, 1, 0.6235294, 1,
-0.1507227, -0.7807459, -0.7845809, 0, 1, 0.627451, 1,
-0.1489996, -1.354548, -2.66958, 0, 1, 0.6352941, 1,
-0.1474564, -0.2713139, -1.966944, 0, 1, 0.6392157, 1,
-0.1426931, 0.4604699, 1.51708, 0, 1, 0.6470588, 1,
-0.1380038, -1.379694, -1.18441, 0, 1, 0.6509804, 1,
-0.1373354, 1.278222, -0.3112304, 0, 1, 0.6588235, 1,
-0.1328921, -0.8276213, -3.216764, 0, 1, 0.6627451, 1,
-0.1328192, -0.6839032, -3.798015, 0, 1, 0.6705883, 1,
-0.1328118, -0.1380621, -2.630909, 0, 1, 0.6745098, 1,
-0.1270207, 0.2868375, 0.9451994, 0, 1, 0.682353, 1,
-0.1254397, -1.746782, -3.736438, 0, 1, 0.6862745, 1,
-0.1226718, 0.5331451, -1.680566, 0, 1, 0.6941177, 1,
-0.1224529, -0.4953029, -2.522695, 0, 1, 0.7019608, 1,
-0.1204767, 0.07273857, -0.877641, 0, 1, 0.7058824, 1,
-0.1138545, 0.7800962, -0.3336497, 0, 1, 0.7137255, 1,
-0.1113159, 0.1523874, -2.109005, 0, 1, 0.7176471, 1,
-0.1108115, -0.1377697, -2.64378, 0, 1, 0.7254902, 1,
-0.1107149, -1.445958, -3.508714, 0, 1, 0.7294118, 1,
-0.1086161, 1.344774, -0.6704896, 0, 1, 0.7372549, 1,
-0.1053665, 1.619179, 0.1837284, 0, 1, 0.7411765, 1,
-0.1036327, -0.9558341, -2.510006, 0, 1, 0.7490196, 1,
-0.1036151, 0.2006082, -0.685252, 0, 1, 0.7529412, 1,
-0.1005505, -0.8058176, -3.825934, 0, 1, 0.7607843, 1,
-0.09345268, -0.2508455, -3.614202, 0, 1, 0.7647059, 1,
-0.09335432, -0.2573461, -2.444076, 0, 1, 0.772549, 1,
-0.08534247, -1.039808, -4.779215, 0, 1, 0.7764706, 1,
-0.07662332, 0.6318783, 0.4821013, 0, 1, 0.7843137, 1,
-0.0731958, 0.269035, -0.5811865, 0, 1, 0.7882353, 1,
-0.06916077, 0.07201404, -0.9576923, 0, 1, 0.7960784, 1,
-0.06689852, 0.4569957, -0.4945492, 0, 1, 0.8039216, 1,
-0.06656938, 1.959692, -2.250594, 0, 1, 0.8078431, 1,
-0.06650007, -0.05977204, -3.958023, 0, 1, 0.8156863, 1,
-0.06453419, 0.7191027, -1.114328, 0, 1, 0.8196079, 1,
-0.05048973, 0.4134648, -0.5379488, 0, 1, 0.827451, 1,
-0.04948537, 1.085672, 0.439868, 0, 1, 0.8313726, 1,
-0.04538678, 2.011274, -0.07827663, 0, 1, 0.8392157, 1,
-0.04497527, -0.04243765, -1.460171, 0, 1, 0.8431373, 1,
-0.04359272, 1.154365, 0.1299231, 0, 1, 0.8509804, 1,
-0.04185591, -0.3485627, -2.670574, 0, 1, 0.854902, 1,
-0.03900674, -0.7853554, -4.27848, 0, 1, 0.8627451, 1,
-0.0389545, 0.9452685, -0.891404, 0, 1, 0.8666667, 1,
-0.03863885, 0.05322918, -0.3682177, 0, 1, 0.8745098, 1,
-0.03656843, -1.460267, -3.671464, 0, 1, 0.8784314, 1,
-0.03036863, -0.4179388, -2.430973, 0, 1, 0.8862745, 1,
-0.03011576, 1.555544, 1.123179, 0, 1, 0.8901961, 1,
-0.02708063, 1.346325, -0.8929309, 0, 1, 0.8980392, 1,
-0.02548963, 1.719109, 0.4405659, 0, 1, 0.9058824, 1,
-0.02048864, -0.3645166, -3.059633, 0, 1, 0.9098039, 1,
-0.02026237, -1.712366, -2.621627, 0, 1, 0.9176471, 1,
-0.01745309, -1.89345, -3.91199, 0, 1, 0.9215686, 1,
-0.01378853, 2.002538, -2.509682, 0, 1, 0.9294118, 1,
-0.00380126, 0.9671123, -0.5764149, 0, 1, 0.9333333, 1,
-0.001635629, 2.342468, 3.142296, 0, 1, 0.9411765, 1,
-0.001157744, 2.553239, -1.862669, 0, 1, 0.945098, 1,
0.003290498, 0.6373295, -0.668507, 0, 1, 0.9529412, 1,
0.004965647, 2.033169, -0.3996494, 0, 1, 0.9568627, 1,
0.005430888, -0.5395782, 3.255461, 0, 1, 0.9647059, 1,
0.009705967, -0.8748049, 3.300948, 0, 1, 0.9686275, 1,
0.01504464, -1.030618, 3.6601, 0, 1, 0.9764706, 1,
0.01670514, -1.435913, 2.12077, 0, 1, 0.9803922, 1,
0.01949274, -0.3505468, 3.506113, 0, 1, 0.9882353, 1,
0.01983614, -0.5096006, 5.372481, 0, 1, 0.9921569, 1,
0.02008398, -2.546602, 3.854696, 0, 1, 1, 1,
0.02064337, -0.2816567, 1.897114, 0, 0.9921569, 1, 1,
0.02857483, -0.8859105, 1.807861, 0, 0.9882353, 1, 1,
0.02878462, -0.7422909, 4.249794, 0, 0.9803922, 1, 1,
0.03068063, 1.238377, 0.1512773, 0, 0.9764706, 1, 1,
0.03087514, -0.1245863, 4.907618, 0, 0.9686275, 1, 1,
0.03220907, 0.3266998, 0.9465317, 0, 0.9647059, 1, 1,
0.03632901, -1.185126, 2.470306, 0, 0.9568627, 1, 1,
0.03780423, -0.9903765, 4.091885, 0, 0.9529412, 1, 1,
0.03962322, 1.666789, 0.1330679, 0, 0.945098, 1, 1,
0.04024513, 0.6056439, 1.434145, 0, 0.9411765, 1, 1,
0.04293075, -2.164337, 3.818319, 0, 0.9333333, 1, 1,
0.0429984, -0.02061801, 2.020735, 0, 0.9294118, 1, 1,
0.04382646, -1.253917, 2.806102, 0, 0.9215686, 1, 1,
0.04408598, -0.4432229, 3.172148, 0, 0.9176471, 1, 1,
0.04522397, 0.885878, 1.348373, 0, 0.9098039, 1, 1,
0.04870548, -0.2140631, 3.299968, 0, 0.9058824, 1, 1,
0.05320797, 0.5927634, 0.2958248, 0, 0.8980392, 1, 1,
0.05369493, 0.4809446, 0.6515608, 0, 0.8901961, 1, 1,
0.05377408, 0.3276363, -0.1446066, 0, 0.8862745, 1, 1,
0.0574378, -0.5582097, 4.65827, 0, 0.8784314, 1, 1,
0.06047523, 0.3223333, 2.171896, 0, 0.8745098, 1, 1,
0.06155528, 1.024333, 0.05772475, 0, 0.8666667, 1, 1,
0.06776933, 1.587621, -0.389692, 0, 0.8627451, 1, 1,
0.06832401, 0.05067785, 0.1086507, 0, 0.854902, 1, 1,
0.06986456, 0.5529184, 0.3578887, 0, 0.8509804, 1, 1,
0.07581812, 0.7773769, 0.1785766, 0, 0.8431373, 1, 1,
0.08732256, 1.097839, 2.930952, 0, 0.8392157, 1, 1,
0.08898529, -1.86269, 3.175663, 0, 0.8313726, 1, 1,
0.08984753, -0.7308629, 2.552409, 0, 0.827451, 1, 1,
0.09020267, 1.158364, 0.4707869, 0, 0.8196079, 1, 1,
0.09066971, -0.6416322, 1.250698, 0, 0.8156863, 1, 1,
0.09075663, -0.9552683, 4.372874, 0, 0.8078431, 1, 1,
0.09180637, 1.828541, -0.3716062, 0, 0.8039216, 1, 1,
0.0998705, -0.5645934, 3.856958, 0, 0.7960784, 1, 1,
0.1005044, 0.2939224, -0.02090156, 0, 0.7882353, 1, 1,
0.1016365, -1.082899, 3.365943, 0, 0.7843137, 1, 1,
0.1023416, 0.3894232, -0.3600392, 0, 0.7764706, 1, 1,
0.1037058, 0.5541126, 0.6759153, 0, 0.772549, 1, 1,
0.1050503, 1.459764, 0.7839993, 0, 0.7647059, 1, 1,
0.1072117, -1.425051, 2.669756, 0, 0.7607843, 1, 1,
0.110236, -2.884675, 5.057351, 0, 0.7529412, 1, 1,
0.112453, 0.8148605, 0.6117378, 0, 0.7490196, 1, 1,
0.1128364, -1.071215, 5.02554, 0, 0.7411765, 1, 1,
0.1158633, 0.4999159, 0.6000847, 0, 0.7372549, 1, 1,
0.1180774, 1.612734, -0.4354009, 0, 0.7294118, 1, 1,
0.1200631, -1.378887, 2.163751, 0, 0.7254902, 1, 1,
0.1200775, -2.00352, 2.903824, 0, 0.7176471, 1, 1,
0.1205124, -0.3361985, 3.292939, 0, 0.7137255, 1, 1,
0.1205959, 0.9101986, 0.4337657, 0, 0.7058824, 1, 1,
0.1267158, -0.4661671, 3.216046, 0, 0.6980392, 1, 1,
0.126991, -1.189817, 5.403725, 0, 0.6941177, 1, 1,
0.1302143, -0.8417472, 3.700492, 0, 0.6862745, 1, 1,
0.1316934, -0.5567856, 1.043942, 0, 0.682353, 1, 1,
0.134759, 1.000863, 0.3664773, 0, 0.6745098, 1, 1,
0.1354061, 0.4441051, -0.02935692, 0, 0.6705883, 1, 1,
0.1386604, -0.5271572, 3.683927, 0, 0.6627451, 1, 1,
0.1397326, 0.5190883, -0.736791, 0, 0.6588235, 1, 1,
0.1468118, -2.008618, 3.928595, 0, 0.6509804, 1, 1,
0.1476116, 1.20148, 2.065573, 0, 0.6470588, 1, 1,
0.1537675, -0.4110288, 1.26018, 0, 0.6392157, 1, 1,
0.1537722, 0.4734063, -0.6362945, 0, 0.6352941, 1, 1,
0.1576035, 1.588878, 0.2120914, 0, 0.627451, 1, 1,
0.1654824, 0.2104499, -1.074461, 0, 0.6235294, 1, 1,
0.1682291, -0.7119111, 2.144262, 0, 0.6156863, 1, 1,
0.1686108, 0.7859339, 0.5325142, 0, 0.6117647, 1, 1,
0.1711433, -1.296201, 3.31591, 0, 0.6039216, 1, 1,
0.1738117, 0.2617617, 2.717625, 0, 0.5960785, 1, 1,
0.1757736, -0.6746082, 2.808728, 0, 0.5921569, 1, 1,
0.1766779, -1.085659, 2.969643, 0, 0.5843138, 1, 1,
0.1842518, 0.3174058, 0.3797901, 0, 0.5803922, 1, 1,
0.1843012, 0.8076315, -0.1577925, 0, 0.572549, 1, 1,
0.1871, 0.008349392, 0.9366533, 0, 0.5686275, 1, 1,
0.1936608, 0.8383369, 0.831004, 0, 0.5607843, 1, 1,
0.1959766, 1.15512, -1.600057, 0, 0.5568628, 1, 1,
0.1963836, -0.3608018, 3.337459, 0, 0.5490196, 1, 1,
0.2041857, -1.159428, 3.963185, 0, 0.5450981, 1, 1,
0.2064939, 0.3726703, 0.2047009, 0, 0.5372549, 1, 1,
0.2072806, 0.8753592, -1.243255, 0, 0.5333334, 1, 1,
0.2093467, -0.4875504, 2.254999, 0, 0.5254902, 1, 1,
0.2128506, 0.1630768, -0.7744763, 0, 0.5215687, 1, 1,
0.2136626, -0.2789704, 2.922466, 0, 0.5137255, 1, 1,
0.2156228, 0.199411, 3.021616, 0, 0.509804, 1, 1,
0.2169603, 1.479558, -0.1675599, 0, 0.5019608, 1, 1,
0.219164, -0.1433511, 0.427757, 0, 0.4941176, 1, 1,
0.2205407, 1.729789, 2.355621, 0, 0.4901961, 1, 1,
0.2214806, -1.668252, 1.50294, 0, 0.4823529, 1, 1,
0.2272915, 1.893167, -0.2874817, 0, 0.4784314, 1, 1,
0.2278116, -1.518273, 2.508215, 0, 0.4705882, 1, 1,
0.2294947, -0.008161491, 2.483179, 0, 0.4666667, 1, 1,
0.2312939, -1.246289, 1.012744, 0, 0.4588235, 1, 1,
0.2346466, 0.6497581, 1.499774, 0, 0.454902, 1, 1,
0.236474, -0.4341171, 2.59647, 0, 0.4470588, 1, 1,
0.2374359, -0.2190316, 3.485441, 0, 0.4431373, 1, 1,
0.2426053, -3.216284, 2.035171, 0, 0.4352941, 1, 1,
0.243471, -1.501919, 2.709257, 0, 0.4313726, 1, 1,
0.2471983, -1.262343, 0.4390052, 0, 0.4235294, 1, 1,
0.2483261, 1.336885, 0.6697373, 0, 0.4196078, 1, 1,
0.2503077, 0.8051783, -0.7924105, 0, 0.4117647, 1, 1,
0.2536519, 0.2046954, 2.732766, 0, 0.4078431, 1, 1,
0.2565858, -1.054671, 4.183562, 0, 0.4, 1, 1,
0.2566298, 1.395347, 0.4059793, 0, 0.3921569, 1, 1,
0.2611063, 1.055912, 0.7360613, 0, 0.3882353, 1, 1,
0.2615619, 1.089272, -0.4837586, 0, 0.3803922, 1, 1,
0.2619923, -0.4055745, 2.741295, 0, 0.3764706, 1, 1,
0.2660537, -2.017862, 2.916703, 0, 0.3686275, 1, 1,
0.2662577, 0.4165369, -0.06992477, 0, 0.3647059, 1, 1,
0.2684681, 0.8861542, 1.698155, 0, 0.3568628, 1, 1,
0.2697729, 0.3112983, -1.574315, 0, 0.3529412, 1, 1,
0.2712866, -1.415404, 3.029362, 0, 0.345098, 1, 1,
0.2721, -1.721082, 1.164979, 0, 0.3411765, 1, 1,
0.2747761, -0.4380145, 2.153075, 0, 0.3333333, 1, 1,
0.2781488, -0.4833813, 3.839741, 0, 0.3294118, 1, 1,
0.2820725, -0.6014149, 4.058991, 0, 0.3215686, 1, 1,
0.2823758, 0.7860581, 0.4419179, 0, 0.3176471, 1, 1,
0.2842695, -1.224103, 1.665697, 0, 0.3098039, 1, 1,
0.2842781, -1.042624, 3.401545, 0, 0.3058824, 1, 1,
0.2851524, -0.6353975, 3.324623, 0, 0.2980392, 1, 1,
0.2853183, 0.4139364, -0.3640806, 0, 0.2901961, 1, 1,
0.2871586, 0.9956478, -0.06326389, 0, 0.2862745, 1, 1,
0.2875615, 0.6782848, -0.9894045, 0, 0.2784314, 1, 1,
0.2949582, 0.96677, -0.564868, 0, 0.2745098, 1, 1,
0.2949848, 0.03459739, 2.21423, 0, 0.2666667, 1, 1,
0.2967676, -0.3733565, 2.851808, 0, 0.2627451, 1, 1,
0.2972979, -0.4860868, 2.549341, 0, 0.254902, 1, 1,
0.2983945, -0.3656045, 3.690176, 0, 0.2509804, 1, 1,
0.306012, 1.350627, -1.190537, 0, 0.2431373, 1, 1,
0.3123118, 1.502088, 0.8351549, 0, 0.2392157, 1, 1,
0.3172822, 1.342185, -1.573798, 0, 0.2313726, 1, 1,
0.3174317, -0.2917112, 4.805848, 0, 0.227451, 1, 1,
0.3207325, 0.06763209, 2.03746, 0, 0.2196078, 1, 1,
0.3208854, -2.134815, 2.365741, 0, 0.2156863, 1, 1,
0.3217982, 1.438103, 1.422627, 0, 0.2078431, 1, 1,
0.3262368, -0.9489945, 2.079914, 0, 0.2039216, 1, 1,
0.3305459, 0.1342284, 0.8672405, 0, 0.1960784, 1, 1,
0.3310621, -1.029307, 1.105412, 0, 0.1882353, 1, 1,
0.331141, -0.01354586, 0.2260944, 0, 0.1843137, 1, 1,
0.3332216, 0.494174, -0.01910602, 0, 0.1764706, 1, 1,
0.3377915, 1.133057, 0.8419207, 0, 0.172549, 1, 1,
0.3388945, 1.741467, 0.5726993, 0, 0.1647059, 1, 1,
0.3395706, -1.957803, 2.258793, 0, 0.1607843, 1, 1,
0.3396642, 1.507773, 0.6546624, 0, 0.1529412, 1, 1,
0.3446633, 0.6074555, 0.8463036, 0, 0.1490196, 1, 1,
0.3532282, 0.4512887, 0.1914372, 0, 0.1411765, 1, 1,
0.3533641, -0.5176312, 1.453315, 0, 0.1372549, 1, 1,
0.3539128, 0.2999569, -1.015073, 0, 0.1294118, 1, 1,
0.3648211, -0.02984063, 1.462451, 0, 0.1254902, 1, 1,
0.3706602, -1.727005, 2.190527, 0, 0.1176471, 1, 1,
0.3815208, -1.140875, 3.860938, 0, 0.1137255, 1, 1,
0.3816054, -1.969353, 3.442405, 0, 0.1058824, 1, 1,
0.3843219, 1.83789, 0.4840582, 0, 0.09803922, 1, 1,
0.3912952, -1.181034, 2.339672, 0, 0.09411765, 1, 1,
0.3954246, 0.002494074, 1.810758, 0, 0.08627451, 1, 1,
0.3968484, 0.2206143, 1.145979, 0, 0.08235294, 1, 1,
0.3986228, 1.219864, 1.153033, 0, 0.07450981, 1, 1,
0.4002823, -1.384044, 1.246398, 0, 0.07058824, 1, 1,
0.4008994, -0.3925339, 3.447568, 0, 0.0627451, 1, 1,
0.401085, 0.3239935, 2.43642, 0, 0.05882353, 1, 1,
0.4023175, -0.7442107, 2.285248, 0, 0.05098039, 1, 1,
0.4034855, 0.3154661, 2.10405, 0, 0.04705882, 1, 1,
0.4114773, 0.2892538, 1.631855, 0, 0.03921569, 1, 1,
0.4138904, 0.0689678, 0.8868138, 0, 0.03529412, 1, 1,
0.4187263, -0.453451, 2.160673, 0, 0.02745098, 1, 1,
0.4189193, -0.8146277, 4.077801, 0, 0.02352941, 1, 1,
0.4220802, -1.305369, 3.8719, 0, 0.01568628, 1, 1,
0.4234921, -1.37129, 2.904727, 0, 0.01176471, 1, 1,
0.4285715, 0.4924641, 0.1612333, 0, 0.003921569, 1, 1,
0.4333068, -0.371257, 2.455548, 0.003921569, 0, 1, 1,
0.4375908, 0.2469963, 0.5973855, 0.007843138, 0, 1, 1,
0.4446812, -1.481196, 2.482328, 0.01568628, 0, 1, 1,
0.445193, -0.3248287, 1.68885, 0.01960784, 0, 1, 1,
0.4488778, 0.4324367, -0.9736027, 0.02745098, 0, 1, 1,
0.4497855, 0.249855, 0.5875446, 0.03137255, 0, 1, 1,
0.4557399, 0.6667558, 0.8093039, 0.03921569, 0, 1, 1,
0.4614723, -0.7095336, 0.1644656, 0.04313726, 0, 1, 1,
0.4713641, 0.4834172, 0.08393493, 0.05098039, 0, 1, 1,
0.4722537, 0.4491247, 1.000086, 0.05490196, 0, 1, 1,
0.4731164, -2.802836, 3.700583, 0.0627451, 0, 1, 1,
0.4741917, 1.354285, 0.2781097, 0.06666667, 0, 1, 1,
0.4756223, -0.3326695, 2.960762, 0.07450981, 0, 1, 1,
0.4764498, -0.008956103, 0.4620968, 0.07843138, 0, 1, 1,
0.4768312, 0.7224453, 1.340513, 0.08627451, 0, 1, 1,
0.4777975, 0.6561254, 0.6822517, 0.09019608, 0, 1, 1,
0.4779135, 0.004963872, 1.988347, 0.09803922, 0, 1, 1,
0.4796019, 1.30751, -0.782595, 0.1058824, 0, 1, 1,
0.4802065, 1.073449, 1.903792, 0.1098039, 0, 1, 1,
0.4810715, 0.4993865, 2.658387, 0.1176471, 0, 1, 1,
0.481722, 0.7771636, 0.7820686, 0.1215686, 0, 1, 1,
0.48177, 1.611447, -0.3313427, 0.1294118, 0, 1, 1,
0.4835227, 1.003008, 0.3420193, 0.1333333, 0, 1, 1,
0.4846372, 0.2458068, 0.09115812, 0.1411765, 0, 1, 1,
0.4852926, -0.3686343, 0.2350859, 0.145098, 0, 1, 1,
0.4899003, -0.7235764, 2.411745, 0.1529412, 0, 1, 1,
0.4915133, 1.143215, 0.01879181, 0.1568628, 0, 1, 1,
0.4937342, -0.6024413, 3.283717, 0.1647059, 0, 1, 1,
0.4985473, 0.2919493, 1.289451, 0.1686275, 0, 1, 1,
0.4988074, 0.2628922, 0.7716982, 0.1764706, 0, 1, 1,
0.4992048, -0.110305, 1.918646, 0.1803922, 0, 1, 1,
0.5042607, 1.559355, -1.211514, 0.1882353, 0, 1, 1,
0.5057155, -0.350796, 2.19996, 0.1921569, 0, 1, 1,
0.506424, -1.680991, 3.148828, 0.2, 0, 1, 1,
0.5065529, -0.1220856, 3.649479, 0.2078431, 0, 1, 1,
0.5066884, 0.2700856, 0.5848506, 0.2117647, 0, 1, 1,
0.5114021, 0.8268504, 0.1179768, 0.2196078, 0, 1, 1,
0.5184645, -0.06695429, 2.443931, 0.2235294, 0, 1, 1,
0.522381, 0.4151746, 1.319533, 0.2313726, 0, 1, 1,
0.5246202, 0.4393291, 1.359743, 0.2352941, 0, 1, 1,
0.5283864, 0.5362442, 0.6885286, 0.2431373, 0, 1, 1,
0.5299991, -1.375382, 3.227339, 0.2470588, 0, 1, 1,
0.5346978, -0.8413256, 2.491776, 0.254902, 0, 1, 1,
0.5378726, -0.5164762, 2.689547, 0.2588235, 0, 1, 1,
0.539335, 0.4820899, 0.7623334, 0.2666667, 0, 1, 1,
0.5398763, -0.6381248, 1.023401, 0.2705882, 0, 1, 1,
0.5418577, -0.611315, 2.079242, 0.2784314, 0, 1, 1,
0.5424104, 2.172604, 0.9183713, 0.282353, 0, 1, 1,
0.5513968, -1.452545, 4.485958, 0.2901961, 0, 1, 1,
0.5526643, -1.336945, 2.248192, 0.2941177, 0, 1, 1,
0.554981, 0.01897221, 1.645073, 0.3019608, 0, 1, 1,
0.5577466, 0.969774, -0.5939642, 0.3098039, 0, 1, 1,
0.5610477, 1.543359, 0.488925, 0.3137255, 0, 1, 1,
0.563686, 0.5118616, 1.289821, 0.3215686, 0, 1, 1,
0.5652515, 0.4144307, 2.206462, 0.3254902, 0, 1, 1,
0.5719116, 1.398246, 0.4744672, 0.3333333, 0, 1, 1,
0.577247, -0.3489468, -0.5510109, 0.3372549, 0, 1, 1,
0.5793984, -1.233868, 1.88948, 0.345098, 0, 1, 1,
0.5796482, -0.3041267, 2.406396, 0.3490196, 0, 1, 1,
0.5804692, -1.150519, 2.053493, 0.3568628, 0, 1, 1,
0.5821502, 1.87005, -0.6599473, 0.3607843, 0, 1, 1,
0.5822259, 0.2350753, 1.127501, 0.3686275, 0, 1, 1,
0.5831745, -0.01921296, 2.039493, 0.372549, 0, 1, 1,
0.5838642, -0.6878104, 3.661937, 0.3803922, 0, 1, 1,
0.5854, 2.361145, -0.386141, 0.3843137, 0, 1, 1,
0.5933617, 0.511662, 0.8178563, 0.3921569, 0, 1, 1,
0.5962992, 0.3117245, 0.334253, 0.3960784, 0, 1, 1,
0.5987737, -1.534536, 4.650709, 0.4039216, 0, 1, 1,
0.5996432, 0.3992598, 1.281566, 0.4117647, 0, 1, 1,
0.599907, 0.9997658, 0.1531793, 0.4156863, 0, 1, 1,
0.602139, 1.23154, 1.071118, 0.4235294, 0, 1, 1,
0.6034297, -1.129956, 2.76239, 0.427451, 0, 1, 1,
0.6175519, -0.06735113, 3.811921, 0.4352941, 0, 1, 1,
0.6176009, -0.1982309, 2.370202, 0.4392157, 0, 1, 1,
0.6239289, 0.3895766, 1.015557, 0.4470588, 0, 1, 1,
0.6261349, 0.1367479, 1.425919, 0.4509804, 0, 1, 1,
0.6295884, -1.049556, 1.849979, 0.4588235, 0, 1, 1,
0.6301605, 1.64045, -0.1353168, 0.4627451, 0, 1, 1,
0.6335583, 2.06924, 0.7879562, 0.4705882, 0, 1, 1,
0.6357189, 0.864292, 0.1892501, 0.4745098, 0, 1, 1,
0.6372697, 1.008821, 1.859082, 0.4823529, 0, 1, 1,
0.6374549, 0.03857659, 1.122574, 0.4862745, 0, 1, 1,
0.6420851, -0.003117258, 2.594465, 0.4941176, 0, 1, 1,
0.6432877, 0.8939828, -0.09375565, 0.5019608, 0, 1, 1,
0.6437141, -1.900683, 3.546452, 0.5058824, 0, 1, 1,
0.6451406, 1.747898, 0.1393744, 0.5137255, 0, 1, 1,
0.6463249, 1.731164, 0.02329359, 0.5176471, 0, 1, 1,
0.6511745, 1.654076, 0.1718082, 0.5254902, 0, 1, 1,
0.6538591, 1.532405, -0.1618308, 0.5294118, 0, 1, 1,
0.6550005, -0.03179772, 1.869224, 0.5372549, 0, 1, 1,
0.6555134, -0.262683, 2.342902, 0.5411765, 0, 1, 1,
0.664847, 0.1322239, 0.4828597, 0.5490196, 0, 1, 1,
0.6716084, 0.7672814, -0.1378508, 0.5529412, 0, 1, 1,
0.6726801, 1.809475, 0.3043503, 0.5607843, 0, 1, 1,
0.6731743, -0.7345233, 1.925324, 0.5647059, 0, 1, 1,
0.6835727, 0.02593817, 0.9538915, 0.572549, 0, 1, 1,
0.6845728, 1.050296, -0.2893378, 0.5764706, 0, 1, 1,
0.6880704, -0.2121976, 1.224032, 0.5843138, 0, 1, 1,
0.6885415, 0.4952828, -0.01322043, 0.5882353, 0, 1, 1,
0.6971647, -1.017233, 1.300865, 0.5960785, 0, 1, 1,
0.6994332, 0.4667749, -0.420512, 0.6039216, 0, 1, 1,
0.7004172, 0.3373424, 2.7218, 0.6078432, 0, 1, 1,
0.7037052, -0.3717276, 2.87478, 0.6156863, 0, 1, 1,
0.7100316, 0.09081104, 0.1718227, 0.6196079, 0, 1, 1,
0.7112641, -0.2198425, 1.188599, 0.627451, 0, 1, 1,
0.7159994, 0.8145354, -0.8426764, 0.6313726, 0, 1, 1,
0.7170856, 0.238615, 0.6087763, 0.6392157, 0, 1, 1,
0.7192534, -0.4608658, 2.202139, 0.6431373, 0, 1, 1,
0.7212086, 0.9711334, 1.249301, 0.6509804, 0, 1, 1,
0.7249734, 0.3087113, 0.3321779, 0.654902, 0, 1, 1,
0.7254341, 0.236008, 0.6684052, 0.6627451, 0, 1, 1,
0.7256177, -0.6858963, -0.8746092, 0.6666667, 0, 1, 1,
0.7321558, 0.0419676, 1.148108, 0.6745098, 0, 1, 1,
0.7322385, 0.04358583, 1.320958, 0.6784314, 0, 1, 1,
0.7335979, -0.04603504, 1.227022, 0.6862745, 0, 1, 1,
0.7342068, 0.1756445, 3.189323, 0.6901961, 0, 1, 1,
0.7348016, 0.0416127, 2.445514, 0.6980392, 0, 1, 1,
0.7352032, -1.366277, 2.373373, 0.7058824, 0, 1, 1,
0.7406307, 1.521013, 1.202798, 0.7098039, 0, 1, 1,
0.7425042, 1.06901, 0.6343712, 0.7176471, 0, 1, 1,
0.7432028, -0.6661223, 1.999149, 0.7215686, 0, 1, 1,
0.7469969, -1.080633, 0.9887626, 0.7294118, 0, 1, 1,
0.7510673, -0.3244833, 1.916512, 0.7333333, 0, 1, 1,
0.7535715, -0.4387627, 0.5958196, 0.7411765, 0, 1, 1,
0.7587028, -0.2406397, 0.5482039, 0.7450981, 0, 1, 1,
0.7628722, 1.655125, 2.598897, 0.7529412, 0, 1, 1,
0.7688105, 0.04963732, 1.476958, 0.7568628, 0, 1, 1,
0.7717674, 0.2290383, 1.670264, 0.7647059, 0, 1, 1,
0.7723665, 1.306733, -0.1806877, 0.7686275, 0, 1, 1,
0.7778126, -0.5452904, 2.814751, 0.7764706, 0, 1, 1,
0.7794662, -1.118244, 3.50856, 0.7803922, 0, 1, 1,
0.7852173, 0.2261988, 0.3050624, 0.7882353, 0, 1, 1,
0.7897882, 1.078593, 0.8261505, 0.7921569, 0, 1, 1,
0.7905636, 0.2231096, 1.823604, 0.8, 0, 1, 1,
0.7921468, 0.7331175, 0.007078073, 0.8078431, 0, 1, 1,
0.7950771, 0.1912458, 3.173625, 0.8117647, 0, 1, 1,
0.800602, -0.9461509, 2.246893, 0.8196079, 0, 1, 1,
0.8051174, -0.4247408, 2.938101, 0.8235294, 0, 1, 1,
0.805775, 0.7887474, 0.849584, 0.8313726, 0, 1, 1,
0.8109311, 0.03288994, -1.04429, 0.8352941, 0, 1, 1,
0.8129608, -0.6262386, 3.083597, 0.8431373, 0, 1, 1,
0.828809, -1.420598, 4.418207, 0.8470588, 0, 1, 1,
0.8317127, -1.617387, 2.388882, 0.854902, 0, 1, 1,
0.8404225, -0.4172208, 2.297678, 0.8588235, 0, 1, 1,
0.8427228, -0.004018137, 2.024537, 0.8666667, 0, 1, 1,
0.8453422, -0.5408896, 3.39706, 0.8705882, 0, 1, 1,
0.8458425, -1.309304, 2.463467, 0.8784314, 0, 1, 1,
0.8565745, 1.229762, 1.51358, 0.8823529, 0, 1, 1,
0.8569525, 0.3565128, -0.0465575, 0.8901961, 0, 1, 1,
0.8593041, -1.842861, 2.003233, 0.8941177, 0, 1, 1,
0.8654302, 1.312939, 1.768196, 0.9019608, 0, 1, 1,
0.8697017, -1.960705, 1.178009, 0.9098039, 0, 1, 1,
0.8697748, -0.7114584, 2.07724, 0.9137255, 0, 1, 1,
0.871264, 0.3663146, 1.4811, 0.9215686, 0, 1, 1,
0.8819131, -0.2031, 2.623269, 0.9254902, 0, 1, 1,
0.8820947, -0.3440251, 0.1810616, 0.9333333, 0, 1, 1,
0.8825533, 1.271742, -1.038629, 0.9372549, 0, 1, 1,
0.8837738, -0.8873239, 1.397693, 0.945098, 0, 1, 1,
0.8851076, 0.3370936, 1.074861, 0.9490196, 0, 1, 1,
0.8879318, 0.7791184, -0.8052714, 0.9568627, 0, 1, 1,
0.8910177, -0.9632967, 3.211279, 0.9607843, 0, 1, 1,
0.8911058, 1.143116, 0.02800747, 0.9686275, 0, 1, 1,
0.8911853, 0.4937098, 0.5403426, 0.972549, 0, 1, 1,
0.8972321, 1.110088, 0.9797305, 0.9803922, 0, 1, 1,
0.8987167, 0.8996747, 1.021859, 0.9843137, 0, 1, 1,
0.9028739, -0.9418446, 1.885784, 0.9921569, 0, 1, 1,
0.9052485, -1.552301, 3.335374, 0.9960784, 0, 1, 1,
0.9088194, 0.9644474, -0.8682919, 1, 0, 0.9960784, 1,
0.9158061, -0.3918497, 2.317273, 1, 0, 0.9882353, 1,
0.9161313, -1.763043, 1.116839, 1, 0, 0.9843137, 1,
0.9228765, -0.3533475, 2.532525, 1, 0, 0.9764706, 1,
0.9238541, -0.2348772, 1.162926, 1, 0, 0.972549, 1,
0.9252697, 0.3867343, 1.414945, 1, 0, 0.9647059, 1,
0.9254621, -2.419409, 3.113359, 1, 0, 0.9607843, 1,
0.9331304, 1.081715, -0.4801535, 1, 0, 0.9529412, 1,
0.9339997, -1.138575, 3.016059, 1, 0, 0.9490196, 1,
0.9350612, 0.3112574, -0.1664108, 1, 0, 0.9411765, 1,
0.9448329, 0.03876831, 1.635707, 1, 0, 0.9372549, 1,
0.9493787, 0.7677771, 0.2217839, 1, 0, 0.9294118, 1,
0.949426, 1.793891, 0.09806654, 1, 0, 0.9254902, 1,
0.9502837, -0.7284283, 1.644149, 1, 0, 0.9176471, 1,
0.9525674, -1.592696, 3.747168, 1, 0, 0.9137255, 1,
0.9653381, 0.3615648, 0.4467892, 1, 0, 0.9058824, 1,
0.9776587, 0.8870759, 1.00528, 1, 0, 0.9019608, 1,
0.9781417, 0.1387966, -0.2669926, 1, 0, 0.8941177, 1,
0.9791368, 0.7834638, 1.360643, 1, 0, 0.8862745, 1,
0.986654, 0.06246909, 1.282503, 1, 0, 0.8823529, 1,
0.9887613, 1.71769, 1.960177, 1, 0, 0.8745098, 1,
0.9947402, 0.2527547, 1.008187, 1, 0, 0.8705882, 1,
1.006474, 2.125363, -0.5465729, 1, 0, 0.8627451, 1,
1.006952, -0.9535346, 3.5224, 1, 0, 0.8588235, 1,
1.008852, 2.337471, 2.172966, 1, 0, 0.8509804, 1,
1.008966, -0.2527611, 2.730208, 1, 0, 0.8470588, 1,
1.009625, -1.056914, 3.351717, 1, 0, 0.8392157, 1,
1.0117, -0.08470114, 1.113046, 1, 0, 0.8352941, 1,
1.015386, -1.345457, 4.075487, 1, 0, 0.827451, 1,
1.021702, -0.4672357, 1.74178, 1, 0, 0.8235294, 1,
1.022594, -0.6862904, 2.463601, 1, 0, 0.8156863, 1,
1.025471, -0.6886098, 2.324566, 1, 0, 0.8117647, 1,
1.031258, -1.56159, 3.075103, 1, 0, 0.8039216, 1,
1.034536, -0.3166145, 1.779664, 1, 0, 0.7960784, 1,
1.035844, 0.4348053, 1.104941, 1, 0, 0.7921569, 1,
1.039069, 0.8898137, 1.185257, 1, 0, 0.7843137, 1,
1.041037, 1.067171, 0.4940005, 1, 0, 0.7803922, 1,
1.044478, -0.9220848, 4.562598, 1, 0, 0.772549, 1,
1.047603, 0.3363391, 2.236816, 1, 0, 0.7686275, 1,
1.053217, 1.176957, 0.6318598, 1, 0, 0.7607843, 1,
1.056489, -0.8479378, 2.173086, 1, 0, 0.7568628, 1,
1.056754, -2.078192, 3.411956, 1, 0, 0.7490196, 1,
1.059543, 1.364908, 0.5064685, 1, 0, 0.7450981, 1,
1.06163, 0.9529584, 0.6246986, 1, 0, 0.7372549, 1,
1.061841, 0.2592476, 0.3960973, 1, 0, 0.7333333, 1,
1.076002, -1.017719, 3.130839, 1, 0, 0.7254902, 1,
1.079084, 0.1760608, 2.008888, 1, 0, 0.7215686, 1,
1.079205, -0.3201165, -0.03937329, 1, 0, 0.7137255, 1,
1.07982, 1.304182, 1.602646, 1, 0, 0.7098039, 1,
1.102362, 0.3802915, 1.857623, 1, 0, 0.7019608, 1,
1.103285, 0.511709, 3.532677, 1, 0, 0.6941177, 1,
1.10824, -0.7397001, 1.067642, 1, 0, 0.6901961, 1,
1.111763, 1.503459, -0.0121962, 1, 0, 0.682353, 1,
1.11606, -1.600929, 3.589533, 1, 0, 0.6784314, 1,
1.124229, 1.398001, 0.4670215, 1, 0, 0.6705883, 1,
1.126146, 0.1518203, 1.898433, 1, 0, 0.6666667, 1,
1.127164, 0.606881, 1.008395, 1, 0, 0.6588235, 1,
1.128884, 0.09395423, -0.1956777, 1, 0, 0.654902, 1,
1.142768, 0.9126391, 0.2274992, 1, 0, 0.6470588, 1,
1.159728, 0.2551113, 2.352073, 1, 0, 0.6431373, 1,
1.169363, 0.4314689, 3.255126, 1, 0, 0.6352941, 1,
1.179039, -0.6996957, 0.6879387, 1, 0, 0.6313726, 1,
1.18316, 0.5778373, 0.2574109, 1, 0, 0.6235294, 1,
1.195722, 2.093806, 1.526313, 1, 0, 0.6196079, 1,
1.199408, 1.667146, 0.8590252, 1, 0, 0.6117647, 1,
1.20415, 0.02347064, 2.785206, 1, 0, 0.6078432, 1,
1.208609, 0.5225647, -1.342201, 1, 0, 0.6, 1,
1.22512, 1.571675, 0.9455158, 1, 0, 0.5921569, 1,
1.225457, -0.41034, 4.270429, 1, 0, 0.5882353, 1,
1.233152, 0.7697666, -0.3400931, 1, 0, 0.5803922, 1,
1.238131, -0.6271086, 2.915561, 1, 0, 0.5764706, 1,
1.23894, 1.3624, 0.4891351, 1, 0, 0.5686275, 1,
1.24131, -0.7604833, 1.451457, 1, 0, 0.5647059, 1,
1.24489, -0.8201339, 3.059558, 1, 0, 0.5568628, 1,
1.25672, 1.377286, -0.04074711, 1, 0, 0.5529412, 1,
1.292814, -0.5138204, -1.509567, 1, 0, 0.5450981, 1,
1.295666, -0.3972538, 2.594064, 1, 0, 0.5411765, 1,
1.296988, 2.069405, 0.3962974, 1, 0, 0.5333334, 1,
1.301695, -1.863696, 2.546964, 1, 0, 0.5294118, 1,
1.306588, -0.9926504, 3.208626, 1, 0, 0.5215687, 1,
1.311971, 0.4429564, 0.1024501, 1, 0, 0.5176471, 1,
1.313472, -1.592312, 3.22509, 1, 0, 0.509804, 1,
1.322959, 0.9489932, 0.7652457, 1, 0, 0.5058824, 1,
1.332906, -0.7231585, 1.447541, 1, 0, 0.4980392, 1,
1.334869, -0.6893963, 2.120481, 1, 0, 0.4901961, 1,
1.337682, -1.684375, 1.356221, 1, 0, 0.4862745, 1,
1.337802, 0.7877874, -0.5313309, 1, 0, 0.4784314, 1,
1.354922, 0.2288183, 3.055032, 1, 0, 0.4745098, 1,
1.36069, -1.414202, 3.685934, 1, 0, 0.4666667, 1,
1.372677, -1.13784, 2.2996, 1, 0, 0.4627451, 1,
1.37281, 1.222045, 1.277569, 1, 0, 0.454902, 1,
1.372977, -1.854978, 2.257723, 1, 0, 0.4509804, 1,
1.39121, -0.5528172, 1.32574, 1, 0, 0.4431373, 1,
1.391593, 0.5559912, 1.380154, 1, 0, 0.4392157, 1,
1.394228, -0.1972327, 0.7920293, 1, 0, 0.4313726, 1,
1.40808, 0.2653349, 0.3458202, 1, 0, 0.427451, 1,
1.411605, -0.6421474, 0.1321628, 1, 0, 0.4196078, 1,
1.412343, 0.7219405, -0.161904, 1, 0, 0.4156863, 1,
1.417448, -2.245865, 3.066161, 1, 0, 0.4078431, 1,
1.420507, 0.8038626, 0.9801531, 1, 0, 0.4039216, 1,
1.452666, -1.375876, 2.706414, 1, 0, 0.3960784, 1,
1.452762, 0.1483472, 1.175527, 1, 0, 0.3882353, 1,
1.471496, 1.256007, -0.4728397, 1, 0, 0.3843137, 1,
1.47797, -0.4368575, 3.708385, 1, 0, 0.3764706, 1,
1.487298, -0.03210959, 3.224104, 1, 0, 0.372549, 1,
1.489164, 1.390768, 0.1677756, 1, 0, 0.3647059, 1,
1.492349, 0.09832895, 1.20085, 1, 0, 0.3607843, 1,
1.493761, -1.046492, 2.254801, 1, 0, 0.3529412, 1,
1.497507, -0.140394, 2.987018, 1, 0, 0.3490196, 1,
1.508353, 0.02973678, 2.611807, 1, 0, 0.3411765, 1,
1.510364, 1.550949, 0.2340411, 1, 0, 0.3372549, 1,
1.511572, 0.3385498, 0.6364504, 1, 0, 0.3294118, 1,
1.529123, -1.046094, 3.026167, 1, 0, 0.3254902, 1,
1.549656, -2.052135, 3.568251, 1, 0, 0.3176471, 1,
1.552162, 1.633122, 0.9867812, 1, 0, 0.3137255, 1,
1.577721, -0.2907625, 2.548364, 1, 0, 0.3058824, 1,
1.601659, -0.7626139, 3.070054, 1, 0, 0.2980392, 1,
1.618592, 2.022954, -2.10264, 1, 0, 0.2941177, 1,
1.618619, -1.273909, 2.696015, 1, 0, 0.2862745, 1,
1.633258, -0.5284035, 3.501722, 1, 0, 0.282353, 1,
1.638345, 0.07634582, 1.689423, 1, 0, 0.2745098, 1,
1.655603, 0.3271416, 1.804709, 1, 0, 0.2705882, 1,
1.667247, 1.527561, 0.6010461, 1, 0, 0.2627451, 1,
1.66793, 0.006837442, 0.5203283, 1, 0, 0.2588235, 1,
1.671197, -0.2371341, 3.426991, 1, 0, 0.2509804, 1,
1.696172, -0.1031775, 0.09505041, 1, 0, 0.2470588, 1,
1.697855, -1.322096, 1.829795, 1, 0, 0.2392157, 1,
1.708225, -1.192092, 1.968446, 1, 0, 0.2352941, 1,
1.710001, -1.706563, 4.728148, 1, 0, 0.227451, 1,
1.717784, 0.5727641, 0.5762406, 1, 0, 0.2235294, 1,
1.725491, -0.5350527, 1.330492, 1, 0, 0.2156863, 1,
1.730956, 0.5766959, 1.450554, 1, 0, 0.2117647, 1,
1.760899, -1.091163, 2.250952, 1, 0, 0.2039216, 1,
1.761802, -0.440576, 2.430694, 1, 0, 0.1960784, 1,
1.768578, 0.4141789, -0.7351124, 1, 0, 0.1921569, 1,
1.77902, 0.4529333, 1.69643, 1, 0, 0.1843137, 1,
1.787217, 1.918743, -0.2024287, 1, 0, 0.1803922, 1,
1.795059, 1.532763, 2.07672, 1, 0, 0.172549, 1,
1.817532, -1.949962, 1.091088, 1, 0, 0.1686275, 1,
1.823955, -0.1196126, 2.298657, 1, 0, 0.1607843, 1,
1.829962, -0.135447, 0.4057364, 1, 0, 0.1568628, 1,
1.831429, -0.4862621, 1.098277, 1, 0, 0.1490196, 1,
1.832251, 1.80439, 1.159643, 1, 0, 0.145098, 1,
1.834872, 0.5303791, 1.843753, 1, 0, 0.1372549, 1,
1.845678, -0.9932323, 1.380167, 1, 0, 0.1333333, 1,
1.849236, -0.8068205, 1.338274, 1, 0, 0.1254902, 1,
1.855822, -0.527918, 2.789602, 1, 0, 0.1215686, 1,
1.88696, -0.6257479, 1.593303, 1, 0, 0.1137255, 1,
1.907071, -1.55773, 4.09894, 1, 0, 0.1098039, 1,
1.913293, -1.228232, 4.315483, 1, 0, 0.1019608, 1,
1.925696, -1.141429, 1.255342, 1, 0, 0.09411765, 1,
2.002819, -0.4943879, -0.7061632, 1, 0, 0.09019608, 1,
2.015548, -1.509094, 2.940908, 1, 0, 0.08235294, 1,
2.019729, 0.08372754, 2.481929, 1, 0, 0.07843138, 1,
2.031011, -0.4807627, 1.726508, 1, 0, 0.07058824, 1,
2.041062, -1.612322, 2.889395, 1, 0, 0.06666667, 1,
2.051395, 0.4758208, -0.8507248, 1, 0, 0.05882353, 1,
2.120177, -1.481194, -0.2940737, 1, 0, 0.05490196, 1,
2.154275, -0.4813897, 1.523091, 1, 0, 0.04705882, 1,
2.305923, 1.397333, -0.7717884, 1, 0, 0.04313726, 1,
2.306622, -1.239635, 2.147737, 1, 0, 0.03529412, 1,
2.403222, -2.509418, 3.188156, 1, 0, 0.03137255, 1,
2.640671, 0.5614095, -0.1438602, 1, 0, 0.02352941, 1,
2.680305, -0.2407521, 4.263536, 1, 0, 0.01960784, 1,
2.692387, 0.3178055, 2.786436, 1, 0, 0.01176471, 1,
2.749603, 0.6208541, -0.2323511, 1, 0, 0.007843138, 1
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
-0.2369639, -4.20519, -7.599595, 0, -0.5, 0.5, 0.5,
-0.2369639, -4.20519, -7.599595, 1, -0.5, 0.5, 0.5,
-0.2369639, -4.20519, -7.599595, 1, 1.5, 0.5, 0.5,
-0.2369639, -4.20519, -7.599595, 0, 1.5, 0.5, 0.5
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
-4.235976, -0.2991575, -7.599595, 0, -0.5, 0.5, 0.5,
-4.235976, -0.2991575, -7.599595, 1, -0.5, 0.5, 0.5,
-4.235976, -0.2991575, -7.599595, 1, 1.5, 0.5, 0.5,
-4.235976, -0.2991575, -7.599595, 0, 1.5, 0.5, 0.5
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
-4.235976, -4.20519, -0.1556253, 0, -0.5, 0.5, 0.5,
-4.235976, -4.20519, -0.1556253, 1, -0.5, 0.5, 0.5,
-4.235976, -4.20519, -0.1556253, 1, 1.5, 0.5, 0.5,
-4.235976, -4.20519, -0.1556253, 0, 1.5, 0.5, 0.5
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
-3, -3.303797, -5.881756,
2, -3.303797, -5.881756,
-3, -3.303797, -5.881756,
-3, -3.45403, -6.168062,
-2, -3.303797, -5.881756,
-2, -3.45403, -6.168062,
-1, -3.303797, -5.881756,
-1, -3.45403, -6.168062,
0, -3.303797, -5.881756,
0, -3.45403, -6.168062,
1, -3.303797, -5.881756,
1, -3.45403, -6.168062,
2, -3.303797, -5.881756,
2, -3.45403, -6.168062
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
-3, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
-3, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
-3, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
-3, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5,
-2, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
-2, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
-2, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
-2, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5,
-1, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
-1, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
-1, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
-1, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5,
0, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
0, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
0, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
0, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5,
1, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
1, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
1, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
1, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5,
2, -3.754494, -6.740675, 0, -0.5, 0.5, 0.5,
2, -3.754494, -6.740675, 1, -0.5, 0.5, 0.5,
2, -3.754494, -6.740675, 1, 1.5, 0.5, 0.5,
2, -3.754494, -6.740675, 0, 1.5, 0.5, 0.5
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
-3.313127, -3, -5.881756,
-3.313127, 2, -5.881756,
-3.313127, -3, -5.881756,
-3.466935, -3, -6.168062,
-3.313127, -2, -5.881756,
-3.466935, -2, -6.168062,
-3.313127, -1, -5.881756,
-3.466935, -1, -6.168062,
-3.313127, 0, -5.881756,
-3.466935, 0, -6.168062,
-3.313127, 1, -5.881756,
-3.466935, 1, -6.168062,
-3.313127, 2, -5.881756,
-3.466935, 2, -6.168062
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
-3.774552, -3, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, -3, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, -3, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, -3, -6.740675, 0, 1.5, 0.5, 0.5,
-3.774552, -2, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, -2, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, -2, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, -2, -6.740675, 0, 1.5, 0.5, 0.5,
-3.774552, -1, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, -1, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, -1, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, -1, -6.740675, 0, 1.5, 0.5, 0.5,
-3.774552, 0, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, 0, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, 0, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, 0, -6.740675, 0, 1.5, 0.5, 0.5,
-3.774552, 1, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, 1, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, 1, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, 1, -6.740675, 0, 1.5, 0.5, 0.5,
-3.774552, 2, -6.740675, 0, -0.5, 0.5, 0.5,
-3.774552, 2, -6.740675, 1, -0.5, 0.5, 0.5,
-3.774552, 2, -6.740675, 1, 1.5, 0.5, 0.5,
-3.774552, 2, -6.740675, 0, 1.5, 0.5, 0.5
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
-3.313127, -3.303797, -4,
-3.313127, -3.303797, 4,
-3.313127, -3.303797, -4,
-3.466935, -3.45403, -4,
-3.313127, -3.303797, -2,
-3.466935, -3.45403, -2,
-3.313127, -3.303797, 0,
-3.466935, -3.45403, 0,
-3.313127, -3.303797, 2,
-3.466935, -3.45403, 2,
-3.313127, -3.303797, 4,
-3.466935, -3.45403, 4
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
-3.774552, -3.754494, -4, 0, -0.5, 0.5, 0.5,
-3.774552, -3.754494, -4, 1, -0.5, 0.5, 0.5,
-3.774552, -3.754494, -4, 1, 1.5, 0.5, 0.5,
-3.774552, -3.754494, -4, 0, 1.5, 0.5, 0.5,
-3.774552, -3.754494, -2, 0, -0.5, 0.5, 0.5,
-3.774552, -3.754494, -2, 1, -0.5, 0.5, 0.5,
-3.774552, -3.754494, -2, 1, 1.5, 0.5, 0.5,
-3.774552, -3.754494, -2, 0, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 0, 0, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 0, 1, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 0, 1, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 0, 0, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 2, 0, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 2, 1, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 2, 1, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 2, 0, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 4, 0, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 4, 1, -0.5, 0.5, 0.5,
-3.774552, -3.754494, 4, 1, 1.5, 0.5, 0.5,
-3.774552, -3.754494, 4, 0, 1.5, 0.5, 0.5
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
-3.313127, -3.303797, -5.881756,
-3.313127, 2.705482, -5.881756,
-3.313127, -3.303797, 5.570505,
-3.313127, 2.705482, 5.570505,
-3.313127, -3.303797, -5.881756,
-3.313127, -3.303797, 5.570505,
-3.313127, 2.705482, -5.881756,
-3.313127, 2.705482, 5.570505,
-3.313127, -3.303797, -5.881756,
2.8392, -3.303797, -5.881756,
-3.313127, -3.303797, 5.570505,
2.8392, -3.303797, 5.570505,
-3.313127, 2.705482, -5.881756,
2.8392, 2.705482, -5.881756,
-3.313127, 2.705482, 5.570505,
2.8392, 2.705482, 5.570505,
2.8392, -3.303797, -5.881756,
2.8392, 2.705482, -5.881756,
2.8392, -3.303797, 5.570505,
2.8392, 2.705482, 5.570505,
2.8392, -3.303797, -5.881756,
2.8392, -3.303797, 5.570505,
2.8392, 2.705482, -5.881756,
2.8392, 2.705482, 5.570505
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
var radius = 7.647617;
var distance = 34.02511;
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
mvMatrix.translate( 0.2369639, 0.2991575, 0.1556253 );
mvMatrix.scale( 1.344004, 1.375997, 0.7220193 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.02511);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-(2-chlorobenzyl)-3<-read.table("1-(2-chlorobenzyl)-3.xyz")
```

```
## Error in read.table("1-(2-chlorobenzyl)-3.xyz"): no lines available in input
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
-3.22353, -0.4914015, -0.7834391, 0, 0, 1, 1, 1,
-2.84733, 1.575113, -2.926103, 1, 0, 0, 1, 1,
-2.791488, -1.983584, -2.620197, 1, 0, 0, 1, 1,
-2.782067, 1.343014, -0.2457462, 1, 0, 0, 1, 1,
-2.661682, -1.812321, -2.458458, 1, 0, 0, 1, 1,
-2.621755, -0.8965383, -2.76518, 1, 0, 0, 1, 1,
-2.522909, -2.405748, -1.724887, 0, 0, 0, 1, 1,
-2.518996, 1.099171, -1.365812, 0, 0, 0, 1, 1,
-2.386588, -1.179244, -2.271461, 0, 0, 0, 1, 1,
-2.346164, -0.08959386, -1.708058, 0, 0, 0, 1, 1,
-2.335227, -0.5787323, -0.3056146, 0, 0, 0, 1, 1,
-2.325276, -0.1149836, -1.48143, 0, 0, 0, 1, 1,
-2.295947, -1.197813, -0.4527448, 0, 0, 0, 1, 1,
-2.249146, 0.9380169, -1.871676, 1, 1, 1, 1, 1,
-2.237865, -0.1005647, -1.636456, 1, 1, 1, 1, 1,
-2.204104, -1.421927, -2.994459, 1, 1, 1, 1, 1,
-2.143724, 2.573404, -0.8392514, 1, 1, 1, 1, 1,
-2.114352, -1.259148, -3.998204, 1, 1, 1, 1, 1,
-2.100585, -0.3919977, -1.558387, 1, 1, 1, 1, 1,
-2.091588, 0.3562523, -2.071627, 1, 1, 1, 1, 1,
-2.071002, 0.6872382, -0.2095733, 1, 1, 1, 1, 1,
-2.059343, -2.007546, -3.830953, 1, 1, 1, 1, 1,
-2.048892, -0.2599301, -0.8517966, 1, 1, 1, 1, 1,
-2.017165, -0.7829573, -2.229389, 1, 1, 1, 1, 1,
-2.005151, -0.4979898, -2.383301, 1, 1, 1, 1, 1,
-1.952129, 1.241531, -1.825578, 1, 1, 1, 1, 1,
-1.945151, 0.2041518, -3.040814, 1, 1, 1, 1, 1,
-1.943531, 1.058456, -1.11016, 1, 1, 1, 1, 1,
-1.930609, 0.1160199, -0.7781121, 0, 0, 1, 1, 1,
-1.9229, -0.9315131, -1.351365, 1, 0, 0, 1, 1,
-1.904856, -0.8582141, -4.311874, 1, 0, 0, 1, 1,
-1.879585, 1.090659, -1.471934, 1, 0, 0, 1, 1,
-1.86744, 1.237667, -0.9485998, 1, 0, 0, 1, 1,
-1.86552, -2.018696, -3.038111, 1, 0, 0, 1, 1,
-1.852456, -0.691204, -1.293034, 0, 0, 0, 1, 1,
-1.821323, 0.1098374, -3.100701, 0, 0, 0, 1, 1,
-1.810032, 0.8238264, 0.1103179, 0, 0, 0, 1, 1,
-1.805478, 1.719167, 0.1192278, 0, 0, 0, 1, 1,
-1.795276, 1.086596, -0.5643529, 0, 0, 0, 1, 1,
-1.759725, 1.055553, 0.1975361, 0, 0, 0, 1, 1,
-1.742315, -0.3778239, -1.075692, 0, 0, 0, 1, 1,
-1.734464, -0.872865, -3.956403, 1, 1, 1, 1, 1,
-1.729047, -0.6683116, -1.211993, 1, 1, 1, 1, 1,
-1.728965, 1.109524, -1.234104, 1, 1, 1, 1, 1,
-1.720726, -1.127091, -3.103517, 1, 1, 1, 1, 1,
-1.706666, -0.02166195, -1.523469, 1, 1, 1, 1, 1,
-1.706399, 0.1327948, 1.690639, 1, 1, 1, 1, 1,
-1.699563, -1.080482, -1.825655, 1, 1, 1, 1, 1,
-1.695403, 1.429326, -1.203983, 1, 1, 1, 1, 1,
-1.691, -0.0235525, -1.177457, 1, 1, 1, 1, 1,
-1.677583, -0.1248671, -0.09758663, 1, 1, 1, 1, 1,
-1.674699, 1.058203, -1.71007, 1, 1, 1, 1, 1,
-1.662997, -0.1633075, -0.9053568, 1, 1, 1, 1, 1,
-1.65001, -0.2374856, -1.898839, 1, 1, 1, 1, 1,
-1.64842, -0.6886865, -2.190348, 1, 1, 1, 1, 1,
-1.641176, -0.168601, -1.432764, 1, 1, 1, 1, 1,
-1.641147, -0.627266, -2.36595, 0, 0, 1, 1, 1,
-1.637728, 1.266423, 0.1462568, 1, 0, 0, 1, 1,
-1.635798, -0.4186166, -1.372552, 1, 0, 0, 1, 1,
-1.620291, 1.613313, -1.152996, 1, 0, 0, 1, 1,
-1.611414, 1.248138, -2.16864, 1, 0, 0, 1, 1,
-1.603958, 0.7318873, -0.2485215, 1, 0, 0, 1, 1,
-1.590755, -1.397733, -2.034634, 0, 0, 0, 1, 1,
-1.587305, -0.495344, -2.675452, 0, 0, 0, 1, 1,
-1.582825, 1.744086, 0.6833603, 0, 0, 0, 1, 1,
-1.568934, -1.254017, -1.114295, 0, 0, 0, 1, 1,
-1.564604, -0.006948296, -1.967933, 0, 0, 0, 1, 1,
-1.562966, -1.087037, -3.104486, 0, 0, 0, 1, 1,
-1.551545, -0.8886867, -2.975242, 0, 0, 0, 1, 1,
-1.550559, 0.4362864, -1.149662, 1, 1, 1, 1, 1,
-1.544938, -0.9949579, -3.234633, 1, 1, 1, 1, 1,
-1.537433, 0.02773727, -1.825858, 1, 1, 1, 1, 1,
-1.525268, -0.6856387, -3.470013, 1, 1, 1, 1, 1,
-1.52518, -1.482984, -2.732761, 1, 1, 1, 1, 1,
-1.5225, 0.5939298, -0.2362472, 1, 1, 1, 1, 1,
-1.52242, 0.6397415, -0.07819626, 1, 1, 1, 1, 1,
-1.518918, 0.372463, -0.9137327, 1, 1, 1, 1, 1,
-1.517364, 0.2994491, 0.4571563, 1, 1, 1, 1, 1,
-1.511358, 1.452706, -1.695426, 1, 1, 1, 1, 1,
-1.50637, 0.03418442, -2.021673, 1, 1, 1, 1, 1,
-1.491095, 0.04751703, -1.637331, 1, 1, 1, 1, 1,
-1.481463, 0.2933114, -1.275646, 1, 1, 1, 1, 1,
-1.480688, 0.8499882, 0.2418296, 1, 1, 1, 1, 1,
-1.474677, -1.3806, -3.042614, 1, 1, 1, 1, 1,
-1.471282, 2.059964, 0.6870098, 0, 0, 1, 1, 1,
-1.449469, 0.982808, 0.03119538, 1, 0, 0, 1, 1,
-1.430311, -0.6975344, -2.909275, 1, 0, 0, 1, 1,
-1.419052, 1.721939, -0.7870138, 1, 0, 0, 1, 1,
-1.41734, -0.2223206, -1.664001, 1, 0, 0, 1, 1,
-1.405993, -0.1626528, -1.928788, 1, 0, 0, 1, 1,
-1.400451, 1.464582, -1.672363, 0, 0, 0, 1, 1,
-1.390416, 0.0224685, 0.02253256, 0, 0, 0, 1, 1,
-1.378835, 0.5013488, 0.230874, 0, 0, 0, 1, 1,
-1.378552, 0.962537, -0.1236105, 0, 0, 0, 1, 1,
-1.376596, -0.4148358, -3.68193, 0, 0, 0, 1, 1,
-1.365146, -1.538933, -3.685847, 0, 0, 0, 1, 1,
-1.363275, -0.4880905, -3.323228, 0, 0, 0, 1, 1,
-1.358382, 1.895469, -1.067771, 1, 1, 1, 1, 1,
-1.35608, 0.345492, -1.147786, 1, 1, 1, 1, 1,
-1.349423, 0.8619792, -0.8439457, 1, 1, 1, 1, 1,
-1.338321, 0.4650429, -1.099495, 1, 1, 1, 1, 1,
-1.335353, -1.242795, -2.416376, 1, 1, 1, 1, 1,
-1.332247, 0.3419503, -2.03452, 1, 1, 1, 1, 1,
-1.323843, -2.104511, -3.743282, 1, 1, 1, 1, 1,
-1.322101, -0.9312982, -2.067276, 1, 1, 1, 1, 1,
-1.316129, -0.720177, -2.684045, 1, 1, 1, 1, 1,
-1.315949, 0.09437536, -2.305967, 1, 1, 1, 1, 1,
-1.311682, -0.1562984, -2.68423, 1, 1, 1, 1, 1,
-1.30501, -0.2567627, -2.194707, 1, 1, 1, 1, 1,
-1.30333, 0.1306839, -3.412835, 1, 1, 1, 1, 1,
-1.300229, -0.3211362, -3.111569, 1, 1, 1, 1, 1,
-1.300196, 0.9511317, 0.04705568, 1, 1, 1, 1, 1,
-1.297528, -0.9774405, -2.991644, 0, 0, 1, 1, 1,
-1.294908, 0.6016059, -1.630272, 1, 0, 0, 1, 1,
-1.290351, 1.046886, -0.2765444, 1, 0, 0, 1, 1,
-1.273963, 1.309194, 0.299609, 1, 0, 0, 1, 1,
-1.272962, 0.1537604, -2.392711, 1, 0, 0, 1, 1,
-1.269516, -0.04171355, -0.7585521, 1, 0, 0, 1, 1,
-1.253332, -1.24867, -2.207567, 0, 0, 0, 1, 1,
-1.25052, 0.8947629, 0.9267088, 0, 0, 0, 1, 1,
-1.249478, 0.2256889, -2.970501, 0, 0, 0, 1, 1,
-1.24689, -1.793128, -2.150239, 0, 0, 0, 1, 1,
-1.238193, 0.5630646, -0.6019338, 0, 0, 0, 1, 1,
-1.233946, -0.5864574, -1.583089, 0, 0, 0, 1, 1,
-1.232826, -0.6577752, -1.785651, 0, 0, 0, 1, 1,
-1.230366, -1.96854, -2.321689, 1, 1, 1, 1, 1,
-1.230298, 1.154148, -2.314002, 1, 1, 1, 1, 1,
-1.229914, 0.7043636, 0.8283635, 1, 1, 1, 1, 1,
-1.22664, 1.26111, -0.4388949, 1, 1, 1, 1, 1,
-1.223903, -0.3348957, -2.052513, 1, 1, 1, 1, 1,
-1.216689, -0.01168812, -0.7562922, 1, 1, 1, 1, 1,
-1.212502, -1.644336, -2.696547, 1, 1, 1, 1, 1,
-1.2112, -0.02973126, -0.6529654, 1, 1, 1, 1, 1,
-1.207295, -2.424326, -1.6298, 1, 1, 1, 1, 1,
-1.197638, -0.1262035, -1.362424, 1, 1, 1, 1, 1,
-1.197093, 0.5817688, -3.643687, 1, 1, 1, 1, 1,
-1.194722, 0.2174512, -2.459239, 1, 1, 1, 1, 1,
-1.191722, 0.7017834, -2.435707, 1, 1, 1, 1, 1,
-1.18952, -0.1538786, 0.6132185, 1, 1, 1, 1, 1,
-1.188295, 1.122402, -0.1159505, 1, 1, 1, 1, 1,
-1.183875, -0.495556, -2.709135, 0, 0, 1, 1, 1,
-1.182094, -1.888095, -3.357192, 1, 0, 0, 1, 1,
-1.169157, -0.5024387, -2.944505, 1, 0, 0, 1, 1,
-1.166105, 1.638942, -0.8577941, 1, 0, 0, 1, 1,
-1.164666, -0.0505289, -0.8381008, 1, 0, 0, 1, 1,
-1.162004, -0.4243021, -2.483522, 1, 0, 0, 1, 1,
-1.157964, -0.06697087, -0.7223836, 0, 0, 0, 1, 1,
-1.153235, 0.09672265, -1.958005, 0, 0, 0, 1, 1,
-1.151622, 0.1098267, -1.034345, 0, 0, 0, 1, 1,
-1.149503, 0.3950798, -0.9876255, 0, 0, 0, 1, 1,
-1.146127, -0.4157353, -1.211583, 0, 0, 0, 1, 1,
-1.137045, -0.5721816, -1.595413, 0, 0, 0, 1, 1,
-1.135084, 0.2710216, -0.5691468, 0, 0, 0, 1, 1,
-1.13333, 0.2117914, -3.121524, 1, 1, 1, 1, 1,
-1.130711, -1.361593, -3.407929, 1, 1, 1, 1, 1,
-1.119828, 0.1102429, -2.033961, 1, 1, 1, 1, 1,
-1.118826, -0.01741726, -3.108178, 1, 1, 1, 1, 1,
-1.113581, -0.1425036, -4.17813, 1, 1, 1, 1, 1,
-1.110062, -2.643607, -2.776262, 1, 1, 1, 1, 1,
-1.109817, 0.1178448, -1.754645, 1, 1, 1, 1, 1,
-1.105948, -0.4099262, -2.74886, 1, 1, 1, 1, 1,
-1.092943, 0.9576521, -0.4130488, 1, 1, 1, 1, 1,
-1.090363, 2.617969, 0.2167106, 1, 1, 1, 1, 1,
-1.089336, -0.5176494, -1.709683, 1, 1, 1, 1, 1,
-1.086908, 0.2939612, -2.577108, 1, 1, 1, 1, 1,
-1.082834, 1.661953, -0.1555114, 1, 1, 1, 1, 1,
-1.081198, 0.5482157, -0.1199694, 1, 1, 1, 1, 1,
-1.071427, -0.6282094, -2.54714, 1, 1, 1, 1, 1,
-1.069611, -0.3271485, -3.293716, 0, 0, 1, 1, 1,
-1.050406, -0.1009117, -0.6358621, 1, 0, 0, 1, 1,
-1.047362, 0.619072, -1.959341, 1, 0, 0, 1, 1,
-1.04239, -0.4109814, -2.884459, 1, 0, 0, 1, 1,
-1.041325, -0.6593612, -1.240274, 1, 0, 0, 1, 1,
-1.039565, -1.329051, -4.800024, 1, 0, 0, 1, 1,
-1.039216, -1.344343, -2.661155, 0, 0, 0, 1, 1,
-1.036577, -0.5214255, -3.597717, 0, 0, 0, 1, 1,
-1.036271, 0.947691, -2.206543, 0, 0, 0, 1, 1,
-1.03553, 0.5341347, 0.3718755, 0, 0, 0, 1, 1,
-1.03431, 0.8900012, -1.9609, 0, 0, 0, 1, 1,
-1.028907, 0.5103046, -1.345145, 0, 0, 0, 1, 1,
-1.023184, 0.05919094, -3.040607, 0, 0, 0, 1, 1,
-1.022127, -0.829841, -2.721996, 1, 1, 1, 1, 1,
-1.009458, -0.3264229, -1.329827, 1, 1, 1, 1, 1,
-1.000978, 0.03240614, 0.7521399, 1, 1, 1, 1, 1,
-0.9996438, -0.3537606, -0.9717645, 1, 1, 1, 1, 1,
-0.9858371, 0.6105247, 0.6352615, 1, 1, 1, 1, 1,
-0.9820623, -1.67809, -2.573164, 1, 1, 1, 1, 1,
-0.9708083, -0.9602813, -1.603119, 1, 1, 1, 1, 1,
-0.9645028, 0.12473, -0.2602322, 1, 1, 1, 1, 1,
-0.9607312, 1.092638, -2.271116, 1, 1, 1, 1, 1,
-0.9547368, 0.5106163, -1.178104, 1, 1, 1, 1, 1,
-0.9496889, -1.955402, -2.692878, 1, 1, 1, 1, 1,
-0.9446486, 0.103336, -1.84268, 1, 1, 1, 1, 1,
-0.9423744, -0.916181, -1.484504, 1, 1, 1, 1, 1,
-0.9404464, -1.491526, -0.6010704, 1, 1, 1, 1, 1,
-0.9400028, -1.551029, -2.215223, 1, 1, 1, 1, 1,
-0.9251302, -1.133592, -2.322249, 0, 0, 1, 1, 1,
-0.9243673, -1.766383, -3.870059, 1, 0, 0, 1, 1,
-0.9195868, -0.9674912, -4.33115, 1, 0, 0, 1, 1,
-0.9096655, -0.786374, -2.878478, 1, 0, 0, 1, 1,
-0.905087, -0.8343764, -3.247141, 1, 0, 0, 1, 1,
-0.9031156, -0.9613594, -0.2183904, 1, 0, 0, 1, 1,
-0.900589, 0.5935867, -1.274687, 0, 0, 0, 1, 1,
-0.8960102, 0.9034687, -1.453766, 0, 0, 0, 1, 1,
-0.8919043, 1.045629, -0.1753785, 0, 0, 0, 1, 1,
-0.8870566, -1.008978, -1.575904, 0, 0, 0, 1, 1,
-0.8835808, 1.125642, 0.1820917, 0, 0, 0, 1, 1,
-0.8803183, -0.03814068, -1.594847, 0, 0, 0, 1, 1,
-0.8723807, -0.07763965, -2.130737, 0, 0, 0, 1, 1,
-0.8698568, -0.1339038, -2.427072, 1, 1, 1, 1, 1,
-0.860658, -0.1971944, -2.850395, 1, 1, 1, 1, 1,
-0.8550213, 0.4840722, -2.613334, 1, 1, 1, 1, 1,
-0.8547016, -0.9637699, -0.6839032, 1, 1, 1, 1, 1,
-0.8543369, -0.774846, -2.175124, 1, 1, 1, 1, 1,
-0.8474907, 0.7000543, -1.000451, 1, 1, 1, 1, 1,
-0.845006, 0.9483986, -3.261933, 1, 1, 1, 1, 1,
-0.8414862, -0.2209729, -0.4985519, 1, 1, 1, 1, 1,
-0.8405692, 0.1713642, -1.335197, 1, 1, 1, 1, 1,
-0.8328259, 0.05559118, -2.210718, 1, 1, 1, 1, 1,
-0.8290715, -0.4488137, -2.483259, 1, 1, 1, 1, 1,
-0.8264804, -0.2894086, -1.722167, 1, 1, 1, 1, 1,
-0.8248352, -1.926141, -1.290833, 1, 1, 1, 1, 1,
-0.8199864, 1.443891, -2.56501, 1, 1, 1, 1, 1,
-0.8122863, -1.01707, -1.761933, 1, 1, 1, 1, 1,
-0.8065263, -1.16105, -2.835549, 0, 0, 1, 1, 1,
-0.8056691, 0.8022122, -0.927701, 1, 0, 0, 1, 1,
-0.8025537, 0.9312081, -0.03398189, 1, 0, 0, 1, 1,
-0.7998598, 0.1656939, -0.7338813, 1, 0, 0, 1, 1,
-0.7963485, 0.8283834, 0.2172618, 1, 0, 0, 1, 1,
-0.7898359, -0.2205443, -1.859978, 1, 0, 0, 1, 1,
-0.7809238, -0.6644514, -2.794908, 0, 0, 0, 1, 1,
-0.776683, -2.26737, -2.540666, 0, 0, 0, 1, 1,
-0.7731965, 0.2834554, -2.217759, 0, 0, 0, 1, 1,
-0.7727819, 0.5427713, -0.3998803, 0, 0, 0, 1, 1,
-0.7711692, -0.03247226, -1.780474, 0, 0, 0, 1, 1,
-0.7645065, -0.530152, -2.677314, 0, 0, 0, 1, 1,
-0.75867, -0.2059171, 0.8102795, 0, 0, 0, 1, 1,
-0.7568566, -0.9838724, -0.872365, 1, 1, 1, 1, 1,
-0.7565663, -1.737544, -5.714975, 1, 1, 1, 1, 1,
-0.7503327, 0.06706002, -1.211808, 1, 1, 1, 1, 1,
-0.7490018, -1.125906, -2.914656, 1, 1, 1, 1, 1,
-0.7458014, -1.254474, -1.579252, 1, 1, 1, 1, 1,
-0.7378385, 0.1375708, -3.356159, 1, 1, 1, 1, 1,
-0.7363295, -0.6989726, -2.437748, 1, 1, 1, 1, 1,
-0.7358633, 1.857895, -1.270086, 1, 1, 1, 1, 1,
-0.7328733, 0.1437904, -3.524328, 1, 1, 1, 1, 1,
-0.7278045, 0.5789127, -1.075071, 1, 1, 1, 1, 1,
-0.7229367, 0.6089159, 0.1972066, 1, 1, 1, 1, 1,
-0.7224838, 0.2667062, -1.055805, 1, 1, 1, 1, 1,
-0.7174256, 0.6998332, -0.1197039, 1, 1, 1, 1, 1,
-0.708077, 0.739112, 0.8472497, 1, 1, 1, 1, 1,
-0.7073081, -1.773563, -3.333862, 1, 1, 1, 1, 1,
-0.7031674, 0.4412573, -0.5082192, 0, 0, 1, 1, 1,
-0.7021365, -1.30893, -0.5047951, 1, 0, 0, 1, 1,
-0.6997487, -0.3273563, -1.127203, 1, 0, 0, 1, 1,
-0.6954536, 0.001242808, -1.921049, 1, 0, 0, 1, 1,
-0.6928271, 0.8551056, -0.8011132, 1, 0, 0, 1, 1,
-0.6901636, 1.320553, -2.836029, 1, 0, 0, 1, 1,
-0.6864214, -1.706147, -2.444454, 0, 0, 0, 1, 1,
-0.6833237, 0.9091352, -1.755506, 0, 0, 0, 1, 1,
-0.6828254, 1.19592, -0.922577, 0, 0, 0, 1, 1,
-0.6814106, 0.610799, -1.404727, 0, 0, 0, 1, 1,
-0.6783881, -1.776068, -3.714913, 0, 0, 0, 1, 1,
-0.670554, -0.8920724, -1.864067, 0, 0, 0, 1, 1,
-0.6661582, 0.0121006, 0.1943215, 0, 0, 0, 1, 1,
-0.6629406, -2.115386, -3.465665, 1, 1, 1, 1, 1,
-0.6582259, -0.09191417, -0.2940788, 1, 1, 1, 1, 1,
-0.654349, -0.169138, -3.276674, 1, 1, 1, 1, 1,
-0.6538935, 1.317968, -1.627972, 1, 1, 1, 1, 1,
-0.6496944, -0.2993818, -1.258472, 1, 1, 1, 1, 1,
-0.649488, 0.03051966, -1.837286, 1, 1, 1, 1, 1,
-0.6487255, 0.5007578, 0.293221, 1, 1, 1, 1, 1,
-0.6483917, -1.366644, -3.401279, 1, 1, 1, 1, 1,
-0.6467964, 0.543507, -2.223236, 1, 1, 1, 1, 1,
-0.6416026, -0.08913575, -0.7255427, 1, 1, 1, 1, 1,
-0.6403034, -0.4350553, -2.522239, 1, 1, 1, 1, 1,
-0.639742, -0.1630581, -2.869168, 1, 1, 1, 1, 1,
-0.636208, -0.6390836, -2.567544, 1, 1, 1, 1, 1,
-0.6351541, -0.1214677, -2.237062, 1, 1, 1, 1, 1,
-0.6306947, -1.714926, -1.624059, 1, 1, 1, 1, 1,
-0.625779, -0.2313951, -1.411709, 0, 0, 1, 1, 1,
-0.6245266, 0.8641785, -2.145855, 1, 0, 0, 1, 1,
-0.6244248, -0.2817964, -1.207045, 1, 0, 0, 1, 1,
-0.621198, -0.9071456, -3.424591, 1, 0, 0, 1, 1,
-0.6123099, 0.211861, -1.444197, 1, 0, 0, 1, 1,
-0.6094289, 2.250226, 0.0858364, 1, 0, 0, 1, 1,
-0.6039498, -1.457306, -2.319417, 0, 0, 0, 1, 1,
-0.6015815, -0.3618513, -2.778875, 0, 0, 0, 1, 1,
-0.5970128, -1.231494, -3.621299, 0, 0, 0, 1, 1,
-0.5959622, 0.879765, -0.3046108, 0, 0, 0, 1, 1,
-0.5899912, -0.7917219, -3.180048, 0, 0, 0, 1, 1,
-0.584996, -0.5117286, -2.710173, 0, 0, 0, 1, 1,
-0.5848782, -0.5869039, -2.657199, 0, 0, 0, 1, 1,
-0.5833718, 0.6669574, -0.5671626, 1, 1, 1, 1, 1,
-0.5823863, -0.3319211, -2.447229, 1, 1, 1, 1, 1,
-0.5813748, -1.417447, -3.602182, 1, 1, 1, 1, 1,
-0.5770952, 1.356624, 0.2170759, 1, 1, 1, 1, 1,
-0.5724958, -0.6097028, -2.742969, 1, 1, 1, 1, 1,
-0.5700682, -0.4399685, -2.040618, 1, 1, 1, 1, 1,
-0.5686265, -0.7666549, -1.572615, 1, 1, 1, 1, 1,
-0.5673143, 0.5119062, -1.304528, 1, 1, 1, 1, 1,
-0.5662274, 1.63348, 0.3288009, 1, 1, 1, 1, 1,
-0.565971, 0.4417741, -2.308268, 1, 1, 1, 1, 1,
-0.5645664, -0.4085228, -3.506109, 1, 1, 1, 1, 1,
-0.5613706, -0.06044023, -0.8726396, 1, 1, 1, 1, 1,
-0.561262, 0.09180751, -1.070133, 1, 1, 1, 1, 1,
-0.560656, 0.8134279, -2.371477, 1, 1, 1, 1, 1,
-0.5452808, 0.2045476, -1.739716, 1, 1, 1, 1, 1,
-0.5435588, 1.294495, -1.091808, 0, 0, 1, 1, 1,
-0.5432906, -0.6442187, -3.427217, 1, 0, 0, 1, 1,
-0.5432429, 1.324248, 0.4587544, 1, 0, 0, 1, 1,
-0.5397291, -1.14123, -2.773987, 1, 0, 0, 1, 1,
-0.5382745, 0.9848936, -0.4885628, 1, 0, 0, 1, 1,
-0.5369486, -0.6574476, -3.8542, 1, 0, 0, 1, 1,
-0.5338623, 1.486749, 0.5944284, 0, 0, 0, 1, 1,
-0.5318811, -0.1391599, -1.286962, 0, 0, 0, 1, 1,
-0.5278119, 0.6372969, -0.5598841, 0, 0, 0, 1, 1,
-0.5267683, -2.155143, -2.625719, 0, 0, 0, 1, 1,
-0.5234507, 1.189646, -3.07298, 0, 0, 0, 1, 1,
-0.5227751, -2.184114, -2.084456, 0, 0, 0, 1, 1,
-0.5185364, 0.5002849, -1.628462, 0, 0, 0, 1, 1,
-0.5178386, 1.411712, -0.4388649, 1, 1, 1, 1, 1,
-0.5115433, -0.1249529, -2.933554, 1, 1, 1, 1, 1,
-0.508392, 0.5233574, -0.7638056, 1, 1, 1, 1, 1,
-0.5065625, 0.5311433, 0.1487464, 1, 1, 1, 1, 1,
-0.5033022, 0.4984115, -0.8641935, 1, 1, 1, 1, 1,
-0.5015072, -0.6726819, -1.797583, 1, 1, 1, 1, 1,
-0.5000596, -0.09104169, -0.4663051, 1, 1, 1, 1, 1,
-0.4995797, 0.48463, -0.9254435, 1, 1, 1, 1, 1,
-0.4986326, 0.1020066, -1.2417, 1, 1, 1, 1, 1,
-0.4967394, 0.806877, -0.8727005, 1, 1, 1, 1, 1,
-0.4956954, -1.146217, -1.470639, 1, 1, 1, 1, 1,
-0.4956197, 0.3625517, -0.1237351, 1, 1, 1, 1, 1,
-0.4956175, -0.4634115, -1.446066, 1, 1, 1, 1, 1,
-0.4951351, 1.013088, -1.368076, 1, 1, 1, 1, 1,
-0.485635, 0.9525129, -2.448671, 1, 1, 1, 1, 1,
-0.4804251, 0.5345415, -2.016712, 0, 0, 1, 1, 1,
-0.4778569, 1.60924, -1.759915, 1, 0, 0, 1, 1,
-0.4757758, 0.03368595, -0.1984935, 1, 0, 0, 1, 1,
-0.475739, 0.08294704, -0.1055302, 1, 0, 0, 1, 1,
-0.4734859, 0.1327726, -1.50831, 1, 0, 0, 1, 1,
-0.4732169, 0.5211818, 0.6769002, 1, 0, 0, 1, 1,
-0.4656545, -0.7549576, -2.307459, 0, 0, 0, 1, 1,
-0.4606255, -1.362171, -5.680169, 0, 0, 0, 1, 1,
-0.4605119, 0.5966837, -0.7039168, 0, 0, 0, 1, 1,
-0.4595292, 0.046956, -1.524557, 0, 0, 0, 1, 1,
-0.4565184, -0.9389548, -3.09247, 0, 0, 0, 1, 1,
-0.4455377, -0.1919644, -2.482486, 0, 0, 0, 1, 1,
-0.4423066, -0.1469372, -2.851318, 0, 0, 0, 1, 1,
-0.4403279, 0.05044237, -1.070306, 1, 1, 1, 1, 1,
-0.430596, 0.2123028, -1.929837, 1, 1, 1, 1, 1,
-0.4297586, -0.9144619, -2.492957, 1, 1, 1, 1, 1,
-0.4193978, 0.273151, -1.691974, 1, 1, 1, 1, 1,
-0.4183411, -0.6774347, -2.384993, 1, 1, 1, 1, 1,
-0.4139436, 0.7757008, -1.003162, 1, 1, 1, 1, 1,
-0.4133103, 0.8287906, -0.1749425, 1, 1, 1, 1, 1,
-0.4088804, 0.1841959, -0.7886242, 1, 1, 1, 1, 1,
-0.4083999, 1.268306, -1.308859, 1, 1, 1, 1, 1,
-0.4076816, -0.202484, -2.720464, 1, 1, 1, 1, 1,
-0.4067066, 0.4990987, -0.4321632, 1, 1, 1, 1, 1,
-0.4037734, 0.3701731, 2.037902, 1, 1, 1, 1, 1,
-0.4019307, -0.5125921, -3.526187, 1, 1, 1, 1, 1,
-0.3969791, 0.8699777, -1.685479, 1, 1, 1, 1, 1,
-0.3969738, -1.594488, -2.007668, 1, 1, 1, 1, 1,
-0.3951078, 0.9564645, -0.3600332, 0, 0, 1, 1, 1,
-0.3883977, 0.5657832, -0.6419947, 1, 0, 0, 1, 1,
-0.3851613, -1.043133, -3.730191, 1, 0, 0, 1, 1,
-0.3816986, 1.886306, -0.2888316, 1, 0, 0, 1, 1,
-0.3793426, 2.143573, 0.6180838, 1, 0, 0, 1, 1,
-0.3781962, 2.086103, -0.1996287, 1, 0, 0, 1, 1,
-0.3781513, -0.4852709, -0.6804854, 0, 0, 0, 1, 1,
-0.3689017, 1.661054, 0.4821259, 0, 0, 0, 1, 1,
-0.3645258, -0.4552872, -2.396137, 0, 0, 0, 1, 1,
-0.3583665, 0.01685074, -2.764184, 0, 0, 0, 1, 1,
-0.3555149, -0.7554516, -2.224234, 0, 0, 0, 1, 1,
-0.3538281, -0.09173188, -1.617324, 0, 0, 0, 1, 1,
-0.3529636, -0.3175697, -2.192989, 0, 0, 0, 1, 1,
-0.3436777, 0.9556872, -1.389269, 1, 1, 1, 1, 1,
-0.3433096, 1.734792, 0.3187101, 1, 1, 1, 1, 1,
-0.342307, 2.525067, 0.3564907, 1, 1, 1, 1, 1,
-0.339596, 0.1113272, -2.85368, 1, 1, 1, 1, 1,
-0.3385935, -1.543058, -3.849307, 1, 1, 1, 1, 1,
-0.338148, -0.4835859, -3.203481, 1, 1, 1, 1, 1,
-0.3368913, 0.4649488, -1.163082, 1, 1, 1, 1, 1,
-0.3359553, 1.523595, -0.08897652, 1, 1, 1, 1, 1,
-0.3334996, -0.1000593, -1.254367, 1, 1, 1, 1, 1,
-0.3332728, -0.8767125, -1.574184, 1, 1, 1, 1, 1,
-0.3317073, -0.3772405, -3.108535, 1, 1, 1, 1, 1,
-0.3285395, 0.2097813, -1.471138, 1, 1, 1, 1, 1,
-0.3284939, -0.03269983, -2.492976, 1, 1, 1, 1, 1,
-0.3212282, 0.2106112, -0.6482217, 1, 1, 1, 1, 1,
-0.3170148, 1.776163, -0.1374717, 1, 1, 1, 1, 1,
-0.3090464, -0.186852, -3.156985, 0, 0, 1, 1, 1,
-0.3066483, 0.4323898, -0.4422254, 1, 0, 0, 1, 1,
-0.3058946, 0.4770158, -1.187704, 1, 0, 0, 1, 1,
-0.304788, 0.4637985, 0.8166921, 1, 0, 0, 1, 1,
-0.3035817, -0.9787678, -2.517201, 1, 0, 0, 1, 1,
-0.2950441, 0.66307, 0.4687713, 1, 0, 0, 1, 1,
-0.2917064, -0.7010205, -2.661899, 0, 0, 0, 1, 1,
-0.2889699, -1.035245, -2.678388, 0, 0, 0, 1, 1,
-0.2875122, -0.1496122, -2.236215, 0, 0, 0, 1, 1,
-0.2805976, -0.1436729, -1.381612, 0, 0, 0, 1, 1,
-0.2804202, 0.9178481, -1.6829, 0, 0, 0, 1, 1,
-0.2797712, 0.6839746, -0.2920851, 0, 0, 0, 1, 1,
-0.2774557, 0.4116547, -0.5931256, 0, 0, 0, 1, 1,
-0.2773417, 0.9162493, 0.3599354, 1, 1, 1, 1, 1,
-0.2737926, -0.9002382, -2.795985, 1, 1, 1, 1, 1,
-0.2728135, 0.3031443, -0.4494462, 1, 1, 1, 1, 1,
-0.2638293, 0.4535483, 0.6301213, 1, 1, 1, 1, 1,
-0.2625043, 2.204024, -0.04734302, 1, 1, 1, 1, 1,
-0.2605823, 0.5876033, 0.3879616, 1, 1, 1, 1, 1,
-0.2604739, -0.8651437, -4.59869, 1, 1, 1, 1, 1,
-0.2586811, -1.111569, -3.006751, 1, 1, 1, 1, 1,
-0.2566868, 0.5168247, -3.443887, 1, 1, 1, 1, 1,
-0.2519026, -2.306766, -2.833395, 1, 1, 1, 1, 1,
-0.2512805, 1.042664, -0.7402638, 1, 1, 1, 1, 1,
-0.2480372, 0.008854141, -1.767961, 1, 1, 1, 1, 1,
-0.2448014, -1.328281, -3.756172, 1, 1, 1, 1, 1,
-0.2433394, 0.6033285, -1.310198, 1, 1, 1, 1, 1,
-0.236461, 0.5790716, 0.3283358, 1, 1, 1, 1, 1,
-0.2150428, 0.8241254, -0.9329656, 0, 0, 1, 1, 1,
-0.2083737, -1.527599, -3.45632, 1, 0, 0, 1, 1,
-0.2032545, -1.592431, -2.672228, 1, 0, 0, 1, 1,
-0.1843476, 0.5978204, -0.2187486, 1, 0, 0, 1, 1,
-0.1817124, 0.8313681, -0.5699008, 1, 0, 0, 1, 1,
-0.1812308, 0.9816245, 0.9506093, 1, 0, 0, 1, 1,
-0.1787657, -1.019411, -3.792372, 0, 0, 0, 1, 1,
-0.1781883, 2.231313, -0.115572, 0, 0, 0, 1, 1,
-0.1729165, -0.350583, -3.799978, 0, 0, 0, 1, 1,
-0.1698363, -1.421967, -0.9122407, 0, 0, 0, 1, 1,
-0.1689821, 0.9445723, -1.00504, 0, 0, 0, 1, 1,
-0.1684712, 2.094526, -1.723072, 0, 0, 0, 1, 1,
-0.1674831, -0.3961378, -2.468867, 0, 0, 0, 1, 1,
-0.1665568, 1.251621, -0.2002508, 1, 1, 1, 1, 1,
-0.1637045, -0.8512439, -3.228768, 1, 1, 1, 1, 1,
-0.1553418, -0.7164254, -2.746084, 1, 1, 1, 1, 1,
-0.1550351, -1.356284, -3.152039, 1, 1, 1, 1, 1,
-0.1515453, -0.3080951, -2.608229, 1, 1, 1, 1, 1,
-0.1507227, -0.7807459, -0.7845809, 1, 1, 1, 1, 1,
-0.1489996, -1.354548, -2.66958, 1, 1, 1, 1, 1,
-0.1474564, -0.2713139, -1.966944, 1, 1, 1, 1, 1,
-0.1426931, 0.4604699, 1.51708, 1, 1, 1, 1, 1,
-0.1380038, -1.379694, -1.18441, 1, 1, 1, 1, 1,
-0.1373354, 1.278222, -0.3112304, 1, 1, 1, 1, 1,
-0.1328921, -0.8276213, -3.216764, 1, 1, 1, 1, 1,
-0.1328192, -0.6839032, -3.798015, 1, 1, 1, 1, 1,
-0.1328118, -0.1380621, -2.630909, 1, 1, 1, 1, 1,
-0.1270207, 0.2868375, 0.9451994, 1, 1, 1, 1, 1,
-0.1254397, -1.746782, -3.736438, 0, 0, 1, 1, 1,
-0.1226718, 0.5331451, -1.680566, 1, 0, 0, 1, 1,
-0.1224529, -0.4953029, -2.522695, 1, 0, 0, 1, 1,
-0.1204767, 0.07273857, -0.877641, 1, 0, 0, 1, 1,
-0.1138545, 0.7800962, -0.3336497, 1, 0, 0, 1, 1,
-0.1113159, 0.1523874, -2.109005, 1, 0, 0, 1, 1,
-0.1108115, -0.1377697, -2.64378, 0, 0, 0, 1, 1,
-0.1107149, -1.445958, -3.508714, 0, 0, 0, 1, 1,
-0.1086161, 1.344774, -0.6704896, 0, 0, 0, 1, 1,
-0.1053665, 1.619179, 0.1837284, 0, 0, 0, 1, 1,
-0.1036327, -0.9558341, -2.510006, 0, 0, 0, 1, 1,
-0.1036151, 0.2006082, -0.685252, 0, 0, 0, 1, 1,
-0.1005505, -0.8058176, -3.825934, 0, 0, 0, 1, 1,
-0.09345268, -0.2508455, -3.614202, 1, 1, 1, 1, 1,
-0.09335432, -0.2573461, -2.444076, 1, 1, 1, 1, 1,
-0.08534247, -1.039808, -4.779215, 1, 1, 1, 1, 1,
-0.07662332, 0.6318783, 0.4821013, 1, 1, 1, 1, 1,
-0.0731958, 0.269035, -0.5811865, 1, 1, 1, 1, 1,
-0.06916077, 0.07201404, -0.9576923, 1, 1, 1, 1, 1,
-0.06689852, 0.4569957, -0.4945492, 1, 1, 1, 1, 1,
-0.06656938, 1.959692, -2.250594, 1, 1, 1, 1, 1,
-0.06650007, -0.05977204, -3.958023, 1, 1, 1, 1, 1,
-0.06453419, 0.7191027, -1.114328, 1, 1, 1, 1, 1,
-0.05048973, 0.4134648, -0.5379488, 1, 1, 1, 1, 1,
-0.04948537, 1.085672, 0.439868, 1, 1, 1, 1, 1,
-0.04538678, 2.011274, -0.07827663, 1, 1, 1, 1, 1,
-0.04497527, -0.04243765, -1.460171, 1, 1, 1, 1, 1,
-0.04359272, 1.154365, 0.1299231, 1, 1, 1, 1, 1,
-0.04185591, -0.3485627, -2.670574, 0, 0, 1, 1, 1,
-0.03900674, -0.7853554, -4.27848, 1, 0, 0, 1, 1,
-0.0389545, 0.9452685, -0.891404, 1, 0, 0, 1, 1,
-0.03863885, 0.05322918, -0.3682177, 1, 0, 0, 1, 1,
-0.03656843, -1.460267, -3.671464, 1, 0, 0, 1, 1,
-0.03036863, -0.4179388, -2.430973, 1, 0, 0, 1, 1,
-0.03011576, 1.555544, 1.123179, 0, 0, 0, 1, 1,
-0.02708063, 1.346325, -0.8929309, 0, 0, 0, 1, 1,
-0.02548963, 1.719109, 0.4405659, 0, 0, 0, 1, 1,
-0.02048864, -0.3645166, -3.059633, 0, 0, 0, 1, 1,
-0.02026237, -1.712366, -2.621627, 0, 0, 0, 1, 1,
-0.01745309, -1.89345, -3.91199, 0, 0, 0, 1, 1,
-0.01378853, 2.002538, -2.509682, 0, 0, 0, 1, 1,
-0.00380126, 0.9671123, -0.5764149, 1, 1, 1, 1, 1,
-0.001635629, 2.342468, 3.142296, 1, 1, 1, 1, 1,
-0.001157744, 2.553239, -1.862669, 1, 1, 1, 1, 1,
0.003290498, 0.6373295, -0.668507, 1, 1, 1, 1, 1,
0.004965647, 2.033169, -0.3996494, 1, 1, 1, 1, 1,
0.005430888, -0.5395782, 3.255461, 1, 1, 1, 1, 1,
0.009705967, -0.8748049, 3.300948, 1, 1, 1, 1, 1,
0.01504464, -1.030618, 3.6601, 1, 1, 1, 1, 1,
0.01670514, -1.435913, 2.12077, 1, 1, 1, 1, 1,
0.01949274, -0.3505468, 3.506113, 1, 1, 1, 1, 1,
0.01983614, -0.5096006, 5.372481, 1, 1, 1, 1, 1,
0.02008398, -2.546602, 3.854696, 1, 1, 1, 1, 1,
0.02064337, -0.2816567, 1.897114, 1, 1, 1, 1, 1,
0.02857483, -0.8859105, 1.807861, 1, 1, 1, 1, 1,
0.02878462, -0.7422909, 4.249794, 1, 1, 1, 1, 1,
0.03068063, 1.238377, 0.1512773, 0, 0, 1, 1, 1,
0.03087514, -0.1245863, 4.907618, 1, 0, 0, 1, 1,
0.03220907, 0.3266998, 0.9465317, 1, 0, 0, 1, 1,
0.03632901, -1.185126, 2.470306, 1, 0, 0, 1, 1,
0.03780423, -0.9903765, 4.091885, 1, 0, 0, 1, 1,
0.03962322, 1.666789, 0.1330679, 1, 0, 0, 1, 1,
0.04024513, 0.6056439, 1.434145, 0, 0, 0, 1, 1,
0.04293075, -2.164337, 3.818319, 0, 0, 0, 1, 1,
0.0429984, -0.02061801, 2.020735, 0, 0, 0, 1, 1,
0.04382646, -1.253917, 2.806102, 0, 0, 0, 1, 1,
0.04408598, -0.4432229, 3.172148, 0, 0, 0, 1, 1,
0.04522397, 0.885878, 1.348373, 0, 0, 0, 1, 1,
0.04870548, -0.2140631, 3.299968, 0, 0, 0, 1, 1,
0.05320797, 0.5927634, 0.2958248, 1, 1, 1, 1, 1,
0.05369493, 0.4809446, 0.6515608, 1, 1, 1, 1, 1,
0.05377408, 0.3276363, -0.1446066, 1, 1, 1, 1, 1,
0.0574378, -0.5582097, 4.65827, 1, 1, 1, 1, 1,
0.06047523, 0.3223333, 2.171896, 1, 1, 1, 1, 1,
0.06155528, 1.024333, 0.05772475, 1, 1, 1, 1, 1,
0.06776933, 1.587621, -0.389692, 1, 1, 1, 1, 1,
0.06832401, 0.05067785, 0.1086507, 1, 1, 1, 1, 1,
0.06986456, 0.5529184, 0.3578887, 1, 1, 1, 1, 1,
0.07581812, 0.7773769, 0.1785766, 1, 1, 1, 1, 1,
0.08732256, 1.097839, 2.930952, 1, 1, 1, 1, 1,
0.08898529, -1.86269, 3.175663, 1, 1, 1, 1, 1,
0.08984753, -0.7308629, 2.552409, 1, 1, 1, 1, 1,
0.09020267, 1.158364, 0.4707869, 1, 1, 1, 1, 1,
0.09066971, -0.6416322, 1.250698, 1, 1, 1, 1, 1,
0.09075663, -0.9552683, 4.372874, 0, 0, 1, 1, 1,
0.09180637, 1.828541, -0.3716062, 1, 0, 0, 1, 1,
0.0998705, -0.5645934, 3.856958, 1, 0, 0, 1, 1,
0.1005044, 0.2939224, -0.02090156, 1, 0, 0, 1, 1,
0.1016365, -1.082899, 3.365943, 1, 0, 0, 1, 1,
0.1023416, 0.3894232, -0.3600392, 1, 0, 0, 1, 1,
0.1037058, 0.5541126, 0.6759153, 0, 0, 0, 1, 1,
0.1050503, 1.459764, 0.7839993, 0, 0, 0, 1, 1,
0.1072117, -1.425051, 2.669756, 0, 0, 0, 1, 1,
0.110236, -2.884675, 5.057351, 0, 0, 0, 1, 1,
0.112453, 0.8148605, 0.6117378, 0, 0, 0, 1, 1,
0.1128364, -1.071215, 5.02554, 0, 0, 0, 1, 1,
0.1158633, 0.4999159, 0.6000847, 0, 0, 0, 1, 1,
0.1180774, 1.612734, -0.4354009, 1, 1, 1, 1, 1,
0.1200631, -1.378887, 2.163751, 1, 1, 1, 1, 1,
0.1200775, -2.00352, 2.903824, 1, 1, 1, 1, 1,
0.1205124, -0.3361985, 3.292939, 1, 1, 1, 1, 1,
0.1205959, 0.9101986, 0.4337657, 1, 1, 1, 1, 1,
0.1267158, -0.4661671, 3.216046, 1, 1, 1, 1, 1,
0.126991, -1.189817, 5.403725, 1, 1, 1, 1, 1,
0.1302143, -0.8417472, 3.700492, 1, 1, 1, 1, 1,
0.1316934, -0.5567856, 1.043942, 1, 1, 1, 1, 1,
0.134759, 1.000863, 0.3664773, 1, 1, 1, 1, 1,
0.1354061, 0.4441051, -0.02935692, 1, 1, 1, 1, 1,
0.1386604, -0.5271572, 3.683927, 1, 1, 1, 1, 1,
0.1397326, 0.5190883, -0.736791, 1, 1, 1, 1, 1,
0.1468118, -2.008618, 3.928595, 1, 1, 1, 1, 1,
0.1476116, 1.20148, 2.065573, 1, 1, 1, 1, 1,
0.1537675, -0.4110288, 1.26018, 0, 0, 1, 1, 1,
0.1537722, 0.4734063, -0.6362945, 1, 0, 0, 1, 1,
0.1576035, 1.588878, 0.2120914, 1, 0, 0, 1, 1,
0.1654824, 0.2104499, -1.074461, 1, 0, 0, 1, 1,
0.1682291, -0.7119111, 2.144262, 1, 0, 0, 1, 1,
0.1686108, 0.7859339, 0.5325142, 1, 0, 0, 1, 1,
0.1711433, -1.296201, 3.31591, 0, 0, 0, 1, 1,
0.1738117, 0.2617617, 2.717625, 0, 0, 0, 1, 1,
0.1757736, -0.6746082, 2.808728, 0, 0, 0, 1, 1,
0.1766779, -1.085659, 2.969643, 0, 0, 0, 1, 1,
0.1842518, 0.3174058, 0.3797901, 0, 0, 0, 1, 1,
0.1843012, 0.8076315, -0.1577925, 0, 0, 0, 1, 1,
0.1871, 0.008349392, 0.9366533, 0, 0, 0, 1, 1,
0.1936608, 0.8383369, 0.831004, 1, 1, 1, 1, 1,
0.1959766, 1.15512, -1.600057, 1, 1, 1, 1, 1,
0.1963836, -0.3608018, 3.337459, 1, 1, 1, 1, 1,
0.2041857, -1.159428, 3.963185, 1, 1, 1, 1, 1,
0.2064939, 0.3726703, 0.2047009, 1, 1, 1, 1, 1,
0.2072806, 0.8753592, -1.243255, 1, 1, 1, 1, 1,
0.2093467, -0.4875504, 2.254999, 1, 1, 1, 1, 1,
0.2128506, 0.1630768, -0.7744763, 1, 1, 1, 1, 1,
0.2136626, -0.2789704, 2.922466, 1, 1, 1, 1, 1,
0.2156228, 0.199411, 3.021616, 1, 1, 1, 1, 1,
0.2169603, 1.479558, -0.1675599, 1, 1, 1, 1, 1,
0.219164, -0.1433511, 0.427757, 1, 1, 1, 1, 1,
0.2205407, 1.729789, 2.355621, 1, 1, 1, 1, 1,
0.2214806, -1.668252, 1.50294, 1, 1, 1, 1, 1,
0.2272915, 1.893167, -0.2874817, 1, 1, 1, 1, 1,
0.2278116, -1.518273, 2.508215, 0, 0, 1, 1, 1,
0.2294947, -0.008161491, 2.483179, 1, 0, 0, 1, 1,
0.2312939, -1.246289, 1.012744, 1, 0, 0, 1, 1,
0.2346466, 0.6497581, 1.499774, 1, 0, 0, 1, 1,
0.236474, -0.4341171, 2.59647, 1, 0, 0, 1, 1,
0.2374359, -0.2190316, 3.485441, 1, 0, 0, 1, 1,
0.2426053, -3.216284, 2.035171, 0, 0, 0, 1, 1,
0.243471, -1.501919, 2.709257, 0, 0, 0, 1, 1,
0.2471983, -1.262343, 0.4390052, 0, 0, 0, 1, 1,
0.2483261, 1.336885, 0.6697373, 0, 0, 0, 1, 1,
0.2503077, 0.8051783, -0.7924105, 0, 0, 0, 1, 1,
0.2536519, 0.2046954, 2.732766, 0, 0, 0, 1, 1,
0.2565858, -1.054671, 4.183562, 0, 0, 0, 1, 1,
0.2566298, 1.395347, 0.4059793, 1, 1, 1, 1, 1,
0.2611063, 1.055912, 0.7360613, 1, 1, 1, 1, 1,
0.2615619, 1.089272, -0.4837586, 1, 1, 1, 1, 1,
0.2619923, -0.4055745, 2.741295, 1, 1, 1, 1, 1,
0.2660537, -2.017862, 2.916703, 1, 1, 1, 1, 1,
0.2662577, 0.4165369, -0.06992477, 1, 1, 1, 1, 1,
0.2684681, 0.8861542, 1.698155, 1, 1, 1, 1, 1,
0.2697729, 0.3112983, -1.574315, 1, 1, 1, 1, 1,
0.2712866, -1.415404, 3.029362, 1, 1, 1, 1, 1,
0.2721, -1.721082, 1.164979, 1, 1, 1, 1, 1,
0.2747761, -0.4380145, 2.153075, 1, 1, 1, 1, 1,
0.2781488, -0.4833813, 3.839741, 1, 1, 1, 1, 1,
0.2820725, -0.6014149, 4.058991, 1, 1, 1, 1, 1,
0.2823758, 0.7860581, 0.4419179, 1, 1, 1, 1, 1,
0.2842695, -1.224103, 1.665697, 1, 1, 1, 1, 1,
0.2842781, -1.042624, 3.401545, 0, 0, 1, 1, 1,
0.2851524, -0.6353975, 3.324623, 1, 0, 0, 1, 1,
0.2853183, 0.4139364, -0.3640806, 1, 0, 0, 1, 1,
0.2871586, 0.9956478, -0.06326389, 1, 0, 0, 1, 1,
0.2875615, 0.6782848, -0.9894045, 1, 0, 0, 1, 1,
0.2949582, 0.96677, -0.564868, 1, 0, 0, 1, 1,
0.2949848, 0.03459739, 2.21423, 0, 0, 0, 1, 1,
0.2967676, -0.3733565, 2.851808, 0, 0, 0, 1, 1,
0.2972979, -0.4860868, 2.549341, 0, 0, 0, 1, 1,
0.2983945, -0.3656045, 3.690176, 0, 0, 0, 1, 1,
0.306012, 1.350627, -1.190537, 0, 0, 0, 1, 1,
0.3123118, 1.502088, 0.8351549, 0, 0, 0, 1, 1,
0.3172822, 1.342185, -1.573798, 0, 0, 0, 1, 1,
0.3174317, -0.2917112, 4.805848, 1, 1, 1, 1, 1,
0.3207325, 0.06763209, 2.03746, 1, 1, 1, 1, 1,
0.3208854, -2.134815, 2.365741, 1, 1, 1, 1, 1,
0.3217982, 1.438103, 1.422627, 1, 1, 1, 1, 1,
0.3262368, -0.9489945, 2.079914, 1, 1, 1, 1, 1,
0.3305459, 0.1342284, 0.8672405, 1, 1, 1, 1, 1,
0.3310621, -1.029307, 1.105412, 1, 1, 1, 1, 1,
0.331141, -0.01354586, 0.2260944, 1, 1, 1, 1, 1,
0.3332216, 0.494174, -0.01910602, 1, 1, 1, 1, 1,
0.3377915, 1.133057, 0.8419207, 1, 1, 1, 1, 1,
0.3388945, 1.741467, 0.5726993, 1, 1, 1, 1, 1,
0.3395706, -1.957803, 2.258793, 1, 1, 1, 1, 1,
0.3396642, 1.507773, 0.6546624, 1, 1, 1, 1, 1,
0.3446633, 0.6074555, 0.8463036, 1, 1, 1, 1, 1,
0.3532282, 0.4512887, 0.1914372, 1, 1, 1, 1, 1,
0.3533641, -0.5176312, 1.453315, 0, 0, 1, 1, 1,
0.3539128, 0.2999569, -1.015073, 1, 0, 0, 1, 1,
0.3648211, -0.02984063, 1.462451, 1, 0, 0, 1, 1,
0.3706602, -1.727005, 2.190527, 1, 0, 0, 1, 1,
0.3815208, -1.140875, 3.860938, 1, 0, 0, 1, 1,
0.3816054, -1.969353, 3.442405, 1, 0, 0, 1, 1,
0.3843219, 1.83789, 0.4840582, 0, 0, 0, 1, 1,
0.3912952, -1.181034, 2.339672, 0, 0, 0, 1, 1,
0.3954246, 0.002494074, 1.810758, 0, 0, 0, 1, 1,
0.3968484, 0.2206143, 1.145979, 0, 0, 0, 1, 1,
0.3986228, 1.219864, 1.153033, 0, 0, 0, 1, 1,
0.4002823, -1.384044, 1.246398, 0, 0, 0, 1, 1,
0.4008994, -0.3925339, 3.447568, 0, 0, 0, 1, 1,
0.401085, 0.3239935, 2.43642, 1, 1, 1, 1, 1,
0.4023175, -0.7442107, 2.285248, 1, 1, 1, 1, 1,
0.4034855, 0.3154661, 2.10405, 1, 1, 1, 1, 1,
0.4114773, 0.2892538, 1.631855, 1, 1, 1, 1, 1,
0.4138904, 0.0689678, 0.8868138, 1, 1, 1, 1, 1,
0.4187263, -0.453451, 2.160673, 1, 1, 1, 1, 1,
0.4189193, -0.8146277, 4.077801, 1, 1, 1, 1, 1,
0.4220802, -1.305369, 3.8719, 1, 1, 1, 1, 1,
0.4234921, -1.37129, 2.904727, 1, 1, 1, 1, 1,
0.4285715, 0.4924641, 0.1612333, 1, 1, 1, 1, 1,
0.4333068, -0.371257, 2.455548, 1, 1, 1, 1, 1,
0.4375908, 0.2469963, 0.5973855, 1, 1, 1, 1, 1,
0.4446812, -1.481196, 2.482328, 1, 1, 1, 1, 1,
0.445193, -0.3248287, 1.68885, 1, 1, 1, 1, 1,
0.4488778, 0.4324367, -0.9736027, 1, 1, 1, 1, 1,
0.4497855, 0.249855, 0.5875446, 0, 0, 1, 1, 1,
0.4557399, 0.6667558, 0.8093039, 1, 0, 0, 1, 1,
0.4614723, -0.7095336, 0.1644656, 1, 0, 0, 1, 1,
0.4713641, 0.4834172, 0.08393493, 1, 0, 0, 1, 1,
0.4722537, 0.4491247, 1.000086, 1, 0, 0, 1, 1,
0.4731164, -2.802836, 3.700583, 1, 0, 0, 1, 1,
0.4741917, 1.354285, 0.2781097, 0, 0, 0, 1, 1,
0.4756223, -0.3326695, 2.960762, 0, 0, 0, 1, 1,
0.4764498, -0.008956103, 0.4620968, 0, 0, 0, 1, 1,
0.4768312, 0.7224453, 1.340513, 0, 0, 0, 1, 1,
0.4777975, 0.6561254, 0.6822517, 0, 0, 0, 1, 1,
0.4779135, 0.004963872, 1.988347, 0, 0, 0, 1, 1,
0.4796019, 1.30751, -0.782595, 0, 0, 0, 1, 1,
0.4802065, 1.073449, 1.903792, 1, 1, 1, 1, 1,
0.4810715, 0.4993865, 2.658387, 1, 1, 1, 1, 1,
0.481722, 0.7771636, 0.7820686, 1, 1, 1, 1, 1,
0.48177, 1.611447, -0.3313427, 1, 1, 1, 1, 1,
0.4835227, 1.003008, 0.3420193, 1, 1, 1, 1, 1,
0.4846372, 0.2458068, 0.09115812, 1, 1, 1, 1, 1,
0.4852926, -0.3686343, 0.2350859, 1, 1, 1, 1, 1,
0.4899003, -0.7235764, 2.411745, 1, 1, 1, 1, 1,
0.4915133, 1.143215, 0.01879181, 1, 1, 1, 1, 1,
0.4937342, -0.6024413, 3.283717, 1, 1, 1, 1, 1,
0.4985473, 0.2919493, 1.289451, 1, 1, 1, 1, 1,
0.4988074, 0.2628922, 0.7716982, 1, 1, 1, 1, 1,
0.4992048, -0.110305, 1.918646, 1, 1, 1, 1, 1,
0.5042607, 1.559355, -1.211514, 1, 1, 1, 1, 1,
0.5057155, -0.350796, 2.19996, 1, 1, 1, 1, 1,
0.506424, -1.680991, 3.148828, 0, 0, 1, 1, 1,
0.5065529, -0.1220856, 3.649479, 1, 0, 0, 1, 1,
0.5066884, 0.2700856, 0.5848506, 1, 0, 0, 1, 1,
0.5114021, 0.8268504, 0.1179768, 1, 0, 0, 1, 1,
0.5184645, -0.06695429, 2.443931, 1, 0, 0, 1, 1,
0.522381, 0.4151746, 1.319533, 1, 0, 0, 1, 1,
0.5246202, 0.4393291, 1.359743, 0, 0, 0, 1, 1,
0.5283864, 0.5362442, 0.6885286, 0, 0, 0, 1, 1,
0.5299991, -1.375382, 3.227339, 0, 0, 0, 1, 1,
0.5346978, -0.8413256, 2.491776, 0, 0, 0, 1, 1,
0.5378726, -0.5164762, 2.689547, 0, 0, 0, 1, 1,
0.539335, 0.4820899, 0.7623334, 0, 0, 0, 1, 1,
0.5398763, -0.6381248, 1.023401, 0, 0, 0, 1, 1,
0.5418577, -0.611315, 2.079242, 1, 1, 1, 1, 1,
0.5424104, 2.172604, 0.9183713, 1, 1, 1, 1, 1,
0.5513968, -1.452545, 4.485958, 1, 1, 1, 1, 1,
0.5526643, -1.336945, 2.248192, 1, 1, 1, 1, 1,
0.554981, 0.01897221, 1.645073, 1, 1, 1, 1, 1,
0.5577466, 0.969774, -0.5939642, 1, 1, 1, 1, 1,
0.5610477, 1.543359, 0.488925, 1, 1, 1, 1, 1,
0.563686, 0.5118616, 1.289821, 1, 1, 1, 1, 1,
0.5652515, 0.4144307, 2.206462, 1, 1, 1, 1, 1,
0.5719116, 1.398246, 0.4744672, 1, 1, 1, 1, 1,
0.577247, -0.3489468, -0.5510109, 1, 1, 1, 1, 1,
0.5793984, -1.233868, 1.88948, 1, 1, 1, 1, 1,
0.5796482, -0.3041267, 2.406396, 1, 1, 1, 1, 1,
0.5804692, -1.150519, 2.053493, 1, 1, 1, 1, 1,
0.5821502, 1.87005, -0.6599473, 1, 1, 1, 1, 1,
0.5822259, 0.2350753, 1.127501, 0, 0, 1, 1, 1,
0.5831745, -0.01921296, 2.039493, 1, 0, 0, 1, 1,
0.5838642, -0.6878104, 3.661937, 1, 0, 0, 1, 1,
0.5854, 2.361145, -0.386141, 1, 0, 0, 1, 1,
0.5933617, 0.511662, 0.8178563, 1, 0, 0, 1, 1,
0.5962992, 0.3117245, 0.334253, 1, 0, 0, 1, 1,
0.5987737, -1.534536, 4.650709, 0, 0, 0, 1, 1,
0.5996432, 0.3992598, 1.281566, 0, 0, 0, 1, 1,
0.599907, 0.9997658, 0.1531793, 0, 0, 0, 1, 1,
0.602139, 1.23154, 1.071118, 0, 0, 0, 1, 1,
0.6034297, -1.129956, 2.76239, 0, 0, 0, 1, 1,
0.6175519, -0.06735113, 3.811921, 0, 0, 0, 1, 1,
0.6176009, -0.1982309, 2.370202, 0, 0, 0, 1, 1,
0.6239289, 0.3895766, 1.015557, 1, 1, 1, 1, 1,
0.6261349, 0.1367479, 1.425919, 1, 1, 1, 1, 1,
0.6295884, -1.049556, 1.849979, 1, 1, 1, 1, 1,
0.6301605, 1.64045, -0.1353168, 1, 1, 1, 1, 1,
0.6335583, 2.06924, 0.7879562, 1, 1, 1, 1, 1,
0.6357189, 0.864292, 0.1892501, 1, 1, 1, 1, 1,
0.6372697, 1.008821, 1.859082, 1, 1, 1, 1, 1,
0.6374549, 0.03857659, 1.122574, 1, 1, 1, 1, 1,
0.6420851, -0.003117258, 2.594465, 1, 1, 1, 1, 1,
0.6432877, 0.8939828, -0.09375565, 1, 1, 1, 1, 1,
0.6437141, -1.900683, 3.546452, 1, 1, 1, 1, 1,
0.6451406, 1.747898, 0.1393744, 1, 1, 1, 1, 1,
0.6463249, 1.731164, 0.02329359, 1, 1, 1, 1, 1,
0.6511745, 1.654076, 0.1718082, 1, 1, 1, 1, 1,
0.6538591, 1.532405, -0.1618308, 1, 1, 1, 1, 1,
0.6550005, -0.03179772, 1.869224, 0, 0, 1, 1, 1,
0.6555134, -0.262683, 2.342902, 1, 0, 0, 1, 1,
0.664847, 0.1322239, 0.4828597, 1, 0, 0, 1, 1,
0.6716084, 0.7672814, -0.1378508, 1, 0, 0, 1, 1,
0.6726801, 1.809475, 0.3043503, 1, 0, 0, 1, 1,
0.6731743, -0.7345233, 1.925324, 1, 0, 0, 1, 1,
0.6835727, 0.02593817, 0.9538915, 0, 0, 0, 1, 1,
0.6845728, 1.050296, -0.2893378, 0, 0, 0, 1, 1,
0.6880704, -0.2121976, 1.224032, 0, 0, 0, 1, 1,
0.6885415, 0.4952828, -0.01322043, 0, 0, 0, 1, 1,
0.6971647, -1.017233, 1.300865, 0, 0, 0, 1, 1,
0.6994332, 0.4667749, -0.420512, 0, 0, 0, 1, 1,
0.7004172, 0.3373424, 2.7218, 0, 0, 0, 1, 1,
0.7037052, -0.3717276, 2.87478, 1, 1, 1, 1, 1,
0.7100316, 0.09081104, 0.1718227, 1, 1, 1, 1, 1,
0.7112641, -0.2198425, 1.188599, 1, 1, 1, 1, 1,
0.7159994, 0.8145354, -0.8426764, 1, 1, 1, 1, 1,
0.7170856, 0.238615, 0.6087763, 1, 1, 1, 1, 1,
0.7192534, -0.4608658, 2.202139, 1, 1, 1, 1, 1,
0.7212086, 0.9711334, 1.249301, 1, 1, 1, 1, 1,
0.7249734, 0.3087113, 0.3321779, 1, 1, 1, 1, 1,
0.7254341, 0.236008, 0.6684052, 1, 1, 1, 1, 1,
0.7256177, -0.6858963, -0.8746092, 1, 1, 1, 1, 1,
0.7321558, 0.0419676, 1.148108, 1, 1, 1, 1, 1,
0.7322385, 0.04358583, 1.320958, 1, 1, 1, 1, 1,
0.7335979, -0.04603504, 1.227022, 1, 1, 1, 1, 1,
0.7342068, 0.1756445, 3.189323, 1, 1, 1, 1, 1,
0.7348016, 0.0416127, 2.445514, 1, 1, 1, 1, 1,
0.7352032, -1.366277, 2.373373, 0, 0, 1, 1, 1,
0.7406307, 1.521013, 1.202798, 1, 0, 0, 1, 1,
0.7425042, 1.06901, 0.6343712, 1, 0, 0, 1, 1,
0.7432028, -0.6661223, 1.999149, 1, 0, 0, 1, 1,
0.7469969, -1.080633, 0.9887626, 1, 0, 0, 1, 1,
0.7510673, -0.3244833, 1.916512, 1, 0, 0, 1, 1,
0.7535715, -0.4387627, 0.5958196, 0, 0, 0, 1, 1,
0.7587028, -0.2406397, 0.5482039, 0, 0, 0, 1, 1,
0.7628722, 1.655125, 2.598897, 0, 0, 0, 1, 1,
0.7688105, 0.04963732, 1.476958, 0, 0, 0, 1, 1,
0.7717674, 0.2290383, 1.670264, 0, 0, 0, 1, 1,
0.7723665, 1.306733, -0.1806877, 0, 0, 0, 1, 1,
0.7778126, -0.5452904, 2.814751, 0, 0, 0, 1, 1,
0.7794662, -1.118244, 3.50856, 1, 1, 1, 1, 1,
0.7852173, 0.2261988, 0.3050624, 1, 1, 1, 1, 1,
0.7897882, 1.078593, 0.8261505, 1, 1, 1, 1, 1,
0.7905636, 0.2231096, 1.823604, 1, 1, 1, 1, 1,
0.7921468, 0.7331175, 0.007078073, 1, 1, 1, 1, 1,
0.7950771, 0.1912458, 3.173625, 1, 1, 1, 1, 1,
0.800602, -0.9461509, 2.246893, 1, 1, 1, 1, 1,
0.8051174, -0.4247408, 2.938101, 1, 1, 1, 1, 1,
0.805775, 0.7887474, 0.849584, 1, 1, 1, 1, 1,
0.8109311, 0.03288994, -1.04429, 1, 1, 1, 1, 1,
0.8129608, -0.6262386, 3.083597, 1, 1, 1, 1, 1,
0.828809, -1.420598, 4.418207, 1, 1, 1, 1, 1,
0.8317127, -1.617387, 2.388882, 1, 1, 1, 1, 1,
0.8404225, -0.4172208, 2.297678, 1, 1, 1, 1, 1,
0.8427228, -0.004018137, 2.024537, 1, 1, 1, 1, 1,
0.8453422, -0.5408896, 3.39706, 0, 0, 1, 1, 1,
0.8458425, -1.309304, 2.463467, 1, 0, 0, 1, 1,
0.8565745, 1.229762, 1.51358, 1, 0, 0, 1, 1,
0.8569525, 0.3565128, -0.0465575, 1, 0, 0, 1, 1,
0.8593041, -1.842861, 2.003233, 1, 0, 0, 1, 1,
0.8654302, 1.312939, 1.768196, 1, 0, 0, 1, 1,
0.8697017, -1.960705, 1.178009, 0, 0, 0, 1, 1,
0.8697748, -0.7114584, 2.07724, 0, 0, 0, 1, 1,
0.871264, 0.3663146, 1.4811, 0, 0, 0, 1, 1,
0.8819131, -0.2031, 2.623269, 0, 0, 0, 1, 1,
0.8820947, -0.3440251, 0.1810616, 0, 0, 0, 1, 1,
0.8825533, 1.271742, -1.038629, 0, 0, 0, 1, 1,
0.8837738, -0.8873239, 1.397693, 0, 0, 0, 1, 1,
0.8851076, 0.3370936, 1.074861, 1, 1, 1, 1, 1,
0.8879318, 0.7791184, -0.8052714, 1, 1, 1, 1, 1,
0.8910177, -0.9632967, 3.211279, 1, 1, 1, 1, 1,
0.8911058, 1.143116, 0.02800747, 1, 1, 1, 1, 1,
0.8911853, 0.4937098, 0.5403426, 1, 1, 1, 1, 1,
0.8972321, 1.110088, 0.9797305, 1, 1, 1, 1, 1,
0.8987167, 0.8996747, 1.021859, 1, 1, 1, 1, 1,
0.9028739, -0.9418446, 1.885784, 1, 1, 1, 1, 1,
0.9052485, -1.552301, 3.335374, 1, 1, 1, 1, 1,
0.9088194, 0.9644474, -0.8682919, 1, 1, 1, 1, 1,
0.9158061, -0.3918497, 2.317273, 1, 1, 1, 1, 1,
0.9161313, -1.763043, 1.116839, 1, 1, 1, 1, 1,
0.9228765, -0.3533475, 2.532525, 1, 1, 1, 1, 1,
0.9238541, -0.2348772, 1.162926, 1, 1, 1, 1, 1,
0.9252697, 0.3867343, 1.414945, 1, 1, 1, 1, 1,
0.9254621, -2.419409, 3.113359, 0, 0, 1, 1, 1,
0.9331304, 1.081715, -0.4801535, 1, 0, 0, 1, 1,
0.9339997, -1.138575, 3.016059, 1, 0, 0, 1, 1,
0.9350612, 0.3112574, -0.1664108, 1, 0, 0, 1, 1,
0.9448329, 0.03876831, 1.635707, 1, 0, 0, 1, 1,
0.9493787, 0.7677771, 0.2217839, 1, 0, 0, 1, 1,
0.949426, 1.793891, 0.09806654, 0, 0, 0, 1, 1,
0.9502837, -0.7284283, 1.644149, 0, 0, 0, 1, 1,
0.9525674, -1.592696, 3.747168, 0, 0, 0, 1, 1,
0.9653381, 0.3615648, 0.4467892, 0, 0, 0, 1, 1,
0.9776587, 0.8870759, 1.00528, 0, 0, 0, 1, 1,
0.9781417, 0.1387966, -0.2669926, 0, 0, 0, 1, 1,
0.9791368, 0.7834638, 1.360643, 0, 0, 0, 1, 1,
0.986654, 0.06246909, 1.282503, 1, 1, 1, 1, 1,
0.9887613, 1.71769, 1.960177, 1, 1, 1, 1, 1,
0.9947402, 0.2527547, 1.008187, 1, 1, 1, 1, 1,
1.006474, 2.125363, -0.5465729, 1, 1, 1, 1, 1,
1.006952, -0.9535346, 3.5224, 1, 1, 1, 1, 1,
1.008852, 2.337471, 2.172966, 1, 1, 1, 1, 1,
1.008966, -0.2527611, 2.730208, 1, 1, 1, 1, 1,
1.009625, -1.056914, 3.351717, 1, 1, 1, 1, 1,
1.0117, -0.08470114, 1.113046, 1, 1, 1, 1, 1,
1.015386, -1.345457, 4.075487, 1, 1, 1, 1, 1,
1.021702, -0.4672357, 1.74178, 1, 1, 1, 1, 1,
1.022594, -0.6862904, 2.463601, 1, 1, 1, 1, 1,
1.025471, -0.6886098, 2.324566, 1, 1, 1, 1, 1,
1.031258, -1.56159, 3.075103, 1, 1, 1, 1, 1,
1.034536, -0.3166145, 1.779664, 1, 1, 1, 1, 1,
1.035844, 0.4348053, 1.104941, 0, 0, 1, 1, 1,
1.039069, 0.8898137, 1.185257, 1, 0, 0, 1, 1,
1.041037, 1.067171, 0.4940005, 1, 0, 0, 1, 1,
1.044478, -0.9220848, 4.562598, 1, 0, 0, 1, 1,
1.047603, 0.3363391, 2.236816, 1, 0, 0, 1, 1,
1.053217, 1.176957, 0.6318598, 1, 0, 0, 1, 1,
1.056489, -0.8479378, 2.173086, 0, 0, 0, 1, 1,
1.056754, -2.078192, 3.411956, 0, 0, 0, 1, 1,
1.059543, 1.364908, 0.5064685, 0, 0, 0, 1, 1,
1.06163, 0.9529584, 0.6246986, 0, 0, 0, 1, 1,
1.061841, 0.2592476, 0.3960973, 0, 0, 0, 1, 1,
1.076002, -1.017719, 3.130839, 0, 0, 0, 1, 1,
1.079084, 0.1760608, 2.008888, 0, 0, 0, 1, 1,
1.079205, -0.3201165, -0.03937329, 1, 1, 1, 1, 1,
1.07982, 1.304182, 1.602646, 1, 1, 1, 1, 1,
1.102362, 0.3802915, 1.857623, 1, 1, 1, 1, 1,
1.103285, 0.511709, 3.532677, 1, 1, 1, 1, 1,
1.10824, -0.7397001, 1.067642, 1, 1, 1, 1, 1,
1.111763, 1.503459, -0.0121962, 1, 1, 1, 1, 1,
1.11606, -1.600929, 3.589533, 1, 1, 1, 1, 1,
1.124229, 1.398001, 0.4670215, 1, 1, 1, 1, 1,
1.126146, 0.1518203, 1.898433, 1, 1, 1, 1, 1,
1.127164, 0.606881, 1.008395, 1, 1, 1, 1, 1,
1.128884, 0.09395423, -0.1956777, 1, 1, 1, 1, 1,
1.142768, 0.9126391, 0.2274992, 1, 1, 1, 1, 1,
1.159728, 0.2551113, 2.352073, 1, 1, 1, 1, 1,
1.169363, 0.4314689, 3.255126, 1, 1, 1, 1, 1,
1.179039, -0.6996957, 0.6879387, 1, 1, 1, 1, 1,
1.18316, 0.5778373, 0.2574109, 0, 0, 1, 1, 1,
1.195722, 2.093806, 1.526313, 1, 0, 0, 1, 1,
1.199408, 1.667146, 0.8590252, 1, 0, 0, 1, 1,
1.20415, 0.02347064, 2.785206, 1, 0, 0, 1, 1,
1.208609, 0.5225647, -1.342201, 1, 0, 0, 1, 1,
1.22512, 1.571675, 0.9455158, 1, 0, 0, 1, 1,
1.225457, -0.41034, 4.270429, 0, 0, 0, 1, 1,
1.233152, 0.7697666, -0.3400931, 0, 0, 0, 1, 1,
1.238131, -0.6271086, 2.915561, 0, 0, 0, 1, 1,
1.23894, 1.3624, 0.4891351, 0, 0, 0, 1, 1,
1.24131, -0.7604833, 1.451457, 0, 0, 0, 1, 1,
1.24489, -0.8201339, 3.059558, 0, 0, 0, 1, 1,
1.25672, 1.377286, -0.04074711, 0, 0, 0, 1, 1,
1.292814, -0.5138204, -1.509567, 1, 1, 1, 1, 1,
1.295666, -0.3972538, 2.594064, 1, 1, 1, 1, 1,
1.296988, 2.069405, 0.3962974, 1, 1, 1, 1, 1,
1.301695, -1.863696, 2.546964, 1, 1, 1, 1, 1,
1.306588, -0.9926504, 3.208626, 1, 1, 1, 1, 1,
1.311971, 0.4429564, 0.1024501, 1, 1, 1, 1, 1,
1.313472, -1.592312, 3.22509, 1, 1, 1, 1, 1,
1.322959, 0.9489932, 0.7652457, 1, 1, 1, 1, 1,
1.332906, -0.7231585, 1.447541, 1, 1, 1, 1, 1,
1.334869, -0.6893963, 2.120481, 1, 1, 1, 1, 1,
1.337682, -1.684375, 1.356221, 1, 1, 1, 1, 1,
1.337802, 0.7877874, -0.5313309, 1, 1, 1, 1, 1,
1.354922, 0.2288183, 3.055032, 1, 1, 1, 1, 1,
1.36069, -1.414202, 3.685934, 1, 1, 1, 1, 1,
1.372677, -1.13784, 2.2996, 1, 1, 1, 1, 1,
1.37281, 1.222045, 1.277569, 0, 0, 1, 1, 1,
1.372977, -1.854978, 2.257723, 1, 0, 0, 1, 1,
1.39121, -0.5528172, 1.32574, 1, 0, 0, 1, 1,
1.391593, 0.5559912, 1.380154, 1, 0, 0, 1, 1,
1.394228, -0.1972327, 0.7920293, 1, 0, 0, 1, 1,
1.40808, 0.2653349, 0.3458202, 1, 0, 0, 1, 1,
1.411605, -0.6421474, 0.1321628, 0, 0, 0, 1, 1,
1.412343, 0.7219405, -0.161904, 0, 0, 0, 1, 1,
1.417448, -2.245865, 3.066161, 0, 0, 0, 1, 1,
1.420507, 0.8038626, 0.9801531, 0, 0, 0, 1, 1,
1.452666, -1.375876, 2.706414, 0, 0, 0, 1, 1,
1.452762, 0.1483472, 1.175527, 0, 0, 0, 1, 1,
1.471496, 1.256007, -0.4728397, 0, 0, 0, 1, 1,
1.47797, -0.4368575, 3.708385, 1, 1, 1, 1, 1,
1.487298, -0.03210959, 3.224104, 1, 1, 1, 1, 1,
1.489164, 1.390768, 0.1677756, 1, 1, 1, 1, 1,
1.492349, 0.09832895, 1.20085, 1, 1, 1, 1, 1,
1.493761, -1.046492, 2.254801, 1, 1, 1, 1, 1,
1.497507, -0.140394, 2.987018, 1, 1, 1, 1, 1,
1.508353, 0.02973678, 2.611807, 1, 1, 1, 1, 1,
1.510364, 1.550949, 0.2340411, 1, 1, 1, 1, 1,
1.511572, 0.3385498, 0.6364504, 1, 1, 1, 1, 1,
1.529123, -1.046094, 3.026167, 1, 1, 1, 1, 1,
1.549656, -2.052135, 3.568251, 1, 1, 1, 1, 1,
1.552162, 1.633122, 0.9867812, 1, 1, 1, 1, 1,
1.577721, -0.2907625, 2.548364, 1, 1, 1, 1, 1,
1.601659, -0.7626139, 3.070054, 1, 1, 1, 1, 1,
1.618592, 2.022954, -2.10264, 1, 1, 1, 1, 1,
1.618619, -1.273909, 2.696015, 0, 0, 1, 1, 1,
1.633258, -0.5284035, 3.501722, 1, 0, 0, 1, 1,
1.638345, 0.07634582, 1.689423, 1, 0, 0, 1, 1,
1.655603, 0.3271416, 1.804709, 1, 0, 0, 1, 1,
1.667247, 1.527561, 0.6010461, 1, 0, 0, 1, 1,
1.66793, 0.006837442, 0.5203283, 1, 0, 0, 1, 1,
1.671197, -0.2371341, 3.426991, 0, 0, 0, 1, 1,
1.696172, -0.1031775, 0.09505041, 0, 0, 0, 1, 1,
1.697855, -1.322096, 1.829795, 0, 0, 0, 1, 1,
1.708225, -1.192092, 1.968446, 0, 0, 0, 1, 1,
1.710001, -1.706563, 4.728148, 0, 0, 0, 1, 1,
1.717784, 0.5727641, 0.5762406, 0, 0, 0, 1, 1,
1.725491, -0.5350527, 1.330492, 0, 0, 0, 1, 1,
1.730956, 0.5766959, 1.450554, 1, 1, 1, 1, 1,
1.760899, -1.091163, 2.250952, 1, 1, 1, 1, 1,
1.761802, -0.440576, 2.430694, 1, 1, 1, 1, 1,
1.768578, 0.4141789, -0.7351124, 1, 1, 1, 1, 1,
1.77902, 0.4529333, 1.69643, 1, 1, 1, 1, 1,
1.787217, 1.918743, -0.2024287, 1, 1, 1, 1, 1,
1.795059, 1.532763, 2.07672, 1, 1, 1, 1, 1,
1.817532, -1.949962, 1.091088, 1, 1, 1, 1, 1,
1.823955, -0.1196126, 2.298657, 1, 1, 1, 1, 1,
1.829962, -0.135447, 0.4057364, 1, 1, 1, 1, 1,
1.831429, -0.4862621, 1.098277, 1, 1, 1, 1, 1,
1.832251, 1.80439, 1.159643, 1, 1, 1, 1, 1,
1.834872, 0.5303791, 1.843753, 1, 1, 1, 1, 1,
1.845678, -0.9932323, 1.380167, 1, 1, 1, 1, 1,
1.849236, -0.8068205, 1.338274, 1, 1, 1, 1, 1,
1.855822, -0.527918, 2.789602, 0, 0, 1, 1, 1,
1.88696, -0.6257479, 1.593303, 1, 0, 0, 1, 1,
1.907071, -1.55773, 4.09894, 1, 0, 0, 1, 1,
1.913293, -1.228232, 4.315483, 1, 0, 0, 1, 1,
1.925696, -1.141429, 1.255342, 1, 0, 0, 1, 1,
2.002819, -0.4943879, -0.7061632, 1, 0, 0, 1, 1,
2.015548, -1.509094, 2.940908, 0, 0, 0, 1, 1,
2.019729, 0.08372754, 2.481929, 0, 0, 0, 1, 1,
2.031011, -0.4807627, 1.726508, 0, 0, 0, 1, 1,
2.041062, -1.612322, 2.889395, 0, 0, 0, 1, 1,
2.051395, 0.4758208, -0.8507248, 0, 0, 0, 1, 1,
2.120177, -1.481194, -0.2940737, 0, 0, 0, 1, 1,
2.154275, -0.4813897, 1.523091, 0, 0, 0, 1, 1,
2.305923, 1.397333, -0.7717884, 1, 1, 1, 1, 1,
2.306622, -1.239635, 2.147737, 1, 1, 1, 1, 1,
2.403222, -2.509418, 3.188156, 1, 1, 1, 1, 1,
2.640671, 0.5614095, -0.1438602, 1, 1, 1, 1, 1,
2.680305, -0.2407521, 4.263536, 1, 1, 1, 1, 1,
2.692387, 0.3178055, 2.786436, 1, 1, 1, 1, 1,
2.749603, 0.6208541, -0.2323511, 1, 1, 1, 1, 1
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
var radius = 9.479273;
var distance = 33.29555;
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
mvMatrix.translate( 0.2369639, 0.2991575, 0.1556253 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29555);
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
