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
-3.012006, -0.00266832, -2.096927, 1, 0, 0, 1,
-2.987569, -1.225785, 0.2884605, 1, 0.007843138, 0, 1,
-2.821451, 1.552913, -3.168585, 1, 0.01176471, 0, 1,
-2.709951, 0.9896547, 0.2638453, 1, 0.01960784, 0, 1,
-2.695966, -0.8086435, -2.577079, 1, 0.02352941, 0, 1,
-2.681978, -0.4049176, -3.495029, 1, 0.03137255, 0, 1,
-2.513771, 0.06654366, -2.184571, 1, 0.03529412, 0, 1,
-2.471318, 2.684894, -1.696982, 1, 0.04313726, 0, 1,
-2.4411, 1.398353, -1.1795, 1, 0.04705882, 0, 1,
-2.390965, 1.09076, -2.218791, 1, 0.05490196, 0, 1,
-2.32071, 0.2342033, -0.486144, 1, 0.05882353, 0, 1,
-2.28971, 0.8252955, -0.7865348, 1, 0.06666667, 0, 1,
-2.274022, 0.8108194, -0.06736293, 1, 0.07058824, 0, 1,
-2.249293, -0.3348401, -1.118585, 1, 0.07843138, 0, 1,
-2.175045, -0.06012028, -1.85744, 1, 0.08235294, 0, 1,
-2.138315, 0.3501645, -1.327644, 1, 0.09019608, 0, 1,
-2.126395, -0.4417813, -1.232227, 1, 0.09411765, 0, 1,
-2.123683, -0.7962546, -4.121133, 1, 0.1019608, 0, 1,
-2.116067, 1.023141, -0.7385992, 1, 0.1098039, 0, 1,
-2.099055, -0.4074109, -1.552685, 1, 0.1137255, 0, 1,
-2.077427, 0.6276798, -1.921583, 1, 0.1215686, 0, 1,
-2.06643, -1.095527, -2.559299, 1, 0.1254902, 0, 1,
-2.047297, 0.1120546, -1.734582, 1, 0.1333333, 0, 1,
-2.002524, -0.2165594, -1.740555, 1, 0.1372549, 0, 1,
-1.996398, -1.767931, -2.768048, 1, 0.145098, 0, 1,
-1.990578, -1.612622, -0.8483338, 1, 0.1490196, 0, 1,
-1.982522, 1.865111, 0.0672301, 1, 0.1568628, 0, 1,
-1.965775, 0.4368391, -1.068864, 1, 0.1607843, 0, 1,
-1.953593, 1.30108, -0.5713704, 1, 0.1686275, 0, 1,
-1.9387, -0.5358769, -2.844179, 1, 0.172549, 0, 1,
-1.908061, -0.3130322, -1.68229, 1, 0.1803922, 0, 1,
-1.89903, -2.942175, -3.227803, 1, 0.1843137, 0, 1,
-1.87151, 1.213417, -0.02975305, 1, 0.1921569, 0, 1,
-1.866859, -1.888214, -2.858494, 1, 0.1960784, 0, 1,
-1.860803, 1.125325, -0.7410802, 1, 0.2039216, 0, 1,
-1.853822, -0.6964833, -1.543794, 1, 0.2117647, 0, 1,
-1.850847, -0.6046995, -2.33603, 1, 0.2156863, 0, 1,
-1.848454, -0.9264101, -1.919386, 1, 0.2235294, 0, 1,
-1.837209, 0.6727778, -1.172252, 1, 0.227451, 0, 1,
-1.801759, 0.3651564, -3.100915, 1, 0.2352941, 0, 1,
-1.79065, 0.9595259, 1.001701, 1, 0.2392157, 0, 1,
-1.785258, 0.2200333, -1.480003, 1, 0.2470588, 0, 1,
-1.76815, 1.349022, 0.1337272, 1, 0.2509804, 0, 1,
-1.762357, 0.7202362, -1.356287, 1, 0.2588235, 0, 1,
-1.738241, -1.976957, -1.928604, 1, 0.2627451, 0, 1,
-1.734477, 0.1911661, -0.4384678, 1, 0.2705882, 0, 1,
-1.72805, -1.813048, -2.763846, 1, 0.2745098, 0, 1,
-1.707473, 1.88008, 1.940232, 1, 0.282353, 0, 1,
-1.703338, 0.6223336, -2.127802, 1, 0.2862745, 0, 1,
-1.700629, -0.4634188, -3.351604, 1, 0.2941177, 0, 1,
-1.690728, -0.5341833, -1.289137, 1, 0.3019608, 0, 1,
-1.677553, 1.676124, -0.7283214, 1, 0.3058824, 0, 1,
-1.674314, 1.47954, -0.7080922, 1, 0.3137255, 0, 1,
-1.670439, -1.074889, -2.257752, 1, 0.3176471, 0, 1,
-1.660682, -1.275486, -2.358051, 1, 0.3254902, 0, 1,
-1.660324, 0.0649202, -1.323198, 1, 0.3294118, 0, 1,
-1.652114, -2.231023, -1.888544, 1, 0.3372549, 0, 1,
-1.650264, 0.1402811, -0.5322183, 1, 0.3411765, 0, 1,
-1.641818, -0.7185043, -3.641007, 1, 0.3490196, 0, 1,
-1.637453, 1.454221, 0.1531224, 1, 0.3529412, 0, 1,
-1.63226, -1.052419, -1.175419, 1, 0.3607843, 0, 1,
-1.631111, 0.7786496, -0.6531033, 1, 0.3647059, 0, 1,
-1.618149, 0.2851337, -0.999353, 1, 0.372549, 0, 1,
-1.617139, -0.02392216, -0.8746173, 1, 0.3764706, 0, 1,
-1.612942, 0.149846, -1.611772, 1, 0.3843137, 0, 1,
-1.590476, -0.2403672, -2.400771, 1, 0.3882353, 0, 1,
-1.58717, -0.3490547, -2.428519, 1, 0.3960784, 0, 1,
-1.585173, 1.422458, -0.5708398, 1, 0.4039216, 0, 1,
-1.584341, 0.353327, -1.977778, 1, 0.4078431, 0, 1,
-1.577899, -0.6340466, -0.7125474, 1, 0.4156863, 0, 1,
-1.573072, 2.876792, -0.616662, 1, 0.4196078, 0, 1,
-1.56523, 1.534563, -0.8433724, 1, 0.427451, 0, 1,
-1.538884, -0.9083714, -2.948064, 1, 0.4313726, 0, 1,
-1.510301, -2.143578, 0.7514413, 1, 0.4392157, 0, 1,
-1.506982, 0.3651501, -1.386748, 1, 0.4431373, 0, 1,
-1.506333, 0.802954, -2.962757, 1, 0.4509804, 0, 1,
-1.473357, -0.9968119, -2.843103, 1, 0.454902, 0, 1,
-1.454632, -0.6934222, -2.992623, 1, 0.4627451, 0, 1,
-1.445935, 0.1189856, -0.4946258, 1, 0.4666667, 0, 1,
-1.442859, -1.370237, -3.40824, 1, 0.4745098, 0, 1,
-1.431617, 0.2132653, -0.7804874, 1, 0.4784314, 0, 1,
-1.424644, -0.6438603, -2.022057, 1, 0.4862745, 0, 1,
-1.421023, 0.3557912, -2.17611, 1, 0.4901961, 0, 1,
-1.406434, -1.458022, -3.990806, 1, 0.4980392, 0, 1,
-1.400045, -0.2753971, -2.183755, 1, 0.5058824, 0, 1,
-1.386114, -1.072325, -1.374169, 1, 0.509804, 0, 1,
-1.3817, 1.015578, -1.014269, 1, 0.5176471, 0, 1,
-1.380361, -0.7195746, -1.747929, 1, 0.5215687, 0, 1,
-1.370763, -0.584562, -1.346246, 1, 0.5294118, 0, 1,
-1.369102, -2.123942, -3.913383, 1, 0.5333334, 0, 1,
-1.361963, 0.05075823, -0.6260248, 1, 0.5411765, 0, 1,
-1.360213, 0.5652577, -0.248313, 1, 0.5450981, 0, 1,
-1.358754, -1.571261, -1.915341, 1, 0.5529412, 0, 1,
-1.34974, 1.521396, -0.3775393, 1, 0.5568628, 0, 1,
-1.349635, -0.1008746, -3.586962, 1, 0.5647059, 0, 1,
-1.3318, 0.1754417, -2.629534, 1, 0.5686275, 0, 1,
-1.325558, -0.1097113, -1.919772, 1, 0.5764706, 0, 1,
-1.309597, -2.691057, -1.900138, 1, 0.5803922, 0, 1,
-1.308931, -0.9097614, -1.953456, 1, 0.5882353, 0, 1,
-1.302702, -0.1141177, -1.014734, 1, 0.5921569, 0, 1,
-1.30183, 0.142643, 0.1653329, 1, 0.6, 0, 1,
-1.300941, -1.953605, -2.581316, 1, 0.6078432, 0, 1,
-1.299515, 0.5898005, -0.9513366, 1, 0.6117647, 0, 1,
-1.291802, 2.812013, -1.203667, 1, 0.6196079, 0, 1,
-1.291167, 0.1214481, -2.806549, 1, 0.6235294, 0, 1,
-1.290306, -1.890286, -2.508106, 1, 0.6313726, 0, 1,
-1.287972, -2.097804, -2.795529, 1, 0.6352941, 0, 1,
-1.27626, -1.335941, -0.3940074, 1, 0.6431373, 0, 1,
-1.275888, 1.220906, -0.09687594, 1, 0.6470588, 0, 1,
-1.274852, -2.041229, -0.7218883, 1, 0.654902, 0, 1,
-1.269913, 1.417261, -0.5495417, 1, 0.6588235, 0, 1,
-1.266178, 1.102457, -1.84763, 1, 0.6666667, 0, 1,
-1.260853, 1.392997, -0.3467198, 1, 0.6705883, 0, 1,
-1.255383, -0.3957614, -3.324021, 1, 0.6784314, 0, 1,
-1.254529, 0.598821, -1.901493, 1, 0.682353, 0, 1,
-1.251605, -0.742527, -0.8710965, 1, 0.6901961, 0, 1,
-1.226833, 1.69044, -0.2057064, 1, 0.6941177, 0, 1,
-1.224339, -0.4006415, -2.555899, 1, 0.7019608, 0, 1,
-1.222253, 0.6034179, -1.163679, 1, 0.7098039, 0, 1,
-1.217768, 0.3784687, -0.6721001, 1, 0.7137255, 0, 1,
-1.215081, -0.3065756, -3.19783, 1, 0.7215686, 0, 1,
-1.202135, 0.06657931, -1.506708, 1, 0.7254902, 0, 1,
-1.197204, -1.789483, -0.3547255, 1, 0.7333333, 0, 1,
-1.189613, 0.2050399, -2.375311, 1, 0.7372549, 0, 1,
-1.18568, 0.8073749, 0.7004414, 1, 0.7450981, 0, 1,
-1.183775, 0.9253623, 0.08657477, 1, 0.7490196, 0, 1,
-1.181562, -2.284863, -2.951862, 1, 0.7568628, 0, 1,
-1.169394, 1.506855, 1.066848, 1, 0.7607843, 0, 1,
-1.144647, 1.199878, -0.6576468, 1, 0.7686275, 0, 1,
-1.141367, 0.4248469, 0.06288363, 1, 0.772549, 0, 1,
-1.141033, 0.1598123, -0.4007646, 1, 0.7803922, 0, 1,
-1.134296, 2.149179, -0.9860042, 1, 0.7843137, 0, 1,
-1.133744, 0.08053245, -1.244326, 1, 0.7921569, 0, 1,
-1.133375, 1.0931, -0.129206, 1, 0.7960784, 0, 1,
-1.130062, -0.4943673, -1.680283, 1, 0.8039216, 0, 1,
-1.105162, -0.3980065, -1.879641, 1, 0.8117647, 0, 1,
-1.103037, 0.4662845, -0.5036671, 1, 0.8156863, 0, 1,
-1.098193, -1.290481, -2.786064, 1, 0.8235294, 0, 1,
-1.08462, 0.1260698, -1.812728, 1, 0.827451, 0, 1,
-1.082455, -0.2812789, -2.507473, 1, 0.8352941, 0, 1,
-1.080453, -0.2504297, -2.227505, 1, 0.8392157, 0, 1,
-1.078983, -0.07396589, -1.050545, 1, 0.8470588, 0, 1,
-1.078072, 0.4630075, 0.2207687, 1, 0.8509804, 0, 1,
-1.06225, 1.443038, -1.053702, 1, 0.8588235, 0, 1,
-1.061442, -0.2159195, -3.599448, 1, 0.8627451, 0, 1,
-1.056389, -2.781835, -3.174025, 1, 0.8705882, 0, 1,
-1.05025, 0.8916785, -2.032073, 1, 0.8745098, 0, 1,
-1.042838, -0.128082, -2.768047, 1, 0.8823529, 0, 1,
-1.041938, 0.5804434, -1.342171, 1, 0.8862745, 0, 1,
-1.041672, 0.4041345, -0.7738962, 1, 0.8941177, 0, 1,
-1.041029, -0.5570247, 0.03565367, 1, 0.8980392, 0, 1,
-1.026401, -0.675108, -2.748099, 1, 0.9058824, 0, 1,
-1.014657, 0.4054152, -0.8391286, 1, 0.9137255, 0, 1,
-1.014441, -0.4016814, -0.05509972, 1, 0.9176471, 0, 1,
-1.008268, 0.9544846, 1.236796, 1, 0.9254902, 0, 1,
-1.003422, -0.3952797, -1.928592, 1, 0.9294118, 0, 1,
-1.002416, 0.04899752, -1.412522, 1, 0.9372549, 0, 1,
-1.001192, 0.6837735, -0.4993024, 1, 0.9411765, 0, 1,
-0.9999261, 1.205713, -2.294594, 1, 0.9490196, 0, 1,
-0.9928517, 0.2871013, -1.277067, 1, 0.9529412, 0, 1,
-0.9913448, 1.352942, -0.1391974, 1, 0.9607843, 0, 1,
-0.9897316, -0.2296, -2.488668, 1, 0.9647059, 0, 1,
-0.9791524, -2.454169, -3.48268, 1, 0.972549, 0, 1,
-0.9791163, -0.4435499, -3.275277, 1, 0.9764706, 0, 1,
-0.9777063, -0.6205309, -1.310255, 1, 0.9843137, 0, 1,
-0.9567479, -1.057044, -1.104389, 1, 0.9882353, 0, 1,
-0.9513945, 0.05956497, -0.9037516, 1, 0.9960784, 0, 1,
-0.9460074, 0.1465923, -3.195109, 0.9960784, 1, 0, 1,
-0.941997, 1.916639, -0.9417819, 0.9921569, 1, 0, 1,
-0.9352788, 0.914027, 0.02603802, 0.9843137, 1, 0, 1,
-0.9348171, 1.642412, 1.369708, 0.9803922, 1, 0, 1,
-0.9283562, 0.7360311, -0.5828449, 0.972549, 1, 0, 1,
-0.9254926, -1.210491, -1.433743, 0.9686275, 1, 0, 1,
-0.9236249, 2.265875, -0.315147, 0.9607843, 1, 0, 1,
-0.9206411, 1.779278, -0.6031566, 0.9568627, 1, 0, 1,
-0.9139683, 0.7439126, -0.5098271, 0.9490196, 1, 0, 1,
-0.9105558, -0.7779531, -1.34661, 0.945098, 1, 0, 1,
-0.9091652, 1.404751, 0.199876, 0.9372549, 1, 0, 1,
-0.9033079, 0.5791361, -0.7627236, 0.9333333, 1, 0, 1,
-0.9022809, -1.898962, -4.179356, 0.9254902, 1, 0, 1,
-0.8959025, -0.5253634, -1.430337, 0.9215686, 1, 0, 1,
-0.8953521, -1.947333, -3.437632, 0.9137255, 1, 0, 1,
-0.8940174, -2.865991, -2.438823, 0.9098039, 1, 0, 1,
-0.8924429, -1.002368, -2.079278, 0.9019608, 1, 0, 1,
-0.8923433, -1.477148, -2.969855, 0.8941177, 1, 0, 1,
-0.8887144, -0.4190932, -0.7556187, 0.8901961, 1, 0, 1,
-0.8867253, -0.1006015, -2.024956, 0.8823529, 1, 0, 1,
-0.8852478, 0.6590989, 0.4540215, 0.8784314, 1, 0, 1,
-0.8842084, 0.6146445, 0.7297619, 0.8705882, 1, 0, 1,
-0.8600623, -0.425754, -1.524612, 0.8666667, 1, 0, 1,
-0.8584133, 0.5665918, 0.5237283, 0.8588235, 1, 0, 1,
-0.8565236, 0.4198947, -1.743186, 0.854902, 1, 0, 1,
-0.8531847, 1.009776, -0.718998, 0.8470588, 1, 0, 1,
-0.8517712, -1.041461, -2.281249, 0.8431373, 1, 0, 1,
-0.8502572, 0.7546613, 0.6649163, 0.8352941, 1, 0, 1,
-0.849701, -0.597775, -0.4842178, 0.8313726, 1, 0, 1,
-0.8459973, -0.3072014, -0.9697467, 0.8235294, 1, 0, 1,
-0.8456715, -1.109945, -3.099685, 0.8196079, 1, 0, 1,
-0.8418335, 1.139952, -0.5593469, 0.8117647, 1, 0, 1,
-0.8391393, 0.5105853, -0.5593272, 0.8078431, 1, 0, 1,
-0.8385642, 0.7809442, 0.2830269, 0.8, 1, 0, 1,
-0.8371112, -2.329917, -3.475663, 0.7921569, 1, 0, 1,
-0.8312507, -0.8526713, -3.348425, 0.7882353, 1, 0, 1,
-0.8277934, -0.04814892, -2.408701, 0.7803922, 1, 0, 1,
-0.8176296, 1.680855, -0.5985073, 0.7764706, 1, 0, 1,
-0.8102121, 1.7627, -0.9315045, 0.7686275, 1, 0, 1,
-0.809659, 1.032752, -1.342727, 0.7647059, 1, 0, 1,
-0.8058671, -1.704446, -2.548587, 0.7568628, 1, 0, 1,
-0.8037532, 0.119091, -1.321382, 0.7529412, 1, 0, 1,
-0.799594, 1.3738, -0.9989514, 0.7450981, 1, 0, 1,
-0.7976967, -0.6023818, -1.437896, 0.7411765, 1, 0, 1,
-0.7901578, -1.118206, -3.04591, 0.7333333, 1, 0, 1,
-0.7896256, -1.844494, -3.358186, 0.7294118, 1, 0, 1,
-0.7865853, 0.3677269, -1.028573, 0.7215686, 1, 0, 1,
-0.7842336, 1.076919, -1.823521, 0.7176471, 1, 0, 1,
-0.7833511, 0.3642453, -1.024398, 0.7098039, 1, 0, 1,
-0.7823517, -0.327673, -2.123538, 0.7058824, 1, 0, 1,
-0.7757698, -0.05182834, -1.193187, 0.6980392, 1, 0, 1,
-0.7756432, -0.7276554, -2.807665, 0.6901961, 1, 0, 1,
-0.7746652, 1.053178, -0.3248824, 0.6862745, 1, 0, 1,
-0.7687792, 1.059182, -3.184984, 0.6784314, 1, 0, 1,
-0.7603297, -0.9941893, -2.446262, 0.6745098, 1, 0, 1,
-0.7506401, -0.479834, -4.090329, 0.6666667, 1, 0, 1,
-0.7483841, 0.5463801, -0.3483762, 0.6627451, 1, 0, 1,
-0.7478542, -0.01329225, -2.713734, 0.654902, 1, 0, 1,
-0.7437674, 0.2041267, -0.4891365, 0.6509804, 1, 0, 1,
-0.7401382, -0.1849625, -2.262749, 0.6431373, 1, 0, 1,
-0.7391608, -0.4998661, -1.019946, 0.6392157, 1, 0, 1,
-0.7384177, 0.6706246, -2.616921, 0.6313726, 1, 0, 1,
-0.7379414, 0.4883949, -1.632076, 0.627451, 1, 0, 1,
-0.7355927, 0.4985633, -3.054281, 0.6196079, 1, 0, 1,
-0.7310468, 0.6614016, -0.8617634, 0.6156863, 1, 0, 1,
-0.728844, 0.2648635, -1.493811, 0.6078432, 1, 0, 1,
-0.727547, -1.193112, -3.401196, 0.6039216, 1, 0, 1,
-0.7256643, -0.4123832, -2.102381, 0.5960785, 1, 0, 1,
-0.7232443, -0.7897418, -1.304349, 0.5882353, 1, 0, 1,
-0.7162679, 0.5538915, -1.744726, 0.5843138, 1, 0, 1,
-0.7158565, 0.1737188, -0.6600696, 0.5764706, 1, 0, 1,
-0.715781, -1.104147, -3.924455, 0.572549, 1, 0, 1,
-0.7125784, 1.27113, -0.6131586, 0.5647059, 1, 0, 1,
-0.7078298, -2.238875, -2.979986, 0.5607843, 1, 0, 1,
-0.7070668, -1.222797, -2.150235, 0.5529412, 1, 0, 1,
-0.7053027, -0.3391836, -1.613167, 0.5490196, 1, 0, 1,
-0.702622, -0.1823775, -1.407405, 0.5411765, 1, 0, 1,
-0.7024395, 0.7071887, -0.4535767, 0.5372549, 1, 0, 1,
-0.7019893, -1.374581, -1.572907, 0.5294118, 1, 0, 1,
-0.6970819, 0.6794631, -0.20941, 0.5254902, 1, 0, 1,
-0.6949992, 0.4044045, -1.194009, 0.5176471, 1, 0, 1,
-0.6944688, 0.3453705, -2.869602, 0.5137255, 1, 0, 1,
-0.6943118, 0.7240364, -1.734736, 0.5058824, 1, 0, 1,
-0.6879591, 1.430338, 1.027575, 0.5019608, 1, 0, 1,
-0.6833981, 0.3864786, -1.091831, 0.4941176, 1, 0, 1,
-0.6734955, -0.4235401, -2.304772, 0.4862745, 1, 0, 1,
-0.6728492, -1.014603, -2.628156, 0.4823529, 1, 0, 1,
-0.6722697, -0.7158621, -3.203206, 0.4745098, 1, 0, 1,
-0.6718001, 1.487478, -0.6554829, 0.4705882, 1, 0, 1,
-0.6676911, -1.129682, -4.288243, 0.4627451, 1, 0, 1,
-0.6655995, 0.8360003, 0.5556256, 0.4588235, 1, 0, 1,
-0.665215, 1.079186, -0.07027433, 0.4509804, 1, 0, 1,
-0.6556944, -1.029117, -1.733308, 0.4470588, 1, 0, 1,
-0.6552761, -0.09337666, -3.05395, 0.4392157, 1, 0, 1,
-0.6503628, -0.4063093, -3.888221, 0.4352941, 1, 0, 1,
-0.6457503, 0.307632, -0.9477625, 0.427451, 1, 0, 1,
-0.6420975, -0.8571081, -0.3321702, 0.4235294, 1, 0, 1,
-0.6367429, 0.5705037, -2.76732, 0.4156863, 1, 0, 1,
-0.6366603, -1.021495, -3.18944, 0.4117647, 1, 0, 1,
-0.6277609, 2.174827, -0.4233648, 0.4039216, 1, 0, 1,
-0.6268775, -0.148408, -2.683179, 0.3960784, 1, 0, 1,
-0.6245003, 0.9845138, -0.5209829, 0.3921569, 1, 0, 1,
-0.6221193, 0.1504051, -1.460639, 0.3843137, 1, 0, 1,
-0.6179191, -1.23495, -3.212021, 0.3803922, 1, 0, 1,
-0.6129575, -1.407803, -4.822227, 0.372549, 1, 0, 1,
-0.6116267, 2.07501, -1.183185, 0.3686275, 1, 0, 1,
-0.6115542, 0.1504564, -2.077077, 0.3607843, 1, 0, 1,
-0.6109395, 1.063959, 1.346225, 0.3568628, 1, 0, 1,
-0.6103655, -0.6960897, -1.191228, 0.3490196, 1, 0, 1,
-0.6092801, 0.6529128, -1.179227, 0.345098, 1, 0, 1,
-0.6063874, 0.64461, -1.76024, 0.3372549, 1, 0, 1,
-0.6060283, 1.500236, -1.806599, 0.3333333, 1, 0, 1,
-0.6035286, -2.718569, -2.360526, 0.3254902, 1, 0, 1,
-0.6032553, -0.1367144, -2.110743, 0.3215686, 1, 0, 1,
-0.6020055, 0.6682842, 0.6576842, 0.3137255, 1, 0, 1,
-0.5957708, -1.384303, -3.238298, 0.3098039, 1, 0, 1,
-0.5915846, -0.02857595, -1.300495, 0.3019608, 1, 0, 1,
-0.5896947, -0.1956153, -2.644258, 0.2941177, 1, 0, 1,
-0.5867472, 2.725954, 0.8995158, 0.2901961, 1, 0, 1,
-0.580779, 1.059339, -1.144207, 0.282353, 1, 0, 1,
-0.5792655, 0.2716522, -2.672104, 0.2784314, 1, 0, 1,
-0.5785174, 0.324378, -0.9716787, 0.2705882, 1, 0, 1,
-0.5720364, -0.2297695, -1.164773, 0.2666667, 1, 0, 1,
-0.5667271, 0.9454241, -0.4531648, 0.2588235, 1, 0, 1,
-0.5663033, -1.057048, -0.8828475, 0.254902, 1, 0, 1,
-0.5627546, -1.081545, -2.179965, 0.2470588, 1, 0, 1,
-0.5623944, 0.1114878, -1.149747, 0.2431373, 1, 0, 1,
-0.5623021, 2.286399, 1.298934, 0.2352941, 1, 0, 1,
-0.5608045, 0.0617059, -1.684435, 0.2313726, 1, 0, 1,
-0.5607347, 1.980467, -1.276589, 0.2235294, 1, 0, 1,
-0.555591, 0.8489133, 1.03692, 0.2196078, 1, 0, 1,
-0.5523123, 2.004257, 0.8344339, 0.2117647, 1, 0, 1,
-0.549547, -1.169919, -1.676293, 0.2078431, 1, 0, 1,
-0.5436318, -1.299984, -2.041604, 0.2, 1, 0, 1,
-0.5405569, -0.6880984, -3.709965, 0.1921569, 1, 0, 1,
-0.538018, 0.4923143, 0.9256607, 0.1882353, 1, 0, 1,
-0.5356588, 0.2114247, -1.279336, 0.1803922, 1, 0, 1,
-0.5270221, 1.439251, 0.4427501, 0.1764706, 1, 0, 1,
-0.5265725, -0.5300297, -3.049128, 0.1686275, 1, 0, 1,
-0.5256224, 0.6577924, -3.334643, 0.1647059, 1, 0, 1,
-0.5246471, 0.05231569, -2.261888, 0.1568628, 1, 0, 1,
-0.5227016, -1.269439, -2.523855, 0.1529412, 1, 0, 1,
-0.5183837, -0.1513204, -1.472144, 0.145098, 1, 0, 1,
-0.5173704, 0.7556404, -2.550938, 0.1411765, 1, 0, 1,
-0.5171394, -0.4547246, -1.066332, 0.1333333, 1, 0, 1,
-0.5153106, -0.2093073, -2.126654, 0.1294118, 1, 0, 1,
-0.5152075, -0.24931, -1.635887, 0.1215686, 1, 0, 1,
-0.5126697, -0.4900511, -1.391291, 0.1176471, 1, 0, 1,
-0.5061049, -0.4431003, -1.560912, 0.1098039, 1, 0, 1,
-0.5018756, -0.001012873, -1.923988, 0.1058824, 1, 0, 1,
-0.4914879, -0.7256034, -2.016501, 0.09803922, 1, 0, 1,
-0.4896842, 0.3136381, -1.170798, 0.09019608, 1, 0, 1,
-0.4896213, 0.9529093, -1.407937, 0.08627451, 1, 0, 1,
-0.4785589, 1.03053, -0.9044945, 0.07843138, 1, 0, 1,
-0.4776189, 1.096101, -0.4879165, 0.07450981, 1, 0, 1,
-0.4768727, 1.197595, -0.9751666, 0.06666667, 1, 0, 1,
-0.473118, -1.167745, -2.723084, 0.0627451, 1, 0, 1,
-0.4704359, -0.9752695, -1.546766, 0.05490196, 1, 0, 1,
-0.4702059, 1.515597, 0.5083486, 0.05098039, 1, 0, 1,
-0.4695896, -0.528849, -1.378067, 0.04313726, 1, 0, 1,
-0.4692358, -0.8022501, -4.2688, 0.03921569, 1, 0, 1,
-0.4691325, 0.9215749, -1.763058, 0.03137255, 1, 0, 1,
-0.4626756, -0.484449, -4.271457, 0.02745098, 1, 0, 1,
-0.4597893, -0.6465917, -1.274214, 0.01960784, 1, 0, 1,
-0.4574842, -0.9304509, -2.686246, 0.01568628, 1, 0, 1,
-0.452082, -0.8797048, -3.42491, 0.007843138, 1, 0, 1,
-0.4511878, 0.2153944, 1.40087, 0.003921569, 1, 0, 1,
-0.4503661, 1.908165, -1.001445, 0, 1, 0.003921569, 1,
-0.4499744, -0.8798333, -3.430291, 0, 1, 0.01176471, 1,
-0.4424951, -0.2031304, -2.692419, 0, 1, 0.01568628, 1,
-0.4367373, 0.09411186, -1.661279, 0, 1, 0.02352941, 1,
-0.4346902, -0.7631043, -3.968271, 0, 1, 0.02745098, 1,
-0.4342977, -0.5093822, -3.313846, 0, 1, 0.03529412, 1,
-0.4211095, 0.1629729, -0.924233, 0, 1, 0.03921569, 1,
-0.4182721, 0.6131842, 0.4047025, 0, 1, 0.04705882, 1,
-0.4171247, -0.290718, -1.181458, 0, 1, 0.05098039, 1,
-0.4143724, -0.1686489, -1.25517, 0, 1, 0.05882353, 1,
-0.4130625, -0.07696786, -1.386668, 0, 1, 0.0627451, 1,
-0.4113459, -1.332132, -1.498345, 0, 1, 0.07058824, 1,
-0.4093977, 0.3783975, 0.6252285, 0, 1, 0.07450981, 1,
-0.4074483, -1.023813, -1.755873, 0, 1, 0.08235294, 1,
-0.4039139, 0.4613128, -0.1413508, 0, 1, 0.08627451, 1,
-0.4000663, 0.3835723, -3.891526, 0, 1, 0.09411765, 1,
-0.3986418, 0.1272986, -0.172941, 0, 1, 0.1019608, 1,
-0.396677, 1.950186, -1.015908, 0, 1, 0.1058824, 1,
-0.3955061, -0.2718567, -1.371338, 0, 1, 0.1137255, 1,
-0.3875001, -0.4737307, 0.14594, 0, 1, 0.1176471, 1,
-0.3845269, -0.3455197, -2.280765, 0, 1, 0.1254902, 1,
-0.3825521, -1.774947, -1.466776, 0, 1, 0.1294118, 1,
-0.380557, 1.481811, -0.2397427, 0, 1, 0.1372549, 1,
-0.3803891, -0.8129027, -2.87219, 0, 1, 0.1411765, 1,
-0.3791468, 1.728522, -1.084214, 0, 1, 0.1490196, 1,
-0.3775529, 1.19735, 0.2261967, 0, 1, 0.1529412, 1,
-0.3772983, -0.9977042, -1.294891, 0, 1, 0.1607843, 1,
-0.3704396, -0.5640911, -3.081949, 0, 1, 0.1647059, 1,
-0.3624, 0.1990231, -0.5821041, 0, 1, 0.172549, 1,
-0.3618061, 0.7082825, 0.752527, 0, 1, 0.1764706, 1,
-0.3542484, 1.267631, 0.8260958, 0, 1, 0.1843137, 1,
-0.3465954, 1.335251, 0.5269192, 0, 1, 0.1882353, 1,
-0.3455717, 2.250136, 0.4330918, 0, 1, 0.1960784, 1,
-0.3425191, 0.05508697, -3.201855, 0, 1, 0.2039216, 1,
-0.3385543, -0.1426702, -0.4580036, 0, 1, 0.2078431, 1,
-0.3374468, -0.09471145, -0.9646389, 0, 1, 0.2156863, 1,
-0.3329411, -0.09822688, -2.693926, 0, 1, 0.2196078, 1,
-0.328781, 1.362968, -0.0621158, 0, 1, 0.227451, 1,
-0.3224839, -0.2496769, -2.847549, 0, 1, 0.2313726, 1,
-0.322125, -0.2445571, -3.301706, 0, 1, 0.2392157, 1,
-0.321468, 0.27062, -1.085011, 0, 1, 0.2431373, 1,
-0.3144023, -0.4131329, -1.086675, 0, 1, 0.2509804, 1,
-0.3114275, 3.16359, -0.1495579, 0, 1, 0.254902, 1,
-0.3081871, -1.487662, -2.777572, 0, 1, 0.2627451, 1,
-0.3027775, -0.1877774, -1.154146, 0, 1, 0.2666667, 1,
-0.3012603, -1.021887, -3.440076, 0, 1, 0.2745098, 1,
-0.2950773, 0.757176, 0.3902571, 0, 1, 0.2784314, 1,
-0.2943992, 0.2934243, 0.3227936, 0, 1, 0.2862745, 1,
-0.2899483, 0.4780083, 0.3864477, 0, 1, 0.2901961, 1,
-0.2874802, -0.9695208, -1.233701, 0, 1, 0.2980392, 1,
-0.2836706, 0.3366399, -0.4981578, 0, 1, 0.3058824, 1,
-0.2797051, -0.1661826, -2.41053, 0, 1, 0.3098039, 1,
-0.2784259, 0.0009245881, -2.358206, 0, 1, 0.3176471, 1,
-0.2759399, 0.7141739, -1.185714, 0, 1, 0.3215686, 1,
-0.2744475, -0.5351922, -3.857432, 0, 1, 0.3294118, 1,
-0.2721974, -2.751897, -3.566808, 0, 1, 0.3333333, 1,
-0.2719987, -0.02357556, -2.336914, 0, 1, 0.3411765, 1,
-0.2673884, 0.1885514, -2.220867, 0, 1, 0.345098, 1,
-0.2638249, 1.274172, -1.036649, 0, 1, 0.3529412, 1,
-0.2635267, 1.361119, 0.3909644, 0, 1, 0.3568628, 1,
-0.26283, 0.3038889, -3.682581, 0, 1, 0.3647059, 1,
-0.2511073, 0.6979674, -0.8072525, 0, 1, 0.3686275, 1,
-0.2491466, -1.397707, -1.769697, 0, 1, 0.3764706, 1,
-0.2491197, 1.516986, 0.640274, 0, 1, 0.3803922, 1,
-0.2411161, 0.8303152, -0.9746038, 0, 1, 0.3882353, 1,
-0.2396807, -0.185097, -1.587621, 0, 1, 0.3921569, 1,
-0.2369189, 0.113422, -0.2903877, 0, 1, 0.4, 1,
-0.2321764, 0.9345216, -1.175682, 0, 1, 0.4078431, 1,
-0.2320254, 0.3728664, 0.5720292, 0, 1, 0.4117647, 1,
-0.2206717, 0.1602557, -0.8984563, 0, 1, 0.4196078, 1,
-0.2159482, 0.9715251, 0.5003178, 0, 1, 0.4235294, 1,
-0.2157314, -1.142847, -3.027943, 0, 1, 0.4313726, 1,
-0.2150052, -0.07623345, -0.3830766, 0, 1, 0.4352941, 1,
-0.2132502, -0.905462, -3.844562, 0, 1, 0.4431373, 1,
-0.2112447, -1.160717, -2.79456, 0, 1, 0.4470588, 1,
-0.2072901, -1.229385, -2.337533, 0, 1, 0.454902, 1,
-0.203508, -0.4324389, -3.810225, 0, 1, 0.4588235, 1,
-0.2007347, 0.5495896, 0.5740772, 0, 1, 0.4666667, 1,
-0.1968513, -1.007429, -2.842782, 0, 1, 0.4705882, 1,
-0.1861656, -1.392621, -3.51008, 0, 1, 0.4784314, 1,
-0.184747, -0.7862386, -2.500844, 0, 1, 0.4823529, 1,
-0.1836265, 1.078029, -1.136762, 0, 1, 0.4901961, 1,
-0.1740664, 0.9080095, -0.08148868, 0, 1, 0.4941176, 1,
-0.1728725, -0.2297572, -3.719824, 0, 1, 0.5019608, 1,
-0.1712674, 1.735767, -1.163694, 0, 1, 0.509804, 1,
-0.1709227, -1.469285, -3.149725, 0, 1, 0.5137255, 1,
-0.1694604, -0.3138233, -3.53313, 0, 1, 0.5215687, 1,
-0.1682945, -1.094682, -4.106559, 0, 1, 0.5254902, 1,
-0.1666418, -0.1562521, -1.461868, 0, 1, 0.5333334, 1,
-0.1639984, -0.2510729, -4.357152, 0, 1, 0.5372549, 1,
-0.1614621, 2.865041, -0.6976698, 0, 1, 0.5450981, 1,
-0.1607207, 0.7298453, -0.1339894, 0, 1, 0.5490196, 1,
-0.156467, -0.1714364, -2.473362, 0, 1, 0.5568628, 1,
-0.1549228, -1.176722, -4.232546, 0, 1, 0.5607843, 1,
-0.1447522, 0.8448913, 0.02709338, 0, 1, 0.5686275, 1,
-0.1361392, 0.133589, -0.554767, 0, 1, 0.572549, 1,
-0.1335053, 0.4308748, -0.06000999, 0, 1, 0.5803922, 1,
-0.1333863, -0.3014661, -4.121319, 0, 1, 0.5843138, 1,
-0.1329854, 1.377077, -0.1778537, 0, 1, 0.5921569, 1,
-0.1289107, 0.1898094, -0.4731789, 0, 1, 0.5960785, 1,
-0.1279251, -0.4028763, -3.797981, 0, 1, 0.6039216, 1,
-0.1253119, 1.600773, -0.3543324, 0, 1, 0.6117647, 1,
-0.1246789, 1.693606, -0.662944, 0, 1, 0.6156863, 1,
-0.1245217, 0.1139216, -2.119285, 0, 1, 0.6235294, 1,
-0.1241408, -0.9833159, -2.840216, 0, 1, 0.627451, 1,
-0.1201005, 0.5069373, -0.9473515, 0, 1, 0.6352941, 1,
-0.1185648, 0.8196784, -0.5864985, 0, 1, 0.6392157, 1,
-0.1170824, 0.5100453, 0.03997083, 0, 1, 0.6470588, 1,
-0.1160415, 0.6667863, -1.201263, 0, 1, 0.6509804, 1,
-0.1159626, -0.2306725, -3.60688, 0, 1, 0.6588235, 1,
-0.1105926, 0.2985461, -0.8703239, 0, 1, 0.6627451, 1,
-0.1083053, 1.237933, -1.559736, 0, 1, 0.6705883, 1,
-0.1067473, 1.085041, -1.69823, 0, 1, 0.6745098, 1,
-0.1051367, 1.073279, 0.3303981, 0, 1, 0.682353, 1,
-0.09648366, -1.804938, -2.081293, 0, 1, 0.6862745, 1,
-0.09456222, -0.1016307, -2.829341, 0, 1, 0.6941177, 1,
-0.08924629, -0.4758703, -3.152761, 0, 1, 0.7019608, 1,
-0.08501576, -0.05113733, -4.5395, 0, 1, 0.7058824, 1,
-0.08314509, -0.1345373, -1.427046, 0, 1, 0.7137255, 1,
-0.07650307, -0.3650521, -2.062557, 0, 1, 0.7176471, 1,
-0.06941318, 0.1280408, -2.121604, 0, 1, 0.7254902, 1,
-0.06935969, -0.8183207, -3.244983, 0, 1, 0.7294118, 1,
-0.06889123, -0.1128355, -3.143573, 0, 1, 0.7372549, 1,
-0.06114695, 1.490882, -1.231, 0, 1, 0.7411765, 1,
-0.05625765, 0.2473181, 0.8806689, 0, 1, 0.7490196, 1,
-0.05479956, -0.2820484, -2.511744, 0, 1, 0.7529412, 1,
-0.03936346, -1.03865, -3.34022, 0, 1, 0.7607843, 1,
-0.03901747, 0.1489951, -0.7374538, 0, 1, 0.7647059, 1,
-0.03762181, -0.5519465, -3.736708, 0, 1, 0.772549, 1,
-0.03446354, 1.489079, -0.9989134, 0, 1, 0.7764706, 1,
-0.03442099, -0.1818557, -1.498943, 0, 1, 0.7843137, 1,
-0.0324548, 0.9734917, 0.4061761, 0, 1, 0.7882353, 1,
-0.03104327, 1.597667, -0.6881249, 0, 1, 0.7960784, 1,
-0.02985979, 1.753019, -1.113248, 0, 1, 0.8039216, 1,
-0.02861299, 0.5819231, -0.05138658, 0, 1, 0.8078431, 1,
-0.0274304, 0.7331827, -0.2631063, 0, 1, 0.8156863, 1,
-0.02440467, -0.106734, -3.313079, 0, 1, 0.8196079, 1,
-0.02387559, 0.08644146, -0.7039612, 0, 1, 0.827451, 1,
-0.01949824, 0.1896908, -0.9613149, 0, 1, 0.8313726, 1,
-0.01352359, 0.7704118, 0.6485602, 0, 1, 0.8392157, 1,
-0.01283503, -0.2534918, -2.227417, 0, 1, 0.8431373, 1,
-0.008790021, -0.5025126, -1.6359, 0, 1, 0.8509804, 1,
-0.007985227, 0.2044657, -0.010648, 0, 1, 0.854902, 1,
-0.00248238, -0.03812391, -4.72946, 0, 1, 0.8627451, 1,
0.001791935, 0.08286191, -2.29929, 0, 1, 0.8666667, 1,
0.005419061, 0.7860537, -1.648522, 0, 1, 0.8745098, 1,
0.006168043, 0.2451177, 1.825908, 0, 1, 0.8784314, 1,
0.0064548, -0.3180353, 4.443706, 0, 1, 0.8862745, 1,
0.006908732, 0.03846825, 1.415921, 0, 1, 0.8901961, 1,
0.01075467, 0.7085521, -1.393385, 0, 1, 0.8980392, 1,
0.01484642, 0.3396401, 0.3444636, 0, 1, 0.9058824, 1,
0.01588922, -0.1719902, 3.356776, 0, 1, 0.9098039, 1,
0.01910709, -0.4214856, 3.404757, 0, 1, 0.9176471, 1,
0.02351268, -0.7966838, 1.147594, 0, 1, 0.9215686, 1,
0.02445829, -0.6637487, 3.927973, 0, 1, 0.9294118, 1,
0.02484588, -1.209753, 3.375889, 0, 1, 0.9333333, 1,
0.02845018, 1.057764, -1.533862, 0, 1, 0.9411765, 1,
0.03366267, -0.08407491, 5.113197, 0, 1, 0.945098, 1,
0.03705454, 0.3368807, -0.4991465, 0, 1, 0.9529412, 1,
0.03868585, -0.6949155, 3.225209, 0, 1, 0.9568627, 1,
0.0401301, 0.8657463, -1.332857, 0, 1, 0.9647059, 1,
0.0469127, -0.5138174, 2.797915, 0, 1, 0.9686275, 1,
0.04830905, 1.134675, -1.96317, 0, 1, 0.9764706, 1,
0.05257601, -0.7558063, 3.237352, 0, 1, 0.9803922, 1,
0.05745011, -0.4696477, 4.414509, 0, 1, 0.9882353, 1,
0.05936201, 1.060884, 0.5193119, 0, 1, 0.9921569, 1,
0.06091639, -1.012172, 2.445595, 0, 1, 1, 1,
0.06266198, 0.263814, 0.3983071, 0, 0.9921569, 1, 1,
0.06316812, 0.3257516, -0.7979949, 0, 0.9882353, 1, 1,
0.07254948, -1.107955, 2.893397, 0, 0.9803922, 1, 1,
0.07853904, -0.8040802, 3.010134, 0, 0.9764706, 1, 1,
0.07908141, -0.8333287, 2.451066, 0, 0.9686275, 1, 1,
0.08005287, -0.5383072, 2.83391, 0, 0.9647059, 1, 1,
0.08009075, 0.4720778, -0.415494, 0, 0.9568627, 1, 1,
0.08234325, -0.2990979, 1.80108, 0, 0.9529412, 1, 1,
0.08294018, -0.1793213, 2.764589, 0, 0.945098, 1, 1,
0.08447783, 0.3974945, 0.8388034, 0, 0.9411765, 1, 1,
0.08627067, 0.8968812, -0.7258446, 0, 0.9333333, 1, 1,
0.08680871, 0.5378773, -0.5970477, 0, 0.9294118, 1, 1,
0.08849715, -2.07648, 3.488143, 0, 0.9215686, 1, 1,
0.09228298, 1.049739, 2.025562, 0, 0.9176471, 1, 1,
0.09928417, -0.08508431, 2.863494, 0, 0.9098039, 1, 1,
0.1020535, -1.495771, 2.27612, 0, 0.9058824, 1, 1,
0.1043311, 0.4018753, 1.019729, 0, 0.8980392, 1, 1,
0.1099087, 1.151573, -0.2102072, 0, 0.8901961, 1, 1,
0.1112205, 0.8803266, -0.2182038, 0, 0.8862745, 1, 1,
0.1121555, -1.667765, 3.163584, 0, 0.8784314, 1, 1,
0.1126438, -0.4211071, 3.274231, 0, 0.8745098, 1, 1,
0.1155635, -0.2954499, 1.396421, 0, 0.8666667, 1, 1,
0.122171, -1.402209, 3.154371, 0, 0.8627451, 1, 1,
0.1274034, 1.737384, -0.6919401, 0, 0.854902, 1, 1,
0.1277929, -1.872609, 4.097101, 0, 0.8509804, 1, 1,
0.1291008, -1.597602, 4.945089, 0, 0.8431373, 1, 1,
0.1384489, 1.508053, 2.101392, 0, 0.8392157, 1, 1,
0.1399484, -0.3374913, 2.306347, 0, 0.8313726, 1, 1,
0.1430998, -0.0162628, 1.783259, 0, 0.827451, 1, 1,
0.1446668, -0.5529509, 4.835368, 0, 0.8196079, 1, 1,
0.1447463, -0.631274, 1.414337, 0, 0.8156863, 1, 1,
0.1462788, -3.644836, 2.950402, 0, 0.8078431, 1, 1,
0.1498963, -1.129664, 1.46965, 0, 0.8039216, 1, 1,
0.1510944, -1.217733, 2.854318, 0, 0.7960784, 1, 1,
0.15233, -1.521516, 2.869299, 0, 0.7882353, 1, 1,
0.157333, 1.502323, 1.808136, 0, 0.7843137, 1, 1,
0.1604414, -1.283827, 1.436016, 0, 0.7764706, 1, 1,
0.1620762, 0.6146884, 2.307891, 0, 0.772549, 1, 1,
0.1672458, -0.7463574, 3.296434, 0, 0.7647059, 1, 1,
0.1680196, -0.9435869, 2.973478, 0, 0.7607843, 1, 1,
0.1685196, -0.07869163, 2.784581, 0, 0.7529412, 1, 1,
0.1687161, 0.8832875, -1.532461, 0, 0.7490196, 1, 1,
0.169624, 0.3516637, 1.207611, 0, 0.7411765, 1, 1,
0.176934, 1.52297, 2.471591, 0, 0.7372549, 1, 1,
0.1781963, 1.596825, 0.5289537, 0, 0.7294118, 1, 1,
0.1796471, 0.3130993, -0.5690671, 0, 0.7254902, 1, 1,
0.1803496, -1.476559, 2.671729, 0, 0.7176471, 1, 1,
0.1819684, 0.08124004, 2.946508, 0, 0.7137255, 1, 1,
0.18651, -0.9159924, 3.241226, 0, 0.7058824, 1, 1,
0.1886466, -0.5926557, 1.991991, 0, 0.6980392, 1, 1,
0.1895226, -2.268734, 2.526983, 0, 0.6941177, 1, 1,
0.1905845, 1.681493, -0.171782, 0, 0.6862745, 1, 1,
0.1914914, -2.321467, 2.481777, 0, 0.682353, 1, 1,
0.1948915, 0.5159202, 0.4087425, 0, 0.6745098, 1, 1,
0.1978328, -0.4847455, 2.549567, 0, 0.6705883, 1, 1,
0.1981229, -0.3137681, 3.403744, 0, 0.6627451, 1, 1,
0.2026124, 0.1169702, 1.473895, 0, 0.6588235, 1, 1,
0.2031147, 1.495183, -0.4172242, 0, 0.6509804, 1, 1,
0.2044363, -0.09312738, 2.434625, 0, 0.6470588, 1, 1,
0.2067631, 0.2368289, 0.7753413, 0, 0.6392157, 1, 1,
0.2069254, 0.1775789, 0.8570113, 0, 0.6352941, 1, 1,
0.2087966, -0.9107306, 2.255793, 0, 0.627451, 1, 1,
0.2109394, -1.147184, 3.200588, 0, 0.6235294, 1, 1,
0.2141457, 1.273696, 0.08713023, 0, 0.6156863, 1, 1,
0.219656, 1.384974, 0.2114978, 0, 0.6117647, 1, 1,
0.2257078, 1.979446, -2.082944, 0, 0.6039216, 1, 1,
0.2265484, 0.1831528, 1.820142, 0, 0.5960785, 1, 1,
0.2322508, 0.6297135, 0.9210182, 0, 0.5921569, 1, 1,
0.2349885, -1.353226, 4.560953, 0, 0.5843138, 1, 1,
0.2353284, -0.6046747, 3.071524, 0, 0.5803922, 1, 1,
0.2354315, -0.4266365, 0.5462826, 0, 0.572549, 1, 1,
0.2362835, 1.302699, 1.855784, 0, 0.5686275, 1, 1,
0.2397806, 0.3854775, 1.108186, 0, 0.5607843, 1, 1,
0.2496465, -0.04143802, 1.58937, 0, 0.5568628, 1, 1,
0.2520812, 0.3633513, 1.196663, 0, 0.5490196, 1, 1,
0.2523291, 0.9664442, -0.4811718, 0, 0.5450981, 1, 1,
0.254206, 0.5417824, -1.581473, 0, 0.5372549, 1, 1,
0.256449, -0.5360216, 2.503029, 0, 0.5333334, 1, 1,
0.2608942, -0.2838486, 1.773319, 0, 0.5254902, 1, 1,
0.2618815, 1.66218, -0.5373853, 0, 0.5215687, 1, 1,
0.2620158, -0.391152, 4.366998, 0, 0.5137255, 1, 1,
0.2671947, -0.7845262, 2.956261, 0, 0.509804, 1, 1,
0.2743134, -0.1311656, -0.5753333, 0, 0.5019608, 1, 1,
0.2751932, 0.1086474, 1.379067, 0, 0.4941176, 1, 1,
0.2755674, 0.2208688, 0.6209788, 0, 0.4901961, 1, 1,
0.2769342, -0.4814828, 1.935766, 0, 0.4823529, 1, 1,
0.2797095, -0.00042034, -0.1221387, 0, 0.4784314, 1, 1,
0.2799687, 2.686221, 0.3789534, 0, 0.4705882, 1, 1,
0.2814102, -0.1135645, 2.274154, 0, 0.4666667, 1, 1,
0.2850921, 0.3914369, 3.09384, 0, 0.4588235, 1, 1,
0.2868808, -0.758516, 2.535214, 0, 0.454902, 1, 1,
0.2906737, 1.372967, 0.5368517, 0, 0.4470588, 1, 1,
0.2919533, -0.7180692, 1.303249, 0, 0.4431373, 1, 1,
0.2948554, -1.362882, 3.367965, 0, 0.4352941, 1, 1,
0.300775, 0.414352, 1.162259, 0, 0.4313726, 1, 1,
0.306244, -0.7553376, 4.088639, 0, 0.4235294, 1, 1,
0.3062702, -1.342752, 3.073228, 0, 0.4196078, 1, 1,
0.3066303, 1.708244, 0.5176308, 0, 0.4117647, 1, 1,
0.3097461, -1.397288, 2.821467, 0, 0.4078431, 1, 1,
0.3103853, 1.67685, 0.3178118, 0, 0.4, 1, 1,
0.3108695, 0.6377972, -0.8674538, 0, 0.3921569, 1, 1,
0.3170929, -0.01877616, 1.242389, 0, 0.3882353, 1, 1,
0.3182448, 2.470402, 0.7478605, 0, 0.3803922, 1, 1,
0.3203705, 0.2806464, 0.3134719, 0, 0.3764706, 1, 1,
0.3210325, -0.1131188, 0.8474194, 0, 0.3686275, 1, 1,
0.322006, -0.4521625, 3.770408, 0, 0.3647059, 1, 1,
0.3266901, -1.339634, 3.483776, 0, 0.3568628, 1, 1,
0.3268709, -1.297497, 2.327498, 0, 0.3529412, 1, 1,
0.3269826, -0.2538749, 2.758947, 0, 0.345098, 1, 1,
0.3281217, 0.2739889, 1.122412, 0, 0.3411765, 1, 1,
0.3286758, -0.5745488, 1.29919, 0, 0.3333333, 1, 1,
0.3348472, 0.6953726, 1.647695, 0, 0.3294118, 1, 1,
0.337027, 0.3927923, 1.996895, 0, 0.3215686, 1, 1,
0.3390349, -0.433587, 3.171107, 0, 0.3176471, 1, 1,
0.3434325, -0.2115715, 2.077098, 0, 0.3098039, 1, 1,
0.3441575, 1.487352, -0.4067083, 0, 0.3058824, 1, 1,
0.3450959, 1.675837, -3.100844, 0, 0.2980392, 1, 1,
0.346216, 0.03888118, 3.161945, 0, 0.2901961, 1, 1,
0.3492267, 0.6945985, -0.6102778, 0, 0.2862745, 1, 1,
0.3512569, -0.8347232, 3.286707, 0, 0.2784314, 1, 1,
0.351945, -0.768069, 2.111523, 0, 0.2745098, 1, 1,
0.3576533, 1.559286, -1.234356, 0, 0.2666667, 1, 1,
0.3612381, 0.1282208, 2.580587, 0, 0.2627451, 1, 1,
0.3638377, 0.2151012, 1.457977, 0, 0.254902, 1, 1,
0.3661811, 0.2269758, -1.262547, 0, 0.2509804, 1, 1,
0.3679051, 0.2024738, 0.4438786, 0, 0.2431373, 1, 1,
0.377434, -0.8911021, 1.910024, 0, 0.2392157, 1, 1,
0.3808255, 1.916339, -0.040133, 0, 0.2313726, 1, 1,
0.3854938, 0.923588, 0.6781778, 0, 0.227451, 1, 1,
0.386434, -0.1437338, 1.178354, 0, 0.2196078, 1, 1,
0.3881545, 0.2685069, 1.499603, 0, 0.2156863, 1, 1,
0.3885315, 0.488207, -0.6380712, 0, 0.2078431, 1, 1,
0.3947617, 0.2801904, 0.430818, 0, 0.2039216, 1, 1,
0.4067307, 0.5110604, 1.269121, 0, 0.1960784, 1, 1,
0.4078203, 0.7277161, 1.607992, 0, 0.1882353, 1, 1,
0.4078958, 0.2413732, 1.221266, 0, 0.1843137, 1, 1,
0.4156646, -0.7069438, 1.375584, 0, 0.1764706, 1, 1,
0.4249684, 0.2412103, -0.41022, 0, 0.172549, 1, 1,
0.4254073, -0.5287088, 1.731022, 0, 0.1647059, 1, 1,
0.4282323, 0.6455044, -0.5455095, 0, 0.1607843, 1, 1,
0.4342942, 0.1785659, 1.276727, 0, 0.1529412, 1, 1,
0.4375515, 0.6070179, -0.7522903, 0, 0.1490196, 1, 1,
0.4443344, 0.1668515, 1.868773, 0, 0.1411765, 1, 1,
0.4505222, 0.5214807, -1.027633, 0, 0.1372549, 1, 1,
0.4508792, -0.5987865, 3.247183, 0, 0.1294118, 1, 1,
0.4526769, -0.5176178, 1.665659, 0, 0.1254902, 1, 1,
0.4619257, 1.250764, 2.925141, 0, 0.1176471, 1, 1,
0.4621622, -0.5625008, 2.132638, 0, 0.1137255, 1, 1,
0.4648525, -0.849593, 2.418891, 0, 0.1058824, 1, 1,
0.4653422, 1.920165, -0.7856598, 0, 0.09803922, 1, 1,
0.4666449, -1.100111, 1.441374, 0, 0.09411765, 1, 1,
0.467028, 0.05165336, 0.9456854, 0, 0.08627451, 1, 1,
0.4672644, -0.978947, 3.323236, 0, 0.08235294, 1, 1,
0.4674038, 0.6246154, -0.09273523, 0, 0.07450981, 1, 1,
0.4679436, -0.3307518, 2.759203, 0, 0.07058824, 1, 1,
0.468181, -1.611854, 2.548792, 0, 0.0627451, 1, 1,
0.4740228, 0.1318328, 1.485523, 0, 0.05882353, 1, 1,
0.4778906, -1.595726, 2.943181, 0, 0.05098039, 1, 1,
0.4792364, 0.733508, 0.5271203, 0, 0.04705882, 1, 1,
0.4796294, 0.05329908, 3.099637, 0, 0.03921569, 1, 1,
0.480046, 0.8810326, 1.540825, 0, 0.03529412, 1, 1,
0.4829205, -0.3134747, 1.876723, 0, 0.02745098, 1, 1,
0.4914038, -0.3398214, 4.781428, 0, 0.02352941, 1, 1,
0.4931001, -0.8216032, 2.561117, 0, 0.01568628, 1, 1,
0.4949056, -0.7732514, 2.340487, 0, 0.01176471, 1, 1,
0.4956242, 0.9077005, 0.9527529, 0, 0.003921569, 1, 1,
0.4964275, -0.3725026, 0.8943319, 0.003921569, 0, 1, 1,
0.4968873, 0.4300357, 0.5106124, 0.007843138, 0, 1, 1,
0.4978518, -0.01282108, 1.738362, 0.01568628, 0, 1, 1,
0.4985836, 0.9437675, 1.926553, 0.01960784, 0, 1, 1,
0.4989734, 0.2024432, -0.04362606, 0.02745098, 0, 1, 1,
0.5015261, 0.7056904, 0.9548046, 0.03137255, 0, 1, 1,
0.5064447, 2.23772, 1.220957, 0.03921569, 0, 1, 1,
0.5210541, -2.021062, 4.137119, 0.04313726, 0, 1, 1,
0.5214471, -0.3470351, 2.102892, 0.05098039, 0, 1, 1,
0.5276703, 0.2193697, 1.750654, 0.05490196, 0, 1, 1,
0.5373077, -1.092867, 4.685569, 0.0627451, 0, 1, 1,
0.5395809, 0.7100022, -1.365396, 0.06666667, 0, 1, 1,
0.5402956, 1.423645, 0.338328, 0.07450981, 0, 1, 1,
0.5405453, 0.5347066, 0.3834031, 0.07843138, 0, 1, 1,
0.5415996, -0.607792, 1.859746, 0.08627451, 0, 1, 1,
0.5421731, -1.096187, 1.634253, 0.09019608, 0, 1, 1,
0.5466781, -1.621459, 2.82216, 0.09803922, 0, 1, 1,
0.5545427, 0.5568066, -0.1839272, 0.1058824, 0, 1, 1,
0.5559967, 0.09811389, 0.3953442, 0.1098039, 0, 1, 1,
0.556443, 0.3057582, -0.9357327, 0.1176471, 0, 1, 1,
0.5594724, -0.6466533, 2.904912, 0.1215686, 0, 1, 1,
0.5637109, 1.295433, 1.116878, 0.1294118, 0, 1, 1,
0.5695806, 1.517693, 1.494912, 0.1333333, 0, 1, 1,
0.5755031, -1.192668, 3.49184, 0.1411765, 0, 1, 1,
0.5757002, 1.081164, -0.2265578, 0.145098, 0, 1, 1,
0.58186, 1.118633, 1.074835, 0.1529412, 0, 1, 1,
0.5820658, -0.3309848, 0.5127046, 0.1568628, 0, 1, 1,
0.5842271, -0.6551583, 3.572, 0.1647059, 0, 1, 1,
0.5843731, 1.213302, 0.922402, 0.1686275, 0, 1, 1,
0.5935146, -1.368976, 2.648558, 0.1764706, 0, 1, 1,
0.5970652, 0.080307, 2.078729, 0.1803922, 0, 1, 1,
0.5998142, 0.4786109, 0.5822913, 0.1882353, 0, 1, 1,
0.6001878, 0.8697062, 1.502168, 0.1921569, 0, 1, 1,
0.6009886, 1.561025, -1.020834, 0.2, 0, 1, 1,
0.6018186, 0.5991942, 0.9115168, 0.2078431, 0, 1, 1,
0.6072456, -0.5953171, 3.320785, 0.2117647, 0, 1, 1,
0.6126702, -0.05619227, 2.140256, 0.2196078, 0, 1, 1,
0.6228915, 1.750516, 0.3686807, 0.2235294, 0, 1, 1,
0.6250437, -0.03489164, 2.98836, 0.2313726, 0, 1, 1,
0.6251256, -0.780977, 4.108365, 0.2352941, 0, 1, 1,
0.6253408, 0.6499466, -0.6192258, 0.2431373, 0, 1, 1,
0.6282442, 0.006738057, 2.215916, 0.2470588, 0, 1, 1,
0.6285501, 1.952898, -0.1447809, 0.254902, 0, 1, 1,
0.6307721, 1.081032, 0.2488126, 0.2588235, 0, 1, 1,
0.6319762, -0.217316, 2.189637, 0.2666667, 0, 1, 1,
0.6322216, 0.3661315, 2.535642, 0.2705882, 0, 1, 1,
0.6336784, -1.861686, 3.865962, 0.2784314, 0, 1, 1,
0.638481, 0.723178, 1.997663, 0.282353, 0, 1, 1,
0.6407911, -0.8896051, 3.945606, 0.2901961, 0, 1, 1,
0.6421192, 0.7436019, 0.8802089, 0.2941177, 0, 1, 1,
0.6428405, -1.733317, 2.675738, 0.3019608, 0, 1, 1,
0.6457901, -0.4512554, 0.8434605, 0.3098039, 0, 1, 1,
0.6514021, 0.7577599, 0.2627015, 0.3137255, 0, 1, 1,
0.6551048, -0.1672893, 1.839095, 0.3215686, 0, 1, 1,
0.6586784, -0.7602749, 2.317193, 0.3254902, 0, 1, 1,
0.6603906, 0.927649, 1.409967, 0.3333333, 0, 1, 1,
0.661005, 0.5839038, 0.8634742, 0.3372549, 0, 1, 1,
0.6662322, -1.177245, 3.217673, 0.345098, 0, 1, 1,
0.6690607, -0.416776, 0.8495818, 0.3490196, 0, 1, 1,
0.6703632, 0.4802828, 0.4282061, 0.3568628, 0, 1, 1,
0.6715299, 0.1404746, 0.5412948, 0.3607843, 0, 1, 1,
0.6726114, -0.008502646, -0.7307003, 0.3686275, 0, 1, 1,
0.6738438, 1.186208, 1.166163, 0.372549, 0, 1, 1,
0.6742412, -0.5520418, 2.681371, 0.3803922, 0, 1, 1,
0.6763508, -0.1903898, 2.402483, 0.3843137, 0, 1, 1,
0.67931, -0.6229591, 1.907627, 0.3921569, 0, 1, 1,
0.6804977, -0.6044393, 1.919646, 0.3960784, 0, 1, 1,
0.6811371, -0.3200019, 2.230222, 0.4039216, 0, 1, 1,
0.6821357, -1.196519, 2.972335, 0.4117647, 0, 1, 1,
0.6827214, -0.7113985, 2.102385, 0.4156863, 0, 1, 1,
0.6879737, -0.2881527, 1.920459, 0.4235294, 0, 1, 1,
0.6911005, -1.373584, 3.727238, 0.427451, 0, 1, 1,
0.6940859, 1.965588, -0.1099179, 0.4352941, 0, 1, 1,
0.6951575, 1.554073, -0.07150463, 0.4392157, 0, 1, 1,
0.6954132, -0.1298473, 1.767757, 0.4470588, 0, 1, 1,
0.696218, -1.579531, 2.170203, 0.4509804, 0, 1, 1,
0.7029992, 0.5097529, 1.140612, 0.4588235, 0, 1, 1,
0.7035031, 0.04390287, 0.1471373, 0.4627451, 0, 1, 1,
0.704505, 1.268806, 1.05283, 0.4705882, 0, 1, 1,
0.7047314, 0.6249723, 0.377375, 0.4745098, 0, 1, 1,
0.7058592, 0.3972771, -0.5192672, 0.4823529, 0, 1, 1,
0.7063333, 1.12753, 0.877473, 0.4862745, 0, 1, 1,
0.7136674, -1.297917, 1.90375, 0.4941176, 0, 1, 1,
0.715602, -0.5651125, 0.4591065, 0.5019608, 0, 1, 1,
0.7218093, -1.275741, 2.239799, 0.5058824, 0, 1, 1,
0.7232904, -0.3238813, 2.177256, 0.5137255, 0, 1, 1,
0.7261406, -0.1374854, 1.824839, 0.5176471, 0, 1, 1,
0.7278122, -1.450531, 2.399717, 0.5254902, 0, 1, 1,
0.7292004, 0.927017, -0.03970737, 0.5294118, 0, 1, 1,
0.7297783, -0.8231857, 1.768726, 0.5372549, 0, 1, 1,
0.7372878, 0.4397009, -0.4960967, 0.5411765, 0, 1, 1,
0.741059, 0.3100014, 1.659228, 0.5490196, 0, 1, 1,
0.7427341, -0.526278, 1.20013, 0.5529412, 0, 1, 1,
0.7475453, -0.7518311, 2.664648, 0.5607843, 0, 1, 1,
0.7511872, 0.7009139, 0.6731763, 0.5647059, 0, 1, 1,
0.7538785, 0.6293154, 1.043432, 0.572549, 0, 1, 1,
0.7555428, -0.7815961, 2.448105, 0.5764706, 0, 1, 1,
0.7609784, -0.882549, 2.109106, 0.5843138, 0, 1, 1,
0.761715, 1.643929, 0.9783102, 0.5882353, 0, 1, 1,
0.7664815, -0.1270519, 1.038081, 0.5960785, 0, 1, 1,
0.768431, -1.655847, 3.421911, 0.6039216, 0, 1, 1,
0.7739338, -1.267031, 4.353045, 0.6078432, 0, 1, 1,
0.7778045, 0.3255883, 0.3978226, 0.6156863, 0, 1, 1,
0.7804005, -0.5901666, 0.6975042, 0.6196079, 0, 1, 1,
0.780695, -0.9226966, 1.816462, 0.627451, 0, 1, 1,
0.7848646, -0.6069209, 2.799276, 0.6313726, 0, 1, 1,
0.789358, -0.7231513, 2.390273, 0.6392157, 0, 1, 1,
0.7923017, -0.1754176, 0.7757812, 0.6431373, 0, 1, 1,
0.798769, -0.8773935, 3.65178, 0.6509804, 0, 1, 1,
0.8018789, 0.2718469, 3.353986, 0.654902, 0, 1, 1,
0.8103618, -0.2462342, 2.852152, 0.6627451, 0, 1, 1,
0.8114452, -0.2948055, 4.18038, 0.6666667, 0, 1, 1,
0.8120445, -0.4919165, 4.04056, 0.6745098, 0, 1, 1,
0.8137286, 1.308833, 1.698907, 0.6784314, 0, 1, 1,
0.8137362, -0.6559166, 1.571778, 0.6862745, 0, 1, 1,
0.8159148, -0.2868708, 2.27508, 0.6901961, 0, 1, 1,
0.8222148, 0.5692786, 2.155172, 0.6980392, 0, 1, 1,
0.8234315, -0.5566028, 1.885423, 0.7058824, 0, 1, 1,
0.8246563, -2.001639, 3.243628, 0.7098039, 0, 1, 1,
0.8247917, 0.8142803, 0.0840782, 0.7176471, 0, 1, 1,
0.8260628, -0.1793518, 2.967538, 0.7215686, 0, 1, 1,
0.8292987, -0.2058389, 2.562855, 0.7294118, 0, 1, 1,
0.8319512, 1.11385, 1.626591, 0.7333333, 0, 1, 1,
0.8320552, -1.602673, 3.294098, 0.7411765, 0, 1, 1,
0.8326687, -0.3699768, 2.20761, 0.7450981, 0, 1, 1,
0.8381516, 0.552471, -0.2741645, 0.7529412, 0, 1, 1,
0.8464872, 0.7458634, -0.7715386, 0.7568628, 0, 1, 1,
0.8517967, 1.493067, 2.159841, 0.7647059, 0, 1, 1,
0.8538029, 0.03402528, 1.846825, 0.7686275, 0, 1, 1,
0.8544749, 1.809719, -0.4959608, 0.7764706, 0, 1, 1,
0.8571467, 0.7679433, 1.640918, 0.7803922, 0, 1, 1,
0.8590605, -1.322356, 3.628514, 0.7882353, 0, 1, 1,
0.8590856, 0.1036599, 0.4505074, 0.7921569, 0, 1, 1,
0.8591078, -2.356115, 1.851176, 0.8, 0, 1, 1,
0.8592425, 1.403962, 0.1796036, 0.8078431, 0, 1, 1,
0.8605703, -0.9925574, 2.584216, 0.8117647, 0, 1, 1,
0.8658295, 0.05080447, -0.05067209, 0.8196079, 0, 1, 1,
0.8669953, 0.3561828, 2.453441, 0.8235294, 0, 1, 1,
0.8722548, -0.3849419, 1.228292, 0.8313726, 0, 1, 1,
0.8723064, 1.082097, -0.01988568, 0.8352941, 0, 1, 1,
0.8735191, -0.7636271, 2.069504, 0.8431373, 0, 1, 1,
0.8756123, -0.6850569, 2.068122, 0.8470588, 0, 1, 1,
0.8794886, -0.9386148, 2.514009, 0.854902, 0, 1, 1,
0.887856, -0.5540698, 2.585665, 0.8588235, 0, 1, 1,
0.8950176, 0.7384073, 1.194057, 0.8666667, 0, 1, 1,
0.8991197, 0.5888036, 2.024727, 0.8705882, 0, 1, 1,
0.9004539, 1.489744, 1.696079, 0.8784314, 0, 1, 1,
0.9079543, 0.2487959, 1.878022, 0.8823529, 0, 1, 1,
0.9142891, -1.000309, 3.662427, 0.8901961, 0, 1, 1,
0.9312936, 0.3379642, -0.2747228, 0.8941177, 0, 1, 1,
0.932494, -1.089124, 1.777141, 0.9019608, 0, 1, 1,
0.9341397, 0.1383957, 0.6841692, 0.9098039, 0, 1, 1,
0.9360856, -0.1678445, 1.14791, 0.9137255, 0, 1, 1,
0.9443853, 1.112997, 1.33578, 0.9215686, 0, 1, 1,
0.952506, -0.01648429, -0.06981743, 0.9254902, 0, 1, 1,
0.9539551, 1.35581, 0.2022454, 0.9333333, 0, 1, 1,
0.959138, 0.5693758, 0.9189976, 0.9372549, 0, 1, 1,
0.9595765, -2.289607, 3.367041, 0.945098, 0, 1, 1,
0.9685265, -0.2366445, 2.524003, 0.9490196, 0, 1, 1,
0.971092, 1.872184, 0.8507338, 0.9568627, 0, 1, 1,
0.9715721, -1.05036, 2.928543, 0.9607843, 0, 1, 1,
0.9725494, -0.6593628, 1.975796, 0.9686275, 0, 1, 1,
0.97574, 1.35314, 1.316618, 0.972549, 0, 1, 1,
0.9814652, 1.674517, -0.01743473, 0.9803922, 0, 1, 1,
0.9857369, 1.021155, 1.603419, 0.9843137, 0, 1, 1,
0.986339, 0.315986, 2.032457, 0.9921569, 0, 1, 1,
0.9877869, 0.2932208, 0.2021249, 0.9960784, 0, 1, 1,
0.9881067, 0.3419757, 1.069032, 1, 0, 0.9960784, 1,
1.001671, 0.3084349, 1.828159, 1, 0, 0.9882353, 1,
1.010841, -0.126394, 1.01256, 1, 0, 0.9843137, 1,
1.012266, 0.5404157, 1.457004, 1, 0, 0.9764706, 1,
1.015876, -1.652623, 3.872223, 1, 0, 0.972549, 1,
1.027481, -0.1677999, 1.430797, 1, 0, 0.9647059, 1,
1.027654, -1.130465, 2.794894, 1, 0, 0.9607843, 1,
1.031058, 0.6082597, 0.3729177, 1, 0, 0.9529412, 1,
1.035532, 0.4292001, 1.637848, 1, 0, 0.9490196, 1,
1.045828, -0.6543517, 0.3571782, 1, 0, 0.9411765, 1,
1.04909, 0.5004503, 1.902824, 1, 0, 0.9372549, 1,
1.060924, -1.940394, 1.7654, 1, 0, 0.9294118, 1,
1.071096, -0.2136181, 2.56898, 1, 0, 0.9254902, 1,
1.075565, -1.094629, 1.769513, 1, 0, 0.9176471, 1,
1.0797, 1.030877, 0.7532963, 1, 0, 0.9137255, 1,
1.086601, -0.6784118, 4.851914, 1, 0, 0.9058824, 1,
1.092461, 0.07305744, -0.2988923, 1, 0, 0.9019608, 1,
1.09508, 0.6535224, 2.124437, 1, 0, 0.8941177, 1,
1.095358, 0.02360971, 2.104198, 1, 0, 0.8862745, 1,
1.09552, -1.522661, 2.730697, 1, 0, 0.8823529, 1,
1.100255, 0.1355324, -0.687938, 1, 0, 0.8745098, 1,
1.103155, -0.1966725, 1.980556, 1, 0, 0.8705882, 1,
1.106931, 1.438367, 1.156808, 1, 0, 0.8627451, 1,
1.116484, 0.953694, 1.373845, 1, 0, 0.8588235, 1,
1.122033, -0.1116587, 1.368077, 1, 0, 0.8509804, 1,
1.122403, 0.249036, 2.211801, 1, 0, 0.8470588, 1,
1.124738, 0.007449271, 0.760314, 1, 0, 0.8392157, 1,
1.127707, 1.25846, -0.6748875, 1, 0, 0.8352941, 1,
1.136233, -1.58747, 3.487606, 1, 0, 0.827451, 1,
1.143281, 0.1828306, 1.914612, 1, 0, 0.8235294, 1,
1.152997, -0.01200849, 1.825799, 1, 0, 0.8156863, 1,
1.158368, 0.3376957, 0.3173869, 1, 0, 0.8117647, 1,
1.159778, 1.023992, 2.655281, 1, 0, 0.8039216, 1,
1.16028, 1.589082, 0.8101957, 1, 0, 0.7960784, 1,
1.162462, 0.9626485, 1.878237, 1, 0, 0.7921569, 1,
1.164811, -0.9636022, 3.918995, 1, 0, 0.7843137, 1,
1.174263, -0.155463, 2.476509, 1, 0, 0.7803922, 1,
1.176155, -1.671519, 3.399079, 1, 0, 0.772549, 1,
1.188184, -0.8512942, 1.270431, 1, 0, 0.7686275, 1,
1.202631, 1.497937, 0.249632, 1, 0, 0.7607843, 1,
1.209301, 2.544339, 0.4169255, 1, 0, 0.7568628, 1,
1.214968, -0.506979, 4.424654, 1, 0, 0.7490196, 1,
1.215778, -1.050378, 2.227673, 1, 0, 0.7450981, 1,
1.22133, 0.6940245, -1.103954, 1, 0, 0.7372549, 1,
1.221665, -1.257526, 2.735596, 1, 0, 0.7333333, 1,
1.223669, -0.1617436, 2.913033, 1, 0, 0.7254902, 1,
1.224617, -0.786624, 2.474385, 1, 0, 0.7215686, 1,
1.228195, 0.2693865, 0.4511359, 1, 0, 0.7137255, 1,
1.228572, 0.639746, 2.276201, 1, 0, 0.7098039, 1,
1.233645, -0.267846, 1.0463, 1, 0, 0.7019608, 1,
1.246707, -0.06325901, 2.642889, 1, 0, 0.6941177, 1,
1.252136, 1.822206, -1.017201, 1, 0, 0.6901961, 1,
1.252852, 2.570719, 0.5106638, 1, 0, 0.682353, 1,
1.25589, 1.246278, 3.279864, 1, 0, 0.6784314, 1,
1.274219, -0.1982804, 1.601135, 1, 0, 0.6705883, 1,
1.283486, -1.062429, 2.828122, 1, 0, 0.6666667, 1,
1.287435, 0.5556816, 1.066466, 1, 0, 0.6588235, 1,
1.290271, 1.310055, 1.284152, 1, 0, 0.654902, 1,
1.292629, -0.2953401, 2.269864, 1, 0, 0.6470588, 1,
1.31077, 0.7779035, 1.297096, 1, 0, 0.6431373, 1,
1.323262, -0.9472731, 0.7544023, 1, 0, 0.6352941, 1,
1.332209, -0.8395894, 1.382279, 1, 0, 0.6313726, 1,
1.335586, -0.09402188, 2.197726, 1, 0, 0.6235294, 1,
1.341834, 0.5114707, 1.067462, 1, 0, 0.6196079, 1,
1.345815, 3.160644, 0.03843953, 1, 0, 0.6117647, 1,
1.350992, -1.009012, 2.688109, 1, 0, 0.6078432, 1,
1.354649, -0.958407, 2.502941, 1, 0, 0.6, 1,
1.360575, 0.1108549, 2.616793, 1, 0, 0.5921569, 1,
1.361251, -0.5543312, 1.328414, 1, 0, 0.5882353, 1,
1.369944, 0.4123679, 0.8574849, 1, 0, 0.5803922, 1,
1.375186, 0.1217647, 1.125551, 1, 0, 0.5764706, 1,
1.385542, 0.5330658, 2.442821, 1, 0, 0.5686275, 1,
1.387476, 0.3276579, 0.009092716, 1, 0, 0.5647059, 1,
1.40151, -1.307326, 1.427592, 1, 0, 0.5568628, 1,
1.408009, 1.596407, 1.56119, 1, 0, 0.5529412, 1,
1.425472, -0.2983422, 2.224184, 1, 0, 0.5450981, 1,
1.427518, -0.1159118, 3.615242, 1, 0, 0.5411765, 1,
1.433034, 2.3171, 1.446296, 1, 0, 0.5333334, 1,
1.44385, -0.1198616, 3.034619, 1, 0, 0.5294118, 1,
1.44721, -1.209773, 3.629663, 1, 0, 0.5215687, 1,
1.448296, 0.8255565, 0.5037103, 1, 0, 0.5176471, 1,
1.449466, 0.8305482, 0.8994671, 1, 0, 0.509804, 1,
1.459722, -0.3031345, 2.884148, 1, 0, 0.5058824, 1,
1.459803, 1.171526, 0.7143985, 1, 0, 0.4980392, 1,
1.468198, -0.5593816, 1.425956, 1, 0, 0.4901961, 1,
1.476448, -0.4677692, 2.121027, 1, 0, 0.4862745, 1,
1.478921, -0.9202434, 0.3057378, 1, 0, 0.4784314, 1,
1.479943, -0.1140375, 3.047862, 1, 0, 0.4745098, 1,
1.484065, 0.5416349, 0.6425723, 1, 0, 0.4666667, 1,
1.492796, 0.4856966, 0.9636399, 1, 0, 0.4627451, 1,
1.502136, -1.152435, 2.637279, 1, 0, 0.454902, 1,
1.504071, -0.6493396, 1.390749, 1, 0, 0.4509804, 1,
1.506657, -1.37887, 3.322729, 1, 0, 0.4431373, 1,
1.522619, 2.049957, -0.6753649, 1, 0, 0.4392157, 1,
1.523757, 0.1173871, 2.493406, 1, 0, 0.4313726, 1,
1.527049, -0.9418768, 3.320342, 1, 0, 0.427451, 1,
1.528424, 0.1919508, 3.210363, 1, 0, 0.4196078, 1,
1.53253, -5.28642e-05, 1.030711, 1, 0, 0.4156863, 1,
1.533762, 0.868449, 0.04098064, 1, 0, 0.4078431, 1,
1.539155, -1.486542, 2.256566, 1, 0, 0.4039216, 1,
1.546116, 2.21909, -0.3821906, 1, 0, 0.3960784, 1,
1.566437, -0.6570997, 1.478278, 1, 0, 0.3882353, 1,
1.573409, -1.058521, 3.192986, 1, 0, 0.3843137, 1,
1.579931, -0.2187913, 1.54047, 1, 0, 0.3764706, 1,
1.584592, 0.9185244, 1.987138, 1, 0, 0.372549, 1,
1.59, 1.292887, 1.246789, 1, 0, 0.3647059, 1,
1.597273, 0.5060325, 0.5736628, 1, 0, 0.3607843, 1,
1.606512, 0.1201728, 1.668711, 1, 0, 0.3529412, 1,
1.611374, -2.793902, 4.381295, 1, 0, 0.3490196, 1,
1.612378, -0.6179182, 0.7656259, 1, 0, 0.3411765, 1,
1.651993, 0.4810204, 3.061876, 1, 0, 0.3372549, 1,
1.654494, -0.7756434, 1.366844, 1, 0, 0.3294118, 1,
1.655447, 0.3729779, 2.206985, 1, 0, 0.3254902, 1,
1.681399, 1.039252, 0.7342298, 1, 0, 0.3176471, 1,
1.681651, -0.4265277, 3.415644, 1, 0, 0.3137255, 1,
1.682181, 0.8763647, 2.352557, 1, 0, 0.3058824, 1,
1.684387, 0.2271748, 2.522473, 1, 0, 0.2980392, 1,
1.698233, -0.01987768, 2.355213, 1, 0, 0.2941177, 1,
1.702094, -2.091535, 3.297602, 1, 0, 0.2862745, 1,
1.710277, -0.3146587, 1.457115, 1, 0, 0.282353, 1,
1.730986, -0.9728405, 3.117815, 1, 0, 0.2745098, 1,
1.737971, 1.673064, 2.068852, 1, 0, 0.2705882, 1,
1.754504, -2.206938, 2.896395, 1, 0, 0.2627451, 1,
1.791896, 0.1942462, 1.400666, 1, 0, 0.2588235, 1,
1.798398, 1.437968, -0.1196705, 1, 0, 0.2509804, 1,
1.805068, 1.302778, 0.3492734, 1, 0, 0.2470588, 1,
1.818563, -1.738096, 2.412568, 1, 0, 0.2392157, 1,
1.840006, -0.3582385, 1.466392, 1, 0, 0.2352941, 1,
1.859006, -0.9659748, 2.377548, 1, 0, 0.227451, 1,
1.892168, -1.148734, 3.955981, 1, 0, 0.2235294, 1,
1.894068, 1.106386, 0.8307357, 1, 0, 0.2156863, 1,
1.903869, 0.7219455, 1.939105, 1, 0, 0.2117647, 1,
1.910327, -1.222397, 3.166591, 1, 0, 0.2039216, 1,
1.946909, 0.138563, 2.065521, 1, 0, 0.1960784, 1,
1.956803, 0.3683037, 1.482213, 1, 0, 0.1921569, 1,
1.958602, 0.3024028, 1.664936, 1, 0, 0.1843137, 1,
1.959222, -1.801466, 2.215137, 1, 0, 0.1803922, 1,
1.964959, 2.163834, -0.09096382, 1, 0, 0.172549, 1,
1.977771, -0.4558763, 3.232877, 1, 0, 0.1686275, 1,
1.990099, -0.4994299, 1.729743, 1, 0, 0.1607843, 1,
2.004736, 2.564093, -0.2798809, 1, 0, 0.1568628, 1,
2.070184, 0.1238055, 3.08541, 1, 0, 0.1490196, 1,
2.090238, -1.592512, 3.441479, 1, 0, 0.145098, 1,
2.106438, 0.001346617, 1.515758, 1, 0, 0.1372549, 1,
2.11451, 1.217694, 0.9898977, 1, 0, 0.1333333, 1,
2.15793, -0.08511724, 1.210963, 1, 0, 0.1254902, 1,
2.168376, -0.6266147, 1.05935, 1, 0, 0.1215686, 1,
2.187995, -0.03050582, 2.136771, 1, 0, 0.1137255, 1,
2.212344, 0.4000226, 0.434396, 1, 0, 0.1098039, 1,
2.239668, -0.6477413, 2.068684, 1, 0, 0.1019608, 1,
2.264058, 0.07333616, 1.35449, 1, 0, 0.09411765, 1,
2.297468, -0.2056219, 2.085431, 1, 0, 0.09019608, 1,
2.298256, -0.3871935, 1.063037, 1, 0, 0.08235294, 1,
2.366739, 0.6120703, -1.737487, 1, 0, 0.07843138, 1,
2.394, -0.006048946, 0.4377623, 1, 0, 0.07058824, 1,
2.402777, 0.185055, 1.883208, 1, 0, 0.06666667, 1,
2.42147, -0.3349099, 1.618149, 1, 0, 0.05882353, 1,
2.441626, -0.7735384, 2.477006, 1, 0, 0.05490196, 1,
2.467626, 0.7770367, 2.511126, 1, 0, 0.04705882, 1,
2.495314, -0.3048623, 1.930389, 1, 0, 0.04313726, 1,
2.528196, -0.1127725, 2.78937, 1, 0, 0.03529412, 1,
2.533851, -0.9647679, 2.141433, 1, 0, 0.03137255, 1,
2.666095, -0.5053367, 2.686641, 1, 0, 0.02352941, 1,
2.819042, 0.4296853, 2.538375, 1, 0, 0.01960784, 1,
3.108951, 0.1846521, 1.109795, 1, 0, 0.01176471, 1,
3.179036, 0.9208677, 0.5364448, 1, 0, 0.007843138, 1
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
0.08351529, -4.798864, -6.506281, 0, -0.5, 0.5, 0.5,
0.08351529, -4.798864, -6.506281, 1, -0.5, 0.5, 0.5,
0.08351529, -4.798864, -6.506281, 1, 1.5, 0.5, 0.5,
0.08351529, -4.798864, -6.506281, 0, 1.5, 0.5, 0.5
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
-4.061387, -0.2406231, -6.506281, 0, -0.5, 0.5, 0.5,
-4.061387, -0.2406231, -6.506281, 1, -0.5, 0.5, 0.5,
-4.061387, -0.2406231, -6.506281, 1, 1.5, 0.5, 0.5,
-4.061387, -0.2406231, -6.506281, 0, 1.5, 0.5, 0.5
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
-4.061387, -4.798864, 0.1454852, 0, -0.5, 0.5, 0.5,
-4.061387, -4.798864, 0.1454852, 1, -0.5, 0.5, 0.5,
-4.061387, -4.798864, 0.1454852, 1, 1.5, 0.5, 0.5,
-4.061387, -4.798864, 0.1454852, 0, 1.5, 0.5, 0.5
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
-3, -3.746963, -4.971258,
3, -3.746963, -4.971258,
-3, -3.746963, -4.971258,
-3, -3.92228, -5.227096,
-2, -3.746963, -4.971258,
-2, -3.92228, -5.227096,
-1, -3.746963, -4.971258,
-1, -3.92228, -5.227096,
0, -3.746963, -4.971258,
0, -3.92228, -5.227096,
1, -3.746963, -4.971258,
1, -3.92228, -5.227096,
2, -3.746963, -4.971258,
2, -3.92228, -5.227096,
3, -3.746963, -4.971258,
3, -3.92228, -5.227096
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
-3, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
-3, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
-3, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
-3, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
-2, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
-2, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
-2, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
-2, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
-1, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
-1, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
-1, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
-1, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
0, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
0, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
0, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
0, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
1, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
1, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
1, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
1, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
2, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
2, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
2, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
2, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5,
3, -4.272913, -5.73877, 0, -0.5, 0.5, 0.5,
3, -4.272913, -5.73877, 1, -0.5, 0.5, 0.5,
3, -4.272913, -5.73877, 1, 1.5, 0.5, 0.5,
3, -4.272913, -5.73877, 0, 1.5, 0.5, 0.5
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
-3.104871, -3, -4.971258,
-3.104871, 3, -4.971258,
-3.104871, -3, -4.971258,
-3.264291, -3, -5.227096,
-3.104871, -2, -4.971258,
-3.264291, -2, -5.227096,
-3.104871, -1, -4.971258,
-3.264291, -1, -5.227096,
-3.104871, 0, -4.971258,
-3.264291, 0, -5.227096,
-3.104871, 1, -4.971258,
-3.264291, 1, -5.227096,
-3.104871, 2, -4.971258,
-3.264291, 2, -5.227096,
-3.104871, 3, -4.971258,
-3.264291, 3, -5.227096
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
-3.583129, -3, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, -3, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, -3, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, -3, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, -2, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, -2, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, -2, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, -2, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, -1, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, -1, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, -1, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, -1, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, 0, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, 0, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, 0, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, 0, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, 1, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, 1, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, 1, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, 1, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, 2, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, 2, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, 2, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, 2, -5.73877, 0, 1.5, 0.5, 0.5,
-3.583129, 3, -5.73877, 0, -0.5, 0.5, 0.5,
-3.583129, 3, -5.73877, 1, -0.5, 0.5, 0.5,
-3.583129, 3, -5.73877, 1, 1.5, 0.5, 0.5,
-3.583129, 3, -5.73877, 0, 1.5, 0.5, 0.5
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
-3.104871, -3.746963, -4,
-3.104871, -3.746963, 4,
-3.104871, -3.746963, -4,
-3.264291, -3.92228, -4,
-3.104871, -3.746963, -2,
-3.264291, -3.92228, -2,
-3.104871, -3.746963, 0,
-3.264291, -3.92228, 0,
-3.104871, -3.746963, 2,
-3.264291, -3.92228, 2,
-3.104871, -3.746963, 4,
-3.264291, -3.92228, 4
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
-3.583129, -4.272913, -4, 0, -0.5, 0.5, 0.5,
-3.583129, -4.272913, -4, 1, -0.5, 0.5, 0.5,
-3.583129, -4.272913, -4, 1, 1.5, 0.5, 0.5,
-3.583129, -4.272913, -4, 0, 1.5, 0.5, 0.5,
-3.583129, -4.272913, -2, 0, -0.5, 0.5, 0.5,
-3.583129, -4.272913, -2, 1, -0.5, 0.5, 0.5,
-3.583129, -4.272913, -2, 1, 1.5, 0.5, 0.5,
-3.583129, -4.272913, -2, 0, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 0, 0, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 0, 1, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 0, 1, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 0, 0, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 2, 0, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 2, 1, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 2, 1, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 2, 0, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 4, 0, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 4, 1, -0.5, 0.5, 0.5,
-3.583129, -4.272913, 4, 1, 1.5, 0.5, 0.5,
-3.583129, -4.272913, 4, 0, 1.5, 0.5, 0.5
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
-3.104871, -3.746963, -4.971258,
-3.104871, 3.265716, -4.971258,
-3.104871, -3.746963, 5.262228,
-3.104871, 3.265716, 5.262228,
-3.104871, -3.746963, -4.971258,
-3.104871, -3.746963, 5.262228,
-3.104871, 3.265716, -4.971258,
-3.104871, 3.265716, 5.262228,
-3.104871, -3.746963, -4.971258,
3.271902, -3.746963, -4.971258,
-3.104871, -3.746963, 5.262228,
3.271902, -3.746963, 5.262228,
-3.104871, 3.265716, -4.971258,
3.271902, 3.265716, -4.971258,
-3.104871, 3.265716, 5.262228,
3.271902, 3.265716, 5.262228,
3.271902, -3.746963, -4.971258,
3.271902, 3.265716, -4.971258,
3.271902, -3.746963, 5.262228,
3.271902, 3.265716, 5.262228,
3.271902, -3.746963, -4.971258,
3.271902, -3.746963, 5.262228,
3.271902, 3.265716, -4.971258,
3.271902, 3.265716, 5.262228
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
var radius = 7.448314;
var distance = 33.13839;
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
mvMatrix.translate( -0.08351529, 0.2406231, -0.1454852 );
mvMatrix.scale( 1.262906, 1.148386, 0.786952 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.13839);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-Chlorbutan<-read.table("1-Chlorbutan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.012006, -0.00266832, -2.096927, 0, 0, 1, 1, 1,
-2.987569, -1.225785, 0.2884605, 1, 0, 0, 1, 1,
-2.821451, 1.552913, -3.168585, 1, 0, 0, 1, 1,
-2.709951, 0.9896547, 0.2638453, 1, 0, 0, 1, 1,
-2.695966, -0.8086435, -2.577079, 1, 0, 0, 1, 1,
-2.681978, -0.4049176, -3.495029, 1, 0, 0, 1, 1,
-2.513771, 0.06654366, -2.184571, 0, 0, 0, 1, 1,
-2.471318, 2.684894, -1.696982, 0, 0, 0, 1, 1,
-2.4411, 1.398353, -1.1795, 0, 0, 0, 1, 1,
-2.390965, 1.09076, -2.218791, 0, 0, 0, 1, 1,
-2.32071, 0.2342033, -0.486144, 0, 0, 0, 1, 1,
-2.28971, 0.8252955, -0.7865348, 0, 0, 0, 1, 1,
-2.274022, 0.8108194, -0.06736293, 0, 0, 0, 1, 1,
-2.249293, -0.3348401, -1.118585, 1, 1, 1, 1, 1,
-2.175045, -0.06012028, -1.85744, 1, 1, 1, 1, 1,
-2.138315, 0.3501645, -1.327644, 1, 1, 1, 1, 1,
-2.126395, -0.4417813, -1.232227, 1, 1, 1, 1, 1,
-2.123683, -0.7962546, -4.121133, 1, 1, 1, 1, 1,
-2.116067, 1.023141, -0.7385992, 1, 1, 1, 1, 1,
-2.099055, -0.4074109, -1.552685, 1, 1, 1, 1, 1,
-2.077427, 0.6276798, -1.921583, 1, 1, 1, 1, 1,
-2.06643, -1.095527, -2.559299, 1, 1, 1, 1, 1,
-2.047297, 0.1120546, -1.734582, 1, 1, 1, 1, 1,
-2.002524, -0.2165594, -1.740555, 1, 1, 1, 1, 1,
-1.996398, -1.767931, -2.768048, 1, 1, 1, 1, 1,
-1.990578, -1.612622, -0.8483338, 1, 1, 1, 1, 1,
-1.982522, 1.865111, 0.0672301, 1, 1, 1, 1, 1,
-1.965775, 0.4368391, -1.068864, 1, 1, 1, 1, 1,
-1.953593, 1.30108, -0.5713704, 0, 0, 1, 1, 1,
-1.9387, -0.5358769, -2.844179, 1, 0, 0, 1, 1,
-1.908061, -0.3130322, -1.68229, 1, 0, 0, 1, 1,
-1.89903, -2.942175, -3.227803, 1, 0, 0, 1, 1,
-1.87151, 1.213417, -0.02975305, 1, 0, 0, 1, 1,
-1.866859, -1.888214, -2.858494, 1, 0, 0, 1, 1,
-1.860803, 1.125325, -0.7410802, 0, 0, 0, 1, 1,
-1.853822, -0.6964833, -1.543794, 0, 0, 0, 1, 1,
-1.850847, -0.6046995, -2.33603, 0, 0, 0, 1, 1,
-1.848454, -0.9264101, -1.919386, 0, 0, 0, 1, 1,
-1.837209, 0.6727778, -1.172252, 0, 0, 0, 1, 1,
-1.801759, 0.3651564, -3.100915, 0, 0, 0, 1, 1,
-1.79065, 0.9595259, 1.001701, 0, 0, 0, 1, 1,
-1.785258, 0.2200333, -1.480003, 1, 1, 1, 1, 1,
-1.76815, 1.349022, 0.1337272, 1, 1, 1, 1, 1,
-1.762357, 0.7202362, -1.356287, 1, 1, 1, 1, 1,
-1.738241, -1.976957, -1.928604, 1, 1, 1, 1, 1,
-1.734477, 0.1911661, -0.4384678, 1, 1, 1, 1, 1,
-1.72805, -1.813048, -2.763846, 1, 1, 1, 1, 1,
-1.707473, 1.88008, 1.940232, 1, 1, 1, 1, 1,
-1.703338, 0.6223336, -2.127802, 1, 1, 1, 1, 1,
-1.700629, -0.4634188, -3.351604, 1, 1, 1, 1, 1,
-1.690728, -0.5341833, -1.289137, 1, 1, 1, 1, 1,
-1.677553, 1.676124, -0.7283214, 1, 1, 1, 1, 1,
-1.674314, 1.47954, -0.7080922, 1, 1, 1, 1, 1,
-1.670439, -1.074889, -2.257752, 1, 1, 1, 1, 1,
-1.660682, -1.275486, -2.358051, 1, 1, 1, 1, 1,
-1.660324, 0.0649202, -1.323198, 1, 1, 1, 1, 1,
-1.652114, -2.231023, -1.888544, 0, 0, 1, 1, 1,
-1.650264, 0.1402811, -0.5322183, 1, 0, 0, 1, 1,
-1.641818, -0.7185043, -3.641007, 1, 0, 0, 1, 1,
-1.637453, 1.454221, 0.1531224, 1, 0, 0, 1, 1,
-1.63226, -1.052419, -1.175419, 1, 0, 0, 1, 1,
-1.631111, 0.7786496, -0.6531033, 1, 0, 0, 1, 1,
-1.618149, 0.2851337, -0.999353, 0, 0, 0, 1, 1,
-1.617139, -0.02392216, -0.8746173, 0, 0, 0, 1, 1,
-1.612942, 0.149846, -1.611772, 0, 0, 0, 1, 1,
-1.590476, -0.2403672, -2.400771, 0, 0, 0, 1, 1,
-1.58717, -0.3490547, -2.428519, 0, 0, 0, 1, 1,
-1.585173, 1.422458, -0.5708398, 0, 0, 0, 1, 1,
-1.584341, 0.353327, -1.977778, 0, 0, 0, 1, 1,
-1.577899, -0.6340466, -0.7125474, 1, 1, 1, 1, 1,
-1.573072, 2.876792, -0.616662, 1, 1, 1, 1, 1,
-1.56523, 1.534563, -0.8433724, 1, 1, 1, 1, 1,
-1.538884, -0.9083714, -2.948064, 1, 1, 1, 1, 1,
-1.510301, -2.143578, 0.7514413, 1, 1, 1, 1, 1,
-1.506982, 0.3651501, -1.386748, 1, 1, 1, 1, 1,
-1.506333, 0.802954, -2.962757, 1, 1, 1, 1, 1,
-1.473357, -0.9968119, -2.843103, 1, 1, 1, 1, 1,
-1.454632, -0.6934222, -2.992623, 1, 1, 1, 1, 1,
-1.445935, 0.1189856, -0.4946258, 1, 1, 1, 1, 1,
-1.442859, -1.370237, -3.40824, 1, 1, 1, 1, 1,
-1.431617, 0.2132653, -0.7804874, 1, 1, 1, 1, 1,
-1.424644, -0.6438603, -2.022057, 1, 1, 1, 1, 1,
-1.421023, 0.3557912, -2.17611, 1, 1, 1, 1, 1,
-1.406434, -1.458022, -3.990806, 1, 1, 1, 1, 1,
-1.400045, -0.2753971, -2.183755, 0, 0, 1, 1, 1,
-1.386114, -1.072325, -1.374169, 1, 0, 0, 1, 1,
-1.3817, 1.015578, -1.014269, 1, 0, 0, 1, 1,
-1.380361, -0.7195746, -1.747929, 1, 0, 0, 1, 1,
-1.370763, -0.584562, -1.346246, 1, 0, 0, 1, 1,
-1.369102, -2.123942, -3.913383, 1, 0, 0, 1, 1,
-1.361963, 0.05075823, -0.6260248, 0, 0, 0, 1, 1,
-1.360213, 0.5652577, -0.248313, 0, 0, 0, 1, 1,
-1.358754, -1.571261, -1.915341, 0, 0, 0, 1, 1,
-1.34974, 1.521396, -0.3775393, 0, 0, 0, 1, 1,
-1.349635, -0.1008746, -3.586962, 0, 0, 0, 1, 1,
-1.3318, 0.1754417, -2.629534, 0, 0, 0, 1, 1,
-1.325558, -0.1097113, -1.919772, 0, 0, 0, 1, 1,
-1.309597, -2.691057, -1.900138, 1, 1, 1, 1, 1,
-1.308931, -0.9097614, -1.953456, 1, 1, 1, 1, 1,
-1.302702, -0.1141177, -1.014734, 1, 1, 1, 1, 1,
-1.30183, 0.142643, 0.1653329, 1, 1, 1, 1, 1,
-1.300941, -1.953605, -2.581316, 1, 1, 1, 1, 1,
-1.299515, 0.5898005, -0.9513366, 1, 1, 1, 1, 1,
-1.291802, 2.812013, -1.203667, 1, 1, 1, 1, 1,
-1.291167, 0.1214481, -2.806549, 1, 1, 1, 1, 1,
-1.290306, -1.890286, -2.508106, 1, 1, 1, 1, 1,
-1.287972, -2.097804, -2.795529, 1, 1, 1, 1, 1,
-1.27626, -1.335941, -0.3940074, 1, 1, 1, 1, 1,
-1.275888, 1.220906, -0.09687594, 1, 1, 1, 1, 1,
-1.274852, -2.041229, -0.7218883, 1, 1, 1, 1, 1,
-1.269913, 1.417261, -0.5495417, 1, 1, 1, 1, 1,
-1.266178, 1.102457, -1.84763, 1, 1, 1, 1, 1,
-1.260853, 1.392997, -0.3467198, 0, 0, 1, 1, 1,
-1.255383, -0.3957614, -3.324021, 1, 0, 0, 1, 1,
-1.254529, 0.598821, -1.901493, 1, 0, 0, 1, 1,
-1.251605, -0.742527, -0.8710965, 1, 0, 0, 1, 1,
-1.226833, 1.69044, -0.2057064, 1, 0, 0, 1, 1,
-1.224339, -0.4006415, -2.555899, 1, 0, 0, 1, 1,
-1.222253, 0.6034179, -1.163679, 0, 0, 0, 1, 1,
-1.217768, 0.3784687, -0.6721001, 0, 0, 0, 1, 1,
-1.215081, -0.3065756, -3.19783, 0, 0, 0, 1, 1,
-1.202135, 0.06657931, -1.506708, 0, 0, 0, 1, 1,
-1.197204, -1.789483, -0.3547255, 0, 0, 0, 1, 1,
-1.189613, 0.2050399, -2.375311, 0, 0, 0, 1, 1,
-1.18568, 0.8073749, 0.7004414, 0, 0, 0, 1, 1,
-1.183775, 0.9253623, 0.08657477, 1, 1, 1, 1, 1,
-1.181562, -2.284863, -2.951862, 1, 1, 1, 1, 1,
-1.169394, 1.506855, 1.066848, 1, 1, 1, 1, 1,
-1.144647, 1.199878, -0.6576468, 1, 1, 1, 1, 1,
-1.141367, 0.4248469, 0.06288363, 1, 1, 1, 1, 1,
-1.141033, 0.1598123, -0.4007646, 1, 1, 1, 1, 1,
-1.134296, 2.149179, -0.9860042, 1, 1, 1, 1, 1,
-1.133744, 0.08053245, -1.244326, 1, 1, 1, 1, 1,
-1.133375, 1.0931, -0.129206, 1, 1, 1, 1, 1,
-1.130062, -0.4943673, -1.680283, 1, 1, 1, 1, 1,
-1.105162, -0.3980065, -1.879641, 1, 1, 1, 1, 1,
-1.103037, 0.4662845, -0.5036671, 1, 1, 1, 1, 1,
-1.098193, -1.290481, -2.786064, 1, 1, 1, 1, 1,
-1.08462, 0.1260698, -1.812728, 1, 1, 1, 1, 1,
-1.082455, -0.2812789, -2.507473, 1, 1, 1, 1, 1,
-1.080453, -0.2504297, -2.227505, 0, 0, 1, 1, 1,
-1.078983, -0.07396589, -1.050545, 1, 0, 0, 1, 1,
-1.078072, 0.4630075, 0.2207687, 1, 0, 0, 1, 1,
-1.06225, 1.443038, -1.053702, 1, 0, 0, 1, 1,
-1.061442, -0.2159195, -3.599448, 1, 0, 0, 1, 1,
-1.056389, -2.781835, -3.174025, 1, 0, 0, 1, 1,
-1.05025, 0.8916785, -2.032073, 0, 0, 0, 1, 1,
-1.042838, -0.128082, -2.768047, 0, 0, 0, 1, 1,
-1.041938, 0.5804434, -1.342171, 0, 0, 0, 1, 1,
-1.041672, 0.4041345, -0.7738962, 0, 0, 0, 1, 1,
-1.041029, -0.5570247, 0.03565367, 0, 0, 0, 1, 1,
-1.026401, -0.675108, -2.748099, 0, 0, 0, 1, 1,
-1.014657, 0.4054152, -0.8391286, 0, 0, 0, 1, 1,
-1.014441, -0.4016814, -0.05509972, 1, 1, 1, 1, 1,
-1.008268, 0.9544846, 1.236796, 1, 1, 1, 1, 1,
-1.003422, -0.3952797, -1.928592, 1, 1, 1, 1, 1,
-1.002416, 0.04899752, -1.412522, 1, 1, 1, 1, 1,
-1.001192, 0.6837735, -0.4993024, 1, 1, 1, 1, 1,
-0.9999261, 1.205713, -2.294594, 1, 1, 1, 1, 1,
-0.9928517, 0.2871013, -1.277067, 1, 1, 1, 1, 1,
-0.9913448, 1.352942, -0.1391974, 1, 1, 1, 1, 1,
-0.9897316, -0.2296, -2.488668, 1, 1, 1, 1, 1,
-0.9791524, -2.454169, -3.48268, 1, 1, 1, 1, 1,
-0.9791163, -0.4435499, -3.275277, 1, 1, 1, 1, 1,
-0.9777063, -0.6205309, -1.310255, 1, 1, 1, 1, 1,
-0.9567479, -1.057044, -1.104389, 1, 1, 1, 1, 1,
-0.9513945, 0.05956497, -0.9037516, 1, 1, 1, 1, 1,
-0.9460074, 0.1465923, -3.195109, 1, 1, 1, 1, 1,
-0.941997, 1.916639, -0.9417819, 0, 0, 1, 1, 1,
-0.9352788, 0.914027, 0.02603802, 1, 0, 0, 1, 1,
-0.9348171, 1.642412, 1.369708, 1, 0, 0, 1, 1,
-0.9283562, 0.7360311, -0.5828449, 1, 0, 0, 1, 1,
-0.9254926, -1.210491, -1.433743, 1, 0, 0, 1, 1,
-0.9236249, 2.265875, -0.315147, 1, 0, 0, 1, 1,
-0.9206411, 1.779278, -0.6031566, 0, 0, 0, 1, 1,
-0.9139683, 0.7439126, -0.5098271, 0, 0, 0, 1, 1,
-0.9105558, -0.7779531, -1.34661, 0, 0, 0, 1, 1,
-0.9091652, 1.404751, 0.199876, 0, 0, 0, 1, 1,
-0.9033079, 0.5791361, -0.7627236, 0, 0, 0, 1, 1,
-0.9022809, -1.898962, -4.179356, 0, 0, 0, 1, 1,
-0.8959025, -0.5253634, -1.430337, 0, 0, 0, 1, 1,
-0.8953521, -1.947333, -3.437632, 1, 1, 1, 1, 1,
-0.8940174, -2.865991, -2.438823, 1, 1, 1, 1, 1,
-0.8924429, -1.002368, -2.079278, 1, 1, 1, 1, 1,
-0.8923433, -1.477148, -2.969855, 1, 1, 1, 1, 1,
-0.8887144, -0.4190932, -0.7556187, 1, 1, 1, 1, 1,
-0.8867253, -0.1006015, -2.024956, 1, 1, 1, 1, 1,
-0.8852478, 0.6590989, 0.4540215, 1, 1, 1, 1, 1,
-0.8842084, 0.6146445, 0.7297619, 1, 1, 1, 1, 1,
-0.8600623, -0.425754, -1.524612, 1, 1, 1, 1, 1,
-0.8584133, 0.5665918, 0.5237283, 1, 1, 1, 1, 1,
-0.8565236, 0.4198947, -1.743186, 1, 1, 1, 1, 1,
-0.8531847, 1.009776, -0.718998, 1, 1, 1, 1, 1,
-0.8517712, -1.041461, -2.281249, 1, 1, 1, 1, 1,
-0.8502572, 0.7546613, 0.6649163, 1, 1, 1, 1, 1,
-0.849701, -0.597775, -0.4842178, 1, 1, 1, 1, 1,
-0.8459973, -0.3072014, -0.9697467, 0, 0, 1, 1, 1,
-0.8456715, -1.109945, -3.099685, 1, 0, 0, 1, 1,
-0.8418335, 1.139952, -0.5593469, 1, 0, 0, 1, 1,
-0.8391393, 0.5105853, -0.5593272, 1, 0, 0, 1, 1,
-0.8385642, 0.7809442, 0.2830269, 1, 0, 0, 1, 1,
-0.8371112, -2.329917, -3.475663, 1, 0, 0, 1, 1,
-0.8312507, -0.8526713, -3.348425, 0, 0, 0, 1, 1,
-0.8277934, -0.04814892, -2.408701, 0, 0, 0, 1, 1,
-0.8176296, 1.680855, -0.5985073, 0, 0, 0, 1, 1,
-0.8102121, 1.7627, -0.9315045, 0, 0, 0, 1, 1,
-0.809659, 1.032752, -1.342727, 0, 0, 0, 1, 1,
-0.8058671, -1.704446, -2.548587, 0, 0, 0, 1, 1,
-0.8037532, 0.119091, -1.321382, 0, 0, 0, 1, 1,
-0.799594, 1.3738, -0.9989514, 1, 1, 1, 1, 1,
-0.7976967, -0.6023818, -1.437896, 1, 1, 1, 1, 1,
-0.7901578, -1.118206, -3.04591, 1, 1, 1, 1, 1,
-0.7896256, -1.844494, -3.358186, 1, 1, 1, 1, 1,
-0.7865853, 0.3677269, -1.028573, 1, 1, 1, 1, 1,
-0.7842336, 1.076919, -1.823521, 1, 1, 1, 1, 1,
-0.7833511, 0.3642453, -1.024398, 1, 1, 1, 1, 1,
-0.7823517, -0.327673, -2.123538, 1, 1, 1, 1, 1,
-0.7757698, -0.05182834, -1.193187, 1, 1, 1, 1, 1,
-0.7756432, -0.7276554, -2.807665, 1, 1, 1, 1, 1,
-0.7746652, 1.053178, -0.3248824, 1, 1, 1, 1, 1,
-0.7687792, 1.059182, -3.184984, 1, 1, 1, 1, 1,
-0.7603297, -0.9941893, -2.446262, 1, 1, 1, 1, 1,
-0.7506401, -0.479834, -4.090329, 1, 1, 1, 1, 1,
-0.7483841, 0.5463801, -0.3483762, 1, 1, 1, 1, 1,
-0.7478542, -0.01329225, -2.713734, 0, 0, 1, 1, 1,
-0.7437674, 0.2041267, -0.4891365, 1, 0, 0, 1, 1,
-0.7401382, -0.1849625, -2.262749, 1, 0, 0, 1, 1,
-0.7391608, -0.4998661, -1.019946, 1, 0, 0, 1, 1,
-0.7384177, 0.6706246, -2.616921, 1, 0, 0, 1, 1,
-0.7379414, 0.4883949, -1.632076, 1, 0, 0, 1, 1,
-0.7355927, 0.4985633, -3.054281, 0, 0, 0, 1, 1,
-0.7310468, 0.6614016, -0.8617634, 0, 0, 0, 1, 1,
-0.728844, 0.2648635, -1.493811, 0, 0, 0, 1, 1,
-0.727547, -1.193112, -3.401196, 0, 0, 0, 1, 1,
-0.7256643, -0.4123832, -2.102381, 0, 0, 0, 1, 1,
-0.7232443, -0.7897418, -1.304349, 0, 0, 0, 1, 1,
-0.7162679, 0.5538915, -1.744726, 0, 0, 0, 1, 1,
-0.7158565, 0.1737188, -0.6600696, 1, 1, 1, 1, 1,
-0.715781, -1.104147, -3.924455, 1, 1, 1, 1, 1,
-0.7125784, 1.27113, -0.6131586, 1, 1, 1, 1, 1,
-0.7078298, -2.238875, -2.979986, 1, 1, 1, 1, 1,
-0.7070668, -1.222797, -2.150235, 1, 1, 1, 1, 1,
-0.7053027, -0.3391836, -1.613167, 1, 1, 1, 1, 1,
-0.702622, -0.1823775, -1.407405, 1, 1, 1, 1, 1,
-0.7024395, 0.7071887, -0.4535767, 1, 1, 1, 1, 1,
-0.7019893, -1.374581, -1.572907, 1, 1, 1, 1, 1,
-0.6970819, 0.6794631, -0.20941, 1, 1, 1, 1, 1,
-0.6949992, 0.4044045, -1.194009, 1, 1, 1, 1, 1,
-0.6944688, 0.3453705, -2.869602, 1, 1, 1, 1, 1,
-0.6943118, 0.7240364, -1.734736, 1, 1, 1, 1, 1,
-0.6879591, 1.430338, 1.027575, 1, 1, 1, 1, 1,
-0.6833981, 0.3864786, -1.091831, 1, 1, 1, 1, 1,
-0.6734955, -0.4235401, -2.304772, 0, 0, 1, 1, 1,
-0.6728492, -1.014603, -2.628156, 1, 0, 0, 1, 1,
-0.6722697, -0.7158621, -3.203206, 1, 0, 0, 1, 1,
-0.6718001, 1.487478, -0.6554829, 1, 0, 0, 1, 1,
-0.6676911, -1.129682, -4.288243, 1, 0, 0, 1, 1,
-0.6655995, 0.8360003, 0.5556256, 1, 0, 0, 1, 1,
-0.665215, 1.079186, -0.07027433, 0, 0, 0, 1, 1,
-0.6556944, -1.029117, -1.733308, 0, 0, 0, 1, 1,
-0.6552761, -0.09337666, -3.05395, 0, 0, 0, 1, 1,
-0.6503628, -0.4063093, -3.888221, 0, 0, 0, 1, 1,
-0.6457503, 0.307632, -0.9477625, 0, 0, 0, 1, 1,
-0.6420975, -0.8571081, -0.3321702, 0, 0, 0, 1, 1,
-0.6367429, 0.5705037, -2.76732, 0, 0, 0, 1, 1,
-0.6366603, -1.021495, -3.18944, 1, 1, 1, 1, 1,
-0.6277609, 2.174827, -0.4233648, 1, 1, 1, 1, 1,
-0.6268775, -0.148408, -2.683179, 1, 1, 1, 1, 1,
-0.6245003, 0.9845138, -0.5209829, 1, 1, 1, 1, 1,
-0.6221193, 0.1504051, -1.460639, 1, 1, 1, 1, 1,
-0.6179191, -1.23495, -3.212021, 1, 1, 1, 1, 1,
-0.6129575, -1.407803, -4.822227, 1, 1, 1, 1, 1,
-0.6116267, 2.07501, -1.183185, 1, 1, 1, 1, 1,
-0.6115542, 0.1504564, -2.077077, 1, 1, 1, 1, 1,
-0.6109395, 1.063959, 1.346225, 1, 1, 1, 1, 1,
-0.6103655, -0.6960897, -1.191228, 1, 1, 1, 1, 1,
-0.6092801, 0.6529128, -1.179227, 1, 1, 1, 1, 1,
-0.6063874, 0.64461, -1.76024, 1, 1, 1, 1, 1,
-0.6060283, 1.500236, -1.806599, 1, 1, 1, 1, 1,
-0.6035286, -2.718569, -2.360526, 1, 1, 1, 1, 1,
-0.6032553, -0.1367144, -2.110743, 0, 0, 1, 1, 1,
-0.6020055, 0.6682842, 0.6576842, 1, 0, 0, 1, 1,
-0.5957708, -1.384303, -3.238298, 1, 0, 0, 1, 1,
-0.5915846, -0.02857595, -1.300495, 1, 0, 0, 1, 1,
-0.5896947, -0.1956153, -2.644258, 1, 0, 0, 1, 1,
-0.5867472, 2.725954, 0.8995158, 1, 0, 0, 1, 1,
-0.580779, 1.059339, -1.144207, 0, 0, 0, 1, 1,
-0.5792655, 0.2716522, -2.672104, 0, 0, 0, 1, 1,
-0.5785174, 0.324378, -0.9716787, 0, 0, 0, 1, 1,
-0.5720364, -0.2297695, -1.164773, 0, 0, 0, 1, 1,
-0.5667271, 0.9454241, -0.4531648, 0, 0, 0, 1, 1,
-0.5663033, -1.057048, -0.8828475, 0, 0, 0, 1, 1,
-0.5627546, -1.081545, -2.179965, 0, 0, 0, 1, 1,
-0.5623944, 0.1114878, -1.149747, 1, 1, 1, 1, 1,
-0.5623021, 2.286399, 1.298934, 1, 1, 1, 1, 1,
-0.5608045, 0.0617059, -1.684435, 1, 1, 1, 1, 1,
-0.5607347, 1.980467, -1.276589, 1, 1, 1, 1, 1,
-0.555591, 0.8489133, 1.03692, 1, 1, 1, 1, 1,
-0.5523123, 2.004257, 0.8344339, 1, 1, 1, 1, 1,
-0.549547, -1.169919, -1.676293, 1, 1, 1, 1, 1,
-0.5436318, -1.299984, -2.041604, 1, 1, 1, 1, 1,
-0.5405569, -0.6880984, -3.709965, 1, 1, 1, 1, 1,
-0.538018, 0.4923143, 0.9256607, 1, 1, 1, 1, 1,
-0.5356588, 0.2114247, -1.279336, 1, 1, 1, 1, 1,
-0.5270221, 1.439251, 0.4427501, 1, 1, 1, 1, 1,
-0.5265725, -0.5300297, -3.049128, 1, 1, 1, 1, 1,
-0.5256224, 0.6577924, -3.334643, 1, 1, 1, 1, 1,
-0.5246471, 0.05231569, -2.261888, 1, 1, 1, 1, 1,
-0.5227016, -1.269439, -2.523855, 0, 0, 1, 1, 1,
-0.5183837, -0.1513204, -1.472144, 1, 0, 0, 1, 1,
-0.5173704, 0.7556404, -2.550938, 1, 0, 0, 1, 1,
-0.5171394, -0.4547246, -1.066332, 1, 0, 0, 1, 1,
-0.5153106, -0.2093073, -2.126654, 1, 0, 0, 1, 1,
-0.5152075, -0.24931, -1.635887, 1, 0, 0, 1, 1,
-0.5126697, -0.4900511, -1.391291, 0, 0, 0, 1, 1,
-0.5061049, -0.4431003, -1.560912, 0, 0, 0, 1, 1,
-0.5018756, -0.001012873, -1.923988, 0, 0, 0, 1, 1,
-0.4914879, -0.7256034, -2.016501, 0, 0, 0, 1, 1,
-0.4896842, 0.3136381, -1.170798, 0, 0, 0, 1, 1,
-0.4896213, 0.9529093, -1.407937, 0, 0, 0, 1, 1,
-0.4785589, 1.03053, -0.9044945, 0, 0, 0, 1, 1,
-0.4776189, 1.096101, -0.4879165, 1, 1, 1, 1, 1,
-0.4768727, 1.197595, -0.9751666, 1, 1, 1, 1, 1,
-0.473118, -1.167745, -2.723084, 1, 1, 1, 1, 1,
-0.4704359, -0.9752695, -1.546766, 1, 1, 1, 1, 1,
-0.4702059, 1.515597, 0.5083486, 1, 1, 1, 1, 1,
-0.4695896, -0.528849, -1.378067, 1, 1, 1, 1, 1,
-0.4692358, -0.8022501, -4.2688, 1, 1, 1, 1, 1,
-0.4691325, 0.9215749, -1.763058, 1, 1, 1, 1, 1,
-0.4626756, -0.484449, -4.271457, 1, 1, 1, 1, 1,
-0.4597893, -0.6465917, -1.274214, 1, 1, 1, 1, 1,
-0.4574842, -0.9304509, -2.686246, 1, 1, 1, 1, 1,
-0.452082, -0.8797048, -3.42491, 1, 1, 1, 1, 1,
-0.4511878, 0.2153944, 1.40087, 1, 1, 1, 1, 1,
-0.4503661, 1.908165, -1.001445, 1, 1, 1, 1, 1,
-0.4499744, -0.8798333, -3.430291, 1, 1, 1, 1, 1,
-0.4424951, -0.2031304, -2.692419, 0, 0, 1, 1, 1,
-0.4367373, 0.09411186, -1.661279, 1, 0, 0, 1, 1,
-0.4346902, -0.7631043, -3.968271, 1, 0, 0, 1, 1,
-0.4342977, -0.5093822, -3.313846, 1, 0, 0, 1, 1,
-0.4211095, 0.1629729, -0.924233, 1, 0, 0, 1, 1,
-0.4182721, 0.6131842, 0.4047025, 1, 0, 0, 1, 1,
-0.4171247, -0.290718, -1.181458, 0, 0, 0, 1, 1,
-0.4143724, -0.1686489, -1.25517, 0, 0, 0, 1, 1,
-0.4130625, -0.07696786, -1.386668, 0, 0, 0, 1, 1,
-0.4113459, -1.332132, -1.498345, 0, 0, 0, 1, 1,
-0.4093977, 0.3783975, 0.6252285, 0, 0, 0, 1, 1,
-0.4074483, -1.023813, -1.755873, 0, 0, 0, 1, 1,
-0.4039139, 0.4613128, -0.1413508, 0, 0, 0, 1, 1,
-0.4000663, 0.3835723, -3.891526, 1, 1, 1, 1, 1,
-0.3986418, 0.1272986, -0.172941, 1, 1, 1, 1, 1,
-0.396677, 1.950186, -1.015908, 1, 1, 1, 1, 1,
-0.3955061, -0.2718567, -1.371338, 1, 1, 1, 1, 1,
-0.3875001, -0.4737307, 0.14594, 1, 1, 1, 1, 1,
-0.3845269, -0.3455197, -2.280765, 1, 1, 1, 1, 1,
-0.3825521, -1.774947, -1.466776, 1, 1, 1, 1, 1,
-0.380557, 1.481811, -0.2397427, 1, 1, 1, 1, 1,
-0.3803891, -0.8129027, -2.87219, 1, 1, 1, 1, 1,
-0.3791468, 1.728522, -1.084214, 1, 1, 1, 1, 1,
-0.3775529, 1.19735, 0.2261967, 1, 1, 1, 1, 1,
-0.3772983, -0.9977042, -1.294891, 1, 1, 1, 1, 1,
-0.3704396, -0.5640911, -3.081949, 1, 1, 1, 1, 1,
-0.3624, 0.1990231, -0.5821041, 1, 1, 1, 1, 1,
-0.3618061, 0.7082825, 0.752527, 1, 1, 1, 1, 1,
-0.3542484, 1.267631, 0.8260958, 0, 0, 1, 1, 1,
-0.3465954, 1.335251, 0.5269192, 1, 0, 0, 1, 1,
-0.3455717, 2.250136, 0.4330918, 1, 0, 0, 1, 1,
-0.3425191, 0.05508697, -3.201855, 1, 0, 0, 1, 1,
-0.3385543, -0.1426702, -0.4580036, 1, 0, 0, 1, 1,
-0.3374468, -0.09471145, -0.9646389, 1, 0, 0, 1, 1,
-0.3329411, -0.09822688, -2.693926, 0, 0, 0, 1, 1,
-0.328781, 1.362968, -0.0621158, 0, 0, 0, 1, 1,
-0.3224839, -0.2496769, -2.847549, 0, 0, 0, 1, 1,
-0.322125, -0.2445571, -3.301706, 0, 0, 0, 1, 1,
-0.321468, 0.27062, -1.085011, 0, 0, 0, 1, 1,
-0.3144023, -0.4131329, -1.086675, 0, 0, 0, 1, 1,
-0.3114275, 3.16359, -0.1495579, 0, 0, 0, 1, 1,
-0.3081871, -1.487662, -2.777572, 1, 1, 1, 1, 1,
-0.3027775, -0.1877774, -1.154146, 1, 1, 1, 1, 1,
-0.3012603, -1.021887, -3.440076, 1, 1, 1, 1, 1,
-0.2950773, 0.757176, 0.3902571, 1, 1, 1, 1, 1,
-0.2943992, 0.2934243, 0.3227936, 1, 1, 1, 1, 1,
-0.2899483, 0.4780083, 0.3864477, 1, 1, 1, 1, 1,
-0.2874802, -0.9695208, -1.233701, 1, 1, 1, 1, 1,
-0.2836706, 0.3366399, -0.4981578, 1, 1, 1, 1, 1,
-0.2797051, -0.1661826, -2.41053, 1, 1, 1, 1, 1,
-0.2784259, 0.0009245881, -2.358206, 1, 1, 1, 1, 1,
-0.2759399, 0.7141739, -1.185714, 1, 1, 1, 1, 1,
-0.2744475, -0.5351922, -3.857432, 1, 1, 1, 1, 1,
-0.2721974, -2.751897, -3.566808, 1, 1, 1, 1, 1,
-0.2719987, -0.02357556, -2.336914, 1, 1, 1, 1, 1,
-0.2673884, 0.1885514, -2.220867, 1, 1, 1, 1, 1,
-0.2638249, 1.274172, -1.036649, 0, 0, 1, 1, 1,
-0.2635267, 1.361119, 0.3909644, 1, 0, 0, 1, 1,
-0.26283, 0.3038889, -3.682581, 1, 0, 0, 1, 1,
-0.2511073, 0.6979674, -0.8072525, 1, 0, 0, 1, 1,
-0.2491466, -1.397707, -1.769697, 1, 0, 0, 1, 1,
-0.2491197, 1.516986, 0.640274, 1, 0, 0, 1, 1,
-0.2411161, 0.8303152, -0.9746038, 0, 0, 0, 1, 1,
-0.2396807, -0.185097, -1.587621, 0, 0, 0, 1, 1,
-0.2369189, 0.113422, -0.2903877, 0, 0, 0, 1, 1,
-0.2321764, 0.9345216, -1.175682, 0, 0, 0, 1, 1,
-0.2320254, 0.3728664, 0.5720292, 0, 0, 0, 1, 1,
-0.2206717, 0.1602557, -0.8984563, 0, 0, 0, 1, 1,
-0.2159482, 0.9715251, 0.5003178, 0, 0, 0, 1, 1,
-0.2157314, -1.142847, -3.027943, 1, 1, 1, 1, 1,
-0.2150052, -0.07623345, -0.3830766, 1, 1, 1, 1, 1,
-0.2132502, -0.905462, -3.844562, 1, 1, 1, 1, 1,
-0.2112447, -1.160717, -2.79456, 1, 1, 1, 1, 1,
-0.2072901, -1.229385, -2.337533, 1, 1, 1, 1, 1,
-0.203508, -0.4324389, -3.810225, 1, 1, 1, 1, 1,
-0.2007347, 0.5495896, 0.5740772, 1, 1, 1, 1, 1,
-0.1968513, -1.007429, -2.842782, 1, 1, 1, 1, 1,
-0.1861656, -1.392621, -3.51008, 1, 1, 1, 1, 1,
-0.184747, -0.7862386, -2.500844, 1, 1, 1, 1, 1,
-0.1836265, 1.078029, -1.136762, 1, 1, 1, 1, 1,
-0.1740664, 0.9080095, -0.08148868, 1, 1, 1, 1, 1,
-0.1728725, -0.2297572, -3.719824, 1, 1, 1, 1, 1,
-0.1712674, 1.735767, -1.163694, 1, 1, 1, 1, 1,
-0.1709227, -1.469285, -3.149725, 1, 1, 1, 1, 1,
-0.1694604, -0.3138233, -3.53313, 0, 0, 1, 1, 1,
-0.1682945, -1.094682, -4.106559, 1, 0, 0, 1, 1,
-0.1666418, -0.1562521, -1.461868, 1, 0, 0, 1, 1,
-0.1639984, -0.2510729, -4.357152, 1, 0, 0, 1, 1,
-0.1614621, 2.865041, -0.6976698, 1, 0, 0, 1, 1,
-0.1607207, 0.7298453, -0.1339894, 1, 0, 0, 1, 1,
-0.156467, -0.1714364, -2.473362, 0, 0, 0, 1, 1,
-0.1549228, -1.176722, -4.232546, 0, 0, 0, 1, 1,
-0.1447522, 0.8448913, 0.02709338, 0, 0, 0, 1, 1,
-0.1361392, 0.133589, -0.554767, 0, 0, 0, 1, 1,
-0.1335053, 0.4308748, -0.06000999, 0, 0, 0, 1, 1,
-0.1333863, -0.3014661, -4.121319, 0, 0, 0, 1, 1,
-0.1329854, 1.377077, -0.1778537, 0, 0, 0, 1, 1,
-0.1289107, 0.1898094, -0.4731789, 1, 1, 1, 1, 1,
-0.1279251, -0.4028763, -3.797981, 1, 1, 1, 1, 1,
-0.1253119, 1.600773, -0.3543324, 1, 1, 1, 1, 1,
-0.1246789, 1.693606, -0.662944, 1, 1, 1, 1, 1,
-0.1245217, 0.1139216, -2.119285, 1, 1, 1, 1, 1,
-0.1241408, -0.9833159, -2.840216, 1, 1, 1, 1, 1,
-0.1201005, 0.5069373, -0.9473515, 1, 1, 1, 1, 1,
-0.1185648, 0.8196784, -0.5864985, 1, 1, 1, 1, 1,
-0.1170824, 0.5100453, 0.03997083, 1, 1, 1, 1, 1,
-0.1160415, 0.6667863, -1.201263, 1, 1, 1, 1, 1,
-0.1159626, -0.2306725, -3.60688, 1, 1, 1, 1, 1,
-0.1105926, 0.2985461, -0.8703239, 1, 1, 1, 1, 1,
-0.1083053, 1.237933, -1.559736, 1, 1, 1, 1, 1,
-0.1067473, 1.085041, -1.69823, 1, 1, 1, 1, 1,
-0.1051367, 1.073279, 0.3303981, 1, 1, 1, 1, 1,
-0.09648366, -1.804938, -2.081293, 0, 0, 1, 1, 1,
-0.09456222, -0.1016307, -2.829341, 1, 0, 0, 1, 1,
-0.08924629, -0.4758703, -3.152761, 1, 0, 0, 1, 1,
-0.08501576, -0.05113733, -4.5395, 1, 0, 0, 1, 1,
-0.08314509, -0.1345373, -1.427046, 1, 0, 0, 1, 1,
-0.07650307, -0.3650521, -2.062557, 1, 0, 0, 1, 1,
-0.06941318, 0.1280408, -2.121604, 0, 0, 0, 1, 1,
-0.06935969, -0.8183207, -3.244983, 0, 0, 0, 1, 1,
-0.06889123, -0.1128355, -3.143573, 0, 0, 0, 1, 1,
-0.06114695, 1.490882, -1.231, 0, 0, 0, 1, 1,
-0.05625765, 0.2473181, 0.8806689, 0, 0, 0, 1, 1,
-0.05479956, -0.2820484, -2.511744, 0, 0, 0, 1, 1,
-0.03936346, -1.03865, -3.34022, 0, 0, 0, 1, 1,
-0.03901747, 0.1489951, -0.7374538, 1, 1, 1, 1, 1,
-0.03762181, -0.5519465, -3.736708, 1, 1, 1, 1, 1,
-0.03446354, 1.489079, -0.9989134, 1, 1, 1, 1, 1,
-0.03442099, -0.1818557, -1.498943, 1, 1, 1, 1, 1,
-0.0324548, 0.9734917, 0.4061761, 1, 1, 1, 1, 1,
-0.03104327, 1.597667, -0.6881249, 1, 1, 1, 1, 1,
-0.02985979, 1.753019, -1.113248, 1, 1, 1, 1, 1,
-0.02861299, 0.5819231, -0.05138658, 1, 1, 1, 1, 1,
-0.0274304, 0.7331827, -0.2631063, 1, 1, 1, 1, 1,
-0.02440467, -0.106734, -3.313079, 1, 1, 1, 1, 1,
-0.02387559, 0.08644146, -0.7039612, 1, 1, 1, 1, 1,
-0.01949824, 0.1896908, -0.9613149, 1, 1, 1, 1, 1,
-0.01352359, 0.7704118, 0.6485602, 1, 1, 1, 1, 1,
-0.01283503, -0.2534918, -2.227417, 1, 1, 1, 1, 1,
-0.008790021, -0.5025126, -1.6359, 1, 1, 1, 1, 1,
-0.007985227, 0.2044657, -0.010648, 0, 0, 1, 1, 1,
-0.00248238, -0.03812391, -4.72946, 1, 0, 0, 1, 1,
0.001791935, 0.08286191, -2.29929, 1, 0, 0, 1, 1,
0.005419061, 0.7860537, -1.648522, 1, 0, 0, 1, 1,
0.006168043, 0.2451177, 1.825908, 1, 0, 0, 1, 1,
0.0064548, -0.3180353, 4.443706, 1, 0, 0, 1, 1,
0.006908732, 0.03846825, 1.415921, 0, 0, 0, 1, 1,
0.01075467, 0.7085521, -1.393385, 0, 0, 0, 1, 1,
0.01484642, 0.3396401, 0.3444636, 0, 0, 0, 1, 1,
0.01588922, -0.1719902, 3.356776, 0, 0, 0, 1, 1,
0.01910709, -0.4214856, 3.404757, 0, 0, 0, 1, 1,
0.02351268, -0.7966838, 1.147594, 0, 0, 0, 1, 1,
0.02445829, -0.6637487, 3.927973, 0, 0, 0, 1, 1,
0.02484588, -1.209753, 3.375889, 1, 1, 1, 1, 1,
0.02845018, 1.057764, -1.533862, 1, 1, 1, 1, 1,
0.03366267, -0.08407491, 5.113197, 1, 1, 1, 1, 1,
0.03705454, 0.3368807, -0.4991465, 1, 1, 1, 1, 1,
0.03868585, -0.6949155, 3.225209, 1, 1, 1, 1, 1,
0.0401301, 0.8657463, -1.332857, 1, 1, 1, 1, 1,
0.0469127, -0.5138174, 2.797915, 1, 1, 1, 1, 1,
0.04830905, 1.134675, -1.96317, 1, 1, 1, 1, 1,
0.05257601, -0.7558063, 3.237352, 1, 1, 1, 1, 1,
0.05745011, -0.4696477, 4.414509, 1, 1, 1, 1, 1,
0.05936201, 1.060884, 0.5193119, 1, 1, 1, 1, 1,
0.06091639, -1.012172, 2.445595, 1, 1, 1, 1, 1,
0.06266198, 0.263814, 0.3983071, 1, 1, 1, 1, 1,
0.06316812, 0.3257516, -0.7979949, 1, 1, 1, 1, 1,
0.07254948, -1.107955, 2.893397, 1, 1, 1, 1, 1,
0.07853904, -0.8040802, 3.010134, 0, 0, 1, 1, 1,
0.07908141, -0.8333287, 2.451066, 1, 0, 0, 1, 1,
0.08005287, -0.5383072, 2.83391, 1, 0, 0, 1, 1,
0.08009075, 0.4720778, -0.415494, 1, 0, 0, 1, 1,
0.08234325, -0.2990979, 1.80108, 1, 0, 0, 1, 1,
0.08294018, -0.1793213, 2.764589, 1, 0, 0, 1, 1,
0.08447783, 0.3974945, 0.8388034, 0, 0, 0, 1, 1,
0.08627067, 0.8968812, -0.7258446, 0, 0, 0, 1, 1,
0.08680871, 0.5378773, -0.5970477, 0, 0, 0, 1, 1,
0.08849715, -2.07648, 3.488143, 0, 0, 0, 1, 1,
0.09228298, 1.049739, 2.025562, 0, 0, 0, 1, 1,
0.09928417, -0.08508431, 2.863494, 0, 0, 0, 1, 1,
0.1020535, -1.495771, 2.27612, 0, 0, 0, 1, 1,
0.1043311, 0.4018753, 1.019729, 1, 1, 1, 1, 1,
0.1099087, 1.151573, -0.2102072, 1, 1, 1, 1, 1,
0.1112205, 0.8803266, -0.2182038, 1, 1, 1, 1, 1,
0.1121555, -1.667765, 3.163584, 1, 1, 1, 1, 1,
0.1126438, -0.4211071, 3.274231, 1, 1, 1, 1, 1,
0.1155635, -0.2954499, 1.396421, 1, 1, 1, 1, 1,
0.122171, -1.402209, 3.154371, 1, 1, 1, 1, 1,
0.1274034, 1.737384, -0.6919401, 1, 1, 1, 1, 1,
0.1277929, -1.872609, 4.097101, 1, 1, 1, 1, 1,
0.1291008, -1.597602, 4.945089, 1, 1, 1, 1, 1,
0.1384489, 1.508053, 2.101392, 1, 1, 1, 1, 1,
0.1399484, -0.3374913, 2.306347, 1, 1, 1, 1, 1,
0.1430998, -0.0162628, 1.783259, 1, 1, 1, 1, 1,
0.1446668, -0.5529509, 4.835368, 1, 1, 1, 1, 1,
0.1447463, -0.631274, 1.414337, 1, 1, 1, 1, 1,
0.1462788, -3.644836, 2.950402, 0, 0, 1, 1, 1,
0.1498963, -1.129664, 1.46965, 1, 0, 0, 1, 1,
0.1510944, -1.217733, 2.854318, 1, 0, 0, 1, 1,
0.15233, -1.521516, 2.869299, 1, 0, 0, 1, 1,
0.157333, 1.502323, 1.808136, 1, 0, 0, 1, 1,
0.1604414, -1.283827, 1.436016, 1, 0, 0, 1, 1,
0.1620762, 0.6146884, 2.307891, 0, 0, 0, 1, 1,
0.1672458, -0.7463574, 3.296434, 0, 0, 0, 1, 1,
0.1680196, -0.9435869, 2.973478, 0, 0, 0, 1, 1,
0.1685196, -0.07869163, 2.784581, 0, 0, 0, 1, 1,
0.1687161, 0.8832875, -1.532461, 0, 0, 0, 1, 1,
0.169624, 0.3516637, 1.207611, 0, 0, 0, 1, 1,
0.176934, 1.52297, 2.471591, 0, 0, 0, 1, 1,
0.1781963, 1.596825, 0.5289537, 1, 1, 1, 1, 1,
0.1796471, 0.3130993, -0.5690671, 1, 1, 1, 1, 1,
0.1803496, -1.476559, 2.671729, 1, 1, 1, 1, 1,
0.1819684, 0.08124004, 2.946508, 1, 1, 1, 1, 1,
0.18651, -0.9159924, 3.241226, 1, 1, 1, 1, 1,
0.1886466, -0.5926557, 1.991991, 1, 1, 1, 1, 1,
0.1895226, -2.268734, 2.526983, 1, 1, 1, 1, 1,
0.1905845, 1.681493, -0.171782, 1, 1, 1, 1, 1,
0.1914914, -2.321467, 2.481777, 1, 1, 1, 1, 1,
0.1948915, 0.5159202, 0.4087425, 1, 1, 1, 1, 1,
0.1978328, -0.4847455, 2.549567, 1, 1, 1, 1, 1,
0.1981229, -0.3137681, 3.403744, 1, 1, 1, 1, 1,
0.2026124, 0.1169702, 1.473895, 1, 1, 1, 1, 1,
0.2031147, 1.495183, -0.4172242, 1, 1, 1, 1, 1,
0.2044363, -0.09312738, 2.434625, 1, 1, 1, 1, 1,
0.2067631, 0.2368289, 0.7753413, 0, 0, 1, 1, 1,
0.2069254, 0.1775789, 0.8570113, 1, 0, 0, 1, 1,
0.2087966, -0.9107306, 2.255793, 1, 0, 0, 1, 1,
0.2109394, -1.147184, 3.200588, 1, 0, 0, 1, 1,
0.2141457, 1.273696, 0.08713023, 1, 0, 0, 1, 1,
0.219656, 1.384974, 0.2114978, 1, 0, 0, 1, 1,
0.2257078, 1.979446, -2.082944, 0, 0, 0, 1, 1,
0.2265484, 0.1831528, 1.820142, 0, 0, 0, 1, 1,
0.2322508, 0.6297135, 0.9210182, 0, 0, 0, 1, 1,
0.2349885, -1.353226, 4.560953, 0, 0, 0, 1, 1,
0.2353284, -0.6046747, 3.071524, 0, 0, 0, 1, 1,
0.2354315, -0.4266365, 0.5462826, 0, 0, 0, 1, 1,
0.2362835, 1.302699, 1.855784, 0, 0, 0, 1, 1,
0.2397806, 0.3854775, 1.108186, 1, 1, 1, 1, 1,
0.2496465, -0.04143802, 1.58937, 1, 1, 1, 1, 1,
0.2520812, 0.3633513, 1.196663, 1, 1, 1, 1, 1,
0.2523291, 0.9664442, -0.4811718, 1, 1, 1, 1, 1,
0.254206, 0.5417824, -1.581473, 1, 1, 1, 1, 1,
0.256449, -0.5360216, 2.503029, 1, 1, 1, 1, 1,
0.2608942, -0.2838486, 1.773319, 1, 1, 1, 1, 1,
0.2618815, 1.66218, -0.5373853, 1, 1, 1, 1, 1,
0.2620158, -0.391152, 4.366998, 1, 1, 1, 1, 1,
0.2671947, -0.7845262, 2.956261, 1, 1, 1, 1, 1,
0.2743134, -0.1311656, -0.5753333, 1, 1, 1, 1, 1,
0.2751932, 0.1086474, 1.379067, 1, 1, 1, 1, 1,
0.2755674, 0.2208688, 0.6209788, 1, 1, 1, 1, 1,
0.2769342, -0.4814828, 1.935766, 1, 1, 1, 1, 1,
0.2797095, -0.00042034, -0.1221387, 1, 1, 1, 1, 1,
0.2799687, 2.686221, 0.3789534, 0, 0, 1, 1, 1,
0.2814102, -0.1135645, 2.274154, 1, 0, 0, 1, 1,
0.2850921, 0.3914369, 3.09384, 1, 0, 0, 1, 1,
0.2868808, -0.758516, 2.535214, 1, 0, 0, 1, 1,
0.2906737, 1.372967, 0.5368517, 1, 0, 0, 1, 1,
0.2919533, -0.7180692, 1.303249, 1, 0, 0, 1, 1,
0.2948554, -1.362882, 3.367965, 0, 0, 0, 1, 1,
0.300775, 0.414352, 1.162259, 0, 0, 0, 1, 1,
0.306244, -0.7553376, 4.088639, 0, 0, 0, 1, 1,
0.3062702, -1.342752, 3.073228, 0, 0, 0, 1, 1,
0.3066303, 1.708244, 0.5176308, 0, 0, 0, 1, 1,
0.3097461, -1.397288, 2.821467, 0, 0, 0, 1, 1,
0.3103853, 1.67685, 0.3178118, 0, 0, 0, 1, 1,
0.3108695, 0.6377972, -0.8674538, 1, 1, 1, 1, 1,
0.3170929, -0.01877616, 1.242389, 1, 1, 1, 1, 1,
0.3182448, 2.470402, 0.7478605, 1, 1, 1, 1, 1,
0.3203705, 0.2806464, 0.3134719, 1, 1, 1, 1, 1,
0.3210325, -0.1131188, 0.8474194, 1, 1, 1, 1, 1,
0.322006, -0.4521625, 3.770408, 1, 1, 1, 1, 1,
0.3266901, -1.339634, 3.483776, 1, 1, 1, 1, 1,
0.3268709, -1.297497, 2.327498, 1, 1, 1, 1, 1,
0.3269826, -0.2538749, 2.758947, 1, 1, 1, 1, 1,
0.3281217, 0.2739889, 1.122412, 1, 1, 1, 1, 1,
0.3286758, -0.5745488, 1.29919, 1, 1, 1, 1, 1,
0.3348472, 0.6953726, 1.647695, 1, 1, 1, 1, 1,
0.337027, 0.3927923, 1.996895, 1, 1, 1, 1, 1,
0.3390349, -0.433587, 3.171107, 1, 1, 1, 1, 1,
0.3434325, -0.2115715, 2.077098, 1, 1, 1, 1, 1,
0.3441575, 1.487352, -0.4067083, 0, 0, 1, 1, 1,
0.3450959, 1.675837, -3.100844, 1, 0, 0, 1, 1,
0.346216, 0.03888118, 3.161945, 1, 0, 0, 1, 1,
0.3492267, 0.6945985, -0.6102778, 1, 0, 0, 1, 1,
0.3512569, -0.8347232, 3.286707, 1, 0, 0, 1, 1,
0.351945, -0.768069, 2.111523, 1, 0, 0, 1, 1,
0.3576533, 1.559286, -1.234356, 0, 0, 0, 1, 1,
0.3612381, 0.1282208, 2.580587, 0, 0, 0, 1, 1,
0.3638377, 0.2151012, 1.457977, 0, 0, 0, 1, 1,
0.3661811, 0.2269758, -1.262547, 0, 0, 0, 1, 1,
0.3679051, 0.2024738, 0.4438786, 0, 0, 0, 1, 1,
0.377434, -0.8911021, 1.910024, 0, 0, 0, 1, 1,
0.3808255, 1.916339, -0.040133, 0, 0, 0, 1, 1,
0.3854938, 0.923588, 0.6781778, 1, 1, 1, 1, 1,
0.386434, -0.1437338, 1.178354, 1, 1, 1, 1, 1,
0.3881545, 0.2685069, 1.499603, 1, 1, 1, 1, 1,
0.3885315, 0.488207, -0.6380712, 1, 1, 1, 1, 1,
0.3947617, 0.2801904, 0.430818, 1, 1, 1, 1, 1,
0.4067307, 0.5110604, 1.269121, 1, 1, 1, 1, 1,
0.4078203, 0.7277161, 1.607992, 1, 1, 1, 1, 1,
0.4078958, 0.2413732, 1.221266, 1, 1, 1, 1, 1,
0.4156646, -0.7069438, 1.375584, 1, 1, 1, 1, 1,
0.4249684, 0.2412103, -0.41022, 1, 1, 1, 1, 1,
0.4254073, -0.5287088, 1.731022, 1, 1, 1, 1, 1,
0.4282323, 0.6455044, -0.5455095, 1, 1, 1, 1, 1,
0.4342942, 0.1785659, 1.276727, 1, 1, 1, 1, 1,
0.4375515, 0.6070179, -0.7522903, 1, 1, 1, 1, 1,
0.4443344, 0.1668515, 1.868773, 1, 1, 1, 1, 1,
0.4505222, 0.5214807, -1.027633, 0, 0, 1, 1, 1,
0.4508792, -0.5987865, 3.247183, 1, 0, 0, 1, 1,
0.4526769, -0.5176178, 1.665659, 1, 0, 0, 1, 1,
0.4619257, 1.250764, 2.925141, 1, 0, 0, 1, 1,
0.4621622, -0.5625008, 2.132638, 1, 0, 0, 1, 1,
0.4648525, -0.849593, 2.418891, 1, 0, 0, 1, 1,
0.4653422, 1.920165, -0.7856598, 0, 0, 0, 1, 1,
0.4666449, -1.100111, 1.441374, 0, 0, 0, 1, 1,
0.467028, 0.05165336, 0.9456854, 0, 0, 0, 1, 1,
0.4672644, -0.978947, 3.323236, 0, 0, 0, 1, 1,
0.4674038, 0.6246154, -0.09273523, 0, 0, 0, 1, 1,
0.4679436, -0.3307518, 2.759203, 0, 0, 0, 1, 1,
0.468181, -1.611854, 2.548792, 0, 0, 0, 1, 1,
0.4740228, 0.1318328, 1.485523, 1, 1, 1, 1, 1,
0.4778906, -1.595726, 2.943181, 1, 1, 1, 1, 1,
0.4792364, 0.733508, 0.5271203, 1, 1, 1, 1, 1,
0.4796294, 0.05329908, 3.099637, 1, 1, 1, 1, 1,
0.480046, 0.8810326, 1.540825, 1, 1, 1, 1, 1,
0.4829205, -0.3134747, 1.876723, 1, 1, 1, 1, 1,
0.4914038, -0.3398214, 4.781428, 1, 1, 1, 1, 1,
0.4931001, -0.8216032, 2.561117, 1, 1, 1, 1, 1,
0.4949056, -0.7732514, 2.340487, 1, 1, 1, 1, 1,
0.4956242, 0.9077005, 0.9527529, 1, 1, 1, 1, 1,
0.4964275, -0.3725026, 0.8943319, 1, 1, 1, 1, 1,
0.4968873, 0.4300357, 0.5106124, 1, 1, 1, 1, 1,
0.4978518, -0.01282108, 1.738362, 1, 1, 1, 1, 1,
0.4985836, 0.9437675, 1.926553, 1, 1, 1, 1, 1,
0.4989734, 0.2024432, -0.04362606, 1, 1, 1, 1, 1,
0.5015261, 0.7056904, 0.9548046, 0, 0, 1, 1, 1,
0.5064447, 2.23772, 1.220957, 1, 0, 0, 1, 1,
0.5210541, -2.021062, 4.137119, 1, 0, 0, 1, 1,
0.5214471, -0.3470351, 2.102892, 1, 0, 0, 1, 1,
0.5276703, 0.2193697, 1.750654, 1, 0, 0, 1, 1,
0.5373077, -1.092867, 4.685569, 1, 0, 0, 1, 1,
0.5395809, 0.7100022, -1.365396, 0, 0, 0, 1, 1,
0.5402956, 1.423645, 0.338328, 0, 0, 0, 1, 1,
0.5405453, 0.5347066, 0.3834031, 0, 0, 0, 1, 1,
0.5415996, -0.607792, 1.859746, 0, 0, 0, 1, 1,
0.5421731, -1.096187, 1.634253, 0, 0, 0, 1, 1,
0.5466781, -1.621459, 2.82216, 0, 0, 0, 1, 1,
0.5545427, 0.5568066, -0.1839272, 0, 0, 0, 1, 1,
0.5559967, 0.09811389, 0.3953442, 1, 1, 1, 1, 1,
0.556443, 0.3057582, -0.9357327, 1, 1, 1, 1, 1,
0.5594724, -0.6466533, 2.904912, 1, 1, 1, 1, 1,
0.5637109, 1.295433, 1.116878, 1, 1, 1, 1, 1,
0.5695806, 1.517693, 1.494912, 1, 1, 1, 1, 1,
0.5755031, -1.192668, 3.49184, 1, 1, 1, 1, 1,
0.5757002, 1.081164, -0.2265578, 1, 1, 1, 1, 1,
0.58186, 1.118633, 1.074835, 1, 1, 1, 1, 1,
0.5820658, -0.3309848, 0.5127046, 1, 1, 1, 1, 1,
0.5842271, -0.6551583, 3.572, 1, 1, 1, 1, 1,
0.5843731, 1.213302, 0.922402, 1, 1, 1, 1, 1,
0.5935146, -1.368976, 2.648558, 1, 1, 1, 1, 1,
0.5970652, 0.080307, 2.078729, 1, 1, 1, 1, 1,
0.5998142, 0.4786109, 0.5822913, 1, 1, 1, 1, 1,
0.6001878, 0.8697062, 1.502168, 1, 1, 1, 1, 1,
0.6009886, 1.561025, -1.020834, 0, 0, 1, 1, 1,
0.6018186, 0.5991942, 0.9115168, 1, 0, 0, 1, 1,
0.6072456, -0.5953171, 3.320785, 1, 0, 0, 1, 1,
0.6126702, -0.05619227, 2.140256, 1, 0, 0, 1, 1,
0.6228915, 1.750516, 0.3686807, 1, 0, 0, 1, 1,
0.6250437, -0.03489164, 2.98836, 1, 0, 0, 1, 1,
0.6251256, -0.780977, 4.108365, 0, 0, 0, 1, 1,
0.6253408, 0.6499466, -0.6192258, 0, 0, 0, 1, 1,
0.6282442, 0.006738057, 2.215916, 0, 0, 0, 1, 1,
0.6285501, 1.952898, -0.1447809, 0, 0, 0, 1, 1,
0.6307721, 1.081032, 0.2488126, 0, 0, 0, 1, 1,
0.6319762, -0.217316, 2.189637, 0, 0, 0, 1, 1,
0.6322216, 0.3661315, 2.535642, 0, 0, 0, 1, 1,
0.6336784, -1.861686, 3.865962, 1, 1, 1, 1, 1,
0.638481, 0.723178, 1.997663, 1, 1, 1, 1, 1,
0.6407911, -0.8896051, 3.945606, 1, 1, 1, 1, 1,
0.6421192, 0.7436019, 0.8802089, 1, 1, 1, 1, 1,
0.6428405, -1.733317, 2.675738, 1, 1, 1, 1, 1,
0.6457901, -0.4512554, 0.8434605, 1, 1, 1, 1, 1,
0.6514021, 0.7577599, 0.2627015, 1, 1, 1, 1, 1,
0.6551048, -0.1672893, 1.839095, 1, 1, 1, 1, 1,
0.6586784, -0.7602749, 2.317193, 1, 1, 1, 1, 1,
0.6603906, 0.927649, 1.409967, 1, 1, 1, 1, 1,
0.661005, 0.5839038, 0.8634742, 1, 1, 1, 1, 1,
0.6662322, -1.177245, 3.217673, 1, 1, 1, 1, 1,
0.6690607, -0.416776, 0.8495818, 1, 1, 1, 1, 1,
0.6703632, 0.4802828, 0.4282061, 1, 1, 1, 1, 1,
0.6715299, 0.1404746, 0.5412948, 1, 1, 1, 1, 1,
0.6726114, -0.008502646, -0.7307003, 0, 0, 1, 1, 1,
0.6738438, 1.186208, 1.166163, 1, 0, 0, 1, 1,
0.6742412, -0.5520418, 2.681371, 1, 0, 0, 1, 1,
0.6763508, -0.1903898, 2.402483, 1, 0, 0, 1, 1,
0.67931, -0.6229591, 1.907627, 1, 0, 0, 1, 1,
0.6804977, -0.6044393, 1.919646, 1, 0, 0, 1, 1,
0.6811371, -0.3200019, 2.230222, 0, 0, 0, 1, 1,
0.6821357, -1.196519, 2.972335, 0, 0, 0, 1, 1,
0.6827214, -0.7113985, 2.102385, 0, 0, 0, 1, 1,
0.6879737, -0.2881527, 1.920459, 0, 0, 0, 1, 1,
0.6911005, -1.373584, 3.727238, 0, 0, 0, 1, 1,
0.6940859, 1.965588, -0.1099179, 0, 0, 0, 1, 1,
0.6951575, 1.554073, -0.07150463, 0, 0, 0, 1, 1,
0.6954132, -0.1298473, 1.767757, 1, 1, 1, 1, 1,
0.696218, -1.579531, 2.170203, 1, 1, 1, 1, 1,
0.7029992, 0.5097529, 1.140612, 1, 1, 1, 1, 1,
0.7035031, 0.04390287, 0.1471373, 1, 1, 1, 1, 1,
0.704505, 1.268806, 1.05283, 1, 1, 1, 1, 1,
0.7047314, 0.6249723, 0.377375, 1, 1, 1, 1, 1,
0.7058592, 0.3972771, -0.5192672, 1, 1, 1, 1, 1,
0.7063333, 1.12753, 0.877473, 1, 1, 1, 1, 1,
0.7136674, -1.297917, 1.90375, 1, 1, 1, 1, 1,
0.715602, -0.5651125, 0.4591065, 1, 1, 1, 1, 1,
0.7218093, -1.275741, 2.239799, 1, 1, 1, 1, 1,
0.7232904, -0.3238813, 2.177256, 1, 1, 1, 1, 1,
0.7261406, -0.1374854, 1.824839, 1, 1, 1, 1, 1,
0.7278122, -1.450531, 2.399717, 1, 1, 1, 1, 1,
0.7292004, 0.927017, -0.03970737, 1, 1, 1, 1, 1,
0.7297783, -0.8231857, 1.768726, 0, 0, 1, 1, 1,
0.7372878, 0.4397009, -0.4960967, 1, 0, 0, 1, 1,
0.741059, 0.3100014, 1.659228, 1, 0, 0, 1, 1,
0.7427341, -0.526278, 1.20013, 1, 0, 0, 1, 1,
0.7475453, -0.7518311, 2.664648, 1, 0, 0, 1, 1,
0.7511872, 0.7009139, 0.6731763, 1, 0, 0, 1, 1,
0.7538785, 0.6293154, 1.043432, 0, 0, 0, 1, 1,
0.7555428, -0.7815961, 2.448105, 0, 0, 0, 1, 1,
0.7609784, -0.882549, 2.109106, 0, 0, 0, 1, 1,
0.761715, 1.643929, 0.9783102, 0, 0, 0, 1, 1,
0.7664815, -0.1270519, 1.038081, 0, 0, 0, 1, 1,
0.768431, -1.655847, 3.421911, 0, 0, 0, 1, 1,
0.7739338, -1.267031, 4.353045, 0, 0, 0, 1, 1,
0.7778045, 0.3255883, 0.3978226, 1, 1, 1, 1, 1,
0.7804005, -0.5901666, 0.6975042, 1, 1, 1, 1, 1,
0.780695, -0.9226966, 1.816462, 1, 1, 1, 1, 1,
0.7848646, -0.6069209, 2.799276, 1, 1, 1, 1, 1,
0.789358, -0.7231513, 2.390273, 1, 1, 1, 1, 1,
0.7923017, -0.1754176, 0.7757812, 1, 1, 1, 1, 1,
0.798769, -0.8773935, 3.65178, 1, 1, 1, 1, 1,
0.8018789, 0.2718469, 3.353986, 1, 1, 1, 1, 1,
0.8103618, -0.2462342, 2.852152, 1, 1, 1, 1, 1,
0.8114452, -0.2948055, 4.18038, 1, 1, 1, 1, 1,
0.8120445, -0.4919165, 4.04056, 1, 1, 1, 1, 1,
0.8137286, 1.308833, 1.698907, 1, 1, 1, 1, 1,
0.8137362, -0.6559166, 1.571778, 1, 1, 1, 1, 1,
0.8159148, -0.2868708, 2.27508, 1, 1, 1, 1, 1,
0.8222148, 0.5692786, 2.155172, 1, 1, 1, 1, 1,
0.8234315, -0.5566028, 1.885423, 0, 0, 1, 1, 1,
0.8246563, -2.001639, 3.243628, 1, 0, 0, 1, 1,
0.8247917, 0.8142803, 0.0840782, 1, 0, 0, 1, 1,
0.8260628, -0.1793518, 2.967538, 1, 0, 0, 1, 1,
0.8292987, -0.2058389, 2.562855, 1, 0, 0, 1, 1,
0.8319512, 1.11385, 1.626591, 1, 0, 0, 1, 1,
0.8320552, -1.602673, 3.294098, 0, 0, 0, 1, 1,
0.8326687, -0.3699768, 2.20761, 0, 0, 0, 1, 1,
0.8381516, 0.552471, -0.2741645, 0, 0, 0, 1, 1,
0.8464872, 0.7458634, -0.7715386, 0, 0, 0, 1, 1,
0.8517967, 1.493067, 2.159841, 0, 0, 0, 1, 1,
0.8538029, 0.03402528, 1.846825, 0, 0, 0, 1, 1,
0.8544749, 1.809719, -0.4959608, 0, 0, 0, 1, 1,
0.8571467, 0.7679433, 1.640918, 1, 1, 1, 1, 1,
0.8590605, -1.322356, 3.628514, 1, 1, 1, 1, 1,
0.8590856, 0.1036599, 0.4505074, 1, 1, 1, 1, 1,
0.8591078, -2.356115, 1.851176, 1, 1, 1, 1, 1,
0.8592425, 1.403962, 0.1796036, 1, 1, 1, 1, 1,
0.8605703, -0.9925574, 2.584216, 1, 1, 1, 1, 1,
0.8658295, 0.05080447, -0.05067209, 1, 1, 1, 1, 1,
0.8669953, 0.3561828, 2.453441, 1, 1, 1, 1, 1,
0.8722548, -0.3849419, 1.228292, 1, 1, 1, 1, 1,
0.8723064, 1.082097, -0.01988568, 1, 1, 1, 1, 1,
0.8735191, -0.7636271, 2.069504, 1, 1, 1, 1, 1,
0.8756123, -0.6850569, 2.068122, 1, 1, 1, 1, 1,
0.8794886, -0.9386148, 2.514009, 1, 1, 1, 1, 1,
0.887856, -0.5540698, 2.585665, 1, 1, 1, 1, 1,
0.8950176, 0.7384073, 1.194057, 1, 1, 1, 1, 1,
0.8991197, 0.5888036, 2.024727, 0, 0, 1, 1, 1,
0.9004539, 1.489744, 1.696079, 1, 0, 0, 1, 1,
0.9079543, 0.2487959, 1.878022, 1, 0, 0, 1, 1,
0.9142891, -1.000309, 3.662427, 1, 0, 0, 1, 1,
0.9312936, 0.3379642, -0.2747228, 1, 0, 0, 1, 1,
0.932494, -1.089124, 1.777141, 1, 0, 0, 1, 1,
0.9341397, 0.1383957, 0.6841692, 0, 0, 0, 1, 1,
0.9360856, -0.1678445, 1.14791, 0, 0, 0, 1, 1,
0.9443853, 1.112997, 1.33578, 0, 0, 0, 1, 1,
0.952506, -0.01648429, -0.06981743, 0, 0, 0, 1, 1,
0.9539551, 1.35581, 0.2022454, 0, 0, 0, 1, 1,
0.959138, 0.5693758, 0.9189976, 0, 0, 0, 1, 1,
0.9595765, -2.289607, 3.367041, 0, 0, 0, 1, 1,
0.9685265, -0.2366445, 2.524003, 1, 1, 1, 1, 1,
0.971092, 1.872184, 0.8507338, 1, 1, 1, 1, 1,
0.9715721, -1.05036, 2.928543, 1, 1, 1, 1, 1,
0.9725494, -0.6593628, 1.975796, 1, 1, 1, 1, 1,
0.97574, 1.35314, 1.316618, 1, 1, 1, 1, 1,
0.9814652, 1.674517, -0.01743473, 1, 1, 1, 1, 1,
0.9857369, 1.021155, 1.603419, 1, 1, 1, 1, 1,
0.986339, 0.315986, 2.032457, 1, 1, 1, 1, 1,
0.9877869, 0.2932208, 0.2021249, 1, 1, 1, 1, 1,
0.9881067, 0.3419757, 1.069032, 1, 1, 1, 1, 1,
1.001671, 0.3084349, 1.828159, 1, 1, 1, 1, 1,
1.010841, -0.126394, 1.01256, 1, 1, 1, 1, 1,
1.012266, 0.5404157, 1.457004, 1, 1, 1, 1, 1,
1.015876, -1.652623, 3.872223, 1, 1, 1, 1, 1,
1.027481, -0.1677999, 1.430797, 1, 1, 1, 1, 1,
1.027654, -1.130465, 2.794894, 0, 0, 1, 1, 1,
1.031058, 0.6082597, 0.3729177, 1, 0, 0, 1, 1,
1.035532, 0.4292001, 1.637848, 1, 0, 0, 1, 1,
1.045828, -0.6543517, 0.3571782, 1, 0, 0, 1, 1,
1.04909, 0.5004503, 1.902824, 1, 0, 0, 1, 1,
1.060924, -1.940394, 1.7654, 1, 0, 0, 1, 1,
1.071096, -0.2136181, 2.56898, 0, 0, 0, 1, 1,
1.075565, -1.094629, 1.769513, 0, 0, 0, 1, 1,
1.0797, 1.030877, 0.7532963, 0, 0, 0, 1, 1,
1.086601, -0.6784118, 4.851914, 0, 0, 0, 1, 1,
1.092461, 0.07305744, -0.2988923, 0, 0, 0, 1, 1,
1.09508, 0.6535224, 2.124437, 0, 0, 0, 1, 1,
1.095358, 0.02360971, 2.104198, 0, 0, 0, 1, 1,
1.09552, -1.522661, 2.730697, 1, 1, 1, 1, 1,
1.100255, 0.1355324, -0.687938, 1, 1, 1, 1, 1,
1.103155, -0.1966725, 1.980556, 1, 1, 1, 1, 1,
1.106931, 1.438367, 1.156808, 1, 1, 1, 1, 1,
1.116484, 0.953694, 1.373845, 1, 1, 1, 1, 1,
1.122033, -0.1116587, 1.368077, 1, 1, 1, 1, 1,
1.122403, 0.249036, 2.211801, 1, 1, 1, 1, 1,
1.124738, 0.007449271, 0.760314, 1, 1, 1, 1, 1,
1.127707, 1.25846, -0.6748875, 1, 1, 1, 1, 1,
1.136233, -1.58747, 3.487606, 1, 1, 1, 1, 1,
1.143281, 0.1828306, 1.914612, 1, 1, 1, 1, 1,
1.152997, -0.01200849, 1.825799, 1, 1, 1, 1, 1,
1.158368, 0.3376957, 0.3173869, 1, 1, 1, 1, 1,
1.159778, 1.023992, 2.655281, 1, 1, 1, 1, 1,
1.16028, 1.589082, 0.8101957, 1, 1, 1, 1, 1,
1.162462, 0.9626485, 1.878237, 0, 0, 1, 1, 1,
1.164811, -0.9636022, 3.918995, 1, 0, 0, 1, 1,
1.174263, -0.155463, 2.476509, 1, 0, 0, 1, 1,
1.176155, -1.671519, 3.399079, 1, 0, 0, 1, 1,
1.188184, -0.8512942, 1.270431, 1, 0, 0, 1, 1,
1.202631, 1.497937, 0.249632, 1, 0, 0, 1, 1,
1.209301, 2.544339, 0.4169255, 0, 0, 0, 1, 1,
1.214968, -0.506979, 4.424654, 0, 0, 0, 1, 1,
1.215778, -1.050378, 2.227673, 0, 0, 0, 1, 1,
1.22133, 0.6940245, -1.103954, 0, 0, 0, 1, 1,
1.221665, -1.257526, 2.735596, 0, 0, 0, 1, 1,
1.223669, -0.1617436, 2.913033, 0, 0, 0, 1, 1,
1.224617, -0.786624, 2.474385, 0, 0, 0, 1, 1,
1.228195, 0.2693865, 0.4511359, 1, 1, 1, 1, 1,
1.228572, 0.639746, 2.276201, 1, 1, 1, 1, 1,
1.233645, -0.267846, 1.0463, 1, 1, 1, 1, 1,
1.246707, -0.06325901, 2.642889, 1, 1, 1, 1, 1,
1.252136, 1.822206, -1.017201, 1, 1, 1, 1, 1,
1.252852, 2.570719, 0.5106638, 1, 1, 1, 1, 1,
1.25589, 1.246278, 3.279864, 1, 1, 1, 1, 1,
1.274219, -0.1982804, 1.601135, 1, 1, 1, 1, 1,
1.283486, -1.062429, 2.828122, 1, 1, 1, 1, 1,
1.287435, 0.5556816, 1.066466, 1, 1, 1, 1, 1,
1.290271, 1.310055, 1.284152, 1, 1, 1, 1, 1,
1.292629, -0.2953401, 2.269864, 1, 1, 1, 1, 1,
1.31077, 0.7779035, 1.297096, 1, 1, 1, 1, 1,
1.323262, -0.9472731, 0.7544023, 1, 1, 1, 1, 1,
1.332209, -0.8395894, 1.382279, 1, 1, 1, 1, 1,
1.335586, -0.09402188, 2.197726, 0, 0, 1, 1, 1,
1.341834, 0.5114707, 1.067462, 1, 0, 0, 1, 1,
1.345815, 3.160644, 0.03843953, 1, 0, 0, 1, 1,
1.350992, -1.009012, 2.688109, 1, 0, 0, 1, 1,
1.354649, -0.958407, 2.502941, 1, 0, 0, 1, 1,
1.360575, 0.1108549, 2.616793, 1, 0, 0, 1, 1,
1.361251, -0.5543312, 1.328414, 0, 0, 0, 1, 1,
1.369944, 0.4123679, 0.8574849, 0, 0, 0, 1, 1,
1.375186, 0.1217647, 1.125551, 0, 0, 0, 1, 1,
1.385542, 0.5330658, 2.442821, 0, 0, 0, 1, 1,
1.387476, 0.3276579, 0.009092716, 0, 0, 0, 1, 1,
1.40151, -1.307326, 1.427592, 0, 0, 0, 1, 1,
1.408009, 1.596407, 1.56119, 0, 0, 0, 1, 1,
1.425472, -0.2983422, 2.224184, 1, 1, 1, 1, 1,
1.427518, -0.1159118, 3.615242, 1, 1, 1, 1, 1,
1.433034, 2.3171, 1.446296, 1, 1, 1, 1, 1,
1.44385, -0.1198616, 3.034619, 1, 1, 1, 1, 1,
1.44721, -1.209773, 3.629663, 1, 1, 1, 1, 1,
1.448296, 0.8255565, 0.5037103, 1, 1, 1, 1, 1,
1.449466, 0.8305482, 0.8994671, 1, 1, 1, 1, 1,
1.459722, -0.3031345, 2.884148, 1, 1, 1, 1, 1,
1.459803, 1.171526, 0.7143985, 1, 1, 1, 1, 1,
1.468198, -0.5593816, 1.425956, 1, 1, 1, 1, 1,
1.476448, -0.4677692, 2.121027, 1, 1, 1, 1, 1,
1.478921, -0.9202434, 0.3057378, 1, 1, 1, 1, 1,
1.479943, -0.1140375, 3.047862, 1, 1, 1, 1, 1,
1.484065, 0.5416349, 0.6425723, 1, 1, 1, 1, 1,
1.492796, 0.4856966, 0.9636399, 1, 1, 1, 1, 1,
1.502136, -1.152435, 2.637279, 0, 0, 1, 1, 1,
1.504071, -0.6493396, 1.390749, 1, 0, 0, 1, 1,
1.506657, -1.37887, 3.322729, 1, 0, 0, 1, 1,
1.522619, 2.049957, -0.6753649, 1, 0, 0, 1, 1,
1.523757, 0.1173871, 2.493406, 1, 0, 0, 1, 1,
1.527049, -0.9418768, 3.320342, 1, 0, 0, 1, 1,
1.528424, 0.1919508, 3.210363, 0, 0, 0, 1, 1,
1.53253, -5.28642e-05, 1.030711, 0, 0, 0, 1, 1,
1.533762, 0.868449, 0.04098064, 0, 0, 0, 1, 1,
1.539155, -1.486542, 2.256566, 0, 0, 0, 1, 1,
1.546116, 2.21909, -0.3821906, 0, 0, 0, 1, 1,
1.566437, -0.6570997, 1.478278, 0, 0, 0, 1, 1,
1.573409, -1.058521, 3.192986, 0, 0, 0, 1, 1,
1.579931, -0.2187913, 1.54047, 1, 1, 1, 1, 1,
1.584592, 0.9185244, 1.987138, 1, 1, 1, 1, 1,
1.59, 1.292887, 1.246789, 1, 1, 1, 1, 1,
1.597273, 0.5060325, 0.5736628, 1, 1, 1, 1, 1,
1.606512, 0.1201728, 1.668711, 1, 1, 1, 1, 1,
1.611374, -2.793902, 4.381295, 1, 1, 1, 1, 1,
1.612378, -0.6179182, 0.7656259, 1, 1, 1, 1, 1,
1.651993, 0.4810204, 3.061876, 1, 1, 1, 1, 1,
1.654494, -0.7756434, 1.366844, 1, 1, 1, 1, 1,
1.655447, 0.3729779, 2.206985, 1, 1, 1, 1, 1,
1.681399, 1.039252, 0.7342298, 1, 1, 1, 1, 1,
1.681651, -0.4265277, 3.415644, 1, 1, 1, 1, 1,
1.682181, 0.8763647, 2.352557, 1, 1, 1, 1, 1,
1.684387, 0.2271748, 2.522473, 1, 1, 1, 1, 1,
1.698233, -0.01987768, 2.355213, 1, 1, 1, 1, 1,
1.702094, -2.091535, 3.297602, 0, 0, 1, 1, 1,
1.710277, -0.3146587, 1.457115, 1, 0, 0, 1, 1,
1.730986, -0.9728405, 3.117815, 1, 0, 0, 1, 1,
1.737971, 1.673064, 2.068852, 1, 0, 0, 1, 1,
1.754504, -2.206938, 2.896395, 1, 0, 0, 1, 1,
1.791896, 0.1942462, 1.400666, 1, 0, 0, 1, 1,
1.798398, 1.437968, -0.1196705, 0, 0, 0, 1, 1,
1.805068, 1.302778, 0.3492734, 0, 0, 0, 1, 1,
1.818563, -1.738096, 2.412568, 0, 0, 0, 1, 1,
1.840006, -0.3582385, 1.466392, 0, 0, 0, 1, 1,
1.859006, -0.9659748, 2.377548, 0, 0, 0, 1, 1,
1.892168, -1.148734, 3.955981, 0, 0, 0, 1, 1,
1.894068, 1.106386, 0.8307357, 0, 0, 0, 1, 1,
1.903869, 0.7219455, 1.939105, 1, 1, 1, 1, 1,
1.910327, -1.222397, 3.166591, 1, 1, 1, 1, 1,
1.946909, 0.138563, 2.065521, 1, 1, 1, 1, 1,
1.956803, 0.3683037, 1.482213, 1, 1, 1, 1, 1,
1.958602, 0.3024028, 1.664936, 1, 1, 1, 1, 1,
1.959222, -1.801466, 2.215137, 1, 1, 1, 1, 1,
1.964959, 2.163834, -0.09096382, 1, 1, 1, 1, 1,
1.977771, -0.4558763, 3.232877, 1, 1, 1, 1, 1,
1.990099, -0.4994299, 1.729743, 1, 1, 1, 1, 1,
2.004736, 2.564093, -0.2798809, 1, 1, 1, 1, 1,
2.070184, 0.1238055, 3.08541, 1, 1, 1, 1, 1,
2.090238, -1.592512, 3.441479, 1, 1, 1, 1, 1,
2.106438, 0.001346617, 1.515758, 1, 1, 1, 1, 1,
2.11451, 1.217694, 0.9898977, 1, 1, 1, 1, 1,
2.15793, -0.08511724, 1.210963, 1, 1, 1, 1, 1,
2.168376, -0.6266147, 1.05935, 0, 0, 1, 1, 1,
2.187995, -0.03050582, 2.136771, 1, 0, 0, 1, 1,
2.212344, 0.4000226, 0.434396, 1, 0, 0, 1, 1,
2.239668, -0.6477413, 2.068684, 1, 0, 0, 1, 1,
2.264058, 0.07333616, 1.35449, 1, 0, 0, 1, 1,
2.297468, -0.2056219, 2.085431, 1, 0, 0, 1, 1,
2.298256, -0.3871935, 1.063037, 0, 0, 0, 1, 1,
2.366739, 0.6120703, -1.737487, 0, 0, 0, 1, 1,
2.394, -0.006048946, 0.4377623, 0, 0, 0, 1, 1,
2.402777, 0.185055, 1.883208, 0, 0, 0, 1, 1,
2.42147, -0.3349099, 1.618149, 0, 0, 0, 1, 1,
2.441626, -0.7735384, 2.477006, 0, 0, 0, 1, 1,
2.467626, 0.7770367, 2.511126, 0, 0, 0, 1, 1,
2.495314, -0.3048623, 1.930389, 1, 1, 1, 1, 1,
2.528196, -0.1127725, 2.78937, 1, 1, 1, 1, 1,
2.533851, -0.9647679, 2.141433, 1, 1, 1, 1, 1,
2.666095, -0.5053367, 2.686641, 1, 1, 1, 1, 1,
2.819042, 0.4296853, 2.538375, 1, 1, 1, 1, 1,
3.108951, 0.1846521, 1.109795, 1, 1, 1, 1, 1,
3.179036, 0.9208677, 0.5364448, 1, 1, 1, 1, 1
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
var radius = 9.319797;
var distance = 32.73539;
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
mvMatrix.translate( -0.08351517, 0.2406232, -0.1454852 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73539);
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
