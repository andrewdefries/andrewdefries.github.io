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
-2.830889, 1.189974, -1.251453, 1, 0, 0, 1,
-2.804176, -0.1237492, -1.302151, 1, 0.007843138, 0, 1,
-2.770643, 0.1723744, -1.268089, 1, 0.01176471, 0, 1,
-2.570616, 0.1788266, -0.6044148, 1, 0.01960784, 0, 1,
-2.556798, -0.648721, -1.363164, 1, 0.02352941, 0, 1,
-2.434758, -0.1714139, -0.7050365, 1, 0.03137255, 0, 1,
-2.422018, 1.499095, -0.9324782, 1, 0.03529412, 0, 1,
-2.345793, 0.3175252, -0.7112259, 1, 0.04313726, 0, 1,
-2.314414, -0.6932744, -1.96801, 1, 0.04705882, 0, 1,
-2.281173, -1.400202, -1.288967, 1, 0.05490196, 0, 1,
-2.272157, 0.6241654, -2.044248, 1, 0.05882353, 0, 1,
-2.24988, -0.8250117, -1.613294, 1, 0.06666667, 0, 1,
-2.225234, -1.606581, -1.405501, 1, 0.07058824, 0, 1,
-2.185603, -1.211638, -1.012177, 1, 0.07843138, 0, 1,
-2.172143, 1.81734, -2.215036, 1, 0.08235294, 0, 1,
-2.164699, 1.725024, -1.543506, 1, 0.09019608, 0, 1,
-2.150291, 0.06423868, -1.478824, 1, 0.09411765, 0, 1,
-2.137186, -0.9181312, -4.19302, 1, 0.1019608, 0, 1,
-2.127334, 0.7032056, -0.7311891, 1, 0.1098039, 0, 1,
-2.050876, 0.5067087, -3.760735, 1, 0.1137255, 0, 1,
-2.049513, -0.815283, -1.978772, 1, 0.1215686, 0, 1,
-2.034277, 0.3864437, -1.739942, 1, 0.1254902, 0, 1,
-2.003015, -0.01578653, -2.658166, 1, 0.1333333, 0, 1,
-2.000562, -0.4120053, -1.415671, 1, 0.1372549, 0, 1,
-1.996637, 0.4464062, -1.285655, 1, 0.145098, 0, 1,
-1.985025, 0.1206017, -3.147916, 1, 0.1490196, 0, 1,
-1.984212, -0.9183401, -1.976842, 1, 0.1568628, 0, 1,
-1.967202, -0.8649688, -1.882779, 1, 0.1607843, 0, 1,
-1.960568, -0.709915, -1.858983, 1, 0.1686275, 0, 1,
-1.958156, -0.5319901, -0.2155347, 1, 0.172549, 0, 1,
-1.956511, 0.3530062, -1.34933, 1, 0.1803922, 0, 1,
-1.934265, -0.09782459, -1.998569, 1, 0.1843137, 0, 1,
-1.925099, -0.6078582, -3.31518, 1, 0.1921569, 0, 1,
-1.919398, -1.487227, -0.7421336, 1, 0.1960784, 0, 1,
-1.91067, 0.4284808, -1.380691, 1, 0.2039216, 0, 1,
-1.905936, -1.463341, -3.350929, 1, 0.2117647, 0, 1,
-1.889606, 1.180816, -0.2828571, 1, 0.2156863, 0, 1,
-1.882738, -0.1369628, -2.005628, 1, 0.2235294, 0, 1,
-1.881037, 0.3440401, -2.702189, 1, 0.227451, 0, 1,
-1.85437, -0.05714352, -0.8579026, 1, 0.2352941, 0, 1,
-1.834735, 0.9245625, -1.428118, 1, 0.2392157, 0, 1,
-1.826113, 0.299556, -1.136086, 1, 0.2470588, 0, 1,
-1.81962, -1.546097, -2.601591, 1, 0.2509804, 0, 1,
-1.816311, 0.362952, 0.2725799, 1, 0.2588235, 0, 1,
-1.81607, -0.2089825, -2.406796, 1, 0.2627451, 0, 1,
-1.788701, 1.749728, -1.968096, 1, 0.2705882, 0, 1,
-1.782096, -0.8126582, -0.6755345, 1, 0.2745098, 0, 1,
-1.774221, -1.025066, -2.804599, 1, 0.282353, 0, 1,
-1.764369, -0.3012348, -1.733521, 1, 0.2862745, 0, 1,
-1.738708, 0.07898874, -0.7284982, 1, 0.2941177, 0, 1,
-1.723892, 0.4986753, -0.05774106, 1, 0.3019608, 0, 1,
-1.719553, 0.3604803, -0.7539057, 1, 0.3058824, 0, 1,
-1.708162, 1.018187, 0.3685473, 1, 0.3137255, 0, 1,
-1.70071, 2.436682, -1.922171, 1, 0.3176471, 0, 1,
-1.69873, 1.603072, -0.5784463, 1, 0.3254902, 0, 1,
-1.697582, -1.335343, -0.7446144, 1, 0.3294118, 0, 1,
-1.697463, 1.724018, -1.992319, 1, 0.3372549, 0, 1,
-1.693632, 2.428992, -1.222581, 1, 0.3411765, 0, 1,
-1.67257, -0.2640779, 0.3607064, 1, 0.3490196, 0, 1,
-1.663978, -1.025542, -3.186733, 1, 0.3529412, 0, 1,
-1.631089, -1.106553, -0.6323176, 1, 0.3607843, 0, 1,
-1.616699, -1.017576, -2.090702, 1, 0.3647059, 0, 1,
-1.604844, -1.04953, -2.29794, 1, 0.372549, 0, 1,
-1.595174, 0.837963, -0.9144329, 1, 0.3764706, 0, 1,
-1.588689, 0.885115, 0.3834505, 1, 0.3843137, 0, 1,
-1.559014, 0.5668123, -1.631134, 1, 0.3882353, 0, 1,
-1.557453, -0.1015053, -1.328614, 1, 0.3960784, 0, 1,
-1.542261, -0.2818376, -1.791984, 1, 0.4039216, 0, 1,
-1.54124, 0.1015854, -2.889429, 1, 0.4078431, 0, 1,
-1.530384, -1.940685, -2.998897, 1, 0.4156863, 0, 1,
-1.528178, 0.4235147, -2.058978, 1, 0.4196078, 0, 1,
-1.520015, 0.3195734, -1.337703, 1, 0.427451, 0, 1,
-1.518913, 0.3604991, -1.510405, 1, 0.4313726, 0, 1,
-1.509971, 2.389694, -2.332779, 1, 0.4392157, 0, 1,
-1.497769, 1.855364, -2.005134, 1, 0.4431373, 0, 1,
-1.490793, 0.8773219, -1.053834, 1, 0.4509804, 0, 1,
-1.48131, -0.3171954, 0.3317685, 1, 0.454902, 0, 1,
-1.476931, 2.201648, -0.2009263, 1, 0.4627451, 0, 1,
-1.465324, 0.3605906, -0.4633406, 1, 0.4666667, 0, 1,
-1.459029, 0.07216995, -2.040621, 1, 0.4745098, 0, 1,
-1.454924, -0.7732583, -3.642559, 1, 0.4784314, 0, 1,
-1.450532, 0.392949, -1.147308, 1, 0.4862745, 0, 1,
-1.446121, 0.299141, -0.1317617, 1, 0.4901961, 0, 1,
-1.440987, -0.4881264, -0.9648862, 1, 0.4980392, 0, 1,
-1.428553, -0.6184856, -1.582756, 1, 0.5058824, 0, 1,
-1.426103, -0.8574824, -2.166129, 1, 0.509804, 0, 1,
-1.415774, -0.7939016, -1.07667, 1, 0.5176471, 0, 1,
-1.414391, -0.602523, 1.252866, 1, 0.5215687, 0, 1,
-1.413125, -1.047123, -3.109749, 1, 0.5294118, 0, 1,
-1.409108, -0.9846129, -0.4276781, 1, 0.5333334, 0, 1,
-1.389636, -0.2783002, -1.56341, 1, 0.5411765, 0, 1,
-1.357796, 1.067034, -1.004463, 1, 0.5450981, 0, 1,
-1.350397, -1.361302, -2.361065, 1, 0.5529412, 0, 1,
-1.339568, 1.782328, -2.355899, 1, 0.5568628, 0, 1,
-1.337936, -0.3542871, -1.494039, 1, 0.5647059, 0, 1,
-1.32897, 0.09418818, -1.298043, 1, 0.5686275, 0, 1,
-1.327048, 1.309107, -1.848082, 1, 0.5764706, 0, 1,
-1.31436, -0.4892917, -2.59352, 1, 0.5803922, 0, 1,
-1.313804, -1.116285, -1.209532, 1, 0.5882353, 0, 1,
-1.304641, 1.377142, -0.5618296, 1, 0.5921569, 0, 1,
-1.293826, -0.9807469, -3.073062, 1, 0.6, 0, 1,
-1.287542, -1.688995, -1.805182, 1, 0.6078432, 0, 1,
-1.285627, 0.8631565, 0.5238183, 1, 0.6117647, 0, 1,
-1.282418, 1.080853, 0.4015325, 1, 0.6196079, 0, 1,
-1.276491, 0.9490322, -2.809826, 1, 0.6235294, 0, 1,
-1.271858, -0.489624, -2.31385, 1, 0.6313726, 0, 1,
-1.268861, 0.8245363, -0.4091813, 1, 0.6352941, 0, 1,
-1.261297, -1.20241, -3.444277, 1, 0.6431373, 0, 1,
-1.260534, 1.399301, -0.5416685, 1, 0.6470588, 0, 1,
-1.245375, 1.341404, 0.2464197, 1, 0.654902, 0, 1,
-1.241056, 0.1962127, -0.8371261, 1, 0.6588235, 0, 1,
-1.238419, -0.6213571, -1.304829, 1, 0.6666667, 0, 1,
-1.23539, -0.9884168, -1.183403, 1, 0.6705883, 0, 1,
-1.234443, 0.5792899, -1.334347, 1, 0.6784314, 0, 1,
-1.221735, 0.4348656, -1.98482, 1, 0.682353, 0, 1,
-1.221539, -0.8766006, -3.426505, 1, 0.6901961, 0, 1,
-1.218619, 0.397339, -0.3126023, 1, 0.6941177, 0, 1,
-1.213959, -0.04440656, -0.5818061, 1, 0.7019608, 0, 1,
-1.206802, 0.1855894, -0.5618711, 1, 0.7098039, 0, 1,
-1.204249, 0.5093903, -1.221515, 1, 0.7137255, 0, 1,
-1.20168, -0.8438309, -1.892533, 1, 0.7215686, 0, 1,
-1.195159, -0.9263094, -1.290101, 1, 0.7254902, 0, 1,
-1.190272, -0.04484363, -2.826173, 1, 0.7333333, 0, 1,
-1.187623, -0.07665662, -1.073438, 1, 0.7372549, 0, 1,
-1.183641, -0.9965893, -3.260334, 1, 0.7450981, 0, 1,
-1.163823, 0.4040724, 0.2342686, 1, 0.7490196, 0, 1,
-1.163189, 0.0636522, -1.677809, 1, 0.7568628, 0, 1,
-1.162538, 0.6848634, -3.335647, 1, 0.7607843, 0, 1,
-1.141721, -0.2345465, -2.022752, 1, 0.7686275, 0, 1,
-1.135274, 0.173377, -2.983169, 1, 0.772549, 0, 1,
-1.125247, -1.438666, -3.478259, 1, 0.7803922, 0, 1,
-1.122504, -1.136036, -2.40178, 1, 0.7843137, 0, 1,
-1.122302, 0.9871764, -0.3190497, 1, 0.7921569, 0, 1,
-1.107871, -1.170533, -2.62748, 1, 0.7960784, 0, 1,
-1.107348, -1.144234, -4.515762, 1, 0.8039216, 0, 1,
-1.102473, -2.473296, -2.855488, 1, 0.8117647, 0, 1,
-1.094133, 0.7893622, -1.427104, 1, 0.8156863, 0, 1,
-1.084921, 1.01235, -0.6836247, 1, 0.8235294, 0, 1,
-1.08477, 0.05589317, -1.471832, 1, 0.827451, 0, 1,
-1.075262, -0.9988802, -4.183248, 1, 0.8352941, 0, 1,
-1.065528, -1.081866, -3.36343, 1, 0.8392157, 0, 1,
-1.065272, 2.19244, -0.4964421, 1, 0.8470588, 0, 1,
-1.06199, 0.2916687, -1.233423, 1, 0.8509804, 0, 1,
-1.053222, 0.1966184, 0.2625373, 1, 0.8588235, 0, 1,
-1.050947, 0.1634722, -0.2870956, 1, 0.8627451, 0, 1,
-1.045236, 1.330563, -0.1735228, 1, 0.8705882, 0, 1,
-1.042204, 0.1594625, -0.5873795, 1, 0.8745098, 0, 1,
-1.042043, -0.1665089, -1.002625, 1, 0.8823529, 0, 1,
-1.042011, 0.2739469, -1.657122, 1, 0.8862745, 0, 1,
-1.038367, -0.6444359, -1.394858, 1, 0.8941177, 0, 1,
-1.028579, -0.2200352, -1.258084, 1, 0.8980392, 0, 1,
-1.022846, 0.4581144, -1.570762, 1, 0.9058824, 0, 1,
-1.021224, 1.336333, -1.728186, 1, 0.9137255, 0, 1,
-1.019573, -1.217005, -3.670647, 1, 0.9176471, 0, 1,
-1.019048, 0.3137298, -0.2739359, 1, 0.9254902, 0, 1,
-1.013968, -1.249946, -2.880837, 1, 0.9294118, 0, 1,
-1.012002, -0.2986723, -3.328781, 1, 0.9372549, 0, 1,
-1.010435, 1.560529, -0.8481572, 1, 0.9411765, 0, 1,
-1.007044, 2.445035, -0.04122008, 1, 0.9490196, 0, 1,
-0.9974259, -0.5878111, -1.247174, 1, 0.9529412, 0, 1,
-0.9918092, 1.544463, -1.759115, 1, 0.9607843, 0, 1,
-0.9904734, 1.711142, -0.4661158, 1, 0.9647059, 0, 1,
-0.989151, -0.7608258, -1.773586, 1, 0.972549, 0, 1,
-0.9820236, -1.308652, -3.434879, 1, 0.9764706, 0, 1,
-0.9650418, 0.220894, -3.081505, 1, 0.9843137, 0, 1,
-0.9631293, -0.1738164, -3.321305, 1, 0.9882353, 0, 1,
-0.9587639, 1.605307, 0.1302062, 1, 0.9960784, 0, 1,
-0.9578687, 0.7361239, -1.240683, 0.9960784, 1, 0, 1,
-0.9551033, -0.2564197, -1.796039, 0.9921569, 1, 0, 1,
-0.9438727, 0.2272376, -0.7181309, 0.9843137, 1, 0, 1,
-0.9329355, 1.220846, -0.657347, 0.9803922, 1, 0, 1,
-0.927874, 1.151011, -0.8987542, 0.972549, 1, 0, 1,
-0.9264448, -1.324479, -3.443189, 0.9686275, 1, 0, 1,
-0.9199142, -0.1205646, -1.050712, 0.9607843, 1, 0, 1,
-0.9184299, -0.6961163, -1.895259, 0.9568627, 1, 0, 1,
-0.9175977, 1.018945, -0.05678463, 0.9490196, 1, 0, 1,
-0.9071354, -0.1572989, -2.082524, 0.945098, 1, 0, 1,
-0.9060943, -0.5432034, -2.375602, 0.9372549, 1, 0, 1,
-0.9048576, -0.2295663, -3.487467, 0.9333333, 1, 0, 1,
-0.9030496, 0.2657829, -0.6359783, 0.9254902, 1, 0, 1,
-0.902208, 0.863767, -2.59246, 0.9215686, 1, 0, 1,
-0.8984153, -2.291531, -3.887658, 0.9137255, 1, 0, 1,
-0.8897579, 0.4069058, -1.325341, 0.9098039, 1, 0, 1,
-0.8876729, -0.5877076, -0.4623014, 0.9019608, 1, 0, 1,
-0.8870974, -0.1628998, -2.002986, 0.8941177, 1, 0, 1,
-0.8729287, -1.062326, -2.311395, 0.8901961, 1, 0, 1,
-0.8721139, 0.2928883, -1.03417, 0.8823529, 1, 0, 1,
-0.8718095, -0.2032777, -2.577233, 0.8784314, 1, 0, 1,
-0.8657063, 0.934642, 0.08592685, 0.8705882, 1, 0, 1,
-0.8627998, 0.8753625, -0.6460504, 0.8666667, 1, 0, 1,
-0.8558541, -0.883932, -3.272085, 0.8588235, 1, 0, 1,
-0.85382, -0.9958848, -1.794755, 0.854902, 1, 0, 1,
-0.8530667, 1.151101, -0.623373, 0.8470588, 1, 0, 1,
-0.8508068, 0.1615499, -1.429113, 0.8431373, 1, 0, 1,
-0.8506873, -0.3803578, -1.302682, 0.8352941, 1, 0, 1,
-0.8498666, -0.3841612, -0.4523889, 0.8313726, 1, 0, 1,
-0.8465064, 0.06668226, -2.435967, 0.8235294, 1, 0, 1,
-0.8439698, 0.51881, -2.184666, 0.8196079, 1, 0, 1,
-0.8382389, 1.461267, -0.1122567, 0.8117647, 1, 0, 1,
-0.8348939, -0.310925, -1.69001, 0.8078431, 1, 0, 1,
-0.8310952, 0.973129, 0.9055666, 0.8, 1, 0, 1,
-0.8302916, -0.4226694, 0.4090789, 0.7921569, 1, 0, 1,
-0.8262759, -1.86806, -3.044454, 0.7882353, 1, 0, 1,
-0.8251976, -0.5791957, -1.776263, 0.7803922, 1, 0, 1,
-0.8214187, 0.6932161, -0.5267091, 0.7764706, 1, 0, 1,
-0.8192921, 0.8064414, 0.9535625, 0.7686275, 1, 0, 1,
-0.816714, -0.3457313, -3.125661, 0.7647059, 1, 0, 1,
-0.8114123, 1.836251, -1.407121, 0.7568628, 1, 0, 1,
-0.8064954, -0.3573878, -2.613365, 0.7529412, 1, 0, 1,
-0.8050939, -0.203029, -1.452769, 0.7450981, 1, 0, 1,
-0.804365, -2.0389, -3.573905, 0.7411765, 1, 0, 1,
-0.8006068, -0.929688, -4.352982, 0.7333333, 1, 0, 1,
-0.7863592, -1.220333, -3.962418, 0.7294118, 1, 0, 1,
-0.7795999, 0.1701383, -1.51186, 0.7215686, 1, 0, 1,
-0.7705676, 0.2155019, -2.177928, 0.7176471, 1, 0, 1,
-0.7696844, 1.155105, -1.005676, 0.7098039, 1, 0, 1,
-0.7689155, -0.4970855, -3.348927, 0.7058824, 1, 0, 1,
-0.7681405, 1.051134, -0.5246468, 0.6980392, 1, 0, 1,
-0.7657186, -0.21163, -1.454097, 0.6901961, 1, 0, 1,
-0.7657136, 0.01914737, -1.236225, 0.6862745, 1, 0, 1,
-0.7647641, -1.048127, -2.353824, 0.6784314, 1, 0, 1,
-0.7593267, 1.024683, -0.1161992, 0.6745098, 1, 0, 1,
-0.7573854, 0.1998709, -1.743853, 0.6666667, 1, 0, 1,
-0.7563286, -0.9162484, -4.424575, 0.6627451, 1, 0, 1,
-0.7472981, 1.55119, 0.9065748, 0.654902, 1, 0, 1,
-0.7453085, -2.597984, -4.287383, 0.6509804, 1, 0, 1,
-0.7399704, 1.410704, -1.164403, 0.6431373, 1, 0, 1,
-0.7308818, -1.05506, -3.688777, 0.6392157, 1, 0, 1,
-0.7301914, 1.977035, -0.2940064, 0.6313726, 1, 0, 1,
-0.721263, 0.665578, -0.4325126, 0.627451, 1, 0, 1,
-0.7209216, 0.7159631, -0.9153107, 0.6196079, 1, 0, 1,
-0.7143026, 0.6291293, -0.5221129, 0.6156863, 1, 0, 1,
-0.712746, -0.8693988, -2.97212, 0.6078432, 1, 0, 1,
-0.7094929, -1.654616, -1.214138, 0.6039216, 1, 0, 1,
-0.6986375, -0.4156235, -1.282142, 0.5960785, 1, 0, 1,
-0.6960066, 1.828603, -0.511175, 0.5882353, 1, 0, 1,
-0.6955497, -1.344125, -1.008664, 0.5843138, 1, 0, 1,
-0.6836774, 1.020665, -2.008534, 0.5764706, 1, 0, 1,
-0.6713776, -0.1479051, -1.661883, 0.572549, 1, 0, 1,
-0.6647449, 0.3530033, -1.825947, 0.5647059, 1, 0, 1,
-0.6634517, -1.504683, -1.571019, 0.5607843, 1, 0, 1,
-0.6578132, 1.101988, -2.476602, 0.5529412, 1, 0, 1,
-0.6576242, 0.9895671, 1.095395, 0.5490196, 1, 0, 1,
-0.6570587, 1.052305, -2.20333, 0.5411765, 1, 0, 1,
-0.6558511, -0.1109746, 0.7421691, 0.5372549, 1, 0, 1,
-0.6537768, -1.02253, -3.898637, 0.5294118, 1, 0, 1,
-0.6526383, -0.6051882, -1.309954, 0.5254902, 1, 0, 1,
-0.6499134, 0.4088591, -0.830691, 0.5176471, 1, 0, 1,
-0.646203, -0.8434139, -1.488124, 0.5137255, 1, 0, 1,
-0.6310394, -0.6735023, -1.663821, 0.5058824, 1, 0, 1,
-0.6258155, -1.113745, -1.299166, 0.5019608, 1, 0, 1,
-0.6230507, 1.126663, -0.104736, 0.4941176, 1, 0, 1,
-0.6226955, -0.7724655, -1.936649, 0.4862745, 1, 0, 1,
-0.622641, 0.2863403, -1.46876, 0.4823529, 1, 0, 1,
-0.6015621, -0.2951458, -2.073402, 0.4745098, 1, 0, 1,
-0.5902495, 0.876274, -1.081308, 0.4705882, 1, 0, 1,
-0.5902348, -0.3252023, -2.640568, 0.4627451, 1, 0, 1,
-0.5890571, -0.5367289, -2.723154, 0.4588235, 1, 0, 1,
-0.586993, -0.3157002, -1.852344, 0.4509804, 1, 0, 1,
-0.5861151, -0.3436828, 0.5033116, 0.4470588, 1, 0, 1,
-0.5763509, 0.7735341, -2.085873, 0.4392157, 1, 0, 1,
-0.5743447, 0.7793943, -0.4172395, 0.4352941, 1, 0, 1,
-0.569089, -1.405389, -3.154876, 0.427451, 1, 0, 1,
-0.5597742, -2.186168, -4.786325, 0.4235294, 1, 0, 1,
-0.5583856, 0.9648989, -2.295609, 0.4156863, 1, 0, 1,
-0.5551461, -1.113425, -2.457779, 0.4117647, 1, 0, 1,
-0.5492101, -1.543656, -3.711686, 0.4039216, 1, 0, 1,
-0.5425332, -0.3383759, -2.697186, 0.3960784, 1, 0, 1,
-0.5393177, 1.157899, -0.1888719, 0.3921569, 1, 0, 1,
-0.5339143, -0.7319524, -4.506802, 0.3843137, 1, 0, 1,
-0.5276482, -0.702237, -1.359439, 0.3803922, 1, 0, 1,
-0.5241854, -0.9947574, -1.870487, 0.372549, 1, 0, 1,
-0.5219155, 0.8465889, -1.68227, 0.3686275, 1, 0, 1,
-0.5213631, -0.4150439, -2.21251, 0.3607843, 1, 0, 1,
-0.5188983, -0.1036693, -0.6307914, 0.3568628, 1, 0, 1,
-0.5158567, -0.5193335, -2.941718, 0.3490196, 1, 0, 1,
-0.5154542, -1.003047, -2.920385, 0.345098, 1, 0, 1,
-0.510602, -0.08243305, -2.351619, 0.3372549, 1, 0, 1,
-0.5102219, 1.341017, -0.4860159, 0.3333333, 1, 0, 1,
-0.5028238, -0.2493514, -0.3544683, 0.3254902, 1, 0, 1,
-0.502501, 1.803769, 0.3597589, 0.3215686, 1, 0, 1,
-0.50246, -0.05935625, -2.670079, 0.3137255, 1, 0, 1,
-0.5012352, -0.1624066, -0.7820548, 0.3098039, 1, 0, 1,
-0.5012178, -0.5428801, -1.381353, 0.3019608, 1, 0, 1,
-0.500913, -1.81692, -2.175449, 0.2941177, 1, 0, 1,
-0.4975823, 0.5863791, -0.8176981, 0.2901961, 1, 0, 1,
-0.4970669, -0.7041655, -2.594984, 0.282353, 1, 0, 1,
-0.4840567, 0.376471, 0.2989831, 0.2784314, 1, 0, 1,
-0.482217, -0.223224, -0.5185962, 0.2705882, 1, 0, 1,
-0.4817166, -1.093525, -2.214866, 0.2666667, 1, 0, 1,
-0.4793726, -0.5174512, -2.267361, 0.2588235, 1, 0, 1,
-0.4696234, 0.1971591, -1.195061, 0.254902, 1, 0, 1,
-0.4687368, 0.5380925, -0.4021914, 0.2470588, 1, 0, 1,
-0.4655722, -0.4946436, -3.877084, 0.2431373, 1, 0, 1,
-0.4627381, 1.388353, 0.3480438, 0.2352941, 1, 0, 1,
-0.4614586, 1.128016, -0.5751197, 0.2313726, 1, 0, 1,
-0.4559498, -1.150628, -2.233268, 0.2235294, 1, 0, 1,
-0.4530003, -1.871133, -2.35639, 0.2196078, 1, 0, 1,
-0.4517882, 0.6727313, -1.40791, 0.2117647, 1, 0, 1,
-0.4517845, -1.433517, -3.393774, 0.2078431, 1, 0, 1,
-0.4475412, -0.1380573, -2.784415, 0.2, 1, 0, 1,
-0.4454033, 1.126654, -1.852452, 0.1921569, 1, 0, 1,
-0.4441794, -0.4302818, -3.089026, 0.1882353, 1, 0, 1,
-0.4423517, -0.2239755, -1.998559, 0.1803922, 1, 0, 1,
-0.440484, -0.3987747, -1.347586, 0.1764706, 1, 0, 1,
-0.4349392, 0.3801599, -1.897595, 0.1686275, 1, 0, 1,
-0.4317562, -0.8922085, -3.016991, 0.1647059, 1, 0, 1,
-0.4267238, -0.07893153, -1.866205, 0.1568628, 1, 0, 1,
-0.4237402, -0.2407389, -3.512724, 0.1529412, 1, 0, 1,
-0.4204036, -0.654616, -3.111682, 0.145098, 1, 0, 1,
-0.4201878, 1.150515, -0.6256732, 0.1411765, 1, 0, 1,
-0.4198945, -0.1308703, -4.94371, 0.1333333, 1, 0, 1,
-0.4175862, -0.4630876, -3.62197, 0.1294118, 1, 0, 1,
-0.4109905, -0.09600613, -0.5774009, 0.1215686, 1, 0, 1,
-0.4041458, -0.4815696, -3.467843, 0.1176471, 1, 0, 1,
-0.4027239, 2.494195, -0.9396332, 0.1098039, 1, 0, 1,
-0.4002411, 0.3165112, -0.9867885, 0.1058824, 1, 0, 1,
-0.3996372, -2.399286, -2.228464, 0.09803922, 1, 0, 1,
-0.3960437, -0.1646157, -2.08943, 0.09019608, 1, 0, 1,
-0.3947714, -0.5538828, -3.352051, 0.08627451, 1, 0, 1,
-0.3915312, -0.08559414, -2.024442, 0.07843138, 1, 0, 1,
-0.3869032, -0.9389601, -3.706823, 0.07450981, 1, 0, 1,
-0.3846404, 0.4168782, -1.965678, 0.06666667, 1, 0, 1,
-0.3799959, -0.6580408, -2.870358, 0.0627451, 1, 0, 1,
-0.3790458, 2.211601, -1.067839, 0.05490196, 1, 0, 1,
-0.3771145, -1.800693, -1.224347, 0.05098039, 1, 0, 1,
-0.3763466, 0.9390118, -1.517077, 0.04313726, 1, 0, 1,
-0.37336, 1.807589, 0.0601899, 0.03921569, 1, 0, 1,
-0.3714726, 0.9014269, -0.3482521, 0.03137255, 1, 0, 1,
-0.3687811, 0.04467344, -1.593875, 0.02745098, 1, 0, 1,
-0.3648955, -0.352952, -2.646709, 0.01960784, 1, 0, 1,
-0.3615499, -0.8966001, -2.936407, 0.01568628, 1, 0, 1,
-0.3583187, 1.021964, -1.859126, 0.007843138, 1, 0, 1,
-0.357409, 1.696918, 0.5425589, 0.003921569, 1, 0, 1,
-0.3561175, 0.9608216, -0.5536675, 0, 1, 0.003921569, 1,
-0.3534153, -0.2793417, -2.597391, 0, 1, 0.01176471, 1,
-0.3480921, 0.1188883, -1.043147, 0, 1, 0.01568628, 1,
-0.3412351, -0.6382012, -0.6769383, 0, 1, 0.02352941, 1,
-0.34032, 0.2253017, 0.2935327, 0, 1, 0.02745098, 1,
-0.336169, -1.658593, -3.451008, 0, 1, 0.03529412, 1,
-0.3360864, 0.5746511, -0.2128505, 0, 1, 0.03921569, 1,
-0.3339199, 0.4197567, -0.1238307, 0, 1, 0.04705882, 1,
-0.3311289, 0.1107434, 0.5685409, 0, 1, 0.05098039, 1,
-0.3309035, -1.587787, -4.504483, 0, 1, 0.05882353, 1,
-0.3302256, 0.1496139, -2.740629, 0, 1, 0.0627451, 1,
-0.3235359, -2.204247, -3.300263, 0, 1, 0.07058824, 1,
-0.3222973, 1.386798, 0.4986664, 0, 1, 0.07450981, 1,
-0.3132808, -0.7072334, -1.567921, 0, 1, 0.08235294, 1,
-0.3127388, 0.8173181, 1.72014, 0, 1, 0.08627451, 1,
-0.3121821, -0.847676, -2.027075, 0, 1, 0.09411765, 1,
-0.3104111, 0.6264071, -0.02034469, 0, 1, 0.1019608, 1,
-0.3086982, -0.3105631, -2.011956, 0, 1, 0.1058824, 1,
-0.3073422, -0.5625787, -2.8017, 0, 1, 0.1137255, 1,
-0.3067931, 1.804386, -1.353081, 0, 1, 0.1176471, 1,
-0.3066682, -0.2075941, -2.357747, 0, 1, 0.1254902, 1,
-0.3052887, -0.8801988, -4.210329, 0, 1, 0.1294118, 1,
-0.3048221, -0.5637327, -3.269647, 0, 1, 0.1372549, 1,
-0.3046159, -1.60921, -3.043328, 0, 1, 0.1411765, 1,
-0.3010287, -0.3242216, -2.199656, 0, 1, 0.1490196, 1,
-0.2988617, -0.1652565, -2.124974, 0, 1, 0.1529412, 1,
-0.2981583, -0.9760904, -3.341987, 0, 1, 0.1607843, 1,
-0.2906454, 0.952574, 0.4470547, 0, 1, 0.1647059, 1,
-0.2881432, 1.418521, -0.03084958, 0, 1, 0.172549, 1,
-0.2844274, -0.1100617, -2.774751, 0, 1, 0.1764706, 1,
-0.2837318, 0.4952196, -0.8897974, 0, 1, 0.1843137, 1,
-0.2791597, 1.586143, 0.4964821, 0, 1, 0.1882353, 1,
-0.2728915, 0.9854714, -0.3490554, 0, 1, 0.1960784, 1,
-0.2724164, 1.041022, 1.941327, 0, 1, 0.2039216, 1,
-0.271314, -0.9326725, -1.415645, 0, 1, 0.2078431, 1,
-0.2710062, -0.1577974, -2.577509, 0, 1, 0.2156863, 1,
-0.2704291, 1.063627, 0.2533654, 0, 1, 0.2196078, 1,
-0.2697262, 0.6006228, -0.4973368, 0, 1, 0.227451, 1,
-0.2660657, 0.2085694, -2.331557, 0, 1, 0.2313726, 1,
-0.2614706, 0.04175647, -2.371729, 0, 1, 0.2392157, 1,
-0.2601015, 0.6813897, 1.308631, 0, 1, 0.2431373, 1,
-0.2597105, 1.039959, 0.1206086, 0, 1, 0.2509804, 1,
-0.2595074, -1.763125, -4.05671, 0, 1, 0.254902, 1,
-0.2535854, -0.3067404, -4.070155, 0, 1, 0.2627451, 1,
-0.2533106, -0.1575567, -1.36299, 0, 1, 0.2666667, 1,
-0.2476705, -0.8221712, -2.512103, 0, 1, 0.2745098, 1,
-0.2470039, -0.6783788, -2.767827, 0, 1, 0.2784314, 1,
-0.2456439, -2.193711, -4.28957, 0, 1, 0.2862745, 1,
-0.2451744, -1.052338, -2.27392, 0, 1, 0.2901961, 1,
-0.243675, 0.9756283, 0.04891495, 0, 1, 0.2980392, 1,
-0.2412675, 2.005087, 0.619095, 0, 1, 0.3058824, 1,
-0.2409887, 0.8888565, -0.2734148, 0, 1, 0.3098039, 1,
-0.2398259, -0.9514859, -1.666319, 0, 1, 0.3176471, 1,
-0.2385122, -0.4585542, -3.225776, 0, 1, 0.3215686, 1,
-0.2380626, -0.3813618, -3.094105, 0, 1, 0.3294118, 1,
-0.2378658, -0.5568147, -3.473895, 0, 1, 0.3333333, 1,
-0.2349075, -0.1049016, -3.415756, 0, 1, 0.3411765, 1,
-0.2343936, 0.538972, 0.6838969, 0, 1, 0.345098, 1,
-0.2332618, 1.555686, -0.842118, 0, 1, 0.3529412, 1,
-0.2290763, -0.08096369, -0.84268, 0, 1, 0.3568628, 1,
-0.2289304, -0.6900089, -2.2556, 0, 1, 0.3647059, 1,
-0.2280979, -0.5807906, -1.844621, 0, 1, 0.3686275, 1,
-0.2245657, -0.5994866, -2.151507, 0, 1, 0.3764706, 1,
-0.2240438, 0.04467923, -0.5937498, 0, 1, 0.3803922, 1,
-0.2228527, -0.1751853, -1.667922, 0, 1, 0.3882353, 1,
-0.2223306, -0.7347187, -3.471909, 0, 1, 0.3921569, 1,
-0.2213648, 0.4838772, 0.2237534, 0, 1, 0.4, 1,
-0.2193121, 0.9145862, 0.5315043, 0, 1, 0.4078431, 1,
-0.2177118, 0.5195076, -1.22787, 0, 1, 0.4117647, 1,
-0.2101667, 0.222008, -1.188994, 0, 1, 0.4196078, 1,
-0.207032, 0.5230955, 1.868554, 0, 1, 0.4235294, 1,
-0.1989807, 0.7435593, -1.319636, 0, 1, 0.4313726, 1,
-0.196901, 1.019601, 0.1993617, 0, 1, 0.4352941, 1,
-0.1934804, -2.033294, -3.396605, 0, 1, 0.4431373, 1,
-0.1923246, 0.04319417, -2.126579, 0, 1, 0.4470588, 1,
-0.1908155, -1.54133, -2.231841, 0, 1, 0.454902, 1,
-0.1887232, 0.7342052, -0.3043959, 0, 1, 0.4588235, 1,
-0.1868857, -1.246446, -2.02141, 0, 1, 0.4666667, 1,
-0.1864443, 1.231856, 1.923435, 0, 1, 0.4705882, 1,
-0.184424, 0.3014508, -0.3849524, 0, 1, 0.4784314, 1,
-0.1826978, -2.004786, -3.257671, 0, 1, 0.4823529, 1,
-0.1755244, -0.07137886, -2.289728, 0, 1, 0.4901961, 1,
-0.1746195, 0.2601792, -0.2943445, 0, 1, 0.4941176, 1,
-0.1732235, 0.4277857, 0.2013815, 0, 1, 0.5019608, 1,
-0.1690638, 0.1191208, 0.5671813, 0, 1, 0.509804, 1,
-0.1671489, -0.9251235, -3.997432, 0, 1, 0.5137255, 1,
-0.166863, 0.3191727, 0.1413983, 0, 1, 0.5215687, 1,
-0.1666147, 1.155908, -0.7255504, 0, 1, 0.5254902, 1,
-0.1596042, -0.1873634, -3.46827, 0, 1, 0.5333334, 1,
-0.1595405, -0.08776334, -2.59775, 0, 1, 0.5372549, 1,
-0.1580662, 1.426483, -0.02944147, 0, 1, 0.5450981, 1,
-0.154682, 1.886961, 0.6745911, 0, 1, 0.5490196, 1,
-0.1493699, 0.8467028, -0.4842521, 0, 1, 0.5568628, 1,
-0.1491339, -0.2719157, -2.058261, 0, 1, 0.5607843, 1,
-0.1452873, -0.3592934, -2.927319, 0, 1, 0.5686275, 1,
-0.1387331, 1.088666, 0.5362078, 0, 1, 0.572549, 1,
-0.1382836, 0.3690873, -1.398146, 0, 1, 0.5803922, 1,
-0.1382523, -1.693674, -4.536448, 0, 1, 0.5843138, 1,
-0.1380768, 0.6179049, 1.221208, 0, 1, 0.5921569, 1,
-0.1361069, 0.4569552, 0.2019174, 0, 1, 0.5960785, 1,
-0.1263494, 0.2056808, -1.212171, 0, 1, 0.6039216, 1,
-0.1259374, 0.5463153, -0.35838, 0, 1, 0.6117647, 1,
-0.1255454, -1.103933, -1.862773, 0, 1, 0.6156863, 1,
-0.1248885, 0.2298099, -0.5127832, 0, 1, 0.6235294, 1,
-0.1235814, -1.68377, -2.761476, 0, 1, 0.627451, 1,
-0.1232552, 0.988247, -0.6536833, 0, 1, 0.6352941, 1,
-0.1213761, 0.008212796, -2.40237, 0, 1, 0.6392157, 1,
-0.120476, -0.9903699, -3.835741, 0, 1, 0.6470588, 1,
-0.1186372, 0.7221594, -1.419243, 0, 1, 0.6509804, 1,
-0.1155809, 0.1382012, -1.83753, 0, 1, 0.6588235, 1,
-0.1147289, -0.4221863, -1.997328, 0, 1, 0.6627451, 1,
-0.1137187, 0.2618762, -0.0768024, 0, 1, 0.6705883, 1,
-0.1131126, 0.6558477, -2.052375, 0, 1, 0.6745098, 1,
-0.111142, 0.908646, -0.2816712, 0, 1, 0.682353, 1,
-0.1082919, 0.3509366, 0.4447526, 0, 1, 0.6862745, 1,
-0.1031632, 0.5925553, -1.860018, 0, 1, 0.6941177, 1,
-0.1016797, -0.4661674, -4.032368, 0, 1, 0.7019608, 1,
-0.09907216, 0.6339213, -0.9395692, 0, 1, 0.7058824, 1,
-0.09852581, -0.09943412, -0.2902871, 0, 1, 0.7137255, 1,
-0.09567883, 0.7293668, 1.115526, 0, 1, 0.7176471, 1,
-0.0945099, 0.3386163, -0.5351792, 0, 1, 0.7254902, 1,
-0.09093507, -0.1783043, -2.573688, 0, 1, 0.7294118, 1,
-0.08810766, -1.582211, -4.045498, 0, 1, 0.7372549, 1,
-0.08648214, 0.4147148, -0.007749439, 0, 1, 0.7411765, 1,
-0.08224925, 1.043668, -0.7371598, 0, 1, 0.7490196, 1,
-0.07715307, -1.704524, -1.70367, 0, 1, 0.7529412, 1,
-0.07269783, 1.105922, 0.826496, 0, 1, 0.7607843, 1,
-0.07018264, 0.2557842, -0.1306262, 0, 1, 0.7647059, 1,
-0.066234, 0.397972, 0.6725319, 0, 1, 0.772549, 1,
-0.0648716, -1.739081, -3.876951, 0, 1, 0.7764706, 1,
-0.06480462, 1.439752, -0.4993924, 0, 1, 0.7843137, 1,
-0.06313641, -0.1887334, -2.036905, 0, 1, 0.7882353, 1,
-0.06173962, -0.03012678, -2.471879, 0, 1, 0.7960784, 1,
-0.06150527, 0.6711029, -0.07812994, 0, 1, 0.8039216, 1,
-0.05926536, -2.002823, -3.186147, 0, 1, 0.8078431, 1,
-0.05893126, 0.0537937, -0.03145631, 0, 1, 0.8156863, 1,
-0.05825667, 0.05498021, -1.819035, 0, 1, 0.8196079, 1,
-0.05685281, 0.1253149, -1.046171, 0, 1, 0.827451, 1,
-0.05423215, 0.729991, -0.1611912, 0, 1, 0.8313726, 1,
-0.04376205, 0.5302702, -2.26528, 0, 1, 0.8392157, 1,
-0.04323215, 0.6648301, -0.4301863, 0, 1, 0.8431373, 1,
-0.04030386, 1.08406, 0.4783944, 0, 1, 0.8509804, 1,
-0.03911202, 2.468495, 1.479914, 0, 1, 0.854902, 1,
-0.03273078, 1.281314, 0.3919526, 0, 1, 0.8627451, 1,
-0.0321748, -0.5369584, -1.680738, 0, 1, 0.8666667, 1,
-0.03065183, 0.7764745, -1.834783, 0, 1, 0.8745098, 1,
-0.02885472, 1.086932, 0.8712835, 0, 1, 0.8784314, 1,
-0.02715751, -0.1278292, -2.985852, 0, 1, 0.8862745, 1,
-0.02520361, -0.377968, -4.232432, 0, 1, 0.8901961, 1,
-0.02451033, -0.588475, -2.740579, 0, 1, 0.8980392, 1,
-0.01894213, 0.4023914, 1.435505, 0, 1, 0.9058824, 1,
-0.01833954, -1.53657, -2.10819, 0, 1, 0.9098039, 1,
-0.01740972, 0.2242577, -1.045882, 0, 1, 0.9176471, 1,
-0.01735075, -0.8948534, -2.022317, 0, 1, 0.9215686, 1,
-0.01236528, 0.8037071, -0.07820779, 0, 1, 0.9294118, 1,
-0.008896548, -1.120971, -3.542267, 0, 1, 0.9333333, 1,
-0.004884555, 0.8457825, -0.8327079, 0, 1, 0.9411765, 1,
-0.003485898, -0.6035524, -2.424815, 0, 1, 0.945098, 1,
-0.002050634, -0.2036937, -3.690112, 0, 1, 0.9529412, 1,
-0.0001020175, 1.37764, -1.154045, 0, 1, 0.9568627, 1,
0.00117015, 1.036103, 0.4022469, 0, 1, 0.9647059, 1,
0.003818183, 0.583657, 1.307781, 0, 1, 0.9686275, 1,
0.004128327, -0.301153, 4.220294, 0, 1, 0.9764706, 1,
0.00486453, -0.3147096, 2.847121, 0, 1, 0.9803922, 1,
0.006154333, -1.020384, 3.448104, 0, 1, 0.9882353, 1,
0.007022011, -0.829997, 2.644116, 0, 1, 0.9921569, 1,
0.009650823, 0.3437558, 0.5130283, 0, 1, 1, 1,
0.01039523, 0.446425, 0.8592777, 0, 0.9921569, 1, 1,
0.01123347, -0.4303164, 3.271272, 0, 0.9882353, 1, 1,
0.01169769, -1.518664, 2.66164, 0, 0.9803922, 1, 1,
0.01525464, 0.2572551, -0.0990856, 0, 0.9764706, 1, 1,
0.01593375, -0.8853478, 3.046937, 0, 0.9686275, 1, 1,
0.01775064, 1.145333, 0.3611614, 0, 0.9647059, 1, 1,
0.02340772, 1.479023, 0.5080975, 0, 0.9568627, 1, 1,
0.02402327, -0.3725061, 2.195343, 0, 0.9529412, 1, 1,
0.03139094, -0.02124305, 1.510252, 0, 0.945098, 1, 1,
0.03257797, -0.2340405, 2.361498, 0, 0.9411765, 1, 1,
0.03564501, 0.7787732, -0.6380125, 0, 0.9333333, 1, 1,
0.03703629, 0.1493935, 0.5066411, 0, 0.9294118, 1, 1,
0.03881815, -1.116131, 3.857477, 0, 0.9215686, 1, 1,
0.04690155, -2.534269, 2.505931, 0, 0.9176471, 1, 1,
0.04863011, -0.6701872, 4.461607, 0, 0.9098039, 1, 1,
0.04896404, 0.2146455, -1.00294, 0, 0.9058824, 1, 1,
0.04905754, 0.1253602, -0.6685335, 0, 0.8980392, 1, 1,
0.04971746, -0.3277303, 2.927598, 0, 0.8901961, 1, 1,
0.05344668, 0.5229453, 1.148808, 0, 0.8862745, 1, 1,
0.0565564, -2.192134, 2.60746, 0, 0.8784314, 1, 1,
0.06001453, 0.6404776, 1.659982, 0, 0.8745098, 1, 1,
0.06195871, 0.2557306, -1.078045, 0, 0.8666667, 1, 1,
0.06271604, -1.167237, 2.76451, 0, 0.8627451, 1, 1,
0.06387711, -2.114331, 3.137548, 0, 0.854902, 1, 1,
0.06426034, 0.1905795, 2.362223, 0, 0.8509804, 1, 1,
0.07108056, 1.731174, -0.5380617, 0, 0.8431373, 1, 1,
0.07175562, -1.161076, 3.808385, 0, 0.8392157, 1, 1,
0.07575416, -0.7189525, 3.812417, 0, 0.8313726, 1, 1,
0.07782175, -1.599014, 2.036367, 0, 0.827451, 1, 1,
0.07948139, -0.2783441, 4.236884, 0, 0.8196079, 1, 1,
0.08062217, -1.368964, 1.835517, 0, 0.8156863, 1, 1,
0.08244656, 0.2465418, 0.8961928, 0, 0.8078431, 1, 1,
0.09238031, -0.658556, 2.176822, 0, 0.8039216, 1, 1,
0.09268288, -1.023512, 3.419743, 0, 0.7960784, 1, 1,
0.09335667, -0.1040756, 3.121081, 0, 0.7882353, 1, 1,
0.0942327, 1.295503, -0.283534, 0, 0.7843137, 1, 1,
0.09439965, 0.4144899, -1.020773, 0, 0.7764706, 1, 1,
0.09849799, 0.5694665, -1.010046, 0, 0.772549, 1, 1,
0.09984047, -2.151876, 2.22536, 0, 0.7647059, 1, 1,
0.1005213, 0.007687625, 1.116754, 0, 0.7607843, 1, 1,
0.1035005, 0.4772471, -0.5014239, 0, 0.7529412, 1, 1,
0.1040569, 1.185362, -0.2701969, 0, 0.7490196, 1, 1,
0.1041615, 0.3964611, -2.233367, 0, 0.7411765, 1, 1,
0.1081912, 0.2766169, 0.8434378, 0, 0.7372549, 1, 1,
0.1096838, 0.4238431, 0.5138083, 0, 0.7294118, 1, 1,
0.1108565, 0.7527621, 0.6065985, 0, 0.7254902, 1, 1,
0.1203601, 0.7727479, -0.4167387, 0, 0.7176471, 1, 1,
0.1219859, -0.4461821, 3.206563, 0, 0.7137255, 1, 1,
0.1226571, -1.189137, 1.291594, 0, 0.7058824, 1, 1,
0.1377912, 1.130085, 0.8969104, 0, 0.6980392, 1, 1,
0.1388736, 0.5066401, 0.8146644, 0, 0.6941177, 1, 1,
0.1389101, 0.6085368, -0.1889497, 0, 0.6862745, 1, 1,
0.1394254, 1.28194, 0.5578706, 0, 0.682353, 1, 1,
0.1417325, 1.668537, 0.5272298, 0, 0.6745098, 1, 1,
0.1447214, 1.117059, -0.4032867, 0, 0.6705883, 1, 1,
0.1452857, 0.5979009, 0.3164974, 0, 0.6627451, 1, 1,
0.1466001, 1.105385, -0.5536222, 0, 0.6588235, 1, 1,
0.1475125, 0.4055427, 1.290757, 0, 0.6509804, 1, 1,
0.1479943, 0.8111215, 1.421612, 0, 0.6470588, 1, 1,
0.1509539, 0.1716836, 0.2398051, 0, 0.6392157, 1, 1,
0.1519569, -0.2210385, 2.869304, 0, 0.6352941, 1, 1,
0.1539929, -1.736323, 4.00596, 0, 0.627451, 1, 1,
0.1647725, 0.8620655, 0.3351904, 0, 0.6235294, 1, 1,
0.1655336, 0.9246706, -0.7742255, 0, 0.6156863, 1, 1,
0.1658634, -0.304017, 1.798482, 0, 0.6117647, 1, 1,
0.1680381, -1.042915, 1.956928, 0, 0.6039216, 1, 1,
0.1705231, -0.7449825, 3.556938, 0, 0.5960785, 1, 1,
0.1716708, -0.9215294, 3.574929, 0, 0.5921569, 1, 1,
0.1716874, -0.1791292, 3.706566, 0, 0.5843138, 1, 1,
0.1748296, 0.1731237, 0.6710716, 0, 0.5803922, 1, 1,
0.1771658, 0.9202502, 0.3811013, 0, 0.572549, 1, 1,
0.1780437, -0.134139, 1.501181, 0, 0.5686275, 1, 1,
0.1783718, -0.07603166, 3.003314, 0, 0.5607843, 1, 1,
0.1805224, 0.2764498, 0.9996215, 0, 0.5568628, 1, 1,
0.1842193, -0.622539, 3.813585, 0, 0.5490196, 1, 1,
0.191135, 1.952387, 0.9889716, 0, 0.5450981, 1, 1,
0.19603, -1.36246, 5.431232, 0, 0.5372549, 1, 1,
0.1963368, -0.2774222, 3.315357, 0, 0.5333334, 1, 1,
0.1973088, 0.8650525, 1.280038, 0, 0.5254902, 1, 1,
0.1988052, 0.1559056, 0.4015154, 0, 0.5215687, 1, 1,
0.2001771, 0.7213129, 1.206323, 0, 0.5137255, 1, 1,
0.2024058, 0.9846026, 1.091325, 0, 0.509804, 1, 1,
0.2053485, -1.648478, 1.585295, 0, 0.5019608, 1, 1,
0.2073729, 0.08226077, -0.05726363, 0, 0.4941176, 1, 1,
0.2110935, -0.7195677, 3.398972, 0, 0.4901961, 1, 1,
0.214215, -1.241561, 3.30397, 0, 0.4823529, 1, 1,
0.2188792, 1.078555, 1.032661, 0, 0.4784314, 1, 1,
0.2211362, -0.6590552, 1.713354, 0, 0.4705882, 1, 1,
0.2230394, 1.201903, 0.06569163, 0, 0.4666667, 1, 1,
0.2251958, 1.06498, 1.666754, 0, 0.4588235, 1, 1,
0.2302396, 1.543592, 2.835813, 0, 0.454902, 1, 1,
0.2303382, -0.209238, 3.326369, 0, 0.4470588, 1, 1,
0.2313798, 0.6398184, 0.2195286, 0, 0.4431373, 1, 1,
0.2329043, 0.4961445, 1.035859, 0, 0.4352941, 1, 1,
0.2378698, -2.004, 3.370122, 0, 0.4313726, 1, 1,
0.2401193, 1.447283, -1.285958, 0, 0.4235294, 1, 1,
0.2404547, -1.777296, 2.105123, 0, 0.4196078, 1, 1,
0.2421753, 0.7050279, 0.708029, 0, 0.4117647, 1, 1,
0.2456183, -0.9818526, 1.569215, 0, 0.4078431, 1, 1,
0.2467452, 0.3621931, 1.227835, 0, 0.4, 1, 1,
0.2516979, 0.8269567, -1.151641, 0, 0.3921569, 1, 1,
0.2518004, 1.077695, 0.3433208, 0, 0.3882353, 1, 1,
0.2556026, 0.5825453, 2.526447, 0, 0.3803922, 1, 1,
0.2561713, -0.7857924, 3.229858, 0, 0.3764706, 1, 1,
0.2602256, 1.096339, 0.9995207, 0, 0.3686275, 1, 1,
0.2607371, -0.4856218, 2.564277, 0, 0.3647059, 1, 1,
0.2621146, 0.3363163, 0.9784594, 0, 0.3568628, 1, 1,
0.2650079, 1.267089, -0.4560096, 0, 0.3529412, 1, 1,
0.2715165, -1.359233, 4.187542, 0, 0.345098, 1, 1,
0.2812054, 0.4487706, -0.7171905, 0, 0.3411765, 1, 1,
0.2815523, -2.28214, 0.4829996, 0, 0.3333333, 1, 1,
0.2818865, 0.4361446, 3.887525, 0, 0.3294118, 1, 1,
0.2864567, -0.5948842, 2.473427, 0, 0.3215686, 1, 1,
0.2881885, -0.3312682, 2.743755, 0, 0.3176471, 1, 1,
0.2884878, 0.7386304, 1.90899, 0, 0.3098039, 1, 1,
0.2889025, -1.075884, 2.11984, 0, 0.3058824, 1, 1,
0.2903437, 1.224461, -1.730772, 0, 0.2980392, 1, 1,
0.2904515, -0.2502832, 1.555897, 0, 0.2901961, 1, 1,
0.2906478, -0.6148055, 3.565634, 0, 0.2862745, 1, 1,
0.2908601, -0.3603717, 2.747359, 0, 0.2784314, 1, 1,
0.2932217, -1.353931, 4.381252, 0, 0.2745098, 1, 1,
0.2954287, 0.4936998, 0.8467914, 0, 0.2666667, 1, 1,
0.2966045, -0.6366782, 2.89992, 0, 0.2627451, 1, 1,
0.3014013, 0.5742399, 0.8836797, 0, 0.254902, 1, 1,
0.3029895, -0.5433705, 2.950178, 0, 0.2509804, 1, 1,
0.306137, -1.27598, 3.908839, 0, 0.2431373, 1, 1,
0.307288, -1.981194, 2.797424, 0, 0.2392157, 1, 1,
0.3106973, 2.072385, -1.167147, 0, 0.2313726, 1, 1,
0.319552, 0.7053947, -1.263372, 0, 0.227451, 1, 1,
0.3205338, 0.07579893, 1.339195, 0, 0.2196078, 1, 1,
0.3208764, 1.119803, -0.454854, 0, 0.2156863, 1, 1,
0.3215288, 1.127993, 0.8317151, 0, 0.2078431, 1, 1,
0.3225075, -0.4025605, 2.274782, 0, 0.2039216, 1, 1,
0.3231252, 1.809634, 0.3690642, 0, 0.1960784, 1, 1,
0.328729, 1.913005, -0.2321195, 0, 0.1882353, 1, 1,
0.3292938, -0.2142229, 1.302514, 0, 0.1843137, 1, 1,
0.3314456, 0.460501, 0.5385156, 0, 0.1764706, 1, 1,
0.3404869, 0.6954967, 0.1838726, 0, 0.172549, 1, 1,
0.3405142, 1.010831, -1.059198, 0, 0.1647059, 1, 1,
0.3426306, -0.366557, 1.808033, 0, 0.1607843, 1, 1,
0.3455997, -1.551968, 2.69403, 0, 0.1529412, 1, 1,
0.3474889, -0.5870924, 2.523611, 0, 0.1490196, 1, 1,
0.349871, 0.8633804, -0.06998148, 0, 0.1411765, 1, 1,
0.3525396, -0.1373174, 1.602526, 0, 0.1372549, 1, 1,
0.3558534, 0.9474773, 0.02109142, 0, 0.1294118, 1, 1,
0.3571405, -2.057539, 4.553331, 0, 0.1254902, 1, 1,
0.3580532, -0.9014102, 3.603882, 0, 0.1176471, 1, 1,
0.3610689, 0.1246915, 1.466234, 0, 0.1137255, 1, 1,
0.3625354, -1.351473, 2.59554, 0, 0.1058824, 1, 1,
0.3674423, -1.512275, 2.70948, 0, 0.09803922, 1, 1,
0.3677161, -2.2559, 2.155547, 0, 0.09411765, 1, 1,
0.3689894, -0.1634638, 1.758062, 0, 0.08627451, 1, 1,
0.3841944, 0.5579256, 0.5315983, 0, 0.08235294, 1, 1,
0.3845578, -0.4744325, 1.345224, 0, 0.07450981, 1, 1,
0.3871356, -0.8705067, 4.079791, 0, 0.07058824, 1, 1,
0.3877212, 2.195817, 0.4480727, 0, 0.0627451, 1, 1,
0.3901254, -0.5725608, 2.072789, 0, 0.05882353, 1, 1,
0.3927223, -0.6611286, 4.861694, 0, 0.05098039, 1, 1,
0.3966759, -0.4087909, 1.593225, 0, 0.04705882, 1, 1,
0.396923, 0.4714936, -1.000047, 0, 0.03921569, 1, 1,
0.400609, 0.5043617, 0.9375811, 0, 0.03529412, 1, 1,
0.4096944, -0.08264464, 4.902558, 0, 0.02745098, 1, 1,
0.4158735, 0.384247, 0.3012703, 0, 0.02352941, 1, 1,
0.418664, 1.791651, 0.09715123, 0, 0.01568628, 1, 1,
0.4190809, -0.03388426, 1.159707, 0, 0.01176471, 1, 1,
0.4204496, 0.03995765, 1.752889, 0, 0.003921569, 1, 1,
0.4216205, 2.456341, 0.2377127, 0.003921569, 0, 1, 1,
0.4224221, 1.086591, 0.3849449, 0.007843138, 0, 1, 1,
0.4237603, 1.462378, 1.32192, 0.01568628, 0, 1, 1,
0.4248362, 0.5717905, 1.665129, 0.01960784, 0, 1, 1,
0.427042, -0.6281588, 2.83426, 0.02745098, 0, 1, 1,
0.4273546, 2.019536, -1.274239, 0.03137255, 0, 1, 1,
0.4277086, -1.497427, 3.315695, 0.03921569, 0, 1, 1,
0.4304668, -1.184478, 2.786925, 0.04313726, 0, 1, 1,
0.436683, 0.3096591, -0.09992482, 0.05098039, 0, 1, 1,
0.4371223, 2.280843, -0.5386548, 0.05490196, 0, 1, 1,
0.4371793, -0.08228479, 1.55939, 0.0627451, 0, 1, 1,
0.4381261, 0.08712079, 2.531099, 0.06666667, 0, 1, 1,
0.4403457, 0.05556026, 2.147714, 0.07450981, 0, 1, 1,
0.4412875, 1.010436, 0.2721815, 0.07843138, 0, 1, 1,
0.4417671, -0.03985649, 1.450564, 0.08627451, 0, 1, 1,
0.4429543, 1.416525, 1.670606, 0.09019608, 0, 1, 1,
0.4447135, 0.8647723, -0.4756652, 0.09803922, 0, 1, 1,
0.4505511, -0.8335699, 2.242221, 0.1058824, 0, 1, 1,
0.4545598, 1.623568, 0.6696168, 0.1098039, 0, 1, 1,
0.4546391, 0.460644, 0.8762141, 0.1176471, 0, 1, 1,
0.4547065, 0.8064557, 0.9069848, 0.1215686, 0, 1, 1,
0.4577604, 0.4645721, 1.786166, 0.1294118, 0, 1, 1,
0.463755, -0.8438511, 1.994483, 0.1333333, 0, 1, 1,
0.4666981, -0.7663224, 2.566086, 0.1411765, 0, 1, 1,
0.4677842, 1.536895, 0.6465939, 0.145098, 0, 1, 1,
0.4720092, -1.011533, 1.947424, 0.1529412, 0, 1, 1,
0.4802419, -0.7509342, 3.504601, 0.1568628, 0, 1, 1,
0.4821249, -0.6914132, 3.209544, 0.1647059, 0, 1, 1,
0.483327, -0.04382164, 1.836414, 0.1686275, 0, 1, 1,
0.4840105, 0.4140354, 1.199146, 0.1764706, 0, 1, 1,
0.486411, 1.671867, 1.432616, 0.1803922, 0, 1, 1,
0.4878562, -0.8450247, 3.037118, 0.1882353, 0, 1, 1,
0.4915172, 0.4606322, 0.05576974, 0.1921569, 0, 1, 1,
0.4935033, -0.006447059, 0.2053664, 0.2, 0, 1, 1,
0.5009667, -0.6622822, 3.808056, 0.2078431, 0, 1, 1,
0.5010247, 1.021441, 0.9740514, 0.2117647, 0, 1, 1,
0.5082166, -0.009120266, 0.9004577, 0.2196078, 0, 1, 1,
0.5115849, 0.203214, 1.097709, 0.2235294, 0, 1, 1,
0.5127905, 0.2426774, 1.522927, 0.2313726, 0, 1, 1,
0.5144498, 1.636052, 1.125631, 0.2352941, 0, 1, 1,
0.5162133, 0.200293, 1.533669, 0.2431373, 0, 1, 1,
0.5189248, 0.8027912, 0.4306666, 0.2470588, 0, 1, 1,
0.5198887, -0.00893598, 0.3109429, 0.254902, 0, 1, 1,
0.5215169, -1.354456, 2.454731, 0.2588235, 0, 1, 1,
0.5229966, -0.9592271, 3.254517, 0.2666667, 0, 1, 1,
0.5241919, -0.08413374, 2.395615, 0.2705882, 0, 1, 1,
0.5289957, 0.02828969, 0.7147121, 0.2784314, 0, 1, 1,
0.5317487, -0.07236299, 0.2269105, 0.282353, 0, 1, 1,
0.5379984, 0.7955905, -0.2053951, 0.2901961, 0, 1, 1,
0.5405141, -0.3057356, 1.689638, 0.2941177, 0, 1, 1,
0.541061, 0.6332626, 0.1130998, 0.3019608, 0, 1, 1,
0.5424238, 0.6421459, 0.5066608, 0.3098039, 0, 1, 1,
0.5435492, 1.095186, -0.05091348, 0.3137255, 0, 1, 1,
0.5462253, 1.110831, 2.38825, 0.3215686, 0, 1, 1,
0.5532464, -0.1618037, 1.842564, 0.3254902, 0, 1, 1,
0.5557776, -1.812024, 3.283255, 0.3333333, 0, 1, 1,
0.5562913, -0.5481626, 2.374407, 0.3372549, 0, 1, 1,
0.5565553, -0.6558215, 4.286868, 0.345098, 0, 1, 1,
0.5620098, 1.383328, 0.4897245, 0.3490196, 0, 1, 1,
0.5661077, 0.7698753, 2.187051, 0.3568628, 0, 1, 1,
0.5681939, -0.5990807, 1.945387, 0.3607843, 0, 1, 1,
0.5711517, 0.4558882, 0.1241212, 0.3686275, 0, 1, 1,
0.5729976, -0.1895493, 3.250406, 0.372549, 0, 1, 1,
0.5829872, -0.732021, 3.608649, 0.3803922, 0, 1, 1,
0.5868619, -1.029241, 2.452601, 0.3843137, 0, 1, 1,
0.5881513, 1.352743, 0.5795361, 0.3921569, 0, 1, 1,
0.5903487, -0.07756379, 1.68416, 0.3960784, 0, 1, 1,
0.5906883, -1.137894, 2.413715, 0.4039216, 0, 1, 1,
0.5952578, 0.7934026, 0.7469447, 0.4117647, 0, 1, 1,
0.6026773, -0.1281381, -0.1207169, 0.4156863, 0, 1, 1,
0.6028138, 0.7142732, 1.833984, 0.4235294, 0, 1, 1,
0.6060847, -1.362107, 3.163615, 0.427451, 0, 1, 1,
0.6106452, -0.1430064, 1.903598, 0.4352941, 0, 1, 1,
0.6141466, 0.3825596, -0.7716306, 0.4392157, 0, 1, 1,
0.6288894, 0.633665, 1.134481, 0.4470588, 0, 1, 1,
0.6313131, 1.26806, -1.313406, 0.4509804, 0, 1, 1,
0.6313308, 0.6774822, 1.961132, 0.4588235, 0, 1, 1,
0.634471, 1.126328, 1.629246, 0.4627451, 0, 1, 1,
0.6356954, 1.358262, 1.226242, 0.4705882, 0, 1, 1,
0.6448547, 0.9591709, -0.602073, 0.4745098, 0, 1, 1,
0.6478158, -0.2230252, 3.749949, 0.4823529, 0, 1, 1,
0.6549986, -0.9563259, 0.7547871, 0.4862745, 0, 1, 1,
0.6677422, 0.1822802, 1.192266, 0.4941176, 0, 1, 1,
0.6696591, 0.157635, 0.1952079, 0.5019608, 0, 1, 1,
0.671312, 0.9013262, 0.5208582, 0.5058824, 0, 1, 1,
0.6728243, 0.5065226, -1.673799, 0.5137255, 0, 1, 1,
0.6775672, -0.0281319, 2.472439, 0.5176471, 0, 1, 1,
0.6778526, -0.006995687, 3.439119, 0.5254902, 0, 1, 1,
0.6803957, -1.462638, 3.823216, 0.5294118, 0, 1, 1,
0.68374, 1.478264, 0.657123, 0.5372549, 0, 1, 1,
0.6858991, 0.3700885, 1.997552, 0.5411765, 0, 1, 1,
0.6872454, 0.01473346, 0.7159566, 0.5490196, 0, 1, 1,
0.6872793, 0.477073, 0.4552867, 0.5529412, 0, 1, 1,
0.691927, -0.03723015, 1.008645, 0.5607843, 0, 1, 1,
0.6925992, 0.4931937, 0.9357362, 0.5647059, 0, 1, 1,
0.6933177, 1.794796, 1.924136, 0.572549, 0, 1, 1,
0.6988745, -1.972304, 3.364712, 0.5764706, 0, 1, 1,
0.7020067, -0.8879232, 0.106922, 0.5843138, 0, 1, 1,
0.7030554, 0.1863299, 1.454645, 0.5882353, 0, 1, 1,
0.7034856, 1.084094, 0.06292277, 0.5960785, 0, 1, 1,
0.7059656, -1.25394, 1.861993, 0.6039216, 0, 1, 1,
0.7065408, -1.266188, 1.114482, 0.6078432, 0, 1, 1,
0.7072025, -1.238866, 2.432999, 0.6156863, 0, 1, 1,
0.7072976, 1.273416, 1.45838, 0.6196079, 0, 1, 1,
0.7177211, 0.3211681, 2.18887, 0.627451, 0, 1, 1,
0.7178527, 1.05228, 0.6826471, 0.6313726, 0, 1, 1,
0.7190779, -1.147904, 1.642583, 0.6392157, 0, 1, 1,
0.7194579, 0.15595, 1.503512, 0.6431373, 0, 1, 1,
0.7223785, 0.3780948, 1.193212, 0.6509804, 0, 1, 1,
0.7226331, 0.3336495, 1.486766, 0.654902, 0, 1, 1,
0.7229187, 1.306096, -0.3648827, 0.6627451, 0, 1, 1,
0.7249999, -1.665839, 1.494074, 0.6666667, 0, 1, 1,
0.7260368, 0.4957093, 0.9985664, 0.6745098, 0, 1, 1,
0.7408469, 1.641982, 0.01276045, 0.6784314, 0, 1, 1,
0.7417924, 0.6808271, 0.9370768, 0.6862745, 0, 1, 1,
0.7484137, -0.001556057, 1.029486, 0.6901961, 0, 1, 1,
0.7518967, 1.345877, -0.7966034, 0.6980392, 0, 1, 1,
0.7551929, 0.9052717, 2.002967, 0.7058824, 0, 1, 1,
0.7561665, -0.3053305, 3.24911, 0.7098039, 0, 1, 1,
0.7587548, 0.3696356, -0.0467323, 0.7176471, 0, 1, 1,
0.7611481, 0.286985, 3.078326, 0.7215686, 0, 1, 1,
0.7616241, -1.08048, 3.492799, 0.7294118, 0, 1, 1,
0.7683413, 0.05269786, 2.051224, 0.7333333, 0, 1, 1,
0.7697338, 0.3049256, 0.1834099, 0.7411765, 0, 1, 1,
0.770386, -0.2650069, 3.790016, 0.7450981, 0, 1, 1,
0.777736, -0.5336246, 1.906735, 0.7529412, 0, 1, 1,
0.7863052, -0.3198465, 2.939468, 0.7568628, 0, 1, 1,
0.7878394, 1.89678, 0.5968749, 0.7647059, 0, 1, 1,
0.7948501, 0.1118263, 2.110553, 0.7686275, 0, 1, 1,
0.7998332, 0.5918058, 1.742486, 0.7764706, 0, 1, 1,
0.8006013, 0.6434061, -0.6818029, 0.7803922, 0, 1, 1,
0.8032496, -0.1290233, 2.348521, 0.7882353, 0, 1, 1,
0.8126125, -1.666441, 2.569312, 0.7921569, 0, 1, 1,
0.8130498, -0.4033692, 1.010486, 0.8, 0, 1, 1,
0.8154283, 0.6287092, 0.4213158, 0.8078431, 0, 1, 1,
0.8164107, 1.818179, 0.2048466, 0.8117647, 0, 1, 1,
0.8169086, 0.4177279, 2.682481, 0.8196079, 0, 1, 1,
0.8177669, 0.3307491, 0.1343253, 0.8235294, 0, 1, 1,
0.8179653, -0.1866193, 2.561139, 0.8313726, 0, 1, 1,
0.8195358, 1.019753, 0.5048998, 0.8352941, 0, 1, 1,
0.8238381, 0.9892739, 1.377873, 0.8431373, 0, 1, 1,
0.8247553, -1.049291, 1.805669, 0.8470588, 0, 1, 1,
0.8270392, 0.6900908, 1.084742, 0.854902, 0, 1, 1,
0.8319277, 0.2411617, 1.676672, 0.8588235, 0, 1, 1,
0.8337737, -1.923847, 2.601108, 0.8666667, 0, 1, 1,
0.8358947, -0.08257048, 1.242409, 0.8705882, 0, 1, 1,
0.8424862, 0.5246725, -0.05820346, 0.8784314, 0, 1, 1,
0.8444353, 0.1262044, 1.336811, 0.8823529, 0, 1, 1,
0.8471621, -0.7019718, -0.5757362, 0.8901961, 0, 1, 1,
0.8543349, 1.124115, 2.66431, 0.8941177, 0, 1, 1,
0.8559326, 1.908619, 0.1251753, 0.9019608, 0, 1, 1,
0.8573946, 0.5352493, 1.25411, 0.9098039, 0, 1, 1,
0.8601214, 0.7304913, -0.4696284, 0.9137255, 0, 1, 1,
0.8621192, 2.138661, 0.02927237, 0.9215686, 0, 1, 1,
0.8644827, -1.062809, 2.190415, 0.9254902, 0, 1, 1,
0.8705274, -0.06845262, 1.57257, 0.9333333, 0, 1, 1,
0.8718585, 0.2288996, 2.736561, 0.9372549, 0, 1, 1,
0.873773, -2.32041, 0.9797943, 0.945098, 0, 1, 1,
0.8779265, -0.965288, 2.151982, 0.9490196, 0, 1, 1,
0.8784792, -0.5456244, 2.45997, 0.9568627, 0, 1, 1,
0.8820624, -0.7888469, 2.807825, 0.9607843, 0, 1, 1,
0.8844674, -1.904285, 2.621912, 0.9686275, 0, 1, 1,
0.8874996, 1.303002, 0.9124254, 0.972549, 0, 1, 1,
0.8950113, -1.757955, 2.193789, 0.9803922, 0, 1, 1,
0.8951715, 0.6154464, 0.628961, 0.9843137, 0, 1, 1,
0.8970261, 1.538075, 0.7529697, 0.9921569, 0, 1, 1,
0.902598, -1.051232, 1.945186, 0.9960784, 0, 1, 1,
0.9070788, -1.647068, 2.150343, 1, 0, 0.9960784, 1,
0.9198133, 0.3045534, 1.262123, 1, 0, 0.9882353, 1,
0.9205307, 1.616008, -0.1623362, 1, 0, 0.9843137, 1,
0.9244676, -0.362804, 2.737744, 1, 0, 0.9764706, 1,
0.9504303, 0.05461593, 2.046949, 1, 0, 0.972549, 1,
0.9523411, 0.9404232, 0.04173237, 1, 0, 0.9647059, 1,
0.9545054, -0.5692016, 2.731962, 1, 0, 0.9607843, 1,
0.9561119, 0.3500994, 0.5765315, 1, 0, 0.9529412, 1,
0.9567749, -1.537047, 2.063222, 1, 0, 0.9490196, 1,
0.962853, -1.162697, 4.144766, 1, 0, 0.9411765, 1,
0.9639225, -0.09563984, 2.558941, 1, 0, 0.9372549, 1,
0.9650128, 0.305826, 1.139189, 1, 0, 0.9294118, 1,
0.9661962, 0.1661258, 2.992111, 1, 0, 0.9254902, 1,
0.9664363, 0.3457015, 0.1623519, 1, 0, 0.9176471, 1,
0.9669158, 1.405216, 2.083673, 1, 0, 0.9137255, 1,
0.9681041, 1.343522, -0.03630724, 1, 0, 0.9058824, 1,
0.9693017, -0.7737848, 1.172832, 1, 0, 0.9019608, 1,
0.9715917, -0.1674374, 2.348741, 1, 0, 0.8941177, 1,
0.9721036, 0.3454762, 0.8287058, 1, 0, 0.8862745, 1,
0.982312, -0.1150827, 1.078782, 1, 0, 0.8823529, 1,
0.9850966, -1.740844, 2.137545, 1, 0, 0.8745098, 1,
0.9954298, 0.3289271, 3.27394, 1, 0, 0.8705882, 1,
1.001539, 0.3953072, 0.8438063, 1, 0, 0.8627451, 1,
1.008373, -0.8801284, 3.78764, 1, 0, 0.8588235, 1,
1.013355, 0.7257979, 1.157865, 1, 0, 0.8509804, 1,
1.028568, 0.6074958, 0.8585039, 1, 0, 0.8470588, 1,
1.044735, 0.9869191, 1.154988, 1, 0, 0.8392157, 1,
1.04945, 0.1224574, 2.838572, 1, 0, 0.8352941, 1,
1.050122, 2.077314, 1.217243, 1, 0, 0.827451, 1,
1.061754, -0.6261446, 1.455399, 1, 0, 0.8235294, 1,
1.076964, 0.8853343, -1.415209, 1, 0, 0.8156863, 1,
1.077433, 0.6131477, 1.422835, 1, 0, 0.8117647, 1,
1.078763, 1.552575, 1.756749, 1, 0, 0.8039216, 1,
1.081818, 0.6808633, 1.021237, 1, 0, 0.7960784, 1,
1.086716, -0.1474617, 2.075047, 1, 0, 0.7921569, 1,
1.088205, 0.6370277, 1.112059, 1, 0, 0.7843137, 1,
1.090492, 0.2663026, 2.659146, 1, 0, 0.7803922, 1,
1.094324, -0.311063, 0.2097402, 1, 0, 0.772549, 1,
1.098175, -0.573506, 1.525189, 1, 0, 0.7686275, 1,
1.099474, -0.5934902, 1.966601, 1, 0, 0.7607843, 1,
1.110863, -0.9658495, 1.595328, 1, 0, 0.7568628, 1,
1.113507, 0.5332007, 1.262347, 1, 0, 0.7490196, 1,
1.11465, -0.7577551, 2.232031, 1, 0, 0.7450981, 1,
1.11623, 4.057152, -0.466717, 1, 0, 0.7372549, 1,
1.118846, 0.2218688, 1.557006, 1, 0, 0.7333333, 1,
1.121787, 1.997751, 0.3634401, 1, 0, 0.7254902, 1,
1.132577, 0.1213127, 1.012539, 1, 0, 0.7215686, 1,
1.139635, 0.1093221, 3.274593, 1, 0, 0.7137255, 1,
1.139935, 0.606779, 1.582377, 1, 0, 0.7098039, 1,
1.140073, -0.1365516, 1.00396, 1, 0, 0.7019608, 1,
1.140397, -0.2196611, 0.214726, 1, 0, 0.6941177, 1,
1.145092, -0.5571681, 3.329094, 1, 0, 0.6901961, 1,
1.145404, 0.4763129, 0.3361607, 1, 0, 0.682353, 1,
1.148422, 0.262594, 0.4537596, 1, 0, 0.6784314, 1,
1.148906, 0.5775731, 0.5804573, 1, 0, 0.6705883, 1,
1.152342, -0.5589739, 2.560746, 1, 0, 0.6666667, 1,
1.153224, -0.1222879, 2.011022, 1, 0, 0.6588235, 1,
1.163318, -0.7420505, 3.048178, 1, 0, 0.654902, 1,
1.167738, 0.6904011, 0.1926754, 1, 0, 0.6470588, 1,
1.175483, 0.6767622, -0.2971476, 1, 0, 0.6431373, 1,
1.17697, 1.129547, 1.024781, 1, 0, 0.6352941, 1,
1.183457, -2.238705, 1.960438, 1, 0, 0.6313726, 1,
1.190954, -0.489112, 0.9454362, 1, 0, 0.6235294, 1,
1.192049, -2.347092, 4.024783, 1, 0, 0.6196079, 1,
1.197527, -0.07552272, 1.063474, 1, 0, 0.6117647, 1,
1.201403, 0.5879123, 1.692909, 1, 0, 0.6078432, 1,
1.201607, 1.279266, 2.02895, 1, 0, 0.6, 1,
1.214353, 0.1780539, 0.1322529, 1, 0, 0.5921569, 1,
1.217144, 1.239011, 2.587121, 1, 0, 0.5882353, 1,
1.217475, 0.9523193, 1.476821, 1, 0, 0.5803922, 1,
1.217722, -2.390852, 2.333962, 1, 0, 0.5764706, 1,
1.22517, 1.372303, 1.20038, 1, 0, 0.5686275, 1,
1.238405, 0.4759985, 0.6049031, 1, 0, 0.5647059, 1,
1.24061, 1.622563, 0.6169736, 1, 0, 0.5568628, 1,
1.247485, -0.2827604, 4.035353, 1, 0, 0.5529412, 1,
1.253386, 0.2503052, 1.195026, 1, 0, 0.5450981, 1,
1.272475, 0.891947, 1.310259, 1, 0, 0.5411765, 1,
1.277888, 0.8434697, 1.293097, 1, 0, 0.5333334, 1,
1.280193, 1.206599, 1.111546, 1, 0, 0.5294118, 1,
1.287062, 0.3399948, 0.1900113, 1, 0, 0.5215687, 1,
1.290405, -1.559544, 1.556819, 1, 0, 0.5176471, 1,
1.300035, -1.09511, 1.25918, 1, 0, 0.509804, 1,
1.304348, 0.8654417, 0.3237396, 1, 0, 0.5058824, 1,
1.312623, -1.895289, 2.339154, 1, 0, 0.4980392, 1,
1.317255, -0.3520887, 3.238116, 1, 0, 0.4901961, 1,
1.332604, 0.976351, -0.8194244, 1, 0, 0.4862745, 1,
1.337354, 1.944276, 2.681716, 1, 0, 0.4784314, 1,
1.338869, 1.52063, -0.3332336, 1, 0, 0.4745098, 1,
1.339077, 1.003267, 2.872199, 1, 0, 0.4666667, 1,
1.343331, -0.3009521, 2.182765, 1, 0, 0.4627451, 1,
1.351953, 1.751026, 0.5874478, 1, 0, 0.454902, 1,
1.355458, 0.4018265, 1.228008, 1, 0, 0.4509804, 1,
1.359489, 0.9807527, 0.7593444, 1, 0, 0.4431373, 1,
1.381496, -0.7839891, 1.775114, 1, 0, 0.4392157, 1,
1.409229, 0.5492606, 1.483102, 1, 0, 0.4313726, 1,
1.418461, 0.2415813, 3.016672, 1, 0, 0.427451, 1,
1.429973, 2.587406, 0.5112388, 1, 0, 0.4196078, 1,
1.434861, -1.18523, 2.409126, 1, 0, 0.4156863, 1,
1.437096, 1.208122, 1.960689, 1, 0, 0.4078431, 1,
1.437205, 0.6375754, 1.652128, 1, 0, 0.4039216, 1,
1.439249, -1.019837, 1.872837, 1, 0, 0.3960784, 1,
1.440417, 2.351291, 0.9622748, 1, 0, 0.3882353, 1,
1.445152, 0.06487053, 1.489156, 1, 0, 0.3843137, 1,
1.469182, -0.7177851, 2.434947, 1, 0, 0.3764706, 1,
1.470053, -0.1995023, 0.5100854, 1, 0, 0.372549, 1,
1.472277, 0.2112374, 0.2673372, 1, 0, 0.3647059, 1,
1.479712, 3.587905, -0.02259266, 1, 0, 0.3607843, 1,
1.494944, 1.541181, 2.567532, 1, 0, 0.3529412, 1,
1.496521, 0.1084814, -0.515687, 1, 0, 0.3490196, 1,
1.498635, -0.4457668, 1.630394, 1, 0, 0.3411765, 1,
1.513632, -0.048721, 2.17847, 1, 0, 0.3372549, 1,
1.528557, 2.107123, 1.055073, 1, 0, 0.3294118, 1,
1.537376, 0.8999101, 0.05219349, 1, 0, 0.3254902, 1,
1.5457, 0.6475294, 0.009095309, 1, 0, 0.3176471, 1,
1.556865, -1.108935, 3.888694, 1, 0, 0.3137255, 1,
1.560103, 0.8529646, -0.4835921, 1, 0, 0.3058824, 1,
1.569575, 1.715427, 1.061667, 1, 0, 0.2980392, 1,
1.591137, 0.3092923, 2.653261, 1, 0, 0.2941177, 1,
1.59265, -0.3782478, 1.457211, 1, 0, 0.2862745, 1,
1.61645, 1.008006, 2.689359, 1, 0, 0.282353, 1,
1.640355, 1.261563, 0.2876982, 1, 0, 0.2745098, 1,
1.644852, 0.2681855, 2.996479, 1, 0, 0.2705882, 1,
1.665882, 0.2122281, 1.251166, 1, 0, 0.2627451, 1,
1.670413, 0.2806728, 0.5022239, 1, 0, 0.2588235, 1,
1.67481, -0.179696, 0.5711574, 1, 0, 0.2509804, 1,
1.677227, -0.461229, 1.059037, 1, 0, 0.2470588, 1,
1.693716, 1.04074, 0.3333209, 1, 0, 0.2392157, 1,
1.701843, -1.483656, 2.383171, 1, 0, 0.2352941, 1,
1.712438, -0.7597258, 2.150239, 1, 0, 0.227451, 1,
1.77266, -1.676156, 3.171013, 1, 0, 0.2235294, 1,
1.773523, -1.172077, 2.372607, 1, 0, 0.2156863, 1,
1.825954, -0.3371175, 3.107534, 1, 0, 0.2117647, 1,
1.857324, -0.4659193, 1.960176, 1, 0, 0.2039216, 1,
1.862199, 0.552485, 1.123626, 1, 0, 0.1960784, 1,
1.864747, 0.1634969, 1.50776, 1, 0, 0.1921569, 1,
1.892231, 0.002413863, 1.771765, 1, 0, 0.1843137, 1,
1.908942, 1.667073, 0.3635019, 1, 0, 0.1803922, 1,
1.921542, 0.1101547, 1.735724, 1, 0, 0.172549, 1,
1.923511, 1.083082, 0.3996013, 1, 0, 0.1686275, 1,
1.924943, -0.9949312, 0.6531041, 1, 0, 0.1607843, 1,
1.95322, 0.3606777, 3.538406, 1, 0, 0.1568628, 1,
1.97526, 0.5047267, 1.118625, 1, 0, 0.1490196, 1,
1.978445, -1.964289, 2.338126, 1, 0, 0.145098, 1,
1.987717, -0.2252818, 3.326028, 1, 0, 0.1372549, 1,
1.988247, -1.779536, 3.164994, 1, 0, 0.1333333, 1,
2.044186, 2.172132, 2.01894, 1, 0, 0.1254902, 1,
2.053509, -0.8065758, 0.7990804, 1, 0, 0.1215686, 1,
2.058551, -0.6249074, -0.2747357, 1, 0, 0.1137255, 1,
2.071613, 0.7771914, 0.5630419, 1, 0, 0.1098039, 1,
2.098748, -0.7298806, 0.1130806, 1, 0, 0.1019608, 1,
2.102406, 1.343162, 0.5325846, 1, 0, 0.09411765, 1,
2.109929, -1.495842, 1.729282, 1, 0, 0.09019608, 1,
2.219817, -0.06984583, 1.374479, 1, 0, 0.08235294, 1,
2.242903, -0.1241542, 2.37572, 1, 0, 0.07843138, 1,
2.258107, -0.1754136, 2.775557, 1, 0, 0.07058824, 1,
2.276551, 1.636522, 1.469497, 1, 0, 0.06666667, 1,
2.362775, -0.7017147, 2.933533, 1, 0, 0.05882353, 1,
2.38173, 0.1391154, 1.853779, 1, 0, 0.05490196, 1,
2.419255, 0.0242929, 2.193398, 1, 0, 0.04705882, 1,
2.492584, -0.6884056, 1.173092, 1, 0, 0.04313726, 1,
2.526186, -1.847236, 0.6329361, 1, 0, 0.03529412, 1,
2.582445, 0.8288656, 1.593175, 1, 0, 0.03137255, 1,
2.626387, -0.8130274, -0.006831169, 1, 0, 0.02352941, 1,
2.707, -1.377607, 1.103161, 1, 0, 0.01960784, 1,
2.76782, -0.6387713, -0.4924228, 1, 0, 0.01176471, 1,
3.028507, 1.395911, -1.098961, 1, 0, 0.007843138, 1
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
0.09880888, -3.72603, -6.702263, 0, -0.5, 0.5, 0.5,
0.09880888, -3.72603, -6.702263, 1, -0.5, 0.5, 0.5,
0.09880888, -3.72603, -6.702263, 1, 1.5, 0.5, 0.5,
0.09880888, -3.72603, -6.702263, 0, 1.5, 0.5, 0.5
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
-3.824057, 0.7295837, -6.702263, 0, -0.5, 0.5, 0.5,
-3.824057, 0.7295837, -6.702263, 1, -0.5, 0.5, 0.5,
-3.824057, 0.7295837, -6.702263, 1, 1.5, 0.5, 0.5,
-3.824057, 0.7295837, -6.702263, 0, 1.5, 0.5, 0.5
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
-3.824057, -3.72603, 0.2437608, 0, -0.5, 0.5, 0.5,
-3.824057, -3.72603, 0.2437608, 1, -0.5, 0.5, 0.5,
-3.824057, -3.72603, 0.2437608, 1, 1.5, 0.5, 0.5,
-3.824057, -3.72603, 0.2437608, 0, 1.5, 0.5, 0.5
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
-2, -2.697811, -5.099334,
3, -2.697811, -5.099334,
-2, -2.697811, -5.099334,
-2, -2.869181, -5.366489,
-1, -2.697811, -5.099334,
-1, -2.869181, -5.366489,
0, -2.697811, -5.099334,
0, -2.869181, -5.366489,
1, -2.697811, -5.099334,
1, -2.869181, -5.366489,
2, -2.697811, -5.099334,
2, -2.869181, -5.366489,
3, -2.697811, -5.099334,
3, -2.869181, -5.366489
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
-2, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
-2, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
-2, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
-2, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5,
-1, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
-1, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
-1, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
-1, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5,
0, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
0, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
0, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
0, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5,
1, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
1, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
1, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
1, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5,
2, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
2, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
2, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
2, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5,
3, -3.211921, -5.900799, 0, -0.5, 0.5, 0.5,
3, -3.211921, -5.900799, 1, -0.5, 0.5, 0.5,
3, -3.211921, -5.900799, 1, 1.5, 0.5, 0.5,
3, -3.211921, -5.900799, 0, 1.5, 0.5, 0.5
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
-2.91878, -2, -5.099334,
-2.91878, 4, -5.099334,
-2.91878, -2, -5.099334,
-3.06966, -2, -5.366489,
-2.91878, -1, -5.099334,
-3.06966, -1, -5.366489,
-2.91878, 0, -5.099334,
-3.06966, 0, -5.366489,
-2.91878, 1, -5.099334,
-3.06966, 1, -5.366489,
-2.91878, 2, -5.099334,
-3.06966, 2, -5.366489,
-2.91878, 3, -5.099334,
-3.06966, 3, -5.366489,
-2.91878, 4, -5.099334,
-3.06966, 4, -5.366489
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
"3",
"4"
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
-3.371418, -2, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, -2, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, -2, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, -2, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, -1, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, -1, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, -1, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, -1, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, 0, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, 0, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, 0, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, 0, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, 1, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, 1, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, 1, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, 1, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, 2, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, 2, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, 2, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, 2, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, 3, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, 3, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, 3, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, 3, -5.900799, 0, 1.5, 0.5, 0.5,
-3.371418, 4, -5.900799, 0, -0.5, 0.5, 0.5,
-3.371418, 4, -5.900799, 1, -0.5, 0.5, 0.5,
-3.371418, 4, -5.900799, 1, 1.5, 0.5, 0.5,
-3.371418, 4, -5.900799, 0, 1.5, 0.5, 0.5
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
-2.91878, -2.697811, -4,
-2.91878, -2.697811, 4,
-2.91878, -2.697811, -4,
-3.06966, -2.869181, -4,
-2.91878, -2.697811, -2,
-3.06966, -2.869181, -2,
-2.91878, -2.697811, 0,
-3.06966, -2.869181, 0,
-2.91878, -2.697811, 2,
-3.06966, -2.869181, 2,
-2.91878, -2.697811, 4,
-3.06966, -2.869181, 4
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
-3.371418, -3.211921, -4, 0, -0.5, 0.5, 0.5,
-3.371418, -3.211921, -4, 1, -0.5, 0.5, 0.5,
-3.371418, -3.211921, -4, 1, 1.5, 0.5, 0.5,
-3.371418, -3.211921, -4, 0, 1.5, 0.5, 0.5,
-3.371418, -3.211921, -2, 0, -0.5, 0.5, 0.5,
-3.371418, -3.211921, -2, 1, -0.5, 0.5, 0.5,
-3.371418, -3.211921, -2, 1, 1.5, 0.5, 0.5,
-3.371418, -3.211921, -2, 0, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 0, 0, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 0, 1, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 0, 1, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 0, 0, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 2, 0, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 2, 1, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 2, 1, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 2, 0, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 4, 0, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 4, 1, -0.5, 0.5, 0.5,
-3.371418, -3.211921, 4, 1, 1.5, 0.5, 0.5,
-3.371418, -3.211921, 4, 0, 1.5, 0.5, 0.5
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
-2.91878, -2.697811, -5.099334,
-2.91878, 4.156979, -5.099334,
-2.91878, -2.697811, 5.586856,
-2.91878, 4.156979, 5.586856,
-2.91878, -2.697811, -5.099334,
-2.91878, -2.697811, 5.586856,
-2.91878, 4.156979, -5.099334,
-2.91878, 4.156979, 5.586856,
-2.91878, -2.697811, -5.099334,
3.116398, -2.697811, -5.099334,
-2.91878, -2.697811, 5.586856,
3.116398, -2.697811, 5.586856,
-2.91878, 4.156979, -5.099334,
3.116398, 4.156979, -5.099334,
-2.91878, 4.156979, 5.586856,
3.116398, 4.156979, 5.586856,
3.116398, -2.697811, -5.099334,
3.116398, 4.156979, -5.099334,
3.116398, -2.697811, 5.586856,
3.116398, 4.156979, 5.586856,
3.116398, -2.697811, -5.099334,
3.116398, -2.697811, 5.586856,
3.116398, 4.156979, -5.099334,
3.116398, 4.156979, 5.586856
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
var radius = 7.506297;
var distance = 33.39636;
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
mvMatrix.translate( -0.09880888, -0.7295837, -0.2437608 );
mvMatrix.scale( 1.344775, 1.183983, 0.7594807 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.39636);
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

