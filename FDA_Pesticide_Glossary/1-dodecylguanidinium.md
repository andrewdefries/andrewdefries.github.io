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
-3.357311, -0.07869402, -2.204661, 1, 0, 0, 1,
-3.127672, 0.4692306, -1.990552, 1, 0.007843138, 0, 1,
-3.084262, -1.664281, 0.6592966, 1, 0.01176471, 0, 1,
-2.839491, -1.182697, -3.518237, 1, 0.01960784, 0, 1,
-2.819922, 0.5493141, -1.503452, 1, 0.02352941, 0, 1,
-2.704871, -1.108032, -2.052914, 1, 0.03137255, 0, 1,
-2.699761, -0.5480378, -1.340635, 1, 0.03529412, 0, 1,
-2.529026, -0.5725495, -1.567318, 1, 0.04313726, 0, 1,
-2.507283, -1.178258, -0.1896346, 1, 0.04705882, 0, 1,
-2.496041, 2.397201, -1.543822, 1, 0.05490196, 0, 1,
-2.351676, -1.541067, -2.523365, 1, 0.05882353, 0, 1,
-2.265889, 2.15682, -0.5317848, 1, 0.06666667, 0, 1,
-2.265801, -0.9938146, -3.66268, 1, 0.07058824, 0, 1,
-2.25924, 0.6591555, -0.8999017, 1, 0.07843138, 0, 1,
-2.212823, -0.2944514, -2.28251, 1, 0.08235294, 0, 1,
-2.207607, -0.06631593, -1.720639, 1, 0.09019608, 0, 1,
-2.161258, 0.9072368, -0.1166569, 1, 0.09411765, 0, 1,
-2.140833, 0.2937244, -0.5026016, 1, 0.1019608, 0, 1,
-2.119875, 1.289181, -1.534432, 1, 0.1098039, 0, 1,
-2.114446, -0.6116685, -0.4522139, 1, 0.1137255, 0, 1,
-2.051852, 0.8264748, -1.042661, 1, 0.1215686, 0, 1,
-2.03911, -0.5658985, -2.169966, 1, 0.1254902, 0, 1,
-1.987303, -1.075855, -1.416536, 1, 0.1333333, 0, 1,
-1.936367, -1.631886, -2.418611, 1, 0.1372549, 0, 1,
-1.933387, 1.009006, -1.413727, 1, 0.145098, 0, 1,
-1.926068, -0.4962905, -2.561205, 1, 0.1490196, 0, 1,
-1.924139, 1.534272, 0.0310998, 1, 0.1568628, 0, 1,
-1.922263, -0.1897414, -0.03035229, 1, 0.1607843, 0, 1,
-1.885473, -1.147053, -1.06816, 1, 0.1686275, 0, 1,
-1.86751, -0.3145463, -0.5217419, 1, 0.172549, 0, 1,
-1.86244, -0.9854798, 0.3361445, 1, 0.1803922, 0, 1,
-1.860333, -0.9643881, -1.225909, 1, 0.1843137, 0, 1,
-1.847571, 0.4402582, -0.5994151, 1, 0.1921569, 0, 1,
-1.835859, 2.126202, -1.301305, 1, 0.1960784, 0, 1,
-1.8305, 0.5493429, -2.947247, 1, 0.2039216, 0, 1,
-1.81995, 0.6771109, -1.917662, 1, 0.2117647, 0, 1,
-1.804345, -0.9179982, -2.590556, 1, 0.2156863, 0, 1,
-1.790207, -0.7678821, -1.05715, 1, 0.2235294, 0, 1,
-1.787769, -1.135428, -1.884159, 1, 0.227451, 0, 1,
-1.783053, 0.3711829, -1.832511, 1, 0.2352941, 0, 1,
-1.75864, 0.4231647, -0.9832042, 1, 0.2392157, 0, 1,
-1.74595, -0.07606092, -1.495997, 1, 0.2470588, 0, 1,
-1.730586, -0.4084996, -2.186152, 1, 0.2509804, 0, 1,
-1.730041, -0.4907897, -3.012703, 1, 0.2588235, 0, 1,
-1.727078, -0.5839611, -2.688095, 1, 0.2627451, 0, 1,
-1.70877, 0.3030282, -1.249045, 1, 0.2705882, 0, 1,
-1.707541, 1.163715, 0.3484344, 1, 0.2745098, 0, 1,
-1.675277, -0.7483359, -1.916658, 1, 0.282353, 0, 1,
-1.670829, 1.755097, -1.720317, 1, 0.2862745, 0, 1,
-1.645628, -0.2744216, 0.4555407, 1, 0.2941177, 0, 1,
-1.620579, 2.076238, -0.8118472, 1, 0.3019608, 0, 1,
-1.609957, -0.05585365, -1.039513, 1, 0.3058824, 0, 1,
-1.602956, 0.8486947, -0.4549486, 1, 0.3137255, 0, 1,
-1.596583, 1.332878, -1.174417, 1, 0.3176471, 0, 1,
-1.595498, -0.3677521, -4.911858, 1, 0.3254902, 0, 1,
-1.588462, -0.06007479, -3.330458, 1, 0.3294118, 0, 1,
-1.58788, -1.014204, -3.635711, 1, 0.3372549, 0, 1,
-1.576462, 0.7035178, -0.8746119, 1, 0.3411765, 0, 1,
-1.569596, 0.1024976, -1.247325, 1, 0.3490196, 0, 1,
-1.565244, -0.4597014, -1.671361, 1, 0.3529412, 0, 1,
-1.547988, -0.3797887, -3.443698, 1, 0.3607843, 0, 1,
-1.540506, 0.6484911, -2.371292, 1, 0.3647059, 0, 1,
-1.539904, 0.7991642, -0.7974495, 1, 0.372549, 0, 1,
-1.527763, -0.8382176, -1.822491, 1, 0.3764706, 0, 1,
-1.525103, -0.2057797, -1.678539, 1, 0.3843137, 0, 1,
-1.520811, 1.041288, 0.6547257, 1, 0.3882353, 0, 1,
-1.51663, 0.5761598, 0.1026904, 1, 0.3960784, 0, 1,
-1.500859, 0.9746684, -2.0894, 1, 0.4039216, 0, 1,
-1.497107, -0.4164529, -2.591014, 1, 0.4078431, 0, 1,
-1.490298, 0.6199081, -1.302602, 1, 0.4156863, 0, 1,
-1.484536, 1.033462, -0.4828533, 1, 0.4196078, 0, 1,
-1.479774, 0.6704758, -1.465528, 1, 0.427451, 0, 1,
-1.478286, 0.3835909, -0.3956863, 1, 0.4313726, 0, 1,
-1.474351, 1.369443, -2.049385, 1, 0.4392157, 0, 1,
-1.471902, 0.7984196, -1.587546, 1, 0.4431373, 0, 1,
-1.463763, 0.8652324, -1.430344, 1, 0.4509804, 0, 1,
-1.448057, -0.3799038, -2.449444, 1, 0.454902, 0, 1,
-1.447841, 0.5633929, -0.1252916, 1, 0.4627451, 0, 1,
-1.447049, -0.6719647, -1.218584, 1, 0.4666667, 0, 1,
-1.444389, 0.6620796, -0.8116561, 1, 0.4745098, 0, 1,
-1.443338, -0.456465, -2.725499, 1, 0.4784314, 0, 1,
-1.442865, 0.5977768, 0.5060493, 1, 0.4862745, 0, 1,
-1.438475, -1.27357, -0.8645666, 1, 0.4901961, 0, 1,
-1.434126, -0.4105206, -2.484551, 1, 0.4980392, 0, 1,
-1.428067, -1.617681, -2.629841, 1, 0.5058824, 0, 1,
-1.415989, -1.702489, -2.751524, 1, 0.509804, 0, 1,
-1.414532, 0.2879874, -2.806741, 1, 0.5176471, 0, 1,
-1.413577, -0.4202328, -1.340034, 1, 0.5215687, 0, 1,
-1.402755, 0.1554861, -1.610428, 1, 0.5294118, 0, 1,
-1.396057, -0.04410247, -3.04891, 1, 0.5333334, 0, 1,
-1.395315, 1.529669, 0.9156687, 1, 0.5411765, 0, 1,
-1.393395, 0.2370643, -1.334875, 1, 0.5450981, 0, 1,
-1.388214, 0.1485548, -3.246095, 1, 0.5529412, 0, 1,
-1.378497, -1.403096, -3.185852, 1, 0.5568628, 0, 1,
-1.377553, -0.8521434, -1.46824, 1, 0.5647059, 0, 1,
-1.36283, 0.1226683, -1.437106, 1, 0.5686275, 0, 1,
-1.357712, 0.4339343, -1.882506, 1, 0.5764706, 0, 1,
-1.333187, 0.08546419, -1.562534, 1, 0.5803922, 0, 1,
-1.331514, 0.5016958, -1.61701, 1, 0.5882353, 0, 1,
-1.33117, -1.624748, -2.627366, 1, 0.5921569, 0, 1,
-1.321092, 0.3545325, -1.974971, 1, 0.6, 0, 1,
-1.299028, 1.611813, 0.4453071, 1, 0.6078432, 0, 1,
-1.296983, 0.0216036, 1.105668, 1, 0.6117647, 0, 1,
-1.291438, 0.1139342, -1.352532, 1, 0.6196079, 0, 1,
-1.290586, -0.2176479, -3.657046, 1, 0.6235294, 0, 1,
-1.289352, -0.5141501, -3.46857, 1, 0.6313726, 0, 1,
-1.289326, -0.9472957, -2.780385, 1, 0.6352941, 0, 1,
-1.283751, 0.2574843, -1.388729, 1, 0.6431373, 0, 1,
-1.281291, -0.08088993, -0.7615861, 1, 0.6470588, 0, 1,
-1.279041, -0.5499834, -3.158679, 1, 0.654902, 0, 1,
-1.277504, 0.9787907, 0.9616098, 1, 0.6588235, 0, 1,
-1.276321, -2.763824, -5.370678, 1, 0.6666667, 0, 1,
-1.275511, -0.8341305, -1.842115, 1, 0.6705883, 0, 1,
-1.266294, 0.8339161, -0.5953994, 1, 0.6784314, 0, 1,
-1.264947, -0.6979539, -2.8415, 1, 0.682353, 0, 1,
-1.263542, -0.2691369, -2.749078, 1, 0.6901961, 0, 1,
-1.261876, 0.6515982, 1.530354, 1, 0.6941177, 0, 1,
-1.260252, -0.02598563, -0.4983236, 1, 0.7019608, 0, 1,
-1.257874, 1.361405, -1.93342, 1, 0.7098039, 0, 1,
-1.25343, 0.6029702, 0.7744996, 1, 0.7137255, 0, 1,
-1.25039, 1.436094, -1.308625, 1, 0.7215686, 0, 1,
-1.248439, 0.4516789, -0.9405273, 1, 0.7254902, 0, 1,
-1.246327, -1.061201, -1.128154, 1, 0.7333333, 0, 1,
-1.243328, -0.4347388, -0.1720687, 1, 0.7372549, 0, 1,
-1.235343, 0.2001774, -0.1549186, 1, 0.7450981, 0, 1,
-1.234741, -1.728479, -3.167967, 1, 0.7490196, 0, 1,
-1.232896, -0.5132163, -3.839423, 1, 0.7568628, 0, 1,
-1.232795, 0.831683, -1.363804, 1, 0.7607843, 0, 1,
-1.231627, -0.04679082, -2.727877, 1, 0.7686275, 0, 1,
-1.227392, 0.5019931, -1.686622, 1, 0.772549, 0, 1,
-1.22326, -0.6668776, -1.082478, 1, 0.7803922, 0, 1,
-1.21883, -1.508976, -2.932099, 1, 0.7843137, 0, 1,
-1.218364, 0.9470646, -1.689132, 1, 0.7921569, 0, 1,
-1.206219, -0.196238, -1.88058, 1, 0.7960784, 0, 1,
-1.198793, 1.170472, 1.279291, 1, 0.8039216, 0, 1,
-1.191728, 0.5121195, -1.759237, 1, 0.8117647, 0, 1,
-1.188575, -1.076463, -3.579242, 1, 0.8156863, 0, 1,
-1.179718, 1.772224, 0.1221932, 1, 0.8235294, 0, 1,
-1.1791, 0.07618858, -1.345081, 1, 0.827451, 0, 1,
-1.169714, 0.7062789, -1.192579, 1, 0.8352941, 0, 1,
-1.16577, 0.3095759, -2.083599, 1, 0.8392157, 0, 1,
-1.164934, 0.751048, -1.149801, 1, 0.8470588, 0, 1,
-1.162588, -0.1179307, -3.227365, 1, 0.8509804, 0, 1,
-1.157333, -0.3139865, -1.49579, 1, 0.8588235, 0, 1,
-1.153556, -0.7265955, -2.286394, 1, 0.8627451, 0, 1,
-1.151525, 1.163787, -2.871534, 1, 0.8705882, 0, 1,
-1.145045, -0.1989075, -1.790146, 1, 0.8745098, 0, 1,
-1.14329, -1.466658, -1.561132, 1, 0.8823529, 0, 1,
-1.142273, -1.488264, -2.579687, 1, 0.8862745, 0, 1,
-1.13206, 0.08287716, -0.7196317, 1, 0.8941177, 0, 1,
-1.13092, -0.860809, -1.961347, 1, 0.8980392, 0, 1,
-1.12924, -0.08002245, -1.15672, 1, 0.9058824, 0, 1,
-1.117118, 0.1952699, -0.7986862, 1, 0.9137255, 0, 1,
-1.116494, -0.2577696, -3.390126, 1, 0.9176471, 0, 1,
-1.115474, 0.7730685, -1.017144, 1, 0.9254902, 0, 1,
-1.107759, 0.08885691, -1.203161, 1, 0.9294118, 0, 1,
-1.086377, 0.1100928, -2.151574, 1, 0.9372549, 0, 1,
-1.082365, -0.2303808, -1.833899, 1, 0.9411765, 0, 1,
-1.080723, -0.1779166, -0.8430945, 1, 0.9490196, 0, 1,
-1.074671, 1.138044, -1.342429, 1, 0.9529412, 0, 1,
-1.071518, -0.7262117, -2.001972, 1, 0.9607843, 0, 1,
-1.0693, 2.460597, -0.9080176, 1, 0.9647059, 0, 1,
-1.06137, 1.607955, -0.7233665, 1, 0.972549, 0, 1,
-1.05914, -1.096863, -2.748997, 1, 0.9764706, 0, 1,
-1.054302, -0.2648613, -1.04309, 1, 0.9843137, 0, 1,
-1.047377, 0.9068899, -0.8996069, 1, 0.9882353, 0, 1,
-1.046476, 2.583555, 1.007074, 1, 0.9960784, 0, 1,
-1.041502, 0.1752911, 0.2715492, 0.9960784, 1, 0, 1,
-1.031362, -0.8140898, -1.832456, 0.9921569, 1, 0, 1,
-1.020353, 1.163275, -0.6686598, 0.9843137, 1, 0, 1,
-1.019273, -0.3515024, -1.412552, 0.9803922, 1, 0, 1,
-1.01876, -0.4944206, -0.5111749, 0.972549, 1, 0, 1,
-1.005563, -0.0986921, -0.7138822, 0.9686275, 1, 0, 1,
-1.004379, 0.4395305, -1.662035, 0.9607843, 1, 0, 1,
-0.9971341, -0.2106933, -2.247304, 0.9568627, 1, 0, 1,
-0.9906955, 0.01854475, -0.1892025, 0.9490196, 1, 0, 1,
-0.9885688, 2.003838, -0.2125033, 0.945098, 1, 0, 1,
-0.9873626, 0.1438159, -2.922932, 0.9372549, 1, 0, 1,
-0.9864669, 1.37872, 0.382575, 0.9333333, 1, 0, 1,
-0.9819375, -0.7715562, -2.229364, 0.9254902, 1, 0, 1,
-0.9817051, -0.09828835, -2.693358, 0.9215686, 1, 0, 1,
-0.9795763, 1.741342, 0.3622417, 0.9137255, 1, 0, 1,
-0.9701005, 0.01452199, -2.233874, 0.9098039, 1, 0, 1,
-0.9677049, 0.4193502, -1.011559, 0.9019608, 1, 0, 1,
-0.9661312, 1.408351, -0.06380586, 0.8941177, 1, 0, 1,
-0.965812, 0.4165984, -2.915802, 0.8901961, 1, 0, 1,
-0.9492272, -1.089216, -3.380444, 0.8823529, 1, 0, 1,
-0.9340866, 0.05193014, -1.140396, 0.8784314, 1, 0, 1,
-0.9325641, -0.3005283, -0.2722979, 0.8705882, 1, 0, 1,
-0.932514, 1.038125, 0.9163851, 0.8666667, 1, 0, 1,
-0.9306573, 1.998674, 0.7665938, 0.8588235, 1, 0, 1,
-0.9298016, 1.033328, 0.3970831, 0.854902, 1, 0, 1,
-0.9207423, -1.535794, -2.456329, 0.8470588, 1, 0, 1,
-0.9080599, -0.6967776, -2.961664, 0.8431373, 1, 0, 1,
-0.9076404, -0.7973809, -3.381008, 0.8352941, 1, 0, 1,
-0.8912144, -0.6593984, -2.294511, 0.8313726, 1, 0, 1,
-0.885782, 1.747493, -1.247895, 0.8235294, 1, 0, 1,
-0.8852236, -0.3462919, -2.333217, 0.8196079, 1, 0, 1,
-0.8831078, -2.473485, -3.449999, 0.8117647, 1, 0, 1,
-0.8809935, -0.8028035, -2.004741, 0.8078431, 1, 0, 1,
-0.870134, 0.9436612, 0.08174791, 0.8, 1, 0, 1,
-0.8602725, 0.157595, -1.612566, 0.7921569, 1, 0, 1,
-0.8531007, -0.4438391, -1.117056, 0.7882353, 1, 0, 1,
-0.8529317, -0.5658776, -1.539958, 0.7803922, 1, 0, 1,
-0.8513477, -0.4352793, -1.704612, 0.7764706, 1, 0, 1,
-0.8487829, 0.2028322, -2.248279, 0.7686275, 1, 0, 1,
-0.8466538, -0.09006419, -3.830065, 0.7647059, 1, 0, 1,
-0.8329769, 0.850261, -1.112969, 0.7568628, 1, 0, 1,
-0.8259223, -0.2693239, -1.614855, 0.7529412, 1, 0, 1,
-0.8251579, -1.332554, -3.112152, 0.7450981, 1, 0, 1,
-0.8170983, 1.175072, 0.3068685, 0.7411765, 1, 0, 1,
-0.8132218, -1.540483, -2.736761, 0.7333333, 1, 0, 1,
-0.8130838, 0.4093478, -1.428265, 0.7294118, 1, 0, 1,
-0.812099, 0.17113, -0.8821102, 0.7215686, 1, 0, 1,
-0.8112916, 0.4000389, -1.41845, 0.7176471, 1, 0, 1,
-0.8079984, 1.41185, -0.2510771, 0.7098039, 1, 0, 1,
-0.807264, -0.3977867, -3.196541, 0.7058824, 1, 0, 1,
-0.8033152, 1.732194, -1.655917, 0.6980392, 1, 0, 1,
-0.8022837, 1.434541, -0.9451885, 0.6901961, 1, 0, 1,
-0.8008243, 0.8972989, -1.669779, 0.6862745, 1, 0, 1,
-0.799881, 0.09713235, -2.776841, 0.6784314, 1, 0, 1,
-0.7965867, 0.4593597, -1.216612, 0.6745098, 1, 0, 1,
-0.7785369, 0.975087, -1.517892, 0.6666667, 1, 0, 1,
-0.7777227, -1.020845, -1.286077, 0.6627451, 1, 0, 1,
-0.7740417, 0.883097, -1.109087, 0.654902, 1, 0, 1,
-0.7732967, 0.8084835, 0.4457545, 0.6509804, 1, 0, 1,
-0.7726353, -0.2999628, -1.200301, 0.6431373, 1, 0, 1,
-0.767488, -1.623305, -2.061329, 0.6392157, 1, 0, 1,
-0.7654145, 1.133274, -1.332718, 0.6313726, 1, 0, 1,
-0.763994, 0.2816571, 0.5909162, 0.627451, 1, 0, 1,
-0.7624829, 0.2453522, -2.096773, 0.6196079, 1, 0, 1,
-0.7572555, -0.726966, -1.777387, 0.6156863, 1, 0, 1,
-0.7543325, 0.3416544, -2.948241, 0.6078432, 1, 0, 1,
-0.7534446, 0.1326293, -0.9269698, 0.6039216, 1, 0, 1,
-0.7435014, -0.8690532, -2.737642, 0.5960785, 1, 0, 1,
-0.7403094, -1.631819, -3.057589, 0.5882353, 1, 0, 1,
-0.7300111, -0.4025691, 0.3652399, 0.5843138, 1, 0, 1,
-0.729768, -0.5412329, -3.24476, 0.5764706, 1, 0, 1,
-0.7248634, 1.015948, -0.3661498, 0.572549, 1, 0, 1,
-0.7217451, -0.8917069, -3.029886, 0.5647059, 1, 0, 1,
-0.7205052, -0.2396588, -3.283916, 0.5607843, 1, 0, 1,
-0.7200498, 0.8019311, -2.737142, 0.5529412, 1, 0, 1,
-0.718417, 1.478239, 0.3386772, 0.5490196, 1, 0, 1,
-0.7139369, 0.2733052, -2.555929, 0.5411765, 1, 0, 1,
-0.713549, -0.8072857, -2.390209, 0.5372549, 1, 0, 1,
-0.713052, -0.04268085, -0.3908094, 0.5294118, 1, 0, 1,
-0.7105954, 1.008516, -0.9492338, 0.5254902, 1, 0, 1,
-0.7077543, -0.3897236, -2.926641, 0.5176471, 1, 0, 1,
-0.7001588, 0.7254515, -0.5702252, 0.5137255, 1, 0, 1,
-0.7001168, -0.6886296, -3.274924, 0.5058824, 1, 0, 1,
-0.6994666, -0.8179281, -3.822523, 0.5019608, 1, 0, 1,
-0.6984417, 0.2476849, -1.109631, 0.4941176, 1, 0, 1,
-0.6963152, 0.9722372, -1.898718, 0.4862745, 1, 0, 1,
-0.6953071, 0.5527009, 1.953778, 0.4823529, 1, 0, 1,
-0.6907014, -1.048547, -1.262476, 0.4745098, 1, 0, 1,
-0.6898342, -0.4343902, -0.7806379, 0.4705882, 1, 0, 1,
-0.6887945, -1.849321, -2.366776, 0.4627451, 1, 0, 1,
-0.687015, 0.1418045, -0.6046041, 0.4588235, 1, 0, 1,
-0.6856499, -0.7798488, -2.624331, 0.4509804, 1, 0, 1,
-0.6835127, 2.171837, -1.692803, 0.4470588, 1, 0, 1,
-0.6802981, -0.4017637, -0.6275069, 0.4392157, 1, 0, 1,
-0.67608, -0.9413264, -1.389513, 0.4352941, 1, 0, 1,
-0.6755619, 0.3420016, -0.7111215, 0.427451, 1, 0, 1,
-0.6714307, 0.09754933, -0.8324789, 0.4235294, 1, 0, 1,
-0.6706242, 0.4398763, 0.4446851, 0.4156863, 1, 0, 1,
-0.6687956, 1.487971, 0.3238004, 0.4117647, 1, 0, 1,
-0.6606214, -0.1510647, -2.375537, 0.4039216, 1, 0, 1,
-0.6605181, 0.02648841, -2.556335, 0.3960784, 1, 0, 1,
-0.6566547, 0.8334343, -1.593786, 0.3921569, 1, 0, 1,
-0.6544335, -1.106607, -2.699489, 0.3843137, 1, 0, 1,
-0.6515424, 0.5233494, 0.1213634, 0.3803922, 1, 0, 1,
-0.6493284, 0.2376473, -1.3751, 0.372549, 1, 0, 1,
-0.6492838, 0.6347939, -1.725353, 0.3686275, 1, 0, 1,
-0.6480914, 2.267021, 0.3514819, 0.3607843, 1, 0, 1,
-0.6443575, 0.002193375, -3.114959, 0.3568628, 1, 0, 1,
-0.6420089, -0.2387633, -2.256463, 0.3490196, 1, 0, 1,
-0.6404619, 0.7746521, -0.2089914, 0.345098, 1, 0, 1,
-0.6375073, 1.766511, 1.255334, 0.3372549, 1, 0, 1,
-0.6368985, 1.088851, -0.5982224, 0.3333333, 1, 0, 1,
-0.6306663, 0.2056475, 0.0827266, 0.3254902, 1, 0, 1,
-0.6291514, 0.2939239, -0.1857299, 0.3215686, 1, 0, 1,
-0.6274949, -0.5963243, -2.092572, 0.3137255, 1, 0, 1,
-0.6205683, -0.009399933, -2.060334, 0.3098039, 1, 0, 1,
-0.6122679, -0.6187854, -2.884106, 0.3019608, 1, 0, 1,
-0.6086214, 1.033814, 0.6418445, 0.2941177, 1, 0, 1,
-0.6079434, -0.3389068, -1.61056, 0.2901961, 1, 0, 1,
-0.6065989, 1.401742, -0.2490728, 0.282353, 1, 0, 1,
-0.5987886, -0.4082617, -1.734863, 0.2784314, 1, 0, 1,
-0.5921193, 0.2435966, -1.827239, 0.2705882, 1, 0, 1,
-0.5900306, -0.1475592, -2.804927, 0.2666667, 1, 0, 1,
-0.5897695, 0.5583355, -1.538784, 0.2588235, 1, 0, 1,
-0.5875197, 2.264528, -1.68587, 0.254902, 1, 0, 1,
-0.5790955, 0.3798642, -0.3838099, 0.2470588, 1, 0, 1,
-0.5784362, 0.004272978, -3.217345, 0.2431373, 1, 0, 1,
-0.5760269, -0.403553, -1.927304, 0.2352941, 1, 0, 1,
-0.5729536, 1.071215, -0.1252116, 0.2313726, 1, 0, 1,
-0.5726573, 0.4840266, -1.005672, 0.2235294, 1, 0, 1,
-0.5707178, -2.039096, -2.16677, 0.2196078, 1, 0, 1,
-0.5699829, 0.7602118, -0.7909468, 0.2117647, 1, 0, 1,
-0.5697235, -0.9476789, -3.749457, 0.2078431, 1, 0, 1,
-0.5693696, 1.911844, -0.5593402, 0.2, 1, 0, 1,
-0.5680124, 0.2962294, -1.742309, 0.1921569, 1, 0, 1,
-0.5672427, -0.3810343, -1.218809, 0.1882353, 1, 0, 1,
-0.5655261, -1.200779, -1.78521, 0.1803922, 1, 0, 1,
-0.5652477, -0.3723292, -3.249877, 0.1764706, 1, 0, 1,
-0.5627728, 0.2018237, -2.74751, 0.1686275, 1, 0, 1,
-0.5590115, 1.005015, -0.700255, 0.1647059, 1, 0, 1,
-0.557227, -0.4463821, -1.809234, 0.1568628, 1, 0, 1,
-0.5569021, 0.4827213, -0.7338242, 0.1529412, 1, 0, 1,
-0.5528211, -1.140388, -2.21532, 0.145098, 1, 0, 1,
-0.5482976, 1.251977, -0.97179, 0.1411765, 1, 0, 1,
-0.5466535, 0.9842695, 0.9595493, 0.1333333, 1, 0, 1,
-0.5457069, -0.6012288, -2.248407, 0.1294118, 1, 0, 1,
-0.5433913, 0.2793384, -2.583429, 0.1215686, 1, 0, 1,
-0.5405083, 1.496882, 0.6161768, 0.1176471, 1, 0, 1,
-0.5403827, 1.431004, -0.9270849, 0.1098039, 1, 0, 1,
-0.5386049, 0.3586252, 0.1135119, 0.1058824, 1, 0, 1,
-0.5372176, -0.03639935, -2.767454, 0.09803922, 1, 0, 1,
-0.5346876, -0.0444193, -1.042002, 0.09019608, 1, 0, 1,
-0.5237864, 1.516279, -1.043231, 0.08627451, 1, 0, 1,
-0.5226106, -0.3382837, -3.945367, 0.07843138, 1, 0, 1,
-0.5115364, -0.7052284, -1.514228, 0.07450981, 1, 0, 1,
-0.5098231, 0.7956364, -0.3459635, 0.06666667, 1, 0, 1,
-0.5071794, -0.7299846, -1.241758, 0.0627451, 1, 0, 1,
-0.5063165, -0.2196213, -2.843554, 0.05490196, 1, 0, 1,
-0.5030985, 1.784938, -0.1120016, 0.05098039, 1, 0, 1,
-0.4959525, 1.101522, 0.9099599, 0.04313726, 1, 0, 1,
-0.4951506, -0.1980486, -1.948554, 0.03921569, 1, 0, 1,
-0.4934905, 0.5066331, -0.600866, 0.03137255, 1, 0, 1,
-0.486878, 1.184087, 1.929255, 0.02745098, 1, 0, 1,
-0.4864747, -0.4470313, -3.321722, 0.01960784, 1, 0, 1,
-0.4760355, -0.1376676, -1.913977, 0.01568628, 1, 0, 1,
-0.4730701, 0.4347272, -0.8501266, 0.007843138, 1, 0, 1,
-0.4725828, -0.0990271, 0.3975736, 0.003921569, 1, 0, 1,
-0.4711338, 1.442582, 0.5296192, 0, 1, 0.003921569, 1,
-0.4694801, -1.130612, -4.293724, 0, 1, 0.01176471, 1,
-0.4693249, 0.9849585, -0.5003396, 0, 1, 0.01568628, 1,
-0.4688586, 0.1189265, -0.7784383, 0, 1, 0.02352941, 1,
-0.4661096, -1.193971, -3.52696, 0, 1, 0.02745098, 1,
-0.4660127, -0.649967, -2.754566, 0, 1, 0.03529412, 1,
-0.4654563, 1.079881, 0.6298734, 0, 1, 0.03921569, 1,
-0.4636503, -0.1960523, -2.405802, 0, 1, 0.04705882, 1,
-0.4574629, 0.7997975, 0.5755774, 0, 1, 0.05098039, 1,
-0.4554446, -0.7958128, -2.045341, 0, 1, 0.05882353, 1,
-0.4524062, -0.1952735, -1.580845, 0, 1, 0.0627451, 1,
-0.4412483, 1.388807, -0.6505255, 0, 1, 0.07058824, 1,
-0.4398651, 0.5369102, -1.171421, 0, 1, 0.07450981, 1,
-0.4378728, -0.009379872, -0.8091432, 0, 1, 0.08235294, 1,
-0.4346717, 1.812216, 0.2595092, 0, 1, 0.08627451, 1,
-0.4326651, -1.363118, -3.756104, 0, 1, 0.09411765, 1,
-0.4316106, 0.6047663, -1.601054, 0, 1, 0.1019608, 1,
-0.4313993, 1.302638, 1.408138, 0, 1, 0.1058824, 1,
-0.430912, -0.7380513, -3.755935, 0, 1, 0.1137255, 1,
-0.4290546, -0.8502341, -3.700968, 0, 1, 0.1176471, 1,
-0.4277636, 0.8130535, -1.037966, 0, 1, 0.1254902, 1,
-0.4254177, -0.463313, -2.345575, 0, 1, 0.1294118, 1,
-0.4231466, -1.319643, -3.595416, 0, 1, 0.1372549, 1,
-0.4132466, -1.35416, -2.271052, 0, 1, 0.1411765, 1,
-0.4117481, -1.141567, -3.044898, 0, 1, 0.1490196, 1,
-0.4065985, -0.5727937, -1.451531, 0, 1, 0.1529412, 1,
-0.4012908, -0.9808678, -2.728118, 0, 1, 0.1607843, 1,
-0.3977804, 1.867052, 0.5015556, 0, 1, 0.1647059, 1,
-0.3923439, -0.005998521, -1.429283, 0, 1, 0.172549, 1,
-0.3917321, -0.8935378, -3.266413, 0, 1, 0.1764706, 1,
-0.3767936, 0.1660587, 0.08174476, 0, 1, 0.1843137, 1,
-0.3729943, -1.009195, -1.096786, 0, 1, 0.1882353, 1,
-0.3704314, 0.465654, -0.2276914, 0, 1, 0.1960784, 1,
-0.3677445, 0.8480569, 0.4035771, 0, 1, 0.2039216, 1,
-0.3648006, -0.6661618, -2.106685, 0, 1, 0.2078431, 1,
-0.3593965, 0.1175712, -2.432913, 0, 1, 0.2156863, 1,
-0.3591559, -1.003656, -3.51609, 0, 1, 0.2196078, 1,
-0.3525251, -0.2122859, -1.131231, 0, 1, 0.227451, 1,
-0.3516555, 0.05702728, -0.8166797, 0, 1, 0.2313726, 1,
-0.3512574, 1.365673, -0.09417191, 0, 1, 0.2392157, 1,
-0.3501356, 1.110775, -0.2282939, 0, 1, 0.2431373, 1,
-0.3497947, -0.5591817, -1.743844, 0, 1, 0.2509804, 1,
-0.3463513, 1.024298, 0.7132146, 0, 1, 0.254902, 1,
-0.3459615, 1.361577, -0.4341963, 0, 1, 0.2627451, 1,
-0.3458222, -1.194604, -2.065064, 0, 1, 0.2666667, 1,
-0.3440033, 0.6487365, -0.6119513, 0, 1, 0.2745098, 1,
-0.3421969, 0.5170994, -1.351684, 0, 1, 0.2784314, 1,
-0.3420416, 0.5404136, -1.367378, 0, 1, 0.2862745, 1,
-0.3407376, -1.020809, -1.752652, 0, 1, 0.2901961, 1,
-0.3241358, -0.4706376, -2.762717, 0, 1, 0.2980392, 1,
-0.3237221, 1.835451, 0.7684078, 0, 1, 0.3058824, 1,
-0.3227359, 0.3485057, -2.571516, 0, 1, 0.3098039, 1,
-0.3189966, -1.002344, -2.424333, 0, 1, 0.3176471, 1,
-0.3168215, -1.331161, -4.537933, 0, 1, 0.3215686, 1,
-0.30784, -2.613187, -2.085135, 0, 1, 0.3294118, 1,
-0.3063329, -1.258417, -3.901158, 0, 1, 0.3333333, 1,
-0.3032677, 0.2212721, -1.592704, 0, 1, 0.3411765, 1,
-0.3023474, 0.7554977, -1.629374, 0, 1, 0.345098, 1,
-0.3016666, 0.06080559, -1.21737, 0, 1, 0.3529412, 1,
-0.2987847, -1.141339, -2.22436, 0, 1, 0.3568628, 1,
-0.2965873, -0.3199284, -3.962014, 0, 1, 0.3647059, 1,
-0.296158, -1.442272, -4.379741, 0, 1, 0.3686275, 1,
-0.291365, 0.742682, -0.6039532, 0, 1, 0.3764706, 1,
-0.2887851, -1.181962, -4.10604, 0, 1, 0.3803922, 1,
-0.2870367, -0.2174068, -1.62114, 0, 1, 0.3882353, 1,
-0.2809069, 1.380792, -1.471473, 0, 1, 0.3921569, 1,
-0.2784689, 0.7012609, -0.3157443, 0, 1, 0.4, 1,
-0.269327, 0.01211227, -1.542176, 0, 1, 0.4078431, 1,
-0.2649539, 1.293188, 0.1113177, 0, 1, 0.4117647, 1,
-0.2577345, 0.6728796, -0.8164893, 0, 1, 0.4196078, 1,
-0.2575621, -0.1373275, -2.020454, 0, 1, 0.4235294, 1,
-0.2564643, -0.4603437, -2.663409, 0, 1, 0.4313726, 1,
-0.2546842, -0.3050942, -3.903998, 0, 1, 0.4352941, 1,
-0.2525829, 1.797912, -0.06828357, 0, 1, 0.4431373, 1,
-0.2427222, 1.170527, -0.8731027, 0, 1, 0.4470588, 1,
-0.2399481, -0.5339344, -1.785786, 0, 1, 0.454902, 1,
-0.2381147, -0.09244308, -2.224483, 0, 1, 0.4588235, 1,
-0.2342821, -0.5438015, -2.584725, 0, 1, 0.4666667, 1,
-0.2323115, -2.010276, -3.829128, 0, 1, 0.4705882, 1,
-0.2322365, 0.314026, 1.03091, 0, 1, 0.4784314, 1,
-0.2290739, -0.6401354, -3.635412, 0, 1, 0.4823529, 1,
-0.2272106, -0.7911682, -2.948925, 0, 1, 0.4901961, 1,
-0.2232316, -0.5424225, -3.33953, 0, 1, 0.4941176, 1,
-0.2166968, -0.5048, -1.996932, 0, 1, 0.5019608, 1,
-0.2138256, 0.03605586, -1.509258, 0, 1, 0.509804, 1,
-0.213807, -0.7485664, -3.298942, 0, 1, 0.5137255, 1,
-0.2125603, -0.07878487, -2.715461, 0, 1, 0.5215687, 1,
-0.2091829, 0.3458683, -0.1564406, 0, 1, 0.5254902, 1,
-0.2090018, -0.9290736, -2.253033, 0, 1, 0.5333334, 1,
-0.2055757, 1.373706, -1.354755, 0, 1, 0.5372549, 1,
-0.2052642, -0.1049339, -3.335484, 0, 1, 0.5450981, 1,
-0.2041001, 0.4290294, -0.3234863, 0, 1, 0.5490196, 1,
-0.2011137, -0.5962441, -3.038594, 0, 1, 0.5568628, 1,
-0.1975751, 1.063263, 0.405012, 0, 1, 0.5607843, 1,
-0.1955893, 0.853628, 1.139423, 0, 1, 0.5686275, 1,
-0.1953948, -0.4655159, -1.023908, 0, 1, 0.572549, 1,
-0.1946498, -2.956245, -3.902417, 0, 1, 0.5803922, 1,
-0.1933611, 0.6519806, -0.1945822, 0, 1, 0.5843138, 1,
-0.191812, -0.9166774, -1.667552, 0, 1, 0.5921569, 1,
-0.1911808, 0.5525171, -0.001300954, 0, 1, 0.5960785, 1,
-0.1901876, -1.474471, -1.502074, 0, 1, 0.6039216, 1,
-0.1887649, -1.102452, -1.968841, 0, 1, 0.6117647, 1,
-0.1845497, -1.27897, -2.593714, 0, 1, 0.6156863, 1,
-0.1832462, -0.2159269, -2.772729, 0, 1, 0.6235294, 1,
-0.1810639, 0.9317554, 0.08228424, 0, 1, 0.627451, 1,
-0.1798858, -0.008172236, -2.001427, 0, 1, 0.6352941, 1,
-0.1790443, 0.5571475, 1.120222, 0, 1, 0.6392157, 1,
-0.1772666, -0.5862583, -3.71172, 0, 1, 0.6470588, 1,
-0.1706195, 2.006447, 0.06959716, 0, 1, 0.6509804, 1,
-0.165612, 0.659571, 0.4026534, 0, 1, 0.6588235, 1,
-0.1595031, 0.962609, -0.7288295, 0, 1, 0.6627451, 1,
-0.1579538, 0.2073315, -0.3070879, 0, 1, 0.6705883, 1,
-0.1526434, -0.7773091, -1.80477, 0, 1, 0.6745098, 1,
-0.1491767, 1.153974, -1.254268, 0, 1, 0.682353, 1,
-0.1459098, -0.9283744, -2.777134, 0, 1, 0.6862745, 1,
-0.1455109, -2.03427, -2.849275, 0, 1, 0.6941177, 1,
-0.1410109, 0.5031016, -0.9257107, 0, 1, 0.7019608, 1,
-0.1403096, -0.3863682, -2.609077, 0, 1, 0.7058824, 1,
-0.1329374, 0.01930097, -4.003381, 0, 1, 0.7137255, 1,
-0.1310063, -0.1560277, 0.2331889, 0, 1, 0.7176471, 1,
-0.1277681, -0.1300029, -2.020965, 0, 1, 0.7254902, 1,
-0.1253601, -0.4323388, -2.621579, 0, 1, 0.7294118, 1,
-0.120805, 0.1634883, -0.711011, 0, 1, 0.7372549, 1,
-0.1140831, -0.1296717, -3.309659, 0, 1, 0.7411765, 1,
-0.1137386, -0.6913696, -1.96567, 0, 1, 0.7490196, 1,
-0.1077754, 0.5551084, -0.4358295, 0, 1, 0.7529412, 1,
-0.1056905, -0.5837749, -3.130887, 0, 1, 0.7607843, 1,
-0.0994153, 0.6445591, 0.3211083, 0, 1, 0.7647059, 1,
-0.09778329, 0.3719657, -1.473485, 0, 1, 0.772549, 1,
-0.09582832, -0.4203998, -3.48856, 0, 1, 0.7764706, 1,
-0.09326304, 1.449662, -0.05147104, 0, 1, 0.7843137, 1,
-0.08705614, 0.05551737, -1.827224, 0, 1, 0.7882353, 1,
-0.08418907, -0.9925596, -2.477847, 0, 1, 0.7960784, 1,
-0.08342795, -0.1587335, -4.339915, 0, 1, 0.8039216, 1,
-0.08172017, 0.09115466, -1.092291, 0, 1, 0.8078431, 1,
-0.0725126, 0.2846346, 0.4984971, 0, 1, 0.8156863, 1,
-0.07157181, -1.012278, -3.379124, 0, 1, 0.8196079, 1,
-0.06889281, -1.043678, -2.240273, 0, 1, 0.827451, 1,
-0.06829581, -0.4854048, -3.02288, 0, 1, 0.8313726, 1,
-0.06523696, -0.6300782, -2.344591, 0, 1, 0.8392157, 1,
-0.0638996, -0.05948016, -1.928191, 0, 1, 0.8431373, 1,
-0.05736784, -0.6577249, -2.41855, 0, 1, 0.8509804, 1,
-0.05729989, -1.052631, -3.732289, 0, 1, 0.854902, 1,
-0.0564793, -1.272411, -3.988459, 0, 1, 0.8627451, 1,
-0.05412209, 0.6366758, 0.7441946, 0, 1, 0.8666667, 1,
-0.05050193, 0.9234059, -2.149322, 0, 1, 0.8745098, 1,
-0.05023577, -2.202603, -3.381453, 0, 1, 0.8784314, 1,
-0.04359217, -0.1725811, -3.089243, 0, 1, 0.8862745, 1,
-0.04199121, -0.7493042, -4.581715, 0, 1, 0.8901961, 1,
-0.04143966, -0.01696096, -0.175337, 0, 1, 0.8980392, 1,
-0.03290015, -0.4622932, -2.771944, 0, 1, 0.9058824, 1,
-0.03237791, -0.8619512, -1.912361, 0, 1, 0.9098039, 1,
-0.0321459, -0.1879315, -5.182639, 0, 1, 0.9176471, 1,
-0.0320073, 1.31333, 0.3943764, 0, 1, 0.9215686, 1,
-0.03127933, -0.02059068, -1.492813, 0, 1, 0.9294118, 1,
-0.03059531, 1.031776, -0.7723933, 0, 1, 0.9333333, 1,
-0.02338558, -0.8084667, -2.236981, 0, 1, 0.9411765, 1,
-0.01853647, 0.4740078, 1.397935, 0, 1, 0.945098, 1,
-0.01602867, -0.2725688, -3.406789, 0, 1, 0.9529412, 1,
-0.01445348, 0.9397085, 0.4518409, 0, 1, 0.9568627, 1,
-0.01439191, -1.366184, -6.279127, 0, 1, 0.9647059, 1,
-0.01337628, -0.1464451, -3.900281, 0, 1, 0.9686275, 1,
-0.01071714, -0.1254381, -2.283541, 0, 1, 0.9764706, 1,
-0.01025936, 1.420754, -0.4132664, 0, 1, 0.9803922, 1,
-0.007081473, 0.2421132, 2.10614, 0, 1, 0.9882353, 1,
-1.031049e-05, -2.050207, -4.081229, 0, 1, 0.9921569, 1,
0.003182665, -1.100316, 1.095624, 0, 1, 1, 1,
0.003922924, 0.3336379, -0.8360202, 0, 0.9921569, 1, 1,
0.004732116, 0.8039446, 1.829352, 0, 0.9882353, 1, 1,
0.005250632, -0.07759193, 3.257892, 0, 0.9803922, 1, 1,
0.005863109, -2.441916, 4.233831, 0, 0.9764706, 1, 1,
0.006508233, 0.8248747, 0.7943155, 0, 0.9686275, 1, 1,
0.009196133, -2.110492, 3.081187, 0, 0.9647059, 1, 1,
0.01147204, -0.7393411, 2.388757, 0, 0.9568627, 1, 1,
0.01775768, 1.174833, 1.895447, 0, 0.9529412, 1, 1,
0.01803468, -0.7954502, 0.4613551, 0, 0.945098, 1, 1,
0.02037217, -1.339261, 3.414212, 0, 0.9411765, 1, 1,
0.023932, 1.488344, 1.22083, 0, 0.9333333, 1, 1,
0.02543812, -0.02995227, 1.914628, 0, 0.9294118, 1, 1,
0.02641521, -0.5510231, 3.186125, 0, 0.9215686, 1, 1,
0.02688393, -1.5345, 4.638667, 0, 0.9176471, 1, 1,
0.03293623, -0.9826553, 3.282525, 0, 0.9098039, 1, 1,
0.05409003, -0.4323408, 2.944056, 0, 0.9058824, 1, 1,
0.05784669, -0.1229071, 3.113992, 0, 0.8980392, 1, 1,
0.06003855, -0.6092761, 4.695206, 0, 0.8901961, 1, 1,
0.06072665, 0.2478354, -1.323439, 0, 0.8862745, 1, 1,
0.06161796, 0.546469, 0.9516641, 0, 0.8784314, 1, 1,
0.0619044, 0.05345931, 0.9450371, 0, 0.8745098, 1, 1,
0.0635054, -0.06051645, 2.897124, 0, 0.8666667, 1, 1,
0.06406779, 2.568578, 0.1985953, 0, 0.8627451, 1, 1,
0.06492517, -0.6906204, 1.665323, 0, 0.854902, 1, 1,
0.06889994, 1.985536, 1.436098, 0, 0.8509804, 1, 1,
0.06945287, -1.268042, 4.668551, 0, 0.8431373, 1, 1,
0.07103294, -0.574065, 2.612159, 0, 0.8392157, 1, 1,
0.07113016, 0.01300438, 0.8440017, 0, 0.8313726, 1, 1,
0.07118267, -0.2614031, 3.328435, 0, 0.827451, 1, 1,
0.07183675, -1.165405, 2.809707, 0, 0.8196079, 1, 1,
0.08442643, -0.657871, 3.855391, 0, 0.8156863, 1, 1,
0.0854782, 1.261362, 1.689802, 0, 0.8078431, 1, 1,
0.08564335, 0.6685003, -0.5860088, 0, 0.8039216, 1, 1,
0.09033588, -0.454789, 4.074223, 0, 0.7960784, 1, 1,
0.09045769, -0.9500378, 3.212624, 0, 0.7882353, 1, 1,
0.09433732, 1.033579, -0.9005056, 0, 0.7843137, 1, 1,
0.09801593, 0.4713328, 0.1364502, 0, 0.7764706, 1, 1,
0.1014694, -0.1776696, 1.517876, 0, 0.772549, 1, 1,
0.1029235, 0.7512336, -0.5265757, 0, 0.7647059, 1, 1,
0.1044275, 0.6720991, -0.3518839, 0, 0.7607843, 1, 1,
0.1053749, -1.405328, 1.970142, 0, 0.7529412, 1, 1,
0.1124486, -0.5380039, 4.332732, 0, 0.7490196, 1, 1,
0.1164571, -0.1900903, 1.919894, 0, 0.7411765, 1, 1,
0.1166238, -1.362627, 4.157944, 0, 0.7372549, 1, 1,
0.1191432, 0.9027984, 0.43578, 0, 0.7294118, 1, 1,
0.1201402, 0.6158452, 0.1442004, 0, 0.7254902, 1, 1,
0.1212459, 0.8829597, 0.7220292, 0, 0.7176471, 1, 1,
0.1248005, -0.6649482, 2.075078, 0, 0.7137255, 1, 1,
0.1276619, -0.2129626, 2.172181, 0, 0.7058824, 1, 1,
0.130144, 0.6158567, 1.520841, 0, 0.6980392, 1, 1,
0.1310923, -0.5355237, 3.337422, 0, 0.6941177, 1, 1,
0.1326145, 0.04627502, 0.498404, 0, 0.6862745, 1, 1,
0.1343452, 0.6301876, -1.179099, 0, 0.682353, 1, 1,
0.1344375, -2.396049, 2.961646, 0, 0.6745098, 1, 1,
0.1365547, -1.032157, 2.094127, 0, 0.6705883, 1, 1,
0.138329, -1.079939, 3.182037, 0, 0.6627451, 1, 1,
0.1407837, -0.2523136, 2.591851, 0, 0.6588235, 1, 1,
0.1410803, 0.8758994, -0.3781927, 0, 0.6509804, 1, 1,
0.1457666, -0.5190948, 3.807116, 0, 0.6470588, 1, 1,
0.1465796, 0.8708382, -0.3304581, 0, 0.6392157, 1, 1,
0.1474885, -2.372876, 4.135569, 0, 0.6352941, 1, 1,
0.15145, -0.8022045, 5.018062, 0, 0.627451, 1, 1,
0.1521769, 2.013539, -0.3141607, 0, 0.6235294, 1, 1,
0.1546189, 0.4103081, -0.001915714, 0, 0.6156863, 1, 1,
0.1576124, -0.4927867, 3.927863, 0, 0.6117647, 1, 1,
0.170765, 0.4228413, -2.388347, 0, 0.6039216, 1, 1,
0.1717527, -0.8331713, 4.232159, 0, 0.5960785, 1, 1,
0.1734564, -1.514781, 1.996878, 0, 0.5921569, 1, 1,
0.1746132, -0.1701062, 0.9101339, 0, 0.5843138, 1, 1,
0.1747332, -1.725752, 3.521527, 0, 0.5803922, 1, 1,
0.1773848, -0.9150118, 3.193622, 0, 0.572549, 1, 1,
0.1780013, 0.7397626, -1.7017, 0, 0.5686275, 1, 1,
0.1784407, -0.06430643, 3.554169, 0, 0.5607843, 1, 1,
0.1799483, 0.01462399, 1.773718, 0, 0.5568628, 1, 1,
0.1852781, -0.749832, 1.477988, 0, 0.5490196, 1, 1,
0.1857313, 0.9150026, 2.569569, 0, 0.5450981, 1, 1,
0.1866322, -2.231185, 3.778975, 0, 0.5372549, 1, 1,
0.190023, 0.679436, 0.1672461, 0, 0.5333334, 1, 1,
0.1915384, -1.267347, 2.043405, 0, 0.5254902, 1, 1,
0.1958118, 0.45618, 0.2669148, 0, 0.5215687, 1, 1,
0.1974009, -0.9101092, 2.374177, 0, 0.5137255, 1, 1,
0.1975102, 0.9482193, -0.8621424, 0, 0.509804, 1, 1,
0.2026873, 0.4610912, 0.2227018, 0, 0.5019608, 1, 1,
0.2027574, 0.5687701, 1.517694, 0, 0.4941176, 1, 1,
0.2068846, -0.7730331, 1.945971, 0, 0.4901961, 1, 1,
0.2081756, 0.323321, 0.3820499, 0, 0.4823529, 1, 1,
0.2083111, -0.4753278, 2.521853, 0, 0.4784314, 1, 1,
0.2093046, -0.2620603, 3.079181, 0, 0.4705882, 1, 1,
0.2108402, -0.1165366, 2.102381, 0, 0.4666667, 1, 1,
0.2181667, 0.1736962, 2.198125, 0, 0.4588235, 1, 1,
0.2212113, -1.533769, 3.395819, 0, 0.454902, 1, 1,
0.2229588, 0.1655197, 0.9341628, 0, 0.4470588, 1, 1,
0.2232606, -0.3487338, 3.774217, 0, 0.4431373, 1, 1,
0.2332843, -0.5407588, 3.276967, 0, 0.4352941, 1, 1,
0.2364078, -0.8733851, 1.990544, 0, 0.4313726, 1, 1,
0.2364102, 0.5305824, 2.958843, 0, 0.4235294, 1, 1,
0.2384346, -1.794863, 2.383776, 0, 0.4196078, 1, 1,
0.2412983, -0.1802264, 2.632418, 0, 0.4117647, 1, 1,
0.2419178, 0.7823449, -0.8371736, 0, 0.4078431, 1, 1,
0.2440437, -1.611071, 2.73969, 0, 0.4, 1, 1,
0.2466787, -1.729899, 1.659548, 0, 0.3921569, 1, 1,
0.2531777, 1.302633, -0.6672028, 0, 0.3882353, 1, 1,
0.2619531, 1.405211, -0.04754394, 0, 0.3803922, 1, 1,
0.2626147, -0.4595457, 1.544985, 0, 0.3764706, 1, 1,
0.2659608, -0.5992092, 3.927677, 0, 0.3686275, 1, 1,
0.2661929, 0.6929078, -0.5488774, 0, 0.3647059, 1, 1,
0.2677097, 1.327713, 0.1608897, 0, 0.3568628, 1, 1,
0.2698934, -0.931114, 1.904601, 0, 0.3529412, 1, 1,
0.2701535, 0.2814173, 1.719416, 0, 0.345098, 1, 1,
0.2703959, -0.5904365, 3.150303, 0, 0.3411765, 1, 1,
0.2708218, -1.083455, 2.849794, 0, 0.3333333, 1, 1,
0.2721106, 0.8843131, -1.273939, 0, 0.3294118, 1, 1,
0.2739847, -1.031272, 3.149603, 0, 0.3215686, 1, 1,
0.2774158, 0.7818689, -0.3805608, 0, 0.3176471, 1, 1,
0.2839166, 1.24024, -0.5101848, 0, 0.3098039, 1, 1,
0.2890588, 0.1356866, 0.9558313, 0, 0.3058824, 1, 1,
0.2896595, 2.083501, 1.111976, 0, 0.2980392, 1, 1,
0.2901944, 0.9426544, 0.3919451, 0, 0.2901961, 1, 1,
0.2905647, -2.306563, 2.319249, 0, 0.2862745, 1, 1,
0.3008817, 0.4044085, -1.552139, 0, 0.2784314, 1, 1,
0.302875, -0.6982976, 3.182931, 0, 0.2745098, 1, 1,
0.3078024, 0.3389439, 1.417814, 0, 0.2666667, 1, 1,
0.3084358, 0.0475518, 1.333303, 0, 0.2627451, 1, 1,
0.3137047, 0.5342135, -0.1961253, 0, 0.254902, 1, 1,
0.3155495, 0.3397912, 0.9688669, 0, 0.2509804, 1, 1,
0.3253115, -0.4136701, 2.118384, 0, 0.2431373, 1, 1,
0.327227, 0.2192471, 1.221291, 0, 0.2392157, 1, 1,
0.3278707, 2.699342, 0.3326197, 0, 0.2313726, 1, 1,
0.3301851, -0.5124602, 3.478335, 0, 0.227451, 1, 1,
0.3316081, 1.433796, 0.1723941, 0, 0.2196078, 1, 1,
0.3357107, 1.390717, -0.1080879, 0, 0.2156863, 1, 1,
0.3395168, -1.031937, 1.928961, 0, 0.2078431, 1, 1,
0.3443896, 0.9423858, 1.24314, 0, 0.2039216, 1, 1,
0.3469038, -0.8727581, 3.36107, 0, 0.1960784, 1, 1,
0.3482492, 1.058656, 0.7604089, 0, 0.1882353, 1, 1,
0.3540101, -0.4228729, 3.017312, 0, 0.1843137, 1, 1,
0.356366, 1.105408, -0.06764285, 0, 0.1764706, 1, 1,
0.3565063, -1.303229, 1.806815, 0, 0.172549, 1, 1,
0.3569843, -1.068204, 2.353984, 0, 0.1647059, 1, 1,
0.3570841, -0.979506, 2.494294, 0, 0.1607843, 1, 1,
0.3618615, -1.05571, 3.129309, 0, 0.1529412, 1, 1,
0.3625061, 0.9095479, 1.016034, 0, 0.1490196, 1, 1,
0.3663816, 0.6052369, 2.54498, 0, 0.1411765, 1, 1,
0.367226, -0.3582928, 5.045306, 0, 0.1372549, 1, 1,
0.370804, 1.519597, 1.73398, 0, 0.1294118, 1, 1,
0.3754217, 0.0669146, 0.1170297, 0, 0.1254902, 1, 1,
0.3816512, 0.02071612, 2.037812, 0, 0.1176471, 1, 1,
0.3853121, 0.4043466, -0.5117763, 0, 0.1137255, 1, 1,
0.3879466, -0.1383643, 2.419655, 0, 0.1058824, 1, 1,
0.3987249, -0.1961768, 1.320413, 0, 0.09803922, 1, 1,
0.4039639, 0.6520354, 0.6653448, 0, 0.09411765, 1, 1,
0.4057403, -0.473471, 1.029136, 0, 0.08627451, 1, 1,
0.4067952, -0.5908353, 2.212675, 0, 0.08235294, 1, 1,
0.4080403, 1.671331, 0.8197073, 0, 0.07450981, 1, 1,
0.4125026, -0.2074125, 1.357101, 0, 0.07058824, 1, 1,
0.4158349, -1.365521, 1.883971, 0, 0.0627451, 1, 1,
0.415982, 1.311523, 2.190075, 0, 0.05882353, 1, 1,
0.4204477, 1.263196, 0.8438151, 0, 0.05098039, 1, 1,
0.4222201, -0.7320701, 3.256132, 0, 0.04705882, 1, 1,
0.4245418, -0.9896836, 2.275156, 0, 0.03921569, 1, 1,
0.4271286, 1.019452, 0.5407459, 0, 0.03529412, 1, 1,
0.4291832, 1.350679, 0.7641556, 0, 0.02745098, 1, 1,
0.438081, -0.7402796, 3.035095, 0, 0.02352941, 1, 1,
0.4380984, 0.1740925, 1.294689, 0, 0.01568628, 1, 1,
0.4418813, 0.6154097, 0.3138715, 0, 0.01176471, 1, 1,
0.4445732, 1.001754, 1.539666, 0, 0.003921569, 1, 1,
0.4470435, 0.8105859, 0.7817335, 0.003921569, 0, 1, 1,
0.4498173, 1.05291, 1.067451, 0.007843138, 0, 1, 1,
0.4559571, -1.714243, 0.9084253, 0.01568628, 0, 1, 1,
0.4575395, -0.8304027, 2.777029, 0.01960784, 0, 1, 1,
0.4592882, 1.077721, 0.781512, 0.02745098, 0, 1, 1,
0.4648557, 1.071545, 0.7252511, 0.03137255, 0, 1, 1,
0.4675526, -0.09857074, 3.356789, 0.03921569, 0, 1, 1,
0.4712371, 0.03332336, 0.1984243, 0.04313726, 0, 1, 1,
0.4737766, 1.251778, 0.6422734, 0.05098039, 0, 1, 1,
0.4749942, 0.1273417, 1.285942, 0.05490196, 0, 1, 1,
0.4755472, 0.4702705, 0.9731374, 0.0627451, 0, 1, 1,
0.4796597, 0.5392216, 1.258837, 0.06666667, 0, 1, 1,
0.483747, 0.2088598, 1.74092, 0.07450981, 0, 1, 1,
0.4902245, -1.692312, 2.451895, 0.07843138, 0, 1, 1,
0.4909688, 0.2834486, 1.607144, 0.08627451, 0, 1, 1,
0.4923354, -0.7589912, 2.521129, 0.09019608, 0, 1, 1,
0.4925759, 0.9911088, -1.204785, 0.09803922, 0, 1, 1,
0.4953308, -0.3127046, 2.362907, 0.1058824, 0, 1, 1,
0.497544, -2.183692, 1.647929, 0.1098039, 0, 1, 1,
0.4985245, 0.239928, -0.02931012, 0.1176471, 0, 1, 1,
0.4998298, -2.023247, 0.1407018, 0.1215686, 0, 1, 1,
0.5013477, 0.356042, 0.1958145, 0.1294118, 0, 1, 1,
0.504057, -1.376191, 2.885648, 0.1333333, 0, 1, 1,
0.5061552, -1.169839, 1.912453, 0.1411765, 0, 1, 1,
0.5093723, 0.133132, 2.122466, 0.145098, 0, 1, 1,
0.5101255, -1.373044, 2.340973, 0.1529412, 0, 1, 1,
0.5102252, 1.260308, 0.3043728, 0.1568628, 0, 1, 1,
0.5156434, -0.7628393, 2.097224, 0.1647059, 0, 1, 1,
0.5166482, 1.781649, -3.157647, 0.1686275, 0, 1, 1,
0.5188021, 0.06010896, 3.177732, 0.1764706, 0, 1, 1,
0.5212781, -0.1442853, 1.709821, 0.1803922, 0, 1, 1,
0.5252884, 0.3010938, 1.895818, 0.1882353, 0, 1, 1,
0.5265705, -1.128273, 2.683547, 0.1921569, 0, 1, 1,
0.5343283, -0.6689398, 3.157187, 0.2, 0, 1, 1,
0.5454378, 0.6283162, 1.244123, 0.2078431, 0, 1, 1,
0.5606294, 0.4060459, 1.919083, 0.2117647, 0, 1, 1,
0.5628657, 0.1031976, -0.2553862, 0.2196078, 0, 1, 1,
0.5641047, 0.2877952, 1.96335, 0.2235294, 0, 1, 1,
0.5720648, -1.609843, 1.176422, 0.2313726, 0, 1, 1,
0.578053, -0.1413265, 1.002945, 0.2352941, 0, 1, 1,
0.5851816, 0.9743383, -0.5100365, 0.2431373, 0, 1, 1,
0.5859145, 0.07621787, 1.814132, 0.2470588, 0, 1, 1,
0.5894705, 0.1675588, 1.110537, 0.254902, 0, 1, 1,
0.5914598, -0.01209864, 2.773934, 0.2588235, 0, 1, 1,
0.5926151, -2.3459, 4.189417, 0.2666667, 0, 1, 1,
0.5955988, -0.9017173, 3.018971, 0.2705882, 0, 1, 1,
0.5963421, 0.8025807, 0.05045894, 0.2784314, 0, 1, 1,
0.6004394, 1.322441, 1.145407, 0.282353, 0, 1, 1,
0.604772, 0.06344779, 1.374898, 0.2901961, 0, 1, 1,
0.6057464, -0.3282659, 3.727721, 0.2941177, 0, 1, 1,
0.6094571, 0.8443538, -0.4665463, 0.3019608, 0, 1, 1,
0.6138396, -0.5371506, 1.217015, 0.3098039, 0, 1, 1,
0.6140622, 0.9694839, 0.6811416, 0.3137255, 0, 1, 1,
0.6146882, 0.4096664, -0.1679786, 0.3215686, 0, 1, 1,
0.6156857, 0.6144497, 0.3167123, 0.3254902, 0, 1, 1,
0.6183097, 1.826489, 0.0171736, 0.3333333, 0, 1, 1,
0.6287624, -0.2657302, 3.714651, 0.3372549, 0, 1, 1,
0.6293572, -1.906331, 3.423652, 0.345098, 0, 1, 1,
0.6333516, 1.524286, -1.358496, 0.3490196, 0, 1, 1,
0.6360393, 0.1790298, 1.120249, 0.3568628, 0, 1, 1,
0.6364118, -0.2558118, 0.1960602, 0.3607843, 0, 1, 1,
0.6425649, -0.4535052, 2.19165, 0.3686275, 0, 1, 1,
0.6427237, -0.6418387, 2.695265, 0.372549, 0, 1, 1,
0.6468376, -0.115095, 0.1894205, 0.3803922, 0, 1, 1,
0.6542284, 0.1272045, 1.022115, 0.3843137, 0, 1, 1,
0.6554251, 0.877284, 0.5271757, 0.3921569, 0, 1, 1,
0.6556758, -0.7953519, 5.024834, 0.3960784, 0, 1, 1,
0.6596934, -0.3601438, 1.169875, 0.4039216, 0, 1, 1,
0.6617643, 0.4238539, 1.520204, 0.4117647, 0, 1, 1,
0.6620725, -1.398992, 3.49655, 0.4156863, 0, 1, 1,
0.6644771, 0.5637318, -0.5920019, 0.4235294, 0, 1, 1,
0.6681011, -0.6049227, 1.356796, 0.427451, 0, 1, 1,
0.6709145, 1.60853, -0.1458409, 0.4352941, 0, 1, 1,
0.6726991, 0.3712811, -0.2139697, 0.4392157, 0, 1, 1,
0.67505, -1.221488, 2.976992, 0.4470588, 0, 1, 1,
0.6755646, -0.1022695, 2.322801, 0.4509804, 0, 1, 1,
0.6756434, 0.4215661, 1.818351, 0.4588235, 0, 1, 1,
0.6831384, -0.007677672, 1.347338, 0.4627451, 0, 1, 1,
0.6850241, -0.8326579, 4.864879, 0.4705882, 0, 1, 1,
0.6935633, -0.104418, 1.515945, 0.4745098, 0, 1, 1,
0.6953963, 0.4611028, 0.5580921, 0.4823529, 0, 1, 1,
0.6960852, -0.1490105, 0.6254733, 0.4862745, 0, 1, 1,
0.6968348, -0.3988308, 2.074123, 0.4941176, 0, 1, 1,
0.7038547, 1.493936, 1.055947, 0.5019608, 0, 1, 1,
0.70838, -0.391577, 3.408212, 0.5058824, 0, 1, 1,
0.7147335, 0.7321433, 3.080729, 0.5137255, 0, 1, 1,
0.7147766, -0.4261758, 1.152553, 0.5176471, 0, 1, 1,
0.7164227, -1.254358, 1.645604, 0.5254902, 0, 1, 1,
0.719065, -1.061074, 2.24668, 0.5294118, 0, 1, 1,
0.7247214, -0.05389081, 1.664201, 0.5372549, 0, 1, 1,
0.7263004, -0.4308512, 2.902601, 0.5411765, 0, 1, 1,
0.7281274, 0.5504744, 1.578679, 0.5490196, 0, 1, 1,
0.7281584, -0.785888, 3.214857, 0.5529412, 0, 1, 1,
0.729782, -0.5096793, 1.754742, 0.5607843, 0, 1, 1,
0.7322571, 1.570691, 0.7565942, 0.5647059, 0, 1, 1,
0.7323085, 0.9332408, 0.5878649, 0.572549, 0, 1, 1,
0.7323268, -0.1477883, 3.432697, 0.5764706, 0, 1, 1,
0.7337365, 0.530273, 0.290753, 0.5843138, 0, 1, 1,
0.7342584, -0.2855682, 2.754151, 0.5882353, 0, 1, 1,
0.7350002, -0.5722696, 2.350905, 0.5960785, 0, 1, 1,
0.7363582, 0.07389361, 2.35935, 0.6039216, 0, 1, 1,
0.737718, -0.4637127, 2.735654, 0.6078432, 0, 1, 1,
0.7468087, 1.15188, -1.323974, 0.6156863, 0, 1, 1,
0.7491564, -1.693527, 3.016033, 0.6196079, 0, 1, 1,
0.7600325, 0.353651, -0.0911298, 0.627451, 0, 1, 1,
0.7628679, -0.03871272, 0.008898444, 0.6313726, 0, 1, 1,
0.7649201, -0.7391045, 3.223067, 0.6392157, 0, 1, 1,
0.7737414, 1.764814, 1.205995, 0.6431373, 0, 1, 1,
0.7808646, -0.8478875, 2.393697, 0.6509804, 0, 1, 1,
0.7838994, 0.8912385, 0.7984254, 0.654902, 0, 1, 1,
0.7847425, 0.8073487, 0.8367676, 0.6627451, 0, 1, 1,
0.7852992, 1.525176, 1.18537, 0.6666667, 0, 1, 1,
0.7869636, -1.411151, 2.827843, 0.6745098, 0, 1, 1,
0.7886248, 0.4809846, 2.367041, 0.6784314, 0, 1, 1,
0.7911719, -1.276456, 2.610501, 0.6862745, 0, 1, 1,
0.7923764, -0.3537893, 1.465907, 0.6901961, 0, 1, 1,
0.7947472, 0.7265054, 1.386619, 0.6980392, 0, 1, 1,
0.7957336, -0.2066821, 2.286252, 0.7058824, 0, 1, 1,
0.8038424, -1.228966, 2.701612, 0.7098039, 0, 1, 1,
0.8082357, 0.2185096, 2.537111, 0.7176471, 0, 1, 1,
0.8084168, -1.293627, 1.783666, 0.7215686, 0, 1, 1,
0.8124986, 0.03933838, 3.544187, 0.7294118, 0, 1, 1,
0.8175235, 0.9099874, 0.9664608, 0.7333333, 0, 1, 1,
0.8180223, -0.7669025, 3.318922, 0.7411765, 0, 1, 1,
0.8267925, 0.334352, -0.08347636, 0.7450981, 0, 1, 1,
0.8300776, 0.844383, 0.8801521, 0.7529412, 0, 1, 1,
0.8308935, -0.9311704, 2.522874, 0.7568628, 0, 1, 1,
0.8324216, 1.053476, -0.388384, 0.7647059, 0, 1, 1,
0.832899, 0.2394306, 3.248322, 0.7686275, 0, 1, 1,
0.8381377, 0.5233099, 1.904651, 0.7764706, 0, 1, 1,
0.8392602, -1.278417, 1.846174, 0.7803922, 0, 1, 1,
0.8396674, -2.430213, 2.098353, 0.7882353, 0, 1, 1,
0.8437656, -0.1984356, 4.274536, 0.7921569, 0, 1, 1,
0.8544127, 0.08876446, -0.528206, 0.8, 0, 1, 1,
0.8555026, -1.095017, 0.7969385, 0.8078431, 0, 1, 1,
0.8678362, 0.4055988, 0.8923564, 0.8117647, 0, 1, 1,
0.870572, 3.019491, -1.398927, 0.8196079, 0, 1, 1,
0.8723526, -1.569879, 1.868224, 0.8235294, 0, 1, 1,
0.8735407, 0.6243511, 2.603313, 0.8313726, 0, 1, 1,
0.874775, -0.7728332, 3.467885, 0.8352941, 0, 1, 1,
0.8799881, -1.506736, 3.435183, 0.8431373, 0, 1, 1,
0.8805005, 0.2772455, 3.244326, 0.8470588, 0, 1, 1,
0.882645, 0.450004, 1.969468, 0.854902, 0, 1, 1,
0.8857175, -0.4477896, 2.492231, 0.8588235, 0, 1, 1,
0.8954843, 0.135803, 1.205988, 0.8666667, 0, 1, 1,
0.8981341, 1.367015, 0.4593324, 0.8705882, 0, 1, 1,
0.900687, 0.7204729, 1.748037, 0.8784314, 0, 1, 1,
0.9012823, 1.077733, 1.925039, 0.8823529, 0, 1, 1,
0.9019486, 0.2797107, 1.918772, 0.8901961, 0, 1, 1,
0.905084, -1.650876, 2.584485, 0.8941177, 0, 1, 1,
0.9157421, 0.3504812, 1.204961, 0.9019608, 0, 1, 1,
0.9181498, -0.4973977, 3.940494, 0.9098039, 0, 1, 1,
0.9217243, 0.931947, 0.4335571, 0.9137255, 0, 1, 1,
0.9225703, 0.6405089, 1.818446, 0.9215686, 0, 1, 1,
0.9227574, -0.5635424, 1.2047, 0.9254902, 0, 1, 1,
0.9270175, -0.7262668, 2.208248, 0.9333333, 0, 1, 1,
0.9300643, -2.285668, 2.886209, 0.9372549, 0, 1, 1,
0.9302876, -1.876903, 3.286842, 0.945098, 0, 1, 1,
0.9302965, 0.01255894, 1.309579, 0.9490196, 0, 1, 1,
0.9343305, -0.3710212, 0.7264456, 0.9568627, 0, 1, 1,
0.9444523, -0.5166658, 2.547591, 0.9607843, 0, 1, 1,
0.9453534, -0.8827273, 1.872468, 0.9686275, 0, 1, 1,
0.9488653, -0.04327558, -0.109732, 0.972549, 0, 1, 1,
0.9518971, -0.9046499, 2.238418, 0.9803922, 0, 1, 1,
0.9543176, -1.7591, 2.009596, 0.9843137, 0, 1, 1,
0.9586117, -0.6479493, 5.164789, 0.9921569, 0, 1, 1,
0.9592348, -0.5696186, -0.5594901, 0.9960784, 0, 1, 1,
0.9637405, -0.4222916, 1.918152, 1, 0, 0.9960784, 1,
0.9686674, -0.419044, 2.075618, 1, 0, 0.9882353, 1,
0.9691328, 0.2648021, 1.668416, 1, 0, 0.9843137, 1,
0.974189, 0.05629189, 0.03094915, 1, 0, 0.9764706, 1,
0.9743683, -0.3529723, 1.702256, 1, 0, 0.972549, 1,
0.9767637, 0.9268836, 1.869014, 1, 0, 0.9647059, 1,
0.9849616, -0.5292493, 2.646113, 1, 0, 0.9607843, 1,
0.9994926, 0.766941, 0.06046182, 1, 0, 0.9529412, 1,
1.000245, -0.1644917, 1.764714, 1, 0, 0.9490196, 1,
1.00446, 1.116868, 2.512322, 1, 0, 0.9411765, 1,
1.00545, -0.9616101, 3.695827, 1, 0, 0.9372549, 1,
1.015763, -1.772498, 2.364438, 1, 0, 0.9294118, 1,
1.029343, -0.1460795, 2.129753, 1, 0, 0.9254902, 1,
1.030956, -0.5368312, 0.9495271, 1, 0, 0.9176471, 1,
1.031048, 1.362964, 2.012544, 1, 0, 0.9137255, 1,
1.036578, -0.7506953, 2.047687, 1, 0, 0.9058824, 1,
1.038598, 1.801903, 0.2858176, 1, 0, 0.9019608, 1,
1.042688, -0.5986691, 4.674137, 1, 0, 0.8941177, 1,
1.043693, -0.3803612, 1.731534, 1, 0, 0.8862745, 1,
1.044076, -0.8790305, 0.610428, 1, 0, 0.8823529, 1,
1.047725, 0.3549855, 0.4656123, 1, 0, 0.8745098, 1,
1.05062, -1.720182, 2.890618, 1, 0, 0.8705882, 1,
1.057103, -0.07478046, 2.075083, 1, 0, 0.8627451, 1,
1.057571, 3.150757, 0.6528652, 1, 0, 0.8588235, 1,
1.06806, 1.567853, 0.04124974, 1, 0, 0.8509804, 1,
1.073004, 0.1017129, 1.265759, 1, 0, 0.8470588, 1,
1.080052, 0.2879559, 1.412388, 1, 0, 0.8392157, 1,
1.090688, 0.991616, 0.3470404, 1, 0, 0.8352941, 1,
1.09487, -1.343477, 2.716854, 1, 0, 0.827451, 1,
1.102715, -0.03579105, 1.770385, 1, 0, 0.8235294, 1,
1.102849, -0.2309701, 0.4910035, 1, 0, 0.8156863, 1,
1.112054, 0.8026816, 0.4520907, 1, 0, 0.8117647, 1,
1.128079, -0.9987089, 0.7492544, 1, 0, 0.8039216, 1,
1.136498, 1.672688, 1.156075, 1, 0, 0.7960784, 1,
1.13822, 0.617443, 2.124709, 1, 0, 0.7921569, 1,
1.144061, -1.110835, 0.8480546, 1, 0, 0.7843137, 1,
1.155606, -0.9590076, 0.7732111, 1, 0, 0.7803922, 1,
1.155865, 0.3832186, 1.711518, 1, 0, 0.772549, 1,
1.1559, 1.547887, 0.4710169, 1, 0, 0.7686275, 1,
1.156011, 0.7310184, 1.878701, 1, 0, 0.7607843, 1,
1.161949, -1.269118, 2.84496, 1, 0, 0.7568628, 1,
1.162364, 0.7012157, 1.652084, 1, 0, 0.7490196, 1,
1.164621, 0.9086426, 2.127763, 1, 0, 0.7450981, 1,
1.166762, 0.2389048, 0.05986395, 1, 0, 0.7372549, 1,
1.171386, -1.174269, 2.950952, 1, 0, 0.7333333, 1,
1.193803, -0.06305323, 1.521559, 1, 0, 0.7254902, 1,
1.200617, -0.4440534, 3.057176, 1, 0, 0.7215686, 1,
1.204111, 0.04762277, 3.651233, 1, 0, 0.7137255, 1,
1.206391, -1.109678, 2.132973, 1, 0, 0.7098039, 1,
1.208345, 0.5892767, 2.504365, 1, 0, 0.7019608, 1,
1.217307, 1.326409, 0.9788521, 1, 0, 0.6941177, 1,
1.221742, 1.708774, -0.1798064, 1, 0, 0.6901961, 1,
1.231148, 0.9877571, 1.336308, 1, 0, 0.682353, 1,
1.233035, -1.79883, 1.919853, 1, 0, 0.6784314, 1,
1.234197, 0.5343771, 2.201267, 1, 0, 0.6705883, 1,
1.238086, 0.1719907, 3.415321, 1, 0, 0.6666667, 1,
1.238878, -0.3560674, 1.556593, 1, 0, 0.6588235, 1,
1.250118, 0.2499799, -0.1323099, 1, 0, 0.654902, 1,
1.254432, -0.7132532, 3.369031, 1, 0, 0.6470588, 1,
1.260968, 0.8708514, 1.101061, 1, 0, 0.6431373, 1,
1.262491, -0.2744284, 1.826813, 1, 0, 0.6352941, 1,
1.263451, -1.089015, 1.772923, 1, 0, 0.6313726, 1,
1.269697, 0.7291424, 0.8709172, 1, 0, 0.6235294, 1,
1.274732, -1.270377, 1.158108, 1, 0, 0.6196079, 1,
1.283206, 0.7060684, 1.667203, 1, 0, 0.6117647, 1,
1.284175, 0.9290842, 1.126344, 1, 0, 0.6078432, 1,
1.286388, -0.1432043, 0.7229888, 1, 0, 0.6, 1,
1.287042, 0.8879815, 0.3282835, 1, 0, 0.5921569, 1,
1.305113, 0.2498058, 0.7482905, 1, 0, 0.5882353, 1,
1.307226, -1.571125, 2.600052, 1, 0, 0.5803922, 1,
1.311548, 0.6214654, 0.1939687, 1, 0, 0.5764706, 1,
1.317827, 0.9483172, -1.452856, 1, 0, 0.5686275, 1,
1.318384, 0.8420179, -0.7372545, 1, 0, 0.5647059, 1,
1.333169, 0.2669046, 0.9968628, 1, 0, 0.5568628, 1,
1.345596, -0.2383676, 2.358166, 1, 0, 0.5529412, 1,
1.345671, 1.428029, -0.6587922, 1, 0, 0.5450981, 1,
1.374548, 1.025066, 0.7416252, 1, 0, 0.5411765, 1,
1.38571, -0.5221095, 2.463195, 1, 0, 0.5333334, 1,
1.395141, 0.05902931, 1.75868, 1, 0, 0.5294118, 1,
1.397148, -0.870463, 2.951355, 1, 0, 0.5215687, 1,
1.405582, 0.6562718, 2.254972, 1, 0, 0.5176471, 1,
1.411098, -1.858445, 1.062575, 1, 0, 0.509804, 1,
1.413244, -0.4967055, 1.93478, 1, 0, 0.5058824, 1,
1.41427, 0.2148104, -0.8325002, 1, 0, 0.4980392, 1,
1.423145, -1.794419, 2.966816, 1, 0, 0.4901961, 1,
1.434469, 1.682613, -0.4725133, 1, 0, 0.4862745, 1,
1.458082, 1.370893, 1.461269, 1, 0, 0.4784314, 1,
1.482696, -1.286145, 3.774624, 1, 0, 0.4745098, 1,
1.483364, 0.8674734, 2.729918, 1, 0, 0.4666667, 1,
1.505171, 1.504742, 0.4615909, 1, 0, 0.4627451, 1,
1.508192, -0.1344001, 1.474419, 1, 0, 0.454902, 1,
1.518282, 0.365235, 0.9732616, 1, 0, 0.4509804, 1,
1.518603, -0.9337487, 0.4747374, 1, 0, 0.4431373, 1,
1.523326, 1.024605, 1.427177, 1, 0, 0.4392157, 1,
1.538672, -0.739794, -0.2908817, 1, 0, 0.4313726, 1,
1.540022, -0.2212622, 1.994629, 1, 0, 0.427451, 1,
1.549603, 0.1694485, 1.888952, 1, 0, 0.4196078, 1,
1.55627, -0.3288188, 2.167428, 1, 0, 0.4156863, 1,
1.565024, 0.6019181, 0.6832163, 1, 0, 0.4078431, 1,
1.577593, 1.281129, 1.133239, 1, 0, 0.4039216, 1,
1.581505, -0.9842799, 1.325306, 1, 0, 0.3960784, 1,
1.582818, 0.213716, 2.745776, 1, 0, 0.3882353, 1,
1.587577, 0.884877, -0.3667605, 1, 0, 0.3843137, 1,
1.61608, -0.6601302, 2.896047, 1, 0, 0.3764706, 1,
1.624237, -0.4876721, 0.5774556, 1, 0, 0.372549, 1,
1.624781, 0.3437417, 2.544581, 1, 0, 0.3647059, 1,
1.626306, 1.08515, 0.197456, 1, 0, 0.3607843, 1,
1.628027, -0.6865285, 4.673563, 1, 0, 0.3529412, 1,
1.632792, 0.7486053, 0.6625328, 1, 0, 0.3490196, 1,
1.636035, -0.08327837, 1.70881, 1, 0, 0.3411765, 1,
1.644895, -0.921272, 2.506404, 1, 0, 0.3372549, 1,
1.646952, -0.5285856, 1.60152, 1, 0, 0.3294118, 1,
1.650836, 0.4194901, 0.9558963, 1, 0, 0.3254902, 1,
1.666642, 0.5313586, 1.018213, 1, 0, 0.3176471, 1,
1.668644, 0.6360051, 1.888717, 1, 0, 0.3137255, 1,
1.692011, 0.07101562, 1.874253, 1, 0, 0.3058824, 1,
1.713458, 1.277596, -1.492165, 1, 0, 0.2980392, 1,
1.718672, -0.2196862, 4.008812, 1, 0, 0.2941177, 1,
1.730566, 1.56636, 1.245978, 1, 0, 0.2862745, 1,
1.732632, -1.042587, 2.303141, 1, 0, 0.282353, 1,
1.739386, -1.923344, 1.241938, 1, 0, 0.2745098, 1,
1.76623, 0.2811545, 1.388893, 1, 0, 0.2705882, 1,
1.778435, 1.215831, 0.7221273, 1, 0, 0.2627451, 1,
1.783063, 0.3964946, 0.277975, 1, 0, 0.2588235, 1,
1.786888, 0.1154422, 2.27486, 1, 0, 0.2509804, 1,
1.790768, -0.02457745, -0.2018762, 1, 0, 0.2470588, 1,
1.807446, 0.4146582, -0.1261032, 1, 0, 0.2392157, 1,
1.809216, 1.332325, 1.233428, 1, 0, 0.2352941, 1,
1.822113, 0.1060047, 3.515999, 1, 0, 0.227451, 1,
1.827986, 0.7366185, 3.545749, 1, 0, 0.2235294, 1,
1.831543, 0.1105317, 2.689425, 1, 0, 0.2156863, 1,
1.836857, 0.1599123, 1.740502, 1, 0, 0.2117647, 1,
1.836912, 0.5989186, 1.167141, 1, 0, 0.2039216, 1,
1.855382, 0.5947893, -1.154513, 1, 0, 0.1960784, 1,
1.86362, -0.7150367, 1.111585, 1, 0, 0.1921569, 1,
1.875996, 0.2058985, -0.05690682, 1, 0, 0.1843137, 1,
1.897342, -0.2647286, 1.46423, 1, 0, 0.1803922, 1,
1.905058, -0.005961494, 1.347202, 1, 0, 0.172549, 1,
1.912563, -3.476785, 3.046757, 1, 0, 0.1686275, 1,
1.914559, -0.2085713, 1.428728, 1, 0, 0.1607843, 1,
1.930366, -0.2316809, 2.838273, 1, 0, 0.1568628, 1,
1.938196, -0.4892226, 1.5865, 1, 0, 0.1490196, 1,
1.940793, -1.082488, 3.086691, 1, 0, 0.145098, 1,
1.947364, -0.1371608, 2.388837, 1, 0, 0.1372549, 1,
1.959326, -0.3123596, -0.4581512, 1, 0, 0.1333333, 1,
1.977907, -0.1607381, 2.5432, 1, 0, 0.1254902, 1,
1.979208, -1.551234, 1.78246, 1, 0, 0.1215686, 1,
1.986384, -1.115766, 1.274559, 1, 0, 0.1137255, 1,
2.006193, 0.3621926, 0.6983838, 1, 0, 0.1098039, 1,
2.016092, 0.9217474, 0.5907122, 1, 0, 0.1019608, 1,
2.076215, -1.375031, 3.732306, 1, 0, 0.09411765, 1,
2.138598, 0.2103645, 0.8548467, 1, 0, 0.09019608, 1,
2.147558, -0.4492647, 0.5535529, 1, 0, 0.08235294, 1,
2.149852, -0.1938674, 1.177027, 1, 0, 0.07843138, 1,
2.157017, -0.3877807, 2.314228, 1, 0, 0.07058824, 1,
2.157165, 0.8507323, 1.982363, 1, 0, 0.06666667, 1,
2.170869, -0.3993321, 1.310431, 1, 0, 0.05882353, 1,
2.207364, -1.205669, 2.269992, 1, 0, 0.05490196, 1,
2.299393, -1.064589, 1.898712, 1, 0, 0.04705882, 1,
2.339308, 0.2402752, 1.041761, 1, 0, 0.04313726, 1,
2.374705, 0.2308687, 1.719241, 1, 0, 0.03529412, 1,
2.423576, 0.4734754, -0.02672266, 1, 0, 0.03137255, 1,
2.529618, -0.716908, 1.735968, 1, 0, 0.02352941, 1,
2.62698, 0.6036128, 2.17599, 1, 0, 0.01960784, 1,
2.703118, 0.4667071, 2.591472, 1, 0, 0.01176471, 1,
2.84503, 2.713173, 0.3649361, 1, 0, 0.007843138, 1
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
-0.2561408, -4.600153, -8.21887, 0, -0.5, 0.5, 0.5,
-0.2561408, -4.600153, -8.21887, 1, -0.5, 0.5, 0.5,
-0.2561408, -4.600153, -8.21887, 1, 1.5, 0.5, 0.5,
-0.2561408, -4.600153, -8.21887, 0, 1.5, 0.5, 0.5
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
-4.408608, -0.1630137, -8.21887, 0, -0.5, 0.5, 0.5,
-4.408608, -0.1630137, -8.21887, 1, -0.5, 0.5, 0.5,
-4.408608, -0.1630137, -8.21887, 1, 1.5, 0.5, 0.5,
-4.408608, -0.1630137, -8.21887, 0, 1.5, 0.5, 0.5
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
-4.408608, -4.600153, -0.5571687, 0, -0.5, 0.5, 0.5,
-4.408608, -4.600153, -0.5571687, 1, -0.5, 0.5, 0.5,
-4.408608, -4.600153, -0.5571687, 1, 1.5, 0.5, 0.5,
-4.408608, -4.600153, -0.5571687, 0, 1.5, 0.5, 0.5
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
-3, -3.576198, -6.450785,
2, -3.576198, -6.450785,
-3, -3.576198, -6.450785,
-3, -3.746857, -6.745466,
-2, -3.576198, -6.450785,
-2, -3.746857, -6.745466,
-1, -3.576198, -6.450785,
-1, -3.746857, -6.745466,
0, -3.576198, -6.450785,
0, -3.746857, -6.745466,
1, -3.576198, -6.450785,
1, -3.746857, -6.745466,
2, -3.576198, -6.450785,
2, -3.746857, -6.745466
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
-3, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
-3, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
-3, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
-3, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5,
-2, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
-2, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
-2, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
-2, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5,
-1, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
-1, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
-1, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
-1, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5,
0, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
0, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
0, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
0, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5,
1, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
1, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
1, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
1, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5,
2, -4.088175, -7.334828, 0, -0.5, 0.5, 0.5,
2, -4.088175, -7.334828, 1, -0.5, 0.5, 0.5,
2, -4.088175, -7.334828, 1, 1.5, 0.5, 0.5,
2, -4.088175, -7.334828, 0, 1.5, 0.5, 0.5
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
-3.450347, -3, -6.450785,
-3.450347, 3, -6.450785,
-3.450347, -3, -6.450785,
-3.610057, -3, -6.745466,
-3.450347, -2, -6.450785,
-3.610057, -2, -6.745466,
-3.450347, -1, -6.450785,
-3.610057, -1, -6.745466,
-3.450347, 0, -6.450785,
-3.610057, 0, -6.745466,
-3.450347, 1, -6.450785,
-3.610057, 1, -6.745466,
-3.450347, 2, -6.450785,
-3.610057, 2, -6.745466,
-3.450347, 3, -6.450785,
-3.610057, 3, -6.745466
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
-3.929477, -3, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, -3, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, -3, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, -3, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, -2, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, -2, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, -2, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, -2, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, -1, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, -1, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, -1, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, -1, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, 0, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, 0, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, 0, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, 0, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, 1, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, 1, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, 1, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, 1, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, 2, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, 2, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, 2, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, 2, -7.334828, 0, 1.5, 0.5, 0.5,
-3.929477, 3, -7.334828, 0, -0.5, 0.5, 0.5,
-3.929477, 3, -7.334828, 1, -0.5, 0.5, 0.5,
-3.929477, 3, -7.334828, 1, 1.5, 0.5, 0.5,
-3.929477, 3, -7.334828, 0, 1.5, 0.5, 0.5
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
-3.450347, -3.576198, -6,
-3.450347, -3.576198, 4,
-3.450347, -3.576198, -6,
-3.610057, -3.746857, -6,
-3.450347, -3.576198, -4,
-3.610057, -3.746857, -4,
-3.450347, -3.576198, -2,
-3.610057, -3.746857, -2,
-3.450347, -3.576198, 0,
-3.610057, -3.746857, 0,
-3.450347, -3.576198, 2,
-3.610057, -3.746857, 2,
-3.450347, -3.576198, 4,
-3.610057, -3.746857, 4
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
-3.929477, -4.088175, -6, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -6, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -6, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, -6, 0, 1.5, 0.5, 0.5,
-3.929477, -4.088175, -4, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -4, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -4, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, -4, 0, 1.5, 0.5, 0.5,
-3.929477, -4.088175, -2, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -2, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, -2, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, -2, 0, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 0, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 0, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 0, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 0, 0, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 2, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 2, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 2, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 2, 0, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 4, 0, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 4, 1, -0.5, 0.5, 0.5,
-3.929477, -4.088175, 4, 1, 1.5, 0.5, 0.5,
-3.929477, -4.088175, 4, 0, 1.5, 0.5, 0.5
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
-3.450347, -3.576198, -6.450785,
-3.450347, 3.25017, -6.450785,
-3.450347, -3.576198, 5.336448,
-3.450347, 3.25017, 5.336448,
-3.450347, -3.576198, -6.450785,
-3.450347, -3.576198, 5.336448,
-3.450347, 3.25017, -6.450785,
-3.450347, 3.25017, 5.336448,
-3.450347, -3.576198, -6.450785,
2.938065, -3.576198, -6.450785,
-3.450347, -3.576198, 5.336448,
2.938065, -3.576198, 5.336448,
-3.450347, 3.25017, -6.450785,
2.938065, 3.25017, -6.450785,
-3.450347, 3.25017, 5.336448,
2.938065, 3.25017, 5.336448,
2.938065, -3.576198, -6.450785,
2.938065, 3.25017, -6.450785,
2.938065, -3.576198, 5.336448,
2.938065, 3.25017, 5.336448,
2.938065, -3.576198, -6.450785,
2.938065, -3.576198, 5.336448,
2.938065, 3.25017, -6.450785,
2.938065, 3.25017, 5.336448
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
var radius = 8.033702;
var distance = 35.74285;
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
mvMatrix.translate( 0.2561408, 0.1630137, 0.5571687 );
mvMatrix.scale( 1.35968, 1.272448, 0.7369155 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74285);
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
1-dodecylguanidinium<-read.table("1-dodecylguanidinium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-1-dodecylguanidinium$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidinium' not found
```

```r
y<-1-dodecylguanidinium$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidinium' not found
```

```r
z<-1-dodecylguanidinium$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodecylguanidinium' not found
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
-3.357311, -0.07869402, -2.204661, 0, 0, 1, 1, 1,
-3.127672, 0.4692306, -1.990552, 1, 0, 0, 1, 1,
-3.084262, -1.664281, 0.6592966, 1, 0, 0, 1, 1,
-2.839491, -1.182697, -3.518237, 1, 0, 0, 1, 1,
-2.819922, 0.5493141, -1.503452, 1, 0, 0, 1, 1,
-2.704871, -1.108032, -2.052914, 1, 0, 0, 1, 1,
-2.699761, -0.5480378, -1.340635, 0, 0, 0, 1, 1,
-2.529026, -0.5725495, -1.567318, 0, 0, 0, 1, 1,
-2.507283, -1.178258, -0.1896346, 0, 0, 0, 1, 1,
-2.496041, 2.397201, -1.543822, 0, 0, 0, 1, 1,
-2.351676, -1.541067, -2.523365, 0, 0, 0, 1, 1,
-2.265889, 2.15682, -0.5317848, 0, 0, 0, 1, 1,
-2.265801, -0.9938146, -3.66268, 0, 0, 0, 1, 1,
-2.25924, 0.6591555, -0.8999017, 1, 1, 1, 1, 1,
-2.212823, -0.2944514, -2.28251, 1, 1, 1, 1, 1,
-2.207607, -0.06631593, -1.720639, 1, 1, 1, 1, 1,
-2.161258, 0.9072368, -0.1166569, 1, 1, 1, 1, 1,
-2.140833, 0.2937244, -0.5026016, 1, 1, 1, 1, 1,
-2.119875, 1.289181, -1.534432, 1, 1, 1, 1, 1,
-2.114446, -0.6116685, -0.4522139, 1, 1, 1, 1, 1,
-2.051852, 0.8264748, -1.042661, 1, 1, 1, 1, 1,
-2.03911, -0.5658985, -2.169966, 1, 1, 1, 1, 1,
-1.987303, -1.075855, -1.416536, 1, 1, 1, 1, 1,
-1.936367, -1.631886, -2.418611, 1, 1, 1, 1, 1,
-1.933387, 1.009006, -1.413727, 1, 1, 1, 1, 1,
-1.926068, -0.4962905, -2.561205, 1, 1, 1, 1, 1,
-1.924139, 1.534272, 0.0310998, 1, 1, 1, 1, 1,
-1.922263, -0.1897414, -0.03035229, 1, 1, 1, 1, 1,
-1.885473, -1.147053, -1.06816, 0, 0, 1, 1, 1,
-1.86751, -0.3145463, -0.5217419, 1, 0, 0, 1, 1,
-1.86244, -0.9854798, 0.3361445, 1, 0, 0, 1, 1,
-1.860333, -0.9643881, -1.225909, 1, 0, 0, 1, 1,
-1.847571, 0.4402582, -0.5994151, 1, 0, 0, 1, 1,
-1.835859, 2.126202, -1.301305, 1, 0, 0, 1, 1,
-1.8305, 0.5493429, -2.947247, 0, 0, 0, 1, 1,
-1.81995, 0.6771109, -1.917662, 0, 0, 0, 1, 1,
-1.804345, -0.9179982, -2.590556, 0, 0, 0, 1, 1,
-1.790207, -0.7678821, -1.05715, 0, 0, 0, 1, 1,
-1.787769, -1.135428, -1.884159, 0, 0, 0, 1, 1,
-1.783053, 0.3711829, -1.832511, 0, 0, 0, 1, 1,
-1.75864, 0.4231647, -0.9832042, 0, 0, 0, 1, 1,
-1.74595, -0.07606092, -1.495997, 1, 1, 1, 1, 1,
-1.730586, -0.4084996, -2.186152, 1, 1, 1, 1, 1,
-1.730041, -0.4907897, -3.012703, 1, 1, 1, 1, 1,
-1.727078, -0.5839611, -2.688095, 1, 1, 1, 1, 1,
-1.70877, 0.3030282, -1.249045, 1, 1, 1, 1, 1,
-1.707541, 1.163715, 0.3484344, 1, 1, 1, 1, 1,
-1.675277, -0.7483359, -1.916658, 1, 1, 1, 1, 1,
-1.670829, 1.755097, -1.720317, 1, 1, 1, 1, 1,
-1.645628, -0.2744216, 0.4555407, 1, 1, 1, 1, 1,
-1.620579, 2.076238, -0.8118472, 1, 1, 1, 1, 1,
-1.609957, -0.05585365, -1.039513, 1, 1, 1, 1, 1,
-1.602956, 0.8486947, -0.4549486, 1, 1, 1, 1, 1,
-1.596583, 1.332878, -1.174417, 1, 1, 1, 1, 1,
-1.595498, -0.3677521, -4.911858, 1, 1, 1, 1, 1,
-1.588462, -0.06007479, -3.330458, 1, 1, 1, 1, 1,
-1.58788, -1.014204, -3.635711, 0, 0, 1, 1, 1,
-1.576462, 0.7035178, -0.8746119, 1, 0, 0, 1, 1,
-1.569596, 0.1024976, -1.247325, 1, 0, 0, 1, 1,
-1.565244, -0.4597014, -1.671361, 1, 0, 0, 1, 1,
-1.547988, -0.3797887, -3.443698, 1, 0, 0, 1, 1,
-1.540506, 0.6484911, -2.371292, 1, 0, 0, 1, 1,
-1.539904, 0.7991642, -0.7974495, 0, 0, 0, 1, 1,
-1.527763, -0.8382176, -1.822491, 0, 0, 0, 1, 1,
-1.525103, -0.2057797, -1.678539, 0, 0, 0, 1, 1,
-1.520811, 1.041288, 0.6547257, 0, 0, 0, 1, 1,
-1.51663, 0.5761598, 0.1026904, 0, 0, 0, 1, 1,
-1.500859, 0.9746684, -2.0894, 0, 0, 0, 1, 1,
-1.497107, -0.4164529, -2.591014, 0, 0, 0, 1, 1,
-1.490298, 0.6199081, -1.302602, 1, 1, 1, 1, 1,
-1.484536, 1.033462, -0.4828533, 1, 1, 1, 1, 1,
-1.479774, 0.6704758, -1.465528, 1, 1, 1, 1, 1,
-1.478286, 0.3835909, -0.3956863, 1, 1, 1, 1, 1,
-1.474351, 1.369443, -2.049385, 1, 1, 1, 1, 1,
-1.471902, 0.7984196, -1.587546, 1, 1, 1, 1, 1,
-1.463763, 0.8652324, -1.430344, 1, 1, 1, 1, 1,
-1.448057, -0.3799038, -2.449444, 1, 1, 1, 1, 1,
-1.447841, 0.5633929, -0.1252916, 1, 1, 1, 1, 1,
-1.447049, -0.6719647, -1.218584, 1, 1, 1, 1, 1,
-1.444389, 0.6620796, -0.8116561, 1, 1, 1, 1, 1,
-1.443338, -0.456465, -2.725499, 1, 1, 1, 1, 1,
-1.442865, 0.5977768, 0.5060493, 1, 1, 1, 1, 1,
-1.438475, -1.27357, -0.8645666, 1, 1, 1, 1, 1,
-1.434126, -0.4105206, -2.484551, 1, 1, 1, 1, 1,
-1.428067, -1.617681, -2.629841, 0, 0, 1, 1, 1,
-1.415989, -1.702489, -2.751524, 1, 0, 0, 1, 1,
-1.414532, 0.2879874, -2.806741, 1, 0, 0, 1, 1,
-1.413577, -0.4202328, -1.340034, 1, 0, 0, 1, 1,
-1.402755, 0.1554861, -1.610428, 1, 0, 0, 1, 1,
-1.396057, -0.04410247, -3.04891, 1, 0, 0, 1, 1,
-1.395315, 1.529669, 0.9156687, 0, 0, 0, 1, 1,
-1.393395, 0.2370643, -1.334875, 0, 0, 0, 1, 1,
-1.388214, 0.1485548, -3.246095, 0, 0, 0, 1, 1,
-1.378497, -1.403096, -3.185852, 0, 0, 0, 1, 1,
-1.377553, -0.8521434, -1.46824, 0, 0, 0, 1, 1,
-1.36283, 0.1226683, -1.437106, 0, 0, 0, 1, 1,
-1.357712, 0.4339343, -1.882506, 0, 0, 0, 1, 1,
-1.333187, 0.08546419, -1.562534, 1, 1, 1, 1, 1,
-1.331514, 0.5016958, -1.61701, 1, 1, 1, 1, 1,
-1.33117, -1.624748, -2.627366, 1, 1, 1, 1, 1,
-1.321092, 0.3545325, -1.974971, 1, 1, 1, 1, 1,
-1.299028, 1.611813, 0.4453071, 1, 1, 1, 1, 1,
-1.296983, 0.0216036, 1.105668, 1, 1, 1, 1, 1,
-1.291438, 0.1139342, -1.352532, 1, 1, 1, 1, 1,
-1.290586, -0.2176479, -3.657046, 1, 1, 1, 1, 1,
-1.289352, -0.5141501, -3.46857, 1, 1, 1, 1, 1,
-1.289326, -0.9472957, -2.780385, 1, 1, 1, 1, 1,
-1.283751, 0.2574843, -1.388729, 1, 1, 1, 1, 1,
-1.281291, -0.08088993, -0.7615861, 1, 1, 1, 1, 1,
-1.279041, -0.5499834, -3.158679, 1, 1, 1, 1, 1,
-1.277504, 0.9787907, 0.9616098, 1, 1, 1, 1, 1,
-1.276321, -2.763824, -5.370678, 1, 1, 1, 1, 1,
-1.275511, -0.8341305, -1.842115, 0, 0, 1, 1, 1,
-1.266294, 0.8339161, -0.5953994, 1, 0, 0, 1, 1,
-1.264947, -0.6979539, -2.8415, 1, 0, 0, 1, 1,
-1.263542, -0.2691369, -2.749078, 1, 0, 0, 1, 1,
-1.261876, 0.6515982, 1.530354, 1, 0, 0, 1, 1,
-1.260252, -0.02598563, -0.4983236, 1, 0, 0, 1, 1,
-1.257874, 1.361405, -1.93342, 0, 0, 0, 1, 1,
-1.25343, 0.6029702, 0.7744996, 0, 0, 0, 1, 1,
-1.25039, 1.436094, -1.308625, 0, 0, 0, 1, 1,
-1.248439, 0.4516789, -0.9405273, 0, 0, 0, 1, 1,
-1.246327, -1.061201, -1.128154, 0, 0, 0, 1, 1,
-1.243328, -0.4347388, -0.1720687, 0, 0, 0, 1, 1,
-1.235343, 0.2001774, -0.1549186, 0, 0, 0, 1, 1,
-1.234741, -1.728479, -3.167967, 1, 1, 1, 1, 1,
-1.232896, -0.5132163, -3.839423, 1, 1, 1, 1, 1,
-1.232795, 0.831683, -1.363804, 1, 1, 1, 1, 1,
-1.231627, -0.04679082, -2.727877, 1, 1, 1, 1, 1,
-1.227392, 0.5019931, -1.686622, 1, 1, 1, 1, 1,
-1.22326, -0.6668776, -1.082478, 1, 1, 1, 1, 1,
-1.21883, -1.508976, -2.932099, 1, 1, 1, 1, 1,
-1.218364, 0.9470646, -1.689132, 1, 1, 1, 1, 1,
-1.206219, -0.196238, -1.88058, 1, 1, 1, 1, 1,
-1.198793, 1.170472, 1.279291, 1, 1, 1, 1, 1,
-1.191728, 0.5121195, -1.759237, 1, 1, 1, 1, 1,
-1.188575, -1.076463, -3.579242, 1, 1, 1, 1, 1,
-1.179718, 1.772224, 0.1221932, 1, 1, 1, 1, 1,
-1.1791, 0.07618858, -1.345081, 1, 1, 1, 1, 1,
-1.169714, 0.7062789, -1.192579, 1, 1, 1, 1, 1,
-1.16577, 0.3095759, -2.083599, 0, 0, 1, 1, 1,
-1.164934, 0.751048, -1.149801, 1, 0, 0, 1, 1,
-1.162588, -0.1179307, -3.227365, 1, 0, 0, 1, 1,
-1.157333, -0.3139865, -1.49579, 1, 0, 0, 1, 1,
-1.153556, -0.7265955, -2.286394, 1, 0, 0, 1, 1,
-1.151525, 1.163787, -2.871534, 1, 0, 0, 1, 1,
-1.145045, -0.1989075, -1.790146, 0, 0, 0, 1, 1,
-1.14329, -1.466658, -1.561132, 0, 0, 0, 1, 1,
-1.142273, -1.488264, -2.579687, 0, 0, 0, 1, 1,
-1.13206, 0.08287716, -0.7196317, 0, 0, 0, 1, 1,
-1.13092, -0.860809, -1.961347, 0, 0, 0, 1, 1,
-1.12924, -0.08002245, -1.15672, 0, 0, 0, 1, 1,
-1.117118, 0.1952699, -0.7986862, 0, 0, 0, 1, 1,
-1.116494, -0.2577696, -3.390126, 1, 1, 1, 1, 1,
-1.115474, 0.7730685, -1.017144, 1, 1, 1, 1, 1,
-1.107759, 0.08885691, -1.203161, 1, 1, 1, 1, 1,
-1.086377, 0.1100928, -2.151574, 1, 1, 1, 1, 1,
-1.082365, -0.2303808, -1.833899, 1, 1, 1, 1, 1,
-1.080723, -0.1779166, -0.8430945, 1, 1, 1, 1, 1,
-1.074671, 1.138044, -1.342429, 1, 1, 1, 1, 1,
-1.071518, -0.7262117, -2.001972, 1, 1, 1, 1, 1,
-1.0693, 2.460597, -0.9080176, 1, 1, 1, 1, 1,
-1.06137, 1.607955, -0.7233665, 1, 1, 1, 1, 1,
-1.05914, -1.096863, -2.748997, 1, 1, 1, 1, 1,
-1.054302, -0.2648613, -1.04309, 1, 1, 1, 1, 1,
-1.047377, 0.9068899, -0.8996069, 1, 1, 1, 1, 1,
-1.046476, 2.583555, 1.007074, 1, 1, 1, 1, 1,
-1.041502, 0.1752911, 0.2715492, 1, 1, 1, 1, 1,
-1.031362, -0.8140898, -1.832456, 0, 0, 1, 1, 1,
-1.020353, 1.163275, -0.6686598, 1, 0, 0, 1, 1,
-1.019273, -0.3515024, -1.412552, 1, 0, 0, 1, 1,
-1.01876, -0.4944206, -0.5111749, 1, 0, 0, 1, 1,
-1.005563, -0.0986921, -0.7138822, 1, 0, 0, 1, 1,
-1.004379, 0.4395305, -1.662035, 1, 0, 0, 1, 1,
-0.9971341, -0.2106933, -2.247304, 0, 0, 0, 1, 1,
-0.9906955, 0.01854475, -0.1892025, 0, 0, 0, 1, 1,
-0.9885688, 2.003838, -0.2125033, 0, 0, 0, 1, 1,
-0.9873626, 0.1438159, -2.922932, 0, 0, 0, 1, 1,
-0.9864669, 1.37872, 0.382575, 0, 0, 0, 1, 1,
-0.9819375, -0.7715562, -2.229364, 0, 0, 0, 1, 1,
-0.9817051, -0.09828835, -2.693358, 0, 0, 0, 1, 1,
-0.9795763, 1.741342, 0.3622417, 1, 1, 1, 1, 1,
-0.9701005, 0.01452199, -2.233874, 1, 1, 1, 1, 1,
-0.9677049, 0.4193502, -1.011559, 1, 1, 1, 1, 1,
-0.9661312, 1.408351, -0.06380586, 1, 1, 1, 1, 1,
-0.965812, 0.4165984, -2.915802, 1, 1, 1, 1, 1,
-0.9492272, -1.089216, -3.380444, 1, 1, 1, 1, 1,
-0.9340866, 0.05193014, -1.140396, 1, 1, 1, 1, 1,
-0.9325641, -0.3005283, -0.2722979, 1, 1, 1, 1, 1,
-0.932514, 1.038125, 0.9163851, 1, 1, 1, 1, 1,
-0.9306573, 1.998674, 0.7665938, 1, 1, 1, 1, 1,
-0.9298016, 1.033328, 0.3970831, 1, 1, 1, 1, 1,
-0.9207423, -1.535794, -2.456329, 1, 1, 1, 1, 1,
-0.9080599, -0.6967776, -2.961664, 1, 1, 1, 1, 1,
-0.9076404, -0.7973809, -3.381008, 1, 1, 1, 1, 1,
-0.8912144, -0.6593984, -2.294511, 1, 1, 1, 1, 1,
-0.885782, 1.747493, -1.247895, 0, 0, 1, 1, 1,
-0.8852236, -0.3462919, -2.333217, 1, 0, 0, 1, 1,
-0.8831078, -2.473485, -3.449999, 1, 0, 0, 1, 1,
-0.8809935, -0.8028035, -2.004741, 1, 0, 0, 1, 1,
-0.870134, 0.9436612, 0.08174791, 1, 0, 0, 1, 1,
-0.8602725, 0.157595, -1.612566, 1, 0, 0, 1, 1,
-0.8531007, -0.4438391, -1.117056, 0, 0, 0, 1, 1,
-0.8529317, -0.5658776, -1.539958, 0, 0, 0, 1, 1,
-0.8513477, -0.4352793, -1.704612, 0, 0, 0, 1, 1,
-0.8487829, 0.2028322, -2.248279, 0, 0, 0, 1, 1,
-0.8466538, -0.09006419, -3.830065, 0, 0, 0, 1, 1,
-0.8329769, 0.850261, -1.112969, 0, 0, 0, 1, 1,
-0.8259223, -0.2693239, -1.614855, 0, 0, 0, 1, 1,
-0.8251579, -1.332554, -3.112152, 1, 1, 1, 1, 1,
-0.8170983, 1.175072, 0.3068685, 1, 1, 1, 1, 1,
-0.8132218, -1.540483, -2.736761, 1, 1, 1, 1, 1,
-0.8130838, 0.4093478, -1.428265, 1, 1, 1, 1, 1,
-0.812099, 0.17113, -0.8821102, 1, 1, 1, 1, 1,
-0.8112916, 0.4000389, -1.41845, 1, 1, 1, 1, 1,
-0.8079984, 1.41185, -0.2510771, 1, 1, 1, 1, 1,
-0.807264, -0.3977867, -3.196541, 1, 1, 1, 1, 1,
-0.8033152, 1.732194, -1.655917, 1, 1, 1, 1, 1,
-0.8022837, 1.434541, -0.9451885, 1, 1, 1, 1, 1,
-0.8008243, 0.8972989, -1.669779, 1, 1, 1, 1, 1,
-0.799881, 0.09713235, -2.776841, 1, 1, 1, 1, 1,
-0.7965867, 0.4593597, -1.216612, 1, 1, 1, 1, 1,
-0.7785369, 0.975087, -1.517892, 1, 1, 1, 1, 1,
-0.7777227, -1.020845, -1.286077, 1, 1, 1, 1, 1,
-0.7740417, 0.883097, -1.109087, 0, 0, 1, 1, 1,
-0.7732967, 0.8084835, 0.4457545, 1, 0, 0, 1, 1,
-0.7726353, -0.2999628, -1.200301, 1, 0, 0, 1, 1,
-0.767488, -1.623305, -2.061329, 1, 0, 0, 1, 1,
-0.7654145, 1.133274, -1.332718, 1, 0, 0, 1, 1,
-0.763994, 0.2816571, 0.5909162, 1, 0, 0, 1, 1,
-0.7624829, 0.2453522, -2.096773, 0, 0, 0, 1, 1,
-0.7572555, -0.726966, -1.777387, 0, 0, 0, 1, 1,
-0.7543325, 0.3416544, -2.948241, 0, 0, 0, 1, 1,
-0.7534446, 0.1326293, -0.9269698, 0, 0, 0, 1, 1,
-0.7435014, -0.8690532, -2.737642, 0, 0, 0, 1, 1,
-0.7403094, -1.631819, -3.057589, 0, 0, 0, 1, 1,
-0.7300111, -0.4025691, 0.3652399, 0, 0, 0, 1, 1,
-0.729768, -0.5412329, -3.24476, 1, 1, 1, 1, 1,
-0.7248634, 1.015948, -0.3661498, 1, 1, 1, 1, 1,
-0.7217451, -0.8917069, -3.029886, 1, 1, 1, 1, 1,
-0.7205052, -0.2396588, -3.283916, 1, 1, 1, 1, 1,
-0.7200498, 0.8019311, -2.737142, 1, 1, 1, 1, 1,
-0.718417, 1.478239, 0.3386772, 1, 1, 1, 1, 1,
-0.7139369, 0.2733052, -2.555929, 1, 1, 1, 1, 1,
-0.713549, -0.8072857, -2.390209, 1, 1, 1, 1, 1,
-0.713052, -0.04268085, -0.3908094, 1, 1, 1, 1, 1,
-0.7105954, 1.008516, -0.9492338, 1, 1, 1, 1, 1,
-0.7077543, -0.3897236, -2.926641, 1, 1, 1, 1, 1,
-0.7001588, 0.7254515, -0.5702252, 1, 1, 1, 1, 1,
-0.7001168, -0.6886296, -3.274924, 1, 1, 1, 1, 1,
-0.6994666, -0.8179281, -3.822523, 1, 1, 1, 1, 1,
-0.6984417, 0.2476849, -1.109631, 1, 1, 1, 1, 1,
-0.6963152, 0.9722372, -1.898718, 0, 0, 1, 1, 1,
-0.6953071, 0.5527009, 1.953778, 1, 0, 0, 1, 1,
-0.6907014, -1.048547, -1.262476, 1, 0, 0, 1, 1,
-0.6898342, -0.4343902, -0.7806379, 1, 0, 0, 1, 1,
-0.6887945, -1.849321, -2.366776, 1, 0, 0, 1, 1,
-0.687015, 0.1418045, -0.6046041, 1, 0, 0, 1, 1,
-0.6856499, -0.7798488, -2.624331, 0, 0, 0, 1, 1,
-0.6835127, 2.171837, -1.692803, 0, 0, 0, 1, 1,
-0.6802981, -0.4017637, -0.6275069, 0, 0, 0, 1, 1,
-0.67608, -0.9413264, -1.389513, 0, 0, 0, 1, 1,
-0.6755619, 0.3420016, -0.7111215, 0, 0, 0, 1, 1,
-0.6714307, 0.09754933, -0.8324789, 0, 0, 0, 1, 1,
-0.6706242, 0.4398763, 0.4446851, 0, 0, 0, 1, 1,
-0.6687956, 1.487971, 0.3238004, 1, 1, 1, 1, 1,
-0.6606214, -0.1510647, -2.375537, 1, 1, 1, 1, 1,
-0.6605181, 0.02648841, -2.556335, 1, 1, 1, 1, 1,
-0.6566547, 0.8334343, -1.593786, 1, 1, 1, 1, 1,
-0.6544335, -1.106607, -2.699489, 1, 1, 1, 1, 1,
-0.6515424, 0.5233494, 0.1213634, 1, 1, 1, 1, 1,
-0.6493284, 0.2376473, -1.3751, 1, 1, 1, 1, 1,
-0.6492838, 0.6347939, -1.725353, 1, 1, 1, 1, 1,
-0.6480914, 2.267021, 0.3514819, 1, 1, 1, 1, 1,
-0.6443575, 0.002193375, -3.114959, 1, 1, 1, 1, 1,
-0.6420089, -0.2387633, -2.256463, 1, 1, 1, 1, 1,
-0.6404619, 0.7746521, -0.2089914, 1, 1, 1, 1, 1,
-0.6375073, 1.766511, 1.255334, 1, 1, 1, 1, 1,
-0.6368985, 1.088851, -0.5982224, 1, 1, 1, 1, 1,
-0.6306663, 0.2056475, 0.0827266, 1, 1, 1, 1, 1,
-0.6291514, 0.2939239, -0.1857299, 0, 0, 1, 1, 1,
-0.6274949, -0.5963243, -2.092572, 1, 0, 0, 1, 1,
-0.6205683, -0.009399933, -2.060334, 1, 0, 0, 1, 1,
-0.6122679, -0.6187854, -2.884106, 1, 0, 0, 1, 1,
-0.6086214, 1.033814, 0.6418445, 1, 0, 0, 1, 1,
-0.6079434, -0.3389068, -1.61056, 1, 0, 0, 1, 1,
-0.6065989, 1.401742, -0.2490728, 0, 0, 0, 1, 1,
-0.5987886, -0.4082617, -1.734863, 0, 0, 0, 1, 1,
-0.5921193, 0.2435966, -1.827239, 0, 0, 0, 1, 1,
-0.5900306, -0.1475592, -2.804927, 0, 0, 0, 1, 1,
-0.5897695, 0.5583355, -1.538784, 0, 0, 0, 1, 1,
-0.5875197, 2.264528, -1.68587, 0, 0, 0, 1, 1,
-0.5790955, 0.3798642, -0.3838099, 0, 0, 0, 1, 1,
-0.5784362, 0.004272978, -3.217345, 1, 1, 1, 1, 1,
-0.5760269, -0.403553, -1.927304, 1, 1, 1, 1, 1,
-0.5729536, 1.071215, -0.1252116, 1, 1, 1, 1, 1,
-0.5726573, 0.4840266, -1.005672, 1, 1, 1, 1, 1,
-0.5707178, -2.039096, -2.16677, 1, 1, 1, 1, 1,
-0.5699829, 0.7602118, -0.7909468, 1, 1, 1, 1, 1,
-0.5697235, -0.9476789, -3.749457, 1, 1, 1, 1, 1,
-0.5693696, 1.911844, -0.5593402, 1, 1, 1, 1, 1,
-0.5680124, 0.2962294, -1.742309, 1, 1, 1, 1, 1,
-0.5672427, -0.3810343, -1.218809, 1, 1, 1, 1, 1,
-0.5655261, -1.200779, -1.78521, 1, 1, 1, 1, 1,
-0.5652477, -0.3723292, -3.249877, 1, 1, 1, 1, 1,
-0.5627728, 0.2018237, -2.74751, 1, 1, 1, 1, 1,
-0.5590115, 1.005015, -0.700255, 1, 1, 1, 1, 1,
-0.557227, -0.4463821, -1.809234, 1, 1, 1, 1, 1,
-0.5569021, 0.4827213, -0.7338242, 0, 0, 1, 1, 1,
-0.5528211, -1.140388, -2.21532, 1, 0, 0, 1, 1,
-0.5482976, 1.251977, -0.97179, 1, 0, 0, 1, 1,
-0.5466535, 0.9842695, 0.9595493, 1, 0, 0, 1, 1,
-0.5457069, -0.6012288, -2.248407, 1, 0, 0, 1, 1,
-0.5433913, 0.2793384, -2.583429, 1, 0, 0, 1, 1,
-0.5405083, 1.496882, 0.6161768, 0, 0, 0, 1, 1,
-0.5403827, 1.431004, -0.9270849, 0, 0, 0, 1, 1,
-0.5386049, 0.3586252, 0.1135119, 0, 0, 0, 1, 1,
-0.5372176, -0.03639935, -2.767454, 0, 0, 0, 1, 1,
-0.5346876, -0.0444193, -1.042002, 0, 0, 0, 1, 1,
-0.5237864, 1.516279, -1.043231, 0, 0, 0, 1, 1,
-0.5226106, -0.3382837, -3.945367, 0, 0, 0, 1, 1,
-0.5115364, -0.7052284, -1.514228, 1, 1, 1, 1, 1,
-0.5098231, 0.7956364, -0.3459635, 1, 1, 1, 1, 1,
-0.5071794, -0.7299846, -1.241758, 1, 1, 1, 1, 1,
-0.5063165, -0.2196213, -2.843554, 1, 1, 1, 1, 1,
-0.5030985, 1.784938, -0.1120016, 1, 1, 1, 1, 1,
-0.4959525, 1.101522, 0.9099599, 1, 1, 1, 1, 1,
-0.4951506, -0.1980486, -1.948554, 1, 1, 1, 1, 1,
-0.4934905, 0.5066331, -0.600866, 1, 1, 1, 1, 1,
-0.486878, 1.184087, 1.929255, 1, 1, 1, 1, 1,
-0.4864747, -0.4470313, -3.321722, 1, 1, 1, 1, 1,
-0.4760355, -0.1376676, -1.913977, 1, 1, 1, 1, 1,
-0.4730701, 0.4347272, -0.8501266, 1, 1, 1, 1, 1,
-0.4725828, -0.0990271, 0.3975736, 1, 1, 1, 1, 1,
-0.4711338, 1.442582, 0.5296192, 1, 1, 1, 1, 1,
-0.4694801, -1.130612, -4.293724, 1, 1, 1, 1, 1,
-0.4693249, 0.9849585, -0.5003396, 0, 0, 1, 1, 1,
-0.4688586, 0.1189265, -0.7784383, 1, 0, 0, 1, 1,
-0.4661096, -1.193971, -3.52696, 1, 0, 0, 1, 1,
-0.4660127, -0.649967, -2.754566, 1, 0, 0, 1, 1,
-0.4654563, 1.079881, 0.6298734, 1, 0, 0, 1, 1,
-0.4636503, -0.1960523, -2.405802, 1, 0, 0, 1, 1,
-0.4574629, 0.7997975, 0.5755774, 0, 0, 0, 1, 1,
-0.4554446, -0.7958128, -2.045341, 0, 0, 0, 1, 1,
-0.4524062, -0.1952735, -1.580845, 0, 0, 0, 1, 1,
-0.4412483, 1.388807, -0.6505255, 0, 0, 0, 1, 1,
-0.4398651, 0.5369102, -1.171421, 0, 0, 0, 1, 1,
-0.4378728, -0.009379872, -0.8091432, 0, 0, 0, 1, 1,
-0.4346717, 1.812216, 0.2595092, 0, 0, 0, 1, 1,
-0.4326651, -1.363118, -3.756104, 1, 1, 1, 1, 1,
-0.4316106, 0.6047663, -1.601054, 1, 1, 1, 1, 1,
-0.4313993, 1.302638, 1.408138, 1, 1, 1, 1, 1,
-0.430912, -0.7380513, -3.755935, 1, 1, 1, 1, 1,
-0.4290546, -0.8502341, -3.700968, 1, 1, 1, 1, 1,
-0.4277636, 0.8130535, -1.037966, 1, 1, 1, 1, 1,
-0.4254177, -0.463313, -2.345575, 1, 1, 1, 1, 1,
-0.4231466, -1.319643, -3.595416, 1, 1, 1, 1, 1,
-0.4132466, -1.35416, -2.271052, 1, 1, 1, 1, 1,
-0.4117481, -1.141567, -3.044898, 1, 1, 1, 1, 1,
-0.4065985, -0.5727937, -1.451531, 1, 1, 1, 1, 1,
-0.4012908, -0.9808678, -2.728118, 1, 1, 1, 1, 1,
-0.3977804, 1.867052, 0.5015556, 1, 1, 1, 1, 1,
-0.3923439, -0.005998521, -1.429283, 1, 1, 1, 1, 1,
-0.3917321, -0.8935378, -3.266413, 1, 1, 1, 1, 1,
-0.3767936, 0.1660587, 0.08174476, 0, 0, 1, 1, 1,
-0.3729943, -1.009195, -1.096786, 1, 0, 0, 1, 1,
-0.3704314, 0.465654, -0.2276914, 1, 0, 0, 1, 1,
-0.3677445, 0.8480569, 0.4035771, 1, 0, 0, 1, 1,
-0.3648006, -0.6661618, -2.106685, 1, 0, 0, 1, 1,
-0.3593965, 0.1175712, -2.432913, 1, 0, 0, 1, 1,
-0.3591559, -1.003656, -3.51609, 0, 0, 0, 1, 1,
-0.3525251, -0.2122859, -1.131231, 0, 0, 0, 1, 1,
-0.3516555, 0.05702728, -0.8166797, 0, 0, 0, 1, 1,
-0.3512574, 1.365673, -0.09417191, 0, 0, 0, 1, 1,
-0.3501356, 1.110775, -0.2282939, 0, 0, 0, 1, 1,
-0.3497947, -0.5591817, -1.743844, 0, 0, 0, 1, 1,
-0.3463513, 1.024298, 0.7132146, 0, 0, 0, 1, 1,
-0.3459615, 1.361577, -0.4341963, 1, 1, 1, 1, 1,
-0.3458222, -1.194604, -2.065064, 1, 1, 1, 1, 1,
-0.3440033, 0.6487365, -0.6119513, 1, 1, 1, 1, 1,
-0.3421969, 0.5170994, -1.351684, 1, 1, 1, 1, 1,
-0.3420416, 0.5404136, -1.367378, 1, 1, 1, 1, 1,
-0.3407376, -1.020809, -1.752652, 1, 1, 1, 1, 1,
-0.3241358, -0.4706376, -2.762717, 1, 1, 1, 1, 1,
-0.3237221, 1.835451, 0.7684078, 1, 1, 1, 1, 1,
-0.3227359, 0.3485057, -2.571516, 1, 1, 1, 1, 1,
-0.3189966, -1.002344, -2.424333, 1, 1, 1, 1, 1,
-0.3168215, -1.331161, -4.537933, 1, 1, 1, 1, 1,
-0.30784, -2.613187, -2.085135, 1, 1, 1, 1, 1,
-0.3063329, -1.258417, -3.901158, 1, 1, 1, 1, 1,
-0.3032677, 0.2212721, -1.592704, 1, 1, 1, 1, 1,
-0.3023474, 0.7554977, -1.629374, 1, 1, 1, 1, 1,
-0.3016666, 0.06080559, -1.21737, 0, 0, 1, 1, 1,
-0.2987847, -1.141339, -2.22436, 1, 0, 0, 1, 1,
-0.2965873, -0.3199284, -3.962014, 1, 0, 0, 1, 1,
-0.296158, -1.442272, -4.379741, 1, 0, 0, 1, 1,
-0.291365, 0.742682, -0.6039532, 1, 0, 0, 1, 1,
-0.2887851, -1.181962, -4.10604, 1, 0, 0, 1, 1,
-0.2870367, -0.2174068, -1.62114, 0, 0, 0, 1, 1,
-0.2809069, 1.380792, -1.471473, 0, 0, 0, 1, 1,
-0.2784689, 0.7012609, -0.3157443, 0, 0, 0, 1, 1,
-0.269327, 0.01211227, -1.542176, 0, 0, 0, 1, 1,
-0.2649539, 1.293188, 0.1113177, 0, 0, 0, 1, 1,
-0.2577345, 0.6728796, -0.8164893, 0, 0, 0, 1, 1,
-0.2575621, -0.1373275, -2.020454, 0, 0, 0, 1, 1,
-0.2564643, -0.4603437, -2.663409, 1, 1, 1, 1, 1,
-0.2546842, -0.3050942, -3.903998, 1, 1, 1, 1, 1,
-0.2525829, 1.797912, -0.06828357, 1, 1, 1, 1, 1,
-0.2427222, 1.170527, -0.8731027, 1, 1, 1, 1, 1,
-0.2399481, -0.5339344, -1.785786, 1, 1, 1, 1, 1,
-0.2381147, -0.09244308, -2.224483, 1, 1, 1, 1, 1,
-0.2342821, -0.5438015, -2.584725, 1, 1, 1, 1, 1,
-0.2323115, -2.010276, -3.829128, 1, 1, 1, 1, 1,
-0.2322365, 0.314026, 1.03091, 1, 1, 1, 1, 1,
-0.2290739, -0.6401354, -3.635412, 1, 1, 1, 1, 1,
-0.2272106, -0.7911682, -2.948925, 1, 1, 1, 1, 1,
-0.2232316, -0.5424225, -3.33953, 1, 1, 1, 1, 1,
-0.2166968, -0.5048, -1.996932, 1, 1, 1, 1, 1,
-0.2138256, 0.03605586, -1.509258, 1, 1, 1, 1, 1,
-0.213807, -0.7485664, -3.298942, 1, 1, 1, 1, 1,
-0.2125603, -0.07878487, -2.715461, 0, 0, 1, 1, 1,
-0.2091829, 0.3458683, -0.1564406, 1, 0, 0, 1, 1,
-0.2090018, -0.9290736, -2.253033, 1, 0, 0, 1, 1,
-0.2055757, 1.373706, -1.354755, 1, 0, 0, 1, 1,
-0.2052642, -0.1049339, -3.335484, 1, 0, 0, 1, 1,
-0.2041001, 0.4290294, -0.3234863, 1, 0, 0, 1, 1,
-0.2011137, -0.5962441, -3.038594, 0, 0, 0, 1, 1,
-0.1975751, 1.063263, 0.405012, 0, 0, 0, 1, 1,
-0.1955893, 0.853628, 1.139423, 0, 0, 0, 1, 1,
-0.1953948, -0.4655159, -1.023908, 0, 0, 0, 1, 1,
-0.1946498, -2.956245, -3.902417, 0, 0, 0, 1, 1,
-0.1933611, 0.6519806, -0.1945822, 0, 0, 0, 1, 1,
-0.191812, -0.9166774, -1.667552, 0, 0, 0, 1, 1,
-0.1911808, 0.5525171, -0.001300954, 1, 1, 1, 1, 1,
-0.1901876, -1.474471, -1.502074, 1, 1, 1, 1, 1,
-0.1887649, -1.102452, -1.968841, 1, 1, 1, 1, 1,
-0.1845497, -1.27897, -2.593714, 1, 1, 1, 1, 1,
-0.1832462, -0.2159269, -2.772729, 1, 1, 1, 1, 1,
-0.1810639, 0.9317554, 0.08228424, 1, 1, 1, 1, 1,
-0.1798858, -0.008172236, -2.001427, 1, 1, 1, 1, 1,
-0.1790443, 0.5571475, 1.120222, 1, 1, 1, 1, 1,
-0.1772666, -0.5862583, -3.71172, 1, 1, 1, 1, 1,
-0.1706195, 2.006447, 0.06959716, 1, 1, 1, 1, 1,
-0.165612, 0.659571, 0.4026534, 1, 1, 1, 1, 1,
-0.1595031, 0.962609, -0.7288295, 1, 1, 1, 1, 1,
-0.1579538, 0.2073315, -0.3070879, 1, 1, 1, 1, 1,
-0.1526434, -0.7773091, -1.80477, 1, 1, 1, 1, 1,
-0.1491767, 1.153974, -1.254268, 1, 1, 1, 1, 1,
-0.1459098, -0.9283744, -2.777134, 0, 0, 1, 1, 1,
-0.1455109, -2.03427, -2.849275, 1, 0, 0, 1, 1,
-0.1410109, 0.5031016, -0.9257107, 1, 0, 0, 1, 1,
-0.1403096, -0.3863682, -2.609077, 1, 0, 0, 1, 1,
-0.1329374, 0.01930097, -4.003381, 1, 0, 0, 1, 1,
-0.1310063, -0.1560277, 0.2331889, 1, 0, 0, 1, 1,
-0.1277681, -0.1300029, -2.020965, 0, 0, 0, 1, 1,
-0.1253601, -0.4323388, -2.621579, 0, 0, 0, 1, 1,
-0.120805, 0.1634883, -0.711011, 0, 0, 0, 1, 1,
-0.1140831, -0.1296717, -3.309659, 0, 0, 0, 1, 1,
-0.1137386, -0.6913696, -1.96567, 0, 0, 0, 1, 1,
-0.1077754, 0.5551084, -0.4358295, 0, 0, 0, 1, 1,
-0.1056905, -0.5837749, -3.130887, 0, 0, 0, 1, 1,
-0.0994153, 0.6445591, 0.3211083, 1, 1, 1, 1, 1,
-0.09778329, 0.3719657, -1.473485, 1, 1, 1, 1, 1,
-0.09582832, -0.4203998, -3.48856, 1, 1, 1, 1, 1,
-0.09326304, 1.449662, -0.05147104, 1, 1, 1, 1, 1,
-0.08705614, 0.05551737, -1.827224, 1, 1, 1, 1, 1,
-0.08418907, -0.9925596, -2.477847, 1, 1, 1, 1, 1,
-0.08342795, -0.1587335, -4.339915, 1, 1, 1, 1, 1,
-0.08172017, 0.09115466, -1.092291, 1, 1, 1, 1, 1,
-0.0725126, 0.2846346, 0.4984971, 1, 1, 1, 1, 1,
-0.07157181, -1.012278, -3.379124, 1, 1, 1, 1, 1,
-0.06889281, -1.043678, -2.240273, 1, 1, 1, 1, 1,
-0.06829581, -0.4854048, -3.02288, 1, 1, 1, 1, 1,
-0.06523696, -0.6300782, -2.344591, 1, 1, 1, 1, 1,
-0.0638996, -0.05948016, -1.928191, 1, 1, 1, 1, 1,
-0.05736784, -0.6577249, -2.41855, 1, 1, 1, 1, 1,
-0.05729989, -1.052631, -3.732289, 0, 0, 1, 1, 1,
-0.0564793, -1.272411, -3.988459, 1, 0, 0, 1, 1,
-0.05412209, 0.6366758, 0.7441946, 1, 0, 0, 1, 1,
-0.05050193, 0.9234059, -2.149322, 1, 0, 0, 1, 1,
-0.05023577, -2.202603, -3.381453, 1, 0, 0, 1, 1,
-0.04359217, -0.1725811, -3.089243, 1, 0, 0, 1, 1,
-0.04199121, -0.7493042, -4.581715, 0, 0, 0, 1, 1,
-0.04143966, -0.01696096, -0.175337, 0, 0, 0, 1, 1,
-0.03290015, -0.4622932, -2.771944, 0, 0, 0, 1, 1,
-0.03237791, -0.8619512, -1.912361, 0, 0, 0, 1, 1,
-0.0321459, -0.1879315, -5.182639, 0, 0, 0, 1, 1,
-0.0320073, 1.31333, 0.3943764, 0, 0, 0, 1, 1,
-0.03127933, -0.02059068, -1.492813, 0, 0, 0, 1, 1,
-0.03059531, 1.031776, -0.7723933, 1, 1, 1, 1, 1,
-0.02338558, -0.8084667, -2.236981, 1, 1, 1, 1, 1,
-0.01853647, 0.4740078, 1.397935, 1, 1, 1, 1, 1,
-0.01602867, -0.2725688, -3.406789, 1, 1, 1, 1, 1,
-0.01445348, 0.9397085, 0.4518409, 1, 1, 1, 1, 1,
-0.01439191, -1.366184, -6.279127, 1, 1, 1, 1, 1,
-0.01337628, -0.1464451, -3.900281, 1, 1, 1, 1, 1,
-0.01071714, -0.1254381, -2.283541, 1, 1, 1, 1, 1,
-0.01025936, 1.420754, -0.4132664, 1, 1, 1, 1, 1,
-0.007081473, 0.2421132, 2.10614, 1, 1, 1, 1, 1,
-1.031049e-05, -2.050207, -4.081229, 1, 1, 1, 1, 1,
0.003182665, -1.100316, 1.095624, 1, 1, 1, 1, 1,
0.003922924, 0.3336379, -0.8360202, 1, 1, 1, 1, 1,
0.004732116, 0.8039446, 1.829352, 1, 1, 1, 1, 1,
0.005250632, -0.07759193, 3.257892, 1, 1, 1, 1, 1,
0.005863109, -2.441916, 4.233831, 0, 0, 1, 1, 1,
0.006508233, 0.8248747, 0.7943155, 1, 0, 0, 1, 1,
0.009196133, -2.110492, 3.081187, 1, 0, 0, 1, 1,
0.01147204, -0.7393411, 2.388757, 1, 0, 0, 1, 1,
0.01775768, 1.174833, 1.895447, 1, 0, 0, 1, 1,
0.01803468, -0.7954502, 0.4613551, 1, 0, 0, 1, 1,
0.02037217, -1.339261, 3.414212, 0, 0, 0, 1, 1,
0.023932, 1.488344, 1.22083, 0, 0, 0, 1, 1,
0.02543812, -0.02995227, 1.914628, 0, 0, 0, 1, 1,
0.02641521, -0.5510231, 3.186125, 0, 0, 0, 1, 1,
0.02688393, -1.5345, 4.638667, 0, 0, 0, 1, 1,
0.03293623, -0.9826553, 3.282525, 0, 0, 0, 1, 1,
0.05409003, -0.4323408, 2.944056, 0, 0, 0, 1, 1,
0.05784669, -0.1229071, 3.113992, 1, 1, 1, 1, 1,
0.06003855, -0.6092761, 4.695206, 1, 1, 1, 1, 1,
0.06072665, 0.2478354, -1.323439, 1, 1, 1, 1, 1,
0.06161796, 0.546469, 0.9516641, 1, 1, 1, 1, 1,
0.0619044, 0.05345931, 0.9450371, 1, 1, 1, 1, 1,
0.0635054, -0.06051645, 2.897124, 1, 1, 1, 1, 1,
0.06406779, 2.568578, 0.1985953, 1, 1, 1, 1, 1,
0.06492517, -0.6906204, 1.665323, 1, 1, 1, 1, 1,
0.06889994, 1.985536, 1.436098, 1, 1, 1, 1, 1,
0.06945287, -1.268042, 4.668551, 1, 1, 1, 1, 1,
0.07103294, -0.574065, 2.612159, 1, 1, 1, 1, 1,
0.07113016, 0.01300438, 0.8440017, 1, 1, 1, 1, 1,
0.07118267, -0.2614031, 3.328435, 1, 1, 1, 1, 1,
0.07183675, -1.165405, 2.809707, 1, 1, 1, 1, 1,
0.08442643, -0.657871, 3.855391, 1, 1, 1, 1, 1,
0.0854782, 1.261362, 1.689802, 0, 0, 1, 1, 1,
0.08564335, 0.6685003, -0.5860088, 1, 0, 0, 1, 1,
0.09033588, -0.454789, 4.074223, 1, 0, 0, 1, 1,
0.09045769, -0.9500378, 3.212624, 1, 0, 0, 1, 1,
0.09433732, 1.033579, -0.9005056, 1, 0, 0, 1, 1,
0.09801593, 0.4713328, 0.1364502, 1, 0, 0, 1, 1,
0.1014694, -0.1776696, 1.517876, 0, 0, 0, 1, 1,
0.1029235, 0.7512336, -0.5265757, 0, 0, 0, 1, 1,
0.1044275, 0.6720991, -0.3518839, 0, 0, 0, 1, 1,
0.1053749, -1.405328, 1.970142, 0, 0, 0, 1, 1,
0.1124486, -0.5380039, 4.332732, 0, 0, 0, 1, 1,
0.1164571, -0.1900903, 1.919894, 0, 0, 0, 1, 1,
0.1166238, -1.362627, 4.157944, 0, 0, 0, 1, 1,
0.1191432, 0.9027984, 0.43578, 1, 1, 1, 1, 1,
0.1201402, 0.6158452, 0.1442004, 1, 1, 1, 1, 1,
0.1212459, 0.8829597, 0.7220292, 1, 1, 1, 1, 1,
0.1248005, -0.6649482, 2.075078, 1, 1, 1, 1, 1,
0.1276619, -0.2129626, 2.172181, 1, 1, 1, 1, 1,
0.130144, 0.6158567, 1.520841, 1, 1, 1, 1, 1,
0.1310923, -0.5355237, 3.337422, 1, 1, 1, 1, 1,
0.1326145, 0.04627502, 0.498404, 1, 1, 1, 1, 1,
0.1343452, 0.6301876, -1.179099, 1, 1, 1, 1, 1,
0.1344375, -2.396049, 2.961646, 1, 1, 1, 1, 1,
0.1365547, -1.032157, 2.094127, 1, 1, 1, 1, 1,
0.138329, -1.079939, 3.182037, 1, 1, 1, 1, 1,
0.1407837, -0.2523136, 2.591851, 1, 1, 1, 1, 1,
0.1410803, 0.8758994, -0.3781927, 1, 1, 1, 1, 1,
0.1457666, -0.5190948, 3.807116, 1, 1, 1, 1, 1,
0.1465796, 0.8708382, -0.3304581, 0, 0, 1, 1, 1,
0.1474885, -2.372876, 4.135569, 1, 0, 0, 1, 1,
0.15145, -0.8022045, 5.018062, 1, 0, 0, 1, 1,
0.1521769, 2.013539, -0.3141607, 1, 0, 0, 1, 1,
0.1546189, 0.4103081, -0.001915714, 1, 0, 0, 1, 1,
0.1576124, -0.4927867, 3.927863, 1, 0, 0, 1, 1,
0.170765, 0.4228413, -2.388347, 0, 0, 0, 1, 1,
0.1717527, -0.8331713, 4.232159, 0, 0, 0, 1, 1,
0.1734564, -1.514781, 1.996878, 0, 0, 0, 1, 1,
0.1746132, -0.1701062, 0.9101339, 0, 0, 0, 1, 1,
0.1747332, -1.725752, 3.521527, 0, 0, 0, 1, 1,
0.1773848, -0.9150118, 3.193622, 0, 0, 0, 1, 1,
0.1780013, 0.7397626, -1.7017, 0, 0, 0, 1, 1,
0.1784407, -0.06430643, 3.554169, 1, 1, 1, 1, 1,
0.1799483, 0.01462399, 1.773718, 1, 1, 1, 1, 1,
0.1852781, -0.749832, 1.477988, 1, 1, 1, 1, 1,
0.1857313, 0.9150026, 2.569569, 1, 1, 1, 1, 1,
0.1866322, -2.231185, 3.778975, 1, 1, 1, 1, 1,
0.190023, 0.679436, 0.1672461, 1, 1, 1, 1, 1,
0.1915384, -1.267347, 2.043405, 1, 1, 1, 1, 1,
0.1958118, 0.45618, 0.2669148, 1, 1, 1, 1, 1,
0.1974009, -0.9101092, 2.374177, 1, 1, 1, 1, 1,
0.1975102, 0.9482193, -0.8621424, 1, 1, 1, 1, 1,
0.2026873, 0.4610912, 0.2227018, 1, 1, 1, 1, 1,
0.2027574, 0.5687701, 1.517694, 1, 1, 1, 1, 1,
0.2068846, -0.7730331, 1.945971, 1, 1, 1, 1, 1,
0.2081756, 0.323321, 0.3820499, 1, 1, 1, 1, 1,
0.2083111, -0.4753278, 2.521853, 1, 1, 1, 1, 1,
0.2093046, -0.2620603, 3.079181, 0, 0, 1, 1, 1,
0.2108402, -0.1165366, 2.102381, 1, 0, 0, 1, 1,
0.2181667, 0.1736962, 2.198125, 1, 0, 0, 1, 1,
0.2212113, -1.533769, 3.395819, 1, 0, 0, 1, 1,
0.2229588, 0.1655197, 0.9341628, 1, 0, 0, 1, 1,
0.2232606, -0.3487338, 3.774217, 1, 0, 0, 1, 1,
0.2332843, -0.5407588, 3.276967, 0, 0, 0, 1, 1,
0.2364078, -0.8733851, 1.990544, 0, 0, 0, 1, 1,
0.2364102, 0.5305824, 2.958843, 0, 0, 0, 1, 1,
0.2384346, -1.794863, 2.383776, 0, 0, 0, 1, 1,
0.2412983, -0.1802264, 2.632418, 0, 0, 0, 1, 1,
0.2419178, 0.7823449, -0.8371736, 0, 0, 0, 1, 1,
0.2440437, -1.611071, 2.73969, 0, 0, 0, 1, 1,
0.2466787, -1.729899, 1.659548, 1, 1, 1, 1, 1,
0.2531777, 1.302633, -0.6672028, 1, 1, 1, 1, 1,
0.2619531, 1.405211, -0.04754394, 1, 1, 1, 1, 1,
0.2626147, -0.4595457, 1.544985, 1, 1, 1, 1, 1,
0.2659608, -0.5992092, 3.927677, 1, 1, 1, 1, 1,
0.2661929, 0.6929078, -0.5488774, 1, 1, 1, 1, 1,
0.2677097, 1.327713, 0.1608897, 1, 1, 1, 1, 1,
0.2698934, -0.931114, 1.904601, 1, 1, 1, 1, 1,
0.2701535, 0.2814173, 1.719416, 1, 1, 1, 1, 1,
0.2703959, -0.5904365, 3.150303, 1, 1, 1, 1, 1,
0.2708218, -1.083455, 2.849794, 1, 1, 1, 1, 1,
0.2721106, 0.8843131, -1.273939, 1, 1, 1, 1, 1,
0.2739847, -1.031272, 3.149603, 1, 1, 1, 1, 1,
0.2774158, 0.7818689, -0.3805608, 1, 1, 1, 1, 1,
0.2839166, 1.24024, -0.5101848, 1, 1, 1, 1, 1,
0.2890588, 0.1356866, 0.9558313, 0, 0, 1, 1, 1,
0.2896595, 2.083501, 1.111976, 1, 0, 0, 1, 1,
0.2901944, 0.9426544, 0.3919451, 1, 0, 0, 1, 1,
0.2905647, -2.306563, 2.319249, 1, 0, 0, 1, 1,
0.3008817, 0.4044085, -1.552139, 1, 0, 0, 1, 1,
0.302875, -0.6982976, 3.182931, 1, 0, 0, 1, 1,
0.3078024, 0.3389439, 1.417814, 0, 0, 0, 1, 1,
0.3084358, 0.0475518, 1.333303, 0, 0, 0, 1, 1,
0.3137047, 0.5342135, -0.1961253, 0, 0, 0, 1, 1,
0.3155495, 0.3397912, 0.9688669, 0, 0, 0, 1, 1,
0.3253115, -0.4136701, 2.118384, 0, 0, 0, 1, 1,
0.327227, 0.2192471, 1.221291, 0, 0, 0, 1, 1,
0.3278707, 2.699342, 0.3326197, 0, 0, 0, 1, 1,
0.3301851, -0.5124602, 3.478335, 1, 1, 1, 1, 1,
0.3316081, 1.433796, 0.1723941, 1, 1, 1, 1, 1,
0.3357107, 1.390717, -0.1080879, 1, 1, 1, 1, 1,
0.3395168, -1.031937, 1.928961, 1, 1, 1, 1, 1,
0.3443896, 0.9423858, 1.24314, 1, 1, 1, 1, 1,
0.3469038, -0.8727581, 3.36107, 1, 1, 1, 1, 1,
0.3482492, 1.058656, 0.7604089, 1, 1, 1, 1, 1,
0.3540101, -0.4228729, 3.017312, 1, 1, 1, 1, 1,
0.356366, 1.105408, -0.06764285, 1, 1, 1, 1, 1,
0.3565063, -1.303229, 1.806815, 1, 1, 1, 1, 1,
0.3569843, -1.068204, 2.353984, 1, 1, 1, 1, 1,
0.3570841, -0.979506, 2.494294, 1, 1, 1, 1, 1,
0.3618615, -1.05571, 3.129309, 1, 1, 1, 1, 1,
0.3625061, 0.9095479, 1.016034, 1, 1, 1, 1, 1,
0.3663816, 0.6052369, 2.54498, 1, 1, 1, 1, 1,
0.367226, -0.3582928, 5.045306, 0, 0, 1, 1, 1,
0.370804, 1.519597, 1.73398, 1, 0, 0, 1, 1,
0.3754217, 0.0669146, 0.1170297, 1, 0, 0, 1, 1,
0.3816512, 0.02071612, 2.037812, 1, 0, 0, 1, 1,
0.3853121, 0.4043466, -0.5117763, 1, 0, 0, 1, 1,
0.3879466, -0.1383643, 2.419655, 1, 0, 0, 1, 1,
0.3987249, -0.1961768, 1.320413, 0, 0, 0, 1, 1,
0.4039639, 0.6520354, 0.6653448, 0, 0, 0, 1, 1,
0.4057403, -0.473471, 1.029136, 0, 0, 0, 1, 1,
0.4067952, -0.5908353, 2.212675, 0, 0, 0, 1, 1,
0.4080403, 1.671331, 0.8197073, 0, 0, 0, 1, 1,
0.4125026, -0.2074125, 1.357101, 0, 0, 0, 1, 1,
0.4158349, -1.365521, 1.883971, 0, 0, 0, 1, 1,
0.415982, 1.311523, 2.190075, 1, 1, 1, 1, 1,
0.4204477, 1.263196, 0.8438151, 1, 1, 1, 1, 1,
0.4222201, -0.7320701, 3.256132, 1, 1, 1, 1, 1,
0.4245418, -0.9896836, 2.275156, 1, 1, 1, 1, 1,
0.4271286, 1.019452, 0.5407459, 1, 1, 1, 1, 1,
0.4291832, 1.350679, 0.7641556, 1, 1, 1, 1, 1,
0.438081, -0.7402796, 3.035095, 1, 1, 1, 1, 1,
0.4380984, 0.1740925, 1.294689, 1, 1, 1, 1, 1,
0.4418813, 0.6154097, 0.3138715, 1, 1, 1, 1, 1,
0.4445732, 1.001754, 1.539666, 1, 1, 1, 1, 1,
0.4470435, 0.8105859, 0.7817335, 1, 1, 1, 1, 1,
0.4498173, 1.05291, 1.067451, 1, 1, 1, 1, 1,
0.4559571, -1.714243, 0.9084253, 1, 1, 1, 1, 1,
0.4575395, -0.8304027, 2.777029, 1, 1, 1, 1, 1,
0.4592882, 1.077721, 0.781512, 1, 1, 1, 1, 1,
0.4648557, 1.071545, 0.7252511, 0, 0, 1, 1, 1,
0.4675526, -0.09857074, 3.356789, 1, 0, 0, 1, 1,
0.4712371, 0.03332336, 0.1984243, 1, 0, 0, 1, 1,
0.4737766, 1.251778, 0.6422734, 1, 0, 0, 1, 1,
0.4749942, 0.1273417, 1.285942, 1, 0, 0, 1, 1,
0.4755472, 0.4702705, 0.9731374, 1, 0, 0, 1, 1,
0.4796597, 0.5392216, 1.258837, 0, 0, 0, 1, 1,
0.483747, 0.2088598, 1.74092, 0, 0, 0, 1, 1,
0.4902245, -1.692312, 2.451895, 0, 0, 0, 1, 1,
0.4909688, 0.2834486, 1.607144, 0, 0, 0, 1, 1,
0.4923354, -0.7589912, 2.521129, 0, 0, 0, 1, 1,
0.4925759, 0.9911088, -1.204785, 0, 0, 0, 1, 1,
0.4953308, -0.3127046, 2.362907, 0, 0, 0, 1, 1,
0.497544, -2.183692, 1.647929, 1, 1, 1, 1, 1,
0.4985245, 0.239928, -0.02931012, 1, 1, 1, 1, 1,
0.4998298, -2.023247, 0.1407018, 1, 1, 1, 1, 1,
0.5013477, 0.356042, 0.1958145, 1, 1, 1, 1, 1,
0.504057, -1.376191, 2.885648, 1, 1, 1, 1, 1,
0.5061552, -1.169839, 1.912453, 1, 1, 1, 1, 1,
0.5093723, 0.133132, 2.122466, 1, 1, 1, 1, 1,
0.5101255, -1.373044, 2.340973, 1, 1, 1, 1, 1,
0.5102252, 1.260308, 0.3043728, 1, 1, 1, 1, 1,
0.5156434, -0.7628393, 2.097224, 1, 1, 1, 1, 1,
0.5166482, 1.781649, -3.157647, 1, 1, 1, 1, 1,
0.5188021, 0.06010896, 3.177732, 1, 1, 1, 1, 1,
0.5212781, -0.1442853, 1.709821, 1, 1, 1, 1, 1,
0.5252884, 0.3010938, 1.895818, 1, 1, 1, 1, 1,
0.5265705, -1.128273, 2.683547, 1, 1, 1, 1, 1,
0.5343283, -0.6689398, 3.157187, 0, 0, 1, 1, 1,
0.5454378, 0.6283162, 1.244123, 1, 0, 0, 1, 1,
0.5606294, 0.4060459, 1.919083, 1, 0, 0, 1, 1,
0.5628657, 0.1031976, -0.2553862, 1, 0, 0, 1, 1,
0.5641047, 0.2877952, 1.96335, 1, 0, 0, 1, 1,
0.5720648, -1.609843, 1.176422, 1, 0, 0, 1, 1,
0.578053, -0.1413265, 1.002945, 0, 0, 0, 1, 1,
0.5851816, 0.9743383, -0.5100365, 0, 0, 0, 1, 1,
0.5859145, 0.07621787, 1.814132, 0, 0, 0, 1, 1,
0.5894705, 0.1675588, 1.110537, 0, 0, 0, 1, 1,
0.5914598, -0.01209864, 2.773934, 0, 0, 0, 1, 1,
0.5926151, -2.3459, 4.189417, 0, 0, 0, 1, 1,
0.5955988, -0.9017173, 3.018971, 0, 0, 0, 1, 1,
0.5963421, 0.8025807, 0.05045894, 1, 1, 1, 1, 1,
0.6004394, 1.322441, 1.145407, 1, 1, 1, 1, 1,
0.604772, 0.06344779, 1.374898, 1, 1, 1, 1, 1,
0.6057464, -0.3282659, 3.727721, 1, 1, 1, 1, 1,
0.6094571, 0.8443538, -0.4665463, 1, 1, 1, 1, 1,
0.6138396, -0.5371506, 1.217015, 1, 1, 1, 1, 1,
0.6140622, 0.9694839, 0.6811416, 1, 1, 1, 1, 1,
0.6146882, 0.4096664, -0.1679786, 1, 1, 1, 1, 1,
0.6156857, 0.6144497, 0.3167123, 1, 1, 1, 1, 1,
0.6183097, 1.826489, 0.0171736, 1, 1, 1, 1, 1,
0.6287624, -0.2657302, 3.714651, 1, 1, 1, 1, 1,
0.6293572, -1.906331, 3.423652, 1, 1, 1, 1, 1,
0.6333516, 1.524286, -1.358496, 1, 1, 1, 1, 1,
0.6360393, 0.1790298, 1.120249, 1, 1, 1, 1, 1,
0.6364118, -0.2558118, 0.1960602, 1, 1, 1, 1, 1,
0.6425649, -0.4535052, 2.19165, 0, 0, 1, 1, 1,
0.6427237, -0.6418387, 2.695265, 1, 0, 0, 1, 1,
0.6468376, -0.115095, 0.1894205, 1, 0, 0, 1, 1,
0.6542284, 0.1272045, 1.022115, 1, 0, 0, 1, 1,
0.6554251, 0.877284, 0.5271757, 1, 0, 0, 1, 1,
0.6556758, -0.7953519, 5.024834, 1, 0, 0, 1, 1,
0.6596934, -0.3601438, 1.169875, 0, 0, 0, 1, 1,
0.6617643, 0.4238539, 1.520204, 0, 0, 0, 1, 1,
0.6620725, -1.398992, 3.49655, 0, 0, 0, 1, 1,
0.6644771, 0.5637318, -0.5920019, 0, 0, 0, 1, 1,
0.6681011, -0.6049227, 1.356796, 0, 0, 0, 1, 1,
0.6709145, 1.60853, -0.1458409, 0, 0, 0, 1, 1,
0.6726991, 0.3712811, -0.2139697, 0, 0, 0, 1, 1,
0.67505, -1.221488, 2.976992, 1, 1, 1, 1, 1,
0.6755646, -0.1022695, 2.322801, 1, 1, 1, 1, 1,
0.6756434, 0.4215661, 1.818351, 1, 1, 1, 1, 1,
0.6831384, -0.007677672, 1.347338, 1, 1, 1, 1, 1,
0.6850241, -0.8326579, 4.864879, 1, 1, 1, 1, 1,
0.6935633, -0.104418, 1.515945, 1, 1, 1, 1, 1,
0.6953963, 0.4611028, 0.5580921, 1, 1, 1, 1, 1,
0.6960852, -0.1490105, 0.6254733, 1, 1, 1, 1, 1,
0.6968348, -0.3988308, 2.074123, 1, 1, 1, 1, 1,
0.7038547, 1.493936, 1.055947, 1, 1, 1, 1, 1,
0.70838, -0.391577, 3.408212, 1, 1, 1, 1, 1,
0.7147335, 0.7321433, 3.080729, 1, 1, 1, 1, 1,
0.7147766, -0.4261758, 1.152553, 1, 1, 1, 1, 1,
0.7164227, -1.254358, 1.645604, 1, 1, 1, 1, 1,
0.719065, -1.061074, 2.24668, 1, 1, 1, 1, 1,
0.7247214, -0.05389081, 1.664201, 0, 0, 1, 1, 1,
0.7263004, -0.4308512, 2.902601, 1, 0, 0, 1, 1,
0.7281274, 0.5504744, 1.578679, 1, 0, 0, 1, 1,
0.7281584, -0.785888, 3.214857, 1, 0, 0, 1, 1,
0.729782, -0.5096793, 1.754742, 1, 0, 0, 1, 1,
0.7322571, 1.570691, 0.7565942, 1, 0, 0, 1, 1,
0.7323085, 0.9332408, 0.5878649, 0, 0, 0, 1, 1,
0.7323268, -0.1477883, 3.432697, 0, 0, 0, 1, 1,
0.7337365, 0.530273, 0.290753, 0, 0, 0, 1, 1,
0.7342584, -0.2855682, 2.754151, 0, 0, 0, 1, 1,
0.7350002, -0.5722696, 2.350905, 0, 0, 0, 1, 1,
0.7363582, 0.07389361, 2.35935, 0, 0, 0, 1, 1,
0.737718, -0.4637127, 2.735654, 0, 0, 0, 1, 1,
0.7468087, 1.15188, -1.323974, 1, 1, 1, 1, 1,
0.7491564, -1.693527, 3.016033, 1, 1, 1, 1, 1,
0.7600325, 0.353651, -0.0911298, 1, 1, 1, 1, 1,
0.7628679, -0.03871272, 0.008898444, 1, 1, 1, 1, 1,
0.7649201, -0.7391045, 3.223067, 1, 1, 1, 1, 1,
0.7737414, 1.764814, 1.205995, 1, 1, 1, 1, 1,
0.7808646, -0.8478875, 2.393697, 1, 1, 1, 1, 1,
0.7838994, 0.8912385, 0.7984254, 1, 1, 1, 1, 1,
0.7847425, 0.8073487, 0.8367676, 1, 1, 1, 1, 1,
0.7852992, 1.525176, 1.18537, 1, 1, 1, 1, 1,
0.7869636, -1.411151, 2.827843, 1, 1, 1, 1, 1,
0.7886248, 0.4809846, 2.367041, 1, 1, 1, 1, 1,
0.7911719, -1.276456, 2.610501, 1, 1, 1, 1, 1,
0.7923764, -0.3537893, 1.465907, 1, 1, 1, 1, 1,
0.7947472, 0.7265054, 1.386619, 1, 1, 1, 1, 1,
0.7957336, -0.2066821, 2.286252, 0, 0, 1, 1, 1,
0.8038424, -1.228966, 2.701612, 1, 0, 0, 1, 1,
0.8082357, 0.2185096, 2.537111, 1, 0, 0, 1, 1,
0.8084168, -1.293627, 1.783666, 1, 0, 0, 1, 1,
0.8124986, 0.03933838, 3.544187, 1, 0, 0, 1, 1,
0.8175235, 0.9099874, 0.9664608, 1, 0, 0, 1, 1,
0.8180223, -0.7669025, 3.318922, 0, 0, 0, 1, 1,
0.8267925, 0.334352, -0.08347636, 0, 0, 0, 1, 1,
0.8300776, 0.844383, 0.8801521, 0, 0, 0, 1, 1,
0.8308935, -0.9311704, 2.522874, 0, 0, 0, 1, 1,
0.8324216, 1.053476, -0.388384, 0, 0, 0, 1, 1,
0.832899, 0.2394306, 3.248322, 0, 0, 0, 1, 1,
0.8381377, 0.5233099, 1.904651, 0, 0, 0, 1, 1,
0.8392602, -1.278417, 1.846174, 1, 1, 1, 1, 1,
0.8396674, -2.430213, 2.098353, 1, 1, 1, 1, 1,
0.8437656, -0.1984356, 4.274536, 1, 1, 1, 1, 1,
0.8544127, 0.08876446, -0.528206, 1, 1, 1, 1, 1,
0.8555026, -1.095017, 0.7969385, 1, 1, 1, 1, 1,
0.8678362, 0.4055988, 0.8923564, 1, 1, 1, 1, 1,
0.870572, 3.019491, -1.398927, 1, 1, 1, 1, 1,
0.8723526, -1.569879, 1.868224, 1, 1, 1, 1, 1,
0.8735407, 0.6243511, 2.603313, 1, 1, 1, 1, 1,
0.874775, -0.7728332, 3.467885, 1, 1, 1, 1, 1,
0.8799881, -1.506736, 3.435183, 1, 1, 1, 1, 1,
0.8805005, 0.2772455, 3.244326, 1, 1, 1, 1, 1,
0.882645, 0.450004, 1.969468, 1, 1, 1, 1, 1,
0.8857175, -0.4477896, 2.492231, 1, 1, 1, 1, 1,
0.8954843, 0.135803, 1.205988, 1, 1, 1, 1, 1,
0.8981341, 1.367015, 0.4593324, 0, 0, 1, 1, 1,
0.900687, 0.7204729, 1.748037, 1, 0, 0, 1, 1,
0.9012823, 1.077733, 1.925039, 1, 0, 0, 1, 1,
0.9019486, 0.2797107, 1.918772, 1, 0, 0, 1, 1,
0.905084, -1.650876, 2.584485, 1, 0, 0, 1, 1,
0.9157421, 0.3504812, 1.204961, 1, 0, 0, 1, 1,
0.9181498, -0.4973977, 3.940494, 0, 0, 0, 1, 1,
0.9217243, 0.931947, 0.4335571, 0, 0, 0, 1, 1,
0.9225703, 0.6405089, 1.818446, 0, 0, 0, 1, 1,
0.9227574, -0.5635424, 1.2047, 0, 0, 0, 1, 1,
0.9270175, -0.7262668, 2.208248, 0, 0, 0, 1, 1,
0.9300643, -2.285668, 2.886209, 0, 0, 0, 1, 1,
0.9302876, -1.876903, 3.286842, 0, 0, 0, 1, 1,
0.9302965, 0.01255894, 1.309579, 1, 1, 1, 1, 1,
0.9343305, -0.3710212, 0.7264456, 1, 1, 1, 1, 1,
0.9444523, -0.5166658, 2.547591, 1, 1, 1, 1, 1,
0.9453534, -0.8827273, 1.872468, 1, 1, 1, 1, 1,
0.9488653, -0.04327558, -0.109732, 1, 1, 1, 1, 1,
0.9518971, -0.9046499, 2.238418, 1, 1, 1, 1, 1,
0.9543176, -1.7591, 2.009596, 1, 1, 1, 1, 1,
0.9586117, -0.6479493, 5.164789, 1, 1, 1, 1, 1,
0.9592348, -0.5696186, -0.5594901, 1, 1, 1, 1, 1,
0.9637405, -0.4222916, 1.918152, 1, 1, 1, 1, 1,
0.9686674, -0.419044, 2.075618, 1, 1, 1, 1, 1,
0.9691328, 0.2648021, 1.668416, 1, 1, 1, 1, 1,
0.974189, 0.05629189, 0.03094915, 1, 1, 1, 1, 1,
0.9743683, -0.3529723, 1.702256, 1, 1, 1, 1, 1,
0.9767637, 0.9268836, 1.869014, 1, 1, 1, 1, 1,
0.9849616, -0.5292493, 2.646113, 0, 0, 1, 1, 1,
0.9994926, 0.766941, 0.06046182, 1, 0, 0, 1, 1,
1.000245, -0.1644917, 1.764714, 1, 0, 0, 1, 1,
1.00446, 1.116868, 2.512322, 1, 0, 0, 1, 1,
1.00545, -0.9616101, 3.695827, 1, 0, 0, 1, 1,
1.015763, -1.772498, 2.364438, 1, 0, 0, 1, 1,
1.029343, -0.1460795, 2.129753, 0, 0, 0, 1, 1,
1.030956, -0.5368312, 0.9495271, 0, 0, 0, 1, 1,
1.031048, 1.362964, 2.012544, 0, 0, 0, 1, 1,
1.036578, -0.7506953, 2.047687, 0, 0, 0, 1, 1,
1.038598, 1.801903, 0.2858176, 0, 0, 0, 1, 1,
1.042688, -0.5986691, 4.674137, 0, 0, 0, 1, 1,
1.043693, -0.3803612, 1.731534, 0, 0, 0, 1, 1,
1.044076, -0.8790305, 0.610428, 1, 1, 1, 1, 1,
1.047725, 0.3549855, 0.4656123, 1, 1, 1, 1, 1,
1.05062, -1.720182, 2.890618, 1, 1, 1, 1, 1,
1.057103, -0.07478046, 2.075083, 1, 1, 1, 1, 1,
1.057571, 3.150757, 0.6528652, 1, 1, 1, 1, 1,
1.06806, 1.567853, 0.04124974, 1, 1, 1, 1, 1,
1.073004, 0.1017129, 1.265759, 1, 1, 1, 1, 1,
1.080052, 0.2879559, 1.412388, 1, 1, 1, 1, 1,
1.090688, 0.991616, 0.3470404, 1, 1, 1, 1, 1,
1.09487, -1.343477, 2.716854, 1, 1, 1, 1, 1,
1.102715, -0.03579105, 1.770385, 1, 1, 1, 1, 1,
1.102849, -0.2309701, 0.4910035, 1, 1, 1, 1, 1,
1.112054, 0.8026816, 0.4520907, 1, 1, 1, 1, 1,
1.128079, -0.9987089, 0.7492544, 1, 1, 1, 1, 1,
1.136498, 1.672688, 1.156075, 1, 1, 1, 1, 1,
1.13822, 0.617443, 2.124709, 0, 0, 1, 1, 1,
1.144061, -1.110835, 0.8480546, 1, 0, 0, 1, 1,
1.155606, -0.9590076, 0.7732111, 1, 0, 0, 1, 1,
1.155865, 0.3832186, 1.711518, 1, 0, 0, 1, 1,
1.1559, 1.547887, 0.4710169, 1, 0, 0, 1, 1,
1.156011, 0.7310184, 1.878701, 1, 0, 0, 1, 1,
1.161949, -1.269118, 2.84496, 0, 0, 0, 1, 1,
1.162364, 0.7012157, 1.652084, 0, 0, 0, 1, 1,
1.164621, 0.9086426, 2.127763, 0, 0, 0, 1, 1,
1.166762, 0.2389048, 0.05986395, 0, 0, 0, 1, 1,
1.171386, -1.174269, 2.950952, 0, 0, 0, 1, 1,
1.193803, -0.06305323, 1.521559, 0, 0, 0, 1, 1,
1.200617, -0.4440534, 3.057176, 0, 0, 0, 1, 1,
1.204111, 0.04762277, 3.651233, 1, 1, 1, 1, 1,
1.206391, -1.109678, 2.132973, 1, 1, 1, 1, 1,
1.208345, 0.5892767, 2.504365, 1, 1, 1, 1, 1,
1.217307, 1.326409, 0.9788521, 1, 1, 1, 1, 1,
1.221742, 1.708774, -0.1798064, 1, 1, 1, 1, 1,
1.231148, 0.9877571, 1.336308, 1, 1, 1, 1, 1,
1.233035, -1.79883, 1.919853, 1, 1, 1, 1, 1,
1.234197, 0.5343771, 2.201267, 1, 1, 1, 1, 1,
1.238086, 0.1719907, 3.415321, 1, 1, 1, 1, 1,
1.238878, -0.3560674, 1.556593, 1, 1, 1, 1, 1,
1.250118, 0.2499799, -0.1323099, 1, 1, 1, 1, 1,
1.254432, -0.7132532, 3.369031, 1, 1, 1, 1, 1,
1.260968, 0.8708514, 1.101061, 1, 1, 1, 1, 1,
1.262491, -0.2744284, 1.826813, 1, 1, 1, 1, 1,
1.263451, -1.089015, 1.772923, 1, 1, 1, 1, 1,
1.269697, 0.7291424, 0.8709172, 0, 0, 1, 1, 1,
1.274732, -1.270377, 1.158108, 1, 0, 0, 1, 1,
1.283206, 0.7060684, 1.667203, 1, 0, 0, 1, 1,
1.284175, 0.9290842, 1.126344, 1, 0, 0, 1, 1,
1.286388, -0.1432043, 0.7229888, 1, 0, 0, 1, 1,
1.287042, 0.8879815, 0.3282835, 1, 0, 0, 1, 1,
1.305113, 0.2498058, 0.7482905, 0, 0, 0, 1, 1,
1.307226, -1.571125, 2.600052, 0, 0, 0, 1, 1,
1.311548, 0.6214654, 0.1939687, 0, 0, 0, 1, 1,
1.317827, 0.9483172, -1.452856, 0, 0, 0, 1, 1,
1.318384, 0.8420179, -0.7372545, 0, 0, 0, 1, 1,
1.333169, 0.2669046, 0.9968628, 0, 0, 0, 1, 1,
1.345596, -0.2383676, 2.358166, 0, 0, 0, 1, 1,
1.345671, 1.428029, -0.6587922, 1, 1, 1, 1, 1,
1.374548, 1.025066, 0.7416252, 1, 1, 1, 1, 1,
1.38571, -0.5221095, 2.463195, 1, 1, 1, 1, 1,
1.395141, 0.05902931, 1.75868, 1, 1, 1, 1, 1,
1.397148, -0.870463, 2.951355, 1, 1, 1, 1, 1,
1.405582, 0.6562718, 2.254972, 1, 1, 1, 1, 1,
1.411098, -1.858445, 1.062575, 1, 1, 1, 1, 1,
1.413244, -0.4967055, 1.93478, 1, 1, 1, 1, 1,
1.41427, 0.2148104, -0.8325002, 1, 1, 1, 1, 1,
1.423145, -1.794419, 2.966816, 1, 1, 1, 1, 1,
1.434469, 1.682613, -0.4725133, 1, 1, 1, 1, 1,
1.458082, 1.370893, 1.461269, 1, 1, 1, 1, 1,
1.482696, -1.286145, 3.774624, 1, 1, 1, 1, 1,
1.483364, 0.8674734, 2.729918, 1, 1, 1, 1, 1,
1.505171, 1.504742, 0.4615909, 1, 1, 1, 1, 1,
1.508192, -0.1344001, 1.474419, 0, 0, 1, 1, 1,
1.518282, 0.365235, 0.9732616, 1, 0, 0, 1, 1,
1.518603, -0.9337487, 0.4747374, 1, 0, 0, 1, 1,
1.523326, 1.024605, 1.427177, 1, 0, 0, 1, 1,
1.538672, -0.739794, -0.2908817, 1, 0, 0, 1, 1,
1.540022, -0.2212622, 1.994629, 1, 0, 0, 1, 1,
1.549603, 0.1694485, 1.888952, 0, 0, 0, 1, 1,
1.55627, -0.3288188, 2.167428, 0, 0, 0, 1, 1,
1.565024, 0.6019181, 0.6832163, 0, 0, 0, 1, 1,
1.577593, 1.281129, 1.133239, 0, 0, 0, 1, 1,
1.581505, -0.9842799, 1.325306, 0, 0, 0, 1, 1,
1.582818, 0.213716, 2.745776, 0, 0, 0, 1, 1,
1.587577, 0.884877, -0.3667605, 0, 0, 0, 1, 1,
1.61608, -0.6601302, 2.896047, 1, 1, 1, 1, 1,
1.624237, -0.4876721, 0.5774556, 1, 1, 1, 1, 1,
1.624781, 0.3437417, 2.544581, 1, 1, 1, 1, 1,
1.626306, 1.08515, 0.197456, 1, 1, 1, 1, 1,
1.628027, -0.6865285, 4.673563, 1, 1, 1, 1, 1,
1.632792, 0.7486053, 0.6625328, 1, 1, 1, 1, 1,
1.636035, -0.08327837, 1.70881, 1, 1, 1, 1, 1,
1.644895, -0.921272, 2.506404, 1, 1, 1, 1, 1,
1.646952, -0.5285856, 1.60152, 1, 1, 1, 1, 1,
1.650836, 0.4194901, 0.9558963, 1, 1, 1, 1, 1,
1.666642, 0.5313586, 1.018213, 1, 1, 1, 1, 1,
1.668644, 0.6360051, 1.888717, 1, 1, 1, 1, 1,
1.692011, 0.07101562, 1.874253, 1, 1, 1, 1, 1,
1.713458, 1.277596, -1.492165, 1, 1, 1, 1, 1,
1.718672, -0.2196862, 4.008812, 1, 1, 1, 1, 1,
1.730566, 1.56636, 1.245978, 0, 0, 1, 1, 1,
1.732632, -1.042587, 2.303141, 1, 0, 0, 1, 1,
1.739386, -1.923344, 1.241938, 1, 0, 0, 1, 1,
1.76623, 0.2811545, 1.388893, 1, 0, 0, 1, 1,
1.778435, 1.215831, 0.7221273, 1, 0, 0, 1, 1,
1.783063, 0.3964946, 0.277975, 1, 0, 0, 1, 1,
1.786888, 0.1154422, 2.27486, 0, 0, 0, 1, 1,
1.790768, -0.02457745, -0.2018762, 0, 0, 0, 1, 1,
1.807446, 0.4146582, -0.1261032, 0, 0, 0, 1, 1,
1.809216, 1.332325, 1.233428, 0, 0, 0, 1, 1,
1.822113, 0.1060047, 3.515999, 0, 0, 0, 1, 1,
1.827986, 0.7366185, 3.545749, 0, 0, 0, 1, 1,
1.831543, 0.1105317, 2.689425, 0, 0, 0, 1, 1,
1.836857, 0.1599123, 1.740502, 1, 1, 1, 1, 1,
1.836912, 0.5989186, 1.167141, 1, 1, 1, 1, 1,
1.855382, 0.5947893, -1.154513, 1, 1, 1, 1, 1,
1.86362, -0.7150367, 1.111585, 1, 1, 1, 1, 1,
1.875996, 0.2058985, -0.05690682, 1, 1, 1, 1, 1,
1.897342, -0.2647286, 1.46423, 1, 1, 1, 1, 1,
1.905058, -0.005961494, 1.347202, 1, 1, 1, 1, 1,
1.912563, -3.476785, 3.046757, 1, 1, 1, 1, 1,
1.914559, -0.2085713, 1.428728, 1, 1, 1, 1, 1,
1.930366, -0.2316809, 2.838273, 1, 1, 1, 1, 1,
1.938196, -0.4892226, 1.5865, 1, 1, 1, 1, 1,
1.940793, -1.082488, 3.086691, 1, 1, 1, 1, 1,
1.947364, -0.1371608, 2.388837, 1, 1, 1, 1, 1,
1.959326, -0.3123596, -0.4581512, 1, 1, 1, 1, 1,
1.977907, -0.1607381, 2.5432, 1, 1, 1, 1, 1,
1.979208, -1.551234, 1.78246, 0, 0, 1, 1, 1,
1.986384, -1.115766, 1.274559, 1, 0, 0, 1, 1,
2.006193, 0.3621926, 0.6983838, 1, 0, 0, 1, 1,
2.016092, 0.9217474, 0.5907122, 1, 0, 0, 1, 1,
2.076215, -1.375031, 3.732306, 1, 0, 0, 1, 1,
2.138598, 0.2103645, 0.8548467, 1, 0, 0, 1, 1,
2.147558, -0.4492647, 0.5535529, 0, 0, 0, 1, 1,
2.149852, -0.1938674, 1.177027, 0, 0, 0, 1, 1,
2.157017, -0.3877807, 2.314228, 0, 0, 0, 1, 1,
2.157165, 0.8507323, 1.982363, 0, 0, 0, 1, 1,
2.170869, -0.3993321, 1.310431, 0, 0, 0, 1, 1,
2.207364, -1.205669, 2.269992, 0, 0, 0, 1, 1,
2.299393, -1.064589, 1.898712, 0, 0, 0, 1, 1,
2.339308, 0.2402752, 1.041761, 1, 1, 1, 1, 1,
2.374705, 0.2308687, 1.719241, 1, 1, 1, 1, 1,
2.423576, 0.4734754, -0.02672266, 1, 1, 1, 1, 1,
2.529618, -0.716908, 1.735968, 1, 1, 1, 1, 1,
2.62698, 0.6036128, 2.17599, 1, 1, 1, 1, 1,
2.703118, 0.4667071, 2.591472, 1, 1, 1, 1, 1,
2.84503, 2.713173, 0.3649361, 1, 1, 1, 1, 1
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
var radius = 9.876318;
var distance = 34.69015;
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
mvMatrix.translate( 0.2561407, 0.1630137, 0.5571687 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69015);
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
