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
-2.897894, 0.06634795, -1.395893, 1, 0, 0, 1,
-2.673212, 0.8217259, -1.808729, 1, 0.007843138, 0, 1,
-2.563466, -0.5216832, -0.7804701, 1, 0.01176471, 0, 1,
-2.538614, 1.510177, -1.17139, 1, 0.01960784, 0, 1,
-2.500609, 0.6923931, -1.554912, 1, 0.02352941, 0, 1,
-2.479243, 0.3903669, -0.7705787, 1, 0.03137255, 0, 1,
-2.423265, 0.7729734, -0.2162626, 1, 0.03529412, 0, 1,
-2.418147, -0.6144789, -0.9411362, 1, 0.04313726, 0, 1,
-2.401377, 2.573955, -2.050916, 1, 0.04705882, 0, 1,
-2.37981, -0.8493815, -1.618171, 1, 0.05490196, 0, 1,
-2.329581, -1.093092, -1.427848, 1, 0.05882353, 0, 1,
-2.277713, -0.6146462, -2.293462, 1, 0.06666667, 0, 1,
-2.251987, 1.770336, -1.542434, 1, 0.07058824, 0, 1,
-2.211053, -0.188603, -2.475317, 1, 0.07843138, 0, 1,
-2.173348, 1.183335, -1.909302, 1, 0.08235294, 0, 1,
-2.165181, 0.2030483, -1.067907, 1, 0.09019608, 0, 1,
-2.163962, -0.6021177, -3.788003, 1, 0.09411765, 0, 1,
-2.155087, -0.2172638, -2.255916, 1, 0.1019608, 0, 1,
-2.134165, 0.5513579, 0.267143, 1, 0.1098039, 0, 1,
-2.11495, 0.6222578, -0.5616169, 1, 0.1137255, 0, 1,
-2.075879, 1.263859, -0.01421031, 1, 0.1215686, 0, 1,
-2.03541, -0.9391257, -1.029128, 1, 0.1254902, 0, 1,
-1.994204, 0.6417302, -1.884223, 1, 0.1333333, 0, 1,
-1.986273, -1.81856, -3.002195, 1, 0.1372549, 0, 1,
-1.97349, -0.1055217, -0.6025403, 1, 0.145098, 0, 1,
-1.966277, 0.3904391, -0.714309, 1, 0.1490196, 0, 1,
-1.931144, -1.591581, -1.872255, 1, 0.1568628, 0, 1,
-1.914604, -0.02533692, -2.979962, 1, 0.1607843, 0, 1,
-1.906261, 0.3434152, -1.596621, 1, 0.1686275, 0, 1,
-1.895499, -0.003566481, -1.447593, 1, 0.172549, 0, 1,
-1.888103, -0.9951485, -4.431983, 1, 0.1803922, 0, 1,
-1.86699, -0.01148361, -1.718896, 1, 0.1843137, 0, 1,
-1.844893, -1.748703, -3.257766, 1, 0.1921569, 0, 1,
-1.836617, -1.1861, -4.051064, 1, 0.1960784, 0, 1,
-1.780015, -0.3146105, -2.734258, 1, 0.2039216, 0, 1,
-1.775894, -1.445946, -2.283686, 1, 0.2117647, 0, 1,
-1.771871, -1.369626, -2.113804, 1, 0.2156863, 0, 1,
-1.765779, 0.8917072, -1.91066, 1, 0.2235294, 0, 1,
-1.764035, -0.1133744, -0.1080606, 1, 0.227451, 0, 1,
-1.762001, -0.08616462, -2.011444, 1, 0.2352941, 0, 1,
-1.713843, -1.096444, -2.570314, 1, 0.2392157, 0, 1,
-1.704877, -0.8498583, -2.172104, 1, 0.2470588, 0, 1,
-1.70014, 1.315264, -1.421341, 1, 0.2509804, 0, 1,
-1.652791, 2.587081, -1.730253, 1, 0.2588235, 0, 1,
-1.647298, 0.4236286, -2.085191, 1, 0.2627451, 0, 1,
-1.644371, -1.257068, -1.134579, 1, 0.2705882, 0, 1,
-1.643909, -0.3179613, -3.034394, 1, 0.2745098, 0, 1,
-1.630382, 0.0734837, -2.036507, 1, 0.282353, 0, 1,
-1.616472, -0.272543, -2.902232, 1, 0.2862745, 0, 1,
-1.608358, 1.409616, -0.4842419, 1, 0.2941177, 0, 1,
-1.590805, -0.7183909, -1.96794, 1, 0.3019608, 0, 1,
-1.562587, 0.630721, -2.245134, 1, 0.3058824, 0, 1,
-1.530685, 0.07888269, -1.19023, 1, 0.3137255, 0, 1,
-1.5218, 1.795452, 0.3343813, 1, 0.3176471, 0, 1,
-1.51568, -1.200121, -1.127062, 1, 0.3254902, 0, 1,
-1.504989, -1.184072, -3.127789, 1, 0.3294118, 0, 1,
-1.502978, -0.4747705, -2.386397, 1, 0.3372549, 0, 1,
-1.502775, -0.3627982, -2.268295, 1, 0.3411765, 0, 1,
-1.49942, -1.126371, -2.502744, 1, 0.3490196, 0, 1,
-1.498328, 0.709573, -0.7987846, 1, 0.3529412, 0, 1,
-1.488495, -1.040903, -2.515723, 1, 0.3607843, 0, 1,
-1.483926, 0.9628728, 0.1042852, 1, 0.3647059, 0, 1,
-1.482717, -0.6399902, -1.352198, 1, 0.372549, 0, 1,
-1.477111, -0.4830873, -2.24499, 1, 0.3764706, 0, 1,
-1.474844, -0.7964104, -1.044334, 1, 0.3843137, 0, 1,
-1.472274, 1.488525, -0.9117383, 1, 0.3882353, 0, 1,
-1.464132, 1.231717, -1.190522, 1, 0.3960784, 0, 1,
-1.45676, -1.4237, -2.822264, 1, 0.4039216, 0, 1,
-1.456132, -0.7754068, -3.639302, 1, 0.4078431, 0, 1,
-1.452367, 0.7810178, 0.4179406, 1, 0.4156863, 0, 1,
-1.435603, -0.8895581, -1.156023, 1, 0.4196078, 0, 1,
-1.429218, 1.734405, 0.1664168, 1, 0.427451, 0, 1,
-1.422331, -0.2049002, -2.298176, 1, 0.4313726, 0, 1,
-1.421385, 0.1792358, -1.248952, 1, 0.4392157, 0, 1,
-1.419773, -0.05928128, -1.082142, 1, 0.4431373, 0, 1,
-1.419033, 0.4698318, -1.657649, 1, 0.4509804, 0, 1,
-1.400473, -0.07846785, -2.353585, 1, 0.454902, 0, 1,
-1.389933, 0.6281769, -1.992638, 1, 0.4627451, 0, 1,
-1.374812, 0.4919108, -1.662818, 1, 0.4666667, 0, 1,
-1.374467, -2.785355, -2.509393, 1, 0.4745098, 0, 1,
-1.37292, 1.515627, -2.416308, 1, 0.4784314, 0, 1,
-1.357707, 0.4985949, -1.686945, 1, 0.4862745, 0, 1,
-1.346108, -1.601365, -2.78904, 1, 0.4901961, 0, 1,
-1.340309, -2.789374, -4.29564, 1, 0.4980392, 0, 1,
-1.329401, 1.115248, -1.838546, 1, 0.5058824, 0, 1,
-1.32137, 0.6320066, 0.1216465, 1, 0.509804, 0, 1,
-1.313996, 1.431467, -1.293231, 1, 0.5176471, 0, 1,
-1.31176, 1.579142, 0.2484772, 1, 0.5215687, 0, 1,
-1.310356, 1.203835, -1.187971, 1, 0.5294118, 0, 1,
-1.307279, 0.4792615, -2.641149, 1, 0.5333334, 0, 1,
-1.304229, 0.004052868, -1.479323, 1, 0.5411765, 0, 1,
-1.300786, 1.639296, 0.6649507, 1, 0.5450981, 0, 1,
-1.298994, 0.4519603, -1.366077, 1, 0.5529412, 0, 1,
-1.294318, -2.419902, -2.427191, 1, 0.5568628, 0, 1,
-1.289624, 1.004075, -1.017094, 1, 0.5647059, 0, 1,
-1.287601, 0.5130485, -1.423174, 1, 0.5686275, 0, 1,
-1.283594, -0.4255737, -3.222628, 1, 0.5764706, 0, 1,
-1.274228, 0.3343002, -1.581398, 1, 0.5803922, 0, 1,
-1.270277, 1.423899, -1.446684, 1, 0.5882353, 0, 1,
-1.269231, 0.2529857, -3.87837, 1, 0.5921569, 0, 1,
-1.267236, 0.4144191, 0.5550076, 1, 0.6, 0, 1,
-1.266202, -1.15504, -1.93501, 1, 0.6078432, 0, 1,
-1.263255, 1.175308, 0.5654083, 1, 0.6117647, 0, 1,
-1.257823, 0.200875, -1.595788, 1, 0.6196079, 0, 1,
-1.256065, 0.7768838, -0.1073685, 1, 0.6235294, 0, 1,
-1.254347, -0.3176902, -2.344556, 1, 0.6313726, 0, 1,
-1.232323, 1.236071, -2.946647, 1, 0.6352941, 0, 1,
-1.230331, 1.092272, -0.1613708, 1, 0.6431373, 0, 1,
-1.22965, -1.486629, -3.054509, 1, 0.6470588, 0, 1,
-1.216629, -0.6863669, -0.8694203, 1, 0.654902, 0, 1,
-1.214407, -1.437285, -3.74898, 1, 0.6588235, 0, 1,
-1.208542, 0.3060558, -1.405958, 1, 0.6666667, 0, 1,
-1.206573, -0.445373, -2.432787, 1, 0.6705883, 0, 1,
-1.201323, -0.4564642, 0.1984258, 1, 0.6784314, 0, 1,
-1.200563, 0.9478477, -1.599576, 1, 0.682353, 0, 1,
-1.200422, 0.608686, -0.07863077, 1, 0.6901961, 0, 1,
-1.19046, -1.117092, 0.4666764, 1, 0.6941177, 0, 1,
-1.181238, -0.1963082, -2.541433, 1, 0.7019608, 0, 1,
-1.171641, 0.7482716, -1.064804, 1, 0.7098039, 0, 1,
-1.164013, 0.6819137, -1.776372, 1, 0.7137255, 0, 1,
-1.163197, 0.4744109, -1.375563, 1, 0.7215686, 0, 1,
-1.160185, -0.3598264, -1.017786, 1, 0.7254902, 0, 1,
-1.158299, -0.6342447, -1.721518, 1, 0.7333333, 0, 1,
-1.156004, -0.9604263, -2.996912, 1, 0.7372549, 0, 1,
-1.151884, 0.2907059, -2.511011, 1, 0.7450981, 0, 1,
-1.150902, -0.8845761, -4.058124, 1, 0.7490196, 0, 1,
-1.134989, -1.135159, -0.9304559, 1, 0.7568628, 0, 1,
-1.132992, 0.2011909, 0.1050161, 1, 0.7607843, 0, 1,
-1.102237, -0.2947119, -0.9500604, 1, 0.7686275, 0, 1,
-1.091709, 0.401612, -0.386337, 1, 0.772549, 0, 1,
-1.08062, -1.403197, -4.294011, 1, 0.7803922, 0, 1,
-1.076617, 0.2103118, -2.276893, 1, 0.7843137, 0, 1,
-1.074415, -0.8077641, -1.529404, 1, 0.7921569, 0, 1,
-1.073751, 0.09435965, -1.582826, 1, 0.7960784, 0, 1,
-1.070263, -0.1418214, -0.457528, 1, 0.8039216, 0, 1,
-1.067996, 1.984371, 0.07883351, 1, 0.8117647, 0, 1,
-1.067892, -0.753176, -1.871011, 1, 0.8156863, 0, 1,
-1.062816, -0.438525, -2.449461, 1, 0.8235294, 0, 1,
-1.049285, 0.7087801, -3.625943, 1, 0.827451, 0, 1,
-1.047963, 0.6145804, -1.657942, 1, 0.8352941, 0, 1,
-1.027501, 1.457334, -1.779249, 1, 0.8392157, 0, 1,
-1.026301, 0.9585575, -1.977881, 1, 0.8470588, 0, 1,
-1.024317, -1.512761, -1.566409, 1, 0.8509804, 0, 1,
-1.012153, 0.3788894, -2.319476, 1, 0.8588235, 0, 1,
-1.011549, 1.658695, 0.8340451, 1, 0.8627451, 0, 1,
-1.010643, 0.2452095, -1.289846, 1, 0.8705882, 0, 1,
-1.00536, 0.2436268, -1.921017, 1, 0.8745098, 0, 1,
-1.001448, 0.005204567, -2.581118, 1, 0.8823529, 0, 1,
-0.9972151, 1.079819, 0.7338811, 1, 0.8862745, 0, 1,
-0.9926471, -0.8790406, -2.066061, 1, 0.8941177, 0, 1,
-0.9922367, 0.219524, -0.6484715, 1, 0.8980392, 0, 1,
-0.9915485, -0.4340852, -1.031161, 1, 0.9058824, 0, 1,
-0.989233, 0.4517035, -2.02507, 1, 0.9137255, 0, 1,
-0.9883043, 0.4950029, -2.562561, 1, 0.9176471, 0, 1,
-0.9845604, -0.1438224, -1.471543, 1, 0.9254902, 0, 1,
-0.9831101, 0.1284851, -1.606905, 1, 0.9294118, 0, 1,
-0.9785857, -0.2271747, -0.3717217, 1, 0.9372549, 0, 1,
-0.975102, 0.2158279, -0.6385044, 1, 0.9411765, 0, 1,
-0.9709896, 0.1022505, -1.820348, 1, 0.9490196, 0, 1,
-0.9708561, 1.939348, -1.649905, 1, 0.9529412, 0, 1,
-0.9680251, 0.2680936, -1.280328, 1, 0.9607843, 0, 1,
-0.9600056, 0.6040881, -1.258141, 1, 0.9647059, 0, 1,
-0.9559841, 1.148433, -0.3937421, 1, 0.972549, 0, 1,
-0.9514617, 0.09381078, -2.106493, 1, 0.9764706, 0, 1,
-0.9489379, 2.144151, -0.9583591, 1, 0.9843137, 0, 1,
-0.9416898, -0.9150472, -1.492991, 1, 0.9882353, 0, 1,
-0.9399011, 0.1144379, -1.751104, 1, 0.9960784, 0, 1,
-0.9356952, -0.9430861, -1.596535, 0.9960784, 1, 0, 1,
-0.9344333, -0.2802657, -3.020043, 0.9921569, 1, 0, 1,
-0.9295078, -0.2709066, -1.079357, 0.9843137, 1, 0, 1,
-0.9260408, 1.677575, 0.14873, 0.9803922, 1, 0, 1,
-0.9201714, -0.6231251, -3.527092, 0.972549, 1, 0, 1,
-0.9148238, -0.04572963, 0.1884076, 0.9686275, 1, 0, 1,
-0.9143828, 0.4399648, -1.242639, 0.9607843, 1, 0, 1,
-0.9138228, 1.57119, 2.486805, 0.9568627, 1, 0, 1,
-0.9108514, -1.194358, -3.249536, 0.9490196, 1, 0, 1,
-0.9080693, -2.112858, -2.666162, 0.945098, 1, 0, 1,
-0.8993407, -0.8973338, -0.2057188, 0.9372549, 1, 0, 1,
-0.8938457, 0.8419861, 0.09090532, 0.9333333, 1, 0, 1,
-0.8935012, -0.8617906, -2.971708, 0.9254902, 1, 0, 1,
-0.889375, 0.1534777, -0.9195851, 0.9215686, 1, 0, 1,
-0.8856079, 0.1378874, -1.402331, 0.9137255, 1, 0, 1,
-0.8824017, 0.8398919, -0.4751049, 0.9098039, 1, 0, 1,
-0.881537, 1.320306, -2.503745, 0.9019608, 1, 0, 1,
-0.8769097, -0.3203658, -0.695918, 0.8941177, 1, 0, 1,
-0.8766209, -0.7219427, -1.772848, 0.8901961, 1, 0, 1,
-0.8712663, -0.2888371, -2.529627, 0.8823529, 1, 0, 1,
-0.86897, 0.9572427, -0.9063936, 0.8784314, 1, 0, 1,
-0.8607135, 0.2017503, -2.303401, 0.8705882, 1, 0, 1,
-0.8595216, -1.869933, -2.273649, 0.8666667, 1, 0, 1,
-0.8564934, -0.2082478, -1.759855, 0.8588235, 1, 0, 1,
-0.8537604, -0.118632, -1.203861, 0.854902, 1, 0, 1,
-0.8474233, -1.469674, -2.53385, 0.8470588, 1, 0, 1,
-0.8465834, -0.7733169, -1.231173, 0.8431373, 1, 0, 1,
-0.8421083, -1.275318, -1.665789, 0.8352941, 1, 0, 1,
-0.8378738, -0.5082077, -0.8052706, 0.8313726, 1, 0, 1,
-0.8363776, 0.671576, -1.324802, 0.8235294, 1, 0, 1,
-0.8334614, -0.6229798, -2.901673, 0.8196079, 1, 0, 1,
-0.8301567, 0.2328698, -2.855875, 0.8117647, 1, 0, 1,
-0.8278595, 0.6776937, 0.0681773, 0.8078431, 1, 0, 1,
-0.826577, 0.1879869, 0.1370986, 0.8, 1, 0, 1,
-0.8232501, -1.31121, -2.900891, 0.7921569, 1, 0, 1,
-0.8186678, -0.6663719, -1.946254, 0.7882353, 1, 0, 1,
-0.8180273, -0.1481782, -1.822306, 0.7803922, 1, 0, 1,
-0.813983, -0.6418648, -0.8971326, 0.7764706, 1, 0, 1,
-0.8118947, 0.9275904, -1.456769, 0.7686275, 1, 0, 1,
-0.8116001, -0.4929328, -1.568744, 0.7647059, 1, 0, 1,
-0.8068146, 0.9613655, -1.642852, 0.7568628, 1, 0, 1,
-0.8064967, -2.168761, -3.250477, 0.7529412, 1, 0, 1,
-0.8053276, 0.4858042, -0.5353748, 0.7450981, 1, 0, 1,
-0.8010256, -0.9862771, -2.903966, 0.7411765, 1, 0, 1,
-0.8009745, 0.9329183, -0.3189002, 0.7333333, 1, 0, 1,
-0.8009107, 0.1227198, -1.215838, 0.7294118, 1, 0, 1,
-0.7990812, -2.048654, -3.855805, 0.7215686, 1, 0, 1,
-0.7985458, -1.177285, -2.821791, 0.7176471, 1, 0, 1,
-0.7981905, -0.5380395, -2.012601, 0.7098039, 1, 0, 1,
-0.7962214, -0.4489084, -1.961084, 0.7058824, 1, 0, 1,
-0.784754, 0.6984875, -1.226325, 0.6980392, 1, 0, 1,
-0.7825233, 1.576982, 0.1353282, 0.6901961, 1, 0, 1,
-0.782413, 0.8205013, -1.671426, 0.6862745, 1, 0, 1,
-0.7798074, 2.740045, -1.208686, 0.6784314, 1, 0, 1,
-0.77329, -0.3566372, -2.506411, 0.6745098, 1, 0, 1,
-0.7731925, 0.7913812, 0.9226105, 0.6666667, 1, 0, 1,
-0.7697718, -0.1979377, -3.065797, 0.6627451, 1, 0, 1,
-0.7687477, -0.001837286, -3.419377, 0.654902, 1, 0, 1,
-0.7628272, -1.163606, -4.729971, 0.6509804, 1, 0, 1,
-0.7566424, 0.3342623, -0.619146, 0.6431373, 1, 0, 1,
-0.7545999, -0.282432, -1.887848, 0.6392157, 1, 0, 1,
-0.7505214, -2.009811, -2.603942, 0.6313726, 1, 0, 1,
-0.750049, 0.4660583, -0.009569515, 0.627451, 1, 0, 1,
-0.7498655, 0.7833133, -1.324204, 0.6196079, 1, 0, 1,
-0.7491443, 1.28285, -0.8379917, 0.6156863, 1, 0, 1,
-0.7491101, -0.2947236, -1.930804, 0.6078432, 1, 0, 1,
-0.7467238, -1.213765, -2.52617, 0.6039216, 1, 0, 1,
-0.7456461, 0.7093865, -0.6916271, 0.5960785, 1, 0, 1,
-0.7359709, 0.2704068, -0.9799216, 0.5882353, 1, 0, 1,
-0.7289795, 0.8155685, 0.2848841, 0.5843138, 1, 0, 1,
-0.72811, -0.6541577, -1.896813, 0.5764706, 1, 0, 1,
-0.7259587, 1.115199, -0.6916435, 0.572549, 1, 0, 1,
-0.7255785, -1.394329, -2.640859, 0.5647059, 1, 0, 1,
-0.7241625, -0.4727333, -0.8078951, 0.5607843, 1, 0, 1,
-0.7240032, 1.160375, -0.5328035, 0.5529412, 1, 0, 1,
-0.7231562, -0.002427179, -2.35536, 0.5490196, 1, 0, 1,
-0.7228789, 0.7595278, -0.9808967, 0.5411765, 1, 0, 1,
-0.7137728, -0.3429409, -2.727175, 0.5372549, 1, 0, 1,
-0.7096235, 0.02340708, -3.938422, 0.5294118, 1, 0, 1,
-0.7032393, -1.295459, -2.475067, 0.5254902, 1, 0, 1,
-0.7030404, 0.4126389, -2.251554, 0.5176471, 1, 0, 1,
-0.7010539, -1.007781, -4.650619, 0.5137255, 1, 0, 1,
-0.6968898, 0.4505139, -0.8153082, 0.5058824, 1, 0, 1,
-0.685526, 0.0700033, -1.317802, 0.5019608, 1, 0, 1,
-0.6835475, -0.2404601, 0.5628184, 0.4941176, 1, 0, 1,
-0.681978, -0.1632398, -0.8236681, 0.4862745, 1, 0, 1,
-0.6818441, -0.06696919, -0.6306553, 0.4823529, 1, 0, 1,
-0.6758141, -1.03223, -3.05343, 0.4745098, 1, 0, 1,
-0.6711945, 0.7074912, 0.07016597, 0.4705882, 1, 0, 1,
-0.6707728, 2.042122, -0.08174032, 0.4627451, 1, 0, 1,
-0.6687722, 0.2672842, -0.9182009, 0.4588235, 1, 0, 1,
-0.6676375, 0.3205312, -0.2886635, 0.4509804, 1, 0, 1,
-0.6653407, 0.5973208, -1.409906, 0.4470588, 1, 0, 1,
-0.6574198, 0.1071574, -0.2709635, 0.4392157, 1, 0, 1,
-0.6560245, 1.128981, -0.09871472, 0.4352941, 1, 0, 1,
-0.6559014, -0.9242111, -1.740832, 0.427451, 1, 0, 1,
-0.6544861, 0.6401538, -0.4953625, 0.4235294, 1, 0, 1,
-0.6534027, 0.5316536, -0.8411669, 0.4156863, 1, 0, 1,
-0.6532453, 0.9892786, -1.098032, 0.4117647, 1, 0, 1,
-0.6447389, -0.2814518, -3.455848, 0.4039216, 1, 0, 1,
-0.6430286, -0.7369173, -1.842899, 0.3960784, 1, 0, 1,
-0.6407955, -1.037667, -2.576999, 0.3921569, 1, 0, 1,
-0.6406804, 0.4973294, -0.1798591, 0.3843137, 1, 0, 1,
-0.6372449, 0.2912552, -0.7286791, 0.3803922, 1, 0, 1,
-0.6365996, 0.380675, -0.8376323, 0.372549, 1, 0, 1,
-0.6364203, -0.3641211, -0.459793, 0.3686275, 1, 0, 1,
-0.6360919, 0.6424318, 0.9070637, 0.3607843, 1, 0, 1,
-0.6356687, -1.180409, -3.054822, 0.3568628, 1, 0, 1,
-0.6333356, 0.908199, 0.2596648, 0.3490196, 1, 0, 1,
-0.6321456, 0.2142205, -1.641728, 0.345098, 1, 0, 1,
-0.6320882, -0.5052096, -2.964064, 0.3372549, 1, 0, 1,
-0.6297182, 0.7005731, -1.452525, 0.3333333, 1, 0, 1,
-0.6249397, -0.07667661, -1.915367, 0.3254902, 1, 0, 1,
-0.6241273, -0.3851086, -2.268072, 0.3215686, 1, 0, 1,
-0.6238046, -0.4279242, -2.071822, 0.3137255, 1, 0, 1,
-0.6235713, -1.565711, -1.274749, 0.3098039, 1, 0, 1,
-0.6199648, 0.2524767, -1.508688, 0.3019608, 1, 0, 1,
-0.6196913, 0.3431318, -1.4252, 0.2941177, 1, 0, 1,
-0.6018646, -1.375292, -3.451782, 0.2901961, 1, 0, 1,
-0.599884, -0.4961516, -2.440033, 0.282353, 1, 0, 1,
-0.5973091, -1.313721, -2.674316, 0.2784314, 1, 0, 1,
-0.5955368, -1.632491, -1.85357, 0.2705882, 1, 0, 1,
-0.5933307, -0.2728921, -0.7979666, 0.2666667, 1, 0, 1,
-0.5833735, 0.2416085, -0.9531848, 0.2588235, 1, 0, 1,
-0.582153, 0.006883363, -1.491613, 0.254902, 1, 0, 1,
-0.5808736, -0.8666917, -0.180971, 0.2470588, 1, 0, 1,
-0.5726976, 1.118157, -0.5855668, 0.2431373, 1, 0, 1,
-0.5724155, -0.181652, -3.057213, 0.2352941, 1, 0, 1,
-0.5647821, 2.18736, 0.7111349, 0.2313726, 1, 0, 1,
-0.563224, -0.3096466, -2.69574, 0.2235294, 1, 0, 1,
-0.5593669, -0.690098, -2.522592, 0.2196078, 1, 0, 1,
-0.5542662, -1.188867, -2.970717, 0.2117647, 1, 0, 1,
-0.5471464, -0.7300704, -2.619205, 0.2078431, 1, 0, 1,
-0.544588, -1.126858, -1.431422, 0.2, 1, 0, 1,
-0.5431232, -1.313735, -3.259228, 0.1921569, 1, 0, 1,
-0.5356287, 2.389387, -0.2703993, 0.1882353, 1, 0, 1,
-0.5335131, 0.2015587, -1.653819, 0.1803922, 1, 0, 1,
-0.5325143, 0.5246313, -0.03111082, 0.1764706, 1, 0, 1,
-0.5315067, -1.473043, -4.276296, 0.1686275, 1, 0, 1,
-0.5304769, -1.606318, -0.5513932, 0.1647059, 1, 0, 1,
-0.5234378, -1.536307, -1.918511, 0.1568628, 1, 0, 1,
-0.5197641, -0.6919478, -1.907317, 0.1529412, 1, 0, 1,
-0.5168112, -0.9476426, -2.384335, 0.145098, 1, 0, 1,
-0.5038898, 0.8079379, -1.115827, 0.1411765, 1, 0, 1,
-0.4992469, -0.4758797, -2.44515, 0.1333333, 1, 0, 1,
-0.497853, 2.040707, -1.013862, 0.1294118, 1, 0, 1,
-0.4975612, 0.6867247, -2.771021, 0.1215686, 1, 0, 1,
-0.4905778, 0.5774228, -1.603042, 0.1176471, 1, 0, 1,
-0.4901146, -1.090653, -2.7838, 0.1098039, 1, 0, 1,
-0.4896652, 1.880679, -1.353803, 0.1058824, 1, 0, 1,
-0.4893473, 1.383618, -0.0745236, 0.09803922, 1, 0, 1,
-0.4861256, -0.1015146, -3.257269, 0.09019608, 1, 0, 1,
-0.4860678, 0.7135643, -1.106784, 0.08627451, 1, 0, 1,
-0.4841224, -0.7625056, -1.856592, 0.07843138, 1, 0, 1,
-0.483632, 1.049271, 0.3787644, 0.07450981, 1, 0, 1,
-0.4774174, 0.529225, -1.075423, 0.06666667, 1, 0, 1,
-0.4766139, -0.791107, -1.921504, 0.0627451, 1, 0, 1,
-0.4738638, 2.049181, 0.2299096, 0.05490196, 1, 0, 1,
-0.4709592, -0.6267301, -2.07427, 0.05098039, 1, 0, 1,
-0.4704827, -0.8729733, -4.650106, 0.04313726, 1, 0, 1,
-0.4682721, -0.7510727, -1.844785, 0.03921569, 1, 0, 1,
-0.4658014, -0.6343121, -3.071145, 0.03137255, 1, 0, 1,
-0.465381, 0.2945866, -2.568799, 0.02745098, 1, 0, 1,
-0.4532545, -0.1849916, -0.6176158, 0.01960784, 1, 0, 1,
-0.4516873, 0.547977, -0.5371183, 0.01568628, 1, 0, 1,
-0.451423, -0.006030947, 0.1601776, 0.007843138, 1, 0, 1,
-0.4511404, 0.4642846, -0.5112118, 0.003921569, 1, 0, 1,
-0.447278, -2.241973, -4.151624, 0, 1, 0.003921569, 1,
-0.4418372, 0.1068716, -0.6795852, 0, 1, 0.01176471, 1,
-0.4407743, 0.1416034, -1.293304, 0, 1, 0.01568628, 1,
-0.438607, -1.527307, -4.336145, 0, 1, 0.02352941, 1,
-0.4286139, 0.7107518, -0.3429969, 0, 1, 0.02745098, 1,
-0.422512, 0.8858506, -0.002794256, 0, 1, 0.03529412, 1,
-0.4223751, -1.657552, -3.452024, 0, 1, 0.03921569, 1,
-0.420104, 0.7405316, 0.169613, 0, 1, 0.04705882, 1,
-0.4193392, 0.3032828, -0.9980062, 0, 1, 0.05098039, 1,
-0.4187821, 0.6853869, -1.188063, 0, 1, 0.05882353, 1,
-0.4148657, -0.7848731, -1.852177, 0, 1, 0.0627451, 1,
-0.4146902, 1.609967, -0.553877, 0, 1, 0.07058824, 1,
-0.4129678, -0.6471025, -1.040814, 0, 1, 0.07450981, 1,
-0.4074939, 1.851644, 0.8815197, 0, 1, 0.08235294, 1,
-0.3969527, -0.2137623, -1.688476, 0, 1, 0.08627451, 1,
-0.3955127, 0.1973227, -1.71366, 0, 1, 0.09411765, 1,
-0.3883826, -0.1160552, -2.963902, 0, 1, 0.1019608, 1,
-0.3875063, 0.370445, -2.200114, 0, 1, 0.1058824, 1,
-0.3796867, -1.100048, -4.353582, 0, 1, 0.1137255, 1,
-0.3793659, 1.400599, -0.7552723, 0, 1, 0.1176471, 1,
-0.3639886, -0.1920577, -1.157543, 0, 1, 0.1254902, 1,
-0.3635367, -1.611835, -1.768706, 0, 1, 0.1294118, 1,
-0.3596511, -0.03441792, -1.246229, 0, 1, 0.1372549, 1,
-0.3586871, 0.1659395, -1.435993, 0, 1, 0.1411765, 1,
-0.3539958, -0.5243827, -2.727941, 0, 1, 0.1490196, 1,
-0.3478196, 1.143682, 0.8614755, 0, 1, 0.1529412, 1,
-0.3431834, 1.564341, -0.7767557, 0, 1, 0.1607843, 1,
-0.3389421, 0.9625576, 1.16743, 0, 1, 0.1647059, 1,
-0.335363, -0.03881253, -1.38998, 0, 1, 0.172549, 1,
-0.3336434, 2.316623, 1.452512, 0, 1, 0.1764706, 1,
-0.3296362, -2.344985, -1.434447, 0, 1, 0.1843137, 1,
-0.3270878, -0.6089904, -4.361791, 0, 1, 0.1882353, 1,
-0.3145991, -0.1146859, -0.5176231, 0, 1, 0.1960784, 1,
-0.3142676, -0.2484935, -1.759609, 0, 1, 0.2039216, 1,
-0.3134967, 1.482712, 0.6908214, 0, 1, 0.2078431, 1,
-0.3132896, -1.342384, -2.572039, 0, 1, 0.2156863, 1,
-0.3110203, 1.008799, -0.8211848, 0, 1, 0.2196078, 1,
-0.3103573, 0.2579398, -1.134759, 0, 1, 0.227451, 1,
-0.3074023, 1.375091, -0.9774184, 0, 1, 0.2313726, 1,
-0.3062199, -0.4684494, -3.575209, 0, 1, 0.2392157, 1,
-0.3057732, 0.1737265, -1.541213, 0, 1, 0.2431373, 1,
-0.2991089, 0.7693105, 1.144966, 0, 1, 0.2509804, 1,
-0.2979205, 0.9596205, -0.1914572, 0, 1, 0.254902, 1,
-0.2976552, -0.4571712, -1.916575, 0, 1, 0.2627451, 1,
-0.2946262, -0.3355638, -2.894347, 0, 1, 0.2666667, 1,
-0.2935114, -0.7966143, -3.62873, 0, 1, 0.2745098, 1,
-0.2933855, 0.7436882, -0.2040607, 0, 1, 0.2784314, 1,
-0.2919747, 1.10643, 0.1519419, 0, 1, 0.2862745, 1,
-0.2910277, 0.9519524, 0.7114108, 0, 1, 0.2901961, 1,
-0.2900342, 0.22102, 1.63432, 0, 1, 0.2980392, 1,
-0.2897106, -1.482837, -2.30142, 0, 1, 0.3058824, 1,
-0.2889979, 0.2488363, -0.9493921, 0, 1, 0.3098039, 1,
-0.2863342, 0.1054709, -1.110693, 0, 1, 0.3176471, 1,
-0.2855784, 0.490336, -1.083098, 0, 1, 0.3215686, 1,
-0.2837338, -0.01555955, -1.416726, 0, 1, 0.3294118, 1,
-0.2805757, 0.3209391, -0.3158406, 0, 1, 0.3333333, 1,
-0.2778388, 0.4995257, -2.465999, 0, 1, 0.3411765, 1,
-0.2741822, 0.2707491, -1.312336, 0, 1, 0.345098, 1,
-0.2698341, 0.4979645, -0.561211, 0, 1, 0.3529412, 1,
-0.2676056, 0.2828369, -0.2135742, 0, 1, 0.3568628, 1,
-0.2640609, 0.2502365, -0.7610418, 0, 1, 0.3647059, 1,
-0.2632954, -0.3435118, -3.261394, 0, 1, 0.3686275, 1,
-0.2626397, 0.3094301, -1.495966, 0, 1, 0.3764706, 1,
-0.2613758, -0.4783535, -3.353017, 0, 1, 0.3803922, 1,
-0.2583862, -0.6783661, -4.175741, 0, 1, 0.3882353, 1,
-0.2556665, 1.13619, 0.1861342, 0, 1, 0.3921569, 1,
-0.2543972, 1.959398, 0.02701695, 0, 1, 0.4, 1,
-0.2537484, 0.6030176, 1.413629, 0, 1, 0.4078431, 1,
-0.2491693, -1.362007, -3.113094, 0, 1, 0.4117647, 1,
-0.2483642, -0.04470979, -1.773188, 0, 1, 0.4196078, 1,
-0.2481726, -0.05615931, -2.806566, 0, 1, 0.4235294, 1,
-0.248031, 0.2590315, -1.767985, 0, 1, 0.4313726, 1,
-0.2403803, -0.5438088, -3.243518, 0, 1, 0.4352941, 1,
-0.2371455, -1.283686, -1.146236, 0, 1, 0.4431373, 1,
-0.2346588, -0.6484374, -1.005573, 0, 1, 0.4470588, 1,
-0.2328204, -0.7303638, -3.562704, 0, 1, 0.454902, 1,
-0.2306265, -0.7190785, -4.22135, 0, 1, 0.4588235, 1,
-0.22954, 1.079765, 0.518323, 0, 1, 0.4666667, 1,
-0.227889, -1.084344, -3.428305, 0, 1, 0.4705882, 1,
-0.2269888, 1.527456, -0.6791519, 0, 1, 0.4784314, 1,
-0.2268851, -1.595084, -1.795119, 0, 1, 0.4823529, 1,
-0.2255065, 0.912966, -1.163267, 0, 1, 0.4901961, 1,
-0.220142, 0.2667011, 0.03977112, 0, 1, 0.4941176, 1,
-0.2195074, 1.112602, 0.01786273, 0, 1, 0.5019608, 1,
-0.2190709, -0.9831542, -3.527727, 0, 1, 0.509804, 1,
-0.217158, 0.7858191, -0.383631, 0, 1, 0.5137255, 1,
-0.2165645, 1.292827, -1.162282, 0, 1, 0.5215687, 1,
-0.2163758, -0.6758237, -3.922186, 0, 1, 0.5254902, 1,
-0.2140911, -0.2835003, -3.094481, 0, 1, 0.5333334, 1,
-0.2135306, 1.331792, -0.831904, 0, 1, 0.5372549, 1,
-0.2117704, 0.9547659, -1.753135, 0, 1, 0.5450981, 1,
-0.2110466, -0.7216678, -3.914972, 0, 1, 0.5490196, 1,
-0.1990719, 0.5563065, -0.07761752, 0, 1, 0.5568628, 1,
-0.1898309, 0.08024261, -2.903287, 0, 1, 0.5607843, 1,
-0.1891171, 0.5586838, -0.3588255, 0, 1, 0.5686275, 1,
-0.1880428, 0.6875146, 0.6941593, 0, 1, 0.572549, 1,
-0.1835752, -0.1570302, -0.07834634, 0, 1, 0.5803922, 1,
-0.1829114, 0.09096403, -0.9192901, 0, 1, 0.5843138, 1,
-0.1824506, 1.017505, -2.129569, 0, 1, 0.5921569, 1,
-0.1811355, -0.01181023, -2.186735, 0, 1, 0.5960785, 1,
-0.1773506, -0.3801226, -2.704742, 0, 1, 0.6039216, 1,
-0.1771631, 0.1813599, 0.3081683, 0, 1, 0.6117647, 1,
-0.1743246, 1.097712, 0.3982911, 0, 1, 0.6156863, 1,
-0.1728367, -0.5847448, -1.973007, 0, 1, 0.6235294, 1,
-0.1715943, -0.06480142, -3.464891, 0, 1, 0.627451, 1,
-0.1709874, 2.387734, 1.34849, 0, 1, 0.6352941, 1,
-0.1704999, -1.43978, -3.375028, 0, 1, 0.6392157, 1,
-0.1698782, 0.8166039, -0.6337674, 0, 1, 0.6470588, 1,
-0.1647428, 1.282073, 0.4786775, 0, 1, 0.6509804, 1,
-0.1644032, 0.1399258, 0.4903311, 0, 1, 0.6588235, 1,
-0.1639278, 0.9463314, 1.287636, 0, 1, 0.6627451, 1,
-0.1611188, -0.4332437, -1.807737, 0, 1, 0.6705883, 1,
-0.159158, 1.248257, 0.1943106, 0, 1, 0.6745098, 1,
-0.1543601, -1.237089, -3.135, 0, 1, 0.682353, 1,
-0.1525062, 0.1876201, -1.406495, 0, 1, 0.6862745, 1,
-0.1500648, 0.7035137, -2.539263, 0, 1, 0.6941177, 1,
-0.1455632, -1.02238, -2.664389, 0, 1, 0.7019608, 1,
-0.1435924, -0.8905967, -2.858135, 0, 1, 0.7058824, 1,
-0.1431723, 1.201746, 0.2407087, 0, 1, 0.7137255, 1,
-0.140853, 1.563803, -0.4054798, 0, 1, 0.7176471, 1,
-0.1372744, -0.4246059, -2.77901, 0, 1, 0.7254902, 1,
-0.135652, -0.2998504, -4.130177, 0, 1, 0.7294118, 1,
-0.132256, 0.1192525, -1.088924, 0, 1, 0.7372549, 1,
-0.1302325, -0.3506787, -3.133388, 0, 1, 0.7411765, 1,
-0.1256691, 0.5511737, -0.2998222, 0, 1, 0.7490196, 1,
-0.1238108, 0.0855663, -1.191507, 0, 1, 0.7529412, 1,
-0.1194622, 0.01816235, -0.4815305, 0, 1, 0.7607843, 1,
-0.1189996, -1.282481, -2.000838, 0, 1, 0.7647059, 1,
-0.1161801, 0.07657151, -0.3125257, 0, 1, 0.772549, 1,
-0.115375, -0.5737779, -2.677712, 0, 1, 0.7764706, 1,
-0.1140114, -0.3033193, -1.826112, 0, 1, 0.7843137, 1,
-0.1117838, 0.5397438, 0.2282989, 0, 1, 0.7882353, 1,
-0.1110371, -1.238992, -2.632039, 0, 1, 0.7960784, 1,
-0.1100975, 0.4500437, -0.8667538, 0, 1, 0.8039216, 1,
-0.1077335, -0.857124, -3.772853, 0, 1, 0.8078431, 1,
-0.1061867, 2.0614, -0.4429107, 0, 1, 0.8156863, 1,
-0.1060646, 0.9278061, 0.2513249, 0, 1, 0.8196079, 1,
-0.1042016, 0.7059393, -0.9072397, 0, 1, 0.827451, 1,
-0.1024551, -0.9518039, -3.540352, 0, 1, 0.8313726, 1,
-0.09834149, 0.5533814, 0.6927117, 0, 1, 0.8392157, 1,
-0.0978512, -0.1708062, -1.445358, 0, 1, 0.8431373, 1,
-0.0933205, 0.7186635, -0.8565897, 0, 1, 0.8509804, 1,
-0.08939126, 0.2899562, -2.221744, 0, 1, 0.854902, 1,
-0.08904709, 0.3608271, 0.1264436, 0, 1, 0.8627451, 1,
-0.08558602, -0.9494264, -1.59621, 0, 1, 0.8666667, 1,
-0.0850242, -0.6817872, -3.530422, 0, 1, 0.8745098, 1,
-0.08344316, 0.6942924, 0.3890893, 0, 1, 0.8784314, 1,
-0.08245134, 0.9819392, -1.412801, 0, 1, 0.8862745, 1,
-0.0795253, -1.173784, -3.755893, 0, 1, 0.8901961, 1,
-0.0786531, 0.0501431, 0.8575912, 0, 1, 0.8980392, 1,
-0.0762139, 0.6981495, 0.6944609, 0, 1, 0.9058824, 1,
-0.07030526, -1.241772, -3.107457, 0, 1, 0.9098039, 1,
-0.06840834, -0.3708978, -2.495147, 0, 1, 0.9176471, 1,
-0.06821033, 1.505185, -0.6569124, 0, 1, 0.9215686, 1,
-0.06272988, -0.7026383, -3.3743, 0, 1, 0.9294118, 1,
-0.05822346, -0.5743834, -3.319412, 0, 1, 0.9333333, 1,
-0.05655281, 1.019302, 0.8743407, 0, 1, 0.9411765, 1,
-0.05521546, 0.5032844, -0.5163358, 0, 1, 0.945098, 1,
-0.05433926, 0.2150296, -1.862512, 0, 1, 0.9529412, 1,
-0.05369956, -0.5558883, -3.876565, 0, 1, 0.9568627, 1,
-0.04966575, 0.5672437, 1.517974, 0, 1, 0.9647059, 1,
-0.04334139, 0.510362, -0.602447, 0, 1, 0.9686275, 1,
-0.0401102, 0.9393325, -0.679611, 0, 1, 0.9764706, 1,
-0.03876393, 0.1283993, 0.01920234, 0, 1, 0.9803922, 1,
-0.03754546, -2.062876, -1.670529, 0, 1, 0.9882353, 1,
-0.03700383, 0.02016581, -1.952063, 0, 1, 0.9921569, 1,
-0.03604545, 0.3033693, 0.9373445, 0, 1, 1, 1,
-0.03529982, -1.740365, -4.329699, 0, 0.9921569, 1, 1,
-0.03348291, -0.3494677, -3.372315, 0, 0.9882353, 1, 1,
-0.03092868, -0.1934336, -2.409539, 0, 0.9803922, 1, 1,
-0.0291754, -1.103152, -1.738925, 0, 0.9764706, 1, 1,
-0.0250066, -0.1064461, -2.798711, 0, 0.9686275, 1, 1,
-0.02478851, -0.3153725, -4.129459, 0, 0.9647059, 1, 1,
-0.02463829, 1.374097, -0.7519491, 0, 0.9568627, 1, 1,
-0.0244313, -1.840203, -3.580446, 0, 0.9529412, 1, 1,
-0.02136401, 0.6281591, 1.447225, 0, 0.945098, 1, 1,
-0.01871762, -0.9360654, -2.544637, 0, 0.9411765, 1, 1,
-0.01447995, 0.13046, 1.71558, 0, 0.9333333, 1, 1,
-0.0124738, 1.866388, -0.1392042, 0, 0.9294118, 1, 1,
-0.01183944, -0.5285267, -2.374794, 0, 0.9215686, 1, 1,
-0.0114955, 0.04598814, 1.26309, 0, 0.9176471, 1, 1,
-0.00783468, -0.2873896, -4.259584, 0, 0.9098039, 1, 1,
0.0001942766, -0.1054059, 2.438071, 0, 0.9058824, 1, 1,
0.005849653, 1.134294, 1.736071, 0, 0.8980392, 1, 1,
0.01423423, 0.1339238, -2.316722, 0, 0.8901961, 1, 1,
0.01832621, 1.428402, 0.1882763, 0, 0.8862745, 1, 1,
0.01950064, -0.9873468, 3.137082, 0, 0.8784314, 1, 1,
0.0228598, 0.4275633, -0.4124735, 0, 0.8745098, 1, 1,
0.03038033, -0.9894578, 5.215181, 0, 0.8666667, 1, 1,
0.0327259, -1.2144, 3.471181, 0, 0.8627451, 1, 1,
0.03279308, 0.7589939, -1.27745, 0, 0.854902, 1, 1,
0.03599748, 1.7882, -0.8145171, 0, 0.8509804, 1, 1,
0.0363086, 0.2299239, -2.024712, 0, 0.8431373, 1, 1,
0.04052068, -0.9017543, 4.774602, 0, 0.8392157, 1, 1,
0.04188535, -1.451857, 3.29404, 0, 0.8313726, 1, 1,
0.04325279, 0.3710299, 0.6272115, 0, 0.827451, 1, 1,
0.04450354, -0.8781754, 2.885232, 0, 0.8196079, 1, 1,
0.04574761, 0.1356192, -0.4862427, 0, 0.8156863, 1, 1,
0.05080685, -0.6616382, 1.404927, 0, 0.8078431, 1, 1,
0.053269, 0.2413115, 0.3746268, 0, 0.8039216, 1, 1,
0.05550834, -1.798563, 4.459485, 0, 0.7960784, 1, 1,
0.05602885, 0.2297824, -0.2536762, 0, 0.7882353, 1, 1,
0.06183948, -0.5256944, 2.737406, 0, 0.7843137, 1, 1,
0.06669415, 1.096632, -0.8668883, 0, 0.7764706, 1, 1,
0.06836026, 0.761286, 0.4835577, 0, 0.772549, 1, 1,
0.06964948, 1.067355, 2.087325, 0, 0.7647059, 1, 1,
0.07022884, -0.1311214, 2.246332, 0, 0.7607843, 1, 1,
0.07024715, -0.5464588, 1.536021, 0, 0.7529412, 1, 1,
0.07227828, 0.7172227, -0.6996847, 0, 0.7490196, 1, 1,
0.07437196, -1.064282, 3.70295, 0, 0.7411765, 1, 1,
0.07507458, 1.672517, -1.367244, 0, 0.7372549, 1, 1,
0.0779198, 0.1136148, -0.04147388, 0, 0.7294118, 1, 1,
0.07824448, -0.1493205, 1.275991, 0, 0.7254902, 1, 1,
0.07898014, 0.2643068, -0.7151124, 0, 0.7176471, 1, 1,
0.08350454, -1.085121, 2.03293, 0, 0.7137255, 1, 1,
0.08668391, 1.516055, -1.248418, 0, 0.7058824, 1, 1,
0.08897507, -1.269573, 3.530905, 0, 0.6980392, 1, 1,
0.0928849, -0.3450337, 2.293509, 0, 0.6941177, 1, 1,
0.09543305, 0.5581912, -1.263138, 0, 0.6862745, 1, 1,
0.09546327, 0.5011553, -0.02818174, 0, 0.682353, 1, 1,
0.09638951, -1.213544, 3.710825, 0, 0.6745098, 1, 1,
0.09762809, -1.164354, 3.320937, 0, 0.6705883, 1, 1,
0.1013531, -1.500595, 3.197498, 0, 0.6627451, 1, 1,
0.101631, -0.06465349, 2.189139, 0, 0.6588235, 1, 1,
0.1037228, -1.93078, 2.104546, 0, 0.6509804, 1, 1,
0.1039752, -0.2805121, 2.319147, 0, 0.6470588, 1, 1,
0.1043112, 0.7465261, 0.9118362, 0, 0.6392157, 1, 1,
0.1053531, 0.1580084, 0.3864859, 0, 0.6352941, 1, 1,
0.1066439, 0.02559016, 0.6049839, 0, 0.627451, 1, 1,
0.1086989, 0.7899684, -2.67156, 0, 0.6235294, 1, 1,
0.1095974, 0.846984, -0.4076881, 0, 0.6156863, 1, 1,
0.1100259, 0.2032623, -0.04052638, 0, 0.6117647, 1, 1,
0.1107804, 1.068448, -1.190913, 0, 0.6039216, 1, 1,
0.111848, -0.1514546, 2.594813, 0, 0.5960785, 1, 1,
0.1141663, 1.593627, 0.04795356, 0, 0.5921569, 1, 1,
0.1148056, 2.609135, 0.2458969, 0, 0.5843138, 1, 1,
0.1152891, -0.3684302, 1.917614, 0, 0.5803922, 1, 1,
0.1168112, 0.1373589, 0.738602, 0, 0.572549, 1, 1,
0.1229073, 0.2655945, 0.3225239, 0, 0.5686275, 1, 1,
0.1247619, 1.55356, 0.9132541, 0, 0.5607843, 1, 1,
0.1377299, -0.6045789, 1.915651, 0, 0.5568628, 1, 1,
0.138563, -1.291006, 3.804814, 0, 0.5490196, 1, 1,
0.1395812, -0.9069508, 2.735833, 0, 0.5450981, 1, 1,
0.1435262, -0.9075506, 3.193199, 0, 0.5372549, 1, 1,
0.1492977, 0.9561649, -1.74241, 0, 0.5333334, 1, 1,
0.1513536, 0.093265, 1.799606, 0, 0.5254902, 1, 1,
0.1519109, 1.590005, -0.3423834, 0, 0.5215687, 1, 1,
0.1546083, 0.5553089, 0.6276221, 0, 0.5137255, 1, 1,
0.1697078, -1.113171, 3.924165, 0, 0.509804, 1, 1,
0.1744999, -1.347303, 3.823841, 0, 0.5019608, 1, 1,
0.1751645, 0.6087948, 0.6795847, 0, 0.4941176, 1, 1,
0.1784868, 0.2060449, 1.146606, 0, 0.4901961, 1, 1,
0.1811258, -0.5901215, 4.32129, 0, 0.4823529, 1, 1,
0.1847151, 0.5957261, 0.1841347, 0, 0.4784314, 1, 1,
0.1887368, 0.1130841, 0.8303589, 0, 0.4705882, 1, 1,
0.1938744, -0.6592269, 3.84163, 0, 0.4666667, 1, 1,
0.2034694, 0.9212121, -0.5771057, 0, 0.4588235, 1, 1,
0.2128406, -0.1112096, 3.047507, 0, 0.454902, 1, 1,
0.2144068, -1.100352, 2.153111, 0, 0.4470588, 1, 1,
0.2148433, 2.225037, 1.025319, 0, 0.4431373, 1, 1,
0.2185861, -0.8631641, 2.678243, 0, 0.4352941, 1, 1,
0.2332961, -0.2959606, 2.444846, 0, 0.4313726, 1, 1,
0.2335309, -0.7331836, 2.776827, 0, 0.4235294, 1, 1,
0.2341193, -0.7728349, 3.577511, 0, 0.4196078, 1, 1,
0.2415131, 0.7110228, 1.144325, 0, 0.4117647, 1, 1,
0.2438334, -0.2357306, 3.379635, 0, 0.4078431, 1, 1,
0.2475102, 0.134174, 1.379192, 0, 0.4, 1, 1,
0.2495383, 1.206052, -0.8833054, 0, 0.3921569, 1, 1,
0.2519245, 0.6099815, 0.8952452, 0, 0.3882353, 1, 1,
0.2606928, -1.608341, 2.917375, 0, 0.3803922, 1, 1,
0.2607183, 1.254236, 1.202232, 0, 0.3764706, 1, 1,
0.2676124, -0.8946077, 2.789098, 0, 0.3686275, 1, 1,
0.2723421, -0.5273024, 2.225252, 0, 0.3647059, 1, 1,
0.2750824, -0.5970193, 3.314189, 0, 0.3568628, 1, 1,
0.277412, -1.226421, 2.707728, 0, 0.3529412, 1, 1,
0.2819321, -0.4032037, 1.814917, 0, 0.345098, 1, 1,
0.2839729, 0.4285655, 0.6642684, 0, 0.3411765, 1, 1,
0.2905745, -1.002134, 2.131823, 0, 0.3333333, 1, 1,
0.3054814, -0.6051798, 0.7921966, 0, 0.3294118, 1, 1,
0.3070734, -0.08821909, 3.151527, 0, 0.3215686, 1, 1,
0.3082275, 0.6853128, 1.618567, 0, 0.3176471, 1, 1,
0.3118008, -0.3417506, 2.32762, 0, 0.3098039, 1, 1,
0.3141452, -0.5156621, 1.395149, 0, 0.3058824, 1, 1,
0.3141698, -0.4877042, 2.159405, 0, 0.2980392, 1, 1,
0.3146098, -0.4001618, 2.914521, 0, 0.2901961, 1, 1,
0.3151035, -0.6844323, 1.854328, 0, 0.2862745, 1, 1,
0.3163158, -0.06679767, 1.852835, 0, 0.2784314, 1, 1,
0.3185404, -1.006106, 2.99354, 0, 0.2745098, 1, 1,
0.3199455, 0.4582352, 1.339418, 0, 0.2666667, 1, 1,
0.3231182, 1.781514, -0.5026823, 0, 0.2627451, 1, 1,
0.3268246, -0.5427478, 3.108937, 0, 0.254902, 1, 1,
0.3299719, 0.03654182, 1.293389, 0, 0.2509804, 1, 1,
0.3352494, -0.3506442, 3.315474, 0, 0.2431373, 1, 1,
0.3356044, 2.080836, 2.211462, 0, 0.2392157, 1, 1,
0.336239, -0.2633985, 0.7113503, 0, 0.2313726, 1, 1,
0.3420361, -0.6570632, 2.491272, 0, 0.227451, 1, 1,
0.3526071, -0.370546, 3.380416, 0, 0.2196078, 1, 1,
0.3539244, -2.619836, 2.518394, 0, 0.2156863, 1, 1,
0.3589587, -0.59917, 3.848, 0, 0.2078431, 1, 1,
0.3628821, 0.4362448, 0.2645716, 0, 0.2039216, 1, 1,
0.363157, 1.680264, 1.39813, 0, 0.1960784, 1, 1,
0.3639048, -0.07046521, 2.948305, 0, 0.1882353, 1, 1,
0.3641008, 1.077268, 0.4195876, 0, 0.1843137, 1, 1,
0.371914, -1.08364, 4.080199, 0, 0.1764706, 1, 1,
0.3740148, 0.6261932, 1.105456, 0, 0.172549, 1, 1,
0.3748614, -0.08963234, 2.276723, 0, 0.1647059, 1, 1,
0.3751454, 0.5250471, 1.572596, 0, 0.1607843, 1, 1,
0.3759512, 0.9456298, -2.005777, 0, 0.1529412, 1, 1,
0.3784299, 0.4566012, 2.25559, 0, 0.1490196, 1, 1,
0.3865525, -1.882613, 1.989863, 0, 0.1411765, 1, 1,
0.3888288, 0.8243966, 0.4137743, 0, 0.1372549, 1, 1,
0.4029604, 0.5096121, 1.303937, 0, 0.1294118, 1, 1,
0.4031099, 0.8426608, -0.1211132, 0, 0.1254902, 1, 1,
0.405981, -1.963976, 3.446027, 0, 0.1176471, 1, 1,
0.4107198, -0.4140427, 2.952543, 0, 0.1137255, 1, 1,
0.4176732, 0.3157024, -1.388202, 0, 0.1058824, 1, 1,
0.4184702, 0.4132074, 0.4350614, 0, 0.09803922, 1, 1,
0.4202869, -0.8570348, 1.988212, 0, 0.09411765, 1, 1,
0.4205219, -0.2068706, 2.60821, 0, 0.08627451, 1, 1,
0.4218476, 0.4441755, 1.596871, 0, 0.08235294, 1, 1,
0.4263062, -0.7311117, 1.85507, 0, 0.07450981, 1, 1,
0.4269953, -2.472196, 3.679216, 0, 0.07058824, 1, 1,
0.431363, -1.151267, 1.058078, 0, 0.0627451, 1, 1,
0.4322286, -0.2142013, 3.994321, 0, 0.05882353, 1, 1,
0.4437995, -0.07212385, 1.928535, 0, 0.05098039, 1, 1,
0.4505427, 1.686146, 0.9455875, 0, 0.04705882, 1, 1,
0.454562, 1.73781, 0.8823791, 0, 0.03921569, 1, 1,
0.4578207, 0.7770841, 0.834676, 0, 0.03529412, 1, 1,
0.4585222, -0.03534208, 0.3630422, 0, 0.02745098, 1, 1,
0.4588624, -2.220281, 1.031324, 0, 0.02352941, 1, 1,
0.4596844, 0.7147447, -1.748337, 0, 0.01568628, 1, 1,
0.4622672, -0.8126961, 3.611035, 0, 0.01176471, 1, 1,
0.4684875, -0.09372076, 2.821074, 0, 0.003921569, 1, 1,
0.4715171, -0.6600147, 2.360511, 0.003921569, 0, 1, 1,
0.4730929, 0.5491455, 1.687848, 0.007843138, 0, 1, 1,
0.477346, -0.1928031, 0.6532859, 0.01568628, 0, 1, 1,
0.484352, 0.5324309, 2.280805, 0.01960784, 0, 1, 1,
0.4864124, -0.2226427, 2.213106, 0.02745098, 0, 1, 1,
0.4871719, -1.281959, 2.794344, 0.03137255, 0, 1, 1,
0.4874021, -0.2297353, 1.092924, 0.03921569, 0, 1, 1,
0.4878614, -2.010288, 3.031511, 0.04313726, 0, 1, 1,
0.4899009, 0.222137, 0.9223748, 0.05098039, 0, 1, 1,
0.4905493, 0.5254691, 1.481946, 0.05490196, 0, 1, 1,
0.4937998, 0.2679032, 0.09381159, 0.0627451, 0, 1, 1,
0.4977832, -0.7097351, 1.471056, 0.06666667, 0, 1, 1,
0.5036796, 0.968652, 0.3756103, 0.07450981, 0, 1, 1,
0.5042883, 1.407161, 1.963245, 0.07843138, 0, 1, 1,
0.511741, 1.240268, 0.7638192, 0.08627451, 0, 1, 1,
0.5117866, 0.4701256, 0.1680742, 0.09019608, 0, 1, 1,
0.5135964, 0.6243868, 0.4684647, 0.09803922, 0, 1, 1,
0.5142912, 0.4725668, 0.661051, 0.1058824, 0, 1, 1,
0.51635, -0.4755779, 1.973205, 0.1098039, 0, 1, 1,
0.5194039, -1.220339, 0.8390656, 0.1176471, 0, 1, 1,
0.5204532, -1.465642, 4.029841, 0.1215686, 0, 1, 1,
0.5208958, -1.209426, 2.884459, 0.1294118, 0, 1, 1,
0.5315011, 0.4801049, 2.783539, 0.1333333, 0, 1, 1,
0.532975, -0.8616827, 1.749544, 0.1411765, 0, 1, 1,
0.5334259, -1.246446, 1.890491, 0.145098, 0, 1, 1,
0.5346162, 1.210357, 0.8639367, 0.1529412, 0, 1, 1,
0.5401921, 0.6115319, 1.204207, 0.1568628, 0, 1, 1,
0.5413283, 0.7611603, -1.621585, 0.1647059, 0, 1, 1,
0.5432398, -1.943107, 3.788394, 0.1686275, 0, 1, 1,
0.5434982, 0.4285084, 1.767343, 0.1764706, 0, 1, 1,
0.5475494, -0.3504972, 1.735586, 0.1803922, 0, 1, 1,
0.5496499, 1.171351, 0.3200648, 0.1882353, 0, 1, 1,
0.5540604, 0.2593436, 2.727489, 0.1921569, 0, 1, 1,
0.5685132, 0.3034869, -0.7675174, 0.2, 0, 1, 1,
0.5794945, -1.362264, 2.386074, 0.2078431, 0, 1, 1,
0.5807183, 2.297619, 2.025949, 0.2117647, 0, 1, 1,
0.5815595, 0.5743409, -0.2035111, 0.2196078, 0, 1, 1,
0.5827677, -0.1421784, 0.3227805, 0.2235294, 0, 1, 1,
0.5843358, -0.6050217, 0.4616255, 0.2313726, 0, 1, 1,
0.5894622, -0.2077492, 2.367953, 0.2352941, 0, 1, 1,
0.5925747, -1.141245, 3.831837, 0.2431373, 0, 1, 1,
0.5934191, 0.08466832, -0.6450352, 0.2470588, 0, 1, 1,
0.59407, -0.4369823, 2.022867, 0.254902, 0, 1, 1,
0.5970429, 0.7588379, 0.6326545, 0.2588235, 0, 1, 1,
0.599712, 2.007276, 0.6631072, 0.2666667, 0, 1, 1,
0.6001346, -0.8438014, 2.66571, 0.2705882, 0, 1, 1,
0.6015211, -2.332733, 3.410381, 0.2784314, 0, 1, 1,
0.607176, -1.173489, 2.472911, 0.282353, 0, 1, 1,
0.6077129, 0.979634, 1.934506, 0.2901961, 0, 1, 1,
0.6108489, -1.591896, 2.76125, 0.2941177, 0, 1, 1,
0.6210706, 0.2683348, 2.383986, 0.3019608, 0, 1, 1,
0.6221424, -0.2958479, 1.130616, 0.3098039, 0, 1, 1,
0.6235924, 0.2050099, 0.5219463, 0.3137255, 0, 1, 1,
0.6249101, 1.412824, 0.7066379, 0.3215686, 0, 1, 1,
0.6262017, -1.62392, 1.408826, 0.3254902, 0, 1, 1,
0.6270454, -0.9447895, 3.281758, 0.3333333, 0, 1, 1,
0.6299881, 0.5912409, 1.311623, 0.3372549, 0, 1, 1,
0.6301871, 0.7045139, 0.5397856, 0.345098, 0, 1, 1,
0.6312871, -0.04522532, 0.6516893, 0.3490196, 0, 1, 1,
0.6363776, 1.264626, -0.1047967, 0.3568628, 0, 1, 1,
0.6392429, 1.45285, -1.272535, 0.3607843, 0, 1, 1,
0.640003, -0.8141561, 3.244745, 0.3686275, 0, 1, 1,
0.6437183, 0.4034446, 0.5074736, 0.372549, 0, 1, 1,
0.6443266, -0.02246856, 1.862532, 0.3803922, 0, 1, 1,
0.6445785, 1.588195, -0.2279407, 0.3843137, 0, 1, 1,
0.6512098, 1.35419, 1.836463, 0.3921569, 0, 1, 1,
0.6512918, -0.2398123, 1.255843, 0.3960784, 0, 1, 1,
0.6559904, -1.404531, 2.276044, 0.4039216, 0, 1, 1,
0.6624255, 0.4878576, -0.1009961, 0.4117647, 0, 1, 1,
0.662789, -0.09710509, 2.309864, 0.4156863, 0, 1, 1,
0.6631596, 1.63933, 0.08478267, 0.4235294, 0, 1, 1,
0.665436, 0.3763439, -0.8054246, 0.427451, 0, 1, 1,
0.673411, 1.255963, 0.7984438, 0.4352941, 0, 1, 1,
0.6788458, 1.137639, 2.320919, 0.4392157, 0, 1, 1,
0.6805456, -0.4909795, 3.18982, 0.4470588, 0, 1, 1,
0.695102, 0.08324454, 1.409, 0.4509804, 0, 1, 1,
0.6994602, 1.039688, 1.365354, 0.4588235, 0, 1, 1,
0.6996426, 1.031541, 1.524736, 0.4627451, 0, 1, 1,
0.7011145, 2.118165, 1.013081, 0.4705882, 0, 1, 1,
0.7013806, -0.1113831, 2.085959, 0.4745098, 0, 1, 1,
0.7085035, -2.307159, 1.607562, 0.4823529, 0, 1, 1,
0.7088038, 0.1539294, 1.305908, 0.4862745, 0, 1, 1,
0.7095028, 0.3070413, -0.5861892, 0.4941176, 0, 1, 1,
0.7101123, -2.002775, 4.025225, 0.5019608, 0, 1, 1,
0.7102289, 0.9486139, 0.6722379, 0.5058824, 0, 1, 1,
0.7185182, 2.056563, 0.03777658, 0.5137255, 0, 1, 1,
0.7188465, 1.004087, -0.2574578, 0.5176471, 0, 1, 1,
0.7235604, 0.9534653, 2.404205, 0.5254902, 0, 1, 1,
0.7292265, -0.2614976, 1.622217, 0.5294118, 0, 1, 1,
0.7308918, -0.9509247, 2.827559, 0.5372549, 0, 1, 1,
0.7377432, 0.0238139, 2.721167, 0.5411765, 0, 1, 1,
0.7393082, -1.251683, 2.529248, 0.5490196, 0, 1, 1,
0.7408453, -0.525755, 3.451736, 0.5529412, 0, 1, 1,
0.7411432, 0.3848942, 2.702723, 0.5607843, 0, 1, 1,
0.744045, -0.3497925, 3.062212, 0.5647059, 0, 1, 1,
0.7449989, -0.9970393, 3.607039, 0.572549, 0, 1, 1,
0.7452129, -2.204949, 3.229968, 0.5764706, 0, 1, 1,
0.7466512, -0.4176818, 0.9599955, 0.5843138, 0, 1, 1,
0.7514786, 0.4470667, 1.169463, 0.5882353, 0, 1, 1,
0.7551006, 1.338483, 0.9904878, 0.5960785, 0, 1, 1,
0.7563937, 0.3324068, 1.609094, 0.6039216, 0, 1, 1,
0.7571187, -1.427449, 1.763905, 0.6078432, 0, 1, 1,
0.7675532, 0.4975003, -0.1712638, 0.6156863, 0, 1, 1,
0.7708132, 0.5843153, 0.6711872, 0.6196079, 0, 1, 1,
0.7711549, -0.7585204, 1.641806, 0.627451, 0, 1, 1,
0.7788352, -1.732222, 3.119539, 0.6313726, 0, 1, 1,
0.7820241, -0.7438774, 5.04463, 0.6392157, 0, 1, 1,
0.7875397, 1.239708, 0.7680089, 0.6431373, 0, 1, 1,
0.7903717, 0.09057403, 0.3085826, 0.6509804, 0, 1, 1,
0.7927796, -0.149445, 1.142254, 0.654902, 0, 1, 1,
0.7980579, 0.8848233, 0.2529493, 0.6627451, 0, 1, 1,
0.7987366, 2.603713, -0.6537468, 0.6666667, 0, 1, 1,
0.7990068, -2.183184, 2.658403, 0.6745098, 0, 1, 1,
0.8016532, -2.283313, 2.170577, 0.6784314, 0, 1, 1,
0.8023909, 0.2155772, 2.02224, 0.6862745, 0, 1, 1,
0.8026347, 1.122337, -0.8825984, 0.6901961, 0, 1, 1,
0.80488, 1.424891, -0.713284, 0.6980392, 0, 1, 1,
0.8142496, 1.061681, 1.29565, 0.7058824, 0, 1, 1,
0.8154317, 1.294674, 0.9156141, 0.7098039, 0, 1, 1,
0.8183013, -0.2486253, 0.510498, 0.7176471, 0, 1, 1,
0.8292674, 0.6153702, 1.077675, 0.7215686, 0, 1, 1,
0.8307981, -0.4815022, 1.303996, 0.7294118, 0, 1, 1,
0.83092, -1.097828, 1.390494, 0.7333333, 0, 1, 1,
0.8310733, 0.6873466, 0.3203184, 0.7411765, 0, 1, 1,
0.8330547, -0.7923518, 3.735175, 0.7450981, 0, 1, 1,
0.8445675, -1.309905, 2.804899, 0.7529412, 0, 1, 1,
0.8450567, 2.319384, 1.325334, 0.7568628, 0, 1, 1,
0.8479551, -1.627161, 3.513585, 0.7647059, 0, 1, 1,
0.8485774, -1.062698, 2.994054, 0.7686275, 0, 1, 1,
0.848834, -1.141838, 3.664809, 0.7764706, 0, 1, 1,
0.8497477, 1.674929, 0.566895, 0.7803922, 0, 1, 1,
0.8541186, -1.051126, 2.035943, 0.7882353, 0, 1, 1,
0.8561466, -0.9753195, 3.479644, 0.7921569, 0, 1, 1,
0.8613045, -0.2606989, 1.797401, 0.8, 0, 1, 1,
0.8629208, -1.274711, 3.435857, 0.8078431, 0, 1, 1,
0.8631812, -1.572836, 2.602658, 0.8117647, 0, 1, 1,
0.870122, -3.406498, 1.141705, 0.8196079, 0, 1, 1,
0.8706723, 1.292644, 0.8805137, 0.8235294, 0, 1, 1,
0.870932, 0.2892288, 3.020763, 0.8313726, 0, 1, 1,
0.8723105, 0.9569933, 1.553611, 0.8352941, 0, 1, 1,
0.8745509, -0.6436775, 0.881911, 0.8431373, 0, 1, 1,
0.8753271, -0.6718447, 1.750881, 0.8470588, 0, 1, 1,
0.8781636, 0.2318016, 0.5102943, 0.854902, 0, 1, 1,
0.8821303, -0.6275113, 0.5205529, 0.8588235, 0, 1, 1,
0.8861547, -0.2691274, 1.956276, 0.8666667, 0, 1, 1,
0.8873546, -0.419531, 1.049114, 0.8705882, 0, 1, 1,
0.8993054, 0.773994, -0.07624794, 0.8784314, 0, 1, 1,
0.9051375, 0.02227868, 1.740673, 0.8823529, 0, 1, 1,
0.9066992, -1.655755, 1.062546, 0.8901961, 0, 1, 1,
0.9074895, 0.5004589, 0.1214747, 0.8941177, 0, 1, 1,
0.913782, -1.212597, 0.456589, 0.9019608, 0, 1, 1,
0.92403, -0.6335061, 2.865332, 0.9098039, 0, 1, 1,
0.9246317, 1.331355, 1.664526, 0.9137255, 0, 1, 1,
0.925577, -0.811884, 2.394693, 0.9215686, 0, 1, 1,
0.9266341, -1.059527, 2.575489, 0.9254902, 0, 1, 1,
0.9280086, -0.2590286, 0.9397374, 0.9333333, 0, 1, 1,
0.9282165, 0.6529773, 2.337884, 0.9372549, 0, 1, 1,
0.9343984, -0.09467975, -0.3970777, 0.945098, 0, 1, 1,
0.9348348, -0.5887248, 1.932336, 0.9490196, 0, 1, 1,
0.940639, 0.7359311, 0.2711577, 0.9568627, 0, 1, 1,
0.9420161, -0.6207113, 0.9675895, 0.9607843, 0, 1, 1,
0.9431371, -1.136723, 3.26038, 0.9686275, 0, 1, 1,
0.9508051, 0.4766881, 1.087248, 0.972549, 0, 1, 1,
0.9524307, -1.00537, 0.8189197, 0.9803922, 0, 1, 1,
0.9525369, 0.8703181, 2.059424, 0.9843137, 0, 1, 1,
0.9525954, -1.30898, 0.6844215, 0.9921569, 0, 1, 1,
0.9569467, 1.810621, -0.2729132, 0.9960784, 0, 1, 1,
0.9573885, -0.3211398, 2.984156, 1, 0, 0.9960784, 1,
0.9612773, 3.14027, 0.7245114, 1, 0, 0.9882353, 1,
0.9613868, -0.06147931, 4.333884, 1, 0, 0.9843137, 1,
0.9770864, 1.212106, 1.909789, 1, 0, 0.9764706, 1,
0.981967, -0.8028909, 2.481997, 1, 0, 0.972549, 1,
0.9871864, -0.5918102, 2.354084, 1, 0, 0.9647059, 1,
0.9923303, -0.5664521, 1.933873, 1, 0, 0.9607843, 1,
0.9954563, -0.0293441, 4.384163, 1, 0, 0.9529412, 1,
0.9955107, 0.3928059, -1.177152, 1, 0, 0.9490196, 1,
1.0053, 0.6366147, 1.912777, 1, 0, 0.9411765, 1,
1.013394, 2.107414, 1.534062, 1, 0, 0.9372549, 1,
1.017292, -0.1448031, 1.830013, 1, 0, 0.9294118, 1,
1.017494, -0.9239517, 5.782944, 1, 0, 0.9254902, 1,
1.026713, 2.688806, -1.948808, 1, 0, 0.9176471, 1,
1.026998, -1.130601, 0.928248, 1, 0, 0.9137255, 1,
1.045761, -0.1314042, 1.957568, 1, 0, 0.9058824, 1,
1.061149, -0.8053875, 2.173918, 1, 0, 0.9019608, 1,
1.063195, 0.1368108, 1.303626, 1, 0, 0.8941177, 1,
1.063741, -0.6868402, 1.974595, 1, 0, 0.8862745, 1,
1.069534, 0.3151841, 1.24265, 1, 0, 0.8823529, 1,
1.070982, -0.9271183, 2.415924, 1, 0, 0.8745098, 1,
1.072361, 1.924316, 1.250086, 1, 0, 0.8705882, 1,
1.072395, 0.02142025, 3.931071, 1, 0, 0.8627451, 1,
1.072764, 0.2119487, 1.348019, 1, 0, 0.8588235, 1,
1.084424, -1.116974, 1.691721, 1, 0, 0.8509804, 1,
1.092791, 0.1149013, 1.638624, 1, 0, 0.8470588, 1,
1.097955, -1.363767, 2.214465, 1, 0, 0.8392157, 1,
1.099881, 0.3610672, 1.960298, 1, 0, 0.8352941, 1,
1.108248, 0.6442949, -0.05406732, 1, 0, 0.827451, 1,
1.108263, 0.2466846, 1.074531, 1, 0, 0.8235294, 1,
1.113826, -0.2280596, 1.765789, 1, 0, 0.8156863, 1,
1.113976, 1.259208, 1.766436, 1, 0, 0.8117647, 1,
1.120225, 1.23239, 0.8003209, 1, 0, 0.8039216, 1,
1.120322, 1.985267, 0.8560303, 1, 0, 0.7960784, 1,
1.120837, -0.504088, 2.333814, 1, 0, 0.7921569, 1,
1.141471, -0.5160883, 2.330125, 1, 0, 0.7843137, 1,
1.153688, -0.89206, 2.78105, 1, 0, 0.7803922, 1,
1.155387, 1.076442, 0.8751975, 1, 0, 0.772549, 1,
1.156731, 0.3779707, 1.598743, 1, 0, 0.7686275, 1,
1.167144, 0.2963609, 1.995349, 1, 0, 0.7607843, 1,
1.17505, 0.02113012, 1.985844, 1, 0, 0.7568628, 1,
1.177327, 0.1721442, 0.1291505, 1, 0, 0.7490196, 1,
1.180637, -1.455856, 2.404881, 1, 0, 0.7450981, 1,
1.188348, 0.3017261, -0.8316548, 1, 0, 0.7372549, 1,
1.18842, 1.870301, -0.5300077, 1, 0, 0.7333333, 1,
1.189653, -0.8965208, 1.577047, 1, 0, 0.7254902, 1,
1.191611, -0.9717956, 1.596473, 1, 0, 0.7215686, 1,
1.19323, 0.3151458, 1.619358, 1, 0, 0.7137255, 1,
1.204524, 1.326687, 0.1327143, 1, 0, 0.7098039, 1,
1.21838, 0.2408917, -0.5757751, 1, 0, 0.7019608, 1,
1.235704, -1.134285, 0.6261395, 1, 0, 0.6941177, 1,
1.241092, 0.4516151, 1.757951, 1, 0, 0.6901961, 1,
1.245297, 0.4792248, 0.2936869, 1, 0, 0.682353, 1,
1.24533, 1.752195, -0.2627828, 1, 0, 0.6784314, 1,
1.250695, -1.855791, 2.969555, 1, 0, 0.6705883, 1,
1.26401, -0.1776784, 3.534347, 1, 0, 0.6666667, 1,
1.264936, 1.389631, -1.150579, 1, 0, 0.6588235, 1,
1.265709, -1.125912, 2.632623, 1, 0, 0.654902, 1,
1.272067, 0.6105127, 2.276395, 1, 0, 0.6470588, 1,
1.273696, -0.3780284, 1.658741, 1, 0, 0.6431373, 1,
1.276623, 1.357205, 2.596164, 1, 0, 0.6352941, 1,
1.279233, 1.075202, 2.765729, 1, 0, 0.6313726, 1,
1.280488, -0.1724165, 2.025551, 1, 0, 0.6235294, 1,
1.28149, -0.01122044, 1.08897, 1, 0, 0.6196079, 1,
1.282254, -1.248402, 4.717822, 1, 0, 0.6117647, 1,
1.283246, -0.9280891, 3.982223, 1, 0, 0.6078432, 1,
1.285055, 0.5509235, 2.672681, 1, 0, 0.6, 1,
1.289472, 1.199585, 2.269121, 1, 0, 0.5921569, 1,
1.295417, -1.288961, 2.773575, 1, 0, 0.5882353, 1,
1.299536, -0.3719763, -0.1392232, 1, 0, 0.5803922, 1,
1.310867, -1.1786, 0.8726326, 1, 0, 0.5764706, 1,
1.310906, -1.566263, 2.195069, 1, 0, 0.5686275, 1,
1.311386, 0.6374474, 1.78334, 1, 0, 0.5647059, 1,
1.312764, 0.7985945, 1.498928, 1, 0, 0.5568628, 1,
1.312888, 0.1553727, 0.8386495, 1, 0, 0.5529412, 1,
1.313706, 0.1593094, 2.151064, 1, 0, 0.5450981, 1,
1.324407, 0.5524074, -0.3754475, 1, 0, 0.5411765, 1,
1.333356, -0.1641384, 0.8084368, 1, 0, 0.5333334, 1,
1.338487, -0.2396987, 1.410253, 1, 0, 0.5294118, 1,
1.350573, -1.672058, 3.814091, 1, 0, 0.5215687, 1,
1.361197, -1.03187, 2.129545, 1, 0, 0.5176471, 1,
1.366751, -0.4629505, 0.8218298, 1, 0, 0.509804, 1,
1.390648, 2.431125, -2.167083, 1, 0, 0.5058824, 1,
1.39704, -0.1467645, 1.749735, 1, 0, 0.4980392, 1,
1.397126, -0.1231892, 3.028754, 1, 0, 0.4901961, 1,
1.412788, -1.613318, 0.5276186, 1, 0, 0.4862745, 1,
1.413185, 1.473147, -1.463906, 1, 0, 0.4784314, 1,
1.420658, 0.1944566, 2.407559, 1, 0, 0.4745098, 1,
1.421617, -0.308615, 0.2502758, 1, 0, 0.4666667, 1,
1.44365, 1.514836, 0.8568045, 1, 0, 0.4627451, 1,
1.448084, 0.2855923, 1.80355, 1, 0, 0.454902, 1,
1.461622, -0.8736256, 1.907646, 1, 0, 0.4509804, 1,
1.472551, -0.4272962, 1.634188, 1, 0, 0.4431373, 1,
1.474162, 1.347505, 0.702619, 1, 0, 0.4392157, 1,
1.489584, 1.313381, 1.061029, 1, 0, 0.4313726, 1,
1.490551, 0.1410848, 1.490416, 1, 0, 0.427451, 1,
1.498459, 0.7902592, 2.699603, 1, 0, 0.4196078, 1,
1.501795, -0.6250142, -0.5962346, 1, 0, 0.4156863, 1,
1.520385, -0.5908515, 1.655074, 1, 0, 0.4078431, 1,
1.54065, -0.2057788, 2.8317, 1, 0, 0.4039216, 1,
1.545653, 0.2821295, 0.1468507, 1, 0, 0.3960784, 1,
1.548068, 2.059714, -1.224971, 1, 0, 0.3882353, 1,
1.549912, 0.1184302, -0.07954571, 1, 0, 0.3843137, 1,
1.559371, 1.463251, 1.280991, 1, 0, 0.3764706, 1,
1.56437, 0.3302527, 2.215282, 1, 0, 0.372549, 1,
1.568563, 0.3530207, 1.643036, 1, 0, 0.3647059, 1,
1.579675, 0.8208727, 0.289072, 1, 0, 0.3607843, 1,
1.596575, -0.7946648, 0.8232157, 1, 0, 0.3529412, 1,
1.598722, 0.8880621, -0.2060038, 1, 0, 0.3490196, 1,
1.615779, -0.9186301, 1.447169, 1, 0, 0.3411765, 1,
1.619704, -0.6859394, 3.03254, 1, 0, 0.3372549, 1,
1.623439, 0.7619427, 1.591034, 1, 0, 0.3294118, 1,
1.646238, -1.982862, 2.730855, 1, 0, 0.3254902, 1,
1.667758, -1.005755, -0.1237666, 1, 0, 0.3176471, 1,
1.668393, 0.4720798, 0.1434209, 1, 0, 0.3137255, 1,
1.714666, 0.598858, 1.564886, 1, 0, 0.3058824, 1,
1.724652, 0.7029439, 1.224375, 1, 0, 0.2980392, 1,
1.726137, -0.3156339, 3.781088, 1, 0, 0.2941177, 1,
1.738648, 0.1228094, 1.339063, 1, 0, 0.2862745, 1,
1.750145, -0.9307202, 2.411537, 1, 0, 0.282353, 1,
1.770954, -0.8181649, 1.439652, 1, 0, 0.2745098, 1,
1.774417, 2.031576, 0.1886217, 1, 0, 0.2705882, 1,
1.776808, 0.426878, 0.8408203, 1, 0, 0.2627451, 1,
1.791683, 0.6677744, 2.662127, 1, 0, 0.2588235, 1,
1.816534, 0.591966, 1.964811, 1, 0, 0.2509804, 1,
1.829032, 0.993223, 1.297931, 1, 0, 0.2470588, 1,
1.856791, -0.9048178, 3.468451, 1, 0, 0.2392157, 1,
1.87093, 0.1772342, 4.218744, 1, 0, 0.2352941, 1,
1.874005, 0.279002, 1.826432, 1, 0, 0.227451, 1,
1.90306, 0.2909589, 1.312946, 1, 0, 0.2235294, 1,
1.912014, 0.2000831, 0.2500421, 1, 0, 0.2156863, 1,
1.931718, -0.2122156, 2.957041, 1, 0, 0.2117647, 1,
1.978343, 2.000484, 0.09987164, 1, 0, 0.2039216, 1,
2.011964, 1.921852, 1.077245, 1, 0, 0.1960784, 1,
2.015051, -1.125912, 1.728032, 1, 0, 0.1921569, 1,
2.025578, 0.9743437, 1.481324, 1, 0, 0.1843137, 1,
2.041747, -1.493724, 0.6092247, 1, 0, 0.1803922, 1,
2.051344, 0.5312138, 2.928797, 1, 0, 0.172549, 1,
2.065672, -0.3478684, 2.202941, 1, 0, 0.1686275, 1,
2.066077, 1.452543, 2.31556, 1, 0, 0.1607843, 1,
2.075022, 1.150931, 0.5224055, 1, 0, 0.1568628, 1,
2.076408, 1.869687, 0.5180633, 1, 0, 0.1490196, 1,
2.076425, 0.9176761, 1.396961, 1, 0, 0.145098, 1,
2.077223, -0.2946998, 1.194304, 1, 0, 0.1372549, 1,
2.132806, 1.271569, 0.3596123, 1, 0, 0.1333333, 1,
2.136388, 0.9747546, 0.6805277, 1, 0, 0.1254902, 1,
2.144239, -0.3346114, 2.179726, 1, 0, 0.1215686, 1,
2.145031, 1.215182, 1.414521, 1, 0, 0.1137255, 1,
2.215021, 0.06845438, 2.390166, 1, 0, 0.1098039, 1,
2.219741, -0.496805, 0.216289, 1, 0, 0.1019608, 1,
2.231109, 0.0519523, 3.143825, 1, 0, 0.09411765, 1,
2.258051, 0.2291272, 1.695445, 1, 0, 0.09019608, 1,
2.271557, -0.1480253, 3.399637, 1, 0, 0.08235294, 1,
2.294548, 0.6476484, 0.5590578, 1, 0, 0.07843138, 1,
2.311111, -2.350561, 1.648649, 1, 0, 0.07058824, 1,
2.31307, 0.1509082, 1.07571, 1, 0, 0.06666667, 1,
2.35697, -0.8842352, 0.3671212, 1, 0, 0.05882353, 1,
2.405132, -0.609972, 3.268066, 1, 0, 0.05490196, 1,
2.411471, -0.1684271, 1.987663, 1, 0, 0.04705882, 1,
2.426292, -1.087569, 0.03718027, 1, 0, 0.04313726, 1,
2.492219, 0.1327327, 2.43107, 1, 0, 0.03529412, 1,
2.547469, 1.151818, 2.949989, 1, 0, 0.03137255, 1,
2.585807, -1.301742, 2.66609, 1, 0, 0.02352941, 1,
2.648207, -0.1660456, 1.618409, 1, 0, 0.01960784, 1,
2.662853, -0.2301594, 2.201485, 1, 0, 0.01176471, 1,
2.896336, -0.4106048, 1.969055, 1, 0, 0.007843138, 1
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
-0.0007789135, -4.516175, -6.51191, 0, -0.5, 0.5, 0.5,
-0.0007789135, -4.516175, -6.51191, 1, -0.5, 0.5, 0.5,
-0.0007789135, -4.516175, -6.51191, 1, 1.5, 0.5, 0.5,
-0.0007789135, -4.516175, -6.51191, 0, 1.5, 0.5, 0.5
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
-3.880016, -0.1331137, -6.51191, 0, -0.5, 0.5, 0.5,
-3.880016, -0.1331137, -6.51191, 1, -0.5, 0.5, 0.5,
-3.880016, -0.1331137, -6.51191, 1, 1.5, 0.5, 0.5,
-3.880016, -0.1331137, -6.51191, 0, 1.5, 0.5, 0.5
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
-3.880016, -4.516175, 0.5264864, 0, -0.5, 0.5, 0.5,
-3.880016, -4.516175, 0.5264864, 1, -0.5, 0.5, 0.5,
-3.880016, -4.516175, 0.5264864, 1, 1.5, 0.5, 0.5,
-3.880016, -4.516175, 0.5264864, 0, 1.5, 0.5, 0.5
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
-2, -3.504699, -4.887665,
2, -3.504699, -4.887665,
-2, -3.504699, -4.887665,
-2, -3.673279, -5.158373,
-1, -3.504699, -4.887665,
-1, -3.673279, -5.158373,
0, -3.504699, -4.887665,
0, -3.673279, -5.158373,
1, -3.504699, -4.887665,
1, -3.673279, -5.158373,
2, -3.504699, -4.887665,
2, -3.673279, -5.158373
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
-2, -4.010437, -5.699788, 0, -0.5, 0.5, 0.5,
-2, -4.010437, -5.699788, 1, -0.5, 0.5, 0.5,
-2, -4.010437, -5.699788, 1, 1.5, 0.5, 0.5,
-2, -4.010437, -5.699788, 0, 1.5, 0.5, 0.5,
-1, -4.010437, -5.699788, 0, -0.5, 0.5, 0.5,
-1, -4.010437, -5.699788, 1, -0.5, 0.5, 0.5,
-1, -4.010437, -5.699788, 1, 1.5, 0.5, 0.5,
-1, -4.010437, -5.699788, 0, 1.5, 0.5, 0.5,
0, -4.010437, -5.699788, 0, -0.5, 0.5, 0.5,
0, -4.010437, -5.699788, 1, -0.5, 0.5, 0.5,
0, -4.010437, -5.699788, 1, 1.5, 0.5, 0.5,
0, -4.010437, -5.699788, 0, 1.5, 0.5, 0.5,
1, -4.010437, -5.699788, 0, -0.5, 0.5, 0.5,
1, -4.010437, -5.699788, 1, -0.5, 0.5, 0.5,
1, -4.010437, -5.699788, 1, 1.5, 0.5, 0.5,
1, -4.010437, -5.699788, 0, 1.5, 0.5, 0.5,
2, -4.010437, -5.699788, 0, -0.5, 0.5, 0.5,
2, -4.010437, -5.699788, 1, -0.5, 0.5, 0.5,
2, -4.010437, -5.699788, 1, 1.5, 0.5, 0.5,
2, -4.010437, -5.699788, 0, 1.5, 0.5, 0.5
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
-2.984807, -3, -4.887665,
-2.984807, 3, -4.887665,
-2.984807, -3, -4.887665,
-3.134009, -3, -5.158373,
-2.984807, -2, -4.887665,
-3.134009, -2, -5.158373,
-2.984807, -1, -4.887665,
-3.134009, -1, -5.158373,
-2.984807, 0, -4.887665,
-3.134009, 0, -5.158373,
-2.984807, 1, -4.887665,
-3.134009, 1, -5.158373,
-2.984807, 2, -4.887665,
-3.134009, 2, -5.158373,
-2.984807, 3, -4.887665,
-3.134009, 3, -5.158373
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
-3.432412, -3, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, -3, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, -3, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, -3, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, -2, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, -2, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, -2, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, -2, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, -1, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, -1, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, -1, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, -1, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, 0, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, 0, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, 0, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, 0, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, 1, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, 1, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, 1, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, 1, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, 2, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, 2, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, 2, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, 2, -5.699788, 0, 1.5, 0.5, 0.5,
-3.432412, 3, -5.699788, 0, -0.5, 0.5, 0.5,
-3.432412, 3, -5.699788, 1, -0.5, 0.5, 0.5,
-3.432412, 3, -5.699788, 1, 1.5, 0.5, 0.5,
-3.432412, 3, -5.699788, 0, 1.5, 0.5, 0.5
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
-2.984807, -3.504699, -4,
-2.984807, -3.504699, 4,
-2.984807, -3.504699, -4,
-3.134009, -3.673279, -4,
-2.984807, -3.504699, -2,
-3.134009, -3.673279, -2,
-2.984807, -3.504699, 0,
-3.134009, -3.673279, 0,
-2.984807, -3.504699, 2,
-3.134009, -3.673279, 2,
-2.984807, -3.504699, 4,
-3.134009, -3.673279, 4
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
-3.432412, -4.010437, -4, 0, -0.5, 0.5, 0.5,
-3.432412, -4.010437, -4, 1, -0.5, 0.5, 0.5,
-3.432412, -4.010437, -4, 1, 1.5, 0.5, 0.5,
-3.432412, -4.010437, -4, 0, 1.5, 0.5, 0.5,
-3.432412, -4.010437, -2, 0, -0.5, 0.5, 0.5,
-3.432412, -4.010437, -2, 1, -0.5, 0.5, 0.5,
-3.432412, -4.010437, -2, 1, 1.5, 0.5, 0.5,
-3.432412, -4.010437, -2, 0, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 0, 0, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 0, 1, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 0, 1, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 0, 0, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 2, 0, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 2, 1, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 2, 1, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 2, 0, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 4, 0, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 4, 1, -0.5, 0.5, 0.5,
-3.432412, -4.010437, 4, 1, 1.5, 0.5, 0.5,
-3.432412, -4.010437, 4, 0, 1.5, 0.5, 0.5
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
-2.984807, -3.504699, -4.887665,
-2.984807, 3.238472, -4.887665,
-2.984807, -3.504699, 5.940638,
-2.984807, 3.238472, 5.940638,
-2.984807, -3.504699, -4.887665,
-2.984807, -3.504699, 5.940638,
-2.984807, 3.238472, -4.887665,
-2.984807, 3.238472, 5.940638,
-2.984807, -3.504699, -4.887665,
2.983249, -3.504699, -4.887665,
-2.984807, -3.504699, 5.940638,
2.983249, -3.504699, 5.940638,
-2.984807, 3.238472, -4.887665,
2.983249, 3.238472, -4.887665,
-2.984807, 3.238472, 5.940638,
2.983249, 3.238472, 5.940638,
2.983249, -3.504699, -4.887665,
2.983249, 3.238472, -4.887665,
2.983249, -3.504699, 5.940638,
2.983249, 3.238472, 5.940638,
2.983249, -3.504699, -4.887665,
2.983249, -3.504699, 5.940638,
2.983249, 3.238472, -4.887665,
2.983249, 3.238472, 5.940638
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
var radius = 7.520225;
var distance = 33.45833;
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
mvMatrix.translate( 0.0007789135, 0.1331137, -0.5264864 );
mvMatrix.scale( 1.362422, 1.205815, 0.7509039 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45833);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
1-chlorobut-1-ene<-read.table("1-chlorobut-1-ene.xyz", skip=1)
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
-2.897894, 0.06634795, -1.395893, 0, 0, 1, 1, 1,
-2.673212, 0.8217259, -1.808729, 1, 0, 0, 1, 1,
-2.563466, -0.5216832, -0.7804701, 1, 0, 0, 1, 1,
-2.538614, 1.510177, -1.17139, 1, 0, 0, 1, 1,
-2.500609, 0.6923931, -1.554912, 1, 0, 0, 1, 1,
-2.479243, 0.3903669, -0.7705787, 1, 0, 0, 1, 1,
-2.423265, 0.7729734, -0.2162626, 0, 0, 0, 1, 1,
-2.418147, -0.6144789, -0.9411362, 0, 0, 0, 1, 1,
-2.401377, 2.573955, -2.050916, 0, 0, 0, 1, 1,
-2.37981, -0.8493815, -1.618171, 0, 0, 0, 1, 1,
-2.329581, -1.093092, -1.427848, 0, 0, 0, 1, 1,
-2.277713, -0.6146462, -2.293462, 0, 0, 0, 1, 1,
-2.251987, 1.770336, -1.542434, 0, 0, 0, 1, 1,
-2.211053, -0.188603, -2.475317, 1, 1, 1, 1, 1,
-2.173348, 1.183335, -1.909302, 1, 1, 1, 1, 1,
-2.165181, 0.2030483, -1.067907, 1, 1, 1, 1, 1,
-2.163962, -0.6021177, -3.788003, 1, 1, 1, 1, 1,
-2.155087, -0.2172638, -2.255916, 1, 1, 1, 1, 1,
-2.134165, 0.5513579, 0.267143, 1, 1, 1, 1, 1,
-2.11495, 0.6222578, -0.5616169, 1, 1, 1, 1, 1,
-2.075879, 1.263859, -0.01421031, 1, 1, 1, 1, 1,
-2.03541, -0.9391257, -1.029128, 1, 1, 1, 1, 1,
-1.994204, 0.6417302, -1.884223, 1, 1, 1, 1, 1,
-1.986273, -1.81856, -3.002195, 1, 1, 1, 1, 1,
-1.97349, -0.1055217, -0.6025403, 1, 1, 1, 1, 1,
-1.966277, 0.3904391, -0.714309, 1, 1, 1, 1, 1,
-1.931144, -1.591581, -1.872255, 1, 1, 1, 1, 1,
-1.914604, -0.02533692, -2.979962, 1, 1, 1, 1, 1,
-1.906261, 0.3434152, -1.596621, 0, 0, 1, 1, 1,
-1.895499, -0.003566481, -1.447593, 1, 0, 0, 1, 1,
-1.888103, -0.9951485, -4.431983, 1, 0, 0, 1, 1,
-1.86699, -0.01148361, -1.718896, 1, 0, 0, 1, 1,
-1.844893, -1.748703, -3.257766, 1, 0, 0, 1, 1,
-1.836617, -1.1861, -4.051064, 1, 0, 0, 1, 1,
-1.780015, -0.3146105, -2.734258, 0, 0, 0, 1, 1,
-1.775894, -1.445946, -2.283686, 0, 0, 0, 1, 1,
-1.771871, -1.369626, -2.113804, 0, 0, 0, 1, 1,
-1.765779, 0.8917072, -1.91066, 0, 0, 0, 1, 1,
-1.764035, -0.1133744, -0.1080606, 0, 0, 0, 1, 1,
-1.762001, -0.08616462, -2.011444, 0, 0, 0, 1, 1,
-1.713843, -1.096444, -2.570314, 0, 0, 0, 1, 1,
-1.704877, -0.8498583, -2.172104, 1, 1, 1, 1, 1,
-1.70014, 1.315264, -1.421341, 1, 1, 1, 1, 1,
-1.652791, 2.587081, -1.730253, 1, 1, 1, 1, 1,
-1.647298, 0.4236286, -2.085191, 1, 1, 1, 1, 1,
-1.644371, -1.257068, -1.134579, 1, 1, 1, 1, 1,
-1.643909, -0.3179613, -3.034394, 1, 1, 1, 1, 1,
-1.630382, 0.0734837, -2.036507, 1, 1, 1, 1, 1,
-1.616472, -0.272543, -2.902232, 1, 1, 1, 1, 1,
-1.608358, 1.409616, -0.4842419, 1, 1, 1, 1, 1,
-1.590805, -0.7183909, -1.96794, 1, 1, 1, 1, 1,
-1.562587, 0.630721, -2.245134, 1, 1, 1, 1, 1,
-1.530685, 0.07888269, -1.19023, 1, 1, 1, 1, 1,
-1.5218, 1.795452, 0.3343813, 1, 1, 1, 1, 1,
-1.51568, -1.200121, -1.127062, 1, 1, 1, 1, 1,
-1.504989, -1.184072, -3.127789, 1, 1, 1, 1, 1,
-1.502978, -0.4747705, -2.386397, 0, 0, 1, 1, 1,
-1.502775, -0.3627982, -2.268295, 1, 0, 0, 1, 1,
-1.49942, -1.126371, -2.502744, 1, 0, 0, 1, 1,
-1.498328, 0.709573, -0.7987846, 1, 0, 0, 1, 1,
-1.488495, -1.040903, -2.515723, 1, 0, 0, 1, 1,
-1.483926, 0.9628728, 0.1042852, 1, 0, 0, 1, 1,
-1.482717, -0.6399902, -1.352198, 0, 0, 0, 1, 1,
-1.477111, -0.4830873, -2.24499, 0, 0, 0, 1, 1,
-1.474844, -0.7964104, -1.044334, 0, 0, 0, 1, 1,
-1.472274, 1.488525, -0.9117383, 0, 0, 0, 1, 1,
-1.464132, 1.231717, -1.190522, 0, 0, 0, 1, 1,
-1.45676, -1.4237, -2.822264, 0, 0, 0, 1, 1,
-1.456132, -0.7754068, -3.639302, 0, 0, 0, 1, 1,
-1.452367, 0.7810178, 0.4179406, 1, 1, 1, 1, 1,
-1.435603, -0.8895581, -1.156023, 1, 1, 1, 1, 1,
-1.429218, 1.734405, 0.1664168, 1, 1, 1, 1, 1,
-1.422331, -0.2049002, -2.298176, 1, 1, 1, 1, 1,
-1.421385, 0.1792358, -1.248952, 1, 1, 1, 1, 1,
-1.419773, -0.05928128, -1.082142, 1, 1, 1, 1, 1,
-1.419033, 0.4698318, -1.657649, 1, 1, 1, 1, 1,
-1.400473, -0.07846785, -2.353585, 1, 1, 1, 1, 1,
-1.389933, 0.6281769, -1.992638, 1, 1, 1, 1, 1,
-1.374812, 0.4919108, -1.662818, 1, 1, 1, 1, 1,
-1.374467, -2.785355, -2.509393, 1, 1, 1, 1, 1,
-1.37292, 1.515627, -2.416308, 1, 1, 1, 1, 1,
-1.357707, 0.4985949, -1.686945, 1, 1, 1, 1, 1,
-1.346108, -1.601365, -2.78904, 1, 1, 1, 1, 1,
-1.340309, -2.789374, -4.29564, 1, 1, 1, 1, 1,
-1.329401, 1.115248, -1.838546, 0, 0, 1, 1, 1,
-1.32137, 0.6320066, 0.1216465, 1, 0, 0, 1, 1,
-1.313996, 1.431467, -1.293231, 1, 0, 0, 1, 1,
-1.31176, 1.579142, 0.2484772, 1, 0, 0, 1, 1,
-1.310356, 1.203835, -1.187971, 1, 0, 0, 1, 1,
-1.307279, 0.4792615, -2.641149, 1, 0, 0, 1, 1,
-1.304229, 0.004052868, -1.479323, 0, 0, 0, 1, 1,
-1.300786, 1.639296, 0.6649507, 0, 0, 0, 1, 1,
-1.298994, 0.4519603, -1.366077, 0, 0, 0, 1, 1,
-1.294318, -2.419902, -2.427191, 0, 0, 0, 1, 1,
-1.289624, 1.004075, -1.017094, 0, 0, 0, 1, 1,
-1.287601, 0.5130485, -1.423174, 0, 0, 0, 1, 1,
-1.283594, -0.4255737, -3.222628, 0, 0, 0, 1, 1,
-1.274228, 0.3343002, -1.581398, 1, 1, 1, 1, 1,
-1.270277, 1.423899, -1.446684, 1, 1, 1, 1, 1,
-1.269231, 0.2529857, -3.87837, 1, 1, 1, 1, 1,
-1.267236, 0.4144191, 0.5550076, 1, 1, 1, 1, 1,
-1.266202, -1.15504, -1.93501, 1, 1, 1, 1, 1,
-1.263255, 1.175308, 0.5654083, 1, 1, 1, 1, 1,
-1.257823, 0.200875, -1.595788, 1, 1, 1, 1, 1,
-1.256065, 0.7768838, -0.1073685, 1, 1, 1, 1, 1,
-1.254347, -0.3176902, -2.344556, 1, 1, 1, 1, 1,
-1.232323, 1.236071, -2.946647, 1, 1, 1, 1, 1,
-1.230331, 1.092272, -0.1613708, 1, 1, 1, 1, 1,
-1.22965, -1.486629, -3.054509, 1, 1, 1, 1, 1,
-1.216629, -0.6863669, -0.8694203, 1, 1, 1, 1, 1,
-1.214407, -1.437285, -3.74898, 1, 1, 1, 1, 1,
-1.208542, 0.3060558, -1.405958, 1, 1, 1, 1, 1,
-1.206573, -0.445373, -2.432787, 0, 0, 1, 1, 1,
-1.201323, -0.4564642, 0.1984258, 1, 0, 0, 1, 1,
-1.200563, 0.9478477, -1.599576, 1, 0, 0, 1, 1,
-1.200422, 0.608686, -0.07863077, 1, 0, 0, 1, 1,
-1.19046, -1.117092, 0.4666764, 1, 0, 0, 1, 1,
-1.181238, -0.1963082, -2.541433, 1, 0, 0, 1, 1,
-1.171641, 0.7482716, -1.064804, 0, 0, 0, 1, 1,
-1.164013, 0.6819137, -1.776372, 0, 0, 0, 1, 1,
-1.163197, 0.4744109, -1.375563, 0, 0, 0, 1, 1,
-1.160185, -0.3598264, -1.017786, 0, 0, 0, 1, 1,
-1.158299, -0.6342447, -1.721518, 0, 0, 0, 1, 1,
-1.156004, -0.9604263, -2.996912, 0, 0, 0, 1, 1,
-1.151884, 0.2907059, -2.511011, 0, 0, 0, 1, 1,
-1.150902, -0.8845761, -4.058124, 1, 1, 1, 1, 1,
-1.134989, -1.135159, -0.9304559, 1, 1, 1, 1, 1,
-1.132992, 0.2011909, 0.1050161, 1, 1, 1, 1, 1,
-1.102237, -0.2947119, -0.9500604, 1, 1, 1, 1, 1,
-1.091709, 0.401612, -0.386337, 1, 1, 1, 1, 1,
-1.08062, -1.403197, -4.294011, 1, 1, 1, 1, 1,
-1.076617, 0.2103118, -2.276893, 1, 1, 1, 1, 1,
-1.074415, -0.8077641, -1.529404, 1, 1, 1, 1, 1,
-1.073751, 0.09435965, -1.582826, 1, 1, 1, 1, 1,
-1.070263, -0.1418214, -0.457528, 1, 1, 1, 1, 1,
-1.067996, 1.984371, 0.07883351, 1, 1, 1, 1, 1,
-1.067892, -0.753176, -1.871011, 1, 1, 1, 1, 1,
-1.062816, -0.438525, -2.449461, 1, 1, 1, 1, 1,
-1.049285, 0.7087801, -3.625943, 1, 1, 1, 1, 1,
-1.047963, 0.6145804, -1.657942, 1, 1, 1, 1, 1,
-1.027501, 1.457334, -1.779249, 0, 0, 1, 1, 1,
-1.026301, 0.9585575, -1.977881, 1, 0, 0, 1, 1,
-1.024317, -1.512761, -1.566409, 1, 0, 0, 1, 1,
-1.012153, 0.3788894, -2.319476, 1, 0, 0, 1, 1,
-1.011549, 1.658695, 0.8340451, 1, 0, 0, 1, 1,
-1.010643, 0.2452095, -1.289846, 1, 0, 0, 1, 1,
-1.00536, 0.2436268, -1.921017, 0, 0, 0, 1, 1,
-1.001448, 0.005204567, -2.581118, 0, 0, 0, 1, 1,
-0.9972151, 1.079819, 0.7338811, 0, 0, 0, 1, 1,
-0.9926471, -0.8790406, -2.066061, 0, 0, 0, 1, 1,
-0.9922367, 0.219524, -0.6484715, 0, 0, 0, 1, 1,
-0.9915485, -0.4340852, -1.031161, 0, 0, 0, 1, 1,
-0.989233, 0.4517035, -2.02507, 0, 0, 0, 1, 1,
-0.9883043, 0.4950029, -2.562561, 1, 1, 1, 1, 1,
-0.9845604, -0.1438224, -1.471543, 1, 1, 1, 1, 1,
-0.9831101, 0.1284851, -1.606905, 1, 1, 1, 1, 1,
-0.9785857, -0.2271747, -0.3717217, 1, 1, 1, 1, 1,
-0.975102, 0.2158279, -0.6385044, 1, 1, 1, 1, 1,
-0.9709896, 0.1022505, -1.820348, 1, 1, 1, 1, 1,
-0.9708561, 1.939348, -1.649905, 1, 1, 1, 1, 1,
-0.9680251, 0.2680936, -1.280328, 1, 1, 1, 1, 1,
-0.9600056, 0.6040881, -1.258141, 1, 1, 1, 1, 1,
-0.9559841, 1.148433, -0.3937421, 1, 1, 1, 1, 1,
-0.9514617, 0.09381078, -2.106493, 1, 1, 1, 1, 1,
-0.9489379, 2.144151, -0.9583591, 1, 1, 1, 1, 1,
-0.9416898, -0.9150472, -1.492991, 1, 1, 1, 1, 1,
-0.9399011, 0.1144379, -1.751104, 1, 1, 1, 1, 1,
-0.9356952, -0.9430861, -1.596535, 1, 1, 1, 1, 1,
-0.9344333, -0.2802657, -3.020043, 0, 0, 1, 1, 1,
-0.9295078, -0.2709066, -1.079357, 1, 0, 0, 1, 1,
-0.9260408, 1.677575, 0.14873, 1, 0, 0, 1, 1,
-0.9201714, -0.6231251, -3.527092, 1, 0, 0, 1, 1,
-0.9148238, -0.04572963, 0.1884076, 1, 0, 0, 1, 1,
-0.9143828, 0.4399648, -1.242639, 1, 0, 0, 1, 1,
-0.9138228, 1.57119, 2.486805, 0, 0, 0, 1, 1,
-0.9108514, -1.194358, -3.249536, 0, 0, 0, 1, 1,
-0.9080693, -2.112858, -2.666162, 0, 0, 0, 1, 1,
-0.8993407, -0.8973338, -0.2057188, 0, 0, 0, 1, 1,
-0.8938457, 0.8419861, 0.09090532, 0, 0, 0, 1, 1,
-0.8935012, -0.8617906, -2.971708, 0, 0, 0, 1, 1,
-0.889375, 0.1534777, -0.9195851, 0, 0, 0, 1, 1,
-0.8856079, 0.1378874, -1.402331, 1, 1, 1, 1, 1,
-0.8824017, 0.8398919, -0.4751049, 1, 1, 1, 1, 1,
-0.881537, 1.320306, -2.503745, 1, 1, 1, 1, 1,
-0.8769097, -0.3203658, -0.695918, 1, 1, 1, 1, 1,
-0.8766209, -0.7219427, -1.772848, 1, 1, 1, 1, 1,
-0.8712663, -0.2888371, -2.529627, 1, 1, 1, 1, 1,
-0.86897, 0.9572427, -0.9063936, 1, 1, 1, 1, 1,
-0.8607135, 0.2017503, -2.303401, 1, 1, 1, 1, 1,
-0.8595216, -1.869933, -2.273649, 1, 1, 1, 1, 1,
-0.8564934, -0.2082478, -1.759855, 1, 1, 1, 1, 1,
-0.8537604, -0.118632, -1.203861, 1, 1, 1, 1, 1,
-0.8474233, -1.469674, -2.53385, 1, 1, 1, 1, 1,
-0.8465834, -0.7733169, -1.231173, 1, 1, 1, 1, 1,
-0.8421083, -1.275318, -1.665789, 1, 1, 1, 1, 1,
-0.8378738, -0.5082077, -0.8052706, 1, 1, 1, 1, 1,
-0.8363776, 0.671576, -1.324802, 0, 0, 1, 1, 1,
-0.8334614, -0.6229798, -2.901673, 1, 0, 0, 1, 1,
-0.8301567, 0.2328698, -2.855875, 1, 0, 0, 1, 1,
-0.8278595, 0.6776937, 0.0681773, 1, 0, 0, 1, 1,
-0.826577, 0.1879869, 0.1370986, 1, 0, 0, 1, 1,
-0.8232501, -1.31121, -2.900891, 1, 0, 0, 1, 1,
-0.8186678, -0.6663719, -1.946254, 0, 0, 0, 1, 1,
-0.8180273, -0.1481782, -1.822306, 0, 0, 0, 1, 1,
-0.813983, -0.6418648, -0.8971326, 0, 0, 0, 1, 1,
-0.8118947, 0.9275904, -1.456769, 0, 0, 0, 1, 1,
-0.8116001, -0.4929328, -1.568744, 0, 0, 0, 1, 1,
-0.8068146, 0.9613655, -1.642852, 0, 0, 0, 1, 1,
-0.8064967, -2.168761, -3.250477, 0, 0, 0, 1, 1,
-0.8053276, 0.4858042, -0.5353748, 1, 1, 1, 1, 1,
-0.8010256, -0.9862771, -2.903966, 1, 1, 1, 1, 1,
-0.8009745, 0.9329183, -0.3189002, 1, 1, 1, 1, 1,
-0.8009107, 0.1227198, -1.215838, 1, 1, 1, 1, 1,
-0.7990812, -2.048654, -3.855805, 1, 1, 1, 1, 1,
-0.7985458, -1.177285, -2.821791, 1, 1, 1, 1, 1,
-0.7981905, -0.5380395, -2.012601, 1, 1, 1, 1, 1,
-0.7962214, -0.4489084, -1.961084, 1, 1, 1, 1, 1,
-0.784754, 0.6984875, -1.226325, 1, 1, 1, 1, 1,
-0.7825233, 1.576982, 0.1353282, 1, 1, 1, 1, 1,
-0.782413, 0.8205013, -1.671426, 1, 1, 1, 1, 1,
-0.7798074, 2.740045, -1.208686, 1, 1, 1, 1, 1,
-0.77329, -0.3566372, -2.506411, 1, 1, 1, 1, 1,
-0.7731925, 0.7913812, 0.9226105, 1, 1, 1, 1, 1,
-0.7697718, -0.1979377, -3.065797, 1, 1, 1, 1, 1,
-0.7687477, -0.001837286, -3.419377, 0, 0, 1, 1, 1,
-0.7628272, -1.163606, -4.729971, 1, 0, 0, 1, 1,
-0.7566424, 0.3342623, -0.619146, 1, 0, 0, 1, 1,
-0.7545999, -0.282432, -1.887848, 1, 0, 0, 1, 1,
-0.7505214, -2.009811, -2.603942, 1, 0, 0, 1, 1,
-0.750049, 0.4660583, -0.009569515, 1, 0, 0, 1, 1,
-0.7498655, 0.7833133, -1.324204, 0, 0, 0, 1, 1,
-0.7491443, 1.28285, -0.8379917, 0, 0, 0, 1, 1,
-0.7491101, -0.2947236, -1.930804, 0, 0, 0, 1, 1,
-0.7467238, -1.213765, -2.52617, 0, 0, 0, 1, 1,
-0.7456461, 0.7093865, -0.6916271, 0, 0, 0, 1, 1,
-0.7359709, 0.2704068, -0.9799216, 0, 0, 0, 1, 1,
-0.7289795, 0.8155685, 0.2848841, 0, 0, 0, 1, 1,
-0.72811, -0.6541577, -1.896813, 1, 1, 1, 1, 1,
-0.7259587, 1.115199, -0.6916435, 1, 1, 1, 1, 1,
-0.7255785, -1.394329, -2.640859, 1, 1, 1, 1, 1,
-0.7241625, -0.4727333, -0.8078951, 1, 1, 1, 1, 1,
-0.7240032, 1.160375, -0.5328035, 1, 1, 1, 1, 1,
-0.7231562, -0.002427179, -2.35536, 1, 1, 1, 1, 1,
-0.7228789, 0.7595278, -0.9808967, 1, 1, 1, 1, 1,
-0.7137728, -0.3429409, -2.727175, 1, 1, 1, 1, 1,
-0.7096235, 0.02340708, -3.938422, 1, 1, 1, 1, 1,
-0.7032393, -1.295459, -2.475067, 1, 1, 1, 1, 1,
-0.7030404, 0.4126389, -2.251554, 1, 1, 1, 1, 1,
-0.7010539, -1.007781, -4.650619, 1, 1, 1, 1, 1,
-0.6968898, 0.4505139, -0.8153082, 1, 1, 1, 1, 1,
-0.685526, 0.0700033, -1.317802, 1, 1, 1, 1, 1,
-0.6835475, -0.2404601, 0.5628184, 1, 1, 1, 1, 1,
-0.681978, -0.1632398, -0.8236681, 0, 0, 1, 1, 1,
-0.6818441, -0.06696919, -0.6306553, 1, 0, 0, 1, 1,
-0.6758141, -1.03223, -3.05343, 1, 0, 0, 1, 1,
-0.6711945, 0.7074912, 0.07016597, 1, 0, 0, 1, 1,
-0.6707728, 2.042122, -0.08174032, 1, 0, 0, 1, 1,
-0.6687722, 0.2672842, -0.9182009, 1, 0, 0, 1, 1,
-0.6676375, 0.3205312, -0.2886635, 0, 0, 0, 1, 1,
-0.6653407, 0.5973208, -1.409906, 0, 0, 0, 1, 1,
-0.6574198, 0.1071574, -0.2709635, 0, 0, 0, 1, 1,
-0.6560245, 1.128981, -0.09871472, 0, 0, 0, 1, 1,
-0.6559014, -0.9242111, -1.740832, 0, 0, 0, 1, 1,
-0.6544861, 0.6401538, -0.4953625, 0, 0, 0, 1, 1,
-0.6534027, 0.5316536, -0.8411669, 0, 0, 0, 1, 1,
-0.6532453, 0.9892786, -1.098032, 1, 1, 1, 1, 1,
-0.6447389, -0.2814518, -3.455848, 1, 1, 1, 1, 1,
-0.6430286, -0.7369173, -1.842899, 1, 1, 1, 1, 1,
-0.6407955, -1.037667, -2.576999, 1, 1, 1, 1, 1,
-0.6406804, 0.4973294, -0.1798591, 1, 1, 1, 1, 1,
-0.6372449, 0.2912552, -0.7286791, 1, 1, 1, 1, 1,
-0.6365996, 0.380675, -0.8376323, 1, 1, 1, 1, 1,
-0.6364203, -0.3641211, -0.459793, 1, 1, 1, 1, 1,
-0.6360919, 0.6424318, 0.9070637, 1, 1, 1, 1, 1,
-0.6356687, -1.180409, -3.054822, 1, 1, 1, 1, 1,
-0.6333356, 0.908199, 0.2596648, 1, 1, 1, 1, 1,
-0.6321456, 0.2142205, -1.641728, 1, 1, 1, 1, 1,
-0.6320882, -0.5052096, -2.964064, 1, 1, 1, 1, 1,
-0.6297182, 0.7005731, -1.452525, 1, 1, 1, 1, 1,
-0.6249397, -0.07667661, -1.915367, 1, 1, 1, 1, 1,
-0.6241273, -0.3851086, -2.268072, 0, 0, 1, 1, 1,
-0.6238046, -0.4279242, -2.071822, 1, 0, 0, 1, 1,
-0.6235713, -1.565711, -1.274749, 1, 0, 0, 1, 1,
-0.6199648, 0.2524767, -1.508688, 1, 0, 0, 1, 1,
-0.6196913, 0.3431318, -1.4252, 1, 0, 0, 1, 1,
-0.6018646, -1.375292, -3.451782, 1, 0, 0, 1, 1,
-0.599884, -0.4961516, -2.440033, 0, 0, 0, 1, 1,
-0.5973091, -1.313721, -2.674316, 0, 0, 0, 1, 1,
-0.5955368, -1.632491, -1.85357, 0, 0, 0, 1, 1,
-0.5933307, -0.2728921, -0.7979666, 0, 0, 0, 1, 1,
-0.5833735, 0.2416085, -0.9531848, 0, 0, 0, 1, 1,
-0.582153, 0.006883363, -1.491613, 0, 0, 0, 1, 1,
-0.5808736, -0.8666917, -0.180971, 0, 0, 0, 1, 1,
-0.5726976, 1.118157, -0.5855668, 1, 1, 1, 1, 1,
-0.5724155, -0.181652, -3.057213, 1, 1, 1, 1, 1,
-0.5647821, 2.18736, 0.7111349, 1, 1, 1, 1, 1,
-0.563224, -0.3096466, -2.69574, 1, 1, 1, 1, 1,
-0.5593669, -0.690098, -2.522592, 1, 1, 1, 1, 1,
-0.5542662, -1.188867, -2.970717, 1, 1, 1, 1, 1,
-0.5471464, -0.7300704, -2.619205, 1, 1, 1, 1, 1,
-0.544588, -1.126858, -1.431422, 1, 1, 1, 1, 1,
-0.5431232, -1.313735, -3.259228, 1, 1, 1, 1, 1,
-0.5356287, 2.389387, -0.2703993, 1, 1, 1, 1, 1,
-0.5335131, 0.2015587, -1.653819, 1, 1, 1, 1, 1,
-0.5325143, 0.5246313, -0.03111082, 1, 1, 1, 1, 1,
-0.5315067, -1.473043, -4.276296, 1, 1, 1, 1, 1,
-0.5304769, -1.606318, -0.5513932, 1, 1, 1, 1, 1,
-0.5234378, -1.536307, -1.918511, 1, 1, 1, 1, 1,
-0.5197641, -0.6919478, -1.907317, 0, 0, 1, 1, 1,
-0.5168112, -0.9476426, -2.384335, 1, 0, 0, 1, 1,
-0.5038898, 0.8079379, -1.115827, 1, 0, 0, 1, 1,
-0.4992469, -0.4758797, -2.44515, 1, 0, 0, 1, 1,
-0.497853, 2.040707, -1.013862, 1, 0, 0, 1, 1,
-0.4975612, 0.6867247, -2.771021, 1, 0, 0, 1, 1,
-0.4905778, 0.5774228, -1.603042, 0, 0, 0, 1, 1,
-0.4901146, -1.090653, -2.7838, 0, 0, 0, 1, 1,
-0.4896652, 1.880679, -1.353803, 0, 0, 0, 1, 1,
-0.4893473, 1.383618, -0.0745236, 0, 0, 0, 1, 1,
-0.4861256, -0.1015146, -3.257269, 0, 0, 0, 1, 1,
-0.4860678, 0.7135643, -1.106784, 0, 0, 0, 1, 1,
-0.4841224, -0.7625056, -1.856592, 0, 0, 0, 1, 1,
-0.483632, 1.049271, 0.3787644, 1, 1, 1, 1, 1,
-0.4774174, 0.529225, -1.075423, 1, 1, 1, 1, 1,
-0.4766139, -0.791107, -1.921504, 1, 1, 1, 1, 1,
-0.4738638, 2.049181, 0.2299096, 1, 1, 1, 1, 1,
-0.4709592, -0.6267301, -2.07427, 1, 1, 1, 1, 1,
-0.4704827, -0.8729733, -4.650106, 1, 1, 1, 1, 1,
-0.4682721, -0.7510727, -1.844785, 1, 1, 1, 1, 1,
-0.4658014, -0.6343121, -3.071145, 1, 1, 1, 1, 1,
-0.465381, 0.2945866, -2.568799, 1, 1, 1, 1, 1,
-0.4532545, -0.1849916, -0.6176158, 1, 1, 1, 1, 1,
-0.4516873, 0.547977, -0.5371183, 1, 1, 1, 1, 1,
-0.451423, -0.006030947, 0.1601776, 1, 1, 1, 1, 1,
-0.4511404, 0.4642846, -0.5112118, 1, 1, 1, 1, 1,
-0.447278, -2.241973, -4.151624, 1, 1, 1, 1, 1,
-0.4418372, 0.1068716, -0.6795852, 1, 1, 1, 1, 1,
-0.4407743, 0.1416034, -1.293304, 0, 0, 1, 1, 1,
-0.438607, -1.527307, -4.336145, 1, 0, 0, 1, 1,
-0.4286139, 0.7107518, -0.3429969, 1, 0, 0, 1, 1,
-0.422512, 0.8858506, -0.002794256, 1, 0, 0, 1, 1,
-0.4223751, -1.657552, -3.452024, 1, 0, 0, 1, 1,
-0.420104, 0.7405316, 0.169613, 1, 0, 0, 1, 1,
-0.4193392, 0.3032828, -0.9980062, 0, 0, 0, 1, 1,
-0.4187821, 0.6853869, -1.188063, 0, 0, 0, 1, 1,
-0.4148657, -0.7848731, -1.852177, 0, 0, 0, 1, 1,
-0.4146902, 1.609967, -0.553877, 0, 0, 0, 1, 1,
-0.4129678, -0.6471025, -1.040814, 0, 0, 0, 1, 1,
-0.4074939, 1.851644, 0.8815197, 0, 0, 0, 1, 1,
-0.3969527, -0.2137623, -1.688476, 0, 0, 0, 1, 1,
-0.3955127, 0.1973227, -1.71366, 1, 1, 1, 1, 1,
-0.3883826, -0.1160552, -2.963902, 1, 1, 1, 1, 1,
-0.3875063, 0.370445, -2.200114, 1, 1, 1, 1, 1,
-0.3796867, -1.100048, -4.353582, 1, 1, 1, 1, 1,
-0.3793659, 1.400599, -0.7552723, 1, 1, 1, 1, 1,
-0.3639886, -0.1920577, -1.157543, 1, 1, 1, 1, 1,
-0.3635367, -1.611835, -1.768706, 1, 1, 1, 1, 1,
-0.3596511, -0.03441792, -1.246229, 1, 1, 1, 1, 1,
-0.3586871, 0.1659395, -1.435993, 1, 1, 1, 1, 1,
-0.3539958, -0.5243827, -2.727941, 1, 1, 1, 1, 1,
-0.3478196, 1.143682, 0.8614755, 1, 1, 1, 1, 1,
-0.3431834, 1.564341, -0.7767557, 1, 1, 1, 1, 1,
-0.3389421, 0.9625576, 1.16743, 1, 1, 1, 1, 1,
-0.335363, -0.03881253, -1.38998, 1, 1, 1, 1, 1,
-0.3336434, 2.316623, 1.452512, 1, 1, 1, 1, 1,
-0.3296362, -2.344985, -1.434447, 0, 0, 1, 1, 1,
-0.3270878, -0.6089904, -4.361791, 1, 0, 0, 1, 1,
-0.3145991, -0.1146859, -0.5176231, 1, 0, 0, 1, 1,
-0.3142676, -0.2484935, -1.759609, 1, 0, 0, 1, 1,
-0.3134967, 1.482712, 0.6908214, 1, 0, 0, 1, 1,
-0.3132896, -1.342384, -2.572039, 1, 0, 0, 1, 1,
-0.3110203, 1.008799, -0.8211848, 0, 0, 0, 1, 1,
-0.3103573, 0.2579398, -1.134759, 0, 0, 0, 1, 1,
-0.3074023, 1.375091, -0.9774184, 0, 0, 0, 1, 1,
-0.3062199, -0.4684494, -3.575209, 0, 0, 0, 1, 1,
-0.3057732, 0.1737265, -1.541213, 0, 0, 0, 1, 1,
-0.2991089, 0.7693105, 1.144966, 0, 0, 0, 1, 1,
-0.2979205, 0.9596205, -0.1914572, 0, 0, 0, 1, 1,
-0.2976552, -0.4571712, -1.916575, 1, 1, 1, 1, 1,
-0.2946262, -0.3355638, -2.894347, 1, 1, 1, 1, 1,
-0.2935114, -0.7966143, -3.62873, 1, 1, 1, 1, 1,
-0.2933855, 0.7436882, -0.2040607, 1, 1, 1, 1, 1,
-0.2919747, 1.10643, 0.1519419, 1, 1, 1, 1, 1,
-0.2910277, 0.9519524, 0.7114108, 1, 1, 1, 1, 1,
-0.2900342, 0.22102, 1.63432, 1, 1, 1, 1, 1,
-0.2897106, -1.482837, -2.30142, 1, 1, 1, 1, 1,
-0.2889979, 0.2488363, -0.9493921, 1, 1, 1, 1, 1,
-0.2863342, 0.1054709, -1.110693, 1, 1, 1, 1, 1,
-0.2855784, 0.490336, -1.083098, 1, 1, 1, 1, 1,
-0.2837338, -0.01555955, -1.416726, 1, 1, 1, 1, 1,
-0.2805757, 0.3209391, -0.3158406, 1, 1, 1, 1, 1,
-0.2778388, 0.4995257, -2.465999, 1, 1, 1, 1, 1,
-0.2741822, 0.2707491, -1.312336, 1, 1, 1, 1, 1,
-0.2698341, 0.4979645, -0.561211, 0, 0, 1, 1, 1,
-0.2676056, 0.2828369, -0.2135742, 1, 0, 0, 1, 1,
-0.2640609, 0.2502365, -0.7610418, 1, 0, 0, 1, 1,
-0.2632954, -0.3435118, -3.261394, 1, 0, 0, 1, 1,
-0.2626397, 0.3094301, -1.495966, 1, 0, 0, 1, 1,
-0.2613758, -0.4783535, -3.353017, 1, 0, 0, 1, 1,
-0.2583862, -0.6783661, -4.175741, 0, 0, 0, 1, 1,
-0.2556665, 1.13619, 0.1861342, 0, 0, 0, 1, 1,
-0.2543972, 1.959398, 0.02701695, 0, 0, 0, 1, 1,
-0.2537484, 0.6030176, 1.413629, 0, 0, 0, 1, 1,
-0.2491693, -1.362007, -3.113094, 0, 0, 0, 1, 1,
-0.2483642, -0.04470979, -1.773188, 0, 0, 0, 1, 1,
-0.2481726, -0.05615931, -2.806566, 0, 0, 0, 1, 1,
-0.248031, 0.2590315, -1.767985, 1, 1, 1, 1, 1,
-0.2403803, -0.5438088, -3.243518, 1, 1, 1, 1, 1,
-0.2371455, -1.283686, -1.146236, 1, 1, 1, 1, 1,
-0.2346588, -0.6484374, -1.005573, 1, 1, 1, 1, 1,
-0.2328204, -0.7303638, -3.562704, 1, 1, 1, 1, 1,
-0.2306265, -0.7190785, -4.22135, 1, 1, 1, 1, 1,
-0.22954, 1.079765, 0.518323, 1, 1, 1, 1, 1,
-0.227889, -1.084344, -3.428305, 1, 1, 1, 1, 1,
-0.2269888, 1.527456, -0.6791519, 1, 1, 1, 1, 1,
-0.2268851, -1.595084, -1.795119, 1, 1, 1, 1, 1,
-0.2255065, 0.912966, -1.163267, 1, 1, 1, 1, 1,
-0.220142, 0.2667011, 0.03977112, 1, 1, 1, 1, 1,
-0.2195074, 1.112602, 0.01786273, 1, 1, 1, 1, 1,
-0.2190709, -0.9831542, -3.527727, 1, 1, 1, 1, 1,
-0.217158, 0.7858191, -0.383631, 1, 1, 1, 1, 1,
-0.2165645, 1.292827, -1.162282, 0, 0, 1, 1, 1,
-0.2163758, -0.6758237, -3.922186, 1, 0, 0, 1, 1,
-0.2140911, -0.2835003, -3.094481, 1, 0, 0, 1, 1,
-0.2135306, 1.331792, -0.831904, 1, 0, 0, 1, 1,
-0.2117704, 0.9547659, -1.753135, 1, 0, 0, 1, 1,
-0.2110466, -0.7216678, -3.914972, 1, 0, 0, 1, 1,
-0.1990719, 0.5563065, -0.07761752, 0, 0, 0, 1, 1,
-0.1898309, 0.08024261, -2.903287, 0, 0, 0, 1, 1,
-0.1891171, 0.5586838, -0.3588255, 0, 0, 0, 1, 1,
-0.1880428, 0.6875146, 0.6941593, 0, 0, 0, 1, 1,
-0.1835752, -0.1570302, -0.07834634, 0, 0, 0, 1, 1,
-0.1829114, 0.09096403, -0.9192901, 0, 0, 0, 1, 1,
-0.1824506, 1.017505, -2.129569, 0, 0, 0, 1, 1,
-0.1811355, -0.01181023, -2.186735, 1, 1, 1, 1, 1,
-0.1773506, -0.3801226, -2.704742, 1, 1, 1, 1, 1,
-0.1771631, 0.1813599, 0.3081683, 1, 1, 1, 1, 1,
-0.1743246, 1.097712, 0.3982911, 1, 1, 1, 1, 1,
-0.1728367, -0.5847448, -1.973007, 1, 1, 1, 1, 1,
-0.1715943, -0.06480142, -3.464891, 1, 1, 1, 1, 1,
-0.1709874, 2.387734, 1.34849, 1, 1, 1, 1, 1,
-0.1704999, -1.43978, -3.375028, 1, 1, 1, 1, 1,
-0.1698782, 0.8166039, -0.6337674, 1, 1, 1, 1, 1,
-0.1647428, 1.282073, 0.4786775, 1, 1, 1, 1, 1,
-0.1644032, 0.1399258, 0.4903311, 1, 1, 1, 1, 1,
-0.1639278, 0.9463314, 1.287636, 1, 1, 1, 1, 1,
-0.1611188, -0.4332437, -1.807737, 1, 1, 1, 1, 1,
-0.159158, 1.248257, 0.1943106, 1, 1, 1, 1, 1,
-0.1543601, -1.237089, -3.135, 1, 1, 1, 1, 1,
-0.1525062, 0.1876201, -1.406495, 0, 0, 1, 1, 1,
-0.1500648, 0.7035137, -2.539263, 1, 0, 0, 1, 1,
-0.1455632, -1.02238, -2.664389, 1, 0, 0, 1, 1,
-0.1435924, -0.8905967, -2.858135, 1, 0, 0, 1, 1,
-0.1431723, 1.201746, 0.2407087, 1, 0, 0, 1, 1,
-0.140853, 1.563803, -0.4054798, 1, 0, 0, 1, 1,
-0.1372744, -0.4246059, -2.77901, 0, 0, 0, 1, 1,
-0.135652, -0.2998504, -4.130177, 0, 0, 0, 1, 1,
-0.132256, 0.1192525, -1.088924, 0, 0, 0, 1, 1,
-0.1302325, -0.3506787, -3.133388, 0, 0, 0, 1, 1,
-0.1256691, 0.5511737, -0.2998222, 0, 0, 0, 1, 1,
-0.1238108, 0.0855663, -1.191507, 0, 0, 0, 1, 1,
-0.1194622, 0.01816235, -0.4815305, 0, 0, 0, 1, 1,
-0.1189996, -1.282481, -2.000838, 1, 1, 1, 1, 1,
-0.1161801, 0.07657151, -0.3125257, 1, 1, 1, 1, 1,
-0.115375, -0.5737779, -2.677712, 1, 1, 1, 1, 1,
-0.1140114, -0.3033193, -1.826112, 1, 1, 1, 1, 1,
-0.1117838, 0.5397438, 0.2282989, 1, 1, 1, 1, 1,
-0.1110371, -1.238992, -2.632039, 1, 1, 1, 1, 1,
-0.1100975, 0.4500437, -0.8667538, 1, 1, 1, 1, 1,
-0.1077335, -0.857124, -3.772853, 1, 1, 1, 1, 1,
-0.1061867, 2.0614, -0.4429107, 1, 1, 1, 1, 1,
-0.1060646, 0.9278061, 0.2513249, 1, 1, 1, 1, 1,
-0.1042016, 0.7059393, -0.9072397, 1, 1, 1, 1, 1,
-0.1024551, -0.9518039, -3.540352, 1, 1, 1, 1, 1,
-0.09834149, 0.5533814, 0.6927117, 1, 1, 1, 1, 1,
-0.0978512, -0.1708062, -1.445358, 1, 1, 1, 1, 1,
-0.0933205, 0.7186635, -0.8565897, 1, 1, 1, 1, 1,
-0.08939126, 0.2899562, -2.221744, 0, 0, 1, 1, 1,
-0.08904709, 0.3608271, 0.1264436, 1, 0, 0, 1, 1,
-0.08558602, -0.9494264, -1.59621, 1, 0, 0, 1, 1,
-0.0850242, -0.6817872, -3.530422, 1, 0, 0, 1, 1,
-0.08344316, 0.6942924, 0.3890893, 1, 0, 0, 1, 1,
-0.08245134, 0.9819392, -1.412801, 1, 0, 0, 1, 1,
-0.0795253, -1.173784, -3.755893, 0, 0, 0, 1, 1,
-0.0786531, 0.0501431, 0.8575912, 0, 0, 0, 1, 1,
-0.0762139, 0.6981495, 0.6944609, 0, 0, 0, 1, 1,
-0.07030526, -1.241772, -3.107457, 0, 0, 0, 1, 1,
-0.06840834, -0.3708978, -2.495147, 0, 0, 0, 1, 1,
-0.06821033, 1.505185, -0.6569124, 0, 0, 0, 1, 1,
-0.06272988, -0.7026383, -3.3743, 0, 0, 0, 1, 1,
-0.05822346, -0.5743834, -3.319412, 1, 1, 1, 1, 1,
-0.05655281, 1.019302, 0.8743407, 1, 1, 1, 1, 1,
-0.05521546, 0.5032844, -0.5163358, 1, 1, 1, 1, 1,
-0.05433926, 0.2150296, -1.862512, 1, 1, 1, 1, 1,
-0.05369956, -0.5558883, -3.876565, 1, 1, 1, 1, 1,
-0.04966575, 0.5672437, 1.517974, 1, 1, 1, 1, 1,
-0.04334139, 0.510362, -0.602447, 1, 1, 1, 1, 1,
-0.0401102, 0.9393325, -0.679611, 1, 1, 1, 1, 1,
-0.03876393, 0.1283993, 0.01920234, 1, 1, 1, 1, 1,
-0.03754546, -2.062876, -1.670529, 1, 1, 1, 1, 1,
-0.03700383, 0.02016581, -1.952063, 1, 1, 1, 1, 1,
-0.03604545, 0.3033693, 0.9373445, 1, 1, 1, 1, 1,
-0.03529982, -1.740365, -4.329699, 1, 1, 1, 1, 1,
-0.03348291, -0.3494677, -3.372315, 1, 1, 1, 1, 1,
-0.03092868, -0.1934336, -2.409539, 1, 1, 1, 1, 1,
-0.0291754, -1.103152, -1.738925, 0, 0, 1, 1, 1,
-0.0250066, -0.1064461, -2.798711, 1, 0, 0, 1, 1,
-0.02478851, -0.3153725, -4.129459, 1, 0, 0, 1, 1,
-0.02463829, 1.374097, -0.7519491, 1, 0, 0, 1, 1,
-0.0244313, -1.840203, -3.580446, 1, 0, 0, 1, 1,
-0.02136401, 0.6281591, 1.447225, 1, 0, 0, 1, 1,
-0.01871762, -0.9360654, -2.544637, 0, 0, 0, 1, 1,
-0.01447995, 0.13046, 1.71558, 0, 0, 0, 1, 1,
-0.0124738, 1.866388, -0.1392042, 0, 0, 0, 1, 1,
-0.01183944, -0.5285267, -2.374794, 0, 0, 0, 1, 1,
-0.0114955, 0.04598814, 1.26309, 0, 0, 0, 1, 1,
-0.00783468, -0.2873896, -4.259584, 0, 0, 0, 1, 1,
0.0001942766, -0.1054059, 2.438071, 0, 0, 0, 1, 1,
0.005849653, 1.134294, 1.736071, 1, 1, 1, 1, 1,
0.01423423, 0.1339238, -2.316722, 1, 1, 1, 1, 1,
0.01832621, 1.428402, 0.1882763, 1, 1, 1, 1, 1,
0.01950064, -0.9873468, 3.137082, 1, 1, 1, 1, 1,
0.0228598, 0.4275633, -0.4124735, 1, 1, 1, 1, 1,
0.03038033, -0.9894578, 5.215181, 1, 1, 1, 1, 1,
0.0327259, -1.2144, 3.471181, 1, 1, 1, 1, 1,
0.03279308, 0.7589939, -1.27745, 1, 1, 1, 1, 1,
0.03599748, 1.7882, -0.8145171, 1, 1, 1, 1, 1,
0.0363086, 0.2299239, -2.024712, 1, 1, 1, 1, 1,
0.04052068, -0.9017543, 4.774602, 1, 1, 1, 1, 1,
0.04188535, -1.451857, 3.29404, 1, 1, 1, 1, 1,
0.04325279, 0.3710299, 0.6272115, 1, 1, 1, 1, 1,
0.04450354, -0.8781754, 2.885232, 1, 1, 1, 1, 1,
0.04574761, 0.1356192, -0.4862427, 1, 1, 1, 1, 1,
0.05080685, -0.6616382, 1.404927, 0, 0, 1, 1, 1,
0.053269, 0.2413115, 0.3746268, 1, 0, 0, 1, 1,
0.05550834, -1.798563, 4.459485, 1, 0, 0, 1, 1,
0.05602885, 0.2297824, -0.2536762, 1, 0, 0, 1, 1,
0.06183948, -0.5256944, 2.737406, 1, 0, 0, 1, 1,
0.06669415, 1.096632, -0.8668883, 1, 0, 0, 1, 1,
0.06836026, 0.761286, 0.4835577, 0, 0, 0, 1, 1,
0.06964948, 1.067355, 2.087325, 0, 0, 0, 1, 1,
0.07022884, -0.1311214, 2.246332, 0, 0, 0, 1, 1,
0.07024715, -0.5464588, 1.536021, 0, 0, 0, 1, 1,
0.07227828, 0.7172227, -0.6996847, 0, 0, 0, 1, 1,
0.07437196, -1.064282, 3.70295, 0, 0, 0, 1, 1,
0.07507458, 1.672517, -1.367244, 0, 0, 0, 1, 1,
0.0779198, 0.1136148, -0.04147388, 1, 1, 1, 1, 1,
0.07824448, -0.1493205, 1.275991, 1, 1, 1, 1, 1,
0.07898014, 0.2643068, -0.7151124, 1, 1, 1, 1, 1,
0.08350454, -1.085121, 2.03293, 1, 1, 1, 1, 1,
0.08668391, 1.516055, -1.248418, 1, 1, 1, 1, 1,
0.08897507, -1.269573, 3.530905, 1, 1, 1, 1, 1,
0.0928849, -0.3450337, 2.293509, 1, 1, 1, 1, 1,
0.09543305, 0.5581912, -1.263138, 1, 1, 1, 1, 1,
0.09546327, 0.5011553, -0.02818174, 1, 1, 1, 1, 1,
0.09638951, -1.213544, 3.710825, 1, 1, 1, 1, 1,
0.09762809, -1.164354, 3.320937, 1, 1, 1, 1, 1,
0.1013531, -1.500595, 3.197498, 1, 1, 1, 1, 1,
0.101631, -0.06465349, 2.189139, 1, 1, 1, 1, 1,
0.1037228, -1.93078, 2.104546, 1, 1, 1, 1, 1,
0.1039752, -0.2805121, 2.319147, 1, 1, 1, 1, 1,
0.1043112, 0.7465261, 0.9118362, 0, 0, 1, 1, 1,
0.1053531, 0.1580084, 0.3864859, 1, 0, 0, 1, 1,
0.1066439, 0.02559016, 0.6049839, 1, 0, 0, 1, 1,
0.1086989, 0.7899684, -2.67156, 1, 0, 0, 1, 1,
0.1095974, 0.846984, -0.4076881, 1, 0, 0, 1, 1,
0.1100259, 0.2032623, -0.04052638, 1, 0, 0, 1, 1,
0.1107804, 1.068448, -1.190913, 0, 0, 0, 1, 1,
0.111848, -0.1514546, 2.594813, 0, 0, 0, 1, 1,
0.1141663, 1.593627, 0.04795356, 0, 0, 0, 1, 1,
0.1148056, 2.609135, 0.2458969, 0, 0, 0, 1, 1,
0.1152891, -0.3684302, 1.917614, 0, 0, 0, 1, 1,
0.1168112, 0.1373589, 0.738602, 0, 0, 0, 1, 1,
0.1229073, 0.2655945, 0.3225239, 0, 0, 0, 1, 1,
0.1247619, 1.55356, 0.9132541, 1, 1, 1, 1, 1,
0.1377299, -0.6045789, 1.915651, 1, 1, 1, 1, 1,
0.138563, -1.291006, 3.804814, 1, 1, 1, 1, 1,
0.1395812, -0.9069508, 2.735833, 1, 1, 1, 1, 1,
0.1435262, -0.9075506, 3.193199, 1, 1, 1, 1, 1,
0.1492977, 0.9561649, -1.74241, 1, 1, 1, 1, 1,
0.1513536, 0.093265, 1.799606, 1, 1, 1, 1, 1,
0.1519109, 1.590005, -0.3423834, 1, 1, 1, 1, 1,
0.1546083, 0.5553089, 0.6276221, 1, 1, 1, 1, 1,
0.1697078, -1.113171, 3.924165, 1, 1, 1, 1, 1,
0.1744999, -1.347303, 3.823841, 1, 1, 1, 1, 1,
0.1751645, 0.6087948, 0.6795847, 1, 1, 1, 1, 1,
0.1784868, 0.2060449, 1.146606, 1, 1, 1, 1, 1,
0.1811258, -0.5901215, 4.32129, 1, 1, 1, 1, 1,
0.1847151, 0.5957261, 0.1841347, 1, 1, 1, 1, 1,
0.1887368, 0.1130841, 0.8303589, 0, 0, 1, 1, 1,
0.1938744, -0.6592269, 3.84163, 1, 0, 0, 1, 1,
0.2034694, 0.9212121, -0.5771057, 1, 0, 0, 1, 1,
0.2128406, -0.1112096, 3.047507, 1, 0, 0, 1, 1,
0.2144068, -1.100352, 2.153111, 1, 0, 0, 1, 1,
0.2148433, 2.225037, 1.025319, 1, 0, 0, 1, 1,
0.2185861, -0.8631641, 2.678243, 0, 0, 0, 1, 1,
0.2332961, -0.2959606, 2.444846, 0, 0, 0, 1, 1,
0.2335309, -0.7331836, 2.776827, 0, 0, 0, 1, 1,
0.2341193, -0.7728349, 3.577511, 0, 0, 0, 1, 1,
0.2415131, 0.7110228, 1.144325, 0, 0, 0, 1, 1,
0.2438334, -0.2357306, 3.379635, 0, 0, 0, 1, 1,
0.2475102, 0.134174, 1.379192, 0, 0, 0, 1, 1,
0.2495383, 1.206052, -0.8833054, 1, 1, 1, 1, 1,
0.2519245, 0.6099815, 0.8952452, 1, 1, 1, 1, 1,
0.2606928, -1.608341, 2.917375, 1, 1, 1, 1, 1,
0.2607183, 1.254236, 1.202232, 1, 1, 1, 1, 1,
0.2676124, -0.8946077, 2.789098, 1, 1, 1, 1, 1,
0.2723421, -0.5273024, 2.225252, 1, 1, 1, 1, 1,
0.2750824, -0.5970193, 3.314189, 1, 1, 1, 1, 1,
0.277412, -1.226421, 2.707728, 1, 1, 1, 1, 1,
0.2819321, -0.4032037, 1.814917, 1, 1, 1, 1, 1,
0.2839729, 0.4285655, 0.6642684, 1, 1, 1, 1, 1,
0.2905745, -1.002134, 2.131823, 1, 1, 1, 1, 1,
0.3054814, -0.6051798, 0.7921966, 1, 1, 1, 1, 1,
0.3070734, -0.08821909, 3.151527, 1, 1, 1, 1, 1,
0.3082275, 0.6853128, 1.618567, 1, 1, 1, 1, 1,
0.3118008, -0.3417506, 2.32762, 1, 1, 1, 1, 1,
0.3141452, -0.5156621, 1.395149, 0, 0, 1, 1, 1,
0.3141698, -0.4877042, 2.159405, 1, 0, 0, 1, 1,
0.3146098, -0.4001618, 2.914521, 1, 0, 0, 1, 1,
0.3151035, -0.6844323, 1.854328, 1, 0, 0, 1, 1,
0.3163158, -0.06679767, 1.852835, 1, 0, 0, 1, 1,
0.3185404, -1.006106, 2.99354, 1, 0, 0, 1, 1,
0.3199455, 0.4582352, 1.339418, 0, 0, 0, 1, 1,
0.3231182, 1.781514, -0.5026823, 0, 0, 0, 1, 1,
0.3268246, -0.5427478, 3.108937, 0, 0, 0, 1, 1,
0.3299719, 0.03654182, 1.293389, 0, 0, 0, 1, 1,
0.3352494, -0.3506442, 3.315474, 0, 0, 0, 1, 1,
0.3356044, 2.080836, 2.211462, 0, 0, 0, 1, 1,
0.336239, -0.2633985, 0.7113503, 0, 0, 0, 1, 1,
0.3420361, -0.6570632, 2.491272, 1, 1, 1, 1, 1,
0.3526071, -0.370546, 3.380416, 1, 1, 1, 1, 1,
0.3539244, -2.619836, 2.518394, 1, 1, 1, 1, 1,
0.3589587, -0.59917, 3.848, 1, 1, 1, 1, 1,
0.3628821, 0.4362448, 0.2645716, 1, 1, 1, 1, 1,
0.363157, 1.680264, 1.39813, 1, 1, 1, 1, 1,
0.3639048, -0.07046521, 2.948305, 1, 1, 1, 1, 1,
0.3641008, 1.077268, 0.4195876, 1, 1, 1, 1, 1,
0.371914, -1.08364, 4.080199, 1, 1, 1, 1, 1,
0.3740148, 0.6261932, 1.105456, 1, 1, 1, 1, 1,
0.3748614, -0.08963234, 2.276723, 1, 1, 1, 1, 1,
0.3751454, 0.5250471, 1.572596, 1, 1, 1, 1, 1,
0.3759512, 0.9456298, -2.005777, 1, 1, 1, 1, 1,
0.3784299, 0.4566012, 2.25559, 1, 1, 1, 1, 1,
0.3865525, -1.882613, 1.989863, 1, 1, 1, 1, 1,
0.3888288, 0.8243966, 0.4137743, 0, 0, 1, 1, 1,
0.4029604, 0.5096121, 1.303937, 1, 0, 0, 1, 1,
0.4031099, 0.8426608, -0.1211132, 1, 0, 0, 1, 1,
0.405981, -1.963976, 3.446027, 1, 0, 0, 1, 1,
0.4107198, -0.4140427, 2.952543, 1, 0, 0, 1, 1,
0.4176732, 0.3157024, -1.388202, 1, 0, 0, 1, 1,
0.4184702, 0.4132074, 0.4350614, 0, 0, 0, 1, 1,
0.4202869, -0.8570348, 1.988212, 0, 0, 0, 1, 1,
0.4205219, -0.2068706, 2.60821, 0, 0, 0, 1, 1,
0.4218476, 0.4441755, 1.596871, 0, 0, 0, 1, 1,
0.4263062, -0.7311117, 1.85507, 0, 0, 0, 1, 1,
0.4269953, -2.472196, 3.679216, 0, 0, 0, 1, 1,
0.431363, -1.151267, 1.058078, 0, 0, 0, 1, 1,
0.4322286, -0.2142013, 3.994321, 1, 1, 1, 1, 1,
0.4437995, -0.07212385, 1.928535, 1, 1, 1, 1, 1,
0.4505427, 1.686146, 0.9455875, 1, 1, 1, 1, 1,
0.454562, 1.73781, 0.8823791, 1, 1, 1, 1, 1,
0.4578207, 0.7770841, 0.834676, 1, 1, 1, 1, 1,
0.4585222, -0.03534208, 0.3630422, 1, 1, 1, 1, 1,
0.4588624, -2.220281, 1.031324, 1, 1, 1, 1, 1,
0.4596844, 0.7147447, -1.748337, 1, 1, 1, 1, 1,
0.4622672, -0.8126961, 3.611035, 1, 1, 1, 1, 1,
0.4684875, -0.09372076, 2.821074, 1, 1, 1, 1, 1,
0.4715171, -0.6600147, 2.360511, 1, 1, 1, 1, 1,
0.4730929, 0.5491455, 1.687848, 1, 1, 1, 1, 1,
0.477346, -0.1928031, 0.6532859, 1, 1, 1, 1, 1,
0.484352, 0.5324309, 2.280805, 1, 1, 1, 1, 1,
0.4864124, -0.2226427, 2.213106, 1, 1, 1, 1, 1,
0.4871719, -1.281959, 2.794344, 0, 0, 1, 1, 1,
0.4874021, -0.2297353, 1.092924, 1, 0, 0, 1, 1,
0.4878614, -2.010288, 3.031511, 1, 0, 0, 1, 1,
0.4899009, 0.222137, 0.9223748, 1, 0, 0, 1, 1,
0.4905493, 0.5254691, 1.481946, 1, 0, 0, 1, 1,
0.4937998, 0.2679032, 0.09381159, 1, 0, 0, 1, 1,
0.4977832, -0.7097351, 1.471056, 0, 0, 0, 1, 1,
0.5036796, 0.968652, 0.3756103, 0, 0, 0, 1, 1,
0.5042883, 1.407161, 1.963245, 0, 0, 0, 1, 1,
0.511741, 1.240268, 0.7638192, 0, 0, 0, 1, 1,
0.5117866, 0.4701256, 0.1680742, 0, 0, 0, 1, 1,
0.5135964, 0.6243868, 0.4684647, 0, 0, 0, 1, 1,
0.5142912, 0.4725668, 0.661051, 0, 0, 0, 1, 1,
0.51635, -0.4755779, 1.973205, 1, 1, 1, 1, 1,
0.5194039, -1.220339, 0.8390656, 1, 1, 1, 1, 1,
0.5204532, -1.465642, 4.029841, 1, 1, 1, 1, 1,
0.5208958, -1.209426, 2.884459, 1, 1, 1, 1, 1,
0.5315011, 0.4801049, 2.783539, 1, 1, 1, 1, 1,
0.532975, -0.8616827, 1.749544, 1, 1, 1, 1, 1,
0.5334259, -1.246446, 1.890491, 1, 1, 1, 1, 1,
0.5346162, 1.210357, 0.8639367, 1, 1, 1, 1, 1,
0.5401921, 0.6115319, 1.204207, 1, 1, 1, 1, 1,
0.5413283, 0.7611603, -1.621585, 1, 1, 1, 1, 1,
0.5432398, -1.943107, 3.788394, 1, 1, 1, 1, 1,
0.5434982, 0.4285084, 1.767343, 1, 1, 1, 1, 1,
0.5475494, -0.3504972, 1.735586, 1, 1, 1, 1, 1,
0.5496499, 1.171351, 0.3200648, 1, 1, 1, 1, 1,
0.5540604, 0.2593436, 2.727489, 1, 1, 1, 1, 1,
0.5685132, 0.3034869, -0.7675174, 0, 0, 1, 1, 1,
0.5794945, -1.362264, 2.386074, 1, 0, 0, 1, 1,
0.5807183, 2.297619, 2.025949, 1, 0, 0, 1, 1,
0.5815595, 0.5743409, -0.2035111, 1, 0, 0, 1, 1,
0.5827677, -0.1421784, 0.3227805, 1, 0, 0, 1, 1,
0.5843358, -0.6050217, 0.4616255, 1, 0, 0, 1, 1,
0.5894622, -0.2077492, 2.367953, 0, 0, 0, 1, 1,
0.5925747, -1.141245, 3.831837, 0, 0, 0, 1, 1,
0.5934191, 0.08466832, -0.6450352, 0, 0, 0, 1, 1,
0.59407, -0.4369823, 2.022867, 0, 0, 0, 1, 1,
0.5970429, 0.7588379, 0.6326545, 0, 0, 0, 1, 1,
0.599712, 2.007276, 0.6631072, 0, 0, 0, 1, 1,
0.6001346, -0.8438014, 2.66571, 0, 0, 0, 1, 1,
0.6015211, -2.332733, 3.410381, 1, 1, 1, 1, 1,
0.607176, -1.173489, 2.472911, 1, 1, 1, 1, 1,
0.6077129, 0.979634, 1.934506, 1, 1, 1, 1, 1,
0.6108489, -1.591896, 2.76125, 1, 1, 1, 1, 1,
0.6210706, 0.2683348, 2.383986, 1, 1, 1, 1, 1,
0.6221424, -0.2958479, 1.130616, 1, 1, 1, 1, 1,
0.6235924, 0.2050099, 0.5219463, 1, 1, 1, 1, 1,
0.6249101, 1.412824, 0.7066379, 1, 1, 1, 1, 1,
0.6262017, -1.62392, 1.408826, 1, 1, 1, 1, 1,
0.6270454, -0.9447895, 3.281758, 1, 1, 1, 1, 1,
0.6299881, 0.5912409, 1.311623, 1, 1, 1, 1, 1,
0.6301871, 0.7045139, 0.5397856, 1, 1, 1, 1, 1,
0.6312871, -0.04522532, 0.6516893, 1, 1, 1, 1, 1,
0.6363776, 1.264626, -0.1047967, 1, 1, 1, 1, 1,
0.6392429, 1.45285, -1.272535, 1, 1, 1, 1, 1,
0.640003, -0.8141561, 3.244745, 0, 0, 1, 1, 1,
0.6437183, 0.4034446, 0.5074736, 1, 0, 0, 1, 1,
0.6443266, -0.02246856, 1.862532, 1, 0, 0, 1, 1,
0.6445785, 1.588195, -0.2279407, 1, 0, 0, 1, 1,
0.6512098, 1.35419, 1.836463, 1, 0, 0, 1, 1,
0.6512918, -0.2398123, 1.255843, 1, 0, 0, 1, 1,
0.6559904, -1.404531, 2.276044, 0, 0, 0, 1, 1,
0.6624255, 0.4878576, -0.1009961, 0, 0, 0, 1, 1,
0.662789, -0.09710509, 2.309864, 0, 0, 0, 1, 1,
0.6631596, 1.63933, 0.08478267, 0, 0, 0, 1, 1,
0.665436, 0.3763439, -0.8054246, 0, 0, 0, 1, 1,
0.673411, 1.255963, 0.7984438, 0, 0, 0, 1, 1,
0.6788458, 1.137639, 2.320919, 0, 0, 0, 1, 1,
0.6805456, -0.4909795, 3.18982, 1, 1, 1, 1, 1,
0.695102, 0.08324454, 1.409, 1, 1, 1, 1, 1,
0.6994602, 1.039688, 1.365354, 1, 1, 1, 1, 1,
0.6996426, 1.031541, 1.524736, 1, 1, 1, 1, 1,
0.7011145, 2.118165, 1.013081, 1, 1, 1, 1, 1,
0.7013806, -0.1113831, 2.085959, 1, 1, 1, 1, 1,
0.7085035, -2.307159, 1.607562, 1, 1, 1, 1, 1,
0.7088038, 0.1539294, 1.305908, 1, 1, 1, 1, 1,
0.7095028, 0.3070413, -0.5861892, 1, 1, 1, 1, 1,
0.7101123, -2.002775, 4.025225, 1, 1, 1, 1, 1,
0.7102289, 0.9486139, 0.6722379, 1, 1, 1, 1, 1,
0.7185182, 2.056563, 0.03777658, 1, 1, 1, 1, 1,
0.7188465, 1.004087, -0.2574578, 1, 1, 1, 1, 1,
0.7235604, 0.9534653, 2.404205, 1, 1, 1, 1, 1,
0.7292265, -0.2614976, 1.622217, 1, 1, 1, 1, 1,
0.7308918, -0.9509247, 2.827559, 0, 0, 1, 1, 1,
0.7377432, 0.0238139, 2.721167, 1, 0, 0, 1, 1,
0.7393082, -1.251683, 2.529248, 1, 0, 0, 1, 1,
0.7408453, -0.525755, 3.451736, 1, 0, 0, 1, 1,
0.7411432, 0.3848942, 2.702723, 1, 0, 0, 1, 1,
0.744045, -0.3497925, 3.062212, 1, 0, 0, 1, 1,
0.7449989, -0.9970393, 3.607039, 0, 0, 0, 1, 1,
0.7452129, -2.204949, 3.229968, 0, 0, 0, 1, 1,
0.7466512, -0.4176818, 0.9599955, 0, 0, 0, 1, 1,
0.7514786, 0.4470667, 1.169463, 0, 0, 0, 1, 1,
0.7551006, 1.338483, 0.9904878, 0, 0, 0, 1, 1,
0.7563937, 0.3324068, 1.609094, 0, 0, 0, 1, 1,
0.7571187, -1.427449, 1.763905, 0, 0, 0, 1, 1,
0.7675532, 0.4975003, -0.1712638, 1, 1, 1, 1, 1,
0.7708132, 0.5843153, 0.6711872, 1, 1, 1, 1, 1,
0.7711549, -0.7585204, 1.641806, 1, 1, 1, 1, 1,
0.7788352, -1.732222, 3.119539, 1, 1, 1, 1, 1,
0.7820241, -0.7438774, 5.04463, 1, 1, 1, 1, 1,
0.7875397, 1.239708, 0.7680089, 1, 1, 1, 1, 1,
0.7903717, 0.09057403, 0.3085826, 1, 1, 1, 1, 1,
0.7927796, -0.149445, 1.142254, 1, 1, 1, 1, 1,
0.7980579, 0.8848233, 0.2529493, 1, 1, 1, 1, 1,
0.7987366, 2.603713, -0.6537468, 1, 1, 1, 1, 1,
0.7990068, -2.183184, 2.658403, 1, 1, 1, 1, 1,
0.8016532, -2.283313, 2.170577, 1, 1, 1, 1, 1,
0.8023909, 0.2155772, 2.02224, 1, 1, 1, 1, 1,
0.8026347, 1.122337, -0.8825984, 1, 1, 1, 1, 1,
0.80488, 1.424891, -0.713284, 1, 1, 1, 1, 1,
0.8142496, 1.061681, 1.29565, 0, 0, 1, 1, 1,
0.8154317, 1.294674, 0.9156141, 1, 0, 0, 1, 1,
0.8183013, -0.2486253, 0.510498, 1, 0, 0, 1, 1,
0.8292674, 0.6153702, 1.077675, 1, 0, 0, 1, 1,
0.8307981, -0.4815022, 1.303996, 1, 0, 0, 1, 1,
0.83092, -1.097828, 1.390494, 1, 0, 0, 1, 1,
0.8310733, 0.6873466, 0.3203184, 0, 0, 0, 1, 1,
0.8330547, -0.7923518, 3.735175, 0, 0, 0, 1, 1,
0.8445675, -1.309905, 2.804899, 0, 0, 0, 1, 1,
0.8450567, 2.319384, 1.325334, 0, 0, 0, 1, 1,
0.8479551, -1.627161, 3.513585, 0, 0, 0, 1, 1,
0.8485774, -1.062698, 2.994054, 0, 0, 0, 1, 1,
0.848834, -1.141838, 3.664809, 0, 0, 0, 1, 1,
0.8497477, 1.674929, 0.566895, 1, 1, 1, 1, 1,
0.8541186, -1.051126, 2.035943, 1, 1, 1, 1, 1,
0.8561466, -0.9753195, 3.479644, 1, 1, 1, 1, 1,
0.8613045, -0.2606989, 1.797401, 1, 1, 1, 1, 1,
0.8629208, -1.274711, 3.435857, 1, 1, 1, 1, 1,
0.8631812, -1.572836, 2.602658, 1, 1, 1, 1, 1,
0.870122, -3.406498, 1.141705, 1, 1, 1, 1, 1,
0.8706723, 1.292644, 0.8805137, 1, 1, 1, 1, 1,
0.870932, 0.2892288, 3.020763, 1, 1, 1, 1, 1,
0.8723105, 0.9569933, 1.553611, 1, 1, 1, 1, 1,
0.8745509, -0.6436775, 0.881911, 1, 1, 1, 1, 1,
0.8753271, -0.6718447, 1.750881, 1, 1, 1, 1, 1,
0.8781636, 0.2318016, 0.5102943, 1, 1, 1, 1, 1,
0.8821303, -0.6275113, 0.5205529, 1, 1, 1, 1, 1,
0.8861547, -0.2691274, 1.956276, 1, 1, 1, 1, 1,
0.8873546, -0.419531, 1.049114, 0, 0, 1, 1, 1,
0.8993054, 0.773994, -0.07624794, 1, 0, 0, 1, 1,
0.9051375, 0.02227868, 1.740673, 1, 0, 0, 1, 1,
0.9066992, -1.655755, 1.062546, 1, 0, 0, 1, 1,
0.9074895, 0.5004589, 0.1214747, 1, 0, 0, 1, 1,
0.913782, -1.212597, 0.456589, 1, 0, 0, 1, 1,
0.92403, -0.6335061, 2.865332, 0, 0, 0, 1, 1,
0.9246317, 1.331355, 1.664526, 0, 0, 0, 1, 1,
0.925577, -0.811884, 2.394693, 0, 0, 0, 1, 1,
0.9266341, -1.059527, 2.575489, 0, 0, 0, 1, 1,
0.9280086, -0.2590286, 0.9397374, 0, 0, 0, 1, 1,
0.9282165, 0.6529773, 2.337884, 0, 0, 0, 1, 1,
0.9343984, -0.09467975, -0.3970777, 0, 0, 0, 1, 1,
0.9348348, -0.5887248, 1.932336, 1, 1, 1, 1, 1,
0.940639, 0.7359311, 0.2711577, 1, 1, 1, 1, 1,
0.9420161, -0.6207113, 0.9675895, 1, 1, 1, 1, 1,
0.9431371, -1.136723, 3.26038, 1, 1, 1, 1, 1,
0.9508051, 0.4766881, 1.087248, 1, 1, 1, 1, 1,
0.9524307, -1.00537, 0.8189197, 1, 1, 1, 1, 1,
0.9525369, 0.8703181, 2.059424, 1, 1, 1, 1, 1,
0.9525954, -1.30898, 0.6844215, 1, 1, 1, 1, 1,
0.9569467, 1.810621, -0.2729132, 1, 1, 1, 1, 1,
0.9573885, -0.3211398, 2.984156, 1, 1, 1, 1, 1,
0.9612773, 3.14027, 0.7245114, 1, 1, 1, 1, 1,
0.9613868, -0.06147931, 4.333884, 1, 1, 1, 1, 1,
0.9770864, 1.212106, 1.909789, 1, 1, 1, 1, 1,
0.981967, -0.8028909, 2.481997, 1, 1, 1, 1, 1,
0.9871864, -0.5918102, 2.354084, 1, 1, 1, 1, 1,
0.9923303, -0.5664521, 1.933873, 0, 0, 1, 1, 1,
0.9954563, -0.0293441, 4.384163, 1, 0, 0, 1, 1,
0.9955107, 0.3928059, -1.177152, 1, 0, 0, 1, 1,
1.0053, 0.6366147, 1.912777, 1, 0, 0, 1, 1,
1.013394, 2.107414, 1.534062, 1, 0, 0, 1, 1,
1.017292, -0.1448031, 1.830013, 1, 0, 0, 1, 1,
1.017494, -0.9239517, 5.782944, 0, 0, 0, 1, 1,
1.026713, 2.688806, -1.948808, 0, 0, 0, 1, 1,
1.026998, -1.130601, 0.928248, 0, 0, 0, 1, 1,
1.045761, -0.1314042, 1.957568, 0, 0, 0, 1, 1,
1.061149, -0.8053875, 2.173918, 0, 0, 0, 1, 1,
1.063195, 0.1368108, 1.303626, 0, 0, 0, 1, 1,
1.063741, -0.6868402, 1.974595, 0, 0, 0, 1, 1,
1.069534, 0.3151841, 1.24265, 1, 1, 1, 1, 1,
1.070982, -0.9271183, 2.415924, 1, 1, 1, 1, 1,
1.072361, 1.924316, 1.250086, 1, 1, 1, 1, 1,
1.072395, 0.02142025, 3.931071, 1, 1, 1, 1, 1,
1.072764, 0.2119487, 1.348019, 1, 1, 1, 1, 1,
1.084424, -1.116974, 1.691721, 1, 1, 1, 1, 1,
1.092791, 0.1149013, 1.638624, 1, 1, 1, 1, 1,
1.097955, -1.363767, 2.214465, 1, 1, 1, 1, 1,
1.099881, 0.3610672, 1.960298, 1, 1, 1, 1, 1,
1.108248, 0.6442949, -0.05406732, 1, 1, 1, 1, 1,
1.108263, 0.2466846, 1.074531, 1, 1, 1, 1, 1,
1.113826, -0.2280596, 1.765789, 1, 1, 1, 1, 1,
1.113976, 1.259208, 1.766436, 1, 1, 1, 1, 1,
1.120225, 1.23239, 0.8003209, 1, 1, 1, 1, 1,
1.120322, 1.985267, 0.8560303, 1, 1, 1, 1, 1,
1.120837, -0.504088, 2.333814, 0, 0, 1, 1, 1,
1.141471, -0.5160883, 2.330125, 1, 0, 0, 1, 1,
1.153688, -0.89206, 2.78105, 1, 0, 0, 1, 1,
1.155387, 1.076442, 0.8751975, 1, 0, 0, 1, 1,
1.156731, 0.3779707, 1.598743, 1, 0, 0, 1, 1,
1.167144, 0.2963609, 1.995349, 1, 0, 0, 1, 1,
1.17505, 0.02113012, 1.985844, 0, 0, 0, 1, 1,
1.177327, 0.1721442, 0.1291505, 0, 0, 0, 1, 1,
1.180637, -1.455856, 2.404881, 0, 0, 0, 1, 1,
1.188348, 0.3017261, -0.8316548, 0, 0, 0, 1, 1,
1.18842, 1.870301, -0.5300077, 0, 0, 0, 1, 1,
1.189653, -0.8965208, 1.577047, 0, 0, 0, 1, 1,
1.191611, -0.9717956, 1.596473, 0, 0, 0, 1, 1,
1.19323, 0.3151458, 1.619358, 1, 1, 1, 1, 1,
1.204524, 1.326687, 0.1327143, 1, 1, 1, 1, 1,
1.21838, 0.2408917, -0.5757751, 1, 1, 1, 1, 1,
1.235704, -1.134285, 0.6261395, 1, 1, 1, 1, 1,
1.241092, 0.4516151, 1.757951, 1, 1, 1, 1, 1,
1.245297, 0.4792248, 0.2936869, 1, 1, 1, 1, 1,
1.24533, 1.752195, -0.2627828, 1, 1, 1, 1, 1,
1.250695, -1.855791, 2.969555, 1, 1, 1, 1, 1,
1.26401, -0.1776784, 3.534347, 1, 1, 1, 1, 1,
1.264936, 1.389631, -1.150579, 1, 1, 1, 1, 1,
1.265709, -1.125912, 2.632623, 1, 1, 1, 1, 1,
1.272067, 0.6105127, 2.276395, 1, 1, 1, 1, 1,
1.273696, -0.3780284, 1.658741, 1, 1, 1, 1, 1,
1.276623, 1.357205, 2.596164, 1, 1, 1, 1, 1,
1.279233, 1.075202, 2.765729, 1, 1, 1, 1, 1,
1.280488, -0.1724165, 2.025551, 0, 0, 1, 1, 1,
1.28149, -0.01122044, 1.08897, 1, 0, 0, 1, 1,
1.282254, -1.248402, 4.717822, 1, 0, 0, 1, 1,
1.283246, -0.9280891, 3.982223, 1, 0, 0, 1, 1,
1.285055, 0.5509235, 2.672681, 1, 0, 0, 1, 1,
1.289472, 1.199585, 2.269121, 1, 0, 0, 1, 1,
1.295417, -1.288961, 2.773575, 0, 0, 0, 1, 1,
1.299536, -0.3719763, -0.1392232, 0, 0, 0, 1, 1,
1.310867, -1.1786, 0.8726326, 0, 0, 0, 1, 1,
1.310906, -1.566263, 2.195069, 0, 0, 0, 1, 1,
1.311386, 0.6374474, 1.78334, 0, 0, 0, 1, 1,
1.312764, 0.7985945, 1.498928, 0, 0, 0, 1, 1,
1.312888, 0.1553727, 0.8386495, 0, 0, 0, 1, 1,
1.313706, 0.1593094, 2.151064, 1, 1, 1, 1, 1,
1.324407, 0.5524074, -0.3754475, 1, 1, 1, 1, 1,
1.333356, -0.1641384, 0.8084368, 1, 1, 1, 1, 1,
1.338487, -0.2396987, 1.410253, 1, 1, 1, 1, 1,
1.350573, -1.672058, 3.814091, 1, 1, 1, 1, 1,
1.361197, -1.03187, 2.129545, 1, 1, 1, 1, 1,
1.366751, -0.4629505, 0.8218298, 1, 1, 1, 1, 1,
1.390648, 2.431125, -2.167083, 1, 1, 1, 1, 1,
1.39704, -0.1467645, 1.749735, 1, 1, 1, 1, 1,
1.397126, -0.1231892, 3.028754, 1, 1, 1, 1, 1,
1.412788, -1.613318, 0.5276186, 1, 1, 1, 1, 1,
1.413185, 1.473147, -1.463906, 1, 1, 1, 1, 1,
1.420658, 0.1944566, 2.407559, 1, 1, 1, 1, 1,
1.421617, -0.308615, 0.2502758, 1, 1, 1, 1, 1,
1.44365, 1.514836, 0.8568045, 1, 1, 1, 1, 1,
1.448084, 0.2855923, 1.80355, 0, 0, 1, 1, 1,
1.461622, -0.8736256, 1.907646, 1, 0, 0, 1, 1,
1.472551, -0.4272962, 1.634188, 1, 0, 0, 1, 1,
1.474162, 1.347505, 0.702619, 1, 0, 0, 1, 1,
1.489584, 1.313381, 1.061029, 1, 0, 0, 1, 1,
1.490551, 0.1410848, 1.490416, 1, 0, 0, 1, 1,
1.498459, 0.7902592, 2.699603, 0, 0, 0, 1, 1,
1.501795, -0.6250142, -0.5962346, 0, 0, 0, 1, 1,
1.520385, -0.5908515, 1.655074, 0, 0, 0, 1, 1,
1.54065, -0.2057788, 2.8317, 0, 0, 0, 1, 1,
1.545653, 0.2821295, 0.1468507, 0, 0, 0, 1, 1,
1.548068, 2.059714, -1.224971, 0, 0, 0, 1, 1,
1.549912, 0.1184302, -0.07954571, 0, 0, 0, 1, 1,
1.559371, 1.463251, 1.280991, 1, 1, 1, 1, 1,
1.56437, 0.3302527, 2.215282, 1, 1, 1, 1, 1,
1.568563, 0.3530207, 1.643036, 1, 1, 1, 1, 1,
1.579675, 0.8208727, 0.289072, 1, 1, 1, 1, 1,
1.596575, -0.7946648, 0.8232157, 1, 1, 1, 1, 1,
1.598722, 0.8880621, -0.2060038, 1, 1, 1, 1, 1,
1.615779, -0.9186301, 1.447169, 1, 1, 1, 1, 1,
1.619704, -0.6859394, 3.03254, 1, 1, 1, 1, 1,
1.623439, 0.7619427, 1.591034, 1, 1, 1, 1, 1,
1.646238, -1.982862, 2.730855, 1, 1, 1, 1, 1,
1.667758, -1.005755, -0.1237666, 1, 1, 1, 1, 1,
1.668393, 0.4720798, 0.1434209, 1, 1, 1, 1, 1,
1.714666, 0.598858, 1.564886, 1, 1, 1, 1, 1,
1.724652, 0.7029439, 1.224375, 1, 1, 1, 1, 1,
1.726137, -0.3156339, 3.781088, 1, 1, 1, 1, 1,
1.738648, 0.1228094, 1.339063, 0, 0, 1, 1, 1,
1.750145, -0.9307202, 2.411537, 1, 0, 0, 1, 1,
1.770954, -0.8181649, 1.439652, 1, 0, 0, 1, 1,
1.774417, 2.031576, 0.1886217, 1, 0, 0, 1, 1,
1.776808, 0.426878, 0.8408203, 1, 0, 0, 1, 1,
1.791683, 0.6677744, 2.662127, 1, 0, 0, 1, 1,
1.816534, 0.591966, 1.964811, 0, 0, 0, 1, 1,
1.829032, 0.993223, 1.297931, 0, 0, 0, 1, 1,
1.856791, -0.9048178, 3.468451, 0, 0, 0, 1, 1,
1.87093, 0.1772342, 4.218744, 0, 0, 0, 1, 1,
1.874005, 0.279002, 1.826432, 0, 0, 0, 1, 1,
1.90306, 0.2909589, 1.312946, 0, 0, 0, 1, 1,
1.912014, 0.2000831, 0.2500421, 0, 0, 0, 1, 1,
1.931718, -0.2122156, 2.957041, 1, 1, 1, 1, 1,
1.978343, 2.000484, 0.09987164, 1, 1, 1, 1, 1,
2.011964, 1.921852, 1.077245, 1, 1, 1, 1, 1,
2.015051, -1.125912, 1.728032, 1, 1, 1, 1, 1,
2.025578, 0.9743437, 1.481324, 1, 1, 1, 1, 1,
2.041747, -1.493724, 0.6092247, 1, 1, 1, 1, 1,
2.051344, 0.5312138, 2.928797, 1, 1, 1, 1, 1,
2.065672, -0.3478684, 2.202941, 1, 1, 1, 1, 1,
2.066077, 1.452543, 2.31556, 1, 1, 1, 1, 1,
2.075022, 1.150931, 0.5224055, 1, 1, 1, 1, 1,
2.076408, 1.869687, 0.5180633, 1, 1, 1, 1, 1,
2.076425, 0.9176761, 1.396961, 1, 1, 1, 1, 1,
2.077223, -0.2946998, 1.194304, 1, 1, 1, 1, 1,
2.132806, 1.271569, 0.3596123, 1, 1, 1, 1, 1,
2.136388, 0.9747546, 0.6805277, 1, 1, 1, 1, 1,
2.144239, -0.3346114, 2.179726, 0, 0, 1, 1, 1,
2.145031, 1.215182, 1.414521, 1, 0, 0, 1, 1,
2.215021, 0.06845438, 2.390166, 1, 0, 0, 1, 1,
2.219741, -0.496805, 0.216289, 1, 0, 0, 1, 1,
2.231109, 0.0519523, 3.143825, 1, 0, 0, 1, 1,
2.258051, 0.2291272, 1.695445, 1, 0, 0, 1, 1,
2.271557, -0.1480253, 3.399637, 0, 0, 0, 1, 1,
2.294548, 0.6476484, 0.5590578, 0, 0, 0, 1, 1,
2.311111, -2.350561, 1.648649, 0, 0, 0, 1, 1,
2.31307, 0.1509082, 1.07571, 0, 0, 0, 1, 1,
2.35697, -0.8842352, 0.3671212, 0, 0, 0, 1, 1,
2.405132, -0.609972, 3.268066, 0, 0, 0, 1, 1,
2.411471, -0.1684271, 1.987663, 0, 0, 0, 1, 1,
2.426292, -1.087569, 0.03718027, 1, 1, 1, 1, 1,
2.492219, 0.1327327, 2.43107, 1, 1, 1, 1, 1,
2.547469, 1.151818, 2.949989, 1, 1, 1, 1, 1,
2.585807, -1.301742, 2.66609, 1, 1, 1, 1, 1,
2.648207, -0.1660456, 1.618409, 1, 1, 1, 1, 1,
2.662853, -0.2301594, 2.201485, 1, 1, 1, 1, 1,
2.896336, -0.4106048, 1.969055, 1, 1, 1, 1, 1
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
var radius = 9.372141;
var distance = 32.91925;
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
mvMatrix.translate( 0.0007789135, 0.1331139, -0.5264864 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91925);
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