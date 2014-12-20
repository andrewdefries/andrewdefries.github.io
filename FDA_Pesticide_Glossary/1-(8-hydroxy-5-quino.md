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
-3.226556, 0.7605186, -2.679334, 1, 0, 0, 1,
-2.950781, -2.870763, -2.177209, 1, 0.007843138, 0, 1,
-2.577368, 0.3719544, -1.121221, 1, 0.01176471, 0, 1,
-2.524202, -0.2217005, -0.01396856, 1, 0.01960784, 0, 1,
-2.445053, -0.001225715, -2.286799, 1, 0.02352941, 0, 1,
-2.431122, -0.4003909, -2.823217, 1, 0.03137255, 0, 1,
-2.406502, -0.4987745, -1.549474, 1, 0.03529412, 0, 1,
-2.388889, 1.10882, -1.25923, 1, 0.04313726, 0, 1,
-2.327847, 0.1297282, 0.3833549, 1, 0.04705882, 0, 1,
-2.311522, -0.4241825, -0.144779, 1, 0.05490196, 0, 1,
-2.301841, -0.5466875, -1.683579, 1, 0.05882353, 0, 1,
-2.260573, 0.5698763, -2.395246, 1, 0.06666667, 0, 1,
-2.204052, -2.28368, -1.855887, 1, 0.07058824, 0, 1,
-2.133697, -0.5423328, -3.662656, 1, 0.07843138, 0, 1,
-2.130904, -0.3186859, -0.8191974, 1, 0.08235294, 0, 1,
-2.108466, -1.170536, -0.8245547, 1, 0.09019608, 0, 1,
-2.082227, 0.2724854, -0.9346001, 1, 0.09411765, 0, 1,
-2.06101, 0.03665889, -3.520391, 1, 0.1019608, 0, 1,
-2.047676, -0.8664599, -3.166578, 1, 0.1098039, 0, 1,
-1.983092, -0.01376184, 0.05628173, 1, 0.1137255, 0, 1,
-1.965633, 0.7724781, -1.679803, 1, 0.1215686, 0, 1,
-1.951145, 0.05523734, -1.038026, 1, 0.1254902, 0, 1,
-1.94646, 0.4725015, -0.08676686, 1, 0.1333333, 0, 1,
-1.94626, -0.8008605, -2.249738, 1, 0.1372549, 0, 1,
-1.92784, -0.2403979, -1.80444, 1, 0.145098, 0, 1,
-1.904386, 0.05537581, -2.99764, 1, 0.1490196, 0, 1,
-1.878767, -0.1781747, -2.192882, 1, 0.1568628, 0, 1,
-1.878408, -0.1281963, -0.7735847, 1, 0.1607843, 0, 1,
-1.871213, -0.5117078, -1.170727, 1, 0.1686275, 0, 1,
-1.818388, -0.1396628, -1.274276, 1, 0.172549, 0, 1,
-1.766289, 0.2396622, -0.4171484, 1, 0.1803922, 0, 1,
-1.733074, 0.2854097, -0.3639141, 1, 0.1843137, 0, 1,
-1.725212, -0.1642755, -1.158114, 1, 0.1921569, 0, 1,
-1.716069, 0.8036363, -2.680389, 1, 0.1960784, 0, 1,
-1.701913, 0.6983526, -0.6793449, 1, 0.2039216, 0, 1,
-1.687695, -0.0993641, -0.1655444, 1, 0.2117647, 0, 1,
-1.686781, -0.6663838, -1.062198, 1, 0.2156863, 0, 1,
-1.684716, 1.253581, -2.05174, 1, 0.2235294, 0, 1,
-1.670197, 0.694209, -2.134704, 1, 0.227451, 0, 1,
-1.66759, 0.8082431, -0.367795, 1, 0.2352941, 0, 1,
-1.664761, -0.4633781, -1.501613, 1, 0.2392157, 0, 1,
-1.661764, -0.1390019, -1.911558, 1, 0.2470588, 0, 1,
-1.660012, -0.4457364, -2.44408, 1, 0.2509804, 0, 1,
-1.65661, -1.05941, -2.224002, 1, 0.2588235, 0, 1,
-1.652761, 0.3571728, -2.06152, 1, 0.2627451, 0, 1,
-1.645269, 0.2264184, -1.710139, 1, 0.2705882, 0, 1,
-1.636517, 0.4791852, -1.934765, 1, 0.2745098, 0, 1,
-1.626871, 0.990932, -2.56723, 1, 0.282353, 0, 1,
-1.615546, -0.03757599, -1.920941, 1, 0.2862745, 0, 1,
-1.610823, -0.01081539, -1.144555, 1, 0.2941177, 0, 1,
-1.608371, -1.075879, -1.815015, 1, 0.3019608, 0, 1,
-1.604824, 0.6936042, -0.4778895, 1, 0.3058824, 0, 1,
-1.599411, 0.05092741, -1.611297, 1, 0.3137255, 0, 1,
-1.594236, 1.332033, -0.9753757, 1, 0.3176471, 0, 1,
-1.57445, 0.6031576, -1.021564, 1, 0.3254902, 0, 1,
-1.572699, 0.9870913, 0.9012291, 1, 0.3294118, 0, 1,
-1.569559, 1.059716, 0.8074654, 1, 0.3372549, 0, 1,
-1.548891, 2.126333, -3.063497, 1, 0.3411765, 0, 1,
-1.53289, 0.3697312, -0.8055838, 1, 0.3490196, 0, 1,
-1.520408, -1.097783, -1.170836, 1, 0.3529412, 0, 1,
-1.517893, 0.4826338, -1.226635, 1, 0.3607843, 0, 1,
-1.505578, 1.454218, -0.7180893, 1, 0.3647059, 0, 1,
-1.488466, -0.03835358, -2.68189, 1, 0.372549, 0, 1,
-1.485499, -0.802705, -2.337251, 1, 0.3764706, 0, 1,
-1.478754, -1.557015, -2.827586, 1, 0.3843137, 0, 1,
-1.470395, -0.4536089, -0.9894731, 1, 0.3882353, 0, 1,
-1.467939, 0.6457118, -0.2732678, 1, 0.3960784, 0, 1,
-1.457716, -0.1461904, -1.348334, 1, 0.4039216, 0, 1,
-1.456122, 0.2060629, -2.051064, 1, 0.4078431, 0, 1,
-1.449115, -0.2968329, -2.816095, 1, 0.4156863, 0, 1,
-1.439417, 0.6123688, -0.8756836, 1, 0.4196078, 0, 1,
-1.432875, 0.0315838, -1.639369, 1, 0.427451, 0, 1,
-1.43144, 0.3431658, -1.02948, 1, 0.4313726, 0, 1,
-1.423626, 0.6892676, -0.8803142, 1, 0.4392157, 0, 1,
-1.422641, 1.65732, -1.168968, 1, 0.4431373, 0, 1,
-1.410204, -0.2102156, -3.313065, 1, 0.4509804, 0, 1,
-1.399585, -1.733967, -1.3146, 1, 0.454902, 0, 1,
-1.398445, -1.386655, -2.236528, 1, 0.4627451, 0, 1,
-1.377492, 1.185642, -1.055614, 1, 0.4666667, 0, 1,
-1.377265, -1.175135, -2.105482, 1, 0.4745098, 0, 1,
-1.37686, -1.464247, -1.935529, 1, 0.4784314, 0, 1,
-1.373554, 0.8868003, -1.557476, 1, 0.4862745, 0, 1,
-1.367534, 0.596462, -0.0003684323, 1, 0.4901961, 0, 1,
-1.364856, 0.3990131, -2.303284, 1, 0.4980392, 0, 1,
-1.36444, 0.7439597, -1.991662, 1, 0.5058824, 0, 1,
-1.35898, 0.584958, -0.8328815, 1, 0.509804, 0, 1,
-1.355476, 0.4464543, 1.697908, 1, 0.5176471, 0, 1,
-1.336145, 0.9917257, -1.102638, 1, 0.5215687, 0, 1,
-1.324565, -0.2398012, -2.889945, 1, 0.5294118, 0, 1,
-1.316999, -0.01774094, -1.82277, 1, 0.5333334, 0, 1,
-1.31511, -0.5098392, -1.799396, 1, 0.5411765, 0, 1,
-1.314323, -0.4779222, -1.986376, 1, 0.5450981, 0, 1,
-1.313862, -0.4884592, -1.98389, 1, 0.5529412, 0, 1,
-1.312131, 0.4125138, -0.7701163, 1, 0.5568628, 0, 1,
-1.310182, 0.7490664, -1.419472, 1, 0.5647059, 0, 1,
-1.308427, -0.5403777, -1.34776, 1, 0.5686275, 0, 1,
-1.305639, 0.7485445, -1.554559, 1, 0.5764706, 0, 1,
-1.303541, 0.4326766, -2.387984, 1, 0.5803922, 0, 1,
-1.301243, -2.093517, -2.049159, 1, 0.5882353, 0, 1,
-1.297076, -1.279386, -2.099348, 1, 0.5921569, 0, 1,
-1.291049, 0.3756361, 0.3257741, 1, 0.6, 0, 1,
-1.279812, -0.4268736, -1.59242, 1, 0.6078432, 0, 1,
-1.263789, 1.517137e-05, -0.07141365, 1, 0.6117647, 0, 1,
-1.260025, 0.2648183, -1.80898, 1, 0.6196079, 0, 1,
-1.249738, -0.5384691, -0.7918828, 1, 0.6235294, 0, 1,
-1.245104, 0.33219, -1.461186, 1, 0.6313726, 0, 1,
-1.244773, -0.4311559, -1.460881, 1, 0.6352941, 0, 1,
-1.241789, -0.4454697, -1.502223, 1, 0.6431373, 0, 1,
-1.239322, -0.6054127, -3.678534, 1, 0.6470588, 0, 1,
-1.237767, -0.6961748, -1.42862, 1, 0.654902, 0, 1,
-1.234506, 0.4045947, -3.012207, 1, 0.6588235, 0, 1,
-1.230969, -0.6697803, -2.168342, 1, 0.6666667, 0, 1,
-1.22364, -0.979417, -3.753343, 1, 0.6705883, 0, 1,
-1.217305, 1.840186, 0.108927, 1, 0.6784314, 0, 1,
-1.20189, 0.1550376, -1.204176, 1, 0.682353, 0, 1,
-1.198391, -2.111961, -1.907581, 1, 0.6901961, 0, 1,
-1.191395, 2.607435, 0.8688038, 1, 0.6941177, 0, 1,
-1.190874, -0.2289168, -2.570882, 1, 0.7019608, 0, 1,
-1.185353, -0.5480277, -3.55635, 1, 0.7098039, 0, 1,
-1.176567, 0.749525, -1.079509, 1, 0.7137255, 0, 1,
-1.172145, 1.245953, 0.9068582, 1, 0.7215686, 0, 1,
-1.170508, 1.312032, -1.704413, 1, 0.7254902, 0, 1,
-1.16933, -0.4990171, -1.613284, 1, 0.7333333, 0, 1,
-1.169067, 1.215404, -0.3083652, 1, 0.7372549, 0, 1,
-1.150949, -1.605376, -1.709735, 1, 0.7450981, 0, 1,
-1.149845, 1.373, -1.973218, 1, 0.7490196, 0, 1,
-1.13032, 0.1282832, -1.387268, 1, 0.7568628, 0, 1,
-1.129771, 2.025807, -0.5488648, 1, 0.7607843, 0, 1,
-1.126955, 0.2467145, -1.580519, 1, 0.7686275, 0, 1,
-1.11691, 1.857595, -1.270497, 1, 0.772549, 0, 1,
-1.116195, 1.246086, 0.3835526, 1, 0.7803922, 0, 1,
-1.115846, -1.119149, -1.703278, 1, 0.7843137, 0, 1,
-1.112548, -0.9994885, -1.209646, 1, 0.7921569, 0, 1,
-1.107533, -0.613288, -0.5105174, 1, 0.7960784, 0, 1,
-1.099909, -0.5775403, -2.957105, 1, 0.8039216, 0, 1,
-1.096333, -0.4781533, -3.579475, 1, 0.8117647, 0, 1,
-1.087762, -0.7272393, -0.6774997, 1, 0.8156863, 0, 1,
-1.08269, 2.060778, -0.2765107, 1, 0.8235294, 0, 1,
-1.078778, 0.9271907, -1.443335, 1, 0.827451, 0, 1,
-1.077403, -1.241888, -3.533944, 1, 0.8352941, 0, 1,
-1.064986, -0.4554045, -4.968467, 1, 0.8392157, 0, 1,
-1.064679, -1.560812, -3.770527, 1, 0.8470588, 0, 1,
-1.063798, 1.799039, 1.264865, 1, 0.8509804, 0, 1,
-1.059653, -0.7793135, -3.168223, 1, 0.8588235, 0, 1,
-1.058825, -0.01906709, -2.632446, 1, 0.8627451, 0, 1,
-1.051267, -2.47642, -3.872463, 1, 0.8705882, 0, 1,
-1.05095, 1.794341, -2.669345, 1, 0.8745098, 0, 1,
-1.049288, -0.5641872, -1.81461, 1, 0.8823529, 0, 1,
-1.048974, 0.04269275, -1.034823, 1, 0.8862745, 0, 1,
-1.035348, -1.249538, -3.185262, 1, 0.8941177, 0, 1,
-1.034883, -0.6218797, -0.9564907, 1, 0.8980392, 0, 1,
-1.032748, 1.749601, -0.7861273, 1, 0.9058824, 0, 1,
-1.026327, -0.2498465, -1.588719, 1, 0.9137255, 0, 1,
-1.025831, -0.02225606, -1.284556, 1, 0.9176471, 0, 1,
-1.013308, 0.2457244, -1.708297, 1, 0.9254902, 0, 1,
-1.012521, -2.044768, -3.098583, 1, 0.9294118, 0, 1,
-1.00734, 0.1602976, -1.059016, 1, 0.9372549, 0, 1,
-1.005446, 1.554287, -1.546831, 1, 0.9411765, 0, 1,
-1.004189, -1.164868, -1.153092, 1, 0.9490196, 0, 1,
-1.001868, 0.6659015, -0.9611213, 1, 0.9529412, 0, 1,
-0.9905169, 0.7906255, -0.4115494, 1, 0.9607843, 0, 1,
-0.9857309, 0.3400199, -1.887284, 1, 0.9647059, 0, 1,
-0.9806083, -0.001383039, -0.5868181, 1, 0.972549, 0, 1,
-0.980512, 0.7543604, -1.726194, 1, 0.9764706, 0, 1,
-0.9799643, -0.9070362, -2.811656, 1, 0.9843137, 0, 1,
-0.9758196, 0.04833403, -2.512244, 1, 0.9882353, 0, 1,
-0.9693111, -0.6183954, -3.406511, 1, 0.9960784, 0, 1,
-0.9656784, -1.615947, -3.538971, 0.9960784, 1, 0, 1,
-0.9656411, 0.4233321, -0.3150459, 0.9921569, 1, 0, 1,
-0.9617029, -0.04644305, 0.2047787, 0.9843137, 1, 0, 1,
-0.9588178, 1.418336, 0.03947422, 0.9803922, 1, 0, 1,
-0.9466169, -0.2369824, -1.950497, 0.972549, 1, 0, 1,
-0.9458705, -0.8504221, 0.04551569, 0.9686275, 1, 0, 1,
-0.9401517, 0.00678263, -2.616876, 0.9607843, 1, 0, 1,
-0.9341065, 0.2259402, -0.6062472, 0.9568627, 1, 0, 1,
-0.9314038, -0.1684289, -0.7908177, 0.9490196, 1, 0, 1,
-0.9257188, -0.2157064, -0.4925107, 0.945098, 1, 0, 1,
-0.9221237, 0.4397894, -1.139256, 0.9372549, 1, 0, 1,
-0.9202546, 0.8530958, -0.7631714, 0.9333333, 1, 0, 1,
-0.9163371, -0.06487831, -1.710239, 0.9254902, 1, 0, 1,
-0.9077243, -1.335648, -3.132848, 0.9215686, 1, 0, 1,
-0.9040575, 0.160972, -0.831889, 0.9137255, 1, 0, 1,
-0.9007502, 1.903581, -1.815525, 0.9098039, 1, 0, 1,
-0.9006262, 0.1132512, -0.5560638, 0.9019608, 1, 0, 1,
-0.8962595, 1.882131, 1.835728, 0.8941177, 1, 0, 1,
-0.8918427, 1.217539, 0.05968964, 0.8901961, 1, 0, 1,
-0.8908852, 0.3162733, -1.275198, 0.8823529, 1, 0, 1,
-0.890881, -1.416325, -3.251719, 0.8784314, 1, 0, 1,
-0.8891702, 0.1206837, -0.9816831, 0.8705882, 1, 0, 1,
-0.8791851, -2.03938, -2.219902, 0.8666667, 1, 0, 1,
-0.8706626, 0.5824878, -2.2871, 0.8588235, 1, 0, 1,
-0.8589393, -0.1021851, -1.231658, 0.854902, 1, 0, 1,
-0.8495187, -0.5916979, -2.488502, 0.8470588, 1, 0, 1,
-0.8452991, 0.1192206, -0.7102925, 0.8431373, 1, 0, 1,
-0.843677, 0.5939947, -0.7549574, 0.8352941, 1, 0, 1,
-0.8417647, -2.203695, -2.95237, 0.8313726, 1, 0, 1,
-0.8352301, -1.915028, -1.508453, 0.8235294, 1, 0, 1,
-0.8245112, -0.174904, -3.526986, 0.8196079, 1, 0, 1,
-0.8213907, 0.1221504, -2.16356, 0.8117647, 1, 0, 1,
-0.8106266, 0.7506503, -2.512218, 0.8078431, 1, 0, 1,
-0.8103895, 0.1353627, -0.9433261, 0.8, 1, 0, 1,
-0.8102854, -0.5075712, -2.519294, 0.7921569, 1, 0, 1,
-0.8102679, -0.2335733, -2.232244, 0.7882353, 1, 0, 1,
-0.8090096, 0.6574229, -1.297559, 0.7803922, 1, 0, 1,
-0.8059978, 0.3553979, -1.979998, 0.7764706, 1, 0, 1,
-0.8016822, 0.6141616, 0.3827378, 0.7686275, 1, 0, 1,
-0.8005924, -0.8491461, -1.598655, 0.7647059, 1, 0, 1,
-0.8004264, 0.9248297, -1.985784, 0.7568628, 1, 0, 1,
-0.7977172, -0.5721536, -1.249978, 0.7529412, 1, 0, 1,
-0.7965601, 1.041099, -0.2849803, 0.7450981, 1, 0, 1,
-0.7954891, 0.6572194, -0.5195948, 0.7411765, 1, 0, 1,
-0.7935304, -0.2054614, -0.7333766, 0.7333333, 1, 0, 1,
-0.7929953, -0.4257886, -0.3052031, 0.7294118, 1, 0, 1,
-0.7885242, -1.226262, -1.648236, 0.7215686, 1, 0, 1,
-0.7881073, 0.4841056, -1.716088, 0.7176471, 1, 0, 1,
-0.786154, -0.4352101, -3.25648, 0.7098039, 1, 0, 1,
-0.7855853, -0.7395998, -2.819062, 0.7058824, 1, 0, 1,
-0.784884, -3.013137, -3.030014, 0.6980392, 1, 0, 1,
-0.7834776, 0.04401835, -1.761327, 0.6901961, 1, 0, 1,
-0.7819631, -1.431892, -1.704695, 0.6862745, 1, 0, 1,
-0.7781272, -0.06309081, -0.2354202, 0.6784314, 1, 0, 1,
-0.7774689, -0.1822465, -1.579817, 0.6745098, 1, 0, 1,
-0.7754267, 0.8949348, 2.139422, 0.6666667, 1, 0, 1,
-0.7738573, 0.6735526, -0.8488076, 0.6627451, 1, 0, 1,
-0.770007, -0.2386852, -0.2795335, 0.654902, 1, 0, 1,
-0.768761, 0.3624992, 0.6191037, 0.6509804, 1, 0, 1,
-0.763262, -0.304102, -1.002209, 0.6431373, 1, 0, 1,
-0.7628209, 1.040825, -0.7524606, 0.6392157, 1, 0, 1,
-0.7628166, 0.8892767, -3.775477, 0.6313726, 1, 0, 1,
-0.7623642, 1.475693, 1.076939, 0.627451, 1, 0, 1,
-0.7602267, 1.531105, -0.1013687, 0.6196079, 1, 0, 1,
-0.7597432, -0.843737, -3.51074, 0.6156863, 1, 0, 1,
-0.7596132, 1.14229, -1.508685, 0.6078432, 1, 0, 1,
-0.7578676, -0.1152437, -0.8883213, 0.6039216, 1, 0, 1,
-0.7550187, 0.2041511, -0.2259335, 0.5960785, 1, 0, 1,
-0.7432108, -2.389923, -2.551652, 0.5882353, 1, 0, 1,
-0.740951, -0.8088899, -2.807594, 0.5843138, 1, 0, 1,
-0.7408776, 0.1189884, -0.9357648, 0.5764706, 1, 0, 1,
-0.7339125, 1.827364, 0.969148, 0.572549, 1, 0, 1,
-0.7317765, -2.596003, -4.558784, 0.5647059, 1, 0, 1,
-0.721666, 1.741279, -1.781028, 0.5607843, 1, 0, 1,
-0.7210328, -0.7614632, -2.127555, 0.5529412, 1, 0, 1,
-0.7197256, 0.161546, -3.91514, 0.5490196, 1, 0, 1,
-0.7185575, 0.7026001, -0.5939904, 0.5411765, 1, 0, 1,
-0.7093113, -1.205471, -3.393034, 0.5372549, 1, 0, 1,
-0.7084768, 1.441562, -1.339859, 0.5294118, 1, 0, 1,
-0.7077106, -0.1864602, -1.16681, 0.5254902, 1, 0, 1,
-0.7072672, 0.6242829, -3.326521, 0.5176471, 1, 0, 1,
-0.7006307, 1.248843, -0.2518322, 0.5137255, 1, 0, 1,
-0.6953781, -0.3764319, -1.504427, 0.5058824, 1, 0, 1,
-0.6933419, 0.04804962, -2.71402, 0.5019608, 1, 0, 1,
-0.6928557, 0.4625062, -1.280055, 0.4941176, 1, 0, 1,
-0.6866736, 1.376707, 0.436494, 0.4862745, 1, 0, 1,
-0.6782562, 1.067452, -1.176451, 0.4823529, 1, 0, 1,
-0.677027, -1.176473, -2.123012, 0.4745098, 1, 0, 1,
-0.6767369, 0.8875179, -1.198075, 0.4705882, 1, 0, 1,
-0.6731223, -1.309184, -3.541069, 0.4627451, 1, 0, 1,
-0.6729223, 1.538321, -1.282879, 0.4588235, 1, 0, 1,
-0.6693553, 0.1233254, -2.136009, 0.4509804, 1, 0, 1,
-0.6665398, -0.1442228, -1.385615, 0.4470588, 1, 0, 1,
-0.6663463, -0.9205437, -4.117851, 0.4392157, 1, 0, 1,
-0.6639935, 0.5381793, -0.3942001, 0.4352941, 1, 0, 1,
-0.6632433, -1.213835, -1.742851, 0.427451, 1, 0, 1,
-0.6628034, 0.441278, -1.958843, 0.4235294, 1, 0, 1,
-0.6593311, -0.06776447, -1.930751, 0.4156863, 1, 0, 1,
-0.6511669, 1.268258, 0.4557293, 0.4117647, 1, 0, 1,
-0.650498, 0.05277913, -1.642078, 0.4039216, 1, 0, 1,
-0.6503626, 0.698921, -1.021347, 0.3960784, 1, 0, 1,
-0.6363059, 0.6122498, 1.323444, 0.3921569, 1, 0, 1,
-0.6353972, 0.701379, -1.204336, 0.3843137, 1, 0, 1,
-0.6304242, -0.5416076, -1.974626, 0.3803922, 1, 0, 1,
-0.628619, -0.4157575, -2.722, 0.372549, 1, 0, 1,
-0.6194164, -0.6021557, -2.37402, 0.3686275, 1, 0, 1,
-0.6155407, -1.912477, -4.062355, 0.3607843, 1, 0, 1,
-0.6143682, 0.4170032, -0.7343357, 0.3568628, 1, 0, 1,
-0.5981887, -2.060187, -1.238577, 0.3490196, 1, 0, 1,
-0.5902485, 0.6507895, -1.502317, 0.345098, 1, 0, 1,
-0.5889726, 0.6358696, -0.9375101, 0.3372549, 1, 0, 1,
-0.5885412, -0.1403362, -2.258121, 0.3333333, 1, 0, 1,
-0.5873262, -0.3472691, -0.8985104, 0.3254902, 1, 0, 1,
-0.5866976, -0.2498215, -0.8992238, 0.3215686, 1, 0, 1,
-0.5864577, 2.385916, -1.916239, 0.3137255, 1, 0, 1,
-0.5826426, -0.3426088, -1.914208, 0.3098039, 1, 0, 1,
-0.5684298, -1.397324, -2.655201, 0.3019608, 1, 0, 1,
-0.5655526, 0.9443997, 0.5499344, 0.2941177, 1, 0, 1,
-0.5613496, -1.12379, -2.329457, 0.2901961, 1, 0, 1,
-0.5583872, 0.001393979, -1.302114, 0.282353, 1, 0, 1,
-0.5567901, 0.8966448, -2.153951, 0.2784314, 1, 0, 1,
-0.555369, -0.9854054, -2.843828, 0.2705882, 1, 0, 1,
-0.5539171, -0.6072066, -1.360728, 0.2666667, 1, 0, 1,
-0.5478999, 1.366201, -0.2976366, 0.2588235, 1, 0, 1,
-0.5459411, -1.758749, -2.322446, 0.254902, 1, 0, 1,
-0.5449353, 1.2712, -0.9981698, 0.2470588, 1, 0, 1,
-0.5429133, -2.307455, -2.876104, 0.2431373, 1, 0, 1,
-0.5409371, 0.07013664, -3.194338, 0.2352941, 1, 0, 1,
-0.5377065, 0.2473058, -2.877525, 0.2313726, 1, 0, 1,
-0.5310836, 0.1851092, -0.6860556, 0.2235294, 1, 0, 1,
-0.5278952, -1.023626, -4.979618, 0.2196078, 1, 0, 1,
-0.5266925, 0.2845529, -0.6633869, 0.2117647, 1, 0, 1,
-0.524047, 0.4087466, -1.447733, 0.2078431, 1, 0, 1,
-0.5228625, 0.4436041, -1.590199, 0.2, 1, 0, 1,
-0.5208279, -0.3481241, -2.493815, 0.1921569, 1, 0, 1,
-0.519285, 0.04066423, -2.041898, 0.1882353, 1, 0, 1,
-0.5190849, 1.696579, -0.1716887, 0.1803922, 1, 0, 1,
-0.5183806, 0.4407018, -1.484212, 0.1764706, 1, 0, 1,
-0.5149709, -0.5390518, -3.883307, 0.1686275, 1, 0, 1,
-0.5140503, -1.332905, -2.577734, 0.1647059, 1, 0, 1,
-0.5133923, 0.8111482, -1.084782, 0.1568628, 1, 0, 1,
-0.5132779, 1.167901, -0.9740895, 0.1529412, 1, 0, 1,
-0.5123436, -0.8576628, -3.632068, 0.145098, 1, 0, 1,
-0.5097844, -0.05402404, -1.123438, 0.1411765, 1, 0, 1,
-0.5016189, 2.145632, -0.1558468, 0.1333333, 1, 0, 1,
-0.4974975, -0.7434476, -2.938161, 0.1294118, 1, 0, 1,
-0.4958837, -0.288334, -1.343144, 0.1215686, 1, 0, 1,
-0.4956414, 1.339622, 0.4195412, 0.1176471, 1, 0, 1,
-0.4931757, -0.1460726, -3.712738, 0.1098039, 1, 0, 1,
-0.4902107, 0.755468, -2.516875, 0.1058824, 1, 0, 1,
-0.4889839, 0.9087294, -0.7627769, 0.09803922, 1, 0, 1,
-0.4810757, 1.414373, -0.370017, 0.09019608, 1, 0, 1,
-0.4806432, -1.585736, -3.925988, 0.08627451, 1, 0, 1,
-0.479509, -0.4275783, -2.588548, 0.07843138, 1, 0, 1,
-0.4740748, -0.7744101, -2.400716, 0.07450981, 1, 0, 1,
-0.4736362, -1.064868, -3.477864, 0.06666667, 1, 0, 1,
-0.47338, 1.63117, -1.183442, 0.0627451, 1, 0, 1,
-0.4698496, 0.9006768, -0.3811778, 0.05490196, 1, 0, 1,
-0.4684593, 0.2368123, -1.582225, 0.05098039, 1, 0, 1,
-0.4656944, 0.1771299, -1.278831, 0.04313726, 1, 0, 1,
-0.4655209, 0.7425058, -0.734283, 0.03921569, 1, 0, 1,
-0.4636346, 0.9938605, -0.3632167, 0.03137255, 1, 0, 1,
-0.4614521, 0.2209877, 0.04521401, 0.02745098, 1, 0, 1,
-0.4602303, 0.1110869, -1.590834, 0.01960784, 1, 0, 1,
-0.4459441, -0.9490817, -2.284077, 0.01568628, 1, 0, 1,
-0.4391646, -0.1312831, -0.4729221, 0.007843138, 1, 0, 1,
-0.4364451, 0.3388878, -2.200485, 0.003921569, 1, 0, 1,
-0.4357263, 1.305507, -1.029768, 0, 1, 0.003921569, 1,
-0.4353305, -0.05965684, -0.3134786, 0, 1, 0.01176471, 1,
-0.432828, -1.151071, -3.218912, 0, 1, 0.01568628, 1,
-0.4298289, 0.9837054, -0.240443, 0, 1, 0.02352941, 1,
-0.4278561, -1.279538, -2.255645, 0, 1, 0.02745098, 1,
-0.4264295, -0.9274102, -2.098326, 0, 1, 0.03529412, 1,
-0.4238454, -2.275285, -4.219576, 0, 1, 0.03921569, 1,
-0.4231949, -0.2732042, -0.8981066, 0, 1, 0.04705882, 1,
-0.4226838, 0.6456971, -2.845117, 0, 1, 0.05098039, 1,
-0.4144522, 1.392813, 1.222317, 0, 1, 0.05882353, 1,
-0.4046791, 0.2537915, -1.394015, 0, 1, 0.0627451, 1,
-0.404111, -0.675509, -2.323216, 0, 1, 0.07058824, 1,
-0.4029889, 1.159535, 0.004974579, 0, 1, 0.07450981, 1,
-0.4028801, 0.01874649, -2.325939, 0, 1, 0.08235294, 1,
-0.401055, -1.37867, -1.971575, 0, 1, 0.08627451, 1,
-0.4001406, -0.2076624, -1.901692, 0, 1, 0.09411765, 1,
-0.3966093, 0.8161319, 0.3250778, 0, 1, 0.1019608, 1,
-0.3952687, 1.832712, -1.064815, 0, 1, 0.1058824, 1,
-0.3944831, -0.9478784, -2.806269, 0, 1, 0.1137255, 1,
-0.3941167, -0.4548356, -2.831307, 0, 1, 0.1176471, 1,
-0.3866815, -0.6014686, -2.61573, 0, 1, 0.1254902, 1,
-0.3833948, 0.4308828, -0.2116513, 0, 1, 0.1294118, 1,
-0.3814191, 0.4042453, -1.292166, 0, 1, 0.1372549, 1,
-0.3792113, 0.6286691, -0.3068168, 0, 1, 0.1411765, 1,
-0.3768668, -1.05408, -3.239905, 0, 1, 0.1490196, 1,
-0.3740755, -1.325196, -2.498992, 0, 1, 0.1529412, 1,
-0.3726697, 0.3308578, -0.2069458, 0, 1, 0.1607843, 1,
-0.3681868, -0.6076643, -2.233643, 0, 1, 0.1647059, 1,
-0.3663778, 0.4892209, -0.8906323, 0, 1, 0.172549, 1,
-0.3661734, -1.886521, -3.066978, 0, 1, 0.1764706, 1,
-0.3650446, -0.2056129, -2.913774, 0, 1, 0.1843137, 1,
-0.357734, 1.619856, 0.6069673, 0, 1, 0.1882353, 1,
-0.3540084, 0.4216315, -2.769925, 0, 1, 0.1960784, 1,
-0.3508047, 0.8365562, 0.6078401, 0, 1, 0.2039216, 1,
-0.3487538, 0.2048663, -1.078312, 0, 1, 0.2078431, 1,
-0.3368027, 0.2464637, -1.268217, 0, 1, 0.2156863, 1,
-0.3340064, 1.095928, 1.550807, 0, 1, 0.2196078, 1,
-0.3321663, 1.174004, 2.021353, 0, 1, 0.227451, 1,
-0.3266359, -0.6047245, -3.817182, 0, 1, 0.2313726, 1,
-0.3254136, -2.655108, -2.606291, 0, 1, 0.2392157, 1,
-0.3253826, -0.1182457, -0.6992996, 0, 1, 0.2431373, 1,
-0.3235376, -0.8273556, -3.016632, 0, 1, 0.2509804, 1,
-0.3235142, 1.012339, -0.6180133, 0, 1, 0.254902, 1,
-0.3218894, -0.7828447, -2.436693, 0, 1, 0.2627451, 1,
-0.3202514, 1.095811, 1.132619, 0, 1, 0.2666667, 1,
-0.3168774, 0.2472542, -0.4888398, 0, 1, 0.2745098, 1,
-0.3168073, -0.9319172, -2.983462, 0, 1, 0.2784314, 1,
-0.3160783, -1.176984, -3.932077, 0, 1, 0.2862745, 1,
-0.3115845, 1.22745, -1.344827, 0, 1, 0.2901961, 1,
-0.3110992, -1.155759, -1.092031, 0, 1, 0.2980392, 1,
-0.3057027, 0.1778482, -3.707581, 0, 1, 0.3058824, 1,
-0.3051982, -1.585098, -3.904909, 0, 1, 0.3098039, 1,
-0.2989424, 0.3879275, 0.1674208, 0, 1, 0.3176471, 1,
-0.2919904, -0.3714525, -3.925092, 0, 1, 0.3215686, 1,
-0.2702758, -1.055455, -3.363008, 0, 1, 0.3294118, 1,
-0.2633686, 0.06695371, 0.4182302, 0, 1, 0.3333333, 1,
-0.2620211, 0.6523359, -0.6993147, 0, 1, 0.3411765, 1,
-0.2558397, -1.148897, -2.496015, 0, 1, 0.345098, 1,
-0.2505464, 1.102109, -1.062197, 0, 1, 0.3529412, 1,
-0.2487606, -1.861956, -3.05677, 0, 1, 0.3568628, 1,
-0.2483327, -1.557451, -5.057155, 0, 1, 0.3647059, 1,
-0.2367386, -0.1579864, -2.041357, 0, 1, 0.3686275, 1,
-0.2336775, -0.6305622, -2.198801, 0, 1, 0.3764706, 1,
-0.2330493, -1.385179, -4.242535, 0, 1, 0.3803922, 1,
-0.2309847, -0.3941566, -1.235233, 0, 1, 0.3882353, 1,
-0.230656, -0.7256238, -1.789991, 0, 1, 0.3921569, 1,
-0.2293894, 1.055943, 0.02937518, 0, 1, 0.4, 1,
-0.2267701, -0.6881154, -3.910519, 0, 1, 0.4078431, 1,
-0.2263218, -0.386859, -1.681616, 0, 1, 0.4117647, 1,
-0.2093711, -0.4693089, -1.942218, 0, 1, 0.4196078, 1,
-0.2091043, 0.3329169, -0.2641893, 0, 1, 0.4235294, 1,
-0.1980119, -0.2094018, -2.053308, 0, 1, 0.4313726, 1,
-0.1973397, 0.9741663, -0.6486402, 0, 1, 0.4352941, 1,
-0.1963296, 0.01032361, 0.3247445, 0, 1, 0.4431373, 1,
-0.1960856, -0.7894748, -3.482447, 0, 1, 0.4470588, 1,
-0.1929767, 0.3863539, -1.565094, 0, 1, 0.454902, 1,
-0.1884516, 1.811413, 1.275867, 0, 1, 0.4588235, 1,
-0.1867654, 1.266577, -1.928349, 0, 1, 0.4666667, 1,
-0.1838456, -1.292848, -0.2275372, 0, 1, 0.4705882, 1,
-0.1832416, 0.5479776, -0.6349636, 0, 1, 0.4784314, 1,
-0.1802019, 0.9089198, 0.657487, 0, 1, 0.4823529, 1,
-0.176679, -1.390021, -3.380964, 0, 1, 0.4901961, 1,
-0.1750013, -1.304116, -2.635954, 0, 1, 0.4941176, 1,
-0.1730837, -1.350785, -3.212012, 0, 1, 0.5019608, 1,
-0.1721468, -0.8903368, -2.752408, 0, 1, 0.509804, 1,
-0.1699567, 0.1049032, -0.3758391, 0, 1, 0.5137255, 1,
-0.1690692, -1.531828, -2.811848, 0, 1, 0.5215687, 1,
-0.1673062, 0.4726601, 0.1251375, 0, 1, 0.5254902, 1,
-0.1672601, 1.730203, -0.5974225, 0, 1, 0.5333334, 1,
-0.1653554, -2.786711, -2.909372, 0, 1, 0.5372549, 1,
-0.1630342, -0.4675345, -0.7577392, 0, 1, 0.5450981, 1,
-0.1614297, -0.8051605, -3.827695, 0, 1, 0.5490196, 1,
-0.157841, -0.2795773, -2.581828, 0, 1, 0.5568628, 1,
-0.1550887, -0.7733069, -3.87268, 0, 1, 0.5607843, 1,
-0.1519421, 0.9103926, -0.783176, 0, 1, 0.5686275, 1,
-0.1505861, 0.8699145, 0.589718, 0, 1, 0.572549, 1,
-0.1505191, -1.675085, -3.778113, 0, 1, 0.5803922, 1,
-0.1482973, -2.197196, -3.023108, 0, 1, 0.5843138, 1,
-0.1346884, 0.1030778, 0.3459615, 0, 1, 0.5921569, 1,
-0.1325245, 0.1024434, 0.01160555, 0, 1, 0.5960785, 1,
-0.1320393, 0.6266595, 0.8604388, 0, 1, 0.6039216, 1,
-0.130714, 0.7632014, -1.82248, 0, 1, 0.6117647, 1,
-0.1191984, -0.6589435, -2.832663, 0, 1, 0.6156863, 1,
-0.1187134, 0.3165852, 0.2427552, 0, 1, 0.6235294, 1,
-0.1152585, 1.521277, -1.530388, 0, 1, 0.627451, 1,
-0.1134263, -3.06834, -2.782758, 0, 1, 0.6352941, 1,
-0.1128654, 0.03430936, -1.851411, 0, 1, 0.6392157, 1,
-0.1108455, -1.190235, -2.60463, 0, 1, 0.6470588, 1,
-0.1099455, -1.68741, -5.681108, 0, 1, 0.6509804, 1,
-0.1069013, 1.707446, -1.040041, 0, 1, 0.6588235, 1,
-0.1050642, 0.4039958, 1.131822, 0, 1, 0.6627451, 1,
-0.101969, 0.520075, 1.494853, 0, 1, 0.6705883, 1,
-0.09719035, -1.165515, -2.520112, 0, 1, 0.6745098, 1,
-0.09533095, -1.170381, -2.283695, 0, 1, 0.682353, 1,
-0.09046471, -0.9098792, -1.079314, 0, 1, 0.6862745, 1,
-0.08803274, 0.5990406, 0.5644302, 0, 1, 0.6941177, 1,
-0.08679561, 0.8436421, 1.432045, 0, 1, 0.7019608, 1,
-0.08295728, 0.5675487, -2.187903, 0, 1, 0.7058824, 1,
-0.08261109, 1.349612, -0.4758445, 0, 1, 0.7137255, 1,
-0.07804251, -1.055613, -3.928694, 0, 1, 0.7176471, 1,
-0.07476826, 1.266902, 0.3286743, 0, 1, 0.7254902, 1,
-0.0745584, 0.8299201, -0.4148467, 0, 1, 0.7294118, 1,
-0.07066453, 0.2092312, -0.1981357, 0, 1, 0.7372549, 1,
-0.06916714, -0.1105718, -4.796044, 0, 1, 0.7411765, 1,
-0.06659789, -1.822987, -4.11666, 0, 1, 0.7490196, 1,
-0.06539349, -0.4377617, -1.441295, 0, 1, 0.7529412, 1,
-0.06446121, 0.2224114, -0.2742567, 0, 1, 0.7607843, 1,
-0.06014125, -0.6753299, -3.251868, 0, 1, 0.7647059, 1,
-0.05369886, 0.3543338, -0.3433941, 0, 1, 0.772549, 1,
-0.05326523, -1.196078, -2.112747, 0, 1, 0.7764706, 1,
-0.04582776, -0.7466481, -2.586564, 0, 1, 0.7843137, 1,
-0.0369463, 0.9885436, 1.062449, 0, 1, 0.7882353, 1,
-0.03121357, 1.249416, 1.244153, 0, 1, 0.7960784, 1,
-0.03051675, -0.0773474, -2.779022, 0, 1, 0.8039216, 1,
-0.02968899, -0.533396, -1.833705, 0, 1, 0.8078431, 1,
-0.02715941, 1.001359, -1.662766, 0, 1, 0.8156863, 1,
-0.02605947, -1.376764, -3.371661, 0, 1, 0.8196079, 1,
-0.02165352, 0.2471005, -0.2320102, 0, 1, 0.827451, 1,
-0.01583613, 0.2306262, 0.03553281, 0, 1, 0.8313726, 1,
-0.01389855, -0.4628552, -5.17398, 0, 1, 0.8392157, 1,
-0.01231146, 0.6605013, 1.21279, 0, 1, 0.8431373, 1,
-0.01053801, -1.035927, -3.007786, 0, 1, 0.8509804, 1,
-0.007113893, 0.5885046, -0.09739378, 0, 1, 0.854902, 1,
-0.006658226, -0.4138484, -2.482287, 0, 1, 0.8627451, 1,
-0.004721049, -0.9809366, -1.983656, 0, 1, 0.8666667, 1,
-0.004128736, 1.963933, -0.3715014, 0, 1, 0.8745098, 1,
-0.0004422275, -0.3403987, -2.745639, 0, 1, 0.8784314, 1,
0.002147089, -0.6420965, 3.755376, 0, 1, 0.8862745, 1,
0.00445632, 0.01738325, -0.7308713, 0, 1, 0.8901961, 1,
0.00560319, -1.210194, 3.427487, 0, 1, 0.8980392, 1,
0.00590619, 0.5874543, -0.9907328, 0, 1, 0.9058824, 1,
0.006908666, 0.2657581, -0.4055074, 0, 1, 0.9098039, 1,
0.007998532, -0.8952348, 2.065366, 0, 1, 0.9176471, 1,
0.008399909, -0.5589867, 2.472293, 0, 1, 0.9215686, 1,
0.00995631, 0.2889415, 1.151878, 0, 1, 0.9294118, 1,
0.01298177, -1.034941, 4.368089, 0, 1, 0.9333333, 1,
0.01455239, 0.03831054, 1.937265, 0, 1, 0.9411765, 1,
0.01474842, -0.4187454, 2.808554, 0, 1, 0.945098, 1,
0.01495955, 1.643024, -0.9749124, 0, 1, 0.9529412, 1,
0.01565938, -0.4054313, 2.51797, 0, 1, 0.9568627, 1,
0.01598646, 1.445838, 0.7245767, 0, 1, 0.9647059, 1,
0.02158455, -1.852965, 5.951209, 0, 1, 0.9686275, 1,
0.0224217, -0.7027057, 4.334859, 0, 1, 0.9764706, 1,
0.02390525, 1.417122, -0.9239564, 0, 1, 0.9803922, 1,
0.02575846, -0.1817677, 3.693338, 0, 1, 0.9882353, 1,
0.02598336, -0.1263023, 2.687213, 0, 1, 0.9921569, 1,
0.03787494, 0.1458856, -1.068754, 0, 1, 1, 1,
0.03832717, 1.756506, 0.7895329, 0, 0.9921569, 1, 1,
0.03869877, -0.6626031, 3.432559, 0, 0.9882353, 1, 1,
0.0397437, 0.2836299, 0.8754782, 0, 0.9803922, 1, 1,
0.04048776, -0.7073402, 3.352451, 0, 0.9764706, 1, 1,
0.04051573, -0.9670234, 4.038948, 0, 0.9686275, 1, 1,
0.04217279, -0.8397735, 4.129697, 0, 0.9647059, 1, 1,
0.04230491, 0.4821775, 0.6061733, 0, 0.9568627, 1, 1,
0.04256097, 0.187327, 0.2537504, 0, 0.9529412, 1, 1,
0.04268548, -0.3939107, 1.863699, 0, 0.945098, 1, 1,
0.04517579, 0.4179761, 1.184086, 0, 0.9411765, 1, 1,
0.0498751, 0.08492185, -0.2699283, 0, 0.9333333, 1, 1,
0.05183204, 1.430269, -1.228486, 0, 0.9294118, 1, 1,
0.05348854, 0.4549769, 1.277822, 0, 0.9215686, 1, 1,
0.05646079, -0.6348177, 2.522166, 0, 0.9176471, 1, 1,
0.05830736, 0.06244668, -0.5808744, 0, 0.9098039, 1, 1,
0.06077883, -0.5292523, 1.807848, 0, 0.9058824, 1, 1,
0.06085242, -0.250374, 2.752231, 0, 0.8980392, 1, 1,
0.06094092, -1.56898, 3.548792, 0, 0.8901961, 1, 1,
0.06187928, 0.3053257, -1.492694, 0, 0.8862745, 1, 1,
0.06351086, 0.5566396, -1.007224, 0, 0.8784314, 1, 1,
0.06627519, -0.2408214, 3.469512, 0, 0.8745098, 1, 1,
0.06660274, -1.723597, 3.593311, 0, 0.8666667, 1, 1,
0.06918522, 1.199993, -0.1077556, 0, 0.8627451, 1, 1,
0.07000451, -0.415954, 1.017274, 0, 0.854902, 1, 1,
0.07091454, 1.192149, 0.6314908, 0, 0.8509804, 1, 1,
0.07139407, 0.05093891, 0.8660721, 0, 0.8431373, 1, 1,
0.07376423, 0.06781084, -0.1229694, 0, 0.8392157, 1, 1,
0.07492647, -0.8534873, 3.274004, 0, 0.8313726, 1, 1,
0.07903746, -0.2330865, 3.383318, 0, 0.827451, 1, 1,
0.08134981, -1.449293, 3.182348, 0, 0.8196079, 1, 1,
0.08722869, -0.2566002, 2.730116, 0, 0.8156863, 1, 1,
0.09869218, 0.3940419, 0.0903081, 0, 0.8078431, 1, 1,
0.09965918, -0.4043012, 2.911903, 0, 0.8039216, 1, 1,
0.1004325, -0.1246871, 2.270497, 0, 0.7960784, 1, 1,
0.1005831, 0.3007457, -0.07920676, 0, 0.7882353, 1, 1,
0.1051288, -1.474943, 3.338267, 0, 0.7843137, 1, 1,
0.1076442, 0.6457883, 1.621831, 0, 0.7764706, 1, 1,
0.1088373, -1.018426, 4.491534, 0, 0.772549, 1, 1,
0.1110557, -0.6764332, 3.721108, 0, 0.7647059, 1, 1,
0.1147242, 0.06253532, 1.299899, 0, 0.7607843, 1, 1,
0.1191465, -1.375323, 3.814017, 0, 0.7529412, 1, 1,
0.1194585, -0.8278399, 1.345819, 0, 0.7490196, 1, 1,
0.1230465, 1.602691, 1.946964, 0, 0.7411765, 1, 1,
0.1235696, 0.2295722, 1.986018, 0, 0.7372549, 1, 1,
0.128098, -0.9364457, 3.643977, 0, 0.7294118, 1, 1,
0.1299135, -1.447064, 1.43017, 0, 0.7254902, 1, 1,
0.1299921, 0.5010169, -0.7376362, 0, 0.7176471, 1, 1,
0.1334947, 0.8868054, 0.2453134, 0, 0.7137255, 1, 1,
0.1348822, 0.008104197, 0.9490007, 0, 0.7058824, 1, 1,
0.136559, -0.1765451, 1.990741, 0, 0.6980392, 1, 1,
0.1371756, 1.62874, 1.00912, 0, 0.6941177, 1, 1,
0.1389852, 1.815817, 0.05020631, 0, 0.6862745, 1, 1,
0.1390928, 0.6240863, 0.5577886, 0, 0.682353, 1, 1,
0.1406813, -0.2036998, 1.831668, 0, 0.6745098, 1, 1,
0.1429888, -1.974679, 1.809302, 0, 0.6705883, 1, 1,
0.1451064, 1.203283, 0.6507701, 0, 0.6627451, 1, 1,
0.1458234, 2.180137, 0.09036209, 0, 0.6588235, 1, 1,
0.1535361, 0.2370764, 0.04355467, 0, 0.6509804, 1, 1,
0.1549816, -0.08594033, 1.57939, 0, 0.6470588, 1, 1,
0.1563461, -1.512928, 2.243583, 0, 0.6392157, 1, 1,
0.1600541, 0.3712684, 1.434392, 0, 0.6352941, 1, 1,
0.1645207, -0.6859629, 2.451236, 0, 0.627451, 1, 1,
0.1654165, 0.5322626, 1.024681, 0, 0.6235294, 1, 1,
0.166283, 0.3492955, -0.4894261, 0, 0.6156863, 1, 1,
0.1671429, 0.344047, 0.8944917, 0, 0.6117647, 1, 1,
0.1753886, -0.0307462, 1.556669, 0, 0.6039216, 1, 1,
0.176222, 1.587118, 1.072083, 0, 0.5960785, 1, 1,
0.1785276, -2.430465, 3.794373, 0, 0.5921569, 1, 1,
0.1790038, 0.146155, 1.473206, 0, 0.5843138, 1, 1,
0.1801968, -1.384581, 2.977553, 0, 0.5803922, 1, 1,
0.1818011, -0.5706229, 4.073003, 0, 0.572549, 1, 1,
0.182614, 0.8739923, -0.2066989, 0, 0.5686275, 1, 1,
0.1869031, -0.6794026, 1.983728, 0, 0.5607843, 1, 1,
0.1893167, 1.806731, -0.02657111, 0, 0.5568628, 1, 1,
0.1905687, -0.2137332, 2.934446, 0, 0.5490196, 1, 1,
0.1911139, 0.9011062, 0.9677057, 0, 0.5450981, 1, 1,
0.1925929, 0.277301, 0.6809039, 0, 0.5372549, 1, 1,
0.1975478, 1.020595, -0.94779, 0, 0.5333334, 1, 1,
0.1992213, -0.6773465, 1.856796, 0, 0.5254902, 1, 1,
0.2004396, 0.3323076, 1.788038, 0, 0.5215687, 1, 1,
0.2043581, 1.714522, 1.604166, 0, 0.5137255, 1, 1,
0.2120345, 0.622258, 3.988312, 0, 0.509804, 1, 1,
0.2176829, 0.53848, 0.445711, 0, 0.5019608, 1, 1,
0.2183912, -1.244569, 3.239452, 0, 0.4941176, 1, 1,
0.2283923, 0.03746325, 0.4004765, 0, 0.4901961, 1, 1,
0.2342556, -1.247942, 2.894201, 0, 0.4823529, 1, 1,
0.2352314, 0.1848666, 1.814972, 0, 0.4784314, 1, 1,
0.2357199, 0.1574353, 0.4056369, 0, 0.4705882, 1, 1,
0.2357769, 0.02106491, 2.431835, 0, 0.4666667, 1, 1,
0.2377626, 2.897081, -0.627911, 0, 0.4588235, 1, 1,
0.2396599, -0.8709399, 2.241419, 0, 0.454902, 1, 1,
0.2457395, 1.221064, -2.055077, 0, 0.4470588, 1, 1,
0.2479762, -1.402845, 3.377696, 0, 0.4431373, 1, 1,
0.2540728, 0.575764, 1.611755, 0, 0.4352941, 1, 1,
0.2543226, -0.03010491, 1.034407, 0, 0.4313726, 1, 1,
0.2554268, -0.2532688, 0.7892362, 0, 0.4235294, 1, 1,
0.2555656, -1.05392, 1.258974, 0, 0.4196078, 1, 1,
0.2566693, -0.3400555, 4.343746, 0, 0.4117647, 1, 1,
0.2590492, 0.2672178, 1.234234, 0, 0.4078431, 1, 1,
0.2624046, 0.4327852, 1.191639, 0, 0.4, 1, 1,
0.2641802, -0.3558995, 2.995551, 0, 0.3921569, 1, 1,
0.2708863, 1.306778, 0.4890592, 0, 0.3882353, 1, 1,
0.2734003, -1.064595, 2.530246, 0, 0.3803922, 1, 1,
0.2735825, -0.9027055, 3.00963, 0, 0.3764706, 1, 1,
0.2744248, -1.291356, 1.498508, 0, 0.3686275, 1, 1,
0.2755403, -1.521906, 3.598634, 0, 0.3647059, 1, 1,
0.2761696, -0.5259706, 4.120633, 0, 0.3568628, 1, 1,
0.2785901, 1.369308, 1.047301, 0, 0.3529412, 1, 1,
0.2795381, 0.1406866, 2.41155, 0, 0.345098, 1, 1,
0.2844097, 1.83093, -0.3214726, 0, 0.3411765, 1, 1,
0.2886596, 0.2070449, 1.688489, 0, 0.3333333, 1, 1,
0.2894162, 0.610899, 0.9796405, 0, 0.3294118, 1, 1,
0.2913413, 1.152889, -1.411732, 0, 0.3215686, 1, 1,
0.2946407, -0.6904973, 1.130248, 0, 0.3176471, 1, 1,
0.3014663, 1.104212, 0.3787418, 0, 0.3098039, 1, 1,
0.30457, -1.352196, 2.907236, 0, 0.3058824, 1, 1,
0.3051374, 0.7488522, 0.2877544, 0, 0.2980392, 1, 1,
0.3072083, 0.07930847, 0.208765, 0, 0.2901961, 1, 1,
0.3099084, -0.4954304, 2.73938, 0, 0.2862745, 1, 1,
0.3121838, -0.3328859, 3.498008, 0, 0.2784314, 1, 1,
0.3171742, 1.246008, 1.148401, 0, 0.2745098, 1, 1,
0.3217981, -1.137488, 3.14939, 0, 0.2666667, 1, 1,
0.3232693, -0.6465757, 1.173235, 0, 0.2627451, 1, 1,
0.3232899, -0.03767491, 2.221881, 0, 0.254902, 1, 1,
0.323592, 0.0481288, 2.028829, 0, 0.2509804, 1, 1,
0.3298249, -1.246883, 2.521422, 0, 0.2431373, 1, 1,
0.3321778, -0.414912, 5.906291, 0, 0.2392157, 1, 1,
0.3354641, 1.404701, -0.4211206, 0, 0.2313726, 1, 1,
0.3367532, -1.913447, 1.607013, 0, 0.227451, 1, 1,
0.3370546, 1.085615, -0.01442201, 0, 0.2196078, 1, 1,
0.337483, -0.9784358, 2.260561, 0, 0.2156863, 1, 1,
0.342943, -0.6820089, 3.685602, 0, 0.2078431, 1, 1,
0.3433343, -0.129682, 2.559041, 0, 0.2039216, 1, 1,
0.3445013, 0.6173568, 0.8299649, 0, 0.1960784, 1, 1,
0.3491843, -0.08810752, 2.596837, 0, 0.1882353, 1, 1,
0.3501288, 0.03293549, 1.504276, 0, 0.1843137, 1, 1,
0.3561855, -0.5045072, 2.289271, 0, 0.1764706, 1, 1,
0.3619466, -1.167096, 3.23895, 0, 0.172549, 1, 1,
0.3646798, -0.2800277, 4.664191, 0, 0.1647059, 1, 1,
0.3674478, -0.1423053, 2.309381, 0, 0.1607843, 1, 1,
0.3698736, 1.101192, 0.360605, 0, 0.1529412, 1, 1,
0.3711995, 1.609321, 2.383825, 0, 0.1490196, 1, 1,
0.3714604, 0.4301663, 0.970411, 0, 0.1411765, 1, 1,
0.3753567, -0.2405572, 0.8199366, 0, 0.1372549, 1, 1,
0.3757836, 0.2681966, 1.953746, 0, 0.1294118, 1, 1,
0.3788054, -0.3176654, 1.163765, 0, 0.1254902, 1, 1,
0.3799305, -0.04201896, 3.419466, 0, 0.1176471, 1, 1,
0.3800634, 0.5839449, 1.40199, 0, 0.1137255, 1, 1,
0.3822428, 0.69613, 1.303972, 0, 0.1058824, 1, 1,
0.382526, 0.1515727, 1.162231, 0, 0.09803922, 1, 1,
0.3841882, -0.7911907, 2.898388, 0, 0.09411765, 1, 1,
0.395667, -1.162728, 3.093484, 0, 0.08627451, 1, 1,
0.4072159, -0.4426919, 3.228416, 0, 0.08235294, 1, 1,
0.4092418, 0.889506, -1.262875, 0, 0.07450981, 1, 1,
0.4096633, -1.844741, 3.581947, 0, 0.07058824, 1, 1,
0.4120881, -0.2884213, 1.364425, 0, 0.0627451, 1, 1,
0.4133041, -0.5093852, 2.592693, 0, 0.05882353, 1, 1,
0.419844, -0.3447903, 2.38839, 0, 0.05098039, 1, 1,
0.4201673, -0.1020395, 1.138767, 0, 0.04705882, 1, 1,
0.4205988, -1.062452, 3.63451, 0, 0.03921569, 1, 1,
0.4211476, -0.883845, 1.449147, 0, 0.03529412, 1, 1,
0.4231701, -0.7787693, 3.396403, 0, 0.02745098, 1, 1,
0.4245313, 0.6300534, 2.124522, 0, 0.02352941, 1, 1,
0.4283981, -0.745734, 1.80745, 0, 0.01568628, 1, 1,
0.4312106, 0.04802061, 1.724843, 0, 0.01176471, 1, 1,
0.4361568, -0.8677911, 2.340101, 0, 0.003921569, 1, 1,
0.4384767, -0.8358257, 2.518473, 0.003921569, 0, 1, 1,
0.4385667, 3.042667, -0.4973696, 0.007843138, 0, 1, 1,
0.4395721, -0.09848646, 2.956157, 0.01568628, 0, 1, 1,
0.4447399, -1.867381, 2.154565, 0.01960784, 0, 1, 1,
0.4449168, -0.956723, 1.742612, 0.02745098, 0, 1, 1,
0.4459624, -0.4503824, 2.384274, 0.03137255, 0, 1, 1,
0.4501837, 0.4089108, -0.5846678, 0.03921569, 0, 1, 1,
0.4502165, 0.2712648, 0.7265143, 0.04313726, 0, 1, 1,
0.4513484, 1.300706, -0.06437504, 0.05098039, 0, 1, 1,
0.4522363, 0.5191911, 0.9668062, 0.05490196, 0, 1, 1,
0.4533261, -0.4682545, 2.125367, 0.0627451, 0, 1, 1,
0.4616024, -0.2296367, 0.5508054, 0.06666667, 0, 1, 1,
0.4618348, -0.5692506, 2.182379, 0.07450981, 0, 1, 1,
0.4645324, 0.3271348, 0.6394631, 0.07843138, 0, 1, 1,
0.4647254, 1.212583, 0.7002684, 0.08627451, 0, 1, 1,
0.4683552, 0.7695618, -0.09704189, 0.09019608, 0, 1, 1,
0.469845, 0.02220453, 2.306336, 0.09803922, 0, 1, 1,
0.4711672, -1.130481, 1.155207, 0.1058824, 0, 1, 1,
0.4744849, 0.8942302, 1.728042, 0.1098039, 0, 1, 1,
0.4781469, 0.6760264, 1.145516, 0.1176471, 0, 1, 1,
0.4819808, 0.688663, 0.5711434, 0.1215686, 0, 1, 1,
0.4820349, 0.6491629, 2.939414, 0.1294118, 0, 1, 1,
0.4843553, 1.045033, 0.3683901, 0.1333333, 0, 1, 1,
0.490653, 1.337456, 0.7268167, 0.1411765, 0, 1, 1,
0.492339, 1.352297, -1.335317, 0.145098, 0, 1, 1,
0.4931971, 1.264215, 1.224576, 0.1529412, 0, 1, 1,
0.4954748, 1.216269, 1.367889, 0.1568628, 0, 1, 1,
0.4967802, -2.149267, 2.681687, 0.1647059, 0, 1, 1,
0.498474, -0.1261285, 2.159446, 0.1686275, 0, 1, 1,
0.4995685, -0.004855555, 1.772017, 0.1764706, 0, 1, 1,
0.5021444, -0.2774673, 2.165336, 0.1803922, 0, 1, 1,
0.5058108, -1.122949, 2.260266, 0.1882353, 0, 1, 1,
0.5091892, 0.06851666, 2.176302, 0.1921569, 0, 1, 1,
0.5124641, -0.8219953, 1.81414, 0.2, 0, 1, 1,
0.5130114, -0.1313487, 0.4271063, 0.2078431, 0, 1, 1,
0.5153503, 1.228316, 0.801714, 0.2117647, 0, 1, 1,
0.5219887, -0.1351894, 3.398537, 0.2196078, 0, 1, 1,
0.524192, -0.4580124, 1.825679, 0.2235294, 0, 1, 1,
0.5268486, 0.4856856, -0.2860009, 0.2313726, 0, 1, 1,
0.5309936, -1.319749, 3.369164, 0.2352941, 0, 1, 1,
0.5322168, 1.536247, 0.9229337, 0.2431373, 0, 1, 1,
0.5323981, 0.009568877, -0.3399048, 0.2470588, 0, 1, 1,
0.5419134, -0.2586781, 2.787803, 0.254902, 0, 1, 1,
0.5443533, -1.568068, 1.617504, 0.2588235, 0, 1, 1,
0.5512459, 1.205692, 0.02215991, 0.2666667, 0, 1, 1,
0.5518287, 1.020622, -0.9683237, 0.2705882, 0, 1, 1,
0.5539846, 0.2531505, 2.297168, 0.2784314, 0, 1, 1,
0.5551182, -1.437924, 1.59742, 0.282353, 0, 1, 1,
0.5594426, 1.365753, 1.054672, 0.2901961, 0, 1, 1,
0.5607982, 2.151247, -0.4213699, 0.2941177, 0, 1, 1,
0.5630449, 0.7063069, -1.070501, 0.3019608, 0, 1, 1,
0.5648447, 0.2629128, 2.107092, 0.3098039, 0, 1, 1,
0.5676824, -0.2211657, 0.1124629, 0.3137255, 0, 1, 1,
0.5682507, -2.433491, 3.274055, 0.3215686, 0, 1, 1,
0.5686292, -2.073984, 6.04365, 0.3254902, 0, 1, 1,
0.5723754, 0.6990631, 0.8554902, 0.3333333, 0, 1, 1,
0.5742015, 0.4876277, -0.9951524, 0.3372549, 0, 1, 1,
0.5784862, 0.4637917, -0.2069224, 0.345098, 0, 1, 1,
0.5868903, -1.570659, 2.237685, 0.3490196, 0, 1, 1,
0.5910967, 0.8944843, 1.772777, 0.3568628, 0, 1, 1,
0.5961111, -0.08290154, 1.405437, 0.3607843, 0, 1, 1,
0.6006693, -0.3244438, 1.718752, 0.3686275, 0, 1, 1,
0.605661, 0.01675285, 0.6814055, 0.372549, 0, 1, 1,
0.6064754, -0.3527783, 2.880794, 0.3803922, 0, 1, 1,
0.6091521, -0.2506956, 3.788736, 0.3843137, 0, 1, 1,
0.6144353, 0.7576543, -1.190187, 0.3921569, 0, 1, 1,
0.617066, -1.958931, 4.559185, 0.3960784, 0, 1, 1,
0.6213957, 0.5277703, 1.392229, 0.4039216, 0, 1, 1,
0.6225286, 2.047313, 2.165572, 0.4117647, 0, 1, 1,
0.6233489, 1.038408, -0.4497797, 0.4156863, 0, 1, 1,
0.6270408, -0.9130188, 2.66652, 0.4235294, 0, 1, 1,
0.6277267, -0.07898596, 0.9146057, 0.427451, 0, 1, 1,
0.6281314, -0.8295553, 2.380505, 0.4352941, 0, 1, 1,
0.6342971, 1.475881, 0.598914, 0.4392157, 0, 1, 1,
0.6363406, 0.1724774, 1.486214, 0.4470588, 0, 1, 1,
0.6468414, 0.2318, -0.8181292, 0.4509804, 0, 1, 1,
0.6481359, -0.1525353, 2.934838, 0.4588235, 0, 1, 1,
0.6482865, 0.8045769, 0.4637002, 0.4627451, 0, 1, 1,
0.6530947, 0.4876094, 1.235865, 0.4705882, 0, 1, 1,
0.6538102, -0.3899938, 2.330319, 0.4745098, 0, 1, 1,
0.6544984, 0.06004182, 3.11462, 0.4823529, 0, 1, 1,
0.6552823, 1.627872, 1.490747, 0.4862745, 0, 1, 1,
0.6563076, 0.1762908, 2.068379, 0.4941176, 0, 1, 1,
0.6636505, -0.1562413, -0.01401672, 0.5019608, 0, 1, 1,
0.6664091, 0.1314611, 1.990578, 0.5058824, 0, 1, 1,
0.672637, 0.2402968, 0.5523559, 0.5137255, 0, 1, 1,
0.6778244, 0.009093119, 1.1376, 0.5176471, 0, 1, 1,
0.6778394, 1.285927, 0.7867132, 0.5254902, 0, 1, 1,
0.6779362, 2.368241, -1.350155, 0.5294118, 0, 1, 1,
0.6791838, 1.113817, 3.008892, 0.5372549, 0, 1, 1,
0.680796, 0.5797155, 1.892882, 0.5411765, 0, 1, 1,
0.6824418, -0.2858679, 1.948317, 0.5490196, 0, 1, 1,
0.6877056, -0.2583912, 1.824761, 0.5529412, 0, 1, 1,
0.6888298, -0.6563855, 3.244894, 0.5607843, 0, 1, 1,
0.6899707, -0.05927037, 1.404934, 0.5647059, 0, 1, 1,
0.6917735, -0.379185, 2.244433, 0.572549, 0, 1, 1,
0.6921024, 0.1581149, 2.000979, 0.5764706, 0, 1, 1,
0.6921567, 0.4223636, 0.7699872, 0.5843138, 0, 1, 1,
0.6960829, -0.1760211, 2.995868, 0.5882353, 0, 1, 1,
0.7030193, -0.1141177, 0.8546787, 0.5960785, 0, 1, 1,
0.7063819, 0.3831969, -0.8164697, 0.6039216, 0, 1, 1,
0.7080268, -2.334371, 1.995341, 0.6078432, 0, 1, 1,
0.7128015, 0.3659109, 0.9911968, 0.6156863, 0, 1, 1,
0.7138212, 0.1222396, 2.690106, 0.6196079, 0, 1, 1,
0.7140749, 0.6851422, 2.256406, 0.627451, 0, 1, 1,
0.7192577, 0.653409, 2.176736, 0.6313726, 0, 1, 1,
0.7308916, -1.1353, 1.840279, 0.6392157, 0, 1, 1,
0.7341627, 0.6095121, 1.406123, 0.6431373, 0, 1, 1,
0.736574, 0.2080082, 2.107504, 0.6509804, 0, 1, 1,
0.7448875, -0.7993468, 3.658154, 0.654902, 0, 1, 1,
0.7454287, 0.1060981, 2.180521, 0.6627451, 0, 1, 1,
0.7477099, -0.3484428, 1.163528, 0.6666667, 0, 1, 1,
0.7605094, 1.519973, 1.682792, 0.6745098, 0, 1, 1,
0.7606151, -1.144342, 3.372106, 0.6784314, 0, 1, 1,
0.7624517, 0.05168172, 1.705263, 0.6862745, 0, 1, 1,
0.7626542, -1.338744, 2.323283, 0.6901961, 0, 1, 1,
0.7638546, 0.2815867, 1.951474, 0.6980392, 0, 1, 1,
0.7638661, -0.9298556, 1.523358, 0.7058824, 0, 1, 1,
0.7645901, 0.4890127, 2.474348, 0.7098039, 0, 1, 1,
0.7720466, -0.02762241, 2.620806, 0.7176471, 0, 1, 1,
0.7764693, 0.3465621, 2.795897, 0.7215686, 0, 1, 1,
0.7790008, 0.009281931, -0.004852333, 0.7294118, 0, 1, 1,
0.785707, -0.07385363, 1.765559, 0.7333333, 0, 1, 1,
0.7909802, 1.369303, 1.006264, 0.7411765, 0, 1, 1,
0.8023824, 0.6854824, 1.583717, 0.7450981, 0, 1, 1,
0.8159259, 0.01122957, 2.636935, 0.7529412, 0, 1, 1,
0.8189769, 1.319216, -1.133805, 0.7568628, 0, 1, 1,
0.8231984, 1.038076, 2.230503, 0.7647059, 0, 1, 1,
0.8271796, -1.279771, 3.476997, 0.7686275, 0, 1, 1,
0.8284265, -1.390322, 2.302241, 0.7764706, 0, 1, 1,
0.8285084, -2.114573, 2.283865, 0.7803922, 0, 1, 1,
0.8286136, -0.6520632, 1.693254, 0.7882353, 0, 1, 1,
0.8288087, -1.223681, 4.115344, 0.7921569, 0, 1, 1,
0.8307424, 0.3057981, 2.660985, 0.8, 0, 1, 1,
0.8386974, 0.3930577, 1.973458, 0.8078431, 0, 1, 1,
0.8391603, 0.2602209, 2.911375, 0.8117647, 0, 1, 1,
0.8418803, -0.4468848, 0.9841363, 0.8196079, 0, 1, 1,
0.8426, 0.1125653, 2.009636, 0.8235294, 0, 1, 1,
0.8429724, 1.06003, 0.5904887, 0.8313726, 0, 1, 1,
0.8437543, 0.07577662, 2.376083, 0.8352941, 0, 1, 1,
0.8470749, 1.262032, -0.3202839, 0.8431373, 0, 1, 1,
0.8489406, 1.297166, -0.08587068, 0.8470588, 0, 1, 1,
0.8497755, -1.174173, 2.238394, 0.854902, 0, 1, 1,
0.8548971, 0.5474887, 1.008574, 0.8588235, 0, 1, 1,
0.8557839, 0.6336914, -0.5150369, 0.8666667, 0, 1, 1,
0.8656183, -1.699963, 3.939128, 0.8705882, 0, 1, 1,
0.8660169, 0.6917894, 2.12473, 0.8784314, 0, 1, 1,
0.8703976, 2.318157, -0.6664175, 0.8823529, 0, 1, 1,
0.8708014, 0.4218054, 0.4723895, 0.8901961, 0, 1, 1,
0.8710692, 1.912534, -0.101478, 0.8941177, 0, 1, 1,
0.8739334, -0.4932657, 2.443369, 0.9019608, 0, 1, 1,
0.8760922, -0.482094, 1.73359, 0.9098039, 0, 1, 1,
0.8804051, -0.5053062, 2.333833, 0.9137255, 0, 1, 1,
0.8845339, 1.75851, 0.07407585, 0.9215686, 0, 1, 1,
0.8860691, -0.9484636, 1.835143, 0.9254902, 0, 1, 1,
0.8899098, 0.995765, 0.4429968, 0.9333333, 0, 1, 1,
0.8984849, 0.5138009, 2.79547, 0.9372549, 0, 1, 1,
0.9018005, -1.13229, 2.621754, 0.945098, 0, 1, 1,
0.9068933, 0.6646244, 2.262849, 0.9490196, 0, 1, 1,
0.9099029, 0.1072626, 2.365594, 0.9568627, 0, 1, 1,
0.9103853, -0.1966939, 2.631948, 0.9607843, 0, 1, 1,
0.9156438, 1.207065, 0.1795525, 0.9686275, 0, 1, 1,
0.9242644, -0.5556375, 0.8618425, 0.972549, 0, 1, 1,
0.9286953, 0.5105555, 0.3170386, 0.9803922, 0, 1, 1,
0.9290071, 0.511825, 2.553783, 0.9843137, 0, 1, 1,
0.9313163, -1.271801, 2.879482, 0.9921569, 0, 1, 1,
0.9340721, 0.6553929, 1.853356, 0.9960784, 0, 1, 1,
0.9465215, -1.217467, 2.231199, 1, 0, 0.9960784, 1,
0.9483292, 1.452035, 0.3470994, 1, 0, 0.9882353, 1,
0.9496046, -0.1959052, 1.664345, 1, 0, 0.9843137, 1,
0.9533178, 0.6753566, 1.559708, 1, 0, 0.9764706, 1,
0.9559739, -0.3648062, 0.3432206, 1, 0, 0.972549, 1,
0.957753, -0.481186, 0.277502, 1, 0, 0.9647059, 1,
0.9651813, -0.7753373, 2.712929, 1, 0, 0.9607843, 1,
0.9710352, -0.06769558, 1.361733, 1, 0, 0.9529412, 1,
0.9809566, -1.446429, 2.550139, 1, 0, 0.9490196, 1,
0.9817106, 0.4230529, -0.6761925, 1, 0, 0.9411765, 1,
0.983254, -0.8674222, 3.349525, 1, 0, 0.9372549, 1,
0.9849359, 0.7135513, 1.265189, 1, 0, 0.9294118, 1,
0.9899343, 0.7055727, -0.1275405, 1, 0, 0.9254902, 1,
0.9960712, -0.7887414, 2.441946, 1, 0, 0.9176471, 1,
1.000345, 0.3858186, 1.545147, 1, 0, 0.9137255, 1,
1.002906, 0.2616825, 1.43815, 1, 0, 0.9058824, 1,
1.003304, 0.002469682, 1.102988, 1, 0, 0.9019608, 1,
1.017388, -0.2702917, 0.4334964, 1, 0, 0.8941177, 1,
1.019711, 0.01809022, 1.101311, 1, 0, 0.8862745, 1,
1.022753, -0.4860767, 1.467233, 1, 0, 0.8823529, 1,
1.023821, 0.5617847, 1.858354, 1, 0, 0.8745098, 1,
1.026716, 0.916338, 1.573038, 1, 0, 0.8705882, 1,
1.033026, -0.8261666, 2.95504, 1, 0, 0.8627451, 1,
1.035786, 1.667827, 1.491094, 1, 0, 0.8588235, 1,
1.037961, 1.24109, 1.136626, 1, 0, 0.8509804, 1,
1.03932, -0.9457216, 2.215595, 1, 0, 0.8470588, 1,
1.044749, 2.429225, -0.6506432, 1, 0, 0.8392157, 1,
1.046034, 0.9509414, 1.725841, 1, 0, 0.8352941, 1,
1.069646, -1.232722, 2.479229, 1, 0, 0.827451, 1,
1.073388, 0.1652378, -0.412598, 1, 0, 0.8235294, 1,
1.073727, -0.3954347, 1.600119, 1, 0, 0.8156863, 1,
1.085082, -0.1412773, 1.782753, 1, 0, 0.8117647, 1,
1.087109, 1.902368, 1.729528, 1, 0, 0.8039216, 1,
1.087741, 0.9825327, 2.026126, 1, 0, 0.7960784, 1,
1.091862, -0.2566409, 3.454434, 1, 0, 0.7921569, 1,
1.09224, -1.189525, 3.340619, 1, 0, 0.7843137, 1,
1.09521, 1.286573, 1.057944, 1, 0, 0.7803922, 1,
1.096242, -0.9390567, 1.704151, 1, 0, 0.772549, 1,
1.096307, 1.475357, 1.161989, 1, 0, 0.7686275, 1,
1.107477, 1.340116, 1.243397, 1, 0, 0.7607843, 1,
1.135623, -0.5530232, 1.80056, 1, 0, 0.7568628, 1,
1.139849, 0.5251092, 0.9982948, 1, 0, 0.7490196, 1,
1.141346, 0.4063959, 2.339954, 1, 0, 0.7450981, 1,
1.14798, 1.345322, 4.225548, 1, 0, 0.7372549, 1,
1.148583, -0.6636126, 1.901205, 1, 0, 0.7333333, 1,
1.15143, -0.8848249, 3.051803, 1, 0, 0.7254902, 1,
1.153578, 1.098671, 1.559376, 1, 0, 0.7215686, 1,
1.154095, 1.011635, 0.5687878, 1, 0, 0.7137255, 1,
1.155, -0.2576152, 2.704204, 1, 0, 0.7098039, 1,
1.167492, 1.461529, 0.7746001, 1, 0, 0.7019608, 1,
1.177671, 0.230243, 0.04618317, 1, 0, 0.6941177, 1,
1.181694, -1.182861, 3.212996, 1, 0, 0.6901961, 1,
1.189425, 0.6105998, 0.7311493, 1, 0, 0.682353, 1,
1.195488, 0.4341615, 2.825011, 1, 0, 0.6784314, 1,
1.198119, 0.6576582, 1.429604, 1, 0, 0.6705883, 1,
1.199355, -1.392067, 5.355768, 1, 0, 0.6666667, 1,
1.201062, 0.2062269, 2.239131, 1, 0, 0.6588235, 1,
1.201137, -1.364134, 1.860752, 1, 0, 0.654902, 1,
1.206341, -0.09191143, 1.226539, 1, 0, 0.6470588, 1,
1.20793, -0.4347177, 1.003171, 1, 0, 0.6431373, 1,
1.223464, 1.706619, 0.2377518, 1, 0, 0.6352941, 1,
1.226437, 0.8853132, 1.409976, 1, 0, 0.6313726, 1,
1.230057, -1.906817, 1.410292, 1, 0, 0.6235294, 1,
1.23167, 1.15226, 1.602357, 1, 0, 0.6196079, 1,
1.235826, 0.9847935, 1.550928, 1, 0, 0.6117647, 1,
1.244587, 0.601219, 2.224479, 1, 0, 0.6078432, 1,
1.259912, 0.254359, 0.4900611, 1, 0, 0.6, 1,
1.261915, -0.3378667, 1.18949, 1, 0, 0.5921569, 1,
1.270849, -0.7231455, 2.841061, 1, 0, 0.5882353, 1,
1.271724, -0.03485727, 3.299102, 1, 0, 0.5803922, 1,
1.275109, 1.479371, 1.425245, 1, 0, 0.5764706, 1,
1.280717, -0.7803435, 2.011013, 1, 0, 0.5686275, 1,
1.282098, 0.3539972, 0.6201157, 1, 0, 0.5647059, 1,
1.28992, 0.6402611, -0.3219857, 1, 0, 0.5568628, 1,
1.291662, 0.5554131, 1.371291, 1, 0, 0.5529412, 1,
1.298584, -0.3400282, 2.114564, 1, 0, 0.5450981, 1,
1.298842, -0.61659, 2.155002, 1, 0, 0.5411765, 1,
1.30614, -1.649961, 3.603086, 1, 0, 0.5333334, 1,
1.31, 0.01690792, 1.572471, 1, 0, 0.5294118, 1,
1.328349, 0.9551549, 2.894185, 1, 0, 0.5215687, 1,
1.331202, 0.05293594, 1.799186, 1, 0, 0.5176471, 1,
1.336245, 1.374828, -0.2515545, 1, 0, 0.509804, 1,
1.339376, 0.3878031, 1.197702, 1, 0, 0.5058824, 1,
1.347454, -1.361633, 1.9992, 1, 0, 0.4980392, 1,
1.363141, 0.2512943, 1.529918, 1, 0, 0.4901961, 1,
1.364284, -0.02688243, 0.1643883, 1, 0, 0.4862745, 1,
1.374064, 2.576366, -0.303537, 1, 0, 0.4784314, 1,
1.391344, 0.2748229, 2.963591, 1, 0, 0.4745098, 1,
1.392346, 0.5038813, 1.439489, 1, 0, 0.4666667, 1,
1.409284, 1.850372, -0.8702433, 1, 0, 0.4627451, 1,
1.415789, -0.4567135, 2.293303, 1, 0, 0.454902, 1,
1.4426, 1.062632, -0.07078002, 1, 0, 0.4509804, 1,
1.446416, 0.2801539, 1.476303, 1, 0, 0.4431373, 1,
1.460166, -0.522719, 1.327005, 1, 0, 0.4392157, 1,
1.472683, -1.435336, 2.15191, 1, 0, 0.4313726, 1,
1.489641, -0.3117099, 3.980067, 1, 0, 0.427451, 1,
1.494515, 0.2490074, 2.769746, 1, 0, 0.4196078, 1,
1.502535, -0.6447742, 0.8776522, 1, 0, 0.4156863, 1,
1.533166, 1.216573, 0.5769073, 1, 0, 0.4078431, 1,
1.546669, -0.7351385, 1.31663, 1, 0, 0.4039216, 1,
1.550738, 0.1325298, 3.008416, 1, 0, 0.3960784, 1,
1.55181, -1.126735, 0.2905654, 1, 0, 0.3882353, 1,
1.566481, 1.262322, 1.472814, 1, 0, 0.3843137, 1,
1.570872, 0.4952904, 0.3874142, 1, 0, 0.3764706, 1,
1.572696, 0.5352805, 2.311548, 1, 0, 0.372549, 1,
1.578216, -0.9008561, -0.00697042, 1, 0, 0.3647059, 1,
1.585701, 0.06377567, 2.39046, 1, 0, 0.3607843, 1,
1.598302, -0.3625401, 1.652954, 1, 0, 0.3529412, 1,
1.609077, 4.079297, 0.4564357, 1, 0, 0.3490196, 1,
1.613211, -0.5496939, 2.366406, 1, 0, 0.3411765, 1,
1.613992, 2.185476, 1.135454, 1, 0, 0.3372549, 1,
1.629054, -0.9586117, 1.942847, 1, 0, 0.3294118, 1,
1.638337, 0.0473855, 2.352657, 1, 0, 0.3254902, 1,
1.643281, -0.1950093, 1.260223, 1, 0, 0.3176471, 1,
1.650804, -1.36108, 0.5561249, 1, 0, 0.3137255, 1,
1.678713, 1.159147, 0.5678596, 1, 0, 0.3058824, 1,
1.687295, 0.04985276, 1.013434, 1, 0, 0.2980392, 1,
1.694872, -0.9131351, 1.186651, 1, 0, 0.2941177, 1,
1.722316, -0.5162141, 2.953091, 1, 0, 0.2862745, 1,
1.730123, -0.7777669, 3.044183, 1, 0, 0.282353, 1,
1.738241, 0.07289217, 0.8274637, 1, 0, 0.2745098, 1,
1.742467, -0.9720757, 2.064162, 1, 0, 0.2705882, 1,
1.754732, 0.2643605, 1.083202, 1, 0, 0.2627451, 1,
1.760237, -1.770858, 2.217134, 1, 0, 0.2588235, 1,
1.774588, -0.8937131, 2.600722, 1, 0, 0.2509804, 1,
1.778719, 1.004952, -0.3388463, 1, 0, 0.2470588, 1,
1.778991, -0.896947, 1.832995, 1, 0, 0.2392157, 1,
1.792018, -0.2905264, 1.977901, 1, 0, 0.2352941, 1,
1.794306, 1.123569, 1.082937, 1, 0, 0.227451, 1,
1.836137, 0.5449431, 0.06965072, 1, 0, 0.2235294, 1,
1.845623, -0.7836315, 3.075346, 1, 0, 0.2156863, 1,
1.846193, -0.4679795, 1.852355, 1, 0, 0.2117647, 1,
1.870012, 0.9492231, 1.765756, 1, 0, 0.2039216, 1,
1.902024, -0.542189, 4.206631, 1, 0, 0.1960784, 1,
1.928208, 0.9816406, 0.5265025, 1, 0, 0.1921569, 1,
1.934368, 0.3095428, 0.4074632, 1, 0, 0.1843137, 1,
1.943557, -0.5361754, 1.894815, 1, 0, 0.1803922, 1,
1.951415, -0.4114294, 1.230122, 1, 0, 0.172549, 1,
1.976364, -0.0114936, 1.474444, 1, 0, 0.1686275, 1,
1.986802, -1.234323, 2.238455, 1, 0, 0.1607843, 1,
1.991999, -1.370026, 2.431644, 1, 0, 0.1568628, 1,
1.997344, 1.153356, 1.22999, 1, 0, 0.1490196, 1,
2.000087, -0.5102226, 1.581085, 1, 0, 0.145098, 1,
2.009815, 0.4901343, 1.646229, 1, 0, 0.1372549, 1,
2.021863, -0.906328, 3.106947, 1, 0, 0.1333333, 1,
2.037403, -0.4461829, 1.914392, 1, 0, 0.1254902, 1,
2.039467, -1.481314, 3.757236, 1, 0, 0.1215686, 1,
2.070616, 1.158363, 0.4154994, 1, 0, 0.1137255, 1,
2.101875, -1.359708, 1.931927, 1, 0, 0.1098039, 1,
2.144682, 0.3017737, 0.1136047, 1, 0, 0.1019608, 1,
2.161382, 0.3808849, 0.3924271, 1, 0, 0.09411765, 1,
2.168797, 1.825147, 0.8121981, 1, 0, 0.09019608, 1,
2.173943, 0.5463452, 0.2525613, 1, 0, 0.08235294, 1,
2.208719, -0.8337198, 1.247819, 1, 0, 0.07843138, 1,
2.218313, 0.9421964, 2.618608, 1, 0, 0.07058824, 1,
2.254278, 0.3146262, -0.2915213, 1, 0, 0.06666667, 1,
2.262678, 0.1354157, 3.133508, 1, 0, 0.05882353, 1,
2.298281, -0.4249914, 1.119334, 1, 0, 0.05490196, 1,
2.403552, -0.06664689, 2.382457, 1, 0, 0.04705882, 1,
2.407792, -1.352247, 2.973854, 1, 0, 0.04313726, 1,
2.458572, 1.968799, 0.03458802, 1, 0, 0.03529412, 1,
2.502995, -1.824765, 2.894686, 1, 0, 0.03137255, 1,
2.719688, -0.6529045, 2.630194, 1, 0, 0.02352941, 1,
2.858035, -0.2474613, 4.704977, 1, 0, 0.01960784, 1,
3.188323, 1.583671, 1.268174, 1, 0, 0.01176471, 1,
3.335052, 2.088005, -0.5744631, 1, 0, 0.007843138, 1
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
0.05424845, -4.279864, -7.668455, 0, -0.5, 0.5, 0.5,
0.05424845, -4.279864, -7.668455, 1, -0.5, 0.5, 0.5,
0.05424845, -4.279864, -7.668455, 1, 1.5, 0.5, 0.5,
0.05424845, -4.279864, -7.668455, 0, 1.5, 0.5, 0.5
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
-4.338748, 0.5054785, -7.668455, 0, -0.5, 0.5, 0.5,
-4.338748, 0.5054785, -7.668455, 1, -0.5, 0.5, 0.5,
-4.338748, 0.5054785, -7.668455, 1, 1.5, 0.5, 0.5,
-4.338748, 0.5054785, -7.668455, 0, 1.5, 0.5, 0.5
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
-4.338748, -4.279864, 0.1812706, 0, -0.5, 0.5, 0.5,
-4.338748, -4.279864, 0.1812706, 1, -0.5, 0.5, 0.5,
-4.338748, -4.279864, 0.1812706, 1, 1.5, 0.5, 0.5,
-4.338748, -4.279864, 0.1812706, 0, 1.5, 0.5, 0.5
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
-3, -3.175554, -5.85698,
3, -3.175554, -5.85698,
-3, -3.175554, -5.85698,
-3, -3.359606, -6.158892,
-2, -3.175554, -5.85698,
-2, -3.359606, -6.158892,
-1, -3.175554, -5.85698,
-1, -3.359606, -6.158892,
0, -3.175554, -5.85698,
0, -3.359606, -6.158892,
1, -3.175554, -5.85698,
1, -3.359606, -6.158892,
2, -3.175554, -5.85698,
2, -3.359606, -6.158892,
3, -3.175554, -5.85698,
3, -3.359606, -6.158892
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
-3, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
-3, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
-3, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
-3, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
-2, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
-2, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
-2, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
-2, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
-1, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
-1, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
-1, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
-1, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
0, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
0, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
0, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
0, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
1, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
1, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
1, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
1, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
2, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
2, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
2, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
2, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5,
3, -3.727709, -6.762717, 0, -0.5, 0.5, 0.5,
3, -3.727709, -6.762717, 1, -0.5, 0.5, 0.5,
3, -3.727709, -6.762717, 1, 1.5, 0.5, 0.5,
3, -3.727709, -6.762717, 0, 1.5, 0.5, 0.5
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
-3.32498, -2, -5.85698,
-3.32498, 4, -5.85698,
-3.32498, -2, -5.85698,
-3.493941, -2, -6.158892,
-3.32498, 0, -5.85698,
-3.493941, 0, -6.158892,
-3.32498, 2, -5.85698,
-3.493941, 2, -6.158892,
-3.32498, 4, -5.85698,
-3.493941, 4, -6.158892
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
"0",
"2",
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
-3.831864, -2, -6.762717, 0, -0.5, 0.5, 0.5,
-3.831864, -2, -6.762717, 1, -0.5, 0.5, 0.5,
-3.831864, -2, -6.762717, 1, 1.5, 0.5, 0.5,
-3.831864, -2, -6.762717, 0, 1.5, 0.5, 0.5,
-3.831864, 0, -6.762717, 0, -0.5, 0.5, 0.5,
-3.831864, 0, -6.762717, 1, -0.5, 0.5, 0.5,
-3.831864, 0, -6.762717, 1, 1.5, 0.5, 0.5,
-3.831864, 0, -6.762717, 0, 1.5, 0.5, 0.5,
-3.831864, 2, -6.762717, 0, -0.5, 0.5, 0.5,
-3.831864, 2, -6.762717, 1, -0.5, 0.5, 0.5,
-3.831864, 2, -6.762717, 1, 1.5, 0.5, 0.5,
-3.831864, 2, -6.762717, 0, 1.5, 0.5, 0.5,
-3.831864, 4, -6.762717, 0, -0.5, 0.5, 0.5,
-3.831864, 4, -6.762717, 1, -0.5, 0.5, 0.5,
-3.831864, 4, -6.762717, 1, 1.5, 0.5, 0.5,
-3.831864, 4, -6.762717, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.32498, -3.175554, -4,
-3.32498, -3.175554, 6,
-3.32498, -3.175554, -4,
-3.493941, -3.359606, -4,
-3.32498, -3.175554, -2,
-3.493941, -3.359606, -2,
-3.32498, -3.175554, 0,
-3.493941, -3.359606, 0,
-3.32498, -3.175554, 2,
-3.493941, -3.359606, 2,
-3.32498, -3.175554, 4,
-3.493941, -3.359606, 4,
-3.32498, -3.175554, 6,
-3.493941, -3.359606, 6
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
"4",
"6"
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
-3.831864, -3.727709, -4, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, -4, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, -4, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, -4, 0, 1.5, 0.5, 0.5,
-3.831864, -3.727709, -2, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, -2, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, -2, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, -2, 0, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 0, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 0, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 0, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 0, 0, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 2, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 2, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 2, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 2, 0, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 4, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 4, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 4, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 4, 0, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 6, 0, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 6, 1, -0.5, 0.5, 0.5,
-3.831864, -3.727709, 6, 1, 1.5, 0.5, 0.5,
-3.831864, -3.727709, 6, 0, 1.5, 0.5, 0.5
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
-3.32498, -3.175554, -5.85698,
-3.32498, 4.186511, -5.85698,
-3.32498, -3.175554, 6.219521,
-3.32498, 4.186511, 6.219521,
-3.32498, -3.175554, -5.85698,
-3.32498, -3.175554, 6.219521,
-3.32498, 4.186511, -5.85698,
-3.32498, 4.186511, 6.219521,
-3.32498, -3.175554, -5.85698,
3.433477, -3.175554, -5.85698,
-3.32498, -3.175554, 6.219521,
3.433477, -3.175554, 6.219521,
-3.32498, 4.186511, -5.85698,
3.433477, 4.186511, -5.85698,
-3.32498, 4.186511, 6.219521,
3.433477, 4.186511, 6.219521,
3.433477, -3.175554, -5.85698,
3.433477, 4.186511, -5.85698,
3.433477, -3.175554, 6.219521,
3.433477, 4.186511, 6.219521,
3.433477, -3.175554, -5.85698,
3.433477, -3.175554, 6.219521,
3.433477, 4.186511, -5.85698,
3.433477, 4.186511, 6.219521
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
var radius = 8.370367;
var distance = 37.24071;
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
mvMatrix.translate( -0.05424845, -0.5054785, -0.1812706 );
mvMatrix.scale( 1.339093, 1.229302, 0.7494062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.24071);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


