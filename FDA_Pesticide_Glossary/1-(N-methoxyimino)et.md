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
-3.015194, -0.4217463, -1.717545, 1, 0, 0, 1,
-2.757935, 0.2406299, -2.044706, 1, 0.007843138, 0, 1,
-2.727922, 1.978376, 0.6824895, 1, 0.01176471, 0, 1,
-2.718552, -1.940905, -0.3553028, 1, 0.01960784, 0, 1,
-2.650636, 0.5041316, 1.513649, 1, 0.02352941, 0, 1,
-2.615747, 0.5834357, -1.787256, 1, 0.03137255, 0, 1,
-2.362433, -2.309043, -3.122499, 1, 0.03529412, 0, 1,
-2.335639, -0.1756514, -3.14152, 1, 0.04313726, 0, 1,
-2.294869, 0.2899343, -0.9134578, 1, 0.04705882, 0, 1,
-2.277359, -0.3265065, -1.030146, 1, 0.05490196, 0, 1,
-2.254855, -1.150319, -1.606368, 1, 0.05882353, 0, 1,
-2.239748, 1.296815, 0.06830405, 1, 0.06666667, 0, 1,
-2.202735, -0.9369981, -0.6079103, 1, 0.07058824, 0, 1,
-2.173477, -0.9317561, -1.211108, 1, 0.07843138, 0, 1,
-2.116666, -2.111552, -2.669928, 1, 0.08235294, 0, 1,
-2.11096, -0.04765699, -2.053863, 1, 0.09019608, 0, 1,
-2.070766, 0.2315329, 0.3039025, 1, 0.09411765, 0, 1,
-2.065432, -0.4447564, -2.060067, 1, 0.1019608, 0, 1,
-2.01565, -1.247864, -2.025324, 1, 0.1098039, 0, 1,
-1.997311, -1.597095, -3.629273, 1, 0.1137255, 0, 1,
-1.97071, -0.5052905, 0.591799, 1, 0.1215686, 0, 1,
-1.918979, 1.226549, -2.255634, 1, 0.1254902, 0, 1,
-1.905956, -1.476984, -1.314798, 1, 0.1333333, 0, 1,
-1.822835, 0.2516374, -1.801178, 1, 0.1372549, 0, 1,
-1.814539, 0.4962352, -1.624603, 1, 0.145098, 0, 1,
-1.812612, 0.1949064, -2.076429, 1, 0.1490196, 0, 1,
-1.809229, 0.8942028, -0.2610985, 1, 0.1568628, 0, 1,
-1.798357, -1.183615, -1.107224, 1, 0.1607843, 0, 1,
-1.79608, -0.6010041, -1.359076, 1, 0.1686275, 0, 1,
-1.781748, 0.7976929, -0.5036012, 1, 0.172549, 0, 1,
-1.758229, -1.344059, -2.444339, 1, 0.1803922, 0, 1,
-1.752389, 1.26799, -1.136955, 1, 0.1843137, 0, 1,
-1.751527, -0.3247387, -1.772367, 1, 0.1921569, 0, 1,
-1.742513, -0.04063403, -3.124418, 1, 0.1960784, 0, 1,
-1.713699, 0.07061628, -1.421503, 1, 0.2039216, 0, 1,
-1.707759, 0.3259892, -1.421223, 1, 0.2117647, 0, 1,
-1.694046, -1.383154, -0.7795774, 1, 0.2156863, 0, 1,
-1.68154, -1.518668, -1.807946, 1, 0.2235294, 0, 1,
-1.668954, 0.2942693, -3.665913, 1, 0.227451, 0, 1,
-1.64915, 2.893917, -0.8320534, 1, 0.2352941, 0, 1,
-1.643377, 0.6973774, -1.428445, 1, 0.2392157, 0, 1,
-1.641007, -0.5207023, -2.045675, 1, 0.2470588, 0, 1,
-1.634796, 0.7634811, -0.2218929, 1, 0.2509804, 0, 1,
-1.631172, -1.170263, -1.829277, 1, 0.2588235, 0, 1,
-1.62474, 0.8543738, -1.759075, 1, 0.2627451, 0, 1,
-1.60517, 2.32223, -0.04479492, 1, 0.2705882, 0, 1,
-1.601429, 0.8954653, -1.195109, 1, 0.2745098, 0, 1,
-1.59415, 0.5409619, -2.010031, 1, 0.282353, 0, 1,
-1.593993, -1.259775, -1.823694, 1, 0.2862745, 0, 1,
-1.593294, -1.589081, -2.281809, 1, 0.2941177, 0, 1,
-1.58493, 0.05763391, -1.862248, 1, 0.3019608, 0, 1,
-1.581853, -0.9561113, -4.064214, 1, 0.3058824, 0, 1,
-1.580257, -1.005748, -1.198251, 1, 0.3137255, 0, 1,
-1.564206, -0.1273826, -2.239685, 1, 0.3176471, 0, 1,
-1.549762, 2.590441, -0.05717482, 1, 0.3254902, 0, 1,
-1.531379, 0.08112258, -1.48798, 1, 0.3294118, 0, 1,
-1.528175, 2.129117, -1.670932, 1, 0.3372549, 0, 1,
-1.526944, 0.3889225, -0.5412095, 1, 0.3411765, 0, 1,
-1.526234, 0.3669305, 0.4786215, 1, 0.3490196, 0, 1,
-1.52514, -0.02208825, -1.42052, 1, 0.3529412, 0, 1,
-1.517372, 2.023497, 0.2129061, 1, 0.3607843, 0, 1,
-1.515558, -0.2088656, -2.998326, 1, 0.3647059, 0, 1,
-1.513664, 0.3855356, 1.059786, 1, 0.372549, 0, 1,
-1.509679, 0.5001631, 1.142594, 1, 0.3764706, 0, 1,
-1.499079, 0.2134606, -2.770718, 1, 0.3843137, 0, 1,
-1.497329, 1.052582, -0.6260903, 1, 0.3882353, 0, 1,
-1.496042, 0.3064925, -2.102224, 1, 0.3960784, 0, 1,
-1.495194, 0.6247206, -2.24289, 1, 0.4039216, 0, 1,
-1.492112, 0.5005374, -1.483487, 1, 0.4078431, 0, 1,
-1.485817, 0.4707839, -1.225582, 1, 0.4156863, 0, 1,
-1.470207, -0.2461297, -1.192633, 1, 0.4196078, 0, 1,
-1.46962, 0.3094076, -2.421095, 1, 0.427451, 0, 1,
-1.460297, 0.16863, -1.506131, 1, 0.4313726, 0, 1,
-1.446135, -2.069255, -2.695376, 1, 0.4392157, 0, 1,
-1.442127, 0.5230049, -2.56655, 1, 0.4431373, 0, 1,
-1.433049, -0.1000051, -1.597242, 1, 0.4509804, 0, 1,
-1.421464, -1.094676, -2.006789, 1, 0.454902, 0, 1,
-1.411044, 0.5616218, -2.355727, 1, 0.4627451, 0, 1,
-1.389259, -0.915675, -1.964031, 1, 0.4666667, 0, 1,
-1.38351, -0.1752157, -1.916005, 1, 0.4745098, 0, 1,
-1.372494, 1.999903, -1.719456, 1, 0.4784314, 0, 1,
-1.358009, -0.6991559, -3.61986, 1, 0.4862745, 0, 1,
-1.349492, -0.0659302, -3.254217, 1, 0.4901961, 0, 1,
-1.346815, 0.68462, -1.001408, 1, 0.4980392, 0, 1,
-1.340733, 0.3881733, -2.177158, 1, 0.5058824, 0, 1,
-1.335563, -0.339835, -2.783814, 1, 0.509804, 0, 1,
-1.326504, 0.2018358, -1.981171, 1, 0.5176471, 0, 1,
-1.316287, 1.162066, -0.0164964, 1, 0.5215687, 0, 1,
-1.296252, -1.816664, -2.950962, 1, 0.5294118, 0, 1,
-1.288832, 1.185247, -2.438457, 1, 0.5333334, 0, 1,
-1.284492, 1.225898, -0.3817516, 1, 0.5411765, 0, 1,
-1.271198, 0.158478, -1.028599, 1, 0.5450981, 0, 1,
-1.270901, -1.73308, -3.419008, 1, 0.5529412, 0, 1,
-1.269033, 1.004552, -1.716413, 1, 0.5568628, 0, 1,
-1.265889, -2.47714, -1.62897, 1, 0.5647059, 0, 1,
-1.260784, 0.4550569, -0.9628701, 1, 0.5686275, 0, 1,
-1.257113, 1.215799, 1.110315, 1, 0.5764706, 0, 1,
-1.255122, 1.330452, -0.6745401, 1, 0.5803922, 0, 1,
-1.253566, 0.2738273, -1.923072, 1, 0.5882353, 0, 1,
-1.250924, -0.494862, -1.211275, 1, 0.5921569, 0, 1,
-1.240325, -1.25399, -2.347715, 1, 0.6, 0, 1,
-1.237977, -1.063905, -0.9195904, 1, 0.6078432, 0, 1,
-1.236903, 1.112319, -0.4928039, 1, 0.6117647, 0, 1,
-1.226537, -0.3153109, -2.159946, 1, 0.6196079, 0, 1,
-1.226445, 0.3323552, -1.655118, 1, 0.6235294, 0, 1,
-1.226279, -0.1558293, -1.298329, 1, 0.6313726, 0, 1,
-1.225945, 0.04238791, -2.393244, 1, 0.6352941, 0, 1,
-1.22592, 0.1986803, -0.9226508, 1, 0.6431373, 0, 1,
-1.216567, 1.219719, 0.3363133, 1, 0.6470588, 0, 1,
-1.206665, 0.2614915, -0.3903178, 1, 0.654902, 0, 1,
-1.205305, 0.4863855, -0.7077425, 1, 0.6588235, 0, 1,
-1.188995, 1.698108, -1.697607, 1, 0.6666667, 0, 1,
-1.186137, -0.09369535, -0.4456323, 1, 0.6705883, 0, 1,
-1.178643, -0.2821264, -1.121108, 1, 0.6784314, 0, 1,
-1.174816, -0.006517878, -0.5626587, 1, 0.682353, 0, 1,
-1.174626, 0.03103766, -1.178213, 1, 0.6901961, 0, 1,
-1.166005, -0.06015011, 0.4013845, 1, 0.6941177, 0, 1,
-1.159627, -0.899104, -1.873424, 1, 0.7019608, 0, 1,
-1.159187, -0.9500667, -2.083909, 1, 0.7098039, 0, 1,
-1.156239, -1.084051, -1.848037, 1, 0.7137255, 0, 1,
-1.147271, 1.867016, -0.006912385, 1, 0.7215686, 0, 1,
-1.142943, -0.1018658, -3.165625, 1, 0.7254902, 0, 1,
-1.136837, -1.484662, -3.861048, 1, 0.7333333, 0, 1,
-1.132974, -0.3687527, -3.047368, 1, 0.7372549, 0, 1,
-1.112234, 0.3560885, -2.868223, 1, 0.7450981, 0, 1,
-1.106574, -0.4226729, -2.875306, 1, 0.7490196, 0, 1,
-1.103516, -0.6778951, -2.203978, 1, 0.7568628, 0, 1,
-1.09713, -0.6412325, -1.841692, 1, 0.7607843, 0, 1,
-1.093383, 1.285767, -0.5892528, 1, 0.7686275, 0, 1,
-1.084598, -1.820602, -1.535249, 1, 0.772549, 0, 1,
-1.080503, 1.168797, 0.08481415, 1, 0.7803922, 0, 1,
-1.080118, -0.8231475, -2.436085, 1, 0.7843137, 0, 1,
-1.073498, -0.8298866, -1.343175, 1, 0.7921569, 0, 1,
-1.072502, -0.05973965, -1.770649, 1, 0.7960784, 0, 1,
-1.072471, 0.7720642, -0.04589465, 1, 0.8039216, 0, 1,
-1.065058, -1.526708, -1.415111, 1, 0.8117647, 0, 1,
-1.061461, -1.930055, -3.565862, 1, 0.8156863, 0, 1,
-1.052435, -0.8077793, -2.258726, 1, 0.8235294, 0, 1,
-1.049295, 0.04365484, -1.233092, 1, 0.827451, 0, 1,
-1.046876, 0.1233853, -0.9650186, 1, 0.8352941, 0, 1,
-1.041246, 0.335724, -2.672773, 1, 0.8392157, 0, 1,
-1.035935, 0.5058765, -0.9500282, 1, 0.8470588, 0, 1,
-1.022753, 0.3783285, -2.301502, 1, 0.8509804, 0, 1,
-1.02131, 0.1671301, -2.098185, 1, 0.8588235, 0, 1,
-1.01941, 0.4296742, -1.041961, 1, 0.8627451, 0, 1,
-1.016954, 0.8748897, -2.839599, 1, 0.8705882, 0, 1,
-1.016753, 1.88745, -1.119321, 1, 0.8745098, 0, 1,
-1.013415, 0.830673, -2.577359, 1, 0.8823529, 0, 1,
-1.007684, 0.5890467, -2.034402, 1, 0.8862745, 0, 1,
-1.007489, -0.1144762, -1.437972, 1, 0.8941177, 0, 1,
-1.007148, -0.05013887, -1.687192, 1, 0.8980392, 0, 1,
-1.006681, -1.785517, -2.069522, 1, 0.9058824, 0, 1,
-1.003124, 1.736431, -0.5449384, 1, 0.9137255, 0, 1,
-0.9986446, 0.001142177, -1.415446, 1, 0.9176471, 0, 1,
-0.9943779, -0.1393595, -2.337606, 1, 0.9254902, 0, 1,
-0.9830841, -0.2562871, -2.263502, 1, 0.9294118, 0, 1,
-0.9825577, -0.7840431, -3.494502, 1, 0.9372549, 0, 1,
-0.9795368, 0.1794731, -1.514494, 1, 0.9411765, 0, 1,
-0.9793789, 0.9470537, -1.277112, 1, 0.9490196, 0, 1,
-0.9776667, 1.124157, -0.9832581, 1, 0.9529412, 0, 1,
-0.9754082, -1.253883, -2.312454, 1, 0.9607843, 0, 1,
-0.969912, -0.5077109, -4.175389, 1, 0.9647059, 0, 1,
-0.9686131, 0.3272926, -1.938154, 1, 0.972549, 0, 1,
-0.9601216, -0.6868728, -3.545467, 1, 0.9764706, 0, 1,
-0.9576678, -1.336765, -4.362924, 1, 0.9843137, 0, 1,
-0.9320025, 0.7903525, -1.016859, 1, 0.9882353, 0, 1,
-0.9299575, -0.3688376, -2.085746, 1, 0.9960784, 0, 1,
-0.9232509, -0.1941275, -2.53062, 0.9960784, 1, 0, 1,
-0.9182158, -0.1275807, -1.681424, 0.9921569, 1, 0, 1,
-0.9145495, 0.803481, 0.6533228, 0.9843137, 1, 0, 1,
-0.9108312, 0.4165021, -0.7067995, 0.9803922, 1, 0, 1,
-0.9059224, 0.9523669, -1.436588, 0.972549, 1, 0, 1,
-0.8802353, 0.2204972, -2.178895, 0.9686275, 1, 0, 1,
-0.8795578, 1.948293, -0.6714588, 0.9607843, 1, 0, 1,
-0.8735905, 0.4415266, -2.22295, 0.9568627, 1, 0, 1,
-0.8710405, -0.6351174, -2.064052, 0.9490196, 1, 0, 1,
-0.8677236, 0.4583262, 0.6157964, 0.945098, 1, 0, 1,
-0.8673277, 0.7081325, -0.2122634, 0.9372549, 1, 0, 1,
-0.8662575, -1.245991, -2.041569, 0.9333333, 1, 0, 1,
-0.8651422, 2.103881, 1.045805, 0.9254902, 1, 0, 1,
-0.8648309, -1.831824, -3.852061, 0.9215686, 1, 0, 1,
-0.8637984, 0.1030678, 0.4162382, 0.9137255, 1, 0, 1,
-0.8625767, 1.44842, 0.8463615, 0.9098039, 1, 0, 1,
-0.8623551, 1.128708, -3.662996, 0.9019608, 1, 0, 1,
-0.8621881, -1.110879, -3.922935, 0.8941177, 1, 0, 1,
-0.8464857, 1.190579, 0.3673702, 0.8901961, 1, 0, 1,
-0.8437532, 0.3232018, -1.112796, 0.8823529, 1, 0, 1,
-0.8376444, -0.6814286, -2.008644, 0.8784314, 1, 0, 1,
-0.8329523, -0.764229, -1.162492, 0.8705882, 1, 0, 1,
-0.8322801, 0.2054823, -0.9522589, 0.8666667, 1, 0, 1,
-0.8313762, 0.8944837, -0.8607804, 0.8588235, 1, 0, 1,
-0.8292319, -1.302097, -2.453295, 0.854902, 1, 0, 1,
-0.8263451, -0.8018284, -3.052785, 0.8470588, 1, 0, 1,
-0.8257589, -0.004296514, -1.267808, 0.8431373, 1, 0, 1,
-0.8233806, 0.7213667, -1.531943, 0.8352941, 1, 0, 1,
-0.8184946, -0.2499937, 0.04565537, 0.8313726, 1, 0, 1,
-0.8176256, 0.9473146, -2.263777, 0.8235294, 1, 0, 1,
-0.8167974, 0.8995236, -0.2274025, 0.8196079, 1, 0, 1,
-0.8167204, 0.4693925, -0.6534779, 0.8117647, 1, 0, 1,
-0.8167105, 0.7944959, -0.9023558, 0.8078431, 1, 0, 1,
-0.8159704, -0.2849961, -2.299434, 0.8, 1, 0, 1,
-0.8124979, -0.2610789, -2.396323, 0.7921569, 1, 0, 1,
-0.8109644, -0.5750072, -1.32736, 0.7882353, 1, 0, 1,
-0.8105916, -0.5453264, -1.613703, 0.7803922, 1, 0, 1,
-0.8085949, -0.02674976, -2.004652, 0.7764706, 1, 0, 1,
-0.8065137, -0.124173, -1.48228, 0.7686275, 1, 0, 1,
-0.80105, -1.158139, -4.506276, 0.7647059, 1, 0, 1,
-0.7976685, 1.921791, 1.32144, 0.7568628, 1, 0, 1,
-0.790888, 0.6823845, -2.583621, 0.7529412, 1, 0, 1,
-0.7857978, 0.377088, -1.740232, 0.7450981, 1, 0, 1,
-0.7856172, -1.564039, -0.5660073, 0.7411765, 1, 0, 1,
-0.7812914, -1.268354, -1.754791, 0.7333333, 1, 0, 1,
-0.7746264, -1.579739, -3.474924, 0.7294118, 1, 0, 1,
-0.7663786, -0.1748167, -1.840935, 0.7215686, 1, 0, 1,
-0.7605931, -0.786605, -0.7878407, 0.7176471, 1, 0, 1,
-0.7498544, -1.121777, -3.335954, 0.7098039, 1, 0, 1,
-0.7369994, -0.3926107, -2.319826, 0.7058824, 1, 0, 1,
-0.7336423, 0.9276083, -0.05141833, 0.6980392, 1, 0, 1,
-0.7287663, 0.8007412, -1.891177, 0.6901961, 1, 0, 1,
-0.7251306, 0.7776051, -1.965768, 0.6862745, 1, 0, 1,
-0.7123914, -0.7702515, -1.651411, 0.6784314, 1, 0, 1,
-0.7114257, -0.5145912, -2.416919, 0.6745098, 1, 0, 1,
-0.710014, -0.5918357, -2.06011, 0.6666667, 1, 0, 1,
-0.7070733, 0.2406531, 0.4068511, 0.6627451, 1, 0, 1,
-0.7069634, 0.2425718, -0.6451979, 0.654902, 1, 0, 1,
-0.7048898, -2.09201, -2.209025, 0.6509804, 1, 0, 1,
-0.7036342, 0.6095719, -0.9059747, 0.6431373, 1, 0, 1,
-0.7002943, -2.030846, -3.443511, 0.6392157, 1, 0, 1,
-0.6950574, 0.9606567, -2.56573, 0.6313726, 1, 0, 1,
-0.6944924, 1.948726, -0.1652681, 0.627451, 1, 0, 1,
-0.6920687, -0.08753476, -2.788944, 0.6196079, 1, 0, 1,
-0.6804554, 0.02277978, -0.1361782, 0.6156863, 1, 0, 1,
-0.6735427, -0.1703856, -1.875346, 0.6078432, 1, 0, 1,
-0.6694179, -0.5970301, -3.418328, 0.6039216, 1, 0, 1,
-0.6681538, 0.4379419, -3.147339, 0.5960785, 1, 0, 1,
-0.6663485, 0.1528002, -2.165561, 0.5882353, 1, 0, 1,
-0.6649876, 0.9112723, -1.235579, 0.5843138, 1, 0, 1,
-0.6606114, 0.681452, -1.929847, 0.5764706, 1, 0, 1,
-0.6588568, -1.022809, -2.988492, 0.572549, 1, 0, 1,
-0.6543918, -0.523051, -3.007073, 0.5647059, 1, 0, 1,
-0.6500995, 1.009201, 1.056038, 0.5607843, 1, 0, 1,
-0.643314, -0.2991375, -2.450016, 0.5529412, 1, 0, 1,
-0.6425461, 1.477135, -0.6366011, 0.5490196, 1, 0, 1,
-0.641055, 1.583112, 1.824638, 0.5411765, 1, 0, 1,
-0.6400478, -0.3345344, -0.9621402, 0.5372549, 1, 0, 1,
-0.6382179, 0.04191118, -1.631965, 0.5294118, 1, 0, 1,
-0.6336913, 1.112949, -2.093081, 0.5254902, 1, 0, 1,
-0.6328394, 0.2583545, -0.8792021, 0.5176471, 1, 0, 1,
-0.6318629, 0.6488187, -1.02755, 0.5137255, 1, 0, 1,
-0.6183899, 0.631152, -0.32601, 0.5058824, 1, 0, 1,
-0.6171562, 0.6615576, -0.1112889, 0.5019608, 1, 0, 1,
-0.6166805, -1.56776, -3.046163, 0.4941176, 1, 0, 1,
-0.6159621, 1.175045, -1.245008, 0.4862745, 1, 0, 1,
-0.6115326, 1.086821, -1.022185, 0.4823529, 1, 0, 1,
-0.6068709, 0.9416923, -0.5316202, 0.4745098, 1, 0, 1,
-0.6049392, 0.6022604, -1.09273, 0.4705882, 1, 0, 1,
-0.6048995, 0.3062946, -1.211369, 0.4627451, 1, 0, 1,
-0.5996926, 1.051217, 0.1235084, 0.4588235, 1, 0, 1,
-0.599233, -0.03561115, -3.912981, 0.4509804, 1, 0, 1,
-0.5954148, 0.6822047, -2.08471, 0.4470588, 1, 0, 1,
-0.5951675, -2.435293, -3.481891, 0.4392157, 1, 0, 1,
-0.5932536, 1.63666, 0.272467, 0.4352941, 1, 0, 1,
-0.5907102, -0.5938327, -4.758036, 0.427451, 1, 0, 1,
-0.5869699, 1.091007, -0.1033552, 0.4235294, 1, 0, 1,
-0.5859284, 0.3023784, -0.7212241, 0.4156863, 1, 0, 1,
-0.5855549, 0.03210682, -1.916856, 0.4117647, 1, 0, 1,
-0.5832999, 0.06144588, -0.6889904, 0.4039216, 1, 0, 1,
-0.5832614, -0.9299666, -1.255252, 0.3960784, 1, 0, 1,
-0.5817465, -1.786405, -3.460438, 0.3921569, 1, 0, 1,
-0.5804548, -1.03224, -2.511669, 0.3843137, 1, 0, 1,
-0.5731689, -0.3278879, -2.811525, 0.3803922, 1, 0, 1,
-0.5715837, 1.186246, 1.512206, 0.372549, 1, 0, 1,
-0.5715792, -0.2439044, -2.842791, 0.3686275, 1, 0, 1,
-0.5569155, -1.055122, -3.216409, 0.3607843, 1, 0, 1,
-0.5498397, -1.187955, -1.311907, 0.3568628, 1, 0, 1,
-0.5444958, 1.342927, -0.3309098, 0.3490196, 1, 0, 1,
-0.5432638, 0.5003121, -0.1025781, 0.345098, 1, 0, 1,
-0.5432636, -1.278331, -2.511092, 0.3372549, 1, 0, 1,
-0.5394439, 1.071161, 0.6996101, 0.3333333, 1, 0, 1,
-0.5373396, -0.1323103, -1.290069, 0.3254902, 1, 0, 1,
-0.533671, -1.642767, -1.92212, 0.3215686, 1, 0, 1,
-0.5335506, 0.2650826, -0.8340527, 0.3137255, 1, 0, 1,
-0.5333039, 0.06976933, -0.8346542, 0.3098039, 1, 0, 1,
-0.5318277, 0.9966399, -2.396441, 0.3019608, 1, 0, 1,
-0.5273198, -2.680623, -3.419697, 0.2941177, 1, 0, 1,
-0.5256838, 0.08741366, -1.598844, 0.2901961, 1, 0, 1,
-0.5236316, 1.674571, 0.3353207, 0.282353, 1, 0, 1,
-0.5233223, 0.5012566, -1.042652, 0.2784314, 1, 0, 1,
-0.5147353, 0.9259111, -0.8305208, 0.2705882, 1, 0, 1,
-0.5131758, 0.5489299, -1.268937, 0.2666667, 1, 0, 1,
-0.508474, -0.1130954, -2.615329, 0.2588235, 1, 0, 1,
-0.5062225, 1.895258, 0.03019327, 0.254902, 1, 0, 1,
-0.505262, -0.7299348, -2.845037, 0.2470588, 1, 0, 1,
-0.4967189, 0.6217394, 0.6636896, 0.2431373, 1, 0, 1,
-0.4809291, -0.5809787, -3.206119, 0.2352941, 1, 0, 1,
-0.4791289, 0.2769011, -1.091432, 0.2313726, 1, 0, 1,
-0.4790876, 1.005028, 0.3209806, 0.2235294, 1, 0, 1,
-0.4789017, -0.4160712, -3.755406, 0.2196078, 1, 0, 1,
-0.4764888, -1.242096, -1.309125, 0.2117647, 1, 0, 1,
-0.4723691, -0.6019933, -2.794532, 0.2078431, 1, 0, 1,
-0.4686553, -1.437996, -3.267108, 0.2, 1, 0, 1,
-0.4648895, -0.01229503, -1.769072, 0.1921569, 1, 0, 1,
-0.4616619, 0.02043158, -0.3664127, 0.1882353, 1, 0, 1,
-0.4606062, -1.791551, -1.860927, 0.1803922, 1, 0, 1,
-0.4583551, 2.077441, -0.04874834, 0.1764706, 1, 0, 1,
-0.4564292, -1.360983, -2.620329, 0.1686275, 1, 0, 1,
-0.4539153, 0.249735, -1.520944, 0.1647059, 1, 0, 1,
-0.452453, -0.2546463, -1.837152, 0.1568628, 1, 0, 1,
-0.4509612, -0.5183423, -3.017617, 0.1529412, 1, 0, 1,
-0.449656, -0.6589512, -1.266956, 0.145098, 1, 0, 1,
-0.444679, -0.06720421, -2.601973, 0.1411765, 1, 0, 1,
-0.4403068, -1.029889, -1.886478, 0.1333333, 1, 0, 1,
-0.4391899, 1.004411, 0.09913647, 0.1294118, 1, 0, 1,
-0.4381015, -0.02042162, -1.060237, 0.1215686, 1, 0, 1,
-0.4374475, 1.049925, 0.03165656, 0.1176471, 1, 0, 1,
-0.4355868, -1.146533, -0.08943989, 0.1098039, 1, 0, 1,
-0.4340834, 1.451011, 0.3153263, 0.1058824, 1, 0, 1,
-0.4331447, 1.836289, -0.6870319, 0.09803922, 1, 0, 1,
-0.4322192, 1.331751, 1.35509, 0.09019608, 1, 0, 1,
-0.4299093, -0.994852, -3.224849, 0.08627451, 1, 0, 1,
-0.4292203, -1.233129, -1.622357, 0.07843138, 1, 0, 1,
-0.4275864, 0.01300673, 0.1131131, 0.07450981, 1, 0, 1,
-0.4247164, 0.9609041, -0.6076856, 0.06666667, 1, 0, 1,
-0.4214252, 1.487933, -0.2334873, 0.0627451, 1, 0, 1,
-0.4187701, 0.3396856, 1.366451, 0.05490196, 1, 0, 1,
-0.4167175, 0.2731904, -0.5286434, 0.05098039, 1, 0, 1,
-0.4160489, -1.764506, -1.394932, 0.04313726, 1, 0, 1,
-0.4143535, -0.1759483, -1.908417, 0.03921569, 1, 0, 1,
-0.4140569, -0.3206066, -3.553888, 0.03137255, 1, 0, 1,
-0.4137832, 0.04115557, -0.09032987, 0.02745098, 1, 0, 1,
-0.4129305, -0.3037461, -3.054312, 0.01960784, 1, 0, 1,
-0.4124779, 0.1403108, -0.9786282, 0.01568628, 1, 0, 1,
-0.4082198, -0.3386686, -4.102403, 0.007843138, 1, 0, 1,
-0.4010118, 1.364359, 0.06429704, 0.003921569, 1, 0, 1,
-0.4009752, 0.2378664, -1.985251, 0, 1, 0.003921569, 1,
-0.3933608, 0.3546717, -0.4422987, 0, 1, 0.01176471, 1,
-0.3923278, 0.4286394, 0.80844, 0, 1, 0.01568628, 1,
-0.3922996, -0.1929069, -1.797101, 0, 1, 0.02352941, 1,
-0.3877169, -0.5864782, -4.068183, 0, 1, 0.02745098, 1,
-0.3875182, -0.01602845, -0.8132316, 0, 1, 0.03529412, 1,
-0.3851403, 1.657969, -0.957924, 0, 1, 0.03921569, 1,
-0.3845595, -0.4230625, -2.169386, 0, 1, 0.04705882, 1,
-0.3840695, -0.3770365, -2.222634, 0, 1, 0.05098039, 1,
-0.3840063, -1.989784, -2.29923, 0, 1, 0.05882353, 1,
-0.3824048, -0.5151892, -4.021194, 0, 1, 0.0627451, 1,
-0.3719803, 0.7528606, -0.9689043, 0, 1, 0.07058824, 1,
-0.3621105, 1.891792, -1.114023, 0, 1, 0.07450981, 1,
-0.3618042, -0.217227, -0.7194938, 0, 1, 0.08235294, 1,
-0.3582905, 0.82414, -0.1831805, 0, 1, 0.08627451, 1,
-0.3557438, 0.0496821, 0.09031753, 0, 1, 0.09411765, 1,
-0.350104, 0.100535, -0.9479055, 0, 1, 0.1019608, 1,
-0.3490072, -1.100981, -4.037189, 0, 1, 0.1058824, 1,
-0.344474, -0.1366472, -3.022011, 0, 1, 0.1137255, 1,
-0.3426771, -0.5184983, -2.511712, 0, 1, 0.1176471, 1,
-0.341493, 0.2268754, -1.508213, 0, 1, 0.1254902, 1,
-0.3355855, -1.832485, -3.441338, 0, 1, 0.1294118, 1,
-0.3333251, 0.9159817, -1.660355, 0, 1, 0.1372549, 1,
-0.3306666, 0.9049905, -1.175103, 0, 1, 0.1411765, 1,
-0.326556, 1.156622, -1.858327, 0, 1, 0.1490196, 1,
-0.3223273, 0.622658, -0.3547436, 0, 1, 0.1529412, 1,
-0.3198214, 2.057632, 1.14906, 0, 1, 0.1607843, 1,
-0.315503, -1.508426, -3.170057, 0, 1, 0.1647059, 1,
-0.3149934, 0.7794233, 0.1012545, 0, 1, 0.172549, 1,
-0.3134235, -1.557327, -3.528183, 0, 1, 0.1764706, 1,
-0.3126364, 1.403451, -0.931137, 0, 1, 0.1843137, 1,
-0.3085914, -0.4126038, -2.946645, 0, 1, 0.1882353, 1,
-0.3080432, 0.55793, -1.361866, 0, 1, 0.1960784, 1,
-0.3021727, -1.259849, -5.130832, 0, 1, 0.2039216, 1,
-0.2938561, -0.2118385, -1.983377, 0, 1, 0.2078431, 1,
-0.2932978, -0.2729921, -1.754989, 0, 1, 0.2156863, 1,
-0.28995, 0.9450575, -1.337954, 0, 1, 0.2196078, 1,
-0.2890592, -1.722865, -2.138983, 0, 1, 0.227451, 1,
-0.2805803, 0.1988067, -3.31799, 0, 1, 0.2313726, 1,
-0.2802219, 1.109148, 0.6378455, 0, 1, 0.2392157, 1,
-0.2778982, -1.891534, -3.481067, 0, 1, 0.2431373, 1,
-0.2775597, 0.6463218, 0.0822106, 0, 1, 0.2509804, 1,
-0.2747269, 0.868561, -0.7204062, 0, 1, 0.254902, 1,
-0.2718496, 0.4488313, 2.464065, 0, 1, 0.2627451, 1,
-0.2708469, 0.9041677, 0.6907288, 0, 1, 0.2666667, 1,
-0.2678228, 0.2289308, 0.06561913, 0, 1, 0.2745098, 1,
-0.2612539, 1.431746, 0.9385713, 0, 1, 0.2784314, 1,
-0.2559793, -0.6585221, -2.160075, 0, 1, 0.2862745, 1,
-0.2555191, 0.9349095, 0.3946467, 0, 1, 0.2901961, 1,
-0.2551034, -0.6548493, -2.542861, 0, 1, 0.2980392, 1,
-0.2542143, 1.321539, -0.4771382, 0, 1, 0.3058824, 1,
-0.251263, 0.08349866, -2.023552, 0, 1, 0.3098039, 1,
-0.2492633, 0.1687522, -1.122201, 0, 1, 0.3176471, 1,
-0.2490024, 0.6778764, 2.309273, 0, 1, 0.3215686, 1,
-0.2430462, 0.7998722, 0.5485203, 0, 1, 0.3294118, 1,
-0.2418868, 0.06813363, -0.8404624, 0, 1, 0.3333333, 1,
-0.2409591, 0.1886154, -1.434102, 0, 1, 0.3411765, 1,
-0.2352562, 0.130081, 2.070781, 0, 1, 0.345098, 1,
-0.2339831, -1.206912, -3.885208, 0, 1, 0.3529412, 1,
-0.2317388, 0.720575, 0.3122239, 0, 1, 0.3568628, 1,
-0.2300256, 0.3031004, -1.460389, 0, 1, 0.3647059, 1,
-0.2274717, -0.5790845, -3.929926, 0, 1, 0.3686275, 1,
-0.2274221, 0.2761907, -1.265789, 0, 1, 0.3764706, 1,
-0.2228976, 0.4448587, -1.144964, 0, 1, 0.3803922, 1,
-0.2224462, 0.1721279, -0.8381831, 0, 1, 0.3882353, 1,
-0.2203935, -0.5286972, -2.372882, 0, 1, 0.3921569, 1,
-0.220064, -0.4731781, -4.104786, 0, 1, 0.4, 1,
-0.218348, -0.5257378, -3.279192, 0, 1, 0.4078431, 1,
-0.2115614, 0.8659393, -0.482742, 0, 1, 0.4117647, 1,
-0.2065043, 0.2287696, 0.3476475, 0, 1, 0.4196078, 1,
-0.2064737, -1.09191, -3.667364, 0, 1, 0.4235294, 1,
-0.2044847, 0.8649268, -1.993339, 0, 1, 0.4313726, 1,
-0.2016827, -0.5801564, -2.664402, 0, 1, 0.4352941, 1,
-0.2016044, 1.352881, -1.103419, 0, 1, 0.4431373, 1,
-0.1959878, 0.2731545, -0.6992792, 0, 1, 0.4470588, 1,
-0.195079, -0.06421638, -0.4113802, 0, 1, 0.454902, 1,
-0.1939709, 1.044777, -4.22787, 0, 1, 0.4588235, 1,
-0.1916078, -1.246606, -3.377979, 0, 1, 0.4666667, 1,
-0.1900754, 1.350143, -1.270759, 0, 1, 0.4705882, 1,
-0.1851558, 0.2225243, -1.551531, 0, 1, 0.4784314, 1,
-0.1846962, 0.1950182, -1.158622, 0, 1, 0.4823529, 1,
-0.1810038, -0.5907919, -2.55329, 0, 1, 0.4901961, 1,
-0.1809697, -0.6996953, -3.438249, 0, 1, 0.4941176, 1,
-0.179099, -0.514311, -1.676342, 0, 1, 0.5019608, 1,
-0.1766234, 0.3260139, -0.4735434, 0, 1, 0.509804, 1,
-0.1736992, -0.02050376, -1.933371, 0, 1, 0.5137255, 1,
-0.173352, 1.339394, -0.7695027, 0, 1, 0.5215687, 1,
-0.1676897, 0.2728064, 0.5941317, 0, 1, 0.5254902, 1,
-0.1647737, 0.665454, 0.9768545, 0, 1, 0.5333334, 1,
-0.1634299, 0.6056697, -0.6445035, 0, 1, 0.5372549, 1,
-0.1631456, -0.08773118, -2.884844, 0, 1, 0.5450981, 1,
-0.1605289, 0.5737846, -1.1439, 0, 1, 0.5490196, 1,
-0.1602074, 0.6812853, 0.362536, 0, 1, 0.5568628, 1,
-0.1588557, 1.529687, 1.217587, 0, 1, 0.5607843, 1,
-0.1571748, -0.2749242, -0.7389227, 0, 1, 0.5686275, 1,
-0.1559449, -0.641308, -0.8391583, 0, 1, 0.572549, 1,
-0.155486, -0.03994557, -2.351131, 0, 1, 0.5803922, 1,
-0.1510228, -0.7217658, -2.647869, 0, 1, 0.5843138, 1,
-0.1478591, 0.7017837, -0.5895407, 0, 1, 0.5921569, 1,
-0.1472802, -0.8458306, -3.696602, 0, 1, 0.5960785, 1,
-0.1470766, -0.6583704, -4.501314, 0, 1, 0.6039216, 1,
-0.1445535, 0.3955578, 0.1001429, 0, 1, 0.6117647, 1,
-0.1427899, -1.348475, -2.075735, 0, 1, 0.6156863, 1,
-0.1404667, 0.1794722, 0.4409744, 0, 1, 0.6235294, 1,
-0.1397956, -1.132755, -2.343246, 0, 1, 0.627451, 1,
-0.1382904, -0.1708961, -1.84717, 0, 1, 0.6352941, 1,
-0.1361076, -0.1693997, -2.751485, 0, 1, 0.6392157, 1,
-0.1318873, -0.4043586, -2.926822, 0, 1, 0.6470588, 1,
-0.131337, 0.3024525, 0.3126262, 0, 1, 0.6509804, 1,
-0.1299503, 1.830997, -0.8990898, 0, 1, 0.6588235, 1,
-0.1225025, -0.2895276, -5.27878, 0, 1, 0.6627451, 1,
-0.122241, -0.250188, -4.829001, 0, 1, 0.6705883, 1,
-0.1211915, -0.8999099, -3.817725, 0, 1, 0.6745098, 1,
-0.1159843, -0.1868145, -1.047574, 0, 1, 0.682353, 1,
-0.1143987, 0.5274951, -0.320513, 0, 1, 0.6862745, 1,
-0.1042375, -0.1534408, -1.806971, 0, 1, 0.6941177, 1,
-0.1005487, -1.198967, -3.171255, 0, 1, 0.7019608, 1,
-0.1003873, -1.683242, -4.079613, 0, 1, 0.7058824, 1,
-0.09949184, 0.8502584, 0.0007562254, 0, 1, 0.7137255, 1,
-0.09861927, 1.470578, -0.1759252, 0, 1, 0.7176471, 1,
-0.09388911, -0.7905713, -2.968252, 0, 1, 0.7254902, 1,
-0.09350976, -0.8237982, -3.133597, 0, 1, 0.7294118, 1,
-0.08831951, -1.751751, -3.435323, 0, 1, 0.7372549, 1,
-0.08738366, -0.05885991, -1.50244, 0, 1, 0.7411765, 1,
-0.08412048, -2.321637, -4.392501, 0, 1, 0.7490196, 1,
-0.083933, 0.4565318, -0.7790629, 0, 1, 0.7529412, 1,
-0.07714265, 1.806164, -0.1680762, 0, 1, 0.7607843, 1,
-0.07601483, -0.2360818, -1.420122, 0, 1, 0.7647059, 1,
-0.07496313, 0.6361588, -0.9747027, 0, 1, 0.772549, 1,
-0.07061829, -0.2822091, -2.979579, 0, 1, 0.7764706, 1,
-0.0665311, -1.56163, -3.509987, 0, 1, 0.7843137, 1,
-0.06570613, 1.511645, 1.782494, 0, 1, 0.7882353, 1,
-0.06335261, 0.2587394, -1.142008, 0, 1, 0.7960784, 1,
-0.05999102, -0.08834203, -2.183311, 0, 1, 0.8039216, 1,
-0.05973352, 1.276298, -0.7770338, 0, 1, 0.8078431, 1,
-0.0565345, -0.07333146, -2.381382, 0, 1, 0.8156863, 1,
-0.0491809, 0.06743129, -1.823529, 0, 1, 0.8196079, 1,
-0.04671609, -2.203162, -3.378756, 0, 1, 0.827451, 1,
-0.04629468, 1.448609, 0.1685774, 0, 1, 0.8313726, 1,
-0.04328773, -0.2320424, -2.46037, 0, 1, 0.8392157, 1,
-0.04154079, -0.597809, -4.251141, 0, 1, 0.8431373, 1,
-0.04022615, -0.2511401, -2.164789, 0, 1, 0.8509804, 1,
-0.0382877, 0.9602872, 0.605844, 0, 1, 0.854902, 1,
-0.03517416, 0.2703873, 0.1026702, 0, 1, 0.8627451, 1,
-0.0345703, -0.1861013, -2.699468, 0, 1, 0.8666667, 1,
-0.0312658, -0.9056478, -3.403548, 0, 1, 0.8745098, 1,
-0.02831656, 0.2589727, -1.062025, 0, 1, 0.8784314, 1,
-0.02808742, 1.194946, -0.6074625, 0, 1, 0.8862745, 1,
-0.02650095, 0.4540288, 0.8851137, 0, 1, 0.8901961, 1,
-0.02084021, 0.5772745, 0.5658298, 0, 1, 0.8980392, 1,
-0.01713198, -1.015416, -2.286485, 0, 1, 0.9058824, 1,
-0.01512389, 1.745549, -0.5452468, 0, 1, 0.9098039, 1,
-0.0101748, 0.8091682, 0.9316919, 0, 1, 0.9176471, 1,
-0.002415149, 0.5933578, -1.225265, 0, 1, 0.9215686, 1,
-0.001285633, -0.7306574, -3.559789, 0, 1, 0.9294118, 1,
0.0005680533, -1.714384, 2.854605, 0, 1, 0.9333333, 1,
0.000695889, -0.3919505, 2.653672, 0, 1, 0.9411765, 1,
0.0008880051, -0.4588315, 3.855642, 0, 1, 0.945098, 1,
0.003074774, -0.4715938, 4.551627, 0, 1, 0.9529412, 1,
0.005057151, 0.12929, 0.1673341, 0, 1, 0.9568627, 1,
0.006563985, -1.044972, 2.581518, 0, 1, 0.9647059, 1,
0.01128536, 0.3786816, -1.503416, 0, 1, 0.9686275, 1,
0.01307572, 1.370098, 0.8570185, 0, 1, 0.9764706, 1,
0.01530093, 0.01284385, 0.07280001, 0, 1, 0.9803922, 1,
0.0192825, -0.4992359, 3.076641, 0, 1, 0.9882353, 1,
0.024089, 1.419683, 0.6039121, 0, 1, 0.9921569, 1,
0.02560712, 1.319102, -0.2619822, 0, 1, 1, 1,
0.02566372, 1.960868, 0.344077, 0, 0.9921569, 1, 1,
0.0300689, 0.1684937, 0.7307031, 0, 0.9882353, 1, 1,
0.0380036, -0.228322, 0.4156461, 0, 0.9803922, 1, 1,
0.04287785, 0.1852702, 0.3240588, 0, 0.9764706, 1, 1,
0.04419489, -0.2206481, 4.629909, 0, 0.9686275, 1, 1,
0.04556708, 1.020015, 1.006087, 0, 0.9647059, 1, 1,
0.04715753, 0.0478955, -0.03426468, 0, 0.9568627, 1, 1,
0.05444519, -1.128306, 2.862313, 0, 0.9529412, 1, 1,
0.0584171, 1.263292, -1.418115, 0, 0.945098, 1, 1,
0.061141, -0.103505, 4.525125, 0, 0.9411765, 1, 1,
0.06131512, 1.436238, 0.5003496, 0, 0.9333333, 1, 1,
0.06188047, 0.3710463, -0.6096185, 0, 0.9294118, 1, 1,
0.06205811, -0.345707, 3.670744, 0, 0.9215686, 1, 1,
0.0625433, 0.01784475, 2.290508, 0, 0.9176471, 1, 1,
0.06348522, 0.8275943, -0.2445874, 0, 0.9098039, 1, 1,
0.0639915, 0.58525, -1.201987, 0, 0.9058824, 1, 1,
0.06458349, 1.353742, -0.2997839, 0, 0.8980392, 1, 1,
0.06629521, 1.564625, -0.3302903, 0, 0.8901961, 1, 1,
0.06666319, 0.2691829, 0.4263746, 0, 0.8862745, 1, 1,
0.06919184, 0.07465747, 0.08026294, 0, 0.8784314, 1, 1,
0.07121848, -0.8415954, 3.040864, 0, 0.8745098, 1, 1,
0.07202547, -0.2339703, 1.755752, 0, 0.8666667, 1, 1,
0.07699313, -0.8537757, 2.123794, 0, 0.8627451, 1, 1,
0.0789995, 0.2176936, 0.2721308, 0, 0.854902, 1, 1,
0.08634616, -0.8198323, 2.463815, 0, 0.8509804, 1, 1,
0.08805653, -1.385697, 1.852013, 0, 0.8431373, 1, 1,
0.08940677, -0.06082351, 0.5205373, 0, 0.8392157, 1, 1,
0.0905925, -0.02044481, 1.559633, 0, 0.8313726, 1, 1,
0.09069007, -0.9544291, 3.901539, 0, 0.827451, 1, 1,
0.09220844, -0.8135603, 1.564033, 0, 0.8196079, 1, 1,
0.1008474, -0.8653565, 2.24201, 0, 0.8156863, 1, 1,
0.1042153, -1.05331, 2.350533, 0, 0.8078431, 1, 1,
0.1089046, 1.178024, 0.8660741, 0, 0.8039216, 1, 1,
0.1153872, 0.1750791, -0.3177629, 0, 0.7960784, 1, 1,
0.1167494, 0.1806269, 0.2821896, 0, 0.7882353, 1, 1,
0.1172699, 1.637219, -1.334555, 0, 0.7843137, 1, 1,
0.1184129, -0.3231617, 2.722632, 0, 0.7764706, 1, 1,
0.1184934, -1.639472, 3.704353, 0, 0.772549, 1, 1,
0.1186242, 0.03986297, -0.2806188, 0, 0.7647059, 1, 1,
0.1200768, 1.53073, 1.297148, 0, 0.7607843, 1, 1,
0.1237388, 0.6759972, -0.3348185, 0, 0.7529412, 1, 1,
0.1282208, -0.1094036, 0.22204, 0, 0.7490196, 1, 1,
0.1340992, 0.6974632, 2.197721, 0, 0.7411765, 1, 1,
0.134431, 0.8791788, 1.049438, 0, 0.7372549, 1, 1,
0.1355806, 1.603276, -0.3038196, 0, 0.7294118, 1, 1,
0.1373482, -0.001268875, 3.156027, 0, 0.7254902, 1, 1,
0.1537191, -1.7933, 3.596307, 0, 0.7176471, 1, 1,
0.1581724, -1.437236, 2.61406, 0, 0.7137255, 1, 1,
0.1613793, -0.1334119, 3.166369, 0, 0.7058824, 1, 1,
0.1621385, 0.2810152, 2.190215, 0, 0.6980392, 1, 1,
0.1623121, 0.2556595, 0.4514849, 0, 0.6941177, 1, 1,
0.1630122, -0.7679547, 4.453204, 0, 0.6862745, 1, 1,
0.1639803, -0.006689257, 1.77641, 0, 0.682353, 1, 1,
0.1658386, 0.9140208, 0.6963927, 0, 0.6745098, 1, 1,
0.1724399, -0.6428584, 1.240116, 0, 0.6705883, 1, 1,
0.1780093, -1.432817, 1.675813, 0, 0.6627451, 1, 1,
0.1809967, 2.088004, 1.943676, 0, 0.6588235, 1, 1,
0.1847991, 0.194269, -0.7758025, 0, 0.6509804, 1, 1,
0.1870468, -0.477137, 1.976619, 0, 0.6470588, 1, 1,
0.1878615, -1.22957, 2.914805, 0, 0.6392157, 1, 1,
0.1991986, -1.02684, 3.472791, 0, 0.6352941, 1, 1,
0.2011731, 0.1258375, 0.8352169, 0, 0.627451, 1, 1,
0.2028655, -0.8629122, 1.794372, 0, 0.6235294, 1, 1,
0.2085754, 2.002319, 2.297119, 0, 0.6156863, 1, 1,
0.2096302, 1.177196, -0.8198155, 0, 0.6117647, 1, 1,
0.2112117, -0.6022935, 0.9487328, 0, 0.6039216, 1, 1,
0.216763, -0.524655, 2.437262, 0, 0.5960785, 1, 1,
0.2223521, 0.3116152, -1.128944, 0, 0.5921569, 1, 1,
0.2232426, 1.098723, 2.010052, 0, 0.5843138, 1, 1,
0.2284121, 0.5293702, 0.1964404, 0, 0.5803922, 1, 1,
0.2359319, -0.03226188, 0.04795084, 0, 0.572549, 1, 1,
0.239886, 0.08253235, 0.6744533, 0, 0.5686275, 1, 1,
0.2426992, -0.05202801, 1.052899, 0, 0.5607843, 1, 1,
0.2433239, 1.464028, 1.613868, 0, 0.5568628, 1, 1,
0.2473099, 1.307566, 0.3233007, 0, 0.5490196, 1, 1,
0.2571554, 0.1590391, 1.643477, 0, 0.5450981, 1, 1,
0.2579237, -1.714084, 4.886662, 0, 0.5372549, 1, 1,
0.2596937, -1.832939, 2.070175, 0, 0.5333334, 1, 1,
0.261845, -1.720791, 3.822814, 0, 0.5254902, 1, 1,
0.2630396, 1.950392, 0.466399, 0, 0.5215687, 1, 1,
0.2647388, -0.3431135, 3.288144, 0, 0.5137255, 1, 1,
0.2669504, 0.1720499, -0.06479169, 0, 0.509804, 1, 1,
0.2728072, 0.6754913, 1.090054, 0, 0.5019608, 1, 1,
0.2747813, 0.4586277, 0.07673498, 0, 0.4941176, 1, 1,
0.2752017, -0.154396, 3.38527, 0, 0.4901961, 1, 1,
0.275297, -0.1605825, 3.789598, 0, 0.4823529, 1, 1,
0.2777167, 0.9973177, -0.3390364, 0, 0.4784314, 1, 1,
0.2779179, -1.426096, 3.572186, 0, 0.4705882, 1, 1,
0.2791955, 0.09454137, 0.8089471, 0, 0.4666667, 1, 1,
0.2822243, -0.5379791, 3.771224, 0, 0.4588235, 1, 1,
0.2825454, -1.386687, 4.6869, 0, 0.454902, 1, 1,
0.2851218, 2.176788, -0.6380948, 0, 0.4470588, 1, 1,
0.2903315, 1.086066, -0.2875781, 0, 0.4431373, 1, 1,
0.2916256, 0.4896629, 0.475603, 0, 0.4352941, 1, 1,
0.2949762, -1.06983, 1.697751, 0, 0.4313726, 1, 1,
0.2955036, -0.4892755, 2.464612, 0, 0.4235294, 1, 1,
0.2981317, -1.110342, 3.314022, 0, 0.4196078, 1, 1,
0.3003699, -1.876519, 2.636029, 0, 0.4117647, 1, 1,
0.3003896, 0.8002937, 0.9613367, 0, 0.4078431, 1, 1,
0.305098, -0.9541023, 2.419754, 0, 0.4, 1, 1,
0.3059027, -0.07102261, 1.147344, 0, 0.3921569, 1, 1,
0.3061222, 1.623871, 0.8449097, 0, 0.3882353, 1, 1,
0.3073388, -1.190207, 2.642189, 0, 0.3803922, 1, 1,
0.3090216, 0.5411255, -0.8931366, 0, 0.3764706, 1, 1,
0.3101756, 0.4563211, 2.119307, 0, 0.3686275, 1, 1,
0.3156958, 0.6996125, 1.274583, 0, 0.3647059, 1, 1,
0.3171745, -0.785541, 2.669994, 0, 0.3568628, 1, 1,
0.3215774, -1.004891, 4.940858, 0, 0.3529412, 1, 1,
0.3221087, -0.1423294, 1.478744, 0, 0.345098, 1, 1,
0.3271024, -1.530782, 3.559715, 0, 0.3411765, 1, 1,
0.328394, -1.226336, 2.739337, 0, 0.3333333, 1, 1,
0.3302304, 0.4449156, 0.5547622, 0, 0.3294118, 1, 1,
0.331953, 0.6506259, -2.132764, 0, 0.3215686, 1, 1,
0.3372606, -0.8069893, 2.630469, 0, 0.3176471, 1, 1,
0.3405098, -0.0205995, 1.898059, 0, 0.3098039, 1, 1,
0.3431087, 0.1581088, 0.5101117, 0, 0.3058824, 1, 1,
0.3437525, 1.694256, 0.6309499, 0, 0.2980392, 1, 1,
0.3453445, -1.820103, 3.030506, 0, 0.2901961, 1, 1,
0.3486019, -0.1858844, 3.159612, 0, 0.2862745, 1, 1,
0.3533983, -0.1259459, 1.557129, 0, 0.2784314, 1, 1,
0.3620968, 0.03116083, 0.7814929, 0, 0.2745098, 1, 1,
0.3659137, -2.255109, 3.313937, 0, 0.2666667, 1, 1,
0.3667768, 0.8303608, -1.537847, 0, 0.2627451, 1, 1,
0.367177, 0.1599361, 2.954415, 0, 0.254902, 1, 1,
0.3688575, 0.1209987, 3.08791, 0, 0.2509804, 1, 1,
0.3701983, -0.7645904, 3.941226, 0, 0.2431373, 1, 1,
0.3711584, -1.028752, 1.944332, 0, 0.2392157, 1, 1,
0.3804154, 0.7441723, 1.612937, 0, 0.2313726, 1, 1,
0.3819761, 0.8036701, 1.257857, 0, 0.227451, 1, 1,
0.3854093, -0.4875691, 0.9362602, 0, 0.2196078, 1, 1,
0.3888991, 1.244264, -0.4831989, 0, 0.2156863, 1, 1,
0.3890236, -1.384408, 3.220974, 0, 0.2078431, 1, 1,
0.3892443, -1.73078, 2.805242, 0, 0.2039216, 1, 1,
0.3903242, 0.6440693, 0.259041, 0, 0.1960784, 1, 1,
0.3964679, 0.3373391, -0.4496115, 0, 0.1882353, 1, 1,
0.3973915, -1.822557, 2.624769, 0, 0.1843137, 1, 1,
0.4009793, 1.804583, -0.8399168, 0, 0.1764706, 1, 1,
0.4014824, -1.377148, 1.988369, 0, 0.172549, 1, 1,
0.404191, 1.027738, 0.9717948, 0, 0.1647059, 1, 1,
0.4043652, -0.8971311, 2.524517, 0, 0.1607843, 1, 1,
0.4106123, 0.3398075, -0.2077291, 0, 0.1529412, 1, 1,
0.4107511, -1.441624, 2.667019, 0, 0.1490196, 1, 1,
0.4117054, -1.698402, 4.432232, 0, 0.1411765, 1, 1,
0.4130144, 1.186371, 0.7711868, 0, 0.1372549, 1, 1,
0.4139675, -0.02269299, 1.747311, 0, 0.1294118, 1, 1,
0.4200392, 0.3954623, -1.017756, 0, 0.1254902, 1, 1,
0.4212728, 0.9983224, 1.691842, 0, 0.1176471, 1, 1,
0.4213918, -0.5544071, 3.022901, 0, 0.1137255, 1, 1,
0.4239882, 1.23499, -1.415396, 0, 0.1058824, 1, 1,
0.4251899, -0.8344523, 2.448642, 0, 0.09803922, 1, 1,
0.4278418, 0.9074974, -0.4034782, 0, 0.09411765, 1, 1,
0.4278983, -1.126769, 3.009772, 0, 0.08627451, 1, 1,
0.4286408, -1.977935, 1.839046, 0, 0.08235294, 1, 1,
0.4303373, -1.51987, 2.227844, 0, 0.07450981, 1, 1,
0.4340273, -0.708783, 4.112449, 0, 0.07058824, 1, 1,
0.4360655, 1.08155, 0.4781357, 0, 0.0627451, 1, 1,
0.4371116, 1.59018, 3.703403, 0, 0.05882353, 1, 1,
0.4428633, 0.2602001, 0.6969637, 0, 0.05098039, 1, 1,
0.4443709, -0.02272155, -0.4603828, 0, 0.04705882, 1, 1,
0.4459248, 0.06133998, 0.8677543, 0, 0.03921569, 1, 1,
0.4465464, 0.1957101, 4.103028, 0, 0.03529412, 1, 1,
0.4481092, 0.8492692, 1.581462, 0, 0.02745098, 1, 1,
0.44875, 1.765949, 0.1613179, 0, 0.02352941, 1, 1,
0.4512005, 0.3862789, -1.505909, 0, 0.01568628, 1, 1,
0.4531764, 1.145132, 0.1573651, 0, 0.01176471, 1, 1,
0.4534964, -1.036894, 4.602201, 0, 0.003921569, 1, 1,
0.454552, -1.07622, 2.733595, 0.003921569, 0, 1, 1,
0.4564858, 0.1244377, 1.11397, 0.007843138, 0, 1, 1,
0.4571001, 0.4837671, 1.799632, 0.01568628, 0, 1, 1,
0.4571703, -0.1766277, 2.744353, 0.01960784, 0, 1, 1,
0.4622936, -0.03491445, 0.7673398, 0.02745098, 0, 1, 1,
0.4674782, -1.422756, 2.885291, 0.03137255, 0, 1, 1,
0.473049, -1.033604, 0.4422346, 0.03921569, 0, 1, 1,
0.4768569, -0.003017312, -0.3578714, 0.04313726, 0, 1, 1,
0.4798987, -1.75597, 3.899713, 0.05098039, 0, 1, 1,
0.4923234, -0.6341425, 1.407083, 0.05490196, 0, 1, 1,
0.5005916, 1.126539, -0.2527745, 0.0627451, 0, 1, 1,
0.5060115, 1.643403, -0.4577731, 0.06666667, 0, 1, 1,
0.5107612, 1.070867, -0.7186558, 0.07450981, 0, 1, 1,
0.5195217, -0.4337981, 0.4546855, 0.07843138, 0, 1, 1,
0.5241114, -1.753191, 3.713736, 0.08627451, 0, 1, 1,
0.5250819, -0.7120243, 2.840751, 0.09019608, 0, 1, 1,
0.5270134, 1.503849, -0.2127317, 0.09803922, 0, 1, 1,
0.5299037, -0.538451, 2.958207, 0.1058824, 0, 1, 1,
0.5308674, 0.6121302, 1.038916, 0.1098039, 0, 1, 1,
0.5325597, 0.7843962, 1.946197, 0.1176471, 0, 1, 1,
0.5382982, 0.2360617, 1.103816, 0.1215686, 0, 1, 1,
0.5384551, 0.3425365, 1.241879, 0.1294118, 0, 1, 1,
0.5391434, -0.1544893, 2.79144, 0.1333333, 0, 1, 1,
0.5437891, 0.2202631, 1.638107, 0.1411765, 0, 1, 1,
0.5489843, -0.4518153, 2.979024, 0.145098, 0, 1, 1,
0.5507143, -0.7829323, 2.39097, 0.1529412, 0, 1, 1,
0.5512698, 0.634957, 1.528609, 0.1568628, 0, 1, 1,
0.5515149, 1.062878, 0.4667824, 0.1647059, 0, 1, 1,
0.5518502, 1.926163, 1.544236, 0.1686275, 0, 1, 1,
0.5576724, -0.5980757, 0.8273248, 0.1764706, 0, 1, 1,
0.5633908, 1.522709, 0.2240705, 0.1803922, 0, 1, 1,
0.5636494, -2.444435, 3.760477, 0.1882353, 0, 1, 1,
0.5720994, 0.09391791, 2.067459, 0.1921569, 0, 1, 1,
0.5724279, 0.6681473, 0.1657059, 0.2, 0, 1, 1,
0.5734797, -0.2502338, 2.438431, 0.2078431, 0, 1, 1,
0.5750011, 0.6778732, 1.092179, 0.2117647, 0, 1, 1,
0.57762, 2.661302, 0.5258934, 0.2196078, 0, 1, 1,
0.5806014, -0.6449215, 2.496031, 0.2235294, 0, 1, 1,
0.5816934, -1.41601, 2.933962, 0.2313726, 0, 1, 1,
0.5824769, 0.4380221, -0.6987837, 0.2352941, 0, 1, 1,
0.5846084, -0.2812043, 3.504848, 0.2431373, 0, 1, 1,
0.585591, 0.4870458, 1.127794, 0.2470588, 0, 1, 1,
0.5909839, -0.2633, 2.093653, 0.254902, 0, 1, 1,
0.594529, -0.6841455, 2.069538, 0.2588235, 0, 1, 1,
0.5986291, 1.061272, 0.008761123, 0.2666667, 0, 1, 1,
0.5993384, -0.9012787, 3.475351, 0.2705882, 0, 1, 1,
0.6031135, -0.1442258, 1.370377, 0.2784314, 0, 1, 1,
0.612717, -0.373823, 2.415214, 0.282353, 0, 1, 1,
0.6132259, 0.7083033, 0.07174499, 0.2901961, 0, 1, 1,
0.6165575, 0.2681917, 1.435116, 0.2941177, 0, 1, 1,
0.6213263, -0.9906771, 1.96093, 0.3019608, 0, 1, 1,
0.6249912, 1.581097, 1.494268, 0.3098039, 0, 1, 1,
0.6254331, 0.05148947, 1.360407, 0.3137255, 0, 1, 1,
0.6309837, 1.361642, 0.2560081, 0.3215686, 0, 1, 1,
0.637538, 1.55541, -0.2430024, 0.3254902, 0, 1, 1,
0.6393369, 0.2660353, 0.3602197, 0.3333333, 0, 1, 1,
0.6394895, 0.1379627, 2.7401, 0.3372549, 0, 1, 1,
0.6412699, -0.4950323, 2.465577, 0.345098, 0, 1, 1,
0.647442, 2.426519, 0.8631743, 0.3490196, 0, 1, 1,
0.6476118, -1.51639, 4.598928, 0.3568628, 0, 1, 1,
0.6535366, 0.6269825, 0.4261437, 0.3607843, 0, 1, 1,
0.6562604, -0.6132056, 1.302314, 0.3686275, 0, 1, 1,
0.6637693, 0.4885774, 1.09373, 0.372549, 0, 1, 1,
0.6654421, -0.1329941, 1.041356, 0.3803922, 0, 1, 1,
0.6666172, -0.7152049, 3.001049, 0.3843137, 0, 1, 1,
0.670879, 0.1293035, 1.036596, 0.3921569, 0, 1, 1,
0.6770788, 1.059098, -0.1155855, 0.3960784, 0, 1, 1,
0.6870666, 0.503601, 1.378703, 0.4039216, 0, 1, 1,
0.6878164, 0.6991603, -0.4971645, 0.4117647, 0, 1, 1,
0.6955752, -1.281449, 2.004015, 0.4156863, 0, 1, 1,
0.6963608, -1.913331, 4.107614, 0.4235294, 0, 1, 1,
0.6996222, -0.3237021, 1.142919, 0.427451, 0, 1, 1,
0.6997269, 0.5884587, 1.519252, 0.4352941, 0, 1, 1,
0.6999502, -1.676475, 2.267183, 0.4392157, 0, 1, 1,
0.7058996, 0.1974892, 2.987983, 0.4470588, 0, 1, 1,
0.7061414, 1.508873, 0.9715583, 0.4509804, 0, 1, 1,
0.7081093, 4.322224, 2.737544, 0.4588235, 0, 1, 1,
0.7130045, 2.452825, -0.5562724, 0.4627451, 0, 1, 1,
0.7178251, -0.8327275, 3.129386, 0.4705882, 0, 1, 1,
0.7178744, -0.1195004, 1.690192, 0.4745098, 0, 1, 1,
0.7208669, 0.564894, 0.4903698, 0.4823529, 0, 1, 1,
0.7225408, 0.5038937, 0.2833912, 0.4862745, 0, 1, 1,
0.7233615, 0.204134, 1.974917, 0.4941176, 0, 1, 1,
0.7251576, 2.182115, -0.2241005, 0.5019608, 0, 1, 1,
0.7266513, -1.540264, 3.349034, 0.5058824, 0, 1, 1,
0.7275944, -1.131144, 3.401052, 0.5137255, 0, 1, 1,
0.7316417, -1.30774, 3.558775, 0.5176471, 0, 1, 1,
0.7320451, 1.602524, 1.350277, 0.5254902, 0, 1, 1,
0.7321129, 1.09665, 2.327271, 0.5294118, 0, 1, 1,
0.7343085, 0.4301471, 0.6549869, 0.5372549, 0, 1, 1,
0.7343135, -0.9214158, 2.619625, 0.5411765, 0, 1, 1,
0.7343475, 0.9680874, 0.4487206, 0.5490196, 0, 1, 1,
0.7351419, 2.141179, -0.4820182, 0.5529412, 0, 1, 1,
0.7367522, -0.973393, 1.908746, 0.5607843, 0, 1, 1,
0.738362, 1.585003, 0.1028837, 0.5647059, 0, 1, 1,
0.7459037, 0.1553584, 2.589286, 0.572549, 0, 1, 1,
0.751876, -0.7313442, 1.618036, 0.5764706, 0, 1, 1,
0.7522638, 0.8880419, 1.312329, 0.5843138, 0, 1, 1,
0.7530388, -0.3507994, 3.054247, 0.5882353, 0, 1, 1,
0.7558404, 0.905158, 1.560516, 0.5960785, 0, 1, 1,
0.7569557, -0.07491717, 1.962617, 0.6039216, 0, 1, 1,
0.7597818, 0.51508, -0.6376334, 0.6078432, 0, 1, 1,
0.7601913, -0.2087294, 2.306069, 0.6156863, 0, 1, 1,
0.7653227, 0.4740232, 0.2313096, 0.6196079, 0, 1, 1,
0.7665619, 1.02861, 2.661152, 0.627451, 0, 1, 1,
0.7670224, 0.9376777, 1.118069, 0.6313726, 0, 1, 1,
0.7713321, -0.732287, 2.573888, 0.6392157, 0, 1, 1,
0.7739947, 1.368943, 0.4328408, 0.6431373, 0, 1, 1,
0.783113, -1.987621, 3.170228, 0.6509804, 0, 1, 1,
0.7834412, 1.657688, 1.231767, 0.654902, 0, 1, 1,
0.7894077, -0.5855559, 1.382323, 0.6627451, 0, 1, 1,
0.7922236, -0.07462717, 3.549877, 0.6666667, 0, 1, 1,
0.7936205, -0.8879532, 3.509284, 0.6745098, 0, 1, 1,
0.7943808, -0.3511928, 3.076615, 0.6784314, 0, 1, 1,
0.8035385, -0.7968582, 2.95865, 0.6862745, 0, 1, 1,
0.8055958, 0.04646093, 2.907997, 0.6901961, 0, 1, 1,
0.8074096, -0.6187322, 0.779058, 0.6980392, 0, 1, 1,
0.8093916, 0.004371688, 2.074199, 0.7058824, 0, 1, 1,
0.8126091, -0.8780982, 1.835766, 0.7098039, 0, 1, 1,
0.8222216, -1.767464, 3.339109, 0.7176471, 0, 1, 1,
0.8236136, 0.6639317, 1.747115, 0.7215686, 0, 1, 1,
0.8297436, 1.237182, 0.385028, 0.7294118, 0, 1, 1,
0.8345063, 1.170575, 1.706944, 0.7333333, 0, 1, 1,
0.8346534, -0.6093407, 2.347054, 0.7411765, 0, 1, 1,
0.8358461, 0.0009352552, 2.903786, 0.7450981, 0, 1, 1,
0.8364013, -0.07647336, 1.639318, 0.7529412, 0, 1, 1,
0.840275, 0.6624849, -0.3295909, 0.7568628, 0, 1, 1,
0.8464289, 1.010149, -1.094881, 0.7647059, 0, 1, 1,
0.8495585, 1.479853, 1.413787, 0.7686275, 0, 1, 1,
0.8514373, -1.777862, 1.119113, 0.7764706, 0, 1, 1,
0.8537157, -2.055896, 2.342814, 0.7803922, 0, 1, 1,
0.8575611, 0.330276, 2.202279, 0.7882353, 0, 1, 1,
0.8597142, 0.2709402, -1.01765, 0.7921569, 0, 1, 1,
0.8655057, -0.7343642, 2.426728, 0.8, 0, 1, 1,
0.86997, 0.4727265, 1.213661, 0.8078431, 0, 1, 1,
0.8719493, -1.008983, 1.226354, 0.8117647, 0, 1, 1,
0.8731012, 0.5750803, 0.1402986, 0.8196079, 0, 1, 1,
0.8739459, 0.7093229, 1.284941, 0.8235294, 0, 1, 1,
0.8777763, -0.9801132, 1.270962, 0.8313726, 0, 1, 1,
0.8920464, -0.1232906, 1.247349, 0.8352941, 0, 1, 1,
0.8955811, 2.52859, 0.003946808, 0.8431373, 0, 1, 1,
0.8964865, 1.842788, -0.3440587, 0.8470588, 0, 1, 1,
0.8989846, -1.359589, 2.895134, 0.854902, 0, 1, 1,
0.9005539, -1.057801, 2.03031, 0.8588235, 0, 1, 1,
0.9011924, 0.4779892, 0.901952, 0.8666667, 0, 1, 1,
0.9049067, -1.290313, 3.424591, 0.8705882, 0, 1, 1,
0.914394, 1.104665, -0.3046232, 0.8784314, 0, 1, 1,
0.9225328, -1.439668, 3.764075, 0.8823529, 0, 1, 1,
0.9251325, 0.0200008, 0.1721413, 0.8901961, 0, 1, 1,
0.9325746, -1.94298, 2.312966, 0.8941177, 0, 1, 1,
0.9365254, 0.5551925, 1.438472, 0.9019608, 0, 1, 1,
0.94441, -0.6171272, 2.841882, 0.9098039, 0, 1, 1,
0.9459178, -0.4958946, 3.974207, 0.9137255, 0, 1, 1,
0.9572724, 0.09026582, -0.07858475, 0.9215686, 0, 1, 1,
0.9752668, -0.09134033, 1.410035, 0.9254902, 0, 1, 1,
0.9832506, -1.0999, 2.519216, 0.9333333, 0, 1, 1,
0.9901076, -0.104717, 2.883242, 0.9372549, 0, 1, 1,
0.9914474, -1.412451, 3.968611, 0.945098, 0, 1, 1,
0.9925397, 1.155523, -0.0874528, 0.9490196, 0, 1, 1,
0.9945987, -0.01326595, 1.254321, 0.9568627, 0, 1, 1,
0.9973954, 0.1337559, 2.772279, 0.9607843, 0, 1, 1,
1.00341, -0.2560989, 0.6707715, 0.9686275, 0, 1, 1,
1.006504, 1.71756, -0.08076696, 0.972549, 0, 1, 1,
1.011138, 0.6830158, 2.577448, 0.9803922, 0, 1, 1,
1.021639, -0.28763, 3.224684, 0.9843137, 0, 1, 1,
1.022042, -0.8267956, 1.815821, 0.9921569, 0, 1, 1,
1.02291, 0.1322324, 2.040496, 0.9960784, 0, 1, 1,
1.034066, 1.195873, 1.337173, 1, 0, 0.9960784, 1,
1.040446, -0.6361658, 3.485707, 1, 0, 0.9882353, 1,
1.042375, 1.261075, 0.3199979, 1, 0, 0.9843137, 1,
1.046378, -1.1292, 2.190916, 1, 0, 0.9764706, 1,
1.04781, -0.2797999, 4.931491, 1, 0, 0.972549, 1,
1.049518, 0.4799502, 0.01278097, 1, 0, 0.9647059, 1,
1.053837, -0.5899385, 3.127034, 1, 0, 0.9607843, 1,
1.060068, -1.541078, 2.37905, 1, 0, 0.9529412, 1,
1.062322, -1.033055, 2.410421, 1, 0, 0.9490196, 1,
1.062809, 1.076556, 0.743138, 1, 0, 0.9411765, 1,
1.062907, 0.9831033, 3.630278, 1, 0, 0.9372549, 1,
1.064816, 0.1415865, 0.183892, 1, 0, 0.9294118, 1,
1.066833, 0.443238, 0.8915403, 1, 0, 0.9254902, 1,
1.071062, 0.7891632, 1.56476, 1, 0, 0.9176471, 1,
1.07295, -0.6360937, 1.512514, 1, 0, 0.9137255, 1,
1.077936, -0.4774507, 2.943493, 1, 0, 0.9058824, 1,
1.083323, 0.6343415, 1.938429, 1, 0, 0.9019608, 1,
1.088395, 0.4368692, 1.368625, 1, 0, 0.8941177, 1,
1.088862, 0.6687785, 0.5132286, 1, 0, 0.8862745, 1,
1.092183, 0.08289528, 2.330442, 1, 0, 0.8823529, 1,
1.092747, 2.035772, 0.411319, 1, 0, 0.8745098, 1,
1.096831, -0.8537005, 2.145151, 1, 0, 0.8705882, 1,
1.096884, 0.9523641, 0.5679244, 1, 0, 0.8627451, 1,
1.106677, 0.7535602, 2.336272, 1, 0, 0.8588235, 1,
1.110711, 1.805418, 1.261575, 1, 0, 0.8509804, 1,
1.114058, 1.343417, 1.783404, 1, 0, 0.8470588, 1,
1.118085, -0.2994945, 1.579519, 1, 0, 0.8392157, 1,
1.119505, -1.047123, 1.500727, 1, 0, 0.8352941, 1,
1.121079, -0.08397607, 1.618777, 1, 0, 0.827451, 1,
1.133298, 0.716475, 1.264412, 1, 0, 0.8235294, 1,
1.147802, 1.635499, 1.797952, 1, 0, 0.8156863, 1,
1.169564, 0.2429356, 0.7221532, 1, 0, 0.8117647, 1,
1.180589, 0.1978555, 3.302554, 1, 0, 0.8039216, 1,
1.186567, -1.423291, 1.960637, 1, 0, 0.7960784, 1,
1.189368, 0.8302246, 1.597835, 1, 0, 0.7921569, 1,
1.189557, -0.7273662, 2.120258, 1, 0, 0.7843137, 1,
1.191718, -0.3252131, 1.402211, 1, 0, 0.7803922, 1,
1.193282, -1.941939, 2.428133, 1, 0, 0.772549, 1,
1.194641, -1.088352, 3.024734, 1, 0, 0.7686275, 1,
1.202244, -2.246473, 2.745363, 1, 0, 0.7607843, 1,
1.203966, -0.794061, 1.198142, 1, 0, 0.7568628, 1,
1.204666, 0.5978693, 0.03621665, 1, 0, 0.7490196, 1,
1.207664, -0.1454276, 2.759069, 1, 0, 0.7450981, 1,
1.207739, 0.7848882, 0.832719, 1, 0, 0.7372549, 1,
1.217528, -0.6395731, 1.90924, 1, 0, 0.7333333, 1,
1.222394, 0.4149939, 0.9060362, 1, 0, 0.7254902, 1,
1.222779, 0.2338544, 0.8986378, 1, 0, 0.7215686, 1,
1.22759, 0.1199628, 1.415531, 1, 0, 0.7137255, 1,
1.235521, 0.3839054, 0.9623585, 1, 0, 0.7098039, 1,
1.239173, 1.371656, 2.119882, 1, 0, 0.7019608, 1,
1.239656, -1.212723, 0.7209594, 1, 0, 0.6941177, 1,
1.240179, -0.776884, 1.526278, 1, 0, 0.6901961, 1,
1.250531, -1.821468, 2.824269, 1, 0, 0.682353, 1,
1.275364, 0.7330487, 2.310576, 1, 0, 0.6784314, 1,
1.281085, 0.01833916, 0.4750272, 1, 0, 0.6705883, 1,
1.28226, -0.1322306, 0.8650949, 1, 0, 0.6666667, 1,
1.282642, -0.4139431, 0.654651, 1, 0, 0.6588235, 1,
1.28422, 0.8682446, 0.2350422, 1, 0, 0.654902, 1,
1.284419, 1.946187, -0.1125896, 1, 0, 0.6470588, 1,
1.287485, -1.093338, 2.398515, 1, 0, 0.6431373, 1,
1.290261, -0.7701554, 3.459636, 1, 0, 0.6352941, 1,
1.291687, -0.08283006, 3.83462, 1, 0, 0.6313726, 1,
1.296238, 0.490525, 1.935147, 1, 0, 0.6235294, 1,
1.300823, -0.2069317, 2.376646, 1, 0, 0.6196079, 1,
1.302777, -0.8672952, 1.258471, 1, 0, 0.6117647, 1,
1.303569, 0.4931293, 0.6405475, 1, 0, 0.6078432, 1,
1.307238, 1.699439, 0.4511611, 1, 0, 0.6, 1,
1.31524, -1.849936, 2.083447, 1, 0, 0.5921569, 1,
1.317833, 1.527233, 1.884754, 1, 0, 0.5882353, 1,
1.320381, 0.3938173, 1.418207, 1, 0, 0.5803922, 1,
1.330528, 0.2863189, 0.5426387, 1, 0, 0.5764706, 1,
1.332678, 0.8455951, 1.405617, 1, 0, 0.5686275, 1,
1.354958, -1.633238, 0.7337818, 1, 0, 0.5647059, 1,
1.355114, -0.2571055, 1.339385, 1, 0, 0.5568628, 1,
1.358104, -0.5794829, 2.664351, 1, 0, 0.5529412, 1,
1.365023, -0.123294, 2.054788, 1, 0, 0.5450981, 1,
1.365687, 0.03479992, 1.428853, 1, 0, 0.5411765, 1,
1.400105, 0.6443712, 0.4559565, 1, 0, 0.5333334, 1,
1.40797, 0.2006689, 0.7849616, 1, 0, 0.5294118, 1,
1.408053, 1.317492, 2.77322, 1, 0, 0.5215687, 1,
1.410813, 0.06680951, 2.626019, 1, 0, 0.5176471, 1,
1.413215, -0.5161839, 0.4700677, 1, 0, 0.509804, 1,
1.418264, -0.2754118, 1.530482, 1, 0, 0.5058824, 1,
1.423439, 1.005105, 2.906934, 1, 0, 0.4980392, 1,
1.433446, 1.068337, 2.963287, 1, 0, 0.4901961, 1,
1.442715, -0.2013504, 1.084709, 1, 0, 0.4862745, 1,
1.451259, 0.1115491, 2.583317, 1, 0, 0.4784314, 1,
1.452419, 0.4145471, 2.316262, 1, 0, 0.4745098, 1,
1.454691, -0.9981133, 1.926903, 1, 0, 0.4666667, 1,
1.466804, -0.2936002, 1.702976, 1, 0, 0.4627451, 1,
1.475205, -0.9947294, 1.778836, 1, 0, 0.454902, 1,
1.490049, -0.4188029, 2.178562, 1, 0, 0.4509804, 1,
1.490774, -0.5711724, 0.6704787, 1, 0, 0.4431373, 1,
1.49199, 0.4806705, 2.428603, 1, 0, 0.4392157, 1,
1.498279, -1.412468, -0.8304283, 1, 0, 0.4313726, 1,
1.498654, 1.905928, -0.02755097, 1, 0, 0.427451, 1,
1.505745, -0.894917, 2.088633, 1, 0, 0.4196078, 1,
1.515531, 0.7975973, 1.05821, 1, 0, 0.4156863, 1,
1.525149, -0.695695, 2.161936, 1, 0, 0.4078431, 1,
1.53955, -0.2589944, 1.42862, 1, 0, 0.4039216, 1,
1.553906, -0.5644577, 1.703419, 1, 0, 0.3960784, 1,
1.558531, -2.040009, 1.670543, 1, 0, 0.3882353, 1,
1.57965, -0.2731348, 1.853668, 1, 0, 0.3843137, 1,
1.586557, 0.1188385, 1.396504, 1, 0, 0.3764706, 1,
1.605384, 1.223844, -0.03909046, 1, 0, 0.372549, 1,
1.613451, -0.1386399, 2.131795, 1, 0, 0.3647059, 1,
1.626574, -0.6572308, 2.218265, 1, 0, 0.3607843, 1,
1.626895, 0.1563321, 2.031049, 1, 0, 0.3529412, 1,
1.632893, 0.404741, 1.109296, 1, 0, 0.3490196, 1,
1.653239, 0.8043513, 1.5203, 1, 0, 0.3411765, 1,
1.659002, -0.2326123, 0.6757126, 1, 0, 0.3372549, 1,
1.659181, -1.292921, 1.613341, 1, 0, 0.3294118, 1,
1.67234, -0.6031401, 1.741137, 1, 0, 0.3254902, 1,
1.681192, -0.009767832, 0.02225874, 1, 0, 0.3176471, 1,
1.686393, -1.034023, 1.147299, 1, 0, 0.3137255, 1,
1.689823, -1.19039, 2.564229, 1, 0, 0.3058824, 1,
1.694511, -0.1911238, 1.793026, 1, 0, 0.2980392, 1,
1.723429, 1.014314, 2.341259, 1, 0, 0.2941177, 1,
1.742066, -1.302356, 4.078348, 1, 0, 0.2862745, 1,
1.752138, 0.08564781, 3.051455, 1, 0, 0.282353, 1,
1.803681, 0.5750526, 1.551243, 1, 0, 0.2745098, 1,
1.820135, 1.405209, 1.027362, 1, 0, 0.2705882, 1,
1.854866, -0.2452815, 2.164211, 1, 0, 0.2627451, 1,
1.883397, -0.2390721, 1.761779, 1, 0, 0.2588235, 1,
1.883739, 0.4551444, 2.886083, 1, 0, 0.2509804, 1,
1.886097, 0.8195432, 1.413576, 1, 0, 0.2470588, 1,
1.889201, 1.667812, 1.34237, 1, 0, 0.2392157, 1,
1.893981, -0.1791532, 1.478698, 1, 0, 0.2352941, 1,
1.894382, 1.050805, 0.9859778, 1, 0, 0.227451, 1,
1.896063, 0.7659067, 0.6068637, 1, 0, 0.2235294, 1,
1.901265, -0.2710671, 2.647363, 1, 0, 0.2156863, 1,
1.905227, 0.545452, 0.6043732, 1, 0, 0.2117647, 1,
1.930441, 1.250468, 2.30952, 1, 0, 0.2039216, 1,
1.93472, 0.4126391, 0.7869052, 1, 0, 0.1960784, 1,
1.957917, 0.09261952, 2.375042, 1, 0, 0.1921569, 1,
1.972508, -1.699827, 2.856266, 1, 0, 0.1843137, 1,
1.985511, 0.2764425, 0.6031401, 1, 0, 0.1803922, 1,
2.001931, -0.2167695, 1.84095, 1, 0, 0.172549, 1,
2.005919, -0.9401911, 0.8384373, 1, 0, 0.1686275, 1,
2.043683, -0.5967904, 2.789898, 1, 0, 0.1607843, 1,
2.045778, -0.7421163, 1.590065, 1, 0, 0.1568628, 1,
2.061592, -0.5766303, 3.045243, 1, 0, 0.1490196, 1,
2.086167, -0.8003114, 1.754904, 1, 0, 0.145098, 1,
2.086656, -2.17965, 1.801672, 1, 0, 0.1372549, 1,
2.093955, -0.5430494, 0.2660294, 1, 0, 0.1333333, 1,
2.149114, -0.2497026, 1.043641, 1, 0, 0.1254902, 1,
2.197781, 0.2161778, -0.07093934, 1, 0, 0.1215686, 1,
2.229579, -1.553926, 3.461927, 1, 0, 0.1137255, 1,
2.241698, -0.004473944, 2.208421, 1, 0, 0.1098039, 1,
2.260809, -0.1805594, 2.537416, 1, 0, 0.1019608, 1,
2.302206, 0.8644211, 1.400964, 1, 0, 0.09411765, 1,
2.302349, 0.545168, 1.210804, 1, 0, 0.09019608, 1,
2.325736, -1.403957, 3.31871, 1, 0, 0.08235294, 1,
2.347882, -0.655991, 2.433318, 1, 0, 0.07843138, 1,
2.350252, 0.6260002, 2.193473, 1, 0, 0.07058824, 1,
2.366632, 0.3484755, 2.138786, 1, 0, 0.06666667, 1,
2.42792, 0.3385609, -0.07142991, 1, 0, 0.05882353, 1,
2.476089, 0.4992724, -0.1230562, 1, 0, 0.05490196, 1,
2.493161, 0.7846898, 2.854331, 1, 0, 0.04705882, 1,
2.701085, 0.862799, -0.007227193, 1, 0, 0.04313726, 1,
2.703738, -1.739612, 1.416427, 1, 0, 0.03529412, 1,
2.717488, 1.541131, 1.005041, 1, 0, 0.03137255, 1,
2.862882, 1.883474, 1.114313, 1, 0, 0.02352941, 1,
3.001851, -0.4007294, 2.471251, 1, 0, 0.01960784, 1,
3.016411, -0.04906223, 1.77151, 1, 0, 0.01176471, 1,
3.090553, 0.6855053, 0.4181888, 1, 0, 0.007843138, 1
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
0.03767955, -3.867605, -7.011009, 0, -0.5, 0.5, 0.5,
0.03767955, -3.867605, -7.011009, 1, -0.5, 0.5, 0.5,
0.03767955, -3.867605, -7.011009, 1, 1.5, 0.5, 0.5,
0.03767955, -3.867605, -7.011009, 0, 1.5, 0.5, 0.5
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
-4.050118, 0.8208005, -7.011009, 0, -0.5, 0.5, 0.5,
-4.050118, 0.8208005, -7.011009, 1, -0.5, 0.5, 0.5,
-4.050118, 0.8208005, -7.011009, 1, 1.5, 0.5, 0.5,
-4.050118, 0.8208005, -7.011009, 0, 1.5, 0.5, 0.5
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
-4.050118, -3.867605, -0.1689608, 0, -0.5, 0.5, 0.5,
-4.050118, -3.867605, -0.1689608, 1, -0.5, 0.5, 0.5,
-4.050118, -3.867605, -0.1689608, 1, 1.5, 0.5, 0.5,
-4.050118, -3.867605, -0.1689608, 0, 1.5, 0.5, 0.5
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
-3, -2.785665, -5.432075,
3, -2.785665, -5.432075,
-3, -2.785665, -5.432075,
-3, -2.965989, -5.69523,
-2, -2.785665, -5.432075,
-2, -2.965989, -5.69523,
-1, -2.785665, -5.432075,
-1, -2.965989, -5.69523,
0, -2.785665, -5.432075,
0, -2.965989, -5.69523,
1, -2.785665, -5.432075,
1, -2.965989, -5.69523,
2, -2.785665, -5.432075,
2, -2.965989, -5.69523,
3, -2.785665, -5.432075,
3, -2.965989, -5.69523
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
-3, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
-3, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
-3, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
-3, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
-2, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
-2, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
-2, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
-2, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
-1, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
-1, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
-1, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
-1, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
0, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
0, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
0, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
0, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
1, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
1, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
1, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
1, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
2, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
2, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
2, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
2, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5,
3, -3.326635, -6.221541, 0, -0.5, 0.5, 0.5,
3, -3.326635, -6.221541, 1, -0.5, 0.5, 0.5,
3, -3.326635, -6.221541, 1, 1.5, 0.5, 0.5,
3, -3.326635, -6.221541, 0, 1.5, 0.5, 0.5
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
-3.10678, -2, -5.432075,
-3.10678, 4, -5.432075,
-3.10678, -2, -5.432075,
-3.264003, -2, -5.69523,
-3.10678, 0, -5.432075,
-3.264003, 0, -5.69523,
-3.10678, 2, -5.432075,
-3.264003, 2, -5.69523,
-3.10678, 4, -5.432075,
-3.264003, 4, -5.69523
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
-3.578449, -2, -6.221541, 0, -0.5, 0.5, 0.5,
-3.578449, -2, -6.221541, 1, -0.5, 0.5, 0.5,
-3.578449, -2, -6.221541, 1, 1.5, 0.5, 0.5,
-3.578449, -2, -6.221541, 0, 1.5, 0.5, 0.5,
-3.578449, 0, -6.221541, 0, -0.5, 0.5, 0.5,
-3.578449, 0, -6.221541, 1, -0.5, 0.5, 0.5,
-3.578449, 0, -6.221541, 1, 1.5, 0.5, 0.5,
-3.578449, 0, -6.221541, 0, 1.5, 0.5, 0.5,
-3.578449, 2, -6.221541, 0, -0.5, 0.5, 0.5,
-3.578449, 2, -6.221541, 1, -0.5, 0.5, 0.5,
-3.578449, 2, -6.221541, 1, 1.5, 0.5, 0.5,
-3.578449, 2, -6.221541, 0, 1.5, 0.5, 0.5,
-3.578449, 4, -6.221541, 0, -0.5, 0.5, 0.5,
-3.578449, 4, -6.221541, 1, -0.5, 0.5, 0.5,
-3.578449, 4, -6.221541, 1, 1.5, 0.5, 0.5,
-3.578449, 4, -6.221541, 0, 1.5, 0.5, 0.5
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
-3.10678, -2.785665, -4,
-3.10678, -2.785665, 4,
-3.10678, -2.785665, -4,
-3.264003, -2.965989, -4,
-3.10678, -2.785665, -2,
-3.264003, -2.965989, -2,
-3.10678, -2.785665, 0,
-3.264003, -2.965989, 0,
-3.10678, -2.785665, 2,
-3.264003, -2.965989, 2,
-3.10678, -2.785665, 4,
-3.264003, -2.965989, 4
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
-3.578449, -3.326635, -4, 0, -0.5, 0.5, 0.5,
-3.578449, -3.326635, -4, 1, -0.5, 0.5, 0.5,
-3.578449, -3.326635, -4, 1, 1.5, 0.5, 0.5,
-3.578449, -3.326635, -4, 0, 1.5, 0.5, 0.5,
-3.578449, -3.326635, -2, 0, -0.5, 0.5, 0.5,
-3.578449, -3.326635, -2, 1, -0.5, 0.5, 0.5,
-3.578449, -3.326635, -2, 1, 1.5, 0.5, 0.5,
-3.578449, -3.326635, -2, 0, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 0, 0, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 0, 1, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 0, 1, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 0, 0, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 2, 0, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 2, 1, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 2, 1, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 2, 0, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 4, 0, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 4, 1, -0.5, 0.5, 0.5,
-3.578449, -3.326635, 4, 1, 1.5, 0.5, 0.5,
-3.578449, -3.326635, 4, 0, 1.5, 0.5, 0.5
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
-3.10678, -2.785665, -5.432075,
-3.10678, 4.427266, -5.432075,
-3.10678, -2.785665, 5.094153,
-3.10678, 4.427266, 5.094153,
-3.10678, -2.785665, -5.432075,
-3.10678, -2.785665, 5.094153,
-3.10678, 4.427266, -5.432075,
-3.10678, 4.427266, 5.094153,
-3.10678, -2.785665, -5.432075,
3.182139, -2.785665, -5.432075,
-3.10678, -2.785665, 5.094153,
3.182139, -2.785665, 5.094153,
-3.10678, 4.427266, -5.432075,
3.182139, 4.427266, -5.432075,
-3.10678, 4.427266, 5.094153,
3.182139, 4.427266, 5.094153,
3.182139, -2.785665, -5.432075,
3.182139, 4.427266, -5.432075,
3.182139, -2.785665, 5.094153,
3.182139, 4.427266, 5.094153,
3.182139, -2.785665, -5.432075,
3.182139, -2.785665, 5.094153,
3.182139, 4.427266, -5.432075,
3.182139, 4.427266, 5.094153
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
var radius = 7.596394;
var distance = 33.79721;
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
mvMatrix.translate( -0.03767955, -0.8208005, 0.1689608 );
mvMatrix.scale( 1.306007, 1.138701, 0.7802767 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79721);
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


