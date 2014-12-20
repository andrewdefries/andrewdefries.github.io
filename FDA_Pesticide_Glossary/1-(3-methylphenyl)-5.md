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
-2.98834, -1.080755, -0.3825902, 1, 0, 0, 1,
-2.880887, 0.2200479, -1.329393, 1, 0.007843138, 0, 1,
-2.725545, 0.3687894, -3.109706, 1, 0.01176471, 0, 1,
-2.597242, 0.6181281, -2.767524, 1, 0.01960784, 0, 1,
-2.554057, 0.3246167, -1.986774, 1, 0.02352941, 0, 1,
-2.485739, -0.9610459, -0.57848, 1, 0.03137255, 0, 1,
-2.399287, 0.8101013, -1.646555, 1, 0.03529412, 0, 1,
-2.369384, 2.523156, -1.320754, 1, 0.04313726, 0, 1,
-2.331726, -0.4457828, -2.513478, 1, 0.04705882, 0, 1,
-2.277862, -0.3282, -2.192001, 1, 0.05490196, 0, 1,
-2.248945, -2.75572, -1.144921, 1, 0.05882353, 0, 1,
-2.222048, -0.7822752, -0.5224013, 1, 0.06666667, 0, 1,
-2.198482, 0.571959, -1.295314, 1, 0.07058824, 0, 1,
-2.181001, -1.223417, -1.955259, 1, 0.07843138, 0, 1,
-2.175774, -1.735571, -2.852471, 1, 0.08235294, 0, 1,
-2.173158, 1.164265, -0.2381908, 1, 0.09019608, 0, 1,
-2.171914, -0.9227551, -1.514757, 1, 0.09411765, 0, 1,
-2.156053, 0.3196079, -0.3122404, 1, 0.1019608, 0, 1,
-2.10961, 0.8418539, -1.587105, 1, 0.1098039, 0, 1,
-2.10594, -0.2522728, -2.946425, 1, 0.1137255, 0, 1,
-2.104261, -0.09188145, -2.608678, 1, 0.1215686, 0, 1,
-2.086282, -0.5560001, -1.551514, 1, 0.1254902, 0, 1,
-2.086036, -1.460994, -1.488781, 1, 0.1333333, 0, 1,
-2.078282, -0.7897597, -1.94139, 1, 0.1372549, 0, 1,
-2.035166, 0.6943849, -2.56551, 1, 0.145098, 0, 1,
-1.997513, 0.4315514, -2.834619, 1, 0.1490196, 0, 1,
-1.918172, -0.9733007, -3.161235, 1, 0.1568628, 0, 1,
-1.900545, 0.8644283, 1.804424, 1, 0.1607843, 0, 1,
-1.896649, 1.289998, 0.5402461, 1, 0.1686275, 0, 1,
-1.88329, -0.3640652, -1.832251, 1, 0.172549, 0, 1,
-1.871115, -0.7175555, -2.029578, 1, 0.1803922, 0, 1,
-1.869045, 0.3685436, -0.7896008, 1, 0.1843137, 0, 1,
-1.836803, -1.489703, -1.785809, 1, 0.1921569, 0, 1,
-1.825068, 0.3133036, -2.146261, 1, 0.1960784, 0, 1,
-1.801032, -0.3577347, -2.766251, 1, 0.2039216, 0, 1,
-1.784358, -1.100851, -5.311948, 1, 0.2117647, 0, 1,
-1.767962, -0.1763225, -2.40131, 1, 0.2156863, 0, 1,
-1.763844, -1.155469, -0.5424764, 1, 0.2235294, 0, 1,
-1.749791, -0.2844965, -0.4444234, 1, 0.227451, 0, 1,
-1.74759, -2.385983, -2.396943, 1, 0.2352941, 0, 1,
-1.734287, -0.8326606, -1.926504, 1, 0.2392157, 0, 1,
-1.712334, -0.4196879, -1.334689, 1, 0.2470588, 0, 1,
-1.704176, 1.051584, -3.793015, 1, 0.2509804, 0, 1,
-1.691575, -1.546478, -1.890783, 1, 0.2588235, 0, 1,
-1.683123, 0.446505, -0.5168755, 1, 0.2627451, 0, 1,
-1.674492, 0.5563625, -0.4091483, 1, 0.2705882, 0, 1,
-1.673526, 0.304045, -2.258625, 1, 0.2745098, 0, 1,
-1.667904, -1.420627, -3.651951, 1, 0.282353, 0, 1,
-1.660374, -1.042029, -3.019533, 1, 0.2862745, 0, 1,
-1.658949, -0.3775812, -1.544986, 1, 0.2941177, 0, 1,
-1.645217, -0.3889384, -2.136248, 1, 0.3019608, 0, 1,
-1.642877, -1.568451, -1.220224, 1, 0.3058824, 0, 1,
-1.638525, 0.9597189, -0.9474313, 1, 0.3137255, 0, 1,
-1.637227, -1.504882, -1.065066, 1, 0.3176471, 0, 1,
-1.609987, 0.7711724, -1.517538, 1, 0.3254902, 0, 1,
-1.602167, 1.394212, 0.1902523, 1, 0.3294118, 0, 1,
-1.589034, -0.009629998, 0.6116168, 1, 0.3372549, 0, 1,
-1.581257, -0.06768031, -1.114409, 1, 0.3411765, 0, 1,
-1.5759, -0.2332584, -1.058593, 1, 0.3490196, 0, 1,
-1.548483, 0.04712723, -1.264965, 1, 0.3529412, 0, 1,
-1.545015, -0.7611143, -1.017889, 1, 0.3607843, 0, 1,
-1.54355, -0.1330532, -3.841168, 1, 0.3647059, 0, 1,
-1.541271, -0.04710477, -0.04237641, 1, 0.372549, 0, 1,
-1.530182, -0.1533535, -1.411363, 1, 0.3764706, 0, 1,
-1.529594, 0.9101275, 0.1332918, 1, 0.3843137, 0, 1,
-1.5134, -1.607072, -4.201783, 1, 0.3882353, 0, 1,
-1.512367, 0.3965063, -3.208222, 1, 0.3960784, 0, 1,
-1.508198, 0.05752114, -0.004678703, 1, 0.4039216, 0, 1,
-1.507296, -0.8200235, -2.805453, 1, 0.4078431, 0, 1,
-1.506044, 0.741093, -1.77617, 1, 0.4156863, 0, 1,
-1.50543, 0.9828323, -0.6038504, 1, 0.4196078, 0, 1,
-1.49741, -0.8723059, -2.717434, 1, 0.427451, 0, 1,
-1.49209, -1.993364, -1.518108, 1, 0.4313726, 0, 1,
-1.490377, -0.6883426, -5.11623, 1, 0.4392157, 0, 1,
-1.475206, 0.8006417, -0.6096458, 1, 0.4431373, 0, 1,
-1.471383, 1.334146, -1.524277, 1, 0.4509804, 0, 1,
-1.453248, 1.167132, -0.09570087, 1, 0.454902, 0, 1,
-1.448373, -0.3267338, -3.399391, 1, 0.4627451, 0, 1,
-1.432795, -0.3595155, -1.249225, 1, 0.4666667, 0, 1,
-1.427716, -1.183177, 0.1569706, 1, 0.4745098, 0, 1,
-1.426581, -0.819333, -2.786013, 1, 0.4784314, 0, 1,
-1.403626, -0.979377, -2.9025, 1, 0.4862745, 0, 1,
-1.391992, -0.5775224, -2.882607, 1, 0.4901961, 0, 1,
-1.387163, -0.6912764, -1.041504, 1, 0.4980392, 0, 1,
-1.385615, 0.6777633, -0.5575962, 1, 0.5058824, 0, 1,
-1.375878, 0.5905647, -0.4159068, 1, 0.509804, 0, 1,
-1.375543, 1.016796, -3.075063, 1, 0.5176471, 0, 1,
-1.369547, -1.130318, -1.806418, 1, 0.5215687, 0, 1,
-1.363048, 0.1972124, -2.263352, 1, 0.5294118, 0, 1,
-1.359822, -0.8048501, -2.214985, 1, 0.5333334, 0, 1,
-1.355612, -0.6901366, -0.9770271, 1, 0.5411765, 0, 1,
-1.337304, -0.3994899, -2.047467, 1, 0.5450981, 0, 1,
-1.333812, 0.4122953, -3.00689, 1, 0.5529412, 0, 1,
-1.327805, -1.583222, -3.275646, 1, 0.5568628, 0, 1,
-1.321868, 0.052675, -1.152688, 1, 0.5647059, 0, 1,
-1.313149, -1.667817, -1.726223, 1, 0.5686275, 0, 1,
-1.310866, -0.4380573, -0.07907227, 1, 0.5764706, 0, 1,
-1.280674, 0.7339541, 0.2708032, 1, 0.5803922, 0, 1,
-1.263795, 0.861479, -1.544391, 1, 0.5882353, 0, 1,
-1.263059, -0.08057459, 0.7552809, 1, 0.5921569, 0, 1,
-1.260833, -0.5519286, -2.71297, 1, 0.6, 0, 1,
-1.260666, -0.4021356, -1.174976, 1, 0.6078432, 0, 1,
-1.248962, 0.9620575, 1.149086, 1, 0.6117647, 0, 1,
-1.247623, 1.341652, -0.9784005, 1, 0.6196079, 0, 1,
-1.23687, -0.9515176, -1.777629, 1, 0.6235294, 0, 1,
-1.223367, -0.01299236, -1.743738, 1, 0.6313726, 0, 1,
-1.223246, -1.212766, -4.216047, 1, 0.6352941, 0, 1,
-1.167469, 1.057913, -1.371882, 1, 0.6431373, 0, 1,
-1.166672, 0.8228597, 0.01662501, 1, 0.6470588, 0, 1,
-1.165711, 2.044082, -1.222934, 1, 0.654902, 0, 1,
-1.149995, -0.08516251, -2.211092, 1, 0.6588235, 0, 1,
-1.147789, -0.3660897, -2.410092, 1, 0.6666667, 0, 1,
-1.129219, -0.3754122, -4.479987, 1, 0.6705883, 0, 1,
-1.123045, -1.834215, -2.686442, 1, 0.6784314, 0, 1,
-1.115238, -1.282099, -3.608297, 1, 0.682353, 0, 1,
-1.113766, -0.09959318, -2.239628, 1, 0.6901961, 0, 1,
-1.113437, -0.7604323, -2.837815, 1, 0.6941177, 0, 1,
-1.111894, 0.3638082, -0.4858442, 1, 0.7019608, 0, 1,
-1.108387, 0.106593, -2.593205, 1, 0.7098039, 0, 1,
-1.108225, 0.4397441, -0.2711423, 1, 0.7137255, 0, 1,
-1.103057, 0.8444988, -2.895262, 1, 0.7215686, 0, 1,
-1.101866, -1.056561, -3.210141, 1, 0.7254902, 0, 1,
-1.099475, 0.1859782, -1.752453, 1, 0.7333333, 0, 1,
-1.095379, 0.4032782, -2.826587, 1, 0.7372549, 0, 1,
-1.091655, -0.650112, -0.1479068, 1, 0.7450981, 0, 1,
-1.089278, 1.866507, -0.6746319, 1, 0.7490196, 0, 1,
-1.087343, -1.857255, -1.75663, 1, 0.7568628, 0, 1,
-1.085917, 0.432694, -2.18141, 1, 0.7607843, 0, 1,
-1.085165, 0.5812169, -0.771285, 1, 0.7686275, 0, 1,
-1.08406, 0.5150552, -1.302089, 1, 0.772549, 0, 1,
-1.082395, -0.2757639, -1.074522, 1, 0.7803922, 0, 1,
-1.07225, -0.4882503, -1.011209, 1, 0.7843137, 0, 1,
-1.047664, 0.8828285, -2.419776, 1, 0.7921569, 0, 1,
-1.047071, -0.1236843, -4.04033, 1, 0.7960784, 0, 1,
-1.046948, 0.2028096, -1.261777, 1, 0.8039216, 0, 1,
-1.046306, -1.537829, -3.015649, 1, 0.8117647, 0, 1,
-1.045627, -0.3800723, 1.325967, 1, 0.8156863, 0, 1,
-1.041498, -1.344798, -2.039554, 1, 0.8235294, 0, 1,
-1.03771, -0.08705318, -0.01702873, 1, 0.827451, 0, 1,
-1.030847, -1.296096, -3.258744, 1, 0.8352941, 0, 1,
-1.030663, -1.821919, -4.319693, 1, 0.8392157, 0, 1,
-1.028632, -0.106845, 0.4235864, 1, 0.8470588, 0, 1,
-1.027445, -1.337569, -2.338863, 1, 0.8509804, 0, 1,
-1.024303, -1.017841, -1.824747, 1, 0.8588235, 0, 1,
-1.022627, -1.316578, -1.549167, 1, 0.8627451, 0, 1,
-1.022082, 0.7742805, -0.6878647, 1, 0.8705882, 0, 1,
-1.017126, -0.05547769, -1.954388, 1, 0.8745098, 0, 1,
-1.016453, -0.9686913, -2.673601, 1, 0.8823529, 0, 1,
-1.016272, -0.2830653, 0.07210089, 1, 0.8862745, 0, 1,
-1.009868, -0.05649705, -0.6359356, 1, 0.8941177, 0, 1,
-1.006517, 2.190134, 0.07266796, 1, 0.8980392, 0, 1,
-0.9818906, -1.499394, -2.823031, 1, 0.9058824, 0, 1,
-0.9743893, -0.5976902, -2.690175, 1, 0.9137255, 0, 1,
-0.9691438, 0.8004079, -1.914992, 1, 0.9176471, 0, 1,
-0.9681236, -1.338109, -3.07024, 1, 0.9254902, 0, 1,
-0.9656981, 0.5419512, -0.8684253, 1, 0.9294118, 0, 1,
-0.9613314, 1.018818, 0.8424687, 1, 0.9372549, 0, 1,
-0.9524887, 0.1213282, -0.1732274, 1, 0.9411765, 0, 1,
-0.9466727, 0.9387706, 1.075384, 1, 0.9490196, 0, 1,
-0.9212441, 0.1297009, -2.100426, 1, 0.9529412, 0, 1,
-0.9199466, -1.109862, -1.798052, 1, 0.9607843, 0, 1,
-0.9160534, 1.280015, -0.5423219, 1, 0.9647059, 0, 1,
-0.9156196, -0.7789387, 0.2582254, 1, 0.972549, 0, 1,
-0.9075792, 0.6614423, 0.8193954, 1, 0.9764706, 0, 1,
-0.90624, 0.7371966, -3.189076, 1, 0.9843137, 0, 1,
-0.9021694, 0.2442336, -2.321112, 1, 0.9882353, 0, 1,
-0.8953437, -1.034781, -3.076311, 1, 0.9960784, 0, 1,
-0.8921931, 0.5491902, 0.02647155, 0.9960784, 1, 0, 1,
-0.8892949, 0.2573888, -2.261163, 0.9921569, 1, 0, 1,
-0.8892156, 1.506855, 0.9556928, 0.9843137, 1, 0, 1,
-0.8879843, 0.2403968, -0.6096522, 0.9803922, 1, 0, 1,
-0.87706, 0.5860551, 0.4703902, 0.972549, 1, 0, 1,
-0.8730956, -1.198456, -3.721648, 0.9686275, 1, 0, 1,
-0.8695432, -0.1181991, -1.03862, 0.9607843, 1, 0, 1,
-0.8658532, -0.04849905, -0.6960769, 0.9568627, 1, 0, 1,
-0.8615052, -1.982395, -2.170506, 0.9490196, 1, 0, 1,
-0.8567543, 0.6123172, -2.028585, 0.945098, 1, 0, 1,
-0.8530861, -0.9563323, -2.136675, 0.9372549, 1, 0, 1,
-0.8525889, -0.3007007, -2.395256, 0.9333333, 1, 0, 1,
-0.8457376, -1.652676, -3.970594, 0.9254902, 1, 0, 1,
-0.8453915, -0.1666157, -1.151183, 0.9215686, 1, 0, 1,
-0.8424447, -0.6594815, -2.621208, 0.9137255, 1, 0, 1,
-0.8399841, -0.642502, -1.873202, 0.9098039, 1, 0, 1,
-0.8389094, -1.386168, -2.941616, 0.9019608, 1, 0, 1,
-0.8373839, 0.3271028, 0.5609879, 0.8941177, 1, 0, 1,
-0.832131, 0.6008555, 0.6368957, 0.8901961, 1, 0, 1,
-0.8228586, 0.5073478, -0.6563011, 0.8823529, 1, 0, 1,
-0.8184751, -1.059944, -1.35083, 0.8784314, 1, 0, 1,
-0.8164089, 0.9344502, 0.4743142, 0.8705882, 1, 0, 1,
-0.8156501, 2.680629, -0.508601, 0.8666667, 1, 0, 1,
-0.8153428, -1.850438, -3.10967, 0.8588235, 1, 0, 1,
-0.8090951, -0.04210732, -2.862375, 0.854902, 1, 0, 1,
-0.8052117, -1.670875, -1.080607, 0.8470588, 1, 0, 1,
-0.8017502, -0.9637432, -3.201985, 0.8431373, 1, 0, 1,
-0.8014255, 0.02310475, -0.565893, 0.8352941, 1, 0, 1,
-0.7962113, 1.845065, -0.05283321, 0.8313726, 1, 0, 1,
-0.7895129, 1.355839, -0.07461927, 0.8235294, 1, 0, 1,
-0.7877504, -0.6841834, -2.844733, 0.8196079, 1, 0, 1,
-0.7876859, -1.404774, -2.717451, 0.8117647, 1, 0, 1,
-0.7874941, -1.254536, -2.736828, 0.8078431, 1, 0, 1,
-0.7810007, -0.0695798, -1.262596, 0.8, 1, 0, 1,
-0.7727838, 0.01224859, -2.055094, 0.7921569, 1, 0, 1,
-0.7716494, 1.998625, -1.074893, 0.7882353, 1, 0, 1,
-0.760066, 1.991245, -1.419047, 0.7803922, 1, 0, 1,
-0.7589874, 0.003833103, -2.634695, 0.7764706, 1, 0, 1,
-0.7585831, 0.01728264, -1.255674, 0.7686275, 1, 0, 1,
-0.7533947, -0.007115821, -1.840903, 0.7647059, 1, 0, 1,
-0.7443342, -0.2480949, -2.448991, 0.7568628, 1, 0, 1,
-0.7442755, -1.390835, -3.367145, 0.7529412, 1, 0, 1,
-0.7401434, 2.100709, -0.9580145, 0.7450981, 1, 0, 1,
-0.7358199, -0.8564858, -2.364098, 0.7411765, 1, 0, 1,
-0.7323958, 0.4178658, -0.9755973, 0.7333333, 1, 0, 1,
-0.7245347, 0.5885108, -0.2670693, 0.7294118, 1, 0, 1,
-0.7236133, 0.05937919, -1.058844, 0.7215686, 1, 0, 1,
-0.7206981, 1.075905, -1.394018, 0.7176471, 1, 0, 1,
-0.718748, -1.516417, -2.357383, 0.7098039, 1, 0, 1,
-0.7005879, 0.9168644, -0.7239966, 0.7058824, 1, 0, 1,
-0.6998656, -0.6687977, -1.477953, 0.6980392, 1, 0, 1,
-0.6986759, -0.1621782, -3.693725, 0.6901961, 1, 0, 1,
-0.6933913, 0.2457064, -2.594993, 0.6862745, 1, 0, 1,
-0.6918523, -0.2508028, -2.217185, 0.6784314, 1, 0, 1,
-0.6901362, 0.2330163, -0.166249, 0.6745098, 1, 0, 1,
-0.678946, 1.322299, -0.09502158, 0.6666667, 1, 0, 1,
-0.6759751, 0.7200262, -0.9043026, 0.6627451, 1, 0, 1,
-0.6747041, 1.190712, -0.3380472, 0.654902, 1, 0, 1,
-0.672898, 2.648182, 0.4843129, 0.6509804, 1, 0, 1,
-0.6728327, 0.8096138, 0.2993106, 0.6431373, 1, 0, 1,
-0.6669891, -0.1064781, -1.399543, 0.6392157, 1, 0, 1,
-0.658237, -0.3895387, -2.635804, 0.6313726, 1, 0, 1,
-0.6545952, 1.645102, -1.590967, 0.627451, 1, 0, 1,
-0.6500438, -1.090099, -3.44473, 0.6196079, 1, 0, 1,
-0.6490949, -0.7619649, -2.182956, 0.6156863, 1, 0, 1,
-0.6486797, 0.7137478, -0.7647592, 0.6078432, 1, 0, 1,
-0.6458402, 0.1409926, -0.1701359, 0.6039216, 1, 0, 1,
-0.6324337, -0.6740658, -2.444225, 0.5960785, 1, 0, 1,
-0.6256048, -0.8306756, -2.785409, 0.5882353, 1, 0, 1,
-0.6245946, -0.7228797, -3.505984, 0.5843138, 1, 0, 1,
-0.6224121, 0.872256, -1.670823, 0.5764706, 1, 0, 1,
-0.6220616, 1.205734, 0.7426875, 0.572549, 1, 0, 1,
-0.6189237, -0.0338327, -0.7171421, 0.5647059, 1, 0, 1,
-0.615373, -0.7711924, -2.182284, 0.5607843, 1, 0, 1,
-0.6120979, -0.09535845, -0.9537016, 0.5529412, 1, 0, 1,
-0.6066968, 0.1125737, -1.782579, 0.5490196, 1, 0, 1,
-0.6036491, -1.550079, -3.715721, 0.5411765, 1, 0, 1,
-0.6031532, 0.1283526, -2.243331, 0.5372549, 1, 0, 1,
-0.6021351, 0.7523419, -1.207906, 0.5294118, 1, 0, 1,
-0.5988793, 0.2720914, -0.9641337, 0.5254902, 1, 0, 1,
-0.5979372, -0.009991117, 0.1007046, 0.5176471, 1, 0, 1,
-0.5967229, -0.6239672, -1.067453, 0.5137255, 1, 0, 1,
-0.5935252, 1.457432, -0.5518701, 0.5058824, 1, 0, 1,
-0.5923519, -0.7158634, -2.882097, 0.5019608, 1, 0, 1,
-0.5917061, 0.7739597, 0.1524969, 0.4941176, 1, 0, 1,
-0.5899752, 0.2520231, -2.845757, 0.4862745, 1, 0, 1,
-0.5850878, 0.09392045, -0.06404123, 0.4823529, 1, 0, 1,
-0.5841136, 0.8811505, -3.751195, 0.4745098, 1, 0, 1,
-0.5817299, -1.234544, -2.944909, 0.4705882, 1, 0, 1,
-0.5812251, 1.551408, 0.07748093, 0.4627451, 1, 0, 1,
-0.578455, -0.5471046, -3.025355, 0.4588235, 1, 0, 1,
-0.5749236, -0.08728564, -1.89578, 0.4509804, 1, 0, 1,
-0.5696493, 0.06322744, -1.00057, 0.4470588, 1, 0, 1,
-0.5678674, 0.2389078, -0.5949583, 0.4392157, 1, 0, 1,
-0.5674808, -0.9838953, -3.601482, 0.4352941, 1, 0, 1,
-0.5658343, -1.452671, -2.328235, 0.427451, 1, 0, 1,
-0.5618263, -0.4765632, -2.11737, 0.4235294, 1, 0, 1,
-0.5608411, 0.3926062, 1.225841, 0.4156863, 1, 0, 1,
-0.558998, -0.527276, -1.32515, 0.4117647, 1, 0, 1,
-0.54346, 0.7663385, -0.1920881, 0.4039216, 1, 0, 1,
-0.537855, -1.049208, -3.293536, 0.3960784, 1, 0, 1,
-0.5352119, 0.9528458, 0.02443363, 0.3921569, 1, 0, 1,
-0.5328224, 2.580494, -0.5606561, 0.3843137, 1, 0, 1,
-0.5316199, -0.4811323, -2.392054, 0.3803922, 1, 0, 1,
-0.5314076, 0.5313348, -1.344784, 0.372549, 1, 0, 1,
-0.5298784, 1.029523, -1.398707, 0.3686275, 1, 0, 1,
-0.5286934, -0.3058935, -0.9499781, 0.3607843, 1, 0, 1,
-0.5280891, 1.483735, -1.829171, 0.3568628, 1, 0, 1,
-0.5274394, -0.8777166, -1.065733, 0.3490196, 1, 0, 1,
-0.5273046, -0.2221778, -0.4205037, 0.345098, 1, 0, 1,
-0.5190541, 0.09679653, -1.641904, 0.3372549, 1, 0, 1,
-0.5187912, -0.8925342, -2.15384, 0.3333333, 1, 0, 1,
-0.5181943, 0.1022791, -2.937752, 0.3254902, 1, 0, 1,
-0.5160868, -1.733602, -4.096619, 0.3215686, 1, 0, 1,
-0.5131875, 0.3535001, 0.2215769, 0.3137255, 1, 0, 1,
-0.5085132, 0.5713242, -1.786158, 0.3098039, 1, 0, 1,
-0.5049244, -0.7517583, -2.961816, 0.3019608, 1, 0, 1,
-0.5035406, 1.600998, -1.518799, 0.2941177, 1, 0, 1,
-0.4979567, -0.2629937, -2.079443, 0.2901961, 1, 0, 1,
-0.4868508, 1.003564, 0.6946099, 0.282353, 1, 0, 1,
-0.4842298, -0.008715387, 0.7534735, 0.2784314, 1, 0, 1,
-0.4820822, 1.320261, -0.650416, 0.2705882, 1, 0, 1,
-0.4806814, 0.1543232, -0.5065411, 0.2666667, 1, 0, 1,
-0.4770149, -1.035324, -3.059231, 0.2588235, 1, 0, 1,
-0.4751382, -1.780925, -3.061261, 0.254902, 1, 0, 1,
-0.4737229, 0.1575252, -1.722169, 0.2470588, 1, 0, 1,
-0.4725132, -0.1127013, -2.878388, 0.2431373, 1, 0, 1,
-0.4722557, 0.8531162, -0.1400069, 0.2352941, 1, 0, 1,
-0.4706837, -0.2697079, -1.393978, 0.2313726, 1, 0, 1,
-0.4667713, -0.128022, -0.7800789, 0.2235294, 1, 0, 1,
-0.4664698, 0.5804051, -0.4277257, 0.2196078, 1, 0, 1,
-0.4641791, -0.6799294, -1.780674, 0.2117647, 1, 0, 1,
-0.4617856, -0.0693603, -1.397293, 0.2078431, 1, 0, 1,
-0.4607009, 0.673246, -0.8612813, 0.2, 1, 0, 1,
-0.4605178, 0.08955738, -1.775913, 0.1921569, 1, 0, 1,
-0.4597637, 1.399906, 0.7626933, 0.1882353, 1, 0, 1,
-0.4586841, 0.2838566, -2.180948, 0.1803922, 1, 0, 1,
-0.4584356, -0.3515567, -1.558238, 0.1764706, 1, 0, 1,
-0.4509718, 1.471321, -1.679639, 0.1686275, 1, 0, 1,
-0.4504408, 2.279709, -0.8723256, 0.1647059, 1, 0, 1,
-0.4489717, 0.5210323, -1.065056, 0.1568628, 1, 0, 1,
-0.4456736, -1.022583, -1.978792, 0.1529412, 1, 0, 1,
-0.4429697, 1.976032, -1.578551, 0.145098, 1, 0, 1,
-0.4418887, -1.148317, -4.866544, 0.1411765, 1, 0, 1,
-0.4417729, 1.055908, -1.353335, 0.1333333, 1, 0, 1,
-0.4396699, 0.1247477, -0.5078024, 0.1294118, 1, 0, 1,
-0.4327882, 0.5410417, -2.161979, 0.1215686, 1, 0, 1,
-0.4321783, 1.133065, -0.9617662, 0.1176471, 1, 0, 1,
-0.4302321, 0.3930212, -1.205201, 0.1098039, 1, 0, 1,
-0.4296037, -0.9425923, -1.644372, 0.1058824, 1, 0, 1,
-0.4295136, 1.065181, 0.02358325, 0.09803922, 1, 0, 1,
-0.4262756, -0.1825605, -2.208742, 0.09019608, 1, 0, 1,
-0.4239146, -2.486025, -1.104265, 0.08627451, 1, 0, 1,
-0.4178869, -0.475051, -1.333736, 0.07843138, 1, 0, 1,
-0.412957, -1.391409, -2.271057, 0.07450981, 1, 0, 1,
-0.4037114, 0.1278569, -4.012627, 0.06666667, 1, 0, 1,
-0.4019054, -0.2061196, -0.805365, 0.0627451, 1, 0, 1,
-0.397673, -0.3515544, -1.456256, 0.05490196, 1, 0, 1,
-0.3956911, 1.549946, 1.144184, 0.05098039, 1, 0, 1,
-0.3922103, -0.3368256, -1.281011, 0.04313726, 1, 0, 1,
-0.3908846, 1.870781, 0.1969097, 0.03921569, 1, 0, 1,
-0.3893595, 0.2108181, -1.969314, 0.03137255, 1, 0, 1,
-0.3842339, 1.62631, 1.718624, 0.02745098, 1, 0, 1,
-0.3833249, 0.01070706, -1.162987, 0.01960784, 1, 0, 1,
-0.3676773, -0.8119764, -1.707309, 0.01568628, 1, 0, 1,
-0.3673448, 0.07646754, 0.1140452, 0.007843138, 1, 0, 1,
-0.364744, -0.9437365, -1.655339, 0.003921569, 1, 0, 1,
-0.3559114, 0.4559658, -1.383619, 0, 1, 0.003921569, 1,
-0.3476075, -0.6067991, -3.375642, 0, 1, 0.01176471, 1,
-0.3450078, -0.0152326, -2.099274, 0, 1, 0.01568628, 1,
-0.3412207, -1.224145, -1.067901, 0, 1, 0.02352941, 1,
-0.3403538, -0.01539685, -0.8581479, 0, 1, 0.02745098, 1,
-0.339045, 0.151859, -2.633127, 0, 1, 0.03529412, 1,
-0.3373691, 0.5487512, -0.9469067, 0, 1, 0.03921569, 1,
-0.3310783, 0.6405166, 0.6655062, 0, 1, 0.04705882, 1,
-0.3281784, -0.6522412, -3.355635, 0, 1, 0.05098039, 1,
-0.3248324, 0.3038978, -2.797668, 0, 1, 0.05882353, 1,
-0.3219048, -1.080296, -3.285589, 0, 1, 0.0627451, 1,
-0.3210788, -0.4918844, -1.70532, 0, 1, 0.07058824, 1,
-0.3162535, 1.097611, -0.9809545, 0, 1, 0.07450981, 1,
-0.315148, 0.451921, -0.5050577, 0, 1, 0.08235294, 1,
-0.3138469, -2.209236, -1.285763, 0, 1, 0.08627451, 1,
-0.3114681, 0.8437945, -0.6789114, 0, 1, 0.09411765, 1,
-0.3112504, -0.3469009, -3.531098, 0, 1, 0.1019608, 1,
-0.3103652, 0.7048644, 1.974012, 0, 1, 0.1058824, 1,
-0.3091409, 0.1886164, -1.013723, 0, 1, 0.1137255, 1,
-0.3079341, 2.082802, -1.537803, 0, 1, 0.1176471, 1,
-0.3032438, 0.5171694, 0.05438844, 0, 1, 0.1254902, 1,
-0.3007374, -1.994975, -2.824344, 0, 1, 0.1294118, 1,
-0.2997611, 0.7585037, -0.1251795, 0, 1, 0.1372549, 1,
-0.2915069, 0.9067535, 0.4261025, 0, 1, 0.1411765, 1,
-0.2898825, -0.5907722, -3.659212, 0, 1, 0.1490196, 1,
-0.2897667, -1.289767, -2.14191, 0, 1, 0.1529412, 1,
-0.2870888, 0.06640337, -1.913618, 0, 1, 0.1607843, 1,
-0.2855763, 2.022778, 1.031074, 0, 1, 0.1647059, 1,
-0.2843911, 0.4269206, 0.1958255, 0, 1, 0.172549, 1,
-0.2838746, -0.351348, -1.439511, 0, 1, 0.1764706, 1,
-0.2832197, -2.078469, -1.853818, 0, 1, 0.1843137, 1,
-0.2820344, 1.793949, 0.5357257, 0, 1, 0.1882353, 1,
-0.2774799, 0.7508675, -2.337695, 0, 1, 0.1960784, 1,
-0.2766901, -0.956446, -1.717967, 0, 1, 0.2039216, 1,
-0.2725071, 1.372224, 0.7423072, 0, 1, 0.2078431, 1,
-0.2723962, 0.0810514, -0.9642643, 0, 1, 0.2156863, 1,
-0.2694742, -2.562968, -3.317551, 0, 1, 0.2196078, 1,
-0.2690052, -0.9319828, -2.707781, 0, 1, 0.227451, 1,
-0.2659641, -2.111426, -3.344856, 0, 1, 0.2313726, 1,
-0.2657012, 0.6738601, 0.7699875, 0, 1, 0.2392157, 1,
-0.2656942, -2.293889, -0.07265784, 0, 1, 0.2431373, 1,
-0.2622279, -0.006980061, -0.8270581, 0, 1, 0.2509804, 1,
-0.2589149, -0.1180043, -2.883582, 0, 1, 0.254902, 1,
-0.2581476, -0.8328088, -2.718079, 0, 1, 0.2627451, 1,
-0.2560982, 0.7384663, -0.06630628, 0, 1, 0.2666667, 1,
-0.2553411, 1.558758, -0.5667396, 0, 1, 0.2745098, 1,
-0.2551409, 1.454738, -0.06546329, 0, 1, 0.2784314, 1,
-0.2522162, -0.8882778, -2.185783, 0, 1, 0.2862745, 1,
-0.2515198, -1.17952, -1.327137, 0, 1, 0.2901961, 1,
-0.2463578, 0.2905531, -1.09937, 0, 1, 0.2980392, 1,
-0.2461034, 1.893932, -1.679655, 0, 1, 0.3058824, 1,
-0.2407097, 1.184443, -1.51808, 0, 1, 0.3098039, 1,
-0.2381594, 1.896018, 0.04874127, 0, 1, 0.3176471, 1,
-0.2363296, -0.513316, -2.9369, 0, 1, 0.3215686, 1,
-0.2353159, 0.3838041, 0.1439965, 0, 1, 0.3294118, 1,
-0.225809, 0.8262873, 0.372628, 0, 1, 0.3333333, 1,
-0.2233752, 0.6841703, 0.2614724, 0, 1, 0.3411765, 1,
-0.2080157, -0.9199614, -4.321797, 0, 1, 0.345098, 1,
-0.204341, -0.1011965, -2.68694, 0, 1, 0.3529412, 1,
-0.2040282, -1.052703, -3.239066, 0, 1, 0.3568628, 1,
-0.203893, 1.397929, -1.767738, 0, 1, 0.3647059, 1,
-0.1957197, 0.1465919, -1.748421, 0, 1, 0.3686275, 1,
-0.1950875, 1.053804, -1.546398, 0, 1, 0.3764706, 1,
-0.188921, -0.5398343, -2.390247, 0, 1, 0.3803922, 1,
-0.1850944, 0.7178784, -0.7078577, 0, 1, 0.3882353, 1,
-0.1821602, -1.211587, -3.843453, 0, 1, 0.3921569, 1,
-0.1756944, -1.538393, -1.774902, 0, 1, 0.4, 1,
-0.1730336, -1.102926, -1.059272, 0, 1, 0.4078431, 1,
-0.1717788, 1.333188, 0.9638501, 0, 1, 0.4117647, 1,
-0.1715016, -0.567568, -2.094857, 0, 1, 0.4196078, 1,
-0.1658035, -1.324877, -4.268955, 0, 1, 0.4235294, 1,
-0.1641142, -0.6717961, -4.604041, 0, 1, 0.4313726, 1,
-0.1574751, -0.6107507, -2.677349, 0, 1, 0.4352941, 1,
-0.153904, 0.9161834, -0.3718271, 0, 1, 0.4431373, 1,
-0.1510226, 0.4777818, -0.6284346, 0, 1, 0.4470588, 1,
-0.1507279, -0.7085193, -4.559835, 0, 1, 0.454902, 1,
-0.149739, 0.7568972, -1.295032, 0, 1, 0.4588235, 1,
-0.1471767, -0.8898949, -4.090089, 0, 1, 0.4666667, 1,
-0.1428261, -2.569266, -1.790919, 0, 1, 0.4705882, 1,
-0.1419995, 1.894402, -1.884473, 0, 1, 0.4784314, 1,
-0.1384139, 0.5646527, -1.398107, 0, 1, 0.4823529, 1,
-0.1338562, -0.4330019, -3.025492, 0, 1, 0.4901961, 1,
-0.1243204, -1.573904, -2.557804, 0, 1, 0.4941176, 1,
-0.123895, 0.2627768, -1.310101, 0, 1, 0.5019608, 1,
-0.1177672, -0.7686366, -4.388896, 0, 1, 0.509804, 1,
-0.1161032, -1.169086, -2.345024, 0, 1, 0.5137255, 1,
-0.1156641, -0.5113718, -3.921856, 0, 1, 0.5215687, 1,
-0.1105197, -0.4355454, -1.912838, 0, 1, 0.5254902, 1,
-0.1002128, 1.544159, -1.191029, 0, 1, 0.5333334, 1,
-0.09716655, 1.303944, 1.215699, 0, 1, 0.5372549, 1,
-0.09512693, 0.1600081, 1.23066, 0, 1, 0.5450981, 1,
-0.09160727, -1.328751, -3.133954, 0, 1, 0.5490196, 1,
-0.0912755, 0.9487609, 1.130861, 0, 1, 0.5568628, 1,
-0.09015594, 1.089678, -1.576373, 0, 1, 0.5607843, 1,
-0.08289076, -1.400801, -2.976532, 0, 1, 0.5686275, 1,
-0.08209074, 1.244748, -1.046995, 0, 1, 0.572549, 1,
-0.0802699, 1.900324, 0.6676471, 0, 1, 0.5803922, 1,
-0.07940093, 0.4170018, -0.3276713, 0, 1, 0.5843138, 1,
-0.07914321, 0.1293934, 0.3064964, 0, 1, 0.5921569, 1,
-0.07760105, -1.246838, -1.79243, 0, 1, 0.5960785, 1,
-0.07658025, -1.823089, -4.017402, 0, 1, 0.6039216, 1,
-0.07551682, -1.095308, -3.469197, 0, 1, 0.6117647, 1,
-0.0704916, 0.3303711, -1.611044, 0, 1, 0.6156863, 1,
-0.06876507, 0.2157501, -0.9092475, 0, 1, 0.6235294, 1,
-0.06841094, -0.1404196, -1.305967, 0, 1, 0.627451, 1,
-0.06519228, -1.461522, -2.965209, 0, 1, 0.6352941, 1,
-0.06337997, -0.5807995, -1.708468, 0, 1, 0.6392157, 1,
-0.05582457, 0.04489883, -1.423292, 0, 1, 0.6470588, 1,
-0.05446064, 0.2159384, 1.15276, 0, 1, 0.6509804, 1,
-0.05400338, 0.8361632, 0.5238398, 0, 1, 0.6588235, 1,
-0.05289297, -0.7272065, -2.547507, 0, 1, 0.6627451, 1,
-0.05200326, -1.283511, -3.811504, 0, 1, 0.6705883, 1,
-0.05062525, 0.6177096, 0.08448113, 0, 1, 0.6745098, 1,
-0.04721629, 0.1600541, -0.9731682, 0, 1, 0.682353, 1,
-0.0470672, -1.042943, -2.732317, 0, 1, 0.6862745, 1,
-0.04615641, -0.1779641, -4.822608, 0, 1, 0.6941177, 1,
-0.04462839, 0.3328269, 1.012042, 0, 1, 0.7019608, 1,
-0.03988684, -0.6414044, -4.303567, 0, 1, 0.7058824, 1,
-0.03605557, -0.9677425, -1.390842, 0, 1, 0.7137255, 1,
-0.03568169, -1.032126, -3.833331, 0, 1, 0.7176471, 1,
-0.03394488, 0.6179309, -0.7838683, 0, 1, 0.7254902, 1,
-0.03188403, -1.647266, -4.278343, 0, 1, 0.7294118, 1,
-0.02976745, 0.7876318, -2.227644, 0, 1, 0.7372549, 1,
-0.02263589, 0.9374281, 1.644771, 0, 1, 0.7411765, 1,
-0.02021169, -0.07966707, -1.904674, 0, 1, 0.7490196, 1,
-0.01343858, 0.9906822, 1.308775, 0, 1, 0.7529412, 1,
-0.008902038, 0.8024654, -0.0654504, 0, 1, 0.7607843, 1,
-0.008669745, -0.1513, -1.979611, 0, 1, 0.7647059, 1,
-0.007739038, 0.6271094, -1.003267, 0, 1, 0.772549, 1,
-0.006976396, 0.7696444, 1.02354, 0, 1, 0.7764706, 1,
-0.002897599, 0.8085068, 1.205085, 0, 1, 0.7843137, 1,
-0.001006503, 0.2039739, -0.8605782, 0, 1, 0.7882353, 1,
0.0009276927, -2.08368, 2.677165, 0, 1, 0.7960784, 1,
0.004539809, -0.2261035, 2.420572, 0, 1, 0.8039216, 1,
0.005150767, -0.1779989, 2.66792, 0, 1, 0.8078431, 1,
0.006267752, -1.244381, 3.567322, 0, 1, 0.8156863, 1,
0.007168285, -0.2208266, 4.227475, 0, 1, 0.8196079, 1,
0.009338583, -0.7239271, 0.4532974, 0, 1, 0.827451, 1,
0.01086556, 0.7084754, 0.9361269, 0, 1, 0.8313726, 1,
0.01476519, -1.023827, 3.450641, 0, 1, 0.8392157, 1,
0.01515074, 0.9500352, 0.09684739, 0, 1, 0.8431373, 1,
0.01815262, 0.2565072, -0.1963864, 0, 1, 0.8509804, 1,
0.01858006, -0.7261912, 2.103033, 0, 1, 0.854902, 1,
0.02320533, 1.238158, 0.6906221, 0, 1, 0.8627451, 1,
0.02994237, 0.1102817, -0.2064872, 0, 1, 0.8666667, 1,
0.03035563, 1.153512, 0.08672139, 0, 1, 0.8745098, 1,
0.03041317, 1.703166, 0.9794032, 0, 1, 0.8784314, 1,
0.03354077, 0.2461739, -0.488396, 0, 1, 0.8862745, 1,
0.03438166, 2.091042, 0.5764886, 0, 1, 0.8901961, 1,
0.03711873, 0.6911113, 0.7286646, 0, 1, 0.8980392, 1,
0.03939094, -0.4891908, 3.39485, 0, 1, 0.9058824, 1,
0.04261876, -0.2723197, 2.381793, 0, 1, 0.9098039, 1,
0.04407058, 0.1073272, 0.2258643, 0, 1, 0.9176471, 1,
0.04901472, -0.06909358, 1.23618, 0, 1, 0.9215686, 1,
0.05042354, -0.1828117, 2.741686, 0, 1, 0.9294118, 1,
0.05072365, 1.2253, -0.4597879, 0, 1, 0.9333333, 1,
0.05199244, 0.7934088, 0.01294344, 0, 1, 0.9411765, 1,
0.05267003, 1.286587, -1.032881, 0, 1, 0.945098, 1,
0.05644634, 1.01455, -0.2428966, 0, 1, 0.9529412, 1,
0.05825356, -0.7260021, 3.00388, 0, 1, 0.9568627, 1,
0.05871744, -0.5334918, 1.944793, 0, 1, 0.9647059, 1,
0.05897452, -0.6487762, 3.190192, 0, 1, 0.9686275, 1,
0.06231524, -0.3034481, 3.607549, 0, 1, 0.9764706, 1,
0.06267669, 0.2968455, 0.6895273, 0, 1, 0.9803922, 1,
0.06503677, 0.0138151, 1.392038, 0, 1, 0.9882353, 1,
0.06568292, 1.630744, -0.1912536, 0, 1, 0.9921569, 1,
0.0673996, 0.7200555, -1.284843, 0, 1, 1, 1,
0.07693974, -0.3995219, 2.331579, 0, 0.9921569, 1, 1,
0.08055763, 0.2709582, 0.9163488, 0, 0.9882353, 1, 1,
0.08138214, 1.34295, -0.778074, 0, 0.9803922, 1, 1,
0.08416373, 0.8531911, -0.237138, 0, 0.9764706, 1, 1,
0.09018183, 0.6449775, 2.129904, 0, 0.9686275, 1, 1,
0.1050038, 0.1636474, 1.664912, 0, 0.9647059, 1, 1,
0.1065187, -0.2615468, 0.6386222, 0, 0.9568627, 1, 1,
0.1073762, 1.440476, -1.686963, 0, 0.9529412, 1, 1,
0.1097426, 1.137522, -1.419712, 0, 0.945098, 1, 1,
0.1102897, -0.9077669, 3.331537, 0, 0.9411765, 1, 1,
0.1177796, 0.6964921, -0.5800554, 0, 0.9333333, 1, 1,
0.120392, -1.08428, 1.595029, 0, 0.9294118, 1, 1,
0.1222761, -0.528315, 2.335372, 0, 0.9215686, 1, 1,
0.1241963, -0.1897406, 1.835749, 0, 0.9176471, 1, 1,
0.1262466, 0.1134774, 1.631711, 0, 0.9098039, 1, 1,
0.1263946, 0.1129911, 0.5502182, 0, 0.9058824, 1, 1,
0.128769, -1.653849, 4.821835, 0, 0.8980392, 1, 1,
0.1367405, -1.100678, 2.786626, 0, 0.8901961, 1, 1,
0.141056, 0.7463375, 0.04490134, 0, 0.8862745, 1, 1,
0.1450113, 0.1312781, -0.1773068, 0, 0.8784314, 1, 1,
0.1471202, -0.2706254, 1.971351, 0, 0.8745098, 1, 1,
0.1501165, -0.5534571, 2.837816, 0, 0.8666667, 1, 1,
0.1512731, 0.7401372, 0.9194686, 0, 0.8627451, 1, 1,
0.1526435, 1.04873, -1.970527, 0, 0.854902, 1, 1,
0.1540688, 2.592583, -2.010476, 0, 0.8509804, 1, 1,
0.1549685, -0.4172508, 1.075422, 0, 0.8431373, 1, 1,
0.1575226, 0.0282188, 0.9872233, 0, 0.8392157, 1, 1,
0.1587735, -0.3521217, 4.252437, 0, 0.8313726, 1, 1,
0.1589415, -0.8009048, 2.304451, 0, 0.827451, 1, 1,
0.1590194, -0.570857, 3.951195, 0, 0.8196079, 1, 1,
0.1602238, 0.9528675, -1.660829, 0, 0.8156863, 1, 1,
0.1609401, 0.9928027, -0.7673882, 0, 0.8078431, 1, 1,
0.1667439, 0.436397, 1.074031, 0, 0.8039216, 1, 1,
0.1738231, 0.0390874, -0.2635058, 0, 0.7960784, 1, 1,
0.173843, 0.43931, 1.854999, 0, 0.7882353, 1, 1,
0.1739303, -0.3180409, 3.700456, 0, 0.7843137, 1, 1,
0.1742604, 0.9492329, 0.5305587, 0, 0.7764706, 1, 1,
0.1748925, 1.880427, -0.04550065, 0, 0.772549, 1, 1,
0.1777738, 1.526162, 0.1734771, 0, 0.7647059, 1, 1,
0.1801436, -0.3545232, 4.193901, 0, 0.7607843, 1, 1,
0.1805378, -0.1346796, 2.275146, 0, 0.7529412, 1, 1,
0.1836281, -0.5413178, 3.337835, 0, 0.7490196, 1, 1,
0.1859811, -1.512686, 4.654109, 0, 0.7411765, 1, 1,
0.1882884, -1.719398, 1.27728, 0, 0.7372549, 1, 1,
0.1926865, 1.720587, -1.359747, 0, 0.7294118, 1, 1,
0.2086791, -0.3066015, 4.885961, 0, 0.7254902, 1, 1,
0.2109826, 0.2521218, -0.3361187, 0, 0.7176471, 1, 1,
0.2179016, -0.3781744, 3.368075, 0, 0.7137255, 1, 1,
0.2190244, -1.832465, 3.068545, 0, 0.7058824, 1, 1,
0.2203024, 0.5402801, -0.4529244, 0, 0.6980392, 1, 1,
0.221247, 0.1198255, 0.6264024, 0, 0.6941177, 1, 1,
0.2214869, 1.475375, -1.120808, 0, 0.6862745, 1, 1,
0.2274911, -1.082239, 2.175527, 0, 0.682353, 1, 1,
0.2278541, -0.1633536, 1.747516, 0, 0.6745098, 1, 1,
0.2328517, 1.307407, 0.9651794, 0, 0.6705883, 1, 1,
0.2340823, 2.430428, 0.205831, 0, 0.6627451, 1, 1,
0.2451111, 0.9742399, 1.51335, 0, 0.6588235, 1, 1,
0.2460096, 0.4227591, 1.430976, 0, 0.6509804, 1, 1,
0.2499002, 0.3749636, 1.440607, 0, 0.6470588, 1, 1,
0.2537522, -1.581333, 2.789456, 0, 0.6392157, 1, 1,
0.2549532, 0.5359122, 0.5782723, 0, 0.6352941, 1, 1,
0.2579469, 1.123217, 0.3429462, 0, 0.627451, 1, 1,
0.2599716, 0.6821582, -0.2219487, 0, 0.6235294, 1, 1,
0.2614971, -0.8813761, 3.904561, 0, 0.6156863, 1, 1,
0.2647457, 0.783193, 0.0160358, 0, 0.6117647, 1, 1,
0.2666804, -0.8298191, 1.81093, 0, 0.6039216, 1, 1,
0.2675386, 0.1605509, 2.163679, 0, 0.5960785, 1, 1,
0.2812752, -0.5743222, 2.607961, 0, 0.5921569, 1, 1,
0.2831516, 1.26324, 1.563899, 0, 0.5843138, 1, 1,
0.2872089, 1.257366, -0.9604021, 0, 0.5803922, 1, 1,
0.287653, -1.456015, 2.999821, 0, 0.572549, 1, 1,
0.2893453, 1.32068, -1.142471, 0, 0.5686275, 1, 1,
0.2934026, 0.3558914, 0.4492993, 0, 0.5607843, 1, 1,
0.2941982, -0.7869881, 0.8361962, 0, 0.5568628, 1, 1,
0.2989368, 1.186054, 1.222661, 0, 0.5490196, 1, 1,
0.3003304, 1.239078, 0.3215205, 0, 0.5450981, 1, 1,
0.3010496, 0.7601739, -0.3493221, 0, 0.5372549, 1, 1,
0.3035204, -0.5106984, 1.410694, 0, 0.5333334, 1, 1,
0.3050369, -0.9318931, 3.902587, 0, 0.5254902, 1, 1,
0.3071442, -2.196945, 3.764328, 0, 0.5215687, 1, 1,
0.3096012, -0.5643572, 3.094731, 0, 0.5137255, 1, 1,
0.3111823, -2.094073, 4.58558, 0, 0.509804, 1, 1,
0.3145189, -0.4668919, 3.220539, 0, 0.5019608, 1, 1,
0.3165117, 0.09391728, 1.594236, 0, 0.4941176, 1, 1,
0.3211051, -1.372527, 4.153107, 0, 0.4901961, 1, 1,
0.3224024, 1.021946, 0.7250487, 0, 0.4823529, 1, 1,
0.3236094, -0.008266125, 3.311975, 0, 0.4784314, 1, 1,
0.3274825, -0.5632031, 1.483771, 0, 0.4705882, 1, 1,
0.3310917, 2.452723, -0.8998451, 0, 0.4666667, 1, 1,
0.332325, 0.1237204, 2.754026, 0, 0.4588235, 1, 1,
0.332466, 0.3191218, 0.8011605, 0, 0.454902, 1, 1,
0.3324806, -1.627648, 2.853103, 0, 0.4470588, 1, 1,
0.3336346, 0.7876852, -0.424418, 0, 0.4431373, 1, 1,
0.3353776, 0.7772111, 1.261334, 0, 0.4352941, 1, 1,
0.3384556, -1.122123, 2.557021, 0, 0.4313726, 1, 1,
0.3403439, -1.205838, 2.823725, 0, 0.4235294, 1, 1,
0.3425237, 0.2285774, -0.2156015, 0, 0.4196078, 1, 1,
0.3430566, -1.96368, 4.75738, 0, 0.4117647, 1, 1,
0.3434076, -0.2797169, 0.8387511, 0, 0.4078431, 1, 1,
0.3449413, -0.6492598, 3.553041, 0, 0.4, 1, 1,
0.3453483, -0.07145406, 1.603673, 0, 0.3921569, 1, 1,
0.3475681, -1.553449, 2.696238, 0, 0.3882353, 1, 1,
0.3477609, 1.501644, 0.8944033, 0, 0.3803922, 1, 1,
0.3518972, 0.9425262, -0.63887, 0, 0.3764706, 1, 1,
0.3565273, -0.4135113, 0.5944088, 0, 0.3686275, 1, 1,
0.3575887, 0.05770906, 2.287764, 0, 0.3647059, 1, 1,
0.3582466, 0.2077697, 1.09774, 0, 0.3568628, 1, 1,
0.364136, 0.6972036, 2.2315, 0, 0.3529412, 1, 1,
0.3641795, 1.179856, 0.2499207, 0, 0.345098, 1, 1,
0.3661946, 0.5054435, -1.76441, 0, 0.3411765, 1, 1,
0.366957, -0.1592936, 2.925661, 0, 0.3333333, 1, 1,
0.3678159, 0.5852535, 1.843206, 0, 0.3294118, 1, 1,
0.3726571, 2.17698, 0.1976251, 0, 0.3215686, 1, 1,
0.3727014, -0.9144266, 0.5027194, 0, 0.3176471, 1, 1,
0.3732294, -0.9437469, 3.826865, 0, 0.3098039, 1, 1,
0.3750848, 2.258812, 0.458962, 0, 0.3058824, 1, 1,
0.3767988, -1.676416, 1.326237, 0, 0.2980392, 1, 1,
0.3771261, 1.48156, -1.194317, 0, 0.2901961, 1, 1,
0.3775726, 1.204375, 0.2212391, 0, 0.2862745, 1, 1,
0.3780355, 0.6671328, 2.606747, 0, 0.2784314, 1, 1,
0.3786029, -0.3487719, 2.149488, 0, 0.2745098, 1, 1,
0.3824748, 0.3370099, 1.178398, 0, 0.2666667, 1, 1,
0.3833234, 0.9318433, -0.6315462, 0, 0.2627451, 1, 1,
0.3855403, 0.1450443, 1.975664, 0, 0.254902, 1, 1,
0.3863809, -0.04673716, 0.7557248, 0, 0.2509804, 1, 1,
0.3880781, 0.5505951, 1.984914, 0, 0.2431373, 1, 1,
0.3897252, -0.9517105, 2.112733, 0, 0.2392157, 1, 1,
0.3918045, 0.4422148, 1.718271, 0, 0.2313726, 1, 1,
0.391951, -1.007615, 4.141609, 0, 0.227451, 1, 1,
0.3920274, 0.3890568, -0.01586067, 0, 0.2196078, 1, 1,
0.3946273, 1.302163, 0.7616589, 0, 0.2156863, 1, 1,
0.3999654, -0.1683634, 2.392141, 0, 0.2078431, 1, 1,
0.4004988, 1.034285, 2.012968, 0, 0.2039216, 1, 1,
0.4037527, -0.3145282, 2.19292, 0, 0.1960784, 1, 1,
0.4055161, 0.2860464, 1.435678, 0, 0.1882353, 1, 1,
0.406517, 0.9053141, 0.2390874, 0, 0.1843137, 1, 1,
0.4073706, 0.4804209, 1.146305, 0, 0.1764706, 1, 1,
0.4091628, 0.2483292, -0.3817637, 0, 0.172549, 1, 1,
0.4110406, -2.111819, 1.999446, 0, 0.1647059, 1, 1,
0.4115814, -1.15331, 4.227634, 0, 0.1607843, 1, 1,
0.4115913, 0.3058717, -0.3477634, 0, 0.1529412, 1, 1,
0.413075, -0.03695551, -1.417032, 0, 0.1490196, 1, 1,
0.4157135, 0.9861926, -1.43244, 0, 0.1411765, 1, 1,
0.4161741, -0.4210044, 4.450952, 0, 0.1372549, 1, 1,
0.4163223, -0.3526576, 2.626983, 0, 0.1294118, 1, 1,
0.4186526, -0.3226609, 1.662044, 0, 0.1254902, 1, 1,
0.4212488, 1.011676, 1.326296, 0, 0.1176471, 1, 1,
0.4269636, -1.367306, 2.430543, 0, 0.1137255, 1, 1,
0.4293379, 1.312778, 1.116268, 0, 0.1058824, 1, 1,
0.4332984, -0.08079438, 0.7094005, 0, 0.09803922, 1, 1,
0.4334415, -0.9179828, 3.696555, 0, 0.09411765, 1, 1,
0.4343803, 1.433153, -0.2635484, 0, 0.08627451, 1, 1,
0.4366883, -0.9560012, 3.744981, 0, 0.08235294, 1, 1,
0.4387613, 0.5459292, 0.3523812, 0, 0.07450981, 1, 1,
0.4416334, 0.8183934, 1.442029, 0, 0.07058824, 1, 1,
0.4417327, 0.8056061, 0.8008803, 0, 0.0627451, 1, 1,
0.4476834, 0.6523078, 0.1404867, 0, 0.05882353, 1, 1,
0.4477409, 1.063457, -0.339231, 0, 0.05098039, 1, 1,
0.448784, -0.1871931, 0.8641456, 0, 0.04705882, 1, 1,
0.449029, 1.312529, 0.4280141, 0, 0.03921569, 1, 1,
0.4520498, -0.4428277, 3.622177, 0, 0.03529412, 1, 1,
0.4537563, -0.1952475, 1.720542, 0, 0.02745098, 1, 1,
0.4564037, -0.6415271, 0.6398159, 0, 0.02352941, 1, 1,
0.4565989, 0.7559182, 1.036284, 0, 0.01568628, 1, 1,
0.4583032, -0.7386103, 2.084152, 0, 0.01176471, 1, 1,
0.4593497, -1.502311, 4.173483, 0, 0.003921569, 1, 1,
0.4610633, 0.4202525, 1.151291, 0.003921569, 0, 1, 1,
0.4655246, 1.589963, -0.7119452, 0.007843138, 0, 1, 1,
0.4671061, -0.6543828, 2.665362, 0.01568628, 0, 1, 1,
0.4770901, 0.1892195, 1.131344, 0.01960784, 0, 1, 1,
0.4829121, -0.8867791, 3.114954, 0.02745098, 0, 1, 1,
0.4913861, 0.5430828, 1.128495, 0.03137255, 0, 1, 1,
0.4957139, -1.698897, 2.318235, 0.03921569, 0, 1, 1,
0.4979925, -0.9802074, 3.140192, 0.04313726, 0, 1, 1,
0.4985813, -1.038462, 0.2988912, 0.05098039, 0, 1, 1,
0.5044225, 0.5049192, 1.113776, 0.05490196, 0, 1, 1,
0.5078403, -0.1549008, 1.226116, 0.0627451, 0, 1, 1,
0.5123942, 0.8795566, -0.201676, 0.06666667, 0, 1, 1,
0.5162389, -0.1270807, 2.36062, 0.07450981, 0, 1, 1,
0.5242222, -1.821637, 3.48492, 0.07843138, 0, 1, 1,
0.5271837, 1.02093, 1.023032, 0.08627451, 0, 1, 1,
0.5300694, 0.1115555, 1.270786, 0.09019608, 0, 1, 1,
0.5337952, -1.42888, 4.497142, 0.09803922, 0, 1, 1,
0.5352028, 1.379863, 0.8482098, 0.1058824, 0, 1, 1,
0.5353734, -1.757271, 2.535916, 0.1098039, 0, 1, 1,
0.5453324, 0.5998105, 0.9383144, 0.1176471, 0, 1, 1,
0.5461488, -0.9927852, 1.845393, 0.1215686, 0, 1, 1,
0.5470682, -0.7805642, 4.030924, 0.1294118, 0, 1, 1,
0.5483111, 0.7968506, -0.4903644, 0.1333333, 0, 1, 1,
0.5486119, -1.235029, 2.417379, 0.1411765, 0, 1, 1,
0.5508714, 0.7061035, 0.7961179, 0.145098, 0, 1, 1,
0.5514598, 0.6039856, -1.200971, 0.1529412, 0, 1, 1,
0.5553972, -1.513182, 3.660996, 0.1568628, 0, 1, 1,
0.555634, -2.208954, 2.87136, 0.1647059, 0, 1, 1,
0.5568575, -0.04021823, 0.754999, 0.1686275, 0, 1, 1,
0.5588021, 0.9062435, 1.698902, 0.1764706, 0, 1, 1,
0.5628033, -0.07807221, 1.713603, 0.1803922, 0, 1, 1,
0.5632597, 1.52619, -1.295403, 0.1882353, 0, 1, 1,
0.5651458, -0.7394516, 1.760835, 0.1921569, 0, 1, 1,
0.5652388, -0.5169079, 2.099552, 0.2, 0, 1, 1,
0.5688459, -0.832678, 2.287544, 0.2078431, 0, 1, 1,
0.5689863, -0.2268827, 2.425633, 0.2117647, 0, 1, 1,
0.5692939, -0.2015959, 1.915244, 0.2196078, 0, 1, 1,
0.5726414, -0.1656339, 4.292421, 0.2235294, 0, 1, 1,
0.5727656, 0.2825671, 1.862829, 0.2313726, 0, 1, 1,
0.5753098, -0.3508016, 3.16313, 0.2352941, 0, 1, 1,
0.5784231, -0.1567697, 1.911615, 0.2431373, 0, 1, 1,
0.5793596, -0.8780534, 3.754632, 0.2470588, 0, 1, 1,
0.5852171, 0.03338562, 2.30909, 0.254902, 0, 1, 1,
0.585814, 1.289904, 0.1291389, 0.2588235, 0, 1, 1,
0.5918444, 0.1359277, 1.526434, 0.2666667, 0, 1, 1,
0.59194, -0.8574264, 3.499855, 0.2705882, 0, 1, 1,
0.5948473, -0.3679481, 2.440722, 0.2784314, 0, 1, 1,
0.5950252, -0.8162519, 1.793003, 0.282353, 0, 1, 1,
0.5958127, -1.983389, 1.652505, 0.2901961, 0, 1, 1,
0.6012047, -1.05774, 2.463665, 0.2941177, 0, 1, 1,
0.6021325, 0.05387374, 1.24313, 0.3019608, 0, 1, 1,
0.6024912, 0.07009346, 1.684531, 0.3098039, 0, 1, 1,
0.6042945, -1.989877, 1.826529, 0.3137255, 0, 1, 1,
0.6202058, 0.5094913, 1.42176, 0.3215686, 0, 1, 1,
0.6230847, 1.431258, 0.8734963, 0.3254902, 0, 1, 1,
0.6233506, 1.83709, 0.6716611, 0.3333333, 0, 1, 1,
0.6300221, 0.9574202, -0.9117813, 0.3372549, 0, 1, 1,
0.6322356, -0.379665, 3.344443, 0.345098, 0, 1, 1,
0.6380579, 0.0270512, 0.5238301, 0.3490196, 0, 1, 1,
0.6425153, -0.01117684, 1.700038, 0.3568628, 0, 1, 1,
0.6502855, -0.6384166, 2.112354, 0.3607843, 0, 1, 1,
0.6508414, 0.06404071, 0.7438835, 0.3686275, 0, 1, 1,
0.6554617, -1.616573, 2.936061, 0.372549, 0, 1, 1,
0.6566722, 1.884538, -0.520916, 0.3803922, 0, 1, 1,
0.6630492, -0.8344991, 1.319652, 0.3843137, 0, 1, 1,
0.6658421, 0.2228323, 1.541581, 0.3921569, 0, 1, 1,
0.6667919, -1.027283, 2.399788, 0.3960784, 0, 1, 1,
0.6692798, -0.01343032, 2.282506, 0.4039216, 0, 1, 1,
0.671401, 0.6984141, 0.1122718, 0.4117647, 0, 1, 1,
0.671637, 0.3095051, 1.592032, 0.4156863, 0, 1, 1,
0.6752511, -0.1777107, 1.667819, 0.4235294, 0, 1, 1,
0.6754272, -1.080497, 2.990406, 0.427451, 0, 1, 1,
0.6782191, -1.525042, 3.40927, 0.4352941, 0, 1, 1,
0.6830799, 1.973126, -0.150302, 0.4392157, 0, 1, 1,
0.6858232, 1.013854, -0.1548975, 0.4470588, 0, 1, 1,
0.6906421, 0.2676274, 0.9755109, 0.4509804, 0, 1, 1,
0.6913432, 0.03507477, -0.5196321, 0.4588235, 0, 1, 1,
0.6949677, 0.6551263, -0.7773129, 0.4627451, 0, 1, 1,
0.7030422, -0.3379595, 2.213856, 0.4705882, 0, 1, 1,
0.7141307, 1.343241, 0.0426571, 0.4745098, 0, 1, 1,
0.7194749, 1.199781, 0.1048097, 0.4823529, 0, 1, 1,
0.7200969, 1.506461, 2.806177, 0.4862745, 0, 1, 1,
0.7264867, 0.0295308, 2.621681, 0.4941176, 0, 1, 1,
0.7318081, 1.147631, 0.8135675, 0.5019608, 0, 1, 1,
0.7323902, 1.493585, 0.8628492, 0.5058824, 0, 1, 1,
0.732471, 0.6216326, 0.2418698, 0.5137255, 0, 1, 1,
0.7326018, -0.3890876, 2.657134, 0.5176471, 0, 1, 1,
0.7334887, 0.2885878, -1.359386, 0.5254902, 0, 1, 1,
0.7466204, -0.2346294, 2.441998, 0.5294118, 0, 1, 1,
0.7474138, -0.4508089, 2.537535, 0.5372549, 0, 1, 1,
0.7488624, -0.709186, 2.073285, 0.5411765, 0, 1, 1,
0.7526558, -1.576257, 2.883168, 0.5490196, 0, 1, 1,
0.7584646, 1.539303, 0.9486635, 0.5529412, 0, 1, 1,
0.7633758, -0.04321758, 2.916076, 0.5607843, 0, 1, 1,
0.7635874, 0.1188781, -0.2558697, 0.5647059, 0, 1, 1,
0.76475, 0.8762654, 0.804408, 0.572549, 0, 1, 1,
0.7660655, -1.296179, 1.903097, 0.5764706, 0, 1, 1,
0.7699501, 1.637108, -0.529787, 0.5843138, 0, 1, 1,
0.7739611, 1.072513, 1.026541, 0.5882353, 0, 1, 1,
0.7747644, 0.3507152, 3.112785, 0.5960785, 0, 1, 1,
0.7759484, 0.08375768, 1.502435, 0.6039216, 0, 1, 1,
0.7765969, 0.24292, 1.583862, 0.6078432, 0, 1, 1,
0.7836818, -1.611427, 3.920433, 0.6156863, 0, 1, 1,
0.7846523, -0.4548676, 2.472064, 0.6196079, 0, 1, 1,
0.7891852, -0.6487489, 0.9512793, 0.627451, 0, 1, 1,
0.7892143, -0.8708752, 2.656632, 0.6313726, 0, 1, 1,
0.7922729, 0.2387319, 0.4535703, 0.6392157, 0, 1, 1,
0.7936621, -0.7754691, 1.91307, 0.6431373, 0, 1, 1,
0.793737, 0.417417, 0.9358267, 0.6509804, 0, 1, 1,
0.794506, -1.272316, 1.745557, 0.654902, 0, 1, 1,
0.7992691, 0.05230143, 0.08546947, 0.6627451, 0, 1, 1,
0.8004035, -0.727427, 2.400632, 0.6666667, 0, 1, 1,
0.8099329, 0.2467487, 2.241256, 0.6745098, 0, 1, 1,
0.8174486, -1.765421, 2.187403, 0.6784314, 0, 1, 1,
0.8228679, 0.6335644, 0.4698518, 0.6862745, 0, 1, 1,
0.8256142, 0.9547564, 0.7474839, 0.6901961, 0, 1, 1,
0.8267259, -0.1042289, 1.709138, 0.6980392, 0, 1, 1,
0.8277406, -0.2526985, 0.5891029, 0.7058824, 0, 1, 1,
0.8302664, -1.296394, 2.792232, 0.7098039, 0, 1, 1,
0.8315849, -1.485777, 3.431149, 0.7176471, 0, 1, 1,
0.8382357, -0.3367717, 2.932626, 0.7215686, 0, 1, 1,
0.8382999, -0.7526894, 3.827445, 0.7294118, 0, 1, 1,
0.8391845, -0.1368971, 0.5353301, 0.7333333, 0, 1, 1,
0.8405128, -1.028185, 2.121753, 0.7411765, 0, 1, 1,
0.8417333, 0.9415731, 0.4207447, 0.7450981, 0, 1, 1,
0.8419864, -1.811365, 3.914427, 0.7529412, 0, 1, 1,
0.8425018, -1.602626, 2.229153, 0.7568628, 0, 1, 1,
0.8433885, -1.603079, 3.496542, 0.7647059, 0, 1, 1,
0.8515103, 0.7966239, 1.10167, 0.7686275, 0, 1, 1,
0.8624138, 1.740964, -0.0384756, 0.7764706, 0, 1, 1,
0.8631753, -0.09577581, 1.21352, 0.7803922, 0, 1, 1,
0.8646198, -0.4375901, 1.396959, 0.7882353, 0, 1, 1,
0.8660563, 1.541772, -0.229132, 0.7921569, 0, 1, 1,
0.8709952, 0.1359426, 2.715981, 0.8, 0, 1, 1,
0.8754817, 0.6962584, 0.3434975, 0.8078431, 0, 1, 1,
0.8793041, -0.01323773, -0.07379677, 0.8117647, 0, 1, 1,
0.8797753, -0.09380338, 1.106246, 0.8196079, 0, 1, 1,
0.8809789, 0.1985234, 3.509713, 0.8235294, 0, 1, 1,
0.8820469, 0.6027393, 0.03068108, 0.8313726, 0, 1, 1,
0.8861635, 0.1626535, 1.273247, 0.8352941, 0, 1, 1,
0.8871869, -0.5779077, 2.261373, 0.8431373, 0, 1, 1,
0.8909702, 0.6724024, 1.529683, 0.8470588, 0, 1, 1,
0.8931772, -1.631889, -0.4245416, 0.854902, 0, 1, 1,
0.8933993, -0.5931537, 1.914137, 0.8588235, 0, 1, 1,
0.8948388, -0.006712349, 4.174868, 0.8666667, 0, 1, 1,
0.895905, -0.2483788, 1.560595, 0.8705882, 0, 1, 1,
0.8971344, -0.3119699, 1.816084, 0.8784314, 0, 1, 1,
0.9045154, 0.9529133, 1.479996, 0.8823529, 0, 1, 1,
0.906442, -0.4765743, 2.902871, 0.8901961, 0, 1, 1,
0.9103035, -0.9039946, 1.502359, 0.8941177, 0, 1, 1,
0.9123198, 1.420722, 0.6984087, 0.9019608, 0, 1, 1,
0.9135743, 1.300682, -0.4384297, 0.9098039, 0, 1, 1,
0.9136551, -0.7155468, 2.699556, 0.9137255, 0, 1, 1,
0.9191967, 0.6086187, -0.3695882, 0.9215686, 0, 1, 1,
0.9247956, -1.736726, 2.692923, 0.9254902, 0, 1, 1,
0.936412, -0.7473629, 2.284787, 0.9333333, 0, 1, 1,
0.9374308, 0.01529232, 1.943989, 0.9372549, 0, 1, 1,
0.9455914, -1.36831, 3.113888, 0.945098, 0, 1, 1,
0.9464517, -0.3960932, 0.3344419, 0.9490196, 0, 1, 1,
0.9514694, -1.084689, 2.925903, 0.9568627, 0, 1, 1,
0.9661095, -0.7382444, 1.166059, 0.9607843, 0, 1, 1,
0.9677984, -1.142226, 2.860797, 0.9686275, 0, 1, 1,
0.9939209, -2.140874, 1.85838, 0.972549, 0, 1, 1,
0.9958818, -1.319029, 3.986757, 0.9803922, 0, 1, 1,
1.002216, 1.577671, -0.7335115, 0.9843137, 0, 1, 1,
1.006686, 0.8215478, 2.551974, 0.9921569, 0, 1, 1,
1.006686, 0.7323552, 0.01432442, 0.9960784, 0, 1, 1,
1.015507, 0.6179686, 0.4399989, 1, 0, 0.9960784, 1,
1.017153, 0.7152469, 0.1894682, 1, 0, 0.9882353, 1,
1.021363, -0.1974873, 1.439732, 1, 0, 0.9843137, 1,
1.025124, 0.4594485, 1.626115, 1, 0, 0.9764706, 1,
1.027918, -1.179219, 3.683687, 1, 0, 0.972549, 1,
1.02979, 0.8746213, -1.056389, 1, 0, 0.9647059, 1,
1.030856, 0.3117295, 2.51698, 1, 0, 0.9607843, 1,
1.034332, -0.2890693, 1.363929, 1, 0, 0.9529412, 1,
1.034795, 0.930301, 1.707236, 1, 0, 0.9490196, 1,
1.036557, -0.6852217, 3.006284, 1, 0, 0.9411765, 1,
1.039921, -0.1187009, 0.9563003, 1, 0, 0.9372549, 1,
1.052517, -1.273532, 1.693327, 1, 0, 0.9294118, 1,
1.056991, 0.9471845, 1.485218, 1, 0, 0.9254902, 1,
1.058533, 1.416599, 2.593569, 1, 0, 0.9176471, 1,
1.05916, -0.4781903, 2.563291, 1, 0, 0.9137255, 1,
1.061511, -0.9552802, 1.791683, 1, 0, 0.9058824, 1,
1.062018, -1.016222, 3.623069, 1, 0, 0.9019608, 1,
1.067116, -0.06588993, 3.667985, 1, 0, 0.8941177, 1,
1.074528, -0.9949429, 3.61901, 1, 0, 0.8862745, 1,
1.075857, 0.4737332, 0.08435771, 1, 0, 0.8823529, 1,
1.076604, 0.9611966, 1.356591, 1, 0, 0.8745098, 1,
1.081227, -1.44816, 2.147387, 1, 0, 0.8705882, 1,
1.083789, -0.06202712, -0.4604371, 1, 0, 0.8627451, 1,
1.094221, -1.030386, 1.355968, 1, 0, 0.8588235, 1,
1.096769, 0.2532134, 0.9019464, 1, 0, 0.8509804, 1,
1.097662, -0.6227221, 1.946464, 1, 0, 0.8470588, 1,
1.100781, 1.728297, -0.5743124, 1, 0, 0.8392157, 1,
1.106763, -0.502296, 1.765247, 1, 0, 0.8352941, 1,
1.108823, 0.09611666, 0.1667763, 1, 0, 0.827451, 1,
1.112401, 0.01604291, 1.633008, 1, 0, 0.8235294, 1,
1.117123, 0.07846075, 0.7938539, 1, 0, 0.8156863, 1,
1.122453, -0.1800617, 0.4534446, 1, 0, 0.8117647, 1,
1.131202, -0.1905544, 0.3715021, 1, 0, 0.8039216, 1,
1.139996, -0.9168429, 1.647339, 1, 0, 0.7960784, 1,
1.14112, 0.04231217, 1.173133, 1, 0, 0.7921569, 1,
1.142437, 0.03315666, 2.851871, 1, 0, 0.7843137, 1,
1.146857, 0.8695012, 1.77893, 1, 0, 0.7803922, 1,
1.15384, 1.209111, 0.1149407, 1, 0, 0.772549, 1,
1.154305, 0.09209207, 0.976733, 1, 0, 0.7686275, 1,
1.161996, 0.2083108, 0.690381, 1, 0, 0.7607843, 1,
1.163246, -1.461861, 3.81909, 1, 0, 0.7568628, 1,
1.167002, -0.2907366, 1.945036, 1, 0, 0.7490196, 1,
1.173962, 1.186707, 0.7125288, 1, 0, 0.7450981, 1,
1.179571, -0.4845192, 2.248539, 1, 0, 0.7372549, 1,
1.181063, -1.459635, 2.605502, 1, 0, 0.7333333, 1,
1.181399, -1.617563, 2.525271, 1, 0, 0.7254902, 1,
1.191332, -0.2258377, 1.163808, 1, 0, 0.7215686, 1,
1.193133, -0.2745459, 3.009471, 1, 0, 0.7137255, 1,
1.196378, 0.407016, 3.188226, 1, 0, 0.7098039, 1,
1.199329, 0.4846684, 0.5259376, 1, 0, 0.7019608, 1,
1.206066, -0.8045776, 3.67541, 1, 0, 0.6941177, 1,
1.213197, 0.6391628, 1.638654, 1, 0, 0.6901961, 1,
1.213233, -0.6066011, 2.398602, 1, 0, 0.682353, 1,
1.213503, -0.1779354, 1.787976, 1, 0, 0.6784314, 1,
1.217186, 0.3651123, 1.431109, 1, 0, 0.6705883, 1,
1.218399, -0.5486104, 3.680695, 1, 0, 0.6666667, 1,
1.222927, -1.328683, 2.808737, 1, 0, 0.6588235, 1,
1.227895, -1.090818, 2.09705, 1, 0, 0.654902, 1,
1.231943, 0.5711735, 0.3755485, 1, 0, 0.6470588, 1,
1.235903, 0.1889061, 1.039706, 1, 0, 0.6431373, 1,
1.236204, -0.9193917, 3.358461, 1, 0, 0.6352941, 1,
1.242687, 1.162615, 1.361311, 1, 0, 0.6313726, 1,
1.258949, -0.6925916, 4.258384, 1, 0, 0.6235294, 1,
1.259161, 0.1772078, -0.5959316, 1, 0, 0.6196079, 1,
1.267444, 1.012494, 1.394663, 1, 0, 0.6117647, 1,
1.268992, 0.7011157, 1.544051, 1, 0, 0.6078432, 1,
1.269188, -0.4240648, 2.017802, 1, 0, 0.6, 1,
1.270889, 0.676851, 0.5769214, 1, 0, 0.5921569, 1,
1.280386, -1.44342, 2.45198, 1, 0, 0.5882353, 1,
1.2829, 0.5953234, 2.291146, 1, 0, 0.5803922, 1,
1.284185, 0.457987, 0.8694369, 1, 0, 0.5764706, 1,
1.29145, 0.9106064, 1.715639, 1, 0, 0.5686275, 1,
1.292974, 0.768175, 1.939294, 1, 0, 0.5647059, 1,
1.30012, 1.825083, 0.1516172, 1, 0, 0.5568628, 1,
1.300554, 0.4853865, 1.640417, 1, 0, 0.5529412, 1,
1.30136, 0.6106859, 1.018532, 1, 0, 0.5450981, 1,
1.309227, -0.02138134, 1.424114, 1, 0, 0.5411765, 1,
1.317919, 0.4690886, -0.1583567, 1, 0, 0.5333334, 1,
1.323906, 0.1686856, -0.01323865, 1, 0, 0.5294118, 1,
1.325649, -0.9430131, 0.7870297, 1, 0, 0.5215687, 1,
1.335734, 0.09061239, 0.8411388, 1, 0, 0.5176471, 1,
1.338298, 0.2948474, 0.6316196, 1, 0, 0.509804, 1,
1.341886, 0.2987943, 1.36278, 1, 0, 0.5058824, 1,
1.355896, 0.5232046, 1.975966, 1, 0, 0.4980392, 1,
1.356193, -0.1254708, 1.926287, 1, 0, 0.4901961, 1,
1.363261, 1.276456, 1.954935, 1, 0, 0.4862745, 1,
1.367124, 1.191557, 0.8055099, 1, 0, 0.4784314, 1,
1.37967, 0.1675749, 1.746676, 1, 0, 0.4745098, 1,
1.380324, 0.2761884, 2.527451, 1, 0, 0.4666667, 1,
1.387895, -0.043984, 1.466307, 1, 0, 0.4627451, 1,
1.392798, 1.010366, 2.002828, 1, 0, 0.454902, 1,
1.396268, 0.1883329, 2.90479, 1, 0, 0.4509804, 1,
1.409767, 0.7807711, 1.243708, 1, 0, 0.4431373, 1,
1.416109, 1.961235, 1.45243, 1, 0, 0.4392157, 1,
1.416841, 2.416852, 1.722918, 1, 0, 0.4313726, 1,
1.462008, 0.5115284, 0.5948963, 1, 0, 0.427451, 1,
1.467315, -0.8851942, 3.592707, 1, 0, 0.4196078, 1,
1.490495, 0.2507637, 1.516451, 1, 0, 0.4156863, 1,
1.505232, 0.1634657, 3.170696, 1, 0, 0.4078431, 1,
1.505882, -1.624826, 3.3323, 1, 0, 0.4039216, 1,
1.525092, -0.1532093, 2.346334, 1, 0, 0.3960784, 1,
1.537985, -0.678152, 0.116292, 1, 0, 0.3882353, 1,
1.539349, 0.2808427, 2.5938, 1, 0, 0.3843137, 1,
1.55442, 0.6168448, 1.378851, 1, 0, 0.3764706, 1,
1.557315, 0.1828135, 2.008734, 1, 0, 0.372549, 1,
1.559139, 0.1042076, 2.337551, 1, 0, 0.3647059, 1,
1.560578, 0.3147925, 1.86152, 1, 0, 0.3607843, 1,
1.562211, 0.5798193, 0.6909856, 1, 0, 0.3529412, 1,
1.573958, 0.7219086, 0.4196687, 1, 0, 0.3490196, 1,
1.587029, -0.3896183, 0.8983212, 1, 0, 0.3411765, 1,
1.590069, 0.6849999, 0.1887218, 1, 0, 0.3372549, 1,
1.598083, 0.5180565, 0.009659927, 1, 0, 0.3294118, 1,
1.605042, -0.9665102, -0.5973686, 1, 0, 0.3254902, 1,
1.613835, 0.3821427, 1.910134, 1, 0, 0.3176471, 1,
1.616766, -0.6306567, 1.198781, 1, 0, 0.3137255, 1,
1.621104, -0.968628, 2.465749, 1, 0, 0.3058824, 1,
1.627518, 0.9156224, 3.43968, 1, 0, 0.2980392, 1,
1.641073, 1.446122, 0.4273385, 1, 0, 0.2941177, 1,
1.6547, -1.31792, 2.131227, 1, 0, 0.2862745, 1,
1.671772, 0.5706843, 0.7660701, 1, 0, 0.282353, 1,
1.695163, -0.1398803, 1.399034, 1, 0, 0.2745098, 1,
1.701645, 1.070891, 0.112552, 1, 0, 0.2705882, 1,
1.704885, -0.1807427, 3.269835, 1, 0, 0.2627451, 1,
1.727814, -2.113814, 1.572437, 1, 0, 0.2588235, 1,
1.739757, 0.582194, 1.989784, 1, 0, 0.2509804, 1,
1.743122, 0.4190894, 4.194417, 1, 0, 0.2470588, 1,
1.77326, -0.3688058, 1.137612, 1, 0, 0.2392157, 1,
1.774789, -0.7686995, 1.520058, 1, 0, 0.2352941, 1,
1.777786, -0.8760426, 1.122014, 1, 0, 0.227451, 1,
1.785829, -0.8296299, 2.378023, 1, 0, 0.2235294, 1,
1.788199, 0.219532, -0.06409058, 1, 0, 0.2156863, 1,
1.802878, 0.4874493, 0.8528521, 1, 0, 0.2117647, 1,
1.859185, -1.096972, 2.040452, 1, 0, 0.2039216, 1,
1.868108, 0.5071605, -0.1158646, 1, 0, 0.1960784, 1,
1.871007, 0.8579292, 1.282366, 1, 0, 0.1921569, 1,
1.873886, -0.6717046, 2.245361, 1, 0, 0.1843137, 1,
1.880565, 0.1251113, 1.175298, 1, 0, 0.1803922, 1,
1.884074, 0.1742633, 1.734497, 1, 0, 0.172549, 1,
1.904559, -1.010005, 2.918103, 1, 0, 0.1686275, 1,
1.920783, 0.3855656, 2.258807, 1, 0, 0.1607843, 1,
1.923984, 0.8013059, 1.153154, 1, 0, 0.1568628, 1,
1.939643, 0.256949, 0.3519634, 1, 0, 0.1490196, 1,
1.942509, 0.1767059, 1.441409, 1, 0, 0.145098, 1,
1.945134, -0.1643537, 1.440594, 1, 0, 0.1372549, 1,
1.946806, 0.9333278, 2.027986, 1, 0, 0.1333333, 1,
2.007395, 0.05554321, 0.8584741, 1, 0, 0.1254902, 1,
2.060281, -1.072551, 2.143963, 1, 0, 0.1215686, 1,
2.101523, 0.4802393, -0.05360788, 1, 0, 0.1137255, 1,
2.105604, 0.6295869, 4.463077, 1, 0, 0.1098039, 1,
2.129489, 0.551263, 2.220514, 1, 0, 0.1019608, 1,
2.186201, -0.5790628, 2.031344, 1, 0, 0.09411765, 1,
2.209032, 1.485983, 2.060702, 1, 0, 0.09019608, 1,
2.225204, 1.309419, 1.441602, 1, 0, 0.08235294, 1,
2.231831, -0.6259965, 1.804919, 1, 0, 0.07843138, 1,
2.27343, -1.839375, 1.21724, 1, 0, 0.07058824, 1,
2.294818, 0.4732899, 0.5441599, 1, 0, 0.06666667, 1,
2.330607, 1.473475, 0.4290664, 1, 0, 0.05882353, 1,
2.332344, 0.7230068, -0.1410841, 1, 0, 0.05490196, 1,
2.42138, -0.1711372, 2.029661, 1, 0, 0.04705882, 1,
2.488774, -0.07871601, 1.271297, 1, 0, 0.04313726, 1,
2.493124, 0.558076, 1.984872, 1, 0, 0.03529412, 1,
2.560499, -0.07734673, 1.763113, 1, 0, 0.03137255, 1,
2.568906, -0.5792359, 2.053069, 1, 0, 0.02352941, 1,
2.622877, 0.9895689, 2.625099, 1, 0, 0.01960784, 1,
2.830566, 1.147038, -0.265821, 1, 0, 0.01176471, 1,
3.583089, 0.1180906, 1.726666, 1, 0, 0.007843138, 1
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
0.2973744, -3.677181, -7.040494, 0, -0.5, 0.5, 0.5,
0.2973744, -3.677181, -7.040494, 1, -0.5, 0.5, 0.5,
0.2973744, -3.677181, -7.040494, 1, 1.5, 0.5, 0.5,
0.2973744, -3.677181, -7.040494, 0, 1.5, 0.5, 0.5
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
-4.102197, -0.03754556, -7.040494, 0, -0.5, 0.5, 0.5,
-4.102197, -0.03754556, -7.040494, 1, -0.5, 0.5, 0.5,
-4.102197, -0.03754556, -7.040494, 1, 1.5, 0.5, 0.5,
-4.102197, -0.03754556, -7.040494, 0, 1.5, 0.5, 0.5
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
-4.102197, -3.677181, -0.2129939, 0, -0.5, 0.5, 0.5,
-4.102197, -3.677181, -0.2129939, 1, -0.5, 0.5, 0.5,
-4.102197, -3.677181, -0.2129939, 1, 1.5, 0.5, 0.5,
-4.102197, -3.677181, -0.2129939, 0, 1.5, 0.5, 0.5
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
-2, -2.837265, -5.464917,
3, -2.837265, -5.464917,
-2, -2.837265, -5.464917,
-2, -2.977251, -5.727513,
-1, -2.837265, -5.464917,
-1, -2.977251, -5.727513,
0, -2.837265, -5.464917,
0, -2.977251, -5.727513,
1, -2.837265, -5.464917,
1, -2.977251, -5.727513,
2, -2.837265, -5.464917,
2, -2.977251, -5.727513,
3, -2.837265, -5.464917,
3, -2.977251, -5.727513
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
-2, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
-2, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
-2, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
-2, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5,
-1, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
-1, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
-1, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
-1, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5,
0, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
0, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
0, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
0, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5,
1, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
1, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
1, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
1, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5,
2, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
2, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
2, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
2, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5,
3, -3.257223, -6.252706, 0, -0.5, 0.5, 0.5,
3, -3.257223, -6.252706, 1, -0.5, 0.5, 0.5,
3, -3.257223, -6.252706, 1, 1.5, 0.5, 0.5,
3, -3.257223, -6.252706, 0, 1.5, 0.5, 0.5
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
-3.086911, -2, -5.464917,
-3.086911, 2, -5.464917,
-3.086911, -2, -5.464917,
-3.256126, -2, -5.727513,
-3.086911, -1, -5.464917,
-3.256126, -1, -5.727513,
-3.086911, 0, -5.464917,
-3.256126, 0, -5.727513,
-3.086911, 1, -5.464917,
-3.256126, 1, -5.727513,
-3.086911, 2, -5.464917,
-3.256126, 2, -5.727513
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
-3.594554, -2, -6.252706, 0, -0.5, 0.5, 0.5,
-3.594554, -2, -6.252706, 1, -0.5, 0.5, 0.5,
-3.594554, -2, -6.252706, 1, 1.5, 0.5, 0.5,
-3.594554, -2, -6.252706, 0, 1.5, 0.5, 0.5,
-3.594554, -1, -6.252706, 0, -0.5, 0.5, 0.5,
-3.594554, -1, -6.252706, 1, -0.5, 0.5, 0.5,
-3.594554, -1, -6.252706, 1, 1.5, 0.5, 0.5,
-3.594554, -1, -6.252706, 0, 1.5, 0.5, 0.5,
-3.594554, 0, -6.252706, 0, -0.5, 0.5, 0.5,
-3.594554, 0, -6.252706, 1, -0.5, 0.5, 0.5,
-3.594554, 0, -6.252706, 1, 1.5, 0.5, 0.5,
-3.594554, 0, -6.252706, 0, 1.5, 0.5, 0.5,
-3.594554, 1, -6.252706, 0, -0.5, 0.5, 0.5,
-3.594554, 1, -6.252706, 1, -0.5, 0.5, 0.5,
-3.594554, 1, -6.252706, 1, 1.5, 0.5, 0.5,
-3.594554, 1, -6.252706, 0, 1.5, 0.5, 0.5,
-3.594554, 2, -6.252706, 0, -0.5, 0.5, 0.5,
-3.594554, 2, -6.252706, 1, -0.5, 0.5, 0.5,
-3.594554, 2, -6.252706, 1, 1.5, 0.5, 0.5,
-3.594554, 2, -6.252706, 0, 1.5, 0.5, 0.5
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
-3.086911, -2.837265, -4,
-3.086911, -2.837265, 4,
-3.086911, -2.837265, -4,
-3.256126, -2.977251, -4,
-3.086911, -2.837265, -2,
-3.256126, -2.977251, -2,
-3.086911, -2.837265, 0,
-3.256126, -2.977251, 0,
-3.086911, -2.837265, 2,
-3.256126, -2.977251, 2,
-3.086911, -2.837265, 4,
-3.256126, -2.977251, 4
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
-3.594554, -3.257223, -4, 0, -0.5, 0.5, 0.5,
-3.594554, -3.257223, -4, 1, -0.5, 0.5, 0.5,
-3.594554, -3.257223, -4, 1, 1.5, 0.5, 0.5,
-3.594554, -3.257223, -4, 0, 1.5, 0.5, 0.5,
-3.594554, -3.257223, -2, 0, -0.5, 0.5, 0.5,
-3.594554, -3.257223, -2, 1, -0.5, 0.5, 0.5,
-3.594554, -3.257223, -2, 1, 1.5, 0.5, 0.5,
-3.594554, -3.257223, -2, 0, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 0, 0, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 0, 1, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 0, 1, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 0, 0, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 2, 0, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 2, 1, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 2, 1, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 2, 0, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 4, 0, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 4, 1, -0.5, 0.5, 0.5,
-3.594554, -3.257223, 4, 1, 1.5, 0.5, 0.5,
-3.594554, -3.257223, 4, 0, 1.5, 0.5, 0.5
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
-3.086911, -2.837265, -5.464917,
-3.086911, 2.762174, -5.464917,
-3.086911, -2.837265, 5.038929,
-3.086911, 2.762174, 5.038929,
-3.086911, -2.837265, -5.464917,
-3.086911, -2.837265, 5.038929,
-3.086911, 2.762174, -5.464917,
-3.086911, 2.762174, 5.038929,
-3.086911, -2.837265, -5.464917,
3.68166, -2.837265, -5.464917,
-3.086911, -2.837265, 5.038929,
3.68166, -2.837265, 5.038929,
-3.086911, 2.762174, -5.464917,
3.68166, 2.762174, -5.464917,
-3.086911, 2.762174, 5.038929,
3.68166, 2.762174, 5.038929,
3.68166, -2.837265, -5.464917,
3.68166, 2.762174, -5.464917,
3.68166, -2.837265, 5.038929,
3.68166, 2.762174, 5.038929,
3.68166, -2.837265, -5.464917,
3.68166, -2.837265, 5.038929,
3.68166, 2.762174, -5.464917,
3.68166, 2.762174, 5.038929
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
var radius = 7.311792;
var distance = 32.53099;
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
mvMatrix.translate( -0.2973744, 0.03754556, 0.2129939 );
mvMatrix.scale( 1.167994, 1.411865, 0.7526436 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.53099);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
1-(3-methylphenyl)-5<-read.table("1-(3-methylphenyl)-5.xyz")
```

```
## Error in read.table("1-(3-methylphenyl)-5.xyz"): no lines available in input
```

```r
x<-1-(3-methylphenyl)-5$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylphenyl' not found
```

```r
y<-1-(3-methylphenyl)-5$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylphenyl' not found
```

```r
z<-1-(3-methylphenyl)-5$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylphenyl' not found
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
-2.98834, -1.080755, -0.3825902, 0, 0, 1, 1, 1,
-2.880887, 0.2200479, -1.329393, 1, 0, 0, 1, 1,
-2.725545, 0.3687894, -3.109706, 1, 0, 0, 1, 1,
-2.597242, 0.6181281, -2.767524, 1, 0, 0, 1, 1,
-2.554057, 0.3246167, -1.986774, 1, 0, 0, 1, 1,
-2.485739, -0.9610459, -0.57848, 1, 0, 0, 1, 1,
-2.399287, 0.8101013, -1.646555, 0, 0, 0, 1, 1,
-2.369384, 2.523156, -1.320754, 0, 0, 0, 1, 1,
-2.331726, -0.4457828, -2.513478, 0, 0, 0, 1, 1,
-2.277862, -0.3282, -2.192001, 0, 0, 0, 1, 1,
-2.248945, -2.75572, -1.144921, 0, 0, 0, 1, 1,
-2.222048, -0.7822752, -0.5224013, 0, 0, 0, 1, 1,
-2.198482, 0.571959, -1.295314, 0, 0, 0, 1, 1,
-2.181001, -1.223417, -1.955259, 1, 1, 1, 1, 1,
-2.175774, -1.735571, -2.852471, 1, 1, 1, 1, 1,
-2.173158, 1.164265, -0.2381908, 1, 1, 1, 1, 1,
-2.171914, -0.9227551, -1.514757, 1, 1, 1, 1, 1,
-2.156053, 0.3196079, -0.3122404, 1, 1, 1, 1, 1,
-2.10961, 0.8418539, -1.587105, 1, 1, 1, 1, 1,
-2.10594, -0.2522728, -2.946425, 1, 1, 1, 1, 1,
-2.104261, -0.09188145, -2.608678, 1, 1, 1, 1, 1,
-2.086282, -0.5560001, -1.551514, 1, 1, 1, 1, 1,
-2.086036, -1.460994, -1.488781, 1, 1, 1, 1, 1,
-2.078282, -0.7897597, -1.94139, 1, 1, 1, 1, 1,
-2.035166, 0.6943849, -2.56551, 1, 1, 1, 1, 1,
-1.997513, 0.4315514, -2.834619, 1, 1, 1, 1, 1,
-1.918172, -0.9733007, -3.161235, 1, 1, 1, 1, 1,
-1.900545, 0.8644283, 1.804424, 1, 1, 1, 1, 1,
-1.896649, 1.289998, 0.5402461, 0, 0, 1, 1, 1,
-1.88329, -0.3640652, -1.832251, 1, 0, 0, 1, 1,
-1.871115, -0.7175555, -2.029578, 1, 0, 0, 1, 1,
-1.869045, 0.3685436, -0.7896008, 1, 0, 0, 1, 1,
-1.836803, -1.489703, -1.785809, 1, 0, 0, 1, 1,
-1.825068, 0.3133036, -2.146261, 1, 0, 0, 1, 1,
-1.801032, -0.3577347, -2.766251, 0, 0, 0, 1, 1,
-1.784358, -1.100851, -5.311948, 0, 0, 0, 1, 1,
-1.767962, -0.1763225, -2.40131, 0, 0, 0, 1, 1,
-1.763844, -1.155469, -0.5424764, 0, 0, 0, 1, 1,
-1.749791, -0.2844965, -0.4444234, 0, 0, 0, 1, 1,
-1.74759, -2.385983, -2.396943, 0, 0, 0, 1, 1,
-1.734287, -0.8326606, -1.926504, 0, 0, 0, 1, 1,
-1.712334, -0.4196879, -1.334689, 1, 1, 1, 1, 1,
-1.704176, 1.051584, -3.793015, 1, 1, 1, 1, 1,
-1.691575, -1.546478, -1.890783, 1, 1, 1, 1, 1,
-1.683123, 0.446505, -0.5168755, 1, 1, 1, 1, 1,
-1.674492, 0.5563625, -0.4091483, 1, 1, 1, 1, 1,
-1.673526, 0.304045, -2.258625, 1, 1, 1, 1, 1,
-1.667904, -1.420627, -3.651951, 1, 1, 1, 1, 1,
-1.660374, -1.042029, -3.019533, 1, 1, 1, 1, 1,
-1.658949, -0.3775812, -1.544986, 1, 1, 1, 1, 1,
-1.645217, -0.3889384, -2.136248, 1, 1, 1, 1, 1,
-1.642877, -1.568451, -1.220224, 1, 1, 1, 1, 1,
-1.638525, 0.9597189, -0.9474313, 1, 1, 1, 1, 1,
-1.637227, -1.504882, -1.065066, 1, 1, 1, 1, 1,
-1.609987, 0.7711724, -1.517538, 1, 1, 1, 1, 1,
-1.602167, 1.394212, 0.1902523, 1, 1, 1, 1, 1,
-1.589034, -0.009629998, 0.6116168, 0, 0, 1, 1, 1,
-1.581257, -0.06768031, -1.114409, 1, 0, 0, 1, 1,
-1.5759, -0.2332584, -1.058593, 1, 0, 0, 1, 1,
-1.548483, 0.04712723, -1.264965, 1, 0, 0, 1, 1,
-1.545015, -0.7611143, -1.017889, 1, 0, 0, 1, 1,
-1.54355, -0.1330532, -3.841168, 1, 0, 0, 1, 1,
-1.541271, -0.04710477, -0.04237641, 0, 0, 0, 1, 1,
-1.530182, -0.1533535, -1.411363, 0, 0, 0, 1, 1,
-1.529594, 0.9101275, 0.1332918, 0, 0, 0, 1, 1,
-1.5134, -1.607072, -4.201783, 0, 0, 0, 1, 1,
-1.512367, 0.3965063, -3.208222, 0, 0, 0, 1, 1,
-1.508198, 0.05752114, -0.004678703, 0, 0, 0, 1, 1,
-1.507296, -0.8200235, -2.805453, 0, 0, 0, 1, 1,
-1.506044, 0.741093, -1.77617, 1, 1, 1, 1, 1,
-1.50543, 0.9828323, -0.6038504, 1, 1, 1, 1, 1,
-1.49741, -0.8723059, -2.717434, 1, 1, 1, 1, 1,
-1.49209, -1.993364, -1.518108, 1, 1, 1, 1, 1,
-1.490377, -0.6883426, -5.11623, 1, 1, 1, 1, 1,
-1.475206, 0.8006417, -0.6096458, 1, 1, 1, 1, 1,
-1.471383, 1.334146, -1.524277, 1, 1, 1, 1, 1,
-1.453248, 1.167132, -0.09570087, 1, 1, 1, 1, 1,
-1.448373, -0.3267338, -3.399391, 1, 1, 1, 1, 1,
-1.432795, -0.3595155, -1.249225, 1, 1, 1, 1, 1,
-1.427716, -1.183177, 0.1569706, 1, 1, 1, 1, 1,
-1.426581, -0.819333, -2.786013, 1, 1, 1, 1, 1,
-1.403626, -0.979377, -2.9025, 1, 1, 1, 1, 1,
-1.391992, -0.5775224, -2.882607, 1, 1, 1, 1, 1,
-1.387163, -0.6912764, -1.041504, 1, 1, 1, 1, 1,
-1.385615, 0.6777633, -0.5575962, 0, 0, 1, 1, 1,
-1.375878, 0.5905647, -0.4159068, 1, 0, 0, 1, 1,
-1.375543, 1.016796, -3.075063, 1, 0, 0, 1, 1,
-1.369547, -1.130318, -1.806418, 1, 0, 0, 1, 1,
-1.363048, 0.1972124, -2.263352, 1, 0, 0, 1, 1,
-1.359822, -0.8048501, -2.214985, 1, 0, 0, 1, 1,
-1.355612, -0.6901366, -0.9770271, 0, 0, 0, 1, 1,
-1.337304, -0.3994899, -2.047467, 0, 0, 0, 1, 1,
-1.333812, 0.4122953, -3.00689, 0, 0, 0, 1, 1,
-1.327805, -1.583222, -3.275646, 0, 0, 0, 1, 1,
-1.321868, 0.052675, -1.152688, 0, 0, 0, 1, 1,
-1.313149, -1.667817, -1.726223, 0, 0, 0, 1, 1,
-1.310866, -0.4380573, -0.07907227, 0, 0, 0, 1, 1,
-1.280674, 0.7339541, 0.2708032, 1, 1, 1, 1, 1,
-1.263795, 0.861479, -1.544391, 1, 1, 1, 1, 1,
-1.263059, -0.08057459, 0.7552809, 1, 1, 1, 1, 1,
-1.260833, -0.5519286, -2.71297, 1, 1, 1, 1, 1,
-1.260666, -0.4021356, -1.174976, 1, 1, 1, 1, 1,
-1.248962, 0.9620575, 1.149086, 1, 1, 1, 1, 1,
-1.247623, 1.341652, -0.9784005, 1, 1, 1, 1, 1,
-1.23687, -0.9515176, -1.777629, 1, 1, 1, 1, 1,
-1.223367, -0.01299236, -1.743738, 1, 1, 1, 1, 1,
-1.223246, -1.212766, -4.216047, 1, 1, 1, 1, 1,
-1.167469, 1.057913, -1.371882, 1, 1, 1, 1, 1,
-1.166672, 0.8228597, 0.01662501, 1, 1, 1, 1, 1,
-1.165711, 2.044082, -1.222934, 1, 1, 1, 1, 1,
-1.149995, -0.08516251, -2.211092, 1, 1, 1, 1, 1,
-1.147789, -0.3660897, -2.410092, 1, 1, 1, 1, 1,
-1.129219, -0.3754122, -4.479987, 0, 0, 1, 1, 1,
-1.123045, -1.834215, -2.686442, 1, 0, 0, 1, 1,
-1.115238, -1.282099, -3.608297, 1, 0, 0, 1, 1,
-1.113766, -0.09959318, -2.239628, 1, 0, 0, 1, 1,
-1.113437, -0.7604323, -2.837815, 1, 0, 0, 1, 1,
-1.111894, 0.3638082, -0.4858442, 1, 0, 0, 1, 1,
-1.108387, 0.106593, -2.593205, 0, 0, 0, 1, 1,
-1.108225, 0.4397441, -0.2711423, 0, 0, 0, 1, 1,
-1.103057, 0.8444988, -2.895262, 0, 0, 0, 1, 1,
-1.101866, -1.056561, -3.210141, 0, 0, 0, 1, 1,
-1.099475, 0.1859782, -1.752453, 0, 0, 0, 1, 1,
-1.095379, 0.4032782, -2.826587, 0, 0, 0, 1, 1,
-1.091655, -0.650112, -0.1479068, 0, 0, 0, 1, 1,
-1.089278, 1.866507, -0.6746319, 1, 1, 1, 1, 1,
-1.087343, -1.857255, -1.75663, 1, 1, 1, 1, 1,
-1.085917, 0.432694, -2.18141, 1, 1, 1, 1, 1,
-1.085165, 0.5812169, -0.771285, 1, 1, 1, 1, 1,
-1.08406, 0.5150552, -1.302089, 1, 1, 1, 1, 1,
-1.082395, -0.2757639, -1.074522, 1, 1, 1, 1, 1,
-1.07225, -0.4882503, -1.011209, 1, 1, 1, 1, 1,
-1.047664, 0.8828285, -2.419776, 1, 1, 1, 1, 1,
-1.047071, -0.1236843, -4.04033, 1, 1, 1, 1, 1,
-1.046948, 0.2028096, -1.261777, 1, 1, 1, 1, 1,
-1.046306, -1.537829, -3.015649, 1, 1, 1, 1, 1,
-1.045627, -0.3800723, 1.325967, 1, 1, 1, 1, 1,
-1.041498, -1.344798, -2.039554, 1, 1, 1, 1, 1,
-1.03771, -0.08705318, -0.01702873, 1, 1, 1, 1, 1,
-1.030847, -1.296096, -3.258744, 1, 1, 1, 1, 1,
-1.030663, -1.821919, -4.319693, 0, 0, 1, 1, 1,
-1.028632, -0.106845, 0.4235864, 1, 0, 0, 1, 1,
-1.027445, -1.337569, -2.338863, 1, 0, 0, 1, 1,
-1.024303, -1.017841, -1.824747, 1, 0, 0, 1, 1,
-1.022627, -1.316578, -1.549167, 1, 0, 0, 1, 1,
-1.022082, 0.7742805, -0.6878647, 1, 0, 0, 1, 1,
-1.017126, -0.05547769, -1.954388, 0, 0, 0, 1, 1,
-1.016453, -0.9686913, -2.673601, 0, 0, 0, 1, 1,
-1.016272, -0.2830653, 0.07210089, 0, 0, 0, 1, 1,
-1.009868, -0.05649705, -0.6359356, 0, 0, 0, 1, 1,
-1.006517, 2.190134, 0.07266796, 0, 0, 0, 1, 1,
-0.9818906, -1.499394, -2.823031, 0, 0, 0, 1, 1,
-0.9743893, -0.5976902, -2.690175, 0, 0, 0, 1, 1,
-0.9691438, 0.8004079, -1.914992, 1, 1, 1, 1, 1,
-0.9681236, -1.338109, -3.07024, 1, 1, 1, 1, 1,
-0.9656981, 0.5419512, -0.8684253, 1, 1, 1, 1, 1,
-0.9613314, 1.018818, 0.8424687, 1, 1, 1, 1, 1,
-0.9524887, 0.1213282, -0.1732274, 1, 1, 1, 1, 1,
-0.9466727, 0.9387706, 1.075384, 1, 1, 1, 1, 1,
-0.9212441, 0.1297009, -2.100426, 1, 1, 1, 1, 1,
-0.9199466, -1.109862, -1.798052, 1, 1, 1, 1, 1,
-0.9160534, 1.280015, -0.5423219, 1, 1, 1, 1, 1,
-0.9156196, -0.7789387, 0.2582254, 1, 1, 1, 1, 1,
-0.9075792, 0.6614423, 0.8193954, 1, 1, 1, 1, 1,
-0.90624, 0.7371966, -3.189076, 1, 1, 1, 1, 1,
-0.9021694, 0.2442336, -2.321112, 1, 1, 1, 1, 1,
-0.8953437, -1.034781, -3.076311, 1, 1, 1, 1, 1,
-0.8921931, 0.5491902, 0.02647155, 1, 1, 1, 1, 1,
-0.8892949, 0.2573888, -2.261163, 0, 0, 1, 1, 1,
-0.8892156, 1.506855, 0.9556928, 1, 0, 0, 1, 1,
-0.8879843, 0.2403968, -0.6096522, 1, 0, 0, 1, 1,
-0.87706, 0.5860551, 0.4703902, 1, 0, 0, 1, 1,
-0.8730956, -1.198456, -3.721648, 1, 0, 0, 1, 1,
-0.8695432, -0.1181991, -1.03862, 1, 0, 0, 1, 1,
-0.8658532, -0.04849905, -0.6960769, 0, 0, 0, 1, 1,
-0.8615052, -1.982395, -2.170506, 0, 0, 0, 1, 1,
-0.8567543, 0.6123172, -2.028585, 0, 0, 0, 1, 1,
-0.8530861, -0.9563323, -2.136675, 0, 0, 0, 1, 1,
-0.8525889, -0.3007007, -2.395256, 0, 0, 0, 1, 1,
-0.8457376, -1.652676, -3.970594, 0, 0, 0, 1, 1,
-0.8453915, -0.1666157, -1.151183, 0, 0, 0, 1, 1,
-0.8424447, -0.6594815, -2.621208, 1, 1, 1, 1, 1,
-0.8399841, -0.642502, -1.873202, 1, 1, 1, 1, 1,
-0.8389094, -1.386168, -2.941616, 1, 1, 1, 1, 1,
-0.8373839, 0.3271028, 0.5609879, 1, 1, 1, 1, 1,
-0.832131, 0.6008555, 0.6368957, 1, 1, 1, 1, 1,
-0.8228586, 0.5073478, -0.6563011, 1, 1, 1, 1, 1,
-0.8184751, -1.059944, -1.35083, 1, 1, 1, 1, 1,
-0.8164089, 0.9344502, 0.4743142, 1, 1, 1, 1, 1,
-0.8156501, 2.680629, -0.508601, 1, 1, 1, 1, 1,
-0.8153428, -1.850438, -3.10967, 1, 1, 1, 1, 1,
-0.8090951, -0.04210732, -2.862375, 1, 1, 1, 1, 1,
-0.8052117, -1.670875, -1.080607, 1, 1, 1, 1, 1,
-0.8017502, -0.9637432, -3.201985, 1, 1, 1, 1, 1,
-0.8014255, 0.02310475, -0.565893, 1, 1, 1, 1, 1,
-0.7962113, 1.845065, -0.05283321, 1, 1, 1, 1, 1,
-0.7895129, 1.355839, -0.07461927, 0, 0, 1, 1, 1,
-0.7877504, -0.6841834, -2.844733, 1, 0, 0, 1, 1,
-0.7876859, -1.404774, -2.717451, 1, 0, 0, 1, 1,
-0.7874941, -1.254536, -2.736828, 1, 0, 0, 1, 1,
-0.7810007, -0.0695798, -1.262596, 1, 0, 0, 1, 1,
-0.7727838, 0.01224859, -2.055094, 1, 0, 0, 1, 1,
-0.7716494, 1.998625, -1.074893, 0, 0, 0, 1, 1,
-0.760066, 1.991245, -1.419047, 0, 0, 0, 1, 1,
-0.7589874, 0.003833103, -2.634695, 0, 0, 0, 1, 1,
-0.7585831, 0.01728264, -1.255674, 0, 0, 0, 1, 1,
-0.7533947, -0.007115821, -1.840903, 0, 0, 0, 1, 1,
-0.7443342, -0.2480949, -2.448991, 0, 0, 0, 1, 1,
-0.7442755, -1.390835, -3.367145, 0, 0, 0, 1, 1,
-0.7401434, 2.100709, -0.9580145, 1, 1, 1, 1, 1,
-0.7358199, -0.8564858, -2.364098, 1, 1, 1, 1, 1,
-0.7323958, 0.4178658, -0.9755973, 1, 1, 1, 1, 1,
-0.7245347, 0.5885108, -0.2670693, 1, 1, 1, 1, 1,
-0.7236133, 0.05937919, -1.058844, 1, 1, 1, 1, 1,
-0.7206981, 1.075905, -1.394018, 1, 1, 1, 1, 1,
-0.718748, -1.516417, -2.357383, 1, 1, 1, 1, 1,
-0.7005879, 0.9168644, -0.7239966, 1, 1, 1, 1, 1,
-0.6998656, -0.6687977, -1.477953, 1, 1, 1, 1, 1,
-0.6986759, -0.1621782, -3.693725, 1, 1, 1, 1, 1,
-0.6933913, 0.2457064, -2.594993, 1, 1, 1, 1, 1,
-0.6918523, -0.2508028, -2.217185, 1, 1, 1, 1, 1,
-0.6901362, 0.2330163, -0.166249, 1, 1, 1, 1, 1,
-0.678946, 1.322299, -0.09502158, 1, 1, 1, 1, 1,
-0.6759751, 0.7200262, -0.9043026, 1, 1, 1, 1, 1,
-0.6747041, 1.190712, -0.3380472, 0, 0, 1, 1, 1,
-0.672898, 2.648182, 0.4843129, 1, 0, 0, 1, 1,
-0.6728327, 0.8096138, 0.2993106, 1, 0, 0, 1, 1,
-0.6669891, -0.1064781, -1.399543, 1, 0, 0, 1, 1,
-0.658237, -0.3895387, -2.635804, 1, 0, 0, 1, 1,
-0.6545952, 1.645102, -1.590967, 1, 0, 0, 1, 1,
-0.6500438, -1.090099, -3.44473, 0, 0, 0, 1, 1,
-0.6490949, -0.7619649, -2.182956, 0, 0, 0, 1, 1,
-0.6486797, 0.7137478, -0.7647592, 0, 0, 0, 1, 1,
-0.6458402, 0.1409926, -0.1701359, 0, 0, 0, 1, 1,
-0.6324337, -0.6740658, -2.444225, 0, 0, 0, 1, 1,
-0.6256048, -0.8306756, -2.785409, 0, 0, 0, 1, 1,
-0.6245946, -0.7228797, -3.505984, 0, 0, 0, 1, 1,
-0.6224121, 0.872256, -1.670823, 1, 1, 1, 1, 1,
-0.6220616, 1.205734, 0.7426875, 1, 1, 1, 1, 1,
-0.6189237, -0.0338327, -0.7171421, 1, 1, 1, 1, 1,
-0.615373, -0.7711924, -2.182284, 1, 1, 1, 1, 1,
-0.6120979, -0.09535845, -0.9537016, 1, 1, 1, 1, 1,
-0.6066968, 0.1125737, -1.782579, 1, 1, 1, 1, 1,
-0.6036491, -1.550079, -3.715721, 1, 1, 1, 1, 1,
-0.6031532, 0.1283526, -2.243331, 1, 1, 1, 1, 1,
-0.6021351, 0.7523419, -1.207906, 1, 1, 1, 1, 1,
-0.5988793, 0.2720914, -0.9641337, 1, 1, 1, 1, 1,
-0.5979372, -0.009991117, 0.1007046, 1, 1, 1, 1, 1,
-0.5967229, -0.6239672, -1.067453, 1, 1, 1, 1, 1,
-0.5935252, 1.457432, -0.5518701, 1, 1, 1, 1, 1,
-0.5923519, -0.7158634, -2.882097, 1, 1, 1, 1, 1,
-0.5917061, 0.7739597, 0.1524969, 1, 1, 1, 1, 1,
-0.5899752, 0.2520231, -2.845757, 0, 0, 1, 1, 1,
-0.5850878, 0.09392045, -0.06404123, 1, 0, 0, 1, 1,
-0.5841136, 0.8811505, -3.751195, 1, 0, 0, 1, 1,
-0.5817299, -1.234544, -2.944909, 1, 0, 0, 1, 1,
-0.5812251, 1.551408, 0.07748093, 1, 0, 0, 1, 1,
-0.578455, -0.5471046, -3.025355, 1, 0, 0, 1, 1,
-0.5749236, -0.08728564, -1.89578, 0, 0, 0, 1, 1,
-0.5696493, 0.06322744, -1.00057, 0, 0, 0, 1, 1,
-0.5678674, 0.2389078, -0.5949583, 0, 0, 0, 1, 1,
-0.5674808, -0.9838953, -3.601482, 0, 0, 0, 1, 1,
-0.5658343, -1.452671, -2.328235, 0, 0, 0, 1, 1,
-0.5618263, -0.4765632, -2.11737, 0, 0, 0, 1, 1,
-0.5608411, 0.3926062, 1.225841, 0, 0, 0, 1, 1,
-0.558998, -0.527276, -1.32515, 1, 1, 1, 1, 1,
-0.54346, 0.7663385, -0.1920881, 1, 1, 1, 1, 1,
-0.537855, -1.049208, -3.293536, 1, 1, 1, 1, 1,
-0.5352119, 0.9528458, 0.02443363, 1, 1, 1, 1, 1,
-0.5328224, 2.580494, -0.5606561, 1, 1, 1, 1, 1,
-0.5316199, -0.4811323, -2.392054, 1, 1, 1, 1, 1,
-0.5314076, 0.5313348, -1.344784, 1, 1, 1, 1, 1,
-0.5298784, 1.029523, -1.398707, 1, 1, 1, 1, 1,
-0.5286934, -0.3058935, -0.9499781, 1, 1, 1, 1, 1,
-0.5280891, 1.483735, -1.829171, 1, 1, 1, 1, 1,
-0.5274394, -0.8777166, -1.065733, 1, 1, 1, 1, 1,
-0.5273046, -0.2221778, -0.4205037, 1, 1, 1, 1, 1,
-0.5190541, 0.09679653, -1.641904, 1, 1, 1, 1, 1,
-0.5187912, -0.8925342, -2.15384, 1, 1, 1, 1, 1,
-0.5181943, 0.1022791, -2.937752, 1, 1, 1, 1, 1,
-0.5160868, -1.733602, -4.096619, 0, 0, 1, 1, 1,
-0.5131875, 0.3535001, 0.2215769, 1, 0, 0, 1, 1,
-0.5085132, 0.5713242, -1.786158, 1, 0, 0, 1, 1,
-0.5049244, -0.7517583, -2.961816, 1, 0, 0, 1, 1,
-0.5035406, 1.600998, -1.518799, 1, 0, 0, 1, 1,
-0.4979567, -0.2629937, -2.079443, 1, 0, 0, 1, 1,
-0.4868508, 1.003564, 0.6946099, 0, 0, 0, 1, 1,
-0.4842298, -0.008715387, 0.7534735, 0, 0, 0, 1, 1,
-0.4820822, 1.320261, -0.650416, 0, 0, 0, 1, 1,
-0.4806814, 0.1543232, -0.5065411, 0, 0, 0, 1, 1,
-0.4770149, -1.035324, -3.059231, 0, 0, 0, 1, 1,
-0.4751382, -1.780925, -3.061261, 0, 0, 0, 1, 1,
-0.4737229, 0.1575252, -1.722169, 0, 0, 0, 1, 1,
-0.4725132, -0.1127013, -2.878388, 1, 1, 1, 1, 1,
-0.4722557, 0.8531162, -0.1400069, 1, 1, 1, 1, 1,
-0.4706837, -0.2697079, -1.393978, 1, 1, 1, 1, 1,
-0.4667713, -0.128022, -0.7800789, 1, 1, 1, 1, 1,
-0.4664698, 0.5804051, -0.4277257, 1, 1, 1, 1, 1,
-0.4641791, -0.6799294, -1.780674, 1, 1, 1, 1, 1,
-0.4617856, -0.0693603, -1.397293, 1, 1, 1, 1, 1,
-0.4607009, 0.673246, -0.8612813, 1, 1, 1, 1, 1,
-0.4605178, 0.08955738, -1.775913, 1, 1, 1, 1, 1,
-0.4597637, 1.399906, 0.7626933, 1, 1, 1, 1, 1,
-0.4586841, 0.2838566, -2.180948, 1, 1, 1, 1, 1,
-0.4584356, -0.3515567, -1.558238, 1, 1, 1, 1, 1,
-0.4509718, 1.471321, -1.679639, 1, 1, 1, 1, 1,
-0.4504408, 2.279709, -0.8723256, 1, 1, 1, 1, 1,
-0.4489717, 0.5210323, -1.065056, 1, 1, 1, 1, 1,
-0.4456736, -1.022583, -1.978792, 0, 0, 1, 1, 1,
-0.4429697, 1.976032, -1.578551, 1, 0, 0, 1, 1,
-0.4418887, -1.148317, -4.866544, 1, 0, 0, 1, 1,
-0.4417729, 1.055908, -1.353335, 1, 0, 0, 1, 1,
-0.4396699, 0.1247477, -0.5078024, 1, 0, 0, 1, 1,
-0.4327882, 0.5410417, -2.161979, 1, 0, 0, 1, 1,
-0.4321783, 1.133065, -0.9617662, 0, 0, 0, 1, 1,
-0.4302321, 0.3930212, -1.205201, 0, 0, 0, 1, 1,
-0.4296037, -0.9425923, -1.644372, 0, 0, 0, 1, 1,
-0.4295136, 1.065181, 0.02358325, 0, 0, 0, 1, 1,
-0.4262756, -0.1825605, -2.208742, 0, 0, 0, 1, 1,
-0.4239146, -2.486025, -1.104265, 0, 0, 0, 1, 1,
-0.4178869, -0.475051, -1.333736, 0, 0, 0, 1, 1,
-0.412957, -1.391409, -2.271057, 1, 1, 1, 1, 1,
-0.4037114, 0.1278569, -4.012627, 1, 1, 1, 1, 1,
-0.4019054, -0.2061196, -0.805365, 1, 1, 1, 1, 1,
-0.397673, -0.3515544, -1.456256, 1, 1, 1, 1, 1,
-0.3956911, 1.549946, 1.144184, 1, 1, 1, 1, 1,
-0.3922103, -0.3368256, -1.281011, 1, 1, 1, 1, 1,
-0.3908846, 1.870781, 0.1969097, 1, 1, 1, 1, 1,
-0.3893595, 0.2108181, -1.969314, 1, 1, 1, 1, 1,
-0.3842339, 1.62631, 1.718624, 1, 1, 1, 1, 1,
-0.3833249, 0.01070706, -1.162987, 1, 1, 1, 1, 1,
-0.3676773, -0.8119764, -1.707309, 1, 1, 1, 1, 1,
-0.3673448, 0.07646754, 0.1140452, 1, 1, 1, 1, 1,
-0.364744, -0.9437365, -1.655339, 1, 1, 1, 1, 1,
-0.3559114, 0.4559658, -1.383619, 1, 1, 1, 1, 1,
-0.3476075, -0.6067991, -3.375642, 1, 1, 1, 1, 1,
-0.3450078, -0.0152326, -2.099274, 0, 0, 1, 1, 1,
-0.3412207, -1.224145, -1.067901, 1, 0, 0, 1, 1,
-0.3403538, -0.01539685, -0.8581479, 1, 0, 0, 1, 1,
-0.339045, 0.151859, -2.633127, 1, 0, 0, 1, 1,
-0.3373691, 0.5487512, -0.9469067, 1, 0, 0, 1, 1,
-0.3310783, 0.6405166, 0.6655062, 1, 0, 0, 1, 1,
-0.3281784, -0.6522412, -3.355635, 0, 0, 0, 1, 1,
-0.3248324, 0.3038978, -2.797668, 0, 0, 0, 1, 1,
-0.3219048, -1.080296, -3.285589, 0, 0, 0, 1, 1,
-0.3210788, -0.4918844, -1.70532, 0, 0, 0, 1, 1,
-0.3162535, 1.097611, -0.9809545, 0, 0, 0, 1, 1,
-0.315148, 0.451921, -0.5050577, 0, 0, 0, 1, 1,
-0.3138469, -2.209236, -1.285763, 0, 0, 0, 1, 1,
-0.3114681, 0.8437945, -0.6789114, 1, 1, 1, 1, 1,
-0.3112504, -0.3469009, -3.531098, 1, 1, 1, 1, 1,
-0.3103652, 0.7048644, 1.974012, 1, 1, 1, 1, 1,
-0.3091409, 0.1886164, -1.013723, 1, 1, 1, 1, 1,
-0.3079341, 2.082802, -1.537803, 1, 1, 1, 1, 1,
-0.3032438, 0.5171694, 0.05438844, 1, 1, 1, 1, 1,
-0.3007374, -1.994975, -2.824344, 1, 1, 1, 1, 1,
-0.2997611, 0.7585037, -0.1251795, 1, 1, 1, 1, 1,
-0.2915069, 0.9067535, 0.4261025, 1, 1, 1, 1, 1,
-0.2898825, -0.5907722, -3.659212, 1, 1, 1, 1, 1,
-0.2897667, -1.289767, -2.14191, 1, 1, 1, 1, 1,
-0.2870888, 0.06640337, -1.913618, 1, 1, 1, 1, 1,
-0.2855763, 2.022778, 1.031074, 1, 1, 1, 1, 1,
-0.2843911, 0.4269206, 0.1958255, 1, 1, 1, 1, 1,
-0.2838746, -0.351348, -1.439511, 1, 1, 1, 1, 1,
-0.2832197, -2.078469, -1.853818, 0, 0, 1, 1, 1,
-0.2820344, 1.793949, 0.5357257, 1, 0, 0, 1, 1,
-0.2774799, 0.7508675, -2.337695, 1, 0, 0, 1, 1,
-0.2766901, -0.956446, -1.717967, 1, 0, 0, 1, 1,
-0.2725071, 1.372224, 0.7423072, 1, 0, 0, 1, 1,
-0.2723962, 0.0810514, -0.9642643, 1, 0, 0, 1, 1,
-0.2694742, -2.562968, -3.317551, 0, 0, 0, 1, 1,
-0.2690052, -0.9319828, -2.707781, 0, 0, 0, 1, 1,
-0.2659641, -2.111426, -3.344856, 0, 0, 0, 1, 1,
-0.2657012, 0.6738601, 0.7699875, 0, 0, 0, 1, 1,
-0.2656942, -2.293889, -0.07265784, 0, 0, 0, 1, 1,
-0.2622279, -0.006980061, -0.8270581, 0, 0, 0, 1, 1,
-0.2589149, -0.1180043, -2.883582, 0, 0, 0, 1, 1,
-0.2581476, -0.8328088, -2.718079, 1, 1, 1, 1, 1,
-0.2560982, 0.7384663, -0.06630628, 1, 1, 1, 1, 1,
-0.2553411, 1.558758, -0.5667396, 1, 1, 1, 1, 1,
-0.2551409, 1.454738, -0.06546329, 1, 1, 1, 1, 1,
-0.2522162, -0.8882778, -2.185783, 1, 1, 1, 1, 1,
-0.2515198, -1.17952, -1.327137, 1, 1, 1, 1, 1,
-0.2463578, 0.2905531, -1.09937, 1, 1, 1, 1, 1,
-0.2461034, 1.893932, -1.679655, 1, 1, 1, 1, 1,
-0.2407097, 1.184443, -1.51808, 1, 1, 1, 1, 1,
-0.2381594, 1.896018, 0.04874127, 1, 1, 1, 1, 1,
-0.2363296, -0.513316, -2.9369, 1, 1, 1, 1, 1,
-0.2353159, 0.3838041, 0.1439965, 1, 1, 1, 1, 1,
-0.225809, 0.8262873, 0.372628, 1, 1, 1, 1, 1,
-0.2233752, 0.6841703, 0.2614724, 1, 1, 1, 1, 1,
-0.2080157, -0.9199614, -4.321797, 1, 1, 1, 1, 1,
-0.204341, -0.1011965, -2.68694, 0, 0, 1, 1, 1,
-0.2040282, -1.052703, -3.239066, 1, 0, 0, 1, 1,
-0.203893, 1.397929, -1.767738, 1, 0, 0, 1, 1,
-0.1957197, 0.1465919, -1.748421, 1, 0, 0, 1, 1,
-0.1950875, 1.053804, -1.546398, 1, 0, 0, 1, 1,
-0.188921, -0.5398343, -2.390247, 1, 0, 0, 1, 1,
-0.1850944, 0.7178784, -0.7078577, 0, 0, 0, 1, 1,
-0.1821602, -1.211587, -3.843453, 0, 0, 0, 1, 1,
-0.1756944, -1.538393, -1.774902, 0, 0, 0, 1, 1,
-0.1730336, -1.102926, -1.059272, 0, 0, 0, 1, 1,
-0.1717788, 1.333188, 0.9638501, 0, 0, 0, 1, 1,
-0.1715016, -0.567568, -2.094857, 0, 0, 0, 1, 1,
-0.1658035, -1.324877, -4.268955, 0, 0, 0, 1, 1,
-0.1641142, -0.6717961, -4.604041, 1, 1, 1, 1, 1,
-0.1574751, -0.6107507, -2.677349, 1, 1, 1, 1, 1,
-0.153904, 0.9161834, -0.3718271, 1, 1, 1, 1, 1,
-0.1510226, 0.4777818, -0.6284346, 1, 1, 1, 1, 1,
-0.1507279, -0.7085193, -4.559835, 1, 1, 1, 1, 1,
-0.149739, 0.7568972, -1.295032, 1, 1, 1, 1, 1,
-0.1471767, -0.8898949, -4.090089, 1, 1, 1, 1, 1,
-0.1428261, -2.569266, -1.790919, 1, 1, 1, 1, 1,
-0.1419995, 1.894402, -1.884473, 1, 1, 1, 1, 1,
-0.1384139, 0.5646527, -1.398107, 1, 1, 1, 1, 1,
-0.1338562, -0.4330019, -3.025492, 1, 1, 1, 1, 1,
-0.1243204, -1.573904, -2.557804, 1, 1, 1, 1, 1,
-0.123895, 0.2627768, -1.310101, 1, 1, 1, 1, 1,
-0.1177672, -0.7686366, -4.388896, 1, 1, 1, 1, 1,
-0.1161032, -1.169086, -2.345024, 1, 1, 1, 1, 1,
-0.1156641, -0.5113718, -3.921856, 0, 0, 1, 1, 1,
-0.1105197, -0.4355454, -1.912838, 1, 0, 0, 1, 1,
-0.1002128, 1.544159, -1.191029, 1, 0, 0, 1, 1,
-0.09716655, 1.303944, 1.215699, 1, 0, 0, 1, 1,
-0.09512693, 0.1600081, 1.23066, 1, 0, 0, 1, 1,
-0.09160727, -1.328751, -3.133954, 1, 0, 0, 1, 1,
-0.0912755, 0.9487609, 1.130861, 0, 0, 0, 1, 1,
-0.09015594, 1.089678, -1.576373, 0, 0, 0, 1, 1,
-0.08289076, -1.400801, -2.976532, 0, 0, 0, 1, 1,
-0.08209074, 1.244748, -1.046995, 0, 0, 0, 1, 1,
-0.0802699, 1.900324, 0.6676471, 0, 0, 0, 1, 1,
-0.07940093, 0.4170018, -0.3276713, 0, 0, 0, 1, 1,
-0.07914321, 0.1293934, 0.3064964, 0, 0, 0, 1, 1,
-0.07760105, -1.246838, -1.79243, 1, 1, 1, 1, 1,
-0.07658025, -1.823089, -4.017402, 1, 1, 1, 1, 1,
-0.07551682, -1.095308, -3.469197, 1, 1, 1, 1, 1,
-0.0704916, 0.3303711, -1.611044, 1, 1, 1, 1, 1,
-0.06876507, 0.2157501, -0.9092475, 1, 1, 1, 1, 1,
-0.06841094, -0.1404196, -1.305967, 1, 1, 1, 1, 1,
-0.06519228, -1.461522, -2.965209, 1, 1, 1, 1, 1,
-0.06337997, -0.5807995, -1.708468, 1, 1, 1, 1, 1,
-0.05582457, 0.04489883, -1.423292, 1, 1, 1, 1, 1,
-0.05446064, 0.2159384, 1.15276, 1, 1, 1, 1, 1,
-0.05400338, 0.8361632, 0.5238398, 1, 1, 1, 1, 1,
-0.05289297, -0.7272065, -2.547507, 1, 1, 1, 1, 1,
-0.05200326, -1.283511, -3.811504, 1, 1, 1, 1, 1,
-0.05062525, 0.6177096, 0.08448113, 1, 1, 1, 1, 1,
-0.04721629, 0.1600541, -0.9731682, 1, 1, 1, 1, 1,
-0.0470672, -1.042943, -2.732317, 0, 0, 1, 1, 1,
-0.04615641, -0.1779641, -4.822608, 1, 0, 0, 1, 1,
-0.04462839, 0.3328269, 1.012042, 1, 0, 0, 1, 1,
-0.03988684, -0.6414044, -4.303567, 1, 0, 0, 1, 1,
-0.03605557, -0.9677425, -1.390842, 1, 0, 0, 1, 1,
-0.03568169, -1.032126, -3.833331, 1, 0, 0, 1, 1,
-0.03394488, 0.6179309, -0.7838683, 0, 0, 0, 1, 1,
-0.03188403, -1.647266, -4.278343, 0, 0, 0, 1, 1,
-0.02976745, 0.7876318, -2.227644, 0, 0, 0, 1, 1,
-0.02263589, 0.9374281, 1.644771, 0, 0, 0, 1, 1,
-0.02021169, -0.07966707, -1.904674, 0, 0, 0, 1, 1,
-0.01343858, 0.9906822, 1.308775, 0, 0, 0, 1, 1,
-0.008902038, 0.8024654, -0.0654504, 0, 0, 0, 1, 1,
-0.008669745, -0.1513, -1.979611, 1, 1, 1, 1, 1,
-0.007739038, 0.6271094, -1.003267, 1, 1, 1, 1, 1,
-0.006976396, 0.7696444, 1.02354, 1, 1, 1, 1, 1,
-0.002897599, 0.8085068, 1.205085, 1, 1, 1, 1, 1,
-0.001006503, 0.2039739, -0.8605782, 1, 1, 1, 1, 1,
0.0009276927, -2.08368, 2.677165, 1, 1, 1, 1, 1,
0.004539809, -0.2261035, 2.420572, 1, 1, 1, 1, 1,
0.005150767, -0.1779989, 2.66792, 1, 1, 1, 1, 1,
0.006267752, -1.244381, 3.567322, 1, 1, 1, 1, 1,
0.007168285, -0.2208266, 4.227475, 1, 1, 1, 1, 1,
0.009338583, -0.7239271, 0.4532974, 1, 1, 1, 1, 1,
0.01086556, 0.7084754, 0.9361269, 1, 1, 1, 1, 1,
0.01476519, -1.023827, 3.450641, 1, 1, 1, 1, 1,
0.01515074, 0.9500352, 0.09684739, 1, 1, 1, 1, 1,
0.01815262, 0.2565072, -0.1963864, 1, 1, 1, 1, 1,
0.01858006, -0.7261912, 2.103033, 0, 0, 1, 1, 1,
0.02320533, 1.238158, 0.6906221, 1, 0, 0, 1, 1,
0.02994237, 0.1102817, -0.2064872, 1, 0, 0, 1, 1,
0.03035563, 1.153512, 0.08672139, 1, 0, 0, 1, 1,
0.03041317, 1.703166, 0.9794032, 1, 0, 0, 1, 1,
0.03354077, 0.2461739, -0.488396, 1, 0, 0, 1, 1,
0.03438166, 2.091042, 0.5764886, 0, 0, 0, 1, 1,
0.03711873, 0.6911113, 0.7286646, 0, 0, 0, 1, 1,
0.03939094, -0.4891908, 3.39485, 0, 0, 0, 1, 1,
0.04261876, -0.2723197, 2.381793, 0, 0, 0, 1, 1,
0.04407058, 0.1073272, 0.2258643, 0, 0, 0, 1, 1,
0.04901472, -0.06909358, 1.23618, 0, 0, 0, 1, 1,
0.05042354, -0.1828117, 2.741686, 0, 0, 0, 1, 1,
0.05072365, 1.2253, -0.4597879, 1, 1, 1, 1, 1,
0.05199244, 0.7934088, 0.01294344, 1, 1, 1, 1, 1,
0.05267003, 1.286587, -1.032881, 1, 1, 1, 1, 1,
0.05644634, 1.01455, -0.2428966, 1, 1, 1, 1, 1,
0.05825356, -0.7260021, 3.00388, 1, 1, 1, 1, 1,
0.05871744, -0.5334918, 1.944793, 1, 1, 1, 1, 1,
0.05897452, -0.6487762, 3.190192, 1, 1, 1, 1, 1,
0.06231524, -0.3034481, 3.607549, 1, 1, 1, 1, 1,
0.06267669, 0.2968455, 0.6895273, 1, 1, 1, 1, 1,
0.06503677, 0.0138151, 1.392038, 1, 1, 1, 1, 1,
0.06568292, 1.630744, -0.1912536, 1, 1, 1, 1, 1,
0.0673996, 0.7200555, -1.284843, 1, 1, 1, 1, 1,
0.07693974, -0.3995219, 2.331579, 1, 1, 1, 1, 1,
0.08055763, 0.2709582, 0.9163488, 1, 1, 1, 1, 1,
0.08138214, 1.34295, -0.778074, 1, 1, 1, 1, 1,
0.08416373, 0.8531911, -0.237138, 0, 0, 1, 1, 1,
0.09018183, 0.6449775, 2.129904, 1, 0, 0, 1, 1,
0.1050038, 0.1636474, 1.664912, 1, 0, 0, 1, 1,
0.1065187, -0.2615468, 0.6386222, 1, 0, 0, 1, 1,
0.1073762, 1.440476, -1.686963, 1, 0, 0, 1, 1,
0.1097426, 1.137522, -1.419712, 1, 0, 0, 1, 1,
0.1102897, -0.9077669, 3.331537, 0, 0, 0, 1, 1,
0.1177796, 0.6964921, -0.5800554, 0, 0, 0, 1, 1,
0.120392, -1.08428, 1.595029, 0, 0, 0, 1, 1,
0.1222761, -0.528315, 2.335372, 0, 0, 0, 1, 1,
0.1241963, -0.1897406, 1.835749, 0, 0, 0, 1, 1,
0.1262466, 0.1134774, 1.631711, 0, 0, 0, 1, 1,
0.1263946, 0.1129911, 0.5502182, 0, 0, 0, 1, 1,
0.128769, -1.653849, 4.821835, 1, 1, 1, 1, 1,
0.1367405, -1.100678, 2.786626, 1, 1, 1, 1, 1,
0.141056, 0.7463375, 0.04490134, 1, 1, 1, 1, 1,
0.1450113, 0.1312781, -0.1773068, 1, 1, 1, 1, 1,
0.1471202, -0.2706254, 1.971351, 1, 1, 1, 1, 1,
0.1501165, -0.5534571, 2.837816, 1, 1, 1, 1, 1,
0.1512731, 0.7401372, 0.9194686, 1, 1, 1, 1, 1,
0.1526435, 1.04873, -1.970527, 1, 1, 1, 1, 1,
0.1540688, 2.592583, -2.010476, 1, 1, 1, 1, 1,
0.1549685, -0.4172508, 1.075422, 1, 1, 1, 1, 1,
0.1575226, 0.0282188, 0.9872233, 1, 1, 1, 1, 1,
0.1587735, -0.3521217, 4.252437, 1, 1, 1, 1, 1,
0.1589415, -0.8009048, 2.304451, 1, 1, 1, 1, 1,
0.1590194, -0.570857, 3.951195, 1, 1, 1, 1, 1,
0.1602238, 0.9528675, -1.660829, 1, 1, 1, 1, 1,
0.1609401, 0.9928027, -0.7673882, 0, 0, 1, 1, 1,
0.1667439, 0.436397, 1.074031, 1, 0, 0, 1, 1,
0.1738231, 0.0390874, -0.2635058, 1, 0, 0, 1, 1,
0.173843, 0.43931, 1.854999, 1, 0, 0, 1, 1,
0.1739303, -0.3180409, 3.700456, 1, 0, 0, 1, 1,
0.1742604, 0.9492329, 0.5305587, 1, 0, 0, 1, 1,
0.1748925, 1.880427, -0.04550065, 0, 0, 0, 1, 1,
0.1777738, 1.526162, 0.1734771, 0, 0, 0, 1, 1,
0.1801436, -0.3545232, 4.193901, 0, 0, 0, 1, 1,
0.1805378, -0.1346796, 2.275146, 0, 0, 0, 1, 1,
0.1836281, -0.5413178, 3.337835, 0, 0, 0, 1, 1,
0.1859811, -1.512686, 4.654109, 0, 0, 0, 1, 1,
0.1882884, -1.719398, 1.27728, 0, 0, 0, 1, 1,
0.1926865, 1.720587, -1.359747, 1, 1, 1, 1, 1,
0.2086791, -0.3066015, 4.885961, 1, 1, 1, 1, 1,
0.2109826, 0.2521218, -0.3361187, 1, 1, 1, 1, 1,
0.2179016, -0.3781744, 3.368075, 1, 1, 1, 1, 1,
0.2190244, -1.832465, 3.068545, 1, 1, 1, 1, 1,
0.2203024, 0.5402801, -0.4529244, 1, 1, 1, 1, 1,
0.221247, 0.1198255, 0.6264024, 1, 1, 1, 1, 1,
0.2214869, 1.475375, -1.120808, 1, 1, 1, 1, 1,
0.2274911, -1.082239, 2.175527, 1, 1, 1, 1, 1,
0.2278541, -0.1633536, 1.747516, 1, 1, 1, 1, 1,
0.2328517, 1.307407, 0.9651794, 1, 1, 1, 1, 1,
0.2340823, 2.430428, 0.205831, 1, 1, 1, 1, 1,
0.2451111, 0.9742399, 1.51335, 1, 1, 1, 1, 1,
0.2460096, 0.4227591, 1.430976, 1, 1, 1, 1, 1,
0.2499002, 0.3749636, 1.440607, 1, 1, 1, 1, 1,
0.2537522, -1.581333, 2.789456, 0, 0, 1, 1, 1,
0.2549532, 0.5359122, 0.5782723, 1, 0, 0, 1, 1,
0.2579469, 1.123217, 0.3429462, 1, 0, 0, 1, 1,
0.2599716, 0.6821582, -0.2219487, 1, 0, 0, 1, 1,
0.2614971, -0.8813761, 3.904561, 1, 0, 0, 1, 1,
0.2647457, 0.783193, 0.0160358, 1, 0, 0, 1, 1,
0.2666804, -0.8298191, 1.81093, 0, 0, 0, 1, 1,
0.2675386, 0.1605509, 2.163679, 0, 0, 0, 1, 1,
0.2812752, -0.5743222, 2.607961, 0, 0, 0, 1, 1,
0.2831516, 1.26324, 1.563899, 0, 0, 0, 1, 1,
0.2872089, 1.257366, -0.9604021, 0, 0, 0, 1, 1,
0.287653, -1.456015, 2.999821, 0, 0, 0, 1, 1,
0.2893453, 1.32068, -1.142471, 0, 0, 0, 1, 1,
0.2934026, 0.3558914, 0.4492993, 1, 1, 1, 1, 1,
0.2941982, -0.7869881, 0.8361962, 1, 1, 1, 1, 1,
0.2989368, 1.186054, 1.222661, 1, 1, 1, 1, 1,
0.3003304, 1.239078, 0.3215205, 1, 1, 1, 1, 1,
0.3010496, 0.7601739, -0.3493221, 1, 1, 1, 1, 1,
0.3035204, -0.5106984, 1.410694, 1, 1, 1, 1, 1,
0.3050369, -0.9318931, 3.902587, 1, 1, 1, 1, 1,
0.3071442, -2.196945, 3.764328, 1, 1, 1, 1, 1,
0.3096012, -0.5643572, 3.094731, 1, 1, 1, 1, 1,
0.3111823, -2.094073, 4.58558, 1, 1, 1, 1, 1,
0.3145189, -0.4668919, 3.220539, 1, 1, 1, 1, 1,
0.3165117, 0.09391728, 1.594236, 1, 1, 1, 1, 1,
0.3211051, -1.372527, 4.153107, 1, 1, 1, 1, 1,
0.3224024, 1.021946, 0.7250487, 1, 1, 1, 1, 1,
0.3236094, -0.008266125, 3.311975, 1, 1, 1, 1, 1,
0.3274825, -0.5632031, 1.483771, 0, 0, 1, 1, 1,
0.3310917, 2.452723, -0.8998451, 1, 0, 0, 1, 1,
0.332325, 0.1237204, 2.754026, 1, 0, 0, 1, 1,
0.332466, 0.3191218, 0.8011605, 1, 0, 0, 1, 1,
0.3324806, -1.627648, 2.853103, 1, 0, 0, 1, 1,
0.3336346, 0.7876852, -0.424418, 1, 0, 0, 1, 1,
0.3353776, 0.7772111, 1.261334, 0, 0, 0, 1, 1,
0.3384556, -1.122123, 2.557021, 0, 0, 0, 1, 1,
0.3403439, -1.205838, 2.823725, 0, 0, 0, 1, 1,
0.3425237, 0.2285774, -0.2156015, 0, 0, 0, 1, 1,
0.3430566, -1.96368, 4.75738, 0, 0, 0, 1, 1,
0.3434076, -0.2797169, 0.8387511, 0, 0, 0, 1, 1,
0.3449413, -0.6492598, 3.553041, 0, 0, 0, 1, 1,
0.3453483, -0.07145406, 1.603673, 1, 1, 1, 1, 1,
0.3475681, -1.553449, 2.696238, 1, 1, 1, 1, 1,
0.3477609, 1.501644, 0.8944033, 1, 1, 1, 1, 1,
0.3518972, 0.9425262, -0.63887, 1, 1, 1, 1, 1,
0.3565273, -0.4135113, 0.5944088, 1, 1, 1, 1, 1,
0.3575887, 0.05770906, 2.287764, 1, 1, 1, 1, 1,
0.3582466, 0.2077697, 1.09774, 1, 1, 1, 1, 1,
0.364136, 0.6972036, 2.2315, 1, 1, 1, 1, 1,
0.3641795, 1.179856, 0.2499207, 1, 1, 1, 1, 1,
0.3661946, 0.5054435, -1.76441, 1, 1, 1, 1, 1,
0.366957, -0.1592936, 2.925661, 1, 1, 1, 1, 1,
0.3678159, 0.5852535, 1.843206, 1, 1, 1, 1, 1,
0.3726571, 2.17698, 0.1976251, 1, 1, 1, 1, 1,
0.3727014, -0.9144266, 0.5027194, 1, 1, 1, 1, 1,
0.3732294, -0.9437469, 3.826865, 1, 1, 1, 1, 1,
0.3750848, 2.258812, 0.458962, 0, 0, 1, 1, 1,
0.3767988, -1.676416, 1.326237, 1, 0, 0, 1, 1,
0.3771261, 1.48156, -1.194317, 1, 0, 0, 1, 1,
0.3775726, 1.204375, 0.2212391, 1, 0, 0, 1, 1,
0.3780355, 0.6671328, 2.606747, 1, 0, 0, 1, 1,
0.3786029, -0.3487719, 2.149488, 1, 0, 0, 1, 1,
0.3824748, 0.3370099, 1.178398, 0, 0, 0, 1, 1,
0.3833234, 0.9318433, -0.6315462, 0, 0, 0, 1, 1,
0.3855403, 0.1450443, 1.975664, 0, 0, 0, 1, 1,
0.3863809, -0.04673716, 0.7557248, 0, 0, 0, 1, 1,
0.3880781, 0.5505951, 1.984914, 0, 0, 0, 1, 1,
0.3897252, -0.9517105, 2.112733, 0, 0, 0, 1, 1,
0.3918045, 0.4422148, 1.718271, 0, 0, 0, 1, 1,
0.391951, -1.007615, 4.141609, 1, 1, 1, 1, 1,
0.3920274, 0.3890568, -0.01586067, 1, 1, 1, 1, 1,
0.3946273, 1.302163, 0.7616589, 1, 1, 1, 1, 1,
0.3999654, -0.1683634, 2.392141, 1, 1, 1, 1, 1,
0.4004988, 1.034285, 2.012968, 1, 1, 1, 1, 1,
0.4037527, -0.3145282, 2.19292, 1, 1, 1, 1, 1,
0.4055161, 0.2860464, 1.435678, 1, 1, 1, 1, 1,
0.406517, 0.9053141, 0.2390874, 1, 1, 1, 1, 1,
0.4073706, 0.4804209, 1.146305, 1, 1, 1, 1, 1,
0.4091628, 0.2483292, -0.3817637, 1, 1, 1, 1, 1,
0.4110406, -2.111819, 1.999446, 1, 1, 1, 1, 1,
0.4115814, -1.15331, 4.227634, 1, 1, 1, 1, 1,
0.4115913, 0.3058717, -0.3477634, 1, 1, 1, 1, 1,
0.413075, -0.03695551, -1.417032, 1, 1, 1, 1, 1,
0.4157135, 0.9861926, -1.43244, 1, 1, 1, 1, 1,
0.4161741, -0.4210044, 4.450952, 0, 0, 1, 1, 1,
0.4163223, -0.3526576, 2.626983, 1, 0, 0, 1, 1,
0.4186526, -0.3226609, 1.662044, 1, 0, 0, 1, 1,
0.4212488, 1.011676, 1.326296, 1, 0, 0, 1, 1,
0.4269636, -1.367306, 2.430543, 1, 0, 0, 1, 1,
0.4293379, 1.312778, 1.116268, 1, 0, 0, 1, 1,
0.4332984, -0.08079438, 0.7094005, 0, 0, 0, 1, 1,
0.4334415, -0.9179828, 3.696555, 0, 0, 0, 1, 1,
0.4343803, 1.433153, -0.2635484, 0, 0, 0, 1, 1,
0.4366883, -0.9560012, 3.744981, 0, 0, 0, 1, 1,
0.4387613, 0.5459292, 0.3523812, 0, 0, 0, 1, 1,
0.4416334, 0.8183934, 1.442029, 0, 0, 0, 1, 1,
0.4417327, 0.8056061, 0.8008803, 0, 0, 0, 1, 1,
0.4476834, 0.6523078, 0.1404867, 1, 1, 1, 1, 1,
0.4477409, 1.063457, -0.339231, 1, 1, 1, 1, 1,
0.448784, -0.1871931, 0.8641456, 1, 1, 1, 1, 1,
0.449029, 1.312529, 0.4280141, 1, 1, 1, 1, 1,
0.4520498, -0.4428277, 3.622177, 1, 1, 1, 1, 1,
0.4537563, -0.1952475, 1.720542, 1, 1, 1, 1, 1,
0.4564037, -0.6415271, 0.6398159, 1, 1, 1, 1, 1,
0.4565989, 0.7559182, 1.036284, 1, 1, 1, 1, 1,
0.4583032, -0.7386103, 2.084152, 1, 1, 1, 1, 1,
0.4593497, -1.502311, 4.173483, 1, 1, 1, 1, 1,
0.4610633, 0.4202525, 1.151291, 1, 1, 1, 1, 1,
0.4655246, 1.589963, -0.7119452, 1, 1, 1, 1, 1,
0.4671061, -0.6543828, 2.665362, 1, 1, 1, 1, 1,
0.4770901, 0.1892195, 1.131344, 1, 1, 1, 1, 1,
0.4829121, -0.8867791, 3.114954, 1, 1, 1, 1, 1,
0.4913861, 0.5430828, 1.128495, 0, 0, 1, 1, 1,
0.4957139, -1.698897, 2.318235, 1, 0, 0, 1, 1,
0.4979925, -0.9802074, 3.140192, 1, 0, 0, 1, 1,
0.4985813, -1.038462, 0.2988912, 1, 0, 0, 1, 1,
0.5044225, 0.5049192, 1.113776, 1, 0, 0, 1, 1,
0.5078403, -0.1549008, 1.226116, 1, 0, 0, 1, 1,
0.5123942, 0.8795566, -0.201676, 0, 0, 0, 1, 1,
0.5162389, -0.1270807, 2.36062, 0, 0, 0, 1, 1,
0.5242222, -1.821637, 3.48492, 0, 0, 0, 1, 1,
0.5271837, 1.02093, 1.023032, 0, 0, 0, 1, 1,
0.5300694, 0.1115555, 1.270786, 0, 0, 0, 1, 1,
0.5337952, -1.42888, 4.497142, 0, 0, 0, 1, 1,
0.5352028, 1.379863, 0.8482098, 0, 0, 0, 1, 1,
0.5353734, -1.757271, 2.535916, 1, 1, 1, 1, 1,
0.5453324, 0.5998105, 0.9383144, 1, 1, 1, 1, 1,
0.5461488, -0.9927852, 1.845393, 1, 1, 1, 1, 1,
0.5470682, -0.7805642, 4.030924, 1, 1, 1, 1, 1,
0.5483111, 0.7968506, -0.4903644, 1, 1, 1, 1, 1,
0.5486119, -1.235029, 2.417379, 1, 1, 1, 1, 1,
0.5508714, 0.7061035, 0.7961179, 1, 1, 1, 1, 1,
0.5514598, 0.6039856, -1.200971, 1, 1, 1, 1, 1,
0.5553972, -1.513182, 3.660996, 1, 1, 1, 1, 1,
0.555634, -2.208954, 2.87136, 1, 1, 1, 1, 1,
0.5568575, -0.04021823, 0.754999, 1, 1, 1, 1, 1,
0.5588021, 0.9062435, 1.698902, 1, 1, 1, 1, 1,
0.5628033, -0.07807221, 1.713603, 1, 1, 1, 1, 1,
0.5632597, 1.52619, -1.295403, 1, 1, 1, 1, 1,
0.5651458, -0.7394516, 1.760835, 1, 1, 1, 1, 1,
0.5652388, -0.5169079, 2.099552, 0, 0, 1, 1, 1,
0.5688459, -0.832678, 2.287544, 1, 0, 0, 1, 1,
0.5689863, -0.2268827, 2.425633, 1, 0, 0, 1, 1,
0.5692939, -0.2015959, 1.915244, 1, 0, 0, 1, 1,
0.5726414, -0.1656339, 4.292421, 1, 0, 0, 1, 1,
0.5727656, 0.2825671, 1.862829, 1, 0, 0, 1, 1,
0.5753098, -0.3508016, 3.16313, 0, 0, 0, 1, 1,
0.5784231, -0.1567697, 1.911615, 0, 0, 0, 1, 1,
0.5793596, -0.8780534, 3.754632, 0, 0, 0, 1, 1,
0.5852171, 0.03338562, 2.30909, 0, 0, 0, 1, 1,
0.585814, 1.289904, 0.1291389, 0, 0, 0, 1, 1,
0.5918444, 0.1359277, 1.526434, 0, 0, 0, 1, 1,
0.59194, -0.8574264, 3.499855, 0, 0, 0, 1, 1,
0.5948473, -0.3679481, 2.440722, 1, 1, 1, 1, 1,
0.5950252, -0.8162519, 1.793003, 1, 1, 1, 1, 1,
0.5958127, -1.983389, 1.652505, 1, 1, 1, 1, 1,
0.6012047, -1.05774, 2.463665, 1, 1, 1, 1, 1,
0.6021325, 0.05387374, 1.24313, 1, 1, 1, 1, 1,
0.6024912, 0.07009346, 1.684531, 1, 1, 1, 1, 1,
0.6042945, -1.989877, 1.826529, 1, 1, 1, 1, 1,
0.6202058, 0.5094913, 1.42176, 1, 1, 1, 1, 1,
0.6230847, 1.431258, 0.8734963, 1, 1, 1, 1, 1,
0.6233506, 1.83709, 0.6716611, 1, 1, 1, 1, 1,
0.6300221, 0.9574202, -0.9117813, 1, 1, 1, 1, 1,
0.6322356, -0.379665, 3.344443, 1, 1, 1, 1, 1,
0.6380579, 0.0270512, 0.5238301, 1, 1, 1, 1, 1,
0.6425153, -0.01117684, 1.700038, 1, 1, 1, 1, 1,
0.6502855, -0.6384166, 2.112354, 1, 1, 1, 1, 1,
0.6508414, 0.06404071, 0.7438835, 0, 0, 1, 1, 1,
0.6554617, -1.616573, 2.936061, 1, 0, 0, 1, 1,
0.6566722, 1.884538, -0.520916, 1, 0, 0, 1, 1,
0.6630492, -0.8344991, 1.319652, 1, 0, 0, 1, 1,
0.6658421, 0.2228323, 1.541581, 1, 0, 0, 1, 1,
0.6667919, -1.027283, 2.399788, 1, 0, 0, 1, 1,
0.6692798, -0.01343032, 2.282506, 0, 0, 0, 1, 1,
0.671401, 0.6984141, 0.1122718, 0, 0, 0, 1, 1,
0.671637, 0.3095051, 1.592032, 0, 0, 0, 1, 1,
0.6752511, -0.1777107, 1.667819, 0, 0, 0, 1, 1,
0.6754272, -1.080497, 2.990406, 0, 0, 0, 1, 1,
0.6782191, -1.525042, 3.40927, 0, 0, 0, 1, 1,
0.6830799, 1.973126, -0.150302, 0, 0, 0, 1, 1,
0.6858232, 1.013854, -0.1548975, 1, 1, 1, 1, 1,
0.6906421, 0.2676274, 0.9755109, 1, 1, 1, 1, 1,
0.6913432, 0.03507477, -0.5196321, 1, 1, 1, 1, 1,
0.6949677, 0.6551263, -0.7773129, 1, 1, 1, 1, 1,
0.7030422, -0.3379595, 2.213856, 1, 1, 1, 1, 1,
0.7141307, 1.343241, 0.0426571, 1, 1, 1, 1, 1,
0.7194749, 1.199781, 0.1048097, 1, 1, 1, 1, 1,
0.7200969, 1.506461, 2.806177, 1, 1, 1, 1, 1,
0.7264867, 0.0295308, 2.621681, 1, 1, 1, 1, 1,
0.7318081, 1.147631, 0.8135675, 1, 1, 1, 1, 1,
0.7323902, 1.493585, 0.8628492, 1, 1, 1, 1, 1,
0.732471, 0.6216326, 0.2418698, 1, 1, 1, 1, 1,
0.7326018, -0.3890876, 2.657134, 1, 1, 1, 1, 1,
0.7334887, 0.2885878, -1.359386, 1, 1, 1, 1, 1,
0.7466204, -0.2346294, 2.441998, 1, 1, 1, 1, 1,
0.7474138, -0.4508089, 2.537535, 0, 0, 1, 1, 1,
0.7488624, -0.709186, 2.073285, 1, 0, 0, 1, 1,
0.7526558, -1.576257, 2.883168, 1, 0, 0, 1, 1,
0.7584646, 1.539303, 0.9486635, 1, 0, 0, 1, 1,
0.7633758, -0.04321758, 2.916076, 1, 0, 0, 1, 1,
0.7635874, 0.1188781, -0.2558697, 1, 0, 0, 1, 1,
0.76475, 0.8762654, 0.804408, 0, 0, 0, 1, 1,
0.7660655, -1.296179, 1.903097, 0, 0, 0, 1, 1,
0.7699501, 1.637108, -0.529787, 0, 0, 0, 1, 1,
0.7739611, 1.072513, 1.026541, 0, 0, 0, 1, 1,
0.7747644, 0.3507152, 3.112785, 0, 0, 0, 1, 1,
0.7759484, 0.08375768, 1.502435, 0, 0, 0, 1, 1,
0.7765969, 0.24292, 1.583862, 0, 0, 0, 1, 1,
0.7836818, -1.611427, 3.920433, 1, 1, 1, 1, 1,
0.7846523, -0.4548676, 2.472064, 1, 1, 1, 1, 1,
0.7891852, -0.6487489, 0.9512793, 1, 1, 1, 1, 1,
0.7892143, -0.8708752, 2.656632, 1, 1, 1, 1, 1,
0.7922729, 0.2387319, 0.4535703, 1, 1, 1, 1, 1,
0.7936621, -0.7754691, 1.91307, 1, 1, 1, 1, 1,
0.793737, 0.417417, 0.9358267, 1, 1, 1, 1, 1,
0.794506, -1.272316, 1.745557, 1, 1, 1, 1, 1,
0.7992691, 0.05230143, 0.08546947, 1, 1, 1, 1, 1,
0.8004035, -0.727427, 2.400632, 1, 1, 1, 1, 1,
0.8099329, 0.2467487, 2.241256, 1, 1, 1, 1, 1,
0.8174486, -1.765421, 2.187403, 1, 1, 1, 1, 1,
0.8228679, 0.6335644, 0.4698518, 1, 1, 1, 1, 1,
0.8256142, 0.9547564, 0.7474839, 1, 1, 1, 1, 1,
0.8267259, -0.1042289, 1.709138, 1, 1, 1, 1, 1,
0.8277406, -0.2526985, 0.5891029, 0, 0, 1, 1, 1,
0.8302664, -1.296394, 2.792232, 1, 0, 0, 1, 1,
0.8315849, -1.485777, 3.431149, 1, 0, 0, 1, 1,
0.8382357, -0.3367717, 2.932626, 1, 0, 0, 1, 1,
0.8382999, -0.7526894, 3.827445, 1, 0, 0, 1, 1,
0.8391845, -0.1368971, 0.5353301, 1, 0, 0, 1, 1,
0.8405128, -1.028185, 2.121753, 0, 0, 0, 1, 1,
0.8417333, 0.9415731, 0.4207447, 0, 0, 0, 1, 1,
0.8419864, -1.811365, 3.914427, 0, 0, 0, 1, 1,
0.8425018, -1.602626, 2.229153, 0, 0, 0, 1, 1,
0.8433885, -1.603079, 3.496542, 0, 0, 0, 1, 1,
0.8515103, 0.7966239, 1.10167, 0, 0, 0, 1, 1,
0.8624138, 1.740964, -0.0384756, 0, 0, 0, 1, 1,
0.8631753, -0.09577581, 1.21352, 1, 1, 1, 1, 1,
0.8646198, -0.4375901, 1.396959, 1, 1, 1, 1, 1,
0.8660563, 1.541772, -0.229132, 1, 1, 1, 1, 1,
0.8709952, 0.1359426, 2.715981, 1, 1, 1, 1, 1,
0.8754817, 0.6962584, 0.3434975, 1, 1, 1, 1, 1,
0.8793041, -0.01323773, -0.07379677, 1, 1, 1, 1, 1,
0.8797753, -0.09380338, 1.106246, 1, 1, 1, 1, 1,
0.8809789, 0.1985234, 3.509713, 1, 1, 1, 1, 1,
0.8820469, 0.6027393, 0.03068108, 1, 1, 1, 1, 1,
0.8861635, 0.1626535, 1.273247, 1, 1, 1, 1, 1,
0.8871869, -0.5779077, 2.261373, 1, 1, 1, 1, 1,
0.8909702, 0.6724024, 1.529683, 1, 1, 1, 1, 1,
0.8931772, -1.631889, -0.4245416, 1, 1, 1, 1, 1,
0.8933993, -0.5931537, 1.914137, 1, 1, 1, 1, 1,
0.8948388, -0.006712349, 4.174868, 1, 1, 1, 1, 1,
0.895905, -0.2483788, 1.560595, 0, 0, 1, 1, 1,
0.8971344, -0.3119699, 1.816084, 1, 0, 0, 1, 1,
0.9045154, 0.9529133, 1.479996, 1, 0, 0, 1, 1,
0.906442, -0.4765743, 2.902871, 1, 0, 0, 1, 1,
0.9103035, -0.9039946, 1.502359, 1, 0, 0, 1, 1,
0.9123198, 1.420722, 0.6984087, 1, 0, 0, 1, 1,
0.9135743, 1.300682, -0.4384297, 0, 0, 0, 1, 1,
0.9136551, -0.7155468, 2.699556, 0, 0, 0, 1, 1,
0.9191967, 0.6086187, -0.3695882, 0, 0, 0, 1, 1,
0.9247956, -1.736726, 2.692923, 0, 0, 0, 1, 1,
0.936412, -0.7473629, 2.284787, 0, 0, 0, 1, 1,
0.9374308, 0.01529232, 1.943989, 0, 0, 0, 1, 1,
0.9455914, -1.36831, 3.113888, 0, 0, 0, 1, 1,
0.9464517, -0.3960932, 0.3344419, 1, 1, 1, 1, 1,
0.9514694, -1.084689, 2.925903, 1, 1, 1, 1, 1,
0.9661095, -0.7382444, 1.166059, 1, 1, 1, 1, 1,
0.9677984, -1.142226, 2.860797, 1, 1, 1, 1, 1,
0.9939209, -2.140874, 1.85838, 1, 1, 1, 1, 1,
0.9958818, -1.319029, 3.986757, 1, 1, 1, 1, 1,
1.002216, 1.577671, -0.7335115, 1, 1, 1, 1, 1,
1.006686, 0.8215478, 2.551974, 1, 1, 1, 1, 1,
1.006686, 0.7323552, 0.01432442, 1, 1, 1, 1, 1,
1.015507, 0.6179686, 0.4399989, 1, 1, 1, 1, 1,
1.017153, 0.7152469, 0.1894682, 1, 1, 1, 1, 1,
1.021363, -0.1974873, 1.439732, 1, 1, 1, 1, 1,
1.025124, 0.4594485, 1.626115, 1, 1, 1, 1, 1,
1.027918, -1.179219, 3.683687, 1, 1, 1, 1, 1,
1.02979, 0.8746213, -1.056389, 1, 1, 1, 1, 1,
1.030856, 0.3117295, 2.51698, 0, 0, 1, 1, 1,
1.034332, -0.2890693, 1.363929, 1, 0, 0, 1, 1,
1.034795, 0.930301, 1.707236, 1, 0, 0, 1, 1,
1.036557, -0.6852217, 3.006284, 1, 0, 0, 1, 1,
1.039921, -0.1187009, 0.9563003, 1, 0, 0, 1, 1,
1.052517, -1.273532, 1.693327, 1, 0, 0, 1, 1,
1.056991, 0.9471845, 1.485218, 0, 0, 0, 1, 1,
1.058533, 1.416599, 2.593569, 0, 0, 0, 1, 1,
1.05916, -0.4781903, 2.563291, 0, 0, 0, 1, 1,
1.061511, -0.9552802, 1.791683, 0, 0, 0, 1, 1,
1.062018, -1.016222, 3.623069, 0, 0, 0, 1, 1,
1.067116, -0.06588993, 3.667985, 0, 0, 0, 1, 1,
1.074528, -0.9949429, 3.61901, 0, 0, 0, 1, 1,
1.075857, 0.4737332, 0.08435771, 1, 1, 1, 1, 1,
1.076604, 0.9611966, 1.356591, 1, 1, 1, 1, 1,
1.081227, -1.44816, 2.147387, 1, 1, 1, 1, 1,
1.083789, -0.06202712, -0.4604371, 1, 1, 1, 1, 1,
1.094221, -1.030386, 1.355968, 1, 1, 1, 1, 1,
1.096769, 0.2532134, 0.9019464, 1, 1, 1, 1, 1,
1.097662, -0.6227221, 1.946464, 1, 1, 1, 1, 1,
1.100781, 1.728297, -0.5743124, 1, 1, 1, 1, 1,
1.106763, -0.502296, 1.765247, 1, 1, 1, 1, 1,
1.108823, 0.09611666, 0.1667763, 1, 1, 1, 1, 1,
1.112401, 0.01604291, 1.633008, 1, 1, 1, 1, 1,
1.117123, 0.07846075, 0.7938539, 1, 1, 1, 1, 1,
1.122453, -0.1800617, 0.4534446, 1, 1, 1, 1, 1,
1.131202, -0.1905544, 0.3715021, 1, 1, 1, 1, 1,
1.139996, -0.9168429, 1.647339, 1, 1, 1, 1, 1,
1.14112, 0.04231217, 1.173133, 0, 0, 1, 1, 1,
1.142437, 0.03315666, 2.851871, 1, 0, 0, 1, 1,
1.146857, 0.8695012, 1.77893, 1, 0, 0, 1, 1,
1.15384, 1.209111, 0.1149407, 1, 0, 0, 1, 1,
1.154305, 0.09209207, 0.976733, 1, 0, 0, 1, 1,
1.161996, 0.2083108, 0.690381, 1, 0, 0, 1, 1,
1.163246, -1.461861, 3.81909, 0, 0, 0, 1, 1,
1.167002, -0.2907366, 1.945036, 0, 0, 0, 1, 1,
1.173962, 1.186707, 0.7125288, 0, 0, 0, 1, 1,
1.179571, -0.4845192, 2.248539, 0, 0, 0, 1, 1,
1.181063, -1.459635, 2.605502, 0, 0, 0, 1, 1,
1.181399, -1.617563, 2.525271, 0, 0, 0, 1, 1,
1.191332, -0.2258377, 1.163808, 0, 0, 0, 1, 1,
1.193133, -0.2745459, 3.009471, 1, 1, 1, 1, 1,
1.196378, 0.407016, 3.188226, 1, 1, 1, 1, 1,
1.199329, 0.4846684, 0.5259376, 1, 1, 1, 1, 1,
1.206066, -0.8045776, 3.67541, 1, 1, 1, 1, 1,
1.213197, 0.6391628, 1.638654, 1, 1, 1, 1, 1,
1.213233, -0.6066011, 2.398602, 1, 1, 1, 1, 1,
1.213503, -0.1779354, 1.787976, 1, 1, 1, 1, 1,
1.217186, 0.3651123, 1.431109, 1, 1, 1, 1, 1,
1.218399, -0.5486104, 3.680695, 1, 1, 1, 1, 1,
1.222927, -1.328683, 2.808737, 1, 1, 1, 1, 1,
1.227895, -1.090818, 2.09705, 1, 1, 1, 1, 1,
1.231943, 0.5711735, 0.3755485, 1, 1, 1, 1, 1,
1.235903, 0.1889061, 1.039706, 1, 1, 1, 1, 1,
1.236204, -0.9193917, 3.358461, 1, 1, 1, 1, 1,
1.242687, 1.162615, 1.361311, 1, 1, 1, 1, 1,
1.258949, -0.6925916, 4.258384, 0, 0, 1, 1, 1,
1.259161, 0.1772078, -0.5959316, 1, 0, 0, 1, 1,
1.267444, 1.012494, 1.394663, 1, 0, 0, 1, 1,
1.268992, 0.7011157, 1.544051, 1, 0, 0, 1, 1,
1.269188, -0.4240648, 2.017802, 1, 0, 0, 1, 1,
1.270889, 0.676851, 0.5769214, 1, 0, 0, 1, 1,
1.280386, -1.44342, 2.45198, 0, 0, 0, 1, 1,
1.2829, 0.5953234, 2.291146, 0, 0, 0, 1, 1,
1.284185, 0.457987, 0.8694369, 0, 0, 0, 1, 1,
1.29145, 0.9106064, 1.715639, 0, 0, 0, 1, 1,
1.292974, 0.768175, 1.939294, 0, 0, 0, 1, 1,
1.30012, 1.825083, 0.1516172, 0, 0, 0, 1, 1,
1.300554, 0.4853865, 1.640417, 0, 0, 0, 1, 1,
1.30136, 0.6106859, 1.018532, 1, 1, 1, 1, 1,
1.309227, -0.02138134, 1.424114, 1, 1, 1, 1, 1,
1.317919, 0.4690886, -0.1583567, 1, 1, 1, 1, 1,
1.323906, 0.1686856, -0.01323865, 1, 1, 1, 1, 1,
1.325649, -0.9430131, 0.7870297, 1, 1, 1, 1, 1,
1.335734, 0.09061239, 0.8411388, 1, 1, 1, 1, 1,
1.338298, 0.2948474, 0.6316196, 1, 1, 1, 1, 1,
1.341886, 0.2987943, 1.36278, 1, 1, 1, 1, 1,
1.355896, 0.5232046, 1.975966, 1, 1, 1, 1, 1,
1.356193, -0.1254708, 1.926287, 1, 1, 1, 1, 1,
1.363261, 1.276456, 1.954935, 1, 1, 1, 1, 1,
1.367124, 1.191557, 0.8055099, 1, 1, 1, 1, 1,
1.37967, 0.1675749, 1.746676, 1, 1, 1, 1, 1,
1.380324, 0.2761884, 2.527451, 1, 1, 1, 1, 1,
1.387895, -0.043984, 1.466307, 1, 1, 1, 1, 1,
1.392798, 1.010366, 2.002828, 0, 0, 1, 1, 1,
1.396268, 0.1883329, 2.90479, 1, 0, 0, 1, 1,
1.409767, 0.7807711, 1.243708, 1, 0, 0, 1, 1,
1.416109, 1.961235, 1.45243, 1, 0, 0, 1, 1,
1.416841, 2.416852, 1.722918, 1, 0, 0, 1, 1,
1.462008, 0.5115284, 0.5948963, 1, 0, 0, 1, 1,
1.467315, -0.8851942, 3.592707, 0, 0, 0, 1, 1,
1.490495, 0.2507637, 1.516451, 0, 0, 0, 1, 1,
1.505232, 0.1634657, 3.170696, 0, 0, 0, 1, 1,
1.505882, -1.624826, 3.3323, 0, 0, 0, 1, 1,
1.525092, -0.1532093, 2.346334, 0, 0, 0, 1, 1,
1.537985, -0.678152, 0.116292, 0, 0, 0, 1, 1,
1.539349, 0.2808427, 2.5938, 0, 0, 0, 1, 1,
1.55442, 0.6168448, 1.378851, 1, 1, 1, 1, 1,
1.557315, 0.1828135, 2.008734, 1, 1, 1, 1, 1,
1.559139, 0.1042076, 2.337551, 1, 1, 1, 1, 1,
1.560578, 0.3147925, 1.86152, 1, 1, 1, 1, 1,
1.562211, 0.5798193, 0.6909856, 1, 1, 1, 1, 1,
1.573958, 0.7219086, 0.4196687, 1, 1, 1, 1, 1,
1.587029, -0.3896183, 0.8983212, 1, 1, 1, 1, 1,
1.590069, 0.6849999, 0.1887218, 1, 1, 1, 1, 1,
1.598083, 0.5180565, 0.009659927, 1, 1, 1, 1, 1,
1.605042, -0.9665102, -0.5973686, 1, 1, 1, 1, 1,
1.613835, 0.3821427, 1.910134, 1, 1, 1, 1, 1,
1.616766, -0.6306567, 1.198781, 1, 1, 1, 1, 1,
1.621104, -0.968628, 2.465749, 1, 1, 1, 1, 1,
1.627518, 0.9156224, 3.43968, 1, 1, 1, 1, 1,
1.641073, 1.446122, 0.4273385, 1, 1, 1, 1, 1,
1.6547, -1.31792, 2.131227, 0, 0, 1, 1, 1,
1.671772, 0.5706843, 0.7660701, 1, 0, 0, 1, 1,
1.695163, -0.1398803, 1.399034, 1, 0, 0, 1, 1,
1.701645, 1.070891, 0.112552, 1, 0, 0, 1, 1,
1.704885, -0.1807427, 3.269835, 1, 0, 0, 1, 1,
1.727814, -2.113814, 1.572437, 1, 0, 0, 1, 1,
1.739757, 0.582194, 1.989784, 0, 0, 0, 1, 1,
1.743122, 0.4190894, 4.194417, 0, 0, 0, 1, 1,
1.77326, -0.3688058, 1.137612, 0, 0, 0, 1, 1,
1.774789, -0.7686995, 1.520058, 0, 0, 0, 1, 1,
1.777786, -0.8760426, 1.122014, 0, 0, 0, 1, 1,
1.785829, -0.8296299, 2.378023, 0, 0, 0, 1, 1,
1.788199, 0.219532, -0.06409058, 0, 0, 0, 1, 1,
1.802878, 0.4874493, 0.8528521, 1, 1, 1, 1, 1,
1.859185, -1.096972, 2.040452, 1, 1, 1, 1, 1,
1.868108, 0.5071605, -0.1158646, 1, 1, 1, 1, 1,
1.871007, 0.8579292, 1.282366, 1, 1, 1, 1, 1,
1.873886, -0.6717046, 2.245361, 1, 1, 1, 1, 1,
1.880565, 0.1251113, 1.175298, 1, 1, 1, 1, 1,
1.884074, 0.1742633, 1.734497, 1, 1, 1, 1, 1,
1.904559, -1.010005, 2.918103, 1, 1, 1, 1, 1,
1.920783, 0.3855656, 2.258807, 1, 1, 1, 1, 1,
1.923984, 0.8013059, 1.153154, 1, 1, 1, 1, 1,
1.939643, 0.256949, 0.3519634, 1, 1, 1, 1, 1,
1.942509, 0.1767059, 1.441409, 1, 1, 1, 1, 1,
1.945134, -0.1643537, 1.440594, 1, 1, 1, 1, 1,
1.946806, 0.9333278, 2.027986, 1, 1, 1, 1, 1,
2.007395, 0.05554321, 0.8584741, 1, 1, 1, 1, 1,
2.060281, -1.072551, 2.143963, 0, 0, 1, 1, 1,
2.101523, 0.4802393, -0.05360788, 1, 0, 0, 1, 1,
2.105604, 0.6295869, 4.463077, 1, 0, 0, 1, 1,
2.129489, 0.551263, 2.220514, 1, 0, 0, 1, 1,
2.186201, -0.5790628, 2.031344, 1, 0, 0, 1, 1,
2.209032, 1.485983, 2.060702, 1, 0, 0, 1, 1,
2.225204, 1.309419, 1.441602, 0, 0, 0, 1, 1,
2.231831, -0.6259965, 1.804919, 0, 0, 0, 1, 1,
2.27343, -1.839375, 1.21724, 0, 0, 0, 1, 1,
2.294818, 0.4732899, 0.5441599, 0, 0, 0, 1, 1,
2.330607, 1.473475, 0.4290664, 0, 0, 0, 1, 1,
2.332344, 0.7230068, -0.1410841, 0, 0, 0, 1, 1,
2.42138, -0.1711372, 2.029661, 0, 0, 0, 1, 1,
2.488774, -0.07871601, 1.271297, 1, 1, 1, 1, 1,
2.493124, 0.558076, 1.984872, 1, 1, 1, 1, 1,
2.560499, -0.07734673, 1.763113, 1, 1, 1, 1, 1,
2.568906, -0.5792359, 2.053069, 1, 1, 1, 1, 1,
2.622877, 0.9895689, 2.625099, 1, 1, 1, 1, 1,
2.830566, 1.147038, -0.265821, 1, 1, 1, 1, 1,
3.583089, 0.1180906, 1.726666, 1, 1, 1, 1, 1
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
var radius = 9.163034;
var distance = 32.18476;
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
mvMatrix.translate( -0.2973745, 0.03754556, 0.2129939 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.18476);
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
