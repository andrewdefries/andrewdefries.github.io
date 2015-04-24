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
-3.736856, -0.426657, 0.1306057, 1, 0, 0, 1,
-3.245972, -0.9294967, -2.052907, 1, 0.007843138, 0, 1,
-2.928659, 0.3384762, -2.084989, 1, 0.01176471, 0, 1,
-2.723671, 0.2483093, -2.534505, 1, 0.01960784, 0, 1,
-2.65567, -0.433947, -0.1922079, 1, 0.02352941, 0, 1,
-2.652351, -2.402472, -3.536126, 1, 0.03137255, 0, 1,
-2.630105, 0.3284861, -1.25598, 1, 0.03529412, 0, 1,
-2.523665, 0.2698083, -1.069154, 1, 0.04313726, 0, 1,
-2.51814, -0.8646685, -1.102346, 1, 0.04705882, 0, 1,
-2.437942, 0.2607753, -1.560192, 1, 0.05490196, 0, 1,
-2.434458, 1.178194, 0.01974135, 1, 0.05882353, 0, 1,
-2.428557, -1.594391, -2.09414, 1, 0.06666667, 0, 1,
-2.3983, -0.9511929, -2.834467, 1, 0.07058824, 0, 1,
-2.366445, 0.477545, -1.517964, 1, 0.07843138, 0, 1,
-2.317995, -0.295949, -2.97853, 1, 0.08235294, 0, 1,
-2.310355, 0.06298485, -1.406076, 1, 0.09019608, 0, 1,
-2.277622, 0.4537584, -1.694163, 1, 0.09411765, 0, 1,
-2.271103, -0.3902741, -0.06812403, 1, 0.1019608, 0, 1,
-2.26704, 1.241351, -0.8603951, 1, 0.1098039, 0, 1,
-2.258046, 0.6213689, 0.005488819, 1, 0.1137255, 0, 1,
-2.188627, 0.694514, -2.446686, 1, 0.1215686, 0, 1,
-2.138662, -1.240078, -1.084626, 1, 0.1254902, 0, 1,
-2.136663, -1.233894, -0.8004407, 1, 0.1333333, 0, 1,
-2.109826, 1.220417, -1.168026, 1, 0.1372549, 0, 1,
-2.099866, -0.4987609, -2.339236, 1, 0.145098, 0, 1,
-2.077199, 0.9800718, -2.993532, 1, 0.1490196, 0, 1,
-2.030357, 0.3763061, -2.605283, 1, 0.1568628, 0, 1,
-2.027359, -0.7358786, -1.597586, 1, 0.1607843, 0, 1,
-2.022737, 0.4100327, -1.001862, 1, 0.1686275, 0, 1,
-2.010842, -1.392054, -1.849681, 1, 0.172549, 0, 1,
-2.006616, 1.476662, -0.5800042, 1, 0.1803922, 0, 1,
-1.991432, 1.284112, -0.01631114, 1, 0.1843137, 0, 1,
-1.979276, -2.105809, -2.359462, 1, 0.1921569, 0, 1,
-1.978085, 0.2846842, 0.9487547, 1, 0.1960784, 0, 1,
-1.964163, 0.0692355, -0.4298104, 1, 0.2039216, 0, 1,
-1.957523, 1.364189, -1.98366, 1, 0.2117647, 0, 1,
-1.956141, -0.3884935, -2.196523, 1, 0.2156863, 0, 1,
-1.952947, 0.4149613, -2.269221, 1, 0.2235294, 0, 1,
-1.952594, -0.5568392, -2.598588, 1, 0.227451, 0, 1,
-1.94634, 0.303232, -1.864247, 1, 0.2352941, 0, 1,
-1.918539, -0.1863921, -2.098047, 1, 0.2392157, 0, 1,
-1.917755, 0.5452989, -0.3936105, 1, 0.2470588, 0, 1,
-1.911803, 2.122241, -1.917566, 1, 0.2509804, 0, 1,
-1.908284, 1.372964, -1.409331, 1, 0.2588235, 0, 1,
-1.905109, -0.2023384, -1.156338, 1, 0.2627451, 0, 1,
-1.890804, -0.6523245, -2.154682, 1, 0.2705882, 0, 1,
-1.863504, -1.22594, -0.4031124, 1, 0.2745098, 0, 1,
-1.85612, 0.3159179, -1.565572, 1, 0.282353, 0, 1,
-1.848519, 0.4997631, -0.4325673, 1, 0.2862745, 0, 1,
-1.846275, 0.6887562, -2.537767, 1, 0.2941177, 0, 1,
-1.83294, -1.34528, -4.749151, 1, 0.3019608, 0, 1,
-1.828156, -0.8922059, -2.972916, 1, 0.3058824, 0, 1,
-1.823497, 0.4533637, 0.0003510186, 1, 0.3137255, 0, 1,
-1.804879, -0.1966626, -1.659759, 1, 0.3176471, 0, 1,
-1.799966, 1.10185, -0.6520489, 1, 0.3254902, 0, 1,
-1.799709, -0.07307483, -2.703625, 1, 0.3294118, 0, 1,
-1.797907, -1.898874, -1.80574, 1, 0.3372549, 0, 1,
-1.780803, 0.399135, -1.644423, 1, 0.3411765, 0, 1,
-1.772753, -0.9653534, -0.7374915, 1, 0.3490196, 0, 1,
-1.758162, -0.4144499, -2.098416, 1, 0.3529412, 0, 1,
-1.756796, -1.566021, -2.58402, 1, 0.3607843, 0, 1,
-1.755207, -1.825054, -1.774517, 1, 0.3647059, 0, 1,
-1.75341, 0.6918824, -1.877058, 1, 0.372549, 0, 1,
-1.74, 1.111694, 1.191923, 1, 0.3764706, 0, 1,
-1.734056, -1.452202, -1.69334, 1, 0.3843137, 0, 1,
-1.726192, 0.6200466, -2.375631, 1, 0.3882353, 0, 1,
-1.720282, 0.4562576, -1.437837, 1, 0.3960784, 0, 1,
-1.715609, 1.587319, -0.1985952, 1, 0.4039216, 0, 1,
-1.713219, 0.5273253, -1.981658, 1, 0.4078431, 0, 1,
-1.680552, 1.00478, -0.280127, 1, 0.4156863, 0, 1,
-1.650918, -0.1586607, -0.8081399, 1, 0.4196078, 0, 1,
-1.648988, 0.02582622, -0.6560592, 1, 0.427451, 0, 1,
-1.64642, 0.2634142, 0.00343097, 1, 0.4313726, 0, 1,
-1.643075, -0.7936821, -2.519252, 1, 0.4392157, 0, 1,
-1.624254, 0.4551138, -1.079148, 1, 0.4431373, 0, 1,
-1.615591, 1.082461, -1.629635, 1, 0.4509804, 0, 1,
-1.615456, 0.1804909, -2.483676, 1, 0.454902, 0, 1,
-1.61419, 0.01531828, -3.358644, 1, 0.4627451, 0, 1,
-1.613291, 0.3622299, -0.9904124, 1, 0.4666667, 0, 1,
-1.607961, 1.295057, -0.1144796, 1, 0.4745098, 0, 1,
-1.602468, 1.445247, 1.31677, 1, 0.4784314, 0, 1,
-1.599086, 0.8553873, -1.876626, 1, 0.4862745, 0, 1,
-1.593945, 0.3439852, -2.046038, 1, 0.4901961, 0, 1,
-1.579842, 1.137017, -0.2777192, 1, 0.4980392, 0, 1,
-1.538607, -2.504946, -1.650343, 1, 0.5058824, 0, 1,
-1.531994, 0.6220997, -1.487153, 1, 0.509804, 0, 1,
-1.516237, -0.1209367, -1.571174, 1, 0.5176471, 0, 1,
-1.515356, -2.149192, -4.267245, 1, 0.5215687, 0, 1,
-1.511105, 1.008099, -0.1563375, 1, 0.5294118, 0, 1,
-1.51101, -1.598094, -1.356692, 1, 0.5333334, 0, 1,
-1.509308, 0.9423286, -0.9616749, 1, 0.5411765, 0, 1,
-1.503613, -0.6384984, -2.373443, 1, 0.5450981, 0, 1,
-1.49978, -0.1920834, -2.092943, 1, 0.5529412, 0, 1,
-1.496648, 0.2214123, -0.774093, 1, 0.5568628, 0, 1,
-1.495116, -0.3151281, -1.57425, 1, 0.5647059, 0, 1,
-1.466227, -0.9636881, -3.362924, 1, 0.5686275, 0, 1,
-1.46285, -2.189256, -1.388977, 1, 0.5764706, 0, 1,
-1.460624, -2.160038, -3.097843, 1, 0.5803922, 0, 1,
-1.425589, -0.2264204, -2.523129, 1, 0.5882353, 0, 1,
-1.40854, -0.8064435, -3.973757, 1, 0.5921569, 0, 1,
-1.404436, 0.2665251, 0.4238257, 1, 0.6, 0, 1,
-1.387603, -0.1962938, -1.808154, 1, 0.6078432, 0, 1,
-1.368909, 0.2262167, -1.018606, 1, 0.6117647, 0, 1,
-1.365733, 1.237854, 0.9576269, 1, 0.6196079, 0, 1,
-1.36357, 0.5062307, 0.1453576, 1, 0.6235294, 0, 1,
-1.362319, 1.169618, -2.14581, 1, 0.6313726, 0, 1,
-1.357223, 0.1476817, -1.560287, 1, 0.6352941, 0, 1,
-1.356822, 0.7877612, -3.402776, 1, 0.6431373, 0, 1,
-1.348792, -1.571542, -1.740692, 1, 0.6470588, 0, 1,
-1.345627, -1.044891, -1.282961, 1, 0.654902, 0, 1,
-1.344378, 1.483752, -0.4489588, 1, 0.6588235, 0, 1,
-1.337299, -2.325396, -4.012474, 1, 0.6666667, 0, 1,
-1.324855, -0.2781907, -0.7307338, 1, 0.6705883, 0, 1,
-1.321227, -0.899714, -1.280985, 1, 0.6784314, 0, 1,
-1.320867, 0.03382483, -1.551268, 1, 0.682353, 0, 1,
-1.31836, -1.955745, -2.283068, 1, 0.6901961, 0, 1,
-1.315866, 0.3962287, -0.5726547, 1, 0.6941177, 0, 1,
-1.311417, -0.2333066, -1.232279, 1, 0.7019608, 0, 1,
-1.287225, -0.6367657, 0.7055851, 1, 0.7098039, 0, 1,
-1.282731, 0.6509503, -0.5877445, 1, 0.7137255, 0, 1,
-1.278945, -0.1845009, -1.626296, 1, 0.7215686, 0, 1,
-1.27597, -1.482109, -2.614725, 1, 0.7254902, 0, 1,
-1.269009, 0.6836725, 1.079902, 1, 0.7333333, 0, 1,
-1.261251, 1.833907, -0.5250974, 1, 0.7372549, 0, 1,
-1.259992, -1.816582, -3.960704, 1, 0.7450981, 0, 1,
-1.255236, -0.1476046, -2.423286, 1, 0.7490196, 0, 1,
-1.253107, 1.671167, 0.4364154, 1, 0.7568628, 0, 1,
-1.243102, 0.1849792, -1.525869, 1, 0.7607843, 0, 1,
-1.2394, -0.8308049, -1.532375, 1, 0.7686275, 0, 1,
-1.236805, 1.295733, 1.411021, 1, 0.772549, 0, 1,
-1.232308, -0.847365, -3.036624, 1, 0.7803922, 0, 1,
-1.228845, 1.192448, 0.5616581, 1, 0.7843137, 0, 1,
-1.22728, -0.1509572, -1.739385, 1, 0.7921569, 0, 1,
-1.217281, 0.3343489, -1.316716, 1, 0.7960784, 0, 1,
-1.216008, 0.3798259, -0.3019875, 1, 0.8039216, 0, 1,
-1.206266, -0.6609803, -1.441322, 1, 0.8117647, 0, 1,
-1.197316, -0.3533516, -1.887189, 1, 0.8156863, 0, 1,
-1.196785, -0.3857207, -2.006539, 1, 0.8235294, 0, 1,
-1.196537, 2.975237, -1.008258, 1, 0.827451, 0, 1,
-1.186611, 1.814345, 0.1170939, 1, 0.8352941, 0, 1,
-1.18079, -0.07277485, -0.3798295, 1, 0.8392157, 0, 1,
-1.174912, -1.116266, -1.642256, 1, 0.8470588, 0, 1,
-1.173881, -1.72287, -1.465262, 1, 0.8509804, 0, 1,
-1.170269, -0.6837716, -2.847196, 1, 0.8588235, 0, 1,
-1.164532, 0.9949707, 0.1008266, 1, 0.8627451, 0, 1,
-1.149889, -0.4796317, -0.9501312, 1, 0.8705882, 0, 1,
-1.146082, 1.162862, -1.695274, 1, 0.8745098, 0, 1,
-1.141569, -0.5918987, -2.218043, 1, 0.8823529, 0, 1,
-1.137437, -0.7320071, -3.697489, 1, 0.8862745, 0, 1,
-1.128961, -1.311545, -1.824872, 1, 0.8941177, 0, 1,
-1.115404, 2.09742, 0.0889781, 1, 0.8980392, 0, 1,
-1.11124, -0.9178913, -2.583876, 1, 0.9058824, 0, 1,
-1.105657, 0.2818416, -1.683482, 1, 0.9137255, 0, 1,
-1.094845, 0.5830098, -1.966546, 1, 0.9176471, 0, 1,
-1.094644, -3.505825, -2.940329, 1, 0.9254902, 0, 1,
-1.09401, -1.153731, -2.469435, 1, 0.9294118, 0, 1,
-1.092922, -0.1166888, -1.155826, 1, 0.9372549, 0, 1,
-1.092354, -0.4884669, -2.153862, 1, 0.9411765, 0, 1,
-1.088758, -0.1140121, -0.4615687, 1, 0.9490196, 0, 1,
-1.083389, -0.03180602, -2.234972, 1, 0.9529412, 0, 1,
-1.080339, 0.3814026, -1.34165, 1, 0.9607843, 0, 1,
-1.079102, -0.6562353, -0.2486037, 1, 0.9647059, 0, 1,
-1.072969, 0.4060642, -2.303583, 1, 0.972549, 0, 1,
-1.064166, -0.2029502, -0.6217872, 1, 0.9764706, 0, 1,
-1.061825, 0.4806639, -0.668296, 1, 0.9843137, 0, 1,
-1.0611, 0.6452658, -1.497439, 1, 0.9882353, 0, 1,
-1.058909, 0.9798698, -0.1899949, 1, 0.9960784, 0, 1,
-1.047451, 1.872705, 0.227545, 0.9960784, 1, 0, 1,
-1.047216, 0.4719646, -1.921465, 0.9921569, 1, 0, 1,
-1.045178, -1.386762, -2.538284, 0.9843137, 1, 0, 1,
-1.042679, 1.595545, -1.167368, 0.9803922, 1, 0, 1,
-1.041075, 1.462678, -1.122409, 0.972549, 1, 0, 1,
-1.039445, -1.811679, -2.400935, 0.9686275, 1, 0, 1,
-1.038657, -0.4450691, -1.841079, 0.9607843, 1, 0, 1,
-1.035491, 0.2751628, -0.7027717, 0.9568627, 1, 0, 1,
-1.031969, 0.4480512, -1.044425, 0.9490196, 1, 0, 1,
-1.024058, -0.8699812, -2.017986, 0.945098, 1, 0, 1,
-1.022273, -0.4962403, -2.209067, 0.9372549, 1, 0, 1,
-1.020123, -0.3606904, -1.595849, 0.9333333, 1, 0, 1,
-1.01958, -0.1185241, -1.519531, 0.9254902, 1, 0, 1,
-1.016723, 0.04562615, -2.233621, 0.9215686, 1, 0, 1,
-1.01306, 0.4416102, -2.544051, 0.9137255, 1, 0, 1,
-1.008704, -0.3769099, -3.009625, 0.9098039, 1, 0, 1,
-1.001619, -0.7318013, -0.4528415, 0.9019608, 1, 0, 1,
-0.9995756, 0.8239949, 0.9043941, 0.8941177, 1, 0, 1,
-0.9960084, 0.6920336, 0.610307, 0.8901961, 1, 0, 1,
-0.9911198, 1.568994, -0.8233687, 0.8823529, 1, 0, 1,
-0.9813536, 0.8760149, -1.604955, 0.8784314, 1, 0, 1,
-0.9798677, 0.8024634, -1.241354, 0.8705882, 1, 0, 1,
-0.9740373, -0.4147392, -0.3936945, 0.8666667, 1, 0, 1,
-0.9678828, 1.169326, -1.263431, 0.8588235, 1, 0, 1,
-0.9610391, 0.2928393, -1.239123, 0.854902, 1, 0, 1,
-0.9555724, -1.471698, -2.87737, 0.8470588, 1, 0, 1,
-0.9527602, 1.289904, -0.4769378, 0.8431373, 1, 0, 1,
-0.9501488, 1.404219, 0.04783539, 0.8352941, 1, 0, 1,
-0.9492457, 0.1625687, -0.8645862, 0.8313726, 1, 0, 1,
-0.9489229, -2.194415, -2.504071, 0.8235294, 1, 0, 1,
-0.9454623, 0.7839667, -1.244838, 0.8196079, 1, 0, 1,
-0.940637, -0.4754905, -0.4841301, 0.8117647, 1, 0, 1,
-0.9339224, -0.6188024, 0.6878297, 0.8078431, 1, 0, 1,
-0.9311228, 1.016285, -0.8304948, 0.8, 1, 0, 1,
-0.9298208, -1.068551, -4.244981, 0.7921569, 1, 0, 1,
-0.9284552, 1.095856, 0.5717217, 0.7882353, 1, 0, 1,
-0.9159892, -1.429546, -2.301218, 0.7803922, 1, 0, 1,
-0.9116355, -0.3760374, -1.651367, 0.7764706, 1, 0, 1,
-0.9114999, -0.839692, -0.04948068, 0.7686275, 1, 0, 1,
-0.9109665, -0.4730717, -1.572942, 0.7647059, 1, 0, 1,
-0.9064683, 0.9644864, -1.221745, 0.7568628, 1, 0, 1,
-0.902448, -1.305489, -2.63985, 0.7529412, 1, 0, 1,
-0.9011623, 0.4470428, -0.5766528, 0.7450981, 1, 0, 1,
-0.9003622, -0.9355708, -3.029079, 0.7411765, 1, 0, 1,
-0.8981452, -2.142381, -5.344964, 0.7333333, 1, 0, 1,
-0.8921361, 0.02680026, -3.667959, 0.7294118, 1, 0, 1,
-0.8879119, 1.155774, 0.07632729, 0.7215686, 1, 0, 1,
-0.8818623, -1.513408, -2.084759, 0.7176471, 1, 0, 1,
-0.8813972, 1.179099, -1.994055, 0.7098039, 1, 0, 1,
-0.8695815, 0.5673018, -1.254653, 0.7058824, 1, 0, 1,
-0.8692309, -0.140733, -2.204538, 0.6980392, 1, 0, 1,
-0.8612528, -0.4629484, -2.833441, 0.6901961, 1, 0, 1,
-0.8603489, 0.674402, -1.587929, 0.6862745, 1, 0, 1,
-0.8542518, 0.808349, -0.6375356, 0.6784314, 1, 0, 1,
-0.8508665, -1.236971, -2.119938, 0.6745098, 1, 0, 1,
-0.8454489, -0.5799709, -1.324, 0.6666667, 1, 0, 1,
-0.8423532, -1.030596, -2.034838, 0.6627451, 1, 0, 1,
-0.841055, -1.309713, -1.834029, 0.654902, 1, 0, 1,
-0.8366799, 0.290949, -1.57541, 0.6509804, 1, 0, 1,
-0.8274594, 0.8819762, 0.8110607, 0.6431373, 1, 0, 1,
-0.8250567, 1.819054, -0.4521849, 0.6392157, 1, 0, 1,
-0.8199993, -0.7586786, -3.848722, 0.6313726, 1, 0, 1,
-0.8147982, -0.2566332, -1.196233, 0.627451, 1, 0, 1,
-0.8130448, 0.2103923, -1.897408, 0.6196079, 1, 0, 1,
-0.8029765, 1.571325, -1.14054, 0.6156863, 1, 0, 1,
-0.798815, 1.045323, -1.380322, 0.6078432, 1, 0, 1,
-0.7782398, -1.142317, -4.967, 0.6039216, 1, 0, 1,
-0.7736369, -0.2337168, -3.681591, 0.5960785, 1, 0, 1,
-0.7690799, 1.490489, 0.8819535, 0.5882353, 1, 0, 1,
-0.7676736, 2.502724, -0.9081409, 0.5843138, 1, 0, 1,
-0.7630843, -0.1643738, -1.398769, 0.5764706, 1, 0, 1,
-0.7613543, 2.094658, -0.7675323, 0.572549, 1, 0, 1,
-0.7585578, 0.6222924, -1.563158, 0.5647059, 1, 0, 1,
-0.7583681, -0.3792656, -3.486787, 0.5607843, 1, 0, 1,
-0.7448218, -2.627954, -3.554575, 0.5529412, 1, 0, 1,
-0.7398295, 0.1192931, -2.341414, 0.5490196, 1, 0, 1,
-0.7361175, -0.8146204, -2.090586, 0.5411765, 1, 0, 1,
-0.7350608, -1.705313, -1.865134, 0.5372549, 1, 0, 1,
-0.7318135, 0.1522695, -1.759859, 0.5294118, 1, 0, 1,
-0.7236226, -0.9505782, -1.026769, 0.5254902, 1, 0, 1,
-0.723271, 0.4421269, 0.1276599, 0.5176471, 1, 0, 1,
-0.7207759, -0.05808112, -0.682301, 0.5137255, 1, 0, 1,
-0.717091, -0.06872831, -0.1690686, 0.5058824, 1, 0, 1,
-0.7161055, -0.465195, -3.508752, 0.5019608, 1, 0, 1,
-0.7104239, -1.282593, -2.141634, 0.4941176, 1, 0, 1,
-0.7103738, -0.6061214, -2.383787, 0.4862745, 1, 0, 1,
-0.7038333, 0.8362746, -2.497623, 0.4823529, 1, 0, 1,
-0.698159, -0.5592408, -0.7935385, 0.4745098, 1, 0, 1,
-0.6933893, 0.3522784, -2.084701, 0.4705882, 1, 0, 1,
-0.6884329, 0.3070304, -0.8530462, 0.4627451, 1, 0, 1,
-0.6875366, -0.2961403, -3.149582, 0.4588235, 1, 0, 1,
-0.6864802, -0.433945, -3.909784, 0.4509804, 1, 0, 1,
-0.6831496, 0.09165669, -1.801345, 0.4470588, 1, 0, 1,
-0.6810317, -0.9891743, -3.142435, 0.4392157, 1, 0, 1,
-0.6702344, -0.4235615, -2.281251, 0.4352941, 1, 0, 1,
-0.6663706, -0.3065841, -2.290356, 0.427451, 1, 0, 1,
-0.6645197, -0.2077024, -0.7512761, 0.4235294, 1, 0, 1,
-0.6641601, 0.1965781, -0.834051, 0.4156863, 1, 0, 1,
-0.6550812, 0.2607325, 0.3131073, 0.4117647, 1, 0, 1,
-0.652106, 1.717437, 0.2807484, 0.4039216, 1, 0, 1,
-0.6439864, 0.9749274, 0.8107354, 0.3960784, 1, 0, 1,
-0.6429622, 0.02391784, -0.1202454, 0.3921569, 1, 0, 1,
-0.6390817, -0.2789851, -2.92929, 0.3843137, 1, 0, 1,
-0.6337661, 0.1317828, -0.9838502, 0.3803922, 1, 0, 1,
-0.6326025, 0.02732691, -3.198065, 0.372549, 1, 0, 1,
-0.6306688, 0.1408883, -3.342042, 0.3686275, 1, 0, 1,
-0.6280524, -1.146982, -1.656321, 0.3607843, 1, 0, 1,
-0.6271319, -0.224388, -0.8332298, 0.3568628, 1, 0, 1,
-0.6255316, -0.9367144, -2.994329, 0.3490196, 1, 0, 1,
-0.6252471, 0.5773392, -0.5278502, 0.345098, 1, 0, 1,
-0.6237529, 0.9212694, -0.9578856, 0.3372549, 1, 0, 1,
-0.6211489, -1.090984, -2.1547, 0.3333333, 1, 0, 1,
-0.6167612, -3.117802, -2.741529, 0.3254902, 1, 0, 1,
-0.6152498, 0.7135283, -0.5474277, 0.3215686, 1, 0, 1,
-0.6144191, -0.4776011, -2.234105, 0.3137255, 1, 0, 1,
-0.6102876, 0.3206082, -1.636561, 0.3098039, 1, 0, 1,
-0.6095818, 2.641097, 1.124303, 0.3019608, 1, 0, 1,
-0.6039834, 0.3985437, -0.3641451, 0.2941177, 1, 0, 1,
-0.5993555, 0.7592583, -0.712526, 0.2901961, 1, 0, 1,
-0.5963478, 0.08957695, -1.39234, 0.282353, 1, 0, 1,
-0.5962622, -1.272015, -4.531034, 0.2784314, 1, 0, 1,
-0.5885104, -0.3924999, -2.765786, 0.2705882, 1, 0, 1,
-0.5859086, 0.946804, -1.649107, 0.2666667, 1, 0, 1,
-0.5827864, 0.4795972, -2.600535, 0.2588235, 1, 0, 1,
-0.5788317, 0.2062866, -0.7127659, 0.254902, 1, 0, 1,
-0.5771626, 1.269059, 0.1304996, 0.2470588, 1, 0, 1,
-0.5672532, 1.612993, 0.07291884, 0.2431373, 1, 0, 1,
-0.5609345, 0.3007134, -0.6745915, 0.2352941, 1, 0, 1,
-0.5561891, 2.879474, -0.4444602, 0.2313726, 1, 0, 1,
-0.5531491, 1.030476, 0.4910761, 0.2235294, 1, 0, 1,
-0.5404519, 1.064581, -0.3357579, 0.2196078, 1, 0, 1,
-0.5399254, -0.6222861, -3.411082, 0.2117647, 1, 0, 1,
-0.5377872, 0.3533333, -1.262795, 0.2078431, 1, 0, 1,
-0.5367936, -0.2000323, -2.471168, 0.2, 1, 0, 1,
-0.5347027, -0.9745057, -1.414225, 0.1921569, 1, 0, 1,
-0.5313476, -0.1749988, -0.9369556, 0.1882353, 1, 0, 1,
-0.5312063, -1.113117, -1.66625, 0.1803922, 1, 0, 1,
-0.5305806, 0.005408179, -0.05519864, 0.1764706, 1, 0, 1,
-0.5240013, 0.2101445, 1.034081, 0.1686275, 1, 0, 1,
-0.5239174, 0.8469157, 0.8226914, 0.1647059, 1, 0, 1,
-0.52281, 0.9496847, 1.198827, 0.1568628, 1, 0, 1,
-0.5227942, -1.380993, -4.720107, 0.1529412, 1, 0, 1,
-0.5225894, -1.200455, -2.098127, 0.145098, 1, 0, 1,
-0.5090003, -0.8763914, -3.30804, 0.1411765, 1, 0, 1,
-0.5084029, 1.103888, -1.311592, 0.1333333, 1, 0, 1,
-0.5080202, 0.5101359, -0.3670748, 0.1294118, 1, 0, 1,
-0.5064069, 0.6564586, -0.1301263, 0.1215686, 1, 0, 1,
-0.504601, 1.397366, -1.143509, 0.1176471, 1, 0, 1,
-0.503084, 0.1536068, -1.640436, 0.1098039, 1, 0, 1,
-0.5021948, -0.08846837, -1.398623, 0.1058824, 1, 0, 1,
-0.4997604, 0.5352491, -0.4162035, 0.09803922, 1, 0, 1,
-0.497063, 0.5490825, -1.525249, 0.09019608, 1, 0, 1,
-0.4969266, 0.0864797, -2.210811, 0.08627451, 1, 0, 1,
-0.4955199, 1.306068, -1.466402, 0.07843138, 1, 0, 1,
-0.492633, 0.8695695, -0.947018, 0.07450981, 1, 0, 1,
-0.4865453, -0.3078143, -1.393321, 0.06666667, 1, 0, 1,
-0.4845739, -0.002487012, 0.4091567, 0.0627451, 1, 0, 1,
-0.4824721, 1.506495, -0.8428472, 0.05490196, 1, 0, 1,
-0.4819227, -0.4199879, -1.597955, 0.05098039, 1, 0, 1,
-0.4808298, 0.2683673, -1.785195, 0.04313726, 1, 0, 1,
-0.4758754, -0.1042578, -2.895064, 0.03921569, 1, 0, 1,
-0.4758427, -2.361729, -3.840756, 0.03137255, 1, 0, 1,
-0.4753397, 0.6529054, -2.027541, 0.02745098, 1, 0, 1,
-0.4749633, 0.03566998, -1.386939, 0.01960784, 1, 0, 1,
-0.4734246, -1.292303, -1.729961, 0.01568628, 1, 0, 1,
-0.4624213, 1.270987, -0.5456793, 0.007843138, 1, 0, 1,
-0.4594223, -0.9717957, -0.2328302, 0.003921569, 1, 0, 1,
-0.4542343, 0.1626137, -0.3444102, 0, 1, 0.003921569, 1,
-0.4484078, -0.4307807, -1.059803, 0, 1, 0.01176471, 1,
-0.4409422, -1.815354, -3.523438, 0, 1, 0.01568628, 1,
-0.4407076, -1.222682, -2.925913, 0, 1, 0.02352941, 1,
-0.4391553, -1.230811, -5.472995, 0, 1, 0.02745098, 1,
-0.4331498, 0.3493459, -0.04476889, 0, 1, 0.03529412, 1,
-0.4314938, -2.16836, -2.287922, 0, 1, 0.03921569, 1,
-0.4298571, -0.5689788, -1.060356, 0, 1, 0.04705882, 1,
-0.4190674, 1.300251, -1.378316, 0, 1, 0.05098039, 1,
-0.4178212, -0.4782239, -2.92768, 0, 1, 0.05882353, 1,
-0.4113463, -1.64044, -2.378109, 0, 1, 0.0627451, 1,
-0.4053945, -0.5894955, -1.268142, 0, 1, 0.07058824, 1,
-0.4043128, 1.198548, -1.368628, 0, 1, 0.07450981, 1,
-0.4009676, -1.029436, -2.953795, 0, 1, 0.08235294, 1,
-0.3970087, -0.006458274, -0.8336433, 0, 1, 0.08627451, 1,
-0.3962905, 1.273886, 0.7479932, 0, 1, 0.09411765, 1,
-0.3947828, 1.033555, -2.366546, 0, 1, 0.1019608, 1,
-0.3919231, 0.4991845, -1.005911, 0, 1, 0.1058824, 1,
-0.3911825, 2.277205, 1.080845, 0, 1, 0.1137255, 1,
-0.3869064, 0.4838932, -0.7641029, 0, 1, 0.1176471, 1,
-0.3817597, -0.4640636, -4.809948, 0, 1, 0.1254902, 1,
-0.3797283, -0.09335251, -1.021472, 0, 1, 0.1294118, 1,
-0.372242, 0.4927202, -1.515345, 0, 1, 0.1372549, 1,
-0.3715323, -1.455291, -2.819107, 0, 1, 0.1411765, 1,
-0.3622881, -2.188353, -3.321782, 0, 1, 0.1490196, 1,
-0.3554999, 1.371356, -1.74186, 0, 1, 0.1529412, 1,
-0.3473153, -1.915893, -2.658248, 0, 1, 0.1607843, 1,
-0.3421353, -1.486923, -4.274044, 0, 1, 0.1647059, 1,
-0.3400259, -0.5011862, -4.342978, 0, 1, 0.172549, 1,
-0.3389719, -0.5743737, -2.535424, 0, 1, 0.1764706, 1,
-0.3372366, -0.4206154, -3.195519, 0, 1, 0.1843137, 1,
-0.3355883, -0.07160391, -2.621428, 0, 1, 0.1882353, 1,
-0.3343905, -0.5846811, -2.76824, 0, 1, 0.1960784, 1,
-0.3341821, -0.1064355, -3.113589, 0, 1, 0.2039216, 1,
-0.3339013, 0.1538716, -1.342147, 0, 1, 0.2078431, 1,
-0.3308798, 0.7724573, -1.708039, 0, 1, 0.2156863, 1,
-0.3264791, -0.2475828, -2.86393, 0, 1, 0.2196078, 1,
-0.3234339, -0.002492791, -2.202046, 0, 1, 0.227451, 1,
-0.3233135, -1.303388, -3.514897, 0, 1, 0.2313726, 1,
-0.3115625, -0.1305411, -2.717693, 0, 1, 0.2392157, 1,
-0.3051876, 0.7345446, -0.2849941, 0, 1, 0.2431373, 1,
-0.3028817, -1.028042, -3.325777, 0, 1, 0.2509804, 1,
-0.3006136, -0.4547581, -1.586764, 0, 1, 0.254902, 1,
-0.3001641, 0.2779247, 0.5450963, 0, 1, 0.2627451, 1,
-0.2946412, 0.7688434, 0.4942162, 0, 1, 0.2666667, 1,
-0.2920175, 2.212057, -0.5345144, 0, 1, 0.2745098, 1,
-0.2887599, 0.06357789, -2.107568, 0, 1, 0.2784314, 1,
-0.2861303, 1.534957, 0.1478674, 0, 1, 0.2862745, 1,
-0.2855941, 0.4597992, 0.3892699, 0, 1, 0.2901961, 1,
-0.2830667, -1.650274, -2.161521, 0, 1, 0.2980392, 1,
-0.2780266, 1.585112, -1.120424, 0, 1, 0.3058824, 1,
-0.2754124, 1.220241, -0.7270371, 0, 1, 0.3098039, 1,
-0.2684142, 0.01170918, -2.581552, 0, 1, 0.3176471, 1,
-0.2643517, 0.1149003, -1.0632, 0, 1, 0.3215686, 1,
-0.2604239, -1.430491, -3.37444, 0, 1, 0.3294118, 1,
-0.2600204, -1.084869, -4.220225, 0, 1, 0.3333333, 1,
-0.2537466, -0.9625646, -4.726666, 0, 1, 0.3411765, 1,
-0.2431993, 0.5224742, -1.427113, 0, 1, 0.345098, 1,
-0.2415525, 0.45473, 0.2493513, 0, 1, 0.3529412, 1,
-0.2380498, 0.4019154, 0.6907646, 0, 1, 0.3568628, 1,
-0.2320358, 1.517769, -0.235588, 0, 1, 0.3647059, 1,
-0.2312637, 0.5130171, -0.5138389, 0, 1, 0.3686275, 1,
-0.229702, 0.06542756, -0.6935247, 0, 1, 0.3764706, 1,
-0.2275447, 0.8863467, -0.1295801, 0, 1, 0.3803922, 1,
-0.2234837, -0.01626662, -0.7115681, 0, 1, 0.3882353, 1,
-0.2231485, 0.8709683, 1.781435, 0, 1, 0.3921569, 1,
-0.2222785, 0.6565488, -1.979728, 0, 1, 0.4, 1,
-0.2195747, -0.8281472, -2.180644, 0, 1, 0.4078431, 1,
-0.2163561, -0.06120595, -1.280985, 0, 1, 0.4117647, 1,
-0.2148699, -1.613895, -6.328735, 0, 1, 0.4196078, 1,
-0.2107318, 0.01229792, 1.718566, 0, 1, 0.4235294, 1,
-0.2096738, -0.2847528, -0.9428549, 0, 1, 0.4313726, 1,
-0.2092032, 0.8571339, -0.4145189, 0, 1, 0.4352941, 1,
-0.2073695, 0.6132177, -0.706012, 0, 1, 0.4431373, 1,
-0.2065951, -1.516156, -3.227379, 0, 1, 0.4470588, 1,
-0.2052672, 0.7999422, -1.429979, 0, 1, 0.454902, 1,
-0.2037601, 1.59666, 0.8421402, 0, 1, 0.4588235, 1,
-0.2019391, 0.07722396, -1.600088, 0, 1, 0.4666667, 1,
-0.2007256, 2.415869, -0.8825161, 0, 1, 0.4705882, 1,
-0.2004897, 0.8876682, -1.747951, 0, 1, 0.4784314, 1,
-0.1975425, -0.6424103, -3.372934, 0, 1, 0.4823529, 1,
-0.1960439, -0.1217779, -0.1353687, 0, 1, 0.4901961, 1,
-0.1934954, -2.517785, -1.729471, 0, 1, 0.4941176, 1,
-0.1884216, -0.009659622, -1.416147, 0, 1, 0.5019608, 1,
-0.1828081, -0.6997508, -4.265187, 0, 1, 0.509804, 1,
-0.1788916, -0.5937904, -2.412474, 0, 1, 0.5137255, 1,
-0.1772646, -1.384737, -3.637722, 0, 1, 0.5215687, 1,
-0.1769406, 0.05922266, 0.01269033, 0, 1, 0.5254902, 1,
-0.172617, -0.56541, -3.308676, 0, 1, 0.5333334, 1,
-0.1691299, 0.2265937, -1.61127, 0, 1, 0.5372549, 1,
-0.1674189, -0.1825464, -2.74875, 0, 1, 0.5450981, 1,
-0.1654653, 0.7135438, -1.758044, 0, 1, 0.5490196, 1,
-0.1605611, -0.8608842, -3.217267, 0, 1, 0.5568628, 1,
-0.15946, 0.5880607, 0.3605283, 0, 1, 0.5607843, 1,
-0.158409, -1.068885, -1.727586, 0, 1, 0.5686275, 1,
-0.1538637, -0.337348, -1.522404, 0, 1, 0.572549, 1,
-0.1537496, 1.480213, -0.06475016, 0, 1, 0.5803922, 1,
-0.1429567, 0.7297025, -0.5376943, 0, 1, 0.5843138, 1,
-0.1428487, -0.1266975, -2.642859, 0, 1, 0.5921569, 1,
-0.1418138, 1.231118, -1.126818, 0, 1, 0.5960785, 1,
-0.1412901, -0.03988981, 0.0006230236, 0, 1, 0.6039216, 1,
-0.1384808, -0.7786683, -3.46886, 0, 1, 0.6117647, 1,
-0.1380909, -0.904954, -1.926815, 0, 1, 0.6156863, 1,
-0.1369499, 0.4177637, 0.4092677, 0, 1, 0.6235294, 1,
-0.1342748, -0.02861485, -1.876395, 0, 1, 0.627451, 1,
-0.12789, 1.11339, -0.7175737, 0, 1, 0.6352941, 1,
-0.1241866, -0.9664241, -2.864682, 0, 1, 0.6392157, 1,
-0.1241195, 0.3430653, 0.6903312, 0, 1, 0.6470588, 1,
-0.1222372, -0.1380904, -4.230535, 0, 1, 0.6509804, 1,
-0.1212605, -1.115966, -1.185395, 0, 1, 0.6588235, 1,
-0.1206532, 0.9524489, 0.7424329, 0, 1, 0.6627451, 1,
-0.1199687, 2.095817, -0.1019085, 0, 1, 0.6705883, 1,
-0.1163012, -0.2154435, -3.52547, 0, 1, 0.6745098, 1,
-0.1161532, -0.7816111, -2.464941, 0, 1, 0.682353, 1,
-0.112046, 0.2641541, -1.36217, 0, 1, 0.6862745, 1,
-0.112024, -0.1533827, -2.91229, 0, 1, 0.6941177, 1,
-0.1109228, -1.296605, -2.719091, 0, 1, 0.7019608, 1,
-0.1099349, -0.8773906, -3.31344, 0, 1, 0.7058824, 1,
-0.10964, -0.486026, -1.149479, 0, 1, 0.7137255, 1,
-0.1057826, -0.6334369, -2.580955, 0, 1, 0.7176471, 1,
-0.105667, 0.8708851, -1.254771, 0, 1, 0.7254902, 1,
-0.1056398, 1.929245, -0.2014906, 0, 1, 0.7294118, 1,
-0.102486, 1.413735, -0.8013054, 0, 1, 0.7372549, 1,
-0.1014866, -0.03493293, -2.766913, 0, 1, 0.7411765, 1,
-0.09572335, -0.9874592, -3.189093, 0, 1, 0.7490196, 1,
-0.09352568, -0.9656237, -1.72318, 0, 1, 0.7529412, 1,
-0.09082674, 0.3705023, 0.76612, 0, 1, 0.7607843, 1,
-0.0864034, -0.06424748, -1.790596, 0, 1, 0.7647059, 1,
-0.08569594, 1.357805, -0.5467033, 0, 1, 0.772549, 1,
-0.08164617, 0.5748927, -0.4604924, 0, 1, 0.7764706, 1,
-0.07869804, -0.1955126, -2.06799, 0, 1, 0.7843137, 1,
-0.07152997, -0.7642328, -3.05877, 0, 1, 0.7882353, 1,
-0.06628926, 1.829916, 2.122749, 0, 1, 0.7960784, 1,
-0.06077979, -0.09667462, -3.719832, 0, 1, 0.8039216, 1,
-0.05630079, -0.1545679, -1.511284, 0, 1, 0.8078431, 1,
-0.0536161, 0.01817036, -0.1432604, 0, 1, 0.8156863, 1,
-0.05335942, -0.3189166, -3.266738, 0, 1, 0.8196079, 1,
-0.05047971, 0.6351666, 1.587704, 0, 1, 0.827451, 1,
-0.05017303, -2.109601, -2.963731, 0, 1, 0.8313726, 1,
-0.04589593, 0.06659628, 1.019003, 0, 1, 0.8392157, 1,
-0.04452319, -0.1696342, -1.570115, 0, 1, 0.8431373, 1,
-0.0355734, 0.3800397, 0.5411636, 0, 1, 0.8509804, 1,
-0.03465113, 1.378724, 0.5896165, 0, 1, 0.854902, 1,
-0.03409035, 1.288169, 0.6588483, 0, 1, 0.8627451, 1,
-0.03058564, 0.9788821, 0.96565, 0, 1, 0.8666667, 1,
-0.03056584, -0.253883, -3.945594, 0, 1, 0.8745098, 1,
-0.02991794, 1.171649, 0.1233027, 0, 1, 0.8784314, 1,
-0.02771662, -0.7943907, -3.247134, 0, 1, 0.8862745, 1,
-0.02704961, -1.360922, -2.922559, 0, 1, 0.8901961, 1,
-0.0220369, -0.6407316, -4.014044, 0, 1, 0.8980392, 1,
-0.02107962, -0.3924547, -4.420499, 0, 1, 0.9058824, 1,
-0.01959685, 1.030198, -0.1213788, 0, 1, 0.9098039, 1,
-0.01470112, -0.5163338, -3.186392, 0, 1, 0.9176471, 1,
-0.01229973, 0.1039514, 0.1128673, 0, 1, 0.9215686, 1,
-0.002531052, 0.4855793, -0.7690002, 0, 1, 0.9294118, 1,
7.93714e-05, -0.419378, 2.740363, 0, 1, 0.9333333, 1,
0.00074084, -0.4859541, 1.623115, 0, 1, 0.9411765, 1,
0.002091946, -0.3949753, 3.595453, 0, 1, 0.945098, 1,
0.002361594, 0.1251706, 0.9195431, 0, 1, 0.9529412, 1,
0.006665799, 0.2883148, -0.2646305, 0, 1, 0.9568627, 1,
0.008685234, 2.391299, 0.1930076, 0, 1, 0.9647059, 1,
0.009073218, 1.429181, -0.7803573, 0, 1, 0.9686275, 1,
0.01057753, 0.4684683, 0.9079061, 0, 1, 0.9764706, 1,
0.01076113, 0.05184471, 0.05622941, 0, 1, 0.9803922, 1,
0.01082133, 0.5441747, -0.1126557, 0, 1, 0.9882353, 1,
0.01166604, -1.67158, 3.438443, 0, 1, 0.9921569, 1,
0.01241674, -0.4618019, 3.550436, 0, 1, 1, 1,
0.01752906, 0.4597802, -1.246876, 0, 0.9921569, 1, 1,
0.01774163, -1.154622, 6.007699, 0, 0.9882353, 1, 1,
0.01848278, -0.9417003, 3.811892, 0, 0.9803922, 1, 1,
0.02442685, -0.8907911, 3.003199, 0, 0.9764706, 1, 1,
0.02741259, 1.430283, -0.1057196, 0, 0.9686275, 1, 1,
0.0286405, 0.7565401, 1.827793, 0, 0.9647059, 1, 1,
0.03166907, 1.336624, -1.039603, 0, 0.9568627, 1, 1,
0.035337, 2.081424, -0.8297346, 0, 0.9529412, 1, 1,
0.03652318, 0.3304962, -0.005541228, 0, 0.945098, 1, 1,
0.03868381, 0.9520481, -0.3737034, 0, 0.9411765, 1, 1,
0.04716524, 1.43576, -0.3443577, 0, 0.9333333, 1, 1,
0.05476819, 0.7538797, 0.4019204, 0, 0.9294118, 1, 1,
0.0560117, 2.166593, 1.877165, 0, 0.9215686, 1, 1,
0.05819779, 1.942319, -0.5203376, 0, 0.9176471, 1, 1,
0.05933385, -1.011003, 1.953783, 0, 0.9098039, 1, 1,
0.0609089, 1.366595, -0.2621437, 0, 0.9058824, 1, 1,
0.06104677, 0.3927457, -0.7297513, 0, 0.8980392, 1, 1,
0.06461249, 0.7288606, -1.055588, 0, 0.8901961, 1, 1,
0.06760285, -1.093044, 1.987925, 0, 0.8862745, 1, 1,
0.06885493, -0.01634943, 1.844874, 0, 0.8784314, 1, 1,
0.06906951, 0.5916675, 0.3294528, 0, 0.8745098, 1, 1,
0.07152028, -0.7283776, 3.465503, 0, 0.8666667, 1, 1,
0.07178923, -1.040261, 2.814258, 0, 0.8627451, 1, 1,
0.07335373, -1.028987, 2.771014, 0, 0.854902, 1, 1,
0.0759071, -1.161502, 4.492088, 0, 0.8509804, 1, 1,
0.0797505, 0.8094579, -0.08548731, 0, 0.8431373, 1, 1,
0.08307125, -0.2839971, 3.349135, 0, 0.8392157, 1, 1,
0.08354457, 0.02194967, 1.114276, 0, 0.8313726, 1, 1,
0.08546586, 1.152758, -0.8789755, 0, 0.827451, 1, 1,
0.09415523, 0.08701083, -0.6210521, 0, 0.8196079, 1, 1,
0.1144434, -2.114489, 3.972476, 0, 0.8156863, 1, 1,
0.1168557, -1.594074, 4.624867, 0, 0.8078431, 1, 1,
0.1236967, -0.6863499, 1.690691, 0, 0.8039216, 1, 1,
0.1293916, -0.009194795, 1.387979, 0, 0.7960784, 1, 1,
0.1389658, -2.489349, 4.598535, 0, 0.7882353, 1, 1,
0.1397582, -1.142782, 2.366361, 0, 0.7843137, 1, 1,
0.1399808, -1.95318, 4.111601, 0, 0.7764706, 1, 1,
0.140525, -0.007863524, 0.5762991, 0, 0.772549, 1, 1,
0.1414454, 0.1523237, -0.2513966, 0, 0.7647059, 1, 1,
0.1422117, -0.7357287, 2.624071, 0, 0.7607843, 1, 1,
0.1491038, 0.3635015, 0.4573493, 0, 0.7529412, 1, 1,
0.149704, -1.117785, 3.533008, 0, 0.7490196, 1, 1,
0.1518013, 0.9799207, 0.6225976, 0, 0.7411765, 1, 1,
0.1536213, -1.569184, 1.381244, 0, 0.7372549, 1, 1,
0.1546673, 0.2487895, 0.2661449, 0, 0.7294118, 1, 1,
0.1551173, -1.200036, 4.767134, 0, 0.7254902, 1, 1,
0.1562439, -0.4431609, 3.327787, 0, 0.7176471, 1, 1,
0.1622183, 0.1212867, 1.014671, 0, 0.7137255, 1, 1,
0.1632903, 0.5155612, -1.461508, 0, 0.7058824, 1, 1,
0.1642698, 0.9980071, 1.868658, 0, 0.6980392, 1, 1,
0.1648656, 0.182745, 1.66038, 0, 0.6941177, 1, 1,
0.1662534, 0.1723188, 1.032454, 0, 0.6862745, 1, 1,
0.1683236, -0.3382039, 3.369388, 0, 0.682353, 1, 1,
0.1694807, 0.2860308, 0.0885525, 0, 0.6745098, 1, 1,
0.1694902, -0.6121003, 0.8866009, 0, 0.6705883, 1, 1,
0.1700729, 1.336735, 0.7711663, 0, 0.6627451, 1, 1,
0.1789544, 1.350785, 0.5746221, 0, 0.6588235, 1, 1,
0.1823186, -0.6089558, 2.296742, 0, 0.6509804, 1, 1,
0.1840329, 0.2999097, -0.06513561, 0, 0.6470588, 1, 1,
0.1864699, -0.7084686, 2.703245, 0, 0.6392157, 1, 1,
0.188386, -1.615162, 2.507183, 0, 0.6352941, 1, 1,
0.1951167, -0.03164178, 1.914348, 0, 0.627451, 1, 1,
0.2056922, 0.8667938, 1.365312, 0, 0.6235294, 1, 1,
0.2057182, 0.4132555, 0.6586276, 0, 0.6156863, 1, 1,
0.2059253, 1.38788, 0.6978011, 0, 0.6117647, 1, 1,
0.2065368, 0.8064834, -1.136059, 0, 0.6039216, 1, 1,
0.2089848, 0.5002029, 0.4563189, 0, 0.5960785, 1, 1,
0.2089851, -0.09867205, 1.391682, 0, 0.5921569, 1, 1,
0.2139401, 1.100878, -0.2956055, 0, 0.5843138, 1, 1,
0.2144113, -1.594448, 2.414997, 0, 0.5803922, 1, 1,
0.2148625, -0.694414, 5.856964, 0, 0.572549, 1, 1,
0.2164236, -0.506242, 3.892302, 0, 0.5686275, 1, 1,
0.2193886, 0.1913246, 1.368533, 0, 0.5607843, 1, 1,
0.2227761, -1.94285, 1.658191, 0, 0.5568628, 1, 1,
0.2237787, 1.076349, -0.2017087, 0, 0.5490196, 1, 1,
0.2242595, -0.2502587, 0.6803658, 0, 0.5450981, 1, 1,
0.2336878, 0.4553894, -0.2369042, 0, 0.5372549, 1, 1,
0.2361271, 0.0759256, 0.03403994, 0, 0.5333334, 1, 1,
0.2385668, 0.3850176, 1.994533, 0, 0.5254902, 1, 1,
0.24188, 2.753588, 0.3626466, 0, 0.5215687, 1, 1,
0.2443538, -1.203745, 4.229588, 0, 0.5137255, 1, 1,
0.2465994, -1.009255, 2.799388, 0, 0.509804, 1, 1,
0.2522061, -1.451284, 0.6135514, 0, 0.5019608, 1, 1,
0.252472, 0.1176419, 0.004943324, 0, 0.4941176, 1, 1,
0.2525562, -1.329961, 5.422188, 0, 0.4901961, 1, 1,
0.2562011, -0.8364743, 1.034274, 0, 0.4823529, 1, 1,
0.2566472, 0.8469294, 1.922148, 0, 0.4784314, 1, 1,
0.2591367, -0.8911238, 4.149711, 0, 0.4705882, 1, 1,
0.2592258, -3.310395, 2.290884, 0, 0.4666667, 1, 1,
0.2600228, -0.373676, 2.609476, 0, 0.4588235, 1, 1,
0.2666553, 2.213166, -1.471313, 0, 0.454902, 1, 1,
0.2702836, 0.9064354, 0.5553663, 0, 0.4470588, 1, 1,
0.2710869, 1.341147, 2.256726, 0, 0.4431373, 1, 1,
0.2737458, -1.596943, 3.711929, 0, 0.4352941, 1, 1,
0.276212, -2.216577, 2.176753, 0, 0.4313726, 1, 1,
0.2765743, 1.82101, -1.101297, 0, 0.4235294, 1, 1,
0.2782195, -0.1503541, 3.374326, 0, 0.4196078, 1, 1,
0.2796727, 0.528483, -0.9788353, 0, 0.4117647, 1, 1,
0.2811991, -1.416748, 2.793605, 0, 0.4078431, 1, 1,
0.2815984, 0.1800177, 0.6022094, 0, 0.4, 1, 1,
0.2866489, 0.3759654, -1.556214, 0, 0.3921569, 1, 1,
0.2921039, 0.2856801, 0.141591, 0, 0.3882353, 1, 1,
0.2935322, -0.05472034, 2.336917, 0, 0.3803922, 1, 1,
0.2935869, 0.9269496, -0.7729321, 0, 0.3764706, 1, 1,
0.296375, -0.6501063, 2.495324, 0, 0.3686275, 1, 1,
0.306216, 1.558868, -0.5371336, 0, 0.3647059, 1, 1,
0.3074166, 0.3039119, 0.3191722, 0, 0.3568628, 1, 1,
0.3082725, -0.8003536, 3.787109, 0, 0.3529412, 1, 1,
0.3090933, -0.1927961, 1.915486, 0, 0.345098, 1, 1,
0.309574, -0.6498442, 2.469107, 0, 0.3411765, 1, 1,
0.3152957, 0.37253, 1.777189, 0, 0.3333333, 1, 1,
0.3167484, 1.349696, -1.110688, 0, 0.3294118, 1, 1,
0.3186068, -0.3739546, 0.6023177, 0, 0.3215686, 1, 1,
0.3219111, 1.084391, -0.2431102, 0, 0.3176471, 1, 1,
0.3227311, 1.11157, 0.334741, 0, 0.3098039, 1, 1,
0.3305525, 0.5187583, 0.4810211, 0, 0.3058824, 1, 1,
0.3330663, -1.999204, 3.16504, 0, 0.2980392, 1, 1,
0.3348024, -0.6632552, 2.968964, 0, 0.2901961, 1, 1,
0.3368405, 0.3164376, 1.994123, 0, 0.2862745, 1, 1,
0.3378875, 0.6129366, 0.7181661, 0, 0.2784314, 1, 1,
0.3400032, 0.3898837, -0.5898271, 0, 0.2745098, 1, 1,
0.3422838, -0.4354633, 3.947213, 0, 0.2666667, 1, 1,
0.3434805, -1.036017, 2.305746, 0, 0.2627451, 1, 1,
0.3462056, 0.6534467, -0.04351429, 0, 0.254902, 1, 1,
0.3487393, 1.086329, -0.9432436, 0, 0.2509804, 1, 1,
0.3496184, -0.5075967, 0.5758775, 0, 0.2431373, 1, 1,
0.3496597, 1.489743, -0.1760583, 0, 0.2392157, 1, 1,
0.3503817, -0.8409143, 2.860991, 0, 0.2313726, 1, 1,
0.3515033, 0.5100175, 0.3025502, 0, 0.227451, 1, 1,
0.3517479, 0.7000782, -1.060342, 0, 0.2196078, 1, 1,
0.3522417, 0.465536, 0.3700875, 0, 0.2156863, 1, 1,
0.3528974, -0.3129801, 2.494653, 0, 0.2078431, 1, 1,
0.3548298, 0.6493943, 1.096496, 0, 0.2039216, 1, 1,
0.3580418, -0.6311027, 1.478664, 0, 0.1960784, 1, 1,
0.3582701, -0.004187539, 1.251487, 0, 0.1882353, 1, 1,
0.3596677, -1.535094, 4.338943, 0, 0.1843137, 1, 1,
0.3649752, -1.035326, 3.416022, 0, 0.1764706, 1, 1,
0.3664482, -1.17004, 1.248767, 0, 0.172549, 1, 1,
0.3683739, 1.854977, 0.3971561, 0, 0.1647059, 1, 1,
0.3695563, -0.3001598, 2.116542, 0, 0.1607843, 1, 1,
0.3699932, 0.07854895, 1.810154, 0, 0.1529412, 1, 1,
0.3725397, 0.5635228, 1.20712, 0, 0.1490196, 1, 1,
0.3742131, 0.5464417, -0.1530847, 0, 0.1411765, 1, 1,
0.3760447, -0.2612448, 3.045251, 0, 0.1372549, 1, 1,
0.3801248, -1.192814, 2.766761, 0, 0.1294118, 1, 1,
0.3823639, -1.275819, 2.784839, 0, 0.1254902, 1, 1,
0.3833384, 1.667673, -0.1559622, 0, 0.1176471, 1, 1,
0.3865793, 0.1688205, 0.6741717, 0, 0.1137255, 1, 1,
0.3872498, -1.2009, 2.405752, 0, 0.1058824, 1, 1,
0.3907828, -0.1725096, 1.489709, 0, 0.09803922, 1, 1,
0.3910757, -1.026791, 2.600456, 0, 0.09411765, 1, 1,
0.3914152, 1.448094, -0.4933675, 0, 0.08627451, 1, 1,
0.3925887, 0.1962029, 1.458774, 0, 0.08235294, 1, 1,
0.3948541, -0.9342831, 2.605227, 0, 0.07450981, 1, 1,
0.3971842, 1.335973, 0.4982901, 0, 0.07058824, 1, 1,
0.3974931, 1.28699, -0.410776, 0, 0.0627451, 1, 1,
0.401162, 0.1802659, 1.252763, 0, 0.05882353, 1, 1,
0.4049565, -0.5910755, 0.7944044, 0, 0.05098039, 1, 1,
0.4116326, -0.4491878, 3.569222, 0, 0.04705882, 1, 1,
0.4135415, -0.2642704, 3.29032, 0, 0.03921569, 1, 1,
0.4171444, 0.650585, 0.8257219, 0, 0.03529412, 1, 1,
0.4173315, -0.6025161, 3.400514, 0, 0.02745098, 1, 1,
0.4254884, -0.5440024, 2.430438, 0, 0.02352941, 1, 1,
0.4256379, 1.219221, -0.6678106, 0, 0.01568628, 1, 1,
0.4260659, -0.1134474, 1.777307, 0, 0.01176471, 1, 1,
0.4265862, -0.8180926, 1.605855, 0, 0.003921569, 1, 1,
0.4284064, 0.4144363, -0.1092985, 0.003921569, 0, 1, 1,
0.4290407, -0.8853524, -0.389796, 0.007843138, 0, 1, 1,
0.4294226, 0.5796257, -0.1372243, 0.01568628, 0, 1, 1,
0.4301662, 0.3175703, 0.886788, 0.01960784, 0, 1, 1,
0.4315522, 0.6557904, 2.630465, 0.02745098, 0, 1, 1,
0.4339079, -0.1302388, 0.3731312, 0.03137255, 0, 1, 1,
0.4362708, 0.7771462, 0.9678059, 0.03921569, 0, 1, 1,
0.4365312, 1.624684, -1.269858, 0.04313726, 0, 1, 1,
0.4372242, -0.1662182, 1.549033, 0.05098039, 0, 1, 1,
0.437299, 1.480995, 1.922067, 0.05490196, 0, 1, 1,
0.4445923, -1.16689, 2.942165, 0.0627451, 0, 1, 1,
0.4486618, 0.09465762, -0.0584778, 0.06666667, 0, 1, 1,
0.4522509, -0.3765045, 1.144754, 0.07450981, 0, 1, 1,
0.4533208, -0.59566, 2.310823, 0.07843138, 0, 1, 1,
0.4539825, 0.5571589, 0.05509179, 0.08627451, 0, 1, 1,
0.4555781, 0.874878, 0.8506011, 0.09019608, 0, 1, 1,
0.4580041, 0.7860775, -0.3360628, 0.09803922, 0, 1, 1,
0.4592419, -1.34564, 1.325724, 0.1058824, 0, 1, 1,
0.4593143, -0.5986984, 3.345492, 0.1098039, 0, 1, 1,
0.4660097, -1.05661, 2.69905, 0.1176471, 0, 1, 1,
0.4676259, -0.277823, 2.105998, 0.1215686, 0, 1, 1,
0.4710694, 0.2474094, 2.304759, 0.1294118, 0, 1, 1,
0.4724839, 0.5813171, 0.8381136, 0.1333333, 0, 1, 1,
0.4732087, 0.04251874, 0.9187021, 0.1411765, 0, 1, 1,
0.4746788, 0.6289266, 1.749673, 0.145098, 0, 1, 1,
0.4759868, -0.2472867, 2.143577, 0.1529412, 0, 1, 1,
0.4806552, -1.016394, 2.823989, 0.1568628, 0, 1, 1,
0.483517, 1.057431, 1.570899, 0.1647059, 0, 1, 1,
0.4865345, 0.8724579, -0.9197429, 0.1686275, 0, 1, 1,
0.4950503, 1.151315, 0.5369843, 0.1764706, 0, 1, 1,
0.4971595, 0.8786517, 0.09904771, 0.1803922, 0, 1, 1,
0.5017974, -0.2216057, 1.616903, 0.1882353, 0, 1, 1,
0.5048795, 0.2792565, 2.611757, 0.1921569, 0, 1, 1,
0.5066211, -0.7438537, 2.424181, 0.2, 0, 1, 1,
0.5103625, -0.8333832, 3.049312, 0.2078431, 0, 1, 1,
0.5132594, 1.045505, 0.4109803, 0.2117647, 0, 1, 1,
0.5155877, -0.4226056, 2.792341, 0.2196078, 0, 1, 1,
0.5175194, 1.346035, 0.7074801, 0.2235294, 0, 1, 1,
0.5191083, -0.7270768, 3.111949, 0.2313726, 0, 1, 1,
0.5223286, -0.3327389, 0.9101764, 0.2352941, 0, 1, 1,
0.5284788, -0.3926784, 2.666142, 0.2431373, 0, 1, 1,
0.5295843, 0.2464571, 1.143992, 0.2470588, 0, 1, 1,
0.5444186, -0.7087577, 3.915174, 0.254902, 0, 1, 1,
0.5504521, -0.3142509, 2.377584, 0.2588235, 0, 1, 1,
0.5526258, -1.376227, 4.504677, 0.2666667, 0, 1, 1,
0.5529368, -0.6529559, 2.282588, 0.2705882, 0, 1, 1,
0.5555177, 0.486174, -0.2413109, 0.2784314, 0, 1, 1,
0.5559036, 0.02628405, 1.844727, 0.282353, 0, 1, 1,
0.569158, 0.8279018, -0.3338217, 0.2901961, 0, 1, 1,
0.5791571, -1.472496, 1.659803, 0.2941177, 0, 1, 1,
0.5814011, -1.73809, 3.382315, 0.3019608, 0, 1, 1,
0.5816622, -0.01270399, 2.569877, 0.3098039, 0, 1, 1,
0.5822767, 0.6027513, -1.363218, 0.3137255, 0, 1, 1,
0.5846659, 0.2488473, 0.429467, 0.3215686, 0, 1, 1,
0.593031, 1.027377, 0.4632341, 0.3254902, 0, 1, 1,
0.6027958, 0.9628942, 1.018343, 0.3333333, 0, 1, 1,
0.6073393, 0.7532805, 0.9321496, 0.3372549, 0, 1, 1,
0.6112021, -1.706567, 2.660079, 0.345098, 0, 1, 1,
0.6127722, 1.183825, -1.211791, 0.3490196, 0, 1, 1,
0.6147025, -0.4184277, 2.041296, 0.3568628, 0, 1, 1,
0.616555, 0.8028577, 1.608019, 0.3607843, 0, 1, 1,
0.6203429, -1.191482, 3.588154, 0.3686275, 0, 1, 1,
0.6231872, -0.5486415, 2.687725, 0.372549, 0, 1, 1,
0.6235455, -1.296141, 3.598139, 0.3803922, 0, 1, 1,
0.6256673, -0.233744, 2.066121, 0.3843137, 0, 1, 1,
0.6284121, 0.5341635, -0.1619827, 0.3921569, 0, 1, 1,
0.6299216, 0.685581, 1.098929, 0.3960784, 0, 1, 1,
0.6324194, 0.8328854, 0.3775626, 0.4039216, 0, 1, 1,
0.6380432, -0.7515941, 3.171088, 0.4117647, 0, 1, 1,
0.639578, -1.445723, 2.276924, 0.4156863, 0, 1, 1,
0.6447276, 0.7240793, 1.227707, 0.4235294, 0, 1, 1,
0.6490297, 2.237178, 1.602076, 0.427451, 0, 1, 1,
0.6562082, 2.441717, 0.191185, 0.4352941, 0, 1, 1,
0.6563905, -0.8494349, 1.072459, 0.4392157, 0, 1, 1,
0.6579266, -0.7892122, 2.721617, 0.4470588, 0, 1, 1,
0.6609538, 1.140844, 0.09865162, 0.4509804, 0, 1, 1,
0.6616412, 0.8723772, 0.4687475, 0.4588235, 0, 1, 1,
0.6646048, -1.45679, 2.817746, 0.4627451, 0, 1, 1,
0.6726454, 0.714542, 1.207774, 0.4705882, 0, 1, 1,
0.6744617, 0.1522923, 2.850887, 0.4745098, 0, 1, 1,
0.6790862, 1.207249, -0.4961832, 0.4823529, 0, 1, 1,
0.6817123, -1.124828, 1.630242, 0.4862745, 0, 1, 1,
0.6878632, 0.04866419, 1.246652, 0.4941176, 0, 1, 1,
0.6888967, 0.5623438, 0.6193289, 0.5019608, 0, 1, 1,
0.6895744, 0.2111696, 1.976664, 0.5058824, 0, 1, 1,
0.6898313, 0.2051248, 1.237127, 0.5137255, 0, 1, 1,
0.6902788, -0.2256187, 2.939033, 0.5176471, 0, 1, 1,
0.6937352, -1.727642, 2.049989, 0.5254902, 0, 1, 1,
0.6939818, 0.9548572, -0.9282095, 0.5294118, 0, 1, 1,
0.6940466, 1.788933, 0.5311045, 0.5372549, 0, 1, 1,
0.6948871, -0.4070719, 1.445955, 0.5411765, 0, 1, 1,
0.6954361, -1.466226, 2.573212, 0.5490196, 0, 1, 1,
0.6968117, -0.4676312, 1.930703, 0.5529412, 0, 1, 1,
0.6970429, -0.7352697, 0.4692595, 0.5607843, 0, 1, 1,
0.6978515, 0.2886569, 2.162111, 0.5647059, 0, 1, 1,
0.7000735, 0.1392448, -0.1346413, 0.572549, 0, 1, 1,
0.704228, 0.4565298, 0.4034483, 0.5764706, 0, 1, 1,
0.7045192, -1.224277, 3.021962, 0.5843138, 0, 1, 1,
0.7048965, 1.347622, 2.186619, 0.5882353, 0, 1, 1,
0.7066168, 0.3199166, 1.735908, 0.5960785, 0, 1, 1,
0.7139336, -1.539984, 2.265619, 0.6039216, 0, 1, 1,
0.7169901, -0.04599748, -0.06644961, 0.6078432, 0, 1, 1,
0.7180143, -0.3304949, 4.218832, 0.6156863, 0, 1, 1,
0.7234846, 1.185369, -0.257464, 0.6196079, 0, 1, 1,
0.7284442, 1.601589, -0.9794276, 0.627451, 0, 1, 1,
0.7346479, -0.1536581, -0.2917069, 0.6313726, 0, 1, 1,
0.7356054, -1.196638, 1.833407, 0.6392157, 0, 1, 1,
0.7394103, -3.007303, 3.507207, 0.6431373, 0, 1, 1,
0.741843, 0.5494677, 1.141611, 0.6509804, 0, 1, 1,
0.7450601, 0.2803122, 1.044064, 0.654902, 0, 1, 1,
0.7464207, 0.286258, 0.8864614, 0.6627451, 0, 1, 1,
0.7495509, -0.9358024, 2.426389, 0.6666667, 0, 1, 1,
0.7550178, -0.620504, 3.984187, 0.6745098, 0, 1, 1,
0.7557291, 0.4891913, 2.141272, 0.6784314, 0, 1, 1,
0.7564061, -2.225697, 2.664948, 0.6862745, 0, 1, 1,
0.7608661, -0.3024801, 0.9946818, 0.6901961, 0, 1, 1,
0.7609408, 0.4487132, 1.021739, 0.6980392, 0, 1, 1,
0.7698931, 0.8667384, 1.184617, 0.7058824, 0, 1, 1,
0.7711805, -1.217687, 2.127817, 0.7098039, 0, 1, 1,
0.776615, -0.1710727, 0.5487885, 0.7176471, 0, 1, 1,
0.7780881, -1.525276, 3.480633, 0.7215686, 0, 1, 1,
0.7784553, -1.198605, 3.372024, 0.7294118, 0, 1, 1,
0.7857864, -1.07205, 2.038418, 0.7333333, 0, 1, 1,
0.7887008, 1.582311, 1.276473, 0.7411765, 0, 1, 1,
0.7960157, 0.6196731, -0.4140685, 0.7450981, 0, 1, 1,
0.799373, -0.9317485, 1.814932, 0.7529412, 0, 1, 1,
0.7998493, 1.007273, 0.6390871, 0.7568628, 0, 1, 1,
0.8017732, -1.299982, 3.064713, 0.7647059, 0, 1, 1,
0.8100187, -0.7084439, 1.569711, 0.7686275, 0, 1, 1,
0.8118203, 0.09183422, 2.065268, 0.7764706, 0, 1, 1,
0.8131009, 0.1757579, 0.1751831, 0.7803922, 0, 1, 1,
0.8138361, -0.5675952, 1.565148, 0.7882353, 0, 1, 1,
0.8220825, 1.384971, 1.090283, 0.7921569, 0, 1, 1,
0.8240664, -0.009966439, 0.6773627, 0.8, 0, 1, 1,
0.8268796, 0.1434222, 0.7776868, 0.8078431, 0, 1, 1,
0.8272585, -1.123936, 3.373088, 0.8117647, 0, 1, 1,
0.8310003, 1.095187, -0.6703427, 0.8196079, 0, 1, 1,
0.8329919, 1.035475, 1.563768, 0.8235294, 0, 1, 1,
0.8337118, -1.809438, 3.098506, 0.8313726, 0, 1, 1,
0.8340411, -1.17042, 3.364324, 0.8352941, 0, 1, 1,
0.8345891, 0.3031449, 2.475967, 0.8431373, 0, 1, 1,
0.8348084, -0.06219689, 2.282668, 0.8470588, 0, 1, 1,
0.8373103, 0.5365002, 0.005438201, 0.854902, 0, 1, 1,
0.8383428, 0.7234095, 1.104519, 0.8588235, 0, 1, 1,
0.8414926, 0.7747858, 3.094622, 0.8666667, 0, 1, 1,
0.8464422, -0.8295877, 1.560308, 0.8705882, 0, 1, 1,
0.8470619, 1.739828, 1.152693, 0.8784314, 0, 1, 1,
0.8472323, 0.09233559, 1.715052, 0.8823529, 0, 1, 1,
0.8475105, 1.036684, 1.396278, 0.8901961, 0, 1, 1,
0.8500931, -0.4515373, 2.70206, 0.8941177, 0, 1, 1,
0.8534611, 0.499675, 0.9455464, 0.9019608, 0, 1, 1,
0.8581219, 1.86204, 0.3278977, 0.9098039, 0, 1, 1,
0.8589672, 0.1366256, 0.781837, 0.9137255, 0, 1, 1,
0.8667477, -0.2061285, 0.7518862, 0.9215686, 0, 1, 1,
0.8694401, 0.8689653, 0.6154142, 0.9254902, 0, 1, 1,
0.8714263, 0.8665981, 0.2150113, 0.9333333, 0, 1, 1,
0.871451, 1.089525, 0.5822107, 0.9372549, 0, 1, 1,
0.8726181, -2.060061, 3.924304, 0.945098, 0, 1, 1,
0.8738173, 1.014668, 1.032975, 0.9490196, 0, 1, 1,
0.8740758, -0.04582608, 0.5524833, 0.9568627, 0, 1, 1,
0.8747255, 0.55927, 1.589074, 0.9607843, 0, 1, 1,
0.8836143, 1.266688, -0.3041382, 0.9686275, 0, 1, 1,
0.8846557, -1.00957, 1.404464, 0.972549, 0, 1, 1,
0.88709, -1.139387, 3.645264, 0.9803922, 0, 1, 1,
0.8932829, 0.08114219, 0.3705022, 0.9843137, 0, 1, 1,
0.8937796, 1.856599, -1.809178, 0.9921569, 0, 1, 1,
0.8957738, 2.381323, 1.290409, 0.9960784, 0, 1, 1,
0.8989649, -0.5306605, 2.96752, 1, 0, 0.9960784, 1,
0.9037092, -0.2834184, 1.710598, 1, 0, 0.9882353, 1,
0.9044412, 1.551054, -0.3860179, 1, 0, 0.9843137, 1,
0.9107943, 2.174669, 0.8385381, 1, 0, 0.9764706, 1,
0.9191791, 0.5387822, -0.1387708, 1, 0, 0.972549, 1,
0.9271706, -0.5161983, 1.572581, 1, 0, 0.9647059, 1,
0.9274235, 0.7721269, 1.102137, 1, 0, 0.9607843, 1,
0.9309316, -0.07831863, 1.725965, 1, 0, 0.9529412, 1,
0.9515736, -0.8986021, 1.864142, 1, 0, 0.9490196, 1,
0.9537305, -0.2104662, 2.476123, 1, 0, 0.9411765, 1,
0.955654, -1.659868, 2.474238, 1, 0, 0.9372549, 1,
0.9600836, 1.525296, -0.1040193, 1, 0, 0.9294118, 1,
0.9657383, -1.440927, 3.486475, 1, 0, 0.9254902, 1,
0.9677963, 0.2909144, 2.277899, 1, 0, 0.9176471, 1,
0.9679179, -0.1477988, 2.631677, 1, 0, 0.9137255, 1,
0.9685217, -1.419641, 2.392657, 1, 0, 0.9058824, 1,
0.9864482, -0.6327071, 3.146705, 1, 0, 0.9019608, 1,
0.9902006, 1.310719, 1.15533, 1, 0, 0.8941177, 1,
0.9913067, -0.5815027, 1.469486, 1, 0, 0.8862745, 1,
0.9926479, -0.6547268, 2.118479, 1, 0, 0.8823529, 1,
0.9971937, -1.773616, 2.807794, 1, 0, 0.8745098, 1,
1.00603, -0.488829, 2.426361, 1, 0, 0.8705882, 1,
1.007097, 0.527449, 1.315213, 1, 0, 0.8627451, 1,
1.019676, -0.7200832, 2.288491, 1, 0, 0.8588235, 1,
1.01972, -1.469324, 2.022617, 1, 0, 0.8509804, 1,
1.028702, -0.9252158, 1.829329, 1, 0, 0.8470588, 1,
1.031209, 0.226839, 2.553332, 1, 0, 0.8392157, 1,
1.063993, 0.02576018, 3.934954, 1, 0, 0.8352941, 1,
1.072561, 0.4669491, 2.11504, 1, 0, 0.827451, 1,
1.072567, 1.032164, 1.165181, 1, 0, 0.8235294, 1,
1.074135, 1.178595, 1.02887, 1, 0, 0.8156863, 1,
1.074374, -0.5816821, 2.493878, 1, 0, 0.8117647, 1,
1.084858, -0.7978308, 3.739467, 1, 0, 0.8039216, 1,
1.089271, -1.133713, 1.852942, 1, 0, 0.7960784, 1,
1.09126, 0.6656535, 0.8440422, 1, 0, 0.7921569, 1,
1.105569, 0.04513417, 2.466505, 1, 0, 0.7843137, 1,
1.10726, -1.394812, 3.801963, 1, 0, 0.7803922, 1,
1.117997, 2.11368, -0.2507887, 1, 0, 0.772549, 1,
1.120283, -0.139988, 0.4578171, 1, 0, 0.7686275, 1,
1.122858, -1.287487, 1.52639, 1, 0, 0.7607843, 1,
1.12305, 0.3708822, 1.712733, 1, 0, 0.7568628, 1,
1.139359, -0.216468, 0.7048946, 1, 0, 0.7490196, 1,
1.145239, 1.022372, 1.865273, 1, 0, 0.7450981, 1,
1.151304, 1.476735, 1.25253, 1, 0, 0.7372549, 1,
1.155889, -1.380454, 2.001954, 1, 0, 0.7333333, 1,
1.162118, -0.7172734, 2.416637, 1, 0, 0.7254902, 1,
1.164857, -1.742725, 1.472844, 1, 0, 0.7215686, 1,
1.183247, -0.5493955, 2.543925, 1, 0, 0.7137255, 1,
1.194688, 0.948082, 1.152588, 1, 0, 0.7098039, 1,
1.197017, 1.477754, 2.63353, 1, 0, 0.7019608, 1,
1.198878, 0.104921, 2.281382, 1, 0, 0.6941177, 1,
1.200287, -0.2210997, 0.1493629, 1, 0, 0.6901961, 1,
1.207152, 1.579615, 0.9470223, 1, 0, 0.682353, 1,
1.208969, -0.6100315, 0.563481, 1, 0, 0.6784314, 1,
1.209928, 1.360415, 1.840482, 1, 0, 0.6705883, 1,
1.213099, -1.638345, 2.538386, 1, 0, 0.6666667, 1,
1.216159, -1.146938, 2.896599, 1, 0, 0.6588235, 1,
1.2183, -2.669545, 1.796602, 1, 0, 0.654902, 1,
1.223538, 0.2759008, 0.3252084, 1, 0, 0.6470588, 1,
1.223902, 0.9881415, 0.4421979, 1, 0, 0.6431373, 1,
1.225351, -0.2554587, 1.840225, 1, 0, 0.6352941, 1,
1.226485, -0.9274696, 1.160635, 1, 0, 0.6313726, 1,
1.22795, 0.3450437, 2.853086, 1, 0, 0.6235294, 1,
1.231715, 0.7807677, -0.7077497, 1, 0, 0.6196079, 1,
1.232099, 0.1388401, 2.336343, 1, 0, 0.6117647, 1,
1.243137, 1.682166, 1.55816, 1, 0, 0.6078432, 1,
1.248338, -0.7819088, 2.846838, 1, 0, 0.6, 1,
1.250738, -1.94667, 2.319021, 1, 0, 0.5921569, 1,
1.251196, -0.2913174, 0.1578069, 1, 0, 0.5882353, 1,
1.258067, -0.4618967, 1.430637, 1, 0, 0.5803922, 1,
1.261378, 0.0489166, 0.6672136, 1, 0, 0.5764706, 1,
1.272561, -0.3485248, 2.376763, 1, 0, 0.5686275, 1,
1.275416, 0.386387, 1.045427, 1, 0, 0.5647059, 1,
1.279989, -0.1613827, 1.381212, 1, 0, 0.5568628, 1,
1.281881, 0.02637534, 2.716197, 1, 0, 0.5529412, 1,
1.29335, -0.6445441, 3.792871, 1, 0, 0.5450981, 1,
1.297032, -1.341222, 1.311246, 1, 0, 0.5411765, 1,
1.314352, 0.6505386, 0.08506037, 1, 0, 0.5333334, 1,
1.321573, -0.09373275, 1.651284, 1, 0, 0.5294118, 1,
1.337301, 0.6585138, 2.742389, 1, 0, 0.5215687, 1,
1.349386, 1.064518, 0.5134101, 1, 0, 0.5176471, 1,
1.359023, -0.6063786, 2.562064, 1, 0, 0.509804, 1,
1.366034, -0.7318075, 2.914745, 1, 0, 0.5058824, 1,
1.376132, 0.1680083, 3.405103, 1, 0, 0.4980392, 1,
1.380051, -1.289307, 1.497849, 1, 0, 0.4901961, 1,
1.38302, -0.1104022, 1.680852, 1, 0, 0.4862745, 1,
1.391189, -0.03532794, 0.1210137, 1, 0, 0.4784314, 1,
1.399632, 0.6482952, -0.7388611, 1, 0, 0.4745098, 1,
1.415417, -1.876893, 2.168874, 1, 0, 0.4666667, 1,
1.423038, -0.3726139, 2.741726, 1, 0, 0.4627451, 1,
1.428821, 0.314271, 1.701623, 1, 0, 0.454902, 1,
1.428899, 1.666739, 0.6915773, 1, 0, 0.4509804, 1,
1.429542, -0.2359826, 2.282458, 1, 0, 0.4431373, 1,
1.432009, 0.5693104, 1.941211, 1, 0, 0.4392157, 1,
1.447394, -0.8867855, 2.410017, 1, 0, 0.4313726, 1,
1.469172, -1.020277, 1.909642, 1, 0, 0.427451, 1,
1.47868, -0.2069793, 1.136532, 1, 0, 0.4196078, 1,
1.479139, 0.70385, 1.170595, 1, 0, 0.4156863, 1,
1.490254, -0.3050957, 1.816588, 1, 0, 0.4078431, 1,
1.497344, -0.6500749, 0.6069459, 1, 0, 0.4039216, 1,
1.518254, -0.1429992, 1.706465, 1, 0, 0.3960784, 1,
1.523945, 1.304959, 1.132844, 1, 0, 0.3882353, 1,
1.525577, 0.4036241, 1.419547, 1, 0, 0.3843137, 1,
1.530161, -0.2625422, 2.804492, 1, 0, 0.3764706, 1,
1.562628, 0.433075, 0.8839546, 1, 0, 0.372549, 1,
1.567836, 0.3715337, 2.143875, 1, 0, 0.3647059, 1,
1.570402, 1.427629, -0.3865184, 1, 0, 0.3607843, 1,
1.575771, 0.8139605, 0.8076466, 1, 0, 0.3529412, 1,
1.581942, 1.419145, -0.6161373, 1, 0, 0.3490196, 1,
1.582197, 0.8435162, -0.5757145, 1, 0, 0.3411765, 1,
1.599022, -1.266749, 1.660731, 1, 0, 0.3372549, 1,
1.614537, 1.562066, -0.217056, 1, 0, 0.3294118, 1,
1.617723, 0.670819, 0.976836, 1, 0, 0.3254902, 1,
1.634645, 0.4015517, 0.1072401, 1, 0, 0.3176471, 1,
1.640463, -0.5531807, 0.8445817, 1, 0, 0.3137255, 1,
1.644333, -1.086221, 1.934764, 1, 0, 0.3058824, 1,
1.652619, 0.07164925, 0.8038141, 1, 0, 0.2980392, 1,
1.658486, -0.4546022, 2.874352, 1, 0, 0.2941177, 1,
1.680992, 0.1725851, 1.653102, 1, 0, 0.2862745, 1,
1.696658, 0.5612154, 1.730223, 1, 0, 0.282353, 1,
1.717438, 0.2197502, 2.694542, 1, 0, 0.2745098, 1,
1.729111, 0.5112064, 1.500329, 1, 0, 0.2705882, 1,
1.736476, -0.6269528, 1.869232, 1, 0, 0.2627451, 1,
1.738466, -0.9767744, 0.8374695, 1, 0, 0.2588235, 1,
1.742332, -0.4075341, 0.1383778, 1, 0, 0.2509804, 1,
1.75724, -0.9751614, 1.038583, 1, 0, 0.2470588, 1,
1.777281, -0.1985911, 2.118606, 1, 0, 0.2392157, 1,
1.786567, 0.4023944, 1.304127, 1, 0, 0.2352941, 1,
1.798788, 0.9901064, 0.2053575, 1, 0, 0.227451, 1,
1.813236, 1.388437, 2.112474, 1, 0, 0.2235294, 1,
1.813665, 1.499764, 0.5564612, 1, 0, 0.2156863, 1,
1.818656, -0.9512334, 1.872185, 1, 0, 0.2117647, 1,
1.824178, -0.1719776, 0.05386045, 1, 0, 0.2039216, 1,
1.845783, -0.3447907, 0.8828827, 1, 0, 0.1960784, 1,
1.882073, 0.5605992, 2.755415, 1, 0, 0.1921569, 1,
1.884568, -0.884163, 1.158251, 1, 0, 0.1843137, 1,
1.906144, 0.4878927, 0.3365748, 1, 0, 0.1803922, 1,
1.910006, 0.3055741, 0.87165, 1, 0, 0.172549, 1,
1.922664, -0.207202, 1.107411, 1, 0, 0.1686275, 1,
1.941945, -0.6918027, 1.393272, 1, 0, 0.1607843, 1,
1.953466, 0.820461, 0.4485119, 1, 0, 0.1568628, 1,
1.955858, -1.090172, 3.586493, 1, 0, 0.1490196, 1,
1.971699, -0.3865595, 0.8896152, 1, 0, 0.145098, 1,
2.023314, -0.8851765, 2.323545, 1, 0, 0.1372549, 1,
2.030135, -0.7708185, 2.655639, 1, 0, 0.1333333, 1,
2.082021, -0.8137346, 4.786284, 1, 0, 0.1254902, 1,
2.083713, -2.04656, 2.252493, 1, 0, 0.1215686, 1,
2.084639, -0.4317966, 0.5117484, 1, 0, 0.1137255, 1,
2.094162, -0.4498086, -0.1636122, 1, 0, 0.1098039, 1,
2.140402, -0.5356168, 0.6252472, 1, 0, 0.1019608, 1,
2.209459, -1.776192, 2.679661, 1, 0, 0.09411765, 1,
2.271746, -1.302074, 2.209094, 1, 0, 0.09019608, 1,
2.427391, -0.2889032, 0.6567317, 1, 0, 0.08235294, 1,
2.427741, -2.706249, 2.094049, 1, 0, 0.07843138, 1,
2.436888, 0.0474385, 1.41929, 1, 0, 0.07058824, 1,
2.4901, 1.508592, 1.169065, 1, 0, 0.06666667, 1,
2.549765, 0.1822357, 2.429444, 1, 0, 0.05882353, 1,
2.562435, -1.003157, 0.7988051, 1, 0, 0.05490196, 1,
2.574802, 1.002774, 0.3531758, 1, 0, 0.04705882, 1,
2.590786, -0.615025, 2.327737, 1, 0, 0.04313726, 1,
2.614419, -1.260427, 3.250066, 1, 0, 0.03529412, 1,
2.623558, -0.5469315, 3.01121, 1, 0, 0.03137255, 1,
2.65959, -0.5907808, 1.991228, 1, 0, 0.02352941, 1,
2.750196, -0.08271179, 0.0847241, 1, 0, 0.01960784, 1,
3.072844, 2.359244, 1.947953, 1, 0, 0.01176471, 1,
3.116829, 0.7964613, 2.519623, 1, 0, 0.007843138, 1
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
-0.3100134, -4.604365, -8.419761, 0, -0.5, 0.5, 0.5,
-0.3100134, -4.604365, -8.419761, 1, -0.5, 0.5, 0.5,
-0.3100134, -4.604365, -8.419761, 1, 1.5, 0.5, 0.5,
-0.3100134, -4.604365, -8.419761, 0, 1.5, 0.5, 0.5
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
-4.898556, -0.265294, -8.419761, 0, -0.5, 0.5, 0.5,
-4.898556, -0.265294, -8.419761, 1, -0.5, 0.5, 0.5,
-4.898556, -0.265294, -8.419761, 1, 1.5, 0.5, 0.5,
-4.898556, -0.265294, -8.419761, 0, 1.5, 0.5, 0.5
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
-4.898556, -4.604365, -0.1605184, 0, -0.5, 0.5, 0.5,
-4.898556, -4.604365, -0.1605184, 1, -0.5, 0.5, 0.5,
-4.898556, -4.604365, -0.1605184, 1, 1.5, 0.5, 0.5,
-4.898556, -4.604365, -0.1605184, 0, 1.5, 0.5, 0.5
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
-3, -3.603041, -6.513782,
3, -3.603041, -6.513782,
-3, -3.603041, -6.513782,
-3, -3.769928, -6.831445,
-2, -3.603041, -6.513782,
-2, -3.769928, -6.831445,
-1, -3.603041, -6.513782,
-1, -3.769928, -6.831445,
0, -3.603041, -6.513782,
0, -3.769928, -6.831445,
1, -3.603041, -6.513782,
1, -3.769928, -6.831445,
2, -3.603041, -6.513782,
2, -3.769928, -6.831445,
3, -3.603041, -6.513782,
3, -3.769928, -6.831445
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
-3, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
-3, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
-3, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
-3, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
-2, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
-2, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
-2, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
-2, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
-1, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
-1, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
-1, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
-1, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
0, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
0, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
0, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
0, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
1, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
1, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
1, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
1, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
2, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
2, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
2, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
2, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5,
3, -4.103703, -7.466772, 0, -0.5, 0.5, 0.5,
3, -4.103703, -7.466772, 1, -0.5, 0.5, 0.5,
3, -4.103703, -7.466772, 1, 1.5, 0.5, 0.5,
3, -4.103703, -7.466772, 0, 1.5, 0.5, 0.5
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
-3.839662, -3, -6.513782,
-3.839662, 2, -6.513782,
-3.839662, -3, -6.513782,
-4.016144, -3, -6.831445,
-3.839662, -2, -6.513782,
-4.016144, -2, -6.831445,
-3.839662, -1, -6.513782,
-4.016144, -1, -6.831445,
-3.839662, 0, -6.513782,
-4.016144, 0, -6.831445,
-3.839662, 1, -6.513782,
-4.016144, 1, -6.831445,
-3.839662, 2, -6.513782,
-4.016144, 2, -6.831445
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
-4.369109, -3, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, -3, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, -3, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, -3, -7.466772, 0, 1.5, 0.5, 0.5,
-4.369109, -2, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, -2, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, -2, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, -2, -7.466772, 0, 1.5, 0.5, 0.5,
-4.369109, -1, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, -1, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, -1, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, -1, -7.466772, 0, 1.5, 0.5, 0.5,
-4.369109, 0, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, 0, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, 0, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, 0, -7.466772, 0, 1.5, 0.5, 0.5,
-4.369109, 1, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, 1, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, 1, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, 1, -7.466772, 0, 1.5, 0.5, 0.5,
-4.369109, 2, -7.466772, 0, -0.5, 0.5, 0.5,
-4.369109, 2, -7.466772, 1, -0.5, 0.5, 0.5,
-4.369109, 2, -7.466772, 1, 1.5, 0.5, 0.5,
-4.369109, 2, -7.466772, 0, 1.5, 0.5, 0.5
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
-3.839662, -3.603041, -6,
-3.839662, -3.603041, 6,
-3.839662, -3.603041, -6,
-4.016144, -3.769928, -6,
-3.839662, -3.603041, -4,
-4.016144, -3.769928, -4,
-3.839662, -3.603041, -2,
-4.016144, -3.769928, -2,
-3.839662, -3.603041, 0,
-4.016144, -3.769928, 0,
-3.839662, -3.603041, 2,
-4.016144, -3.769928, 2,
-3.839662, -3.603041, 4,
-4.016144, -3.769928, 4,
-3.839662, -3.603041, 6,
-4.016144, -3.769928, 6
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
"-6",
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
-4.369109, -4.103703, -6, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -6, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -6, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, -6, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, -4, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -4, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -4, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, -4, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, -2, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -2, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, -2, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, -2, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 0, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 0, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 0, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 0, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 2, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 2, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 2, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 2, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 4, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 4, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 4, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 4, 0, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 6, 0, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 6, 1, -0.5, 0.5, 0.5,
-4.369109, -4.103703, 6, 1, 1.5, 0.5, 0.5,
-4.369109, -4.103703, 6, 0, 1.5, 0.5, 0.5
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
-3.839662, -3.603041, -6.513782,
-3.839662, 3.072453, -6.513782,
-3.839662, -3.603041, 6.192745,
-3.839662, 3.072453, 6.192745,
-3.839662, -3.603041, -6.513782,
-3.839662, -3.603041, 6.192745,
-3.839662, 3.072453, -6.513782,
-3.839662, 3.072453, 6.192745,
-3.839662, -3.603041, -6.513782,
3.219635, -3.603041, -6.513782,
-3.839662, -3.603041, 6.192745,
3.219635, -3.603041, 6.192745,
-3.839662, 3.072453, -6.513782,
3.219635, 3.072453, -6.513782,
-3.839662, 3.072453, 6.192745,
3.219635, 3.072453, 6.192745,
3.219635, -3.603041, -6.513782,
3.219635, 3.072453, -6.513782,
3.219635, -3.603041, 6.192745,
3.219635, 3.072453, 6.192745,
3.219635, -3.603041, -6.513782,
3.219635, -3.603041, 6.192745,
3.219635, 3.072453, -6.513782,
3.219635, 3.072453, 6.192745
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
var radius = 8.541214;
var distance = 38.00083;
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
mvMatrix.translate( 0.3100134, 0.265294, 0.1605184 );
mvMatrix.scale( 1.308194, 1.383407, 0.7267862 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.00083);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
1-chloro-2-nitroprop<-read.table("1-chloro-2-nitroprop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.736856, -0.426657, 0.1306057, 0, 0, 1, 1, 1,
-3.245972, -0.9294967, -2.052907, 1, 0, 0, 1, 1,
-2.928659, 0.3384762, -2.084989, 1, 0, 0, 1, 1,
-2.723671, 0.2483093, -2.534505, 1, 0, 0, 1, 1,
-2.65567, -0.433947, -0.1922079, 1, 0, 0, 1, 1,
-2.652351, -2.402472, -3.536126, 1, 0, 0, 1, 1,
-2.630105, 0.3284861, -1.25598, 0, 0, 0, 1, 1,
-2.523665, 0.2698083, -1.069154, 0, 0, 0, 1, 1,
-2.51814, -0.8646685, -1.102346, 0, 0, 0, 1, 1,
-2.437942, 0.2607753, -1.560192, 0, 0, 0, 1, 1,
-2.434458, 1.178194, 0.01974135, 0, 0, 0, 1, 1,
-2.428557, -1.594391, -2.09414, 0, 0, 0, 1, 1,
-2.3983, -0.9511929, -2.834467, 0, 0, 0, 1, 1,
-2.366445, 0.477545, -1.517964, 1, 1, 1, 1, 1,
-2.317995, -0.295949, -2.97853, 1, 1, 1, 1, 1,
-2.310355, 0.06298485, -1.406076, 1, 1, 1, 1, 1,
-2.277622, 0.4537584, -1.694163, 1, 1, 1, 1, 1,
-2.271103, -0.3902741, -0.06812403, 1, 1, 1, 1, 1,
-2.26704, 1.241351, -0.8603951, 1, 1, 1, 1, 1,
-2.258046, 0.6213689, 0.005488819, 1, 1, 1, 1, 1,
-2.188627, 0.694514, -2.446686, 1, 1, 1, 1, 1,
-2.138662, -1.240078, -1.084626, 1, 1, 1, 1, 1,
-2.136663, -1.233894, -0.8004407, 1, 1, 1, 1, 1,
-2.109826, 1.220417, -1.168026, 1, 1, 1, 1, 1,
-2.099866, -0.4987609, -2.339236, 1, 1, 1, 1, 1,
-2.077199, 0.9800718, -2.993532, 1, 1, 1, 1, 1,
-2.030357, 0.3763061, -2.605283, 1, 1, 1, 1, 1,
-2.027359, -0.7358786, -1.597586, 1, 1, 1, 1, 1,
-2.022737, 0.4100327, -1.001862, 0, 0, 1, 1, 1,
-2.010842, -1.392054, -1.849681, 1, 0, 0, 1, 1,
-2.006616, 1.476662, -0.5800042, 1, 0, 0, 1, 1,
-1.991432, 1.284112, -0.01631114, 1, 0, 0, 1, 1,
-1.979276, -2.105809, -2.359462, 1, 0, 0, 1, 1,
-1.978085, 0.2846842, 0.9487547, 1, 0, 0, 1, 1,
-1.964163, 0.0692355, -0.4298104, 0, 0, 0, 1, 1,
-1.957523, 1.364189, -1.98366, 0, 0, 0, 1, 1,
-1.956141, -0.3884935, -2.196523, 0, 0, 0, 1, 1,
-1.952947, 0.4149613, -2.269221, 0, 0, 0, 1, 1,
-1.952594, -0.5568392, -2.598588, 0, 0, 0, 1, 1,
-1.94634, 0.303232, -1.864247, 0, 0, 0, 1, 1,
-1.918539, -0.1863921, -2.098047, 0, 0, 0, 1, 1,
-1.917755, 0.5452989, -0.3936105, 1, 1, 1, 1, 1,
-1.911803, 2.122241, -1.917566, 1, 1, 1, 1, 1,
-1.908284, 1.372964, -1.409331, 1, 1, 1, 1, 1,
-1.905109, -0.2023384, -1.156338, 1, 1, 1, 1, 1,
-1.890804, -0.6523245, -2.154682, 1, 1, 1, 1, 1,
-1.863504, -1.22594, -0.4031124, 1, 1, 1, 1, 1,
-1.85612, 0.3159179, -1.565572, 1, 1, 1, 1, 1,
-1.848519, 0.4997631, -0.4325673, 1, 1, 1, 1, 1,
-1.846275, 0.6887562, -2.537767, 1, 1, 1, 1, 1,
-1.83294, -1.34528, -4.749151, 1, 1, 1, 1, 1,
-1.828156, -0.8922059, -2.972916, 1, 1, 1, 1, 1,
-1.823497, 0.4533637, 0.0003510186, 1, 1, 1, 1, 1,
-1.804879, -0.1966626, -1.659759, 1, 1, 1, 1, 1,
-1.799966, 1.10185, -0.6520489, 1, 1, 1, 1, 1,
-1.799709, -0.07307483, -2.703625, 1, 1, 1, 1, 1,
-1.797907, -1.898874, -1.80574, 0, 0, 1, 1, 1,
-1.780803, 0.399135, -1.644423, 1, 0, 0, 1, 1,
-1.772753, -0.9653534, -0.7374915, 1, 0, 0, 1, 1,
-1.758162, -0.4144499, -2.098416, 1, 0, 0, 1, 1,
-1.756796, -1.566021, -2.58402, 1, 0, 0, 1, 1,
-1.755207, -1.825054, -1.774517, 1, 0, 0, 1, 1,
-1.75341, 0.6918824, -1.877058, 0, 0, 0, 1, 1,
-1.74, 1.111694, 1.191923, 0, 0, 0, 1, 1,
-1.734056, -1.452202, -1.69334, 0, 0, 0, 1, 1,
-1.726192, 0.6200466, -2.375631, 0, 0, 0, 1, 1,
-1.720282, 0.4562576, -1.437837, 0, 0, 0, 1, 1,
-1.715609, 1.587319, -0.1985952, 0, 0, 0, 1, 1,
-1.713219, 0.5273253, -1.981658, 0, 0, 0, 1, 1,
-1.680552, 1.00478, -0.280127, 1, 1, 1, 1, 1,
-1.650918, -0.1586607, -0.8081399, 1, 1, 1, 1, 1,
-1.648988, 0.02582622, -0.6560592, 1, 1, 1, 1, 1,
-1.64642, 0.2634142, 0.00343097, 1, 1, 1, 1, 1,
-1.643075, -0.7936821, -2.519252, 1, 1, 1, 1, 1,
-1.624254, 0.4551138, -1.079148, 1, 1, 1, 1, 1,
-1.615591, 1.082461, -1.629635, 1, 1, 1, 1, 1,
-1.615456, 0.1804909, -2.483676, 1, 1, 1, 1, 1,
-1.61419, 0.01531828, -3.358644, 1, 1, 1, 1, 1,
-1.613291, 0.3622299, -0.9904124, 1, 1, 1, 1, 1,
-1.607961, 1.295057, -0.1144796, 1, 1, 1, 1, 1,
-1.602468, 1.445247, 1.31677, 1, 1, 1, 1, 1,
-1.599086, 0.8553873, -1.876626, 1, 1, 1, 1, 1,
-1.593945, 0.3439852, -2.046038, 1, 1, 1, 1, 1,
-1.579842, 1.137017, -0.2777192, 1, 1, 1, 1, 1,
-1.538607, -2.504946, -1.650343, 0, 0, 1, 1, 1,
-1.531994, 0.6220997, -1.487153, 1, 0, 0, 1, 1,
-1.516237, -0.1209367, -1.571174, 1, 0, 0, 1, 1,
-1.515356, -2.149192, -4.267245, 1, 0, 0, 1, 1,
-1.511105, 1.008099, -0.1563375, 1, 0, 0, 1, 1,
-1.51101, -1.598094, -1.356692, 1, 0, 0, 1, 1,
-1.509308, 0.9423286, -0.9616749, 0, 0, 0, 1, 1,
-1.503613, -0.6384984, -2.373443, 0, 0, 0, 1, 1,
-1.49978, -0.1920834, -2.092943, 0, 0, 0, 1, 1,
-1.496648, 0.2214123, -0.774093, 0, 0, 0, 1, 1,
-1.495116, -0.3151281, -1.57425, 0, 0, 0, 1, 1,
-1.466227, -0.9636881, -3.362924, 0, 0, 0, 1, 1,
-1.46285, -2.189256, -1.388977, 0, 0, 0, 1, 1,
-1.460624, -2.160038, -3.097843, 1, 1, 1, 1, 1,
-1.425589, -0.2264204, -2.523129, 1, 1, 1, 1, 1,
-1.40854, -0.8064435, -3.973757, 1, 1, 1, 1, 1,
-1.404436, 0.2665251, 0.4238257, 1, 1, 1, 1, 1,
-1.387603, -0.1962938, -1.808154, 1, 1, 1, 1, 1,
-1.368909, 0.2262167, -1.018606, 1, 1, 1, 1, 1,
-1.365733, 1.237854, 0.9576269, 1, 1, 1, 1, 1,
-1.36357, 0.5062307, 0.1453576, 1, 1, 1, 1, 1,
-1.362319, 1.169618, -2.14581, 1, 1, 1, 1, 1,
-1.357223, 0.1476817, -1.560287, 1, 1, 1, 1, 1,
-1.356822, 0.7877612, -3.402776, 1, 1, 1, 1, 1,
-1.348792, -1.571542, -1.740692, 1, 1, 1, 1, 1,
-1.345627, -1.044891, -1.282961, 1, 1, 1, 1, 1,
-1.344378, 1.483752, -0.4489588, 1, 1, 1, 1, 1,
-1.337299, -2.325396, -4.012474, 1, 1, 1, 1, 1,
-1.324855, -0.2781907, -0.7307338, 0, 0, 1, 1, 1,
-1.321227, -0.899714, -1.280985, 1, 0, 0, 1, 1,
-1.320867, 0.03382483, -1.551268, 1, 0, 0, 1, 1,
-1.31836, -1.955745, -2.283068, 1, 0, 0, 1, 1,
-1.315866, 0.3962287, -0.5726547, 1, 0, 0, 1, 1,
-1.311417, -0.2333066, -1.232279, 1, 0, 0, 1, 1,
-1.287225, -0.6367657, 0.7055851, 0, 0, 0, 1, 1,
-1.282731, 0.6509503, -0.5877445, 0, 0, 0, 1, 1,
-1.278945, -0.1845009, -1.626296, 0, 0, 0, 1, 1,
-1.27597, -1.482109, -2.614725, 0, 0, 0, 1, 1,
-1.269009, 0.6836725, 1.079902, 0, 0, 0, 1, 1,
-1.261251, 1.833907, -0.5250974, 0, 0, 0, 1, 1,
-1.259992, -1.816582, -3.960704, 0, 0, 0, 1, 1,
-1.255236, -0.1476046, -2.423286, 1, 1, 1, 1, 1,
-1.253107, 1.671167, 0.4364154, 1, 1, 1, 1, 1,
-1.243102, 0.1849792, -1.525869, 1, 1, 1, 1, 1,
-1.2394, -0.8308049, -1.532375, 1, 1, 1, 1, 1,
-1.236805, 1.295733, 1.411021, 1, 1, 1, 1, 1,
-1.232308, -0.847365, -3.036624, 1, 1, 1, 1, 1,
-1.228845, 1.192448, 0.5616581, 1, 1, 1, 1, 1,
-1.22728, -0.1509572, -1.739385, 1, 1, 1, 1, 1,
-1.217281, 0.3343489, -1.316716, 1, 1, 1, 1, 1,
-1.216008, 0.3798259, -0.3019875, 1, 1, 1, 1, 1,
-1.206266, -0.6609803, -1.441322, 1, 1, 1, 1, 1,
-1.197316, -0.3533516, -1.887189, 1, 1, 1, 1, 1,
-1.196785, -0.3857207, -2.006539, 1, 1, 1, 1, 1,
-1.196537, 2.975237, -1.008258, 1, 1, 1, 1, 1,
-1.186611, 1.814345, 0.1170939, 1, 1, 1, 1, 1,
-1.18079, -0.07277485, -0.3798295, 0, 0, 1, 1, 1,
-1.174912, -1.116266, -1.642256, 1, 0, 0, 1, 1,
-1.173881, -1.72287, -1.465262, 1, 0, 0, 1, 1,
-1.170269, -0.6837716, -2.847196, 1, 0, 0, 1, 1,
-1.164532, 0.9949707, 0.1008266, 1, 0, 0, 1, 1,
-1.149889, -0.4796317, -0.9501312, 1, 0, 0, 1, 1,
-1.146082, 1.162862, -1.695274, 0, 0, 0, 1, 1,
-1.141569, -0.5918987, -2.218043, 0, 0, 0, 1, 1,
-1.137437, -0.7320071, -3.697489, 0, 0, 0, 1, 1,
-1.128961, -1.311545, -1.824872, 0, 0, 0, 1, 1,
-1.115404, 2.09742, 0.0889781, 0, 0, 0, 1, 1,
-1.11124, -0.9178913, -2.583876, 0, 0, 0, 1, 1,
-1.105657, 0.2818416, -1.683482, 0, 0, 0, 1, 1,
-1.094845, 0.5830098, -1.966546, 1, 1, 1, 1, 1,
-1.094644, -3.505825, -2.940329, 1, 1, 1, 1, 1,
-1.09401, -1.153731, -2.469435, 1, 1, 1, 1, 1,
-1.092922, -0.1166888, -1.155826, 1, 1, 1, 1, 1,
-1.092354, -0.4884669, -2.153862, 1, 1, 1, 1, 1,
-1.088758, -0.1140121, -0.4615687, 1, 1, 1, 1, 1,
-1.083389, -0.03180602, -2.234972, 1, 1, 1, 1, 1,
-1.080339, 0.3814026, -1.34165, 1, 1, 1, 1, 1,
-1.079102, -0.6562353, -0.2486037, 1, 1, 1, 1, 1,
-1.072969, 0.4060642, -2.303583, 1, 1, 1, 1, 1,
-1.064166, -0.2029502, -0.6217872, 1, 1, 1, 1, 1,
-1.061825, 0.4806639, -0.668296, 1, 1, 1, 1, 1,
-1.0611, 0.6452658, -1.497439, 1, 1, 1, 1, 1,
-1.058909, 0.9798698, -0.1899949, 1, 1, 1, 1, 1,
-1.047451, 1.872705, 0.227545, 1, 1, 1, 1, 1,
-1.047216, 0.4719646, -1.921465, 0, 0, 1, 1, 1,
-1.045178, -1.386762, -2.538284, 1, 0, 0, 1, 1,
-1.042679, 1.595545, -1.167368, 1, 0, 0, 1, 1,
-1.041075, 1.462678, -1.122409, 1, 0, 0, 1, 1,
-1.039445, -1.811679, -2.400935, 1, 0, 0, 1, 1,
-1.038657, -0.4450691, -1.841079, 1, 0, 0, 1, 1,
-1.035491, 0.2751628, -0.7027717, 0, 0, 0, 1, 1,
-1.031969, 0.4480512, -1.044425, 0, 0, 0, 1, 1,
-1.024058, -0.8699812, -2.017986, 0, 0, 0, 1, 1,
-1.022273, -0.4962403, -2.209067, 0, 0, 0, 1, 1,
-1.020123, -0.3606904, -1.595849, 0, 0, 0, 1, 1,
-1.01958, -0.1185241, -1.519531, 0, 0, 0, 1, 1,
-1.016723, 0.04562615, -2.233621, 0, 0, 0, 1, 1,
-1.01306, 0.4416102, -2.544051, 1, 1, 1, 1, 1,
-1.008704, -0.3769099, -3.009625, 1, 1, 1, 1, 1,
-1.001619, -0.7318013, -0.4528415, 1, 1, 1, 1, 1,
-0.9995756, 0.8239949, 0.9043941, 1, 1, 1, 1, 1,
-0.9960084, 0.6920336, 0.610307, 1, 1, 1, 1, 1,
-0.9911198, 1.568994, -0.8233687, 1, 1, 1, 1, 1,
-0.9813536, 0.8760149, -1.604955, 1, 1, 1, 1, 1,
-0.9798677, 0.8024634, -1.241354, 1, 1, 1, 1, 1,
-0.9740373, -0.4147392, -0.3936945, 1, 1, 1, 1, 1,
-0.9678828, 1.169326, -1.263431, 1, 1, 1, 1, 1,
-0.9610391, 0.2928393, -1.239123, 1, 1, 1, 1, 1,
-0.9555724, -1.471698, -2.87737, 1, 1, 1, 1, 1,
-0.9527602, 1.289904, -0.4769378, 1, 1, 1, 1, 1,
-0.9501488, 1.404219, 0.04783539, 1, 1, 1, 1, 1,
-0.9492457, 0.1625687, -0.8645862, 1, 1, 1, 1, 1,
-0.9489229, -2.194415, -2.504071, 0, 0, 1, 1, 1,
-0.9454623, 0.7839667, -1.244838, 1, 0, 0, 1, 1,
-0.940637, -0.4754905, -0.4841301, 1, 0, 0, 1, 1,
-0.9339224, -0.6188024, 0.6878297, 1, 0, 0, 1, 1,
-0.9311228, 1.016285, -0.8304948, 1, 0, 0, 1, 1,
-0.9298208, -1.068551, -4.244981, 1, 0, 0, 1, 1,
-0.9284552, 1.095856, 0.5717217, 0, 0, 0, 1, 1,
-0.9159892, -1.429546, -2.301218, 0, 0, 0, 1, 1,
-0.9116355, -0.3760374, -1.651367, 0, 0, 0, 1, 1,
-0.9114999, -0.839692, -0.04948068, 0, 0, 0, 1, 1,
-0.9109665, -0.4730717, -1.572942, 0, 0, 0, 1, 1,
-0.9064683, 0.9644864, -1.221745, 0, 0, 0, 1, 1,
-0.902448, -1.305489, -2.63985, 0, 0, 0, 1, 1,
-0.9011623, 0.4470428, -0.5766528, 1, 1, 1, 1, 1,
-0.9003622, -0.9355708, -3.029079, 1, 1, 1, 1, 1,
-0.8981452, -2.142381, -5.344964, 1, 1, 1, 1, 1,
-0.8921361, 0.02680026, -3.667959, 1, 1, 1, 1, 1,
-0.8879119, 1.155774, 0.07632729, 1, 1, 1, 1, 1,
-0.8818623, -1.513408, -2.084759, 1, 1, 1, 1, 1,
-0.8813972, 1.179099, -1.994055, 1, 1, 1, 1, 1,
-0.8695815, 0.5673018, -1.254653, 1, 1, 1, 1, 1,
-0.8692309, -0.140733, -2.204538, 1, 1, 1, 1, 1,
-0.8612528, -0.4629484, -2.833441, 1, 1, 1, 1, 1,
-0.8603489, 0.674402, -1.587929, 1, 1, 1, 1, 1,
-0.8542518, 0.808349, -0.6375356, 1, 1, 1, 1, 1,
-0.8508665, -1.236971, -2.119938, 1, 1, 1, 1, 1,
-0.8454489, -0.5799709, -1.324, 1, 1, 1, 1, 1,
-0.8423532, -1.030596, -2.034838, 1, 1, 1, 1, 1,
-0.841055, -1.309713, -1.834029, 0, 0, 1, 1, 1,
-0.8366799, 0.290949, -1.57541, 1, 0, 0, 1, 1,
-0.8274594, 0.8819762, 0.8110607, 1, 0, 0, 1, 1,
-0.8250567, 1.819054, -0.4521849, 1, 0, 0, 1, 1,
-0.8199993, -0.7586786, -3.848722, 1, 0, 0, 1, 1,
-0.8147982, -0.2566332, -1.196233, 1, 0, 0, 1, 1,
-0.8130448, 0.2103923, -1.897408, 0, 0, 0, 1, 1,
-0.8029765, 1.571325, -1.14054, 0, 0, 0, 1, 1,
-0.798815, 1.045323, -1.380322, 0, 0, 0, 1, 1,
-0.7782398, -1.142317, -4.967, 0, 0, 0, 1, 1,
-0.7736369, -0.2337168, -3.681591, 0, 0, 0, 1, 1,
-0.7690799, 1.490489, 0.8819535, 0, 0, 0, 1, 1,
-0.7676736, 2.502724, -0.9081409, 0, 0, 0, 1, 1,
-0.7630843, -0.1643738, -1.398769, 1, 1, 1, 1, 1,
-0.7613543, 2.094658, -0.7675323, 1, 1, 1, 1, 1,
-0.7585578, 0.6222924, -1.563158, 1, 1, 1, 1, 1,
-0.7583681, -0.3792656, -3.486787, 1, 1, 1, 1, 1,
-0.7448218, -2.627954, -3.554575, 1, 1, 1, 1, 1,
-0.7398295, 0.1192931, -2.341414, 1, 1, 1, 1, 1,
-0.7361175, -0.8146204, -2.090586, 1, 1, 1, 1, 1,
-0.7350608, -1.705313, -1.865134, 1, 1, 1, 1, 1,
-0.7318135, 0.1522695, -1.759859, 1, 1, 1, 1, 1,
-0.7236226, -0.9505782, -1.026769, 1, 1, 1, 1, 1,
-0.723271, 0.4421269, 0.1276599, 1, 1, 1, 1, 1,
-0.7207759, -0.05808112, -0.682301, 1, 1, 1, 1, 1,
-0.717091, -0.06872831, -0.1690686, 1, 1, 1, 1, 1,
-0.7161055, -0.465195, -3.508752, 1, 1, 1, 1, 1,
-0.7104239, -1.282593, -2.141634, 1, 1, 1, 1, 1,
-0.7103738, -0.6061214, -2.383787, 0, 0, 1, 1, 1,
-0.7038333, 0.8362746, -2.497623, 1, 0, 0, 1, 1,
-0.698159, -0.5592408, -0.7935385, 1, 0, 0, 1, 1,
-0.6933893, 0.3522784, -2.084701, 1, 0, 0, 1, 1,
-0.6884329, 0.3070304, -0.8530462, 1, 0, 0, 1, 1,
-0.6875366, -0.2961403, -3.149582, 1, 0, 0, 1, 1,
-0.6864802, -0.433945, -3.909784, 0, 0, 0, 1, 1,
-0.6831496, 0.09165669, -1.801345, 0, 0, 0, 1, 1,
-0.6810317, -0.9891743, -3.142435, 0, 0, 0, 1, 1,
-0.6702344, -0.4235615, -2.281251, 0, 0, 0, 1, 1,
-0.6663706, -0.3065841, -2.290356, 0, 0, 0, 1, 1,
-0.6645197, -0.2077024, -0.7512761, 0, 0, 0, 1, 1,
-0.6641601, 0.1965781, -0.834051, 0, 0, 0, 1, 1,
-0.6550812, 0.2607325, 0.3131073, 1, 1, 1, 1, 1,
-0.652106, 1.717437, 0.2807484, 1, 1, 1, 1, 1,
-0.6439864, 0.9749274, 0.8107354, 1, 1, 1, 1, 1,
-0.6429622, 0.02391784, -0.1202454, 1, 1, 1, 1, 1,
-0.6390817, -0.2789851, -2.92929, 1, 1, 1, 1, 1,
-0.6337661, 0.1317828, -0.9838502, 1, 1, 1, 1, 1,
-0.6326025, 0.02732691, -3.198065, 1, 1, 1, 1, 1,
-0.6306688, 0.1408883, -3.342042, 1, 1, 1, 1, 1,
-0.6280524, -1.146982, -1.656321, 1, 1, 1, 1, 1,
-0.6271319, -0.224388, -0.8332298, 1, 1, 1, 1, 1,
-0.6255316, -0.9367144, -2.994329, 1, 1, 1, 1, 1,
-0.6252471, 0.5773392, -0.5278502, 1, 1, 1, 1, 1,
-0.6237529, 0.9212694, -0.9578856, 1, 1, 1, 1, 1,
-0.6211489, -1.090984, -2.1547, 1, 1, 1, 1, 1,
-0.6167612, -3.117802, -2.741529, 1, 1, 1, 1, 1,
-0.6152498, 0.7135283, -0.5474277, 0, 0, 1, 1, 1,
-0.6144191, -0.4776011, -2.234105, 1, 0, 0, 1, 1,
-0.6102876, 0.3206082, -1.636561, 1, 0, 0, 1, 1,
-0.6095818, 2.641097, 1.124303, 1, 0, 0, 1, 1,
-0.6039834, 0.3985437, -0.3641451, 1, 0, 0, 1, 1,
-0.5993555, 0.7592583, -0.712526, 1, 0, 0, 1, 1,
-0.5963478, 0.08957695, -1.39234, 0, 0, 0, 1, 1,
-0.5962622, -1.272015, -4.531034, 0, 0, 0, 1, 1,
-0.5885104, -0.3924999, -2.765786, 0, 0, 0, 1, 1,
-0.5859086, 0.946804, -1.649107, 0, 0, 0, 1, 1,
-0.5827864, 0.4795972, -2.600535, 0, 0, 0, 1, 1,
-0.5788317, 0.2062866, -0.7127659, 0, 0, 0, 1, 1,
-0.5771626, 1.269059, 0.1304996, 0, 0, 0, 1, 1,
-0.5672532, 1.612993, 0.07291884, 1, 1, 1, 1, 1,
-0.5609345, 0.3007134, -0.6745915, 1, 1, 1, 1, 1,
-0.5561891, 2.879474, -0.4444602, 1, 1, 1, 1, 1,
-0.5531491, 1.030476, 0.4910761, 1, 1, 1, 1, 1,
-0.5404519, 1.064581, -0.3357579, 1, 1, 1, 1, 1,
-0.5399254, -0.6222861, -3.411082, 1, 1, 1, 1, 1,
-0.5377872, 0.3533333, -1.262795, 1, 1, 1, 1, 1,
-0.5367936, -0.2000323, -2.471168, 1, 1, 1, 1, 1,
-0.5347027, -0.9745057, -1.414225, 1, 1, 1, 1, 1,
-0.5313476, -0.1749988, -0.9369556, 1, 1, 1, 1, 1,
-0.5312063, -1.113117, -1.66625, 1, 1, 1, 1, 1,
-0.5305806, 0.005408179, -0.05519864, 1, 1, 1, 1, 1,
-0.5240013, 0.2101445, 1.034081, 1, 1, 1, 1, 1,
-0.5239174, 0.8469157, 0.8226914, 1, 1, 1, 1, 1,
-0.52281, 0.9496847, 1.198827, 1, 1, 1, 1, 1,
-0.5227942, -1.380993, -4.720107, 0, 0, 1, 1, 1,
-0.5225894, -1.200455, -2.098127, 1, 0, 0, 1, 1,
-0.5090003, -0.8763914, -3.30804, 1, 0, 0, 1, 1,
-0.5084029, 1.103888, -1.311592, 1, 0, 0, 1, 1,
-0.5080202, 0.5101359, -0.3670748, 1, 0, 0, 1, 1,
-0.5064069, 0.6564586, -0.1301263, 1, 0, 0, 1, 1,
-0.504601, 1.397366, -1.143509, 0, 0, 0, 1, 1,
-0.503084, 0.1536068, -1.640436, 0, 0, 0, 1, 1,
-0.5021948, -0.08846837, -1.398623, 0, 0, 0, 1, 1,
-0.4997604, 0.5352491, -0.4162035, 0, 0, 0, 1, 1,
-0.497063, 0.5490825, -1.525249, 0, 0, 0, 1, 1,
-0.4969266, 0.0864797, -2.210811, 0, 0, 0, 1, 1,
-0.4955199, 1.306068, -1.466402, 0, 0, 0, 1, 1,
-0.492633, 0.8695695, -0.947018, 1, 1, 1, 1, 1,
-0.4865453, -0.3078143, -1.393321, 1, 1, 1, 1, 1,
-0.4845739, -0.002487012, 0.4091567, 1, 1, 1, 1, 1,
-0.4824721, 1.506495, -0.8428472, 1, 1, 1, 1, 1,
-0.4819227, -0.4199879, -1.597955, 1, 1, 1, 1, 1,
-0.4808298, 0.2683673, -1.785195, 1, 1, 1, 1, 1,
-0.4758754, -0.1042578, -2.895064, 1, 1, 1, 1, 1,
-0.4758427, -2.361729, -3.840756, 1, 1, 1, 1, 1,
-0.4753397, 0.6529054, -2.027541, 1, 1, 1, 1, 1,
-0.4749633, 0.03566998, -1.386939, 1, 1, 1, 1, 1,
-0.4734246, -1.292303, -1.729961, 1, 1, 1, 1, 1,
-0.4624213, 1.270987, -0.5456793, 1, 1, 1, 1, 1,
-0.4594223, -0.9717957, -0.2328302, 1, 1, 1, 1, 1,
-0.4542343, 0.1626137, -0.3444102, 1, 1, 1, 1, 1,
-0.4484078, -0.4307807, -1.059803, 1, 1, 1, 1, 1,
-0.4409422, -1.815354, -3.523438, 0, 0, 1, 1, 1,
-0.4407076, -1.222682, -2.925913, 1, 0, 0, 1, 1,
-0.4391553, -1.230811, -5.472995, 1, 0, 0, 1, 1,
-0.4331498, 0.3493459, -0.04476889, 1, 0, 0, 1, 1,
-0.4314938, -2.16836, -2.287922, 1, 0, 0, 1, 1,
-0.4298571, -0.5689788, -1.060356, 1, 0, 0, 1, 1,
-0.4190674, 1.300251, -1.378316, 0, 0, 0, 1, 1,
-0.4178212, -0.4782239, -2.92768, 0, 0, 0, 1, 1,
-0.4113463, -1.64044, -2.378109, 0, 0, 0, 1, 1,
-0.4053945, -0.5894955, -1.268142, 0, 0, 0, 1, 1,
-0.4043128, 1.198548, -1.368628, 0, 0, 0, 1, 1,
-0.4009676, -1.029436, -2.953795, 0, 0, 0, 1, 1,
-0.3970087, -0.006458274, -0.8336433, 0, 0, 0, 1, 1,
-0.3962905, 1.273886, 0.7479932, 1, 1, 1, 1, 1,
-0.3947828, 1.033555, -2.366546, 1, 1, 1, 1, 1,
-0.3919231, 0.4991845, -1.005911, 1, 1, 1, 1, 1,
-0.3911825, 2.277205, 1.080845, 1, 1, 1, 1, 1,
-0.3869064, 0.4838932, -0.7641029, 1, 1, 1, 1, 1,
-0.3817597, -0.4640636, -4.809948, 1, 1, 1, 1, 1,
-0.3797283, -0.09335251, -1.021472, 1, 1, 1, 1, 1,
-0.372242, 0.4927202, -1.515345, 1, 1, 1, 1, 1,
-0.3715323, -1.455291, -2.819107, 1, 1, 1, 1, 1,
-0.3622881, -2.188353, -3.321782, 1, 1, 1, 1, 1,
-0.3554999, 1.371356, -1.74186, 1, 1, 1, 1, 1,
-0.3473153, -1.915893, -2.658248, 1, 1, 1, 1, 1,
-0.3421353, -1.486923, -4.274044, 1, 1, 1, 1, 1,
-0.3400259, -0.5011862, -4.342978, 1, 1, 1, 1, 1,
-0.3389719, -0.5743737, -2.535424, 1, 1, 1, 1, 1,
-0.3372366, -0.4206154, -3.195519, 0, 0, 1, 1, 1,
-0.3355883, -0.07160391, -2.621428, 1, 0, 0, 1, 1,
-0.3343905, -0.5846811, -2.76824, 1, 0, 0, 1, 1,
-0.3341821, -0.1064355, -3.113589, 1, 0, 0, 1, 1,
-0.3339013, 0.1538716, -1.342147, 1, 0, 0, 1, 1,
-0.3308798, 0.7724573, -1.708039, 1, 0, 0, 1, 1,
-0.3264791, -0.2475828, -2.86393, 0, 0, 0, 1, 1,
-0.3234339, -0.002492791, -2.202046, 0, 0, 0, 1, 1,
-0.3233135, -1.303388, -3.514897, 0, 0, 0, 1, 1,
-0.3115625, -0.1305411, -2.717693, 0, 0, 0, 1, 1,
-0.3051876, 0.7345446, -0.2849941, 0, 0, 0, 1, 1,
-0.3028817, -1.028042, -3.325777, 0, 0, 0, 1, 1,
-0.3006136, -0.4547581, -1.586764, 0, 0, 0, 1, 1,
-0.3001641, 0.2779247, 0.5450963, 1, 1, 1, 1, 1,
-0.2946412, 0.7688434, 0.4942162, 1, 1, 1, 1, 1,
-0.2920175, 2.212057, -0.5345144, 1, 1, 1, 1, 1,
-0.2887599, 0.06357789, -2.107568, 1, 1, 1, 1, 1,
-0.2861303, 1.534957, 0.1478674, 1, 1, 1, 1, 1,
-0.2855941, 0.4597992, 0.3892699, 1, 1, 1, 1, 1,
-0.2830667, -1.650274, -2.161521, 1, 1, 1, 1, 1,
-0.2780266, 1.585112, -1.120424, 1, 1, 1, 1, 1,
-0.2754124, 1.220241, -0.7270371, 1, 1, 1, 1, 1,
-0.2684142, 0.01170918, -2.581552, 1, 1, 1, 1, 1,
-0.2643517, 0.1149003, -1.0632, 1, 1, 1, 1, 1,
-0.2604239, -1.430491, -3.37444, 1, 1, 1, 1, 1,
-0.2600204, -1.084869, -4.220225, 1, 1, 1, 1, 1,
-0.2537466, -0.9625646, -4.726666, 1, 1, 1, 1, 1,
-0.2431993, 0.5224742, -1.427113, 1, 1, 1, 1, 1,
-0.2415525, 0.45473, 0.2493513, 0, 0, 1, 1, 1,
-0.2380498, 0.4019154, 0.6907646, 1, 0, 0, 1, 1,
-0.2320358, 1.517769, -0.235588, 1, 0, 0, 1, 1,
-0.2312637, 0.5130171, -0.5138389, 1, 0, 0, 1, 1,
-0.229702, 0.06542756, -0.6935247, 1, 0, 0, 1, 1,
-0.2275447, 0.8863467, -0.1295801, 1, 0, 0, 1, 1,
-0.2234837, -0.01626662, -0.7115681, 0, 0, 0, 1, 1,
-0.2231485, 0.8709683, 1.781435, 0, 0, 0, 1, 1,
-0.2222785, 0.6565488, -1.979728, 0, 0, 0, 1, 1,
-0.2195747, -0.8281472, -2.180644, 0, 0, 0, 1, 1,
-0.2163561, -0.06120595, -1.280985, 0, 0, 0, 1, 1,
-0.2148699, -1.613895, -6.328735, 0, 0, 0, 1, 1,
-0.2107318, 0.01229792, 1.718566, 0, 0, 0, 1, 1,
-0.2096738, -0.2847528, -0.9428549, 1, 1, 1, 1, 1,
-0.2092032, 0.8571339, -0.4145189, 1, 1, 1, 1, 1,
-0.2073695, 0.6132177, -0.706012, 1, 1, 1, 1, 1,
-0.2065951, -1.516156, -3.227379, 1, 1, 1, 1, 1,
-0.2052672, 0.7999422, -1.429979, 1, 1, 1, 1, 1,
-0.2037601, 1.59666, 0.8421402, 1, 1, 1, 1, 1,
-0.2019391, 0.07722396, -1.600088, 1, 1, 1, 1, 1,
-0.2007256, 2.415869, -0.8825161, 1, 1, 1, 1, 1,
-0.2004897, 0.8876682, -1.747951, 1, 1, 1, 1, 1,
-0.1975425, -0.6424103, -3.372934, 1, 1, 1, 1, 1,
-0.1960439, -0.1217779, -0.1353687, 1, 1, 1, 1, 1,
-0.1934954, -2.517785, -1.729471, 1, 1, 1, 1, 1,
-0.1884216, -0.009659622, -1.416147, 1, 1, 1, 1, 1,
-0.1828081, -0.6997508, -4.265187, 1, 1, 1, 1, 1,
-0.1788916, -0.5937904, -2.412474, 1, 1, 1, 1, 1,
-0.1772646, -1.384737, -3.637722, 0, 0, 1, 1, 1,
-0.1769406, 0.05922266, 0.01269033, 1, 0, 0, 1, 1,
-0.172617, -0.56541, -3.308676, 1, 0, 0, 1, 1,
-0.1691299, 0.2265937, -1.61127, 1, 0, 0, 1, 1,
-0.1674189, -0.1825464, -2.74875, 1, 0, 0, 1, 1,
-0.1654653, 0.7135438, -1.758044, 1, 0, 0, 1, 1,
-0.1605611, -0.8608842, -3.217267, 0, 0, 0, 1, 1,
-0.15946, 0.5880607, 0.3605283, 0, 0, 0, 1, 1,
-0.158409, -1.068885, -1.727586, 0, 0, 0, 1, 1,
-0.1538637, -0.337348, -1.522404, 0, 0, 0, 1, 1,
-0.1537496, 1.480213, -0.06475016, 0, 0, 0, 1, 1,
-0.1429567, 0.7297025, -0.5376943, 0, 0, 0, 1, 1,
-0.1428487, -0.1266975, -2.642859, 0, 0, 0, 1, 1,
-0.1418138, 1.231118, -1.126818, 1, 1, 1, 1, 1,
-0.1412901, -0.03988981, 0.0006230236, 1, 1, 1, 1, 1,
-0.1384808, -0.7786683, -3.46886, 1, 1, 1, 1, 1,
-0.1380909, -0.904954, -1.926815, 1, 1, 1, 1, 1,
-0.1369499, 0.4177637, 0.4092677, 1, 1, 1, 1, 1,
-0.1342748, -0.02861485, -1.876395, 1, 1, 1, 1, 1,
-0.12789, 1.11339, -0.7175737, 1, 1, 1, 1, 1,
-0.1241866, -0.9664241, -2.864682, 1, 1, 1, 1, 1,
-0.1241195, 0.3430653, 0.6903312, 1, 1, 1, 1, 1,
-0.1222372, -0.1380904, -4.230535, 1, 1, 1, 1, 1,
-0.1212605, -1.115966, -1.185395, 1, 1, 1, 1, 1,
-0.1206532, 0.9524489, 0.7424329, 1, 1, 1, 1, 1,
-0.1199687, 2.095817, -0.1019085, 1, 1, 1, 1, 1,
-0.1163012, -0.2154435, -3.52547, 1, 1, 1, 1, 1,
-0.1161532, -0.7816111, -2.464941, 1, 1, 1, 1, 1,
-0.112046, 0.2641541, -1.36217, 0, 0, 1, 1, 1,
-0.112024, -0.1533827, -2.91229, 1, 0, 0, 1, 1,
-0.1109228, -1.296605, -2.719091, 1, 0, 0, 1, 1,
-0.1099349, -0.8773906, -3.31344, 1, 0, 0, 1, 1,
-0.10964, -0.486026, -1.149479, 1, 0, 0, 1, 1,
-0.1057826, -0.6334369, -2.580955, 1, 0, 0, 1, 1,
-0.105667, 0.8708851, -1.254771, 0, 0, 0, 1, 1,
-0.1056398, 1.929245, -0.2014906, 0, 0, 0, 1, 1,
-0.102486, 1.413735, -0.8013054, 0, 0, 0, 1, 1,
-0.1014866, -0.03493293, -2.766913, 0, 0, 0, 1, 1,
-0.09572335, -0.9874592, -3.189093, 0, 0, 0, 1, 1,
-0.09352568, -0.9656237, -1.72318, 0, 0, 0, 1, 1,
-0.09082674, 0.3705023, 0.76612, 0, 0, 0, 1, 1,
-0.0864034, -0.06424748, -1.790596, 1, 1, 1, 1, 1,
-0.08569594, 1.357805, -0.5467033, 1, 1, 1, 1, 1,
-0.08164617, 0.5748927, -0.4604924, 1, 1, 1, 1, 1,
-0.07869804, -0.1955126, -2.06799, 1, 1, 1, 1, 1,
-0.07152997, -0.7642328, -3.05877, 1, 1, 1, 1, 1,
-0.06628926, 1.829916, 2.122749, 1, 1, 1, 1, 1,
-0.06077979, -0.09667462, -3.719832, 1, 1, 1, 1, 1,
-0.05630079, -0.1545679, -1.511284, 1, 1, 1, 1, 1,
-0.0536161, 0.01817036, -0.1432604, 1, 1, 1, 1, 1,
-0.05335942, -0.3189166, -3.266738, 1, 1, 1, 1, 1,
-0.05047971, 0.6351666, 1.587704, 1, 1, 1, 1, 1,
-0.05017303, -2.109601, -2.963731, 1, 1, 1, 1, 1,
-0.04589593, 0.06659628, 1.019003, 1, 1, 1, 1, 1,
-0.04452319, -0.1696342, -1.570115, 1, 1, 1, 1, 1,
-0.0355734, 0.3800397, 0.5411636, 1, 1, 1, 1, 1,
-0.03465113, 1.378724, 0.5896165, 0, 0, 1, 1, 1,
-0.03409035, 1.288169, 0.6588483, 1, 0, 0, 1, 1,
-0.03058564, 0.9788821, 0.96565, 1, 0, 0, 1, 1,
-0.03056584, -0.253883, -3.945594, 1, 0, 0, 1, 1,
-0.02991794, 1.171649, 0.1233027, 1, 0, 0, 1, 1,
-0.02771662, -0.7943907, -3.247134, 1, 0, 0, 1, 1,
-0.02704961, -1.360922, -2.922559, 0, 0, 0, 1, 1,
-0.0220369, -0.6407316, -4.014044, 0, 0, 0, 1, 1,
-0.02107962, -0.3924547, -4.420499, 0, 0, 0, 1, 1,
-0.01959685, 1.030198, -0.1213788, 0, 0, 0, 1, 1,
-0.01470112, -0.5163338, -3.186392, 0, 0, 0, 1, 1,
-0.01229973, 0.1039514, 0.1128673, 0, 0, 0, 1, 1,
-0.002531052, 0.4855793, -0.7690002, 0, 0, 0, 1, 1,
7.93714e-05, -0.419378, 2.740363, 1, 1, 1, 1, 1,
0.00074084, -0.4859541, 1.623115, 1, 1, 1, 1, 1,
0.002091946, -0.3949753, 3.595453, 1, 1, 1, 1, 1,
0.002361594, 0.1251706, 0.9195431, 1, 1, 1, 1, 1,
0.006665799, 0.2883148, -0.2646305, 1, 1, 1, 1, 1,
0.008685234, 2.391299, 0.1930076, 1, 1, 1, 1, 1,
0.009073218, 1.429181, -0.7803573, 1, 1, 1, 1, 1,
0.01057753, 0.4684683, 0.9079061, 1, 1, 1, 1, 1,
0.01076113, 0.05184471, 0.05622941, 1, 1, 1, 1, 1,
0.01082133, 0.5441747, -0.1126557, 1, 1, 1, 1, 1,
0.01166604, -1.67158, 3.438443, 1, 1, 1, 1, 1,
0.01241674, -0.4618019, 3.550436, 1, 1, 1, 1, 1,
0.01752906, 0.4597802, -1.246876, 1, 1, 1, 1, 1,
0.01774163, -1.154622, 6.007699, 1, 1, 1, 1, 1,
0.01848278, -0.9417003, 3.811892, 1, 1, 1, 1, 1,
0.02442685, -0.8907911, 3.003199, 0, 0, 1, 1, 1,
0.02741259, 1.430283, -0.1057196, 1, 0, 0, 1, 1,
0.0286405, 0.7565401, 1.827793, 1, 0, 0, 1, 1,
0.03166907, 1.336624, -1.039603, 1, 0, 0, 1, 1,
0.035337, 2.081424, -0.8297346, 1, 0, 0, 1, 1,
0.03652318, 0.3304962, -0.005541228, 1, 0, 0, 1, 1,
0.03868381, 0.9520481, -0.3737034, 0, 0, 0, 1, 1,
0.04716524, 1.43576, -0.3443577, 0, 0, 0, 1, 1,
0.05476819, 0.7538797, 0.4019204, 0, 0, 0, 1, 1,
0.0560117, 2.166593, 1.877165, 0, 0, 0, 1, 1,
0.05819779, 1.942319, -0.5203376, 0, 0, 0, 1, 1,
0.05933385, -1.011003, 1.953783, 0, 0, 0, 1, 1,
0.0609089, 1.366595, -0.2621437, 0, 0, 0, 1, 1,
0.06104677, 0.3927457, -0.7297513, 1, 1, 1, 1, 1,
0.06461249, 0.7288606, -1.055588, 1, 1, 1, 1, 1,
0.06760285, -1.093044, 1.987925, 1, 1, 1, 1, 1,
0.06885493, -0.01634943, 1.844874, 1, 1, 1, 1, 1,
0.06906951, 0.5916675, 0.3294528, 1, 1, 1, 1, 1,
0.07152028, -0.7283776, 3.465503, 1, 1, 1, 1, 1,
0.07178923, -1.040261, 2.814258, 1, 1, 1, 1, 1,
0.07335373, -1.028987, 2.771014, 1, 1, 1, 1, 1,
0.0759071, -1.161502, 4.492088, 1, 1, 1, 1, 1,
0.0797505, 0.8094579, -0.08548731, 1, 1, 1, 1, 1,
0.08307125, -0.2839971, 3.349135, 1, 1, 1, 1, 1,
0.08354457, 0.02194967, 1.114276, 1, 1, 1, 1, 1,
0.08546586, 1.152758, -0.8789755, 1, 1, 1, 1, 1,
0.09415523, 0.08701083, -0.6210521, 1, 1, 1, 1, 1,
0.1144434, -2.114489, 3.972476, 1, 1, 1, 1, 1,
0.1168557, -1.594074, 4.624867, 0, 0, 1, 1, 1,
0.1236967, -0.6863499, 1.690691, 1, 0, 0, 1, 1,
0.1293916, -0.009194795, 1.387979, 1, 0, 0, 1, 1,
0.1389658, -2.489349, 4.598535, 1, 0, 0, 1, 1,
0.1397582, -1.142782, 2.366361, 1, 0, 0, 1, 1,
0.1399808, -1.95318, 4.111601, 1, 0, 0, 1, 1,
0.140525, -0.007863524, 0.5762991, 0, 0, 0, 1, 1,
0.1414454, 0.1523237, -0.2513966, 0, 0, 0, 1, 1,
0.1422117, -0.7357287, 2.624071, 0, 0, 0, 1, 1,
0.1491038, 0.3635015, 0.4573493, 0, 0, 0, 1, 1,
0.149704, -1.117785, 3.533008, 0, 0, 0, 1, 1,
0.1518013, 0.9799207, 0.6225976, 0, 0, 0, 1, 1,
0.1536213, -1.569184, 1.381244, 0, 0, 0, 1, 1,
0.1546673, 0.2487895, 0.2661449, 1, 1, 1, 1, 1,
0.1551173, -1.200036, 4.767134, 1, 1, 1, 1, 1,
0.1562439, -0.4431609, 3.327787, 1, 1, 1, 1, 1,
0.1622183, 0.1212867, 1.014671, 1, 1, 1, 1, 1,
0.1632903, 0.5155612, -1.461508, 1, 1, 1, 1, 1,
0.1642698, 0.9980071, 1.868658, 1, 1, 1, 1, 1,
0.1648656, 0.182745, 1.66038, 1, 1, 1, 1, 1,
0.1662534, 0.1723188, 1.032454, 1, 1, 1, 1, 1,
0.1683236, -0.3382039, 3.369388, 1, 1, 1, 1, 1,
0.1694807, 0.2860308, 0.0885525, 1, 1, 1, 1, 1,
0.1694902, -0.6121003, 0.8866009, 1, 1, 1, 1, 1,
0.1700729, 1.336735, 0.7711663, 1, 1, 1, 1, 1,
0.1789544, 1.350785, 0.5746221, 1, 1, 1, 1, 1,
0.1823186, -0.6089558, 2.296742, 1, 1, 1, 1, 1,
0.1840329, 0.2999097, -0.06513561, 1, 1, 1, 1, 1,
0.1864699, -0.7084686, 2.703245, 0, 0, 1, 1, 1,
0.188386, -1.615162, 2.507183, 1, 0, 0, 1, 1,
0.1951167, -0.03164178, 1.914348, 1, 0, 0, 1, 1,
0.2056922, 0.8667938, 1.365312, 1, 0, 0, 1, 1,
0.2057182, 0.4132555, 0.6586276, 1, 0, 0, 1, 1,
0.2059253, 1.38788, 0.6978011, 1, 0, 0, 1, 1,
0.2065368, 0.8064834, -1.136059, 0, 0, 0, 1, 1,
0.2089848, 0.5002029, 0.4563189, 0, 0, 0, 1, 1,
0.2089851, -0.09867205, 1.391682, 0, 0, 0, 1, 1,
0.2139401, 1.100878, -0.2956055, 0, 0, 0, 1, 1,
0.2144113, -1.594448, 2.414997, 0, 0, 0, 1, 1,
0.2148625, -0.694414, 5.856964, 0, 0, 0, 1, 1,
0.2164236, -0.506242, 3.892302, 0, 0, 0, 1, 1,
0.2193886, 0.1913246, 1.368533, 1, 1, 1, 1, 1,
0.2227761, -1.94285, 1.658191, 1, 1, 1, 1, 1,
0.2237787, 1.076349, -0.2017087, 1, 1, 1, 1, 1,
0.2242595, -0.2502587, 0.6803658, 1, 1, 1, 1, 1,
0.2336878, 0.4553894, -0.2369042, 1, 1, 1, 1, 1,
0.2361271, 0.0759256, 0.03403994, 1, 1, 1, 1, 1,
0.2385668, 0.3850176, 1.994533, 1, 1, 1, 1, 1,
0.24188, 2.753588, 0.3626466, 1, 1, 1, 1, 1,
0.2443538, -1.203745, 4.229588, 1, 1, 1, 1, 1,
0.2465994, -1.009255, 2.799388, 1, 1, 1, 1, 1,
0.2522061, -1.451284, 0.6135514, 1, 1, 1, 1, 1,
0.252472, 0.1176419, 0.004943324, 1, 1, 1, 1, 1,
0.2525562, -1.329961, 5.422188, 1, 1, 1, 1, 1,
0.2562011, -0.8364743, 1.034274, 1, 1, 1, 1, 1,
0.2566472, 0.8469294, 1.922148, 1, 1, 1, 1, 1,
0.2591367, -0.8911238, 4.149711, 0, 0, 1, 1, 1,
0.2592258, -3.310395, 2.290884, 1, 0, 0, 1, 1,
0.2600228, -0.373676, 2.609476, 1, 0, 0, 1, 1,
0.2666553, 2.213166, -1.471313, 1, 0, 0, 1, 1,
0.2702836, 0.9064354, 0.5553663, 1, 0, 0, 1, 1,
0.2710869, 1.341147, 2.256726, 1, 0, 0, 1, 1,
0.2737458, -1.596943, 3.711929, 0, 0, 0, 1, 1,
0.276212, -2.216577, 2.176753, 0, 0, 0, 1, 1,
0.2765743, 1.82101, -1.101297, 0, 0, 0, 1, 1,
0.2782195, -0.1503541, 3.374326, 0, 0, 0, 1, 1,
0.2796727, 0.528483, -0.9788353, 0, 0, 0, 1, 1,
0.2811991, -1.416748, 2.793605, 0, 0, 0, 1, 1,
0.2815984, 0.1800177, 0.6022094, 0, 0, 0, 1, 1,
0.2866489, 0.3759654, -1.556214, 1, 1, 1, 1, 1,
0.2921039, 0.2856801, 0.141591, 1, 1, 1, 1, 1,
0.2935322, -0.05472034, 2.336917, 1, 1, 1, 1, 1,
0.2935869, 0.9269496, -0.7729321, 1, 1, 1, 1, 1,
0.296375, -0.6501063, 2.495324, 1, 1, 1, 1, 1,
0.306216, 1.558868, -0.5371336, 1, 1, 1, 1, 1,
0.3074166, 0.3039119, 0.3191722, 1, 1, 1, 1, 1,
0.3082725, -0.8003536, 3.787109, 1, 1, 1, 1, 1,
0.3090933, -0.1927961, 1.915486, 1, 1, 1, 1, 1,
0.309574, -0.6498442, 2.469107, 1, 1, 1, 1, 1,
0.3152957, 0.37253, 1.777189, 1, 1, 1, 1, 1,
0.3167484, 1.349696, -1.110688, 1, 1, 1, 1, 1,
0.3186068, -0.3739546, 0.6023177, 1, 1, 1, 1, 1,
0.3219111, 1.084391, -0.2431102, 1, 1, 1, 1, 1,
0.3227311, 1.11157, 0.334741, 1, 1, 1, 1, 1,
0.3305525, 0.5187583, 0.4810211, 0, 0, 1, 1, 1,
0.3330663, -1.999204, 3.16504, 1, 0, 0, 1, 1,
0.3348024, -0.6632552, 2.968964, 1, 0, 0, 1, 1,
0.3368405, 0.3164376, 1.994123, 1, 0, 0, 1, 1,
0.3378875, 0.6129366, 0.7181661, 1, 0, 0, 1, 1,
0.3400032, 0.3898837, -0.5898271, 1, 0, 0, 1, 1,
0.3422838, -0.4354633, 3.947213, 0, 0, 0, 1, 1,
0.3434805, -1.036017, 2.305746, 0, 0, 0, 1, 1,
0.3462056, 0.6534467, -0.04351429, 0, 0, 0, 1, 1,
0.3487393, 1.086329, -0.9432436, 0, 0, 0, 1, 1,
0.3496184, -0.5075967, 0.5758775, 0, 0, 0, 1, 1,
0.3496597, 1.489743, -0.1760583, 0, 0, 0, 1, 1,
0.3503817, -0.8409143, 2.860991, 0, 0, 0, 1, 1,
0.3515033, 0.5100175, 0.3025502, 1, 1, 1, 1, 1,
0.3517479, 0.7000782, -1.060342, 1, 1, 1, 1, 1,
0.3522417, 0.465536, 0.3700875, 1, 1, 1, 1, 1,
0.3528974, -0.3129801, 2.494653, 1, 1, 1, 1, 1,
0.3548298, 0.6493943, 1.096496, 1, 1, 1, 1, 1,
0.3580418, -0.6311027, 1.478664, 1, 1, 1, 1, 1,
0.3582701, -0.004187539, 1.251487, 1, 1, 1, 1, 1,
0.3596677, -1.535094, 4.338943, 1, 1, 1, 1, 1,
0.3649752, -1.035326, 3.416022, 1, 1, 1, 1, 1,
0.3664482, -1.17004, 1.248767, 1, 1, 1, 1, 1,
0.3683739, 1.854977, 0.3971561, 1, 1, 1, 1, 1,
0.3695563, -0.3001598, 2.116542, 1, 1, 1, 1, 1,
0.3699932, 0.07854895, 1.810154, 1, 1, 1, 1, 1,
0.3725397, 0.5635228, 1.20712, 1, 1, 1, 1, 1,
0.3742131, 0.5464417, -0.1530847, 1, 1, 1, 1, 1,
0.3760447, -0.2612448, 3.045251, 0, 0, 1, 1, 1,
0.3801248, -1.192814, 2.766761, 1, 0, 0, 1, 1,
0.3823639, -1.275819, 2.784839, 1, 0, 0, 1, 1,
0.3833384, 1.667673, -0.1559622, 1, 0, 0, 1, 1,
0.3865793, 0.1688205, 0.6741717, 1, 0, 0, 1, 1,
0.3872498, -1.2009, 2.405752, 1, 0, 0, 1, 1,
0.3907828, -0.1725096, 1.489709, 0, 0, 0, 1, 1,
0.3910757, -1.026791, 2.600456, 0, 0, 0, 1, 1,
0.3914152, 1.448094, -0.4933675, 0, 0, 0, 1, 1,
0.3925887, 0.1962029, 1.458774, 0, 0, 0, 1, 1,
0.3948541, -0.9342831, 2.605227, 0, 0, 0, 1, 1,
0.3971842, 1.335973, 0.4982901, 0, 0, 0, 1, 1,
0.3974931, 1.28699, -0.410776, 0, 0, 0, 1, 1,
0.401162, 0.1802659, 1.252763, 1, 1, 1, 1, 1,
0.4049565, -0.5910755, 0.7944044, 1, 1, 1, 1, 1,
0.4116326, -0.4491878, 3.569222, 1, 1, 1, 1, 1,
0.4135415, -0.2642704, 3.29032, 1, 1, 1, 1, 1,
0.4171444, 0.650585, 0.8257219, 1, 1, 1, 1, 1,
0.4173315, -0.6025161, 3.400514, 1, 1, 1, 1, 1,
0.4254884, -0.5440024, 2.430438, 1, 1, 1, 1, 1,
0.4256379, 1.219221, -0.6678106, 1, 1, 1, 1, 1,
0.4260659, -0.1134474, 1.777307, 1, 1, 1, 1, 1,
0.4265862, -0.8180926, 1.605855, 1, 1, 1, 1, 1,
0.4284064, 0.4144363, -0.1092985, 1, 1, 1, 1, 1,
0.4290407, -0.8853524, -0.389796, 1, 1, 1, 1, 1,
0.4294226, 0.5796257, -0.1372243, 1, 1, 1, 1, 1,
0.4301662, 0.3175703, 0.886788, 1, 1, 1, 1, 1,
0.4315522, 0.6557904, 2.630465, 1, 1, 1, 1, 1,
0.4339079, -0.1302388, 0.3731312, 0, 0, 1, 1, 1,
0.4362708, 0.7771462, 0.9678059, 1, 0, 0, 1, 1,
0.4365312, 1.624684, -1.269858, 1, 0, 0, 1, 1,
0.4372242, -0.1662182, 1.549033, 1, 0, 0, 1, 1,
0.437299, 1.480995, 1.922067, 1, 0, 0, 1, 1,
0.4445923, -1.16689, 2.942165, 1, 0, 0, 1, 1,
0.4486618, 0.09465762, -0.0584778, 0, 0, 0, 1, 1,
0.4522509, -0.3765045, 1.144754, 0, 0, 0, 1, 1,
0.4533208, -0.59566, 2.310823, 0, 0, 0, 1, 1,
0.4539825, 0.5571589, 0.05509179, 0, 0, 0, 1, 1,
0.4555781, 0.874878, 0.8506011, 0, 0, 0, 1, 1,
0.4580041, 0.7860775, -0.3360628, 0, 0, 0, 1, 1,
0.4592419, -1.34564, 1.325724, 0, 0, 0, 1, 1,
0.4593143, -0.5986984, 3.345492, 1, 1, 1, 1, 1,
0.4660097, -1.05661, 2.69905, 1, 1, 1, 1, 1,
0.4676259, -0.277823, 2.105998, 1, 1, 1, 1, 1,
0.4710694, 0.2474094, 2.304759, 1, 1, 1, 1, 1,
0.4724839, 0.5813171, 0.8381136, 1, 1, 1, 1, 1,
0.4732087, 0.04251874, 0.9187021, 1, 1, 1, 1, 1,
0.4746788, 0.6289266, 1.749673, 1, 1, 1, 1, 1,
0.4759868, -0.2472867, 2.143577, 1, 1, 1, 1, 1,
0.4806552, -1.016394, 2.823989, 1, 1, 1, 1, 1,
0.483517, 1.057431, 1.570899, 1, 1, 1, 1, 1,
0.4865345, 0.8724579, -0.9197429, 1, 1, 1, 1, 1,
0.4950503, 1.151315, 0.5369843, 1, 1, 1, 1, 1,
0.4971595, 0.8786517, 0.09904771, 1, 1, 1, 1, 1,
0.5017974, -0.2216057, 1.616903, 1, 1, 1, 1, 1,
0.5048795, 0.2792565, 2.611757, 1, 1, 1, 1, 1,
0.5066211, -0.7438537, 2.424181, 0, 0, 1, 1, 1,
0.5103625, -0.8333832, 3.049312, 1, 0, 0, 1, 1,
0.5132594, 1.045505, 0.4109803, 1, 0, 0, 1, 1,
0.5155877, -0.4226056, 2.792341, 1, 0, 0, 1, 1,
0.5175194, 1.346035, 0.7074801, 1, 0, 0, 1, 1,
0.5191083, -0.7270768, 3.111949, 1, 0, 0, 1, 1,
0.5223286, -0.3327389, 0.9101764, 0, 0, 0, 1, 1,
0.5284788, -0.3926784, 2.666142, 0, 0, 0, 1, 1,
0.5295843, 0.2464571, 1.143992, 0, 0, 0, 1, 1,
0.5444186, -0.7087577, 3.915174, 0, 0, 0, 1, 1,
0.5504521, -0.3142509, 2.377584, 0, 0, 0, 1, 1,
0.5526258, -1.376227, 4.504677, 0, 0, 0, 1, 1,
0.5529368, -0.6529559, 2.282588, 0, 0, 0, 1, 1,
0.5555177, 0.486174, -0.2413109, 1, 1, 1, 1, 1,
0.5559036, 0.02628405, 1.844727, 1, 1, 1, 1, 1,
0.569158, 0.8279018, -0.3338217, 1, 1, 1, 1, 1,
0.5791571, -1.472496, 1.659803, 1, 1, 1, 1, 1,
0.5814011, -1.73809, 3.382315, 1, 1, 1, 1, 1,
0.5816622, -0.01270399, 2.569877, 1, 1, 1, 1, 1,
0.5822767, 0.6027513, -1.363218, 1, 1, 1, 1, 1,
0.5846659, 0.2488473, 0.429467, 1, 1, 1, 1, 1,
0.593031, 1.027377, 0.4632341, 1, 1, 1, 1, 1,
0.6027958, 0.9628942, 1.018343, 1, 1, 1, 1, 1,
0.6073393, 0.7532805, 0.9321496, 1, 1, 1, 1, 1,
0.6112021, -1.706567, 2.660079, 1, 1, 1, 1, 1,
0.6127722, 1.183825, -1.211791, 1, 1, 1, 1, 1,
0.6147025, -0.4184277, 2.041296, 1, 1, 1, 1, 1,
0.616555, 0.8028577, 1.608019, 1, 1, 1, 1, 1,
0.6203429, -1.191482, 3.588154, 0, 0, 1, 1, 1,
0.6231872, -0.5486415, 2.687725, 1, 0, 0, 1, 1,
0.6235455, -1.296141, 3.598139, 1, 0, 0, 1, 1,
0.6256673, -0.233744, 2.066121, 1, 0, 0, 1, 1,
0.6284121, 0.5341635, -0.1619827, 1, 0, 0, 1, 1,
0.6299216, 0.685581, 1.098929, 1, 0, 0, 1, 1,
0.6324194, 0.8328854, 0.3775626, 0, 0, 0, 1, 1,
0.6380432, -0.7515941, 3.171088, 0, 0, 0, 1, 1,
0.639578, -1.445723, 2.276924, 0, 0, 0, 1, 1,
0.6447276, 0.7240793, 1.227707, 0, 0, 0, 1, 1,
0.6490297, 2.237178, 1.602076, 0, 0, 0, 1, 1,
0.6562082, 2.441717, 0.191185, 0, 0, 0, 1, 1,
0.6563905, -0.8494349, 1.072459, 0, 0, 0, 1, 1,
0.6579266, -0.7892122, 2.721617, 1, 1, 1, 1, 1,
0.6609538, 1.140844, 0.09865162, 1, 1, 1, 1, 1,
0.6616412, 0.8723772, 0.4687475, 1, 1, 1, 1, 1,
0.6646048, -1.45679, 2.817746, 1, 1, 1, 1, 1,
0.6726454, 0.714542, 1.207774, 1, 1, 1, 1, 1,
0.6744617, 0.1522923, 2.850887, 1, 1, 1, 1, 1,
0.6790862, 1.207249, -0.4961832, 1, 1, 1, 1, 1,
0.6817123, -1.124828, 1.630242, 1, 1, 1, 1, 1,
0.6878632, 0.04866419, 1.246652, 1, 1, 1, 1, 1,
0.6888967, 0.5623438, 0.6193289, 1, 1, 1, 1, 1,
0.6895744, 0.2111696, 1.976664, 1, 1, 1, 1, 1,
0.6898313, 0.2051248, 1.237127, 1, 1, 1, 1, 1,
0.6902788, -0.2256187, 2.939033, 1, 1, 1, 1, 1,
0.6937352, -1.727642, 2.049989, 1, 1, 1, 1, 1,
0.6939818, 0.9548572, -0.9282095, 1, 1, 1, 1, 1,
0.6940466, 1.788933, 0.5311045, 0, 0, 1, 1, 1,
0.6948871, -0.4070719, 1.445955, 1, 0, 0, 1, 1,
0.6954361, -1.466226, 2.573212, 1, 0, 0, 1, 1,
0.6968117, -0.4676312, 1.930703, 1, 0, 0, 1, 1,
0.6970429, -0.7352697, 0.4692595, 1, 0, 0, 1, 1,
0.6978515, 0.2886569, 2.162111, 1, 0, 0, 1, 1,
0.7000735, 0.1392448, -0.1346413, 0, 0, 0, 1, 1,
0.704228, 0.4565298, 0.4034483, 0, 0, 0, 1, 1,
0.7045192, -1.224277, 3.021962, 0, 0, 0, 1, 1,
0.7048965, 1.347622, 2.186619, 0, 0, 0, 1, 1,
0.7066168, 0.3199166, 1.735908, 0, 0, 0, 1, 1,
0.7139336, -1.539984, 2.265619, 0, 0, 0, 1, 1,
0.7169901, -0.04599748, -0.06644961, 0, 0, 0, 1, 1,
0.7180143, -0.3304949, 4.218832, 1, 1, 1, 1, 1,
0.7234846, 1.185369, -0.257464, 1, 1, 1, 1, 1,
0.7284442, 1.601589, -0.9794276, 1, 1, 1, 1, 1,
0.7346479, -0.1536581, -0.2917069, 1, 1, 1, 1, 1,
0.7356054, -1.196638, 1.833407, 1, 1, 1, 1, 1,
0.7394103, -3.007303, 3.507207, 1, 1, 1, 1, 1,
0.741843, 0.5494677, 1.141611, 1, 1, 1, 1, 1,
0.7450601, 0.2803122, 1.044064, 1, 1, 1, 1, 1,
0.7464207, 0.286258, 0.8864614, 1, 1, 1, 1, 1,
0.7495509, -0.9358024, 2.426389, 1, 1, 1, 1, 1,
0.7550178, -0.620504, 3.984187, 1, 1, 1, 1, 1,
0.7557291, 0.4891913, 2.141272, 1, 1, 1, 1, 1,
0.7564061, -2.225697, 2.664948, 1, 1, 1, 1, 1,
0.7608661, -0.3024801, 0.9946818, 1, 1, 1, 1, 1,
0.7609408, 0.4487132, 1.021739, 1, 1, 1, 1, 1,
0.7698931, 0.8667384, 1.184617, 0, 0, 1, 1, 1,
0.7711805, -1.217687, 2.127817, 1, 0, 0, 1, 1,
0.776615, -0.1710727, 0.5487885, 1, 0, 0, 1, 1,
0.7780881, -1.525276, 3.480633, 1, 0, 0, 1, 1,
0.7784553, -1.198605, 3.372024, 1, 0, 0, 1, 1,
0.7857864, -1.07205, 2.038418, 1, 0, 0, 1, 1,
0.7887008, 1.582311, 1.276473, 0, 0, 0, 1, 1,
0.7960157, 0.6196731, -0.4140685, 0, 0, 0, 1, 1,
0.799373, -0.9317485, 1.814932, 0, 0, 0, 1, 1,
0.7998493, 1.007273, 0.6390871, 0, 0, 0, 1, 1,
0.8017732, -1.299982, 3.064713, 0, 0, 0, 1, 1,
0.8100187, -0.7084439, 1.569711, 0, 0, 0, 1, 1,
0.8118203, 0.09183422, 2.065268, 0, 0, 0, 1, 1,
0.8131009, 0.1757579, 0.1751831, 1, 1, 1, 1, 1,
0.8138361, -0.5675952, 1.565148, 1, 1, 1, 1, 1,
0.8220825, 1.384971, 1.090283, 1, 1, 1, 1, 1,
0.8240664, -0.009966439, 0.6773627, 1, 1, 1, 1, 1,
0.8268796, 0.1434222, 0.7776868, 1, 1, 1, 1, 1,
0.8272585, -1.123936, 3.373088, 1, 1, 1, 1, 1,
0.8310003, 1.095187, -0.6703427, 1, 1, 1, 1, 1,
0.8329919, 1.035475, 1.563768, 1, 1, 1, 1, 1,
0.8337118, -1.809438, 3.098506, 1, 1, 1, 1, 1,
0.8340411, -1.17042, 3.364324, 1, 1, 1, 1, 1,
0.8345891, 0.3031449, 2.475967, 1, 1, 1, 1, 1,
0.8348084, -0.06219689, 2.282668, 1, 1, 1, 1, 1,
0.8373103, 0.5365002, 0.005438201, 1, 1, 1, 1, 1,
0.8383428, 0.7234095, 1.104519, 1, 1, 1, 1, 1,
0.8414926, 0.7747858, 3.094622, 1, 1, 1, 1, 1,
0.8464422, -0.8295877, 1.560308, 0, 0, 1, 1, 1,
0.8470619, 1.739828, 1.152693, 1, 0, 0, 1, 1,
0.8472323, 0.09233559, 1.715052, 1, 0, 0, 1, 1,
0.8475105, 1.036684, 1.396278, 1, 0, 0, 1, 1,
0.8500931, -0.4515373, 2.70206, 1, 0, 0, 1, 1,
0.8534611, 0.499675, 0.9455464, 1, 0, 0, 1, 1,
0.8581219, 1.86204, 0.3278977, 0, 0, 0, 1, 1,
0.8589672, 0.1366256, 0.781837, 0, 0, 0, 1, 1,
0.8667477, -0.2061285, 0.7518862, 0, 0, 0, 1, 1,
0.8694401, 0.8689653, 0.6154142, 0, 0, 0, 1, 1,
0.8714263, 0.8665981, 0.2150113, 0, 0, 0, 1, 1,
0.871451, 1.089525, 0.5822107, 0, 0, 0, 1, 1,
0.8726181, -2.060061, 3.924304, 0, 0, 0, 1, 1,
0.8738173, 1.014668, 1.032975, 1, 1, 1, 1, 1,
0.8740758, -0.04582608, 0.5524833, 1, 1, 1, 1, 1,
0.8747255, 0.55927, 1.589074, 1, 1, 1, 1, 1,
0.8836143, 1.266688, -0.3041382, 1, 1, 1, 1, 1,
0.8846557, -1.00957, 1.404464, 1, 1, 1, 1, 1,
0.88709, -1.139387, 3.645264, 1, 1, 1, 1, 1,
0.8932829, 0.08114219, 0.3705022, 1, 1, 1, 1, 1,
0.8937796, 1.856599, -1.809178, 1, 1, 1, 1, 1,
0.8957738, 2.381323, 1.290409, 1, 1, 1, 1, 1,
0.8989649, -0.5306605, 2.96752, 1, 1, 1, 1, 1,
0.9037092, -0.2834184, 1.710598, 1, 1, 1, 1, 1,
0.9044412, 1.551054, -0.3860179, 1, 1, 1, 1, 1,
0.9107943, 2.174669, 0.8385381, 1, 1, 1, 1, 1,
0.9191791, 0.5387822, -0.1387708, 1, 1, 1, 1, 1,
0.9271706, -0.5161983, 1.572581, 1, 1, 1, 1, 1,
0.9274235, 0.7721269, 1.102137, 0, 0, 1, 1, 1,
0.9309316, -0.07831863, 1.725965, 1, 0, 0, 1, 1,
0.9515736, -0.8986021, 1.864142, 1, 0, 0, 1, 1,
0.9537305, -0.2104662, 2.476123, 1, 0, 0, 1, 1,
0.955654, -1.659868, 2.474238, 1, 0, 0, 1, 1,
0.9600836, 1.525296, -0.1040193, 1, 0, 0, 1, 1,
0.9657383, -1.440927, 3.486475, 0, 0, 0, 1, 1,
0.9677963, 0.2909144, 2.277899, 0, 0, 0, 1, 1,
0.9679179, -0.1477988, 2.631677, 0, 0, 0, 1, 1,
0.9685217, -1.419641, 2.392657, 0, 0, 0, 1, 1,
0.9864482, -0.6327071, 3.146705, 0, 0, 0, 1, 1,
0.9902006, 1.310719, 1.15533, 0, 0, 0, 1, 1,
0.9913067, -0.5815027, 1.469486, 0, 0, 0, 1, 1,
0.9926479, -0.6547268, 2.118479, 1, 1, 1, 1, 1,
0.9971937, -1.773616, 2.807794, 1, 1, 1, 1, 1,
1.00603, -0.488829, 2.426361, 1, 1, 1, 1, 1,
1.007097, 0.527449, 1.315213, 1, 1, 1, 1, 1,
1.019676, -0.7200832, 2.288491, 1, 1, 1, 1, 1,
1.01972, -1.469324, 2.022617, 1, 1, 1, 1, 1,
1.028702, -0.9252158, 1.829329, 1, 1, 1, 1, 1,
1.031209, 0.226839, 2.553332, 1, 1, 1, 1, 1,
1.063993, 0.02576018, 3.934954, 1, 1, 1, 1, 1,
1.072561, 0.4669491, 2.11504, 1, 1, 1, 1, 1,
1.072567, 1.032164, 1.165181, 1, 1, 1, 1, 1,
1.074135, 1.178595, 1.02887, 1, 1, 1, 1, 1,
1.074374, -0.5816821, 2.493878, 1, 1, 1, 1, 1,
1.084858, -0.7978308, 3.739467, 1, 1, 1, 1, 1,
1.089271, -1.133713, 1.852942, 1, 1, 1, 1, 1,
1.09126, 0.6656535, 0.8440422, 0, 0, 1, 1, 1,
1.105569, 0.04513417, 2.466505, 1, 0, 0, 1, 1,
1.10726, -1.394812, 3.801963, 1, 0, 0, 1, 1,
1.117997, 2.11368, -0.2507887, 1, 0, 0, 1, 1,
1.120283, -0.139988, 0.4578171, 1, 0, 0, 1, 1,
1.122858, -1.287487, 1.52639, 1, 0, 0, 1, 1,
1.12305, 0.3708822, 1.712733, 0, 0, 0, 1, 1,
1.139359, -0.216468, 0.7048946, 0, 0, 0, 1, 1,
1.145239, 1.022372, 1.865273, 0, 0, 0, 1, 1,
1.151304, 1.476735, 1.25253, 0, 0, 0, 1, 1,
1.155889, -1.380454, 2.001954, 0, 0, 0, 1, 1,
1.162118, -0.7172734, 2.416637, 0, 0, 0, 1, 1,
1.164857, -1.742725, 1.472844, 0, 0, 0, 1, 1,
1.183247, -0.5493955, 2.543925, 1, 1, 1, 1, 1,
1.194688, 0.948082, 1.152588, 1, 1, 1, 1, 1,
1.197017, 1.477754, 2.63353, 1, 1, 1, 1, 1,
1.198878, 0.104921, 2.281382, 1, 1, 1, 1, 1,
1.200287, -0.2210997, 0.1493629, 1, 1, 1, 1, 1,
1.207152, 1.579615, 0.9470223, 1, 1, 1, 1, 1,
1.208969, -0.6100315, 0.563481, 1, 1, 1, 1, 1,
1.209928, 1.360415, 1.840482, 1, 1, 1, 1, 1,
1.213099, -1.638345, 2.538386, 1, 1, 1, 1, 1,
1.216159, -1.146938, 2.896599, 1, 1, 1, 1, 1,
1.2183, -2.669545, 1.796602, 1, 1, 1, 1, 1,
1.223538, 0.2759008, 0.3252084, 1, 1, 1, 1, 1,
1.223902, 0.9881415, 0.4421979, 1, 1, 1, 1, 1,
1.225351, -0.2554587, 1.840225, 1, 1, 1, 1, 1,
1.226485, -0.9274696, 1.160635, 1, 1, 1, 1, 1,
1.22795, 0.3450437, 2.853086, 0, 0, 1, 1, 1,
1.231715, 0.7807677, -0.7077497, 1, 0, 0, 1, 1,
1.232099, 0.1388401, 2.336343, 1, 0, 0, 1, 1,
1.243137, 1.682166, 1.55816, 1, 0, 0, 1, 1,
1.248338, -0.7819088, 2.846838, 1, 0, 0, 1, 1,
1.250738, -1.94667, 2.319021, 1, 0, 0, 1, 1,
1.251196, -0.2913174, 0.1578069, 0, 0, 0, 1, 1,
1.258067, -0.4618967, 1.430637, 0, 0, 0, 1, 1,
1.261378, 0.0489166, 0.6672136, 0, 0, 0, 1, 1,
1.272561, -0.3485248, 2.376763, 0, 0, 0, 1, 1,
1.275416, 0.386387, 1.045427, 0, 0, 0, 1, 1,
1.279989, -0.1613827, 1.381212, 0, 0, 0, 1, 1,
1.281881, 0.02637534, 2.716197, 0, 0, 0, 1, 1,
1.29335, -0.6445441, 3.792871, 1, 1, 1, 1, 1,
1.297032, -1.341222, 1.311246, 1, 1, 1, 1, 1,
1.314352, 0.6505386, 0.08506037, 1, 1, 1, 1, 1,
1.321573, -0.09373275, 1.651284, 1, 1, 1, 1, 1,
1.337301, 0.6585138, 2.742389, 1, 1, 1, 1, 1,
1.349386, 1.064518, 0.5134101, 1, 1, 1, 1, 1,
1.359023, -0.6063786, 2.562064, 1, 1, 1, 1, 1,
1.366034, -0.7318075, 2.914745, 1, 1, 1, 1, 1,
1.376132, 0.1680083, 3.405103, 1, 1, 1, 1, 1,
1.380051, -1.289307, 1.497849, 1, 1, 1, 1, 1,
1.38302, -0.1104022, 1.680852, 1, 1, 1, 1, 1,
1.391189, -0.03532794, 0.1210137, 1, 1, 1, 1, 1,
1.399632, 0.6482952, -0.7388611, 1, 1, 1, 1, 1,
1.415417, -1.876893, 2.168874, 1, 1, 1, 1, 1,
1.423038, -0.3726139, 2.741726, 1, 1, 1, 1, 1,
1.428821, 0.314271, 1.701623, 0, 0, 1, 1, 1,
1.428899, 1.666739, 0.6915773, 1, 0, 0, 1, 1,
1.429542, -0.2359826, 2.282458, 1, 0, 0, 1, 1,
1.432009, 0.5693104, 1.941211, 1, 0, 0, 1, 1,
1.447394, -0.8867855, 2.410017, 1, 0, 0, 1, 1,
1.469172, -1.020277, 1.909642, 1, 0, 0, 1, 1,
1.47868, -0.2069793, 1.136532, 0, 0, 0, 1, 1,
1.479139, 0.70385, 1.170595, 0, 0, 0, 1, 1,
1.490254, -0.3050957, 1.816588, 0, 0, 0, 1, 1,
1.497344, -0.6500749, 0.6069459, 0, 0, 0, 1, 1,
1.518254, -0.1429992, 1.706465, 0, 0, 0, 1, 1,
1.523945, 1.304959, 1.132844, 0, 0, 0, 1, 1,
1.525577, 0.4036241, 1.419547, 0, 0, 0, 1, 1,
1.530161, -0.2625422, 2.804492, 1, 1, 1, 1, 1,
1.562628, 0.433075, 0.8839546, 1, 1, 1, 1, 1,
1.567836, 0.3715337, 2.143875, 1, 1, 1, 1, 1,
1.570402, 1.427629, -0.3865184, 1, 1, 1, 1, 1,
1.575771, 0.8139605, 0.8076466, 1, 1, 1, 1, 1,
1.581942, 1.419145, -0.6161373, 1, 1, 1, 1, 1,
1.582197, 0.8435162, -0.5757145, 1, 1, 1, 1, 1,
1.599022, -1.266749, 1.660731, 1, 1, 1, 1, 1,
1.614537, 1.562066, -0.217056, 1, 1, 1, 1, 1,
1.617723, 0.670819, 0.976836, 1, 1, 1, 1, 1,
1.634645, 0.4015517, 0.1072401, 1, 1, 1, 1, 1,
1.640463, -0.5531807, 0.8445817, 1, 1, 1, 1, 1,
1.644333, -1.086221, 1.934764, 1, 1, 1, 1, 1,
1.652619, 0.07164925, 0.8038141, 1, 1, 1, 1, 1,
1.658486, -0.4546022, 2.874352, 1, 1, 1, 1, 1,
1.680992, 0.1725851, 1.653102, 0, 0, 1, 1, 1,
1.696658, 0.5612154, 1.730223, 1, 0, 0, 1, 1,
1.717438, 0.2197502, 2.694542, 1, 0, 0, 1, 1,
1.729111, 0.5112064, 1.500329, 1, 0, 0, 1, 1,
1.736476, -0.6269528, 1.869232, 1, 0, 0, 1, 1,
1.738466, -0.9767744, 0.8374695, 1, 0, 0, 1, 1,
1.742332, -0.4075341, 0.1383778, 0, 0, 0, 1, 1,
1.75724, -0.9751614, 1.038583, 0, 0, 0, 1, 1,
1.777281, -0.1985911, 2.118606, 0, 0, 0, 1, 1,
1.786567, 0.4023944, 1.304127, 0, 0, 0, 1, 1,
1.798788, 0.9901064, 0.2053575, 0, 0, 0, 1, 1,
1.813236, 1.388437, 2.112474, 0, 0, 0, 1, 1,
1.813665, 1.499764, 0.5564612, 0, 0, 0, 1, 1,
1.818656, -0.9512334, 1.872185, 1, 1, 1, 1, 1,
1.824178, -0.1719776, 0.05386045, 1, 1, 1, 1, 1,
1.845783, -0.3447907, 0.8828827, 1, 1, 1, 1, 1,
1.882073, 0.5605992, 2.755415, 1, 1, 1, 1, 1,
1.884568, -0.884163, 1.158251, 1, 1, 1, 1, 1,
1.906144, 0.4878927, 0.3365748, 1, 1, 1, 1, 1,
1.910006, 0.3055741, 0.87165, 1, 1, 1, 1, 1,
1.922664, -0.207202, 1.107411, 1, 1, 1, 1, 1,
1.941945, -0.6918027, 1.393272, 1, 1, 1, 1, 1,
1.953466, 0.820461, 0.4485119, 1, 1, 1, 1, 1,
1.955858, -1.090172, 3.586493, 1, 1, 1, 1, 1,
1.971699, -0.3865595, 0.8896152, 1, 1, 1, 1, 1,
2.023314, -0.8851765, 2.323545, 1, 1, 1, 1, 1,
2.030135, -0.7708185, 2.655639, 1, 1, 1, 1, 1,
2.082021, -0.8137346, 4.786284, 1, 1, 1, 1, 1,
2.083713, -2.04656, 2.252493, 0, 0, 1, 1, 1,
2.084639, -0.4317966, 0.5117484, 1, 0, 0, 1, 1,
2.094162, -0.4498086, -0.1636122, 1, 0, 0, 1, 1,
2.140402, -0.5356168, 0.6252472, 1, 0, 0, 1, 1,
2.209459, -1.776192, 2.679661, 1, 0, 0, 1, 1,
2.271746, -1.302074, 2.209094, 1, 0, 0, 1, 1,
2.427391, -0.2889032, 0.6567317, 0, 0, 0, 1, 1,
2.427741, -2.706249, 2.094049, 0, 0, 0, 1, 1,
2.436888, 0.0474385, 1.41929, 0, 0, 0, 1, 1,
2.4901, 1.508592, 1.169065, 0, 0, 0, 1, 1,
2.549765, 0.1822357, 2.429444, 0, 0, 0, 1, 1,
2.562435, -1.003157, 0.7988051, 0, 0, 0, 1, 1,
2.574802, 1.002774, 0.3531758, 0, 0, 0, 1, 1,
2.590786, -0.615025, 2.327737, 1, 1, 1, 1, 1,
2.614419, -1.260427, 3.250066, 1, 1, 1, 1, 1,
2.623558, -0.5469315, 3.01121, 1, 1, 1, 1, 1,
2.65959, -0.5907808, 1.991228, 1, 1, 1, 1, 1,
2.750196, -0.08271179, 0.0847241, 1, 1, 1, 1, 1,
3.072844, 2.359244, 1.947953, 1, 1, 1, 1, 1,
3.116829, 0.7964613, 2.519623, 1, 1, 1, 1, 1
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
var radius = 10.37519;
var distance = 36.4424;
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
mvMatrix.translate( 0.3100135, 0.265294, 0.1605184 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.4424);
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