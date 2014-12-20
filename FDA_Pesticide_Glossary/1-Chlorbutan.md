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
-3.153007, 2.048636, -0.5529507, 1, 0, 0, 1,
-3.145908, 1.056677, -1.144323, 1, 0.007843138, 0, 1,
-2.849315, -1.03911, -2.258285, 1, 0.01176471, 0, 1,
-2.829616, 1.257081, -2.596287, 1, 0.01960784, 0, 1,
-2.817058, 0.8441797, -1.518707, 1, 0.02352941, 0, 1,
-2.759575, -0.3091641, -1.150577, 1, 0.03137255, 0, 1,
-2.759438, -0.323007, -1.252017, 1, 0.03529412, 0, 1,
-2.758942, -0.3390701, -2.278866, 1, 0.04313726, 0, 1,
-2.757027, -0.2982464, -3.610256, 1, 0.04705882, 0, 1,
-2.727176, -0.5889737, -2.192753, 1, 0.05490196, 0, 1,
-2.670677, -0.1190757, -0.6424211, 1, 0.05882353, 0, 1,
-2.62552, -0.1142479, -1.578654, 1, 0.06666667, 0, 1,
-2.412569, 0.4370849, -2.200309, 1, 0.07058824, 0, 1,
-2.377742, -0.5997722, -2.044655, 1, 0.07843138, 0, 1,
-2.349901, -0.7935285, -0.5674105, 1, 0.08235294, 0, 1,
-2.34467, -0.873129, -2.656885, 1, 0.09019608, 0, 1,
-2.331953, 0.843327, -1.742605, 1, 0.09411765, 0, 1,
-2.325695, 1.621424, 1.127901, 1, 0.1019608, 0, 1,
-2.176097, -0.0562982, -2.013874, 1, 0.1098039, 0, 1,
-2.174596, -2.227568, -1.710811, 1, 0.1137255, 0, 1,
-2.087291, 0.8247995, 0.4738517, 1, 0.1215686, 0, 1,
-2.065087, 1.003398, -2.921536, 1, 0.1254902, 0, 1,
-2.064573, -1.195997, -1.956897, 1, 0.1333333, 0, 1,
-2.031681, -2.169239, -2.378924, 1, 0.1372549, 0, 1,
-1.996145, 1.564489, -1.765726, 1, 0.145098, 0, 1,
-1.981821, 0.1366043, -1.585862, 1, 0.1490196, 0, 1,
-1.968632, -1.12048, -0.2042308, 1, 0.1568628, 0, 1,
-1.951413, 0.2718787, -1.791608, 1, 0.1607843, 0, 1,
-1.91417, -0.0869749, -0.4135792, 1, 0.1686275, 0, 1,
-1.912624, 0.2731548, 0.2068109, 1, 0.172549, 0, 1,
-1.911068, 0.08738671, -2.081207, 1, 0.1803922, 0, 1,
-1.895003, -0.6069877, -0.203808, 1, 0.1843137, 0, 1,
-1.873066, -0.9452954, -2.683094, 1, 0.1921569, 0, 1,
-1.865502, -0.08629923, -1.486632, 1, 0.1960784, 0, 1,
-1.856492, -0.1631154, -1.313202, 1, 0.2039216, 0, 1,
-1.828817, -0.04787201, -0.7828829, 1, 0.2117647, 0, 1,
-1.783116, 1.184359, -0.24911, 1, 0.2156863, 0, 1,
-1.766317, 0.3259997, -1.558395, 1, 0.2235294, 0, 1,
-1.758982, 1.172305, -2.012946, 1, 0.227451, 0, 1,
-1.746191, 0.3934519, -2.092241, 1, 0.2352941, 0, 1,
-1.745332, 0.05778724, -2.057011, 1, 0.2392157, 0, 1,
-1.745087, 0.5194939, 0.07633399, 1, 0.2470588, 0, 1,
-1.719192, 0.05600404, -2.194057, 1, 0.2509804, 0, 1,
-1.713805, 0.2721706, -0.5930237, 1, 0.2588235, 0, 1,
-1.709166, -0.3042559, -1.962547, 1, 0.2627451, 0, 1,
-1.707305, 0.4150109, -0.203502, 1, 0.2705882, 0, 1,
-1.701101, 0.2977028, 0.003837087, 1, 0.2745098, 0, 1,
-1.697629, 1.109435, -2.869383, 1, 0.282353, 0, 1,
-1.694267, 0.9434514, 1.353027, 1, 0.2862745, 0, 1,
-1.672359, -0.4875296, -0.9751597, 1, 0.2941177, 0, 1,
-1.658628, -1.287352, -2.871948, 1, 0.3019608, 0, 1,
-1.65678, -0.1541695, -0.3166565, 1, 0.3058824, 0, 1,
-1.655008, 0.5870948, 0.5162191, 1, 0.3137255, 0, 1,
-1.642278, 0.03382762, -1.536316, 1, 0.3176471, 0, 1,
-1.634155, -0.2636432, -2.471322, 1, 0.3254902, 0, 1,
-1.632932, -2.092556, -1.178092, 1, 0.3294118, 0, 1,
-1.626141, -0.01541146, -2.733102, 1, 0.3372549, 0, 1,
-1.608116, 0.5672818, -0.6219777, 1, 0.3411765, 0, 1,
-1.594235, -0.6067058, -3.711135, 1, 0.3490196, 0, 1,
-1.576101, 1.315925, -1.367467, 1, 0.3529412, 0, 1,
-1.556804, 0.02245804, -1.92935, 1, 0.3607843, 0, 1,
-1.555417, 0.3960632, -2.807543, 1, 0.3647059, 0, 1,
-1.536663, -0.2284829, -2.690182, 1, 0.372549, 0, 1,
-1.536513, -0.6509126, -4.930445, 1, 0.3764706, 0, 1,
-1.532396, -0.398693, -0.08458457, 1, 0.3843137, 0, 1,
-1.5224, -0.583293, -0.9738655, 1, 0.3882353, 0, 1,
-1.513755, 1.180585, 0.5431637, 1, 0.3960784, 0, 1,
-1.512086, 0.632484, -2.09895, 1, 0.4039216, 0, 1,
-1.509186, 0.646358, -2.003574, 1, 0.4078431, 0, 1,
-1.505632, -0.8286301, -0.8738418, 1, 0.4156863, 0, 1,
-1.499869, 0.5925062, -1.16752, 1, 0.4196078, 0, 1,
-1.491791, -0.02905614, -1.737361, 1, 0.427451, 0, 1,
-1.480569, 0.7928455, -1.172849, 1, 0.4313726, 0, 1,
-1.45609, 0.7895646, -2.202553, 1, 0.4392157, 0, 1,
-1.449475, 0.2636438, -2.439214, 1, 0.4431373, 0, 1,
-1.433777, 1.635581, -1.06635, 1, 0.4509804, 0, 1,
-1.433627, -0.6079636, -4.382565, 1, 0.454902, 0, 1,
-1.430625, 0.9163339, -0.9950029, 1, 0.4627451, 0, 1,
-1.419415, 1.053995, -0.8677059, 1, 0.4666667, 0, 1,
-1.396783, -0.7506756, -2.110293, 1, 0.4745098, 0, 1,
-1.388751, -0.4958532, -0.9457104, 1, 0.4784314, 0, 1,
-1.381582, 2.273703, 0.6468101, 1, 0.4862745, 0, 1,
-1.370077, 0.8477327, -1.545198, 1, 0.4901961, 0, 1,
-1.359386, 0.009015392, -2.815537, 1, 0.4980392, 0, 1,
-1.354617, -0.5299542, -1.8308, 1, 0.5058824, 0, 1,
-1.352143, -0.5123922, -0.6463677, 1, 0.509804, 0, 1,
-1.348403, -1.124789, -3.434767, 1, 0.5176471, 0, 1,
-1.339613, -1.040657, -0.576772, 1, 0.5215687, 0, 1,
-1.331926, -1.278247, -1.398215, 1, 0.5294118, 0, 1,
-1.327602, -2.331732, -2.67927, 1, 0.5333334, 0, 1,
-1.32637, -0.4987975, -1.480798, 1, 0.5411765, 0, 1,
-1.323781, 0.05960633, -1.065646, 1, 0.5450981, 0, 1,
-1.311808, -0.6330341, -0.4005268, 1, 0.5529412, 0, 1,
-1.311588, 1.439847, -0.2074472, 1, 0.5568628, 0, 1,
-1.311339, -1.57365, -2.251532, 1, 0.5647059, 0, 1,
-1.306451, 0.1496868, -0.6506948, 1, 0.5686275, 0, 1,
-1.304948, -0.4065021, -2.445988, 1, 0.5764706, 0, 1,
-1.299204, -0.4148526, -1.211818, 1, 0.5803922, 0, 1,
-1.292242, -0.2552931, -1.722845, 1, 0.5882353, 0, 1,
-1.287354, -0.2145234, -1.05134, 1, 0.5921569, 0, 1,
-1.279756, -1.226552, 0.3925817, 1, 0.6, 0, 1,
-1.273576, 1.53641, -0.7990688, 1, 0.6078432, 0, 1,
-1.273367, 0.138772, -1.729751, 1, 0.6117647, 0, 1,
-1.263213, 1.731153, -0.2725534, 1, 0.6196079, 0, 1,
-1.261477, 0.9891337, -1.499433, 1, 0.6235294, 0, 1,
-1.257532, -0.3126546, -2.139971, 1, 0.6313726, 0, 1,
-1.256418, 1.04532, -3.130099, 1, 0.6352941, 0, 1,
-1.250799, -1.969414, -1.421192, 1, 0.6431373, 0, 1,
-1.236876, -0.8876783, -2.1297, 1, 0.6470588, 0, 1,
-1.220763, 0.5891524, -0.3609285, 1, 0.654902, 0, 1,
-1.210115, -0.7003779, -3.460094, 1, 0.6588235, 0, 1,
-1.206296, 0.7530977, -1.059317, 1, 0.6666667, 0, 1,
-1.197785, 0.9684727, -0.5518113, 1, 0.6705883, 0, 1,
-1.195976, 0.05612941, -2.242508, 1, 0.6784314, 0, 1,
-1.192568, -0.3383237, -0.9760189, 1, 0.682353, 0, 1,
-1.186219, 0.5743362, -1.158243, 1, 0.6901961, 0, 1,
-1.185197, -1.844563, -2.60599, 1, 0.6941177, 0, 1,
-1.178997, 0.2445834, -1.55842, 1, 0.7019608, 0, 1,
-1.173907, -0.2449703, -0.00839675, 1, 0.7098039, 0, 1,
-1.161008, -0.9164497, -2.483804, 1, 0.7137255, 0, 1,
-1.156966, 0.458951, -2.210315, 1, 0.7215686, 0, 1,
-1.15593, 0.9413282, -1.262907, 1, 0.7254902, 0, 1,
-1.141973, -1.61128, -1.207935, 1, 0.7333333, 0, 1,
-1.141861, -0.08925508, -0.9339266, 1, 0.7372549, 0, 1,
-1.135739, 0.5394224, -1.13105, 1, 0.7450981, 0, 1,
-1.132143, -0.5571355, -2.259569, 1, 0.7490196, 0, 1,
-1.129064, -1.074699, -2.47989, 1, 0.7568628, 0, 1,
-1.128993, -0.1855294, -2.024811, 1, 0.7607843, 0, 1,
-1.119178, -0.7629029, -2.580586, 1, 0.7686275, 0, 1,
-1.116611, 0.3273298, -1.668974, 1, 0.772549, 0, 1,
-1.116351, 1.273028, -1.102594, 1, 0.7803922, 0, 1,
-1.115147, -0.5160879, -1.594721, 1, 0.7843137, 0, 1,
-1.113661, 2.040692, -0.9885471, 1, 0.7921569, 0, 1,
-1.111762, 0.4433265, -1.252965, 1, 0.7960784, 0, 1,
-1.111213, -2.326125, -3.291978, 1, 0.8039216, 0, 1,
-1.10148, 0.325372, -0.1492468, 1, 0.8117647, 0, 1,
-1.097324, 0.662067, -0.8958519, 1, 0.8156863, 0, 1,
-1.091419, 0.8907424, -1.21549, 1, 0.8235294, 0, 1,
-1.087184, 0.1633773, -2.08845, 1, 0.827451, 0, 1,
-1.084067, -0.5873101, -1.526332, 1, 0.8352941, 0, 1,
-1.082781, -0.6394151, -1.263512, 1, 0.8392157, 0, 1,
-1.082329, -1.936741, -2.458831, 1, 0.8470588, 0, 1,
-1.077064, 0.06149594, 0.2435987, 1, 0.8509804, 0, 1,
-1.073552, 0.4348764, -0.7082481, 1, 0.8588235, 0, 1,
-1.073268, -0.1509051, -4.395244, 1, 0.8627451, 0, 1,
-1.069149, 1.341397, -0.8169205, 1, 0.8705882, 0, 1,
-1.066563, -1.153916, -1.767099, 1, 0.8745098, 0, 1,
-1.062645, 0.04570799, -2.32143, 1, 0.8823529, 0, 1,
-1.052065, 1.133754, 0.3126294, 1, 0.8862745, 0, 1,
-1.04496, -0.5304639, -0.5409072, 1, 0.8941177, 0, 1,
-1.044208, 0.265043, -1.404267, 1, 0.8980392, 0, 1,
-1.042366, 0.485704, -0.2711626, 1, 0.9058824, 0, 1,
-1.034709, 0.1143183, -0.1285899, 1, 0.9137255, 0, 1,
-1.032103, -2.163826, -3.142937, 1, 0.9176471, 0, 1,
-1.03049, -1.152865, -2.34597, 1, 0.9254902, 0, 1,
-1.028058, -1.24869, -4.279119, 1, 0.9294118, 0, 1,
-1.027747, -0.6665514, -2.023072, 1, 0.9372549, 0, 1,
-1.026182, -0.09433062, 1.686344, 1, 0.9411765, 0, 1,
-1.019844, 0.6420426, -2.243919, 1, 0.9490196, 0, 1,
-1.017959, -1.164728, -0.934796, 1, 0.9529412, 0, 1,
-1.011902, 1.102457, -2.233135, 1, 0.9607843, 0, 1,
-1.010537, -1.080397, -1.775843, 1, 0.9647059, 0, 1,
-1.006824, 0.9048448, -0.5564645, 1, 0.972549, 0, 1,
-1.006498, 0.4230624, -0.6848936, 1, 0.9764706, 0, 1,
-1.000422, 0.6296982, 0.1153115, 1, 0.9843137, 0, 1,
-0.9996849, -1.218849, -1.990257, 1, 0.9882353, 0, 1,
-0.9967288, 0.05512705, -1.609137, 1, 0.9960784, 0, 1,
-0.9933089, 1.151035, 2.522493, 0.9960784, 1, 0, 1,
-0.9885786, -0.2628089, -1.851377, 0.9921569, 1, 0, 1,
-0.9876976, -0.336408, -1.976404, 0.9843137, 1, 0, 1,
-0.9843869, -1.239962, -2.290733, 0.9803922, 1, 0, 1,
-0.9786412, -2.029487, -3.725815, 0.972549, 1, 0, 1,
-0.9753883, -1.020495, -1.661195, 0.9686275, 1, 0, 1,
-0.9703386, 0.3685326, -1.915943, 0.9607843, 1, 0, 1,
-0.9702908, 0.1688408, -2.28561, 0.9568627, 1, 0, 1,
-0.9667757, 1.652362, 1.349235, 0.9490196, 1, 0, 1,
-0.9646262, 1.034249, 0.9473507, 0.945098, 1, 0, 1,
-0.9513885, 0.1000014, -1.405595, 0.9372549, 1, 0, 1,
-0.9471614, 2.524868, 0.131498, 0.9333333, 1, 0, 1,
-0.9435843, -2.019069, -2.150968, 0.9254902, 1, 0, 1,
-0.9430127, -2.205673, -1.405943, 0.9215686, 1, 0, 1,
-0.9415972, 0.2390039, -1.159603, 0.9137255, 1, 0, 1,
-0.9401774, -0.361964, -1.11232, 0.9098039, 1, 0, 1,
-0.9285291, 1.741055, -2.320853, 0.9019608, 1, 0, 1,
-0.9258054, -0.2670819, -1.020804, 0.8941177, 1, 0, 1,
-0.9161074, -0.3184887, -1.444271, 0.8901961, 1, 0, 1,
-0.9157555, 0.2507247, -1.302472, 0.8823529, 1, 0, 1,
-0.9125732, -1.229945, -2.442342, 0.8784314, 1, 0, 1,
-0.9070908, 1.055356, -0.8929886, 0.8705882, 1, 0, 1,
-0.9033278, 1.473855, -1.695963, 0.8666667, 1, 0, 1,
-0.8976177, 1.056773, -0.2766441, 0.8588235, 1, 0, 1,
-0.8929821, -1.715133, -1.810662, 0.854902, 1, 0, 1,
-0.8908031, 0.7228662, -1.773138, 0.8470588, 1, 0, 1,
-0.8900865, -0.5953215, -3.925072, 0.8431373, 1, 0, 1,
-0.8870631, 0.7077919, -1.79246, 0.8352941, 1, 0, 1,
-0.8769423, -0.5405797, -2.177857, 0.8313726, 1, 0, 1,
-0.8758773, 0.9428775, -1.258118, 0.8235294, 1, 0, 1,
-0.8746805, -1.410057, -2.004502, 0.8196079, 1, 0, 1,
-0.8626096, 0.8704167, -1.580959, 0.8117647, 1, 0, 1,
-0.858543, -1.048896, -1.897031, 0.8078431, 1, 0, 1,
-0.8532156, 1.118657, -1.924293, 0.8, 1, 0, 1,
-0.8505088, -0.2135608, -2.781734, 0.7921569, 1, 0, 1,
-0.8481045, 0.1087109, -1.639122, 0.7882353, 1, 0, 1,
-0.8466713, -1.548847, -2.621827, 0.7803922, 1, 0, 1,
-0.8427804, 0.9303458, 0.5178878, 0.7764706, 1, 0, 1,
-0.8327548, -0.3045865, -0.9839643, 0.7686275, 1, 0, 1,
-0.8321648, 0.8827974, -1.361066, 0.7647059, 1, 0, 1,
-0.8203353, -0.01884669, -1.682196, 0.7568628, 1, 0, 1,
-0.8193194, -1.241828, -3.554678, 0.7529412, 1, 0, 1,
-0.8144399, 1.113927, -1.868391, 0.7450981, 1, 0, 1,
-0.8142412, 0.5726478, -1.525461, 0.7411765, 1, 0, 1,
-0.8138247, -0.0855182, -2.119667, 0.7333333, 1, 0, 1,
-0.8117448, 1.60252, -0.09807704, 0.7294118, 1, 0, 1,
-0.8012817, 0.1430682, 0.7500467, 0.7215686, 1, 0, 1,
-0.7994181, 1.019029, -1.417402, 0.7176471, 1, 0, 1,
-0.7981933, 0.3097771, -0.2863761, 0.7098039, 1, 0, 1,
-0.7957443, -0.5560176, -3.372788, 0.7058824, 1, 0, 1,
-0.7955805, 0.4117043, -1.178168, 0.6980392, 1, 0, 1,
-0.7826591, -0.704773, -2.568812, 0.6901961, 1, 0, 1,
-0.7743064, -0.1146644, -0.5036312, 0.6862745, 1, 0, 1,
-0.7697673, 1.346428, 0.7390525, 0.6784314, 1, 0, 1,
-0.7673975, -0.6493268, -2.874779, 0.6745098, 1, 0, 1,
-0.7641219, 1.311565, -1.116873, 0.6666667, 1, 0, 1,
-0.7635193, -0.2200072, -0.3616915, 0.6627451, 1, 0, 1,
-0.7612824, -0.6349943, -2.701984, 0.654902, 1, 0, 1,
-0.7603661, -1.176102, -4.222243, 0.6509804, 1, 0, 1,
-0.7529893, 0.2525129, -0.5374261, 0.6431373, 1, 0, 1,
-0.7496053, -1.45898, -2.569092, 0.6392157, 1, 0, 1,
-0.7469288, -0.8360122, -2.019144, 0.6313726, 1, 0, 1,
-0.7423623, -1.125486, -2.673613, 0.627451, 1, 0, 1,
-0.7412549, -0.79502, -2.964631, 0.6196079, 1, 0, 1,
-0.7379082, -1.137349, -1.882522, 0.6156863, 1, 0, 1,
-0.7375112, 0.003673148, 0.6976238, 0.6078432, 1, 0, 1,
-0.7351414, -1.74412, -3.43747, 0.6039216, 1, 0, 1,
-0.7327871, 0.3477347, -1.596527, 0.5960785, 1, 0, 1,
-0.7316633, 0.07713164, -0.897234, 0.5882353, 1, 0, 1,
-0.731498, 0.933021, 1.043401, 0.5843138, 1, 0, 1,
-0.7299243, 0.7091472, -0.8446947, 0.5764706, 1, 0, 1,
-0.7282734, -0.5118122, -4.327749, 0.572549, 1, 0, 1,
-0.7271559, -2.47913, -0.6806834, 0.5647059, 1, 0, 1,
-0.7208009, 0.7750394, -1.67621, 0.5607843, 1, 0, 1,
-0.7192876, 0.4860532, -0.4048275, 0.5529412, 1, 0, 1,
-0.7106057, -0.5574014, -0.3732037, 0.5490196, 1, 0, 1,
-0.7104344, -0.1809538, -2.318516, 0.5411765, 1, 0, 1,
-0.7088916, -1.541045, -2.430181, 0.5372549, 1, 0, 1,
-0.7069297, 0.5526601, 1.374578, 0.5294118, 1, 0, 1,
-0.7063403, -0.2665125, -2.334446, 0.5254902, 1, 0, 1,
-0.7039306, 0.3670961, -2.896981, 0.5176471, 1, 0, 1,
-0.7036312, 0.3016696, -0.6945987, 0.5137255, 1, 0, 1,
-0.702381, -0.7126768, -3.049195, 0.5058824, 1, 0, 1,
-0.7005071, 0.9807503, -0.3498572, 0.5019608, 1, 0, 1,
-0.7001113, 0.3674973, -2.819902, 0.4941176, 1, 0, 1,
-0.6976864, -1.744019, -3.652878, 0.4862745, 1, 0, 1,
-0.6973957, -1.371421, -2.761611, 0.4823529, 1, 0, 1,
-0.691296, -1.389624, -3.240272, 0.4745098, 1, 0, 1,
-0.6881981, -0.4752344, -3.448873, 0.4705882, 1, 0, 1,
-0.6861958, 2.339218, -0.1352072, 0.4627451, 1, 0, 1,
-0.6825421, -1.254393, -2.465308, 0.4588235, 1, 0, 1,
-0.6821601, 0.295776, 1.119983, 0.4509804, 1, 0, 1,
-0.6704131, 0.2054332, 0.3710403, 0.4470588, 1, 0, 1,
-0.6676622, -1.629906, -2.920545, 0.4392157, 1, 0, 1,
-0.6606034, 0.08408511, -0.4197816, 0.4352941, 1, 0, 1,
-0.6592412, 1.209935, -1.771896, 0.427451, 1, 0, 1,
-0.6516258, -1.687784, -3.432283, 0.4235294, 1, 0, 1,
-0.6476787, 0.7490028, -0.8883555, 0.4156863, 1, 0, 1,
-0.6455786, 0.5027146, 0.2394953, 0.4117647, 1, 0, 1,
-0.6451145, 1.570381, 1.83834, 0.4039216, 1, 0, 1,
-0.6442105, -0.6979142, -3.694831, 0.3960784, 1, 0, 1,
-0.6406678, 0.9433187, 0.2645172, 0.3921569, 1, 0, 1,
-0.6390918, 0.7431359, -0.06557673, 0.3843137, 1, 0, 1,
-0.638772, -0.5764446, -1.188446, 0.3803922, 1, 0, 1,
-0.6307023, -0.2349451, -0.9385557, 0.372549, 1, 0, 1,
-0.6292015, 0.5302234, -0.4872249, 0.3686275, 1, 0, 1,
-0.6286743, -0.7462843, -1.941181, 0.3607843, 1, 0, 1,
-0.6241749, 0.02763347, -1.748824, 0.3568628, 1, 0, 1,
-0.6224833, -0.7951458, -1.689841, 0.3490196, 1, 0, 1,
-0.6214803, 0.2958841, -0.8085533, 0.345098, 1, 0, 1,
-0.6197599, -0.8463807, -3.263641, 0.3372549, 1, 0, 1,
-0.6183215, 1.050788, 0.2245046, 0.3333333, 1, 0, 1,
-0.6173252, -1.84465, -3.065351, 0.3254902, 1, 0, 1,
-0.6120805, 0.1231226, -1.871183, 0.3215686, 1, 0, 1,
-0.6070663, -0.1554132, -2.337282, 0.3137255, 1, 0, 1,
-0.6026016, -0.7097246, -2.535451, 0.3098039, 1, 0, 1,
-0.6020361, 1.392981, 0.5591817, 0.3019608, 1, 0, 1,
-0.5982887, 0.1957558, -3.37465, 0.2941177, 1, 0, 1,
-0.5977128, -0.8334772, -2.711408, 0.2901961, 1, 0, 1,
-0.5971754, -0.4115829, -2.439827, 0.282353, 1, 0, 1,
-0.5903765, -1.454577, -0.1218537, 0.2784314, 1, 0, 1,
-0.5895853, -0.8763726, -0.4510376, 0.2705882, 1, 0, 1,
-0.58888, 0.8796592, -2.388273, 0.2666667, 1, 0, 1,
-0.5842495, -1.76359, -5.121988, 0.2588235, 1, 0, 1,
-0.583221, 0.2889737, -0.1529791, 0.254902, 1, 0, 1,
-0.5787712, 0.6246613, -0.6660578, 0.2470588, 1, 0, 1,
-0.5758092, -0.2547547, -1.488067, 0.2431373, 1, 0, 1,
-0.5744333, 1.210528, 0.9297115, 0.2352941, 1, 0, 1,
-0.5739034, -0.8795639, -1.328838, 0.2313726, 1, 0, 1,
-0.5654934, -0.7310115, -3.050187, 0.2235294, 1, 0, 1,
-0.5653731, 0.2464126, -2.952507, 0.2196078, 1, 0, 1,
-0.5611169, -0.4182707, -2.518269, 0.2117647, 1, 0, 1,
-0.5570612, 0.1464585, -2.029257, 0.2078431, 1, 0, 1,
-0.5520062, 1.576727, -1.233109, 0.2, 1, 0, 1,
-0.548884, -1.003275, -1.236897, 0.1921569, 1, 0, 1,
-0.5448753, 1.62449, -0.6380705, 0.1882353, 1, 0, 1,
-0.5448664, 1.389514, 0.2030923, 0.1803922, 1, 0, 1,
-0.5421861, 0.6308386, -0.355781, 0.1764706, 1, 0, 1,
-0.5409174, -0.1633852, -2.007122, 0.1686275, 1, 0, 1,
-0.5407203, 0.4669935, 0.08818925, 0.1647059, 1, 0, 1,
-0.5397096, -0.3515711, -1.242626, 0.1568628, 1, 0, 1,
-0.5384378, 0.8331453, 1.492432, 0.1529412, 1, 0, 1,
-0.5383937, 0.3195641, -2.123635, 0.145098, 1, 0, 1,
-0.5362988, -1.373033, -1.978041, 0.1411765, 1, 0, 1,
-0.534996, 0.6401178, -0.8187419, 0.1333333, 1, 0, 1,
-0.5289031, -0.0517231, -0.825006, 0.1294118, 1, 0, 1,
-0.5288557, -0.4892654, -3.528439, 0.1215686, 1, 0, 1,
-0.5263563, 1.493087, -0.9694957, 0.1176471, 1, 0, 1,
-0.5254167, -0.2867054, -1.979022, 0.1098039, 1, 0, 1,
-0.5238385, -0.4212498, -3.814521, 0.1058824, 1, 0, 1,
-0.5211802, -0.198204, -1.820016, 0.09803922, 1, 0, 1,
-0.5155827, 0.1199033, -1.570121, 0.09019608, 1, 0, 1,
-0.5155138, -0.06859168, -1.739486, 0.08627451, 1, 0, 1,
-0.5091763, 0.8643928, -1.654574, 0.07843138, 1, 0, 1,
-0.4983062, 1.400418, 0.3149827, 0.07450981, 1, 0, 1,
-0.4974231, -0.06953707, -2.866576, 0.06666667, 1, 0, 1,
-0.4965434, -0.2854233, -1.033199, 0.0627451, 1, 0, 1,
-0.4962537, 0.1800385, -2.010069, 0.05490196, 1, 0, 1,
-0.4957832, 1.299914, 0.3142775, 0.05098039, 1, 0, 1,
-0.4880609, 0.5748772, -0.9111436, 0.04313726, 1, 0, 1,
-0.4827368, -0.2444484, -3.102034, 0.03921569, 1, 0, 1,
-0.4825741, 0.05893143, 0.9402036, 0.03137255, 1, 0, 1,
-0.4816328, 1.087756, 1.242296, 0.02745098, 1, 0, 1,
-0.4811006, 0.7499385, -2.323869, 0.01960784, 1, 0, 1,
-0.4788037, 0.4345653, 0.9938804, 0.01568628, 1, 0, 1,
-0.4787484, -0.5651692, -4.179632, 0.007843138, 1, 0, 1,
-0.4683677, 1.975449, -2.598152, 0.003921569, 1, 0, 1,
-0.4663086, 0.8512222, -0.4105165, 0, 1, 0.003921569, 1,
-0.4654107, 0.02299703, -2.021119, 0, 1, 0.01176471, 1,
-0.464513, 1.263601, -0.9292265, 0, 1, 0.01568628, 1,
-0.4595153, 0.4463532, -0.8355015, 0, 1, 0.02352941, 1,
-0.4570634, 0.2027854, 0.0798205, 0, 1, 0.02745098, 1,
-0.4559525, -1.244375, -4.821881, 0, 1, 0.03529412, 1,
-0.4557582, 0.2533747, -0.7282428, 0, 1, 0.03921569, 1,
-0.4482615, -2.126061, -2.458664, 0, 1, 0.04705882, 1,
-0.4477145, 0.6060981, -0.1420666, 0, 1, 0.05098039, 1,
-0.444898, -0.5987895, -0.5236026, 0, 1, 0.05882353, 1,
-0.4374654, 0.002672377, -1.445073, 0, 1, 0.0627451, 1,
-0.4364015, -1.504998, -3.975712, 0, 1, 0.07058824, 1,
-0.4341184, 0.930185, -0.3317468, 0, 1, 0.07450981, 1,
-0.4301672, 0.5100942, 0.22001, 0, 1, 0.08235294, 1,
-0.4268286, -0.3082134, -3.961189, 0, 1, 0.08627451, 1,
-0.4260525, 0.02318607, -3.050957, 0, 1, 0.09411765, 1,
-0.4256435, 0.3067243, -1.858253, 0, 1, 0.1019608, 1,
-0.418616, -0.9150104, -1.673756, 0, 1, 0.1058824, 1,
-0.4154702, -1.837989, -2.971943, 0, 1, 0.1137255, 1,
-0.4132315, -0.09131894, -0.8522695, 0, 1, 0.1176471, 1,
-0.4124021, 0.65943, -0.05033372, 0, 1, 0.1254902, 1,
-0.4122364, -0.570046, -4.131747, 0, 1, 0.1294118, 1,
-0.4090391, -0.78394, -1.836654, 0, 1, 0.1372549, 1,
-0.4036988, -0.3730179, -3.845552, 0, 1, 0.1411765, 1,
-0.4034424, 0.6997449, 0.6152147, 0, 1, 0.1490196, 1,
-0.4002227, -0.6644484, -0.05437806, 0, 1, 0.1529412, 1,
-0.3989458, 0.9308201, 0.2130755, 0, 1, 0.1607843, 1,
-0.3969834, 0.9784465, -1.119455, 0, 1, 0.1647059, 1,
-0.3863805, 0.344419, -1.273828, 0, 1, 0.172549, 1,
-0.3779941, 0.4250801, -0.1999092, 0, 1, 0.1764706, 1,
-0.3778825, 0.3793875, -1.18382, 0, 1, 0.1843137, 1,
-0.3772687, 0.2845608, -1.455159, 0, 1, 0.1882353, 1,
-0.3771997, -0.9386168, -2.323188, 0, 1, 0.1960784, 1,
-0.3760433, 0.5806479, -2.211895, 0, 1, 0.2039216, 1,
-0.3744366, -0.6906918, -1.878771, 0, 1, 0.2078431, 1,
-0.370625, 0.3820788, -0.4805773, 0, 1, 0.2156863, 1,
-0.3697944, 2.511233, -0.4341005, 0, 1, 0.2196078, 1,
-0.3694131, 0.6155984, 0.720182, 0, 1, 0.227451, 1,
-0.3659686, -0.7725709, -2.990414, 0, 1, 0.2313726, 1,
-0.3582711, 0.1443061, -1.360769, 0, 1, 0.2392157, 1,
-0.3562887, -1.525419, -3.465513, 0, 1, 0.2431373, 1,
-0.3549774, 0.7181293, -1.750933, 0, 1, 0.2509804, 1,
-0.3545171, 0.02119368, -1.48477, 0, 1, 0.254902, 1,
-0.3507191, -0.2225432, -1.841405, 0, 1, 0.2627451, 1,
-0.3493845, -1.202437, -1.172844, 0, 1, 0.2666667, 1,
-0.3475657, 1.079823, 0.03355655, 0, 1, 0.2745098, 1,
-0.3471011, 0.7299292, 0.1018142, 0, 1, 0.2784314, 1,
-0.3465733, 0.4822084, -1.259741, 0, 1, 0.2862745, 1,
-0.3460886, -0.893541, -3.401846, 0, 1, 0.2901961, 1,
-0.3453083, 0.7636451, -1.044779, 0, 1, 0.2980392, 1,
-0.3445504, 0.6482746, 0.05981894, 0, 1, 0.3058824, 1,
-0.3430758, 0.5858451, 0.04479675, 0, 1, 0.3098039, 1,
-0.3430488, 1.614166, -0.2978235, 0, 1, 0.3176471, 1,
-0.3416784, -0.5531833, -3.00352, 0, 1, 0.3215686, 1,
-0.3402261, 1.433552, 1.494203, 0, 1, 0.3294118, 1,
-0.3255899, -0.798201, -2.200942, 0, 1, 0.3333333, 1,
-0.3244741, 1.004497, -0.05818543, 0, 1, 0.3411765, 1,
-0.3228235, -0.7750959, -2.516896, 0, 1, 0.345098, 1,
-0.3203977, -0.9748033, -2.710867, 0, 1, 0.3529412, 1,
-0.3203284, 0.8728731, -0.5727494, 0, 1, 0.3568628, 1,
-0.318951, 0.1890177, -0.2893466, 0, 1, 0.3647059, 1,
-0.318922, 0.4170307, 0.0391711, 0, 1, 0.3686275, 1,
-0.3176269, -0.2671738, -2.972049, 0, 1, 0.3764706, 1,
-0.3126157, 0.5080283, -0.9046346, 0, 1, 0.3803922, 1,
-0.3119899, -2.36966, -2.789115, 0, 1, 0.3882353, 1,
-0.3099719, -1.569504, -3.206791, 0, 1, 0.3921569, 1,
-0.3076392, -0.8568636, -2.373916, 0, 1, 0.4, 1,
-0.3022971, -1.086097, -3.861783, 0, 1, 0.4078431, 1,
-0.2991009, -0.07745252, -2.084068, 0, 1, 0.4117647, 1,
-0.292084, 0.2597068, -1.279514, 0, 1, 0.4196078, 1,
-0.2829648, -0.5455393, -2.326757, 0, 1, 0.4235294, 1,
-0.2808388, -0.5679083, -1.586384, 0, 1, 0.4313726, 1,
-0.2797773, -0.09991337, -2.134418, 0, 1, 0.4352941, 1,
-0.2776954, 1.83201, 0.8741361, 0, 1, 0.4431373, 1,
-0.2774211, -0.8636047, -1.995376, 0, 1, 0.4470588, 1,
-0.2730848, 0.1097563, -0.560825, 0, 1, 0.454902, 1,
-0.2715873, 0.3079807, -0.5639783, 0, 1, 0.4588235, 1,
-0.2660474, -0.8831165, -2.059287, 0, 1, 0.4666667, 1,
-0.2650392, 0.4196046, -1.687751, 0, 1, 0.4705882, 1,
-0.2584062, -0.5726631, -1.86316, 0, 1, 0.4784314, 1,
-0.2556639, 1.231247, 0.716889, 0, 1, 0.4823529, 1,
-0.2544894, 1.222209, -0.5082172, 0, 1, 0.4901961, 1,
-0.2525799, 0.9545959, 0.228935, 0, 1, 0.4941176, 1,
-0.2509341, 2.186228, 0.5591257, 0, 1, 0.5019608, 1,
-0.2482353, 0.3744098, -0.2940713, 0, 1, 0.509804, 1,
-0.2431818, -0.4682394, -1.239422, 0, 1, 0.5137255, 1,
-0.2411748, -1.182747, -4.289351, 0, 1, 0.5215687, 1,
-0.240872, 1.615405, 1.437727, 0, 1, 0.5254902, 1,
-0.2372253, -0.7606072, -2.953616, 0, 1, 0.5333334, 1,
-0.2343671, 0.6122369, -1.582281, 0, 1, 0.5372549, 1,
-0.234082, 0.4188421, -0.8287071, 0, 1, 0.5450981, 1,
-0.2335125, -0.8478541, -1.994735, 0, 1, 0.5490196, 1,
-0.229708, -0.1435983, -1.689925, 0, 1, 0.5568628, 1,
-0.2118566, -0.734368, -1.640539, 0, 1, 0.5607843, 1,
-0.2104946, -0.5930379, -2.986086, 0, 1, 0.5686275, 1,
-0.2079049, -1.117128, -3.637216, 0, 1, 0.572549, 1,
-0.1996368, 4.082833e-05, -2.10376, 0, 1, 0.5803922, 1,
-0.1992355, 1.602167, 0.6880832, 0, 1, 0.5843138, 1,
-0.1990772, -1.641029, -5.666665, 0, 1, 0.5921569, 1,
-0.198414, -1.378996, -2.107154, 0, 1, 0.5960785, 1,
-0.1969434, -0.9140589, -4.26164, 0, 1, 0.6039216, 1,
-0.1963541, 0.1971229, 1.667619, 0, 1, 0.6117647, 1,
-0.1955315, -0.3411433, -3.060472, 0, 1, 0.6156863, 1,
-0.1927733, -0.04656584, -1.066547, 0, 1, 0.6235294, 1,
-0.190421, -0.05719157, -2.555945, 0, 1, 0.627451, 1,
-0.1889565, 1.247982, 1.548287, 0, 1, 0.6352941, 1,
-0.1850693, -0.5343642, -3.666691, 0, 1, 0.6392157, 1,
-0.1842842, 0.3577319, -1.001929, 0, 1, 0.6470588, 1,
-0.1822133, 0.07815505, -0.4917361, 0, 1, 0.6509804, 1,
-0.1818614, 0.4777901, 1.440975, 0, 1, 0.6588235, 1,
-0.1785702, 0.9888836, 0.1647315, 0, 1, 0.6627451, 1,
-0.1782596, 0.5700379, 0.09277212, 0, 1, 0.6705883, 1,
-0.1780562, 0.2414698, -1.638178, 0, 1, 0.6745098, 1,
-0.1758142, -0.5517738, -4.726791, 0, 1, 0.682353, 1,
-0.1715098, 0.2513305, -1.554078, 0, 1, 0.6862745, 1,
-0.1699984, -0.6886505, -1.898363, 0, 1, 0.6941177, 1,
-0.1693831, 0.8464561, -0.6169346, 0, 1, 0.7019608, 1,
-0.1668304, 0.9389509, -0.08174431, 0, 1, 0.7058824, 1,
-0.1655495, 0.7880619, -1.677225, 0, 1, 0.7137255, 1,
-0.1628662, 0.09329871, -0.9215301, 0, 1, 0.7176471, 1,
-0.1625201, -0.568216, -5.009207, 0, 1, 0.7254902, 1,
-0.1597629, 1.501918, -0.1289085, 0, 1, 0.7294118, 1,
-0.1597543, -0.1633435, -3.089743, 0, 1, 0.7372549, 1,
-0.1585553, 0.1320397, -1.493881, 0, 1, 0.7411765, 1,
-0.1574309, 0.993243, 0.8862754, 0, 1, 0.7490196, 1,
-0.1567202, 0.1239922, -1.215598, 0, 1, 0.7529412, 1,
-0.1556952, 0.950841, 0.1910396, 0, 1, 0.7607843, 1,
-0.1537097, -0.326295, -2.793315, 0, 1, 0.7647059, 1,
-0.1493528, 0.02275944, -0.8192852, 0, 1, 0.772549, 1,
-0.1473388, -0.235175, -3.476004, 0, 1, 0.7764706, 1,
-0.1468838, 1.384743, 0.7940351, 0, 1, 0.7843137, 1,
-0.1438193, 1.44887, 0.7239451, 0, 1, 0.7882353, 1,
-0.1384501, -0.02723223, -2.340677, 0, 1, 0.7960784, 1,
-0.1368675, 0.784287, 0.2544472, 0, 1, 0.8039216, 1,
-0.1271381, 1.280333, -0.5948648, 0, 1, 0.8078431, 1,
-0.1239783, -0.9336326, -0.617113, 0, 1, 0.8156863, 1,
-0.117769, 1.178586, -0.1233865, 0, 1, 0.8196079, 1,
-0.117613, -1.006027, -3.342321, 0, 1, 0.827451, 1,
-0.1147211, -0.7073916, -2.932516, 0, 1, 0.8313726, 1,
-0.1145448, -1.206654, -0.9912609, 0, 1, 0.8392157, 1,
-0.1073945, -0.07002237, -1.405999, 0, 1, 0.8431373, 1,
-0.1014418, -1.615339, -3.012813, 0, 1, 0.8509804, 1,
-0.1002126, 0.5666009, 1.134648, 0, 1, 0.854902, 1,
-0.09003457, -1.729348, -2.877819, 0, 1, 0.8627451, 1,
-0.08790842, 0.4847057, -0.685259, 0, 1, 0.8666667, 1,
-0.08294929, -0.6390103, -1.978592, 0, 1, 0.8745098, 1,
-0.08132631, -1.122266, -3.341201, 0, 1, 0.8784314, 1,
-0.08069416, 0.9646524, 0.2165241, 0, 1, 0.8862745, 1,
-0.07872627, 0.7737445, 0.4315977, 0, 1, 0.8901961, 1,
-0.07702045, 1.063768, 0.7119232, 0, 1, 0.8980392, 1,
-0.07600005, 0.5583609, -0.2047675, 0, 1, 0.9058824, 1,
-0.0729479, -0.2964744, -1.921501, 0, 1, 0.9098039, 1,
-0.07210868, -0.7024229, -3.579096, 0, 1, 0.9176471, 1,
-0.07194576, 0.8175008, 0.8908877, 0, 1, 0.9215686, 1,
-0.070348, 1.761858, 1.560503, 0, 1, 0.9294118, 1,
-0.06689574, -0.7210329, -3.556753, 0, 1, 0.9333333, 1,
-0.06097186, -0.3907604, -3.738662, 0, 1, 0.9411765, 1,
-0.05429269, 1.544688, -0.004179669, 0, 1, 0.945098, 1,
-0.04928877, 1.921604, -1.810308, 0, 1, 0.9529412, 1,
-0.04824041, -3.241817, -2.656955, 0, 1, 0.9568627, 1,
-0.04810447, 1.229062, 1.231558, 0, 1, 0.9647059, 1,
-0.04756554, -0.9142727, -2.333958, 0, 1, 0.9686275, 1,
-0.04522012, -0.3299742, -2.124521, 0, 1, 0.9764706, 1,
-0.04408031, -0.9069749, -2.254116, 0, 1, 0.9803922, 1,
-0.04106628, 0.762431, -0.6891249, 0, 1, 0.9882353, 1,
-0.02844614, -0.9574273, -3.999465, 0, 1, 0.9921569, 1,
-0.02790619, -0.2887252, -1.519951, 0, 1, 1, 1,
-0.02550564, 0.02445458, -1.436701, 0, 0.9921569, 1, 1,
-0.02427957, -0.6347353, -1.959869, 0, 0.9882353, 1, 1,
-0.0238519, -0.3163829, -1.180603, 0, 0.9803922, 1, 1,
-0.02379877, -1.386108, -2.859374, 0, 0.9764706, 1, 1,
-0.02331624, 0.9769515, 2.305328, 0, 0.9686275, 1, 1,
-0.02072582, -0.9029142, -4.24785, 0, 0.9647059, 1, 1,
-0.01956894, 0.07920519, -0.5572683, 0, 0.9568627, 1, 1,
-0.009631387, 0.6940805, -1.040964, 0, 0.9529412, 1, 1,
-0.006889985, -3.140167, -3.488853, 0, 0.945098, 1, 1,
-0.001886964, -1.106219, -2.878449, 0, 0.9411765, 1, 1,
0.004270113, 0.6823296, -1.263648, 0, 0.9333333, 1, 1,
0.004516278, -0.6733463, 1.090199, 0, 0.9294118, 1, 1,
0.005155282, 0.4732003, 0.5109766, 0, 0.9215686, 1, 1,
0.006459217, -0.05780553, 1.820862, 0, 0.9176471, 1, 1,
0.01298039, 0.8971852, -1.243938, 0, 0.9098039, 1, 1,
0.0156147, 0.897651, 0.3508832, 0, 0.9058824, 1, 1,
0.01712029, -0.3134448, 2.840868, 0, 0.8980392, 1, 1,
0.01733479, -0.2901614, 3.512362, 0, 0.8901961, 1, 1,
0.02134979, -2.72603, 1.787349, 0, 0.8862745, 1, 1,
0.02316681, -0.979511, 2.871394, 0, 0.8784314, 1, 1,
0.02653656, -2.265153, 4.571487, 0, 0.8745098, 1, 1,
0.03003854, 1.315286, 2.403624, 0, 0.8666667, 1, 1,
0.03110378, -0.2406705, 3.231652, 0, 0.8627451, 1, 1,
0.03819685, -1.252905, 5.011284, 0, 0.854902, 1, 1,
0.04002369, 0.9669791, -1.310492, 0, 0.8509804, 1, 1,
0.04033553, -1.39, 2.528077, 0, 0.8431373, 1, 1,
0.04139064, -0.9648556, 3.532462, 0, 0.8392157, 1, 1,
0.0423772, -0.5366108, 2.976872, 0, 0.8313726, 1, 1,
0.0460964, 0.04445441, 1.589678, 0, 0.827451, 1, 1,
0.04848117, -0.289831, 2.28096, 0, 0.8196079, 1, 1,
0.05119024, 0.1802998, 0.1690929, 0, 0.8156863, 1, 1,
0.05210472, 0.1313772, 1.598507, 0, 0.8078431, 1, 1,
0.05382268, -1.148373, 3.164329, 0, 0.8039216, 1, 1,
0.05415633, 1.573117, 2.502821, 0, 0.7960784, 1, 1,
0.05650507, -1.192306, 2.385777, 0, 0.7882353, 1, 1,
0.06055897, -0.8208482, 3.231051, 0, 0.7843137, 1, 1,
0.06096328, -0.4280151, 2.278355, 0, 0.7764706, 1, 1,
0.06164967, -0.0634918, 2.185968, 0, 0.772549, 1, 1,
0.06202333, -1.031251, 2.426888, 0, 0.7647059, 1, 1,
0.06234783, 0.1270512, -0.3154739, 0, 0.7607843, 1, 1,
0.06367447, 0.9284468, 0.0367356, 0, 0.7529412, 1, 1,
0.06570843, 2.627245, -1.277132, 0, 0.7490196, 1, 1,
0.07084139, 1.308434, 1.892058, 0, 0.7411765, 1, 1,
0.07086696, 0.5638744, 1.305262, 0, 0.7372549, 1, 1,
0.07275357, -1.674375, 1.723793, 0, 0.7294118, 1, 1,
0.0755233, -0.9643811, 4.161473, 0, 0.7254902, 1, 1,
0.07869456, 1.020303, -0.1826382, 0, 0.7176471, 1, 1,
0.07887113, -0.3504646, 3.596877, 0, 0.7137255, 1, 1,
0.08032913, 1.702513, 1.282228, 0, 0.7058824, 1, 1,
0.08058318, 1.278249, -0.01055799, 0, 0.6980392, 1, 1,
0.08349614, 0.9361558, 0.3151616, 0, 0.6941177, 1, 1,
0.08784211, 0.7362128, 2.542801, 0, 0.6862745, 1, 1,
0.09123018, 0.3422212, 0.3666775, 0, 0.682353, 1, 1,
0.09471323, -0.3442956, 3.267049, 0, 0.6745098, 1, 1,
0.0985465, 0.08413974, 0.8755419, 0, 0.6705883, 1, 1,
0.09901847, 0.1788595, 1.762027, 0, 0.6627451, 1, 1,
0.1009792, 0.2233849, 0.7833511, 0, 0.6588235, 1, 1,
0.1035165, 1.21519, -0.04741855, 0, 0.6509804, 1, 1,
0.1045454, 1.32377, 0.4510118, 0, 0.6470588, 1, 1,
0.1054732, 0.6231048, 0.7587327, 0, 0.6392157, 1, 1,
0.1134387, 0.2058079, 1.029994, 0, 0.6352941, 1, 1,
0.1138084, -1.48098, 2.003954, 0, 0.627451, 1, 1,
0.1157682, 0.2622123, 0.05813055, 0, 0.6235294, 1, 1,
0.11906, 0.8957385, -0.04499775, 0, 0.6156863, 1, 1,
0.1212045, -1.01655, 2.692163, 0, 0.6117647, 1, 1,
0.1212717, 0.1439677, 2.305668, 0, 0.6039216, 1, 1,
0.125804, -0.0834791, 1.210887, 0, 0.5960785, 1, 1,
0.1278937, 0.9787387, 1.575962, 0, 0.5921569, 1, 1,
0.1283797, -1.128509, 4.099384, 0, 0.5843138, 1, 1,
0.1288648, 0.7098546, -0.03979481, 0, 0.5803922, 1, 1,
0.1298479, -1.783657, 3.516253, 0, 0.572549, 1, 1,
0.1301108, -0.6411635, 3.67276, 0, 0.5686275, 1, 1,
0.1311401, 0.5055438, 1.950599, 0, 0.5607843, 1, 1,
0.1334991, 0.4977909, 0.7064123, 0, 0.5568628, 1, 1,
0.139624, -0.507475, 2.655295, 0, 0.5490196, 1, 1,
0.1424109, 0.586237, 1.100805, 0, 0.5450981, 1, 1,
0.1444835, -2.305191, 2.094668, 0, 0.5372549, 1, 1,
0.1456935, -0.02830876, 2.464885, 0, 0.5333334, 1, 1,
0.1460867, -0.8385782, 3.112363, 0, 0.5254902, 1, 1,
0.1466929, -0.9292307, 4.103044, 0, 0.5215687, 1, 1,
0.1489426, 0.2207466, 0.130366, 0, 0.5137255, 1, 1,
0.1515702, -0.560273, 3.693552, 0, 0.509804, 1, 1,
0.1580141, -1.627758, 2.951192, 0, 0.5019608, 1, 1,
0.1593401, -1.527901, 3.315477, 0, 0.4941176, 1, 1,
0.1625833, -0.4854327, 2.37369, 0, 0.4901961, 1, 1,
0.1650875, -0.6395224, 1.460902, 0, 0.4823529, 1, 1,
0.1664003, -0.2648478, 4.822492, 0, 0.4784314, 1, 1,
0.1696184, -0.1835888, 1.688731, 0, 0.4705882, 1, 1,
0.1709317, 1.537892, 1.204852, 0, 0.4666667, 1, 1,
0.1712747, -0.6319373, 2.628547, 0, 0.4588235, 1, 1,
0.1770715, -0.5699807, 2.153805, 0, 0.454902, 1, 1,
0.1810641, 1.05799, 0.501969, 0, 0.4470588, 1, 1,
0.1820299, 0.6482777, 0.7693647, 0, 0.4431373, 1, 1,
0.1850338, -0.936536, 1.310799, 0, 0.4352941, 1, 1,
0.1862758, -1.182351, 2.861729, 0, 0.4313726, 1, 1,
0.1891744, 0.6483002, -0.09514835, 0, 0.4235294, 1, 1,
0.1894839, -1.25524, 4.434543, 0, 0.4196078, 1, 1,
0.1898438, 0.2217972, 0.6171363, 0, 0.4117647, 1, 1,
0.206151, -0.1198552, 2.189619, 0, 0.4078431, 1, 1,
0.2099451, 0.7783498, -0.1481162, 0, 0.4, 1, 1,
0.2109505, 0.6974158, -0.1502367, 0, 0.3921569, 1, 1,
0.211481, -1.060169, 5.569157, 0, 0.3882353, 1, 1,
0.2161427, 0.2583633, 1.586745, 0, 0.3803922, 1, 1,
0.2226321, -0.8396904, 1.411998, 0, 0.3764706, 1, 1,
0.226529, -0.547414, 2.478522, 0, 0.3686275, 1, 1,
0.2277783, 0.6610301, 1.79186, 0, 0.3647059, 1, 1,
0.2295846, -2.155461, 2.701518, 0, 0.3568628, 1, 1,
0.23136, -1.77669, 3.352297, 0, 0.3529412, 1, 1,
0.2322181, -0.1410925, 3.918697, 0, 0.345098, 1, 1,
0.2354326, 0.2502131, 0.2502003, 0, 0.3411765, 1, 1,
0.2388124, 1.325532, 0.9776719, 0, 0.3333333, 1, 1,
0.2393428, 0.8996814, -0.5904747, 0, 0.3294118, 1, 1,
0.2457467, -0.03044496, 4.1832, 0, 0.3215686, 1, 1,
0.2534536, 0.4151344, 1.298093, 0, 0.3176471, 1, 1,
0.257118, 0.6717251, 0.5802346, 0, 0.3098039, 1, 1,
0.2573897, -0.8339737, 1.74796, 0, 0.3058824, 1, 1,
0.2585019, 0.09293921, 0.07294244, 0, 0.2980392, 1, 1,
0.258698, -0.2436338, 4.377228, 0, 0.2901961, 1, 1,
0.2595229, -0.2779286, 2.630771, 0, 0.2862745, 1, 1,
0.2699436, -0.4673101, 1.239729, 0, 0.2784314, 1, 1,
0.2775373, 0.7034284, 1.376677, 0, 0.2745098, 1, 1,
0.2776433, 0.6378937, 2.372484, 0, 0.2666667, 1, 1,
0.2777669, 0.5955604, 1.062388, 0, 0.2627451, 1, 1,
0.284347, 0.3274634, 0.921605, 0, 0.254902, 1, 1,
0.2860024, -0.5968845, 2.436848, 0, 0.2509804, 1, 1,
0.286047, 0.549638, 0.2109806, 0, 0.2431373, 1, 1,
0.287891, -0.8638662, 1.684906, 0, 0.2392157, 1, 1,
0.2896138, -1.001704, 3.977058, 0, 0.2313726, 1, 1,
0.2904831, -1.251413, 3.763901, 0, 0.227451, 1, 1,
0.2909337, 2.702609, -0.5956901, 0, 0.2196078, 1, 1,
0.2930725, 1.609989, -0.206065, 0, 0.2156863, 1, 1,
0.300824, 1.044881, -0.1436908, 0, 0.2078431, 1, 1,
0.3016036, -0.4097351, 3.89614, 0, 0.2039216, 1, 1,
0.3022504, 0.05606091, 2.232552, 0, 0.1960784, 1, 1,
0.3039698, 0.8959967, 1.096211, 0, 0.1882353, 1, 1,
0.3101599, -0.7116454, 2.580787, 0, 0.1843137, 1, 1,
0.311975, -0.07176346, 3.09454, 0, 0.1764706, 1, 1,
0.3137898, 0.3128173, 2.524176, 0, 0.172549, 1, 1,
0.3149661, 1.22142, -0.1601805, 0, 0.1647059, 1, 1,
0.3169424, -0.08575274, 3.001324, 0, 0.1607843, 1, 1,
0.3195744, -0.001317963, 1.12528, 0, 0.1529412, 1, 1,
0.3209595, -0.6854318, 3.132761, 0, 0.1490196, 1, 1,
0.324982, -0.7110126, 1.031214, 0, 0.1411765, 1, 1,
0.3310951, 0.4844392, -0.8775868, 0, 0.1372549, 1, 1,
0.3343319, 0.6929784, 0.8968196, 0, 0.1294118, 1, 1,
0.3362045, -0.7371747, 3.213665, 0, 0.1254902, 1, 1,
0.3447454, -1.321574, 2.332846, 0, 0.1176471, 1, 1,
0.349143, 0.2522483, 1.637994, 0, 0.1137255, 1, 1,
0.3500021, -1.101946, 4.723778, 0, 0.1058824, 1, 1,
0.3507259, -0.1208786, 1.321829, 0, 0.09803922, 1, 1,
0.3563589, 1.249219, 0.2242718, 0, 0.09411765, 1, 1,
0.359967, -0.3922504, 3.663347, 0, 0.08627451, 1, 1,
0.3683563, -1.023682, 0.5933412, 0, 0.08235294, 1, 1,
0.3695512, -0.2620187, 1.248951, 0, 0.07450981, 1, 1,
0.3770858, -1.0484, 1.797062, 0, 0.07058824, 1, 1,
0.3784333, -0.5274634, 1.641902, 0, 0.0627451, 1, 1,
0.3874141, 0.7334453, 0.8712211, 0, 0.05882353, 1, 1,
0.389497, -0.1355567, 2.912901, 0, 0.05098039, 1, 1,
0.3940161, 0.7119624, 1.838172, 0, 0.04705882, 1, 1,
0.39744, 2.141026, -0.7857993, 0, 0.03921569, 1, 1,
0.398045, -0.0188129, 1.289168, 0, 0.03529412, 1, 1,
0.4050494, -1.221295, 0.4324022, 0, 0.02745098, 1, 1,
0.4083055, -0.3399044, 3.702428, 0, 0.02352941, 1, 1,
0.410957, -1.274943, 2.660581, 0, 0.01568628, 1, 1,
0.4109705, -0.5746681, 3.380386, 0, 0.01176471, 1, 1,
0.4110289, -0.2032028, 2.564802, 0, 0.003921569, 1, 1,
0.4144187, 0.5815255, -0.3070266, 0.003921569, 0, 1, 1,
0.415306, 0.3810765, -1.258236, 0.007843138, 0, 1, 1,
0.4155498, 2.067847, 2.922454, 0.01568628, 0, 1, 1,
0.4167271, 1.291008, -0.3751701, 0.01960784, 0, 1, 1,
0.4170044, 0.6565254, 0.3305481, 0.02745098, 0, 1, 1,
0.4187742, 1.80345, 0.6280146, 0.03137255, 0, 1, 1,
0.4204612, -1.028744, 2.549871, 0.03921569, 0, 1, 1,
0.4222278, 0.1263243, 0.7518838, 0.04313726, 0, 1, 1,
0.4252899, -3.216116, 2.325328, 0.05098039, 0, 1, 1,
0.4282999, -1.138378, 2.489974, 0.05490196, 0, 1, 1,
0.4291799, 0.8794488, 0.3771871, 0.0627451, 0, 1, 1,
0.4327812, -1.088872, 2.201849, 0.06666667, 0, 1, 1,
0.4328292, -0.945454, 3.024809, 0.07450981, 0, 1, 1,
0.4331406, 0.2063348, 1.707708, 0.07843138, 0, 1, 1,
0.439833, -1.049169, 2.357265, 0.08627451, 0, 1, 1,
0.4405485, -1.524208, 3.366882, 0.09019608, 0, 1, 1,
0.4417695, 0.1030693, 1.77882, 0.09803922, 0, 1, 1,
0.4422683, 1.367455, -0.3782274, 0.1058824, 0, 1, 1,
0.4435462, 0.3604926, 0.09701094, 0.1098039, 0, 1, 1,
0.4466875, 1.408489, 0.2038463, 0.1176471, 0, 1, 1,
0.4467354, -1.781617, 3.942483, 0.1215686, 0, 1, 1,
0.4513559, 1.821538, -0.6959008, 0.1294118, 0, 1, 1,
0.4524795, 0.6449422, 0.1741329, 0.1333333, 0, 1, 1,
0.454014, 0.7339579, -0.2078051, 0.1411765, 0, 1, 1,
0.4566124, 0.5790439, 1.475936, 0.145098, 0, 1, 1,
0.4591593, 0.5847603, 1.131319, 0.1529412, 0, 1, 1,
0.4597511, -1.075437, 2.070034, 0.1568628, 0, 1, 1,
0.4616483, -0.4669413, 2.414024, 0.1647059, 0, 1, 1,
0.463776, -1.731265, 2.73469, 0.1686275, 0, 1, 1,
0.4681824, 2.274477, -0.438192, 0.1764706, 0, 1, 1,
0.4691306, -0.8522904, 2.616501, 0.1803922, 0, 1, 1,
0.4691999, -0.3624337, 0.9497994, 0.1882353, 0, 1, 1,
0.4702816, 1.818208, 0.3905855, 0.1921569, 0, 1, 1,
0.472185, 0.5583777, 1.529748, 0.2, 0, 1, 1,
0.4748059, 0.8691127, 1.741507, 0.2078431, 0, 1, 1,
0.4806953, -1.028862, 1.945965, 0.2117647, 0, 1, 1,
0.4843659, 0.5518963, 0.2073101, 0.2196078, 0, 1, 1,
0.4885751, -0.5787467, 3.487219, 0.2235294, 0, 1, 1,
0.4951301, 0.6720949, 0.1092835, 0.2313726, 0, 1, 1,
0.4960285, -0.8890896, 3.460932, 0.2352941, 0, 1, 1,
0.4969935, -0.1774412, 2.130396, 0.2431373, 0, 1, 1,
0.5046343, -0.1275765, 2.370887, 0.2470588, 0, 1, 1,
0.5075442, 0.7145316, -0.1586125, 0.254902, 0, 1, 1,
0.5115751, 0.3218724, 1.186149, 0.2588235, 0, 1, 1,
0.5116944, 0.3314407, -1.40544, 0.2666667, 0, 1, 1,
0.5154715, -0.5877401, 1.741115, 0.2705882, 0, 1, 1,
0.5181664, 1.003936, 0.278006, 0.2784314, 0, 1, 1,
0.5210524, 1.181732, 0.6588969, 0.282353, 0, 1, 1,
0.5221786, 1.008912, 0.6549488, 0.2901961, 0, 1, 1,
0.5224538, -0.2123625, 1.445223, 0.2941177, 0, 1, 1,
0.523858, -0.8709205, 1.965729, 0.3019608, 0, 1, 1,
0.5255109, 0.1580637, 0.5294294, 0.3098039, 0, 1, 1,
0.5269127, -1.086495, 3.153444, 0.3137255, 0, 1, 1,
0.5290282, 0.3551819, -0.4993958, 0.3215686, 0, 1, 1,
0.5311625, -1.145315, 2.999021, 0.3254902, 0, 1, 1,
0.5349805, -1.138321, 3.333689, 0.3333333, 0, 1, 1,
0.5354559, 1.69599, 1.229313, 0.3372549, 0, 1, 1,
0.5409503, -0.3525761, 3.2267, 0.345098, 0, 1, 1,
0.5417637, -0.5138777, 3.250702, 0.3490196, 0, 1, 1,
0.550089, -0.7428976, 2.31884, 0.3568628, 0, 1, 1,
0.5512608, -0.0320094, 1.180168, 0.3607843, 0, 1, 1,
0.5517802, 0.3720199, -0.4165362, 0.3686275, 0, 1, 1,
0.5547079, -1.571632, 2.492059, 0.372549, 0, 1, 1,
0.5581753, -1.503382, 3.876527, 0.3803922, 0, 1, 1,
0.5607764, -0.3976013, 2.763662, 0.3843137, 0, 1, 1,
0.5615932, 1.076989, 1.555456, 0.3921569, 0, 1, 1,
0.5617791, 0.1469236, -0.2733089, 0.3960784, 0, 1, 1,
0.5638931, 0.8193639, 0.4329182, 0.4039216, 0, 1, 1,
0.5640636, 1.448636, 0.04870247, 0.4117647, 0, 1, 1,
0.5747708, 1.13901, 1.112218, 0.4156863, 0, 1, 1,
0.5806891, -0.6156948, 2.32437, 0.4235294, 0, 1, 1,
0.5873488, 0.5661526, 2.724371, 0.427451, 0, 1, 1,
0.5929626, -0.03402552, 0.9632519, 0.4352941, 0, 1, 1,
0.5986535, -0.4974987, 2.260864, 0.4392157, 0, 1, 1,
0.6081669, -0.9238344, 3.372864, 0.4470588, 0, 1, 1,
0.6115597, -0.1275848, 0.6616768, 0.4509804, 0, 1, 1,
0.6210914, -0.05197038, 1.237582, 0.4588235, 0, 1, 1,
0.6212814, -0.1772455, 3.104725, 0.4627451, 0, 1, 1,
0.6264936, 0.9321911, -0.1667906, 0.4705882, 0, 1, 1,
0.6282117, -1.011542, 1.668878, 0.4745098, 0, 1, 1,
0.6285684, 0.4047182, 0.7604806, 0.4823529, 0, 1, 1,
0.6320537, -0.7486745, 3.366797, 0.4862745, 0, 1, 1,
0.6330343, 1.369984, 0.9217734, 0.4941176, 0, 1, 1,
0.6356944, -0.7270901, 3.935101, 0.5019608, 0, 1, 1,
0.6383083, -0.915478, 1.570777, 0.5058824, 0, 1, 1,
0.6390836, -1.706083, 2.619953, 0.5137255, 0, 1, 1,
0.6407228, 0.3401062, 2.311234, 0.5176471, 0, 1, 1,
0.6489979, 1.606427, 1.021134, 0.5254902, 0, 1, 1,
0.6490282, 0.4064989, 0.6543125, 0.5294118, 0, 1, 1,
0.652247, -0.604429, 3.921396, 0.5372549, 0, 1, 1,
0.6627114, 1.430186, 1.58429, 0.5411765, 0, 1, 1,
0.6640383, 0.5452132, 1.617904, 0.5490196, 0, 1, 1,
0.6657129, -0.450202, 2.255104, 0.5529412, 0, 1, 1,
0.6659758, 1.815782, -1.780825, 0.5607843, 0, 1, 1,
0.6713293, -1.503218, 4.416119, 0.5647059, 0, 1, 1,
0.6789653, 0.1827008, 0.999945, 0.572549, 0, 1, 1,
0.6804163, 0.9409307, 0.5638896, 0.5764706, 0, 1, 1,
0.6806948, -0.6537478, 1.836076, 0.5843138, 0, 1, 1,
0.6838449, 1.23436, 2.114465, 0.5882353, 0, 1, 1,
0.6880029, 0.1884486, 2.630884, 0.5960785, 0, 1, 1,
0.6911, 1.229805, -0.4526135, 0.6039216, 0, 1, 1,
0.693311, -1.796497, 0.647379, 0.6078432, 0, 1, 1,
0.6995754, 1.078029, -1.965537, 0.6156863, 0, 1, 1,
0.7007449, 0.5531655, -0.193183, 0.6196079, 0, 1, 1,
0.7031852, 0.4529777, 1.475878, 0.627451, 0, 1, 1,
0.7035672, 1.200902, -1.340937, 0.6313726, 0, 1, 1,
0.7040079, -0.985849, 1.22624, 0.6392157, 0, 1, 1,
0.7045544, 1.310587, 0.5194629, 0.6431373, 0, 1, 1,
0.7047527, -1.748825, 2.087971, 0.6509804, 0, 1, 1,
0.7051745, -0.3671952, 1.724967, 0.654902, 0, 1, 1,
0.7069852, -0.2102132, 1.286119, 0.6627451, 0, 1, 1,
0.7076348, 2.011509, -0.5698082, 0.6666667, 0, 1, 1,
0.7093786, -1.059741, 2.725974, 0.6745098, 0, 1, 1,
0.7135441, -2.762578, 3.667121, 0.6784314, 0, 1, 1,
0.7240046, 1.375554, 0.4273945, 0.6862745, 0, 1, 1,
0.7246526, -0.03818103, 0.6655035, 0.6901961, 0, 1, 1,
0.7252342, 0.4918493, 0.5974714, 0.6980392, 0, 1, 1,
0.7274324, -0.3179576, 0.2639996, 0.7058824, 0, 1, 1,
0.7313267, -0.3723448, 3.254703, 0.7098039, 0, 1, 1,
0.7320136, 0.2253811, 2.273126, 0.7176471, 0, 1, 1,
0.7360231, -1.716191, 2.812143, 0.7215686, 0, 1, 1,
0.7428409, 2.49681, 1.182265, 0.7294118, 0, 1, 1,
0.7438403, 0.6851901, 1.459694, 0.7333333, 0, 1, 1,
0.7484663, -0.8534234, 1.477682, 0.7411765, 0, 1, 1,
0.7599482, 0.8234437, 0.9909053, 0.7450981, 0, 1, 1,
0.7610691, -0.8274674, 2.083105, 0.7529412, 0, 1, 1,
0.7670276, -0.6489537, 0.5383534, 0.7568628, 0, 1, 1,
0.7754452, 0.6068657, 0.00390095, 0.7647059, 0, 1, 1,
0.7799618, -0.3231923, 1.51792, 0.7686275, 0, 1, 1,
0.7925116, 0.6325829, 0.4168132, 0.7764706, 0, 1, 1,
0.7927113, 0.216753, 1.98665, 0.7803922, 0, 1, 1,
0.7956982, -0.6645404, 1.907998, 0.7882353, 0, 1, 1,
0.7969877, 0.09697255, 0.7615738, 0.7921569, 0, 1, 1,
0.7996094, 0.7392855, -0.3386202, 0.8, 0, 1, 1,
0.8013953, 0.7250003, 2.081136, 0.8078431, 0, 1, 1,
0.8026611, -0.1187326, 3.310547, 0.8117647, 0, 1, 1,
0.8090786, -0.6901332, 1.796701, 0.8196079, 0, 1, 1,
0.8125989, -0.4725144, 2.247052, 0.8235294, 0, 1, 1,
0.8142061, -0.02752551, 3.512322, 0.8313726, 0, 1, 1,
0.8164961, 1.321714, -0.386465, 0.8352941, 0, 1, 1,
0.8241974, 0.2211866, 1.732636, 0.8431373, 0, 1, 1,
0.8253816, -0.2351315, 2.097959, 0.8470588, 0, 1, 1,
0.832777, -1.18588, 1.924143, 0.854902, 0, 1, 1,
0.8360915, 0.8571689, 1.432538, 0.8588235, 0, 1, 1,
0.8374082, -0.02158499, 2.083734, 0.8666667, 0, 1, 1,
0.8384358, -0.7003828, 3.602681, 0.8705882, 0, 1, 1,
0.8418353, -0.3078262, 2.51881, 0.8784314, 0, 1, 1,
0.8556888, -0.3774456, 1.477238, 0.8823529, 0, 1, 1,
0.8656324, -0.06157717, 0.9622936, 0.8901961, 0, 1, 1,
0.8658882, -0.3505813, 2.397276, 0.8941177, 0, 1, 1,
0.8667598, -1.207159, 4.614876, 0.9019608, 0, 1, 1,
0.8682024, 1.674779, 0.6943417, 0.9098039, 0, 1, 1,
0.8697193, -0.2285362, 0.7360834, 0.9137255, 0, 1, 1,
0.870463, 0.3117977, 1.133018, 0.9215686, 0, 1, 1,
0.8730894, 0.3219573, 1.807802, 0.9254902, 0, 1, 1,
0.8804787, 0.2153957, 1.183108, 0.9333333, 0, 1, 1,
0.8831913, -0.0845236, 2.137881, 0.9372549, 0, 1, 1,
0.8944989, 0.2940007, 1.682063, 0.945098, 0, 1, 1,
0.8950188, 1.102636, 0.9743392, 0.9490196, 0, 1, 1,
0.9073949, 0.2161794, 1.294268, 0.9568627, 0, 1, 1,
0.9082119, 0.3673224, 2.184354, 0.9607843, 0, 1, 1,
0.9088765, -0.3155934, 3.3244, 0.9686275, 0, 1, 1,
0.9118134, 0.02609145, 0.9555529, 0.972549, 0, 1, 1,
0.9155461, -1.274106, 2.039832, 0.9803922, 0, 1, 1,
0.9183789, -0.9202771, 2.997586, 0.9843137, 0, 1, 1,
0.9194498, -0.05598619, 1.585061, 0.9921569, 0, 1, 1,
0.9233065, -0.1923971, 1.341696, 0.9960784, 0, 1, 1,
0.9290996, -0.710691, 2.715248, 1, 0, 0.9960784, 1,
0.9318528, -0.3393477, 1.420175, 1, 0, 0.9882353, 1,
0.9421468, 1.158044, 0.09257124, 1, 0, 0.9843137, 1,
0.9481259, 1.900032, 0.5892125, 1, 0, 0.9764706, 1,
0.9496131, -1.268314, 4.677004, 1, 0, 0.972549, 1,
0.9504359, 2.771102, 0.3014666, 1, 0, 0.9647059, 1,
0.9575609, -0.138719, 2.805919, 1, 0, 0.9607843, 1,
0.9579873, 0.9082855, 1.406994, 1, 0, 0.9529412, 1,
0.9595841, -0.9590617, 1.000861, 1, 0, 0.9490196, 1,
0.9602183, -0.6775973, 2.144199, 1, 0, 0.9411765, 1,
0.9686705, -0.01844278, 0.7947938, 1, 0, 0.9372549, 1,
0.9781309, -0.2672185, 3.901003, 1, 0, 0.9294118, 1,
0.9851204, 2.431302, -1.600968, 1, 0, 0.9254902, 1,
0.9896131, 0.3336183, 2.450383, 1, 0, 0.9176471, 1,
0.9942091, 1.579012, 1.191667, 1, 0, 0.9137255, 1,
1.007288, -0.4581215, 2.566404, 1, 0, 0.9058824, 1,
1.016828, -0.3929662, 2.596623, 1, 0, 0.9019608, 1,
1.016933, 2.490826, 1.725928, 1, 0, 0.8941177, 1,
1.0183, -2.051908, 0.6013718, 1, 0, 0.8862745, 1,
1.02026, 0.0422598, 2.297206, 1, 0, 0.8823529, 1,
1.024695, -0.4350002, 3.576768, 1, 0, 0.8745098, 1,
1.033208, -0.9956231, 2.275243, 1, 0, 0.8705882, 1,
1.048756, -0.2223665, 0.6114852, 1, 0, 0.8627451, 1,
1.04996, -0.05228892, 1.089955, 1, 0, 0.8588235, 1,
1.050968, 0.0295812, 1.630342, 1, 0, 0.8509804, 1,
1.056632, -0.9354942, -0.1359381, 1, 0, 0.8470588, 1,
1.064005, 0.5871897, -0.3602743, 1, 0, 0.8392157, 1,
1.068417, 0.3022155, 1.040979, 1, 0, 0.8352941, 1,
1.082656, -0.6399164, 1.062333, 1, 0, 0.827451, 1,
1.091043, -1.369522, 0.628525, 1, 0, 0.8235294, 1,
1.09806, 0.2085895, 3.071115, 1, 0, 0.8156863, 1,
1.099599, 1.0984, 0.6269993, 1, 0, 0.8117647, 1,
1.103479, -0.1522021, 2.399402, 1, 0, 0.8039216, 1,
1.1129, -0.4086977, 3.01169, 1, 0, 0.7960784, 1,
1.114026, -0.6752663, 2.103339, 1, 0, 0.7921569, 1,
1.126141, 0.694232, -0.1188845, 1, 0, 0.7843137, 1,
1.127096, -1.143971, 1.849408, 1, 0, 0.7803922, 1,
1.142453, 0.2380973, 2.802703, 1, 0, 0.772549, 1,
1.148865, -0.1307579, 2.882254, 1, 0, 0.7686275, 1,
1.150654, 0.5202461, 0.474803, 1, 0, 0.7607843, 1,
1.155676, -0.8400735, 2.148695, 1, 0, 0.7568628, 1,
1.162392, -1.286972, 2.13196, 1, 0, 0.7490196, 1,
1.163843, 1.159711, 0.7740985, 1, 0, 0.7450981, 1,
1.172949, -1.844341, 2.786614, 1, 0, 0.7372549, 1,
1.185896, -0.4693162, 0.8603526, 1, 0, 0.7333333, 1,
1.191468, -0.2387599, 2.515505, 1, 0, 0.7254902, 1,
1.191952, -0.477371, 1.043597, 1, 0, 0.7215686, 1,
1.193104, -0.04201197, 1.633062, 1, 0, 0.7137255, 1,
1.203523, -0.8396029, 2.874979, 1, 0, 0.7098039, 1,
1.205773, 0.7833652, 0.9955465, 1, 0, 0.7019608, 1,
1.206542, 1.495703, 0.2014294, 1, 0, 0.6941177, 1,
1.222682, -0.3591518, 0.565655, 1, 0, 0.6901961, 1,
1.232429, -0.009928723, 1.247296, 1, 0, 0.682353, 1,
1.233203, 1.123604, 0.0985735, 1, 0, 0.6784314, 1,
1.238983, -1.463443, 0.9645261, 1, 0, 0.6705883, 1,
1.239359, 0.2544735, 2.271089, 1, 0, 0.6666667, 1,
1.243956, 1.28581, 1.966723, 1, 0, 0.6588235, 1,
1.254833, -1.060488, 1.554376, 1, 0, 0.654902, 1,
1.2597, -0.4956306, 1.704158, 1, 0, 0.6470588, 1,
1.266621, 0.4941896, 1.148362, 1, 0, 0.6431373, 1,
1.272506, -1.600304, 3.35675, 1, 0, 0.6352941, 1,
1.278508, -0.3422402, 2.741901, 1, 0, 0.6313726, 1,
1.282619, -0.9880909, 2.165962, 1, 0, 0.6235294, 1,
1.286895, -1.156607, 2.556547, 1, 0, 0.6196079, 1,
1.295232, -0.3410856, 0.627811, 1, 0, 0.6117647, 1,
1.295503, -0.6321476, 2.138257, 1, 0, 0.6078432, 1,
1.304638, -0.1275057, 2.768938, 1, 0, 0.6, 1,
1.305719, 0.5533466, 2.163865, 1, 0, 0.5921569, 1,
1.311554, 2.049205, 0.1723823, 1, 0, 0.5882353, 1,
1.313724, -0.5026299, 3.690082, 1, 0, 0.5803922, 1,
1.316126, 0.1744229, 1.552365, 1, 0, 0.5764706, 1,
1.32403, 1.82584, 0.0754862, 1, 0, 0.5686275, 1,
1.330343, 0.08132237, 0.8048027, 1, 0, 0.5647059, 1,
1.334936, -0.6230061, 2.584197, 1, 0, 0.5568628, 1,
1.342974, 0.237543, 1.594092, 1, 0, 0.5529412, 1,
1.347405, -1.405517, 2.781792, 1, 0, 0.5450981, 1,
1.356826, 0.1845924, 3.155453, 1, 0, 0.5411765, 1,
1.373031, 2.644245, -0.2298145, 1, 0, 0.5333334, 1,
1.385326, 0.7960613, 0.1055789, 1, 0, 0.5294118, 1,
1.392191, -0.6800883, 2.595118, 1, 0, 0.5215687, 1,
1.395482, 0.9281167, 0.6939192, 1, 0, 0.5176471, 1,
1.403802, -1.672758, 2.219185, 1, 0, 0.509804, 1,
1.404657, -1.073985, 1.766507, 1, 0, 0.5058824, 1,
1.417421, 1.621055, 1.608886, 1, 0, 0.4980392, 1,
1.420928, 0.494834, 2.452259, 1, 0, 0.4901961, 1,
1.430431, 0.2119248, 1.642811, 1, 0, 0.4862745, 1,
1.434747, -0.7160602, 3.616019, 1, 0, 0.4784314, 1,
1.43503, 0.5300402, -1.147802, 1, 0, 0.4745098, 1,
1.440991, 1.956706, 2.403961, 1, 0, 0.4666667, 1,
1.444031, 0.05593815, 2.58135, 1, 0, 0.4627451, 1,
1.444895, -0.5239314, 3.910742, 1, 0, 0.454902, 1,
1.451843, 1.160915, 2.087237, 1, 0, 0.4509804, 1,
1.454656, 0.9442999, 1.447406, 1, 0, 0.4431373, 1,
1.468264, 0.8473713, 3.701018, 1, 0, 0.4392157, 1,
1.47821, -0.645815, 1.52642, 1, 0, 0.4313726, 1,
1.492114, 0.9881167, 0.5736081, 1, 0, 0.427451, 1,
1.494367, 0.2636018, 1.905932, 1, 0, 0.4196078, 1,
1.498031, -0.6159686, 0.6866741, 1, 0, 0.4156863, 1,
1.498921, -0.584883, 1.733422, 1, 0, 0.4078431, 1,
1.517039, 0.4758294, 2.24708, 1, 0, 0.4039216, 1,
1.542482, 0.196585, 2.047624, 1, 0, 0.3960784, 1,
1.544719, -0.1957728, 2.517936, 1, 0, 0.3882353, 1,
1.559846, 0.02394471, 1.676104, 1, 0, 0.3843137, 1,
1.570588, 0.3712173, 0.3613965, 1, 0, 0.3764706, 1,
1.574807, 1.643902, 0.2394564, 1, 0, 0.372549, 1,
1.575857, 0.9018047, 1.144788, 1, 0, 0.3647059, 1,
1.580522, 0.9734083, 0.3099703, 1, 0, 0.3607843, 1,
1.58979, -1.106823, 2.036919, 1, 0, 0.3529412, 1,
1.598964, -0.5487791, 0.7273068, 1, 0, 0.3490196, 1,
1.603007, -0.5606041, 1.535323, 1, 0, 0.3411765, 1,
1.606518, 2.123027, 0.194277, 1, 0, 0.3372549, 1,
1.608174, -0.381721, 2.659957, 1, 0, 0.3294118, 1,
1.614046, -0.6600978, 1.639439, 1, 0, 0.3254902, 1,
1.614653, 0.2633904, 3.115693, 1, 0, 0.3176471, 1,
1.624967, 1.664696, -1.432971, 1, 0, 0.3137255, 1,
1.625713, 0.5341591, 1.88124, 1, 0, 0.3058824, 1,
1.632557, -1.476182, 2.677971, 1, 0, 0.2980392, 1,
1.633202, -0.2135383, 2.687159, 1, 0, 0.2941177, 1,
1.649433, 0.04922147, 1.298705, 1, 0, 0.2862745, 1,
1.649434, -0.004208439, 2.540477, 1, 0, 0.282353, 1,
1.649823, 0.2972128, 2.177431, 1, 0, 0.2745098, 1,
1.690873, 1.529678, 1.180323, 1, 0, 0.2705882, 1,
1.712037, 0.7367248, 1.507139, 1, 0, 0.2627451, 1,
1.716545, 1.285815, 0.2027306, 1, 0, 0.2588235, 1,
1.721676, 1.812974, 1.835565, 1, 0, 0.2509804, 1,
1.731117, -0.6263302, 2.561345, 1, 0, 0.2470588, 1,
1.738724, 0.73224, 2.37638, 1, 0, 0.2392157, 1,
1.741225, 0.6620068, 0.1164611, 1, 0, 0.2352941, 1,
1.754276, 0.9928686, 2.688882, 1, 0, 0.227451, 1,
1.759386, -0.03386054, 0.544276, 1, 0, 0.2235294, 1,
1.789973, 2.235312, 0.344363, 1, 0, 0.2156863, 1,
1.801855, -2.063431, 1.785188, 1, 0, 0.2117647, 1,
1.81056, -0.5659866, 2.942679, 1, 0, 0.2039216, 1,
1.811216, -0.6600285, 2.464396, 1, 0, 0.1960784, 1,
1.816001, 1.047948, 1.887854, 1, 0, 0.1921569, 1,
1.822314, -0.5845119, 0.8191853, 1, 0, 0.1843137, 1,
1.834436, 0.1540981, 2.10058, 1, 0, 0.1803922, 1,
1.83564, -0.6262288, 1.064752, 1, 0, 0.172549, 1,
1.873411, -0.1212716, 2.052126, 1, 0, 0.1686275, 1,
1.878434, -0.07406153, 1.441037, 1, 0, 0.1607843, 1,
1.894656, 0.001121568, 2.545097, 1, 0, 0.1568628, 1,
1.913384, 0.08941846, 3.123781, 1, 0, 0.1490196, 1,
1.927175, -0.8424627, 0.5631839, 1, 0, 0.145098, 1,
1.9448, 0.3144583, 0.1779897, 1, 0, 0.1372549, 1,
1.955411, 1.448083, 0.7855951, 1, 0, 0.1333333, 1,
1.968613, -0.355477, 1.176246, 1, 0, 0.1254902, 1,
1.969978, 2.160011, 0.7168967, 1, 0, 0.1215686, 1,
1.973414, -0.605141, 2.333833, 1, 0, 0.1137255, 1,
1.975364, 1.587571, 1.201947, 1, 0, 0.1098039, 1,
1.99553, 1.245071, 2.212816, 1, 0, 0.1019608, 1,
2.029349, 1.114684, 1.552104, 1, 0, 0.09411765, 1,
2.034576, -0.491277, 4.053809, 1, 0, 0.09019608, 1,
2.036889, 0.3102272, 1.896838, 1, 0, 0.08235294, 1,
2.078434, 2.032557, 1.458993, 1, 0, 0.07843138, 1,
2.080282, -0.8034908, 0.554163, 1, 0, 0.07058824, 1,
2.11887, 0.9600363, 1.179621, 1, 0, 0.06666667, 1,
2.191164, -0.1493037, 1.786538, 1, 0, 0.05882353, 1,
2.217704, 2.61487, -0.4394197, 1, 0, 0.05490196, 1,
2.251538, -1.006714, 3.724256, 1, 0, 0.04705882, 1,
2.264806, -1.68887, 2.785587, 1, 0, 0.04313726, 1,
2.28024, -0.8601247, 3.100041, 1, 0, 0.03529412, 1,
2.402411, -0.4693824, 2.729303, 1, 0, 0.03137255, 1,
2.464748, -0.5615667, 2.357949, 1, 0, 0.02352941, 1,
2.890274, 0.3022883, 2.295873, 1, 0, 0.01960784, 1,
2.952955, -0.5070384, 4.055348, 1, 0, 0.01176471, 1,
3.200963, -0.1955784, 1.613697, 1, 0, 0.007843138, 1
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
0.02397811, -4.261007, -7.571136, 0, -0.5, 0.5, 0.5,
0.02397811, -4.261007, -7.571136, 1, -0.5, 0.5, 0.5,
0.02397811, -4.261007, -7.571136, 1, 1.5, 0.5, 0.5,
0.02397811, -4.261007, -7.571136, 0, 1.5, 0.5, 0.5
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
-4.230005, -0.2353574, -7.571136, 0, -0.5, 0.5, 0.5,
-4.230005, -0.2353574, -7.571136, 1, -0.5, 0.5, 0.5,
-4.230005, -0.2353574, -7.571136, 1, 1.5, 0.5, 0.5,
-4.230005, -0.2353574, -7.571136, 0, 1.5, 0.5, 0.5
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
-4.230005, -4.261007, -0.04875374, 0, -0.5, 0.5, 0.5,
-4.230005, -4.261007, -0.04875374, 1, -0.5, 0.5, 0.5,
-4.230005, -4.261007, -0.04875374, 1, 1.5, 0.5, 0.5,
-4.230005, -4.261007, -0.04875374, 0, 1.5, 0.5, 0.5
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
-3, -3.332011, -5.835202,
3, -3.332011, -5.835202,
-3, -3.332011, -5.835202,
-3, -3.486844, -6.124524,
-2, -3.332011, -5.835202,
-2, -3.486844, -6.124524,
-1, -3.332011, -5.835202,
-1, -3.486844, -6.124524,
0, -3.332011, -5.835202,
0, -3.486844, -6.124524,
1, -3.332011, -5.835202,
1, -3.486844, -6.124524,
2, -3.332011, -5.835202,
2, -3.486844, -6.124524,
3, -3.332011, -5.835202,
3, -3.486844, -6.124524
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
-3, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
-3, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
-3, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
-3, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
-2, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
-2, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
-2, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
-2, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
-1, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
-1, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
-1, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
-1, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
0, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
0, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
0, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
0, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
1, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
1, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
1, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
1, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
2, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
2, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
2, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
2, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5,
3, -3.796509, -6.703169, 0, -0.5, 0.5, 0.5,
3, -3.796509, -6.703169, 1, -0.5, 0.5, 0.5,
3, -3.796509, -6.703169, 1, 1.5, 0.5, 0.5,
3, -3.796509, -6.703169, 0, 1.5, 0.5, 0.5
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
-3.248317, -3, -5.835202,
-3.248317, 2, -5.835202,
-3.248317, -3, -5.835202,
-3.411932, -3, -6.124524,
-3.248317, -2, -5.835202,
-3.411932, -2, -6.124524,
-3.248317, -1, -5.835202,
-3.411932, -1, -6.124524,
-3.248317, 0, -5.835202,
-3.411932, 0, -6.124524,
-3.248317, 1, -5.835202,
-3.411932, 1, -6.124524,
-3.248317, 2, -5.835202,
-3.411932, 2, -6.124524
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
-3.739161, -3, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, -3, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, -3, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, -3, -6.703169, 0, 1.5, 0.5, 0.5,
-3.739161, -2, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, -2, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, -2, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, -2, -6.703169, 0, 1.5, 0.5, 0.5,
-3.739161, -1, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, -1, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, -1, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, -1, -6.703169, 0, 1.5, 0.5, 0.5,
-3.739161, 0, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, 0, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, 0, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, 0, -6.703169, 0, 1.5, 0.5, 0.5,
-3.739161, 1, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, 1, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, 1, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, 1, -6.703169, 0, 1.5, 0.5, 0.5,
-3.739161, 2, -6.703169, 0, -0.5, 0.5, 0.5,
-3.739161, 2, -6.703169, 1, -0.5, 0.5, 0.5,
-3.739161, 2, -6.703169, 1, 1.5, 0.5, 0.5,
-3.739161, 2, -6.703169, 0, 1.5, 0.5, 0.5
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
-3.248317, -3.332011, -4,
-3.248317, -3.332011, 4,
-3.248317, -3.332011, -4,
-3.411932, -3.486844, -4,
-3.248317, -3.332011, -2,
-3.411932, -3.486844, -2,
-3.248317, -3.332011, 0,
-3.411932, -3.486844, 0,
-3.248317, -3.332011, 2,
-3.411932, -3.486844, 2,
-3.248317, -3.332011, 4,
-3.411932, -3.486844, 4
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
-3.739161, -3.796509, -4, 0, -0.5, 0.5, 0.5,
-3.739161, -3.796509, -4, 1, -0.5, 0.5, 0.5,
-3.739161, -3.796509, -4, 1, 1.5, 0.5, 0.5,
-3.739161, -3.796509, -4, 0, 1.5, 0.5, 0.5,
-3.739161, -3.796509, -2, 0, -0.5, 0.5, 0.5,
-3.739161, -3.796509, -2, 1, -0.5, 0.5, 0.5,
-3.739161, -3.796509, -2, 1, 1.5, 0.5, 0.5,
-3.739161, -3.796509, -2, 0, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 0, 0, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 0, 1, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 0, 1, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 0, 0, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 2, 0, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 2, 1, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 2, 1, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 2, 0, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 4, 0, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 4, 1, -0.5, 0.5, 0.5,
-3.739161, -3.796509, 4, 1, 1.5, 0.5, 0.5,
-3.739161, -3.796509, 4, 0, 1.5, 0.5, 0.5
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
-3.248317, -3.332011, -5.835202,
-3.248317, 2.861296, -5.835202,
-3.248317, -3.332011, 5.737694,
-3.248317, 2.861296, 5.737694,
-3.248317, -3.332011, -5.835202,
-3.248317, -3.332011, 5.737694,
-3.248317, 2.861296, -5.835202,
-3.248317, 2.861296, 5.737694,
-3.248317, -3.332011, -5.835202,
3.296273, -3.332011, -5.835202,
-3.248317, -3.332011, 5.737694,
3.296273, -3.332011, 5.737694,
-3.248317, 2.861296, -5.835202,
3.296273, 2.861296, -5.835202,
-3.248317, 2.861296, 5.737694,
3.296273, 2.861296, 5.737694,
3.296273, -3.332011, -5.835202,
3.296273, 2.861296, -5.835202,
3.296273, -3.332011, 5.737694,
3.296273, 2.861296, 5.737694,
3.296273, -3.332011, -5.835202,
3.296273, -3.332011, 5.737694,
3.296273, 2.861296, -5.835202,
3.296273, 2.861296, 5.737694
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
var radius = 7.831889;
var distance = 34.84496;
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
mvMatrix.translate( -0.02397811, 0.2353574, 0.04875374 );
mvMatrix.scale( 1.293892, 1.367281, 0.7317089 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84496);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-Chlorbutan<-read.table("1-Chlorbutan.xyz")
```

```
## Error in read.table("1-Chlorbutan.xyz"): no lines available in input
```

```r
x<-1-Chlorbutan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbutan' not found
```

```r
y<-1-Chlorbutan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbutan' not found
```

```r
z<-1-Chlorbutan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbutan' not found
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
-3.153007, 2.048636, -0.5529507, 0, 0, 1, 1, 1,
-3.145908, 1.056677, -1.144323, 1, 0, 0, 1, 1,
-2.849315, -1.03911, -2.258285, 1, 0, 0, 1, 1,
-2.829616, 1.257081, -2.596287, 1, 0, 0, 1, 1,
-2.817058, 0.8441797, -1.518707, 1, 0, 0, 1, 1,
-2.759575, -0.3091641, -1.150577, 1, 0, 0, 1, 1,
-2.759438, -0.323007, -1.252017, 0, 0, 0, 1, 1,
-2.758942, -0.3390701, -2.278866, 0, 0, 0, 1, 1,
-2.757027, -0.2982464, -3.610256, 0, 0, 0, 1, 1,
-2.727176, -0.5889737, -2.192753, 0, 0, 0, 1, 1,
-2.670677, -0.1190757, -0.6424211, 0, 0, 0, 1, 1,
-2.62552, -0.1142479, -1.578654, 0, 0, 0, 1, 1,
-2.412569, 0.4370849, -2.200309, 0, 0, 0, 1, 1,
-2.377742, -0.5997722, -2.044655, 1, 1, 1, 1, 1,
-2.349901, -0.7935285, -0.5674105, 1, 1, 1, 1, 1,
-2.34467, -0.873129, -2.656885, 1, 1, 1, 1, 1,
-2.331953, 0.843327, -1.742605, 1, 1, 1, 1, 1,
-2.325695, 1.621424, 1.127901, 1, 1, 1, 1, 1,
-2.176097, -0.0562982, -2.013874, 1, 1, 1, 1, 1,
-2.174596, -2.227568, -1.710811, 1, 1, 1, 1, 1,
-2.087291, 0.8247995, 0.4738517, 1, 1, 1, 1, 1,
-2.065087, 1.003398, -2.921536, 1, 1, 1, 1, 1,
-2.064573, -1.195997, -1.956897, 1, 1, 1, 1, 1,
-2.031681, -2.169239, -2.378924, 1, 1, 1, 1, 1,
-1.996145, 1.564489, -1.765726, 1, 1, 1, 1, 1,
-1.981821, 0.1366043, -1.585862, 1, 1, 1, 1, 1,
-1.968632, -1.12048, -0.2042308, 1, 1, 1, 1, 1,
-1.951413, 0.2718787, -1.791608, 1, 1, 1, 1, 1,
-1.91417, -0.0869749, -0.4135792, 0, 0, 1, 1, 1,
-1.912624, 0.2731548, 0.2068109, 1, 0, 0, 1, 1,
-1.911068, 0.08738671, -2.081207, 1, 0, 0, 1, 1,
-1.895003, -0.6069877, -0.203808, 1, 0, 0, 1, 1,
-1.873066, -0.9452954, -2.683094, 1, 0, 0, 1, 1,
-1.865502, -0.08629923, -1.486632, 1, 0, 0, 1, 1,
-1.856492, -0.1631154, -1.313202, 0, 0, 0, 1, 1,
-1.828817, -0.04787201, -0.7828829, 0, 0, 0, 1, 1,
-1.783116, 1.184359, -0.24911, 0, 0, 0, 1, 1,
-1.766317, 0.3259997, -1.558395, 0, 0, 0, 1, 1,
-1.758982, 1.172305, -2.012946, 0, 0, 0, 1, 1,
-1.746191, 0.3934519, -2.092241, 0, 0, 0, 1, 1,
-1.745332, 0.05778724, -2.057011, 0, 0, 0, 1, 1,
-1.745087, 0.5194939, 0.07633399, 1, 1, 1, 1, 1,
-1.719192, 0.05600404, -2.194057, 1, 1, 1, 1, 1,
-1.713805, 0.2721706, -0.5930237, 1, 1, 1, 1, 1,
-1.709166, -0.3042559, -1.962547, 1, 1, 1, 1, 1,
-1.707305, 0.4150109, -0.203502, 1, 1, 1, 1, 1,
-1.701101, 0.2977028, 0.003837087, 1, 1, 1, 1, 1,
-1.697629, 1.109435, -2.869383, 1, 1, 1, 1, 1,
-1.694267, 0.9434514, 1.353027, 1, 1, 1, 1, 1,
-1.672359, -0.4875296, -0.9751597, 1, 1, 1, 1, 1,
-1.658628, -1.287352, -2.871948, 1, 1, 1, 1, 1,
-1.65678, -0.1541695, -0.3166565, 1, 1, 1, 1, 1,
-1.655008, 0.5870948, 0.5162191, 1, 1, 1, 1, 1,
-1.642278, 0.03382762, -1.536316, 1, 1, 1, 1, 1,
-1.634155, -0.2636432, -2.471322, 1, 1, 1, 1, 1,
-1.632932, -2.092556, -1.178092, 1, 1, 1, 1, 1,
-1.626141, -0.01541146, -2.733102, 0, 0, 1, 1, 1,
-1.608116, 0.5672818, -0.6219777, 1, 0, 0, 1, 1,
-1.594235, -0.6067058, -3.711135, 1, 0, 0, 1, 1,
-1.576101, 1.315925, -1.367467, 1, 0, 0, 1, 1,
-1.556804, 0.02245804, -1.92935, 1, 0, 0, 1, 1,
-1.555417, 0.3960632, -2.807543, 1, 0, 0, 1, 1,
-1.536663, -0.2284829, -2.690182, 0, 0, 0, 1, 1,
-1.536513, -0.6509126, -4.930445, 0, 0, 0, 1, 1,
-1.532396, -0.398693, -0.08458457, 0, 0, 0, 1, 1,
-1.5224, -0.583293, -0.9738655, 0, 0, 0, 1, 1,
-1.513755, 1.180585, 0.5431637, 0, 0, 0, 1, 1,
-1.512086, 0.632484, -2.09895, 0, 0, 0, 1, 1,
-1.509186, 0.646358, -2.003574, 0, 0, 0, 1, 1,
-1.505632, -0.8286301, -0.8738418, 1, 1, 1, 1, 1,
-1.499869, 0.5925062, -1.16752, 1, 1, 1, 1, 1,
-1.491791, -0.02905614, -1.737361, 1, 1, 1, 1, 1,
-1.480569, 0.7928455, -1.172849, 1, 1, 1, 1, 1,
-1.45609, 0.7895646, -2.202553, 1, 1, 1, 1, 1,
-1.449475, 0.2636438, -2.439214, 1, 1, 1, 1, 1,
-1.433777, 1.635581, -1.06635, 1, 1, 1, 1, 1,
-1.433627, -0.6079636, -4.382565, 1, 1, 1, 1, 1,
-1.430625, 0.9163339, -0.9950029, 1, 1, 1, 1, 1,
-1.419415, 1.053995, -0.8677059, 1, 1, 1, 1, 1,
-1.396783, -0.7506756, -2.110293, 1, 1, 1, 1, 1,
-1.388751, -0.4958532, -0.9457104, 1, 1, 1, 1, 1,
-1.381582, 2.273703, 0.6468101, 1, 1, 1, 1, 1,
-1.370077, 0.8477327, -1.545198, 1, 1, 1, 1, 1,
-1.359386, 0.009015392, -2.815537, 1, 1, 1, 1, 1,
-1.354617, -0.5299542, -1.8308, 0, 0, 1, 1, 1,
-1.352143, -0.5123922, -0.6463677, 1, 0, 0, 1, 1,
-1.348403, -1.124789, -3.434767, 1, 0, 0, 1, 1,
-1.339613, -1.040657, -0.576772, 1, 0, 0, 1, 1,
-1.331926, -1.278247, -1.398215, 1, 0, 0, 1, 1,
-1.327602, -2.331732, -2.67927, 1, 0, 0, 1, 1,
-1.32637, -0.4987975, -1.480798, 0, 0, 0, 1, 1,
-1.323781, 0.05960633, -1.065646, 0, 0, 0, 1, 1,
-1.311808, -0.6330341, -0.4005268, 0, 0, 0, 1, 1,
-1.311588, 1.439847, -0.2074472, 0, 0, 0, 1, 1,
-1.311339, -1.57365, -2.251532, 0, 0, 0, 1, 1,
-1.306451, 0.1496868, -0.6506948, 0, 0, 0, 1, 1,
-1.304948, -0.4065021, -2.445988, 0, 0, 0, 1, 1,
-1.299204, -0.4148526, -1.211818, 1, 1, 1, 1, 1,
-1.292242, -0.2552931, -1.722845, 1, 1, 1, 1, 1,
-1.287354, -0.2145234, -1.05134, 1, 1, 1, 1, 1,
-1.279756, -1.226552, 0.3925817, 1, 1, 1, 1, 1,
-1.273576, 1.53641, -0.7990688, 1, 1, 1, 1, 1,
-1.273367, 0.138772, -1.729751, 1, 1, 1, 1, 1,
-1.263213, 1.731153, -0.2725534, 1, 1, 1, 1, 1,
-1.261477, 0.9891337, -1.499433, 1, 1, 1, 1, 1,
-1.257532, -0.3126546, -2.139971, 1, 1, 1, 1, 1,
-1.256418, 1.04532, -3.130099, 1, 1, 1, 1, 1,
-1.250799, -1.969414, -1.421192, 1, 1, 1, 1, 1,
-1.236876, -0.8876783, -2.1297, 1, 1, 1, 1, 1,
-1.220763, 0.5891524, -0.3609285, 1, 1, 1, 1, 1,
-1.210115, -0.7003779, -3.460094, 1, 1, 1, 1, 1,
-1.206296, 0.7530977, -1.059317, 1, 1, 1, 1, 1,
-1.197785, 0.9684727, -0.5518113, 0, 0, 1, 1, 1,
-1.195976, 0.05612941, -2.242508, 1, 0, 0, 1, 1,
-1.192568, -0.3383237, -0.9760189, 1, 0, 0, 1, 1,
-1.186219, 0.5743362, -1.158243, 1, 0, 0, 1, 1,
-1.185197, -1.844563, -2.60599, 1, 0, 0, 1, 1,
-1.178997, 0.2445834, -1.55842, 1, 0, 0, 1, 1,
-1.173907, -0.2449703, -0.00839675, 0, 0, 0, 1, 1,
-1.161008, -0.9164497, -2.483804, 0, 0, 0, 1, 1,
-1.156966, 0.458951, -2.210315, 0, 0, 0, 1, 1,
-1.15593, 0.9413282, -1.262907, 0, 0, 0, 1, 1,
-1.141973, -1.61128, -1.207935, 0, 0, 0, 1, 1,
-1.141861, -0.08925508, -0.9339266, 0, 0, 0, 1, 1,
-1.135739, 0.5394224, -1.13105, 0, 0, 0, 1, 1,
-1.132143, -0.5571355, -2.259569, 1, 1, 1, 1, 1,
-1.129064, -1.074699, -2.47989, 1, 1, 1, 1, 1,
-1.128993, -0.1855294, -2.024811, 1, 1, 1, 1, 1,
-1.119178, -0.7629029, -2.580586, 1, 1, 1, 1, 1,
-1.116611, 0.3273298, -1.668974, 1, 1, 1, 1, 1,
-1.116351, 1.273028, -1.102594, 1, 1, 1, 1, 1,
-1.115147, -0.5160879, -1.594721, 1, 1, 1, 1, 1,
-1.113661, 2.040692, -0.9885471, 1, 1, 1, 1, 1,
-1.111762, 0.4433265, -1.252965, 1, 1, 1, 1, 1,
-1.111213, -2.326125, -3.291978, 1, 1, 1, 1, 1,
-1.10148, 0.325372, -0.1492468, 1, 1, 1, 1, 1,
-1.097324, 0.662067, -0.8958519, 1, 1, 1, 1, 1,
-1.091419, 0.8907424, -1.21549, 1, 1, 1, 1, 1,
-1.087184, 0.1633773, -2.08845, 1, 1, 1, 1, 1,
-1.084067, -0.5873101, -1.526332, 1, 1, 1, 1, 1,
-1.082781, -0.6394151, -1.263512, 0, 0, 1, 1, 1,
-1.082329, -1.936741, -2.458831, 1, 0, 0, 1, 1,
-1.077064, 0.06149594, 0.2435987, 1, 0, 0, 1, 1,
-1.073552, 0.4348764, -0.7082481, 1, 0, 0, 1, 1,
-1.073268, -0.1509051, -4.395244, 1, 0, 0, 1, 1,
-1.069149, 1.341397, -0.8169205, 1, 0, 0, 1, 1,
-1.066563, -1.153916, -1.767099, 0, 0, 0, 1, 1,
-1.062645, 0.04570799, -2.32143, 0, 0, 0, 1, 1,
-1.052065, 1.133754, 0.3126294, 0, 0, 0, 1, 1,
-1.04496, -0.5304639, -0.5409072, 0, 0, 0, 1, 1,
-1.044208, 0.265043, -1.404267, 0, 0, 0, 1, 1,
-1.042366, 0.485704, -0.2711626, 0, 0, 0, 1, 1,
-1.034709, 0.1143183, -0.1285899, 0, 0, 0, 1, 1,
-1.032103, -2.163826, -3.142937, 1, 1, 1, 1, 1,
-1.03049, -1.152865, -2.34597, 1, 1, 1, 1, 1,
-1.028058, -1.24869, -4.279119, 1, 1, 1, 1, 1,
-1.027747, -0.6665514, -2.023072, 1, 1, 1, 1, 1,
-1.026182, -0.09433062, 1.686344, 1, 1, 1, 1, 1,
-1.019844, 0.6420426, -2.243919, 1, 1, 1, 1, 1,
-1.017959, -1.164728, -0.934796, 1, 1, 1, 1, 1,
-1.011902, 1.102457, -2.233135, 1, 1, 1, 1, 1,
-1.010537, -1.080397, -1.775843, 1, 1, 1, 1, 1,
-1.006824, 0.9048448, -0.5564645, 1, 1, 1, 1, 1,
-1.006498, 0.4230624, -0.6848936, 1, 1, 1, 1, 1,
-1.000422, 0.6296982, 0.1153115, 1, 1, 1, 1, 1,
-0.9996849, -1.218849, -1.990257, 1, 1, 1, 1, 1,
-0.9967288, 0.05512705, -1.609137, 1, 1, 1, 1, 1,
-0.9933089, 1.151035, 2.522493, 1, 1, 1, 1, 1,
-0.9885786, -0.2628089, -1.851377, 0, 0, 1, 1, 1,
-0.9876976, -0.336408, -1.976404, 1, 0, 0, 1, 1,
-0.9843869, -1.239962, -2.290733, 1, 0, 0, 1, 1,
-0.9786412, -2.029487, -3.725815, 1, 0, 0, 1, 1,
-0.9753883, -1.020495, -1.661195, 1, 0, 0, 1, 1,
-0.9703386, 0.3685326, -1.915943, 1, 0, 0, 1, 1,
-0.9702908, 0.1688408, -2.28561, 0, 0, 0, 1, 1,
-0.9667757, 1.652362, 1.349235, 0, 0, 0, 1, 1,
-0.9646262, 1.034249, 0.9473507, 0, 0, 0, 1, 1,
-0.9513885, 0.1000014, -1.405595, 0, 0, 0, 1, 1,
-0.9471614, 2.524868, 0.131498, 0, 0, 0, 1, 1,
-0.9435843, -2.019069, -2.150968, 0, 0, 0, 1, 1,
-0.9430127, -2.205673, -1.405943, 0, 0, 0, 1, 1,
-0.9415972, 0.2390039, -1.159603, 1, 1, 1, 1, 1,
-0.9401774, -0.361964, -1.11232, 1, 1, 1, 1, 1,
-0.9285291, 1.741055, -2.320853, 1, 1, 1, 1, 1,
-0.9258054, -0.2670819, -1.020804, 1, 1, 1, 1, 1,
-0.9161074, -0.3184887, -1.444271, 1, 1, 1, 1, 1,
-0.9157555, 0.2507247, -1.302472, 1, 1, 1, 1, 1,
-0.9125732, -1.229945, -2.442342, 1, 1, 1, 1, 1,
-0.9070908, 1.055356, -0.8929886, 1, 1, 1, 1, 1,
-0.9033278, 1.473855, -1.695963, 1, 1, 1, 1, 1,
-0.8976177, 1.056773, -0.2766441, 1, 1, 1, 1, 1,
-0.8929821, -1.715133, -1.810662, 1, 1, 1, 1, 1,
-0.8908031, 0.7228662, -1.773138, 1, 1, 1, 1, 1,
-0.8900865, -0.5953215, -3.925072, 1, 1, 1, 1, 1,
-0.8870631, 0.7077919, -1.79246, 1, 1, 1, 1, 1,
-0.8769423, -0.5405797, -2.177857, 1, 1, 1, 1, 1,
-0.8758773, 0.9428775, -1.258118, 0, 0, 1, 1, 1,
-0.8746805, -1.410057, -2.004502, 1, 0, 0, 1, 1,
-0.8626096, 0.8704167, -1.580959, 1, 0, 0, 1, 1,
-0.858543, -1.048896, -1.897031, 1, 0, 0, 1, 1,
-0.8532156, 1.118657, -1.924293, 1, 0, 0, 1, 1,
-0.8505088, -0.2135608, -2.781734, 1, 0, 0, 1, 1,
-0.8481045, 0.1087109, -1.639122, 0, 0, 0, 1, 1,
-0.8466713, -1.548847, -2.621827, 0, 0, 0, 1, 1,
-0.8427804, 0.9303458, 0.5178878, 0, 0, 0, 1, 1,
-0.8327548, -0.3045865, -0.9839643, 0, 0, 0, 1, 1,
-0.8321648, 0.8827974, -1.361066, 0, 0, 0, 1, 1,
-0.8203353, -0.01884669, -1.682196, 0, 0, 0, 1, 1,
-0.8193194, -1.241828, -3.554678, 0, 0, 0, 1, 1,
-0.8144399, 1.113927, -1.868391, 1, 1, 1, 1, 1,
-0.8142412, 0.5726478, -1.525461, 1, 1, 1, 1, 1,
-0.8138247, -0.0855182, -2.119667, 1, 1, 1, 1, 1,
-0.8117448, 1.60252, -0.09807704, 1, 1, 1, 1, 1,
-0.8012817, 0.1430682, 0.7500467, 1, 1, 1, 1, 1,
-0.7994181, 1.019029, -1.417402, 1, 1, 1, 1, 1,
-0.7981933, 0.3097771, -0.2863761, 1, 1, 1, 1, 1,
-0.7957443, -0.5560176, -3.372788, 1, 1, 1, 1, 1,
-0.7955805, 0.4117043, -1.178168, 1, 1, 1, 1, 1,
-0.7826591, -0.704773, -2.568812, 1, 1, 1, 1, 1,
-0.7743064, -0.1146644, -0.5036312, 1, 1, 1, 1, 1,
-0.7697673, 1.346428, 0.7390525, 1, 1, 1, 1, 1,
-0.7673975, -0.6493268, -2.874779, 1, 1, 1, 1, 1,
-0.7641219, 1.311565, -1.116873, 1, 1, 1, 1, 1,
-0.7635193, -0.2200072, -0.3616915, 1, 1, 1, 1, 1,
-0.7612824, -0.6349943, -2.701984, 0, 0, 1, 1, 1,
-0.7603661, -1.176102, -4.222243, 1, 0, 0, 1, 1,
-0.7529893, 0.2525129, -0.5374261, 1, 0, 0, 1, 1,
-0.7496053, -1.45898, -2.569092, 1, 0, 0, 1, 1,
-0.7469288, -0.8360122, -2.019144, 1, 0, 0, 1, 1,
-0.7423623, -1.125486, -2.673613, 1, 0, 0, 1, 1,
-0.7412549, -0.79502, -2.964631, 0, 0, 0, 1, 1,
-0.7379082, -1.137349, -1.882522, 0, 0, 0, 1, 1,
-0.7375112, 0.003673148, 0.6976238, 0, 0, 0, 1, 1,
-0.7351414, -1.74412, -3.43747, 0, 0, 0, 1, 1,
-0.7327871, 0.3477347, -1.596527, 0, 0, 0, 1, 1,
-0.7316633, 0.07713164, -0.897234, 0, 0, 0, 1, 1,
-0.731498, 0.933021, 1.043401, 0, 0, 0, 1, 1,
-0.7299243, 0.7091472, -0.8446947, 1, 1, 1, 1, 1,
-0.7282734, -0.5118122, -4.327749, 1, 1, 1, 1, 1,
-0.7271559, -2.47913, -0.6806834, 1, 1, 1, 1, 1,
-0.7208009, 0.7750394, -1.67621, 1, 1, 1, 1, 1,
-0.7192876, 0.4860532, -0.4048275, 1, 1, 1, 1, 1,
-0.7106057, -0.5574014, -0.3732037, 1, 1, 1, 1, 1,
-0.7104344, -0.1809538, -2.318516, 1, 1, 1, 1, 1,
-0.7088916, -1.541045, -2.430181, 1, 1, 1, 1, 1,
-0.7069297, 0.5526601, 1.374578, 1, 1, 1, 1, 1,
-0.7063403, -0.2665125, -2.334446, 1, 1, 1, 1, 1,
-0.7039306, 0.3670961, -2.896981, 1, 1, 1, 1, 1,
-0.7036312, 0.3016696, -0.6945987, 1, 1, 1, 1, 1,
-0.702381, -0.7126768, -3.049195, 1, 1, 1, 1, 1,
-0.7005071, 0.9807503, -0.3498572, 1, 1, 1, 1, 1,
-0.7001113, 0.3674973, -2.819902, 1, 1, 1, 1, 1,
-0.6976864, -1.744019, -3.652878, 0, 0, 1, 1, 1,
-0.6973957, -1.371421, -2.761611, 1, 0, 0, 1, 1,
-0.691296, -1.389624, -3.240272, 1, 0, 0, 1, 1,
-0.6881981, -0.4752344, -3.448873, 1, 0, 0, 1, 1,
-0.6861958, 2.339218, -0.1352072, 1, 0, 0, 1, 1,
-0.6825421, -1.254393, -2.465308, 1, 0, 0, 1, 1,
-0.6821601, 0.295776, 1.119983, 0, 0, 0, 1, 1,
-0.6704131, 0.2054332, 0.3710403, 0, 0, 0, 1, 1,
-0.6676622, -1.629906, -2.920545, 0, 0, 0, 1, 1,
-0.6606034, 0.08408511, -0.4197816, 0, 0, 0, 1, 1,
-0.6592412, 1.209935, -1.771896, 0, 0, 0, 1, 1,
-0.6516258, -1.687784, -3.432283, 0, 0, 0, 1, 1,
-0.6476787, 0.7490028, -0.8883555, 0, 0, 0, 1, 1,
-0.6455786, 0.5027146, 0.2394953, 1, 1, 1, 1, 1,
-0.6451145, 1.570381, 1.83834, 1, 1, 1, 1, 1,
-0.6442105, -0.6979142, -3.694831, 1, 1, 1, 1, 1,
-0.6406678, 0.9433187, 0.2645172, 1, 1, 1, 1, 1,
-0.6390918, 0.7431359, -0.06557673, 1, 1, 1, 1, 1,
-0.638772, -0.5764446, -1.188446, 1, 1, 1, 1, 1,
-0.6307023, -0.2349451, -0.9385557, 1, 1, 1, 1, 1,
-0.6292015, 0.5302234, -0.4872249, 1, 1, 1, 1, 1,
-0.6286743, -0.7462843, -1.941181, 1, 1, 1, 1, 1,
-0.6241749, 0.02763347, -1.748824, 1, 1, 1, 1, 1,
-0.6224833, -0.7951458, -1.689841, 1, 1, 1, 1, 1,
-0.6214803, 0.2958841, -0.8085533, 1, 1, 1, 1, 1,
-0.6197599, -0.8463807, -3.263641, 1, 1, 1, 1, 1,
-0.6183215, 1.050788, 0.2245046, 1, 1, 1, 1, 1,
-0.6173252, -1.84465, -3.065351, 1, 1, 1, 1, 1,
-0.6120805, 0.1231226, -1.871183, 0, 0, 1, 1, 1,
-0.6070663, -0.1554132, -2.337282, 1, 0, 0, 1, 1,
-0.6026016, -0.7097246, -2.535451, 1, 0, 0, 1, 1,
-0.6020361, 1.392981, 0.5591817, 1, 0, 0, 1, 1,
-0.5982887, 0.1957558, -3.37465, 1, 0, 0, 1, 1,
-0.5977128, -0.8334772, -2.711408, 1, 0, 0, 1, 1,
-0.5971754, -0.4115829, -2.439827, 0, 0, 0, 1, 1,
-0.5903765, -1.454577, -0.1218537, 0, 0, 0, 1, 1,
-0.5895853, -0.8763726, -0.4510376, 0, 0, 0, 1, 1,
-0.58888, 0.8796592, -2.388273, 0, 0, 0, 1, 1,
-0.5842495, -1.76359, -5.121988, 0, 0, 0, 1, 1,
-0.583221, 0.2889737, -0.1529791, 0, 0, 0, 1, 1,
-0.5787712, 0.6246613, -0.6660578, 0, 0, 0, 1, 1,
-0.5758092, -0.2547547, -1.488067, 1, 1, 1, 1, 1,
-0.5744333, 1.210528, 0.9297115, 1, 1, 1, 1, 1,
-0.5739034, -0.8795639, -1.328838, 1, 1, 1, 1, 1,
-0.5654934, -0.7310115, -3.050187, 1, 1, 1, 1, 1,
-0.5653731, 0.2464126, -2.952507, 1, 1, 1, 1, 1,
-0.5611169, -0.4182707, -2.518269, 1, 1, 1, 1, 1,
-0.5570612, 0.1464585, -2.029257, 1, 1, 1, 1, 1,
-0.5520062, 1.576727, -1.233109, 1, 1, 1, 1, 1,
-0.548884, -1.003275, -1.236897, 1, 1, 1, 1, 1,
-0.5448753, 1.62449, -0.6380705, 1, 1, 1, 1, 1,
-0.5448664, 1.389514, 0.2030923, 1, 1, 1, 1, 1,
-0.5421861, 0.6308386, -0.355781, 1, 1, 1, 1, 1,
-0.5409174, -0.1633852, -2.007122, 1, 1, 1, 1, 1,
-0.5407203, 0.4669935, 0.08818925, 1, 1, 1, 1, 1,
-0.5397096, -0.3515711, -1.242626, 1, 1, 1, 1, 1,
-0.5384378, 0.8331453, 1.492432, 0, 0, 1, 1, 1,
-0.5383937, 0.3195641, -2.123635, 1, 0, 0, 1, 1,
-0.5362988, -1.373033, -1.978041, 1, 0, 0, 1, 1,
-0.534996, 0.6401178, -0.8187419, 1, 0, 0, 1, 1,
-0.5289031, -0.0517231, -0.825006, 1, 0, 0, 1, 1,
-0.5288557, -0.4892654, -3.528439, 1, 0, 0, 1, 1,
-0.5263563, 1.493087, -0.9694957, 0, 0, 0, 1, 1,
-0.5254167, -0.2867054, -1.979022, 0, 0, 0, 1, 1,
-0.5238385, -0.4212498, -3.814521, 0, 0, 0, 1, 1,
-0.5211802, -0.198204, -1.820016, 0, 0, 0, 1, 1,
-0.5155827, 0.1199033, -1.570121, 0, 0, 0, 1, 1,
-0.5155138, -0.06859168, -1.739486, 0, 0, 0, 1, 1,
-0.5091763, 0.8643928, -1.654574, 0, 0, 0, 1, 1,
-0.4983062, 1.400418, 0.3149827, 1, 1, 1, 1, 1,
-0.4974231, -0.06953707, -2.866576, 1, 1, 1, 1, 1,
-0.4965434, -0.2854233, -1.033199, 1, 1, 1, 1, 1,
-0.4962537, 0.1800385, -2.010069, 1, 1, 1, 1, 1,
-0.4957832, 1.299914, 0.3142775, 1, 1, 1, 1, 1,
-0.4880609, 0.5748772, -0.9111436, 1, 1, 1, 1, 1,
-0.4827368, -0.2444484, -3.102034, 1, 1, 1, 1, 1,
-0.4825741, 0.05893143, 0.9402036, 1, 1, 1, 1, 1,
-0.4816328, 1.087756, 1.242296, 1, 1, 1, 1, 1,
-0.4811006, 0.7499385, -2.323869, 1, 1, 1, 1, 1,
-0.4788037, 0.4345653, 0.9938804, 1, 1, 1, 1, 1,
-0.4787484, -0.5651692, -4.179632, 1, 1, 1, 1, 1,
-0.4683677, 1.975449, -2.598152, 1, 1, 1, 1, 1,
-0.4663086, 0.8512222, -0.4105165, 1, 1, 1, 1, 1,
-0.4654107, 0.02299703, -2.021119, 1, 1, 1, 1, 1,
-0.464513, 1.263601, -0.9292265, 0, 0, 1, 1, 1,
-0.4595153, 0.4463532, -0.8355015, 1, 0, 0, 1, 1,
-0.4570634, 0.2027854, 0.0798205, 1, 0, 0, 1, 1,
-0.4559525, -1.244375, -4.821881, 1, 0, 0, 1, 1,
-0.4557582, 0.2533747, -0.7282428, 1, 0, 0, 1, 1,
-0.4482615, -2.126061, -2.458664, 1, 0, 0, 1, 1,
-0.4477145, 0.6060981, -0.1420666, 0, 0, 0, 1, 1,
-0.444898, -0.5987895, -0.5236026, 0, 0, 0, 1, 1,
-0.4374654, 0.002672377, -1.445073, 0, 0, 0, 1, 1,
-0.4364015, -1.504998, -3.975712, 0, 0, 0, 1, 1,
-0.4341184, 0.930185, -0.3317468, 0, 0, 0, 1, 1,
-0.4301672, 0.5100942, 0.22001, 0, 0, 0, 1, 1,
-0.4268286, -0.3082134, -3.961189, 0, 0, 0, 1, 1,
-0.4260525, 0.02318607, -3.050957, 1, 1, 1, 1, 1,
-0.4256435, 0.3067243, -1.858253, 1, 1, 1, 1, 1,
-0.418616, -0.9150104, -1.673756, 1, 1, 1, 1, 1,
-0.4154702, -1.837989, -2.971943, 1, 1, 1, 1, 1,
-0.4132315, -0.09131894, -0.8522695, 1, 1, 1, 1, 1,
-0.4124021, 0.65943, -0.05033372, 1, 1, 1, 1, 1,
-0.4122364, -0.570046, -4.131747, 1, 1, 1, 1, 1,
-0.4090391, -0.78394, -1.836654, 1, 1, 1, 1, 1,
-0.4036988, -0.3730179, -3.845552, 1, 1, 1, 1, 1,
-0.4034424, 0.6997449, 0.6152147, 1, 1, 1, 1, 1,
-0.4002227, -0.6644484, -0.05437806, 1, 1, 1, 1, 1,
-0.3989458, 0.9308201, 0.2130755, 1, 1, 1, 1, 1,
-0.3969834, 0.9784465, -1.119455, 1, 1, 1, 1, 1,
-0.3863805, 0.344419, -1.273828, 1, 1, 1, 1, 1,
-0.3779941, 0.4250801, -0.1999092, 1, 1, 1, 1, 1,
-0.3778825, 0.3793875, -1.18382, 0, 0, 1, 1, 1,
-0.3772687, 0.2845608, -1.455159, 1, 0, 0, 1, 1,
-0.3771997, -0.9386168, -2.323188, 1, 0, 0, 1, 1,
-0.3760433, 0.5806479, -2.211895, 1, 0, 0, 1, 1,
-0.3744366, -0.6906918, -1.878771, 1, 0, 0, 1, 1,
-0.370625, 0.3820788, -0.4805773, 1, 0, 0, 1, 1,
-0.3697944, 2.511233, -0.4341005, 0, 0, 0, 1, 1,
-0.3694131, 0.6155984, 0.720182, 0, 0, 0, 1, 1,
-0.3659686, -0.7725709, -2.990414, 0, 0, 0, 1, 1,
-0.3582711, 0.1443061, -1.360769, 0, 0, 0, 1, 1,
-0.3562887, -1.525419, -3.465513, 0, 0, 0, 1, 1,
-0.3549774, 0.7181293, -1.750933, 0, 0, 0, 1, 1,
-0.3545171, 0.02119368, -1.48477, 0, 0, 0, 1, 1,
-0.3507191, -0.2225432, -1.841405, 1, 1, 1, 1, 1,
-0.3493845, -1.202437, -1.172844, 1, 1, 1, 1, 1,
-0.3475657, 1.079823, 0.03355655, 1, 1, 1, 1, 1,
-0.3471011, 0.7299292, 0.1018142, 1, 1, 1, 1, 1,
-0.3465733, 0.4822084, -1.259741, 1, 1, 1, 1, 1,
-0.3460886, -0.893541, -3.401846, 1, 1, 1, 1, 1,
-0.3453083, 0.7636451, -1.044779, 1, 1, 1, 1, 1,
-0.3445504, 0.6482746, 0.05981894, 1, 1, 1, 1, 1,
-0.3430758, 0.5858451, 0.04479675, 1, 1, 1, 1, 1,
-0.3430488, 1.614166, -0.2978235, 1, 1, 1, 1, 1,
-0.3416784, -0.5531833, -3.00352, 1, 1, 1, 1, 1,
-0.3402261, 1.433552, 1.494203, 1, 1, 1, 1, 1,
-0.3255899, -0.798201, -2.200942, 1, 1, 1, 1, 1,
-0.3244741, 1.004497, -0.05818543, 1, 1, 1, 1, 1,
-0.3228235, -0.7750959, -2.516896, 1, 1, 1, 1, 1,
-0.3203977, -0.9748033, -2.710867, 0, 0, 1, 1, 1,
-0.3203284, 0.8728731, -0.5727494, 1, 0, 0, 1, 1,
-0.318951, 0.1890177, -0.2893466, 1, 0, 0, 1, 1,
-0.318922, 0.4170307, 0.0391711, 1, 0, 0, 1, 1,
-0.3176269, -0.2671738, -2.972049, 1, 0, 0, 1, 1,
-0.3126157, 0.5080283, -0.9046346, 1, 0, 0, 1, 1,
-0.3119899, -2.36966, -2.789115, 0, 0, 0, 1, 1,
-0.3099719, -1.569504, -3.206791, 0, 0, 0, 1, 1,
-0.3076392, -0.8568636, -2.373916, 0, 0, 0, 1, 1,
-0.3022971, -1.086097, -3.861783, 0, 0, 0, 1, 1,
-0.2991009, -0.07745252, -2.084068, 0, 0, 0, 1, 1,
-0.292084, 0.2597068, -1.279514, 0, 0, 0, 1, 1,
-0.2829648, -0.5455393, -2.326757, 0, 0, 0, 1, 1,
-0.2808388, -0.5679083, -1.586384, 1, 1, 1, 1, 1,
-0.2797773, -0.09991337, -2.134418, 1, 1, 1, 1, 1,
-0.2776954, 1.83201, 0.8741361, 1, 1, 1, 1, 1,
-0.2774211, -0.8636047, -1.995376, 1, 1, 1, 1, 1,
-0.2730848, 0.1097563, -0.560825, 1, 1, 1, 1, 1,
-0.2715873, 0.3079807, -0.5639783, 1, 1, 1, 1, 1,
-0.2660474, -0.8831165, -2.059287, 1, 1, 1, 1, 1,
-0.2650392, 0.4196046, -1.687751, 1, 1, 1, 1, 1,
-0.2584062, -0.5726631, -1.86316, 1, 1, 1, 1, 1,
-0.2556639, 1.231247, 0.716889, 1, 1, 1, 1, 1,
-0.2544894, 1.222209, -0.5082172, 1, 1, 1, 1, 1,
-0.2525799, 0.9545959, 0.228935, 1, 1, 1, 1, 1,
-0.2509341, 2.186228, 0.5591257, 1, 1, 1, 1, 1,
-0.2482353, 0.3744098, -0.2940713, 1, 1, 1, 1, 1,
-0.2431818, -0.4682394, -1.239422, 1, 1, 1, 1, 1,
-0.2411748, -1.182747, -4.289351, 0, 0, 1, 1, 1,
-0.240872, 1.615405, 1.437727, 1, 0, 0, 1, 1,
-0.2372253, -0.7606072, -2.953616, 1, 0, 0, 1, 1,
-0.2343671, 0.6122369, -1.582281, 1, 0, 0, 1, 1,
-0.234082, 0.4188421, -0.8287071, 1, 0, 0, 1, 1,
-0.2335125, -0.8478541, -1.994735, 1, 0, 0, 1, 1,
-0.229708, -0.1435983, -1.689925, 0, 0, 0, 1, 1,
-0.2118566, -0.734368, -1.640539, 0, 0, 0, 1, 1,
-0.2104946, -0.5930379, -2.986086, 0, 0, 0, 1, 1,
-0.2079049, -1.117128, -3.637216, 0, 0, 0, 1, 1,
-0.1996368, 4.082833e-05, -2.10376, 0, 0, 0, 1, 1,
-0.1992355, 1.602167, 0.6880832, 0, 0, 0, 1, 1,
-0.1990772, -1.641029, -5.666665, 0, 0, 0, 1, 1,
-0.198414, -1.378996, -2.107154, 1, 1, 1, 1, 1,
-0.1969434, -0.9140589, -4.26164, 1, 1, 1, 1, 1,
-0.1963541, 0.1971229, 1.667619, 1, 1, 1, 1, 1,
-0.1955315, -0.3411433, -3.060472, 1, 1, 1, 1, 1,
-0.1927733, -0.04656584, -1.066547, 1, 1, 1, 1, 1,
-0.190421, -0.05719157, -2.555945, 1, 1, 1, 1, 1,
-0.1889565, 1.247982, 1.548287, 1, 1, 1, 1, 1,
-0.1850693, -0.5343642, -3.666691, 1, 1, 1, 1, 1,
-0.1842842, 0.3577319, -1.001929, 1, 1, 1, 1, 1,
-0.1822133, 0.07815505, -0.4917361, 1, 1, 1, 1, 1,
-0.1818614, 0.4777901, 1.440975, 1, 1, 1, 1, 1,
-0.1785702, 0.9888836, 0.1647315, 1, 1, 1, 1, 1,
-0.1782596, 0.5700379, 0.09277212, 1, 1, 1, 1, 1,
-0.1780562, 0.2414698, -1.638178, 1, 1, 1, 1, 1,
-0.1758142, -0.5517738, -4.726791, 1, 1, 1, 1, 1,
-0.1715098, 0.2513305, -1.554078, 0, 0, 1, 1, 1,
-0.1699984, -0.6886505, -1.898363, 1, 0, 0, 1, 1,
-0.1693831, 0.8464561, -0.6169346, 1, 0, 0, 1, 1,
-0.1668304, 0.9389509, -0.08174431, 1, 0, 0, 1, 1,
-0.1655495, 0.7880619, -1.677225, 1, 0, 0, 1, 1,
-0.1628662, 0.09329871, -0.9215301, 1, 0, 0, 1, 1,
-0.1625201, -0.568216, -5.009207, 0, 0, 0, 1, 1,
-0.1597629, 1.501918, -0.1289085, 0, 0, 0, 1, 1,
-0.1597543, -0.1633435, -3.089743, 0, 0, 0, 1, 1,
-0.1585553, 0.1320397, -1.493881, 0, 0, 0, 1, 1,
-0.1574309, 0.993243, 0.8862754, 0, 0, 0, 1, 1,
-0.1567202, 0.1239922, -1.215598, 0, 0, 0, 1, 1,
-0.1556952, 0.950841, 0.1910396, 0, 0, 0, 1, 1,
-0.1537097, -0.326295, -2.793315, 1, 1, 1, 1, 1,
-0.1493528, 0.02275944, -0.8192852, 1, 1, 1, 1, 1,
-0.1473388, -0.235175, -3.476004, 1, 1, 1, 1, 1,
-0.1468838, 1.384743, 0.7940351, 1, 1, 1, 1, 1,
-0.1438193, 1.44887, 0.7239451, 1, 1, 1, 1, 1,
-0.1384501, -0.02723223, -2.340677, 1, 1, 1, 1, 1,
-0.1368675, 0.784287, 0.2544472, 1, 1, 1, 1, 1,
-0.1271381, 1.280333, -0.5948648, 1, 1, 1, 1, 1,
-0.1239783, -0.9336326, -0.617113, 1, 1, 1, 1, 1,
-0.117769, 1.178586, -0.1233865, 1, 1, 1, 1, 1,
-0.117613, -1.006027, -3.342321, 1, 1, 1, 1, 1,
-0.1147211, -0.7073916, -2.932516, 1, 1, 1, 1, 1,
-0.1145448, -1.206654, -0.9912609, 1, 1, 1, 1, 1,
-0.1073945, -0.07002237, -1.405999, 1, 1, 1, 1, 1,
-0.1014418, -1.615339, -3.012813, 1, 1, 1, 1, 1,
-0.1002126, 0.5666009, 1.134648, 0, 0, 1, 1, 1,
-0.09003457, -1.729348, -2.877819, 1, 0, 0, 1, 1,
-0.08790842, 0.4847057, -0.685259, 1, 0, 0, 1, 1,
-0.08294929, -0.6390103, -1.978592, 1, 0, 0, 1, 1,
-0.08132631, -1.122266, -3.341201, 1, 0, 0, 1, 1,
-0.08069416, 0.9646524, 0.2165241, 1, 0, 0, 1, 1,
-0.07872627, 0.7737445, 0.4315977, 0, 0, 0, 1, 1,
-0.07702045, 1.063768, 0.7119232, 0, 0, 0, 1, 1,
-0.07600005, 0.5583609, -0.2047675, 0, 0, 0, 1, 1,
-0.0729479, -0.2964744, -1.921501, 0, 0, 0, 1, 1,
-0.07210868, -0.7024229, -3.579096, 0, 0, 0, 1, 1,
-0.07194576, 0.8175008, 0.8908877, 0, 0, 0, 1, 1,
-0.070348, 1.761858, 1.560503, 0, 0, 0, 1, 1,
-0.06689574, -0.7210329, -3.556753, 1, 1, 1, 1, 1,
-0.06097186, -0.3907604, -3.738662, 1, 1, 1, 1, 1,
-0.05429269, 1.544688, -0.004179669, 1, 1, 1, 1, 1,
-0.04928877, 1.921604, -1.810308, 1, 1, 1, 1, 1,
-0.04824041, -3.241817, -2.656955, 1, 1, 1, 1, 1,
-0.04810447, 1.229062, 1.231558, 1, 1, 1, 1, 1,
-0.04756554, -0.9142727, -2.333958, 1, 1, 1, 1, 1,
-0.04522012, -0.3299742, -2.124521, 1, 1, 1, 1, 1,
-0.04408031, -0.9069749, -2.254116, 1, 1, 1, 1, 1,
-0.04106628, 0.762431, -0.6891249, 1, 1, 1, 1, 1,
-0.02844614, -0.9574273, -3.999465, 1, 1, 1, 1, 1,
-0.02790619, -0.2887252, -1.519951, 1, 1, 1, 1, 1,
-0.02550564, 0.02445458, -1.436701, 1, 1, 1, 1, 1,
-0.02427957, -0.6347353, -1.959869, 1, 1, 1, 1, 1,
-0.0238519, -0.3163829, -1.180603, 1, 1, 1, 1, 1,
-0.02379877, -1.386108, -2.859374, 0, 0, 1, 1, 1,
-0.02331624, 0.9769515, 2.305328, 1, 0, 0, 1, 1,
-0.02072582, -0.9029142, -4.24785, 1, 0, 0, 1, 1,
-0.01956894, 0.07920519, -0.5572683, 1, 0, 0, 1, 1,
-0.009631387, 0.6940805, -1.040964, 1, 0, 0, 1, 1,
-0.006889985, -3.140167, -3.488853, 1, 0, 0, 1, 1,
-0.001886964, -1.106219, -2.878449, 0, 0, 0, 1, 1,
0.004270113, 0.6823296, -1.263648, 0, 0, 0, 1, 1,
0.004516278, -0.6733463, 1.090199, 0, 0, 0, 1, 1,
0.005155282, 0.4732003, 0.5109766, 0, 0, 0, 1, 1,
0.006459217, -0.05780553, 1.820862, 0, 0, 0, 1, 1,
0.01298039, 0.8971852, -1.243938, 0, 0, 0, 1, 1,
0.0156147, 0.897651, 0.3508832, 0, 0, 0, 1, 1,
0.01712029, -0.3134448, 2.840868, 1, 1, 1, 1, 1,
0.01733479, -0.2901614, 3.512362, 1, 1, 1, 1, 1,
0.02134979, -2.72603, 1.787349, 1, 1, 1, 1, 1,
0.02316681, -0.979511, 2.871394, 1, 1, 1, 1, 1,
0.02653656, -2.265153, 4.571487, 1, 1, 1, 1, 1,
0.03003854, 1.315286, 2.403624, 1, 1, 1, 1, 1,
0.03110378, -0.2406705, 3.231652, 1, 1, 1, 1, 1,
0.03819685, -1.252905, 5.011284, 1, 1, 1, 1, 1,
0.04002369, 0.9669791, -1.310492, 1, 1, 1, 1, 1,
0.04033553, -1.39, 2.528077, 1, 1, 1, 1, 1,
0.04139064, -0.9648556, 3.532462, 1, 1, 1, 1, 1,
0.0423772, -0.5366108, 2.976872, 1, 1, 1, 1, 1,
0.0460964, 0.04445441, 1.589678, 1, 1, 1, 1, 1,
0.04848117, -0.289831, 2.28096, 1, 1, 1, 1, 1,
0.05119024, 0.1802998, 0.1690929, 1, 1, 1, 1, 1,
0.05210472, 0.1313772, 1.598507, 0, 0, 1, 1, 1,
0.05382268, -1.148373, 3.164329, 1, 0, 0, 1, 1,
0.05415633, 1.573117, 2.502821, 1, 0, 0, 1, 1,
0.05650507, -1.192306, 2.385777, 1, 0, 0, 1, 1,
0.06055897, -0.8208482, 3.231051, 1, 0, 0, 1, 1,
0.06096328, -0.4280151, 2.278355, 1, 0, 0, 1, 1,
0.06164967, -0.0634918, 2.185968, 0, 0, 0, 1, 1,
0.06202333, -1.031251, 2.426888, 0, 0, 0, 1, 1,
0.06234783, 0.1270512, -0.3154739, 0, 0, 0, 1, 1,
0.06367447, 0.9284468, 0.0367356, 0, 0, 0, 1, 1,
0.06570843, 2.627245, -1.277132, 0, 0, 0, 1, 1,
0.07084139, 1.308434, 1.892058, 0, 0, 0, 1, 1,
0.07086696, 0.5638744, 1.305262, 0, 0, 0, 1, 1,
0.07275357, -1.674375, 1.723793, 1, 1, 1, 1, 1,
0.0755233, -0.9643811, 4.161473, 1, 1, 1, 1, 1,
0.07869456, 1.020303, -0.1826382, 1, 1, 1, 1, 1,
0.07887113, -0.3504646, 3.596877, 1, 1, 1, 1, 1,
0.08032913, 1.702513, 1.282228, 1, 1, 1, 1, 1,
0.08058318, 1.278249, -0.01055799, 1, 1, 1, 1, 1,
0.08349614, 0.9361558, 0.3151616, 1, 1, 1, 1, 1,
0.08784211, 0.7362128, 2.542801, 1, 1, 1, 1, 1,
0.09123018, 0.3422212, 0.3666775, 1, 1, 1, 1, 1,
0.09471323, -0.3442956, 3.267049, 1, 1, 1, 1, 1,
0.0985465, 0.08413974, 0.8755419, 1, 1, 1, 1, 1,
0.09901847, 0.1788595, 1.762027, 1, 1, 1, 1, 1,
0.1009792, 0.2233849, 0.7833511, 1, 1, 1, 1, 1,
0.1035165, 1.21519, -0.04741855, 1, 1, 1, 1, 1,
0.1045454, 1.32377, 0.4510118, 1, 1, 1, 1, 1,
0.1054732, 0.6231048, 0.7587327, 0, 0, 1, 1, 1,
0.1134387, 0.2058079, 1.029994, 1, 0, 0, 1, 1,
0.1138084, -1.48098, 2.003954, 1, 0, 0, 1, 1,
0.1157682, 0.2622123, 0.05813055, 1, 0, 0, 1, 1,
0.11906, 0.8957385, -0.04499775, 1, 0, 0, 1, 1,
0.1212045, -1.01655, 2.692163, 1, 0, 0, 1, 1,
0.1212717, 0.1439677, 2.305668, 0, 0, 0, 1, 1,
0.125804, -0.0834791, 1.210887, 0, 0, 0, 1, 1,
0.1278937, 0.9787387, 1.575962, 0, 0, 0, 1, 1,
0.1283797, -1.128509, 4.099384, 0, 0, 0, 1, 1,
0.1288648, 0.7098546, -0.03979481, 0, 0, 0, 1, 1,
0.1298479, -1.783657, 3.516253, 0, 0, 0, 1, 1,
0.1301108, -0.6411635, 3.67276, 0, 0, 0, 1, 1,
0.1311401, 0.5055438, 1.950599, 1, 1, 1, 1, 1,
0.1334991, 0.4977909, 0.7064123, 1, 1, 1, 1, 1,
0.139624, -0.507475, 2.655295, 1, 1, 1, 1, 1,
0.1424109, 0.586237, 1.100805, 1, 1, 1, 1, 1,
0.1444835, -2.305191, 2.094668, 1, 1, 1, 1, 1,
0.1456935, -0.02830876, 2.464885, 1, 1, 1, 1, 1,
0.1460867, -0.8385782, 3.112363, 1, 1, 1, 1, 1,
0.1466929, -0.9292307, 4.103044, 1, 1, 1, 1, 1,
0.1489426, 0.2207466, 0.130366, 1, 1, 1, 1, 1,
0.1515702, -0.560273, 3.693552, 1, 1, 1, 1, 1,
0.1580141, -1.627758, 2.951192, 1, 1, 1, 1, 1,
0.1593401, -1.527901, 3.315477, 1, 1, 1, 1, 1,
0.1625833, -0.4854327, 2.37369, 1, 1, 1, 1, 1,
0.1650875, -0.6395224, 1.460902, 1, 1, 1, 1, 1,
0.1664003, -0.2648478, 4.822492, 1, 1, 1, 1, 1,
0.1696184, -0.1835888, 1.688731, 0, 0, 1, 1, 1,
0.1709317, 1.537892, 1.204852, 1, 0, 0, 1, 1,
0.1712747, -0.6319373, 2.628547, 1, 0, 0, 1, 1,
0.1770715, -0.5699807, 2.153805, 1, 0, 0, 1, 1,
0.1810641, 1.05799, 0.501969, 1, 0, 0, 1, 1,
0.1820299, 0.6482777, 0.7693647, 1, 0, 0, 1, 1,
0.1850338, -0.936536, 1.310799, 0, 0, 0, 1, 1,
0.1862758, -1.182351, 2.861729, 0, 0, 0, 1, 1,
0.1891744, 0.6483002, -0.09514835, 0, 0, 0, 1, 1,
0.1894839, -1.25524, 4.434543, 0, 0, 0, 1, 1,
0.1898438, 0.2217972, 0.6171363, 0, 0, 0, 1, 1,
0.206151, -0.1198552, 2.189619, 0, 0, 0, 1, 1,
0.2099451, 0.7783498, -0.1481162, 0, 0, 0, 1, 1,
0.2109505, 0.6974158, -0.1502367, 1, 1, 1, 1, 1,
0.211481, -1.060169, 5.569157, 1, 1, 1, 1, 1,
0.2161427, 0.2583633, 1.586745, 1, 1, 1, 1, 1,
0.2226321, -0.8396904, 1.411998, 1, 1, 1, 1, 1,
0.226529, -0.547414, 2.478522, 1, 1, 1, 1, 1,
0.2277783, 0.6610301, 1.79186, 1, 1, 1, 1, 1,
0.2295846, -2.155461, 2.701518, 1, 1, 1, 1, 1,
0.23136, -1.77669, 3.352297, 1, 1, 1, 1, 1,
0.2322181, -0.1410925, 3.918697, 1, 1, 1, 1, 1,
0.2354326, 0.2502131, 0.2502003, 1, 1, 1, 1, 1,
0.2388124, 1.325532, 0.9776719, 1, 1, 1, 1, 1,
0.2393428, 0.8996814, -0.5904747, 1, 1, 1, 1, 1,
0.2457467, -0.03044496, 4.1832, 1, 1, 1, 1, 1,
0.2534536, 0.4151344, 1.298093, 1, 1, 1, 1, 1,
0.257118, 0.6717251, 0.5802346, 1, 1, 1, 1, 1,
0.2573897, -0.8339737, 1.74796, 0, 0, 1, 1, 1,
0.2585019, 0.09293921, 0.07294244, 1, 0, 0, 1, 1,
0.258698, -0.2436338, 4.377228, 1, 0, 0, 1, 1,
0.2595229, -0.2779286, 2.630771, 1, 0, 0, 1, 1,
0.2699436, -0.4673101, 1.239729, 1, 0, 0, 1, 1,
0.2775373, 0.7034284, 1.376677, 1, 0, 0, 1, 1,
0.2776433, 0.6378937, 2.372484, 0, 0, 0, 1, 1,
0.2777669, 0.5955604, 1.062388, 0, 0, 0, 1, 1,
0.284347, 0.3274634, 0.921605, 0, 0, 0, 1, 1,
0.2860024, -0.5968845, 2.436848, 0, 0, 0, 1, 1,
0.286047, 0.549638, 0.2109806, 0, 0, 0, 1, 1,
0.287891, -0.8638662, 1.684906, 0, 0, 0, 1, 1,
0.2896138, -1.001704, 3.977058, 0, 0, 0, 1, 1,
0.2904831, -1.251413, 3.763901, 1, 1, 1, 1, 1,
0.2909337, 2.702609, -0.5956901, 1, 1, 1, 1, 1,
0.2930725, 1.609989, -0.206065, 1, 1, 1, 1, 1,
0.300824, 1.044881, -0.1436908, 1, 1, 1, 1, 1,
0.3016036, -0.4097351, 3.89614, 1, 1, 1, 1, 1,
0.3022504, 0.05606091, 2.232552, 1, 1, 1, 1, 1,
0.3039698, 0.8959967, 1.096211, 1, 1, 1, 1, 1,
0.3101599, -0.7116454, 2.580787, 1, 1, 1, 1, 1,
0.311975, -0.07176346, 3.09454, 1, 1, 1, 1, 1,
0.3137898, 0.3128173, 2.524176, 1, 1, 1, 1, 1,
0.3149661, 1.22142, -0.1601805, 1, 1, 1, 1, 1,
0.3169424, -0.08575274, 3.001324, 1, 1, 1, 1, 1,
0.3195744, -0.001317963, 1.12528, 1, 1, 1, 1, 1,
0.3209595, -0.6854318, 3.132761, 1, 1, 1, 1, 1,
0.324982, -0.7110126, 1.031214, 1, 1, 1, 1, 1,
0.3310951, 0.4844392, -0.8775868, 0, 0, 1, 1, 1,
0.3343319, 0.6929784, 0.8968196, 1, 0, 0, 1, 1,
0.3362045, -0.7371747, 3.213665, 1, 0, 0, 1, 1,
0.3447454, -1.321574, 2.332846, 1, 0, 0, 1, 1,
0.349143, 0.2522483, 1.637994, 1, 0, 0, 1, 1,
0.3500021, -1.101946, 4.723778, 1, 0, 0, 1, 1,
0.3507259, -0.1208786, 1.321829, 0, 0, 0, 1, 1,
0.3563589, 1.249219, 0.2242718, 0, 0, 0, 1, 1,
0.359967, -0.3922504, 3.663347, 0, 0, 0, 1, 1,
0.3683563, -1.023682, 0.5933412, 0, 0, 0, 1, 1,
0.3695512, -0.2620187, 1.248951, 0, 0, 0, 1, 1,
0.3770858, -1.0484, 1.797062, 0, 0, 0, 1, 1,
0.3784333, -0.5274634, 1.641902, 0, 0, 0, 1, 1,
0.3874141, 0.7334453, 0.8712211, 1, 1, 1, 1, 1,
0.389497, -0.1355567, 2.912901, 1, 1, 1, 1, 1,
0.3940161, 0.7119624, 1.838172, 1, 1, 1, 1, 1,
0.39744, 2.141026, -0.7857993, 1, 1, 1, 1, 1,
0.398045, -0.0188129, 1.289168, 1, 1, 1, 1, 1,
0.4050494, -1.221295, 0.4324022, 1, 1, 1, 1, 1,
0.4083055, -0.3399044, 3.702428, 1, 1, 1, 1, 1,
0.410957, -1.274943, 2.660581, 1, 1, 1, 1, 1,
0.4109705, -0.5746681, 3.380386, 1, 1, 1, 1, 1,
0.4110289, -0.2032028, 2.564802, 1, 1, 1, 1, 1,
0.4144187, 0.5815255, -0.3070266, 1, 1, 1, 1, 1,
0.415306, 0.3810765, -1.258236, 1, 1, 1, 1, 1,
0.4155498, 2.067847, 2.922454, 1, 1, 1, 1, 1,
0.4167271, 1.291008, -0.3751701, 1, 1, 1, 1, 1,
0.4170044, 0.6565254, 0.3305481, 1, 1, 1, 1, 1,
0.4187742, 1.80345, 0.6280146, 0, 0, 1, 1, 1,
0.4204612, -1.028744, 2.549871, 1, 0, 0, 1, 1,
0.4222278, 0.1263243, 0.7518838, 1, 0, 0, 1, 1,
0.4252899, -3.216116, 2.325328, 1, 0, 0, 1, 1,
0.4282999, -1.138378, 2.489974, 1, 0, 0, 1, 1,
0.4291799, 0.8794488, 0.3771871, 1, 0, 0, 1, 1,
0.4327812, -1.088872, 2.201849, 0, 0, 0, 1, 1,
0.4328292, -0.945454, 3.024809, 0, 0, 0, 1, 1,
0.4331406, 0.2063348, 1.707708, 0, 0, 0, 1, 1,
0.439833, -1.049169, 2.357265, 0, 0, 0, 1, 1,
0.4405485, -1.524208, 3.366882, 0, 0, 0, 1, 1,
0.4417695, 0.1030693, 1.77882, 0, 0, 0, 1, 1,
0.4422683, 1.367455, -0.3782274, 0, 0, 0, 1, 1,
0.4435462, 0.3604926, 0.09701094, 1, 1, 1, 1, 1,
0.4466875, 1.408489, 0.2038463, 1, 1, 1, 1, 1,
0.4467354, -1.781617, 3.942483, 1, 1, 1, 1, 1,
0.4513559, 1.821538, -0.6959008, 1, 1, 1, 1, 1,
0.4524795, 0.6449422, 0.1741329, 1, 1, 1, 1, 1,
0.454014, 0.7339579, -0.2078051, 1, 1, 1, 1, 1,
0.4566124, 0.5790439, 1.475936, 1, 1, 1, 1, 1,
0.4591593, 0.5847603, 1.131319, 1, 1, 1, 1, 1,
0.4597511, -1.075437, 2.070034, 1, 1, 1, 1, 1,
0.4616483, -0.4669413, 2.414024, 1, 1, 1, 1, 1,
0.463776, -1.731265, 2.73469, 1, 1, 1, 1, 1,
0.4681824, 2.274477, -0.438192, 1, 1, 1, 1, 1,
0.4691306, -0.8522904, 2.616501, 1, 1, 1, 1, 1,
0.4691999, -0.3624337, 0.9497994, 1, 1, 1, 1, 1,
0.4702816, 1.818208, 0.3905855, 1, 1, 1, 1, 1,
0.472185, 0.5583777, 1.529748, 0, 0, 1, 1, 1,
0.4748059, 0.8691127, 1.741507, 1, 0, 0, 1, 1,
0.4806953, -1.028862, 1.945965, 1, 0, 0, 1, 1,
0.4843659, 0.5518963, 0.2073101, 1, 0, 0, 1, 1,
0.4885751, -0.5787467, 3.487219, 1, 0, 0, 1, 1,
0.4951301, 0.6720949, 0.1092835, 1, 0, 0, 1, 1,
0.4960285, -0.8890896, 3.460932, 0, 0, 0, 1, 1,
0.4969935, -0.1774412, 2.130396, 0, 0, 0, 1, 1,
0.5046343, -0.1275765, 2.370887, 0, 0, 0, 1, 1,
0.5075442, 0.7145316, -0.1586125, 0, 0, 0, 1, 1,
0.5115751, 0.3218724, 1.186149, 0, 0, 0, 1, 1,
0.5116944, 0.3314407, -1.40544, 0, 0, 0, 1, 1,
0.5154715, -0.5877401, 1.741115, 0, 0, 0, 1, 1,
0.5181664, 1.003936, 0.278006, 1, 1, 1, 1, 1,
0.5210524, 1.181732, 0.6588969, 1, 1, 1, 1, 1,
0.5221786, 1.008912, 0.6549488, 1, 1, 1, 1, 1,
0.5224538, -0.2123625, 1.445223, 1, 1, 1, 1, 1,
0.523858, -0.8709205, 1.965729, 1, 1, 1, 1, 1,
0.5255109, 0.1580637, 0.5294294, 1, 1, 1, 1, 1,
0.5269127, -1.086495, 3.153444, 1, 1, 1, 1, 1,
0.5290282, 0.3551819, -0.4993958, 1, 1, 1, 1, 1,
0.5311625, -1.145315, 2.999021, 1, 1, 1, 1, 1,
0.5349805, -1.138321, 3.333689, 1, 1, 1, 1, 1,
0.5354559, 1.69599, 1.229313, 1, 1, 1, 1, 1,
0.5409503, -0.3525761, 3.2267, 1, 1, 1, 1, 1,
0.5417637, -0.5138777, 3.250702, 1, 1, 1, 1, 1,
0.550089, -0.7428976, 2.31884, 1, 1, 1, 1, 1,
0.5512608, -0.0320094, 1.180168, 1, 1, 1, 1, 1,
0.5517802, 0.3720199, -0.4165362, 0, 0, 1, 1, 1,
0.5547079, -1.571632, 2.492059, 1, 0, 0, 1, 1,
0.5581753, -1.503382, 3.876527, 1, 0, 0, 1, 1,
0.5607764, -0.3976013, 2.763662, 1, 0, 0, 1, 1,
0.5615932, 1.076989, 1.555456, 1, 0, 0, 1, 1,
0.5617791, 0.1469236, -0.2733089, 1, 0, 0, 1, 1,
0.5638931, 0.8193639, 0.4329182, 0, 0, 0, 1, 1,
0.5640636, 1.448636, 0.04870247, 0, 0, 0, 1, 1,
0.5747708, 1.13901, 1.112218, 0, 0, 0, 1, 1,
0.5806891, -0.6156948, 2.32437, 0, 0, 0, 1, 1,
0.5873488, 0.5661526, 2.724371, 0, 0, 0, 1, 1,
0.5929626, -0.03402552, 0.9632519, 0, 0, 0, 1, 1,
0.5986535, -0.4974987, 2.260864, 0, 0, 0, 1, 1,
0.6081669, -0.9238344, 3.372864, 1, 1, 1, 1, 1,
0.6115597, -0.1275848, 0.6616768, 1, 1, 1, 1, 1,
0.6210914, -0.05197038, 1.237582, 1, 1, 1, 1, 1,
0.6212814, -0.1772455, 3.104725, 1, 1, 1, 1, 1,
0.6264936, 0.9321911, -0.1667906, 1, 1, 1, 1, 1,
0.6282117, -1.011542, 1.668878, 1, 1, 1, 1, 1,
0.6285684, 0.4047182, 0.7604806, 1, 1, 1, 1, 1,
0.6320537, -0.7486745, 3.366797, 1, 1, 1, 1, 1,
0.6330343, 1.369984, 0.9217734, 1, 1, 1, 1, 1,
0.6356944, -0.7270901, 3.935101, 1, 1, 1, 1, 1,
0.6383083, -0.915478, 1.570777, 1, 1, 1, 1, 1,
0.6390836, -1.706083, 2.619953, 1, 1, 1, 1, 1,
0.6407228, 0.3401062, 2.311234, 1, 1, 1, 1, 1,
0.6489979, 1.606427, 1.021134, 1, 1, 1, 1, 1,
0.6490282, 0.4064989, 0.6543125, 1, 1, 1, 1, 1,
0.652247, -0.604429, 3.921396, 0, 0, 1, 1, 1,
0.6627114, 1.430186, 1.58429, 1, 0, 0, 1, 1,
0.6640383, 0.5452132, 1.617904, 1, 0, 0, 1, 1,
0.6657129, -0.450202, 2.255104, 1, 0, 0, 1, 1,
0.6659758, 1.815782, -1.780825, 1, 0, 0, 1, 1,
0.6713293, -1.503218, 4.416119, 1, 0, 0, 1, 1,
0.6789653, 0.1827008, 0.999945, 0, 0, 0, 1, 1,
0.6804163, 0.9409307, 0.5638896, 0, 0, 0, 1, 1,
0.6806948, -0.6537478, 1.836076, 0, 0, 0, 1, 1,
0.6838449, 1.23436, 2.114465, 0, 0, 0, 1, 1,
0.6880029, 0.1884486, 2.630884, 0, 0, 0, 1, 1,
0.6911, 1.229805, -0.4526135, 0, 0, 0, 1, 1,
0.693311, -1.796497, 0.647379, 0, 0, 0, 1, 1,
0.6995754, 1.078029, -1.965537, 1, 1, 1, 1, 1,
0.7007449, 0.5531655, -0.193183, 1, 1, 1, 1, 1,
0.7031852, 0.4529777, 1.475878, 1, 1, 1, 1, 1,
0.7035672, 1.200902, -1.340937, 1, 1, 1, 1, 1,
0.7040079, -0.985849, 1.22624, 1, 1, 1, 1, 1,
0.7045544, 1.310587, 0.5194629, 1, 1, 1, 1, 1,
0.7047527, -1.748825, 2.087971, 1, 1, 1, 1, 1,
0.7051745, -0.3671952, 1.724967, 1, 1, 1, 1, 1,
0.7069852, -0.2102132, 1.286119, 1, 1, 1, 1, 1,
0.7076348, 2.011509, -0.5698082, 1, 1, 1, 1, 1,
0.7093786, -1.059741, 2.725974, 1, 1, 1, 1, 1,
0.7135441, -2.762578, 3.667121, 1, 1, 1, 1, 1,
0.7240046, 1.375554, 0.4273945, 1, 1, 1, 1, 1,
0.7246526, -0.03818103, 0.6655035, 1, 1, 1, 1, 1,
0.7252342, 0.4918493, 0.5974714, 1, 1, 1, 1, 1,
0.7274324, -0.3179576, 0.2639996, 0, 0, 1, 1, 1,
0.7313267, -0.3723448, 3.254703, 1, 0, 0, 1, 1,
0.7320136, 0.2253811, 2.273126, 1, 0, 0, 1, 1,
0.7360231, -1.716191, 2.812143, 1, 0, 0, 1, 1,
0.7428409, 2.49681, 1.182265, 1, 0, 0, 1, 1,
0.7438403, 0.6851901, 1.459694, 1, 0, 0, 1, 1,
0.7484663, -0.8534234, 1.477682, 0, 0, 0, 1, 1,
0.7599482, 0.8234437, 0.9909053, 0, 0, 0, 1, 1,
0.7610691, -0.8274674, 2.083105, 0, 0, 0, 1, 1,
0.7670276, -0.6489537, 0.5383534, 0, 0, 0, 1, 1,
0.7754452, 0.6068657, 0.00390095, 0, 0, 0, 1, 1,
0.7799618, -0.3231923, 1.51792, 0, 0, 0, 1, 1,
0.7925116, 0.6325829, 0.4168132, 0, 0, 0, 1, 1,
0.7927113, 0.216753, 1.98665, 1, 1, 1, 1, 1,
0.7956982, -0.6645404, 1.907998, 1, 1, 1, 1, 1,
0.7969877, 0.09697255, 0.7615738, 1, 1, 1, 1, 1,
0.7996094, 0.7392855, -0.3386202, 1, 1, 1, 1, 1,
0.8013953, 0.7250003, 2.081136, 1, 1, 1, 1, 1,
0.8026611, -0.1187326, 3.310547, 1, 1, 1, 1, 1,
0.8090786, -0.6901332, 1.796701, 1, 1, 1, 1, 1,
0.8125989, -0.4725144, 2.247052, 1, 1, 1, 1, 1,
0.8142061, -0.02752551, 3.512322, 1, 1, 1, 1, 1,
0.8164961, 1.321714, -0.386465, 1, 1, 1, 1, 1,
0.8241974, 0.2211866, 1.732636, 1, 1, 1, 1, 1,
0.8253816, -0.2351315, 2.097959, 1, 1, 1, 1, 1,
0.832777, -1.18588, 1.924143, 1, 1, 1, 1, 1,
0.8360915, 0.8571689, 1.432538, 1, 1, 1, 1, 1,
0.8374082, -0.02158499, 2.083734, 1, 1, 1, 1, 1,
0.8384358, -0.7003828, 3.602681, 0, 0, 1, 1, 1,
0.8418353, -0.3078262, 2.51881, 1, 0, 0, 1, 1,
0.8556888, -0.3774456, 1.477238, 1, 0, 0, 1, 1,
0.8656324, -0.06157717, 0.9622936, 1, 0, 0, 1, 1,
0.8658882, -0.3505813, 2.397276, 1, 0, 0, 1, 1,
0.8667598, -1.207159, 4.614876, 1, 0, 0, 1, 1,
0.8682024, 1.674779, 0.6943417, 0, 0, 0, 1, 1,
0.8697193, -0.2285362, 0.7360834, 0, 0, 0, 1, 1,
0.870463, 0.3117977, 1.133018, 0, 0, 0, 1, 1,
0.8730894, 0.3219573, 1.807802, 0, 0, 0, 1, 1,
0.8804787, 0.2153957, 1.183108, 0, 0, 0, 1, 1,
0.8831913, -0.0845236, 2.137881, 0, 0, 0, 1, 1,
0.8944989, 0.2940007, 1.682063, 0, 0, 0, 1, 1,
0.8950188, 1.102636, 0.9743392, 1, 1, 1, 1, 1,
0.9073949, 0.2161794, 1.294268, 1, 1, 1, 1, 1,
0.9082119, 0.3673224, 2.184354, 1, 1, 1, 1, 1,
0.9088765, -0.3155934, 3.3244, 1, 1, 1, 1, 1,
0.9118134, 0.02609145, 0.9555529, 1, 1, 1, 1, 1,
0.9155461, -1.274106, 2.039832, 1, 1, 1, 1, 1,
0.9183789, -0.9202771, 2.997586, 1, 1, 1, 1, 1,
0.9194498, -0.05598619, 1.585061, 1, 1, 1, 1, 1,
0.9233065, -0.1923971, 1.341696, 1, 1, 1, 1, 1,
0.9290996, -0.710691, 2.715248, 1, 1, 1, 1, 1,
0.9318528, -0.3393477, 1.420175, 1, 1, 1, 1, 1,
0.9421468, 1.158044, 0.09257124, 1, 1, 1, 1, 1,
0.9481259, 1.900032, 0.5892125, 1, 1, 1, 1, 1,
0.9496131, -1.268314, 4.677004, 1, 1, 1, 1, 1,
0.9504359, 2.771102, 0.3014666, 1, 1, 1, 1, 1,
0.9575609, -0.138719, 2.805919, 0, 0, 1, 1, 1,
0.9579873, 0.9082855, 1.406994, 1, 0, 0, 1, 1,
0.9595841, -0.9590617, 1.000861, 1, 0, 0, 1, 1,
0.9602183, -0.6775973, 2.144199, 1, 0, 0, 1, 1,
0.9686705, -0.01844278, 0.7947938, 1, 0, 0, 1, 1,
0.9781309, -0.2672185, 3.901003, 1, 0, 0, 1, 1,
0.9851204, 2.431302, -1.600968, 0, 0, 0, 1, 1,
0.9896131, 0.3336183, 2.450383, 0, 0, 0, 1, 1,
0.9942091, 1.579012, 1.191667, 0, 0, 0, 1, 1,
1.007288, -0.4581215, 2.566404, 0, 0, 0, 1, 1,
1.016828, -0.3929662, 2.596623, 0, 0, 0, 1, 1,
1.016933, 2.490826, 1.725928, 0, 0, 0, 1, 1,
1.0183, -2.051908, 0.6013718, 0, 0, 0, 1, 1,
1.02026, 0.0422598, 2.297206, 1, 1, 1, 1, 1,
1.024695, -0.4350002, 3.576768, 1, 1, 1, 1, 1,
1.033208, -0.9956231, 2.275243, 1, 1, 1, 1, 1,
1.048756, -0.2223665, 0.6114852, 1, 1, 1, 1, 1,
1.04996, -0.05228892, 1.089955, 1, 1, 1, 1, 1,
1.050968, 0.0295812, 1.630342, 1, 1, 1, 1, 1,
1.056632, -0.9354942, -0.1359381, 1, 1, 1, 1, 1,
1.064005, 0.5871897, -0.3602743, 1, 1, 1, 1, 1,
1.068417, 0.3022155, 1.040979, 1, 1, 1, 1, 1,
1.082656, -0.6399164, 1.062333, 1, 1, 1, 1, 1,
1.091043, -1.369522, 0.628525, 1, 1, 1, 1, 1,
1.09806, 0.2085895, 3.071115, 1, 1, 1, 1, 1,
1.099599, 1.0984, 0.6269993, 1, 1, 1, 1, 1,
1.103479, -0.1522021, 2.399402, 1, 1, 1, 1, 1,
1.1129, -0.4086977, 3.01169, 1, 1, 1, 1, 1,
1.114026, -0.6752663, 2.103339, 0, 0, 1, 1, 1,
1.126141, 0.694232, -0.1188845, 1, 0, 0, 1, 1,
1.127096, -1.143971, 1.849408, 1, 0, 0, 1, 1,
1.142453, 0.2380973, 2.802703, 1, 0, 0, 1, 1,
1.148865, -0.1307579, 2.882254, 1, 0, 0, 1, 1,
1.150654, 0.5202461, 0.474803, 1, 0, 0, 1, 1,
1.155676, -0.8400735, 2.148695, 0, 0, 0, 1, 1,
1.162392, -1.286972, 2.13196, 0, 0, 0, 1, 1,
1.163843, 1.159711, 0.7740985, 0, 0, 0, 1, 1,
1.172949, -1.844341, 2.786614, 0, 0, 0, 1, 1,
1.185896, -0.4693162, 0.8603526, 0, 0, 0, 1, 1,
1.191468, -0.2387599, 2.515505, 0, 0, 0, 1, 1,
1.191952, -0.477371, 1.043597, 0, 0, 0, 1, 1,
1.193104, -0.04201197, 1.633062, 1, 1, 1, 1, 1,
1.203523, -0.8396029, 2.874979, 1, 1, 1, 1, 1,
1.205773, 0.7833652, 0.9955465, 1, 1, 1, 1, 1,
1.206542, 1.495703, 0.2014294, 1, 1, 1, 1, 1,
1.222682, -0.3591518, 0.565655, 1, 1, 1, 1, 1,
1.232429, -0.009928723, 1.247296, 1, 1, 1, 1, 1,
1.233203, 1.123604, 0.0985735, 1, 1, 1, 1, 1,
1.238983, -1.463443, 0.9645261, 1, 1, 1, 1, 1,
1.239359, 0.2544735, 2.271089, 1, 1, 1, 1, 1,
1.243956, 1.28581, 1.966723, 1, 1, 1, 1, 1,
1.254833, -1.060488, 1.554376, 1, 1, 1, 1, 1,
1.2597, -0.4956306, 1.704158, 1, 1, 1, 1, 1,
1.266621, 0.4941896, 1.148362, 1, 1, 1, 1, 1,
1.272506, -1.600304, 3.35675, 1, 1, 1, 1, 1,
1.278508, -0.3422402, 2.741901, 1, 1, 1, 1, 1,
1.282619, -0.9880909, 2.165962, 0, 0, 1, 1, 1,
1.286895, -1.156607, 2.556547, 1, 0, 0, 1, 1,
1.295232, -0.3410856, 0.627811, 1, 0, 0, 1, 1,
1.295503, -0.6321476, 2.138257, 1, 0, 0, 1, 1,
1.304638, -0.1275057, 2.768938, 1, 0, 0, 1, 1,
1.305719, 0.5533466, 2.163865, 1, 0, 0, 1, 1,
1.311554, 2.049205, 0.1723823, 0, 0, 0, 1, 1,
1.313724, -0.5026299, 3.690082, 0, 0, 0, 1, 1,
1.316126, 0.1744229, 1.552365, 0, 0, 0, 1, 1,
1.32403, 1.82584, 0.0754862, 0, 0, 0, 1, 1,
1.330343, 0.08132237, 0.8048027, 0, 0, 0, 1, 1,
1.334936, -0.6230061, 2.584197, 0, 0, 0, 1, 1,
1.342974, 0.237543, 1.594092, 0, 0, 0, 1, 1,
1.347405, -1.405517, 2.781792, 1, 1, 1, 1, 1,
1.356826, 0.1845924, 3.155453, 1, 1, 1, 1, 1,
1.373031, 2.644245, -0.2298145, 1, 1, 1, 1, 1,
1.385326, 0.7960613, 0.1055789, 1, 1, 1, 1, 1,
1.392191, -0.6800883, 2.595118, 1, 1, 1, 1, 1,
1.395482, 0.9281167, 0.6939192, 1, 1, 1, 1, 1,
1.403802, -1.672758, 2.219185, 1, 1, 1, 1, 1,
1.404657, -1.073985, 1.766507, 1, 1, 1, 1, 1,
1.417421, 1.621055, 1.608886, 1, 1, 1, 1, 1,
1.420928, 0.494834, 2.452259, 1, 1, 1, 1, 1,
1.430431, 0.2119248, 1.642811, 1, 1, 1, 1, 1,
1.434747, -0.7160602, 3.616019, 1, 1, 1, 1, 1,
1.43503, 0.5300402, -1.147802, 1, 1, 1, 1, 1,
1.440991, 1.956706, 2.403961, 1, 1, 1, 1, 1,
1.444031, 0.05593815, 2.58135, 1, 1, 1, 1, 1,
1.444895, -0.5239314, 3.910742, 0, 0, 1, 1, 1,
1.451843, 1.160915, 2.087237, 1, 0, 0, 1, 1,
1.454656, 0.9442999, 1.447406, 1, 0, 0, 1, 1,
1.468264, 0.8473713, 3.701018, 1, 0, 0, 1, 1,
1.47821, -0.645815, 1.52642, 1, 0, 0, 1, 1,
1.492114, 0.9881167, 0.5736081, 1, 0, 0, 1, 1,
1.494367, 0.2636018, 1.905932, 0, 0, 0, 1, 1,
1.498031, -0.6159686, 0.6866741, 0, 0, 0, 1, 1,
1.498921, -0.584883, 1.733422, 0, 0, 0, 1, 1,
1.517039, 0.4758294, 2.24708, 0, 0, 0, 1, 1,
1.542482, 0.196585, 2.047624, 0, 0, 0, 1, 1,
1.544719, -0.1957728, 2.517936, 0, 0, 0, 1, 1,
1.559846, 0.02394471, 1.676104, 0, 0, 0, 1, 1,
1.570588, 0.3712173, 0.3613965, 1, 1, 1, 1, 1,
1.574807, 1.643902, 0.2394564, 1, 1, 1, 1, 1,
1.575857, 0.9018047, 1.144788, 1, 1, 1, 1, 1,
1.580522, 0.9734083, 0.3099703, 1, 1, 1, 1, 1,
1.58979, -1.106823, 2.036919, 1, 1, 1, 1, 1,
1.598964, -0.5487791, 0.7273068, 1, 1, 1, 1, 1,
1.603007, -0.5606041, 1.535323, 1, 1, 1, 1, 1,
1.606518, 2.123027, 0.194277, 1, 1, 1, 1, 1,
1.608174, -0.381721, 2.659957, 1, 1, 1, 1, 1,
1.614046, -0.6600978, 1.639439, 1, 1, 1, 1, 1,
1.614653, 0.2633904, 3.115693, 1, 1, 1, 1, 1,
1.624967, 1.664696, -1.432971, 1, 1, 1, 1, 1,
1.625713, 0.5341591, 1.88124, 1, 1, 1, 1, 1,
1.632557, -1.476182, 2.677971, 1, 1, 1, 1, 1,
1.633202, -0.2135383, 2.687159, 1, 1, 1, 1, 1,
1.649433, 0.04922147, 1.298705, 0, 0, 1, 1, 1,
1.649434, -0.004208439, 2.540477, 1, 0, 0, 1, 1,
1.649823, 0.2972128, 2.177431, 1, 0, 0, 1, 1,
1.690873, 1.529678, 1.180323, 1, 0, 0, 1, 1,
1.712037, 0.7367248, 1.507139, 1, 0, 0, 1, 1,
1.716545, 1.285815, 0.2027306, 1, 0, 0, 1, 1,
1.721676, 1.812974, 1.835565, 0, 0, 0, 1, 1,
1.731117, -0.6263302, 2.561345, 0, 0, 0, 1, 1,
1.738724, 0.73224, 2.37638, 0, 0, 0, 1, 1,
1.741225, 0.6620068, 0.1164611, 0, 0, 0, 1, 1,
1.754276, 0.9928686, 2.688882, 0, 0, 0, 1, 1,
1.759386, -0.03386054, 0.544276, 0, 0, 0, 1, 1,
1.789973, 2.235312, 0.344363, 0, 0, 0, 1, 1,
1.801855, -2.063431, 1.785188, 1, 1, 1, 1, 1,
1.81056, -0.5659866, 2.942679, 1, 1, 1, 1, 1,
1.811216, -0.6600285, 2.464396, 1, 1, 1, 1, 1,
1.816001, 1.047948, 1.887854, 1, 1, 1, 1, 1,
1.822314, -0.5845119, 0.8191853, 1, 1, 1, 1, 1,
1.834436, 0.1540981, 2.10058, 1, 1, 1, 1, 1,
1.83564, -0.6262288, 1.064752, 1, 1, 1, 1, 1,
1.873411, -0.1212716, 2.052126, 1, 1, 1, 1, 1,
1.878434, -0.07406153, 1.441037, 1, 1, 1, 1, 1,
1.894656, 0.001121568, 2.545097, 1, 1, 1, 1, 1,
1.913384, 0.08941846, 3.123781, 1, 1, 1, 1, 1,
1.927175, -0.8424627, 0.5631839, 1, 1, 1, 1, 1,
1.9448, 0.3144583, 0.1779897, 1, 1, 1, 1, 1,
1.955411, 1.448083, 0.7855951, 1, 1, 1, 1, 1,
1.968613, -0.355477, 1.176246, 1, 1, 1, 1, 1,
1.969978, 2.160011, 0.7168967, 0, 0, 1, 1, 1,
1.973414, -0.605141, 2.333833, 1, 0, 0, 1, 1,
1.975364, 1.587571, 1.201947, 1, 0, 0, 1, 1,
1.99553, 1.245071, 2.212816, 1, 0, 0, 1, 1,
2.029349, 1.114684, 1.552104, 1, 0, 0, 1, 1,
2.034576, -0.491277, 4.053809, 1, 0, 0, 1, 1,
2.036889, 0.3102272, 1.896838, 0, 0, 0, 1, 1,
2.078434, 2.032557, 1.458993, 0, 0, 0, 1, 1,
2.080282, -0.8034908, 0.554163, 0, 0, 0, 1, 1,
2.11887, 0.9600363, 1.179621, 0, 0, 0, 1, 1,
2.191164, -0.1493037, 1.786538, 0, 0, 0, 1, 1,
2.217704, 2.61487, -0.4394197, 0, 0, 0, 1, 1,
2.251538, -1.006714, 3.724256, 0, 0, 0, 1, 1,
2.264806, -1.68887, 2.785587, 1, 1, 1, 1, 1,
2.28024, -0.8601247, 3.100041, 1, 1, 1, 1, 1,
2.402411, -0.4693824, 2.729303, 1, 1, 1, 1, 1,
2.464748, -0.5615667, 2.357949, 1, 1, 1, 1, 1,
2.890274, 0.3022883, 2.295873, 1, 1, 1, 1, 1,
2.952955, -0.5070384, 4.055348, 1, 1, 1, 1, 1,
3.200963, -0.1955784, 1.613697, 1, 1, 1, 1, 1
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
var radius = 9.670975;
var distance = 33.96889;
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
mvMatrix.translate( -0.02397799, 0.2353575, 0.04875374 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96889);
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
