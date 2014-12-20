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
-2.824524, 0.9298276, -3.221366, 1, 0, 0, 1,
-2.757318, 0.2816266, -2.169335, 1, 0.007843138, 0, 1,
-2.678808, 0.1118048, -2.203528, 1, 0.01176471, 0, 1,
-2.575249, 1.222323, -0.3483596, 1, 0.01960784, 0, 1,
-2.561727, -0.6516013, -0.6466749, 1, 0.02352941, 0, 1,
-2.52265, -0.2387583, -0.8518428, 1, 0.03137255, 0, 1,
-2.357043, -1.654537, -2.114341, 1, 0.03529412, 0, 1,
-2.245248, 0.4793489, -3.091819, 1, 0.04313726, 0, 1,
-2.219971, 1.092567, -0.2952561, 1, 0.04705882, 0, 1,
-2.218489, -0.4448288, -3.369342, 1, 0.05490196, 0, 1,
-2.144341, 0.67127, -1.116817, 1, 0.05882353, 0, 1,
-2.119893, 0.2665803, -0.358205, 1, 0.06666667, 0, 1,
-2.116203, -1.499503, -3.610118, 1, 0.07058824, 0, 1,
-2.10909, -1.011037, -2.941594, 1, 0.07843138, 0, 1,
-2.106446, -0.08921376, -2.539805, 1, 0.08235294, 0, 1,
-2.08998, 0.8195379, -1.369668, 1, 0.09019608, 0, 1,
-2.002145, -0.3258752, -2.202184, 1, 0.09411765, 0, 1,
-1.924578, -1.33413, -0.1413533, 1, 0.1019608, 0, 1,
-1.908293, -1.540762, -2.190956, 1, 0.1098039, 0, 1,
-1.87732, 0.561099, -0.8748352, 1, 0.1137255, 0, 1,
-1.872535, 0.3923091, -1.095326, 1, 0.1215686, 0, 1,
-1.864961, -2.062212, -0.5477473, 1, 0.1254902, 0, 1,
-1.858992, -0.006220824, -3.224381, 1, 0.1333333, 0, 1,
-1.850085, -0.02984332, -1.356732, 1, 0.1372549, 0, 1,
-1.84919, 1.079127, 0.0175703, 1, 0.145098, 0, 1,
-1.828508, -0.02963183, -0.1239142, 1, 0.1490196, 0, 1,
-1.818844, 1.455838, 0.7054226, 1, 0.1568628, 0, 1,
-1.8098, 0.4094193, -2.310936, 1, 0.1607843, 0, 1,
-1.802906, -0.1944233, -0.4228332, 1, 0.1686275, 0, 1,
-1.790404, 1.355288, -2.51786, 1, 0.172549, 0, 1,
-1.775175, 1.189608, -1.863366, 1, 0.1803922, 0, 1,
-1.769005, 0.2859863, -0.443951, 1, 0.1843137, 0, 1,
-1.753387, 0.5980083, -1.630783, 1, 0.1921569, 0, 1,
-1.750396, 0.08193259, -1.540198, 1, 0.1960784, 0, 1,
-1.748546, 0.3937742, -0.5940864, 1, 0.2039216, 0, 1,
-1.741581, -0.8768789, -1.815682, 1, 0.2117647, 0, 1,
-1.73407, -0.8168116, -1.775218, 1, 0.2156863, 0, 1,
-1.731448, 1.309959, 1.042783, 1, 0.2235294, 0, 1,
-1.720013, -0.4050507, -3.214652, 1, 0.227451, 0, 1,
-1.707656, -0.9905007, -0.08880115, 1, 0.2352941, 0, 1,
-1.696981, -0.3189994, -1.570549, 1, 0.2392157, 0, 1,
-1.691836, 0.005860994, -0.8030487, 1, 0.2470588, 0, 1,
-1.683086, 1.038265, -1.597765, 1, 0.2509804, 0, 1,
-1.656528, -1.159656, -2.501301, 1, 0.2588235, 0, 1,
-1.652109, 0.134328, -0.7533903, 1, 0.2627451, 0, 1,
-1.640025, -0.3909575, -2.209805, 1, 0.2705882, 0, 1,
-1.622231, 1.292393, -1.077805, 1, 0.2745098, 0, 1,
-1.610972, 0.03942377, -1.337438, 1, 0.282353, 0, 1,
-1.606963, 2.592207, -0.112789, 1, 0.2862745, 0, 1,
-1.60622, -1.241843, -2.716595, 1, 0.2941177, 0, 1,
-1.601254, -0.01973999, -0.8644372, 1, 0.3019608, 0, 1,
-1.597612, -0.2531664, -0.3449608, 1, 0.3058824, 0, 1,
-1.586557, -1.541184, -1.065232, 1, 0.3137255, 0, 1,
-1.572426, -0.9338231, -2.087226, 1, 0.3176471, 0, 1,
-1.569498, 0.8445235, -0.63865, 1, 0.3254902, 0, 1,
-1.56595, 0.2634301, 0.2862747, 1, 0.3294118, 0, 1,
-1.56425, -1.281495, -2.053763, 1, 0.3372549, 0, 1,
-1.562829, 2.159332, -1.740162, 1, 0.3411765, 0, 1,
-1.561842, -0.9469205, -3.092483, 1, 0.3490196, 0, 1,
-1.550046, -0.4444179, -0.4251919, 1, 0.3529412, 0, 1,
-1.548872, 0.04156885, -1.546508, 1, 0.3607843, 0, 1,
-1.547911, 0.4467634, -0.04349889, 1, 0.3647059, 0, 1,
-1.540276, -0.8347794, -2.81032, 1, 0.372549, 0, 1,
-1.538267, 0.2584577, -1.889484, 1, 0.3764706, 0, 1,
-1.520139, -0.6862411, -1.873987, 1, 0.3843137, 0, 1,
-1.519356, -0.8699533, -3.334004, 1, 0.3882353, 0, 1,
-1.502024, 0.1952068, -0.3441467, 1, 0.3960784, 0, 1,
-1.490691, -0.7126055, -0.4875342, 1, 0.4039216, 0, 1,
-1.486618, -0.7677544, -0.9870467, 1, 0.4078431, 0, 1,
-1.481728, -1.814496, -2.153558, 1, 0.4156863, 0, 1,
-1.477587, -0.05819193, -0.9101496, 1, 0.4196078, 0, 1,
-1.476133, 3.17656, -0.2574268, 1, 0.427451, 0, 1,
-1.468003, 0.5314012, -1.368571, 1, 0.4313726, 0, 1,
-1.443414, -1.221024, -0.9557926, 1, 0.4392157, 0, 1,
-1.437911, -1.184609, -2.704635, 1, 0.4431373, 0, 1,
-1.430603, 0.138659, 0.2385167, 1, 0.4509804, 0, 1,
-1.422655, -1.025367, -2.807727, 1, 0.454902, 0, 1,
-1.419986, 1.057506, -1.31226, 1, 0.4627451, 0, 1,
-1.419656, 0.7482272, -1.484625, 1, 0.4666667, 0, 1,
-1.414441, -0.2033955, -0.354298, 1, 0.4745098, 0, 1,
-1.408445, -0.4626084, -1.389755, 1, 0.4784314, 0, 1,
-1.401581, 0.3590812, -0.7441756, 1, 0.4862745, 0, 1,
-1.40021, -0.2087549, -0.7143462, 1, 0.4901961, 0, 1,
-1.399656, 0.5912488, -2.316077, 1, 0.4980392, 0, 1,
-1.39632, -1.254377, -2.700624, 1, 0.5058824, 0, 1,
-1.381363, 0.1256835, -1.992339, 1, 0.509804, 0, 1,
-1.374454, -0.3091381, -2.809335, 1, 0.5176471, 0, 1,
-1.368124, -1.233204, -0.719945, 1, 0.5215687, 0, 1,
-1.36621, 2.543905, -0.3538998, 1, 0.5294118, 0, 1,
-1.342507, -1.388691, -0.9069514, 1, 0.5333334, 0, 1,
-1.338924, -1.353937, -3.333536, 1, 0.5411765, 0, 1,
-1.333378, 1.255119, -2.016067, 1, 0.5450981, 0, 1,
-1.32287, -1.354771, -0.625054, 1, 0.5529412, 0, 1,
-1.318071, 1.621461, -0.1868196, 1, 0.5568628, 0, 1,
-1.311262, -0.2664869, -0.8904489, 1, 0.5647059, 0, 1,
-1.304511, 0.09783459, -0.7891858, 1, 0.5686275, 0, 1,
-1.284269, -0.8209375, -3.319803, 1, 0.5764706, 0, 1,
-1.284245, 0.2963326, -0.5454801, 1, 0.5803922, 0, 1,
-1.281146, -0.452354, -2.516423, 1, 0.5882353, 0, 1,
-1.280351, -1.824575, -2.964376, 1, 0.5921569, 0, 1,
-1.266237, 0.8633956, -0.794376, 1, 0.6, 0, 1,
-1.262553, -0.3378054, -2.768923, 1, 0.6078432, 0, 1,
-1.262198, -0.570842, -0.349472, 1, 0.6117647, 0, 1,
-1.254623, -0.1685212, -0.3814937, 1, 0.6196079, 0, 1,
-1.2501, 0.3198244, -2.705406, 1, 0.6235294, 0, 1,
-1.245006, 0.5169033, -1.269696, 1, 0.6313726, 0, 1,
-1.239318, -0.06962644, -1.438213, 1, 0.6352941, 0, 1,
-1.239268, -1.65196, -2.8175, 1, 0.6431373, 0, 1,
-1.212433, 1.012001, -1.069065, 1, 0.6470588, 0, 1,
-1.206898, -1.793433, -1.350675, 1, 0.654902, 0, 1,
-1.205253, -1.418815, -2.709236, 1, 0.6588235, 0, 1,
-1.198285, -0.2958352, -3.092777, 1, 0.6666667, 0, 1,
-1.196393, -0.4400347, -3.267456, 1, 0.6705883, 0, 1,
-1.183453, 0.7732989, -3.184502, 1, 0.6784314, 0, 1,
-1.174702, -0.9271608, -0.9119087, 1, 0.682353, 0, 1,
-1.17361, 1.296329, -0.0533242, 1, 0.6901961, 0, 1,
-1.167978, 0.8004292, -0.5414635, 1, 0.6941177, 0, 1,
-1.166221, -1.283824, -2.861824, 1, 0.7019608, 0, 1,
-1.160113, -0.456554, -2.59095, 1, 0.7098039, 0, 1,
-1.158844, 1.548312, 0.7401024, 1, 0.7137255, 0, 1,
-1.152862, 1.568759, -0.02539402, 1, 0.7215686, 0, 1,
-1.148584, -1.700865, -2.75595, 1, 0.7254902, 0, 1,
-1.144035, -0.1756417, -2.667537, 1, 0.7333333, 0, 1,
-1.138895, -0.6121846, -1.611835, 1, 0.7372549, 0, 1,
-1.133829, 0.3047964, -0.2316006, 1, 0.7450981, 0, 1,
-1.12991, -0.7262984, -2.155294, 1, 0.7490196, 0, 1,
-1.128936, 0.5461396, -0.2274749, 1, 0.7568628, 0, 1,
-1.126397, 0.06628125, -2.175552, 1, 0.7607843, 0, 1,
-1.110226, 0.1710937, -1.571945, 1, 0.7686275, 0, 1,
-1.109528, 0.9084927, -0.8635031, 1, 0.772549, 0, 1,
-1.107021, 1.496502, -1.884246, 1, 0.7803922, 0, 1,
-1.096871, -0.678373, -1.20726, 1, 0.7843137, 0, 1,
-1.093963, 1.09173, -1.701403, 1, 0.7921569, 0, 1,
-1.093437, 0.04217235, -2.999199, 1, 0.7960784, 0, 1,
-1.093417, -0.6920846, -2.981837, 1, 0.8039216, 0, 1,
-1.07527, -0.6139655, -0.9734895, 1, 0.8117647, 0, 1,
-1.074238, -1.615007, -2.360893, 1, 0.8156863, 0, 1,
-1.072681, -2.235325, -1.21427, 1, 0.8235294, 0, 1,
-1.068961, 2.839825, 0.3287862, 1, 0.827451, 0, 1,
-1.065144, -0.2224434, -1.40415, 1, 0.8352941, 0, 1,
-1.058699, -0.08611342, -1.545358, 1, 0.8392157, 0, 1,
-1.049236, 0.01746667, -0.7971957, 1, 0.8470588, 0, 1,
-1.049071, -1.62711, -1.515864, 1, 0.8509804, 0, 1,
-1.047822, 0.3589004, -0.5666128, 1, 0.8588235, 0, 1,
-1.04657, -0.4754566, -2.157918, 1, 0.8627451, 0, 1,
-1.045931, -0.3844268, -2.386539, 1, 0.8705882, 0, 1,
-1.041247, 0.4010535, -0.1253454, 1, 0.8745098, 0, 1,
-1.040737, -0.7681062, -1.524263, 1, 0.8823529, 0, 1,
-1.040349, 1.193871, 0.3150829, 1, 0.8862745, 0, 1,
-1.038057, -0.08844875, -0.07314537, 1, 0.8941177, 0, 1,
-1.032351, 1.375542, -0.9064059, 1, 0.8980392, 0, 1,
-1.025467, -1.074257, -1.182565, 1, 0.9058824, 0, 1,
-1.023551, 0.0917054, -1.612512, 1, 0.9137255, 0, 1,
-1.021686, 0.07639666, -0.3005297, 1, 0.9176471, 0, 1,
-1.016185, 0.2794856, -1.707058, 1, 0.9254902, 0, 1,
-1.01408, 1.908554, 0.9712002, 1, 0.9294118, 0, 1,
-1.011903, -0.2523041, -2.541938, 1, 0.9372549, 0, 1,
-1.000792, 0.1717382, -1.112999, 1, 0.9411765, 0, 1,
-1.000417, 0.1836492, -0.6548918, 1, 0.9490196, 0, 1,
-1.000076, -0.7311836, -1.193432, 1, 0.9529412, 0, 1,
-0.9909264, -1.437569, -3.588594, 1, 0.9607843, 0, 1,
-0.9850538, -0.01555669, -3.582363, 1, 0.9647059, 0, 1,
-0.9782148, 1.614163, -3.030088, 1, 0.972549, 0, 1,
-0.9763038, -0.290634, -1.840254, 1, 0.9764706, 0, 1,
-0.9759867, -0.8663204, -3.11068, 1, 0.9843137, 0, 1,
-0.9704995, -0.5180708, -1.280331, 1, 0.9882353, 0, 1,
-0.9493563, 0.5219427, -1.731989, 1, 0.9960784, 0, 1,
-0.9461073, -2.214236, -1.549862, 0.9960784, 1, 0, 1,
-0.9446234, 0.2968674, -4.118303, 0.9921569, 1, 0, 1,
-0.9394811, -0.04804511, -3.154931, 0.9843137, 1, 0, 1,
-0.9381296, -1.499452, -2.789209, 0.9803922, 1, 0, 1,
-0.9331123, 0.8057458, -1.113835, 0.972549, 1, 0, 1,
-0.9318288, 0.954742, -1.332745, 0.9686275, 1, 0, 1,
-0.9255546, 0.6602145, -0.9227134, 0.9607843, 1, 0, 1,
-0.9215111, -0.9575561, -1.18352, 0.9568627, 1, 0, 1,
-0.9126809, -0.4314072, -1.83662, 0.9490196, 1, 0, 1,
-0.9118795, 0.2964972, -1.802138, 0.945098, 1, 0, 1,
-0.9069832, 0.6794177, -1.874468, 0.9372549, 1, 0, 1,
-0.903931, -1.073928, -2.31892, 0.9333333, 1, 0, 1,
-0.9037355, -2.527915, -1.604242, 0.9254902, 1, 0, 1,
-0.9023935, -0.202808, -0.999103, 0.9215686, 1, 0, 1,
-0.8944567, -0.6840534, -2.255981, 0.9137255, 1, 0, 1,
-0.8891684, -0.9167053, -2.450995, 0.9098039, 1, 0, 1,
-0.8882222, 1.313318, -1.250182, 0.9019608, 1, 0, 1,
-0.8835793, -0.306842, -0.002056502, 0.8941177, 1, 0, 1,
-0.8786234, 0.6799165, -1.896986, 0.8901961, 1, 0, 1,
-0.8759411, -0.5747365, -2.243611, 0.8823529, 1, 0, 1,
-0.8755423, -0.6420324, -4.175555, 0.8784314, 1, 0, 1,
-0.8658702, -0.2837207, -1.566103, 0.8705882, 1, 0, 1,
-0.863111, -0.98225, -2.477116, 0.8666667, 1, 0, 1,
-0.8581025, -0.5971303, -1.813119, 0.8588235, 1, 0, 1,
-0.8570327, 0.8083315, 0.2274264, 0.854902, 1, 0, 1,
-0.8546817, -1.277621, -2.657688, 0.8470588, 1, 0, 1,
-0.8503156, 1.913375, -1.303564, 0.8431373, 1, 0, 1,
-0.8486719, 0.7794272, 0.8823459, 0.8352941, 1, 0, 1,
-0.8445011, 1.285916, -1.317573, 0.8313726, 1, 0, 1,
-0.8427488, -0.1899987, -2.79283, 0.8235294, 1, 0, 1,
-0.8411585, -0.4031097, -0.6825191, 0.8196079, 1, 0, 1,
-0.8373222, -0.3204449, -1.347481, 0.8117647, 1, 0, 1,
-0.8196618, 1.162888, 0.8548472, 0.8078431, 1, 0, 1,
-0.8157535, 1.645861, 1.168228, 0.8, 1, 0, 1,
-0.8127673, -0.2661406, -0.7001436, 0.7921569, 1, 0, 1,
-0.8123575, -0.7891098, -4.861812, 0.7882353, 1, 0, 1,
-0.8026129, -1.068676, -1.743918, 0.7803922, 1, 0, 1,
-0.7988207, 1.208669, 0.6985076, 0.7764706, 1, 0, 1,
-0.7896355, -0.3300783, -0.3548524, 0.7686275, 1, 0, 1,
-0.7878392, 0.2934557, -0.6568433, 0.7647059, 1, 0, 1,
-0.7842985, -0.8392875, -4.347389, 0.7568628, 1, 0, 1,
-0.7837726, 1.281378, -2.048175, 0.7529412, 1, 0, 1,
-0.7825683, 0.6786913, -2.327781, 0.7450981, 1, 0, 1,
-0.7812925, -1.597591, -3.614323, 0.7411765, 1, 0, 1,
-0.7667605, 0.7131962, 1.497575, 0.7333333, 1, 0, 1,
-0.7596822, -1.958378, -2.734012, 0.7294118, 1, 0, 1,
-0.7586253, -0.5019395, -3.215817, 0.7215686, 1, 0, 1,
-0.7573456, 0.5998806, 0.007901923, 0.7176471, 1, 0, 1,
-0.7554572, 1.021735, -0.03612772, 0.7098039, 1, 0, 1,
-0.7545764, 0.6218642, -0.9572846, 0.7058824, 1, 0, 1,
-0.7510483, 0.8373727, -1.27489, 0.6980392, 1, 0, 1,
-0.748581, 1.424001, 0.2799073, 0.6901961, 1, 0, 1,
-0.7467055, -1.479246, -3.244749, 0.6862745, 1, 0, 1,
-0.7464828, 1.081617, -0.4140896, 0.6784314, 1, 0, 1,
-0.7452427, -0.6494439, -2.998195, 0.6745098, 1, 0, 1,
-0.7450643, 0.7545578, -1.041092, 0.6666667, 1, 0, 1,
-0.7411688, 0.289483, -1.741176, 0.6627451, 1, 0, 1,
-0.7406904, -0.2056519, -0.6645627, 0.654902, 1, 0, 1,
-0.7344725, 0.6011888, -1.320855, 0.6509804, 1, 0, 1,
-0.7320263, 0.04326358, -1.986569, 0.6431373, 1, 0, 1,
-0.7305873, 0.09847519, -0.3205388, 0.6392157, 1, 0, 1,
-0.7281671, -0.308357, -3.575745, 0.6313726, 1, 0, 1,
-0.7276157, -1.594069, -2.831433, 0.627451, 1, 0, 1,
-0.7250338, 0.04836876, -2.594726, 0.6196079, 1, 0, 1,
-0.7239708, 0.5438103, -0.1728273, 0.6156863, 1, 0, 1,
-0.7208479, 2.440764, 0.2452292, 0.6078432, 1, 0, 1,
-0.718239, -0.100869, -1.534756, 0.6039216, 1, 0, 1,
-0.7061005, 0.2056862, -1.34752, 0.5960785, 1, 0, 1,
-0.7020373, 0.2825276, 0.9984072, 0.5882353, 1, 0, 1,
-0.7016921, -0.4727553, -2.574996, 0.5843138, 1, 0, 1,
-0.701072, 0.5139456, -0.5915828, 0.5764706, 1, 0, 1,
-0.6975591, 0.8104501, -0.9529361, 0.572549, 1, 0, 1,
-0.6947755, 0.7215, -2.421864, 0.5647059, 1, 0, 1,
-0.6917844, 0.5566778, -0.02666014, 0.5607843, 1, 0, 1,
-0.6826731, -0.2692122, -0.9993294, 0.5529412, 1, 0, 1,
-0.6791347, -0.1447674, -2.46521, 0.5490196, 1, 0, 1,
-0.6767961, 0.03542012, -0.9651774, 0.5411765, 1, 0, 1,
-0.6752413, -1.943405, -1.691543, 0.5372549, 1, 0, 1,
-0.6746292, -0.6947841, -2.709572, 0.5294118, 1, 0, 1,
-0.6740711, -0.1277814, -1.343704, 0.5254902, 1, 0, 1,
-0.6702552, -0.08127581, -1.395907, 0.5176471, 1, 0, 1,
-0.6686531, -0.3601314, -1.444729, 0.5137255, 1, 0, 1,
-0.6555965, -1.397657, -3.272938, 0.5058824, 1, 0, 1,
-0.6530211, -1.030766, -3.269565, 0.5019608, 1, 0, 1,
-0.6520935, -0.8229135, -4.247558, 0.4941176, 1, 0, 1,
-0.6499602, -0.5275533, -3.692718, 0.4862745, 1, 0, 1,
-0.6494102, -1.134677, -2.177122, 0.4823529, 1, 0, 1,
-0.6442456, -0.6135061, -2.541716, 0.4745098, 1, 0, 1,
-0.6432859, 0.8851455, -0.9642572, 0.4705882, 1, 0, 1,
-0.6370087, 0.6028547, -0.09677215, 0.4627451, 1, 0, 1,
-0.6359746, -0.0148872, -3.104322, 0.4588235, 1, 0, 1,
-0.6321915, 0.9711057, -0.731025, 0.4509804, 1, 0, 1,
-0.6295131, -0.2026732, -1.584321, 0.4470588, 1, 0, 1,
-0.6255735, -0.8508044, -1.924354, 0.4392157, 1, 0, 1,
-0.624798, -0.04636254, -1.842243, 0.4352941, 1, 0, 1,
-0.6190972, -0.03013767, -3.702681, 0.427451, 1, 0, 1,
-0.6170096, 1.602618, 0.03546721, 0.4235294, 1, 0, 1,
-0.6158422, -0.6656132, -2.443192, 0.4156863, 1, 0, 1,
-0.6146889, 0.6309215, 0.5829101, 0.4117647, 1, 0, 1,
-0.6129878, 0.4143341, -2.354994, 0.4039216, 1, 0, 1,
-0.6120844, -0.2626768, -1.985586, 0.3960784, 1, 0, 1,
-0.6104745, 1.629821, 0.0393943, 0.3921569, 1, 0, 1,
-0.6097283, 0.8797342, -0.06017365, 0.3843137, 1, 0, 1,
-0.608659, -0.2651426, -0.4214732, 0.3803922, 1, 0, 1,
-0.6051643, -0.5257414, -2.599989, 0.372549, 1, 0, 1,
-0.6047856, -0.1044018, -3.03456, 0.3686275, 1, 0, 1,
-0.6009334, 1.486583, -1.834702, 0.3607843, 1, 0, 1,
-0.5997633, -0.4559592, -4.544697, 0.3568628, 1, 0, 1,
-0.5991004, 1.333178, 0.5584585, 0.3490196, 1, 0, 1,
-0.594551, -1.422304, -1.517636, 0.345098, 1, 0, 1,
-0.591771, -0.05547956, -1.960859, 0.3372549, 1, 0, 1,
-0.5891787, -1.600071, -2.634511, 0.3333333, 1, 0, 1,
-0.5794882, -0.4846738, -2.237683, 0.3254902, 1, 0, 1,
-0.5783333, -1.410477, -2.522384, 0.3215686, 1, 0, 1,
-0.5731213, -1.769935, -2.472381, 0.3137255, 1, 0, 1,
-0.5694662, 0.04810711, -1.465861, 0.3098039, 1, 0, 1,
-0.5675007, 1.641255, -0.6124114, 0.3019608, 1, 0, 1,
-0.5619255, -0.09590223, -3.570525, 0.2941177, 1, 0, 1,
-0.5601683, -1.412348, -3.479851, 0.2901961, 1, 0, 1,
-0.5601391, -1.634921, -2.446501, 0.282353, 1, 0, 1,
-0.5601391, -1.404836, -1.827826, 0.2784314, 1, 0, 1,
-0.5593918, -0.03372442, -0.1015272, 0.2705882, 1, 0, 1,
-0.5560938, 0.2587579, 0.6543704, 0.2666667, 1, 0, 1,
-0.5545, -1.56687, -3.213345, 0.2588235, 1, 0, 1,
-0.5501564, 0.6141354, 0.2353523, 0.254902, 1, 0, 1,
-0.548429, 0.1992174, -2.577223, 0.2470588, 1, 0, 1,
-0.548171, 0.01187697, -0.1288791, 0.2431373, 1, 0, 1,
-0.5449623, -1.758788, -3.450467, 0.2352941, 1, 0, 1,
-0.5445512, 0.02996196, 0.08064749, 0.2313726, 1, 0, 1,
-0.5440097, -0.5183877, -3.979349, 0.2235294, 1, 0, 1,
-0.5419065, -0.282053, -2.399713, 0.2196078, 1, 0, 1,
-0.540199, 0.3219881, 0.2818336, 0.2117647, 1, 0, 1,
-0.5353966, -0.6064258, -0.851485, 0.2078431, 1, 0, 1,
-0.5328711, 0.2363914, -0.8291079, 0.2, 1, 0, 1,
-0.5326477, 0.7810478, -1.804896, 0.1921569, 1, 0, 1,
-0.5305724, 0.5288121, -0.6929388, 0.1882353, 1, 0, 1,
-0.529993, -0.2496318, -1.858112, 0.1803922, 1, 0, 1,
-0.5256104, 1.181749, -0.7888492, 0.1764706, 1, 0, 1,
-0.5240498, -1.802933, -2.081716, 0.1686275, 1, 0, 1,
-0.5236958, 0.3538955, -0.3314244, 0.1647059, 1, 0, 1,
-0.5202686, 0.06984406, 0.1072761, 0.1568628, 1, 0, 1,
-0.519987, 0.1541097, -1.743428, 0.1529412, 1, 0, 1,
-0.5186769, 1.590733, 1.430238, 0.145098, 1, 0, 1,
-0.5184095, -0.7105008, -3.853322, 0.1411765, 1, 0, 1,
-0.5165229, -0.7402362, -2.765787, 0.1333333, 1, 0, 1,
-0.5137901, 0.2377869, -1.653538, 0.1294118, 1, 0, 1,
-0.51046, -1.407242, -2.470641, 0.1215686, 1, 0, 1,
-0.5099395, 1.661032, -0.7245664, 0.1176471, 1, 0, 1,
-0.5096151, -0.682314, -3.232403, 0.1098039, 1, 0, 1,
-0.5092302, -0.7638479, -3.180728, 0.1058824, 1, 0, 1,
-0.5090587, 1.56238, 0.8177392, 0.09803922, 1, 0, 1,
-0.507461, -0.8956369, -1.263666, 0.09019608, 1, 0, 1,
-0.5039073, -0.3102051, -2.039844, 0.08627451, 1, 0, 1,
-0.502342, -0.6586832, -2.3429, 0.07843138, 1, 0, 1,
-0.4991227, 0.4361208, -1.130245, 0.07450981, 1, 0, 1,
-0.4966235, 1.529811, 0.2390529, 0.06666667, 1, 0, 1,
-0.4939863, -0.1427336, -1.078529, 0.0627451, 1, 0, 1,
-0.4899732, 0.2590244, -0.8488793, 0.05490196, 1, 0, 1,
-0.4898747, 0.08482854, -0.9897485, 0.05098039, 1, 0, 1,
-0.4866437, 1.187501, -0.3642902, 0.04313726, 1, 0, 1,
-0.4863034, 0.1669071, -1.444487, 0.03921569, 1, 0, 1,
-0.4815705, -1.704146, -2.941617, 0.03137255, 1, 0, 1,
-0.4808839, 0.3415442, -0.417528, 0.02745098, 1, 0, 1,
-0.4808606, 0.879371, -0.4854883, 0.01960784, 1, 0, 1,
-0.4807693, -0.1790589, -1.831008, 0.01568628, 1, 0, 1,
-0.4758723, -1.136772, -3.111996, 0.007843138, 1, 0, 1,
-0.4686704, 1.811171, 0.07979413, 0.003921569, 1, 0, 1,
-0.4659491, 0.3315529, -1.840297, 0, 1, 0.003921569, 1,
-0.4649398, -0.2266509, -2.192728, 0, 1, 0.01176471, 1,
-0.463709, 1.78935, -0.2055065, 0, 1, 0.01568628, 1,
-0.4615417, 0.9865251, -0.150026, 0, 1, 0.02352941, 1,
-0.4609278, 2.249624, -0.4009653, 0, 1, 0.02745098, 1,
-0.4608746, -0.4190575, -2.264347, 0, 1, 0.03529412, 1,
-0.4593331, 0.4693726, -1.716171, 0, 1, 0.03921569, 1,
-0.4589651, 0.6138645, -1.878231, 0, 1, 0.04705882, 1,
-0.4556567, 0.6118516, -0.7023438, 0, 1, 0.05098039, 1,
-0.4555154, -0.1005849, -0.9920904, 0, 1, 0.05882353, 1,
-0.4443361, -0.4342493, -3.229558, 0, 1, 0.0627451, 1,
-0.443642, 0.1590997, 0.8928415, 0, 1, 0.07058824, 1,
-0.4425139, -0.6189387, -3.531402, 0, 1, 0.07450981, 1,
-0.4409297, -1.531009, -2.705062, 0, 1, 0.08235294, 1,
-0.4384978, 1.801912, 0.5804733, 0, 1, 0.08627451, 1,
-0.4358345, -1.215773, -2.47623, 0, 1, 0.09411765, 1,
-0.4321005, 1.591784, -1.147632, 0, 1, 0.1019608, 1,
-0.4315204, 0.2514028, -0.7761999, 0, 1, 0.1058824, 1,
-0.428574, -0.07018294, -0.3336642, 0, 1, 0.1137255, 1,
-0.4220444, 0.05800803, 0.2080785, 0, 1, 0.1176471, 1,
-0.4161189, -0.6506688, -2.955011, 0, 1, 0.1254902, 1,
-0.4155529, 0.3069925, -0.6886372, 0, 1, 0.1294118, 1,
-0.4114274, -0.3285896, -4.609179, 0, 1, 0.1372549, 1,
-0.4074394, 0.6541553, 0.2557001, 0, 1, 0.1411765, 1,
-0.4064003, 1.60538, 1.428191, 0, 1, 0.1490196, 1,
-0.4053225, 0.1401227, 0.4436615, 0, 1, 0.1529412, 1,
-0.3998585, 0.5901219, -2.117281, 0, 1, 0.1607843, 1,
-0.3994702, 1.054021, -0.2540486, 0, 1, 0.1647059, 1,
-0.399042, 0.9971071, -0.09964553, 0, 1, 0.172549, 1,
-0.3961045, 1.844907, -0.2342012, 0, 1, 0.1764706, 1,
-0.395612, -1.543226, -4.126999, 0, 1, 0.1843137, 1,
-0.394278, -0.130006, -1.417771, 0, 1, 0.1882353, 1,
-0.3939779, 2.074179, -1.465546, 0, 1, 0.1960784, 1,
-0.3928197, 1.327001, -0.9152508, 0, 1, 0.2039216, 1,
-0.3925816, -0.7883804, -3.026011, 0, 1, 0.2078431, 1,
-0.3920433, 0.376489, 0.7991793, 0, 1, 0.2156863, 1,
-0.387412, 0.2135914, -1.250878, 0, 1, 0.2196078, 1,
-0.3847838, -0.02482026, -0.7464321, 0, 1, 0.227451, 1,
-0.3788073, -0.9198793, -2.744322, 0, 1, 0.2313726, 1,
-0.3732316, -1.284728, -2.270299, 0, 1, 0.2392157, 1,
-0.3731428, -1.626998, -3.02548, 0, 1, 0.2431373, 1,
-0.3677132, -0.280362, -3.215942, 0, 1, 0.2509804, 1,
-0.3669711, 0.6257234, -1.534078, 0, 1, 0.254902, 1,
-0.3646414, -1.005679, -3.65799, 0, 1, 0.2627451, 1,
-0.3617024, -0.8122435, -2.620389, 0, 1, 0.2666667, 1,
-0.3485879, 0.4500095, 0.003022619, 0, 1, 0.2745098, 1,
-0.3468334, -0.4054303, -1.468735, 0, 1, 0.2784314, 1,
-0.3467645, -0.9434888, -4.955229, 0, 1, 0.2862745, 1,
-0.3426619, -0.1929034, -2.004051, 0, 1, 0.2901961, 1,
-0.34041, -0.792765, -3.662638, 0, 1, 0.2980392, 1,
-0.3320836, 0.4221023, -1.176309, 0, 1, 0.3058824, 1,
-0.3298429, -1.756431, -2.73595, 0, 1, 0.3098039, 1,
-0.3282422, 0.3431499, -1.130482, 0, 1, 0.3176471, 1,
-0.3242726, -0.4109721, -1.430143, 0, 1, 0.3215686, 1,
-0.323805, 0.2187126, -1.050511, 0, 1, 0.3294118, 1,
-0.3148529, -1.550174, -2.347066, 0, 1, 0.3333333, 1,
-0.3133698, -1.216634, -1.419171, 0, 1, 0.3411765, 1,
-0.3132681, -0.7426884, -1.888474, 0, 1, 0.345098, 1,
-0.3128001, 0.9262305, -0.1056623, 0, 1, 0.3529412, 1,
-0.3103301, 0.5165167, -2.289965, 0, 1, 0.3568628, 1,
-0.3087501, 0.01369218, -1.607831, 0, 1, 0.3647059, 1,
-0.3062215, -1.406375, -2.199353, 0, 1, 0.3686275, 1,
-0.3027912, -0.1806909, -2.041424, 0, 1, 0.3764706, 1,
-0.3014367, 0.7819712, -0.9924425, 0, 1, 0.3803922, 1,
-0.3004875, -0.6521257, -0.2880824, 0, 1, 0.3882353, 1,
-0.2996247, 1.4793, 0.5134438, 0, 1, 0.3921569, 1,
-0.2921763, -0.6122309, -2.229519, 0, 1, 0.4, 1,
-0.2883849, -0.4266738, -2.338962, 0, 1, 0.4078431, 1,
-0.2876595, -1.976172, -2.425704, 0, 1, 0.4117647, 1,
-0.2829365, -0.8466213, -3.89075, 0, 1, 0.4196078, 1,
-0.2786868, 0.4281359, -0.3892568, 0, 1, 0.4235294, 1,
-0.2732883, -0.5462426, -2.642604, 0, 1, 0.4313726, 1,
-0.2717218, 0.3092341, 0.01328396, 0, 1, 0.4352941, 1,
-0.2694699, 0.1926724, -2.402481, 0, 1, 0.4431373, 1,
-0.2681426, -0.1232525, -2.17446, 0, 1, 0.4470588, 1,
-0.2669185, 1.405852, -0.9540455, 0, 1, 0.454902, 1,
-0.2645649, 1.042626, -0.3801634, 0, 1, 0.4588235, 1,
-0.2643691, -0.007951339, 0.3958954, 0, 1, 0.4666667, 1,
-0.2634836, -0.4316781, -2.754497, 0, 1, 0.4705882, 1,
-0.2582558, -0.1700361, -2.524142, 0, 1, 0.4784314, 1,
-0.2550841, -0.374623, -2.417003, 0, 1, 0.4823529, 1,
-0.2481971, -0.9043539, -2.874893, 0, 1, 0.4901961, 1,
-0.247937, 1.316377, -0.1616703, 0, 1, 0.4941176, 1,
-0.246338, 2.231372, -0.8810894, 0, 1, 0.5019608, 1,
-0.2446565, -0.9258265, -1.984463, 0, 1, 0.509804, 1,
-0.2413237, 0.9412025, -0.8266269, 0, 1, 0.5137255, 1,
-0.2365787, -1.744236, -4.182586, 0, 1, 0.5215687, 1,
-0.2345793, 1.179036, -0.7630261, 0, 1, 0.5254902, 1,
-0.2333176, -0.105886, -3.022639, 0, 1, 0.5333334, 1,
-0.2326173, -0.3860698, -0.7041611, 0, 1, 0.5372549, 1,
-0.2287253, -0.1812364, -1.746159, 0, 1, 0.5450981, 1,
-0.2278161, -1.108168, -3.530854, 0, 1, 0.5490196, 1,
-0.2155955, 0.6600118, -1.733867, 0, 1, 0.5568628, 1,
-0.2140198, -1.521541, -4.257805, 0, 1, 0.5607843, 1,
-0.2101255, -1.069706, -3.628595, 0, 1, 0.5686275, 1,
-0.2097765, 0.8960701, -0.4172795, 0, 1, 0.572549, 1,
-0.2050598, 0.9493076, 0.6431375, 0, 1, 0.5803922, 1,
-0.2028081, -1.114694, -3.093032, 0, 1, 0.5843138, 1,
-0.2018396, -0.3332195, -1.606399, 0, 1, 0.5921569, 1,
-0.2009725, -0.1392002, -2.159873, 0, 1, 0.5960785, 1,
-0.1961967, -0.05420295, -4.199816, 0, 1, 0.6039216, 1,
-0.1942331, 2.005612, -0.05851201, 0, 1, 0.6117647, 1,
-0.1942267, 0.2978759, 0.2092609, 0, 1, 0.6156863, 1,
-0.1892484, -0.3986277, -2.499527, 0, 1, 0.6235294, 1,
-0.1875589, 0.4143834, -0.5965335, 0, 1, 0.627451, 1,
-0.1869133, -0.6082287, -3.586575, 0, 1, 0.6352941, 1,
-0.1842241, 1.953287, -0.2036288, 0, 1, 0.6392157, 1,
-0.1837217, -0.4788362, -2.084399, 0, 1, 0.6470588, 1,
-0.1829361, 0.8949766, 0.2762538, 0, 1, 0.6509804, 1,
-0.1828184, 0.6178071, -0.03474685, 0, 1, 0.6588235, 1,
-0.1822472, -1.358839, -1.855689, 0, 1, 0.6627451, 1,
-0.1822359, 0.6822758, -2.091907, 0, 1, 0.6705883, 1,
-0.1816844, -1.179334, -2.466987, 0, 1, 0.6745098, 1,
-0.1769847, 0.6534768, -1.265001, 0, 1, 0.682353, 1,
-0.1763911, -0.2008954, -1.960843, 0, 1, 0.6862745, 1,
-0.1741458, 0.4990281, -1.153347, 0, 1, 0.6941177, 1,
-0.1683012, -0.4634786, -2.509374, 0, 1, 0.7019608, 1,
-0.1633719, -1.493387, -3.178153, 0, 1, 0.7058824, 1,
-0.1496849, 1.244611, -0.5714154, 0, 1, 0.7137255, 1,
-0.1470828, 0.977208, 1.339999, 0, 1, 0.7176471, 1,
-0.1465981, 2.509508, -0.4528856, 0, 1, 0.7254902, 1,
-0.1456502, 0.9120187, 1.674812, 0, 1, 0.7294118, 1,
-0.1452385, -0.2665102, -2.549709, 0, 1, 0.7372549, 1,
-0.1375444, -0.6143669, -3.697703, 0, 1, 0.7411765, 1,
-0.1324518, 0.08463294, -0.3089706, 0, 1, 0.7490196, 1,
-0.1314067, 1.368671, -0.1401914, 0, 1, 0.7529412, 1,
-0.1303962, -0.2842613, -2.973788, 0, 1, 0.7607843, 1,
-0.1294575, -0.1585748, -1.865772, 0, 1, 0.7647059, 1,
-0.1269898, -0.4059776, -2.992478, 0, 1, 0.772549, 1,
-0.122237, 0.07871375, -1.357247, 0, 1, 0.7764706, 1,
-0.1161857, 0.7334596, 0.1530121, 0, 1, 0.7843137, 1,
-0.1149051, -0.8057031, -4.701001, 0, 1, 0.7882353, 1,
-0.1075573, 1.221951, 0.07263412, 0, 1, 0.7960784, 1,
-0.1070364, -0.4107599, -2.800592, 0, 1, 0.8039216, 1,
-0.1064758, 2.326158, -0.4878439, 0, 1, 0.8078431, 1,
-0.1047358, -0.5653966, -2.851645, 0, 1, 0.8156863, 1,
-0.09914025, 1.217965, 0.5521976, 0, 1, 0.8196079, 1,
-0.09855253, 0.6763961, -0.559849, 0, 1, 0.827451, 1,
-0.09258885, 0.07462295, -0.2713355, 0, 1, 0.8313726, 1,
-0.09045233, -0.4472128, -2.830822, 0, 1, 0.8392157, 1,
-0.08432654, -0.1879984, -1.461806, 0, 1, 0.8431373, 1,
-0.08334343, 0.7713544, -0.0192051, 0, 1, 0.8509804, 1,
-0.07818095, -0.0531204, -1.97087, 0, 1, 0.854902, 1,
-0.0780246, 0.5673704, -1.46977, 0, 1, 0.8627451, 1,
-0.07601221, 0.3808812, -0.6335998, 0, 1, 0.8666667, 1,
-0.07372483, 1.269073, -0.0002783427, 0, 1, 0.8745098, 1,
-0.06283865, -0.7056872, -4.941236, 0, 1, 0.8784314, 1,
-0.06175109, -0.4654971, -3.788323, 0, 1, 0.8862745, 1,
-0.05758671, -1.892165, -3.039537, 0, 1, 0.8901961, 1,
-0.0574293, -0.3248779, -4.034673, 0, 1, 0.8980392, 1,
-0.05627863, 1.158233, -2.584541, 0, 1, 0.9058824, 1,
-0.05625306, -1.6813, -1.737873, 0, 1, 0.9098039, 1,
-0.05282012, 0.2842114, -0.6886131, 0, 1, 0.9176471, 1,
-0.05090775, -0.2770218, -3.005027, 0, 1, 0.9215686, 1,
-0.04775135, 0.4866984, -1.048345, 0, 1, 0.9294118, 1,
-0.04771319, -0.3682436, -4.573086, 0, 1, 0.9333333, 1,
-0.04267545, 0.1376909, 0.2550181, 0, 1, 0.9411765, 1,
-0.03492592, 1.637262, -0.3112231, 0, 1, 0.945098, 1,
-0.03420978, -0.8966686, -3.942301, 0, 1, 0.9529412, 1,
-0.03401008, -0.2244968, -2.119508, 0, 1, 0.9568627, 1,
-0.03107502, 0.04175695, -1.229622, 0, 1, 0.9647059, 1,
-0.02858553, -1.084624, -2.602948, 0, 1, 0.9686275, 1,
-0.02844037, 0.0267444, -0.1502766, 0, 1, 0.9764706, 1,
-0.02749764, 0.1368295, -2.255152, 0, 1, 0.9803922, 1,
-0.02472023, 0.3522319, -1.803543, 0, 1, 0.9882353, 1,
-0.01873635, 0.7909984, 0.04652581, 0, 1, 0.9921569, 1,
-0.01699154, 0.4066865, 0.8715048, 0, 1, 1, 1,
-0.01374426, -0.05721157, -2.342714, 0, 0.9921569, 1, 1,
-0.01358972, -0.9155231, -4.026207, 0, 0.9882353, 1, 1,
-0.01288072, -0.5142999, -3.296815, 0, 0.9803922, 1, 1,
-0.01017135, -1.343978, -1.747812, 0, 0.9764706, 1, 1,
-0.009398083, -0.1194455, -2.655452, 0, 0.9686275, 1, 1,
-0.008473068, -2.028921, -3.016363, 0, 0.9647059, 1, 1,
-0.008224036, 0.6802582, -0.7664939, 0, 0.9568627, 1, 1,
-0.007591717, 0.7420678, -0.2834743, 0, 0.9529412, 1, 1,
-0.003830836, 1.473057, 0.2573527, 0, 0.945098, 1, 1,
-0.002449243, 0.485526, 1.287899, 0, 0.9411765, 1, 1,
-0.00100864, 1.081892, -0.6043092, 0, 0.9333333, 1, 1,
0.002562833, 0.1575669, -0.6363392, 0, 0.9294118, 1, 1,
0.008344874, 0.3919668, 0.3189133, 0, 0.9215686, 1, 1,
0.01167357, -0.8897666, 3.915278, 0, 0.9176471, 1, 1,
0.01172053, -0.2900446, 3.209916, 0, 0.9098039, 1, 1,
0.01211679, 0.7389599, 0.1926351, 0, 0.9058824, 1, 1,
0.01607593, 1.029295, 1.146744, 0, 0.8980392, 1, 1,
0.0226166, 1.414025, 2.773574, 0, 0.8901961, 1, 1,
0.02379088, -0.2577997, 3.401915, 0, 0.8862745, 1, 1,
0.02742951, -1.197089, 3.503048, 0, 0.8784314, 1, 1,
0.02902523, 2.252661, 1.617045, 0, 0.8745098, 1, 1,
0.02943666, 0.3065662, -1.458896, 0, 0.8666667, 1, 1,
0.03446779, -0.4124471, 2.273579, 0, 0.8627451, 1, 1,
0.03502323, 0.3575784, 0.1738172, 0, 0.854902, 1, 1,
0.03969995, -0.01757853, 2.809941, 0, 0.8509804, 1, 1,
0.04008771, 0.003720984, 1.284228, 0, 0.8431373, 1, 1,
0.04488078, -0.007873595, 1.396377, 0, 0.8392157, 1, 1,
0.04578993, -0.6680139, 2.933244, 0, 0.8313726, 1, 1,
0.04676468, -0.9699083, 2.79912, 0, 0.827451, 1, 1,
0.0467971, -0.4386007, 3.594677, 0, 0.8196079, 1, 1,
0.05369748, -0.1060069, 3.946963, 0, 0.8156863, 1, 1,
0.06863334, 0.8727182, 0.1985209, 0, 0.8078431, 1, 1,
0.07285051, -0.1438038, 2.614946, 0, 0.8039216, 1, 1,
0.07325988, -0.522451, 2.040461, 0, 0.7960784, 1, 1,
0.0744824, 0.9139268, -0.1690578, 0, 0.7882353, 1, 1,
0.07486726, 0.4440273, -0.3674891, 0, 0.7843137, 1, 1,
0.07609405, -2.797555, 4.602198, 0, 0.7764706, 1, 1,
0.08236312, 2.033115, -0.3314882, 0, 0.772549, 1, 1,
0.08834581, 0.6069003, 0.08763086, 0, 0.7647059, 1, 1,
0.08854728, -1.446794, 3.319876, 0, 0.7607843, 1, 1,
0.08966278, 1.550669, 1.437014, 0, 0.7529412, 1, 1,
0.09026907, 1.084269, 1.834765, 0, 0.7490196, 1, 1,
0.09033231, 0.04259398, 1.307976, 0, 0.7411765, 1, 1,
0.09044824, -0.01518408, 2.147971, 0, 0.7372549, 1, 1,
0.1009096, 1.693905, 0.9115245, 0, 0.7294118, 1, 1,
0.1023715, 0.7589025, -0.520651, 0, 0.7254902, 1, 1,
0.1055215, -1.180645, 2.540692, 0, 0.7176471, 1, 1,
0.1059991, 0.2045287, 1.535635, 0, 0.7137255, 1, 1,
0.1069249, 0.838513, -0.5606119, 0, 0.7058824, 1, 1,
0.1077253, -1.219568, 2.752701, 0, 0.6980392, 1, 1,
0.1097597, -0.1666041, 1.59036, 0, 0.6941177, 1, 1,
0.1113932, 0.4146024, 0.3077391, 0, 0.6862745, 1, 1,
0.1127575, 1.197439, 2.864301, 0, 0.682353, 1, 1,
0.1197597, 0.08677205, 0.4567192, 0, 0.6745098, 1, 1,
0.1203524, 1.107476, -0.1069693, 0, 0.6705883, 1, 1,
0.1228609, 0.6646333, 0.4083171, 0, 0.6627451, 1, 1,
0.1279463, 0.5865112, -0.1117517, 0, 0.6588235, 1, 1,
0.1316277, -0.7367541, 2.988524, 0, 0.6509804, 1, 1,
0.1355642, -0.8194438, 4.380059, 0, 0.6470588, 1, 1,
0.1379712, -0.5964097, 4.501281, 0, 0.6392157, 1, 1,
0.1393048, -0.006583977, 2.003993, 0, 0.6352941, 1, 1,
0.1431617, 0.426863, -0.9764515, 0, 0.627451, 1, 1,
0.1436499, 0.3676129, 0.7406224, 0, 0.6235294, 1, 1,
0.1474498, 0.3458416, 1.838916, 0, 0.6156863, 1, 1,
0.1476381, -1.048303, 2.133954, 0, 0.6117647, 1, 1,
0.149073, -0.1487535, 4.9279, 0, 0.6039216, 1, 1,
0.1496236, -0.8618341, 3.740059, 0, 0.5960785, 1, 1,
0.1518852, -0.2391778, 1.936689, 0, 0.5921569, 1, 1,
0.1523043, -0.2390408, 1.672039, 0, 0.5843138, 1, 1,
0.152749, 0.8609146, -0.02445504, 0, 0.5803922, 1, 1,
0.1573396, 0.3535828, -0.4687741, 0, 0.572549, 1, 1,
0.1575698, -2.302646, 3.65568, 0, 0.5686275, 1, 1,
0.1591279, 0.3286951, 0.2757003, 0, 0.5607843, 1, 1,
0.1595252, 1.639007, 0.2819785, 0, 0.5568628, 1, 1,
0.160035, -0.3575034, 3.822256, 0, 0.5490196, 1, 1,
0.1611883, -0.8001958, 2.554516, 0, 0.5450981, 1, 1,
0.1652856, 0.1493758, -0.3856798, 0, 0.5372549, 1, 1,
0.1727458, 0.1525093, 1.554253, 0, 0.5333334, 1, 1,
0.173051, 1.92947, 1.134028, 0, 0.5254902, 1, 1,
0.1739981, 2.646167, 1.831894, 0, 0.5215687, 1, 1,
0.1745499, -1.04369, 1.652724, 0, 0.5137255, 1, 1,
0.1779954, -1.194802, 2.338786, 0, 0.509804, 1, 1,
0.1783126, 0.455833, 1.144858, 0, 0.5019608, 1, 1,
0.1801534, -0.1218816, 2.348593, 0, 0.4941176, 1, 1,
0.1806797, -1.297493, 3.862074, 0, 0.4901961, 1, 1,
0.1902603, 1.917141, -0.1897763, 0, 0.4823529, 1, 1,
0.1962274, 0.4962189, 0.07999532, 0, 0.4784314, 1, 1,
0.1998788, -1.00344, 3.064906, 0, 0.4705882, 1, 1,
0.2022026, 0.2183925, 0.2754813, 0, 0.4666667, 1, 1,
0.2032323, -1.166843, 2.503429, 0, 0.4588235, 1, 1,
0.2033738, -0.4726287, 2.573797, 0, 0.454902, 1, 1,
0.2162955, 0.8462219, -0.4036373, 0, 0.4470588, 1, 1,
0.2173048, 0.3060023, -0.354759, 0, 0.4431373, 1, 1,
0.2217107, 0.4479202, -0.4856603, 0, 0.4352941, 1, 1,
0.2223788, -0.9213227, 3.244648, 0, 0.4313726, 1, 1,
0.2237939, 0.4065584, 1.713507, 0, 0.4235294, 1, 1,
0.2273584, 0.8783581, 0.947539, 0, 0.4196078, 1, 1,
0.2308912, -0.4737043, 3.01948, 0, 0.4117647, 1, 1,
0.2315802, 0.4275916, 0.6048061, 0, 0.4078431, 1, 1,
0.2323878, 0.6669289, 0.9262093, 0, 0.4, 1, 1,
0.2376116, -1.327891, 4.505863, 0, 0.3921569, 1, 1,
0.240331, -0.9141851, 1.515002, 0, 0.3882353, 1, 1,
0.2496096, 1.549731, 1.561072, 0, 0.3803922, 1, 1,
0.2506016, -0.8492912, 3.500269, 0, 0.3764706, 1, 1,
0.2530411, 1.106849, 0.951718, 0, 0.3686275, 1, 1,
0.2535017, -0.9748789, 4.012634, 0, 0.3647059, 1, 1,
0.2553495, 0.1203764, 3.071096, 0, 0.3568628, 1, 1,
0.2559147, 1.23607, 0.9139568, 0, 0.3529412, 1, 1,
0.2572987, 0.7750172, 1.859573, 0, 0.345098, 1, 1,
0.259592, 0.1501475, -0.02080223, 0, 0.3411765, 1, 1,
0.2611297, 2.35251, 0.330785, 0, 0.3333333, 1, 1,
0.2650224, -2.042073, 2.643751, 0, 0.3294118, 1, 1,
0.2684155, 1.793739, -0.2828814, 0, 0.3215686, 1, 1,
0.2703997, -0.8561959, 3.836551, 0, 0.3176471, 1, 1,
0.2717126, 0.542625, 1.300403, 0, 0.3098039, 1, 1,
0.2762783, -0.001114102, 2.465673, 0, 0.3058824, 1, 1,
0.2808327, 1.294096, 0.9735745, 0, 0.2980392, 1, 1,
0.281867, 0.2814498, -0.7317542, 0, 0.2901961, 1, 1,
0.2850844, 0.8678071, -1.609192, 0, 0.2862745, 1, 1,
0.2855258, 0.5090176, 0.2479347, 0, 0.2784314, 1, 1,
0.2968554, 0.9722716, -0.6025046, 0, 0.2745098, 1, 1,
0.2970994, 0.8524833, -0.3561346, 0, 0.2666667, 1, 1,
0.2987694, -1.314438, 4.075614, 0, 0.2627451, 1, 1,
0.3014749, -0.5540803, 2.876427, 0, 0.254902, 1, 1,
0.3028655, 0.1141892, 1.867123, 0, 0.2509804, 1, 1,
0.3040663, 0.7815914, 1.416619, 0, 0.2431373, 1, 1,
0.3049341, 1.896909, 0.2615402, 0, 0.2392157, 1, 1,
0.3094126, -2.331255, 2.38318, 0, 0.2313726, 1, 1,
0.3095101, -0.2059711, 3.036846, 0, 0.227451, 1, 1,
0.3188582, 0.06393686, 0.8055727, 0, 0.2196078, 1, 1,
0.3239844, 0.9977208, 0.5423435, 0, 0.2156863, 1, 1,
0.3249631, 0.6651704, 0.3205633, 0, 0.2078431, 1, 1,
0.3265808, -2.121025, 1.756189, 0, 0.2039216, 1, 1,
0.3279042, 1.074999, 2.293768, 0, 0.1960784, 1, 1,
0.331586, -1.031601, 2.821697, 0, 0.1882353, 1, 1,
0.3338125, -0.7734959, 2.820618, 0, 0.1843137, 1, 1,
0.3340762, -0.3955342, 1.341316, 0, 0.1764706, 1, 1,
0.3362847, -0.4126011, 0.1628021, 0, 0.172549, 1, 1,
0.337019, -0.1318308, 1.178956, 0, 0.1647059, 1, 1,
0.3387432, 0.4868389, 1.319231, 0, 0.1607843, 1, 1,
0.3561256, -0.4405033, 1.958039, 0, 0.1529412, 1, 1,
0.356133, 0.00432844, 0.6808321, 0, 0.1490196, 1, 1,
0.3571597, -0.9478751, 2.411445, 0, 0.1411765, 1, 1,
0.357905, 1.153529, -0.4965568, 0, 0.1372549, 1, 1,
0.3582815, 0.8613401, 0.1373309, 0, 0.1294118, 1, 1,
0.3587852, 0.1930037, 0.6664446, 0, 0.1254902, 1, 1,
0.3605815, -1.074096, 3.837953, 0, 0.1176471, 1, 1,
0.3612572, -0.6876029, 3.409111, 0, 0.1137255, 1, 1,
0.3614988, 1.949325, 0.4610682, 0, 0.1058824, 1, 1,
0.3617095, -1.874885, 2.885089, 0, 0.09803922, 1, 1,
0.3623965, 0.59431, 0.5659115, 0, 0.09411765, 1, 1,
0.3629434, -1.644664, 2.384706, 0, 0.08627451, 1, 1,
0.3634976, 1.446322, -0.5157181, 0, 0.08235294, 1, 1,
0.3701238, 0.122093, 0.3754627, 0, 0.07450981, 1, 1,
0.3712132, -0.8982911, 2.673388, 0, 0.07058824, 1, 1,
0.3715639, -1.937817, 1.730327, 0, 0.0627451, 1, 1,
0.3766166, 0.6599221, -1.04846, 0, 0.05882353, 1, 1,
0.3790364, -0.3508255, 2.37722, 0, 0.05098039, 1, 1,
0.37906, -0.4796449, 1.920879, 0, 0.04705882, 1, 1,
0.3836327, 1.606079, -0.602309, 0, 0.03921569, 1, 1,
0.3841691, -0.08810384, 2.951137, 0, 0.03529412, 1, 1,
0.3856024, -0.05566787, 1.334798, 0, 0.02745098, 1, 1,
0.388, -1.63792, 4.653409, 0, 0.02352941, 1, 1,
0.3894548, 0.9155973, -0.3067497, 0, 0.01568628, 1, 1,
0.3907619, -0.4306749, 1.894955, 0, 0.01176471, 1, 1,
0.3924947, -0.03243302, 2.370713, 0, 0.003921569, 1, 1,
0.393007, -0.3503243, 1.847927, 0.003921569, 0, 1, 1,
0.3934503, 1.430865, 1.051651, 0.007843138, 0, 1, 1,
0.3942719, -0.2425614, 3.655401, 0.01568628, 0, 1, 1,
0.3962392, -0.4021892, 2.227272, 0.01960784, 0, 1, 1,
0.3981377, -2.180129, 3.582336, 0.02745098, 0, 1, 1,
0.3988285, 0.06890871, 3.164102, 0.03137255, 0, 1, 1,
0.4046345, -0.2727213, 2.501258, 0.03921569, 0, 1, 1,
0.4118267, 0.7491845, 0.02435781, 0.04313726, 0, 1, 1,
0.4212826, 0.861738, -0.5965126, 0.05098039, 0, 1, 1,
0.4231274, 0.3456144, -0.6521731, 0.05490196, 0, 1, 1,
0.424311, 0.6194942, -0.06853329, 0.0627451, 0, 1, 1,
0.4311574, 2.197064, -1.686912, 0.06666667, 0, 1, 1,
0.4321334, 0.7430975, -1.781586, 0.07450981, 0, 1, 1,
0.4342567, -0.1987825, 0.7047479, 0.07843138, 0, 1, 1,
0.4408627, -0.2588631, 1.498619, 0.08627451, 0, 1, 1,
0.4413619, 0.6043253, 1.742901, 0.09019608, 0, 1, 1,
0.4437357, -1.198596, 2.551584, 0.09803922, 0, 1, 1,
0.4455388, 0.9171956, -0.6899956, 0.1058824, 0, 1, 1,
0.4473596, 0.356482, 0.9562895, 0.1098039, 0, 1, 1,
0.4502245, -0.3475231, 1.164407, 0.1176471, 0, 1, 1,
0.4514154, 0.5349486, 0.2697648, 0.1215686, 0, 1, 1,
0.4625883, -0.05702193, 2.351852, 0.1294118, 0, 1, 1,
0.4644569, -2.860787, 4.776931, 0.1333333, 0, 1, 1,
0.4666024, 0.7284207, 1.035176, 0.1411765, 0, 1, 1,
0.4671516, 1.273823, -0.1076599, 0.145098, 0, 1, 1,
0.4693938, -0.555509, 3.01182, 0.1529412, 0, 1, 1,
0.4714428, -0.3839022, 0.9000638, 0.1568628, 0, 1, 1,
0.4765517, 0.2299608, 1.695315, 0.1647059, 0, 1, 1,
0.4774378, 1.603948, 0.4812059, 0.1686275, 0, 1, 1,
0.4779471, -0.2025892, 1.65335, 0.1764706, 0, 1, 1,
0.4790755, 0.2060131, 1.02761, 0.1803922, 0, 1, 1,
0.4791001, -2.461475, 1.594857, 0.1882353, 0, 1, 1,
0.4824919, -1.337472, 2.277278, 0.1921569, 0, 1, 1,
0.4830282, -0.4512863, 2.453271, 0.2, 0, 1, 1,
0.4841338, -1.853032, 3.984416, 0.2078431, 0, 1, 1,
0.4910577, 0.9150537, 1.550506, 0.2117647, 0, 1, 1,
0.4942144, -0.8404217, 5.118011, 0.2196078, 0, 1, 1,
0.4945457, 1.087791, 0.0935268, 0.2235294, 0, 1, 1,
0.4955762, -0.5296236, 2.876627, 0.2313726, 0, 1, 1,
0.4980571, 1.094194, 1.025605, 0.2352941, 0, 1, 1,
0.502618, 0.1613442, -0.8207374, 0.2431373, 0, 1, 1,
0.504943, -1.199035, 3.998428, 0.2470588, 0, 1, 1,
0.509322, 0.5889773, 1.330351, 0.254902, 0, 1, 1,
0.5118301, 0.2828072, 0.3643396, 0.2588235, 0, 1, 1,
0.5155734, -0.9677293, 2.415916, 0.2666667, 0, 1, 1,
0.516109, 1.714242, 0.5096315, 0.2705882, 0, 1, 1,
0.5213061, 1.587851, -0.5427154, 0.2784314, 0, 1, 1,
0.5213267, 1.584908, -1.179525, 0.282353, 0, 1, 1,
0.5246185, 0.5187756, 1.393121, 0.2901961, 0, 1, 1,
0.5259824, 0.1239349, 1.520922, 0.2941177, 0, 1, 1,
0.5261265, -1.534569, 3.137325, 0.3019608, 0, 1, 1,
0.5264829, 0.3844173, 1.245565, 0.3098039, 0, 1, 1,
0.5277019, -0.1387564, 2.417987, 0.3137255, 0, 1, 1,
0.5284041, -0.479326, 2.792326, 0.3215686, 0, 1, 1,
0.5309018, -0.04675369, 3.70686, 0.3254902, 0, 1, 1,
0.535506, 0.6218395, 0.7385545, 0.3333333, 0, 1, 1,
0.535749, 0.7591682, 0.2122002, 0.3372549, 0, 1, 1,
0.5373501, -0.6116247, 2.384663, 0.345098, 0, 1, 1,
0.5374042, 1.100374, 0.1029147, 0.3490196, 0, 1, 1,
0.5382104, -0.3574532, 2.70457, 0.3568628, 0, 1, 1,
0.5502213, -0.364252, 1.8473, 0.3607843, 0, 1, 1,
0.5643038, -0.4192493, 1.989809, 0.3686275, 0, 1, 1,
0.5653679, -0.3625471, 3.465315, 0.372549, 0, 1, 1,
0.5656338, -1.260304, 3.296197, 0.3803922, 0, 1, 1,
0.5658033, -0.9246243, 2.607323, 0.3843137, 0, 1, 1,
0.5687632, 1.685942, -0.007899386, 0.3921569, 0, 1, 1,
0.5700876, 0.7639541, 1.167067, 0.3960784, 0, 1, 1,
0.5707734, 1.290754, -0.5338219, 0.4039216, 0, 1, 1,
0.5720605, -0.4041636, 0.2255737, 0.4117647, 0, 1, 1,
0.5738102, 0.2707812, 0.5051969, 0.4156863, 0, 1, 1,
0.5742405, 1.17344, 1.533687, 0.4235294, 0, 1, 1,
0.5855953, 0.2688964, 1.16375, 0.427451, 0, 1, 1,
0.5891935, 0.4114915, -0.1953447, 0.4352941, 0, 1, 1,
0.5902403, 0.365999, 0.03981348, 0.4392157, 0, 1, 1,
0.5929638, 0.78086, 0.3474079, 0.4470588, 0, 1, 1,
0.594278, -0.7725093, 2.065923, 0.4509804, 0, 1, 1,
0.5959314, -0.1550485, 0.7941485, 0.4588235, 0, 1, 1,
0.599982, 0.126433, 0.6133282, 0.4627451, 0, 1, 1,
0.6019922, 0.09966999, 3.333551, 0.4705882, 0, 1, 1,
0.6024601, 0.5654711, 0.9225332, 0.4745098, 0, 1, 1,
0.6033813, -1.874164, 2.131784, 0.4823529, 0, 1, 1,
0.6073807, 0.7640041, -0.6012654, 0.4862745, 0, 1, 1,
0.6109764, -0.4925739, 1.471568, 0.4941176, 0, 1, 1,
0.6218354, 0.7894049, 0.4435723, 0.5019608, 0, 1, 1,
0.622235, -0.7685907, 1.15562, 0.5058824, 0, 1, 1,
0.6222873, -0.9343973, 1.94697, 0.5137255, 0, 1, 1,
0.6259447, -0.4908879, 1.596285, 0.5176471, 0, 1, 1,
0.6371334, -1.244598, 3.812605, 0.5254902, 0, 1, 1,
0.6386507, 0.3814374, -1.751115, 0.5294118, 0, 1, 1,
0.6420726, -1.748567, 2.318453, 0.5372549, 0, 1, 1,
0.6423955, -0.5802093, 1.513524, 0.5411765, 0, 1, 1,
0.6433846, -1.544661, 1.664889, 0.5490196, 0, 1, 1,
0.6441562, -0.8700796, 2.742461, 0.5529412, 0, 1, 1,
0.645097, 0.1894536, 0.2005945, 0.5607843, 0, 1, 1,
0.6516917, -1.358106, 4.641911, 0.5647059, 0, 1, 1,
0.6538123, -1.889111, 1.71624, 0.572549, 0, 1, 1,
0.6565135, 0.8494785, 0.3382958, 0.5764706, 0, 1, 1,
0.6613644, 0.007753836, 1.767625, 0.5843138, 0, 1, 1,
0.6720016, -1.204519, 1.615411, 0.5882353, 0, 1, 1,
0.6803206, 1.656715, -0.6842574, 0.5960785, 0, 1, 1,
0.6830903, 1.279716, 1.010542, 0.6039216, 0, 1, 1,
0.6854317, -0.4883128, 2.446303, 0.6078432, 0, 1, 1,
0.6926141, 0.1274776, 0.6443028, 0.6156863, 0, 1, 1,
0.6949397, -2.683555, 2.044149, 0.6196079, 0, 1, 1,
0.7038512, -1.69538, 4.422547, 0.627451, 0, 1, 1,
0.7066102, -1.406699, 1.349649, 0.6313726, 0, 1, 1,
0.7075685, -1.892089, 3.043137, 0.6392157, 0, 1, 1,
0.7108976, 2.218621, 1.711001, 0.6431373, 0, 1, 1,
0.7115713, -1.185745, 3.659864, 0.6509804, 0, 1, 1,
0.7128233, 0.3604218, 0.4036303, 0.654902, 0, 1, 1,
0.7139428, 0.8971372, 0.4803453, 0.6627451, 0, 1, 1,
0.714222, 0.5243321, 1.798337, 0.6666667, 0, 1, 1,
0.7200671, 0.8912751, 0.7869398, 0.6745098, 0, 1, 1,
0.7207131, -2.790647, 4.177826, 0.6784314, 0, 1, 1,
0.7233371, 0.2058689, 1.515921, 0.6862745, 0, 1, 1,
0.7319006, 1.140677, -0.2338685, 0.6901961, 0, 1, 1,
0.7506334, -0.03204066, 0.260958, 0.6980392, 0, 1, 1,
0.7561524, -1.042567, 3.296886, 0.7058824, 0, 1, 1,
0.7561882, -1.28455, 0.845898, 0.7098039, 0, 1, 1,
0.7627144, 1.250188, 1.259362, 0.7176471, 0, 1, 1,
0.7661553, -0.02446944, 1.53773, 0.7215686, 0, 1, 1,
0.7695628, 0.591683, 2.485187, 0.7294118, 0, 1, 1,
0.7700986, 1.227752, -0.07203677, 0.7333333, 0, 1, 1,
0.7715151, 1.3896, 0.03955866, 0.7411765, 0, 1, 1,
0.7809737, 0.1498291, 1.096892, 0.7450981, 0, 1, 1,
0.7839531, 0.6333998, 0.409208, 0.7529412, 0, 1, 1,
0.7881803, 0.02427096, 2.547939, 0.7568628, 0, 1, 1,
0.7913171, -0.01475901, 1.469179, 0.7647059, 0, 1, 1,
0.7944245, 0.3450887, 1.323411, 0.7686275, 0, 1, 1,
0.8039936, -1.647301, 2.901334, 0.7764706, 0, 1, 1,
0.8124372, -0.5454367, 2.654575, 0.7803922, 0, 1, 1,
0.8139271, -0.8034357, 3.577507, 0.7882353, 0, 1, 1,
0.8156975, 0.9830088, 1.081536, 0.7921569, 0, 1, 1,
0.8159621, -1.6359, 1.647494, 0.8, 0, 1, 1,
0.8170055, -0.5024217, 3.005051, 0.8078431, 0, 1, 1,
0.8189148, 0.9678406, 0.4976498, 0.8117647, 0, 1, 1,
0.823057, -0.04307973, 1.962885, 0.8196079, 0, 1, 1,
0.8270438, -0.8853443, 1.280067, 0.8235294, 0, 1, 1,
0.8294085, -0.4310323, 1.419752, 0.8313726, 0, 1, 1,
0.8340569, -1.167309, 1.622546, 0.8352941, 0, 1, 1,
0.8366373, 0.9912258, -0.4188977, 0.8431373, 0, 1, 1,
0.8446634, -2.678829, 0.8355386, 0.8470588, 0, 1, 1,
0.8478752, 0.2658731, -0.7539402, 0.854902, 0, 1, 1,
0.8482906, -1.160306, 2.236952, 0.8588235, 0, 1, 1,
0.8491685, -0.5591525, 2.530612, 0.8666667, 0, 1, 1,
0.8494666, 0.2974867, 1.804837, 0.8705882, 0, 1, 1,
0.8529038, -0.5131689, 1.509454, 0.8784314, 0, 1, 1,
0.8596418, 0.3841426, 1.721552, 0.8823529, 0, 1, 1,
0.8599265, 1.411829, 0.254054, 0.8901961, 0, 1, 1,
0.8676487, 0.1669176, -0.1185741, 0.8941177, 0, 1, 1,
0.8683344, -0.5218, 3.759964, 0.9019608, 0, 1, 1,
0.8685474, -1.638264, 4.059565, 0.9098039, 0, 1, 1,
0.8722514, 0.4180396, 2.817487, 0.9137255, 0, 1, 1,
0.8767897, -0.443841, 1.767863, 0.9215686, 0, 1, 1,
0.8791868, 0.4941864, 0.05321352, 0.9254902, 0, 1, 1,
0.8949366, 0.9843525, -0.6715659, 0.9333333, 0, 1, 1,
0.8954187, -0.1496234, 1.918265, 0.9372549, 0, 1, 1,
0.8968229, 0.142449, 1.193367, 0.945098, 0, 1, 1,
0.8976544, -0.2409788, 0.5748081, 0.9490196, 0, 1, 1,
0.9101781, 2.006194, -1.28369, 0.9568627, 0, 1, 1,
0.9134675, 0.3590123, 1.358683, 0.9607843, 0, 1, 1,
0.91766, -0.7757328, 2.642274, 0.9686275, 0, 1, 1,
0.9257198, 2.39778, -0.4305463, 0.972549, 0, 1, 1,
0.9267999, -0.8966743, 2.389719, 0.9803922, 0, 1, 1,
0.9379594, 0.4482146, 0.6835871, 0.9843137, 0, 1, 1,
0.9383287, -0.3982675, 1.430963, 0.9921569, 0, 1, 1,
0.9475676, -0.1599638, 1.330823, 0.9960784, 0, 1, 1,
0.9478819, -0.7382537, 2.786258, 1, 0, 0.9960784, 1,
0.9483707, -0.5520991, 3.01636, 1, 0, 0.9882353, 1,
0.9486005, -2.052918, 2.138819, 1, 0, 0.9843137, 1,
0.9541608, 1.817432, 0.4604842, 1, 0, 0.9764706, 1,
0.9575822, -1.072809, 2.137589, 1, 0, 0.972549, 1,
0.9617191, 1.181416, -0.1780832, 1, 0, 0.9647059, 1,
0.9654642, 1.36231, 1.344661, 1, 0, 0.9607843, 1,
0.9712176, 0.7289513, 0.9667562, 1, 0, 0.9529412, 1,
0.9726936, 0.8714497, 0.08903705, 1, 0, 0.9490196, 1,
0.9776611, 0.2601172, 1.884324, 1, 0, 0.9411765, 1,
0.9820468, 0.5118135, -0.9897828, 1, 0, 0.9372549, 1,
0.9907894, -1.461173, 2.078709, 1, 0, 0.9294118, 1,
0.9929368, -0.761139, 2.985317, 1, 0, 0.9254902, 1,
1.006667, 0.9903677, 1.536915, 1, 0, 0.9176471, 1,
1.014692, 0.5161905, -0.02606842, 1, 0, 0.9137255, 1,
1.01895, 0.2187062, 1.360016, 1, 0, 0.9058824, 1,
1.019513, -0.261713, 1.126696, 1, 0, 0.9019608, 1,
1.031091, -1.584432, 3.518851, 1, 0, 0.8941177, 1,
1.038752, -0.7467929, 2.89406, 1, 0, 0.8862745, 1,
1.040879, -1.581551, 1.414085, 1, 0, 0.8823529, 1,
1.04317, 0.9233858, 2.182961, 1, 0, 0.8745098, 1,
1.043574, -0.6160364, 2.565311, 1, 0, 0.8705882, 1,
1.054056, -1.317899, 2.320713, 1, 0, 0.8627451, 1,
1.05549, -1.204956, 2.674345, 1, 0, 0.8588235, 1,
1.058814, 0.3259125, 1.535886, 1, 0, 0.8509804, 1,
1.066965, 1.042721, 1.709665, 1, 0, 0.8470588, 1,
1.070446, 0.5783871, 1.174839, 1, 0, 0.8392157, 1,
1.07277, 0.001716452, 1.789255, 1, 0, 0.8352941, 1,
1.073862, 0.1719875, 0.8498212, 1, 0, 0.827451, 1,
1.074146, 1.523946, 1.667495, 1, 0, 0.8235294, 1,
1.074258, -0.9003024, 2.569983, 1, 0, 0.8156863, 1,
1.074463, -1.003566, 3.027225, 1, 0, 0.8117647, 1,
1.075462, -0.5866627, 3.160766, 1, 0, 0.8039216, 1,
1.077334, 1.168244, 1.663099, 1, 0, 0.7960784, 1,
1.077505, 0.6806271, 0.3418625, 1, 0, 0.7921569, 1,
1.086357, 2.8539, 0.5477576, 1, 0, 0.7843137, 1,
1.088177, -0.005017098, 0.4426291, 1, 0, 0.7803922, 1,
1.108362, -0.4285448, 0.0230219, 1, 0, 0.772549, 1,
1.120269, 0.9938523, 2.138275, 1, 0, 0.7686275, 1,
1.120482, 0.18228, 0.9766363, 1, 0, 0.7607843, 1,
1.122385, 0.594972, 1.531312, 1, 0, 0.7568628, 1,
1.123629, 1.074647, 0.5331791, 1, 0, 0.7490196, 1,
1.124992, 0.7239286, 0.4174276, 1, 0, 0.7450981, 1,
1.139448, 0.7823695, 0.5028698, 1, 0, 0.7372549, 1,
1.140049, -1.261554, 2.277781, 1, 0, 0.7333333, 1,
1.146499, 0.6725713, 1.94813, 1, 0, 0.7254902, 1,
1.158477, -1.447115, 2.362847, 1, 0, 0.7215686, 1,
1.162083, 3.49586, 0.6137157, 1, 0, 0.7137255, 1,
1.162243, -0.9160351, 1.455345, 1, 0, 0.7098039, 1,
1.16893, 0.725198, 0.3719383, 1, 0, 0.7019608, 1,
1.172973, -1.140229, 0.1983927, 1, 0, 0.6941177, 1,
1.174696, -1.025731, 3.048424, 1, 0, 0.6901961, 1,
1.176191, -2.105274, 4.884834, 1, 0, 0.682353, 1,
1.17817, 1.791406, -2.144545, 1, 0, 0.6784314, 1,
1.179569, -1.245477, 2.347503, 1, 0, 0.6705883, 1,
1.18329, 2.300215, 1.272093, 1, 0, 0.6666667, 1,
1.193436, -0.7898063, 2.137949, 1, 0, 0.6588235, 1,
1.1937, 0.5972416, 0.06979331, 1, 0, 0.654902, 1,
1.197632, -0.3455389, 1.792136, 1, 0, 0.6470588, 1,
1.2011, 0.6208302, 0.2923754, 1, 0, 0.6431373, 1,
1.205042, -0.2347284, 3.250175, 1, 0, 0.6352941, 1,
1.206833, 0.1807228, 0.3844502, 1, 0, 0.6313726, 1,
1.207305, -0.8148457, 1.387084, 1, 0, 0.6235294, 1,
1.216434, -0.5440468, 2.372315, 1, 0, 0.6196079, 1,
1.218401, -0.9096358, 2.05977, 1, 0, 0.6117647, 1,
1.220648, -0.2112711, 1.623887, 1, 0, 0.6078432, 1,
1.227267, -0.3735337, 1.951506, 1, 0, 0.6, 1,
1.227686, 0.1665744, 0.9861973, 1, 0, 0.5921569, 1,
1.231104, 0.5322908, 0.9999275, 1, 0, 0.5882353, 1,
1.234545, 1.435975, 1.924034, 1, 0, 0.5803922, 1,
1.235175, -0.2901425, 3.403049, 1, 0, 0.5764706, 1,
1.24206, -0.2999179, 3.350906, 1, 0, 0.5686275, 1,
1.244791, 1.546653, 3.519764, 1, 0, 0.5647059, 1,
1.246554, 1.2183, 1.359289, 1, 0, 0.5568628, 1,
1.247587, -0.4156379, 1.598595, 1, 0, 0.5529412, 1,
1.260926, -1.03714, 2.746681, 1, 0, 0.5450981, 1,
1.27332, 1.009969, 1.714336, 1, 0, 0.5411765, 1,
1.277521, -1.232011, 1.876332, 1, 0, 0.5333334, 1,
1.286262, 1.505976, -0.6679432, 1, 0, 0.5294118, 1,
1.293524, 1.698781, 0.7410757, 1, 0, 0.5215687, 1,
1.294743, -0.02303179, 1.873587, 1, 0, 0.5176471, 1,
1.302576, 0.6895288, 1.080482, 1, 0, 0.509804, 1,
1.316413, -0.8578838, 2.378606, 1, 0, 0.5058824, 1,
1.31934, 1.013434, 1.497267, 1, 0, 0.4980392, 1,
1.321265, 1.0065, 0.02884001, 1, 0, 0.4901961, 1,
1.326016, 0.3456066, 2.209489, 1, 0, 0.4862745, 1,
1.328978, -0.6626967, 2.541047, 1, 0, 0.4784314, 1,
1.33468, -2.402426, 4.525107, 1, 0, 0.4745098, 1,
1.339168, -0.1783863, 1.93222, 1, 0, 0.4666667, 1,
1.343174, 1.593806, 0.3635709, 1, 0, 0.4627451, 1,
1.352727, -0.2111016, 0.2602412, 1, 0, 0.454902, 1,
1.358754, -0.3232596, 1.107245, 1, 0, 0.4509804, 1,
1.361259, -0.2170198, 0.2920789, 1, 0, 0.4431373, 1,
1.36665, -1.039343, 1.915402, 1, 0, 0.4392157, 1,
1.369441, 0.3222123, -1.666512, 1, 0, 0.4313726, 1,
1.383269, -0.9178468, 3.367913, 1, 0, 0.427451, 1,
1.390563, 2.513139, -0.2693304, 1, 0, 0.4196078, 1,
1.396385, 0.506864, -0.3667495, 1, 0, 0.4156863, 1,
1.403071, 1.561711, 0.8267007, 1, 0, 0.4078431, 1,
1.425891, -0.3494173, 2.447935, 1, 0, 0.4039216, 1,
1.428528, 0.8785217, -0.8006849, 1, 0, 0.3960784, 1,
1.447626, -0.5774815, 2.947953, 1, 0, 0.3882353, 1,
1.46205, -1.139995, 2.356908, 1, 0, 0.3843137, 1,
1.477507, 1.810127, 0.2434382, 1, 0, 0.3764706, 1,
1.477548, -0.9861732, 1.005138, 1, 0, 0.372549, 1,
1.491959, 0.8905264, -0.1922186, 1, 0, 0.3647059, 1,
1.498694, -0.3346171, 2.699838, 1, 0, 0.3607843, 1,
1.55693, -0.6939389, 1.83411, 1, 0, 0.3529412, 1,
1.560549, -0.1838559, 1.790879, 1, 0, 0.3490196, 1,
1.568122, 1.045814, 1.747337, 1, 0, 0.3411765, 1,
1.578016, 0.8937914, -0.004443322, 1, 0, 0.3372549, 1,
1.580393, 0.9324768, 1.023152, 1, 0, 0.3294118, 1,
1.581483, -0.1446717, 2.198792, 1, 0, 0.3254902, 1,
1.584703, 0.7758907, 1.39732, 1, 0, 0.3176471, 1,
1.58912, 0.02740777, 1.986459, 1, 0, 0.3137255, 1,
1.597958, -1.427178, 2.369321, 1, 0, 0.3058824, 1,
1.614027, -1.027337, 0.5616297, 1, 0, 0.2980392, 1,
1.631086, -0.0599726, 0.7481957, 1, 0, 0.2941177, 1,
1.638408, 0.6093712, -0.7819129, 1, 0, 0.2862745, 1,
1.650121, -0.2536582, 2.183741, 1, 0, 0.282353, 1,
1.66139, 0.2667322, 1.818925, 1, 0, 0.2745098, 1,
1.705598, -1.116407, 2.456898, 1, 0, 0.2705882, 1,
1.713327, 1.880734, -0.2762952, 1, 0, 0.2627451, 1,
1.725663, 0.5632824, 3.777089, 1, 0, 0.2588235, 1,
1.726111, -0.9634973, 2.764747, 1, 0, 0.2509804, 1,
1.73321, -0.7654073, 1.50794, 1, 0, 0.2470588, 1,
1.75969, 0.8268806, -0.05161064, 1, 0, 0.2392157, 1,
1.789443, 2.11913, 0.03792037, 1, 0, 0.2352941, 1,
1.792902, 0.3312008, 0.803314, 1, 0, 0.227451, 1,
1.797539, -0.5081763, 2.463496, 1, 0, 0.2235294, 1,
1.815549, -1.378628, 3.21182, 1, 0, 0.2156863, 1,
1.844334, 0.4114779, 1.02792, 1, 0, 0.2117647, 1,
1.846055, 0.5066481, 2.522219, 1, 0, 0.2039216, 1,
1.850674, 0.1838835, 0.6458239, 1, 0, 0.1960784, 1,
1.869709, 0.2888574, 0.1971343, 1, 0, 0.1921569, 1,
1.878569, 0.07223406, 1.554546, 1, 0, 0.1843137, 1,
1.89335, 1.467978, 0.6746293, 1, 0, 0.1803922, 1,
1.920737, -0.5552112, 2.111034, 1, 0, 0.172549, 1,
1.940885, -0.3259822, 1.952457, 1, 0, 0.1686275, 1,
1.944294, 1.933774, 2.740606, 1, 0, 0.1607843, 1,
1.949437, 0.5754351, 1.628843, 1, 0, 0.1568628, 1,
1.965766, 1.10265, 0.483696, 1, 0, 0.1490196, 1,
1.974511, -0.08623841, 1.775335, 1, 0, 0.145098, 1,
1.97649, -1.38808, 1.864941, 1, 0, 0.1372549, 1,
1.979596, 0.9001616, -0.6040658, 1, 0, 0.1333333, 1,
1.990545, -1.319788, 3.514531, 1, 0, 0.1254902, 1,
2.001679, 0.8319849, -0.8917634, 1, 0, 0.1215686, 1,
2.011621, -1.563192, 2.253812, 1, 0, 0.1137255, 1,
2.03423, -1.551057, 1.81764, 1, 0, 0.1098039, 1,
2.065247, 0.5114393, 1.585558, 1, 0, 0.1019608, 1,
2.084209, 0.3128901, -0.2292699, 1, 0, 0.09411765, 1,
2.098253, 0.5952885, -0.6936094, 1, 0, 0.09019608, 1,
2.142304, -0.3718856, 2.414195, 1, 0, 0.08235294, 1,
2.161729, -0.2765107, 0.880959, 1, 0, 0.07843138, 1,
2.16616, 0.2899117, -0.1298192, 1, 0, 0.07058824, 1,
2.218153, 1.493392, 1.278868, 1, 0, 0.06666667, 1,
2.225424, 0.1780497, 1.533389, 1, 0, 0.05882353, 1,
2.24232, 0.2651539, 0.2927322, 1, 0, 0.05490196, 1,
2.273506, -0.6834407, 3.110988, 1, 0, 0.04705882, 1,
2.306768, 0.3420909, 0.9458963, 1, 0, 0.04313726, 1,
2.319267, 0.2734809, 3.022693, 1, 0, 0.03529412, 1,
2.457212, -1.146298, 2.141661, 1, 0, 0.03137255, 1,
2.614868, -0.5779623, 1.809882, 1, 0, 0.02352941, 1,
2.83881, 0.5664711, 1.257172, 1, 0, 0.01960784, 1,
3.104378, 0.4568626, 2.277121, 1, 0, 0.01176471, 1,
3.368886, 0.5432595, 1.134077, 1, 0, 0.007843138, 1
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
0.2721809, -3.938239, -6.662643, 0, -0.5, 0.5, 0.5,
0.2721809, -3.938239, -6.662643, 1, -0.5, 0.5, 0.5,
0.2721809, -3.938239, -6.662643, 1, 1.5, 0.5, 0.5,
0.2721809, -3.938239, -6.662643, 0, 1.5, 0.5, 0.5
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
-3.874307, 0.3175362, -6.662643, 0, -0.5, 0.5, 0.5,
-3.874307, 0.3175362, -6.662643, 1, -0.5, 0.5, 0.5,
-3.874307, 0.3175362, -6.662643, 1, 1.5, 0.5, 0.5,
-3.874307, 0.3175362, -6.662643, 0, 1.5, 0.5, 0.5
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
-3.874307, -3.938239, 0.08139062, 0, -0.5, 0.5, 0.5,
-3.874307, -3.938239, 0.08139062, 1, -0.5, 0.5, 0.5,
-3.874307, -3.938239, 0.08139062, 1, 1.5, 0.5, 0.5,
-3.874307, -3.938239, 0.08139062, 0, 1.5, 0.5, 0.5
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
-2, -2.956137, -5.106328,
3, -2.956137, -5.106328,
-2, -2.956137, -5.106328,
-2, -3.119821, -5.365714,
-1, -2.956137, -5.106328,
-1, -3.119821, -5.365714,
0, -2.956137, -5.106328,
0, -3.119821, -5.365714,
1, -2.956137, -5.106328,
1, -3.119821, -5.365714,
2, -2.956137, -5.106328,
2, -3.119821, -5.365714,
3, -2.956137, -5.106328,
3, -3.119821, -5.365714
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
-2, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
-2, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
-2, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
-2, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5,
-1, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
-1, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
-1, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
-1, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5,
0, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
0, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
0, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
0, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5,
1, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
1, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
1, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
1, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5,
2, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
2, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
2, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
2, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5,
3, -3.447188, -5.884486, 0, -0.5, 0.5, 0.5,
3, -3.447188, -5.884486, 1, -0.5, 0.5, 0.5,
3, -3.447188, -5.884486, 1, 1.5, 0.5, 0.5,
3, -3.447188, -5.884486, 0, 1.5, 0.5, 0.5
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
-2.917426, -2, -5.106328,
-2.917426, 3, -5.106328,
-2.917426, -2, -5.106328,
-3.076906, -2, -5.365714,
-2.917426, -1, -5.106328,
-3.076906, -1, -5.365714,
-2.917426, 0, -5.106328,
-3.076906, 0, -5.365714,
-2.917426, 1, -5.106328,
-3.076906, 1, -5.365714,
-2.917426, 2, -5.106328,
-3.076906, 2, -5.365714,
-2.917426, 3, -5.106328,
-3.076906, 3, -5.365714
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
-3.395867, -2, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, -2, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, -2, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, -2, -5.884486, 0, 1.5, 0.5, 0.5,
-3.395867, -1, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, -1, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, -1, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, -1, -5.884486, 0, 1.5, 0.5, 0.5,
-3.395867, 0, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, 0, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, 0, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, 0, -5.884486, 0, 1.5, 0.5, 0.5,
-3.395867, 1, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, 1, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, 1, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, 1, -5.884486, 0, 1.5, 0.5, 0.5,
-3.395867, 2, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, 2, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, 2, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, 2, -5.884486, 0, 1.5, 0.5, 0.5,
-3.395867, 3, -5.884486, 0, -0.5, 0.5, 0.5,
-3.395867, 3, -5.884486, 1, -0.5, 0.5, 0.5,
-3.395867, 3, -5.884486, 1, 1.5, 0.5, 0.5,
-3.395867, 3, -5.884486, 0, 1.5, 0.5, 0.5
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
-2.917426, -2.956137, -4,
-2.917426, -2.956137, 4,
-2.917426, -2.956137, -4,
-3.076906, -3.119821, -4,
-2.917426, -2.956137, -2,
-3.076906, -3.119821, -2,
-2.917426, -2.956137, 0,
-3.076906, -3.119821, 0,
-2.917426, -2.956137, 2,
-3.076906, -3.119821, 2,
-2.917426, -2.956137, 4,
-3.076906, -3.119821, 4
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
-3.395867, -3.447188, -4, 0, -0.5, 0.5, 0.5,
-3.395867, -3.447188, -4, 1, -0.5, 0.5, 0.5,
-3.395867, -3.447188, -4, 1, 1.5, 0.5, 0.5,
-3.395867, -3.447188, -4, 0, 1.5, 0.5, 0.5,
-3.395867, -3.447188, -2, 0, -0.5, 0.5, 0.5,
-3.395867, -3.447188, -2, 1, -0.5, 0.5, 0.5,
-3.395867, -3.447188, -2, 1, 1.5, 0.5, 0.5,
-3.395867, -3.447188, -2, 0, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 0, 0, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 0, 1, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 0, 1, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 0, 0, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 2, 0, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 2, 1, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 2, 1, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 2, 0, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 4, 0, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 4, 1, -0.5, 0.5, 0.5,
-3.395867, -3.447188, 4, 1, 1.5, 0.5, 0.5,
-3.395867, -3.447188, 4, 0, 1.5, 0.5, 0.5
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
-2.917426, -2.956137, -5.106328,
-2.917426, 3.591209, -5.106328,
-2.917426, -2.956137, 5.269109,
-2.917426, 3.591209, 5.269109,
-2.917426, -2.956137, -5.106328,
-2.917426, -2.956137, 5.269109,
-2.917426, 3.591209, -5.106328,
-2.917426, 3.591209, 5.269109,
-2.917426, -2.956137, -5.106328,
3.461787, -2.956137, -5.106328,
-2.917426, -2.956137, 5.269109,
3.461787, -2.956137, 5.269109,
-2.917426, 3.591209, -5.106328,
3.461787, 3.591209, -5.106328,
-2.917426, 3.591209, 5.269109,
3.461787, 3.591209, 5.269109,
3.461787, -2.956137, -5.106328,
3.461787, 3.591209, -5.106328,
3.461787, -2.956137, 5.269109,
3.461787, 3.591209, 5.269109,
3.461787, -2.956137, -5.106328,
3.461787, -2.956137, 5.269109,
3.461787, 3.591209, -5.106328,
3.461787, 3.591209, 5.269109
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
var radius = 7.383849;
var distance = 32.85158;
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
mvMatrix.translate( -0.2721809, -0.3175362, -0.08139062 );
mvMatrix.scale( 1.251496, 1.219358, 0.7694675 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.85158);
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
1-chloro-2-nitroprop<-read.table("1-chloro-2-nitroprop.xyz")
```

```
## Error in read.table("1-chloro-2-nitroprop.xyz"): no lines available in input
```

```r
x<-1-chloro-2-nitroprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
y<-1-chloro-2-nitroprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
z<-1-chloro-2-nitroprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
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
-2.824524, 0.9298276, -3.221366, 0, 0, 1, 1, 1,
-2.757318, 0.2816266, -2.169335, 1, 0, 0, 1, 1,
-2.678808, 0.1118048, -2.203528, 1, 0, 0, 1, 1,
-2.575249, 1.222323, -0.3483596, 1, 0, 0, 1, 1,
-2.561727, -0.6516013, -0.6466749, 1, 0, 0, 1, 1,
-2.52265, -0.2387583, -0.8518428, 1, 0, 0, 1, 1,
-2.357043, -1.654537, -2.114341, 0, 0, 0, 1, 1,
-2.245248, 0.4793489, -3.091819, 0, 0, 0, 1, 1,
-2.219971, 1.092567, -0.2952561, 0, 0, 0, 1, 1,
-2.218489, -0.4448288, -3.369342, 0, 0, 0, 1, 1,
-2.144341, 0.67127, -1.116817, 0, 0, 0, 1, 1,
-2.119893, 0.2665803, -0.358205, 0, 0, 0, 1, 1,
-2.116203, -1.499503, -3.610118, 0, 0, 0, 1, 1,
-2.10909, -1.011037, -2.941594, 1, 1, 1, 1, 1,
-2.106446, -0.08921376, -2.539805, 1, 1, 1, 1, 1,
-2.08998, 0.8195379, -1.369668, 1, 1, 1, 1, 1,
-2.002145, -0.3258752, -2.202184, 1, 1, 1, 1, 1,
-1.924578, -1.33413, -0.1413533, 1, 1, 1, 1, 1,
-1.908293, -1.540762, -2.190956, 1, 1, 1, 1, 1,
-1.87732, 0.561099, -0.8748352, 1, 1, 1, 1, 1,
-1.872535, 0.3923091, -1.095326, 1, 1, 1, 1, 1,
-1.864961, -2.062212, -0.5477473, 1, 1, 1, 1, 1,
-1.858992, -0.006220824, -3.224381, 1, 1, 1, 1, 1,
-1.850085, -0.02984332, -1.356732, 1, 1, 1, 1, 1,
-1.84919, 1.079127, 0.0175703, 1, 1, 1, 1, 1,
-1.828508, -0.02963183, -0.1239142, 1, 1, 1, 1, 1,
-1.818844, 1.455838, 0.7054226, 1, 1, 1, 1, 1,
-1.8098, 0.4094193, -2.310936, 1, 1, 1, 1, 1,
-1.802906, -0.1944233, -0.4228332, 0, 0, 1, 1, 1,
-1.790404, 1.355288, -2.51786, 1, 0, 0, 1, 1,
-1.775175, 1.189608, -1.863366, 1, 0, 0, 1, 1,
-1.769005, 0.2859863, -0.443951, 1, 0, 0, 1, 1,
-1.753387, 0.5980083, -1.630783, 1, 0, 0, 1, 1,
-1.750396, 0.08193259, -1.540198, 1, 0, 0, 1, 1,
-1.748546, 0.3937742, -0.5940864, 0, 0, 0, 1, 1,
-1.741581, -0.8768789, -1.815682, 0, 0, 0, 1, 1,
-1.73407, -0.8168116, -1.775218, 0, 0, 0, 1, 1,
-1.731448, 1.309959, 1.042783, 0, 0, 0, 1, 1,
-1.720013, -0.4050507, -3.214652, 0, 0, 0, 1, 1,
-1.707656, -0.9905007, -0.08880115, 0, 0, 0, 1, 1,
-1.696981, -0.3189994, -1.570549, 0, 0, 0, 1, 1,
-1.691836, 0.005860994, -0.8030487, 1, 1, 1, 1, 1,
-1.683086, 1.038265, -1.597765, 1, 1, 1, 1, 1,
-1.656528, -1.159656, -2.501301, 1, 1, 1, 1, 1,
-1.652109, 0.134328, -0.7533903, 1, 1, 1, 1, 1,
-1.640025, -0.3909575, -2.209805, 1, 1, 1, 1, 1,
-1.622231, 1.292393, -1.077805, 1, 1, 1, 1, 1,
-1.610972, 0.03942377, -1.337438, 1, 1, 1, 1, 1,
-1.606963, 2.592207, -0.112789, 1, 1, 1, 1, 1,
-1.60622, -1.241843, -2.716595, 1, 1, 1, 1, 1,
-1.601254, -0.01973999, -0.8644372, 1, 1, 1, 1, 1,
-1.597612, -0.2531664, -0.3449608, 1, 1, 1, 1, 1,
-1.586557, -1.541184, -1.065232, 1, 1, 1, 1, 1,
-1.572426, -0.9338231, -2.087226, 1, 1, 1, 1, 1,
-1.569498, 0.8445235, -0.63865, 1, 1, 1, 1, 1,
-1.56595, 0.2634301, 0.2862747, 1, 1, 1, 1, 1,
-1.56425, -1.281495, -2.053763, 0, 0, 1, 1, 1,
-1.562829, 2.159332, -1.740162, 1, 0, 0, 1, 1,
-1.561842, -0.9469205, -3.092483, 1, 0, 0, 1, 1,
-1.550046, -0.4444179, -0.4251919, 1, 0, 0, 1, 1,
-1.548872, 0.04156885, -1.546508, 1, 0, 0, 1, 1,
-1.547911, 0.4467634, -0.04349889, 1, 0, 0, 1, 1,
-1.540276, -0.8347794, -2.81032, 0, 0, 0, 1, 1,
-1.538267, 0.2584577, -1.889484, 0, 0, 0, 1, 1,
-1.520139, -0.6862411, -1.873987, 0, 0, 0, 1, 1,
-1.519356, -0.8699533, -3.334004, 0, 0, 0, 1, 1,
-1.502024, 0.1952068, -0.3441467, 0, 0, 0, 1, 1,
-1.490691, -0.7126055, -0.4875342, 0, 0, 0, 1, 1,
-1.486618, -0.7677544, -0.9870467, 0, 0, 0, 1, 1,
-1.481728, -1.814496, -2.153558, 1, 1, 1, 1, 1,
-1.477587, -0.05819193, -0.9101496, 1, 1, 1, 1, 1,
-1.476133, 3.17656, -0.2574268, 1, 1, 1, 1, 1,
-1.468003, 0.5314012, -1.368571, 1, 1, 1, 1, 1,
-1.443414, -1.221024, -0.9557926, 1, 1, 1, 1, 1,
-1.437911, -1.184609, -2.704635, 1, 1, 1, 1, 1,
-1.430603, 0.138659, 0.2385167, 1, 1, 1, 1, 1,
-1.422655, -1.025367, -2.807727, 1, 1, 1, 1, 1,
-1.419986, 1.057506, -1.31226, 1, 1, 1, 1, 1,
-1.419656, 0.7482272, -1.484625, 1, 1, 1, 1, 1,
-1.414441, -0.2033955, -0.354298, 1, 1, 1, 1, 1,
-1.408445, -0.4626084, -1.389755, 1, 1, 1, 1, 1,
-1.401581, 0.3590812, -0.7441756, 1, 1, 1, 1, 1,
-1.40021, -0.2087549, -0.7143462, 1, 1, 1, 1, 1,
-1.399656, 0.5912488, -2.316077, 1, 1, 1, 1, 1,
-1.39632, -1.254377, -2.700624, 0, 0, 1, 1, 1,
-1.381363, 0.1256835, -1.992339, 1, 0, 0, 1, 1,
-1.374454, -0.3091381, -2.809335, 1, 0, 0, 1, 1,
-1.368124, -1.233204, -0.719945, 1, 0, 0, 1, 1,
-1.36621, 2.543905, -0.3538998, 1, 0, 0, 1, 1,
-1.342507, -1.388691, -0.9069514, 1, 0, 0, 1, 1,
-1.338924, -1.353937, -3.333536, 0, 0, 0, 1, 1,
-1.333378, 1.255119, -2.016067, 0, 0, 0, 1, 1,
-1.32287, -1.354771, -0.625054, 0, 0, 0, 1, 1,
-1.318071, 1.621461, -0.1868196, 0, 0, 0, 1, 1,
-1.311262, -0.2664869, -0.8904489, 0, 0, 0, 1, 1,
-1.304511, 0.09783459, -0.7891858, 0, 0, 0, 1, 1,
-1.284269, -0.8209375, -3.319803, 0, 0, 0, 1, 1,
-1.284245, 0.2963326, -0.5454801, 1, 1, 1, 1, 1,
-1.281146, -0.452354, -2.516423, 1, 1, 1, 1, 1,
-1.280351, -1.824575, -2.964376, 1, 1, 1, 1, 1,
-1.266237, 0.8633956, -0.794376, 1, 1, 1, 1, 1,
-1.262553, -0.3378054, -2.768923, 1, 1, 1, 1, 1,
-1.262198, -0.570842, -0.349472, 1, 1, 1, 1, 1,
-1.254623, -0.1685212, -0.3814937, 1, 1, 1, 1, 1,
-1.2501, 0.3198244, -2.705406, 1, 1, 1, 1, 1,
-1.245006, 0.5169033, -1.269696, 1, 1, 1, 1, 1,
-1.239318, -0.06962644, -1.438213, 1, 1, 1, 1, 1,
-1.239268, -1.65196, -2.8175, 1, 1, 1, 1, 1,
-1.212433, 1.012001, -1.069065, 1, 1, 1, 1, 1,
-1.206898, -1.793433, -1.350675, 1, 1, 1, 1, 1,
-1.205253, -1.418815, -2.709236, 1, 1, 1, 1, 1,
-1.198285, -0.2958352, -3.092777, 1, 1, 1, 1, 1,
-1.196393, -0.4400347, -3.267456, 0, 0, 1, 1, 1,
-1.183453, 0.7732989, -3.184502, 1, 0, 0, 1, 1,
-1.174702, -0.9271608, -0.9119087, 1, 0, 0, 1, 1,
-1.17361, 1.296329, -0.0533242, 1, 0, 0, 1, 1,
-1.167978, 0.8004292, -0.5414635, 1, 0, 0, 1, 1,
-1.166221, -1.283824, -2.861824, 1, 0, 0, 1, 1,
-1.160113, -0.456554, -2.59095, 0, 0, 0, 1, 1,
-1.158844, 1.548312, 0.7401024, 0, 0, 0, 1, 1,
-1.152862, 1.568759, -0.02539402, 0, 0, 0, 1, 1,
-1.148584, -1.700865, -2.75595, 0, 0, 0, 1, 1,
-1.144035, -0.1756417, -2.667537, 0, 0, 0, 1, 1,
-1.138895, -0.6121846, -1.611835, 0, 0, 0, 1, 1,
-1.133829, 0.3047964, -0.2316006, 0, 0, 0, 1, 1,
-1.12991, -0.7262984, -2.155294, 1, 1, 1, 1, 1,
-1.128936, 0.5461396, -0.2274749, 1, 1, 1, 1, 1,
-1.126397, 0.06628125, -2.175552, 1, 1, 1, 1, 1,
-1.110226, 0.1710937, -1.571945, 1, 1, 1, 1, 1,
-1.109528, 0.9084927, -0.8635031, 1, 1, 1, 1, 1,
-1.107021, 1.496502, -1.884246, 1, 1, 1, 1, 1,
-1.096871, -0.678373, -1.20726, 1, 1, 1, 1, 1,
-1.093963, 1.09173, -1.701403, 1, 1, 1, 1, 1,
-1.093437, 0.04217235, -2.999199, 1, 1, 1, 1, 1,
-1.093417, -0.6920846, -2.981837, 1, 1, 1, 1, 1,
-1.07527, -0.6139655, -0.9734895, 1, 1, 1, 1, 1,
-1.074238, -1.615007, -2.360893, 1, 1, 1, 1, 1,
-1.072681, -2.235325, -1.21427, 1, 1, 1, 1, 1,
-1.068961, 2.839825, 0.3287862, 1, 1, 1, 1, 1,
-1.065144, -0.2224434, -1.40415, 1, 1, 1, 1, 1,
-1.058699, -0.08611342, -1.545358, 0, 0, 1, 1, 1,
-1.049236, 0.01746667, -0.7971957, 1, 0, 0, 1, 1,
-1.049071, -1.62711, -1.515864, 1, 0, 0, 1, 1,
-1.047822, 0.3589004, -0.5666128, 1, 0, 0, 1, 1,
-1.04657, -0.4754566, -2.157918, 1, 0, 0, 1, 1,
-1.045931, -0.3844268, -2.386539, 1, 0, 0, 1, 1,
-1.041247, 0.4010535, -0.1253454, 0, 0, 0, 1, 1,
-1.040737, -0.7681062, -1.524263, 0, 0, 0, 1, 1,
-1.040349, 1.193871, 0.3150829, 0, 0, 0, 1, 1,
-1.038057, -0.08844875, -0.07314537, 0, 0, 0, 1, 1,
-1.032351, 1.375542, -0.9064059, 0, 0, 0, 1, 1,
-1.025467, -1.074257, -1.182565, 0, 0, 0, 1, 1,
-1.023551, 0.0917054, -1.612512, 0, 0, 0, 1, 1,
-1.021686, 0.07639666, -0.3005297, 1, 1, 1, 1, 1,
-1.016185, 0.2794856, -1.707058, 1, 1, 1, 1, 1,
-1.01408, 1.908554, 0.9712002, 1, 1, 1, 1, 1,
-1.011903, -0.2523041, -2.541938, 1, 1, 1, 1, 1,
-1.000792, 0.1717382, -1.112999, 1, 1, 1, 1, 1,
-1.000417, 0.1836492, -0.6548918, 1, 1, 1, 1, 1,
-1.000076, -0.7311836, -1.193432, 1, 1, 1, 1, 1,
-0.9909264, -1.437569, -3.588594, 1, 1, 1, 1, 1,
-0.9850538, -0.01555669, -3.582363, 1, 1, 1, 1, 1,
-0.9782148, 1.614163, -3.030088, 1, 1, 1, 1, 1,
-0.9763038, -0.290634, -1.840254, 1, 1, 1, 1, 1,
-0.9759867, -0.8663204, -3.11068, 1, 1, 1, 1, 1,
-0.9704995, -0.5180708, -1.280331, 1, 1, 1, 1, 1,
-0.9493563, 0.5219427, -1.731989, 1, 1, 1, 1, 1,
-0.9461073, -2.214236, -1.549862, 1, 1, 1, 1, 1,
-0.9446234, 0.2968674, -4.118303, 0, 0, 1, 1, 1,
-0.9394811, -0.04804511, -3.154931, 1, 0, 0, 1, 1,
-0.9381296, -1.499452, -2.789209, 1, 0, 0, 1, 1,
-0.9331123, 0.8057458, -1.113835, 1, 0, 0, 1, 1,
-0.9318288, 0.954742, -1.332745, 1, 0, 0, 1, 1,
-0.9255546, 0.6602145, -0.9227134, 1, 0, 0, 1, 1,
-0.9215111, -0.9575561, -1.18352, 0, 0, 0, 1, 1,
-0.9126809, -0.4314072, -1.83662, 0, 0, 0, 1, 1,
-0.9118795, 0.2964972, -1.802138, 0, 0, 0, 1, 1,
-0.9069832, 0.6794177, -1.874468, 0, 0, 0, 1, 1,
-0.903931, -1.073928, -2.31892, 0, 0, 0, 1, 1,
-0.9037355, -2.527915, -1.604242, 0, 0, 0, 1, 1,
-0.9023935, -0.202808, -0.999103, 0, 0, 0, 1, 1,
-0.8944567, -0.6840534, -2.255981, 1, 1, 1, 1, 1,
-0.8891684, -0.9167053, -2.450995, 1, 1, 1, 1, 1,
-0.8882222, 1.313318, -1.250182, 1, 1, 1, 1, 1,
-0.8835793, -0.306842, -0.002056502, 1, 1, 1, 1, 1,
-0.8786234, 0.6799165, -1.896986, 1, 1, 1, 1, 1,
-0.8759411, -0.5747365, -2.243611, 1, 1, 1, 1, 1,
-0.8755423, -0.6420324, -4.175555, 1, 1, 1, 1, 1,
-0.8658702, -0.2837207, -1.566103, 1, 1, 1, 1, 1,
-0.863111, -0.98225, -2.477116, 1, 1, 1, 1, 1,
-0.8581025, -0.5971303, -1.813119, 1, 1, 1, 1, 1,
-0.8570327, 0.8083315, 0.2274264, 1, 1, 1, 1, 1,
-0.8546817, -1.277621, -2.657688, 1, 1, 1, 1, 1,
-0.8503156, 1.913375, -1.303564, 1, 1, 1, 1, 1,
-0.8486719, 0.7794272, 0.8823459, 1, 1, 1, 1, 1,
-0.8445011, 1.285916, -1.317573, 1, 1, 1, 1, 1,
-0.8427488, -0.1899987, -2.79283, 0, 0, 1, 1, 1,
-0.8411585, -0.4031097, -0.6825191, 1, 0, 0, 1, 1,
-0.8373222, -0.3204449, -1.347481, 1, 0, 0, 1, 1,
-0.8196618, 1.162888, 0.8548472, 1, 0, 0, 1, 1,
-0.8157535, 1.645861, 1.168228, 1, 0, 0, 1, 1,
-0.8127673, -0.2661406, -0.7001436, 1, 0, 0, 1, 1,
-0.8123575, -0.7891098, -4.861812, 0, 0, 0, 1, 1,
-0.8026129, -1.068676, -1.743918, 0, 0, 0, 1, 1,
-0.7988207, 1.208669, 0.6985076, 0, 0, 0, 1, 1,
-0.7896355, -0.3300783, -0.3548524, 0, 0, 0, 1, 1,
-0.7878392, 0.2934557, -0.6568433, 0, 0, 0, 1, 1,
-0.7842985, -0.8392875, -4.347389, 0, 0, 0, 1, 1,
-0.7837726, 1.281378, -2.048175, 0, 0, 0, 1, 1,
-0.7825683, 0.6786913, -2.327781, 1, 1, 1, 1, 1,
-0.7812925, -1.597591, -3.614323, 1, 1, 1, 1, 1,
-0.7667605, 0.7131962, 1.497575, 1, 1, 1, 1, 1,
-0.7596822, -1.958378, -2.734012, 1, 1, 1, 1, 1,
-0.7586253, -0.5019395, -3.215817, 1, 1, 1, 1, 1,
-0.7573456, 0.5998806, 0.007901923, 1, 1, 1, 1, 1,
-0.7554572, 1.021735, -0.03612772, 1, 1, 1, 1, 1,
-0.7545764, 0.6218642, -0.9572846, 1, 1, 1, 1, 1,
-0.7510483, 0.8373727, -1.27489, 1, 1, 1, 1, 1,
-0.748581, 1.424001, 0.2799073, 1, 1, 1, 1, 1,
-0.7467055, -1.479246, -3.244749, 1, 1, 1, 1, 1,
-0.7464828, 1.081617, -0.4140896, 1, 1, 1, 1, 1,
-0.7452427, -0.6494439, -2.998195, 1, 1, 1, 1, 1,
-0.7450643, 0.7545578, -1.041092, 1, 1, 1, 1, 1,
-0.7411688, 0.289483, -1.741176, 1, 1, 1, 1, 1,
-0.7406904, -0.2056519, -0.6645627, 0, 0, 1, 1, 1,
-0.7344725, 0.6011888, -1.320855, 1, 0, 0, 1, 1,
-0.7320263, 0.04326358, -1.986569, 1, 0, 0, 1, 1,
-0.7305873, 0.09847519, -0.3205388, 1, 0, 0, 1, 1,
-0.7281671, -0.308357, -3.575745, 1, 0, 0, 1, 1,
-0.7276157, -1.594069, -2.831433, 1, 0, 0, 1, 1,
-0.7250338, 0.04836876, -2.594726, 0, 0, 0, 1, 1,
-0.7239708, 0.5438103, -0.1728273, 0, 0, 0, 1, 1,
-0.7208479, 2.440764, 0.2452292, 0, 0, 0, 1, 1,
-0.718239, -0.100869, -1.534756, 0, 0, 0, 1, 1,
-0.7061005, 0.2056862, -1.34752, 0, 0, 0, 1, 1,
-0.7020373, 0.2825276, 0.9984072, 0, 0, 0, 1, 1,
-0.7016921, -0.4727553, -2.574996, 0, 0, 0, 1, 1,
-0.701072, 0.5139456, -0.5915828, 1, 1, 1, 1, 1,
-0.6975591, 0.8104501, -0.9529361, 1, 1, 1, 1, 1,
-0.6947755, 0.7215, -2.421864, 1, 1, 1, 1, 1,
-0.6917844, 0.5566778, -0.02666014, 1, 1, 1, 1, 1,
-0.6826731, -0.2692122, -0.9993294, 1, 1, 1, 1, 1,
-0.6791347, -0.1447674, -2.46521, 1, 1, 1, 1, 1,
-0.6767961, 0.03542012, -0.9651774, 1, 1, 1, 1, 1,
-0.6752413, -1.943405, -1.691543, 1, 1, 1, 1, 1,
-0.6746292, -0.6947841, -2.709572, 1, 1, 1, 1, 1,
-0.6740711, -0.1277814, -1.343704, 1, 1, 1, 1, 1,
-0.6702552, -0.08127581, -1.395907, 1, 1, 1, 1, 1,
-0.6686531, -0.3601314, -1.444729, 1, 1, 1, 1, 1,
-0.6555965, -1.397657, -3.272938, 1, 1, 1, 1, 1,
-0.6530211, -1.030766, -3.269565, 1, 1, 1, 1, 1,
-0.6520935, -0.8229135, -4.247558, 1, 1, 1, 1, 1,
-0.6499602, -0.5275533, -3.692718, 0, 0, 1, 1, 1,
-0.6494102, -1.134677, -2.177122, 1, 0, 0, 1, 1,
-0.6442456, -0.6135061, -2.541716, 1, 0, 0, 1, 1,
-0.6432859, 0.8851455, -0.9642572, 1, 0, 0, 1, 1,
-0.6370087, 0.6028547, -0.09677215, 1, 0, 0, 1, 1,
-0.6359746, -0.0148872, -3.104322, 1, 0, 0, 1, 1,
-0.6321915, 0.9711057, -0.731025, 0, 0, 0, 1, 1,
-0.6295131, -0.2026732, -1.584321, 0, 0, 0, 1, 1,
-0.6255735, -0.8508044, -1.924354, 0, 0, 0, 1, 1,
-0.624798, -0.04636254, -1.842243, 0, 0, 0, 1, 1,
-0.6190972, -0.03013767, -3.702681, 0, 0, 0, 1, 1,
-0.6170096, 1.602618, 0.03546721, 0, 0, 0, 1, 1,
-0.6158422, -0.6656132, -2.443192, 0, 0, 0, 1, 1,
-0.6146889, 0.6309215, 0.5829101, 1, 1, 1, 1, 1,
-0.6129878, 0.4143341, -2.354994, 1, 1, 1, 1, 1,
-0.6120844, -0.2626768, -1.985586, 1, 1, 1, 1, 1,
-0.6104745, 1.629821, 0.0393943, 1, 1, 1, 1, 1,
-0.6097283, 0.8797342, -0.06017365, 1, 1, 1, 1, 1,
-0.608659, -0.2651426, -0.4214732, 1, 1, 1, 1, 1,
-0.6051643, -0.5257414, -2.599989, 1, 1, 1, 1, 1,
-0.6047856, -0.1044018, -3.03456, 1, 1, 1, 1, 1,
-0.6009334, 1.486583, -1.834702, 1, 1, 1, 1, 1,
-0.5997633, -0.4559592, -4.544697, 1, 1, 1, 1, 1,
-0.5991004, 1.333178, 0.5584585, 1, 1, 1, 1, 1,
-0.594551, -1.422304, -1.517636, 1, 1, 1, 1, 1,
-0.591771, -0.05547956, -1.960859, 1, 1, 1, 1, 1,
-0.5891787, -1.600071, -2.634511, 1, 1, 1, 1, 1,
-0.5794882, -0.4846738, -2.237683, 1, 1, 1, 1, 1,
-0.5783333, -1.410477, -2.522384, 0, 0, 1, 1, 1,
-0.5731213, -1.769935, -2.472381, 1, 0, 0, 1, 1,
-0.5694662, 0.04810711, -1.465861, 1, 0, 0, 1, 1,
-0.5675007, 1.641255, -0.6124114, 1, 0, 0, 1, 1,
-0.5619255, -0.09590223, -3.570525, 1, 0, 0, 1, 1,
-0.5601683, -1.412348, -3.479851, 1, 0, 0, 1, 1,
-0.5601391, -1.634921, -2.446501, 0, 0, 0, 1, 1,
-0.5601391, -1.404836, -1.827826, 0, 0, 0, 1, 1,
-0.5593918, -0.03372442, -0.1015272, 0, 0, 0, 1, 1,
-0.5560938, 0.2587579, 0.6543704, 0, 0, 0, 1, 1,
-0.5545, -1.56687, -3.213345, 0, 0, 0, 1, 1,
-0.5501564, 0.6141354, 0.2353523, 0, 0, 0, 1, 1,
-0.548429, 0.1992174, -2.577223, 0, 0, 0, 1, 1,
-0.548171, 0.01187697, -0.1288791, 1, 1, 1, 1, 1,
-0.5449623, -1.758788, -3.450467, 1, 1, 1, 1, 1,
-0.5445512, 0.02996196, 0.08064749, 1, 1, 1, 1, 1,
-0.5440097, -0.5183877, -3.979349, 1, 1, 1, 1, 1,
-0.5419065, -0.282053, -2.399713, 1, 1, 1, 1, 1,
-0.540199, 0.3219881, 0.2818336, 1, 1, 1, 1, 1,
-0.5353966, -0.6064258, -0.851485, 1, 1, 1, 1, 1,
-0.5328711, 0.2363914, -0.8291079, 1, 1, 1, 1, 1,
-0.5326477, 0.7810478, -1.804896, 1, 1, 1, 1, 1,
-0.5305724, 0.5288121, -0.6929388, 1, 1, 1, 1, 1,
-0.529993, -0.2496318, -1.858112, 1, 1, 1, 1, 1,
-0.5256104, 1.181749, -0.7888492, 1, 1, 1, 1, 1,
-0.5240498, -1.802933, -2.081716, 1, 1, 1, 1, 1,
-0.5236958, 0.3538955, -0.3314244, 1, 1, 1, 1, 1,
-0.5202686, 0.06984406, 0.1072761, 1, 1, 1, 1, 1,
-0.519987, 0.1541097, -1.743428, 0, 0, 1, 1, 1,
-0.5186769, 1.590733, 1.430238, 1, 0, 0, 1, 1,
-0.5184095, -0.7105008, -3.853322, 1, 0, 0, 1, 1,
-0.5165229, -0.7402362, -2.765787, 1, 0, 0, 1, 1,
-0.5137901, 0.2377869, -1.653538, 1, 0, 0, 1, 1,
-0.51046, -1.407242, -2.470641, 1, 0, 0, 1, 1,
-0.5099395, 1.661032, -0.7245664, 0, 0, 0, 1, 1,
-0.5096151, -0.682314, -3.232403, 0, 0, 0, 1, 1,
-0.5092302, -0.7638479, -3.180728, 0, 0, 0, 1, 1,
-0.5090587, 1.56238, 0.8177392, 0, 0, 0, 1, 1,
-0.507461, -0.8956369, -1.263666, 0, 0, 0, 1, 1,
-0.5039073, -0.3102051, -2.039844, 0, 0, 0, 1, 1,
-0.502342, -0.6586832, -2.3429, 0, 0, 0, 1, 1,
-0.4991227, 0.4361208, -1.130245, 1, 1, 1, 1, 1,
-0.4966235, 1.529811, 0.2390529, 1, 1, 1, 1, 1,
-0.4939863, -0.1427336, -1.078529, 1, 1, 1, 1, 1,
-0.4899732, 0.2590244, -0.8488793, 1, 1, 1, 1, 1,
-0.4898747, 0.08482854, -0.9897485, 1, 1, 1, 1, 1,
-0.4866437, 1.187501, -0.3642902, 1, 1, 1, 1, 1,
-0.4863034, 0.1669071, -1.444487, 1, 1, 1, 1, 1,
-0.4815705, -1.704146, -2.941617, 1, 1, 1, 1, 1,
-0.4808839, 0.3415442, -0.417528, 1, 1, 1, 1, 1,
-0.4808606, 0.879371, -0.4854883, 1, 1, 1, 1, 1,
-0.4807693, -0.1790589, -1.831008, 1, 1, 1, 1, 1,
-0.4758723, -1.136772, -3.111996, 1, 1, 1, 1, 1,
-0.4686704, 1.811171, 0.07979413, 1, 1, 1, 1, 1,
-0.4659491, 0.3315529, -1.840297, 1, 1, 1, 1, 1,
-0.4649398, -0.2266509, -2.192728, 1, 1, 1, 1, 1,
-0.463709, 1.78935, -0.2055065, 0, 0, 1, 1, 1,
-0.4615417, 0.9865251, -0.150026, 1, 0, 0, 1, 1,
-0.4609278, 2.249624, -0.4009653, 1, 0, 0, 1, 1,
-0.4608746, -0.4190575, -2.264347, 1, 0, 0, 1, 1,
-0.4593331, 0.4693726, -1.716171, 1, 0, 0, 1, 1,
-0.4589651, 0.6138645, -1.878231, 1, 0, 0, 1, 1,
-0.4556567, 0.6118516, -0.7023438, 0, 0, 0, 1, 1,
-0.4555154, -0.1005849, -0.9920904, 0, 0, 0, 1, 1,
-0.4443361, -0.4342493, -3.229558, 0, 0, 0, 1, 1,
-0.443642, 0.1590997, 0.8928415, 0, 0, 0, 1, 1,
-0.4425139, -0.6189387, -3.531402, 0, 0, 0, 1, 1,
-0.4409297, -1.531009, -2.705062, 0, 0, 0, 1, 1,
-0.4384978, 1.801912, 0.5804733, 0, 0, 0, 1, 1,
-0.4358345, -1.215773, -2.47623, 1, 1, 1, 1, 1,
-0.4321005, 1.591784, -1.147632, 1, 1, 1, 1, 1,
-0.4315204, 0.2514028, -0.7761999, 1, 1, 1, 1, 1,
-0.428574, -0.07018294, -0.3336642, 1, 1, 1, 1, 1,
-0.4220444, 0.05800803, 0.2080785, 1, 1, 1, 1, 1,
-0.4161189, -0.6506688, -2.955011, 1, 1, 1, 1, 1,
-0.4155529, 0.3069925, -0.6886372, 1, 1, 1, 1, 1,
-0.4114274, -0.3285896, -4.609179, 1, 1, 1, 1, 1,
-0.4074394, 0.6541553, 0.2557001, 1, 1, 1, 1, 1,
-0.4064003, 1.60538, 1.428191, 1, 1, 1, 1, 1,
-0.4053225, 0.1401227, 0.4436615, 1, 1, 1, 1, 1,
-0.3998585, 0.5901219, -2.117281, 1, 1, 1, 1, 1,
-0.3994702, 1.054021, -0.2540486, 1, 1, 1, 1, 1,
-0.399042, 0.9971071, -0.09964553, 1, 1, 1, 1, 1,
-0.3961045, 1.844907, -0.2342012, 1, 1, 1, 1, 1,
-0.395612, -1.543226, -4.126999, 0, 0, 1, 1, 1,
-0.394278, -0.130006, -1.417771, 1, 0, 0, 1, 1,
-0.3939779, 2.074179, -1.465546, 1, 0, 0, 1, 1,
-0.3928197, 1.327001, -0.9152508, 1, 0, 0, 1, 1,
-0.3925816, -0.7883804, -3.026011, 1, 0, 0, 1, 1,
-0.3920433, 0.376489, 0.7991793, 1, 0, 0, 1, 1,
-0.387412, 0.2135914, -1.250878, 0, 0, 0, 1, 1,
-0.3847838, -0.02482026, -0.7464321, 0, 0, 0, 1, 1,
-0.3788073, -0.9198793, -2.744322, 0, 0, 0, 1, 1,
-0.3732316, -1.284728, -2.270299, 0, 0, 0, 1, 1,
-0.3731428, -1.626998, -3.02548, 0, 0, 0, 1, 1,
-0.3677132, -0.280362, -3.215942, 0, 0, 0, 1, 1,
-0.3669711, 0.6257234, -1.534078, 0, 0, 0, 1, 1,
-0.3646414, -1.005679, -3.65799, 1, 1, 1, 1, 1,
-0.3617024, -0.8122435, -2.620389, 1, 1, 1, 1, 1,
-0.3485879, 0.4500095, 0.003022619, 1, 1, 1, 1, 1,
-0.3468334, -0.4054303, -1.468735, 1, 1, 1, 1, 1,
-0.3467645, -0.9434888, -4.955229, 1, 1, 1, 1, 1,
-0.3426619, -0.1929034, -2.004051, 1, 1, 1, 1, 1,
-0.34041, -0.792765, -3.662638, 1, 1, 1, 1, 1,
-0.3320836, 0.4221023, -1.176309, 1, 1, 1, 1, 1,
-0.3298429, -1.756431, -2.73595, 1, 1, 1, 1, 1,
-0.3282422, 0.3431499, -1.130482, 1, 1, 1, 1, 1,
-0.3242726, -0.4109721, -1.430143, 1, 1, 1, 1, 1,
-0.323805, 0.2187126, -1.050511, 1, 1, 1, 1, 1,
-0.3148529, -1.550174, -2.347066, 1, 1, 1, 1, 1,
-0.3133698, -1.216634, -1.419171, 1, 1, 1, 1, 1,
-0.3132681, -0.7426884, -1.888474, 1, 1, 1, 1, 1,
-0.3128001, 0.9262305, -0.1056623, 0, 0, 1, 1, 1,
-0.3103301, 0.5165167, -2.289965, 1, 0, 0, 1, 1,
-0.3087501, 0.01369218, -1.607831, 1, 0, 0, 1, 1,
-0.3062215, -1.406375, -2.199353, 1, 0, 0, 1, 1,
-0.3027912, -0.1806909, -2.041424, 1, 0, 0, 1, 1,
-0.3014367, 0.7819712, -0.9924425, 1, 0, 0, 1, 1,
-0.3004875, -0.6521257, -0.2880824, 0, 0, 0, 1, 1,
-0.2996247, 1.4793, 0.5134438, 0, 0, 0, 1, 1,
-0.2921763, -0.6122309, -2.229519, 0, 0, 0, 1, 1,
-0.2883849, -0.4266738, -2.338962, 0, 0, 0, 1, 1,
-0.2876595, -1.976172, -2.425704, 0, 0, 0, 1, 1,
-0.2829365, -0.8466213, -3.89075, 0, 0, 0, 1, 1,
-0.2786868, 0.4281359, -0.3892568, 0, 0, 0, 1, 1,
-0.2732883, -0.5462426, -2.642604, 1, 1, 1, 1, 1,
-0.2717218, 0.3092341, 0.01328396, 1, 1, 1, 1, 1,
-0.2694699, 0.1926724, -2.402481, 1, 1, 1, 1, 1,
-0.2681426, -0.1232525, -2.17446, 1, 1, 1, 1, 1,
-0.2669185, 1.405852, -0.9540455, 1, 1, 1, 1, 1,
-0.2645649, 1.042626, -0.3801634, 1, 1, 1, 1, 1,
-0.2643691, -0.007951339, 0.3958954, 1, 1, 1, 1, 1,
-0.2634836, -0.4316781, -2.754497, 1, 1, 1, 1, 1,
-0.2582558, -0.1700361, -2.524142, 1, 1, 1, 1, 1,
-0.2550841, -0.374623, -2.417003, 1, 1, 1, 1, 1,
-0.2481971, -0.9043539, -2.874893, 1, 1, 1, 1, 1,
-0.247937, 1.316377, -0.1616703, 1, 1, 1, 1, 1,
-0.246338, 2.231372, -0.8810894, 1, 1, 1, 1, 1,
-0.2446565, -0.9258265, -1.984463, 1, 1, 1, 1, 1,
-0.2413237, 0.9412025, -0.8266269, 1, 1, 1, 1, 1,
-0.2365787, -1.744236, -4.182586, 0, 0, 1, 1, 1,
-0.2345793, 1.179036, -0.7630261, 1, 0, 0, 1, 1,
-0.2333176, -0.105886, -3.022639, 1, 0, 0, 1, 1,
-0.2326173, -0.3860698, -0.7041611, 1, 0, 0, 1, 1,
-0.2287253, -0.1812364, -1.746159, 1, 0, 0, 1, 1,
-0.2278161, -1.108168, -3.530854, 1, 0, 0, 1, 1,
-0.2155955, 0.6600118, -1.733867, 0, 0, 0, 1, 1,
-0.2140198, -1.521541, -4.257805, 0, 0, 0, 1, 1,
-0.2101255, -1.069706, -3.628595, 0, 0, 0, 1, 1,
-0.2097765, 0.8960701, -0.4172795, 0, 0, 0, 1, 1,
-0.2050598, 0.9493076, 0.6431375, 0, 0, 0, 1, 1,
-0.2028081, -1.114694, -3.093032, 0, 0, 0, 1, 1,
-0.2018396, -0.3332195, -1.606399, 0, 0, 0, 1, 1,
-0.2009725, -0.1392002, -2.159873, 1, 1, 1, 1, 1,
-0.1961967, -0.05420295, -4.199816, 1, 1, 1, 1, 1,
-0.1942331, 2.005612, -0.05851201, 1, 1, 1, 1, 1,
-0.1942267, 0.2978759, 0.2092609, 1, 1, 1, 1, 1,
-0.1892484, -0.3986277, -2.499527, 1, 1, 1, 1, 1,
-0.1875589, 0.4143834, -0.5965335, 1, 1, 1, 1, 1,
-0.1869133, -0.6082287, -3.586575, 1, 1, 1, 1, 1,
-0.1842241, 1.953287, -0.2036288, 1, 1, 1, 1, 1,
-0.1837217, -0.4788362, -2.084399, 1, 1, 1, 1, 1,
-0.1829361, 0.8949766, 0.2762538, 1, 1, 1, 1, 1,
-0.1828184, 0.6178071, -0.03474685, 1, 1, 1, 1, 1,
-0.1822472, -1.358839, -1.855689, 1, 1, 1, 1, 1,
-0.1822359, 0.6822758, -2.091907, 1, 1, 1, 1, 1,
-0.1816844, -1.179334, -2.466987, 1, 1, 1, 1, 1,
-0.1769847, 0.6534768, -1.265001, 1, 1, 1, 1, 1,
-0.1763911, -0.2008954, -1.960843, 0, 0, 1, 1, 1,
-0.1741458, 0.4990281, -1.153347, 1, 0, 0, 1, 1,
-0.1683012, -0.4634786, -2.509374, 1, 0, 0, 1, 1,
-0.1633719, -1.493387, -3.178153, 1, 0, 0, 1, 1,
-0.1496849, 1.244611, -0.5714154, 1, 0, 0, 1, 1,
-0.1470828, 0.977208, 1.339999, 1, 0, 0, 1, 1,
-0.1465981, 2.509508, -0.4528856, 0, 0, 0, 1, 1,
-0.1456502, 0.9120187, 1.674812, 0, 0, 0, 1, 1,
-0.1452385, -0.2665102, -2.549709, 0, 0, 0, 1, 1,
-0.1375444, -0.6143669, -3.697703, 0, 0, 0, 1, 1,
-0.1324518, 0.08463294, -0.3089706, 0, 0, 0, 1, 1,
-0.1314067, 1.368671, -0.1401914, 0, 0, 0, 1, 1,
-0.1303962, -0.2842613, -2.973788, 0, 0, 0, 1, 1,
-0.1294575, -0.1585748, -1.865772, 1, 1, 1, 1, 1,
-0.1269898, -0.4059776, -2.992478, 1, 1, 1, 1, 1,
-0.122237, 0.07871375, -1.357247, 1, 1, 1, 1, 1,
-0.1161857, 0.7334596, 0.1530121, 1, 1, 1, 1, 1,
-0.1149051, -0.8057031, -4.701001, 1, 1, 1, 1, 1,
-0.1075573, 1.221951, 0.07263412, 1, 1, 1, 1, 1,
-0.1070364, -0.4107599, -2.800592, 1, 1, 1, 1, 1,
-0.1064758, 2.326158, -0.4878439, 1, 1, 1, 1, 1,
-0.1047358, -0.5653966, -2.851645, 1, 1, 1, 1, 1,
-0.09914025, 1.217965, 0.5521976, 1, 1, 1, 1, 1,
-0.09855253, 0.6763961, -0.559849, 1, 1, 1, 1, 1,
-0.09258885, 0.07462295, -0.2713355, 1, 1, 1, 1, 1,
-0.09045233, -0.4472128, -2.830822, 1, 1, 1, 1, 1,
-0.08432654, -0.1879984, -1.461806, 1, 1, 1, 1, 1,
-0.08334343, 0.7713544, -0.0192051, 1, 1, 1, 1, 1,
-0.07818095, -0.0531204, -1.97087, 0, 0, 1, 1, 1,
-0.0780246, 0.5673704, -1.46977, 1, 0, 0, 1, 1,
-0.07601221, 0.3808812, -0.6335998, 1, 0, 0, 1, 1,
-0.07372483, 1.269073, -0.0002783427, 1, 0, 0, 1, 1,
-0.06283865, -0.7056872, -4.941236, 1, 0, 0, 1, 1,
-0.06175109, -0.4654971, -3.788323, 1, 0, 0, 1, 1,
-0.05758671, -1.892165, -3.039537, 0, 0, 0, 1, 1,
-0.0574293, -0.3248779, -4.034673, 0, 0, 0, 1, 1,
-0.05627863, 1.158233, -2.584541, 0, 0, 0, 1, 1,
-0.05625306, -1.6813, -1.737873, 0, 0, 0, 1, 1,
-0.05282012, 0.2842114, -0.6886131, 0, 0, 0, 1, 1,
-0.05090775, -0.2770218, -3.005027, 0, 0, 0, 1, 1,
-0.04775135, 0.4866984, -1.048345, 0, 0, 0, 1, 1,
-0.04771319, -0.3682436, -4.573086, 1, 1, 1, 1, 1,
-0.04267545, 0.1376909, 0.2550181, 1, 1, 1, 1, 1,
-0.03492592, 1.637262, -0.3112231, 1, 1, 1, 1, 1,
-0.03420978, -0.8966686, -3.942301, 1, 1, 1, 1, 1,
-0.03401008, -0.2244968, -2.119508, 1, 1, 1, 1, 1,
-0.03107502, 0.04175695, -1.229622, 1, 1, 1, 1, 1,
-0.02858553, -1.084624, -2.602948, 1, 1, 1, 1, 1,
-0.02844037, 0.0267444, -0.1502766, 1, 1, 1, 1, 1,
-0.02749764, 0.1368295, -2.255152, 1, 1, 1, 1, 1,
-0.02472023, 0.3522319, -1.803543, 1, 1, 1, 1, 1,
-0.01873635, 0.7909984, 0.04652581, 1, 1, 1, 1, 1,
-0.01699154, 0.4066865, 0.8715048, 1, 1, 1, 1, 1,
-0.01374426, -0.05721157, -2.342714, 1, 1, 1, 1, 1,
-0.01358972, -0.9155231, -4.026207, 1, 1, 1, 1, 1,
-0.01288072, -0.5142999, -3.296815, 1, 1, 1, 1, 1,
-0.01017135, -1.343978, -1.747812, 0, 0, 1, 1, 1,
-0.009398083, -0.1194455, -2.655452, 1, 0, 0, 1, 1,
-0.008473068, -2.028921, -3.016363, 1, 0, 0, 1, 1,
-0.008224036, 0.6802582, -0.7664939, 1, 0, 0, 1, 1,
-0.007591717, 0.7420678, -0.2834743, 1, 0, 0, 1, 1,
-0.003830836, 1.473057, 0.2573527, 1, 0, 0, 1, 1,
-0.002449243, 0.485526, 1.287899, 0, 0, 0, 1, 1,
-0.00100864, 1.081892, -0.6043092, 0, 0, 0, 1, 1,
0.002562833, 0.1575669, -0.6363392, 0, 0, 0, 1, 1,
0.008344874, 0.3919668, 0.3189133, 0, 0, 0, 1, 1,
0.01167357, -0.8897666, 3.915278, 0, 0, 0, 1, 1,
0.01172053, -0.2900446, 3.209916, 0, 0, 0, 1, 1,
0.01211679, 0.7389599, 0.1926351, 0, 0, 0, 1, 1,
0.01607593, 1.029295, 1.146744, 1, 1, 1, 1, 1,
0.0226166, 1.414025, 2.773574, 1, 1, 1, 1, 1,
0.02379088, -0.2577997, 3.401915, 1, 1, 1, 1, 1,
0.02742951, -1.197089, 3.503048, 1, 1, 1, 1, 1,
0.02902523, 2.252661, 1.617045, 1, 1, 1, 1, 1,
0.02943666, 0.3065662, -1.458896, 1, 1, 1, 1, 1,
0.03446779, -0.4124471, 2.273579, 1, 1, 1, 1, 1,
0.03502323, 0.3575784, 0.1738172, 1, 1, 1, 1, 1,
0.03969995, -0.01757853, 2.809941, 1, 1, 1, 1, 1,
0.04008771, 0.003720984, 1.284228, 1, 1, 1, 1, 1,
0.04488078, -0.007873595, 1.396377, 1, 1, 1, 1, 1,
0.04578993, -0.6680139, 2.933244, 1, 1, 1, 1, 1,
0.04676468, -0.9699083, 2.79912, 1, 1, 1, 1, 1,
0.0467971, -0.4386007, 3.594677, 1, 1, 1, 1, 1,
0.05369748, -0.1060069, 3.946963, 1, 1, 1, 1, 1,
0.06863334, 0.8727182, 0.1985209, 0, 0, 1, 1, 1,
0.07285051, -0.1438038, 2.614946, 1, 0, 0, 1, 1,
0.07325988, -0.522451, 2.040461, 1, 0, 0, 1, 1,
0.0744824, 0.9139268, -0.1690578, 1, 0, 0, 1, 1,
0.07486726, 0.4440273, -0.3674891, 1, 0, 0, 1, 1,
0.07609405, -2.797555, 4.602198, 1, 0, 0, 1, 1,
0.08236312, 2.033115, -0.3314882, 0, 0, 0, 1, 1,
0.08834581, 0.6069003, 0.08763086, 0, 0, 0, 1, 1,
0.08854728, -1.446794, 3.319876, 0, 0, 0, 1, 1,
0.08966278, 1.550669, 1.437014, 0, 0, 0, 1, 1,
0.09026907, 1.084269, 1.834765, 0, 0, 0, 1, 1,
0.09033231, 0.04259398, 1.307976, 0, 0, 0, 1, 1,
0.09044824, -0.01518408, 2.147971, 0, 0, 0, 1, 1,
0.1009096, 1.693905, 0.9115245, 1, 1, 1, 1, 1,
0.1023715, 0.7589025, -0.520651, 1, 1, 1, 1, 1,
0.1055215, -1.180645, 2.540692, 1, 1, 1, 1, 1,
0.1059991, 0.2045287, 1.535635, 1, 1, 1, 1, 1,
0.1069249, 0.838513, -0.5606119, 1, 1, 1, 1, 1,
0.1077253, -1.219568, 2.752701, 1, 1, 1, 1, 1,
0.1097597, -0.1666041, 1.59036, 1, 1, 1, 1, 1,
0.1113932, 0.4146024, 0.3077391, 1, 1, 1, 1, 1,
0.1127575, 1.197439, 2.864301, 1, 1, 1, 1, 1,
0.1197597, 0.08677205, 0.4567192, 1, 1, 1, 1, 1,
0.1203524, 1.107476, -0.1069693, 1, 1, 1, 1, 1,
0.1228609, 0.6646333, 0.4083171, 1, 1, 1, 1, 1,
0.1279463, 0.5865112, -0.1117517, 1, 1, 1, 1, 1,
0.1316277, -0.7367541, 2.988524, 1, 1, 1, 1, 1,
0.1355642, -0.8194438, 4.380059, 1, 1, 1, 1, 1,
0.1379712, -0.5964097, 4.501281, 0, 0, 1, 1, 1,
0.1393048, -0.006583977, 2.003993, 1, 0, 0, 1, 1,
0.1431617, 0.426863, -0.9764515, 1, 0, 0, 1, 1,
0.1436499, 0.3676129, 0.7406224, 1, 0, 0, 1, 1,
0.1474498, 0.3458416, 1.838916, 1, 0, 0, 1, 1,
0.1476381, -1.048303, 2.133954, 1, 0, 0, 1, 1,
0.149073, -0.1487535, 4.9279, 0, 0, 0, 1, 1,
0.1496236, -0.8618341, 3.740059, 0, 0, 0, 1, 1,
0.1518852, -0.2391778, 1.936689, 0, 0, 0, 1, 1,
0.1523043, -0.2390408, 1.672039, 0, 0, 0, 1, 1,
0.152749, 0.8609146, -0.02445504, 0, 0, 0, 1, 1,
0.1573396, 0.3535828, -0.4687741, 0, 0, 0, 1, 1,
0.1575698, -2.302646, 3.65568, 0, 0, 0, 1, 1,
0.1591279, 0.3286951, 0.2757003, 1, 1, 1, 1, 1,
0.1595252, 1.639007, 0.2819785, 1, 1, 1, 1, 1,
0.160035, -0.3575034, 3.822256, 1, 1, 1, 1, 1,
0.1611883, -0.8001958, 2.554516, 1, 1, 1, 1, 1,
0.1652856, 0.1493758, -0.3856798, 1, 1, 1, 1, 1,
0.1727458, 0.1525093, 1.554253, 1, 1, 1, 1, 1,
0.173051, 1.92947, 1.134028, 1, 1, 1, 1, 1,
0.1739981, 2.646167, 1.831894, 1, 1, 1, 1, 1,
0.1745499, -1.04369, 1.652724, 1, 1, 1, 1, 1,
0.1779954, -1.194802, 2.338786, 1, 1, 1, 1, 1,
0.1783126, 0.455833, 1.144858, 1, 1, 1, 1, 1,
0.1801534, -0.1218816, 2.348593, 1, 1, 1, 1, 1,
0.1806797, -1.297493, 3.862074, 1, 1, 1, 1, 1,
0.1902603, 1.917141, -0.1897763, 1, 1, 1, 1, 1,
0.1962274, 0.4962189, 0.07999532, 1, 1, 1, 1, 1,
0.1998788, -1.00344, 3.064906, 0, 0, 1, 1, 1,
0.2022026, 0.2183925, 0.2754813, 1, 0, 0, 1, 1,
0.2032323, -1.166843, 2.503429, 1, 0, 0, 1, 1,
0.2033738, -0.4726287, 2.573797, 1, 0, 0, 1, 1,
0.2162955, 0.8462219, -0.4036373, 1, 0, 0, 1, 1,
0.2173048, 0.3060023, -0.354759, 1, 0, 0, 1, 1,
0.2217107, 0.4479202, -0.4856603, 0, 0, 0, 1, 1,
0.2223788, -0.9213227, 3.244648, 0, 0, 0, 1, 1,
0.2237939, 0.4065584, 1.713507, 0, 0, 0, 1, 1,
0.2273584, 0.8783581, 0.947539, 0, 0, 0, 1, 1,
0.2308912, -0.4737043, 3.01948, 0, 0, 0, 1, 1,
0.2315802, 0.4275916, 0.6048061, 0, 0, 0, 1, 1,
0.2323878, 0.6669289, 0.9262093, 0, 0, 0, 1, 1,
0.2376116, -1.327891, 4.505863, 1, 1, 1, 1, 1,
0.240331, -0.9141851, 1.515002, 1, 1, 1, 1, 1,
0.2496096, 1.549731, 1.561072, 1, 1, 1, 1, 1,
0.2506016, -0.8492912, 3.500269, 1, 1, 1, 1, 1,
0.2530411, 1.106849, 0.951718, 1, 1, 1, 1, 1,
0.2535017, -0.9748789, 4.012634, 1, 1, 1, 1, 1,
0.2553495, 0.1203764, 3.071096, 1, 1, 1, 1, 1,
0.2559147, 1.23607, 0.9139568, 1, 1, 1, 1, 1,
0.2572987, 0.7750172, 1.859573, 1, 1, 1, 1, 1,
0.259592, 0.1501475, -0.02080223, 1, 1, 1, 1, 1,
0.2611297, 2.35251, 0.330785, 1, 1, 1, 1, 1,
0.2650224, -2.042073, 2.643751, 1, 1, 1, 1, 1,
0.2684155, 1.793739, -0.2828814, 1, 1, 1, 1, 1,
0.2703997, -0.8561959, 3.836551, 1, 1, 1, 1, 1,
0.2717126, 0.542625, 1.300403, 1, 1, 1, 1, 1,
0.2762783, -0.001114102, 2.465673, 0, 0, 1, 1, 1,
0.2808327, 1.294096, 0.9735745, 1, 0, 0, 1, 1,
0.281867, 0.2814498, -0.7317542, 1, 0, 0, 1, 1,
0.2850844, 0.8678071, -1.609192, 1, 0, 0, 1, 1,
0.2855258, 0.5090176, 0.2479347, 1, 0, 0, 1, 1,
0.2968554, 0.9722716, -0.6025046, 1, 0, 0, 1, 1,
0.2970994, 0.8524833, -0.3561346, 0, 0, 0, 1, 1,
0.2987694, -1.314438, 4.075614, 0, 0, 0, 1, 1,
0.3014749, -0.5540803, 2.876427, 0, 0, 0, 1, 1,
0.3028655, 0.1141892, 1.867123, 0, 0, 0, 1, 1,
0.3040663, 0.7815914, 1.416619, 0, 0, 0, 1, 1,
0.3049341, 1.896909, 0.2615402, 0, 0, 0, 1, 1,
0.3094126, -2.331255, 2.38318, 0, 0, 0, 1, 1,
0.3095101, -0.2059711, 3.036846, 1, 1, 1, 1, 1,
0.3188582, 0.06393686, 0.8055727, 1, 1, 1, 1, 1,
0.3239844, 0.9977208, 0.5423435, 1, 1, 1, 1, 1,
0.3249631, 0.6651704, 0.3205633, 1, 1, 1, 1, 1,
0.3265808, -2.121025, 1.756189, 1, 1, 1, 1, 1,
0.3279042, 1.074999, 2.293768, 1, 1, 1, 1, 1,
0.331586, -1.031601, 2.821697, 1, 1, 1, 1, 1,
0.3338125, -0.7734959, 2.820618, 1, 1, 1, 1, 1,
0.3340762, -0.3955342, 1.341316, 1, 1, 1, 1, 1,
0.3362847, -0.4126011, 0.1628021, 1, 1, 1, 1, 1,
0.337019, -0.1318308, 1.178956, 1, 1, 1, 1, 1,
0.3387432, 0.4868389, 1.319231, 1, 1, 1, 1, 1,
0.3561256, -0.4405033, 1.958039, 1, 1, 1, 1, 1,
0.356133, 0.00432844, 0.6808321, 1, 1, 1, 1, 1,
0.3571597, -0.9478751, 2.411445, 1, 1, 1, 1, 1,
0.357905, 1.153529, -0.4965568, 0, 0, 1, 1, 1,
0.3582815, 0.8613401, 0.1373309, 1, 0, 0, 1, 1,
0.3587852, 0.1930037, 0.6664446, 1, 0, 0, 1, 1,
0.3605815, -1.074096, 3.837953, 1, 0, 0, 1, 1,
0.3612572, -0.6876029, 3.409111, 1, 0, 0, 1, 1,
0.3614988, 1.949325, 0.4610682, 1, 0, 0, 1, 1,
0.3617095, -1.874885, 2.885089, 0, 0, 0, 1, 1,
0.3623965, 0.59431, 0.5659115, 0, 0, 0, 1, 1,
0.3629434, -1.644664, 2.384706, 0, 0, 0, 1, 1,
0.3634976, 1.446322, -0.5157181, 0, 0, 0, 1, 1,
0.3701238, 0.122093, 0.3754627, 0, 0, 0, 1, 1,
0.3712132, -0.8982911, 2.673388, 0, 0, 0, 1, 1,
0.3715639, -1.937817, 1.730327, 0, 0, 0, 1, 1,
0.3766166, 0.6599221, -1.04846, 1, 1, 1, 1, 1,
0.3790364, -0.3508255, 2.37722, 1, 1, 1, 1, 1,
0.37906, -0.4796449, 1.920879, 1, 1, 1, 1, 1,
0.3836327, 1.606079, -0.602309, 1, 1, 1, 1, 1,
0.3841691, -0.08810384, 2.951137, 1, 1, 1, 1, 1,
0.3856024, -0.05566787, 1.334798, 1, 1, 1, 1, 1,
0.388, -1.63792, 4.653409, 1, 1, 1, 1, 1,
0.3894548, 0.9155973, -0.3067497, 1, 1, 1, 1, 1,
0.3907619, -0.4306749, 1.894955, 1, 1, 1, 1, 1,
0.3924947, -0.03243302, 2.370713, 1, 1, 1, 1, 1,
0.393007, -0.3503243, 1.847927, 1, 1, 1, 1, 1,
0.3934503, 1.430865, 1.051651, 1, 1, 1, 1, 1,
0.3942719, -0.2425614, 3.655401, 1, 1, 1, 1, 1,
0.3962392, -0.4021892, 2.227272, 1, 1, 1, 1, 1,
0.3981377, -2.180129, 3.582336, 1, 1, 1, 1, 1,
0.3988285, 0.06890871, 3.164102, 0, 0, 1, 1, 1,
0.4046345, -0.2727213, 2.501258, 1, 0, 0, 1, 1,
0.4118267, 0.7491845, 0.02435781, 1, 0, 0, 1, 1,
0.4212826, 0.861738, -0.5965126, 1, 0, 0, 1, 1,
0.4231274, 0.3456144, -0.6521731, 1, 0, 0, 1, 1,
0.424311, 0.6194942, -0.06853329, 1, 0, 0, 1, 1,
0.4311574, 2.197064, -1.686912, 0, 0, 0, 1, 1,
0.4321334, 0.7430975, -1.781586, 0, 0, 0, 1, 1,
0.4342567, -0.1987825, 0.7047479, 0, 0, 0, 1, 1,
0.4408627, -0.2588631, 1.498619, 0, 0, 0, 1, 1,
0.4413619, 0.6043253, 1.742901, 0, 0, 0, 1, 1,
0.4437357, -1.198596, 2.551584, 0, 0, 0, 1, 1,
0.4455388, 0.9171956, -0.6899956, 0, 0, 0, 1, 1,
0.4473596, 0.356482, 0.9562895, 1, 1, 1, 1, 1,
0.4502245, -0.3475231, 1.164407, 1, 1, 1, 1, 1,
0.4514154, 0.5349486, 0.2697648, 1, 1, 1, 1, 1,
0.4625883, -0.05702193, 2.351852, 1, 1, 1, 1, 1,
0.4644569, -2.860787, 4.776931, 1, 1, 1, 1, 1,
0.4666024, 0.7284207, 1.035176, 1, 1, 1, 1, 1,
0.4671516, 1.273823, -0.1076599, 1, 1, 1, 1, 1,
0.4693938, -0.555509, 3.01182, 1, 1, 1, 1, 1,
0.4714428, -0.3839022, 0.9000638, 1, 1, 1, 1, 1,
0.4765517, 0.2299608, 1.695315, 1, 1, 1, 1, 1,
0.4774378, 1.603948, 0.4812059, 1, 1, 1, 1, 1,
0.4779471, -0.2025892, 1.65335, 1, 1, 1, 1, 1,
0.4790755, 0.2060131, 1.02761, 1, 1, 1, 1, 1,
0.4791001, -2.461475, 1.594857, 1, 1, 1, 1, 1,
0.4824919, -1.337472, 2.277278, 1, 1, 1, 1, 1,
0.4830282, -0.4512863, 2.453271, 0, 0, 1, 1, 1,
0.4841338, -1.853032, 3.984416, 1, 0, 0, 1, 1,
0.4910577, 0.9150537, 1.550506, 1, 0, 0, 1, 1,
0.4942144, -0.8404217, 5.118011, 1, 0, 0, 1, 1,
0.4945457, 1.087791, 0.0935268, 1, 0, 0, 1, 1,
0.4955762, -0.5296236, 2.876627, 1, 0, 0, 1, 1,
0.4980571, 1.094194, 1.025605, 0, 0, 0, 1, 1,
0.502618, 0.1613442, -0.8207374, 0, 0, 0, 1, 1,
0.504943, -1.199035, 3.998428, 0, 0, 0, 1, 1,
0.509322, 0.5889773, 1.330351, 0, 0, 0, 1, 1,
0.5118301, 0.2828072, 0.3643396, 0, 0, 0, 1, 1,
0.5155734, -0.9677293, 2.415916, 0, 0, 0, 1, 1,
0.516109, 1.714242, 0.5096315, 0, 0, 0, 1, 1,
0.5213061, 1.587851, -0.5427154, 1, 1, 1, 1, 1,
0.5213267, 1.584908, -1.179525, 1, 1, 1, 1, 1,
0.5246185, 0.5187756, 1.393121, 1, 1, 1, 1, 1,
0.5259824, 0.1239349, 1.520922, 1, 1, 1, 1, 1,
0.5261265, -1.534569, 3.137325, 1, 1, 1, 1, 1,
0.5264829, 0.3844173, 1.245565, 1, 1, 1, 1, 1,
0.5277019, -0.1387564, 2.417987, 1, 1, 1, 1, 1,
0.5284041, -0.479326, 2.792326, 1, 1, 1, 1, 1,
0.5309018, -0.04675369, 3.70686, 1, 1, 1, 1, 1,
0.535506, 0.6218395, 0.7385545, 1, 1, 1, 1, 1,
0.535749, 0.7591682, 0.2122002, 1, 1, 1, 1, 1,
0.5373501, -0.6116247, 2.384663, 1, 1, 1, 1, 1,
0.5374042, 1.100374, 0.1029147, 1, 1, 1, 1, 1,
0.5382104, -0.3574532, 2.70457, 1, 1, 1, 1, 1,
0.5502213, -0.364252, 1.8473, 1, 1, 1, 1, 1,
0.5643038, -0.4192493, 1.989809, 0, 0, 1, 1, 1,
0.5653679, -0.3625471, 3.465315, 1, 0, 0, 1, 1,
0.5656338, -1.260304, 3.296197, 1, 0, 0, 1, 1,
0.5658033, -0.9246243, 2.607323, 1, 0, 0, 1, 1,
0.5687632, 1.685942, -0.007899386, 1, 0, 0, 1, 1,
0.5700876, 0.7639541, 1.167067, 1, 0, 0, 1, 1,
0.5707734, 1.290754, -0.5338219, 0, 0, 0, 1, 1,
0.5720605, -0.4041636, 0.2255737, 0, 0, 0, 1, 1,
0.5738102, 0.2707812, 0.5051969, 0, 0, 0, 1, 1,
0.5742405, 1.17344, 1.533687, 0, 0, 0, 1, 1,
0.5855953, 0.2688964, 1.16375, 0, 0, 0, 1, 1,
0.5891935, 0.4114915, -0.1953447, 0, 0, 0, 1, 1,
0.5902403, 0.365999, 0.03981348, 0, 0, 0, 1, 1,
0.5929638, 0.78086, 0.3474079, 1, 1, 1, 1, 1,
0.594278, -0.7725093, 2.065923, 1, 1, 1, 1, 1,
0.5959314, -0.1550485, 0.7941485, 1, 1, 1, 1, 1,
0.599982, 0.126433, 0.6133282, 1, 1, 1, 1, 1,
0.6019922, 0.09966999, 3.333551, 1, 1, 1, 1, 1,
0.6024601, 0.5654711, 0.9225332, 1, 1, 1, 1, 1,
0.6033813, -1.874164, 2.131784, 1, 1, 1, 1, 1,
0.6073807, 0.7640041, -0.6012654, 1, 1, 1, 1, 1,
0.6109764, -0.4925739, 1.471568, 1, 1, 1, 1, 1,
0.6218354, 0.7894049, 0.4435723, 1, 1, 1, 1, 1,
0.622235, -0.7685907, 1.15562, 1, 1, 1, 1, 1,
0.6222873, -0.9343973, 1.94697, 1, 1, 1, 1, 1,
0.6259447, -0.4908879, 1.596285, 1, 1, 1, 1, 1,
0.6371334, -1.244598, 3.812605, 1, 1, 1, 1, 1,
0.6386507, 0.3814374, -1.751115, 1, 1, 1, 1, 1,
0.6420726, -1.748567, 2.318453, 0, 0, 1, 1, 1,
0.6423955, -0.5802093, 1.513524, 1, 0, 0, 1, 1,
0.6433846, -1.544661, 1.664889, 1, 0, 0, 1, 1,
0.6441562, -0.8700796, 2.742461, 1, 0, 0, 1, 1,
0.645097, 0.1894536, 0.2005945, 1, 0, 0, 1, 1,
0.6516917, -1.358106, 4.641911, 1, 0, 0, 1, 1,
0.6538123, -1.889111, 1.71624, 0, 0, 0, 1, 1,
0.6565135, 0.8494785, 0.3382958, 0, 0, 0, 1, 1,
0.6613644, 0.007753836, 1.767625, 0, 0, 0, 1, 1,
0.6720016, -1.204519, 1.615411, 0, 0, 0, 1, 1,
0.6803206, 1.656715, -0.6842574, 0, 0, 0, 1, 1,
0.6830903, 1.279716, 1.010542, 0, 0, 0, 1, 1,
0.6854317, -0.4883128, 2.446303, 0, 0, 0, 1, 1,
0.6926141, 0.1274776, 0.6443028, 1, 1, 1, 1, 1,
0.6949397, -2.683555, 2.044149, 1, 1, 1, 1, 1,
0.7038512, -1.69538, 4.422547, 1, 1, 1, 1, 1,
0.7066102, -1.406699, 1.349649, 1, 1, 1, 1, 1,
0.7075685, -1.892089, 3.043137, 1, 1, 1, 1, 1,
0.7108976, 2.218621, 1.711001, 1, 1, 1, 1, 1,
0.7115713, -1.185745, 3.659864, 1, 1, 1, 1, 1,
0.7128233, 0.3604218, 0.4036303, 1, 1, 1, 1, 1,
0.7139428, 0.8971372, 0.4803453, 1, 1, 1, 1, 1,
0.714222, 0.5243321, 1.798337, 1, 1, 1, 1, 1,
0.7200671, 0.8912751, 0.7869398, 1, 1, 1, 1, 1,
0.7207131, -2.790647, 4.177826, 1, 1, 1, 1, 1,
0.7233371, 0.2058689, 1.515921, 1, 1, 1, 1, 1,
0.7319006, 1.140677, -0.2338685, 1, 1, 1, 1, 1,
0.7506334, -0.03204066, 0.260958, 1, 1, 1, 1, 1,
0.7561524, -1.042567, 3.296886, 0, 0, 1, 1, 1,
0.7561882, -1.28455, 0.845898, 1, 0, 0, 1, 1,
0.7627144, 1.250188, 1.259362, 1, 0, 0, 1, 1,
0.7661553, -0.02446944, 1.53773, 1, 0, 0, 1, 1,
0.7695628, 0.591683, 2.485187, 1, 0, 0, 1, 1,
0.7700986, 1.227752, -0.07203677, 1, 0, 0, 1, 1,
0.7715151, 1.3896, 0.03955866, 0, 0, 0, 1, 1,
0.7809737, 0.1498291, 1.096892, 0, 0, 0, 1, 1,
0.7839531, 0.6333998, 0.409208, 0, 0, 0, 1, 1,
0.7881803, 0.02427096, 2.547939, 0, 0, 0, 1, 1,
0.7913171, -0.01475901, 1.469179, 0, 0, 0, 1, 1,
0.7944245, 0.3450887, 1.323411, 0, 0, 0, 1, 1,
0.8039936, -1.647301, 2.901334, 0, 0, 0, 1, 1,
0.8124372, -0.5454367, 2.654575, 1, 1, 1, 1, 1,
0.8139271, -0.8034357, 3.577507, 1, 1, 1, 1, 1,
0.8156975, 0.9830088, 1.081536, 1, 1, 1, 1, 1,
0.8159621, -1.6359, 1.647494, 1, 1, 1, 1, 1,
0.8170055, -0.5024217, 3.005051, 1, 1, 1, 1, 1,
0.8189148, 0.9678406, 0.4976498, 1, 1, 1, 1, 1,
0.823057, -0.04307973, 1.962885, 1, 1, 1, 1, 1,
0.8270438, -0.8853443, 1.280067, 1, 1, 1, 1, 1,
0.8294085, -0.4310323, 1.419752, 1, 1, 1, 1, 1,
0.8340569, -1.167309, 1.622546, 1, 1, 1, 1, 1,
0.8366373, 0.9912258, -0.4188977, 1, 1, 1, 1, 1,
0.8446634, -2.678829, 0.8355386, 1, 1, 1, 1, 1,
0.8478752, 0.2658731, -0.7539402, 1, 1, 1, 1, 1,
0.8482906, -1.160306, 2.236952, 1, 1, 1, 1, 1,
0.8491685, -0.5591525, 2.530612, 1, 1, 1, 1, 1,
0.8494666, 0.2974867, 1.804837, 0, 0, 1, 1, 1,
0.8529038, -0.5131689, 1.509454, 1, 0, 0, 1, 1,
0.8596418, 0.3841426, 1.721552, 1, 0, 0, 1, 1,
0.8599265, 1.411829, 0.254054, 1, 0, 0, 1, 1,
0.8676487, 0.1669176, -0.1185741, 1, 0, 0, 1, 1,
0.8683344, -0.5218, 3.759964, 1, 0, 0, 1, 1,
0.8685474, -1.638264, 4.059565, 0, 0, 0, 1, 1,
0.8722514, 0.4180396, 2.817487, 0, 0, 0, 1, 1,
0.8767897, -0.443841, 1.767863, 0, 0, 0, 1, 1,
0.8791868, 0.4941864, 0.05321352, 0, 0, 0, 1, 1,
0.8949366, 0.9843525, -0.6715659, 0, 0, 0, 1, 1,
0.8954187, -0.1496234, 1.918265, 0, 0, 0, 1, 1,
0.8968229, 0.142449, 1.193367, 0, 0, 0, 1, 1,
0.8976544, -0.2409788, 0.5748081, 1, 1, 1, 1, 1,
0.9101781, 2.006194, -1.28369, 1, 1, 1, 1, 1,
0.9134675, 0.3590123, 1.358683, 1, 1, 1, 1, 1,
0.91766, -0.7757328, 2.642274, 1, 1, 1, 1, 1,
0.9257198, 2.39778, -0.4305463, 1, 1, 1, 1, 1,
0.9267999, -0.8966743, 2.389719, 1, 1, 1, 1, 1,
0.9379594, 0.4482146, 0.6835871, 1, 1, 1, 1, 1,
0.9383287, -0.3982675, 1.430963, 1, 1, 1, 1, 1,
0.9475676, -0.1599638, 1.330823, 1, 1, 1, 1, 1,
0.9478819, -0.7382537, 2.786258, 1, 1, 1, 1, 1,
0.9483707, -0.5520991, 3.01636, 1, 1, 1, 1, 1,
0.9486005, -2.052918, 2.138819, 1, 1, 1, 1, 1,
0.9541608, 1.817432, 0.4604842, 1, 1, 1, 1, 1,
0.9575822, -1.072809, 2.137589, 1, 1, 1, 1, 1,
0.9617191, 1.181416, -0.1780832, 1, 1, 1, 1, 1,
0.9654642, 1.36231, 1.344661, 0, 0, 1, 1, 1,
0.9712176, 0.7289513, 0.9667562, 1, 0, 0, 1, 1,
0.9726936, 0.8714497, 0.08903705, 1, 0, 0, 1, 1,
0.9776611, 0.2601172, 1.884324, 1, 0, 0, 1, 1,
0.9820468, 0.5118135, -0.9897828, 1, 0, 0, 1, 1,
0.9907894, -1.461173, 2.078709, 1, 0, 0, 1, 1,
0.9929368, -0.761139, 2.985317, 0, 0, 0, 1, 1,
1.006667, 0.9903677, 1.536915, 0, 0, 0, 1, 1,
1.014692, 0.5161905, -0.02606842, 0, 0, 0, 1, 1,
1.01895, 0.2187062, 1.360016, 0, 0, 0, 1, 1,
1.019513, -0.261713, 1.126696, 0, 0, 0, 1, 1,
1.031091, -1.584432, 3.518851, 0, 0, 0, 1, 1,
1.038752, -0.7467929, 2.89406, 0, 0, 0, 1, 1,
1.040879, -1.581551, 1.414085, 1, 1, 1, 1, 1,
1.04317, 0.9233858, 2.182961, 1, 1, 1, 1, 1,
1.043574, -0.6160364, 2.565311, 1, 1, 1, 1, 1,
1.054056, -1.317899, 2.320713, 1, 1, 1, 1, 1,
1.05549, -1.204956, 2.674345, 1, 1, 1, 1, 1,
1.058814, 0.3259125, 1.535886, 1, 1, 1, 1, 1,
1.066965, 1.042721, 1.709665, 1, 1, 1, 1, 1,
1.070446, 0.5783871, 1.174839, 1, 1, 1, 1, 1,
1.07277, 0.001716452, 1.789255, 1, 1, 1, 1, 1,
1.073862, 0.1719875, 0.8498212, 1, 1, 1, 1, 1,
1.074146, 1.523946, 1.667495, 1, 1, 1, 1, 1,
1.074258, -0.9003024, 2.569983, 1, 1, 1, 1, 1,
1.074463, -1.003566, 3.027225, 1, 1, 1, 1, 1,
1.075462, -0.5866627, 3.160766, 1, 1, 1, 1, 1,
1.077334, 1.168244, 1.663099, 1, 1, 1, 1, 1,
1.077505, 0.6806271, 0.3418625, 0, 0, 1, 1, 1,
1.086357, 2.8539, 0.5477576, 1, 0, 0, 1, 1,
1.088177, -0.005017098, 0.4426291, 1, 0, 0, 1, 1,
1.108362, -0.4285448, 0.0230219, 1, 0, 0, 1, 1,
1.120269, 0.9938523, 2.138275, 1, 0, 0, 1, 1,
1.120482, 0.18228, 0.9766363, 1, 0, 0, 1, 1,
1.122385, 0.594972, 1.531312, 0, 0, 0, 1, 1,
1.123629, 1.074647, 0.5331791, 0, 0, 0, 1, 1,
1.124992, 0.7239286, 0.4174276, 0, 0, 0, 1, 1,
1.139448, 0.7823695, 0.5028698, 0, 0, 0, 1, 1,
1.140049, -1.261554, 2.277781, 0, 0, 0, 1, 1,
1.146499, 0.6725713, 1.94813, 0, 0, 0, 1, 1,
1.158477, -1.447115, 2.362847, 0, 0, 0, 1, 1,
1.162083, 3.49586, 0.6137157, 1, 1, 1, 1, 1,
1.162243, -0.9160351, 1.455345, 1, 1, 1, 1, 1,
1.16893, 0.725198, 0.3719383, 1, 1, 1, 1, 1,
1.172973, -1.140229, 0.1983927, 1, 1, 1, 1, 1,
1.174696, -1.025731, 3.048424, 1, 1, 1, 1, 1,
1.176191, -2.105274, 4.884834, 1, 1, 1, 1, 1,
1.17817, 1.791406, -2.144545, 1, 1, 1, 1, 1,
1.179569, -1.245477, 2.347503, 1, 1, 1, 1, 1,
1.18329, 2.300215, 1.272093, 1, 1, 1, 1, 1,
1.193436, -0.7898063, 2.137949, 1, 1, 1, 1, 1,
1.1937, 0.5972416, 0.06979331, 1, 1, 1, 1, 1,
1.197632, -0.3455389, 1.792136, 1, 1, 1, 1, 1,
1.2011, 0.6208302, 0.2923754, 1, 1, 1, 1, 1,
1.205042, -0.2347284, 3.250175, 1, 1, 1, 1, 1,
1.206833, 0.1807228, 0.3844502, 1, 1, 1, 1, 1,
1.207305, -0.8148457, 1.387084, 0, 0, 1, 1, 1,
1.216434, -0.5440468, 2.372315, 1, 0, 0, 1, 1,
1.218401, -0.9096358, 2.05977, 1, 0, 0, 1, 1,
1.220648, -0.2112711, 1.623887, 1, 0, 0, 1, 1,
1.227267, -0.3735337, 1.951506, 1, 0, 0, 1, 1,
1.227686, 0.1665744, 0.9861973, 1, 0, 0, 1, 1,
1.231104, 0.5322908, 0.9999275, 0, 0, 0, 1, 1,
1.234545, 1.435975, 1.924034, 0, 0, 0, 1, 1,
1.235175, -0.2901425, 3.403049, 0, 0, 0, 1, 1,
1.24206, -0.2999179, 3.350906, 0, 0, 0, 1, 1,
1.244791, 1.546653, 3.519764, 0, 0, 0, 1, 1,
1.246554, 1.2183, 1.359289, 0, 0, 0, 1, 1,
1.247587, -0.4156379, 1.598595, 0, 0, 0, 1, 1,
1.260926, -1.03714, 2.746681, 1, 1, 1, 1, 1,
1.27332, 1.009969, 1.714336, 1, 1, 1, 1, 1,
1.277521, -1.232011, 1.876332, 1, 1, 1, 1, 1,
1.286262, 1.505976, -0.6679432, 1, 1, 1, 1, 1,
1.293524, 1.698781, 0.7410757, 1, 1, 1, 1, 1,
1.294743, -0.02303179, 1.873587, 1, 1, 1, 1, 1,
1.302576, 0.6895288, 1.080482, 1, 1, 1, 1, 1,
1.316413, -0.8578838, 2.378606, 1, 1, 1, 1, 1,
1.31934, 1.013434, 1.497267, 1, 1, 1, 1, 1,
1.321265, 1.0065, 0.02884001, 1, 1, 1, 1, 1,
1.326016, 0.3456066, 2.209489, 1, 1, 1, 1, 1,
1.328978, -0.6626967, 2.541047, 1, 1, 1, 1, 1,
1.33468, -2.402426, 4.525107, 1, 1, 1, 1, 1,
1.339168, -0.1783863, 1.93222, 1, 1, 1, 1, 1,
1.343174, 1.593806, 0.3635709, 1, 1, 1, 1, 1,
1.352727, -0.2111016, 0.2602412, 0, 0, 1, 1, 1,
1.358754, -0.3232596, 1.107245, 1, 0, 0, 1, 1,
1.361259, -0.2170198, 0.2920789, 1, 0, 0, 1, 1,
1.36665, -1.039343, 1.915402, 1, 0, 0, 1, 1,
1.369441, 0.3222123, -1.666512, 1, 0, 0, 1, 1,
1.383269, -0.9178468, 3.367913, 1, 0, 0, 1, 1,
1.390563, 2.513139, -0.2693304, 0, 0, 0, 1, 1,
1.396385, 0.506864, -0.3667495, 0, 0, 0, 1, 1,
1.403071, 1.561711, 0.8267007, 0, 0, 0, 1, 1,
1.425891, -0.3494173, 2.447935, 0, 0, 0, 1, 1,
1.428528, 0.8785217, -0.8006849, 0, 0, 0, 1, 1,
1.447626, -0.5774815, 2.947953, 0, 0, 0, 1, 1,
1.46205, -1.139995, 2.356908, 0, 0, 0, 1, 1,
1.477507, 1.810127, 0.2434382, 1, 1, 1, 1, 1,
1.477548, -0.9861732, 1.005138, 1, 1, 1, 1, 1,
1.491959, 0.8905264, -0.1922186, 1, 1, 1, 1, 1,
1.498694, -0.3346171, 2.699838, 1, 1, 1, 1, 1,
1.55693, -0.6939389, 1.83411, 1, 1, 1, 1, 1,
1.560549, -0.1838559, 1.790879, 1, 1, 1, 1, 1,
1.568122, 1.045814, 1.747337, 1, 1, 1, 1, 1,
1.578016, 0.8937914, -0.004443322, 1, 1, 1, 1, 1,
1.580393, 0.9324768, 1.023152, 1, 1, 1, 1, 1,
1.581483, -0.1446717, 2.198792, 1, 1, 1, 1, 1,
1.584703, 0.7758907, 1.39732, 1, 1, 1, 1, 1,
1.58912, 0.02740777, 1.986459, 1, 1, 1, 1, 1,
1.597958, -1.427178, 2.369321, 1, 1, 1, 1, 1,
1.614027, -1.027337, 0.5616297, 1, 1, 1, 1, 1,
1.631086, -0.0599726, 0.7481957, 1, 1, 1, 1, 1,
1.638408, 0.6093712, -0.7819129, 0, 0, 1, 1, 1,
1.650121, -0.2536582, 2.183741, 1, 0, 0, 1, 1,
1.66139, 0.2667322, 1.818925, 1, 0, 0, 1, 1,
1.705598, -1.116407, 2.456898, 1, 0, 0, 1, 1,
1.713327, 1.880734, -0.2762952, 1, 0, 0, 1, 1,
1.725663, 0.5632824, 3.777089, 1, 0, 0, 1, 1,
1.726111, -0.9634973, 2.764747, 0, 0, 0, 1, 1,
1.73321, -0.7654073, 1.50794, 0, 0, 0, 1, 1,
1.75969, 0.8268806, -0.05161064, 0, 0, 0, 1, 1,
1.789443, 2.11913, 0.03792037, 0, 0, 0, 1, 1,
1.792902, 0.3312008, 0.803314, 0, 0, 0, 1, 1,
1.797539, -0.5081763, 2.463496, 0, 0, 0, 1, 1,
1.815549, -1.378628, 3.21182, 0, 0, 0, 1, 1,
1.844334, 0.4114779, 1.02792, 1, 1, 1, 1, 1,
1.846055, 0.5066481, 2.522219, 1, 1, 1, 1, 1,
1.850674, 0.1838835, 0.6458239, 1, 1, 1, 1, 1,
1.869709, 0.2888574, 0.1971343, 1, 1, 1, 1, 1,
1.878569, 0.07223406, 1.554546, 1, 1, 1, 1, 1,
1.89335, 1.467978, 0.6746293, 1, 1, 1, 1, 1,
1.920737, -0.5552112, 2.111034, 1, 1, 1, 1, 1,
1.940885, -0.3259822, 1.952457, 1, 1, 1, 1, 1,
1.944294, 1.933774, 2.740606, 1, 1, 1, 1, 1,
1.949437, 0.5754351, 1.628843, 1, 1, 1, 1, 1,
1.965766, 1.10265, 0.483696, 1, 1, 1, 1, 1,
1.974511, -0.08623841, 1.775335, 1, 1, 1, 1, 1,
1.97649, -1.38808, 1.864941, 1, 1, 1, 1, 1,
1.979596, 0.9001616, -0.6040658, 1, 1, 1, 1, 1,
1.990545, -1.319788, 3.514531, 1, 1, 1, 1, 1,
2.001679, 0.8319849, -0.8917634, 0, 0, 1, 1, 1,
2.011621, -1.563192, 2.253812, 1, 0, 0, 1, 1,
2.03423, -1.551057, 1.81764, 1, 0, 0, 1, 1,
2.065247, 0.5114393, 1.585558, 1, 0, 0, 1, 1,
2.084209, 0.3128901, -0.2292699, 1, 0, 0, 1, 1,
2.098253, 0.5952885, -0.6936094, 1, 0, 0, 1, 1,
2.142304, -0.3718856, 2.414195, 0, 0, 0, 1, 1,
2.161729, -0.2765107, 0.880959, 0, 0, 0, 1, 1,
2.16616, 0.2899117, -0.1298192, 0, 0, 0, 1, 1,
2.218153, 1.493392, 1.278868, 0, 0, 0, 1, 1,
2.225424, 0.1780497, 1.533389, 0, 0, 0, 1, 1,
2.24232, 0.2651539, 0.2927322, 0, 0, 0, 1, 1,
2.273506, -0.6834407, 3.110988, 0, 0, 0, 1, 1,
2.306768, 0.3420909, 0.9458963, 1, 1, 1, 1, 1,
2.319267, 0.2734809, 3.022693, 1, 1, 1, 1, 1,
2.457212, -1.146298, 2.141661, 1, 1, 1, 1, 1,
2.614868, -0.5779623, 1.809882, 1, 1, 1, 1, 1,
2.83881, 0.5664711, 1.257172, 1, 1, 1, 1, 1,
3.104378, 0.4568626, 2.277121, 1, 1, 1, 1, 1,
3.368886, 0.5432595, 1.134077, 1, 1, 1, 1, 1
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
var radius = 9.247995;
var distance = 32.48319;
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
mvMatrix.translate( -0.2721808, -0.3175362, -0.08139062 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.48319);
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
