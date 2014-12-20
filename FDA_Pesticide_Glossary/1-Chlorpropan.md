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
-3.669543, -0.002309276, -2.033026, 1, 0, 0, 1,
-3.164425, -1.480467, -1.539336, 1, 0.007843138, 0, 1,
-2.823959, -1.529161, -1.967022, 1, 0.01176471, 0, 1,
-2.809434, -0.8119463, -1.525511, 1, 0.01960784, 0, 1,
-2.658897, -1.077727, -1.749064, 1, 0.02352941, 0, 1,
-2.572026, -0.2133622, -1.600863, 1, 0.03137255, 0, 1,
-2.551702, -0.658976, -1.781255, 1, 0.03529412, 0, 1,
-2.531303, -0.3475933, -0.5181172, 1, 0.04313726, 0, 1,
-2.521286, 0.2436789, -1.224151, 1, 0.04705882, 0, 1,
-2.472633, -2.000558, -1.821572, 1, 0.05490196, 0, 1,
-2.469824, -0.3470669, -2.094553, 1, 0.05882353, 0, 1,
-2.434442, 0.59969, -1.92174, 1, 0.06666667, 0, 1,
-2.39645, -0.6879395, -2.570187, 1, 0.07058824, 0, 1,
-2.345067, -0.4499081, -2.126647, 1, 0.07843138, 0, 1,
-2.267279, 0.8884741, -3.031329, 1, 0.08235294, 0, 1,
-2.248556, 0.6311889, -2.032199, 1, 0.09019608, 0, 1,
-2.227902, -0.7600633, -0.9137874, 1, 0.09411765, 0, 1,
-2.206903, 0.2264567, -1.35189, 1, 0.1019608, 0, 1,
-2.183556, 0.8747242, -0.5752791, 1, 0.1098039, 0, 1,
-2.155661, 0.2925508, -1.70659, 1, 0.1137255, 0, 1,
-2.155259, 0.7477393, -1.228587, 1, 0.1215686, 0, 1,
-2.145453, -0.3907124, -2.574405, 1, 0.1254902, 0, 1,
-2.07115, 0.4576469, -2.497815, 1, 0.1333333, 0, 1,
-2.03045, -0.4789376, -1.565985, 1, 0.1372549, 0, 1,
-2.019303, -0.7863083, -0.8618217, 1, 0.145098, 0, 1,
-1.969101, -0.6367337, -1.663952, 1, 0.1490196, 0, 1,
-1.968402, -2.203014, -2.15384, 1, 0.1568628, 0, 1,
-1.963398, -0.6263484, -2.530481, 1, 0.1607843, 0, 1,
-1.951424, -0.7833183, -0.8461212, 1, 0.1686275, 0, 1,
-1.949876, 1.706677, 0.6098293, 1, 0.172549, 0, 1,
-1.94784, -0.05338356, -2.268931, 1, 0.1803922, 0, 1,
-1.929636, 0.5793688, -1.259236, 1, 0.1843137, 0, 1,
-1.926684, 0.475551, -1.375762, 1, 0.1921569, 0, 1,
-1.913877, -1.627646, -2.535578, 1, 0.1960784, 0, 1,
-1.908103, 2.432252, 0.2039407, 1, 0.2039216, 0, 1,
-1.905256, -1.506526, -1.100888, 1, 0.2117647, 0, 1,
-1.889762, 1.132746, -3.712031, 1, 0.2156863, 0, 1,
-1.853827, 0.2416144, -1.156211, 1, 0.2235294, 0, 1,
-1.844945, 1.077569, -1.199575, 1, 0.227451, 0, 1,
-1.8433, -1.359575, -1.05908, 1, 0.2352941, 0, 1,
-1.840822, -0.4219783, -2.312666, 1, 0.2392157, 0, 1,
-1.830052, 0.2655983, -0.2526338, 1, 0.2470588, 0, 1,
-1.792108, 0.01954829, 1.809651, 1, 0.2509804, 0, 1,
-1.791086, -0.7173582, -2.044848, 1, 0.2588235, 0, 1,
-1.757267, -0.5257471, -3.369112, 1, 0.2627451, 0, 1,
-1.733591, 0.1727857, -1.084564, 1, 0.2705882, 0, 1,
-1.7212, 0.1033284, -2.152955, 1, 0.2745098, 0, 1,
-1.703346, -0.150468, -1.048253, 1, 0.282353, 0, 1,
-1.689874, -1.091192, -1.564029, 1, 0.2862745, 0, 1,
-1.689674, -0.3371816, -2.342009, 1, 0.2941177, 0, 1,
-1.682306, -1.314513, 0.03019354, 1, 0.3019608, 0, 1,
-1.67303, 0.4120902, -2.041182, 1, 0.3058824, 0, 1,
-1.654738, -0.7554364, -3.790474, 1, 0.3137255, 0, 1,
-1.651592, -2.396493, -1.916167, 1, 0.3176471, 0, 1,
-1.642726, 1.415513, -0.4839694, 1, 0.3254902, 0, 1,
-1.605612, 1.120795, -0.2948139, 1, 0.3294118, 0, 1,
-1.605414, -0.8913292, 0.01486374, 1, 0.3372549, 0, 1,
-1.587604, -0.7855753, -2.401682, 1, 0.3411765, 0, 1,
-1.57537, 0.2893972, -0.9715832, 1, 0.3490196, 0, 1,
-1.571526, -0.1581201, -1.174597, 1, 0.3529412, 0, 1,
-1.563831, -0.9731503, -3.1729, 1, 0.3607843, 0, 1,
-1.562178, -0.1369607, -0.7404388, 1, 0.3647059, 0, 1,
-1.548878, 0.214923, -1.573336, 1, 0.372549, 0, 1,
-1.548737, 1.04232, -0.9952152, 1, 0.3764706, 0, 1,
-1.538652, -0.4364943, -2.962186, 1, 0.3843137, 0, 1,
-1.52574, 0.6749347, -0.9150722, 1, 0.3882353, 0, 1,
-1.488364, -0.7896943, -1.815123, 1, 0.3960784, 0, 1,
-1.482119, 0.6224421, -1.560313, 1, 0.4039216, 0, 1,
-1.478297, -1.763602, -2.731017, 1, 0.4078431, 0, 1,
-1.467776, 0.3584195, -1.414381, 1, 0.4156863, 0, 1,
-1.455067, 2.279908, -1.500261, 1, 0.4196078, 0, 1,
-1.446552, 1.663506, -1.677906, 1, 0.427451, 0, 1,
-1.441981, -0.3139273, -2.226921, 1, 0.4313726, 0, 1,
-1.440316, 0.5104849, -3.254632, 1, 0.4392157, 0, 1,
-1.440115, 0.3020917, -1.817396, 1, 0.4431373, 0, 1,
-1.437389, -0.6858542, -2.425691, 1, 0.4509804, 0, 1,
-1.43405, 1.384157, -2.594934, 1, 0.454902, 0, 1,
-1.414905, -0.6145301, -3.589651, 1, 0.4627451, 0, 1,
-1.40995, -1.192888, -3.635108, 1, 0.4666667, 0, 1,
-1.408496, 0.3262261, -1.243084, 1, 0.4745098, 0, 1,
-1.39546, -1.345152, -2.125329, 1, 0.4784314, 0, 1,
-1.39244, -0.8670825, -2.789361, 1, 0.4862745, 0, 1,
-1.389032, -1.544378, -3.054609, 1, 0.4901961, 0, 1,
-1.388967, 1.402358, -2.350872, 1, 0.4980392, 0, 1,
-1.381179, 1.382932, 0.05598559, 1, 0.5058824, 0, 1,
-1.380399, -0.2663947, -2.652944, 1, 0.509804, 0, 1,
-1.366004, -0.9408549, -2.616961, 1, 0.5176471, 0, 1,
-1.331257, -0.3149445, -2.058847, 1, 0.5215687, 0, 1,
-1.330939, -0.8790063, -2.476833, 1, 0.5294118, 0, 1,
-1.329947, 0.03944783, -1.820049, 1, 0.5333334, 0, 1,
-1.324898, 0.5144044, -2.574563, 1, 0.5411765, 0, 1,
-1.311578, 1.332769, -1.715428, 1, 0.5450981, 0, 1,
-1.307818, -0.07768374, -1.585447, 1, 0.5529412, 0, 1,
-1.307371, 0.2109319, -1.568729, 1, 0.5568628, 0, 1,
-1.306004, -1.278974, -1.973543, 1, 0.5647059, 0, 1,
-1.303432, -0.5143683, -1.677263, 1, 0.5686275, 0, 1,
-1.300007, 0.5271705, -0.9138817, 1, 0.5764706, 0, 1,
-1.296445, 0.5509478, -0.5740218, 1, 0.5803922, 0, 1,
-1.271473, 0.05817724, -0.8402348, 1, 0.5882353, 0, 1,
-1.263829, 0.1846325, -1.858208, 1, 0.5921569, 0, 1,
-1.260172, -0.007841773, -2.482091, 1, 0.6, 0, 1,
-1.25265, 0.6474161, -0.7058672, 1, 0.6078432, 0, 1,
-1.233889, 0.20645, -2.32444, 1, 0.6117647, 0, 1,
-1.233558, 0.5287172, -0.9885681, 1, 0.6196079, 0, 1,
-1.229668, -1.827247, -1.779596, 1, 0.6235294, 0, 1,
-1.229637, -0.1857565, -2.526326, 1, 0.6313726, 0, 1,
-1.229005, 2.37161, 0.3569246, 1, 0.6352941, 0, 1,
-1.228683, 0.2659538, -2.350263, 1, 0.6431373, 0, 1,
-1.227548, -0.4159816, -1.880304, 1, 0.6470588, 0, 1,
-1.227053, -0.5946022, -0.9044195, 1, 0.654902, 0, 1,
-1.226696, 1.123346, -0.8179705, 1, 0.6588235, 0, 1,
-1.222754, -0.94223, -1.32329, 1, 0.6666667, 0, 1,
-1.220824, 0.2105865, -0.6996795, 1, 0.6705883, 0, 1,
-1.21724, 0.9512701, -0.6575014, 1, 0.6784314, 0, 1,
-1.212967, 1.176886, -2.603668, 1, 0.682353, 0, 1,
-1.198492, 0.3074418, -0.8554105, 1, 0.6901961, 0, 1,
-1.184083, -2.604244, -3.570188, 1, 0.6941177, 0, 1,
-1.155512, 0.8673338, 0.7917948, 1, 0.7019608, 0, 1,
-1.154064, 0.2037535, -0.716253, 1, 0.7098039, 0, 1,
-1.153916, -1.630016, -2.765786, 1, 0.7137255, 0, 1,
-1.151506, 1.053277, -0.5699465, 1, 0.7215686, 0, 1,
-1.148902, -0.6710212, -2.959508, 1, 0.7254902, 0, 1,
-1.125062, 0.1573587, -1.136233, 1, 0.7333333, 0, 1,
-1.123714, 0.1264169, -2.039036, 1, 0.7372549, 0, 1,
-1.107837, 0.5786417, -2.106233, 1, 0.7450981, 0, 1,
-1.104856, 0.2332359, -1.282562, 1, 0.7490196, 0, 1,
-1.100743, -0.8380617, -1.454083, 1, 0.7568628, 0, 1,
-1.098287, -0.1592361, -1.484693, 1, 0.7607843, 0, 1,
-1.09508, 0.2749491, -1.594196, 1, 0.7686275, 0, 1,
-1.083457, -0.352422, -1.986433, 1, 0.772549, 0, 1,
-1.074138, -2.469831, -1.037632, 1, 0.7803922, 0, 1,
-1.069701, -0.03624678, -2.376989, 1, 0.7843137, 0, 1,
-1.067069, -1.277736, -3.448996, 1, 0.7921569, 0, 1,
-1.060031, 0.6466448, -0.766112, 1, 0.7960784, 0, 1,
-1.05557, 0.2754333, -1.99465, 1, 0.8039216, 0, 1,
-1.054306, 1.476581, -0.6104276, 1, 0.8117647, 0, 1,
-1.042897, -1.44397, -2.736264, 1, 0.8156863, 0, 1,
-1.040097, -1.451896, -1.002397, 1, 0.8235294, 0, 1,
-1.029349, -0.6945428, -0.7412488, 1, 0.827451, 0, 1,
-1.028387, -1.298582, -1.48055, 1, 0.8352941, 0, 1,
-1.024283, 0.6679465, -1.357233, 1, 0.8392157, 0, 1,
-1.012161, 1.869426, 0.6226882, 1, 0.8470588, 0, 1,
-1.012074, -0.3789788, -0.5909305, 1, 0.8509804, 0, 1,
-1.011165, 2.259456, -0.459655, 1, 0.8588235, 0, 1,
-1.009412, 0.4237191, -0.5872737, 1, 0.8627451, 0, 1,
-1.002188, -0.2600018, -2.455843, 1, 0.8705882, 0, 1,
-1.001517, -2.825829, -1.654734, 1, 0.8745098, 0, 1,
-0.9898294, -2.505887, -1.548469, 1, 0.8823529, 0, 1,
-0.9817384, -0.2162808, 1.450612, 1, 0.8862745, 0, 1,
-0.9817037, 1.157894, 0.2759604, 1, 0.8941177, 0, 1,
-0.9775112, -0.4301922, -0.9999315, 1, 0.8980392, 0, 1,
-0.977192, -1.904761, -3.823682, 1, 0.9058824, 0, 1,
-0.9692389, 0.4669346, -3.780187, 1, 0.9137255, 0, 1,
-0.9659214, -0.09244745, -2.943109, 1, 0.9176471, 0, 1,
-0.959836, -1.18269, -2.557224, 1, 0.9254902, 0, 1,
-0.9587148, -1.383925, -1.030664, 1, 0.9294118, 0, 1,
-0.9563127, 0.6631395, 0.1835437, 1, 0.9372549, 0, 1,
-0.9545566, -0.5038301, -3.590049, 1, 0.9411765, 0, 1,
-0.9504656, 1.422893, -2.03661, 1, 0.9490196, 0, 1,
-0.9503343, 0.4426208, -3.524386, 1, 0.9529412, 0, 1,
-0.9487888, -1.406187, -2.664545, 1, 0.9607843, 0, 1,
-0.9467874, 0.5297089, -1.472603, 1, 0.9647059, 0, 1,
-0.9466028, 1.111647, -1.365869, 1, 0.972549, 0, 1,
-0.9437132, 1.4957, -0.6609178, 1, 0.9764706, 0, 1,
-0.9428326, 1.520656, 0.287308, 1, 0.9843137, 0, 1,
-0.9404334, -0.3460806, -1.62277, 1, 0.9882353, 0, 1,
-0.9390287, -0.8818647, -3.348305, 1, 0.9960784, 0, 1,
-0.936309, -0.3309388, -1.691451, 0.9960784, 1, 0, 1,
-0.936071, 2.483882, -1.585461, 0.9921569, 1, 0, 1,
-0.9356823, -2.143535, -1.056632, 0.9843137, 1, 0, 1,
-0.9301736, 0.03334698, -2.760419, 0.9803922, 1, 0, 1,
-0.9293057, -2.254576, -2.269955, 0.972549, 1, 0, 1,
-0.925562, 0.04404122, -1.639193, 0.9686275, 1, 0, 1,
-0.9237435, -2.266362, -2.971847, 0.9607843, 1, 0, 1,
-0.9186885, 0.4557807, -1.906937, 0.9568627, 1, 0, 1,
-0.9153159, -1.399505, 0.2131442, 0.9490196, 1, 0, 1,
-0.9110674, -0.865196, -2.044524, 0.945098, 1, 0, 1,
-0.9049759, 0.5797395, -1.997488, 0.9372549, 1, 0, 1,
-0.8912237, 0.4533337, -2.307766, 0.9333333, 1, 0, 1,
-0.8905372, -1.371445, -2.651314, 0.9254902, 1, 0, 1,
-0.8879575, 0.4253888, 0.4142167, 0.9215686, 1, 0, 1,
-0.8753986, -1.254784, -2.196686, 0.9137255, 1, 0, 1,
-0.8668287, -0.1538558, -2.205824, 0.9098039, 1, 0, 1,
-0.8654464, 0.09223495, -0.4807151, 0.9019608, 1, 0, 1,
-0.8565226, 0.7410398, -1.62846, 0.8941177, 1, 0, 1,
-0.8515774, 0.507892, -0.2459712, 0.8901961, 1, 0, 1,
-0.8505384, -0.1323364, -1.444136, 0.8823529, 1, 0, 1,
-0.8461437, 1.622253, -0.09306109, 0.8784314, 1, 0, 1,
-0.8401695, 0.6969053, -0.985625, 0.8705882, 1, 0, 1,
-0.8360094, -1.949433, -3.556703, 0.8666667, 1, 0, 1,
-0.8317906, 0.5214846, -2.335302, 0.8588235, 1, 0, 1,
-0.8242968, 0.2977843, -2.873494, 0.854902, 1, 0, 1,
-0.8238199, 0.7394853, -0.3894665, 0.8470588, 1, 0, 1,
-0.8094574, -1.187759, -2.495264, 0.8431373, 1, 0, 1,
-0.8078572, -0.2280377, -0.1551682, 0.8352941, 1, 0, 1,
-0.788236, 1.568593, -0.6769885, 0.8313726, 1, 0, 1,
-0.7872221, -2.38774, -3.688712, 0.8235294, 1, 0, 1,
-0.786847, 0.4851286, -1.105781, 0.8196079, 1, 0, 1,
-0.7868357, 0.879696, -2.090551, 0.8117647, 1, 0, 1,
-0.785806, 0.8321538, -0.2436562, 0.8078431, 1, 0, 1,
-0.7829961, -0.3423664, -3.457052, 0.8, 1, 0, 1,
-0.7777701, -0.4866148, -1.807636, 0.7921569, 1, 0, 1,
-0.7701842, 1.023646, -1.023521, 0.7882353, 1, 0, 1,
-0.7674366, 0.7887329, -1.077297, 0.7803922, 1, 0, 1,
-0.7626923, -0.2257362, -2.635377, 0.7764706, 1, 0, 1,
-0.7601774, 0.2467778, -0.8925362, 0.7686275, 1, 0, 1,
-0.7553458, -0.2936797, -3.087455, 0.7647059, 1, 0, 1,
-0.7536763, -0.5063499, -2.487465, 0.7568628, 1, 0, 1,
-0.7494481, 0.2400289, -0.9229901, 0.7529412, 1, 0, 1,
-0.7414122, 1.288766, 0.6871496, 0.7450981, 1, 0, 1,
-0.736175, -0.4925726, -3.015031, 0.7411765, 1, 0, 1,
-0.732781, -0.7689701, -2.008083, 0.7333333, 1, 0, 1,
-0.7322948, -0.3768681, -2.418108, 0.7294118, 1, 0, 1,
-0.731836, -0.232039, -1.47889, 0.7215686, 1, 0, 1,
-0.7299571, 0.9782425, 0.2113196, 0.7176471, 1, 0, 1,
-0.7283357, -0.3324203, -2.007817, 0.7098039, 1, 0, 1,
-0.7281246, -0.2868347, -3.513872, 0.7058824, 1, 0, 1,
-0.7189713, 0.8963047, -0.4089333, 0.6980392, 1, 0, 1,
-0.7152476, 0.4465054, 1.024615, 0.6901961, 1, 0, 1,
-0.7147322, -0.6158726, -2.458224, 0.6862745, 1, 0, 1,
-0.6990804, -0.7630554, -3.488565, 0.6784314, 1, 0, 1,
-0.6946857, -0.891655, -5.025377, 0.6745098, 1, 0, 1,
-0.683764, -1.221035, -4.321802, 0.6666667, 1, 0, 1,
-0.6792588, 1.01543, 0.5606374, 0.6627451, 1, 0, 1,
-0.6776248, -0.6122956, -1.456294, 0.654902, 1, 0, 1,
-0.6754912, -1.413203, -1.759285, 0.6509804, 1, 0, 1,
-0.6669681, -1.697153, -2.903744, 0.6431373, 1, 0, 1,
-0.6656994, -0.3438293, -1.174824, 0.6392157, 1, 0, 1,
-0.6647525, -0.1389894, -1.373708, 0.6313726, 1, 0, 1,
-0.6634063, 0.9811416, -1.56228, 0.627451, 1, 0, 1,
-0.6616879, -0.5411937, -2.908692, 0.6196079, 1, 0, 1,
-0.6599201, 0.2663001, -0.8749422, 0.6156863, 1, 0, 1,
-0.6525081, 1.383379, 0.1846104, 0.6078432, 1, 0, 1,
-0.6517529, 0.2710559, 0.5807908, 0.6039216, 1, 0, 1,
-0.6496032, -0.8235343, -2.745805, 0.5960785, 1, 0, 1,
-0.6430765, -1.614654, -2.669939, 0.5882353, 1, 0, 1,
-0.6402453, 1.527066, 0.687951, 0.5843138, 1, 0, 1,
-0.6385747, 0.199379, -3.171982, 0.5764706, 1, 0, 1,
-0.6378585, 2.485909, -1.944321, 0.572549, 1, 0, 1,
-0.6338621, 1.310825, -0.4814556, 0.5647059, 1, 0, 1,
-0.6324106, 0.4943471, -1.117929, 0.5607843, 1, 0, 1,
-0.6317548, 1.433668, -0.7329605, 0.5529412, 1, 0, 1,
-0.6312727, -1.794255, -3.35576, 0.5490196, 1, 0, 1,
-0.6266784, -0.3530108, -3.087378, 0.5411765, 1, 0, 1,
-0.6245511, -0.1186266, -2.883123, 0.5372549, 1, 0, 1,
-0.6234857, 1.002348, -0.8815545, 0.5294118, 1, 0, 1,
-0.6201566, 1.571526, 0.398169, 0.5254902, 1, 0, 1,
-0.620063, 0.03256562, -1.237122, 0.5176471, 1, 0, 1,
-0.619455, -1.410984, -2.737392, 0.5137255, 1, 0, 1,
-0.6066249, -1.365142, -4.009121, 0.5058824, 1, 0, 1,
-0.6047514, -0.2162285, -1.596082, 0.5019608, 1, 0, 1,
-0.6021578, -1.852562, -1.949951, 0.4941176, 1, 0, 1,
-0.6008131, 0.7817883, 0.6110123, 0.4862745, 1, 0, 1,
-0.5982587, -1.860921, -3.886979, 0.4823529, 1, 0, 1,
-0.5958718, 1.820272, 0.2247891, 0.4745098, 1, 0, 1,
-0.5951383, 0.5138064, -0.9625766, 0.4705882, 1, 0, 1,
-0.5843154, 0.8989685, -1.228488, 0.4627451, 1, 0, 1,
-0.5835426, 0.7670773, -1.377626, 0.4588235, 1, 0, 1,
-0.581747, 0.4073597, -1.410768, 0.4509804, 1, 0, 1,
-0.5810022, -0.9955618, -1.764156, 0.4470588, 1, 0, 1,
-0.5800334, -0.009100878, -3.099263, 0.4392157, 1, 0, 1,
-0.5785319, -2.346975, -4.28142, 0.4352941, 1, 0, 1,
-0.5780029, -0.8202634, -1.244605, 0.427451, 1, 0, 1,
-0.5672846, -1.930463, -3.231133, 0.4235294, 1, 0, 1,
-0.5671118, -0.04265524, -0.1684196, 0.4156863, 1, 0, 1,
-0.5652475, 0.7312828, -0.7975304, 0.4117647, 1, 0, 1,
-0.5643656, 0.444138, -1.344419, 0.4039216, 1, 0, 1,
-0.5615482, -1.025547, -1.996166, 0.3960784, 1, 0, 1,
-0.5595868, 1.039501, -0.4249623, 0.3921569, 1, 0, 1,
-0.5549762, 1.066298, -1.605198, 0.3843137, 1, 0, 1,
-0.5546103, 0.05755146, -1.749753, 0.3803922, 1, 0, 1,
-0.554451, 0.49855, -0.2318553, 0.372549, 1, 0, 1,
-0.552693, -0.9783705, -1.138377, 0.3686275, 1, 0, 1,
-0.5512307, 0.2122618, -1.084876, 0.3607843, 1, 0, 1,
-0.5504417, 1.38186, 0.3033673, 0.3568628, 1, 0, 1,
-0.5486507, -2.086592, -1.676843, 0.3490196, 1, 0, 1,
-0.5483086, -2.943488, -0.9980474, 0.345098, 1, 0, 1,
-0.5458566, 0.9285637, -0.2081829, 0.3372549, 1, 0, 1,
-0.5451287, 0.5170593, -1.101246, 0.3333333, 1, 0, 1,
-0.5445567, -0.7946929, -3.151072, 0.3254902, 1, 0, 1,
-0.5445054, -0.9105462, -4.05107, 0.3215686, 1, 0, 1,
-0.5436656, -0.7880353, -2.041653, 0.3137255, 1, 0, 1,
-0.5408171, -0.123229, -2.151606, 0.3098039, 1, 0, 1,
-0.5407798, 1.102463, -0.2971758, 0.3019608, 1, 0, 1,
-0.5387504, 0.1683246, -0.7907951, 0.2941177, 1, 0, 1,
-0.5247459, -0.25275, -2.140706, 0.2901961, 1, 0, 1,
-0.5238784, 1.22972, -0.8779545, 0.282353, 1, 0, 1,
-0.5184548, -0.4603567, -1.936381, 0.2784314, 1, 0, 1,
-0.5174949, 1.484702, 0.76556, 0.2705882, 1, 0, 1,
-0.5143041, 0.02903451, -0.8486914, 0.2666667, 1, 0, 1,
-0.5133223, 0.5698875, -1.133141, 0.2588235, 1, 0, 1,
-0.5125245, 0.4525662, -1.470393, 0.254902, 1, 0, 1,
-0.5116407, -0.551065, -1.554748, 0.2470588, 1, 0, 1,
-0.5113321, -0.2898418, -3.057232, 0.2431373, 1, 0, 1,
-0.5100303, -0.5519632, -4.393592, 0.2352941, 1, 0, 1,
-0.5065649, -0.8961675, -2.434502, 0.2313726, 1, 0, 1,
-0.5060722, -0.8811919, -1.536325, 0.2235294, 1, 0, 1,
-0.5053988, 0.2076394, -1.72666, 0.2196078, 1, 0, 1,
-0.4971023, 0.4479782, 0.9152994, 0.2117647, 1, 0, 1,
-0.4956137, -2.149514, -4.689255, 0.2078431, 1, 0, 1,
-0.4890938, 1.410361, -0.47608, 0.2, 1, 0, 1,
-0.4853227, -0.2463834, -1.362549, 0.1921569, 1, 0, 1,
-0.4837197, 0.5858501, 0.8344621, 0.1882353, 1, 0, 1,
-0.4833527, 0.118534, -1.838084, 0.1803922, 1, 0, 1,
-0.4833438, -1.970196, -2.597053, 0.1764706, 1, 0, 1,
-0.4796797, 0.940544, -0.594139, 0.1686275, 1, 0, 1,
-0.4716373, 0.903941, 0.6038116, 0.1647059, 1, 0, 1,
-0.4711428, -0.5384762, -1.58038, 0.1568628, 1, 0, 1,
-0.4702762, 0.5671039, -0.05783479, 0.1529412, 1, 0, 1,
-0.4567634, -0.3729495, -0.6348855, 0.145098, 1, 0, 1,
-0.4492269, -1.414, -1.816406, 0.1411765, 1, 0, 1,
-0.4478885, 0.5005735, -2.825066, 0.1333333, 1, 0, 1,
-0.4467256, -0.6646582, -2.425457, 0.1294118, 1, 0, 1,
-0.4418874, -0.2248652, -1.303429, 0.1215686, 1, 0, 1,
-0.4417289, -0.0658756, -1.80398, 0.1176471, 1, 0, 1,
-0.4402164, 0.5318343, -0.8916841, 0.1098039, 1, 0, 1,
-0.4384933, 0.2392245, -2.444228, 0.1058824, 1, 0, 1,
-0.4363893, -1.664541, -3.006488, 0.09803922, 1, 0, 1,
-0.4356883, 0.7260271, -1.750142, 0.09019608, 1, 0, 1,
-0.43417, 1.43856, -0.5159486, 0.08627451, 1, 0, 1,
-0.4296621, -0.07622232, -0.956499, 0.07843138, 1, 0, 1,
-0.4282892, -1.951286, -2.768853, 0.07450981, 1, 0, 1,
-0.4267981, 1.332196, -1.042367, 0.06666667, 1, 0, 1,
-0.4266424, -0.1371162, -2.704534, 0.0627451, 1, 0, 1,
-0.4256832, -0.307649, -2.011725, 0.05490196, 1, 0, 1,
-0.4241551, 0.3402313, -1.635667, 0.05098039, 1, 0, 1,
-0.4234064, 0.6749324, -1.355365, 0.04313726, 1, 0, 1,
-0.4212744, -0.4727357, -5.680803, 0.03921569, 1, 0, 1,
-0.4163609, 0.0374213, -1.16045, 0.03137255, 1, 0, 1,
-0.4145312, 1.354235, -1.488533, 0.02745098, 1, 0, 1,
-0.4095883, -0.2086335, -2.880846, 0.01960784, 1, 0, 1,
-0.407936, 0.08268307, -2.005254, 0.01568628, 1, 0, 1,
-0.4067927, -0.7868662, -3.780283, 0.007843138, 1, 0, 1,
-0.4053162, -0.8592538, -1.854498, 0.003921569, 1, 0, 1,
-0.403918, -0.913597, -3.85893, 0, 1, 0.003921569, 1,
-0.4036826, -1.022871, -1.580339, 0, 1, 0.01176471, 1,
-0.4031506, 1.872117, -1.502016, 0, 1, 0.01568628, 1,
-0.4013233, -0.5177779, -2.908394, 0, 1, 0.02352941, 1,
-0.4007748, 0.8895413, 0.3890619, 0, 1, 0.02745098, 1,
-0.394837, -0.4208684, -2.144105, 0, 1, 0.03529412, 1,
-0.3935162, -1.135434, -2.776202, 0, 1, 0.03921569, 1,
-0.3929296, -2.031, -3.607674, 0, 1, 0.04705882, 1,
-0.3897633, 0.3888976, -0.1285176, 0, 1, 0.05098039, 1,
-0.3884275, 0.5300996, -0.9259337, 0, 1, 0.05882353, 1,
-0.3791692, 0.3289405, -0.5045776, 0, 1, 0.0627451, 1,
-0.37522, -0.3695235, -1.183009, 0, 1, 0.07058824, 1,
-0.3729106, -1.437392, -3.641491, 0, 1, 0.07450981, 1,
-0.3708878, 1.261237, -1.638111, 0, 1, 0.08235294, 1,
-0.3677927, -1.19447, -4.1261, 0, 1, 0.08627451, 1,
-0.3619899, -1.071939, -4.433593, 0, 1, 0.09411765, 1,
-0.3602524, -0.3731319, -1.89964, 0, 1, 0.1019608, 1,
-0.3599944, 0.6835883, -0.6450164, 0, 1, 0.1058824, 1,
-0.3584628, -0.7945473, -1.755769, 0, 1, 0.1137255, 1,
-0.3582916, 1.467852, -1.089401, 0, 1, 0.1176471, 1,
-0.3531941, 0.6801322, 0.1512822, 0, 1, 0.1254902, 1,
-0.3529781, -0.1554099, -2.697, 0, 1, 0.1294118, 1,
-0.3502385, -1.00319, -1.980446, 0, 1, 0.1372549, 1,
-0.3478713, 0.09653921, -0.9076813, 0, 1, 0.1411765, 1,
-0.3427911, 0.6335304, 0.7779239, 0, 1, 0.1490196, 1,
-0.3410858, -1.021481, -3.805467, 0, 1, 0.1529412, 1,
-0.3395051, 0.1081896, -2.132766, 0, 1, 0.1607843, 1,
-0.338952, 0.1181382, -0.6137246, 0, 1, 0.1647059, 1,
-0.338869, -0.8718159, -2.141838, 0, 1, 0.172549, 1,
-0.3356288, -0.3683704, -1.688827, 0, 1, 0.1764706, 1,
-0.3273881, 0.6239545, -0.1585648, 0, 1, 0.1843137, 1,
-0.3233012, 1.247653, 1.157846, 0, 1, 0.1882353, 1,
-0.319916, 0.08801622, -1.384403, 0, 1, 0.1960784, 1,
-0.3175867, 0.07500076, 1.024378, 0, 1, 0.2039216, 1,
-0.3159632, -0.06168402, -2.794138, 0, 1, 0.2078431, 1,
-0.3090756, -2.389144, -1.410715, 0, 1, 0.2156863, 1,
-0.308296, -0.1658039, -2.629828, 0, 1, 0.2196078, 1,
-0.3068492, -2.179097, -1.826233, 0, 1, 0.227451, 1,
-0.3038188, -0.3396358, -2.592003, 0, 1, 0.2313726, 1,
-0.3025043, 0.887517, -0.6175238, 0, 1, 0.2392157, 1,
-0.3023093, -0.3983103, -2.814732, 0, 1, 0.2431373, 1,
-0.2983704, -1.743797, -3.567319, 0, 1, 0.2509804, 1,
-0.2936126, -0.5027367, -3.113085, 0, 1, 0.254902, 1,
-0.2934896, 1.003443, 0.4211014, 0, 1, 0.2627451, 1,
-0.2913061, -0.297543, -2.659861, 0, 1, 0.2666667, 1,
-0.2895546, -0.83817, -2.755028, 0, 1, 0.2745098, 1,
-0.288139, -0.1480065, -1.418263, 0, 1, 0.2784314, 1,
-0.2871981, -0.487782, -3.220109, 0, 1, 0.2862745, 1,
-0.2864701, -0.6670456, -3.008421, 0, 1, 0.2901961, 1,
-0.2859298, 1.630084, 0.3660995, 0, 1, 0.2980392, 1,
-0.2844241, 0.3172511, 0.3813045, 0, 1, 0.3058824, 1,
-0.2815147, -0.140158, -1.289549, 0, 1, 0.3098039, 1,
-0.2744323, 0.29864, -0.1132608, 0, 1, 0.3176471, 1,
-0.2740158, -0.4963288, -3.37324, 0, 1, 0.3215686, 1,
-0.2730749, 0.4471422, -1.463188, 0, 1, 0.3294118, 1,
-0.2717721, 0.02445251, -1.189365, 0, 1, 0.3333333, 1,
-0.2671245, 0.4503827, -0.7619928, 0, 1, 0.3411765, 1,
-0.2655293, 1.257862, 1.989079, 0, 1, 0.345098, 1,
-0.2567851, 0.2773038, -1.277113, 0, 1, 0.3529412, 1,
-0.2566421, -0.468724, -1.317613, 0, 1, 0.3568628, 1,
-0.2554733, 0.8017362, 0.1369744, 0, 1, 0.3647059, 1,
-0.2545382, 0.5665536, -2.117759, 0, 1, 0.3686275, 1,
-0.252566, 1.073618, -1.644571, 0, 1, 0.3764706, 1,
-0.2521688, -0.2735225, -1.365229, 0, 1, 0.3803922, 1,
-0.2510861, 0.5321915, -0.2872411, 0, 1, 0.3882353, 1,
-0.2497083, 0.5665126, 0.8109763, 0, 1, 0.3921569, 1,
-0.2443089, 1.458995, 0.8225522, 0, 1, 0.4, 1,
-0.239161, -0.0440506, -0.5813832, 0, 1, 0.4078431, 1,
-0.237036, 0.5655021, -2.969437, 0, 1, 0.4117647, 1,
-0.2345709, -1.267647, -3.993719, 0, 1, 0.4196078, 1,
-0.2338044, -0.9082439, -2.566275, 0, 1, 0.4235294, 1,
-0.2276708, 0.8522432, -1.075612, 0, 1, 0.4313726, 1,
-0.2267741, 0.2318701, -0.662914, 0, 1, 0.4352941, 1,
-0.2257646, -1.001794, -3.190583, 0, 1, 0.4431373, 1,
-0.2242682, 2.371922, -1.571663, 0, 1, 0.4470588, 1,
-0.2239923, -0.3751729, -2.882245, 0, 1, 0.454902, 1,
-0.2239498, -0.6005776, -2.499365, 0, 1, 0.4588235, 1,
-0.2239078, 0.3621945, -0.9077271, 0, 1, 0.4666667, 1,
-0.2220187, -0.6243491, -3.409154, 0, 1, 0.4705882, 1,
-0.2201122, 1.444959, -1.37125, 0, 1, 0.4784314, 1,
-0.2183449, 0.4618216, 0.1696862, 0, 1, 0.4823529, 1,
-0.2156758, -0.6533163, -2.348278, 0, 1, 0.4901961, 1,
-0.2096926, 1.775722, -1.918876, 0, 1, 0.4941176, 1,
-0.2095776, 2.268683, -0.3152806, 0, 1, 0.5019608, 1,
-0.2091796, -0.8187402, -3.138808, 0, 1, 0.509804, 1,
-0.208743, -1.187996, -2.265569, 0, 1, 0.5137255, 1,
-0.2065958, -1.121176, -3.355134, 0, 1, 0.5215687, 1,
-0.2023822, 1.088915, 0.5617017, 0, 1, 0.5254902, 1,
-0.2023223, 1.494967, 0.7038835, 0, 1, 0.5333334, 1,
-0.1956481, 0.7588221, 0.6003729, 0, 1, 0.5372549, 1,
-0.1918769, -0.05536086, -2.104557, 0, 1, 0.5450981, 1,
-0.1902589, -0.2520049, -3.208578, 0, 1, 0.5490196, 1,
-0.1875521, 0.1089757, -0.6977693, 0, 1, 0.5568628, 1,
-0.1826796, -0.1948248, -1.528971, 0, 1, 0.5607843, 1,
-0.1776729, -0.7732288, -1.596962, 0, 1, 0.5686275, 1,
-0.1730013, -0.08677111, -0.8891246, 0, 1, 0.572549, 1,
-0.169471, -0.467933, -2.129872, 0, 1, 0.5803922, 1,
-0.1605971, 0.06535519, -0.2562723, 0, 1, 0.5843138, 1,
-0.1596297, -0.7346047, -2.77474, 0, 1, 0.5921569, 1,
-0.1537037, 0.0271428, -1.839348, 0, 1, 0.5960785, 1,
-0.1446977, 0.6272852, 0.09422244, 0, 1, 0.6039216, 1,
-0.1419626, -0.4558977, -5.084007, 0, 1, 0.6117647, 1,
-0.1291765, 0.7301496, -0.3030078, 0, 1, 0.6156863, 1,
-0.12761, 1.97533, -1.687363, 0, 1, 0.6235294, 1,
-0.1273218, -0.873768, -1.712042, 0, 1, 0.627451, 1,
-0.1258752, 1.292364, -2.12281, 0, 1, 0.6352941, 1,
-0.1250403, -1.931573, -1.014203, 0, 1, 0.6392157, 1,
-0.1236403, -0.8139927, -3.266276, 0, 1, 0.6470588, 1,
-0.1220453, 0.0002854478, 0.1936444, 0, 1, 0.6509804, 1,
-0.1177392, 0.8149393, 0.1595916, 0, 1, 0.6588235, 1,
-0.1146565, 0.3979576, 0.1433557, 0, 1, 0.6627451, 1,
-0.1107492, -2.704691, -3.934436, 0, 1, 0.6705883, 1,
-0.1061303, 0.6915673, 0.5405926, 0, 1, 0.6745098, 1,
-0.1055015, 0.07124645, 0.667078, 0, 1, 0.682353, 1,
-0.1014813, -0.3959879, -3.642612, 0, 1, 0.6862745, 1,
-0.09724545, 0.5957003, -0.1314245, 0, 1, 0.6941177, 1,
-0.09449216, 0.08616156, 0.1325082, 0, 1, 0.7019608, 1,
-0.08386416, 0.2362341, -0.6164871, 0, 1, 0.7058824, 1,
-0.0807017, 0.5895645, 0.05417334, 0, 1, 0.7137255, 1,
-0.07887097, -0.5155498, -3.202667, 0, 1, 0.7176471, 1,
-0.07759733, 0.5956732, -0.6370358, 0, 1, 0.7254902, 1,
-0.07722422, -0.09030248, -2.494298, 0, 1, 0.7294118, 1,
-0.07568377, 0.6812971, -0.9301926, 0, 1, 0.7372549, 1,
-0.07546515, 1.573647, 1.764317, 0, 1, 0.7411765, 1,
-0.0753165, 0.6518189, -0.8817505, 0, 1, 0.7490196, 1,
-0.06720237, -0.04827205, -1.516278, 0, 1, 0.7529412, 1,
-0.0650297, 0.04355443, 0.7139444, 0, 1, 0.7607843, 1,
-0.06076928, 0.3215872, 0.780764, 0, 1, 0.7647059, 1,
-0.0585954, -0.2162761, -3.103537, 0, 1, 0.772549, 1,
-0.05618537, -0.2291343, -1.892983, 0, 1, 0.7764706, 1,
-0.05256705, 1.644086, -1.009481, 0, 1, 0.7843137, 1,
-0.0510975, 0.1679805, 0.8496301, 0, 1, 0.7882353, 1,
-0.04572, 0.09261771, -0.8378084, 0, 1, 0.7960784, 1,
-0.04453675, -0.9896051, -2.525534, 0, 1, 0.8039216, 1,
-0.0442684, -0.8644128, -2.531264, 0, 1, 0.8078431, 1,
-0.04366083, 0.2550087, 0.7894151, 0, 1, 0.8156863, 1,
-0.03831106, 0.5063789, 0.5139154, 0, 1, 0.8196079, 1,
-0.03786142, 1.164166, -2.100889, 0, 1, 0.827451, 1,
-0.03678739, -1.6005, -5.198529, 0, 1, 0.8313726, 1,
-0.03589914, 1.233617, -0.7386143, 0, 1, 0.8392157, 1,
-0.03588822, 0.7146721, -0.4597449, 0, 1, 0.8431373, 1,
-0.03223482, -2.413895, -2.958002, 0, 1, 0.8509804, 1,
-0.03083474, 0.001278356, -0.6826424, 0, 1, 0.854902, 1,
-0.03028768, 2.156971, 1.051381, 0, 1, 0.8627451, 1,
-0.0286649, -1.527507, -3.782629, 0, 1, 0.8666667, 1,
-0.02837704, 0.8535281, -1.182914, 0, 1, 0.8745098, 1,
-0.02675425, -1.797842, -1.493374, 0, 1, 0.8784314, 1,
-0.01947702, -2.59115, -2.883725, 0, 1, 0.8862745, 1,
-0.017837, 1.46506, 0.7266374, 0, 1, 0.8901961, 1,
-0.0147288, 1.285611, -0.06216423, 0, 1, 0.8980392, 1,
-0.01317609, -0.1551664, -1.200517, 0, 1, 0.9058824, 1,
-0.01002909, -1.379239, -1.629607, 0, 1, 0.9098039, 1,
-0.00880737, -1.486371, -2.386374, 0, 1, 0.9176471, 1,
-0.001363531, 1.155405, -2.031351, 0, 1, 0.9215686, 1,
0.001100368, -0.7751098, 2.378015, 0, 1, 0.9294118, 1,
0.002296113, -0.5701573, 3.320283, 0, 1, 0.9333333, 1,
0.003590666, -1.124061, 1.63048, 0, 1, 0.9411765, 1,
0.004914044, -1.754027, 2.905165, 0, 1, 0.945098, 1,
0.01285593, 1.738403, 0.3048457, 0, 1, 0.9529412, 1,
0.01757668, 0.1337644, 1.120588, 0, 1, 0.9568627, 1,
0.01881373, -1.273668, 3.980295, 0, 1, 0.9647059, 1,
0.01953726, -1.17265, 3.896518, 0, 1, 0.9686275, 1,
0.02254797, 0.3333197, -0.1769191, 0, 1, 0.9764706, 1,
0.02362758, 1.056391, 0.2071432, 0, 1, 0.9803922, 1,
0.02692196, 0.7751114, -0.3165948, 0, 1, 0.9882353, 1,
0.03031753, -0.2083631, 2.24411, 0, 1, 0.9921569, 1,
0.03071423, 0.2229131, 0.4765996, 0, 1, 1, 1,
0.03435845, -0.1658333, 2.222915, 0, 0.9921569, 1, 1,
0.03491621, -0.9201695, 4.994253, 0, 0.9882353, 1, 1,
0.0374696, -0.9934213, 3.177157, 0, 0.9803922, 1, 1,
0.03765055, 0.7362, -1.663053, 0, 0.9764706, 1, 1,
0.03884579, 0.3677716, -0.2957466, 0, 0.9686275, 1, 1,
0.0390681, 0.7985321, -0.141664, 0, 0.9647059, 1, 1,
0.03937137, 1.449732, 0.1690034, 0, 0.9568627, 1, 1,
0.03958274, 0.806375, 1.093547, 0, 0.9529412, 1, 1,
0.04101754, -0.3806656, 2.594921, 0, 0.945098, 1, 1,
0.04272687, 0.7823921, 0.1081735, 0, 0.9411765, 1, 1,
0.04405965, 0.1898712, 0.9760501, 0, 0.9333333, 1, 1,
0.04415221, -0.2453204, 3.426023, 0, 0.9294118, 1, 1,
0.0468097, -0.5503874, 2.521494, 0, 0.9215686, 1, 1,
0.04711065, -0.2865585, 3.738622, 0, 0.9176471, 1, 1,
0.04736277, -1.068618, 3.940519, 0, 0.9098039, 1, 1,
0.04887512, -1.700208, 1.140537, 0, 0.9058824, 1, 1,
0.04985459, -0.1081468, 1.657216, 0, 0.8980392, 1, 1,
0.05309998, 1.123229, 0.5186093, 0, 0.8901961, 1, 1,
0.05351859, 1.095889, -0.2020627, 0, 0.8862745, 1, 1,
0.05538812, 2.07701, 0.5672933, 0, 0.8784314, 1, 1,
0.05799384, 0.7335337, 1.715423, 0, 0.8745098, 1, 1,
0.06021555, 0.8026477, 0.9722034, 0, 0.8666667, 1, 1,
0.06440799, 0.005813094, 2.083607, 0, 0.8627451, 1, 1,
0.06615796, 0.6677227, -0.2386291, 0, 0.854902, 1, 1,
0.06683468, -0.7200556, 2.56642, 0, 0.8509804, 1, 1,
0.07090891, -0.9929489, 2.559272, 0, 0.8431373, 1, 1,
0.07546556, -0.6228475, 2.809873, 0, 0.8392157, 1, 1,
0.07775443, -1.291406, 4.347417, 0, 0.8313726, 1, 1,
0.07895987, 0.592499, -0.3553135, 0, 0.827451, 1, 1,
0.07986934, -0.2879972, 3.673618, 0, 0.8196079, 1, 1,
0.08113486, -0.1296835, 1.71597, 0, 0.8156863, 1, 1,
0.08203309, 1.910866, 0.0009378419, 0, 0.8078431, 1, 1,
0.08563279, 0.1184167, 0.1492905, 0, 0.8039216, 1, 1,
0.08734612, 1.078429, 0.09260581, 0, 0.7960784, 1, 1,
0.09468491, -0.1832374, 3.596105, 0, 0.7882353, 1, 1,
0.09759019, -1.0722, 1.421665, 0, 0.7843137, 1, 1,
0.09894754, 1.016327, 0.6172733, 0, 0.7764706, 1, 1,
0.1013219, 1.30039, 0.7750095, 0, 0.772549, 1, 1,
0.1042759, -1.160959, 4.946397, 0, 0.7647059, 1, 1,
0.1050613, -1.520642, 3.680794, 0, 0.7607843, 1, 1,
0.1092511, 2.169196, 0.5693797, 0, 0.7529412, 1, 1,
0.1105031, 1.358666, 0.7213255, 0, 0.7490196, 1, 1,
0.1105627, 0.6615437, 1.839892, 0, 0.7411765, 1, 1,
0.1137668, 0.7101564, -0.2296003, 0, 0.7372549, 1, 1,
0.1171611, -0.9279117, 2.490474, 0, 0.7294118, 1, 1,
0.1176914, -2.017791, 3.823875, 0, 0.7254902, 1, 1,
0.1192347, -0.4143294, 4.260081, 0, 0.7176471, 1, 1,
0.120593, 0.4176465, 0.4291416, 0, 0.7137255, 1, 1,
0.1272421, 0.2085275, -0.4945297, 0, 0.7058824, 1, 1,
0.1317558, -0.008121629, -0.6280673, 0, 0.6980392, 1, 1,
0.1355281, 0.3695336, 1.272754, 0, 0.6941177, 1, 1,
0.1366304, -1.506982, 2.362255, 0, 0.6862745, 1, 1,
0.1380408, -0.07442867, 0.6655406, 0, 0.682353, 1, 1,
0.1381207, -0.7854014, 3.982606, 0, 0.6745098, 1, 1,
0.1383907, 1.146988, 0.9491068, 0, 0.6705883, 1, 1,
0.139151, -0.09387007, 0.2964639, 0, 0.6627451, 1, 1,
0.1396468, 0.1717375, 2.29673, 0, 0.6588235, 1, 1,
0.1436073, 1.187686, 0.8565801, 0, 0.6509804, 1, 1,
0.1458352, 1.675635, 0.7277938, 0, 0.6470588, 1, 1,
0.1461061, 0.5559617, 0.902205, 0, 0.6392157, 1, 1,
0.1500554, -0.2741316, 3.2076, 0, 0.6352941, 1, 1,
0.1512968, -1.152733, 3.933081, 0, 0.627451, 1, 1,
0.1574958, -0.3690468, 1.426906, 0, 0.6235294, 1, 1,
0.1630706, -0.6942886, 1.545427, 0, 0.6156863, 1, 1,
0.1677019, 0.4850784, 0.3872896, 0, 0.6117647, 1, 1,
0.1723579, -1.107587, 2.568692, 0, 0.6039216, 1, 1,
0.1736908, -1.111159, 2.757056, 0, 0.5960785, 1, 1,
0.1744381, 0.2398979, 1.017489, 0, 0.5921569, 1, 1,
0.1749688, -1.578661, 3.825361, 0, 0.5843138, 1, 1,
0.1751761, 0.1983373, 1.363293, 0, 0.5803922, 1, 1,
0.1796505, -0.7828637, 2.470706, 0, 0.572549, 1, 1,
0.1912406, 0.8169382, -1.333427, 0, 0.5686275, 1, 1,
0.1942288, -0.8162065, 4.270114, 0, 0.5607843, 1, 1,
0.1971277, 1.507973, -0.3386625, 0, 0.5568628, 1, 1,
0.1971889, 0.944891, 0.3097475, 0, 0.5490196, 1, 1,
0.1973383, -0.2471137, 3.448279, 0, 0.5450981, 1, 1,
0.207519, -1.48992, 1.782151, 0, 0.5372549, 1, 1,
0.2082838, -1.003808, 3.812483, 0, 0.5333334, 1, 1,
0.2103051, 0.1206896, 2.231758, 0, 0.5254902, 1, 1,
0.2114985, -0.6242211, 3.392285, 0, 0.5215687, 1, 1,
0.213744, -0.7732109, 0.7602745, 0, 0.5137255, 1, 1,
0.2138332, -0.01186055, 2.623464, 0, 0.509804, 1, 1,
0.2192681, -2.36571, 4.227543, 0, 0.5019608, 1, 1,
0.2206336, 0.6154574, -0.3073424, 0, 0.4941176, 1, 1,
0.2276428, -0.1404229, 2.419279, 0, 0.4901961, 1, 1,
0.2281118, 2.111399, -0.1858789, 0, 0.4823529, 1, 1,
0.2305547, 0.7924685, -0.3815059, 0, 0.4784314, 1, 1,
0.234931, 2.18102, 1.299324, 0, 0.4705882, 1, 1,
0.2385771, -0.3765546, 0.05643209, 0, 0.4666667, 1, 1,
0.2399338, -1.149781, 2.068311, 0, 0.4588235, 1, 1,
0.2418082, -0.0360206, 1.807738, 0, 0.454902, 1, 1,
0.2464113, -0.1570798, 1.723721, 0, 0.4470588, 1, 1,
0.2491255, 1.282276, -0.7169625, 0, 0.4431373, 1, 1,
0.2555627, -0.2128527, 2.629163, 0, 0.4352941, 1, 1,
0.2563395, 0.0007318959, 1.274634, 0, 0.4313726, 1, 1,
0.2568244, 1.460504, 1.603215, 0, 0.4235294, 1, 1,
0.2574183, -0.2541316, 2.975949, 0, 0.4196078, 1, 1,
0.2621277, -0.136842, 2.00663, 0, 0.4117647, 1, 1,
0.2632501, 0.6537519, 2.046063, 0, 0.4078431, 1, 1,
0.2634717, -1.483817, 2.863095, 0, 0.4, 1, 1,
0.2707794, 0.02284225, 1.043425, 0, 0.3921569, 1, 1,
0.2780064, 1.655639, 0.04444108, 0, 0.3882353, 1, 1,
0.2790687, -1.157584, 3.251708, 0, 0.3803922, 1, 1,
0.2800499, 1.108879, 1.224422, 0, 0.3764706, 1, 1,
0.2804981, -1.349519, 1.693498, 0, 0.3686275, 1, 1,
0.2833363, -0.9762617, 2.996998, 0, 0.3647059, 1, 1,
0.2841956, 1.286256, 0.07019, 0, 0.3568628, 1, 1,
0.2925496, -1.29061, 1.606305, 0, 0.3529412, 1, 1,
0.2941878, 1.230968, 1.399233, 0, 0.345098, 1, 1,
0.2972748, 0.4647543, 0.3811935, 0, 0.3411765, 1, 1,
0.298646, 1.281881, 0.3463986, 0, 0.3333333, 1, 1,
0.3072771, 2.283864, 0.4346267, 0, 0.3294118, 1, 1,
0.3095784, 0.03484816, 1.899084, 0, 0.3215686, 1, 1,
0.3106553, 0.8474507, 0.1879827, 0, 0.3176471, 1, 1,
0.3192651, -0.1000261, 2.184299, 0, 0.3098039, 1, 1,
0.3192702, -2.056265, 2.54279, 0, 0.3058824, 1, 1,
0.3215154, -0.4798489, 1.754859, 0, 0.2980392, 1, 1,
0.3235447, 1.031044, -0.8694812, 0, 0.2901961, 1, 1,
0.3242328, 0.6060104, 3.103472, 0, 0.2862745, 1, 1,
0.3393084, -0.4291449, 1.867801, 0, 0.2784314, 1, 1,
0.3393583, 0.4224717, -1.427878, 0, 0.2745098, 1, 1,
0.3398513, -0.704192, 0.4106008, 0, 0.2666667, 1, 1,
0.3404258, 0.09552481, 0.9172388, 0, 0.2627451, 1, 1,
0.3445557, -0.0580797, 1.374621, 0, 0.254902, 1, 1,
0.3484384, -0.121058, 2.675659, 0, 0.2509804, 1, 1,
0.3501682, -0.7274723, 2.886563, 0, 0.2431373, 1, 1,
0.3509055, 0.3152888, 0.04421302, 0, 0.2392157, 1, 1,
0.3538423, 0.5661747, 0.2003801, 0, 0.2313726, 1, 1,
0.3598539, 0.869305, 0.8984303, 0, 0.227451, 1, 1,
0.3608238, -0.9551669, 1.844524, 0, 0.2196078, 1, 1,
0.3687458, 1.14636, 0.7813939, 0, 0.2156863, 1, 1,
0.3727753, -1.303065, 1.276093, 0, 0.2078431, 1, 1,
0.3732246, -1.01868, 2.632746, 0, 0.2039216, 1, 1,
0.3736252, 0.3987976, -0.5691409, 0, 0.1960784, 1, 1,
0.3744447, -0.9401957, 4.090972, 0, 0.1882353, 1, 1,
0.3748403, -1.397232, 4.517001, 0, 0.1843137, 1, 1,
0.3761955, -0.6792957, 3.389741, 0, 0.1764706, 1, 1,
0.3785094, 2.105856, 0.696947, 0, 0.172549, 1, 1,
0.3842591, -0.482558, 3.705362, 0, 0.1647059, 1, 1,
0.3874498, 1.020125, 0.6238971, 0, 0.1607843, 1, 1,
0.3918139, -0.06957995, 3.302503, 0, 0.1529412, 1, 1,
0.3960742, 1.048424, 0.3332334, 0, 0.1490196, 1, 1,
0.3968507, -0.1726622, 2.532372, 0, 0.1411765, 1, 1,
0.4023215, 0.1218059, 0.4826549, 0, 0.1372549, 1, 1,
0.4028824, 1.811548, 0.5140352, 0, 0.1294118, 1, 1,
0.4076868, 0.05698482, -0.4854162, 0, 0.1254902, 1, 1,
0.4077869, 0.1308551, 1.182846, 0, 0.1176471, 1, 1,
0.409209, -0.9601467, 3.620116, 0, 0.1137255, 1, 1,
0.4100659, 0.3397318, -0.19772, 0, 0.1058824, 1, 1,
0.4113615, 1.817309, 0.07803369, 0, 0.09803922, 1, 1,
0.4145674, -0.5484651, 2.618399, 0, 0.09411765, 1, 1,
0.4161634, -1.557265, 4.417175, 0, 0.08627451, 1, 1,
0.4174602, 2.560392, 0.4006712, 0, 0.08235294, 1, 1,
0.4251028, -0.2104434, 3.02444, 0, 0.07450981, 1, 1,
0.4261019, 0.6715361, -0.5583569, 0, 0.07058824, 1, 1,
0.4270696, -0.2492642, 1.800108, 0, 0.0627451, 1, 1,
0.4284315, -1.010721, 2.595338, 0, 0.05882353, 1, 1,
0.4317184, -0.2810445, 1.579726, 0, 0.05098039, 1, 1,
0.4327921, 0.2237073, -0.5202429, 0, 0.04705882, 1, 1,
0.4334854, -1.769953, 2.208192, 0, 0.03921569, 1, 1,
0.4343171, -1.049394, 3.827881, 0, 0.03529412, 1, 1,
0.4344065, 0.4337327, -1.254822, 0, 0.02745098, 1, 1,
0.4388016, 0.1753176, -0.558813, 0, 0.02352941, 1, 1,
0.4462099, 0.4048141, 0.3527969, 0, 0.01568628, 1, 1,
0.4470236, -0.05283607, -0.3303562, 0, 0.01176471, 1, 1,
0.4498485, 0.08869784, 2.399655, 0, 0.003921569, 1, 1,
0.452436, 0.6276146, 0.8208058, 0.003921569, 0, 1, 1,
0.458131, -1.183504, 1.48559, 0.007843138, 0, 1, 1,
0.4620288, -1.210025, 3.17534, 0.01568628, 0, 1, 1,
0.4674631, 0.9596551, 0.2984211, 0.01960784, 0, 1, 1,
0.4723035, 0.2302429, 0.8282459, 0.02745098, 0, 1, 1,
0.4727451, -0.0392938, 0.8916004, 0.03137255, 0, 1, 1,
0.472954, 0.2967881, 2.448488, 0.03921569, 0, 1, 1,
0.4735408, -0.01179464, 1.619766, 0.04313726, 0, 1, 1,
0.4752118, -1.108784, 2.789548, 0.05098039, 0, 1, 1,
0.4765687, 0.6868017, 2.400348, 0.05490196, 0, 1, 1,
0.4790788, 0.3580166, 0.3427419, 0.0627451, 0, 1, 1,
0.4882388, 2.246324, 1.204024, 0.06666667, 0, 1, 1,
0.4891765, -1.458974, 3.235531, 0.07450981, 0, 1, 1,
0.4958964, -1.137029, 2.990511, 0.07843138, 0, 1, 1,
0.4980692, 0.5870735, 0.5796608, 0.08627451, 0, 1, 1,
0.4985837, 0.1594845, 1.033434, 0.09019608, 0, 1, 1,
0.4990981, -0.01072826, 0.2974575, 0.09803922, 0, 1, 1,
0.504254, 0.2580558, 1.321487, 0.1058824, 0, 1, 1,
0.5067514, 0.8906858, 0.1326684, 0.1098039, 0, 1, 1,
0.5174296, 1.004307, -1.502669, 0.1176471, 0, 1, 1,
0.5205491, 2.495468, 0.4549038, 0.1215686, 0, 1, 1,
0.522307, 0.928317, 0.3635472, 0.1294118, 0, 1, 1,
0.5226392, 1.321162, 0.9528612, 0.1333333, 0, 1, 1,
0.5244501, 0.5734367, 0.602205, 0.1411765, 0, 1, 1,
0.5276425, -0.7347093, 2.998785, 0.145098, 0, 1, 1,
0.5348958, 0.8336526, 1.89519, 0.1529412, 0, 1, 1,
0.5372632, -0.9753326, 1.254049, 0.1568628, 0, 1, 1,
0.5378327, -0.5736426, 2.632323, 0.1647059, 0, 1, 1,
0.5432333, 1.05311, 0.4120193, 0.1686275, 0, 1, 1,
0.5465598, 1.643017, 0.603829, 0.1764706, 0, 1, 1,
0.5488805, -1.089591, 3.860992, 0.1803922, 0, 1, 1,
0.5506104, 0.4001103, 0.4314758, 0.1882353, 0, 1, 1,
0.5546852, -1.279153, 1.167879, 0.1921569, 0, 1, 1,
0.554805, 0.5296739, 1.072437, 0.2, 0, 1, 1,
0.5587591, -0.6369831, 2.586282, 0.2078431, 0, 1, 1,
0.5608293, -0.8735252, 3.093145, 0.2117647, 0, 1, 1,
0.5651767, 1.588121, 0.9477719, 0.2196078, 0, 1, 1,
0.5652956, 1.723176, -0.1431125, 0.2235294, 0, 1, 1,
0.5659756, 1.385702, 0.3464972, 0.2313726, 0, 1, 1,
0.5689899, 0.885112, 0.910897, 0.2352941, 0, 1, 1,
0.5741279, -0.384923, 0.06699828, 0.2431373, 0, 1, 1,
0.5752931, 0.4449058, 0.8692558, 0.2470588, 0, 1, 1,
0.5785909, -0.4511144, 2.07103, 0.254902, 0, 1, 1,
0.5788952, -1.133376, 2.0532, 0.2588235, 0, 1, 1,
0.5845575, 0.9942759, 0.1777697, 0.2666667, 0, 1, 1,
0.5871415, -0.5546309, 2.982069, 0.2705882, 0, 1, 1,
0.5998151, -0.662589, 3.882668, 0.2784314, 0, 1, 1,
0.6035789, 0.1227425, 0.07868044, 0.282353, 0, 1, 1,
0.6049162, 0.5067094, -0.2059616, 0.2901961, 0, 1, 1,
0.6066793, -0.4453128, 3.78205, 0.2941177, 0, 1, 1,
0.6069952, -1.17489, 2.198269, 0.3019608, 0, 1, 1,
0.6079269, -0.2894461, 3.36499, 0.3098039, 0, 1, 1,
0.6128179, -0.6270474, 2.2092, 0.3137255, 0, 1, 1,
0.6134645, -0.3780024, 3.988444, 0.3215686, 0, 1, 1,
0.6357093, -0.6063762, 2.165447, 0.3254902, 0, 1, 1,
0.6394061, -1.580326, 2.400567, 0.3333333, 0, 1, 1,
0.6394524, 1.415899, -0.9619049, 0.3372549, 0, 1, 1,
0.64614, -1.329536, 2.650065, 0.345098, 0, 1, 1,
0.6477374, -0.02619599, 3.408133, 0.3490196, 0, 1, 1,
0.6477579, -0.4519835, 1.025042, 0.3568628, 0, 1, 1,
0.6607078, -1.037244, 2.276825, 0.3607843, 0, 1, 1,
0.6611879, 1.632948, -0.4681126, 0.3686275, 0, 1, 1,
0.6674377, -0.4676929, 3.003313, 0.372549, 0, 1, 1,
0.6696923, 0.7178413, -1.361934, 0.3803922, 0, 1, 1,
0.6762438, 0.8932869, 0.05053508, 0.3843137, 0, 1, 1,
0.6810622, 0.2841294, 1.238476, 0.3921569, 0, 1, 1,
0.6821848, -0.5794487, 1.78395, 0.3960784, 0, 1, 1,
0.6822609, -1.43694, 2.189433, 0.4039216, 0, 1, 1,
0.6849395, 0.5028992, 0.485906, 0.4117647, 0, 1, 1,
0.6919791, 0.5033851, -0.1180552, 0.4156863, 0, 1, 1,
0.6922088, 0.09967756, 1.432226, 0.4235294, 0, 1, 1,
0.6931865, -1.936803, 2.444126, 0.427451, 0, 1, 1,
0.6980993, -0.8858643, 2.410659, 0.4352941, 0, 1, 1,
0.7025821, 0.9612823, 0.4994031, 0.4392157, 0, 1, 1,
0.7029573, -0.8915733, 2.036608, 0.4470588, 0, 1, 1,
0.703207, -0.8635623, 1.920063, 0.4509804, 0, 1, 1,
0.7040405, 2.100734, 0.5199126, 0.4588235, 0, 1, 1,
0.7041606, 1.318382, 0.1522589, 0.4627451, 0, 1, 1,
0.7048069, -0.4877923, 1.895952, 0.4705882, 0, 1, 1,
0.7061791, -0.4783161, 1.843271, 0.4745098, 0, 1, 1,
0.7074423, -1.816375, -0.7143008, 0.4823529, 0, 1, 1,
0.7124578, -1.510728, 3.084369, 0.4862745, 0, 1, 1,
0.7126958, -0.2782928, 0.54105, 0.4941176, 0, 1, 1,
0.7198506, 0.4377912, 1.628673, 0.5019608, 0, 1, 1,
0.721294, -0.9132105, 2.564963, 0.5058824, 0, 1, 1,
0.722537, -0.8965928, 3.342159, 0.5137255, 0, 1, 1,
0.7243685, 1.209171, 1.507332, 0.5176471, 0, 1, 1,
0.7318325, 1.668799, -0.06178777, 0.5254902, 0, 1, 1,
0.734285, 0.5603576, 1.03159, 0.5294118, 0, 1, 1,
0.7377516, -1.868048, 3.333931, 0.5372549, 0, 1, 1,
0.7385354, 1.422453, 2.139907, 0.5411765, 0, 1, 1,
0.7458971, -0.02273452, 2.163828, 0.5490196, 0, 1, 1,
0.7536884, -0.3549519, 2.721125, 0.5529412, 0, 1, 1,
0.7611607, -0.1185939, -1.354302, 0.5607843, 0, 1, 1,
0.7613981, 0.7251912, 2.159871, 0.5647059, 0, 1, 1,
0.7629901, 0.5714328, 0.3876284, 0.572549, 0, 1, 1,
0.7657169, -1.213553, 3.347639, 0.5764706, 0, 1, 1,
0.7676296, 1.055163, -0.7165491, 0.5843138, 0, 1, 1,
0.7680406, 1.743821, -0.188851, 0.5882353, 0, 1, 1,
0.7765506, -3.327485, 1.021442, 0.5960785, 0, 1, 1,
0.7778707, -1.01694, 2.927584, 0.6039216, 0, 1, 1,
0.7784542, 0.5044068, 0.5920275, 0.6078432, 0, 1, 1,
0.7826274, -1.066588, 1.562263, 0.6156863, 0, 1, 1,
0.7834051, 0.7824329, -0.3179625, 0.6196079, 0, 1, 1,
0.7857466, -1.222546, 3.64026, 0.627451, 0, 1, 1,
0.7870989, 1.208929, 0.8635046, 0.6313726, 0, 1, 1,
0.7985879, -0.4820836, 1.093771, 0.6392157, 0, 1, 1,
0.8066984, 1.255433, -0.2824203, 0.6431373, 0, 1, 1,
0.8091243, 2.556851, 1.102194, 0.6509804, 0, 1, 1,
0.8094741, 0.6013473, 0.7020358, 0.654902, 0, 1, 1,
0.8135114, 0.2756328, 0.210622, 0.6627451, 0, 1, 1,
0.817262, -0.5604465, 2.471207, 0.6666667, 0, 1, 1,
0.8213887, -0.829909, 3.182611, 0.6745098, 0, 1, 1,
0.8221021, -1.16217, 3.443374, 0.6784314, 0, 1, 1,
0.8290404, 1.427598, 1.039614, 0.6862745, 0, 1, 1,
0.8320748, -1.1889, 2.034353, 0.6901961, 0, 1, 1,
0.8395427, 0.08397304, 1.850779, 0.6980392, 0, 1, 1,
0.8401535, -0.8542302, 1.838739, 0.7058824, 0, 1, 1,
0.8439503, 0.3996177, 0.09627238, 0.7098039, 0, 1, 1,
0.8443469, -2.290866, 1.071508, 0.7176471, 0, 1, 1,
0.8465803, -0.3984079, 2.106167, 0.7215686, 0, 1, 1,
0.8493743, 1.456071, 1.458601, 0.7294118, 0, 1, 1,
0.8540754, -0.8428373, 2.459737, 0.7333333, 0, 1, 1,
0.8541723, -0.6294434, 2.315412, 0.7411765, 0, 1, 1,
0.8602873, -0.2648353, 2.189614, 0.7450981, 0, 1, 1,
0.8708144, -0.2066006, 1.693039, 0.7529412, 0, 1, 1,
0.87151, 0.05765226, 2.267562, 0.7568628, 0, 1, 1,
0.8723663, 0.03523007, 1.551645, 0.7647059, 0, 1, 1,
0.8766414, -1.53652, 2.777611, 0.7686275, 0, 1, 1,
0.8766485, 0.04739986, -0.2199623, 0.7764706, 0, 1, 1,
0.8822996, 0.1122892, 3.147596, 0.7803922, 0, 1, 1,
0.88349, -0.3103822, 0.7552881, 0.7882353, 0, 1, 1,
0.8849487, 0.248522, 0.3501387, 0.7921569, 0, 1, 1,
0.8877324, 0.5727903, 0.6339452, 0.8, 0, 1, 1,
0.8913636, 0.9434788, 1.236395, 0.8078431, 0, 1, 1,
0.8971799, -0.6935046, 1.564926, 0.8117647, 0, 1, 1,
0.8972166, -0.4255622, 5.493016, 0.8196079, 0, 1, 1,
0.8994042, -0.1280786, 2.009045, 0.8235294, 0, 1, 1,
0.9023309, 0.2571141, 0.6643898, 0.8313726, 0, 1, 1,
0.9033829, 1.766657, 0.7626296, 0.8352941, 0, 1, 1,
0.9035113, 3.08414, 0.7326874, 0.8431373, 0, 1, 1,
0.9087309, 0.3950549, 0.1837606, 0.8470588, 0, 1, 1,
0.9123048, -1.142572, 2.531033, 0.854902, 0, 1, 1,
0.9263874, -0.7867593, 2.831073, 0.8588235, 0, 1, 1,
0.9298592, -1.101442, 3.056791, 0.8666667, 0, 1, 1,
0.9360343, 0.6660441, 1.159896, 0.8705882, 0, 1, 1,
0.938169, 0.2046344, 2.4365, 0.8784314, 0, 1, 1,
0.9397196, 1.400019, 0.08923446, 0.8823529, 0, 1, 1,
0.9428581, 0.06690241, 0.5161696, 0.8901961, 0, 1, 1,
0.9450377, -0.8236651, 4.143747, 0.8941177, 0, 1, 1,
0.9497755, -0.1256031, 2.201004, 0.9019608, 0, 1, 1,
0.974858, 0.6487787, 0.2755414, 0.9098039, 0, 1, 1,
0.976437, -1.876571, 3.160916, 0.9137255, 0, 1, 1,
0.9800974, -0.4479697, 2.323833, 0.9215686, 0, 1, 1,
0.9827896, 0.5108593, -0.1146985, 0.9254902, 0, 1, 1,
0.9877748, -0.7002727, 3.450004, 0.9333333, 0, 1, 1,
0.9957811, 0.4838262, 1.056591, 0.9372549, 0, 1, 1,
0.9983292, -0.1415974, 2.767512, 0.945098, 0, 1, 1,
1.005557, 0.04765494, 0.2046157, 0.9490196, 0, 1, 1,
1.007468, 0.8661621, 1.218117, 0.9568627, 0, 1, 1,
1.008816, 1.921905, 0.3440621, 0.9607843, 0, 1, 1,
1.010625, 1.218808, 1.422849, 0.9686275, 0, 1, 1,
1.013588, 1.236061, 0.1021114, 0.972549, 0, 1, 1,
1.015297, -2.014443, 2.276612, 0.9803922, 0, 1, 1,
1.028855, -1.434994, 2.012585, 0.9843137, 0, 1, 1,
1.030576, 0.8860608, 0.884859, 0.9921569, 0, 1, 1,
1.032352, -0.2683663, 1.706575, 0.9960784, 0, 1, 1,
1.033979, 1.192855, -1.157036, 1, 0, 0.9960784, 1,
1.03432, -0.2297814, 1.986987, 1, 0, 0.9882353, 1,
1.035943, -0.3546079, 0.1478786, 1, 0, 0.9843137, 1,
1.037431, -0.2600154, 1.885952, 1, 0, 0.9764706, 1,
1.061198, -0.1971941, 1.400009, 1, 0, 0.972549, 1,
1.064742, 1.371914, 1.182132, 1, 0, 0.9647059, 1,
1.070627, 1.212912, 0.9315862, 1, 0, 0.9607843, 1,
1.073852, -0.1464921, 1.351155, 1, 0, 0.9529412, 1,
1.081688, -1.605727, 4.074295, 1, 0, 0.9490196, 1,
1.085476, -0.9801706, 2.527253, 1, 0, 0.9411765, 1,
1.100237, 0.6428459, -0.4191493, 1, 0, 0.9372549, 1,
1.100477, -0.1290506, 1.766097, 1, 0, 0.9294118, 1,
1.100561, 0.7532106, 1.908683, 1, 0, 0.9254902, 1,
1.102686, -0.5133346, 0.06970183, 1, 0, 0.9176471, 1,
1.108793, 1.436118, 0.5673555, 1, 0, 0.9137255, 1,
1.114979, -1.240668, 0.8356941, 1, 0, 0.9058824, 1,
1.119452, 0.875685, 0.2163356, 1, 0, 0.9019608, 1,
1.127573, 0.3087262, 0.2622096, 1, 0, 0.8941177, 1,
1.128165, 0.5782194, 2.222759, 1, 0, 0.8862745, 1,
1.140742, -0.6234081, 3.374628, 1, 0, 0.8823529, 1,
1.144659, -0.8155473, 0.9822913, 1, 0, 0.8745098, 1,
1.144982, -0.8801262, 4.539084, 1, 0, 0.8705882, 1,
1.150591, -0.2305449, 2.477139, 1, 0, 0.8627451, 1,
1.151206, -0.04476826, 2.179788, 1, 0, 0.8588235, 1,
1.160676, -0.2831947, 0.861921, 1, 0, 0.8509804, 1,
1.169033, -1.063527, 2.746069, 1, 0, 0.8470588, 1,
1.176064, 0.3938172, 1.785679, 1, 0, 0.8392157, 1,
1.179189, 0.3927094, 1.682711, 1, 0, 0.8352941, 1,
1.183012, -1.550214, 3.100055, 1, 0, 0.827451, 1,
1.183349, 0.09492544, -0.3553848, 1, 0, 0.8235294, 1,
1.187252, -0.3639157, 1.791282, 1, 0, 0.8156863, 1,
1.187952, 0.1902399, 3.401423, 1, 0, 0.8117647, 1,
1.188217, -0.8733768, 0.704627, 1, 0, 0.8039216, 1,
1.194001, 1.035717, 1.831912, 1, 0, 0.7960784, 1,
1.205597, 0.5205491, 1.76101, 1, 0, 0.7921569, 1,
1.211167, -0.03200398, -0.6258663, 1, 0, 0.7843137, 1,
1.213179, 1.486664, 0.7899176, 1, 0, 0.7803922, 1,
1.215463, -0.5446105, 0.5673668, 1, 0, 0.772549, 1,
1.224245, -0.5453684, 1.828757, 1, 0, 0.7686275, 1,
1.228095, -1.079027, 3.105339, 1, 0, 0.7607843, 1,
1.237174, 0.317288, 0.3332391, 1, 0, 0.7568628, 1,
1.239628, -0.3260794, 3.587, 1, 0, 0.7490196, 1,
1.240705, 1.107674, 0.002236939, 1, 0, 0.7450981, 1,
1.241843, -0.3010712, 3.422038, 1, 0, 0.7372549, 1,
1.250942, -0.2271561, 3.927804, 1, 0, 0.7333333, 1,
1.256002, 0.2448551, 1.536577, 1, 0, 0.7254902, 1,
1.257843, -0.2127842, 2.230235, 1, 0, 0.7215686, 1,
1.265701, -0.3043432, 2.62123, 1, 0, 0.7137255, 1,
1.275905, 0.3721806, 2.388412, 1, 0, 0.7098039, 1,
1.279802, -0.5132961, 0.5283054, 1, 0, 0.7019608, 1,
1.284355, 0.09581414, 0.5519513, 1, 0, 0.6941177, 1,
1.284457, 0.05707655, 1.573883, 1, 0, 0.6901961, 1,
1.288148, -2.863607, 3.441223, 1, 0, 0.682353, 1,
1.295914, -0.2640753, -0.7618661, 1, 0, 0.6784314, 1,
1.297083, 1.611563, -0.374312, 1, 0, 0.6705883, 1,
1.299787, 0.9678685, 1.013461, 1, 0, 0.6666667, 1,
1.303012, -0.1556703, 2.300961, 1, 0, 0.6588235, 1,
1.306271, -0.04461551, 2.445214, 1, 0, 0.654902, 1,
1.327103, -0.1926649, 3.839124, 1, 0, 0.6470588, 1,
1.336409, 0.7051465, -0.4886072, 1, 0, 0.6431373, 1,
1.336804, 1.944892, 1.130828, 1, 0, 0.6352941, 1,
1.340302, -0.9947485, 2.216454, 1, 0, 0.6313726, 1,
1.341849, 0.1788327, 1.176364, 1, 0, 0.6235294, 1,
1.34537, 0.1457983, 3.063688, 1, 0, 0.6196079, 1,
1.346641, -1.31015, 1.375252, 1, 0, 0.6117647, 1,
1.348521, 0.5708663, 0.2540833, 1, 0, 0.6078432, 1,
1.350382, 0.5056939, 1.840358, 1, 0, 0.6, 1,
1.369761, -1.479371, 2.629723, 1, 0, 0.5921569, 1,
1.385502, -0.3294863, 2.365082, 1, 0, 0.5882353, 1,
1.387346, 0.8834087, 0.2565937, 1, 0, 0.5803922, 1,
1.394604, 0.2727045, 2.489096, 1, 0, 0.5764706, 1,
1.397403, 1.240143, 3.493419, 1, 0, 0.5686275, 1,
1.397435, -0.1507875, 1.558852, 1, 0, 0.5647059, 1,
1.405488, -0.8236979, 1.02998, 1, 0, 0.5568628, 1,
1.415731, 0.9886929, -0.09141506, 1, 0, 0.5529412, 1,
1.423535, 0.1567309, 0.402327, 1, 0, 0.5450981, 1,
1.424235, -1.460212, 1.504938, 1, 0, 0.5411765, 1,
1.425073, 0.3634826, 2.357139, 1, 0, 0.5333334, 1,
1.425198, -0.9751627, 1.340684, 1, 0, 0.5294118, 1,
1.426649, -0.4863987, 2.30237, 1, 0, 0.5215687, 1,
1.429183, -0.9244972, 3.043127, 1, 0, 0.5176471, 1,
1.446981, -1.038247, 2.367623, 1, 0, 0.509804, 1,
1.450877, 0.01246184, 1.691067, 1, 0, 0.5058824, 1,
1.453648, -1.175488, 4.45334, 1, 0, 0.4980392, 1,
1.463979, -0.6296006, -0.6428019, 1, 0, 0.4901961, 1,
1.471506, -2.053508, 2.718167, 1, 0, 0.4862745, 1,
1.48202, 0.9897162, 0.6933993, 1, 0, 0.4784314, 1,
1.482488, 0.482061, 1.598523, 1, 0, 0.4745098, 1,
1.48686, 0.3096034, -0.3635821, 1, 0, 0.4666667, 1,
1.49833, 1.32387, 2.091846, 1, 0, 0.4627451, 1,
1.499012, -0.3986529, 0.7997177, 1, 0, 0.454902, 1,
1.502266, 0.6073236, -0.6569865, 1, 0, 0.4509804, 1,
1.503577, 1.831244, 0.9930285, 1, 0, 0.4431373, 1,
1.50932, 1.097209, 2.60322, 1, 0, 0.4392157, 1,
1.511, 0.3572638, 2.120205, 1, 0, 0.4313726, 1,
1.520725, -1.717197, 2.688029, 1, 0, 0.427451, 1,
1.545069, -1.021482, 2.6167, 1, 0, 0.4196078, 1,
1.564388, -0.1942786, 3.034615, 1, 0, 0.4156863, 1,
1.576834, 0.8411813, 2.665966, 1, 0, 0.4078431, 1,
1.583669, -0.8028606, 2.627335, 1, 0, 0.4039216, 1,
1.591181, 0.6573007, 2.606348, 1, 0, 0.3960784, 1,
1.597397, -1.693074, 1.979135, 1, 0, 0.3882353, 1,
1.601078, -0.1835577, 2.212429, 1, 0, 0.3843137, 1,
1.604792, 1.297448, 1.550081, 1, 0, 0.3764706, 1,
1.612731, -1.492244, 1.692106, 1, 0, 0.372549, 1,
1.633306, -0.2981744, 2.73926, 1, 0, 0.3647059, 1,
1.633713, -0.93467, 2.024772, 1, 0, 0.3607843, 1,
1.639113, -0.4654948, 0.7975928, 1, 0, 0.3529412, 1,
1.640957, -0.898401, 2.794039, 1, 0, 0.3490196, 1,
1.661744, -0.3907183, 2.33912, 1, 0, 0.3411765, 1,
1.662252, -0.6331343, 2.807404, 1, 0, 0.3372549, 1,
1.664573, 0.4957554, 0.4829781, 1, 0, 0.3294118, 1,
1.685744, 0.4850908, 0.6682239, 1, 0, 0.3254902, 1,
1.690069, 0.8491626, -0.3586883, 1, 0, 0.3176471, 1,
1.691966, -0.1905707, -1.510964, 1, 0, 0.3137255, 1,
1.694545, 0.2848608, 2.970286, 1, 0, 0.3058824, 1,
1.706205, -0.4509822, 3.090795, 1, 0, 0.2980392, 1,
1.717368, -0.3526714, 1.984436, 1, 0, 0.2941177, 1,
1.737178, -0.06609087, 1.71851, 1, 0, 0.2862745, 1,
1.742658, 0.6540399, 0.3555253, 1, 0, 0.282353, 1,
1.768925, 0.1523997, 0.3349988, 1, 0, 0.2745098, 1,
1.784842, 1.059092, 0.6677317, 1, 0, 0.2705882, 1,
1.791782, 1.411995, 0.2133324, 1, 0, 0.2627451, 1,
1.797531, 0.1162805, 1.337963, 1, 0, 0.2588235, 1,
1.801667, -0.01175518, 0.9073051, 1, 0, 0.2509804, 1,
1.803746, -0.4919873, 2.230096, 1, 0, 0.2470588, 1,
1.823705, -0.2318869, 2.521727, 1, 0, 0.2392157, 1,
1.829, -0.1161092, 1.378327, 1, 0, 0.2352941, 1,
1.834977, 0.5994333, 0.6516451, 1, 0, 0.227451, 1,
1.840071, 1.287957, -0.6244957, 1, 0, 0.2235294, 1,
1.85845, -1.970527, 3.073366, 1, 0, 0.2156863, 1,
1.876793, -0.3100742, 1.23471, 1, 0, 0.2117647, 1,
1.884058, 0.1865008, 0.01711144, 1, 0, 0.2039216, 1,
1.90939, 0.4718603, 1.32834, 1, 0, 0.1960784, 1,
1.931892, 1.724311, -0.3989522, 1, 0, 0.1921569, 1,
1.935808, 0.3018528, 0.6278203, 1, 0, 0.1843137, 1,
1.943503, 1.469617, 1.703655, 1, 0, 0.1803922, 1,
1.946306, 0.06573495, 3.974803, 1, 0, 0.172549, 1,
1.9563, 0.4803402, 0.7139755, 1, 0, 0.1686275, 1,
1.980125, 2.13014, 1.985821, 1, 0, 0.1607843, 1,
1.990381, -1.337443, -0.721127, 1, 0, 0.1568628, 1,
2.002534, 1.420384, 1.633837, 1, 0, 0.1490196, 1,
2.013656, 0.03357698, 0.1892792, 1, 0, 0.145098, 1,
2.019917, 0.2545158, 0.1381757, 1, 0, 0.1372549, 1,
2.042768, -0.9403152, 2.956013, 1, 0, 0.1333333, 1,
2.062238, 0.3033138, 1.396815, 1, 0, 0.1254902, 1,
2.066194, -0.04027991, 4.781754, 1, 0, 0.1215686, 1,
2.073172, -0.2086616, 1.783424, 1, 0, 0.1137255, 1,
2.098182, 0.5973358, 1.763395, 1, 0, 0.1098039, 1,
2.14545, -0.1909971, 1.398579, 1, 0, 0.1019608, 1,
2.150156, 0.895442, 0.7933604, 1, 0, 0.09411765, 1,
2.162536, -1.968517, 2.96552, 1, 0, 0.09019608, 1,
2.170609, 0.4256823, 2.278151, 1, 0, 0.08235294, 1,
2.196708, -0.07412029, 1.320256, 1, 0, 0.07843138, 1,
2.197207, 0.9462709, 0.4851557, 1, 0, 0.07058824, 1,
2.223807, -2.492763, 4.541617, 1, 0, 0.06666667, 1,
2.322318, -1.541809, 2.001507, 1, 0, 0.05882353, 1,
2.436679, -0.2119059, 2.993054, 1, 0, 0.05490196, 1,
2.452145, 1.892732, 0.3999562, 1, 0, 0.04705882, 1,
2.683048, -1.275943, 2.783551, 1, 0, 0.04313726, 1,
2.707218, -0.2255192, 0.9828091, 1, 0, 0.03529412, 1,
2.72199, -1.160848, 2.580331, 1, 0, 0.03137255, 1,
2.722213, 0.6530036, 1.467886, 1, 0, 0.02352941, 1,
2.993265, 0.002781249, 1.871312, 1, 0, 0.01960784, 1,
3.019649, 0.5055472, 1.318519, 1, 0, 0.01176471, 1,
3.315367, -0.2167104, 1.283229, 1, 0, 0.007843138, 1
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
-0.1770878, -4.414255, -7.574765, 0, -0.5, 0.5, 0.5,
-0.1770878, -4.414255, -7.574765, 1, -0.5, 0.5, 0.5,
-0.1770878, -4.414255, -7.574765, 1, 1.5, 0.5, 0.5,
-0.1770878, -4.414255, -7.574765, 0, 1.5, 0.5, 0.5
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
-4.853485, -0.1216725, -7.574765, 0, -0.5, 0.5, 0.5,
-4.853485, -0.1216725, -7.574765, 1, -0.5, 0.5, 0.5,
-4.853485, -0.1216725, -7.574765, 1, 1.5, 0.5, 0.5,
-4.853485, -0.1216725, -7.574765, 0, 1.5, 0.5, 0.5
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
-4.853485, -4.414255, -0.09389353, 0, -0.5, 0.5, 0.5,
-4.853485, -4.414255, -0.09389353, 1, -0.5, 0.5, 0.5,
-4.853485, -4.414255, -0.09389353, 1, 1.5, 0.5, 0.5,
-4.853485, -4.414255, -0.09389353, 0, 1.5, 0.5, 0.5
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
-3, -3.423659, -5.84841,
3, -3.423659, -5.84841,
-3, -3.423659, -5.84841,
-3, -3.588758, -6.136136,
-2, -3.423659, -5.84841,
-2, -3.588758, -6.136136,
-1, -3.423659, -5.84841,
-1, -3.588758, -6.136136,
0, -3.423659, -5.84841,
0, -3.588758, -6.136136,
1, -3.423659, -5.84841,
1, -3.588758, -6.136136,
2, -3.423659, -5.84841,
2, -3.588758, -6.136136,
3, -3.423659, -5.84841,
3, -3.588758, -6.136136
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
-3, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
-3, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
-3, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
-3, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
-2, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
-2, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
-2, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
-2, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
-1, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
-1, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
-1, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
-1, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
0, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
0, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
0, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
0, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
1, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
1, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
1, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
1, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
2, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
2, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
2, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
2, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5,
3, -3.918957, -6.711587, 0, -0.5, 0.5, 0.5,
3, -3.918957, -6.711587, 1, -0.5, 0.5, 0.5,
3, -3.918957, -6.711587, 1, 1.5, 0.5, 0.5,
3, -3.918957, -6.711587, 0, 1.5, 0.5, 0.5
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
-3.774317, -3, -5.84841,
-3.774317, 3, -5.84841,
-3.774317, -3, -5.84841,
-3.954178, -3, -6.136136,
-3.774317, -2, -5.84841,
-3.954178, -2, -6.136136,
-3.774317, -1, -5.84841,
-3.954178, -1, -6.136136,
-3.774317, 0, -5.84841,
-3.954178, 0, -6.136136,
-3.774317, 1, -5.84841,
-3.954178, 1, -6.136136,
-3.774317, 2, -5.84841,
-3.954178, 2, -6.136136,
-3.774317, 3, -5.84841,
-3.954178, 3, -6.136136
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
-4.313901, -3, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, -3, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, -3, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, -3, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, -2, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, -2, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, -2, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, -2, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, -1, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, -1, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, -1, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, -1, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, 0, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, 0, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, 0, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, 0, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, 1, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, 1, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, 1, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, 1, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, 2, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, 2, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, 2, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, 2, -6.711587, 0, 1.5, 0.5, 0.5,
-4.313901, 3, -6.711587, 0, -0.5, 0.5, 0.5,
-4.313901, 3, -6.711587, 1, -0.5, 0.5, 0.5,
-4.313901, 3, -6.711587, 1, 1.5, 0.5, 0.5,
-4.313901, 3, -6.711587, 0, 1.5, 0.5, 0.5
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
-3.774317, -3.423659, -4,
-3.774317, -3.423659, 4,
-3.774317, -3.423659, -4,
-3.954178, -3.588758, -4,
-3.774317, -3.423659, -2,
-3.954178, -3.588758, -2,
-3.774317, -3.423659, 0,
-3.954178, -3.588758, 0,
-3.774317, -3.423659, 2,
-3.954178, -3.588758, 2,
-3.774317, -3.423659, 4,
-3.954178, -3.588758, 4
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
-4.313901, -3.918957, -4, 0, -0.5, 0.5, 0.5,
-4.313901, -3.918957, -4, 1, -0.5, 0.5, 0.5,
-4.313901, -3.918957, -4, 1, 1.5, 0.5, 0.5,
-4.313901, -3.918957, -4, 0, 1.5, 0.5, 0.5,
-4.313901, -3.918957, -2, 0, -0.5, 0.5, 0.5,
-4.313901, -3.918957, -2, 1, -0.5, 0.5, 0.5,
-4.313901, -3.918957, -2, 1, 1.5, 0.5, 0.5,
-4.313901, -3.918957, -2, 0, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 0, 0, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 0, 1, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 0, 1, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 0, 0, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 2, 0, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 2, 1, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 2, 1, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 2, 0, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 4, 0, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 4, 1, -0.5, 0.5, 0.5,
-4.313901, -3.918957, 4, 1, 1.5, 0.5, 0.5,
-4.313901, -3.918957, 4, 0, 1.5, 0.5, 0.5
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
-3.774317, -3.423659, -5.84841,
-3.774317, 3.180314, -5.84841,
-3.774317, -3.423659, 5.660623,
-3.774317, 3.180314, 5.660623,
-3.774317, -3.423659, -5.84841,
-3.774317, -3.423659, 5.660623,
-3.774317, 3.180314, -5.84841,
-3.774317, 3.180314, 5.660623,
-3.774317, -3.423659, -5.84841,
3.420141, -3.423659, -5.84841,
-3.774317, -3.423659, 5.660623,
3.420141, -3.423659, 5.660623,
-3.774317, 3.180314, -5.84841,
3.420141, 3.180314, -5.84841,
-3.774317, 3.180314, 5.660623,
3.420141, 3.180314, 5.660623,
3.420141, -3.423659, -5.84841,
3.420141, 3.180314, -5.84841,
3.420141, -3.423659, 5.660623,
3.420141, 3.180314, 5.660623,
3.420141, -3.423659, -5.84841,
3.420141, -3.423659, 5.660623,
3.420141, 3.180314, -5.84841,
3.420141, 3.180314, 5.660623
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
var radius = 8.059933;
var distance = 35.85955;
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
mvMatrix.translate( 0.1770878, 0.1216725, 0.09389353 );
mvMatrix.scale( 1.211288, 1.319593, 0.7571928 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85955);
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
1-Chlorpropan<-read.table("1-Chlorpropan.xyz")
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
-3.669543, -0.002309276, -2.033026, 0, 0, 1, 1, 1,
-3.164425, -1.480467, -1.539336, 1, 0, 0, 1, 1,
-2.823959, -1.529161, -1.967022, 1, 0, 0, 1, 1,
-2.809434, -0.8119463, -1.525511, 1, 0, 0, 1, 1,
-2.658897, -1.077727, -1.749064, 1, 0, 0, 1, 1,
-2.572026, -0.2133622, -1.600863, 1, 0, 0, 1, 1,
-2.551702, -0.658976, -1.781255, 0, 0, 0, 1, 1,
-2.531303, -0.3475933, -0.5181172, 0, 0, 0, 1, 1,
-2.521286, 0.2436789, -1.224151, 0, 0, 0, 1, 1,
-2.472633, -2.000558, -1.821572, 0, 0, 0, 1, 1,
-2.469824, -0.3470669, -2.094553, 0, 0, 0, 1, 1,
-2.434442, 0.59969, -1.92174, 0, 0, 0, 1, 1,
-2.39645, -0.6879395, -2.570187, 0, 0, 0, 1, 1,
-2.345067, -0.4499081, -2.126647, 1, 1, 1, 1, 1,
-2.267279, 0.8884741, -3.031329, 1, 1, 1, 1, 1,
-2.248556, 0.6311889, -2.032199, 1, 1, 1, 1, 1,
-2.227902, -0.7600633, -0.9137874, 1, 1, 1, 1, 1,
-2.206903, 0.2264567, -1.35189, 1, 1, 1, 1, 1,
-2.183556, 0.8747242, -0.5752791, 1, 1, 1, 1, 1,
-2.155661, 0.2925508, -1.70659, 1, 1, 1, 1, 1,
-2.155259, 0.7477393, -1.228587, 1, 1, 1, 1, 1,
-2.145453, -0.3907124, -2.574405, 1, 1, 1, 1, 1,
-2.07115, 0.4576469, -2.497815, 1, 1, 1, 1, 1,
-2.03045, -0.4789376, -1.565985, 1, 1, 1, 1, 1,
-2.019303, -0.7863083, -0.8618217, 1, 1, 1, 1, 1,
-1.969101, -0.6367337, -1.663952, 1, 1, 1, 1, 1,
-1.968402, -2.203014, -2.15384, 1, 1, 1, 1, 1,
-1.963398, -0.6263484, -2.530481, 1, 1, 1, 1, 1,
-1.951424, -0.7833183, -0.8461212, 0, 0, 1, 1, 1,
-1.949876, 1.706677, 0.6098293, 1, 0, 0, 1, 1,
-1.94784, -0.05338356, -2.268931, 1, 0, 0, 1, 1,
-1.929636, 0.5793688, -1.259236, 1, 0, 0, 1, 1,
-1.926684, 0.475551, -1.375762, 1, 0, 0, 1, 1,
-1.913877, -1.627646, -2.535578, 1, 0, 0, 1, 1,
-1.908103, 2.432252, 0.2039407, 0, 0, 0, 1, 1,
-1.905256, -1.506526, -1.100888, 0, 0, 0, 1, 1,
-1.889762, 1.132746, -3.712031, 0, 0, 0, 1, 1,
-1.853827, 0.2416144, -1.156211, 0, 0, 0, 1, 1,
-1.844945, 1.077569, -1.199575, 0, 0, 0, 1, 1,
-1.8433, -1.359575, -1.05908, 0, 0, 0, 1, 1,
-1.840822, -0.4219783, -2.312666, 0, 0, 0, 1, 1,
-1.830052, 0.2655983, -0.2526338, 1, 1, 1, 1, 1,
-1.792108, 0.01954829, 1.809651, 1, 1, 1, 1, 1,
-1.791086, -0.7173582, -2.044848, 1, 1, 1, 1, 1,
-1.757267, -0.5257471, -3.369112, 1, 1, 1, 1, 1,
-1.733591, 0.1727857, -1.084564, 1, 1, 1, 1, 1,
-1.7212, 0.1033284, -2.152955, 1, 1, 1, 1, 1,
-1.703346, -0.150468, -1.048253, 1, 1, 1, 1, 1,
-1.689874, -1.091192, -1.564029, 1, 1, 1, 1, 1,
-1.689674, -0.3371816, -2.342009, 1, 1, 1, 1, 1,
-1.682306, -1.314513, 0.03019354, 1, 1, 1, 1, 1,
-1.67303, 0.4120902, -2.041182, 1, 1, 1, 1, 1,
-1.654738, -0.7554364, -3.790474, 1, 1, 1, 1, 1,
-1.651592, -2.396493, -1.916167, 1, 1, 1, 1, 1,
-1.642726, 1.415513, -0.4839694, 1, 1, 1, 1, 1,
-1.605612, 1.120795, -0.2948139, 1, 1, 1, 1, 1,
-1.605414, -0.8913292, 0.01486374, 0, 0, 1, 1, 1,
-1.587604, -0.7855753, -2.401682, 1, 0, 0, 1, 1,
-1.57537, 0.2893972, -0.9715832, 1, 0, 0, 1, 1,
-1.571526, -0.1581201, -1.174597, 1, 0, 0, 1, 1,
-1.563831, -0.9731503, -3.1729, 1, 0, 0, 1, 1,
-1.562178, -0.1369607, -0.7404388, 1, 0, 0, 1, 1,
-1.548878, 0.214923, -1.573336, 0, 0, 0, 1, 1,
-1.548737, 1.04232, -0.9952152, 0, 0, 0, 1, 1,
-1.538652, -0.4364943, -2.962186, 0, 0, 0, 1, 1,
-1.52574, 0.6749347, -0.9150722, 0, 0, 0, 1, 1,
-1.488364, -0.7896943, -1.815123, 0, 0, 0, 1, 1,
-1.482119, 0.6224421, -1.560313, 0, 0, 0, 1, 1,
-1.478297, -1.763602, -2.731017, 0, 0, 0, 1, 1,
-1.467776, 0.3584195, -1.414381, 1, 1, 1, 1, 1,
-1.455067, 2.279908, -1.500261, 1, 1, 1, 1, 1,
-1.446552, 1.663506, -1.677906, 1, 1, 1, 1, 1,
-1.441981, -0.3139273, -2.226921, 1, 1, 1, 1, 1,
-1.440316, 0.5104849, -3.254632, 1, 1, 1, 1, 1,
-1.440115, 0.3020917, -1.817396, 1, 1, 1, 1, 1,
-1.437389, -0.6858542, -2.425691, 1, 1, 1, 1, 1,
-1.43405, 1.384157, -2.594934, 1, 1, 1, 1, 1,
-1.414905, -0.6145301, -3.589651, 1, 1, 1, 1, 1,
-1.40995, -1.192888, -3.635108, 1, 1, 1, 1, 1,
-1.408496, 0.3262261, -1.243084, 1, 1, 1, 1, 1,
-1.39546, -1.345152, -2.125329, 1, 1, 1, 1, 1,
-1.39244, -0.8670825, -2.789361, 1, 1, 1, 1, 1,
-1.389032, -1.544378, -3.054609, 1, 1, 1, 1, 1,
-1.388967, 1.402358, -2.350872, 1, 1, 1, 1, 1,
-1.381179, 1.382932, 0.05598559, 0, 0, 1, 1, 1,
-1.380399, -0.2663947, -2.652944, 1, 0, 0, 1, 1,
-1.366004, -0.9408549, -2.616961, 1, 0, 0, 1, 1,
-1.331257, -0.3149445, -2.058847, 1, 0, 0, 1, 1,
-1.330939, -0.8790063, -2.476833, 1, 0, 0, 1, 1,
-1.329947, 0.03944783, -1.820049, 1, 0, 0, 1, 1,
-1.324898, 0.5144044, -2.574563, 0, 0, 0, 1, 1,
-1.311578, 1.332769, -1.715428, 0, 0, 0, 1, 1,
-1.307818, -0.07768374, -1.585447, 0, 0, 0, 1, 1,
-1.307371, 0.2109319, -1.568729, 0, 0, 0, 1, 1,
-1.306004, -1.278974, -1.973543, 0, 0, 0, 1, 1,
-1.303432, -0.5143683, -1.677263, 0, 0, 0, 1, 1,
-1.300007, 0.5271705, -0.9138817, 0, 0, 0, 1, 1,
-1.296445, 0.5509478, -0.5740218, 1, 1, 1, 1, 1,
-1.271473, 0.05817724, -0.8402348, 1, 1, 1, 1, 1,
-1.263829, 0.1846325, -1.858208, 1, 1, 1, 1, 1,
-1.260172, -0.007841773, -2.482091, 1, 1, 1, 1, 1,
-1.25265, 0.6474161, -0.7058672, 1, 1, 1, 1, 1,
-1.233889, 0.20645, -2.32444, 1, 1, 1, 1, 1,
-1.233558, 0.5287172, -0.9885681, 1, 1, 1, 1, 1,
-1.229668, -1.827247, -1.779596, 1, 1, 1, 1, 1,
-1.229637, -0.1857565, -2.526326, 1, 1, 1, 1, 1,
-1.229005, 2.37161, 0.3569246, 1, 1, 1, 1, 1,
-1.228683, 0.2659538, -2.350263, 1, 1, 1, 1, 1,
-1.227548, -0.4159816, -1.880304, 1, 1, 1, 1, 1,
-1.227053, -0.5946022, -0.9044195, 1, 1, 1, 1, 1,
-1.226696, 1.123346, -0.8179705, 1, 1, 1, 1, 1,
-1.222754, -0.94223, -1.32329, 1, 1, 1, 1, 1,
-1.220824, 0.2105865, -0.6996795, 0, 0, 1, 1, 1,
-1.21724, 0.9512701, -0.6575014, 1, 0, 0, 1, 1,
-1.212967, 1.176886, -2.603668, 1, 0, 0, 1, 1,
-1.198492, 0.3074418, -0.8554105, 1, 0, 0, 1, 1,
-1.184083, -2.604244, -3.570188, 1, 0, 0, 1, 1,
-1.155512, 0.8673338, 0.7917948, 1, 0, 0, 1, 1,
-1.154064, 0.2037535, -0.716253, 0, 0, 0, 1, 1,
-1.153916, -1.630016, -2.765786, 0, 0, 0, 1, 1,
-1.151506, 1.053277, -0.5699465, 0, 0, 0, 1, 1,
-1.148902, -0.6710212, -2.959508, 0, 0, 0, 1, 1,
-1.125062, 0.1573587, -1.136233, 0, 0, 0, 1, 1,
-1.123714, 0.1264169, -2.039036, 0, 0, 0, 1, 1,
-1.107837, 0.5786417, -2.106233, 0, 0, 0, 1, 1,
-1.104856, 0.2332359, -1.282562, 1, 1, 1, 1, 1,
-1.100743, -0.8380617, -1.454083, 1, 1, 1, 1, 1,
-1.098287, -0.1592361, -1.484693, 1, 1, 1, 1, 1,
-1.09508, 0.2749491, -1.594196, 1, 1, 1, 1, 1,
-1.083457, -0.352422, -1.986433, 1, 1, 1, 1, 1,
-1.074138, -2.469831, -1.037632, 1, 1, 1, 1, 1,
-1.069701, -0.03624678, -2.376989, 1, 1, 1, 1, 1,
-1.067069, -1.277736, -3.448996, 1, 1, 1, 1, 1,
-1.060031, 0.6466448, -0.766112, 1, 1, 1, 1, 1,
-1.05557, 0.2754333, -1.99465, 1, 1, 1, 1, 1,
-1.054306, 1.476581, -0.6104276, 1, 1, 1, 1, 1,
-1.042897, -1.44397, -2.736264, 1, 1, 1, 1, 1,
-1.040097, -1.451896, -1.002397, 1, 1, 1, 1, 1,
-1.029349, -0.6945428, -0.7412488, 1, 1, 1, 1, 1,
-1.028387, -1.298582, -1.48055, 1, 1, 1, 1, 1,
-1.024283, 0.6679465, -1.357233, 0, 0, 1, 1, 1,
-1.012161, 1.869426, 0.6226882, 1, 0, 0, 1, 1,
-1.012074, -0.3789788, -0.5909305, 1, 0, 0, 1, 1,
-1.011165, 2.259456, -0.459655, 1, 0, 0, 1, 1,
-1.009412, 0.4237191, -0.5872737, 1, 0, 0, 1, 1,
-1.002188, -0.2600018, -2.455843, 1, 0, 0, 1, 1,
-1.001517, -2.825829, -1.654734, 0, 0, 0, 1, 1,
-0.9898294, -2.505887, -1.548469, 0, 0, 0, 1, 1,
-0.9817384, -0.2162808, 1.450612, 0, 0, 0, 1, 1,
-0.9817037, 1.157894, 0.2759604, 0, 0, 0, 1, 1,
-0.9775112, -0.4301922, -0.9999315, 0, 0, 0, 1, 1,
-0.977192, -1.904761, -3.823682, 0, 0, 0, 1, 1,
-0.9692389, 0.4669346, -3.780187, 0, 0, 0, 1, 1,
-0.9659214, -0.09244745, -2.943109, 1, 1, 1, 1, 1,
-0.959836, -1.18269, -2.557224, 1, 1, 1, 1, 1,
-0.9587148, -1.383925, -1.030664, 1, 1, 1, 1, 1,
-0.9563127, 0.6631395, 0.1835437, 1, 1, 1, 1, 1,
-0.9545566, -0.5038301, -3.590049, 1, 1, 1, 1, 1,
-0.9504656, 1.422893, -2.03661, 1, 1, 1, 1, 1,
-0.9503343, 0.4426208, -3.524386, 1, 1, 1, 1, 1,
-0.9487888, -1.406187, -2.664545, 1, 1, 1, 1, 1,
-0.9467874, 0.5297089, -1.472603, 1, 1, 1, 1, 1,
-0.9466028, 1.111647, -1.365869, 1, 1, 1, 1, 1,
-0.9437132, 1.4957, -0.6609178, 1, 1, 1, 1, 1,
-0.9428326, 1.520656, 0.287308, 1, 1, 1, 1, 1,
-0.9404334, -0.3460806, -1.62277, 1, 1, 1, 1, 1,
-0.9390287, -0.8818647, -3.348305, 1, 1, 1, 1, 1,
-0.936309, -0.3309388, -1.691451, 1, 1, 1, 1, 1,
-0.936071, 2.483882, -1.585461, 0, 0, 1, 1, 1,
-0.9356823, -2.143535, -1.056632, 1, 0, 0, 1, 1,
-0.9301736, 0.03334698, -2.760419, 1, 0, 0, 1, 1,
-0.9293057, -2.254576, -2.269955, 1, 0, 0, 1, 1,
-0.925562, 0.04404122, -1.639193, 1, 0, 0, 1, 1,
-0.9237435, -2.266362, -2.971847, 1, 0, 0, 1, 1,
-0.9186885, 0.4557807, -1.906937, 0, 0, 0, 1, 1,
-0.9153159, -1.399505, 0.2131442, 0, 0, 0, 1, 1,
-0.9110674, -0.865196, -2.044524, 0, 0, 0, 1, 1,
-0.9049759, 0.5797395, -1.997488, 0, 0, 0, 1, 1,
-0.8912237, 0.4533337, -2.307766, 0, 0, 0, 1, 1,
-0.8905372, -1.371445, -2.651314, 0, 0, 0, 1, 1,
-0.8879575, 0.4253888, 0.4142167, 0, 0, 0, 1, 1,
-0.8753986, -1.254784, -2.196686, 1, 1, 1, 1, 1,
-0.8668287, -0.1538558, -2.205824, 1, 1, 1, 1, 1,
-0.8654464, 0.09223495, -0.4807151, 1, 1, 1, 1, 1,
-0.8565226, 0.7410398, -1.62846, 1, 1, 1, 1, 1,
-0.8515774, 0.507892, -0.2459712, 1, 1, 1, 1, 1,
-0.8505384, -0.1323364, -1.444136, 1, 1, 1, 1, 1,
-0.8461437, 1.622253, -0.09306109, 1, 1, 1, 1, 1,
-0.8401695, 0.6969053, -0.985625, 1, 1, 1, 1, 1,
-0.8360094, -1.949433, -3.556703, 1, 1, 1, 1, 1,
-0.8317906, 0.5214846, -2.335302, 1, 1, 1, 1, 1,
-0.8242968, 0.2977843, -2.873494, 1, 1, 1, 1, 1,
-0.8238199, 0.7394853, -0.3894665, 1, 1, 1, 1, 1,
-0.8094574, -1.187759, -2.495264, 1, 1, 1, 1, 1,
-0.8078572, -0.2280377, -0.1551682, 1, 1, 1, 1, 1,
-0.788236, 1.568593, -0.6769885, 1, 1, 1, 1, 1,
-0.7872221, -2.38774, -3.688712, 0, 0, 1, 1, 1,
-0.786847, 0.4851286, -1.105781, 1, 0, 0, 1, 1,
-0.7868357, 0.879696, -2.090551, 1, 0, 0, 1, 1,
-0.785806, 0.8321538, -0.2436562, 1, 0, 0, 1, 1,
-0.7829961, -0.3423664, -3.457052, 1, 0, 0, 1, 1,
-0.7777701, -0.4866148, -1.807636, 1, 0, 0, 1, 1,
-0.7701842, 1.023646, -1.023521, 0, 0, 0, 1, 1,
-0.7674366, 0.7887329, -1.077297, 0, 0, 0, 1, 1,
-0.7626923, -0.2257362, -2.635377, 0, 0, 0, 1, 1,
-0.7601774, 0.2467778, -0.8925362, 0, 0, 0, 1, 1,
-0.7553458, -0.2936797, -3.087455, 0, 0, 0, 1, 1,
-0.7536763, -0.5063499, -2.487465, 0, 0, 0, 1, 1,
-0.7494481, 0.2400289, -0.9229901, 0, 0, 0, 1, 1,
-0.7414122, 1.288766, 0.6871496, 1, 1, 1, 1, 1,
-0.736175, -0.4925726, -3.015031, 1, 1, 1, 1, 1,
-0.732781, -0.7689701, -2.008083, 1, 1, 1, 1, 1,
-0.7322948, -0.3768681, -2.418108, 1, 1, 1, 1, 1,
-0.731836, -0.232039, -1.47889, 1, 1, 1, 1, 1,
-0.7299571, 0.9782425, 0.2113196, 1, 1, 1, 1, 1,
-0.7283357, -0.3324203, -2.007817, 1, 1, 1, 1, 1,
-0.7281246, -0.2868347, -3.513872, 1, 1, 1, 1, 1,
-0.7189713, 0.8963047, -0.4089333, 1, 1, 1, 1, 1,
-0.7152476, 0.4465054, 1.024615, 1, 1, 1, 1, 1,
-0.7147322, -0.6158726, -2.458224, 1, 1, 1, 1, 1,
-0.6990804, -0.7630554, -3.488565, 1, 1, 1, 1, 1,
-0.6946857, -0.891655, -5.025377, 1, 1, 1, 1, 1,
-0.683764, -1.221035, -4.321802, 1, 1, 1, 1, 1,
-0.6792588, 1.01543, 0.5606374, 1, 1, 1, 1, 1,
-0.6776248, -0.6122956, -1.456294, 0, 0, 1, 1, 1,
-0.6754912, -1.413203, -1.759285, 1, 0, 0, 1, 1,
-0.6669681, -1.697153, -2.903744, 1, 0, 0, 1, 1,
-0.6656994, -0.3438293, -1.174824, 1, 0, 0, 1, 1,
-0.6647525, -0.1389894, -1.373708, 1, 0, 0, 1, 1,
-0.6634063, 0.9811416, -1.56228, 1, 0, 0, 1, 1,
-0.6616879, -0.5411937, -2.908692, 0, 0, 0, 1, 1,
-0.6599201, 0.2663001, -0.8749422, 0, 0, 0, 1, 1,
-0.6525081, 1.383379, 0.1846104, 0, 0, 0, 1, 1,
-0.6517529, 0.2710559, 0.5807908, 0, 0, 0, 1, 1,
-0.6496032, -0.8235343, -2.745805, 0, 0, 0, 1, 1,
-0.6430765, -1.614654, -2.669939, 0, 0, 0, 1, 1,
-0.6402453, 1.527066, 0.687951, 0, 0, 0, 1, 1,
-0.6385747, 0.199379, -3.171982, 1, 1, 1, 1, 1,
-0.6378585, 2.485909, -1.944321, 1, 1, 1, 1, 1,
-0.6338621, 1.310825, -0.4814556, 1, 1, 1, 1, 1,
-0.6324106, 0.4943471, -1.117929, 1, 1, 1, 1, 1,
-0.6317548, 1.433668, -0.7329605, 1, 1, 1, 1, 1,
-0.6312727, -1.794255, -3.35576, 1, 1, 1, 1, 1,
-0.6266784, -0.3530108, -3.087378, 1, 1, 1, 1, 1,
-0.6245511, -0.1186266, -2.883123, 1, 1, 1, 1, 1,
-0.6234857, 1.002348, -0.8815545, 1, 1, 1, 1, 1,
-0.6201566, 1.571526, 0.398169, 1, 1, 1, 1, 1,
-0.620063, 0.03256562, -1.237122, 1, 1, 1, 1, 1,
-0.619455, -1.410984, -2.737392, 1, 1, 1, 1, 1,
-0.6066249, -1.365142, -4.009121, 1, 1, 1, 1, 1,
-0.6047514, -0.2162285, -1.596082, 1, 1, 1, 1, 1,
-0.6021578, -1.852562, -1.949951, 1, 1, 1, 1, 1,
-0.6008131, 0.7817883, 0.6110123, 0, 0, 1, 1, 1,
-0.5982587, -1.860921, -3.886979, 1, 0, 0, 1, 1,
-0.5958718, 1.820272, 0.2247891, 1, 0, 0, 1, 1,
-0.5951383, 0.5138064, -0.9625766, 1, 0, 0, 1, 1,
-0.5843154, 0.8989685, -1.228488, 1, 0, 0, 1, 1,
-0.5835426, 0.7670773, -1.377626, 1, 0, 0, 1, 1,
-0.581747, 0.4073597, -1.410768, 0, 0, 0, 1, 1,
-0.5810022, -0.9955618, -1.764156, 0, 0, 0, 1, 1,
-0.5800334, -0.009100878, -3.099263, 0, 0, 0, 1, 1,
-0.5785319, -2.346975, -4.28142, 0, 0, 0, 1, 1,
-0.5780029, -0.8202634, -1.244605, 0, 0, 0, 1, 1,
-0.5672846, -1.930463, -3.231133, 0, 0, 0, 1, 1,
-0.5671118, -0.04265524, -0.1684196, 0, 0, 0, 1, 1,
-0.5652475, 0.7312828, -0.7975304, 1, 1, 1, 1, 1,
-0.5643656, 0.444138, -1.344419, 1, 1, 1, 1, 1,
-0.5615482, -1.025547, -1.996166, 1, 1, 1, 1, 1,
-0.5595868, 1.039501, -0.4249623, 1, 1, 1, 1, 1,
-0.5549762, 1.066298, -1.605198, 1, 1, 1, 1, 1,
-0.5546103, 0.05755146, -1.749753, 1, 1, 1, 1, 1,
-0.554451, 0.49855, -0.2318553, 1, 1, 1, 1, 1,
-0.552693, -0.9783705, -1.138377, 1, 1, 1, 1, 1,
-0.5512307, 0.2122618, -1.084876, 1, 1, 1, 1, 1,
-0.5504417, 1.38186, 0.3033673, 1, 1, 1, 1, 1,
-0.5486507, -2.086592, -1.676843, 1, 1, 1, 1, 1,
-0.5483086, -2.943488, -0.9980474, 1, 1, 1, 1, 1,
-0.5458566, 0.9285637, -0.2081829, 1, 1, 1, 1, 1,
-0.5451287, 0.5170593, -1.101246, 1, 1, 1, 1, 1,
-0.5445567, -0.7946929, -3.151072, 1, 1, 1, 1, 1,
-0.5445054, -0.9105462, -4.05107, 0, 0, 1, 1, 1,
-0.5436656, -0.7880353, -2.041653, 1, 0, 0, 1, 1,
-0.5408171, -0.123229, -2.151606, 1, 0, 0, 1, 1,
-0.5407798, 1.102463, -0.2971758, 1, 0, 0, 1, 1,
-0.5387504, 0.1683246, -0.7907951, 1, 0, 0, 1, 1,
-0.5247459, -0.25275, -2.140706, 1, 0, 0, 1, 1,
-0.5238784, 1.22972, -0.8779545, 0, 0, 0, 1, 1,
-0.5184548, -0.4603567, -1.936381, 0, 0, 0, 1, 1,
-0.5174949, 1.484702, 0.76556, 0, 0, 0, 1, 1,
-0.5143041, 0.02903451, -0.8486914, 0, 0, 0, 1, 1,
-0.5133223, 0.5698875, -1.133141, 0, 0, 0, 1, 1,
-0.5125245, 0.4525662, -1.470393, 0, 0, 0, 1, 1,
-0.5116407, -0.551065, -1.554748, 0, 0, 0, 1, 1,
-0.5113321, -0.2898418, -3.057232, 1, 1, 1, 1, 1,
-0.5100303, -0.5519632, -4.393592, 1, 1, 1, 1, 1,
-0.5065649, -0.8961675, -2.434502, 1, 1, 1, 1, 1,
-0.5060722, -0.8811919, -1.536325, 1, 1, 1, 1, 1,
-0.5053988, 0.2076394, -1.72666, 1, 1, 1, 1, 1,
-0.4971023, 0.4479782, 0.9152994, 1, 1, 1, 1, 1,
-0.4956137, -2.149514, -4.689255, 1, 1, 1, 1, 1,
-0.4890938, 1.410361, -0.47608, 1, 1, 1, 1, 1,
-0.4853227, -0.2463834, -1.362549, 1, 1, 1, 1, 1,
-0.4837197, 0.5858501, 0.8344621, 1, 1, 1, 1, 1,
-0.4833527, 0.118534, -1.838084, 1, 1, 1, 1, 1,
-0.4833438, -1.970196, -2.597053, 1, 1, 1, 1, 1,
-0.4796797, 0.940544, -0.594139, 1, 1, 1, 1, 1,
-0.4716373, 0.903941, 0.6038116, 1, 1, 1, 1, 1,
-0.4711428, -0.5384762, -1.58038, 1, 1, 1, 1, 1,
-0.4702762, 0.5671039, -0.05783479, 0, 0, 1, 1, 1,
-0.4567634, -0.3729495, -0.6348855, 1, 0, 0, 1, 1,
-0.4492269, -1.414, -1.816406, 1, 0, 0, 1, 1,
-0.4478885, 0.5005735, -2.825066, 1, 0, 0, 1, 1,
-0.4467256, -0.6646582, -2.425457, 1, 0, 0, 1, 1,
-0.4418874, -0.2248652, -1.303429, 1, 0, 0, 1, 1,
-0.4417289, -0.0658756, -1.80398, 0, 0, 0, 1, 1,
-0.4402164, 0.5318343, -0.8916841, 0, 0, 0, 1, 1,
-0.4384933, 0.2392245, -2.444228, 0, 0, 0, 1, 1,
-0.4363893, -1.664541, -3.006488, 0, 0, 0, 1, 1,
-0.4356883, 0.7260271, -1.750142, 0, 0, 0, 1, 1,
-0.43417, 1.43856, -0.5159486, 0, 0, 0, 1, 1,
-0.4296621, -0.07622232, -0.956499, 0, 0, 0, 1, 1,
-0.4282892, -1.951286, -2.768853, 1, 1, 1, 1, 1,
-0.4267981, 1.332196, -1.042367, 1, 1, 1, 1, 1,
-0.4266424, -0.1371162, -2.704534, 1, 1, 1, 1, 1,
-0.4256832, -0.307649, -2.011725, 1, 1, 1, 1, 1,
-0.4241551, 0.3402313, -1.635667, 1, 1, 1, 1, 1,
-0.4234064, 0.6749324, -1.355365, 1, 1, 1, 1, 1,
-0.4212744, -0.4727357, -5.680803, 1, 1, 1, 1, 1,
-0.4163609, 0.0374213, -1.16045, 1, 1, 1, 1, 1,
-0.4145312, 1.354235, -1.488533, 1, 1, 1, 1, 1,
-0.4095883, -0.2086335, -2.880846, 1, 1, 1, 1, 1,
-0.407936, 0.08268307, -2.005254, 1, 1, 1, 1, 1,
-0.4067927, -0.7868662, -3.780283, 1, 1, 1, 1, 1,
-0.4053162, -0.8592538, -1.854498, 1, 1, 1, 1, 1,
-0.403918, -0.913597, -3.85893, 1, 1, 1, 1, 1,
-0.4036826, -1.022871, -1.580339, 1, 1, 1, 1, 1,
-0.4031506, 1.872117, -1.502016, 0, 0, 1, 1, 1,
-0.4013233, -0.5177779, -2.908394, 1, 0, 0, 1, 1,
-0.4007748, 0.8895413, 0.3890619, 1, 0, 0, 1, 1,
-0.394837, -0.4208684, -2.144105, 1, 0, 0, 1, 1,
-0.3935162, -1.135434, -2.776202, 1, 0, 0, 1, 1,
-0.3929296, -2.031, -3.607674, 1, 0, 0, 1, 1,
-0.3897633, 0.3888976, -0.1285176, 0, 0, 0, 1, 1,
-0.3884275, 0.5300996, -0.9259337, 0, 0, 0, 1, 1,
-0.3791692, 0.3289405, -0.5045776, 0, 0, 0, 1, 1,
-0.37522, -0.3695235, -1.183009, 0, 0, 0, 1, 1,
-0.3729106, -1.437392, -3.641491, 0, 0, 0, 1, 1,
-0.3708878, 1.261237, -1.638111, 0, 0, 0, 1, 1,
-0.3677927, -1.19447, -4.1261, 0, 0, 0, 1, 1,
-0.3619899, -1.071939, -4.433593, 1, 1, 1, 1, 1,
-0.3602524, -0.3731319, -1.89964, 1, 1, 1, 1, 1,
-0.3599944, 0.6835883, -0.6450164, 1, 1, 1, 1, 1,
-0.3584628, -0.7945473, -1.755769, 1, 1, 1, 1, 1,
-0.3582916, 1.467852, -1.089401, 1, 1, 1, 1, 1,
-0.3531941, 0.6801322, 0.1512822, 1, 1, 1, 1, 1,
-0.3529781, -0.1554099, -2.697, 1, 1, 1, 1, 1,
-0.3502385, -1.00319, -1.980446, 1, 1, 1, 1, 1,
-0.3478713, 0.09653921, -0.9076813, 1, 1, 1, 1, 1,
-0.3427911, 0.6335304, 0.7779239, 1, 1, 1, 1, 1,
-0.3410858, -1.021481, -3.805467, 1, 1, 1, 1, 1,
-0.3395051, 0.1081896, -2.132766, 1, 1, 1, 1, 1,
-0.338952, 0.1181382, -0.6137246, 1, 1, 1, 1, 1,
-0.338869, -0.8718159, -2.141838, 1, 1, 1, 1, 1,
-0.3356288, -0.3683704, -1.688827, 1, 1, 1, 1, 1,
-0.3273881, 0.6239545, -0.1585648, 0, 0, 1, 1, 1,
-0.3233012, 1.247653, 1.157846, 1, 0, 0, 1, 1,
-0.319916, 0.08801622, -1.384403, 1, 0, 0, 1, 1,
-0.3175867, 0.07500076, 1.024378, 1, 0, 0, 1, 1,
-0.3159632, -0.06168402, -2.794138, 1, 0, 0, 1, 1,
-0.3090756, -2.389144, -1.410715, 1, 0, 0, 1, 1,
-0.308296, -0.1658039, -2.629828, 0, 0, 0, 1, 1,
-0.3068492, -2.179097, -1.826233, 0, 0, 0, 1, 1,
-0.3038188, -0.3396358, -2.592003, 0, 0, 0, 1, 1,
-0.3025043, 0.887517, -0.6175238, 0, 0, 0, 1, 1,
-0.3023093, -0.3983103, -2.814732, 0, 0, 0, 1, 1,
-0.2983704, -1.743797, -3.567319, 0, 0, 0, 1, 1,
-0.2936126, -0.5027367, -3.113085, 0, 0, 0, 1, 1,
-0.2934896, 1.003443, 0.4211014, 1, 1, 1, 1, 1,
-0.2913061, -0.297543, -2.659861, 1, 1, 1, 1, 1,
-0.2895546, -0.83817, -2.755028, 1, 1, 1, 1, 1,
-0.288139, -0.1480065, -1.418263, 1, 1, 1, 1, 1,
-0.2871981, -0.487782, -3.220109, 1, 1, 1, 1, 1,
-0.2864701, -0.6670456, -3.008421, 1, 1, 1, 1, 1,
-0.2859298, 1.630084, 0.3660995, 1, 1, 1, 1, 1,
-0.2844241, 0.3172511, 0.3813045, 1, 1, 1, 1, 1,
-0.2815147, -0.140158, -1.289549, 1, 1, 1, 1, 1,
-0.2744323, 0.29864, -0.1132608, 1, 1, 1, 1, 1,
-0.2740158, -0.4963288, -3.37324, 1, 1, 1, 1, 1,
-0.2730749, 0.4471422, -1.463188, 1, 1, 1, 1, 1,
-0.2717721, 0.02445251, -1.189365, 1, 1, 1, 1, 1,
-0.2671245, 0.4503827, -0.7619928, 1, 1, 1, 1, 1,
-0.2655293, 1.257862, 1.989079, 1, 1, 1, 1, 1,
-0.2567851, 0.2773038, -1.277113, 0, 0, 1, 1, 1,
-0.2566421, -0.468724, -1.317613, 1, 0, 0, 1, 1,
-0.2554733, 0.8017362, 0.1369744, 1, 0, 0, 1, 1,
-0.2545382, 0.5665536, -2.117759, 1, 0, 0, 1, 1,
-0.252566, 1.073618, -1.644571, 1, 0, 0, 1, 1,
-0.2521688, -0.2735225, -1.365229, 1, 0, 0, 1, 1,
-0.2510861, 0.5321915, -0.2872411, 0, 0, 0, 1, 1,
-0.2497083, 0.5665126, 0.8109763, 0, 0, 0, 1, 1,
-0.2443089, 1.458995, 0.8225522, 0, 0, 0, 1, 1,
-0.239161, -0.0440506, -0.5813832, 0, 0, 0, 1, 1,
-0.237036, 0.5655021, -2.969437, 0, 0, 0, 1, 1,
-0.2345709, -1.267647, -3.993719, 0, 0, 0, 1, 1,
-0.2338044, -0.9082439, -2.566275, 0, 0, 0, 1, 1,
-0.2276708, 0.8522432, -1.075612, 1, 1, 1, 1, 1,
-0.2267741, 0.2318701, -0.662914, 1, 1, 1, 1, 1,
-0.2257646, -1.001794, -3.190583, 1, 1, 1, 1, 1,
-0.2242682, 2.371922, -1.571663, 1, 1, 1, 1, 1,
-0.2239923, -0.3751729, -2.882245, 1, 1, 1, 1, 1,
-0.2239498, -0.6005776, -2.499365, 1, 1, 1, 1, 1,
-0.2239078, 0.3621945, -0.9077271, 1, 1, 1, 1, 1,
-0.2220187, -0.6243491, -3.409154, 1, 1, 1, 1, 1,
-0.2201122, 1.444959, -1.37125, 1, 1, 1, 1, 1,
-0.2183449, 0.4618216, 0.1696862, 1, 1, 1, 1, 1,
-0.2156758, -0.6533163, -2.348278, 1, 1, 1, 1, 1,
-0.2096926, 1.775722, -1.918876, 1, 1, 1, 1, 1,
-0.2095776, 2.268683, -0.3152806, 1, 1, 1, 1, 1,
-0.2091796, -0.8187402, -3.138808, 1, 1, 1, 1, 1,
-0.208743, -1.187996, -2.265569, 1, 1, 1, 1, 1,
-0.2065958, -1.121176, -3.355134, 0, 0, 1, 1, 1,
-0.2023822, 1.088915, 0.5617017, 1, 0, 0, 1, 1,
-0.2023223, 1.494967, 0.7038835, 1, 0, 0, 1, 1,
-0.1956481, 0.7588221, 0.6003729, 1, 0, 0, 1, 1,
-0.1918769, -0.05536086, -2.104557, 1, 0, 0, 1, 1,
-0.1902589, -0.2520049, -3.208578, 1, 0, 0, 1, 1,
-0.1875521, 0.1089757, -0.6977693, 0, 0, 0, 1, 1,
-0.1826796, -0.1948248, -1.528971, 0, 0, 0, 1, 1,
-0.1776729, -0.7732288, -1.596962, 0, 0, 0, 1, 1,
-0.1730013, -0.08677111, -0.8891246, 0, 0, 0, 1, 1,
-0.169471, -0.467933, -2.129872, 0, 0, 0, 1, 1,
-0.1605971, 0.06535519, -0.2562723, 0, 0, 0, 1, 1,
-0.1596297, -0.7346047, -2.77474, 0, 0, 0, 1, 1,
-0.1537037, 0.0271428, -1.839348, 1, 1, 1, 1, 1,
-0.1446977, 0.6272852, 0.09422244, 1, 1, 1, 1, 1,
-0.1419626, -0.4558977, -5.084007, 1, 1, 1, 1, 1,
-0.1291765, 0.7301496, -0.3030078, 1, 1, 1, 1, 1,
-0.12761, 1.97533, -1.687363, 1, 1, 1, 1, 1,
-0.1273218, -0.873768, -1.712042, 1, 1, 1, 1, 1,
-0.1258752, 1.292364, -2.12281, 1, 1, 1, 1, 1,
-0.1250403, -1.931573, -1.014203, 1, 1, 1, 1, 1,
-0.1236403, -0.8139927, -3.266276, 1, 1, 1, 1, 1,
-0.1220453, 0.0002854478, 0.1936444, 1, 1, 1, 1, 1,
-0.1177392, 0.8149393, 0.1595916, 1, 1, 1, 1, 1,
-0.1146565, 0.3979576, 0.1433557, 1, 1, 1, 1, 1,
-0.1107492, -2.704691, -3.934436, 1, 1, 1, 1, 1,
-0.1061303, 0.6915673, 0.5405926, 1, 1, 1, 1, 1,
-0.1055015, 0.07124645, 0.667078, 1, 1, 1, 1, 1,
-0.1014813, -0.3959879, -3.642612, 0, 0, 1, 1, 1,
-0.09724545, 0.5957003, -0.1314245, 1, 0, 0, 1, 1,
-0.09449216, 0.08616156, 0.1325082, 1, 0, 0, 1, 1,
-0.08386416, 0.2362341, -0.6164871, 1, 0, 0, 1, 1,
-0.0807017, 0.5895645, 0.05417334, 1, 0, 0, 1, 1,
-0.07887097, -0.5155498, -3.202667, 1, 0, 0, 1, 1,
-0.07759733, 0.5956732, -0.6370358, 0, 0, 0, 1, 1,
-0.07722422, -0.09030248, -2.494298, 0, 0, 0, 1, 1,
-0.07568377, 0.6812971, -0.9301926, 0, 0, 0, 1, 1,
-0.07546515, 1.573647, 1.764317, 0, 0, 0, 1, 1,
-0.0753165, 0.6518189, -0.8817505, 0, 0, 0, 1, 1,
-0.06720237, -0.04827205, -1.516278, 0, 0, 0, 1, 1,
-0.0650297, 0.04355443, 0.7139444, 0, 0, 0, 1, 1,
-0.06076928, 0.3215872, 0.780764, 1, 1, 1, 1, 1,
-0.0585954, -0.2162761, -3.103537, 1, 1, 1, 1, 1,
-0.05618537, -0.2291343, -1.892983, 1, 1, 1, 1, 1,
-0.05256705, 1.644086, -1.009481, 1, 1, 1, 1, 1,
-0.0510975, 0.1679805, 0.8496301, 1, 1, 1, 1, 1,
-0.04572, 0.09261771, -0.8378084, 1, 1, 1, 1, 1,
-0.04453675, -0.9896051, -2.525534, 1, 1, 1, 1, 1,
-0.0442684, -0.8644128, -2.531264, 1, 1, 1, 1, 1,
-0.04366083, 0.2550087, 0.7894151, 1, 1, 1, 1, 1,
-0.03831106, 0.5063789, 0.5139154, 1, 1, 1, 1, 1,
-0.03786142, 1.164166, -2.100889, 1, 1, 1, 1, 1,
-0.03678739, -1.6005, -5.198529, 1, 1, 1, 1, 1,
-0.03589914, 1.233617, -0.7386143, 1, 1, 1, 1, 1,
-0.03588822, 0.7146721, -0.4597449, 1, 1, 1, 1, 1,
-0.03223482, -2.413895, -2.958002, 1, 1, 1, 1, 1,
-0.03083474, 0.001278356, -0.6826424, 0, 0, 1, 1, 1,
-0.03028768, 2.156971, 1.051381, 1, 0, 0, 1, 1,
-0.0286649, -1.527507, -3.782629, 1, 0, 0, 1, 1,
-0.02837704, 0.8535281, -1.182914, 1, 0, 0, 1, 1,
-0.02675425, -1.797842, -1.493374, 1, 0, 0, 1, 1,
-0.01947702, -2.59115, -2.883725, 1, 0, 0, 1, 1,
-0.017837, 1.46506, 0.7266374, 0, 0, 0, 1, 1,
-0.0147288, 1.285611, -0.06216423, 0, 0, 0, 1, 1,
-0.01317609, -0.1551664, -1.200517, 0, 0, 0, 1, 1,
-0.01002909, -1.379239, -1.629607, 0, 0, 0, 1, 1,
-0.00880737, -1.486371, -2.386374, 0, 0, 0, 1, 1,
-0.001363531, 1.155405, -2.031351, 0, 0, 0, 1, 1,
0.001100368, -0.7751098, 2.378015, 0, 0, 0, 1, 1,
0.002296113, -0.5701573, 3.320283, 1, 1, 1, 1, 1,
0.003590666, -1.124061, 1.63048, 1, 1, 1, 1, 1,
0.004914044, -1.754027, 2.905165, 1, 1, 1, 1, 1,
0.01285593, 1.738403, 0.3048457, 1, 1, 1, 1, 1,
0.01757668, 0.1337644, 1.120588, 1, 1, 1, 1, 1,
0.01881373, -1.273668, 3.980295, 1, 1, 1, 1, 1,
0.01953726, -1.17265, 3.896518, 1, 1, 1, 1, 1,
0.02254797, 0.3333197, -0.1769191, 1, 1, 1, 1, 1,
0.02362758, 1.056391, 0.2071432, 1, 1, 1, 1, 1,
0.02692196, 0.7751114, -0.3165948, 1, 1, 1, 1, 1,
0.03031753, -0.2083631, 2.24411, 1, 1, 1, 1, 1,
0.03071423, 0.2229131, 0.4765996, 1, 1, 1, 1, 1,
0.03435845, -0.1658333, 2.222915, 1, 1, 1, 1, 1,
0.03491621, -0.9201695, 4.994253, 1, 1, 1, 1, 1,
0.0374696, -0.9934213, 3.177157, 1, 1, 1, 1, 1,
0.03765055, 0.7362, -1.663053, 0, 0, 1, 1, 1,
0.03884579, 0.3677716, -0.2957466, 1, 0, 0, 1, 1,
0.0390681, 0.7985321, -0.141664, 1, 0, 0, 1, 1,
0.03937137, 1.449732, 0.1690034, 1, 0, 0, 1, 1,
0.03958274, 0.806375, 1.093547, 1, 0, 0, 1, 1,
0.04101754, -0.3806656, 2.594921, 1, 0, 0, 1, 1,
0.04272687, 0.7823921, 0.1081735, 0, 0, 0, 1, 1,
0.04405965, 0.1898712, 0.9760501, 0, 0, 0, 1, 1,
0.04415221, -0.2453204, 3.426023, 0, 0, 0, 1, 1,
0.0468097, -0.5503874, 2.521494, 0, 0, 0, 1, 1,
0.04711065, -0.2865585, 3.738622, 0, 0, 0, 1, 1,
0.04736277, -1.068618, 3.940519, 0, 0, 0, 1, 1,
0.04887512, -1.700208, 1.140537, 0, 0, 0, 1, 1,
0.04985459, -0.1081468, 1.657216, 1, 1, 1, 1, 1,
0.05309998, 1.123229, 0.5186093, 1, 1, 1, 1, 1,
0.05351859, 1.095889, -0.2020627, 1, 1, 1, 1, 1,
0.05538812, 2.07701, 0.5672933, 1, 1, 1, 1, 1,
0.05799384, 0.7335337, 1.715423, 1, 1, 1, 1, 1,
0.06021555, 0.8026477, 0.9722034, 1, 1, 1, 1, 1,
0.06440799, 0.005813094, 2.083607, 1, 1, 1, 1, 1,
0.06615796, 0.6677227, -0.2386291, 1, 1, 1, 1, 1,
0.06683468, -0.7200556, 2.56642, 1, 1, 1, 1, 1,
0.07090891, -0.9929489, 2.559272, 1, 1, 1, 1, 1,
0.07546556, -0.6228475, 2.809873, 1, 1, 1, 1, 1,
0.07775443, -1.291406, 4.347417, 1, 1, 1, 1, 1,
0.07895987, 0.592499, -0.3553135, 1, 1, 1, 1, 1,
0.07986934, -0.2879972, 3.673618, 1, 1, 1, 1, 1,
0.08113486, -0.1296835, 1.71597, 1, 1, 1, 1, 1,
0.08203309, 1.910866, 0.0009378419, 0, 0, 1, 1, 1,
0.08563279, 0.1184167, 0.1492905, 1, 0, 0, 1, 1,
0.08734612, 1.078429, 0.09260581, 1, 0, 0, 1, 1,
0.09468491, -0.1832374, 3.596105, 1, 0, 0, 1, 1,
0.09759019, -1.0722, 1.421665, 1, 0, 0, 1, 1,
0.09894754, 1.016327, 0.6172733, 1, 0, 0, 1, 1,
0.1013219, 1.30039, 0.7750095, 0, 0, 0, 1, 1,
0.1042759, -1.160959, 4.946397, 0, 0, 0, 1, 1,
0.1050613, -1.520642, 3.680794, 0, 0, 0, 1, 1,
0.1092511, 2.169196, 0.5693797, 0, 0, 0, 1, 1,
0.1105031, 1.358666, 0.7213255, 0, 0, 0, 1, 1,
0.1105627, 0.6615437, 1.839892, 0, 0, 0, 1, 1,
0.1137668, 0.7101564, -0.2296003, 0, 0, 0, 1, 1,
0.1171611, -0.9279117, 2.490474, 1, 1, 1, 1, 1,
0.1176914, -2.017791, 3.823875, 1, 1, 1, 1, 1,
0.1192347, -0.4143294, 4.260081, 1, 1, 1, 1, 1,
0.120593, 0.4176465, 0.4291416, 1, 1, 1, 1, 1,
0.1272421, 0.2085275, -0.4945297, 1, 1, 1, 1, 1,
0.1317558, -0.008121629, -0.6280673, 1, 1, 1, 1, 1,
0.1355281, 0.3695336, 1.272754, 1, 1, 1, 1, 1,
0.1366304, -1.506982, 2.362255, 1, 1, 1, 1, 1,
0.1380408, -0.07442867, 0.6655406, 1, 1, 1, 1, 1,
0.1381207, -0.7854014, 3.982606, 1, 1, 1, 1, 1,
0.1383907, 1.146988, 0.9491068, 1, 1, 1, 1, 1,
0.139151, -0.09387007, 0.2964639, 1, 1, 1, 1, 1,
0.1396468, 0.1717375, 2.29673, 1, 1, 1, 1, 1,
0.1436073, 1.187686, 0.8565801, 1, 1, 1, 1, 1,
0.1458352, 1.675635, 0.7277938, 1, 1, 1, 1, 1,
0.1461061, 0.5559617, 0.902205, 0, 0, 1, 1, 1,
0.1500554, -0.2741316, 3.2076, 1, 0, 0, 1, 1,
0.1512968, -1.152733, 3.933081, 1, 0, 0, 1, 1,
0.1574958, -0.3690468, 1.426906, 1, 0, 0, 1, 1,
0.1630706, -0.6942886, 1.545427, 1, 0, 0, 1, 1,
0.1677019, 0.4850784, 0.3872896, 1, 0, 0, 1, 1,
0.1723579, -1.107587, 2.568692, 0, 0, 0, 1, 1,
0.1736908, -1.111159, 2.757056, 0, 0, 0, 1, 1,
0.1744381, 0.2398979, 1.017489, 0, 0, 0, 1, 1,
0.1749688, -1.578661, 3.825361, 0, 0, 0, 1, 1,
0.1751761, 0.1983373, 1.363293, 0, 0, 0, 1, 1,
0.1796505, -0.7828637, 2.470706, 0, 0, 0, 1, 1,
0.1912406, 0.8169382, -1.333427, 0, 0, 0, 1, 1,
0.1942288, -0.8162065, 4.270114, 1, 1, 1, 1, 1,
0.1971277, 1.507973, -0.3386625, 1, 1, 1, 1, 1,
0.1971889, 0.944891, 0.3097475, 1, 1, 1, 1, 1,
0.1973383, -0.2471137, 3.448279, 1, 1, 1, 1, 1,
0.207519, -1.48992, 1.782151, 1, 1, 1, 1, 1,
0.2082838, -1.003808, 3.812483, 1, 1, 1, 1, 1,
0.2103051, 0.1206896, 2.231758, 1, 1, 1, 1, 1,
0.2114985, -0.6242211, 3.392285, 1, 1, 1, 1, 1,
0.213744, -0.7732109, 0.7602745, 1, 1, 1, 1, 1,
0.2138332, -0.01186055, 2.623464, 1, 1, 1, 1, 1,
0.2192681, -2.36571, 4.227543, 1, 1, 1, 1, 1,
0.2206336, 0.6154574, -0.3073424, 1, 1, 1, 1, 1,
0.2276428, -0.1404229, 2.419279, 1, 1, 1, 1, 1,
0.2281118, 2.111399, -0.1858789, 1, 1, 1, 1, 1,
0.2305547, 0.7924685, -0.3815059, 1, 1, 1, 1, 1,
0.234931, 2.18102, 1.299324, 0, 0, 1, 1, 1,
0.2385771, -0.3765546, 0.05643209, 1, 0, 0, 1, 1,
0.2399338, -1.149781, 2.068311, 1, 0, 0, 1, 1,
0.2418082, -0.0360206, 1.807738, 1, 0, 0, 1, 1,
0.2464113, -0.1570798, 1.723721, 1, 0, 0, 1, 1,
0.2491255, 1.282276, -0.7169625, 1, 0, 0, 1, 1,
0.2555627, -0.2128527, 2.629163, 0, 0, 0, 1, 1,
0.2563395, 0.0007318959, 1.274634, 0, 0, 0, 1, 1,
0.2568244, 1.460504, 1.603215, 0, 0, 0, 1, 1,
0.2574183, -0.2541316, 2.975949, 0, 0, 0, 1, 1,
0.2621277, -0.136842, 2.00663, 0, 0, 0, 1, 1,
0.2632501, 0.6537519, 2.046063, 0, 0, 0, 1, 1,
0.2634717, -1.483817, 2.863095, 0, 0, 0, 1, 1,
0.2707794, 0.02284225, 1.043425, 1, 1, 1, 1, 1,
0.2780064, 1.655639, 0.04444108, 1, 1, 1, 1, 1,
0.2790687, -1.157584, 3.251708, 1, 1, 1, 1, 1,
0.2800499, 1.108879, 1.224422, 1, 1, 1, 1, 1,
0.2804981, -1.349519, 1.693498, 1, 1, 1, 1, 1,
0.2833363, -0.9762617, 2.996998, 1, 1, 1, 1, 1,
0.2841956, 1.286256, 0.07019, 1, 1, 1, 1, 1,
0.2925496, -1.29061, 1.606305, 1, 1, 1, 1, 1,
0.2941878, 1.230968, 1.399233, 1, 1, 1, 1, 1,
0.2972748, 0.4647543, 0.3811935, 1, 1, 1, 1, 1,
0.298646, 1.281881, 0.3463986, 1, 1, 1, 1, 1,
0.3072771, 2.283864, 0.4346267, 1, 1, 1, 1, 1,
0.3095784, 0.03484816, 1.899084, 1, 1, 1, 1, 1,
0.3106553, 0.8474507, 0.1879827, 1, 1, 1, 1, 1,
0.3192651, -0.1000261, 2.184299, 1, 1, 1, 1, 1,
0.3192702, -2.056265, 2.54279, 0, 0, 1, 1, 1,
0.3215154, -0.4798489, 1.754859, 1, 0, 0, 1, 1,
0.3235447, 1.031044, -0.8694812, 1, 0, 0, 1, 1,
0.3242328, 0.6060104, 3.103472, 1, 0, 0, 1, 1,
0.3393084, -0.4291449, 1.867801, 1, 0, 0, 1, 1,
0.3393583, 0.4224717, -1.427878, 1, 0, 0, 1, 1,
0.3398513, -0.704192, 0.4106008, 0, 0, 0, 1, 1,
0.3404258, 0.09552481, 0.9172388, 0, 0, 0, 1, 1,
0.3445557, -0.0580797, 1.374621, 0, 0, 0, 1, 1,
0.3484384, -0.121058, 2.675659, 0, 0, 0, 1, 1,
0.3501682, -0.7274723, 2.886563, 0, 0, 0, 1, 1,
0.3509055, 0.3152888, 0.04421302, 0, 0, 0, 1, 1,
0.3538423, 0.5661747, 0.2003801, 0, 0, 0, 1, 1,
0.3598539, 0.869305, 0.8984303, 1, 1, 1, 1, 1,
0.3608238, -0.9551669, 1.844524, 1, 1, 1, 1, 1,
0.3687458, 1.14636, 0.7813939, 1, 1, 1, 1, 1,
0.3727753, -1.303065, 1.276093, 1, 1, 1, 1, 1,
0.3732246, -1.01868, 2.632746, 1, 1, 1, 1, 1,
0.3736252, 0.3987976, -0.5691409, 1, 1, 1, 1, 1,
0.3744447, -0.9401957, 4.090972, 1, 1, 1, 1, 1,
0.3748403, -1.397232, 4.517001, 1, 1, 1, 1, 1,
0.3761955, -0.6792957, 3.389741, 1, 1, 1, 1, 1,
0.3785094, 2.105856, 0.696947, 1, 1, 1, 1, 1,
0.3842591, -0.482558, 3.705362, 1, 1, 1, 1, 1,
0.3874498, 1.020125, 0.6238971, 1, 1, 1, 1, 1,
0.3918139, -0.06957995, 3.302503, 1, 1, 1, 1, 1,
0.3960742, 1.048424, 0.3332334, 1, 1, 1, 1, 1,
0.3968507, -0.1726622, 2.532372, 1, 1, 1, 1, 1,
0.4023215, 0.1218059, 0.4826549, 0, 0, 1, 1, 1,
0.4028824, 1.811548, 0.5140352, 1, 0, 0, 1, 1,
0.4076868, 0.05698482, -0.4854162, 1, 0, 0, 1, 1,
0.4077869, 0.1308551, 1.182846, 1, 0, 0, 1, 1,
0.409209, -0.9601467, 3.620116, 1, 0, 0, 1, 1,
0.4100659, 0.3397318, -0.19772, 1, 0, 0, 1, 1,
0.4113615, 1.817309, 0.07803369, 0, 0, 0, 1, 1,
0.4145674, -0.5484651, 2.618399, 0, 0, 0, 1, 1,
0.4161634, -1.557265, 4.417175, 0, 0, 0, 1, 1,
0.4174602, 2.560392, 0.4006712, 0, 0, 0, 1, 1,
0.4251028, -0.2104434, 3.02444, 0, 0, 0, 1, 1,
0.4261019, 0.6715361, -0.5583569, 0, 0, 0, 1, 1,
0.4270696, -0.2492642, 1.800108, 0, 0, 0, 1, 1,
0.4284315, -1.010721, 2.595338, 1, 1, 1, 1, 1,
0.4317184, -0.2810445, 1.579726, 1, 1, 1, 1, 1,
0.4327921, 0.2237073, -0.5202429, 1, 1, 1, 1, 1,
0.4334854, -1.769953, 2.208192, 1, 1, 1, 1, 1,
0.4343171, -1.049394, 3.827881, 1, 1, 1, 1, 1,
0.4344065, 0.4337327, -1.254822, 1, 1, 1, 1, 1,
0.4388016, 0.1753176, -0.558813, 1, 1, 1, 1, 1,
0.4462099, 0.4048141, 0.3527969, 1, 1, 1, 1, 1,
0.4470236, -0.05283607, -0.3303562, 1, 1, 1, 1, 1,
0.4498485, 0.08869784, 2.399655, 1, 1, 1, 1, 1,
0.452436, 0.6276146, 0.8208058, 1, 1, 1, 1, 1,
0.458131, -1.183504, 1.48559, 1, 1, 1, 1, 1,
0.4620288, -1.210025, 3.17534, 1, 1, 1, 1, 1,
0.4674631, 0.9596551, 0.2984211, 1, 1, 1, 1, 1,
0.4723035, 0.2302429, 0.8282459, 1, 1, 1, 1, 1,
0.4727451, -0.0392938, 0.8916004, 0, 0, 1, 1, 1,
0.472954, 0.2967881, 2.448488, 1, 0, 0, 1, 1,
0.4735408, -0.01179464, 1.619766, 1, 0, 0, 1, 1,
0.4752118, -1.108784, 2.789548, 1, 0, 0, 1, 1,
0.4765687, 0.6868017, 2.400348, 1, 0, 0, 1, 1,
0.4790788, 0.3580166, 0.3427419, 1, 0, 0, 1, 1,
0.4882388, 2.246324, 1.204024, 0, 0, 0, 1, 1,
0.4891765, -1.458974, 3.235531, 0, 0, 0, 1, 1,
0.4958964, -1.137029, 2.990511, 0, 0, 0, 1, 1,
0.4980692, 0.5870735, 0.5796608, 0, 0, 0, 1, 1,
0.4985837, 0.1594845, 1.033434, 0, 0, 0, 1, 1,
0.4990981, -0.01072826, 0.2974575, 0, 0, 0, 1, 1,
0.504254, 0.2580558, 1.321487, 0, 0, 0, 1, 1,
0.5067514, 0.8906858, 0.1326684, 1, 1, 1, 1, 1,
0.5174296, 1.004307, -1.502669, 1, 1, 1, 1, 1,
0.5205491, 2.495468, 0.4549038, 1, 1, 1, 1, 1,
0.522307, 0.928317, 0.3635472, 1, 1, 1, 1, 1,
0.5226392, 1.321162, 0.9528612, 1, 1, 1, 1, 1,
0.5244501, 0.5734367, 0.602205, 1, 1, 1, 1, 1,
0.5276425, -0.7347093, 2.998785, 1, 1, 1, 1, 1,
0.5348958, 0.8336526, 1.89519, 1, 1, 1, 1, 1,
0.5372632, -0.9753326, 1.254049, 1, 1, 1, 1, 1,
0.5378327, -0.5736426, 2.632323, 1, 1, 1, 1, 1,
0.5432333, 1.05311, 0.4120193, 1, 1, 1, 1, 1,
0.5465598, 1.643017, 0.603829, 1, 1, 1, 1, 1,
0.5488805, -1.089591, 3.860992, 1, 1, 1, 1, 1,
0.5506104, 0.4001103, 0.4314758, 1, 1, 1, 1, 1,
0.5546852, -1.279153, 1.167879, 1, 1, 1, 1, 1,
0.554805, 0.5296739, 1.072437, 0, 0, 1, 1, 1,
0.5587591, -0.6369831, 2.586282, 1, 0, 0, 1, 1,
0.5608293, -0.8735252, 3.093145, 1, 0, 0, 1, 1,
0.5651767, 1.588121, 0.9477719, 1, 0, 0, 1, 1,
0.5652956, 1.723176, -0.1431125, 1, 0, 0, 1, 1,
0.5659756, 1.385702, 0.3464972, 1, 0, 0, 1, 1,
0.5689899, 0.885112, 0.910897, 0, 0, 0, 1, 1,
0.5741279, -0.384923, 0.06699828, 0, 0, 0, 1, 1,
0.5752931, 0.4449058, 0.8692558, 0, 0, 0, 1, 1,
0.5785909, -0.4511144, 2.07103, 0, 0, 0, 1, 1,
0.5788952, -1.133376, 2.0532, 0, 0, 0, 1, 1,
0.5845575, 0.9942759, 0.1777697, 0, 0, 0, 1, 1,
0.5871415, -0.5546309, 2.982069, 0, 0, 0, 1, 1,
0.5998151, -0.662589, 3.882668, 1, 1, 1, 1, 1,
0.6035789, 0.1227425, 0.07868044, 1, 1, 1, 1, 1,
0.6049162, 0.5067094, -0.2059616, 1, 1, 1, 1, 1,
0.6066793, -0.4453128, 3.78205, 1, 1, 1, 1, 1,
0.6069952, -1.17489, 2.198269, 1, 1, 1, 1, 1,
0.6079269, -0.2894461, 3.36499, 1, 1, 1, 1, 1,
0.6128179, -0.6270474, 2.2092, 1, 1, 1, 1, 1,
0.6134645, -0.3780024, 3.988444, 1, 1, 1, 1, 1,
0.6357093, -0.6063762, 2.165447, 1, 1, 1, 1, 1,
0.6394061, -1.580326, 2.400567, 1, 1, 1, 1, 1,
0.6394524, 1.415899, -0.9619049, 1, 1, 1, 1, 1,
0.64614, -1.329536, 2.650065, 1, 1, 1, 1, 1,
0.6477374, -0.02619599, 3.408133, 1, 1, 1, 1, 1,
0.6477579, -0.4519835, 1.025042, 1, 1, 1, 1, 1,
0.6607078, -1.037244, 2.276825, 1, 1, 1, 1, 1,
0.6611879, 1.632948, -0.4681126, 0, 0, 1, 1, 1,
0.6674377, -0.4676929, 3.003313, 1, 0, 0, 1, 1,
0.6696923, 0.7178413, -1.361934, 1, 0, 0, 1, 1,
0.6762438, 0.8932869, 0.05053508, 1, 0, 0, 1, 1,
0.6810622, 0.2841294, 1.238476, 1, 0, 0, 1, 1,
0.6821848, -0.5794487, 1.78395, 1, 0, 0, 1, 1,
0.6822609, -1.43694, 2.189433, 0, 0, 0, 1, 1,
0.6849395, 0.5028992, 0.485906, 0, 0, 0, 1, 1,
0.6919791, 0.5033851, -0.1180552, 0, 0, 0, 1, 1,
0.6922088, 0.09967756, 1.432226, 0, 0, 0, 1, 1,
0.6931865, -1.936803, 2.444126, 0, 0, 0, 1, 1,
0.6980993, -0.8858643, 2.410659, 0, 0, 0, 1, 1,
0.7025821, 0.9612823, 0.4994031, 0, 0, 0, 1, 1,
0.7029573, -0.8915733, 2.036608, 1, 1, 1, 1, 1,
0.703207, -0.8635623, 1.920063, 1, 1, 1, 1, 1,
0.7040405, 2.100734, 0.5199126, 1, 1, 1, 1, 1,
0.7041606, 1.318382, 0.1522589, 1, 1, 1, 1, 1,
0.7048069, -0.4877923, 1.895952, 1, 1, 1, 1, 1,
0.7061791, -0.4783161, 1.843271, 1, 1, 1, 1, 1,
0.7074423, -1.816375, -0.7143008, 1, 1, 1, 1, 1,
0.7124578, -1.510728, 3.084369, 1, 1, 1, 1, 1,
0.7126958, -0.2782928, 0.54105, 1, 1, 1, 1, 1,
0.7198506, 0.4377912, 1.628673, 1, 1, 1, 1, 1,
0.721294, -0.9132105, 2.564963, 1, 1, 1, 1, 1,
0.722537, -0.8965928, 3.342159, 1, 1, 1, 1, 1,
0.7243685, 1.209171, 1.507332, 1, 1, 1, 1, 1,
0.7318325, 1.668799, -0.06178777, 1, 1, 1, 1, 1,
0.734285, 0.5603576, 1.03159, 1, 1, 1, 1, 1,
0.7377516, -1.868048, 3.333931, 0, 0, 1, 1, 1,
0.7385354, 1.422453, 2.139907, 1, 0, 0, 1, 1,
0.7458971, -0.02273452, 2.163828, 1, 0, 0, 1, 1,
0.7536884, -0.3549519, 2.721125, 1, 0, 0, 1, 1,
0.7611607, -0.1185939, -1.354302, 1, 0, 0, 1, 1,
0.7613981, 0.7251912, 2.159871, 1, 0, 0, 1, 1,
0.7629901, 0.5714328, 0.3876284, 0, 0, 0, 1, 1,
0.7657169, -1.213553, 3.347639, 0, 0, 0, 1, 1,
0.7676296, 1.055163, -0.7165491, 0, 0, 0, 1, 1,
0.7680406, 1.743821, -0.188851, 0, 0, 0, 1, 1,
0.7765506, -3.327485, 1.021442, 0, 0, 0, 1, 1,
0.7778707, -1.01694, 2.927584, 0, 0, 0, 1, 1,
0.7784542, 0.5044068, 0.5920275, 0, 0, 0, 1, 1,
0.7826274, -1.066588, 1.562263, 1, 1, 1, 1, 1,
0.7834051, 0.7824329, -0.3179625, 1, 1, 1, 1, 1,
0.7857466, -1.222546, 3.64026, 1, 1, 1, 1, 1,
0.7870989, 1.208929, 0.8635046, 1, 1, 1, 1, 1,
0.7985879, -0.4820836, 1.093771, 1, 1, 1, 1, 1,
0.8066984, 1.255433, -0.2824203, 1, 1, 1, 1, 1,
0.8091243, 2.556851, 1.102194, 1, 1, 1, 1, 1,
0.8094741, 0.6013473, 0.7020358, 1, 1, 1, 1, 1,
0.8135114, 0.2756328, 0.210622, 1, 1, 1, 1, 1,
0.817262, -0.5604465, 2.471207, 1, 1, 1, 1, 1,
0.8213887, -0.829909, 3.182611, 1, 1, 1, 1, 1,
0.8221021, -1.16217, 3.443374, 1, 1, 1, 1, 1,
0.8290404, 1.427598, 1.039614, 1, 1, 1, 1, 1,
0.8320748, -1.1889, 2.034353, 1, 1, 1, 1, 1,
0.8395427, 0.08397304, 1.850779, 1, 1, 1, 1, 1,
0.8401535, -0.8542302, 1.838739, 0, 0, 1, 1, 1,
0.8439503, 0.3996177, 0.09627238, 1, 0, 0, 1, 1,
0.8443469, -2.290866, 1.071508, 1, 0, 0, 1, 1,
0.8465803, -0.3984079, 2.106167, 1, 0, 0, 1, 1,
0.8493743, 1.456071, 1.458601, 1, 0, 0, 1, 1,
0.8540754, -0.8428373, 2.459737, 1, 0, 0, 1, 1,
0.8541723, -0.6294434, 2.315412, 0, 0, 0, 1, 1,
0.8602873, -0.2648353, 2.189614, 0, 0, 0, 1, 1,
0.8708144, -0.2066006, 1.693039, 0, 0, 0, 1, 1,
0.87151, 0.05765226, 2.267562, 0, 0, 0, 1, 1,
0.8723663, 0.03523007, 1.551645, 0, 0, 0, 1, 1,
0.8766414, -1.53652, 2.777611, 0, 0, 0, 1, 1,
0.8766485, 0.04739986, -0.2199623, 0, 0, 0, 1, 1,
0.8822996, 0.1122892, 3.147596, 1, 1, 1, 1, 1,
0.88349, -0.3103822, 0.7552881, 1, 1, 1, 1, 1,
0.8849487, 0.248522, 0.3501387, 1, 1, 1, 1, 1,
0.8877324, 0.5727903, 0.6339452, 1, 1, 1, 1, 1,
0.8913636, 0.9434788, 1.236395, 1, 1, 1, 1, 1,
0.8971799, -0.6935046, 1.564926, 1, 1, 1, 1, 1,
0.8972166, -0.4255622, 5.493016, 1, 1, 1, 1, 1,
0.8994042, -0.1280786, 2.009045, 1, 1, 1, 1, 1,
0.9023309, 0.2571141, 0.6643898, 1, 1, 1, 1, 1,
0.9033829, 1.766657, 0.7626296, 1, 1, 1, 1, 1,
0.9035113, 3.08414, 0.7326874, 1, 1, 1, 1, 1,
0.9087309, 0.3950549, 0.1837606, 1, 1, 1, 1, 1,
0.9123048, -1.142572, 2.531033, 1, 1, 1, 1, 1,
0.9263874, -0.7867593, 2.831073, 1, 1, 1, 1, 1,
0.9298592, -1.101442, 3.056791, 1, 1, 1, 1, 1,
0.9360343, 0.6660441, 1.159896, 0, 0, 1, 1, 1,
0.938169, 0.2046344, 2.4365, 1, 0, 0, 1, 1,
0.9397196, 1.400019, 0.08923446, 1, 0, 0, 1, 1,
0.9428581, 0.06690241, 0.5161696, 1, 0, 0, 1, 1,
0.9450377, -0.8236651, 4.143747, 1, 0, 0, 1, 1,
0.9497755, -0.1256031, 2.201004, 1, 0, 0, 1, 1,
0.974858, 0.6487787, 0.2755414, 0, 0, 0, 1, 1,
0.976437, -1.876571, 3.160916, 0, 0, 0, 1, 1,
0.9800974, -0.4479697, 2.323833, 0, 0, 0, 1, 1,
0.9827896, 0.5108593, -0.1146985, 0, 0, 0, 1, 1,
0.9877748, -0.7002727, 3.450004, 0, 0, 0, 1, 1,
0.9957811, 0.4838262, 1.056591, 0, 0, 0, 1, 1,
0.9983292, -0.1415974, 2.767512, 0, 0, 0, 1, 1,
1.005557, 0.04765494, 0.2046157, 1, 1, 1, 1, 1,
1.007468, 0.8661621, 1.218117, 1, 1, 1, 1, 1,
1.008816, 1.921905, 0.3440621, 1, 1, 1, 1, 1,
1.010625, 1.218808, 1.422849, 1, 1, 1, 1, 1,
1.013588, 1.236061, 0.1021114, 1, 1, 1, 1, 1,
1.015297, -2.014443, 2.276612, 1, 1, 1, 1, 1,
1.028855, -1.434994, 2.012585, 1, 1, 1, 1, 1,
1.030576, 0.8860608, 0.884859, 1, 1, 1, 1, 1,
1.032352, -0.2683663, 1.706575, 1, 1, 1, 1, 1,
1.033979, 1.192855, -1.157036, 1, 1, 1, 1, 1,
1.03432, -0.2297814, 1.986987, 1, 1, 1, 1, 1,
1.035943, -0.3546079, 0.1478786, 1, 1, 1, 1, 1,
1.037431, -0.2600154, 1.885952, 1, 1, 1, 1, 1,
1.061198, -0.1971941, 1.400009, 1, 1, 1, 1, 1,
1.064742, 1.371914, 1.182132, 1, 1, 1, 1, 1,
1.070627, 1.212912, 0.9315862, 0, 0, 1, 1, 1,
1.073852, -0.1464921, 1.351155, 1, 0, 0, 1, 1,
1.081688, -1.605727, 4.074295, 1, 0, 0, 1, 1,
1.085476, -0.9801706, 2.527253, 1, 0, 0, 1, 1,
1.100237, 0.6428459, -0.4191493, 1, 0, 0, 1, 1,
1.100477, -0.1290506, 1.766097, 1, 0, 0, 1, 1,
1.100561, 0.7532106, 1.908683, 0, 0, 0, 1, 1,
1.102686, -0.5133346, 0.06970183, 0, 0, 0, 1, 1,
1.108793, 1.436118, 0.5673555, 0, 0, 0, 1, 1,
1.114979, -1.240668, 0.8356941, 0, 0, 0, 1, 1,
1.119452, 0.875685, 0.2163356, 0, 0, 0, 1, 1,
1.127573, 0.3087262, 0.2622096, 0, 0, 0, 1, 1,
1.128165, 0.5782194, 2.222759, 0, 0, 0, 1, 1,
1.140742, -0.6234081, 3.374628, 1, 1, 1, 1, 1,
1.144659, -0.8155473, 0.9822913, 1, 1, 1, 1, 1,
1.144982, -0.8801262, 4.539084, 1, 1, 1, 1, 1,
1.150591, -0.2305449, 2.477139, 1, 1, 1, 1, 1,
1.151206, -0.04476826, 2.179788, 1, 1, 1, 1, 1,
1.160676, -0.2831947, 0.861921, 1, 1, 1, 1, 1,
1.169033, -1.063527, 2.746069, 1, 1, 1, 1, 1,
1.176064, 0.3938172, 1.785679, 1, 1, 1, 1, 1,
1.179189, 0.3927094, 1.682711, 1, 1, 1, 1, 1,
1.183012, -1.550214, 3.100055, 1, 1, 1, 1, 1,
1.183349, 0.09492544, -0.3553848, 1, 1, 1, 1, 1,
1.187252, -0.3639157, 1.791282, 1, 1, 1, 1, 1,
1.187952, 0.1902399, 3.401423, 1, 1, 1, 1, 1,
1.188217, -0.8733768, 0.704627, 1, 1, 1, 1, 1,
1.194001, 1.035717, 1.831912, 1, 1, 1, 1, 1,
1.205597, 0.5205491, 1.76101, 0, 0, 1, 1, 1,
1.211167, -0.03200398, -0.6258663, 1, 0, 0, 1, 1,
1.213179, 1.486664, 0.7899176, 1, 0, 0, 1, 1,
1.215463, -0.5446105, 0.5673668, 1, 0, 0, 1, 1,
1.224245, -0.5453684, 1.828757, 1, 0, 0, 1, 1,
1.228095, -1.079027, 3.105339, 1, 0, 0, 1, 1,
1.237174, 0.317288, 0.3332391, 0, 0, 0, 1, 1,
1.239628, -0.3260794, 3.587, 0, 0, 0, 1, 1,
1.240705, 1.107674, 0.002236939, 0, 0, 0, 1, 1,
1.241843, -0.3010712, 3.422038, 0, 0, 0, 1, 1,
1.250942, -0.2271561, 3.927804, 0, 0, 0, 1, 1,
1.256002, 0.2448551, 1.536577, 0, 0, 0, 1, 1,
1.257843, -0.2127842, 2.230235, 0, 0, 0, 1, 1,
1.265701, -0.3043432, 2.62123, 1, 1, 1, 1, 1,
1.275905, 0.3721806, 2.388412, 1, 1, 1, 1, 1,
1.279802, -0.5132961, 0.5283054, 1, 1, 1, 1, 1,
1.284355, 0.09581414, 0.5519513, 1, 1, 1, 1, 1,
1.284457, 0.05707655, 1.573883, 1, 1, 1, 1, 1,
1.288148, -2.863607, 3.441223, 1, 1, 1, 1, 1,
1.295914, -0.2640753, -0.7618661, 1, 1, 1, 1, 1,
1.297083, 1.611563, -0.374312, 1, 1, 1, 1, 1,
1.299787, 0.9678685, 1.013461, 1, 1, 1, 1, 1,
1.303012, -0.1556703, 2.300961, 1, 1, 1, 1, 1,
1.306271, -0.04461551, 2.445214, 1, 1, 1, 1, 1,
1.327103, -0.1926649, 3.839124, 1, 1, 1, 1, 1,
1.336409, 0.7051465, -0.4886072, 1, 1, 1, 1, 1,
1.336804, 1.944892, 1.130828, 1, 1, 1, 1, 1,
1.340302, -0.9947485, 2.216454, 1, 1, 1, 1, 1,
1.341849, 0.1788327, 1.176364, 0, 0, 1, 1, 1,
1.34537, 0.1457983, 3.063688, 1, 0, 0, 1, 1,
1.346641, -1.31015, 1.375252, 1, 0, 0, 1, 1,
1.348521, 0.5708663, 0.2540833, 1, 0, 0, 1, 1,
1.350382, 0.5056939, 1.840358, 1, 0, 0, 1, 1,
1.369761, -1.479371, 2.629723, 1, 0, 0, 1, 1,
1.385502, -0.3294863, 2.365082, 0, 0, 0, 1, 1,
1.387346, 0.8834087, 0.2565937, 0, 0, 0, 1, 1,
1.394604, 0.2727045, 2.489096, 0, 0, 0, 1, 1,
1.397403, 1.240143, 3.493419, 0, 0, 0, 1, 1,
1.397435, -0.1507875, 1.558852, 0, 0, 0, 1, 1,
1.405488, -0.8236979, 1.02998, 0, 0, 0, 1, 1,
1.415731, 0.9886929, -0.09141506, 0, 0, 0, 1, 1,
1.423535, 0.1567309, 0.402327, 1, 1, 1, 1, 1,
1.424235, -1.460212, 1.504938, 1, 1, 1, 1, 1,
1.425073, 0.3634826, 2.357139, 1, 1, 1, 1, 1,
1.425198, -0.9751627, 1.340684, 1, 1, 1, 1, 1,
1.426649, -0.4863987, 2.30237, 1, 1, 1, 1, 1,
1.429183, -0.9244972, 3.043127, 1, 1, 1, 1, 1,
1.446981, -1.038247, 2.367623, 1, 1, 1, 1, 1,
1.450877, 0.01246184, 1.691067, 1, 1, 1, 1, 1,
1.453648, -1.175488, 4.45334, 1, 1, 1, 1, 1,
1.463979, -0.6296006, -0.6428019, 1, 1, 1, 1, 1,
1.471506, -2.053508, 2.718167, 1, 1, 1, 1, 1,
1.48202, 0.9897162, 0.6933993, 1, 1, 1, 1, 1,
1.482488, 0.482061, 1.598523, 1, 1, 1, 1, 1,
1.48686, 0.3096034, -0.3635821, 1, 1, 1, 1, 1,
1.49833, 1.32387, 2.091846, 1, 1, 1, 1, 1,
1.499012, -0.3986529, 0.7997177, 0, 0, 1, 1, 1,
1.502266, 0.6073236, -0.6569865, 1, 0, 0, 1, 1,
1.503577, 1.831244, 0.9930285, 1, 0, 0, 1, 1,
1.50932, 1.097209, 2.60322, 1, 0, 0, 1, 1,
1.511, 0.3572638, 2.120205, 1, 0, 0, 1, 1,
1.520725, -1.717197, 2.688029, 1, 0, 0, 1, 1,
1.545069, -1.021482, 2.6167, 0, 0, 0, 1, 1,
1.564388, -0.1942786, 3.034615, 0, 0, 0, 1, 1,
1.576834, 0.8411813, 2.665966, 0, 0, 0, 1, 1,
1.583669, -0.8028606, 2.627335, 0, 0, 0, 1, 1,
1.591181, 0.6573007, 2.606348, 0, 0, 0, 1, 1,
1.597397, -1.693074, 1.979135, 0, 0, 0, 1, 1,
1.601078, -0.1835577, 2.212429, 0, 0, 0, 1, 1,
1.604792, 1.297448, 1.550081, 1, 1, 1, 1, 1,
1.612731, -1.492244, 1.692106, 1, 1, 1, 1, 1,
1.633306, -0.2981744, 2.73926, 1, 1, 1, 1, 1,
1.633713, -0.93467, 2.024772, 1, 1, 1, 1, 1,
1.639113, -0.4654948, 0.7975928, 1, 1, 1, 1, 1,
1.640957, -0.898401, 2.794039, 1, 1, 1, 1, 1,
1.661744, -0.3907183, 2.33912, 1, 1, 1, 1, 1,
1.662252, -0.6331343, 2.807404, 1, 1, 1, 1, 1,
1.664573, 0.4957554, 0.4829781, 1, 1, 1, 1, 1,
1.685744, 0.4850908, 0.6682239, 1, 1, 1, 1, 1,
1.690069, 0.8491626, -0.3586883, 1, 1, 1, 1, 1,
1.691966, -0.1905707, -1.510964, 1, 1, 1, 1, 1,
1.694545, 0.2848608, 2.970286, 1, 1, 1, 1, 1,
1.706205, -0.4509822, 3.090795, 1, 1, 1, 1, 1,
1.717368, -0.3526714, 1.984436, 1, 1, 1, 1, 1,
1.737178, -0.06609087, 1.71851, 0, 0, 1, 1, 1,
1.742658, 0.6540399, 0.3555253, 1, 0, 0, 1, 1,
1.768925, 0.1523997, 0.3349988, 1, 0, 0, 1, 1,
1.784842, 1.059092, 0.6677317, 1, 0, 0, 1, 1,
1.791782, 1.411995, 0.2133324, 1, 0, 0, 1, 1,
1.797531, 0.1162805, 1.337963, 1, 0, 0, 1, 1,
1.801667, -0.01175518, 0.9073051, 0, 0, 0, 1, 1,
1.803746, -0.4919873, 2.230096, 0, 0, 0, 1, 1,
1.823705, -0.2318869, 2.521727, 0, 0, 0, 1, 1,
1.829, -0.1161092, 1.378327, 0, 0, 0, 1, 1,
1.834977, 0.5994333, 0.6516451, 0, 0, 0, 1, 1,
1.840071, 1.287957, -0.6244957, 0, 0, 0, 1, 1,
1.85845, -1.970527, 3.073366, 0, 0, 0, 1, 1,
1.876793, -0.3100742, 1.23471, 1, 1, 1, 1, 1,
1.884058, 0.1865008, 0.01711144, 1, 1, 1, 1, 1,
1.90939, 0.4718603, 1.32834, 1, 1, 1, 1, 1,
1.931892, 1.724311, -0.3989522, 1, 1, 1, 1, 1,
1.935808, 0.3018528, 0.6278203, 1, 1, 1, 1, 1,
1.943503, 1.469617, 1.703655, 1, 1, 1, 1, 1,
1.946306, 0.06573495, 3.974803, 1, 1, 1, 1, 1,
1.9563, 0.4803402, 0.7139755, 1, 1, 1, 1, 1,
1.980125, 2.13014, 1.985821, 1, 1, 1, 1, 1,
1.990381, -1.337443, -0.721127, 1, 1, 1, 1, 1,
2.002534, 1.420384, 1.633837, 1, 1, 1, 1, 1,
2.013656, 0.03357698, 0.1892792, 1, 1, 1, 1, 1,
2.019917, 0.2545158, 0.1381757, 1, 1, 1, 1, 1,
2.042768, -0.9403152, 2.956013, 1, 1, 1, 1, 1,
2.062238, 0.3033138, 1.396815, 1, 1, 1, 1, 1,
2.066194, -0.04027991, 4.781754, 0, 0, 1, 1, 1,
2.073172, -0.2086616, 1.783424, 1, 0, 0, 1, 1,
2.098182, 0.5973358, 1.763395, 1, 0, 0, 1, 1,
2.14545, -0.1909971, 1.398579, 1, 0, 0, 1, 1,
2.150156, 0.895442, 0.7933604, 1, 0, 0, 1, 1,
2.162536, -1.968517, 2.96552, 1, 0, 0, 1, 1,
2.170609, 0.4256823, 2.278151, 0, 0, 0, 1, 1,
2.196708, -0.07412029, 1.320256, 0, 0, 0, 1, 1,
2.197207, 0.9462709, 0.4851557, 0, 0, 0, 1, 1,
2.223807, -2.492763, 4.541617, 0, 0, 0, 1, 1,
2.322318, -1.541809, 2.001507, 0, 0, 0, 1, 1,
2.436679, -0.2119059, 2.993054, 0, 0, 0, 1, 1,
2.452145, 1.892732, 0.3999562, 0, 0, 0, 1, 1,
2.683048, -1.275943, 2.783551, 1, 1, 1, 1, 1,
2.707218, -0.2255192, 0.9828091, 1, 1, 1, 1, 1,
2.72199, -1.160848, 2.580331, 1, 1, 1, 1, 1,
2.722213, 0.6530036, 1.467886, 1, 1, 1, 1, 1,
2.993265, 0.002781249, 1.871312, 1, 1, 1, 1, 1,
3.019649, 0.5055472, 1.318519, 1, 1, 1, 1, 1,
3.315367, -0.2167104, 1.283229, 1, 1, 1, 1, 1
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
var radius = 9.915778;
var distance = 34.82875;
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
mvMatrix.translate( 0.1770878, 0.1216726, 0.09389353 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82875);
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
