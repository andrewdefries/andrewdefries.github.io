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
-3.083795, 0.1533241, -2.994434, 1, 0, 0, 1,
-2.819965, 1.759113, 0.541086, 1, 0.007843138, 0, 1,
-2.767935, -1.189395, -1.109227, 1, 0.01176471, 0, 1,
-2.688718, -0.1430815, -1.625909, 1, 0.01960784, 0, 1,
-2.614808, -0.7842844, -3.372959, 1, 0.02352941, 0, 1,
-2.531854, -1.38725, -2.204614, 1, 0.03137255, 0, 1,
-2.410915, -0.1502955, -1.326177, 1, 0.03529412, 0, 1,
-2.274551, 0.699867, -2.448778, 1, 0.04313726, 0, 1,
-2.14427, -2.141651, -2.100559, 1, 0.04705882, 0, 1,
-2.132317, -0.6928347, -0.9536991, 1, 0.05490196, 0, 1,
-2.117204, 1.663654, -1.361119, 1, 0.05882353, 0, 1,
-2.100908, -0.09238668, -2.168102, 1, 0.06666667, 0, 1,
-2.095837, 2.008044, -2.615105, 1, 0.07058824, 0, 1,
-2.08794, 0.7021659, -0.2407007, 1, 0.07843138, 0, 1,
-2.066643, -0.3249673, -2.639607, 1, 0.08235294, 0, 1,
-2.061, -1.048996, -1.989606, 1, 0.09019608, 0, 1,
-2.009589, -0.1105002, -1.65215, 1, 0.09411765, 0, 1,
-1.978535, 0.9606026, -0.3810711, 1, 0.1019608, 0, 1,
-1.97077, 0.6803791, -0.6799821, 1, 0.1098039, 0, 1,
-1.946437, 1.922641, -1.077898, 1, 0.1137255, 0, 1,
-1.940364, -0.2217002, -1.714999, 1, 0.1215686, 0, 1,
-1.939424, -0.2211429, -0.9509492, 1, 0.1254902, 0, 1,
-1.919512, 0.4702475, -1.724797, 1, 0.1333333, 0, 1,
-1.90751, -1.788255, -2.761426, 1, 0.1372549, 0, 1,
-1.907418, 0.8226682, -0.6826478, 1, 0.145098, 0, 1,
-1.898281, 1.614444, -0.8530644, 1, 0.1490196, 0, 1,
-1.894593, -2.082944, -1.905619, 1, 0.1568628, 0, 1,
-1.868896, -0.03653179, -1.096126, 1, 0.1607843, 0, 1,
-1.862338, -0.1749324, -0.8118501, 1, 0.1686275, 0, 1,
-1.830604, 0.4005697, -3.974034, 1, 0.172549, 0, 1,
-1.825249, 2.18757, -1.945117, 1, 0.1803922, 0, 1,
-1.820868, 1.966441, 0.3813648, 1, 0.1843137, 0, 1,
-1.804665, -0.8480872, -5.456852, 1, 0.1921569, 0, 1,
-1.803472, 1.002213, -1.453903, 1, 0.1960784, 0, 1,
-1.788582, -0.2486928, -0.9519013, 1, 0.2039216, 0, 1,
-1.779108, 0.2282216, -1.252935, 1, 0.2117647, 0, 1,
-1.749732, -0.803323, -3.116779, 1, 0.2156863, 0, 1,
-1.721773, -0.1759866, -2.387192, 1, 0.2235294, 0, 1,
-1.715664, -1.585826, -1.872312, 1, 0.227451, 0, 1,
-1.700447, 1.318443, -2.900637, 1, 0.2352941, 0, 1,
-1.676595, 0.3515877, -3.359059, 1, 0.2392157, 0, 1,
-1.67633, -1.796011, -1.873936, 1, 0.2470588, 0, 1,
-1.672725, 0.8754426, -1.35267, 1, 0.2509804, 0, 1,
-1.655416, 0.7449875, -2.616767, 1, 0.2588235, 0, 1,
-1.643882, -1.272274, -2.99557, 1, 0.2627451, 0, 1,
-1.632965, 0.08235582, -0.1931918, 1, 0.2705882, 0, 1,
-1.629239, -1.299308, -2.075277, 1, 0.2745098, 0, 1,
-1.628538, 0.3911462, -2.918013, 1, 0.282353, 0, 1,
-1.621014, -0.4071203, -3.508183, 1, 0.2862745, 0, 1,
-1.61492, -0.3826554, -2.292512, 1, 0.2941177, 0, 1,
-1.596309, 0.05173985, -1.458493, 1, 0.3019608, 0, 1,
-1.582376, 1.222943, -1.964099, 1, 0.3058824, 0, 1,
-1.579046, -0.7487246, -0.195008, 1, 0.3137255, 0, 1,
-1.578061, -1.164695, -3.21156, 1, 0.3176471, 0, 1,
-1.574802, 0.8948702, -0.2649649, 1, 0.3254902, 0, 1,
-1.557496, 0.254928, -1.367306, 1, 0.3294118, 0, 1,
-1.539518, 0.3275997, -2.020671, 1, 0.3372549, 0, 1,
-1.533702, 0.8215299, -0.6631502, 1, 0.3411765, 0, 1,
-1.530629, -1.206918, -0.453136, 1, 0.3490196, 0, 1,
-1.504751, -2.474335, -2.627265, 1, 0.3529412, 0, 1,
-1.503555, 0.3637436, 0.6603071, 1, 0.3607843, 0, 1,
-1.495166, -0.1907601, -1.441472, 1, 0.3647059, 0, 1,
-1.483858, 0.07971256, -2.032017, 1, 0.372549, 0, 1,
-1.481212, 0.09312267, -2.487903, 1, 0.3764706, 0, 1,
-1.477093, 1.101106, -1.059269, 1, 0.3843137, 0, 1,
-1.475838, 0.9949997, -0.6873972, 1, 0.3882353, 0, 1,
-1.467669, -0.1615404, -2.452098, 1, 0.3960784, 0, 1,
-1.460421, 1.077976, -1.528409, 1, 0.4039216, 0, 1,
-1.455295, 0.8677332, -0.6136753, 1, 0.4078431, 0, 1,
-1.453572, 1.024444, -1.516656, 1, 0.4156863, 0, 1,
-1.453488, 0.1656708, -1.853478, 1, 0.4196078, 0, 1,
-1.445685, -0.1893951, -0.6252187, 1, 0.427451, 0, 1,
-1.442653, 0.03690775, -0.1218978, 1, 0.4313726, 0, 1,
-1.441861, -1.355676, -1.857284, 1, 0.4392157, 0, 1,
-1.43764, 0.4495666, -0.9446968, 1, 0.4431373, 0, 1,
-1.431878, 1.073726, 0.2021229, 1, 0.4509804, 0, 1,
-1.424129, -0.9855191, -2.272353, 1, 0.454902, 0, 1,
-1.41722, -0.213793, -2.907733, 1, 0.4627451, 0, 1,
-1.414581, -0.9223551, -2.492392, 1, 0.4666667, 0, 1,
-1.411596, 0.08276153, -1.698852, 1, 0.4745098, 0, 1,
-1.40899, -0.5184777, -1.815761, 1, 0.4784314, 0, 1,
-1.408362, -0.1968795, -0.4067582, 1, 0.4862745, 0, 1,
-1.400607, 0.5935477, -1.413632, 1, 0.4901961, 0, 1,
-1.40053, 2.358085, -3.141156, 1, 0.4980392, 0, 1,
-1.400239, -1.106334, -3.122826, 1, 0.5058824, 0, 1,
-1.395251, 0.2138477, -0.6998782, 1, 0.509804, 0, 1,
-1.391769, -0.6842272, -1.013268, 1, 0.5176471, 0, 1,
-1.387643, 0.9784303, -1.283491, 1, 0.5215687, 0, 1,
-1.38608, -1.386129, -2.387273, 1, 0.5294118, 0, 1,
-1.381808, 0.2940468, -2.010299, 1, 0.5333334, 0, 1,
-1.379792, 0.4513379, -0.7041919, 1, 0.5411765, 0, 1,
-1.369905, -1.582999, -2.776225, 1, 0.5450981, 0, 1,
-1.349034, -0.6527444, -2.46969, 1, 0.5529412, 0, 1,
-1.349014, -1.528004, -1.81358, 1, 0.5568628, 0, 1,
-1.34224, 0.4988899, -1.928245, 1, 0.5647059, 0, 1,
-1.330939, -0.5627145, -1.121098, 1, 0.5686275, 0, 1,
-1.291647, -0.1704469, -2.323738, 1, 0.5764706, 0, 1,
-1.290713, -1.615666, -4.060292, 1, 0.5803922, 0, 1,
-1.282443, 2.722032, 1.827938, 1, 0.5882353, 0, 1,
-1.270457, 2.183522, -1.233326, 1, 0.5921569, 0, 1,
-1.266872, 0.836803, -0.2811174, 1, 0.6, 0, 1,
-1.262706, 0.6915763, -2.448175, 1, 0.6078432, 0, 1,
-1.259805, -0.1984781, -0.03656555, 1, 0.6117647, 0, 1,
-1.257303, 0.366021, -0.2597074, 1, 0.6196079, 0, 1,
-1.25598, 0.2084355, -1.753522, 1, 0.6235294, 0, 1,
-1.250318, -1.697107, -4.227066, 1, 0.6313726, 0, 1,
-1.250162, -0.5624995, -1.835418, 1, 0.6352941, 0, 1,
-1.242756, -0.350962, -0.5162359, 1, 0.6431373, 0, 1,
-1.242293, -0.4293332, -1.78185, 1, 0.6470588, 0, 1,
-1.231833, -0.1283873, -1.1641, 1, 0.654902, 0, 1,
-1.23005, -1.44495, -2.203848, 1, 0.6588235, 0, 1,
-1.219587, 0.2284582, -1.254505, 1, 0.6666667, 0, 1,
-1.214995, 0.5303807, -1.20639, 1, 0.6705883, 0, 1,
-1.211671, 1.295263, -1.709113, 1, 0.6784314, 0, 1,
-1.211351, 0.9921905, -0.7310203, 1, 0.682353, 0, 1,
-1.211326, -1.870231, -3.283354, 1, 0.6901961, 0, 1,
-1.197363, 0.8945228, -2.27421, 1, 0.6941177, 0, 1,
-1.194083, -0.3445154, -1.782257, 1, 0.7019608, 0, 1,
-1.194048, 2.160654, -0.531037, 1, 0.7098039, 0, 1,
-1.189892, -1.692991, -2.779633, 1, 0.7137255, 0, 1,
-1.18258, 0.1147516, -1.464414, 1, 0.7215686, 0, 1,
-1.179972, 0.9734888, -0.8754373, 1, 0.7254902, 0, 1,
-1.175832, 0.9503753, -1.523837, 1, 0.7333333, 0, 1,
-1.170455, -0.772167, -0.5704046, 1, 0.7372549, 0, 1,
-1.169173, 0.3241044, -2.168067, 1, 0.7450981, 0, 1,
-1.162747, -1.130071, -2.557671, 1, 0.7490196, 0, 1,
-1.14953, 0.234013, -2.532985, 1, 0.7568628, 0, 1,
-1.148892, 0.4697464, -1.736742, 1, 0.7607843, 0, 1,
-1.146116, 0.7486125, -2.347047, 1, 0.7686275, 0, 1,
-1.143353, -1.204709, -2.746436, 1, 0.772549, 0, 1,
-1.133269, 1.155881, 0.8395604, 1, 0.7803922, 0, 1,
-1.129504, -1.312837, -3.348695, 1, 0.7843137, 0, 1,
-1.127985, -0.08901329, 0.7530464, 1, 0.7921569, 0, 1,
-1.123882, 0.284703, -2.433028, 1, 0.7960784, 0, 1,
-1.123558, 0.9404359, -3.07086, 1, 0.8039216, 0, 1,
-1.119327, 1.064965, 0.003259401, 1, 0.8117647, 0, 1,
-1.116394, -1.060662, -1.771309, 1, 0.8156863, 0, 1,
-1.115807, -1.219744, -0.925892, 1, 0.8235294, 0, 1,
-1.112825, 1.100318, -0.2876311, 1, 0.827451, 0, 1,
-1.109911, -1.721939, -3.182986, 1, 0.8352941, 0, 1,
-1.105449, 1.766461, 0.6621883, 1, 0.8392157, 0, 1,
-1.103282, 1.372348, -0.4845808, 1, 0.8470588, 0, 1,
-1.100872, -1.289803, -2.792274, 1, 0.8509804, 0, 1,
-1.095399, 0.8768253, -1.640381, 1, 0.8588235, 0, 1,
-1.094488, -0.3741222, -1.596897, 1, 0.8627451, 0, 1,
-1.086349, 1.125206, -0.6915113, 1, 0.8705882, 0, 1,
-1.085428, -0.8093164, -2.023258, 1, 0.8745098, 0, 1,
-1.075789, -0.5704077, -1.471208, 1, 0.8823529, 0, 1,
-1.07395, -0.4787065, -1.783545, 1, 0.8862745, 0, 1,
-1.06911, -1.036542, -3.237319, 1, 0.8941177, 0, 1,
-1.06852, -0.555014, -1.950363, 1, 0.8980392, 0, 1,
-1.066139, -1.287406, -2.373309, 1, 0.9058824, 0, 1,
-1.066058, 1.175537, -2.120477, 1, 0.9137255, 0, 1,
-1.063321, 1.084979, -0.7390833, 1, 0.9176471, 0, 1,
-1.051547, 0.6658814, 0.2635745, 1, 0.9254902, 0, 1,
-1.044947, -0.7056359, -1.390926, 1, 0.9294118, 0, 1,
-1.034778, -1.031662, -1.432, 1, 0.9372549, 0, 1,
-1.02906, 0.5154169, -1.588356, 1, 0.9411765, 0, 1,
-1.027057, -0.2212385, -2.376708, 1, 0.9490196, 0, 1,
-1.026563, -0.6437415, -1.601676, 1, 0.9529412, 0, 1,
-1.026054, 1.105641, -0.6985214, 1, 0.9607843, 0, 1,
-1.025223, 1.197288, -1.025732, 1, 0.9647059, 0, 1,
-1.024902, 1.352009, -0.6289946, 1, 0.972549, 0, 1,
-0.9968591, -0.07333182, -1.163477, 1, 0.9764706, 0, 1,
-0.992889, -0.04150695, 0.07828702, 1, 0.9843137, 0, 1,
-0.9910105, -1.012063, -0.7439078, 1, 0.9882353, 0, 1,
-0.9847806, -1.367934, -3.964504, 1, 0.9960784, 0, 1,
-0.9836642, 0.4190869, -3.313942, 0.9960784, 1, 0, 1,
-0.9831367, 1.258259, -0.548524, 0.9921569, 1, 0, 1,
-0.9747171, -0.7155692, -0.7128834, 0.9843137, 1, 0, 1,
-0.9717532, -3.020721, -3.693011, 0.9803922, 1, 0, 1,
-0.9708596, 1.168564, -1.150993, 0.972549, 1, 0, 1,
-0.9700857, 0.2773365, -1.405253, 0.9686275, 1, 0, 1,
-0.9684756, -0.3969446, -1.366441, 0.9607843, 1, 0, 1,
-0.9659793, -0.1124566, -2.724348, 0.9568627, 1, 0, 1,
-0.9650795, -0.2603168, -0.8171426, 0.9490196, 1, 0, 1,
-0.9650297, -0.1241971, -3.840565, 0.945098, 1, 0, 1,
-0.9625595, -0.2216715, -0.7340653, 0.9372549, 1, 0, 1,
-0.96026, -1.727676, -2.11368, 0.9333333, 1, 0, 1,
-0.9540389, -0.9361205, -2.816998, 0.9254902, 1, 0, 1,
-0.9460957, -1.103068, -2.453855, 0.9215686, 1, 0, 1,
-0.9443206, 1.400921, -1.103256, 0.9137255, 1, 0, 1,
-0.9318393, -0.6339336, -2.821681, 0.9098039, 1, 0, 1,
-0.9225749, 0.7268459, -2.987532, 0.9019608, 1, 0, 1,
-0.9193452, 1.733147, -0.1746022, 0.8941177, 1, 0, 1,
-0.9192885, 0.9161718, -0.9042801, 0.8901961, 1, 0, 1,
-0.9117359, 0.5698214, 0.6864793, 0.8823529, 1, 0, 1,
-0.9112311, -0.1394661, -0.4907509, 0.8784314, 1, 0, 1,
-0.9016001, 0.05824277, -3.031666, 0.8705882, 1, 0, 1,
-0.9008962, -1.522648, -2.792276, 0.8666667, 1, 0, 1,
-0.8979158, -0.1496638, -2.145275, 0.8588235, 1, 0, 1,
-0.8861821, 0.07853068, -0.8594382, 0.854902, 1, 0, 1,
-0.8855671, 1.763542, 0.3123029, 0.8470588, 1, 0, 1,
-0.8831512, -0.4778191, -1.209908, 0.8431373, 1, 0, 1,
-0.8802946, 0.2648671, 0.2740701, 0.8352941, 1, 0, 1,
-0.8763787, 0.1193923, -0.9849526, 0.8313726, 1, 0, 1,
-0.8725789, -0.2682181, -2.992, 0.8235294, 1, 0, 1,
-0.872454, -1.159487, -3.178736, 0.8196079, 1, 0, 1,
-0.8697032, 0.8897532, -0.5987441, 0.8117647, 1, 0, 1,
-0.8669975, -0.2166311, -2.59829, 0.8078431, 1, 0, 1,
-0.8619729, -0.2035689, -1.92594, 0.8, 1, 0, 1,
-0.8591751, 0.411519, -1.263945, 0.7921569, 1, 0, 1,
-0.8579724, -0.04728562, -0.2419166, 0.7882353, 1, 0, 1,
-0.8567868, 0.08600803, -2.226079, 0.7803922, 1, 0, 1,
-0.8540431, 0.2003249, -2.06309, 0.7764706, 1, 0, 1,
-0.8501107, -0.8529092, -3.389421, 0.7686275, 1, 0, 1,
-0.8468053, -1.259289, -3.225385, 0.7647059, 1, 0, 1,
-0.8447851, -0.3582624, -3.9931, 0.7568628, 1, 0, 1,
-0.83546, 0.8722392, -0.3918725, 0.7529412, 1, 0, 1,
-0.8327428, -1.60243, -1.652435, 0.7450981, 1, 0, 1,
-0.8249424, -0.9103926, -3.727839, 0.7411765, 1, 0, 1,
-0.822508, -1.189752, -1.975113, 0.7333333, 1, 0, 1,
-0.8216193, 0.7849467, -0.3809032, 0.7294118, 1, 0, 1,
-0.8209231, 1.38955, -1.61531, 0.7215686, 1, 0, 1,
-0.8183498, 0.6006138, -0.7800148, 0.7176471, 1, 0, 1,
-0.8144661, -0.7125857, -1.728559, 0.7098039, 1, 0, 1,
-0.8142965, 2.228887, -0.5646174, 0.7058824, 1, 0, 1,
-0.8113869, 0.1375033, -2.782345, 0.6980392, 1, 0, 1,
-0.8093982, 1.506103, -0.3602045, 0.6901961, 1, 0, 1,
-0.8091148, 1.048906, 0.6369272, 0.6862745, 1, 0, 1,
-0.792586, -2.374724, -1.431534, 0.6784314, 1, 0, 1,
-0.791078, -1.214959, -2.018328, 0.6745098, 1, 0, 1,
-0.7895223, -0.8970048, -3.454524, 0.6666667, 1, 0, 1,
-0.7881999, 0.1782522, -1.910478, 0.6627451, 1, 0, 1,
-0.786884, 0.1705775, -1.563899, 0.654902, 1, 0, 1,
-0.7781762, -0.5569459, -4.215242, 0.6509804, 1, 0, 1,
-0.7721666, -0.01737766, -1.792481, 0.6431373, 1, 0, 1,
-0.7631786, -1.060759, -3.913745, 0.6392157, 1, 0, 1,
-0.7583989, -1.516153, -3.321599, 0.6313726, 1, 0, 1,
-0.7545203, -1.911588, -2.589582, 0.627451, 1, 0, 1,
-0.7468758, -0.3145212, -1.720358, 0.6196079, 1, 0, 1,
-0.7459027, -0.8099945, -2.412378, 0.6156863, 1, 0, 1,
-0.7422292, 0.8215102, -0.7480596, 0.6078432, 1, 0, 1,
-0.7391897, -0.8329009, -2.550591, 0.6039216, 1, 0, 1,
-0.7386332, 1.412063, -1.357401, 0.5960785, 1, 0, 1,
-0.73787, -0.2249667, -1.295327, 0.5882353, 1, 0, 1,
-0.7311825, -1.866798, -3.989371, 0.5843138, 1, 0, 1,
-0.7212931, 0.1659072, -1.456867, 0.5764706, 1, 0, 1,
-0.7184735, 0.8581992, -1.143187, 0.572549, 1, 0, 1,
-0.7104451, 0.8085079, -2.253746, 0.5647059, 1, 0, 1,
-0.7086405, -0.1767814, -1.347916, 0.5607843, 1, 0, 1,
-0.7079505, -0.2854722, -1.041034, 0.5529412, 1, 0, 1,
-0.7040666, 1.232985, -0.4501061, 0.5490196, 1, 0, 1,
-0.7031495, -0.4707949, -2.056004, 0.5411765, 1, 0, 1,
-0.7019136, -1.062447, -1.153952, 0.5372549, 1, 0, 1,
-0.6928453, -1.058402, -1.819231, 0.5294118, 1, 0, 1,
-0.6888803, 2.409825, -0.1850899, 0.5254902, 1, 0, 1,
-0.6836011, 0.2410415, -0.9309417, 0.5176471, 1, 0, 1,
-0.6795715, 0.1218491, -3.267084, 0.5137255, 1, 0, 1,
-0.6704453, 0.03708273, -0.2068117, 0.5058824, 1, 0, 1,
-0.6681591, 0.1834747, -0.9860576, 0.5019608, 1, 0, 1,
-0.6609887, 0.659656, -2.833362, 0.4941176, 1, 0, 1,
-0.6555331, -0.9704643, -1.860004, 0.4862745, 1, 0, 1,
-0.6515556, 2.611839, 1.659588, 0.4823529, 1, 0, 1,
-0.6514254, -0.7848339, -2.856706, 0.4745098, 1, 0, 1,
-0.6494542, -0.4228545, -1.212929, 0.4705882, 1, 0, 1,
-0.6433545, 0.6500429, 0.8443502, 0.4627451, 1, 0, 1,
-0.6368352, 0.1281954, -1.907911, 0.4588235, 1, 0, 1,
-0.6346196, -0.2685183, -0.836026, 0.4509804, 1, 0, 1,
-0.6320574, -0.2932005, -2.597216, 0.4470588, 1, 0, 1,
-0.6284621, 0.9606939, -2.115773, 0.4392157, 1, 0, 1,
-0.6226143, 1.001953, 0.09269228, 0.4352941, 1, 0, 1,
-0.6212422, 1.829298, 0.8016941, 0.427451, 1, 0, 1,
-0.6203184, 0.9157206, -1.258448, 0.4235294, 1, 0, 1,
-0.6163911, 0.2843788, -1.127806, 0.4156863, 1, 0, 1,
-0.6160199, 0.372925, -1.241257, 0.4117647, 1, 0, 1,
-0.6138399, -0.01400148, -3.58198, 0.4039216, 1, 0, 1,
-0.6115026, -0.2145515, -2.134307, 0.3960784, 1, 0, 1,
-0.6111014, -0.2921193, -1.978327, 0.3921569, 1, 0, 1,
-0.6104072, -0.1411576, 0.4985703, 0.3843137, 1, 0, 1,
-0.6083226, -0.3616064, -1.174503, 0.3803922, 1, 0, 1,
-0.6076202, 1.176344, -1.099031, 0.372549, 1, 0, 1,
-0.599777, -1.104577, -1.566468, 0.3686275, 1, 0, 1,
-0.5990846, -0.6263454, -4.680809, 0.3607843, 1, 0, 1,
-0.5982966, -0.8277838, -2.65123, 0.3568628, 1, 0, 1,
-0.5980105, 0.3521533, -2.22738, 0.3490196, 1, 0, 1,
-0.5976284, -0.6215649, -2.115685, 0.345098, 1, 0, 1,
-0.5951201, 0.5614333, -2.370958, 0.3372549, 1, 0, 1,
-0.5908256, 0.2291713, 0.4646632, 0.3333333, 1, 0, 1,
-0.5857818, 1.103685, -2.835552, 0.3254902, 1, 0, 1,
-0.5852016, 0.5377415, -0.7019315, 0.3215686, 1, 0, 1,
-0.5850627, -0.4802558, -2.014324, 0.3137255, 1, 0, 1,
-0.5841556, 0.469155, -0.206344, 0.3098039, 1, 0, 1,
-0.5834215, 0.1430983, -1.269394, 0.3019608, 1, 0, 1,
-0.5766514, -0.5487598, -3.257882, 0.2941177, 1, 0, 1,
-0.5721535, 1.351571, -0.7717556, 0.2901961, 1, 0, 1,
-0.5679022, -1.403013, -1.960521, 0.282353, 1, 0, 1,
-0.560553, -0.1797604, -2.288027, 0.2784314, 1, 0, 1,
-0.5561715, -1.451994, -2.970955, 0.2705882, 1, 0, 1,
-0.552633, 0.04349596, -0.7548596, 0.2666667, 1, 0, 1,
-0.5473151, 1.388531, 1.042806, 0.2588235, 1, 0, 1,
-0.54124, -0.8828639, -3.865899, 0.254902, 1, 0, 1,
-0.5412233, 0.1661912, -2.337471, 0.2470588, 1, 0, 1,
-0.5406926, 2.782101, -3.145472, 0.2431373, 1, 0, 1,
-0.5403522, -0.572603, -3.527615, 0.2352941, 1, 0, 1,
-0.5399651, 1.077264, -0.7728401, 0.2313726, 1, 0, 1,
-0.5398222, -0.2728193, -3.869275, 0.2235294, 1, 0, 1,
-0.538539, -0.9992466, -2.66773, 0.2196078, 1, 0, 1,
-0.534897, 0.4404986, -1.74153, 0.2117647, 1, 0, 1,
-0.5258284, 2.026474, -1.087171, 0.2078431, 1, 0, 1,
-0.5163425, 0.6262859, -1.076472, 0.2, 1, 0, 1,
-0.5141377, -0.6006296, -2.609658, 0.1921569, 1, 0, 1,
-0.5139307, -1.052701, -3.751263, 0.1882353, 1, 0, 1,
-0.5129858, 1.355471, -0.920845, 0.1803922, 1, 0, 1,
-0.5103388, 0.3889333, -0.8472138, 0.1764706, 1, 0, 1,
-0.5055937, -1.015339, -3.758045, 0.1686275, 1, 0, 1,
-0.5026293, 0.4017574, -1.887742, 0.1647059, 1, 0, 1,
-0.501421, -0.7356173, -1.450351, 0.1568628, 1, 0, 1,
-0.4942283, -0.69023, -2.223313, 0.1529412, 1, 0, 1,
-0.4931382, -0.1085141, -1.964778, 0.145098, 1, 0, 1,
-0.4926595, 1.723115, -0.4905149, 0.1411765, 1, 0, 1,
-0.4870614, -1.958266, -4.488251, 0.1333333, 1, 0, 1,
-0.4849111, -0.04168833, -2.162973, 0.1294118, 1, 0, 1,
-0.4843156, -1.337764, -3.778476, 0.1215686, 1, 0, 1,
-0.4804273, -0.2442824, -2.818694, 0.1176471, 1, 0, 1,
-0.4713119, -0.8190398, -3.358231, 0.1098039, 1, 0, 1,
-0.4684558, -0.1761822, -2.737722, 0.1058824, 1, 0, 1,
-0.4681863, -1.195917, -3.175364, 0.09803922, 1, 0, 1,
-0.4660591, -2.020624, -2.683372, 0.09019608, 1, 0, 1,
-0.4607506, 1.016065, -0.6241847, 0.08627451, 1, 0, 1,
-0.4575047, -1.189256, -2.315904, 0.07843138, 1, 0, 1,
-0.4555598, -0.9947214, -4.084032, 0.07450981, 1, 0, 1,
-0.4511871, -0.5426813, -2.166079, 0.06666667, 1, 0, 1,
-0.4496991, -0.5474875, -2.470419, 0.0627451, 1, 0, 1,
-0.4489185, -0.1533302, -0.5277309, 0.05490196, 1, 0, 1,
-0.4406273, 0.1137348, -1.504204, 0.05098039, 1, 0, 1,
-0.4405623, 1.137982, 0.8290901, 0.04313726, 1, 0, 1,
-0.4395554, 0.4272222, 1.54282, 0.03921569, 1, 0, 1,
-0.4388719, -1.242878, -3.843136, 0.03137255, 1, 0, 1,
-0.4383762, 2.091025, -1.36842, 0.02745098, 1, 0, 1,
-0.4380802, 0.7872407, -0.1328931, 0.01960784, 1, 0, 1,
-0.4359884, 0.3670028, -4.297422, 0.01568628, 1, 0, 1,
-0.4269898, -1.307645, -2.627908, 0.007843138, 1, 0, 1,
-0.4255768, 1.115781, -0.1460363, 0.003921569, 1, 0, 1,
-0.4252148, 1.281574, -0.3501379, 0, 1, 0.003921569, 1,
-0.4154411, -0.04036943, -2.181438, 0, 1, 0.01176471, 1,
-0.4131019, -0.5844185, -3.759757, 0, 1, 0.01568628, 1,
-0.4130573, 0.2008984, -0.8982019, 0, 1, 0.02352941, 1,
-0.4123678, 0.8415899, -1.104544, 0, 1, 0.02745098, 1,
-0.4109984, -0.06139102, -1.534346, 0, 1, 0.03529412, 1,
-0.4056849, -0.4413949, -2.925985, 0, 1, 0.03921569, 1,
-0.405342, -0.3274066, -2.912898, 0, 1, 0.04705882, 1,
-0.4042285, 0.1481337, -1.718487, 0, 1, 0.05098039, 1,
-0.3948525, -0.3667184, -1.277353, 0, 1, 0.05882353, 1,
-0.3915063, 2.854618, 0.8790814, 0, 1, 0.0627451, 1,
-0.3868877, 0.3080931, 0.1004428, 0, 1, 0.07058824, 1,
-0.3838136, -1.174987, -2.600822, 0, 1, 0.07450981, 1,
-0.3826171, 1.956676, 1.488597, 0, 1, 0.08235294, 1,
-0.3807278, -1.174811, -3.071521, 0, 1, 0.08627451, 1,
-0.3775192, 1.496814, -0.07003985, 0, 1, 0.09411765, 1,
-0.3759726, 0.05999934, -1.335202, 0, 1, 0.1019608, 1,
-0.3742744, 1.461426, -0.9500484, 0, 1, 0.1058824, 1,
-0.3664371, -1.434325, -3.534634, 0, 1, 0.1137255, 1,
-0.3645205, 0.08036451, 0.4499786, 0, 1, 0.1176471, 1,
-0.3643189, -0.1421878, -1.245915, 0, 1, 0.1254902, 1,
-0.3636011, 0.7234061, -2.070423, 0, 1, 0.1294118, 1,
-0.3626341, 0.6868235, -0.5530043, 0, 1, 0.1372549, 1,
-0.3624477, -1.471098, -4.504427, 0, 1, 0.1411765, 1,
-0.361676, -1.736225, -1.961164, 0, 1, 0.1490196, 1,
-0.3591094, -0.2697829, -2.181413, 0, 1, 0.1529412, 1,
-0.3583271, -1.436469, -2.069948, 0, 1, 0.1607843, 1,
-0.3579034, -2.154091, -1.046953, 0, 1, 0.1647059, 1,
-0.357598, 0.006745785, -1.584072, 0, 1, 0.172549, 1,
-0.3574423, 0.8827189, -0.6349882, 0, 1, 0.1764706, 1,
-0.3573363, -0.3312428, -1.147991, 0, 1, 0.1843137, 1,
-0.3562938, 0.8606256, 1.1436, 0, 1, 0.1882353, 1,
-0.3560664, 0.2053695, -1.538131, 0, 1, 0.1960784, 1,
-0.3517738, -1.043931, -2.275936, 0, 1, 0.2039216, 1,
-0.3504398, -2.443865, -3.411051, 0, 1, 0.2078431, 1,
-0.3496721, 1.154154, 0.7708154, 0, 1, 0.2156863, 1,
-0.3442858, -1.98228, -2.743223, 0, 1, 0.2196078, 1,
-0.3436516, -1.132726, -4.142575, 0, 1, 0.227451, 1,
-0.3349643, 0.2896168, -1.707679, 0, 1, 0.2313726, 1,
-0.3348916, 1.527339, 1.737735, 0, 1, 0.2392157, 1,
-0.3245412, 0.2328181, -0.9518217, 0, 1, 0.2431373, 1,
-0.3213428, 0.4971309, -0.3715768, 0, 1, 0.2509804, 1,
-0.3174955, 1.296813, 0.8668391, 0, 1, 0.254902, 1,
-0.3140909, 0.8038761, -1.051715, 0, 1, 0.2627451, 1,
-0.3134581, -0.0796411, -2.114596, 0, 1, 0.2666667, 1,
-0.3127959, 0.4868809, -0.1320109, 0, 1, 0.2745098, 1,
-0.3055658, -0.03556686, -0.693337, 0, 1, 0.2784314, 1,
-0.3055002, -0.03378418, -1.84186, 0, 1, 0.2862745, 1,
-0.2998362, 0.1543038, -0.2835837, 0, 1, 0.2901961, 1,
-0.2995676, -1.01918, -4.659414, 0, 1, 0.2980392, 1,
-0.2989628, 0.3717657, -0.5670391, 0, 1, 0.3058824, 1,
-0.2946779, 1.380847, -1.32315, 0, 1, 0.3098039, 1,
-0.2923753, 0.4004561, -2.293498, 0, 1, 0.3176471, 1,
-0.2920319, 1.111355, -0.4118098, 0, 1, 0.3215686, 1,
-0.2884717, -0.5730593, -1.430589, 0, 1, 0.3294118, 1,
-0.2882674, 0.5945501, -0.8531523, 0, 1, 0.3333333, 1,
-0.2852678, 0.4345586, 0.469099, 0, 1, 0.3411765, 1,
-0.2846873, -1.188863, -1.677315, 0, 1, 0.345098, 1,
-0.2795573, 0.724351, -0.3805891, 0, 1, 0.3529412, 1,
-0.2755337, -0.9296396, -3.861782, 0, 1, 0.3568628, 1,
-0.2662168, -0.9927196, -3.469535, 0, 1, 0.3647059, 1,
-0.2648763, -0.6019455, -1.16181, 0, 1, 0.3686275, 1,
-0.2642701, 1.199745, 0.394782, 0, 1, 0.3764706, 1,
-0.2613656, 1.405979, 1.312225, 0, 1, 0.3803922, 1,
-0.2588875, 0.3636669, -0.8625687, 0, 1, 0.3882353, 1,
-0.2577, 0.3899918, -0.02380454, 0, 1, 0.3921569, 1,
-0.2571686, -1.799283, -3.281776, 0, 1, 0.4, 1,
-0.2491134, -1.845842, -3.475343, 0, 1, 0.4078431, 1,
-0.2429596, -0.5807309, -2.182902, 0, 1, 0.4117647, 1,
-0.2409531, -0.1626857, -2.28788, 0, 1, 0.4196078, 1,
-0.2408106, -0.3742825, -2.714167, 0, 1, 0.4235294, 1,
-0.2387145, -0.7370647, -2.781391, 0, 1, 0.4313726, 1,
-0.2376065, -0.3803819, -3.589476, 0, 1, 0.4352941, 1,
-0.2353639, -0.5258107, -2.30555, 0, 1, 0.4431373, 1,
-0.2351579, 1.873716, -0.3031545, 0, 1, 0.4470588, 1,
-0.2324879, 0.04222133, -0.3234597, 0, 1, 0.454902, 1,
-0.2152964, -0.74446, -1.307387, 0, 1, 0.4588235, 1,
-0.2125236, 0.6820923, 0.1743896, 0, 1, 0.4666667, 1,
-0.212255, 0.8807049, -0.9012535, 0, 1, 0.4705882, 1,
-0.2095062, -0.4887315, -3.764519, 0, 1, 0.4784314, 1,
-0.2091765, 0.4000922, -0.6809309, 0, 1, 0.4823529, 1,
-0.2085764, -1.712999, -4.049977, 0, 1, 0.4901961, 1,
-0.2019888, -1.584072, -2.139177, 0, 1, 0.4941176, 1,
-0.2001241, -0.9374517, -1.710082, 0, 1, 0.5019608, 1,
-0.1993948, 0.06151117, -0.9736235, 0, 1, 0.509804, 1,
-0.1957696, -0.04547444, -0.539502, 0, 1, 0.5137255, 1,
-0.1864124, 0.07226012, -1.070505, 0, 1, 0.5215687, 1,
-0.18441, 0.262321, -1.044375, 0, 1, 0.5254902, 1,
-0.1837093, 0.554437, 0.2177646, 0, 1, 0.5333334, 1,
-0.1824023, 2.993511, -1.214795, 0, 1, 0.5372549, 1,
-0.18232, -0.1141878, -0.3397039, 0, 1, 0.5450981, 1,
-0.1804705, -0.324562, -1.236221, 0, 1, 0.5490196, 1,
-0.1765156, 1.676304, -0.2276246, 0, 1, 0.5568628, 1,
-0.1744082, -0.2671977, -1.854566, 0, 1, 0.5607843, 1,
-0.1736087, 1.019754, -0.3751493, 0, 1, 0.5686275, 1,
-0.1701383, 0.1157824, -2.662828, 0, 1, 0.572549, 1,
-0.1696231, 1.963172, -2.190683, 0, 1, 0.5803922, 1,
-0.1674465, -1.480427, -3.784839, 0, 1, 0.5843138, 1,
-0.1663422, 1.058719, -0.7210735, 0, 1, 0.5921569, 1,
-0.1653312, -0.7714233, -3.067703, 0, 1, 0.5960785, 1,
-0.1609109, -0.7549174, -3.299164, 0, 1, 0.6039216, 1,
-0.1602306, -0.02513607, -2.026208, 0, 1, 0.6117647, 1,
-0.1482377, 0.6132029, -1.245997, 0, 1, 0.6156863, 1,
-0.1472411, -0.1566955, -1.746667, 0, 1, 0.6235294, 1,
-0.1466042, 0.4915822, -1.725289, 0, 1, 0.627451, 1,
-0.1441325, -0.4953977, -3.724151, 0, 1, 0.6352941, 1,
-0.1425352, -0.6516465, -2.200398, 0, 1, 0.6392157, 1,
-0.1285639, -0.3301989, -1.737341, 0, 1, 0.6470588, 1,
-0.1263433, -0.1518576, -3.332088, 0, 1, 0.6509804, 1,
-0.1261276, 0.1344779, -0.5545953, 0, 1, 0.6588235, 1,
-0.1214288, 0.3377591, -1.796452, 0, 1, 0.6627451, 1,
-0.1187341, -0.7250623, -2.188084, 0, 1, 0.6705883, 1,
-0.1182319, 0.1393906, 0.6052008, 0, 1, 0.6745098, 1,
-0.1179328, 0.3511159, -2.597253, 0, 1, 0.682353, 1,
-0.1114033, -0.8502474, -2.424259, 0, 1, 0.6862745, 1,
-0.1110223, 1.016425, -1.037756, 0, 1, 0.6941177, 1,
-0.110443, 0.8871381, 0.8601207, 0, 1, 0.7019608, 1,
-0.1103617, 0.1334227, -0.3984868, 0, 1, 0.7058824, 1,
-0.1102138, -0.5842543, -3.483327, 0, 1, 0.7137255, 1,
-0.1078832, 0.6129685, -0.2900181, 0, 1, 0.7176471, 1,
-0.104117, 1.151914, -0.8278937, 0, 1, 0.7254902, 1,
-0.1000219, -1.270808, -3.587239, 0, 1, 0.7294118, 1,
-0.09688599, 0.7759579, -1.26355, 0, 1, 0.7372549, 1,
-0.09373853, -1.114423, -2.247526, 0, 1, 0.7411765, 1,
-0.09198917, -0.7121983, -2.42865, 0, 1, 0.7490196, 1,
-0.08989138, -1.906682, -2.908754, 0, 1, 0.7529412, 1,
-0.0893974, -0.1249632, -0.9560125, 0, 1, 0.7607843, 1,
-0.08914796, -0.971487, -3.434963, 0, 1, 0.7647059, 1,
-0.08498355, -0.4943249, -1.352955, 0, 1, 0.772549, 1,
-0.08309568, -0.117366, -2.987643, 0, 1, 0.7764706, 1,
-0.07982486, 0.444781, 0.1500134, 0, 1, 0.7843137, 1,
-0.07857874, -1.648845, -4.868164, 0, 1, 0.7882353, 1,
-0.07800129, -1.17247, -2.202616, 0, 1, 0.7960784, 1,
-0.07741193, -0.2915769, -3.387532, 0, 1, 0.8039216, 1,
-0.07490418, 1.107738, -1.625653, 0, 1, 0.8078431, 1,
-0.07134492, -0.6154826, -4.785219, 0, 1, 0.8156863, 1,
-0.06562174, 1.064539, -1.097628, 0, 1, 0.8196079, 1,
-0.05969746, -0.6280743, -1.237549, 0, 1, 0.827451, 1,
-0.05893165, 1.05543, -0.5522585, 0, 1, 0.8313726, 1,
-0.05727287, -0.1334664, 0.5714717, 0, 1, 0.8392157, 1,
-0.05391565, -0.212057, -1.933954, 0, 1, 0.8431373, 1,
-0.04376947, -1.345343, -3.153069, 0, 1, 0.8509804, 1,
-0.03945871, -0.5060444, -3.27446, 0, 1, 0.854902, 1,
-0.03813256, 0.2256426, -0.06494959, 0, 1, 0.8627451, 1,
-0.03585717, 0.1144156, 0.8417392, 0, 1, 0.8666667, 1,
-0.03470632, 1.504824, 0.5670447, 0, 1, 0.8745098, 1,
-0.03398789, -0.3280552, -2.557485, 0, 1, 0.8784314, 1,
-0.03215458, 0.6563833, 0.08655526, 0, 1, 0.8862745, 1,
-0.03083656, -1.119161, -1.898666, 0, 1, 0.8901961, 1,
-0.03072198, 1.093412, -1.148503, 0, 1, 0.8980392, 1,
-0.0286453, -0.5722175, -3.617007, 0, 1, 0.9058824, 1,
-0.02393322, -0.222211, -3.490861, 0, 1, 0.9098039, 1,
-0.02177917, -0.1509604, -1.836104, 0, 1, 0.9176471, 1,
-0.01869194, 1.455225, 1.614627, 0, 1, 0.9215686, 1,
-0.01605173, 0.9882911, 0.8221832, 0, 1, 0.9294118, 1,
-0.0160218, -0.6660618, -1.85701, 0, 1, 0.9333333, 1,
-0.01582094, -0.5840032, -3.516351, 0, 1, 0.9411765, 1,
-0.01320496, 0.2127081, -0.2948605, 0, 1, 0.945098, 1,
-0.01221287, -0.9700003, -4.404441, 0, 1, 0.9529412, 1,
-0.01182541, 0.006609389, -0.12749, 0, 1, 0.9568627, 1,
-0.007092986, 0.01230896, -1.890551, 0, 1, 0.9647059, 1,
-0.006724137, 1.583301, -0.68452, 0, 1, 0.9686275, 1,
0.0009608282, -0.05081175, 3.970759, 0, 1, 0.9764706, 1,
0.001597807, 0.02166273, -0.08925317, 0, 1, 0.9803922, 1,
0.004815536, -1.135303, 3.514652, 0, 1, 0.9882353, 1,
0.005799359, 1.17603, 2.194627, 0, 1, 0.9921569, 1,
0.006537691, 0.4633259, -0.7216962, 0, 1, 1, 1,
0.01578278, 2.252719, 0.024394, 0, 0.9921569, 1, 1,
0.01703822, 1.176366, -0.177533, 0, 0.9882353, 1, 1,
0.02001102, 0.1435416, -1.85679, 0, 0.9803922, 1, 1,
0.0209181, -0.4055469, 3.254882, 0, 0.9764706, 1, 1,
0.0219426, 0.2177277, -1.444054, 0, 0.9686275, 1, 1,
0.02268741, -0.3490549, 5.1498, 0, 0.9647059, 1, 1,
0.02329842, -0.3655927, 4.13061, 0, 0.9568627, 1, 1,
0.02462193, -0.7788239, 3.317696, 0, 0.9529412, 1, 1,
0.03108125, 0.005436553, 3.640413, 0, 0.945098, 1, 1,
0.03315991, -0.7083327, 2.652143, 0, 0.9411765, 1, 1,
0.03433967, 0.7573199, -1.362638, 0, 0.9333333, 1, 1,
0.03444063, -0.7051095, 4.269873, 0, 0.9294118, 1, 1,
0.03695523, 0.7420354, -0.5257149, 0, 0.9215686, 1, 1,
0.03722862, -0.6323724, 3.60489, 0, 0.9176471, 1, 1,
0.0378267, 0.2214101, 1.279664, 0, 0.9098039, 1, 1,
0.03809871, -1.455212, 1.516216, 0, 0.9058824, 1, 1,
0.04030971, -0.1387539, 3.686657, 0, 0.8980392, 1, 1,
0.04241971, 1.411367, -0.02179446, 0, 0.8901961, 1, 1,
0.04431041, -0.5713829, 3.942472, 0, 0.8862745, 1, 1,
0.05319613, 1.337844, -2.547118, 0, 0.8784314, 1, 1,
0.05444532, 1.559754, 0.7871581, 0, 0.8745098, 1, 1,
0.054511, 1.063494, 1.775354, 0, 0.8666667, 1, 1,
0.06689577, 1.030854, -0.379266, 0, 0.8627451, 1, 1,
0.06984021, -0.09026344, 0.9813381, 0, 0.854902, 1, 1,
0.07587073, 1.737801, -0.5645493, 0, 0.8509804, 1, 1,
0.07682195, 0.5188695, -0.3470275, 0, 0.8431373, 1, 1,
0.07997122, 1.081218, -0.8028902, 0, 0.8392157, 1, 1,
0.08391045, -0.08761796, 2.394316, 0, 0.8313726, 1, 1,
0.09120508, 0.7549052, 2.162196, 0, 0.827451, 1, 1,
0.09182333, -0.008701775, 2.675498, 0, 0.8196079, 1, 1,
0.09448008, -0.07541797, 3.552344, 0, 0.8156863, 1, 1,
0.09647419, 1.218624, -0.3497751, 0, 0.8078431, 1, 1,
0.09877328, -0.3752357, 1.91091, 0, 0.8039216, 1, 1,
0.1006841, 0.2715187, 0.883131, 0, 0.7960784, 1, 1,
0.1074075, -0.4087323, 2.368061, 0, 0.7882353, 1, 1,
0.1085248, 1.395036, 1.045804, 0, 0.7843137, 1, 1,
0.1086157, -0.8501888, 2.373741, 0, 0.7764706, 1, 1,
0.1151821, 0.7777284, -1.551833, 0, 0.772549, 1, 1,
0.1151844, -0.4942528, 2.810081, 0, 0.7647059, 1, 1,
0.1158681, 0.8651209, 2.290472, 0, 0.7607843, 1, 1,
0.1167047, 0.3512871, 0.06931204, 0, 0.7529412, 1, 1,
0.1192043, -1.765636, 2.799839, 0, 0.7490196, 1, 1,
0.1221427, -0.3029616, 2.324282, 0, 0.7411765, 1, 1,
0.1227591, -0.5913681, 3.421397, 0, 0.7372549, 1, 1,
0.1230328, -1.44632, 3.260188, 0, 0.7294118, 1, 1,
0.123628, -0.3537652, 3.873564, 0, 0.7254902, 1, 1,
0.1284393, -1.371715, 3.781821, 0, 0.7176471, 1, 1,
0.1290207, 0.951734, -0.01810314, 0, 0.7137255, 1, 1,
0.1308945, 0.42476, -0.9449582, 0, 0.7058824, 1, 1,
0.1367042, -0.4053705, 1.282339, 0, 0.6980392, 1, 1,
0.1370905, -0.6317795, 2.372229, 0, 0.6941177, 1, 1,
0.1377481, -1.419574, 3.812248, 0, 0.6862745, 1, 1,
0.1391168, 1.901734, 1.335923, 0, 0.682353, 1, 1,
0.1440263, 0.1227548, -1.184535, 0, 0.6745098, 1, 1,
0.1449358, -2.258606, 2.881695, 0, 0.6705883, 1, 1,
0.1470063, 0.1215645, 1.270053, 0, 0.6627451, 1, 1,
0.1479504, -1.247664, 2.478951, 0, 0.6588235, 1, 1,
0.1488896, 0.8807205, 1.418538, 0, 0.6509804, 1, 1,
0.1537897, 0.196751, -0.5840194, 0, 0.6470588, 1, 1,
0.1547673, -0.1266696, 0.4422318, 0, 0.6392157, 1, 1,
0.1558236, -0.9557916, 6.300812, 0, 0.6352941, 1, 1,
0.1559576, 0.2458069, 0.8797162, 0, 0.627451, 1, 1,
0.1626346, 0.5321679, 0.9781228, 0, 0.6235294, 1, 1,
0.1646704, -1.464524, 2.845492, 0, 0.6156863, 1, 1,
0.1663901, -0.5042944, 3.812603, 0, 0.6117647, 1, 1,
0.1664618, -0.09870196, 1.132059, 0, 0.6039216, 1, 1,
0.1693157, 0.2998345, 1.107105, 0, 0.5960785, 1, 1,
0.1755011, -0.2644368, 3.625765, 0, 0.5921569, 1, 1,
0.178845, 0.7366774, -1.204369, 0, 0.5843138, 1, 1,
0.1832467, -2.151561, 3.123549, 0, 0.5803922, 1, 1,
0.1850373, -0.2133744, 1.838844, 0, 0.572549, 1, 1,
0.1878094, 0.1426744, -0.6825315, 0, 0.5686275, 1, 1,
0.1896168, -0.2086367, 1.754788, 0, 0.5607843, 1, 1,
0.1906878, -0.2702738, 1.200193, 0, 0.5568628, 1, 1,
0.1924752, 1.654849, -0.2326837, 0, 0.5490196, 1, 1,
0.1934228, -0.4136066, 2.698614, 0, 0.5450981, 1, 1,
0.1969241, -1.112665, 3.827192, 0, 0.5372549, 1, 1,
0.1995687, -3.417908, 3.756264, 0, 0.5333334, 1, 1,
0.2006358, -0.2732547, 2.46967, 0, 0.5254902, 1, 1,
0.2037545, -1.193738, 2.930317, 0, 0.5215687, 1, 1,
0.2046193, -1.549977, 2.132232, 0, 0.5137255, 1, 1,
0.2065343, -1.096403, 4.658514, 0, 0.509804, 1, 1,
0.2078059, 0.9735013, 0.7624937, 0, 0.5019608, 1, 1,
0.2092435, -1.29348, 2.829074, 0, 0.4941176, 1, 1,
0.2094482, -0.4091925, 2.23671, 0, 0.4901961, 1, 1,
0.2108673, -1.632768, 3.155962, 0, 0.4823529, 1, 1,
0.2138999, 2.519276, 1.361107, 0, 0.4784314, 1, 1,
0.2283705, 0.384655, 1.349022, 0, 0.4705882, 1, 1,
0.2293315, -0.1172802, 0.7137507, 0, 0.4666667, 1, 1,
0.2329787, -1.178859, 4.917682, 0, 0.4588235, 1, 1,
0.2390584, 0.3422045, -0.5240104, 0, 0.454902, 1, 1,
0.239177, -0.2072551, 1.950705, 0, 0.4470588, 1, 1,
0.2414996, 0.4933046, -0.159293, 0, 0.4431373, 1, 1,
0.2432564, 0.306516, 2.036488, 0, 0.4352941, 1, 1,
0.2432935, 1.49546, 0.9218759, 0, 0.4313726, 1, 1,
0.247949, -1.373732, 1.850257, 0, 0.4235294, 1, 1,
0.249195, -0.1228815, 3.285939, 0, 0.4196078, 1, 1,
0.2517005, -0.3441637, 1.994225, 0, 0.4117647, 1, 1,
0.2517723, -2.114072, 1.201428, 0, 0.4078431, 1, 1,
0.2518685, 1.601258, -1.305139, 0, 0.4, 1, 1,
0.253187, 0.3919131, 1.8054, 0, 0.3921569, 1, 1,
0.2532771, 0.01880846, 1.553394, 0, 0.3882353, 1, 1,
0.2550135, 0.0282624, 2.281026, 0, 0.3803922, 1, 1,
0.2552149, -0.8481643, 3.009228, 0, 0.3764706, 1, 1,
0.2555806, -0.9580448, 1.920632, 0, 0.3686275, 1, 1,
0.2650517, 0.5662736, 2.099864, 0, 0.3647059, 1, 1,
0.2693271, 0.7943716, -0.7927461, 0, 0.3568628, 1, 1,
0.2718012, 0.3834113, 1.681617, 0, 0.3529412, 1, 1,
0.274214, -1.528081, 3.270602, 0, 0.345098, 1, 1,
0.2778898, 0.7683477, -0.6391027, 0, 0.3411765, 1, 1,
0.2816628, 2.30854, 1.094848, 0, 0.3333333, 1, 1,
0.2860141, -1.800994, 2.681582, 0, 0.3294118, 1, 1,
0.2864591, 1.100593, 0.674176, 0, 0.3215686, 1, 1,
0.2868088, 0.8948861, 1.742399, 0, 0.3176471, 1, 1,
0.2879897, -0.5285809, 1.054474, 0, 0.3098039, 1, 1,
0.2913839, 0.4494246, 0.2862595, 0, 0.3058824, 1, 1,
0.2914335, 0.7106254, 0.4907052, 0, 0.2980392, 1, 1,
0.2933507, -0.6581536, 3.538012, 0, 0.2901961, 1, 1,
0.2936356, -1.307215, 3.349925, 0, 0.2862745, 1, 1,
0.293965, -1.276471, 3.027304, 0, 0.2784314, 1, 1,
0.2942917, 0.7196044, -0.3247865, 0, 0.2745098, 1, 1,
0.2953056, -0.6974934, 2.857866, 0, 0.2666667, 1, 1,
0.298808, 2.083586, -0.6427693, 0, 0.2627451, 1, 1,
0.3011979, 0.8147024, 0.6033053, 0, 0.254902, 1, 1,
0.3024237, 0.486646, 0.4143984, 0, 0.2509804, 1, 1,
0.3032423, -0.5152228, 2.945382, 0, 0.2431373, 1, 1,
0.303399, -0.09450913, 2.983356, 0, 0.2392157, 1, 1,
0.3036475, -1.709302, 1.61074, 0, 0.2313726, 1, 1,
0.3075897, -1.094369, 2.590415, 0, 0.227451, 1, 1,
0.308472, 1.411093, -0.1784786, 0, 0.2196078, 1, 1,
0.3114111, -0.3953992, 2.452542, 0, 0.2156863, 1, 1,
0.3120658, -1.123697, 2.927644, 0, 0.2078431, 1, 1,
0.3231664, -0.5893148, 3.422794, 0, 0.2039216, 1, 1,
0.3240684, 0.3131866, 0.4313737, 0, 0.1960784, 1, 1,
0.3302624, 0.3979482, 2.512872, 0, 0.1882353, 1, 1,
0.3308033, 1.768231, -1.008985, 0, 0.1843137, 1, 1,
0.3375465, -1.966653, 2.289025, 0, 0.1764706, 1, 1,
0.3398761, 0.3707352, 1.662085, 0, 0.172549, 1, 1,
0.3442245, 1.587946, -0.3071686, 0, 0.1647059, 1, 1,
0.3464047, 0.3576106, -0.3337287, 0, 0.1607843, 1, 1,
0.3479541, -0.6630166, 2.23356, 0, 0.1529412, 1, 1,
0.34985, 0.7495105, -2.187953, 0, 0.1490196, 1, 1,
0.3510688, 0.8765125, 1.542959, 0, 0.1411765, 1, 1,
0.3530835, -1.419447, 3.762232, 0, 0.1372549, 1, 1,
0.3539531, 0.1501291, 1.301622, 0, 0.1294118, 1, 1,
0.3565118, 1.328415, 1.141801, 0, 0.1254902, 1, 1,
0.3592591, 0.5063423, 1.185337, 0, 0.1176471, 1, 1,
0.3667437, 0.6985644, 1.249173, 0, 0.1137255, 1, 1,
0.3703027, 0.2579474, 0.957739, 0, 0.1058824, 1, 1,
0.374359, 0.3605668, -0.4083047, 0, 0.09803922, 1, 1,
0.3747874, 0.8491247, 0.09342884, 0, 0.09411765, 1, 1,
0.3754936, 1.424259, -0.4834993, 0, 0.08627451, 1, 1,
0.3759399, 0.5483714, 1.970337, 0, 0.08235294, 1, 1,
0.3769204, 0.8658709, 0.4144815, 0, 0.07450981, 1, 1,
0.3814569, 1.291601, -0.3911992, 0, 0.07058824, 1, 1,
0.3818806, -0.6607942, 2.373484, 0, 0.0627451, 1, 1,
0.3825845, 1.038824, 1.162759, 0, 0.05882353, 1, 1,
0.3832256, -0.103844, 2.393517, 0, 0.05098039, 1, 1,
0.3873183, -0.5477259, 2.137417, 0, 0.04705882, 1, 1,
0.3880538, -1.430609, 2.040399, 0, 0.03921569, 1, 1,
0.3924836, -0.9536288, 4.507372, 0, 0.03529412, 1, 1,
0.3987003, 0.44594, 3.085034, 0, 0.02745098, 1, 1,
0.3997027, -0.2822321, 1.362315, 0, 0.02352941, 1, 1,
0.400928, -0.5000176, 3.366646, 0, 0.01568628, 1, 1,
0.4073792, -1.073034, 4.668524, 0, 0.01176471, 1, 1,
0.4076706, 0.4092995, 0.6884373, 0, 0.003921569, 1, 1,
0.4083568, 1.373271, 1.522082, 0.003921569, 0, 1, 1,
0.4125084, 1.003645, 0.8184128, 0.007843138, 0, 1, 1,
0.4140349, -0.3183834, 2.336349, 0.01568628, 0, 1, 1,
0.4289178, 0.9344707, 1.827204, 0.01960784, 0, 1, 1,
0.4369162, 0.2052687, -0.309602, 0.02745098, 0, 1, 1,
0.439388, -1.204393, 1.694624, 0.03137255, 0, 1, 1,
0.4404607, 0.4718142, 0.7148306, 0.03921569, 0, 1, 1,
0.4450313, 2.13107, 0.2429382, 0.04313726, 0, 1, 1,
0.4451449, -0.2624076, 2.052835, 0.05098039, 0, 1, 1,
0.4468685, -0.5414049, 1.783622, 0.05490196, 0, 1, 1,
0.4480117, -2.052241, 2.483525, 0.0627451, 0, 1, 1,
0.4488909, 0.1140603, 2.684462, 0.06666667, 0, 1, 1,
0.4490991, 1.759349, 1.77875, 0.07450981, 0, 1, 1,
0.4515375, 0.4778862, -0.02575866, 0.07843138, 0, 1, 1,
0.4524806, 0.6943586, 1.996524, 0.08627451, 0, 1, 1,
0.4633859, -1.131299, 3.448463, 0.09019608, 0, 1, 1,
0.4667185, -2.062654, 2.286063, 0.09803922, 0, 1, 1,
0.4681961, 0.1269103, 2.297235, 0.1058824, 0, 1, 1,
0.4689802, 0.06762654, 1.171583, 0.1098039, 0, 1, 1,
0.4719132, 0.3311926, -0.604147, 0.1176471, 0, 1, 1,
0.4727891, -0.006312984, 1.825648, 0.1215686, 0, 1, 1,
0.4736106, 2.257771, 0.3926487, 0.1294118, 0, 1, 1,
0.4767702, 0.3248393, 0.7437817, 0.1333333, 0, 1, 1,
0.479838, 0.6692855, 1.139031, 0.1411765, 0, 1, 1,
0.4845121, 0.7826777, 0.9330626, 0.145098, 0, 1, 1,
0.488998, -1.088206, 1.707525, 0.1529412, 0, 1, 1,
0.4923855, 0.826266, 0.146821, 0.1568628, 0, 1, 1,
0.4926468, -0.3270729, 0.7261593, 0.1647059, 0, 1, 1,
0.4927472, 0.4790936, 2.776024, 0.1686275, 0, 1, 1,
0.4938569, -0.2138119, 2.596544, 0.1764706, 0, 1, 1,
0.4959538, 0.07769021, 1.999549, 0.1803922, 0, 1, 1,
0.4974051, 1.244902, 0.4137941, 0.1882353, 0, 1, 1,
0.5043315, 0.9850587, 1.148167, 0.1921569, 0, 1, 1,
0.5051701, -1.024415, 3.157147, 0.2, 0, 1, 1,
0.5105817, 0.2418279, 2.66078, 0.2078431, 0, 1, 1,
0.5127614, -0.9467486, 3.485976, 0.2117647, 0, 1, 1,
0.5187052, -1.547126, 3.520479, 0.2196078, 0, 1, 1,
0.5192419, -0.7234026, 2.130208, 0.2235294, 0, 1, 1,
0.5254183, -1.19762, 1.84424, 0.2313726, 0, 1, 1,
0.5260151, 0.1197088, 2.827601, 0.2352941, 0, 1, 1,
0.5272535, 0.08597729, 2.043997, 0.2431373, 0, 1, 1,
0.5283184, 0.4779012, 0.3775705, 0.2470588, 0, 1, 1,
0.5318168, 0.01285608, 1.250349, 0.254902, 0, 1, 1,
0.5408969, 1.11581, -0.8538489, 0.2588235, 0, 1, 1,
0.5418878, -1.070445, 2.927944, 0.2666667, 0, 1, 1,
0.542755, 0.6182069, 1.378917, 0.2705882, 0, 1, 1,
0.5479218, -0.2032479, 2.832112, 0.2784314, 0, 1, 1,
0.5502545, -1.678342, 3.609958, 0.282353, 0, 1, 1,
0.5528808, -0.1199657, 1.309588, 0.2901961, 0, 1, 1,
0.5544133, -0.9183511, 3.515836, 0.2941177, 0, 1, 1,
0.562133, -0.08280894, 2.621524, 0.3019608, 0, 1, 1,
0.5651322, -0.2050495, 2.231173, 0.3098039, 0, 1, 1,
0.5656465, 0.5524278, 1.131219, 0.3137255, 0, 1, 1,
0.5763986, 0.8635353, 0.7173126, 0.3215686, 0, 1, 1,
0.5791596, -0.1943725, 1.706296, 0.3254902, 0, 1, 1,
0.5845766, 1.015106, 1.041995, 0.3333333, 0, 1, 1,
0.5875168, 0.168723, -0.1728677, 0.3372549, 0, 1, 1,
0.5881314, -0.1807738, 3.303044, 0.345098, 0, 1, 1,
0.5918331, 1.514681, -1.059491, 0.3490196, 0, 1, 1,
0.592517, 1.105624, 0.8981586, 0.3568628, 0, 1, 1,
0.59329, -0.04502865, 1.281138, 0.3607843, 0, 1, 1,
0.5960482, -0.2879129, 1.447387, 0.3686275, 0, 1, 1,
0.6057381, 1.141884, 0.2411165, 0.372549, 0, 1, 1,
0.6091946, -0.4126538, 2.464769, 0.3803922, 0, 1, 1,
0.610137, 0.9163554, 1.352844, 0.3843137, 0, 1, 1,
0.6135197, 0.2968996, -0.2000658, 0.3921569, 0, 1, 1,
0.6189375, 1.302133, 0.08056442, 0.3960784, 0, 1, 1,
0.6203565, -0.07231549, 3.251535, 0.4039216, 0, 1, 1,
0.633401, 0.8511079, 1.282735, 0.4117647, 0, 1, 1,
0.6361693, 0.2450916, 0.7258394, 0.4156863, 0, 1, 1,
0.6367043, 1.206404, 0.342967, 0.4235294, 0, 1, 1,
0.6399836, -0.491804, 3.332044, 0.427451, 0, 1, 1,
0.6449058, -0.8434724, 3.28643, 0.4352941, 0, 1, 1,
0.648398, -0.02442937, 0.3034661, 0.4392157, 0, 1, 1,
0.6495712, 0.3411588, 1.102113, 0.4470588, 0, 1, 1,
0.6497103, -1.76282, 1.023388, 0.4509804, 0, 1, 1,
0.6500668, 0.7327476, 0.554826, 0.4588235, 0, 1, 1,
0.6504017, 0.5289121, 1.747185, 0.4627451, 0, 1, 1,
0.6617374, -1.056236, 2.220144, 0.4705882, 0, 1, 1,
0.6686052, 0.8369025, 0.4429902, 0.4745098, 0, 1, 1,
0.6706231, 1.492598, 2.416894, 0.4823529, 0, 1, 1,
0.6750395, 2.12334, 2.149645, 0.4862745, 0, 1, 1,
0.6786103, 1.323248, -0.2797747, 0.4941176, 0, 1, 1,
0.6792185, 1.032378, -0.02860084, 0.5019608, 0, 1, 1,
0.6864919, 1.585351, -0.2640004, 0.5058824, 0, 1, 1,
0.6925213, 1.678894, 0.4316567, 0.5137255, 0, 1, 1,
0.6958137, 0.5722905, 1.320823, 0.5176471, 0, 1, 1,
0.6999634, 1.91893, 0.1414091, 0.5254902, 0, 1, 1,
0.7009368, -0.8143225, 0.7754629, 0.5294118, 0, 1, 1,
0.7010034, 1.080215, 1.169998, 0.5372549, 0, 1, 1,
0.7020161, 0.8816748, 2.749104, 0.5411765, 0, 1, 1,
0.7050485, -0.422478, 1.567708, 0.5490196, 0, 1, 1,
0.7097659, 1.543873, 0.234077, 0.5529412, 0, 1, 1,
0.7104184, -0.3312098, 1.522498, 0.5607843, 0, 1, 1,
0.7120501, 0.400505, 2.263991, 0.5647059, 0, 1, 1,
0.7151178, -1.072896, 3.131729, 0.572549, 0, 1, 1,
0.7190069, -2.083876, 2.983424, 0.5764706, 0, 1, 1,
0.7197911, -0.8967553, 1.868954, 0.5843138, 0, 1, 1,
0.72298, -0.5449593, 1.98117, 0.5882353, 0, 1, 1,
0.7240117, 0.3311778, 2.144937, 0.5960785, 0, 1, 1,
0.7242108, -1.56681, 3.743728, 0.6039216, 0, 1, 1,
0.7264233, -1.957987, 5.191402, 0.6078432, 0, 1, 1,
0.7276559, -1.064101, 4.406416, 0.6156863, 0, 1, 1,
0.7322561, 0.3044925, 1.124215, 0.6196079, 0, 1, 1,
0.7341853, 0.02877872, 1.231072, 0.627451, 0, 1, 1,
0.7389846, 1.400406, -1.712432, 0.6313726, 0, 1, 1,
0.7400067, 1.555331, 0.6997775, 0.6392157, 0, 1, 1,
0.7481972, 0.02131906, 1.355441, 0.6431373, 0, 1, 1,
0.7493634, -1.895233, 2.52114, 0.6509804, 0, 1, 1,
0.7502208, 0.7460766, 0.2932229, 0.654902, 0, 1, 1,
0.7565991, 0.84749, -0.2982849, 0.6627451, 0, 1, 1,
0.7583221, -0.1479585, 1.192163, 0.6666667, 0, 1, 1,
0.760195, 0.5122277, 1.131783, 0.6745098, 0, 1, 1,
0.7623956, 0.9248945, 0.8416541, 0.6784314, 0, 1, 1,
0.7672581, 1.133393, 2.52155, 0.6862745, 0, 1, 1,
0.7679963, -0.1089828, 2.170177, 0.6901961, 0, 1, 1,
0.7706767, 0.8696291, -0.03428524, 0.6980392, 0, 1, 1,
0.775104, 0.8301551, 2.008173, 0.7058824, 0, 1, 1,
0.7782629, 1.601481, 0.4422451, 0.7098039, 0, 1, 1,
0.7837314, -0.5725569, 1.571314, 0.7176471, 0, 1, 1,
0.7956188, -1.048853, 1.488112, 0.7215686, 0, 1, 1,
0.7959135, 1.182299, 1.116662, 0.7294118, 0, 1, 1,
0.7966895, 0.09402122, 1.896453, 0.7333333, 0, 1, 1,
0.7987753, -1.475224, 2.847312, 0.7411765, 0, 1, 1,
0.8183134, -0.4992893, 2.00551, 0.7450981, 0, 1, 1,
0.8187093, -0.4215561, 3.972212, 0.7529412, 0, 1, 1,
0.8196388, -0.4567128, 3.222404, 0.7568628, 0, 1, 1,
0.8228868, -0.435542, 2.860729, 0.7647059, 0, 1, 1,
0.8230187, -1.368853, 2.969524, 0.7686275, 0, 1, 1,
0.8251078, 0.8516244, 1.331686, 0.7764706, 0, 1, 1,
0.8297623, -1.548408, 3.722764, 0.7803922, 0, 1, 1,
0.838471, -0.6027899, 2.066352, 0.7882353, 0, 1, 1,
0.8386702, -0.6139827, 3.307433, 0.7921569, 0, 1, 1,
0.8420643, 0.8155038, 2.197593, 0.8, 0, 1, 1,
0.8443036, 1.649599, 0.624026, 0.8078431, 0, 1, 1,
0.8477528, -0.3736726, 3.114757, 0.8117647, 0, 1, 1,
0.8507155, 0.6567987, 0.7073784, 0.8196079, 0, 1, 1,
0.851328, 1.168684, -0.2903676, 0.8235294, 0, 1, 1,
0.8570036, -0.02546108, 2.029435, 0.8313726, 0, 1, 1,
0.863184, -0.2021977, 1.187815, 0.8352941, 0, 1, 1,
0.8680891, 0.1511138, 0.2536434, 0.8431373, 0, 1, 1,
0.8690175, 0.5095659, 1.12517, 0.8470588, 0, 1, 1,
0.8698587, -0.2553175, 3.577752, 0.854902, 0, 1, 1,
0.8699995, 2.127335, -1.323102, 0.8588235, 0, 1, 1,
0.8738816, 0.4435852, 1.234722, 0.8666667, 0, 1, 1,
0.88106, -0.1159098, 1.770541, 0.8705882, 0, 1, 1,
0.8842046, -1.100567, 3.033726, 0.8784314, 0, 1, 1,
0.8999814, -0.4572453, 1.579033, 0.8823529, 0, 1, 1,
0.9007314, -1.316074, 4.204397, 0.8901961, 0, 1, 1,
0.9145942, 0.5915348, 0.7713775, 0.8941177, 0, 1, 1,
0.9257677, 1.220857, -0.6324572, 0.9019608, 0, 1, 1,
0.9264505, -0.7669456, 2.299817, 0.9098039, 0, 1, 1,
0.9420913, -0.3978833, 0.6235425, 0.9137255, 0, 1, 1,
0.9456109, 2.013515, 0.8087781, 0.9215686, 0, 1, 1,
0.9497561, -0.2159445, 1.731827, 0.9254902, 0, 1, 1,
0.9523395, 1.357729, -0.5273361, 0.9333333, 0, 1, 1,
0.9530972, 0.6808586, 0.5669217, 0.9372549, 0, 1, 1,
0.9545497, -0.8023381, 2.745348, 0.945098, 0, 1, 1,
0.9668793, 1.011085, 0.7394709, 0.9490196, 0, 1, 1,
0.9690528, -0.2406109, 0.9705991, 0.9568627, 0, 1, 1,
0.9721892, -1.410413, 1.306377, 0.9607843, 0, 1, 1,
0.972643, -0.2040518, 0.6982636, 0.9686275, 0, 1, 1,
0.9729075, 0.2111939, 0.1634491, 0.972549, 0, 1, 1,
0.9751002, -0.4283905, 3.109945, 0.9803922, 0, 1, 1,
0.9770338, 0.6638216, 1.048187, 0.9843137, 0, 1, 1,
0.9802054, -0.529026, 3.630601, 0.9921569, 0, 1, 1,
0.9851925, -0.03169259, 1.616714, 0.9960784, 0, 1, 1,
0.9974738, -0.6048235, 1.466851, 1, 0, 0.9960784, 1,
0.9991953, 0.3019963, 1.693647, 1, 0, 0.9882353, 1,
1.006404, 0.8615084, 1.277698, 1, 0, 0.9843137, 1,
1.007913, 0.1391931, 2.830657, 1, 0, 0.9764706, 1,
1.009812, 1.801118, -0.1981632, 1, 0, 0.972549, 1,
1.02063, 0.05531958, 0.8997146, 1, 0, 0.9647059, 1,
1.022904, -0.1156374, 1.899746, 1, 0, 0.9607843, 1,
1.039485, -1.242094, 0.749903, 1, 0, 0.9529412, 1,
1.041111, 0.3115422, 1.245993, 1, 0, 0.9490196, 1,
1.045611, 0.7437285, -0.4594054, 1, 0, 0.9411765, 1,
1.056014, 0.3602625, 1.26504, 1, 0, 0.9372549, 1,
1.057653, 1.51713, 1.495523, 1, 0, 0.9294118, 1,
1.058946, 0.4073053, -0.941248, 1, 0, 0.9254902, 1,
1.062446, 0.6524354, 0.9781626, 1, 0, 0.9176471, 1,
1.066935, -0.3070897, 1.386798, 1, 0, 0.9137255, 1,
1.068853, -0.2965103, 1.570553, 1, 0, 0.9058824, 1,
1.06921, 1.041632, 1.303336, 1, 0, 0.9019608, 1,
1.070032, 1.895285, 0.0436097, 1, 0, 0.8941177, 1,
1.070222, -0.9521388, -0.4667239, 1, 0, 0.8862745, 1,
1.072293, -0.6488338, 1.09978, 1, 0, 0.8823529, 1,
1.072688, -1.320143, 2.999279, 1, 0, 0.8745098, 1,
1.07319, -0.09833505, 1.138025, 1, 0, 0.8705882, 1,
1.07959, -1.663824, 4.280748, 1, 0, 0.8627451, 1,
1.080797, 0.4134819, 2.174434, 1, 0, 0.8588235, 1,
1.089182, 0.7773823, 1.337733, 1, 0, 0.8509804, 1,
1.092581, -0.1533004, 2.646482, 1, 0, 0.8470588, 1,
1.092785, -1.029035, 0.6115655, 1, 0, 0.8392157, 1,
1.095383, -0.2673436, 2.132874, 1, 0, 0.8352941, 1,
1.101709, 0.764162, 0.3497182, 1, 0, 0.827451, 1,
1.102713, 0.4846757, 0.532667, 1, 0, 0.8235294, 1,
1.115006, 0.8087608, 1.935344, 1, 0, 0.8156863, 1,
1.129857, -0.1108621, 3.032111, 1, 0, 0.8117647, 1,
1.131147, -1.098895, 2.705202, 1, 0, 0.8039216, 1,
1.132198, 0.3936895, 1.813408, 1, 0, 0.7960784, 1,
1.137122, 0.05002106, 0.5830722, 1, 0, 0.7921569, 1,
1.138344, -0.1546797, 1.768093, 1, 0, 0.7843137, 1,
1.14911, -0.0159116, 0.5835779, 1, 0, 0.7803922, 1,
1.151148, 0.7479111, 0.4158396, 1, 0, 0.772549, 1,
1.164204, -0.1439992, 3.142465, 1, 0, 0.7686275, 1,
1.182242, 2.865416, -0.5461528, 1, 0, 0.7607843, 1,
1.1962, -1.137672, 2.608541, 1, 0, 0.7568628, 1,
1.201294, 1.331692, 0.4265319, 1, 0, 0.7490196, 1,
1.204393, 0.589178, 0.2616291, 1, 0, 0.7450981, 1,
1.211828, 0.6340544, 2.495015, 1, 0, 0.7372549, 1,
1.215664, -0.7185637, 1.656783, 1, 0, 0.7333333, 1,
1.217408, -0.5413174, 1.32028, 1, 0, 0.7254902, 1,
1.225717, 1.600393, 0.9201126, 1, 0, 0.7215686, 1,
1.235675, 0.5652524, 3.070654, 1, 0, 0.7137255, 1,
1.23761, -0.4568384, 0.1084706, 1, 0, 0.7098039, 1,
1.247627, 0.8553962, 0.5122965, 1, 0, 0.7019608, 1,
1.250283, -0.4691105, 1.08516, 1, 0, 0.6941177, 1,
1.251481, 0.5105781, 1.468305, 1, 0, 0.6901961, 1,
1.252963, -1.509167, 4.583055, 1, 0, 0.682353, 1,
1.266602, 1.090153, 1.087043, 1, 0, 0.6784314, 1,
1.267861, 0.5819275, -0.5798719, 1, 0, 0.6705883, 1,
1.272861, 1.303005, -1.512998, 1, 0, 0.6666667, 1,
1.274078, -0.2372978, -0.2720361, 1, 0, 0.6588235, 1,
1.282247, -0.8004532, 1.561685, 1, 0, 0.654902, 1,
1.283479, -0.4911978, 2.668381, 1, 0, 0.6470588, 1,
1.288197, -0.1007542, 0.0314658, 1, 0, 0.6431373, 1,
1.288595, 1.085585, 2.051045, 1, 0, 0.6352941, 1,
1.299895, -0.7281598, 2.130848, 1, 0, 0.6313726, 1,
1.300112, 0.7993782, 1.929111, 1, 0, 0.6235294, 1,
1.305685, -0.2289232, 2.267656, 1, 0, 0.6196079, 1,
1.308617, -1.656456, 3.606171, 1, 0, 0.6117647, 1,
1.315069, -2.177826, 2.073001, 1, 0, 0.6078432, 1,
1.319052, -0.005535161, 0.6518372, 1, 0, 0.6, 1,
1.320285, 0.6417336, 1.60787, 1, 0, 0.5921569, 1,
1.322242, 0.8932424, 0.2247778, 1, 0, 0.5882353, 1,
1.325234, -0.285208, 1.736205, 1, 0, 0.5803922, 1,
1.342595, -0.7557719, 1.673936, 1, 0, 0.5764706, 1,
1.368201, 0.03791739, 1.188833, 1, 0, 0.5686275, 1,
1.371082, -0.377916, 4.029206, 1, 0, 0.5647059, 1,
1.37401, 0.5473516, 0.9075106, 1, 0, 0.5568628, 1,
1.374112, 0.3425523, 0.7264416, 1, 0, 0.5529412, 1,
1.387992, 0.5001348, 0.8132969, 1, 0, 0.5450981, 1,
1.402339, 0.2106337, 1.982771, 1, 0, 0.5411765, 1,
1.417965, 1.007928, 1.061718, 1, 0, 0.5333334, 1,
1.419403, -1.123735, 1.824085, 1, 0, 0.5294118, 1,
1.426188, 0.09669232, 0.7403712, 1, 0, 0.5215687, 1,
1.428725, 1.537815, 0.7778866, 1, 0, 0.5176471, 1,
1.436866, 1.058722, 0.6974483, 1, 0, 0.509804, 1,
1.445164, -0.2432035, 2.026612, 1, 0, 0.5058824, 1,
1.446779, -0.01029284, 0.9647479, 1, 0, 0.4980392, 1,
1.453953, 1.162892, 0.9144911, 1, 0, 0.4901961, 1,
1.455569, 0.06116698, 0.467388, 1, 0, 0.4862745, 1,
1.456965, -0.1560991, 2.26706, 1, 0, 0.4784314, 1,
1.460281, -0.3668013, 2.468682, 1, 0, 0.4745098, 1,
1.466442, -1.417802, 3.063612, 1, 0, 0.4666667, 1,
1.470639, -1.531781, 4.990477, 1, 0, 0.4627451, 1,
1.48497, -0.0420863, 2.011886, 1, 0, 0.454902, 1,
1.488897, -0.9919232, 2.135014, 1, 0, 0.4509804, 1,
1.496974, 1.58918, 0.8493189, 1, 0, 0.4431373, 1,
1.507795, -0.3828793, 2.111397, 1, 0, 0.4392157, 1,
1.509027, 0.5869235, 2.110562, 1, 0, 0.4313726, 1,
1.525984, -0.1136746, 1.635789, 1, 0, 0.427451, 1,
1.527473, 2.357385, 0.4094201, 1, 0, 0.4196078, 1,
1.531081, 1.591035, 1.297899, 1, 0, 0.4156863, 1,
1.551008, -1.116001, 0.320332, 1, 0, 0.4078431, 1,
1.555708, 0.8224795, 1.722661, 1, 0, 0.4039216, 1,
1.579058, 1.685304, 1.492472, 1, 0, 0.3960784, 1,
1.593613, -1.089821, 2.986, 1, 0, 0.3882353, 1,
1.611154, 0.3125837, 0.0456682, 1, 0, 0.3843137, 1,
1.618098, 0.8315173, 0.6960378, 1, 0, 0.3764706, 1,
1.627855, 1.41926, 0.8500134, 1, 0, 0.372549, 1,
1.638693, -1.213478, 2.311963, 1, 0, 0.3647059, 1,
1.646797, 0.4896092, 2.634372, 1, 0, 0.3607843, 1,
1.649445, 1.179329, 0.2197772, 1, 0, 0.3529412, 1,
1.650747, 0.9963279, 0.5365064, 1, 0, 0.3490196, 1,
1.660458, 2.678809, 0.3110335, 1, 0, 0.3411765, 1,
1.672532, 1.20654, 0.2431522, 1, 0, 0.3372549, 1,
1.674742, 0.6361561, 2.602739, 1, 0, 0.3294118, 1,
1.677318, -0.9664677, 2.589537, 1, 0, 0.3254902, 1,
1.688431, -0.3990217, 0.4971151, 1, 0, 0.3176471, 1,
1.700513, -0.7419087, 1.817339, 1, 0, 0.3137255, 1,
1.735342, 0.6093376, 1.320558, 1, 0, 0.3058824, 1,
1.735888, 1.213539, 0.9027274, 1, 0, 0.2980392, 1,
1.740466, 0.3995846, 0.02846163, 1, 0, 0.2941177, 1,
1.749261, -0.4433647, 1.186902, 1, 0, 0.2862745, 1,
1.749752, -2.05038, 4.157111, 1, 0, 0.282353, 1,
1.757517, -0.06048563, 0.4943317, 1, 0, 0.2745098, 1,
1.783536, 0.5868405, 1.193599, 1, 0, 0.2705882, 1,
1.784115, -0.5162786, 2.20576, 1, 0, 0.2627451, 1,
1.785681, -0.6699893, -0.1441608, 1, 0, 0.2588235, 1,
1.792666, 0.3238817, 0.2466457, 1, 0, 0.2509804, 1,
1.793971, 1.152326, 1.712047, 1, 0, 0.2470588, 1,
1.806613, -0.2231907, 0.6699422, 1, 0, 0.2392157, 1,
1.818589, -0.2747512, 2.604297, 1, 0, 0.2352941, 1,
1.841246, -2.766819, 2.356458, 1, 0, 0.227451, 1,
1.843496, -1.421774, 2.005422, 1, 0, 0.2235294, 1,
1.863485, -0.2726344, 2.676152, 1, 0, 0.2156863, 1,
1.869619, -0.8506888, 2.033337, 1, 0, 0.2117647, 1,
1.87621, -0.1818163, -0.3550151, 1, 0, 0.2039216, 1,
1.90743, 0.1849678, 2.482921, 1, 0, 0.1960784, 1,
1.907809, 0.8890369, 2.405974, 1, 0, 0.1921569, 1,
1.91497, 0.6797581, 1.4938, 1, 0, 0.1843137, 1,
1.939783, 0.4028382, 2.913695, 1, 0, 0.1803922, 1,
1.970049, -0.3248226, 2.053233, 1, 0, 0.172549, 1,
1.974196, 1.306513, 0.8146056, 1, 0, 0.1686275, 1,
1.985116, 0.4056383, 2.709595, 1, 0, 0.1607843, 1,
2.028549, -0.3345807, 1.164352, 1, 0, 0.1568628, 1,
2.033805, -0.7562765, 2.592421, 1, 0, 0.1490196, 1,
2.034714, -0.5477984, -0.3472751, 1, 0, 0.145098, 1,
2.069632, 1.203202, 1.401602, 1, 0, 0.1372549, 1,
2.078885, -0.6137518, 1.333831, 1, 0, 0.1333333, 1,
2.088353, -1.841269, 2.650277, 1, 0, 0.1254902, 1,
2.111711, 1.058026, 1.592209, 1, 0, 0.1215686, 1,
2.117009, -2.928596, 1.714997, 1, 0, 0.1137255, 1,
2.153059, -0.7069595, 2.334925, 1, 0, 0.1098039, 1,
2.163487, 1.084532, 2.534592, 1, 0, 0.1019608, 1,
2.185669, -1.119625, 0.9019098, 1, 0, 0.09411765, 1,
2.206472, 0.6755171, 0.3009888, 1, 0, 0.09019608, 1,
2.274923, 1.397271, 1.876646, 1, 0, 0.08235294, 1,
2.279037, -1.583161, 1.876824, 1, 0, 0.07843138, 1,
2.320379, 1.507473, 0.1887447, 1, 0, 0.07058824, 1,
2.324637, -1.042421, 1.116184, 1, 0, 0.06666667, 1,
2.33182, 0.1241628, 0.6594338, 1, 0, 0.05882353, 1,
2.344043, -1.661324, 1.746638, 1, 0, 0.05490196, 1,
2.416165, 0.4347551, 1.358875, 1, 0, 0.04705882, 1,
2.425369, -0.8621159, 1.276894, 1, 0, 0.04313726, 1,
2.51863, -0.7160097, 3.389398, 1, 0, 0.03529412, 1,
2.546894, 0.08686257, 1.92704, 1, 0, 0.03137255, 1,
2.612713, 0.3806443, 1.756444, 1, 0, 0.02352941, 1,
2.753871, 2.150814, 0.06352547, 1, 0, 0.01960784, 1,
2.837074, -0.423548, 2.102732, 1, 0, 0.01176471, 1,
2.855433, -0.3261074, 1.85745, 1, 0, 0.007843138, 1
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
-0.1141808, -4.504643, -7.449777, 0, -0.5, 0.5, 0.5,
-0.1141808, -4.504643, -7.449777, 1, -0.5, 0.5, 0.5,
-0.1141808, -4.504643, -7.449777, 1, 1.5, 0.5, 0.5,
-0.1141808, -4.504643, -7.449777, 0, 1.5, 0.5, 0.5
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
-4.090494, -0.2121985, -7.449777, 0, -0.5, 0.5, 0.5,
-4.090494, -0.2121985, -7.449777, 1, -0.5, 0.5, 0.5,
-4.090494, -0.2121985, -7.449777, 1, 1.5, 0.5, 0.5,
-4.090494, -0.2121985, -7.449777, 0, 1.5, 0.5, 0.5
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
-4.090494, -4.504643, 0.4219799, 0, -0.5, 0.5, 0.5,
-4.090494, -4.504643, 0.4219799, 1, -0.5, 0.5, 0.5,
-4.090494, -4.504643, 0.4219799, 1, 1.5, 0.5, 0.5,
-4.090494, -4.504643, 0.4219799, 0, 1.5, 0.5, 0.5
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
-3, -3.514079, -5.633217,
2, -3.514079, -5.633217,
-3, -3.514079, -5.633217,
-3, -3.679173, -5.935977,
-2, -3.514079, -5.633217,
-2, -3.679173, -5.935977,
-1, -3.514079, -5.633217,
-1, -3.679173, -5.935977,
0, -3.514079, -5.633217,
0, -3.679173, -5.935977,
1, -3.514079, -5.633217,
1, -3.679173, -5.935977,
2, -3.514079, -5.633217,
2, -3.679173, -5.935977
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
-3, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
-3, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
-3, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
-3, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5,
-2, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
-2, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
-2, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
-2, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5,
-1, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
-1, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
-1, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
-1, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5,
0, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
0, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
0, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
0, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5,
1, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
1, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
1, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
1, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5,
2, -4.009361, -6.541497, 0, -0.5, 0.5, 0.5,
2, -4.009361, -6.541497, 1, -0.5, 0.5, 0.5,
2, -4.009361, -6.541497, 1, 1.5, 0.5, 0.5,
2, -4.009361, -6.541497, 0, 1.5, 0.5, 0.5
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
-3.172883, -3, -5.633217,
-3.172883, 2, -5.633217,
-3.172883, -3, -5.633217,
-3.325818, -3, -5.935977,
-3.172883, -2, -5.633217,
-3.325818, -2, -5.935977,
-3.172883, -1, -5.633217,
-3.325818, -1, -5.935977,
-3.172883, 0, -5.633217,
-3.325818, 0, -5.935977,
-3.172883, 1, -5.633217,
-3.325818, 1, -5.935977,
-3.172883, 2, -5.633217,
-3.325818, 2, -5.935977
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
-3.631688, -3, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, -3, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, -3, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, -3, -6.541497, 0, 1.5, 0.5, 0.5,
-3.631688, -2, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, -2, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, -2, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, -2, -6.541497, 0, 1.5, 0.5, 0.5,
-3.631688, -1, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, -1, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, -1, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, -1, -6.541497, 0, 1.5, 0.5, 0.5,
-3.631688, 0, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, 0, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, 0, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, 0, -6.541497, 0, 1.5, 0.5, 0.5,
-3.631688, 1, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, 1, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, 1, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, 1, -6.541497, 0, 1.5, 0.5, 0.5,
-3.631688, 2, -6.541497, 0, -0.5, 0.5, 0.5,
-3.631688, 2, -6.541497, 1, -0.5, 0.5, 0.5,
-3.631688, 2, -6.541497, 1, 1.5, 0.5, 0.5,
-3.631688, 2, -6.541497, 0, 1.5, 0.5, 0.5
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
-3.172883, -3.514079, -4,
-3.172883, -3.514079, 6,
-3.172883, -3.514079, -4,
-3.325818, -3.679173, -4,
-3.172883, -3.514079, -2,
-3.325818, -3.679173, -2,
-3.172883, -3.514079, 0,
-3.325818, -3.679173, 0,
-3.172883, -3.514079, 2,
-3.325818, -3.679173, 2,
-3.172883, -3.514079, 4,
-3.325818, -3.679173, 4,
-3.172883, -3.514079, 6,
-3.325818, -3.679173, 6
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
-3.631688, -4.009361, -4, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, -4, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, -4, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, -4, 0, 1.5, 0.5, 0.5,
-3.631688, -4.009361, -2, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, -2, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, -2, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, -2, 0, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 0, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 0, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 0, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 0, 0, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 2, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 2, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 2, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 2, 0, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 4, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 4, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 4, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 4, 0, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 6, 0, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 6, 1, -0.5, 0.5, 0.5,
-3.631688, -4.009361, 6, 1, 1.5, 0.5, 0.5,
-3.631688, -4.009361, 6, 0, 1.5, 0.5, 0.5
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
-3.172883, -3.514079, -5.633217,
-3.172883, 3.089682, -5.633217,
-3.172883, -3.514079, 6.477177,
-3.172883, 3.089682, 6.477177,
-3.172883, -3.514079, -5.633217,
-3.172883, -3.514079, 6.477177,
-3.172883, 3.089682, -5.633217,
-3.172883, 3.089682, 6.477177,
-3.172883, -3.514079, -5.633217,
2.944521, -3.514079, -5.633217,
-3.172883, -3.514079, 6.477177,
2.944521, -3.514079, 6.477177,
-3.172883, 3.089682, -5.633217,
2.944521, 3.089682, -5.633217,
-3.172883, 3.089682, 6.477177,
2.944521, 3.089682, 6.477177,
2.944521, -3.514079, -5.633217,
2.944521, 3.089682, -5.633217,
2.944521, -3.514079, 6.477177,
2.944521, 3.089682, 6.477177,
2.944521, -3.514079, -5.633217,
2.944521, -3.514079, 6.477177,
2.944521, 3.089682, -5.633217,
2.944521, 3.089682, 6.477177
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
var radius = 8.057517;
var distance = 35.8488;
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
mvMatrix.translate( 0.1141808, 0.2121985, -0.4219799 );
mvMatrix.scale( 1.424124, 1.31924, 0.7193775 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.8488);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-Chlorpropan<-read.table("1-Chlorpropan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-Chlorpropan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpropan' not found
```

```r
y<-1-Chlorpropan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpropan' not found
```

```r
z<-1-Chlorpropan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpropan' not found
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
-3.083795, 0.1533241, -2.994434, 0, 0, 1, 1, 1,
-2.819965, 1.759113, 0.541086, 1, 0, 0, 1, 1,
-2.767935, -1.189395, -1.109227, 1, 0, 0, 1, 1,
-2.688718, -0.1430815, -1.625909, 1, 0, 0, 1, 1,
-2.614808, -0.7842844, -3.372959, 1, 0, 0, 1, 1,
-2.531854, -1.38725, -2.204614, 1, 0, 0, 1, 1,
-2.410915, -0.1502955, -1.326177, 0, 0, 0, 1, 1,
-2.274551, 0.699867, -2.448778, 0, 0, 0, 1, 1,
-2.14427, -2.141651, -2.100559, 0, 0, 0, 1, 1,
-2.132317, -0.6928347, -0.9536991, 0, 0, 0, 1, 1,
-2.117204, 1.663654, -1.361119, 0, 0, 0, 1, 1,
-2.100908, -0.09238668, -2.168102, 0, 0, 0, 1, 1,
-2.095837, 2.008044, -2.615105, 0, 0, 0, 1, 1,
-2.08794, 0.7021659, -0.2407007, 1, 1, 1, 1, 1,
-2.066643, -0.3249673, -2.639607, 1, 1, 1, 1, 1,
-2.061, -1.048996, -1.989606, 1, 1, 1, 1, 1,
-2.009589, -0.1105002, -1.65215, 1, 1, 1, 1, 1,
-1.978535, 0.9606026, -0.3810711, 1, 1, 1, 1, 1,
-1.97077, 0.6803791, -0.6799821, 1, 1, 1, 1, 1,
-1.946437, 1.922641, -1.077898, 1, 1, 1, 1, 1,
-1.940364, -0.2217002, -1.714999, 1, 1, 1, 1, 1,
-1.939424, -0.2211429, -0.9509492, 1, 1, 1, 1, 1,
-1.919512, 0.4702475, -1.724797, 1, 1, 1, 1, 1,
-1.90751, -1.788255, -2.761426, 1, 1, 1, 1, 1,
-1.907418, 0.8226682, -0.6826478, 1, 1, 1, 1, 1,
-1.898281, 1.614444, -0.8530644, 1, 1, 1, 1, 1,
-1.894593, -2.082944, -1.905619, 1, 1, 1, 1, 1,
-1.868896, -0.03653179, -1.096126, 1, 1, 1, 1, 1,
-1.862338, -0.1749324, -0.8118501, 0, 0, 1, 1, 1,
-1.830604, 0.4005697, -3.974034, 1, 0, 0, 1, 1,
-1.825249, 2.18757, -1.945117, 1, 0, 0, 1, 1,
-1.820868, 1.966441, 0.3813648, 1, 0, 0, 1, 1,
-1.804665, -0.8480872, -5.456852, 1, 0, 0, 1, 1,
-1.803472, 1.002213, -1.453903, 1, 0, 0, 1, 1,
-1.788582, -0.2486928, -0.9519013, 0, 0, 0, 1, 1,
-1.779108, 0.2282216, -1.252935, 0, 0, 0, 1, 1,
-1.749732, -0.803323, -3.116779, 0, 0, 0, 1, 1,
-1.721773, -0.1759866, -2.387192, 0, 0, 0, 1, 1,
-1.715664, -1.585826, -1.872312, 0, 0, 0, 1, 1,
-1.700447, 1.318443, -2.900637, 0, 0, 0, 1, 1,
-1.676595, 0.3515877, -3.359059, 0, 0, 0, 1, 1,
-1.67633, -1.796011, -1.873936, 1, 1, 1, 1, 1,
-1.672725, 0.8754426, -1.35267, 1, 1, 1, 1, 1,
-1.655416, 0.7449875, -2.616767, 1, 1, 1, 1, 1,
-1.643882, -1.272274, -2.99557, 1, 1, 1, 1, 1,
-1.632965, 0.08235582, -0.1931918, 1, 1, 1, 1, 1,
-1.629239, -1.299308, -2.075277, 1, 1, 1, 1, 1,
-1.628538, 0.3911462, -2.918013, 1, 1, 1, 1, 1,
-1.621014, -0.4071203, -3.508183, 1, 1, 1, 1, 1,
-1.61492, -0.3826554, -2.292512, 1, 1, 1, 1, 1,
-1.596309, 0.05173985, -1.458493, 1, 1, 1, 1, 1,
-1.582376, 1.222943, -1.964099, 1, 1, 1, 1, 1,
-1.579046, -0.7487246, -0.195008, 1, 1, 1, 1, 1,
-1.578061, -1.164695, -3.21156, 1, 1, 1, 1, 1,
-1.574802, 0.8948702, -0.2649649, 1, 1, 1, 1, 1,
-1.557496, 0.254928, -1.367306, 1, 1, 1, 1, 1,
-1.539518, 0.3275997, -2.020671, 0, 0, 1, 1, 1,
-1.533702, 0.8215299, -0.6631502, 1, 0, 0, 1, 1,
-1.530629, -1.206918, -0.453136, 1, 0, 0, 1, 1,
-1.504751, -2.474335, -2.627265, 1, 0, 0, 1, 1,
-1.503555, 0.3637436, 0.6603071, 1, 0, 0, 1, 1,
-1.495166, -0.1907601, -1.441472, 1, 0, 0, 1, 1,
-1.483858, 0.07971256, -2.032017, 0, 0, 0, 1, 1,
-1.481212, 0.09312267, -2.487903, 0, 0, 0, 1, 1,
-1.477093, 1.101106, -1.059269, 0, 0, 0, 1, 1,
-1.475838, 0.9949997, -0.6873972, 0, 0, 0, 1, 1,
-1.467669, -0.1615404, -2.452098, 0, 0, 0, 1, 1,
-1.460421, 1.077976, -1.528409, 0, 0, 0, 1, 1,
-1.455295, 0.8677332, -0.6136753, 0, 0, 0, 1, 1,
-1.453572, 1.024444, -1.516656, 1, 1, 1, 1, 1,
-1.453488, 0.1656708, -1.853478, 1, 1, 1, 1, 1,
-1.445685, -0.1893951, -0.6252187, 1, 1, 1, 1, 1,
-1.442653, 0.03690775, -0.1218978, 1, 1, 1, 1, 1,
-1.441861, -1.355676, -1.857284, 1, 1, 1, 1, 1,
-1.43764, 0.4495666, -0.9446968, 1, 1, 1, 1, 1,
-1.431878, 1.073726, 0.2021229, 1, 1, 1, 1, 1,
-1.424129, -0.9855191, -2.272353, 1, 1, 1, 1, 1,
-1.41722, -0.213793, -2.907733, 1, 1, 1, 1, 1,
-1.414581, -0.9223551, -2.492392, 1, 1, 1, 1, 1,
-1.411596, 0.08276153, -1.698852, 1, 1, 1, 1, 1,
-1.40899, -0.5184777, -1.815761, 1, 1, 1, 1, 1,
-1.408362, -0.1968795, -0.4067582, 1, 1, 1, 1, 1,
-1.400607, 0.5935477, -1.413632, 1, 1, 1, 1, 1,
-1.40053, 2.358085, -3.141156, 1, 1, 1, 1, 1,
-1.400239, -1.106334, -3.122826, 0, 0, 1, 1, 1,
-1.395251, 0.2138477, -0.6998782, 1, 0, 0, 1, 1,
-1.391769, -0.6842272, -1.013268, 1, 0, 0, 1, 1,
-1.387643, 0.9784303, -1.283491, 1, 0, 0, 1, 1,
-1.38608, -1.386129, -2.387273, 1, 0, 0, 1, 1,
-1.381808, 0.2940468, -2.010299, 1, 0, 0, 1, 1,
-1.379792, 0.4513379, -0.7041919, 0, 0, 0, 1, 1,
-1.369905, -1.582999, -2.776225, 0, 0, 0, 1, 1,
-1.349034, -0.6527444, -2.46969, 0, 0, 0, 1, 1,
-1.349014, -1.528004, -1.81358, 0, 0, 0, 1, 1,
-1.34224, 0.4988899, -1.928245, 0, 0, 0, 1, 1,
-1.330939, -0.5627145, -1.121098, 0, 0, 0, 1, 1,
-1.291647, -0.1704469, -2.323738, 0, 0, 0, 1, 1,
-1.290713, -1.615666, -4.060292, 1, 1, 1, 1, 1,
-1.282443, 2.722032, 1.827938, 1, 1, 1, 1, 1,
-1.270457, 2.183522, -1.233326, 1, 1, 1, 1, 1,
-1.266872, 0.836803, -0.2811174, 1, 1, 1, 1, 1,
-1.262706, 0.6915763, -2.448175, 1, 1, 1, 1, 1,
-1.259805, -0.1984781, -0.03656555, 1, 1, 1, 1, 1,
-1.257303, 0.366021, -0.2597074, 1, 1, 1, 1, 1,
-1.25598, 0.2084355, -1.753522, 1, 1, 1, 1, 1,
-1.250318, -1.697107, -4.227066, 1, 1, 1, 1, 1,
-1.250162, -0.5624995, -1.835418, 1, 1, 1, 1, 1,
-1.242756, -0.350962, -0.5162359, 1, 1, 1, 1, 1,
-1.242293, -0.4293332, -1.78185, 1, 1, 1, 1, 1,
-1.231833, -0.1283873, -1.1641, 1, 1, 1, 1, 1,
-1.23005, -1.44495, -2.203848, 1, 1, 1, 1, 1,
-1.219587, 0.2284582, -1.254505, 1, 1, 1, 1, 1,
-1.214995, 0.5303807, -1.20639, 0, 0, 1, 1, 1,
-1.211671, 1.295263, -1.709113, 1, 0, 0, 1, 1,
-1.211351, 0.9921905, -0.7310203, 1, 0, 0, 1, 1,
-1.211326, -1.870231, -3.283354, 1, 0, 0, 1, 1,
-1.197363, 0.8945228, -2.27421, 1, 0, 0, 1, 1,
-1.194083, -0.3445154, -1.782257, 1, 0, 0, 1, 1,
-1.194048, 2.160654, -0.531037, 0, 0, 0, 1, 1,
-1.189892, -1.692991, -2.779633, 0, 0, 0, 1, 1,
-1.18258, 0.1147516, -1.464414, 0, 0, 0, 1, 1,
-1.179972, 0.9734888, -0.8754373, 0, 0, 0, 1, 1,
-1.175832, 0.9503753, -1.523837, 0, 0, 0, 1, 1,
-1.170455, -0.772167, -0.5704046, 0, 0, 0, 1, 1,
-1.169173, 0.3241044, -2.168067, 0, 0, 0, 1, 1,
-1.162747, -1.130071, -2.557671, 1, 1, 1, 1, 1,
-1.14953, 0.234013, -2.532985, 1, 1, 1, 1, 1,
-1.148892, 0.4697464, -1.736742, 1, 1, 1, 1, 1,
-1.146116, 0.7486125, -2.347047, 1, 1, 1, 1, 1,
-1.143353, -1.204709, -2.746436, 1, 1, 1, 1, 1,
-1.133269, 1.155881, 0.8395604, 1, 1, 1, 1, 1,
-1.129504, -1.312837, -3.348695, 1, 1, 1, 1, 1,
-1.127985, -0.08901329, 0.7530464, 1, 1, 1, 1, 1,
-1.123882, 0.284703, -2.433028, 1, 1, 1, 1, 1,
-1.123558, 0.9404359, -3.07086, 1, 1, 1, 1, 1,
-1.119327, 1.064965, 0.003259401, 1, 1, 1, 1, 1,
-1.116394, -1.060662, -1.771309, 1, 1, 1, 1, 1,
-1.115807, -1.219744, -0.925892, 1, 1, 1, 1, 1,
-1.112825, 1.100318, -0.2876311, 1, 1, 1, 1, 1,
-1.109911, -1.721939, -3.182986, 1, 1, 1, 1, 1,
-1.105449, 1.766461, 0.6621883, 0, 0, 1, 1, 1,
-1.103282, 1.372348, -0.4845808, 1, 0, 0, 1, 1,
-1.100872, -1.289803, -2.792274, 1, 0, 0, 1, 1,
-1.095399, 0.8768253, -1.640381, 1, 0, 0, 1, 1,
-1.094488, -0.3741222, -1.596897, 1, 0, 0, 1, 1,
-1.086349, 1.125206, -0.6915113, 1, 0, 0, 1, 1,
-1.085428, -0.8093164, -2.023258, 0, 0, 0, 1, 1,
-1.075789, -0.5704077, -1.471208, 0, 0, 0, 1, 1,
-1.07395, -0.4787065, -1.783545, 0, 0, 0, 1, 1,
-1.06911, -1.036542, -3.237319, 0, 0, 0, 1, 1,
-1.06852, -0.555014, -1.950363, 0, 0, 0, 1, 1,
-1.066139, -1.287406, -2.373309, 0, 0, 0, 1, 1,
-1.066058, 1.175537, -2.120477, 0, 0, 0, 1, 1,
-1.063321, 1.084979, -0.7390833, 1, 1, 1, 1, 1,
-1.051547, 0.6658814, 0.2635745, 1, 1, 1, 1, 1,
-1.044947, -0.7056359, -1.390926, 1, 1, 1, 1, 1,
-1.034778, -1.031662, -1.432, 1, 1, 1, 1, 1,
-1.02906, 0.5154169, -1.588356, 1, 1, 1, 1, 1,
-1.027057, -0.2212385, -2.376708, 1, 1, 1, 1, 1,
-1.026563, -0.6437415, -1.601676, 1, 1, 1, 1, 1,
-1.026054, 1.105641, -0.6985214, 1, 1, 1, 1, 1,
-1.025223, 1.197288, -1.025732, 1, 1, 1, 1, 1,
-1.024902, 1.352009, -0.6289946, 1, 1, 1, 1, 1,
-0.9968591, -0.07333182, -1.163477, 1, 1, 1, 1, 1,
-0.992889, -0.04150695, 0.07828702, 1, 1, 1, 1, 1,
-0.9910105, -1.012063, -0.7439078, 1, 1, 1, 1, 1,
-0.9847806, -1.367934, -3.964504, 1, 1, 1, 1, 1,
-0.9836642, 0.4190869, -3.313942, 1, 1, 1, 1, 1,
-0.9831367, 1.258259, -0.548524, 0, 0, 1, 1, 1,
-0.9747171, -0.7155692, -0.7128834, 1, 0, 0, 1, 1,
-0.9717532, -3.020721, -3.693011, 1, 0, 0, 1, 1,
-0.9708596, 1.168564, -1.150993, 1, 0, 0, 1, 1,
-0.9700857, 0.2773365, -1.405253, 1, 0, 0, 1, 1,
-0.9684756, -0.3969446, -1.366441, 1, 0, 0, 1, 1,
-0.9659793, -0.1124566, -2.724348, 0, 0, 0, 1, 1,
-0.9650795, -0.2603168, -0.8171426, 0, 0, 0, 1, 1,
-0.9650297, -0.1241971, -3.840565, 0, 0, 0, 1, 1,
-0.9625595, -0.2216715, -0.7340653, 0, 0, 0, 1, 1,
-0.96026, -1.727676, -2.11368, 0, 0, 0, 1, 1,
-0.9540389, -0.9361205, -2.816998, 0, 0, 0, 1, 1,
-0.9460957, -1.103068, -2.453855, 0, 0, 0, 1, 1,
-0.9443206, 1.400921, -1.103256, 1, 1, 1, 1, 1,
-0.9318393, -0.6339336, -2.821681, 1, 1, 1, 1, 1,
-0.9225749, 0.7268459, -2.987532, 1, 1, 1, 1, 1,
-0.9193452, 1.733147, -0.1746022, 1, 1, 1, 1, 1,
-0.9192885, 0.9161718, -0.9042801, 1, 1, 1, 1, 1,
-0.9117359, 0.5698214, 0.6864793, 1, 1, 1, 1, 1,
-0.9112311, -0.1394661, -0.4907509, 1, 1, 1, 1, 1,
-0.9016001, 0.05824277, -3.031666, 1, 1, 1, 1, 1,
-0.9008962, -1.522648, -2.792276, 1, 1, 1, 1, 1,
-0.8979158, -0.1496638, -2.145275, 1, 1, 1, 1, 1,
-0.8861821, 0.07853068, -0.8594382, 1, 1, 1, 1, 1,
-0.8855671, 1.763542, 0.3123029, 1, 1, 1, 1, 1,
-0.8831512, -0.4778191, -1.209908, 1, 1, 1, 1, 1,
-0.8802946, 0.2648671, 0.2740701, 1, 1, 1, 1, 1,
-0.8763787, 0.1193923, -0.9849526, 1, 1, 1, 1, 1,
-0.8725789, -0.2682181, -2.992, 0, 0, 1, 1, 1,
-0.872454, -1.159487, -3.178736, 1, 0, 0, 1, 1,
-0.8697032, 0.8897532, -0.5987441, 1, 0, 0, 1, 1,
-0.8669975, -0.2166311, -2.59829, 1, 0, 0, 1, 1,
-0.8619729, -0.2035689, -1.92594, 1, 0, 0, 1, 1,
-0.8591751, 0.411519, -1.263945, 1, 0, 0, 1, 1,
-0.8579724, -0.04728562, -0.2419166, 0, 0, 0, 1, 1,
-0.8567868, 0.08600803, -2.226079, 0, 0, 0, 1, 1,
-0.8540431, 0.2003249, -2.06309, 0, 0, 0, 1, 1,
-0.8501107, -0.8529092, -3.389421, 0, 0, 0, 1, 1,
-0.8468053, -1.259289, -3.225385, 0, 0, 0, 1, 1,
-0.8447851, -0.3582624, -3.9931, 0, 0, 0, 1, 1,
-0.83546, 0.8722392, -0.3918725, 0, 0, 0, 1, 1,
-0.8327428, -1.60243, -1.652435, 1, 1, 1, 1, 1,
-0.8249424, -0.9103926, -3.727839, 1, 1, 1, 1, 1,
-0.822508, -1.189752, -1.975113, 1, 1, 1, 1, 1,
-0.8216193, 0.7849467, -0.3809032, 1, 1, 1, 1, 1,
-0.8209231, 1.38955, -1.61531, 1, 1, 1, 1, 1,
-0.8183498, 0.6006138, -0.7800148, 1, 1, 1, 1, 1,
-0.8144661, -0.7125857, -1.728559, 1, 1, 1, 1, 1,
-0.8142965, 2.228887, -0.5646174, 1, 1, 1, 1, 1,
-0.8113869, 0.1375033, -2.782345, 1, 1, 1, 1, 1,
-0.8093982, 1.506103, -0.3602045, 1, 1, 1, 1, 1,
-0.8091148, 1.048906, 0.6369272, 1, 1, 1, 1, 1,
-0.792586, -2.374724, -1.431534, 1, 1, 1, 1, 1,
-0.791078, -1.214959, -2.018328, 1, 1, 1, 1, 1,
-0.7895223, -0.8970048, -3.454524, 1, 1, 1, 1, 1,
-0.7881999, 0.1782522, -1.910478, 1, 1, 1, 1, 1,
-0.786884, 0.1705775, -1.563899, 0, 0, 1, 1, 1,
-0.7781762, -0.5569459, -4.215242, 1, 0, 0, 1, 1,
-0.7721666, -0.01737766, -1.792481, 1, 0, 0, 1, 1,
-0.7631786, -1.060759, -3.913745, 1, 0, 0, 1, 1,
-0.7583989, -1.516153, -3.321599, 1, 0, 0, 1, 1,
-0.7545203, -1.911588, -2.589582, 1, 0, 0, 1, 1,
-0.7468758, -0.3145212, -1.720358, 0, 0, 0, 1, 1,
-0.7459027, -0.8099945, -2.412378, 0, 0, 0, 1, 1,
-0.7422292, 0.8215102, -0.7480596, 0, 0, 0, 1, 1,
-0.7391897, -0.8329009, -2.550591, 0, 0, 0, 1, 1,
-0.7386332, 1.412063, -1.357401, 0, 0, 0, 1, 1,
-0.73787, -0.2249667, -1.295327, 0, 0, 0, 1, 1,
-0.7311825, -1.866798, -3.989371, 0, 0, 0, 1, 1,
-0.7212931, 0.1659072, -1.456867, 1, 1, 1, 1, 1,
-0.7184735, 0.8581992, -1.143187, 1, 1, 1, 1, 1,
-0.7104451, 0.8085079, -2.253746, 1, 1, 1, 1, 1,
-0.7086405, -0.1767814, -1.347916, 1, 1, 1, 1, 1,
-0.7079505, -0.2854722, -1.041034, 1, 1, 1, 1, 1,
-0.7040666, 1.232985, -0.4501061, 1, 1, 1, 1, 1,
-0.7031495, -0.4707949, -2.056004, 1, 1, 1, 1, 1,
-0.7019136, -1.062447, -1.153952, 1, 1, 1, 1, 1,
-0.6928453, -1.058402, -1.819231, 1, 1, 1, 1, 1,
-0.6888803, 2.409825, -0.1850899, 1, 1, 1, 1, 1,
-0.6836011, 0.2410415, -0.9309417, 1, 1, 1, 1, 1,
-0.6795715, 0.1218491, -3.267084, 1, 1, 1, 1, 1,
-0.6704453, 0.03708273, -0.2068117, 1, 1, 1, 1, 1,
-0.6681591, 0.1834747, -0.9860576, 1, 1, 1, 1, 1,
-0.6609887, 0.659656, -2.833362, 1, 1, 1, 1, 1,
-0.6555331, -0.9704643, -1.860004, 0, 0, 1, 1, 1,
-0.6515556, 2.611839, 1.659588, 1, 0, 0, 1, 1,
-0.6514254, -0.7848339, -2.856706, 1, 0, 0, 1, 1,
-0.6494542, -0.4228545, -1.212929, 1, 0, 0, 1, 1,
-0.6433545, 0.6500429, 0.8443502, 1, 0, 0, 1, 1,
-0.6368352, 0.1281954, -1.907911, 1, 0, 0, 1, 1,
-0.6346196, -0.2685183, -0.836026, 0, 0, 0, 1, 1,
-0.6320574, -0.2932005, -2.597216, 0, 0, 0, 1, 1,
-0.6284621, 0.9606939, -2.115773, 0, 0, 0, 1, 1,
-0.6226143, 1.001953, 0.09269228, 0, 0, 0, 1, 1,
-0.6212422, 1.829298, 0.8016941, 0, 0, 0, 1, 1,
-0.6203184, 0.9157206, -1.258448, 0, 0, 0, 1, 1,
-0.6163911, 0.2843788, -1.127806, 0, 0, 0, 1, 1,
-0.6160199, 0.372925, -1.241257, 1, 1, 1, 1, 1,
-0.6138399, -0.01400148, -3.58198, 1, 1, 1, 1, 1,
-0.6115026, -0.2145515, -2.134307, 1, 1, 1, 1, 1,
-0.6111014, -0.2921193, -1.978327, 1, 1, 1, 1, 1,
-0.6104072, -0.1411576, 0.4985703, 1, 1, 1, 1, 1,
-0.6083226, -0.3616064, -1.174503, 1, 1, 1, 1, 1,
-0.6076202, 1.176344, -1.099031, 1, 1, 1, 1, 1,
-0.599777, -1.104577, -1.566468, 1, 1, 1, 1, 1,
-0.5990846, -0.6263454, -4.680809, 1, 1, 1, 1, 1,
-0.5982966, -0.8277838, -2.65123, 1, 1, 1, 1, 1,
-0.5980105, 0.3521533, -2.22738, 1, 1, 1, 1, 1,
-0.5976284, -0.6215649, -2.115685, 1, 1, 1, 1, 1,
-0.5951201, 0.5614333, -2.370958, 1, 1, 1, 1, 1,
-0.5908256, 0.2291713, 0.4646632, 1, 1, 1, 1, 1,
-0.5857818, 1.103685, -2.835552, 1, 1, 1, 1, 1,
-0.5852016, 0.5377415, -0.7019315, 0, 0, 1, 1, 1,
-0.5850627, -0.4802558, -2.014324, 1, 0, 0, 1, 1,
-0.5841556, 0.469155, -0.206344, 1, 0, 0, 1, 1,
-0.5834215, 0.1430983, -1.269394, 1, 0, 0, 1, 1,
-0.5766514, -0.5487598, -3.257882, 1, 0, 0, 1, 1,
-0.5721535, 1.351571, -0.7717556, 1, 0, 0, 1, 1,
-0.5679022, -1.403013, -1.960521, 0, 0, 0, 1, 1,
-0.560553, -0.1797604, -2.288027, 0, 0, 0, 1, 1,
-0.5561715, -1.451994, -2.970955, 0, 0, 0, 1, 1,
-0.552633, 0.04349596, -0.7548596, 0, 0, 0, 1, 1,
-0.5473151, 1.388531, 1.042806, 0, 0, 0, 1, 1,
-0.54124, -0.8828639, -3.865899, 0, 0, 0, 1, 1,
-0.5412233, 0.1661912, -2.337471, 0, 0, 0, 1, 1,
-0.5406926, 2.782101, -3.145472, 1, 1, 1, 1, 1,
-0.5403522, -0.572603, -3.527615, 1, 1, 1, 1, 1,
-0.5399651, 1.077264, -0.7728401, 1, 1, 1, 1, 1,
-0.5398222, -0.2728193, -3.869275, 1, 1, 1, 1, 1,
-0.538539, -0.9992466, -2.66773, 1, 1, 1, 1, 1,
-0.534897, 0.4404986, -1.74153, 1, 1, 1, 1, 1,
-0.5258284, 2.026474, -1.087171, 1, 1, 1, 1, 1,
-0.5163425, 0.6262859, -1.076472, 1, 1, 1, 1, 1,
-0.5141377, -0.6006296, -2.609658, 1, 1, 1, 1, 1,
-0.5139307, -1.052701, -3.751263, 1, 1, 1, 1, 1,
-0.5129858, 1.355471, -0.920845, 1, 1, 1, 1, 1,
-0.5103388, 0.3889333, -0.8472138, 1, 1, 1, 1, 1,
-0.5055937, -1.015339, -3.758045, 1, 1, 1, 1, 1,
-0.5026293, 0.4017574, -1.887742, 1, 1, 1, 1, 1,
-0.501421, -0.7356173, -1.450351, 1, 1, 1, 1, 1,
-0.4942283, -0.69023, -2.223313, 0, 0, 1, 1, 1,
-0.4931382, -0.1085141, -1.964778, 1, 0, 0, 1, 1,
-0.4926595, 1.723115, -0.4905149, 1, 0, 0, 1, 1,
-0.4870614, -1.958266, -4.488251, 1, 0, 0, 1, 1,
-0.4849111, -0.04168833, -2.162973, 1, 0, 0, 1, 1,
-0.4843156, -1.337764, -3.778476, 1, 0, 0, 1, 1,
-0.4804273, -0.2442824, -2.818694, 0, 0, 0, 1, 1,
-0.4713119, -0.8190398, -3.358231, 0, 0, 0, 1, 1,
-0.4684558, -0.1761822, -2.737722, 0, 0, 0, 1, 1,
-0.4681863, -1.195917, -3.175364, 0, 0, 0, 1, 1,
-0.4660591, -2.020624, -2.683372, 0, 0, 0, 1, 1,
-0.4607506, 1.016065, -0.6241847, 0, 0, 0, 1, 1,
-0.4575047, -1.189256, -2.315904, 0, 0, 0, 1, 1,
-0.4555598, -0.9947214, -4.084032, 1, 1, 1, 1, 1,
-0.4511871, -0.5426813, -2.166079, 1, 1, 1, 1, 1,
-0.4496991, -0.5474875, -2.470419, 1, 1, 1, 1, 1,
-0.4489185, -0.1533302, -0.5277309, 1, 1, 1, 1, 1,
-0.4406273, 0.1137348, -1.504204, 1, 1, 1, 1, 1,
-0.4405623, 1.137982, 0.8290901, 1, 1, 1, 1, 1,
-0.4395554, 0.4272222, 1.54282, 1, 1, 1, 1, 1,
-0.4388719, -1.242878, -3.843136, 1, 1, 1, 1, 1,
-0.4383762, 2.091025, -1.36842, 1, 1, 1, 1, 1,
-0.4380802, 0.7872407, -0.1328931, 1, 1, 1, 1, 1,
-0.4359884, 0.3670028, -4.297422, 1, 1, 1, 1, 1,
-0.4269898, -1.307645, -2.627908, 1, 1, 1, 1, 1,
-0.4255768, 1.115781, -0.1460363, 1, 1, 1, 1, 1,
-0.4252148, 1.281574, -0.3501379, 1, 1, 1, 1, 1,
-0.4154411, -0.04036943, -2.181438, 1, 1, 1, 1, 1,
-0.4131019, -0.5844185, -3.759757, 0, 0, 1, 1, 1,
-0.4130573, 0.2008984, -0.8982019, 1, 0, 0, 1, 1,
-0.4123678, 0.8415899, -1.104544, 1, 0, 0, 1, 1,
-0.4109984, -0.06139102, -1.534346, 1, 0, 0, 1, 1,
-0.4056849, -0.4413949, -2.925985, 1, 0, 0, 1, 1,
-0.405342, -0.3274066, -2.912898, 1, 0, 0, 1, 1,
-0.4042285, 0.1481337, -1.718487, 0, 0, 0, 1, 1,
-0.3948525, -0.3667184, -1.277353, 0, 0, 0, 1, 1,
-0.3915063, 2.854618, 0.8790814, 0, 0, 0, 1, 1,
-0.3868877, 0.3080931, 0.1004428, 0, 0, 0, 1, 1,
-0.3838136, -1.174987, -2.600822, 0, 0, 0, 1, 1,
-0.3826171, 1.956676, 1.488597, 0, 0, 0, 1, 1,
-0.3807278, -1.174811, -3.071521, 0, 0, 0, 1, 1,
-0.3775192, 1.496814, -0.07003985, 1, 1, 1, 1, 1,
-0.3759726, 0.05999934, -1.335202, 1, 1, 1, 1, 1,
-0.3742744, 1.461426, -0.9500484, 1, 1, 1, 1, 1,
-0.3664371, -1.434325, -3.534634, 1, 1, 1, 1, 1,
-0.3645205, 0.08036451, 0.4499786, 1, 1, 1, 1, 1,
-0.3643189, -0.1421878, -1.245915, 1, 1, 1, 1, 1,
-0.3636011, 0.7234061, -2.070423, 1, 1, 1, 1, 1,
-0.3626341, 0.6868235, -0.5530043, 1, 1, 1, 1, 1,
-0.3624477, -1.471098, -4.504427, 1, 1, 1, 1, 1,
-0.361676, -1.736225, -1.961164, 1, 1, 1, 1, 1,
-0.3591094, -0.2697829, -2.181413, 1, 1, 1, 1, 1,
-0.3583271, -1.436469, -2.069948, 1, 1, 1, 1, 1,
-0.3579034, -2.154091, -1.046953, 1, 1, 1, 1, 1,
-0.357598, 0.006745785, -1.584072, 1, 1, 1, 1, 1,
-0.3574423, 0.8827189, -0.6349882, 1, 1, 1, 1, 1,
-0.3573363, -0.3312428, -1.147991, 0, 0, 1, 1, 1,
-0.3562938, 0.8606256, 1.1436, 1, 0, 0, 1, 1,
-0.3560664, 0.2053695, -1.538131, 1, 0, 0, 1, 1,
-0.3517738, -1.043931, -2.275936, 1, 0, 0, 1, 1,
-0.3504398, -2.443865, -3.411051, 1, 0, 0, 1, 1,
-0.3496721, 1.154154, 0.7708154, 1, 0, 0, 1, 1,
-0.3442858, -1.98228, -2.743223, 0, 0, 0, 1, 1,
-0.3436516, -1.132726, -4.142575, 0, 0, 0, 1, 1,
-0.3349643, 0.2896168, -1.707679, 0, 0, 0, 1, 1,
-0.3348916, 1.527339, 1.737735, 0, 0, 0, 1, 1,
-0.3245412, 0.2328181, -0.9518217, 0, 0, 0, 1, 1,
-0.3213428, 0.4971309, -0.3715768, 0, 0, 0, 1, 1,
-0.3174955, 1.296813, 0.8668391, 0, 0, 0, 1, 1,
-0.3140909, 0.8038761, -1.051715, 1, 1, 1, 1, 1,
-0.3134581, -0.0796411, -2.114596, 1, 1, 1, 1, 1,
-0.3127959, 0.4868809, -0.1320109, 1, 1, 1, 1, 1,
-0.3055658, -0.03556686, -0.693337, 1, 1, 1, 1, 1,
-0.3055002, -0.03378418, -1.84186, 1, 1, 1, 1, 1,
-0.2998362, 0.1543038, -0.2835837, 1, 1, 1, 1, 1,
-0.2995676, -1.01918, -4.659414, 1, 1, 1, 1, 1,
-0.2989628, 0.3717657, -0.5670391, 1, 1, 1, 1, 1,
-0.2946779, 1.380847, -1.32315, 1, 1, 1, 1, 1,
-0.2923753, 0.4004561, -2.293498, 1, 1, 1, 1, 1,
-0.2920319, 1.111355, -0.4118098, 1, 1, 1, 1, 1,
-0.2884717, -0.5730593, -1.430589, 1, 1, 1, 1, 1,
-0.2882674, 0.5945501, -0.8531523, 1, 1, 1, 1, 1,
-0.2852678, 0.4345586, 0.469099, 1, 1, 1, 1, 1,
-0.2846873, -1.188863, -1.677315, 1, 1, 1, 1, 1,
-0.2795573, 0.724351, -0.3805891, 0, 0, 1, 1, 1,
-0.2755337, -0.9296396, -3.861782, 1, 0, 0, 1, 1,
-0.2662168, -0.9927196, -3.469535, 1, 0, 0, 1, 1,
-0.2648763, -0.6019455, -1.16181, 1, 0, 0, 1, 1,
-0.2642701, 1.199745, 0.394782, 1, 0, 0, 1, 1,
-0.2613656, 1.405979, 1.312225, 1, 0, 0, 1, 1,
-0.2588875, 0.3636669, -0.8625687, 0, 0, 0, 1, 1,
-0.2577, 0.3899918, -0.02380454, 0, 0, 0, 1, 1,
-0.2571686, -1.799283, -3.281776, 0, 0, 0, 1, 1,
-0.2491134, -1.845842, -3.475343, 0, 0, 0, 1, 1,
-0.2429596, -0.5807309, -2.182902, 0, 0, 0, 1, 1,
-0.2409531, -0.1626857, -2.28788, 0, 0, 0, 1, 1,
-0.2408106, -0.3742825, -2.714167, 0, 0, 0, 1, 1,
-0.2387145, -0.7370647, -2.781391, 1, 1, 1, 1, 1,
-0.2376065, -0.3803819, -3.589476, 1, 1, 1, 1, 1,
-0.2353639, -0.5258107, -2.30555, 1, 1, 1, 1, 1,
-0.2351579, 1.873716, -0.3031545, 1, 1, 1, 1, 1,
-0.2324879, 0.04222133, -0.3234597, 1, 1, 1, 1, 1,
-0.2152964, -0.74446, -1.307387, 1, 1, 1, 1, 1,
-0.2125236, 0.6820923, 0.1743896, 1, 1, 1, 1, 1,
-0.212255, 0.8807049, -0.9012535, 1, 1, 1, 1, 1,
-0.2095062, -0.4887315, -3.764519, 1, 1, 1, 1, 1,
-0.2091765, 0.4000922, -0.6809309, 1, 1, 1, 1, 1,
-0.2085764, -1.712999, -4.049977, 1, 1, 1, 1, 1,
-0.2019888, -1.584072, -2.139177, 1, 1, 1, 1, 1,
-0.2001241, -0.9374517, -1.710082, 1, 1, 1, 1, 1,
-0.1993948, 0.06151117, -0.9736235, 1, 1, 1, 1, 1,
-0.1957696, -0.04547444, -0.539502, 1, 1, 1, 1, 1,
-0.1864124, 0.07226012, -1.070505, 0, 0, 1, 1, 1,
-0.18441, 0.262321, -1.044375, 1, 0, 0, 1, 1,
-0.1837093, 0.554437, 0.2177646, 1, 0, 0, 1, 1,
-0.1824023, 2.993511, -1.214795, 1, 0, 0, 1, 1,
-0.18232, -0.1141878, -0.3397039, 1, 0, 0, 1, 1,
-0.1804705, -0.324562, -1.236221, 1, 0, 0, 1, 1,
-0.1765156, 1.676304, -0.2276246, 0, 0, 0, 1, 1,
-0.1744082, -0.2671977, -1.854566, 0, 0, 0, 1, 1,
-0.1736087, 1.019754, -0.3751493, 0, 0, 0, 1, 1,
-0.1701383, 0.1157824, -2.662828, 0, 0, 0, 1, 1,
-0.1696231, 1.963172, -2.190683, 0, 0, 0, 1, 1,
-0.1674465, -1.480427, -3.784839, 0, 0, 0, 1, 1,
-0.1663422, 1.058719, -0.7210735, 0, 0, 0, 1, 1,
-0.1653312, -0.7714233, -3.067703, 1, 1, 1, 1, 1,
-0.1609109, -0.7549174, -3.299164, 1, 1, 1, 1, 1,
-0.1602306, -0.02513607, -2.026208, 1, 1, 1, 1, 1,
-0.1482377, 0.6132029, -1.245997, 1, 1, 1, 1, 1,
-0.1472411, -0.1566955, -1.746667, 1, 1, 1, 1, 1,
-0.1466042, 0.4915822, -1.725289, 1, 1, 1, 1, 1,
-0.1441325, -0.4953977, -3.724151, 1, 1, 1, 1, 1,
-0.1425352, -0.6516465, -2.200398, 1, 1, 1, 1, 1,
-0.1285639, -0.3301989, -1.737341, 1, 1, 1, 1, 1,
-0.1263433, -0.1518576, -3.332088, 1, 1, 1, 1, 1,
-0.1261276, 0.1344779, -0.5545953, 1, 1, 1, 1, 1,
-0.1214288, 0.3377591, -1.796452, 1, 1, 1, 1, 1,
-0.1187341, -0.7250623, -2.188084, 1, 1, 1, 1, 1,
-0.1182319, 0.1393906, 0.6052008, 1, 1, 1, 1, 1,
-0.1179328, 0.3511159, -2.597253, 1, 1, 1, 1, 1,
-0.1114033, -0.8502474, -2.424259, 0, 0, 1, 1, 1,
-0.1110223, 1.016425, -1.037756, 1, 0, 0, 1, 1,
-0.110443, 0.8871381, 0.8601207, 1, 0, 0, 1, 1,
-0.1103617, 0.1334227, -0.3984868, 1, 0, 0, 1, 1,
-0.1102138, -0.5842543, -3.483327, 1, 0, 0, 1, 1,
-0.1078832, 0.6129685, -0.2900181, 1, 0, 0, 1, 1,
-0.104117, 1.151914, -0.8278937, 0, 0, 0, 1, 1,
-0.1000219, -1.270808, -3.587239, 0, 0, 0, 1, 1,
-0.09688599, 0.7759579, -1.26355, 0, 0, 0, 1, 1,
-0.09373853, -1.114423, -2.247526, 0, 0, 0, 1, 1,
-0.09198917, -0.7121983, -2.42865, 0, 0, 0, 1, 1,
-0.08989138, -1.906682, -2.908754, 0, 0, 0, 1, 1,
-0.0893974, -0.1249632, -0.9560125, 0, 0, 0, 1, 1,
-0.08914796, -0.971487, -3.434963, 1, 1, 1, 1, 1,
-0.08498355, -0.4943249, -1.352955, 1, 1, 1, 1, 1,
-0.08309568, -0.117366, -2.987643, 1, 1, 1, 1, 1,
-0.07982486, 0.444781, 0.1500134, 1, 1, 1, 1, 1,
-0.07857874, -1.648845, -4.868164, 1, 1, 1, 1, 1,
-0.07800129, -1.17247, -2.202616, 1, 1, 1, 1, 1,
-0.07741193, -0.2915769, -3.387532, 1, 1, 1, 1, 1,
-0.07490418, 1.107738, -1.625653, 1, 1, 1, 1, 1,
-0.07134492, -0.6154826, -4.785219, 1, 1, 1, 1, 1,
-0.06562174, 1.064539, -1.097628, 1, 1, 1, 1, 1,
-0.05969746, -0.6280743, -1.237549, 1, 1, 1, 1, 1,
-0.05893165, 1.05543, -0.5522585, 1, 1, 1, 1, 1,
-0.05727287, -0.1334664, 0.5714717, 1, 1, 1, 1, 1,
-0.05391565, -0.212057, -1.933954, 1, 1, 1, 1, 1,
-0.04376947, -1.345343, -3.153069, 1, 1, 1, 1, 1,
-0.03945871, -0.5060444, -3.27446, 0, 0, 1, 1, 1,
-0.03813256, 0.2256426, -0.06494959, 1, 0, 0, 1, 1,
-0.03585717, 0.1144156, 0.8417392, 1, 0, 0, 1, 1,
-0.03470632, 1.504824, 0.5670447, 1, 0, 0, 1, 1,
-0.03398789, -0.3280552, -2.557485, 1, 0, 0, 1, 1,
-0.03215458, 0.6563833, 0.08655526, 1, 0, 0, 1, 1,
-0.03083656, -1.119161, -1.898666, 0, 0, 0, 1, 1,
-0.03072198, 1.093412, -1.148503, 0, 0, 0, 1, 1,
-0.0286453, -0.5722175, -3.617007, 0, 0, 0, 1, 1,
-0.02393322, -0.222211, -3.490861, 0, 0, 0, 1, 1,
-0.02177917, -0.1509604, -1.836104, 0, 0, 0, 1, 1,
-0.01869194, 1.455225, 1.614627, 0, 0, 0, 1, 1,
-0.01605173, 0.9882911, 0.8221832, 0, 0, 0, 1, 1,
-0.0160218, -0.6660618, -1.85701, 1, 1, 1, 1, 1,
-0.01582094, -0.5840032, -3.516351, 1, 1, 1, 1, 1,
-0.01320496, 0.2127081, -0.2948605, 1, 1, 1, 1, 1,
-0.01221287, -0.9700003, -4.404441, 1, 1, 1, 1, 1,
-0.01182541, 0.006609389, -0.12749, 1, 1, 1, 1, 1,
-0.007092986, 0.01230896, -1.890551, 1, 1, 1, 1, 1,
-0.006724137, 1.583301, -0.68452, 1, 1, 1, 1, 1,
0.0009608282, -0.05081175, 3.970759, 1, 1, 1, 1, 1,
0.001597807, 0.02166273, -0.08925317, 1, 1, 1, 1, 1,
0.004815536, -1.135303, 3.514652, 1, 1, 1, 1, 1,
0.005799359, 1.17603, 2.194627, 1, 1, 1, 1, 1,
0.006537691, 0.4633259, -0.7216962, 1, 1, 1, 1, 1,
0.01578278, 2.252719, 0.024394, 1, 1, 1, 1, 1,
0.01703822, 1.176366, -0.177533, 1, 1, 1, 1, 1,
0.02001102, 0.1435416, -1.85679, 1, 1, 1, 1, 1,
0.0209181, -0.4055469, 3.254882, 0, 0, 1, 1, 1,
0.0219426, 0.2177277, -1.444054, 1, 0, 0, 1, 1,
0.02268741, -0.3490549, 5.1498, 1, 0, 0, 1, 1,
0.02329842, -0.3655927, 4.13061, 1, 0, 0, 1, 1,
0.02462193, -0.7788239, 3.317696, 1, 0, 0, 1, 1,
0.03108125, 0.005436553, 3.640413, 1, 0, 0, 1, 1,
0.03315991, -0.7083327, 2.652143, 0, 0, 0, 1, 1,
0.03433967, 0.7573199, -1.362638, 0, 0, 0, 1, 1,
0.03444063, -0.7051095, 4.269873, 0, 0, 0, 1, 1,
0.03695523, 0.7420354, -0.5257149, 0, 0, 0, 1, 1,
0.03722862, -0.6323724, 3.60489, 0, 0, 0, 1, 1,
0.0378267, 0.2214101, 1.279664, 0, 0, 0, 1, 1,
0.03809871, -1.455212, 1.516216, 0, 0, 0, 1, 1,
0.04030971, -0.1387539, 3.686657, 1, 1, 1, 1, 1,
0.04241971, 1.411367, -0.02179446, 1, 1, 1, 1, 1,
0.04431041, -0.5713829, 3.942472, 1, 1, 1, 1, 1,
0.05319613, 1.337844, -2.547118, 1, 1, 1, 1, 1,
0.05444532, 1.559754, 0.7871581, 1, 1, 1, 1, 1,
0.054511, 1.063494, 1.775354, 1, 1, 1, 1, 1,
0.06689577, 1.030854, -0.379266, 1, 1, 1, 1, 1,
0.06984021, -0.09026344, 0.9813381, 1, 1, 1, 1, 1,
0.07587073, 1.737801, -0.5645493, 1, 1, 1, 1, 1,
0.07682195, 0.5188695, -0.3470275, 1, 1, 1, 1, 1,
0.07997122, 1.081218, -0.8028902, 1, 1, 1, 1, 1,
0.08391045, -0.08761796, 2.394316, 1, 1, 1, 1, 1,
0.09120508, 0.7549052, 2.162196, 1, 1, 1, 1, 1,
0.09182333, -0.008701775, 2.675498, 1, 1, 1, 1, 1,
0.09448008, -0.07541797, 3.552344, 1, 1, 1, 1, 1,
0.09647419, 1.218624, -0.3497751, 0, 0, 1, 1, 1,
0.09877328, -0.3752357, 1.91091, 1, 0, 0, 1, 1,
0.1006841, 0.2715187, 0.883131, 1, 0, 0, 1, 1,
0.1074075, -0.4087323, 2.368061, 1, 0, 0, 1, 1,
0.1085248, 1.395036, 1.045804, 1, 0, 0, 1, 1,
0.1086157, -0.8501888, 2.373741, 1, 0, 0, 1, 1,
0.1151821, 0.7777284, -1.551833, 0, 0, 0, 1, 1,
0.1151844, -0.4942528, 2.810081, 0, 0, 0, 1, 1,
0.1158681, 0.8651209, 2.290472, 0, 0, 0, 1, 1,
0.1167047, 0.3512871, 0.06931204, 0, 0, 0, 1, 1,
0.1192043, -1.765636, 2.799839, 0, 0, 0, 1, 1,
0.1221427, -0.3029616, 2.324282, 0, 0, 0, 1, 1,
0.1227591, -0.5913681, 3.421397, 0, 0, 0, 1, 1,
0.1230328, -1.44632, 3.260188, 1, 1, 1, 1, 1,
0.123628, -0.3537652, 3.873564, 1, 1, 1, 1, 1,
0.1284393, -1.371715, 3.781821, 1, 1, 1, 1, 1,
0.1290207, 0.951734, -0.01810314, 1, 1, 1, 1, 1,
0.1308945, 0.42476, -0.9449582, 1, 1, 1, 1, 1,
0.1367042, -0.4053705, 1.282339, 1, 1, 1, 1, 1,
0.1370905, -0.6317795, 2.372229, 1, 1, 1, 1, 1,
0.1377481, -1.419574, 3.812248, 1, 1, 1, 1, 1,
0.1391168, 1.901734, 1.335923, 1, 1, 1, 1, 1,
0.1440263, 0.1227548, -1.184535, 1, 1, 1, 1, 1,
0.1449358, -2.258606, 2.881695, 1, 1, 1, 1, 1,
0.1470063, 0.1215645, 1.270053, 1, 1, 1, 1, 1,
0.1479504, -1.247664, 2.478951, 1, 1, 1, 1, 1,
0.1488896, 0.8807205, 1.418538, 1, 1, 1, 1, 1,
0.1537897, 0.196751, -0.5840194, 1, 1, 1, 1, 1,
0.1547673, -0.1266696, 0.4422318, 0, 0, 1, 1, 1,
0.1558236, -0.9557916, 6.300812, 1, 0, 0, 1, 1,
0.1559576, 0.2458069, 0.8797162, 1, 0, 0, 1, 1,
0.1626346, 0.5321679, 0.9781228, 1, 0, 0, 1, 1,
0.1646704, -1.464524, 2.845492, 1, 0, 0, 1, 1,
0.1663901, -0.5042944, 3.812603, 1, 0, 0, 1, 1,
0.1664618, -0.09870196, 1.132059, 0, 0, 0, 1, 1,
0.1693157, 0.2998345, 1.107105, 0, 0, 0, 1, 1,
0.1755011, -0.2644368, 3.625765, 0, 0, 0, 1, 1,
0.178845, 0.7366774, -1.204369, 0, 0, 0, 1, 1,
0.1832467, -2.151561, 3.123549, 0, 0, 0, 1, 1,
0.1850373, -0.2133744, 1.838844, 0, 0, 0, 1, 1,
0.1878094, 0.1426744, -0.6825315, 0, 0, 0, 1, 1,
0.1896168, -0.2086367, 1.754788, 1, 1, 1, 1, 1,
0.1906878, -0.2702738, 1.200193, 1, 1, 1, 1, 1,
0.1924752, 1.654849, -0.2326837, 1, 1, 1, 1, 1,
0.1934228, -0.4136066, 2.698614, 1, 1, 1, 1, 1,
0.1969241, -1.112665, 3.827192, 1, 1, 1, 1, 1,
0.1995687, -3.417908, 3.756264, 1, 1, 1, 1, 1,
0.2006358, -0.2732547, 2.46967, 1, 1, 1, 1, 1,
0.2037545, -1.193738, 2.930317, 1, 1, 1, 1, 1,
0.2046193, -1.549977, 2.132232, 1, 1, 1, 1, 1,
0.2065343, -1.096403, 4.658514, 1, 1, 1, 1, 1,
0.2078059, 0.9735013, 0.7624937, 1, 1, 1, 1, 1,
0.2092435, -1.29348, 2.829074, 1, 1, 1, 1, 1,
0.2094482, -0.4091925, 2.23671, 1, 1, 1, 1, 1,
0.2108673, -1.632768, 3.155962, 1, 1, 1, 1, 1,
0.2138999, 2.519276, 1.361107, 1, 1, 1, 1, 1,
0.2283705, 0.384655, 1.349022, 0, 0, 1, 1, 1,
0.2293315, -0.1172802, 0.7137507, 1, 0, 0, 1, 1,
0.2329787, -1.178859, 4.917682, 1, 0, 0, 1, 1,
0.2390584, 0.3422045, -0.5240104, 1, 0, 0, 1, 1,
0.239177, -0.2072551, 1.950705, 1, 0, 0, 1, 1,
0.2414996, 0.4933046, -0.159293, 1, 0, 0, 1, 1,
0.2432564, 0.306516, 2.036488, 0, 0, 0, 1, 1,
0.2432935, 1.49546, 0.9218759, 0, 0, 0, 1, 1,
0.247949, -1.373732, 1.850257, 0, 0, 0, 1, 1,
0.249195, -0.1228815, 3.285939, 0, 0, 0, 1, 1,
0.2517005, -0.3441637, 1.994225, 0, 0, 0, 1, 1,
0.2517723, -2.114072, 1.201428, 0, 0, 0, 1, 1,
0.2518685, 1.601258, -1.305139, 0, 0, 0, 1, 1,
0.253187, 0.3919131, 1.8054, 1, 1, 1, 1, 1,
0.2532771, 0.01880846, 1.553394, 1, 1, 1, 1, 1,
0.2550135, 0.0282624, 2.281026, 1, 1, 1, 1, 1,
0.2552149, -0.8481643, 3.009228, 1, 1, 1, 1, 1,
0.2555806, -0.9580448, 1.920632, 1, 1, 1, 1, 1,
0.2650517, 0.5662736, 2.099864, 1, 1, 1, 1, 1,
0.2693271, 0.7943716, -0.7927461, 1, 1, 1, 1, 1,
0.2718012, 0.3834113, 1.681617, 1, 1, 1, 1, 1,
0.274214, -1.528081, 3.270602, 1, 1, 1, 1, 1,
0.2778898, 0.7683477, -0.6391027, 1, 1, 1, 1, 1,
0.2816628, 2.30854, 1.094848, 1, 1, 1, 1, 1,
0.2860141, -1.800994, 2.681582, 1, 1, 1, 1, 1,
0.2864591, 1.100593, 0.674176, 1, 1, 1, 1, 1,
0.2868088, 0.8948861, 1.742399, 1, 1, 1, 1, 1,
0.2879897, -0.5285809, 1.054474, 1, 1, 1, 1, 1,
0.2913839, 0.4494246, 0.2862595, 0, 0, 1, 1, 1,
0.2914335, 0.7106254, 0.4907052, 1, 0, 0, 1, 1,
0.2933507, -0.6581536, 3.538012, 1, 0, 0, 1, 1,
0.2936356, -1.307215, 3.349925, 1, 0, 0, 1, 1,
0.293965, -1.276471, 3.027304, 1, 0, 0, 1, 1,
0.2942917, 0.7196044, -0.3247865, 1, 0, 0, 1, 1,
0.2953056, -0.6974934, 2.857866, 0, 0, 0, 1, 1,
0.298808, 2.083586, -0.6427693, 0, 0, 0, 1, 1,
0.3011979, 0.8147024, 0.6033053, 0, 0, 0, 1, 1,
0.3024237, 0.486646, 0.4143984, 0, 0, 0, 1, 1,
0.3032423, -0.5152228, 2.945382, 0, 0, 0, 1, 1,
0.303399, -0.09450913, 2.983356, 0, 0, 0, 1, 1,
0.3036475, -1.709302, 1.61074, 0, 0, 0, 1, 1,
0.3075897, -1.094369, 2.590415, 1, 1, 1, 1, 1,
0.308472, 1.411093, -0.1784786, 1, 1, 1, 1, 1,
0.3114111, -0.3953992, 2.452542, 1, 1, 1, 1, 1,
0.3120658, -1.123697, 2.927644, 1, 1, 1, 1, 1,
0.3231664, -0.5893148, 3.422794, 1, 1, 1, 1, 1,
0.3240684, 0.3131866, 0.4313737, 1, 1, 1, 1, 1,
0.3302624, 0.3979482, 2.512872, 1, 1, 1, 1, 1,
0.3308033, 1.768231, -1.008985, 1, 1, 1, 1, 1,
0.3375465, -1.966653, 2.289025, 1, 1, 1, 1, 1,
0.3398761, 0.3707352, 1.662085, 1, 1, 1, 1, 1,
0.3442245, 1.587946, -0.3071686, 1, 1, 1, 1, 1,
0.3464047, 0.3576106, -0.3337287, 1, 1, 1, 1, 1,
0.3479541, -0.6630166, 2.23356, 1, 1, 1, 1, 1,
0.34985, 0.7495105, -2.187953, 1, 1, 1, 1, 1,
0.3510688, 0.8765125, 1.542959, 1, 1, 1, 1, 1,
0.3530835, -1.419447, 3.762232, 0, 0, 1, 1, 1,
0.3539531, 0.1501291, 1.301622, 1, 0, 0, 1, 1,
0.3565118, 1.328415, 1.141801, 1, 0, 0, 1, 1,
0.3592591, 0.5063423, 1.185337, 1, 0, 0, 1, 1,
0.3667437, 0.6985644, 1.249173, 1, 0, 0, 1, 1,
0.3703027, 0.2579474, 0.957739, 1, 0, 0, 1, 1,
0.374359, 0.3605668, -0.4083047, 0, 0, 0, 1, 1,
0.3747874, 0.8491247, 0.09342884, 0, 0, 0, 1, 1,
0.3754936, 1.424259, -0.4834993, 0, 0, 0, 1, 1,
0.3759399, 0.5483714, 1.970337, 0, 0, 0, 1, 1,
0.3769204, 0.8658709, 0.4144815, 0, 0, 0, 1, 1,
0.3814569, 1.291601, -0.3911992, 0, 0, 0, 1, 1,
0.3818806, -0.6607942, 2.373484, 0, 0, 0, 1, 1,
0.3825845, 1.038824, 1.162759, 1, 1, 1, 1, 1,
0.3832256, -0.103844, 2.393517, 1, 1, 1, 1, 1,
0.3873183, -0.5477259, 2.137417, 1, 1, 1, 1, 1,
0.3880538, -1.430609, 2.040399, 1, 1, 1, 1, 1,
0.3924836, -0.9536288, 4.507372, 1, 1, 1, 1, 1,
0.3987003, 0.44594, 3.085034, 1, 1, 1, 1, 1,
0.3997027, -0.2822321, 1.362315, 1, 1, 1, 1, 1,
0.400928, -0.5000176, 3.366646, 1, 1, 1, 1, 1,
0.4073792, -1.073034, 4.668524, 1, 1, 1, 1, 1,
0.4076706, 0.4092995, 0.6884373, 1, 1, 1, 1, 1,
0.4083568, 1.373271, 1.522082, 1, 1, 1, 1, 1,
0.4125084, 1.003645, 0.8184128, 1, 1, 1, 1, 1,
0.4140349, -0.3183834, 2.336349, 1, 1, 1, 1, 1,
0.4289178, 0.9344707, 1.827204, 1, 1, 1, 1, 1,
0.4369162, 0.2052687, -0.309602, 1, 1, 1, 1, 1,
0.439388, -1.204393, 1.694624, 0, 0, 1, 1, 1,
0.4404607, 0.4718142, 0.7148306, 1, 0, 0, 1, 1,
0.4450313, 2.13107, 0.2429382, 1, 0, 0, 1, 1,
0.4451449, -0.2624076, 2.052835, 1, 0, 0, 1, 1,
0.4468685, -0.5414049, 1.783622, 1, 0, 0, 1, 1,
0.4480117, -2.052241, 2.483525, 1, 0, 0, 1, 1,
0.4488909, 0.1140603, 2.684462, 0, 0, 0, 1, 1,
0.4490991, 1.759349, 1.77875, 0, 0, 0, 1, 1,
0.4515375, 0.4778862, -0.02575866, 0, 0, 0, 1, 1,
0.4524806, 0.6943586, 1.996524, 0, 0, 0, 1, 1,
0.4633859, -1.131299, 3.448463, 0, 0, 0, 1, 1,
0.4667185, -2.062654, 2.286063, 0, 0, 0, 1, 1,
0.4681961, 0.1269103, 2.297235, 0, 0, 0, 1, 1,
0.4689802, 0.06762654, 1.171583, 1, 1, 1, 1, 1,
0.4719132, 0.3311926, -0.604147, 1, 1, 1, 1, 1,
0.4727891, -0.006312984, 1.825648, 1, 1, 1, 1, 1,
0.4736106, 2.257771, 0.3926487, 1, 1, 1, 1, 1,
0.4767702, 0.3248393, 0.7437817, 1, 1, 1, 1, 1,
0.479838, 0.6692855, 1.139031, 1, 1, 1, 1, 1,
0.4845121, 0.7826777, 0.9330626, 1, 1, 1, 1, 1,
0.488998, -1.088206, 1.707525, 1, 1, 1, 1, 1,
0.4923855, 0.826266, 0.146821, 1, 1, 1, 1, 1,
0.4926468, -0.3270729, 0.7261593, 1, 1, 1, 1, 1,
0.4927472, 0.4790936, 2.776024, 1, 1, 1, 1, 1,
0.4938569, -0.2138119, 2.596544, 1, 1, 1, 1, 1,
0.4959538, 0.07769021, 1.999549, 1, 1, 1, 1, 1,
0.4974051, 1.244902, 0.4137941, 1, 1, 1, 1, 1,
0.5043315, 0.9850587, 1.148167, 1, 1, 1, 1, 1,
0.5051701, -1.024415, 3.157147, 0, 0, 1, 1, 1,
0.5105817, 0.2418279, 2.66078, 1, 0, 0, 1, 1,
0.5127614, -0.9467486, 3.485976, 1, 0, 0, 1, 1,
0.5187052, -1.547126, 3.520479, 1, 0, 0, 1, 1,
0.5192419, -0.7234026, 2.130208, 1, 0, 0, 1, 1,
0.5254183, -1.19762, 1.84424, 1, 0, 0, 1, 1,
0.5260151, 0.1197088, 2.827601, 0, 0, 0, 1, 1,
0.5272535, 0.08597729, 2.043997, 0, 0, 0, 1, 1,
0.5283184, 0.4779012, 0.3775705, 0, 0, 0, 1, 1,
0.5318168, 0.01285608, 1.250349, 0, 0, 0, 1, 1,
0.5408969, 1.11581, -0.8538489, 0, 0, 0, 1, 1,
0.5418878, -1.070445, 2.927944, 0, 0, 0, 1, 1,
0.542755, 0.6182069, 1.378917, 0, 0, 0, 1, 1,
0.5479218, -0.2032479, 2.832112, 1, 1, 1, 1, 1,
0.5502545, -1.678342, 3.609958, 1, 1, 1, 1, 1,
0.5528808, -0.1199657, 1.309588, 1, 1, 1, 1, 1,
0.5544133, -0.9183511, 3.515836, 1, 1, 1, 1, 1,
0.562133, -0.08280894, 2.621524, 1, 1, 1, 1, 1,
0.5651322, -0.2050495, 2.231173, 1, 1, 1, 1, 1,
0.5656465, 0.5524278, 1.131219, 1, 1, 1, 1, 1,
0.5763986, 0.8635353, 0.7173126, 1, 1, 1, 1, 1,
0.5791596, -0.1943725, 1.706296, 1, 1, 1, 1, 1,
0.5845766, 1.015106, 1.041995, 1, 1, 1, 1, 1,
0.5875168, 0.168723, -0.1728677, 1, 1, 1, 1, 1,
0.5881314, -0.1807738, 3.303044, 1, 1, 1, 1, 1,
0.5918331, 1.514681, -1.059491, 1, 1, 1, 1, 1,
0.592517, 1.105624, 0.8981586, 1, 1, 1, 1, 1,
0.59329, -0.04502865, 1.281138, 1, 1, 1, 1, 1,
0.5960482, -0.2879129, 1.447387, 0, 0, 1, 1, 1,
0.6057381, 1.141884, 0.2411165, 1, 0, 0, 1, 1,
0.6091946, -0.4126538, 2.464769, 1, 0, 0, 1, 1,
0.610137, 0.9163554, 1.352844, 1, 0, 0, 1, 1,
0.6135197, 0.2968996, -0.2000658, 1, 0, 0, 1, 1,
0.6189375, 1.302133, 0.08056442, 1, 0, 0, 1, 1,
0.6203565, -0.07231549, 3.251535, 0, 0, 0, 1, 1,
0.633401, 0.8511079, 1.282735, 0, 0, 0, 1, 1,
0.6361693, 0.2450916, 0.7258394, 0, 0, 0, 1, 1,
0.6367043, 1.206404, 0.342967, 0, 0, 0, 1, 1,
0.6399836, -0.491804, 3.332044, 0, 0, 0, 1, 1,
0.6449058, -0.8434724, 3.28643, 0, 0, 0, 1, 1,
0.648398, -0.02442937, 0.3034661, 0, 0, 0, 1, 1,
0.6495712, 0.3411588, 1.102113, 1, 1, 1, 1, 1,
0.6497103, -1.76282, 1.023388, 1, 1, 1, 1, 1,
0.6500668, 0.7327476, 0.554826, 1, 1, 1, 1, 1,
0.6504017, 0.5289121, 1.747185, 1, 1, 1, 1, 1,
0.6617374, -1.056236, 2.220144, 1, 1, 1, 1, 1,
0.6686052, 0.8369025, 0.4429902, 1, 1, 1, 1, 1,
0.6706231, 1.492598, 2.416894, 1, 1, 1, 1, 1,
0.6750395, 2.12334, 2.149645, 1, 1, 1, 1, 1,
0.6786103, 1.323248, -0.2797747, 1, 1, 1, 1, 1,
0.6792185, 1.032378, -0.02860084, 1, 1, 1, 1, 1,
0.6864919, 1.585351, -0.2640004, 1, 1, 1, 1, 1,
0.6925213, 1.678894, 0.4316567, 1, 1, 1, 1, 1,
0.6958137, 0.5722905, 1.320823, 1, 1, 1, 1, 1,
0.6999634, 1.91893, 0.1414091, 1, 1, 1, 1, 1,
0.7009368, -0.8143225, 0.7754629, 1, 1, 1, 1, 1,
0.7010034, 1.080215, 1.169998, 0, 0, 1, 1, 1,
0.7020161, 0.8816748, 2.749104, 1, 0, 0, 1, 1,
0.7050485, -0.422478, 1.567708, 1, 0, 0, 1, 1,
0.7097659, 1.543873, 0.234077, 1, 0, 0, 1, 1,
0.7104184, -0.3312098, 1.522498, 1, 0, 0, 1, 1,
0.7120501, 0.400505, 2.263991, 1, 0, 0, 1, 1,
0.7151178, -1.072896, 3.131729, 0, 0, 0, 1, 1,
0.7190069, -2.083876, 2.983424, 0, 0, 0, 1, 1,
0.7197911, -0.8967553, 1.868954, 0, 0, 0, 1, 1,
0.72298, -0.5449593, 1.98117, 0, 0, 0, 1, 1,
0.7240117, 0.3311778, 2.144937, 0, 0, 0, 1, 1,
0.7242108, -1.56681, 3.743728, 0, 0, 0, 1, 1,
0.7264233, -1.957987, 5.191402, 0, 0, 0, 1, 1,
0.7276559, -1.064101, 4.406416, 1, 1, 1, 1, 1,
0.7322561, 0.3044925, 1.124215, 1, 1, 1, 1, 1,
0.7341853, 0.02877872, 1.231072, 1, 1, 1, 1, 1,
0.7389846, 1.400406, -1.712432, 1, 1, 1, 1, 1,
0.7400067, 1.555331, 0.6997775, 1, 1, 1, 1, 1,
0.7481972, 0.02131906, 1.355441, 1, 1, 1, 1, 1,
0.7493634, -1.895233, 2.52114, 1, 1, 1, 1, 1,
0.7502208, 0.7460766, 0.2932229, 1, 1, 1, 1, 1,
0.7565991, 0.84749, -0.2982849, 1, 1, 1, 1, 1,
0.7583221, -0.1479585, 1.192163, 1, 1, 1, 1, 1,
0.760195, 0.5122277, 1.131783, 1, 1, 1, 1, 1,
0.7623956, 0.9248945, 0.8416541, 1, 1, 1, 1, 1,
0.7672581, 1.133393, 2.52155, 1, 1, 1, 1, 1,
0.7679963, -0.1089828, 2.170177, 1, 1, 1, 1, 1,
0.7706767, 0.8696291, -0.03428524, 1, 1, 1, 1, 1,
0.775104, 0.8301551, 2.008173, 0, 0, 1, 1, 1,
0.7782629, 1.601481, 0.4422451, 1, 0, 0, 1, 1,
0.7837314, -0.5725569, 1.571314, 1, 0, 0, 1, 1,
0.7956188, -1.048853, 1.488112, 1, 0, 0, 1, 1,
0.7959135, 1.182299, 1.116662, 1, 0, 0, 1, 1,
0.7966895, 0.09402122, 1.896453, 1, 0, 0, 1, 1,
0.7987753, -1.475224, 2.847312, 0, 0, 0, 1, 1,
0.8183134, -0.4992893, 2.00551, 0, 0, 0, 1, 1,
0.8187093, -0.4215561, 3.972212, 0, 0, 0, 1, 1,
0.8196388, -0.4567128, 3.222404, 0, 0, 0, 1, 1,
0.8228868, -0.435542, 2.860729, 0, 0, 0, 1, 1,
0.8230187, -1.368853, 2.969524, 0, 0, 0, 1, 1,
0.8251078, 0.8516244, 1.331686, 0, 0, 0, 1, 1,
0.8297623, -1.548408, 3.722764, 1, 1, 1, 1, 1,
0.838471, -0.6027899, 2.066352, 1, 1, 1, 1, 1,
0.8386702, -0.6139827, 3.307433, 1, 1, 1, 1, 1,
0.8420643, 0.8155038, 2.197593, 1, 1, 1, 1, 1,
0.8443036, 1.649599, 0.624026, 1, 1, 1, 1, 1,
0.8477528, -0.3736726, 3.114757, 1, 1, 1, 1, 1,
0.8507155, 0.6567987, 0.7073784, 1, 1, 1, 1, 1,
0.851328, 1.168684, -0.2903676, 1, 1, 1, 1, 1,
0.8570036, -0.02546108, 2.029435, 1, 1, 1, 1, 1,
0.863184, -0.2021977, 1.187815, 1, 1, 1, 1, 1,
0.8680891, 0.1511138, 0.2536434, 1, 1, 1, 1, 1,
0.8690175, 0.5095659, 1.12517, 1, 1, 1, 1, 1,
0.8698587, -0.2553175, 3.577752, 1, 1, 1, 1, 1,
0.8699995, 2.127335, -1.323102, 1, 1, 1, 1, 1,
0.8738816, 0.4435852, 1.234722, 1, 1, 1, 1, 1,
0.88106, -0.1159098, 1.770541, 0, 0, 1, 1, 1,
0.8842046, -1.100567, 3.033726, 1, 0, 0, 1, 1,
0.8999814, -0.4572453, 1.579033, 1, 0, 0, 1, 1,
0.9007314, -1.316074, 4.204397, 1, 0, 0, 1, 1,
0.9145942, 0.5915348, 0.7713775, 1, 0, 0, 1, 1,
0.9257677, 1.220857, -0.6324572, 1, 0, 0, 1, 1,
0.9264505, -0.7669456, 2.299817, 0, 0, 0, 1, 1,
0.9420913, -0.3978833, 0.6235425, 0, 0, 0, 1, 1,
0.9456109, 2.013515, 0.8087781, 0, 0, 0, 1, 1,
0.9497561, -0.2159445, 1.731827, 0, 0, 0, 1, 1,
0.9523395, 1.357729, -0.5273361, 0, 0, 0, 1, 1,
0.9530972, 0.6808586, 0.5669217, 0, 0, 0, 1, 1,
0.9545497, -0.8023381, 2.745348, 0, 0, 0, 1, 1,
0.9668793, 1.011085, 0.7394709, 1, 1, 1, 1, 1,
0.9690528, -0.2406109, 0.9705991, 1, 1, 1, 1, 1,
0.9721892, -1.410413, 1.306377, 1, 1, 1, 1, 1,
0.972643, -0.2040518, 0.6982636, 1, 1, 1, 1, 1,
0.9729075, 0.2111939, 0.1634491, 1, 1, 1, 1, 1,
0.9751002, -0.4283905, 3.109945, 1, 1, 1, 1, 1,
0.9770338, 0.6638216, 1.048187, 1, 1, 1, 1, 1,
0.9802054, -0.529026, 3.630601, 1, 1, 1, 1, 1,
0.9851925, -0.03169259, 1.616714, 1, 1, 1, 1, 1,
0.9974738, -0.6048235, 1.466851, 1, 1, 1, 1, 1,
0.9991953, 0.3019963, 1.693647, 1, 1, 1, 1, 1,
1.006404, 0.8615084, 1.277698, 1, 1, 1, 1, 1,
1.007913, 0.1391931, 2.830657, 1, 1, 1, 1, 1,
1.009812, 1.801118, -0.1981632, 1, 1, 1, 1, 1,
1.02063, 0.05531958, 0.8997146, 1, 1, 1, 1, 1,
1.022904, -0.1156374, 1.899746, 0, 0, 1, 1, 1,
1.039485, -1.242094, 0.749903, 1, 0, 0, 1, 1,
1.041111, 0.3115422, 1.245993, 1, 0, 0, 1, 1,
1.045611, 0.7437285, -0.4594054, 1, 0, 0, 1, 1,
1.056014, 0.3602625, 1.26504, 1, 0, 0, 1, 1,
1.057653, 1.51713, 1.495523, 1, 0, 0, 1, 1,
1.058946, 0.4073053, -0.941248, 0, 0, 0, 1, 1,
1.062446, 0.6524354, 0.9781626, 0, 0, 0, 1, 1,
1.066935, -0.3070897, 1.386798, 0, 0, 0, 1, 1,
1.068853, -0.2965103, 1.570553, 0, 0, 0, 1, 1,
1.06921, 1.041632, 1.303336, 0, 0, 0, 1, 1,
1.070032, 1.895285, 0.0436097, 0, 0, 0, 1, 1,
1.070222, -0.9521388, -0.4667239, 0, 0, 0, 1, 1,
1.072293, -0.6488338, 1.09978, 1, 1, 1, 1, 1,
1.072688, -1.320143, 2.999279, 1, 1, 1, 1, 1,
1.07319, -0.09833505, 1.138025, 1, 1, 1, 1, 1,
1.07959, -1.663824, 4.280748, 1, 1, 1, 1, 1,
1.080797, 0.4134819, 2.174434, 1, 1, 1, 1, 1,
1.089182, 0.7773823, 1.337733, 1, 1, 1, 1, 1,
1.092581, -0.1533004, 2.646482, 1, 1, 1, 1, 1,
1.092785, -1.029035, 0.6115655, 1, 1, 1, 1, 1,
1.095383, -0.2673436, 2.132874, 1, 1, 1, 1, 1,
1.101709, 0.764162, 0.3497182, 1, 1, 1, 1, 1,
1.102713, 0.4846757, 0.532667, 1, 1, 1, 1, 1,
1.115006, 0.8087608, 1.935344, 1, 1, 1, 1, 1,
1.129857, -0.1108621, 3.032111, 1, 1, 1, 1, 1,
1.131147, -1.098895, 2.705202, 1, 1, 1, 1, 1,
1.132198, 0.3936895, 1.813408, 1, 1, 1, 1, 1,
1.137122, 0.05002106, 0.5830722, 0, 0, 1, 1, 1,
1.138344, -0.1546797, 1.768093, 1, 0, 0, 1, 1,
1.14911, -0.0159116, 0.5835779, 1, 0, 0, 1, 1,
1.151148, 0.7479111, 0.4158396, 1, 0, 0, 1, 1,
1.164204, -0.1439992, 3.142465, 1, 0, 0, 1, 1,
1.182242, 2.865416, -0.5461528, 1, 0, 0, 1, 1,
1.1962, -1.137672, 2.608541, 0, 0, 0, 1, 1,
1.201294, 1.331692, 0.4265319, 0, 0, 0, 1, 1,
1.204393, 0.589178, 0.2616291, 0, 0, 0, 1, 1,
1.211828, 0.6340544, 2.495015, 0, 0, 0, 1, 1,
1.215664, -0.7185637, 1.656783, 0, 0, 0, 1, 1,
1.217408, -0.5413174, 1.32028, 0, 0, 0, 1, 1,
1.225717, 1.600393, 0.9201126, 0, 0, 0, 1, 1,
1.235675, 0.5652524, 3.070654, 1, 1, 1, 1, 1,
1.23761, -0.4568384, 0.1084706, 1, 1, 1, 1, 1,
1.247627, 0.8553962, 0.5122965, 1, 1, 1, 1, 1,
1.250283, -0.4691105, 1.08516, 1, 1, 1, 1, 1,
1.251481, 0.5105781, 1.468305, 1, 1, 1, 1, 1,
1.252963, -1.509167, 4.583055, 1, 1, 1, 1, 1,
1.266602, 1.090153, 1.087043, 1, 1, 1, 1, 1,
1.267861, 0.5819275, -0.5798719, 1, 1, 1, 1, 1,
1.272861, 1.303005, -1.512998, 1, 1, 1, 1, 1,
1.274078, -0.2372978, -0.2720361, 1, 1, 1, 1, 1,
1.282247, -0.8004532, 1.561685, 1, 1, 1, 1, 1,
1.283479, -0.4911978, 2.668381, 1, 1, 1, 1, 1,
1.288197, -0.1007542, 0.0314658, 1, 1, 1, 1, 1,
1.288595, 1.085585, 2.051045, 1, 1, 1, 1, 1,
1.299895, -0.7281598, 2.130848, 1, 1, 1, 1, 1,
1.300112, 0.7993782, 1.929111, 0, 0, 1, 1, 1,
1.305685, -0.2289232, 2.267656, 1, 0, 0, 1, 1,
1.308617, -1.656456, 3.606171, 1, 0, 0, 1, 1,
1.315069, -2.177826, 2.073001, 1, 0, 0, 1, 1,
1.319052, -0.005535161, 0.6518372, 1, 0, 0, 1, 1,
1.320285, 0.6417336, 1.60787, 1, 0, 0, 1, 1,
1.322242, 0.8932424, 0.2247778, 0, 0, 0, 1, 1,
1.325234, -0.285208, 1.736205, 0, 0, 0, 1, 1,
1.342595, -0.7557719, 1.673936, 0, 0, 0, 1, 1,
1.368201, 0.03791739, 1.188833, 0, 0, 0, 1, 1,
1.371082, -0.377916, 4.029206, 0, 0, 0, 1, 1,
1.37401, 0.5473516, 0.9075106, 0, 0, 0, 1, 1,
1.374112, 0.3425523, 0.7264416, 0, 0, 0, 1, 1,
1.387992, 0.5001348, 0.8132969, 1, 1, 1, 1, 1,
1.402339, 0.2106337, 1.982771, 1, 1, 1, 1, 1,
1.417965, 1.007928, 1.061718, 1, 1, 1, 1, 1,
1.419403, -1.123735, 1.824085, 1, 1, 1, 1, 1,
1.426188, 0.09669232, 0.7403712, 1, 1, 1, 1, 1,
1.428725, 1.537815, 0.7778866, 1, 1, 1, 1, 1,
1.436866, 1.058722, 0.6974483, 1, 1, 1, 1, 1,
1.445164, -0.2432035, 2.026612, 1, 1, 1, 1, 1,
1.446779, -0.01029284, 0.9647479, 1, 1, 1, 1, 1,
1.453953, 1.162892, 0.9144911, 1, 1, 1, 1, 1,
1.455569, 0.06116698, 0.467388, 1, 1, 1, 1, 1,
1.456965, -0.1560991, 2.26706, 1, 1, 1, 1, 1,
1.460281, -0.3668013, 2.468682, 1, 1, 1, 1, 1,
1.466442, -1.417802, 3.063612, 1, 1, 1, 1, 1,
1.470639, -1.531781, 4.990477, 1, 1, 1, 1, 1,
1.48497, -0.0420863, 2.011886, 0, 0, 1, 1, 1,
1.488897, -0.9919232, 2.135014, 1, 0, 0, 1, 1,
1.496974, 1.58918, 0.8493189, 1, 0, 0, 1, 1,
1.507795, -0.3828793, 2.111397, 1, 0, 0, 1, 1,
1.509027, 0.5869235, 2.110562, 1, 0, 0, 1, 1,
1.525984, -0.1136746, 1.635789, 1, 0, 0, 1, 1,
1.527473, 2.357385, 0.4094201, 0, 0, 0, 1, 1,
1.531081, 1.591035, 1.297899, 0, 0, 0, 1, 1,
1.551008, -1.116001, 0.320332, 0, 0, 0, 1, 1,
1.555708, 0.8224795, 1.722661, 0, 0, 0, 1, 1,
1.579058, 1.685304, 1.492472, 0, 0, 0, 1, 1,
1.593613, -1.089821, 2.986, 0, 0, 0, 1, 1,
1.611154, 0.3125837, 0.0456682, 0, 0, 0, 1, 1,
1.618098, 0.8315173, 0.6960378, 1, 1, 1, 1, 1,
1.627855, 1.41926, 0.8500134, 1, 1, 1, 1, 1,
1.638693, -1.213478, 2.311963, 1, 1, 1, 1, 1,
1.646797, 0.4896092, 2.634372, 1, 1, 1, 1, 1,
1.649445, 1.179329, 0.2197772, 1, 1, 1, 1, 1,
1.650747, 0.9963279, 0.5365064, 1, 1, 1, 1, 1,
1.660458, 2.678809, 0.3110335, 1, 1, 1, 1, 1,
1.672532, 1.20654, 0.2431522, 1, 1, 1, 1, 1,
1.674742, 0.6361561, 2.602739, 1, 1, 1, 1, 1,
1.677318, -0.9664677, 2.589537, 1, 1, 1, 1, 1,
1.688431, -0.3990217, 0.4971151, 1, 1, 1, 1, 1,
1.700513, -0.7419087, 1.817339, 1, 1, 1, 1, 1,
1.735342, 0.6093376, 1.320558, 1, 1, 1, 1, 1,
1.735888, 1.213539, 0.9027274, 1, 1, 1, 1, 1,
1.740466, 0.3995846, 0.02846163, 1, 1, 1, 1, 1,
1.749261, -0.4433647, 1.186902, 0, 0, 1, 1, 1,
1.749752, -2.05038, 4.157111, 1, 0, 0, 1, 1,
1.757517, -0.06048563, 0.4943317, 1, 0, 0, 1, 1,
1.783536, 0.5868405, 1.193599, 1, 0, 0, 1, 1,
1.784115, -0.5162786, 2.20576, 1, 0, 0, 1, 1,
1.785681, -0.6699893, -0.1441608, 1, 0, 0, 1, 1,
1.792666, 0.3238817, 0.2466457, 0, 0, 0, 1, 1,
1.793971, 1.152326, 1.712047, 0, 0, 0, 1, 1,
1.806613, -0.2231907, 0.6699422, 0, 0, 0, 1, 1,
1.818589, -0.2747512, 2.604297, 0, 0, 0, 1, 1,
1.841246, -2.766819, 2.356458, 0, 0, 0, 1, 1,
1.843496, -1.421774, 2.005422, 0, 0, 0, 1, 1,
1.863485, -0.2726344, 2.676152, 0, 0, 0, 1, 1,
1.869619, -0.8506888, 2.033337, 1, 1, 1, 1, 1,
1.87621, -0.1818163, -0.3550151, 1, 1, 1, 1, 1,
1.90743, 0.1849678, 2.482921, 1, 1, 1, 1, 1,
1.907809, 0.8890369, 2.405974, 1, 1, 1, 1, 1,
1.91497, 0.6797581, 1.4938, 1, 1, 1, 1, 1,
1.939783, 0.4028382, 2.913695, 1, 1, 1, 1, 1,
1.970049, -0.3248226, 2.053233, 1, 1, 1, 1, 1,
1.974196, 1.306513, 0.8146056, 1, 1, 1, 1, 1,
1.985116, 0.4056383, 2.709595, 1, 1, 1, 1, 1,
2.028549, -0.3345807, 1.164352, 1, 1, 1, 1, 1,
2.033805, -0.7562765, 2.592421, 1, 1, 1, 1, 1,
2.034714, -0.5477984, -0.3472751, 1, 1, 1, 1, 1,
2.069632, 1.203202, 1.401602, 1, 1, 1, 1, 1,
2.078885, -0.6137518, 1.333831, 1, 1, 1, 1, 1,
2.088353, -1.841269, 2.650277, 1, 1, 1, 1, 1,
2.111711, 1.058026, 1.592209, 0, 0, 1, 1, 1,
2.117009, -2.928596, 1.714997, 1, 0, 0, 1, 1,
2.153059, -0.7069595, 2.334925, 1, 0, 0, 1, 1,
2.163487, 1.084532, 2.534592, 1, 0, 0, 1, 1,
2.185669, -1.119625, 0.9019098, 1, 0, 0, 1, 1,
2.206472, 0.6755171, 0.3009888, 1, 0, 0, 1, 1,
2.274923, 1.397271, 1.876646, 0, 0, 0, 1, 1,
2.279037, -1.583161, 1.876824, 0, 0, 0, 1, 1,
2.320379, 1.507473, 0.1887447, 0, 0, 0, 1, 1,
2.324637, -1.042421, 1.116184, 0, 0, 0, 1, 1,
2.33182, 0.1241628, 0.6594338, 0, 0, 0, 1, 1,
2.344043, -1.661324, 1.746638, 0, 0, 0, 1, 1,
2.416165, 0.4347551, 1.358875, 0, 0, 0, 1, 1,
2.425369, -0.8621159, 1.276894, 1, 1, 1, 1, 1,
2.51863, -0.7160097, 3.389398, 1, 1, 1, 1, 1,
2.546894, 0.08686257, 1.92704, 1, 1, 1, 1, 1,
2.612713, 0.3806443, 1.756444, 1, 1, 1, 1, 1,
2.753871, 2.150814, 0.06352547, 1, 1, 1, 1, 1,
2.837074, -0.423548, 2.102732, 1, 1, 1, 1, 1,
2.855433, -0.3261074, 1.85745, 1, 1, 1, 1, 1
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
var radius = 9.885577;
var distance = 34.72267;
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
mvMatrix.translate( 0.1141808, 0.2121984, -0.4219799 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72267);
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
