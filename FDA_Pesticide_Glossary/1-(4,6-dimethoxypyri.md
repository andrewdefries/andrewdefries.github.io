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
-3.005291, -1.404247, -2.001577, 1, 0, 0, 1,
-2.72991, -0.4909317, -1.178636, 1, 0.007843138, 0, 1,
-2.522839, 2.171822, -0.7899056, 1, 0.01176471, 0, 1,
-2.516192, 0.4996475, -1.203085, 1, 0.01960784, 0, 1,
-2.504362, 0.8040075, -0.2181463, 1, 0.02352941, 0, 1,
-2.478328, -0.09024379, -2.845083, 1, 0.03137255, 0, 1,
-2.415617, 0.7906474, -3.399775, 1, 0.03529412, 0, 1,
-2.399732, 0.1559927, -0.5895184, 1, 0.04313726, 0, 1,
-2.329966, -0.5131378, -1.348701, 1, 0.04705882, 0, 1,
-2.320117, -0.8155362, -0.1894254, 1, 0.05490196, 0, 1,
-2.296949, -0.302701, -2.286499, 1, 0.05882353, 0, 1,
-2.29651, -0.08269643, -0.1181495, 1, 0.06666667, 0, 1,
-2.296057, 2.14536, -1.144841, 1, 0.07058824, 0, 1,
-2.227421, -1.344872, -1.414851, 1, 0.07843138, 0, 1,
-2.192397, 1.311221, -1.076984, 1, 0.08235294, 0, 1,
-2.169986, 0.1495958, -0.1689277, 1, 0.09019608, 0, 1,
-2.099278, 2.118939, -1.838921, 1, 0.09411765, 0, 1,
-2.092489, 0.6410675, -1.917235, 1, 0.1019608, 0, 1,
-2.091392, 1.692245, -1.530288, 1, 0.1098039, 0, 1,
-2.054723, 1.812354, -1.423558, 1, 0.1137255, 0, 1,
-2.044559, 0.6401677, 0.1956329, 1, 0.1215686, 0, 1,
-2.028364, -0.4606559, -0.65228, 1, 0.1254902, 0, 1,
-2.012189, 0.8054717, 0.41564, 1, 0.1333333, 0, 1,
-2.005931, 0.0590062, -2.779807, 1, 0.1372549, 0, 1,
-1.940002, -0.1949618, -3.515071, 1, 0.145098, 0, 1,
-1.937087, 0.4344307, 1.34968, 1, 0.1490196, 0, 1,
-1.934145, 1.482594, 1.098763, 1, 0.1568628, 0, 1,
-1.927816, 0.6608424, -2.040721, 1, 0.1607843, 0, 1,
-1.918287, -1.419863, -2.233078, 1, 0.1686275, 0, 1,
-1.904194, -0.6051924, -0.5503212, 1, 0.172549, 0, 1,
-1.896423, -0.7407101, -1.825131, 1, 0.1803922, 0, 1,
-1.882598, -1.697729, -2.33676, 1, 0.1843137, 0, 1,
-1.867929, 1.434825, -1.28994, 1, 0.1921569, 0, 1,
-1.857784, -0.4194576, -2.817004, 1, 0.1960784, 0, 1,
-1.832363, -0.6634846, -0.7852031, 1, 0.2039216, 0, 1,
-1.792016, 0.9151483, -0.5098021, 1, 0.2117647, 0, 1,
-1.789752, -0.1601315, -0.6337603, 1, 0.2156863, 0, 1,
-1.775875, -1.810316, -3.380225, 1, 0.2235294, 0, 1,
-1.76981, 0.771745, -0.3080496, 1, 0.227451, 0, 1,
-1.76799, 0.9761141, -0.8715264, 1, 0.2352941, 0, 1,
-1.757882, -0.875412, -0.4904502, 1, 0.2392157, 0, 1,
-1.751603, 1.001371, 0.0410536, 1, 0.2470588, 0, 1,
-1.739289, -0.7091473, -0.7837547, 1, 0.2509804, 0, 1,
-1.731782, 0.4571597, -2.123991, 1, 0.2588235, 0, 1,
-1.724427, -1.071482, -1.937059, 1, 0.2627451, 0, 1,
-1.721546, -1.303829, -2.935326, 1, 0.2705882, 0, 1,
-1.714994, -1.743326, -2.310591, 1, 0.2745098, 0, 1,
-1.714675, 0.2008439, -3.276544, 1, 0.282353, 0, 1,
-1.705572, -1.524296, -2.043241, 1, 0.2862745, 0, 1,
-1.686166, -0.1214936, -2.662166, 1, 0.2941177, 0, 1,
-1.680557, -0.07082661, -2.943795, 1, 0.3019608, 0, 1,
-1.679674, 1.248091, -0.5057946, 1, 0.3058824, 0, 1,
-1.67773, -0.3505624, -2.322154, 1, 0.3137255, 0, 1,
-1.667875, -1.083169, -2.278647, 1, 0.3176471, 0, 1,
-1.649839, -0.6035053, -1.588128, 1, 0.3254902, 0, 1,
-1.647698, -1.132562, -2.15198, 1, 0.3294118, 0, 1,
-1.644898, 0.9448919, -0.5220712, 1, 0.3372549, 0, 1,
-1.64381, 0.5468781, -0.8994304, 1, 0.3411765, 0, 1,
-1.643704, 0.6496891, -1.7236, 1, 0.3490196, 0, 1,
-1.63081, -0.3062586, -2.529631, 1, 0.3529412, 0, 1,
-1.613856, 0.2538623, -1.675769, 1, 0.3607843, 0, 1,
-1.608666, 0.9602881, -2.070366, 1, 0.3647059, 0, 1,
-1.598592, -0.7822089, -1.250777, 1, 0.372549, 0, 1,
-1.595359, 0.0113818, -1.500736, 1, 0.3764706, 0, 1,
-1.58354, -1.411823, -1.126374, 1, 0.3843137, 0, 1,
-1.57053, -1.116231, -2.730119, 1, 0.3882353, 0, 1,
-1.546779, 0.509594, -1.177812, 1, 0.3960784, 0, 1,
-1.546481, 1.32835, -1.508749, 1, 0.4039216, 0, 1,
-1.545457, -0.273824, -0.4440373, 1, 0.4078431, 0, 1,
-1.53775, -1.089162, -2.745213, 1, 0.4156863, 0, 1,
-1.527598, 1.134118, -0.2600322, 1, 0.4196078, 0, 1,
-1.488535, -0.120899, -1.414072, 1, 0.427451, 0, 1,
-1.483176, -1.049324, -3.640892, 1, 0.4313726, 0, 1,
-1.480279, 0.7216721, -1.429599, 1, 0.4392157, 0, 1,
-1.475261, -1.533069, -1.348915, 1, 0.4431373, 0, 1,
-1.469115, 0.5708302, -1.940849, 1, 0.4509804, 0, 1,
-1.462524, -1.986552, -2.032131, 1, 0.454902, 0, 1,
-1.45716, 0.4861375, -1.158554, 1, 0.4627451, 0, 1,
-1.444582, -0.837869, -3.149098, 1, 0.4666667, 0, 1,
-1.436102, 0.6234095, -1.034026, 1, 0.4745098, 0, 1,
-1.432158, -1.061057, -1.395886, 1, 0.4784314, 0, 1,
-1.428417, -1.551949, -1.704437, 1, 0.4862745, 0, 1,
-1.428018, -1.027046, -3.131236, 1, 0.4901961, 0, 1,
-1.417743, -0.3062958, -0.728219, 1, 0.4980392, 0, 1,
-1.402611, 0.0685347, -0.7666655, 1, 0.5058824, 0, 1,
-1.399585, -0.791873, -4.156208, 1, 0.509804, 0, 1,
-1.397924, 0.21494, -2.392132, 1, 0.5176471, 0, 1,
-1.390696, -0.8028448, -2.529702, 1, 0.5215687, 0, 1,
-1.38382, -2.614177, -3.725538, 1, 0.5294118, 0, 1,
-1.363672, 0.235066, -0.9582766, 1, 0.5333334, 0, 1,
-1.361733, 0.8329979, -1.472024, 1, 0.5411765, 0, 1,
-1.329689, -0.04907675, -2.266928, 1, 0.5450981, 0, 1,
-1.317598, 0.1021173, -3.908934, 1, 0.5529412, 0, 1,
-1.306436, -0.3821084, -2.580029, 1, 0.5568628, 0, 1,
-1.303367, -1.119332, -3.069898, 1, 0.5647059, 0, 1,
-1.302804, 0.1276601, -1.182131, 1, 0.5686275, 0, 1,
-1.301766, 0.8412552, -1.515438, 1, 0.5764706, 0, 1,
-1.291548, -0.7470263, -3.034523, 1, 0.5803922, 0, 1,
-1.280305, -0.5619582, -0.7963294, 1, 0.5882353, 0, 1,
-1.267187, -0.138939, -1.942375, 1, 0.5921569, 0, 1,
-1.267101, 1.01881, 0.3425182, 1, 0.6, 0, 1,
-1.260336, 2.332867, -3.067983, 1, 0.6078432, 0, 1,
-1.25737, -0.6347077, -1.012302, 1, 0.6117647, 0, 1,
-1.236518, 0.968908, -0.3874641, 1, 0.6196079, 0, 1,
-1.22676, 0.9544924, -0.30647, 1, 0.6235294, 0, 1,
-1.216994, -0.9175081, -0.9644006, 1, 0.6313726, 0, 1,
-1.216652, -1.059744, -2.293615, 1, 0.6352941, 0, 1,
-1.208633, 0.9448665, -0.7629949, 1, 0.6431373, 0, 1,
-1.202911, -1.604228, -4.094765, 1, 0.6470588, 0, 1,
-1.201361, -0.02339766, 0.2796049, 1, 0.654902, 0, 1,
-1.198954, 2.198251, -3.487227, 1, 0.6588235, 0, 1,
-1.194437, 1.159897, -0.3803632, 1, 0.6666667, 0, 1,
-1.192298, -0.3214484, -0.3523656, 1, 0.6705883, 0, 1,
-1.189338, -0.2126523, -0.341904, 1, 0.6784314, 0, 1,
-1.183766, -1.660604, -2.357527, 1, 0.682353, 0, 1,
-1.180462, -0.7259322, -0.900237, 1, 0.6901961, 0, 1,
-1.17686, 0.8888881, -0.5523468, 1, 0.6941177, 0, 1,
-1.174851, 0.6230776, -1.171944, 1, 0.7019608, 0, 1,
-1.165793, 0.2943346, -1.661853, 1, 0.7098039, 0, 1,
-1.162108, 0.7173752, -1.06429, 1, 0.7137255, 0, 1,
-1.158172, -0.6951275, -0.2888427, 1, 0.7215686, 0, 1,
-1.158016, -0.4834261, -2.256031, 1, 0.7254902, 0, 1,
-1.150928, -0.04471413, -1.998564, 1, 0.7333333, 0, 1,
-1.149981, 0.02040325, 0.7604375, 1, 0.7372549, 0, 1,
-1.148968, 0.9580192, -0.7140068, 1, 0.7450981, 0, 1,
-1.147109, 0.1728188, -0.8633468, 1, 0.7490196, 0, 1,
-1.133352, -0.2482471, -1.577347, 1, 0.7568628, 0, 1,
-1.129048, -0.1350925, -1.715135, 1, 0.7607843, 0, 1,
-1.123639, -0.9114387, -3.210047, 1, 0.7686275, 0, 1,
-1.123212, 0.3698009, -1.801449, 1, 0.772549, 0, 1,
-1.120854, -1.566429, -3.263659, 1, 0.7803922, 0, 1,
-1.120272, 1.725521, -1.352267, 1, 0.7843137, 0, 1,
-1.11924, 0.1433152, -2.395211, 1, 0.7921569, 0, 1,
-1.119197, 1.625377, -0.4239411, 1, 0.7960784, 0, 1,
-1.115166, -1.557835, -3.136082, 1, 0.8039216, 0, 1,
-1.105718, 0.3158898, -0.1631403, 1, 0.8117647, 0, 1,
-1.102468, 0.910488, 0.1261518, 1, 0.8156863, 0, 1,
-1.101393, 0.4229801, 0.0822909, 1, 0.8235294, 0, 1,
-1.095017, 0.6892598, 0.4227433, 1, 0.827451, 0, 1,
-1.088813, -0.4801644, -3.064759, 1, 0.8352941, 0, 1,
-1.087224, 1.073654, -0.7364242, 1, 0.8392157, 0, 1,
-1.08675, -0.4293425, -2.653092, 1, 0.8470588, 0, 1,
-1.074833, -1.03222, -2.714996, 1, 0.8509804, 0, 1,
-1.067055, -0.06410339, -0.4081647, 1, 0.8588235, 0, 1,
-1.06521, 0.6828595, -2.15821, 1, 0.8627451, 0, 1,
-1.058418, -0.04228783, -2.29731, 1, 0.8705882, 0, 1,
-1.056995, 1.30871, -1.342254, 1, 0.8745098, 0, 1,
-1.052014, -1.32115, -4.257102, 1, 0.8823529, 0, 1,
-1.044713, -1.951087, -3.834863, 1, 0.8862745, 0, 1,
-1.042645, -0.2833123, -1.113216, 1, 0.8941177, 0, 1,
-1.037752, -0.7175223, -3.1522, 1, 0.8980392, 0, 1,
-1.037358, -0.2390015, -2.015607, 1, 0.9058824, 0, 1,
-1.036712, -0.3562873, -4.093893, 1, 0.9137255, 0, 1,
-1.036429, 0.2778054, -0.872427, 1, 0.9176471, 0, 1,
-1.024291, 0.03117567, -1.662149, 1, 0.9254902, 0, 1,
-1.012759, 1.752976, -0.2517563, 1, 0.9294118, 0, 1,
-1.005646, 0.07574158, -1.005916, 1, 0.9372549, 0, 1,
-0.9976695, -0.2423011, -2.111719, 1, 0.9411765, 0, 1,
-0.9968619, 1.068221, -1.360506, 1, 0.9490196, 0, 1,
-0.9953941, -0.3256777, -2.045688, 1, 0.9529412, 0, 1,
-0.9919188, -1.043779, -1.925932, 1, 0.9607843, 0, 1,
-0.9823687, -0.9656219, -2.265184, 1, 0.9647059, 0, 1,
-0.9795245, 0.7267718, -0.04517572, 1, 0.972549, 0, 1,
-0.979304, 0.4328483, -1.051666, 1, 0.9764706, 0, 1,
-0.9717078, -0.6768516, -2.505032, 1, 0.9843137, 0, 1,
-0.9636739, 0.3033496, -2.237931, 1, 0.9882353, 0, 1,
-0.9609429, 0.3310342, -1.687175, 1, 0.9960784, 0, 1,
-0.9507485, 1.109904, 0.1453589, 0.9960784, 1, 0, 1,
-0.9488963, 2.038713, -1.396826, 0.9921569, 1, 0, 1,
-0.9453551, -0.2578758, -1.525032, 0.9843137, 1, 0, 1,
-0.9367518, -0.4213504, -2.242132, 0.9803922, 1, 0, 1,
-0.9326449, -0.3050306, -3.066464, 0.972549, 1, 0, 1,
-0.9304711, 0.8446001, -0.04469543, 0.9686275, 1, 0, 1,
-0.9272847, 0.928484, -1.726863, 0.9607843, 1, 0, 1,
-0.91581, -1.840689, -4.181782, 0.9568627, 1, 0, 1,
-0.9150508, -0.5313402, -2.951496, 0.9490196, 1, 0, 1,
-0.9084732, 1.663214, 0.5791539, 0.945098, 1, 0, 1,
-0.9070278, 0.8952058, -0.2945604, 0.9372549, 1, 0, 1,
-0.9018766, 0.008194012, -1.714334, 0.9333333, 1, 0, 1,
-0.8933611, -0.02291283, -1.030475, 0.9254902, 1, 0, 1,
-0.8810821, -0.1189089, -1.785501, 0.9215686, 1, 0, 1,
-0.8654313, -0.444848, -3.09953, 0.9137255, 1, 0, 1,
-0.8625429, 1.395144, -1.210353, 0.9098039, 1, 0, 1,
-0.8615217, -0.9655803, -2.636267, 0.9019608, 1, 0, 1,
-0.8579161, -0.2228643, -0.3468327, 0.8941177, 1, 0, 1,
-0.8526277, -0.9713005, -1.419162, 0.8901961, 1, 0, 1,
-0.8500813, -0.3144955, -2.305027, 0.8823529, 1, 0, 1,
-0.8439184, 1.035255, 0.2127442, 0.8784314, 1, 0, 1,
-0.843619, -0.8314785, -3.389959, 0.8705882, 1, 0, 1,
-0.8404308, -0.978918, -1.731285, 0.8666667, 1, 0, 1,
-0.8375881, -0.9917101, -3.481438, 0.8588235, 1, 0, 1,
-0.8368717, -1.008682, -2.202461, 0.854902, 1, 0, 1,
-0.8368414, 1.250205, -1.764364, 0.8470588, 1, 0, 1,
-0.8310819, 1.254264, -1.054541, 0.8431373, 1, 0, 1,
-0.8306284, 0.3594139, 0.4951047, 0.8352941, 1, 0, 1,
-0.8278958, 1.092319, 0.1390246, 0.8313726, 1, 0, 1,
-0.8267395, 0.7451262, 0.4357941, 0.8235294, 1, 0, 1,
-0.8261153, -0.9846313, -2.905897, 0.8196079, 1, 0, 1,
-0.8205113, 2.138787, 1.123019, 0.8117647, 1, 0, 1,
-0.8198202, -1.417318, -0.4316132, 0.8078431, 1, 0, 1,
-0.8113695, 0.2386951, -1.986528, 0.8, 1, 0, 1,
-0.8110137, -0.4119789, -3.697586, 0.7921569, 1, 0, 1,
-0.8089643, 1.019955, -0.6417267, 0.7882353, 1, 0, 1,
-0.8053044, -0.6353654, -2.048495, 0.7803922, 1, 0, 1,
-0.8030329, 1.667642, -1.176865, 0.7764706, 1, 0, 1,
-0.7957301, -1.36966, -3.796982, 0.7686275, 1, 0, 1,
-0.791063, -0.1515097, -0.4042951, 0.7647059, 1, 0, 1,
-0.7890499, -0.7618535, -3.705341, 0.7568628, 1, 0, 1,
-0.7880463, 0.4947795, -0.2269115, 0.7529412, 1, 0, 1,
-0.7877514, -0.6155183, -2.472409, 0.7450981, 1, 0, 1,
-0.787209, 0.04707516, -1.290565, 0.7411765, 1, 0, 1,
-0.7831521, -0.4775326, -1.110061, 0.7333333, 1, 0, 1,
-0.7813146, -0.08626509, -2.749121, 0.7294118, 1, 0, 1,
-0.7784759, -0.4210052, -3.908525, 0.7215686, 1, 0, 1,
-0.7752502, -0.8903444, -2.317343, 0.7176471, 1, 0, 1,
-0.7749973, 0.4965534, -0.3011238, 0.7098039, 1, 0, 1,
-0.7689862, 0.9465802, 0.0492155, 0.7058824, 1, 0, 1,
-0.7610471, 1.213682, -0.3475782, 0.6980392, 1, 0, 1,
-0.7605906, -1.778688, -2.416759, 0.6901961, 1, 0, 1,
-0.7587079, 1.713189, -0.8519206, 0.6862745, 1, 0, 1,
-0.7569715, -0.393044, -1.085827, 0.6784314, 1, 0, 1,
-0.7560146, 1.185069, 0.4343321, 0.6745098, 1, 0, 1,
-0.7547606, 0.07072604, -0.6218926, 0.6666667, 1, 0, 1,
-0.7539542, -0.2006993, -1.656465, 0.6627451, 1, 0, 1,
-0.7526167, 1.055034, -0.8787955, 0.654902, 1, 0, 1,
-0.7462961, 0.6418928, -0.8157505, 0.6509804, 1, 0, 1,
-0.7460966, -0.8015919, -1.767936, 0.6431373, 1, 0, 1,
-0.7390045, 0.5789604, -0.3575068, 0.6392157, 1, 0, 1,
-0.738447, -1.12368, -1.604218, 0.6313726, 1, 0, 1,
-0.7374715, 0.1189652, -1.830851, 0.627451, 1, 0, 1,
-0.7290177, -0.5348443, -0.9015497, 0.6196079, 1, 0, 1,
-0.7286403, 0.9042971, -1.091977, 0.6156863, 1, 0, 1,
-0.7282392, -0.3745368, -2.289761, 0.6078432, 1, 0, 1,
-0.7266208, 0.6262849, -1.747321, 0.6039216, 1, 0, 1,
-0.7235088, 0.07764237, -1.840424, 0.5960785, 1, 0, 1,
-0.7188286, 1.726469, 1.032009, 0.5882353, 1, 0, 1,
-0.7128472, 0.09664921, 0.2719274, 0.5843138, 1, 0, 1,
-0.7122503, 1.720419, -1.169951, 0.5764706, 1, 0, 1,
-0.708957, 0.8558426, -0.4180826, 0.572549, 1, 0, 1,
-0.6920425, -0.9550033, -1.917776, 0.5647059, 1, 0, 1,
-0.6913562, 0.7498531, -2.931242, 0.5607843, 1, 0, 1,
-0.6905701, -0.640238, -2.272089, 0.5529412, 1, 0, 1,
-0.6885167, 0.9496226, -1.351857, 0.5490196, 1, 0, 1,
-0.6830239, -0.1673177, -1.912986, 0.5411765, 1, 0, 1,
-0.6818615, -0.4139374, -2.026934, 0.5372549, 1, 0, 1,
-0.6814636, -1.043175, -1.664735, 0.5294118, 1, 0, 1,
-0.6789491, 0.9877896, -1.5036, 0.5254902, 1, 0, 1,
-0.6768399, 0.5953869, -0.1273781, 0.5176471, 1, 0, 1,
-0.6749181, -0.7326275, -5.07495, 0.5137255, 1, 0, 1,
-0.6735297, -2.080295, -3.507909, 0.5058824, 1, 0, 1,
-0.6714478, 0.7746564, -0.7894498, 0.5019608, 1, 0, 1,
-0.6670182, -1.159826, -1.976231, 0.4941176, 1, 0, 1,
-0.6669788, -0.5006648, -3.32434, 0.4862745, 1, 0, 1,
-0.6660097, 1.451787, -1.430936, 0.4823529, 1, 0, 1,
-0.6655809, -0.3806975, -3.109789, 0.4745098, 1, 0, 1,
-0.6640821, -1.332182, -2.666433, 0.4705882, 1, 0, 1,
-0.6630503, 1.987052, -0.978652, 0.4627451, 1, 0, 1,
-0.6601482, -0.6638468, -5.796976, 0.4588235, 1, 0, 1,
-0.6597409, 1.038412, -0.9955329, 0.4509804, 1, 0, 1,
-0.658738, 0.2581569, -0.1640462, 0.4470588, 1, 0, 1,
-0.651082, 0.8841711, -0.7624522, 0.4392157, 1, 0, 1,
-0.6460763, 0.2967326, -1.341272, 0.4352941, 1, 0, 1,
-0.6439495, -0.6639953, -2.071012, 0.427451, 1, 0, 1,
-0.640267, 0.1358772, -1.57436, 0.4235294, 1, 0, 1,
-0.6344699, 0.2263731, -1.198648, 0.4156863, 1, 0, 1,
-0.6296472, -0.1337275, -1.00447, 0.4117647, 1, 0, 1,
-0.6207625, -0.09340262, -1.466836, 0.4039216, 1, 0, 1,
-0.6183638, -0.5464033, -1.5539, 0.3960784, 1, 0, 1,
-0.6124482, 0.786191, -1.148258, 0.3921569, 1, 0, 1,
-0.612263, -0.3244023, -3.443714, 0.3843137, 1, 0, 1,
-0.61181, 0.895396, -3.960865, 0.3803922, 1, 0, 1,
-0.6075431, -0.1621779, -1.169536, 0.372549, 1, 0, 1,
-0.6067751, 1.234442, -0.8436086, 0.3686275, 1, 0, 1,
-0.6051769, 1.305118, -2.448262, 0.3607843, 1, 0, 1,
-0.6000244, -0.2223853, -1.725453, 0.3568628, 1, 0, 1,
-0.5962789, 0.3134182, -0.6360661, 0.3490196, 1, 0, 1,
-0.596154, -0.1712183, -1.349174, 0.345098, 1, 0, 1,
-0.5891508, 1.967157, -0.3600001, 0.3372549, 1, 0, 1,
-0.5820912, -0.7831792, -1.486766, 0.3333333, 1, 0, 1,
-0.5751051, 0.515177, 0.4742388, 0.3254902, 1, 0, 1,
-0.5669661, 0.7927187, -0.2038039, 0.3215686, 1, 0, 1,
-0.5536718, -0.3724129, -1.139111, 0.3137255, 1, 0, 1,
-0.5462129, 1.634116, 0.06276669, 0.3098039, 1, 0, 1,
-0.543905, 0.3993069, -1.841366, 0.3019608, 1, 0, 1,
-0.5426645, -0.5705703, -0.7561513, 0.2941177, 1, 0, 1,
-0.5413222, -1.003991, -1.527827, 0.2901961, 1, 0, 1,
-0.5394536, 0.9106673, -0.8583143, 0.282353, 1, 0, 1,
-0.5383946, 2.187301, 0.9882959, 0.2784314, 1, 0, 1,
-0.5325695, 0.08309208, -1.388753, 0.2705882, 1, 0, 1,
-0.5287135, 1.158761, -1.010718, 0.2666667, 1, 0, 1,
-0.5234215, -0.405121, -0.1575951, 0.2588235, 1, 0, 1,
-0.5204785, -0.1770863, -3.033041, 0.254902, 1, 0, 1,
-0.5193697, 0.1169489, -0.9874273, 0.2470588, 1, 0, 1,
-0.517562, -0.7766082, -2.547129, 0.2431373, 1, 0, 1,
-0.5153199, 1.161908, 0.8365532, 0.2352941, 1, 0, 1,
-0.5083107, -0.2206085, -3.7576, 0.2313726, 1, 0, 1,
-0.5053992, 0.2914428, -1.571683, 0.2235294, 1, 0, 1,
-0.4987454, 1.173288, 0.3698735, 0.2196078, 1, 0, 1,
-0.4971116, -1.054913, -2.614978, 0.2117647, 1, 0, 1,
-0.496755, -0.07311631, -2.089233, 0.2078431, 1, 0, 1,
-0.4949197, 0.9020768, 1.054219, 0.2, 1, 0, 1,
-0.4924163, 0.8581605, 0.3978925, 0.1921569, 1, 0, 1,
-0.4883719, 1.192656, -1.881748, 0.1882353, 1, 0, 1,
-0.4860115, 0.05378009, -1.023708, 0.1803922, 1, 0, 1,
-0.4841558, -0.4629163, -1.74228, 0.1764706, 1, 0, 1,
-0.4826204, 0.1487178, -0.7600456, 0.1686275, 1, 0, 1,
-0.4785065, 1.296561, -1.328093, 0.1647059, 1, 0, 1,
-0.4749866, -0.01010926, -0.9655657, 0.1568628, 1, 0, 1,
-0.4739176, 0.03702803, -2.666102, 0.1529412, 1, 0, 1,
-0.4709643, -1.657347, -2.794338, 0.145098, 1, 0, 1,
-0.4696206, -0.729526, -1.808479, 0.1411765, 1, 0, 1,
-0.4588485, 0.08597293, -2.071472, 0.1333333, 1, 0, 1,
-0.4563252, 0.6832408, -0.5474616, 0.1294118, 1, 0, 1,
-0.4466427, 1.265785, 0.2861085, 0.1215686, 1, 0, 1,
-0.4426329, -1.450849, -4.54785, 0.1176471, 1, 0, 1,
-0.4416325, 0.3569362, -2.039327, 0.1098039, 1, 0, 1,
-0.4410329, 1.011729, -2.053929, 0.1058824, 1, 0, 1,
-0.4403006, -0.992866, -3.360122, 0.09803922, 1, 0, 1,
-0.438719, 0.08660728, -0.5818777, 0.09019608, 1, 0, 1,
-0.4364809, 0.5354351, 1.048188, 0.08627451, 1, 0, 1,
-0.4359838, 1.998617, -1.162454, 0.07843138, 1, 0, 1,
-0.4292309, -1.06035, -3.817005, 0.07450981, 1, 0, 1,
-0.4282144, -0.9818007, -1.742607, 0.06666667, 1, 0, 1,
-0.4261465, 0.196397, 1.014554, 0.0627451, 1, 0, 1,
-0.4257985, -1.476555, -2.980549, 0.05490196, 1, 0, 1,
-0.4231974, -0.2966092, -2.828775, 0.05098039, 1, 0, 1,
-0.4201005, 1.148427, -0.5088305, 0.04313726, 1, 0, 1,
-0.4181813, -1.916929, -3.796319, 0.03921569, 1, 0, 1,
-0.4077848, 1.410478, 1.147197, 0.03137255, 1, 0, 1,
-0.40056, 0.06969868, -3.757327, 0.02745098, 1, 0, 1,
-0.399537, -0.7468711, -3.094804, 0.01960784, 1, 0, 1,
-0.3887714, -0.1736845, -2.387303, 0.01568628, 1, 0, 1,
-0.3812577, 1.155829, 0.8362451, 0.007843138, 1, 0, 1,
-0.3742568, -0.5359379, -1.213954, 0.003921569, 1, 0, 1,
-0.3707839, -0.61739, -3.183983, 0, 1, 0.003921569, 1,
-0.3683013, 1.015485, -3.669843, 0, 1, 0.01176471, 1,
-0.363355, -1.458816, -2.314926, 0, 1, 0.01568628, 1,
-0.3633259, -0.3077256, -3.014106, 0, 1, 0.02352941, 1,
-0.3614281, 0.09614824, -2.281973, 0, 1, 0.02745098, 1,
-0.3609426, -0.511786, -3.131297, 0, 1, 0.03529412, 1,
-0.3592708, 0.2622912, -0.9681237, 0, 1, 0.03921569, 1,
-0.3565048, 2.179224, -0.9822594, 0, 1, 0.04705882, 1,
-0.3547345, -1.113104, -3.111916, 0, 1, 0.05098039, 1,
-0.354148, -1.686989, -2.558623, 0, 1, 0.05882353, 1,
-0.3538323, 0.09186987, -2.680167, 0, 1, 0.0627451, 1,
-0.3499995, -0.4978911, -2.094275, 0, 1, 0.07058824, 1,
-0.3491048, -0.1857326, -2.250815, 0, 1, 0.07450981, 1,
-0.3478675, -0.4021748, -2.704305, 0, 1, 0.08235294, 1,
-0.3430238, 1.547564, -1.347357, 0, 1, 0.08627451, 1,
-0.3394358, -0.8942733, -1.817789, 0, 1, 0.09411765, 1,
-0.3385136, -0.1238257, -0.3627105, 0, 1, 0.1019608, 1,
-0.334564, 0.5744627, -2.361797, 0, 1, 0.1058824, 1,
-0.3342707, 2.805894, 1.410359, 0, 1, 0.1137255, 1,
-0.3273512, 0.3876862, 0.5565244, 0, 1, 0.1176471, 1,
-0.3249255, -0.03858077, -1.483243, 0, 1, 0.1254902, 1,
-0.3246617, -2.007157, -2.401698, 0, 1, 0.1294118, 1,
-0.3235117, 0.2007317, 0.1640342, 0, 1, 0.1372549, 1,
-0.3232129, 0.8537464, 0.3858233, 0, 1, 0.1411765, 1,
-0.3179905, -0.5687144, -3.807267, 0, 1, 0.1490196, 1,
-0.3113357, 1.645254, 0.7836457, 0, 1, 0.1529412, 1,
-0.3087868, 0.4479325, 0.2075771, 0, 1, 0.1607843, 1,
-0.3065762, -0.7532733, -2.854524, 0, 1, 0.1647059, 1,
-0.3060386, -0.2037732, -1.502956, 0, 1, 0.172549, 1,
-0.3045688, -2.023058, -3.857705, 0, 1, 0.1764706, 1,
-0.3021404, -0.4801902, -1.537515, 0, 1, 0.1843137, 1,
-0.2977776, -0.1304849, -3.592788, 0, 1, 0.1882353, 1,
-0.2976874, -2.198059, -2.636417, 0, 1, 0.1960784, 1,
-0.2964339, -0.3176862, -3.047267, 0, 1, 0.2039216, 1,
-0.2923717, 0.135072, -1.763408, 0, 1, 0.2078431, 1,
-0.2910998, 1.884781, 0.3491302, 0, 1, 0.2156863, 1,
-0.2905635, -1.280285, -1.760564, 0, 1, 0.2196078, 1,
-0.2878249, 0.02144972, -0.645983, 0, 1, 0.227451, 1,
-0.2853369, 0.0985399, -2.448744, 0, 1, 0.2313726, 1,
-0.2833932, 1.231622, 0.5127178, 0, 1, 0.2392157, 1,
-0.2822042, 1.437723, 1.022657, 0, 1, 0.2431373, 1,
-0.2816504, 0.3481958, -0.3577877, 0, 1, 0.2509804, 1,
-0.2784267, -1.65687, -3.16526, 0, 1, 0.254902, 1,
-0.2761601, -1.349266, -3.025094, 0, 1, 0.2627451, 1,
-0.2732508, 1.974122, 0.3301877, 0, 1, 0.2666667, 1,
-0.2710106, 1.124375, -1.328955, 0, 1, 0.2745098, 1,
-0.2676061, -1.460597, -3.362306, 0, 1, 0.2784314, 1,
-0.2606872, -1.168561, -2.943739, 0, 1, 0.2862745, 1,
-0.2604775, 0.1449263, -1.01638, 0, 1, 0.2901961, 1,
-0.2600124, 0.08659977, -1.046697, 0, 1, 0.2980392, 1,
-0.2599291, 0.1439108, -0.5538625, 0, 1, 0.3058824, 1,
-0.2575453, -0.4770765, -1.91614, 0, 1, 0.3098039, 1,
-0.256684, 1.481398, -0.6527832, 0, 1, 0.3176471, 1,
-0.2552138, -0.2179802, -1.085769, 0, 1, 0.3215686, 1,
-0.2543579, 0.3600201, -0.4611993, 0, 1, 0.3294118, 1,
-0.2540327, 0.6705391, -1.07419, 0, 1, 0.3333333, 1,
-0.2516049, 1.719687, 1.061059, 0, 1, 0.3411765, 1,
-0.2446512, 0.5044752, 1.54248, 0, 1, 0.345098, 1,
-0.23746, 0.5883439, 0.007801089, 0, 1, 0.3529412, 1,
-0.2357816, -1.0488, -2.928266, 0, 1, 0.3568628, 1,
-0.235288, 2.540028, 1.44492, 0, 1, 0.3647059, 1,
-0.2340126, 0.1330421, -1.162952, 0, 1, 0.3686275, 1,
-0.2339169, -0.9491964, -0.4996292, 0, 1, 0.3764706, 1,
-0.2329926, 1.047044, 0.8522455, 0, 1, 0.3803922, 1,
-0.2317102, -2.258372, -2.687177, 0, 1, 0.3882353, 1,
-0.2278477, -0.4729858, -2.003013, 0, 1, 0.3921569, 1,
-0.2272484, -1.00324, -3.719458, 0, 1, 0.4, 1,
-0.2238269, -1.294807, -3.649419, 0, 1, 0.4078431, 1,
-0.2232089, 1.159514, 1.005842, 0, 1, 0.4117647, 1,
-0.2206335, -1.824718, -4.665969, 0, 1, 0.4196078, 1,
-0.2203903, 0.01500732, 0.02602151, 0, 1, 0.4235294, 1,
-0.2193741, -0.2123447, -1.468873, 0, 1, 0.4313726, 1,
-0.2186774, -0.7246782, -2.921302, 0, 1, 0.4352941, 1,
-0.2125842, -0.04582474, -1.851691, 0, 1, 0.4431373, 1,
-0.2081157, 0.3158239, -1.125918, 0, 1, 0.4470588, 1,
-0.2056981, 1.850957, -1.003786, 0, 1, 0.454902, 1,
-0.20484, 0.2531748, 0.4200939, 0, 1, 0.4588235, 1,
-0.2019667, -1.174581, -1.714298, 0, 1, 0.4666667, 1,
-0.20194, -0.7021319, -0.8421641, 0, 1, 0.4705882, 1,
-0.1988352, -0.3916455, -2.989815, 0, 1, 0.4784314, 1,
-0.1943845, -0.1251066, -2.517412, 0, 1, 0.4823529, 1,
-0.1912222, -2.33816, -3.534018, 0, 1, 0.4901961, 1,
-0.1859208, -0.5218557, -2.22327, 0, 1, 0.4941176, 1,
-0.1834968, -0.4914549, -3.444782, 0, 1, 0.5019608, 1,
-0.1822879, 0.7620958, -0.652303, 0, 1, 0.509804, 1,
-0.180827, 1.19364, 0.317949, 0, 1, 0.5137255, 1,
-0.1806102, -0.8645796, -5.224196, 0, 1, 0.5215687, 1,
-0.1803467, 1.177496, -0.9360391, 0, 1, 0.5254902, 1,
-0.1782897, -0.5618826, -3.787551, 0, 1, 0.5333334, 1,
-0.1738254, 0.3921233, -0.9045376, 0, 1, 0.5372549, 1,
-0.171674, -1.907624, -3.951867, 0, 1, 0.5450981, 1,
-0.1702561, 0.3987851, 0.3943435, 0, 1, 0.5490196, 1,
-0.1673032, 1.157605, 0.07026461, 0, 1, 0.5568628, 1,
-0.1591709, -0.008217825, -2.845886, 0, 1, 0.5607843, 1,
-0.1589196, -0.246324, -1.076516, 0, 1, 0.5686275, 1,
-0.1585754, 1.262182, 0.998198, 0, 1, 0.572549, 1,
-0.1571818, 1.347036, -1.015051, 0, 1, 0.5803922, 1,
-0.15128, -0.9895639, -3.380994, 0, 1, 0.5843138, 1,
-0.1489359, -0.06564695, -2.576186, 0, 1, 0.5921569, 1,
-0.1421291, -0.1032211, -3.109008, 0, 1, 0.5960785, 1,
-0.1417755, 0.134039, -0.23255, 0, 1, 0.6039216, 1,
-0.1387729, 2.289464, -0.1080805, 0, 1, 0.6117647, 1,
-0.1385001, 0.6190416, 0.1499496, 0, 1, 0.6156863, 1,
-0.1377486, -0.8996685, -1.501301, 0, 1, 0.6235294, 1,
-0.1360574, -0.6012062, -2.688768, 0, 1, 0.627451, 1,
-0.1345264, 0.8219283, -1.06189, 0, 1, 0.6352941, 1,
-0.1307875, -1.248122, -3.275626, 0, 1, 0.6392157, 1,
-0.1292236, -0.1714309, -3.00423, 0, 1, 0.6470588, 1,
-0.127899, -1.217248, -3.894351, 0, 1, 0.6509804, 1,
-0.1227458, -0.4878386, -1.227665, 0, 1, 0.6588235, 1,
-0.1227392, 0.9136299, 0.06553429, 0, 1, 0.6627451, 1,
-0.1177369, -0.7431925, -3.127895, 0, 1, 0.6705883, 1,
-0.1173061, 2.614499, -0.2350311, 0, 1, 0.6745098, 1,
-0.1162112, 0.5212319, -0.4981941, 0, 1, 0.682353, 1,
-0.1150172, 0.8768867, 0.0024468, 0, 1, 0.6862745, 1,
-0.1126663, 0.3254493, 0.2834412, 0, 1, 0.6941177, 1,
-0.110689, -0.05321593, -1.679476, 0, 1, 0.7019608, 1,
-0.1082927, 0.9039381, 1.191941, 0, 1, 0.7058824, 1,
-0.1080814, -0.3342181, -2.110932, 0, 1, 0.7137255, 1,
-0.1032594, 0.9523022, 0.2385541, 0, 1, 0.7176471, 1,
-0.09978722, -0.7738219, -3.535047, 0, 1, 0.7254902, 1,
-0.09209102, -0.1198246, -2.98149, 0, 1, 0.7294118, 1,
-0.09191855, -0.852749, -2.975752, 0, 1, 0.7372549, 1,
-0.08788188, 0.3354141, -2.051375, 0, 1, 0.7411765, 1,
-0.07807556, 0.5319248, -0.8231329, 0, 1, 0.7490196, 1,
-0.0731044, 0.4971257, -1.119773, 0, 1, 0.7529412, 1,
-0.07270974, 0.7328388, -0.03969035, 0, 1, 0.7607843, 1,
-0.07225178, -1.551683, -2.598536, 0, 1, 0.7647059, 1,
-0.07088358, -0.08176494, -1.709498, 0, 1, 0.772549, 1,
-0.06858764, 0.7905908, -1.036375, 0, 1, 0.7764706, 1,
-0.0645064, 0.04353728, 0.8769236, 0, 1, 0.7843137, 1,
-0.06104085, 1.878509, 1.068921, 0, 1, 0.7882353, 1,
-0.05849272, 1.115677, -0.2818654, 0, 1, 0.7960784, 1,
-0.05708737, 0.1844647, -0.2241154, 0, 1, 0.8039216, 1,
-0.05686802, -0.3654111, -3.824619, 0, 1, 0.8078431, 1,
-0.05628311, 0.04375229, -0.321843, 0, 1, 0.8156863, 1,
-0.05491708, -0.7449608, -2.485034, 0, 1, 0.8196079, 1,
-0.05189249, -0.5738739, -2.4749, 0, 1, 0.827451, 1,
-0.04966304, -0.9261006, -3.685766, 0, 1, 0.8313726, 1,
-0.04890373, -1.430332, -3.547699, 0, 1, 0.8392157, 1,
-0.04790333, -0.8166513, -3.024647, 0, 1, 0.8431373, 1,
-0.04110794, 0.645299, 0.08625981, 0, 1, 0.8509804, 1,
-0.0388156, -1.243629, -2.842379, 0, 1, 0.854902, 1,
-0.03403649, -0.8769389, -4.646042, 0, 1, 0.8627451, 1,
-0.03256491, -0.3998618, -3.098341, 0, 1, 0.8666667, 1,
-0.03100612, -0.238024, -2.722406, 0, 1, 0.8745098, 1,
-0.02963732, -0.246342, -2.0171, 0, 1, 0.8784314, 1,
-0.02823457, 1.126641, 0.2766214, 0, 1, 0.8862745, 1,
-0.02608488, -2.391953, -2.723466, 0, 1, 0.8901961, 1,
-0.02475629, -1.040755, -3.414089, 0, 1, 0.8980392, 1,
-0.02249836, -0.5339748, -2.051954, 0, 1, 0.9058824, 1,
-0.02152663, -0.4117297, -1.783226, 0, 1, 0.9098039, 1,
-0.01731402, -0.1105667, -0.7433199, 0, 1, 0.9176471, 1,
-0.005834941, 0.4371387, -0.3232048, 0, 1, 0.9215686, 1,
-0.005519571, 0.4803956, 0.2275521, 0, 1, 0.9294118, 1,
-0.005211555, 1.080074, -0.2410263, 0, 1, 0.9333333, 1,
-0.004482222, 1.812906, -1.233816, 0, 1, 0.9411765, 1,
-0.00399061, 1.194968, -1.60566, 0, 1, 0.945098, 1,
0.005717801, -0.09294593, 2.819094, 0, 1, 0.9529412, 1,
0.006174427, 1.369823, -1.357263, 0, 1, 0.9568627, 1,
0.01247417, 1.228312, -1.227142, 0, 1, 0.9647059, 1,
0.01352798, 3.001546, 0.003157714, 0, 1, 0.9686275, 1,
0.01396992, -2.189223, 3.184474, 0, 1, 0.9764706, 1,
0.01510502, 0.3540559, 0.6873776, 0, 1, 0.9803922, 1,
0.01625349, 0.2734527, 1.28961, 0, 1, 0.9882353, 1,
0.02491614, -2.066348, 3.056733, 0, 1, 0.9921569, 1,
0.02635049, 0.3484579, 0.1663348, 0, 1, 1, 1,
0.0276576, -1.106001, 3.985482, 0, 0.9921569, 1, 1,
0.0278926, -0.3498786, 4.223666, 0, 0.9882353, 1, 1,
0.0285205, 0.2613089, -1.134437, 0, 0.9803922, 1, 1,
0.03245022, -0.07027747, 3.117901, 0, 0.9764706, 1, 1,
0.03542536, -1.141388, 1.728867, 0, 0.9686275, 1, 1,
0.03638514, 1.70238, -1.845413, 0, 0.9647059, 1, 1,
0.03947894, -0.5708702, 0.7175983, 0, 0.9568627, 1, 1,
0.03970407, -0.7044607, 3.135814, 0, 0.9529412, 1, 1,
0.04134487, 1.165783, -0.4440845, 0, 0.945098, 1, 1,
0.04830123, -0.3477466, 2.576272, 0, 0.9411765, 1, 1,
0.04981669, -0.7629357, 3.468301, 0, 0.9333333, 1, 1,
0.05007897, -0.05187896, 2.109937, 0, 0.9294118, 1, 1,
0.05066022, -1.14391, 3.121819, 0, 0.9215686, 1, 1,
0.05147678, 0.827268, 1.218831, 0, 0.9176471, 1, 1,
0.05334002, -0.3976684, 3.150722, 0, 0.9098039, 1, 1,
0.05419479, -0.2336104, 2.899043, 0, 0.9058824, 1, 1,
0.05654999, -0.6623156, 3.66087, 0, 0.8980392, 1, 1,
0.05976856, -0.1077142, 3.037385, 0, 0.8901961, 1, 1,
0.06313848, 0.3966738, 0.2329114, 0, 0.8862745, 1, 1,
0.06314857, -1.741898, 0.6487958, 0, 0.8784314, 1, 1,
0.06370937, 1.421587, -0.8780922, 0, 0.8745098, 1, 1,
0.06511159, -1.440512, 2.757125, 0, 0.8666667, 1, 1,
0.06519567, 0.4439217, 0.6846779, 0, 0.8627451, 1, 1,
0.06707069, -2.090035, 2.041045, 0, 0.854902, 1, 1,
0.0709191, -0.05914032, 2.401649, 0, 0.8509804, 1, 1,
0.0714143, 0.5849378, 1.356693, 0, 0.8431373, 1, 1,
0.0721011, -0.03027782, -0.02268861, 0, 0.8392157, 1, 1,
0.07231598, 2.509223, 0.06425934, 0, 0.8313726, 1, 1,
0.07492042, -1.51345, 3.482719, 0, 0.827451, 1, 1,
0.07864309, -1.450727, 4.42407, 0, 0.8196079, 1, 1,
0.07886799, -1.688907, 1.823736, 0, 0.8156863, 1, 1,
0.08014293, 2.192654, 0.3078253, 0, 0.8078431, 1, 1,
0.08051677, 1.575432, 1.102266, 0, 0.8039216, 1, 1,
0.08237939, -1.734801, 2.797666, 0, 0.7960784, 1, 1,
0.08449706, -0.08606248, 3.716331, 0, 0.7882353, 1, 1,
0.08585394, 2.274706, -0.7184596, 0, 0.7843137, 1, 1,
0.08590659, 0.6877269, -0.3688406, 0, 0.7764706, 1, 1,
0.09062431, -0.5208222, 3.460323, 0, 0.772549, 1, 1,
0.09227619, 0.6397224, -1.15203, 0, 0.7647059, 1, 1,
0.09347581, 1.66429, -0.0151525, 0, 0.7607843, 1, 1,
0.09579668, -0.3670806, 3.810458, 0, 0.7529412, 1, 1,
0.104424, -0.1076885, 4.207649, 0, 0.7490196, 1, 1,
0.105156, -1.31829, 3.46305, 0, 0.7411765, 1, 1,
0.110882, 0.3270153, -0.06436094, 0, 0.7372549, 1, 1,
0.1128439, 0.3162729, -0.7783796, 0, 0.7294118, 1, 1,
0.113205, -0.1753699, 3.780956, 0, 0.7254902, 1, 1,
0.1163531, -0.7224544, 2.623434, 0, 0.7176471, 1, 1,
0.1167622, 0.191226, 2.165954, 0, 0.7137255, 1, 1,
0.1227813, -0.7126469, 2.453927, 0, 0.7058824, 1, 1,
0.1228291, -0.298318, 3.19157, 0, 0.6980392, 1, 1,
0.1240382, 0.2473202, 0.2967335, 0, 0.6941177, 1, 1,
0.1271942, 0.5700518, -1.149072, 0, 0.6862745, 1, 1,
0.127446, 0.2572371, 1.806348, 0, 0.682353, 1, 1,
0.1282622, -1.297666, 3.36665, 0, 0.6745098, 1, 1,
0.134322, -1.095898, 3.814736, 0, 0.6705883, 1, 1,
0.1383824, 1.406249, -1.198857, 0, 0.6627451, 1, 1,
0.1399896, 0.08266202, 1.151998, 0, 0.6588235, 1, 1,
0.1493166, 1.120405, 1.950694, 0, 0.6509804, 1, 1,
0.1499849, -0.8886056, 3.496169, 0, 0.6470588, 1, 1,
0.150134, -2.132187, 4.206274, 0, 0.6392157, 1, 1,
0.1512951, 0.1201748, 0.5690783, 0, 0.6352941, 1, 1,
0.1566801, 0.874677, 0.5247191, 0, 0.627451, 1, 1,
0.1570908, -1.31409, 3.315204, 0, 0.6235294, 1, 1,
0.1583562, 1.110629, 0.1729271, 0, 0.6156863, 1, 1,
0.1590553, 1.354199, 0.508159, 0, 0.6117647, 1, 1,
0.1606644, 0.2808283, 1.159113, 0, 0.6039216, 1, 1,
0.1608533, -0.4073886, 2.575551, 0, 0.5960785, 1, 1,
0.1689567, -1.368007, 1.728776, 0, 0.5921569, 1, 1,
0.1744529, 0.6734245, -1.308384, 0, 0.5843138, 1, 1,
0.1771245, -0.5156716, 1.403425, 0, 0.5803922, 1, 1,
0.1778478, 0.1820472, -0.6481541, 0, 0.572549, 1, 1,
0.1838962, -0.7330098, 2.877409, 0, 0.5686275, 1, 1,
0.1849659, -0.6461775, 3.22731, 0, 0.5607843, 1, 1,
0.1866067, 0.3841851, 0.06768449, 0, 0.5568628, 1, 1,
0.1869674, -0.9915329, 2.311813, 0, 0.5490196, 1, 1,
0.1895162, -0.9601978, 2.7273, 0, 0.5450981, 1, 1,
0.1896902, -0.2365384, 1.957398, 0, 0.5372549, 1, 1,
0.1903256, 0.7764914, -0.6413231, 0, 0.5333334, 1, 1,
0.191978, -0.9214196, 3.575523, 0, 0.5254902, 1, 1,
0.1952577, -0.006843413, 1.904758, 0, 0.5215687, 1, 1,
0.1998464, -0.9609379, 2.838547, 0, 0.5137255, 1, 1,
0.2045035, 0.9138909, -0.03958083, 0, 0.509804, 1, 1,
0.2046764, 0.5434815, 1.307192, 0, 0.5019608, 1, 1,
0.2055407, -0.4069518, 3.570141, 0, 0.4941176, 1, 1,
0.212072, 2.006945, -0.4242122, 0, 0.4901961, 1, 1,
0.2126589, 0.4289895, -0.3819341, 0, 0.4823529, 1, 1,
0.2131724, -0.1451612, 1.924498, 0, 0.4784314, 1, 1,
0.2194933, 1.570375, -0.8970243, 0, 0.4705882, 1, 1,
0.2231351, 0.8524711, 0.4100416, 0, 0.4666667, 1, 1,
0.2257181, 0.4814673, 1.150433, 0, 0.4588235, 1, 1,
0.2287231, -0.03377503, 0.7897786, 0, 0.454902, 1, 1,
0.2303227, 1.867862, 0.5484042, 0, 0.4470588, 1, 1,
0.231071, 0.4987496, -0.8267928, 0, 0.4431373, 1, 1,
0.2335658, 0.5153092, -0.0796955, 0, 0.4352941, 1, 1,
0.2363932, 0.2283053, 0.7303515, 0, 0.4313726, 1, 1,
0.2408028, 0.02456097, 1.973884, 0, 0.4235294, 1, 1,
0.2458862, 0.6668867, 0.7238199, 0, 0.4196078, 1, 1,
0.2493946, -0.6922902, 3.936604, 0, 0.4117647, 1, 1,
0.2620384, 1.038254, 0.4496068, 0, 0.4078431, 1, 1,
0.2628602, -0.05435688, 2.929032, 0, 0.4, 1, 1,
0.2650341, 0.6237261, 0.0001411203, 0, 0.3921569, 1, 1,
0.2653788, -0.5629874, 4.643993, 0, 0.3882353, 1, 1,
0.2676938, -2.018354, 3.930733, 0, 0.3803922, 1, 1,
0.2686963, -0.0531461, 0.6808328, 0, 0.3764706, 1, 1,
0.2687958, 0.00328391, 2.524204, 0, 0.3686275, 1, 1,
0.2732801, 0.6044826, -0.1691502, 0, 0.3647059, 1, 1,
0.2776564, -0.6443928, 1.512102, 0, 0.3568628, 1, 1,
0.2801193, 0.5700009, -1.862588, 0, 0.3529412, 1, 1,
0.2813195, 1.184553, -0.3304448, 0, 0.345098, 1, 1,
0.2836297, -0.04192339, 2.356509, 0, 0.3411765, 1, 1,
0.2837848, -1.312997, 4.284368, 0, 0.3333333, 1, 1,
0.2861964, -1.102169, 0.4195993, 0, 0.3294118, 1, 1,
0.2872688, 0.7047086, -0.7077065, 0, 0.3215686, 1, 1,
0.2885508, -1.232465, 3.204114, 0, 0.3176471, 1, 1,
0.2903019, 1.883192, 0.5537351, 0, 0.3098039, 1, 1,
0.2941827, -0.8286491, 3.25442, 0, 0.3058824, 1, 1,
0.2959515, -0.1088718, 2.018106, 0, 0.2980392, 1, 1,
0.3032542, 0.1390967, 1.210795, 0, 0.2901961, 1, 1,
0.3045144, -0.2549811, 3.539994, 0, 0.2862745, 1, 1,
0.3066561, -0.6730881, 4.340286, 0, 0.2784314, 1, 1,
0.3085615, -0.5793428, 3.140093, 0, 0.2745098, 1, 1,
0.3117987, 1.743622, 1.916493, 0, 0.2666667, 1, 1,
0.3158256, -0.4826301, 2.665336, 0, 0.2627451, 1, 1,
0.3171421, 0.5817745, 0.583568, 0, 0.254902, 1, 1,
0.3212978, -0.4765324, 3.127766, 0, 0.2509804, 1, 1,
0.3215103, 1.050023, -0.2785002, 0, 0.2431373, 1, 1,
0.3257968, -0.3546511, 2.21395, 0, 0.2392157, 1, 1,
0.3287448, -1.697789, 2.941945, 0, 0.2313726, 1, 1,
0.3300266, -0.09594923, 2.432283, 0, 0.227451, 1, 1,
0.331135, -0.06295758, 1.169386, 0, 0.2196078, 1, 1,
0.3334112, 1.811576, 1.395543, 0, 0.2156863, 1, 1,
0.3376368, 1.218901, 0.1650232, 0, 0.2078431, 1, 1,
0.3386225, -0.6055484, 3.442882, 0, 0.2039216, 1, 1,
0.339391, -0.3926145, 3.11758, 0, 0.1960784, 1, 1,
0.339644, -0.8922983, 3.087793, 0, 0.1882353, 1, 1,
0.3411133, 0.847239, 0.2924435, 0, 0.1843137, 1, 1,
0.3426971, 0.3548885, 1.523625, 0, 0.1764706, 1, 1,
0.3433986, 0.8739125, -0.6927902, 0, 0.172549, 1, 1,
0.3454158, 0.2885253, 0.4563122, 0, 0.1647059, 1, 1,
0.3478912, -1.204327, 3.525305, 0, 0.1607843, 1, 1,
0.348152, -0.8820533, 1.82007, 0, 0.1529412, 1, 1,
0.3537498, -0.4011793, 2.515893, 0, 0.1490196, 1, 1,
0.3545505, 0.06899464, 0.9080115, 0, 0.1411765, 1, 1,
0.3634982, 0.8521553, 0.5804857, 0, 0.1372549, 1, 1,
0.3680668, 1.161081, -0.9550992, 0, 0.1294118, 1, 1,
0.3687885, 0.2368952, -0.1686629, 0, 0.1254902, 1, 1,
0.3723366, -0.7490155, 0.9302241, 0, 0.1176471, 1, 1,
0.3788972, 0.8020453, 2.00192, 0, 0.1137255, 1, 1,
0.380394, -0.7223992, 3.907865, 0, 0.1058824, 1, 1,
0.3850462, -0.3086886, 2.350816, 0, 0.09803922, 1, 1,
0.385114, 0.2503552, 1.850048, 0, 0.09411765, 1, 1,
0.3885253, 0.3279382, 3.577919, 0, 0.08627451, 1, 1,
0.3940977, 0.1204454, -0.2308726, 0, 0.08235294, 1, 1,
0.3958226, -1.100379, 3.812312, 0, 0.07450981, 1, 1,
0.396151, 0.8617475, 1.438343, 0, 0.07058824, 1, 1,
0.4011813, -0.1090276, 1.319441, 0, 0.0627451, 1, 1,
0.4034806, -0.3733858, 0.7495894, 0, 0.05882353, 1, 1,
0.4044303, -1.211801, 3.219131, 0, 0.05098039, 1, 1,
0.4062515, 0.845664, -0.10169, 0, 0.04705882, 1, 1,
0.4064794, 1.574943, -1.389448, 0, 0.03921569, 1, 1,
0.4105069, -0.4227053, 2.332258, 0, 0.03529412, 1, 1,
0.4109762, 0.139266, 1.715368, 0, 0.02745098, 1, 1,
0.4168323, -0.9748921, 2.408082, 0, 0.02352941, 1, 1,
0.4174211, -0.2566304, 2.825904, 0, 0.01568628, 1, 1,
0.4194846, -0.7895734, 2.244256, 0, 0.01176471, 1, 1,
0.4224623, 1.928384, 0.3131261, 0, 0.003921569, 1, 1,
0.4329296, -0.6255201, 1.533837, 0.003921569, 0, 1, 1,
0.4349338, -0.7892135, 2.522308, 0.007843138, 0, 1, 1,
0.4381576, -0.04309383, 1.745444, 0.01568628, 0, 1, 1,
0.441449, -0.8035436, 2.769287, 0.01960784, 0, 1, 1,
0.4435454, -0.0630194, 0.7673261, 0.02745098, 0, 1, 1,
0.4450627, 2.35394, -1.231934, 0.03137255, 0, 1, 1,
0.4457179, 0.9632469, -0.3860037, 0.03921569, 0, 1, 1,
0.4457743, -0.2516717, 2.121485, 0.04313726, 0, 1, 1,
0.4473453, 0.678541, -0.1425418, 0.05098039, 0, 1, 1,
0.4481845, -1.726351, 4.026793, 0.05490196, 0, 1, 1,
0.4503474, -0.1519536, 0.7479966, 0.0627451, 0, 1, 1,
0.4582053, -0.2895446, 4.582065, 0.06666667, 0, 1, 1,
0.4602613, 0.4936058, -0.1255848, 0.07450981, 0, 1, 1,
0.4643627, 0.6979963, -0.4623542, 0.07843138, 0, 1, 1,
0.4657098, -1.855707, 3.793468, 0.08627451, 0, 1, 1,
0.4686148, -0.205318, 2.836073, 0.09019608, 0, 1, 1,
0.4714965, -0.5934016, 2.405152, 0.09803922, 0, 1, 1,
0.4817341, 0.3479003, 1.940008, 0.1058824, 0, 1, 1,
0.4847104, 1.319936, 0.3625104, 0.1098039, 0, 1, 1,
0.4873165, -0.2746382, 2.874011, 0.1176471, 0, 1, 1,
0.4917835, -0.9019195, 3.584695, 0.1215686, 0, 1, 1,
0.4945071, -1.651054, 2.332676, 0.1294118, 0, 1, 1,
0.4956194, -0.237603, 2.49746, 0.1333333, 0, 1, 1,
0.4962161, -0.6668835, 2.604184, 0.1411765, 0, 1, 1,
0.5013275, -1.487271, 4.051569, 0.145098, 0, 1, 1,
0.5037475, -0.6953219, 2.495912, 0.1529412, 0, 1, 1,
0.5038851, -0.626605, 3.322054, 0.1568628, 0, 1, 1,
0.5105081, 0.1091115, 2.149606, 0.1647059, 0, 1, 1,
0.5196964, -1.05399, 3.684058, 0.1686275, 0, 1, 1,
0.520255, -0.7126672, -0.3599497, 0.1764706, 0, 1, 1,
0.5220827, 0.1658848, -1.317012, 0.1803922, 0, 1, 1,
0.52294, -0.4147467, 3.19542, 0.1882353, 0, 1, 1,
0.5248219, -0.4773296, 2.63119, 0.1921569, 0, 1, 1,
0.52714, 0.08245132, 0.3465388, 0.2, 0, 1, 1,
0.5285351, 0.2065294, 1.474411, 0.2078431, 0, 1, 1,
0.530987, 0.3831888, 2.108238, 0.2117647, 0, 1, 1,
0.5310674, -0.2398737, 0.9581937, 0.2196078, 0, 1, 1,
0.5345505, -0.7708081, 3.931963, 0.2235294, 0, 1, 1,
0.5405614, -1.115563, 2.856296, 0.2313726, 0, 1, 1,
0.5453855, -0.7196233, 1.920369, 0.2352941, 0, 1, 1,
0.5488172, 0.6356226, 0.6872823, 0.2431373, 0, 1, 1,
0.5533797, 0.1592374, 1.637807, 0.2470588, 0, 1, 1,
0.554879, -0.4167821, 2.589269, 0.254902, 0, 1, 1,
0.5562172, -0.2690831, 1.221758, 0.2588235, 0, 1, 1,
0.5583238, -0.1211446, 2.402457, 0.2666667, 0, 1, 1,
0.5649216, -2.300753, 4.297608, 0.2705882, 0, 1, 1,
0.5695818, 0.8341578, -0.6051377, 0.2784314, 0, 1, 1,
0.5723889, 1.303758, 2.069323, 0.282353, 0, 1, 1,
0.5752566, 1.022196, 0.427528, 0.2901961, 0, 1, 1,
0.5796371, -0.5882182, 2.207338, 0.2941177, 0, 1, 1,
0.5811573, -0.4779531, 0.8787118, 0.3019608, 0, 1, 1,
0.5832112, 0.01894227, 1.69436, 0.3098039, 0, 1, 1,
0.5847557, 1.381813, -0.8118545, 0.3137255, 0, 1, 1,
0.5901949, -0.06999677, 0.6765116, 0.3215686, 0, 1, 1,
0.5938926, -2.453433, 3.444823, 0.3254902, 0, 1, 1,
0.5954678, -0.806103, 1.416442, 0.3333333, 0, 1, 1,
0.5965301, -0.5084193, 0.1768277, 0.3372549, 0, 1, 1,
0.6000624, -0.6850753, 0.8440214, 0.345098, 0, 1, 1,
0.6016523, -0.1985746, 0.5850108, 0.3490196, 0, 1, 1,
0.6017314, -1.139123, 3.231308, 0.3568628, 0, 1, 1,
0.6022797, 0.2035859, 1.435697, 0.3607843, 0, 1, 1,
0.6046325, -1.600952, 3.776144, 0.3686275, 0, 1, 1,
0.6058524, 0.0006372849, 2.244851, 0.372549, 0, 1, 1,
0.6107358, -1.636783, 3.848562, 0.3803922, 0, 1, 1,
0.6140612, 0.9702015, 0.774017, 0.3843137, 0, 1, 1,
0.6155851, 1.011389, 0.1818065, 0.3921569, 0, 1, 1,
0.6184078, -0.2832505, 4.094563, 0.3960784, 0, 1, 1,
0.6191592, 1.255049, 1.702558, 0.4039216, 0, 1, 1,
0.6198097, 0.5494016, 0.5545248, 0.4117647, 0, 1, 1,
0.6201497, -0.02896534, 2.887811, 0.4156863, 0, 1, 1,
0.6246085, 0.3618797, 0.7336635, 0.4235294, 0, 1, 1,
0.6365529, 1.076777, 2.540315, 0.427451, 0, 1, 1,
0.6376919, -1.89673, 3.694855, 0.4352941, 0, 1, 1,
0.6404968, 0.3184488, -0.8199182, 0.4392157, 0, 1, 1,
0.6423569, -0.02291902, 3.070585, 0.4470588, 0, 1, 1,
0.643894, -0.5689592, 2.062277, 0.4509804, 0, 1, 1,
0.6462939, 1.364016, 1.053127, 0.4588235, 0, 1, 1,
0.647391, 1.224375, -0.5621446, 0.4627451, 0, 1, 1,
0.6526725, -1.80242, 3.062045, 0.4705882, 0, 1, 1,
0.654323, 0.4603698, 2.897063, 0.4745098, 0, 1, 1,
0.6557305, -0.6282486, 2.652854, 0.4823529, 0, 1, 1,
0.6560658, -0.4213115, 2.515544, 0.4862745, 0, 1, 1,
0.657459, 1.233824, -1.151926, 0.4941176, 0, 1, 1,
0.6634701, 0.7199007, 0.7037914, 0.5019608, 0, 1, 1,
0.6648309, 1.470779, -2.076115, 0.5058824, 0, 1, 1,
0.667464, -0.005963894, 2.586141, 0.5137255, 0, 1, 1,
0.6690089, -0.9178988, 1.892377, 0.5176471, 0, 1, 1,
0.6710184, -0.590725, 2.623103, 0.5254902, 0, 1, 1,
0.6716778, -1.4912, 1.710245, 0.5294118, 0, 1, 1,
0.6731776, -1.59545, 2.53001, 0.5372549, 0, 1, 1,
0.6735222, 0.5292921, 0.367196, 0.5411765, 0, 1, 1,
0.6871659, 0.07856558, 1.719199, 0.5490196, 0, 1, 1,
0.6907917, -1.437272, 3.009459, 0.5529412, 0, 1, 1,
0.6912354, -0.2451129, 2.893085, 0.5607843, 0, 1, 1,
0.6914508, -0.6242989, 1.804436, 0.5647059, 0, 1, 1,
0.6995874, -0.7966724, 1.522737, 0.572549, 0, 1, 1,
0.6999752, 0.8914793, -0.7941937, 0.5764706, 0, 1, 1,
0.7015625, -2.01745, 3.848526, 0.5843138, 0, 1, 1,
0.7024086, 1.102802, 1.498032, 0.5882353, 0, 1, 1,
0.7036926, -0.618156, 1.758833, 0.5960785, 0, 1, 1,
0.7046449, 1.286344, -0.3258241, 0.6039216, 0, 1, 1,
0.7131953, -0.9063951, -0.1231354, 0.6078432, 0, 1, 1,
0.7162464, 1.72102, -0.2213359, 0.6156863, 0, 1, 1,
0.7174031, -0.1092133, 1.962707, 0.6196079, 0, 1, 1,
0.7263785, -0.4975116, 2.38567, 0.627451, 0, 1, 1,
0.729889, 0.840274, -0.2798033, 0.6313726, 0, 1, 1,
0.7325687, 0.3201694, 2.612433, 0.6392157, 0, 1, 1,
0.7377095, -0.5340162, 3.513047, 0.6431373, 0, 1, 1,
0.7383481, -0.7944941, 3.283467, 0.6509804, 0, 1, 1,
0.739062, -1.058266, 1.229024, 0.654902, 0, 1, 1,
0.7509456, 1.000958, 1.101596, 0.6627451, 0, 1, 1,
0.751864, 1.40333, 0.4530297, 0.6666667, 0, 1, 1,
0.7530852, -0.1118309, 0.9566234, 0.6745098, 0, 1, 1,
0.7549583, 1.990757, -1.011293, 0.6784314, 0, 1, 1,
0.7567075, 0.135142, 0.07656841, 0.6862745, 0, 1, 1,
0.7654993, -0.3647971, 2.745257, 0.6901961, 0, 1, 1,
0.772523, 1.44566, 1.238472, 0.6980392, 0, 1, 1,
0.776801, 0.3693047, 1.470963, 0.7058824, 0, 1, 1,
0.7778735, -1.193289, 2.189146, 0.7098039, 0, 1, 1,
0.7787016, 1.682755, 0.1805547, 0.7176471, 0, 1, 1,
0.7825652, 0.7364266, 0.4945497, 0.7215686, 0, 1, 1,
0.783388, -0.1312855, 1.378496, 0.7294118, 0, 1, 1,
0.7901248, -0.6106842, 1.690479, 0.7333333, 0, 1, 1,
0.7905941, 0.2600277, 0.7208987, 0.7411765, 0, 1, 1,
0.7934322, 1.027349, 0.9541533, 0.7450981, 0, 1, 1,
0.8020945, 0.3343623, 2.101375, 0.7529412, 0, 1, 1,
0.8069629, 1.234925, 0.7516281, 0.7568628, 0, 1, 1,
0.8085641, 0.4241273, 1.999502, 0.7647059, 0, 1, 1,
0.8100414, 0.7058121, 1.365517, 0.7686275, 0, 1, 1,
0.8148533, -0.08596911, 0.8103886, 0.7764706, 0, 1, 1,
0.8186454, -0.03351936, 1.750339, 0.7803922, 0, 1, 1,
0.820385, 0.8306507, -0.6796356, 0.7882353, 0, 1, 1,
0.820422, 0.7497876, 0.6744115, 0.7921569, 0, 1, 1,
0.8251768, -1.879076, 3.358987, 0.8, 0, 1, 1,
0.8289363, 0.2362313, 1.735413, 0.8078431, 0, 1, 1,
0.8298914, 0.4842109, 1.463895, 0.8117647, 0, 1, 1,
0.8301607, -0.2314873, 2.303731, 0.8196079, 0, 1, 1,
0.8303676, 0.826967, 0.9226782, 0.8235294, 0, 1, 1,
0.8383977, 0.5988395, -0.5521903, 0.8313726, 0, 1, 1,
0.8408402, -1.184552, 2.818772, 0.8352941, 0, 1, 1,
0.8437584, -0.2271994, 2.020788, 0.8431373, 0, 1, 1,
0.853236, -1.109509, 2.589919, 0.8470588, 0, 1, 1,
0.8534036, -1.027482, 1.812134, 0.854902, 0, 1, 1,
0.8568016, -0.2432221, 1.418941, 0.8588235, 0, 1, 1,
0.8633957, 0.07223089, 1.48082, 0.8666667, 0, 1, 1,
0.8637404, 0.1418932, 0.5740183, 0.8705882, 0, 1, 1,
0.8653616, -0.2950684, 0.8195181, 0.8784314, 0, 1, 1,
0.8663498, 1.092312, -0.4336923, 0.8823529, 0, 1, 1,
0.8723849, 0.9646946, -0.4741923, 0.8901961, 0, 1, 1,
0.8807537, 0.3900636, 1.588516, 0.8941177, 0, 1, 1,
0.8848094, 0.5217406, 1.501096, 0.9019608, 0, 1, 1,
0.8861895, 0.1399869, 2.108001, 0.9098039, 0, 1, 1,
0.8943032, -0.23346, 1.791241, 0.9137255, 0, 1, 1,
0.8982635, -1.564846, 2.526798, 0.9215686, 0, 1, 1,
0.8993928, -1.071686, 4.905671, 0.9254902, 0, 1, 1,
0.9001177, -0.314102, 2.359781, 0.9333333, 0, 1, 1,
0.9052133, 0.7993454, -0.006841632, 0.9372549, 0, 1, 1,
0.9086192, -0.6756776, 1.569048, 0.945098, 0, 1, 1,
0.9107019, -0.0659146, 1.620744, 0.9490196, 0, 1, 1,
0.9120604, -1.05803, 3.272324, 0.9568627, 0, 1, 1,
0.9136434, 0.6173816, 0.2983057, 0.9607843, 0, 1, 1,
0.9151254, 0.8124144, 0.9677536, 0.9686275, 0, 1, 1,
0.91552, -0.3680822, 4.31018, 0.972549, 0, 1, 1,
0.9226446, -0.2147406, 2.490179, 0.9803922, 0, 1, 1,
0.92713, 0.927101, 1.334564, 0.9843137, 0, 1, 1,
0.9305551, -0.6172297, 2.412264, 0.9921569, 0, 1, 1,
0.9325067, 0.7852855, 0.8937083, 0.9960784, 0, 1, 1,
0.935983, 0.7399445, 1.518822, 1, 0, 0.9960784, 1,
0.9395619, 1.273006, 1.234705, 1, 0, 0.9882353, 1,
0.942728, 0.1877086, 0.2995165, 1, 0, 0.9843137, 1,
0.9466597, 0.2460301, -0.3091273, 1, 0, 0.9764706, 1,
0.9497054, 0.05725165, 1.280362, 1, 0, 0.972549, 1,
0.9528265, -0.1389713, 2.193727, 1, 0, 0.9647059, 1,
0.9551944, 0.6134818, 0.9005886, 1, 0, 0.9607843, 1,
0.9579052, -0.1840273, 1.663452, 1, 0, 0.9529412, 1,
0.9719822, 0.7695725, 1.783222, 1, 0, 0.9490196, 1,
0.9739259, -1.230959, 3.321686, 1, 0, 0.9411765, 1,
0.9767299, -0.4642714, 3.0356, 1, 0, 0.9372549, 1,
0.979349, -0.2017415, 1.602911, 1, 0, 0.9294118, 1,
0.9814007, -0.6890204, 3.005654, 1, 0, 0.9254902, 1,
0.9820085, 0.5105091, 0.3440783, 1, 0, 0.9176471, 1,
0.9821455, 0.1336471, 1.854051, 1, 0, 0.9137255, 1,
0.98554, -1.502051, 2.728063, 1, 0, 0.9058824, 1,
0.9928784, -0.6426082, 0.3512397, 1, 0, 0.9019608, 1,
0.999162, 2.182913, 1.346208, 1, 0, 0.8941177, 1,
1.008965, -1.051754, 2.489858, 1, 0, 0.8862745, 1,
1.010341, -0.009690866, 0.3445538, 1, 0, 0.8823529, 1,
1.018036, 0.7095174, 1.980606, 1, 0, 0.8745098, 1,
1.02273, 0.2189798, 0.5753267, 1, 0, 0.8705882, 1,
1.029602, -0.4892908, 2.540953, 1, 0, 0.8627451, 1,
1.038813, -0.498794, 1.774497, 1, 0, 0.8588235, 1,
1.043725, -1.42283, 2.878587, 1, 0, 0.8509804, 1,
1.059734, -0.3249525, 1.497758, 1, 0, 0.8470588, 1,
1.061591, -0.1002649, 1.572627, 1, 0, 0.8392157, 1,
1.078096, 0.2894325, -1.484049, 1, 0, 0.8352941, 1,
1.081317, -1.285103, 3.420964, 1, 0, 0.827451, 1,
1.084145, 2.690661, -0.2398238, 1, 0, 0.8235294, 1,
1.091272, 0.1033948, 1.781961, 1, 0, 0.8156863, 1,
1.096406, -0.01627301, 2.354536, 1, 0, 0.8117647, 1,
1.102599, 0.1668274, -0.0301838, 1, 0, 0.8039216, 1,
1.111035, -0.7777438, 1.759741, 1, 0, 0.7960784, 1,
1.114909, -2.43934, 1.815881, 1, 0, 0.7921569, 1,
1.120808, -1.067916, 3.670614, 1, 0, 0.7843137, 1,
1.121035, 0.7068399, 0.1778576, 1, 0, 0.7803922, 1,
1.121566, 2.058723, 0.2328181, 1, 0, 0.772549, 1,
1.122397, -1.081422, 3.860426, 1, 0, 0.7686275, 1,
1.128435, 0.3313517, -0.4012747, 1, 0, 0.7607843, 1,
1.129668, 0.243204, 1.533935, 1, 0, 0.7568628, 1,
1.129707, 0.2846785, 3.001697, 1, 0, 0.7490196, 1,
1.146766, 0.9488927, 0.1204354, 1, 0, 0.7450981, 1,
1.147325, 0.6216917, 1.257773, 1, 0, 0.7372549, 1,
1.151285, 0.4614907, 1.721082, 1, 0, 0.7333333, 1,
1.153035, 1.018483, 1.80277, 1, 0, 0.7254902, 1,
1.15818, -1.363409, 2.61483, 1, 0, 0.7215686, 1,
1.161563, 0.743658, 0.2921396, 1, 0, 0.7137255, 1,
1.172063, 1.034547, 0.532811, 1, 0, 0.7098039, 1,
1.180499, 0.334411, 0.4107948, 1, 0, 0.7019608, 1,
1.185792, -0.3892365, 0.9757136, 1, 0, 0.6941177, 1,
1.188874, -1.531975, 2.67801, 1, 0, 0.6901961, 1,
1.196202, 0.4758494, -0.1804045, 1, 0, 0.682353, 1,
1.197302, 0.0109713, 2.900171, 1, 0, 0.6784314, 1,
1.199911, -1.338268, 2.754931, 1, 0, 0.6705883, 1,
1.2053, -0.2407179, 0.06201147, 1, 0, 0.6666667, 1,
1.207191, 2.136018, -0.1305112, 1, 0, 0.6588235, 1,
1.20853, 0.8323439, -0.1107024, 1, 0, 0.654902, 1,
1.215246, 0.4244311, 1.523088, 1, 0, 0.6470588, 1,
1.215939, 0.7879902, 1.878742, 1, 0, 0.6431373, 1,
1.21637, -0.8382497, 1.948547, 1, 0, 0.6352941, 1,
1.221026, -0.6338046, 2.742018, 1, 0, 0.6313726, 1,
1.223081, 0.7922038, 0.8014389, 1, 0, 0.6235294, 1,
1.225683, 0.004249552, 2.984297, 1, 0, 0.6196079, 1,
1.236044, -1.667175, 1.016623, 1, 0, 0.6117647, 1,
1.255021, -1.260779, 2.243381, 1, 0, 0.6078432, 1,
1.258602, 0.3358079, 1.110479, 1, 0, 0.6, 1,
1.266478, -0.5993237, 3.577891, 1, 0, 0.5921569, 1,
1.274142, -1.130794, 0.9116649, 1, 0, 0.5882353, 1,
1.276177, -1.457179, 2.542436, 1, 0, 0.5803922, 1,
1.277613, 1.180323, 0.1493947, 1, 0, 0.5764706, 1,
1.289635, 0.4736523, 0.6822183, 1, 0, 0.5686275, 1,
1.290211, -0.9351145, 1.793802, 1, 0, 0.5647059, 1,
1.301758, 1.447398, 0.03499657, 1, 0, 0.5568628, 1,
1.305036, 0.1198071, 0.8494533, 1, 0, 0.5529412, 1,
1.312979, -0.7897521, 3.292148, 1, 0, 0.5450981, 1,
1.327541, 0.05841028, 0.6698594, 1, 0, 0.5411765, 1,
1.341297, 0.5837668, 1.678403, 1, 0, 0.5333334, 1,
1.354517, -3.026437, 1.227865, 1, 0, 0.5294118, 1,
1.368673, 1.371068, 1.724101, 1, 0, 0.5215687, 1,
1.371428, -0.3071309, 2.577049, 1, 0, 0.5176471, 1,
1.379566, 0.642603, 1.782948, 1, 0, 0.509804, 1,
1.380155, -0.3095548, 1.740106, 1, 0, 0.5058824, 1,
1.381007, -0.874201, 1.767994, 1, 0, 0.4980392, 1,
1.391599, 0.1487143, 0.6120067, 1, 0, 0.4901961, 1,
1.397274, 0.608275, -0.3059996, 1, 0, 0.4862745, 1,
1.407566, -0.6037011, 1.720093, 1, 0, 0.4784314, 1,
1.408628, -0.9695678, 2.260399, 1, 0, 0.4745098, 1,
1.408755, 1.42742, 2.049424, 1, 0, 0.4666667, 1,
1.412117, 0.5894677, 1.886419, 1, 0, 0.4627451, 1,
1.418846, -0.2127941, 3.017769, 1, 0, 0.454902, 1,
1.420243, 1.359738, 1.802779, 1, 0, 0.4509804, 1,
1.424566, 0.4816444, -0.9733037, 1, 0, 0.4431373, 1,
1.426986, -0.3197616, 1.635269, 1, 0, 0.4392157, 1,
1.43108, 0.3378082, 0.9845335, 1, 0, 0.4313726, 1,
1.451963, -2.963812, 4.251182, 1, 0, 0.427451, 1,
1.456227, -0.1534986, 2.050993, 1, 0, 0.4196078, 1,
1.469153, 0.2371081, 0.7424872, 1, 0, 0.4156863, 1,
1.484255, 1.104232, 1.261025, 1, 0, 0.4078431, 1,
1.515429, -0.6214406, 0.7119246, 1, 0, 0.4039216, 1,
1.531746, 0.5416003, 3.387144, 1, 0, 0.3960784, 1,
1.532628, 1.67584, 1.665089, 1, 0, 0.3882353, 1,
1.534871, 1.146643, -1.402517, 1, 0, 0.3843137, 1,
1.541483, -0.6340603, 0.417424, 1, 0, 0.3764706, 1,
1.553386, 1.115696, 2.437572, 1, 0, 0.372549, 1,
1.554098, 0.5907776, 2.948352, 1, 0, 0.3647059, 1,
1.55538, -0.3077589, 0.6191841, 1, 0, 0.3607843, 1,
1.55837, 0.3946746, 1.48452, 1, 0, 0.3529412, 1,
1.573198, -0.5331718, 1.74931, 1, 0, 0.3490196, 1,
1.576133, 0.5622096, 3.463199, 1, 0, 0.3411765, 1,
1.577459, 0.405869, 3.374423, 1, 0, 0.3372549, 1,
1.589228, -1.171669, 1.55763, 1, 0, 0.3294118, 1,
1.594572, -0.243323, -0.4481574, 1, 0, 0.3254902, 1,
1.597837, -0.4218782, 2.310307, 1, 0, 0.3176471, 1,
1.603239, 0.8855242, -0.5908878, 1, 0, 0.3137255, 1,
1.616075, 0.4461299, 1.759679, 1, 0, 0.3058824, 1,
1.638109, 0.7685618, -0.9964663, 1, 0, 0.2980392, 1,
1.646899, -0.7877086, 3.206138, 1, 0, 0.2941177, 1,
1.649367, -2.200565, 2.65046, 1, 0, 0.2862745, 1,
1.653182, 0.6006205, 2.536592, 1, 0, 0.282353, 1,
1.657644, -0.6324319, 2.276176, 1, 0, 0.2745098, 1,
1.658479, 0.4571207, -0.2149518, 1, 0, 0.2705882, 1,
1.673057, 0.08842222, -0.8053259, 1, 0, 0.2627451, 1,
1.703546, -0.9420905, 3.63977, 1, 0, 0.2588235, 1,
1.733055, -0.1600515, 3.404142, 1, 0, 0.2509804, 1,
1.741193, 0.410133, 0.1301544, 1, 0, 0.2470588, 1,
1.741637, -0.3719591, 1.19589, 1, 0, 0.2392157, 1,
1.750039, -0.8019642, 1.553814, 1, 0, 0.2352941, 1,
1.765023, 1.048832, 0.5155425, 1, 0, 0.227451, 1,
1.780125, -0.4564576, 2.938117, 1, 0, 0.2235294, 1,
1.793515, 1.544641, 0.01640097, 1, 0, 0.2156863, 1,
1.794241, -0.9275098, 1.888071, 1, 0, 0.2117647, 1,
1.800741, 0.1678072, -0.272353, 1, 0, 0.2039216, 1,
1.819656, 1.079684, 2.137479, 1, 0, 0.1960784, 1,
1.829152, -0.9386378, 2.17821, 1, 0, 0.1921569, 1,
1.865385, 1.550245, -0.4118955, 1, 0, 0.1843137, 1,
1.877702, -1.914445, 3.433451, 1, 0, 0.1803922, 1,
1.892228, 0.7586797, 0.8375661, 1, 0, 0.172549, 1,
1.899799, 0.2002064, 1.815279, 1, 0, 0.1686275, 1,
1.919763, 0.04713102, 2.272533, 1, 0, 0.1607843, 1,
2.022492, -0.7961081, 0.955682, 1, 0, 0.1568628, 1,
2.043974, -0.1675712, -0.03423842, 1, 0, 0.1490196, 1,
2.046627, 0.2847525, 2.235359, 1, 0, 0.145098, 1,
2.055284, -2.027027, 1.580329, 1, 0, 0.1372549, 1,
2.062717, -0.3441102, 4.481856, 1, 0, 0.1333333, 1,
2.07297, 0.483675, 0.9378867, 1, 0, 0.1254902, 1,
2.097185, -1.908992, 1.790035, 1, 0, 0.1215686, 1,
2.162027, -1.533395, 0.9142794, 1, 0, 0.1137255, 1,
2.189541, 1.354903, 1.544982, 1, 0, 0.1098039, 1,
2.198919, -1.10377, -0.1521621, 1, 0, 0.1019608, 1,
2.202832, -0.03635318, 1.281804, 1, 0, 0.09411765, 1,
2.257224, -1.384724, 1.586555, 1, 0, 0.09019608, 1,
2.299447, -1.678027, 1.94379, 1, 0, 0.08235294, 1,
2.345166, 0.2204201, 2.436943, 1, 0, 0.07843138, 1,
2.362373, 1.100247, 1.368164, 1, 0, 0.07058824, 1,
2.378182, -0.5346862, 0.3732185, 1, 0, 0.06666667, 1,
2.465799, -1.363798, 2.822927, 1, 0, 0.05882353, 1,
2.481237, 0.7772155, -0.1288265, 1, 0, 0.05490196, 1,
2.503292, -2.333981, 3.491717, 1, 0, 0.04705882, 1,
2.524481, 0.3003233, 1.330141, 1, 0, 0.04313726, 1,
2.5327, -1.654479, 2.568644, 1, 0, 0.03529412, 1,
2.791816, -1.285895, 1.110043, 1, 0, 0.03137255, 1,
2.872525, 0.8263539, 0.4880035, 1, 0, 0.02352941, 1,
2.995834, 2.875573, 0.7671489, 1, 0, 0.01960784, 1,
3.446039, 0.9164451, 1.345541, 1, 0, 0.01176471, 1,
3.816225, 0.1702824, 0.9017373, 1, 0, 0.007843138, 1
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
0.4054669, -4.048181, -7.611074, 0, -0.5, 0.5, 0.5,
0.4054669, -4.048181, -7.611074, 1, -0.5, 0.5, 0.5,
0.4054669, -4.048181, -7.611074, 1, 1.5, 0.5, 0.5,
0.4054669, -4.048181, -7.611074, 0, 1.5, 0.5, 0.5
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
-4.161538, -0.01244557, -7.611074, 0, -0.5, 0.5, 0.5,
-4.161538, -0.01244557, -7.611074, 1, -0.5, 0.5, 0.5,
-4.161538, -0.01244557, -7.611074, 1, 1.5, 0.5, 0.5,
-4.161538, -0.01244557, -7.611074, 0, 1.5, 0.5, 0.5
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
-4.161538, -4.048181, -0.4456522, 0, -0.5, 0.5, 0.5,
-4.161538, -4.048181, -0.4456522, 1, -0.5, 0.5, 0.5,
-4.161538, -4.048181, -0.4456522, 1, 1.5, 0.5, 0.5,
-4.161538, -4.048181, -0.4456522, 0, 1.5, 0.5, 0.5
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
-3, -3.116857, -5.957515,
3, -3.116857, -5.957515,
-3, -3.116857, -5.957515,
-3, -3.272078, -6.233109,
-2, -3.116857, -5.957515,
-2, -3.272078, -6.233109,
-1, -3.116857, -5.957515,
-1, -3.272078, -6.233109,
0, -3.116857, -5.957515,
0, -3.272078, -6.233109,
1, -3.116857, -5.957515,
1, -3.272078, -6.233109,
2, -3.116857, -5.957515,
2, -3.272078, -6.233109,
3, -3.116857, -5.957515,
3, -3.272078, -6.233109
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
-3, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
-3, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
-3, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
-3, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
-2, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
-2, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
-2, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
-2, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
-1, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
-1, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
-1, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
-1, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
0, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
0, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
0, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
0, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
1, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
1, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
1, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
1, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
2, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
2, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
2, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
2, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5,
3, -3.582519, -6.784295, 0, -0.5, 0.5, 0.5,
3, -3.582519, -6.784295, 1, -0.5, 0.5, 0.5,
3, -3.582519, -6.784295, 1, 1.5, 0.5, 0.5,
3, -3.582519, -6.784295, 0, 1.5, 0.5, 0.5
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
-3.107614, -3, -5.957515,
-3.107614, 3, -5.957515,
-3.107614, -3, -5.957515,
-3.283268, -3, -6.233109,
-3.107614, -2, -5.957515,
-3.283268, -2, -6.233109,
-3.107614, -1, -5.957515,
-3.283268, -1, -6.233109,
-3.107614, 0, -5.957515,
-3.283268, 0, -6.233109,
-3.107614, 1, -5.957515,
-3.283268, 1, -6.233109,
-3.107614, 2, -5.957515,
-3.283268, 2, -6.233109,
-3.107614, 3, -5.957515,
-3.283268, 3, -6.233109
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
-3.634576, -3, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, -3, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, -3, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, -3, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, -2, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, -2, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, -2, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, -2, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, -1, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, -1, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, -1, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, -1, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, 0, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, 0, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, 0, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, 0, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, 1, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, 1, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, 1, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, 1, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, 2, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, 2, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, 2, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, 2, -6.784295, 0, 1.5, 0.5, 0.5,
-3.634576, 3, -6.784295, 0, -0.5, 0.5, 0.5,
-3.634576, 3, -6.784295, 1, -0.5, 0.5, 0.5,
-3.634576, 3, -6.784295, 1, 1.5, 0.5, 0.5,
-3.634576, 3, -6.784295, 0, 1.5, 0.5, 0.5
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
-3.107614, -3.116857, -4,
-3.107614, -3.116857, 4,
-3.107614, -3.116857, -4,
-3.283268, -3.272078, -4,
-3.107614, -3.116857, -2,
-3.283268, -3.272078, -2,
-3.107614, -3.116857, 0,
-3.283268, -3.272078, 0,
-3.107614, -3.116857, 2,
-3.283268, -3.272078, 2,
-3.107614, -3.116857, 4,
-3.283268, -3.272078, 4
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
-3.634576, -3.582519, -4, 0, -0.5, 0.5, 0.5,
-3.634576, -3.582519, -4, 1, -0.5, 0.5, 0.5,
-3.634576, -3.582519, -4, 1, 1.5, 0.5, 0.5,
-3.634576, -3.582519, -4, 0, 1.5, 0.5, 0.5,
-3.634576, -3.582519, -2, 0, -0.5, 0.5, 0.5,
-3.634576, -3.582519, -2, 1, -0.5, 0.5, 0.5,
-3.634576, -3.582519, -2, 1, 1.5, 0.5, 0.5,
-3.634576, -3.582519, -2, 0, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 0, 0, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 0, 1, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 0, 1, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 0, 0, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 2, 0, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 2, 1, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 2, 1, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 2, 0, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 4, 0, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 4, 1, -0.5, 0.5, 0.5,
-3.634576, -3.582519, 4, 1, 1.5, 0.5, 0.5,
-3.634576, -3.582519, 4, 0, 1.5, 0.5, 0.5
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
-3.107614, -3.116857, -5.957515,
-3.107614, 3.091966, -5.957515,
-3.107614, -3.116857, 5.066211,
-3.107614, 3.091966, 5.066211,
-3.107614, -3.116857, -5.957515,
-3.107614, -3.116857, 5.066211,
-3.107614, 3.091966, -5.957515,
-3.107614, 3.091966, 5.066211,
-3.107614, -3.116857, -5.957515,
3.918548, -3.116857, -5.957515,
-3.107614, -3.116857, 5.066211,
3.918548, -3.116857, 5.066211,
-3.107614, 3.091966, -5.957515,
3.918548, 3.091966, -5.957515,
-3.107614, 3.091966, 5.066211,
3.918548, 3.091966, 5.066211,
3.918548, -3.116857, -5.957515,
3.918548, 3.091966, -5.957515,
3.918548, -3.116857, 5.066211,
3.918548, 3.091966, 5.066211,
3.918548, -3.116857, -5.957515,
3.918548, -3.116857, 5.066211,
3.918548, 3.091966, -5.957515,
3.918548, 3.091966, 5.066211
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
var radius = 7.72777;
var distance = 34.38172;
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
mvMatrix.translate( -0.4054669, 0.01244557, 0.4456522 );
mvMatrix.scale( 1.189186, 1.345733, 0.7579485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38172);
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


