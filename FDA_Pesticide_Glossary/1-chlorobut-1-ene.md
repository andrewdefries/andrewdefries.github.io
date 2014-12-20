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
-3.090613, -0.1801048, -0.5425843, 1, 0, 0, 1,
-3.049171, 0.1399916, -1.982212, 1, 0.007843138, 0, 1,
-2.802127, 0.134386, -0.325372, 1, 0.01176471, 0, 1,
-2.747791, 0.8513327, -0.7834842, 1, 0.01960784, 0, 1,
-2.594425, 0.4244041, -2.356806, 1, 0.02352941, 0, 1,
-2.524537, -0.04590115, -1.390373, 1, 0.03137255, 0, 1,
-2.504236, 0.178498, -1.697326, 1, 0.03529412, 0, 1,
-2.498893, 1.246091, -1.011689, 1, 0.04313726, 0, 1,
-2.37692, 2.338234, -3.360858, 1, 0.04705882, 0, 1,
-2.372468, -2.505505, -4.478938, 1, 0.05490196, 0, 1,
-2.364849, -0.5274749, -2.030984, 1, 0.05882353, 0, 1,
-2.364635, -0.7880473, -1.931729, 1, 0.06666667, 0, 1,
-2.332907, 0.7468647, -1.984605, 1, 0.07058824, 0, 1,
-2.313836, 0.8171777, -1.542556, 1, 0.07843138, 0, 1,
-2.287265, -1.591022, -2.383035, 1, 0.08235294, 0, 1,
-2.265805, -1.88678, -3.396389, 1, 0.09019608, 0, 1,
-2.256603, -0.5020264, -0.8048302, 1, 0.09411765, 0, 1,
-2.252324, -1.131651, -0.3238711, 1, 0.1019608, 0, 1,
-2.1693, -0.2522363, -3.292932, 1, 0.1098039, 0, 1,
-2.158303, -0.2404957, -1.463692, 1, 0.1137255, 0, 1,
-2.126128, 1.258737, -1.825816, 1, 0.1215686, 0, 1,
-2.115335, 0.7021971, -0.2351355, 1, 0.1254902, 0, 1,
-2.107995, -0.9283547, -1.882064, 1, 0.1333333, 0, 1,
-2.09782, 0.4404664, -1.176045, 1, 0.1372549, 0, 1,
-2.025112, -0.7041138, -1.31215, 1, 0.145098, 0, 1,
-2.01854, -0.2940802, -1.046175, 1, 0.1490196, 0, 1,
-1.983974, 0.1270751, -1.944186, 1, 0.1568628, 0, 1,
-1.880382, -0.7644883, -1.913244, 1, 0.1607843, 0, 1,
-1.873406, -1.414802, -2.050858, 1, 0.1686275, 0, 1,
-1.847032, -1.028693, -1.498043, 1, 0.172549, 0, 1,
-1.845903, -1.215475, -1.601449, 1, 0.1803922, 0, 1,
-1.838249, -0.6792769, -2.36885, 1, 0.1843137, 0, 1,
-1.823397, 0.4768366, -2.791158, 1, 0.1921569, 0, 1,
-1.784053, 0.8069625, -1.631108, 1, 0.1960784, 0, 1,
-1.772754, 0.3474458, -1.633967, 1, 0.2039216, 0, 1,
-1.771396, 1.344137, -0.9932964, 1, 0.2117647, 0, 1,
-1.769824, 0.5089462, -3.339219, 1, 0.2156863, 0, 1,
-1.759866, -0.5845007, -1.201799, 1, 0.2235294, 0, 1,
-1.743501, 0.2771997, -0.2879165, 1, 0.227451, 0, 1,
-1.737123, 0.9845031, -1.231199, 1, 0.2352941, 0, 1,
-1.724341, -1.030723, -0.1361534, 1, 0.2392157, 0, 1,
-1.718364, 0.3745044, -0.8470133, 1, 0.2470588, 0, 1,
-1.705553, 0.7704771, -1.488556, 1, 0.2509804, 0, 1,
-1.700224, -0.05069729, -1.690544, 1, 0.2588235, 0, 1,
-1.695616, -1.562822, -2.581591, 1, 0.2627451, 0, 1,
-1.683297, -1.377534, -1.360636, 1, 0.2705882, 0, 1,
-1.668241, -0.4698712, -2.72738, 1, 0.2745098, 0, 1,
-1.650029, -1.94966, -1.024538, 1, 0.282353, 0, 1,
-1.635636, 0.5669411, -1.486235, 1, 0.2862745, 0, 1,
-1.630654, -1.528492, -2.490314, 1, 0.2941177, 0, 1,
-1.617701, 0.2318608, -2.289629, 1, 0.3019608, 0, 1,
-1.609903, -0.1241212, 1.011528, 1, 0.3058824, 0, 1,
-1.602034, 0.006352044, 0.2179035, 1, 0.3137255, 0, 1,
-1.601903, -0.2927938, -1.238512, 1, 0.3176471, 0, 1,
-1.591444, -1.285494, -2.260807, 1, 0.3254902, 0, 1,
-1.577152, -0.810774, -1.760391, 1, 0.3294118, 0, 1,
-1.576219, 0.1167173, -2.150533, 1, 0.3372549, 0, 1,
-1.574622, -1.26232, -1.128003, 1, 0.3411765, 0, 1,
-1.560991, 1.404578, -2.924782, 1, 0.3490196, 0, 1,
-1.551567, -1.178017, -3.116649, 1, 0.3529412, 0, 1,
-1.550315, -1.013216, -2.794655, 1, 0.3607843, 0, 1,
-1.54822, 0.3989592, -0.3483408, 1, 0.3647059, 0, 1,
-1.544631, -0.07095427, -2.196437, 1, 0.372549, 0, 1,
-1.542896, 1.117666, -1.161856, 1, 0.3764706, 0, 1,
-1.540895, 0.1640269, -2.640207, 1, 0.3843137, 0, 1,
-1.538686, -1.408396, -0.5108849, 1, 0.3882353, 0, 1,
-1.513209, 1.947655, -1.290078, 1, 0.3960784, 0, 1,
-1.512988, -0.9510512, -2.647327, 1, 0.4039216, 0, 1,
-1.503272, 2.26991, -0.09039715, 1, 0.4078431, 0, 1,
-1.485216, -0.1478929, -2.058014, 1, 0.4156863, 0, 1,
-1.482648, -0.9155957, -1.66773, 1, 0.4196078, 0, 1,
-1.471767, -1.154154, -4.104812, 1, 0.427451, 0, 1,
-1.470054, 1.742377, -0.3634312, 1, 0.4313726, 0, 1,
-1.422367, 0.05802344, -1.869734, 1, 0.4392157, 0, 1,
-1.420422, 0.4300441, -1.582308, 1, 0.4431373, 0, 1,
-1.418422, 1.431376, -0.8322311, 1, 0.4509804, 0, 1,
-1.39546, 0.289726, -1.229147, 1, 0.454902, 0, 1,
-1.390408, 0.4195279, -0.3239521, 1, 0.4627451, 0, 1,
-1.384522, -1.834832, -4.034106, 1, 0.4666667, 0, 1,
-1.380596, -0.02739713, -2.151472, 1, 0.4745098, 0, 1,
-1.36193, 0.9074267, -0.2179316, 1, 0.4784314, 0, 1,
-1.356661, -1.159535, -2.687823, 1, 0.4862745, 0, 1,
-1.341225, 0.5143658, -0.9363464, 1, 0.4901961, 0, 1,
-1.336645, 0.7369161, -1.50803, 1, 0.4980392, 0, 1,
-1.331736, -0.1833428, -0.3188233, 1, 0.5058824, 0, 1,
-1.31973, -0.9787381, -2.143861, 1, 0.509804, 0, 1,
-1.302168, -0.1594338, -0.06831247, 1, 0.5176471, 0, 1,
-1.30155, 0.6676899, -1.994511, 1, 0.5215687, 0, 1,
-1.284999, 0.9107401, -1.386937, 1, 0.5294118, 0, 1,
-1.281984, -0.1329604, -1.261622, 1, 0.5333334, 0, 1,
-1.280708, -0.6838115, -1.177276, 1, 0.5411765, 0, 1,
-1.267077, -0.07419664, -1.467168, 1, 0.5450981, 0, 1,
-1.26593, 0.8532131, -0.1906758, 1, 0.5529412, 0, 1,
-1.263055, 1.486194, 0.4299024, 1, 0.5568628, 0, 1,
-1.255299, 2.068321, -2.28645, 1, 0.5647059, 0, 1,
-1.245838, 0.711521, -0.6335659, 1, 0.5686275, 0, 1,
-1.239891, -0.3752267, -2.329909, 1, 0.5764706, 0, 1,
-1.225938, -2.016224, -3.2806, 1, 0.5803922, 0, 1,
-1.222972, 0.06672663, -0.963501, 1, 0.5882353, 0, 1,
-1.221177, 0.1294136, -3.097475, 1, 0.5921569, 0, 1,
-1.217676, -0.5941564, -2.657673, 1, 0.6, 0, 1,
-1.213273, 0.6908054, -0.3679583, 1, 0.6078432, 0, 1,
-1.209535, -0.1606513, 0.09200202, 1, 0.6117647, 0, 1,
-1.208046, 0.421425, -0.5870786, 1, 0.6196079, 0, 1,
-1.196692, 1.466507, -0.2426551, 1, 0.6235294, 0, 1,
-1.186295, -1.198774, -4.544061, 1, 0.6313726, 0, 1,
-1.182993, 0.4612468, -1.416735, 1, 0.6352941, 0, 1,
-1.180407, 0.02008219, -1.558729, 1, 0.6431373, 0, 1,
-1.173118, -0.4839577, -4.434573, 1, 0.6470588, 0, 1,
-1.172469, -2.083302, -4.331378, 1, 0.654902, 0, 1,
-1.169811, -0.4779869, -3.718874, 1, 0.6588235, 0, 1,
-1.168067, 0.5646245, -1.599951, 1, 0.6666667, 0, 1,
-1.161702, 0.7903793, -2.812511, 1, 0.6705883, 0, 1,
-1.160819, 1.667502, -1.819475, 1, 0.6784314, 0, 1,
-1.157364, -0.8796617, -1.669433, 1, 0.682353, 0, 1,
-1.15575, 0.4646858, -1.062604, 1, 0.6901961, 0, 1,
-1.155052, 1.541686, 1.154237, 1, 0.6941177, 0, 1,
-1.152574, -0.006373429, -0.2352463, 1, 0.7019608, 0, 1,
-1.152152, 0.2835349, -2.075813, 1, 0.7098039, 0, 1,
-1.142283, -0.3623365, -3.086108, 1, 0.7137255, 0, 1,
-1.141001, 0.5673076, -1.061617, 1, 0.7215686, 0, 1,
-1.139958, 0.08628876, -0.4451843, 1, 0.7254902, 0, 1,
-1.136654, 0.2998874, 0.1869738, 1, 0.7333333, 0, 1,
-1.123408, 0.4223575, -2.265553, 1, 0.7372549, 0, 1,
-1.120978, -0.5669182, -0.5180865, 1, 0.7450981, 0, 1,
-1.119513, 0.003264969, -1.997787, 1, 0.7490196, 0, 1,
-1.112162, -0.2326403, -1.177652, 1, 0.7568628, 0, 1,
-1.103523, -0.6148785, -2.183905, 1, 0.7607843, 0, 1,
-1.10225, 0.1138474, -2.693913, 1, 0.7686275, 0, 1,
-1.100736, 0.9817609, -2.633367, 1, 0.772549, 0, 1,
-1.098775, -0.05608815, -1.972462, 1, 0.7803922, 0, 1,
-1.098288, 0.3382814, 0.1106361, 1, 0.7843137, 0, 1,
-1.090954, 1.255909, -0.3909418, 1, 0.7921569, 0, 1,
-1.08453, -0.3964891, -1.461721, 1, 0.7960784, 0, 1,
-1.080045, 0.6937426, -1.433824, 1, 0.8039216, 0, 1,
-1.072192, -0.1326886, -1.166744, 1, 0.8117647, 0, 1,
-1.070282, 0.7824739, -0.6808344, 1, 0.8156863, 0, 1,
-1.066016, -0.2909357, -1.77612, 1, 0.8235294, 0, 1,
-1.065096, -0.5301347, -3.695373, 1, 0.827451, 0, 1,
-1.06112, 0.07969101, -2.258216, 1, 0.8352941, 0, 1,
-1.059506, -1.660557, -2.010316, 1, 0.8392157, 0, 1,
-1.058756, -0.1657073, -1.988453, 1, 0.8470588, 0, 1,
-1.050162, 0.7658812, -0.9718722, 1, 0.8509804, 0, 1,
-1.049952, -0.9260528, -1.150152, 1, 0.8588235, 0, 1,
-1.045293, -0.7605511, 0.2568612, 1, 0.8627451, 0, 1,
-1.044335, -0.5659289, -0.9556645, 1, 0.8705882, 0, 1,
-1.042703, 0.49278, -0.7817042, 1, 0.8745098, 0, 1,
-1.036979, -0.6765153, -0.5629563, 1, 0.8823529, 0, 1,
-1.0338, -1.871296, -1.230725, 1, 0.8862745, 0, 1,
-1.031329, 0.6534804, -1.135069, 1, 0.8941177, 0, 1,
-1.029272, -1.999868, -2.756014, 1, 0.8980392, 0, 1,
-1.026119, -0.1400681, -1.926383, 1, 0.9058824, 0, 1,
-1.023036, -0.4689222, -1.740671, 1, 0.9137255, 0, 1,
-1.014691, -0.5205412, -3.476098, 1, 0.9176471, 0, 1,
-1.011931, 0.8802058, -0.5168934, 1, 0.9254902, 0, 1,
-1.011655, -0.5582284, -1.686453, 1, 0.9294118, 0, 1,
-1.009301, 0.3895634, -2.709149, 1, 0.9372549, 0, 1,
-1.005436, 0.6845494, -0.83062, 1, 0.9411765, 0, 1,
-0.9908004, -0.4609258, 0.5795146, 1, 0.9490196, 0, 1,
-0.9879651, -0.9038774, -1.941054, 1, 0.9529412, 0, 1,
-0.9829854, -0.6330563, -1.989254, 1, 0.9607843, 0, 1,
-0.9707508, 0.3185687, -2.794549, 1, 0.9647059, 0, 1,
-0.9671311, 0.3882839, -1.580091, 1, 0.972549, 0, 1,
-0.9670093, 0.5739639, -1.668851, 1, 0.9764706, 0, 1,
-0.9625245, -0.5763251, -0.8208145, 1, 0.9843137, 0, 1,
-0.9595029, 0.1546301, -1.748946, 1, 0.9882353, 0, 1,
-0.9532036, 0.7968197, 0.6831267, 1, 0.9960784, 0, 1,
-0.947107, -0.2586234, -3.816292, 0.9960784, 1, 0, 1,
-0.9427658, 0.1279615, -1.024723, 0.9921569, 1, 0, 1,
-0.9411368, -0.1815125, -4.021431, 0.9843137, 1, 0, 1,
-0.9372039, 0.7729132, -1.181231, 0.9803922, 1, 0, 1,
-0.9218693, -1.374414, -1.35006, 0.972549, 1, 0, 1,
-0.9201479, -1.861837, -2.155885, 0.9686275, 1, 0, 1,
-0.9194723, 2.159072, -1.126745, 0.9607843, 1, 0, 1,
-0.9081602, -0.9059644, -2.142876, 0.9568627, 1, 0, 1,
-0.9029033, -2.488198, -2.736017, 0.9490196, 1, 0, 1,
-0.9016805, 0.170117, -2.187164, 0.945098, 1, 0, 1,
-0.9011403, -0.4720562, -1.138201, 0.9372549, 1, 0, 1,
-0.9006655, -0.6672416, -3.056019, 0.9333333, 1, 0, 1,
-0.8955271, -0.02749755, -1.6165, 0.9254902, 1, 0, 1,
-0.8913041, -0.2411026, -2.264665, 0.9215686, 1, 0, 1,
-0.8912925, -0.8182493, -1.403553, 0.9137255, 1, 0, 1,
-0.8814645, 0.3669266, -0.2827682, 0.9098039, 1, 0, 1,
-0.8811918, -0.5572375, 0.6983145, 0.9019608, 1, 0, 1,
-0.8787951, 0.71404, -0.548509, 0.8941177, 1, 0, 1,
-0.8719403, -1.744472, -2.250484, 0.8901961, 1, 0, 1,
-0.871285, -2.256689, -3.081448, 0.8823529, 1, 0, 1,
-0.8697, -2.485957, -0.04042482, 0.8784314, 1, 0, 1,
-0.8685317, 0.9389916, -1.277875, 0.8705882, 1, 0, 1,
-0.8672543, -0.1350144, -1.588448, 0.8666667, 1, 0, 1,
-0.8513258, -0.03897339, -2.446204, 0.8588235, 1, 0, 1,
-0.8423376, -0.5248073, -1.672623, 0.854902, 1, 0, 1,
-0.8401068, 0.8571635, -1.009322, 0.8470588, 1, 0, 1,
-0.8400815, 1.889819, 0.8552423, 0.8431373, 1, 0, 1,
-0.8378369, 1.222052, -2.98645, 0.8352941, 1, 0, 1,
-0.8373938, -1.00542, -2.722734, 0.8313726, 1, 0, 1,
-0.8373215, -0.7418834, -1.661295, 0.8235294, 1, 0, 1,
-0.8365401, 0.9691947, -0.3153167, 0.8196079, 1, 0, 1,
-0.8299628, -1.139894, -1.872362, 0.8117647, 1, 0, 1,
-0.82972, -0.5424358, -1.573515, 0.8078431, 1, 0, 1,
-0.8272976, -0.04952804, -2.63015, 0.8, 1, 0, 1,
-0.8244952, -0.3684439, -1.930692, 0.7921569, 1, 0, 1,
-0.8222673, -1.570253, -2.294077, 0.7882353, 1, 0, 1,
-0.8208617, -1.59193, -1.899601, 0.7803922, 1, 0, 1,
-0.8091332, -0.4173693, -1.11333, 0.7764706, 1, 0, 1,
-0.8040208, -0.2122842, -1.34237, 0.7686275, 1, 0, 1,
-0.801501, 0.5507267, -2.709401, 0.7647059, 1, 0, 1,
-0.7997042, 0.08956925, -1.043475, 0.7568628, 1, 0, 1,
-0.7993501, 0.1819607, -2.056674, 0.7529412, 1, 0, 1,
-0.7968273, 1.397769, -1.170922, 0.7450981, 1, 0, 1,
-0.7946827, -1.508491, -2.790527, 0.7411765, 1, 0, 1,
-0.7923411, -1.049511, -3.434058, 0.7333333, 1, 0, 1,
-0.7876003, -1.29709, -2.61121, 0.7294118, 1, 0, 1,
-0.7790887, -1.622845, -3.509272, 0.7215686, 1, 0, 1,
-0.7781953, -1.978461, -2.121257, 0.7176471, 1, 0, 1,
-0.771488, 0.01026447, -1.168369, 0.7098039, 1, 0, 1,
-0.7695812, 0.799668, -1.106882, 0.7058824, 1, 0, 1,
-0.7690976, -0.5422791, -2.556056, 0.6980392, 1, 0, 1,
-0.7644851, -1.504973, -2.523424, 0.6901961, 1, 0, 1,
-0.7566113, -1.104243, -2.633474, 0.6862745, 1, 0, 1,
-0.7548497, -1.610876, -3.436092, 0.6784314, 1, 0, 1,
-0.7508632, 0.2614915, -0.7515224, 0.6745098, 1, 0, 1,
-0.7482172, -1.472445, -2.999874, 0.6666667, 1, 0, 1,
-0.7355027, -0.2347333, -3.007014, 0.6627451, 1, 0, 1,
-0.7351103, -0.6908535, -1.311684, 0.654902, 1, 0, 1,
-0.7348406, -0.8520814, -2.293631, 0.6509804, 1, 0, 1,
-0.7310983, -0.3463142, -1.301185, 0.6431373, 1, 0, 1,
-0.7270278, 0.4434197, 0.5819358, 0.6392157, 1, 0, 1,
-0.7257302, 1.665668, 0.6764926, 0.6313726, 1, 0, 1,
-0.7205725, 0.4743513, -1.052525, 0.627451, 1, 0, 1,
-0.7201266, 0.6290846, 0.3157763, 0.6196079, 1, 0, 1,
-0.717943, -0.9321598, -4.169987, 0.6156863, 1, 0, 1,
-0.7056208, -0.17565, -1.802685, 0.6078432, 1, 0, 1,
-0.702367, 0.9565651, -0.1593653, 0.6039216, 1, 0, 1,
-0.7012675, 0.05438926, -0.9684876, 0.5960785, 1, 0, 1,
-0.6981637, -1.390346, -2.928727, 0.5882353, 1, 0, 1,
-0.6950187, 0.4421152, 0.2988652, 0.5843138, 1, 0, 1,
-0.6938188, 0.003919824, -0.9703391, 0.5764706, 1, 0, 1,
-0.6913745, -1.895189, -2.687735, 0.572549, 1, 0, 1,
-0.6906637, 0.6651303, -1.670778, 0.5647059, 1, 0, 1,
-0.6902965, -0.3472965, -3.441669, 0.5607843, 1, 0, 1,
-0.6734293, 0.8466747, -1.436494, 0.5529412, 1, 0, 1,
-0.6628741, 0.9933011, -0.6978242, 0.5490196, 1, 0, 1,
-0.6619677, -0.2314617, -1.5016, 0.5411765, 1, 0, 1,
-0.6617037, -0.8984618, -3.082187, 0.5372549, 1, 0, 1,
-0.6601692, -0.1602343, -2.13702, 0.5294118, 1, 0, 1,
-0.6578081, -0.3689764, -2.798753, 0.5254902, 1, 0, 1,
-0.6551501, -0.8788887, -1.788241, 0.5176471, 1, 0, 1,
-0.6540799, -0.03653741, -2.953689, 0.5137255, 1, 0, 1,
-0.6492027, -0.3024577, -1.152483, 0.5058824, 1, 0, 1,
-0.6473073, 0.4019575, -0.7976537, 0.5019608, 1, 0, 1,
-0.6463376, 0.325764, -2.478045, 0.4941176, 1, 0, 1,
-0.6360633, 0.440424, -1.512755, 0.4862745, 1, 0, 1,
-0.6359679, -0.2369283, -1.951905, 0.4823529, 1, 0, 1,
-0.6358505, -1.371381, -3.929819, 0.4745098, 1, 0, 1,
-0.6356251, 0.2545881, 0.6720045, 0.4705882, 1, 0, 1,
-0.6247551, -0.3660805, -2.163812, 0.4627451, 1, 0, 1,
-0.6241568, -0.7600676, -2.456751, 0.4588235, 1, 0, 1,
-0.6223311, 0.09621369, -3.430913, 0.4509804, 1, 0, 1,
-0.6134042, 0.1521213, -1.245731, 0.4470588, 1, 0, 1,
-0.6125401, 0.2537164, 0.4776872, 0.4392157, 1, 0, 1,
-0.6054631, -1.496015, -5.31431, 0.4352941, 1, 0, 1,
-0.6047846, -0.5990022, -1.807319, 0.427451, 1, 0, 1,
-0.6041089, -0.2058611, -1.04621, 0.4235294, 1, 0, 1,
-0.5928535, 1.98112, -0.8614039, 0.4156863, 1, 0, 1,
-0.5910501, 0.6140271, -1.695889, 0.4117647, 1, 0, 1,
-0.5869702, 1.154312, -0.7271727, 0.4039216, 1, 0, 1,
-0.586053, -0.7719881, -2.491945, 0.3960784, 1, 0, 1,
-0.5850849, 0.2405099, -0.1959897, 0.3921569, 1, 0, 1,
-0.5822135, 0.3433999, -0.3876553, 0.3843137, 1, 0, 1,
-0.5795585, -0.2588776, -0.8432379, 0.3803922, 1, 0, 1,
-0.5768149, 0.5232065, -0.2056493, 0.372549, 1, 0, 1,
-0.576484, -0.05107419, -0.9571126, 0.3686275, 1, 0, 1,
-0.5752773, -0.6801001, -0.8362752, 0.3607843, 1, 0, 1,
-0.5734203, 0.03742312, 0.2644047, 0.3568628, 1, 0, 1,
-0.573306, -0.8448286, -4.655783, 0.3490196, 1, 0, 1,
-0.5698947, 0.4204585, -0.502903, 0.345098, 1, 0, 1,
-0.5684605, 0.5526866, -1.361332, 0.3372549, 1, 0, 1,
-0.567292, 0.695659, 0.2078217, 0.3333333, 1, 0, 1,
-0.5628595, -0.2598842, -1.380308, 0.3254902, 1, 0, 1,
-0.5598162, -0.1291297, -1.473692, 0.3215686, 1, 0, 1,
-0.5566984, 0.081817, -1.725029, 0.3137255, 1, 0, 1,
-0.5519216, -0.8031721, -3.634675, 0.3098039, 1, 0, 1,
-0.5516444, 1.319208, 0.7601961, 0.3019608, 1, 0, 1,
-0.5472761, 0.2849785, -1.129468, 0.2941177, 1, 0, 1,
-0.5369937, 1.122117, -0.1447604, 0.2901961, 1, 0, 1,
-0.5326959, -0.06590826, -1.627993, 0.282353, 1, 0, 1,
-0.5268735, 1.144835, -0.8604941, 0.2784314, 1, 0, 1,
-0.5242575, 1.606642, 0.3858814, 0.2705882, 1, 0, 1,
-0.5196359, -0.5027105, -3.600527, 0.2666667, 1, 0, 1,
-0.5152782, -0.7876372, -1.930442, 0.2588235, 1, 0, 1,
-0.5152487, -1.200099, -4.104054, 0.254902, 1, 0, 1,
-0.5130733, 0.6900233, -1.164572, 0.2470588, 1, 0, 1,
-0.5112567, 1.307034, -0.2421693, 0.2431373, 1, 0, 1,
-0.5098468, 1.03132, -0.8253182, 0.2352941, 1, 0, 1,
-0.5063394, 0.2107521, -1.696644, 0.2313726, 1, 0, 1,
-0.5058658, -0.8811323, -1.900215, 0.2235294, 1, 0, 1,
-0.5043038, -1.274713, -3.043627, 0.2196078, 1, 0, 1,
-0.5021613, 0.6708928, 1.550209, 0.2117647, 1, 0, 1,
-0.5021089, -1.10953, -1.81591, 0.2078431, 1, 0, 1,
-0.5016846, -0.7858764, -4.775235, 0.2, 1, 0, 1,
-0.496069, 0.564097, -1.232104, 0.1921569, 1, 0, 1,
-0.4950963, -0.3383357, -2.274076, 0.1882353, 1, 0, 1,
-0.493553, -0.2284107, -0.7409669, 0.1803922, 1, 0, 1,
-0.4920993, -0.5045593, -3.059039, 0.1764706, 1, 0, 1,
-0.4875068, -0.751049, -0.9882689, 0.1686275, 1, 0, 1,
-0.4861495, 1.932073, 0.5829834, 0.1647059, 1, 0, 1,
-0.4859718, -1.422551, -3.449754, 0.1568628, 1, 0, 1,
-0.4843395, -1.429549, -1.643494, 0.1529412, 1, 0, 1,
-0.483393, 1.109, 1.536258, 0.145098, 1, 0, 1,
-0.4807854, 0.683426, -1.778424, 0.1411765, 1, 0, 1,
-0.4754595, 0.7726058, -1.207918, 0.1333333, 1, 0, 1,
-0.4752538, -0.01286878, -1.078683, 0.1294118, 1, 0, 1,
-0.4750863, 0.1246468, -0.1431364, 0.1215686, 1, 0, 1,
-0.4698935, -0.4767297, -2.650321, 0.1176471, 1, 0, 1,
-0.4658891, 0.8281565, 0.006061603, 0.1098039, 1, 0, 1,
-0.4580192, -0.07489198, -3.138347, 0.1058824, 1, 0, 1,
-0.4557827, 0.3268365, -1.609921, 0.09803922, 1, 0, 1,
-0.4510718, 0.7171041, -2.055257, 0.09019608, 1, 0, 1,
-0.4498609, 1.532648, -1.475625, 0.08627451, 1, 0, 1,
-0.4438335, 0.3665084, -0.8382028, 0.07843138, 1, 0, 1,
-0.4412876, 0.4996828, -0.8368034, 0.07450981, 1, 0, 1,
-0.4411139, 1.112036, -0.1759948, 0.06666667, 1, 0, 1,
-0.4365208, -1.869312, -3.117295, 0.0627451, 1, 0, 1,
-0.4278494, 1.166251, -1.983863, 0.05490196, 1, 0, 1,
-0.4277697, -0.6192574, -3.035291, 0.05098039, 1, 0, 1,
-0.4272383, -0.7241231, -5.267438, 0.04313726, 1, 0, 1,
-0.4210994, -0.5824967, -2.367183, 0.03921569, 1, 0, 1,
-0.4161995, 0.613653, -1.513301, 0.03137255, 1, 0, 1,
-0.4107223, -1.064835, -2.056216, 0.02745098, 1, 0, 1,
-0.4073566, -0.7429752, -3.508503, 0.01960784, 1, 0, 1,
-0.4067588, 0.4689326, -1.601825, 0.01568628, 1, 0, 1,
-0.3952073, -1.252791, -0.5383267, 0.007843138, 1, 0, 1,
-0.3915093, 0.7425669, -0.6095733, 0.003921569, 1, 0, 1,
-0.3902646, 0.4184698, -2.795887, 0, 1, 0.003921569, 1,
-0.3863724, -2.068144, -4.042504, 0, 1, 0.01176471, 1,
-0.3858712, -0.03302042, -3.50051, 0, 1, 0.01568628, 1,
-0.3849703, 1.252473, -0.1594645, 0, 1, 0.02352941, 1,
-0.3773655, 0.7430417, -1.056891, 0, 1, 0.02745098, 1,
-0.3722731, 1.202732, 0.506917, 0, 1, 0.03529412, 1,
-0.3715399, -1.036738, -2.172582, 0, 1, 0.03921569, 1,
-0.3709063, -0.6999305, -2.81728, 0, 1, 0.04705882, 1,
-0.3664818, -0.2583489, -1.441414, 0, 1, 0.05098039, 1,
-0.3616892, -0.5631053, -1.580777, 0, 1, 0.05882353, 1,
-0.354644, -1.538623, -1.89774, 0, 1, 0.0627451, 1,
-0.3482629, -1.211931, -3.223902, 0, 1, 0.07058824, 1,
-0.3479328, -1.945206, -2.654553, 0, 1, 0.07450981, 1,
-0.3460011, -0.9338219, -1.484344, 0, 1, 0.08235294, 1,
-0.3441978, 0.09662567, -1.236432, 0, 1, 0.08627451, 1,
-0.3427442, 0.4515201, -0.2397408, 0, 1, 0.09411765, 1,
-0.3382871, -0.39538, -0.8998017, 0, 1, 0.1019608, 1,
-0.3373548, -0.511715, -3.341435, 0, 1, 0.1058824, 1,
-0.3316661, -0.1855051, -2.614716, 0, 1, 0.1137255, 1,
-0.3278342, -0.4906093, -1.813819, 0, 1, 0.1176471, 1,
-0.3210026, 0.9611034, -0.4595205, 0, 1, 0.1254902, 1,
-0.3177094, 1.007681, -0.6491082, 0, 1, 0.1294118, 1,
-0.3175062, -0.2046609, -1.222496, 0, 1, 0.1372549, 1,
-0.3166359, 1.208338, -0.1701232, 0, 1, 0.1411765, 1,
-0.3122673, -1.026636, -1.676399, 0, 1, 0.1490196, 1,
-0.3116152, -0.607663, -2.447439, 0, 1, 0.1529412, 1,
-0.3113329, 1.661381, -1.852156, 0, 1, 0.1607843, 1,
-0.3057329, -0.01306041, -1.262389, 0, 1, 0.1647059, 1,
-0.3035286, 0.2705057, -0.3906219, 0, 1, 0.172549, 1,
-0.2981556, 0.9434041, 0.2251835, 0, 1, 0.1764706, 1,
-0.296448, -0.02365573, -1.323379, 0, 1, 0.1843137, 1,
-0.2949111, 0.8900344, -1.36866, 0, 1, 0.1882353, 1,
-0.2947845, 1.018005, 0.9558147, 0, 1, 0.1960784, 1,
-0.2913081, -0.8579147, -1.610094, 0, 1, 0.2039216, 1,
-0.2904381, -0.1046666, -2.224732, 0, 1, 0.2078431, 1,
-0.2904296, -0.8667583, -2.371289, 0, 1, 0.2156863, 1,
-0.2898158, -0.2837018, -1.668991, 0, 1, 0.2196078, 1,
-0.2894175, -0.163716, -0.7314818, 0, 1, 0.227451, 1,
-0.2884828, -1.392283, -2.866592, 0, 1, 0.2313726, 1,
-0.2865442, 0.07596505, 0.3017431, 0, 1, 0.2392157, 1,
-0.2839077, 0.6648384, 1.050065, 0, 1, 0.2431373, 1,
-0.283229, 1.010264, -1.495379, 0, 1, 0.2509804, 1,
-0.2817237, -0.4393168, -4.80233, 0, 1, 0.254902, 1,
-0.2816805, -0.04598496, -2.098275, 0, 1, 0.2627451, 1,
-0.2813748, -0.3906927, -2.025239, 0, 1, 0.2666667, 1,
-0.281076, 0.08362846, -2.516237, 0, 1, 0.2745098, 1,
-0.2794576, -1.893362, -3.269773, 0, 1, 0.2784314, 1,
-0.2792751, -0.5488855, -2.688661, 0, 1, 0.2862745, 1,
-0.2785396, 1.425183, -0.271857, 0, 1, 0.2901961, 1,
-0.2776993, 0.7536438, -1.591687, 0, 1, 0.2980392, 1,
-0.2722274, -0.05131004, -0.8719555, 0, 1, 0.3058824, 1,
-0.2702711, -1.010417, -3.015177, 0, 1, 0.3098039, 1,
-0.2688443, -0.2989903, -1.385126, 0, 1, 0.3176471, 1,
-0.2687161, -0.05501227, -2.371568, 0, 1, 0.3215686, 1,
-0.2633986, 1.347862, -0.7774892, 0, 1, 0.3294118, 1,
-0.2547877, 2.771551, 1.040573, 0, 1, 0.3333333, 1,
-0.2545842, 0.7829206, -2.806087, 0, 1, 0.3411765, 1,
-0.2537319, 0.943954, 0.8402423, 0, 1, 0.345098, 1,
-0.2536525, -1.12295, -0.2357821, 0, 1, 0.3529412, 1,
-0.2525241, 0.7220566, 0.2487884, 0, 1, 0.3568628, 1,
-0.252513, 2.836117, 1.533418, 0, 1, 0.3647059, 1,
-0.2514259, 1.008757, 0.5626339, 0, 1, 0.3686275, 1,
-0.2474155, -0.5104789, -3.840065, 0, 1, 0.3764706, 1,
-0.245673, -1.373342, -1.349482, 0, 1, 0.3803922, 1,
-0.2436951, -0.3145956, -3.82453, 0, 1, 0.3882353, 1,
-0.2417542, -0.2091852, -2.533184, 0, 1, 0.3921569, 1,
-0.2363737, 1.039429, -0.1201882, 0, 1, 0.4, 1,
-0.2344718, -1.759766, -2.79004, 0, 1, 0.4078431, 1,
-0.2336458, 0.3055228, -0.4346991, 0, 1, 0.4117647, 1,
-0.232317, 0.8618628, 0.6405439, 0, 1, 0.4196078, 1,
-0.2317429, 2.758098, -1.878514, 0, 1, 0.4235294, 1,
-0.2300066, -0.449653, -2.73, 0, 1, 0.4313726, 1,
-0.2289739, -1.270066, -3.090845, 0, 1, 0.4352941, 1,
-0.2276285, 1.061247, -0.2499146, 0, 1, 0.4431373, 1,
-0.2276078, -0.06012114, -3.775667, 0, 1, 0.4470588, 1,
-0.2233734, -1.320941, -0.7185723, 0, 1, 0.454902, 1,
-0.2211828, -2.55273, -0.7231312, 0, 1, 0.4588235, 1,
-0.2142516, -1.133424, -3.553238, 0, 1, 0.4666667, 1,
-0.2113928, 1.429894, -0.6913452, 0, 1, 0.4705882, 1,
-0.2103465, -0.8044704, -3.243931, 0, 1, 0.4784314, 1,
-0.2083042, 0.2066747, -0.4306437, 0, 1, 0.4823529, 1,
-0.2065615, -1.107105, -1.653763, 0, 1, 0.4901961, 1,
-0.1984618, -1.243384, -5.304866, 0, 1, 0.4941176, 1,
-0.1935706, -0.6288041, -3.659299, 0, 1, 0.5019608, 1,
-0.1921532, 1.007506, 1.647886, 0, 1, 0.509804, 1,
-0.1856284, 1.080661, -2.17914, 0, 1, 0.5137255, 1,
-0.1853909, -0.9116229, -2.410095, 0, 1, 0.5215687, 1,
-0.1845782, 1.384517, 0.3485682, 0, 1, 0.5254902, 1,
-0.1809469, -0.2544272, -2.603936, 0, 1, 0.5333334, 1,
-0.1800842, -0.1497756, -0.5363315, 0, 1, 0.5372549, 1,
-0.1781834, 0.06675447, -0.1427509, 0, 1, 0.5450981, 1,
-0.1755586, -0.9437008, -1.569976, 0, 1, 0.5490196, 1,
-0.1745881, -0.8183538, -4.546161, 0, 1, 0.5568628, 1,
-0.1745465, -0.442787, -3.01235, 0, 1, 0.5607843, 1,
-0.1643371, 1.360508, -1.791774, 0, 1, 0.5686275, 1,
-0.1594213, -0.1823486, -2.246783, 0, 1, 0.572549, 1,
-0.1580206, -0.79127, -3.673396, 0, 1, 0.5803922, 1,
-0.1547836, 0.9262969, -0.3530539, 0, 1, 0.5843138, 1,
-0.1545159, 1.250407, -1.731021, 0, 1, 0.5921569, 1,
-0.1531196, 0.4415433, -1.093192, 0, 1, 0.5960785, 1,
-0.1531016, -0.8661285, -2.312021, 0, 1, 0.6039216, 1,
-0.1516264, -0.6339983, -2.777325, 0, 1, 0.6117647, 1,
-0.1513804, 0.7950708, -0.6410585, 0, 1, 0.6156863, 1,
-0.1510819, 1.243173, 0.0891269, 0, 1, 0.6235294, 1,
-0.1510281, 0.3565099, -0.4258748, 0, 1, 0.627451, 1,
-0.1500011, 0.3337374, -0.4050561, 0, 1, 0.6352941, 1,
-0.1399586, 1.89531, 0.1233398, 0, 1, 0.6392157, 1,
-0.1387541, 0.2757856, -1.0792, 0, 1, 0.6470588, 1,
-0.1330169, 1.354748, 0.4445205, 0, 1, 0.6509804, 1,
-0.1296487, 0.7914169, 1.066158, 0, 1, 0.6588235, 1,
-0.1261649, -0.9441912, -3.326448, 0, 1, 0.6627451, 1,
-0.1253302, -0.9767721, -3.723876, 0, 1, 0.6705883, 1,
-0.1213251, -0.04602086, -2.377156, 0, 1, 0.6745098, 1,
-0.1185865, 2.504244, 1.235107, 0, 1, 0.682353, 1,
-0.1184863, -0.8203251, -2.95929, 0, 1, 0.6862745, 1,
-0.118414, 1.397191, -2.147996, 0, 1, 0.6941177, 1,
-0.117066, -0.3418184, -2.857936, 0, 1, 0.7019608, 1,
-0.1103435, -0.4498828, -1.221138, 0, 1, 0.7058824, 1,
-0.1097723, 0.4541226, 0.6690619, 0, 1, 0.7137255, 1,
-0.1062656, 0.4279167, 0.2098268, 0, 1, 0.7176471, 1,
-0.1042253, -1.721342, -5.179139, 0, 1, 0.7254902, 1,
-0.1039884, 0.2849609, -1.31074, 0, 1, 0.7294118, 1,
-0.09750146, 0.3577239, 0.4224332, 0, 1, 0.7372549, 1,
-0.09538833, -1.637973, -4.626825, 0, 1, 0.7411765, 1,
-0.09356094, 3.013125, 2.166955, 0, 1, 0.7490196, 1,
-0.09073689, 0.4765248, -1.037594, 0, 1, 0.7529412, 1,
-0.09028313, -0.271096, -2.683763, 0, 1, 0.7607843, 1,
-0.0828068, 0.06894254, -3.324877, 0, 1, 0.7647059, 1,
-0.08146729, 1.147412, -1.683906, 0, 1, 0.772549, 1,
-0.07924645, -0.4005207, -2.129802, 0, 1, 0.7764706, 1,
-0.07768903, 0.451246, 0.5122528, 0, 1, 0.7843137, 1,
-0.07410436, 0.290501, 1.154826, 0, 1, 0.7882353, 1,
-0.07373531, -0.8723075, -3.486877, 0, 1, 0.7960784, 1,
-0.06896009, -0.4882903, -3.625392, 0, 1, 0.8039216, 1,
-0.06588606, -0.3421056, -3.740161, 0, 1, 0.8078431, 1,
-0.06395378, 1.161005, -1.737248, 0, 1, 0.8156863, 1,
-0.06172188, 0.05185527, -2.320001, 0, 1, 0.8196079, 1,
-0.05876485, 0.1970301, -1.588046, 0, 1, 0.827451, 1,
-0.05553654, -0.4812129, -2.185397, 0, 1, 0.8313726, 1,
-0.04085616, 0.9252883, -0.08260328, 0, 1, 0.8392157, 1,
-0.04038438, -0.5776879, -2.599948, 0, 1, 0.8431373, 1,
-0.04026446, 1.145591, -0.3053078, 0, 1, 0.8509804, 1,
-0.03889548, 0.2570864, -0.7993029, 0, 1, 0.854902, 1,
-0.03359698, 1.240209, -0.4136008, 0, 1, 0.8627451, 1,
-0.02954628, -0.315704, -4.155854, 0, 1, 0.8666667, 1,
-0.02469631, -0.9790836, -4.341292, 0, 1, 0.8745098, 1,
-0.02392192, 1.156574, -0.001533292, 0, 1, 0.8784314, 1,
-0.02332292, -0.9954171, -1.988303, 0, 1, 0.8862745, 1,
-0.01896804, -0.4017381, -1.73043, 0, 1, 0.8901961, 1,
-0.01123221, -0.7815086, -2.091574, 0, 1, 0.8980392, 1,
-0.009668431, -0.2632638, -3.785648, 0, 1, 0.9058824, 1,
-0.008381924, -0.8667598, -2.340299, 0, 1, 0.9098039, 1,
-0.006678983, 1.067279, 2.225652, 0, 1, 0.9176471, 1,
-0.003262884, -0.1089139, -2.343631, 0, 1, 0.9215686, 1,
0.008051585, -1.346934, 2.004225, 0, 1, 0.9294118, 1,
0.008604138, 0.7362853, -0.7888247, 0, 1, 0.9333333, 1,
0.008967204, 1.103013, 0.3946475, 0, 1, 0.9411765, 1,
0.01011872, -0.1973788, 4.47554, 0, 1, 0.945098, 1,
0.01470048, 0.180898, 0.6224105, 0, 1, 0.9529412, 1,
0.02065616, 0.4660716, 0.5262932, 0, 1, 0.9568627, 1,
0.02120959, -0.8723395, 4.180346, 0, 1, 0.9647059, 1,
0.02444363, 1.015925, -0.8454303, 0, 1, 0.9686275, 1,
0.02543701, 0.9952224, 0.7734071, 0, 1, 0.9764706, 1,
0.02552102, -0.7643692, 3.525789, 0, 1, 0.9803922, 1,
0.02928247, -0.6194952, 1.165659, 0, 1, 0.9882353, 1,
0.02990793, -1.473478, 3.847998, 0, 1, 0.9921569, 1,
0.03019668, 1.28987, 0.5533102, 0, 1, 1, 1,
0.03394099, -1.036468, 5.501781, 0, 0.9921569, 1, 1,
0.03686825, -0.1647035, 0.4647508, 0, 0.9882353, 1, 1,
0.03694114, 0.3255873, -1.844307, 0, 0.9803922, 1, 1,
0.03900891, 1.598404, -0.7520798, 0, 0.9764706, 1, 1,
0.04987126, -0.1062024, 2.479144, 0, 0.9686275, 1, 1,
0.0536303, 1.940189, 1.686468, 0, 0.9647059, 1, 1,
0.05400567, 1.180731, -0.08833311, 0, 0.9568627, 1, 1,
0.05438375, -0.6595642, 3.371476, 0, 0.9529412, 1, 1,
0.05563377, -1.613484, 3.241804, 0, 0.945098, 1, 1,
0.05679066, -1.033984, 3.284453, 0, 0.9411765, 1, 1,
0.05719, -0.798047, 3.16897, 0, 0.9333333, 1, 1,
0.06037923, -0.09434193, 3.427297, 0, 0.9294118, 1, 1,
0.06064889, 0.1983566, -1.179162, 0, 0.9215686, 1, 1,
0.06116002, -1.26187, 2.919764, 0, 0.9176471, 1, 1,
0.06377561, -1.632591, 3.417641, 0, 0.9098039, 1, 1,
0.06550396, -2.180135, 3.280322, 0, 0.9058824, 1, 1,
0.06724034, -0.3835141, 3.854072, 0, 0.8980392, 1, 1,
0.06727636, 0.2916237, 0.9714371, 0, 0.8901961, 1, 1,
0.07212748, 0.1937303, 1.114457, 0, 0.8862745, 1, 1,
0.07401858, -0.0242995, 0.5862765, 0, 0.8784314, 1, 1,
0.07436441, -0.4459343, 2.477181, 0, 0.8745098, 1, 1,
0.07615677, -0.336246, 2.297414, 0, 0.8666667, 1, 1,
0.0805827, -0.8065033, 2.240937, 0, 0.8627451, 1, 1,
0.08490168, 0.1796559, 0.4511724, 0, 0.854902, 1, 1,
0.08540414, -1.341681, 1.855763, 0, 0.8509804, 1, 1,
0.09217034, -0.9100941, 3.355295, 0, 0.8431373, 1, 1,
0.09525304, -0.3427889, 4.330338, 0, 0.8392157, 1, 1,
0.09619343, -1.636425, 1.197342, 0, 0.8313726, 1, 1,
0.1065248, -2.110156, 2.759826, 0, 0.827451, 1, 1,
0.1084373, 0.06634977, 0.7783677, 0, 0.8196079, 1, 1,
0.1113558, -0.2348203, 2.451133, 0, 0.8156863, 1, 1,
0.114365, 0.2713026, 0.5804535, 0, 0.8078431, 1, 1,
0.115924, -1.229197, 2.863351, 0, 0.8039216, 1, 1,
0.1159878, 0.02110826, 2.804757, 0, 0.7960784, 1, 1,
0.1167005, 0.07946668, 1.460054, 0, 0.7882353, 1, 1,
0.1191846, -0.9253656, 3.287584, 0, 0.7843137, 1, 1,
0.1224151, 0.06529398, 2.450154, 0, 0.7764706, 1, 1,
0.1233702, 2.581968, 0.08100715, 0, 0.772549, 1, 1,
0.1287768, -1.767822, 2.446012, 0, 0.7647059, 1, 1,
0.1306184, -0.739979, 2.612817, 0, 0.7607843, 1, 1,
0.1308018, 0.02022607, 2.012536, 0, 0.7529412, 1, 1,
0.1314386, 0.5234044, 1.748614, 0, 0.7490196, 1, 1,
0.1327699, 1.227699, 0.7075706, 0, 0.7411765, 1, 1,
0.1351937, 0.3089635, -0.3206417, 0, 0.7372549, 1, 1,
0.1372996, -0.9160731, 2.913289, 0, 0.7294118, 1, 1,
0.1401757, -0.2810565, 2.593616, 0, 0.7254902, 1, 1,
0.1433345, 0.1138391, -0.1854944, 0, 0.7176471, 1, 1,
0.1459329, 0.07617665, 2.439183, 0, 0.7137255, 1, 1,
0.1464777, -1.563431, 4.030913, 0, 0.7058824, 1, 1,
0.1538459, 0.8122464, 0.6691338, 0, 0.6980392, 1, 1,
0.1604255, 0.1743296, -0.2490201, 0, 0.6941177, 1, 1,
0.1607921, 1.46346, 1.079273, 0, 0.6862745, 1, 1,
0.1613018, 1.392931, -0.6530112, 0, 0.682353, 1, 1,
0.1653673, 0.527473, 0.3839611, 0, 0.6745098, 1, 1,
0.1716315, -0.6118128, 2.45112, 0, 0.6705883, 1, 1,
0.1759261, 0.01809241, 0.9232092, 0, 0.6627451, 1, 1,
0.1767493, -0.6774827, 3.344831, 0, 0.6588235, 1, 1,
0.1779291, 0.2383013, -0.1589304, 0, 0.6509804, 1, 1,
0.1802453, 1.353374, 1.00906, 0, 0.6470588, 1, 1,
0.1820197, -0.9127097, 4.129575, 0, 0.6392157, 1, 1,
0.1829671, 0.3571084, 1.33987, 0, 0.6352941, 1, 1,
0.1848296, 0.40048, 4.283394, 0, 0.627451, 1, 1,
0.1904899, 1.341657, -1.482563, 0, 0.6235294, 1, 1,
0.191756, 0.3448663, -0.160863, 0, 0.6156863, 1, 1,
0.1929078, 0.5519516, 1.847203, 0, 0.6117647, 1, 1,
0.1938426, -0.1611039, 2.04136, 0, 0.6039216, 1, 1,
0.1941702, 1.228773, 0.6745225, 0, 0.5960785, 1, 1,
0.2021946, 0.8407393, -0.4122279, 0, 0.5921569, 1, 1,
0.2067607, 0.2837034, 0.9428189, 0, 0.5843138, 1, 1,
0.2096742, 2.046149, -1.290906, 0, 0.5803922, 1, 1,
0.210133, 0.3815663, 0.413946, 0, 0.572549, 1, 1,
0.2126351, -0.1476098, 2.287079, 0, 0.5686275, 1, 1,
0.2151453, 0.5054539, 1.97611, 0, 0.5607843, 1, 1,
0.2153372, -1.280561, 3.338558, 0, 0.5568628, 1, 1,
0.2164968, 0.093009, 0.705503, 0, 0.5490196, 1, 1,
0.2193926, -0.9546238, 2.723382, 0, 0.5450981, 1, 1,
0.2216145, 0.9732957, 0.1170167, 0, 0.5372549, 1, 1,
0.2233469, -0.007313049, 3.07039, 0, 0.5333334, 1, 1,
0.2241461, -2.559185, 2.07957, 0, 0.5254902, 1, 1,
0.2287001, -0.8197662, 3.16943, 0, 0.5215687, 1, 1,
0.2288505, -2.089761, 2.648624, 0, 0.5137255, 1, 1,
0.2288684, -1.288882, 1.385347, 0, 0.509804, 1, 1,
0.2295406, 2.146546, -0.08971239, 0, 0.5019608, 1, 1,
0.2306423, 0.2326924, 0.9624681, 0, 0.4941176, 1, 1,
0.2366659, 0.7836196, -0.9434112, 0, 0.4901961, 1, 1,
0.2432038, -1.194225, 0.4411454, 0, 0.4823529, 1, 1,
0.2472326, 0.03883866, 1.287414, 0, 0.4784314, 1, 1,
0.2529242, -0.3734611, 3.777994, 0, 0.4705882, 1, 1,
0.2543061, 0.006875176, 0.2120267, 0, 0.4666667, 1, 1,
0.2580133, -1.088149, 2.628275, 0, 0.4588235, 1, 1,
0.2593732, 0.9440189, 1.576113, 0, 0.454902, 1, 1,
0.2599498, 1.121003, 0.5361325, 0, 0.4470588, 1, 1,
0.2603263, -0.44439, 1.25342, 0, 0.4431373, 1, 1,
0.2608006, 0.07313467, 0.826032, 0, 0.4352941, 1, 1,
0.2637911, 1.064566, 1.312283, 0, 0.4313726, 1, 1,
0.2649392, 1.448582, -0.2406281, 0, 0.4235294, 1, 1,
0.2672074, -0.446618, 3.217006, 0, 0.4196078, 1, 1,
0.268926, -0.1074508, 3.887568, 0, 0.4117647, 1, 1,
0.2718549, 0.752444, 0.8684505, 0, 0.4078431, 1, 1,
0.2763065, -0.905422, 1.479725, 0, 0.4, 1, 1,
0.2770734, 1.110051, -0.01170047, 0, 0.3921569, 1, 1,
0.2810254, -1.168987, 1.694903, 0, 0.3882353, 1, 1,
0.2867029, 0.931971, -0.2581822, 0, 0.3803922, 1, 1,
0.2900952, -0.6368488, 2.552411, 0, 0.3764706, 1, 1,
0.2924471, 0.07660423, 1.389074, 0, 0.3686275, 1, 1,
0.2930361, -1.156369, 4.572121, 0, 0.3647059, 1, 1,
0.3007521, -1.057286, 1.642641, 0, 0.3568628, 1, 1,
0.3045576, 0.8349465, 1.388015, 0, 0.3529412, 1, 1,
0.3047558, 0.493565, 0.1711565, 0, 0.345098, 1, 1,
0.3062244, 0.5073131, 2.34327, 0, 0.3411765, 1, 1,
0.3077892, -0.1876216, 2.273067, 0, 0.3333333, 1, 1,
0.3077931, -0.7221946, 2.895931, 0, 0.3294118, 1, 1,
0.3080415, -0.5598579, 2.64615, 0, 0.3215686, 1, 1,
0.3170763, -1.355097, 3.817612, 0, 0.3176471, 1, 1,
0.3192249, 0.1974541, 2.17366, 0, 0.3098039, 1, 1,
0.3194247, -0.3213454, 2.060236, 0, 0.3058824, 1, 1,
0.3194813, 0.3123784, 1.211868, 0, 0.2980392, 1, 1,
0.3195875, -0.4088119, 2.871967, 0, 0.2901961, 1, 1,
0.3224604, -0.8573199, 2.157844, 0, 0.2862745, 1, 1,
0.3242815, -1.523488, 4.287028, 0, 0.2784314, 1, 1,
0.3256552, 0.1474884, 1.204164, 0, 0.2745098, 1, 1,
0.3312463, -1.639806, 2.311776, 0, 0.2666667, 1, 1,
0.3367755, 1.8905, 0.1885687, 0, 0.2627451, 1, 1,
0.3371327, 0.3781478, 0.0831925, 0, 0.254902, 1, 1,
0.3378654, -0.04163583, 1.689142, 0, 0.2509804, 1, 1,
0.3379889, 1.70039, -1.005894, 0, 0.2431373, 1, 1,
0.3417527, 0.3920377, 0.5160711, 0, 0.2392157, 1, 1,
0.3472541, 1.059489, -0.08575675, 0, 0.2313726, 1, 1,
0.3520277, 0.2252507, 0.2618732, 0, 0.227451, 1, 1,
0.3526915, -1.035218, 5.244096, 0, 0.2196078, 1, 1,
0.3548538, -0.2504463, 4.810391, 0, 0.2156863, 1, 1,
0.3606188, -0.6221904, 3.916659, 0, 0.2078431, 1, 1,
0.3613795, 0.5666774, 2.79394, 0, 0.2039216, 1, 1,
0.3639182, 0.4363488, 0.2395095, 0, 0.1960784, 1, 1,
0.3650988, 1.47939, -1.197996, 0, 0.1882353, 1, 1,
0.3662095, 0.1438676, -0.005999545, 0, 0.1843137, 1, 1,
0.3717583, -0.661367, 4.396771, 0, 0.1764706, 1, 1,
0.3746608, -0.4731621, 2.85356, 0, 0.172549, 1, 1,
0.3789673, -0.2250708, 0.5904461, 0, 0.1647059, 1, 1,
0.3791253, -0.6537932, 2.318697, 0, 0.1607843, 1, 1,
0.3796937, 0.3242636, 1.15856, 0, 0.1529412, 1, 1,
0.381966, 0.8082001, -0.5706986, 0, 0.1490196, 1, 1,
0.382917, 0.5658001, 1.104993, 0, 0.1411765, 1, 1,
0.3849016, -0.7508479, 4.268972, 0, 0.1372549, 1, 1,
0.3921647, 1.960894, -0.8618209, 0, 0.1294118, 1, 1,
0.3933698, 1.554986, 0.3126004, 0, 0.1254902, 1, 1,
0.3943452, -0.2834117, 1.963622, 0, 0.1176471, 1, 1,
0.3944768, 1.04135, -0.7132201, 0, 0.1137255, 1, 1,
0.3974645, 0.08781303, -0.8656756, 0, 0.1058824, 1, 1,
0.3977846, 0.9446814, -0.8431006, 0, 0.09803922, 1, 1,
0.3983519, 0.577626, 0.07512863, 0, 0.09411765, 1, 1,
0.3995726, -1.180674, 1.314086, 0, 0.08627451, 1, 1,
0.4006092, 0.3974609, 3.902287, 0, 0.08235294, 1, 1,
0.4038682, 0.2560006, 1.166751, 0, 0.07450981, 1, 1,
0.4061802, 0.41519, 1.538452, 0, 0.07058824, 1, 1,
0.40857, -0.7252748, 1.784567, 0, 0.0627451, 1, 1,
0.4088854, -0.7762029, 3.383438, 0, 0.05882353, 1, 1,
0.4162565, 0.6292375, 1.528374, 0, 0.05098039, 1, 1,
0.4196396, 0.2838453, 0.3364897, 0, 0.04705882, 1, 1,
0.4196597, 0.4548039, 0.7779898, 0, 0.03921569, 1, 1,
0.4209334, 0.9850419, 1.971143, 0, 0.03529412, 1, 1,
0.4227343, -0.881869, 2.732004, 0, 0.02745098, 1, 1,
0.4246185, -0.1138974, 3.066673, 0, 0.02352941, 1, 1,
0.4298963, 1.275349, -0.7837073, 0, 0.01568628, 1, 1,
0.4315082, 0.8389134, 1.210718, 0, 0.01176471, 1, 1,
0.4412216, 0.7589282, 1.750561, 0, 0.003921569, 1, 1,
0.4425137, -0.3170182, 2.930054, 0.003921569, 0, 1, 1,
0.4425687, -1.202582, 3.556704, 0.007843138, 0, 1, 1,
0.4427796, -0.2782024, 2.187927, 0.01568628, 0, 1, 1,
0.4458376, 0.6770864, 1.741929, 0.01960784, 0, 1, 1,
0.4466574, 0.3329609, 1.393818, 0.02745098, 0, 1, 1,
0.4490157, 1.172859, 3.932714, 0.03137255, 0, 1, 1,
0.4498864, 0.9712167, 1.006219, 0.03921569, 0, 1, 1,
0.4523247, 0.6363751, 1.184368, 0.04313726, 0, 1, 1,
0.4545435, 1.004961, 0.002842478, 0.05098039, 0, 1, 1,
0.4588492, -0.7116756, 2.888229, 0.05490196, 0, 1, 1,
0.463966, 0.1438592, -0.2640934, 0.0627451, 0, 1, 1,
0.4662681, 2.66797, -0.3930095, 0.06666667, 0, 1, 1,
0.4674394, -0.258577, 1.78315, 0.07450981, 0, 1, 1,
0.4679905, 0.4188873, -0.2412827, 0.07843138, 0, 1, 1,
0.4707689, 0.5582602, -0.175745, 0.08627451, 0, 1, 1,
0.4717009, -0.7220336, 2.109268, 0.09019608, 0, 1, 1,
0.4765805, -0.2918625, 3.418663, 0.09803922, 0, 1, 1,
0.4775955, 0.001188352, 2.731498, 0.1058824, 0, 1, 1,
0.4794677, -0.8507345, 2.903622, 0.1098039, 0, 1, 1,
0.4809249, 2.447845, -0.05252274, 0.1176471, 0, 1, 1,
0.4854953, -0.2134624, 1.104705, 0.1215686, 0, 1, 1,
0.4855294, -1.758156, 3.139096, 0.1294118, 0, 1, 1,
0.4891942, -0.05830334, 1.461073, 0.1333333, 0, 1, 1,
0.4927275, -0.7795236, 1.458496, 0.1411765, 0, 1, 1,
0.4953298, -0.4627734, 1.231056, 0.145098, 0, 1, 1,
0.5012625, 1.133347, 1.158386, 0.1529412, 0, 1, 1,
0.5055841, 1.63618, -0.5975162, 0.1568628, 0, 1, 1,
0.5082003, 0.2227346, 1.170291, 0.1647059, 0, 1, 1,
0.5097539, 1.923401, -0.4155816, 0.1686275, 0, 1, 1,
0.5134058, -0.05921333, 2.958649, 0.1764706, 0, 1, 1,
0.5139769, -0.5956743, 2.493316, 0.1803922, 0, 1, 1,
0.5326173, -1.049112, 3.11318, 0.1882353, 0, 1, 1,
0.5352141, 0.2535484, 0.6748006, 0.1921569, 0, 1, 1,
0.5371618, -0.3814116, 0.9879196, 0.2, 0, 1, 1,
0.5376685, -0.7654051, 2.536861, 0.2078431, 0, 1, 1,
0.5408971, -1.294235, 1.260572, 0.2117647, 0, 1, 1,
0.5449519, 1.490036, 0.131304, 0.2196078, 0, 1, 1,
0.5493948, -1.499562, 5.409186, 0.2235294, 0, 1, 1,
0.5494488, -0.2479125, 2.340956, 0.2313726, 0, 1, 1,
0.5510712, -1.099769, 2.376611, 0.2352941, 0, 1, 1,
0.551073, 0.1836126, 0.1956206, 0.2431373, 0, 1, 1,
0.5574145, -0.6604161, 2.030037, 0.2470588, 0, 1, 1,
0.5582952, 0.4460785, 0.9690118, 0.254902, 0, 1, 1,
0.5598056, -0.7860997, 1.657514, 0.2588235, 0, 1, 1,
0.560738, -1.101416, 2.728472, 0.2666667, 0, 1, 1,
0.5690254, 1.268607, -0.23747, 0.2705882, 0, 1, 1,
0.5707792, 0.1061033, 1.604682, 0.2784314, 0, 1, 1,
0.5726745, 0.3623767, 0.6650264, 0.282353, 0, 1, 1,
0.5778628, -0.3567408, 1.621995, 0.2901961, 0, 1, 1,
0.5854699, -1.453789, 1.942919, 0.2941177, 0, 1, 1,
0.5869524, -0.5082367, 2.142517, 0.3019608, 0, 1, 1,
0.590506, -0.321664, 3.527998, 0.3098039, 0, 1, 1,
0.5950975, -0.01806329, -0.720865, 0.3137255, 0, 1, 1,
0.6062548, 0.4712139, 1.294159, 0.3215686, 0, 1, 1,
0.6084285, 0.7910078, 1.391396, 0.3254902, 0, 1, 1,
0.6131076, -0.5579294, 3.631485, 0.3333333, 0, 1, 1,
0.6182656, -0.5471284, 2.788004, 0.3372549, 0, 1, 1,
0.6214172, -1.054006, 3.017312, 0.345098, 0, 1, 1,
0.6261659, 0.05627147, 0.8887941, 0.3490196, 0, 1, 1,
0.6278056, 0.8577101, 0.04968374, 0.3568628, 0, 1, 1,
0.6329058, -0.681581, 2.773232, 0.3607843, 0, 1, 1,
0.6329597, -0.5029892, 1.859327, 0.3686275, 0, 1, 1,
0.6371692, 0.233549, 2.400964, 0.372549, 0, 1, 1,
0.6381965, 1.752182, 2.224405, 0.3803922, 0, 1, 1,
0.6424947, -0.1397795, 1.120822, 0.3843137, 0, 1, 1,
0.6476396, -1.144499, 4.569567, 0.3921569, 0, 1, 1,
0.648535, -0.1009099, 2.287859, 0.3960784, 0, 1, 1,
0.6506448, 0.02943867, 0.4860293, 0.4039216, 0, 1, 1,
0.6563201, -0.1539454, 2.23396, 0.4117647, 0, 1, 1,
0.6606356, -0.006516713, -0.1477833, 0.4156863, 0, 1, 1,
0.6652489, 0.7746382, -0.1542287, 0.4235294, 0, 1, 1,
0.6657255, -0.5159237, 1.444335, 0.427451, 0, 1, 1,
0.6657969, -0.4657848, 2.363848, 0.4352941, 0, 1, 1,
0.6719832, -1.088669, 3.20615, 0.4392157, 0, 1, 1,
0.6749262, -1.355488, 3.496315, 0.4470588, 0, 1, 1,
0.6752515, -1.193037, 3.347619, 0.4509804, 0, 1, 1,
0.6841872, -0.3027035, 2.420039, 0.4588235, 0, 1, 1,
0.6880829, 1.41167, 0.3440409, 0.4627451, 0, 1, 1,
0.6893066, -2.217261, 3.564786, 0.4705882, 0, 1, 1,
0.6901945, -0.1919126, 2.585896, 0.4745098, 0, 1, 1,
0.690745, -0.702405, 4.442626, 0.4823529, 0, 1, 1,
0.6940414, -0.2096644, 1.104471, 0.4862745, 0, 1, 1,
0.6963056, 0.0926571, 3.056554, 0.4941176, 0, 1, 1,
0.6995819, -0.809184, 1.372638, 0.5019608, 0, 1, 1,
0.7061585, 0.8711575, 1.806255, 0.5058824, 0, 1, 1,
0.7079529, 0.2695051, -0.09718532, 0.5137255, 0, 1, 1,
0.7089435, 0.3576686, 0.9062973, 0.5176471, 0, 1, 1,
0.7134612, 1.611842, 1.504498, 0.5254902, 0, 1, 1,
0.7156056, -0.3190785, 2.387676, 0.5294118, 0, 1, 1,
0.7164856, 1.80845, -0.3145587, 0.5372549, 0, 1, 1,
0.7185469, -0.1432589, 0.5847508, 0.5411765, 0, 1, 1,
0.7214771, 1.249955, -1.418816, 0.5490196, 0, 1, 1,
0.7260444, 0.8908113, -0.9307575, 0.5529412, 0, 1, 1,
0.7273269, -0.6200153, 1.396027, 0.5607843, 0, 1, 1,
0.7289987, -1.383577, 1.007847, 0.5647059, 0, 1, 1,
0.7297959, -0.2631969, 2.465604, 0.572549, 0, 1, 1,
0.7419058, 0.2254711, 0.1259067, 0.5764706, 0, 1, 1,
0.7421428, -1.009416, 2.115906, 0.5843138, 0, 1, 1,
0.745174, 0.3957802, 0.6196622, 0.5882353, 0, 1, 1,
0.7509814, 0.08364492, 0.2651141, 0.5960785, 0, 1, 1,
0.7526203, -0.87611, 2.759295, 0.6039216, 0, 1, 1,
0.7636688, -0.8519158, 3.378089, 0.6078432, 0, 1, 1,
0.7715815, -0.03827915, -0.05484322, 0.6156863, 0, 1, 1,
0.7721609, -1.250282, 2.883797, 0.6196079, 0, 1, 1,
0.7726091, -1.872585, 1.300611, 0.627451, 0, 1, 1,
0.7764536, -0.7989905, 3.072164, 0.6313726, 0, 1, 1,
0.7814292, -1.723516, 2.095529, 0.6392157, 0, 1, 1,
0.7867425, 1.049861, 0.9284163, 0.6431373, 0, 1, 1,
0.7868041, -1.486795, 1.60427, 0.6509804, 0, 1, 1,
0.7934282, 0.4000044, 1.378387, 0.654902, 0, 1, 1,
0.7949969, -1.2117, 1.043134, 0.6627451, 0, 1, 1,
0.8000915, -0.2981832, 1.751359, 0.6666667, 0, 1, 1,
0.8047505, 0.7141712, 0.7741698, 0.6745098, 0, 1, 1,
0.8050082, 0.08477055, 1.460784, 0.6784314, 0, 1, 1,
0.8055899, 0.3701699, 2.75611, 0.6862745, 0, 1, 1,
0.8072812, -0.1710478, 2.767712, 0.6901961, 0, 1, 1,
0.8142766, -1.496704, 2.298351, 0.6980392, 0, 1, 1,
0.8163633, 1.43238, -0.3175944, 0.7058824, 0, 1, 1,
0.8180353, -0.832967, 2.833636, 0.7098039, 0, 1, 1,
0.8188823, 1.009647, -0.9149159, 0.7176471, 0, 1, 1,
0.8196465, 2.529557, 2.818043, 0.7215686, 0, 1, 1,
0.8249286, 0.345327, 2.045626, 0.7294118, 0, 1, 1,
0.8262788, -0.5865126, 1.069371, 0.7333333, 0, 1, 1,
0.8266101, 0.1303986, 0.6095851, 0.7411765, 0, 1, 1,
0.8291438, -1.597192, 3.913118, 0.7450981, 0, 1, 1,
0.8299029, 0.8273821, 1.497113, 0.7529412, 0, 1, 1,
0.8312047, -1.384322, 2.3072, 0.7568628, 0, 1, 1,
0.8335606, -0.3820593, 3.481148, 0.7647059, 0, 1, 1,
0.8349684, 0.305452, 3.01503, 0.7686275, 0, 1, 1,
0.8379843, 0.5837125, 0.6038617, 0.7764706, 0, 1, 1,
0.8386509, -1.730211, 0.8757678, 0.7803922, 0, 1, 1,
0.8408101, -0.9302398, 1.422669, 0.7882353, 0, 1, 1,
0.8415594, -0.8380567, 0.411548, 0.7921569, 0, 1, 1,
0.8416137, 0.0842815, -0.3362401, 0.8, 0, 1, 1,
0.8434986, 0.9068653, 0.3247263, 0.8078431, 0, 1, 1,
0.8450812, 0.6103411, 0.5553771, 0.8117647, 0, 1, 1,
0.8476905, 0.2513117, 1.804882, 0.8196079, 0, 1, 1,
0.8502758, -0.6181942, 1.48624, 0.8235294, 0, 1, 1,
0.8521022, 0.1927007, 2.56201, 0.8313726, 0, 1, 1,
0.8555802, 1.412404, -0.9407972, 0.8352941, 0, 1, 1,
0.8585286, -1.355495, 2.715653, 0.8431373, 0, 1, 1,
0.8611206, 0.2068824, 2.207921, 0.8470588, 0, 1, 1,
0.8617008, -1.552984, 3.036864, 0.854902, 0, 1, 1,
0.863465, 1.607943, -0.6395365, 0.8588235, 0, 1, 1,
0.8679335, -0.8317724, 1.469944, 0.8666667, 0, 1, 1,
0.8682969, 0.4339631, 2.198765, 0.8705882, 0, 1, 1,
0.8719627, -0.4928347, 3.529213, 0.8784314, 0, 1, 1,
0.8726678, -0.5118319, 2.26668, 0.8823529, 0, 1, 1,
0.8731744, -0.655502, 3.304749, 0.8901961, 0, 1, 1,
0.8737937, -0.8719535, 0.7926444, 0.8941177, 0, 1, 1,
0.881532, 0.9237561, -0.1576268, 0.9019608, 0, 1, 1,
0.8867929, -1.218047, 1.639736, 0.9098039, 0, 1, 1,
0.8872799, -1.177291, 3.270398, 0.9137255, 0, 1, 1,
0.8956279, -2.363812, 3.195713, 0.9215686, 0, 1, 1,
0.897474, 1.831581, 2.014011, 0.9254902, 0, 1, 1,
0.8982708, -0.6930385, 1.354097, 0.9333333, 0, 1, 1,
0.9002079, -1.051489, 3.041288, 0.9372549, 0, 1, 1,
0.9008924, 0.3417697, 2.962249, 0.945098, 0, 1, 1,
0.9070309, -0.2187742, 1.364942, 0.9490196, 0, 1, 1,
0.9096228, 0.399708, 1.46447, 0.9568627, 0, 1, 1,
0.9129651, -2.130158, 4.258378, 0.9607843, 0, 1, 1,
0.917875, 0.3804845, -0.6664977, 0.9686275, 0, 1, 1,
0.9224986, -0.1325365, 1.015984, 0.972549, 0, 1, 1,
0.9314994, -0.1951008, 1.682649, 0.9803922, 0, 1, 1,
0.9369119, 0.1389187, 0.8613588, 0.9843137, 0, 1, 1,
0.9451804, 1.811402, 0.9196379, 0.9921569, 0, 1, 1,
0.9478291, -0.5231772, 1.402614, 0.9960784, 0, 1, 1,
0.9485362, 0.4792591, 2.131268, 1, 0, 0.9960784, 1,
0.9552685, -0.5592545, 1.071728, 1, 0, 0.9882353, 1,
0.9573769, 0.4087335, 0.4361308, 1, 0, 0.9843137, 1,
0.9596152, -1.458038, 2.76627, 1, 0, 0.9764706, 1,
0.9670808, 0.2323098, 0.2431971, 1, 0, 0.972549, 1,
0.9684711, 0.2291406, 2.156192, 1, 0, 0.9647059, 1,
0.9716162, 1.492073, 1.21502, 1, 0, 0.9607843, 1,
0.9752584, -0.3836016, 2.653222, 1, 0, 0.9529412, 1,
0.9771033, 1.540938, -0.6097773, 1, 0, 0.9490196, 1,
0.9788297, 1.117705, 0.881347, 1, 0, 0.9411765, 1,
0.982164, -1.146385, 1.753037, 1, 0, 0.9372549, 1,
0.9836571, 0.2046717, 0.4227271, 1, 0, 0.9294118, 1,
0.9928551, 1.361769, -0.2538057, 1, 0, 0.9254902, 1,
0.9931962, 0.4886509, 1.221732, 1, 0, 0.9176471, 1,
0.9983315, -0.5112035, 3.627099, 1, 0, 0.9137255, 1,
0.998855, -1.020411, 1.735279, 1, 0, 0.9058824, 1,
1.000727, -1.500421, 1.637544, 1, 0, 0.9019608, 1,
1.002966, -1.144887, 2.445978, 1, 0, 0.8941177, 1,
1.011221, -0.5909595, 3.188946, 1, 0, 0.8862745, 1,
1.011472, -0.8133159, 2.883646, 1, 0, 0.8823529, 1,
1.012988, 0.9162125, 1.511876, 1, 0, 0.8745098, 1,
1.021587, -1.442845, 2.220898, 1, 0, 0.8705882, 1,
1.028816, -1.155453, 2.313529, 1, 0, 0.8627451, 1,
1.029135, 1.185728, 0.6685072, 1, 0, 0.8588235, 1,
1.029229, 0.6499759, 1.182382, 1, 0, 0.8509804, 1,
1.033957, -1.251806, 4.30799, 1, 0, 0.8470588, 1,
1.053292, 0.5973963, -0.03799644, 1, 0, 0.8392157, 1,
1.058565, -0.5141736, 1.669306, 1, 0, 0.8352941, 1,
1.059299, 0.6354609, 1.760947, 1, 0, 0.827451, 1,
1.068152, -1.695291, 3.526187, 1, 0, 0.8235294, 1,
1.068899, 0.7017577, 2.105272, 1, 0, 0.8156863, 1,
1.070336, -0.2660677, 2.346175, 1, 0, 0.8117647, 1,
1.075839, -0.5187774, 1.23593, 1, 0, 0.8039216, 1,
1.077243, -0.4141888, 1.123719, 1, 0, 0.7960784, 1,
1.084735, -0.1403629, 2.878587, 1, 0, 0.7921569, 1,
1.087599, 0.6783349, 0.6905752, 1, 0, 0.7843137, 1,
1.091226, 1.088363, 1.243409, 1, 0, 0.7803922, 1,
1.095163, -0.146439, 2.248585, 1, 0, 0.772549, 1,
1.109837, -0.6987178, 2.47223, 1, 0, 0.7686275, 1,
1.11056, -1.408171, 2.716059, 1, 0, 0.7607843, 1,
1.110638, 0.8443736, 1.000567, 1, 0, 0.7568628, 1,
1.114315, 1.000282, 1.347746, 1, 0, 0.7490196, 1,
1.126341, 1.242741, 2.188899, 1, 0, 0.7450981, 1,
1.131245, -0.42894, 1.645618, 1, 0, 0.7372549, 1,
1.149013, 1.084785, 0.9516208, 1, 0, 0.7333333, 1,
1.150722, 0.5656363, 0.07556327, 1, 0, 0.7254902, 1,
1.151917, 0.2028115, 0.9368498, 1, 0, 0.7215686, 1,
1.158057, 1.579731, -0.8799517, 1, 0, 0.7137255, 1,
1.158125, 1.529241, 3.156602, 1, 0, 0.7098039, 1,
1.159331, 0.4231642, -0.3333023, 1, 0, 0.7019608, 1,
1.16219, -0.1350431, 0.5572736, 1, 0, 0.6941177, 1,
1.166139, -2.908454, 3.422168, 1, 0, 0.6901961, 1,
1.178973, 0.9737736, 0.7523527, 1, 0, 0.682353, 1,
1.183539, 1.349869, -0.2537207, 1, 0, 0.6784314, 1,
1.184732, 0.3373107, 1.542244, 1, 0, 0.6705883, 1,
1.185228, 0.4010972, 1.69738, 1, 0, 0.6666667, 1,
1.186555, 1.343042, 2.439949, 1, 0, 0.6588235, 1,
1.192621, -1.180637, 3.127574, 1, 0, 0.654902, 1,
1.193961, 1.19414, 0.7824613, 1, 0, 0.6470588, 1,
1.197641, -0.241241, 1.144456, 1, 0, 0.6431373, 1,
1.219846, -0.1680377, 1.452376, 1, 0, 0.6352941, 1,
1.219903, -0.1610022, 1.441668, 1, 0, 0.6313726, 1,
1.22689, -0.8094701, 1.784286, 1, 0, 0.6235294, 1,
1.231729, -0.1995002, 1.342062, 1, 0, 0.6196079, 1,
1.233626, -2.005626, 0.4373735, 1, 0, 0.6117647, 1,
1.23526, -1.007685, 3.579426, 1, 0, 0.6078432, 1,
1.24115, 1.077392, 1.763775, 1, 0, 0.6, 1,
1.242716, -1.002616, 3.647091, 1, 0, 0.5921569, 1,
1.257025, 0.003760402, 1.0725, 1, 0, 0.5882353, 1,
1.263556, -0.3277797, 1.95588, 1, 0, 0.5803922, 1,
1.266584, -0.2370908, 1.54811, 1, 0, 0.5764706, 1,
1.273633, 0.2408191, 3.769284, 1, 0, 0.5686275, 1,
1.286144, -0.2883959, 2.632449, 1, 0, 0.5647059, 1,
1.289979, 0.3441621, 2.23264, 1, 0, 0.5568628, 1,
1.293762, 0.6434538, 1.260967, 1, 0, 0.5529412, 1,
1.298607, -1.005083, 2.402495, 1, 0, 0.5450981, 1,
1.302394, 1.097695, 0.3848858, 1, 0, 0.5411765, 1,
1.303471, 0.7185068, 0.936148, 1, 0, 0.5333334, 1,
1.304529, -0.05422376, 2.080681, 1, 0, 0.5294118, 1,
1.308945, 0.8761881, 1.464092, 1, 0, 0.5215687, 1,
1.311194, -0.8283664, 2.315879, 1, 0, 0.5176471, 1,
1.313287, 1.976332, -0.300063, 1, 0, 0.509804, 1,
1.344867, -0.8109393, 1.073957, 1, 0, 0.5058824, 1,
1.345313, -1.049221, 1.09769, 1, 0, 0.4980392, 1,
1.357941, 0.06965253, 1.74528, 1, 0, 0.4901961, 1,
1.361063, 0.1105697, 1.8416, 1, 0, 0.4862745, 1,
1.366617, -0.5937644, -0.483332, 1, 0, 0.4784314, 1,
1.368203, -0.8501022, 2.952265, 1, 0, 0.4745098, 1,
1.385206, -0.3577682, 1.342116, 1, 0, 0.4666667, 1,
1.386523, 0.1403912, 3.456801, 1, 0, 0.4627451, 1,
1.388545, 1.11255, 1.56411, 1, 0, 0.454902, 1,
1.393741, 1.580287, 1.677626, 1, 0, 0.4509804, 1,
1.395094, 1.248155, 0.4886183, 1, 0, 0.4431373, 1,
1.406016, 1.687536, 0.5579475, 1, 0, 0.4392157, 1,
1.417068, 0.01945955, 1.604389, 1, 0, 0.4313726, 1,
1.417806, -1.225908, 3.32486, 1, 0, 0.427451, 1,
1.418695, 0.08804473, -0.01470638, 1, 0, 0.4196078, 1,
1.43677, -1.135049, 1.435937, 1, 0, 0.4156863, 1,
1.43878, 2.561845, -0.6744719, 1, 0, 0.4078431, 1,
1.439374, 0.2779324, 0.02388068, 1, 0, 0.4039216, 1,
1.441222, -0.5504961, 1.954407, 1, 0, 0.3960784, 1,
1.452803, -0.3048129, 1.147455, 1, 0, 0.3882353, 1,
1.455638, -0.2595447, 2.338295, 1, 0, 0.3843137, 1,
1.457911, 1.592284, 1.476324, 1, 0, 0.3764706, 1,
1.464977, 0.1775777, 1.248135, 1, 0, 0.372549, 1,
1.468848, 0.07747798, 0.5788937, 1, 0, 0.3647059, 1,
1.487543, -1.255704, 1.396331, 1, 0, 0.3607843, 1,
1.495202, -1.727405, 1.970182, 1, 0, 0.3529412, 1,
1.502823, 0.170791, 1.015627, 1, 0, 0.3490196, 1,
1.509243, -1.42374, 3.396737, 1, 0, 0.3411765, 1,
1.513552, 0.9955173, -1.456049, 1, 0, 0.3372549, 1,
1.513581, -0.09757352, 2.537257, 1, 0, 0.3294118, 1,
1.527262, 1.862641, -0.2226495, 1, 0, 0.3254902, 1,
1.532453, 0.5887434, 3.357579, 1, 0, 0.3176471, 1,
1.534508, -1.158336, 1.336076, 1, 0, 0.3137255, 1,
1.546053, 0.1476119, 2.758437, 1, 0, 0.3058824, 1,
1.546904, 0.2805065, 1.711126, 1, 0, 0.2980392, 1,
1.547353, 0.0699417, 2.999563, 1, 0, 0.2941177, 1,
1.547571, 0.333124, 1.485645, 1, 0, 0.2862745, 1,
1.56942, 2.015086, -1.130561, 1, 0, 0.282353, 1,
1.593912, -0.2770945, 1.191282, 1, 0, 0.2745098, 1,
1.603533, -0.0853444, 1.26316, 1, 0, 0.2705882, 1,
1.622733, -1.427703, 0.7871171, 1, 0, 0.2627451, 1,
1.62915, 0.02437121, 1.491987, 1, 0, 0.2588235, 1,
1.644353, -1.413792, 3.655167, 1, 0, 0.2509804, 1,
1.650053, 0.9315326, 1.061823, 1, 0, 0.2470588, 1,
1.655933, 0.1078847, 1.174217, 1, 0, 0.2392157, 1,
1.658758, -0.03188526, 1.323216, 1, 0, 0.2352941, 1,
1.66065, 1.355813, -0.01627479, 1, 0, 0.227451, 1,
1.672482, 0.9010108, 0.35913, 1, 0, 0.2235294, 1,
1.705212, 0.2187137, 1.560308, 1, 0, 0.2156863, 1,
1.706054, -0.004980317, 3.132569, 1, 0, 0.2117647, 1,
1.758074, -0.9891723, 1.695014, 1, 0, 0.2039216, 1,
1.762038, 0.4592713, 1.753042, 1, 0, 0.1960784, 1,
1.789902, -0.3618989, 1.053216, 1, 0, 0.1921569, 1,
1.833324, 1.088532, 0.3978084, 1, 0, 0.1843137, 1,
1.846228, 0.06470425, 1.409326, 1, 0, 0.1803922, 1,
1.846248, 0.980929, 1.255341, 1, 0, 0.172549, 1,
1.85444, -0.8800737, 2.125875, 1, 0, 0.1686275, 1,
1.866446, 0.1940615, 2.182181, 1, 0, 0.1607843, 1,
1.86982, -0.1782073, 0.1898653, 1, 0, 0.1568628, 1,
1.884995, -1.041165, 0.2845446, 1, 0, 0.1490196, 1,
1.904667, -0.5871825, 1.222177, 1, 0, 0.145098, 1,
1.929617, -0.05679579, 1.332818, 1, 0, 0.1372549, 1,
1.944134, -2.678267, 2.916509, 1, 0, 0.1333333, 1,
1.972048, 0.1093524, 2.145541, 1, 0, 0.1254902, 1,
1.979367, 0.2374475, 1.92995, 1, 0, 0.1215686, 1,
2.078394, 0.4658353, 1.443488, 1, 0, 0.1137255, 1,
2.086393, -0.9379853, 1.915553, 1, 0, 0.1098039, 1,
2.094301, -1.401038, 2.348818, 1, 0, 0.1019608, 1,
2.144698, 0.3441889, 1.936399, 1, 0, 0.09411765, 1,
2.15709, -0.6016247, 2.555801, 1, 0, 0.09019608, 1,
2.21312, 0.1258748, 2.208469, 1, 0, 0.08235294, 1,
2.216125, 0.1563093, 1.166976, 1, 0, 0.07843138, 1,
2.24481, -0.1827047, 2.348004, 1, 0, 0.07058824, 1,
2.277441, 0.9413589, 0.006618076, 1, 0, 0.06666667, 1,
2.311982, -0.6601984, 2.579176, 1, 0, 0.05882353, 1,
2.315193, 0.7202397, -0.8375822, 1, 0, 0.05490196, 1,
2.430638, -0.312396, 1.528365, 1, 0, 0.04705882, 1,
2.503313, 1.744769, 1.920535, 1, 0, 0.04313726, 1,
2.619096, -0.6492881, 0.6120048, 1, 0, 0.03529412, 1,
2.664722, 0.8090326, 0.6005395, 1, 0, 0.03137255, 1,
2.803106, -1.881435, 2.805514, 1, 0, 0.02352941, 1,
3.096589, 0.2339714, 1.623429, 1, 0, 0.01960784, 1,
3.279702, -0.6684647, 3.984799, 1, 0, 0.01176471, 1,
3.665476, -0.7944615, 3.36336, 1, 0, 0.007843138, 1
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
0.2874312, -3.912162, -7.147637, 0, -0.5, 0.5, 0.5,
0.2874312, -3.912162, -7.147637, 1, -0.5, 0.5, 0.5,
0.2874312, -3.912162, -7.147637, 1, 1.5, 0.5, 0.5,
0.2874312, -3.912162, -7.147637, 0, 1.5, 0.5, 0.5
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
-4.235771, 0.05233562, -7.147637, 0, -0.5, 0.5, 0.5,
-4.235771, 0.05233562, -7.147637, 1, -0.5, 0.5, 0.5,
-4.235771, 0.05233562, -7.147637, 1, 1.5, 0.5, 0.5,
-4.235771, 0.05233562, -7.147637, 0, 1.5, 0.5, 0.5
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
-4.235771, -3.912162, 0.09373522, 0, -0.5, 0.5, 0.5,
-4.235771, -3.912162, 0.09373522, 1, -0.5, 0.5, 0.5,
-4.235771, -3.912162, 0.09373522, 1, 1.5, 0.5, 0.5,
-4.235771, -3.912162, 0.09373522, 0, 1.5, 0.5, 0.5
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
-3, -2.997278, -5.476552,
3, -2.997278, -5.476552,
-3, -2.997278, -5.476552,
-3, -3.149759, -5.755066,
-2, -2.997278, -5.476552,
-2, -3.149759, -5.755066,
-1, -2.997278, -5.476552,
-1, -3.149759, -5.755066,
0, -2.997278, -5.476552,
0, -3.149759, -5.755066,
1, -2.997278, -5.476552,
1, -3.149759, -5.755066,
2, -2.997278, -5.476552,
2, -3.149759, -5.755066,
3, -2.997278, -5.476552,
3, -3.149759, -5.755066
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
-3, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
-3, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
-3, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
-3, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
-2, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
-2, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
-2, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
-2, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
-1, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
-1, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
-1, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
-1, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
0, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
0, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
0, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
0, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
1, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
1, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
1, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
1, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
2, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
2, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
2, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
2, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5,
3, -3.45472, -6.312094, 0, -0.5, 0.5, 0.5,
3, -3.45472, -6.312094, 1, -0.5, 0.5, 0.5,
3, -3.45472, -6.312094, 1, 1.5, 0.5, 0.5,
3, -3.45472, -6.312094, 0, 1.5, 0.5, 0.5
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
-3.191955, -2, -5.476552,
-3.191955, 3, -5.476552,
-3.191955, -2, -5.476552,
-3.365924, -2, -5.755066,
-3.191955, -1, -5.476552,
-3.365924, -1, -5.755066,
-3.191955, 0, -5.476552,
-3.365924, 0, -5.755066,
-3.191955, 1, -5.476552,
-3.365924, 1, -5.755066,
-3.191955, 2, -5.476552,
-3.365924, 2, -5.755066,
-3.191955, 3, -5.476552,
-3.365924, 3, -5.755066
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
-3.713863, -2, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, -2, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, -2, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, -2, -6.312094, 0, 1.5, 0.5, 0.5,
-3.713863, -1, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, -1, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, -1, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, -1, -6.312094, 0, 1.5, 0.5, 0.5,
-3.713863, 0, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, 0, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, 0, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, 0, -6.312094, 0, 1.5, 0.5, 0.5,
-3.713863, 1, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, 1, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, 1, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, 1, -6.312094, 0, 1.5, 0.5, 0.5,
-3.713863, 2, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, 2, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, 2, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, 2, -6.312094, 0, 1.5, 0.5, 0.5,
-3.713863, 3, -6.312094, 0, -0.5, 0.5, 0.5,
-3.713863, 3, -6.312094, 1, -0.5, 0.5, 0.5,
-3.713863, 3, -6.312094, 1, 1.5, 0.5, 0.5,
-3.713863, 3, -6.312094, 0, 1.5, 0.5, 0.5
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
-3.191955, -2.997278, -4,
-3.191955, -2.997278, 4,
-3.191955, -2.997278, -4,
-3.365924, -3.149759, -4,
-3.191955, -2.997278, -2,
-3.365924, -3.149759, -2,
-3.191955, -2.997278, 0,
-3.365924, -3.149759, 0,
-3.191955, -2.997278, 2,
-3.365924, -3.149759, 2,
-3.191955, -2.997278, 4,
-3.365924, -3.149759, 4
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
-3.713863, -3.45472, -4, 0, -0.5, 0.5, 0.5,
-3.713863, -3.45472, -4, 1, -0.5, 0.5, 0.5,
-3.713863, -3.45472, -4, 1, 1.5, 0.5, 0.5,
-3.713863, -3.45472, -4, 0, 1.5, 0.5, 0.5,
-3.713863, -3.45472, -2, 0, -0.5, 0.5, 0.5,
-3.713863, -3.45472, -2, 1, -0.5, 0.5, 0.5,
-3.713863, -3.45472, -2, 1, 1.5, 0.5, 0.5,
-3.713863, -3.45472, -2, 0, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 0, 0, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 0, 1, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 0, 1, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 0, 0, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 2, 0, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 2, 1, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 2, 1, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 2, 0, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 4, 0, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 4, 1, -0.5, 0.5, 0.5,
-3.713863, -3.45472, 4, 1, 1.5, 0.5, 0.5,
-3.713863, -3.45472, 4, 0, 1.5, 0.5, 0.5
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
-3.191955, -2.997278, -5.476552,
-3.191955, 3.101949, -5.476552,
-3.191955, -2.997278, 5.664022,
-3.191955, 3.101949, 5.664022,
-3.191955, -2.997278, -5.476552,
-3.191955, -2.997278, 5.664022,
-3.191955, 3.101949, -5.476552,
-3.191955, 3.101949, 5.664022,
-3.191955, -2.997278, -5.476552,
3.766817, -2.997278, -5.476552,
-3.191955, -2.997278, 5.664022,
3.766817, -2.997278, 5.664022,
-3.191955, 3.101949, -5.476552,
3.766817, 3.101949, -5.476552,
-3.191955, 3.101949, 5.664022,
3.766817, 3.101949, 5.664022,
3.766817, -2.997278, -5.476552,
3.766817, 3.101949, -5.476552,
3.766817, -2.997278, 5.664022,
3.766817, 3.101949, 5.664022,
3.766817, -2.997278, -5.476552,
3.766817, -2.997278, 5.664022,
3.766817, 3.101949, -5.476552,
3.766817, 3.101949, 5.664022
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
var radius = 7.733275;
var distance = 34.40622;
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
mvMatrix.translate( -0.2874312, -0.05233562, -0.09373522 );
mvMatrix.scale( 1.201558, 1.37089, 0.750533 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40622);
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
1-chlorobut-1-ene<-read.table("1-chlorobut-1-ene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-chlorobut-1-ene$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorobut' not found
```

```r
y<-1-chlorobut-1-ene$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorobut' not found
```

```r
z<-1-chlorobut-1-ene$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorobut' not found
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
-3.090613, -0.1801048, -0.5425843, 0, 0, 1, 1, 1,
-3.049171, 0.1399916, -1.982212, 1, 0, 0, 1, 1,
-2.802127, 0.134386, -0.325372, 1, 0, 0, 1, 1,
-2.747791, 0.8513327, -0.7834842, 1, 0, 0, 1, 1,
-2.594425, 0.4244041, -2.356806, 1, 0, 0, 1, 1,
-2.524537, -0.04590115, -1.390373, 1, 0, 0, 1, 1,
-2.504236, 0.178498, -1.697326, 0, 0, 0, 1, 1,
-2.498893, 1.246091, -1.011689, 0, 0, 0, 1, 1,
-2.37692, 2.338234, -3.360858, 0, 0, 0, 1, 1,
-2.372468, -2.505505, -4.478938, 0, 0, 0, 1, 1,
-2.364849, -0.5274749, -2.030984, 0, 0, 0, 1, 1,
-2.364635, -0.7880473, -1.931729, 0, 0, 0, 1, 1,
-2.332907, 0.7468647, -1.984605, 0, 0, 0, 1, 1,
-2.313836, 0.8171777, -1.542556, 1, 1, 1, 1, 1,
-2.287265, -1.591022, -2.383035, 1, 1, 1, 1, 1,
-2.265805, -1.88678, -3.396389, 1, 1, 1, 1, 1,
-2.256603, -0.5020264, -0.8048302, 1, 1, 1, 1, 1,
-2.252324, -1.131651, -0.3238711, 1, 1, 1, 1, 1,
-2.1693, -0.2522363, -3.292932, 1, 1, 1, 1, 1,
-2.158303, -0.2404957, -1.463692, 1, 1, 1, 1, 1,
-2.126128, 1.258737, -1.825816, 1, 1, 1, 1, 1,
-2.115335, 0.7021971, -0.2351355, 1, 1, 1, 1, 1,
-2.107995, -0.9283547, -1.882064, 1, 1, 1, 1, 1,
-2.09782, 0.4404664, -1.176045, 1, 1, 1, 1, 1,
-2.025112, -0.7041138, -1.31215, 1, 1, 1, 1, 1,
-2.01854, -0.2940802, -1.046175, 1, 1, 1, 1, 1,
-1.983974, 0.1270751, -1.944186, 1, 1, 1, 1, 1,
-1.880382, -0.7644883, -1.913244, 1, 1, 1, 1, 1,
-1.873406, -1.414802, -2.050858, 0, 0, 1, 1, 1,
-1.847032, -1.028693, -1.498043, 1, 0, 0, 1, 1,
-1.845903, -1.215475, -1.601449, 1, 0, 0, 1, 1,
-1.838249, -0.6792769, -2.36885, 1, 0, 0, 1, 1,
-1.823397, 0.4768366, -2.791158, 1, 0, 0, 1, 1,
-1.784053, 0.8069625, -1.631108, 1, 0, 0, 1, 1,
-1.772754, 0.3474458, -1.633967, 0, 0, 0, 1, 1,
-1.771396, 1.344137, -0.9932964, 0, 0, 0, 1, 1,
-1.769824, 0.5089462, -3.339219, 0, 0, 0, 1, 1,
-1.759866, -0.5845007, -1.201799, 0, 0, 0, 1, 1,
-1.743501, 0.2771997, -0.2879165, 0, 0, 0, 1, 1,
-1.737123, 0.9845031, -1.231199, 0, 0, 0, 1, 1,
-1.724341, -1.030723, -0.1361534, 0, 0, 0, 1, 1,
-1.718364, 0.3745044, -0.8470133, 1, 1, 1, 1, 1,
-1.705553, 0.7704771, -1.488556, 1, 1, 1, 1, 1,
-1.700224, -0.05069729, -1.690544, 1, 1, 1, 1, 1,
-1.695616, -1.562822, -2.581591, 1, 1, 1, 1, 1,
-1.683297, -1.377534, -1.360636, 1, 1, 1, 1, 1,
-1.668241, -0.4698712, -2.72738, 1, 1, 1, 1, 1,
-1.650029, -1.94966, -1.024538, 1, 1, 1, 1, 1,
-1.635636, 0.5669411, -1.486235, 1, 1, 1, 1, 1,
-1.630654, -1.528492, -2.490314, 1, 1, 1, 1, 1,
-1.617701, 0.2318608, -2.289629, 1, 1, 1, 1, 1,
-1.609903, -0.1241212, 1.011528, 1, 1, 1, 1, 1,
-1.602034, 0.006352044, 0.2179035, 1, 1, 1, 1, 1,
-1.601903, -0.2927938, -1.238512, 1, 1, 1, 1, 1,
-1.591444, -1.285494, -2.260807, 1, 1, 1, 1, 1,
-1.577152, -0.810774, -1.760391, 1, 1, 1, 1, 1,
-1.576219, 0.1167173, -2.150533, 0, 0, 1, 1, 1,
-1.574622, -1.26232, -1.128003, 1, 0, 0, 1, 1,
-1.560991, 1.404578, -2.924782, 1, 0, 0, 1, 1,
-1.551567, -1.178017, -3.116649, 1, 0, 0, 1, 1,
-1.550315, -1.013216, -2.794655, 1, 0, 0, 1, 1,
-1.54822, 0.3989592, -0.3483408, 1, 0, 0, 1, 1,
-1.544631, -0.07095427, -2.196437, 0, 0, 0, 1, 1,
-1.542896, 1.117666, -1.161856, 0, 0, 0, 1, 1,
-1.540895, 0.1640269, -2.640207, 0, 0, 0, 1, 1,
-1.538686, -1.408396, -0.5108849, 0, 0, 0, 1, 1,
-1.513209, 1.947655, -1.290078, 0, 0, 0, 1, 1,
-1.512988, -0.9510512, -2.647327, 0, 0, 0, 1, 1,
-1.503272, 2.26991, -0.09039715, 0, 0, 0, 1, 1,
-1.485216, -0.1478929, -2.058014, 1, 1, 1, 1, 1,
-1.482648, -0.9155957, -1.66773, 1, 1, 1, 1, 1,
-1.471767, -1.154154, -4.104812, 1, 1, 1, 1, 1,
-1.470054, 1.742377, -0.3634312, 1, 1, 1, 1, 1,
-1.422367, 0.05802344, -1.869734, 1, 1, 1, 1, 1,
-1.420422, 0.4300441, -1.582308, 1, 1, 1, 1, 1,
-1.418422, 1.431376, -0.8322311, 1, 1, 1, 1, 1,
-1.39546, 0.289726, -1.229147, 1, 1, 1, 1, 1,
-1.390408, 0.4195279, -0.3239521, 1, 1, 1, 1, 1,
-1.384522, -1.834832, -4.034106, 1, 1, 1, 1, 1,
-1.380596, -0.02739713, -2.151472, 1, 1, 1, 1, 1,
-1.36193, 0.9074267, -0.2179316, 1, 1, 1, 1, 1,
-1.356661, -1.159535, -2.687823, 1, 1, 1, 1, 1,
-1.341225, 0.5143658, -0.9363464, 1, 1, 1, 1, 1,
-1.336645, 0.7369161, -1.50803, 1, 1, 1, 1, 1,
-1.331736, -0.1833428, -0.3188233, 0, 0, 1, 1, 1,
-1.31973, -0.9787381, -2.143861, 1, 0, 0, 1, 1,
-1.302168, -0.1594338, -0.06831247, 1, 0, 0, 1, 1,
-1.30155, 0.6676899, -1.994511, 1, 0, 0, 1, 1,
-1.284999, 0.9107401, -1.386937, 1, 0, 0, 1, 1,
-1.281984, -0.1329604, -1.261622, 1, 0, 0, 1, 1,
-1.280708, -0.6838115, -1.177276, 0, 0, 0, 1, 1,
-1.267077, -0.07419664, -1.467168, 0, 0, 0, 1, 1,
-1.26593, 0.8532131, -0.1906758, 0, 0, 0, 1, 1,
-1.263055, 1.486194, 0.4299024, 0, 0, 0, 1, 1,
-1.255299, 2.068321, -2.28645, 0, 0, 0, 1, 1,
-1.245838, 0.711521, -0.6335659, 0, 0, 0, 1, 1,
-1.239891, -0.3752267, -2.329909, 0, 0, 0, 1, 1,
-1.225938, -2.016224, -3.2806, 1, 1, 1, 1, 1,
-1.222972, 0.06672663, -0.963501, 1, 1, 1, 1, 1,
-1.221177, 0.1294136, -3.097475, 1, 1, 1, 1, 1,
-1.217676, -0.5941564, -2.657673, 1, 1, 1, 1, 1,
-1.213273, 0.6908054, -0.3679583, 1, 1, 1, 1, 1,
-1.209535, -0.1606513, 0.09200202, 1, 1, 1, 1, 1,
-1.208046, 0.421425, -0.5870786, 1, 1, 1, 1, 1,
-1.196692, 1.466507, -0.2426551, 1, 1, 1, 1, 1,
-1.186295, -1.198774, -4.544061, 1, 1, 1, 1, 1,
-1.182993, 0.4612468, -1.416735, 1, 1, 1, 1, 1,
-1.180407, 0.02008219, -1.558729, 1, 1, 1, 1, 1,
-1.173118, -0.4839577, -4.434573, 1, 1, 1, 1, 1,
-1.172469, -2.083302, -4.331378, 1, 1, 1, 1, 1,
-1.169811, -0.4779869, -3.718874, 1, 1, 1, 1, 1,
-1.168067, 0.5646245, -1.599951, 1, 1, 1, 1, 1,
-1.161702, 0.7903793, -2.812511, 0, 0, 1, 1, 1,
-1.160819, 1.667502, -1.819475, 1, 0, 0, 1, 1,
-1.157364, -0.8796617, -1.669433, 1, 0, 0, 1, 1,
-1.15575, 0.4646858, -1.062604, 1, 0, 0, 1, 1,
-1.155052, 1.541686, 1.154237, 1, 0, 0, 1, 1,
-1.152574, -0.006373429, -0.2352463, 1, 0, 0, 1, 1,
-1.152152, 0.2835349, -2.075813, 0, 0, 0, 1, 1,
-1.142283, -0.3623365, -3.086108, 0, 0, 0, 1, 1,
-1.141001, 0.5673076, -1.061617, 0, 0, 0, 1, 1,
-1.139958, 0.08628876, -0.4451843, 0, 0, 0, 1, 1,
-1.136654, 0.2998874, 0.1869738, 0, 0, 0, 1, 1,
-1.123408, 0.4223575, -2.265553, 0, 0, 0, 1, 1,
-1.120978, -0.5669182, -0.5180865, 0, 0, 0, 1, 1,
-1.119513, 0.003264969, -1.997787, 1, 1, 1, 1, 1,
-1.112162, -0.2326403, -1.177652, 1, 1, 1, 1, 1,
-1.103523, -0.6148785, -2.183905, 1, 1, 1, 1, 1,
-1.10225, 0.1138474, -2.693913, 1, 1, 1, 1, 1,
-1.100736, 0.9817609, -2.633367, 1, 1, 1, 1, 1,
-1.098775, -0.05608815, -1.972462, 1, 1, 1, 1, 1,
-1.098288, 0.3382814, 0.1106361, 1, 1, 1, 1, 1,
-1.090954, 1.255909, -0.3909418, 1, 1, 1, 1, 1,
-1.08453, -0.3964891, -1.461721, 1, 1, 1, 1, 1,
-1.080045, 0.6937426, -1.433824, 1, 1, 1, 1, 1,
-1.072192, -0.1326886, -1.166744, 1, 1, 1, 1, 1,
-1.070282, 0.7824739, -0.6808344, 1, 1, 1, 1, 1,
-1.066016, -0.2909357, -1.77612, 1, 1, 1, 1, 1,
-1.065096, -0.5301347, -3.695373, 1, 1, 1, 1, 1,
-1.06112, 0.07969101, -2.258216, 1, 1, 1, 1, 1,
-1.059506, -1.660557, -2.010316, 0, 0, 1, 1, 1,
-1.058756, -0.1657073, -1.988453, 1, 0, 0, 1, 1,
-1.050162, 0.7658812, -0.9718722, 1, 0, 0, 1, 1,
-1.049952, -0.9260528, -1.150152, 1, 0, 0, 1, 1,
-1.045293, -0.7605511, 0.2568612, 1, 0, 0, 1, 1,
-1.044335, -0.5659289, -0.9556645, 1, 0, 0, 1, 1,
-1.042703, 0.49278, -0.7817042, 0, 0, 0, 1, 1,
-1.036979, -0.6765153, -0.5629563, 0, 0, 0, 1, 1,
-1.0338, -1.871296, -1.230725, 0, 0, 0, 1, 1,
-1.031329, 0.6534804, -1.135069, 0, 0, 0, 1, 1,
-1.029272, -1.999868, -2.756014, 0, 0, 0, 1, 1,
-1.026119, -0.1400681, -1.926383, 0, 0, 0, 1, 1,
-1.023036, -0.4689222, -1.740671, 0, 0, 0, 1, 1,
-1.014691, -0.5205412, -3.476098, 1, 1, 1, 1, 1,
-1.011931, 0.8802058, -0.5168934, 1, 1, 1, 1, 1,
-1.011655, -0.5582284, -1.686453, 1, 1, 1, 1, 1,
-1.009301, 0.3895634, -2.709149, 1, 1, 1, 1, 1,
-1.005436, 0.6845494, -0.83062, 1, 1, 1, 1, 1,
-0.9908004, -0.4609258, 0.5795146, 1, 1, 1, 1, 1,
-0.9879651, -0.9038774, -1.941054, 1, 1, 1, 1, 1,
-0.9829854, -0.6330563, -1.989254, 1, 1, 1, 1, 1,
-0.9707508, 0.3185687, -2.794549, 1, 1, 1, 1, 1,
-0.9671311, 0.3882839, -1.580091, 1, 1, 1, 1, 1,
-0.9670093, 0.5739639, -1.668851, 1, 1, 1, 1, 1,
-0.9625245, -0.5763251, -0.8208145, 1, 1, 1, 1, 1,
-0.9595029, 0.1546301, -1.748946, 1, 1, 1, 1, 1,
-0.9532036, 0.7968197, 0.6831267, 1, 1, 1, 1, 1,
-0.947107, -0.2586234, -3.816292, 1, 1, 1, 1, 1,
-0.9427658, 0.1279615, -1.024723, 0, 0, 1, 1, 1,
-0.9411368, -0.1815125, -4.021431, 1, 0, 0, 1, 1,
-0.9372039, 0.7729132, -1.181231, 1, 0, 0, 1, 1,
-0.9218693, -1.374414, -1.35006, 1, 0, 0, 1, 1,
-0.9201479, -1.861837, -2.155885, 1, 0, 0, 1, 1,
-0.9194723, 2.159072, -1.126745, 1, 0, 0, 1, 1,
-0.9081602, -0.9059644, -2.142876, 0, 0, 0, 1, 1,
-0.9029033, -2.488198, -2.736017, 0, 0, 0, 1, 1,
-0.9016805, 0.170117, -2.187164, 0, 0, 0, 1, 1,
-0.9011403, -0.4720562, -1.138201, 0, 0, 0, 1, 1,
-0.9006655, -0.6672416, -3.056019, 0, 0, 0, 1, 1,
-0.8955271, -0.02749755, -1.6165, 0, 0, 0, 1, 1,
-0.8913041, -0.2411026, -2.264665, 0, 0, 0, 1, 1,
-0.8912925, -0.8182493, -1.403553, 1, 1, 1, 1, 1,
-0.8814645, 0.3669266, -0.2827682, 1, 1, 1, 1, 1,
-0.8811918, -0.5572375, 0.6983145, 1, 1, 1, 1, 1,
-0.8787951, 0.71404, -0.548509, 1, 1, 1, 1, 1,
-0.8719403, -1.744472, -2.250484, 1, 1, 1, 1, 1,
-0.871285, -2.256689, -3.081448, 1, 1, 1, 1, 1,
-0.8697, -2.485957, -0.04042482, 1, 1, 1, 1, 1,
-0.8685317, 0.9389916, -1.277875, 1, 1, 1, 1, 1,
-0.8672543, -0.1350144, -1.588448, 1, 1, 1, 1, 1,
-0.8513258, -0.03897339, -2.446204, 1, 1, 1, 1, 1,
-0.8423376, -0.5248073, -1.672623, 1, 1, 1, 1, 1,
-0.8401068, 0.8571635, -1.009322, 1, 1, 1, 1, 1,
-0.8400815, 1.889819, 0.8552423, 1, 1, 1, 1, 1,
-0.8378369, 1.222052, -2.98645, 1, 1, 1, 1, 1,
-0.8373938, -1.00542, -2.722734, 1, 1, 1, 1, 1,
-0.8373215, -0.7418834, -1.661295, 0, 0, 1, 1, 1,
-0.8365401, 0.9691947, -0.3153167, 1, 0, 0, 1, 1,
-0.8299628, -1.139894, -1.872362, 1, 0, 0, 1, 1,
-0.82972, -0.5424358, -1.573515, 1, 0, 0, 1, 1,
-0.8272976, -0.04952804, -2.63015, 1, 0, 0, 1, 1,
-0.8244952, -0.3684439, -1.930692, 1, 0, 0, 1, 1,
-0.8222673, -1.570253, -2.294077, 0, 0, 0, 1, 1,
-0.8208617, -1.59193, -1.899601, 0, 0, 0, 1, 1,
-0.8091332, -0.4173693, -1.11333, 0, 0, 0, 1, 1,
-0.8040208, -0.2122842, -1.34237, 0, 0, 0, 1, 1,
-0.801501, 0.5507267, -2.709401, 0, 0, 0, 1, 1,
-0.7997042, 0.08956925, -1.043475, 0, 0, 0, 1, 1,
-0.7993501, 0.1819607, -2.056674, 0, 0, 0, 1, 1,
-0.7968273, 1.397769, -1.170922, 1, 1, 1, 1, 1,
-0.7946827, -1.508491, -2.790527, 1, 1, 1, 1, 1,
-0.7923411, -1.049511, -3.434058, 1, 1, 1, 1, 1,
-0.7876003, -1.29709, -2.61121, 1, 1, 1, 1, 1,
-0.7790887, -1.622845, -3.509272, 1, 1, 1, 1, 1,
-0.7781953, -1.978461, -2.121257, 1, 1, 1, 1, 1,
-0.771488, 0.01026447, -1.168369, 1, 1, 1, 1, 1,
-0.7695812, 0.799668, -1.106882, 1, 1, 1, 1, 1,
-0.7690976, -0.5422791, -2.556056, 1, 1, 1, 1, 1,
-0.7644851, -1.504973, -2.523424, 1, 1, 1, 1, 1,
-0.7566113, -1.104243, -2.633474, 1, 1, 1, 1, 1,
-0.7548497, -1.610876, -3.436092, 1, 1, 1, 1, 1,
-0.7508632, 0.2614915, -0.7515224, 1, 1, 1, 1, 1,
-0.7482172, -1.472445, -2.999874, 1, 1, 1, 1, 1,
-0.7355027, -0.2347333, -3.007014, 1, 1, 1, 1, 1,
-0.7351103, -0.6908535, -1.311684, 0, 0, 1, 1, 1,
-0.7348406, -0.8520814, -2.293631, 1, 0, 0, 1, 1,
-0.7310983, -0.3463142, -1.301185, 1, 0, 0, 1, 1,
-0.7270278, 0.4434197, 0.5819358, 1, 0, 0, 1, 1,
-0.7257302, 1.665668, 0.6764926, 1, 0, 0, 1, 1,
-0.7205725, 0.4743513, -1.052525, 1, 0, 0, 1, 1,
-0.7201266, 0.6290846, 0.3157763, 0, 0, 0, 1, 1,
-0.717943, -0.9321598, -4.169987, 0, 0, 0, 1, 1,
-0.7056208, -0.17565, -1.802685, 0, 0, 0, 1, 1,
-0.702367, 0.9565651, -0.1593653, 0, 0, 0, 1, 1,
-0.7012675, 0.05438926, -0.9684876, 0, 0, 0, 1, 1,
-0.6981637, -1.390346, -2.928727, 0, 0, 0, 1, 1,
-0.6950187, 0.4421152, 0.2988652, 0, 0, 0, 1, 1,
-0.6938188, 0.003919824, -0.9703391, 1, 1, 1, 1, 1,
-0.6913745, -1.895189, -2.687735, 1, 1, 1, 1, 1,
-0.6906637, 0.6651303, -1.670778, 1, 1, 1, 1, 1,
-0.6902965, -0.3472965, -3.441669, 1, 1, 1, 1, 1,
-0.6734293, 0.8466747, -1.436494, 1, 1, 1, 1, 1,
-0.6628741, 0.9933011, -0.6978242, 1, 1, 1, 1, 1,
-0.6619677, -0.2314617, -1.5016, 1, 1, 1, 1, 1,
-0.6617037, -0.8984618, -3.082187, 1, 1, 1, 1, 1,
-0.6601692, -0.1602343, -2.13702, 1, 1, 1, 1, 1,
-0.6578081, -0.3689764, -2.798753, 1, 1, 1, 1, 1,
-0.6551501, -0.8788887, -1.788241, 1, 1, 1, 1, 1,
-0.6540799, -0.03653741, -2.953689, 1, 1, 1, 1, 1,
-0.6492027, -0.3024577, -1.152483, 1, 1, 1, 1, 1,
-0.6473073, 0.4019575, -0.7976537, 1, 1, 1, 1, 1,
-0.6463376, 0.325764, -2.478045, 1, 1, 1, 1, 1,
-0.6360633, 0.440424, -1.512755, 0, 0, 1, 1, 1,
-0.6359679, -0.2369283, -1.951905, 1, 0, 0, 1, 1,
-0.6358505, -1.371381, -3.929819, 1, 0, 0, 1, 1,
-0.6356251, 0.2545881, 0.6720045, 1, 0, 0, 1, 1,
-0.6247551, -0.3660805, -2.163812, 1, 0, 0, 1, 1,
-0.6241568, -0.7600676, -2.456751, 1, 0, 0, 1, 1,
-0.6223311, 0.09621369, -3.430913, 0, 0, 0, 1, 1,
-0.6134042, 0.1521213, -1.245731, 0, 0, 0, 1, 1,
-0.6125401, 0.2537164, 0.4776872, 0, 0, 0, 1, 1,
-0.6054631, -1.496015, -5.31431, 0, 0, 0, 1, 1,
-0.6047846, -0.5990022, -1.807319, 0, 0, 0, 1, 1,
-0.6041089, -0.2058611, -1.04621, 0, 0, 0, 1, 1,
-0.5928535, 1.98112, -0.8614039, 0, 0, 0, 1, 1,
-0.5910501, 0.6140271, -1.695889, 1, 1, 1, 1, 1,
-0.5869702, 1.154312, -0.7271727, 1, 1, 1, 1, 1,
-0.586053, -0.7719881, -2.491945, 1, 1, 1, 1, 1,
-0.5850849, 0.2405099, -0.1959897, 1, 1, 1, 1, 1,
-0.5822135, 0.3433999, -0.3876553, 1, 1, 1, 1, 1,
-0.5795585, -0.2588776, -0.8432379, 1, 1, 1, 1, 1,
-0.5768149, 0.5232065, -0.2056493, 1, 1, 1, 1, 1,
-0.576484, -0.05107419, -0.9571126, 1, 1, 1, 1, 1,
-0.5752773, -0.6801001, -0.8362752, 1, 1, 1, 1, 1,
-0.5734203, 0.03742312, 0.2644047, 1, 1, 1, 1, 1,
-0.573306, -0.8448286, -4.655783, 1, 1, 1, 1, 1,
-0.5698947, 0.4204585, -0.502903, 1, 1, 1, 1, 1,
-0.5684605, 0.5526866, -1.361332, 1, 1, 1, 1, 1,
-0.567292, 0.695659, 0.2078217, 1, 1, 1, 1, 1,
-0.5628595, -0.2598842, -1.380308, 1, 1, 1, 1, 1,
-0.5598162, -0.1291297, -1.473692, 0, 0, 1, 1, 1,
-0.5566984, 0.081817, -1.725029, 1, 0, 0, 1, 1,
-0.5519216, -0.8031721, -3.634675, 1, 0, 0, 1, 1,
-0.5516444, 1.319208, 0.7601961, 1, 0, 0, 1, 1,
-0.5472761, 0.2849785, -1.129468, 1, 0, 0, 1, 1,
-0.5369937, 1.122117, -0.1447604, 1, 0, 0, 1, 1,
-0.5326959, -0.06590826, -1.627993, 0, 0, 0, 1, 1,
-0.5268735, 1.144835, -0.8604941, 0, 0, 0, 1, 1,
-0.5242575, 1.606642, 0.3858814, 0, 0, 0, 1, 1,
-0.5196359, -0.5027105, -3.600527, 0, 0, 0, 1, 1,
-0.5152782, -0.7876372, -1.930442, 0, 0, 0, 1, 1,
-0.5152487, -1.200099, -4.104054, 0, 0, 0, 1, 1,
-0.5130733, 0.6900233, -1.164572, 0, 0, 0, 1, 1,
-0.5112567, 1.307034, -0.2421693, 1, 1, 1, 1, 1,
-0.5098468, 1.03132, -0.8253182, 1, 1, 1, 1, 1,
-0.5063394, 0.2107521, -1.696644, 1, 1, 1, 1, 1,
-0.5058658, -0.8811323, -1.900215, 1, 1, 1, 1, 1,
-0.5043038, -1.274713, -3.043627, 1, 1, 1, 1, 1,
-0.5021613, 0.6708928, 1.550209, 1, 1, 1, 1, 1,
-0.5021089, -1.10953, -1.81591, 1, 1, 1, 1, 1,
-0.5016846, -0.7858764, -4.775235, 1, 1, 1, 1, 1,
-0.496069, 0.564097, -1.232104, 1, 1, 1, 1, 1,
-0.4950963, -0.3383357, -2.274076, 1, 1, 1, 1, 1,
-0.493553, -0.2284107, -0.7409669, 1, 1, 1, 1, 1,
-0.4920993, -0.5045593, -3.059039, 1, 1, 1, 1, 1,
-0.4875068, -0.751049, -0.9882689, 1, 1, 1, 1, 1,
-0.4861495, 1.932073, 0.5829834, 1, 1, 1, 1, 1,
-0.4859718, -1.422551, -3.449754, 1, 1, 1, 1, 1,
-0.4843395, -1.429549, -1.643494, 0, 0, 1, 1, 1,
-0.483393, 1.109, 1.536258, 1, 0, 0, 1, 1,
-0.4807854, 0.683426, -1.778424, 1, 0, 0, 1, 1,
-0.4754595, 0.7726058, -1.207918, 1, 0, 0, 1, 1,
-0.4752538, -0.01286878, -1.078683, 1, 0, 0, 1, 1,
-0.4750863, 0.1246468, -0.1431364, 1, 0, 0, 1, 1,
-0.4698935, -0.4767297, -2.650321, 0, 0, 0, 1, 1,
-0.4658891, 0.8281565, 0.006061603, 0, 0, 0, 1, 1,
-0.4580192, -0.07489198, -3.138347, 0, 0, 0, 1, 1,
-0.4557827, 0.3268365, -1.609921, 0, 0, 0, 1, 1,
-0.4510718, 0.7171041, -2.055257, 0, 0, 0, 1, 1,
-0.4498609, 1.532648, -1.475625, 0, 0, 0, 1, 1,
-0.4438335, 0.3665084, -0.8382028, 0, 0, 0, 1, 1,
-0.4412876, 0.4996828, -0.8368034, 1, 1, 1, 1, 1,
-0.4411139, 1.112036, -0.1759948, 1, 1, 1, 1, 1,
-0.4365208, -1.869312, -3.117295, 1, 1, 1, 1, 1,
-0.4278494, 1.166251, -1.983863, 1, 1, 1, 1, 1,
-0.4277697, -0.6192574, -3.035291, 1, 1, 1, 1, 1,
-0.4272383, -0.7241231, -5.267438, 1, 1, 1, 1, 1,
-0.4210994, -0.5824967, -2.367183, 1, 1, 1, 1, 1,
-0.4161995, 0.613653, -1.513301, 1, 1, 1, 1, 1,
-0.4107223, -1.064835, -2.056216, 1, 1, 1, 1, 1,
-0.4073566, -0.7429752, -3.508503, 1, 1, 1, 1, 1,
-0.4067588, 0.4689326, -1.601825, 1, 1, 1, 1, 1,
-0.3952073, -1.252791, -0.5383267, 1, 1, 1, 1, 1,
-0.3915093, 0.7425669, -0.6095733, 1, 1, 1, 1, 1,
-0.3902646, 0.4184698, -2.795887, 1, 1, 1, 1, 1,
-0.3863724, -2.068144, -4.042504, 1, 1, 1, 1, 1,
-0.3858712, -0.03302042, -3.50051, 0, 0, 1, 1, 1,
-0.3849703, 1.252473, -0.1594645, 1, 0, 0, 1, 1,
-0.3773655, 0.7430417, -1.056891, 1, 0, 0, 1, 1,
-0.3722731, 1.202732, 0.506917, 1, 0, 0, 1, 1,
-0.3715399, -1.036738, -2.172582, 1, 0, 0, 1, 1,
-0.3709063, -0.6999305, -2.81728, 1, 0, 0, 1, 1,
-0.3664818, -0.2583489, -1.441414, 0, 0, 0, 1, 1,
-0.3616892, -0.5631053, -1.580777, 0, 0, 0, 1, 1,
-0.354644, -1.538623, -1.89774, 0, 0, 0, 1, 1,
-0.3482629, -1.211931, -3.223902, 0, 0, 0, 1, 1,
-0.3479328, -1.945206, -2.654553, 0, 0, 0, 1, 1,
-0.3460011, -0.9338219, -1.484344, 0, 0, 0, 1, 1,
-0.3441978, 0.09662567, -1.236432, 0, 0, 0, 1, 1,
-0.3427442, 0.4515201, -0.2397408, 1, 1, 1, 1, 1,
-0.3382871, -0.39538, -0.8998017, 1, 1, 1, 1, 1,
-0.3373548, -0.511715, -3.341435, 1, 1, 1, 1, 1,
-0.3316661, -0.1855051, -2.614716, 1, 1, 1, 1, 1,
-0.3278342, -0.4906093, -1.813819, 1, 1, 1, 1, 1,
-0.3210026, 0.9611034, -0.4595205, 1, 1, 1, 1, 1,
-0.3177094, 1.007681, -0.6491082, 1, 1, 1, 1, 1,
-0.3175062, -0.2046609, -1.222496, 1, 1, 1, 1, 1,
-0.3166359, 1.208338, -0.1701232, 1, 1, 1, 1, 1,
-0.3122673, -1.026636, -1.676399, 1, 1, 1, 1, 1,
-0.3116152, -0.607663, -2.447439, 1, 1, 1, 1, 1,
-0.3113329, 1.661381, -1.852156, 1, 1, 1, 1, 1,
-0.3057329, -0.01306041, -1.262389, 1, 1, 1, 1, 1,
-0.3035286, 0.2705057, -0.3906219, 1, 1, 1, 1, 1,
-0.2981556, 0.9434041, 0.2251835, 1, 1, 1, 1, 1,
-0.296448, -0.02365573, -1.323379, 0, 0, 1, 1, 1,
-0.2949111, 0.8900344, -1.36866, 1, 0, 0, 1, 1,
-0.2947845, 1.018005, 0.9558147, 1, 0, 0, 1, 1,
-0.2913081, -0.8579147, -1.610094, 1, 0, 0, 1, 1,
-0.2904381, -0.1046666, -2.224732, 1, 0, 0, 1, 1,
-0.2904296, -0.8667583, -2.371289, 1, 0, 0, 1, 1,
-0.2898158, -0.2837018, -1.668991, 0, 0, 0, 1, 1,
-0.2894175, -0.163716, -0.7314818, 0, 0, 0, 1, 1,
-0.2884828, -1.392283, -2.866592, 0, 0, 0, 1, 1,
-0.2865442, 0.07596505, 0.3017431, 0, 0, 0, 1, 1,
-0.2839077, 0.6648384, 1.050065, 0, 0, 0, 1, 1,
-0.283229, 1.010264, -1.495379, 0, 0, 0, 1, 1,
-0.2817237, -0.4393168, -4.80233, 0, 0, 0, 1, 1,
-0.2816805, -0.04598496, -2.098275, 1, 1, 1, 1, 1,
-0.2813748, -0.3906927, -2.025239, 1, 1, 1, 1, 1,
-0.281076, 0.08362846, -2.516237, 1, 1, 1, 1, 1,
-0.2794576, -1.893362, -3.269773, 1, 1, 1, 1, 1,
-0.2792751, -0.5488855, -2.688661, 1, 1, 1, 1, 1,
-0.2785396, 1.425183, -0.271857, 1, 1, 1, 1, 1,
-0.2776993, 0.7536438, -1.591687, 1, 1, 1, 1, 1,
-0.2722274, -0.05131004, -0.8719555, 1, 1, 1, 1, 1,
-0.2702711, -1.010417, -3.015177, 1, 1, 1, 1, 1,
-0.2688443, -0.2989903, -1.385126, 1, 1, 1, 1, 1,
-0.2687161, -0.05501227, -2.371568, 1, 1, 1, 1, 1,
-0.2633986, 1.347862, -0.7774892, 1, 1, 1, 1, 1,
-0.2547877, 2.771551, 1.040573, 1, 1, 1, 1, 1,
-0.2545842, 0.7829206, -2.806087, 1, 1, 1, 1, 1,
-0.2537319, 0.943954, 0.8402423, 1, 1, 1, 1, 1,
-0.2536525, -1.12295, -0.2357821, 0, 0, 1, 1, 1,
-0.2525241, 0.7220566, 0.2487884, 1, 0, 0, 1, 1,
-0.252513, 2.836117, 1.533418, 1, 0, 0, 1, 1,
-0.2514259, 1.008757, 0.5626339, 1, 0, 0, 1, 1,
-0.2474155, -0.5104789, -3.840065, 1, 0, 0, 1, 1,
-0.245673, -1.373342, -1.349482, 1, 0, 0, 1, 1,
-0.2436951, -0.3145956, -3.82453, 0, 0, 0, 1, 1,
-0.2417542, -0.2091852, -2.533184, 0, 0, 0, 1, 1,
-0.2363737, 1.039429, -0.1201882, 0, 0, 0, 1, 1,
-0.2344718, -1.759766, -2.79004, 0, 0, 0, 1, 1,
-0.2336458, 0.3055228, -0.4346991, 0, 0, 0, 1, 1,
-0.232317, 0.8618628, 0.6405439, 0, 0, 0, 1, 1,
-0.2317429, 2.758098, -1.878514, 0, 0, 0, 1, 1,
-0.2300066, -0.449653, -2.73, 1, 1, 1, 1, 1,
-0.2289739, -1.270066, -3.090845, 1, 1, 1, 1, 1,
-0.2276285, 1.061247, -0.2499146, 1, 1, 1, 1, 1,
-0.2276078, -0.06012114, -3.775667, 1, 1, 1, 1, 1,
-0.2233734, -1.320941, -0.7185723, 1, 1, 1, 1, 1,
-0.2211828, -2.55273, -0.7231312, 1, 1, 1, 1, 1,
-0.2142516, -1.133424, -3.553238, 1, 1, 1, 1, 1,
-0.2113928, 1.429894, -0.6913452, 1, 1, 1, 1, 1,
-0.2103465, -0.8044704, -3.243931, 1, 1, 1, 1, 1,
-0.2083042, 0.2066747, -0.4306437, 1, 1, 1, 1, 1,
-0.2065615, -1.107105, -1.653763, 1, 1, 1, 1, 1,
-0.1984618, -1.243384, -5.304866, 1, 1, 1, 1, 1,
-0.1935706, -0.6288041, -3.659299, 1, 1, 1, 1, 1,
-0.1921532, 1.007506, 1.647886, 1, 1, 1, 1, 1,
-0.1856284, 1.080661, -2.17914, 1, 1, 1, 1, 1,
-0.1853909, -0.9116229, -2.410095, 0, 0, 1, 1, 1,
-0.1845782, 1.384517, 0.3485682, 1, 0, 0, 1, 1,
-0.1809469, -0.2544272, -2.603936, 1, 0, 0, 1, 1,
-0.1800842, -0.1497756, -0.5363315, 1, 0, 0, 1, 1,
-0.1781834, 0.06675447, -0.1427509, 1, 0, 0, 1, 1,
-0.1755586, -0.9437008, -1.569976, 1, 0, 0, 1, 1,
-0.1745881, -0.8183538, -4.546161, 0, 0, 0, 1, 1,
-0.1745465, -0.442787, -3.01235, 0, 0, 0, 1, 1,
-0.1643371, 1.360508, -1.791774, 0, 0, 0, 1, 1,
-0.1594213, -0.1823486, -2.246783, 0, 0, 0, 1, 1,
-0.1580206, -0.79127, -3.673396, 0, 0, 0, 1, 1,
-0.1547836, 0.9262969, -0.3530539, 0, 0, 0, 1, 1,
-0.1545159, 1.250407, -1.731021, 0, 0, 0, 1, 1,
-0.1531196, 0.4415433, -1.093192, 1, 1, 1, 1, 1,
-0.1531016, -0.8661285, -2.312021, 1, 1, 1, 1, 1,
-0.1516264, -0.6339983, -2.777325, 1, 1, 1, 1, 1,
-0.1513804, 0.7950708, -0.6410585, 1, 1, 1, 1, 1,
-0.1510819, 1.243173, 0.0891269, 1, 1, 1, 1, 1,
-0.1510281, 0.3565099, -0.4258748, 1, 1, 1, 1, 1,
-0.1500011, 0.3337374, -0.4050561, 1, 1, 1, 1, 1,
-0.1399586, 1.89531, 0.1233398, 1, 1, 1, 1, 1,
-0.1387541, 0.2757856, -1.0792, 1, 1, 1, 1, 1,
-0.1330169, 1.354748, 0.4445205, 1, 1, 1, 1, 1,
-0.1296487, 0.7914169, 1.066158, 1, 1, 1, 1, 1,
-0.1261649, -0.9441912, -3.326448, 1, 1, 1, 1, 1,
-0.1253302, -0.9767721, -3.723876, 1, 1, 1, 1, 1,
-0.1213251, -0.04602086, -2.377156, 1, 1, 1, 1, 1,
-0.1185865, 2.504244, 1.235107, 1, 1, 1, 1, 1,
-0.1184863, -0.8203251, -2.95929, 0, 0, 1, 1, 1,
-0.118414, 1.397191, -2.147996, 1, 0, 0, 1, 1,
-0.117066, -0.3418184, -2.857936, 1, 0, 0, 1, 1,
-0.1103435, -0.4498828, -1.221138, 1, 0, 0, 1, 1,
-0.1097723, 0.4541226, 0.6690619, 1, 0, 0, 1, 1,
-0.1062656, 0.4279167, 0.2098268, 1, 0, 0, 1, 1,
-0.1042253, -1.721342, -5.179139, 0, 0, 0, 1, 1,
-0.1039884, 0.2849609, -1.31074, 0, 0, 0, 1, 1,
-0.09750146, 0.3577239, 0.4224332, 0, 0, 0, 1, 1,
-0.09538833, -1.637973, -4.626825, 0, 0, 0, 1, 1,
-0.09356094, 3.013125, 2.166955, 0, 0, 0, 1, 1,
-0.09073689, 0.4765248, -1.037594, 0, 0, 0, 1, 1,
-0.09028313, -0.271096, -2.683763, 0, 0, 0, 1, 1,
-0.0828068, 0.06894254, -3.324877, 1, 1, 1, 1, 1,
-0.08146729, 1.147412, -1.683906, 1, 1, 1, 1, 1,
-0.07924645, -0.4005207, -2.129802, 1, 1, 1, 1, 1,
-0.07768903, 0.451246, 0.5122528, 1, 1, 1, 1, 1,
-0.07410436, 0.290501, 1.154826, 1, 1, 1, 1, 1,
-0.07373531, -0.8723075, -3.486877, 1, 1, 1, 1, 1,
-0.06896009, -0.4882903, -3.625392, 1, 1, 1, 1, 1,
-0.06588606, -0.3421056, -3.740161, 1, 1, 1, 1, 1,
-0.06395378, 1.161005, -1.737248, 1, 1, 1, 1, 1,
-0.06172188, 0.05185527, -2.320001, 1, 1, 1, 1, 1,
-0.05876485, 0.1970301, -1.588046, 1, 1, 1, 1, 1,
-0.05553654, -0.4812129, -2.185397, 1, 1, 1, 1, 1,
-0.04085616, 0.9252883, -0.08260328, 1, 1, 1, 1, 1,
-0.04038438, -0.5776879, -2.599948, 1, 1, 1, 1, 1,
-0.04026446, 1.145591, -0.3053078, 1, 1, 1, 1, 1,
-0.03889548, 0.2570864, -0.7993029, 0, 0, 1, 1, 1,
-0.03359698, 1.240209, -0.4136008, 1, 0, 0, 1, 1,
-0.02954628, -0.315704, -4.155854, 1, 0, 0, 1, 1,
-0.02469631, -0.9790836, -4.341292, 1, 0, 0, 1, 1,
-0.02392192, 1.156574, -0.001533292, 1, 0, 0, 1, 1,
-0.02332292, -0.9954171, -1.988303, 1, 0, 0, 1, 1,
-0.01896804, -0.4017381, -1.73043, 0, 0, 0, 1, 1,
-0.01123221, -0.7815086, -2.091574, 0, 0, 0, 1, 1,
-0.009668431, -0.2632638, -3.785648, 0, 0, 0, 1, 1,
-0.008381924, -0.8667598, -2.340299, 0, 0, 0, 1, 1,
-0.006678983, 1.067279, 2.225652, 0, 0, 0, 1, 1,
-0.003262884, -0.1089139, -2.343631, 0, 0, 0, 1, 1,
0.008051585, -1.346934, 2.004225, 0, 0, 0, 1, 1,
0.008604138, 0.7362853, -0.7888247, 1, 1, 1, 1, 1,
0.008967204, 1.103013, 0.3946475, 1, 1, 1, 1, 1,
0.01011872, -0.1973788, 4.47554, 1, 1, 1, 1, 1,
0.01470048, 0.180898, 0.6224105, 1, 1, 1, 1, 1,
0.02065616, 0.4660716, 0.5262932, 1, 1, 1, 1, 1,
0.02120959, -0.8723395, 4.180346, 1, 1, 1, 1, 1,
0.02444363, 1.015925, -0.8454303, 1, 1, 1, 1, 1,
0.02543701, 0.9952224, 0.7734071, 1, 1, 1, 1, 1,
0.02552102, -0.7643692, 3.525789, 1, 1, 1, 1, 1,
0.02928247, -0.6194952, 1.165659, 1, 1, 1, 1, 1,
0.02990793, -1.473478, 3.847998, 1, 1, 1, 1, 1,
0.03019668, 1.28987, 0.5533102, 1, 1, 1, 1, 1,
0.03394099, -1.036468, 5.501781, 1, 1, 1, 1, 1,
0.03686825, -0.1647035, 0.4647508, 1, 1, 1, 1, 1,
0.03694114, 0.3255873, -1.844307, 1, 1, 1, 1, 1,
0.03900891, 1.598404, -0.7520798, 0, 0, 1, 1, 1,
0.04987126, -0.1062024, 2.479144, 1, 0, 0, 1, 1,
0.0536303, 1.940189, 1.686468, 1, 0, 0, 1, 1,
0.05400567, 1.180731, -0.08833311, 1, 0, 0, 1, 1,
0.05438375, -0.6595642, 3.371476, 1, 0, 0, 1, 1,
0.05563377, -1.613484, 3.241804, 1, 0, 0, 1, 1,
0.05679066, -1.033984, 3.284453, 0, 0, 0, 1, 1,
0.05719, -0.798047, 3.16897, 0, 0, 0, 1, 1,
0.06037923, -0.09434193, 3.427297, 0, 0, 0, 1, 1,
0.06064889, 0.1983566, -1.179162, 0, 0, 0, 1, 1,
0.06116002, -1.26187, 2.919764, 0, 0, 0, 1, 1,
0.06377561, -1.632591, 3.417641, 0, 0, 0, 1, 1,
0.06550396, -2.180135, 3.280322, 0, 0, 0, 1, 1,
0.06724034, -0.3835141, 3.854072, 1, 1, 1, 1, 1,
0.06727636, 0.2916237, 0.9714371, 1, 1, 1, 1, 1,
0.07212748, 0.1937303, 1.114457, 1, 1, 1, 1, 1,
0.07401858, -0.0242995, 0.5862765, 1, 1, 1, 1, 1,
0.07436441, -0.4459343, 2.477181, 1, 1, 1, 1, 1,
0.07615677, -0.336246, 2.297414, 1, 1, 1, 1, 1,
0.0805827, -0.8065033, 2.240937, 1, 1, 1, 1, 1,
0.08490168, 0.1796559, 0.4511724, 1, 1, 1, 1, 1,
0.08540414, -1.341681, 1.855763, 1, 1, 1, 1, 1,
0.09217034, -0.9100941, 3.355295, 1, 1, 1, 1, 1,
0.09525304, -0.3427889, 4.330338, 1, 1, 1, 1, 1,
0.09619343, -1.636425, 1.197342, 1, 1, 1, 1, 1,
0.1065248, -2.110156, 2.759826, 1, 1, 1, 1, 1,
0.1084373, 0.06634977, 0.7783677, 1, 1, 1, 1, 1,
0.1113558, -0.2348203, 2.451133, 1, 1, 1, 1, 1,
0.114365, 0.2713026, 0.5804535, 0, 0, 1, 1, 1,
0.115924, -1.229197, 2.863351, 1, 0, 0, 1, 1,
0.1159878, 0.02110826, 2.804757, 1, 0, 0, 1, 1,
0.1167005, 0.07946668, 1.460054, 1, 0, 0, 1, 1,
0.1191846, -0.9253656, 3.287584, 1, 0, 0, 1, 1,
0.1224151, 0.06529398, 2.450154, 1, 0, 0, 1, 1,
0.1233702, 2.581968, 0.08100715, 0, 0, 0, 1, 1,
0.1287768, -1.767822, 2.446012, 0, 0, 0, 1, 1,
0.1306184, -0.739979, 2.612817, 0, 0, 0, 1, 1,
0.1308018, 0.02022607, 2.012536, 0, 0, 0, 1, 1,
0.1314386, 0.5234044, 1.748614, 0, 0, 0, 1, 1,
0.1327699, 1.227699, 0.7075706, 0, 0, 0, 1, 1,
0.1351937, 0.3089635, -0.3206417, 0, 0, 0, 1, 1,
0.1372996, -0.9160731, 2.913289, 1, 1, 1, 1, 1,
0.1401757, -0.2810565, 2.593616, 1, 1, 1, 1, 1,
0.1433345, 0.1138391, -0.1854944, 1, 1, 1, 1, 1,
0.1459329, 0.07617665, 2.439183, 1, 1, 1, 1, 1,
0.1464777, -1.563431, 4.030913, 1, 1, 1, 1, 1,
0.1538459, 0.8122464, 0.6691338, 1, 1, 1, 1, 1,
0.1604255, 0.1743296, -0.2490201, 1, 1, 1, 1, 1,
0.1607921, 1.46346, 1.079273, 1, 1, 1, 1, 1,
0.1613018, 1.392931, -0.6530112, 1, 1, 1, 1, 1,
0.1653673, 0.527473, 0.3839611, 1, 1, 1, 1, 1,
0.1716315, -0.6118128, 2.45112, 1, 1, 1, 1, 1,
0.1759261, 0.01809241, 0.9232092, 1, 1, 1, 1, 1,
0.1767493, -0.6774827, 3.344831, 1, 1, 1, 1, 1,
0.1779291, 0.2383013, -0.1589304, 1, 1, 1, 1, 1,
0.1802453, 1.353374, 1.00906, 1, 1, 1, 1, 1,
0.1820197, -0.9127097, 4.129575, 0, 0, 1, 1, 1,
0.1829671, 0.3571084, 1.33987, 1, 0, 0, 1, 1,
0.1848296, 0.40048, 4.283394, 1, 0, 0, 1, 1,
0.1904899, 1.341657, -1.482563, 1, 0, 0, 1, 1,
0.191756, 0.3448663, -0.160863, 1, 0, 0, 1, 1,
0.1929078, 0.5519516, 1.847203, 1, 0, 0, 1, 1,
0.1938426, -0.1611039, 2.04136, 0, 0, 0, 1, 1,
0.1941702, 1.228773, 0.6745225, 0, 0, 0, 1, 1,
0.2021946, 0.8407393, -0.4122279, 0, 0, 0, 1, 1,
0.2067607, 0.2837034, 0.9428189, 0, 0, 0, 1, 1,
0.2096742, 2.046149, -1.290906, 0, 0, 0, 1, 1,
0.210133, 0.3815663, 0.413946, 0, 0, 0, 1, 1,
0.2126351, -0.1476098, 2.287079, 0, 0, 0, 1, 1,
0.2151453, 0.5054539, 1.97611, 1, 1, 1, 1, 1,
0.2153372, -1.280561, 3.338558, 1, 1, 1, 1, 1,
0.2164968, 0.093009, 0.705503, 1, 1, 1, 1, 1,
0.2193926, -0.9546238, 2.723382, 1, 1, 1, 1, 1,
0.2216145, 0.9732957, 0.1170167, 1, 1, 1, 1, 1,
0.2233469, -0.007313049, 3.07039, 1, 1, 1, 1, 1,
0.2241461, -2.559185, 2.07957, 1, 1, 1, 1, 1,
0.2287001, -0.8197662, 3.16943, 1, 1, 1, 1, 1,
0.2288505, -2.089761, 2.648624, 1, 1, 1, 1, 1,
0.2288684, -1.288882, 1.385347, 1, 1, 1, 1, 1,
0.2295406, 2.146546, -0.08971239, 1, 1, 1, 1, 1,
0.2306423, 0.2326924, 0.9624681, 1, 1, 1, 1, 1,
0.2366659, 0.7836196, -0.9434112, 1, 1, 1, 1, 1,
0.2432038, -1.194225, 0.4411454, 1, 1, 1, 1, 1,
0.2472326, 0.03883866, 1.287414, 1, 1, 1, 1, 1,
0.2529242, -0.3734611, 3.777994, 0, 0, 1, 1, 1,
0.2543061, 0.006875176, 0.2120267, 1, 0, 0, 1, 1,
0.2580133, -1.088149, 2.628275, 1, 0, 0, 1, 1,
0.2593732, 0.9440189, 1.576113, 1, 0, 0, 1, 1,
0.2599498, 1.121003, 0.5361325, 1, 0, 0, 1, 1,
0.2603263, -0.44439, 1.25342, 1, 0, 0, 1, 1,
0.2608006, 0.07313467, 0.826032, 0, 0, 0, 1, 1,
0.2637911, 1.064566, 1.312283, 0, 0, 0, 1, 1,
0.2649392, 1.448582, -0.2406281, 0, 0, 0, 1, 1,
0.2672074, -0.446618, 3.217006, 0, 0, 0, 1, 1,
0.268926, -0.1074508, 3.887568, 0, 0, 0, 1, 1,
0.2718549, 0.752444, 0.8684505, 0, 0, 0, 1, 1,
0.2763065, -0.905422, 1.479725, 0, 0, 0, 1, 1,
0.2770734, 1.110051, -0.01170047, 1, 1, 1, 1, 1,
0.2810254, -1.168987, 1.694903, 1, 1, 1, 1, 1,
0.2867029, 0.931971, -0.2581822, 1, 1, 1, 1, 1,
0.2900952, -0.6368488, 2.552411, 1, 1, 1, 1, 1,
0.2924471, 0.07660423, 1.389074, 1, 1, 1, 1, 1,
0.2930361, -1.156369, 4.572121, 1, 1, 1, 1, 1,
0.3007521, -1.057286, 1.642641, 1, 1, 1, 1, 1,
0.3045576, 0.8349465, 1.388015, 1, 1, 1, 1, 1,
0.3047558, 0.493565, 0.1711565, 1, 1, 1, 1, 1,
0.3062244, 0.5073131, 2.34327, 1, 1, 1, 1, 1,
0.3077892, -0.1876216, 2.273067, 1, 1, 1, 1, 1,
0.3077931, -0.7221946, 2.895931, 1, 1, 1, 1, 1,
0.3080415, -0.5598579, 2.64615, 1, 1, 1, 1, 1,
0.3170763, -1.355097, 3.817612, 1, 1, 1, 1, 1,
0.3192249, 0.1974541, 2.17366, 1, 1, 1, 1, 1,
0.3194247, -0.3213454, 2.060236, 0, 0, 1, 1, 1,
0.3194813, 0.3123784, 1.211868, 1, 0, 0, 1, 1,
0.3195875, -0.4088119, 2.871967, 1, 0, 0, 1, 1,
0.3224604, -0.8573199, 2.157844, 1, 0, 0, 1, 1,
0.3242815, -1.523488, 4.287028, 1, 0, 0, 1, 1,
0.3256552, 0.1474884, 1.204164, 1, 0, 0, 1, 1,
0.3312463, -1.639806, 2.311776, 0, 0, 0, 1, 1,
0.3367755, 1.8905, 0.1885687, 0, 0, 0, 1, 1,
0.3371327, 0.3781478, 0.0831925, 0, 0, 0, 1, 1,
0.3378654, -0.04163583, 1.689142, 0, 0, 0, 1, 1,
0.3379889, 1.70039, -1.005894, 0, 0, 0, 1, 1,
0.3417527, 0.3920377, 0.5160711, 0, 0, 0, 1, 1,
0.3472541, 1.059489, -0.08575675, 0, 0, 0, 1, 1,
0.3520277, 0.2252507, 0.2618732, 1, 1, 1, 1, 1,
0.3526915, -1.035218, 5.244096, 1, 1, 1, 1, 1,
0.3548538, -0.2504463, 4.810391, 1, 1, 1, 1, 1,
0.3606188, -0.6221904, 3.916659, 1, 1, 1, 1, 1,
0.3613795, 0.5666774, 2.79394, 1, 1, 1, 1, 1,
0.3639182, 0.4363488, 0.2395095, 1, 1, 1, 1, 1,
0.3650988, 1.47939, -1.197996, 1, 1, 1, 1, 1,
0.3662095, 0.1438676, -0.005999545, 1, 1, 1, 1, 1,
0.3717583, -0.661367, 4.396771, 1, 1, 1, 1, 1,
0.3746608, -0.4731621, 2.85356, 1, 1, 1, 1, 1,
0.3789673, -0.2250708, 0.5904461, 1, 1, 1, 1, 1,
0.3791253, -0.6537932, 2.318697, 1, 1, 1, 1, 1,
0.3796937, 0.3242636, 1.15856, 1, 1, 1, 1, 1,
0.381966, 0.8082001, -0.5706986, 1, 1, 1, 1, 1,
0.382917, 0.5658001, 1.104993, 1, 1, 1, 1, 1,
0.3849016, -0.7508479, 4.268972, 0, 0, 1, 1, 1,
0.3921647, 1.960894, -0.8618209, 1, 0, 0, 1, 1,
0.3933698, 1.554986, 0.3126004, 1, 0, 0, 1, 1,
0.3943452, -0.2834117, 1.963622, 1, 0, 0, 1, 1,
0.3944768, 1.04135, -0.7132201, 1, 0, 0, 1, 1,
0.3974645, 0.08781303, -0.8656756, 1, 0, 0, 1, 1,
0.3977846, 0.9446814, -0.8431006, 0, 0, 0, 1, 1,
0.3983519, 0.577626, 0.07512863, 0, 0, 0, 1, 1,
0.3995726, -1.180674, 1.314086, 0, 0, 0, 1, 1,
0.4006092, 0.3974609, 3.902287, 0, 0, 0, 1, 1,
0.4038682, 0.2560006, 1.166751, 0, 0, 0, 1, 1,
0.4061802, 0.41519, 1.538452, 0, 0, 0, 1, 1,
0.40857, -0.7252748, 1.784567, 0, 0, 0, 1, 1,
0.4088854, -0.7762029, 3.383438, 1, 1, 1, 1, 1,
0.4162565, 0.6292375, 1.528374, 1, 1, 1, 1, 1,
0.4196396, 0.2838453, 0.3364897, 1, 1, 1, 1, 1,
0.4196597, 0.4548039, 0.7779898, 1, 1, 1, 1, 1,
0.4209334, 0.9850419, 1.971143, 1, 1, 1, 1, 1,
0.4227343, -0.881869, 2.732004, 1, 1, 1, 1, 1,
0.4246185, -0.1138974, 3.066673, 1, 1, 1, 1, 1,
0.4298963, 1.275349, -0.7837073, 1, 1, 1, 1, 1,
0.4315082, 0.8389134, 1.210718, 1, 1, 1, 1, 1,
0.4412216, 0.7589282, 1.750561, 1, 1, 1, 1, 1,
0.4425137, -0.3170182, 2.930054, 1, 1, 1, 1, 1,
0.4425687, -1.202582, 3.556704, 1, 1, 1, 1, 1,
0.4427796, -0.2782024, 2.187927, 1, 1, 1, 1, 1,
0.4458376, 0.6770864, 1.741929, 1, 1, 1, 1, 1,
0.4466574, 0.3329609, 1.393818, 1, 1, 1, 1, 1,
0.4490157, 1.172859, 3.932714, 0, 0, 1, 1, 1,
0.4498864, 0.9712167, 1.006219, 1, 0, 0, 1, 1,
0.4523247, 0.6363751, 1.184368, 1, 0, 0, 1, 1,
0.4545435, 1.004961, 0.002842478, 1, 0, 0, 1, 1,
0.4588492, -0.7116756, 2.888229, 1, 0, 0, 1, 1,
0.463966, 0.1438592, -0.2640934, 1, 0, 0, 1, 1,
0.4662681, 2.66797, -0.3930095, 0, 0, 0, 1, 1,
0.4674394, -0.258577, 1.78315, 0, 0, 0, 1, 1,
0.4679905, 0.4188873, -0.2412827, 0, 0, 0, 1, 1,
0.4707689, 0.5582602, -0.175745, 0, 0, 0, 1, 1,
0.4717009, -0.7220336, 2.109268, 0, 0, 0, 1, 1,
0.4765805, -0.2918625, 3.418663, 0, 0, 0, 1, 1,
0.4775955, 0.001188352, 2.731498, 0, 0, 0, 1, 1,
0.4794677, -0.8507345, 2.903622, 1, 1, 1, 1, 1,
0.4809249, 2.447845, -0.05252274, 1, 1, 1, 1, 1,
0.4854953, -0.2134624, 1.104705, 1, 1, 1, 1, 1,
0.4855294, -1.758156, 3.139096, 1, 1, 1, 1, 1,
0.4891942, -0.05830334, 1.461073, 1, 1, 1, 1, 1,
0.4927275, -0.7795236, 1.458496, 1, 1, 1, 1, 1,
0.4953298, -0.4627734, 1.231056, 1, 1, 1, 1, 1,
0.5012625, 1.133347, 1.158386, 1, 1, 1, 1, 1,
0.5055841, 1.63618, -0.5975162, 1, 1, 1, 1, 1,
0.5082003, 0.2227346, 1.170291, 1, 1, 1, 1, 1,
0.5097539, 1.923401, -0.4155816, 1, 1, 1, 1, 1,
0.5134058, -0.05921333, 2.958649, 1, 1, 1, 1, 1,
0.5139769, -0.5956743, 2.493316, 1, 1, 1, 1, 1,
0.5326173, -1.049112, 3.11318, 1, 1, 1, 1, 1,
0.5352141, 0.2535484, 0.6748006, 1, 1, 1, 1, 1,
0.5371618, -0.3814116, 0.9879196, 0, 0, 1, 1, 1,
0.5376685, -0.7654051, 2.536861, 1, 0, 0, 1, 1,
0.5408971, -1.294235, 1.260572, 1, 0, 0, 1, 1,
0.5449519, 1.490036, 0.131304, 1, 0, 0, 1, 1,
0.5493948, -1.499562, 5.409186, 1, 0, 0, 1, 1,
0.5494488, -0.2479125, 2.340956, 1, 0, 0, 1, 1,
0.5510712, -1.099769, 2.376611, 0, 0, 0, 1, 1,
0.551073, 0.1836126, 0.1956206, 0, 0, 0, 1, 1,
0.5574145, -0.6604161, 2.030037, 0, 0, 0, 1, 1,
0.5582952, 0.4460785, 0.9690118, 0, 0, 0, 1, 1,
0.5598056, -0.7860997, 1.657514, 0, 0, 0, 1, 1,
0.560738, -1.101416, 2.728472, 0, 0, 0, 1, 1,
0.5690254, 1.268607, -0.23747, 0, 0, 0, 1, 1,
0.5707792, 0.1061033, 1.604682, 1, 1, 1, 1, 1,
0.5726745, 0.3623767, 0.6650264, 1, 1, 1, 1, 1,
0.5778628, -0.3567408, 1.621995, 1, 1, 1, 1, 1,
0.5854699, -1.453789, 1.942919, 1, 1, 1, 1, 1,
0.5869524, -0.5082367, 2.142517, 1, 1, 1, 1, 1,
0.590506, -0.321664, 3.527998, 1, 1, 1, 1, 1,
0.5950975, -0.01806329, -0.720865, 1, 1, 1, 1, 1,
0.6062548, 0.4712139, 1.294159, 1, 1, 1, 1, 1,
0.6084285, 0.7910078, 1.391396, 1, 1, 1, 1, 1,
0.6131076, -0.5579294, 3.631485, 1, 1, 1, 1, 1,
0.6182656, -0.5471284, 2.788004, 1, 1, 1, 1, 1,
0.6214172, -1.054006, 3.017312, 1, 1, 1, 1, 1,
0.6261659, 0.05627147, 0.8887941, 1, 1, 1, 1, 1,
0.6278056, 0.8577101, 0.04968374, 1, 1, 1, 1, 1,
0.6329058, -0.681581, 2.773232, 1, 1, 1, 1, 1,
0.6329597, -0.5029892, 1.859327, 0, 0, 1, 1, 1,
0.6371692, 0.233549, 2.400964, 1, 0, 0, 1, 1,
0.6381965, 1.752182, 2.224405, 1, 0, 0, 1, 1,
0.6424947, -0.1397795, 1.120822, 1, 0, 0, 1, 1,
0.6476396, -1.144499, 4.569567, 1, 0, 0, 1, 1,
0.648535, -0.1009099, 2.287859, 1, 0, 0, 1, 1,
0.6506448, 0.02943867, 0.4860293, 0, 0, 0, 1, 1,
0.6563201, -0.1539454, 2.23396, 0, 0, 0, 1, 1,
0.6606356, -0.006516713, -0.1477833, 0, 0, 0, 1, 1,
0.6652489, 0.7746382, -0.1542287, 0, 0, 0, 1, 1,
0.6657255, -0.5159237, 1.444335, 0, 0, 0, 1, 1,
0.6657969, -0.4657848, 2.363848, 0, 0, 0, 1, 1,
0.6719832, -1.088669, 3.20615, 0, 0, 0, 1, 1,
0.6749262, -1.355488, 3.496315, 1, 1, 1, 1, 1,
0.6752515, -1.193037, 3.347619, 1, 1, 1, 1, 1,
0.6841872, -0.3027035, 2.420039, 1, 1, 1, 1, 1,
0.6880829, 1.41167, 0.3440409, 1, 1, 1, 1, 1,
0.6893066, -2.217261, 3.564786, 1, 1, 1, 1, 1,
0.6901945, -0.1919126, 2.585896, 1, 1, 1, 1, 1,
0.690745, -0.702405, 4.442626, 1, 1, 1, 1, 1,
0.6940414, -0.2096644, 1.104471, 1, 1, 1, 1, 1,
0.6963056, 0.0926571, 3.056554, 1, 1, 1, 1, 1,
0.6995819, -0.809184, 1.372638, 1, 1, 1, 1, 1,
0.7061585, 0.8711575, 1.806255, 1, 1, 1, 1, 1,
0.7079529, 0.2695051, -0.09718532, 1, 1, 1, 1, 1,
0.7089435, 0.3576686, 0.9062973, 1, 1, 1, 1, 1,
0.7134612, 1.611842, 1.504498, 1, 1, 1, 1, 1,
0.7156056, -0.3190785, 2.387676, 1, 1, 1, 1, 1,
0.7164856, 1.80845, -0.3145587, 0, 0, 1, 1, 1,
0.7185469, -0.1432589, 0.5847508, 1, 0, 0, 1, 1,
0.7214771, 1.249955, -1.418816, 1, 0, 0, 1, 1,
0.7260444, 0.8908113, -0.9307575, 1, 0, 0, 1, 1,
0.7273269, -0.6200153, 1.396027, 1, 0, 0, 1, 1,
0.7289987, -1.383577, 1.007847, 1, 0, 0, 1, 1,
0.7297959, -0.2631969, 2.465604, 0, 0, 0, 1, 1,
0.7419058, 0.2254711, 0.1259067, 0, 0, 0, 1, 1,
0.7421428, -1.009416, 2.115906, 0, 0, 0, 1, 1,
0.745174, 0.3957802, 0.6196622, 0, 0, 0, 1, 1,
0.7509814, 0.08364492, 0.2651141, 0, 0, 0, 1, 1,
0.7526203, -0.87611, 2.759295, 0, 0, 0, 1, 1,
0.7636688, -0.8519158, 3.378089, 0, 0, 0, 1, 1,
0.7715815, -0.03827915, -0.05484322, 1, 1, 1, 1, 1,
0.7721609, -1.250282, 2.883797, 1, 1, 1, 1, 1,
0.7726091, -1.872585, 1.300611, 1, 1, 1, 1, 1,
0.7764536, -0.7989905, 3.072164, 1, 1, 1, 1, 1,
0.7814292, -1.723516, 2.095529, 1, 1, 1, 1, 1,
0.7867425, 1.049861, 0.9284163, 1, 1, 1, 1, 1,
0.7868041, -1.486795, 1.60427, 1, 1, 1, 1, 1,
0.7934282, 0.4000044, 1.378387, 1, 1, 1, 1, 1,
0.7949969, -1.2117, 1.043134, 1, 1, 1, 1, 1,
0.8000915, -0.2981832, 1.751359, 1, 1, 1, 1, 1,
0.8047505, 0.7141712, 0.7741698, 1, 1, 1, 1, 1,
0.8050082, 0.08477055, 1.460784, 1, 1, 1, 1, 1,
0.8055899, 0.3701699, 2.75611, 1, 1, 1, 1, 1,
0.8072812, -0.1710478, 2.767712, 1, 1, 1, 1, 1,
0.8142766, -1.496704, 2.298351, 1, 1, 1, 1, 1,
0.8163633, 1.43238, -0.3175944, 0, 0, 1, 1, 1,
0.8180353, -0.832967, 2.833636, 1, 0, 0, 1, 1,
0.8188823, 1.009647, -0.9149159, 1, 0, 0, 1, 1,
0.8196465, 2.529557, 2.818043, 1, 0, 0, 1, 1,
0.8249286, 0.345327, 2.045626, 1, 0, 0, 1, 1,
0.8262788, -0.5865126, 1.069371, 1, 0, 0, 1, 1,
0.8266101, 0.1303986, 0.6095851, 0, 0, 0, 1, 1,
0.8291438, -1.597192, 3.913118, 0, 0, 0, 1, 1,
0.8299029, 0.8273821, 1.497113, 0, 0, 0, 1, 1,
0.8312047, -1.384322, 2.3072, 0, 0, 0, 1, 1,
0.8335606, -0.3820593, 3.481148, 0, 0, 0, 1, 1,
0.8349684, 0.305452, 3.01503, 0, 0, 0, 1, 1,
0.8379843, 0.5837125, 0.6038617, 0, 0, 0, 1, 1,
0.8386509, -1.730211, 0.8757678, 1, 1, 1, 1, 1,
0.8408101, -0.9302398, 1.422669, 1, 1, 1, 1, 1,
0.8415594, -0.8380567, 0.411548, 1, 1, 1, 1, 1,
0.8416137, 0.0842815, -0.3362401, 1, 1, 1, 1, 1,
0.8434986, 0.9068653, 0.3247263, 1, 1, 1, 1, 1,
0.8450812, 0.6103411, 0.5553771, 1, 1, 1, 1, 1,
0.8476905, 0.2513117, 1.804882, 1, 1, 1, 1, 1,
0.8502758, -0.6181942, 1.48624, 1, 1, 1, 1, 1,
0.8521022, 0.1927007, 2.56201, 1, 1, 1, 1, 1,
0.8555802, 1.412404, -0.9407972, 1, 1, 1, 1, 1,
0.8585286, -1.355495, 2.715653, 1, 1, 1, 1, 1,
0.8611206, 0.2068824, 2.207921, 1, 1, 1, 1, 1,
0.8617008, -1.552984, 3.036864, 1, 1, 1, 1, 1,
0.863465, 1.607943, -0.6395365, 1, 1, 1, 1, 1,
0.8679335, -0.8317724, 1.469944, 1, 1, 1, 1, 1,
0.8682969, 0.4339631, 2.198765, 0, 0, 1, 1, 1,
0.8719627, -0.4928347, 3.529213, 1, 0, 0, 1, 1,
0.8726678, -0.5118319, 2.26668, 1, 0, 0, 1, 1,
0.8731744, -0.655502, 3.304749, 1, 0, 0, 1, 1,
0.8737937, -0.8719535, 0.7926444, 1, 0, 0, 1, 1,
0.881532, 0.9237561, -0.1576268, 1, 0, 0, 1, 1,
0.8867929, -1.218047, 1.639736, 0, 0, 0, 1, 1,
0.8872799, -1.177291, 3.270398, 0, 0, 0, 1, 1,
0.8956279, -2.363812, 3.195713, 0, 0, 0, 1, 1,
0.897474, 1.831581, 2.014011, 0, 0, 0, 1, 1,
0.8982708, -0.6930385, 1.354097, 0, 0, 0, 1, 1,
0.9002079, -1.051489, 3.041288, 0, 0, 0, 1, 1,
0.9008924, 0.3417697, 2.962249, 0, 0, 0, 1, 1,
0.9070309, -0.2187742, 1.364942, 1, 1, 1, 1, 1,
0.9096228, 0.399708, 1.46447, 1, 1, 1, 1, 1,
0.9129651, -2.130158, 4.258378, 1, 1, 1, 1, 1,
0.917875, 0.3804845, -0.6664977, 1, 1, 1, 1, 1,
0.9224986, -0.1325365, 1.015984, 1, 1, 1, 1, 1,
0.9314994, -0.1951008, 1.682649, 1, 1, 1, 1, 1,
0.9369119, 0.1389187, 0.8613588, 1, 1, 1, 1, 1,
0.9451804, 1.811402, 0.9196379, 1, 1, 1, 1, 1,
0.9478291, -0.5231772, 1.402614, 1, 1, 1, 1, 1,
0.9485362, 0.4792591, 2.131268, 1, 1, 1, 1, 1,
0.9552685, -0.5592545, 1.071728, 1, 1, 1, 1, 1,
0.9573769, 0.4087335, 0.4361308, 1, 1, 1, 1, 1,
0.9596152, -1.458038, 2.76627, 1, 1, 1, 1, 1,
0.9670808, 0.2323098, 0.2431971, 1, 1, 1, 1, 1,
0.9684711, 0.2291406, 2.156192, 1, 1, 1, 1, 1,
0.9716162, 1.492073, 1.21502, 0, 0, 1, 1, 1,
0.9752584, -0.3836016, 2.653222, 1, 0, 0, 1, 1,
0.9771033, 1.540938, -0.6097773, 1, 0, 0, 1, 1,
0.9788297, 1.117705, 0.881347, 1, 0, 0, 1, 1,
0.982164, -1.146385, 1.753037, 1, 0, 0, 1, 1,
0.9836571, 0.2046717, 0.4227271, 1, 0, 0, 1, 1,
0.9928551, 1.361769, -0.2538057, 0, 0, 0, 1, 1,
0.9931962, 0.4886509, 1.221732, 0, 0, 0, 1, 1,
0.9983315, -0.5112035, 3.627099, 0, 0, 0, 1, 1,
0.998855, -1.020411, 1.735279, 0, 0, 0, 1, 1,
1.000727, -1.500421, 1.637544, 0, 0, 0, 1, 1,
1.002966, -1.144887, 2.445978, 0, 0, 0, 1, 1,
1.011221, -0.5909595, 3.188946, 0, 0, 0, 1, 1,
1.011472, -0.8133159, 2.883646, 1, 1, 1, 1, 1,
1.012988, 0.9162125, 1.511876, 1, 1, 1, 1, 1,
1.021587, -1.442845, 2.220898, 1, 1, 1, 1, 1,
1.028816, -1.155453, 2.313529, 1, 1, 1, 1, 1,
1.029135, 1.185728, 0.6685072, 1, 1, 1, 1, 1,
1.029229, 0.6499759, 1.182382, 1, 1, 1, 1, 1,
1.033957, -1.251806, 4.30799, 1, 1, 1, 1, 1,
1.053292, 0.5973963, -0.03799644, 1, 1, 1, 1, 1,
1.058565, -0.5141736, 1.669306, 1, 1, 1, 1, 1,
1.059299, 0.6354609, 1.760947, 1, 1, 1, 1, 1,
1.068152, -1.695291, 3.526187, 1, 1, 1, 1, 1,
1.068899, 0.7017577, 2.105272, 1, 1, 1, 1, 1,
1.070336, -0.2660677, 2.346175, 1, 1, 1, 1, 1,
1.075839, -0.5187774, 1.23593, 1, 1, 1, 1, 1,
1.077243, -0.4141888, 1.123719, 1, 1, 1, 1, 1,
1.084735, -0.1403629, 2.878587, 0, 0, 1, 1, 1,
1.087599, 0.6783349, 0.6905752, 1, 0, 0, 1, 1,
1.091226, 1.088363, 1.243409, 1, 0, 0, 1, 1,
1.095163, -0.146439, 2.248585, 1, 0, 0, 1, 1,
1.109837, -0.6987178, 2.47223, 1, 0, 0, 1, 1,
1.11056, -1.408171, 2.716059, 1, 0, 0, 1, 1,
1.110638, 0.8443736, 1.000567, 0, 0, 0, 1, 1,
1.114315, 1.000282, 1.347746, 0, 0, 0, 1, 1,
1.126341, 1.242741, 2.188899, 0, 0, 0, 1, 1,
1.131245, -0.42894, 1.645618, 0, 0, 0, 1, 1,
1.149013, 1.084785, 0.9516208, 0, 0, 0, 1, 1,
1.150722, 0.5656363, 0.07556327, 0, 0, 0, 1, 1,
1.151917, 0.2028115, 0.9368498, 0, 0, 0, 1, 1,
1.158057, 1.579731, -0.8799517, 1, 1, 1, 1, 1,
1.158125, 1.529241, 3.156602, 1, 1, 1, 1, 1,
1.159331, 0.4231642, -0.3333023, 1, 1, 1, 1, 1,
1.16219, -0.1350431, 0.5572736, 1, 1, 1, 1, 1,
1.166139, -2.908454, 3.422168, 1, 1, 1, 1, 1,
1.178973, 0.9737736, 0.7523527, 1, 1, 1, 1, 1,
1.183539, 1.349869, -0.2537207, 1, 1, 1, 1, 1,
1.184732, 0.3373107, 1.542244, 1, 1, 1, 1, 1,
1.185228, 0.4010972, 1.69738, 1, 1, 1, 1, 1,
1.186555, 1.343042, 2.439949, 1, 1, 1, 1, 1,
1.192621, -1.180637, 3.127574, 1, 1, 1, 1, 1,
1.193961, 1.19414, 0.7824613, 1, 1, 1, 1, 1,
1.197641, -0.241241, 1.144456, 1, 1, 1, 1, 1,
1.219846, -0.1680377, 1.452376, 1, 1, 1, 1, 1,
1.219903, -0.1610022, 1.441668, 1, 1, 1, 1, 1,
1.22689, -0.8094701, 1.784286, 0, 0, 1, 1, 1,
1.231729, -0.1995002, 1.342062, 1, 0, 0, 1, 1,
1.233626, -2.005626, 0.4373735, 1, 0, 0, 1, 1,
1.23526, -1.007685, 3.579426, 1, 0, 0, 1, 1,
1.24115, 1.077392, 1.763775, 1, 0, 0, 1, 1,
1.242716, -1.002616, 3.647091, 1, 0, 0, 1, 1,
1.257025, 0.003760402, 1.0725, 0, 0, 0, 1, 1,
1.263556, -0.3277797, 1.95588, 0, 0, 0, 1, 1,
1.266584, -0.2370908, 1.54811, 0, 0, 0, 1, 1,
1.273633, 0.2408191, 3.769284, 0, 0, 0, 1, 1,
1.286144, -0.2883959, 2.632449, 0, 0, 0, 1, 1,
1.289979, 0.3441621, 2.23264, 0, 0, 0, 1, 1,
1.293762, 0.6434538, 1.260967, 0, 0, 0, 1, 1,
1.298607, -1.005083, 2.402495, 1, 1, 1, 1, 1,
1.302394, 1.097695, 0.3848858, 1, 1, 1, 1, 1,
1.303471, 0.7185068, 0.936148, 1, 1, 1, 1, 1,
1.304529, -0.05422376, 2.080681, 1, 1, 1, 1, 1,
1.308945, 0.8761881, 1.464092, 1, 1, 1, 1, 1,
1.311194, -0.8283664, 2.315879, 1, 1, 1, 1, 1,
1.313287, 1.976332, -0.300063, 1, 1, 1, 1, 1,
1.344867, -0.8109393, 1.073957, 1, 1, 1, 1, 1,
1.345313, -1.049221, 1.09769, 1, 1, 1, 1, 1,
1.357941, 0.06965253, 1.74528, 1, 1, 1, 1, 1,
1.361063, 0.1105697, 1.8416, 1, 1, 1, 1, 1,
1.366617, -0.5937644, -0.483332, 1, 1, 1, 1, 1,
1.368203, -0.8501022, 2.952265, 1, 1, 1, 1, 1,
1.385206, -0.3577682, 1.342116, 1, 1, 1, 1, 1,
1.386523, 0.1403912, 3.456801, 1, 1, 1, 1, 1,
1.388545, 1.11255, 1.56411, 0, 0, 1, 1, 1,
1.393741, 1.580287, 1.677626, 1, 0, 0, 1, 1,
1.395094, 1.248155, 0.4886183, 1, 0, 0, 1, 1,
1.406016, 1.687536, 0.5579475, 1, 0, 0, 1, 1,
1.417068, 0.01945955, 1.604389, 1, 0, 0, 1, 1,
1.417806, -1.225908, 3.32486, 1, 0, 0, 1, 1,
1.418695, 0.08804473, -0.01470638, 0, 0, 0, 1, 1,
1.43677, -1.135049, 1.435937, 0, 0, 0, 1, 1,
1.43878, 2.561845, -0.6744719, 0, 0, 0, 1, 1,
1.439374, 0.2779324, 0.02388068, 0, 0, 0, 1, 1,
1.441222, -0.5504961, 1.954407, 0, 0, 0, 1, 1,
1.452803, -0.3048129, 1.147455, 0, 0, 0, 1, 1,
1.455638, -0.2595447, 2.338295, 0, 0, 0, 1, 1,
1.457911, 1.592284, 1.476324, 1, 1, 1, 1, 1,
1.464977, 0.1775777, 1.248135, 1, 1, 1, 1, 1,
1.468848, 0.07747798, 0.5788937, 1, 1, 1, 1, 1,
1.487543, -1.255704, 1.396331, 1, 1, 1, 1, 1,
1.495202, -1.727405, 1.970182, 1, 1, 1, 1, 1,
1.502823, 0.170791, 1.015627, 1, 1, 1, 1, 1,
1.509243, -1.42374, 3.396737, 1, 1, 1, 1, 1,
1.513552, 0.9955173, -1.456049, 1, 1, 1, 1, 1,
1.513581, -0.09757352, 2.537257, 1, 1, 1, 1, 1,
1.527262, 1.862641, -0.2226495, 1, 1, 1, 1, 1,
1.532453, 0.5887434, 3.357579, 1, 1, 1, 1, 1,
1.534508, -1.158336, 1.336076, 1, 1, 1, 1, 1,
1.546053, 0.1476119, 2.758437, 1, 1, 1, 1, 1,
1.546904, 0.2805065, 1.711126, 1, 1, 1, 1, 1,
1.547353, 0.0699417, 2.999563, 1, 1, 1, 1, 1,
1.547571, 0.333124, 1.485645, 0, 0, 1, 1, 1,
1.56942, 2.015086, -1.130561, 1, 0, 0, 1, 1,
1.593912, -0.2770945, 1.191282, 1, 0, 0, 1, 1,
1.603533, -0.0853444, 1.26316, 1, 0, 0, 1, 1,
1.622733, -1.427703, 0.7871171, 1, 0, 0, 1, 1,
1.62915, 0.02437121, 1.491987, 1, 0, 0, 1, 1,
1.644353, -1.413792, 3.655167, 0, 0, 0, 1, 1,
1.650053, 0.9315326, 1.061823, 0, 0, 0, 1, 1,
1.655933, 0.1078847, 1.174217, 0, 0, 0, 1, 1,
1.658758, -0.03188526, 1.323216, 0, 0, 0, 1, 1,
1.66065, 1.355813, -0.01627479, 0, 0, 0, 1, 1,
1.672482, 0.9010108, 0.35913, 0, 0, 0, 1, 1,
1.705212, 0.2187137, 1.560308, 0, 0, 0, 1, 1,
1.706054, -0.004980317, 3.132569, 1, 1, 1, 1, 1,
1.758074, -0.9891723, 1.695014, 1, 1, 1, 1, 1,
1.762038, 0.4592713, 1.753042, 1, 1, 1, 1, 1,
1.789902, -0.3618989, 1.053216, 1, 1, 1, 1, 1,
1.833324, 1.088532, 0.3978084, 1, 1, 1, 1, 1,
1.846228, 0.06470425, 1.409326, 1, 1, 1, 1, 1,
1.846248, 0.980929, 1.255341, 1, 1, 1, 1, 1,
1.85444, -0.8800737, 2.125875, 1, 1, 1, 1, 1,
1.866446, 0.1940615, 2.182181, 1, 1, 1, 1, 1,
1.86982, -0.1782073, 0.1898653, 1, 1, 1, 1, 1,
1.884995, -1.041165, 0.2845446, 1, 1, 1, 1, 1,
1.904667, -0.5871825, 1.222177, 1, 1, 1, 1, 1,
1.929617, -0.05679579, 1.332818, 1, 1, 1, 1, 1,
1.944134, -2.678267, 2.916509, 1, 1, 1, 1, 1,
1.972048, 0.1093524, 2.145541, 1, 1, 1, 1, 1,
1.979367, 0.2374475, 1.92995, 0, 0, 1, 1, 1,
2.078394, 0.4658353, 1.443488, 1, 0, 0, 1, 1,
2.086393, -0.9379853, 1.915553, 1, 0, 0, 1, 1,
2.094301, -1.401038, 2.348818, 1, 0, 0, 1, 1,
2.144698, 0.3441889, 1.936399, 1, 0, 0, 1, 1,
2.15709, -0.6016247, 2.555801, 1, 0, 0, 1, 1,
2.21312, 0.1258748, 2.208469, 0, 0, 0, 1, 1,
2.216125, 0.1563093, 1.166976, 0, 0, 0, 1, 1,
2.24481, -0.1827047, 2.348004, 0, 0, 0, 1, 1,
2.277441, 0.9413589, 0.006618076, 0, 0, 0, 1, 1,
2.311982, -0.6601984, 2.579176, 0, 0, 0, 1, 1,
2.315193, 0.7202397, -0.8375822, 0, 0, 0, 1, 1,
2.430638, -0.312396, 1.528365, 0, 0, 0, 1, 1,
2.503313, 1.744769, 1.920535, 1, 1, 1, 1, 1,
2.619096, -0.6492881, 0.6120048, 1, 1, 1, 1, 1,
2.664722, 0.8090326, 0.6005395, 1, 1, 1, 1, 1,
2.803106, -1.881435, 2.805514, 1, 1, 1, 1, 1,
3.096589, 0.2339714, 1.623429, 1, 1, 1, 1, 1,
3.279702, -0.6684647, 3.984799, 1, 1, 1, 1, 1,
3.665476, -0.7944615, 3.36336, 1, 1, 1, 1, 1
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
var radius = 9.584414;
var distance = 33.66484;
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
mvMatrix.translate( -0.2874312, -0.05233562, -0.09373522 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66484);
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
