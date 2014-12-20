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
-3.326995, 0.9958376, -1.836178, 1, 0, 0, 1,
-3.212432, 1.031775, -1.308588, 1, 0.007843138, 0, 1,
-3.173935, 0.8239374, 0.8645086, 1, 0.01176471, 0, 1,
-3.014135, 0.2027265, -1.330922, 1, 0.01960784, 0, 1,
-2.766462, -0.8264258, -2.534701, 1, 0.02352941, 0, 1,
-2.668966, -0.5463024, -1.542984, 1, 0.03137255, 0, 1,
-2.667854, 0.03366897, -2.383456, 1, 0.03529412, 0, 1,
-2.661773, 0.4125638, -2.708495, 1, 0.04313726, 0, 1,
-2.584749, -0.1909311, -2.24999, 1, 0.04705882, 0, 1,
-2.397741, 1.044453, -1.106183, 1, 0.05490196, 0, 1,
-2.352556, -0.01113476, 0.2615404, 1, 0.05882353, 0, 1,
-2.349468, -0.4756335, -2.906242, 1, 0.06666667, 0, 1,
-2.297782, -0.5780993, -2.619583, 1, 0.07058824, 0, 1,
-2.289484, 1.87503, -2.321294, 1, 0.07843138, 0, 1,
-2.277681, -0.13583, -2.366132, 1, 0.08235294, 0, 1,
-2.229477, 0.2831547, -1.47062, 1, 0.09019608, 0, 1,
-2.224041, -0.3305302, -0.7251368, 1, 0.09411765, 0, 1,
-2.204246, 1.000962, -0.5141807, 1, 0.1019608, 0, 1,
-2.194627, -0.8510544, -2.234567, 1, 0.1098039, 0, 1,
-2.10207, 0.01018106, -1.057353, 1, 0.1137255, 0, 1,
-2.060233, -1.07627, -1.298014, 1, 0.1215686, 0, 1,
-2.039496, -1.105473, -3.197832, 1, 0.1254902, 0, 1,
-2.038808, -0.2980331, -2.102005, 1, 0.1333333, 0, 1,
-1.960674, 0.7500807, -2.027197, 1, 0.1372549, 0, 1,
-1.948188, -0.543059, -1.352674, 1, 0.145098, 0, 1,
-1.940596, -2.016927, -2.07095, 1, 0.1490196, 0, 1,
-1.931201, 0.619508, -1.522178, 1, 0.1568628, 0, 1,
-1.926291, -0.505945, -2.328223, 1, 0.1607843, 0, 1,
-1.915763, -0.3600864, -1.148479, 1, 0.1686275, 0, 1,
-1.915382, -1.155472, -2.934168, 1, 0.172549, 0, 1,
-1.891945, 0.8018582, 0.3586566, 1, 0.1803922, 0, 1,
-1.886218, -0.4487982, -0.7343303, 1, 0.1843137, 0, 1,
-1.882074, -0.449777, -0.9988195, 1, 0.1921569, 0, 1,
-1.860059, 0.6610033, -0.4885951, 1, 0.1960784, 0, 1,
-1.857015, 0.138047, -2.033766, 1, 0.2039216, 0, 1,
-1.853225, -0.1938757, -0.9672583, 1, 0.2117647, 0, 1,
-1.836462, -2.219878, -0.8497066, 1, 0.2156863, 0, 1,
-1.835516, 0.7523383, -0.3828554, 1, 0.2235294, 0, 1,
-1.825869, -1.445231, -3.414245, 1, 0.227451, 0, 1,
-1.810836, 2.399485, -0.8446192, 1, 0.2352941, 0, 1,
-1.780027, 0.2963969, -1.679704, 1, 0.2392157, 0, 1,
-1.768974, 0.1110514, -1.237836, 1, 0.2470588, 0, 1,
-1.76708, -0.2267401, -1.191931, 1, 0.2509804, 0, 1,
-1.759925, 0.4952447, -2.249741, 1, 0.2588235, 0, 1,
-1.757538, 0.4904997, -0.5522716, 1, 0.2627451, 0, 1,
-1.732321, -0.7957355, 0.2514103, 1, 0.2705882, 0, 1,
-1.723233, 0.471205, -2.243943, 1, 0.2745098, 0, 1,
-1.716768, 0.5785669, 0.9039247, 1, 0.282353, 0, 1,
-1.702289, -0.5634465, -2.536001, 1, 0.2862745, 0, 1,
-1.69022, -1.686344, -3.077956, 1, 0.2941177, 0, 1,
-1.663923, 1.923132, -2.170444, 1, 0.3019608, 0, 1,
-1.659604, -1.005774, -1.156826, 1, 0.3058824, 0, 1,
-1.657647, 1.411371, -1.192431, 1, 0.3137255, 0, 1,
-1.649257, -2.040433, -2.866159, 1, 0.3176471, 0, 1,
-1.63434, 1.107251, 0.024835, 1, 0.3254902, 0, 1,
-1.606277, -0.9192755, -1.848685, 1, 0.3294118, 0, 1,
-1.604796, -0.3690629, -0.9508557, 1, 0.3372549, 0, 1,
-1.598123, -0.1076388, -2.173102, 1, 0.3411765, 0, 1,
-1.595823, -2.064752, -2.281192, 1, 0.3490196, 0, 1,
-1.591118, 0.4486285, -1.6099, 1, 0.3529412, 0, 1,
-1.57877, 0.368349, 1.169393, 1, 0.3607843, 0, 1,
-1.577721, 0.8619319, -2.457259, 1, 0.3647059, 0, 1,
-1.561324, -0.3121165, -3.204807, 1, 0.372549, 0, 1,
-1.561269, 1.433898, -3.441364, 1, 0.3764706, 0, 1,
-1.555081, -0.5444267, -1.874897, 1, 0.3843137, 0, 1,
-1.526097, 0.04756426, -0.406873, 1, 0.3882353, 0, 1,
-1.515032, -1.382154, -1.962589, 1, 0.3960784, 0, 1,
-1.506858, -0.0212622, -1.795927, 1, 0.4039216, 0, 1,
-1.496058, -0.5267488, -2.963, 1, 0.4078431, 0, 1,
-1.495258, 0.6659877, -0.7084867, 1, 0.4156863, 0, 1,
-1.473981, 3.092821, -1.928797, 1, 0.4196078, 0, 1,
-1.469208, -2.296926, -1.799212, 1, 0.427451, 0, 1,
-1.461926, -0.8283328, -3.333654, 1, 0.4313726, 0, 1,
-1.452713, -0.3988074, -1.21633, 1, 0.4392157, 0, 1,
-1.438398, -0.280589, -1.994307, 1, 0.4431373, 0, 1,
-1.431194, 0.2071287, -2.042767, 1, 0.4509804, 0, 1,
-1.424454, -0.5422714, -1.431876, 1, 0.454902, 0, 1,
-1.418725, -1.23235, -2.465127, 1, 0.4627451, 0, 1,
-1.398273, -0.9197953, -3.426585, 1, 0.4666667, 0, 1,
-1.394745, 0.4048687, -2.031005, 1, 0.4745098, 0, 1,
-1.393332, -0.3479782, -2.992399, 1, 0.4784314, 0, 1,
-1.380523, 0.3220242, -1.406732, 1, 0.4862745, 0, 1,
-1.374017, 1.587114, -1.577042, 1, 0.4901961, 0, 1,
-1.373075, 0.6579586, 0.1226301, 1, 0.4980392, 0, 1,
-1.368536, 1.297854, -1.797333, 1, 0.5058824, 0, 1,
-1.352554, -1.647758, -2.085155, 1, 0.509804, 0, 1,
-1.338525, -0.5473481, -3.072593, 1, 0.5176471, 0, 1,
-1.337031, 0.6028327, -2.091298, 1, 0.5215687, 0, 1,
-1.330927, -1.7137, -1.988766, 1, 0.5294118, 0, 1,
-1.330319, 1.594658, -1.456864, 1, 0.5333334, 0, 1,
-1.329696, 0.1246995, -2.149045, 1, 0.5411765, 0, 1,
-1.327214, -1.565727, -1.804197, 1, 0.5450981, 0, 1,
-1.326066, -0.06327831, -2.064061, 1, 0.5529412, 0, 1,
-1.312909, -1.025374, -1.157272, 1, 0.5568628, 0, 1,
-1.296314, 0.3173365, -2.834302, 1, 0.5647059, 0, 1,
-1.292435, 0.3775095, -2.787198, 1, 0.5686275, 0, 1,
-1.285568, -1.258177, -2.164515, 1, 0.5764706, 0, 1,
-1.269307, -1.099879, -2.586695, 1, 0.5803922, 0, 1,
-1.25224, -0.5743293, -0.9990509, 1, 0.5882353, 0, 1,
-1.25039, 0.2234675, -2.521594, 1, 0.5921569, 0, 1,
-1.248829, 0.01943884, -1.972, 1, 0.6, 0, 1,
-1.246898, 0.7060623, -0.7493107, 1, 0.6078432, 0, 1,
-1.238366, -1.39666, -2.799716, 1, 0.6117647, 0, 1,
-1.235569, -0.7490443, -1.052759, 1, 0.6196079, 0, 1,
-1.22543, -0.2234052, -1.218869, 1, 0.6235294, 0, 1,
-1.225376, -0.8794872, -1.50834, 1, 0.6313726, 0, 1,
-1.218705, 0.6976467, -1.480239, 1, 0.6352941, 0, 1,
-1.21609, 0.3051229, -0.3662788, 1, 0.6431373, 0, 1,
-1.206594, 0.0766001, -1.460313, 1, 0.6470588, 0, 1,
-1.201354, -1.867759, -1.229741, 1, 0.654902, 0, 1,
-1.201292, -0.442539, -2.310877, 1, 0.6588235, 0, 1,
-1.199881, 0.587543, -2.511257, 1, 0.6666667, 0, 1,
-1.199676, 0.08201297, -1.223335, 1, 0.6705883, 0, 1,
-1.191394, 0.4664317, -1.399764, 1, 0.6784314, 0, 1,
-1.185127, 1.169161, 0.6086696, 1, 0.682353, 0, 1,
-1.183816, -0.4816185, -2.902578, 1, 0.6901961, 0, 1,
-1.182023, 0.8969735, -0.4744391, 1, 0.6941177, 0, 1,
-1.181177, 0.482404, -1.970586, 1, 0.7019608, 0, 1,
-1.180615, -1.644578, -1.635506, 1, 0.7098039, 0, 1,
-1.167673, 0.247135, -1.017441, 1, 0.7137255, 0, 1,
-1.161289, -0.7676994, -3.30542, 1, 0.7215686, 0, 1,
-1.159638, 0.03483543, -1.856857, 1, 0.7254902, 0, 1,
-1.150549, 0.6223613, -0.162152, 1, 0.7333333, 0, 1,
-1.142577, 0.8937659, -1.225852, 1, 0.7372549, 0, 1,
-1.140153, -0.8404019, -2.102769, 1, 0.7450981, 0, 1,
-1.14009, -0.4978738, -1.024632, 1, 0.7490196, 0, 1,
-1.137079, 0.1834556, -0.1209392, 1, 0.7568628, 0, 1,
-1.136282, 0.599941, -1.742069, 1, 0.7607843, 0, 1,
-1.135433, 1.237693, 0.1905928, 1, 0.7686275, 0, 1,
-1.132088, -0.0007140816, -0.6868873, 1, 0.772549, 0, 1,
-1.131131, -0.9951492, -2.928483, 1, 0.7803922, 0, 1,
-1.12203, -0.9911232, -0.2390598, 1, 0.7843137, 0, 1,
-1.116506, 0.7372994, -2.637417, 1, 0.7921569, 0, 1,
-1.107864, 0.4525802, -2.378536, 1, 0.7960784, 0, 1,
-1.09921, 0.7331836, -0.0733088, 1, 0.8039216, 0, 1,
-1.095545, -0.06144234, -0.3968563, 1, 0.8117647, 0, 1,
-1.093431, -0.2419693, -2.188307, 1, 0.8156863, 0, 1,
-1.088717, 0.8390843, 0.04576885, 1, 0.8235294, 0, 1,
-1.086002, -0.2151705, -2.822469, 1, 0.827451, 0, 1,
-1.083687, -0.9928148, -3.405486, 1, 0.8352941, 0, 1,
-1.082255, -1.439201, -3.481461, 1, 0.8392157, 0, 1,
-1.081921, -0.6470812, -2.293314, 1, 0.8470588, 0, 1,
-1.075465, 0.5739859, -1.495039, 1, 0.8509804, 0, 1,
-1.074686, -0.6752815, 0.6051036, 1, 0.8588235, 0, 1,
-1.069196, 0.8239669, -2.627741, 1, 0.8627451, 0, 1,
-1.066691, -1.715064, -2.765744, 1, 0.8705882, 0, 1,
-1.064112, 0.7488661, -0.3098658, 1, 0.8745098, 0, 1,
-1.059924, -1.029526, -1.181517, 1, 0.8823529, 0, 1,
-1.054333, -0.9708415, -2.159255, 1, 0.8862745, 0, 1,
-1.051472, -0.8534569, -1.502887, 1, 0.8941177, 0, 1,
-1.041776, 0.1134245, -2.702556, 1, 0.8980392, 0, 1,
-1.034684, -2.050808, -1.357819, 1, 0.9058824, 0, 1,
-1.031218, -0.3677343, -3.438416, 1, 0.9137255, 0, 1,
-1.028192, 0.02061102, -2.277351, 1, 0.9176471, 0, 1,
-1.026265, -1.145545, -4.154068, 1, 0.9254902, 0, 1,
-1.023377, -0.2244321, -1.387463, 1, 0.9294118, 0, 1,
-1.022542, 0.05324952, -0.5361511, 1, 0.9372549, 0, 1,
-1.007241, -0.13033, -0.9577553, 1, 0.9411765, 0, 1,
-1.00686, -0.8918911, -1.818557, 1, 0.9490196, 0, 1,
-1.002321, 0.9614437, -0.09459113, 1, 0.9529412, 0, 1,
-0.9945265, 1.83118, -0.2692566, 1, 0.9607843, 0, 1,
-0.9937003, 1.479833, -0.7192633, 1, 0.9647059, 0, 1,
-0.9887273, -0.6040337, -3.521045, 1, 0.972549, 0, 1,
-0.9880858, -0.4860532, -2.690048, 1, 0.9764706, 0, 1,
-0.9855095, -0.7954296, -2.199424, 1, 0.9843137, 0, 1,
-0.9830101, 0.6783888, -1.863624, 1, 0.9882353, 0, 1,
-0.9826733, 1.181091, -0.4192299, 1, 0.9960784, 0, 1,
-0.9780219, 1.491834, -0.6473826, 0.9960784, 1, 0, 1,
-0.9699346, 0.3275874, -3.188936, 0.9921569, 1, 0, 1,
-0.9672751, -2.215854, -2.257109, 0.9843137, 1, 0, 1,
-0.9632006, -0.1380869, -2.174182, 0.9803922, 1, 0, 1,
-0.9575834, 1.545182, -0.3355295, 0.972549, 1, 0, 1,
-0.9546719, -0.4758657, -0.6549441, 0.9686275, 1, 0, 1,
-0.9523204, 1.272584, -0.8729224, 0.9607843, 1, 0, 1,
-0.9436862, 0.8977273, 0.06891861, 0.9568627, 1, 0, 1,
-0.9429861, -0.2180745, -1.684309, 0.9490196, 1, 0, 1,
-0.9401607, 0.8073561, -0.7330903, 0.945098, 1, 0, 1,
-0.9400553, 0.9154144, 0.2261724, 0.9372549, 1, 0, 1,
-0.9381837, 2.244476, 0.8965367, 0.9333333, 1, 0, 1,
-0.9305264, -0.1399672, -4.206944, 0.9254902, 1, 0, 1,
-0.9286907, -0.3334338, -1.26266, 0.9215686, 1, 0, 1,
-0.9228632, 1.172674, -2.606423, 0.9137255, 1, 0, 1,
-0.9119845, -0.8983731, -2.989006, 0.9098039, 1, 0, 1,
-0.9114354, -0.2731774, -1.337273, 0.9019608, 1, 0, 1,
-0.9089671, 0.05347425, -1.6601, 0.8941177, 1, 0, 1,
-0.9089094, 0.3725381, 0.1050117, 0.8901961, 1, 0, 1,
-0.9036881, -1.308614, -2.727288, 0.8823529, 1, 0, 1,
-0.8996869, 0.590496, -1.277485, 0.8784314, 1, 0, 1,
-0.8798938, 0.4262803, -0.2211467, 0.8705882, 1, 0, 1,
-0.8772972, -0.8076432, -1.864897, 0.8666667, 1, 0, 1,
-0.8748287, 0.006850506, -2.01601, 0.8588235, 1, 0, 1,
-0.8713766, -0.4226563, -0.846185, 0.854902, 1, 0, 1,
-0.8645108, -0.9625613, -2.481394, 0.8470588, 1, 0, 1,
-0.8495207, 0.844148, 0.3822734, 0.8431373, 1, 0, 1,
-0.8487366, 0.6390161, -1.526248, 0.8352941, 1, 0, 1,
-0.8455817, 0.2664922, -1.545465, 0.8313726, 1, 0, 1,
-0.8369765, 0.2090451, -0.6989191, 0.8235294, 1, 0, 1,
-0.8333191, 0.4852099, -2.422997, 0.8196079, 1, 0, 1,
-0.8254923, 2.053947, -0.4005374, 0.8117647, 1, 0, 1,
-0.8208568, -0.7414426, -1.785904, 0.8078431, 1, 0, 1,
-0.8147824, 0.1302394, -1.607352, 0.8, 1, 0, 1,
-0.8085153, 0.4988439, -0.8421784, 0.7921569, 1, 0, 1,
-0.8080949, -0.3849212, 0.09764665, 0.7882353, 1, 0, 1,
-0.8015335, -2.0396, -2.30041, 0.7803922, 1, 0, 1,
-0.8009, -0.08891981, -2.233541, 0.7764706, 1, 0, 1,
-0.7961431, 0.631067, -0.6956347, 0.7686275, 1, 0, 1,
-0.79471, -0.1963397, -1.048063, 0.7647059, 1, 0, 1,
-0.787419, 1.593286, -0.3373474, 0.7568628, 1, 0, 1,
-0.7858469, -1.511883, -4.092443, 0.7529412, 1, 0, 1,
-0.7847194, -1.423855, -1.839754, 0.7450981, 1, 0, 1,
-0.7765198, -1.08041, -4.534286, 0.7411765, 1, 0, 1,
-0.776465, 0.4013042, -1.435563, 0.7333333, 1, 0, 1,
-0.7687207, 0.6392012, 0.3353526, 0.7294118, 1, 0, 1,
-0.7649254, -0.5959824, -2.717632, 0.7215686, 1, 0, 1,
-0.7602732, -0.6157316, -2.740274, 0.7176471, 1, 0, 1,
-0.7577264, -0.9983696, -2.656771, 0.7098039, 1, 0, 1,
-0.754221, 2.106566, -1.792504, 0.7058824, 1, 0, 1,
-0.7537906, -1.767729, -2.408417, 0.6980392, 1, 0, 1,
-0.7460431, 1.425824, -0.1458549, 0.6901961, 1, 0, 1,
-0.7440743, -0.3790679, -1.976979, 0.6862745, 1, 0, 1,
-0.7406616, 0.494989, -1.775138, 0.6784314, 1, 0, 1,
-0.7348115, -0.7709181, -0.5272624, 0.6745098, 1, 0, 1,
-0.7342713, 0.257876, -3.271388, 0.6666667, 1, 0, 1,
-0.7317619, -0.114286, -0.8917537, 0.6627451, 1, 0, 1,
-0.7213472, 0.8912757, -0.2392011, 0.654902, 1, 0, 1,
-0.7210968, -0.01279625, 0.1011548, 0.6509804, 1, 0, 1,
-0.7203135, -1.297843, -3.468038, 0.6431373, 1, 0, 1,
-0.7182218, 0.445224, -0.3246865, 0.6392157, 1, 0, 1,
-0.715916, -0.419738, -0.3277576, 0.6313726, 1, 0, 1,
-0.7143239, 0.1845668, -0.1880163, 0.627451, 1, 0, 1,
-0.7129598, 0.05116959, -0.1740853, 0.6196079, 1, 0, 1,
-0.7097188, 1.118855, -0.8198558, 0.6156863, 1, 0, 1,
-0.7082223, -0.7795193, -3.15071, 0.6078432, 1, 0, 1,
-0.7056345, -0.07555829, -0.9104657, 0.6039216, 1, 0, 1,
-0.7028822, 1.33541, -0.9882382, 0.5960785, 1, 0, 1,
-0.7024456, -2.1705, -2.567678, 0.5882353, 1, 0, 1,
-0.701461, -1.027964, -2.757794, 0.5843138, 1, 0, 1,
-0.693742, -1.097348, -1.135858, 0.5764706, 1, 0, 1,
-0.6866035, -0.08420491, -1.354243, 0.572549, 1, 0, 1,
-0.6865636, 0.003608857, -2.869473, 0.5647059, 1, 0, 1,
-0.684586, -0.6746969, -3.16348, 0.5607843, 1, 0, 1,
-0.682072, 0.6827325, -1.475125, 0.5529412, 1, 0, 1,
-0.6771358, -0.4704548, -1.338433, 0.5490196, 1, 0, 1,
-0.6753555, 0.906652, -2.203873, 0.5411765, 1, 0, 1,
-0.6731082, 0.05750626, -2.585615, 0.5372549, 1, 0, 1,
-0.6723846, 0.9170159, -0.5018222, 0.5294118, 1, 0, 1,
-0.670096, -1.73351, -3.759811, 0.5254902, 1, 0, 1,
-0.6682835, 0.3030536, -0.1800854, 0.5176471, 1, 0, 1,
-0.6568878, 0.4625104, -0.4754114, 0.5137255, 1, 0, 1,
-0.6449544, 0.7514862, -0.1130223, 0.5058824, 1, 0, 1,
-0.6429914, -2.076206, -3.419447, 0.5019608, 1, 0, 1,
-0.6428931, -0.3280567, -2.050204, 0.4941176, 1, 0, 1,
-0.6414538, -0.791468, -3.144318, 0.4862745, 1, 0, 1,
-0.6405576, 0.1426408, -2.170588, 0.4823529, 1, 0, 1,
-0.6386363, 1.604846, 0.1657704, 0.4745098, 1, 0, 1,
-0.6350772, -0.1644474, -2.443014, 0.4705882, 1, 0, 1,
-0.6304933, 0.113779, -0.4863735, 0.4627451, 1, 0, 1,
-0.6282524, 1.927246, -1.258304, 0.4588235, 1, 0, 1,
-0.6223205, 1.595739, -1.187606, 0.4509804, 1, 0, 1,
-0.6203728, -1.175862, -2.643215, 0.4470588, 1, 0, 1,
-0.6185526, -0.4613511, -1.779233, 0.4392157, 1, 0, 1,
-0.6086435, -0.1310325, -1.577186, 0.4352941, 1, 0, 1,
-0.6083696, -0.3726785, -3.067171, 0.427451, 1, 0, 1,
-0.6079068, -0.06485955, -1.242438, 0.4235294, 1, 0, 1,
-0.6042656, -1.213843, -1.715061, 0.4156863, 1, 0, 1,
-0.6034782, -1.075158, -1.56634, 0.4117647, 1, 0, 1,
-0.6026449, -0.3806028, -1.787944, 0.4039216, 1, 0, 1,
-0.6019753, -1.241721, -2.261504, 0.3960784, 1, 0, 1,
-0.6017395, -0.8248232, -2.858767, 0.3921569, 1, 0, 1,
-0.5989099, 1.417572, -1.495707, 0.3843137, 1, 0, 1,
-0.5983832, 0.8359098, -1.182638, 0.3803922, 1, 0, 1,
-0.5976215, -2.317659, -3.442637, 0.372549, 1, 0, 1,
-0.59384, 0.2041757, -1.063832, 0.3686275, 1, 0, 1,
-0.5900279, -1.242646, -3.167498, 0.3607843, 1, 0, 1,
-0.5892093, -0.7450802, 0.3547318, 0.3568628, 1, 0, 1,
-0.5736426, 0.2877375, -2.294884, 0.3490196, 1, 0, 1,
-0.5633126, -0.9875878, -4.901273, 0.345098, 1, 0, 1,
-0.5631073, 2.344915, 0.5514963, 0.3372549, 1, 0, 1,
-0.5574163, -1.64024, -2.196882, 0.3333333, 1, 0, 1,
-0.5566423, -0.03332418, -3.463618, 0.3254902, 1, 0, 1,
-0.5516527, -1.822477, -2.80827, 0.3215686, 1, 0, 1,
-0.5515642, -1.118525, -2.450646, 0.3137255, 1, 0, 1,
-0.5515085, -1.675103, -2.19704, 0.3098039, 1, 0, 1,
-0.5486143, -1.499332, -3.808223, 0.3019608, 1, 0, 1,
-0.5484153, -0.09655997, -1.675806, 0.2941177, 1, 0, 1,
-0.5483296, 1.781817, 1.08316, 0.2901961, 1, 0, 1,
-0.5469878, 0.3540006, -1.950048, 0.282353, 1, 0, 1,
-0.5434011, -0.1136285, -4.329942, 0.2784314, 1, 0, 1,
-0.5424513, 2.685625, -0.8021103, 0.2705882, 1, 0, 1,
-0.5391647, -0.2632052, -2.892436, 0.2666667, 1, 0, 1,
-0.5260258, 0.6431893, -1.683111, 0.2588235, 1, 0, 1,
-0.519116, 0.195145, -1.207203, 0.254902, 1, 0, 1,
-0.5181037, -0.1925124, -1.141147, 0.2470588, 1, 0, 1,
-0.5107566, -0.7572754, -2.043743, 0.2431373, 1, 0, 1,
-0.5102513, -1.412781, -0.5159574, 0.2352941, 1, 0, 1,
-0.5086972, 1.527155, 0.7557831, 0.2313726, 1, 0, 1,
-0.5078398, -1.357095, -2.695379, 0.2235294, 1, 0, 1,
-0.5064708, -0.5984169, -2.958916, 0.2196078, 1, 0, 1,
-0.5040594, -0.2735289, -1.928218, 0.2117647, 1, 0, 1,
-0.4967606, 1.532094, -1.102417, 0.2078431, 1, 0, 1,
-0.4959414, -0.6397192, -2.394509, 0.2, 1, 0, 1,
-0.4865032, 1.146267, -1.457633, 0.1921569, 1, 0, 1,
-0.4852054, -0.1121567, -1.39037, 0.1882353, 1, 0, 1,
-0.4815919, 0.4462799, -0.5666081, 0.1803922, 1, 0, 1,
-0.4803156, 0.888371, -0.9613215, 0.1764706, 1, 0, 1,
-0.4756297, 1.087109, -0.9688866, 0.1686275, 1, 0, 1,
-0.4734238, -0.2526106, -4.248269, 0.1647059, 1, 0, 1,
-0.4733948, -1.131293, -1.314996, 0.1568628, 1, 0, 1,
-0.4728056, -1.691851, -2.585855, 0.1529412, 1, 0, 1,
-0.4690154, -2.421952, -4.002356, 0.145098, 1, 0, 1,
-0.4675821, -1.242515, -2.564169, 0.1411765, 1, 0, 1,
-0.4671425, 0.9598754, -1.328925, 0.1333333, 1, 0, 1,
-0.4650859, -1.601046, -2.1868, 0.1294118, 1, 0, 1,
-0.4637115, -0.259513, -2.509146, 0.1215686, 1, 0, 1,
-0.4635471, 0.1027234, -2.337137, 0.1176471, 1, 0, 1,
-0.459769, 0.5845802, -0.9308115, 0.1098039, 1, 0, 1,
-0.4577128, -0.2695946, -3.021489, 0.1058824, 1, 0, 1,
-0.451235, -0.4934931, -2.799491, 0.09803922, 1, 0, 1,
-0.4510602, 0.6018414, 0.6223851, 0.09019608, 1, 0, 1,
-0.4490748, 0.1278028, -2.015628, 0.08627451, 1, 0, 1,
-0.4462877, -1.817623, -3.901034, 0.07843138, 1, 0, 1,
-0.4454715, -0.869829, -3.145514, 0.07450981, 1, 0, 1,
-0.4381305, 1.338424, -0.7945627, 0.06666667, 1, 0, 1,
-0.4358446, 0.6107327, -0.1104924, 0.0627451, 1, 0, 1,
-0.4227531, -1.57766, -0.5631222, 0.05490196, 1, 0, 1,
-0.4206446, 0.4022733, -1.321665, 0.05098039, 1, 0, 1,
-0.4171146, 0.2761096, -1.375794, 0.04313726, 1, 0, 1,
-0.4166415, 1.413911, 0.5707824, 0.03921569, 1, 0, 1,
-0.4159405, -0.5515438, -2.477942, 0.03137255, 1, 0, 1,
-0.412416, -0.2632907, -3.56115, 0.02745098, 1, 0, 1,
-0.4057611, 0.08801419, -1.107904, 0.01960784, 1, 0, 1,
-0.4053722, -0.7441468, -1.569126, 0.01568628, 1, 0, 1,
-0.402711, -0.0260311, -1.837501, 0.007843138, 1, 0, 1,
-0.4004554, -0.8638399, -1.859741, 0.003921569, 1, 0, 1,
-0.3997975, -0.7711118, -2.438562, 0, 1, 0.003921569, 1,
-0.3938383, -0.1365573, -1.727481, 0, 1, 0.01176471, 1,
-0.392477, -1.331545, -3.704818, 0, 1, 0.01568628, 1,
-0.3913261, -1.223989, -4.757486, 0, 1, 0.02352941, 1,
-0.3900232, 0.8519455, -0.1093754, 0, 1, 0.02745098, 1,
-0.3893026, -0.8206517, -3.289829, 0, 1, 0.03529412, 1,
-0.3863331, -0.2005013, -1.514267, 0, 1, 0.03921569, 1,
-0.3807761, -0.9187562, -2.434575, 0, 1, 0.04705882, 1,
-0.3780642, -1.181522, -2.758884, 0, 1, 0.05098039, 1,
-0.3741503, 0.3129679, -0.5974917, 0, 1, 0.05882353, 1,
-0.3728985, -0.5748485, -2.375653, 0, 1, 0.0627451, 1,
-0.3726798, 0.8671841, -1.978284, 0, 1, 0.07058824, 1,
-0.3680071, 0.6394222, -0.1623013, 0, 1, 0.07450981, 1,
-0.3673983, 1.176193, -1.23973, 0, 1, 0.08235294, 1,
-0.3665822, 1.562041, -2.497035, 0, 1, 0.08627451, 1,
-0.365927, 0.3568072, -0.3118984, 0, 1, 0.09411765, 1,
-0.365174, -1.233955, -1.880687, 0, 1, 0.1019608, 1,
-0.3646245, -1.339758, -1.136819, 0, 1, 0.1058824, 1,
-0.3644527, -0.8220948, -2.892364, 0, 1, 0.1137255, 1,
-0.3625173, 1.183914, -0.6911357, 0, 1, 0.1176471, 1,
-0.3610207, -0.2175892, -1.264756, 0, 1, 0.1254902, 1,
-0.3591176, 2.419739, -0.4466533, 0, 1, 0.1294118, 1,
-0.3573167, -1.23963, -2.666409, 0, 1, 0.1372549, 1,
-0.3545541, 0.4349794, -1.892963, 0, 1, 0.1411765, 1,
-0.3544346, 1.06642, -0.2751006, 0, 1, 0.1490196, 1,
-0.3541324, 0.9392756, -0.3328282, 0, 1, 0.1529412, 1,
-0.3534332, 0.3981353, -2.619883, 0, 1, 0.1607843, 1,
-0.3505948, 0.1235063, -1.00691, 0, 1, 0.1647059, 1,
-0.3464406, -0.6196434, -2.1305, 0, 1, 0.172549, 1,
-0.3461027, -0.9510291, -2.39757, 0, 1, 0.1764706, 1,
-0.3357759, -0.07996802, -2.134677, 0, 1, 0.1843137, 1,
-0.3353697, 0.4441032, -0.4940082, 0, 1, 0.1882353, 1,
-0.3352986, 0.6161171, -0.4964948, 0, 1, 0.1960784, 1,
-0.3351612, -1.612532, -3.438764, 0, 1, 0.2039216, 1,
-0.3335213, -0.6951281, -3.102198, 0, 1, 0.2078431, 1,
-0.3334009, -2.436513, -3.267982, 0, 1, 0.2156863, 1,
-0.3315212, -0.3933047, -3.156153, 0, 1, 0.2196078, 1,
-0.3314217, -0.4163042, -3.380515, 0, 1, 0.227451, 1,
-0.3268407, 0.6626961, -0.1092104, 0, 1, 0.2313726, 1,
-0.3229823, -0.6522775, -4.15926, 0, 1, 0.2392157, 1,
-0.3202324, 1.156294, -0.8993873, 0, 1, 0.2431373, 1,
-0.316965, -0.01526679, -1.7654, 0, 1, 0.2509804, 1,
-0.316645, -0.2379784, -2.362524, 0, 1, 0.254902, 1,
-0.3147702, 1.40952, 0.6201096, 0, 1, 0.2627451, 1,
-0.3135245, -2.046325, -2.456557, 0, 1, 0.2666667, 1,
-0.3060657, 0.9286378, -0.1239135, 0, 1, 0.2745098, 1,
-0.3028801, -0.5220158, -2.169796, 0, 1, 0.2784314, 1,
-0.3017409, -1.372733, -3.631698, 0, 1, 0.2862745, 1,
-0.3013076, -1.434706, -0.9055787, 0, 1, 0.2901961, 1,
-0.2992443, -0.1818486, -0.4037754, 0, 1, 0.2980392, 1,
-0.2964423, 0.679517, -1.591492, 0, 1, 0.3058824, 1,
-0.2959777, -1.331574, -4.599506, 0, 1, 0.3098039, 1,
-0.2916377, -0.8764811, -3.822004, 0, 1, 0.3176471, 1,
-0.2874119, 0.08738719, -0.2764958, 0, 1, 0.3215686, 1,
-0.2871039, -0.234762, -1.507122, 0, 1, 0.3294118, 1,
-0.2863629, -0.2091366, -2.241745, 0, 1, 0.3333333, 1,
-0.2814445, 0.4880967, -1.694739, 0, 1, 0.3411765, 1,
-0.2812999, -0.6460209, -1.808125, 0, 1, 0.345098, 1,
-0.2760565, -1.036531, -4.484667, 0, 1, 0.3529412, 1,
-0.2714169, 0.4948796, 0.910902, 0, 1, 0.3568628, 1,
-0.2705189, -1.050926, -3.858247, 0, 1, 0.3647059, 1,
-0.2701051, -2.084968, -4.394071, 0, 1, 0.3686275, 1,
-0.268822, -0.9131186, -0.9570735, 0, 1, 0.3764706, 1,
-0.2686217, -0.8078948, -3.090698, 0, 1, 0.3803922, 1,
-0.267688, -1.382087, -2.27558, 0, 1, 0.3882353, 1,
-0.264697, -0.7240209, -3.346606, 0, 1, 0.3921569, 1,
-0.2544516, -0.777919, -5.102056, 0, 1, 0.4, 1,
-0.2536499, 1.045367, -1.326415, 0, 1, 0.4078431, 1,
-0.2529571, 0.1982323, -0.8038812, 0, 1, 0.4117647, 1,
-0.2499105, -1.424815, -5.01359, 0, 1, 0.4196078, 1,
-0.2414122, -0.9387821, -1.929968, 0, 1, 0.4235294, 1,
-0.2386416, -0.366014, -2.324747, 0, 1, 0.4313726, 1,
-0.2363258, 1.87043, 0.7644003, 0, 1, 0.4352941, 1,
-0.2362398, -0.6108497, -1.118195, 0, 1, 0.4431373, 1,
-0.232113, 0.2833804, -0.4447157, 0, 1, 0.4470588, 1,
-0.2308314, -0.6331094, -3.048559, 0, 1, 0.454902, 1,
-0.2300059, -0.1618931, -2.724491, 0, 1, 0.4588235, 1,
-0.2294596, -1.076135, -3.572546, 0, 1, 0.4666667, 1,
-0.2135899, 0.4413659, -1.557918, 0, 1, 0.4705882, 1,
-0.2113229, -0.07108134, -2.007449, 0, 1, 0.4784314, 1,
-0.208414, -0.5412427, -2.292856, 0, 1, 0.4823529, 1,
-0.2069462, -1.855172, -2.466249, 0, 1, 0.4901961, 1,
-0.2030045, 1.483235, -1.433405, 0, 1, 0.4941176, 1,
-0.1987103, -0.9695137, -3.398386, 0, 1, 0.5019608, 1,
-0.1985753, 0.9236118, 0.7123269, 0, 1, 0.509804, 1,
-0.1981578, 0.6034302, 1.197465, 0, 1, 0.5137255, 1,
-0.1969666, -1.388424, -2.639658, 0, 1, 0.5215687, 1,
-0.1869604, -0.2554382, -3.521697, 0, 1, 0.5254902, 1,
-0.1856445, 0.3643465, -1.454221, 0, 1, 0.5333334, 1,
-0.185497, 0.03221774, -0.06595027, 0, 1, 0.5372549, 1,
-0.1838234, 2.04709, 1.453328, 0, 1, 0.5450981, 1,
-0.1828383, 1.009254, -1.130494, 0, 1, 0.5490196, 1,
-0.1808114, 0.4368639, 0.3464141, 0, 1, 0.5568628, 1,
-0.1790168, -0.1920962, -3.639939, 0, 1, 0.5607843, 1,
-0.173935, 0.032315, -2.041466, 0, 1, 0.5686275, 1,
-0.1738492, 1.261092, -0.542127, 0, 1, 0.572549, 1,
-0.17097, 1.101639, -2.784066, 0, 1, 0.5803922, 1,
-0.1703148, 0.4948723, 0.7416505, 0, 1, 0.5843138, 1,
-0.1665291, -0.8795351, -3.204406, 0, 1, 0.5921569, 1,
-0.1648385, -0.5763139, -3.532009, 0, 1, 0.5960785, 1,
-0.1617824, -1.049966, -3.188693, 0, 1, 0.6039216, 1,
-0.1604838, 0.9563823, 0.3270125, 0, 1, 0.6117647, 1,
-0.1590997, -0.08806265, -1.292444, 0, 1, 0.6156863, 1,
-0.1566003, -1.044839, -3.378015, 0, 1, 0.6235294, 1,
-0.1554596, 0.4020291, -0.529194, 0, 1, 0.627451, 1,
-0.1552799, -0.2368461, -3.711635, 0, 1, 0.6352941, 1,
-0.1535891, 1.284878, 0.4959572, 0, 1, 0.6392157, 1,
-0.1521956, -0.3244337, -2.692213, 0, 1, 0.6470588, 1,
-0.1489844, 1.52623, 0.8769537, 0, 1, 0.6509804, 1,
-0.1393207, -2.094588, -2.486105, 0, 1, 0.6588235, 1,
-0.1393206, -1.295524, -4.041564, 0, 1, 0.6627451, 1,
-0.1334111, -1.063067, -3.735795, 0, 1, 0.6705883, 1,
-0.129391, -0.4560633, -1.855793, 0, 1, 0.6745098, 1,
-0.1284491, -0.2314657, -0.8618904, 0, 1, 0.682353, 1,
-0.1279336, -1.20434, -1.975643, 0, 1, 0.6862745, 1,
-0.124055, -0.8374965, -2.478323, 0, 1, 0.6941177, 1,
-0.1208937, -0.8768567, -2.410855, 0, 1, 0.7019608, 1,
-0.1184825, -1.248291, -2.008342, 0, 1, 0.7058824, 1,
-0.1184183, 2.027668, 0.4549159, 0, 1, 0.7137255, 1,
-0.1161604, 0.2238199, -1.004453, 0, 1, 0.7176471, 1,
-0.1159618, -0.6037563, -3.750039, 0, 1, 0.7254902, 1,
-0.1158661, -2.143315, -3.956108, 0, 1, 0.7294118, 1,
-0.1152654, 2.943199, -0.4008489, 0, 1, 0.7372549, 1,
-0.1147474, 1.979558, -0.2763681, 0, 1, 0.7411765, 1,
-0.1141426, 1.420011, -0.09007263, 0, 1, 0.7490196, 1,
-0.1133572, -1.67518, -3.727428, 0, 1, 0.7529412, 1,
-0.1091902, 0.1517595, -1.866902, 0, 1, 0.7607843, 1,
-0.1049715, -1.453248, -3.386646, 0, 1, 0.7647059, 1,
-0.1011266, -0.2771797, -2.029627, 0, 1, 0.772549, 1,
-0.1010308, -0.1077257, -3.18338, 0, 1, 0.7764706, 1,
-0.09929871, 0.3000419, 0.5980149, 0, 1, 0.7843137, 1,
-0.09518944, 0.2966963, -0.5133798, 0, 1, 0.7882353, 1,
-0.09072458, 0.07759971, -0.8631479, 0, 1, 0.7960784, 1,
-0.08795352, -0.9189463, -2.225162, 0, 1, 0.8039216, 1,
-0.08656655, -1.131938, -2.997276, 0, 1, 0.8078431, 1,
-0.08556228, 0.7223166, 0.6426178, 0, 1, 0.8156863, 1,
-0.07851589, 1.309016, -0.6154324, 0, 1, 0.8196079, 1,
-0.07806266, -0.9941882, -2.253392, 0, 1, 0.827451, 1,
-0.07097901, 0.64991, -1.061562, 0, 1, 0.8313726, 1,
-0.06992748, -1.062837, -4.960849, 0, 1, 0.8392157, 1,
-0.0659736, -0.2362477, -3.473036, 0, 1, 0.8431373, 1,
-0.06427273, 0.1460799, -0.4644319, 0, 1, 0.8509804, 1,
-0.06364547, 0.3807912, 0.3116049, 0, 1, 0.854902, 1,
-0.05999906, 0.3151259, 0.2421501, 0, 1, 0.8627451, 1,
-0.05788843, 0.07462127, -1.187624, 0, 1, 0.8666667, 1,
-0.05747571, 0.635125, -0.545877, 0, 1, 0.8745098, 1,
-0.05727248, 0.9738769, -1.574872, 0, 1, 0.8784314, 1,
-0.05674032, -0.2448223, -2.094759, 0, 1, 0.8862745, 1,
-0.04849624, 0.646585, 0.01303491, 0, 1, 0.8901961, 1,
-0.04839642, 0.7742279, 0.1775228, 0, 1, 0.8980392, 1,
-0.04796044, -0.1707857, -4.341296, 0, 1, 0.9058824, 1,
-0.04112753, -0.3697266, -2.225149, 0, 1, 0.9098039, 1,
-0.04060881, -1.977055, -2.710814, 0, 1, 0.9176471, 1,
-0.03783116, 1.765087, -1.429912, 0, 1, 0.9215686, 1,
-0.03445124, -0.3306888, -2.947206, 0, 1, 0.9294118, 1,
-0.02794968, -0.4186677, -3.840315, 0, 1, 0.9333333, 1,
-0.02509445, -0.9183325, -3.564103, 0, 1, 0.9411765, 1,
-0.02271015, -0.3516037, -2.226882, 0, 1, 0.945098, 1,
-0.02155665, 0.1844011, -0.1617465, 0, 1, 0.9529412, 1,
-0.01995792, 0.2961013, -0.5753326, 0, 1, 0.9568627, 1,
-0.01465604, -1.429, -3.39928, 0, 1, 0.9647059, 1,
-0.01462118, 0.5674151, -0.2509393, 0, 1, 0.9686275, 1,
-0.01326608, 1.550701, 0.03304055, 0, 1, 0.9764706, 1,
-0.01284739, 0.1498619, 0.06048014, 0, 1, 0.9803922, 1,
-0.01229723, -0.4746473, -3.167732, 0, 1, 0.9882353, 1,
-0.009984327, 0.02514499, -0.6092693, 0, 1, 0.9921569, 1,
-0.006592066, 0.6916299, 0.540278, 0, 1, 1, 1,
-0.004778635, 0.3745502, -0.5461239, 0, 0.9921569, 1, 1,
-0.004735364, -0.9173714, -3.014381, 0, 0.9882353, 1, 1,
-0.004193023, 0.1484804, 0.5471866, 0, 0.9803922, 1, 1,
0.0002273034, -0.2754094, 1.268311, 0, 0.9764706, 1, 1,
0.0003372872, 0.943925, -0.5915677, 0, 0.9686275, 1, 1,
0.003648661, -1.670243, 3.988946, 0, 0.9647059, 1, 1,
0.005465226, 2.303294, -0.3747834, 0, 0.9568627, 1, 1,
0.008034911, 1.471306, -1.018579, 0, 0.9529412, 1, 1,
0.008831988, 0.6440707, 0.02386826, 0, 0.945098, 1, 1,
0.009880973, 0.2392221, 0.4737515, 0, 0.9411765, 1, 1,
0.01124468, -0.3970219, 2.838259, 0, 0.9333333, 1, 1,
0.01287694, 1.901958, 0.01811186, 0, 0.9294118, 1, 1,
0.01939964, -0.8587021, 5.043633, 0, 0.9215686, 1, 1,
0.02337781, -1.087816, 1.804858, 0, 0.9176471, 1, 1,
0.02822733, 0.670296, 0.5202259, 0, 0.9098039, 1, 1,
0.03347306, -0.8316495, 4.721115, 0, 0.9058824, 1, 1,
0.03498697, 1.622163, -0.8268254, 0, 0.8980392, 1, 1,
0.03540701, 0.9068788, -1.0551, 0, 0.8901961, 1, 1,
0.03836212, 1.291074, 0.8498753, 0, 0.8862745, 1, 1,
0.03924102, 0.5334559, -0.9856055, 0, 0.8784314, 1, 1,
0.04421353, -0.7581207, 1.782978, 0, 0.8745098, 1, 1,
0.05016809, -0.4533927, 3.813543, 0, 0.8666667, 1, 1,
0.05317714, 0.7064142, -1.173578, 0, 0.8627451, 1, 1,
0.05456343, 1.989876, 0.6307375, 0, 0.854902, 1, 1,
0.05480376, -0.8830123, 2.12233, 0, 0.8509804, 1, 1,
0.05714101, 0.8316452, -0.6325589, 0, 0.8431373, 1, 1,
0.06008331, -1.295973, 2.588884, 0, 0.8392157, 1, 1,
0.06262954, -2.133735, 1.799713, 0, 0.8313726, 1, 1,
0.06430251, -0.7997156, 3.642745, 0, 0.827451, 1, 1,
0.06572536, 0.3232311, 0.9713595, 0, 0.8196079, 1, 1,
0.06607787, 0.8967286, 1.006913, 0, 0.8156863, 1, 1,
0.06779507, -1.319859, -0.05251773, 0, 0.8078431, 1, 1,
0.07382114, -0.6433848, 1.885828, 0, 0.8039216, 1, 1,
0.07580416, 1.25263, -0.372009, 0, 0.7960784, 1, 1,
0.08397774, 0.8231811, -0.3657924, 0, 0.7882353, 1, 1,
0.09035557, 0.4597847, 0.5748205, 0, 0.7843137, 1, 1,
0.09549126, -1.042427, 1.637072, 0, 0.7764706, 1, 1,
0.09885292, -1.110046, 2.726724, 0, 0.772549, 1, 1,
0.09976818, -1.295476, 1.209293, 0, 0.7647059, 1, 1,
0.1001841, 1.530231, 1.172033, 0, 0.7607843, 1, 1,
0.1002438, -0.4897704, 2.643143, 0, 0.7529412, 1, 1,
0.1017141, 0.02150226, 1.503751, 0, 0.7490196, 1, 1,
0.102522, -1.251354, 5.095733, 0, 0.7411765, 1, 1,
0.1039227, -0.01863566, 2.569354, 0, 0.7372549, 1, 1,
0.1072669, -0.6268267, 3.156561, 0, 0.7294118, 1, 1,
0.1083381, -0.4359584, 3.456542, 0, 0.7254902, 1, 1,
0.1136302, 0.09317395, 1.33267, 0, 0.7176471, 1, 1,
0.1140864, 0.4371657, -0.8519724, 0, 0.7137255, 1, 1,
0.1204392, 0.9165643, 0.6318651, 0, 0.7058824, 1, 1,
0.1216025, 2.515153, -0.4477921, 0, 0.6980392, 1, 1,
0.1237954, -1.402109, 3.508946, 0, 0.6941177, 1, 1,
0.1246767, 0.01222036, 2.1815, 0, 0.6862745, 1, 1,
0.1256374, -1.187296, 2.592513, 0, 0.682353, 1, 1,
0.1259267, -1.469627, 1.188584, 0, 0.6745098, 1, 1,
0.1271897, 0.8098532, -0.1974742, 0, 0.6705883, 1, 1,
0.1276646, 1.553565, -0.07401209, 0, 0.6627451, 1, 1,
0.1304273, -1.913082, 3.725782, 0, 0.6588235, 1, 1,
0.1414558, -0.7359548, 3.551342, 0, 0.6509804, 1, 1,
0.1448499, -0.6237345, 3.863529, 0, 0.6470588, 1, 1,
0.1453189, 0.8034796, -0.45849, 0, 0.6392157, 1, 1,
0.148114, 0.4227196, -0.7853562, 0, 0.6352941, 1, 1,
0.1490745, 0.7766296, -0.4823062, 0, 0.627451, 1, 1,
0.1510738, 1.172063, -1.236132, 0, 0.6235294, 1, 1,
0.1517326, 0.3716541, 0.4518007, 0, 0.6156863, 1, 1,
0.1536245, -0.4670606, -0.2528366, 0, 0.6117647, 1, 1,
0.1539618, 0.01840751, 0.7479438, 0, 0.6039216, 1, 1,
0.1583647, -1.05353, 3.481182, 0, 0.5960785, 1, 1,
0.1590756, -0.9394978, 3.116937, 0, 0.5921569, 1, 1,
0.1626957, 0.9431183, 0.6103765, 0, 0.5843138, 1, 1,
0.1631002, 0.9540702, -0.8106744, 0, 0.5803922, 1, 1,
0.1640768, -0.5902767, 3.869271, 0, 0.572549, 1, 1,
0.1690236, 0.8222489, -0.07350294, 0, 0.5686275, 1, 1,
0.1693171, 0.2861558, 1.081805, 0, 0.5607843, 1, 1,
0.175209, -0.06464649, 1.077919, 0, 0.5568628, 1, 1,
0.1754068, 0.9485937, 0.01799795, 0, 0.5490196, 1, 1,
0.1770387, -0.8795394, 4.018742, 0, 0.5450981, 1, 1,
0.1800353, -0.1880464, 2.415956, 0, 0.5372549, 1, 1,
0.1809857, 0.02308095, 1.925332, 0, 0.5333334, 1, 1,
0.1898498, 1.036702, 0.03152004, 0, 0.5254902, 1, 1,
0.1933066, -0.6421748, 1.779609, 0, 0.5215687, 1, 1,
0.1961169, 0.3656541, -0.1478, 0, 0.5137255, 1, 1,
0.2030759, 1.66801, -0.6941346, 0, 0.509804, 1, 1,
0.2069463, -1.130867, 2.07134, 0, 0.5019608, 1, 1,
0.2084709, -0.9152135, 3.612472, 0, 0.4941176, 1, 1,
0.208975, -0.03407722, 1.603388, 0, 0.4901961, 1, 1,
0.2127944, 0.09284967, 0.9126474, 0, 0.4823529, 1, 1,
0.2152428, -1.016658, 1.845147, 0, 0.4784314, 1, 1,
0.2171944, 0.3021812, -0.5943872, 0, 0.4705882, 1, 1,
0.2187876, 0.4138287, -0.5242174, 0, 0.4666667, 1, 1,
0.2233566, -0.973664, 2.391144, 0, 0.4588235, 1, 1,
0.2238907, -0.6782279, 3.729069, 0, 0.454902, 1, 1,
0.2242383, -1.207041, 1.623859, 0, 0.4470588, 1, 1,
0.2280615, -0.9626784, 2.016288, 0, 0.4431373, 1, 1,
0.2291316, -0.20072, 2.724448, 0, 0.4352941, 1, 1,
0.2323276, -0.4159414, 2.874854, 0, 0.4313726, 1, 1,
0.234936, 0.6541159, 0.1158505, 0, 0.4235294, 1, 1,
0.2362996, -0.3338358, 1.328692, 0, 0.4196078, 1, 1,
0.2411934, 0.2830346, -0.5477571, 0, 0.4117647, 1, 1,
0.2425237, 1.805383, -0.6514344, 0, 0.4078431, 1, 1,
0.2431723, -0.1198056, 1.280861, 0, 0.4, 1, 1,
0.2463477, 1.713964, -0.2129302, 0, 0.3921569, 1, 1,
0.2464285, 1.291287, 0.8735108, 0, 0.3882353, 1, 1,
0.2467183, -0.06013284, 0.98028, 0, 0.3803922, 1, 1,
0.2501793, -1.083369, 3.940778, 0, 0.3764706, 1, 1,
0.2588241, -1.17276, 3.502173, 0, 0.3686275, 1, 1,
0.2622613, -0.4275216, 1.876879, 0, 0.3647059, 1, 1,
0.2655336, 0.6387885, 1.222239, 0, 0.3568628, 1, 1,
0.2738073, 1.709074, 0.644202, 0, 0.3529412, 1, 1,
0.2797696, 0.564559, 1.311097, 0, 0.345098, 1, 1,
0.2900538, -0.5048248, 2.838135, 0, 0.3411765, 1, 1,
0.2907579, 0.7439355, 1.913948, 0, 0.3333333, 1, 1,
0.2908095, 0.4287108, 0.7132227, 0, 0.3294118, 1, 1,
0.2927599, 1.160322, -0.04035471, 0, 0.3215686, 1, 1,
0.2949924, -0.8315434, -0.01625329, 0, 0.3176471, 1, 1,
0.2966259, -0.639296, 1.434919, 0, 0.3098039, 1, 1,
0.2973272, -0.2086484, 1.4613, 0, 0.3058824, 1, 1,
0.3008597, -1.176273, 3.344266, 0, 0.2980392, 1, 1,
0.3019803, 0.8265882, 0.1723624, 0, 0.2901961, 1, 1,
0.3028151, 0.3975438, 1.729364, 0, 0.2862745, 1, 1,
0.3041356, -0.07458717, 2.947054, 0, 0.2784314, 1, 1,
0.3062424, -0.2980715, 4.098327, 0, 0.2745098, 1, 1,
0.3071295, -0.4503603, 3.128583, 0, 0.2666667, 1, 1,
0.310931, -0.01616367, 0.9985414, 0, 0.2627451, 1, 1,
0.3133174, -2.293403, 3.785517, 0, 0.254902, 1, 1,
0.3138075, 0.004788246, 1.290304, 0, 0.2509804, 1, 1,
0.3148257, -0.2401635, 3.625269, 0, 0.2431373, 1, 1,
0.3152152, 0.149098, 2.031453, 0, 0.2392157, 1, 1,
0.3183694, 0.3348792, 0.2991415, 0, 0.2313726, 1, 1,
0.3215359, 2.474744, -0.7559074, 0, 0.227451, 1, 1,
0.323758, -1.257423, 2.717409, 0, 0.2196078, 1, 1,
0.3252378, 0.9243117, 0.7848641, 0, 0.2156863, 1, 1,
0.3306952, -0.2807496, 2.174803, 0, 0.2078431, 1, 1,
0.3331089, -0.0515117, 2.450842, 0, 0.2039216, 1, 1,
0.3336342, 1.015507, 1.169753, 0, 0.1960784, 1, 1,
0.3343432, -0.7334414, 4.307495, 0, 0.1882353, 1, 1,
0.3396701, 1.63613, 0.4354691, 0, 0.1843137, 1, 1,
0.3418481, 0.2898448, 1.919101, 0, 0.1764706, 1, 1,
0.3420533, -0.5079214, 1.036291, 0, 0.172549, 1, 1,
0.3433573, -0.8222108, 5.529071, 0, 0.1647059, 1, 1,
0.3434748, 1.143106, 0.8721693, 0, 0.1607843, 1, 1,
0.3451483, 0.5152811, 0.2949795, 0, 0.1529412, 1, 1,
0.3462218, -0.1302933, 1.221294, 0, 0.1490196, 1, 1,
0.3466614, 0.5432632, -0.2104815, 0, 0.1411765, 1, 1,
0.3498447, 0.5594246, 1.558733, 0, 0.1372549, 1, 1,
0.355737, -0.1362362, 1.525079, 0, 0.1294118, 1, 1,
0.3572402, 0.2393632, 1.773323, 0, 0.1254902, 1, 1,
0.3572935, 0.4927965, 1.821565, 0, 0.1176471, 1, 1,
0.3595134, 0.6689314, 0.461219, 0, 0.1137255, 1, 1,
0.3641363, -1.339572, 2.697576, 0, 0.1058824, 1, 1,
0.3656971, -0.3839301, 3.490123, 0, 0.09803922, 1, 1,
0.3657665, -0.8609088, 2.419975, 0, 0.09411765, 1, 1,
0.3659036, -0.2390175, 3.542072, 0, 0.08627451, 1, 1,
0.3677064, 0.5769375, 1.539824, 0, 0.08235294, 1, 1,
0.3693909, 0.1072503, 0.1865654, 0, 0.07450981, 1, 1,
0.3706672, 0.7749703, 1.705323, 0, 0.07058824, 1, 1,
0.3713391, -1.116887, 4.151795, 0, 0.0627451, 1, 1,
0.3757505, -1.589532, 2.660348, 0, 0.05882353, 1, 1,
0.3769613, 0.4618426, 1.968806, 0, 0.05098039, 1, 1,
0.3794905, 0.389065, 1.504287, 0, 0.04705882, 1, 1,
0.3810287, 0.8317137, -0.4189908, 0, 0.03921569, 1, 1,
0.38219, -0.1716368, 3.728248, 0, 0.03529412, 1, 1,
0.3829367, 0.1599473, 2.074604, 0, 0.02745098, 1, 1,
0.3855226, -1.230443, 3.392691, 0, 0.02352941, 1, 1,
0.3863245, 1.281839, -0.8587599, 0, 0.01568628, 1, 1,
0.3871303, 1.101349, 0.3546225, 0, 0.01176471, 1, 1,
0.3895157, 0.6080318, 0.8477212, 0, 0.003921569, 1, 1,
0.3915832, -0.1513469, 1.614803, 0.003921569, 0, 1, 1,
0.3954882, -0.9542953, 2.313512, 0.007843138, 0, 1, 1,
0.3975677, 0.3510212, 1.293155, 0.01568628, 0, 1, 1,
0.3980223, 0.3701464, 2.485712, 0.01960784, 0, 1, 1,
0.3987394, -0.3317646, 2.349448, 0.02745098, 0, 1, 1,
0.4040988, 0.9599696, 1.49289, 0.03137255, 0, 1, 1,
0.405202, -0.6542338, 2.686744, 0.03921569, 0, 1, 1,
0.4058393, 0.12783, 0.9822408, 0.04313726, 0, 1, 1,
0.4070137, -0.4319964, 1.625412, 0.05098039, 0, 1, 1,
0.4080747, -2.397828, 2.607761, 0.05490196, 0, 1, 1,
0.4127453, -0.8825181, 2.621862, 0.0627451, 0, 1, 1,
0.4138368, -1.337908, 2.283797, 0.06666667, 0, 1, 1,
0.4166075, 0.5006122, 0.0524268, 0.07450981, 0, 1, 1,
0.4238531, 0.1594916, 0.5723786, 0.07843138, 0, 1, 1,
0.425259, -0.3816764, 1.462623, 0.08627451, 0, 1, 1,
0.4263458, -1.687613, 2.038893, 0.09019608, 0, 1, 1,
0.4318941, -0.5122749, 5.196859, 0.09803922, 0, 1, 1,
0.4333191, 0.1022604, 3.298829, 0.1058824, 0, 1, 1,
0.4334711, -0.7413472, 3.309251, 0.1098039, 0, 1, 1,
0.4385687, -1.01184, 2.241566, 0.1176471, 0, 1, 1,
0.4398978, -0.5738775, 0.09608915, 0.1215686, 0, 1, 1,
0.4443968, 2.321344, 0.1372104, 0.1294118, 0, 1, 1,
0.4470317, 0.8009729, -1.874238, 0.1333333, 0, 1, 1,
0.4493306, 0.2943868, 2.492965, 0.1411765, 0, 1, 1,
0.4505074, 1.312443, 0.2416135, 0.145098, 0, 1, 1,
0.4522258, -0.07451187, 1.377714, 0.1529412, 0, 1, 1,
0.456517, -0.4146224, 2.277099, 0.1568628, 0, 1, 1,
0.4566159, -0.04930756, -0.04240582, 0.1647059, 0, 1, 1,
0.4587226, -0.9267306, 3.085916, 0.1686275, 0, 1, 1,
0.4596359, -0.2690591, 2.042862, 0.1764706, 0, 1, 1,
0.4607069, 0.1797752, 0.8855166, 0.1803922, 0, 1, 1,
0.4607385, -0.220027, 1.211534, 0.1882353, 0, 1, 1,
0.4616794, 1.083144, -0.7088169, 0.1921569, 0, 1, 1,
0.4648558, 1.557173, -1.834486, 0.2, 0, 1, 1,
0.4662557, 1.060577, -1.161451, 0.2078431, 0, 1, 1,
0.4662614, 0.5839872, 0.9000344, 0.2117647, 0, 1, 1,
0.4689559, -0.5774174, 2.046765, 0.2196078, 0, 1, 1,
0.4762321, 1.224721, 0.2934481, 0.2235294, 0, 1, 1,
0.4820816, -0.7181976, 3.976461, 0.2313726, 0, 1, 1,
0.4828554, 1.098766, 1.047792, 0.2352941, 0, 1, 1,
0.4833617, -1.066258, 3.306439, 0.2431373, 0, 1, 1,
0.4835215, -0.02565785, 2.603885, 0.2470588, 0, 1, 1,
0.4847665, 0.3435667, 2.648863, 0.254902, 0, 1, 1,
0.4899347, -0.2114345, -0.01640325, 0.2588235, 0, 1, 1,
0.4968187, -0.4280483, 1.069321, 0.2666667, 0, 1, 1,
0.4975445, -0.006885398, 2.407972, 0.2705882, 0, 1, 1,
0.5008283, 2.217523, 2.277059, 0.2784314, 0, 1, 1,
0.5031992, 2.441552, -0.2216492, 0.282353, 0, 1, 1,
0.5061424, -1.037359, 2.233366, 0.2901961, 0, 1, 1,
0.513606, -0.6523793, 1.825161, 0.2941177, 0, 1, 1,
0.5213692, -2.098628, 3.823215, 0.3019608, 0, 1, 1,
0.5290938, 0.6129445, 1.393543, 0.3098039, 0, 1, 1,
0.5301931, -0.9937656, 2.110529, 0.3137255, 0, 1, 1,
0.5314507, -0.7649359, 2.431456, 0.3215686, 0, 1, 1,
0.531527, 0.630682, 0.8304645, 0.3254902, 0, 1, 1,
0.5333878, -0.394181, 2.564503, 0.3333333, 0, 1, 1,
0.5349699, 1.881537, 1.10256, 0.3372549, 0, 1, 1,
0.5356819, -0.9942139, 4.523115, 0.345098, 0, 1, 1,
0.5436094, -1.175242, 3.342619, 0.3490196, 0, 1, 1,
0.5460828, -1.952514, 2.557285, 0.3568628, 0, 1, 1,
0.5519575, -0.2575075, 1.911707, 0.3607843, 0, 1, 1,
0.5534252, 1.313968, -0.2070233, 0.3686275, 0, 1, 1,
0.5553026, 0.8874708, 2.668631, 0.372549, 0, 1, 1,
0.5618487, 1.207403, 1.250404, 0.3803922, 0, 1, 1,
0.5641414, -0.848038, 2.113138, 0.3843137, 0, 1, 1,
0.5651794, -1.060958, 3.602572, 0.3921569, 0, 1, 1,
0.5666687, 2.420868, -1.052442, 0.3960784, 0, 1, 1,
0.5681881, -0.09136792, 0.8415582, 0.4039216, 0, 1, 1,
0.5697761, -0.7783154, 3.190358, 0.4117647, 0, 1, 1,
0.5710804, -0.5765187, 0.8456736, 0.4156863, 0, 1, 1,
0.5728412, -2.289397, 3.251265, 0.4235294, 0, 1, 1,
0.576105, -0.5551242, 1.560554, 0.427451, 0, 1, 1,
0.5806331, 0.09697691, 0.8351579, 0.4352941, 0, 1, 1,
0.5810727, -1.113042, -0.2140825, 0.4392157, 0, 1, 1,
0.586934, -1.707548, 3.266037, 0.4470588, 0, 1, 1,
0.5920619, 0.1583976, 1.131894, 0.4509804, 0, 1, 1,
0.5931976, 0.923232, 0.1938456, 0.4588235, 0, 1, 1,
0.5960044, 1.370227, 0.7447838, 0.4627451, 0, 1, 1,
0.5987966, 1.368395, -0.714157, 0.4705882, 0, 1, 1,
0.602093, 2.142262, 0.9233421, 0.4745098, 0, 1, 1,
0.604382, 0.6462795, -1.371694, 0.4823529, 0, 1, 1,
0.6079284, 0.1276559, 1.379608, 0.4862745, 0, 1, 1,
0.6100455, 1.544966, 0.7938222, 0.4941176, 0, 1, 1,
0.6109836, -0.5393573, 1.624401, 0.5019608, 0, 1, 1,
0.6109948, 1.968685, -0.7399118, 0.5058824, 0, 1, 1,
0.6163121, -0.2390291, 2.958746, 0.5137255, 0, 1, 1,
0.6168681, 0.4576435, 0.8423768, 0.5176471, 0, 1, 1,
0.6174147, -1.575015, 3.728609, 0.5254902, 0, 1, 1,
0.6176187, 0.551451, 1.651173, 0.5294118, 0, 1, 1,
0.6202426, 0.5229122, 1.585626, 0.5372549, 0, 1, 1,
0.6276001, -1.587849, 4.207942, 0.5411765, 0, 1, 1,
0.6384889, 0.2231578, 1.249695, 0.5490196, 0, 1, 1,
0.638845, -0.7063454, 2.278103, 0.5529412, 0, 1, 1,
0.6460921, 1.008032, 1.342279, 0.5607843, 0, 1, 1,
0.651139, 0.4512118, 0.02646064, 0.5647059, 0, 1, 1,
0.6545504, 0.7463646, 1.231582, 0.572549, 0, 1, 1,
0.6545894, -0.4110254, 1.612935, 0.5764706, 0, 1, 1,
0.654752, -0.3251041, 1.458696, 0.5843138, 0, 1, 1,
0.6560847, -0.291875, 2.257029, 0.5882353, 0, 1, 1,
0.6593789, 0.05500593, 2.638659, 0.5960785, 0, 1, 1,
0.6629605, 1.205897, -1.250447, 0.6039216, 0, 1, 1,
0.6665825, 0.9615651, 3.284584, 0.6078432, 0, 1, 1,
0.6703511, -0.2131043, 1.245686, 0.6156863, 0, 1, 1,
0.6777944, -1.022625, 1.606761, 0.6196079, 0, 1, 1,
0.6852595, -1.035401, 2.629441, 0.627451, 0, 1, 1,
0.6889949, 0.2586376, 2.129648, 0.6313726, 0, 1, 1,
0.6912259, 1.244363, 1.812706, 0.6392157, 0, 1, 1,
0.6922682, -0.02548581, 1.163296, 0.6431373, 0, 1, 1,
0.6959993, -0.1759219, 3.256664, 0.6509804, 0, 1, 1,
0.6962148, 1.158357, -0.01400737, 0.654902, 0, 1, 1,
0.6966002, 0.4481661, 0.2964856, 0.6627451, 0, 1, 1,
0.705853, 0.1723011, 0.1248127, 0.6666667, 0, 1, 1,
0.7090248, 1.421969, -0.2756833, 0.6745098, 0, 1, 1,
0.7107446, -0.3913113, 1.018301, 0.6784314, 0, 1, 1,
0.7122871, -1.40804, 2.848998, 0.6862745, 0, 1, 1,
0.7137696, -1.079236, 3.142476, 0.6901961, 0, 1, 1,
0.7199731, 0.4221629, 2.495941, 0.6980392, 0, 1, 1,
0.721362, -0.2628897, 1.773291, 0.7058824, 0, 1, 1,
0.7229781, 0.3079238, -0.4141061, 0.7098039, 0, 1, 1,
0.724419, -0.7020454, 3.977141, 0.7176471, 0, 1, 1,
0.7408889, 1.026193, 2.019705, 0.7215686, 0, 1, 1,
0.7432955, -1.35446, 3.829572, 0.7294118, 0, 1, 1,
0.7451635, 0.4707115, -0.1542542, 0.7333333, 0, 1, 1,
0.7469971, 1.24033, 0.7966189, 0.7411765, 0, 1, 1,
0.7531846, -0.1386822, 1.136111, 0.7450981, 0, 1, 1,
0.7566755, 0.5659494, -0.03273775, 0.7529412, 0, 1, 1,
0.7587886, -0.6942236, 2.413762, 0.7568628, 0, 1, 1,
0.7622466, 0.5457252, -0.8319256, 0.7647059, 0, 1, 1,
0.7761596, 1.270285, 0.6292076, 0.7686275, 0, 1, 1,
0.7861217, -0.2020382, 1.236971, 0.7764706, 0, 1, 1,
0.7876748, -0.5301711, 1.418942, 0.7803922, 0, 1, 1,
0.7886176, -1.518984, 3.164374, 0.7882353, 0, 1, 1,
0.7898554, -0.1046705, 2.617934, 0.7921569, 0, 1, 1,
0.7904623, 0.5083741, 0.5458161, 0.8, 0, 1, 1,
0.80115, 0.4826658, 0.1078008, 0.8078431, 0, 1, 1,
0.8013152, -0.6680331, 1.89754, 0.8117647, 0, 1, 1,
0.8017431, -0.3107561, 1.105425, 0.8196079, 0, 1, 1,
0.8025613, -0.6418325, 3.682958, 0.8235294, 0, 1, 1,
0.8027226, 0.3969489, -0.08816207, 0.8313726, 0, 1, 1,
0.8279945, -0.1205439, 1.262023, 0.8352941, 0, 1, 1,
0.8284177, 2.373737, 2.055665, 0.8431373, 0, 1, 1,
0.83704, -0.5598521, 0.7362238, 0.8470588, 0, 1, 1,
0.8385018, 1.575185, -0.05457385, 0.854902, 0, 1, 1,
0.8497804, -0.8603509, 1.169367, 0.8588235, 0, 1, 1,
0.8530897, -0.2715265, 1.679312, 0.8666667, 0, 1, 1,
0.854442, 0.1382118, 0.6290787, 0.8705882, 0, 1, 1,
0.8546163, -1.539543, 2.157583, 0.8784314, 0, 1, 1,
0.856047, -0.1255116, 1.961414, 0.8823529, 0, 1, 1,
0.8568678, -0.738919, 4.281126, 0.8901961, 0, 1, 1,
0.8677684, 0.1760839, 1.703871, 0.8941177, 0, 1, 1,
0.8690127, -1.207114, 0.7973149, 0.9019608, 0, 1, 1,
0.8704249, 0.5395702, 3.415251, 0.9098039, 0, 1, 1,
0.8720914, 0.321758, 0.07483613, 0.9137255, 0, 1, 1,
0.873039, 1.655378, -0.5956971, 0.9215686, 0, 1, 1,
0.8737209, -1.756003, 3.361542, 0.9254902, 0, 1, 1,
0.8744099, -1.707751, 4.356214, 0.9333333, 0, 1, 1,
0.8925099, 0.3892497, 1.540259, 0.9372549, 0, 1, 1,
0.8958606, 0.1508839, 2.454787, 0.945098, 0, 1, 1,
0.9018043, 1.860353, 0.251686, 0.9490196, 0, 1, 1,
0.9033924, -1.687932, 1.365271, 0.9568627, 0, 1, 1,
0.90865, -0.7067906, 1.479334, 0.9607843, 0, 1, 1,
0.9217284, 0.3611514, -0.191009, 0.9686275, 0, 1, 1,
0.9251434, -0.3709314, 0.6745054, 0.972549, 0, 1, 1,
0.9293729, -0.710033, 2.196543, 0.9803922, 0, 1, 1,
0.9321884, 0.1972403, 2.67525, 0.9843137, 0, 1, 1,
0.9326334, -1.055461, 1.732121, 0.9921569, 0, 1, 1,
0.9365462, -0.7020995, 2.451455, 0.9960784, 0, 1, 1,
0.9445151, 0.501798, 3.034859, 1, 0, 0.9960784, 1,
0.9461394, 0.05095272, 4.101499, 1, 0, 0.9882353, 1,
0.9485542, 0.8357288, 1.001981, 1, 0, 0.9843137, 1,
0.9489512, 1.134408, 2.291511, 1, 0, 0.9764706, 1,
0.9516445, 0.3521585, 1.914476, 1, 0, 0.972549, 1,
0.9551228, -0.6117514, 1.577035, 1, 0, 0.9647059, 1,
0.9563609, -0.9683316, 4.585705, 1, 0, 0.9607843, 1,
0.9628864, 0.01064477, 2.262934, 1, 0, 0.9529412, 1,
0.9646461, 1.235444, 3.139672, 1, 0, 0.9490196, 1,
0.9673685, -0.3193915, 1.349348, 1, 0, 0.9411765, 1,
0.9738342, 2.042047, 0.5286486, 1, 0, 0.9372549, 1,
0.9762334, 1.227702, 0.7182642, 1, 0, 0.9294118, 1,
0.9787338, -0.03635209, -0.01498739, 1, 0, 0.9254902, 1,
0.9830735, -0.09965737, 2.534474, 1, 0, 0.9176471, 1,
0.9843342, 1.95421, 1.906663, 1, 0, 0.9137255, 1,
0.9877004, 0.2709273, 2.893041, 1, 0, 0.9058824, 1,
0.9931153, 0.1080048, 2.406081, 1, 0, 0.9019608, 1,
0.9971022, 0.1374151, 0.7504347, 1, 0, 0.8941177, 1,
0.9991472, 1.139403, 1.685723, 1, 0, 0.8862745, 1,
0.9995738, -0.404101, 1.402567, 1, 0, 0.8823529, 1,
1.006072, -0.9101734, 1.611731, 1, 0, 0.8745098, 1,
1.006214, -1.28486, 1.924507, 1, 0, 0.8705882, 1,
1.008952, -1.177654, 2.222229, 1, 0, 0.8627451, 1,
1.010621, 0.04868925, 2.765598, 1, 0, 0.8588235, 1,
1.014336, 0.3078123, 1.132101, 1, 0, 0.8509804, 1,
1.01502, -0.960887, 2.329391, 1, 0, 0.8470588, 1,
1.016259, -0.7837129, 1.12576, 1, 0, 0.8392157, 1,
1.016463, 0.4821086, 1.914739, 1, 0, 0.8352941, 1,
1.021721, 1.098089, 1.367998, 1, 0, 0.827451, 1,
1.022157, 0.7281814, 0.2331939, 1, 0, 0.8235294, 1,
1.025364, -0.9866461, 3.206321, 1, 0, 0.8156863, 1,
1.027016, -0.1970176, 3.355367, 1, 0, 0.8117647, 1,
1.036185, -0.1119403, 1.300076, 1, 0, 0.8039216, 1,
1.03961, 0.1383188, 1.910072, 1, 0, 0.7960784, 1,
1.044318, -0.1235118, 3.075738, 1, 0, 0.7921569, 1,
1.052337, -0.427986, 3.368293, 1, 0, 0.7843137, 1,
1.067401, 0.3387845, 3.155885, 1, 0, 0.7803922, 1,
1.068289, -0.1692488, 1.930928, 1, 0, 0.772549, 1,
1.071418, 0.2809114, 0.559673, 1, 0, 0.7686275, 1,
1.074731, 0.913414, -0.5573485, 1, 0, 0.7607843, 1,
1.076278, -0.8462582, 0.4460527, 1, 0, 0.7568628, 1,
1.084406, 1.663598, 1.519808, 1, 0, 0.7490196, 1,
1.093156, 1.317724, 0.4096334, 1, 0, 0.7450981, 1,
1.094107, -0.2438677, 2.749283, 1, 0, 0.7372549, 1,
1.104101, -0.6332106, 2.415016, 1, 0, 0.7333333, 1,
1.10555, -0.4196326, 1.184019, 1, 0, 0.7254902, 1,
1.107451, -0.6188216, 2.340385, 1, 0, 0.7215686, 1,
1.112408, 1.0812, 0.8517215, 1, 0, 0.7137255, 1,
1.113329, 0.2148582, 1.832806, 1, 0, 0.7098039, 1,
1.1139, 1.228202, -0.5732254, 1, 0, 0.7019608, 1,
1.126875, 0.325046, 1.153105, 1, 0, 0.6941177, 1,
1.129281, 1.452734, -1.287975, 1, 0, 0.6901961, 1,
1.131642, 1.695369, 0.6103581, 1, 0, 0.682353, 1,
1.136704, -0.4975711, 1.954284, 1, 0, 0.6784314, 1,
1.1373, -0.0831568, 0.5730128, 1, 0, 0.6705883, 1,
1.139784, -1.165173, 0.4493493, 1, 0, 0.6666667, 1,
1.148661, -0.3385792, 2.89023, 1, 0, 0.6588235, 1,
1.150246, -0.04526584, 2.526964, 1, 0, 0.654902, 1,
1.161649, 0.2030811, 2.718459, 1, 0, 0.6470588, 1,
1.176698, -1.149532, 1.912607, 1, 0, 0.6431373, 1,
1.178147, -0.5263392, 2.285287, 1, 0, 0.6352941, 1,
1.179226, -1.250978, 3.673228, 1, 0, 0.6313726, 1,
1.179756, 0.3696196, 1.354578, 1, 0, 0.6235294, 1,
1.185243, -0.03085581, 4.384542, 1, 0, 0.6196079, 1,
1.189431, 1.691557, 0.5472132, 1, 0, 0.6117647, 1,
1.191873, -0.2100302, 0.6209128, 1, 0, 0.6078432, 1,
1.191979, 0.9756557, -0.8150858, 1, 0, 0.6, 1,
1.19787, -1.188297, 2.041714, 1, 0, 0.5921569, 1,
1.19943, -1.182183, 4.485772, 1, 0, 0.5882353, 1,
1.200367, -0.1119464, 2.623471, 1, 0, 0.5803922, 1,
1.209028, 0.007678309, 0.04417907, 1, 0, 0.5764706, 1,
1.214405, 1.264722, 1.285288, 1, 0, 0.5686275, 1,
1.223877, 0.6000317, 1.846035, 1, 0, 0.5647059, 1,
1.231713, 2.80734, 0.704156, 1, 0, 0.5568628, 1,
1.235274, 0.01794236, 2.185318, 1, 0, 0.5529412, 1,
1.239011, -1.086538, 2.264466, 1, 0, 0.5450981, 1,
1.240598, 0.3786345, 2.228908, 1, 0, 0.5411765, 1,
1.241118, 0.1687197, 1.472944, 1, 0, 0.5333334, 1,
1.243565, -1.683013, 1.512232, 1, 0, 0.5294118, 1,
1.248167, 0.8855921, 1.016756, 1, 0, 0.5215687, 1,
1.252769, 0.9806531, 1.686178, 1, 0, 0.5176471, 1,
1.256426, -0.9398286, 3.925305, 1, 0, 0.509804, 1,
1.256976, 0.03655684, 0.3719121, 1, 0, 0.5058824, 1,
1.261942, 1.012641, 0.8382694, 1, 0, 0.4980392, 1,
1.262814, 0.7085987, 1.063586, 1, 0, 0.4901961, 1,
1.26765, -1.02877, 3.407862, 1, 0, 0.4862745, 1,
1.272761, 0.05983016, 2.097644, 1, 0, 0.4784314, 1,
1.274506, -0.4589918, 3.726165, 1, 0, 0.4745098, 1,
1.279627, 2.505683, 1.702046, 1, 0, 0.4666667, 1,
1.286108, 1.152662, 1.130901, 1, 0, 0.4627451, 1,
1.289729, -0.5521418, 2.314515, 1, 0, 0.454902, 1,
1.300995, -0.06110781, 2.230534, 1, 0, 0.4509804, 1,
1.319533, 0.956395, 3.088184, 1, 0, 0.4431373, 1,
1.326773, 1.318781, 0.2826748, 1, 0, 0.4392157, 1,
1.347377, -0.4736942, 2.907311, 1, 0, 0.4313726, 1,
1.351608, 1.623988, -1.454294, 1, 0, 0.427451, 1,
1.365952, -1.059772, 1.16968, 1, 0, 0.4196078, 1,
1.380044, 2.431992, -1.288511, 1, 0, 0.4156863, 1,
1.385323, -0.8384942, 2.710141, 1, 0, 0.4078431, 1,
1.388175, -0.1469756, 3.522783, 1, 0, 0.4039216, 1,
1.39027, -0.7087788, 3.412247, 1, 0, 0.3960784, 1,
1.397489, -0.3508976, 2.523445, 1, 0, 0.3882353, 1,
1.398115, -0.1894678, 1.477257, 1, 0, 0.3843137, 1,
1.398393, -0.4193409, 2.733933, 1, 0, 0.3764706, 1,
1.401841, 1.420635, 0.9516916, 1, 0, 0.372549, 1,
1.404832, 0.1674902, 3.537319, 1, 0, 0.3647059, 1,
1.423674, 0.7944742, 3.3994, 1, 0, 0.3607843, 1,
1.436456, -0.4790129, 1.668069, 1, 0, 0.3529412, 1,
1.442314, 1.123251, 0.6614974, 1, 0, 0.3490196, 1,
1.468876, 0.3092229, 0.6299869, 1, 0, 0.3411765, 1,
1.471673, 0.1114822, 1.717114, 1, 0, 0.3372549, 1,
1.486019, 0.1652851, 3.138874, 1, 0, 0.3294118, 1,
1.511369, -0.763801, 1.325539, 1, 0, 0.3254902, 1,
1.522444, -0.8042411, 1.793737, 1, 0, 0.3176471, 1,
1.533191, 0.3601454, 1.357046, 1, 0, 0.3137255, 1,
1.545867, 0.2428149, 1.000154, 1, 0, 0.3058824, 1,
1.547163, -0.4864755, 3.203225, 1, 0, 0.2980392, 1,
1.570488, -0.5056216, 1.943831, 1, 0, 0.2941177, 1,
1.573065, 1.716094, 1.109595, 1, 0, 0.2862745, 1,
1.575552, 0.7184775, 2.056211, 1, 0, 0.282353, 1,
1.631645, -0.8560343, 1.561001, 1, 0, 0.2745098, 1,
1.633022, -1.267221, 3.993747, 1, 0, 0.2705882, 1,
1.647079, -0.2866753, 1.660901, 1, 0, 0.2627451, 1,
1.653858, -0.4107745, 1.025017, 1, 0, 0.2588235, 1,
1.658503, -2.102458, 2.735506, 1, 0, 0.2509804, 1,
1.695819, -0.6957685, 2.342614, 1, 0, 0.2470588, 1,
1.713431, -1.07563, 1.842428, 1, 0, 0.2392157, 1,
1.766809, 1.469633, 0.5374498, 1, 0, 0.2352941, 1,
1.780956, -0.2681827, -0.04383888, 1, 0, 0.227451, 1,
1.781188, -0.06435908, 3.245213, 1, 0, 0.2235294, 1,
1.788624, -1.00602, 1.93425, 1, 0, 0.2156863, 1,
1.794633, -1.682514, 3.444116, 1, 0, 0.2117647, 1,
1.804236, 0.5260565, 0.4159863, 1, 0, 0.2039216, 1,
1.806362, 1.015707, 0.8571848, 1, 0, 0.1960784, 1,
1.810471, -1.123752, 1.240046, 1, 0, 0.1921569, 1,
1.8327, -0.6194291, 2.177002, 1, 0, 0.1843137, 1,
1.83797, 1.27848, 0.2198704, 1, 0, 0.1803922, 1,
1.848295, 0.6345102, 1.263698, 1, 0, 0.172549, 1,
1.866582, -1.276867, 2.039236, 1, 0, 0.1686275, 1,
1.878295, 0.1405987, 1.969537, 1, 0, 0.1607843, 1,
1.88436, 0.5319891, 2.421703, 1, 0, 0.1568628, 1,
1.903698, 1.202899, 1.825582, 1, 0, 0.1490196, 1,
1.906572, -0.7992149, 1.590361, 1, 0, 0.145098, 1,
1.908331, -1.102148, 3.953622, 1, 0, 0.1372549, 1,
1.948088, -1.478743, 2.88247, 1, 0, 0.1333333, 1,
1.981858, 1.148561, 0.9505342, 1, 0, 0.1254902, 1,
2.009866, -0.7076295, 0.6250554, 1, 0, 0.1215686, 1,
2.040903, -1.052253, 2.35378, 1, 0, 0.1137255, 1,
2.050364, -0.01090732, 2.367175, 1, 0, 0.1098039, 1,
2.085556, -1.41952, 3.420238, 1, 0, 0.1019608, 1,
2.09556, -1.291845, 1.400823, 1, 0, 0.09411765, 1,
2.121042, 1.34568, 0.9245582, 1, 0, 0.09019608, 1,
2.138203, -1.281798, 1.231806, 1, 0, 0.08235294, 1,
2.165613, -0.04146824, 2.36611, 1, 0, 0.07843138, 1,
2.169609, -0.683125, 1.329811, 1, 0, 0.07058824, 1,
2.192245, 0.9927413, 1.851257, 1, 0, 0.06666667, 1,
2.2104, 0.5664409, 0.06602126, 1, 0, 0.05882353, 1,
2.299118, -2.224902, 2.126749, 1, 0, 0.05490196, 1,
2.307562, 1.52681, 1.909142, 1, 0, 0.04705882, 1,
2.364497, -0.09071456, 1.687512, 1, 0, 0.04313726, 1,
2.415537, 0.6014094, 1.289985, 1, 0, 0.03529412, 1,
2.447958, -0.07605212, 1.881464, 1, 0, 0.03137255, 1,
2.449295, -0.3262495, 1.387202, 1, 0, 0.02352941, 1,
2.569919, -0.1226003, 1.208511, 1, 0, 0.01960784, 1,
2.637249, -0.876045, 2.305813, 1, 0, 0.01176471, 1,
3.053482, -0.1463104, -0.8379453, 1, 0, 0.007843138, 1
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
-0.1367564, -3.373735, -6.904032, 0, -0.5, 0.5, 0.5,
-0.1367564, -3.373735, -6.904032, 1, -0.5, 0.5, 0.5,
-0.1367564, -3.373735, -6.904032, 1, 1.5, 0.5, 0.5,
-0.1367564, -3.373735, -6.904032, 0, 1.5, 0.5, 0.5
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
-4.408485, 0.328154, -6.904032, 0, -0.5, 0.5, 0.5,
-4.408485, 0.328154, -6.904032, 1, -0.5, 0.5, 0.5,
-4.408485, 0.328154, -6.904032, 1, 1.5, 0.5, 0.5,
-4.408485, 0.328154, -6.904032, 0, 1.5, 0.5, 0.5
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
-4.408485, -3.373735, 0.2135077, 0, -0.5, 0.5, 0.5,
-4.408485, -3.373735, 0.2135077, 1, -0.5, 0.5, 0.5,
-4.408485, -3.373735, 0.2135077, 1, 1.5, 0.5, 0.5,
-4.408485, -3.373735, 0.2135077, 0, 1.5, 0.5, 0.5
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
-3, -2.519453, -5.261523,
3, -2.519453, -5.261523,
-3, -2.519453, -5.261523,
-3, -2.661833, -5.535275,
-2, -2.519453, -5.261523,
-2, -2.661833, -5.535275,
-1, -2.519453, -5.261523,
-1, -2.661833, -5.535275,
0, -2.519453, -5.261523,
0, -2.661833, -5.535275,
1, -2.519453, -5.261523,
1, -2.661833, -5.535275,
2, -2.519453, -5.261523,
2, -2.661833, -5.535275,
3, -2.519453, -5.261523,
3, -2.661833, -5.535275
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
-3, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
-3, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
-3, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
-3, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
-2, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
-2, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
-2, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
-2, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
-1, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
-1, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
-1, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
-1, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
0, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
0, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
0, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
0, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
1, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
1, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
1, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
1, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
2, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
2, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
2, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
2, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5,
3, -2.946594, -6.082778, 0, -0.5, 0.5, 0.5,
3, -2.946594, -6.082778, 1, -0.5, 0.5, 0.5,
3, -2.946594, -6.082778, 1, 1.5, 0.5, 0.5,
3, -2.946594, -6.082778, 0, 1.5, 0.5, 0.5
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
-3.422702, -2, -5.261523,
-3.422702, 3, -5.261523,
-3.422702, -2, -5.261523,
-3.586999, -2, -5.535275,
-3.422702, -1, -5.261523,
-3.586999, -1, -5.535275,
-3.422702, 0, -5.261523,
-3.586999, 0, -5.535275,
-3.422702, 1, -5.261523,
-3.586999, 1, -5.535275,
-3.422702, 2, -5.261523,
-3.586999, 2, -5.535275,
-3.422702, 3, -5.261523,
-3.586999, 3, -5.535275
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
-3.915594, -2, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, -2, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, -2, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, -2, -6.082778, 0, 1.5, 0.5, 0.5,
-3.915594, -1, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, -1, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, -1, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, -1, -6.082778, 0, 1.5, 0.5, 0.5,
-3.915594, 0, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, 0, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, 0, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, 0, -6.082778, 0, 1.5, 0.5, 0.5,
-3.915594, 1, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, 1, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, 1, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, 1, -6.082778, 0, 1.5, 0.5, 0.5,
-3.915594, 2, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, 2, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, 2, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, 2, -6.082778, 0, 1.5, 0.5, 0.5,
-3.915594, 3, -6.082778, 0, -0.5, 0.5, 0.5,
-3.915594, 3, -6.082778, 1, -0.5, 0.5, 0.5,
-3.915594, 3, -6.082778, 1, 1.5, 0.5, 0.5,
-3.915594, 3, -6.082778, 0, 1.5, 0.5, 0.5
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
-3.422702, -2.519453, -4,
-3.422702, -2.519453, 4,
-3.422702, -2.519453, -4,
-3.586999, -2.661833, -4,
-3.422702, -2.519453, -2,
-3.586999, -2.661833, -2,
-3.422702, -2.519453, 0,
-3.586999, -2.661833, 0,
-3.422702, -2.519453, 2,
-3.586999, -2.661833, 2,
-3.422702, -2.519453, 4,
-3.586999, -2.661833, 4
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
-3.915594, -2.946594, -4, 0, -0.5, 0.5, 0.5,
-3.915594, -2.946594, -4, 1, -0.5, 0.5, 0.5,
-3.915594, -2.946594, -4, 1, 1.5, 0.5, 0.5,
-3.915594, -2.946594, -4, 0, 1.5, 0.5, 0.5,
-3.915594, -2.946594, -2, 0, -0.5, 0.5, 0.5,
-3.915594, -2.946594, -2, 1, -0.5, 0.5, 0.5,
-3.915594, -2.946594, -2, 1, 1.5, 0.5, 0.5,
-3.915594, -2.946594, -2, 0, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 0, 0, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 0, 1, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 0, 1, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 0, 0, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 2, 0, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 2, 1, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 2, 1, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 2, 0, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 4, 0, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 4, 1, -0.5, 0.5, 0.5,
-3.915594, -2.946594, 4, 1, 1.5, 0.5, 0.5,
-3.915594, -2.946594, 4, 0, 1.5, 0.5, 0.5
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
-3.422702, -2.519453, -5.261523,
-3.422702, 3.175761, -5.261523,
-3.422702, -2.519453, 5.688538,
-3.422702, 3.175761, 5.688538,
-3.422702, -2.519453, -5.261523,
-3.422702, -2.519453, 5.688538,
-3.422702, 3.175761, -5.261523,
-3.422702, 3.175761, 5.688538,
-3.422702, -2.519453, -5.261523,
3.149189, -2.519453, -5.261523,
-3.422702, -2.519453, 5.688538,
3.149189, -2.519453, 5.688538,
-3.422702, 3.175761, -5.261523,
3.149189, 3.175761, -5.261523,
-3.422702, 3.175761, 5.688538,
3.149189, 3.175761, 5.688538,
3.149189, -2.519453, -5.261523,
3.149189, 3.175761, -5.261523,
3.149189, -2.519453, 5.688538,
3.149189, 3.175761, 5.688538,
3.149189, -2.519453, -5.261523,
3.149189, -2.519453, 5.688538,
3.149189, 3.175761, -5.261523,
3.149189, 3.175761, 5.688538
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
var radius = 7.466741;
var distance = 33.22038;
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
mvMatrix.translate( 0.1367564, -0.328154, -0.2135077 );
mvMatrix.scale( 1.228442, 1.417539, 0.7372732 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.22038);
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


