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
-3.08292, -1.028037, -1.757986, 1, 0, 0, 1,
-2.891411, 1.167566, -1.071261, 1, 0.007843138, 0, 1,
-2.558481, 1.622104, -0.7418475, 1, 0.01176471, 0, 1,
-2.541104, -0.1795667, -2.071184, 1, 0.01960784, 0, 1,
-2.515918, -0.650169, -2.221404, 1, 0.02352941, 0, 1,
-2.51088, -0.2069432, -2.024842, 1, 0.03137255, 0, 1,
-2.48216, 0.1299548, -2.044925, 1, 0.03529412, 0, 1,
-2.436323, -1.027504, -1.68551, 1, 0.04313726, 0, 1,
-2.427992, -0.1268704, -1.983198, 1, 0.04705882, 0, 1,
-2.339583, 0.001162494, 0.1279736, 1, 0.05490196, 0, 1,
-2.336833, -0.5632449, -1.074426, 1, 0.05882353, 0, 1,
-2.24895, 0.6366329, -1.53688, 1, 0.06666667, 0, 1,
-2.239838, -0.7007365, -1.063406, 1, 0.07058824, 0, 1,
-2.232249, 0.1081112, -1.754598, 1, 0.07843138, 0, 1,
-2.228747, -0.02757129, -1.369845, 1, 0.08235294, 0, 1,
-2.183083, 1.458919, -0.0318181, 1, 0.09019608, 0, 1,
-2.123135, 0.9334616, -0.4308969, 1, 0.09411765, 0, 1,
-2.115135, 0.2242021, -2.156654, 1, 0.1019608, 0, 1,
-2.108856, -0.1203068, -2.665141, 1, 0.1098039, 0, 1,
-2.066825, -2.332357, -3.740709, 1, 0.1137255, 0, 1,
-2.040907, -0.1328966, -2.852562, 1, 0.1215686, 0, 1,
-2.029749, 1.746753, 0.5512875, 1, 0.1254902, 0, 1,
-2.019733, -0.5290093, -1.537957, 1, 0.1333333, 0, 1,
-2.01884, -0.2864619, -0.8377128, 1, 0.1372549, 0, 1,
-2.014168, 0.1042015, -2.623098, 1, 0.145098, 0, 1,
-1.986834, 0.9753603, -3.152719, 1, 0.1490196, 0, 1,
-1.943332, 0.5046756, -1.109934, 1, 0.1568628, 0, 1,
-1.914414, 2.437433, -0.3089872, 1, 0.1607843, 0, 1,
-1.912155, 0.3469001, -1.106388, 1, 0.1686275, 0, 1,
-1.896969, -0.6279858, -1.21174, 1, 0.172549, 0, 1,
-1.896282, -0.3595173, -1.293502, 1, 0.1803922, 0, 1,
-1.893844, 0.2240441, -2.094969, 1, 0.1843137, 0, 1,
-1.887265, -0.227942, -5.223194, 1, 0.1921569, 0, 1,
-1.880204, -0.9143618, -2.044375, 1, 0.1960784, 0, 1,
-1.808613, -0.7381346, -1.315139, 1, 0.2039216, 0, 1,
-1.805977, 0.06683691, 0.1052618, 1, 0.2117647, 0, 1,
-1.77847, -1.054657, -2.488926, 1, 0.2156863, 0, 1,
-1.769146, 1.434326, -1.919491, 1, 0.2235294, 0, 1,
-1.760542, -0.3844192, -1.03908, 1, 0.227451, 0, 1,
-1.760221, 2.577508, 0.924329, 1, 0.2352941, 0, 1,
-1.747844, 0.02112385, -1.344979, 1, 0.2392157, 0, 1,
-1.736637, 0.4173623, 0.104573, 1, 0.2470588, 0, 1,
-1.72808, 0.6858049, -2.145869, 1, 0.2509804, 0, 1,
-1.725464, -0.6614569, -1.753884, 1, 0.2588235, 0, 1,
-1.716421, -0.6826862, -2.401625, 1, 0.2627451, 0, 1,
-1.700401, -1.11003, -1.727015, 1, 0.2705882, 0, 1,
-1.6791, 1.840084, -0.8329847, 1, 0.2745098, 0, 1,
-1.673417, -1.310985, -2.610977, 1, 0.282353, 0, 1,
-1.667011, 0.7384052, -0.7142618, 1, 0.2862745, 0, 1,
-1.66312, 1.301908, -1.171498, 1, 0.2941177, 0, 1,
-1.659913, -0.1427201, -1.990714, 1, 0.3019608, 0, 1,
-1.644282, -0.3545696, -2.49938, 1, 0.3058824, 0, 1,
-1.634573, -0.4057745, -2.186267, 1, 0.3137255, 0, 1,
-1.629407, 1.116738, -1.309553, 1, 0.3176471, 0, 1,
-1.628811, 0.8013167, -1.813427, 1, 0.3254902, 0, 1,
-1.618115, 1.013627, -0.8880184, 1, 0.3294118, 0, 1,
-1.594077, 0.9776136, -1.212919, 1, 0.3372549, 0, 1,
-1.584359, -1.711158, -1.878582, 1, 0.3411765, 0, 1,
-1.57955, 0.616484, -0.8453693, 1, 0.3490196, 0, 1,
-1.578835, 0.4008571, -2.388659, 1, 0.3529412, 0, 1,
-1.556888, 0.5709942, -1.739104, 1, 0.3607843, 0, 1,
-1.543522, 0.8423835, -0.2738225, 1, 0.3647059, 0, 1,
-1.539711, 0.9502636, -1.250994, 1, 0.372549, 0, 1,
-1.538342, 1.868629, -0.5193954, 1, 0.3764706, 0, 1,
-1.535335, -0.9307857, -1.980659, 1, 0.3843137, 0, 1,
-1.507414, -0.3175861, -2.452738, 1, 0.3882353, 0, 1,
-1.502252, -0.06733837, -1.304045, 1, 0.3960784, 0, 1,
-1.499606, -1.073156, -1.706367, 1, 0.4039216, 0, 1,
-1.474788, -2.364077, -3.557365, 1, 0.4078431, 0, 1,
-1.474252, 0.1610726, -0.4680101, 1, 0.4156863, 0, 1,
-1.471258, -1.154127, -1.453719, 1, 0.4196078, 0, 1,
-1.470128, -0.4072325, -1.400764, 1, 0.427451, 0, 1,
-1.467103, -0.6461338, -2.458831, 1, 0.4313726, 0, 1,
-1.438613, -0.03966826, -2.994948, 1, 0.4392157, 0, 1,
-1.435463, -1.372994, -1.961498, 1, 0.4431373, 0, 1,
-1.412238, -0.7560341, -2.61493, 1, 0.4509804, 0, 1,
-1.40879, 1.00492, 0.4378905, 1, 0.454902, 0, 1,
-1.408095, -1.995427, -2.274457, 1, 0.4627451, 0, 1,
-1.39747, -1.29951, -2.748581, 1, 0.4666667, 0, 1,
-1.395789, -0.8024874, -2.142535, 1, 0.4745098, 0, 1,
-1.39406, 0.8069662, -3.634715, 1, 0.4784314, 0, 1,
-1.393329, 1.261763, -1.73663, 1, 0.4862745, 0, 1,
-1.387995, -1.117072, -2.473959, 1, 0.4901961, 0, 1,
-1.387407, 0.7998906, -1.28413, 1, 0.4980392, 0, 1,
-1.376298, -0.8076211, -2.804206, 1, 0.5058824, 0, 1,
-1.370851, -0.6141221, -3.706364, 1, 0.509804, 0, 1,
-1.360462, -1.316994, -2.317007, 1, 0.5176471, 0, 1,
-1.358912, 0.06393765, -0.8137275, 1, 0.5215687, 0, 1,
-1.354892, -1.326365, -1.387583, 1, 0.5294118, 0, 1,
-1.347533, 0.05008433, -1.896221, 1, 0.5333334, 0, 1,
-1.344803, 0.7527482, -2.91363, 1, 0.5411765, 0, 1,
-1.336927, -0.8374236, -2.584294, 1, 0.5450981, 0, 1,
-1.331296, -0.1483465, -2.296551, 1, 0.5529412, 0, 1,
-1.330628, 1.128045, 0.4022664, 1, 0.5568628, 0, 1,
-1.328631, -0.8209903, -3.515248, 1, 0.5647059, 0, 1,
-1.326151, -0.486782, -2.203759, 1, 0.5686275, 0, 1,
-1.324932, 0.9332574, -1.713391, 1, 0.5764706, 0, 1,
-1.323737, -0.7778242, -1.910659, 1, 0.5803922, 0, 1,
-1.321687, 0.2837986, -0.03651017, 1, 0.5882353, 0, 1,
-1.312743, 1.436313, 0.2891401, 1, 0.5921569, 0, 1,
-1.311915, 2.137389, -0.9742381, 1, 0.6, 0, 1,
-1.303192, -1.515611, -0.6952382, 1, 0.6078432, 0, 1,
-1.298874, -0.1281137, -2.904271, 1, 0.6117647, 0, 1,
-1.294188, -2.673259, -4.408017, 1, 0.6196079, 0, 1,
-1.283947, 0.5289261, -0.05401231, 1, 0.6235294, 0, 1,
-1.282836, -2.219482, -2.352718, 1, 0.6313726, 0, 1,
-1.282277, 0.6790673, -1.372298, 1, 0.6352941, 0, 1,
-1.279943, -0.4252224, -2.036124, 1, 0.6431373, 0, 1,
-1.276566, 0.03524911, -0.3578134, 1, 0.6470588, 0, 1,
-1.276483, 1.428221, -1.923015, 1, 0.654902, 0, 1,
-1.270972, -0.967132, -1.762088, 1, 0.6588235, 0, 1,
-1.270135, -0.5539104, -1.347236, 1, 0.6666667, 0, 1,
-1.269278, -0.2381811, 0.1133602, 1, 0.6705883, 0, 1,
-1.2683, -0.7066194, -1.372754, 1, 0.6784314, 0, 1,
-1.254978, 0.4202538, -2.713341, 1, 0.682353, 0, 1,
-1.248252, -1.43043, -3.575743, 1, 0.6901961, 0, 1,
-1.248157, 0.1656912, -2.98932, 1, 0.6941177, 0, 1,
-1.242598, -0.7638497, -0.9378933, 1, 0.7019608, 0, 1,
-1.233922, 0.1180615, -0.4325065, 1, 0.7098039, 0, 1,
-1.214535, 0.08149409, -1.990904, 1, 0.7137255, 0, 1,
-1.213561, 0.494415, -0.9577968, 1, 0.7215686, 0, 1,
-1.210386, 0.1013184, -1.840799, 1, 0.7254902, 0, 1,
-1.210278, 0.5456443, -0.4872299, 1, 0.7333333, 0, 1,
-1.201873, -1.925726, -4.559485, 1, 0.7372549, 0, 1,
-1.201803, -0.7022178, -1.947773, 1, 0.7450981, 0, 1,
-1.199225, 0.2272491, -2.695903, 1, 0.7490196, 0, 1,
-1.197895, 1.022233, 0.4571097, 1, 0.7568628, 0, 1,
-1.193137, 0.9584222, -2.117696, 1, 0.7607843, 0, 1,
-1.190915, 0.5093213, -2.310717, 1, 0.7686275, 0, 1,
-1.185603, -0.3615635, 0.1289869, 1, 0.772549, 0, 1,
-1.180438, -0.3753053, -0.7120509, 1, 0.7803922, 0, 1,
-1.180174, 0.4108318, 0.3648034, 1, 0.7843137, 0, 1,
-1.17653, -0.7929474, -3.277623, 1, 0.7921569, 0, 1,
-1.167977, -0.2582545, -1.123628, 1, 0.7960784, 0, 1,
-1.167277, 0.1840233, -2.282676, 1, 0.8039216, 0, 1,
-1.161422, 1.803565, 0.1764683, 1, 0.8117647, 0, 1,
-1.160832, -1.617533, -3.590084, 1, 0.8156863, 0, 1,
-1.154656, 1.379011, 1.285301, 1, 0.8235294, 0, 1,
-1.148392, 0.1403445, -2.31873, 1, 0.827451, 0, 1,
-1.14749, -1.536122, -1.186287, 1, 0.8352941, 0, 1,
-1.144185, 0.6230558, -1.684693, 1, 0.8392157, 0, 1,
-1.139761, 0.9972122, -2.707568, 1, 0.8470588, 0, 1,
-1.136195, -1.066274, -3.948411, 1, 0.8509804, 0, 1,
-1.134178, -0.3524149, -0.4693813, 1, 0.8588235, 0, 1,
-1.121548, 1.457744, -1.633359, 1, 0.8627451, 0, 1,
-1.119984, -0.5445065, -3.824784, 1, 0.8705882, 0, 1,
-1.119015, 0.3035792, -1.503991, 1, 0.8745098, 0, 1,
-1.118201, 0.470396, -0.3185596, 1, 0.8823529, 0, 1,
-1.117349, -1.214371, -1.566479, 1, 0.8862745, 0, 1,
-1.104358, 0.9379563, -0.928745, 1, 0.8941177, 0, 1,
-1.102081, -0.8052873, -1.693565, 1, 0.8980392, 0, 1,
-1.096853, 0.3451201, -1.240591, 1, 0.9058824, 0, 1,
-1.091075, 0.05012162, -1.672983, 1, 0.9137255, 0, 1,
-1.089379, 0.2084738, 0.9269788, 1, 0.9176471, 0, 1,
-1.086772, -0.3897901, -1.416548, 1, 0.9254902, 0, 1,
-1.084749, -1.402976, -2.329358, 1, 0.9294118, 0, 1,
-1.084416, 1.149064, 0.09334563, 1, 0.9372549, 0, 1,
-1.080238, -2.118754, -2.986408, 1, 0.9411765, 0, 1,
-1.074395, -1.532908, -3.017035, 1, 0.9490196, 0, 1,
-1.073054, 0.4647734, -0.8859882, 1, 0.9529412, 0, 1,
-1.069794, 1.283422, -1.078844, 1, 0.9607843, 0, 1,
-1.068738, 1.700908, 0.1624426, 1, 0.9647059, 0, 1,
-1.064819, -1.48721, -2.157412, 1, 0.972549, 0, 1,
-1.064679, -1.112681, -2.23675, 1, 0.9764706, 0, 1,
-1.063879, 1.534904, 0.2681329, 1, 0.9843137, 0, 1,
-1.063565, 0.4139017, -0.2903228, 1, 0.9882353, 0, 1,
-1.060066, -1.15949, -2.472414, 1, 0.9960784, 0, 1,
-1.059258, 0.3642873, -3.065408, 0.9960784, 1, 0, 1,
-1.058092, 0.09215934, -2.241396, 0.9921569, 1, 0, 1,
-1.057989, -1.081884, -1.676972, 0.9843137, 1, 0, 1,
-1.056857, 0.8327167, 0.6857857, 0.9803922, 1, 0, 1,
-1.053435, -0.6420783, -3.457006, 0.972549, 1, 0, 1,
-1.048179, 0.2721427, -0.8958434, 0.9686275, 1, 0, 1,
-1.044808, -2.319982, -3.707803, 0.9607843, 1, 0, 1,
-1.044188, 2.346572, 0.830959, 0.9568627, 1, 0, 1,
-1.043658, -0.6676688, -2.760128, 0.9490196, 1, 0, 1,
-1.043357, 1.376012, -1.408734, 0.945098, 1, 0, 1,
-1.038286, 0.9658591, 0.08188243, 0.9372549, 1, 0, 1,
-1.035599, -1.088617, -3.877126, 0.9333333, 1, 0, 1,
-1.028046, 1.465934, -0.816642, 0.9254902, 1, 0, 1,
-1.026601, -0.1779534, -3.225741, 0.9215686, 1, 0, 1,
-1.026277, 0.08245137, -2.137642, 0.9137255, 1, 0, 1,
-1.025653, -2.593516, -2.91967, 0.9098039, 1, 0, 1,
-1.022212, -1.26852, -4.165604, 0.9019608, 1, 0, 1,
-1.018743, 1.3597, -0.1671565, 0.8941177, 1, 0, 1,
-1.018636, -0.4243005, -1.245718, 0.8901961, 1, 0, 1,
-1.018054, -0.5895082, -3.105547, 0.8823529, 1, 0, 1,
-1.013597, -0.6811576, -2.689654, 0.8784314, 1, 0, 1,
-1.003659, 0.3529798, -0.7044773, 0.8705882, 1, 0, 1,
-0.9991183, -0.4847364, -2.795909, 0.8666667, 1, 0, 1,
-0.9948651, 1.436218, -0.619866, 0.8588235, 1, 0, 1,
-0.9898095, -0.3818765, -2.256584, 0.854902, 1, 0, 1,
-0.9870024, -1.266425, -1.850403, 0.8470588, 1, 0, 1,
-0.9854753, 0.7617053, -3.380974, 0.8431373, 1, 0, 1,
-0.9836923, -2.408688, -1.862904, 0.8352941, 1, 0, 1,
-0.9785275, 1.036574, -0.7475592, 0.8313726, 1, 0, 1,
-0.9762222, -1.548192, -1.384135, 0.8235294, 1, 0, 1,
-0.9667464, 0.1737771, -1.244927, 0.8196079, 1, 0, 1,
-0.9643919, -0.7517543, -2.021925, 0.8117647, 1, 0, 1,
-0.9588768, -0.8397123, -2.175569, 0.8078431, 1, 0, 1,
-0.9507344, 1.070835, -0.5024371, 0.8, 1, 0, 1,
-0.9500275, -0.4294415, -2.448383, 0.7921569, 1, 0, 1,
-0.94494, 1.797761, 0.2324819, 0.7882353, 1, 0, 1,
-0.9385036, 2.122184, 1.214215, 0.7803922, 1, 0, 1,
-0.9368395, 0.1367355, -1.363139, 0.7764706, 1, 0, 1,
-0.9355951, -0.6468505, -2.664934, 0.7686275, 1, 0, 1,
-0.932536, 0.2812833, -3.19968, 0.7647059, 1, 0, 1,
-0.9275095, -0.1698115, -0.3823732, 0.7568628, 1, 0, 1,
-0.9251817, 0.9925567, 0.4309273, 0.7529412, 1, 0, 1,
-0.9155806, 1.430149, 0.7990634, 0.7450981, 1, 0, 1,
-0.9135094, -1.140211, -2.89804, 0.7411765, 1, 0, 1,
-0.9065032, 0.6066697, -1.602777, 0.7333333, 1, 0, 1,
-0.8973123, 0.1064807, -2.189387, 0.7294118, 1, 0, 1,
-0.883523, 0.8427275, -1.635404, 0.7215686, 1, 0, 1,
-0.8775941, 1.03671, -1.808819, 0.7176471, 1, 0, 1,
-0.8527337, 0.6438519, -0.4365762, 0.7098039, 1, 0, 1,
-0.850768, 0.08019195, -2.269356, 0.7058824, 1, 0, 1,
-0.8498377, -1.782326, -1.691795, 0.6980392, 1, 0, 1,
-0.8470202, 2.047817, -0.8670244, 0.6901961, 1, 0, 1,
-0.8469265, -1.395592, -2.195811, 0.6862745, 1, 0, 1,
-0.8426265, 0.3568502, -0.2326044, 0.6784314, 1, 0, 1,
-0.8371463, 0.8706208, -0.3838297, 0.6745098, 1, 0, 1,
-0.8329177, 0.1384835, 0.1291517, 0.6666667, 1, 0, 1,
-0.8296673, 0.6062402, 0.5841035, 0.6627451, 1, 0, 1,
-0.8296354, -0.0162047, -2.036533, 0.654902, 1, 0, 1,
-0.8248641, -0.3382762, -1.630935, 0.6509804, 1, 0, 1,
-0.8194463, 0.03926012, -2.863571, 0.6431373, 1, 0, 1,
-0.8191352, -0.8359721, -2.934459, 0.6392157, 1, 0, 1,
-0.8160356, -0.1329229, -2.655536, 0.6313726, 1, 0, 1,
-0.8155116, -0.6046245, -2.900312, 0.627451, 1, 0, 1,
-0.8140302, -0.2639176, -1.426568, 0.6196079, 1, 0, 1,
-0.8047485, 1.446794, -0.6975182, 0.6156863, 1, 0, 1,
-0.8038204, -0.4982632, -4.988988, 0.6078432, 1, 0, 1,
-0.7992283, -1.935782, -3.178208, 0.6039216, 1, 0, 1,
-0.798309, -0.4688168, -3.243643, 0.5960785, 1, 0, 1,
-0.796026, 0.4805081, -1.682532, 0.5882353, 1, 0, 1,
-0.7951235, 0.2472754, -1.994015, 0.5843138, 1, 0, 1,
-0.7929574, 1.124892, 0.05607112, 0.5764706, 1, 0, 1,
-0.7896591, -1.44282, -1.740139, 0.572549, 1, 0, 1,
-0.7882277, -0.288905, -2.230803, 0.5647059, 1, 0, 1,
-0.7873242, -0.1615152, -2.027858, 0.5607843, 1, 0, 1,
-0.7827957, 1.559761, -1.312056, 0.5529412, 1, 0, 1,
-0.7757143, -0.5188665, -1.707082, 0.5490196, 1, 0, 1,
-0.7751136, -1.481879, -2.244428, 0.5411765, 1, 0, 1,
-0.7686172, -0.6409347, -2.125078, 0.5372549, 1, 0, 1,
-0.7669643, -0.2806154, -1.493627, 0.5294118, 1, 0, 1,
-0.7636877, -1.649856, -0.9160537, 0.5254902, 1, 0, 1,
-0.7619354, 0.05252783, -1.396449, 0.5176471, 1, 0, 1,
-0.761489, 0.1970296, -3.179565, 0.5137255, 1, 0, 1,
-0.7458813, 0.3999932, -1.258886, 0.5058824, 1, 0, 1,
-0.7433038, 0.2493214, -2.174026, 0.5019608, 1, 0, 1,
-0.7413155, 0.1537433, -0.3321289, 0.4941176, 1, 0, 1,
-0.738768, 1.099575, -1.568278, 0.4862745, 1, 0, 1,
-0.7367565, -0.1216051, -4.079135, 0.4823529, 1, 0, 1,
-0.7365695, 0.09450924, -1.120286, 0.4745098, 1, 0, 1,
-0.7356384, 0.504924, 0.3587425, 0.4705882, 1, 0, 1,
-0.7350928, -1.727826, -3.335217, 0.4627451, 1, 0, 1,
-0.7331702, -1.057737, -1.626129, 0.4588235, 1, 0, 1,
-0.7265678, -0.3681987, -0.2918061, 0.4509804, 1, 0, 1,
-0.7172382, -0.9408131, -2.731247, 0.4470588, 1, 0, 1,
-0.7142679, -0.8339728, -1.670738, 0.4392157, 1, 0, 1,
-0.7102964, 0.1558729, -1.624174, 0.4352941, 1, 0, 1,
-0.7096478, 1.398751, -1.012378, 0.427451, 1, 0, 1,
-0.7043858, -0.2278225, -1.766317, 0.4235294, 1, 0, 1,
-0.7010671, 0.8682449, -1.523657, 0.4156863, 1, 0, 1,
-0.6992161, 1.118562, -0.3227028, 0.4117647, 1, 0, 1,
-0.6988674, 0.6387652, -1.575171, 0.4039216, 1, 0, 1,
-0.6964085, 0.6496763, 0.9958858, 0.3960784, 1, 0, 1,
-0.6962323, -1.463745, -2.933109, 0.3921569, 1, 0, 1,
-0.6948704, -0.6845247, -1.268502, 0.3843137, 1, 0, 1,
-0.6781046, -0.2117136, -0.9369547, 0.3803922, 1, 0, 1,
-0.675723, 2.188781, 0.5594196, 0.372549, 1, 0, 1,
-0.6742693, -0.4359655, -3.231393, 0.3686275, 1, 0, 1,
-0.6726726, 0.4368784, -0.6966521, 0.3607843, 1, 0, 1,
-0.6724794, -1.569547, -3.609837, 0.3568628, 1, 0, 1,
-0.671609, 0.9777719, -0.4806113, 0.3490196, 1, 0, 1,
-0.6715508, -1.497545, -2.41345, 0.345098, 1, 0, 1,
-0.6703475, 1.130208, -0.1006567, 0.3372549, 1, 0, 1,
-0.668146, 1.297619, -0.8983821, 0.3333333, 1, 0, 1,
-0.6602008, 0.4644437, -1.624806, 0.3254902, 1, 0, 1,
-0.6586254, 1.846625, 1.791875, 0.3215686, 1, 0, 1,
-0.6579171, -0.1064693, -0.1123624, 0.3137255, 1, 0, 1,
-0.6493151, 1.172709, -0.6004294, 0.3098039, 1, 0, 1,
-0.6410922, -1.205536, -1.991278, 0.3019608, 1, 0, 1,
-0.6370199, -0.3076631, -1.154053, 0.2941177, 1, 0, 1,
-0.6352041, -0.7847367, -2.915811, 0.2901961, 1, 0, 1,
-0.6266904, 0.7768658, -2.622713, 0.282353, 1, 0, 1,
-0.6265938, -0.6818326, -0.3026507, 0.2784314, 1, 0, 1,
-0.6246074, 0.02897031, -0.6489015, 0.2705882, 1, 0, 1,
-0.6240863, 0.8445882, -0.4322652, 0.2666667, 1, 0, 1,
-0.6239246, -1.604113, -3.961632, 0.2588235, 1, 0, 1,
-0.6236242, 1.044648, 0.5154975, 0.254902, 1, 0, 1,
-0.6235088, 0.009432278, -0.6949975, 0.2470588, 1, 0, 1,
-0.6160603, 1.220748, -0.6005311, 0.2431373, 1, 0, 1,
-0.6145952, 0.6784068, -1.4178, 0.2352941, 1, 0, 1,
-0.6117858, -1.136485, -0.001029324, 0.2313726, 1, 0, 1,
-0.6099685, 0.7095191, 0.6002697, 0.2235294, 1, 0, 1,
-0.6076657, 0.3502402, -1.82733, 0.2196078, 1, 0, 1,
-0.6014128, 0.290893, 0.3127293, 0.2117647, 1, 0, 1,
-0.5981266, 0.5569178, -1.384175, 0.2078431, 1, 0, 1,
-0.595923, -0.6701916, -3.183624, 0.2, 1, 0, 1,
-0.5855095, -1.327244, -2.633246, 0.1921569, 1, 0, 1,
-0.5841787, -0.4082271, -2.382763, 0.1882353, 1, 0, 1,
-0.5825516, 0.1271797, -1.900569, 0.1803922, 1, 0, 1,
-0.5803126, 1.194765, -0.71906, 0.1764706, 1, 0, 1,
-0.5799586, 0.03403229, -1.555872, 0.1686275, 1, 0, 1,
-0.5763757, 0.6494091, -0.6927647, 0.1647059, 1, 0, 1,
-0.5762672, 0.180861, -1.6657, 0.1568628, 1, 0, 1,
-0.5692107, -0.2259371, -1.170451, 0.1529412, 1, 0, 1,
-0.566982, -0.8913792, -1.640432, 0.145098, 1, 0, 1,
-0.5663534, 1.088727, -0.3612144, 0.1411765, 1, 0, 1,
-0.5657026, 0.6392807, 0.3867446, 0.1333333, 1, 0, 1,
-0.5593705, 0.7995099, -0.9756563, 0.1294118, 1, 0, 1,
-0.5488066, -0.00418029, -0.7691154, 0.1215686, 1, 0, 1,
-0.5482771, 0.9994115, 0.1727492, 0.1176471, 1, 0, 1,
-0.5462425, 0.730396, 1.029135, 0.1098039, 1, 0, 1,
-0.5422289, 0.8071773, -1.119976, 0.1058824, 1, 0, 1,
-0.5382999, 0.453589, -0.02662048, 0.09803922, 1, 0, 1,
-0.5379823, 0.6426083, -0.002258939, 0.09019608, 1, 0, 1,
-0.5350339, -0.8896579, -5.558419, 0.08627451, 1, 0, 1,
-0.5284162, -0.4183317, -2.48694, 0.07843138, 1, 0, 1,
-0.5270239, -0.4030696, -1.572507, 0.07450981, 1, 0, 1,
-0.5245366, 1.689819, -0.9249865, 0.06666667, 1, 0, 1,
-0.5198239, 0.8816441, 0.769021, 0.0627451, 1, 0, 1,
-0.5174234, -0.3917467, -2.376209, 0.05490196, 1, 0, 1,
-0.5073538, -0.4763557, -2.40697, 0.05098039, 1, 0, 1,
-0.5036258, -0.2009766, -0.7806226, 0.04313726, 1, 0, 1,
-0.5036045, 0.9140556, -1.950745, 0.03921569, 1, 0, 1,
-0.5029299, 0.5435207, 0.4788002, 0.03137255, 1, 0, 1,
-0.5016543, 0.4972422, 0.577507, 0.02745098, 1, 0, 1,
-0.5001288, -0.4889415, -0.8820112, 0.01960784, 1, 0, 1,
-0.4961253, 0.3023731, -1.387438, 0.01568628, 1, 0, 1,
-0.4947063, -0.07454862, -1.060632, 0.007843138, 1, 0, 1,
-0.484613, 0.4103143, -1.728247, 0.003921569, 1, 0, 1,
-0.4840681, 0.9082703, -1.86283, 0, 1, 0.003921569, 1,
-0.4839752, -1.818561, -0.6686058, 0, 1, 0.01176471, 1,
-0.4819154, 1.045753, 1.079426, 0, 1, 0.01568628, 1,
-0.4813859, 0.214964, -0.8099942, 0, 1, 0.02352941, 1,
-0.4804884, 1.032934, -0.4669207, 0, 1, 0.02745098, 1,
-0.4799946, -0.5516893, -2.878603, 0, 1, 0.03529412, 1,
-0.4788361, -0.8318526, -2.546908, 0, 1, 0.03921569, 1,
-0.4743942, -1.233454, -2.463991, 0, 1, 0.04705882, 1,
-0.4713913, 0.07924828, -2.385555, 0, 1, 0.05098039, 1,
-0.4674979, 1.756495, -1.188114, 0, 1, 0.05882353, 1,
-0.4669213, -1.021946, -2.703046, 0, 1, 0.0627451, 1,
-0.4649108, 1.221805, 0.5923451, 0, 1, 0.07058824, 1,
-0.4592907, 0.3695638, -0.577595, 0, 1, 0.07450981, 1,
-0.4561143, 0.06067112, 0.1714347, 0, 1, 0.08235294, 1,
-0.4554574, 1.329186, 0.9039203, 0, 1, 0.08627451, 1,
-0.4537844, 0.1425423, -1.800233, 0, 1, 0.09411765, 1,
-0.4481957, -3.081535, -1.819708, 0, 1, 0.1019608, 1,
-0.4423368, 0.9639354, -1.713653, 0, 1, 0.1058824, 1,
-0.4422282, 0.02114544, -1.424019, 0, 1, 0.1137255, 1,
-0.4307768, -0.2373485, -0.414141, 0, 1, 0.1176471, 1,
-0.4271661, -0.2788972, -2.236838, 0, 1, 0.1254902, 1,
-0.4253766, -0.01832126, -1.852522, 0, 1, 0.1294118, 1,
-0.4245715, -2.650473, -5.019937, 0, 1, 0.1372549, 1,
-0.4216549, -1.651402, -1.613582, 0, 1, 0.1411765, 1,
-0.4201812, 0.4721359, -0.3030816, 0, 1, 0.1490196, 1,
-0.4200796, -0.421062, -2.575884, 0, 1, 0.1529412, 1,
-0.4167635, -0.904165, -2.54227, 0, 1, 0.1607843, 1,
-0.4093437, -0.7276117, -3.23556, 0, 1, 0.1647059, 1,
-0.407811, 0.9246679, -0.4093951, 0, 1, 0.172549, 1,
-0.3961015, 1.720829, 0.3488587, 0, 1, 0.1764706, 1,
-0.3940491, -2.404838, -2.546571, 0, 1, 0.1843137, 1,
-0.3932087, -0.5283691, -1.394774, 0, 1, 0.1882353, 1,
-0.3885299, -0.0183827, -1.634907, 0, 1, 0.1960784, 1,
-0.388061, -2.45663, -1.37406, 0, 1, 0.2039216, 1,
-0.3879582, 1.793871, -0.7601518, 0, 1, 0.2078431, 1,
-0.3859735, 0.642061, -0.02098517, 0, 1, 0.2156863, 1,
-0.3857371, -0.4953759, -2.846026, 0, 1, 0.2196078, 1,
-0.3834632, -0.8060147, -2.112188, 0, 1, 0.227451, 1,
-0.3794664, 0.1292618, -1.411482, 0, 1, 0.2313726, 1,
-0.378564, 0.3176736, -0.7372496, 0, 1, 0.2392157, 1,
-0.3779887, 0.01718653, -1.047922, 0, 1, 0.2431373, 1,
-0.3746565, 0.5282242, 1.924225, 0, 1, 0.2509804, 1,
-0.372219, -0.6928923, -2.527808, 0, 1, 0.254902, 1,
-0.3664739, 0.6442958, -0.6535766, 0, 1, 0.2627451, 1,
-0.3659769, 0.6032827, 1.492594, 0, 1, 0.2666667, 1,
-0.3638139, -0.3908972, -1.373297, 0, 1, 0.2745098, 1,
-0.3582915, 0.04519197, -2.695124, 0, 1, 0.2784314, 1,
-0.3572164, -0.8399138, -2.120685, 0, 1, 0.2862745, 1,
-0.3522928, 1.234326, -0.8718641, 0, 1, 0.2901961, 1,
-0.3504792, 1.60086, -0.1273976, 0, 1, 0.2980392, 1,
-0.3502042, -0.8550344, -1.771492, 0, 1, 0.3058824, 1,
-0.3488421, 0.9138727, -0.5693083, 0, 1, 0.3098039, 1,
-0.3486284, -0.04440155, -1.111949, 0, 1, 0.3176471, 1,
-0.3472168, 0.9499665, -0.4153073, 0, 1, 0.3215686, 1,
-0.3460288, 1.117357, 0.1922709, 0, 1, 0.3294118, 1,
-0.3397481, 0.7441418, -1.533918, 0, 1, 0.3333333, 1,
-0.3369357, -2.777869, -3.12728, 0, 1, 0.3411765, 1,
-0.3321646, -0.4663175, -1.785205, 0, 1, 0.345098, 1,
-0.3236092, -0.6262149, -2.631278, 0, 1, 0.3529412, 1,
-0.3123991, 0.1007236, -0.3072737, 0, 1, 0.3568628, 1,
-0.3061402, 1.07314, -0.8282993, 0, 1, 0.3647059, 1,
-0.3032535, 0.4620515, -1.238301, 0, 1, 0.3686275, 1,
-0.2982053, 1.089203, -1.841066, 0, 1, 0.3764706, 1,
-0.2970539, 1.373829, -0.6153775, 0, 1, 0.3803922, 1,
-0.2954693, -0.5064211, -2.978324, 0, 1, 0.3882353, 1,
-0.2880722, -0.4032446, -3.691018, 0, 1, 0.3921569, 1,
-0.2829482, -1.158722, -2.959038, 0, 1, 0.4, 1,
-0.2817892, -0.1602648, -2.356075, 0, 1, 0.4078431, 1,
-0.2811469, -1.278638, -3.701159, 0, 1, 0.4117647, 1,
-0.280846, -0.015246, -2.343742, 0, 1, 0.4196078, 1,
-0.2805303, 1.119168, 0.03362792, 0, 1, 0.4235294, 1,
-0.2725247, -0.479662, -2.944456, 0, 1, 0.4313726, 1,
-0.2723333, 1.930659, -0.4746298, 0, 1, 0.4352941, 1,
-0.2716515, 0.4652294, -1.532357, 0, 1, 0.4431373, 1,
-0.2686177, 1.08508, 0.5275466, 0, 1, 0.4470588, 1,
-0.2666479, 0.3019924, -0.1696781, 0, 1, 0.454902, 1,
-0.2665584, 0.007873899, -2.541544, 0, 1, 0.4588235, 1,
-0.2653213, -1.189394, -3.148966, 0, 1, 0.4666667, 1,
-0.2599425, -1.67263, -3.387198, 0, 1, 0.4705882, 1,
-0.2583753, 0.7399817, -0.5467283, 0, 1, 0.4784314, 1,
-0.2517579, 0.7754923, 0.4766462, 0, 1, 0.4823529, 1,
-0.2455504, 1.325661, 1.138423, 0, 1, 0.4901961, 1,
-0.243167, 0.05641502, -1.370287, 0, 1, 0.4941176, 1,
-0.2394214, -0.5315834, -4.228984, 0, 1, 0.5019608, 1,
-0.2389615, -0.5562504, -3.624109, 0, 1, 0.509804, 1,
-0.2374208, 0.2346509, -1.237776, 0, 1, 0.5137255, 1,
-0.2330357, 0.8802909, 0.1960834, 0, 1, 0.5215687, 1,
-0.2310822, 0.1326726, -1.563244, 0, 1, 0.5254902, 1,
-0.2246596, 0.5022098, 0.2310669, 0, 1, 0.5333334, 1,
-0.223713, 1.669543, -1.755468, 0, 1, 0.5372549, 1,
-0.22126, 1.190675, -0.6015118, 0, 1, 0.5450981, 1,
-0.2184102, 1.916376, -0.1841826, 0, 1, 0.5490196, 1,
-0.2167101, 0.9652645, 0.4791625, 0, 1, 0.5568628, 1,
-0.2159198, -0.1290761, -2.102154, 0, 1, 0.5607843, 1,
-0.2126513, 1.510371, -0.5132017, 0, 1, 0.5686275, 1,
-0.2091859, 0.7423781, -0.191335, 0, 1, 0.572549, 1,
-0.2089941, -0.937718, -3.792556, 0, 1, 0.5803922, 1,
-0.2084007, 0.7600603, 0.9074527, 0, 1, 0.5843138, 1,
-0.2064056, -0.6446691, -1.858242, 0, 1, 0.5921569, 1,
-0.2042066, 0.03626948, -1.726717, 0, 1, 0.5960785, 1,
-0.2034221, 0.7204841, -2.388191, 0, 1, 0.6039216, 1,
-0.201358, 0.2769431, -1.235994, 0, 1, 0.6117647, 1,
-0.1988093, 0.3884606, -0.9076959, 0, 1, 0.6156863, 1,
-0.1971116, -0.5353234, -3.694029, 0, 1, 0.6235294, 1,
-0.1963858, -0.9681081, -3.406828, 0, 1, 0.627451, 1,
-0.1960136, 0.9844493, -0.5477768, 0, 1, 0.6352941, 1,
-0.1951265, 1.514157, 0.9102399, 0, 1, 0.6392157, 1,
-0.1911608, -1.304356, -1.553088, 0, 1, 0.6470588, 1,
-0.1889808, 0.1863454, -1.265954, 0, 1, 0.6509804, 1,
-0.1759887, 0.9799746, -0.4412175, 0, 1, 0.6588235, 1,
-0.1725612, -1.422736, -2.957022, 0, 1, 0.6627451, 1,
-0.1700777, -0.8672693, -2.963767, 0, 1, 0.6705883, 1,
-0.1683101, -0.3740008, -3.554125, 0, 1, 0.6745098, 1,
-0.1664573, 1.631827, -0.03937047, 0, 1, 0.682353, 1,
-0.15949, 1.326543, 0.08394287, 0, 1, 0.6862745, 1,
-0.1584207, -1.278264, -0.8491945, 0, 1, 0.6941177, 1,
-0.15529, 0.08079541, -2.139922, 0, 1, 0.7019608, 1,
-0.1546082, 1.057188, 0.6297199, 0, 1, 0.7058824, 1,
-0.1531007, -0.1697831, -1.751908, 0, 1, 0.7137255, 1,
-0.1479013, -1.19947, -3.113619, 0, 1, 0.7176471, 1,
-0.1476487, -1.599905, -3.244484, 0, 1, 0.7254902, 1,
-0.1474916, 0.3835014, -1.945578, 0, 1, 0.7294118, 1,
-0.147172, -0.06564935, -0.9290484, 0, 1, 0.7372549, 1,
-0.1465772, -0.1541488, -3.272512, 0, 1, 0.7411765, 1,
-0.1464267, -0.7048101, -3.291548, 0, 1, 0.7490196, 1,
-0.1434224, -2.646012, -1.882801, 0, 1, 0.7529412, 1,
-0.1405558, -0.3929438, -3.416908, 0, 1, 0.7607843, 1,
-0.1400102, 1.531457, 0.05097021, 0, 1, 0.7647059, 1,
-0.1284266, 0.7720326, 0.08359671, 0, 1, 0.772549, 1,
-0.1276348, 0.865894, 0.421965, 0, 1, 0.7764706, 1,
-0.1267236, -2.017903, -2.933185, 0, 1, 0.7843137, 1,
-0.1234695, 0.2404944, 0.9937582, 0, 1, 0.7882353, 1,
-0.1228854, -1.200136, -2.564354, 0, 1, 0.7960784, 1,
-0.1162, -0.9809414, -3.794181, 0, 1, 0.8039216, 1,
-0.1158717, -1.472539, -4.32199, 0, 1, 0.8078431, 1,
-0.1143307, -0.5912452, -2.633592, 0, 1, 0.8156863, 1,
-0.1143089, -1.079857, -2.390414, 0, 1, 0.8196079, 1,
-0.1130034, 0.3201463, 1.02239, 0, 1, 0.827451, 1,
-0.1099123, -1.495933, -3.365677, 0, 1, 0.8313726, 1,
-0.1050833, -1.090958, -4.266647, 0, 1, 0.8392157, 1,
-0.1031875, 0.6035227, 1.947059, 0, 1, 0.8431373, 1,
-0.0929976, -0.3323448, -4.383543, 0, 1, 0.8509804, 1,
-0.08906415, 0.5029794, -0.3059242, 0, 1, 0.854902, 1,
-0.08372229, 0.4633667, 0.3067233, 0, 1, 0.8627451, 1,
-0.08362367, 1.787752, 0.5899245, 0, 1, 0.8666667, 1,
-0.08345187, 0.4278986, 1.234204, 0, 1, 0.8745098, 1,
-0.08096708, 0.6632338, -0.3353102, 0, 1, 0.8784314, 1,
-0.0745829, 0.03270166, -2.17971, 0, 1, 0.8862745, 1,
-0.07191994, -0.2673019, -4.333561, 0, 1, 0.8901961, 1,
-0.06614362, 1.177337, -0.0954566, 0, 1, 0.8980392, 1,
-0.06433198, 0.8337061, -0.05904905, 0, 1, 0.9058824, 1,
-0.06084616, 0.4795996, 0.8079854, 0, 1, 0.9098039, 1,
-0.06083772, 1.596268, 0.6939027, 0, 1, 0.9176471, 1,
-0.05830839, -0.9524399, -4.279029, 0, 1, 0.9215686, 1,
-0.05744513, 0.435808, 1.403009, 0, 1, 0.9294118, 1,
-0.0515236, -0.8044112, -4.104311, 0, 1, 0.9333333, 1,
-0.04773058, 0.9163891, 1.439053, 0, 1, 0.9411765, 1,
-0.04583291, 1.063262, -0.2668935, 0, 1, 0.945098, 1,
-0.04451274, -0.03310453, -3.378246, 0, 1, 0.9529412, 1,
-0.04393809, 1.295909, -0.9690389, 0, 1, 0.9568627, 1,
-0.04234785, 0.3289253, 0.8857849, 0, 1, 0.9647059, 1,
-0.03933799, 1.695835, -0.2329379, 0, 1, 0.9686275, 1,
-0.0317133, 1.224465, 1.008493, 0, 1, 0.9764706, 1,
-0.03020412, 0.5305647, -0.4952261, 0, 1, 0.9803922, 1,
-0.02524326, 1.216533, -1.189032, 0, 1, 0.9882353, 1,
-0.02105139, -0.108247, -2.645725, 0, 1, 0.9921569, 1,
-0.02074341, 0.9253024, 0.1702146, 0, 1, 1, 1,
-0.01967873, -1.362396, -1.935306, 0, 0.9921569, 1, 1,
-0.01856627, -0.1193775, -5.785089, 0, 0.9882353, 1, 1,
-0.01527636, 0.3090945, 0.8446093, 0, 0.9803922, 1, 1,
-0.01313471, -1.003489, -3.832615, 0, 0.9764706, 1, 1,
-0.01109219, 0.3267799, -2.11193, 0, 0.9686275, 1, 1,
-0.009364582, -0.964151, -3.244504, 0, 0.9647059, 1, 1,
-0.008775013, -2.01862, -1.470586, 0, 0.9568627, 1, 1,
-0.005524273, 0.3167982, -0.02121426, 0, 0.9529412, 1, 1,
-0.003647212, -2.230134, -4.173412, 0, 0.945098, 1, 1,
0.005145287, -1.204052, 2.838805, 0, 0.9411765, 1, 1,
0.005799953, 0.31589, -0.9777582, 0, 0.9333333, 1, 1,
0.006028745, -0.435034, 3.472671, 0, 0.9294118, 1, 1,
0.00680993, -1.342037, 3.980183, 0, 0.9215686, 1, 1,
0.009674592, -1.68647, 3.670218, 0, 0.9176471, 1, 1,
0.01011254, 0.8823871, 1.003691, 0, 0.9098039, 1, 1,
0.0101348, 0.8731735, 0.07842182, 0, 0.9058824, 1, 1,
0.01015271, 0.4554076, -1.31192, 0, 0.8980392, 1, 1,
0.01373048, 1.773683, 1.116292, 0, 0.8901961, 1, 1,
0.01480666, -1.274598, 0.8542856, 0, 0.8862745, 1, 1,
0.01482046, -0.2300962, 3.244636, 0, 0.8784314, 1, 1,
0.01547435, 0.5497023, -0.1922951, 0, 0.8745098, 1, 1,
0.01569716, 1.28244, -0.001045448, 0, 0.8666667, 1, 1,
0.01612253, -0.8668299, 3.533182, 0, 0.8627451, 1, 1,
0.01904212, 0.789811, 0.1924048, 0, 0.854902, 1, 1,
0.02369901, -1.231558, 3.475524, 0, 0.8509804, 1, 1,
0.02673643, -0.3889152, 3.158649, 0, 0.8431373, 1, 1,
0.02818513, -1.394245, 2.140525, 0, 0.8392157, 1, 1,
0.02878836, 0.2034495, -1.132272, 0, 0.8313726, 1, 1,
0.03195916, 1.637165, -0.1265352, 0, 0.827451, 1, 1,
0.0329134, 0.6703542, -0.4944034, 0, 0.8196079, 1, 1,
0.03495524, -1.192399, 1.256821, 0, 0.8156863, 1, 1,
0.03522433, 0.3274894, 1.560793, 0, 0.8078431, 1, 1,
0.0389742, 0.2758385, 1.427714, 0, 0.8039216, 1, 1,
0.04335491, -0.06556859, 2.770296, 0, 0.7960784, 1, 1,
0.04922111, 1.418461, -1.311228, 0, 0.7882353, 1, 1,
0.04936499, 0.07766733, 2.18429, 0, 0.7843137, 1, 1,
0.04967371, 1.951627, 1.209632, 0, 0.7764706, 1, 1,
0.05204163, 1.060941, -1.497619, 0, 0.772549, 1, 1,
0.05506182, -0.999672, 2.595804, 0, 0.7647059, 1, 1,
0.05634515, -1.295396, 2.340763, 0, 0.7607843, 1, 1,
0.06072411, 0.7444056, 1.12602, 0, 0.7529412, 1, 1,
0.0625125, -0.4342121, 2.424182, 0, 0.7490196, 1, 1,
0.06399115, 2.416882, 0.04627344, 0, 0.7411765, 1, 1,
0.06834459, 0.2592232, -0.9714205, 0, 0.7372549, 1, 1,
0.07121319, 0.6358516, -1.763454, 0, 0.7294118, 1, 1,
0.07378003, -0.9961107, 4.08215, 0, 0.7254902, 1, 1,
0.07564292, 1.047753, -1.908624, 0, 0.7176471, 1, 1,
0.07574748, 0.492659, 0.2027652, 0, 0.7137255, 1, 1,
0.0762347, 2.106395, -0.8189286, 0, 0.7058824, 1, 1,
0.07981217, -0.7029616, 4.513817, 0, 0.6980392, 1, 1,
0.08005758, 0.3879555, 1.241426, 0, 0.6941177, 1, 1,
0.0817036, 0.01672782, 1.621755, 0, 0.6862745, 1, 1,
0.08217129, 0.902379, -0.2925737, 0, 0.682353, 1, 1,
0.08304568, -0.3159048, 2.567506, 0, 0.6745098, 1, 1,
0.08419216, 1.468898, 0.180488, 0, 0.6705883, 1, 1,
0.08768702, 1.297513, -2.44145, 0, 0.6627451, 1, 1,
0.08966742, 1.727703, 1.768252, 0, 0.6588235, 1, 1,
0.09265485, -1.94864, 4.554474, 0, 0.6509804, 1, 1,
0.09266313, 2.403383, -1.149652, 0, 0.6470588, 1, 1,
0.09476227, 0.8794181, 0.2661735, 0, 0.6392157, 1, 1,
0.09618565, -1.788091, 4.436388, 0, 0.6352941, 1, 1,
0.1005915, -1.019168, 4.225886, 0, 0.627451, 1, 1,
0.1012747, -0.5070978, 3.254406, 0, 0.6235294, 1, 1,
0.105246, 0.3432855, -1.133095, 0, 0.6156863, 1, 1,
0.1052718, 0.5294592, 1.284631, 0, 0.6117647, 1, 1,
0.1077241, -0.2555521, 1.94061, 0, 0.6039216, 1, 1,
0.1094834, -1.339331, 4.837214, 0, 0.5960785, 1, 1,
0.1134374, 1.273708, 1.350511, 0, 0.5921569, 1, 1,
0.114736, -1.053638, 3.732366, 0, 0.5843138, 1, 1,
0.1232386, -0.6346005, 2.75732, 0, 0.5803922, 1, 1,
0.1290765, -0.7981755, 2.849718, 0, 0.572549, 1, 1,
0.131651, 0.6029724, -0.4712279, 0, 0.5686275, 1, 1,
0.1321821, -2.864672, 3.480829, 0, 0.5607843, 1, 1,
0.1327168, -0.6941762, 1.780487, 0, 0.5568628, 1, 1,
0.135292, 0.3727939, 0.06739598, 0, 0.5490196, 1, 1,
0.1369238, -1.721703, 4.359617, 0, 0.5450981, 1, 1,
0.1390962, -0.2582002, 3.02737, 0, 0.5372549, 1, 1,
0.1393869, 1.597013, -2.237392, 0, 0.5333334, 1, 1,
0.1407646, -1.140712, 3.752532, 0, 0.5254902, 1, 1,
0.1423178, 1.611115, -0.4100838, 0, 0.5215687, 1, 1,
0.147838, -0.9112769, 4.927481, 0, 0.5137255, 1, 1,
0.1486706, -0.1259344, 2.315504, 0, 0.509804, 1, 1,
0.149339, 0.04624606, 1.352952, 0, 0.5019608, 1, 1,
0.153256, 0.02057406, 0.02226016, 0, 0.4941176, 1, 1,
0.1535322, -0.2717234, 2.378062, 0, 0.4901961, 1, 1,
0.1570442, 1.459998, -0.4089418, 0, 0.4823529, 1, 1,
0.1585642, -1.168393, 3.284045, 0, 0.4784314, 1, 1,
0.1619083, 1.691095, -0.3155955, 0, 0.4705882, 1, 1,
0.1724929, -1.198587, 2.615039, 0, 0.4666667, 1, 1,
0.1727619, -0.6577054, 0.9206364, 0, 0.4588235, 1, 1,
0.1731442, 0.5805811, 0.6670641, 0, 0.454902, 1, 1,
0.1745955, -0.5151913, 3.094104, 0, 0.4470588, 1, 1,
0.1765781, 0.6761591, 1.501176, 0, 0.4431373, 1, 1,
0.1776083, -0.09676734, 1.963619, 0, 0.4352941, 1, 1,
0.1809532, -0.8465623, 4.094866, 0, 0.4313726, 1, 1,
0.1829671, 1.082409, 1.652131, 0, 0.4235294, 1, 1,
0.1850425, -0.6870598, 1.47925, 0, 0.4196078, 1, 1,
0.1863727, 0.4253774, -1.392502, 0, 0.4117647, 1, 1,
0.1899813, -1.24386, 2.910303, 0, 0.4078431, 1, 1,
0.1910352, 0.5463396, 1.381834, 0, 0.4, 1, 1,
0.1923283, 0.5570139, 0.2064234, 0, 0.3921569, 1, 1,
0.1928787, 0.2226034, -0.1214708, 0, 0.3882353, 1, 1,
0.1946943, -0.9788511, 1.899888, 0, 0.3803922, 1, 1,
0.1952872, 0.007143777, 2.763468, 0, 0.3764706, 1, 1,
0.1975956, -1.550875, 2.47757, 0, 0.3686275, 1, 1,
0.1995404, -0.9217628, 3.138433, 0, 0.3647059, 1, 1,
0.2009849, 0.4057761, 0.07052695, 0, 0.3568628, 1, 1,
0.2120476, 1.26601, -0.4562087, 0, 0.3529412, 1, 1,
0.214171, 0.4274682, 1.823985, 0, 0.345098, 1, 1,
0.2191332, 0.4851936, 1.300612, 0, 0.3411765, 1, 1,
0.2199171, -0.613079, 3.809807, 0, 0.3333333, 1, 1,
0.2210024, -0.1844105, 2.767278, 0, 0.3294118, 1, 1,
0.2237203, 0.2265023, 0.6483706, 0, 0.3215686, 1, 1,
0.2315429, -0.3048236, 3.347662, 0, 0.3176471, 1, 1,
0.2317334, 1.094786, 0.4511671, 0, 0.3098039, 1, 1,
0.2338315, 0.8496651, -0.7981732, 0, 0.3058824, 1, 1,
0.234445, 0.9860229, 0.8817773, 0, 0.2980392, 1, 1,
0.2346298, 1.018163, 1.66301, 0, 0.2901961, 1, 1,
0.2379937, -0.5186741, 3.838996, 0, 0.2862745, 1, 1,
0.2445921, -1.085015, 2.449689, 0, 0.2784314, 1, 1,
0.2467768, 1.739292, 2.139761, 0, 0.2745098, 1, 1,
0.2469518, -0.3315001, 1.602785, 0, 0.2666667, 1, 1,
0.2476188, -0.2405824, 2.066285, 0, 0.2627451, 1, 1,
0.2497255, 0.07265231, -0.4831988, 0, 0.254902, 1, 1,
0.2500681, -0.3856418, 2.81639, 0, 0.2509804, 1, 1,
0.2517751, 0.6090611, -1.394949, 0, 0.2431373, 1, 1,
0.2524234, -0.01578922, 0.6948144, 0, 0.2392157, 1, 1,
0.2552944, -1.232217, 4.750526, 0, 0.2313726, 1, 1,
0.2559214, 1.535056, -0.4837335, 0, 0.227451, 1, 1,
0.2574744, -0.9750859, 2.065015, 0, 0.2196078, 1, 1,
0.26436, -0.4589025, 1.300976, 0, 0.2156863, 1, 1,
0.2648558, 0.3249468, 1.000799, 0, 0.2078431, 1, 1,
0.2691662, 0.5063685, 1.01947, 0, 0.2039216, 1, 1,
0.2703878, -0.2372966, 3.046644, 0, 0.1960784, 1, 1,
0.2709408, 0.4392731, 1.08067, 0, 0.1882353, 1, 1,
0.27405, 0.5008476, 0.02269091, 0, 0.1843137, 1, 1,
0.274861, -0.2462729, 0.6042244, 0, 0.1764706, 1, 1,
0.2774781, -0.4129714, 2.469742, 0, 0.172549, 1, 1,
0.2784463, -0.9456682, 4.465571, 0, 0.1647059, 1, 1,
0.2828725, 1.039561, 0.1420531, 0, 0.1607843, 1, 1,
0.2882551, -0.6577455, 1.222242, 0, 0.1529412, 1, 1,
0.2914438, -0.2812138, 0.6628843, 0, 0.1490196, 1, 1,
0.2931734, -0.6203427, 4.094579, 0, 0.1411765, 1, 1,
0.296332, 0.5752473, 0.3203852, 0, 0.1372549, 1, 1,
0.2974682, -2.698047, 0.9679852, 0, 0.1294118, 1, 1,
0.3008504, -0.767239, 3.904585, 0, 0.1254902, 1, 1,
0.3027091, 0.06818967, 0.09765704, 0, 0.1176471, 1, 1,
0.3089134, -1.319147, 2.317255, 0, 0.1137255, 1, 1,
0.3089595, -0.1448335, 0.726588, 0, 0.1058824, 1, 1,
0.3108243, -0.4125564, 3.471878, 0, 0.09803922, 1, 1,
0.3122493, -0.6256201, 3.432597, 0, 0.09411765, 1, 1,
0.3132874, 0.2115134, 1.508259, 0, 0.08627451, 1, 1,
0.3146846, 0.2464034, 0.8408903, 0, 0.08235294, 1, 1,
0.3153961, 0.4090193, 0.05923277, 0, 0.07450981, 1, 1,
0.3173206, 0.1617515, 0.3618243, 0, 0.07058824, 1, 1,
0.3250357, -1.146596, 3.284172, 0, 0.0627451, 1, 1,
0.3257051, 0.6327178, 0.2186716, 0, 0.05882353, 1, 1,
0.3286968, -0.2596129, 3.114046, 0, 0.05098039, 1, 1,
0.3329582, -0.3841465, 3.221223, 0, 0.04705882, 1, 1,
0.3333475, -0.5478188, 2.519413, 0, 0.03921569, 1, 1,
0.3336139, -0.1013595, 2.24719, 0, 0.03529412, 1, 1,
0.3367388, -0.3333632, 2.279917, 0, 0.02745098, 1, 1,
0.3430009, -0.537607, 2.280522, 0, 0.02352941, 1, 1,
0.3453642, 1.159229, 0.7140566, 0, 0.01568628, 1, 1,
0.354251, 0.6965621, -0.4510079, 0, 0.01176471, 1, 1,
0.3561988, -0.4635625, 0.2075539, 0, 0.003921569, 1, 1,
0.357489, -1.939455, 3.772305, 0.003921569, 0, 1, 1,
0.3577232, 1.772043, -0.3062937, 0.007843138, 0, 1, 1,
0.3591486, -0.2030791, 2.499803, 0.01568628, 0, 1, 1,
0.3591831, 0.6782953, -0.3673679, 0.01960784, 0, 1, 1,
0.359301, -1.120697, 3.080351, 0.02745098, 0, 1, 1,
0.3596473, 1.463662, -0.1969605, 0.03137255, 0, 1, 1,
0.3618227, 0.7700064, 0.7291762, 0.03921569, 0, 1, 1,
0.3653624, -2.768492, 2.262818, 0.04313726, 0, 1, 1,
0.3666041, -1.047277, 2.658073, 0.05098039, 0, 1, 1,
0.3700057, -0.7011996, 3.095796, 0.05490196, 0, 1, 1,
0.37285, 1.042116, 0.4356241, 0.0627451, 0, 1, 1,
0.3775301, -0.5707267, 2.0838, 0.06666667, 0, 1, 1,
0.3784126, 0.1214409, 2.882334, 0.07450981, 0, 1, 1,
0.3786621, 1.013145, -0.9765936, 0.07843138, 0, 1, 1,
0.3796327, -0.9860803, 2.393536, 0.08627451, 0, 1, 1,
0.380909, 2.541621, 0.510362, 0.09019608, 0, 1, 1,
0.381617, 0.3906043, 1.476588, 0.09803922, 0, 1, 1,
0.3824596, -0.3469951, 3.209579, 0.1058824, 0, 1, 1,
0.3979226, 1.100592, -2.61005, 0.1098039, 0, 1, 1,
0.3989397, -1.717207, 2.950337, 0.1176471, 0, 1, 1,
0.40593, -1.153522, 3.266243, 0.1215686, 0, 1, 1,
0.4071603, 0.5476295, 0.6303428, 0.1294118, 0, 1, 1,
0.4072801, -0.294336, 4.001195, 0.1333333, 0, 1, 1,
0.4115759, -0.9284517, 4.050924, 0.1411765, 0, 1, 1,
0.4117686, -0.09834238, 3.341381, 0.145098, 0, 1, 1,
0.4126213, 1.323356, 2.593816, 0.1529412, 0, 1, 1,
0.4127709, -0.001810488, 2.678195, 0.1568628, 0, 1, 1,
0.4132369, -0.7914231, 2.447326, 0.1647059, 0, 1, 1,
0.4197901, -0.3563391, 2.886448, 0.1686275, 0, 1, 1,
0.4242628, 1.564516, 0.8669947, 0.1764706, 0, 1, 1,
0.4276057, -2.28783, 3.380308, 0.1803922, 0, 1, 1,
0.4333507, -0.4751858, 4.322913, 0.1882353, 0, 1, 1,
0.4360662, -0.5328842, 2.676716, 0.1921569, 0, 1, 1,
0.43806, 0.3195597, 0.02073434, 0.2, 0, 1, 1,
0.4477706, -0.6181113, 2.20695, 0.2078431, 0, 1, 1,
0.4535506, 1.265081, -0.6364268, 0.2117647, 0, 1, 1,
0.4541102, -0.3563909, 2.772176, 0.2196078, 0, 1, 1,
0.4584207, -1.112195, 2.568758, 0.2235294, 0, 1, 1,
0.4615326, 0.9770066, -0.4309684, 0.2313726, 0, 1, 1,
0.4652887, 0.5107371, 0.05877604, 0.2352941, 0, 1, 1,
0.4672468, -0.871109, 1.374234, 0.2431373, 0, 1, 1,
0.4724085, 0.5231868, -0.4955612, 0.2470588, 0, 1, 1,
0.4767524, -0.9262065, 2.477262, 0.254902, 0, 1, 1,
0.4782277, -2.280439, 3.389024, 0.2588235, 0, 1, 1,
0.4803393, 1.698477, -0.5486364, 0.2666667, 0, 1, 1,
0.4867558, 0.3899685, 2.55289, 0.2705882, 0, 1, 1,
0.4868981, -1.732824, 2.69425, 0.2784314, 0, 1, 1,
0.487121, -1.028194, 3.220809, 0.282353, 0, 1, 1,
0.4896204, 1.275799, 0.5366158, 0.2901961, 0, 1, 1,
0.4916267, 0.1661135, 2.241518, 0.2941177, 0, 1, 1,
0.4931023, -0.2976264, 2.330108, 0.3019608, 0, 1, 1,
0.4931787, -1.802959, 2.649116, 0.3098039, 0, 1, 1,
0.4938962, 0.1506782, 2.04397, 0.3137255, 0, 1, 1,
0.4945469, 0.7195966, 1.324306, 0.3215686, 0, 1, 1,
0.5002677, 0.3622776, -0.09083018, 0.3254902, 0, 1, 1,
0.5027119, 0.6210538, 1.712662, 0.3333333, 0, 1, 1,
0.5042552, 0.06628174, 1.003274, 0.3372549, 0, 1, 1,
0.5070205, 0.1424818, 2.954162, 0.345098, 0, 1, 1,
0.5070928, -0.5551433, 2.919444, 0.3490196, 0, 1, 1,
0.5110104, 0.131715, 1.837278, 0.3568628, 0, 1, 1,
0.5139645, 0.09310384, 2.321595, 0.3607843, 0, 1, 1,
0.5157245, -1.044743, 4.714881, 0.3686275, 0, 1, 1,
0.5267622, 1.041477, 0.5751315, 0.372549, 0, 1, 1,
0.5297454, 0.8228413, 1.565928, 0.3803922, 0, 1, 1,
0.5331345, -0.9912097, 2.941342, 0.3843137, 0, 1, 1,
0.5336334, 0.2007902, 0.4839197, 0.3921569, 0, 1, 1,
0.534879, -0.7199824, 2.457486, 0.3960784, 0, 1, 1,
0.5460961, -1.627074, 2.526834, 0.4039216, 0, 1, 1,
0.5513485, 0.6757376, 0.6734192, 0.4117647, 0, 1, 1,
0.5673937, 1.669744, 2.61619, 0.4156863, 0, 1, 1,
0.5687075, 0.04304582, 1.134395, 0.4235294, 0, 1, 1,
0.569501, 0.4403881, 0.9059262, 0.427451, 0, 1, 1,
0.572975, 0.2993622, 1.189754, 0.4352941, 0, 1, 1,
0.5741295, -0.6305138, 3.216346, 0.4392157, 0, 1, 1,
0.5744859, -1.002382, 2.869733, 0.4470588, 0, 1, 1,
0.5757124, -0.351739, 1.231277, 0.4509804, 0, 1, 1,
0.5805847, 0.894945, -0.07615653, 0.4588235, 0, 1, 1,
0.5835302, 0.8987471, 1.276043, 0.4627451, 0, 1, 1,
0.5838315, -1.164054, 1.699587, 0.4705882, 0, 1, 1,
0.5839769, -0.8324999, 2.591348, 0.4745098, 0, 1, 1,
0.586365, -1.392522, 3.108435, 0.4823529, 0, 1, 1,
0.5885118, -0.4057742, 2.732903, 0.4862745, 0, 1, 1,
0.5974585, -0.1047817, 0.9035159, 0.4941176, 0, 1, 1,
0.598577, -0.5539039, 1.871543, 0.5019608, 0, 1, 1,
0.5997472, -0.7477732, 3.198818, 0.5058824, 0, 1, 1,
0.6003513, 0.4036888, 3.093826, 0.5137255, 0, 1, 1,
0.6005934, -0.4684079, 3.965046, 0.5176471, 0, 1, 1,
0.6008483, 1.250319, 1.275547, 0.5254902, 0, 1, 1,
0.6014684, 0.04977661, 1.791453, 0.5294118, 0, 1, 1,
0.6041629, -1.085305, 3.162193, 0.5372549, 0, 1, 1,
0.604733, -0.8676781, 1.819725, 0.5411765, 0, 1, 1,
0.6073973, 1.861971, 0.2877411, 0.5490196, 0, 1, 1,
0.614257, 0.09745391, 1.800219, 0.5529412, 0, 1, 1,
0.6240392, 1.459407, 1.2669, 0.5607843, 0, 1, 1,
0.6252245, 0.2567219, 0.4812022, 0.5647059, 0, 1, 1,
0.6267127, 1.005156, 1.112575, 0.572549, 0, 1, 1,
0.6310035, -0.8922142, 3.032239, 0.5764706, 0, 1, 1,
0.6336372, 0.583137, 1.444114, 0.5843138, 0, 1, 1,
0.6369399, 2.105413, 2.996288, 0.5882353, 0, 1, 1,
0.6417285, 0.05003749, 1.383309, 0.5960785, 0, 1, 1,
0.6502491, -1.113682, 2.452269, 0.6039216, 0, 1, 1,
0.6516445, 0.05039805, 2.512853, 0.6078432, 0, 1, 1,
0.6558461, 0.2442047, 2.286572, 0.6156863, 0, 1, 1,
0.6567765, 0.6251556, 0.6824932, 0.6196079, 0, 1, 1,
0.6640821, 1.886543, 0.1039519, 0.627451, 0, 1, 1,
0.6642581, 0.3171447, 1.876427, 0.6313726, 0, 1, 1,
0.6682658, -0.7854598, 2.923691, 0.6392157, 0, 1, 1,
0.6804495, 0.4948531, -0.9744482, 0.6431373, 0, 1, 1,
0.6946821, 0.2579777, 1.934904, 0.6509804, 0, 1, 1,
0.6956599, 1.290287, 0.7962296, 0.654902, 0, 1, 1,
0.6991927, -1.483304, 3.219435, 0.6627451, 0, 1, 1,
0.6998274, 1.400106, 0.6358087, 0.6666667, 0, 1, 1,
0.6999466, 0.6911358, 0.771174, 0.6745098, 0, 1, 1,
0.7016762, -0.684333, 3.493123, 0.6784314, 0, 1, 1,
0.7042354, -1.672973, 1.909892, 0.6862745, 0, 1, 1,
0.7067047, 0.1165465, 2.199432, 0.6901961, 0, 1, 1,
0.7116059, -2.117015, 3.492121, 0.6980392, 0, 1, 1,
0.7163361, 0.5040943, 1.00262, 0.7058824, 0, 1, 1,
0.7187834, -1.537681, 2.615328, 0.7098039, 0, 1, 1,
0.7222625, -0.6469883, 1.883891, 0.7176471, 0, 1, 1,
0.7321991, -0.4643723, 2.672237, 0.7215686, 0, 1, 1,
0.738876, 1.531451, -0.7537205, 0.7294118, 0, 1, 1,
0.7478094, -1.203553, 3.40324, 0.7333333, 0, 1, 1,
0.7557815, 0.2356487, 1.831615, 0.7411765, 0, 1, 1,
0.7575715, -1.273387, 2.021346, 0.7450981, 0, 1, 1,
0.7614711, 0.4077751, -0.4925881, 0.7529412, 0, 1, 1,
0.7668033, 0.9171999, 0.8332506, 0.7568628, 0, 1, 1,
0.7740136, -1.324926, 5.20329, 0.7647059, 0, 1, 1,
0.7780077, -1.362604, 2.405603, 0.7686275, 0, 1, 1,
0.7794424, 0.8008677, -0.4930216, 0.7764706, 0, 1, 1,
0.7812931, 0.1264652, 2.0516, 0.7803922, 0, 1, 1,
0.783793, -0.01076248, 1.747989, 0.7882353, 0, 1, 1,
0.7939354, -0.7558857, 1.306191, 0.7921569, 0, 1, 1,
0.7975401, 0.3304443, 1.567228, 0.8, 0, 1, 1,
0.7987919, 0.4477489, -0.09107619, 0.8078431, 0, 1, 1,
0.8044031, -1.114638, 3.054804, 0.8117647, 0, 1, 1,
0.8044138, 0.5477336, -0.3271362, 0.8196079, 0, 1, 1,
0.8091756, 0.2313343, 1.749577, 0.8235294, 0, 1, 1,
0.8092926, -1.559743, 1.688255, 0.8313726, 0, 1, 1,
0.8179903, 0.3510641, 1.508536, 0.8352941, 0, 1, 1,
0.8208674, -0.3138616, 2.920683, 0.8431373, 0, 1, 1,
0.8236346, -0.3907767, 0.9000727, 0.8470588, 0, 1, 1,
0.8261791, -0.888972, 1.589302, 0.854902, 0, 1, 1,
0.8261968, -0.2087624, 1.432234, 0.8588235, 0, 1, 1,
0.8268648, -0.8265423, 3.119343, 0.8666667, 0, 1, 1,
0.829595, 0.09728406, 0.2480237, 0.8705882, 0, 1, 1,
0.8357455, -0.8863866, 2.330271, 0.8784314, 0, 1, 1,
0.841486, 0.2704085, 1.596386, 0.8823529, 0, 1, 1,
0.8565425, 1.633287, -0.8282357, 0.8901961, 0, 1, 1,
0.8654788, 0.6059576, -0.1883582, 0.8941177, 0, 1, 1,
0.8659351, 0.6851809, -1.335325, 0.9019608, 0, 1, 1,
0.8680258, -0.1942108, 1.141333, 0.9098039, 0, 1, 1,
0.8702762, 1.48368, 1.656397, 0.9137255, 0, 1, 1,
0.872147, -1.717692, 2.686662, 0.9215686, 0, 1, 1,
0.872291, 1.093906, 1.341887, 0.9254902, 0, 1, 1,
0.8738275, -0.1727929, 2.964667, 0.9333333, 0, 1, 1,
0.8795158, -0.2257532, 2.07089, 0.9372549, 0, 1, 1,
0.8820551, -0.9285468, 0.7813643, 0.945098, 0, 1, 1,
0.8844154, -1.032063, 3.989371, 0.9490196, 0, 1, 1,
0.8881223, 1.62323, -0.3055646, 0.9568627, 0, 1, 1,
0.8958516, 0.5466532, 1.506471, 0.9607843, 0, 1, 1,
0.897899, 0.680494, 0.8804944, 0.9686275, 0, 1, 1,
0.8982599, 0.8779767, -0.4284344, 0.972549, 0, 1, 1,
0.9030601, 2.02633, 0.5992024, 0.9803922, 0, 1, 1,
0.9048005, 0.1055978, 2.847965, 0.9843137, 0, 1, 1,
0.9065239, -0.5161623, 2.000235, 0.9921569, 0, 1, 1,
0.9099553, 0.9243485, 0.40519, 0.9960784, 0, 1, 1,
0.9127567, 0.6535733, 0.9582915, 1, 0, 0.9960784, 1,
0.9128247, -0.06448796, 2.217628, 1, 0, 0.9882353, 1,
0.9151539, 0.2975311, 1.589227, 1, 0, 0.9843137, 1,
0.9155882, 0.1030503, 1.521182, 1, 0, 0.9764706, 1,
0.9156402, -0.9319769, 0.6982433, 1, 0, 0.972549, 1,
0.9164112, 1.271766, 0.5847774, 1, 0, 0.9647059, 1,
0.92935, 0.63601, 1.467756, 1, 0, 0.9607843, 1,
0.9330611, -0.04912736, 1.442969, 1, 0, 0.9529412, 1,
0.9331917, 0.259764, 0.8208233, 1, 0, 0.9490196, 1,
0.9364969, 0.748256, -1.109783, 1, 0, 0.9411765, 1,
0.9425825, 1.063437, 1.718408, 1, 0, 0.9372549, 1,
0.9463387, -0.6420514, 2.358984, 1, 0, 0.9294118, 1,
0.9507797, 3.199912, 1.032906, 1, 0, 0.9254902, 1,
0.951998, -0.8093457, 3.020313, 1, 0, 0.9176471, 1,
0.9548556, -1.194314, 3.76283, 1, 0, 0.9137255, 1,
0.9643542, -1.579107, 2.13746, 1, 0, 0.9058824, 1,
0.9650572, 1.339852, -0.5790616, 1, 0, 0.9019608, 1,
0.9762626, 1.286108, 2.537562, 1, 0, 0.8941177, 1,
0.9855526, -1.606763, 2.909807, 1, 0, 0.8862745, 1,
0.9880906, -0.3588615, 0.9918628, 1, 0, 0.8823529, 1,
0.9906462, 0.3527703, -1.508551, 1, 0, 0.8745098, 1,
0.9916886, -0.8066579, 2.690676, 1, 0, 0.8705882, 1,
0.9933047, -0.5510099, 2.881156, 1, 0, 0.8627451, 1,
0.9950368, 0.168061, 1.053899, 1, 0, 0.8588235, 1,
1.001307, 1.037986, -0.148517, 1, 0, 0.8509804, 1,
1.004081, -0.7788095, 2.412272, 1, 0, 0.8470588, 1,
1.009191, -1.317925, 1.353198, 1, 0, 0.8392157, 1,
1.009429, 0.4995424, 1.860514, 1, 0, 0.8352941, 1,
1.027158, -0.2866736, 2.38333, 1, 0, 0.827451, 1,
1.0277, -0.3474348, 3.422348, 1, 0, 0.8235294, 1,
1.034791, -0.4047656, 2.873128, 1, 0, 0.8156863, 1,
1.037688, 0.4551247, 2.704619, 1, 0, 0.8117647, 1,
1.038843, -1.270873, 3.851939, 1, 0, 0.8039216, 1,
1.042714, 0.278324, 0.1426636, 1, 0, 0.7960784, 1,
1.048503, 0.8737229, -0.5354173, 1, 0, 0.7921569, 1,
1.069386, -1.750775, 3.680691, 1, 0, 0.7843137, 1,
1.071374, 0.0771649, 2.097699, 1, 0, 0.7803922, 1,
1.071663, -0.2963778, 1.768883, 1, 0, 0.772549, 1,
1.079753, 2.180434, 1.494324, 1, 0, 0.7686275, 1,
1.08408, -0.0421122, 0.8304189, 1, 0, 0.7607843, 1,
1.087573, 0.6929902, 0.8845388, 1, 0, 0.7568628, 1,
1.102403, 1.979169, 0.4932486, 1, 0, 0.7490196, 1,
1.104775, 0.06478619, 2.324266, 1, 0, 0.7450981, 1,
1.109999, -0.8179935, 1.639972, 1, 0, 0.7372549, 1,
1.125546, 0.6205116, -0.002044294, 1, 0, 0.7333333, 1,
1.125744, -0.5850933, 3.649452, 1, 0, 0.7254902, 1,
1.132501, 0.5252094, -0.3098626, 1, 0, 0.7215686, 1,
1.137954, -1.090937, 1.70836, 1, 0, 0.7137255, 1,
1.147977, -0.3711431, 2.888981, 1, 0, 0.7098039, 1,
1.156262, -0.09428505, 2.600216, 1, 0, 0.7019608, 1,
1.159318, 1.604122, 0.8269435, 1, 0, 0.6941177, 1,
1.160545, -0.9292355, 1.68309, 1, 0, 0.6901961, 1,
1.164217, 0.7647426, 1.123927, 1, 0, 0.682353, 1,
1.166724, -0.04468842, 0.2715466, 1, 0, 0.6784314, 1,
1.173767, -0.3813366, 1.566353, 1, 0, 0.6705883, 1,
1.17383, -1.111356, 1.298136, 1, 0, 0.6666667, 1,
1.179261, 0.2509642, 2.062108, 1, 0, 0.6588235, 1,
1.18104, -0.5626741, 3.227206, 1, 0, 0.654902, 1,
1.192402, -0.4078262, 2.891504, 1, 0, 0.6470588, 1,
1.202772, 1.141705, 2.53579, 1, 0, 0.6431373, 1,
1.208126, -0.5959595, 1.905446, 1, 0, 0.6352941, 1,
1.208938, 0.9387199, 2.677134, 1, 0, 0.6313726, 1,
1.209474, -0.133796, 0.6115991, 1, 0, 0.6235294, 1,
1.225037, 2.392701, 1.612133, 1, 0, 0.6196079, 1,
1.234717, -1.1914, 1.113849, 1, 0, 0.6117647, 1,
1.252782, -1.134214, 0.9261475, 1, 0, 0.6078432, 1,
1.259274, 0.2834915, 2.999771, 1, 0, 0.6, 1,
1.27737, 1.243386, 1.092525, 1, 0, 0.5921569, 1,
1.283466, 1.929923, 1.5868, 1, 0, 0.5882353, 1,
1.284007, 1.863678, 1.290306, 1, 0, 0.5803922, 1,
1.284685, 0.04765652, 0.7306566, 1, 0, 0.5764706, 1,
1.285749, 0.9856777, -0.6396878, 1, 0, 0.5686275, 1,
1.287604, 0.4477987, 3.500052, 1, 0, 0.5647059, 1,
1.319163, -0.2491656, 4.30384, 1, 0, 0.5568628, 1,
1.326741, 0.5063136, 0.4643709, 1, 0, 0.5529412, 1,
1.329847, 1.019612, 0.9880481, 1, 0, 0.5450981, 1,
1.330854, 0.008227624, 2.925755, 1, 0, 0.5411765, 1,
1.33348, -1.184152, 1.604772, 1, 0, 0.5333334, 1,
1.342434, 0.8921549, 1.131521, 1, 0, 0.5294118, 1,
1.343659, -0.3297715, 1.971534, 1, 0, 0.5215687, 1,
1.345572, 1.762322, 1.435859, 1, 0, 0.5176471, 1,
1.34766, 0.5561945, 1.116854, 1, 0, 0.509804, 1,
1.357713, -0.1249911, 2.843498, 1, 0, 0.5058824, 1,
1.358108, 0.16005, 3.262867, 1, 0, 0.4980392, 1,
1.382082, -1.593609, 2.371906, 1, 0, 0.4901961, 1,
1.382841, 2.161668, -0.306298, 1, 0, 0.4862745, 1,
1.384173, -0.5108839, 2.351585, 1, 0, 0.4784314, 1,
1.386989, -1.01464, 1.456936, 1, 0, 0.4745098, 1,
1.417298, -0.6276452, 0.6955342, 1, 0, 0.4666667, 1,
1.420436, -0.7442319, 2.935158, 1, 0, 0.4627451, 1,
1.42389, -1.32733, 2.916024, 1, 0, 0.454902, 1,
1.425144, -0.5790278, 0.8831324, 1, 0, 0.4509804, 1,
1.436326, -1.046314, 2.210198, 1, 0, 0.4431373, 1,
1.440393, 2.927997, 0.7757805, 1, 0, 0.4392157, 1,
1.449279, -0.3317589, -0.02375749, 1, 0, 0.4313726, 1,
1.455934, -0.591476, 2.2555, 1, 0, 0.427451, 1,
1.460668, -0.03822807, 1.922982, 1, 0, 0.4196078, 1,
1.465054, -0.3784283, 2.443987, 1, 0, 0.4156863, 1,
1.494239, 0.5504999, 2.365118, 1, 0, 0.4078431, 1,
1.500135, -0.8605195, 0.7175968, 1, 0, 0.4039216, 1,
1.508642, 0.6996015, 1.053949, 1, 0, 0.3960784, 1,
1.525464, 0.2588257, 1.877097, 1, 0, 0.3882353, 1,
1.543784, 0.0141671, 2.261518, 1, 0, 0.3843137, 1,
1.54587, -0.4525889, -0.8381034, 1, 0, 0.3764706, 1,
1.54785, -1.186717, 1.604941, 1, 0, 0.372549, 1,
1.548304, -0.812121, 2.513554, 1, 0, 0.3647059, 1,
1.559816, -0.4323014, 1.008483, 1, 0, 0.3607843, 1,
1.56351, 0.2868871, 1.973434, 1, 0, 0.3529412, 1,
1.565697, 1.240275, 1.581703, 1, 0, 0.3490196, 1,
1.567987, 0.6333945, 0.8297166, 1, 0, 0.3411765, 1,
1.578519, -1.006366, 2.937088, 1, 0, 0.3372549, 1,
1.578915, -0.05071035, 2.829178, 1, 0, 0.3294118, 1,
1.597883, -1.158262, 2.326292, 1, 0, 0.3254902, 1,
1.627596, 0.1782499, 1.632837, 1, 0, 0.3176471, 1,
1.628757, 0.4106738, 0.649226, 1, 0, 0.3137255, 1,
1.6494, -0.5546539, 1.851313, 1, 0, 0.3058824, 1,
1.657065, 0.2100635, -0.278599, 1, 0, 0.2980392, 1,
1.658496, 0.281301, 0.7748194, 1, 0, 0.2941177, 1,
1.662504, 1.127664, 0.007541314, 1, 0, 0.2862745, 1,
1.684732, 1.348149, 0.9291868, 1, 0, 0.282353, 1,
1.699589, 0.1555912, 1.071991, 1, 0, 0.2745098, 1,
1.708686, 0.7871405, 1.940747, 1, 0, 0.2705882, 1,
1.710671, -0.06397274, -0.444076, 1, 0, 0.2627451, 1,
1.711827, -0.4313536, 2.601797, 1, 0, 0.2588235, 1,
1.716206, 0.6084384, 0.06236416, 1, 0, 0.2509804, 1,
1.716499, 0.5303845, 2.328363, 1, 0, 0.2470588, 1,
1.735261, 0.7972946, 2.171875, 1, 0, 0.2392157, 1,
1.741936, -0.523221, 2.397987, 1, 0, 0.2352941, 1,
1.746823, 1.795316, 1.731065, 1, 0, 0.227451, 1,
1.750546, -0.02990948, 0.8364872, 1, 0, 0.2235294, 1,
1.777081, -0.6036946, 2.606205, 1, 0, 0.2156863, 1,
1.796352, -1.70145, 3.2145, 1, 0, 0.2117647, 1,
1.809906, -0.448241, 0.7328453, 1, 0, 0.2039216, 1,
1.812449, -0.7664392, 3.584324, 1, 0, 0.1960784, 1,
1.823128, 0.7820025, 0.4508539, 1, 0, 0.1921569, 1,
1.879976, -1.173081, 0.5655842, 1, 0, 0.1843137, 1,
1.912858, 0.3342359, 2.171013, 1, 0, 0.1803922, 1,
1.91412, -0.8715883, 1.444235, 1, 0, 0.172549, 1,
1.916545, 0.2424064, 2.591463, 1, 0, 0.1686275, 1,
1.916727, 0.1515475, 2.705175, 1, 0, 0.1607843, 1,
1.940313, -2.380525, 2.614719, 1, 0, 0.1568628, 1,
1.989509, -0.282574, 2.080646, 1, 0, 0.1490196, 1,
2.01919, -0.9842282, 2.476451, 1, 0, 0.145098, 1,
2.030737, -1.477512, 1.529658, 1, 0, 0.1372549, 1,
2.031253, -2.266653, 0.4548435, 1, 0, 0.1333333, 1,
2.054602, 0.3177727, 3.125108, 1, 0, 0.1254902, 1,
2.07064, -0.6237847, 3.231694, 1, 0, 0.1215686, 1,
2.145811, 0.8281084, 1.232086, 1, 0, 0.1137255, 1,
2.151798, 0.08357217, 2.116589, 1, 0, 0.1098039, 1,
2.170929, 0.5136098, 3.116991, 1, 0, 0.1019608, 1,
2.212242, -0.8009017, 1.475361, 1, 0, 0.09411765, 1,
2.250457, -0.6312299, 1.707782, 1, 0, 0.09019608, 1,
2.270193, 0.6591396, 1.965606, 1, 0, 0.08235294, 1,
2.275731, 0.4981408, -0.7494798, 1, 0, 0.07843138, 1,
2.280918, 0.0253722, -1.25486, 1, 0, 0.07058824, 1,
2.293977, -1.052922, 2.424929, 1, 0, 0.06666667, 1,
2.355258, -0.7303241, 2.009933, 1, 0, 0.05882353, 1,
2.371385, 0.2004222, 1.637977, 1, 0, 0.05490196, 1,
2.438766, 0.3099139, 3.345437, 1, 0, 0.04705882, 1,
2.46012, -0.2353998, 1.145517, 1, 0, 0.04313726, 1,
2.484925, 0.029631, -0.06181085, 1, 0, 0.03529412, 1,
2.528549, 0.1628534, 2.444779, 1, 0, 0.03137255, 1,
2.539355, 0.3893805, 1.282638, 1, 0, 0.02352941, 1,
2.612865, -0.3845922, 2.636979, 1, 0, 0.01960784, 1,
2.870491, -0.4750032, 1.345754, 1, 0, 0.01176471, 1,
3.377945, 1.10698, 2.237011, 1, 0, 0.007843138, 1
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
0.1475127, -4.146241, -7.64762, 0, -0.5, 0.5, 0.5,
0.1475127, -4.146241, -7.64762, 1, -0.5, 0.5, 0.5,
0.1475127, -4.146241, -7.64762, 1, 1.5, 0.5, 0.5,
0.1475127, -4.146241, -7.64762, 0, 1.5, 0.5, 0.5
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
-4.178037, 0.05918825, -7.64762, 0, -0.5, 0.5, 0.5,
-4.178037, 0.05918825, -7.64762, 1, -0.5, 0.5, 0.5,
-4.178037, 0.05918825, -7.64762, 1, 1.5, 0.5, 0.5,
-4.178037, 0.05918825, -7.64762, 0, 1.5, 0.5, 0.5
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
-4.178037, -4.146241, -0.2908998, 0, -0.5, 0.5, 0.5,
-4.178037, -4.146241, -0.2908998, 1, -0.5, 0.5, 0.5,
-4.178037, -4.146241, -0.2908998, 1, 1.5, 0.5, 0.5,
-4.178037, -4.146241, -0.2908998, 0, 1.5, 0.5, 0.5
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
-3, -3.175757, -5.949915,
3, -3.175757, -5.949915,
-3, -3.175757, -5.949915,
-3, -3.337504, -6.232866,
-2, -3.175757, -5.949915,
-2, -3.337504, -6.232866,
-1, -3.175757, -5.949915,
-1, -3.337504, -6.232866,
0, -3.175757, -5.949915,
0, -3.337504, -6.232866,
1, -3.175757, -5.949915,
1, -3.337504, -6.232866,
2, -3.175757, -5.949915,
2, -3.337504, -6.232866,
3, -3.175757, -5.949915,
3, -3.337504, -6.232866
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
-3, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
-3, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
-3, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
-3, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
-2, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
-2, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
-2, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
-2, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
-1, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
-1, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
-1, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
-1, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
0, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
0, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
0, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
0, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
1, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
1, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
1, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
1, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
2, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
2, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
2, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
2, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5,
3, -3.660999, -6.798768, 0, -0.5, 0.5, 0.5,
3, -3.660999, -6.798768, 1, -0.5, 0.5, 0.5,
3, -3.660999, -6.798768, 1, 1.5, 0.5, 0.5,
3, -3.660999, -6.798768, 0, 1.5, 0.5, 0.5
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
-3.179833, -3, -5.949915,
-3.179833, 3, -5.949915,
-3.179833, -3, -5.949915,
-3.3462, -3, -6.232866,
-3.179833, -2, -5.949915,
-3.3462, -2, -6.232866,
-3.179833, -1, -5.949915,
-3.3462, -1, -6.232866,
-3.179833, 0, -5.949915,
-3.3462, 0, -6.232866,
-3.179833, 1, -5.949915,
-3.3462, 1, -6.232866,
-3.179833, 2, -5.949915,
-3.3462, 2, -6.232866,
-3.179833, 3, -5.949915,
-3.3462, 3, -6.232866
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
-3.678935, -3, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, -3, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, -3, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, -3, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, -2, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, -2, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, -2, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, -2, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, -1, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, -1, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, -1, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, -1, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, 0, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, 0, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, 0, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, 0, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, 1, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, 1, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, 1, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, 1, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, 2, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, 2, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, 2, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, 2, -6.798768, 0, 1.5, 0.5, 0.5,
-3.678935, 3, -6.798768, 0, -0.5, 0.5, 0.5,
-3.678935, 3, -6.798768, 1, -0.5, 0.5, 0.5,
-3.678935, 3, -6.798768, 1, 1.5, 0.5, 0.5,
-3.678935, 3, -6.798768, 0, 1.5, 0.5, 0.5
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
-3.179833, -3.175757, -4,
-3.179833, -3.175757, 4,
-3.179833, -3.175757, -4,
-3.3462, -3.337504, -4,
-3.179833, -3.175757, -2,
-3.3462, -3.337504, -2,
-3.179833, -3.175757, 0,
-3.3462, -3.337504, 0,
-3.179833, -3.175757, 2,
-3.3462, -3.337504, 2,
-3.179833, -3.175757, 4,
-3.3462, -3.337504, 4
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
-3.678935, -3.660999, -4, 0, -0.5, 0.5, 0.5,
-3.678935, -3.660999, -4, 1, -0.5, 0.5, 0.5,
-3.678935, -3.660999, -4, 1, 1.5, 0.5, 0.5,
-3.678935, -3.660999, -4, 0, 1.5, 0.5, 0.5,
-3.678935, -3.660999, -2, 0, -0.5, 0.5, 0.5,
-3.678935, -3.660999, -2, 1, -0.5, 0.5, 0.5,
-3.678935, -3.660999, -2, 1, 1.5, 0.5, 0.5,
-3.678935, -3.660999, -2, 0, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 0, 0, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 0, 1, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 0, 1, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 0, 0, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 2, 0, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 2, 1, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 2, 1, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 2, 0, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 4, 0, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 4, 1, -0.5, 0.5, 0.5,
-3.678935, -3.660999, 4, 1, 1.5, 0.5, 0.5,
-3.678935, -3.660999, 4, 0, 1.5, 0.5, 0.5
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
-3.179833, -3.175757, -5.949915,
-3.179833, 3.294133, -5.949915,
-3.179833, -3.175757, 5.368116,
-3.179833, 3.294133, 5.368116,
-3.179833, -3.175757, -5.949915,
-3.179833, -3.175757, 5.368116,
-3.179833, 3.294133, -5.949915,
-3.179833, 3.294133, 5.368116,
-3.179833, -3.175757, -5.949915,
3.474859, -3.175757, -5.949915,
-3.179833, -3.175757, 5.368116,
3.474859, -3.175757, 5.368116,
-3.179833, 3.294133, -5.949915,
3.474859, 3.294133, -5.949915,
-3.179833, 3.294133, 5.368116,
3.474859, 3.294133, 5.368116,
3.474859, -3.175757, -5.949915,
3.474859, 3.294133, -5.949915,
3.474859, -3.175757, 5.368116,
3.474859, 3.294133, 5.368116,
3.474859, -3.175757, -5.949915,
3.474859, -3.175757, 5.368116,
3.474859, 3.294133, -5.949915,
3.474859, 3.294133, 5.368116
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
var radius = 7.815882;
var distance = 34.77374;
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
mvMatrix.translate( -0.1475127, -0.05918825, 0.2908998 );
mvMatrix.scale( 1.269884, 1.306156, 0.7466568 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.77374);
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
1-Triazolylethylethe<-read.table("1-Triazolylethylethe.xyz", skip=1)
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
-3.08292, -1.028037, -1.757986, 0, 0, 1, 1, 1,
-2.891411, 1.167566, -1.071261, 1, 0, 0, 1, 1,
-2.558481, 1.622104, -0.7418475, 1, 0, 0, 1, 1,
-2.541104, -0.1795667, -2.071184, 1, 0, 0, 1, 1,
-2.515918, -0.650169, -2.221404, 1, 0, 0, 1, 1,
-2.51088, -0.2069432, -2.024842, 1, 0, 0, 1, 1,
-2.48216, 0.1299548, -2.044925, 0, 0, 0, 1, 1,
-2.436323, -1.027504, -1.68551, 0, 0, 0, 1, 1,
-2.427992, -0.1268704, -1.983198, 0, 0, 0, 1, 1,
-2.339583, 0.001162494, 0.1279736, 0, 0, 0, 1, 1,
-2.336833, -0.5632449, -1.074426, 0, 0, 0, 1, 1,
-2.24895, 0.6366329, -1.53688, 0, 0, 0, 1, 1,
-2.239838, -0.7007365, -1.063406, 0, 0, 0, 1, 1,
-2.232249, 0.1081112, -1.754598, 1, 1, 1, 1, 1,
-2.228747, -0.02757129, -1.369845, 1, 1, 1, 1, 1,
-2.183083, 1.458919, -0.0318181, 1, 1, 1, 1, 1,
-2.123135, 0.9334616, -0.4308969, 1, 1, 1, 1, 1,
-2.115135, 0.2242021, -2.156654, 1, 1, 1, 1, 1,
-2.108856, -0.1203068, -2.665141, 1, 1, 1, 1, 1,
-2.066825, -2.332357, -3.740709, 1, 1, 1, 1, 1,
-2.040907, -0.1328966, -2.852562, 1, 1, 1, 1, 1,
-2.029749, 1.746753, 0.5512875, 1, 1, 1, 1, 1,
-2.019733, -0.5290093, -1.537957, 1, 1, 1, 1, 1,
-2.01884, -0.2864619, -0.8377128, 1, 1, 1, 1, 1,
-2.014168, 0.1042015, -2.623098, 1, 1, 1, 1, 1,
-1.986834, 0.9753603, -3.152719, 1, 1, 1, 1, 1,
-1.943332, 0.5046756, -1.109934, 1, 1, 1, 1, 1,
-1.914414, 2.437433, -0.3089872, 1, 1, 1, 1, 1,
-1.912155, 0.3469001, -1.106388, 0, 0, 1, 1, 1,
-1.896969, -0.6279858, -1.21174, 1, 0, 0, 1, 1,
-1.896282, -0.3595173, -1.293502, 1, 0, 0, 1, 1,
-1.893844, 0.2240441, -2.094969, 1, 0, 0, 1, 1,
-1.887265, -0.227942, -5.223194, 1, 0, 0, 1, 1,
-1.880204, -0.9143618, -2.044375, 1, 0, 0, 1, 1,
-1.808613, -0.7381346, -1.315139, 0, 0, 0, 1, 1,
-1.805977, 0.06683691, 0.1052618, 0, 0, 0, 1, 1,
-1.77847, -1.054657, -2.488926, 0, 0, 0, 1, 1,
-1.769146, 1.434326, -1.919491, 0, 0, 0, 1, 1,
-1.760542, -0.3844192, -1.03908, 0, 0, 0, 1, 1,
-1.760221, 2.577508, 0.924329, 0, 0, 0, 1, 1,
-1.747844, 0.02112385, -1.344979, 0, 0, 0, 1, 1,
-1.736637, 0.4173623, 0.104573, 1, 1, 1, 1, 1,
-1.72808, 0.6858049, -2.145869, 1, 1, 1, 1, 1,
-1.725464, -0.6614569, -1.753884, 1, 1, 1, 1, 1,
-1.716421, -0.6826862, -2.401625, 1, 1, 1, 1, 1,
-1.700401, -1.11003, -1.727015, 1, 1, 1, 1, 1,
-1.6791, 1.840084, -0.8329847, 1, 1, 1, 1, 1,
-1.673417, -1.310985, -2.610977, 1, 1, 1, 1, 1,
-1.667011, 0.7384052, -0.7142618, 1, 1, 1, 1, 1,
-1.66312, 1.301908, -1.171498, 1, 1, 1, 1, 1,
-1.659913, -0.1427201, -1.990714, 1, 1, 1, 1, 1,
-1.644282, -0.3545696, -2.49938, 1, 1, 1, 1, 1,
-1.634573, -0.4057745, -2.186267, 1, 1, 1, 1, 1,
-1.629407, 1.116738, -1.309553, 1, 1, 1, 1, 1,
-1.628811, 0.8013167, -1.813427, 1, 1, 1, 1, 1,
-1.618115, 1.013627, -0.8880184, 1, 1, 1, 1, 1,
-1.594077, 0.9776136, -1.212919, 0, 0, 1, 1, 1,
-1.584359, -1.711158, -1.878582, 1, 0, 0, 1, 1,
-1.57955, 0.616484, -0.8453693, 1, 0, 0, 1, 1,
-1.578835, 0.4008571, -2.388659, 1, 0, 0, 1, 1,
-1.556888, 0.5709942, -1.739104, 1, 0, 0, 1, 1,
-1.543522, 0.8423835, -0.2738225, 1, 0, 0, 1, 1,
-1.539711, 0.9502636, -1.250994, 0, 0, 0, 1, 1,
-1.538342, 1.868629, -0.5193954, 0, 0, 0, 1, 1,
-1.535335, -0.9307857, -1.980659, 0, 0, 0, 1, 1,
-1.507414, -0.3175861, -2.452738, 0, 0, 0, 1, 1,
-1.502252, -0.06733837, -1.304045, 0, 0, 0, 1, 1,
-1.499606, -1.073156, -1.706367, 0, 0, 0, 1, 1,
-1.474788, -2.364077, -3.557365, 0, 0, 0, 1, 1,
-1.474252, 0.1610726, -0.4680101, 1, 1, 1, 1, 1,
-1.471258, -1.154127, -1.453719, 1, 1, 1, 1, 1,
-1.470128, -0.4072325, -1.400764, 1, 1, 1, 1, 1,
-1.467103, -0.6461338, -2.458831, 1, 1, 1, 1, 1,
-1.438613, -0.03966826, -2.994948, 1, 1, 1, 1, 1,
-1.435463, -1.372994, -1.961498, 1, 1, 1, 1, 1,
-1.412238, -0.7560341, -2.61493, 1, 1, 1, 1, 1,
-1.40879, 1.00492, 0.4378905, 1, 1, 1, 1, 1,
-1.408095, -1.995427, -2.274457, 1, 1, 1, 1, 1,
-1.39747, -1.29951, -2.748581, 1, 1, 1, 1, 1,
-1.395789, -0.8024874, -2.142535, 1, 1, 1, 1, 1,
-1.39406, 0.8069662, -3.634715, 1, 1, 1, 1, 1,
-1.393329, 1.261763, -1.73663, 1, 1, 1, 1, 1,
-1.387995, -1.117072, -2.473959, 1, 1, 1, 1, 1,
-1.387407, 0.7998906, -1.28413, 1, 1, 1, 1, 1,
-1.376298, -0.8076211, -2.804206, 0, 0, 1, 1, 1,
-1.370851, -0.6141221, -3.706364, 1, 0, 0, 1, 1,
-1.360462, -1.316994, -2.317007, 1, 0, 0, 1, 1,
-1.358912, 0.06393765, -0.8137275, 1, 0, 0, 1, 1,
-1.354892, -1.326365, -1.387583, 1, 0, 0, 1, 1,
-1.347533, 0.05008433, -1.896221, 1, 0, 0, 1, 1,
-1.344803, 0.7527482, -2.91363, 0, 0, 0, 1, 1,
-1.336927, -0.8374236, -2.584294, 0, 0, 0, 1, 1,
-1.331296, -0.1483465, -2.296551, 0, 0, 0, 1, 1,
-1.330628, 1.128045, 0.4022664, 0, 0, 0, 1, 1,
-1.328631, -0.8209903, -3.515248, 0, 0, 0, 1, 1,
-1.326151, -0.486782, -2.203759, 0, 0, 0, 1, 1,
-1.324932, 0.9332574, -1.713391, 0, 0, 0, 1, 1,
-1.323737, -0.7778242, -1.910659, 1, 1, 1, 1, 1,
-1.321687, 0.2837986, -0.03651017, 1, 1, 1, 1, 1,
-1.312743, 1.436313, 0.2891401, 1, 1, 1, 1, 1,
-1.311915, 2.137389, -0.9742381, 1, 1, 1, 1, 1,
-1.303192, -1.515611, -0.6952382, 1, 1, 1, 1, 1,
-1.298874, -0.1281137, -2.904271, 1, 1, 1, 1, 1,
-1.294188, -2.673259, -4.408017, 1, 1, 1, 1, 1,
-1.283947, 0.5289261, -0.05401231, 1, 1, 1, 1, 1,
-1.282836, -2.219482, -2.352718, 1, 1, 1, 1, 1,
-1.282277, 0.6790673, -1.372298, 1, 1, 1, 1, 1,
-1.279943, -0.4252224, -2.036124, 1, 1, 1, 1, 1,
-1.276566, 0.03524911, -0.3578134, 1, 1, 1, 1, 1,
-1.276483, 1.428221, -1.923015, 1, 1, 1, 1, 1,
-1.270972, -0.967132, -1.762088, 1, 1, 1, 1, 1,
-1.270135, -0.5539104, -1.347236, 1, 1, 1, 1, 1,
-1.269278, -0.2381811, 0.1133602, 0, 0, 1, 1, 1,
-1.2683, -0.7066194, -1.372754, 1, 0, 0, 1, 1,
-1.254978, 0.4202538, -2.713341, 1, 0, 0, 1, 1,
-1.248252, -1.43043, -3.575743, 1, 0, 0, 1, 1,
-1.248157, 0.1656912, -2.98932, 1, 0, 0, 1, 1,
-1.242598, -0.7638497, -0.9378933, 1, 0, 0, 1, 1,
-1.233922, 0.1180615, -0.4325065, 0, 0, 0, 1, 1,
-1.214535, 0.08149409, -1.990904, 0, 0, 0, 1, 1,
-1.213561, 0.494415, -0.9577968, 0, 0, 0, 1, 1,
-1.210386, 0.1013184, -1.840799, 0, 0, 0, 1, 1,
-1.210278, 0.5456443, -0.4872299, 0, 0, 0, 1, 1,
-1.201873, -1.925726, -4.559485, 0, 0, 0, 1, 1,
-1.201803, -0.7022178, -1.947773, 0, 0, 0, 1, 1,
-1.199225, 0.2272491, -2.695903, 1, 1, 1, 1, 1,
-1.197895, 1.022233, 0.4571097, 1, 1, 1, 1, 1,
-1.193137, 0.9584222, -2.117696, 1, 1, 1, 1, 1,
-1.190915, 0.5093213, -2.310717, 1, 1, 1, 1, 1,
-1.185603, -0.3615635, 0.1289869, 1, 1, 1, 1, 1,
-1.180438, -0.3753053, -0.7120509, 1, 1, 1, 1, 1,
-1.180174, 0.4108318, 0.3648034, 1, 1, 1, 1, 1,
-1.17653, -0.7929474, -3.277623, 1, 1, 1, 1, 1,
-1.167977, -0.2582545, -1.123628, 1, 1, 1, 1, 1,
-1.167277, 0.1840233, -2.282676, 1, 1, 1, 1, 1,
-1.161422, 1.803565, 0.1764683, 1, 1, 1, 1, 1,
-1.160832, -1.617533, -3.590084, 1, 1, 1, 1, 1,
-1.154656, 1.379011, 1.285301, 1, 1, 1, 1, 1,
-1.148392, 0.1403445, -2.31873, 1, 1, 1, 1, 1,
-1.14749, -1.536122, -1.186287, 1, 1, 1, 1, 1,
-1.144185, 0.6230558, -1.684693, 0, 0, 1, 1, 1,
-1.139761, 0.9972122, -2.707568, 1, 0, 0, 1, 1,
-1.136195, -1.066274, -3.948411, 1, 0, 0, 1, 1,
-1.134178, -0.3524149, -0.4693813, 1, 0, 0, 1, 1,
-1.121548, 1.457744, -1.633359, 1, 0, 0, 1, 1,
-1.119984, -0.5445065, -3.824784, 1, 0, 0, 1, 1,
-1.119015, 0.3035792, -1.503991, 0, 0, 0, 1, 1,
-1.118201, 0.470396, -0.3185596, 0, 0, 0, 1, 1,
-1.117349, -1.214371, -1.566479, 0, 0, 0, 1, 1,
-1.104358, 0.9379563, -0.928745, 0, 0, 0, 1, 1,
-1.102081, -0.8052873, -1.693565, 0, 0, 0, 1, 1,
-1.096853, 0.3451201, -1.240591, 0, 0, 0, 1, 1,
-1.091075, 0.05012162, -1.672983, 0, 0, 0, 1, 1,
-1.089379, 0.2084738, 0.9269788, 1, 1, 1, 1, 1,
-1.086772, -0.3897901, -1.416548, 1, 1, 1, 1, 1,
-1.084749, -1.402976, -2.329358, 1, 1, 1, 1, 1,
-1.084416, 1.149064, 0.09334563, 1, 1, 1, 1, 1,
-1.080238, -2.118754, -2.986408, 1, 1, 1, 1, 1,
-1.074395, -1.532908, -3.017035, 1, 1, 1, 1, 1,
-1.073054, 0.4647734, -0.8859882, 1, 1, 1, 1, 1,
-1.069794, 1.283422, -1.078844, 1, 1, 1, 1, 1,
-1.068738, 1.700908, 0.1624426, 1, 1, 1, 1, 1,
-1.064819, -1.48721, -2.157412, 1, 1, 1, 1, 1,
-1.064679, -1.112681, -2.23675, 1, 1, 1, 1, 1,
-1.063879, 1.534904, 0.2681329, 1, 1, 1, 1, 1,
-1.063565, 0.4139017, -0.2903228, 1, 1, 1, 1, 1,
-1.060066, -1.15949, -2.472414, 1, 1, 1, 1, 1,
-1.059258, 0.3642873, -3.065408, 1, 1, 1, 1, 1,
-1.058092, 0.09215934, -2.241396, 0, 0, 1, 1, 1,
-1.057989, -1.081884, -1.676972, 1, 0, 0, 1, 1,
-1.056857, 0.8327167, 0.6857857, 1, 0, 0, 1, 1,
-1.053435, -0.6420783, -3.457006, 1, 0, 0, 1, 1,
-1.048179, 0.2721427, -0.8958434, 1, 0, 0, 1, 1,
-1.044808, -2.319982, -3.707803, 1, 0, 0, 1, 1,
-1.044188, 2.346572, 0.830959, 0, 0, 0, 1, 1,
-1.043658, -0.6676688, -2.760128, 0, 0, 0, 1, 1,
-1.043357, 1.376012, -1.408734, 0, 0, 0, 1, 1,
-1.038286, 0.9658591, 0.08188243, 0, 0, 0, 1, 1,
-1.035599, -1.088617, -3.877126, 0, 0, 0, 1, 1,
-1.028046, 1.465934, -0.816642, 0, 0, 0, 1, 1,
-1.026601, -0.1779534, -3.225741, 0, 0, 0, 1, 1,
-1.026277, 0.08245137, -2.137642, 1, 1, 1, 1, 1,
-1.025653, -2.593516, -2.91967, 1, 1, 1, 1, 1,
-1.022212, -1.26852, -4.165604, 1, 1, 1, 1, 1,
-1.018743, 1.3597, -0.1671565, 1, 1, 1, 1, 1,
-1.018636, -0.4243005, -1.245718, 1, 1, 1, 1, 1,
-1.018054, -0.5895082, -3.105547, 1, 1, 1, 1, 1,
-1.013597, -0.6811576, -2.689654, 1, 1, 1, 1, 1,
-1.003659, 0.3529798, -0.7044773, 1, 1, 1, 1, 1,
-0.9991183, -0.4847364, -2.795909, 1, 1, 1, 1, 1,
-0.9948651, 1.436218, -0.619866, 1, 1, 1, 1, 1,
-0.9898095, -0.3818765, -2.256584, 1, 1, 1, 1, 1,
-0.9870024, -1.266425, -1.850403, 1, 1, 1, 1, 1,
-0.9854753, 0.7617053, -3.380974, 1, 1, 1, 1, 1,
-0.9836923, -2.408688, -1.862904, 1, 1, 1, 1, 1,
-0.9785275, 1.036574, -0.7475592, 1, 1, 1, 1, 1,
-0.9762222, -1.548192, -1.384135, 0, 0, 1, 1, 1,
-0.9667464, 0.1737771, -1.244927, 1, 0, 0, 1, 1,
-0.9643919, -0.7517543, -2.021925, 1, 0, 0, 1, 1,
-0.9588768, -0.8397123, -2.175569, 1, 0, 0, 1, 1,
-0.9507344, 1.070835, -0.5024371, 1, 0, 0, 1, 1,
-0.9500275, -0.4294415, -2.448383, 1, 0, 0, 1, 1,
-0.94494, 1.797761, 0.2324819, 0, 0, 0, 1, 1,
-0.9385036, 2.122184, 1.214215, 0, 0, 0, 1, 1,
-0.9368395, 0.1367355, -1.363139, 0, 0, 0, 1, 1,
-0.9355951, -0.6468505, -2.664934, 0, 0, 0, 1, 1,
-0.932536, 0.2812833, -3.19968, 0, 0, 0, 1, 1,
-0.9275095, -0.1698115, -0.3823732, 0, 0, 0, 1, 1,
-0.9251817, 0.9925567, 0.4309273, 0, 0, 0, 1, 1,
-0.9155806, 1.430149, 0.7990634, 1, 1, 1, 1, 1,
-0.9135094, -1.140211, -2.89804, 1, 1, 1, 1, 1,
-0.9065032, 0.6066697, -1.602777, 1, 1, 1, 1, 1,
-0.8973123, 0.1064807, -2.189387, 1, 1, 1, 1, 1,
-0.883523, 0.8427275, -1.635404, 1, 1, 1, 1, 1,
-0.8775941, 1.03671, -1.808819, 1, 1, 1, 1, 1,
-0.8527337, 0.6438519, -0.4365762, 1, 1, 1, 1, 1,
-0.850768, 0.08019195, -2.269356, 1, 1, 1, 1, 1,
-0.8498377, -1.782326, -1.691795, 1, 1, 1, 1, 1,
-0.8470202, 2.047817, -0.8670244, 1, 1, 1, 1, 1,
-0.8469265, -1.395592, -2.195811, 1, 1, 1, 1, 1,
-0.8426265, 0.3568502, -0.2326044, 1, 1, 1, 1, 1,
-0.8371463, 0.8706208, -0.3838297, 1, 1, 1, 1, 1,
-0.8329177, 0.1384835, 0.1291517, 1, 1, 1, 1, 1,
-0.8296673, 0.6062402, 0.5841035, 1, 1, 1, 1, 1,
-0.8296354, -0.0162047, -2.036533, 0, 0, 1, 1, 1,
-0.8248641, -0.3382762, -1.630935, 1, 0, 0, 1, 1,
-0.8194463, 0.03926012, -2.863571, 1, 0, 0, 1, 1,
-0.8191352, -0.8359721, -2.934459, 1, 0, 0, 1, 1,
-0.8160356, -0.1329229, -2.655536, 1, 0, 0, 1, 1,
-0.8155116, -0.6046245, -2.900312, 1, 0, 0, 1, 1,
-0.8140302, -0.2639176, -1.426568, 0, 0, 0, 1, 1,
-0.8047485, 1.446794, -0.6975182, 0, 0, 0, 1, 1,
-0.8038204, -0.4982632, -4.988988, 0, 0, 0, 1, 1,
-0.7992283, -1.935782, -3.178208, 0, 0, 0, 1, 1,
-0.798309, -0.4688168, -3.243643, 0, 0, 0, 1, 1,
-0.796026, 0.4805081, -1.682532, 0, 0, 0, 1, 1,
-0.7951235, 0.2472754, -1.994015, 0, 0, 0, 1, 1,
-0.7929574, 1.124892, 0.05607112, 1, 1, 1, 1, 1,
-0.7896591, -1.44282, -1.740139, 1, 1, 1, 1, 1,
-0.7882277, -0.288905, -2.230803, 1, 1, 1, 1, 1,
-0.7873242, -0.1615152, -2.027858, 1, 1, 1, 1, 1,
-0.7827957, 1.559761, -1.312056, 1, 1, 1, 1, 1,
-0.7757143, -0.5188665, -1.707082, 1, 1, 1, 1, 1,
-0.7751136, -1.481879, -2.244428, 1, 1, 1, 1, 1,
-0.7686172, -0.6409347, -2.125078, 1, 1, 1, 1, 1,
-0.7669643, -0.2806154, -1.493627, 1, 1, 1, 1, 1,
-0.7636877, -1.649856, -0.9160537, 1, 1, 1, 1, 1,
-0.7619354, 0.05252783, -1.396449, 1, 1, 1, 1, 1,
-0.761489, 0.1970296, -3.179565, 1, 1, 1, 1, 1,
-0.7458813, 0.3999932, -1.258886, 1, 1, 1, 1, 1,
-0.7433038, 0.2493214, -2.174026, 1, 1, 1, 1, 1,
-0.7413155, 0.1537433, -0.3321289, 1, 1, 1, 1, 1,
-0.738768, 1.099575, -1.568278, 0, 0, 1, 1, 1,
-0.7367565, -0.1216051, -4.079135, 1, 0, 0, 1, 1,
-0.7365695, 0.09450924, -1.120286, 1, 0, 0, 1, 1,
-0.7356384, 0.504924, 0.3587425, 1, 0, 0, 1, 1,
-0.7350928, -1.727826, -3.335217, 1, 0, 0, 1, 1,
-0.7331702, -1.057737, -1.626129, 1, 0, 0, 1, 1,
-0.7265678, -0.3681987, -0.2918061, 0, 0, 0, 1, 1,
-0.7172382, -0.9408131, -2.731247, 0, 0, 0, 1, 1,
-0.7142679, -0.8339728, -1.670738, 0, 0, 0, 1, 1,
-0.7102964, 0.1558729, -1.624174, 0, 0, 0, 1, 1,
-0.7096478, 1.398751, -1.012378, 0, 0, 0, 1, 1,
-0.7043858, -0.2278225, -1.766317, 0, 0, 0, 1, 1,
-0.7010671, 0.8682449, -1.523657, 0, 0, 0, 1, 1,
-0.6992161, 1.118562, -0.3227028, 1, 1, 1, 1, 1,
-0.6988674, 0.6387652, -1.575171, 1, 1, 1, 1, 1,
-0.6964085, 0.6496763, 0.9958858, 1, 1, 1, 1, 1,
-0.6962323, -1.463745, -2.933109, 1, 1, 1, 1, 1,
-0.6948704, -0.6845247, -1.268502, 1, 1, 1, 1, 1,
-0.6781046, -0.2117136, -0.9369547, 1, 1, 1, 1, 1,
-0.675723, 2.188781, 0.5594196, 1, 1, 1, 1, 1,
-0.6742693, -0.4359655, -3.231393, 1, 1, 1, 1, 1,
-0.6726726, 0.4368784, -0.6966521, 1, 1, 1, 1, 1,
-0.6724794, -1.569547, -3.609837, 1, 1, 1, 1, 1,
-0.671609, 0.9777719, -0.4806113, 1, 1, 1, 1, 1,
-0.6715508, -1.497545, -2.41345, 1, 1, 1, 1, 1,
-0.6703475, 1.130208, -0.1006567, 1, 1, 1, 1, 1,
-0.668146, 1.297619, -0.8983821, 1, 1, 1, 1, 1,
-0.6602008, 0.4644437, -1.624806, 1, 1, 1, 1, 1,
-0.6586254, 1.846625, 1.791875, 0, 0, 1, 1, 1,
-0.6579171, -0.1064693, -0.1123624, 1, 0, 0, 1, 1,
-0.6493151, 1.172709, -0.6004294, 1, 0, 0, 1, 1,
-0.6410922, -1.205536, -1.991278, 1, 0, 0, 1, 1,
-0.6370199, -0.3076631, -1.154053, 1, 0, 0, 1, 1,
-0.6352041, -0.7847367, -2.915811, 1, 0, 0, 1, 1,
-0.6266904, 0.7768658, -2.622713, 0, 0, 0, 1, 1,
-0.6265938, -0.6818326, -0.3026507, 0, 0, 0, 1, 1,
-0.6246074, 0.02897031, -0.6489015, 0, 0, 0, 1, 1,
-0.6240863, 0.8445882, -0.4322652, 0, 0, 0, 1, 1,
-0.6239246, -1.604113, -3.961632, 0, 0, 0, 1, 1,
-0.6236242, 1.044648, 0.5154975, 0, 0, 0, 1, 1,
-0.6235088, 0.009432278, -0.6949975, 0, 0, 0, 1, 1,
-0.6160603, 1.220748, -0.6005311, 1, 1, 1, 1, 1,
-0.6145952, 0.6784068, -1.4178, 1, 1, 1, 1, 1,
-0.6117858, -1.136485, -0.001029324, 1, 1, 1, 1, 1,
-0.6099685, 0.7095191, 0.6002697, 1, 1, 1, 1, 1,
-0.6076657, 0.3502402, -1.82733, 1, 1, 1, 1, 1,
-0.6014128, 0.290893, 0.3127293, 1, 1, 1, 1, 1,
-0.5981266, 0.5569178, -1.384175, 1, 1, 1, 1, 1,
-0.595923, -0.6701916, -3.183624, 1, 1, 1, 1, 1,
-0.5855095, -1.327244, -2.633246, 1, 1, 1, 1, 1,
-0.5841787, -0.4082271, -2.382763, 1, 1, 1, 1, 1,
-0.5825516, 0.1271797, -1.900569, 1, 1, 1, 1, 1,
-0.5803126, 1.194765, -0.71906, 1, 1, 1, 1, 1,
-0.5799586, 0.03403229, -1.555872, 1, 1, 1, 1, 1,
-0.5763757, 0.6494091, -0.6927647, 1, 1, 1, 1, 1,
-0.5762672, 0.180861, -1.6657, 1, 1, 1, 1, 1,
-0.5692107, -0.2259371, -1.170451, 0, 0, 1, 1, 1,
-0.566982, -0.8913792, -1.640432, 1, 0, 0, 1, 1,
-0.5663534, 1.088727, -0.3612144, 1, 0, 0, 1, 1,
-0.5657026, 0.6392807, 0.3867446, 1, 0, 0, 1, 1,
-0.5593705, 0.7995099, -0.9756563, 1, 0, 0, 1, 1,
-0.5488066, -0.00418029, -0.7691154, 1, 0, 0, 1, 1,
-0.5482771, 0.9994115, 0.1727492, 0, 0, 0, 1, 1,
-0.5462425, 0.730396, 1.029135, 0, 0, 0, 1, 1,
-0.5422289, 0.8071773, -1.119976, 0, 0, 0, 1, 1,
-0.5382999, 0.453589, -0.02662048, 0, 0, 0, 1, 1,
-0.5379823, 0.6426083, -0.002258939, 0, 0, 0, 1, 1,
-0.5350339, -0.8896579, -5.558419, 0, 0, 0, 1, 1,
-0.5284162, -0.4183317, -2.48694, 0, 0, 0, 1, 1,
-0.5270239, -0.4030696, -1.572507, 1, 1, 1, 1, 1,
-0.5245366, 1.689819, -0.9249865, 1, 1, 1, 1, 1,
-0.5198239, 0.8816441, 0.769021, 1, 1, 1, 1, 1,
-0.5174234, -0.3917467, -2.376209, 1, 1, 1, 1, 1,
-0.5073538, -0.4763557, -2.40697, 1, 1, 1, 1, 1,
-0.5036258, -0.2009766, -0.7806226, 1, 1, 1, 1, 1,
-0.5036045, 0.9140556, -1.950745, 1, 1, 1, 1, 1,
-0.5029299, 0.5435207, 0.4788002, 1, 1, 1, 1, 1,
-0.5016543, 0.4972422, 0.577507, 1, 1, 1, 1, 1,
-0.5001288, -0.4889415, -0.8820112, 1, 1, 1, 1, 1,
-0.4961253, 0.3023731, -1.387438, 1, 1, 1, 1, 1,
-0.4947063, -0.07454862, -1.060632, 1, 1, 1, 1, 1,
-0.484613, 0.4103143, -1.728247, 1, 1, 1, 1, 1,
-0.4840681, 0.9082703, -1.86283, 1, 1, 1, 1, 1,
-0.4839752, -1.818561, -0.6686058, 1, 1, 1, 1, 1,
-0.4819154, 1.045753, 1.079426, 0, 0, 1, 1, 1,
-0.4813859, 0.214964, -0.8099942, 1, 0, 0, 1, 1,
-0.4804884, 1.032934, -0.4669207, 1, 0, 0, 1, 1,
-0.4799946, -0.5516893, -2.878603, 1, 0, 0, 1, 1,
-0.4788361, -0.8318526, -2.546908, 1, 0, 0, 1, 1,
-0.4743942, -1.233454, -2.463991, 1, 0, 0, 1, 1,
-0.4713913, 0.07924828, -2.385555, 0, 0, 0, 1, 1,
-0.4674979, 1.756495, -1.188114, 0, 0, 0, 1, 1,
-0.4669213, -1.021946, -2.703046, 0, 0, 0, 1, 1,
-0.4649108, 1.221805, 0.5923451, 0, 0, 0, 1, 1,
-0.4592907, 0.3695638, -0.577595, 0, 0, 0, 1, 1,
-0.4561143, 0.06067112, 0.1714347, 0, 0, 0, 1, 1,
-0.4554574, 1.329186, 0.9039203, 0, 0, 0, 1, 1,
-0.4537844, 0.1425423, -1.800233, 1, 1, 1, 1, 1,
-0.4481957, -3.081535, -1.819708, 1, 1, 1, 1, 1,
-0.4423368, 0.9639354, -1.713653, 1, 1, 1, 1, 1,
-0.4422282, 0.02114544, -1.424019, 1, 1, 1, 1, 1,
-0.4307768, -0.2373485, -0.414141, 1, 1, 1, 1, 1,
-0.4271661, -0.2788972, -2.236838, 1, 1, 1, 1, 1,
-0.4253766, -0.01832126, -1.852522, 1, 1, 1, 1, 1,
-0.4245715, -2.650473, -5.019937, 1, 1, 1, 1, 1,
-0.4216549, -1.651402, -1.613582, 1, 1, 1, 1, 1,
-0.4201812, 0.4721359, -0.3030816, 1, 1, 1, 1, 1,
-0.4200796, -0.421062, -2.575884, 1, 1, 1, 1, 1,
-0.4167635, -0.904165, -2.54227, 1, 1, 1, 1, 1,
-0.4093437, -0.7276117, -3.23556, 1, 1, 1, 1, 1,
-0.407811, 0.9246679, -0.4093951, 1, 1, 1, 1, 1,
-0.3961015, 1.720829, 0.3488587, 1, 1, 1, 1, 1,
-0.3940491, -2.404838, -2.546571, 0, 0, 1, 1, 1,
-0.3932087, -0.5283691, -1.394774, 1, 0, 0, 1, 1,
-0.3885299, -0.0183827, -1.634907, 1, 0, 0, 1, 1,
-0.388061, -2.45663, -1.37406, 1, 0, 0, 1, 1,
-0.3879582, 1.793871, -0.7601518, 1, 0, 0, 1, 1,
-0.3859735, 0.642061, -0.02098517, 1, 0, 0, 1, 1,
-0.3857371, -0.4953759, -2.846026, 0, 0, 0, 1, 1,
-0.3834632, -0.8060147, -2.112188, 0, 0, 0, 1, 1,
-0.3794664, 0.1292618, -1.411482, 0, 0, 0, 1, 1,
-0.378564, 0.3176736, -0.7372496, 0, 0, 0, 1, 1,
-0.3779887, 0.01718653, -1.047922, 0, 0, 0, 1, 1,
-0.3746565, 0.5282242, 1.924225, 0, 0, 0, 1, 1,
-0.372219, -0.6928923, -2.527808, 0, 0, 0, 1, 1,
-0.3664739, 0.6442958, -0.6535766, 1, 1, 1, 1, 1,
-0.3659769, 0.6032827, 1.492594, 1, 1, 1, 1, 1,
-0.3638139, -0.3908972, -1.373297, 1, 1, 1, 1, 1,
-0.3582915, 0.04519197, -2.695124, 1, 1, 1, 1, 1,
-0.3572164, -0.8399138, -2.120685, 1, 1, 1, 1, 1,
-0.3522928, 1.234326, -0.8718641, 1, 1, 1, 1, 1,
-0.3504792, 1.60086, -0.1273976, 1, 1, 1, 1, 1,
-0.3502042, -0.8550344, -1.771492, 1, 1, 1, 1, 1,
-0.3488421, 0.9138727, -0.5693083, 1, 1, 1, 1, 1,
-0.3486284, -0.04440155, -1.111949, 1, 1, 1, 1, 1,
-0.3472168, 0.9499665, -0.4153073, 1, 1, 1, 1, 1,
-0.3460288, 1.117357, 0.1922709, 1, 1, 1, 1, 1,
-0.3397481, 0.7441418, -1.533918, 1, 1, 1, 1, 1,
-0.3369357, -2.777869, -3.12728, 1, 1, 1, 1, 1,
-0.3321646, -0.4663175, -1.785205, 1, 1, 1, 1, 1,
-0.3236092, -0.6262149, -2.631278, 0, 0, 1, 1, 1,
-0.3123991, 0.1007236, -0.3072737, 1, 0, 0, 1, 1,
-0.3061402, 1.07314, -0.8282993, 1, 0, 0, 1, 1,
-0.3032535, 0.4620515, -1.238301, 1, 0, 0, 1, 1,
-0.2982053, 1.089203, -1.841066, 1, 0, 0, 1, 1,
-0.2970539, 1.373829, -0.6153775, 1, 0, 0, 1, 1,
-0.2954693, -0.5064211, -2.978324, 0, 0, 0, 1, 1,
-0.2880722, -0.4032446, -3.691018, 0, 0, 0, 1, 1,
-0.2829482, -1.158722, -2.959038, 0, 0, 0, 1, 1,
-0.2817892, -0.1602648, -2.356075, 0, 0, 0, 1, 1,
-0.2811469, -1.278638, -3.701159, 0, 0, 0, 1, 1,
-0.280846, -0.015246, -2.343742, 0, 0, 0, 1, 1,
-0.2805303, 1.119168, 0.03362792, 0, 0, 0, 1, 1,
-0.2725247, -0.479662, -2.944456, 1, 1, 1, 1, 1,
-0.2723333, 1.930659, -0.4746298, 1, 1, 1, 1, 1,
-0.2716515, 0.4652294, -1.532357, 1, 1, 1, 1, 1,
-0.2686177, 1.08508, 0.5275466, 1, 1, 1, 1, 1,
-0.2666479, 0.3019924, -0.1696781, 1, 1, 1, 1, 1,
-0.2665584, 0.007873899, -2.541544, 1, 1, 1, 1, 1,
-0.2653213, -1.189394, -3.148966, 1, 1, 1, 1, 1,
-0.2599425, -1.67263, -3.387198, 1, 1, 1, 1, 1,
-0.2583753, 0.7399817, -0.5467283, 1, 1, 1, 1, 1,
-0.2517579, 0.7754923, 0.4766462, 1, 1, 1, 1, 1,
-0.2455504, 1.325661, 1.138423, 1, 1, 1, 1, 1,
-0.243167, 0.05641502, -1.370287, 1, 1, 1, 1, 1,
-0.2394214, -0.5315834, -4.228984, 1, 1, 1, 1, 1,
-0.2389615, -0.5562504, -3.624109, 1, 1, 1, 1, 1,
-0.2374208, 0.2346509, -1.237776, 1, 1, 1, 1, 1,
-0.2330357, 0.8802909, 0.1960834, 0, 0, 1, 1, 1,
-0.2310822, 0.1326726, -1.563244, 1, 0, 0, 1, 1,
-0.2246596, 0.5022098, 0.2310669, 1, 0, 0, 1, 1,
-0.223713, 1.669543, -1.755468, 1, 0, 0, 1, 1,
-0.22126, 1.190675, -0.6015118, 1, 0, 0, 1, 1,
-0.2184102, 1.916376, -0.1841826, 1, 0, 0, 1, 1,
-0.2167101, 0.9652645, 0.4791625, 0, 0, 0, 1, 1,
-0.2159198, -0.1290761, -2.102154, 0, 0, 0, 1, 1,
-0.2126513, 1.510371, -0.5132017, 0, 0, 0, 1, 1,
-0.2091859, 0.7423781, -0.191335, 0, 0, 0, 1, 1,
-0.2089941, -0.937718, -3.792556, 0, 0, 0, 1, 1,
-0.2084007, 0.7600603, 0.9074527, 0, 0, 0, 1, 1,
-0.2064056, -0.6446691, -1.858242, 0, 0, 0, 1, 1,
-0.2042066, 0.03626948, -1.726717, 1, 1, 1, 1, 1,
-0.2034221, 0.7204841, -2.388191, 1, 1, 1, 1, 1,
-0.201358, 0.2769431, -1.235994, 1, 1, 1, 1, 1,
-0.1988093, 0.3884606, -0.9076959, 1, 1, 1, 1, 1,
-0.1971116, -0.5353234, -3.694029, 1, 1, 1, 1, 1,
-0.1963858, -0.9681081, -3.406828, 1, 1, 1, 1, 1,
-0.1960136, 0.9844493, -0.5477768, 1, 1, 1, 1, 1,
-0.1951265, 1.514157, 0.9102399, 1, 1, 1, 1, 1,
-0.1911608, -1.304356, -1.553088, 1, 1, 1, 1, 1,
-0.1889808, 0.1863454, -1.265954, 1, 1, 1, 1, 1,
-0.1759887, 0.9799746, -0.4412175, 1, 1, 1, 1, 1,
-0.1725612, -1.422736, -2.957022, 1, 1, 1, 1, 1,
-0.1700777, -0.8672693, -2.963767, 1, 1, 1, 1, 1,
-0.1683101, -0.3740008, -3.554125, 1, 1, 1, 1, 1,
-0.1664573, 1.631827, -0.03937047, 1, 1, 1, 1, 1,
-0.15949, 1.326543, 0.08394287, 0, 0, 1, 1, 1,
-0.1584207, -1.278264, -0.8491945, 1, 0, 0, 1, 1,
-0.15529, 0.08079541, -2.139922, 1, 0, 0, 1, 1,
-0.1546082, 1.057188, 0.6297199, 1, 0, 0, 1, 1,
-0.1531007, -0.1697831, -1.751908, 1, 0, 0, 1, 1,
-0.1479013, -1.19947, -3.113619, 1, 0, 0, 1, 1,
-0.1476487, -1.599905, -3.244484, 0, 0, 0, 1, 1,
-0.1474916, 0.3835014, -1.945578, 0, 0, 0, 1, 1,
-0.147172, -0.06564935, -0.9290484, 0, 0, 0, 1, 1,
-0.1465772, -0.1541488, -3.272512, 0, 0, 0, 1, 1,
-0.1464267, -0.7048101, -3.291548, 0, 0, 0, 1, 1,
-0.1434224, -2.646012, -1.882801, 0, 0, 0, 1, 1,
-0.1405558, -0.3929438, -3.416908, 0, 0, 0, 1, 1,
-0.1400102, 1.531457, 0.05097021, 1, 1, 1, 1, 1,
-0.1284266, 0.7720326, 0.08359671, 1, 1, 1, 1, 1,
-0.1276348, 0.865894, 0.421965, 1, 1, 1, 1, 1,
-0.1267236, -2.017903, -2.933185, 1, 1, 1, 1, 1,
-0.1234695, 0.2404944, 0.9937582, 1, 1, 1, 1, 1,
-0.1228854, -1.200136, -2.564354, 1, 1, 1, 1, 1,
-0.1162, -0.9809414, -3.794181, 1, 1, 1, 1, 1,
-0.1158717, -1.472539, -4.32199, 1, 1, 1, 1, 1,
-0.1143307, -0.5912452, -2.633592, 1, 1, 1, 1, 1,
-0.1143089, -1.079857, -2.390414, 1, 1, 1, 1, 1,
-0.1130034, 0.3201463, 1.02239, 1, 1, 1, 1, 1,
-0.1099123, -1.495933, -3.365677, 1, 1, 1, 1, 1,
-0.1050833, -1.090958, -4.266647, 1, 1, 1, 1, 1,
-0.1031875, 0.6035227, 1.947059, 1, 1, 1, 1, 1,
-0.0929976, -0.3323448, -4.383543, 1, 1, 1, 1, 1,
-0.08906415, 0.5029794, -0.3059242, 0, 0, 1, 1, 1,
-0.08372229, 0.4633667, 0.3067233, 1, 0, 0, 1, 1,
-0.08362367, 1.787752, 0.5899245, 1, 0, 0, 1, 1,
-0.08345187, 0.4278986, 1.234204, 1, 0, 0, 1, 1,
-0.08096708, 0.6632338, -0.3353102, 1, 0, 0, 1, 1,
-0.0745829, 0.03270166, -2.17971, 1, 0, 0, 1, 1,
-0.07191994, -0.2673019, -4.333561, 0, 0, 0, 1, 1,
-0.06614362, 1.177337, -0.0954566, 0, 0, 0, 1, 1,
-0.06433198, 0.8337061, -0.05904905, 0, 0, 0, 1, 1,
-0.06084616, 0.4795996, 0.8079854, 0, 0, 0, 1, 1,
-0.06083772, 1.596268, 0.6939027, 0, 0, 0, 1, 1,
-0.05830839, -0.9524399, -4.279029, 0, 0, 0, 1, 1,
-0.05744513, 0.435808, 1.403009, 0, 0, 0, 1, 1,
-0.0515236, -0.8044112, -4.104311, 1, 1, 1, 1, 1,
-0.04773058, 0.9163891, 1.439053, 1, 1, 1, 1, 1,
-0.04583291, 1.063262, -0.2668935, 1, 1, 1, 1, 1,
-0.04451274, -0.03310453, -3.378246, 1, 1, 1, 1, 1,
-0.04393809, 1.295909, -0.9690389, 1, 1, 1, 1, 1,
-0.04234785, 0.3289253, 0.8857849, 1, 1, 1, 1, 1,
-0.03933799, 1.695835, -0.2329379, 1, 1, 1, 1, 1,
-0.0317133, 1.224465, 1.008493, 1, 1, 1, 1, 1,
-0.03020412, 0.5305647, -0.4952261, 1, 1, 1, 1, 1,
-0.02524326, 1.216533, -1.189032, 1, 1, 1, 1, 1,
-0.02105139, -0.108247, -2.645725, 1, 1, 1, 1, 1,
-0.02074341, 0.9253024, 0.1702146, 1, 1, 1, 1, 1,
-0.01967873, -1.362396, -1.935306, 1, 1, 1, 1, 1,
-0.01856627, -0.1193775, -5.785089, 1, 1, 1, 1, 1,
-0.01527636, 0.3090945, 0.8446093, 1, 1, 1, 1, 1,
-0.01313471, -1.003489, -3.832615, 0, 0, 1, 1, 1,
-0.01109219, 0.3267799, -2.11193, 1, 0, 0, 1, 1,
-0.009364582, -0.964151, -3.244504, 1, 0, 0, 1, 1,
-0.008775013, -2.01862, -1.470586, 1, 0, 0, 1, 1,
-0.005524273, 0.3167982, -0.02121426, 1, 0, 0, 1, 1,
-0.003647212, -2.230134, -4.173412, 1, 0, 0, 1, 1,
0.005145287, -1.204052, 2.838805, 0, 0, 0, 1, 1,
0.005799953, 0.31589, -0.9777582, 0, 0, 0, 1, 1,
0.006028745, -0.435034, 3.472671, 0, 0, 0, 1, 1,
0.00680993, -1.342037, 3.980183, 0, 0, 0, 1, 1,
0.009674592, -1.68647, 3.670218, 0, 0, 0, 1, 1,
0.01011254, 0.8823871, 1.003691, 0, 0, 0, 1, 1,
0.0101348, 0.8731735, 0.07842182, 0, 0, 0, 1, 1,
0.01015271, 0.4554076, -1.31192, 1, 1, 1, 1, 1,
0.01373048, 1.773683, 1.116292, 1, 1, 1, 1, 1,
0.01480666, -1.274598, 0.8542856, 1, 1, 1, 1, 1,
0.01482046, -0.2300962, 3.244636, 1, 1, 1, 1, 1,
0.01547435, 0.5497023, -0.1922951, 1, 1, 1, 1, 1,
0.01569716, 1.28244, -0.001045448, 1, 1, 1, 1, 1,
0.01612253, -0.8668299, 3.533182, 1, 1, 1, 1, 1,
0.01904212, 0.789811, 0.1924048, 1, 1, 1, 1, 1,
0.02369901, -1.231558, 3.475524, 1, 1, 1, 1, 1,
0.02673643, -0.3889152, 3.158649, 1, 1, 1, 1, 1,
0.02818513, -1.394245, 2.140525, 1, 1, 1, 1, 1,
0.02878836, 0.2034495, -1.132272, 1, 1, 1, 1, 1,
0.03195916, 1.637165, -0.1265352, 1, 1, 1, 1, 1,
0.0329134, 0.6703542, -0.4944034, 1, 1, 1, 1, 1,
0.03495524, -1.192399, 1.256821, 1, 1, 1, 1, 1,
0.03522433, 0.3274894, 1.560793, 0, 0, 1, 1, 1,
0.0389742, 0.2758385, 1.427714, 1, 0, 0, 1, 1,
0.04335491, -0.06556859, 2.770296, 1, 0, 0, 1, 1,
0.04922111, 1.418461, -1.311228, 1, 0, 0, 1, 1,
0.04936499, 0.07766733, 2.18429, 1, 0, 0, 1, 1,
0.04967371, 1.951627, 1.209632, 1, 0, 0, 1, 1,
0.05204163, 1.060941, -1.497619, 0, 0, 0, 1, 1,
0.05506182, -0.999672, 2.595804, 0, 0, 0, 1, 1,
0.05634515, -1.295396, 2.340763, 0, 0, 0, 1, 1,
0.06072411, 0.7444056, 1.12602, 0, 0, 0, 1, 1,
0.0625125, -0.4342121, 2.424182, 0, 0, 0, 1, 1,
0.06399115, 2.416882, 0.04627344, 0, 0, 0, 1, 1,
0.06834459, 0.2592232, -0.9714205, 0, 0, 0, 1, 1,
0.07121319, 0.6358516, -1.763454, 1, 1, 1, 1, 1,
0.07378003, -0.9961107, 4.08215, 1, 1, 1, 1, 1,
0.07564292, 1.047753, -1.908624, 1, 1, 1, 1, 1,
0.07574748, 0.492659, 0.2027652, 1, 1, 1, 1, 1,
0.0762347, 2.106395, -0.8189286, 1, 1, 1, 1, 1,
0.07981217, -0.7029616, 4.513817, 1, 1, 1, 1, 1,
0.08005758, 0.3879555, 1.241426, 1, 1, 1, 1, 1,
0.0817036, 0.01672782, 1.621755, 1, 1, 1, 1, 1,
0.08217129, 0.902379, -0.2925737, 1, 1, 1, 1, 1,
0.08304568, -0.3159048, 2.567506, 1, 1, 1, 1, 1,
0.08419216, 1.468898, 0.180488, 1, 1, 1, 1, 1,
0.08768702, 1.297513, -2.44145, 1, 1, 1, 1, 1,
0.08966742, 1.727703, 1.768252, 1, 1, 1, 1, 1,
0.09265485, -1.94864, 4.554474, 1, 1, 1, 1, 1,
0.09266313, 2.403383, -1.149652, 1, 1, 1, 1, 1,
0.09476227, 0.8794181, 0.2661735, 0, 0, 1, 1, 1,
0.09618565, -1.788091, 4.436388, 1, 0, 0, 1, 1,
0.1005915, -1.019168, 4.225886, 1, 0, 0, 1, 1,
0.1012747, -0.5070978, 3.254406, 1, 0, 0, 1, 1,
0.105246, 0.3432855, -1.133095, 1, 0, 0, 1, 1,
0.1052718, 0.5294592, 1.284631, 1, 0, 0, 1, 1,
0.1077241, -0.2555521, 1.94061, 0, 0, 0, 1, 1,
0.1094834, -1.339331, 4.837214, 0, 0, 0, 1, 1,
0.1134374, 1.273708, 1.350511, 0, 0, 0, 1, 1,
0.114736, -1.053638, 3.732366, 0, 0, 0, 1, 1,
0.1232386, -0.6346005, 2.75732, 0, 0, 0, 1, 1,
0.1290765, -0.7981755, 2.849718, 0, 0, 0, 1, 1,
0.131651, 0.6029724, -0.4712279, 0, 0, 0, 1, 1,
0.1321821, -2.864672, 3.480829, 1, 1, 1, 1, 1,
0.1327168, -0.6941762, 1.780487, 1, 1, 1, 1, 1,
0.135292, 0.3727939, 0.06739598, 1, 1, 1, 1, 1,
0.1369238, -1.721703, 4.359617, 1, 1, 1, 1, 1,
0.1390962, -0.2582002, 3.02737, 1, 1, 1, 1, 1,
0.1393869, 1.597013, -2.237392, 1, 1, 1, 1, 1,
0.1407646, -1.140712, 3.752532, 1, 1, 1, 1, 1,
0.1423178, 1.611115, -0.4100838, 1, 1, 1, 1, 1,
0.147838, -0.9112769, 4.927481, 1, 1, 1, 1, 1,
0.1486706, -0.1259344, 2.315504, 1, 1, 1, 1, 1,
0.149339, 0.04624606, 1.352952, 1, 1, 1, 1, 1,
0.153256, 0.02057406, 0.02226016, 1, 1, 1, 1, 1,
0.1535322, -0.2717234, 2.378062, 1, 1, 1, 1, 1,
0.1570442, 1.459998, -0.4089418, 1, 1, 1, 1, 1,
0.1585642, -1.168393, 3.284045, 1, 1, 1, 1, 1,
0.1619083, 1.691095, -0.3155955, 0, 0, 1, 1, 1,
0.1724929, -1.198587, 2.615039, 1, 0, 0, 1, 1,
0.1727619, -0.6577054, 0.9206364, 1, 0, 0, 1, 1,
0.1731442, 0.5805811, 0.6670641, 1, 0, 0, 1, 1,
0.1745955, -0.5151913, 3.094104, 1, 0, 0, 1, 1,
0.1765781, 0.6761591, 1.501176, 1, 0, 0, 1, 1,
0.1776083, -0.09676734, 1.963619, 0, 0, 0, 1, 1,
0.1809532, -0.8465623, 4.094866, 0, 0, 0, 1, 1,
0.1829671, 1.082409, 1.652131, 0, 0, 0, 1, 1,
0.1850425, -0.6870598, 1.47925, 0, 0, 0, 1, 1,
0.1863727, 0.4253774, -1.392502, 0, 0, 0, 1, 1,
0.1899813, -1.24386, 2.910303, 0, 0, 0, 1, 1,
0.1910352, 0.5463396, 1.381834, 0, 0, 0, 1, 1,
0.1923283, 0.5570139, 0.2064234, 1, 1, 1, 1, 1,
0.1928787, 0.2226034, -0.1214708, 1, 1, 1, 1, 1,
0.1946943, -0.9788511, 1.899888, 1, 1, 1, 1, 1,
0.1952872, 0.007143777, 2.763468, 1, 1, 1, 1, 1,
0.1975956, -1.550875, 2.47757, 1, 1, 1, 1, 1,
0.1995404, -0.9217628, 3.138433, 1, 1, 1, 1, 1,
0.2009849, 0.4057761, 0.07052695, 1, 1, 1, 1, 1,
0.2120476, 1.26601, -0.4562087, 1, 1, 1, 1, 1,
0.214171, 0.4274682, 1.823985, 1, 1, 1, 1, 1,
0.2191332, 0.4851936, 1.300612, 1, 1, 1, 1, 1,
0.2199171, -0.613079, 3.809807, 1, 1, 1, 1, 1,
0.2210024, -0.1844105, 2.767278, 1, 1, 1, 1, 1,
0.2237203, 0.2265023, 0.6483706, 1, 1, 1, 1, 1,
0.2315429, -0.3048236, 3.347662, 1, 1, 1, 1, 1,
0.2317334, 1.094786, 0.4511671, 1, 1, 1, 1, 1,
0.2338315, 0.8496651, -0.7981732, 0, 0, 1, 1, 1,
0.234445, 0.9860229, 0.8817773, 1, 0, 0, 1, 1,
0.2346298, 1.018163, 1.66301, 1, 0, 0, 1, 1,
0.2379937, -0.5186741, 3.838996, 1, 0, 0, 1, 1,
0.2445921, -1.085015, 2.449689, 1, 0, 0, 1, 1,
0.2467768, 1.739292, 2.139761, 1, 0, 0, 1, 1,
0.2469518, -0.3315001, 1.602785, 0, 0, 0, 1, 1,
0.2476188, -0.2405824, 2.066285, 0, 0, 0, 1, 1,
0.2497255, 0.07265231, -0.4831988, 0, 0, 0, 1, 1,
0.2500681, -0.3856418, 2.81639, 0, 0, 0, 1, 1,
0.2517751, 0.6090611, -1.394949, 0, 0, 0, 1, 1,
0.2524234, -0.01578922, 0.6948144, 0, 0, 0, 1, 1,
0.2552944, -1.232217, 4.750526, 0, 0, 0, 1, 1,
0.2559214, 1.535056, -0.4837335, 1, 1, 1, 1, 1,
0.2574744, -0.9750859, 2.065015, 1, 1, 1, 1, 1,
0.26436, -0.4589025, 1.300976, 1, 1, 1, 1, 1,
0.2648558, 0.3249468, 1.000799, 1, 1, 1, 1, 1,
0.2691662, 0.5063685, 1.01947, 1, 1, 1, 1, 1,
0.2703878, -0.2372966, 3.046644, 1, 1, 1, 1, 1,
0.2709408, 0.4392731, 1.08067, 1, 1, 1, 1, 1,
0.27405, 0.5008476, 0.02269091, 1, 1, 1, 1, 1,
0.274861, -0.2462729, 0.6042244, 1, 1, 1, 1, 1,
0.2774781, -0.4129714, 2.469742, 1, 1, 1, 1, 1,
0.2784463, -0.9456682, 4.465571, 1, 1, 1, 1, 1,
0.2828725, 1.039561, 0.1420531, 1, 1, 1, 1, 1,
0.2882551, -0.6577455, 1.222242, 1, 1, 1, 1, 1,
0.2914438, -0.2812138, 0.6628843, 1, 1, 1, 1, 1,
0.2931734, -0.6203427, 4.094579, 1, 1, 1, 1, 1,
0.296332, 0.5752473, 0.3203852, 0, 0, 1, 1, 1,
0.2974682, -2.698047, 0.9679852, 1, 0, 0, 1, 1,
0.3008504, -0.767239, 3.904585, 1, 0, 0, 1, 1,
0.3027091, 0.06818967, 0.09765704, 1, 0, 0, 1, 1,
0.3089134, -1.319147, 2.317255, 1, 0, 0, 1, 1,
0.3089595, -0.1448335, 0.726588, 1, 0, 0, 1, 1,
0.3108243, -0.4125564, 3.471878, 0, 0, 0, 1, 1,
0.3122493, -0.6256201, 3.432597, 0, 0, 0, 1, 1,
0.3132874, 0.2115134, 1.508259, 0, 0, 0, 1, 1,
0.3146846, 0.2464034, 0.8408903, 0, 0, 0, 1, 1,
0.3153961, 0.4090193, 0.05923277, 0, 0, 0, 1, 1,
0.3173206, 0.1617515, 0.3618243, 0, 0, 0, 1, 1,
0.3250357, -1.146596, 3.284172, 0, 0, 0, 1, 1,
0.3257051, 0.6327178, 0.2186716, 1, 1, 1, 1, 1,
0.3286968, -0.2596129, 3.114046, 1, 1, 1, 1, 1,
0.3329582, -0.3841465, 3.221223, 1, 1, 1, 1, 1,
0.3333475, -0.5478188, 2.519413, 1, 1, 1, 1, 1,
0.3336139, -0.1013595, 2.24719, 1, 1, 1, 1, 1,
0.3367388, -0.3333632, 2.279917, 1, 1, 1, 1, 1,
0.3430009, -0.537607, 2.280522, 1, 1, 1, 1, 1,
0.3453642, 1.159229, 0.7140566, 1, 1, 1, 1, 1,
0.354251, 0.6965621, -0.4510079, 1, 1, 1, 1, 1,
0.3561988, -0.4635625, 0.2075539, 1, 1, 1, 1, 1,
0.357489, -1.939455, 3.772305, 1, 1, 1, 1, 1,
0.3577232, 1.772043, -0.3062937, 1, 1, 1, 1, 1,
0.3591486, -0.2030791, 2.499803, 1, 1, 1, 1, 1,
0.3591831, 0.6782953, -0.3673679, 1, 1, 1, 1, 1,
0.359301, -1.120697, 3.080351, 1, 1, 1, 1, 1,
0.3596473, 1.463662, -0.1969605, 0, 0, 1, 1, 1,
0.3618227, 0.7700064, 0.7291762, 1, 0, 0, 1, 1,
0.3653624, -2.768492, 2.262818, 1, 0, 0, 1, 1,
0.3666041, -1.047277, 2.658073, 1, 0, 0, 1, 1,
0.3700057, -0.7011996, 3.095796, 1, 0, 0, 1, 1,
0.37285, 1.042116, 0.4356241, 1, 0, 0, 1, 1,
0.3775301, -0.5707267, 2.0838, 0, 0, 0, 1, 1,
0.3784126, 0.1214409, 2.882334, 0, 0, 0, 1, 1,
0.3786621, 1.013145, -0.9765936, 0, 0, 0, 1, 1,
0.3796327, -0.9860803, 2.393536, 0, 0, 0, 1, 1,
0.380909, 2.541621, 0.510362, 0, 0, 0, 1, 1,
0.381617, 0.3906043, 1.476588, 0, 0, 0, 1, 1,
0.3824596, -0.3469951, 3.209579, 0, 0, 0, 1, 1,
0.3979226, 1.100592, -2.61005, 1, 1, 1, 1, 1,
0.3989397, -1.717207, 2.950337, 1, 1, 1, 1, 1,
0.40593, -1.153522, 3.266243, 1, 1, 1, 1, 1,
0.4071603, 0.5476295, 0.6303428, 1, 1, 1, 1, 1,
0.4072801, -0.294336, 4.001195, 1, 1, 1, 1, 1,
0.4115759, -0.9284517, 4.050924, 1, 1, 1, 1, 1,
0.4117686, -0.09834238, 3.341381, 1, 1, 1, 1, 1,
0.4126213, 1.323356, 2.593816, 1, 1, 1, 1, 1,
0.4127709, -0.001810488, 2.678195, 1, 1, 1, 1, 1,
0.4132369, -0.7914231, 2.447326, 1, 1, 1, 1, 1,
0.4197901, -0.3563391, 2.886448, 1, 1, 1, 1, 1,
0.4242628, 1.564516, 0.8669947, 1, 1, 1, 1, 1,
0.4276057, -2.28783, 3.380308, 1, 1, 1, 1, 1,
0.4333507, -0.4751858, 4.322913, 1, 1, 1, 1, 1,
0.4360662, -0.5328842, 2.676716, 1, 1, 1, 1, 1,
0.43806, 0.3195597, 0.02073434, 0, 0, 1, 1, 1,
0.4477706, -0.6181113, 2.20695, 1, 0, 0, 1, 1,
0.4535506, 1.265081, -0.6364268, 1, 0, 0, 1, 1,
0.4541102, -0.3563909, 2.772176, 1, 0, 0, 1, 1,
0.4584207, -1.112195, 2.568758, 1, 0, 0, 1, 1,
0.4615326, 0.9770066, -0.4309684, 1, 0, 0, 1, 1,
0.4652887, 0.5107371, 0.05877604, 0, 0, 0, 1, 1,
0.4672468, -0.871109, 1.374234, 0, 0, 0, 1, 1,
0.4724085, 0.5231868, -0.4955612, 0, 0, 0, 1, 1,
0.4767524, -0.9262065, 2.477262, 0, 0, 0, 1, 1,
0.4782277, -2.280439, 3.389024, 0, 0, 0, 1, 1,
0.4803393, 1.698477, -0.5486364, 0, 0, 0, 1, 1,
0.4867558, 0.3899685, 2.55289, 0, 0, 0, 1, 1,
0.4868981, -1.732824, 2.69425, 1, 1, 1, 1, 1,
0.487121, -1.028194, 3.220809, 1, 1, 1, 1, 1,
0.4896204, 1.275799, 0.5366158, 1, 1, 1, 1, 1,
0.4916267, 0.1661135, 2.241518, 1, 1, 1, 1, 1,
0.4931023, -0.2976264, 2.330108, 1, 1, 1, 1, 1,
0.4931787, -1.802959, 2.649116, 1, 1, 1, 1, 1,
0.4938962, 0.1506782, 2.04397, 1, 1, 1, 1, 1,
0.4945469, 0.7195966, 1.324306, 1, 1, 1, 1, 1,
0.5002677, 0.3622776, -0.09083018, 1, 1, 1, 1, 1,
0.5027119, 0.6210538, 1.712662, 1, 1, 1, 1, 1,
0.5042552, 0.06628174, 1.003274, 1, 1, 1, 1, 1,
0.5070205, 0.1424818, 2.954162, 1, 1, 1, 1, 1,
0.5070928, -0.5551433, 2.919444, 1, 1, 1, 1, 1,
0.5110104, 0.131715, 1.837278, 1, 1, 1, 1, 1,
0.5139645, 0.09310384, 2.321595, 1, 1, 1, 1, 1,
0.5157245, -1.044743, 4.714881, 0, 0, 1, 1, 1,
0.5267622, 1.041477, 0.5751315, 1, 0, 0, 1, 1,
0.5297454, 0.8228413, 1.565928, 1, 0, 0, 1, 1,
0.5331345, -0.9912097, 2.941342, 1, 0, 0, 1, 1,
0.5336334, 0.2007902, 0.4839197, 1, 0, 0, 1, 1,
0.534879, -0.7199824, 2.457486, 1, 0, 0, 1, 1,
0.5460961, -1.627074, 2.526834, 0, 0, 0, 1, 1,
0.5513485, 0.6757376, 0.6734192, 0, 0, 0, 1, 1,
0.5673937, 1.669744, 2.61619, 0, 0, 0, 1, 1,
0.5687075, 0.04304582, 1.134395, 0, 0, 0, 1, 1,
0.569501, 0.4403881, 0.9059262, 0, 0, 0, 1, 1,
0.572975, 0.2993622, 1.189754, 0, 0, 0, 1, 1,
0.5741295, -0.6305138, 3.216346, 0, 0, 0, 1, 1,
0.5744859, -1.002382, 2.869733, 1, 1, 1, 1, 1,
0.5757124, -0.351739, 1.231277, 1, 1, 1, 1, 1,
0.5805847, 0.894945, -0.07615653, 1, 1, 1, 1, 1,
0.5835302, 0.8987471, 1.276043, 1, 1, 1, 1, 1,
0.5838315, -1.164054, 1.699587, 1, 1, 1, 1, 1,
0.5839769, -0.8324999, 2.591348, 1, 1, 1, 1, 1,
0.586365, -1.392522, 3.108435, 1, 1, 1, 1, 1,
0.5885118, -0.4057742, 2.732903, 1, 1, 1, 1, 1,
0.5974585, -0.1047817, 0.9035159, 1, 1, 1, 1, 1,
0.598577, -0.5539039, 1.871543, 1, 1, 1, 1, 1,
0.5997472, -0.7477732, 3.198818, 1, 1, 1, 1, 1,
0.6003513, 0.4036888, 3.093826, 1, 1, 1, 1, 1,
0.6005934, -0.4684079, 3.965046, 1, 1, 1, 1, 1,
0.6008483, 1.250319, 1.275547, 1, 1, 1, 1, 1,
0.6014684, 0.04977661, 1.791453, 1, 1, 1, 1, 1,
0.6041629, -1.085305, 3.162193, 0, 0, 1, 1, 1,
0.604733, -0.8676781, 1.819725, 1, 0, 0, 1, 1,
0.6073973, 1.861971, 0.2877411, 1, 0, 0, 1, 1,
0.614257, 0.09745391, 1.800219, 1, 0, 0, 1, 1,
0.6240392, 1.459407, 1.2669, 1, 0, 0, 1, 1,
0.6252245, 0.2567219, 0.4812022, 1, 0, 0, 1, 1,
0.6267127, 1.005156, 1.112575, 0, 0, 0, 1, 1,
0.6310035, -0.8922142, 3.032239, 0, 0, 0, 1, 1,
0.6336372, 0.583137, 1.444114, 0, 0, 0, 1, 1,
0.6369399, 2.105413, 2.996288, 0, 0, 0, 1, 1,
0.6417285, 0.05003749, 1.383309, 0, 0, 0, 1, 1,
0.6502491, -1.113682, 2.452269, 0, 0, 0, 1, 1,
0.6516445, 0.05039805, 2.512853, 0, 0, 0, 1, 1,
0.6558461, 0.2442047, 2.286572, 1, 1, 1, 1, 1,
0.6567765, 0.6251556, 0.6824932, 1, 1, 1, 1, 1,
0.6640821, 1.886543, 0.1039519, 1, 1, 1, 1, 1,
0.6642581, 0.3171447, 1.876427, 1, 1, 1, 1, 1,
0.6682658, -0.7854598, 2.923691, 1, 1, 1, 1, 1,
0.6804495, 0.4948531, -0.9744482, 1, 1, 1, 1, 1,
0.6946821, 0.2579777, 1.934904, 1, 1, 1, 1, 1,
0.6956599, 1.290287, 0.7962296, 1, 1, 1, 1, 1,
0.6991927, -1.483304, 3.219435, 1, 1, 1, 1, 1,
0.6998274, 1.400106, 0.6358087, 1, 1, 1, 1, 1,
0.6999466, 0.6911358, 0.771174, 1, 1, 1, 1, 1,
0.7016762, -0.684333, 3.493123, 1, 1, 1, 1, 1,
0.7042354, -1.672973, 1.909892, 1, 1, 1, 1, 1,
0.7067047, 0.1165465, 2.199432, 1, 1, 1, 1, 1,
0.7116059, -2.117015, 3.492121, 1, 1, 1, 1, 1,
0.7163361, 0.5040943, 1.00262, 0, 0, 1, 1, 1,
0.7187834, -1.537681, 2.615328, 1, 0, 0, 1, 1,
0.7222625, -0.6469883, 1.883891, 1, 0, 0, 1, 1,
0.7321991, -0.4643723, 2.672237, 1, 0, 0, 1, 1,
0.738876, 1.531451, -0.7537205, 1, 0, 0, 1, 1,
0.7478094, -1.203553, 3.40324, 1, 0, 0, 1, 1,
0.7557815, 0.2356487, 1.831615, 0, 0, 0, 1, 1,
0.7575715, -1.273387, 2.021346, 0, 0, 0, 1, 1,
0.7614711, 0.4077751, -0.4925881, 0, 0, 0, 1, 1,
0.7668033, 0.9171999, 0.8332506, 0, 0, 0, 1, 1,
0.7740136, -1.324926, 5.20329, 0, 0, 0, 1, 1,
0.7780077, -1.362604, 2.405603, 0, 0, 0, 1, 1,
0.7794424, 0.8008677, -0.4930216, 0, 0, 0, 1, 1,
0.7812931, 0.1264652, 2.0516, 1, 1, 1, 1, 1,
0.783793, -0.01076248, 1.747989, 1, 1, 1, 1, 1,
0.7939354, -0.7558857, 1.306191, 1, 1, 1, 1, 1,
0.7975401, 0.3304443, 1.567228, 1, 1, 1, 1, 1,
0.7987919, 0.4477489, -0.09107619, 1, 1, 1, 1, 1,
0.8044031, -1.114638, 3.054804, 1, 1, 1, 1, 1,
0.8044138, 0.5477336, -0.3271362, 1, 1, 1, 1, 1,
0.8091756, 0.2313343, 1.749577, 1, 1, 1, 1, 1,
0.8092926, -1.559743, 1.688255, 1, 1, 1, 1, 1,
0.8179903, 0.3510641, 1.508536, 1, 1, 1, 1, 1,
0.8208674, -0.3138616, 2.920683, 1, 1, 1, 1, 1,
0.8236346, -0.3907767, 0.9000727, 1, 1, 1, 1, 1,
0.8261791, -0.888972, 1.589302, 1, 1, 1, 1, 1,
0.8261968, -0.2087624, 1.432234, 1, 1, 1, 1, 1,
0.8268648, -0.8265423, 3.119343, 1, 1, 1, 1, 1,
0.829595, 0.09728406, 0.2480237, 0, 0, 1, 1, 1,
0.8357455, -0.8863866, 2.330271, 1, 0, 0, 1, 1,
0.841486, 0.2704085, 1.596386, 1, 0, 0, 1, 1,
0.8565425, 1.633287, -0.8282357, 1, 0, 0, 1, 1,
0.8654788, 0.6059576, -0.1883582, 1, 0, 0, 1, 1,
0.8659351, 0.6851809, -1.335325, 1, 0, 0, 1, 1,
0.8680258, -0.1942108, 1.141333, 0, 0, 0, 1, 1,
0.8702762, 1.48368, 1.656397, 0, 0, 0, 1, 1,
0.872147, -1.717692, 2.686662, 0, 0, 0, 1, 1,
0.872291, 1.093906, 1.341887, 0, 0, 0, 1, 1,
0.8738275, -0.1727929, 2.964667, 0, 0, 0, 1, 1,
0.8795158, -0.2257532, 2.07089, 0, 0, 0, 1, 1,
0.8820551, -0.9285468, 0.7813643, 0, 0, 0, 1, 1,
0.8844154, -1.032063, 3.989371, 1, 1, 1, 1, 1,
0.8881223, 1.62323, -0.3055646, 1, 1, 1, 1, 1,
0.8958516, 0.5466532, 1.506471, 1, 1, 1, 1, 1,
0.897899, 0.680494, 0.8804944, 1, 1, 1, 1, 1,
0.8982599, 0.8779767, -0.4284344, 1, 1, 1, 1, 1,
0.9030601, 2.02633, 0.5992024, 1, 1, 1, 1, 1,
0.9048005, 0.1055978, 2.847965, 1, 1, 1, 1, 1,
0.9065239, -0.5161623, 2.000235, 1, 1, 1, 1, 1,
0.9099553, 0.9243485, 0.40519, 1, 1, 1, 1, 1,
0.9127567, 0.6535733, 0.9582915, 1, 1, 1, 1, 1,
0.9128247, -0.06448796, 2.217628, 1, 1, 1, 1, 1,
0.9151539, 0.2975311, 1.589227, 1, 1, 1, 1, 1,
0.9155882, 0.1030503, 1.521182, 1, 1, 1, 1, 1,
0.9156402, -0.9319769, 0.6982433, 1, 1, 1, 1, 1,
0.9164112, 1.271766, 0.5847774, 1, 1, 1, 1, 1,
0.92935, 0.63601, 1.467756, 0, 0, 1, 1, 1,
0.9330611, -0.04912736, 1.442969, 1, 0, 0, 1, 1,
0.9331917, 0.259764, 0.8208233, 1, 0, 0, 1, 1,
0.9364969, 0.748256, -1.109783, 1, 0, 0, 1, 1,
0.9425825, 1.063437, 1.718408, 1, 0, 0, 1, 1,
0.9463387, -0.6420514, 2.358984, 1, 0, 0, 1, 1,
0.9507797, 3.199912, 1.032906, 0, 0, 0, 1, 1,
0.951998, -0.8093457, 3.020313, 0, 0, 0, 1, 1,
0.9548556, -1.194314, 3.76283, 0, 0, 0, 1, 1,
0.9643542, -1.579107, 2.13746, 0, 0, 0, 1, 1,
0.9650572, 1.339852, -0.5790616, 0, 0, 0, 1, 1,
0.9762626, 1.286108, 2.537562, 0, 0, 0, 1, 1,
0.9855526, -1.606763, 2.909807, 0, 0, 0, 1, 1,
0.9880906, -0.3588615, 0.9918628, 1, 1, 1, 1, 1,
0.9906462, 0.3527703, -1.508551, 1, 1, 1, 1, 1,
0.9916886, -0.8066579, 2.690676, 1, 1, 1, 1, 1,
0.9933047, -0.5510099, 2.881156, 1, 1, 1, 1, 1,
0.9950368, 0.168061, 1.053899, 1, 1, 1, 1, 1,
1.001307, 1.037986, -0.148517, 1, 1, 1, 1, 1,
1.004081, -0.7788095, 2.412272, 1, 1, 1, 1, 1,
1.009191, -1.317925, 1.353198, 1, 1, 1, 1, 1,
1.009429, 0.4995424, 1.860514, 1, 1, 1, 1, 1,
1.027158, -0.2866736, 2.38333, 1, 1, 1, 1, 1,
1.0277, -0.3474348, 3.422348, 1, 1, 1, 1, 1,
1.034791, -0.4047656, 2.873128, 1, 1, 1, 1, 1,
1.037688, 0.4551247, 2.704619, 1, 1, 1, 1, 1,
1.038843, -1.270873, 3.851939, 1, 1, 1, 1, 1,
1.042714, 0.278324, 0.1426636, 1, 1, 1, 1, 1,
1.048503, 0.8737229, -0.5354173, 0, 0, 1, 1, 1,
1.069386, -1.750775, 3.680691, 1, 0, 0, 1, 1,
1.071374, 0.0771649, 2.097699, 1, 0, 0, 1, 1,
1.071663, -0.2963778, 1.768883, 1, 0, 0, 1, 1,
1.079753, 2.180434, 1.494324, 1, 0, 0, 1, 1,
1.08408, -0.0421122, 0.8304189, 1, 0, 0, 1, 1,
1.087573, 0.6929902, 0.8845388, 0, 0, 0, 1, 1,
1.102403, 1.979169, 0.4932486, 0, 0, 0, 1, 1,
1.104775, 0.06478619, 2.324266, 0, 0, 0, 1, 1,
1.109999, -0.8179935, 1.639972, 0, 0, 0, 1, 1,
1.125546, 0.6205116, -0.002044294, 0, 0, 0, 1, 1,
1.125744, -0.5850933, 3.649452, 0, 0, 0, 1, 1,
1.132501, 0.5252094, -0.3098626, 0, 0, 0, 1, 1,
1.137954, -1.090937, 1.70836, 1, 1, 1, 1, 1,
1.147977, -0.3711431, 2.888981, 1, 1, 1, 1, 1,
1.156262, -0.09428505, 2.600216, 1, 1, 1, 1, 1,
1.159318, 1.604122, 0.8269435, 1, 1, 1, 1, 1,
1.160545, -0.9292355, 1.68309, 1, 1, 1, 1, 1,
1.164217, 0.7647426, 1.123927, 1, 1, 1, 1, 1,
1.166724, -0.04468842, 0.2715466, 1, 1, 1, 1, 1,
1.173767, -0.3813366, 1.566353, 1, 1, 1, 1, 1,
1.17383, -1.111356, 1.298136, 1, 1, 1, 1, 1,
1.179261, 0.2509642, 2.062108, 1, 1, 1, 1, 1,
1.18104, -0.5626741, 3.227206, 1, 1, 1, 1, 1,
1.192402, -0.4078262, 2.891504, 1, 1, 1, 1, 1,
1.202772, 1.141705, 2.53579, 1, 1, 1, 1, 1,
1.208126, -0.5959595, 1.905446, 1, 1, 1, 1, 1,
1.208938, 0.9387199, 2.677134, 1, 1, 1, 1, 1,
1.209474, -0.133796, 0.6115991, 0, 0, 1, 1, 1,
1.225037, 2.392701, 1.612133, 1, 0, 0, 1, 1,
1.234717, -1.1914, 1.113849, 1, 0, 0, 1, 1,
1.252782, -1.134214, 0.9261475, 1, 0, 0, 1, 1,
1.259274, 0.2834915, 2.999771, 1, 0, 0, 1, 1,
1.27737, 1.243386, 1.092525, 1, 0, 0, 1, 1,
1.283466, 1.929923, 1.5868, 0, 0, 0, 1, 1,
1.284007, 1.863678, 1.290306, 0, 0, 0, 1, 1,
1.284685, 0.04765652, 0.7306566, 0, 0, 0, 1, 1,
1.285749, 0.9856777, -0.6396878, 0, 0, 0, 1, 1,
1.287604, 0.4477987, 3.500052, 0, 0, 0, 1, 1,
1.319163, -0.2491656, 4.30384, 0, 0, 0, 1, 1,
1.326741, 0.5063136, 0.4643709, 0, 0, 0, 1, 1,
1.329847, 1.019612, 0.9880481, 1, 1, 1, 1, 1,
1.330854, 0.008227624, 2.925755, 1, 1, 1, 1, 1,
1.33348, -1.184152, 1.604772, 1, 1, 1, 1, 1,
1.342434, 0.8921549, 1.131521, 1, 1, 1, 1, 1,
1.343659, -0.3297715, 1.971534, 1, 1, 1, 1, 1,
1.345572, 1.762322, 1.435859, 1, 1, 1, 1, 1,
1.34766, 0.5561945, 1.116854, 1, 1, 1, 1, 1,
1.357713, -0.1249911, 2.843498, 1, 1, 1, 1, 1,
1.358108, 0.16005, 3.262867, 1, 1, 1, 1, 1,
1.382082, -1.593609, 2.371906, 1, 1, 1, 1, 1,
1.382841, 2.161668, -0.306298, 1, 1, 1, 1, 1,
1.384173, -0.5108839, 2.351585, 1, 1, 1, 1, 1,
1.386989, -1.01464, 1.456936, 1, 1, 1, 1, 1,
1.417298, -0.6276452, 0.6955342, 1, 1, 1, 1, 1,
1.420436, -0.7442319, 2.935158, 1, 1, 1, 1, 1,
1.42389, -1.32733, 2.916024, 0, 0, 1, 1, 1,
1.425144, -0.5790278, 0.8831324, 1, 0, 0, 1, 1,
1.436326, -1.046314, 2.210198, 1, 0, 0, 1, 1,
1.440393, 2.927997, 0.7757805, 1, 0, 0, 1, 1,
1.449279, -0.3317589, -0.02375749, 1, 0, 0, 1, 1,
1.455934, -0.591476, 2.2555, 1, 0, 0, 1, 1,
1.460668, -0.03822807, 1.922982, 0, 0, 0, 1, 1,
1.465054, -0.3784283, 2.443987, 0, 0, 0, 1, 1,
1.494239, 0.5504999, 2.365118, 0, 0, 0, 1, 1,
1.500135, -0.8605195, 0.7175968, 0, 0, 0, 1, 1,
1.508642, 0.6996015, 1.053949, 0, 0, 0, 1, 1,
1.525464, 0.2588257, 1.877097, 0, 0, 0, 1, 1,
1.543784, 0.0141671, 2.261518, 0, 0, 0, 1, 1,
1.54587, -0.4525889, -0.8381034, 1, 1, 1, 1, 1,
1.54785, -1.186717, 1.604941, 1, 1, 1, 1, 1,
1.548304, -0.812121, 2.513554, 1, 1, 1, 1, 1,
1.559816, -0.4323014, 1.008483, 1, 1, 1, 1, 1,
1.56351, 0.2868871, 1.973434, 1, 1, 1, 1, 1,
1.565697, 1.240275, 1.581703, 1, 1, 1, 1, 1,
1.567987, 0.6333945, 0.8297166, 1, 1, 1, 1, 1,
1.578519, -1.006366, 2.937088, 1, 1, 1, 1, 1,
1.578915, -0.05071035, 2.829178, 1, 1, 1, 1, 1,
1.597883, -1.158262, 2.326292, 1, 1, 1, 1, 1,
1.627596, 0.1782499, 1.632837, 1, 1, 1, 1, 1,
1.628757, 0.4106738, 0.649226, 1, 1, 1, 1, 1,
1.6494, -0.5546539, 1.851313, 1, 1, 1, 1, 1,
1.657065, 0.2100635, -0.278599, 1, 1, 1, 1, 1,
1.658496, 0.281301, 0.7748194, 1, 1, 1, 1, 1,
1.662504, 1.127664, 0.007541314, 0, 0, 1, 1, 1,
1.684732, 1.348149, 0.9291868, 1, 0, 0, 1, 1,
1.699589, 0.1555912, 1.071991, 1, 0, 0, 1, 1,
1.708686, 0.7871405, 1.940747, 1, 0, 0, 1, 1,
1.710671, -0.06397274, -0.444076, 1, 0, 0, 1, 1,
1.711827, -0.4313536, 2.601797, 1, 0, 0, 1, 1,
1.716206, 0.6084384, 0.06236416, 0, 0, 0, 1, 1,
1.716499, 0.5303845, 2.328363, 0, 0, 0, 1, 1,
1.735261, 0.7972946, 2.171875, 0, 0, 0, 1, 1,
1.741936, -0.523221, 2.397987, 0, 0, 0, 1, 1,
1.746823, 1.795316, 1.731065, 0, 0, 0, 1, 1,
1.750546, -0.02990948, 0.8364872, 0, 0, 0, 1, 1,
1.777081, -0.6036946, 2.606205, 0, 0, 0, 1, 1,
1.796352, -1.70145, 3.2145, 1, 1, 1, 1, 1,
1.809906, -0.448241, 0.7328453, 1, 1, 1, 1, 1,
1.812449, -0.7664392, 3.584324, 1, 1, 1, 1, 1,
1.823128, 0.7820025, 0.4508539, 1, 1, 1, 1, 1,
1.879976, -1.173081, 0.5655842, 1, 1, 1, 1, 1,
1.912858, 0.3342359, 2.171013, 1, 1, 1, 1, 1,
1.91412, -0.8715883, 1.444235, 1, 1, 1, 1, 1,
1.916545, 0.2424064, 2.591463, 1, 1, 1, 1, 1,
1.916727, 0.1515475, 2.705175, 1, 1, 1, 1, 1,
1.940313, -2.380525, 2.614719, 1, 1, 1, 1, 1,
1.989509, -0.282574, 2.080646, 1, 1, 1, 1, 1,
2.01919, -0.9842282, 2.476451, 1, 1, 1, 1, 1,
2.030737, -1.477512, 1.529658, 1, 1, 1, 1, 1,
2.031253, -2.266653, 0.4548435, 1, 1, 1, 1, 1,
2.054602, 0.3177727, 3.125108, 1, 1, 1, 1, 1,
2.07064, -0.6237847, 3.231694, 0, 0, 1, 1, 1,
2.145811, 0.8281084, 1.232086, 1, 0, 0, 1, 1,
2.151798, 0.08357217, 2.116589, 1, 0, 0, 1, 1,
2.170929, 0.5136098, 3.116991, 1, 0, 0, 1, 1,
2.212242, -0.8009017, 1.475361, 1, 0, 0, 1, 1,
2.250457, -0.6312299, 1.707782, 1, 0, 0, 1, 1,
2.270193, 0.6591396, 1.965606, 0, 0, 0, 1, 1,
2.275731, 0.4981408, -0.7494798, 0, 0, 0, 1, 1,
2.280918, 0.0253722, -1.25486, 0, 0, 0, 1, 1,
2.293977, -1.052922, 2.424929, 0, 0, 0, 1, 1,
2.355258, -0.7303241, 2.009933, 0, 0, 0, 1, 1,
2.371385, 0.2004222, 1.637977, 0, 0, 0, 1, 1,
2.438766, 0.3099139, 3.345437, 0, 0, 0, 1, 1,
2.46012, -0.2353998, 1.145517, 1, 1, 1, 1, 1,
2.484925, 0.029631, -0.06181085, 1, 1, 1, 1, 1,
2.528549, 0.1628534, 2.444779, 1, 1, 1, 1, 1,
2.539355, 0.3893805, 1.282638, 1, 1, 1, 1, 1,
2.612865, -0.3845922, 2.636979, 1, 1, 1, 1, 1,
2.870491, -0.4750032, 1.345754, 1, 1, 1, 1, 1,
3.377945, 1.10698, 2.237011, 1, 1, 1, 1, 1
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
var radius = 9.666031;
var distance = 33.95152;
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
mvMatrix.translate( -0.1475127, -0.05918837, 0.2908998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95152);
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
