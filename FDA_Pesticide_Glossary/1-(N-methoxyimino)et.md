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
-3.039396, 0.003358886, -3.882685, 1, 0, 0, 1,
-3.028184, 1.763394, -1.692964, 1, 0.007843138, 0, 1,
-2.740237, 1.070196, -2.539579, 1, 0.01176471, 0, 1,
-2.679588, 0.4419259, -0.7287576, 1, 0.01960784, 0, 1,
-2.540308, -2.859975, -1.690406, 1, 0.02352941, 0, 1,
-2.478791, 0.4646681, -2.681589, 1, 0.03137255, 0, 1,
-2.416176, -0.008635922, -1.266047, 1, 0.03529412, 0, 1,
-2.373927, -0.2397587, -2.879282, 1, 0.04313726, 0, 1,
-2.368511, -0.2472978, -1.969607, 1, 0.04705882, 0, 1,
-2.358763, -0.1344646, -3.139645, 1, 0.05490196, 0, 1,
-2.255557, 1.445255, -0.6464248, 1, 0.05882353, 0, 1,
-2.234697, -0.2150568, -0.8476616, 1, 0.06666667, 0, 1,
-2.196296, -0.1726139, -1.507666, 1, 0.07058824, 0, 1,
-2.19205, 0.3451135, -1.781961, 1, 0.07843138, 0, 1,
-2.18188, 0.1795671, -1.955108, 1, 0.08235294, 0, 1,
-2.158562, -3.025295, -3.531704, 1, 0.09019608, 0, 1,
-2.131455, 0.1992752, -2.948708, 1, 0.09411765, 0, 1,
-2.089639, 2.403542, -2.670642, 1, 0.1019608, 0, 1,
-2.085555, 0.3986964, -2.608304, 1, 0.1098039, 0, 1,
-2.058867, 0.7500614, -1.908284, 1, 0.1137255, 0, 1,
-2.050602, 0.1711204, -1.655359, 1, 0.1215686, 0, 1,
-2.048359, 0.4586323, -2.272429, 1, 0.1254902, 0, 1,
-2.043279, -0.2044408, -2.299933, 1, 0.1333333, 0, 1,
-2.016591, -0.1583835, -2.159091, 1, 0.1372549, 0, 1,
-2.010313, 0.4490969, -1.814596, 1, 0.145098, 0, 1,
-2.00277, -1.877194, -3.05996, 1, 0.1490196, 0, 1,
-2.00069, 0.05552728, -0.1952748, 1, 0.1568628, 0, 1,
-1.99555, -1.36497, -2.346181, 1, 0.1607843, 0, 1,
-1.959799, -0.8448697, -1.759047, 1, 0.1686275, 0, 1,
-1.958431, 0.2971079, -1.709502, 1, 0.172549, 0, 1,
-1.923416, 1.012134, -1.28875, 1, 0.1803922, 0, 1,
-1.916203, 0.19486, -2.111018, 1, 0.1843137, 0, 1,
-1.885173, 0.6243433, 0.5031245, 1, 0.1921569, 0, 1,
-1.876237, -0.9803533, -3.288363, 1, 0.1960784, 0, 1,
-1.862859, -0.267804, -0.4355778, 1, 0.2039216, 0, 1,
-1.848127, -0.3223735, -1.244784, 1, 0.2117647, 0, 1,
-1.838969, 1.664974, -0.5097883, 1, 0.2156863, 0, 1,
-1.835562, -0.4883378, -2.551974, 1, 0.2235294, 0, 1,
-1.787754, -0.5349913, -1.844758, 1, 0.227451, 0, 1,
-1.782658, -0.3707063, -2.05481, 1, 0.2352941, 0, 1,
-1.77671, -1.93688, -1.238436, 1, 0.2392157, 0, 1,
-1.766895, 0.2647801, -0.6586164, 1, 0.2470588, 0, 1,
-1.737524, -0.4479149, -1.116728, 1, 0.2509804, 0, 1,
-1.722731, -0.04396571, -0.5858348, 1, 0.2588235, 0, 1,
-1.719746, -1.46955, -3.168045, 1, 0.2627451, 0, 1,
-1.716422, -1.671562, -1.938807, 1, 0.2705882, 0, 1,
-1.691393, -0.6089479, -0.6610608, 1, 0.2745098, 0, 1,
-1.681479, 1.452579, 0.06783868, 1, 0.282353, 0, 1,
-1.679591, -0.9112515, -3.536844, 1, 0.2862745, 0, 1,
-1.66498, 0.1984401, 0.151628, 1, 0.2941177, 0, 1,
-1.661247, -0.6942495, -0.2492948, 1, 0.3019608, 0, 1,
-1.660441, 1.43749, 1.189672, 1, 0.3058824, 0, 1,
-1.658375, 0.8189303, -1.080406, 1, 0.3137255, 0, 1,
-1.656348, -0.9898898, -2.791041, 1, 0.3176471, 0, 1,
-1.64389, 0.7689155, 0.7778957, 1, 0.3254902, 0, 1,
-1.615837, -0.2448095, -1.148357, 1, 0.3294118, 0, 1,
-1.591982, -0.3627588, -1.261431, 1, 0.3372549, 0, 1,
-1.589347, -0.1318585, -1.375648, 1, 0.3411765, 0, 1,
-1.583745, 1.5565, -1.495561, 1, 0.3490196, 0, 1,
-1.578146, -1.799852, -2.517851, 1, 0.3529412, 0, 1,
-1.576635, 1.56288, 0.3473111, 1, 0.3607843, 0, 1,
-1.558257, 1.122008, 0.5844832, 1, 0.3647059, 0, 1,
-1.549567, 1.132169, -0.0589144, 1, 0.372549, 0, 1,
-1.540123, 2.077766, -1.103759, 1, 0.3764706, 0, 1,
-1.537559, 0.8007625, -1.204896, 1, 0.3843137, 0, 1,
-1.536187, -0.5608425, -1.863105, 1, 0.3882353, 0, 1,
-1.535483, -0.8226333, -2.165302, 1, 0.3960784, 0, 1,
-1.528593, -0.9515342, -2.691056, 1, 0.4039216, 0, 1,
-1.522718, 0.2109587, -0.7072653, 1, 0.4078431, 0, 1,
-1.516359, 0.1181834, -0.8387228, 1, 0.4156863, 0, 1,
-1.512458, 1.145156, -0.7793796, 1, 0.4196078, 0, 1,
-1.506323, -0.7429705, -2.298516, 1, 0.427451, 0, 1,
-1.503174, 0.5023499, -2.823157, 1, 0.4313726, 0, 1,
-1.493272, -0.9329093, -2.696738, 1, 0.4392157, 0, 1,
-1.491377, 2.112361, -1.216863, 1, 0.4431373, 0, 1,
-1.482161, -1.516389, -3.973452, 1, 0.4509804, 0, 1,
-1.46995, -0.6935662, -3.511897, 1, 0.454902, 0, 1,
-1.461098, 0.7239822, 0.2569246, 1, 0.4627451, 0, 1,
-1.454949, -0.9353713, -1.698105, 1, 0.4666667, 0, 1,
-1.442868, 2.364569, -0.2475557, 1, 0.4745098, 0, 1,
-1.442416, 0.1725501, -1.08524, 1, 0.4784314, 0, 1,
-1.437435, 2.055371, -1.775037, 1, 0.4862745, 0, 1,
-1.43533, -1.439983, -1.806843, 1, 0.4901961, 0, 1,
-1.434458, 0.3747771, -1.568901, 1, 0.4980392, 0, 1,
-1.433491, -1.047413, -2.917925, 1, 0.5058824, 0, 1,
-1.432025, 0.1889747, -1.200516, 1, 0.509804, 0, 1,
-1.430451, 0.6898141, -1.08568, 1, 0.5176471, 0, 1,
-1.429277, -0.6530144, -2.392652, 1, 0.5215687, 0, 1,
-1.426469, -1.071732, -3.16538, 1, 0.5294118, 0, 1,
-1.408476, 0.353808, 0.7564546, 1, 0.5333334, 0, 1,
-1.400119, -0.8422998, -0.4724739, 1, 0.5411765, 0, 1,
-1.393544, -0.836742, -3.210626, 1, 0.5450981, 0, 1,
-1.386043, 0.05886427, -2.096899, 1, 0.5529412, 0, 1,
-1.385878, -0.2015464, -0.1143451, 1, 0.5568628, 0, 1,
-1.368154, -0.9908856, -1.890156, 1, 0.5647059, 0, 1,
-1.3669, -0.2918313, -2.287491, 1, 0.5686275, 0, 1,
-1.346642, 1.505468, -1.188686, 1, 0.5764706, 0, 1,
-1.337574, 1.484213, 0.05489975, 1, 0.5803922, 0, 1,
-1.330479, -0.5220981, -1.115303, 1, 0.5882353, 0, 1,
-1.319858, 0.5349287, -1.368501, 1, 0.5921569, 0, 1,
-1.31775, 0.5794598, -1.425262, 1, 0.6, 0, 1,
-1.30825, -0.5181597, -2.520659, 1, 0.6078432, 0, 1,
-1.305178, 0.7068786, -1.691874, 1, 0.6117647, 0, 1,
-1.301969, 0.4541035, 0.5437704, 1, 0.6196079, 0, 1,
-1.299862, -0.7387182, -2.786378, 1, 0.6235294, 0, 1,
-1.298764, -0.1237324, -0.6784326, 1, 0.6313726, 0, 1,
-1.298082, 0.2355403, -1.134248, 1, 0.6352941, 0, 1,
-1.290804, 0.7090865, -0.5729438, 1, 0.6431373, 0, 1,
-1.28539, -0.6672911, -2.403634, 1, 0.6470588, 0, 1,
-1.285055, -1.60045, -3.246964, 1, 0.654902, 0, 1,
-1.277566, 0.07102863, -0.02180133, 1, 0.6588235, 0, 1,
-1.276413, 0.8125149, -1.419394, 1, 0.6666667, 0, 1,
-1.271478, 0.9892291, -0.9362801, 1, 0.6705883, 0, 1,
-1.270364, 0.4371709, -1.092705, 1, 0.6784314, 0, 1,
-1.269543, -0.01538788, -0.6695268, 1, 0.682353, 0, 1,
-1.266971, 1.899861, -1.521789, 1, 0.6901961, 0, 1,
-1.264814, -0.2564318, -1.500653, 1, 0.6941177, 0, 1,
-1.256544, -0.3810064, -4.136663, 1, 0.7019608, 0, 1,
-1.250064, -1.332023, -2.966471, 1, 0.7098039, 0, 1,
-1.249706, -0.9623622, -1.018597, 1, 0.7137255, 0, 1,
-1.246834, -0.6347445, -2.613556, 1, 0.7215686, 0, 1,
-1.230465, 1.126186, -0.4198813, 1, 0.7254902, 0, 1,
-1.21484, -0.383648, -3.27043, 1, 0.7333333, 0, 1,
-1.211626, -1.381864, -3.01672, 1, 0.7372549, 0, 1,
-1.206702, -0.2471565, -1.611958, 1, 0.7450981, 0, 1,
-1.203362, 0.6465648, 1.06298, 1, 0.7490196, 0, 1,
-1.199857, -1.67765, -2.894922, 1, 0.7568628, 0, 1,
-1.198048, -0.5963186, -1.748379, 1, 0.7607843, 0, 1,
-1.1834, 0.5951293, 0.4365178, 1, 0.7686275, 0, 1,
-1.175403, 0.5650882, -2.097968, 1, 0.772549, 0, 1,
-1.173787, 0.603532, -0.9518222, 1, 0.7803922, 0, 1,
-1.168223, 0.1768124, -0.5537383, 1, 0.7843137, 0, 1,
-1.145985, 0.1083859, -3.412632, 1, 0.7921569, 0, 1,
-1.144606, -0.5421531, -1.772488, 1, 0.7960784, 0, 1,
-1.142962, -0.3461378, -1.953003, 1, 0.8039216, 0, 1,
-1.137259, 1.410451, -0.259182, 1, 0.8117647, 0, 1,
-1.129804, 0.1690813, -1.870486, 1, 0.8156863, 0, 1,
-1.116433, -0.05121153, -1.438934, 1, 0.8235294, 0, 1,
-1.104099, -0.3456302, -1.659593, 1, 0.827451, 0, 1,
-1.09724, 0.2999712, -1.331804, 1, 0.8352941, 0, 1,
-1.091798, -0.6299535, -3.782505, 1, 0.8392157, 0, 1,
-1.088785, 0.07182395, -1.323665, 1, 0.8470588, 0, 1,
-1.087083, 0.4581818, -2.462026, 1, 0.8509804, 0, 1,
-1.083995, 1.478367, -0.3705677, 1, 0.8588235, 0, 1,
-1.081133, 0.1030219, -1.23296, 1, 0.8627451, 0, 1,
-1.062303, -0.4507148, -1.973599, 1, 0.8705882, 0, 1,
-1.059414, -1.571441, -3.985991, 1, 0.8745098, 0, 1,
-1.058193, 0.4447751, -0.5953109, 1, 0.8823529, 0, 1,
-1.055513, -0.06367017, -1.125213, 1, 0.8862745, 0, 1,
-1.045891, 0.5490258, -1.747703, 1, 0.8941177, 0, 1,
-1.042097, 0.3602501, -0.9808517, 1, 0.8980392, 0, 1,
-1.038419, 0.440715, -0.2281453, 1, 0.9058824, 0, 1,
-1.036752, 0.8290811, -1.600107, 1, 0.9137255, 0, 1,
-1.031051, 0.7598006, 0.6339532, 1, 0.9176471, 0, 1,
-1.027968, 1.434634, -1.976447, 1, 0.9254902, 0, 1,
-1.015552, -0.908958, -2.708768, 1, 0.9294118, 0, 1,
-1.014209, -0.8834831, -2.653675, 1, 0.9372549, 0, 1,
-1.005603, -0.7246447, -2.728039, 1, 0.9411765, 0, 1,
-0.9990546, -0.2583906, -1.498621, 1, 0.9490196, 0, 1,
-0.9945785, -0.4276995, -2.173814, 1, 0.9529412, 0, 1,
-0.9937608, -1.838715, -0.7609956, 1, 0.9607843, 0, 1,
-0.9901758, -0.2204127, -2.238832, 1, 0.9647059, 0, 1,
-0.9896853, -0.1510273, -2.723763, 1, 0.972549, 0, 1,
-0.9888174, 0.2334353, 0.6229798, 1, 0.9764706, 0, 1,
-0.9822359, -0.4688083, -2.407583, 1, 0.9843137, 0, 1,
-0.9757198, -0.880433, -1.365231, 1, 0.9882353, 0, 1,
-0.9687815, -0.777366, -1.68446, 1, 0.9960784, 0, 1,
-0.9669338, -0.1468419, -1.642535, 0.9960784, 1, 0, 1,
-0.9656559, -0.1577688, -4.48964, 0.9921569, 1, 0, 1,
-0.9634009, -0.8168284, -1.158487, 0.9843137, 1, 0, 1,
-0.9592343, -1.255248, -0.3812051, 0.9803922, 1, 0, 1,
-0.9550583, 0.2920097, -0.01176147, 0.972549, 1, 0, 1,
-0.9517699, -0.8774335, -2.603001, 0.9686275, 1, 0, 1,
-0.9516996, -2.978528, 0.1732392, 0.9607843, 1, 0, 1,
-0.9431575, 0.9702237, -2.114093, 0.9568627, 1, 0, 1,
-0.9373984, 1.976936, -1.011741, 0.9490196, 1, 0, 1,
-0.9368455, -0.9600648, -2.899188, 0.945098, 1, 0, 1,
-0.9360618, 1.714417, 0.03312235, 0.9372549, 1, 0, 1,
-0.9332877, -0.2879974, -2.735156, 0.9333333, 1, 0, 1,
-0.9284852, 0.0507886, -1.573907, 0.9254902, 1, 0, 1,
-0.9179969, 0.8978889, -0.08323827, 0.9215686, 1, 0, 1,
-0.9107825, 1.344912, 0.3871885, 0.9137255, 1, 0, 1,
-0.9089622, 0.2918789, 0.1766469, 0.9098039, 1, 0, 1,
-0.8994279, 0.8871555, 0.04048113, 0.9019608, 1, 0, 1,
-0.8960755, 1.306983, 0.359674, 0.8941177, 1, 0, 1,
-0.88451, 0.9531596, -0.4092923, 0.8901961, 1, 0, 1,
-0.8822204, -0.5406454, -3.711333, 0.8823529, 1, 0, 1,
-0.8736703, 0.7200084, -0.4677405, 0.8784314, 1, 0, 1,
-0.8732569, 0.3216387, -2.447546, 0.8705882, 1, 0, 1,
-0.871547, 0.0285959, -2.74557, 0.8666667, 1, 0, 1,
-0.8459081, 0.3090885, -0.09850416, 0.8588235, 1, 0, 1,
-0.8386917, -0.2129589, -1.116569, 0.854902, 1, 0, 1,
-0.8371374, 0.434638, -2.35307, 0.8470588, 1, 0, 1,
-0.8343641, -0.9541731, -1.770417, 0.8431373, 1, 0, 1,
-0.8294395, -0.3881928, -3.138308, 0.8352941, 1, 0, 1,
-0.8284474, 1.953339, -0.8817968, 0.8313726, 1, 0, 1,
-0.8258035, -1.192301, -2.366464, 0.8235294, 1, 0, 1,
-0.8229024, -0.1723022, -1.70132, 0.8196079, 1, 0, 1,
-0.8176608, -0.307001, -1.843614, 0.8117647, 1, 0, 1,
-0.8140023, 0.05432797, -2.282901, 0.8078431, 1, 0, 1,
-0.8052173, 0.5157751, -0.6307831, 0.8, 1, 0, 1,
-0.8026854, 0.9726508, -1.676281, 0.7921569, 1, 0, 1,
-0.8013393, -0.7376992, -2.530583, 0.7882353, 1, 0, 1,
-0.7981576, 0.9558936, -1.0006, 0.7803922, 1, 0, 1,
-0.793673, -1.493379, -4.176897, 0.7764706, 1, 0, 1,
-0.7815884, -0.101118, -2.677034, 0.7686275, 1, 0, 1,
-0.7793727, 0.5761722, -1.662525, 0.7647059, 1, 0, 1,
-0.7666007, 1.504407, 1.150057, 0.7568628, 1, 0, 1,
-0.7630539, -0.05590664, -1.084997, 0.7529412, 1, 0, 1,
-0.7504402, -0.9924002, -2.450854, 0.7450981, 1, 0, 1,
-0.7493429, -1.208241, -1.755541, 0.7411765, 1, 0, 1,
-0.7398047, -0.8609926, -1.624312, 0.7333333, 1, 0, 1,
-0.7329375, 1.286269, -0.8325553, 0.7294118, 1, 0, 1,
-0.7305042, 0.325791, -1.549579, 0.7215686, 1, 0, 1,
-0.7283418, -1.801489, -3.540524, 0.7176471, 1, 0, 1,
-0.7265235, 1.218329, -0.2054786, 0.7098039, 1, 0, 1,
-0.723996, 1.018968, -1.951213, 0.7058824, 1, 0, 1,
-0.7208985, -0.7964377, -1.708501, 0.6980392, 1, 0, 1,
-0.7198036, 0.1854601, -0.6862185, 0.6901961, 1, 0, 1,
-0.7055249, -1.691923, -3.149716, 0.6862745, 1, 0, 1,
-0.7048495, -0.001020706, -1.004496, 0.6784314, 1, 0, 1,
-0.7029983, -0.2107375, -3.904673, 0.6745098, 1, 0, 1,
-0.6941612, 0.7173337, 0.233431, 0.6666667, 1, 0, 1,
-0.6926297, 0.803479, -1.496495, 0.6627451, 1, 0, 1,
-0.6845962, 1.140971, 0.6447426, 0.654902, 1, 0, 1,
-0.6815883, -0.3277575, -2.954051, 0.6509804, 1, 0, 1,
-0.6792887, -0.6472194, -1.122557, 0.6431373, 1, 0, 1,
-0.678739, 0.9859585, -0.213092, 0.6392157, 1, 0, 1,
-0.6758627, 0.2285988, -2.246804, 0.6313726, 1, 0, 1,
-0.6686554, -0.4635223, -1.501511, 0.627451, 1, 0, 1,
-0.6663505, -0.008476409, -0.6234372, 0.6196079, 1, 0, 1,
-0.6643524, -1.760876, -2.713509, 0.6156863, 1, 0, 1,
-0.663742, -0.3363546, -1.985244, 0.6078432, 1, 0, 1,
-0.6627026, 1.085785, -1.443744, 0.6039216, 1, 0, 1,
-0.6593165, 0.3167879, -0.05475584, 0.5960785, 1, 0, 1,
-0.6526303, 0.4037792, -2.086347, 0.5882353, 1, 0, 1,
-0.6514125, 0.2010807, -1.972656, 0.5843138, 1, 0, 1,
-0.6490922, 0.1008522, -0.9418208, 0.5764706, 1, 0, 1,
-0.6482082, -1.880592, -3.36265, 0.572549, 1, 0, 1,
-0.6412935, -0.2675933, -1.436448, 0.5647059, 1, 0, 1,
-0.6390654, 0.9001952, -0.4045793, 0.5607843, 1, 0, 1,
-0.6357294, 1.398912, 1.786936, 0.5529412, 1, 0, 1,
-0.6353794, -1.410451, -2.292813, 0.5490196, 1, 0, 1,
-0.6270972, 0.09528358, -1.081858, 0.5411765, 1, 0, 1,
-0.6255571, 1.370542, -0.4816415, 0.5372549, 1, 0, 1,
-0.6249471, 0.9289299, -0.3743291, 0.5294118, 1, 0, 1,
-0.6225109, 0.8023959, 0.392759, 0.5254902, 1, 0, 1,
-0.6217754, 0.5288672, 0.997541, 0.5176471, 1, 0, 1,
-0.6212998, 1.190401, -0.374969, 0.5137255, 1, 0, 1,
-0.619684, 0.2323607, -2.752521, 0.5058824, 1, 0, 1,
-0.6188984, -1.271458, -2.266048, 0.5019608, 1, 0, 1,
-0.6183864, 0.006269058, -2.016774, 0.4941176, 1, 0, 1,
-0.6087986, -0.5700936, -3.226121, 0.4862745, 1, 0, 1,
-0.6069989, -0.5180401, -0.9421776, 0.4823529, 1, 0, 1,
-0.6069862, -1.535157, -3.519515, 0.4745098, 1, 0, 1,
-0.6030957, -0.2157623, -0.4623563, 0.4705882, 1, 0, 1,
-0.5962917, -1.494458, -1.867404, 0.4627451, 1, 0, 1,
-0.5958344, -1.151117, -1.250705, 0.4588235, 1, 0, 1,
-0.5865317, -0.8749407, -2.270405, 0.4509804, 1, 0, 1,
-0.5827998, 0.4052869, 0.3687712, 0.4470588, 1, 0, 1,
-0.5698956, 1.47533, -0.4124364, 0.4392157, 1, 0, 1,
-0.5649828, 1.210694, -0.0196253, 0.4352941, 1, 0, 1,
-0.5649307, -1.263694, -1.290601, 0.427451, 1, 0, 1,
-0.5645663, 1.4449, -0.3647063, 0.4235294, 1, 0, 1,
-0.5635441, -1.862886, -3.223836, 0.4156863, 1, 0, 1,
-0.5603812, 0.7138457, -0.8454026, 0.4117647, 1, 0, 1,
-0.55444, -0.09029194, -1.099721, 0.4039216, 1, 0, 1,
-0.5537171, -0.8097405, -1.70537, 0.3960784, 1, 0, 1,
-0.5524033, -0.03615273, -1.832448, 0.3921569, 1, 0, 1,
-0.5523956, -0.8690315, -3.86452, 0.3843137, 1, 0, 1,
-0.5486667, 0.993275, -2.328514, 0.3803922, 1, 0, 1,
-0.5420297, 0.3969662, -2.358023, 0.372549, 1, 0, 1,
-0.5369142, 0.5250201, 0.5617386, 0.3686275, 1, 0, 1,
-0.53453, -0.8948192, -2.278468, 0.3607843, 1, 0, 1,
-0.528567, -1.615074, -2.993468, 0.3568628, 1, 0, 1,
-0.5275632, 0.3433771, -0.3476495, 0.3490196, 1, 0, 1,
-0.5254841, 0.7686276, -0.4063009, 0.345098, 1, 0, 1,
-0.5243022, -0.5693333, -2.799324, 0.3372549, 1, 0, 1,
-0.5235561, -0.8040491, -1.670819, 0.3333333, 1, 0, 1,
-0.5222821, 0.09079169, -1.485533, 0.3254902, 1, 0, 1,
-0.5170336, -0.6409466, -1.305495, 0.3215686, 1, 0, 1,
-0.5166954, 0.3339181, -2.106996, 0.3137255, 1, 0, 1,
-0.5099101, 1.000671, -2.105927, 0.3098039, 1, 0, 1,
-0.5061341, -0.3301749, -4.162384, 0.3019608, 1, 0, 1,
-0.5056306, -0.1484775, -1.848394, 0.2941177, 1, 0, 1,
-0.4992657, 0.4101456, -0.9914697, 0.2901961, 1, 0, 1,
-0.4981505, 0.09533478, -0.4195216, 0.282353, 1, 0, 1,
-0.4962603, -0.4241961, -2.360601, 0.2784314, 1, 0, 1,
-0.4923111, -0.6892048, -2.782079, 0.2705882, 1, 0, 1,
-0.4851395, 0.5100162, -1.659296, 0.2666667, 1, 0, 1,
-0.4845983, 0.0962426, -2.185253, 0.2588235, 1, 0, 1,
-0.4838955, -0.7915351, -2.747409, 0.254902, 1, 0, 1,
-0.4811051, -1.243939, -3.274205, 0.2470588, 1, 0, 1,
-0.4729674, -0.2955011, -2.255301, 0.2431373, 1, 0, 1,
-0.4723071, 1.761936, 0.189708, 0.2352941, 1, 0, 1,
-0.4612912, -0.7989705, -4.134529, 0.2313726, 1, 0, 1,
-0.4608509, -1.241105, -2.075701, 0.2235294, 1, 0, 1,
-0.4584804, -0.2344996, -2.066112, 0.2196078, 1, 0, 1,
-0.4573007, -0.7339413, -2.180001, 0.2117647, 1, 0, 1,
-0.4573005, 0.2433712, 0.00440802, 0.2078431, 1, 0, 1,
-0.4549203, -0.7757244, -2.80422, 0.2, 1, 0, 1,
-0.4531369, 0.5180106, -1.782651, 0.1921569, 1, 0, 1,
-0.4501548, 0.920518, -0.8116077, 0.1882353, 1, 0, 1,
-0.4491166, 1.293929, -3.039956, 0.1803922, 1, 0, 1,
-0.4453833, 1.26791, -0.6362067, 0.1764706, 1, 0, 1,
-0.4368569, 0.07415306, -1.316443, 0.1686275, 1, 0, 1,
-0.4339299, -1.448219, -2.941858, 0.1647059, 1, 0, 1,
-0.432449, -2.24367, -3.323567, 0.1568628, 1, 0, 1,
-0.4310993, -0.5506173, -4.058495, 0.1529412, 1, 0, 1,
-0.4268112, -0.6305279, -1.655188, 0.145098, 1, 0, 1,
-0.4253619, -0.2132442, -0.9725922, 0.1411765, 1, 0, 1,
-0.423734, 1.722432, 0.8057579, 0.1333333, 1, 0, 1,
-0.4182524, -0.2544118, -1.064148, 0.1294118, 1, 0, 1,
-0.4082063, -0.7977934, -2.250568, 0.1215686, 1, 0, 1,
-0.402229, 0.2045665, -2.038818, 0.1176471, 1, 0, 1,
-0.3971017, -0.6071653, -2.178609, 0.1098039, 1, 0, 1,
-0.3914164, -1.277227, -2.826421, 0.1058824, 1, 0, 1,
-0.3903409, 1.915015, -0.4190908, 0.09803922, 1, 0, 1,
-0.3902074, -0.9162109, -1.505752, 0.09019608, 1, 0, 1,
-0.3870076, 1.937623, 0.7495828, 0.08627451, 1, 0, 1,
-0.3859316, -0.8064205, -1.945983, 0.07843138, 1, 0, 1,
-0.3809044, 1.166653, 0.1046786, 0.07450981, 1, 0, 1,
-0.3775795, 0.124934, -3.130829, 0.06666667, 1, 0, 1,
-0.3691062, 0.5064118, -2.149673, 0.0627451, 1, 0, 1,
-0.3669588, -1.017887, -3.657373, 0.05490196, 1, 0, 1,
-0.3618867, -1.28736, -3.314484, 0.05098039, 1, 0, 1,
-0.3571542, -0.624687, -2.684504, 0.04313726, 1, 0, 1,
-0.3551356, 0.2488264, -0.7075862, 0.03921569, 1, 0, 1,
-0.3549128, -0.8986099, -3.054375, 0.03137255, 1, 0, 1,
-0.3548991, -0.3407629, -0.8084553, 0.02745098, 1, 0, 1,
-0.3504486, -1.020903, -3.60273, 0.01960784, 1, 0, 1,
-0.3491197, 0.7413682, -1.119032, 0.01568628, 1, 0, 1,
-0.3451725, 0.8282558, 0.3492553, 0.007843138, 1, 0, 1,
-0.3447754, 1.298023, -0.8559582, 0.003921569, 1, 0, 1,
-0.3417564, -0.04535942, -1.649829, 0, 1, 0.003921569, 1,
-0.33863, -0.7713824, -3.6263, 0, 1, 0.01176471, 1,
-0.3385403, -1.114815, -2.117334, 0, 1, 0.01568628, 1,
-0.3379622, -0.780504, -2.79236, 0, 1, 0.02352941, 1,
-0.3361343, 0.6247116, -3.002913, 0, 1, 0.02745098, 1,
-0.3270705, 0.4438341, -0.3643729, 0, 1, 0.03529412, 1,
-0.3253885, 0.2662896, -1.661658, 0, 1, 0.03921569, 1,
-0.3208403, 0.6839265, -0.4266916, 0, 1, 0.04705882, 1,
-0.3181973, -2.230629, -2.94678, 0, 1, 0.05098039, 1,
-0.3159658, 0.2537453, -0.5104424, 0, 1, 0.05882353, 1,
-0.3097188, -0.3356351, -2.302049, 0, 1, 0.0627451, 1,
-0.3067215, 0.8052489, -0.02718271, 0, 1, 0.07058824, 1,
-0.3025199, 0.9800551, -0.8988388, 0, 1, 0.07450981, 1,
-0.2992426, -0.151945, -2.636901, 0, 1, 0.08235294, 1,
-0.2971937, 1.094927, -0.5248847, 0, 1, 0.08627451, 1,
-0.2931178, 0.2655294, 0.036304, 0, 1, 0.09411765, 1,
-0.2891566, -2.022565, -3.780787, 0, 1, 0.1019608, 1,
-0.2769351, 0.3238417, 0.6042358, 0, 1, 0.1058824, 1,
-0.2755315, -0.8370991, -2.554314, 0, 1, 0.1137255, 1,
-0.2733169, -1.06784, -1.397234, 0, 1, 0.1176471, 1,
-0.2721198, -0.5995178, -2.661696, 0, 1, 0.1254902, 1,
-0.2718247, 0.02236619, -2.374443, 0, 1, 0.1294118, 1,
-0.2655857, -0.1577504, -1.475466, 0, 1, 0.1372549, 1,
-0.2652948, -0.8830726, -2.740684, 0, 1, 0.1411765, 1,
-0.2632737, 0.9175738, 0.2915795, 0, 1, 0.1490196, 1,
-0.2614064, -0.2229392, -2.594247, 0, 1, 0.1529412, 1,
-0.2605799, 0.8359183, -1.459044, 0, 1, 0.1607843, 1,
-0.2591012, 0.09263822, -2.095023, 0, 1, 0.1647059, 1,
-0.2562686, 1.861038, 0.5172358, 0, 1, 0.172549, 1,
-0.2546315, 0.984237, -0.05772808, 0, 1, 0.1764706, 1,
-0.2531571, 0.154026, -1.292306, 0, 1, 0.1843137, 1,
-0.2461837, -0.3978623, -1.779711, 0, 1, 0.1882353, 1,
-0.2438329, -0.7459435, -2.575299, 0, 1, 0.1960784, 1,
-0.2433234, -0.4912428, -1.922198, 0, 1, 0.2039216, 1,
-0.2431028, 1.445828, -0.7806751, 0, 1, 0.2078431, 1,
-0.237462, 0.2595457, -1.953558, 0, 1, 0.2156863, 1,
-0.2371415, 0.5930978, 0.274761, 0, 1, 0.2196078, 1,
-0.23424, -1.128305, -3.578706, 0, 1, 0.227451, 1,
-0.2336965, -1.129853, -2.776549, 0, 1, 0.2313726, 1,
-0.2326719, 0.1967689, -1.010338, 0, 1, 0.2392157, 1,
-0.2314985, -0.5035639, -2.512153, 0, 1, 0.2431373, 1,
-0.2303129, -0.03551532, -1.664548, 0, 1, 0.2509804, 1,
-0.2227324, -1.770411, -4.544706, 0, 1, 0.254902, 1,
-0.2203335, 1.547806, 0.6662207, 0, 1, 0.2627451, 1,
-0.2200025, -0.6002382, -1.631197, 0, 1, 0.2666667, 1,
-0.2196465, -0.4544973, -2.135157, 0, 1, 0.2745098, 1,
-0.2127415, 1.476212, -0.7341034, 0, 1, 0.2784314, 1,
-0.2111014, -0.903208, -2.38651, 0, 1, 0.2862745, 1,
-0.2095118, -0.9604563, -1.761196, 0, 1, 0.2901961, 1,
-0.197986, -0.4813569, -4.055684, 0, 1, 0.2980392, 1,
-0.1963634, -1.671299, -2.889961, 0, 1, 0.3058824, 1,
-0.1948158, 0.4750839, 0.916015, 0, 1, 0.3098039, 1,
-0.1922376, -0.08721346, -2.882497, 0, 1, 0.3176471, 1,
-0.1916995, -0.1704587, -1.830698, 0, 1, 0.3215686, 1,
-0.1908882, -0.1633636, -1.322779, 0, 1, 0.3294118, 1,
-0.1902815, -0.07645409, -1.044017, 0, 1, 0.3333333, 1,
-0.1810159, 0.5013002, 0.3594822, 0, 1, 0.3411765, 1,
-0.1774862, -2.465873, -2.971821, 0, 1, 0.345098, 1,
-0.1774479, -1.076941, -2.196788, 0, 1, 0.3529412, 1,
-0.1757192, 1.249045, -0.6067044, 0, 1, 0.3568628, 1,
-0.1753398, -1.931083, -3.191448, 0, 1, 0.3647059, 1,
-0.1739652, -1.279454, -2.178467, 0, 1, 0.3686275, 1,
-0.1734334, 0.9720582, -0.8992537, 0, 1, 0.3764706, 1,
-0.1732257, -1.896348, -1.917493, 0, 1, 0.3803922, 1,
-0.172986, 0.6444001, -1.398169, 0, 1, 0.3882353, 1,
-0.1729764, -0.8506846, -3.665206, 0, 1, 0.3921569, 1,
-0.1723669, -1.739553, -4.345181, 0, 1, 0.4, 1,
-0.1719749, 0.1189645, -2.396507, 0, 1, 0.4078431, 1,
-0.1716777, -0.5624253, -3.562131, 0, 1, 0.4117647, 1,
-0.1699809, 0.7236757, -0.2041497, 0, 1, 0.4196078, 1,
-0.1661821, -1.765662, -3.435683, 0, 1, 0.4235294, 1,
-0.161864, -0.4037051, -2.704829, 0, 1, 0.4313726, 1,
-0.1596946, 0.5189462, -0.3658459, 0, 1, 0.4352941, 1,
-0.1583678, -0.1595016, -1.436378, 0, 1, 0.4431373, 1,
-0.1582526, 1.325729, -0.02402391, 0, 1, 0.4470588, 1,
-0.1536145, -0.2583358, -4.155304, 0, 1, 0.454902, 1,
-0.15003, 0.7791602, -1.817959, 0, 1, 0.4588235, 1,
-0.1492305, 0.5668764, -1.423334, 0, 1, 0.4666667, 1,
-0.1488125, -0.565762, -2.067751, 0, 1, 0.4705882, 1,
-0.1459292, 1.465583, 1.663982, 0, 1, 0.4784314, 1,
-0.1389411, -0.5960297, -2.0896, 0, 1, 0.4823529, 1,
-0.1354641, -0.5352424, -3.14533, 0, 1, 0.4901961, 1,
-0.1331141, 1.301598, 0.8353928, 0, 1, 0.4941176, 1,
-0.1328882, 0.7640089, -1.459274, 0, 1, 0.5019608, 1,
-0.1309692, 0.6835119, -0.1257544, 0, 1, 0.509804, 1,
-0.1290284, 0.3469052, -0.3918997, 0, 1, 0.5137255, 1,
-0.1269761, -0.3258308, -1.389678, 0, 1, 0.5215687, 1,
-0.1179865, -0.240269, -4.312422, 0, 1, 0.5254902, 1,
-0.1157648, 0.1896846, -1.504501, 0, 1, 0.5333334, 1,
-0.1155401, -0.6958814, -2.921901, 0, 1, 0.5372549, 1,
-0.112849, -1.71663, -2.559338, 0, 1, 0.5450981, 1,
-0.1110192, 0.8438066, 0.01413055, 0, 1, 0.5490196, 1,
-0.1100546, -2.290155, -3.413374, 0, 1, 0.5568628, 1,
-0.1038161, -0.5111691, -4.462838, 0, 1, 0.5607843, 1,
-0.1010617, 1.100297, -0.4301906, 0, 1, 0.5686275, 1,
-0.1006389, 0.8947853, -0.7003328, 0, 1, 0.572549, 1,
-0.09664305, -0.6729716, -2.913845, 0, 1, 0.5803922, 1,
-0.09462356, 1.202979, 0.6782948, 0, 1, 0.5843138, 1,
-0.09120096, -0.9734299, -2.216829, 0, 1, 0.5921569, 1,
-0.08816454, 0.4782347, -1.337433, 0, 1, 0.5960785, 1,
-0.08757377, 1.815613, -1.534691, 0, 1, 0.6039216, 1,
-0.07991482, -0.2826898, -3.509758, 0, 1, 0.6117647, 1,
-0.07907929, -1.485034, -3.05427, 0, 1, 0.6156863, 1,
-0.0761866, 0.9939228, 0.6750887, 0, 1, 0.6235294, 1,
-0.07473101, 0.002341664, -1.247289, 0, 1, 0.627451, 1,
-0.07444713, -0.01797535, -1.081315, 0, 1, 0.6352941, 1,
-0.07386667, -0.6705967, -2.748522, 0, 1, 0.6392157, 1,
-0.0699695, -0.4738736, -2.562828, 0, 1, 0.6470588, 1,
-0.06596652, -0.7900457, -4.221092, 0, 1, 0.6509804, 1,
-0.0588247, -1.991558, -4.084184, 0, 1, 0.6588235, 1,
-0.0449122, -2.135163, -3.906421, 0, 1, 0.6627451, 1,
-0.04473726, -0.8771071, -2.102631, 0, 1, 0.6705883, 1,
-0.04394871, 0.4736801, -1.608578, 0, 1, 0.6745098, 1,
-0.04280704, -0.8462852, -1.672536, 0, 1, 0.682353, 1,
-0.04161847, 0.04303512, -0.5342969, 0, 1, 0.6862745, 1,
-0.03939939, 0.3330003, 0.03019767, 0, 1, 0.6941177, 1,
-0.03858307, 2.382412, -0.6658997, 0, 1, 0.7019608, 1,
-0.03459832, -0.6255535, -2.988624, 0, 1, 0.7058824, 1,
-0.0318274, -0.0925525, -4.213286, 0, 1, 0.7137255, 1,
-0.03160657, -1.187009, -2.75112, 0, 1, 0.7176471, 1,
-0.03093024, -0.9132437, -3.556699, 0, 1, 0.7254902, 1,
-0.02625531, -1.161645, -2.495327, 0, 1, 0.7294118, 1,
-0.02529396, 1.84424, -0.5456619, 0, 1, 0.7372549, 1,
-0.02518171, 0.533951, -0.4214654, 0, 1, 0.7411765, 1,
-0.02407768, 0.1711418, -0.1324367, 0, 1, 0.7490196, 1,
-0.02284383, -0.9799052, -2.810456, 0, 1, 0.7529412, 1,
-0.02067981, -1.796612, -4.280656, 0, 1, 0.7607843, 1,
-0.02066352, -0.3388873, -4.27647, 0, 1, 0.7647059, 1,
-0.02011926, -0.4849762, -5.651052, 0, 1, 0.772549, 1,
-0.01184677, -0.5752487, -3.672859, 0, 1, 0.7764706, 1,
-0.01085349, 1.066737, -0.6811283, 0, 1, 0.7843137, 1,
-0.008037308, 0.4910755, 0.1606537, 0, 1, 0.7882353, 1,
-0.00559431, 0.8366059, -0.01493064, 0, 1, 0.7960784, 1,
-0.003681901, 0.04369512, -2.284813, 0, 1, 0.8039216, 1,
0.002857735, -0.02393117, 4.298006, 0, 1, 0.8078431, 1,
0.006903759, -1.360028, 5.316771, 0, 1, 0.8156863, 1,
0.008139617, 0.02991667, -0.1783743, 0, 1, 0.8196079, 1,
0.00976926, 1.716938, -0.9552538, 0, 1, 0.827451, 1,
0.009788621, -1.509537, 3.08768, 0, 1, 0.8313726, 1,
0.010803, 2.115054, -0.8779234, 0, 1, 0.8392157, 1,
0.01176025, 0.9990599, -0.1928003, 0, 1, 0.8431373, 1,
0.01242114, -0.1143079, 4.153483, 0, 1, 0.8509804, 1,
0.01520809, -1.65723, 2.642365, 0, 1, 0.854902, 1,
0.0155838, 0.01620329, -0.8935627, 0, 1, 0.8627451, 1,
0.0209125, -0.9595884, 1.52344, 0, 1, 0.8666667, 1,
0.02459645, -0.5869348, 2.72974, 0, 1, 0.8745098, 1,
0.02531988, 0.5205995, -1.647987, 0, 1, 0.8784314, 1,
0.02676807, 0.02925497, 0.2732492, 0, 1, 0.8862745, 1,
0.02795814, -1.392247, 2.218942, 0, 1, 0.8901961, 1,
0.02834799, -0.3971709, 3.226256, 0, 1, 0.8980392, 1,
0.0286401, -1.209565, 3.700197, 0, 1, 0.9058824, 1,
0.03017869, -0.8076817, 4.5495, 0, 1, 0.9098039, 1,
0.03130138, 0.1975299, -0.5345009, 0, 1, 0.9176471, 1,
0.03313086, 1.698925, -0.2086623, 0, 1, 0.9215686, 1,
0.03388964, 0.595285, -0.3563739, 0, 1, 0.9294118, 1,
0.03425726, 0.2653071, 0.5962827, 0, 1, 0.9333333, 1,
0.03777784, -1.477855, 2.733442, 0, 1, 0.9411765, 1,
0.03854754, 1.971207, 0.7752466, 0, 1, 0.945098, 1,
0.04252124, 1.29712, -0.6068726, 0, 1, 0.9529412, 1,
0.04410245, -0.5978922, 3.872746, 0, 1, 0.9568627, 1,
0.04656232, -0.07691628, 3.70541, 0, 1, 0.9647059, 1,
0.04771644, 0.0884113, -0.6958461, 0, 1, 0.9686275, 1,
0.05556397, -0.7413678, 1.425871, 0, 1, 0.9764706, 1,
0.05567601, 1.346257, -1.203274, 0, 1, 0.9803922, 1,
0.0566333, -0.3626631, 2.168248, 0, 1, 0.9882353, 1,
0.05667428, -0.3631293, 4.122616, 0, 1, 0.9921569, 1,
0.05934395, 0.06817944, 0.2835679, 0, 1, 1, 1,
0.06005333, -0.8607677, 3.124532, 0, 0.9921569, 1, 1,
0.062047, 1.488949, 0.7021722, 0, 0.9882353, 1, 1,
0.06301568, -0.5335017, 1.975598, 0, 0.9803922, 1, 1,
0.0631948, 1.162942, -0.7105694, 0, 0.9764706, 1, 1,
0.0651267, -1.586333, 3.096099, 0, 0.9686275, 1, 1,
0.07602704, -0.7682344, 2.194076, 0, 0.9647059, 1, 1,
0.08011732, -2.577182, 2.360077, 0, 0.9568627, 1, 1,
0.08463594, -2.414114, 1.322379, 0, 0.9529412, 1, 1,
0.08779272, 0.6213707, 0.3742118, 0, 0.945098, 1, 1,
0.08793973, -0.532005, 2.362545, 0, 0.9411765, 1, 1,
0.08838862, -1.571087, 3.753122, 0, 0.9333333, 1, 1,
0.08848718, 0.2080655, 3.116495, 0, 0.9294118, 1, 1,
0.09151644, -0.3386711, 3.128045, 0, 0.9215686, 1, 1,
0.09224281, -0.6926562, 4.58865, 0, 0.9176471, 1, 1,
0.09383278, -0.3510775, 3.251303, 0, 0.9098039, 1, 1,
0.09857213, -0.3657306, 3.093117, 0, 0.9058824, 1, 1,
0.1006945, 1.391424, 0.337964, 0, 0.8980392, 1, 1,
0.1015963, -2.774653, 2.695654, 0, 0.8901961, 1, 1,
0.1052338, 0.4908327, -0.2285177, 0, 0.8862745, 1, 1,
0.1083096, -0.1175687, 0.9652548, 0, 0.8784314, 1, 1,
0.1102814, -0.07585334, 2.298789, 0, 0.8745098, 1, 1,
0.1203685, -0.6194138, 4.232173, 0, 0.8666667, 1, 1,
0.1223842, -0.07651695, 1.545861, 0, 0.8627451, 1, 1,
0.1230993, -0.4060249, 4.142343, 0, 0.854902, 1, 1,
0.124402, -0.7476278, 2.053931, 0, 0.8509804, 1, 1,
0.1268611, -0.5300176, 4.299038, 0, 0.8431373, 1, 1,
0.1269877, 0.4099986, 0.9293714, 0, 0.8392157, 1, 1,
0.1278755, 0.7315748, -0.2335194, 0, 0.8313726, 1, 1,
0.128091, 0.9363819, -0.23021, 0, 0.827451, 1, 1,
0.1289211, -0.2820034, 2.642511, 0, 0.8196079, 1, 1,
0.1298173, -0.6302691, 3.692329, 0, 0.8156863, 1, 1,
0.133611, -0.2341678, 4.281417, 0, 0.8078431, 1, 1,
0.1339296, 0.4249997, 1.288954, 0, 0.8039216, 1, 1,
0.1341626, 1.88989, 1.708507, 0, 0.7960784, 1, 1,
0.1342919, 0.6313417, 0.155685, 0, 0.7882353, 1, 1,
0.1343434, -0.6251181, 4.362283, 0, 0.7843137, 1, 1,
0.1389369, 0.08990545, 2.179773, 0, 0.7764706, 1, 1,
0.1398093, -0.1069339, 4.072874, 0, 0.772549, 1, 1,
0.1464769, -1.018928, 3.061097, 0, 0.7647059, 1, 1,
0.1495149, 1.782208, -1.163764, 0, 0.7607843, 1, 1,
0.1499042, 0.5581332, 0.1427595, 0, 0.7529412, 1, 1,
0.1501849, 0.330107, 1.261812, 0, 0.7490196, 1, 1,
0.157152, -0.7613091, 2.277945, 0, 0.7411765, 1, 1,
0.1582642, -0.9902409, 4.242552, 0, 0.7372549, 1, 1,
0.1592036, -0.5006307, 2.279155, 0, 0.7294118, 1, 1,
0.1613898, 0.4989897, -0.8635612, 0, 0.7254902, 1, 1,
0.1618813, 0.1943138, 1.587953, 0, 0.7176471, 1, 1,
0.166563, -0.07114542, 1.366448, 0, 0.7137255, 1, 1,
0.1681461, -0.3827691, 1.552579, 0, 0.7058824, 1, 1,
0.1728732, -1.227941, 2.233551, 0, 0.6980392, 1, 1,
0.1750047, -0.2158659, 2.077873, 0, 0.6941177, 1, 1,
0.1756789, 0.8938469, -0.3080392, 0, 0.6862745, 1, 1,
0.1805708, 0.2129036, 1.550202, 0, 0.682353, 1, 1,
0.1809321, -0.1817076, 2.047953, 0, 0.6745098, 1, 1,
0.1863821, 0.3319316, 0.5418066, 0, 0.6705883, 1, 1,
0.1913286, 1.458531, 0.822001, 0, 0.6627451, 1, 1,
0.1944438, -1.144215, 2.215174, 0, 0.6588235, 1, 1,
0.1983336, 0.8005413, 0.07195203, 0, 0.6509804, 1, 1,
0.1997586, 0.1404119, 0.2439823, 0, 0.6470588, 1, 1,
0.2032141, -1.063516, 3.648397, 0, 0.6392157, 1, 1,
0.2068467, -1.029028, 3.227407, 0, 0.6352941, 1, 1,
0.2085923, 0.1620025, 0.3676923, 0, 0.627451, 1, 1,
0.2122615, 1.169973, 1.133978, 0, 0.6235294, 1, 1,
0.2200546, 0.4164856, 1.152683, 0, 0.6156863, 1, 1,
0.222506, -1.864062, 3.58235, 0, 0.6117647, 1, 1,
0.2231183, 2.151048, -0.7687055, 0, 0.6039216, 1, 1,
0.2330375, -0.2786781, 4.115361, 0, 0.5960785, 1, 1,
0.2340478, -0.108275, 2.681469, 0, 0.5921569, 1, 1,
0.2342181, -0.3435986, 2.813847, 0, 0.5843138, 1, 1,
0.237358, -0.5363374, 2.300802, 0, 0.5803922, 1, 1,
0.2387661, -0.3640242, 1.342589, 0, 0.572549, 1, 1,
0.2458231, 0.7830516, 1.622705, 0, 0.5686275, 1, 1,
0.2461579, -0.5875984, 3.775311, 0, 0.5607843, 1, 1,
0.2482553, 0.1679576, 2.169989, 0, 0.5568628, 1, 1,
0.2514528, -0.1102364, 3.397157, 0, 0.5490196, 1, 1,
0.2557826, 0.8140768, 0.6951351, 0, 0.5450981, 1, 1,
0.2560672, 0.641061, -0.1988289, 0, 0.5372549, 1, 1,
0.2627056, -1.920511, 3.00041, 0, 0.5333334, 1, 1,
0.2646572, 0.8968013, -1.079958, 0, 0.5254902, 1, 1,
0.2647452, 1.092984, 0.8641385, 0, 0.5215687, 1, 1,
0.2670257, 0.6167236, 1.90024, 0, 0.5137255, 1, 1,
0.2678525, 0.1524487, 1.224725, 0, 0.509804, 1, 1,
0.2679549, 0.1243954, 0.8750264, 0, 0.5019608, 1, 1,
0.2709644, -0.4123752, 1.933838, 0, 0.4941176, 1, 1,
0.2717868, 0.5639774, 1.627448, 0, 0.4901961, 1, 1,
0.2718904, -0.998782, 2.368199, 0, 0.4823529, 1, 1,
0.2748527, -0.3929195, 2.675407, 0, 0.4784314, 1, 1,
0.2765922, -1.141403, 2.842237, 0, 0.4705882, 1, 1,
0.283282, -0.5254899, 2.039717, 0, 0.4666667, 1, 1,
0.2835559, 1.495374, 2.207558, 0, 0.4588235, 1, 1,
0.2845367, -0.9150472, 0.8080997, 0, 0.454902, 1, 1,
0.2865843, -0.2446561, 1.846346, 0, 0.4470588, 1, 1,
0.293131, -0.4469781, 3.758883, 0, 0.4431373, 1, 1,
0.293576, -1.1941, 2.819788, 0, 0.4352941, 1, 1,
0.2940354, -0.003397236, 1.160303, 0, 0.4313726, 1, 1,
0.2984168, 0.08951244, -0.5712974, 0, 0.4235294, 1, 1,
0.3015009, -0.142915, 3.066911, 0, 0.4196078, 1, 1,
0.3039672, 0.3843317, 0.07648553, 0, 0.4117647, 1, 1,
0.3046919, -0.09939849, 1.70175, 0, 0.4078431, 1, 1,
0.3078878, -0.3339901, 3.622591, 0, 0.4, 1, 1,
0.3162621, -1.174158, 4.008908, 0, 0.3921569, 1, 1,
0.3191608, 0.5866435, 1.099407, 0, 0.3882353, 1, 1,
0.3290662, -0.3858576, 3.393579, 0, 0.3803922, 1, 1,
0.3306863, 0.3787444, 1.192142, 0, 0.3764706, 1, 1,
0.3364303, -1.384885, 0.7603225, 0, 0.3686275, 1, 1,
0.3368101, 0.3716759, 0.7893128, 0, 0.3647059, 1, 1,
0.3388268, 0.2482061, -0.7536212, 0, 0.3568628, 1, 1,
0.3403333, -0.287426, 1.908571, 0, 0.3529412, 1, 1,
0.344579, -0.6796593, 1.865519, 0, 0.345098, 1, 1,
0.3572163, 0.5190598, -0.08546408, 0, 0.3411765, 1, 1,
0.3583878, -1.251702, 1.881101, 0, 0.3333333, 1, 1,
0.3585933, 0.117406, 0.3770842, 0, 0.3294118, 1, 1,
0.3598039, 1.385833, -0.1405713, 0, 0.3215686, 1, 1,
0.3598156, 2.190547, 0.1391825, 0, 0.3176471, 1, 1,
0.3623925, 0.2194229, 1.961278, 0, 0.3098039, 1, 1,
0.3641385, 1.944552, -0.3383267, 0, 0.3058824, 1, 1,
0.3646153, -0.2986301, 2.005075, 0, 0.2980392, 1, 1,
0.366164, 0.4989495, 1.526853, 0, 0.2901961, 1, 1,
0.3687138, -2.876965, 2.034966, 0, 0.2862745, 1, 1,
0.3689897, 0.6228108, 0.2786803, 0, 0.2784314, 1, 1,
0.3697023, -0.6368567, 3.470532, 0, 0.2745098, 1, 1,
0.3703172, -1.815176, 3.412589, 0, 0.2666667, 1, 1,
0.3751472, 2.488571, -0.8157233, 0, 0.2627451, 1, 1,
0.3778259, -0.004539275, 0.3545923, 0, 0.254902, 1, 1,
0.3816292, 1.043756, 0.1891028, 0, 0.2509804, 1, 1,
0.3876764, -1.442454, 4.957865, 0, 0.2431373, 1, 1,
0.3880482, -0.8297274, 4.902239, 0, 0.2392157, 1, 1,
0.3893553, 0.3955828, 2.529105, 0, 0.2313726, 1, 1,
0.3938526, -0.03501768, 2.677085, 0, 0.227451, 1, 1,
0.3945821, -0.1079324, 1.987814, 0, 0.2196078, 1, 1,
0.3946406, 0.9648327, 1.258028, 0, 0.2156863, 1, 1,
0.3963425, 0.7423069, 0.442632, 0, 0.2078431, 1, 1,
0.4015407, -1.002376, 2.055879, 0, 0.2039216, 1, 1,
0.4036231, -0.4410079, 2.544677, 0, 0.1960784, 1, 1,
0.4131487, -0.4562826, 1.875536, 0, 0.1882353, 1, 1,
0.4136305, 1.414651, 0.5841946, 0, 0.1843137, 1, 1,
0.4139206, -0.08287797, 1.256713, 0, 0.1764706, 1, 1,
0.4213666, -0.5064389, 2.418025, 0, 0.172549, 1, 1,
0.4224349, 0.7853025, 1.264054, 0, 0.1647059, 1, 1,
0.4226339, -0.3678949, 3.452771, 0, 0.1607843, 1, 1,
0.4229455, -0.1253784, 3.55149, 0, 0.1529412, 1, 1,
0.4232848, 0.602437, 0.6049272, 0, 0.1490196, 1, 1,
0.4273783, -0.4503309, 3.095348, 0, 0.1411765, 1, 1,
0.4280618, -0.1920882, 2.42622, 0, 0.1372549, 1, 1,
0.4329587, -2.095071, 2.408689, 0, 0.1294118, 1, 1,
0.4366412, -1.97861, 2.469895, 0, 0.1254902, 1, 1,
0.4400393, -0.05810088, 1.381075, 0, 0.1176471, 1, 1,
0.4439923, -0.5150415, 2.140272, 0, 0.1137255, 1, 1,
0.446142, -0.399637, 1.455032, 0, 0.1058824, 1, 1,
0.4493935, 0.1402834, 1.316971, 0, 0.09803922, 1, 1,
0.451799, -0.01360859, 1.512836, 0, 0.09411765, 1, 1,
0.4547193, -0.008657604, -0.601997, 0, 0.08627451, 1, 1,
0.4549786, -0.1743087, 1.170023, 0, 0.08235294, 1, 1,
0.467016, -0.2771166, 1.318452, 0, 0.07450981, 1, 1,
0.4701945, 0.9684941, -0.1629175, 0, 0.07058824, 1, 1,
0.4747684, 2.034916, -0.512283, 0, 0.0627451, 1, 1,
0.479577, 1.092161, 0.6884948, 0, 0.05882353, 1, 1,
0.484245, 0.293364, 1.083133, 0, 0.05098039, 1, 1,
0.4905317, 1.9358, 0.8771747, 0, 0.04705882, 1, 1,
0.4910534, 0.4384875, 1.595109, 0, 0.03921569, 1, 1,
0.4927365, 0.1402451, 0.6705132, 0, 0.03529412, 1, 1,
0.4936193, -0.7732404, 2.431746, 0, 0.02745098, 1, 1,
0.498431, 0.163265, 0.3051755, 0, 0.02352941, 1, 1,
0.5004357, -0.5722937, 3.285841, 0, 0.01568628, 1, 1,
0.5021591, -0.9614564, 4.145593, 0, 0.01176471, 1, 1,
0.5067399, -0.4498557, 2.971887, 0, 0.003921569, 1, 1,
0.5097415, 1.122996, -0.7117558, 0.003921569, 0, 1, 1,
0.5125765, -0.7237774, 2.641718, 0.007843138, 0, 1, 1,
0.5148188, 0.09123977, 0.07299973, 0.01568628, 0, 1, 1,
0.517135, -0.6666512, 0.07430496, 0.01960784, 0, 1, 1,
0.5203251, 0.2785047, 0.5677515, 0.02745098, 0, 1, 1,
0.5210436, -0.8751258, 1.656439, 0.03137255, 0, 1, 1,
0.5233704, 0.05885942, 1.849772, 0.03921569, 0, 1, 1,
0.5235399, -1.64225, 2.241186, 0.04313726, 0, 1, 1,
0.5240958, 0.05667418, 2.4094, 0.05098039, 0, 1, 1,
0.524513, -0.7149253, 1.673237, 0.05490196, 0, 1, 1,
0.5323527, -1.429082, 2.053197, 0.0627451, 0, 1, 1,
0.5336953, -2.09592, 3.161632, 0.06666667, 0, 1, 1,
0.5343674, 0.3017696, 1.405848, 0.07450981, 0, 1, 1,
0.5357776, 0.09826525, 1.819791, 0.07843138, 0, 1, 1,
0.535819, 0.1069839, 1.934131, 0.08627451, 0, 1, 1,
0.5368699, -1.853053, 3.71956, 0.09019608, 0, 1, 1,
0.5368972, 0.7563391, 0.4169204, 0.09803922, 0, 1, 1,
0.5386893, 1.747076, -0.09812343, 0.1058824, 0, 1, 1,
0.5393532, -0.4873804, 3.737783, 0.1098039, 0, 1, 1,
0.5456558, -0.4914565, 1.400109, 0.1176471, 0, 1, 1,
0.5475838, 0.2295239, -0.01678174, 0.1215686, 0, 1, 1,
0.5535066, 0.334821, 0.4282955, 0.1294118, 0, 1, 1,
0.5548699, 1.170308, 0.7448051, 0.1333333, 0, 1, 1,
0.5656701, 0.2452033, 1.001934, 0.1411765, 0, 1, 1,
0.5658335, 2.677706, -1.260657, 0.145098, 0, 1, 1,
0.5712034, -0.2666329, 2.105529, 0.1529412, 0, 1, 1,
0.5726795, 1.585177, -0.7575341, 0.1568628, 0, 1, 1,
0.5744316, 0.7863544, 0.7809194, 0.1647059, 0, 1, 1,
0.5749869, 0.9190002, -0.02484167, 0.1686275, 0, 1, 1,
0.575959, -0.4337709, 1.407463, 0.1764706, 0, 1, 1,
0.5772021, -0.1072555, 4.534748, 0.1803922, 0, 1, 1,
0.5843931, 0.5247316, 0.2070988, 0.1882353, 0, 1, 1,
0.5930123, 1.014627, 0.3097137, 0.1921569, 0, 1, 1,
0.5932093, 0.2775366, 0.7995138, 0.2, 0, 1, 1,
0.5938888, -0.9360506, 1.725574, 0.2078431, 0, 1, 1,
0.596395, -1.501375, 1.695901, 0.2117647, 0, 1, 1,
0.596461, -0.03441434, 1.707523, 0.2196078, 0, 1, 1,
0.5977613, -0.3561047, 2.963119, 0.2235294, 0, 1, 1,
0.5982303, -0.2565244, 0.9124351, 0.2313726, 0, 1, 1,
0.6025352, 0.1148719, 1.043889, 0.2352941, 0, 1, 1,
0.60575, -0.44308, 2.801883, 0.2431373, 0, 1, 1,
0.6073257, 0.7255808, 0.05591436, 0.2470588, 0, 1, 1,
0.6096653, -0.03026106, 1.587114, 0.254902, 0, 1, 1,
0.6110817, 0.828768, -1.447977, 0.2588235, 0, 1, 1,
0.613169, 0.6385807, -0.3653451, 0.2666667, 0, 1, 1,
0.6137094, -0.533269, 1.836132, 0.2705882, 0, 1, 1,
0.6164448, -0.1745753, 0.4701304, 0.2784314, 0, 1, 1,
0.6184067, 0.9583907, -0.5767344, 0.282353, 0, 1, 1,
0.6203925, 0.8735771, -0.1740798, 0.2901961, 0, 1, 1,
0.6221607, 0.4299524, -1.177815, 0.2941177, 0, 1, 1,
0.6239962, -0.3812167, 1.34186, 0.3019608, 0, 1, 1,
0.628531, -0.07265283, 1.246565, 0.3098039, 0, 1, 1,
0.6292342, 0.7138805, 1.217753, 0.3137255, 0, 1, 1,
0.6300648, 0.1264086, 0.9995583, 0.3215686, 0, 1, 1,
0.6310226, -1.02872, 1.935278, 0.3254902, 0, 1, 1,
0.6325063, -0.2593937, 3.091389, 0.3333333, 0, 1, 1,
0.6378532, 0.5095969, 1.903471, 0.3372549, 0, 1, 1,
0.6468323, 0.4472731, 0.7143303, 0.345098, 0, 1, 1,
0.6537403, 0.8119473, 1.094268, 0.3490196, 0, 1, 1,
0.661921, -0.7349617, 1.841422, 0.3568628, 0, 1, 1,
0.6623275, -0.3409658, 2.814107, 0.3607843, 0, 1, 1,
0.6638895, -1.65761, 3.176526, 0.3686275, 0, 1, 1,
0.6644579, -0.04964128, 1.74813, 0.372549, 0, 1, 1,
0.6660767, 0.530612, 3.172846, 0.3803922, 0, 1, 1,
0.6682584, 0.05569855, 1.698086, 0.3843137, 0, 1, 1,
0.6686746, 0.7244883, -0.2760021, 0.3921569, 0, 1, 1,
0.6741335, 0.1185665, -0.1155064, 0.3960784, 0, 1, 1,
0.6752717, -0.7843106, 2.999071, 0.4039216, 0, 1, 1,
0.6791585, 0.1482589, 2.400418, 0.4117647, 0, 1, 1,
0.6823853, -1.675516, 1.148446, 0.4156863, 0, 1, 1,
0.6831478, -0.01932708, 0.6142594, 0.4235294, 0, 1, 1,
0.6868937, 0.4282145, 2.147632, 0.427451, 0, 1, 1,
0.6876147, -0.5764166, 1.990585, 0.4352941, 0, 1, 1,
0.6893205, 1.003144, 1.040505, 0.4392157, 0, 1, 1,
0.7072731, -0.2617123, 2.972134, 0.4470588, 0, 1, 1,
0.7120504, -0.7128767, 2.253426, 0.4509804, 0, 1, 1,
0.7149364, 0.1312885, 2.278353, 0.4588235, 0, 1, 1,
0.7158809, -0.7328676, 4.652071, 0.4627451, 0, 1, 1,
0.7196187, 0.8768991, 0.3559849, 0.4705882, 0, 1, 1,
0.7233918, 0.849316, -0.3747554, 0.4745098, 0, 1, 1,
0.7269982, 1.861564, 0.592631, 0.4823529, 0, 1, 1,
0.7279109, -0.3201031, 1.856236, 0.4862745, 0, 1, 1,
0.7312632, -1.265563, 1.764209, 0.4941176, 0, 1, 1,
0.7314945, 1.326345, 0.2436064, 0.5019608, 0, 1, 1,
0.7323207, 0.4390201, 1.535999, 0.5058824, 0, 1, 1,
0.7353852, 0.3061371, 1.518124, 0.5137255, 0, 1, 1,
0.7406731, 0.8184212, 2.266113, 0.5176471, 0, 1, 1,
0.741461, -1.520452, 2.133093, 0.5254902, 0, 1, 1,
0.7434785, 0.5695818, 0.3160133, 0.5294118, 0, 1, 1,
0.7478923, 1.748597, 0.9440763, 0.5372549, 0, 1, 1,
0.7506996, 1.077899, 0.03096169, 0.5411765, 0, 1, 1,
0.7525693, -0.2119913, 0.2186208, 0.5490196, 0, 1, 1,
0.7563888, 1.186119, -0.5205766, 0.5529412, 0, 1, 1,
0.7626267, -0.8351224, 1.08645, 0.5607843, 0, 1, 1,
0.762836, 1.409944, 0.3611985, 0.5647059, 0, 1, 1,
0.7691255, 0.6394199, 1.699508, 0.572549, 0, 1, 1,
0.7697417, -3.026484, 3.006965, 0.5764706, 0, 1, 1,
0.7730314, 0.7916325, 2.458788, 0.5843138, 0, 1, 1,
0.7818612, -0.7892063, 2.279097, 0.5882353, 0, 1, 1,
0.7845961, 0.124578, 0.6622533, 0.5960785, 0, 1, 1,
0.7879713, 1.310733, -1.100631, 0.6039216, 0, 1, 1,
0.7880606, -0.8651229, 1.510319, 0.6078432, 0, 1, 1,
0.7903988, 0.4105003, 1.887927, 0.6156863, 0, 1, 1,
0.7915885, -1.081515, 1.325802, 0.6196079, 0, 1, 1,
0.7960327, 0.0606435, 2.156209, 0.627451, 0, 1, 1,
0.7966444, -0.8830205, 0.7812326, 0.6313726, 0, 1, 1,
0.7981601, 0.03740347, 2.527841, 0.6392157, 0, 1, 1,
0.8006527, 1.427621, -1.197393, 0.6431373, 0, 1, 1,
0.801739, 0.1350102, 0.2350612, 0.6509804, 0, 1, 1,
0.801848, 0.3409387, -0.8211711, 0.654902, 0, 1, 1,
0.8020911, -0.3419051, 3.35493, 0.6627451, 0, 1, 1,
0.8080798, -0.04496155, 0.5820308, 0.6666667, 0, 1, 1,
0.8128936, -0.6874956, 3.299736, 0.6745098, 0, 1, 1,
0.820127, 1.215329, -0.6728384, 0.6784314, 0, 1, 1,
0.8226378, 2.070989, -0.06592219, 0.6862745, 0, 1, 1,
0.8249747, 0.184769, 3.528694, 0.6901961, 0, 1, 1,
0.825014, 1.426812, 1.32417, 0.6980392, 0, 1, 1,
0.8266724, 0.7568225, 0.5793768, 0.7058824, 0, 1, 1,
0.8283205, -0.7890738, 2.352924, 0.7098039, 0, 1, 1,
0.8310497, -0.06559934, 1.644959, 0.7176471, 0, 1, 1,
0.8318183, 0.0100793, 1.446684, 0.7215686, 0, 1, 1,
0.8323506, -0.7313882, 1.320456, 0.7294118, 0, 1, 1,
0.8371557, -0.1859941, 1.493006, 0.7333333, 0, 1, 1,
0.8400508, 1.956809, -1.153687, 0.7411765, 0, 1, 1,
0.8428165, -0.4202219, 2.256824, 0.7450981, 0, 1, 1,
0.8439204, -0.5725645, 0.9597437, 0.7529412, 0, 1, 1,
0.8449391, -1.307529, 3.97923, 0.7568628, 0, 1, 1,
0.8513575, 0.1775038, 1.042505, 0.7647059, 0, 1, 1,
0.8531935, 0.5181513, -1.518676, 0.7686275, 0, 1, 1,
0.8583664, 1.959746, 3.07006, 0.7764706, 0, 1, 1,
0.8591574, -1.023703, 2.511433, 0.7803922, 0, 1, 1,
0.8611406, 0.7246002, -0.4041161, 0.7882353, 0, 1, 1,
0.8631672, -0.6923655, 3.702443, 0.7921569, 0, 1, 1,
0.869836, -0.9194358, 2.912478, 0.8, 0, 1, 1,
0.8802733, -0.1665411, 4.054714, 0.8078431, 0, 1, 1,
0.8901629, 0.2084431, 0.7495179, 0.8117647, 0, 1, 1,
0.8925113, 0.7724427, 1.29149, 0.8196079, 0, 1, 1,
0.8957747, 0.3370624, 2.488508, 0.8235294, 0, 1, 1,
0.8966117, -1.719293, 1.824856, 0.8313726, 0, 1, 1,
0.8995379, 0.23121, 0.8341922, 0.8352941, 0, 1, 1,
0.8999656, -1.65787, 2.732657, 0.8431373, 0, 1, 1,
0.9002236, 0.4378951, 3.174166, 0.8470588, 0, 1, 1,
0.9046114, 0.05995974, 0.5224104, 0.854902, 0, 1, 1,
0.90699, 0.182806, 2.526489, 0.8588235, 0, 1, 1,
0.90713, -0.8781208, 0.8905722, 0.8666667, 0, 1, 1,
0.9081416, 1.447528, -0.3728682, 0.8705882, 0, 1, 1,
0.9083694, 1.162319, 0.4601862, 0.8784314, 0, 1, 1,
0.9127386, 0.06403262, 0.8172942, 0.8823529, 0, 1, 1,
0.9147302, -0.3025965, 2.195827, 0.8901961, 0, 1, 1,
0.9169374, 0.001108122, 1.651453, 0.8941177, 0, 1, 1,
0.9179712, 0.3384977, 1.104543, 0.9019608, 0, 1, 1,
0.9202324, 0.2304165, 2.636184, 0.9098039, 0, 1, 1,
0.9211711, -0.2226104, 2.438328, 0.9137255, 0, 1, 1,
0.92253, 2.373327, 0.04123969, 0.9215686, 0, 1, 1,
0.9259063, -0.2581251, 2.547066, 0.9254902, 0, 1, 1,
0.9273908, 0.4210545, 0.7114813, 0.9333333, 0, 1, 1,
0.9391263, 0.4854043, 3.109377, 0.9372549, 0, 1, 1,
0.9405934, -0.8169334, 2.368058, 0.945098, 0, 1, 1,
0.9411849, 1.771315, -0.05948314, 0.9490196, 0, 1, 1,
0.9434579, 0.3543915, 0.7099236, 0.9568627, 0, 1, 1,
0.9437098, -0.8978222, 4.205585, 0.9607843, 0, 1, 1,
0.9450296, 0.1521696, 0.8225906, 0.9686275, 0, 1, 1,
0.9481962, -1.043067, 2.972847, 0.972549, 0, 1, 1,
0.9506452, 0.3590236, -0.8219914, 0.9803922, 0, 1, 1,
0.9668433, 0.644186, 4.003522, 0.9843137, 0, 1, 1,
0.9705387, -1.113288, 2.812226, 0.9921569, 0, 1, 1,
0.9758201, 0.8975793, 0.3198329, 0.9960784, 0, 1, 1,
0.9771923, 1.10231, -1.60223, 1, 0, 0.9960784, 1,
0.9813496, 0.6880597, 0.6780105, 1, 0, 0.9882353, 1,
0.9816036, -0.6770068, 2.418438, 1, 0, 0.9843137, 1,
0.9994722, -0.1645189, 0.4078269, 1, 0, 0.9764706, 1,
1.000874, -0.2617229, 1.27976, 1, 0, 0.972549, 1,
1.001766, -0.1690011, 3.490766, 1, 0, 0.9647059, 1,
1.008362, 0.2874835, 0.7191783, 1, 0, 0.9607843, 1,
1.010246, 0.3170243, 2.224973, 1, 0, 0.9529412, 1,
1.015641, 0.09824724, -0.6488705, 1, 0, 0.9490196, 1,
1.021303, -1.101905, 2.582561, 1, 0, 0.9411765, 1,
1.025288, -0.06424697, 2.123661, 1, 0, 0.9372549, 1,
1.034858, 0.2151056, 0.9367062, 1, 0, 0.9294118, 1,
1.042023, 0.8423699, 1.174456, 1, 0, 0.9254902, 1,
1.04384, 0.4790673, 1.232229, 1, 0, 0.9176471, 1,
1.045398, 0.5714824, 1.350113, 1, 0, 0.9137255, 1,
1.046994, 0.736939, 0.9175114, 1, 0, 0.9058824, 1,
1.048352, 2.095051, 0.1968375, 1, 0, 0.9019608, 1,
1.049894, 0.71306, 0.9327981, 1, 0, 0.8941177, 1,
1.051458, 0.2615279, 1.237734, 1, 0, 0.8862745, 1,
1.063275, -0.5993849, 3.827991, 1, 0, 0.8823529, 1,
1.069001, 0.1637191, 2.392743, 1, 0, 0.8745098, 1,
1.073021, -2.289975, 2.869811, 1, 0, 0.8705882, 1,
1.075779, -0.4686174, 2.521955, 1, 0, 0.8627451, 1,
1.080783, -1.310919, 4.449918, 1, 0, 0.8588235, 1,
1.084695, -1.024622, 3.355745, 1, 0, 0.8509804, 1,
1.089721, -0.50733, 2.054117, 1, 0, 0.8470588, 1,
1.095139, -1.661435, 2.773115, 1, 0, 0.8392157, 1,
1.096268, 0.3774432, 0.8874686, 1, 0, 0.8352941, 1,
1.100739, 1.040853, 0.4452075, 1, 0, 0.827451, 1,
1.102279, 0.2693199, 1.069791, 1, 0, 0.8235294, 1,
1.108648, -1.405613, 2.451695, 1, 0, 0.8156863, 1,
1.116875, 0.02431844, 1.040061, 1, 0, 0.8117647, 1,
1.121328, -0.4265127, 1.495345, 1, 0, 0.8039216, 1,
1.126196, -0.4342915, 3.590102, 1, 0, 0.7960784, 1,
1.130984, 1.129889, 2.595802, 1, 0, 0.7921569, 1,
1.132294, -0.1212327, 1.499703, 1, 0, 0.7843137, 1,
1.138316, 1.743505, 0.6385038, 1, 0, 0.7803922, 1,
1.142024, 1.287656, -0.2934599, 1, 0, 0.772549, 1,
1.148161, -0.9534826, 2.598829, 1, 0, 0.7686275, 1,
1.152744, -0.3749531, 1.717003, 1, 0, 0.7607843, 1,
1.15342, 1.497446, 0.5095862, 1, 0, 0.7568628, 1,
1.157108, 0.3363621, -0.0756677, 1, 0, 0.7490196, 1,
1.163373, 0.5679185, 2.542914, 1, 0, 0.7450981, 1,
1.165089, -1.043163, 2.824615, 1, 0, 0.7372549, 1,
1.165233, -1.58584, 2.242606, 1, 0, 0.7333333, 1,
1.166505, 0.3803752, 1.69602, 1, 0, 0.7254902, 1,
1.169065, 0.460677, 1.749792, 1, 0, 0.7215686, 1,
1.174035, 0.3075354, 0.6915159, 1, 0, 0.7137255, 1,
1.175542, -1.231181, 1.849683, 1, 0, 0.7098039, 1,
1.178432, -1.881386, 3.095864, 1, 0, 0.7019608, 1,
1.17949, 0.3661782, -0.4395047, 1, 0, 0.6941177, 1,
1.180499, 0.3261996, 1.919481, 1, 0, 0.6901961, 1,
1.185402, -2.221703, 3.553277, 1, 0, 0.682353, 1,
1.1858, 0.8291805, 1.646744, 1, 0, 0.6784314, 1,
1.186575, -0.1742418, 1.177602, 1, 0, 0.6705883, 1,
1.19076, 0.009410573, 0.5031878, 1, 0, 0.6666667, 1,
1.190795, 0.1614781, 1.675622, 1, 0, 0.6588235, 1,
1.205189, 0.4687518, -0.4486118, 1, 0, 0.654902, 1,
1.205859, 1.124584, 2.084053, 1, 0, 0.6470588, 1,
1.218228, -0.6741336, 1.158892, 1, 0, 0.6431373, 1,
1.21857, -0.2596964, 1.888139, 1, 0, 0.6352941, 1,
1.25088, 0.6616349, 1.566188, 1, 0, 0.6313726, 1,
1.25387, 1.724148, 0.3868999, 1, 0, 0.6235294, 1,
1.255856, -0.05532755, 2.0185, 1, 0, 0.6196079, 1,
1.267477, -0.7149608, 0.7392757, 1, 0, 0.6117647, 1,
1.284634, -0.1552927, 0.6726762, 1, 0, 0.6078432, 1,
1.293329, -0.9646564, 1.103541, 1, 0, 0.6, 1,
1.294833, 0.8500333, 0.6006075, 1, 0, 0.5921569, 1,
1.298234, -0.4150126, 1.933329, 1, 0, 0.5882353, 1,
1.298334, -0.1684689, 3.136131, 1, 0, 0.5803922, 1,
1.305194, 0.442295, 1.860986, 1, 0, 0.5764706, 1,
1.305303, -1.034825, 2.402859, 1, 0, 0.5686275, 1,
1.30824, -0.8074868, 1.38707, 1, 0, 0.5647059, 1,
1.319589, -0.140807, 1.09453, 1, 0, 0.5568628, 1,
1.320767, -0.06383596, 0.1579813, 1, 0, 0.5529412, 1,
1.326859, -0.1654778, 3.705658, 1, 0, 0.5450981, 1,
1.330462, -0.9775627, 2.467597, 1, 0, 0.5411765, 1,
1.341222, 0.08102513, -0.09940525, 1, 0, 0.5333334, 1,
1.344741, -1.822184, 1.887784, 1, 0, 0.5294118, 1,
1.348232, 1.819547, 0.8405069, 1, 0, 0.5215687, 1,
1.348479, -0.6434512, 0.99872, 1, 0, 0.5176471, 1,
1.350405, 0.9989009, 0.9361683, 1, 0, 0.509804, 1,
1.354409, 0.3545207, 2.348588, 1, 0, 0.5058824, 1,
1.36428, 0.4881248, 0.5343766, 1, 0, 0.4980392, 1,
1.365535, -0.712578, 2.073967, 1, 0, 0.4901961, 1,
1.381665, 0.7561729, 2.219407, 1, 0, 0.4862745, 1,
1.391251, -0.8573808, -0.2926338, 1, 0, 0.4784314, 1,
1.395175, -0.2316494, 1.589316, 1, 0, 0.4745098, 1,
1.407303, -0.1065225, 0.8029944, 1, 0, 0.4666667, 1,
1.409286, -0.5823644, 1.116915, 1, 0, 0.4627451, 1,
1.416363, -1.44024, 2.316326, 1, 0, 0.454902, 1,
1.420366, 0.6898436, 0.6297263, 1, 0, 0.4509804, 1,
1.426731, 0.3629231, 0.4131957, 1, 0, 0.4431373, 1,
1.438909, 1.503385, 2.497064, 1, 0, 0.4392157, 1,
1.445626, -0.5195115, 1.960376, 1, 0, 0.4313726, 1,
1.452071, 1.094286, 0.1647756, 1, 0, 0.427451, 1,
1.453548, 1.006004, 0.04685802, 1, 0, 0.4196078, 1,
1.46354, 0.695489, 1.71217, 1, 0, 0.4156863, 1,
1.475051, -0.1707589, 1.361968, 1, 0, 0.4078431, 1,
1.475542, 1.15442, 3.370178, 1, 0, 0.4039216, 1,
1.482756, -0.4862127, 2.771707, 1, 0, 0.3960784, 1,
1.485602, -1.615502, 1.918223, 1, 0, 0.3882353, 1,
1.486045, -0.6271496, -0.09549209, 1, 0, 0.3843137, 1,
1.487556, -0.3003975, 4.364978, 1, 0, 0.3764706, 1,
1.48785, 0.4823815, 1.93902, 1, 0, 0.372549, 1,
1.507306, -1.077552, 3.642089, 1, 0, 0.3647059, 1,
1.510998, 0.9357653, 1.027871, 1, 0, 0.3607843, 1,
1.530543, 2.676391, 2.702754, 1, 0, 0.3529412, 1,
1.557947, -0.4329331, 1.290367, 1, 0, 0.3490196, 1,
1.569004, -1.833783, 2.455563, 1, 0, 0.3411765, 1,
1.570844, 0.07308227, 2.544956, 1, 0, 0.3372549, 1,
1.572148, -0.3292286, 2.379167, 1, 0, 0.3294118, 1,
1.580061, 0.54739, 0.5477158, 1, 0, 0.3254902, 1,
1.582928, -1.78626, 2.129281, 1, 0, 0.3176471, 1,
1.585687, 0.4306515, 1.272108, 1, 0, 0.3137255, 1,
1.612213, 0.4446335, 1.61005, 1, 0, 0.3058824, 1,
1.620834, 1.051239, 1.498616, 1, 0, 0.2980392, 1,
1.631985, -0.165969, 1.502346, 1, 0, 0.2941177, 1,
1.644567, -0.4266766, 2.685644, 1, 0, 0.2862745, 1,
1.652712, 0.6123569, 1.667631, 1, 0, 0.282353, 1,
1.680384, 0.4324075, 2.413868, 1, 0, 0.2745098, 1,
1.690804, -0.2492408, -0.197398, 1, 0, 0.2705882, 1,
1.707375, -0.5101585, 1.606339, 1, 0, 0.2627451, 1,
1.717436, -0.04031788, 0.4975674, 1, 0, 0.2588235, 1,
1.724894, 1.261263, 2.412591, 1, 0, 0.2509804, 1,
1.73343, 1.683103, 1.246105, 1, 0, 0.2470588, 1,
1.760468, -0.05946092, 0.2146126, 1, 0, 0.2392157, 1,
1.802631, 1.297158, 2.278541, 1, 0, 0.2352941, 1,
1.804428, 1.184106, 0.4547141, 1, 0, 0.227451, 1,
1.822359, -0.8659254, 3.11694, 1, 0, 0.2235294, 1,
1.840966, 0.2961791, 0.9935114, 1, 0, 0.2156863, 1,
1.84759, -0.2987159, 1.772182, 1, 0, 0.2117647, 1,
1.853266, 0.4436752, 0.0003091636, 1, 0, 0.2039216, 1,
1.856173, 0.4106454, 3.609102, 1, 0, 0.1960784, 1,
1.868251, -0.07824512, 1.443459, 1, 0, 0.1921569, 1,
1.87808, 0.9103795, 2.351284, 1, 0, 0.1843137, 1,
1.882732, 0.5941587, 0.2306953, 1, 0, 0.1803922, 1,
1.892506, -0.881149, 2.240582, 1, 0, 0.172549, 1,
1.908567, 0.01415434, 1.102869, 1, 0, 0.1686275, 1,
1.918929, 0.7606795, 1.492612, 1, 0, 0.1607843, 1,
1.943816, -1.099461, 1.740972, 1, 0, 0.1568628, 1,
1.99917, 0.8258121, 0.6620249, 1, 0, 0.1490196, 1,
2.004049, 0.3339109, 0.308833, 1, 0, 0.145098, 1,
2.011502, -0.1935459, 1.647398, 1, 0, 0.1372549, 1,
2.024588, -1.228661, 2.512441, 1, 0, 0.1333333, 1,
2.029006, 0.3498866, 0.07127628, 1, 0, 0.1254902, 1,
2.040881, -0.2576011, 3.336815, 1, 0, 0.1215686, 1,
2.049666, 0.2810589, 1.271603, 1, 0, 0.1137255, 1,
2.057789, 0.7545099, 1.557779, 1, 0, 0.1098039, 1,
2.089637, -1.645877, 2.029898, 1, 0, 0.1019608, 1,
2.096537, 0.5132171, 3.134914, 1, 0, 0.09411765, 1,
2.098207, 0.6274154, 0.367388, 1, 0, 0.09019608, 1,
2.205311, 0.5161364, 0.5400045, 1, 0, 0.08235294, 1,
2.223084, -0.6781513, 0.1048514, 1, 0, 0.07843138, 1,
2.264431, -0.2063115, 1.492776, 1, 0, 0.07058824, 1,
2.269246, 1.163522, 1.044692, 1, 0, 0.06666667, 1,
2.308031, 2.084816, 0.7750292, 1, 0, 0.05882353, 1,
2.31771, -0.1187156, -0.1039162, 1, 0, 0.05490196, 1,
2.324377, 0.8600757, -1.000524, 1, 0, 0.04705882, 1,
2.595089, 0.274424, 1.182714, 1, 0, 0.04313726, 1,
2.649041, 0.1417528, -0.1782386, 1, 0, 0.03529412, 1,
2.781771, -0.02635937, 2.464543, 1, 0, 0.03137255, 1,
2.82324, -0.4782968, 2.565909, 1, 0, 0.02352941, 1,
2.870948, -1.484082, 1.624275, 1, 0, 0.01960784, 1,
3.172614, -0.7439434, 0.4587585, 1, 0, 0.01176471, 1,
3.524787, 0.21359, 2.568335, 1, 0, 0.007843138, 1
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
0.2426953, -3.993344, -7.510098, 0, -0.5, 0.5, 0.5,
0.2426953, -3.993344, -7.510098, 1, -0.5, 0.5, 0.5,
0.2426953, -3.993344, -7.510098, 1, 1.5, 0.5, 0.5,
0.2426953, -3.993344, -7.510098, 0, 1.5, 0.5, 0.5
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
-4.152025, -0.1743888, -7.510098, 0, -0.5, 0.5, 0.5,
-4.152025, -0.1743888, -7.510098, 1, -0.5, 0.5, 0.5,
-4.152025, -0.1743888, -7.510098, 1, 1.5, 0.5, 0.5,
-4.152025, -0.1743888, -7.510098, 0, 1.5, 0.5, 0.5
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
-4.152025, -3.993344, -0.1671407, 0, -0.5, 0.5, 0.5,
-4.152025, -3.993344, -0.1671407, 1, -0.5, 0.5, 0.5,
-4.152025, -3.993344, -0.1671407, 1, 1.5, 0.5, 0.5,
-4.152025, -3.993344, -0.1671407, 0, 1.5, 0.5, 0.5
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
-3, -3.112047, -5.815569,
3, -3.112047, -5.815569,
-3, -3.112047, -5.815569,
-3, -3.25893, -6.097991,
-2, -3.112047, -5.815569,
-2, -3.25893, -6.097991,
-1, -3.112047, -5.815569,
-1, -3.25893, -6.097991,
0, -3.112047, -5.815569,
0, -3.25893, -6.097991,
1, -3.112047, -5.815569,
1, -3.25893, -6.097991,
2, -3.112047, -5.815569,
2, -3.25893, -6.097991,
3, -3.112047, -5.815569,
3, -3.25893, -6.097991
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
-3, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
-3, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
-3, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
-3, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
-2, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
-2, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
-2, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
-2, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
-1, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
-1, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
-1, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
-1, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
0, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
0, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
0, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
0, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
1, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
1, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
1, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
1, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
2, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
2, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
2, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
2, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5,
3, -3.552696, -6.662834, 0, -0.5, 0.5, 0.5,
3, -3.552696, -6.662834, 1, -0.5, 0.5, 0.5,
3, -3.552696, -6.662834, 1, 1.5, 0.5, 0.5,
3, -3.552696, -6.662834, 0, 1.5, 0.5, 0.5
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
-3.137859, -3, -5.815569,
-3.137859, 2, -5.815569,
-3.137859, -3, -5.815569,
-3.306887, -3, -6.097991,
-3.137859, -2, -5.815569,
-3.306887, -2, -6.097991,
-3.137859, -1, -5.815569,
-3.306887, -1, -6.097991,
-3.137859, 0, -5.815569,
-3.306887, 0, -6.097991,
-3.137859, 1, -5.815569,
-3.306887, 1, -6.097991,
-3.137859, 2, -5.815569,
-3.306887, 2, -6.097991
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
-3.644942, -3, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, -3, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, -3, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, -3, -6.662834, 0, 1.5, 0.5, 0.5,
-3.644942, -2, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, -2, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, -2, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, -2, -6.662834, 0, 1.5, 0.5, 0.5,
-3.644942, -1, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, -1, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, -1, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, -1, -6.662834, 0, 1.5, 0.5, 0.5,
-3.644942, 0, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, 0, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, 0, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, 0, -6.662834, 0, 1.5, 0.5, 0.5,
-3.644942, 1, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, 1, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, 1, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, 1, -6.662834, 0, 1.5, 0.5, 0.5,
-3.644942, 2, -6.662834, 0, -0.5, 0.5, 0.5,
-3.644942, 2, -6.662834, 1, -0.5, 0.5, 0.5,
-3.644942, 2, -6.662834, 1, 1.5, 0.5, 0.5,
-3.644942, 2, -6.662834, 0, 1.5, 0.5, 0.5
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
-3.137859, -3.112047, -4,
-3.137859, -3.112047, 4,
-3.137859, -3.112047, -4,
-3.306887, -3.25893, -4,
-3.137859, -3.112047, -2,
-3.306887, -3.25893, -2,
-3.137859, -3.112047, 0,
-3.306887, -3.25893, 0,
-3.137859, -3.112047, 2,
-3.306887, -3.25893, 2,
-3.137859, -3.112047, 4,
-3.306887, -3.25893, 4
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
-3.644942, -3.552696, -4, 0, -0.5, 0.5, 0.5,
-3.644942, -3.552696, -4, 1, -0.5, 0.5, 0.5,
-3.644942, -3.552696, -4, 1, 1.5, 0.5, 0.5,
-3.644942, -3.552696, -4, 0, 1.5, 0.5, 0.5,
-3.644942, -3.552696, -2, 0, -0.5, 0.5, 0.5,
-3.644942, -3.552696, -2, 1, -0.5, 0.5, 0.5,
-3.644942, -3.552696, -2, 1, 1.5, 0.5, 0.5,
-3.644942, -3.552696, -2, 0, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 0, 0, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 0, 1, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 0, 1, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 0, 0, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 2, 0, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 2, 1, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 2, 1, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 2, 0, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 4, 0, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 4, 1, -0.5, 0.5, 0.5,
-3.644942, -3.552696, 4, 1, 1.5, 0.5, 0.5,
-3.644942, -3.552696, 4, 0, 1.5, 0.5, 0.5
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
-3.137859, -3.112047, -5.815569,
-3.137859, 2.763269, -5.815569,
-3.137859, -3.112047, 5.481288,
-3.137859, 2.763269, 5.481288,
-3.137859, -3.112047, -5.815569,
-3.137859, -3.112047, 5.481288,
-3.137859, 2.763269, -5.815569,
-3.137859, 2.763269, 5.481288,
-3.137859, -3.112047, -5.815569,
3.62325, -3.112047, -5.815569,
-3.137859, -3.112047, 5.481288,
3.62325, -3.112047, 5.481288,
-3.137859, 2.763269, -5.815569,
3.62325, 2.763269, -5.815569,
-3.137859, 2.763269, 5.481288,
3.62325, 2.763269, 5.481288,
3.62325, -3.112047, -5.815569,
3.62325, 2.763269, -5.815569,
3.62325, -3.112047, 5.481288,
3.62325, 2.763269, 5.481288,
3.62325, -3.112047, -5.815569,
3.62325, -3.112047, 5.481288,
3.62325, 2.763269, -5.815569,
3.62325, 2.763269, 5.481288
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
var radius = 7.698417;
var distance = 34.25113;
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
mvMatrix.translate( -0.2426953, 0.1743888, 0.1671407 );
mvMatrix.scale( 1.231112, 1.41672, 0.7368137 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.25113);
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


