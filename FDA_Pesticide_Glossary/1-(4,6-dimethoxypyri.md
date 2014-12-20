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
-3.24968, -0.007475854, -1.081088, 1, 0, 0, 1,
-2.579629, 0.213385, -1.039309, 1, 0.007843138, 0, 1,
-2.508609, 1.716647, -1.677982, 1, 0.01176471, 0, 1,
-2.441262, 1.486656, -1.23999, 1, 0.01960784, 0, 1,
-2.426798, -0.2797633, -1.268658, 1, 0.02352941, 0, 1,
-2.422163, -0.667007, -2.780269, 1, 0.03137255, 0, 1,
-2.373953, -0.6237049, -2.204446, 1, 0.03529412, 0, 1,
-2.371817, 0.5555062, 0.007147297, 1, 0.04313726, 0, 1,
-2.368646, 0.3293782, -2.786859, 1, 0.04705882, 0, 1,
-2.325809, -1.096444, -1.844161, 1, 0.05490196, 0, 1,
-2.239712, -0.2663344, -1.033058, 1, 0.05882353, 0, 1,
-2.219453, -1.09804, -1.572674, 1, 0.06666667, 0, 1,
-2.194282, 0.9870661, 0.01215017, 1, 0.07058824, 0, 1,
-2.145562, -0.1805211, 0.2721211, 1, 0.07843138, 0, 1,
-2.113198, -1.562429, -0.03842713, 1, 0.08235294, 0, 1,
-2.113188, 0.7234419, -1.937389, 1, 0.09019608, 0, 1,
-2.087178, 0.5522724, 0.3915913, 1, 0.09411765, 0, 1,
-2.069051, 0.443567, -1.65228, 1, 0.1019608, 0, 1,
-2.06903, -0.2512901, -3.100433, 1, 0.1098039, 0, 1,
-2.013133, 1.553287, -1.583284, 1, 0.1137255, 0, 1,
-1.970084, -0.137436, -2.438766, 1, 0.1215686, 0, 1,
-1.947424, -2.637579, -2.878079, 1, 0.1254902, 0, 1,
-1.940375, -1.800812, -1.631825, 1, 0.1333333, 0, 1,
-1.921752, -1.213562, -2.159152, 1, 0.1372549, 0, 1,
-1.921252, -0.391882, -2.237127, 1, 0.145098, 0, 1,
-1.91801, -0.09352243, -2.002051, 1, 0.1490196, 0, 1,
-1.916423, 0.4891787, -0.9082056, 1, 0.1568628, 0, 1,
-1.889345, 0.3536847, -1.646822, 1, 0.1607843, 0, 1,
-1.888762, 0.1691921, -0.2560789, 1, 0.1686275, 0, 1,
-1.85003, 0.4956962, -1.828132, 1, 0.172549, 0, 1,
-1.845544, 1.270737, -2.926955, 1, 0.1803922, 0, 1,
-1.824911, 0.3163093, -0.4687403, 1, 0.1843137, 0, 1,
-1.802143, 0.02181377, -0.9138523, 1, 0.1921569, 0, 1,
-1.794745, 0.8287593, -0.5014234, 1, 0.1960784, 0, 1,
-1.766192, -0.2426067, -0.5157936, 1, 0.2039216, 0, 1,
-1.746145, -0.9871668, -4.184314, 1, 0.2117647, 0, 1,
-1.7071, 0.2684276, -1.652039, 1, 0.2156863, 0, 1,
-1.704339, -0.8502556, -1.388499, 1, 0.2235294, 0, 1,
-1.702715, -0.2746792, -0.4419203, 1, 0.227451, 0, 1,
-1.700537, -2.265523, -2.472923, 1, 0.2352941, 0, 1,
-1.694288, -0.4849474, -2.156178, 1, 0.2392157, 0, 1,
-1.685466, 0.2771586, -0.876971, 1, 0.2470588, 0, 1,
-1.68494, 0.9034652, -0.0433391, 1, 0.2509804, 0, 1,
-1.671619, -0.7294928, -1.537762, 1, 0.2588235, 0, 1,
-1.671182, -0.4126938, -1.956743, 1, 0.2627451, 0, 1,
-1.670391, 1.212978, -2.947519, 1, 0.2705882, 0, 1,
-1.66205, 1.586203, -1.088248, 1, 0.2745098, 0, 1,
-1.661422, -1.023832, -2.399513, 1, 0.282353, 0, 1,
-1.658234, -1.186482, -2.594623, 1, 0.2862745, 0, 1,
-1.64614, -0.07657963, -1.208957, 1, 0.2941177, 0, 1,
-1.638599, -0.4768688, -0.9547434, 1, 0.3019608, 0, 1,
-1.624881, 2.097823, -1.503264, 1, 0.3058824, 0, 1,
-1.618316, 1.045538, -2.224271, 1, 0.3137255, 0, 1,
-1.611336, -1.315532, -3.099218, 1, 0.3176471, 0, 1,
-1.606498, -0.03114323, -1.251146, 1, 0.3254902, 0, 1,
-1.584639, 0.6693369, -1.030575, 1, 0.3294118, 0, 1,
-1.584105, 1.914583, -0.4960966, 1, 0.3372549, 0, 1,
-1.582191, 0.3041417, -2.127057, 1, 0.3411765, 0, 1,
-1.580768, -0.8393186, -3.295213, 1, 0.3490196, 0, 1,
-1.574466, -0.2171893, -0.6698643, 1, 0.3529412, 0, 1,
-1.555098, 1.027175, 0.0161094, 1, 0.3607843, 0, 1,
-1.552231, -1.011288, -2.933811, 1, 0.3647059, 0, 1,
-1.551847, -0.4185, -1.424322, 1, 0.372549, 0, 1,
-1.550588, -0.152572, -0.8030809, 1, 0.3764706, 0, 1,
-1.549342, -2.312599, -3.763779, 1, 0.3843137, 0, 1,
-1.534889, -1.046331, -2.240858, 1, 0.3882353, 0, 1,
-1.533129, 0.9470521, -0.5148026, 1, 0.3960784, 0, 1,
-1.522238, -0.5962613, -0.9333528, 1, 0.4039216, 0, 1,
-1.513578, -1.072248, -2.569132, 1, 0.4078431, 0, 1,
-1.49998, -0.9263173, -2.921326, 1, 0.4156863, 0, 1,
-1.492118, -0.3654184, -2.964566, 1, 0.4196078, 0, 1,
-1.485634, 0.8472312, -2.039485, 1, 0.427451, 0, 1,
-1.483943, -1.674999, -1.892579, 1, 0.4313726, 0, 1,
-1.479978, -1.422742, -1.723158, 1, 0.4392157, 0, 1,
-1.469385, -1.161678, -1.242724, 1, 0.4431373, 0, 1,
-1.451882, -1.084288, -1.529846, 1, 0.4509804, 0, 1,
-1.447482, -2.112571, -2.313931, 1, 0.454902, 0, 1,
-1.445885, -1.500247, -3.43111, 1, 0.4627451, 0, 1,
-1.444254, -0.02646169, -2.082237, 1, 0.4666667, 0, 1,
-1.436986, -2.179955, -3.427994, 1, 0.4745098, 0, 1,
-1.434035, 0.4943978, -1.096246, 1, 0.4784314, 0, 1,
-1.409212, 0.7530164, -2.88387, 1, 0.4862745, 0, 1,
-1.407681, 0.8851764, -1.027499, 1, 0.4901961, 0, 1,
-1.405239, 0.2368234, -1.932621, 1, 0.4980392, 0, 1,
-1.390372, -1.245096, -2.728747, 1, 0.5058824, 0, 1,
-1.360916, -1.243572, -2.22993, 1, 0.509804, 0, 1,
-1.357148, -0.1217519, -2.384537, 1, 0.5176471, 0, 1,
-1.355308, -1.274876, -1.467677, 1, 0.5215687, 0, 1,
-1.354246, -0.3905072, -1.67534, 1, 0.5294118, 0, 1,
-1.352662, 0.1252705, -0.9927647, 1, 0.5333334, 0, 1,
-1.350889, -0.9120804, -2.914356, 1, 0.5411765, 0, 1,
-1.348965, -1.094504, -2.292334, 1, 0.5450981, 0, 1,
-1.346407, -0.4028734, -1.995618, 1, 0.5529412, 0, 1,
-1.344053, 0.9436948, -0.7772442, 1, 0.5568628, 0, 1,
-1.343491, 0.2988927, -3.422881, 1, 0.5647059, 0, 1,
-1.337585, 0.790881, -2.197501, 1, 0.5686275, 0, 1,
-1.337097, -1.910754, -2.832926, 1, 0.5764706, 0, 1,
-1.334152, 1.068877, -0.4518145, 1, 0.5803922, 0, 1,
-1.334085, -0.6565182, -4.24767, 1, 0.5882353, 0, 1,
-1.332465, 0.2251439, -1.742974, 1, 0.5921569, 0, 1,
-1.330062, 0.01916998, -2.409039, 1, 0.6, 0, 1,
-1.328505, -0.4834572, -2.078812, 1, 0.6078432, 0, 1,
-1.326976, 1.350094, -1.492187, 1, 0.6117647, 0, 1,
-1.32197, -1.816656, -2.466255, 1, 0.6196079, 0, 1,
-1.311407, 1.408004, 1.622897, 1, 0.6235294, 0, 1,
-1.307312, -0.7236411, -2.094862, 1, 0.6313726, 0, 1,
-1.296559, 0.4236909, 0.1797546, 1, 0.6352941, 0, 1,
-1.284188, -0.1318875, -3.829486, 1, 0.6431373, 0, 1,
-1.276567, 0.5000186, -0.5479966, 1, 0.6470588, 0, 1,
-1.268766, 0.1772643, -1.82061, 1, 0.654902, 0, 1,
-1.268062, -0.4817571, -2.087116, 1, 0.6588235, 0, 1,
-1.262228, -2.035855, -3.691944, 1, 0.6666667, 0, 1,
-1.257901, 1.805345, -1.801485, 1, 0.6705883, 0, 1,
-1.253372, 0.6056381, -1.812396, 1, 0.6784314, 0, 1,
-1.252638, 1.795156, 0.1685296, 1, 0.682353, 0, 1,
-1.250716, 0.1570422, -0.6777961, 1, 0.6901961, 0, 1,
-1.249493, -0.303994, -2.361835, 1, 0.6941177, 0, 1,
-1.247117, 0.008278484, -1.250377, 1, 0.7019608, 0, 1,
-1.243937, 1.620219, -2.234917, 1, 0.7098039, 0, 1,
-1.230124, 0.1604294, -1.18157, 1, 0.7137255, 0, 1,
-1.220942, 0.1995825, -0.3072224, 1, 0.7215686, 0, 1,
-1.213463, 0.7053058, 0.7893984, 1, 0.7254902, 0, 1,
-1.212936, 1.60724, 0.8754696, 1, 0.7333333, 0, 1,
-1.211452, 1.562585, -0.6920657, 1, 0.7372549, 0, 1,
-1.207112, -0.02733543, -1.690175, 1, 0.7450981, 0, 1,
-1.198196, -1.430764, -1.721495, 1, 0.7490196, 0, 1,
-1.193085, 0.6732545, -1.585843, 1, 0.7568628, 0, 1,
-1.189458, 0.07732614, -1.668557, 1, 0.7607843, 0, 1,
-1.186754, -1.309606, -3.885144, 1, 0.7686275, 0, 1,
-1.186047, -0.7765459, -1.776584, 1, 0.772549, 0, 1,
-1.182007, 0.8143343, -1.651424, 1, 0.7803922, 0, 1,
-1.172273, 0.6316103, -0.2986102, 1, 0.7843137, 0, 1,
-1.172064, 1.592497, -0.6691713, 1, 0.7921569, 0, 1,
-1.171775, -0.4579635, -1.831191, 1, 0.7960784, 0, 1,
-1.167806, 1.38296, -0.4673698, 1, 0.8039216, 0, 1,
-1.16158, -0.4388776, -1.536604, 1, 0.8117647, 0, 1,
-1.151857, -1.697411, -5.593473, 1, 0.8156863, 0, 1,
-1.141961, -1.336791, -2.478965, 1, 0.8235294, 0, 1,
-1.136287, 0.7017584, -0.4762739, 1, 0.827451, 0, 1,
-1.126395, 0.650892, -2.866009, 1, 0.8352941, 0, 1,
-1.123406, -2.002733, -3.773093, 1, 0.8392157, 0, 1,
-1.114289, 1.716021, 0.5855669, 1, 0.8470588, 0, 1,
-1.101471, -0.1934402, -1.384115, 1, 0.8509804, 0, 1,
-1.100804, 0.2931122, -0.1034722, 1, 0.8588235, 0, 1,
-1.097383, 1.557143, -1.043723, 1, 0.8627451, 0, 1,
-1.096188, 0.8807985, -1.366111, 1, 0.8705882, 0, 1,
-1.090125, -0.3879286, -2.353278, 1, 0.8745098, 0, 1,
-1.089276, -1.132674, -2.128346, 1, 0.8823529, 0, 1,
-1.082869, 1.2206, 0.3865839, 1, 0.8862745, 0, 1,
-1.081046, -1.068529, -1.686536, 1, 0.8941177, 0, 1,
-1.077637, 0.08265894, -1.780617, 1, 0.8980392, 0, 1,
-1.072774, -0.9381627, -2.840614, 1, 0.9058824, 0, 1,
-1.071382, -1.903575, -2.826157, 1, 0.9137255, 0, 1,
-1.06856, 0.8572897, -0.02686448, 1, 0.9176471, 0, 1,
-1.06522, 0.2408867, -0.7912835, 1, 0.9254902, 0, 1,
-1.063524, 1.3812, -0.1578914, 1, 0.9294118, 0, 1,
-1.056886, -0.5073019, -2.307976, 1, 0.9372549, 0, 1,
-1.054378, -1.734162, -3.410294, 1, 0.9411765, 0, 1,
-1.053896, -0.9159306, -3.373078, 1, 0.9490196, 0, 1,
-1.053821, -0.3972477, -2.781259, 1, 0.9529412, 0, 1,
-1.050685, -0.3867468, -1.289833, 1, 0.9607843, 0, 1,
-1.033736, -0.301187, -3.917628, 1, 0.9647059, 0, 1,
-1.023011, -1.037573, -3.02461, 1, 0.972549, 0, 1,
-1.020585, 0.4091474, -2.818261, 1, 0.9764706, 0, 1,
-1.018115, -0.03511371, -2.951039, 1, 0.9843137, 0, 1,
-1.011855, -1.641807, -3.739346, 1, 0.9882353, 0, 1,
-1.008575, 1.482704, -0.1891631, 1, 0.9960784, 0, 1,
-1.001851, -1.097111, -1.329244, 0.9960784, 1, 0, 1,
-0.9986386, -1.470066, -4.222365, 0.9921569, 1, 0, 1,
-0.997651, -0.2035122, -1.206371, 0.9843137, 1, 0, 1,
-0.9970658, 0.6583851, -0.7321656, 0.9803922, 1, 0, 1,
-0.9882877, 1.109676, -1.27952, 0.972549, 1, 0, 1,
-0.9832892, 1.321234, -0.7978321, 0.9686275, 1, 0, 1,
-0.968789, 0.490489, -1.549562, 0.9607843, 1, 0, 1,
-0.966997, 0.1592509, -2.238663, 0.9568627, 1, 0, 1,
-0.9595315, -0.2328865, -2.387104, 0.9490196, 1, 0, 1,
-0.9478853, 1.06428, -1.672227, 0.945098, 1, 0, 1,
-0.9454687, -0.3364239, -2.250415, 0.9372549, 1, 0, 1,
-0.9436415, -1.252146, -2.511874, 0.9333333, 1, 0, 1,
-0.937693, 0.7241853, -2.519752, 0.9254902, 1, 0, 1,
-0.9364869, -0.8822256, -2.300827, 0.9215686, 1, 0, 1,
-0.9321135, 0.3080346, -2.385024, 0.9137255, 1, 0, 1,
-0.929163, 0.4180687, -1.516335, 0.9098039, 1, 0, 1,
-0.928207, 0.3921214, -0.2751541, 0.9019608, 1, 0, 1,
-0.9260885, 0.9588155, -0.8379675, 0.8941177, 1, 0, 1,
-0.9227955, -0.04626347, -2.609442, 0.8901961, 1, 0, 1,
-0.921969, 0.5230363, -0.9050089, 0.8823529, 1, 0, 1,
-0.9213708, 0.004254384, -2.232218, 0.8784314, 1, 0, 1,
-0.914887, 0.04661058, -2.184019, 0.8705882, 1, 0, 1,
-0.9125866, -0.3253723, -3.190113, 0.8666667, 1, 0, 1,
-0.9109002, 0.8380882, -2.233623, 0.8588235, 1, 0, 1,
-0.9083707, -1.105687, -3.305167, 0.854902, 1, 0, 1,
-0.9077812, -0.9621866, -2.005112, 0.8470588, 1, 0, 1,
-0.9069422, 2.531999, -2.841816, 0.8431373, 1, 0, 1,
-0.9047056, 1.988331, -0.2644979, 0.8352941, 1, 0, 1,
-0.9033859, -1.121369, -4.583287, 0.8313726, 1, 0, 1,
-0.9005539, -0.05812474, -1.020126, 0.8235294, 1, 0, 1,
-0.8978602, -0.1097284, 0.01169838, 0.8196079, 1, 0, 1,
-0.8898532, -0.111592, -1.23877, 0.8117647, 1, 0, 1,
-0.8839721, -0.05920826, -0.596641, 0.8078431, 1, 0, 1,
-0.8831965, -0.7627749, -1.916306, 0.8, 1, 0, 1,
-0.8779036, -0.4140248, -2.799856, 0.7921569, 1, 0, 1,
-0.8662987, 0.2409808, -1.612385, 0.7882353, 1, 0, 1,
-0.860439, 0.02075936, -2.632309, 0.7803922, 1, 0, 1,
-0.8602123, 0.1895159, -1.366207, 0.7764706, 1, 0, 1,
-0.8523368, 1.093311, -1.359333, 0.7686275, 1, 0, 1,
-0.8497672, -0.5009193, -1.234092, 0.7647059, 1, 0, 1,
-0.8477177, 1.799064, -1.559868, 0.7568628, 1, 0, 1,
-0.8461745, -0.4672778, -1.901318, 0.7529412, 1, 0, 1,
-0.8423219, -0.4709765, -2.082766, 0.7450981, 1, 0, 1,
-0.8372605, 1.282479, -1.33197, 0.7411765, 1, 0, 1,
-0.8292179, -1.162569, -2.636142, 0.7333333, 1, 0, 1,
-0.8201354, -1.136367, -3.903145, 0.7294118, 1, 0, 1,
-0.8168449, -0.08284612, -1.349051, 0.7215686, 1, 0, 1,
-0.8122944, -1.101093, -2.860104, 0.7176471, 1, 0, 1,
-0.8116352, 1.587377, 0.2808687, 0.7098039, 1, 0, 1,
-0.8108298, 0.1987268, -1.394098, 0.7058824, 1, 0, 1,
-0.8106833, 0.6554509, -2.166581, 0.6980392, 1, 0, 1,
-0.8086761, -1.843535, -4.198121, 0.6901961, 1, 0, 1,
-0.805931, -2.646562, -3.667228, 0.6862745, 1, 0, 1,
-0.8021505, -0.2993149, -2.114528, 0.6784314, 1, 0, 1,
-0.7962675, -0.9193503, -1.26105, 0.6745098, 1, 0, 1,
-0.7951201, -0.9720438, -2.982493, 0.6666667, 1, 0, 1,
-0.7944095, -0.5463048, -1.954125, 0.6627451, 1, 0, 1,
-0.7926944, -0.4014423, -2.22, 0.654902, 1, 0, 1,
-0.7924031, -0.3337941, -1.726041, 0.6509804, 1, 0, 1,
-0.7901246, -0.3160607, -1.044087, 0.6431373, 1, 0, 1,
-0.7863847, -1.785661, -2.951937, 0.6392157, 1, 0, 1,
-0.7792966, -1.971596, -5.199465, 0.6313726, 1, 0, 1,
-0.7753266, 0.718043, 0.05335255, 0.627451, 1, 0, 1,
-0.7724645, -1.788422, -3.79914, 0.6196079, 1, 0, 1,
-0.7687882, 0.9975786, -0.9912527, 0.6156863, 1, 0, 1,
-0.7643982, 1.425172, 1.704671, 0.6078432, 1, 0, 1,
-0.763961, -0.5618591, -3.161856, 0.6039216, 1, 0, 1,
-0.7603649, 1.202647, 0.08624264, 0.5960785, 1, 0, 1,
-0.7511985, 0.09298261, -0.7705606, 0.5882353, 1, 0, 1,
-0.749275, -0.07331267, -2.619979, 0.5843138, 1, 0, 1,
-0.7472365, -0.1051377, -1.993022, 0.5764706, 1, 0, 1,
-0.7393234, 0.6201021, -1.582165, 0.572549, 1, 0, 1,
-0.7376538, 0.682493, -0.174146, 0.5647059, 1, 0, 1,
-0.7289773, 0.2540929, -0.5072881, 0.5607843, 1, 0, 1,
-0.7262613, -3.041553, -4.605114, 0.5529412, 1, 0, 1,
-0.7253603, -0.2840379, -2.832235, 0.5490196, 1, 0, 1,
-0.7240122, 0.9863401, -0.6282994, 0.5411765, 1, 0, 1,
-0.7221965, 0.1993641, -2.73534, 0.5372549, 1, 0, 1,
-0.7179008, -0.09614877, -0.6568496, 0.5294118, 1, 0, 1,
-0.7172356, -0.5057549, -2.312289, 0.5254902, 1, 0, 1,
-0.7172164, -0.002017065, 0.2677242, 0.5176471, 1, 0, 1,
-0.7166274, 2.698724, -0.07236892, 0.5137255, 1, 0, 1,
-0.7015443, 2.12671, 1.606961, 0.5058824, 1, 0, 1,
-0.7007931, -1.579663, -1.839703, 0.5019608, 1, 0, 1,
-0.6949827, -0.270613, -3.168982, 0.4941176, 1, 0, 1,
-0.6933358, -0.1985851, -3.396501, 0.4862745, 1, 0, 1,
-0.6870244, -0.04741612, 0.8029074, 0.4823529, 1, 0, 1,
-0.6860918, -2.144355, -3.004904, 0.4745098, 1, 0, 1,
-0.6846507, -1.571813, -4.986355, 0.4705882, 1, 0, 1,
-0.683174, 0.2487782, 0.03849004, 0.4627451, 1, 0, 1,
-0.6818429, -0.64536, -1.811388, 0.4588235, 1, 0, 1,
-0.6707854, 0.3572803, -2.568683, 0.4509804, 1, 0, 1,
-0.6689418, -0.02945624, -2.720191, 0.4470588, 1, 0, 1,
-0.6638803, 0.7347054, 0.3387734, 0.4392157, 1, 0, 1,
-0.6585179, 2.116211, 0.4528183, 0.4352941, 1, 0, 1,
-0.6542059, -1.200179, -2.526376, 0.427451, 1, 0, 1,
-0.646152, 0.01133259, -0.4315595, 0.4235294, 1, 0, 1,
-0.6453561, -0.1806287, -2.10972, 0.4156863, 1, 0, 1,
-0.6448693, -0.2447404, -0.1870208, 0.4117647, 1, 0, 1,
-0.6422776, 0.1645341, -0.8129785, 0.4039216, 1, 0, 1,
-0.6398526, 0.08090629, -1.237463, 0.3960784, 1, 0, 1,
-0.634832, 0.1386294, -2.97705, 0.3921569, 1, 0, 1,
-0.634632, -0.2644033, -1.402771, 0.3843137, 1, 0, 1,
-0.63419, -0.2625137, -3.808483, 0.3803922, 1, 0, 1,
-0.6324606, -1.168796, -1.663599, 0.372549, 1, 0, 1,
-0.6322702, -1.386593, -1.941072, 0.3686275, 1, 0, 1,
-0.6319302, -0.05000254, -2.528482, 0.3607843, 1, 0, 1,
-0.6290736, 0.01435222, -1.115542, 0.3568628, 1, 0, 1,
-0.6279575, 1.939643, -1.400266, 0.3490196, 1, 0, 1,
-0.6199262, -0.07906344, -2.817453, 0.345098, 1, 0, 1,
-0.6077784, 0.4596146, -1.066612, 0.3372549, 1, 0, 1,
-0.6075383, -0.6078182, -0.01918325, 0.3333333, 1, 0, 1,
-0.6069314, -0.504881, -2.23178, 0.3254902, 1, 0, 1,
-0.6062486, -0.5619166, -0.7135723, 0.3215686, 1, 0, 1,
-0.600859, 2.68176, 0.6867872, 0.3137255, 1, 0, 1,
-0.6007903, -0.5565203, -1.422509, 0.3098039, 1, 0, 1,
-0.600774, 0.2519896, 0.2135519, 0.3019608, 1, 0, 1,
-0.594086, 0.4691359, -0.3686866, 0.2941177, 1, 0, 1,
-0.5938381, -0.3145931, -1.514835, 0.2901961, 1, 0, 1,
-0.5933224, -0.7059066, -4.151832, 0.282353, 1, 0, 1,
-0.586422, -0.7575379, -1.098802, 0.2784314, 1, 0, 1,
-0.5844187, -0.2756792, -0.4877066, 0.2705882, 1, 0, 1,
-0.576782, 0.7302995, -1.625648, 0.2666667, 1, 0, 1,
-0.5767487, 0.7343105, 0.6106405, 0.2588235, 1, 0, 1,
-0.5722009, -0.2250594, -2.4382, 0.254902, 1, 0, 1,
-0.5702482, -0.564181, -0.448296, 0.2470588, 1, 0, 1,
-0.5688374, 1.713229, -0.4390328, 0.2431373, 1, 0, 1,
-0.5653816, -0.7266251, -2.638439, 0.2352941, 1, 0, 1,
-0.5632838, 1.497124, -0.5672973, 0.2313726, 1, 0, 1,
-0.5602834, -1.148519, -3.32374, 0.2235294, 1, 0, 1,
-0.5574652, -0.4719681, -2.545647, 0.2196078, 1, 0, 1,
-0.5556431, 0.04953849, -0.5249112, 0.2117647, 1, 0, 1,
-0.5522847, 0.7438108, 0.9633559, 0.2078431, 1, 0, 1,
-0.5492517, 2.415704, 0.85224, 0.2, 1, 0, 1,
-0.5454196, 0.7716358, -0.5609083, 0.1921569, 1, 0, 1,
-0.5442364, -0.7000359, -0.5095096, 0.1882353, 1, 0, 1,
-0.5437616, -0.5154474, -3.196777, 0.1803922, 1, 0, 1,
-0.5379652, -0.4452487, -1.736862, 0.1764706, 1, 0, 1,
-0.5363907, -1.330397, -2.029386, 0.1686275, 1, 0, 1,
-0.5343919, -0.2825591, -1.09183, 0.1647059, 1, 0, 1,
-0.5315663, 0.7874172, -1.701046, 0.1568628, 1, 0, 1,
-0.525039, 1.048189, -1.14232, 0.1529412, 1, 0, 1,
-0.5155798, 0.1491579, -1.366865, 0.145098, 1, 0, 1,
-0.5116288, 0.294806, 0.5945213, 0.1411765, 1, 0, 1,
-0.510654, -1.585894, -2.898476, 0.1333333, 1, 0, 1,
-0.5036724, 0.1776656, -2.365591, 0.1294118, 1, 0, 1,
-0.5010566, -1.519458, -3.734667, 0.1215686, 1, 0, 1,
-0.4974458, 1.107501, 0.09379372, 0.1176471, 1, 0, 1,
-0.4973713, -0.475991, -1.390466, 0.1098039, 1, 0, 1,
-0.4971156, -0.6997648, -2.820384, 0.1058824, 1, 0, 1,
-0.4958229, 0.2544892, -1.938832, 0.09803922, 1, 0, 1,
-0.4952158, -0.7102676, -2.463803, 0.09019608, 1, 0, 1,
-0.4926438, -0.5537393, -1.06945, 0.08627451, 1, 0, 1,
-0.4901236, 2.866338, -0.4933015, 0.07843138, 1, 0, 1,
-0.489648, -0.6156837, -3.115264, 0.07450981, 1, 0, 1,
-0.484612, -0.1884085, -3.543817, 0.06666667, 1, 0, 1,
-0.480814, 0.8291261, -0.6157327, 0.0627451, 1, 0, 1,
-0.4687969, -1.315447, -3.343817, 0.05490196, 1, 0, 1,
-0.4642067, -0.4117999, -3.409918, 0.05098039, 1, 0, 1,
-0.4639313, -0.5069507, -4.048734, 0.04313726, 1, 0, 1,
-0.4634555, -0.4973418, -4.746249, 0.03921569, 1, 0, 1,
-0.4599873, 0.2073371, -2.190033, 0.03137255, 1, 0, 1,
-0.4578056, 1.479781, -0.1986734, 0.02745098, 1, 0, 1,
-0.451934, -0.7480044, -2.289897, 0.01960784, 1, 0, 1,
-0.451108, 0.8325964, -0.5298737, 0.01568628, 1, 0, 1,
-0.4497165, -1.094741, -2.00851, 0.007843138, 1, 0, 1,
-0.4462724, 1.040431, 1.542557, 0.003921569, 1, 0, 1,
-0.4425589, 0.1730869, -0.04562204, 0, 1, 0.003921569, 1,
-0.4391428, 0.2260781, -0.4594688, 0, 1, 0.01176471, 1,
-0.4354596, -0.04505428, -1.164531, 0, 1, 0.01568628, 1,
-0.4296536, 0.2792259, -0.5857846, 0, 1, 0.02352941, 1,
-0.4287712, -1.0394, -1.143014, 0, 1, 0.02745098, 1,
-0.4269462, 0.4289891, -0.7332397, 0, 1, 0.03529412, 1,
-0.4254019, -0.5451326, -2.854261, 0, 1, 0.03921569, 1,
-0.4201995, 0.8315691, -1.367309, 0, 1, 0.04705882, 1,
-0.4186193, 0.3950478, 0.1995825, 0, 1, 0.05098039, 1,
-0.4172457, -0.6172396, -3.65412, 0, 1, 0.05882353, 1,
-0.4122755, 0.1220813, -3.560206, 0, 1, 0.0627451, 1,
-0.4110286, -1.441933, -0.749961, 0, 1, 0.07058824, 1,
-0.4080994, 0.2209133, -1.129013, 0, 1, 0.07450981, 1,
-0.4069905, -0.9562477, -1.625942, 0, 1, 0.08235294, 1,
-0.3981923, 0.9090993, -0.2724636, 0, 1, 0.08627451, 1,
-0.3970468, 1.370788, -1.800266, 0, 1, 0.09411765, 1,
-0.3934028, -0.3037741, -1.955526, 0, 1, 0.1019608, 1,
-0.3897707, -0.239921, -2.414473, 0, 1, 0.1058824, 1,
-0.3869631, -1.246865, -4.418098, 0, 1, 0.1137255, 1,
-0.3865987, 0.2171834, 0.1564474, 0, 1, 0.1176471, 1,
-0.38291, -1.088096, -3.513381, 0, 1, 0.1254902, 1,
-0.3828839, -0.3864807, -2.444502, 0, 1, 0.1294118, 1,
-0.3784091, -1.364906, -2.482291, 0, 1, 0.1372549, 1,
-0.3762015, 0.5459902, 0.702489, 0, 1, 0.1411765, 1,
-0.372721, 0.6378967, -2.023176, 0, 1, 0.1490196, 1,
-0.367141, 1.430602, -0.9717806, 0, 1, 0.1529412, 1,
-0.3635716, -1.204649, -2.441842, 0, 1, 0.1607843, 1,
-0.3592209, -0.6217548, -2.128942, 0, 1, 0.1647059, 1,
-0.3529656, -0.5373992, -2.162371, 0, 1, 0.172549, 1,
-0.3528162, -1.146392, -2.86408, 0, 1, 0.1764706, 1,
-0.3498284, -0.7800059, -3.296902, 0, 1, 0.1843137, 1,
-0.348942, 0.1134144, -0.003260723, 0, 1, 0.1882353, 1,
-0.345501, 0.3828773, -0.06855483, 0, 1, 0.1960784, 1,
-0.3442862, -1.390363, -4.918318, 0, 1, 0.2039216, 1,
-0.344225, 1.062199, -0.3399973, 0, 1, 0.2078431, 1,
-0.3415555, 0.1916247, -1.558857, 0, 1, 0.2156863, 1,
-0.3346281, 1.246105, -0.3387219, 0, 1, 0.2196078, 1,
-0.3328906, 0.4804417, -1.715396, 0, 1, 0.227451, 1,
-0.3302701, -0.4536033, -3.695234, 0, 1, 0.2313726, 1,
-0.3276447, 0.5059472, -0.877081, 0, 1, 0.2392157, 1,
-0.3227029, -0.3191909, -3.681717, 0, 1, 0.2431373, 1,
-0.3217628, 0.9861042, 0.2416468, 0, 1, 0.2509804, 1,
-0.3215718, 0.4192504, -0.922882, 0, 1, 0.254902, 1,
-0.3193096, -0.2593547, -1.161119, 0, 1, 0.2627451, 1,
-0.2994701, 0.5457103, -0.529007, 0, 1, 0.2666667, 1,
-0.2966905, 1.219123, -1.087244, 0, 1, 0.2745098, 1,
-0.29508, -0.1968895, -3.527746, 0, 1, 0.2784314, 1,
-0.2896084, -0.186514, -1.13169, 0, 1, 0.2862745, 1,
-0.2863719, 0.2192624, -1.641138, 0, 1, 0.2901961, 1,
-0.2852074, -0.1520425, -2.245502, 0, 1, 0.2980392, 1,
-0.2835939, -0.5919401, -5.217725, 0, 1, 0.3058824, 1,
-0.280662, 0.3610658, -0.8177082, 0, 1, 0.3098039, 1,
-0.280335, 0.2311215, 1.197088, 0, 1, 0.3176471, 1,
-0.2793522, 0.8212513, 0.5367616, 0, 1, 0.3215686, 1,
-0.2734466, 1.584068, 0.3383305, 0, 1, 0.3294118, 1,
-0.2732796, 0.5585445, -0.6255649, 0, 1, 0.3333333, 1,
-0.2728277, 0.5550963, 0.1613445, 0, 1, 0.3411765, 1,
-0.2678308, 0.9441562, 0.7752177, 0, 1, 0.345098, 1,
-0.2677414, 1.038225, -2.07762, 0, 1, 0.3529412, 1,
-0.2629572, 1.584486, -0.8351671, 0, 1, 0.3568628, 1,
-0.2620081, 1.95339, -1.155329, 0, 1, 0.3647059, 1,
-0.2591774, -0.2044491, -1.771504, 0, 1, 0.3686275, 1,
-0.2586695, 1.353374, -1.26908, 0, 1, 0.3764706, 1,
-0.2586203, -0.5196071, -2.993676, 0, 1, 0.3803922, 1,
-0.2569757, -0.2881151, -1.144484, 0, 1, 0.3882353, 1,
-0.2556718, 1.026107, -0.04924379, 0, 1, 0.3921569, 1,
-0.2539028, 0.09520012, -1.316769, 0, 1, 0.4, 1,
-0.2525531, 0.7352854, -0.209128, 0, 1, 0.4078431, 1,
-0.251565, -0.1541466, -2.496776, 0, 1, 0.4117647, 1,
-0.25038, 0.5776558, -0.183973, 0, 1, 0.4196078, 1,
-0.2489885, 0.9698358, -1.680447, 0, 1, 0.4235294, 1,
-0.2416656, -0.9385392, -2.719077, 0, 1, 0.4313726, 1,
-0.2404624, 0.4534021, 0.3332493, 0, 1, 0.4352941, 1,
-0.2399736, 0.2419558, -0.528269, 0, 1, 0.4431373, 1,
-0.2389519, 0.3525548, 0.4533468, 0, 1, 0.4470588, 1,
-0.2376551, -0.09025634, -3.623768, 0, 1, 0.454902, 1,
-0.2348546, -0.8336244, -2.502396, 0, 1, 0.4588235, 1,
-0.2334348, 1.408139, -0.1404138, 0, 1, 0.4666667, 1,
-0.2326628, 0.142654, -2.346708, 0, 1, 0.4705882, 1,
-0.229979, -1.925761, -3.130131, 0, 1, 0.4784314, 1,
-0.2275887, 0.01258981, -0.7444482, 0, 1, 0.4823529, 1,
-0.2219419, 0.1629209, -2.677719, 0, 1, 0.4901961, 1,
-0.2214991, 1.491669, 0.9243835, 0, 1, 0.4941176, 1,
-0.2212451, -0.1462698, -2.167869, 0, 1, 0.5019608, 1,
-0.2199436, -0.2831235, -0.8972684, 0, 1, 0.509804, 1,
-0.2189635, -1.177851, -3.854042, 0, 1, 0.5137255, 1,
-0.2172258, 1.270736, -2.085865, 0, 1, 0.5215687, 1,
-0.2154527, 1.188059, 1.513767, 0, 1, 0.5254902, 1,
-0.2142981, -0.8963451, -2.923511, 0, 1, 0.5333334, 1,
-0.2120672, -1.000957, -1.917529, 0, 1, 0.5372549, 1,
-0.2118873, 0.2950832, -1.251053, 0, 1, 0.5450981, 1,
-0.2113179, 0.4722152, 1.942703, 0, 1, 0.5490196, 1,
-0.2024451, 0.8892716, 0.6654156, 0, 1, 0.5568628, 1,
-0.1937721, 0.7997523, 0.9668001, 0, 1, 0.5607843, 1,
-0.1830266, -0.5205539, -1.382831, 0, 1, 0.5686275, 1,
-0.1806828, -0.8277978, -2.84373, 0, 1, 0.572549, 1,
-0.1797668, 0.01590685, -1.801087, 0, 1, 0.5803922, 1,
-0.178983, -0.5143781, -4.279655, 0, 1, 0.5843138, 1,
-0.1738176, -0.5037053, -3.311692, 0, 1, 0.5921569, 1,
-0.1726948, -0.1192732, -2.777386, 0, 1, 0.5960785, 1,
-0.1725062, -0.5564274, -2.607901, 0, 1, 0.6039216, 1,
-0.1721536, 1.256233, 0.8231799, 0, 1, 0.6117647, 1,
-0.1715259, -2.833065, -3.89493, 0, 1, 0.6156863, 1,
-0.1706541, -0.2101055, -0.8228133, 0, 1, 0.6235294, 1,
-0.168856, 0.5625635, -0.5261419, 0, 1, 0.627451, 1,
-0.1686147, 0.3480916, -0.1217015, 0, 1, 0.6352941, 1,
-0.1679376, 0.1516852, 0.4353268, 0, 1, 0.6392157, 1,
-0.1658853, -0.5240324, -4.179318, 0, 1, 0.6470588, 1,
-0.1610404, -2.719258, -2.141319, 0, 1, 0.6509804, 1,
-0.1572041, 0.9793682, 0.3490231, 0, 1, 0.6588235, 1,
-0.1553785, 1.003791, -1.557526, 0, 1, 0.6627451, 1,
-0.1538806, 1.972809, -0.1711917, 0, 1, 0.6705883, 1,
-0.1445331, -1.240827, -2.884444, 0, 1, 0.6745098, 1,
-0.1432738, 0.6684709, 0.009841281, 0, 1, 0.682353, 1,
-0.139763, -0.5438725, -2.186931, 0, 1, 0.6862745, 1,
-0.1380408, -0.2963881, -2.229621, 0, 1, 0.6941177, 1,
-0.1344384, 0.3664856, -1.229643, 0, 1, 0.7019608, 1,
-0.1320954, -0.2438745, -2.33664, 0, 1, 0.7058824, 1,
-0.129797, 1.194421, 1.271472, 0, 1, 0.7137255, 1,
-0.1256157, 0.5727355, 0.7035759, 0, 1, 0.7176471, 1,
-0.1248845, 0.9656045, -0.172167, 0, 1, 0.7254902, 1,
-0.1230604, -1.255427, -4.055497, 0, 1, 0.7294118, 1,
-0.1213038, 1.254413, -0.6578643, 0, 1, 0.7372549, 1,
-0.1190099, 0.1888892, -0.3403193, 0, 1, 0.7411765, 1,
-0.1140811, 1.690711, -0.3909591, 0, 1, 0.7490196, 1,
-0.1137042, -0.3031445, -4.461935, 0, 1, 0.7529412, 1,
-0.1117626, -0.6462154, -2.516223, 0, 1, 0.7607843, 1,
-0.1112191, 0.1247091, -0.2218813, 0, 1, 0.7647059, 1,
-0.1105676, 2.479083, -1.439558, 0, 1, 0.772549, 1,
-0.1059726, -0.4668898, -1.332072, 0, 1, 0.7764706, 1,
-0.1048509, 1.808942, -1.147221, 0, 1, 0.7843137, 1,
-0.09954199, 0.2108216, 1.247308, 0, 1, 0.7882353, 1,
-0.09400254, 0.09102941, 0.02937766, 0, 1, 0.7960784, 1,
-0.09341905, 0.01132389, -2.984812, 0, 1, 0.8039216, 1,
-0.0917235, 2.072879, 1.05659, 0, 1, 0.8078431, 1,
-0.08956058, 1.770742, -0.9457924, 0, 1, 0.8156863, 1,
-0.08827605, -1.995329, -2.335176, 0, 1, 0.8196079, 1,
-0.0882359, -0.8041713, -2.294187, 0, 1, 0.827451, 1,
-0.08785852, 1.027569, -2.66807, 0, 1, 0.8313726, 1,
-0.08615745, -0.4501009, -4.452049, 0, 1, 0.8392157, 1,
-0.08594326, -1.215663, -1.327085, 0, 1, 0.8431373, 1,
-0.08424259, -1.838373, -2.76731, 0, 1, 0.8509804, 1,
-0.08223514, 0.7906397, 0.8466443, 0, 1, 0.854902, 1,
-0.0820445, 0.2119023, -1.946122, 0, 1, 0.8627451, 1,
-0.07958262, -0.2480908, -4.177806, 0, 1, 0.8666667, 1,
-0.07598213, -0.008331529, -0.8330888, 0, 1, 0.8745098, 1,
-0.07585576, -0.9917454, -3.960402, 0, 1, 0.8784314, 1,
-0.07576876, -1.252546, -3.785181, 0, 1, 0.8862745, 1,
-0.07120714, 0.2581303, -1.48271, 0, 1, 0.8901961, 1,
-0.07016025, -0.6898098, -2.923382, 0, 1, 0.8980392, 1,
-0.07014668, 0.789483, -0.8892428, 0, 1, 0.9058824, 1,
-0.06948797, 0.3716301, -1.283685, 0, 1, 0.9098039, 1,
-0.06940573, 2.15415, -0.8587754, 0, 1, 0.9176471, 1,
-0.06900948, -0.7877353, -3.301444, 0, 1, 0.9215686, 1,
-0.06862912, -1.011673, -4.567903, 0, 1, 0.9294118, 1,
-0.06751447, 0.9821405, 0.7231213, 0, 1, 0.9333333, 1,
-0.06610572, -0.743263, -2.422953, 0, 1, 0.9411765, 1,
-0.06594273, 1.676429, -0.5541245, 0, 1, 0.945098, 1,
-0.06582027, -0.1047872, -2.086089, 0, 1, 0.9529412, 1,
-0.06564537, 0.4829935, 1.100594, 0, 1, 0.9568627, 1,
-0.06242355, 0.8588718, -0.9943836, 0, 1, 0.9647059, 1,
-0.06147899, -1.446674, -5.319645, 0, 1, 0.9686275, 1,
-0.0595546, 1.313798, -0.324867, 0, 1, 0.9764706, 1,
-0.05607319, -0.8667015, -4.506189, 0, 1, 0.9803922, 1,
-0.04665966, 0.1424454, 0.3301615, 0, 1, 0.9882353, 1,
-0.0450158, 0.5159296, 1.255564, 0, 1, 0.9921569, 1,
-0.04272807, 0.8164521, -1.829479, 0, 1, 1, 1,
-0.02960214, 0.8178992, 0.9449437, 0, 0.9921569, 1, 1,
-0.02957088, -1.198032, -2.652203, 0, 0.9882353, 1, 1,
-0.02810839, -0.3242655, -3.853007, 0, 0.9803922, 1, 1,
-0.0230549, -0.6926047, -2.647688, 0, 0.9764706, 1, 1,
-0.02258625, 0.8023138, -0.4290193, 0, 0.9686275, 1, 1,
-0.02135348, -1.115356, -3.160231, 0, 0.9647059, 1, 1,
-0.01900417, 0.2229275, -1.746334, 0, 0.9568627, 1, 1,
-0.01765231, 0.5289551, 0.4335826, 0, 0.9529412, 1, 1,
-0.01712228, -0.4233429, -4.056951, 0, 0.945098, 1, 1,
-0.01638958, 0.03517722, -0.3488033, 0, 0.9411765, 1, 1,
-0.01349589, -1.860559, -3.512638, 0, 0.9333333, 1, 1,
-0.01348495, -1.70979, -2.996331, 0, 0.9294118, 1, 1,
-0.0127774, 1.488742, -1.043108, 0, 0.9215686, 1, 1,
-0.01113326, 1.152139, 0.6765481, 0, 0.9176471, 1, 1,
-0.01063876, -1.10797, -1.936834, 0, 0.9098039, 1, 1,
-0.008863006, -1.100145, -3.162174, 0, 0.9058824, 1, 1,
0.002286466, 1.594704, 0.2823998, 0, 0.8980392, 1, 1,
0.002358417, 1.312479, -0.05957728, 0, 0.8901961, 1, 1,
0.009290269, 0.451406, 1.555037, 0, 0.8862745, 1, 1,
0.01241791, 0.525061, 0.6685515, 0, 0.8784314, 1, 1,
0.01373477, -1.300705, 3.673447, 0, 0.8745098, 1, 1,
0.01490282, 0.428225, 0.7756557, 0, 0.8666667, 1, 1,
0.01774455, 1.862993, 0.9999357, 0, 0.8627451, 1, 1,
0.01934178, 1.021434, 0.2298574, 0, 0.854902, 1, 1,
0.02136547, 0.9510412, 2.188879, 0, 0.8509804, 1, 1,
0.02292683, 0.5587212, 1.314592, 0, 0.8431373, 1, 1,
0.02444272, -1.308378, 3.139992, 0, 0.8392157, 1, 1,
0.02792844, -1.04429, 4.108551, 0, 0.8313726, 1, 1,
0.02975063, 0.7707667, 0.07287548, 0, 0.827451, 1, 1,
0.03882512, -0.9252424, 5.655669, 0, 0.8196079, 1, 1,
0.03967766, -0.1094653, 3.848614, 0, 0.8156863, 1, 1,
0.04060986, 0.4677207, 0.3662977, 0, 0.8078431, 1, 1,
0.04087662, 0.2338834, -0.06181699, 0, 0.8039216, 1, 1,
0.04188326, 0.6110823, -1.220218, 0, 0.7960784, 1, 1,
0.04394984, -0.5188482, 2.038522, 0, 0.7882353, 1, 1,
0.04561215, -0.8875586, 1.948005, 0, 0.7843137, 1, 1,
0.0538869, 0.9727476, 1.484414, 0, 0.7764706, 1, 1,
0.05502902, 0.4211214, -0.6796445, 0, 0.772549, 1, 1,
0.055451, -0.6026803, 2.470031, 0, 0.7647059, 1, 1,
0.0596125, 1.327048, 0.8336007, 0, 0.7607843, 1, 1,
0.06480417, 1.077043, -1.043429, 0, 0.7529412, 1, 1,
0.06769701, -1.375794, 3.453615, 0, 0.7490196, 1, 1,
0.06797285, -0.09695246, 2.283177, 0, 0.7411765, 1, 1,
0.06900895, -0.4002939, 5.095565, 0, 0.7372549, 1, 1,
0.0695431, -1.538778, 2.681952, 0, 0.7294118, 1, 1,
0.06983323, -0.179076, 1.783884, 0, 0.7254902, 1, 1,
0.07794601, -1.520812, 1.912918, 0, 0.7176471, 1, 1,
0.07947798, -1.010534, 2.846381, 0, 0.7137255, 1, 1,
0.08147441, 0.2217588, 0.2415232, 0, 0.7058824, 1, 1,
0.08371137, -0.7589121, 2.009231, 0, 0.6980392, 1, 1,
0.08411644, -0.6797773, 1.873697, 0, 0.6941177, 1, 1,
0.09299009, -0.7201318, 3.272055, 0, 0.6862745, 1, 1,
0.09302886, 0.9406502, -1.126763, 0, 0.682353, 1, 1,
0.0944644, -0.5937314, 1.786823, 0, 0.6745098, 1, 1,
0.09497841, 0.1365009, -1.340628, 0, 0.6705883, 1, 1,
0.09958631, 0.2458411, 0.8419536, 0, 0.6627451, 1, 1,
0.1011537, 1.342532, -2.040824, 0, 0.6588235, 1, 1,
0.1094143, 0.4580102, 0.2937998, 0, 0.6509804, 1, 1,
0.1102529, 0.1676842, -1.471044, 0, 0.6470588, 1, 1,
0.1111026, 0.412446, 0.3216548, 0, 0.6392157, 1, 1,
0.1124407, -0.2888045, 3.66595, 0, 0.6352941, 1, 1,
0.1148813, -1.794356, 3.173885, 0, 0.627451, 1, 1,
0.1178433, -0.6645523, 1.745615, 0, 0.6235294, 1, 1,
0.1212629, 0.5088524, 0.03571175, 0, 0.6156863, 1, 1,
0.1218268, 1.182075, 0.1030225, 0, 0.6117647, 1, 1,
0.1220943, -0.1901454, 3.666819, 0, 0.6039216, 1, 1,
0.1266371, 1.153987, -0.6433734, 0, 0.5960785, 1, 1,
0.1267481, 0.2552318, 3.22173, 0, 0.5921569, 1, 1,
0.1385392, 0.6855464, 0.2078042, 0, 0.5843138, 1, 1,
0.1414366, -0.8850666, 4.134694, 0, 0.5803922, 1, 1,
0.1416947, -0.7555068, 3.040797, 0, 0.572549, 1, 1,
0.1440066, -0.8643815, 1.563478, 0, 0.5686275, 1, 1,
0.1446869, 0.2110797, -0.09330764, 0, 0.5607843, 1, 1,
0.1468659, -0.3020946, 4.000584, 0, 0.5568628, 1, 1,
0.1491538, -0.9001471, 2.821536, 0, 0.5490196, 1, 1,
0.1523339, -2.121339, 3.196211, 0, 0.5450981, 1, 1,
0.1561452, -1.253322, 2.437963, 0, 0.5372549, 1, 1,
0.1602215, -0.2238051, 4.44968, 0, 0.5333334, 1, 1,
0.1616268, -1.421564, 1.89391, 0, 0.5254902, 1, 1,
0.1675599, 0.219836, 0.09383525, 0, 0.5215687, 1, 1,
0.1751096, -0.6334631, 1.083629, 0, 0.5137255, 1, 1,
0.175176, 0.5478991, -0.2179886, 0, 0.509804, 1, 1,
0.1853286, 0.2493788, -0.7018343, 0, 0.5019608, 1, 1,
0.1870009, 0.8605428, 0.3156634, 0, 0.4941176, 1, 1,
0.1905768, 1.379173, 0.7305602, 0, 0.4901961, 1, 1,
0.1914426, -0.07694871, 2.721784, 0, 0.4823529, 1, 1,
0.1941192, 0.5045384, 0.3826202, 0, 0.4784314, 1, 1,
0.1958065, 1.571748, -1.363165, 0, 0.4705882, 1, 1,
0.2023879, 0.1934256, 0.2974128, 0, 0.4666667, 1, 1,
0.2052449, -0.04849669, 1.935254, 0, 0.4588235, 1, 1,
0.2099546, 3.218397, 0.2629496, 0, 0.454902, 1, 1,
0.2105708, 0.8885518, 0.5481042, 0, 0.4470588, 1, 1,
0.2160646, 0.1424254, 0.7213368, 0, 0.4431373, 1, 1,
0.218966, 0.7758912, -0.1695397, 0, 0.4352941, 1, 1,
0.2223189, -1.989906, 3.948036, 0, 0.4313726, 1, 1,
0.2276704, -2.178523, 3.539627, 0, 0.4235294, 1, 1,
0.2282313, 0.615208, 1.451605, 0, 0.4196078, 1, 1,
0.2327989, -1.323741, 4.502418, 0, 0.4117647, 1, 1,
0.2329446, 0.01518514, 2.055661, 0, 0.4078431, 1, 1,
0.2353975, 1.459373, 1.50965, 0, 0.4, 1, 1,
0.2409206, 1.385778, -0.00156914, 0, 0.3921569, 1, 1,
0.2411427, -0.4212236, 2.353526, 0, 0.3882353, 1, 1,
0.2435051, -1.013277, 3.574607, 0, 0.3803922, 1, 1,
0.2453998, -0.4052232, 3.592132, 0, 0.3764706, 1, 1,
0.2482423, -1.230743, 3.181806, 0, 0.3686275, 1, 1,
0.2496276, 0.3353027, 1.203982, 0, 0.3647059, 1, 1,
0.2541147, 0.6628903, -0.6162881, 0, 0.3568628, 1, 1,
0.2557409, -0.9469057, 2.444662, 0, 0.3529412, 1, 1,
0.2608165, -1.409691, 3.921269, 0, 0.345098, 1, 1,
0.2617446, -0.1326495, 3.34905, 0, 0.3411765, 1, 1,
0.2622746, -0.8944876, 2.787423, 0, 0.3333333, 1, 1,
0.2650826, 0.03573778, 2.880906, 0, 0.3294118, 1, 1,
0.2713365, -2.43528, 3.633707, 0, 0.3215686, 1, 1,
0.2722829, 0.976591, -0.1731416, 0, 0.3176471, 1, 1,
0.2795817, -0.3042692, 2.626377, 0, 0.3098039, 1, 1,
0.2873201, 0.02139416, 1.336372, 0, 0.3058824, 1, 1,
0.289161, -1.859044, 3.641648, 0, 0.2980392, 1, 1,
0.291337, -0.2236314, 1.585743, 0, 0.2901961, 1, 1,
0.29579, 2.685978, 0.3172728, 0, 0.2862745, 1, 1,
0.2969489, -0.4880881, -0.06140306, 0, 0.2784314, 1, 1,
0.2995508, -0.6205336, 3.461207, 0, 0.2745098, 1, 1,
0.3013766, -0.8801036, 2.394325, 0, 0.2666667, 1, 1,
0.3020304, 0.04741849, 1.431441, 0, 0.2627451, 1, 1,
0.3022574, 0.9456417, -1.409788, 0, 0.254902, 1, 1,
0.3050101, 0.7093289, -0.198751, 0, 0.2509804, 1, 1,
0.3091525, -1.24555, 3.017906, 0, 0.2431373, 1, 1,
0.3124755, 1.028632, 0.6372485, 0, 0.2392157, 1, 1,
0.3146591, -1.052663, 1.923094, 0, 0.2313726, 1, 1,
0.316402, -0.4751696, 2.450353, 0, 0.227451, 1, 1,
0.3242958, -0.1211713, 1.58711, 0, 0.2196078, 1, 1,
0.3261386, -0.1026103, 2.625562, 0, 0.2156863, 1, 1,
0.3293113, -0.682767, 2.596561, 0, 0.2078431, 1, 1,
0.3310941, 1.454733, -0.7957622, 0, 0.2039216, 1, 1,
0.3324669, -0.8732732, 3.802877, 0, 0.1960784, 1, 1,
0.3345856, -2.032622, 2.341507, 0, 0.1882353, 1, 1,
0.3375303, -1.496112, 3.30662, 0, 0.1843137, 1, 1,
0.3394676, -1.651773, 2.493644, 0, 0.1764706, 1, 1,
0.3431887, -0.6440756, 2.145706, 0, 0.172549, 1, 1,
0.3454412, 0.344571, -0.1830898, 0, 0.1647059, 1, 1,
0.346672, 0.6356091, -0.6763916, 0, 0.1607843, 1, 1,
0.3468347, -0.3782265, 2.037201, 0, 0.1529412, 1, 1,
0.3488434, -1.050673, 4.81426, 0, 0.1490196, 1, 1,
0.3520486, 0.1604682, 0.2940319, 0, 0.1411765, 1, 1,
0.3573062, 0.8820458, 1.254469, 0, 0.1372549, 1, 1,
0.3588492, -0.3072298, 2.070357, 0, 0.1294118, 1, 1,
0.3621624, 1.144474, -0.09360004, 0, 0.1254902, 1, 1,
0.3636531, 0.7221102, 1.817762, 0, 0.1176471, 1, 1,
0.3712749, 1.228371, 2.60182, 0, 0.1137255, 1, 1,
0.3718449, 1.766711, -0.9948641, 0, 0.1058824, 1, 1,
0.3759966, 0.7299524, -0.9197013, 0, 0.09803922, 1, 1,
0.3762982, -0.03970273, 1.702075, 0, 0.09411765, 1, 1,
0.3782822, -0.3660519, 3.603873, 0, 0.08627451, 1, 1,
0.3789776, 0.2306748, 0.7708354, 0, 0.08235294, 1, 1,
0.3812213, -0.04050527, 1.46428, 0, 0.07450981, 1, 1,
0.3825565, 0.4522933, 1.495777, 0, 0.07058824, 1, 1,
0.3825735, 1.091433, -0.2143657, 0, 0.0627451, 1, 1,
0.3859764, -0.1859671, 1.831649, 0, 0.05882353, 1, 1,
0.3906552, 0.3058258, 0.2747875, 0, 0.05098039, 1, 1,
0.3949383, 0.7647071, 0.2246882, 0, 0.04705882, 1, 1,
0.396177, 0.2088546, -1.183012, 0, 0.03921569, 1, 1,
0.4077743, -0.9122218, 3.050824, 0, 0.03529412, 1, 1,
0.4087772, 0.3399787, 1.687105, 0, 0.02745098, 1, 1,
0.4097923, -0.4469181, 4.619201, 0, 0.02352941, 1, 1,
0.4104809, -1.092325, 3.091412, 0, 0.01568628, 1, 1,
0.4134071, 0.5801766, 0.986715, 0, 0.01176471, 1, 1,
0.4157284, 0.7422405, -0.135426, 0, 0.003921569, 1, 1,
0.4205855, 1.553427, 0.8800781, 0.003921569, 0, 1, 1,
0.4233417, -0.8700401, 0.9192246, 0.007843138, 0, 1, 1,
0.4265168, -0.9191507, 2.983615, 0.01568628, 0, 1, 1,
0.4370619, 0.7521095, 0.2600457, 0.01960784, 0, 1, 1,
0.4397475, 0.1466782, 1.547886, 0.02745098, 0, 1, 1,
0.4410995, 1.774311, 0.2451782, 0.03137255, 0, 1, 1,
0.4424608, -1.353609, -0.2228292, 0.03921569, 0, 1, 1,
0.4437689, 0.1615825, 1.494392, 0.04313726, 0, 1, 1,
0.4447105, 1.160816, -1.384426, 0.05098039, 0, 1, 1,
0.4453857, 0.1064671, 1.344684, 0.05490196, 0, 1, 1,
0.4535926, 0.7751113, 0.6818478, 0.0627451, 0, 1, 1,
0.4537399, -0.8437606, 0.4223381, 0.06666667, 0, 1, 1,
0.4563934, -0.3063454, 4.002479, 0.07450981, 0, 1, 1,
0.4582148, 1.541375, 1.100329, 0.07843138, 0, 1, 1,
0.4611098, -0.9468458, 3.97122, 0.08627451, 0, 1, 1,
0.4674593, 1.798161, 0.4754014, 0.09019608, 0, 1, 1,
0.4675678, 0.2246953, 0.8087775, 0.09803922, 0, 1, 1,
0.4677458, -1.366516, 1.796511, 0.1058824, 0, 1, 1,
0.4678051, 0.6879433, 0.5627993, 0.1098039, 0, 1, 1,
0.4708433, 0.4469713, -0.6590066, 0.1176471, 0, 1, 1,
0.4721792, -0.2566497, 2.401644, 0.1215686, 0, 1, 1,
0.4742799, -0.5174126, 1.15845, 0.1294118, 0, 1, 1,
0.4758528, -0.3747422, 1.779523, 0.1333333, 0, 1, 1,
0.4797129, -0.2727982, 1.568742, 0.1411765, 0, 1, 1,
0.4834686, -0.02488098, 2.763977, 0.145098, 0, 1, 1,
0.4916528, -1.56372, 4.278721, 0.1529412, 0, 1, 1,
0.4948761, 0.8958455, 0.1618881, 0.1568628, 0, 1, 1,
0.4980866, -0.9883671, 2.225053, 0.1647059, 0, 1, 1,
0.4991705, -0.8080457, 1.205524, 0.1686275, 0, 1, 1,
0.5110431, 0.8921404, 1.049294, 0.1764706, 0, 1, 1,
0.5111173, -0.4043524, 2.891003, 0.1803922, 0, 1, 1,
0.5185613, 0.675913, -1.505705, 0.1882353, 0, 1, 1,
0.5208476, -0.6110761, 0.5609969, 0.1921569, 0, 1, 1,
0.5242909, 0.8453486, 0.5060073, 0.2, 0, 1, 1,
0.5273083, -0.992067, 2.073948, 0.2078431, 0, 1, 1,
0.5276931, 0.449112, 0.7802579, 0.2117647, 0, 1, 1,
0.5303835, 0.1404925, 0.6853352, 0.2196078, 0, 1, 1,
0.5309154, -0.7414925, 2.166545, 0.2235294, 0, 1, 1,
0.533742, -1.934272, 0.2003249, 0.2313726, 0, 1, 1,
0.5411635, -1.176813, 2.949088, 0.2352941, 0, 1, 1,
0.5416695, 1.82872, -0.5527757, 0.2431373, 0, 1, 1,
0.5425436, -0.355952, 3.075654, 0.2470588, 0, 1, 1,
0.5593767, -0.1941884, 0.3718174, 0.254902, 0, 1, 1,
0.5658263, 1.530635, -0.1956446, 0.2588235, 0, 1, 1,
0.5658343, 0.943641, 0.3983518, 0.2666667, 0, 1, 1,
0.5660495, 0.8167834, -1.194835, 0.2705882, 0, 1, 1,
0.5667637, 0.1587873, 2.723797, 0.2784314, 0, 1, 1,
0.5711123, 0.08250678, 1.720662, 0.282353, 0, 1, 1,
0.5777407, -0.565403, 2.077751, 0.2901961, 0, 1, 1,
0.5797112, 0.7395728, 0.3401961, 0.2941177, 0, 1, 1,
0.5869223, 2.524654, -1.146631, 0.3019608, 0, 1, 1,
0.5869421, 0.3186683, -0.04066844, 0.3098039, 0, 1, 1,
0.5874149, -0.9138958, 2.915765, 0.3137255, 0, 1, 1,
0.5877483, -1.048458, 4.372481, 0.3215686, 0, 1, 1,
0.5898433, 0.3831388, -0.6802742, 0.3254902, 0, 1, 1,
0.5902117, 1.035704, -0.4778592, 0.3333333, 0, 1, 1,
0.5902956, 0.8328174, 1.868393, 0.3372549, 0, 1, 1,
0.5914886, 2.455611, 1.821935, 0.345098, 0, 1, 1,
0.5916805, -1.50104, 3.773575, 0.3490196, 0, 1, 1,
0.5987058, -0.4023408, 1.48243, 0.3568628, 0, 1, 1,
0.6040663, -0.4413105, 1.522208, 0.3607843, 0, 1, 1,
0.6084241, 0.4077112, 2.321198, 0.3686275, 0, 1, 1,
0.6172202, -0.06748734, 1.357893, 0.372549, 0, 1, 1,
0.6173266, 0.3193985, 2.400818, 0.3803922, 0, 1, 1,
0.6219004, -0.2504874, 1.883454, 0.3843137, 0, 1, 1,
0.6331658, 1.425465, -1.397231, 0.3921569, 0, 1, 1,
0.6335807, 0.1334751, 2.222792, 0.3960784, 0, 1, 1,
0.6348304, 0.6145415, 1.090113, 0.4039216, 0, 1, 1,
0.6391118, -1.331618, 2.072469, 0.4117647, 0, 1, 1,
0.6409043, 0.4618819, 0.1385593, 0.4156863, 0, 1, 1,
0.642078, -0.6139125, 1.835884, 0.4235294, 0, 1, 1,
0.6489528, -0.3783261, 1.823024, 0.427451, 0, 1, 1,
0.6540395, 0.8438842, 0.8881282, 0.4352941, 0, 1, 1,
0.6578364, 0.1632397, 1.889579, 0.4392157, 0, 1, 1,
0.6580515, 0.08315168, 0.8155771, 0.4470588, 0, 1, 1,
0.659544, -0.6364726, 2.173377, 0.4509804, 0, 1, 1,
0.6634569, 0.3392477, 0.9797266, 0.4588235, 0, 1, 1,
0.6726516, -1.618276, 2.86449, 0.4627451, 0, 1, 1,
0.6831369, 0.7814315, 0.7560911, 0.4705882, 0, 1, 1,
0.6901906, 2.561651, -0.41574, 0.4745098, 0, 1, 1,
0.6963356, -1.342488, 2.517702, 0.4823529, 0, 1, 1,
0.7029237, 1.387754, 1.08251, 0.4862745, 0, 1, 1,
0.7049105, -0.638938, 0.371225, 0.4941176, 0, 1, 1,
0.7056962, -1.084757, 3.271435, 0.5019608, 0, 1, 1,
0.7125338, 0.03847115, 0.4532369, 0.5058824, 0, 1, 1,
0.7135664, -0.2573943, 3.925788, 0.5137255, 0, 1, 1,
0.7155071, -0.2058236, 2.631346, 0.5176471, 0, 1, 1,
0.7197647, 0.4256441, 0.8735384, 0.5254902, 0, 1, 1,
0.7203799, 1.180567, -0.420698, 0.5294118, 0, 1, 1,
0.7232137, -0.7765763, 1.143057, 0.5372549, 0, 1, 1,
0.7282907, 1.555855, -0.4466141, 0.5411765, 0, 1, 1,
0.7330911, -0.8202995, 2.798931, 0.5490196, 0, 1, 1,
0.7406285, 0.223387, 1.980664, 0.5529412, 0, 1, 1,
0.7514994, 0.3437504, 1.79406, 0.5607843, 0, 1, 1,
0.7527584, -0.1234003, 1.561895, 0.5647059, 0, 1, 1,
0.7611821, 0.5476803, -0.5765474, 0.572549, 0, 1, 1,
0.7638505, -1.37842, 2.437381, 0.5764706, 0, 1, 1,
0.7639647, -0.3491082, 1.52232, 0.5843138, 0, 1, 1,
0.7658837, -0.9152166, 2.390024, 0.5882353, 0, 1, 1,
0.7668353, 0.680398, 0.03551461, 0.5960785, 0, 1, 1,
0.7762091, -1.267629, 4.197099, 0.6039216, 0, 1, 1,
0.7791702, 0.6255167, -1.587047, 0.6078432, 0, 1, 1,
0.7802151, 0.8646923, -0.0746491, 0.6156863, 0, 1, 1,
0.7830516, 1.663295, -1.709671, 0.6196079, 0, 1, 1,
0.7875795, 0.7719943, 2.342057, 0.627451, 0, 1, 1,
0.7925991, -0.6770951, 0.7907658, 0.6313726, 0, 1, 1,
0.7939385, 0.2982398, 2.46726, 0.6392157, 0, 1, 1,
0.7985736, -0.5248111, 1.481379, 0.6431373, 0, 1, 1,
0.8083315, -0.6941229, 4.214117, 0.6509804, 0, 1, 1,
0.8159637, 1.29146, 1.084976, 0.654902, 0, 1, 1,
0.8247831, -0.9470769, 1.538799, 0.6627451, 0, 1, 1,
0.8253345, -1.481226, 2.562686, 0.6666667, 0, 1, 1,
0.8398299, -2.218707, 1.803514, 0.6745098, 0, 1, 1,
0.839924, 1.859405, 2.678057, 0.6784314, 0, 1, 1,
0.8438109, -1.267776, 4.145718, 0.6862745, 0, 1, 1,
0.852954, 0.3692351, 1.278476, 0.6901961, 0, 1, 1,
0.8574328, -0.8127914, 1.797716, 0.6980392, 0, 1, 1,
0.8581051, -0.1371506, 1.755404, 0.7058824, 0, 1, 1,
0.8608083, 1.075537, 1.487717, 0.7098039, 0, 1, 1,
0.8635417, 0.5627756, 0.6953794, 0.7176471, 0, 1, 1,
0.8662428, -0.3113966, 0.5010648, 0.7215686, 0, 1, 1,
0.8681768, 0.9243121, 0.3676727, 0.7294118, 0, 1, 1,
0.8708538, 0.8308845, 1.419133, 0.7333333, 0, 1, 1,
0.8769336, 0.2304142, 3.387472, 0.7411765, 0, 1, 1,
0.8789271, -0.4395271, 2.348057, 0.7450981, 0, 1, 1,
0.8820776, 0.6231976, 1.841533, 0.7529412, 0, 1, 1,
0.882722, -0.863869, 2.525885, 0.7568628, 0, 1, 1,
0.8836153, 0.4456852, 1.154742, 0.7647059, 0, 1, 1,
0.8886189, 0.0201121, 2.397169, 0.7686275, 0, 1, 1,
0.892948, 2.0003, -0.8823853, 0.7764706, 0, 1, 1,
0.894671, -1.857669, 2.401238, 0.7803922, 0, 1, 1,
0.8964605, -1.247428, 1.955387, 0.7882353, 0, 1, 1,
0.8965306, -0.344169, 2.435182, 0.7921569, 0, 1, 1,
0.9034365, 0.2072095, 1.446361, 0.8, 0, 1, 1,
0.9055759, 0.8174371, 1.40903, 0.8078431, 0, 1, 1,
0.9078003, 0.4296828, 1.165678, 0.8117647, 0, 1, 1,
0.9137801, 0.1213656, 1.848686, 0.8196079, 0, 1, 1,
0.9176979, -1.947269, 2.717132, 0.8235294, 0, 1, 1,
0.923238, 0.4616338, 0.7618148, 0.8313726, 0, 1, 1,
0.929884, 1.070197, 1.686753, 0.8352941, 0, 1, 1,
0.9298858, -2.811403, 2.393743, 0.8431373, 0, 1, 1,
0.9309936, 0.2638646, 0.7035483, 0.8470588, 0, 1, 1,
0.9314494, -0.3806471, 1.00638, 0.854902, 0, 1, 1,
0.9348494, 0.3693931, 0.8342167, 0.8588235, 0, 1, 1,
0.939732, 1.219173, -0.4602419, 0.8666667, 0, 1, 1,
0.9431404, 0.3613957, 0.7598664, 0.8705882, 0, 1, 1,
0.9464845, -1.277439, 2.285403, 0.8784314, 0, 1, 1,
0.9477844, -0.8997771, 1.114792, 0.8823529, 0, 1, 1,
0.9486928, 0.7728317, 0.6247333, 0.8901961, 0, 1, 1,
0.9527122, -0.1720642, 0.7416533, 0.8941177, 0, 1, 1,
0.9564855, -0.08025943, -1.613102, 0.9019608, 0, 1, 1,
0.9578904, 0.9386816, 2.011635, 0.9098039, 0, 1, 1,
0.9607162, 0.7183673, -1.06614, 0.9137255, 0, 1, 1,
0.9668055, -0.8978161, 3.593094, 0.9215686, 0, 1, 1,
0.9692841, -1.672585, 3.934846, 0.9254902, 0, 1, 1,
0.9840834, -1.476912, 2.151035, 0.9333333, 0, 1, 1,
0.9867663, -1.56528, 2.146223, 0.9372549, 0, 1, 1,
0.9883921, 1.993816, 0.350901, 0.945098, 0, 1, 1,
0.989839, 1.562661, 0.2865259, 0.9490196, 0, 1, 1,
0.9952147, 0.9130397, 0.1289259, 0.9568627, 0, 1, 1,
0.9959219, -0.05970678, 2.370613, 0.9607843, 0, 1, 1,
1.018813, 0.9776271, 1.464144, 0.9686275, 0, 1, 1,
1.020826, -0.2666141, 1.132142, 0.972549, 0, 1, 1,
1.038303, 1.10279, -0.232615, 0.9803922, 0, 1, 1,
1.040786, 1.659873, 0.2129707, 0.9843137, 0, 1, 1,
1.041609, 0.7137131, 0.5458267, 0.9921569, 0, 1, 1,
1.056813, -0.5995142, 1.408658, 0.9960784, 0, 1, 1,
1.058494, -2.156602, 2.525736, 1, 0, 0.9960784, 1,
1.061296, 1.947823, 0.04957965, 1, 0, 0.9882353, 1,
1.064421, 1.007333, 1.445047, 1, 0, 0.9843137, 1,
1.07102, -2.460553, 2.90766, 1, 0, 0.9764706, 1,
1.073747, 0.5285404, 1.87831, 1, 0, 0.972549, 1,
1.079513, 0.2327609, 1.274836, 1, 0, 0.9647059, 1,
1.084418, 0.1944685, 2.554946, 1, 0, 0.9607843, 1,
1.086239, -0.884585, 2.46651, 1, 0, 0.9529412, 1,
1.087664, -1.210498, 1.990409, 1, 0, 0.9490196, 1,
1.08861, -1.062546, 1.994785, 1, 0, 0.9411765, 1,
1.098233, 0.1330346, 1.524939, 1, 0, 0.9372549, 1,
1.100405, -2.909649, 2.777899, 1, 0, 0.9294118, 1,
1.102964, -1.07007, 3.152443, 1, 0, 0.9254902, 1,
1.109793, -0.577923, -0.707168, 1, 0, 0.9176471, 1,
1.114648, -0.05614578, 2.017934, 1, 0, 0.9137255, 1,
1.116366, 0.05927724, 2.186509, 1, 0, 0.9058824, 1,
1.124629, -0.8973206, 2.092543, 1, 0, 0.9019608, 1,
1.129369, -1.371592, 1.87636, 1, 0, 0.8941177, 1,
1.132211, 1.67125, 3.012996, 1, 0, 0.8862745, 1,
1.139556, -0.3032697, 2.247147, 1, 0, 0.8823529, 1,
1.141513, 1.407849, 0.1364004, 1, 0, 0.8745098, 1,
1.144559, 0.666266, 1.733095, 1, 0, 0.8705882, 1,
1.144888, -0.2613446, 2.387496, 1, 0, 0.8627451, 1,
1.147818, -0.01096801, 2.325909, 1, 0, 0.8588235, 1,
1.157672, 0.4503364, 1.493416, 1, 0, 0.8509804, 1,
1.163031, 0.2004557, 0.6593286, 1, 0, 0.8470588, 1,
1.168644, 1.25301, 1.878328, 1, 0, 0.8392157, 1,
1.171806, 0.1348555, 2.471835, 1, 0, 0.8352941, 1,
1.176271, 0.9629426, 1.654687, 1, 0, 0.827451, 1,
1.183076, 0.9790016, -0.1290334, 1, 0, 0.8235294, 1,
1.188402, 1.56766, 3.420897, 1, 0, 0.8156863, 1,
1.190189, -0.08329145, 2.769172, 1, 0, 0.8117647, 1,
1.191731, -1.061893, 1.100443, 1, 0, 0.8039216, 1,
1.199841, -0.6691104, 1.351842, 1, 0, 0.7960784, 1,
1.209351, -0.8669559, -0.2555364, 1, 0, 0.7921569, 1,
1.217867, -0.3280458, 0.2511089, 1, 0, 0.7843137, 1,
1.219893, 0.08664524, 1.600511, 1, 0, 0.7803922, 1,
1.232342, -0.3091529, 0.8474689, 1, 0, 0.772549, 1,
1.237974, -0.7688659, 1.716025, 1, 0, 0.7686275, 1,
1.238979, 0.3131516, -0.07096381, 1, 0, 0.7607843, 1,
1.24228, 0.4119132, 0.7444732, 1, 0, 0.7568628, 1,
1.24962, -0.558286, 2.424993, 1, 0, 0.7490196, 1,
1.250244, -1.517913, 2.46194, 1, 0, 0.7450981, 1,
1.252487, 0.9493151, -0.8595615, 1, 0, 0.7372549, 1,
1.25536, -0.7721583, -0.1213345, 1, 0, 0.7333333, 1,
1.259743, -1.421522, 3.175163, 1, 0, 0.7254902, 1,
1.26773, 0.8276982, 4.008742, 1, 0, 0.7215686, 1,
1.267755, -0.8664286, 2.905086, 1, 0, 0.7137255, 1,
1.272009, -0.549456, 3.576134, 1, 0, 0.7098039, 1,
1.275121, 0.7371037, 2.235545, 1, 0, 0.7019608, 1,
1.275348, -0.7146147, 1.555223, 1, 0, 0.6941177, 1,
1.275406, 0.308708, 0.694105, 1, 0, 0.6901961, 1,
1.277399, 0.1418088, 0.9206125, 1, 0, 0.682353, 1,
1.281639, 2.670506, 2.018976, 1, 0, 0.6784314, 1,
1.285204, -0.2532368, 2.137227, 1, 0, 0.6705883, 1,
1.290696, -0.3164147, 2.461196, 1, 0, 0.6666667, 1,
1.307543, -1.221366, 2.602142, 1, 0, 0.6588235, 1,
1.315956, -0.2084641, 1.349036, 1, 0, 0.654902, 1,
1.320186, -0.2369347, 4.966173, 1, 0, 0.6470588, 1,
1.321167, -1.329873, 1.885643, 1, 0, 0.6431373, 1,
1.322264, 1.146607, 0.7723293, 1, 0, 0.6352941, 1,
1.330864, -0.204433, 1.257781, 1, 0, 0.6313726, 1,
1.332595, 0.09373292, 2.747031, 1, 0, 0.6235294, 1,
1.333975, -0.4088235, 1.157237, 1, 0, 0.6196079, 1,
1.346362, -1.044954, 2.112806, 1, 0, 0.6117647, 1,
1.347113, 0.2094979, 1.406007, 1, 0, 0.6078432, 1,
1.350633, 0.3006935, 0.7206357, 1, 0, 0.6, 1,
1.365698, 0.05286821, 0.4374776, 1, 0, 0.5921569, 1,
1.368073, -1.419517, 2.63432, 1, 0, 0.5882353, 1,
1.370301, 1.137828, 3.092954, 1, 0, 0.5803922, 1,
1.384892, -1.428058, 3.615872, 1, 0, 0.5764706, 1,
1.390972, -0.8560994, 1.085157, 1, 0, 0.5686275, 1,
1.400363, 0.6460303, 0.8904431, 1, 0, 0.5647059, 1,
1.406463, -0.0295786, 3.927811, 1, 0, 0.5568628, 1,
1.411101, 0.4672604, 1.191929, 1, 0, 0.5529412, 1,
1.416352, 2.206589, 1.35308, 1, 0, 0.5450981, 1,
1.42395, -0.05842562, 2.609952, 1, 0, 0.5411765, 1,
1.439025, -1.347508, 2.202942, 1, 0, 0.5333334, 1,
1.472471, 2.053416, 0.4003708, 1, 0, 0.5294118, 1,
1.487896, -1.623071, 2.412144, 1, 0, 0.5215687, 1,
1.489363, -0.6853279, 1.361596, 1, 0, 0.5176471, 1,
1.491133, 1.690939, 2.227589, 1, 0, 0.509804, 1,
1.497285, -0.6188858, 1.922519, 1, 0, 0.5058824, 1,
1.498304, -0.9435341, 1.309924, 1, 0, 0.4980392, 1,
1.505062, 1.2977, 2.796154, 1, 0, 0.4901961, 1,
1.515577, 0.5981829, 0.3536781, 1, 0, 0.4862745, 1,
1.515684, 1.054675, 1.51233, 1, 0, 0.4784314, 1,
1.519374, 1.117158, 0.9852003, 1, 0, 0.4745098, 1,
1.524255, 1.271116, 1.743966, 1, 0, 0.4666667, 1,
1.527398, -0.0881195, 0.593394, 1, 0, 0.4627451, 1,
1.540505, 0.7555941, 1.490715, 1, 0, 0.454902, 1,
1.545673, 0.5462973, 2.354979, 1, 0, 0.4509804, 1,
1.545956, 0.3497731, 1.428454, 1, 0, 0.4431373, 1,
1.551479, 0.5624239, 1.120728, 1, 0, 0.4392157, 1,
1.554439, 0.4179369, 0.8154619, 1, 0, 0.4313726, 1,
1.5656, -1.653964, 1.937219, 1, 0, 0.427451, 1,
1.576297, -0.4914414, 2.518, 1, 0, 0.4196078, 1,
1.579728, 1.695096, 0.8521486, 1, 0, 0.4156863, 1,
1.605447, 0.4491114, 2.505045, 1, 0, 0.4078431, 1,
1.606603, 1.032704, 0.07856522, 1, 0, 0.4039216, 1,
1.635321, -0.3742779, 3.299592, 1, 0, 0.3960784, 1,
1.641131, 0.01810759, 1.613059, 1, 0, 0.3882353, 1,
1.644127, 1.208363, -0.09453691, 1, 0, 0.3843137, 1,
1.650247, 0.9694942, 0.7014887, 1, 0, 0.3764706, 1,
1.656765, 1.081479, 2.328682, 1, 0, 0.372549, 1,
1.664099, -0.3867475, 1.027614, 1, 0, 0.3647059, 1,
1.691549, -0.7826317, 0.7501974, 1, 0, 0.3607843, 1,
1.69928, 1.628133, -1.095252, 1, 0, 0.3529412, 1,
1.700609, 0.7567351, 0.9905804, 1, 0, 0.3490196, 1,
1.710069, -1.956433, 1.241852, 1, 0, 0.3411765, 1,
1.71274, 0.9653569, 0.1497548, 1, 0, 0.3372549, 1,
1.720212, -0.342686, 1.980735, 1, 0, 0.3294118, 1,
1.741338, 0.3442352, 1.289134, 1, 0, 0.3254902, 1,
1.7478, -0.5237764, 3.440585, 1, 0, 0.3176471, 1,
1.753098, -1.091474, 2.147351, 1, 0, 0.3137255, 1,
1.75752, -0.5760204, 1.093154, 1, 0, 0.3058824, 1,
1.764128, 0.3951715, -0.4737259, 1, 0, 0.2980392, 1,
1.764267, 0.3092763, 0.0336864, 1, 0, 0.2941177, 1,
1.799881, -0.03977289, 1.656175, 1, 0, 0.2862745, 1,
1.80382, -0.636382, 2.12167, 1, 0, 0.282353, 1,
1.820143, 0.03008622, 2.530096, 1, 0, 0.2745098, 1,
1.824103, -1.227403, 2.291943, 1, 0, 0.2705882, 1,
1.831226, -0.5522867, 1.846729, 1, 0, 0.2627451, 1,
1.846771, -1.10899, 3.665441, 1, 0, 0.2588235, 1,
1.856977, -0.2618478, 2.52259, 1, 0, 0.2509804, 1,
1.877452, 0.2864841, 1.904738, 1, 0, 0.2470588, 1,
1.885598, 2.188762, 1.877149, 1, 0, 0.2392157, 1,
1.900982, -0.06772843, 2.184222, 1, 0, 0.2352941, 1,
1.905553, 0.7644535, 1.51414, 1, 0, 0.227451, 1,
1.921327, 1.339092, 1.433874, 1, 0, 0.2235294, 1,
1.92549, -2.160313, 1.353891, 1, 0, 0.2156863, 1,
1.937195, 1.076484, 2.038828, 1, 0, 0.2117647, 1,
1.944795, -1.601213, 1.407913, 1, 0, 0.2039216, 1,
1.952416, -0.3731468, 1.252727, 1, 0, 0.1960784, 1,
1.960566, 0.3644547, -0.1683034, 1, 0, 0.1921569, 1,
1.979972, -1.181978, 2.88772, 1, 0, 0.1843137, 1,
2.000657, 1.117475, 1.341623, 1, 0, 0.1803922, 1,
2.004642, 0.1425958, 1.239519, 1, 0, 0.172549, 1,
2.016908, 0.8218413, 1.410791, 1, 0, 0.1686275, 1,
2.022342, 0.256037, 3.34514, 1, 0, 0.1607843, 1,
2.032719, 0.2545699, 2.008579, 1, 0, 0.1568628, 1,
2.05654, 1.367988, 1.203525, 1, 0, 0.1490196, 1,
2.065548, 0.4528143, 0.6166944, 1, 0, 0.145098, 1,
2.079257, 0.4070043, 3.207897, 1, 0, 0.1372549, 1,
2.082121, -0.8632239, 1.726817, 1, 0, 0.1333333, 1,
2.101468, 0.6989229, 1.794469, 1, 0, 0.1254902, 1,
2.105001, -0.1174275, 1.02018, 1, 0, 0.1215686, 1,
2.121521, -0.3660549, 1.274433, 1, 0, 0.1137255, 1,
2.141824, 0.1497738, 3.156979, 1, 0, 0.1098039, 1,
2.155976, -0.3299438, 0.8597588, 1, 0, 0.1019608, 1,
2.158003, 0.7704414, 1.967229, 1, 0, 0.09411765, 1,
2.181485, 1.632479, 1.065944, 1, 0, 0.09019608, 1,
2.203327, -0.2817943, 1.055121, 1, 0, 0.08235294, 1,
2.24123, 0.4437609, 1.357566, 1, 0, 0.07843138, 1,
2.245388, 0.6022662, 0.5166218, 1, 0, 0.07058824, 1,
2.295465, -0.5713791, 1.697093, 1, 0, 0.06666667, 1,
2.32607, -0.3764369, 1.789998, 1, 0, 0.05882353, 1,
2.365136, -0.2426617, 0.637508, 1, 0, 0.05490196, 1,
2.532246, 0.8283841, 0.3958956, 1, 0, 0.04705882, 1,
2.549287, -0.06868313, 1.535454, 1, 0, 0.04313726, 1,
2.596852, -1.820441, 3.005035, 1, 0, 0.03529412, 1,
2.67466, -1.092906, 1.523445, 1, 0, 0.03137255, 1,
2.912904, 0.9399034, 0.7149239, 1, 0, 0.02352941, 1,
3.093468, 0.3142752, 2.739599, 1, 0, 0.01960784, 1,
3.240561, 0.5352176, 3.444313, 1, 0, 0.01176471, 1,
3.781565, 0.907489, 1.581704, 1, 0, 0.007843138, 1
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
0.2659427, -4.102615, -7.500203, 0, -0.5, 0.5, 0.5,
0.2659427, -4.102615, -7.500203, 1, -0.5, 0.5, 0.5,
0.2659427, -4.102615, -7.500203, 1, 1.5, 0.5, 0.5,
0.2659427, -4.102615, -7.500203, 0, 1.5, 0.5, 0.5
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
-4.441476, 0.08842158, -7.500203, 0, -0.5, 0.5, 0.5,
-4.441476, 0.08842158, -7.500203, 1, -0.5, 0.5, 0.5,
-4.441476, 0.08842158, -7.500203, 1, 1.5, 0.5, 0.5,
-4.441476, 0.08842158, -7.500203, 0, 1.5, 0.5, 0.5
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
-4.441476, -4.102615, 0.03109789, 0, -0.5, 0.5, 0.5,
-4.441476, -4.102615, 0.03109789, 1, -0.5, 0.5, 0.5,
-4.441476, -4.102615, 0.03109789, 1, 1.5, 0.5, 0.5,
-4.441476, -4.102615, 0.03109789, 0, 1.5, 0.5, 0.5
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
-2, -3.135453, -5.76221,
2, -3.135453, -5.76221,
-2, -3.135453, -5.76221,
-2, -3.296646, -6.051876,
0, -3.135453, -5.76221,
0, -3.296646, -6.051876,
2, -3.135453, -5.76221,
2, -3.296646, -6.051876
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
-2, -3.619034, -6.631207, 0, -0.5, 0.5, 0.5,
-2, -3.619034, -6.631207, 1, -0.5, 0.5, 0.5,
-2, -3.619034, -6.631207, 1, 1.5, 0.5, 0.5,
-2, -3.619034, -6.631207, 0, 1.5, 0.5, 0.5,
0, -3.619034, -6.631207, 0, -0.5, 0.5, 0.5,
0, -3.619034, -6.631207, 1, -0.5, 0.5, 0.5,
0, -3.619034, -6.631207, 1, 1.5, 0.5, 0.5,
0, -3.619034, -6.631207, 0, 1.5, 0.5, 0.5,
2, -3.619034, -6.631207, 0, -0.5, 0.5, 0.5,
2, -3.619034, -6.631207, 1, -0.5, 0.5, 0.5,
2, -3.619034, -6.631207, 1, 1.5, 0.5, 0.5,
2, -3.619034, -6.631207, 0, 1.5, 0.5, 0.5
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
-3.355149, -3, -5.76221,
-3.355149, 3, -5.76221,
-3.355149, -3, -5.76221,
-3.536203, -3, -6.051876,
-3.355149, -2, -5.76221,
-3.536203, -2, -6.051876,
-3.355149, -1, -5.76221,
-3.536203, -1, -6.051876,
-3.355149, 0, -5.76221,
-3.536203, 0, -6.051876,
-3.355149, 1, -5.76221,
-3.536203, 1, -6.051876,
-3.355149, 2, -5.76221,
-3.536203, 2, -6.051876,
-3.355149, 3, -5.76221,
-3.536203, 3, -6.051876
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
-3.898312, -3, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, -3, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, -3, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, -3, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, -2, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, -2, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, -2, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, -2, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, -1, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, -1, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, -1, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, -1, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, 0, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, 0, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, 0, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, 0, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, 1, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, 1, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, 1, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, 1, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, 2, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, 2, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, 2, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, 2, -6.631207, 0, 1.5, 0.5, 0.5,
-3.898312, 3, -6.631207, 0, -0.5, 0.5, 0.5,
-3.898312, 3, -6.631207, 1, -0.5, 0.5, 0.5,
-3.898312, 3, -6.631207, 1, 1.5, 0.5, 0.5,
-3.898312, 3, -6.631207, 0, 1.5, 0.5, 0.5
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
-3.355149, -3.135453, -4,
-3.355149, -3.135453, 4,
-3.355149, -3.135453, -4,
-3.536203, -3.296646, -4,
-3.355149, -3.135453, -2,
-3.536203, -3.296646, -2,
-3.355149, -3.135453, 0,
-3.536203, -3.296646, 0,
-3.355149, -3.135453, 2,
-3.536203, -3.296646, 2,
-3.355149, -3.135453, 4,
-3.536203, -3.296646, 4
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
-3.898312, -3.619034, -4, 0, -0.5, 0.5, 0.5,
-3.898312, -3.619034, -4, 1, -0.5, 0.5, 0.5,
-3.898312, -3.619034, -4, 1, 1.5, 0.5, 0.5,
-3.898312, -3.619034, -4, 0, 1.5, 0.5, 0.5,
-3.898312, -3.619034, -2, 0, -0.5, 0.5, 0.5,
-3.898312, -3.619034, -2, 1, -0.5, 0.5, 0.5,
-3.898312, -3.619034, -2, 1, 1.5, 0.5, 0.5,
-3.898312, -3.619034, -2, 0, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 0, 0, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 0, 1, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 0, 1, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 0, 0, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 2, 0, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 2, 1, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 2, 1, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 2, 0, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 4, 0, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 4, 1, -0.5, 0.5, 0.5,
-3.898312, -3.619034, 4, 1, 1.5, 0.5, 0.5,
-3.898312, -3.619034, 4, 0, 1.5, 0.5, 0.5
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
-3.355149, -3.135453, -5.76221,
-3.355149, 3.312296, -5.76221,
-3.355149, -3.135453, 5.824406,
-3.355149, 3.312296, 5.824406,
-3.355149, -3.135453, -5.76221,
-3.355149, -3.135453, 5.824406,
-3.355149, 3.312296, -5.76221,
-3.355149, 3.312296, 5.824406,
-3.355149, -3.135453, -5.76221,
3.887034, -3.135453, -5.76221,
-3.355149, -3.135453, 5.824406,
3.887034, -3.135453, 5.824406,
-3.355149, 3.312296, -5.76221,
3.887034, 3.312296, -5.76221,
-3.355149, 3.312296, 5.824406,
3.887034, 3.312296, 5.824406,
3.887034, -3.135453, -5.76221,
3.887034, 3.312296, -5.76221,
3.887034, -3.135453, 5.824406,
3.887034, 3.312296, 5.824406,
3.887034, -3.135453, -5.76221,
3.887034, -3.135453, 5.824406,
3.887034, 3.312296, -5.76221,
3.887034, 3.312296, 5.824406
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
var radius = 8.067744;
var distance = 35.89431;
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
mvMatrix.translate( -0.2659427, -0.08842158, -0.03109789 );
mvMatrix.scale( 1.204471, 1.352876, 0.7528517 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89431);
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


