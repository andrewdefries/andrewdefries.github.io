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
-3.296775, 0.2466764, -0.101894, 1, 0, 0, 1,
-2.948286, 0.4734896, -0.9393795, 1, 0.007843138, 0, 1,
-2.901798, 0.1818255, -0.1073388, 1, 0.01176471, 0, 1,
-2.842831, 0.02745087, -0.7399835, 1, 0.01960784, 0, 1,
-2.641746, 0.09514222, 0.685067, 1, 0.02352941, 0, 1,
-2.553365, 0.190297, -1.242488, 1, 0.03137255, 0, 1,
-2.465996, -0.6808988, -2.405482, 1, 0.03529412, 0, 1,
-2.434903, 0.3679304, -1.868688, 1, 0.04313726, 0, 1,
-2.401042, -0.1524145, -3.780463, 1, 0.04705882, 0, 1,
-2.352842, -2.083697, -2.69831, 1, 0.05490196, 0, 1,
-2.337405, 0.3012332, -1.939088, 1, 0.05882353, 0, 1,
-2.324672, 0.8761042, -0.2771181, 1, 0.06666667, 0, 1,
-2.232321, -0.590502, -1.674597, 1, 0.07058824, 0, 1,
-2.198397, -0.2910779, -0.7515846, 1, 0.07843138, 0, 1,
-2.180867, -1.821559, -2.626509, 1, 0.08235294, 0, 1,
-2.179084, 0.3669339, -2.653938, 1, 0.09019608, 0, 1,
-2.130758, -0.1183439, -0.7205907, 1, 0.09411765, 0, 1,
-2.130363, -0.7938056, -3.088733, 1, 0.1019608, 0, 1,
-2.110272, -0.330792, -2.413057, 1, 0.1098039, 0, 1,
-2.102514, 0.2226245, -3.633285, 1, 0.1137255, 0, 1,
-2.083143, -0.4387915, -2.475062, 1, 0.1215686, 0, 1,
-2.051965, -0.4054795, -2.182701, 1, 0.1254902, 0, 1,
-2.0455, -0.7692906, -1.336912, 1, 0.1333333, 0, 1,
-2.036802, 1.534149, -0.9800612, 1, 0.1372549, 0, 1,
-2.030316, 0.1701374, -1.58541, 1, 0.145098, 0, 1,
-2.024268, -0.4264588, -1.625263, 1, 0.1490196, 0, 1,
-2.016026, 0.5390767, -3.297607, 1, 0.1568628, 0, 1,
-1.993705, 0.5104964, -1.545485, 1, 0.1607843, 0, 1,
-1.946784, 0.4370877, -1.11292, 1, 0.1686275, 0, 1,
-1.900738, -0.7691473, -2.442249, 1, 0.172549, 0, 1,
-1.892034, 0.8001539, -2.411691, 1, 0.1803922, 0, 1,
-1.887112, 1.064565, -2.621264, 1, 0.1843137, 0, 1,
-1.867441, -0.1280616, -2.436504, 1, 0.1921569, 0, 1,
-1.863419, 1.751189, -1.101864, 1, 0.1960784, 0, 1,
-1.861743, -0.7566075, -2.803236, 1, 0.2039216, 0, 1,
-1.818815, 0.2366266, -1.786184, 1, 0.2117647, 0, 1,
-1.808917, 0.178009, -0.7041676, 1, 0.2156863, 0, 1,
-1.796131, 0.2749631, -2.49422, 1, 0.2235294, 0, 1,
-1.794706, -0.337704, -0.4099296, 1, 0.227451, 0, 1,
-1.770615, -0.3658813, -1.996953, 1, 0.2352941, 0, 1,
-1.767021, 0.1841611, -2.374541, 1, 0.2392157, 0, 1,
-1.755925, 0.6566271, -1.032732, 1, 0.2470588, 0, 1,
-1.754897, 0.03419938, -1.722752, 1, 0.2509804, 0, 1,
-1.749003, -1.612293, -1.038421, 1, 0.2588235, 0, 1,
-1.738843, 0.5018986, 0.6053341, 1, 0.2627451, 0, 1,
-1.736347, -0.2989424, -1.497749, 1, 0.2705882, 0, 1,
-1.734064, 0.536573, -2.731765, 1, 0.2745098, 0, 1,
-1.729429, -0.05674125, -2.214814, 1, 0.282353, 0, 1,
-1.718741, -0.2245964, -0.5946967, 1, 0.2862745, 0, 1,
-1.711533, 0.5855505, -1.799366, 1, 0.2941177, 0, 1,
-1.705472, 1.28583, -1.986916, 1, 0.3019608, 0, 1,
-1.702507, -1.129434, -0.9379484, 1, 0.3058824, 0, 1,
-1.701126, 0.03510694, -2.068897, 1, 0.3137255, 0, 1,
-1.691519, 0.1973621, 0.08235394, 1, 0.3176471, 0, 1,
-1.680349, -1.378608, -3.11727, 1, 0.3254902, 0, 1,
-1.67534, 0.1401399, -1.405042, 1, 0.3294118, 0, 1,
-1.663041, 1.075159, -1.466644, 1, 0.3372549, 0, 1,
-1.660789, -0.9167213, -1.96218, 1, 0.3411765, 0, 1,
-1.653556, 1.074098, -1.954837, 1, 0.3490196, 0, 1,
-1.648945, -0.6966615, -1.123648, 1, 0.3529412, 0, 1,
-1.643552, -0.07780695, -1.589445, 1, 0.3607843, 0, 1,
-1.629459, -0.3962676, -1.126256, 1, 0.3647059, 0, 1,
-1.612627, -0.4930454, -1.677922, 1, 0.372549, 0, 1,
-1.604013, 0.3030429, -2.087979, 1, 0.3764706, 0, 1,
-1.600379, 0.08847414, -0.8310902, 1, 0.3843137, 0, 1,
-1.59616, -0.7717933, -3.112428, 1, 0.3882353, 0, 1,
-1.593428, 1.520959, -0.3970301, 1, 0.3960784, 0, 1,
-1.557738, 0.6766881, -1.810186, 1, 0.4039216, 0, 1,
-1.55535, -1.312052, -1.198609, 1, 0.4078431, 0, 1,
-1.538816, -0.3147671, -1.115273, 1, 0.4156863, 0, 1,
-1.510785, -0.9389923, -1.69554, 1, 0.4196078, 0, 1,
-1.500351, 0.1779365, -1.256497, 1, 0.427451, 0, 1,
-1.498363, 0.01703202, -3.059722, 1, 0.4313726, 0, 1,
-1.484746, -0.1881992, -2.229974, 1, 0.4392157, 0, 1,
-1.480539, 2.184845, -0.5864037, 1, 0.4431373, 0, 1,
-1.473464, -2.300259, -2.456407, 1, 0.4509804, 0, 1,
-1.470716, -1.364953, -2.240585, 1, 0.454902, 0, 1,
-1.465722, 0.7358407, -0.5846151, 1, 0.4627451, 0, 1,
-1.461938, 0.7017371, -0.5288604, 1, 0.4666667, 0, 1,
-1.457083, -0.7782101, -1.636312, 1, 0.4745098, 0, 1,
-1.453951, -0.004709254, -2.623597, 1, 0.4784314, 0, 1,
-1.449056, -0.123499, -1.470693, 1, 0.4862745, 0, 1,
-1.44474, 0.4308149, -0.886417, 1, 0.4901961, 0, 1,
-1.444596, -0.8556315, -2.269464, 1, 0.4980392, 0, 1,
-1.442384, 1.094364, -1.384507, 1, 0.5058824, 0, 1,
-1.419659, 0.2539112, -1.090312, 1, 0.509804, 0, 1,
-1.41228, 0.05101134, -1.57814, 1, 0.5176471, 0, 1,
-1.41075, 1.661646, -1.623072, 1, 0.5215687, 0, 1,
-1.400391, -0.3296068, -1.690235, 1, 0.5294118, 0, 1,
-1.392593, -1.242416, -2.996424, 1, 0.5333334, 0, 1,
-1.388993, 0.9397764, -1.431613, 1, 0.5411765, 0, 1,
-1.385686, -0.5523952, -1.527652, 1, 0.5450981, 0, 1,
-1.378263, -1.681382, -2.456831, 1, 0.5529412, 0, 1,
-1.373984, -1.275448, -1.488647, 1, 0.5568628, 0, 1,
-1.366372, -1.640869, -2.916175, 1, 0.5647059, 0, 1,
-1.362622, -0.1608082, -1.38459, 1, 0.5686275, 0, 1,
-1.350552, 0.2180968, -0.8981737, 1, 0.5764706, 0, 1,
-1.348807, 2.028886, -2.709588, 1, 0.5803922, 0, 1,
-1.348558, 0.783271, -2.001916, 1, 0.5882353, 0, 1,
-1.345399, -0.8791013, -0.4165102, 1, 0.5921569, 0, 1,
-1.340757, 0.6912826, -0.9947454, 1, 0.6, 0, 1,
-1.340037, -0.08070577, -0.3520276, 1, 0.6078432, 0, 1,
-1.338393, 0.6458153, 0.476124, 1, 0.6117647, 0, 1,
-1.337837, 0.4448379, -0.9276764, 1, 0.6196079, 0, 1,
-1.336011, 2.083379, -0.04477801, 1, 0.6235294, 0, 1,
-1.334374, -1.224817, -2.655302, 1, 0.6313726, 0, 1,
-1.331166, 0.1163686, -0.1449958, 1, 0.6352941, 0, 1,
-1.321758, 0.9499336, -0.8385912, 1, 0.6431373, 0, 1,
-1.310384, 1.095155, -2.043386, 1, 0.6470588, 0, 1,
-1.291379, 0.8332253, 0.05680573, 1, 0.654902, 0, 1,
-1.287062, 0.4625206, -1.003749, 1, 0.6588235, 0, 1,
-1.282591, -0.2307317, -3.038232, 1, 0.6666667, 0, 1,
-1.278095, 1.510596, 0.2937762, 1, 0.6705883, 0, 1,
-1.275139, -0.4289906, -1.24225, 1, 0.6784314, 0, 1,
-1.271604, 2.03214, -0.1809022, 1, 0.682353, 0, 1,
-1.271447, 0.9150843, -0.4882556, 1, 0.6901961, 0, 1,
-1.268618, -1.793495, -1.232651, 1, 0.6941177, 0, 1,
-1.267979, 0.3769798, -1.069953, 1, 0.7019608, 0, 1,
-1.265911, 2.135113, 0.04334603, 1, 0.7098039, 0, 1,
-1.26195, -1.176987, -4.117626, 1, 0.7137255, 0, 1,
-1.256136, -1.725217, -2.772216, 1, 0.7215686, 0, 1,
-1.246338, -0.3917402, -3.008376, 1, 0.7254902, 0, 1,
-1.24378, -1.546266, -3.173968, 1, 0.7333333, 0, 1,
-1.238675, -2.375884, -2.560897, 1, 0.7372549, 0, 1,
-1.233245, -0.9971633, -2.857781, 1, 0.7450981, 0, 1,
-1.222972, 0.769792, -1.757202, 1, 0.7490196, 0, 1,
-1.21269, 0.4067658, -1.166286, 1, 0.7568628, 0, 1,
-1.208769, 0.1491022, -0.1233638, 1, 0.7607843, 0, 1,
-1.182392, 1.085576, 1.014942, 1, 0.7686275, 0, 1,
-1.182029, -0.998385, -2.809427, 1, 0.772549, 0, 1,
-1.173799, -0.3415104, -2.041083, 1, 0.7803922, 0, 1,
-1.172557, -0.6000674, -3.051138, 1, 0.7843137, 0, 1,
-1.168878, 0.7455645, -0.4184471, 1, 0.7921569, 0, 1,
-1.168612, 0.5382265, -0.7165838, 1, 0.7960784, 0, 1,
-1.161101, 0.3961577, -2.153088, 1, 0.8039216, 0, 1,
-1.151995, -0.6800822, -1.247938, 1, 0.8117647, 0, 1,
-1.149477, -0.2297151, -0.2415463, 1, 0.8156863, 0, 1,
-1.144584, -0.11308, -2.039696, 1, 0.8235294, 0, 1,
-1.142694, -1.729036, -2.789054, 1, 0.827451, 0, 1,
-1.132717, -0.7511014, -0.7059439, 1, 0.8352941, 0, 1,
-1.12666, -0.6383746, -1.753654, 1, 0.8392157, 0, 1,
-1.126235, 2.783474, -0.388888, 1, 0.8470588, 0, 1,
-1.122583, -0.1711808, -1.087146, 1, 0.8509804, 0, 1,
-1.117054, 0.07811812, -1.83931, 1, 0.8588235, 0, 1,
-1.113964, 1.263272, -2.522803, 1, 0.8627451, 0, 1,
-1.105636, -1.001459, -2.760024, 1, 0.8705882, 0, 1,
-1.093859, -0.00166788, -0.5345581, 1, 0.8745098, 0, 1,
-1.092031, -0.7712976, -2.832465, 1, 0.8823529, 0, 1,
-1.088038, -0.02227996, -1.871577, 1, 0.8862745, 0, 1,
-1.082016, 0.3448597, -2.160331, 1, 0.8941177, 0, 1,
-1.069111, 1.076117, -1.140801, 1, 0.8980392, 0, 1,
-1.068875, 0.4881455, -1.193551, 1, 0.9058824, 0, 1,
-1.065545, -0.1742663, -2.234095, 1, 0.9137255, 0, 1,
-1.062919, -0.6288052, -1.807464, 1, 0.9176471, 0, 1,
-1.060237, -0.2200491, -1.817913, 1, 0.9254902, 0, 1,
-1.052134, -0.6048975, -1.952353, 1, 0.9294118, 0, 1,
-1.047814, 1.175053, -0.9960912, 1, 0.9372549, 0, 1,
-1.043984, 0.1260971, -0.5503447, 1, 0.9411765, 0, 1,
-1.043346, 0.229434, -0.7750815, 1, 0.9490196, 0, 1,
-1.037202, -2.681722, -2.734334, 1, 0.9529412, 0, 1,
-1.034689, 1.462633, -1.688065, 1, 0.9607843, 0, 1,
-1.030139, 0.5830995, -2.222855, 1, 0.9647059, 0, 1,
-1.02969, -0.5716306, -1.918684, 1, 0.972549, 0, 1,
-1.022092, -0.8080014, -1.367376, 1, 0.9764706, 0, 1,
-1.016728, 0.0918245, -1.177775, 1, 0.9843137, 0, 1,
-1.013174, -0.155024, -1.078608, 1, 0.9882353, 0, 1,
-1.005014, 0.06089359, -1.966378, 1, 0.9960784, 0, 1,
-0.9993131, 0.3591996, -1.672515, 0.9960784, 1, 0, 1,
-0.9980165, -2.73008, -2.778608, 0.9921569, 1, 0, 1,
-0.9955412, 0.817325, -1.118836, 0.9843137, 1, 0, 1,
-0.9787743, -1.996683, -2.007451, 0.9803922, 1, 0, 1,
-0.9765593, -1.40636, -3.393516, 0.972549, 1, 0, 1,
-0.9727604, 1.069523, 0.3668733, 0.9686275, 1, 0, 1,
-0.9706368, 1.793505, -1.692947, 0.9607843, 1, 0, 1,
-0.9685099, 1.159583, -1.327129, 0.9568627, 1, 0, 1,
-0.9674327, 0.588361, -2.582537, 0.9490196, 1, 0, 1,
-0.9593645, 0.3721047, -2.192532, 0.945098, 1, 0, 1,
-0.9564029, 0.1844685, -1.073811, 0.9372549, 1, 0, 1,
-0.9450671, 0.1383077, -1.786955, 0.9333333, 1, 0, 1,
-0.9450213, 0.1130625, -2.44921, 0.9254902, 1, 0, 1,
-0.9443986, -0.353015, -2.171441, 0.9215686, 1, 0, 1,
-0.9418793, 0.7203166, -0.7081272, 0.9137255, 1, 0, 1,
-0.9274341, 0.6248407, -0.565937, 0.9098039, 1, 0, 1,
-0.9255932, 0.6165644, -1.144246, 0.9019608, 1, 0, 1,
-0.9233575, -1.714697, -2.832567, 0.8941177, 1, 0, 1,
-0.9204885, 1.68047, -1.344875, 0.8901961, 1, 0, 1,
-0.9036517, -1.37204, -3.14892, 0.8823529, 1, 0, 1,
-0.8990567, 0.980803, 0.1723433, 0.8784314, 1, 0, 1,
-0.8982984, 0.8016648, -1.03635, 0.8705882, 1, 0, 1,
-0.8902726, 0.6079383, -2.720078, 0.8666667, 1, 0, 1,
-0.8881737, -1.441674, -2.525488, 0.8588235, 1, 0, 1,
-0.8871168, -2.02242, -3.994589, 0.854902, 1, 0, 1,
-0.8819823, -0.8939467, -2.234224, 0.8470588, 1, 0, 1,
-0.8814532, -0.2406713, -2.456292, 0.8431373, 1, 0, 1,
-0.8741661, 1.827217, 0.06705769, 0.8352941, 1, 0, 1,
-0.86071, -1.640285, -2.677002, 0.8313726, 1, 0, 1,
-0.8590837, -0.6377916, -2.81651, 0.8235294, 1, 0, 1,
-0.8475942, -0.2731812, -1.542106, 0.8196079, 1, 0, 1,
-0.8421577, 0.2298365, -1.368502, 0.8117647, 1, 0, 1,
-0.8418643, -0.4174776, -3.157259, 0.8078431, 1, 0, 1,
-0.8380978, 0.07744159, -1.53528, 0.8, 1, 0, 1,
-0.8302083, -1.300392, -1.404004, 0.7921569, 1, 0, 1,
-0.8192669, 0.2117914, -1.824328, 0.7882353, 1, 0, 1,
-0.8188578, 0.9491374, -2.843183, 0.7803922, 1, 0, 1,
-0.807151, -0.7524678, -0.3057659, 0.7764706, 1, 0, 1,
-0.8046222, 0.005584784, -2.186042, 0.7686275, 1, 0, 1,
-0.7987486, 1.32046, -1.451308, 0.7647059, 1, 0, 1,
-0.7951508, 0.6685274, -2.277501, 0.7568628, 1, 0, 1,
-0.7912033, -0.2773517, -3.273124, 0.7529412, 1, 0, 1,
-0.7898, 1.671697, -0.975252, 0.7450981, 1, 0, 1,
-0.7893187, -1.396352, -3.155884, 0.7411765, 1, 0, 1,
-0.786029, -1.536013, -1.849443, 0.7333333, 1, 0, 1,
-0.7856623, -0.3026958, -1.205135, 0.7294118, 1, 0, 1,
-0.7854626, -0.753081, -0.1331457, 0.7215686, 1, 0, 1,
-0.7851912, 1.090016, 1.41674, 0.7176471, 1, 0, 1,
-0.7786281, 0.6429896, -2.661921, 0.7098039, 1, 0, 1,
-0.7773554, -1.778323, -1.483056, 0.7058824, 1, 0, 1,
-0.7719909, 0.5557259, -2.266611, 0.6980392, 1, 0, 1,
-0.7704425, 0.6803624, -1.000341, 0.6901961, 1, 0, 1,
-0.7691845, 1.125422, -0.9328301, 0.6862745, 1, 0, 1,
-0.7647133, -0.4321404, -0.8626146, 0.6784314, 1, 0, 1,
-0.7637598, -0.2701702, -2.318058, 0.6745098, 1, 0, 1,
-0.7609372, 0.01092467, -1.639367, 0.6666667, 1, 0, 1,
-0.7561648, -0.07324341, -1.126743, 0.6627451, 1, 0, 1,
-0.7530013, -0.6370285, -2.261926, 0.654902, 1, 0, 1,
-0.7519947, 1.327766, -0.6046451, 0.6509804, 1, 0, 1,
-0.7484395, -0.5092951, -1.790371, 0.6431373, 1, 0, 1,
-0.7454267, 0.06048689, -0.6694315, 0.6392157, 1, 0, 1,
-0.7405665, 0.151248, -0.9443506, 0.6313726, 1, 0, 1,
-0.7364569, 1.226541, -1.675373, 0.627451, 1, 0, 1,
-0.7268317, 1.484942, -2.836949, 0.6196079, 1, 0, 1,
-0.7250488, 0.9579785, 0.1499529, 0.6156863, 1, 0, 1,
-0.7228598, -0.2570182, -0.2850256, 0.6078432, 1, 0, 1,
-0.7194635, -0.8959236, -2.082509, 0.6039216, 1, 0, 1,
-0.7122359, 1.608151, -0.5810854, 0.5960785, 1, 0, 1,
-0.7097868, 0.7840837, 0.7850046, 0.5882353, 1, 0, 1,
-0.7011065, -0.6232907, -1.114442, 0.5843138, 1, 0, 1,
-0.6977894, -0.009301394, -1.957149, 0.5764706, 1, 0, 1,
-0.6914493, -1.424167, -1.80792, 0.572549, 1, 0, 1,
-0.6862793, 0.9280245, -1.377817, 0.5647059, 1, 0, 1,
-0.6844568, -0.1651427, -2.174772, 0.5607843, 1, 0, 1,
-0.6833206, -0.1068189, 0.6702946, 0.5529412, 1, 0, 1,
-0.6813422, -1.329993, -2.769302, 0.5490196, 1, 0, 1,
-0.6759726, 0.423754, -1.475739, 0.5411765, 1, 0, 1,
-0.6735674, 0.6915091, -0.411482, 0.5372549, 1, 0, 1,
-0.6719142, -0.3641544, -2.332831, 0.5294118, 1, 0, 1,
-0.6676499, -1.151724, -3.413805, 0.5254902, 1, 0, 1,
-0.6633509, -2.058011, -4.686569, 0.5176471, 1, 0, 1,
-0.6612396, -0.5043718, -2.682936, 0.5137255, 1, 0, 1,
-0.6519674, 0.2177936, -0.432217, 0.5058824, 1, 0, 1,
-0.643173, -1.364727, -1.198485, 0.5019608, 1, 0, 1,
-0.6413907, 0.6282368, 0.1377085, 0.4941176, 1, 0, 1,
-0.6394072, -0.6325865, -1.971935, 0.4862745, 1, 0, 1,
-0.638047, -0.3604088, -0.6754011, 0.4823529, 1, 0, 1,
-0.6375784, -0.2641328, 0.06247835, 0.4745098, 1, 0, 1,
-0.63442, 0.9367748, -0.8764449, 0.4705882, 1, 0, 1,
-0.6312457, 0.1984687, -0.9191726, 0.4627451, 1, 0, 1,
-0.6175718, 0.1309032, -2.036561, 0.4588235, 1, 0, 1,
-0.614406, 0.03488675, -3.779649, 0.4509804, 1, 0, 1,
-0.6133036, -0.6611094, -1.385113, 0.4470588, 1, 0, 1,
-0.6117202, 1.61745, -0.3210731, 0.4392157, 1, 0, 1,
-0.6106889, 0.833257, -2.228541, 0.4352941, 1, 0, 1,
-0.6074563, -1.099759, -2.954654, 0.427451, 1, 0, 1,
-0.6038644, 0.2129748, -0.3230069, 0.4235294, 1, 0, 1,
-0.6016107, -1.352733, -2.172061, 0.4156863, 1, 0, 1,
-0.5997256, 0.7556955, -1.262625, 0.4117647, 1, 0, 1,
-0.598038, -0.5871766, -2.540402, 0.4039216, 1, 0, 1,
-0.5943002, -0.834577, -1.302781, 0.3960784, 1, 0, 1,
-0.5926276, -0.1678142, 0.4074589, 0.3921569, 1, 0, 1,
-0.5834495, -0.7731165, -4.44796, 0.3843137, 1, 0, 1,
-0.5826105, 1.27521, 0.6525394, 0.3803922, 1, 0, 1,
-0.5728458, -0.5890823, -4.450084, 0.372549, 1, 0, 1,
-0.5710306, 0.7324479, -1.445412, 0.3686275, 1, 0, 1,
-0.5707315, -0.01197444, -1.464981, 0.3607843, 1, 0, 1,
-0.569356, -1.110684, -3.664417, 0.3568628, 1, 0, 1,
-0.5588694, -1.19857, -1.11488, 0.3490196, 1, 0, 1,
-0.555423, 0.9140257, -0.2800916, 0.345098, 1, 0, 1,
-0.5499471, 0.4086396, -1.600231, 0.3372549, 1, 0, 1,
-0.5451054, -0.7574065, -2.516471, 0.3333333, 1, 0, 1,
-0.5445723, 0.8374035, 0.5676501, 0.3254902, 1, 0, 1,
-0.5443521, 1.962109, 1.173665, 0.3215686, 1, 0, 1,
-0.5418184, -0.2519194, -2.760424, 0.3137255, 1, 0, 1,
-0.5391292, -0.9149582, -4.732494, 0.3098039, 1, 0, 1,
-0.5382429, 0.426295, -0.4454901, 0.3019608, 1, 0, 1,
-0.5382208, -0.2278636, -1.888796, 0.2941177, 1, 0, 1,
-0.5344325, 1.604715, 1.05458, 0.2901961, 1, 0, 1,
-0.5343222, -0.2340188, -0.754257, 0.282353, 1, 0, 1,
-0.5326505, -0.04976205, -1.696024, 0.2784314, 1, 0, 1,
-0.5308625, 0.552054, -0.6648047, 0.2705882, 1, 0, 1,
-0.5236428, -0.8974752, -3.354366, 0.2666667, 1, 0, 1,
-0.517554, 0.5259504, 0.3909331, 0.2588235, 1, 0, 1,
-0.5170138, 1.569306, -0.1076669, 0.254902, 1, 0, 1,
-0.5155884, -0.520675, -3.639441, 0.2470588, 1, 0, 1,
-0.5128878, -1.145244, -2.382238, 0.2431373, 1, 0, 1,
-0.5120875, 1.576433, -2.102701, 0.2352941, 1, 0, 1,
-0.5088856, -0.6509655, -1.909704, 0.2313726, 1, 0, 1,
-0.5035036, -0.9541615, -2.90659, 0.2235294, 1, 0, 1,
-0.5012713, 1.112802, -1.551818, 0.2196078, 1, 0, 1,
-0.4994289, 0.6627251, -0.4198725, 0.2117647, 1, 0, 1,
-0.4950566, 1.198476, -0.2888105, 0.2078431, 1, 0, 1,
-0.4942484, 0.3737522, -1.301067, 0.2, 1, 0, 1,
-0.4907805, -0.6231845, -0.5323853, 0.1921569, 1, 0, 1,
-0.4849089, -1.364725, -2.476889, 0.1882353, 1, 0, 1,
-0.4826021, 1.666333, 0.6272003, 0.1803922, 1, 0, 1,
-0.482104, -0.7407288, -3.059143, 0.1764706, 1, 0, 1,
-0.481174, -1.76033, -1.809456, 0.1686275, 1, 0, 1,
-0.4728191, -0.8545183, -1.717367, 0.1647059, 1, 0, 1,
-0.4689262, 2.054626, 0.6298601, 0.1568628, 1, 0, 1,
-0.4686314, 0.1355079, -1.051594, 0.1529412, 1, 0, 1,
-0.4664886, 1.22017, -0.3072712, 0.145098, 1, 0, 1,
-0.466028, -0.04732399, -3.377853, 0.1411765, 1, 0, 1,
-0.4642593, 0.1133711, -0.3506394, 0.1333333, 1, 0, 1,
-0.4630321, 0.1272672, -1.467383, 0.1294118, 1, 0, 1,
-0.461789, 0.4624491, -0.6700748, 0.1215686, 1, 0, 1,
-0.4580756, 0.3242538, -1.082994, 0.1176471, 1, 0, 1,
-0.4537682, -0.6474245, -2.471259, 0.1098039, 1, 0, 1,
-0.4502562, 1.025828, -0.1382622, 0.1058824, 1, 0, 1,
-0.4498981, -0.1008791, 1.578039, 0.09803922, 1, 0, 1,
-0.447056, -0.1000771, -2.17423, 0.09019608, 1, 0, 1,
-0.4456966, -0.5183374, -2.739909, 0.08627451, 1, 0, 1,
-0.4404653, 0.5269614, -0.8668357, 0.07843138, 1, 0, 1,
-0.4366449, -0.166988, -2.335098, 0.07450981, 1, 0, 1,
-0.4309261, 1.235198, 0.4926199, 0.06666667, 1, 0, 1,
-0.4289764, -2.452141, -2.69892, 0.0627451, 1, 0, 1,
-0.4268878, 0.4108453, -2.260536, 0.05490196, 1, 0, 1,
-0.4245733, 1.793408, -1.108822, 0.05098039, 1, 0, 1,
-0.4175086, 0.02804893, -1.324836, 0.04313726, 1, 0, 1,
-0.4063397, 0.2134924, 0.6633594, 0.03921569, 1, 0, 1,
-0.3998085, -1.131555, -2.690604, 0.03137255, 1, 0, 1,
-0.3996649, 0.8862224, -0.7026346, 0.02745098, 1, 0, 1,
-0.3990488, -1.049126, -2.118306, 0.01960784, 1, 0, 1,
-0.397679, -0.3900712, -3.351669, 0.01568628, 1, 0, 1,
-0.3928253, -0.3698323, -2.304682, 0.007843138, 1, 0, 1,
-0.3918978, 0.7550774, -1.105542, 0.003921569, 1, 0, 1,
-0.3896939, 0.2761523, -2.134349, 0, 1, 0.003921569, 1,
-0.386997, -0.4314525, -3.64222, 0, 1, 0.01176471, 1,
-0.3867544, 1.047605, -0.1421961, 0, 1, 0.01568628, 1,
-0.3850459, -0.5618067, -1.766258, 0, 1, 0.02352941, 1,
-0.3849453, -1.344644, -2.531722, 0, 1, 0.02745098, 1,
-0.3820057, 1.029253, -0.5684726, 0, 1, 0.03529412, 1,
-0.3812565, -1.008831, -0.6022762, 0, 1, 0.03921569, 1,
-0.3725839, -0.8266547, -2.168598, 0, 1, 0.04705882, 1,
-0.3717929, -0.03354872, -3.042584, 0, 1, 0.05098039, 1,
-0.3683781, 0.4648107, -0.439355, 0, 1, 0.05882353, 1,
-0.3668769, -1.811421, -2.883618, 0, 1, 0.0627451, 1,
-0.3641654, -0.4504231, -2.80201, 0, 1, 0.07058824, 1,
-0.3634948, -1.138697, -4.002136, 0, 1, 0.07450981, 1,
-0.3627163, -1.079543, -3.089918, 0, 1, 0.08235294, 1,
-0.3617688, 0.7297958, 0.2665746, 0, 1, 0.08627451, 1,
-0.355923, 0.6627939, 0.2109837, 0, 1, 0.09411765, 1,
-0.3504143, -0.2510544, -1.83125, 0, 1, 0.1019608, 1,
-0.3481032, -0.3909878, -1.290192, 0, 1, 0.1058824, 1,
-0.3443955, -1.151578, -2.592818, 0, 1, 0.1137255, 1,
-0.3443306, -0.8057098, -1.32152, 0, 1, 0.1176471, 1,
-0.3442194, -0.6396606, -3.49493, 0, 1, 0.1254902, 1,
-0.344082, 0.8837355, -0.08578792, 0, 1, 0.1294118, 1,
-0.3437368, 0.5423872, -1.771855, 0, 1, 0.1372549, 1,
-0.3207491, -0.003052832, -1.032904, 0, 1, 0.1411765, 1,
-0.3190229, 0.03597671, -1.557563, 0, 1, 0.1490196, 1,
-0.3187899, -0.8536636, -2.925685, 0, 1, 0.1529412, 1,
-0.3163956, -1.079908, -1.304601, 0, 1, 0.1607843, 1,
-0.3144313, -0.850652, -3.150569, 0, 1, 0.1647059, 1,
-0.3141594, -1.649527, -4.42518, 0, 1, 0.172549, 1,
-0.3140355, -0.4566856, -4.055398, 0, 1, 0.1764706, 1,
-0.3123948, -0.7036021, -1.812842, 0, 1, 0.1843137, 1,
-0.3104332, -0.4570306, -2.354131, 0, 1, 0.1882353, 1,
-0.3083718, 0.1831203, -2.337695, 0, 1, 0.1960784, 1,
-0.303377, -0.5833852, -3.179961, 0, 1, 0.2039216, 1,
-0.3026857, -1.823175, -1.998205, 0, 1, 0.2078431, 1,
-0.299906, -1.000196, -2.373078, 0, 1, 0.2156863, 1,
-0.2955154, -0.9963393, -3.843947, 0, 1, 0.2196078, 1,
-0.290258, -1.200972, -2.106978, 0, 1, 0.227451, 1,
-0.2871014, 0.1786022, -0.3414593, 0, 1, 0.2313726, 1,
-0.2864511, 2.746285, -0.7063613, 0, 1, 0.2392157, 1,
-0.2864337, -1.254422, -4.170039, 0, 1, 0.2431373, 1,
-0.2833043, -0.8637707, -2.395807, 0, 1, 0.2509804, 1,
-0.2832001, -0.2307324, -3.182311, 0, 1, 0.254902, 1,
-0.2813921, 0.08047327, -1.607309, 0, 1, 0.2627451, 1,
-0.2806177, -0.9133658, -4.332493, 0, 1, 0.2666667, 1,
-0.2752075, 0.5308858, -0.7327503, 0, 1, 0.2745098, 1,
-0.2751565, -0.1908514, -2.512316, 0, 1, 0.2784314, 1,
-0.2695701, -0.5244207, -2.135906, 0, 1, 0.2862745, 1,
-0.2673057, 0.1964652, -0.3587044, 0, 1, 0.2901961, 1,
-0.2667814, -1.041088, -3.929549, 0, 1, 0.2980392, 1,
-0.2658162, 0.4601171, 0.1245737, 0, 1, 0.3058824, 1,
-0.2632234, -0.01820961, -3.058501, 0, 1, 0.3098039, 1,
-0.2617967, 1.469831, -1.574536, 0, 1, 0.3176471, 1,
-0.2606464, 2.741497, -0.1417773, 0, 1, 0.3215686, 1,
-0.2566248, 0.8053233, 0.06944031, 0, 1, 0.3294118, 1,
-0.2563473, 0.8420729, -0.04759296, 0, 1, 0.3333333, 1,
-0.2559996, -0.645156, -1.28551, 0, 1, 0.3411765, 1,
-0.2534151, 1.240867, 0.01817166, 0, 1, 0.345098, 1,
-0.2508209, -1.201847, -1.394359, 0, 1, 0.3529412, 1,
-0.2507663, -0.4237634, -1.918261, 0, 1, 0.3568628, 1,
-0.2449004, -1.314889, -3.500562, 0, 1, 0.3647059, 1,
-0.2406579, -1.573054, -3.012726, 0, 1, 0.3686275, 1,
-0.2384582, -1.610246, -3.901956, 0, 1, 0.3764706, 1,
-0.2376562, 1.143845, -1.170012, 0, 1, 0.3803922, 1,
-0.2363158, 0.5712026, -1.617519, 0, 1, 0.3882353, 1,
-0.2345968, 1.407746, 1.282471, 0, 1, 0.3921569, 1,
-0.2305383, -0.8729264, -2.031368, 0, 1, 0.4, 1,
-0.2294213, 0.06166333, -2.136781, 0, 1, 0.4078431, 1,
-0.2286448, -2.663667, -3.635967, 0, 1, 0.4117647, 1,
-0.2236297, -0.6844522, -2.22367, 0, 1, 0.4196078, 1,
-0.2200441, 0.1439577, -0.4017206, 0, 1, 0.4235294, 1,
-0.2187296, -1.54363, -3.029306, 0, 1, 0.4313726, 1,
-0.2186616, 1.05998, 1.866554, 0, 1, 0.4352941, 1,
-0.2145916, -1.283341, -3.481635, 0, 1, 0.4431373, 1,
-0.2103406, -0.04414259, -1.045899, 0, 1, 0.4470588, 1,
-0.2092094, 1.823365, 0.920162, 0, 1, 0.454902, 1,
-0.2071862, -0.5921965, -3.935753, 0, 1, 0.4588235, 1,
-0.2051212, -0.8153003, -4.812385, 0, 1, 0.4666667, 1,
-0.203338, -0.1626091, -3.649065, 0, 1, 0.4705882, 1,
-0.1965469, -2.197004, -2.795711, 0, 1, 0.4784314, 1,
-0.1927203, -1.23813, -1.719425, 0, 1, 0.4823529, 1,
-0.1883422, 1.015612, 0.2227684, 0, 1, 0.4901961, 1,
-0.1881771, -0.3792387, -3.49065, 0, 1, 0.4941176, 1,
-0.185204, -1.279628, -4.530782, 0, 1, 0.5019608, 1,
-0.183237, -0.8011721, -3.43481, 0, 1, 0.509804, 1,
-0.1831047, -1.212364, -1.985071, 0, 1, 0.5137255, 1,
-0.1825524, 1.197374, -0.5438516, 0, 1, 0.5215687, 1,
-0.1796686, -1.309237, -1.57147, 0, 1, 0.5254902, 1,
-0.1776441, -0.7793601, -2.829401, 0, 1, 0.5333334, 1,
-0.1763217, 1.165415, 0.3061684, 0, 1, 0.5372549, 1,
-0.1723253, 1.589272, -0.7493474, 0, 1, 0.5450981, 1,
-0.1719413, -0.02780715, -0.9783742, 0, 1, 0.5490196, 1,
-0.1692706, 0.2345978, 0.03954137, 0, 1, 0.5568628, 1,
-0.1684227, 0.166072, -2.081587, 0, 1, 0.5607843, 1,
-0.164638, -0.05059991, -0.6309085, 0, 1, 0.5686275, 1,
-0.1645977, 0.2870182, -0.7974169, 0, 1, 0.572549, 1,
-0.1617091, -1.295299, -2.849561, 0, 1, 0.5803922, 1,
-0.1606885, -0.2487109, -0.9901561, 0, 1, 0.5843138, 1,
-0.1592476, -0.805745, -1.424721, 0, 1, 0.5921569, 1,
-0.1556494, 1.924113, -1.142905, 0, 1, 0.5960785, 1,
-0.1505875, -2.720753, -3.288632, 0, 1, 0.6039216, 1,
-0.1477683, 0.9244983, 0.1862523, 0, 1, 0.6117647, 1,
-0.13848, -0.4160944, -2.110546, 0, 1, 0.6156863, 1,
-0.1380823, 0.1798159, -1.121738, 0, 1, 0.6235294, 1,
-0.1378804, -0.1459841, -3.546966, 0, 1, 0.627451, 1,
-0.1334694, 0.1646523, -2.34386, 0, 1, 0.6352941, 1,
-0.1303623, 0.5666109, -0.4529545, 0, 1, 0.6392157, 1,
-0.1292706, 0.638045, 0.3169487, 0, 1, 0.6470588, 1,
-0.1278711, -0.2161486, -2.292391, 0, 1, 0.6509804, 1,
-0.1272251, -1.867233, -2.988812, 0, 1, 0.6588235, 1,
-0.1252468, 0.08667661, -0.3011258, 0, 1, 0.6627451, 1,
-0.1155492, 0.9074035, -0.1661917, 0, 1, 0.6705883, 1,
-0.1125641, -0.6961676, -2.918976, 0, 1, 0.6745098, 1,
-0.1117712, -0.60533, -3.947188, 0, 1, 0.682353, 1,
-0.109021, -0.9204979, -2.028084, 0, 1, 0.6862745, 1,
-0.1016729, -0.5652008, -2.388013, 0, 1, 0.6941177, 1,
-0.1011223, -0.466149, -3.190398, 0, 1, 0.7019608, 1,
-0.0994534, 0.974613, 0.1507425, 0, 1, 0.7058824, 1,
-0.08620157, -0.1304634, -4.421151, 0, 1, 0.7137255, 1,
-0.08247671, 0.6552008, -1.246785, 0, 1, 0.7176471, 1,
-0.07988036, 0.1164157, -1.432061, 0, 1, 0.7254902, 1,
-0.07527486, 0.2926666, -0.5635021, 0, 1, 0.7294118, 1,
-0.06490658, 0.4668799, 0.8197805, 0, 1, 0.7372549, 1,
-0.06348119, -0.6195326, -2.335507, 0, 1, 0.7411765, 1,
-0.0618754, 0.6107058, -2.986232, 0, 1, 0.7490196, 1,
-0.06113372, 0.5002451, -2.639743, 0, 1, 0.7529412, 1,
-0.06001226, -0.08487018, -2.465204, 0, 1, 0.7607843, 1,
-0.05764439, 0.334223, -1.058589, 0, 1, 0.7647059, 1,
-0.0575964, -0.7061768, -1.931474, 0, 1, 0.772549, 1,
-0.05195529, 0.1198046, -0.6986957, 0, 1, 0.7764706, 1,
-0.05057007, -0.1793857, -2.271853, 0, 1, 0.7843137, 1,
-0.04893895, -1.57427, -2.699638, 0, 1, 0.7882353, 1,
-0.04851259, -0.255652, -4.822905, 0, 1, 0.7960784, 1,
-0.04827229, -0.5237181, -2.069899, 0, 1, 0.8039216, 1,
-0.04704244, -2.283516, -2.768173, 0, 1, 0.8078431, 1,
-0.04560028, 0.6182814, 0.1822255, 0, 1, 0.8156863, 1,
-0.04546499, 0.8312111, 1.34286, 0, 1, 0.8196079, 1,
-0.04447837, -0.5752086, -4.014806, 0, 1, 0.827451, 1,
-0.04348896, 0.4927105, -1.074606, 0, 1, 0.8313726, 1,
-0.0363627, -2.146941, -1.576131, 0, 1, 0.8392157, 1,
-0.03594576, -0.3642661, -2.814276, 0, 1, 0.8431373, 1,
-0.03322016, 1.387018, 0.2684222, 0, 1, 0.8509804, 1,
-0.03130742, -1.774807, -2.959402, 0, 1, 0.854902, 1,
-0.02792014, -0.2830674, -2.442375, 0, 1, 0.8627451, 1,
-0.02714724, 0.3881995, 1.433844, 0, 1, 0.8666667, 1,
-0.02600828, 1.513624, -1.730644, 0, 1, 0.8745098, 1,
-0.0249726, -2.80035, -4.318331, 0, 1, 0.8784314, 1,
-0.02406786, 0.178927, -0.4267727, 0, 1, 0.8862745, 1,
-0.02385143, -0.6687912, -3.720097, 0, 1, 0.8901961, 1,
-0.02067409, 0.1428259, -0.973184, 0, 1, 0.8980392, 1,
-0.01968035, -1.002231, -2.930369, 0, 1, 0.9058824, 1,
-0.01904947, 0.3207867, -0.4569714, 0, 1, 0.9098039, 1,
-0.01761391, -1.484356, -3.711586, 0, 1, 0.9176471, 1,
-0.01657238, 0.08719077, 0.6644794, 0, 1, 0.9215686, 1,
-0.01649227, 1.159895, 0.4211297, 0, 1, 0.9294118, 1,
-0.01595251, 0.01462849, -1.79203, 0, 1, 0.9333333, 1,
-0.01511818, 0.01422625, -0.8151612, 0, 1, 0.9411765, 1,
-0.01151384, -1.563499, -2.798268, 0, 1, 0.945098, 1,
-0.01103949, -0.4932394, -2.188923, 0, 1, 0.9529412, 1,
-0.01099224, -0.4099334, -3.635878, 0, 1, 0.9568627, 1,
-0.01059848, -0.9557759, -3.226815, 0, 1, 0.9647059, 1,
-0.01011046, -0.7960641, -2.409214, 0, 1, 0.9686275, 1,
-0.01010322, -1.585786, -3.926379, 0, 1, 0.9764706, 1,
-0.01009389, 0.3272565, -0.04747191, 0, 1, 0.9803922, 1,
-0.007080418, -0.7868077, -3.995067, 0, 1, 0.9882353, 1,
-0.004984522, -0.3324424, -5.471036, 0, 1, 0.9921569, 1,
-0.004278146, 0.008355737, 0.7465531, 0, 1, 1, 1,
-0.003913819, 1.736329, 2.29536, 0, 0.9921569, 1, 1,
0.002977702, -1.815271, 3.555581, 0, 0.9882353, 1, 1,
0.00362369, -1.176774, 1.755902, 0, 0.9803922, 1, 1,
0.00448403, -1.045376, 1.76292, 0, 0.9764706, 1, 1,
0.005045165, 0.06355598, -0.91855, 0, 0.9686275, 1, 1,
0.008350596, -0.7736098, 2.149171, 0, 0.9647059, 1, 1,
0.009446518, -0.1787853, 3.171762, 0, 0.9568627, 1, 1,
0.01049451, 0.1861982, 0.7854915, 0, 0.9529412, 1, 1,
0.01066954, 1.65741, 1.40671, 0, 0.945098, 1, 1,
0.01078939, -0.9236435, 1.714504, 0, 0.9411765, 1, 1,
0.02013889, -0.1601951, 3.381466, 0, 0.9333333, 1, 1,
0.02104669, -0.9687853, 1.443553, 0, 0.9294118, 1, 1,
0.03414966, 1.834314, -1.863392, 0, 0.9215686, 1, 1,
0.03527515, 0.03956723, 0.4952963, 0, 0.9176471, 1, 1,
0.03706334, -1.005644, 3.266463, 0, 0.9098039, 1, 1,
0.04163907, 1.846144, 0.1391346, 0, 0.9058824, 1, 1,
0.04611751, -1.569181, 2.476891, 0, 0.8980392, 1, 1,
0.04697791, 0.4038728, 1.389526, 0, 0.8901961, 1, 1,
0.04931593, 1.786129, 2.12382, 0, 0.8862745, 1, 1,
0.05000239, 0.9323247, 0.6770881, 0, 0.8784314, 1, 1,
0.05371356, 0.4806149, 0.8209587, 0, 0.8745098, 1, 1,
0.0540695, 0.25834, -0.1775183, 0, 0.8666667, 1, 1,
0.05623597, -0.4021035, 3.252088, 0, 0.8627451, 1, 1,
0.06374399, 1.544886, 0.3967972, 0, 0.854902, 1, 1,
0.06424242, 0.1723705, -0.9648688, 0, 0.8509804, 1, 1,
0.06497367, -0.3040412, 4.071967, 0, 0.8431373, 1, 1,
0.06531692, -1.034357, 3.18424, 0, 0.8392157, 1, 1,
0.06689527, -0.1755371, 3.138962, 0, 0.8313726, 1, 1,
0.06797679, 1.963624, -1.80876, 0, 0.827451, 1, 1,
0.06849679, -0.5838259, 4.321243, 0, 0.8196079, 1, 1,
0.06944463, -0.7890706, 4.397228, 0, 0.8156863, 1, 1,
0.0695839, 1.595282, 1.000308, 0, 0.8078431, 1, 1,
0.07007182, 0.5757666, 1.757071, 0, 0.8039216, 1, 1,
0.07711767, -1.249116, 3.641573, 0, 0.7960784, 1, 1,
0.07844412, -0.09562612, 2.145725, 0, 0.7882353, 1, 1,
0.07911342, -1.943865, 3.476818, 0, 0.7843137, 1, 1,
0.0800124, 0.2392326, -1.300151, 0, 0.7764706, 1, 1,
0.08108844, -0.4354236, 4.655716, 0, 0.772549, 1, 1,
0.08461449, -1.261566, 3.54618, 0, 0.7647059, 1, 1,
0.09615778, 0.1626232, 1.977519, 0, 0.7607843, 1, 1,
0.1078361, -0.8499687, 3.54174, 0, 0.7529412, 1, 1,
0.1090962, -0.5487544, 3.626504, 0, 0.7490196, 1, 1,
0.1157991, -0.4714931, 1.864303, 0, 0.7411765, 1, 1,
0.1214441, -1.288983, 2.417271, 0, 0.7372549, 1, 1,
0.1229846, 0.05098747, 1.689141, 0, 0.7294118, 1, 1,
0.1267949, -0.983888, 2.846416, 0, 0.7254902, 1, 1,
0.128241, 0.4693637, 2.559839, 0, 0.7176471, 1, 1,
0.1297827, -0.9569493, 4.144153, 0, 0.7137255, 1, 1,
0.1318038, -0.1917454, 2.781924, 0, 0.7058824, 1, 1,
0.1333245, -0.4511745, 3.343658, 0, 0.6980392, 1, 1,
0.133703, 2.225288, -0.01515089, 0, 0.6941177, 1, 1,
0.1364971, -0.7188315, 3.070036, 0, 0.6862745, 1, 1,
0.1383605, 0.7927814, -1.249013, 0, 0.682353, 1, 1,
0.1390014, -0.1336398, 1.970891, 0, 0.6745098, 1, 1,
0.1400849, 0.6137547, 1.037763, 0, 0.6705883, 1, 1,
0.1422942, -0.6768904, 2.293167, 0, 0.6627451, 1, 1,
0.1434595, 1.528414, 0.9361248, 0, 0.6588235, 1, 1,
0.1441646, -2.298673, 5.801048, 0, 0.6509804, 1, 1,
0.1446083, 1.020268, -0.293383, 0, 0.6470588, 1, 1,
0.1477679, -0.1150093, 1.419334, 0, 0.6392157, 1, 1,
0.1503297, 1.543379, -1.965589, 0, 0.6352941, 1, 1,
0.1519639, -0.7247438, 2.994703, 0, 0.627451, 1, 1,
0.1542259, 0.1309166, 1.021872, 0, 0.6235294, 1, 1,
0.1582669, 0.3051068, 0.2427248, 0, 0.6156863, 1, 1,
0.1586363, 0.02158113, 3.501945, 0, 0.6117647, 1, 1,
0.1645481, -1.479641, 3.838501, 0, 0.6039216, 1, 1,
0.1683905, -0.7483556, 4.426894, 0, 0.5960785, 1, 1,
0.1746457, 0.1144882, -0.1621876, 0, 0.5921569, 1, 1,
0.178291, -0.9872281, 4.231298, 0, 0.5843138, 1, 1,
0.1793352, 0.08284996, 0.9355699, 0, 0.5803922, 1, 1,
0.1810815, 2.443497, 1.623371, 0, 0.572549, 1, 1,
0.1917265, 1.98876, 1.44429, 0, 0.5686275, 1, 1,
0.1934815, 0.5588567, 1.795133, 0, 0.5607843, 1, 1,
0.1948416, -0.2387832, 4.030951, 0, 0.5568628, 1, 1,
0.1971064, -0.133516, 2.109905, 0, 0.5490196, 1, 1,
0.200469, -0.4986211, 2.825613, 0, 0.5450981, 1, 1,
0.2008894, 2.338767, 1.994731, 0, 0.5372549, 1, 1,
0.2034638, -3.163069, 3.745099, 0, 0.5333334, 1, 1,
0.2055093, -1.361645, 4.319426, 0, 0.5254902, 1, 1,
0.2086031, -0.2455941, 2.786218, 0, 0.5215687, 1, 1,
0.2126449, 1.099541, 0.1551982, 0, 0.5137255, 1, 1,
0.2138893, -1.85142, 3.336306, 0, 0.509804, 1, 1,
0.2158399, 0.1615379, 1.013332, 0, 0.5019608, 1, 1,
0.2160503, -1.483956, 2.65848, 0, 0.4941176, 1, 1,
0.2184235, 0.8034869, -0.514767, 0, 0.4901961, 1, 1,
0.2220635, -0.5211873, 4.108758, 0, 0.4823529, 1, 1,
0.2224271, 0.129397, -0.3895078, 0, 0.4784314, 1, 1,
0.2238315, 0.2752337, 1.222055, 0, 0.4705882, 1, 1,
0.2245277, -1.305525, 2.914697, 0, 0.4666667, 1, 1,
0.2294103, -1.870792, 3.511456, 0, 0.4588235, 1, 1,
0.23741, 0.4341591, 0.8880328, 0, 0.454902, 1, 1,
0.2402891, 0.01456528, 1.584114, 0, 0.4470588, 1, 1,
0.2536444, 0.1212885, 2.220169, 0, 0.4431373, 1, 1,
0.255761, -0.4252943, 3.156259, 0, 0.4352941, 1, 1,
0.25843, -2.351166, 2.025117, 0, 0.4313726, 1, 1,
0.2614179, 0.278477, -0.060357, 0, 0.4235294, 1, 1,
0.2625325, -0.6038898, 1.814421, 0, 0.4196078, 1, 1,
0.2655001, 0.5413733, -0.3205479, 0, 0.4117647, 1, 1,
0.2661391, 0.03907239, 2.230403, 0, 0.4078431, 1, 1,
0.2661821, 0.503063, 0.6146395, 0, 0.4, 1, 1,
0.2696297, -2.31335, 3.188149, 0, 0.3921569, 1, 1,
0.2704583, -0.1881178, 2.629103, 0, 0.3882353, 1, 1,
0.2707836, -1.270608, 2.688547, 0, 0.3803922, 1, 1,
0.2745448, 1.472783, 1.214088, 0, 0.3764706, 1, 1,
0.277632, -0.2750837, 2.688107, 0, 0.3686275, 1, 1,
0.2806883, 0.5871426, -0.1357408, 0, 0.3647059, 1, 1,
0.2827007, -0.09553996, 2.068794, 0, 0.3568628, 1, 1,
0.2844655, 0.9766718, -1.622779, 0, 0.3529412, 1, 1,
0.2902283, 0.286712, 2.445861, 0, 0.345098, 1, 1,
0.2910368, 0.03276771, 1.556725, 0, 0.3411765, 1, 1,
0.2950481, 1.005772, -0.3742913, 0, 0.3333333, 1, 1,
0.2974705, 0.3835438, 0.3469102, 0, 0.3294118, 1, 1,
0.2976056, 0.8269543, -0.9242567, 0, 0.3215686, 1, 1,
0.3024996, 0.2125793, 0.1291641, 0, 0.3176471, 1, 1,
0.3031418, 0.4467654, 2.401211, 0, 0.3098039, 1, 1,
0.3064073, 1.014007, -0.0490729, 0, 0.3058824, 1, 1,
0.3066691, 0.8689157, 1.935297, 0, 0.2980392, 1, 1,
0.3077052, -1.481874, 2.048154, 0, 0.2901961, 1, 1,
0.3084142, 0.1506842, 1.201998, 0, 0.2862745, 1, 1,
0.3115681, -0.4141807, 3.885294, 0, 0.2784314, 1, 1,
0.3117793, -0.8980663, 3.246535, 0, 0.2745098, 1, 1,
0.3135254, -1.696246, 2.976258, 0, 0.2666667, 1, 1,
0.320646, 0.627177, 1.490803, 0, 0.2627451, 1, 1,
0.3241285, 0.09779863, -0.1657594, 0, 0.254902, 1, 1,
0.3327042, 0.4966216, 1.536889, 0, 0.2509804, 1, 1,
0.3344859, 0.01623718, 0.1253242, 0, 0.2431373, 1, 1,
0.33505, 1.86479, 0.6892358, 0, 0.2392157, 1, 1,
0.3378419, -0.9668761, 3.562846, 0, 0.2313726, 1, 1,
0.3394393, 0.04047907, 0.5215481, 0, 0.227451, 1, 1,
0.3406371, 1.445552, 0.3391733, 0, 0.2196078, 1, 1,
0.3408572, 0.03831943, 2.844537, 0, 0.2156863, 1, 1,
0.3418314, 1.866736, -0.7550803, 0, 0.2078431, 1, 1,
0.3443073, 3.084186, -1.110992, 0, 0.2039216, 1, 1,
0.3443835, 0.2268181, 0.83361, 0, 0.1960784, 1, 1,
0.3460504, -0.5340468, 1.834778, 0, 0.1882353, 1, 1,
0.3463956, 0.5746314, 1.529164, 0, 0.1843137, 1, 1,
0.3469114, -0.06756839, 1.717748, 0, 0.1764706, 1, 1,
0.3484431, 0.832085, 0.7695594, 0, 0.172549, 1, 1,
0.3494873, 1.258284, -0.9812648, 0, 0.1647059, 1, 1,
0.3508516, 1.235958, -1.677773, 0, 0.1607843, 1, 1,
0.351587, -1.184429, 3.476198, 0, 0.1529412, 1, 1,
0.3548976, 0.02094175, 1.451301, 0, 0.1490196, 1, 1,
0.3556522, 0.2437833, 1.075953, 0, 0.1411765, 1, 1,
0.3582478, 0.2612911, 0.9456759, 0, 0.1372549, 1, 1,
0.3606546, 1.188396, -0.6927502, 0, 0.1294118, 1, 1,
0.3610706, -0.6295912, 3.990315, 0, 0.1254902, 1, 1,
0.3620172, -0.139663, 1.9279, 0, 0.1176471, 1, 1,
0.3672381, -0.4227065, 2.039505, 0, 0.1137255, 1, 1,
0.3688014, -0.4175284, 3.756155, 0, 0.1058824, 1, 1,
0.369482, 1.178161, -1.122456, 0, 0.09803922, 1, 1,
0.3711177, 0.9251248, 0.4774758, 0, 0.09411765, 1, 1,
0.3724435, 0.3581602, 1.233886, 0, 0.08627451, 1, 1,
0.3760296, 0.991702, 0.7151706, 0, 0.08235294, 1, 1,
0.3833124, 1.708456, -0.6315117, 0, 0.07450981, 1, 1,
0.3848574, 1.673791, 0.2003249, 0, 0.07058824, 1, 1,
0.3857107, 0.04176057, 3.54514, 0, 0.0627451, 1, 1,
0.3915448, 0.3559201, 0.3656014, 0, 0.05882353, 1, 1,
0.4006549, -0.6891788, 0.192438, 0, 0.05098039, 1, 1,
0.4009956, -2.334836, 3.108579, 0, 0.04705882, 1, 1,
0.4044752, 1.726961, -0.02660273, 0, 0.03921569, 1, 1,
0.4059321, -0.4655109, 3.956348, 0, 0.03529412, 1, 1,
0.4067062, 1.144623, -0.9561216, 0, 0.02745098, 1, 1,
0.4131809, 1.0248, 1.404875, 0, 0.02352941, 1, 1,
0.4149038, -0.3570152, 1.681667, 0, 0.01568628, 1, 1,
0.4168138, -0.5046992, 0.3804195, 0, 0.01176471, 1, 1,
0.420207, -0.05368962, 0.8758173, 0, 0.003921569, 1, 1,
0.4216248, -0.6891667, 2.793739, 0.003921569, 0, 1, 1,
0.4226562, -0.6818754, 1.54839, 0.007843138, 0, 1, 1,
0.422706, 0.324798, -0.3235422, 0.01568628, 0, 1, 1,
0.4264189, 2.107247, 0.4091363, 0.01960784, 0, 1, 1,
0.4310461, -1.340111, 4.02181, 0.02745098, 0, 1, 1,
0.4362727, -0.8392853, 2.280485, 0.03137255, 0, 1, 1,
0.4375789, -0.4643804, 1.923806, 0.03921569, 0, 1, 1,
0.4382214, -1.496563, 2.459104, 0.04313726, 0, 1, 1,
0.4389803, -1.343309, 4.626289, 0.05098039, 0, 1, 1,
0.4439388, 0.6621723, -1.268549, 0.05490196, 0, 1, 1,
0.4444489, 1.535937, -0.6665299, 0.0627451, 0, 1, 1,
0.4446121, 0.9553739, 1.504679, 0.06666667, 0, 1, 1,
0.4453808, -1.545955, 3.406753, 0.07450981, 0, 1, 1,
0.4458894, 0.2496578, 1.191224, 0.07843138, 0, 1, 1,
0.4506836, -2.148229, 2.522044, 0.08627451, 0, 1, 1,
0.4528902, 0.4752064, -0.2434481, 0.09019608, 0, 1, 1,
0.4573732, 0.3289739, -0.4070247, 0.09803922, 0, 1, 1,
0.460243, -0.3107258, 1.933028, 0.1058824, 0, 1, 1,
0.4603056, 0.5462249, 0.5694435, 0.1098039, 0, 1, 1,
0.4629309, 0.09798916, 0.7650598, 0.1176471, 0, 1, 1,
0.4629723, -0.8258669, 1.840816, 0.1215686, 0, 1, 1,
0.4634234, -1.102417, 2.817883, 0.1294118, 0, 1, 1,
0.4638806, 0.6105239, 0.04833091, 0.1333333, 0, 1, 1,
0.4668643, 0.4448404, -0.6512781, 0.1411765, 0, 1, 1,
0.4684372, -0.839312, 2.099056, 0.145098, 0, 1, 1,
0.4698491, -0.7123867, 3.334035, 0.1529412, 0, 1, 1,
0.4773421, 0.07178109, 0.6818029, 0.1568628, 0, 1, 1,
0.4796372, -0.7183779, 2.352617, 0.1647059, 0, 1, 1,
0.4890389, 0.877072, 0.08927839, 0.1686275, 0, 1, 1,
0.4921597, -0.3823415, 3.812523, 0.1764706, 0, 1, 1,
0.4937881, -0.02966036, 1.260956, 0.1803922, 0, 1, 1,
0.4940506, -0.1012334, -0.1992757, 0.1882353, 0, 1, 1,
0.4974799, 1.599267, 0.2765799, 0.1921569, 0, 1, 1,
0.4980769, 0.7596965, 1.004729, 0.2, 0, 1, 1,
0.49947, -0.3295247, 1.786225, 0.2078431, 0, 1, 1,
0.5079486, -0.1141115, 1.168151, 0.2117647, 0, 1, 1,
0.5089283, -0.169436, 1.470458, 0.2196078, 0, 1, 1,
0.5098364, 0.05667336, 2.303691, 0.2235294, 0, 1, 1,
0.5098552, 0.8295008, 0.877785, 0.2313726, 0, 1, 1,
0.5137568, -0.2435048, 1.590543, 0.2352941, 0, 1, 1,
0.5138533, -1.895984, 4.361956, 0.2431373, 0, 1, 1,
0.5160207, -0.8563758, 1.492467, 0.2470588, 0, 1, 1,
0.5190238, 1.421158, 0.5480155, 0.254902, 0, 1, 1,
0.5219851, -0.8908239, 4.178682, 0.2588235, 0, 1, 1,
0.5220924, 0.1545526, 3.256097, 0.2666667, 0, 1, 1,
0.5256961, 0.1315506, 2.304192, 0.2705882, 0, 1, 1,
0.5290961, 0.39189, 1.36585, 0.2784314, 0, 1, 1,
0.5341782, 0.6789512, 0.7286009, 0.282353, 0, 1, 1,
0.5402209, -0.1837633, 1.414758, 0.2901961, 0, 1, 1,
0.5501263, -0.2919869, 1.754017, 0.2941177, 0, 1, 1,
0.5531965, 1.060722, 0.3785731, 0.3019608, 0, 1, 1,
0.5565174, -0.7663096, 1.493669, 0.3098039, 0, 1, 1,
0.5668241, 1.387691, 0.3463265, 0.3137255, 0, 1, 1,
0.5674233, 1.345151, 1.248648, 0.3215686, 0, 1, 1,
0.5729088, -0.6881938, 2.457943, 0.3254902, 0, 1, 1,
0.5759462, -0.4303241, 1.613197, 0.3333333, 0, 1, 1,
0.5795968, 0.6686935, -0.1157281, 0.3372549, 0, 1, 1,
0.5819173, -0.9607416, 2.23018, 0.345098, 0, 1, 1,
0.5853187, -1.278982, 1.940558, 0.3490196, 0, 1, 1,
0.5857747, -0.5607846, 2.06707, 0.3568628, 0, 1, 1,
0.5875026, -0.1372882, 0.5413719, 0.3607843, 0, 1, 1,
0.5888271, 1.64941, -0.7102656, 0.3686275, 0, 1, 1,
0.5890039, 0.3981209, 0.8747453, 0.372549, 0, 1, 1,
0.5907365, -0.238822, 2.080301, 0.3803922, 0, 1, 1,
0.5909929, -1.448828, 2.845783, 0.3843137, 0, 1, 1,
0.5920622, -1.04359, 4.793399, 0.3921569, 0, 1, 1,
0.6008038, 0.3884031, 1.167243, 0.3960784, 0, 1, 1,
0.6060315, -0.9639699, 1.520708, 0.4039216, 0, 1, 1,
0.6071448, -0.8622518, 1.712749, 0.4117647, 0, 1, 1,
0.6099638, -1.013182, 3.868829, 0.4156863, 0, 1, 1,
0.6108272, -0.8507015, 1.873671, 0.4235294, 0, 1, 1,
0.620138, 0.04698681, -0.115639, 0.427451, 0, 1, 1,
0.6211565, -0.5495418, 3.572477, 0.4352941, 0, 1, 1,
0.6265434, -1.244211, 2.339146, 0.4392157, 0, 1, 1,
0.6291423, 0.05716501, 2.312223, 0.4470588, 0, 1, 1,
0.6304276, -0.8202044, 2.173608, 0.4509804, 0, 1, 1,
0.6310068, 1.743877, 1.697701, 0.4588235, 0, 1, 1,
0.6326139, 0.1045863, 3.048993, 0.4627451, 0, 1, 1,
0.6348138, 1.511172, 0.0783879, 0.4705882, 0, 1, 1,
0.6371414, 0.76708, 0.006908165, 0.4745098, 0, 1, 1,
0.64161, 0.1368669, 1.305609, 0.4823529, 0, 1, 1,
0.6427457, -0.6158181, 1.641586, 0.4862745, 0, 1, 1,
0.6433521, -0.9366729, 1.811282, 0.4941176, 0, 1, 1,
0.6435794, -0.1192356, 2.3808, 0.5019608, 0, 1, 1,
0.6469046, 0.3442892, 1.395584, 0.5058824, 0, 1, 1,
0.6497663, -1.034807, 1.909201, 0.5137255, 0, 1, 1,
0.651082, 0.5255045, -0.1184701, 0.5176471, 0, 1, 1,
0.6513266, -1.441224, 1.465327, 0.5254902, 0, 1, 1,
0.6570112, -0.540329, 1.055103, 0.5294118, 0, 1, 1,
0.6613346, 1.180253, 2.152164, 0.5372549, 0, 1, 1,
0.6665983, -1.00263, 2.658778, 0.5411765, 0, 1, 1,
0.667579, 0.4574663, 0.8476036, 0.5490196, 0, 1, 1,
0.6724756, 1.56757, 0.7715944, 0.5529412, 0, 1, 1,
0.6818467, -0.1648165, 2.489578, 0.5607843, 0, 1, 1,
0.6846027, 0.9778976, -0.4599518, 0.5647059, 0, 1, 1,
0.6857169, -1.347378, 3.850903, 0.572549, 0, 1, 1,
0.6884061, 2.137232, 0.03084383, 0.5764706, 0, 1, 1,
0.6957473, -1.264436, 1.717996, 0.5843138, 0, 1, 1,
0.6965911, 0.3207019, 0.8539437, 0.5882353, 0, 1, 1,
0.6980258, -0.5882851, 2.944514, 0.5960785, 0, 1, 1,
0.7034125, -0.2319552, 1.254722, 0.6039216, 0, 1, 1,
0.7070736, -0.4435794, 3.344305, 0.6078432, 0, 1, 1,
0.7105467, -1.064031, 3.638586, 0.6156863, 0, 1, 1,
0.7127086, -0.1237241, 3.987937, 0.6196079, 0, 1, 1,
0.7134081, -0.6165676, 3.338234, 0.627451, 0, 1, 1,
0.7208362, 0.6484308, 0.7202513, 0.6313726, 0, 1, 1,
0.72186, -1.144474, 1.089949, 0.6392157, 0, 1, 1,
0.7220211, 0.2453032, 3.02252, 0.6431373, 0, 1, 1,
0.7226053, -0.7984961, 2.960523, 0.6509804, 0, 1, 1,
0.7265438, -0.3035287, 2.252447, 0.654902, 0, 1, 1,
0.7304552, -0.2074177, 2.243849, 0.6627451, 0, 1, 1,
0.7333075, -0.8125007, 1.751344, 0.6666667, 0, 1, 1,
0.7407401, 0.671785, 0.996276, 0.6745098, 0, 1, 1,
0.7472691, 1.465405, 1.115805, 0.6784314, 0, 1, 1,
0.7540701, -0.765004, 2.649015, 0.6862745, 0, 1, 1,
0.7569246, -1.275984, 2.329393, 0.6901961, 0, 1, 1,
0.7600384, 0.5382251, 1.617772, 0.6980392, 0, 1, 1,
0.7637462, -1.668577, 3.418038, 0.7058824, 0, 1, 1,
0.7660291, -0.9114675, 0.8385384, 0.7098039, 0, 1, 1,
0.7679575, 1.296169, 0.06301742, 0.7176471, 0, 1, 1,
0.7691836, 0.6918948, 0.261485, 0.7215686, 0, 1, 1,
0.7713764, -0.04718062, 3.870952, 0.7294118, 0, 1, 1,
0.7803959, 0.2484889, 1.639177, 0.7333333, 0, 1, 1,
0.791761, -0.449464, 3.719149, 0.7411765, 0, 1, 1,
0.7929125, 0.6089129, 2.328028, 0.7450981, 0, 1, 1,
0.7970498, -0.2970597, 2.342884, 0.7529412, 0, 1, 1,
0.8084295, 1.960459, 0.7395737, 0.7568628, 0, 1, 1,
0.8123673, -0.5489557, 0.7754793, 0.7647059, 0, 1, 1,
0.8135667, 0.6384022, 1.245981, 0.7686275, 0, 1, 1,
0.8148229, 0.7639843, 1.275591, 0.7764706, 0, 1, 1,
0.8222789, -0.6292558, 2.701455, 0.7803922, 0, 1, 1,
0.8250729, -0.01161246, 1.988823, 0.7882353, 0, 1, 1,
0.8269425, -2.233627, 3.827551, 0.7921569, 0, 1, 1,
0.8315597, -1.758809, 3.572585, 0.8, 0, 1, 1,
0.8441426, -0.5473216, 2.092336, 0.8078431, 0, 1, 1,
0.8446599, 2.484278, -1.277955, 0.8117647, 0, 1, 1,
0.8479525, 0.8720245, 0.6152318, 0.8196079, 0, 1, 1,
0.8485286, -0.7713394, 3.620008, 0.8235294, 0, 1, 1,
0.856895, -0.07378978, 1.778637, 0.8313726, 0, 1, 1,
0.8576329, -0.4897522, 3.274213, 0.8352941, 0, 1, 1,
0.8579068, 0.3241213, 0.383526, 0.8431373, 0, 1, 1,
0.8617893, 0.8881441, 2.955028, 0.8470588, 0, 1, 1,
0.8672462, 1.281191, -0.1306021, 0.854902, 0, 1, 1,
0.8807862, 0.7186694, -1.355116, 0.8588235, 0, 1, 1,
0.8843651, 1.958865, 1.111836, 0.8666667, 0, 1, 1,
0.8972517, -1.873614, 2.194315, 0.8705882, 0, 1, 1,
0.9196659, 0.6434878, 0.6252035, 0.8784314, 0, 1, 1,
0.92147, -1.412584, 0.8807166, 0.8823529, 0, 1, 1,
0.9228547, -1.791929, 3.72803, 0.8901961, 0, 1, 1,
0.9228631, -0.301918, 2.043726, 0.8941177, 0, 1, 1,
0.926557, -0.2787558, 3.316221, 0.9019608, 0, 1, 1,
0.9345015, -0.4034231, 1.839818, 0.9098039, 0, 1, 1,
0.9437091, 1.53037, 0.2596679, 0.9137255, 0, 1, 1,
0.9438984, 0.5852696, -0.09906696, 0.9215686, 0, 1, 1,
0.9468335, -1.052689, 4.239839, 0.9254902, 0, 1, 1,
0.9505401, -0.9622318, 1.828764, 0.9333333, 0, 1, 1,
0.9530659, -0.1750129, 1.307392, 0.9372549, 0, 1, 1,
0.9598714, -2.608893, 2.950743, 0.945098, 0, 1, 1,
0.9602577, 1.247981, 0.2551863, 0.9490196, 0, 1, 1,
0.9616362, 0.3491066, 1.790886, 0.9568627, 0, 1, 1,
0.9657076, -0.46006, 0.7766387, 0.9607843, 0, 1, 1,
0.9658946, 0.5625101, 0.1838496, 0.9686275, 0, 1, 1,
0.9693164, 0.3187327, 2.059127, 0.972549, 0, 1, 1,
0.9721861, -0.7798817, 1.436998, 0.9803922, 0, 1, 1,
0.9744495, -1.421528, 1.904534, 0.9843137, 0, 1, 1,
0.9775519, -0.8656296, 1.413157, 0.9921569, 0, 1, 1,
0.9870899, 0.8251173, 1.201019, 0.9960784, 0, 1, 1,
0.9971473, 0.2482506, -0.04606611, 1, 0, 0.9960784, 1,
0.9980388, 0.02900905, 2.598655, 1, 0, 0.9882353, 1,
1.002398, 1.206726, 1.597587, 1, 0, 0.9843137, 1,
1.011851, 0.4495958, -1.757255, 1, 0, 0.9764706, 1,
1.012323, 1.212259, 0.6132721, 1, 0, 0.972549, 1,
1.015746, -2.306695, 2.637377, 1, 0, 0.9647059, 1,
1.02389, 0.9067118, -0.7716129, 1, 0, 0.9607843, 1,
1.024157, 1.167821, 2.230169, 1, 0, 0.9529412, 1,
1.025348, 2.046897, 0.4618907, 1, 0, 0.9490196, 1,
1.059024, 0.2059213, 0.4950108, 1, 0, 0.9411765, 1,
1.063619, -0.2389454, 0.2047639, 1, 0, 0.9372549, 1,
1.070134, 1.582495, 0.6946938, 1, 0, 0.9294118, 1,
1.071798, 1.357069, 0.8363364, 1, 0, 0.9254902, 1,
1.079857, 0.7682447, -1.115578, 1, 0, 0.9176471, 1,
1.082245, 1.371593, -0.1033868, 1, 0, 0.9137255, 1,
1.082432, -0.2862565, 1.647624, 1, 0, 0.9058824, 1,
1.09076, 0.4123055, 0.6760055, 1, 0, 0.9019608, 1,
1.091733, -1.224735, 1.62811, 1, 0, 0.8941177, 1,
1.095416, -0.1091343, 0.945316, 1, 0, 0.8862745, 1,
1.096107, -0.01308396, 1.124522, 1, 0, 0.8823529, 1,
1.099469, -0.3258298, -0.3878869, 1, 0, 0.8745098, 1,
1.107601, -0.7222623, 2.055066, 1, 0, 0.8705882, 1,
1.117587, -2.079028, 4.759707, 1, 0, 0.8627451, 1,
1.118567, -1.09287, 3.568845, 1, 0, 0.8588235, 1,
1.125839, -1.358598, 3.364451, 1, 0, 0.8509804, 1,
1.126151, 0.09544735, 2.098209, 1, 0, 0.8470588, 1,
1.126328, 0.2868637, -0.2594688, 1, 0, 0.8392157, 1,
1.141091, -1.082672, 2.832607, 1, 0, 0.8352941, 1,
1.150588, -0.8915638, 2.342554, 1, 0, 0.827451, 1,
1.15229, 0.7075077, 0.5168827, 1, 0, 0.8235294, 1,
1.15759, -0.5248092, 2.125908, 1, 0, 0.8156863, 1,
1.159361, 1.329664, -0.8891986, 1, 0, 0.8117647, 1,
1.159689, 0.204762, 0.5912428, 1, 0, 0.8039216, 1,
1.159935, 1.050609, 1.080302, 1, 0, 0.7960784, 1,
1.164395, 0.7025638, 0.633269, 1, 0, 0.7921569, 1,
1.166062, 0.1650786, -0.477858, 1, 0, 0.7843137, 1,
1.168406, 0.01457097, 0.269472, 1, 0, 0.7803922, 1,
1.178613, -1.178505, 1.305382, 1, 0, 0.772549, 1,
1.184858, 0.1746241, 0.5529774, 1, 0, 0.7686275, 1,
1.191938, -1.17843, 1.255322, 1, 0, 0.7607843, 1,
1.192247, 0.6638944, -0.1680259, 1, 0, 0.7568628, 1,
1.192368, -0.01578212, -0.307259, 1, 0, 0.7490196, 1,
1.199682, 0.7769261, -0.02677544, 1, 0, 0.7450981, 1,
1.202431, -1.072531, 4.583001, 1, 0, 0.7372549, 1,
1.20445, -1.736612, 3.146425, 1, 0, 0.7333333, 1,
1.220582, -1.746394, 3.587405, 1, 0, 0.7254902, 1,
1.221253, 0.3451625, 0.9733133, 1, 0, 0.7215686, 1,
1.22208, 0.4944076, 0.8915877, 1, 0, 0.7137255, 1,
1.223882, -0.1009008, 1.137096, 1, 0, 0.7098039, 1,
1.227049, 1.12559, 1.394655, 1, 0, 0.7019608, 1,
1.228538, -1.841317, 3.331775, 1, 0, 0.6941177, 1,
1.24251, -0.4663312, 0.6311423, 1, 0, 0.6901961, 1,
1.248024, 0.4832351, 0.3236133, 1, 0, 0.682353, 1,
1.250823, -0.01661838, 2.020438, 1, 0, 0.6784314, 1,
1.254852, 0.08119853, 1.416267, 1, 0, 0.6705883, 1,
1.256904, 0.3423522, 1.386568, 1, 0, 0.6666667, 1,
1.257833, 1.298813, 1.312414, 1, 0, 0.6588235, 1,
1.267872, 0.4651306, -0.7388098, 1, 0, 0.654902, 1,
1.276268, -0.6659974, 1.628319, 1, 0, 0.6470588, 1,
1.290322, 1.444865, 0.2682908, 1, 0, 0.6431373, 1,
1.299436, -0.8433935, 4.043335, 1, 0, 0.6352941, 1,
1.303455, -0.3178628, 2.656857, 1, 0, 0.6313726, 1,
1.308917, -1.119583, 3.638842, 1, 0, 0.6235294, 1,
1.309823, 0.3627727, 2.700435, 1, 0, 0.6196079, 1,
1.312659, -0.6267244, 3.627587, 1, 0, 0.6117647, 1,
1.319131, 1.496209, -0.3409647, 1, 0, 0.6078432, 1,
1.32343, -0.48398, 2.648033, 1, 0, 0.6, 1,
1.323922, 0.02346433, 1.860182, 1, 0, 0.5921569, 1,
1.324916, -0.9705615, 0.7783766, 1, 0, 0.5882353, 1,
1.343565, -1.613468, 2.681324, 1, 0, 0.5803922, 1,
1.34481, 0.4983853, 1.369328, 1, 0, 0.5764706, 1,
1.358107, 0.01817391, 0.1553281, 1, 0, 0.5686275, 1,
1.404325, -1.074914, 1.527371, 1, 0, 0.5647059, 1,
1.420887, -0.4356791, 3.482888, 1, 0, 0.5568628, 1,
1.431757, -1.178394, 0.8925283, 1, 0, 0.5529412, 1,
1.446447, 0.32831, 0.1237474, 1, 0, 0.5450981, 1,
1.44811, -0.1256139, 1.951053, 1, 0, 0.5411765, 1,
1.452011, -0.02415495, 1.69063, 1, 0, 0.5333334, 1,
1.457736, -0.6732605, 1.993893, 1, 0, 0.5294118, 1,
1.458816, 0.01060263, -0.4581811, 1, 0, 0.5215687, 1,
1.461767, -0.4777325, 1.036248, 1, 0, 0.5176471, 1,
1.468963, -1.790235, 2.944408, 1, 0, 0.509804, 1,
1.479317, 0.3892303, -0.4104382, 1, 0, 0.5058824, 1,
1.48388, -0.953764, 3.343518, 1, 0, 0.4980392, 1,
1.490124, 0.08010331, 2.737935, 1, 0, 0.4901961, 1,
1.494512, 0.8220772, -0.4437202, 1, 0, 0.4862745, 1,
1.496351, -0.9993521, 1.21998, 1, 0, 0.4784314, 1,
1.503267, 0.5573702, 0.1417683, 1, 0, 0.4745098, 1,
1.503268, -0.8615125, 1.183877, 1, 0, 0.4666667, 1,
1.504864, -1.158608, 2.841129, 1, 0, 0.4627451, 1,
1.509656, -0.2286631, 2.760802, 1, 0, 0.454902, 1,
1.51499, -1.344286, 1.903194, 1, 0, 0.4509804, 1,
1.52428, -0.9059212, 3.683347, 1, 0, 0.4431373, 1,
1.526258, 0.09795725, 1.087251, 1, 0, 0.4392157, 1,
1.528539, -0.9243884, 1.654643, 1, 0, 0.4313726, 1,
1.532104, 0.6419644, 1.44433, 1, 0, 0.427451, 1,
1.542803, -0.7525889, 2.140995, 1, 0, 0.4196078, 1,
1.559742, 0.3064392, 1.826741, 1, 0, 0.4156863, 1,
1.560827, -0.3134232, 2.226066, 1, 0, 0.4078431, 1,
1.563199, -0.5450997, 0.7572225, 1, 0, 0.4039216, 1,
1.564196, 0.4087393, 2.096947, 1, 0, 0.3960784, 1,
1.56433, -1.567873, 2.87843, 1, 0, 0.3882353, 1,
1.575937, 0.201325, 0.9019409, 1, 0, 0.3843137, 1,
1.583718, -0.7951612, 2.066269, 1, 0, 0.3764706, 1,
1.59624, -0.5171522, 3.201167, 1, 0, 0.372549, 1,
1.645589, -0.4484022, 1.027564, 1, 0, 0.3647059, 1,
1.656758, -0.1528626, 1.334447, 1, 0, 0.3607843, 1,
1.657658, -0.6697274, 1.010024, 1, 0, 0.3529412, 1,
1.664897, 0.9667677, 0.9308415, 1, 0, 0.3490196, 1,
1.666645, -0.8200268, 1.885796, 1, 0, 0.3411765, 1,
1.672159, 0.2009336, 1.31737, 1, 0, 0.3372549, 1,
1.684317, 0.6496072, 0.1751705, 1, 0, 0.3294118, 1,
1.694327, 0.8577752, 1.2314, 1, 0, 0.3254902, 1,
1.696643, 0.5391433, 1.48921, 1, 0, 0.3176471, 1,
1.697296, 0.5452944, 2.475506, 1, 0, 0.3137255, 1,
1.701685, 0.9033497, -0.1091441, 1, 0, 0.3058824, 1,
1.717602, 0.08109695, 1.313083, 1, 0, 0.2980392, 1,
1.722374, 1.826337, 0.9994107, 1, 0, 0.2941177, 1,
1.729267, 0.5678937, 2.959172, 1, 0, 0.2862745, 1,
1.731891, 0.5362043, 0.904227, 1, 0, 0.282353, 1,
1.735848, 0.6920241, 1.490554, 1, 0, 0.2745098, 1,
1.740383, -0.544656, 2.668532, 1, 0, 0.2705882, 1,
1.741189, -0.6831921, 1.482358, 1, 0, 0.2627451, 1,
1.748164, -0.5588592, 1.335643, 1, 0, 0.2588235, 1,
1.821708, 1.239112, 1.706449, 1, 0, 0.2509804, 1,
1.824899, -1.333353, 1.954189, 1, 0, 0.2470588, 1,
1.833087, 1.250409, 1.207828, 1, 0, 0.2392157, 1,
1.83409, -1.033667, 1.5842, 1, 0, 0.2352941, 1,
1.83619, 0.401777, 1.996364, 1, 0, 0.227451, 1,
1.847817, 0.719665, 0.8022773, 1, 0, 0.2235294, 1,
1.851846, -1.15652, 1.835641, 1, 0, 0.2156863, 1,
1.85443, -2.422219, 3.148902, 1, 0, 0.2117647, 1,
1.861498, 0.1093168, 2.248696, 1, 0, 0.2039216, 1,
1.861721, -0.1250045, 2.569958, 1, 0, 0.1960784, 1,
1.865569, 0.05748418, 0.04452517, 1, 0, 0.1921569, 1,
1.872507, 2.516909, -0.1245636, 1, 0, 0.1843137, 1,
1.900554, 1.030288, 1.060906, 1, 0, 0.1803922, 1,
1.903684, 0.1667456, 0.8798849, 1, 0, 0.172549, 1,
1.905908, -0.1320908, 2.497386, 1, 0, 0.1686275, 1,
1.909659, -1.093627, 1.629941, 1, 0, 0.1607843, 1,
1.931886, -1.25567, 2.01895, 1, 0, 0.1568628, 1,
1.961794, -0.9035259, 0.7896022, 1, 0, 0.1490196, 1,
1.986457, 1.588258, 0.4096501, 1, 0, 0.145098, 1,
1.998491, -0.185759, 0.2058454, 1, 0, 0.1372549, 1,
2.005563, -0.1475081, 2.226603, 1, 0, 0.1333333, 1,
2.006591, -0.2507367, 1.834016, 1, 0, 0.1254902, 1,
2.052387, 0.1565656, 0.3863226, 1, 0, 0.1215686, 1,
2.062113, 0.3330966, 2.914592, 1, 0, 0.1137255, 1,
2.068254, -0.4408326, 1.868508, 1, 0, 0.1098039, 1,
2.07465, 0.3060636, 2.318875, 1, 0, 0.1019608, 1,
2.105131, -1.445163, 3.115904, 1, 0, 0.09411765, 1,
2.142957, -0.8206744, 1.614927, 1, 0, 0.09019608, 1,
2.162682, 0.5013891, 2.502075, 1, 0, 0.08235294, 1,
2.183887, 0.6774121, 0.8607794, 1, 0, 0.07843138, 1,
2.227029, 0.5709894, 2.470716, 1, 0, 0.07058824, 1,
2.228436, -1.322418, 2.899226, 1, 0, 0.06666667, 1,
2.229672, 1.011309, 2.750397, 1, 0, 0.05882353, 1,
2.239632, -0.9164344, 0.6274223, 1, 0, 0.05490196, 1,
2.28368, 0.4814655, 2.669454, 1, 0, 0.04705882, 1,
2.352148, -0.3614931, 1.603287, 1, 0, 0.04313726, 1,
2.369691, 0.2077257, -0.1048205, 1, 0, 0.03529412, 1,
2.41195, -0.04427511, 1.957421, 1, 0, 0.03137255, 1,
2.467023, 0.6157147, -1.086389, 1, 0, 0.02352941, 1,
2.795515, -0.8689302, 0.9752714, 1, 0, 0.01960784, 1,
3.10492, -0.9144321, -0.0708271, 1, 0, 0.01176471, 1,
3.231289, 1.450272, 0.6349517, 1, 0, 0.007843138, 1
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
-0.03274333, -4.221979, -7.381654, 0, -0.5, 0.5, 0.5,
-0.03274333, -4.221979, -7.381654, 1, -0.5, 0.5, 0.5,
-0.03274333, -4.221979, -7.381654, 1, 1.5, 0.5, 0.5,
-0.03274333, -4.221979, -7.381654, 0, 1.5, 0.5, 0.5
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
-4.403282, -0.0394417, -7.381654, 0, -0.5, 0.5, 0.5,
-4.403282, -0.0394417, -7.381654, 1, -0.5, 0.5, 0.5,
-4.403282, -0.0394417, -7.381654, 1, 1.5, 0.5, 0.5,
-4.403282, -0.0394417, -7.381654, 0, 1.5, 0.5, 0.5
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
-4.403282, -4.221979, 0.1650059, 0, -0.5, 0.5, 0.5,
-4.403282, -4.221979, 0.1650059, 1, -0.5, 0.5, 0.5,
-4.403282, -4.221979, 0.1650059, 1, 1.5, 0.5, 0.5,
-4.403282, -4.221979, 0.1650059, 0, 1.5, 0.5, 0.5
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
-3, -3.256778, -5.640117,
3, -3.256778, -5.640117,
-3, -3.256778, -5.640117,
-3, -3.417645, -5.930373,
-2, -3.256778, -5.640117,
-2, -3.417645, -5.930373,
-1, -3.256778, -5.640117,
-1, -3.417645, -5.930373,
0, -3.256778, -5.640117,
0, -3.417645, -5.930373,
1, -3.256778, -5.640117,
1, -3.417645, -5.930373,
2, -3.256778, -5.640117,
2, -3.417645, -5.930373,
3, -3.256778, -5.640117,
3, -3.417645, -5.930373
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
-3, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
-3, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
-3, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
-3, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
-2, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
-2, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
-2, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
-2, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
-1, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
-1, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
-1, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
-1, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
0, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
0, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
0, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
0, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
1, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
1, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
1, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
1, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
2, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
2, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
2, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
2, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5,
3, -3.739378, -6.510886, 0, -0.5, 0.5, 0.5,
3, -3.739378, -6.510886, 1, -0.5, 0.5, 0.5,
3, -3.739378, -6.510886, 1, 1.5, 0.5, 0.5,
3, -3.739378, -6.510886, 0, 1.5, 0.5, 0.5
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
-3.394696, -3, -5.640117,
-3.394696, 3, -5.640117,
-3.394696, -3, -5.640117,
-3.562794, -3, -5.930373,
-3.394696, -2, -5.640117,
-3.562794, -2, -5.930373,
-3.394696, -1, -5.640117,
-3.562794, -1, -5.930373,
-3.394696, 0, -5.640117,
-3.562794, 0, -5.930373,
-3.394696, 1, -5.640117,
-3.562794, 1, -5.930373,
-3.394696, 2, -5.640117,
-3.562794, 2, -5.930373,
-3.394696, 3, -5.640117,
-3.562794, 3, -5.930373
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
-3.898989, -3, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, -3, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, -3, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, -3, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, -2, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, -2, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, -2, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, -2, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, -1, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, -1, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, -1, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, -1, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, 0, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, 0, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, 0, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, 0, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, 1, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, 1, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, 1, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, 1, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, 2, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, 2, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, 2, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, 2, -6.510886, 0, 1.5, 0.5, 0.5,
-3.898989, 3, -6.510886, 0, -0.5, 0.5, 0.5,
-3.898989, 3, -6.510886, 1, -0.5, 0.5, 0.5,
-3.898989, 3, -6.510886, 1, 1.5, 0.5, 0.5,
-3.898989, 3, -6.510886, 0, 1.5, 0.5, 0.5
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
-3.394696, -3.256778, -4,
-3.394696, -3.256778, 4,
-3.394696, -3.256778, -4,
-3.562794, -3.417645, -4,
-3.394696, -3.256778, -2,
-3.562794, -3.417645, -2,
-3.394696, -3.256778, 0,
-3.562794, -3.417645, 0,
-3.394696, -3.256778, 2,
-3.562794, -3.417645, 2,
-3.394696, -3.256778, 4,
-3.562794, -3.417645, 4
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
-3.898989, -3.739378, -4, 0, -0.5, 0.5, 0.5,
-3.898989, -3.739378, -4, 1, -0.5, 0.5, 0.5,
-3.898989, -3.739378, -4, 1, 1.5, 0.5, 0.5,
-3.898989, -3.739378, -4, 0, 1.5, 0.5, 0.5,
-3.898989, -3.739378, -2, 0, -0.5, 0.5, 0.5,
-3.898989, -3.739378, -2, 1, -0.5, 0.5, 0.5,
-3.898989, -3.739378, -2, 1, 1.5, 0.5, 0.5,
-3.898989, -3.739378, -2, 0, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 0, 0, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 0, 1, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 0, 1, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 0, 0, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 2, 0, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 2, 1, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 2, 1, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 2, 0, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 4, 0, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 4, 1, -0.5, 0.5, 0.5,
-3.898989, -3.739378, 4, 1, 1.5, 0.5, 0.5,
-3.898989, -3.739378, 4, 0, 1.5, 0.5, 0.5
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
-3.394696, -3.256778, -5.640117,
-3.394696, 3.177894, -5.640117,
-3.394696, -3.256778, 5.970129,
-3.394696, 3.177894, 5.970129,
-3.394696, -3.256778, -5.640117,
-3.394696, -3.256778, 5.970129,
-3.394696, 3.177894, -5.640117,
-3.394696, 3.177894, 5.970129,
-3.394696, -3.256778, -5.640117,
3.32921, -3.256778, -5.640117,
-3.394696, -3.256778, 5.970129,
3.32921, -3.256778, 5.970129,
-3.394696, 3.177894, -5.640117,
3.32921, 3.177894, -5.640117,
-3.394696, 3.177894, 5.970129,
3.32921, 3.177894, 5.970129,
3.32921, -3.256778, -5.640117,
3.32921, 3.177894, -5.640117,
3.32921, -3.256778, 5.970129,
3.32921, 3.177894, 5.970129,
3.32921, -3.256778, -5.640117,
3.32921, -3.256778, 5.970129,
3.32921, 3.177894, -5.640117,
3.32921, 3.177894, 5.970129
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
var radius = 7.945619;
var distance = 35.35096;
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
mvMatrix.translate( 0.03274333, 0.0394417, -0.1650059 );
mvMatrix.scale( 1.277674, 1.335104, 0.7399463 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.35096);
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
1-Naphthaleneacetami<-read.table("1-Naphthaleneacetami.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-Naphthaleneacetami$V2
```

```
## Error in eval(expr, envir, enclos): object 'Naphthaleneacetami' not found
```

```r
y<-1-Naphthaleneacetami$V3
```

```
## Error in eval(expr, envir, enclos): object 'Naphthaleneacetami' not found
```

```r
z<-1-Naphthaleneacetami$V4
```

```
## Error in eval(expr, envir, enclos): object 'Naphthaleneacetami' not found
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
-3.296775, 0.2466764, -0.101894, 0, 0, 1, 1, 1,
-2.948286, 0.4734896, -0.9393795, 1, 0, 0, 1, 1,
-2.901798, 0.1818255, -0.1073388, 1, 0, 0, 1, 1,
-2.842831, 0.02745087, -0.7399835, 1, 0, 0, 1, 1,
-2.641746, 0.09514222, 0.685067, 1, 0, 0, 1, 1,
-2.553365, 0.190297, -1.242488, 1, 0, 0, 1, 1,
-2.465996, -0.6808988, -2.405482, 0, 0, 0, 1, 1,
-2.434903, 0.3679304, -1.868688, 0, 0, 0, 1, 1,
-2.401042, -0.1524145, -3.780463, 0, 0, 0, 1, 1,
-2.352842, -2.083697, -2.69831, 0, 0, 0, 1, 1,
-2.337405, 0.3012332, -1.939088, 0, 0, 0, 1, 1,
-2.324672, 0.8761042, -0.2771181, 0, 0, 0, 1, 1,
-2.232321, -0.590502, -1.674597, 0, 0, 0, 1, 1,
-2.198397, -0.2910779, -0.7515846, 1, 1, 1, 1, 1,
-2.180867, -1.821559, -2.626509, 1, 1, 1, 1, 1,
-2.179084, 0.3669339, -2.653938, 1, 1, 1, 1, 1,
-2.130758, -0.1183439, -0.7205907, 1, 1, 1, 1, 1,
-2.130363, -0.7938056, -3.088733, 1, 1, 1, 1, 1,
-2.110272, -0.330792, -2.413057, 1, 1, 1, 1, 1,
-2.102514, 0.2226245, -3.633285, 1, 1, 1, 1, 1,
-2.083143, -0.4387915, -2.475062, 1, 1, 1, 1, 1,
-2.051965, -0.4054795, -2.182701, 1, 1, 1, 1, 1,
-2.0455, -0.7692906, -1.336912, 1, 1, 1, 1, 1,
-2.036802, 1.534149, -0.9800612, 1, 1, 1, 1, 1,
-2.030316, 0.1701374, -1.58541, 1, 1, 1, 1, 1,
-2.024268, -0.4264588, -1.625263, 1, 1, 1, 1, 1,
-2.016026, 0.5390767, -3.297607, 1, 1, 1, 1, 1,
-1.993705, 0.5104964, -1.545485, 1, 1, 1, 1, 1,
-1.946784, 0.4370877, -1.11292, 0, 0, 1, 1, 1,
-1.900738, -0.7691473, -2.442249, 1, 0, 0, 1, 1,
-1.892034, 0.8001539, -2.411691, 1, 0, 0, 1, 1,
-1.887112, 1.064565, -2.621264, 1, 0, 0, 1, 1,
-1.867441, -0.1280616, -2.436504, 1, 0, 0, 1, 1,
-1.863419, 1.751189, -1.101864, 1, 0, 0, 1, 1,
-1.861743, -0.7566075, -2.803236, 0, 0, 0, 1, 1,
-1.818815, 0.2366266, -1.786184, 0, 0, 0, 1, 1,
-1.808917, 0.178009, -0.7041676, 0, 0, 0, 1, 1,
-1.796131, 0.2749631, -2.49422, 0, 0, 0, 1, 1,
-1.794706, -0.337704, -0.4099296, 0, 0, 0, 1, 1,
-1.770615, -0.3658813, -1.996953, 0, 0, 0, 1, 1,
-1.767021, 0.1841611, -2.374541, 0, 0, 0, 1, 1,
-1.755925, 0.6566271, -1.032732, 1, 1, 1, 1, 1,
-1.754897, 0.03419938, -1.722752, 1, 1, 1, 1, 1,
-1.749003, -1.612293, -1.038421, 1, 1, 1, 1, 1,
-1.738843, 0.5018986, 0.6053341, 1, 1, 1, 1, 1,
-1.736347, -0.2989424, -1.497749, 1, 1, 1, 1, 1,
-1.734064, 0.536573, -2.731765, 1, 1, 1, 1, 1,
-1.729429, -0.05674125, -2.214814, 1, 1, 1, 1, 1,
-1.718741, -0.2245964, -0.5946967, 1, 1, 1, 1, 1,
-1.711533, 0.5855505, -1.799366, 1, 1, 1, 1, 1,
-1.705472, 1.28583, -1.986916, 1, 1, 1, 1, 1,
-1.702507, -1.129434, -0.9379484, 1, 1, 1, 1, 1,
-1.701126, 0.03510694, -2.068897, 1, 1, 1, 1, 1,
-1.691519, 0.1973621, 0.08235394, 1, 1, 1, 1, 1,
-1.680349, -1.378608, -3.11727, 1, 1, 1, 1, 1,
-1.67534, 0.1401399, -1.405042, 1, 1, 1, 1, 1,
-1.663041, 1.075159, -1.466644, 0, 0, 1, 1, 1,
-1.660789, -0.9167213, -1.96218, 1, 0, 0, 1, 1,
-1.653556, 1.074098, -1.954837, 1, 0, 0, 1, 1,
-1.648945, -0.6966615, -1.123648, 1, 0, 0, 1, 1,
-1.643552, -0.07780695, -1.589445, 1, 0, 0, 1, 1,
-1.629459, -0.3962676, -1.126256, 1, 0, 0, 1, 1,
-1.612627, -0.4930454, -1.677922, 0, 0, 0, 1, 1,
-1.604013, 0.3030429, -2.087979, 0, 0, 0, 1, 1,
-1.600379, 0.08847414, -0.8310902, 0, 0, 0, 1, 1,
-1.59616, -0.7717933, -3.112428, 0, 0, 0, 1, 1,
-1.593428, 1.520959, -0.3970301, 0, 0, 0, 1, 1,
-1.557738, 0.6766881, -1.810186, 0, 0, 0, 1, 1,
-1.55535, -1.312052, -1.198609, 0, 0, 0, 1, 1,
-1.538816, -0.3147671, -1.115273, 1, 1, 1, 1, 1,
-1.510785, -0.9389923, -1.69554, 1, 1, 1, 1, 1,
-1.500351, 0.1779365, -1.256497, 1, 1, 1, 1, 1,
-1.498363, 0.01703202, -3.059722, 1, 1, 1, 1, 1,
-1.484746, -0.1881992, -2.229974, 1, 1, 1, 1, 1,
-1.480539, 2.184845, -0.5864037, 1, 1, 1, 1, 1,
-1.473464, -2.300259, -2.456407, 1, 1, 1, 1, 1,
-1.470716, -1.364953, -2.240585, 1, 1, 1, 1, 1,
-1.465722, 0.7358407, -0.5846151, 1, 1, 1, 1, 1,
-1.461938, 0.7017371, -0.5288604, 1, 1, 1, 1, 1,
-1.457083, -0.7782101, -1.636312, 1, 1, 1, 1, 1,
-1.453951, -0.004709254, -2.623597, 1, 1, 1, 1, 1,
-1.449056, -0.123499, -1.470693, 1, 1, 1, 1, 1,
-1.44474, 0.4308149, -0.886417, 1, 1, 1, 1, 1,
-1.444596, -0.8556315, -2.269464, 1, 1, 1, 1, 1,
-1.442384, 1.094364, -1.384507, 0, 0, 1, 1, 1,
-1.419659, 0.2539112, -1.090312, 1, 0, 0, 1, 1,
-1.41228, 0.05101134, -1.57814, 1, 0, 0, 1, 1,
-1.41075, 1.661646, -1.623072, 1, 0, 0, 1, 1,
-1.400391, -0.3296068, -1.690235, 1, 0, 0, 1, 1,
-1.392593, -1.242416, -2.996424, 1, 0, 0, 1, 1,
-1.388993, 0.9397764, -1.431613, 0, 0, 0, 1, 1,
-1.385686, -0.5523952, -1.527652, 0, 0, 0, 1, 1,
-1.378263, -1.681382, -2.456831, 0, 0, 0, 1, 1,
-1.373984, -1.275448, -1.488647, 0, 0, 0, 1, 1,
-1.366372, -1.640869, -2.916175, 0, 0, 0, 1, 1,
-1.362622, -0.1608082, -1.38459, 0, 0, 0, 1, 1,
-1.350552, 0.2180968, -0.8981737, 0, 0, 0, 1, 1,
-1.348807, 2.028886, -2.709588, 1, 1, 1, 1, 1,
-1.348558, 0.783271, -2.001916, 1, 1, 1, 1, 1,
-1.345399, -0.8791013, -0.4165102, 1, 1, 1, 1, 1,
-1.340757, 0.6912826, -0.9947454, 1, 1, 1, 1, 1,
-1.340037, -0.08070577, -0.3520276, 1, 1, 1, 1, 1,
-1.338393, 0.6458153, 0.476124, 1, 1, 1, 1, 1,
-1.337837, 0.4448379, -0.9276764, 1, 1, 1, 1, 1,
-1.336011, 2.083379, -0.04477801, 1, 1, 1, 1, 1,
-1.334374, -1.224817, -2.655302, 1, 1, 1, 1, 1,
-1.331166, 0.1163686, -0.1449958, 1, 1, 1, 1, 1,
-1.321758, 0.9499336, -0.8385912, 1, 1, 1, 1, 1,
-1.310384, 1.095155, -2.043386, 1, 1, 1, 1, 1,
-1.291379, 0.8332253, 0.05680573, 1, 1, 1, 1, 1,
-1.287062, 0.4625206, -1.003749, 1, 1, 1, 1, 1,
-1.282591, -0.2307317, -3.038232, 1, 1, 1, 1, 1,
-1.278095, 1.510596, 0.2937762, 0, 0, 1, 1, 1,
-1.275139, -0.4289906, -1.24225, 1, 0, 0, 1, 1,
-1.271604, 2.03214, -0.1809022, 1, 0, 0, 1, 1,
-1.271447, 0.9150843, -0.4882556, 1, 0, 0, 1, 1,
-1.268618, -1.793495, -1.232651, 1, 0, 0, 1, 1,
-1.267979, 0.3769798, -1.069953, 1, 0, 0, 1, 1,
-1.265911, 2.135113, 0.04334603, 0, 0, 0, 1, 1,
-1.26195, -1.176987, -4.117626, 0, 0, 0, 1, 1,
-1.256136, -1.725217, -2.772216, 0, 0, 0, 1, 1,
-1.246338, -0.3917402, -3.008376, 0, 0, 0, 1, 1,
-1.24378, -1.546266, -3.173968, 0, 0, 0, 1, 1,
-1.238675, -2.375884, -2.560897, 0, 0, 0, 1, 1,
-1.233245, -0.9971633, -2.857781, 0, 0, 0, 1, 1,
-1.222972, 0.769792, -1.757202, 1, 1, 1, 1, 1,
-1.21269, 0.4067658, -1.166286, 1, 1, 1, 1, 1,
-1.208769, 0.1491022, -0.1233638, 1, 1, 1, 1, 1,
-1.182392, 1.085576, 1.014942, 1, 1, 1, 1, 1,
-1.182029, -0.998385, -2.809427, 1, 1, 1, 1, 1,
-1.173799, -0.3415104, -2.041083, 1, 1, 1, 1, 1,
-1.172557, -0.6000674, -3.051138, 1, 1, 1, 1, 1,
-1.168878, 0.7455645, -0.4184471, 1, 1, 1, 1, 1,
-1.168612, 0.5382265, -0.7165838, 1, 1, 1, 1, 1,
-1.161101, 0.3961577, -2.153088, 1, 1, 1, 1, 1,
-1.151995, -0.6800822, -1.247938, 1, 1, 1, 1, 1,
-1.149477, -0.2297151, -0.2415463, 1, 1, 1, 1, 1,
-1.144584, -0.11308, -2.039696, 1, 1, 1, 1, 1,
-1.142694, -1.729036, -2.789054, 1, 1, 1, 1, 1,
-1.132717, -0.7511014, -0.7059439, 1, 1, 1, 1, 1,
-1.12666, -0.6383746, -1.753654, 0, 0, 1, 1, 1,
-1.126235, 2.783474, -0.388888, 1, 0, 0, 1, 1,
-1.122583, -0.1711808, -1.087146, 1, 0, 0, 1, 1,
-1.117054, 0.07811812, -1.83931, 1, 0, 0, 1, 1,
-1.113964, 1.263272, -2.522803, 1, 0, 0, 1, 1,
-1.105636, -1.001459, -2.760024, 1, 0, 0, 1, 1,
-1.093859, -0.00166788, -0.5345581, 0, 0, 0, 1, 1,
-1.092031, -0.7712976, -2.832465, 0, 0, 0, 1, 1,
-1.088038, -0.02227996, -1.871577, 0, 0, 0, 1, 1,
-1.082016, 0.3448597, -2.160331, 0, 0, 0, 1, 1,
-1.069111, 1.076117, -1.140801, 0, 0, 0, 1, 1,
-1.068875, 0.4881455, -1.193551, 0, 0, 0, 1, 1,
-1.065545, -0.1742663, -2.234095, 0, 0, 0, 1, 1,
-1.062919, -0.6288052, -1.807464, 1, 1, 1, 1, 1,
-1.060237, -0.2200491, -1.817913, 1, 1, 1, 1, 1,
-1.052134, -0.6048975, -1.952353, 1, 1, 1, 1, 1,
-1.047814, 1.175053, -0.9960912, 1, 1, 1, 1, 1,
-1.043984, 0.1260971, -0.5503447, 1, 1, 1, 1, 1,
-1.043346, 0.229434, -0.7750815, 1, 1, 1, 1, 1,
-1.037202, -2.681722, -2.734334, 1, 1, 1, 1, 1,
-1.034689, 1.462633, -1.688065, 1, 1, 1, 1, 1,
-1.030139, 0.5830995, -2.222855, 1, 1, 1, 1, 1,
-1.02969, -0.5716306, -1.918684, 1, 1, 1, 1, 1,
-1.022092, -0.8080014, -1.367376, 1, 1, 1, 1, 1,
-1.016728, 0.0918245, -1.177775, 1, 1, 1, 1, 1,
-1.013174, -0.155024, -1.078608, 1, 1, 1, 1, 1,
-1.005014, 0.06089359, -1.966378, 1, 1, 1, 1, 1,
-0.9993131, 0.3591996, -1.672515, 1, 1, 1, 1, 1,
-0.9980165, -2.73008, -2.778608, 0, 0, 1, 1, 1,
-0.9955412, 0.817325, -1.118836, 1, 0, 0, 1, 1,
-0.9787743, -1.996683, -2.007451, 1, 0, 0, 1, 1,
-0.9765593, -1.40636, -3.393516, 1, 0, 0, 1, 1,
-0.9727604, 1.069523, 0.3668733, 1, 0, 0, 1, 1,
-0.9706368, 1.793505, -1.692947, 1, 0, 0, 1, 1,
-0.9685099, 1.159583, -1.327129, 0, 0, 0, 1, 1,
-0.9674327, 0.588361, -2.582537, 0, 0, 0, 1, 1,
-0.9593645, 0.3721047, -2.192532, 0, 0, 0, 1, 1,
-0.9564029, 0.1844685, -1.073811, 0, 0, 0, 1, 1,
-0.9450671, 0.1383077, -1.786955, 0, 0, 0, 1, 1,
-0.9450213, 0.1130625, -2.44921, 0, 0, 0, 1, 1,
-0.9443986, -0.353015, -2.171441, 0, 0, 0, 1, 1,
-0.9418793, 0.7203166, -0.7081272, 1, 1, 1, 1, 1,
-0.9274341, 0.6248407, -0.565937, 1, 1, 1, 1, 1,
-0.9255932, 0.6165644, -1.144246, 1, 1, 1, 1, 1,
-0.9233575, -1.714697, -2.832567, 1, 1, 1, 1, 1,
-0.9204885, 1.68047, -1.344875, 1, 1, 1, 1, 1,
-0.9036517, -1.37204, -3.14892, 1, 1, 1, 1, 1,
-0.8990567, 0.980803, 0.1723433, 1, 1, 1, 1, 1,
-0.8982984, 0.8016648, -1.03635, 1, 1, 1, 1, 1,
-0.8902726, 0.6079383, -2.720078, 1, 1, 1, 1, 1,
-0.8881737, -1.441674, -2.525488, 1, 1, 1, 1, 1,
-0.8871168, -2.02242, -3.994589, 1, 1, 1, 1, 1,
-0.8819823, -0.8939467, -2.234224, 1, 1, 1, 1, 1,
-0.8814532, -0.2406713, -2.456292, 1, 1, 1, 1, 1,
-0.8741661, 1.827217, 0.06705769, 1, 1, 1, 1, 1,
-0.86071, -1.640285, -2.677002, 1, 1, 1, 1, 1,
-0.8590837, -0.6377916, -2.81651, 0, 0, 1, 1, 1,
-0.8475942, -0.2731812, -1.542106, 1, 0, 0, 1, 1,
-0.8421577, 0.2298365, -1.368502, 1, 0, 0, 1, 1,
-0.8418643, -0.4174776, -3.157259, 1, 0, 0, 1, 1,
-0.8380978, 0.07744159, -1.53528, 1, 0, 0, 1, 1,
-0.8302083, -1.300392, -1.404004, 1, 0, 0, 1, 1,
-0.8192669, 0.2117914, -1.824328, 0, 0, 0, 1, 1,
-0.8188578, 0.9491374, -2.843183, 0, 0, 0, 1, 1,
-0.807151, -0.7524678, -0.3057659, 0, 0, 0, 1, 1,
-0.8046222, 0.005584784, -2.186042, 0, 0, 0, 1, 1,
-0.7987486, 1.32046, -1.451308, 0, 0, 0, 1, 1,
-0.7951508, 0.6685274, -2.277501, 0, 0, 0, 1, 1,
-0.7912033, -0.2773517, -3.273124, 0, 0, 0, 1, 1,
-0.7898, 1.671697, -0.975252, 1, 1, 1, 1, 1,
-0.7893187, -1.396352, -3.155884, 1, 1, 1, 1, 1,
-0.786029, -1.536013, -1.849443, 1, 1, 1, 1, 1,
-0.7856623, -0.3026958, -1.205135, 1, 1, 1, 1, 1,
-0.7854626, -0.753081, -0.1331457, 1, 1, 1, 1, 1,
-0.7851912, 1.090016, 1.41674, 1, 1, 1, 1, 1,
-0.7786281, 0.6429896, -2.661921, 1, 1, 1, 1, 1,
-0.7773554, -1.778323, -1.483056, 1, 1, 1, 1, 1,
-0.7719909, 0.5557259, -2.266611, 1, 1, 1, 1, 1,
-0.7704425, 0.6803624, -1.000341, 1, 1, 1, 1, 1,
-0.7691845, 1.125422, -0.9328301, 1, 1, 1, 1, 1,
-0.7647133, -0.4321404, -0.8626146, 1, 1, 1, 1, 1,
-0.7637598, -0.2701702, -2.318058, 1, 1, 1, 1, 1,
-0.7609372, 0.01092467, -1.639367, 1, 1, 1, 1, 1,
-0.7561648, -0.07324341, -1.126743, 1, 1, 1, 1, 1,
-0.7530013, -0.6370285, -2.261926, 0, 0, 1, 1, 1,
-0.7519947, 1.327766, -0.6046451, 1, 0, 0, 1, 1,
-0.7484395, -0.5092951, -1.790371, 1, 0, 0, 1, 1,
-0.7454267, 0.06048689, -0.6694315, 1, 0, 0, 1, 1,
-0.7405665, 0.151248, -0.9443506, 1, 0, 0, 1, 1,
-0.7364569, 1.226541, -1.675373, 1, 0, 0, 1, 1,
-0.7268317, 1.484942, -2.836949, 0, 0, 0, 1, 1,
-0.7250488, 0.9579785, 0.1499529, 0, 0, 0, 1, 1,
-0.7228598, -0.2570182, -0.2850256, 0, 0, 0, 1, 1,
-0.7194635, -0.8959236, -2.082509, 0, 0, 0, 1, 1,
-0.7122359, 1.608151, -0.5810854, 0, 0, 0, 1, 1,
-0.7097868, 0.7840837, 0.7850046, 0, 0, 0, 1, 1,
-0.7011065, -0.6232907, -1.114442, 0, 0, 0, 1, 1,
-0.6977894, -0.009301394, -1.957149, 1, 1, 1, 1, 1,
-0.6914493, -1.424167, -1.80792, 1, 1, 1, 1, 1,
-0.6862793, 0.9280245, -1.377817, 1, 1, 1, 1, 1,
-0.6844568, -0.1651427, -2.174772, 1, 1, 1, 1, 1,
-0.6833206, -0.1068189, 0.6702946, 1, 1, 1, 1, 1,
-0.6813422, -1.329993, -2.769302, 1, 1, 1, 1, 1,
-0.6759726, 0.423754, -1.475739, 1, 1, 1, 1, 1,
-0.6735674, 0.6915091, -0.411482, 1, 1, 1, 1, 1,
-0.6719142, -0.3641544, -2.332831, 1, 1, 1, 1, 1,
-0.6676499, -1.151724, -3.413805, 1, 1, 1, 1, 1,
-0.6633509, -2.058011, -4.686569, 1, 1, 1, 1, 1,
-0.6612396, -0.5043718, -2.682936, 1, 1, 1, 1, 1,
-0.6519674, 0.2177936, -0.432217, 1, 1, 1, 1, 1,
-0.643173, -1.364727, -1.198485, 1, 1, 1, 1, 1,
-0.6413907, 0.6282368, 0.1377085, 1, 1, 1, 1, 1,
-0.6394072, -0.6325865, -1.971935, 0, 0, 1, 1, 1,
-0.638047, -0.3604088, -0.6754011, 1, 0, 0, 1, 1,
-0.6375784, -0.2641328, 0.06247835, 1, 0, 0, 1, 1,
-0.63442, 0.9367748, -0.8764449, 1, 0, 0, 1, 1,
-0.6312457, 0.1984687, -0.9191726, 1, 0, 0, 1, 1,
-0.6175718, 0.1309032, -2.036561, 1, 0, 0, 1, 1,
-0.614406, 0.03488675, -3.779649, 0, 0, 0, 1, 1,
-0.6133036, -0.6611094, -1.385113, 0, 0, 0, 1, 1,
-0.6117202, 1.61745, -0.3210731, 0, 0, 0, 1, 1,
-0.6106889, 0.833257, -2.228541, 0, 0, 0, 1, 1,
-0.6074563, -1.099759, -2.954654, 0, 0, 0, 1, 1,
-0.6038644, 0.2129748, -0.3230069, 0, 0, 0, 1, 1,
-0.6016107, -1.352733, -2.172061, 0, 0, 0, 1, 1,
-0.5997256, 0.7556955, -1.262625, 1, 1, 1, 1, 1,
-0.598038, -0.5871766, -2.540402, 1, 1, 1, 1, 1,
-0.5943002, -0.834577, -1.302781, 1, 1, 1, 1, 1,
-0.5926276, -0.1678142, 0.4074589, 1, 1, 1, 1, 1,
-0.5834495, -0.7731165, -4.44796, 1, 1, 1, 1, 1,
-0.5826105, 1.27521, 0.6525394, 1, 1, 1, 1, 1,
-0.5728458, -0.5890823, -4.450084, 1, 1, 1, 1, 1,
-0.5710306, 0.7324479, -1.445412, 1, 1, 1, 1, 1,
-0.5707315, -0.01197444, -1.464981, 1, 1, 1, 1, 1,
-0.569356, -1.110684, -3.664417, 1, 1, 1, 1, 1,
-0.5588694, -1.19857, -1.11488, 1, 1, 1, 1, 1,
-0.555423, 0.9140257, -0.2800916, 1, 1, 1, 1, 1,
-0.5499471, 0.4086396, -1.600231, 1, 1, 1, 1, 1,
-0.5451054, -0.7574065, -2.516471, 1, 1, 1, 1, 1,
-0.5445723, 0.8374035, 0.5676501, 1, 1, 1, 1, 1,
-0.5443521, 1.962109, 1.173665, 0, 0, 1, 1, 1,
-0.5418184, -0.2519194, -2.760424, 1, 0, 0, 1, 1,
-0.5391292, -0.9149582, -4.732494, 1, 0, 0, 1, 1,
-0.5382429, 0.426295, -0.4454901, 1, 0, 0, 1, 1,
-0.5382208, -0.2278636, -1.888796, 1, 0, 0, 1, 1,
-0.5344325, 1.604715, 1.05458, 1, 0, 0, 1, 1,
-0.5343222, -0.2340188, -0.754257, 0, 0, 0, 1, 1,
-0.5326505, -0.04976205, -1.696024, 0, 0, 0, 1, 1,
-0.5308625, 0.552054, -0.6648047, 0, 0, 0, 1, 1,
-0.5236428, -0.8974752, -3.354366, 0, 0, 0, 1, 1,
-0.517554, 0.5259504, 0.3909331, 0, 0, 0, 1, 1,
-0.5170138, 1.569306, -0.1076669, 0, 0, 0, 1, 1,
-0.5155884, -0.520675, -3.639441, 0, 0, 0, 1, 1,
-0.5128878, -1.145244, -2.382238, 1, 1, 1, 1, 1,
-0.5120875, 1.576433, -2.102701, 1, 1, 1, 1, 1,
-0.5088856, -0.6509655, -1.909704, 1, 1, 1, 1, 1,
-0.5035036, -0.9541615, -2.90659, 1, 1, 1, 1, 1,
-0.5012713, 1.112802, -1.551818, 1, 1, 1, 1, 1,
-0.4994289, 0.6627251, -0.4198725, 1, 1, 1, 1, 1,
-0.4950566, 1.198476, -0.2888105, 1, 1, 1, 1, 1,
-0.4942484, 0.3737522, -1.301067, 1, 1, 1, 1, 1,
-0.4907805, -0.6231845, -0.5323853, 1, 1, 1, 1, 1,
-0.4849089, -1.364725, -2.476889, 1, 1, 1, 1, 1,
-0.4826021, 1.666333, 0.6272003, 1, 1, 1, 1, 1,
-0.482104, -0.7407288, -3.059143, 1, 1, 1, 1, 1,
-0.481174, -1.76033, -1.809456, 1, 1, 1, 1, 1,
-0.4728191, -0.8545183, -1.717367, 1, 1, 1, 1, 1,
-0.4689262, 2.054626, 0.6298601, 1, 1, 1, 1, 1,
-0.4686314, 0.1355079, -1.051594, 0, 0, 1, 1, 1,
-0.4664886, 1.22017, -0.3072712, 1, 0, 0, 1, 1,
-0.466028, -0.04732399, -3.377853, 1, 0, 0, 1, 1,
-0.4642593, 0.1133711, -0.3506394, 1, 0, 0, 1, 1,
-0.4630321, 0.1272672, -1.467383, 1, 0, 0, 1, 1,
-0.461789, 0.4624491, -0.6700748, 1, 0, 0, 1, 1,
-0.4580756, 0.3242538, -1.082994, 0, 0, 0, 1, 1,
-0.4537682, -0.6474245, -2.471259, 0, 0, 0, 1, 1,
-0.4502562, 1.025828, -0.1382622, 0, 0, 0, 1, 1,
-0.4498981, -0.1008791, 1.578039, 0, 0, 0, 1, 1,
-0.447056, -0.1000771, -2.17423, 0, 0, 0, 1, 1,
-0.4456966, -0.5183374, -2.739909, 0, 0, 0, 1, 1,
-0.4404653, 0.5269614, -0.8668357, 0, 0, 0, 1, 1,
-0.4366449, -0.166988, -2.335098, 1, 1, 1, 1, 1,
-0.4309261, 1.235198, 0.4926199, 1, 1, 1, 1, 1,
-0.4289764, -2.452141, -2.69892, 1, 1, 1, 1, 1,
-0.4268878, 0.4108453, -2.260536, 1, 1, 1, 1, 1,
-0.4245733, 1.793408, -1.108822, 1, 1, 1, 1, 1,
-0.4175086, 0.02804893, -1.324836, 1, 1, 1, 1, 1,
-0.4063397, 0.2134924, 0.6633594, 1, 1, 1, 1, 1,
-0.3998085, -1.131555, -2.690604, 1, 1, 1, 1, 1,
-0.3996649, 0.8862224, -0.7026346, 1, 1, 1, 1, 1,
-0.3990488, -1.049126, -2.118306, 1, 1, 1, 1, 1,
-0.397679, -0.3900712, -3.351669, 1, 1, 1, 1, 1,
-0.3928253, -0.3698323, -2.304682, 1, 1, 1, 1, 1,
-0.3918978, 0.7550774, -1.105542, 1, 1, 1, 1, 1,
-0.3896939, 0.2761523, -2.134349, 1, 1, 1, 1, 1,
-0.386997, -0.4314525, -3.64222, 1, 1, 1, 1, 1,
-0.3867544, 1.047605, -0.1421961, 0, 0, 1, 1, 1,
-0.3850459, -0.5618067, -1.766258, 1, 0, 0, 1, 1,
-0.3849453, -1.344644, -2.531722, 1, 0, 0, 1, 1,
-0.3820057, 1.029253, -0.5684726, 1, 0, 0, 1, 1,
-0.3812565, -1.008831, -0.6022762, 1, 0, 0, 1, 1,
-0.3725839, -0.8266547, -2.168598, 1, 0, 0, 1, 1,
-0.3717929, -0.03354872, -3.042584, 0, 0, 0, 1, 1,
-0.3683781, 0.4648107, -0.439355, 0, 0, 0, 1, 1,
-0.3668769, -1.811421, -2.883618, 0, 0, 0, 1, 1,
-0.3641654, -0.4504231, -2.80201, 0, 0, 0, 1, 1,
-0.3634948, -1.138697, -4.002136, 0, 0, 0, 1, 1,
-0.3627163, -1.079543, -3.089918, 0, 0, 0, 1, 1,
-0.3617688, 0.7297958, 0.2665746, 0, 0, 0, 1, 1,
-0.355923, 0.6627939, 0.2109837, 1, 1, 1, 1, 1,
-0.3504143, -0.2510544, -1.83125, 1, 1, 1, 1, 1,
-0.3481032, -0.3909878, -1.290192, 1, 1, 1, 1, 1,
-0.3443955, -1.151578, -2.592818, 1, 1, 1, 1, 1,
-0.3443306, -0.8057098, -1.32152, 1, 1, 1, 1, 1,
-0.3442194, -0.6396606, -3.49493, 1, 1, 1, 1, 1,
-0.344082, 0.8837355, -0.08578792, 1, 1, 1, 1, 1,
-0.3437368, 0.5423872, -1.771855, 1, 1, 1, 1, 1,
-0.3207491, -0.003052832, -1.032904, 1, 1, 1, 1, 1,
-0.3190229, 0.03597671, -1.557563, 1, 1, 1, 1, 1,
-0.3187899, -0.8536636, -2.925685, 1, 1, 1, 1, 1,
-0.3163956, -1.079908, -1.304601, 1, 1, 1, 1, 1,
-0.3144313, -0.850652, -3.150569, 1, 1, 1, 1, 1,
-0.3141594, -1.649527, -4.42518, 1, 1, 1, 1, 1,
-0.3140355, -0.4566856, -4.055398, 1, 1, 1, 1, 1,
-0.3123948, -0.7036021, -1.812842, 0, 0, 1, 1, 1,
-0.3104332, -0.4570306, -2.354131, 1, 0, 0, 1, 1,
-0.3083718, 0.1831203, -2.337695, 1, 0, 0, 1, 1,
-0.303377, -0.5833852, -3.179961, 1, 0, 0, 1, 1,
-0.3026857, -1.823175, -1.998205, 1, 0, 0, 1, 1,
-0.299906, -1.000196, -2.373078, 1, 0, 0, 1, 1,
-0.2955154, -0.9963393, -3.843947, 0, 0, 0, 1, 1,
-0.290258, -1.200972, -2.106978, 0, 0, 0, 1, 1,
-0.2871014, 0.1786022, -0.3414593, 0, 0, 0, 1, 1,
-0.2864511, 2.746285, -0.7063613, 0, 0, 0, 1, 1,
-0.2864337, -1.254422, -4.170039, 0, 0, 0, 1, 1,
-0.2833043, -0.8637707, -2.395807, 0, 0, 0, 1, 1,
-0.2832001, -0.2307324, -3.182311, 0, 0, 0, 1, 1,
-0.2813921, 0.08047327, -1.607309, 1, 1, 1, 1, 1,
-0.2806177, -0.9133658, -4.332493, 1, 1, 1, 1, 1,
-0.2752075, 0.5308858, -0.7327503, 1, 1, 1, 1, 1,
-0.2751565, -0.1908514, -2.512316, 1, 1, 1, 1, 1,
-0.2695701, -0.5244207, -2.135906, 1, 1, 1, 1, 1,
-0.2673057, 0.1964652, -0.3587044, 1, 1, 1, 1, 1,
-0.2667814, -1.041088, -3.929549, 1, 1, 1, 1, 1,
-0.2658162, 0.4601171, 0.1245737, 1, 1, 1, 1, 1,
-0.2632234, -0.01820961, -3.058501, 1, 1, 1, 1, 1,
-0.2617967, 1.469831, -1.574536, 1, 1, 1, 1, 1,
-0.2606464, 2.741497, -0.1417773, 1, 1, 1, 1, 1,
-0.2566248, 0.8053233, 0.06944031, 1, 1, 1, 1, 1,
-0.2563473, 0.8420729, -0.04759296, 1, 1, 1, 1, 1,
-0.2559996, -0.645156, -1.28551, 1, 1, 1, 1, 1,
-0.2534151, 1.240867, 0.01817166, 1, 1, 1, 1, 1,
-0.2508209, -1.201847, -1.394359, 0, 0, 1, 1, 1,
-0.2507663, -0.4237634, -1.918261, 1, 0, 0, 1, 1,
-0.2449004, -1.314889, -3.500562, 1, 0, 0, 1, 1,
-0.2406579, -1.573054, -3.012726, 1, 0, 0, 1, 1,
-0.2384582, -1.610246, -3.901956, 1, 0, 0, 1, 1,
-0.2376562, 1.143845, -1.170012, 1, 0, 0, 1, 1,
-0.2363158, 0.5712026, -1.617519, 0, 0, 0, 1, 1,
-0.2345968, 1.407746, 1.282471, 0, 0, 0, 1, 1,
-0.2305383, -0.8729264, -2.031368, 0, 0, 0, 1, 1,
-0.2294213, 0.06166333, -2.136781, 0, 0, 0, 1, 1,
-0.2286448, -2.663667, -3.635967, 0, 0, 0, 1, 1,
-0.2236297, -0.6844522, -2.22367, 0, 0, 0, 1, 1,
-0.2200441, 0.1439577, -0.4017206, 0, 0, 0, 1, 1,
-0.2187296, -1.54363, -3.029306, 1, 1, 1, 1, 1,
-0.2186616, 1.05998, 1.866554, 1, 1, 1, 1, 1,
-0.2145916, -1.283341, -3.481635, 1, 1, 1, 1, 1,
-0.2103406, -0.04414259, -1.045899, 1, 1, 1, 1, 1,
-0.2092094, 1.823365, 0.920162, 1, 1, 1, 1, 1,
-0.2071862, -0.5921965, -3.935753, 1, 1, 1, 1, 1,
-0.2051212, -0.8153003, -4.812385, 1, 1, 1, 1, 1,
-0.203338, -0.1626091, -3.649065, 1, 1, 1, 1, 1,
-0.1965469, -2.197004, -2.795711, 1, 1, 1, 1, 1,
-0.1927203, -1.23813, -1.719425, 1, 1, 1, 1, 1,
-0.1883422, 1.015612, 0.2227684, 1, 1, 1, 1, 1,
-0.1881771, -0.3792387, -3.49065, 1, 1, 1, 1, 1,
-0.185204, -1.279628, -4.530782, 1, 1, 1, 1, 1,
-0.183237, -0.8011721, -3.43481, 1, 1, 1, 1, 1,
-0.1831047, -1.212364, -1.985071, 1, 1, 1, 1, 1,
-0.1825524, 1.197374, -0.5438516, 0, 0, 1, 1, 1,
-0.1796686, -1.309237, -1.57147, 1, 0, 0, 1, 1,
-0.1776441, -0.7793601, -2.829401, 1, 0, 0, 1, 1,
-0.1763217, 1.165415, 0.3061684, 1, 0, 0, 1, 1,
-0.1723253, 1.589272, -0.7493474, 1, 0, 0, 1, 1,
-0.1719413, -0.02780715, -0.9783742, 1, 0, 0, 1, 1,
-0.1692706, 0.2345978, 0.03954137, 0, 0, 0, 1, 1,
-0.1684227, 0.166072, -2.081587, 0, 0, 0, 1, 1,
-0.164638, -0.05059991, -0.6309085, 0, 0, 0, 1, 1,
-0.1645977, 0.2870182, -0.7974169, 0, 0, 0, 1, 1,
-0.1617091, -1.295299, -2.849561, 0, 0, 0, 1, 1,
-0.1606885, -0.2487109, -0.9901561, 0, 0, 0, 1, 1,
-0.1592476, -0.805745, -1.424721, 0, 0, 0, 1, 1,
-0.1556494, 1.924113, -1.142905, 1, 1, 1, 1, 1,
-0.1505875, -2.720753, -3.288632, 1, 1, 1, 1, 1,
-0.1477683, 0.9244983, 0.1862523, 1, 1, 1, 1, 1,
-0.13848, -0.4160944, -2.110546, 1, 1, 1, 1, 1,
-0.1380823, 0.1798159, -1.121738, 1, 1, 1, 1, 1,
-0.1378804, -0.1459841, -3.546966, 1, 1, 1, 1, 1,
-0.1334694, 0.1646523, -2.34386, 1, 1, 1, 1, 1,
-0.1303623, 0.5666109, -0.4529545, 1, 1, 1, 1, 1,
-0.1292706, 0.638045, 0.3169487, 1, 1, 1, 1, 1,
-0.1278711, -0.2161486, -2.292391, 1, 1, 1, 1, 1,
-0.1272251, -1.867233, -2.988812, 1, 1, 1, 1, 1,
-0.1252468, 0.08667661, -0.3011258, 1, 1, 1, 1, 1,
-0.1155492, 0.9074035, -0.1661917, 1, 1, 1, 1, 1,
-0.1125641, -0.6961676, -2.918976, 1, 1, 1, 1, 1,
-0.1117712, -0.60533, -3.947188, 1, 1, 1, 1, 1,
-0.109021, -0.9204979, -2.028084, 0, 0, 1, 1, 1,
-0.1016729, -0.5652008, -2.388013, 1, 0, 0, 1, 1,
-0.1011223, -0.466149, -3.190398, 1, 0, 0, 1, 1,
-0.0994534, 0.974613, 0.1507425, 1, 0, 0, 1, 1,
-0.08620157, -0.1304634, -4.421151, 1, 0, 0, 1, 1,
-0.08247671, 0.6552008, -1.246785, 1, 0, 0, 1, 1,
-0.07988036, 0.1164157, -1.432061, 0, 0, 0, 1, 1,
-0.07527486, 0.2926666, -0.5635021, 0, 0, 0, 1, 1,
-0.06490658, 0.4668799, 0.8197805, 0, 0, 0, 1, 1,
-0.06348119, -0.6195326, -2.335507, 0, 0, 0, 1, 1,
-0.0618754, 0.6107058, -2.986232, 0, 0, 0, 1, 1,
-0.06113372, 0.5002451, -2.639743, 0, 0, 0, 1, 1,
-0.06001226, -0.08487018, -2.465204, 0, 0, 0, 1, 1,
-0.05764439, 0.334223, -1.058589, 1, 1, 1, 1, 1,
-0.0575964, -0.7061768, -1.931474, 1, 1, 1, 1, 1,
-0.05195529, 0.1198046, -0.6986957, 1, 1, 1, 1, 1,
-0.05057007, -0.1793857, -2.271853, 1, 1, 1, 1, 1,
-0.04893895, -1.57427, -2.699638, 1, 1, 1, 1, 1,
-0.04851259, -0.255652, -4.822905, 1, 1, 1, 1, 1,
-0.04827229, -0.5237181, -2.069899, 1, 1, 1, 1, 1,
-0.04704244, -2.283516, -2.768173, 1, 1, 1, 1, 1,
-0.04560028, 0.6182814, 0.1822255, 1, 1, 1, 1, 1,
-0.04546499, 0.8312111, 1.34286, 1, 1, 1, 1, 1,
-0.04447837, -0.5752086, -4.014806, 1, 1, 1, 1, 1,
-0.04348896, 0.4927105, -1.074606, 1, 1, 1, 1, 1,
-0.0363627, -2.146941, -1.576131, 1, 1, 1, 1, 1,
-0.03594576, -0.3642661, -2.814276, 1, 1, 1, 1, 1,
-0.03322016, 1.387018, 0.2684222, 1, 1, 1, 1, 1,
-0.03130742, -1.774807, -2.959402, 0, 0, 1, 1, 1,
-0.02792014, -0.2830674, -2.442375, 1, 0, 0, 1, 1,
-0.02714724, 0.3881995, 1.433844, 1, 0, 0, 1, 1,
-0.02600828, 1.513624, -1.730644, 1, 0, 0, 1, 1,
-0.0249726, -2.80035, -4.318331, 1, 0, 0, 1, 1,
-0.02406786, 0.178927, -0.4267727, 1, 0, 0, 1, 1,
-0.02385143, -0.6687912, -3.720097, 0, 0, 0, 1, 1,
-0.02067409, 0.1428259, -0.973184, 0, 0, 0, 1, 1,
-0.01968035, -1.002231, -2.930369, 0, 0, 0, 1, 1,
-0.01904947, 0.3207867, -0.4569714, 0, 0, 0, 1, 1,
-0.01761391, -1.484356, -3.711586, 0, 0, 0, 1, 1,
-0.01657238, 0.08719077, 0.6644794, 0, 0, 0, 1, 1,
-0.01649227, 1.159895, 0.4211297, 0, 0, 0, 1, 1,
-0.01595251, 0.01462849, -1.79203, 1, 1, 1, 1, 1,
-0.01511818, 0.01422625, -0.8151612, 1, 1, 1, 1, 1,
-0.01151384, -1.563499, -2.798268, 1, 1, 1, 1, 1,
-0.01103949, -0.4932394, -2.188923, 1, 1, 1, 1, 1,
-0.01099224, -0.4099334, -3.635878, 1, 1, 1, 1, 1,
-0.01059848, -0.9557759, -3.226815, 1, 1, 1, 1, 1,
-0.01011046, -0.7960641, -2.409214, 1, 1, 1, 1, 1,
-0.01010322, -1.585786, -3.926379, 1, 1, 1, 1, 1,
-0.01009389, 0.3272565, -0.04747191, 1, 1, 1, 1, 1,
-0.007080418, -0.7868077, -3.995067, 1, 1, 1, 1, 1,
-0.004984522, -0.3324424, -5.471036, 1, 1, 1, 1, 1,
-0.004278146, 0.008355737, 0.7465531, 1, 1, 1, 1, 1,
-0.003913819, 1.736329, 2.29536, 1, 1, 1, 1, 1,
0.002977702, -1.815271, 3.555581, 1, 1, 1, 1, 1,
0.00362369, -1.176774, 1.755902, 1, 1, 1, 1, 1,
0.00448403, -1.045376, 1.76292, 0, 0, 1, 1, 1,
0.005045165, 0.06355598, -0.91855, 1, 0, 0, 1, 1,
0.008350596, -0.7736098, 2.149171, 1, 0, 0, 1, 1,
0.009446518, -0.1787853, 3.171762, 1, 0, 0, 1, 1,
0.01049451, 0.1861982, 0.7854915, 1, 0, 0, 1, 1,
0.01066954, 1.65741, 1.40671, 1, 0, 0, 1, 1,
0.01078939, -0.9236435, 1.714504, 0, 0, 0, 1, 1,
0.02013889, -0.1601951, 3.381466, 0, 0, 0, 1, 1,
0.02104669, -0.9687853, 1.443553, 0, 0, 0, 1, 1,
0.03414966, 1.834314, -1.863392, 0, 0, 0, 1, 1,
0.03527515, 0.03956723, 0.4952963, 0, 0, 0, 1, 1,
0.03706334, -1.005644, 3.266463, 0, 0, 0, 1, 1,
0.04163907, 1.846144, 0.1391346, 0, 0, 0, 1, 1,
0.04611751, -1.569181, 2.476891, 1, 1, 1, 1, 1,
0.04697791, 0.4038728, 1.389526, 1, 1, 1, 1, 1,
0.04931593, 1.786129, 2.12382, 1, 1, 1, 1, 1,
0.05000239, 0.9323247, 0.6770881, 1, 1, 1, 1, 1,
0.05371356, 0.4806149, 0.8209587, 1, 1, 1, 1, 1,
0.0540695, 0.25834, -0.1775183, 1, 1, 1, 1, 1,
0.05623597, -0.4021035, 3.252088, 1, 1, 1, 1, 1,
0.06374399, 1.544886, 0.3967972, 1, 1, 1, 1, 1,
0.06424242, 0.1723705, -0.9648688, 1, 1, 1, 1, 1,
0.06497367, -0.3040412, 4.071967, 1, 1, 1, 1, 1,
0.06531692, -1.034357, 3.18424, 1, 1, 1, 1, 1,
0.06689527, -0.1755371, 3.138962, 1, 1, 1, 1, 1,
0.06797679, 1.963624, -1.80876, 1, 1, 1, 1, 1,
0.06849679, -0.5838259, 4.321243, 1, 1, 1, 1, 1,
0.06944463, -0.7890706, 4.397228, 1, 1, 1, 1, 1,
0.0695839, 1.595282, 1.000308, 0, 0, 1, 1, 1,
0.07007182, 0.5757666, 1.757071, 1, 0, 0, 1, 1,
0.07711767, -1.249116, 3.641573, 1, 0, 0, 1, 1,
0.07844412, -0.09562612, 2.145725, 1, 0, 0, 1, 1,
0.07911342, -1.943865, 3.476818, 1, 0, 0, 1, 1,
0.0800124, 0.2392326, -1.300151, 1, 0, 0, 1, 1,
0.08108844, -0.4354236, 4.655716, 0, 0, 0, 1, 1,
0.08461449, -1.261566, 3.54618, 0, 0, 0, 1, 1,
0.09615778, 0.1626232, 1.977519, 0, 0, 0, 1, 1,
0.1078361, -0.8499687, 3.54174, 0, 0, 0, 1, 1,
0.1090962, -0.5487544, 3.626504, 0, 0, 0, 1, 1,
0.1157991, -0.4714931, 1.864303, 0, 0, 0, 1, 1,
0.1214441, -1.288983, 2.417271, 0, 0, 0, 1, 1,
0.1229846, 0.05098747, 1.689141, 1, 1, 1, 1, 1,
0.1267949, -0.983888, 2.846416, 1, 1, 1, 1, 1,
0.128241, 0.4693637, 2.559839, 1, 1, 1, 1, 1,
0.1297827, -0.9569493, 4.144153, 1, 1, 1, 1, 1,
0.1318038, -0.1917454, 2.781924, 1, 1, 1, 1, 1,
0.1333245, -0.4511745, 3.343658, 1, 1, 1, 1, 1,
0.133703, 2.225288, -0.01515089, 1, 1, 1, 1, 1,
0.1364971, -0.7188315, 3.070036, 1, 1, 1, 1, 1,
0.1383605, 0.7927814, -1.249013, 1, 1, 1, 1, 1,
0.1390014, -0.1336398, 1.970891, 1, 1, 1, 1, 1,
0.1400849, 0.6137547, 1.037763, 1, 1, 1, 1, 1,
0.1422942, -0.6768904, 2.293167, 1, 1, 1, 1, 1,
0.1434595, 1.528414, 0.9361248, 1, 1, 1, 1, 1,
0.1441646, -2.298673, 5.801048, 1, 1, 1, 1, 1,
0.1446083, 1.020268, -0.293383, 1, 1, 1, 1, 1,
0.1477679, -0.1150093, 1.419334, 0, 0, 1, 1, 1,
0.1503297, 1.543379, -1.965589, 1, 0, 0, 1, 1,
0.1519639, -0.7247438, 2.994703, 1, 0, 0, 1, 1,
0.1542259, 0.1309166, 1.021872, 1, 0, 0, 1, 1,
0.1582669, 0.3051068, 0.2427248, 1, 0, 0, 1, 1,
0.1586363, 0.02158113, 3.501945, 1, 0, 0, 1, 1,
0.1645481, -1.479641, 3.838501, 0, 0, 0, 1, 1,
0.1683905, -0.7483556, 4.426894, 0, 0, 0, 1, 1,
0.1746457, 0.1144882, -0.1621876, 0, 0, 0, 1, 1,
0.178291, -0.9872281, 4.231298, 0, 0, 0, 1, 1,
0.1793352, 0.08284996, 0.9355699, 0, 0, 0, 1, 1,
0.1810815, 2.443497, 1.623371, 0, 0, 0, 1, 1,
0.1917265, 1.98876, 1.44429, 0, 0, 0, 1, 1,
0.1934815, 0.5588567, 1.795133, 1, 1, 1, 1, 1,
0.1948416, -0.2387832, 4.030951, 1, 1, 1, 1, 1,
0.1971064, -0.133516, 2.109905, 1, 1, 1, 1, 1,
0.200469, -0.4986211, 2.825613, 1, 1, 1, 1, 1,
0.2008894, 2.338767, 1.994731, 1, 1, 1, 1, 1,
0.2034638, -3.163069, 3.745099, 1, 1, 1, 1, 1,
0.2055093, -1.361645, 4.319426, 1, 1, 1, 1, 1,
0.2086031, -0.2455941, 2.786218, 1, 1, 1, 1, 1,
0.2126449, 1.099541, 0.1551982, 1, 1, 1, 1, 1,
0.2138893, -1.85142, 3.336306, 1, 1, 1, 1, 1,
0.2158399, 0.1615379, 1.013332, 1, 1, 1, 1, 1,
0.2160503, -1.483956, 2.65848, 1, 1, 1, 1, 1,
0.2184235, 0.8034869, -0.514767, 1, 1, 1, 1, 1,
0.2220635, -0.5211873, 4.108758, 1, 1, 1, 1, 1,
0.2224271, 0.129397, -0.3895078, 1, 1, 1, 1, 1,
0.2238315, 0.2752337, 1.222055, 0, 0, 1, 1, 1,
0.2245277, -1.305525, 2.914697, 1, 0, 0, 1, 1,
0.2294103, -1.870792, 3.511456, 1, 0, 0, 1, 1,
0.23741, 0.4341591, 0.8880328, 1, 0, 0, 1, 1,
0.2402891, 0.01456528, 1.584114, 1, 0, 0, 1, 1,
0.2536444, 0.1212885, 2.220169, 1, 0, 0, 1, 1,
0.255761, -0.4252943, 3.156259, 0, 0, 0, 1, 1,
0.25843, -2.351166, 2.025117, 0, 0, 0, 1, 1,
0.2614179, 0.278477, -0.060357, 0, 0, 0, 1, 1,
0.2625325, -0.6038898, 1.814421, 0, 0, 0, 1, 1,
0.2655001, 0.5413733, -0.3205479, 0, 0, 0, 1, 1,
0.2661391, 0.03907239, 2.230403, 0, 0, 0, 1, 1,
0.2661821, 0.503063, 0.6146395, 0, 0, 0, 1, 1,
0.2696297, -2.31335, 3.188149, 1, 1, 1, 1, 1,
0.2704583, -0.1881178, 2.629103, 1, 1, 1, 1, 1,
0.2707836, -1.270608, 2.688547, 1, 1, 1, 1, 1,
0.2745448, 1.472783, 1.214088, 1, 1, 1, 1, 1,
0.277632, -0.2750837, 2.688107, 1, 1, 1, 1, 1,
0.2806883, 0.5871426, -0.1357408, 1, 1, 1, 1, 1,
0.2827007, -0.09553996, 2.068794, 1, 1, 1, 1, 1,
0.2844655, 0.9766718, -1.622779, 1, 1, 1, 1, 1,
0.2902283, 0.286712, 2.445861, 1, 1, 1, 1, 1,
0.2910368, 0.03276771, 1.556725, 1, 1, 1, 1, 1,
0.2950481, 1.005772, -0.3742913, 1, 1, 1, 1, 1,
0.2974705, 0.3835438, 0.3469102, 1, 1, 1, 1, 1,
0.2976056, 0.8269543, -0.9242567, 1, 1, 1, 1, 1,
0.3024996, 0.2125793, 0.1291641, 1, 1, 1, 1, 1,
0.3031418, 0.4467654, 2.401211, 1, 1, 1, 1, 1,
0.3064073, 1.014007, -0.0490729, 0, 0, 1, 1, 1,
0.3066691, 0.8689157, 1.935297, 1, 0, 0, 1, 1,
0.3077052, -1.481874, 2.048154, 1, 0, 0, 1, 1,
0.3084142, 0.1506842, 1.201998, 1, 0, 0, 1, 1,
0.3115681, -0.4141807, 3.885294, 1, 0, 0, 1, 1,
0.3117793, -0.8980663, 3.246535, 1, 0, 0, 1, 1,
0.3135254, -1.696246, 2.976258, 0, 0, 0, 1, 1,
0.320646, 0.627177, 1.490803, 0, 0, 0, 1, 1,
0.3241285, 0.09779863, -0.1657594, 0, 0, 0, 1, 1,
0.3327042, 0.4966216, 1.536889, 0, 0, 0, 1, 1,
0.3344859, 0.01623718, 0.1253242, 0, 0, 0, 1, 1,
0.33505, 1.86479, 0.6892358, 0, 0, 0, 1, 1,
0.3378419, -0.9668761, 3.562846, 0, 0, 0, 1, 1,
0.3394393, 0.04047907, 0.5215481, 1, 1, 1, 1, 1,
0.3406371, 1.445552, 0.3391733, 1, 1, 1, 1, 1,
0.3408572, 0.03831943, 2.844537, 1, 1, 1, 1, 1,
0.3418314, 1.866736, -0.7550803, 1, 1, 1, 1, 1,
0.3443073, 3.084186, -1.110992, 1, 1, 1, 1, 1,
0.3443835, 0.2268181, 0.83361, 1, 1, 1, 1, 1,
0.3460504, -0.5340468, 1.834778, 1, 1, 1, 1, 1,
0.3463956, 0.5746314, 1.529164, 1, 1, 1, 1, 1,
0.3469114, -0.06756839, 1.717748, 1, 1, 1, 1, 1,
0.3484431, 0.832085, 0.7695594, 1, 1, 1, 1, 1,
0.3494873, 1.258284, -0.9812648, 1, 1, 1, 1, 1,
0.3508516, 1.235958, -1.677773, 1, 1, 1, 1, 1,
0.351587, -1.184429, 3.476198, 1, 1, 1, 1, 1,
0.3548976, 0.02094175, 1.451301, 1, 1, 1, 1, 1,
0.3556522, 0.2437833, 1.075953, 1, 1, 1, 1, 1,
0.3582478, 0.2612911, 0.9456759, 0, 0, 1, 1, 1,
0.3606546, 1.188396, -0.6927502, 1, 0, 0, 1, 1,
0.3610706, -0.6295912, 3.990315, 1, 0, 0, 1, 1,
0.3620172, -0.139663, 1.9279, 1, 0, 0, 1, 1,
0.3672381, -0.4227065, 2.039505, 1, 0, 0, 1, 1,
0.3688014, -0.4175284, 3.756155, 1, 0, 0, 1, 1,
0.369482, 1.178161, -1.122456, 0, 0, 0, 1, 1,
0.3711177, 0.9251248, 0.4774758, 0, 0, 0, 1, 1,
0.3724435, 0.3581602, 1.233886, 0, 0, 0, 1, 1,
0.3760296, 0.991702, 0.7151706, 0, 0, 0, 1, 1,
0.3833124, 1.708456, -0.6315117, 0, 0, 0, 1, 1,
0.3848574, 1.673791, 0.2003249, 0, 0, 0, 1, 1,
0.3857107, 0.04176057, 3.54514, 0, 0, 0, 1, 1,
0.3915448, 0.3559201, 0.3656014, 1, 1, 1, 1, 1,
0.4006549, -0.6891788, 0.192438, 1, 1, 1, 1, 1,
0.4009956, -2.334836, 3.108579, 1, 1, 1, 1, 1,
0.4044752, 1.726961, -0.02660273, 1, 1, 1, 1, 1,
0.4059321, -0.4655109, 3.956348, 1, 1, 1, 1, 1,
0.4067062, 1.144623, -0.9561216, 1, 1, 1, 1, 1,
0.4131809, 1.0248, 1.404875, 1, 1, 1, 1, 1,
0.4149038, -0.3570152, 1.681667, 1, 1, 1, 1, 1,
0.4168138, -0.5046992, 0.3804195, 1, 1, 1, 1, 1,
0.420207, -0.05368962, 0.8758173, 1, 1, 1, 1, 1,
0.4216248, -0.6891667, 2.793739, 1, 1, 1, 1, 1,
0.4226562, -0.6818754, 1.54839, 1, 1, 1, 1, 1,
0.422706, 0.324798, -0.3235422, 1, 1, 1, 1, 1,
0.4264189, 2.107247, 0.4091363, 1, 1, 1, 1, 1,
0.4310461, -1.340111, 4.02181, 1, 1, 1, 1, 1,
0.4362727, -0.8392853, 2.280485, 0, 0, 1, 1, 1,
0.4375789, -0.4643804, 1.923806, 1, 0, 0, 1, 1,
0.4382214, -1.496563, 2.459104, 1, 0, 0, 1, 1,
0.4389803, -1.343309, 4.626289, 1, 0, 0, 1, 1,
0.4439388, 0.6621723, -1.268549, 1, 0, 0, 1, 1,
0.4444489, 1.535937, -0.6665299, 1, 0, 0, 1, 1,
0.4446121, 0.9553739, 1.504679, 0, 0, 0, 1, 1,
0.4453808, -1.545955, 3.406753, 0, 0, 0, 1, 1,
0.4458894, 0.2496578, 1.191224, 0, 0, 0, 1, 1,
0.4506836, -2.148229, 2.522044, 0, 0, 0, 1, 1,
0.4528902, 0.4752064, -0.2434481, 0, 0, 0, 1, 1,
0.4573732, 0.3289739, -0.4070247, 0, 0, 0, 1, 1,
0.460243, -0.3107258, 1.933028, 0, 0, 0, 1, 1,
0.4603056, 0.5462249, 0.5694435, 1, 1, 1, 1, 1,
0.4629309, 0.09798916, 0.7650598, 1, 1, 1, 1, 1,
0.4629723, -0.8258669, 1.840816, 1, 1, 1, 1, 1,
0.4634234, -1.102417, 2.817883, 1, 1, 1, 1, 1,
0.4638806, 0.6105239, 0.04833091, 1, 1, 1, 1, 1,
0.4668643, 0.4448404, -0.6512781, 1, 1, 1, 1, 1,
0.4684372, -0.839312, 2.099056, 1, 1, 1, 1, 1,
0.4698491, -0.7123867, 3.334035, 1, 1, 1, 1, 1,
0.4773421, 0.07178109, 0.6818029, 1, 1, 1, 1, 1,
0.4796372, -0.7183779, 2.352617, 1, 1, 1, 1, 1,
0.4890389, 0.877072, 0.08927839, 1, 1, 1, 1, 1,
0.4921597, -0.3823415, 3.812523, 1, 1, 1, 1, 1,
0.4937881, -0.02966036, 1.260956, 1, 1, 1, 1, 1,
0.4940506, -0.1012334, -0.1992757, 1, 1, 1, 1, 1,
0.4974799, 1.599267, 0.2765799, 1, 1, 1, 1, 1,
0.4980769, 0.7596965, 1.004729, 0, 0, 1, 1, 1,
0.49947, -0.3295247, 1.786225, 1, 0, 0, 1, 1,
0.5079486, -0.1141115, 1.168151, 1, 0, 0, 1, 1,
0.5089283, -0.169436, 1.470458, 1, 0, 0, 1, 1,
0.5098364, 0.05667336, 2.303691, 1, 0, 0, 1, 1,
0.5098552, 0.8295008, 0.877785, 1, 0, 0, 1, 1,
0.5137568, -0.2435048, 1.590543, 0, 0, 0, 1, 1,
0.5138533, -1.895984, 4.361956, 0, 0, 0, 1, 1,
0.5160207, -0.8563758, 1.492467, 0, 0, 0, 1, 1,
0.5190238, 1.421158, 0.5480155, 0, 0, 0, 1, 1,
0.5219851, -0.8908239, 4.178682, 0, 0, 0, 1, 1,
0.5220924, 0.1545526, 3.256097, 0, 0, 0, 1, 1,
0.5256961, 0.1315506, 2.304192, 0, 0, 0, 1, 1,
0.5290961, 0.39189, 1.36585, 1, 1, 1, 1, 1,
0.5341782, 0.6789512, 0.7286009, 1, 1, 1, 1, 1,
0.5402209, -0.1837633, 1.414758, 1, 1, 1, 1, 1,
0.5501263, -0.2919869, 1.754017, 1, 1, 1, 1, 1,
0.5531965, 1.060722, 0.3785731, 1, 1, 1, 1, 1,
0.5565174, -0.7663096, 1.493669, 1, 1, 1, 1, 1,
0.5668241, 1.387691, 0.3463265, 1, 1, 1, 1, 1,
0.5674233, 1.345151, 1.248648, 1, 1, 1, 1, 1,
0.5729088, -0.6881938, 2.457943, 1, 1, 1, 1, 1,
0.5759462, -0.4303241, 1.613197, 1, 1, 1, 1, 1,
0.5795968, 0.6686935, -0.1157281, 1, 1, 1, 1, 1,
0.5819173, -0.9607416, 2.23018, 1, 1, 1, 1, 1,
0.5853187, -1.278982, 1.940558, 1, 1, 1, 1, 1,
0.5857747, -0.5607846, 2.06707, 1, 1, 1, 1, 1,
0.5875026, -0.1372882, 0.5413719, 1, 1, 1, 1, 1,
0.5888271, 1.64941, -0.7102656, 0, 0, 1, 1, 1,
0.5890039, 0.3981209, 0.8747453, 1, 0, 0, 1, 1,
0.5907365, -0.238822, 2.080301, 1, 0, 0, 1, 1,
0.5909929, -1.448828, 2.845783, 1, 0, 0, 1, 1,
0.5920622, -1.04359, 4.793399, 1, 0, 0, 1, 1,
0.6008038, 0.3884031, 1.167243, 1, 0, 0, 1, 1,
0.6060315, -0.9639699, 1.520708, 0, 0, 0, 1, 1,
0.6071448, -0.8622518, 1.712749, 0, 0, 0, 1, 1,
0.6099638, -1.013182, 3.868829, 0, 0, 0, 1, 1,
0.6108272, -0.8507015, 1.873671, 0, 0, 0, 1, 1,
0.620138, 0.04698681, -0.115639, 0, 0, 0, 1, 1,
0.6211565, -0.5495418, 3.572477, 0, 0, 0, 1, 1,
0.6265434, -1.244211, 2.339146, 0, 0, 0, 1, 1,
0.6291423, 0.05716501, 2.312223, 1, 1, 1, 1, 1,
0.6304276, -0.8202044, 2.173608, 1, 1, 1, 1, 1,
0.6310068, 1.743877, 1.697701, 1, 1, 1, 1, 1,
0.6326139, 0.1045863, 3.048993, 1, 1, 1, 1, 1,
0.6348138, 1.511172, 0.0783879, 1, 1, 1, 1, 1,
0.6371414, 0.76708, 0.006908165, 1, 1, 1, 1, 1,
0.64161, 0.1368669, 1.305609, 1, 1, 1, 1, 1,
0.6427457, -0.6158181, 1.641586, 1, 1, 1, 1, 1,
0.6433521, -0.9366729, 1.811282, 1, 1, 1, 1, 1,
0.6435794, -0.1192356, 2.3808, 1, 1, 1, 1, 1,
0.6469046, 0.3442892, 1.395584, 1, 1, 1, 1, 1,
0.6497663, -1.034807, 1.909201, 1, 1, 1, 1, 1,
0.651082, 0.5255045, -0.1184701, 1, 1, 1, 1, 1,
0.6513266, -1.441224, 1.465327, 1, 1, 1, 1, 1,
0.6570112, -0.540329, 1.055103, 1, 1, 1, 1, 1,
0.6613346, 1.180253, 2.152164, 0, 0, 1, 1, 1,
0.6665983, -1.00263, 2.658778, 1, 0, 0, 1, 1,
0.667579, 0.4574663, 0.8476036, 1, 0, 0, 1, 1,
0.6724756, 1.56757, 0.7715944, 1, 0, 0, 1, 1,
0.6818467, -0.1648165, 2.489578, 1, 0, 0, 1, 1,
0.6846027, 0.9778976, -0.4599518, 1, 0, 0, 1, 1,
0.6857169, -1.347378, 3.850903, 0, 0, 0, 1, 1,
0.6884061, 2.137232, 0.03084383, 0, 0, 0, 1, 1,
0.6957473, -1.264436, 1.717996, 0, 0, 0, 1, 1,
0.6965911, 0.3207019, 0.8539437, 0, 0, 0, 1, 1,
0.6980258, -0.5882851, 2.944514, 0, 0, 0, 1, 1,
0.7034125, -0.2319552, 1.254722, 0, 0, 0, 1, 1,
0.7070736, -0.4435794, 3.344305, 0, 0, 0, 1, 1,
0.7105467, -1.064031, 3.638586, 1, 1, 1, 1, 1,
0.7127086, -0.1237241, 3.987937, 1, 1, 1, 1, 1,
0.7134081, -0.6165676, 3.338234, 1, 1, 1, 1, 1,
0.7208362, 0.6484308, 0.7202513, 1, 1, 1, 1, 1,
0.72186, -1.144474, 1.089949, 1, 1, 1, 1, 1,
0.7220211, 0.2453032, 3.02252, 1, 1, 1, 1, 1,
0.7226053, -0.7984961, 2.960523, 1, 1, 1, 1, 1,
0.7265438, -0.3035287, 2.252447, 1, 1, 1, 1, 1,
0.7304552, -0.2074177, 2.243849, 1, 1, 1, 1, 1,
0.7333075, -0.8125007, 1.751344, 1, 1, 1, 1, 1,
0.7407401, 0.671785, 0.996276, 1, 1, 1, 1, 1,
0.7472691, 1.465405, 1.115805, 1, 1, 1, 1, 1,
0.7540701, -0.765004, 2.649015, 1, 1, 1, 1, 1,
0.7569246, -1.275984, 2.329393, 1, 1, 1, 1, 1,
0.7600384, 0.5382251, 1.617772, 1, 1, 1, 1, 1,
0.7637462, -1.668577, 3.418038, 0, 0, 1, 1, 1,
0.7660291, -0.9114675, 0.8385384, 1, 0, 0, 1, 1,
0.7679575, 1.296169, 0.06301742, 1, 0, 0, 1, 1,
0.7691836, 0.6918948, 0.261485, 1, 0, 0, 1, 1,
0.7713764, -0.04718062, 3.870952, 1, 0, 0, 1, 1,
0.7803959, 0.2484889, 1.639177, 1, 0, 0, 1, 1,
0.791761, -0.449464, 3.719149, 0, 0, 0, 1, 1,
0.7929125, 0.6089129, 2.328028, 0, 0, 0, 1, 1,
0.7970498, -0.2970597, 2.342884, 0, 0, 0, 1, 1,
0.8084295, 1.960459, 0.7395737, 0, 0, 0, 1, 1,
0.8123673, -0.5489557, 0.7754793, 0, 0, 0, 1, 1,
0.8135667, 0.6384022, 1.245981, 0, 0, 0, 1, 1,
0.8148229, 0.7639843, 1.275591, 0, 0, 0, 1, 1,
0.8222789, -0.6292558, 2.701455, 1, 1, 1, 1, 1,
0.8250729, -0.01161246, 1.988823, 1, 1, 1, 1, 1,
0.8269425, -2.233627, 3.827551, 1, 1, 1, 1, 1,
0.8315597, -1.758809, 3.572585, 1, 1, 1, 1, 1,
0.8441426, -0.5473216, 2.092336, 1, 1, 1, 1, 1,
0.8446599, 2.484278, -1.277955, 1, 1, 1, 1, 1,
0.8479525, 0.8720245, 0.6152318, 1, 1, 1, 1, 1,
0.8485286, -0.7713394, 3.620008, 1, 1, 1, 1, 1,
0.856895, -0.07378978, 1.778637, 1, 1, 1, 1, 1,
0.8576329, -0.4897522, 3.274213, 1, 1, 1, 1, 1,
0.8579068, 0.3241213, 0.383526, 1, 1, 1, 1, 1,
0.8617893, 0.8881441, 2.955028, 1, 1, 1, 1, 1,
0.8672462, 1.281191, -0.1306021, 1, 1, 1, 1, 1,
0.8807862, 0.7186694, -1.355116, 1, 1, 1, 1, 1,
0.8843651, 1.958865, 1.111836, 1, 1, 1, 1, 1,
0.8972517, -1.873614, 2.194315, 0, 0, 1, 1, 1,
0.9196659, 0.6434878, 0.6252035, 1, 0, 0, 1, 1,
0.92147, -1.412584, 0.8807166, 1, 0, 0, 1, 1,
0.9228547, -1.791929, 3.72803, 1, 0, 0, 1, 1,
0.9228631, -0.301918, 2.043726, 1, 0, 0, 1, 1,
0.926557, -0.2787558, 3.316221, 1, 0, 0, 1, 1,
0.9345015, -0.4034231, 1.839818, 0, 0, 0, 1, 1,
0.9437091, 1.53037, 0.2596679, 0, 0, 0, 1, 1,
0.9438984, 0.5852696, -0.09906696, 0, 0, 0, 1, 1,
0.9468335, -1.052689, 4.239839, 0, 0, 0, 1, 1,
0.9505401, -0.9622318, 1.828764, 0, 0, 0, 1, 1,
0.9530659, -0.1750129, 1.307392, 0, 0, 0, 1, 1,
0.9598714, -2.608893, 2.950743, 0, 0, 0, 1, 1,
0.9602577, 1.247981, 0.2551863, 1, 1, 1, 1, 1,
0.9616362, 0.3491066, 1.790886, 1, 1, 1, 1, 1,
0.9657076, -0.46006, 0.7766387, 1, 1, 1, 1, 1,
0.9658946, 0.5625101, 0.1838496, 1, 1, 1, 1, 1,
0.9693164, 0.3187327, 2.059127, 1, 1, 1, 1, 1,
0.9721861, -0.7798817, 1.436998, 1, 1, 1, 1, 1,
0.9744495, -1.421528, 1.904534, 1, 1, 1, 1, 1,
0.9775519, -0.8656296, 1.413157, 1, 1, 1, 1, 1,
0.9870899, 0.8251173, 1.201019, 1, 1, 1, 1, 1,
0.9971473, 0.2482506, -0.04606611, 1, 1, 1, 1, 1,
0.9980388, 0.02900905, 2.598655, 1, 1, 1, 1, 1,
1.002398, 1.206726, 1.597587, 1, 1, 1, 1, 1,
1.011851, 0.4495958, -1.757255, 1, 1, 1, 1, 1,
1.012323, 1.212259, 0.6132721, 1, 1, 1, 1, 1,
1.015746, -2.306695, 2.637377, 1, 1, 1, 1, 1,
1.02389, 0.9067118, -0.7716129, 0, 0, 1, 1, 1,
1.024157, 1.167821, 2.230169, 1, 0, 0, 1, 1,
1.025348, 2.046897, 0.4618907, 1, 0, 0, 1, 1,
1.059024, 0.2059213, 0.4950108, 1, 0, 0, 1, 1,
1.063619, -0.2389454, 0.2047639, 1, 0, 0, 1, 1,
1.070134, 1.582495, 0.6946938, 1, 0, 0, 1, 1,
1.071798, 1.357069, 0.8363364, 0, 0, 0, 1, 1,
1.079857, 0.7682447, -1.115578, 0, 0, 0, 1, 1,
1.082245, 1.371593, -0.1033868, 0, 0, 0, 1, 1,
1.082432, -0.2862565, 1.647624, 0, 0, 0, 1, 1,
1.09076, 0.4123055, 0.6760055, 0, 0, 0, 1, 1,
1.091733, -1.224735, 1.62811, 0, 0, 0, 1, 1,
1.095416, -0.1091343, 0.945316, 0, 0, 0, 1, 1,
1.096107, -0.01308396, 1.124522, 1, 1, 1, 1, 1,
1.099469, -0.3258298, -0.3878869, 1, 1, 1, 1, 1,
1.107601, -0.7222623, 2.055066, 1, 1, 1, 1, 1,
1.117587, -2.079028, 4.759707, 1, 1, 1, 1, 1,
1.118567, -1.09287, 3.568845, 1, 1, 1, 1, 1,
1.125839, -1.358598, 3.364451, 1, 1, 1, 1, 1,
1.126151, 0.09544735, 2.098209, 1, 1, 1, 1, 1,
1.126328, 0.2868637, -0.2594688, 1, 1, 1, 1, 1,
1.141091, -1.082672, 2.832607, 1, 1, 1, 1, 1,
1.150588, -0.8915638, 2.342554, 1, 1, 1, 1, 1,
1.15229, 0.7075077, 0.5168827, 1, 1, 1, 1, 1,
1.15759, -0.5248092, 2.125908, 1, 1, 1, 1, 1,
1.159361, 1.329664, -0.8891986, 1, 1, 1, 1, 1,
1.159689, 0.204762, 0.5912428, 1, 1, 1, 1, 1,
1.159935, 1.050609, 1.080302, 1, 1, 1, 1, 1,
1.164395, 0.7025638, 0.633269, 0, 0, 1, 1, 1,
1.166062, 0.1650786, -0.477858, 1, 0, 0, 1, 1,
1.168406, 0.01457097, 0.269472, 1, 0, 0, 1, 1,
1.178613, -1.178505, 1.305382, 1, 0, 0, 1, 1,
1.184858, 0.1746241, 0.5529774, 1, 0, 0, 1, 1,
1.191938, -1.17843, 1.255322, 1, 0, 0, 1, 1,
1.192247, 0.6638944, -0.1680259, 0, 0, 0, 1, 1,
1.192368, -0.01578212, -0.307259, 0, 0, 0, 1, 1,
1.199682, 0.7769261, -0.02677544, 0, 0, 0, 1, 1,
1.202431, -1.072531, 4.583001, 0, 0, 0, 1, 1,
1.20445, -1.736612, 3.146425, 0, 0, 0, 1, 1,
1.220582, -1.746394, 3.587405, 0, 0, 0, 1, 1,
1.221253, 0.3451625, 0.9733133, 0, 0, 0, 1, 1,
1.22208, 0.4944076, 0.8915877, 1, 1, 1, 1, 1,
1.223882, -0.1009008, 1.137096, 1, 1, 1, 1, 1,
1.227049, 1.12559, 1.394655, 1, 1, 1, 1, 1,
1.228538, -1.841317, 3.331775, 1, 1, 1, 1, 1,
1.24251, -0.4663312, 0.6311423, 1, 1, 1, 1, 1,
1.248024, 0.4832351, 0.3236133, 1, 1, 1, 1, 1,
1.250823, -0.01661838, 2.020438, 1, 1, 1, 1, 1,
1.254852, 0.08119853, 1.416267, 1, 1, 1, 1, 1,
1.256904, 0.3423522, 1.386568, 1, 1, 1, 1, 1,
1.257833, 1.298813, 1.312414, 1, 1, 1, 1, 1,
1.267872, 0.4651306, -0.7388098, 1, 1, 1, 1, 1,
1.276268, -0.6659974, 1.628319, 1, 1, 1, 1, 1,
1.290322, 1.444865, 0.2682908, 1, 1, 1, 1, 1,
1.299436, -0.8433935, 4.043335, 1, 1, 1, 1, 1,
1.303455, -0.3178628, 2.656857, 1, 1, 1, 1, 1,
1.308917, -1.119583, 3.638842, 0, 0, 1, 1, 1,
1.309823, 0.3627727, 2.700435, 1, 0, 0, 1, 1,
1.312659, -0.6267244, 3.627587, 1, 0, 0, 1, 1,
1.319131, 1.496209, -0.3409647, 1, 0, 0, 1, 1,
1.32343, -0.48398, 2.648033, 1, 0, 0, 1, 1,
1.323922, 0.02346433, 1.860182, 1, 0, 0, 1, 1,
1.324916, -0.9705615, 0.7783766, 0, 0, 0, 1, 1,
1.343565, -1.613468, 2.681324, 0, 0, 0, 1, 1,
1.34481, 0.4983853, 1.369328, 0, 0, 0, 1, 1,
1.358107, 0.01817391, 0.1553281, 0, 0, 0, 1, 1,
1.404325, -1.074914, 1.527371, 0, 0, 0, 1, 1,
1.420887, -0.4356791, 3.482888, 0, 0, 0, 1, 1,
1.431757, -1.178394, 0.8925283, 0, 0, 0, 1, 1,
1.446447, 0.32831, 0.1237474, 1, 1, 1, 1, 1,
1.44811, -0.1256139, 1.951053, 1, 1, 1, 1, 1,
1.452011, -0.02415495, 1.69063, 1, 1, 1, 1, 1,
1.457736, -0.6732605, 1.993893, 1, 1, 1, 1, 1,
1.458816, 0.01060263, -0.4581811, 1, 1, 1, 1, 1,
1.461767, -0.4777325, 1.036248, 1, 1, 1, 1, 1,
1.468963, -1.790235, 2.944408, 1, 1, 1, 1, 1,
1.479317, 0.3892303, -0.4104382, 1, 1, 1, 1, 1,
1.48388, -0.953764, 3.343518, 1, 1, 1, 1, 1,
1.490124, 0.08010331, 2.737935, 1, 1, 1, 1, 1,
1.494512, 0.8220772, -0.4437202, 1, 1, 1, 1, 1,
1.496351, -0.9993521, 1.21998, 1, 1, 1, 1, 1,
1.503267, 0.5573702, 0.1417683, 1, 1, 1, 1, 1,
1.503268, -0.8615125, 1.183877, 1, 1, 1, 1, 1,
1.504864, -1.158608, 2.841129, 1, 1, 1, 1, 1,
1.509656, -0.2286631, 2.760802, 0, 0, 1, 1, 1,
1.51499, -1.344286, 1.903194, 1, 0, 0, 1, 1,
1.52428, -0.9059212, 3.683347, 1, 0, 0, 1, 1,
1.526258, 0.09795725, 1.087251, 1, 0, 0, 1, 1,
1.528539, -0.9243884, 1.654643, 1, 0, 0, 1, 1,
1.532104, 0.6419644, 1.44433, 1, 0, 0, 1, 1,
1.542803, -0.7525889, 2.140995, 0, 0, 0, 1, 1,
1.559742, 0.3064392, 1.826741, 0, 0, 0, 1, 1,
1.560827, -0.3134232, 2.226066, 0, 0, 0, 1, 1,
1.563199, -0.5450997, 0.7572225, 0, 0, 0, 1, 1,
1.564196, 0.4087393, 2.096947, 0, 0, 0, 1, 1,
1.56433, -1.567873, 2.87843, 0, 0, 0, 1, 1,
1.575937, 0.201325, 0.9019409, 0, 0, 0, 1, 1,
1.583718, -0.7951612, 2.066269, 1, 1, 1, 1, 1,
1.59624, -0.5171522, 3.201167, 1, 1, 1, 1, 1,
1.645589, -0.4484022, 1.027564, 1, 1, 1, 1, 1,
1.656758, -0.1528626, 1.334447, 1, 1, 1, 1, 1,
1.657658, -0.6697274, 1.010024, 1, 1, 1, 1, 1,
1.664897, 0.9667677, 0.9308415, 1, 1, 1, 1, 1,
1.666645, -0.8200268, 1.885796, 1, 1, 1, 1, 1,
1.672159, 0.2009336, 1.31737, 1, 1, 1, 1, 1,
1.684317, 0.6496072, 0.1751705, 1, 1, 1, 1, 1,
1.694327, 0.8577752, 1.2314, 1, 1, 1, 1, 1,
1.696643, 0.5391433, 1.48921, 1, 1, 1, 1, 1,
1.697296, 0.5452944, 2.475506, 1, 1, 1, 1, 1,
1.701685, 0.9033497, -0.1091441, 1, 1, 1, 1, 1,
1.717602, 0.08109695, 1.313083, 1, 1, 1, 1, 1,
1.722374, 1.826337, 0.9994107, 1, 1, 1, 1, 1,
1.729267, 0.5678937, 2.959172, 0, 0, 1, 1, 1,
1.731891, 0.5362043, 0.904227, 1, 0, 0, 1, 1,
1.735848, 0.6920241, 1.490554, 1, 0, 0, 1, 1,
1.740383, -0.544656, 2.668532, 1, 0, 0, 1, 1,
1.741189, -0.6831921, 1.482358, 1, 0, 0, 1, 1,
1.748164, -0.5588592, 1.335643, 1, 0, 0, 1, 1,
1.821708, 1.239112, 1.706449, 0, 0, 0, 1, 1,
1.824899, -1.333353, 1.954189, 0, 0, 0, 1, 1,
1.833087, 1.250409, 1.207828, 0, 0, 0, 1, 1,
1.83409, -1.033667, 1.5842, 0, 0, 0, 1, 1,
1.83619, 0.401777, 1.996364, 0, 0, 0, 1, 1,
1.847817, 0.719665, 0.8022773, 0, 0, 0, 1, 1,
1.851846, -1.15652, 1.835641, 0, 0, 0, 1, 1,
1.85443, -2.422219, 3.148902, 1, 1, 1, 1, 1,
1.861498, 0.1093168, 2.248696, 1, 1, 1, 1, 1,
1.861721, -0.1250045, 2.569958, 1, 1, 1, 1, 1,
1.865569, 0.05748418, 0.04452517, 1, 1, 1, 1, 1,
1.872507, 2.516909, -0.1245636, 1, 1, 1, 1, 1,
1.900554, 1.030288, 1.060906, 1, 1, 1, 1, 1,
1.903684, 0.1667456, 0.8798849, 1, 1, 1, 1, 1,
1.905908, -0.1320908, 2.497386, 1, 1, 1, 1, 1,
1.909659, -1.093627, 1.629941, 1, 1, 1, 1, 1,
1.931886, -1.25567, 2.01895, 1, 1, 1, 1, 1,
1.961794, -0.9035259, 0.7896022, 1, 1, 1, 1, 1,
1.986457, 1.588258, 0.4096501, 1, 1, 1, 1, 1,
1.998491, -0.185759, 0.2058454, 1, 1, 1, 1, 1,
2.005563, -0.1475081, 2.226603, 1, 1, 1, 1, 1,
2.006591, -0.2507367, 1.834016, 1, 1, 1, 1, 1,
2.052387, 0.1565656, 0.3863226, 0, 0, 1, 1, 1,
2.062113, 0.3330966, 2.914592, 1, 0, 0, 1, 1,
2.068254, -0.4408326, 1.868508, 1, 0, 0, 1, 1,
2.07465, 0.3060636, 2.318875, 1, 0, 0, 1, 1,
2.105131, -1.445163, 3.115904, 1, 0, 0, 1, 1,
2.142957, -0.8206744, 1.614927, 1, 0, 0, 1, 1,
2.162682, 0.5013891, 2.502075, 0, 0, 0, 1, 1,
2.183887, 0.6774121, 0.8607794, 0, 0, 0, 1, 1,
2.227029, 0.5709894, 2.470716, 0, 0, 0, 1, 1,
2.228436, -1.322418, 2.899226, 0, 0, 0, 1, 1,
2.229672, 1.011309, 2.750397, 0, 0, 0, 1, 1,
2.239632, -0.9164344, 0.6274223, 0, 0, 0, 1, 1,
2.28368, 0.4814655, 2.669454, 0, 0, 0, 1, 1,
2.352148, -0.3614931, 1.603287, 1, 1, 1, 1, 1,
2.369691, 0.2077257, -0.1048205, 1, 1, 1, 1, 1,
2.41195, -0.04427511, 1.957421, 1, 1, 1, 1, 1,
2.467023, 0.6157147, -1.086389, 1, 1, 1, 1, 1,
2.795515, -0.8689302, 0.9752714, 1, 1, 1, 1, 1,
3.10492, -0.9144321, -0.0708271, 1, 1, 1, 1, 1,
3.231289, 1.450272, 0.6349517, 1, 1, 1, 1, 1
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
var radius = 9.790823;
var distance = 34.38985;
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
mvMatrix.translate( 0.03274322, 0.03944159, -0.1650059 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38985);
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