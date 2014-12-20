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
-3.751295, 0.2512205, -2.016523, 1, 0, 0, 1,
-3.264979, -0.808276, -2.511343, 1, 0.007843138, 0, 1,
-2.989427, -0.3007327, -1.361828, 1, 0.01176471, 0, 1,
-2.83782, -0.4016423, -2.941371, 1, 0.01960784, 0, 1,
-2.826295, -0.4698606, -2.979381, 1, 0.02352941, 0, 1,
-2.740836, -0.1135258, -0.1803523, 1, 0.03137255, 0, 1,
-2.738604, 0.7454881, -2.643899, 1, 0.03529412, 0, 1,
-2.693957, -1.066672, -2.607165, 1, 0.04313726, 0, 1,
-2.67655, -0.3443707, -1.352087, 1, 0.04705882, 0, 1,
-2.646464, 1.136494, -1.500832, 1, 0.05490196, 0, 1,
-2.53856, -0.3947445, -2.575025, 1, 0.05882353, 0, 1,
-2.51812, 1.588264, -1.141357, 1, 0.06666667, 0, 1,
-2.477834, 0.1070306, -0.7970622, 1, 0.07058824, 0, 1,
-2.457862, 0.5148866, -0.3195708, 1, 0.07843138, 0, 1,
-2.371901, 0.8224187, -0.3122518, 1, 0.08235294, 0, 1,
-2.286763, 0.4442877, -0.9644624, 1, 0.09019608, 0, 1,
-2.25552, -0.5278421, -1.681737, 1, 0.09411765, 0, 1,
-2.225187, 0.174259, -1.706816, 1, 0.1019608, 0, 1,
-2.196305, -1.634922, -3.394865, 1, 0.1098039, 0, 1,
-2.175286, -0.727474, -1.94817, 1, 0.1137255, 0, 1,
-2.141987, 1.189702, -1.869931, 1, 0.1215686, 0, 1,
-2.134118, -0.429254, -1.63276, 1, 0.1254902, 0, 1,
-2.085507, 1.282992, -1.292537, 1, 0.1333333, 0, 1,
-2.053993, -0.6049088, -0.807957, 1, 0.1372549, 0, 1,
-2.044887, 1.140576, -0.1202576, 1, 0.145098, 0, 1,
-2.02626, -0.4632656, -3.844851, 1, 0.1490196, 0, 1,
-2.019855, 1.500686, -1.832256, 1, 0.1568628, 0, 1,
-1.991542, -0.4040346, -1.769557, 1, 0.1607843, 0, 1,
-1.964226, -0.7590026, -2.632274, 1, 0.1686275, 0, 1,
-1.962839, 0.09765783, -1.00044, 1, 0.172549, 0, 1,
-1.962397, -0.6931781, -1.018691, 1, 0.1803922, 0, 1,
-1.950214, -0.9997258, -2.233588, 1, 0.1843137, 0, 1,
-1.900136, 0.8093194, -0.03617256, 1, 0.1921569, 0, 1,
-1.88854, 0.7485143, -1.274234, 1, 0.1960784, 0, 1,
-1.874858, -0.8431765, -0.2812398, 1, 0.2039216, 0, 1,
-1.839695, 0.3605117, -1.320538, 1, 0.2117647, 0, 1,
-1.81772, 1.636369, -0.5086283, 1, 0.2156863, 0, 1,
-1.811574, -0.2740747, -2.132868, 1, 0.2235294, 0, 1,
-1.796569, -1.375853, -2.403219, 1, 0.227451, 0, 1,
-1.79362, -0.4015424, -1.773575, 1, 0.2352941, 0, 1,
-1.783332, -1.106834, -3.534819, 1, 0.2392157, 0, 1,
-1.781258, -0.409836, -1.224013, 1, 0.2470588, 0, 1,
-1.778627, -0.4859573, -3.027482, 1, 0.2509804, 0, 1,
-1.761886, -2.961785, -2.913302, 1, 0.2588235, 0, 1,
-1.75732, -0.7069489, -1.414842, 1, 0.2627451, 0, 1,
-1.745215, -1.403645, -1.450421, 1, 0.2705882, 0, 1,
-1.744173, 0.09150856, -0.6292883, 1, 0.2745098, 0, 1,
-1.722498, -0.9006242, -3.853059, 1, 0.282353, 0, 1,
-1.720791, -1.270357, -1.773501, 1, 0.2862745, 0, 1,
-1.707441, 0.2485651, -1.093882, 1, 0.2941177, 0, 1,
-1.697915, -0.3823219, -1.469212, 1, 0.3019608, 0, 1,
-1.68916, 0.2824031, -0.4056786, 1, 0.3058824, 0, 1,
-1.681285, 0.4825064, 0.9359881, 1, 0.3137255, 0, 1,
-1.670168, -1.123673, -2.95272, 1, 0.3176471, 0, 1,
-1.652209, 1.127896, -0.5687224, 1, 0.3254902, 0, 1,
-1.641294, -1.943818, -3.615661, 1, 0.3294118, 0, 1,
-1.63977, 1.105116, -0.03863031, 1, 0.3372549, 0, 1,
-1.620106, 0.2527233, -1.049044, 1, 0.3411765, 0, 1,
-1.61646, 0.563859, -1.715569, 1, 0.3490196, 0, 1,
-1.60562, -1.249545, -1.91729, 1, 0.3529412, 0, 1,
-1.603935, 0.8102409, -1.285282, 1, 0.3607843, 0, 1,
-1.594941, 0.8907256, -0.596894, 1, 0.3647059, 0, 1,
-1.58233, -0.5618556, -1.120953, 1, 0.372549, 0, 1,
-1.553714, 0.7230634, -1.520262, 1, 0.3764706, 0, 1,
-1.539832, -0.2372681, -0.1787415, 1, 0.3843137, 0, 1,
-1.520539, -0.8299149, -0.8302881, 1, 0.3882353, 0, 1,
-1.51985, -0.5944059, -3.005549, 1, 0.3960784, 0, 1,
-1.519247, 0.6742679, -1.957366, 1, 0.4039216, 0, 1,
-1.510259, -0.3835445, -2.028083, 1, 0.4078431, 0, 1,
-1.486258, -1.582306, -2.227716, 1, 0.4156863, 0, 1,
-1.47923, 1.753457, -3.561604, 1, 0.4196078, 0, 1,
-1.462823, -0.3208978, -2.144083, 1, 0.427451, 0, 1,
-1.456359, -0.1068304, -1.549239, 1, 0.4313726, 0, 1,
-1.447443, 1.241049, 0.5444134, 1, 0.4392157, 0, 1,
-1.419778, 0.280241, -0.4583005, 1, 0.4431373, 0, 1,
-1.410585, 1.345518, -2.016001, 1, 0.4509804, 0, 1,
-1.406809, -0.2247047, -2.005971, 1, 0.454902, 0, 1,
-1.405174, 0.1089813, -2.974771, 1, 0.4627451, 0, 1,
-1.399316, -0.3472284, 0.171471, 1, 0.4666667, 0, 1,
-1.393307, -0.8771335, -2.665962, 1, 0.4745098, 0, 1,
-1.384137, 0.2438435, -2.007192, 1, 0.4784314, 0, 1,
-1.38359, -0.6773548, -1.934505, 1, 0.4862745, 0, 1,
-1.371917, 0.1586827, -3.272772, 1, 0.4901961, 0, 1,
-1.35668, -0.3648578, -1.102848, 1, 0.4980392, 0, 1,
-1.348752, 0.03066479, -1.575256, 1, 0.5058824, 0, 1,
-1.339209, -1.245094, -1.596902, 1, 0.509804, 0, 1,
-1.332563, 0.2909312, -1.250041, 1, 0.5176471, 0, 1,
-1.331512, -0.3754827, -1.55245, 1, 0.5215687, 0, 1,
-1.328876, -0.9704866, -1.42568, 1, 0.5294118, 0, 1,
-1.327903, 1.350911, -0.782841, 1, 0.5333334, 0, 1,
-1.324903, 0.8000768, 0.04819561, 1, 0.5411765, 0, 1,
-1.321846, 0.5992664, -3.004747, 1, 0.5450981, 0, 1,
-1.319866, 0.4706504, -0.6076152, 1, 0.5529412, 0, 1,
-1.313052, -0.4299769, -1.577659, 1, 0.5568628, 0, 1,
-1.287052, 2.123456, -1.810741, 1, 0.5647059, 0, 1,
-1.284285, 0.751704, -0.9118015, 1, 0.5686275, 0, 1,
-1.275598, 0.8020312, -0.9570673, 1, 0.5764706, 0, 1,
-1.26942, -1.676142, -3.917, 1, 0.5803922, 0, 1,
-1.252494, -0.07505385, -1.046809, 1, 0.5882353, 0, 1,
-1.247279, -0.7292243, -1.459428, 1, 0.5921569, 0, 1,
-1.24724, -0.4970573, -2.207995, 1, 0.6, 0, 1,
-1.247034, 0.2709613, -2.155418, 1, 0.6078432, 0, 1,
-1.242325, -1.259827, -2.369366, 1, 0.6117647, 0, 1,
-1.216066, -1.777468, -1.155452, 1, 0.6196079, 0, 1,
-1.214127, -1.113798, -0.8808222, 1, 0.6235294, 0, 1,
-1.203477, -0.5720803, -2.859056, 1, 0.6313726, 0, 1,
-1.195717, -1.351588, -1.895436, 1, 0.6352941, 0, 1,
-1.177894, 0.9589973, -0.0003281341, 1, 0.6431373, 0, 1,
-1.172835, 1.144966, -0.6385437, 1, 0.6470588, 0, 1,
-1.171206, -1.045184, -1.17727, 1, 0.654902, 0, 1,
-1.170637, -0.02270008, -2.773779, 1, 0.6588235, 0, 1,
-1.162977, 0.3231613, -1.032301, 1, 0.6666667, 0, 1,
-1.16291, -1.559964, -2.20925, 1, 0.6705883, 0, 1,
-1.160975, 1.02267, 0.07417115, 1, 0.6784314, 0, 1,
-1.145456, 0.8322532, -1.185146, 1, 0.682353, 0, 1,
-1.136356, 1.377611, 0.09360228, 1, 0.6901961, 0, 1,
-1.131517, -1.26776, -2.31585, 1, 0.6941177, 0, 1,
-1.128271, 1.562656, -0.4757112, 1, 0.7019608, 0, 1,
-1.122336, -0.5800074, -3.749253, 1, 0.7098039, 0, 1,
-1.115638, 1.500717, -0.1217332, 1, 0.7137255, 0, 1,
-1.110608, -0.2334508, -1.174179, 1, 0.7215686, 0, 1,
-1.110555, -0.03033197, -1.773771, 1, 0.7254902, 0, 1,
-1.108558, 1.789268, -1.151214, 1, 0.7333333, 0, 1,
-1.107273, -2.4036, -1.573376, 1, 0.7372549, 0, 1,
-1.098938, -0.3621171, -0.7674636, 1, 0.7450981, 0, 1,
-1.096164, 0.4043702, 1.031245, 1, 0.7490196, 0, 1,
-1.094708, 0.9164908, -0.5619813, 1, 0.7568628, 0, 1,
-1.09062, 2.406704, -1.001162, 1, 0.7607843, 0, 1,
-1.087268, 1.369726, -0.04946529, 1, 0.7686275, 0, 1,
-1.084708, 0.7911934, -3.560225, 1, 0.772549, 0, 1,
-1.080983, 0.8658205, -0.3420947, 1, 0.7803922, 0, 1,
-1.076828, -0.372008, -2.421994, 1, 0.7843137, 0, 1,
-1.073517, 1.133653, -1.613729, 1, 0.7921569, 0, 1,
-1.072433, -0.7805265, -3.53456, 1, 0.7960784, 0, 1,
-1.069362, -1.719526, -3.064506, 1, 0.8039216, 0, 1,
-1.067101, 1.412343, -0.4997319, 1, 0.8117647, 0, 1,
-1.065024, 1.052415, 0.839201, 1, 0.8156863, 0, 1,
-1.046378, 0.6903264, 0.5462791, 1, 0.8235294, 0, 1,
-1.046219, 1.121297, 0.0726322, 1, 0.827451, 0, 1,
-1.041002, 1.511005, 0.1504727, 1, 0.8352941, 0, 1,
-1.0405, 1.527791, -1.056228, 1, 0.8392157, 0, 1,
-1.038206, 1.365137, -0.7494006, 1, 0.8470588, 0, 1,
-1.036041, 1.489066, -0.5445607, 1, 0.8509804, 0, 1,
-1.023938, 1.962677, -1.381528, 1, 0.8588235, 0, 1,
-1.022928, -0.2730688, -1.05066, 1, 0.8627451, 0, 1,
-1.022613, 2.176251, 1.212628, 1, 0.8705882, 0, 1,
-1.021183, 1.004637, -0.274177, 1, 0.8745098, 0, 1,
-1.019134, -0.6208705, -2.41805, 1, 0.8823529, 0, 1,
-1.018442, -0.0947515, -2.240069, 1, 0.8862745, 0, 1,
-1.00428, -0.8423147, -2.141246, 1, 0.8941177, 0, 1,
-1.003524, -1.576257, -3.497846, 1, 0.8980392, 0, 1,
-0.9983664, -1.099622, -2.241915, 1, 0.9058824, 0, 1,
-0.9976355, -0.734585, -2.636024, 1, 0.9137255, 0, 1,
-0.9948063, -1.04403, -1.023469, 1, 0.9176471, 0, 1,
-0.9941261, 0.1510434, -3.559186, 1, 0.9254902, 0, 1,
-0.9909667, 2.382221, -3.225705, 1, 0.9294118, 0, 1,
-0.978055, -0.4882157, -2.655693, 1, 0.9372549, 0, 1,
-0.9745611, -1.992907, -2.207558, 1, 0.9411765, 0, 1,
-0.9738005, -1.145351, -1.571896, 1, 0.9490196, 0, 1,
-0.9663178, 1.340044, -1.506268, 1, 0.9529412, 0, 1,
-0.9645528, 1.555836, 0.001142914, 1, 0.9607843, 0, 1,
-0.9639203, -0.5157034, -3.437569, 1, 0.9647059, 0, 1,
-0.9621919, -0.1248059, -0.7111194, 1, 0.972549, 0, 1,
-0.9595279, -0.9114895, -1.28117, 1, 0.9764706, 0, 1,
-0.9499472, 1.063572, -0.6801105, 1, 0.9843137, 0, 1,
-0.9495028, -0.7418918, -0.7420332, 1, 0.9882353, 0, 1,
-0.9489298, -0.671947, -0.6626876, 1, 0.9960784, 0, 1,
-0.9405413, 1.09733, -1.180065, 0.9960784, 1, 0, 1,
-0.9290251, 0.8948489, -0.6159695, 0.9921569, 1, 0, 1,
-0.9259784, -0.4530459, -2.616549, 0.9843137, 1, 0, 1,
-0.9152957, 0.6489437, -1.089824, 0.9803922, 1, 0, 1,
-0.9108638, -0.2928276, -4.091774, 0.972549, 1, 0, 1,
-0.9098877, 0.186422, -1.973562, 0.9686275, 1, 0, 1,
-0.9096392, -1.215879, -0.4101811, 0.9607843, 1, 0, 1,
-0.9044919, -1.220614, -3.253631, 0.9568627, 1, 0, 1,
-0.9033836, -0.2711555, -4.223845, 0.9490196, 1, 0, 1,
-0.9008233, 1.170811, -0.2593437, 0.945098, 1, 0, 1,
-0.9001575, 0.7110386, 0.2264651, 0.9372549, 1, 0, 1,
-0.9000385, 0.2025067, -2.388774, 0.9333333, 1, 0, 1,
-0.8968771, -0.2378706, -2.578595, 0.9254902, 1, 0, 1,
-0.8873441, 0.9144268, 0.06246419, 0.9215686, 1, 0, 1,
-0.8855174, -0.4103631, -0.4322309, 0.9137255, 1, 0, 1,
-0.8847095, -0.404593, -2.932068, 0.9098039, 1, 0, 1,
-0.8813738, 1.639808, -0.3528363, 0.9019608, 1, 0, 1,
-0.877354, -0.6939271, -1.774666, 0.8941177, 1, 0, 1,
-0.8751339, -1.511895, -3.315596, 0.8901961, 1, 0, 1,
-0.8703098, 1.433994, -1.855957, 0.8823529, 1, 0, 1,
-0.8662595, -0.54927, -1.575363, 0.8784314, 1, 0, 1,
-0.8638378, -1.147867, -2.382861, 0.8705882, 1, 0, 1,
-0.8577617, 1.092612, -0.896222, 0.8666667, 1, 0, 1,
-0.8556522, 1.322807, -0.1946288, 0.8588235, 1, 0, 1,
-0.8464559, 1.492968, -0.6783388, 0.854902, 1, 0, 1,
-0.8450316, 0.64549, -1.810927, 0.8470588, 1, 0, 1,
-0.844133, 0.9461213, -0.4295433, 0.8431373, 1, 0, 1,
-0.84084, 0.2853985, -0.7488854, 0.8352941, 1, 0, 1,
-0.8386595, -0.5983281, -1.216629, 0.8313726, 1, 0, 1,
-0.8354558, -0.09436477, -1.626776, 0.8235294, 1, 0, 1,
-0.8347155, -0.1183549, -2.803565, 0.8196079, 1, 0, 1,
-0.8340764, 1.24104, -1.338305, 0.8117647, 1, 0, 1,
-0.8322802, 0.8523927, -0.2116626, 0.8078431, 1, 0, 1,
-0.8293715, -0.7370719, -2.948153, 0.8, 1, 0, 1,
-0.826426, 1.240464, -1.381123, 0.7921569, 1, 0, 1,
-0.820124, -0.6330303, -2.591659, 0.7882353, 1, 0, 1,
-0.8177449, -0.6661321, -1.472316, 0.7803922, 1, 0, 1,
-0.8140644, -0.1541774, -1.725346, 0.7764706, 1, 0, 1,
-0.8136493, 0.8047195, -0.1063623, 0.7686275, 1, 0, 1,
-0.8060942, -0.768961, -1.421617, 0.7647059, 1, 0, 1,
-0.8019248, -1.675181, -2.439225, 0.7568628, 1, 0, 1,
-0.7990976, -0.7530987, -4.844569, 0.7529412, 1, 0, 1,
-0.7968857, 0.1109377, -2.890406, 0.7450981, 1, 0, 1,
-0.7903495, -0.2880777, -3.395579, 0.7411765, 1, 0, 1,
-0.7868949, -1.475185, -2.659981, 0.7333333, 1, 0, 1,
-0.7865964, 0.3480712, -0.8612854, 0.7294118, 1, 0, 1,
-0.7819043, 1.566808, -1.604237, 0.7215686, 1, 0, 1,
-0.7739787, 1.0003, -1.174108, 0.7176471, 1, 0, 1,
-0.7726378, 1.329693, -0.2107746, 0.7098039, 1, 0, 1,
-0.7684992, -1.368536, -2.857379, 0.7058824, 1, 0, 1,
-0.7683502, 1.418014, -1.285449, 0.6980392, 1, 0, 1,
-0.7666993, 0.01737054, -1.894583, 0.6901961, 1, 0, 1,
-0.7659429, 0.0004363836, 0.2861284, 0.6862745, 1, 0, 1,
-0.7621346, -0.1597174, -3.601003, 0.6784314, 1, 0, 1,
-0.7607021, -1.335529, -3.188792, 0.6745098, 1, 0, 1,
-0.756828, -0.3367673, -1.267499, 0.6666667, 1, 0, 1,
-0.7536142, 0.2223148, -1.542195, 0.6627451, 1, 0, 1,
-0.7505869, 0.4912376, -0.7139357, 0.654902, 1, 0, 1,
-0.7486413, -1.242102, -3.10315, 0.6509804, 1, 0, 1,
-0.7412754, 0.1405489, -2.233871, 0.6431373, 1, 0, 1,
-0.7404436, 0.2495938, -1.010688, 0.6392157, 1, 0, 1,
-0.7398249, -0.295609, -1.990913, 0.6313726, 1, 0, 1,
-0.7323964, 1.34313, -0.3248853, 0.627451, 1, 0, 1,
-0.7298699, 0.549631, -0.6022375, 0.6196079, 1, 0, 1,
-0.7265865, 0.3563783, -1.389123, 0.6156863, 1, 0, 1,
-0.7257925, 0.8491573, -0.9522814, 0.6078432, 1, 0, 1,
-0.7239564, 1.44704, -0.3921948, 0.6039216, 1, 0, 1,
-0.7102311, 0.2768469, -0.009113612, 0.5960785, 1, 0, 1,
-0.7099446, -0.009433064, -2.781672, 0.5882353, 1, 0, 1,
-0.6985748, -0.8606586, -2.628664, 0.5843138, 1, 0, 1,
-0.6936701, -0.4680223, -1.658919, 0.5764706, 1, 0, 1,
-0.6835231, -0.3632158, -1.866303, 0.572549, 1, 0, 1,
-0.6820127, 0.7127662, -0.7715753, 0.5647059, 1, 0, 1,
-0.6767365, -0.8562106, -3.025922, 0.5607843, 1, 0, 1,
-0.6765633, 1.067966, -0.04719683, 0.5529412, 1, 0, 1,
-0.6762495, -0.9496158, -3.090966, 0.5490196, 1, 0, 1,
-0.6760209, -0.8448016, -4.042736, 0.5411765, 1, 0, 1,
-0.6719861, 1.02839, -0.6328685, 0.5372549, 1, 0, 1,
-0.6716104, 0.1617735, -3.116958, 0.5294118, 1, 0, 1,
-0.6710868, 1.434706, 0.215531, 0.5254902, 1, 0, 1,
-0.6560201, 1.14081, -2.0553, 0.5176471, 1, 0, 1,
-0.6543813, -0.143527, -2.655444, 0.5137255, 1, 0, 1,
-0.6521829, -0.1780094, -2.241964, 0.5058824, 1, 0, 1,
-0.6509846, -0.2087812, -1.51687, 0.5019608, 1, 0, 1,
-0.6427528, 0.605758, -0.7259743, 0.4941176, 1, 0, 1,
-0.6398462, -0.9021387, -3.240214, 0.4862745, 1, 0, 1,
-0.6342, 0.8225453, -0.1067051, 0.4823529, 1, 0, 1,
-0.6312093, -1.128872, -3.645936, 0.4745098, 1, 0, 1,
-0.6271796, 0.5416394, 0.2444019, 0.4705882, 1, 0, 1,
-0.6195466, -1.399959, -1.990169, 0.4627451, 1, 0, 1,
-0.6179479, 1.171285, -0.3999402, 0.4588235, 1, 0, 1,
-0.6173851, -0.05454631, -0.2923486, 0.4509804, 1, 0, 1,
-0.6171736, 1.134951, -2.423755, 0.4470588, 1, 0, 1,
-0.6121117, 0.6569548, 0.9770504, 0.4392157, 1, 0, 1,
-0.61125, 0.5473793, -2.329214, 0.4352941, 1, 0, 1,
-0.6058089, -1.277473, -1.373668, 0.427451, 1, 0, 1,
-0.6046189, 1.190889, -2.022588, 0.4235294, 1, 0, 1,
-0.5992201, -1.391263, -1.98195, 0.4156863, 1, 0, 1,
-0.5957232, 0.07926909, -0.7221483, 0.4117647, 1, 0, 1,
-0.5917081, -0.03897166, -0.9297756, 0.4039216, 1, 0, 1,
-0.5915158, 0.3047866, -1.298781, 0.3960784, 1, 0, 1,
-0.584004, 0.8050004, -1.118032, 0.3921569, 1, 0, 1,
-0.5804892, -0.7775315, -1.052645, 0.3843137, 1, 0, 1,
-0.575536, 0.3707053, -1.816363, 0.3803922, 1, 0, 1,
-0.5730623, 0.8452536, -0.7838267, 0.372549, 1, 0, 1,
-0.5666921, 0.4607227, -0.9018272, 0.3686275, 1, 0, 1,
-0.5640473, 0.8424248, 0.2777535, 0.3607843, 1, 0, 1,
-0.5614135, 3.110237, 1.867334, 0.3568628, 1, 0, 1,
-0.5555289, 0.0266856, -0.4064595, 0.3490196, 1, 0, 1,
-0.5511793, 0.9283395, -2.025918, 0.345098, 1, 0, 1,
-0.550343, 0.716044, -0.2898113, 0.3372549, 1, 0, 1,
-0.5496475, -1.795601, -1.76431, 0.3333333, 1, 0, 1,
-0.5409477, 1.377881, 0.3315162, 0.3254902, 1, 0, 1,
-0.540522, 0.7871311, -1.304413, 0.3215686, 1, 0, 1,
-0.5396897, 0.9852393, -0.04187211, 0.3137255, 1, 0, 1,
-0.5384411, -0.8817044, -3.151927, 0.3098039, 1, 0, 1,
-0.5286745, -0.7487256, -2.248927, 0.3019608, 1, 0, 1,
-0.5276287, 0.1972423, -2.077805, 0.2941177, 1, 0, 1,
-0.526485, 0.8613688, -0.6172878, 0.2901961, 1, 0, 1,
-0.5109383, 0.4985965, -1.035374, 0.282353, 1, 0, 1,
-0.5075995, -0.6808256, -3.435331, 0.2784314, 1, 0, 1,
-0.505422, -0.6452225, -2.819878, 0.2705882, 1, 0, 1,
-0.5004294, -0.6261987, -3.713252, 0.2666667, 1, 0, 1,
-0.4977559, -0.294767, -3.283317, 0.2588235, 1, 0, 1,
-0.4912411, -1.252414, -1.830254, 0.254902, 1, 0, 1,
-0.4906374, -1.822378, -3.431631, 0.2470588, 1, 0, 1,
-0.4859801, 1.348424, 0.5280223, 0.2431373, 1, 0, 1,
-0.4832265, -0.2995262, -3.154056, 0.2352941, 1, 0, 1,
-0.4810153, 0.06067851, -2.028454, 0.2313726, 1, 0, 1,
-0.4740374, -1.501668, -3.958537, 0.2235294, 1, 0, 1,
-0.4703377, -0.3756247, -1.369489, 0.2196078, 1, 0, 1,
-0.4671527, 0.5916769, -0.3881489, 0.2117647, 1, 0, 1,
-0.466573, -1.684655, -3.616349, 0.2078431, 1, 0, 1,
-0.4638656, -0.6500629, -0.7843329, 0.2, 1, 0, 1,
-0.462993, -1.596878, -0.9187348, 0.1921569, 1, 0, 1,
-0.4586319, -0.5761175, -4.238449, 0.1882353, 1, 0, 1,
-0.4540299, 0.897509, -1.215657, 0.1803922, 1, 0, 1,
-0.4527264, -0.6938087, -4.087139, 0.1764706, 1, 0, 1,
-0.4496351, 0.3717422, -1.635709, 0.1686275, 1, 0, 1,
-0.4494952, -1.353704, -1.72814, 0.1647059, 1, 0, 1,
-0.4475934, -0.4285943, -2.191886, 0.1568628, 1, 0, 1,
-0.444584, -1.177071, -3.675545, 0.1529412, 1, 0, 1,
-0.4386496, 1.102262, -0.00424985, 0.145098, 1, 0, 1,
-0.4333883, -0.7511867, -1.896954, 0.1411765, 1, 0, 1,
-0.4281671, 1.376796, -1.902994, 0.1333333, 1, 0, 1,
-0.4235469, -0.6853849, -4.440905, 0.1294118, 1, 0, 1,
-0.4228787, 0.7692557, 1.67796, 0.1215686, 1, 0, 1,
-0.4220602, 1.676523, 1.375195, 0.1176471, 1, 0, 1,
-0.4142357, 1.450567, -0.3698737, 0.1098039, 1, 0, 1,
-0.4065311, -0.1836408, -3.448062, 0.1058824, 1, 0, 1,
-0.405757, -0.08634543, -0.4545852, 0.09803922, 1, 0, 1,
-0.4055794, 1.734686, -0.9263763, 0.09019608, 1, 0, 1,
-0.4050517, -1.45913, -2.860955, 0.08627451, 1, 0, 1,
-0.4027926, 0.001450743, -1.635171, 0.07843138, 1, 0, 1,
-0.4012041, 0.7753746, -0.3556073, 0.07450981, 1, 0, 1,
-0.4009522, -0.3367766, -1.331413, 0.06666667, 1, 0, 1,
-0.3996869, -1.789804, -4.310984, 0.0627451, 1, 0, 1,
-0.3968838, -0.2355906, -2.021096, 0.05490196, 1, 0, 1,
-0.3943397, -1.120943, -2.724607, 0.05098039, 1, 0, 1,
-0.393558, 0.16113, -0.9625329, 0.04313726, 1, 0, 1,
-0.3927152, -0.8848168, -3.771154, 0.03921569, 1, 0, 1,
-0.3918103, 1.564962, -1.069778, 0.03137255, 1, 0, 1,
-0.3916851, 0.9442523, 0.7579263, 0.02745098, 1, 0, 1,
-0.3915806, -0.7804679, -2.490245, 0.01960784, 1, 0, 1,
-0.3883302, 1.415459, 0.006667503, 0.01568628, 1, 0, 1,
-0.388, -1.659295, -0.5427947, 0.007843138, 1, 0, 1,
-0.3849539, 0.1481826, -1.487441, 0.003921569, 1, 0, 1,
-0.3770229, 1.707461, 0.9487099, 0, 1, 0.003921569, 1,
-0.3723532, -0.2349887, -2.429613, 0, 1, 0.01176471, 1,
-0.3699371, -1.593017, -4.080567, 0, 1, 0.01568628, 1,
-0.3686766, -0.9408312, -2.202683, 0, 1, 0.02352941, 1,
-0.3684512, 0.3245106, -0.4271141, 0, 1, 0.02745098, 1,
-0.3683009, -0.433564, -2.677122, 0, 1, 0.03529412, 1,
-0.3667994, 0.1942361, -1.277234, 0, 1, 0.03921569, 1,
-0.3657876, 1.070766, -0.385882, 0, 1, 0.04705882, 1,
-0.3638129, -1.581953, -0.1943664, 0, 1, 0.05098039, 1,
-0.3626974, -0.2481998, -2.57096, 0, 1, 0.05882353, 1,
-0.3624613, -0.5958843, -3.051409, 0, 1, 0.0627451, 1,
-0.3611182, 1.394677, -0.04649124, 0, 1, 0.07058824, 1,
-0.35997, -2.377676, -2.487857, 0, 1, 0.07450981, 1,
-0.3594742, 0.6501768, -2.234478, 0, 1, 0.08235294, 1,
-0.3572136, -1.639331, -4.148367, 0, 1, 0.08627451, 1,
-0.3538895, -0.1147227, -1.059076, 0, 1, 0.09411765, 1,
-0.3488864, -1.219721, -3.429868, 0, 1, 0.1019608, 1,
-0.3481039, 2.89346, 1.395738, 0, 1, 0.1058824, 1,
-0.3447675, 0.5118338, -1.892924, 0, 1, 0.1137255, 1,
-0.3436566, -0.5503057, -1.637277, 0, 1, 0.1176471, 1,
-0.3422654, -1.137351, -1.479594, 0, 1, 0.1254902, 1,
-0.3350966, 0.4560868, -0.06691374, 0, 1, 0.1294118, 1,
-0.3346651, 1.1517, -1.759452, 0, 1, 0.1372549, 1,
-0.333926, -0.1835313, -1.962935, 0, 1, 0.1411765, 1,
-0.3288066, 0.2190327, -0.2421243, 0, 1, 0.1490196, 1,
-0.32567, 0.2698581, 0.2122109, 0, 1, 0.1529412, 1,
-0.3249286, 0.4502405, -0.1029836, 0, 1, 0.1607843, 1,
-0.3206651, 0.2874822, -0.5873586, 0, 1, 0.1647059, 1,
-0.3158711, -0.5123047, -1.575389, 0, 1, 0.172549, 1,
-0.3151112, 0.4577578, -0.4698803, 0, 1, 0.1764706, 1,
-0.3129586, -0.8938314, -3.242131, 0, 1, 0.1843137, 1,
-0.3122572, -0.02371627, -1.105795, 0, 1, 0.1882353, 1,
-0.3077742, 0.5613326, -1.531306, 0, 1, 0.1960784, 1,
-0.3056868, -0.2291427, -0.5955514, 0, 1, 0.2039216, 1,
-0.3049756, -1.28447, -3.205758, 0, 1, 0.2078431, 1,
-0.3046458, 1.28037, -0.08517833, 0, 1, 0.2156863, 1,
-0.3008693, -2.398127, -3.968897, 0, 1, 0.2196078, 1,
-0.2973526, 1.41437, -1.561314, 0, 1, 0.227451, 1,
-0.2972763, -0.3513519, -1.803625, 0, 1, 0.2313726, 1,
-0.2967511, -0.2438039, -2.389019, 0, 1, 0.2392157, 1,
-0.2942688, 0.9319809, -0.2820935, 0, 1, 0.2431373, 1,
-0.2882253, 0.1576184, -0.7523034, 0, 1, 0.2509804, 1,
-0.2872597, -1.481337, -2.400654, 0, 1, 0.254902, 1,
-0.2835237, 0.7388577, -1.913459, 0, 1, 0.2627451, 1,
-0.2795389, 1.175969, -0.947867, 0, 1, 0.2666667, 1,
-0.2775847, -0.5531595, -2.939939, 0, 1, 0.2745098, 1,
-0.2754616, 0.8767245, 0.7336235, 0, 1, 0.2784314, 1,
-0.2665513, 0.3800371, 0.7439098, 0, 1, 0.2862745, 1,
-0.2597995, -1.017834, -2.082687, 0, 1, 0.2901961, 1,
-0.2594582, 0.5922121, 1.034584, 0, 1, 0.2980392, 1,
-0.258143, -0.8767245, -2.442138, 0, 1, 0.3058824, 1,
-0.2569041, 1.411493, 0.5007015, 0, 1, 0.3098039, 1,
-0.2537304, -0.7631187, -2.223786, 0, 1, 0.3176471, 1,
-0.2499422, -0.4970287, -3.896013, 0, 1, 0.3215686, 1,
-0.2499038, 1.640227, 1.379408, 0, 1, 0.3294118, 1,
-0.2414009, -1.254115, -1.966227, 0, 1, 0.3333333, 1,
-0.2413193, -0.5181745, -3.510965, 0, 1, 0.3411765, 1,
-0.2392558, 0.206652, -1.126451, 0, 1, 0.345098, 1,
-0.2383061, 1.324878, 0.3449754, 0, 1, 0.3529412, 1,
-0.2322309, -0.5024623, -0.9156762, 0, 1, 0.3568628, 1,
-0.2263527, 0.4756199, 0.5355781, 0, 1, 0.3647059, 1,
-0.2261966, 2.023635, -0.01331824, 0, 1, 0.3686275, 1,
-0.2244392, 0.1443072, -2.498151, 0, 1, 0.3764706, 1,
-0.2165719, 2.325411, 0.1437396, 0, 1, 0.3803922, 1,
-0.2142672, 0.2220556, -0.1022556, 0, 1, 0.3882353, 1,
-0.2095051, -0.0678523, -1.252402, 0, 1, 0.3921569, 1,
-0.205302, -1.017716, -2.139607, 0, 1, 0.4, 1,
-0.2030524, -0.5563723, -4.54107, 0, 1, 0.4078431, 1,
-0.2017667, -1.545443, -2.174733, 0, 1, 0.4117647, 1,
-0.2008781, -0.4732194, -2.061116, 0, 1, 0.4196078, 1,
-0.1847121, -0.1164315, -2.478516, 0, 1, 0.4235294, 1,
-0.1754679, 0.3450882, -1.115637, 0, 1, 0.4313726, 1,
-0.17374, -1.822818, -4.056745, 0, 1, 0.4352941, 1,
-0.1705628, 0.02244555, -4.201397, 0, 1, 0.4431373, 1,
-0.1673506, -0.3159644, -2.333815, 0, 1, 0.4470588, 1,
-0.1668522, 1.277819, -0.3961088, 0, 1, 0.454902, 1,
-0.1666134, 0.07347028, -0.5022939, 0, 1, 0.4588235, 1,
-0.1649519, -0.454472, -2.857483, 0, 1, 0.4666667, 1,
-0.1586545, 0.05173599, 0.4774486, 0, 1, 0.4705882, 1,
-0.1577614, -0.1641207, -1.037139, 0, 1, 0.4784314, 1,
-0.1562165, 0.5146068, -0.4953173, 0, 1, 0.4823529, 1,
-0.1517655, 1.309974, -0.09119125, 0, 1, 0.4901961, 1,
-0.1516934, -0.9604615, -3.695834, 0, 1, 0.4941176, 1,
-0.1506939, 1.517942, -2.163175, 0, 1, 0.5019608, 1,
-0.150546, -0.01408394, -2.061509, 0, 1, 0.509804, 1,
-0.1418741, 2.172667, 1.113596, 0, 1, 0.5137255, 1,
-0.1393747, 0.6301649, -2.263944, 0, 1, 0.5215687, 1,
-0.1363449, 0.8639426, -0.6780071, 0, 1, 0.5254902, 1,
-0.1362344, 0.7414042, 1.268855, 0, 1, 0.5333334, 1,
-0.1285442, 0.5443949, 1.021115, 0, 1, 0.5372549, 1,
-0.1216266, 0.8559653, -2.174037, 0, 1, 0.5450981, 1,
-0.117122, -0.9151444, -4.882344, 0, 1, 0.5490196, 1,
-0.1139483, -0.5493713, -2.845189, 0, 1, 0.5568628, 1,
-0.1127599, -1.0919, -2.248244, 0, 1, 0.5607843, 1,
-0.1118846, 0.3439335, -0.4865559, 0, 1, 0.5686275, 1,
-0.1078593, 0.1945078, 0.6246378, 0, 1, 0.572549, 1,
-0.1049909, -1.317789, -4.021907, 0, 1, 0.5803922, 1,
-0.1033438, -2.981046, -3.299025, 0, 1, 0.5843138, 1,
-0.09627138, -1.257836, -2.576641, 0, 1, 0.5921569, 1,
-0.09478894, -1.831241, -1.838802, 0, 1, 0.5960785, 1,
-0.09382676, -0.389627, -1.926126, 0, 1, 0.6039216, 1,
-0.08398529, 0.2746543, 0.8655676, 0, 1, 0.6117647, 1,
-0.08396922, -0.8540527, -3.301621, 0, 1, 0.6156863, 1,
-0.07681949, -0.9801567, -2.145061, 0, 1, 0.6235294, 1,
-0.07346036, 0.5929368, -0.4912368, 0, 1, 0.627451, 1,
-0.06919145, 1.026957, -0.7478224, 0, 1, 0.6352941, 1,
-0.06857207, 0.1758837, -0.2388152, 0, 1, 0.6392157, 1,
-0.06790074, 1.706645, 1.888518, 0, 1, 0.6470588, 1,
-0.0656994, -0.2604481, -1.905489, 0, 1, 0.6509804, 1,
-0.06231933, -0.145863, -3.860174, 0, 1, 0.6588235, 1,
-0.05782145, 0.07110842, -2.152918, 0, 1, 0.6627451, 1,
-0.05709344, -1.719543, -3.32133, 0, 1, 0.6705883, 1,
-0.05632963, 0.3681137, -2.647727, 0, 1, 0.6745098, 1,
-0.05338087, 1.157555, -0.7610719, 0, 1, 0.682353, 1,
-0.05294687, -0.5710219, -2.044859, 0, 1, 0.6862745, 1,
-0.05214595, -0.2865518, -3.552953, 0, 1, 0.6941177, 1,
-0.04168412, 0.3767031, -1.67989, 0, 1, 0.7019608, 1,
-0.03998126, 0.1773047, -0.2894544, 0, 1, 0.7058824, 1,
-0.03554633, -0.1001839, -4.172144, 0, 1, 0.7137255, 1,
-0.03305198, 0.6760431, 1.101398, 0, 1, 0.7176471, 1,
-0.03125251, -0.6651785, -4.018997, 0, 1, 0.7254902, 1,
-0.02760349, -1.024545, -2.405842, 0, 1, 0.7294118, 1,
-0.02632099, -2.241563, -2.94713, 0, 1, 0.7372549, 1,
-0.02195953, -0.7408822, -2.926053, 0, 1, 0.7411765, 1,
-0.01980523, -1.05584, -4.202908, 0, 1, 0.7490196, 1,
-0.01638755, -0.926107, -2.824155, 0, 1, 0.7529412, 1,
-0.01466757, -0.8407858, -5.659963, 0, 1, 0.7607843, 1,
-0.01042891, -0.111308, -2.951827, 0, 1, 0.7647059, 1,
-0.004274504, -0.4600655, -3.979866, 0, 1, 0.772549, 1,
-0.004023705, -1.183538, -3.696663, 0, 1, 0.7764706, 1,
-0.0008090009, -0.9866646, -4.879181, 0, 1, 0.7843137, 1,
-0.0001626153, -1.163579, -5.025489, 0, 1, 0.7882353, 1,
0.0006245562, 0.5085884, -0.6869372, 0, 1, 0.7960784, 1,
0.000736968, -0.3771378, 3.586021, 0, 1, 0.8039216, 1,
0.001691954, -1.603605, 4.2301, 0, 1, 0.8078431, 1,
0.002482341, 0.4834231, 0.7966648, 0, 1, 0.8156863, 1,
0.008295283, -0.1607907, 4.612252, 0, 1, 0.8196079, 1,
0.01313427, -1.444378, 2.787885, 0, 1, 0.827451, 1,
0.01374609, 0.7598325, 0.9107687, 0, 1, 0.8313726, 1,
0.01823539, -1.063756, 2.750844, 0, 1, 0.8392157, 1,
0.01965955, -0.1472387, 3.642437, 0, 1, 0.8431373, 1,
0.01988553, -0.3442008, 1.615188, 0, 1, 0.8509804, 1,
0.02024127, -0.2067285, 3.625369, 0, 1, 0.854902, 1,
0.0228442, 0.4842733, -2.316463, 0, 1, 0.8627451, 1,
0.02895674, 0.01364565, 1.044459, 0, 1, 0.8666667, 1,
0.03016063, 1.122046, -0.3758939, 0, 1, 0.8745098, 1,
0.03193982, -0.2716856, 1.354021, 0, 1, 0.8784314, 1,
0.03445212, -0.1667903, 3.405216, 0, 1, 0.8862745, 1,
0.03490791, -0.9174029, 2.617504, 0, 1, 0.8901961, 1,
0.03648642, 0.3746683, 1.653829, 0, 1, 0.8980392, 1,
0.03796115, -1.806784, 1.893188, 0, 1, 0.9058824, 1,
0.04089298, 0.751619, -0.9310453, 0, 1, 0.9098039, 1,
0.0430381, 0.4854904, 1.479885, 0, 1, 0.9176471, 1,
0.04858499, 1.213972, 0.5943606, 0, 1, 0.9215686, 1,
0.04985477, -1.077111, 2.97302, 0, 1, 0.9294118, 1,
0.05092347, -0.8162887, 3.682769, 0, 1, 0.9333333, 1,
0.05368332, -0.684952, 3.837949, 0, 1, 0.9411765, 1,
0.05645024, -1.894116, 3.087475, 0, 1, 0.945098, 1,
0.06172508, 0.5461071, 0.2683004, 0, 1, 0.9529412, 1,
0.06366713, 0.172638, 1.685361, 0, 1, 0.9568627, 1,
0.06624477, 0.8260907, 0.5692768, 0, 1, 0.9647059, 1,
0.06947264, 0.8041827, 0.6115852, 0, 1, 0.9686275, 1,
0.07831571, -1.023913, 5.359616, 0, 1, 0.9764706, 1,
0.07996839, 0.2308842, 0.8658038, 0, 1, 0.9803922, 1,
0.0814154, -0.7412426, 2.190346, 0, 1, 0.9882353, 1,
0.08282541, -0.1930684, 1.586556, 0, 1, 0.9921569, 1,
0.08329423, -1.378688, 1.819201, 0, 1, 1, 1,
0.08559497, -0.6322815, 1.430724, 0, 0.9921569, 1, 1,
0.08606324, 0.9214368, 2.360706, 0, 0.9882353, 1, 1,
0.0868138, 0.2424565, 0.379882, 0, 0.9803922, 1, 1,
0.08708496, 0.38551, -1.749429, 0, 0.9764706, 1, 1,
0.08805601, 0.09178343, -0.3498941, 0, 0.9686275, 1, 1,
0.08871437, -0.4694284, 3.665547, 0, 0.9647059, 1, 1,
0.08904114, -0.2844353, 1.468513, 0, 0.9568627, 1, 1,
0.08934638, 0.3367887, -0.7322757, 0, 0.9529412, 1, 1,
0.09025607, 0.09266008, 1.610138, 0, 0.945098, 1, 1,
0.09133422, 0.5801626, 0.6181833, 0, 0.9411765, 1, 1,
0.09232007, -1.099638, 3.159034, 0, 0.9333333, 1, 1,
0.09452011, 0.4726271, -0.09480533, 0, 0.9294118, 1, 1,
0.09603041, 1.281563, -0.8141562, 0, 0.9215686, 1, 1,
0.09898828, -0.4769798, 3.55728, 0, 0.9176471, 1, 1,
0.1020508, 1.091487, -1.834214, 0, 0.9098039, 1, 1,
0.1021098, 0.9396268, -0.1197794, 0, 0.9058824, 1, 1,
0.1067847, -0.805181, 2.259622, 0, 0.8980392, 1, 1,
0.1085515, 0.4772778, 0.6879422, 0, 0.8901961, 1, 1,
0.1087777, -1.223057, 2.13413, 0, 0.8862745, 1, 1,
0.1136549, 0.1939833, 0.9680294, 0, 0.8784314, 1, 1,
0.115416, 1.557659, 0.6885622, 0, 0.8745098, 1, 1,
0.1161791, 0.1651792, -0.978516, 0, 0.8666667, 1, 1,
0.1242634, 0.3339314, 0.86584, 0, 0.8627451, 1, 1,
0.1332382, -0.1327329, 1.260336, 0, 0.854902, 1, 1,
0.134442, 0.7971229, 0.1830534, 0, 0.8509804, 1, 1,
0.1350622, -1.687092, 3.578038, 0, 0.8431373, 1, 1,
0.136617, -0.8153083, 3.372567, 0, 0.8392157, 1, 1,
0.1419182, 0.5756086, -0.8577784, 0, 0.8313726, 1, 1,
0.1421833, -0.3931544, 2.806737, 0, 0.827451, 1, 1,
0.1427701, 0.7576293, -0.07318611, 0, 0.8196079, 1, 1,
0.1428335, 2.446416, -0.2598337, 0, 0.8156863, 1, 1,
0.1432169, 0.03390864, 2.258172, 0, 0.8078431, 1, 1,
0.1457021, -0.08228777, 2.559033, 0, 0.8039216, 1, 1,
0.147011, -1.287091, 4.030202, 0, 0.7960784, 1, 1,
0.1510699, -0.9039057, 2.180275, 0, 0.7882353, 1, 1,
0.1520735, 1.084009, 1.010283, 0, 0.7843137, 1, 1,
0.1524768, 0.07889153, 1.663903, 0, 0.7764706, 1, 1,
0.1548758, -0.6730615, 3.352798, 0, 0.772549, 1, 1,
0.1559301, 0.07345388, -1.043514, 0, 0.7647059, 1, 1,
0.1574211, -1.485861, 3.902997, 0, 0.7607843, 1, 1,
0.1584592, -0.6328741, 4.032948, 0, 0.7529412, 1, 1,
0.1592609, -0.4207063, 1.444658, 0, 0.7490196, 1, 1,
0.1594162, 0.9015203, -0.3543827, 0, 0.7411765, 1, 1,
0.1600209, -1.243142, 3.557008, 0, 0.7372549, 1, 1,
0.1649208, -0.4018804, 4.129929, 0, 0.7294118, 1, 1,
0.1659881, 1.347219, 0.932146, 0, 0.7254902, 1, 1,
0.1706579, 0.2299244, 0.7159576, 0, 0.7176471, 1, 1,
0.1710831, -0.2537, 3.245352, 0, 0.7137255, 1, 1,
0.1714137, -0.176892, 1.29214, 0, 0.7058824, 1, 1,
0.1737248, -0.3364859, 3.576146, 0, 0.6980392, 1, 1,
0.1749115, 0.1894244, 2.133641, 0, 0.6941177, 1, 1,
0.1755808, 0.7075769, 2.831069, 0, 0.6862745, 1, 1,
0.1773106, -1.273193, 3.609001, 0, 0.682353, 1, 1,
0.1782586, 0.4429005, 1.250152, 0, 0.6745098, 1, 1,
0.1795124, 1.241649, -0.8785051, 0, 0.6705883, 1, 1,
0.1813324, 0.3656948, 2.826463, 0, 0.6627451, 1, 1,
0.1833664, -0.7887005, 3.592078, 0, 0.6588235, 1, 1,
0.1847804, 0.2161884, 1.844555, 0, 0.6509804, 1, 1,
0.1867755, 0.6025967, -0.1388433, 0, 0.6470588, 1, 1,
0.1889917, -1.602974, 2.103354, 0, 0.6392157, 1, 1,
0.189281, 0.9678854, -1.183861, 0, 0.6352941, 1, 1,
0.1903921, -0.6440219, 2.381804, 0, 0.627451, 1, 1,
0.1921548, -0.1387408, 2.324202, 0, 0.6235294, 1, 1,
0.1972736, 0.8279589, 1.115597, 0, 0.6156863, 1, 1,
0.1995911, -0.859059, 3.853032, 0, 0.6117647, 1, 1,
0.2042471, -0.2431647, 1.482468, 0, 0.6039216, 1, 1,
0.2062406, 1.168248, 0.9018789, 0, 0.5960785, 1, 1,
0.2076662, -0.6011467, 4.08376, 0, 0.5921569, 1, 1,
0.2110754, -0.6674297, 2.673573, 0, 0.5843138, 1, 1,
0.21263, -1.897057, 2.931837, 0, 0.5803922, 1, 1,
0.2143824, -0.2719022, 2.786599, 0, 0.572549, 1, 1,
0.2158036, -0.7049114, 3.034077, 0, 0.5686275, 1, 1,
0.2161531, 0.06101661, 2.366908, 0, 0.5607843, 1, 1,
0.2162568, 1.128504, 2.694162, 0, 0.5568628, 1, 1,
0.2165368, -0.1972869, 1.826974, 0, 0.5490196, 1, 1,
0.2176949, 0.5394494, -0.9062766, 0, 0.5450981, 1, 1,
0.2195217, 0.5283127, -1.01967, 0, 0.5372549, 1, 1,
0.2195455, 0.4477, 0.8824507, 0, 0.5333334, 1, 1,
0.2217771, -1.710133, 3.982369, 0, 0.5254902, 1, 1,
0.2241009, -1.056482, 2.959181, 0, 0.5215687, 1, 1,
0.2300671, -0.4394247, 4.927905, 0, 0.5137255, 1, 1,
0.2349599, -1.532976, 3.332766, 0, 0.509804, 1, 1,
0.2356744, 0.8891377, 0.6936576, 0, 0.5019608, 1, 1,
0.2364473, -0.6887225, 3.061339, 0, 0.4941176, 1, 1,
0.2366225, 2.723422, -1.454193, 0, 0.4901961, 1, 1,
0.2377247, 1.294234, 0.3903022, 0, 0.4823529, 1, 1,
0.2380059, 0.4064486, -0.2783433, 0, 0.4784314, 1, 1,
0.2487451, 0.05322403, 0.684494, 0, 0.4705882, 1, 1,
0.2489802, 0.9124339, 0.7334893, 0, 0.4666667, 1, 1,
0.2526683, -0.3163368, 2.897084, 0, 0.4588235, 1, 1,
0.2531513, -0.3317875, 3.035738, 0, 0.454902, 1, 1,
0.2534147, 0.5127123, 0.1529263, 0, 0.4470588, 1, 1,
0.2541379, -0.3560795, 3.055438, 0, 0.4431373, 1, 1,
0.2541897, -0.2233036, 3.027516, 0, 0.4352941, 1, 1,
0.2543709, 0.02778176, 2.337133, 0, 0.4313726, 1, 1,
0.263256, -0.9228156, 2.93228, 0, 0.4235294, 1, 1,
0.2663122, -0.6070861, 3.863974, 0, 0.4196078, 1, 1,
0.268465, 1.266003, 2.1792, 0, 0.4117647, 1, 1,
0.2685667, 2.511419, -1.331717, 0, 0.4078431, 1, 1,
0.2696218, 0.5411959, 0.005605806, 0, 0.4, 1, 1,
0.2731178, 0.4058182, 0.6828239, 0, 0.3921569, 1, 1,
0.2757413, -0.3269249, 0.9746376, 0, 0.3882353, 1, 1,
0.2777838, 1.559025, -0.8687586, 0, 0.3803922, 1, 1,
0.2893128, -0.5528295, 2.159572, 0, 0.3764706, 1, 1,
0.2893671, -0.8579996, 1.514548, 0, 0.3686275, 1, 1,
0.2899086, 1.691923, 1.371418, 0, 0.3647059, 1, 1,
0.2922439, 0.109004, 1.246612, 0, 0.3568628, 1, 1,
0.2925965, 1.478032, -0.5350177, 0, 0.3529412, 1, 1,
0.2975612, 0.007715088, 0.2672101, 0, 0.345098, 1, 1,
0.299486, -1.518147, 3.462245, 0, 0.3411765, 1, 1,
0.3047651, -0.8258004, 1.905328, 0, 0.3333333, 1, 1,
0.3055929, -0.2207107, 0.8066468, 0, 0.3294118, 1, 1,
0.3060474, -1.166338, 4.274998, 0, 0.3215686, 1, 1,
0.3080762, 1.843303, -0.5996145, 0, 0.3176471, 1, 1,
0.3095511, -0.1677993, 2.22179, 0, 0.3098039, 1, 1,
0.3100543, 0.08413221, 3.302042, 0, 0.3058824, 1, 1,
0.3181913, 0.375677, -0.9316574, 0, 0.2980392, 1, 1,
0.3242292, 0.5171409, 1.291232, 0, 0.2901961, 1, 1,
0.3256606, 0.4646097, 0.2853599, 0, 0.2862745, 1, 1,
0.333222, -1.323493, 1.933269, 0, 0.2784314, 1, 1,
0.3337252, -0.930843, 3.584158, 0, 0.2745098, 1, 1,
0.3357311, 0.2739048, 2.109215, 0, 0.2666667, 1, 1,
0.3392372, -0.09371772, 2.354589, 0, 0.2627451, 1, 1,
0.3420879, -2.753295, 3.675426, 0, 0.254902, 1, 1,
0.3429532, 1.490506, -0.9338843, 0, 0.2509804, 1, 1,
0.3430222, -0.6096553, 2.45801, 0, 0.2431373, 1, 1,
0.3457462, -0.6635188, 3.676505, 0, 0.2392157, 1, 1,
0.3492628, -0.3222035, 2.171515, 0, 0.2313726, 1, 1,
0.3507712, 0.1606051, 0.5779468, 0, 0.227451, 1, 1,
0.3509473, -0.2140476, 2.518795, 0, 0.2196078, 1, 1,
0.35249, -0.07263507, 3.686034, 0, 0.2156863, 1, 1,
0.3563119, -1.559391, 3.959971, 0, 0.2078431, 1, 1,
0.3566161, 0.6406574, 0.3795097, 0, 0.2039216, 1, 1,
0.3573109, -0.6623541, 2.473205, 0, 0.1960784, 1, 1,
0.3581333, -0.5581282, 3.610376, 0, 0.1882353, 1, 1,
0.358234, 0.5949442, 0.7906045, 0, 0.1843137, 1, 1,
0.3617108, 1.161772, 0.9165946, 0, 0.1764706, 1, 1,
0.3625167, -0.02153494, 0.4415293, 0, 0.172549, 1, 1,
0.3693952, 0.371243, 0.6992585, 0, 0.1647059, 1, 1,
0.3694833, -0.01748443, 2.192968, 0, 0.1607843, 1, 1,
0.3703498, 0.7085673, 1.195036, 0, 0.1529412, 1, 1,
0.3721869, 1.839203, -0.05472492, 0, 0.1490196, 1, 1,
0.3740417, -0.01945064, 2.398648, 0, 0.1411765, 1, 1,
0.376823, 1.976585, -0.06051856, 0, 0.1372549, 1, 1,
0.3773413, -0.9999163, 3.137737, 0, 0.1294118, 1, 1,
0.3811135, 0.9498159, -0.06391672, 0, 0.1254902, 1, 1,
0.3839483, 0.6795187, -1.089084, 0, 0.1176471, 1, 1,
0.3864078, -0.4467479, 2.22431, 0, 0.1137255, 1, 1,
0.3896705, -0.3706847, 2.010365, 0, 0.1058824, 1, 1,
0.3897218, -0.8381642, 2.649071, 0, 0.09803922, 1, 1,
0.3911038, -0.8364195, 3.528035, 0, 0.09411765, 1, 1,
0.3917166, -1.806289, 2.102243, 0, 0.08627451, 1, 1,
0.392454, 0.4753889, 0.2410704, 0, 0.08235294, 1, 1,
0.3938809, 0.7304779, 0.6031947, 0, 0.07450981, 1, 1,
0.3941649, 0.7240152, 0.5983381, 0, 0.07058824, 1, 1,
0.3953131, -0.971839, 4.363377, 0, 0.0627451, 1, 1,
0.3954933, -0.3241034, 2.529334, 0, 0.05882353, 1, 1,
0.3956546, -0.9584336, 1.141858, 0, 0.05098039, 1, 1,
0.3980825, 1.868388, 2.925808, 0, 0.04705882, 1, 1,
0.4011307, 0.2389037, 1.16947, 0, 0.03921569, 1, 1,
0.4143047, 0.1739602, 1.145731, 0, 0.03529412, 1, 1,
0.4150182, 0.7734913, 1.632971, 0, 0.02745098, 1, 1,
0.417293, -0.5803571, 1.434888, 0, 0.02352941, 1, 1,
0.4204119, 0.123668, 1.741565, 0, 0.01568628, 1, 1,
0.4217752, 0.02169677, 2.139879, 0, 0.01176471, 1, 1,
0.4259624, 0.1216534, 1.016557, 0, 0.003921569, 1, 1,
0.4262671, 0.5236326, 0.9757657, 0.003921569, 0, 1, 1,
0.4340114, 0.5000537, 1.365926, 0.007843138, 0, 1, 1,
0.4361812, 0.8907331, 0.3910016, 0.01568628, 0, 1, 1,
0.4389733, -1.274091, 1.060771, 0.01960784, 0, 1, 1,
0.442445, -0.5592535, 3.331949, 0.02745098, 0, 1, 1,
0.443881, -1.177709, 3.520765, 0.03137255, 0, 1, 1,
0.44606, -1.740423, 3.84911, 0.03921569, 0, 1, 1,
0.4481237, 1.182297, 0.7341917, 0.04313726, 0, 1, 1,
0.4496174, 1.346108, 0.1217507, 0.05098039, 0, 1, 1,
0.4516408, -1.564754, 1.078478, 0.05490196, 0, 1, 1,
0.4518418, 0.3794542, 0.8759574, 0.0627451, 0, 1, 1,
0.4518434, -1.349346, 2.662489, 0.06666667, 0, 1, 1,
0.4529324, 0.1369776, 2.958878, 0.07450981, 0, 1, 1,
0.464117, -0.2889968, 1.277347, 0.07843138, 0, 1, 1,
0.4662639, 0.04838518, 0.5670559, 0.08627451, 0, 1, 1,
0.4674839, -1.41454, 1.549489, 0.09019608, 0, 1, 1,
0.4687386, 0.3298351, 2.138891, 0.09803922, 0, 1, 1,
0.4696662, -0.8421609, 1.817087, 0.1058824, 0, 1, 1,
0.4701699, 0.9020328, 0.07282165, 0.1098039, 0, 1, 1,
0.4724933, -1.011806, 1.717209, 0.1176471, 0, 1, 1,
0.4726977, 2.015163, 0.6960126, 0.1215686, 0, 1, 1,
0.473, 0.1908199, 0.9296666, 0.1294118, 0, 1, 1,
0.4737288, 0.3100385, 1.20804, 0.1333333, 0, 1, 1,
0.4825156, 0.0208433, 0.9609703, 0.1411765, 0, 1, 1,
0.4854881, 0.2046523, 0.3861231, 0.145098, 0, 1, 1,
0.4859627, -0.2516001, 1.845693, 0.1529412, 0, 1, 1,
0.4908577, -0.6607784, 3.365262, 0.1568628, 0, 1, 1,
0.4956177, -0.7398346, 3.050218, 0.1647059, 0, 1, 1,
0.4968325, 0.473631, -0.8131708, 0.1686275, 0, 1, 1,
0.5040872, -0.06160545, 2.565058, 0.1764706, 0, 1, 1,
0.504594, 0.7915571, 0.5717062, 0.1803922, 0, 1, 1,
0.505153, 2.270539, -1.022752, 0.1882353, 0, 1, 1,
0.5055643, -0.9092187, 2.06798, 0.1921569, 0, 1, 1,
0.514899, 1.070927, -0.05374371, 0.2, 0, 1, 1,
0.5189443, 0.2888592, 0.05857213, 0.2078431, 0, 1, 1,
0.5205254, -0.4341899, 0.03721526, 0.2117647, 0, 1, 1,
0.5206516, -1.85345, 1.104598, 0.2196078, 0, 1, 1,
0.526488, 1.311517, 0.2563066, 0.2235294, 0, 1, 1,
0.532073, 0.1091319, 2.024858, 0.2313726, 0, 1, 1,
0.5348625, 0.8321711, 1.873399, 0.2352941, 0, 1, 1,
0.5377489, 1.188969, 1.035933, 0.2431373, 0, 1, 1,
0.5412865, -0.3493819, 3.187505, 0.2470588, 0, 1, 1,
0.5423087, -0.0637097, 0.9137911, 0.254902, 0, 1, 1,
0.5446268, 0.2034362, 1.202418, 0.2588235, 0, 1, 1,
0.5569175, 0.4098749, 1.353137, 0.2666667, 0, 1, 1,
0.5569329, -1.019894, 2.513039, 0.2705882, 0, 1, 1,
0.5590271, -1.194214, 1.449946, 0.2784314, 0, 1, 1,
0.5607832, -1.658613, 1.334738, 0.282353, 0, 1, 1,
0.5650584, 0.2908404, 0.5156572, 0.2901961, 0, 1, 1,
0.5719594, 1.165664, 0.6923392, 0.2941177, 0, 1, 1,
0.5731148, -1.592832, 2.857392, 0.3019608, 0, 1, 1,
0.5731941, -0.2856435, 1.850033, 0.3098039, 0, 1, 1,
0.5742798, -2.227313, 1.737922, 0.3137255, 0, 1, 1,
0.5753881, -1.029945, 1.860182, 0.3215686, 0, 1, 1,
0.5771077, 0.3255013, 0.6478848, 0.3254902, 0, 1, 1,
0.5812837, -0.7543316, 2.262261, 0.3333333, 0, 1, 1,
0.5820326, -1.278378, 1.607363, 0.3372549, 0, 1, 1,
0.5844389, -1.946082, 2.037877, 0.345098, 0, 1, 1,
0.5922793, 0.269696, 1.313148, 0.3490196, 0, 1, 1,
0.5939889, -1.508051, 2.200446, 0.3568628, 0, 1, 1,
0.5988724, -0.3480914, 1.669439, 0.3607843, 0, 1, 1,
0.6026711, 0.5217205, 0.8996399, 0.3686275, 0, 1, 1,
0.604678, 1.269247, 0.4511475, 0.372549, 0, 1, 1,
0.608358, 0.6295826, -0.2455274, 0.3803922, 0, 1, 1,
0.60877, -1.779408, 3.247923, 0.3843137, 0, 1, 1,
0.6160873, -2.598986, 4.492902, 0.3921569, 0, 1, 1,
0.6171505, -1.237704, 3.392899, 0.3960784, 0, 1, 1,
0.6256043, -0.9353663, 1.813869, 0.4039216, 0, 1, 1,
0.6318285, -0.5213343, 1.322099, 0.4117647, 0, 1, 1,
0.6328815, -0.5917325, 1.940673, 0.4156863, 0, 1, 1,
0.6339722, -1.140588, 1.840326, 0.4235294, 0, 1, 1,
0.6394643, -0.6292831, 2.725815, 0.427451, 0, 1, 1,
0.639479, -0.5851441, 1.207169, 0.4352941, 0, 1, 1,
0.642785, -1.694076, 2.412665, 0.4392157, 0, 1, 1,
0.6490111, -0.9232385, 1.432819, 0.4470588, 0, 1, 1,
0.6520718, -2.8627, 2.137432, 0.4509804, 0, 1, 1,
0.6556965, -1.484574, 2.649357, 0.4588235, 0, 1, 1,
0.6571177, 1.692061, -0.3336757, 0.4627451, 0, 1, 1,
0.6576152, 0.5938615, -0.1022318, 0.4705882, 0, 1, 1,
0.6583562, 0.5046604, -0.5818788, 0.4745098, 0, 1, 1,
0.6657433, -1.100334, 2.419961, 0.4823529, 0, 1, 1,
0.6660037, -0.7685639, 1.886952, 0.4862745, 0, 1, 1,
0.6674977, -0.8647183, 3.77828, 0.4941176, 0, 1, 1,
0.6706789, 1.673332, -0.5894613, 0.5019608, 0, 1, 1,
0.6711316, -0.3588922, 1.968749, 0.5058824, 0, 1, 1,
0.6712701, -1.445314, 2.864139, 0.5137255, 0, 1, 1,
0.671935, -1.844658, 2.303334, 0.5176471, 0, 1, 1,
0.675213, 1.352092, -0.9607149, 0.5254902, 0, 1, 1,
0.6852402, -1.069105, 2.716801, 0.5294118, 0, 1, 1,
0.6869217, 0.3823256, 0.5957402, 0.5372549, 0, 1, 1,
0.688617, -1.318534, 1.69711, 0.5411765, 0, 1, 1,
0.6931937, 0.7701819, 1.650122, 0.5490196, 0, 1, 1,
0.7019159, 0.9406399, 0.2336429, 0.5529412, 0, 1, 1,
0.7019234, -0.03251624, 1.065014, 0.5607843, 0, 1, 1,
0.7019355, -1.179861, 0.779109, 0.5647059, 0, 1, 1,
0.7050655, 0.1731944, 0.4980132, 0.572549, 0, 1, 1,
0.7052019, 1.432055, 2.786988, 0.5764706, 0, 1, 1,
0.7161975, 0.547581, 1.991842, 0.5843138, 0, 1, 1,
0.7225521, 0.3435786, 1.607894, 0.5882353, 0, 1, 1,
0.7269716, -1.030136, 2.726322, 0.5960785, 0, 1, 1,
0.7308663, 0.4029295, -0.005734359, 0.6039216, 0, 1, 1,
0.7336764, 0.9100865, 0.5087447, 0.6078432, 0, 1, 1,
0.7380864, 0.7619867, 1.501819, 0.6156863, 0, 1, 1,
0.7390606, 0.3740964, -0.2488527, 0.6196079, 0, 1, 1,
0.7460735, 0.03741455, 2.144845, 0.627451, 0, 1, 1,
0.7483224, 0.5493784, -1.52168, 0.6313726, 0, 1, 1,
0.7502931, -1.315152, 3.645511, 0.6392157, 0, 1, 1,
0.7522014, -0.6845962, 3.733152, 0.6431373, 0, 1, 1,
0.7543646, 0.5437574, 0.4979602, 0.6509804, 0, 1, 1,
0.7558015, -1.609918, 3.360245, 0.654902, 0, 1, 1,
0.765117, 0.4506095, 0.5465561, 0.6627451, 0, 1, 1,
0.7699088, -1.164967, 2.843658, 0.6666667, 0, 1, 1,
0.7817836, -0.01238372, 1.120705, 0.6745098, 0, 1, 1,
0.7824368, 0.06039181, 1.580482, 0.6784314, 0, 1, 1,
0.7840618, 2.263753, -0.919472, 0.6862745, 0, 1, 1,
0.7848077, 1.178656, -1.138643, 0.6901961, 0, 1, 1,
0.7898786, -0.3237719, 2.428356, 0.6980392, 0, 1, 1,
0.7955703, -0.5122119, 0.7408696, 0.7058824, 0, 1, 1,
0.7982455, -0.8395133, 1.982186, 0.7098039, 0, 1, 1,
0.8002995, 0.5508177, -0.7556564, 0.7176471, 0, 1, 1,
0.8022686, -2.313562, 3.632578, 0.7215686, 0, 1, 1,
0.8029698, 0.03558107, 2.936203, 0.7294118, 0, 1, 1,
0.8043565, -1.546251, 3.994142, 0.7333333, 0, 1, 1,
0.8087896, -0.7151793, 2.201375, 0.7411765, 0, 1, 1,
0.8090646, -0.7719798, 3.36541, 0.7450981, 0, 1, 1,
0.8147184, 0.4228428, 0.201066, 0.7529412, 0, 1, 1,
0.8149123, 0.5698904, -0.7052531, 0.7568628, 0, 1, 1,
0.8170223, -1.383066, 2.386468, 0.7647059, 0, 1, 1,
0.8198292, 0.2194347, 0.712472, 0.7686275, 0, 1, 1,
0.8229259, 1.031371, 0.9036567, 0.7764706, 0, 1, 1,
0.8285522, -0.8815361, 2.764535, 0.7803922, 0, 1, 1,
0.8318809, 1.167145, 0.1530902, 0.7882353, 0, 1, 1,
0.839806, -0.9429843, 4.530134, 0.7921569, 0, 1, 1,
0.8407096, 0.5461512, 1.295556, 0.8, 0, 1, 1,
0.8490133, -1.20699, 0.3105286, 0.8078431, 0, 1, 1,
0.851012, 1.438192, 0.8833956, 0.8117647, 0, 1, 1,
0.8617227, -0.1307977, 0.6108556, 0.8196079, 0, 1, 1,
0.8654597, 0.6885641, -0.06664848, 0.8235294, 0, 1, 1,
0.8669862, -1.785867, 2.020452, 0.8313726, 0, 1, 1,
0.870182, 1.652773, -0.4619529, 0.8352941, 0, 1, 1,
0.8763741, 0.1457419, 2.198803, 0.8431373, 0, 1, 1,
0.8766466, 0.001627396, 0.02963359, 0.8470588, 0, 1, 1,
0.8824366, -1.118311, 1.931198, 0.854902, 0, 1, 1,
0.8911518, 0.7926229, 1.960869, 0.8588235, 0, 1, 1,
0.8928373, -0.06588297, 0.9827901, 0.8666667, 0, 1, 1,
0.894619, -2.827026, 3.009972, 0.8705882, 0, 1, 1,
0.8959957, -0.6156305, 1.113885, 0.8784314, 0, 1, 1,
0.896284, 1.044907, 1.495642, 0.8823529, 0, 1, 1,
0.9022421, -0.5697918, 0.8962821, 0.8901961, 0, 1, 1,
0.9038637, 0.4223919, 0.7518337, 0.8941177, 0, 1, 1,
0.9117194, 0.3127694, -0.4941913, 0.9019608, 0, 1, 1,
0.9156213, -1.400506, 2.327966, 0.9098039, 0, 1, 1,
0.9214265, 0.4289391, 1.514601, 0.9137255, 0, 1, 1,
0.9243024, 2.071417, -0.1092695, 0.9215686, 0, 1, 1,
0.924378, 0.04925407, -0.2029387, 0.9254902, 0, 1, 1,
0.9248209, 0.4780397, 1.666031, 0.9333333, 0, 1, 1,
0.925694, 0.3490843, 3.482308, 0.9372549, 0, 1, 1,
0.9261248, 1.734695, -0.2477837, 0.945098, 0, 1, 1,
0.9309682, -1.376274, 0.6071922, 0.9490196, 0, 1, 1,
0.9343849, -0.7331087, 3.047814, 0.9568627, 0, 1, 1,
0.9377134, -0.6783163, 1.045306, 0.9607843, 0, 1, 1,
0.9422614, 0.7510234, 2.385389, 0.9686275, 0, 1, 1,
0.9463712, 1.348337, 1.47254, 0.972549, 0, 1, 1,
0.9469339, -0.1028031, 1.517443, 0.9803922, 0, 1, 1,
0.9515307, 0.793012, 0.1041035, 0.9843137, 0, 1, 1,
0.9526115, 2.177464, 0.9080849, 0.9921569, 0, 1, 1,
0.9573252, 1.925102, 2.157871, 0.9960784, 0, 1, 1,
0.9599459, -1.199838, 3.086289, 1, 0, 0.9960784, 1,
0.9648262, 0.131178, 2.387635, 1, 0, 0.9882353, 1,
0.9799299, 0.04521529, 1.297379, 1, 0, 0.9843137, 1,
0.9844505, -0.2656438, 1.941033, 1, 0, 0.9764706, 1,
0.9905041, 0.6916895, 0.6853427, 1, 0, 0.972549, 1,
0.9949566, 0.7084658, 1.116829, 1, 0, 0.9647059, 1,
0.9962111, 1.763425, 1.854393, 1, 0, 0.9607843, 1,
0.9978678, -0.7893953, 2.056576, 1, 0, 0.9529412, 1,
1.001471, -0.6374217, 2.422068, 1, 0, 0.9490196, 1,
1.003001, -0.4697221, 3.759985, 1, 0, 0.9411765, 1,
1.006933, 0.4344567, 1.032372, 1, 0, 0.9372549, 1,
1.021113, -1.175052, 3.218998, 1, 0, 0.9294118, 1,
1.023816, 0.3338961, 0.5804723, 1, 0, 0.9254902, 1,
1.024334, 0.7401651, 1.059638, 1, 0, 0.9176471, 1,
1.024437, 0.7763829, 1.017997, 1, 0, 0.9137255, 1,
1.029186, 0.3780466, 1.044487, 1, 0, 0.9058824, 1,
1.031235, -1.313651, 2.653809, 1, 0, 0.9019608, 1,
1.040188, 0.5869393, 2.062813, 1, 0, 0.8941177, 1,
1.040887, 0.8185221, 1.372444, 1, 0, 0.8862745, 1,
1.041582, 0.9969465, 1.027614, 1, 0, 0.8823529, 1,
1.044071, 1.178676, -0.6578841, 1, 0, 0.8745098, 1,
1.044383, -0.1941411, 1.553972, 1, 0, 0.8705882, 1,
1.049224, -0.8929643, 2.679412, 1, 0, 0.8627451, 1,
1.063552, -2.054884, 3.865717, 1, 0, 0.8588235, 1,
1.06573, 0.002292516, 3.638595, 1, 0, 0.8509804, 1,
1.065797, -0.3427768, -0.4009492, 1, 0, 0.8470588, 1,
1.06823, 2.431351, 2.429286, 1, 0, 0.8392157, 1,
1.069528, -1.886672, 3.689692, 1, 0, 0.8352941, 1,
1.070261, 0.8797269, 0.1416313, 1, 0, 0.827451, 1,
1.073998, 0.904524, 0.8664066, 1, 0, 0.8235294, 1,
1.079737, -1.382207, 2.107505, 1, 0, 0.8156863, 1,
1.083312, -0.7941909, 0.3828222, 1, 0, 0.8117647, 1,
1.09041, 3.112316, -0.0593527, 1, 0, 0.8039216, 1,
1.093552, 0.9943355, 1.401588, 1, 0, 0.7960784, 1,
1.097852, -0.3613093, 2.413164, 1, 0, 0.7921569, 1,
1.10264, -0.195898, 0.8103092, 1, 0, 0.7843137, 1,
1.104162, 1.57409, -0.1641187, 1, 0, 0.7803922, 1,
1.110624, 0.17338, 1.959626, 1, 0, 0.772549, 1,
1.116334, -1.357993, 3.360123, 1, 0, 0.7686275, 1,
1.125154, -1.829957, 1.382757, 1, 0, 0.7607843, 1,
1.132609, 0.6846727, 0.3502069, 1, 0, 0.7568628, 1,
1.133617, 0.6667716, 0.5929437, 1, 0, 0.7490196, 1,
1.136322, -1.184973, 3.264668, 1, 0, 0.7450981, 1,
1.141971, 1.810457, 2.777536, 1, 0, 0.7372549, 1,
1.143492, -0.8012054, 2.549918, 1, 0, 0.7333333, 1,
1.144483, 0.2788057, 1.879076, 1, 0, 0.7254902, 1,
1.148785, -2.249312, 2.72835, 1, 0, 0.7215686, 1,
1.157058, -0.7198241, 1.332157, 1, 0, 0.7137255, 1,
1.158449, -0.7695754, 3.099754, 1, 0, 0.7098039, 1,
1.158973, 0.281256, 3.449395, 1, 0, 0.7019608, 1,
1.177085, -0.7831517, 0.8500545, 1, 0, 0.6941177, 1,
1.181999, 0.863396, 2.663156, 1, 0, 0.6901961, 1,
1.196061, 0.7355838, 1.555633, 1, 0, 0.682353, 1,
1.201565, -1.416055, 1.307496, 1, 0, 0.6784314, 1,
1.203973, 0.9094799, 0.06743976, 1, 0, 0.6705883, 1,
1.208866, 0.3846667, 1.64263, 1, 0, 0.6666667, 1,
1.214173, 0.8934423, -0.7686976, 1, 0, 0.6588235, 1,
1.217117, 0.3447643, -0.1383197, 1, 0, 0.654902, 1,
1.218864, -0.07500064, 2.347768, 1, 0, 0.6470588, 1,
1.221081, 1.751016, -0.5947933, 1, 0, 0.6431373, 1,
1.221431, -0.1298218, 3.982381, 1, 0, 0.6352941, 1,
1.2229, -0.2019395, 0.9844505, 1, 0, 0.6313726, 1,
1.244863, -0.01947381, 0.5148869, 1, 0, 0.6235294, 1,
1.248387, -0.3251156, 2.797693, 1, 0, 0.6196079, 1,
1.249508, -0.08179751, 0.7304198, 1, 0, 0.6117647, 1,
1.25364, -0.76546, 2.709652, 1, 0, 0.6078432, 1,
1.257194, -0.7120275, 2.018082, 1, 0, 0.6, 1,
1.262748, 0.2160872, 1.956928, 1, 0, 0.5921569, 1,
1.280773, -1.431169, 3.969128, 1, 0, 0.5882353, 1,
1.295303, 0.8608911, 0.7366263, 1, 0, 0.5803922, 1,
1.302036, -0.8107958, 2.024509, 1, 0, 0.5764706, 1,
1.314696, 0.5569476, 1.000125, 1, 0, 0.5686275, 1,
1.319064, -0.2081514, 1.69625, 1, 0, 0.5647059, 1,
1.326715, 0.06506284, 2.209214, 1, 0, 0.5568628, 1,
1.327571, 1.470728, -0.3662773, 1, 0, 0.5529412, 1,
1.338211, -0.001513983, 2.013147, 1, 0, 0.5450981, 1,
1.338215, 1.437873, 1.535629, 1, 0, 0.5411765, 1,
1.344148, -0.1308358, 3.007897, 1, 0, 0.5333334, 1,
1.361509, -1.471968, 3.083427, 1, 0, 0.5294118, 1,
1.365845, -0.1645808, 2.340821, 1, 0, 0.5215687, 1,
1.368336, -1.474514, 3.24929, 1, 0, 0.5176471, 1,
1.369966, 2.179757, 0.4812266, 1, 0, 0.509804, 1,
1.386718, -0.2520704, 3.931359, 1, 0, 0.5058824, 1,
1.406347, -1.127377, 2.251399, 1, 0, 0.4980392, 1,
1.418587, 0.2874558, -0.4864744, 1, 0, 0.4901961, 1,
1.426071, 0.05494634, 1.775585, 1, 0, 0.4862745, 1,
1.426324, -0.9231349, 2.014923, 1, 0, 0.4784314, 1,
1.428876, -0.3525821, 1.81818, 1, 0, 0.4745098, 1,
1.434033, 0.7539634, 1.816611, 1, 0, 0.4666667, 1,
1.436665, 1.045128, 1.26515, 1, 0, 0.4627451, 1,
1.439646, -0.6488789, 1.391246, 1, 0, 0.454902, 1,
1.451455, -0.3412633, 2.518378, 1, 0, 0.4509804, 1,
1.460325, 1.539071, 0.4408733, 1, 0, 0.4431373, 1,
1.461378, 1.795569, 1.892919, 1, 0, 0.4392157, 1,
1.468848, 1.141675, 2.440787, 1, 0, 0.4313726, 1,
1.468854, -0.3499713, 2.801495, 1, 0, 0.427451, 1,
1.469784, -0.1894035, 1.454726, 1, 0, 0.4196078, 1,
1.481162, -0.8134168, 1.700453, 1, 0, 0.4156863, 1,
1.492535, 0.3498485, 3.08058, 1, 0, 0.4078431, 1,
1.499397, -1.161624, 2.15025, 1, 0, 0.4039216, 1,
1.505252, -0.2200345, 3.904577, 1, 0, 0.3960784, 1,
1.508479, 0.00767968, 2.280066, 1, 0, 0.3882353, 1,
1.511718, -1.533664, 4.092382, 1, 0, 0.3843137, 1,
1.515182, -0.1069353, 1.426305, 1, 0, 0.3764706, 1,
1.516571, -0.6627398, 2.319445, 1, 0, 0.372549, 1,
1.52537, 0.7782592, 2.216307, 1, 0, 0.3647059, 1,
1.525871, 1.737585, 1.557111, 1, 0, 0.3607843, 1,
1.528185, 0.4357, 1.197958, 1, 0, 0.3529412, 1,
1.536835, -1.608671, 2.068804, 1, 0, 0.3490196, 1,
1.538519, 0.949492, 0.01881272, 1, 0, 0.3411765, 1,
1.540159, 1.217726, 3.74104, 1, 0, 0.3372549, 1,
1.545852, -0.8961493, 2.038881, 1, 0, 0.3294118, 1,
1.561872, -1.30884, 2.313884, 1, 0, 0.3254902, 1,
1.576602, -0.7447442, 1.102406, 1, 0, 0.3176471, 1,
1.589943, -2.037564, 1.904202, 1, 0, 0.3137255, 1,
1.597392, 0.8158038, 1.610369, 1, 0, 0.3058824, 1,
1.600158, 0.6925984, 1.829111, 1, 0, 0.2980392, 1,
1.602233, -0.0432347, 2.78503, 1, 0, 0.2941177, 1,
1.614795, -0.6809277, 0.616648, 1, 0, 0.2862745, 1,
1.637627, 0.2772763, 1.256672, 1, 0, 0.282353, 1,
1.656501, -1.046823, 0.581541, 1, 0, 0.2745098, 1,
1.667202, 0.1804974, 0.7427447, 1, 0, 0.2705882, 1,
1.680698, -0.6613119, 1.487693, 1, 0, 0.2627451, 1,
1.686034, -0.3539135, 2.564535, 1, 0, 0.2588235, 1,
1.689611, -0.4226646, 0.2993374, 1, 0, 0.2509804, 1,
1.691603, -0.5472546, 1.149447, 1, 0, 0.2470588, 1,
1.705592, -0.1522775, 2.031238, 1, 0, 0.2392157, 1,
1.719828, -0.7835094, 1.83689, 1, 0, 0.2352941, 1,
1.731208, -0.1127717, 0.2057893, 1, 0, 0.227451, 1,
1.740047, 1.952795, -0.5644085, 1, 0, 0.2235294, 1,
1.741244, 1.593948, -1.15232, 1, 0, 0.2156863, 1,
1.741446, 1.087039, 0.2710479, 1, 0, 0.2117647, 1,
1.750187, 1.805057, -0.2653772, 1, 0, 0.2039216, 1,
1.763882, 0.2452154, 2.037069, 1, 0, 0.1960784, 1,
1.790239, 0.03692697, 0.7344162, 1, 0, 0.1921569, 1,
1.807751, 1.752526, 0.9671833, 1, 0, 0.1843137, 1,
1.809062, 0.109029, 2.517164, 1, 0, 0.1803922, 1,
1.819079, -0.751015, 3.940395, 1, 0, 0.172549, 1,
1.880605, 1.121404, 0.4466258, 1, 0, 0.1686275, 1,
1.904741, -1.074718, 2.075598, 1, 0, 0.1607843, 1,
1.951989, 0.4155402, 1.176849, 1, 0, 0.1568628, 1,
1.954787, 0.7770765, 2.650863, 1, 0, 0.1490196, 1,
2.002521, -1.551328, 1.705255, 1, 0, 0.145098, 1,
2.006491, -0.4752598, 2.142437, 1, 0, 0.1372549, 1,
2.033578, 0.1269322, 2.679269, 1, 0, 0.1333333, 1,
2.036156, -0.815, 1.341818, 1, 0, 0.1254902, 1,
2.038273, -0.3223296, 0.2335813, 1, 0, 0.1215686, 1,
2.064614, 0.0179809, 0.9375651, 1, 0, 0.1137255, 1,
2.076213, 0.5646755, 2.762256, 1, 0, 0.1098039, 1,
2.098452, -1.543779, 1.574657, 1, 0, 0.1019608, 1,
2.118531, 1.511837, 1.420394, 1, 0, 0.09411765, 1,
2.168484, 1.925674, 1.727534, 1, 0, 0.09019608, 1,
2.212923, 0.001438467, 0.8528115, 1, 0, 0.08235294, 1,
2.21735, -1.356325, 3.074915, 1, 0, 0.07843138, 1,
2.247953, 1.164328, 2.894041, 1, 0, 0.07058824, 1,
2.255908, 1.292742, -0.304286, 1, 0, 0.06666667, 1,
2.286013, -0.1485853, 0.6795125, 1, 0, 0.05882353, 1,
2.336926, 0.7375248, 1.650569, 1, 0, 0.05490196, 1,
2.468162, -1.054129, 1.039869, 1, 0, 0.04705882, 1,
2.468603, -0.2364542, 0.9089749, 1, 0, 0.04313726, 1,
2.561547, -0.05704466, 2.372155, 1, 0, 0.03529412, 1,
2.581357, -0.02048677, 1.013139, 1, 0, 0.03137255, 1,
2.656592, -2.028028, 1.403065, 1, 0, 0.02352941, 1,
2.723481, 0.5397725, 0.8235848, 1, 0, 0.01960784, 1,
2.924342, 0.8730122, 1.564138, 1, 0, 0.01176471, 1,
2.947906, 0.7618436, 1.204657, 1, 0, 0.007843138, 1
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
-0.4016944, -4.013871, -7.527782, 0, -0.5, 0.5, 0.5,
-0.4016944, -4.013871, -7.527782, 1, -0.5, 0.5, 0.5,
-0.4016944, -4.013871, -7.527782, 1, 1.5, 0.5, 0.5,
-0.4016944, -4.013871, -7.527782, 0, 1.5, 0.5, 0.5
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
-4.886809, 0.06563461, -7.527782, 0, -0.5, 0.5, 0.5,
-4.886809, 0.06563461, -7.527782, 1, -0.5, 0.5, 0.5,
-4.886809, 0.06563461, -7.527782, 1, 1.5, 0.5, 0.5,
-4.886809, 0.06563461, -7.527782, 0, 1.5, 0.5, 0.5
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
-4.886809, -4.013871, -0.1501734, 0, -0.5, 0.5, 0.5,
-4.886809, -4.013871, -0.1501734, 1, -0.5, 0.5, 0.5,
-4.886809, -4.013871, -0.1501734, 1, 1.5, 0.5, 0.5,
-4.886809, -4.013871, -0.1501734, 0, 1.5, 0.5, 0.5
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
-3, -3.072447, -5.825257,
2, -3.072447, -5.825257,
-3, -3.072447, -5.825257,
-3, -3.229351, -6.109011,
-2, -3.072447, -5.825257,
-2, -3.229351, -6.109011,
-1, -3.072447, -5.825257,
-1, -3.229351, -6.109011,
0, -3.072447, -5.825257,
0, -3.229351, -6.109011,
1, -3.072447, -5.825257,
1, -3.229351, -6.109011,
2, -3.072447, -5.825257,
2, -3.229351, -6.109011
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
-3, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
-3, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
-3, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
-3, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5,
-2, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
-2, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
-2, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
-2, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5,
-1, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
-1, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
-1, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
-1, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5,
0, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
0, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
0, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
0, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5,
1, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
1, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
1, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
1, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5,
2, -3.543159, -6.676519, 0, -0.5, 0.5, 0.5,
2, -3.543159, -6.676519, 1, -0.5, 0.5, 0.5,
2, -3.543159, -6.676519, 1, 1.5, 0.5, 0.5,
2, -3.543159, -6.676519, 0, 1.5, 0.5, 0.5
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
-3.851783, -2, -5.825257,
-3.851783, 3, -5.825257,
-3.851783, -2, -5.825257,
-4.024287, -2, -6.109011,
-3.851783, -1, -5.825257,
-4.024287, -1, -6.109011,
-3.851783, 0, -5.825257,
-4.024287, 0, -6.109011,
-3.851783, 1, -5.825257,
-4.024287, 1, -6.109011,
-3.851783, 2, -5.825257,
-4.024287, 2, -6.109011,
-3.851783, 3, -5.825257,
-4.024287, 3, -6.109011
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
-4.369296, -2, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, -2, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, -2, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, -2, -6.676519, 0, 1.5, 0.5, 0.5,
-4.369296, -1, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, -1, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, -1, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, -1, -6.676519, 0, 1.5, 0.5, 0.5,
-4.369296, 0, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, 0, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, 0, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, 0, -6.676519, 0, 1.5, 0.5, 0.5,
-4.369296, 1, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, 1, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, 1, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, 1, -6.676519, 0, 1.5, 0.5, 0.5,
-4.369296, 2, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, 2, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, 2, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, 2, -6.676519, 0, 1.5, 0.5, 0.5,
-4.369296, 3, -6.676519, 0, -0.5, 0.5, 0.5,
-4.369296, 3, -6.676519, 1, -0.5, 0.5, 0.5,
-4.369296, 3, -6.676519, 1, 1.5, 0.5, 0.5,
-4.369296, 3, -6.676519, 0, 1.5, 0.5, 0.5
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
-3.851783, -3.072447, -4,
-3.851783, -3.072447, 4,
-3.851783, -3.072447, -4,
-4.024287, -3.229351, -4,
-3.851783, -3.072447, -2,
-4.024287, -3.229351, -2,
-3.851783, -3.072447, 0,
-4.024287, -3.229351, 0,
-3.851783, -3.072447, 2,
-4.024287, -3.229351, 2,
-3.851783, -3.072447, 4,
-4.024287, -3.229351, 4
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
-4.369296, -3.543159, -4, 0, -0.5, 0.5, 0.5,
-4.369296, -3.543159, -4, 1, -0.5, 0.5, 0.5,
-4.369296, -3.543159, -4, 1, 1.5, 0.5, 0.5,
-4.369296, -3.543159, -4, 0, 1.5, 0.5, 0.5,
-4.369296, -3.543159, -2, 0, -0.5, 0.5, 0.5,
-4.369296, -3.543159, -2, 1, -0.5, 0.5, 0.5,
-4.369296, -3.543159, -2, 1, 1.5, 0.5, 0.5,
-4.369296, -3.543159, -2, 0, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 0, 0, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 0, 1, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 0, 1, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 0, 0, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 2, 0, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 2, 1, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 2, 1, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 2, 0, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 4, 0, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 4, 1, -0.5, 0.5, 0.5,
-4.369296, -3.543159, 4, 1, 1.5, 0.5, 0.5,
-4.369296, -3.543159, 4, 0, 1.5, 0.5, 0.5
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
-3.851783, -3.072447, -5.825257,
-3.851783, 3.203716, -5.825257,
-3.851783, -3.072447, 5.52491,
-3.851783, 3.203716, 5.52491,
-3.851783, -3.072447, -5.825257,
-3.851783, -3.072447, 5.52491,
-3.851783, 3.203716, -5.825257,
-3.851783, 3.203716, 5.52491,
-3.851783, -3.072447, -5.825257,
3.048394, -3.072447, -5.825257,
-3.851783, -3.072447, 5.52491,
3.048394, -3.072447, 5.52491,
-3.851783, 3.203716, -5.825257,
3.048394, 3.203716, -5.825257,
-3.851783, 3.203716, 5.52491,
3.048394, 3.203716, 5.52491,
3.048394, -3.072447, -5.825257,
3.048394, 3.203716, -5.825257,
3.048394, -3.072447, 5.52491,
3.048394, 3.203716, 5.52491,
3.048394, -3.072447, -5.825257,
3.048394, -3.072447, 5.52491,
3.048394, 3.203716, -5.825257,
3.048394, 3.203716, 5.52491
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
var radius = 7.844772;
var distance = 34.90228;
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
mvMatrix.translate( 0.4016944, -0.06563461, 0.1501734 );
mvMatrix.scale( 1.229232, 1.35145, 0.7472948 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90228);
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
1-(3-methylphenyl)-5<-read.table("1-(3-methylphenyl)-5.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.751295, 0.2512205, -2.016523, 0, 0, 1, 1, 1,
-3.264979, -0.808276, -2.511343, 1, 0, 0, 1, 1,
-2.989427, -0.3007327, -1.361828, 1, 0, 0, 1, 1,
-2.83782, -0.4016423, -2.941371, 1, 0, 0, 1, 1,
-2.826295, -0.4698606, -2.979381, 1, 0, 0, 1, 1,
-2.740836, -0.1135258, -0.1803523, 1, 0, 0, 1, 1,
-2.738604, 0.7454881, -2.643899, 0, 0, 0, 1, 1,
-2.693957, -1.066672, -2.607165, 0, 0, 0, 1, 1,
-2.67655, -0.3443707, -1.352087, 0, 0, 0, 1, 1,
-2.646464, 1.136494, -1.500832, 0, 0, 0, 1, 1,
-2.53856, -0.3947445, -2.575025, 0, 0, 0, 1, 1,
-2.51812, 1.588264, -1.141357, 0, 0, 0, 1, 1,
-2.477834, 0.1070306, -0.7970622, 0, 0, 0, 1, 1,
-2.457862, 0.5148866, -0.3195708, 1, 1, 1, 1, 1,
-2.371901, 0.8224187, -0.3122518, 1, 1, 1, 1, 1,
-2.286763, 0.4442877, -0.9644624, 1, 1, 1, 1, 1,
-2.25552, -0.5278421, -1.681737, 1, 1, 1, 1, 1,
-2.225187, 0.174259, -1.706816, 1, 1, 1, 1, 1,
-2.196305, -1.634922, -3.394865, 1, 1, 1, 1, 1,
-2.175286, -0.727474, -1.94817, 1, 1, 1, 1, 1,
-2.141987, 1.189702, -1.869931, 1, 1, 1, 1, 1,
-2.134118, -0.429254, -1.63276, 1, 1, 1, 1, 1,
-2.085507, 1.282992, -1.292537, 1, 1, 1, 1, 1,
-2.053993, -0.6049088, -0.807957, 1, 1, 1, 1, 1,
-2.044887, 1.140576, -0.1202576, 1, 1, 1, 1, 1,
-2.02626, -0.4632656, -3.844851, 1, 1, 1, 1, 1,
-2.019855, 1.500686, -1.832256, 1, 1, 1, 1, 1,
-1.991542, -0.4040346, -1.769557, 1, 1, 1, 1, 1,
-1.964226, -0.7590026, -2.632274, 0, 0, 1, 1, 1,
-1.962839, 0.09765783, -1.00044, 1, 0, 0, 1, 1,
-1.962397, -0.6931781, -1.018691, 1, 0, 0, 1, 1,
-1.950214, -0.9997258, -2.233588, 1, 0, 0, 1, 1,
-1.900136, 0.8093194, -0.03617256, 1, 0, 0, 1, 1,
-1.88854, 0.7485143, -1.274234, 1, 0, 0, 1, 1,
-1.874858, -0.8431765, -0.2812398, 0, 0, 0, 1, 1,
-1.839695, 0.3605117, -1.320538, 0, 0, 0, 1, 1,
-1.81772, 1.636369, -0.5086283, 0, 0, 0, 1, 1,
-1.811574, -0.2740747, -2.132868, 0, 0, 0, 1, 1,
-1.796569, -1.375853, -2.403219, 0, 0, 0, 1, 1,
-1.79362, -0.4015424, -1.773575, 0, 0, 0, 1, 1,
-1.783332, -1.106834, -3.534819, 0, 0, 0, 1, 1,
-1.781258, -0.409836, -1.224013, 1, 1, 1, 1, 1,
-1.778627, -0.4859573, -3.027482, 1, 1, 1, 1, 1,
-1.761886, -2.961785, -2.913302, 1, 1, 1, 1, 1,
-1.75732, -0.7069489, -1.414842, 1, 1, 1, 1, 1,
-1.745215, -1.403645, -1.450421, 1, 1, 1, 1, 1,
-1.744173, 0.09150856, -0.6292883, 1, 1, 1, 1, 1,
-1.722498, -0.9006242, -3.853059, 1, 1, 1, 1, 1,
-1.720791, -1.270357, -1.773501, 1, 1, 1, 1, 1,
-1.707441, 0.2485651, -1.093882, 1, 1, 1, 1, 1,
-1.697915, -0.3823219, -1.469212, 1, 1, 1, 1, 1,
-1.68916, 0.2824031, -0.4056786, 1, 1, 1, 1, 1,
-1.681285, 0.4825064, 0.9359881, 1, 1, 1, 1, 1,
-1.670168, -1.123673, -2.95272, 1, 1, 1, 1, 1,
-1.652209, 1.127896, -0.5687224, 1, 1, 1, 1, 1,
-1.641294, -1.943818, -3.615661, 1, 1, 1, 1, 1,
-1.63977, 1.105116, -0.03863031, 0, 0, 1, 1, 1,
-1.620106, 0.2527233, -1.049044, 1, 0, 0, 1, 1,
-1.61646, 0.563859, -1.715569, 1, 0, 0, 1, 1,
-1.60562, -1.249545, -1.91729, 1, 0, 0, 1, 1,
-1.603935, 0.8102409, -1.285282, 1, 0, 0, 1, 1,
-1.594941, 0.8907256, -0.596894, 1, 0, 0, 1, 1,
-1.58233, -0.5618556, -1.120953, 0, 0, 0, 1, 1,
-1.553714, 0.7230634, -1.520262, 0, 0, 0, 1, 1,
-1.539832, -0.2372681, -0.1787415, 0, 0, 0, 1, 1,
-1.520539, -0.8299149, -0.8302881, 0, 0, 0, 1, 1,
-1.51985, -0.5944059, -3.005549, 0, 0, 0, 1, 1,
-1.519247, 0.6742679, -1.957366, 0, 0, 0, 1, 1,
-1.510259, -0.3835445, -2.028083, 0, 0, 0, 1, 1,
-1.486258, -1.582306, -2.227716, 1, 1, 1, 1, 1,
-1.47923, 1.753457, -3.561604, 1, 1, 1, 1, 1,
-1.462823, -0.3208978, -2.144083, 1, 1, 1, 1, 1,
-1.456359, -0.1068304, -1.549239, 1, 1, 1, 1, 1,
-1.447443, 1.241049, 0.5444134, 1, 1, 1, 1, 1,
-1.419778, 0.280241, -0.4583005, 1, 1, 1, 1, 1,
-1.410585, 1.345518, -2.016001, 1, 1, 1, 1, 1,
-1.406809, -0.2247047, -2.005971, 1, 1, 1, 1, 1,
-1.405174, 0.1089813, -2.974771, 1, 1, 1, 1, 1,
-1.399316, -0.3472284, 0.171471, 1, 1, 1, 1, 1,
-1.393307, -0.8771335, -2.665962, 1, 1, 1, 1, 1,
-1.384137, 0.2438435, -2.007192, 1, 1, 1, 1, 1,
-1.38359, -0.6773548, -1.934505, 1, 1, 1, 1, 1,
-1.371917, 0.1586827, -3.272772, 1, 1, 1, 1, 1,
-1.35668, -0.3648578, -1.102848, 1, 1, 1, 1, 1,
-1.348752, 0.03066479, -1.575256, 0, 0, 1, 1, 1,
-1.339209, -1.245094, -1.596902, 1, 0, 0, 1, 1,
-1.332563, 0.2909312, -1.250041, 1, 0, 0, 1, 1,
-1.331512, -0.3754827, -1.55245, 1, 0, 0, 1, 1,
-1.328876, -0.9704866, -1.42568, 1, 0, 0, 1, 1,
-1.327903, 1.350911, -0.782841, 1, 0, 0, 1, 1,
-1.324903, 0.8000768, 0.04819561, 0, 0, 0, 1, 1,
-1.321846, 0.5992664, -3.004747, 0, 0, 0, 1, 1,
-1.319866, 0.4706504, -0.6076152, 0, 0, 0, 1, 1,
-1.313052, -0.4299769, -1.577659, 0, 0, 0, 1, 1,
-1.287052, 2.123456, -1.810741, 0, 0, 0, 1, 1,
-1.284285, 0.751704, -0.9118015, 0, 0, 0, 1, 1,
-1.275598, 0.8020312, -0.9570673, 0, 0, 0, 1, 1,
-1.26942, -1.676142, -3.917, 1, 1, 1, 1, 1,
-1.252494, -0.07505385, -1.046809, 1, 1, 1, 1, 1,
-1.247279, -0.7292243, -1.459428, 1, 1, 1, 1, 1,
-1.24724, -0.4970573, -2.207995, 1, 1, 1, 1, 1,
-1.247034, 0.2709613, -2.155418, 1, 1, 1, 1, 1,
-1.242325, -1.259827, -2.369366, 1, 1, 1, 1, 1,
-1.216066, -1.777468, -1.155452, 1, 1, 1, 1, 1,
-1.214127, -1.113798, -0.8808222, 1, 1, 1, 1, 1,
-1.203477, -0.5720803, -2.859056, 1, 1, 1, 1, 1,
-1.195717, -1.351588, -1.895436, 1, 1, 1, 1, 1,
-1.177894, 0.9589973, -0.0003281341, 1, 1, 1, 1, 1,
-1.172835, 1.144966, -0.6385437, 1, 1, 1, 1, 1,
-1.171206, -1.045184, -1.17727, 1, 1, 1, 1, 1,
-1.170637, -0.02270008, -2.773779, 1, 1, 1, 1, 1,
-1.162977, 0.3231613, -1.032301, 1, 1, 1, 1, 1,
-1.16291, -1.559964, -2.20925, 0, 0, 1, 1, 1,
-1.160975, 1.02267, 0.07417115, 1, 0, 0, 1, 1,
-1.145456, 0.8322532, -1.185146, 1, 0, 0, 1, 1,
-1.136356, 1.377611, 0.09360228, 1, 0, 0, 1, 1,
-1.131517, -1.26776, -2.31585, 1, 0, 0, 1, 1,
-1.128271, 1.562656, -0.4757112, 1, 0, 0, 1, 1,
-1.122336, -0.5800074, -3.749253, 0, 0, 0, 1, 1,
-1.115638, 1.500717, -0.1217332, 0, 0, 0, 1, 1,
-1.110608, -0.2334508, -1.174179, 0, 0, 0, 1, 1,
-1.110555, -0.03033197, -1.773771, 0, 0, 0, 1, 1,
-1.108558, 1.789268, -1.151214, 0, 0, 0, 1, 1,
-1.107273, -2.4036, -1.573376, 0, 0, 0, 1, 1,
-1.098938, -0.3621171, -0.7674636, 0, 0, 0, 1, 1,
-1.096164, 0.4043702, 1.031245, 1, 1, 1, 1, 1,
-1.094708, 0.9164908, -0.5619813, 1, 1, 1, 1, 1,
-1.09062, 2.406704, -1.001162, 1, 1, 1, 1, 1,
-1.087268, 1.369726, -0.04946529, 1, 1, 1, 1, 1,
-1.084708, 0.7911934, -3.560225, 1, 1, 1, 1, 1,
-1.080983, 0.8658205, -0.3420947, 1, 1, 1, 1, 1,
-1.076828, -0.372008, -2.421994, 1, 1, 1, 1, 1,
-1.073517, 1.133653, -1.613729, 1, 1, 1, 1, 1,
-1.072433, -0.7805265, -3.53456, 1, 1, 1, 1, 1,
-1.069362, -1.719526, -3.064506, 1, 1, 1, 1, 1,
-1.067101, 1.412343, -0.4997319, 1, 1, 1, 1, 1,
-1.065024, 1.052415, 0.839201, 1, 1, 1, 1, 1,
-1.046378, 0.6903264, 0.5462791, 1, 1, 1, 1, 1,
-1.046219, 1.121297, 0.0726322, 1, 1, 1, 1, 1,
-1.041002, 1.511005, 0.1504727, 1, 1, 1, 1, 1,
-1.0405, 1.527791, -1.056228, 0, 0, 1, 1, 1,
-1.038206, 1.365137, -0.7494006, 1, 0, 0, 1, 1,
-1.036041, 1.489066, -0.5445607, 1, 0, 0, 1, 1,
-1.023938, 1.962677, -1.381528, 1, 0, 0, 1, 1,
-1.022928, -0.2730688, -1.05066, 1, 0, 0, 1, 1,
-1.022613, 2.176251, 1.212628, 1, 0, 0, 1, 1,
-1.021183, 1.004637, -0.274177, 0, 0, 0, 1, 1,
-1.019134, -0.6208705, -2.41805, 0, 0, 0, 1, 1,
-1.018442, -0.0947515, -2.240069, 0, 0, 0, 1, 1,
-1.00428, -0.8423147, -2.141246, 0, 0, 0, 1, 1,
-1.003524, -1.576257, -3.497846, 0, 0, 0, 1, 1,
-0.9983664, -1.099622, -2.241915, 0, 0, 0, 1, 1,
-0.9976355, -0.734585, -2.636024, 0, 0, 0, 1, 1,
-0.9948063, -1.04403, -1.023469, 1, 1, 1, 1, 1,
-0.9941261, 0.1510434, -3.559186, 1, 1, 1, 1, 1,
-0.9909667, 2.382221, -3.225705, 1, 1, 1, 1, 1,
-0.978055, -0.4882157, -2.655693, 1, 1, 1, 1, 1,
-0.9745611, -1.992907, -2.207558, 1, 1, 1, 1, 1,
-0.9738005, -1.145351, -1.571896, 1, 1, 1, 1, 1,
-0.9663178, 1.340044, -1.506268, 1, 1, 1, 1, 1,
-0.9645528, 1.555836, 0.001142914, 1, 1, 1, 1, 1,
-0.9639203, -0.5157034, -3.437569, 1, 1, 1, 1, 1,
-0.9621919, -0.1248059, -0.7111194, 1, 1, 1, 1, 1,
-0.9595279, -0.9114895, -1.28117, 1, 1, 1, 1, 1,
-0.9499472, 1.063572, -0.6801105, 1, 1, 1, 1, 1,
-0.9495028, -0.7418918, -0.7420332, 1, 1, 1, 1, 1,
-0.9489298, -0.671947, -0.6626876, 1, 1, 1, 1, 1,
-0.9405413, 1.09733, -1.180065, 1, 1, 1, 1, 1,
-0.9290251, 0.8948489, -0.6159695, 0, 0, 1, 1, 1,
-0.9259784, -0.4530459, -2.616549, 1, 0, 0, 1, 1,
-0.9152957, 0.6489437, -1.089824, 1, 0, 0, 1, 1,
-0.9108638, -0.2928276, -4.091774, 1, 0, 0, 1, 1,
-0.9098877, 0.186422, -1.973562, 1, 0, 0, 1, 1,
-0.9096392, -1.215879, -0.4101811, 1, 0, 0, 1, 1,
-0.9044919, -1.220614, -3.253631, 0, 0, 0, 1, 1,
-0.9033836, -0.2711555, -4.223845, 0, 0, 0, 1, 1,
-0.9008233, 1.170811, -0.2593437, 0, 0, 0, 1, 1,
-0.9001575, 0.7110386, 0.2264651, 0, 0, 0, 1, 1,
-0.9000385, 0.2025067, -2.388774, 0, 0, 0, 1, 1,
-0.8968771, -0.2378706, -2.578595, 0, 0, 0, 1, 1,
-0.8873441, 0.9144268, 0.06246419, 0, 0, 0, 1, 1,
-0.8855174, -0.4103631, -0.4322309, 1, 1, 1, 1, 1,
-0.8847095, -0.404593, -2.932068, 1, 1, 1, 1, 1,
-0.8813738, 1.639808, -0.3528363, 1, 1, 1, 1, 1,
-0.877354, -0.6939271, -1.774666, 1, 1, 1, 1, 1,
-0.8751339, -1.511895, -3.315596, 1, 1, 1, 1, 1,
-0.8703098, 1.433994, -1.855957, 1, 1, 1, 1, 1,
-0.8662595, -0.54927, -1.575363, 1, 1, 1, 1, 1,
-0.8638378, -1.147867, -2.382861, 1, 1, 1, 1, 1,
-0.8577617, 1.092612, -0.896222, 1, 1, 1, 1, 1,
-0.8556522, 1.322807, -0.1946288, 1, 1, 1, 1, 1,
-0.8464559, 1.492968, -0.6783388, 1, 1, 1, 1, 1,
-0.8450316, 0.64549, -1.810927, 1, 1, 1, 1, 1,
-0.844133, 0.9461213, -0.4295433, 1, 1, 1, 1, 1,
-0.84084, 0.2853985, -0.7488854, 1, 1, 1, 1, 1,
-0.8386595, -0.5983281, -1.216629, 1, 1, 1, 1, 1,
-0.8354558, -0.09436477, -1.626776, 0, 0, 1, 1, 1,
-0.8347155, -0.1183549, -2.803565, 1, 0, 0, 1, 1,
-0.8340764, 1.24104, -1.338305, 1, 0, 0, 1, 1,
-0.8322802, 0.8523927, -0.2116626, 1, 0, 0, 1, 1,
-0.8293715, -0.7370719, -2.948153, 1, 0, 0, 1, 1,
-0.826426, 1.240464, -1.381123, 1, 0, 0, 1, 1,
-0.820124, -0.6330303, -2.591659, 0, 0, 0, 1, 1,
-0.8177449, -0.6661321, -1.472316, 0, 0, 0, 1, 1,
-0.8140644, -0.1541774, -1.725346, 0, 0, 0, 1, 1,
-0.8136493, 0.8047195, -0.1063623, 0, 0, 0, 1, 1,
-0.8060942, -0.768961, -1.421617, 0, 0, 0, 1, 1,
-0.8019248, -1.675181, -2.439225, 0, 0, 0, 1, 1,
-0.7990976, -0.7530987, -4.844569, 0, 0, 0, 1, 1,
-0.7968857, 0.1109377, -2.890406, 1, 1, 1, 1, 1,
-0.7903495, -0.2880777, -3.395579, 1, 1, 1, 1, 1,
-0.7868949, -1.475185, -2.659981, 1, 1, 1, 1, 1,
-0.7865964, 0.3480712, -0.8612854, 1, 1, 1, 1, 1,
-0.7819043, 1.566808, -1.604237, 1, 1, 1, 1, 1,
-0.7739787, 1.0003, -1.174108, 1, 1, 1, 1, 1,
-0.7726378, 1.329693, -0.2107746, 1, 1, 1, 1, 1,
-0.7684992, -1.368536, -2.857379, 1, 1, 1, 1, 1,
-0.7683502, 1.418014, -1.285449, 1, 1, 1, 1, 1,
-0.7666993, 0.01737054, -1.894583, 1, 1, 1, 1, 1,
-0.7659429, 0.0004363836, 0.2861284, 1, 1, 1, 1, 1,
-0.7621346, -0.1597174, -3.601003, 1, 1, 1, 1, 1,
-0.7607021, -1.335529, -3.188792, 1, 1, 1, 1, 1,
-0.756828, -0.3367673, -1.267499, 1, 1, 1, 1, 1,
-0.7536142, 0.2223148, -1.542195, 1, 1, 1, 1, 1,
-0.7505869, 0.4912376, -0.7139357, 0, 0, 1, 1, 1,
-0.7486413, -1.242102, -3.10315, 1, 0, 0, 1, 1,
-0.7412754, 0.1405489, -2.233871, 1, 0, 0, 1, 1,
-0.7404436, 0.2495938, -1.010688, 1, 0, 0, 1, 1,
-0.7398249, -0.295609, -1.990913, 1, 0, 0, 1, 1,
-0.7323964, 1.34313, -0.3248853, 1, 0, 0, 1, 1,
-0.7298699, 0.549631, -0.6022375, 0, 0, 0, 1, 1,
-0.7265865, 0.3563783, -1.389123, 0, 0, 0, 1, 1,
-0.7257925, 0.8491573, -0.9522814, 0, 0, 0, 1, 1,
-0.7239564, 1.44704, -0.3921948, 0, 0, 0, 1, 1,
-0.7102311, 0.2768469, -0.009113612, 0, 0, 0, 1, 1,
-0.7099446, -0.009433064, -2.781672, 0, 0, 0, 1, 1,
-0.6985748, -0.8606586, -2.628664, 0, 0, 0, 1, 1,
-0.6936701, -0.4680223, -1.658919, 1, 1, 1, 1, 1,
-0.6835231, -0.3632158, -1.866303, 1, 1, 1, 1, 1,
-0.6820127, 0.7127662, -0.7715753, 1, 1, 1, 1, 1,
-0.6767365, -0.8562106, -3.025922, 1, 1, 1, 1, 1,
-0.6765633, 1.067966, -0.04719683, 1, 1, 1, 1, 1,
-0.6762495, -0.9496158, -3.090966, 1, 1, 1, 1, 1,
-0.6760209, -0.8448016, -4.042736, 1, 1, 1, 1, 1,
-0.6719861, 1.02839, -0.6328685, 1, 1, 1, 1, 1,
-0.6716104, 0.1617735, -3.116958, 1, 1, 1, 1, 1,
-0.6710868, 1.434706, 0.215531, 1, 1, 1, 1, 1,
-0.6560201, 1.14081, -2.0553, 1, 1, 1, 1, 1,
-0.6543813, -0.143527, -2.655444, 1, 1, 1, 1, 1,
-0.6521829, -0.1780094, -2.241964, 1, 1, 1, 1, 1,
-0.6509846, -0.2087812, -1.51687, 1, 1, 1, 1, 1,
-0.6427528, 0.605758, -0.7259743, 1, 1, 1, 1, 1,
-0.6398462, -0.9021387, -3.240214, 0, 0, 1, 1, 1,
-0.6342, 0.8225453, -0.1067051, 1, 0, 0, 1, 1,
-0.6312093, -1.128872, -3.645936, 1, 0, 0, 1, 1,
-0.6271796, 0.5416394, 0.2444019, 1, 0, 0, 1, 1,
-0.6195466, -1.399959, -1.990169, 1, 0, 0, 1, 1,
-0.6179479, 1.171285, -0.3999402, 1, 0, 0, 1, 1,
-0.6173851, -0.05454631, -0.2923486, 0, 0, 0, 1, 1,
-0.6171736, 1.134951, -2.423755, 0, 0, 0, 1, 1,
-0.6121117, 0.6569548, 0.9770504, 0, 0, 0, 1, 1,
-0.61125, 0.5473793, -2.329214, 0, 0, 0, 1, 1,
-0.6058089, -1.277473, -1.373668, 0, 0, 0, 1, 1,
-0.6046189, 1.190889, -2.022588, 0, 0, 0, 1, 1,
-0.5992201, -1.391263, -1.98195, 0, 0, 0, 1, 1,
-0.5957232, 0.07926909, -0.7221483, 1, 1, 1, 1, 1,
-0.5917081, -0.03897166, -0.9297756, 1, 1, 1, 1, 1,
-0.5915158, 0.3047866, -1.298781, 1, 1, 1, 1, 1,
-0.584004, 0.8050004, -1.118032, 1, 1, 1, 1, 1,
-0.5804892, -0.7775315, -1.052645, 1, 1, 1, 1, 1,
-0.575536, 0.3707053, -1.816363, 1, 1, 1, 1, 1,
-0.5730623, 0.8452536, -0.7838267, 1, 1, 1, 1, 1,
-0.5666921, 0.4607227, -0.9018272, 1, 1, 1, 1, 1,
-0.5640473, 0.8424248, 0.2777535, 1, 1, 1, 1, 1,
-0.5614135, 3.110237, 1.867334, 1, 1, 1, 1, 1,
-0.5555289, 0.0266856, -0.4064595, 1, 1, 1, 1, 1,
-0.5511793, 0.9283395, -2.025918, 1, 1, 1, 1, 1,
-0.550343, 0.716044, -0.2898113, 1, 1, 1, 1, 1,
-0.5496475, -1.795601, -1.76431, 1, 1, 1, 1, 1,
-0.5409477, 1.377881, 0.3315162, 1, 1, 1, 1, 1,
-0.540522, 0.7871311, -1.304413, 0, 0, 1, 1, 1,
-0.5396897, 0.9852393, -0.04187211, 1, 0, 0, 1, 1,
-0.5384411, -0.8817044, -3.151927, 1, 0, 0, 1, 1,
-0.5286745, -0.7487256, -2.248927, 1, 0, 0, 1, 1,
-0.5276287, 0.1972423, -2.077805, 1, 0, 0, 1, 1,
-0.526485, 0.8613688, -0.6172878, 1, 0, 0, 1, 1,
-0.5109383, 0.4985965, -1.035374, 0, 0, 0, 1, 1,
-0.5075995, -0.6808256, -3.435331, 0, 0, 0, 1, 1,
-0.505422, -0.6452225, -2.819878, 0, 0, 0, 1, 1,
-0.5004294, -0.6261987, -3.713252, 0, 0, 0, 1, 1,
-0.4977559, -0.294767, -3.283317, 0, 0, 0, 1, 1,
-0.4912411, -1.252414, -1.830254, 0, 0, 0, 1, 1,
-0.4906374, -1.822378, -3.431631, 0, 0, 0, 1, 1,
-0.4859801, 1.348424, 0.5280223, 1, 1, 1, 1, 1,
-0.4832265, -0.2995262, -3.154056, 1, 1, 1, 1, 1,
-0.4810153, 0.06067851, -2.028454, 1, 1, 1, 1, 1,
-0.4740374, -1.501668, -3.958537, 1, 1, 1, 1, 1,
-0.4703377, -0.3756247, -1.369489, 1, 1, 1, 1, 1,
-0.4671527, 0.5916769, -0.3881489, 1, 1, 1, 1, 1,
-0.466573, -1.684655, -3.616349, 1, 1, 1, 1, 1,
-0.4638656, -0.6500629, -0.7843329, 1, 1, 1, 1, 1,
-0.462993, -1.596878, -0.9187348, 1, 1, 1, 1, 1,
-0.4586319, -0.5761175, -4.238449, 1, 1, 1, 1, 1,
-0.4540299, 0.897509, -1.215657, 1, 1, 1, 1, 1,
-0.4527264, -0.6938087, -4.087139, 1, 1, 1, 1, 1,
-0.4496351, 0.3717422, -1.635709, 1, 1, 1, 1, 1,
-0.4494952, -1.353704, -1.72814, 1, 1, 1, 1, 1,
-0.4475934, -0.4285943, -2.191886, 1, 1, 1, 1, 1,
-0.444584, -1.177071, -3.675545, 0, 0, 1, 1, 1,
-0.4386496, 1.102262, -0.00424985, 1, 0, 0, 1, 1,
-0.4333883, -0.7511867, -1.896954, 1, 0, 0, 1, 1,
-0.4281671, 1.376796, -1.902994, 1, 0, 0, 1, 1,
-0.4235469, -0.6853849, -4.440905, 1, 0, 0, 1, 1,
-0.4228787, 0.7692557, 1.67796, 1, 0, 0, 1, 1,
-0.4220602, 1.676523, 1.375195, 0, 0, 0, 1, 1,
-0.4142357, 1.450567, -0.3698737, 0, 0, 0, 1, 1,
-0.4065311, -0.1836408, -3.448062, 0, 0, 0, 1, 1,
-0.405757, -0.08634543, -0.4545852, 0, 0, 0, 1, 1,
-0.4055794, 1.734686, -0.9263763, 0, 0, 0, 1, 1,
-0.4050517, -1.45913, -2.860955, 0, 0, 0, 1, 1,
-0.4027926, 0.001450743, -1.635171, 0, 0, 0, 1, 1,
-0.4012041, 0.7753746, -0.3556073, 1, 1, 1, 1, 1,
-0.4009522, -0.3367766, -1.331413, 1, 1, 1, 1, 1,
-0.3996869, -1.789804, -4.310984, 1, 1, 1, 1, 1,
-0.3968838, -0.2355906, -2.021096, 1, 1, 1, 1, 1,
-0.3943397, -1.120943, -2.724607, 1, 1, 1, 1, 1,
-0.393558, 0.16113, -0.9625329, 1, 1, 1, 1, 1,
-0.3927152, -0.8848168, -3.771154, 1, 1, 1, 1, 1,
-0.3918103, 1.564962, -1.069778, 1, 1, 1, 1, 1,
-0.3916851, 0.9442523, 0.7579263, 1, 1, 1, 1, 1,
-0.3915806, -0.7804679, -2.490245, 1, 1, 1, 1, 1,
-0.3883302, 1.415459, 0.006667503, 1, 1, 1, 1, 1,
-0.388, -1.659295, -0.5427947, 1, 1, 1, 1, 1,
-0.3849539, 0.1481826, -1.487441, 1, 1, 1, 1, 1,
-0.3770229, 1.707461, 0.9487099, 1, 1, 1, 1, 1,
-0.3723532, -0.2349887, -2.429613, 1, 1, 1, 1, 1,
-0.3699371, -1.593017, -4.080567, 0, 0, 1, 1, 1,
-0.3686766, -0.9408312, -2.202683, 1, 0, 0, 1, 1,
-0.3684512, 0.3245106, -0.4271141, 1, 0, 0, 1, 1,
-0.3683009, -0.433564, -2.677122, 1, 0, 0, 1, 1,
-0.3667994, 0.1942361, -1.277234, 1, 0, 0, 1, 1,
-0.3657876, 1.070766, -0.385882, 1, 0, 0, 1, 1,
-0.3638129, -1.581953, -0.1943664, 0, 0, 0, 1, 1,
-0.3626974, -0.2481998, -2.57096, 0, 0, 0, 1, 1,
-0.3624613, -0.5958843, -3.051409, 0, 0, 0, 1, 1,
-0.3611182, 1.394677, -0.04649124, 0, 0, 0, 1, 1,
-0.35997, -2.377676, -2.487857, 0, 0, 0, 1, 1,
-0.3594742, 0.6501768, -2.234478, 0, 0, 0, 1, 1,
-0.3572136, -1.639331, -4.148367, 0, 0, 0, 1, 1,
-0.3538895, -0.1147227, -1.059076, 1, 1, 1, 1, 1,
-0.3488864, -1.219721, -3.429868, 1, 1, 1, 1, 1,
-0.3481039, 2.89346, 1.395738, 1, 1, 1, 1, 1,
-0.3447675, 0.5118338, -1.892924, 1, 1, 1, 1, 1,
-0.3436566, -0.5503057, -1.637277, 1, 1, 1, 1, 1,
-0.3422654, -1.137351, -1.479594, 1, 1, 1, 1, 1,
-0.3350966, 0.4560868, -0.06691374, 1, 1, 1, 1, 1,
-0.3346651, 1.1517, -1.759452, 1, 1, 1, 1, 1,
-0.333926, -0.1835313, -1.962935, 1, 1, 1, 1, 1,
-0.3288066, 0.2190327, -0.2421243, 1, 1, 1, 1, 1,
-0.32567, 0.2698581, 0.2122109, 1, 1, 1, 1, 1,
-0.3249286, 0.4502405, -0.1029836, 1, 1, 1, 1, 1,
-0.3206651, 0.2874822, -0.5873586, 1, 1, 1, 1, 1,
-0.3158711, -0.5123047, -1.575389, 1, 1, 1, 1, 1,
-0.3151112, 0.4577578, -0.4698803, 1, 1, 1, 1, 1,
-0.3129586, -0.8938314, -3.242131, 0, 0, 1, 1, 1,
-0.3122572, -0.02371627, -1.105795, 1, 0, 0, 1, 1,
-0.3077742, 0.5613326, -1.531306, 1, 0, 0, 1, 1,
-0.3056868, -0.2291427, -0.5955514, 1, 0, 0, 1, 1,
-0.3049756, -1.28447, -3.205758, 1, 0, 0, 1, 1,
-0.3046458, 1.28037, -0.08517833, 1, 0, 0, 1, 1,
-0.3008693, -2.398127, -3.968897, 0, 0, 0, 1, 1,
-0.2973526, 1.41437, -1.561314, 0, 0, 0, 1, 1,
-0.2972763, -0.3513519, -1.803625, 0, 0, 0, 1, 1,
-0.2967511, -0.2438039, -2.389019, 0, 0, 0, 1, 1,
-0.2942688, 0.9319809, -0.2820935, 0, 0, 0, 1, 1,
-0.2882253, 0.1576184, -0.7523034, 0, 0, 0, 1, 1,
-0.2872597, -1.481337, -2.400654, 0, 0, 0, 1, 1,
-0.2835237, 0.7388577, -1.913459, 1, 1, 1, 1, 1,
-0.2795389, 1.175969, -0.947867, 1, 1, 1, 1, 1,
-0.2775847, -0.5531595, -2.939939, 1, 1, 1, 1, 1,
-0.2754616, 0.8767245, 0.7336235, 1, 1, 1, 1, 1,
-0.2665513, 0.3800371, 0.7439098, 1, 1, 1, 1, 1,
-0.2597995, -1.017834, -2.082687, 1, 1, 1, 1, 1,
-0.2594582, 0.5922121, 1.034584, 1, 1, 1, 1, 1,
-0.258143, -0.8767245, -2.442138, 1, 1, 1, 1, 1,
-0.2569041, 1.411493, 0.5007015, 1, 1, 1, 1, 1,
-0.2537304, -0.7631187, -2.223786, 1, 1, 1, 1, 1,
-0.2499422, -0.4970287, -3.896013, 1, 1, 1, 1, 1,
-0.2499038, 1.640227, 1.379408, 1, 1, 1, 1, 1,
-0.2414009, -1.254115, -1.966227, 1, 1, 1, 1, 1,
-0.2413193, -0.5181745, -3.510965, 1, 1, 1, 1, 1,
-0.2392558, 0.206652, -1.126451, 1, 1, 1, 1, 1,
-0.2383061, 1.324878, 0.3449754, 0, 0, 1, 1, 1,
-0.2322309, -0.5024623, -0.9156762, 1, 0, 0, 1, 1,
-0.2263527, 0.4756199, 0.5355781, 1, 0, 0, 1, 1,
-0.2261966, 2.023635, -0.01331824, 1, 0, 0, 1, 1,
-0.2244392, 0.1443072, -2.498151, 1, 0, 0, 1, 1,
-0.2165719, 2.325411, 0.1437396, 1, 0, 0, 1, 1,
-0.2142672, 0.2220556, -0.1022556, 0, 0, 0, 1, 1,
-0.2095051, -0.0678523, -1.252402, 0, 0, 0, 1, 1,
-0.205302, -1.017716, -2.139607, 0, 0, 0, 1, 1,
-0.2030524, -0.5563723, -4.54107, 0, 0, 0, 1, 1,
-0.2017667, -1.545443, -2.174733, 0, 0, 0, 1, 1,
-0.2008781, -0.4732194, -2.061116, 0, 0, 0, 1, 1,
-0.1847121, -0.1164315, -2.478516, 0, 0, 0, 1, 1,
-0.1754679, 0.3450882, -1.115637, 1, 1, 1, 1, 1,
-0.17374, -1.822818, -4.056745, 1, 1, 1, 1, 1,
-0.1705628, 0.02244555, -4.201397, 1, 1, 1, 1, 1,
-0.1673506, -0.3159644, -2.333815, 1, 1, 1, 1, 1,
-0.1668522, 1.277819, -0.3961088, 1, 1, 1, 1, 1,
-0.1666134, 0.07347028, -0.5022939, 1, 1, 1, 1, 1,
-0.1649519, -0.454472, -2.857483, 1, 1, 1, 1, 1,
-0.1586545, 0.05173599, 0.4774486, 1, 1, 1, 1, 1,
-0.1577614, -0.1641207, -1.037139, 1, 1, 1, 1, 1,
-0.1562165, 0.5146068, -0.4953173, 1, 1, 1, 1, 1,
-0.1517655, 1.309974, -0.09119125, 1, 1, 1, 1, 1,
-0.1516934, -0.9604615, -3.695834, 1, 1, 1, 1, 1,
-0.1506939, 1.517942, -2.163175, 1, 1, 1, 1, 1,
-0.150546, -0.01408394, -2.061509, 1, 1, 1, 1, 1,
-0.1418741, 2.172667, 1.113596, 1, 1, 1, 1, 1,
-0.1393747, 0.6301649, -2.263944, 0, 0, 1, 1, 1,
-0.1363449, 0.8639426, -0.6780071, 1, 0, 0, 1, 1,
-0.1362344, 0.7414042, 1.268855, 1, 0, 0, 1, 1,
-0.1285442, 0.5443949, 1.021115, 1, 0, 0, 1, 1,
-0.1216266, 0.8559653, -2.174037, 1, 0, 0, 1, 1,
-0.117122, -0.9151444, -4.882344, 1, 0, 0, 1, 1,
-0.1139483, -0.5493713, -2.845189, 0, 0, 0, 1, 1,
-0.1127599, -1.0919, -2.248244, 0, 0, 0, 1, 1,
-0.1118846, 0.3439335, -0.4865559, 0, 0, 0, 1, 1,
-0.1078593, 0.1945078, 0.6246378, 0, 0, 0, 1, 1,
-0.1049909, -1.317789, -4.021907, 0, 0, 0, 1, 1,
-0.1033438, -2.981046, -3.299025, 0, 0, 0, 1, 1,
-0.09627138, -1.257836, -2.576641, 0, 0, 0, 1, 1,
-0.09478894, -1.831241, -1.838802, 1, 1, 1, 1, 1,
-0.09382676, -0.389627, -1.926126, 1, 1, 1, 1, 1,
-0.08398529, 0.2746543, 0.8655676, 1, 1, 1, 1, 1,
-0.08396922, -0.8540527, -3.301621, 1, 1, 1, 1, 1,
-0.07681949, -0.9801567, -2.145061, 1, 1, 1, 1, 1,
-0.07346036, 0.5929368, -0.4912368, 1, 1, 1, 1, 1,
-0.06919145, 1.026957, -0.7478224, 1, 1, 1, 1, 1,
-0.06857207, 0.1758837, -0.2388152, 1, 1, 1, 1, 1,
-0.06790074, 1.706645, 1.888518, 1, 1, 1, 1, 1,
-0.0656994, -0.2604481, -1.905489, 1, 1, 1, 1, 1,
-0.06231933, -0.145863, -3.860174, 1, 1, 1, 1, 1,
-0.05782145, 0.07110842, -2.152918, 1, 1, 1, 1, 1,
-0.05709344, -1.719543, -3.32133, 1, 1, 1, 1, 1,
-0.05632963, 0.3681137, -2.647727, 1, 1, 1, 1, 1,
-0.05338087, 1.157555, -0.7610719, 1, 1, 1, 1, 1,
-0.05294687, -0.5710219, -2.044859, 0, 0, 1, 1, 1,
-0.05214595, -0.2865518, -3.552953, 1, 0, 0, 1, 1,
-0.04168412, 0.3767031, -1.67989, 1, 0, 0, 1, 1,
-0.03998126, 0.1773047, -0.2894544, 1, 0, 0, 1, 1,
-0.03554633, -0.1001839, -4.172144, 1, 0, 0, 1, 1,
-0.03305198, 0.6760431, 1.101398, 1, 0, 0, 1, 1,
-0.03125251, -0.6651785, -4.018997, 0, 0, 0, 1, 1,
-0.02760349, -1.024545, -2.405842, 0, 0, 0, 1, 1,
-0.02632099, -2.241563, -2.94713, 0, 0, 0, 1, 1,
-0.02195953, -0.7408822, -2.926053, 0, 0, 0, 1, 1,
-0.01980523, -1.05584, -4.202908, 0, 0, 0, 1, 1,
-0.01638755, -0.926107, -2.824155, 0, 0, 0, 1, 1,
-0.01466757, -0.8407858, -5.659963, 0, 0, 0, 1, 1,
-0.01042891, -0.111308, -2.951827, 1, 1, 1, 1, 1,
-0.004274504, -0.4600655, -3.979866, 1, 1, 1, 1, 1,
-0.004023705, -1.183538, -3.696663, 1, 1, 1, 1, 1,
-0.0008090009, -0.9866646, -4.879181, 1, 1, 1, 1, 1,
-0.0001626153, -1.163579, -5.025489, 1, 1, 1, 1, 1,
0.0006245562, 0.5085884, -0.6869372, 1, 1, 1, 1, 1,
0.000736968, -0.3771378, 3.586021, 1, 1, 1, 1, 1,
0.001691954, -1.603605, 4.2301, 1, 1, 1, 1, 1,
0.002482341, 0.4834231, 0.7966648, 1, 1, 1, 1, 1,
0.008295283, -0.1607907, 4.612252, 1, 1, 1, 1, 1,
0.01313427, -1.444378, 2.787885, 1, 1, 1, 1, 1,
0.01374609, 0.7598325, 0.9107687, 1, 1, 1, 1, 1,
0.01823539, -1.063756, 2.750844, 1, 1, 1, 1, 1,
0.01965955, -0.1472387, 3.642437, 1, 1, 1, 1, 1,
0.01988553, -0.3442008, 1.615188, 1, 1, 1, 1, 1,
0.02024127, -0.2067285, 3.625369, 0, 0, 1, 1, 1,
0.0228442, 0.4842733, -2.316463, 1, 0, 0, 1, 1,
0.02895674, 0.01364565, 1.044459, 1, 0, 0, 1, 1,
0.03016063, 1.122046, -0.3758939, 1, 0, 0, 1, 1,
0.03193982, -0.2716856, 1.354021, 1, 0, 0, 1, 1,
0.03445212, -0.1667903, 3.405216, 1, 0, 0, 1, 1,
0.03490791, -0.9174029, 2.617504, 0, 0, 0, 1, 1,
0.03648642, 0.3746683, 1.653829, 0, 0, 0, 1, 1,
0.03796115, -1.806784, 1.893188, 0, 0, 0, 1, 1,
0.04089298, 0.751619, -0.9310453, 0, 0, 0, 1, 1,
0.0430381, 0.4854904, 1.479885, 0, 0, 0, 1, 1,
0.04858499, 1.213972, 0.5943606, 0, 0, 0, 1, 1,
0.04985477, -1.077111, 2.97302, 0, 0, 0, 1, 1,
0.05092347, -0.8162887, 3.682769, 1, 1, 1, 1, 1,
0.05368332, -0.684952, 3.837949, 1, 1, 1, 1, 1,
0.05645024, -1.894116, 3.087475, 1, 1, 1, 1, 1,
0.06172508, 0.5461071, 0.2683004, 1, 1, 1, 1, 1,
0.06366713, 0.172638, 1.685361, 1, 1, 1, 1, 1,
0.06624477, 0.8260907, 0.5692768, 1, 1, 1, 1, 1,
0.06947264, 0.8041827, 0.6115852, 1, 1, 1, 1, 1,
0.07831571, -1.023913, 5.359616, 1, 1, 1, 1, 1,
0.07996839, 0.2308842, 0.8658038, 1, 1, 1, 1, 1,
0.0814154, -0.7412426, 2.190346, 1, 1, 1, 1, 1,
0.08282541, -0.1930684, 1.586556, 1, 1, 1, 1, 1,
0.08329423, -1.378688, 1.819201, 1, 1, 1, 1, 1,
0.08559497, -0.6322815, 1.430724, 1, 1, 1, 1, 1,
0.08606324, 0.9214368, 2.360706, 1, 1, 1, 1, 1,
0.0868138, 0.2424565, 0.379882, 1, 1, 1, 1, 1,
0.08708496, 0.38551, -1.749429, 0, 0, 1, 1, 1,
0.08805601, 0.09178343, -0.3498941, 1, 0, 0, 1, 1,
0.08871437, -0.4694284, 3.665547, 1, 0, 0, 1, 1,
0.08904114, -0.2844353, 1.468513, 1, 0, 0, 1, 1,
0.08934638, 0.3367887, -0.7322757, 1, 0, 0, 1, 1,
0.09025607, 0.09266008, 1.610138, 1, 0, 0, 1, 1,
0.09133422, 0.5801626, 0.6181833, 0, 0, 0, 1, 1,
0.09232007, -1.099638, 3.159034, 0, 0, 0, 1, 1,
0.09452011, 0.4726271, -0.09480533, 0, 0, 0, 1, 1,
0.09603041, 1.281563, -0.8141562, 0, 0, 0, 1, 1,
0.09898828, -0.4769798, 3.55728, 0, 0, 0, 1, 1,
0.1020508, 1.091487, -1.834214, 0, 0, 0, 1, 1,
0.1021098, 0.9396268, -0.1197794, 0, 0, 0, 1, 1,
0.1067847, -0.805181, 2.259622, 1, 1, 1, 1, 1,
0.1085515, 0.4772778, 0.6879422, 1, 1, 1, 1, 1,
0.1087777, -1.223057, 2.13413, 1, 1, 1, 1, 1,
0.1136549, 0.1939833, 0.9680294, 1, 1, 1, 1, 1,
0.115416, 1.557659, 0.6885622, 1, 1, 1, 1, 1,
0.1161791, 0.1651792, -0.978516, 1, 1, 1, 1, 1,
0.1242634, 0.3339314, 0.86584, 1, 1, 1, 1, 1,
0.1332382, -0.1327329, 1.260336, 1, 1, 1, 1, 1,
0.134442, 0.7971229, 0.1830534, 1, 1, 1, 1, 1,
0.1350622, -1.687092, 3.578038, 1, 1, 1, 1, 1,
0.136617, -0.8153083, 3.372567, 1, 1, 1, 1, 1,
0.1419182, 0.5756086, -0.8577784, 1, 1, 1, 1, 1,
0.1421833, -0.3931544, 2.806737, 1, 1, 1, 1, 1,
0.1427701, 0.7576293, -0.07318611, 1, 1, 1, 1, 1,
0.1428335, 2.446416, -0.2598337, 1, 1, 1, 1, 1,
0.1432169, 0.03390864, 2.258172, 0, 0, 1, 1, 1,
0.1457021, -0.08228777, 2.559033, 1, 0, 0, 1, 1,
0.147011, -1.287091, 4.030202, 1, 0, 0, 1, 1,
0.1510699, -0.9039057, 2.180275, 1, 0, 0, 1, 1,
0.1520735, 1.084009, 1.010283, 1, 0, 0, 1, 1,
0.1524768, 0.07889153, 1.663903, 1, 0, 0, 1, 1,
0.1548758, -0.6730615, 3.352798, 0, 0, 0, 1, 1,
0.1559301, 0.07345388, -1.043514, 0, 0, 0, 1, 1,
0.1574211, -1.485861, 3.902997, 0, 0, 0, 1, 1,
0.1584592, -0.6328741, 4.032948, 0, 0, 0, 1, 1,
0.1592609, -0.4207063, 1.444658, 0, 0, 0, 1, 1,
0.1594162, 0.9015203, -0.3543827, 0, 0, 0, 1, 1,
0.1600209, -1.243142, 3.557008, 0, 0, 0, 1, 1,
0.1649208, -0.4018804, 4.129929, 1, 1, 1, 1, 1,
0.1659881, 1.347219, 0.932146, 1, 1, 1, 1, 1,
0.1706579, 0.2299244, 0.7159576, 1, 1, 1, 1, 1,
0.1710831, -0.2537, 3.245352, 1, 1, 1, 1, 1,
0.1714137, -0.176892, 1.29214, 1, 1, 1, 1, 1,
0.1737248, -0.3364859, 3.576146, 1, 1, 1, 1, 1,
0.1749115, 0.1894244, 2.133641, 1, 1, 1, 1, 1,
0.1755808, 0.7075769, 2.831069, 1, 1, 1, 1, 1,
0.1773106, -1.273193, 3.609001, 1, 1, 1, 1, 1,
0.1782586, 0.4429005, 1.250152, 1, 1, 1, 1, 1,
0.1795124, 1.241649, -0.8785051, 1, 1, 1, 1, 1,
0.1813324, 0.3656948, 2.826463, 1, 1, 1, 1, 1,
0.1833664, -0.7887005, 3.592078, 1, 1, 1, 1, 1,
0.1847804, 0.2161884, 1.844555, 1, 1, 1, 1, 1,
0.1867755, 0.6025967, -0.1388433, 1, 1, 1, 1, 1,
0.1889917, -1.602974, 2.103354, 0, 0, 1, 1, 1,
0.189281, 0.9678854, -1.183861, 1, 0, 0, 1, 1,
0.1903921, -0.6440219, 2.381804, 1, 0, 0, 1, 1,
0.1921548, -0.1387408, 2.324202, 1, 0, 0, 1, 1,
0.1972736, 0.8279589, 1.115597, 1, 0, 0, 1, 1,
0.1995911, -0.859059, 3.853032, 1, 0, 0, 1, 1,
0.2042471, -0.2431647, 1.482468, 0, 0, 0, 1, 1,
0.2062406, 1.168248, 0.9018789, 0, 0, 0, 1, 1,
0.2076662, -0.6011467, 4.08376, 0, 0, 0, 1, 1,
0.2110754, -0.6674297, 2.673573, 0, 0, 0, 1, 1,
0.21263, -1.897057, 2.931837, 0, 0, 0, 1, 1,
0.2143824, -0.2719022, 2.786599, 0, 0, 0, 1, 1,
0.2158036, -0.7049114, 3.034077, 0, 0, 0, 1, 1,
0.2161531, 0.06101661, 2.366908, 1, 1, 1, 1, 1,
0.2162568, 1.128504, 2.694162, 1, 1, 1, 1, 1,
0.2165368, -0.1972869, 1.826974, 1, 1, 1, 1, 1,
0.2176949, 0.5394494, -0.9062766, 1, 1, 1, 1, 1,
0.2195217, 0.5283127, -1.01967, 1, 1, 1, 1, 1,
0.2195455, 0.4477, 0.8824507, 1, 1, 1, 1, 1,
0.2217771, -1.710133, 3.982369, 1, 1, 1, 1, 1,
0.2241009, -1.056482, 2.959181, 1, 1, 1, 1, 1,
0.2300671, -0.4394247, 4.927905, 1, 1, 1, 1, 1,
0.2349599, -1.532976, 3.332766, 1, 1, 1, 1, 1,
0.2356744, 0.8891377, 0.6936576, 1, 1, 1, 1, 1,
0.2364473, -0.6887225, 3.061339, 1, 1, 1, 1, 1,
0.2366225, 2.723422, -1.454193, 1, 1, 1, 1, 1,
0.2377247, 1.294234, 0.3903022, 1, 1, 1, 1, 1,
0.2380059, 0.4064486, -0.2783433, 1, 1, 1, 1, 1,
0.2487451, 0.05322403, 0.684494, 0, 0, 1, 1, 1,
0.2489802, 0.9124339, 0.7334893, 1, 0, 0, 1, 1,
0.2526683, -0.3163368, 2.897084, 1, 0, 0, 1, 1,
0.2531513, -0.3317875, 3.035738, 1, 0, 0, 1, 1,
0.2534147, 0.5127123, 0.1529263, 1, 0, 0, 1, 1,
0.2541379, -0.3560795, 3.055438, 1, 0, 0, 1, 1,
0.2541897, -0.2233036, 3.027516, 0, 0, 0, 1, 1,
0.2543709, 0.02778176, 2.337133, 0, 0, 0, 1, 1,
0.263256, -0.9228156, 2.93228, 0, 0, 0, 1, 1,
0.2663122, -0.6070861, 3.863974, 0, 0, 0, 1, 1,
0.268465, 1.266003, 2.1792, 0, 0, 0, 1, 1,
0.2685667, 2.511419, -1.331717, 0, 0, 0, 1, 1,
0.2696218, 0.5411959, 0.005605806, 0, 0, 0, 1, 1,
0.2731178, 0.4058182, 0.6828239, 1, 1, 1, 1, 1,
0.2757413, -0.3269249, 0.9746376, 1, 1, 1, 1, 1,
0.2777838, 1.559025, -0.8687586, 1, 1, 1, 1, 1,
0.2893128, -0.5528295, 2.159572, 1, 1, 1, 1, 1,
0.2893671, -0.8579996, 1.514548, 1, 1, 1, 1, 1,
0.2899086, 1.691923, 1.371418, 1, 1, 1, 1, 1,
0.2922439, 0.109004, 1.246612, 1, 1, 1, 1, 1,
0.2925965, 1.478032, -0.5350177, 1, 1, 1, 1, 1,
0.2975612, 0.007715088, 0.2672101, 1, 1, 1, 1, 1,
0.299486, -1.518147, 3.462245, 1, 1, 1, 1, 1,
0.3047651, -0.8258004, 1.905328, 1, 1, 1, 1, 1,
0.3055929, -0.2207107, 0.8066468, 1, 1, 1, 1, 1,
0.3060474, -1.166338, 4.274998, 1, 1, 1, 1, 1,
0.3080762, 1.843303, -0.5996145, 1, 1, 1, 1, 1,
0.3095511, -0.1677993, 2.22179, 1, 1, 1, 1, 1,
0.3100543, 0.08413221, 3.302042, 0, 0, 1, 1, 1,
0.3181913, 0.375677, -0.9316574, 1, 0, 0, 1, 1,
0.3242292, 0.5171409, 1.291232, 1, 0, 0, 1, 1,
0.3256606, 0.4646097, 0.2853599, 1, 0, 0, 1, 1,
0.333222, -1.323493, 1.933269, 1, 0, 0, 1, 1,
0.3337252, -0.930843, 3.584158, 1, 0, 0, 1, 1,
0.3357311, 0.2739048, 2.109215, 0, 0, 0, 1, 1,
0.3392372, -0.09371772, 2.354589, 0, 0, 0, 1, 1,
0.3420879, -2.753295, 3.675426, 0, 0, 0, 1, 1,
0.3429532, 1.490506, -0.9338843, 0, 0, 0, 1, 1,
0.3430222, -0.6096553, 2.45801, 0, 0, 0, 1, 1,
0.3457462, -0.6635188, 3.676505, 0, 0, 0, 1, 1,
0.3492628, -0.3222035, 2.171515, 0, 0, 0, 1, 1,
0.3507712, 0.1606051, 0.5779468, 1, 1, 1, 1, 1,
0.3509473, -0.2140476, 2.518795, 1, 1, 1, 1, 1,
0.35249, -0.07263507, 3.686034, 1, 1, 1, 1, 1,
0.3563119, -1.559391, 3.959971, 1, 1, 1, 1, 1,
0.3566161, 0.6406574, 0.3795097, 1, 1, 1, 1, 1,
0.3573109, -0.6623541, 2.473205, 1, 1, 1, 1, 1,
0.3581333, -0.5581282, 3.610376, 1, 1, 1, 1, 1,
0.358234, 0.5949442, 0.7906045, 1, 1, 1, 1, 1,
0.3617108, 1.161772, 0.9165946, 1, 1, 1, 1, 1,
0.3625167, -0.02153494, 0.4415293, 1, 1, 1, 1, 1,
0.3693952, 0.371243, 0.6992585, 1, 1, 1, 1, 1,
0.3694833, -0.01748443, 2.192968, 1, 1, 1, 1, 1,
0.3703498, 0.7085673, 1.195036, 1, 1, 1, 1, 1,
0.3721869, 1.839203, -0.05472492, 1, 1, 1, 1, 1,
0.3740417, -0.01945064, 2.398648, 1, 1, 1, 1, 1,
0.376823, 1.976585, -0.06051856, 0, 0, 1, 1, 1,
0.3773413, -0.9999163, 3.137737, 1, 0, 0, 1, 1,
0.3811135, 0.9498159, -0.06391672, 1, 0, 0, 1, 1,
0.3839483, 0.6795187, -1.089084, 1, 0, 0, 1, 1,
0.3864078, -0.4467479, 2.22431, 1, 0, 0, 1, 1,
0.3896705, -0.3706847, 2.010365, 1, 0, 0, 1, 1,
0.3897218, -0.8381642, 2.649071, 0, 0, 0, 1, 1,
0.3911038, -0.8364195, 3.528035, 0, 0, 0, 1, 1,
0.3917166, -1.806289, 2.102243, 0, 0, 0, 1, 1,
0.392454, 0.4753889, 0.2410704, 0, 0, 0, 1, 1,
0.3938809, 0.7304779, 0.6031947, 0, 0, 0, 1, 1,
0.3941649, 0.7240152, 0.5983381, 0, 0, 0, 1, 1,
0.3953131, -0.971839, 4.363377, 0, 0, 0, 1, 1,
0.3954933, -0.3241034, 2.529334, 1, 1, 1, 1, 1,
0.3956546, -0.9584336, 1.141858, 1, 1, 1, 1, 1,
0.3980825, 1.868388, 2.925808, 1, 1, 1, 1, 1,
0.4011307, 0.2389037, 1.16947, 1, 1, 1, 1, 1,
0.4143047, 0.1739602, 1.145731, 1, 1, 1, 1, 1,
0.4150182, 0.7734913, 1.632971, 1, 1, 1, 1, 1,
0.417293, -0.5803571, 1.434888, 1, 1, 1, 1, 1,
0.4204119, 0.123668, 1.741565, 1, 1, 1, 1, 1,
0.4217752, 0.02169677, 2.139879, 1, 1, 1, 1, 1,
0.4259624, 0.1216534, 1.016557, 1, 1, 1, 1, 1,
0.4262671, 0.5236326, 0.9757657, 1, 1, 1, 1, 1,
0.4340114, 0.5000537, 1.365926, 1, 1, 1, 1, 1,
0.4361812, 0.8907331, 0.3910016, 1, 1, 1, 1, 1,
0.4389733, -1.274091, 1.060771, 1, 1, 1, 1, 1,
0.442445, -0.5592535, 3.331949, 1, 1, 1, 1, 1,
0.443881, -1.177709, 3.520765, 0, 0, 1, 1, 1,
0.44606, -1.740423, 3.84911, 1, 0, 0, 1, 1,
0.4481237, 1.182297, 0.7341917, 1, 0, 0, 1, 1,
0.4496174, 1.346108, 0.1217507, 1, 0, 0, 1, 1,
0.4516408, -1.564754, 1.078478, 1, 0, 0, 1, 1,
0.4518418, 0.3794542, 0.8759574, 1, 0, 0, 1, 1,
0.4518434, -1.349346, 2.662489, 0, 0, 0, 1, 1,
0.4529324, 0.1369776, 2.958878, 0, 0, 0, 1, 1,
0.464117, -0.2889968, 1.277347, 0, 0, 0, 1, 1,
0.4662639, 0.04838518, 0.5670559, 0, 0, 0, 1, 1,
0.4674839, -1.41454, 1.549489, 0, 0, 0, 1, 1,
0.4687386, 0.3298351, 2.138891, 0, 0, 0, 1, 1,
0.4696662, -0.8421609, 1.817087, 0, 0, 0, 1, 1,
0.4701699, 0.9020328, 0.07282165, 1, 1, 1, 1, 1,
0.4724933, -1.011806, 1.717209, 1, 1, 1, 1, 1,
0.4726977, 2.015163, 0.6960126, 1, 1, 1, 1, 1,
0.473, 0.1908199, 0.9296666, 1, 1, 1, 1, 1,
0.4737288, 0.3100385, 1.20804, 1, 1, 1, 1, 1,
0.4825156, 0.0208433, 0.9609703, 1, 1, 1, 1, 1,
0.4854881, 0.2046523, 0.3861231, 1, 1, 1, 1, 1,
0.4859627, -0.2516001, 1.845693, 1, 1, 1, 1, 1,
0.4908577, -0.6607784, 3.365262, 1, 1, 1, 1, 1,
0.4956177, -0.7398346, 3.050218, 1, 1, 1, 1, 1,
0.4968325, 0.473631, -0.8131708, 1, 1, 1, 1, 1,
0.5040872, -0.06160545, 2.565058, 1, 1, 1, 1, 1,
0.504594, 0.7915571, 0.5717062, 1, 1, 1, 1, 1,
0.505153, 2.270539, -1.022752, 1, 1, 1, 1, 1,
0.5055643, -0.9092187, 2.06798, 1, 1, 1, 1, 1,
0.514899, 1.070927, -0.05374371, 0, 0, 1, 1, 1,
0.5189443, 0.2888592, 0.05857213, 1, 0, 0, 1, 1,
0.5205254, -0.4341899, 0.03721526, 1, 0, 0, 1, 1,
0.5206516, -1.85345, 1.104598, 1, 0, 0, 1, 1,
0.526488, 1.311517, 0.2563066, 1, 0, 0, 1, 1,
0.532073, 0.1091319, 2.024858, 1, 0, 0, 1, 1,
0.5348625, 0.8321711, 1.873399, 0, 0, 0, 1, 1,
0.5377489, 1.188969, 1.035933, 0, 0, 0, 1, 1,
0.5412865, -0.3493819, 3.187505, 0, 0, 0, 1, 1,
0.5423087, -0.0637097, 0.9137911, 0, 0, 0, 1, 1,
0.5446268, 0.2034362, 1.202418, 0, 0, 0, 1, 1,
0.5569175, 0.4098749, 1.353137, 0, 0, 0, 1, 1,
0.5569329, -1.019894, 2.513039, 0, 0, 0, 1, 1,
0.5590271, -1.194214, 1.449946, 1, 1, 1, 1, 1,
0.5607832, -1.658613, 1.334738, 1, 1, 1, 1, 1,
0.5650584, 0.2908404, 0.5156572, 1, 1, 1, 1, 1,
0.5719594, 1.165664, 0.6923392, 1, 1, 1, 1, 1,
0.5731148, -1.592832, 2.857392, 1, 1, 1, 1, 1,
0.5731941, -0.2856435, 1.850033, 1, 1, 1, 1, 1,
0.5742798, -2.227313, 1.737922, 1, 1, 1, 1, 1,
0.5753881, -1.029945, 1.860182, 1, 1, 1, 1, 1,
0.5771077, 0.3255013, 0.6478848, 1, 1, 1, 1, 1,
0.5812837, -0.7543316, 2.262261, 1, 1, 1, 1, 1,
0.5820326, -1.278378, 1.607363, 1, 1, 1, 1, 1,
0.5844389, -1.946082, 2.037877, 1, 1, 1, 1, 1,
0.5922793, 0.269696, 1.313148, 1, 1, 1, 1, 1,
0.5939889, -1.508051, 2.200446, 1, 1, 1, 1, 1,
0.5988724, -0.3480914, 1.669439, 1, 1, 1, 1, 1,
0.6026711, 0.5217205, 0.8996399, 0, 0, 1, 1, 1,
0.604678, 1.269247, 0.4511475, 1, 0, 0, 1, 1,
0.608358, 0.6295826, -0.2455274, 1, 0, 0, 1, 1,
0.60877, -1.779408, 3.247923, 1, 0, 0, 1, 1,
0.6160873, -2.598986, 4.492902, 1, 0, 0, 1, 1,
0.6171505, -1.237704, 3.392899, 1, 0, 0, 1, 1,
0.6256043, -0.9353663, 1.813869, 0, 0, 0, 1, 1,
0.6318285, -0.5213343, 1.322099, 0, 0, 0, 1, 1,
0.6328815, -0.5917325, 1.940673, 0, 0, 0, 1, 1,
0.6339722, -1.140588, 1.840326, 0, 0, 0, 1, 1,
0.6394643, -0.6292831, 2.725815, 0, 0, 0, 1, 1,
0.639479, -0.5851441, 1.207169, 0, 0, 0, 1, 1,
0.642785, -1.694076, 2.412665, 0, 0, 0, 1, 1,
0.6490111, -0.9232385, 1.432819, 1, 1, 1, 1, 1,
0.6520718, -2.8627, 2.137432, 1, 1, 1, 1, 1,
0.6556965, -1.484574, 2.649357, 1, 1, 1, 1, 1,
0.6571177, 1.692061, -0.3336757, 1, 1, 1, 1, 1,
0.6576152, 0.5938615, -0.1022318, 1, 1, 1, 1, 1,
0.6583562, 0.5046604, -0.5818788, 1, 1, 1, 1, 1,
0.6657433, -1.100334, 2.419961, 1, 1, 1, 1, 1,
0.6660037, -0.7685639, 1.886952, 1, 1, 1, 1, 1,
0.6674977, -0.8647183, 3.77828, 1, 1, 1, 1, 1,
0.6706789, 1.673332, -0.5894613, 1, 1, 1, 1, 1,
0.6711316, -0.3588922, 1.968749, 1, 1, 1, 1, 1,
0.6712701, -1.445314, 2.864139, 1, 1, 1, 1, 1,
0.671935, -1.844658, 2.303334, 1, 1, 1, 1, 1,
0.675213, 1.352092, -0.9607149, 1, 1, 1, 1, 1,
0.6852402, -1.069105, 2.716801, 1, 1, 1, 1, 1,
0.6869217, 0.3823256, 0.5957402, 0, 0, 1, 1, 1,
0.688617, -1.318534, 1.69711, 1, 0, 0, 1, 1,
0.6931937, 0.7701819, 1.650122, 1, 0, 0, 1, 1,
0.7019159, 0.9406399, 0.2336429, 1, 0, 0, 1, 1,
0.7019234, -0.03251624, 1.065014, 1, 0, 0, 1, 1,
0.7019355, -1.179861, 0.779109, 1, 0, 0, 1, 1,
0.7050655, 0.1731944, 0.4980132, 0, 0, 0, 1, 1,
0.7052019, 1.432055, 2.786988, 0, 0, 0, 1, 1,
0.7161975, 0.547581, 1.991842, 0, 0, 0, 1, 1,
0.7225521, 0.3435786, 1.607894, 0, 0, 0, 1, 1,
0.7269716, -1.030136, 2.726322, 0, 0, 0, 1, 1,
0.7308663, 0.4029295, -0.005734359, 0, 0, 0, 1, 1,
0.7336764, 0.9100865, 0.5087447, 0, 0, 0, 1, 1,
0.7380864, 0.7619867, 1.501819, 1, 1, 1, 1, 1,
0.7390606, 0.3740964, -0.2488527, 1, 1, 1, 1, 1,
0.7460735, 0.03741455, 2.144845, 1, 1, 1, 1, 1,
0.7483224, 0.5493784, -1.52168, 1, 1, 1, 1, 1,
0.7502931, -1.315152, 3.645511, 1, 1, 1, 1, 1,
0.7522014, -0.6845962, 3.733152, 1, 1, 1, 1, 1,
0.7543646, 0.5437574, 0.4979602, 1, 1, 1, 1, 1,
0.7558015, -1.609918, 3.360245, 1, 1, 1, 1, 1,
0.765117, 0.4506095, 0.5465561, 1, 1, 1, 1, 1,
0.7699088, -1.164967, 2.843658, 1, 1, 1, 1, 1,
0.7817836, -0.01238372, 1.120705, 1, 1, 1, 1, 1,
0.7824368, 0.06039181, 1.580482, 1, 1, 1, 1, 1,
0.7840618, 2.263753, -0.919472, 1, 1, 1, 1, 1,
0.7848077, 1.178656, -1.138643, 1, 1, 1, 1, 1,
0.7898786, -0.3237719, 2.428356, 1, 1, 1, 1, 1,
0.7955703, -0.5122119, 0.7408696, 0, 0, 1, 1, 1,
0.7982455, -0.8395133, 1.982186, 1, 0, 0, 1, 1,
0.8002995, 0.5508177, -0.7556564, 1, 0, 0, 1, 1,
0.8022686, -2.313562, 3.632578, 1, 0, 0, 1, 1,
0.8029698, 0.03558107, 2.936203, 1, 0, 0, 1, 1,
0.8043565, -1.546251, 3.994142, 1, 0, 0, 1, 1,
0.8087896, -0.7151793, 2.201375, 0, 0, 0, 1, 1,
0.8090646, -0.7719798, 3.36541, 0, 0, 0, 1, 1,
0.8147184, 0.4228428, 0.201066, 0, 0, 0, 1, 1,
0.8149123, 0.5698904, -0.7052531, 0, 0, 0, 1, 1,
0.8170223, -1.383066, 2.386468, 0, 0, 0, 1, 1,
0.8198292, 0.2194347, 0.712472, 0, 0, 0, 1, 1,
0.8229259, 1.031371, 0.9036567, 0, 0, 0, 1, 1,
0.8285522, -0.8815361, 2.764535, 1, 1, 1, 1, 1,
0.8318809, 1.167145, 0.1530902, 1, 1, 1, 1, 1,
0.839806, -0.9429843, 4.530134, 1, 1, 1, 1, 1,
0.8407096, 0.5461512, 1.295556, 1, 1, 1, 1, 1,
0.8490133, -1.20699, 0.3105286, 1, 1, 1, 1, 1,
0.851012, 1.438192, 0.8833956, 1, 1, 1, 1, 1,
0.8617227, -0.1307977, 0.6108556, 1, 1, 1, 1, 1,
0.8654597, 0.6885641, -0.06664848, 1, 1, 1, 1, 1,
0.8669862, -1.785867, 2.020452, 1, 1, 1, 1, 1,
0.870182, 1.652773, -0.4619529, 1, 1, 1, 1, 1,
0.8763741, 0.1457419, 2.198803, 1, 1, 1, 1, 1,
0.8766466, 0.001627396, 0.02963359, 1, 1, 1, 1, 1,
0.8824366, -1.118311, 1.931198, 1, 1, 1, 1, 1,
0.8911518, 0.7926229, 1.960869, 1, 1, 1, 1, 1,
0.8928373, -0.06588297, 0.9827901, 1, 1, 1, 1, 1,
0.894619, -2.827026, 3.009972, 0, 0, 1, 1, 1,
0.8959957, -0.6156305, 1.113885, 1, 0, 0, 1, 1,
0.896284, 1.044907, 1.495642, 1, 0, 0, 1, 1,
0.9022421, -0.5697918, 0.8962821, 1, 0, 0, 1, 1,
0.9038637, 0.4223919, 0.7518337, 1, 0, 0, 1, 1,
0.9117194, 0.3127694, -0.4941913, 1, 0, 0, 1, 1,
0.9156213, -1.400506, 2.327966, 0, 0, 0, 1, 1,
0.9214265, 0.4289391, 1.514601, 0, 0, 0, 1, 1,
0.9243024, 2.071417, -0.1092695, 0, 0, 0, 1, 1,
0.924378, 0.04925407, -0.2029387, 0, 0, 0, 1, 1,
0.9248209, 0.4780397, 1.666031, 0, 0, 0, 1, 1,
0.925694, 0.3490843, 3.482308, 0, 0, 0, 1, 1,
0.9261248, 1.734695, -0.2477837, 0, 0, 0, 1, 1,
0.9309682, -1.376274, 0.6071922, 1, 1, 1, 1, 1,
0.9343849, -0.7331087, 3.047814, 1, 1, 1, 1, 1,
0.9377134, -0.6783163, 1.045306, 1, 1, 1, 1, 1,
0.9422614, 0.7510234, 2.385389, 1, 1, 1, 1, 1,
0.9463712, 1.348337, 1.47254, 1, 1, 1, 1, 1,
0.9469339, -0.1028031, 1.517443, 1, 1, 1, 1, 1,
0.9515307, 0.793012, 0.1041035, 1, 1, 1, 1, 1,
0.9526115, 2.177464, 0.9080849, 1, 1, 1, 1, 1,
0.9573252, 1.925102, 2.157871, 1, 1, 1, 1, 1,
0.9599459, -1.199838, 3.086289, 1, 1, 1, 1, 1,
0.9648262, 0.131178, 2.387635, 1, 1, 1, 1, 1,
0.9799299, 0.04521529, 1.297379, 1, 1, 1, 1, 1,
0.9844505, -0.2656438, 1.941033, 1, 1, 1, 1, 1,
0.9905041, 0.6916895, 0.6853427, 1, 1, 1, 1, 1,
0.9949566, 0.7084658, 1.116829, 1, 1, 1, 1, 1,
0.9962111, 1.763425, 1.854393, 0, 0, 1, 1, 1,
0.9978678, -0.7893953, 2.056576, 1, 0, 0, 1, 1,
1.001471, -0.6374217, 2.422068, 1, 0, 0, 1, 1,
1.003001, -0.4697221, 3.759985, 1, 0, 0, 1, 1,
1.006933, 0.4344567, 1.032372, 1, 0, 0, 1, 1,
1.021113, -1.175052, 3.218998, 1, 0, 0, 1, 1,
1.023816, 0.3338961, 0.5804723, 0, 0, 0, 1, 1,
1.024334, 0.7401651, 1.059638, 0, 0, 0, 1, 1,
1.024437, 0.7763829, 1.017997, 0, 0, 0, 1, 1,
1.029186, 0.3780466, 1.044487, 0, 0, 0, 1, 1,
1.031235, -1.313651, 2.653809, 0, 0, 0, 1, 1,
1.040188, 0.5869393, 2.062813, 0, 0, 0, 1, 1,
1.040887, 0.8185221, 1.372444, 0, 0, 0, 1, 1,
1.041582, 0.9969465, 1.027614, 1, 1, 1, 1, 1,
1.044071, 1.178676, -0.6578841, 1, 1, 1, 1, 1,
1.044383, -0.1941411, 1.553972, 1, 1, 1, 1, 1,
1.049224, -0.8929643, 2.679412, 1, 1, 1, 1, 1,
1.063552, -2.054884, 3.865717, 1, 1, 1, 1, 1,
1.06573, 0.002292516, 3.638595, 1, 1, 1, 1, 1,
1.065797, -0.3427768, -0.4009492, 1, 1, 1, 1, 1,
1.06823, 2.431351, 2.429286, 1, 1, 1, 1, 1,
1.069528, -1.886672, 3.689692, 1, 1, 1, 1, 1,
1.070261, 0.8797269, 0.1416313, 1, 1, 1, 1, 1,
1.073998, 0.904524, 0.8664066, 1, 1, 1, 1, 1,
1.079737, -1.382207, 2.107505, 1, 1, 1, 1, 1,
1.083312, -0.7941909, 0.3828222, 1, 1, 1, 1, 1,
1.09041, 3.112316, -0.0593527, 1, 1, 1, 1, 1,
1.093552, 0.9943355, 1.401588, 1, 1, 1, 1, 1,
1.097852, -0.3613093, 2.413164, 0, 0, 1, 1, 1,
1.10264, -0.195898, 0.8103092, 1, 0, 0, 1, 1,
1.104162, 1.57409, -0.1641187, 1, 0, 0, 1, 1,
1.110624, 0.17338, 1.959626, 1, 0, 0, 1, 1,
1.116334, -1.357993, 3.360123, 1, 0, 0, 1, 1,
1.125154, -1.829957, 1.382757, 1, 0, 0, 1, 1,
1.132609, 0.6846727, 0.3502069, 0, 0, 0, 1, 1,
1.133617, 0.6667716, 0.5929437, 0, 0, 0, 1, 1,
1.136322, -1.184973, 3.264668, 0, 0, 0, 1, 1,
1.141971, 1.810457, 2.777536, 0, 0, 0, 1, 1,
1.143492, -0.8012054, 2.549918, 0, 0, 0, 1, 1,
1.144483, 0.2788057, 1.879076, 0, 0, 0, 1, 1,
1.148785, -2.249312, 2.72835, 0, 0, 0, 1, 1,
1.157058, -0.7198241, 1.332157, 1, 1, 1, 1, 1,
1.158449, -0.7695754, 3.099754, 1, 1, 1, 1, 1,
1.158973, 0.281256, 3.449395, 1, 1, 1, 1, 1,
1.177085, -0.7831517, 0.8500545, 1, 1, 1, 1, 1,
1.181999, 0.863396, 2.663156, 1, 1, 1, 1, 1,
1.196061, 0.7355838, 1.555633, 1, 1, 1, 1, 1,
1.201565, -1.416055, 1.307496, 1, 1, 1, 1, 1,
1.203973, 0.9094799, 0.06743976, 1, 1, 1, 1, 1,
1.208866, 0.3846667, 1.64263, 1, 1, 1, 1, 1,
1.214173, 0.8934423, -0.7686976, 1, 1, 1, 1, 1,
1.217117, 0.3447643, -0.1383197, 1, 1, 1, 1, 1,
1.218864, -0.07500064, 2.347768, 1, 1, 1, 1, 1,
1.221081, 1.751016, -0.5947933, 1, 1, 1, 1, 1,
1.221431, -0.1298218, 3.982381, 1, 1, 1, 1, 1,
1.2229, -0.2019395, 0.9844505, 1, 1, 1, 1, 1,
1.244863, -0.01947381, 0.5148869, 0, 0, 1, 1, 1,
1.248387, -0.3251156, 2.797693, 1, 0, 0, 1, 1,
1.249508, -0.08179751, 0.7304198, 1, 0, 0, 1, 1,
1.25364, -0.76546, 2.709652, 1, 0, 0, 1, 1,
1.257194, -0.7120275, 2.018082, 1, 0, 0, 1, 1,
1.262748, 0.2160872, 1.956928, 1, 0, 0, 1, 1,
1.280773, -1.431169, 3.969128, 0, 0, 0, 1, 1,
1.295303, 0.8608911, 0.7366263, 0, 0, 0, 1, 1,
1.302036, -0.8107958, 2.024509, 0, 0, 0, 1, 1,
1.314696, 0.5569476, 1.000125, 0, 0, 0, 1, 1,
1.319064, -0.2081514, 1.69625, 0, 0, 0, 1, 1,
1.326715, 0.06506284, 2.209214, 0, 0, 0, 1, 1,
1.327571, 1.470728, -0.3662773, 0, 0, 0, 1, 1,
1.338211, -0.001513983, 2.013147, 1, 1, 1, 1, 1,
1.338215, 1.437873, 1.535629, 1, 1, 1, 1, 1,
1.344148, -0.1308358, 3.007897, 1, 1, 1, 1, 1,
1.361509, -1.471968, 3.083427, 1, 1, 1, 1, 1,
1.365845, -0.1645808, 2.340821, 1, 1, 1, 1, 1,
1.368336, -1.474514, 3.24929, 1, 1, 1, 1, 1,
1.369966, 2.179757, 0.4812266, 1, 1, 1, 1, 1,
1.386718, -0.2520704, 3.931359, 1, 1, 1, 1, 1,
1.406347, -1.127377, 2.251399, 1, 1, 1, 1, 1,
1.418587, 0.2874558, -0.4864744, 1, 1, 1, 1, 1,
1.426071, 0.05494634, 1.775585, 1, 1, 1, 1, 1,
1.426324, -0.9231349, 2.014923, 1, 1, 1, 1, 1,
1.428876, -0.3525821, 1.81818, 1, 1, 1, 1, 1,
1.434033, 0.7539634, 1.816611, 1, 1, 1, 1, 1,
1.436665, 1.045128, 1.26515, 1, 1, 1, 1, 1,
1.439646, -0.6488789, 1.391246, 0, 0, 1, 1, 1,
1.451455, -0.3412633, 2.518378, 1, 0, 0, 1, 1,
1.460325, 1.539071, 0.4408733, 1, 0, 0, 1, 1,
1.461378, 1.795569, 1.892919, 1, 0, 0, 1, 1,
1.468848, 1.141675, 2.440787, 1, 0, 0, 1, 1,
1.468854, -0.3499713, 2.801495, 1, 0, 0, 1, 1,
1.469784, -0.1894035, 1.454726, 0, 0, 0, 1, 1,
1.481162, -0.8134168, 1.700453, 0, 0, 0, 1, 1,
1.492535, 0.3498485, 3.08058, 0, 0, 0, 1, 1,
1.499397, -1.161624, 2.15025, 0, 0, 0, 1, 1,
1.505252, -0.2200345, 3.904577, 0, 0, 0, 1, 1,
1.508479, 0.00767968, 2.280066, 0, 0, 0, 1, 1,
1.511718, -1.533664, 4.092382, 0, 0, 0, 1, 1,
1.515182, -0.1069353, 1.426305, 1, 1, 1, 1, 1,
1.516571, -0.6627398, 2.319445, 1, 1, 1, 1, 1,
1.52537, 0.7782592, 2.216307, 1, 1, 1, 1, 1,
1.525871, 1.737585, 1.557111, 1, 1, 1, 1, 1,
1.528185, 0.4357, 1.197958, 1, 1, 1, 1, 1,
1.536835, -1.608671, 2.068804, 1, 1, 1, 1, 1,
1.538519, 0.949492, 0.01881272, 1, 1, 1, 1, 1,
1.540159, 1.217726, 3.74104, 1, 1, 1, 1, 1,
1.545852, -0.8961493, 2.038881, 1, 1, 1, 1, 1,
1.561872, -1.30884, 2.313884, 1, 1, 1, 1, 1,
1.576602, -0.7447442, 1.102406, 1, 1, 1, 1, 1,
1.589943, -2.037564, 1.904202, 1, 1, 1, 1, 1,
1.597392, 0.8158038, 1.610369, 1, 1, 1, 1, 1,
1.600158, 0.6925984, 1.829111, 1, 1, 1, 1, 1,
1.602233, -0.0432347, 2.78503, 1, 1, 1, 1, 1,
1.614795, -0.6809277, 0.616648, 0, 0, 1, 1, 1,
1.637627, 0.2772763, 1.256672, 1, 0, 0, 1, 1,
1.656501, -1.046823, 0.581541, 1, 0, 0, 1, 1,
1.667202, 0.1804974, 0.7427447, 1, 0, 0, 1, 1,
1.680698, -0.6613119, 1.487693, 1, 0, 0, 1, 1,
1.686034, -0.3539135, 2.564535, 1, 0, 0, 1, 1,
1.689611, -0.4226646, 0.2993374, 0, 0, 0, 1, 1,
1.691603, -0.5472546, 1.149447, 0, 0, 0, 1, 1,
1.705592, -0.1522775, 2.031238, 0, 0, 0, 1, 1,
1.719828, -0.7835094, 1.83689, 0, 0, 0, 1, 1,
1.731208, -0.1127717, 0.2057893, 0, 0, 0, 1, 1,
1.740047, 1.952795, -0.5644085, 0, 0, 0, 1, 1,
1.741244, 1.593948, -1.15232, 0, 0, 0, 1, 1,
1.741446, 1.087039, 0.2710479, 1, 1, 1, 1, 1,
1.750187, 1.805057, -0.2653772, 1, 1, 1, 1, 1,
1.763882, 0.2452154, 2.037069, 1, 1, 1, 1, 1,
1.790239, 0.03692697, 0.7344162, 1, 1, 1, 1, 1,
1.807751, 1.752526, 0.9671833, 1, 1, 1, 1, 1,
1.809062, 0.109029, 2.517164, 1, 1, 1, 1, 1,
1.819079, -0.751015, 3.940395, 1, 1, 1, 1, 1,
1.880605, 1.121404, 0.4466258, 1, 1, 1, 1, 1,
1.904741, -1.074718, 2.075598, 1, 1, 1, 1, 1,
1.951989, 0.4155402, 1.176849, 1, 1, 1, 1, 1,
1.954787, 0.7770765, 2.650863, 1, 1, 1, 1, 1,
2.002521, -1.551328, 1.705255, 1, 1, 1, 1, 1,
2.006491, -0.4752598, 2.142437, 1, 1, 1, 1, 1,
2.033578, 0.1269322, 2.679269, 1, 1, 1, 1, 1,
2.036156, -0.815, 1.341818, 1, 1, 1, 1, 1,
2.038273, -0.3223296, 0.2335813, 0, 0, 1, 1, 1,
2.064614, 0.0179809, 0.9375651, 1, 0, 0, 1, 1,
2.076213, 0.5646755, 2.762256, 1, 0, 0, 1, 1,
2.098452, -1.543779, 1.574657, 1, 0, 0, 1, 1,
2.118531, 1.511837, 1.420394, 1, 0, 0, 1, 1,
2.168484, 1.925674, 1.727534, 1, 0, 0, 1, 1,
2.212923, 0.001438467, 0.8528115, 0, 0, 0, 1, 1,
2.21735, -1.356325, 3.074915, 0, 0, 0, 1, 1,
2.247953, 1.164328, 2.894041, 0, 0, 0, 1, 1,
2.255908, 1.292742, -0.304286, 0, 0, 0, 1, 1,
2.286013, -0.1485853, 0.6795125, 0, 0, 0, 1, 1,
2.336926, 0.7375248, 1.650569, 0, 0, 0, 1, 1,
2.468162, -1.054129, 1.039869, 0, 0, 0, 1, 1,
2.468603, -0.2364542, 0.9089749, 1, 1, 1, 1, 1,
2.561547, -0.05704466, 2.372155, 1, 1, 1, 1, 1,
2.581357, -0.02048677, 1.013139, 1, 1, 1, 1, 1,
2.656592, -2.028028, 1.403065, 1, 1, 1, 1, 1,
2.723481, 0.5397725, 0.8235848, 1, 1, 1, 1, 1,
2.924342, 0.8730122, 1.564138, 1, 1, 1, 1, 1,
2.947906, 0.7618436, 1.204657, 1, 1, 1, 1, 1
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
var radius = 9.69449;
var distance = 34.05148;
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
mvMatrix.translate( 0.4016945, -0.06563461, 0.1501734 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05148);
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
