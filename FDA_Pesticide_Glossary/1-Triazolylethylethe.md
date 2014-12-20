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
-2.916792, 0.8554116, -1.132273, 1, 0, 0, 1,
-2.724889, -1.568989, -4.324907, 1, 0.007843138, 0, 1,
-2.624774, -0.2885586, -1.425986, 1, 0.01176471, 0, 1,
-2.566068, 0.2141798, -1.778765, 1, 0.01960784, 0, 1,
-2.53565, 0.3330445, -2.080169, 1, 0.02352941, 0, 1,
-2.403016, 0.8033728, -0.2068715, 1, 0.03137255, 0, 1,
-2.330601, -1.495551, -0.03853169, 1, 0.03529412, 0, 1,
-2.165679, 1.499771, -1.168261, 1, 0.04313726, 0, 1,
-2.140326, -0.3279675, -2.618032, 1, 0.04705882, 0, 1,
-2.114271, -0.1236111, -2.342729, 1, 0.05490196, 0, 1,
-2.097587, -1.227115, -2.217566, 1, 0.05882353, 0, 1,
-2.06647, -0.03782839, -1.509754, 1, 0.06666667, 0, 1,
-2.053321, -1.633062, -1.522373, 1, 0.07058824, 0, 1,
-2.045904, 0.06225602, -1.001255, 1, 0.07843138, 0, 1,
-2.037251, 0.7837145, -0.3642839, 1, 0.08235294, 0, 1,
-2.024222, -0.3981164, -2.523256, 1, 0.09019608, 0, 1,
-2.01194, -0.4003105, -1.004163, 1, 0.09411765, 0, 1,
-2.011569, -0.003460862, -2.01141, 1, 0.1019608, 0, 1,
-2.009846, 0.6089112, -2.045532, 1, 0.1098039, 0, 1,
-1.959443, -0.5089023, -0.4229462, 1, 0.1137255, 0, 1,
-1.932924, -0.3313599, -1.981105, 1, 0.1215686, 0, 1,
-1.915489, 0.01850368, -2.47509, 1, 0.1254902, 0, 1,
-1.848299, -1.318424, -2.997866, 1, 0.1333333, 0, 1,
-1.838789, 0.7434683, -1.748318, 1, 0.1372549, 0, 1,
-1.826693, -1.71317, -1.194748, 1, 0.145098, 0, 1,
-1.825281, -1.168963, -2.742831, 1, 0.1490196, 0, 1,
-1.808759, 0.4538225, -0.6331249, 1, 0.1568628, 0, 1,
-1.796319, -0.8769754, -0.8610735, 1, 0.1607843, 0, 1,
-1.789111, 0.5284525, -2.061653, 1, 0.1686275, 0, 1,
-1.783293, -2.130573, -2.818042, 1, 0.172549, 0, 1,
-1.77736, 0.5809108, -1.517796, 1, 0.1803922, 0, 1,
-1.765546, 0.01253653, -3.135643, 1, 0.1843137, 0, 1,
-1.762283, 0.1145815, -1.648369, 1, 0.1921569, 0, 1,
-1.755982, 0.1096153, -1.417111, 1, 0.1960784, 0, 1,
-1.749533, 0.4039776, -1.200468, 1, 0.2039216, 0, 1,
-1.748379, -0.2511047, -0.9400848, 1, 0.2117647, 0, 1,
-1.745926, 1.976286, -1.869381, 1, 0.2156863, 0, 1,
-1.735963, -1.890344, -2.92067, 1, 0.2235294, 0, 1,
-1.684502, -1.323311, -1.213511, 1, 0.227451, 0, 1,
-1.649366, 0.9739828, -1.278173, 1, 0.2352941, 0, 1,
-1.643554, 1.532261, 0.01269291, 1, 0.2392157, 0, 1,
-1.623151, 1.228965, -1.662298, 1, 0.2470588, 0, 1,
-1.611648, 0.07957058, -1.164824, 1, 0.2509804, 0, 1,
-1.610389, -0.1876735, -2.222688, 1, 0.2588235, 0, 1,
-1.596023, -0.2408031, 0.1706275, 1, 0.2627451, 0, 1,
-1.595713, 0.4068503, -2.371879, 1, 0.2705882, 0, 1,
-1.588861, -0.1777235, -1.682303, 1, 0.2745098, 0, 1,
-1.57523, -0.8126497, -1.045002, 1, 0.282353, 0, 1,
-1.566401, -1.151801, -0.4998986, 1, 0.2862745, 0, 1,
-1.546725, 0.7288873, -0.135517, 1, 0.2941177, 0, 1,
-1.533109, -0.7736027, -3.800823, 1, 0.3019608, 0, 1,
-1.532974, -0.369994, -1.82929, 1, 0.3058824, 0, 1,
-1.522273, -0.5055303, -2.892833, 1, 0.3137255, 0, 1,
-1.50935, -0.4499744, -0.8407578, 1, 0.3176471, 0, 1,
-1.503176, -2.720421, -2.924375, 1, 0.3254902, 0, 1,
-1.488101, -0.5415885, -2.971627, 1, 0.3294118, 0, 1,
-1.487127, -1.674518, -4.0846, 1, 0.3372549, 0, 1,
-1.467497, -2.736286, -2.551795, 1, 0.3411765, 0, 1,
-1.46567, 1.10259, 0.5880464, 1, 0.3490196, 0, 1,
-1.459586, 0.08371548, -3.69875, 1, 0.3529412, 0, 1,
-1.437039, -1.385479, -2.812524, 1, 0.3607843, 0, 1,
-1.433918, 0.4430361, -1.477855, 1, 0.3647059, 0, 1,
-1.416504, 1.704343, -0.9778986, 1, 0.372549, 0, 1,
-1.414456, -0.8411638, -2.383311, 1, 0.3764706, 0, 1,
-1.412752, 0.1386409, -0.2797086, 1, 0.3843137, 0, 1,
-1.412473, 0.2142523, -1.923072, 1, 0.3882353, 0, 1,
-1.407924, 1.179967, -1.620925, 1, 0.3960784, 0, 1,
-1.39897, -0.946746, -3.909574, 1, 0.4039216, 0, 1,
-1.388495, 1.757901, -0.5928185, 1, 0.4078431, 0, 1,
-1.376141, 1.404468, -0.08568115, 1, 0.4156863, 0, 1,
-1.357939, 1.548525, -0.8580331, 1, 0.4196078, 0, 1,
-1.357099, 0.0902463, -0.8898586, 1, 0.427451, 0, 1,
-1.350908, -1.367591, -1.763962, 1, 0.4313726, 0, 1,
-1.343536, 0.5227708, -0.667883, 1, 0.4392157, 0, 1,
-1.338779, 0.6327947, -2.711011, 1, 0.4431373, 0, 1,
-1.32304, -1.618912, -3.565198, 1, 0.4509804, 0, 1,
-1.320869, 0.6369528, 0.09303928, 1, 0.454902, 0, 1,
-1.311915, -1.117401, -2.006788, 1, 0.4627451, 0, 1,
-1.307019, -0.5745062, -1.02144, 1, 0.4666667, 0, 1,
-1.296735, -0.3169378, -1.823586, 1, 0.4745098, 0, 1,
-1.291173, 0.5352891, -0.8257566, 1, 0.4784314, 0, 1,
-1.29033, 1.0763, -0.234263, 1, 0.4862745, 0, 1,
-1.278622, 0.7727846, -0.4322856, 1, 0.4901961, 0, 1,
-1.27563, -0.823184, -0.9073693, 1, 0.4980392, 0, 1,
-1.275478, -0.5607886, -3.716533, 1, 0.5058824, 0, 1,
-1.274742, -0.2980317, -3.76842, 1, 0.509804, 0, 1,
-1.274484, -0.2943909, -0.2171727, 1, 0.5176471, 0, 1,
-1.270538, 0.9775968, 0.7965459, 1, 0.5215687, 0, 1,
-1.270521, -1.791971, -4.099847, 1, 0.5294118, 0, 1,
-1.26984, -0.3119356, -1.018427, 1, 0.5333334, 0, 1,
-1.264578, -0.02718964, -3.087687, 1, 0.5411765, 0, 1,
-1.262347, -1.227477, -2.445463, 1, 0.5450981, 0, 1,
-1.236223, -1.309218, -1.440273, 1, 0.5529412, 0, 1,
-1.228417, -0.9122244, -0.7571825, 1, 0.5568628, 0, 1,
-1.216138, -0.824012, -3.90647, 1, 0.5647059, 0, 1,
-1.207829, 0.5458613, -1.786884, 1, 0.5686275, 0, 1,
-1.202856, -0.7001619, -1.970909, 1, 0.5764706, 0, 1,
-1.183938, -0.7087615, -2.123906, 1, 0.5803922, 0, 1,
-1.182331, -0.6239095, -1.974096, 1, 0.5882353, 0, 1,
-1.181243, 1.592954, 2.764517, 1, 0.5921569, 0, 1,
-1.180986, -0.2457382, 0.2505412, 1, 0.6, 0, 1,
-1.175511, 2.132389, -1.273677, 1, 0.6078432, 0, 1,
-1.158019, 0.1110221, -2.192496, 1, 0.6117647, 0, 1,
-1.154112, -1.274953, -0.7837349, 1, 0.6196079, 0, 1,
-1.147499, 1.009851, -0.9486626, 1, 0.6235294, 0, 1,
-1.141799, 1.136138, -2.210005, 1, 0.6313726, 0, 1,
-1.127968, -2.385684, -3.694804, 1, 0.6352941, 0, 1,
-1.127105, 0.441253, -0.1349642, 1, 0.6431373, 0, 1,
-1.111562, 0.6289477, 0.2461222, 1, 0.6470588, 0, 1,
-1.108655, -0.3390235, -3.020823, 1, 0.654902, 0, 1,
-1.102919, -0.382219, -3.02781, 1, 0.6588235, 0, 1,
-1.101419, -1.218487, -3.146178, 1, 0.6666667, 0, 1,
-1.093898, -1.281184, -2.79402, 1, 0.6705883, 0, 1,
-1.068689, 0.58582, -0.7939802, 1, 0.6784314, 0, 1,
-1.063572, 0.8589961, -0.1234169, 1, 0.682353, 0, 1,
-1.051933, 0.2750281, -2.566073, 1, 0.6901961, 0, 1,
-1.045642, -0.1192145, -1.278328, 1, 0.6941177, 0, 1,
-1.042035, 0.1790371, -2.047358, 1, 0.7019608, 0, 1,
-1.040708, 0.3006716, -1.53461, 1, 0.7098039, 0, 1,
-1.038806, 0.4682801, -2.603307, 1, 0.7137255, 0, 1,
-1.036526, 0.05916663, 0.1011094, 1, 0.7215686, 0, 1,
-1.033541, -1.262705, -2.939251, 1, 0.7254902, 0, 1,
-1.033427, 0.8645517, -0.6750551, 1, 0.7333333, 0, 1,
-1.032823, -0.6648712, -1.52107, 1, 0.7372549, 0, 1,
-1.018968, -0.8148172, -2.645111, 1, 0.7450981, 0, 1,
-1.012887, -0.7319617, -3.44185, 1, 0.7490196, 0, 1,
-1.003407, 0.9882636, 0.2427918, 1, 0.7568628, 0, 1,
-0.9920182, 3.812755, 1.441135, 1, 0.7607843, 0, 1,
-0.9898816, -2.413323, -3.43437, 1, 0.7686275, 0, 1,
-0.9854875, -2.732719, -1.327932, 1, 0.772549, 0, 1,
-0.9829974, 0.4451948, -0.5793915, 1, 0.7803922, 0, 1,
-0.9765323, 0.06042697, -2.759881, 1, 0.7843137, 0, 1,
-0.97535, 1.130147, -0.5155962, 1, 0.7921569, 0, 1,
-0.974496, -0.994467, -1.982502, 1, 0.7960784, 0, 1,
-0.9710547, -0.5988468, -2.773436, 1, 0.8039216, 0, 1,
-0.9624367, 1.007865, -1.580702, 1, 0.8117647, 0, 1,
-0.9615048, 1.622307, -0.2953151, 1, 0.8156863, 0, 1,
-0.955817, 0.05336479, -2.139519, 1, 0.8235294, 0, 1,
-0.9540878, 1.144825, -1.316119, 1, 0.827451, 0, 1,
-0.9524778, 1.445541, -1.702126, 1, 0.8352941, 0, 1,
-0.9494599, 1.539489, -0.8073897, 1, 0.8392157, 0, 1,
-0.9470516, 0.942421, -0.9408549, 1, 0.8470588, 0, 1,
-0.9441543, -1.473635, -1.532747, 1, 0.8509804, 0, 1,
-0.9436122, -1.514332, -2.699042, 1, 0.8588235, 0, 1,
-0.9310183, 0.8081514, -0.2713758, 1, 0.8627451, 0, 1,
-0.9198769, -1.248631, -3.054675, 1, 0.8705882, 0, 1,
-0.9192226, -0.704587, -2.530916, 1, 0.8745098, 0, 1,
-0.9187151, -0.04548134, -0.5138827, 1, 0.8823529, 0, 1,
-0.9076584, 0.662456, -2.487993, 1, 0.8862745, 0, 1,
-0.9052829, -0.1661529, -2.810199, 1, 0.8941177, 0, 1,
-0.905167, -0.1053209, -1.062651, 1, 0.8980392, 0, 1,
-0.8984411, -0.7154672, -1.201634, 1, 0.9058824, 0, 1,
-0.8945656, 0.3426939, -2.706196, 1, 0.9137255, 0, 1,
-0.8924326, -0.3929486, -0.5801288, 1, 0.9176471, 0, 1,
-0.8903363, 0.61555, -1.783778, 1, 0.9254902, 0, 1,
-0.8886507, 2.146051, -0.3189214, 1, 0.9294118, 0, 1,
-0.8882436, 0.07703666, -1.253381, 1, 0.9372549, 0, 1,
-0.8858257, 0.4996697, -0.7303538, 1, 0.9411765, 0, 1,
-0.8851463, -2.561895, -2.279548, 1, 0.9490196, 0, 1,
-0.8830472, 0.01375366, -2.875158, 1, 0.9529412, 0, 1,
-0.8751559, 1.530441, -0.2242845, 1, 0.9607843, 0, 1,
-0.8698628, 0.8002117, -1.108677, 1, 0.9647059, 0, 1,
-0.8657857, 0.02584669, -2.142912, 1, 0.972549, 0, 1,
-0.8606107, -0.630609, -2.592131, 1, 0.9764706, 0, 1,
-0.8589883, -0.3749098, -1.996915, 1, 0.9843137, 0, 1,
-0.8573084, 0.09301626, -3.092088, 1, 0.9882353, 0, 1,
-0.8508726, -2.104063, -4.445658, 1, 0.9960784, 0, 1,
-0.8463674, -1.119227, -1.137675, 0.9960784, 1, 0, 1,
-0.8453476, -0.6983274, -2.881678, 0.9921569, 1, 0, 1,
-0.8445161, -1.370199, -3.510531, 0.9843137, 1, 0, 1,
-0.8393982, 0.169454, 0.05491, 0.9803922, 1, 0, 1,
-0.830909, -0.2458604, -1.642744, 0.972549, 1, 0, 1,
-0.8305625, -0.665715, -1.977615, 0.9686275, 1, 0, 1,
-0.8245239, 0.6404374, -2.628838, 0.9607843, 1, 0, 1,
-0.8187525, -0.9180928, -2.797612, 0.9568627, 1, 0, 1,
-0.8184238, -1.029755, -2.381901, 0.9490196, 1, 0, 1,
-0.8174559, -0.9847258, -2.30567, 0.945098, 1, 0, 1,
-0.8143378, -0.4261917, -3.506334, 0.9372549, 1, 0, 1,
-0.8014528, 2.022019, -0.9940397, 0.9333333, 1, 0, 1,
-0.8006821, 1.172319, -0.3633198, 0.9254902, 1, 0, 1,
-0.799362, 0.8080943, -0.4417033, 0.9215686, 1, 0, 1,
-0.7975705, -0.2322895, -2.285391, 0.9137255, 1, 0, 1,
-0.7952218, 1.002272, 0.595503, 0.9098039, 1, 0, 1,
-0.7892854, -0.8455761, -3.798728, 0.9019608, 1, 0, 1,
-0.7833877, -0.4585222, -2.320038, 0.8941177, 1, 0, 1,
-0.7682105, 0.3556221, 0.5646021, 0.8901961, 1, 0, 1,
-0.7681226, -0.2139675, -1.461442, 0.8823529, 1, 0, 1,
-0.7630442, -0.208771, -3.486366, 0.8784314, 1, 0, 1,
-0.7618772, 1.594683, -0.4555557, 0.8705882, 1, 0, 1,
-0.7597255, 0.8871298, -0.8188671, 0.8666667, 1, 0, 1,
-0.758136, 1.253919, -2.373569, 0.8588235, 1, 0, 1,
-0.7559888, 0.4148411, -1.651469, 0.854902, 1, 0, 1,
-0.7464737, -0.4565126, -3.516056, 0.8470588, 1, 0, 1,
-0.7461752, 1.734891, -1.389789, 0.8431373, 1, 0, 1,
-0.7411805, -0.4189659, -3.647177, 0.8352941, 1, 0, 1,
-0.7408686, -0.9097294, -2.837038, 0.8313726, 1, 0, 1,
-0.7370024, 2.433341, -1.757729, 0.8235294, 1, 0, 1,
-0.7359546, 2.378845, -2.546294, 0.8196079, 1, 0, 1,
-0.7347239, 0.3346083, 0.01719746, 0.8117647, 1, 0, 1,
-0.7342002, -0.2693296, -2.775764, 0.8078431, 1, 0, 1,
-0.7319565, -0.4718991, -2.563479, 0.8, 1, 0, 1,
-0.7298296, 0.5231821, -1.040762, 0.7921569, 1, 0, 1,
-0.7254727, 1.154595, -0.8755179, 0.7882353, 1, 0, 1,
-0.7219126, 0.1021857, 1.550009, 0.7803922, 1, 0, 1,
-0.7215642, -0.6211472, -1.65708, 0.7764706, 1, 0, 1,
-0.7200978, -2.268854, -1.747403, 0.7686275, 1, 0, 1,
-0.7196802, -0.2530399, -1.303281, 0.7647059, 1, 0, 1,
-0.7169091, -0.2681182, -1.048604, 0.7568628, 1, 0, 1,
-0.7083939, -0.01805722, -1.828006, 0.7529412, 1, 0, 1,
-0.7083037, 0.8957976, -0.4890377, 0.7450981, 1, 0, 1,
-0.7080162, -1.837188, -2.444341, 0.7411765, 1, 0, 1,
-0.7064585, 0.3373854, -1.000346, 0.7333333, 1, 0, 1,
-0.7041166, -0.6560871, -3.129028, 0.7294118, 1, 0, 1,
-0.7038293, 1.494912, 0.08005917, 0.7215686, 1, 0, 1,
-0.691796, -1.495585, -3.319699, 0.7176471, 1, 0, 1,
-0.6902491, 0.262185, -2.150953, 0.7098039, 1, 0, 1,
-0.6813035, -0.3609751, -2.446446, 0.7058824, 1, 0, 1,
-0.6698442, 1.345679, 1.293263, 0.6980392, 1, 0, 1,
-0.663621, -0.4769047, -1.453835, 0.6901961, 1, 0, 1,
-0.6477944, -1.856295, -4.765512, 0.6862745, 1, 0, 1,
-0.6474084, 0.9392419, 0.1304982, 0.6784314, 1, 0, 1,
-0.6473132, 1.599156, -0.2176786, 0.6745098, 1, 0, 1,
-0.6380069, 0.3360756, -1.946007, 0.6666667, 1, 0, 1,
-0.6344376, -0.1975029, -2.436814, 0.6627451, 1, 0, 1,
-0.6268005, -0.5293439, -3.777492, 0.654902, 1, 0, 1,
-0.6265082, -1.002705, -4.392192, 0.6509804, 1, 0, 1,
-0.626358, -0.06685209, -1.397439, 0.6431373, 1, 0, 1,
-0.6223441, -0.1579703, -0.4142049, 0.6392157, 1, 0, 1,
-0.6215048, 0.5420409, 1.075527, 0.6313726, 1, 0, 1,
-0.6180775, -0.866729, -2.306585, 0.627451, 1, 0, 1,
-0.6142869, -0.0976613, -1.559108, 0.6196079, 1, 0, 1,
-0.6119729, -0.6991466, -0.8753235, 0.6156863, 1, 0, 1,
-0.6067843, -0.5686044, -3.498506, 0.6078432, 1, 0, 1,
-0.6058047, 0.21178, -2.107252, 0.6039216, 1, 0, 1,
-0.6054531, 1.053203, -1.865019, 0.5960785, 1, 0, 1,
-0.6024522, 0.4400569, -0.2518528, 0.5882353, 1, 0, 1,
-0.6003183, -0.9646807, -2.579841, 0.5843138, 1, 0, 1,
-0.6001515, 0.1459762, -1.843492, 0.5764706, 1, 0, 1,
-0.5965819, 0.4054699, -1.54652, 0.572549, 1, 0, 1,
-0.5883722, 0.7310057, 0.7061375, 0.5647059, 1, 0, 1,
-0.5869778, 0.3578686, 1.321675, 0.5607843, 1, 0, 1,
-0.5852336, 0.1815522, -2.216733, 0.5529412, 1, 0, 1,
-0.5829701, -0.422422, -2.882173, 0.5490196, 1, 0, 1,
-0.5795189, -0.3656099, -1.193589, 0.5411765, 1, 0, 1,
-0.5770493, 0.8738317, 0.1615626, 0.5372549, 1, 0, 1,
-0.5717167, -0.2442939, -0.8550584, 0.5294118, 1, 0, 1,
-0.5705664, -0.5904689, -1.818042, 0.5254902, 1, 0, 1,
-0.57034, 0.498993, -1.545557, 0.5176471, 1, 0, 1,
-0.5657487, 1.104843, 0.04662232, 0.5137255, 1, 0, 1,
-0.5650585, -0.03481876, -2.729226, 0.5058824, 1, 0, 1,
-0.5643229, 1.031555, -1.180264, 0.5019608, 1, 0, 1,
-0.5592922, 0.09948587, -0.8262854, 0.4941176, 1, 0, 1,
-0.5589499, -0.8697453, -0.800647, 0.4862745, 1, 0, 1,
-0.5547783, -1.472315, -3.983088, 0.4823529, 1, 0, 1,
-0.5539246, 0.6451735, -2.442608, 0.4745098, 1, 0, 1,
-0.5534642, -0.2074518, -1.522583, 0.4705882, 1, 0, 1,
-0.5523486, 0.7103385, -1.497789, 0.4627451, 1, 0, 1,
-0.5488224, 0.2801041, -1.771254, 0.4588235, 1, 0, 1,
-0.5451284, -1.761482, -1.805993, 0.4509804, 1, 0, 1,
-0.5395299, -0.3429361, -2.04058, 0.4470588, 1, 0, 1,
-0.5383226, 0.1970876, -1.990545, 0.4392157, 1, 0, 1,
-0.5374191, 0.8693095, 0.0551223, 0.4352941, 1, 0, 1,
-0.5318009, -0.5200337, -2.996372, 0.427451, 1, 0, 1,
-0.5288903, -1.142614, -2.660555, 0.4235294, 1, 0, 1,
-0.5287391, -1.373197, -2.679294, 0.4156863, 1, 0, 1,
-0.5279922, 0.1294594, -1.741298, 0.4117647, 1, 0, 1,
-0.5267639, -0.6220895, -3.188067, 0.4039216, 1, 0, 1,
-0.5265591, 0.503612, -0.05953661, 0.3960784, 1, 0, 1,
-0.5240737, -2.022214, -4.793743, 0.3921569, 1, 0, 1,
-0.5058696, -0.9030023, -2.693747, 0.3843137, 1, 0, 1,
-0.5052443, -0.2225587, -0.8733996, 0.3803922, 1, 0, 1,
-0.5003949, 1.040028, -0.8946868, 0.372549, 1, 0, 1,
-0.4989018, -0.5311755, -3.496549, 0.3686275, 1, 0, 1,
-0.497168, -1.966759, -3.618472, 0.3607843, 1, 0, 1,
-0.4917815, -0.1245799, -1.740631, 0.3568628, 1, 0, 1,
-0.4864539, -0.890348, -3.514123, 0.3490196, 1, 0, 1,
-0.485985, -2.065892, -4.000314, 0.345098, 1, 0, 1,
-0.4815665, 1.964738, -1.412367, 0.3372549, 1, 0, 1,
-0.4793169, 1.583894, -1.53918, 0.3333333, 1, 0, 1,
-0.4775645, -0.7820683, -3.479239, 0.3254902, 1, 0, 1,
-0.4750498, -0.4106416, -1.7916, 0.3215686, 1, 0, 1,
-0.4700219, 0.1538676, 0.04115992, 0.3137255, 1, 0, 1,
-0.4696921, 1.186037, 1.045462, 0.3098039, 1, 0, 1,
-0.4686542, 0.8290275, -1.247446, 0.3019608, 1, 0, 1,
-0.4676619, 0.3938725, -0.468069, 0.2941177, 1, 0, 1,
-0.4664706, 1.223008, 0.6193777, 0.2901961, 1, 0, 1,
-0.4635254, 0.948182, -0.01331907, 0.282353, 1, 0, 1,
-0.4620968, 0.7146221, -1.350073, 0.2784314, 1, 0, 1,
-0.4587111, -1.934798, -3.198826, 0.2705882, 1, 0, 1,
-0.4586372, 0.8600836, -0.92875, 0.2666667, 1, 0, 1,
-0.4569547, -1.509781, -2.501175, 0.2588235, 1, 0, 1,
-0.4486885, -1.833125, -1.935883, 0.254902, 1, 0, 1,
-0.4479564, 1.648332, 0.3902462, 0.2470588, 1, 0, 1,
-0.4422382, -0.7691419, -1.742264, 0.2431373, 1, 0, 1,
-0.4419711, 0.3811501, -0.7200074, 0.2352941, 1, 0, 1,
-0.4373106, -0.2820024, -2.681158, 0.2313726, 1, 0, 1,
-0.4330674, -0.3234374, -4.096653, 0.2235294, 1, 0, 1,
-0.427707, 1.248179, -0.614377, 0.2196078, 1, 0, 1,
-0.4271524, 1.260299, 0.7795388, 0.2117647, 1, 0, 1,
-0.4269368, -0.2894123, -0.9219467, 0.2078431, 1, 0, 1,
-0.4238037, -1.171146, -4.011249, 0.2, 1, 0, 1,
-0.418541, 0.1876107, -0.6811896, 0.1921569, 1, 0, 1,
-0.4176311, 1.182976, 0.1523769, 0.1882353, 1, 0, 1,
-0.4173334, 0.8196734, -1.048146, 0.1803922, 1, 0, 1,
-0.4164508, -0.8161201, -2.719172, 0.1764706, 1, 0, 1,
-0.4126193, 1.305841, -1.404045, 0.1686275, 1, 0, 1,
-0.4125012, -0.7412192, -5.311542, 0.1647059, 1, 0, 1,
-0.410629, 0.1762377, 0.4048868, 0.1568628, 1, 0, 1,
-0.4044501, 1.53416, 0.1980472, 0.1529412, 1, 0, 1,
-0.4030726, -0.1181781, 0.673164, 0.145098, 1, 0, 1,
-0.3996604, 0.1205583, -0.3041346, 0.1411765, 1, 0, 1,
-0.3975695, 1.324551, -0.0278022, 0.1333333, 1, 0, 1,
-0.396945, 0.5012479, -1.940482, 0.1294118, 1, 0, 1,
-0.3957443, 0.4688574, -1.157123, 0.1215686, 1, 0, 1,
-0.3926706, 1.144231, -2.45703, 0.1176471, 1, 0, 1,
-0.3893838, -0.4544908, -2.073795, 0.1098039, 1, 0, 1,
-0.3890975, -1.160583, -2.439118, 0.1058824, 1, 0, 1,
-0.3878827, 0.7567433, -1.263666, 0.09803922, 1, 0, 1,
-0.3858334, 1.462995, 0.08588176, 0.09019608, 1, 0, 1,
-0.3856166, 0.3942045, -0.4061215, 0.08627451, 1, 0, 1,
-0.3840615, -1.198383, -1.683126, 0.07843138, 1, 0, 1,
-0.3793701, 0.5960094, -0.2467012, 0.07450981, 1, 0, 1,
-0.379359, 1.588112, 0.5699648, 0.06666667, 1, 0, 1,
-0.3792903, -0.7280324, -1.956387, 0.0627451, 1, 0, 1,
-0.3786001, 0.9377114, -0.0322914, 0.05490196, 1, 0, 1,
-0.3766043, -1.223231, -2.644838, 0.05098039, 1, 0, 1,
-0.3750479, 0.7093651, -0.5832815, 0.04313726, 1, 0, 1,
-0.3662199, 0.8814828, -0.9205964, 0.03921569, 1, 0, 1,
-0.3604533, -1.558596, -2.613928, 0.03137255, 1, 0, 1,
-0.3596961, 2.031953, -0.7597765, 0.02745098, 1, 0, 1,
-0.3595418, 0.895952, -0.0759209, 0.01960784, 1, 0, 1,
-0.3559244, 0.7694654, 1.151837, 0.01568628, 1, 0, 1,
-0.3556714, -0.006103971, -1.776369, 0.007843138, 1, 0, 1,
-0.3554094, 0.1882132, -2.355176, 0.003921569, 1, 0, 1,
-0.354084, 0.5370511, -0.08615312, 0, 1, 0.003921569, 1,
-0.3536668, 2.450133, -0.3429541, 0, 1, 0.01176471, 1,
-0.3531365, 0.4898946, -0.7437546, 0, 1, 0.01568628, 1,
-0.3500273, -0.4188102, -2.577324, 0, 1, 0.02352941, 1,
-0.3495898, -0.2313955, -3.108483, 0, 1, 0.02745098, 1,
-0.3483735, -1.455657, -3.753271, 0, 1, 0.03529412, 1,
-0.343907, 0.8651489, -2.058547, 0, 1, 0.03921569, 1,
-0.3421414, -1.05527, -4.552261, 0, 1, 0.04705882, 1,
-0.3393149, 0.02454434, -2.301061, 0, 1, 0.05098039, 1,
-0.3376672, 0.8606352, -0.2872919, 0, 1, 0.05882353, 1,
-0.3375093, 0.274422, 0.1759668, 0, 1, 0.0627451, 1,
-0.3349596, -0.1491075, -0.5084969, 0, 1, 0.07058824, 1,
-0.3284056, -0.08099999, -0.99135, 0, 1, 0.07450981, 1,
-0.3282956, -0.617978, -1.449711, 0, 1, 0.08235294, 1,
-0.3223728, 0.9557796, 0.08760248, 0, 1, 0.08627451, 1,
-0.3192788, -0.3274607, -2.14898, 0, 1, 0.09411765, 1,
-0.3107624, -0.001165173, -1.318338, 0, 1, 0.1019608, 1,
-0.3056872, 1.084785, -1.09426, 0, 1, 0.1058824, 1,
-0.3039597, 0.4816209, -0.3371317, 0, 1, 0.1137255, 1,
-0.3015608, -1.229026, -3.091288, 0, 1, 0.1176471, 1,
-0.2983842, -0.379054, -1.23675, 0, 1, 0.1254902, 1,
-0.296546, -0.1748712, -1.558193, 0, 1, 0.1294118, 1,
-0.2962259, -1.167421, -1.796558, 0, 1, 0.1372549, 1,
-0.2945122, 2.558609, -0.6016371, 0, 1, 0.1411765, 1,
-0.2935121, 0.4183816, 0.3739589, 0, 1, 0.1490196, 1,
-0.2933784, -0.7113786, -2.696393, 0, 1, 0.1529412, 1,
-0.2929131, 0.9358791, -1.398133, 0, 1, 0.1607843, 1,
-0.2865222, -0.8433877, -3.365487, 0, 1, 0.1647059, 1,
-0.2864159, 0.553365, -0.9596567, 0, 1, 0.172549, 1,
-0.2857931, 0.7885581, -0.4434357, 0, 1, 0.1764706, 1,
-0.2834591, -0.2092495, -4.451269, 0, 1, 0.1843137, 1,
-0.2809574, -1.338852, -2.509536, 0, 1, 0.1882353, 1,
-0.2809476, -0.4365066, -3.022376, 0, 1, 0.1960784, 1,
-0.2757862, 0.3066552, -2.413613, 0, 1, 0.2039216, 1,
-0.2679874, 0.1265267, 1.112735, 0, 1, 0.2078431, 1,
-0.2667345, 1.971935, -0.852376, 0, 1, 0.2156863, 1,
-0.2640229, 1.85045, 0.7759367, 0, 1, 0.2196078, 1,
-0.2593031, -1.076455, -1.837806, 0, 1, 0.227451, 1,
-0.2579859, -0.5931531, -2.212951, 0, 1, 0.2313726, 1,
-0.2500055, -1.168397, -3.309473, 0, 1, 0.2392157, 1,
-0.2443645, 1.237443, -0.325166, 0, 1, 0.2431373, 1,
-0.2425193, -0.1579329, -4.259919, 0, 1, 0.2509804, 1,
-0.2422529, -0.06071273, -2.618409, 0, 1, 0.254902, 1,
-0.23903, -0.3585276, -1.795043, 0, 1, 0.2627451, 1,
-0.2363934, -0.7993081, -2.516707, 0, 1, 0.2666667, 1,
-0.2359754, -1.919846, -3.179118, 0, 1, 0.2745098, 1,
-0.2351162, -1.081597, -2.037591, 0, 1, 0.2784314, 1,
-0.2350754, 0.4054263, -2.247335, 0, 1, 0.2862745, 1,
-0.234895, 1.904053, -0.04432707, 0, 1, 0.2901961, 1,
-0.2341537, -0.1902181, -2.946474, 0, 1, 0.2980392, 1,
-0.2338752, 0.9056302, 0.8809978, 0, 1, 0.3058824, 1,
-0.2312498, 0.3499831, 1.244147, 0, 1, 0.3098039, 1,
-0.2236637, -0.2951214, -3.385448, 0, 1, 0.3176471, 1,
-0.2235333, -0.3376216, -1.949766, 0, 1, 0.3215686, 1,
-0.2201707, -0.4674908, -4.239316, 0, 1, 0.3294118, 1,
-0.2147488, -0.9158946, -2.387914, 0, 1, 0.3333333, 1,
-0.2125575, -0.05163307, -2.527813, 0, 1, 0.3411765, 1,
-0.2075378, -2.408511, -2.616736, 0, 1, 0.345098, 1,
-0.2066266, -0.4822042, -3.069203, 0, 1, 0.3529412, 1,
-0.2060975, 0.2109583, -1.697322, 0, 1, 0.3568628, 1,
-0.2028952, 0.08067445, -3.182622, 0, 1, 0.3647059, 1,
-0.2002605, -1.101329, -3.584322, 0, 1, 0.3686275, 1,
-0.1988015, -0.4757347, -3.660834, 0, 1, 0.3764706, 1,
-0.1982673, 0.7884261, -1.022281, 0, 1, 0.3803922, 1,
-0.1951278, -0.3295961, -2.124115, 0, 1, 0.3882353, 1,
-0.194851, -0.7075511, -2.394642, 0, 1, 0.3921569, 1,
-0.1896634, -1.711213, -3.07833, 0, 1, 0.4, 1,
-0.1858636, -0.6748681, -2.940627, 0, 1, 0.4078431, 1,
-0.1832489, 0.497759, -2.549762, 0, 1, 0.4117647, 1,
-0.1825938, -1.512259, -2.923575, 0, 1, 0.4196078, 1,
-0.1715427, -0.5225385, -3.855544, 0, 1, 0.4235294, 1,
-0.1654787, 0.4984713, 0.4123104, 0, 1, 0.4313726, 1,
-0.1628712, 0.8166965, 0.05041126, 0, 1, 0.4352941, 1,
-0.1627175, 1.46631, 0.7864325, 0, 1, 0.4431373, 1,
-0.1615586, -0.6412864, -2.248616, 0, 1, 0.4470588, 1,
-0.1578882, -0.1149789, -1.71407, 0, 1, 0.454902, 1,
-0.1561526, -0.554347, -1.6338, 0, 1, 0.4588235, 1,
-0.1501883, -1.115574, -2.981905, 0, 1, 0.4666667, 1,
-0.1480538, -0.3478681, -2.796402, 0, 1, 0.4705882, 1,
-0.1450274, 2.400612, -0.3941926, 0, 1, 0.4784314, 1,
-0.1426407, 0.4624981, -0.7284067, 0, 1, 0.4823529, 1,
-0.1424624, -0.3093039, -3.216969, 0, 1, 0.4901961, 1,
-0.1423413, 1.133875, 0.8293098, 0, 1, 0.4941176, 1,
-0.1369006, -1.464697, -1.816731, 0, 1, 0.5019608, 1,
-0.1342335, 1.118158, -0.4046417, 0, 1, 0.509804, 1,
-0.132572, -0.4854061, -1.91192, 0, 1, 0.5137255, 1,
-0.1310804, -1.755859, -4.157147, 0, 1, 0.5215687, 1,
-0.1299173, 1.269606, 2.348423, 0, 1, 0.5254902, 1,
-0.1264895, -0.7277059, -2.824258, 0, 1, 0.5333334, 1,
-0.1258652, 0.7749425, 0.6818681, 0, 1, 0.5372549, 1,
-0.1240929, 0.7267228, 0.2042655, 0, 1, 0.5450981, 1,
-0.1182862, -0.005792927, -0.1122744, 0, 1, 0.5490196, 1,
-0.1181961, 2.218845, -0.7105058, 0, 1, 0.5568628, 1,
-0.1081494, -0.7327164, -3.387794, 0, 1, 0.5607843, 1,
-0.107888, 0.5603216, -0.6714803, 0, 1, 0.5686275, 1,
-0.1072131, 0.3430082, 1.786301, 0, 1, 0.572549, 1,
-0.1059379, -0.6554068, -1.831899, 0, 1, 0.5803922, 1,
-0.1016457, 2.090953, -0.4496443, 0, 1, 0.5843138, 1,
-0.0995345, 1.200423, -0.2559731, 0, 1, 0.5921569, 1,
-0.09295967, -0.3176816, -1.022541, 0, 1, 0.5960785, 1,
-0.09030871, -1.079292, -3.330811, 0, 1, 0.6039216, 1,
-0.08775984, -2.743728, -3.360765, 0, 1, 0.6117647, 1,
-0.08671752, 0.3995792, 0.1915527, 0, 1, 0.6156863, 1,
-0.0852665, -1.117666, -2.9598, 0, 1, 0.6235294, 1,
-0.0828123, -0.108008, -0.3133862, 0, 1, 0.627451, 1,
-0.08266097, 0.3571503, 2.093311, 0, 1, 0.6352941, 1,
-0.0797716, -0.3756082, -3.222345, 0, 1, 0.6392157, 1,
-0.07628679, 0.9308403, -1.461785, 0, 1, 0.6470588, 1,
-0.07536747, 0.9623291, 1.27791, 0, 1, 0.6509804, 1,
-0.07477471, 1.490219, -0.02065656, 0, 1, 0.6588235, 1,
-0.07378095, 0.1894176, 1.079351, 0, 1, 0.6627451, 1,
-0.07096419, -2.051107, -1.420542, 0, 1, 0.6705883, 1,
-0.06708067, -1.023574, -1.990183, 0, 1, 0.6745098, 1,
-0.06614751, 0.08045162, -1.755769, 0, 1, 0.682353, 1,
-0.06376818, -0.7211744, -2.290832, 0, 1, 0.6862745, 1,
-0.06197738, 0.1181252, 0.205893, 0, 1, 0.6941177, 1,
-0.06184338, -1.079782, -2.140321, 0, 1, 0.7019608, 1,
-0.06135121, -1.058968, -4.177493, 0, 1, 0.7058824, 1,
-0.05797946, -0.9448093, -3.348414, 0, 1, 0.7137255, 1,
-0.05433877, -0.258466, -3.396516, 0, 1, 0.7176471, 1,
-0.04875171, -0.02234017, -1.978513, 0, 1, 0.7254902, 1,
-0.04603153, 1.552935, -0.5138005, 0, 1, 0.7294118, 1,
-0.04225412, 0.3310408, -0.7161446, 0, 1, 0.7372549, 1,
-0.04053624, 0.1648572, 0.9856067, 0, 1, 0.7411765, 1,
-0.03900645, 1.078268, 0.8151159, 0, 1, 0.7490196, 1,
-0.03843893, 0.05531413, -2.264103, 0, 1, 0.7529412, 1,
-0.0352787, -0.9893215, -3.26629, 0, 1, 0.7607843, 1,
-0.03524677, -0.06124597, -4.649824, 0, 1, 0.7647059, 1,
-0.03019798, -0.9933439, -2.284999, 0, 1, 0.772549, 1,
-0.02919624, 0.9824018, -1.107555, 0, 1, 0.7764706, 1,
-0.01794261, -0.751153, -4.295129, 0, 1, 0.7843137, 1,
-0.01610334, -1.295687, -3.853085, 0, 1, 0.7882353, 1,
-0.01560443, -0.6175001, -2.79664, 0, 1, 0.7960784, 1,
-0.01382399, -1.011078, -3.325911, 0, 1, 0.8039216, 1,
-0.01054765, -0.6074746, -1.814624, 0, 1, 0.8078431, 1,
-0.01042918, 0.8058451, 0.5027332, 0, 1, 0.8156863, 1,
-0.009488582, -0.602448, -2.644808, 0, 1, 0.8196079, 1,
-0.009087255, -0.4934969, -3.557576, 0, 1, 0.827451, 1,
-0.005486546, -0.6555763, -5.359531, 0, 1, 0.8313726, 1,
-0.004716837, 0.2670856, 2.809459, 0, 1, 0.8392157, 1,
-0.004203387, 0.3374522, -0.5139878, 0, 1, 0.8431373, 1,
-0.003827528, 2.733928, -2.139006, 0, 1, 0.8509804, 1,
0.001702921, -0.7264141, 1.926816, 0, 1, 0.854902, 1,
0.002630079, 2.265157, -0.3433133, 0, 1, 0.8627451, 1,
0.003029194, -0.7115275, 2.648642, 0, 1, 0.8666667, 1,
0.005414161, -0.5286261, 3.806303, 0, 1, 0.8745098, 1,
0.006981067, 0.1855155, 0.9680944, 0, 1, 0.8784314, 1,
0.0104531, 1.859737, -0.7809255, 0, 1, 0.8862745, 1,
0.0112578, 2.665381, 0.2834368, 0, 1, 0.8901961, 1,
0.01484157, -1.834903, 2.822182, 0, 1, 0.8980392, 1,
0.01767383, -1.547958, 4.912426, 0, 1, 0.9058824, 1,
0.02142389, 0.1165495, -0.1962663, 0, 1, 0.9098039, 1,
0.02613297, -0.8715719, 2.96324, 0, 1, 0.9176471, 1,
0.02729455, -1.374622, 3.606059, 0, 1, 0.9215686, 1,
0.02794533, -1.148896, 2.624193, 0, 1, 0.9294118, 1,
0.03329334, -0.8947243, 4.247012, 0, 1, 0.9333333, 1,
0.03376015, 0.01839568, 0.197505, 0, 1, 0.9411765, 1,
0.03494981, -0.5601502, 3.977199, 0, 1, 0.945098, 1,
0.03815312, 0.7795514, -0.6902525, 0, 1, 0.9529412, 1,
0.03834904, -0.4624914, 3.234643, 0, 1, 0.9568627, 1,
0.04492999, 2.173584, 0.1939012, 0, 1, 0.9647059, 1,
0.04916983, 0.1544685, 0.2925493, 0, 1, 0.9686275, 1,
0.05203161, -0.9835098, 3.373195, 0, 1, 0.9764706, 1,
0.05471075, -0.7704034, 2.600434, 0, 1, 0.9803922, 1,
0.05762171, -0.9888985, 4.74754, 0, 1, 0.9882353, 1,
0.06055376, 1.41, -0.3832784, 0, 1, 0.9921569, 1,
0.06157528, -1.446397, 2.983029, 0, 1, 1, 1,
0.06254847, -1.596465, 2.737966, 0, 0.9921569, 1, 1,
0.06540316, 0.5500351, 1.162197, 0, 0.9882353, 1, 1,
0.0684737, -0.7524344, 2.52072, 0, 0.9803922, 1, 1,
0.07093479, 1.960643, -1.328923, 0, 0.9764706, 1, 1,
0.07245309, 0.9533054, -0.06674031, 0, 0.9686275, 1, 1,
0.07309091, -0.2596984, 2.247309, 0, 0.9647059, 1, 1,
0.07399329, 0.03958691, 1.403352, 0, 0.9568627, 1, 1,
0.07482389, -0.4949432, 3.815162, 0, 0.9529412, 1, 1,
0.07652451, -0.3529493, 3.851333, 0, 0.945098, 1, 1,
0.07814878, 1.160837, 1.962034, 0, 0.9411765, 1, 1,
0.07838997, -0.7800523, 3.021355, 0, 0.9333333, 1, 1,
0.08767281, -0.04307079, 1.866783, 0, 0.9294118, 1, 1,
0.09186122, 0.5217583, 0.3528145, 0, 0.9215686, 1, 1,
0.09437864, -0.7496391, 3.961096, 0, 0.9176471, 1, 1,
0.1018647, 1.866124, 0.5260851, 0, 0.9098039, 1, 1,
0.1028069, 0.9726629, 1.19436, 0, 0.9058824, 1, 1,
0.104886, -0.9287316, 2.84839, 0, 0.8980392, 1, 1,
0.105584, 0.6346163, 1.212215, 0, 0.8901961, 1, 1,
0.1075903, -1.194806, 4.142962, 0, 0.8862745, 1, 1,
0.1079227, -1.148507, 3.673993, 0, 0.8784314, 1, 1,
0.1079572, 1.045104, 1.031354, 0, 0.8745098, 1, 1,
0.1080586, -0.005274198, 3.092409, 0, 0.8666667, 1, 1,
0.114146, 0.6824235, -1.361058, 0, 0.8627451, 1, 1,
0.1174134, 1.394555, -1.446384, 0, 0.854902, 1, 1,
0.1217141, -0.7508705, 3.01908, 0, 0.8509804, 1, 1,
0.1224653, 0.9300765, -1.341695, 0, 0.8431373, 1, 1,
0.123713, -0.770068, 2.540836, 0, 0.8392157, 1, 1,
0.1250861, 1.055817, 0.7936187, 0, 0.8313726, 1, 1,
0.1257082, 1.175045, -0.5586902, 0, 0.827451, 1, 1,
0.1261701, 0.8296205, 0.5917148, 0, 0.8196079, 1, 1,
0.1289953, 0.243933, -0.2028748, 0, 0.8156863, 1, 1,
0.1296025, -0.5634892, 3.324251, 0, 0.8078431, 1, 1,
0.1324578, -0.07826409, 4.398637, 0, 0.8039216, 1, 1,
0.1328111, -0.8554879, 2.09766, 0, 0.7960784, 1, 1,
0.1335863, 1.979595, -0.6074035, 0, 0.7882353, 1, 1,
0.1338159, -1.539604, 2.924833, 0, 0.7843137, 1, 1,
0.1391351, 0.01566945, 2.053632, 0, 0.7764706, 1, 1,
0.1424041, 0.626325, -0.4731471, 0, 0.772549, 1, 1,
0.1495639, -0.8840714, 2.592024, 0, 0.7647059, 1, 1,
0.1495729, -2.182595, 3.781286, 0, 0.7607843, 1, 1,
0.1496319, -1.28945, 2.372134, 0, 0.7529412, 1, 1,
0.1517588, 0.2745637, 0.6841484, 0, 0.7490196, 1, 1,
0.1547084, -2.295434, 1.811802, 0, 0.7411765, 1, 1,
0.1614067, -1.294403, 0.9298081, 0, 0.7372549, 1, 1,
0.1623596, -0.547499, 3.566142, 0, 0.7294118, 1, 1,
0.1769634, -0.1499644, 2.821025, 0, 0.7254902, 1, 1,
0.1802594, -0.9074713, 2.87763, 0, 0.7176471, 1, 1,
0.1827779, 0.4536915, -0.03486335, 0, 0.7137255, 1, 1,
0.1831567, -0.3298732, 2.720418, 0, 0.7058824, 1, 1,
0.1884632, -1.871432, 4.274585, 0, 0.6980392, 1, 1,
0.1892183, 2.301462, 0.7435827, 0, 0.6941177, 1, 1,
0.1952116, 0.8049436, 0.4452059, 0, 0.6862745, 1, 1,
0.1953489, -2.433927, 2.585366, 0, 0.682353, 1, 1,
0.196076, -0.2549875, 4.026359, 0, 0.6745098, 1, 1,
0.2002513, -1.09301, 2.510416, 0, 0.6705883, 1, 1,
0.20275, -0.702358, 1.011854, 0, 0.6627451, 1, 1,
0.2038123, 0.2422005, 1.17315, 0, 0.6588235, 1, 1,
0.2049798, 0.4410874, 0.9272637, 0, 0.6509804, 1, 1,
0.2055803, -0.8307644, 3.268832, 0, 0.6470588, 1, 1,
0.206589, 1.136812, 2.304616, 0, 0.6392157, 1, 1,
0.207696, 0.06193016, 1.986231, 0, 0.6352941, 1, 1,
0.2142038, 0.1953495, 0.8066677, 0, 0.627451, 1, 1,
0.2161779, 0.943485, 1.455679, 0, 0.6235294, 1, 1,
0.217764, -1.423584, 2.532427, 0, 0.6156863, 1, 1,
0.2229705, 0.3954601, -0.02555269, 0, 0.6117647, 1, 1,
0.2265052, -0.1484232, 1.7671, 0, 0.6039216, 1, 1,
0.2281049, 0.5676878, 0.2330783, 0, 0.5960785, 1, 1,
0.2285518, 0.9811156, -0.7890481, 0, 0.5921569, 1, 1,
0.2289297, -0.6696454, 4.738041, 0, 0.5843138, 1, 1,
0.2291968, 0.9914496, -1.141687, 0, 0.5803922, 1, 1,
0.2368336, -0.488239, 1.360076, 0, 0.572549, 1, 1,
0.2422098, -0.5036424, 1.267646, 0, 0.5686275, 1, 1,
0.2459006, 0.8532837, 0.2592989, 0, 0.5607843, 1, 1,
0.2466793, 1.006771, -0.5462509, 0, 0.5568628, 1, 1,
0.2530607, -1.828167, 1.893356, 0, 0.5490196, 1, 1,
0.2539695, 0.3987902, -0.6220745, 0, 0.5450981, 1, 1,
0.2562564, 0.907081, -0.8372731, 0, 0.5372549, 1, 1,
0.2614929, 0.8654646, 0.3012363, 0, 0.5333334, 1, 1,
0.2631388, 0.1256435, 1.212011, 0, 0.5254902, 1, 1,
0.2664193, 1.777889, 2.082468, 0, 0.5215687, 1, 1,
0.273888, 0.3691309, 0.5710445, 0, 0.5137255, 1, 1,
0.2739175, -1.885461, 1.193235, 0, 0.509804, 1, 1,
0.2748863, -0.215691, 0.7616839, 0, 0.5019608, 1, 1,
0.275732, 0.4331546, 2.162992, 0, 0.4941176, 1, 1,
0.2799086, 0.9670677, 1.036469, 0, 0.4901961, 1, 1,
0.2839574, 0.6236754, 1.300364, 0, 0.4823529, 1, 1,
0.2844747, 0.6414455, -1.858767, 0, 0.4784314, 1, 1,
0.2857326, 1.142214, 1.174594, 0, 0.4705882, 1, 1,
0.2861357, 0.2408899, 1.045277, 0, 0.4666667, 1, 1,
0.2877408, 0.01052962, 2.241583, 0, 0.4588235, 1, 1,
0.287944, -0.828784, 2.870222, 0, 0.454902, 1, 1,
0.2912186, -0.1728722, 2.346039, 0, 0.4470588, 1, 1,
0.2959434, -1.043866, 3.013638, 0, 0.4431373, 1, 1,
0.2962829, 0.2868416, 1.398755, 0, 0.4352941, 1, 1,
0.2986378, 1.000989, -0.2054947, 0, 0.4313726, 1, 1,
0.3038963, 0.09858523, 0.2457829, 0, 0.4235294, 1, 1,
0.3038991, 2.017412, 0.1180596, 0, 0.4196078, 1, 1,
0.3055665, 1.169512, 0.8046965, 0, 0.4117647, 1, 1,
0.3056881, 0.8743629, 0.003551674, 0, 0.4078431, 1, 1,
0.3072878, 0.8886406, 1.754016, 0, 0.4, 1, 1,
0.3116287, -0.5074692, 3.293316, 0, 0.3921569, 1, 1,
0.3138417, -1.605009, 3.615829, 0, 0.3882353, 1, 1,
0.3149601, -0.2519553, 2.832717, 0, 0.3803922, 1, 1,
0.3151041, 0.618809, -0.2907116, 0, 0.3764706, 1, 1,
0.3159212, 0.8014085, -0.7658065, 0, 0.3686275, 1, 1,
0.3188679, -0.9976121, 2.355206, 0, 0.3647059, 1, 1,
0.3202243, -0.1365284, 1.722438, 0, 0.3568628, 1, 1,
0.3232612, 0.3895297, 2.865341, 0, 0.3529412, 1, 1,
0.3332745, -0.8120553, 2.992433, 0, 0.345098, 1, 1,
0.3341885, -0.1292637, -0.03189559, 0, 0.3411765, 1, 1,
0.3366881, -0.06370623, 2.342714, 0, 0.3333333, 1, 1,
0.336899, -0.2216709, 1.198223, 0, 0.3294118, 1, 1,
0.3375418, -0.3536796, 2.81044, 0, 0.3215686, 1, 1,
0.3426515, -2.32018, 3.561918, 0, 0.3176471, 1, 1,
0.3433338, -1.133347, 3.173004, 0, 0.3098039, 1, 1,
0.3519631, 0.2921076, -0.4723695, 0, 0.3058824, 1, 1,
0.354325, -1.699365, 2.45562, 0, 0.2980392, 1, 1,
0.3572582, 0.2013015, -0.06028493, 0, 0.2901961, 1, 1,
0.3610762, -0.9576186, 0.39369, 0, 0.2862745, 1, 1,
0.3611797, 0.4813356, 0.8457875, 0, 0.2784314, 1, 1,
0.3725753, 0.1857745, 1.069834, 0, 0.2745098, 1, 1,
0.3731375, 0.07026956, 1.091448, 0, 0.2666667, 1, 1,
0.3777365, -1.074888, 1.813707, 0, 0.2627451, 1, 1,
0.3851253, -1.614205, 2.990016, 0, 0.254902, 1, 1,
0.3886344, -0.8225737, 0.7048936, 0, 0.2509804, 1, 1,
0.3910172, -0.3707237, 2.755308, 0, 0.2431373, 1, 1,
0.3956057, -0.2046441, 2.780991, 0, 0.2392157, 1, 1,
0.396836, 0.03311032, -0.1182983, 0, 0.2313726, 1, 1,
0.397218, 0.9431314, -0.08679996, 0, 0.227451, 1, 1,
0.398181, -0.3399161, 2.04158, 0, 0.2196078, 1, 1,
0.3986106, -0.3306108, 2.12204, 0, 0.2156863, 1, 1,
0.3989508, -0.06949284, -0.7508061, 0, 0.2078431, 1, 1,
0.4027898, -1.567813, 2.191434, 0, 0.2039216, 1, 1,
0.4031387, 1.160898, 0.9156516, 0, 0.1960784, 1, 1,
0.4034563, -0.1020554, 2.738469, 0, 0.1882353, 1, 1,
0.4104316, -0.7649624, 5.69289, 0, 0.1843137, 1, 1,
0.4157934, 0.4389618, 1.148749, 0, 0.1764706, 1, 1,
0.4211902, -0.9033214, 2.843283, 0, 0.172549, 1, 1,
0.4213337, 0.9771743, 1.060921, 0, 0.1647059, 1, 1,
0.4292645, 1.121413, -0.684066, 0, 0.1607843, 1, 1,
0.430534, 0.2590654, 1.147811, 0, 0.1529412, 1, 1,
0.4409452, 1.156203, -1.015803, 0, 0.1490196, 1, 1,
0.4412812, 0.03687081, 1.43953, 0, 0.1411765, 1, 1,
0.4481321, 0.5633159, 1.50028, 0, 0.1372549, 1, 1,
0.4532513, -1.809194, 2.042792, 0, 0.1294118, 1, 1,
0.4537219, -1.335278, 3.928587, 0, 0.1254902, 1, 1,
0.4544874, 0.4615195, 1.759908, 0, 0.1176471, 1, 1,
0.4556906, 0.8898891, 1.536485, 0, 0.1137255, 1, 1,
0.4569688, -1.00093, 0.7886121, 0, 0.1058824, 1, 1,
0.4618339, -0.09355102, 0.5003872, 0, 0.09803922, 1, 1,
0.462806, 1.489683, 1.867769, 0, 0.09411765, 1, 1,
0.4645832, -0.7287181, 1.473795, 0, 0.08627451, 1, 1,
0.4689516, 1.402649, -0.7226771, 0, 0.08235294, 1, 1,
0.4712509, -0.499963, 2.223502, 0, 0.07450981, 1, 1,
0.4753051, -1.285413, 0.986855, 0, 0.07058824, 1, 1,
0.4774514, -1.587099, 3.552878, 0, 0.0627451, 1, 1,
0.4787939, 0.6775243, -0.2390973, 0, 0.05882353, 1, 1,
0.4790562, -1.913706, 2.503083, 0, 0.05098039, 1, 1,
0.4867783, -0.6647499, 1.79691, 0, 0.04705882, 1, 1,
0.4903865, 1.178509, -0.6861064, 0, 0.03921569, 1, 1,
0.4915728, 1.397961, -0.180903, 0, 0.03529412, 1, 1,
0.496283, 0.5695645, -1.107491, 0, 0.02745098, 1, 1,
0.4982452, 0.2545046, 1.927708, 0, 0.02352941, 1, 1,
0.4983791, -0.9484194, 1.286582, 0, 0.01568628, 1, 1,
0.4988294, 0.5207193, -0.4646734, 0, 0.01176471, 1, 1,
0.5081766, 0.299366, 1.804374, 0, 0.003921569, 1, 1,
0.5100999, -0.8489901, 3.133669, 0.003921569, 0, 1, 1,
0.5121307, 0.9821139, -0.6941398, 0.007843138, 0, 1, 1,
0.5151059, 0.9522336, 0.1555995, 0.01568628, 0, 1, 1,
0.5166115, -1.816089, 3.136639, 0.01960784, 0, 1, 1,
0.518796, -0.5913836, 4.605258, 0.02745098, 0, 1, 1,
0.5194774, 0.0006005409, 1.147731, 0.03137255, 0, 1, 1,
0.5200294, 0.2539826, 1.517729, 0.03921569, 0, 1, 1,
0.5223375, -1.911589, 1.76644, 0.04313726, 0, 1, 1,
0.5262001, 1.247502, 0.6463602, 0.05098039, 0, 1, 1,
0.5273232, -2.421028, 4.832996, 0.05490196, 0, 1, 1,
0.5290874, -3.482767, 4.105385, 0.0627451, 0, 1, 1,
0.5308747, 0.2181887, -0.5477797, 0.06666667, 0, 1, 1,
0.5320212, -0.9352292, 3.61163, 0.07450981, 0, 1, 1,
0.5320522, 1.624592, 0.4790097, 0.07843138, 0, 1, 1,
0.5356272, -2.869329, 1.512162, 0.08627451, 0, 1, 1,
0.5410975, -2.527896, 2.836861, 0.09019608, 0, 1, 1,
0.5417031, 0.06089999, 1.933228, 0.09803922, 0, 1, 1,
0.5426755, 0.1415341, 2.602577, 0.1058824, 0, 1, 1,
0.5440227, -0.9527149, 3.95988, 0.1098039, 0, 1, 1,
0.5449589, 1.859724, -1.098082, 0.1176471, 0, 1, 1,
0.5470284, -0.6554, 1.702802, 0.1215686, 0, 1, 1,
0.5510526, 0.226391, -1.167496, 0.1294118, 0, 1, 1,
0.5522946, -2.031592, 0.7650918, 0.1333333, 0, 1, 1,
0.5531893, -0.8589536, 2.487224, 0.1411765, 0, 1, 1,
0.5548749, -0.06907883, 1.552256, 0.145098, 0, 1, 1,
0.5565761, 0.3898549, 0.4437183, 0.1529412, 0, 1, 1,
0.5583084, -0.1601576, 2.231707, 0.1568628, 0, 1, 1,
0.560208, 0.3446973, 0.8618542, 0.1647059, 0, 1, 1,
0.5661594, 0.3583965, 0.9612882, 0.1686275, 0, 1, 1,
0.567131, 1.90968, 0.2595652, 0.1764706, 0, 1, 1,
0.5682544, 0.2257416, 0.8576732, 0.1803922, 0, 1, 1,
0.5727513, 0.7330362, 0.3843386, 0.1882353, 0, 1, 1,
0.5735353, -1.292049, 2.999972, 0.1921569, 0, 1, 1,
0.5781631, -0.3166642, 2.533665, 0.2, 0, 1, 1,
0.5854705, -0.438919, 2.369781, 0.2078431, 0, 1, 1,
0.5855503, 0.7530925, 1.08597, 0.2117647, 0, 1, 1,
0.5877424, 0.2894305, 2.592031, 0.2196078, 0, 1, 1,
0.6002108, 1.662311, 1.631526, 0.2235294, 0, 1, 1,
0.6022851, -1.208461, 2.891091, 0.2313726, 0, 1, 1,
0.6092535, -0.5562323, 1.194257, 0.2352941, 0, 1, 1,
0.6113517, -1.024951, 2.839966, 0.2431373, 0, 1, 1,
0.6114654, 0.3368239, -0.010935, 0.2470588, 0, 1, 1,
0.6123936, -0.6760724, 0.929992, 0.254902, 0, 1, 1,
0.6129503, 0.9031233, 1.101836, 0.2588235, 0, 1, 1,
0.617522, 0.03459169, 3.142892, 0.2666667, 0, 1, 1,
0.6244407, 0.2075402, 2.051498, 0.2705882, 0, 1, 1,
0.6274919, -0.2877256, 2.292009, 0.2784314, 0, 1, 1,
0.6291519, 0.2060777, 2.241649, 0.282353, 0, 1, 1,
0.6295537, -0.51902, 1.819857, 0.2901961, 0, 1, 1,
0.6297827, 1.819538, -0.2381682, 0.2941177, 0, 1, 1,
0.6351323, -0.5188496, 3.659637, 0.3019608, 0, 1, 1,
0.6378655, 0.3931543, -0.2898281, 0.3098039, 0, 1, 1,
0.639358, 1.111891, 0.3184355, 0.3137255, 0, 1, 1,
0.639713, -1.161588, 2.326574, 0.3215686, 0, 1, 1,
0.6417173, -1.935678, 4.029723, 0.3254902, 0, 1, 1,
0.6455911, -0.6148118, 3.066115, 0.3333333, 0, 1, 1,
0.6469336, 1.835924, 0.1820834, 0.3372549, 0, 1, 1,
0.6472313, -1.144221, 1.540032, 0.345098, 0, 1, 1,
0.6478381, -1.426063, 4.531537, 0.3490196, 0, 1, 1,
0.6480548, -0.7087339, 2.931105, 0.3568628, 0, 1, 1,
0.6513093, 0.1467674, 1.561934, 0.3607843, 0, 1, 1,
0.6586324, -0.672023, 0.508103, 0.3686275, 0, 1, 1,
0.6598597, 0.8294272, 0.1564924, 0.372549, 0, 1, 1,
0.6633724, -1.57053, 1.109729, 0.3803922, 0, 1, 1,
0.6686314, -0.1970859, 1.664619, 0.3843137, 0, 1, 1,
0.6710841, 0.6724078, 1.259591, 0.3921569, 0, 1, 1,
0.6735536, -0.09765541, 1.521587, 0.3960784, 0, 1, 1,
0.6784018, 1.718572, 1.021774, 0.4039216, 0, 1, 1,
0.680553, 0.1334103, 3.049551, 0.4117647, 0, 1, 1,
0.6859431, 1.005664, 0.4926327, 0.4156863, 0, 1, 1,
0.6906571, -1.371907, 3.379028, 0.4235294, 0, 1, 1,
0.699526, 0.5061569, 2.206586, 0.427451, 0, 1, 1,
0.7001266, 1.311964, 0.9230585, 0.4352941, 0, 1, 1,
0.7007864, -0.18827, 1.072905, 0.4392157, 0, 1, 1,
0.7026582, -1.336699, 2.058454, 0.4470588, 0, 1, 1,
0.7044787, 1.479476, 0.6738848, 0.4509804, 0, 1, 1,
0.7045627, -0.5071092, 2.335323, 0.4588235, 0, 1, 1,
0.7223204, -1.227626, 2.506627, 0.4627451, 0, 1, 1,
0.7252313, -0.1212011, 2.404457, 0.4705882, 0, 1, 1,
0.7336649, -3.912177, 3.341719, 0.4745098, 0, 1, 1,
0.7348518, 1.422852, -0.1671948, 0.4823529, 0, 1, 1,
0.7356572, -0.682102, 1.593204, 0.4862745, 0, 1, 1,
0.7356724, 0.3064496, 1.168455, 0.4941176, 0, 1, 1,
0.7364796, -0.08873205, 0.6693565, 0.5019608, 0, 1, 1,
0.7417382, -0.1078996, 1.786315, 0.5058824, 0, 1, 1,
0.743503, -0.9643565, 4.026322, 0.5137255, 0, 1, 1,
0.7462177, 0.5341182, 1.026272, 0.5176471, 0, 1, 1,
0.7467242, 0.1542188, 0.8057682, 0.5254902, 0, 1, 1,
0.7475659, 0.4124762, 1.38199, 0.5294118, 0, 1, 1,
0.7504321, -1.694913, 2.019437, 0.5372549, 0, 1, 1,
0.7521845, -1.492729, 2.056541, 0.5411765, 0, 1, 1,
0.7582594, -0.09940049, 2.230688, 0.5490196, 0, 1, 1,
0.7617896, -0.03661763, 1.280415, 0.5529412, 0, 1, 1,
0.7685854, 1.1841, -0.5664518, 0.5607843, 0, 1, 1,
0.7761726, 0.3012013, 1.098843, 0.5647059, 0, 1, 1,
0.7769442, 1.649056, -1.558942, 0.572549, 0, 1, 1,
0.7783636, 0.5065494, 1.939875, 0.5764706, 0, 1, 1,
0.7842091, 0.362201, 1.384448, 0.5843138, 0, 1, 1,
0.7872741, 0.2227657, 1.109882, 0.5882353, 0, 1, 1,
0.792699, 0.4411558, 0.1273391, 0.5960785, 0, 1, 1,
0.7948657, 1.803195, -0.3466437, 0.6039216, 0, 1, 1,
0.7948859, -2.310137, 2.634023, 0.6078432, 0, 1, 1,
0.7967729, -0.8184842, 1.682243, 0.6156863, 0, 1, 1,
0.799808, -0.2377233, 0.3679929, 0.6196079, 0, 1, 1,
0.8029473, 1.806068, 0.698805, 0.627451, 0, 1, 1,
0.805638, 0.5753322, -0.06665435, 0.6313726, 0, 1, 1,
0.806967, 0.5710627, 0.5517326, 0.6392157, 0, 1, 1,
0.8071872, 1.545848, 0.6773674, 0.6431373, 0, 1, 1,
0.811078, 0.4099858, 2.412339, 0.6509804, 0, 1, 1,
0.8120341, -0.530492, 1.529037, 0.654902, 0, 1, 1,
0.8143789, 0.8655642, 1.353482, 0.6627451, 0, 1, 1,
0.8177419, 0.03852586, 0.5317759, 0.6666667, 0, 1, 1,
0.8182119, 0.4696869, 0.7439127, 0.6745098, 0, 1, 1,
0.8184943, -0.1549417, 2.216815, 0.6784314, 0, 1, 1,
0.8189862, 0.1108565, 1.465659, 0.6862745, 0, 1, 1,
0.8308405, -0.6130175, 1.431574, 0.6901961, 0, 1, 1,
0.8335416, 1.768288, -0.3580076, 0.6980392, 0, 1, 1,
0.8367279, -1.768626, 1.938306, 0.7058824, 0, 1, 1,
0.8404257, -0.2790637, 2.594828, 0.7098039, 0, 1, 1,
0.8418651, -3.006716, 4.128197, 0.7176471, 0, 1, 1,
0.8495235, 0.5384903, 0.9586936, 0.7215686, 0, 1, 1,
0.8513883, -0.4894835, 1.326715, 0.7294118, 0, 1, 1,
0.8568216, 1.558062, -0.3571407, 0.7333333, 0, 1, 1,
0.8613135, 0.2591558, -0.04070557, 0.7411765, 0, 1, 1,
0.8615222, -0.1855709, 2.002306, 0.7450981, 0, 1, 1,
0.8713152, 0.07212458, 2.921359, 0.7529412, 0, 1, 1,
0.8801852, -0.3257104, 0.4966561, 0.7568628, 0, 1, 1,
0.8877811, 1.294152, 0.07070582, 0.7647059, 0, 1, 1,
0.888317, -0.9179031, 3.773228, 0.7686275, 0, 1, 1,
0.892303, 0.4797709, 2.370711, 0.7764706, 0, 1, 1,
0.8953547, -1.032628, 1.217246, 0.7803922, 0, 1, 1,
0.8957435, -0.4401802, 1.160096, 0.7882353, 0, 1, 1,
0.9023154, 2.297249, 0.5761808, 0.7921569, 0, 1, 1,
0.9068357, 0.05245493, 3.191224, 0.8, 0, 1, 1,
0.9077901, 0.7356949, -0.2310565, 0.8078431, 0, 1, 1,
0.9180052, -0.05787971, 0.8246449, 0.8117647, 0, 1, 1,
0.9183077, -0.2773165, 0.9725516, 0.8196079, 0, 1, 1,
0.9200842, -0.6618663, 1.132371, 0.8235294, 0, 1, 1,
0.9213417, -0.5096305, 1.935518, 0.8313726, 0, 1, 1,
0.9307069, -0.2697476, 2.312836, 0.8352941, 0, 1, 1,
0.9320015, 0.4241765, 2.926056, 0.8431373, 0, 1, 1,
0.9355708, -1.437557, 2.357347, 0.8470588, 0, 1, 1,
0.9376616, -1.180306, 2.309249, 0.854902, 0, 1, 1,
0.9432765, -0.4668086, 2.501498, 0.8588235, 0, 1, 1,
0.9436347, 0.02612158, 0.9574496, 0.8666667, 0, 1, 1,
0.944277, -0.5410315, 1.59534, 0.8705882, 0, 1, 1,
0.9454746, 1.978064, 1.197044, 0.8784314, 0, 1, 1,
0.9515137, -1.147319, 4.147076, 0.8823529, 0, 1, 1,
0.9530239, -0.6541923, 0.3992234, 0.8901961, 0, 1, 1,
0.9537563, 0.5008659, 1.200888, 0.8941177, 0, 1, 1,
0.9545534, 0.3233444, 0.2475954, 0.9019608, 0, 1, 1,
0.9631834, -0.4632817, 1.028635, 0.9098039, 0, 1, 1,
0.9665728, 1.008825, 0.6516631, 0.9137255, 0, 1, 1,
0.9676401, -0.185114, 2.852743, 0.9215686, 0, 1, 1,
0.9691018, -1.072524, 2.799972, 0.9254902, 0, 1, 1,
0.9778064, 0.5580569, 1.570682, 0.9333333, 0, 1, 1,
0.9802474, 0.6755602, -0.03344933, 0.9372549, 0, 1, 1,
0.9824879, -0.5321759, 1.066813, 0.945098, 0, 1, 1,
0.9957793, 0.9947654, 0.5156413, 0.9490196, 0, 1, 1,
0.9988138, -0.6152561, 2.574614, 0.9568627, 0, 1, 1,
0.9994151, 0.04627311, 2.227754, 0.9607843, 0, 1, 1,
1.001683, -0.02858758, 2.527633, 0.9686275, 0, 1, 1,
1.004934, 0.0332329, 1.990546, 0.972549, 0, 1, 1,
1.005391, -0.5458097, 2.14212, 0.9803922, 0, 1, 1,
1.006459, 0.6996157, 0.3986872, 0.9843137, 0, 1, 1,
1.007561, -0.5307789, 1.875116, 0.9921569, 0, 1, 1,
1.008622, 0.6030361, -0.7187238, 0.9960784, 0, 1, 1,
1.015572, 0.1884772, 1.210379, 1, 0, 0.9960784, 1,
1.019096, -0.475845, 2.718669, 1, 0, 0.9882353, 1,
1.023857, -2.745111, 3.922168, 1, 0, 0.9843137, 1,
1.024668, -1.141414, 2.445064, 1, 0, 0.9764706, 1,
1.02536, -1.248664, 2.190099, 1, 0, 0.972549, 1,
1.028856, 1.922962, -0.09623744, 1, 0, 0.9647059, 1,
1.032575, -0.2206194, 1.790267, 1, 0, 0.9607843, 1,
1.034858, 0.09731776, 1.752646, 1, 0, 0.9529412, 1,
1.037233, 0.9320882, -0.6232832, 1, 0, 0.9490196, 1,
1.041066, -1.000993, 3.279683, 1, 0, 0.9411765, 1,
1.04402, 2.233326, 0.3832673, 1, 0, 0.9372549, 1,
1.051058, -0.1820272, 2.521335, 1, 0, 0.9294118, 1,
1.05198, -0.3842707, 2.394442, 1, 0, 0.9254902, 1,
1.060532, 0.3840376, 1.766127, 1, 0, 0.9176471, 1,
1.061664, 1.121937, 0.323696, 1, 0, 0.9137255, 1,
1.062125, 0.4714978, 1.05482, 1, 0, 0.9058824, 1,
1.068251, 1.247663, -1.534356, 1, 0, 0.9019608, 1,
1.068327, 0.7538873, 0.08436766, 1, 0, 0.8941177, 1,
1.068384, -0.4234747, 2.600914, 1, 0, 0.8862745, 1,
1.079558, 0.07172735, 0.2921433, 1, 0, 0.8823529, 1,
1.079998, -1.130304, 3.285754, 1, 0, 0.8745098, 1,
1.088005, -0.1601409, -1.470693, 1, 0, 0.8705882, 1,
1.092365, 0.7107385, 1.814564, 1, 0, 0.8627451, 1,
1.096632, -0.5592992, 1.491198, 1, 0, 0.8588235, 1,
1.100975, -0.3901088, 2.393095, 1, 0, 0.8509804, 1,
1.118607, -2.483599, 3.345095, 1, 0, 0.8470588, 1,
1.119417, 0.3829413, 2.387913, 1, 0, 0.8392157, 1,
1.120888, 1.079885, -0.3885283, 1, 0, 0.8352941, 1,
1.121965, -1.659212, 1.673274, 1, 0, 0.827451, 1,
1.128041, 0.3150234, 1.663404, 1, 0, 0.8235294, 1,
1.129191, -1.146183, 3.705992, 1, 0, 0.8156863, 1,
1.13165, -1.066975, 3.190327, 1, 0, 0.8117647, 1,
1.135113, 0.287927, 1.376928, 1, 0, 0.8039216, 1,
1.140031, -0.1810265, 2.413222, 1, 0, 0.7960784, 1,
1.156669, 0.8455342, 1.179047, 1, 0, 0.7921569, 1,
1.171839, 0.162294, 1.287151, 1, 0, 0.7843137, 1,
1.175608, 0.6425778, 0.7836013, 1, 0, 0.7803922, 1,
1.177022, 0.9018157, 3.413491, 1, 0, 0.772549, 1,
1.179251, -1.040576, 2.572162, 1, 0, 0.7686275, 1,
1.185717, 0.3267563, 0.7080413, 1, 0, 0.7607843, 1,
1.186462, -1.784706, 2.677914, 1, 0, 0.7568628, 1,
1.186778, 0.5085948, 0.4723758, 1, 0, 0.7490196, 1,
1.196231, -0.1906818, 4.032634, 1, 0, 0.7450981, 1,
1.200583, 0.5266347, 1.409749, 1, 0, 0.7372549, 1,
1.216853, -1.036809, 2.921895, 1, 0, 0.7333333, 1,
1.218154, -1.091298, 1.568255, 1, 0, 0.7254902, 1,
1.225418, 1.898851, -0.4852758, 1, 0, 0.7215686, 1,
1.226916, 0.1250814, 0.4695013, 1, 0, 0.7137255, 1,
1.244142, 0.6753462, 1.159867, 1, 0, 0.7098039, 1,
1.244814, -0.9179552, 2.297641, 1, 0, 0.7019608, 1,
1.246348, 0.7020252, 0.6025926, 1, 0, 0.6941177, 1,
1.251694, -1.436131, 3.28306, 1, 0, 0.6901961, 1,
1.252181, 0.9561687, 2.242359, 1, 0, 0.682353, 1,
1.268978, -0.1080342, 1.940133, 1, 0, 0.6784314, 1,
1.269141, -0.7441547, -0.05778529, 1, 0, 0.6705883, 1,
1.282496, -0.5126522, 2.597088, 1, 0, 0.6666667, 1,
1.292638, 0.5390205, 0.1025275, 1, 0, 0.6588235, 1,
1.295931, -1.807842, 2.521207, 1, 0, 0.654902, 1,
1.298286, -0.006547468, 1.437261, 1, 0, 0.6470588, 1,
1.306667, 0.290769, 0.5021251, 1, 0, 0.6431373, 1,
1.307701, 0.2199305, 2.597704, 1, 0, 0.6352941, 1,
1.310802, 1.741649, 2.189316, 1, 0, 0.6313726, 1,
1.318705, -0.8446324, 1.502587, 1, 0, 0.6235294, 1,
1.324538, 0.6888949, 0.7778505, 1, 0, 0.6196079, 1,
1.342729, -1.06403, 2.40818, 1, 0, 0.6117647, 1,
1.342781, -0.9299025, 0.2534117, 1, 0, 0.6078432, 1,
1.346717, 0.9392115, 0.6985453, 1, 0, 0.6, 1,
1.34915, 0.08998799, 3.704641, 1, 0, 0.5921569, 1,
1.360181, 0.1346174, 1.508278, 1, 0, 0.5882353, 1,
1.361325, -0.1704773, 1.091038, 1, 0, 0.5803922, 1,
1.363259, 0.2104801, 1.598453, 1, 0, 0.5764706, 1,
1.365498, 0.2274916, 1.60019, 1, 0, 0.5686275, 1,
1.369812, 0.8818126, 2.231865, 1, 0, 0.5647059, 1,
1.378294, 0.3209479, 1.215439, 1, 0, 0.5568628, 1,
1.384292, 0.4966394, -0.5912392, 1, 0, 0.5529412, 1,
1.390767, -0.8925123, 3.533999, 1, 0, 0.5450981, 1,
1.397417, 3.174536, -0.9900339, 1, 0, 0.5411765, 1,
1.39851, -1.205971, 2.9148, 1, 0, 0.5333334, 1,
1.399378, -2.803096, 3.754797, 1, 0, 0.5294118, 1,
1.402856, -0.97546, 2.789215, 1, 0, 0.5215687, 1,
1.407584, 0.5866548, 1.522364, 1, 0, 0.5176471, 1,
1.408664, -0.2613488, 1.42025, 1, 0, 0.509804, 1,
1.421374, -0.1155854, 1.85379, 1, 0, 0.5058824, 1,
1.42452, 0.7229972, -0.5112475, 1, 0, 0.4980392, 1,
1.437124, -0.4495261, 1.290752, 1, 0, 0.4901961, 1,
1.444786, -1.020814, 2.109989, 1, 0, 0.4862745, 1,
1.453443, -0.3915135, 1.742916, 1, 0, 0.4784314, 1,
1.458436, -1.218646, 2.052923, 1, 0, 0.4745098, 1,
1.468445, -0.8404313, 1.838794, 1, 0, 0.4666667, 1,
1.488448, 0.4936381, 2.863577, 1, 0, 0.4627451, 1,
1.489343, 1.412369, 0.2738964, 1, 0, 0.454902, 1,
1.495173, -2.288018, 3.625885, 1, 0, 0.4509804, 1,
1.496829, 0.12417, 0.9588203, 1, 0, 0.4431373, 1,
1.502038, -0.8684074, 1.271687, 1, 0, 0.4392157, 1,
1.508513, 1.119545, 1.958988, 1, 0, 0.4313726, 1,
1.510469, 0.6696324, 2.539008, 1, 0, 0.427451, 1,
1.514072, -0.756546, 0.9912358, 1, 0, 0.4196078, 1,
1.526992, 0.468694, 3.016308, 1, 0, 0.4156863, 1,
1.533886, -1.24867, 3.019674, 1, 0, 0.4078431, 1,
1.542529, -0.7738128, 1.013181, 1, 0, 0.4039216, 1,
1.555598, 1.083349, 0.0726379, 1, 0, 0.3960784, 1,
1.561624, 1.530873, -0.7275938, 1, 0, 0.3882353, 1,
1.57395, -0.6401832, 1.884557, 1, 0, 0.3843137, 1,
1.574759, 1.587322, 0.3120416, 1, 0, 0.3764706, 1,
1.58882, -0.6241455, -0.5514229, 1, 0, 0.372549, 1,
1.589927, -2.032272, 2.937108, 1, 0, 0.3647059, 1,
1.595436, 0.6591473, 3.905937, 1, 0, 0.3607843, 1,
1.601383, -0.3326323, 0.3356354, 1, 0, 0.3529412, 1,
1.613733, 0.3682538, 0.5680888, 1, 0, 0.3490196, 1,
1.618209, -0.7285562, 2.185708, 1, 0, 0.3411765, 1,
1.620663, -1.381145, 1.471101, 1, 0, 0.3372549, 1,
1.634335, -0.5855483, 1.024449, 1, 0, 0.3294118, 1,
1.645009, -1.576513, 2.904551, 1, 0, 0.3254902, 1,
1.645858, -1.973725, 3.780325, 1, 0, 0.3176471, 1,
1.647174, 2.051665, -1.399971, 1, 0, 0.3137255, 1,
1.650826, -0.5612878, 0.6205885, 1, 0, 0.3058824, 1,
1.651515, 0.02587841, 3.431871, 1, 0, 0.2980392, 1,
1.654099, -1.519504, 4.338293, 1, 0, 0.2941177, 1,
1.661296, -0.2186679, 1.605187, 1, 0, 0.2862745, 1,
1.68434, 1.448094, -0.9674118, 1, 0, 0.282353, 1,
1.697104, -1.102423, 2.971917, 1, 0, 0.2745098, 1,
1.698452, 0.07903755, 0.5270739, 1, 0, 0.2705882, 1,
1.705554, 0.665575, 1.207767, 1, 0, 0.2627451, 1,
1.707067, -1.074412, 2.385696, 1, 0, 0.2588235, 1,
1.707674, 0.4555583, -0.6677198, 1, 0, 0.2509804, 1,
1.70861, 1.020633, 1.249778, 1, 0, 0.2470588, 1,
1.714553, -0.03082247, 1.39741, 1, 0, 0.2392157, 1,
1.716715, 0.5146911, 0.9712524, 1, 0, 0.2352941, 1,
1.727608, -0.3213851, 3.685193, 1, 0, 0.227451, 1,
1.749419, -0.3050039, -0.2277289, 1, 0, 0.2235294, 1,
1.768432, -0.3530023, 1.438913, 1, 0, 0.2156863, 1,
1.78622, -0.3441523, 3.44484, 1, 0, 0.2117647, 1,
1.804375, -0.47133, 2.418384, 1, 0, 0.2039216, 1,
1.807296, -0.7256463, 2.627247, 1, 0, 0.1960784, 1,
1.822531, -1.184722, 1.04869, 1, 0, 0.1921569, 1,
1.826778, -0.1754277, 1.249323, 1, 0, 0.1843137, 1,
1.833349, 0.1923153, 0.5240345, 1, 0, 0.1803922, 1,
1.839658, -0.1496855, 2.827398, 1, 0, 0.172549, 1,
1.85759, 0.1348896, 2.700831, 1, 0, 0.1686275, 1,
1.869439, -0.05610962, 1.957345, 1, 0, 0.1607843, 1,
1.872523, 1.085892, 2.138408, 1, 0, 0.1568628, 1,
1.905744, -0.1472111, 0.5194454, 1, 0, 0.1490196, 1,
1.924107, -0.05888551, 1.403179, 1, 0, 0.145098, 1,
1.929947, -1.299411, 0.5986748, 1, 0, 0.1372549, 1,
1.930689, -0.7114866, 2.82115, 1, 0, 0.1333333, 1,
1.935553, -1.189508, 0.5048892, 1, 0, 0.1254902, 1,
1.946381, -0.2189752, 2.03469, 1, 0, 0.1215686, 1,
1.993731, 0.1828082, 3.007214, 1, 0, 0.1137255, 1,
1.997473, 2.565205, 1.579884, 1, 0, 0.1098039, 1,
2.024769, 1.459388, 0.5700402, 1, 0, 0.1019608, 1,
2.08161, 0.9117717, 0.6861294, 1, 0, 0.09411765, 1,
2.085127, -1.589206, 2.098258, 1, 0, 0.09019608, 1,
2.100811, -0.6415574, 2.226927, 1, 0, 0.08235294, 1,
2.107342, 0.4799978, 1.347032, 1, 0, 0.07843138, 1,
2.118409, 0.1695239, 1.661166, 1, 0, 0.07058824, 1,
2.169591, -0.04835264, 0.3716612, 1, 0, 0.06666667, 1,
2.186943, -0.4577345, 2.62521, 1, 0, 0.05882353, 1,
2.198884, 1.129864, 0.3904145, 1, 0, 0.05490196, 1,
2.252772, -0.1559655, 1.938389, 1, 0, 0.04705882, 1,
2.302157, -0.8778006, 2.248243, 1, 0, 0.04313726, 1,
2.314118, 1.138472, -0.07353077, 1, 0, 0.03529412, 1,
2.315613, 0.08420063, 0.8340827, 1, 0, 0.03137255, 1,
2.402243, 1.166127, 1.578492, 1, 0, 0.02352941, 1,
2.437583, 0.2770567, 1.958689, 1, 0, 0.01960784, 1,
2.484594, 0.5642928, 0.7271339, 1, 0, 0.01176471, 1,
3.301658, 0.4481746, 2.32149, 1, 0, 0.007843138, 1
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
0.1924329, -5.221552, -7.232917, 0, -0.5, 0.5, 0.5,
0.1924329, -5.221552, -7.232917, 1, -0.5, 0.5, 0.5,
0.1924329, -5.221552, -7.232917, 1, 1.5, 0.5, 0.5,
0.1924329, -5.221552, -7.232917, 0, 1.5, 0.5, 0.5
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
-3.970819, -0.04971075, -7.232917, 0, -0.5, 0.5, 0.5,
-3.970819, -0.04971075, -7.232917, 1, -0.5, 0.5, 0.5,
-3.970819, -0.04971075, -7.232917, 1, 1.5, 0.5, 0.5,
-3.970819, -0.04971075, -7.232917, 0, 1.5, 0.5, 0.5
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
-3.970819, -5.221552, 0.1666791, 0, -0.5, 0.5, 0.5,
-3.970819, -5.221552, 0.1666791, 1, -0.5, 0.5, 0.5,
-3.970819, -5.221552, 0.1666791, 1, 1.5, 0.5, 0.5,
-3.970819, -5.221552, 0.1666791, 0, 1.5, 0.5, 0.5
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
-2, -4.02805, -5.525318,
3, -4.02805, -5.525318,
-2, -4.02805, -5.525318,
-2, -4.226968, -5.809917,
-1, -4.02805, -5.525318,
-1, -4.226968, -5.809917,
0, -4.02805, -5.525318,
0, -4.226968, -5.809917,
1, -4.02805, -5.525318,
1, -4.226968, -5.809917,
2, -4.02805, -5.525318,
2, -4.226968, -5.809917,
3, -4.02805, -5.525318,
3, -4.226968, -5.809917
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
-2, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
-2, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
-2, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
-2, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5,
-1, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
-1, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
-1, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
-1, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5,
0, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
0, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
0, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
0, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5,
1, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
1, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
1, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
1, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5,
2, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
2, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
2, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
2, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5,
3, -4.624802, -6.379117, 0, -0.5, 0.5, 0.5,
3, -4.624802, -6.379117, 1, -0.5, 0.5, 0.5,
3, -4.624802, -6.379117, 1, 1.5, 0.5, 0.5,
3, -4.624802, -6.379117, 0, 1.5, 0.5, 0.5
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
-3.010069, -2, -5.525318,
-3.010069, 2, -5.525318,
-3.010069, -2, -5.525318,
-3.170194, -2, -5.809917,
-3.010069, 0, -5.525318,
-3.170194, 0, -5.809917,
-3.010069, 2, -5.525318,
-3.170194, 2, -5.809917
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
-3.490444, -2, -6.379117, 0, -0.5, 0.5, 0.5,
-3.490444, -2, -6.379117, 1, -0.5, 0.5, 0.5,
-3.490444, -2, -6.379117, 1, 1.5, 0.5, 0.5,
-3.490444, -2, -6.379117, 0, 1.5, 0.5, 0.5,
-3.490444, 0, -6.379117, 0, -0.5, 0.5, 0.5,
-3.490444, 0, -6.379117, 1, -0.5, 0.5, 0.5,
-3.490444, 0, -6.379117, 1, 1.5, 0.5, 0.5,
-3.490444, 0, -6.379117, 0, 1.5, 0.5, 0.5,
-3.490444, 2, -6.379117, 0, -0.5, 0.5, 0.5,
-3.490444, 2, -6.379117, 1, -0.5, 0.5, 0.5,
-3.490444, 2, -6.379117, 1, 1.5, 0.5, 0.5,
-3.490444, 2, -6.379117, 0, 1.5, 0.5, 0.5
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
-3.010069, -4.02805, -4,
-3.010069, -4.02805, 4,
-3.010069, -4.02805, -4,
-3.170194, -4.226968, -4,
-3.010069, -4.02805, -2,
-3.170194, -4.226968, -2,
-3.010069, -4.02805, 0,
-3.170194, -4.226968, 0,
-3.010069, -4.02805, 2,
-3.170194, -4.226968, 2,
-3.010069, -4.02805, 4,
-3.170194, -4.226968, 4
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
-3.490444, -4.624802, -4, 0, -0.5, 0.5, 0.5,
-3.490444, -4.624802, -4, 1, -0.5, 0.5, 0.5,
-3.490444, -4.624802, -4, 1, 1.5, 0.5, 0.5,
-3.490444, -4.624802, -4, 0, 1.5, 0.5, 0.5,
-3.490444, -4.624802, -2, 0, -0.5, 0.5, 0.5,
-3.490444, -4.624802, -2, 1, -0.5, 0.5, 0.5,
-3.490444, -4.624802, -2, 1, 1.5, 0.5, 0.5,
-3.490444, -4.624802, -2, 0, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 0, 0, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 0, 1, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 0, 1, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 0, 0, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 2, 0, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 2, 1, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 2, 1, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 2, 0, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 4, 0, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 4, 1, -0.5, 0.5, 0.5,
-3.490444, -4.624802, 4, 1, 1.5, 0.5, 0.5,
-3.490444, -4.624802, 4, 0, 1.5, 0.5, 0.5
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
-3.010069, -4.02805, -5.525318,
-3.010069, 3.928629, -5.525318,
-3.010069, -4.02805, 5.858676,
-3.010069, 3.928629, 5.858676,
-3.010069, -4.02805, -5.525318,
-3.010069, -4.02805, 5.858676,
-3.010069, 3.928629, -5.525318,
-3.010069, 3.928629, 5.858676,
-3.010069, -4.02805, -5.525318,
3.394935, -4.02805, -5.525318,
-3.010069, -4.02805, 5.858676,
3.394935, -4.02805, 5.858676,
-3.010069, 3.928629, -5.525318,
3.394935, 3.928629, -5.525318,
-3.010069, 3.928629, 5.858676,
3.394935, 3.928629, 5.858676,
3.394935, -4.02805, -5.525318,
3.394935, 3.928629, -5.525318,
3.394935, -4.02805, 5.858676,
3.394935, 3.928629, 5.858676,
3.394935, -4.02805, -5.525318,
3.394935, -4.02805, 5.858676,
3.394935, 3.928629, -5.525318,
3.394935, 3.928629, 5.858676
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
var radius = 8.167078;
var distance = 36.33625;
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
mvMatrix.translate( -0.1924329, 0.04971075, -0.1666791 );
mvMatrix.scale( 1.378673, 1.10981, 0.775686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.33625);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
1-Triazolylethylethe<-read.table("1-Triazolylethylethe.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-Triazolylethylethe$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triazolylethylethe' not found
```

```r
y<-1-Triazolylethylethe$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triazolylethylethe' not found
```

```r
z<-1-Triazolylethylethe$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triazolylethylethe' not found
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
-2.916792, 0.8554116, -1.132273, 0, 0, 1, 1, 1,
-2.724889, -1.568989, -4.324907, 1, 0, 0, 1, 1,
-2.624774, -0.2885586, -1.425986, 1, 0, 0, 1, 1,
-2.566068, 0.2141798, -1.778765, 1, 0, 0, 1, 1,
-2.53565, 0.3330445, -2.080169, 1, 0, 0, 1, 1,
-2.403016, 0.8033728, -0.2068715, 1, 0, 0, 1, 1,
-2.330601, -1.495551, -0.03853169, 0, 0, 0, 1, 1,
-2.165679, 1.499771, -1.168261, 0, 0, 0, 1, 1,
-2.140326, -0.3279675, -2.618032, 0, 0, 0, 1, 1,
-2.114271, -0.1236111, -2.342729, 0, 0, 0, 1, 1,
-2.097587, -1.227115, -2.217566, 0, 0, 0, 1, 1,
-2.06647, -0.03782839, -1.509754, 0, 0, 0, 1, 1,
-2.053321, -1.633062, -1.522373, 0, 0, 0, 1, 1,
-2.045904, 0.06225602, -1.001255, 1, 1, 1, 1, 1,
-2.037251, 0.7837145, -0.3642839, 1, 1, 1, 1, 1,
-2.024222, -0.3981164, -2.523256, 1, 1, 1, 1, 1,
-2.01194, -0.4003105, -1.004163, 1, 1, 1, 1, 1,
-2.011569, -0.003460862, -2.01141, 1, 1, 1, 1, 1,
-2.009846, 0.6089112, -2.045532, 1, 1, 1, 1, 1,
-1.959443, -0.5089023, -0.4229462, 1, 1, 1, 1, 1,
-1.932924, -0.3313599, -1.981105, 1, 1, 1, 1, 1,
-1.915489, 0.01850368, -2.47509, 1, 1, 1, 1, 1,
-1.848299, -1.318424, -2.997866, 1, 1, 1, 1, 1,
-1.838789, 0.7434683, -1.748318, 1, 1, 1, 1, 1,
-1.826693, -1.71317, -1.194748, 1, 1, 1, 1, 1,
-1.825281, -1.168963, -2.742831, 1, 1, 1, 1, 1,
-1.808759, 0.4538225, -0.6331249, 1, 1, 1, 1, 1,
-1.796319, -0.8769754, -0.8610735, 1, 1, 1, 1, 1,
-1.789111, 0.5284525, -2.061653, 0, 0, 1, 1, 1,
-1.783293, -2.130573, -2.818042, 1, 0, 0, 1, 1,
-1.77736, 0.5809108, -1.517796, 1, 0, 0, 1, 1,
-1.765546, 0.01253653, -3.135643, 1, 0, 0, 1, 1,
-1.762283, 0.1145815, -1.648369, 1, 0, 0, 1, 1,
-1.755982, 0.1096153, -1.417111, 1, 0, 0, 1, 1,
-1.749533, 0.4039776, -1.200468, 0, 0, 0, 1, 1,
-1.748379, -0.2511047, -0.9400848, 0, 0, 0, 1, 1,
-1.745926, 1.976286, -1.869381, 0, 0, 0, 1, 1,
-1.735963, -1.890344, -2.92067, 0, 0, 0, 1, 1,
-1.684502, -1.323311, -1.213511, 0, 0, 0, 1, 1,
-1.649366, 0.9739828, -1.278173, 0, 0, 0, 1, 1,
-1.643554, 1.532261, 0.01269291, 0, 0, 0, 1, 1,
-1.623151, 1.228965, -1.662298, 1, 1, 1, 1, 1,
-1.611648, 0.07957058, -1.164824, 1, 1, 1, 1, 1,
-1.610389, -0.1876735, -2.222688, 1, 1, 1, 1, 1,
-1.596023, -0.2408031, 0.1706275, 1, 1, 1, 1, 1,
-1.595713, 0.4068503, -2.371879, 1, 1, 1, 1, 1,
-1.588861, -0.1777235, -1.682303, 1, 1, 1, 1, 1,
-1.57523, -0.8126497, -1.045002, 1, 1, 1, 1, 1,
-1.566401, -1.151801, -0.4998986, 1, 1, 1, 1, 1,
-1.546725, 0.7288873, -0.135517, 1, 1, 1, 1, 1,
-1.533109, -0.7736027, -3.800823, 1, 1, 1, 1, 1,
-1.532974, -0.369994, -1.82929, 1, 1, 1, 1, 1,
-1.522273, -0.5055303, -2.892833, 1, 1, 1, 1, 1,
-1.50935, -0.4499744, -0.8407578, 1, 1, 1, 1, 1,
-1.503176, -2.720421, -2.924375, 1, 1, 1, 1, 1,
-1.488101, -0.5415885, -2.971627, 1, 1, 1, 1, 1,
-1.487127, -1.674518, -4.0846, 0, 0, 1, 1, 1,
-1.467497, -2.736286, -2.551795, 1, 0, 0, 1, 1,
-1.46567, 1.10259, 0.5880464, 1, 0, 0, 1, 1,
-1.459586, 0.08371548, -3.69875, 1, 0, 0, 1, 1,
-1.437039, -1.385479, -2.812524, 1, 0, 0, 1, 1,
-1.433918, 0.4430361, -1.477855, 1, 0, 0, 1, 1,
-1.416504, 1.704343, -0.9778986, 0, 0, 0, 1, 1,
-1.414456, -0.8411638, -2.383311, 0, 0, 0, 1, 1,
-1.412752, 0.1386409, -0.2797086, 0, 0, 0, 1, 1,
-1.412473, 0.2142523, -1.923072, 0, 0, 0, 1, 1,
-1.407924, 1.179967, -1.620925, 0, 0, 0, 1, 1,
-1.39897, -0.946746, -3.909574, 0, 0, 0, 1, 1,
-1.388495, 1.757901, -0.5928185, 0, 0, 0, 1, 1,
-1.376141, 1.404468, -0.08568115, 1, 1, 1, 1, 1,
-1.357939, 1.548525, -0.8580331, 1, 1, 1, 1, 1,
-1.357099, 0.0902463, -0.8898586, 1, 1, 1, 1, 1,
-1.350908, -1.367591, -1.763962, 1, 1, 1, 1, 1,
-1.343536, 0.5227708, -0.667883, 1, 1, 1, 1, 1,
-1.338779, 0.6327947, -2.711011, 1, 1, 1, 1, 1,
-1.32304, -1.618912, -3.565198, 1, 1, 1, 1, 1,
-1.320869, 0.6369528, 0.09303928, 1, 1, 1, 1, 1,
-1.311915, -1.117401, -2.006788, 1, 1, 1, 1, 1,
-1.307019, -0.5745062, -1.02144, 1, 1, 1, 1, 1,
-1.296735, -0.3169378, -1.823586, 1, 1, 1, 1, 1,
-1.291173, 0.5352891, -0.8257566, 1, 1, 1, 1, 1,
-1.29033, 1.0763, -0.234263, 1, 1, 1, 1, 1,
-1.278622, 0.7727846, -0.4322856, 1, 1, 1, 1, 1,
-1.27563, -0.823184, -0.9073693, 1, 1, 1, 1, 1,
-1.275478, -0.5607886, -3.716533, 0, 0, 1, 1, 1,
-1.274742, -0.2980317, -3.76842, 1, 0, 0, 1, 1,
-1.274484, -0.2943909, -0.2171727, 1, 0, 0, 1, 1,
-1.270538, 0.9775968, 0.7965459, 1, 0, 0, 1, 1,
-1.270521, -1.791971, -4.099847, 1, 0, 0, 1, 1,
-1.26984, -0.3119356, -1.018427, 1, 0, 0, 1, 1,
-1.264578, -0.02718964, -3.087687, 0, 0, 0, 1, 1,
-1.262347, -1.227477, -2.445463, 0, 0, 0, 1, 1,
-1.236223, -1.309218, -1.440273, 0, 0, 0, 1, 1,
-1.228417, -0.9122244, -0.7571825, 0, 0, 0, 1, 1,
-1.216138, -0.824012, -3.90647, 0, 0, 0, 1, 1,
-1.207829, 0.5458613, -1.786884, 0, 0, 0, 1, 1,
-1.202856, -0.7001619, -1.970909, 0, 0, 0, 1, 1,
-1.183938, -0.7087615, -2.123906, 1, 1, 1, 1, 1,
-1.182331, -0.6239095, -1.974096, 1, 1, 1, 1, 1,
-1.181243, 1.592954, 2.764517, 1, 1, 1, 1, 1,
-1.180986, -0.2457382, 0.2505412, 1, 1, 1, 1, 1,
-1.175511, 2.132389, -1.273677, 1, 1, 1, 1, 1,
-1.158019, 0.1110221, -2.192496, 1, 1, 1, 1, 1,
-1.154112, -1.274953, -0.7837349, 1, 1, 1, 1, 1,
-1.147499, 1.009851, -0.9486626, 1, 1, 1, 1, 1,
-1.141799, 1.136138, -2.210005, 1, 1, 1, 1, 1,
-1.127968, -2.385684, -3.694804, 1, 1, 1, 1, 1,
-1.127105, 0.441253, -0.1349642, 1, 1, 1, 1, 1,
-1.111562, 0.6289477, 0.2461222, 1, 1, 1, 1, 1,
-1.108655, -0.3390235, -3.020823, 1, 1, 1, 1, 1,
-1.102919, -0.382219, -3.02781, 1, 1, 1, 1, 1,
-1.101419, -1.218487, -3.146178, 1, 1, 1, 1, 1,
-1.093898, -1.281184, -2.79402, 0, 0, 1, 1, 1,
-1.068689, 0.58582, -0.7939802, 1, 0, 0, 1, 1,
-1.063572, 0.8589961, -0.1234169, 1, 0, 0, 1, 1,
-1.051933, 0.2750281, -2.566073, 1, 0, 0, 1, 1,
-1.045642, -0.1192145, -1.278328, 1, 0, 0, 1, 1,
-1.042035, 0.1790371, -2.047358, 1, 0, 0, 1, 1,
-1.040708, 0.3006716, -1.53461, 0, 0, 0, 1, 1,
-1.038806, 0.4682801, -2.603307, 0, 0, 0, 1, 1,
-1.036526, 0.05916663, 0.1011094, 0, 0, 0, 1, 1,
-1.033541, -1.262705, -2.939251, 0, 0, 0, 1, 1,
-1.033427, 0.8645517, -0.6750551, 0, 0, 0, 1, 1,
-1.032823, -0.6648712, -1.52107, 0, 0, 0, 1, 1,
-1.018968, -0.8148172, -2.645111, 0, 0, 0, 1, 1,
-1.012887, -0.7319617, -3.44185, 1, 1, 1, 1, 1,
-1.003407, 0.9882636, 0.2427918, 1, 1, 1, 1, 1,
-0.9920182, 3.812755, 1.441135, 1, 1, 1, 1, 1,
-0.9898816, -2.413323, -3.43437, 1, 1, 1, 1, 1,
-0.9854875, -2.732719, -1.327932, 1, 1, 1, 1, 1,
-0.9829974, 0.4451948, -0.5793915, 1, 1, 1, 1, 1,
-0.9765323, 0.06042697, -2.759881, 1, 1, 1, 1, 1,
-0.97535, 1.130147, -0.5155962, 1, 1, 1, 1, 1,
-0.974496, -0.994467, -1.982502, 1, 1, 1, 1, 1,
-0.9710547, -0.5988468, -2.773436, 1, 1, 1, 1, 1,
-0.9624367, 1.007865, -1.580702, 1, 1, 1, 1, 1,
-0.9615048, 1.622307, -0.2953151, 1, 1, 1, 1, 1,
-0.955817, 0.05336479, -2.139519, 1, 1, 1, 1, 1,
-0.9540878, 1.144825, -1.316119, 1, 1, 1, 1, 1,
-0.9524778, 1.445541, -1.702126, 1, 1, 1, 1, 1,
-0.9494599, 1.539489, -0.8073897, 0, 0, 1, 1, 1,
-0.9470516, 0.942421, -0.9408549, 1, 0, 0, 1, 1,
-0.9441543, -1.473635, -1.532747, 1, 0, 0, 1, 1,
-0.9436122, -1.514332, -2.699042, 1, 0, 0, 1, 1,
-0.9310183, 0.8081514, -0.2713758, 1, 0, 0, 1, 1,
-0.9198769, -1.248631, -3.054675, 1, 0, 0, 1, 1,
-0.9192226, -0.704587, -2.530916, 0, 0, 0, 1, 1,
-0.9187151, -0.04548134, -0.5138827, 0, 0, 0, 1, 1,
-0.9076584, 0.662456, -2.487993, 0, 0, 0, 1, 1,
-0.9052829, -0.1661529, -2.810199, 0, 0, 0, 1, 1,
-0.905167, -0.1053209, -1.062651, 0, 0, 0, 1, 1,
-0.8984411, -0.7154672, -1.201634, 0, 0, 0, 1, 1,
-0.8945656, 0.3426939, -2.706196, 0, 0, 0, 1, 1,
-0.8924326, -0.3929486, -0.5801288, 1, 1, 1, 1, 1,
-0.8903363, 0.61555, -1.783778, 1, 1, 1, 1, 1,
-0.8886507, 2.146051, -0.3189214, 1, 1, 1, 1, 1,
-0.8882436, 0.07703666, -1.253381, 1, 1, 1, 1, 1,
-0.8858257, 0.4996697, -0.7303538, 1, 1, 1, 1, 1,
-0.8851463, -2.561895, -2.279548, 1, 1, 1, 1, 1,
-0.8830472, 0.01375366, -2.875158, 1, 1, 1, 1, 1,
-0.8751559, 1.530441, -0.2242845, 1, 1, 1, 1, 1,
-0.8698628, 0.8002117, -1.108677, 1, 1, 1, 1, 1,
-0.8657857, 0.02584669, -2.142912, 1, 1, 1, 1, 1,
-0.8606107, -0.630609, -2.592131, 1, 1, 1, 1, 1,
-0.8589883, -0.3749098, -1.996915, 1, 1, 1, 1, 1,
-0.8573084, 0.09301626, -3.092088, 1, 1, 1, 1, 1,
-0.8508726, -2.104063, -4.445658, 1, 1, 1, 1, 1,
-0.8463674, -1.119227, -1.137675, 1, 1, 1, 1, 1,
-0.8453476, -0.6983274, -2.881678, 0, 0, 1, 1, 1,
-0.8445161, -1.370199, -3.510531, 1, 0, 0, 1, 1,
-0.8393982, 0.169454, 0.05491, 1, 0, 0, 1, 1,
-0.830909, -0.2458604, -1.642744, 1, 0, 0, 1, 1,
-0.8305625, -0.665715, -1.977615, 1, 0, 0, 1, 1,
-0.8245239, 0.6404374, -2.628838, 1, 0, 0, 1, 1,
-0.8187525, -0.9180928, -2.797612, 0, 0, 0, 1, 1,
-0.8184238, -1.029755, -2.381901, 0, 0, 0, 1, 1,
-0.8174559, -0.9847258, -2.30567, 0, 0, 0, 1, 1,
-0.8143378, -0.4261917, -3.506334, 0, 0, 0, 1, 1,
-0.8014528, 2.022019, -0.9940397, 0, 0, 0, 1, 1,
-0.8006821, 1.172319, -0.3633198, 0, 0, 0, 1, 1,
-0.799362, 0.8080943, -0.4417033, 0, 0, 0, 1, 1,
-0.7975705, -0.2322895, -2.285391, 1, 1, 1, 1, 1,
-0.7952218, 1.002272, 0.595503, 1, 1, 1, 1, 1,
-0.7892854, -0.8455761, -3.798728, 1, 1, 1, 1, 1,
-0.7833877, -0.4585222, -2.320038, 1, 1, 1, 1, 1,
-0.7682105, 0.3556221, 0.5646021, 1, 1, 1, 1, 1,
-0.7681226, -0.2139675, -1.461442, 1, 1, 1, 1, 1,
-0.7630442, -0.208771, -3.486366, 1, 1, 1, 1, 1,
-0.7618772, 1.594683, -0.4555557, 1, 1, 1, 1, 1,
-0.7597255, 0.8871298, -0.8188671, 1, 1, 1, 1, 1,
-0.758136, 1.253919, -2.373569, 1, 1, 1, 1, 1,
-0.7559888, 0.4148411, -1.651469, 1, 1, 1, 1, 1,
-0.7464737, -0.4565126, -3.516056, 1, 1, 1, 1, 1,
-0.7461752, 1.734891, -1.389789, 1, 1, 1, 1, 1,
-0.7411805, -0.4189659, -3.647177, 1, 1, 1, 1, 1,
-0.7408686, -0.9097294, -2.837038, 1, 1, 1, 1, 1,
-0.7370024, 2.433341, -1.757729, 0, 0, 1, 1, 1,
-0.7359546, 2.378845, -2.546294, 1, 0, 0, 1, 1,
-0.7347239, 0.3346083, 0.01719746, 1, 0, 0, 1, 1,
-0.7342002, -0.2693296, -2.775764, 1, 0, 0, 1, 1,
-0.7319565, -0.4718991, -2.563479, 1, 0, 0, 1, 1,
-0.7298296, 0.5231821, -1.040762, 1, 0, 0, 1, 1,
-0.7254727, 1.154595, -0.8755179, 0, 0, 0, 1, 1,
-0.7219126, 0.1021857, 1.550009, 0, 0, 0, 1, 1,
-0.7215642, -0.6211472, -1.65708, 0, 0, 0, 1, 1,
-0.7200978, -2.268854, -1.747403, 0, 0, 0, 1, 1,
-0.7196802, -0.2530399, -1.303281, 0, 0, 0, 1, 1,
-0.7169091, -0.2681182, -1.048604, 0, 0, 0, 1, 1,
-0.7083939, -0.01805722, -1.828006, 0, 0, 0, 1, 1,
-0.7083037, 0.8957976, -0.4890377, 1, 1, 1, 1, 1,
-0.7080162, -1.837188, -2.444341, 1, 1, 1, 1, 1,
-0.7064585, 0.3373854, -1.000346, 1, 1, 1, 1, 1,
-0.7041166, -0.6560871, -3.129028, 1, 1, 1, 1, 1,
-0.7038293, 1.494912, 0.08005917, 1, 1, 1, 1, 1,
-0.691796, -1.495585, -3.319699, 1, 1, 1, 1, 1,
-0.6902491, 0.262185, -2.150953, 1, 1, 1, 1, 1,
-0.6813035, -0.3609751, -2.446446, 1, 1, 1, 1, 1,
-0.6698442, 1.345679, 1.293263, 1, 1, 1, 1, 1,
-0.663621, -0.4769047, -1.453835, 1, 1, 1, 1, 1,
-0.6477944, -1.856295, -4.765512, 1, 1, 1, 1, 1,
-0.6474084, 0.9392419, 0.1304982, 1, 1, 1, 1, 1,
-0.6473132, 1.599156, -0.2176786, 1, 1, 1, 1, 1,
-0.6380069, 0.3360756, -1.946007, 1, 1, 1, 1, 1,
-0.6344376, -0.1975029, -2.436814, 1, 1, 1, 1, 1,
-0.6268005, -0.5293439, -3.777492, 0, 0, 1, 1, 1,
-0.6265082, -1.002705, -4.392192, 1, 0, 0, 1, 1,
-0.626358, -0.06685209, -1.397439, 1, 0, 0, 1, 1,
-0.6223441, -0.1579703, -0.4142049, 1, 0, 0, 1, 1,
-0.6215048, 0.5420409, 1.075527, 1, 0, 0, 1, 1,
-0.6180775, -0.866729, -2.306585, 1, 0, 0, 1, 1,
-0.6142869, -0.0976613, -1.559108, 0, 0, 0, 1, 1,
-0.6119729, -0.6991466, -0.8753235, 0, 0, 0, 1, 1,
-0.6067843, -0.5686044, -3.498506, 0, 0, 0, 1, 1,
-0.6058047, 0.21178, -2.107252, 0, 0, 0, 1, 1,
-0.6054531, 1.053203, -1.865019, 0, 0, 0, 1, 1,
-0.6024522, 0.4400569, -0.2518528, 0, 0, 0, 1, 1,
-0.6003183, -0.9646807, -2.579841, 0, 0, 0, 1, 1,
-0.6001515, 0.1459762, -1.843492, 1, 1, 1, 1, 1,
-0.5965819, 0.4054699, -1.54652, 1, 1, 1, 1, 1,
-0.5883722, 0.7310057, 0.7061375, 1, 1, 1, 1, 1,
-0.5869778, 0.3578686, 1.321675, 1, 1, 1, 1, 1,
-0.5852336, 0.1815522, -2.216733, 1, 1, 1, 1, 1,
-0.5829701, -0.422422, -2.882173, 1, 1, 1, 1, 1,
-0.5795189, -0.3656099, -1.193589, 1, 1, 1, 1, 1,
-0.5770493, 0.8738317, 0.1615626, 1, 1, 1, 1, 1,
-0.5717167, -0.2442939, -0.8550584, 1, 1, 1, 1, 1,
-0.5705664, -0.5904689, -1.818042, 1, 1, 1, 1, 1,
-0.57034, 0.498993, -1.545557, 1, 1, 1, 1, 1,
-0.5657487, 1.104843, 0.04662232, 1, 1, 1, 1, 1,
-0.5650585, -0.03481876, -2.729226, 1, 1, 1, 1, 1,
-0.5643229, 1.031555, -1.180264, 1, 1, 1, 1, 1,
-0.5592922, 0.09948587, -0.8262854, 1, 1, 1, 1, 1,
-0.5589499, -0.8697453, -0.800647, 0, 0, 1, 1, 1,
-0.5547783, -1.472315, -3.983088, 1, 0, 0, 1, 1,
-0.5539246, 0.6451735, -2.442608, 1, 0, 0, 1, 1,
-0.5534642, -0.2074518, -1.522583, 1, 0, 0, 1, 1,
-0.5523486, 0.7103385, -1.497789, 1, 0, 0, 1, 1,
-0.5488224, 0.2801041, -1.771254, 1, 0, 0, 1, 1,
-0.5451284, -1.761482, -1.805993, 0, 0, 0, 1, 1,
-0.5395299, -0.3429361, -2.04058, 0, 0, 0, 1, 1,
-0.5383226, 0.1970876, -1.990545, 0, 0, 0, 1, 1,
-0.5374191, 0.8693095, 0.0551223, 0, 0, 0, 1, 1,
-0.5318009, -0.5200337, -2.996372, 0, 0, 0, 1, 1,
-0.5288903, -1.142614, -2.660555, 0, 0, 0, 1, 1,
-0.5287391, -1.373197, -2.679294, 0, 0, 0, 1, 1,
-0.5279922, 0.1294594, -1.741298, 1, 1, 1, 1, 1,
-0.5267639, -0.6220895, -3.188067, 1, 1, 1, 1, 1,
-0.5265591, 0.503612, -0.05953661, 1, 1, 1, 1, 1,
-0.5240737, -2.022214, -4.793743, 1, 1, 1, 1, 1,
-0.5058696, -0.9030023, -2.693747, 1, 1, 1, 1, 1,
-0.5052443, -0.2225587, -0.8733996, 1, 1, 1, 1, 1,
-0.5003949, 1.040028, -0.8946868, 1, 1, 1, 1, 1,
-0.4989018, -0.5311755, -3.496549, 1, 1, 1, 1, 1,
-0.497168, -1.966759, -3.618472, 1, 1, 1, 1, 1,
-0.4917815, -0.1245799, -1.740631, 1, 1, 1, 1, 1,
-0.4864539, -0.890348, -3.514123, 1, 1, 1, 1, 1,
-0.485985, -2.065892, -4.000314, 1, 1, 1, 1, 1,
-0.4815665, 1.964738, -1.412367, 1, 1, 1, 1, 1,
-0.4793169, 1.583894, -1.53918, 1, 1, 1, 1, 1,
-0.4775645, -0.7820683, -3.479239, 1, 1, 1, 1, 1,
-0.4750498, -0.4106416, -1.7916, 0, 0, 1, 1, 1,
-0.4700219, 0.1538676, 0.04115992, 1, 0, 0, 1, 1,
-0.4696921, 1.186037, 1.045462, 1, 0, 0, 1, 1,
-0.4686542, 0.8290275, -1.247446, 1, 0, 0, 1, 1,
-0.4676619, 0.3938725, -0.468069, 1, 0, 0, 1, 1,
-0.4664706, 1.223008, 0.6193777, 1, 0, 0, 1, 1,
-0.4635254, 0.948182, -0.01331907, 0, 0, 0, 1, 1,
-0.4620968, 0.7146221, -1.350073, 0, 0, 0, 1, 1,
-0.4587111, -1.934798, -3.198826, 0, 0, 0, 1, 1,
-0.4586372, 0.8600836, -0.92875, 0, 0, 0, 1, 1,
-0.4569547, -1.509781, -2.501175, 0, 0, 0, 1, 1,
-0.4486885, -1.833125, -1.935883, 0, 0, 0, 1, 1,
-0.4479564, 1.648332, 0.3902462, 0, 0, 0, 1, 1,
-0.4422382, -0.7691419, -1.742264, 1, 1, 1, 1, 1,
-0.4419711, 0.3811501, -0.7200074, 1, 1, 1, 1, 1,
-0.4373106, -0.2820024, -2.681158, 1, 1, 1, 1, 1,
-0.4330674, -0.3234374, -4.096653, 1, 1, 1, 1, 1,
-0.427707, 1.248179, -0.614377, 1, 1, 1, 1, 1,
-0.4271524, 1.260299, 0.7795388, 1, 1, 1, 1, 1,
-0.4269368, -0.2894123, -0.9219467, 1, 1, 1, 1, 1,
-0.4238037, -1.171146, -4.011249, 1, 1, 1, 1, 1,
-0.418541, 0.1876107, -0.6811896, 1, 1, 1, 1, 1,
-0.4176311, 1.182976, 0.1523769, 1, 1, 1, 1, 1,
-0.4173334, 0.8196734, -1.048146, 1, 1, 1, 1, 1,
-0.4164508, -0.8161201, -2.719172, 1, 1, 1, 1, 1,
-0.4126193, 1.305841, -1.404045, 1, 1, 1, 1, 1,
-0.4125012, -0.7412192, -5.311542, 1, 1, 1, 1, 1,
-0.410629, 0.1762377, 0.4048868, 1, 1, 1, 1, 1,
-0.4044501, 1.53416, 0.1980472, 0, 0, 1, 1, 1,
-0.4030726, -0.1181781, 0.673164, 1, 0, 0, 1, 1,
-0.3996604, 0.1205583, -0.3041346, 1, 0, 0, 1, 1,
-0.3975695, 1.324551, -0.0278022, 1, 0, 0, 1, 1,
-0.396945, 0.5012479, -1.940482, 1, 0, 0, 1, 1,
-0.3957443, 0.4688574, -1.157123, 1, 0, 0, 1, 1,
-0.3926706, 1.144231, -2.45703, 0, 0, 0, 1, 1,
-0.3893838, -0.4544908, -2.073795, 0, 0, 0, 1, 1,
-0.3890975, -1.160583, -2.439118, 0, 0, 0, 1, 1,
-0.3878827, 0.7567433, -1.263666, 0, 0, 0, 1, 1,
-0.3858334, 1.462995, 0.08588176, 0, 0, 0, 1, 1,
-0.3856166, 0.3942045, -0.4061215, 0, 0, 0, 1, 1,
-0.3840615, -1.198383, -1.683126, 0, 0, 0, 1, 1,
-0.3793701, 0.5960094, -0.2467012, 1, 1, 1, 1, 1,
-0.379359, 1.588112, 0.5699648, 1, 1, 1, 1, 1,
-0.3792903, -0.7280324, -1.956387, 1, 1, 1, 1, 1,
-0.3786001, 0.9377114, -0.0322914, 1, 1, 1, 1, 1,
-0.3766043, -1.223231, -2.644838, 1, 1, 1, 1, 1,
-0.3750479, 0.7093651, -0.5832815, 1, 1, 1, 1, 1,
-0.3662199, 0.8814828, -0.9205964, 1, 1, 1, 1, 1,
-0.3604533, -1.558596, -2.613928, 1, 1, 1, 1, 1,
-0.3596961, 2.031953, -0.7597765, 1, 1, 1, 1, 1,
-0.3595418, 0.895952, -0.0759209, 1, 1, 1, 1, 1,
-0.3559244, 0.7694654, 1.151837, 1, 1, 1, 1, 1,
-0.3556714, -0.006103971, -1.776369, 1, 1, 1, 1, 1,
-0.3554094, 0.1882132, -2.355176, 1, 1, 1, 1, 1,
-0.354084, 0.5370511, -0.08615312, 1, 1, 1, 1, 1,
-0.3536668, 2.450133, -0.3429541, 1, 1, 1, 1, 1,
-0.3531365, 0.4898946, -0.7437546, 0, 0, 1, 1, 1,
-0.3500273, -0.4188102, -2.577324, 1, 0, 0, 1, 1,
-0.3495898, -0.2313955, -3.108483, 1, 0, 0, 1, 1,
-0.3483735, -1.455657, -3.753271, 1, 0, 0, 1, 1,
-0.343907, 0.8651489, -2.058547, 1, 0, 0, 1, 1,
-0.3421414, -1.05527, -4.552261, 1, 0, 0, 1, 1,
-0.3393149, 0.02454434, -2.301061, 0, 0, 0, 1, 1,
-0.3376672, 0.8606352, -0.2872919, 0, 0, 0, 1, 1,
-0.3375093, 0.274422, 0.1759668, 0, 0, 0, 1, 1,
-0.3349596, -0.1491075, -0.5084969, 0, 0, 0, 1, 1,
-0.3284056, -0.08099999, -0.99135, 0, 0, 0, 1, 1,
-0.3282956, -0.617978, -1.449711, 0, 0, 0, 1, 1,
-0.3223728, 0.9557796, 0.08760248, 0, 0, 0, 1, 1,
-0.3192788, -0.3274607, -2.14898, 1, 1, 1, 1, 1,
-0.3107624, -0.001165173, -1.318338, 1, 1, 1, 1, 1,
-0.3056872, 1.084785, -1.09426, 1, 1, 1, 1, 1,
-0.3039597, 0.4816209, -0.3371317, 1, 1, 1, 1, 1,
-0.3015608, -1.229026, -3.091288, 1, 1, 1, 1, 1,
-0.2983842, -0.379054, -1.23675, 1, 1, 1, 1, 1,
-0.296546, -0.1748712, -1.558193, 1, 1, 1, 1, 1,
-0.2962259, -1.167421, -1.796558, 1, 1, 1, 1, 1,
-0.2945122, 2.558609, -0.6016371, 1, 1, 1, 1, 1,
-0.2935121, 0.4183816, 0.3739589, 1, 1, 1, 1, 1,
-0.2933784, -0.7113786, -2.696393, 1, 1, 1, 1, 1,
-0.2929131, 0.9358791, -1.398133, 1, 1, 1, 1, 1,
-0.2865222, -0.8433877, -3.365487, 1, 1, 1, 1, 1,
-0.2864159, 0.553365, -0.9596567, 1, 1, 1, 1, 1,
-0.2857931, 0.7885581, -0.4434357, 1, 1, 1, 1, 1,
-0.2834591, -0.2092495, -4.451269, 0, 0, 1, 1, 1,
-0.2809574, -1.338852, -2.509536, 1, 0, 0, 1, 1,
-0.2809476, -0.4365066, -3.022376, 1, 0, 0, 1, 1,
-0.2757862, 0.3066552, -2.413613, 1, 0, 0, 1, 1,
-0.2679874, 0.1265267, 1.112735, 1, 0, 0, 1, 1,
-0.2667345, 1.971935, -0.852376, 1, 0, 0, 1, 1,
-0.2640229, 1.85045, 0.7759367, 0, 0, 0, 1, 1,
-0.2593031, -1.076455, -1.837806, 0, 0, 0, 1, 1,
-0.2579859, -0.5931531, -2.212951, 0, 0, 0, 1, 1,
-0.2500055, -1.168397, -3.309473, 0, 0, 0, 1, 1,
-0.2443645, 1.237443, -0.325166, 0, 0, 0, 1, 1,
-0.2425193, -0.1579329, -4.259919, 0, 0, 0, 1, 1,
-0.2422529, -0.06071273, -2.618409, 0, 0, 0, 1, 1,
-0.23903, -0.3585276, -1.795043, 1, 1, 1, 1, 1,
-0.2363934, -0.7993081, -2.516707, 1, 1, 1, 1, 1,
-0.2359754, -1.919846, -3.179118, 1, 1, 1, 1, 1,
-0.2351162, -1.081597, -2.037591, 1, 1, 1, 1, 1,
-0.2350754, 0.4054263, -2.247335, 1, 1, 1, 1, 1,
-0.234895, 1.904053, -0.04432707, 1, 1, 1, 1, 1,
-0.2341537, -0.1902181, -2.946474, 1, 1, 1, 1, 1,
-0.2338752, 0.9056302, 0.8809978, 1, 1, 1, 1, 1,
-0.2312498, 0.3499831, 1.244147, 1, 1, 1, 1, 1,
-0.2236637, -0.2951214, -3.385448, 1, 1, 1, 1, 1,
-0.2235333, -0.3376216, -1.949766, 1, 1, 1, 1, 1,
-0.2201707, -0.4674908, -4.239316, 1, 1, 1, 1, 1,
-0.2147488, -0.9158946, -2.387914, 1, 1, 1, 1, 1,
-0.2125575, -0.05163307, -2.527813, 1, 1, 1, 1, 1,
-0.2075378, -2.408511, -2.616736, 1, 1, 1, 1, 1,
-0.2066266, -0.4822042, -3.069203, 0, 0, 1, 1, 1,
-0.2060975, 0.2109583, -1.697322, 1, 0, 0, 1, 1,
-0.2028952, 0.08067445, -3.182622, 1, 0, 0, 1, 1,
-0.2002605, -1.101329, -3.584322, 1, 0, 0, 1, 1,
-0.1988015, -0.4757347, -3.660834, 1, 0, 0, 1, 1,
-0.1982673, 0.7884261, -1.022281, 1, 0, 0, 1, 1,
-0.1951278, -0.3295961, -2.124115, 0, 0, 0, 1, 1,
-0.194851, -0.7075511, -2.394642, 0, 0, 0, 1, 1,
-0.1896634, -1.711213, -3.07833, 0, 0, 0, 1, 1,
-0.1858636, -0.6748681, -2.940627, 0, 0, 0, 1, 1,
-0.1832489, 0.497759, -2.549762, 0, 0, 0, 1, 1,
-0.1825938, -1.512259, -2.923575, 0, 0, 0, 1, 1,
-0.1715427, -0.5225385, -3.855544, 0, 0, 0, 1, 1,
-0.1654787, 0.4984713, 0.4123104, 1, 1, 1, 1, 1,
-0.1628712, 0.8166965, 0.05041126, 1, 1, 1, 1, 1,
-0.1627175, 1.46631, 0.7864325, 1, 1, 1, 1, 1,
-0.1615586, -0.6412864, -2.248616, 1, 1, 1, 1, 1,
-0.1578882, -0.1149789, -1.71407, 1, 1, 1, 1, 1,
-0.1561526, -0.554347, -1.6338, 1, 1, 1, 1, 1,
-0.1501883, -1.115574, -2.981905, 1, 1, 1, 1, 1,
-0.1480538, -0.3478681, -2.796402, 1, 1, 1, 1, 1,
-0.1450274, 2.400612, -0.3941926, 1, 1, 1, 1, 1,
-0.1426407, 0.4624981, -0.7284067, 1, 1, 1, 1, 1,
-0.1424624, -0.3093039, -3.216969, 1, 1, 1, 1, 1,
-0.1423413, 1.133875, 0.8293098, 1, 1, 1, 1, 1,
-0.1369006, -1.464697, -1.816731, 1, 1, 1, 1, 1,
-0.1342335, 1.118158, -0.4046417, 1, 1, 1, 1, 1,
-0.132572, -0.4854061, -1.91192, 1, 1, 1, 1, 1,
-0.1310804, -1.755859, -4.157147, 0, 0, 1, 1, 1,
-0.1299173, 1.269606, 2.348423, 1, 0, 0, 1, 1,
-0.1264895, -0.7277059, -2.824258, 1, 0, 0, 1, 1,
-0.1258652, 0.7749425, 0.6818681, 1, 0, 0, 1, 1,
-0.1240929, 0.7267228, 0.2042655, 1, 0, 0, 1, 1,
-0.1182862, -0.005792927, -0.1122744, 1, 0, 0, 1, 1,
-0.1181961, 2.218845, -0.7105058, 0, 0, 0, 1, 1,
-0.1081494, -0.7327164, -3.387794, 0, 0, 0, 1, 1,
-0.107888, 0.5603216, -0.6714803, 0, 0, 0, 1, 1,
-0.1072131, 0.3430082, 1.786301, 0, 0, 0, 1, 1,
-0.1059379, -0.6554068, -1.831899, 0, 0, 0, 1, 1,
-0.1016457, 2.090953, -0.4496443, 0, 0, 0, 1, 1,
-0.0995345, 1.200423, -0.2559731, 0, 0, 0, 1, 1,
-0.09295967, -0.3176816, -1.022541, 1, 1, 1, 1, 1,
-0.09030871, -1.079292, -3.330811, 1, 1, 1, 1, 1,
-0.08775984, -2.743728, -3.360765, 1, 1, 1, 1, 1,
-0.08671752, 0.3995792, 0.1915527, 1, 1, 1, 1, 1,
-0.0852665, -1.117666, -2.9598, 1, 1, 1, 1, 1,
-0.0828123, -0.108008, -0.3133862, 1, 1, 1, 1, 1,
-0.08266097, 0.3571503, 2.093311, 1, 1, 1, 1, 1,
-0.0797716, -0.3756082, -3.222345, 1, 1, 1, 1, 1,
-0.07628679, 0.9308403, -1.461785, 1, 1, 1, 1, 1,
-0.07536747, 0.9623291, 1.27791, 1, 1, 1, 1, 1,
-0.07477471, 1.490219, -0.02065656, 1, 1, 1, 1, 1,
-0.07378095, 0.1894176, 1.079351, 1, 1, 1, 1, 1,
-0.07096419, -2.051107, -1.420542, 1, 1, 1, 1, 1,
-0.06708067, -1.023574, -1.990183, 1, 1, 1, 1, 1,
-0.06614751, 0.08045162, -1.755769, 1, 1, 1, 1, 1,
-0.06376818, -0.7211744, -2.290832, 0, 0, 1, 1, 1,
-0.06197738, 0.1181252, 0.205893, 1, 0, 0, 1, 1,
-0.06184338, -1.079782, -2.140321, 1, 0, 0, 1, 1,
-0.06135121, -1.058968, -4.177493, 1, 0, 0, 1, 1,
-0.05797946, -0.9448093, -3.348414, 1, 0, 0, 1, 1,
-0.05433877, -0.258466, -3.396516, 1, 0, 0, 1, 1,
-0.04875171, -0.02234017, -1.978513, 0, 0, 0, 1, 1,
-0.04603153, 1.552935, -0.5138005, 0, 0, 0, 1, 1,
-0.04225412, 0.3310408, -0.7161446, 0, 0, 0, 1, 1,
-0.04053624, 0.1648572, 0.9856067, 0, 0, 0, 1, 1,
-0.03900645, 1.078268, 0.8151159, 0, 0, 0, 1, 1,
-0.03843893, 0.05531413, -2.264103, 0, 0, 0, 1, 1,
-0.0352787, -0.9893215, -3.26629, 0, 0, 0, 1, 1,
-0.03524677, -0.06124597, -4.649824, 1, 1, 1, 1, 1,
-0.03019798, -0.9933439, -2.284999, 1, 1, 1, 1, 1,
-0.02919624, 0.9824018, -1.107555, 1, 1, 1, 1, 1,
-0.01794261, -0.751153, -4.295129, 1, 1, 1, 1, 1,
-0.01610334, -1.295687, -3.853085, 1, 1, 1, 1, 1,
-0.01560443, -0.6175001, -2.79664, 1, 1, 1, 1, 1,
-0.01382399, -1.011078, -3.325911, 1, 1, 1, 1, 1,
-0.01054765, -0.6074746, -1.814624, 1, 1, 1, 1, 1,
-0.01042918, 0.8058451, 0.5027332, 1, 1, 1, 1, 1,
-0.009488582, -0.602448, -2.644808, 1, 1, 1, 1, 1,
-0.009087255, -0.4934969, -3.557576, 1, 1, 1, 1, 1,
-0.005486546, -0.6555763, -5.359531, 1, 1, 1, 1, 1,
-0.004716837, 0.2670856, 2.809459, 1, 1, 1, 1, 1,
-0.004203387, 0.3374522, -0.5139878, 1, 1, 1, 1, 1,
-0.003827528, 2.733928, -2.139006, 1, 1, 1, 1, 1,
0.001702921, -0.7264141, 1.926816, 0, 0, 1, 1, 1,
0.002630079, 2.265157, -0.3433133, 1, 0, 0, 1, 1,
0.003029194, -0.7115275, 2.648642, 1, 0, 0, 1, 1,
0.005414161, -0.5286261, 3.806303, 1, 0, 0, 1, 1,
0.006981067, 0.1855155, 0.9680944, 1, 0, 0, 1, 1,
0.0104531, 1.859737, -0.7809255, 1, 0, 0, 1, 1,
0.0112578, 2.665381, 0.2834368, 0, 0, 0, 1, 1,
0.01484157, -1.834903, 2.822182, 0, 0, 0, 1, 1,
0.01767383, -1.547958, 4.912426, 0, 0, 0, 1, 1,
0.02142389, 0.1165495, -0.1962663, 0, 0, 0, 1, 1,
0.02613297, -0.8715719, 2.96324, 0, 0, 0, 1, 1,
0.02729455, -1.374622, 3.606059, 0, 0, 0, 1, 1,
0.02794533, -1.148896, 2.624193, 0, 0, 0, 1, 1,
0.03329334, -0.8947243, 4.247012, 1, 1, 1, 1, 1,
0.03376015, 0.01839568, 0.197505, 1, 1, 1, 1, 1,
0.03494981, -0.5601502, 3.977199, 1, 1, 1, 1, 1,
0.03815312, 0.7795514, -0.6902525, 1, 1, 1, 1, 1,
0.03834904, -0.4624914, 3.234643, 1, 1, 1, 1, 1,
0.04492999, 2.173584, 0.1939012, 1, 1, 1, 1, 1,
0.04916983, 0.1544685, 0.2925493, 1, 1, 1, 1, 1,
0.05203161, -0.9835098, 3.373195, 1, 1, 1, 1, 1,
0.05471075, -0.7704034, 2.600434, 1, 1, 1, 1, 1,
0.05762171, -0.9888985, 4.74754, 1, 1, 1, 1, 1,
0.06055376, 1.41, -0.3832784, 1, 1, 1, 1, 1,
0.06157528, -1.446397, 2.983029, 1, 1, 1, 1, 1,
0.06254847, -1.596465, 2.737966, 1, 1, 1, 1, 1,
0.06540316, 0.5500351, 1.162197, 1, 1, 1, 1, 1,
0.0684737, -0.7524344, 2.52072, 1, 1, 1, 1, 1,
0.07093479, 1.960643, -1.328923, 0, 0, 1, 1, 1,
0.07245309, 0.9533054, -0.06674031, 1, 0, 0, 1, 1,
0.07309091, -0.2596984, 2.247309, 1, 0, 0, 1, 1,
0.07399329, 0.03958691, 1.403352, 1, 0, 0, 1, 1,
0.07482389, -0.4949432, 3.815162, 1, 0, 0, 1, 1,
0.07652451, -0.3529493, 3.851333, 1, 0, 0, 1, 1,
0.07814878, 1.160837, 1.962034, 0, 0, 0, 1, 1,
0.07838997, -0.7800523, 3.021355, 0, 0, 0, 1, 1,
0.08767281, -0.04307079, 1.866783, 0, 0, 0, 1, 1,
0.09186122, 0.5217583, 0.3528145, 0, 0, 0, 1, 1,
0.09437864, -0.7496391, 3.961096, 0, 0, 0, 1, 1,
0.1018647, 1.866124, 0.5260851, 0, 0, 0, 1, 1,
0.1028069, 0.9726629, 1.19436, 0, 0, 0, 1, 1,
0.104886, -0.9287316, 2.84839, 1, 1, 1, 1, 1,
0.105584, 0.6346163, 1.212215, 1, 1, 1, 1, 1,
0.1075903, -1.194806, 4.142962, 1, 1, 1, 1, 1,
0.1079227, -1.148507, 3.673993, 1, 1, 1, 1, 1,
0.1079572, 1.045104, 1.031354, 1, 1, 1, 1, 1,
0.1080586, -0.005274198, 3.092409, 1, 1, 1, 1, 1,
0.114146, 0.6824235, -1.361058, 1, 1, 1, 1, 1,
0.1174134, 1.394555, -1.446384, 1, 1, 1, 1, 1,
0.1217141, -0.7508705, 3.01908, 1, 1, 1, 1, 1,
0.1224653, 0.9300765, -1.341695, 1, 1, 1, 1, 1,
0.123713, -0.770068, 2.540836, 1, 1, 1, 1, 1,
0.1250861, 1.055817, 0.7936187, 1, 1, 1, 1, 1,
0.1257082, 1.175045, -0.5586902, 1, 1, 1, 1, 1,
0.1261701, 0.8296205, 0.5917148, 1, 1, 1, 1, 1,
0.1289953, 0.243933, -0.2028748, 1, 1, 1, 1, 1,
0.1296025, -0.5634892, 3.324251, 0, 0, 1, 1, 1,
0.1324578, -0.07826409, 4.398637, 1, 0, 0, 1, 1,
0.1328111, -0.8554879, 2.09766, 1, 0, 0, 1, 1,
0.1335863, 1.979595, -0.6074035, 1, 0, 0, 1, 1,
0.1338159, -1.539604, 2.924833, 1, 0, 0, 1, 1,
0.1391351, 0.01566945, 2.053632, 1, 0, 0, 1, 1,
0.1424041, 0.626325, -0.4731471, 0, 0, 0, 1, 1,
0.1495639, -0.8840714, 2.592024, 0, 0, 0, 1, 1,
0.1495729, -2.182595, 3.781286, 0, 0, 0, 1, 1,
0.1496319, -1.28945, 2.372134, 0, 0, 0, 1, 1,
0.1517588, 0.2745637, 0.6841484, 0, 0, 0, 1, 1,
0.1547084, -2.295434, 1.811802, 0, 0, 0, 1, 1,
0.1614067, -1.294403, 0.9298081, 0, 0, 0, 1, 1,
0.1623596, -0.547499, 3.566142, 1, 1, 1, 1, 1,
0.1769634, -0.1499644, 2.821025, 1, 1, 1, 1, 1,
0.1802594, -0.9074713, 2.87763, 1, 1, 1, 1, 1,
0.1827779, 0.4536915, -0.03486335, 1, 1, 1, 1, 1,
0.1831567, -0.3298732, 2.720418, 1, 1, 1, 1, 1,
0.1884632, -1.871432, 4.274585, 1, 1, 1, 1, 1,
0.1892183, 2.301462, 0.7435827, 1, 1, 1, 1, 1,
0.1952116, 0.8049436, 0.4452059, 1, 1, 1, 1, 1,
0.1953489, -2.433927, 2.585366, 1, 1, 1, 1, 1,
0.196076, -0.2549875, 4.026359, 1, 1, 1, 1, 1,
0.2002513, -1.09301, 2.510416, 1, 1, 1, 1, 1,
0.20275, -0.702358, 1.011854, 1, 1, 1, 1, 1,
0.2038123, 0.2422005, 1.17315, 1, 1, 1, 1, 1,
0.2049798, 0.4410874, 0.9272637, 1, 1, 1, 1, 1,
0.2055803, -0.8307644, 3.268832, 1, 1, 1, 1, 1,
0.206589, 1.136812, 2.304616, 0, 0, 1, 1, 1,
0.207696, 0.06193016, 1.986231, 1, 0, 0, 1, 1,
0.2142038, 0.1953495, 0.8066677, 1, 0, 0, 1, 1,
0.2161779, 0.943485, 1.455679, 1, 0, 0, 1, 1,
0.217764, -1.423584, 2.532427, 1, 0, 0, 1, 1,
0.2229705, 0.3954601, -0.02555269, 1, 0, 0, 1, 1,
0.2265052, -0.1484232, 1.7671, 0, 0, 0, 1, 1,
0.2281049, 0.5676878, 0.2330783, 0, 0, 0, 1, 1,
0.2285518, 0.9811156, -0.7890481, 0, 0, 0, 1, 1,
0.2289297, -0.6696454, 4.738041, 0, 0, 0, 1, 1,
0.2291968, 0.9914496, -1.141687, 0, 0, 0, 1, 1,
0.2368336, -0.488239, 1.360076, 0, 0, 0, 1, 1,
0.2422098, -0.5036424, 1.267646, 0, 0, 0, 1, 1,
0.2459006, 0.8532837, 0.2592989, 1, 1, 1, 1, 1,
0.2466793, 1.006771, -0.5462509, 1, 1, 1, 1, 1,
0.2530607, -1.828167, 1.893356, 1, 1, 1, 1, 1,
0.2539695, 0.3987902, -0.6220745, 1, 1, 1, 1, 1,
0.2562564, 0.907081, -0.8372731, 1, 1, 1, 1, 1,
0.2614929, 0.8654646, 0.3012363, 1, 1, 1, 1, 1,
0.2631388, 0.1256435, 1.212011, 1, 1, 1, 1, 1,
0.2664193, 1.777889, 2.082468, 1, 1, 1, 1, 1,
0.273888, 0.3691309, 0.5710445, 1, 1, 1, 1, 1,
0.2739175, -1.885461, 1.193235, 1, 1, 1, 1, 1,
0.2748863, -0.215691, 0.7616839, 1, 1, 1, 1, 1,
0.275732, 0.4331546, 2.162992, 1, 1, 1, 1, 1,
0.2799086, 0.9670677, 1.036469, 1, 1, 1, 1, 1,
0.2839574, 0.6236754, 1.300364, 1, 1, 1, 1, 1,
0.2844747, 0.6414455, -1.858767, 1, 1, 1, 1, 1,
0.2857326, 1.142214, 1.174594, 0, 0, 1, 1, 1,
0.2861357, 0.2408899, 1.045277, 1, 0, 0, 1, 1,
0.2877408, 0.01052962, 2.241583, 1, 0, 0, 1, 1,
0.287944, -0.828784, 2.870222, 1, 0, 0, 1, 1,
0.2912186, -0.1728722, 2.346039, 1, 0, 0, 1, 1,
0.2959434, -1.043866, 3.013638, 1, 0, 0, 1, 1,
0.2962829, 0.2868416, 1.398755, 0, 0, 0, 1, 1,
0.2986378, 1.000989, -0.2054947, 0, 0, 0, 1, 1,
0.3038963, 0.09858523, 0.2457829, 0, 0, 0, 1, 1,
0.3038991, 2.017412, 0.1180596, 0, 0, 0, 1, 1,
0.3055665, 1.169512, 0.8046965, 0, 0, 0, 1, 1,
0.3056881, 0.8743629, 0.003551674, 0, 0, 0, 1, 1,
0.3072878, 0.8886406, 1.754016, 0, 0, 0, 1, 1,
0.3116287, -0.5074692, 3.293316, 1, 1, 1, 1, 1,
0.3138417, -1.605009, 3.615829, 1, 1, 1, 1, 1,
0.3149601, -0.2519553, 2.832717, 1, 1, 1, 1, 1,
0.3151041, 0.618809, -0.2907116, 1, 1, 1, 1, 1,
0.3159212, 0.8014085, -0.7658065, 1, 1, 1, 1, 1,
0.3188679, -0.9976121, 2.355206, 1, 1, 1, 1, 1,
0.3202243, -0.1365284, 1.722438, 1, 1, 1, 1, 1,
0.3232612, 0.3895297, 2.865341, 1, 1, 1, 1, 1,
0.3332745, -0.8120553, 2.992433, 1, 1, 1, 1, 1,
0.3341885, -0.1292637, -0.03189559, 1, 1, 1, 1, 1,
0.3366881, -0.06370623, 2.342714, 1, 1, 1, 1, 1,
0.336899, -0.2216709, 1.198223, 1, 1, 1, 1, 1,
0.3375418, -0.3536796, 2.81044, 1, 1, 1, 1, 1,
0.3426515, -2.32018, 3.561918, 1, 1, 1, 1, 1,
0.3433338, -1.133347, 3.173004, 1, 1, 1, 1, 1,
0.3519631, 0.2921076, -0.4723695, 0, 0, 1, 1, 1,
0.354325, -1.699365, 2.45562, 1, 0, 0, 1, 1,
0.3572582, 0.2013015, -0.06028493, 1, 0, 0, 1, 1,
0.3610762, -0.9576186, 0.39369, 1, 0, 0, 1, 1,
0.3611797, 0.4813356, 0.8457875, 1, 0, 0, 1, 1,
0.3725753, 0.1857745, 1.069834, 1, 0, 0, 1, 1,
0.3731375, 0.07026956, 1.091448, 0, 0, 0, 1, 1,
0.3777365, -1.074888, 1.813707, 0, 0, 0, 1, 1,
0.3851253, -1.614205, 2.990016, 0, 0, 0, 1, 1,
0.3886344, -0.8225737, 0.7048936, 0, 0, 0, 1, 1,
0.3910172, -0.3707237, 2.755308, 0, 0, 0, 1, 1,
0.3956057, -0.2046441, 2.780991, 0, 0, 0, 1, 1,
0.396836, 0.03311032, -0.1182983, 0, 0, 0, 1, 1,
0.397218, 0.9431314, -0.08679996, 1, 1, 1, 1, 1,
0.398181, -0.3399161, 2.04158, 1, 1, 1, 1, 1,
0.3986106, -0.3306108, 2.12204, 1, 1, 1, 1, 1,
0.3989508, -0.06949284, -0.7508061, 1, 1, 1, 1, 1,
0.4027898, -1.567813, 2.191434, 1, 1, 1, 1, 1,
0.4031387, 1.160898, 0.9156516, 1, 1, 1, 1, 1,
0.4034563, -0.1020554, 2.738469, 1, 1, 1, 1, 1,
0.4104316, -0.7649624, 5.69289, 1, 1, 1, 1, 1,
0.4157934, 0.4389618, 1.148749, 1, 1, 1, 1, 1,
0.4211902, -0.9033214, 2.843283, 1, 1, 1, 1, 1,
0.4213337, 0.9771743, 1.060921, 1, 1, 1, 1, 1,
0.4292645, 1.121413, -0.684066, 1, 1, 1, 1, 1,
0.430534, 0.2590654, 1.147811, 1, 1, 1, 1, 1,
0.4409452, 1.156203, -1.015803, 1, 1, 1, 1, 1,
0.4412812, 0.03687081, 1.43953, 1, 1, 1, 1, 1,
0.4481321, 0.5633159, 1.50028, 0, 0, 1, 1, 1,
0.4532513, -1.809194, 2.042792, 1, 0, 0, 1, 1,
0.4537219, -1.335278, 3.928587, 1, 0, 0, 1, 1,
0.4544874, 0.4615195, 1.759908, 1, 0, 0, 1, 1,
0.4556906, 0.8898891, 1.536485, 1, 0, 0, 1, 1,
0.4569688, -1.00093, 0.7886121, 1, 0, 0, 1, 1,
0.4618339, -0.09355102, 0.5003872, 0, 0, 0, 1, 1,
0.462806, 1.489683, 1.867769, 0, 0, 0, 1, 1,
0.4645832, -0.7287181, 1.473795, 0, 0, 0, 1, 1,
0.4689516, 1.402649, -0.7226771, 0, 0, 0, 1, 1,
0.4712509, -0.499963, 2.223502, 0, 0, 0, 1, 1,
0.4753051, -1.285413, 0.986855, 0, 0, 0, 1, 1,
0.4774514, -1.587099, 3.552878, 0, 0, 0, 1, 1,
0.4787939, 0.6775243, -0.2390973, 1, 1, 1, 1, 1,
0.4790562, -1.913706, 2.503083, 1, 1, 1, 1, 1,
0.4867783, -0.6647499, 1.79691, 1, 1, 1, 1, 1,
0.4903865, 1.178509, -0.6861064, 1, 1, 1, 1, 1,
0.4915728, 1.397961, -0.180903, 1, 1, 1, 1, 1,
0.496283, 0.5695645, -1.107491, 1, 1, 1, 1, 1,
0.4982452, 0.2545046, 1.927708, 1, 1, 1, 1, 1,
0.4983791, -0.9484194, 1.286582, 1, 1, 1, 1, 1,
0.4988294, 0.5207193, -0.4646734, 1, 1, 1, 1, 1,
0.5081766, 0.299366, 1.804374, 1, 1, 1, 1, 1,
0.5100999, -0.8489901, 3.133669, 1, 1, 1, 1, 1,
0.5121307, 0.9821139, -0.6941398, 1, 1, 1, 1, 1,
0.5151059, 0.9522336, 0.1555995, 1, 1, 1, 1, 1,
0.5166115, -1.816089, 3.136639, 1, 1, 1, 1, 1,
0.518796, -0.5913836, 4.605258, 1, 1, 1, 1, 1,
0.5194774, 0.0006005409, 1.147731, 0, 0, 1, 1, 1,
0.5200294, 0.2539826, 1.517729, 1, 0, 0, 1, 1,
0.5223375, -1.911589, 1.76644, 1, 0, 0, 1, 1,
0.5262001, 1.247502, 0.6463602, 1, 0, 0, 1, 1,
0.5273232, -2.421028, 4.832996, 1, 0, 0, 1, 1,
0.5290874, -3.482767, 4.105385, 1, 0, 0, 1, 1,
0.5308747, 0.2181887, -0.5477797, 0, 0, 0, 1, 1,
0.5320212, -0.9352292, 3.61163, 0, 0, 0, 1, 1,
0.5320522, 1.624592, 0.4790097, 0, 0, 0, 1, 1,
0.5356272, -2.869329, 1.512162, 0, 0, 0, 1, 1,
0.5410975, -2.527896, 2.836861, 0, 0, 0, 1, 1,
0.5417031, 0.06089999, 1.933228, 0, 0, 0, 1, 1,
0.5426755, 0.1415341, 2.602577, 0, 0, 0, 1, 1,
0.5440227, -0.9527149, 3.95988, 1, 1, 1, 1, 1,
0.5449589, 1.859724, -1.098082, 1, 1, 1, 1, 1,
0.5470284, -0.6554, 1.702802, 1, 1, 1, 1, 1,
0.5510526, 0.226391, -1.167496, 1, 1, 1, 1, 1,
0.5522946, -2.031592, 0.7650918, 1, 1, 1, 1, 1,
0.5531893, -0.8589536, 2.487224, 1, 1, 1, 1, 1,
0.5548749, -0.06907883, 1.552256, 1, 1, 1, 1, 1,
0.5565761, 0.3898549, 0.4437183, 1, 1, 1, 1, 1,
0.5583084, -0.1601576, 2.231707, 1, 1, 1, 1, 1,
0.560208, 0.3446973, 0.8618542, 1, 1, 1, 1, 1,
0.5661594, 0.3583965, 0.9612882, 1, 1, 1, 1, 1,
0.567131, 1.90968, 0.2595652, 1, 1, 1, 1, 1,
0.5682544, 0.2257416, 0.8576732, 1, 1, 1, 1, 1,
0.5727513, 0.7330362, 0.3843386, 1, 1, 1, 1, 1,
0.5735353, -1.292049, 2.999972, 1, 1, 1, 1, 1,
0.5781631, -0.3166642, 2.533665, 0, 0, 1, 1, 1,
0.5854705, -0.438919, 2.369781, 1, 0, 0, 1, 1,
0.5855503, 0.7530925, 1.08597, 1, 0, 0, 1, 1,
0.5877424, 0.2894305, 2.592031, 1, 0, 0, 1, 1,
0.6002108, 1.662311, 1.631526, 1, 0, 0, 1, 1,
0.6022851, -1.208461, 2.891091, 1, 0, 0, 1, 1,
0.6092535, -0.5562323, 1.194257, 0, 0, 0, 1, 1,
0.6113517, -1.024951, 2.839966, 0, 0, 0, 1, 1,
0.6114654, 0.3368239, -0.010935, 0, 0, 0, 1, 1,
0.6123936, -0.6760724, 0.929992, 0, 0, 0, 1, 1,
0.6129503, 0.9031233, 1.101836, 0, 0, 0, 1, 1,
0.617522, 0.03459169, 3.142892, 0, 0, 0, 1, 1,
0.6244407, 0.2075402, 2.051498, 0, 0, 0, 1, 1,
0.6274919, -0.2877256, 2.292009, 1, 1, 1, 1, 1,
0.6291519, 0.2060777, 2.241649, 1, 1, 1, 1, 1,
0.6295537, -0.51902, 1.819857, 1, 1, 1, 1, 1,
0.6297827, 1.819538, -0.2381682, 1, 1, 1, 1, 1,
0.6351323, -0.5188496, 3.659637, 1, 1, 1, 1, 1,
0.6378655, 0.3931543, -0.2898281, 1, 1, 1, 1, 1,
0.639358, 1.111891, 0.3184355, 1, 1, 1, 1, 1,
0.639713, -1.161588, 2.326574, 1, 1, 1, 1, 1,
0.6417173, -1.935678, 4.029723, 1, 1, 1, 1, 1,
0.6455911, -0.6148118, 3.066115, 1, 1, 1, 1, 1,
0.6469336, 1.835924, 0.1820834, 1, 1, 1, 1, 1,
0.6472313, -1.144221, 1.540032, 1, 1, 1, 1, 1,
0.6478381, -1.426063, 4.531537, 1, 1, 1, 1, 1,
0.6480548, -0.7087339, 2.931105, 1, 1, 1, 1, 1,
0.6513093, 0.1467674, 1.561934, 1, 1, 1, 1, 1,
0.6586324, -0.672023, 0.508103, 0, 0, 1, 1, 1,
0.6598597, 0.8294272, 0.1564924, 1, 0, 0, 1, 1,
0.6633724, -1.57053, 1.109729, 1, 0, 0, 1, 1,
0.6686314, -0.1970859, 1.664619, 1, 0, 0, 1, 1,
0.6710841, 0.6724078, 1.259591, 1, 0, 0, 1, 1,
0.6735536, -0.09765541, 1.521587, 1, 0, 0, 1, 1,
0.6784018, 1.718572, 1.021774, 0, 0, 0, 1, 1,
0.680553, 0.1334103, 3.049551, 0, 0, 0, 1, 1,
0.6859431, 1.005664, 0.4926327, 0, 0, 0, 1, 1,
0.6906571, -1.371907, 3.379028, 0, 0, 0, 1, 1,
0.699526, 0.5061569, 2.206586, 0, 0, 0, 1, 1,
0.7001266, 1.311964, 0.9230585, 0, 0, 0, 1, 1,
0.7007864, -0.18827, 1.072905, 0, 0, 0, 1, 1,
0.7026582, -1.336699, 2.058454, 1, 1, 1, 1, 1,
0.7044787, 1.479476, 0.6738848, 1, 1, 1, 1, 1,
0.7045627, -0.5071092, 2.335323, 1, 1, 1, 1, 1,
0.7223204, -1.227626, 2.506627, 1, 1, 1, 1, 1,
0.7252313, -0.1212011, 2.404457, 1, 1, 1, 1, 1,
0.7336649, -3.912177, 3.341719, 1, 1, 1, 1, 1,
0.7348518, 1.422852, -0.1671948, 1, 1, 1, 1, 1,
0.7356572, -0.682102, 1.593204, 1, 1, 1, 1, 1,
0.7356724, 0.3064496, 1.168455, 1, 1, 1, 1, 1,
0.7364796, -0.08873205, 0.6693565, 1, 1, 1, 1, 1,
0.7417382, -0.1078996, 1.786315, 1, 1, 1, 1, 1,
0.743503, -0.9643565, 4.026322, 1, 1, 1, 1, 1,
0.7462177, 0.5341182, 1.026272, 1, 1, 1, 1, 1,
0.7467242, 0.1542188, 0.8057682, 1, 1, 1, 1, 1,
0.7475659, 0.4124762, 1.38199, 1, 1, 1, 1, 1,
0.7504321, -1.694913, 2.019437, 0, 0, 1, 1, 1,
0.7521845, -1.492729, 2.056541, 1, 0, 0, 1, 1,
0.7582594, -0.09940049, 2.230688, 1, 0, 0, 1, 1,
0.7617896, -0.03661763, 1.280415, 1, 0, 0, 1, 1,
0.7685854, 1.1841, -0.5664518, 1, 0, 0, 1, 1,
0.7761726, 0.3012013, 1.098843, 1, 0, 0, 1, 1,
0.7769442, 1.649056, -1.558942, 0, 0, 0, 1, 1,
0.7783636, 0.5065494, 1.939875, 0, 0, 0, 1, 1,
0.7842091, 0.362201, 1.384448, 0, 0, 0, 1, 1,
0.7872741, 0.2227657, 1.109882, 0, 0, 0, 1, 1,
0.792699, 0.4411558, 0.1273391, 0, 0, 0, 1, 1,
0.7948657, 1.803195, -0.3466437, 0, 0, 0, 1, 1,
0.7948859, -2.310137, 2.634023, 0, 0, 0, 1, 1,
0.7967729, -0.8184842, 1.682243, 1, 1, 1, 1, 1,
0.799808, -0.2377233, 0.3679929, 1, 1, 1, 1, 1,
0.8029473, 1.806068, 0.698805, 1, 1, 1, 1, 1,
0.805638, 0.5753322, -0.06665435, 1, 1, 1, 1, 1,
0.806967, 0.5710627, 0.5517326, 1, 1, 1, 1, 1,
0.8071872, 1.545848, 0.6773674, 1, 1, 1, 1, 1,
0.811078, 0.4099858, 2.412339, 1, 1, 1, 1, 1,
0.8120341, -0.530492, 1.529037, 1, 1, 1, 1, 1,
0.8143789, 0.8655642, 1.353482, 1, 1, 1, 1, 1,
0.8177419, 0.03852586, 0.5317759, 1, 1, 1, 1, 1,
0.8182119, 0.4696869, 0.7439127, 1, 1, 1, 1, 1,
0.8184943, -0.1549417, 2.216815, 1, 1, 1, 1, 1,
0.8189862, 0.1108565, 1.465659, 1, 1, 1, 1, 1,
0.8308405, -0.6130175, 1.431574, 1, 1, 1, 1, 1,
0.8335416, 1.768288, -0.3580076, 1, 1, 1, 1, 1,
0.8367279, -1.768626, 1.938306, 0, 0, 1, 1, 1,
0.8404257, -0.2790637, 2.594828, 1, 0, 0, 1, 1,
0.8418651, -3.006716, 4.128197, 1, 0, 0, 1, 1,
0.8495235, 0.5384903, 0.9586936, 1, 0, 0, 1, 1,
0.8513883, -0.4894835, 1.326715, 1, 0, 0, 1, 1,
0.8568216, 1.558062, -0.3571407, 1, 0, 0, 1, 1,
0.8613135, 0.2591558, -0.04070557, 0, 0, 0, 1, 1,
0.8615222, -0.1855709, 2.002306, 0, 0, 0, 1, 1,
0.8713152, 0.07212458, 2.921359, 0, 0, 0, 1, 1,
0.8801852, -0.3257104, 0.4966561, 0, 0, 0, 1, 1,
0.8877811, 1.294152, 0.07070582, 0, 0, 0, 1, 1,
0.888317, -0.9179031, 3.773228, 0, 0, 0, 1, 1,
0.892303, 0.4797709, 2.370711, 0, 0, 0, 1, 1,
0.8953547, -1.032628, 1.217246, 1, 1, 1, 1, 1,
0.8957435, -0.4401802, 1.160096, 1, 1, 1, 1, 1,
0.9023154, 2.297249, 0.5761808, 1, 1, 1, 1, 1,
0.9068357, 0.05245493, 3.191224, 1, 1, 1, 1, 1,
0.9077901, 0.7356949, -0.2310565, 1, 1, 1, 1, 1,
0.9180052, -0.05787971, 0.8246449, 1, 1, 1, 1, 1,
0.9183077, -0.2773165, 0.9725516, 1, 1, 1, 1, 1,
0.9200842, -0.6618663, 1.132371, 1, 1, 1, 1, 1,
0.9213417, -0.5096305, 1.935518, 1, 1, 1, 1, 1,
0.9307069, -0.2697476, 2.312836, 1, 1, 1, 1, 1,
0.9320015, 0.4241765, 2.926056, 1, 1, 1, 1, 1,
0.9355708, -1.437557, 2.357347, 1, 1, 1, 1, 1,
0.9376616, -1.180306, 2.309249, 1, 1, 1, 1, 1,
0.9432765, -0.4668086, 2.501498, 1, 1, 1, 1, 1,
0.9436347, 0.02612158, 0.9574496, 1, 1, 1, 1, 1,
0.944277, -0.5410315, 1.59534, 0, 0, 1, 1, 1,
0.9454746, 1.978064, 1.197044, 1, 0, 0, 1, 1,
0.9515137, -1.147319, 4.147076, 1, 0, 0, 1, 1,
0.9530239, -0.6541923, 0.3992234, 1, 0, 0, 1, 1,
0.9537563, 0.5008659, 1.200888, 1, 0, 0, 1, 1,
0.9545534, 0.3233444, 0.2475954, 1, 0, 0, 1, 1,
0.9631834, -0.4632817, 1.028635, 0, 0, 0, 1, 1,
0.9665728, 1.008825, 0.6516631, 0, 0, 0, 1, 1,
0.9676401, -0.185114, 2.852743, 0, 0, 0, 1, 1,
0.9691018, -1.072524, 2.799972, 0, 0, 0, 1, 1,
0.9778064, 0.5580569, 1.570682, 0, 0, 0, 1, 1,
0.9802474, 0.6755602, -0.03344933, 0, 0, 0, 1, 1,
0.9824879, -0.5321759, 1.066813, 0, 0, 0, 1, 1,
0.9957793, 0.9947654, 0.5156413, 1, 1, 1, 1, 1,
0.9988138, -0.6152561, 2.574614, 1, 1, 1, 1, 1,
0.9994151, 0.04627311, 2.227754, 1, 1, 1, 1, 1,
1.001683, -0.02858758, 2.527633, 1, 1, 1, 1, 1,
1.004934, 0.0332329, 1.990546, 1, 1, 1, 1, 1,
1.005391, -0.5458097, 2.14212, 1, 1, 1, 1, 1,
1.006459, 0.6996157, 0.3986872, 1, 1, 1, 1, 1,
1.007561, -0.5307789, 1.875116, 1, 1, 1, 1, 1,
1.008622, 0.6030361, -0.7187238, 1, 1, 1, 1, 1,
1.015572, 0.1884772, 1.210379, 1, 1, 1, 1, 1,
1.019096, -0.475845, 2.718669, 1, 1, 1, 1, 1,
1.023857, -2.745111, 3.922168, 1, 1, 1, 1, 1,
1.024668, -1.141414, 2.445064, 1, 1, 1, 1, 1,
1.02536, -1.248664, 2.190099, 1, 1, 1, 1, 1,
1.028856, 1.922962, -0.09623744, 1, 1, 1, 1, 1,
1.032575, -0.2206194, 1.790267, 0, 0, 1, 1, 1,
1.034858, 0.09731776, 1.752646, 1, 0, 0, 1, 1,
1.037233, 0.9320882, -0.6232832, 1, 0, 0, 1, 1,
1.041066, -1.000993, 3.279683, 1, 0, 0, 1, 1,
1.04402, 2.233326, 0.3832673, 1, 0, 0, 1, 1,
1.051058, -0.1820272, 2.521335, 1, 0, 0, 1, 1,
1.05198, -0.3842707, 2.394442, 0, 0, 0, 1, 1,
1.060532, 0.3840376, 1.766127, 0, 0, 0, 1, 1,
1.061664, 1.121937, 0.323696, 0, 0, 0, 1, 1,
1.062125, 0.4714978, 1.05482, 0, 0, 0, 1, 1,
1.068251, 1.247663, -1.534356, 0, 0, 0, 1, 1,
1.068327, 0.7538873, 0.08436766, 0, 0, 0, 1, 1,
1.068384, -0.4234747, 2.600914, 0, 0, 0, 1, 1,
1.079558, 0.07172735, 0.2921433, 1, 1, 1, 1, 1,
1.079998, -1.130304, 3.285754, 1, 1, 1, 1, 1,
1.088005, -0.1601409, -1.470693, 1, 1, 1, 1, 1,
1.092365, 0.7107385, 1.814564, 1, 1, 1, 1, 1,
1.096632, -0.5592992, 1.491198, 1, 1, 1, 1, 1,
1.100975, -0.3901088, 2.393095, 1, 1, 1, 1, 1,
1.118607, -2.483599, 3.345095, 1, 1, 1, 1, 1,
1.119417, 0.3829413, 2.387913, 1, 1, 1, 1, 1,
1.120888, 1.079885, -0.3885283, 1, 1, 1, 1, 1,
1.121965, -1.659212, 1.673274, 1, 1, 1, 1, 1,
1.128041, 0.3150234, 1.663404, 1, 1, 1, 1, 1,
1.129191, -1.146183, 3.705992, 1, 1, 1, 1, 1,
1.13165, -1.066975, 3.190327, 1, 1, 1, 1, 1,
1.135113, 0.287927, 1.376928, 1, 1, 1, 1, 1,
1.140031, -0.1810265, 2.413222, 1, 1, 1, 1, 1,
1.156669, 0.8455342, 1.179047, 0, 0, 1, 1, 1,
1.171839, 0.162294, 1.287151, 1, 0, 0, 1, 1,
1.175608, 0.6425778, 0.7836013, 1, 0, 0, 1, 1,
1.177022, 0.9018157, 3.413491, 1, 0, 0, 1, 1,
1.179251, -1.040576, 2.572162, 1, 0, 0, 1, 1,
1.185717, 0.3267563, 0.7080413, 1, 0, 0, 1, 1,
1.186462, -1.784706, 2.677914, 0, 0, 0, 1, 1,
1.186778, 0.5085948, 0.4723758, 0, 0, 0, 1, 1,
1.196231, -0.1906818, 4.032634, 0, 0, 0, 1, 1,
1.200583, 0.5266347, 1.409749, 0, 0, 0, 1, 1,
1.216853, -1.036809, 2.921895, 0, 0, 0, 1, 1,
1.218154, -1.091298, 1.568255, 0, 0, 0, 1, 1,
1.225418, 1.898851, -0.4852758, 0, 0, 0, 1, 1,
1.226916, 0.1250814, 0.4695013, 1, 1, 1, 1, 1,
1.244142, 0.6753462, 1.159867, 1, 1, 1, 1, 1,
1.244814, -0.9179552, 2.297641, 1, 1, 1, 1, 1,
1.246348, 0.7020252, 0.6025926, 1, 1, 1, 1, 1,
1.251694, -1.436131, 3.28306, 1, 1, 1, 1, 1,
1.252181, 0.9561687, 2.242359, 1, 1, 1, 1, 1,
1.268978, -0.1080342, 1.940133, 1, 1, 1, 1, 1,
1.269141, -0.7441547, -0.05778529, 1, 1, 1, 1, 1,
1.282496, -0.5126522, 2.597088, 1, 1, 1, 1, 1,
1.292638, 0.5390205, 0.1025275, 1, 1, 1, 1, 1,
1.295931, -1.807842, 2.521207, 1, 1, 1, 1, 1,
1.298286, -0.006547468, 1.437261, 1, 1, 1, 1, 1,
1.306667, 0.290769, 0.5021251, 1, 1, 1, 1, 1,
1.307701, 0.2199305, 2.597704, 1, 1, 1, 1, 1,
1.310802, 1.741649, 2.189316, 1, 1, 1, 1, 1,
1.318705, -0.8446324, 1.502587, 0, 0, 1, 1, 1,
1.324538, 0.6888949, 0.7778505, 1, 0, 0, 1, 1,
1.342729, -1.06403, 2.40818, 1, 0, 0, 1, 1,
1.342781, -0.9299025, 0.2534117, 1, 0, 0, 1, 1,
1.346717, 0.9392115, 0.6985453, 1, 0, 0, 1, 1,
1.34915, 0.08998799, 3.704641, 1, 0, 0, 1, 1,
1.360181, 0.1346174, 1.508278, 0, 0, 0, 1, 1,
1.361325, -0.1704773, 1.091038, 0, 0, 0, 1, 1,
1.363259, 0.2104801, 1.598453, 0, 0, 0, 1, 1,
1.365498, 0.2274916, 1.60019, 0, 0, 0, 1, 1,
1.369812, 0.8818126, 2.231865, 0, 0, 0, 1, 1,
1.378294, 0.3209479, 1.215439, 0, 0, 0, 1, 1,
1.384292, 0.4966394, -0.5912392, 0, 0, 0, 1, 1,
1.390767, -0.8925123, 3.533999, 1, 1, 1, 1, 1,
1.397417, 3.174536, -0.9900339, 1, 1, 1, 1, 1,
1.39851, -1.205971, 2.9148, 1, 1, 1, 1, 1,
1.399378, -2.803096, 3.754797, 1, 1, 1, 1, 1,
1.402856, -0.97546, 2.789215, 1, 1, 1, 1, 1,
1.407584, 0.5866548, 1.522364, 1, 1, 1, 1, 1,
1.408664, -0.2613488, 1.42025, 1, 1, 1, 1, 1,
1.421374, -0.1155854, 1.85379, 1, 1, 1, 1, 1,
1.42452, 0.7229972, -0.5112475, 1, 1, 1, 1, 1,
1.437124, -0.4495261, 1.290752, 1, 1, 1, 1, 1,
1.444786, -1.020814, 2.109989, 1, 1, 1, 1, 1,
1.453443, -0.3915135, 1.742916, 1, 1, 1, 1, 1,
1.458436, -1.218646, 2.052923, 1, 1, 1, 1, 1,
1.468445, -0.8404313, 1.838794, 1, 1, 1, 1, 1,
1.488448, 0.4936381, 2.863577, 1, 1, 1, 1, 1,
1.489343, 1.412369, 0.2738964, 0, 0, 1, 1, 1,
1.495173, -2.288018, 3.625885, 1, 0, 0, 1, 1,
1.496829, 0.12417, 0.9588203, 1, 0, 0, 1, 1,
1.502038, -0.8684074, 1.271687, 1, 0, 0, 1, 1,
1.508513, 1.119545, 1.958988, 1, 0, 0, 1, 1,
1.510469, 0.6696324, 2.539008, 1, 0, 0, 1, 1,
1.514072, -0.756546, 0.9912358, 0, 0, 0, 1, 1,
1.526992, 0.468694, 3.016308, 0, 0, 0, 1, 1,
1.533886, -1.24867, 3.019674, 0, 0, 0, 1, 1,
1.542529, -0.7738128, 1.013181, 0, 0, 0, 1, 1,
1.555598, 1.083349, 0.0726379, 0, 0, 0, 1, 1,
1.561624, 1.530873, -0.7275938, 0, 0, 0, 1, 1,
1.57395, -0.6401832, 1.884557, 0, 0, 0, 1, 1,
1.574759, 1.587322, 0.3120416, 1, 1, 1, 1, 1,
1.58882, -0.6241455, -0.5514229, 1, 1, 1, 1, 1,
1.589927, -2.032272, 2.937108, 1, 1, 1, 1, 1,
1.595436, 0.6591473, 3.905937, 1, 1, 1, 1, 1,
1.601383, -0.3326323, 0.3356354, 1, 1, 1, 1, 1,
1.613733, 0.3682538, 0.5680888, 1, 1, 1, 1, 1,
1.618209, -0.7285562, 2.185708, 1, 1, 1, 1, 1,
1.620663, -1.381145, 1.471101, 1, 1, 1, 1, 1,
1.634335, -0.5855483, 1.024449, 1, 1, 1, 1, 1,
1.645009, -1.576513, 2.904551, 1, 1, 1, 1, 1,
1.645858, -1.973725, 3.780325, 1, 1, 1, 1, 1,
1.647174, 2.051665, -1.399971, 1, 1, 1, 1, 1,
1.650826, -0.5612878, 0.6205885, 1, 1, 1, 1, 1,
1.651515, 0.02587841, 3.431871, 1, 1, 1, 1, 1,
1.654099, -1.519504, 4.338293, 1, 1, 1, 1, 1,
1.661296, -0.2186679, 1.605187, 0, 0, 1, 1, 1,
1.68434, 1.448094, -0.9674118, 1, 0, 0, 1, 1,
1.697104, -1.102423, 2.971917, 1, 0, 0, 1, 1,
1.698452, 0.07903755, 0.5270739, 1, 0, 0, 1, 1,
1.705554, 0.665575, 1.207767, 1, 0, 0, 1, 1,
1.707067, -1.074412, 2.385696, 1, 0, 0, 1, 1,
1.707674, 0.4555583, -0.6677198, 0, 0, 0, 1, 1,
1.70861, 1.020633, 1.249778, 0, 0, 0, 1, 1,
1.714553, -0.03082247, 1.39741, 0, 0, 0, 1, 1,
1.716715, 0.5146911, 0.9712524, 0, 0, 0, 1, 1,
1.727608, -0.3213851, 3.685193, 0, 0, 0, 1, 1,
1.749419, -0.3050039, -0.2277289, 0, 0, 0, 1, 1,
1.768432, -0.3530023, 1.438913, 0, 0, 0, 1, 1,
1.78622, -0.3441523, 3.44484, 1, 1, 1, 1, 1,
1.804375, -0.47133, 2.418384, 1, 1, 1, 1, 1,
1.807296, -0.7256463, 2.627247, 1, 1, 1, 1, 1,
1.822531, -1.184722, 1.04869, 1, 1, 1, 1, 1,
1.826778, -0.1754277, 1.249323, 1, 1, 1, 1, 1,
1.833349, 0.1923153, 0.5240345, 1, 1, 1, 1, 1,
1.839658, -0.1496855, 2.827398, 1, 1, 1, 1, 1,
1.85759, 0.1348896, 2.700831, 1, 1, 1, 1, 1,
1.869439, -0.05610962, 1.957345, 1, 1, 1, 1, 1,
1.872523, 1.085892, 2.138408, 1, 1, 1, 1, 1,
1.905744, -0.1472111, 0.5194454, 1, 1, 1, 1, 1,
1.924107, -0.05888551, 1.403179, 1, 1, 1, 1, 1,
1.929947, -1.299411, 0.5986748, 1, 1, 1, 1, 1,
1.930689, -0.7114866, 2.82115, 1, 1, 1, 1, 1,
1.935553, -1.189508, 0.5048892, 1, 1, 1, 1, 1,
1.946381, -0.2189752, 2.03469, 0, 0, 1, 1, 1,
1.993731, 0.1828082, 3.007214, 1, 0, 0, 1, 1,
1.997473, 2.565205, 1.579884, 1, 0, 0, 1, 1,
2.024769, 1.459388, 0.5700402, 1, 0, 0, 1, 1,
2.08161, 0.9117717, 0.6861294, 1, 0, 0, 1, 1,
2.085127, -1.589206, 2.098258, 1, 0, 0, 1, 1,
2.100811, -0.6415574, 2.226927, 0, 0, 0, 1, 1,
2.107342, 0.4799978, 1.347032, 0, 0, 0, 1, 1,
2.118409, 0.1695239, 1.661166, 0, 0, 0, 1, 1,
2.169591, -0.04835264, 0.3716612, 0, 0, 0, 1, 1,
2.186943, -0.4577345, 2.62521, 0, 0, 0, 1, 1,
2.198884, 1.129864, 0.3904145, 0, 0, 0, 1, 1,
2.252772, -0.1559655, 1.938389, 0, 0, 0, 1, 1,
2.302157, -0.8778006, 2.248243, 1, 1, 1, 1, 1,
2.314118, 1.138472, -0.07353077, 1, 1, 1, 1, 1,
2.315613, 0.08420063, 0.8340827, 1, 1, 1, 1, 1,
2.402243, 1.166127, 1.578492, 1, 1, 1, 1, 1,
2.437583, 0.2770567, 1.958689, 1, 1, 1, 1, 1,
2.484594, 0.5642928, 0.7271339, 1, 1, 1, 1, 1,
3.301658, 0.4481746, 2.32149, 1, 1, 1, 1, 1
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
var radius = 10.02876;
var distance = 35.2256;
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
mvMatrix.translate( -0.1924328, 0.04971075, -0.1666791 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.2256);
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
