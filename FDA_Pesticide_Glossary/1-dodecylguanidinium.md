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
-3.578911, -0.6583943, -1.13586, 1, 0, 0, 1,
-3.376491, 1.432296, -0.5601186, 1, 0.007843138, 0, 1,
-2.830812, 0.7633861, -3.356803, 1, 0.01176471, 0, 1,
-2.781326, 1.936755, -0.1694819, 1, 0.01960784, 0, 1,
-2.697845, 0.8076723, -1.44663, 1, 0.02352941, 0, 1,
-2.606402, -0.8454379, -2.321998, 1, 0.03137255, 0, 1,
-2.543741, 0.5761124, -1.315848, 1, 0.03529412, 0, 1,
-2.503657, -0.8159514, -0.6235773, 1, 0.04313726, 0, 1,
-2.309059, -1.960424, -2.61269, 1, 0.04705882, 0, 1,
-2.295436, 0.6224748, 1.432884, 1, 0.05490196, 0, 1,
-2.236976, 1.604029, -1.228067, 1, 0.05882353, 0, 1,
-2.229941, 0.2394392, -2.120671, 1, 0.06666667, 0, 1,
-2.207715, -0.4043481, -1.321763, 1, 0.07058824, 0, 1,
-2.157189, -0.4847931, -0.2378966, 1, 0.07843138, 0, 1,
-2.150587, -1.637072, -1.446172, 1, 0.08235294, 0, 1,
-2.128768, 0.8248992, -0.7582749, 1, 0.09019608, 0, 1,
-2.102142, 0.8985764, -0.3748253, 1, 0.09411765, 0, 1,
-2.098235, 0.621235, -2.082054, 1, 0.1019608, 0, 1,
-2.02409, 1.391731, -1.761347, 1, 0.1098039, 0, 1,
-2.012183, -0.1203589, -2.176545, 1, 0.1137255, 0, 1,
-1.983344, 0.8115005, -0.3785075, 1, 0.1215686, 0, 1,
-1.970702, 0.9052081, -2.282774, 1, 0.1254902, 0, 1,
-1.961766, 2.101138, -0.8354492, 1, 0.1333333, 0, 1,
-1.954995, -0.02751543, -3.153339, 1, 0.1372549, 0, 1,
-1.933078, 1.04195, -0.7217395, 1, 0.145098, 0, 1,
-1.874883, -0.4982653, -0.7740334, 1, 0.1490196, 0, 1,
-1.866489, -1.042601, -2.557036, 1, 0.1568628, 0, 1,
-1.855767, 0.6686938, -0.3637392, 1, 0.1607843, 0, 1,
-1.854979, 0.02596901, -2.520076, 1, 0.1686275, 0, 1,
-1.85146, -0.2881343, -0.5032287, 1, 0.172549, 0, 1,
-1.814421, -1.173123, -4.786024, 1, 0.1803922, 0, 1,
-1.803174, 1.07621, 2.049388, 1, 0.1843137, 0, 1,
-1.784704, 0.3663839, -1.863501, 1, 0.1921569, 0, 1,
-1.776781, 0.01548161, -2.766972, 1, 0.1960784, 0, 1,
-1.775235, 0.4402064, -1.352262, 1, 0.2039216, 0, 1,
-1.764479, -1.521415, -2.281923, 1, 0.2117647, 0, 1,
-1.751118, -1.234104, -1.13837, 1, 0.2156863, 0, 1,
-1.750222, -1.156646, 0.7248354, 1, 0.2235294, 0, 1,
-1.740072, 0.3708903, -1.719512, 1, 0.227451, 0, 1,
-1.726548, 0.9516969, -0.8273155, 1, 0.2352941, 0, 1,
-1.707736, -0.07833473, -1.159051, 1, 0.2392157, 0, 1,
-1.704, -0.9753966, -3.464145, 1, 0.2470588, 0, 1,
-1.703067, 0.2084819, -2.253474, 1, 0.2509804, 0, 1,
-1.702191, -1.579961, -2.925742, 1, 0.2588235, 0, 1,
-1.69676, -0.4991131, -2.320717, 1, 0.2627451, 0, 1,
-1.691389, -0.3534702, -2.060968, 1, 0.2705882, 0, 1,
-1.675864, 0.110611, -3.097079, 1, 0.2745098, 0, 1,
-1.66659, -2.096648, -1.243984, 1, 0.282353, 0, 1,
-1.647559, 1.346415, -0.6306261, 1, 0.2862745, 0, 1,
-1.641254, 0.6724559, -1.18944, 1, 0.2941177, 0, 1,
-1.633852, 0.6690869, -1.429565, 1, 0.3019608, 0, 1,
-1.630753, 0.3793971, -2.331252, 1, 0.3058824, 0, 1,
-1.628197, 2.596358, 0.4980453, 1, 0.3137255, 0, 1,
-1.618456, -0.158839, -2.768803, 1, 0.3176471, 0, 1,
-1.599056, 0.627633, -0.7213755, 1, 0.3254902, 0, 1,
-1.587103, -0.3300468, -3.105938, 1, 0.3294118, 0, 1,
-1.551473, 0.4207597, -1.066692, 1, 0.3372549, 0, 1,
-1.543624, -0.109019, -3.198678, 1, 0.3411765, 0, 1,
-1.541156, -0.4859455, -1.431094, 1, 0.3490196, 0, 1,
-1.540489, -3.012062, -3.922787, 1, 0.3529412, 0, 1,
-1.532007, 0.6342951, -2.750867, 1, 0.3607843, 0, 1,
-1.531296, -0.3025928, -0.8388935, 1, 0.3647059, 0, 1,
-1.519514, 1.06414, -0.7719482, 1, 0.372549, 0, 1,
-1.51431, 0.3791784, -0.5056074, 1, 0.3764706, 0, 1,
-1.510041, -0.3119019, -1.628601, 1, 0.3843137, 0, 1,
-1.508204, -1.716515, -2.568204, 1, 0.3882353, 0, 1,
-1.500124, 0.6331947, 0.1485647, 1, 0.3960784, 0, 1,
-1.489639, -0.1161707, -0.2193313, 1, 0.4039216, 0, 1,
-1.488478, 0.2785391, -2.048531, 1, 0.4078431, 0, 1,
-1.485338, -0.4117666, -2.780144, 1, 0.4156863, 0, 1,
-1.48104, -1.023468, -0.9728734, 1, 0.4196078, 0, 1,
-1.450843, -1.206424, -2.340904, 1, 0.427451, 0, 1,
-1.450628, 1.895315, 0.2388741, 1, 0.4313726, 0, 1,
-1.442427, 0.4152463, -0.2963719, 1, 0.4392157, 0, 1,
-1.440012, 2.339131, -0.647927, 1, 0.4431373, 0, 1,
-1.43973, -0.3411443, -3.377414, 1, 0.4509804, 0, 1,
-1.429227, 1.239561, -0.0597352, 1, 0.454902, 0, 1,
-1.421354, 1.023165, -1.362554, 1, 0.4627451, 0, 1,
-1.411348, 0.3071555, -1.521465, 1, 0.4666667, 0, 1,
-1.409558, 1.18612, -1.81038, 1, 0.4745098, 0, 1,
-1.379411, 0.460629, -1.410475, 1, 0.4784314, 0, 1,
-1.377867, 0.7234643, -1.344637, 1, 0.4862745, 0, 1,
-1.373767, -0.1476981, -0.9851212, 1, 0.4901961, 0, 1,
-1.371712, 1.895038, 0.4007857, 1, 0.4980392, 0, 1,
-1.360095, 0.8685585, -2.323231, 1, 0.5058824, 0, 1,
-1.357033, -0.7121262, -3.001823, 1, 0.509804, 0, 1,
-1.356796, 0.7774744, -1.158634, 1, 0.5176471, 0, 1,
-1.356148, -0.1894462, -0.2066526, 1, 0.5215687, 0, 1,
-1.349858, 0.1807092, -2.051014, 1, 0.5294118, 0, 1,
-1.34207, -0.08136191, -2.60763, 1, 0.5333334, 0, 1,
-1.338527, 0.002275488, -0.2352766, 1, 0.5411765, 0, 1,
-1.337866, 0.7958536, -0.9063731, 1, 0.5450981, 0, 1,
-1.325137, 1.045289, -0.8107973, 1, 0.5529412, 0, 1,
-1.320906, 1.477923, -0.8065723, 1, 0.5568628, 0, 1,
-1.315324, -1.174551, -0.7148772, 1, 0.5647059, 0, 1,
-1.314008, 0.8061296, 0.1669405, 1, 0.5686275, 0, 1,
-1.310968, 0.4659828, -0.8910418, 1, 0.5764706, 0, 1,
-1.290767, -1.682489, -2.660705, 1, 0.5803922, 0, 1,
-1.290114, 0.438363, -0.5746284, 1, 0.5882353, 0, 1,
-1.270345, 0.644639, -1.038427, 1, 0.5921569, 0, 1,
-1.258382, -0.9376648, -0.8686695, 1, 0.6, 0, 1,
-1.254351, -2.790974, -2.182647, 1, 0.6078432, 0, 1,
-1.25177, 0.2279785, -1.53301, 1, 0.6117647, 0, 1,
-1.249988, 0.4846331, -1.693634, 1, 0.6196079, 0, 1,
-1.238958, -0.2874358, -0.7281407, 1, 0.6235294, 0, 1,
-1.235188, 0.5272043, -2.155277, 1, 0.6313726, 0, 1,
-1.232211, 0.85818, -2.660446, 1, 0.6352941, 0, 1,
-1.230847, 1.067083, -1.704026, 1, 0.6431373, 0, 1,
-1.227964, -0.9649659, -3.475213, 1, 0.6470588, 0, 1,
-1.226516, 0.6219385, -2.009736, 1, 0.654902, 0, 1,
-1.220324, -1.372948, -1.214447, 1, 0.6588235, 0, 1,
-1.216734, -1.380043, -3.093588, 1, 0.6666667, 0, 1,
-1.215078, -0.2696022, -2.611705, 1, 0.6705883, 0, 1,
-1.213458, -0.4439119, -3.049596, 1, 0.6784314, 0, 1,
-1.20347, 0.165552, -1.844467, 1, 0.682353, 0, 1,
-1.202291, -0.7037279, -0.6694568, 1, 0.6901961, 0, 1,
-1.202087, -1.275653, -1.886339, 1, 0.6941177, 0, 1,
-1.196615, 0.8605102, -2.625554, 1, 0.7019608, 0, 1,
-1.192398, 0.2151667, -0.6783988, 1, 0.7098039, 0, 1,
-1.188659, -0.1758559, -1.367316, 1, 0.7137255, 0, 1,
-1.185966, 0.5125741, -2.70588, 1, 0.7215686, 0, 1,
-1.173612, 0.640039, -1.157519, 1, 0.7254902, 0, 1,
-1.168484, 1.278412, -1.395652, 1, 0.7333333, 0, 1,
-1.162029, 1.633914, 1.610827, 1, 0.7372549, 0, 1,
-1.160075, 0.1272213, -1.935288, 1, 0.7450981, 0, 1,
-1.159079, 2.581323, 0.004965623, 1, 0.7490196, 0, 1,
-1.15792, -0.8867996, -1.335964, 1, 0.7568628, 0, 1,
-1.157128, -0.127188, -1.941212, 1, 0.7607843, 0, 1,
-1.153816, -0.4503729, -2.20246, 1, 0.7686275, 0, 1,
-1.135598, 0.4283714, -2.137021, 1, 0.772549, 0, 1,
-1.135169, -1.372147, -2.950782, 1, 0.7803922, 0, 1,
-1.130735, 0.007964212, -1.353466, 1, 0.7843137, 0, 1,
-1.128629, -0.7246722, -1.828232, 1, 0.7921569, 0, 1,
-1.120453, -0.8669388, -2.518858, 1, 0.7960784, 0, 1,
-1.116482, -0.3513344, -3.013668, 1, 0.8039216, 0, 1,
-1.116019, 1.323547, -0.9826287, 1, 0.8117647, 0, 1,
-1.114251, -0.2332534, -1.682967, 1, 0.8156863, 0, 1,
-1.111051, 0.5980939, -2.266115, 1, 0.8235294, 0, 1,
-1.109526, -0.5233505, -2.290449, 1, 0.827451, 0, 1,
-1.102362, 0.1483098, -1.137061, 1, 0.8352941, 0, 1,
-1.097087, 0.3520609, -0.0491164, 1, 0.8392157, 0, 1,
-1.094724, -1.360359, -1.584206, 1, 0.8470588, 0, 1,
-1.068732, 0.5403649, -2.964627, 1, 0.8509804, 0, 1,
-1.053782, -0.5825679, -2.344154, 1, 0.8588235, 0, 1,
-1.047103, -0.6869694, -3.104559, 1, 0.8627451, 0, 1,
-1.046988, -1.334835, -2.771253, 1, 0.8705882, 0, 1,
-1.044896, -1.338854, -1.224404, 1, 0.8745098, 0, 1,
-1.040699, -0.4765177, -1.58874, 1, 0.8823529, 0, 1,
-1.033394, 0.3818174, -1.330456, 1, 0.8862745, 0, 1,
-1.026797, 0.6256714, -1.948529, 1, 0.8941177, 0, 1,
-1.026053, -0.3114205, -1.713392, 1, 0.8980392, 0, 1,
-1.025205, 0.1634537, -0.9453378, 1, 0.9058824, 0, 1,
-1.025145, 2.694758, -0.2606392, 1, 0.9137255, 0, 1,
-1.02447, -1.079459, -3.120025, 1, 0.9176471, 0, 1,
-1.010316, -0.3447709, -0.153136, 1, 0.9254902, 0, 1,
-1.002547, -0.317606, -3.101084, 1, 0.9294118, 0, 1,
-0.999247, -0.6637289, -0.3643954, 1, 0.9372549, 0, 1,
-0.9989034, -1.186932, -2.291067, 1, 0.9411765, 0, 1,
-0.9988814, 0.6840776, -1.144378, 1, 0.9490196, 0, 1,
-0.991145, 0.6735971, 0.381394, 1, 0.9529412, 0, 1,
-0.9894272, 0.6906503, -1.052937, 1, 0.9607843, 0, 1,
-0.9840371, -0.9443256, -3.140991, 1, 0.9647059, 0, 1,
-0.9788365, 0.5345406, -0.4679389, 1, 0.972549, 0, 1,
-0.9661595, 0.4711759, -0.1041315, 1, 0.9764706, 0, 1,
-0.9656593, -0.4177993, -1.740645, 1, 0.9843137, 0, 1,
-0.9594411, -0.8090852, -1.48302, 1, 0.9882353, 0, 1,
-0.9569961, 1.412168, -1.232816, 1, 0.9960784, 0, 1,
-0.9482247, -2.114676, -2.116693, 0.9960784, 1, 0, 1,
-0.9451517, -0.6332296, -4.886978, 0.9921569, 1, 0, 1,
-0.9447109, 0.3168383, -2.485093, 0.9843137, 1, 0, 1,
-0.9397794, 0.8711682, -0.2782104, 0.9803922, 1, 0, 1,
-0.9312418, -1.459357, -3.275294, 0.972549, 1, 0, 1,
-0.9297227, 0.7369642, -0.3668746, 0.9686275, 1, 0, 1,
-0.9271027, -2.161696, -1.889304, 0.9607843, 1, 0, 1,
-0.9222277, 0.3520306, -1.233188, 0.9568627, 1, 0, 1,
-0.914283, 0.636521, -1.232867, 0.9490196, 1, 0, 1,
-0.9120778, 0.9068623, 0.7312243, 0.945098, 1, 0, 1,
-0.9111831, 2.368163, -0.4389812, 0.9372549, 1, 0, 1,
-0.90866, -1.574932, -2.625813, 0.9333333, 1, 0, 1,
-0.9046882, -1.160761, -2.261284, 0.9254902, 1, 0, 1,
-0.9040055, -0.1682298, 0.03839995, 0.9215686, 1, 0, 1,
-0.901421, 0.04149844, -0.9541046, 0.9137255, 1, 0, 1,
-0.9003054, 0.403778, -0.7619714, 0.9098039, 1, 0, 1,
-0.8910028, -1.280275, -1.776462, 0.9019608, 1, 0, 1,
-0.8903106, 0.443094, 0.1804157, 0.8941177, 1, 0, 1,
-0.8892939, 0.1733783, -2.636018, 0.8901961, 1, 0, 1,
-0.8828534, -1.024004, -1.989708, 0.8823529, 1, 0, 1,
-0.8825181, 0.9911307, -1.075783, 0.8784314, 1, 0, 1,
-0.8815563, 1.20473, -1.120873, 0.8705882, 1, 0, 1,
-0.8791299, 1.728857, -0.7097605, 0.8666667, 1, 0, 1,
-0.8785883, -0.0315402, 0.5367209, 0.8588235, 1, 0, 1,
-0.8753178, 0.3056045, -1.75312, 0.854902, 1, 0, 1,
-0.8737315, 0.8960427, -2.396971, 0.8470588, 1, 0, 1,
-0.8736765, 0.541576, -1.748382, 0.8431373, 1, 0, 1,
-0.8736154, -0.302744, -0.9933722, 0.8352941, 1, 0, 1,
-0.8698921, 0.528532, -1.773496, 0.8313726, 1, 0, 1,
-0.862221, -1.090709, -2.535302, 0.8235294, 1, 0, 1,
-0.8556936, -0.1081633, -1.755464, 0.8196079, 1, 0, 1,
-0.8545105, -1.7512, -3.849995, 0.8117647, 1, 0, 1,
-0.8538888, -0.8858763, -4.233394, 0.8078431, 1, 0, 1,
-0.8491884, 1.208863, -0.9919972, 0.8, 1, 0, 1,
-0.8423526, -0.4112487, -1.377447, 0.7921569, 1, 0, 1,
-0.8422324, 0.9069238, -1.600474, 0.7882353, 1, 0, 1,
-0.8390698, 1.060794, 0.655145, 0.7803922, 1, 0, 1,
-0.837567, 0.5413301, -1.695943, 0.7764706, 1, 0, 1,
-0.8131543, -0.669, -3.292823, 0.7686275, 1, 0, 1,
-0.8125059, -0.2778853, -0.7722651, 0.7647059, 1, 0, 1,
-0.8116572, -0.005937073, -2.968825, 0.7568628, 1, 0, 1,
-0.8070186, 0.04668238, -1.384486, 0.7529412, 1, 0, 1,
-0.8059537, -0.2132785, -2.476261, 0.7450981, 1, 0, 1,
-0.8046016, -1.457266, -3.128601, 0.7411765, 1, 0, 1,
-0.8045592, 1.209731, 1.603913, 0.7333333, 1, 0, 1,
-0.7994172, 2.464385, 0.07596858, 0.7294118, 1, 0, 1,
-0.7943201, 1.222842, 0.4056954, 0.7215686, 1, 0, 1,
-0.7853958, -0.9833132, -2.609574, 0.7176471, 1, 0, 1,
-0.7816795, 0.3061324, -0.9888542, 0.7098039, 1, 0, 1,
-0.7791502, -0.6488298, -1.830537, 0.7058824, 1, 0, 1,
-0.7788627, -1.247138, -0.4881947, 0.6980392, 1, 0, 1,
-0.7726572, 0.1779159, 0.001948194, 0.6901961, 1, 0, 1,
-0.7726274, -1.574543, -3.047207, 0.6862745, 1, 0, 1,
-0.7690693, -0.6521711, -0.7040712, 0.6784314, 1, 0, 1,
-0.7649561, -0.7346886, -3.101207, 0.6745098, 1, 0, 1,
-0.7610791, -1.720139, -2.420428, 0.6666667, 1, 0, 1,
-0.757637, -0.4682268, -1.565651, 0.6627451, 1, 0, 1,
-0.7460169, 0.1802303, -1.345829, 0.654902, 1, 0, 1,
-0.7460008, 0.3107945, -0.7885122, 0.6509804, 1, 0, 1,
-0.7443553, 0.4095187, -0.2846357, 0.6431373, 1, 0, 1,
-0.7387854, -0.798455, -1.263879, 0.6392157, 1, 0, 1,
-0.7371532, -0.2848128, -2.809992, 0.6313726, 1, 0, 1,
-0.7081149, 0.629272, 0.6128638, 0.627451, 1, 0, 1,
-0.706931, 1.355665, -0.1314288, 0.6196079, 1, 0, 1,
-0.7025712, -0.6809216, -4.135384, 0.6156863, 1, 0, 1,
-0.6985416, 0.4446431, -2.739313, 0.6078432, 1, 0, 1,
-0.6981375, 0.5401163, -1.200235, 0.6039216, 1, 0, 1,
-0.6942651, 0.9912016, 0.6753106, 0.5960785, 1, 0, 1,
-0.6918185, 0.1358501, -0.4144099, 0.5882353, 1, 0, 1,
-0.6832498, 0.04697123, -2.570062, 0.5843138, 1, 0, 1,
-0.67026, 0.3255474, -0.333429, 0.5764706, 1, 0, 1,
-0.6690413, -0.5523705, -1.59173, 0.572549, 1, 0, 1,
-0.6672494, -0.2957925, -2.849865, 0.5647059, 1, 0, 1,
-0.6670455, -1.292036, -2.280694, 0.5607843, 1, 0, 1,
-0.6661119, 0.7239633, -0.111933, 0.5529412, 1, 0, 1,
-0.6660892, 1.457962, -2.360816, 0.5490196, 1, 0, 1,
-0.6638386, 0.2157408, -2.576915, 0.5411765, 1, 0, 1,
-0.6629367, 0.2189796, -0.7108079, 0.5372549, 1, 0, 1,
-0.6613365, -0.6231874, -2.829921, 0.5294118, 1, 0, 1,
-0.659596, -0.1756946, -2.797706, 0.5254902, 1, 0, 1,
-0.6594368, -1.701137, -2.28665, 0.5176471, 1, 0, 1,
-0.6554243, 1.848137, 0.4121681, 0.5137255, 1, 0, 1,
-0.6521831, -0.5034522, -2.253586, 0.5058824, 1, 0, 1,
-0.6518382, -1.09454, -3.970081, 0.5019608, 1, 0, 1,
-0.6492482, 0.3059943, -0.6019561, 0.4941176, 1, 0, 1,
-0.6483698, -1.104601, -3.601101, 0.4862745, 1, 0, 1,
-0.6448212, 1.039409, -0.3856125, 0.4823529, 1, 0, 1,
-0.6381814, -1.076613, -2.58965, 0.4745098, 1, 0, 1,
-0.6335139, -1.504599, -3.542733, 0.4705882, 1, 0, 1,
-0.6296692, -0.6105213, -3.465423, 0.4627451, 1, 0, 1,
-0.6272498, -0.1923038, -2.916317, 0.4588235, 1, 0, 1,
-0.6251446, 0.03737059, -1.864938, 0.4509804, 1, 0, 1,
-0.6231155, -0.7563105, -2.00993, 0.4470588, 1, 0, 1,
-0.6217151, -0.2222755, -0.567623, 0.4392157, 1, 0, 1,
-0.6187073, -0.122355, -3.103284, 0.4352941, 1, 0, 1,
-0.6185435, -0.3842671, -1.732164, 0.427451, 1, 0, 1,
-0.6131713, -0.7911109, -1.989068, 0.4235294, 1, 0, 1,
-0.6120542, 0.3855258, -2.672857, 0.4156863, 1, 0, 1,
-0.6101604, -0.665466, -1.653051, 0.4117647, 1, 0, 1,
-0.6045471, 0.3918938, 1.0224, 0.4039216, 1, 0, 1,
-0.6011218, -0.6791607, -2.377778, 0.3960784, 1, 0, 1,
-0.6011008, -1.252841, -2.574876, 0.3921569, 1, 0, 1,
-0.600433, 0.8146324, -0.7652226, 0.3843137, 1, 0, 1,
-0.5987596, 0.1953378, -0.2067031, 0.3803922, 1, 0, 1,
-0.5981327, -2.600822, -3.286927, 0.372549, 1, 0, 1,
-0.5978729, -0.9589843, -2.648318, 0.3686275, 1, 0, 1,
-0.5967438, 0.1068043, -1.480142, 0.3607843, 1, 0, 1,
-0.5942028, 0.4017678, -1.052362, 0.3568628, 1, 0, 1,
-0.5925271, 1.726058, 0.9587328, 0.3490196, 1, 0, 1,
-0.5924251, -0.612878, -2.144519, 0.345098, 1, 0, 1,
-0.5877455, 0.9041914, -0.4537662, 0.3372549, 1, 0, 1,
-0.5858765, -1.196392, -3.226327, 0.3333333, 1, 0, 1,
-0.5849507, 0.003315773, -1.653712, 0.3254902, 1, 0, 1,
-0.5823755, -0.9983429, -2.316091, 0.3215686, 1, 0, 1,
-0.5820926, 0.9247375, -0.2166443, 0.3137255, 1, 0, 1,
-0.5791376, 0.3996712, -1.137121, 0.3098039, 1, 0, 1,
-0.5779937, -0.05671187, -0.9610649, 0.3019608, 1, 0, 1,
-0.5722134, 0.2025446, -2.459998, 0.2941177, 1, 0, 1,
-0.5713405, 0.270825, -1.017533, 0.2901961, 1, 0, 1,
-0.5693495, 0.03250912, -2.041335, 0.282353, 1, 0, 1,
-0.5595145, 0.3714219, -1.813128, 0.2784314, 1, 0, 1,
-0.5592457, 1.247341, 0.9058267, 0.2705882, 1, 0, 1,
-0.5581807, 0.09826314, -2.480281, 0.2666667, 1, 0, 1,
-0.5504264, -1.622991, -4.248346, 0.2588235, 1, 0, 1,
-0.5459877, 0.9878263, -0.5609646, 0.254902, 1, 0, 1,
-0.5375564, -1.157129, -1.137431, 0.2470588, 1, 0, 1,
-0.537199, 0.5978042, -1.56574, 0.2431373, 1, 0, 1,
-0.5365717, -0.5039697, -1.025737, 0.2352941, 1, 0, 1,
-0.5330077, 0.7598801, -2.132712, 0.2313726, 1, 0, 1,
-0.5305365, 0.4232979, -0.5110438, 0.2235294, 1, 0, 1,
-0.5274793, -0.1420591, -1.835009, 0.2196078, 1, 0, 1,
-0.5274392, 0.732871, -0.171632, 0.2117647, 1, 0, 1,
-0.525631, -0.9198445, -4.392046, 0.2078431, 1, 0, 1,
-0.5216588, 0.1242554, -1.487355, 0.2, 1, 0, 1,
-0.5206664, -0.005498506, -2.732111, 0.1921569, 1, 0, 1,
-0.5206147, -1.134863, -2.760065, 0.1882353, 1, 0, 1,
-0.5176379, -1.059965, -3.860111, 0.1803922, 1, 0, 1,
-0.5163483, 0.2988478, -1.360422, 0.1764706, 1, 0, 1,
-0.5088993, -1.291953, -2.813004, 0.1686275, 1, 0, 1,
-0.5078068, 1.034414, -0.889634, 0.1647059, 1, 0, 1,
-0.5062011, -1.217368, -3.99752, 0.1568628, 1, 0, 1,
-0.498601, 0.4036432, -0.2588855, 0.1529412, 1, 0, 1,
-0.4973753, 0.3902752, -1.340921, 0.145098, 1, 0, 1,
-0.4960181, -0.8056874, -2.752846, 0.1411765, 1, 0, 1,
-0.4955574, 0.2439774, -2.122959, 0.1333333, 1, 0, 1,
-0.4939862, -0.5266091, -1.444525, 0.1294118, 1, 0, 1,
-0.4930853, 0.1982176, -3.013127, 0.1215686, 1, 0, 1,
-0.4913498, 0.03386998, -0.8009537, 0.1176471, 1, 0, 1,
-0.490494, 0.8482446, 1.032819, 0.1098039, 1, 0, 1,
-0.4888444, 1.4409, -0.1292963, 0.1058824, 1, 0, 1,
-0.4888233, 0.5414429, -0.1419898, 0.09803922, 1, 0, 1,
-0.4855089, -0.5853692, -4.231145, 0.09019608, 1, 0, 1,
-0.4801548, -0.7224865, -1.361134, 0.08627451, 1, 0, 1,
-0.4794117, 2.72821, -0.6180733, 0.07843138, 1, 0, 1,
-0.4786419, -1.078149, -1.525419, 0.07450981, 1, 0, 1,
-0.472804, 2.406654, -2.347031, 0.06666667, 1, 0, 1,
-0.472296, -0.587302, -2.841127, 0.0627451, 1, 0, 1,
-0.4675978, 0.7377111, 1.132021, 0.05490196, 1, 0, 1,
-0.4641784, 2.146492, -0.2502804, 0.05098039, 1, 0, 1,
-0.4634248, -0.2882954, -1.985601, 0.04313726, 1, 0, 1,
-0.4631308, 1.135593, -0.3514481, 0.03921569, 1, 0, 1,
-0.4575151, 0.8302654, -2.051973, 0.03137255, 1, 0, 1,
-0.4566489, -0.7275859, -1.635378, 0.02745098, 1, 0, 1,
-0.452184, 0.8918476, -1.535429, 0.01960784, 1, 0, 1,
-0.4438782, 0.4384738, -1.612215, 0.01568628, 1, 0, 1,
-0.4433496, -1.077178, -2.815451, 0.007843138, 1, 0, 1,
-0.4425973, 0.4059567, -1.243251, 0.003921569, 1, 0, 1,
-0.4418945, 0.3805869, -1.226932, 0, 1, 0.003921569, 1,
-0.4416915, 0.1452469, 1.398905, 0, 1, 0.01176471, 1,
-0.4372293, 0.2984336, -0.4917337, 0, 1, 0.01568628, 1,
-0.4365684, -1.213251, -3.619458, 0, 1, 0.02352941, 1,
-0.4306831, -0.5514538, -2.456961, 0, 1, 0.02745098, 1,
-0.4279019, 0.1921841, -3.723582, 0, 1, 0.03529412, 1,
-0.4197263, 0.7163121, -0.6185222, 0, 1, 0.03921569, 1,
-0.4171524, -1.597498, -1.964874, 0, 1, 0.04705882, 1,
-0.4164006, 0.4390896, -2.684983, 0, 1, 0.05098039, 1,
-0.4127591, -1.371208, -2.070392, 0, 1, 0.05882353, 1,
-0.4121117, -1.418276, -5.074451, 0, 1, 0.0627451, 1,
-0.4115873, -0.7256983, 0.04162994, 0, 1, 0.07058824, 1,
-0.4060197, -0.9024355, -3.880603, 0, 1, 0.07450981, 1,
-0.4000803, 0.2061471, -1.790116, 0, 1, 0.08235294, 1,
-0.3980839, 0.917812, -0.4331519, 0, 1, 0.08627451, 1,
-0.3957125, 0.5420542, -1.835534, 0, 1, 0.09411765, 1,
-0.3917875, 1.024654, -0.6302149, 0, 1, 0.1019608, 1,
-0.3912927, -0.445366, -3.09116, 0, 1, 0.1058824, 1,
-0.3910578, -0.5821694, -0.6961288, 0, 1, 0.1137255, 1,
-0.3893132, -1.194145, -3.186413, 0, 1, 0.1176471, 1,
-0.3876983, 0.8637379, -1.685975, 0, 1, 0.1254902, 1,
-0.3855865, -0.722434, -2.539384, 0, 1, 0.1294118, 1,
-0.3842023, 0.2188136, -0.9608141, 0, 1, 0.1372549, 1,
-0.3810629, -0.3878381, -1.936933, 0, 1, 0.1411765, 1,
-0.3785779, 0.5865539, 0.7375093, 0, 1, 0.1490196, 1,
-0.375655, 0.7982905, -1.033269, 0, 1, 0.1529412, 1,
-0.3669294, -0.09697998, -2.378776, 0, 1, 0.1607843, 1,
-0.3653858, 0.3280505, -1.896926, 0, 1, 0.1647059, 1,
-0.363248, -0.9120088, -2.36516, 0, 1, 0.172549, 1,
-0.3630973, -0.8572344, -2.677963, 0, 1, 0.1764706, 1,
-0.360513, -1.08747, -2.865704, 0, 1, 0.1843137, 1,
-0.3591273, -1.287078, -4.009635, 0, 1, 0.1882353, 1,
-0.3570409, -0.6855209, -1.67299, 0, 1, 0.1960784, 1,
-0.3569081, -0.09198281, -1.903883, 0, 1, 0.2039216, 1,
-0.353061, -1.302194, -2.431141, 0, 1, 0.2078431, 1,
-0.3521962, -0.3906095, -3.491826, 0, 1, 0.2156863, 1,
-0.3448028, 0.1133283, -1.716884, 0, 1, 0.2196078, 1,
-0.3444367, -2.18097, -2.914607, 0, 1, 0.227451, 1,
-0.3406708, -0.2246634, -1.994059, 0, 1, 0.2313726, 1,
-0.3318449, 0.5808303, 0.4075937, 0, 1, 0.2392157, 1,
-0.3282989, -0.2704287, -2.560452, 0, 1, 0.2431373, 1,
-0.3277371, -1.25209, -1.904551, 0, 1, 0.2509804, 1,
-0.3274789, -1.02674, -3.45492, 0, 1, 0.254902, 1,
-0.3262294, 1.16381, -0.3849193, 0, 1, 0.2627451, 1,
-0.3254635, 2.08358, 1.763785, 0, 1, 0.2666667, 1,
-0.3245195, -0.8058707, -2.357712, 0, 1, 0.2745098, 1,
-0.3197332, 1.290498, 1.508856, 0, 1, 0.2784314, 1,
-0.3195627, 1.006452, -0.117535, 0, 1, 0.2862745, 1,
-0.3179072, 0.2180621, -0.7714455, 0, 1, 0.2901961, 1,
-0.3165361, -1.403972, -3.269124, 0, 1, 0.2980392, 1,
-0.314443, -0.1870178, 0.7606344, 0, 1, 0.3058824, 1,
-0.3002231, 2.015086, 1.649542, 0, 1, 0.3098039, 1,
-0.2957176, 1.517415, 2.130212, 0, 1, 0.3176471, 1,
-0.2935283, 0.9568017, -1.014273, 0, 1, 0.3215686, 1,
-0.293231, 1.262693, 1.34277, 0, 1, 0.3294118, 1,
-0.2912434, -0.6270924, -4.318166, 0, 1, 0.3333333, 1,
-0.289787, -0.4661281, -2.977057, 0, 1, 0.3411765, 1,
-0.2836884, 0.1935328, -0.6145515, 0, 1, 0.345098, 1,
-0.2807599, -0.01731223, -1.068833, 0, 1, 0.3529412, 1,
-0.2780494, -0.3542077, 0.7798434, 0, 1, 0.3568628, 1,
-0.277223, -0.6659833, -1.56839, 0, 1, 0.3647059, 1,
-0.2712483, 0.925137, -0.318132, 0, 1, 0.3686275, 1,
-0.2699333, 0.7483629, -1.23728, 0, 1, 0.3764706, 1,
-0.2695236, -1.397946, -2.534087, 0, 1, 0.3803922, 1,
-0.2660417, 0.03845234, -1.3147, 0, 1, 0.3882353, 1,
-0.2615583, -0.5381247, -4.249656, 0, 1, 0.3921569, 1,
-0.2596365, 0.9823695, 0.2885332, 0, 1, 0.4, 1,
-0.2584627, 1.12014, 0.104382, 0, 1, 0.4078431, 1,
-0.2576814, -0.9937868, -2.509533, 0, 1, 0.4117647, 1,
-0.2562146, 0.311634, 0.2591907, 0, 1, 0.4196078, 1,
-0.2546914, -0.1837903, -3.177114, 0, 1, 0.4235294, 1,
-0.2532855, 0.4462002, -2.474673, 0, 1, 0.4313726, 1,
-0.2443704, -0.4183804, -2.433533, 0, 1, 0.4352941, 1,
-0.2415264, 0.2111173, -1.490344, 0, 1, 0.4431373, 1,
-0.2410929, -2.277615, -3.616171, 0, 1, 0.4470588, 1,
-0.2385454, -0.9852816, -5.214976, 0, 1, 0.454902, 1,
-0.2383642, 1.117339, 1.150501, 0, 1, 0.4588235, 1,
-0.2358531, 1.042272, -0.2075267, 0, 1, 0.4666667, 1,
-0.2332958, 1.390923, -1.021656, 0, 1, 0.4705882, 1,
-0.2296712, -0.2847811, 0.2466677, 0, 1, 0.4784314, 1,
-0.2283718, -1.707574, -1.847335, 0, 1, 0.4823529, 1,
-0.2282566, 0.305493, -0.349372, 0, 1, 0.4901961, 1,
-0.2166215, -1.488818, -2.453462, 0, 1, 0.4941176, 1,
-0.2073055, 1.296883, -1.663172, 0, 1, 0.5019608, 1,
-0.2063547, -1.492409, -1.116435, 0, 1, 0.509804, 1,
-0.2062502, 0.05522052, -0.5052525, 0, 1, 0.5137255, 1,
-0.2002399, 0.901243, 0.5983151, 0, 1, 0.5215687, 1,
-0.1983919, -0.7228554, -3.638855, 0, 1, 0.5254902, 1,
-0.1981947, -0.2722991, -2.53279, 0, 1, 0.5333334, 1,
-0.1981211, 2.392857, 0.9828191, 0, 1, 0.5372549, 1,
-0.1926278, 1.686927, 0.5107331, 0, 1, 0.5450981, 1,
-0.1871566, 2.059968, -1.145693, 0, 1, 0.5490196, 1,
-0.1815371, -0.652799, -4.900514, 0, 1, 0.5568628, 1,
-0.1815193, 0.7847512, 0.5066971, 0, 1, 0.5607843, 1,
-0.1771129, -1.303575, -3.924056, 0, 1, 0.5686275, 1,
-0.1694769, 0.269618, -1.742475, 0, 1, 0.572549, 1,
-0.1689878, 0.7254338, 1.685109, 0, 1, 0.5803922, 1,
-0.167348, 0.6868599, -2.178892, 0, 1, 0.5843138, 1,
-0.1634965, -1.152113, -2.911021, 0, 1, 0.5921569, 1,
-0.1613447, 0.3790014, -1.239377, 0, 1, 0.5960785, 1,
-0.157274, -0.3372872, -1.480029, 0, 1, 0.6039216, 1,
-0.1553968, 0.4109861, -0.9033923, 0, 1, 0.6117647, 1,
-0.1531429, -1.13331, -5.846523, 0, 1, 0.6156863, 1,
-0.1491645, -1.276519, -3.790083, 0, 1, 0.6235294, 1,
-0.1489733, 1.054429, -0.6464518, 0, 1, 0.627451, 1,
-0.146238, 0.6342468, -0.735485, 0, 1, 0.6352941, 1,
-0.1455158, -0.9207172, -4.347685, 0, 1, 0.6392157, 1,
-0.1412095, -0.1947791, -1.660336, 0, 1, 0.6470588, 1,
-0.1292198, 0.9612694, 0.8304183, 0, 1, 0.6509804, 1,
-0.1292015, 1.231191, -0.6627727, 0, 1, 0.6588235, 1,
-0.1240846, 2.127617, 0.7286462, 0, 1, 0.6627451, 1,
-0.1233341, -0.4434961, -3.809176, 0, 1, 0.6705883, 1,
-0.1188327, 0.8437773, -1.095449, 0, 1, 0.6745098, 1,
-0.1162172, -0.5755338, -2.133329, 0, 1, 0.682353, 1,
-0.1132222, 0.9083968, 0.003529941, 0, 1, 0.6862745, 1,
-0.1124915, 1.567071, 0.2857227, 0, 1, 0.6941177, 1,
-0.1089415, 0.5665971, 0.1155562, 0, 1, 0.7019608, 1,
-0.1081468, -0.7843481, -1.151771, 0, 1, 0.7058824, 1,
-0.1080308, 0.5558464, 0.2797164, 0, 1, 0.7137255, 1,
-0.1031372, -1.508979, -4.034951, 0, 1, 0.7176471, 1,
-0.1025421, -1.118105, -3.554057, 0, 1, 0.7254902, 1,
-0.1000714, 1.104401, -0.5641116, 0, 1, 0.7294118, 1,
-0.09671284, -1.316802, -3.806053, 0, 1, 0.7372549, 1,
-0.09643742, -0.7857125, -3.742695, 0, 1, 0.7411765, 1,
-0.09617277, 0.4184491, 0.3409189, 0, 1, 0.7490196, 1,
-0.09592874, 0.07099178, -3.115118, 0, 1, 0.7529412, 1,
-0.0861828, 1.048859, -0.6631853, 0, 1, 0.7607843, 1,
-0.08460622, -0.7961399, -1.585948, 0, 1, 0.7647059, 1,
-0.08408485, -0.1008768, -2.624701, 0, 1, 0.772549, 1,
-0.08396375, -0.6468537, -1.093384, 0, 1, 0.7764706, 1,
-0.07865626, 0.4003885, -0.2311208, 0, 1, 0.7843137, 1,
-0.07521164, -1.032251, -4.707947, 0, 1, 0.7882353, 1,
-0.06972738, -0.8944983, -3.363939, 0, 1, 0.7960784, 1,
-0.06900783, -1.691265, -2.961424, 0, 1, 0.8039216, 1,
-0.06603467, 1.164884, 0.8071916, 0, 1, 0.8078431, 1,
-0.06557395, 0.2862752, -1.174612, 0, 1, 0.8156863, 1,
-0.06352604, -0.4271208, -1.466169, 0, 1, 0.8196079, 1,
-0.06157209, -1.004463, -2.549333, 0, 1, 0.827451, 1,
-0.0562381, 1.820061, -1.320338, 0, 1, 0.8313726, 1,
-0.05469603, -0.5386419, -2.95887, 0, 1, 0.8392157, 1,
-0.05307948, 1.835341, 0.2895247, 0, 1, 0.8431373, 1,
-0.05246528, -0.7952499, -2.636049, 0, 1, 0.8509804, 1,
-0.05190941, -0.6108734, -3.379293, 0, 1, 0.854902, 1,
-0.04914743, 0.5786361, 0.5491418, 0, 1, 0.8627451, 1,
-0.04286456, 0.3577713, -0.5843661, 0, 1, 0.8666667, 1,
-0.03540139, -1.787875, -3.727018, 0, 1, 0.8745098, 1,
-0.0353982, -1.218329, -2.942674, 0, 1, 0.8784314, 1,
-0.03059359, -0.5624567, -4.510933, 0, 1, 0.8862745, 1,
-0.02756901, 0.8308269, 0.7006241, 0, 1, 0.8901961, 1,
-0.0273285, -0.7733236, -3.32323, 0, 1, 0.8980392, 1,
-0.02571792, 0.4907221, -0.2085294, 0, 1, 0.9058824, 1,
-0.02324969, 0.6210473, 0.1232477, 0, 1, 0.9098039, 1,
-0.02267572, -0.9113146, -3.713089, 0, 1, 0.9176471, 1,
-0.01809715, 0.117777, 0.9633301, 0, 1, 0.9215686, 1,
-0.01662176, -0.3063875, -3.69531, 0, 1, 0.9294118, 1,
-0.01643745, -0.8316245, -3.593479, 0, 1, 0.9333333, 1,
-0.01642231, 0.4129495, 1.428361, 0, 1, 0.9411765, 1,
-0.01420414, 1.051787, -1.77133, 0, 1, 0.945098, 1,
-0.01321915, -1.095207, -0.7500653, 0, 1, 0.9529412, 1,
-0.007418202, -1.286119, -0.05057314, 0, 1, 0.9568627, 1,
-0.006821082, 0.2476465, 1.014574, 0, 1, 0.9647059, 1,
-0.005662853, 0.3305737, -1.197842, 0, 1, 0.9686275, 1,
-0.005305444, -2.107472, -2.809494, 0, 1, 0.9764706, 1,
-0.003202938, -0.2370665, -3.320927, 0, 1, 0.9803922, 1,
-0.0005613752, 0.5672032, -0.4938606, 0, 1, 0.9882353, 1,
0.005544072, 0.9213363, 0.2874486, 0, 1, 0.9921569, 1,
0.01316454, 0.394046, -0.5168743, 0, 1, 1, 1,
0.01388436, 2.102535, -1.429584, 0, 0.9921569, 1, 1,
0.01463418, -0.3934136, 3.433779, 0, 0.9882353, 1, 1,
0.01546269, 1.059944, -0.7904786, 0, 0.9803922, 1, 1,
0.01731624, 1.202788, -0.7767961, 0, 0.9764706, 1, 1,
0.02066166, 0.9626197, 0.5282961, 0, 0.9686275, 1, 1,
0.02319769, -0.2572421, 2.913518, 0, 0.9647059, 1, 1,
0.03320105, 0.9105759, 0.6344934, 0, 0.9568627, 1, 1,
0.03327799, 0.3018689, -0.1082401, 0, 0.9529412, 1, 1,
0.03928411, 1.510358, -2.107847, 0, 0.945098, 1, 1,
0.04303283, -1.392328, 3.31118, 0, 0.9411765, 1, 1,
0.04338482, -0.06520102, 1.329066, 0, 0.9333333, 1, 1,
0.04702261, 0.1772441, -0.04242699, 0, 0.9294118, 1, 1,
0.05093047, 2.94521, -1.386486, 0, 0.9215686, 1, 1,
0.05236994, 0.2279416, 0.4939965, 0, 0.9176471, 1, 1,
0.05760111, -1.246628, 4.133443, 0, 0.9098039, 1, 1,
0.05829643, 0.6965984, 1.12187, 0, 0.9058824, 1, 1,
0.06087853, 1.964804, 0.2502734, 0, 0.8980392, 1, 1,
0.06344116, 0.5108785, 0.3364085, 0, 0.8901961, 1, 1,
0.06428748, 1.716512, -0.3582316, 0, 0.8862745, 1, 1,
0.06750146, -0.01171068, 3.460894, 0, 0.8784314, 1, 1,
0.07031085, -0.9259927, 4.909346, 0, 0.8745098, 1, 1,
0.07630967, -1.201436, 4.443429, 0, 0.8666667, 1, 1,
0.07720935, 0.5452734, 1.509512, 0, 0.8627451, 1, 1,
0.07904201, -1.499943, 2.883825, 0, 0.854902, 1, 1,
0.07962048, -1.864314, 2.770799, 0, 0.8509804, 1, 1,
0.08589895, 0.3837291, 0.9717228, 0, 0.8431373, 1, 1,
0.08867422, -0.005091713, 1.54153, 0, 0.8392157, 1, 1,
0.08930091, -0.2924457, 2.038445, 0, 0.8313726, 1, 1,
0.09018922, -0.307094, 1.566459, 0, 0.827451, 1, 1,
0.09044904, 1.37564, -0.4030912, 0, 0.8196079, 1, 1,
0.09122238, 0.6035486, 2.138361, 0, 0.8156863, 1, 1,
0.09322888, -0.5256044, 1.937733, 0, 0.8078431, 1, 1,
0.0985321, 1.04195, -1.040082, 0, 0.8039216, 1, 1,
0.1009898, 0.3942243, 2.316231, 0, 0.7960784, 1, 1,
0.1032764, -0.2701387, 4.592451, 0, 0.7882353, 1, 1,
0.1034928, -0.1338444, 2.362802, 0, 0.7843137, 1, 1,
0.103952, -0.6238299, 3.799184, 0, 0.7764706, 1, 1,
0.106675, -0.6640018, 3.237299, 0, 0.772549, 1, 1,
0.1076737, -1.584879, 1.469358, 0, 0.7647059, 1, 1,
0.107835, -0.3557532, 1.078564, 0, 0.7607843, 1, 1,
0.1092869, -1.590123, 4.477875, 0, 0.7529412, 1, 1,
0.1202146, -0.2837054, 2.303199, 0, 0.7490196, 1, 1,
0.1214929, -0.8671249, 1.506447, 0, 0.7411765, 1, 1,
0.1217559, -0.3114098, 4.17034, 0, 0.7372549, 1, 1,
0.1245002, -1.353054, 4.031998, 0, 0.7294118, 1, 1,
0.1262931, -0.5087872, 2.304525, 0, 0.7254902, 1, 1,
0.1265225, 0.702366, 0.6843061, 0, 0.7176471, 1, 1,
0.1268428, 0.6744211, 0.2739867, 0, 0.7137255, 1, 1,
0.1289206, -0.4336451, 2.261825, 0, 0.7058824, 1, 1,
0.1306586, -1.828162, 1.769094, 0, 0.6980392, 1, 1,
0.1310311, 0.4140203, -0.3752314, 0, 0.6941177, 1, 1,
0.1320298, -1.167439, 2.572846, 0, 0.6862745, 1, 1,
0.133487, 0.5189168, -0.7461262, 0, 0.682353, 1, 1,
0.1369203, -0.2835686, 2.866367, 0, 0.6745098, 1, 1,
0.1396836, -0.2763792, 1.32715, 0, 0.6705883, 1, 1,
0.1400416, 0.3496867, -0.265048, 0, 0.6627451, 1, 1,
0.1447661, 0.179056, 2.660043, 0, 0.6588235, 1, 1,
0.1466806, 1.258706, -1.211413, 0, 0.6509804, 1, 1,
0.1492087, -0.8719729, 3.593547, 0, 0.6470588, 1, 1,
0.1524615, -0.2847633, 3.380126, 0, 0.6392157, 1, 1,
0.1547959, -0.00568905, 1.308103, 0, 0.6352941, 1, 1,
0.1618655, -0.3839105, 3.042885, 0, 0.627451, 1, 1,
0.1632855, -1.023511, 3.255026, 0, 0.6235294, 1, 1,
0.1650534, 1.538665, -0.6370463, 0, 0.6156863, 1, 1,
0.1651325, -0.6862986, 3.527359, 0, 0.6117647, 1, 1,
0.1710661, 1.827122, -0.549715, 0, 0.6039216, 1, 1,
0.1743985, -0.02983469, 1.407749, 0, 0.5960785, 1, 1,
0.1770275, -1.042626, 2.799498, 0, 0.5921569, 1, 1,
0.1819509, -2.434177, 3.788678, 0, 0.5843138, 1, 1,
0.1868536, -1.475544, 4.122623, 0, 0.5803922, 1, 1,
0.1877048, -1.570067, 3.647993, 0, 0.572549, 1, 1,
0.1899721, 0.1229309, 0.9429233, 0, 0.5686275, 1, 1,
0.190552, 1.057133, -0.2664962, 0, 0.5607843, 1, 1,
0.1929482, -0.734151, 2.724382, 0, 0.5568628, 1, 1,
0.193302, 0.01922401, 0.1253529, 0, 0.5490196, 1, 1,
0.193773, 1.348565, 0.332078, 0, 0.5450981, 1, 1,
0.195641, 0.5194222, 0.01099291, 0, 0.5372549, 1, 1,
0.2002525, -0.409214, 3.209751, 0, 0.5333334, 1, 1,
0.2033919, -0.4918849, 3.32193, 0, 0.5254902, 1, 1,
0.210232, -0.1978236, 2.821773, 0, 0.5215687, 1, 1,
0.2219888, -1.803609, 1.321616, 0, 0.5137255, 1, 1,
0.2250737, -0.9626052, 3.096793, 0, 0.509804, 1, 1,
0.2262197, -0.2890503, 1.79174, 0, 0.5019608, 1, 1,
0.2280118, 0.6345266, -1.408112, 0, 0.4941176, 1, 1,
0.2302035, -0.1565254, 2.751962, 0, 0.4901961, 1, 1,
0.239389, 0.4199988, 2.875635, 0, 0.4823529, 1, 1,
0.2397102, 0.08858258, -0.1482816, 0, 0.4784314, 1, 1,
0.2402756, -0.6527827, 3.075578, 0, 0.4705882, 1, 1,
0.2444706, -1.269607, 1.839321, 0, 0.4666667, 1, 1,
0.2459118, -0.7633209, 3.960181, 0, 0.4588235, 1, 1,
0.2481295, -1.065234, 2.649263, 0, 0.454902, 1, 1,
0.2542565, 0.3622641, -0.07699512, 0, 0.4470588, 1, 1,
0.2576045, -0.1808298, 0.4872455, 0, 0.4431373, 1, 1,
0.2577852, -0.9590809, 3.957016, 0, 0.4352941, 1, 1,
0.2634072, 1.211802, 0.8053706, 0, 0.4313726, 1, 1,
0.2658093, 0.05301751, 1.770505, 0, 0.4235294, 1, 1,
0.2666419, -0.986832, 5.736545, 0, 0.4196078, 1, 1,
0.2673135, -1.474744, 1.520571, 0, 0.4117647, 1, 1,
0.2709396, 1.311703, 0.9158098, 0, 0.4078431, 1, 1,
0.2751646, -1.652774, 2.024411, 0, 0.4, 1, 1,
0.2780789, 0.7477998, -0.7653812, 0, 0.3921569, 1, 1,
0.2848757, -0.1274085, 3.164178, 0, 0.3882353, 1, 1,
0.2876317, 1.197491, 0.9651419, 0, 0.3803922, 1, 1,
0.2967187, -0.4202715, 2.483277, 0, 0.3764706, 1, 1,
0.304617, 0.1214668, 1.936607, 0, 0.3686275, 1, 1,
0.306943, 0.4543422, 1.178104, 0, 0.3647059, 1, 1,
0.3090622, -1.0536, 2.615341, 0, 0.3568628, 1, 1,
0.3120415, 0.138074, -0.00380058, 0, 0.3529412, 1, 1,
0.3149437, 1.735073, -1.34405, 0, 0.345098, 1, 1,
0.3173703, 0.3205545, 0.5095435, 0, 0.3411765, 1, 1,
0.3177787, 0.335072, 0.3322324, 0, 0.3333333, 1, 1,
0.3183961, 0.4050153, -0.5478086, 0, 0.3294118, 1, 1,
0.3185667, -0.4135859, 3.233868, 0, 0.3215686, 1, 1,
0.3250543, 0.1658539, -0.233691, 0, 0.3176471, 1, 1,
0.3296414, 0.6567281, 1.878973, 0, 0.3098039, 1, 1,
0.3334957, -1.634398, 2.579827, 0, 0.3058824, 1, 1,
0.3362884, -0.257992, 1.252304, 0, 0.2980392, 1, 1,
0.3387732, -0.5886177, 3.496132, 0, 0.2901961, 1, 1,
0.3391455, -0.363575, 2.308305, 0, 0.2862745, 1, 1,
0.3442123, 1.72467, 0.3516868, 0, 0.2784314, 1, 1,
0.3446327, -0.6037535, 1.631699, 0, 0.2745098, 1, 1,
0.3449918, -0.07147449, 1.823675, 0, 0.2666667, 1, 1,
0.3517905, 0.4238467, 1.023791, 0, 0.2627451, 1, 1,
0.3559934, -1.680361, 3.530808, 0, 0.254902, 1, 1,
0.3561204, 2.187846, -1.074731, 0, 0.2509804, 1, 1,
0.3561803, 0.5259926, -0.3740527, 0, 0.2431373, 1, 1,
0.3608912, -0.4336618, 4.647863, 0, 0.2392157, 1, 1,
0.3610179, -0.9392805, 2.149931, 0, 0.2313726, 1, 1,
0.3612782, 1.794294, 0.2277082, 0, 0.227451, 1, 1,
0.3668182, -1.870098, 3.787101, 0, 0.2196078, 1, 1,
0.3674355, 0.3855259, 0.5198365, 0, 0.2156863, 1, 1,
0.3675243, 0.331329, 0.9352996, 0, 0.2078431, 1, 1,
0.3744563, -1.461463, 1.968103, 0, 0.2039216, 1, 1,
0.3754351, -0.04547415, 1.122174, 0, 0.1960784, 1, 1,
0.3780125, -0.4167187, 1.304667, 0, 0.1882353, 1, 1,
0.3798692, 1.084571, -0.4785575, 0, 0.1843137, 1, 1,
0.3922879, -0.5211185, 2.828936, 0, 0.1764706, 1, 1,
0.3925922, 0.04792051, 0.5959883, 0, 0.172549, 1, 1,
0.396013, 0.9301828, -0.2431958, 0, 0.1647059, 1, 1,
0.3971341, -1.654803, 1.11991, 0, 0.1607843, 1, 1,
0.3998417, 0.5455981, 0.7868582, 0, 0.1529412, 1, 1,
0.4017314, 0.1389703, 2.067152, 0, 0.1490196, 1, 1,
0.4032954, 0.3339103, -0.9378217, 0, 0.1411765, 1, 1,
0.4040708, 1.870116, 1.042899, 0, 0.1372549, 1, 1,
0.4045919, 0.01007013, 2.111392, 0, 0.1294118, 1, 1,
0.4101222, -1.731388, 2.495831, 0, 0.1254902, 1, 1,
0.4138181, 0.06831295, 1.911424, 0, 0.1176471, 1, 1,
0.4165094, -0.8190103, 1.991592, 0, 0.1137255, 1, 1,
0.4184817, -0.6913202, 2.990955, 0, 0.1058824, 1, 1,
0.4245075, -0.8622215, 2.66494, 0, 0.09803922, 1, 1,
0.4257523, -0.9059578, 2.094854, 0, 0.09411765, 1, 1,
0.4325562, 0.4209734, -0.01959291, 0, 0.08627451, 1, 1,
0.4381409, 0.3106946, 1.298545, 0, 0.08235294, 1, 1,
0.4385582, 0.4560902, 1.326515, 0, 0.07450981, 1, 1,
0.439027, 0.9198154, 2.031824, 0, 0.07058824, 1, 1,
0.4441663, 0.7089031, 2.026273, 0, 0.0627451, 1, 1,
0.4465307, -0.4057019, 3.667693, 0, 0.05882353, 1, 1,
0.4465986, 0.8950449, 0.2386518, 0, 0.05098039, 1, 1,
0.4478056, -0.5585415, 2.935925, 0, 0.04705882, 1, 1,
0.465169, 0.8094923, 1.410167, 0, 0.03921569, 1, 1,
0.4658608, 0.2081001, -0.2266863, 0, 0.03529412, 1, 1,
0.4687373, 0.1406562, 1.129527, 0, 0.02745098, 1, 1,
0.4701496, 2.921316, -0.6071028, 0, 0.02352941, 1, 1,
0.4703737, 0.1157544, 2.154956, 0, 0.01568628, 1, 1,
0.4732918, 0.05206807, 1.867165, 0, 0.01176471, 1, 1,
0.4766153, 1.826597, -1.047352, 0, 0.003921569, 1, 1,
0.4803646, -0.3472081, 3.180764, 0.003921569, 0, 1, 1,
0.48157, 1.490284, 1.053209, 0.007843138, 0, 1, 1,
0.4817547, -1.813567, 1.777671, 0.01568628, 0, 1, 1,
0.4823325, -2.418698, 3.644874, 0.01960784, 0, 1, 1,
0.4830482, -1.025009, 3.331991, 0.02745098, 0, 1, 1,
0.4871673, -0.2437665, 2.292074, 0.03137255, 0, 1, 1,
0.4879917, -2.076167, 2.530797, 0.03921569, 0, 1, 1,
0.488909, 0.3930539, -0.2284349, 0.04313726, 0, 1, 1,
0.501686, 0.5377149, -0.7630519, 0.05098039, 0, 1, 1,
0.5023499, 0.3246018, -0.5084603, 0.05490196, 0, 1, 1,
0.5031992, -0.6989158, 1.147055, 0.0627451, 0, 1, 1,
0.5042556, 1.691424, -1.58785, 0.06666667, 0, 1, 1,
0.5046113, -1.7469, 4.389018, 0.07450981, 0, 1, 1,
0.5163646, 0.5428663, 1.507304, 0.07843138, 0, 1, 1,
0.5190535, 0.4914227, 0.8192605, 0.08627451, 0, 1, 1,
0.5191398, 0.7450632, 0.6570742, 0.09019608, 0, 1, 1,
0.5233489, 0.2775556, 1.881058, 0.09803922, 0, 1, 1,
0.5233723, -0.4254363, 2.150539, 0.1058824, 0, 1, 1,
0.5233732, -0.3477567, 2.178165, 0.1098039, 0, 1, 1,
0.5247855, 1.57556, 0.3827544, 0.1176471, 0, 1, 1,
0.5250452, -2.193277, 3.463583, 0.1215686, 0, 1, 1,
0.5254396, -0.7284094, 2.482071, 0.1294118, 0, 1, 1,
0.5263132, 0.4841242, -0.5834477, 0.1333333, 0, 1, 1,
0.5298099, 0.4451742, 0.8817534, 0.1411765, 0, 1, 1,
0.5301141, 1.059058, -0.9726889, 0.145098, 0, 1, 1,
0.5324062, -1.895927, 4.314198, 0.1529412, 0, 1, 1,
0.5348266, 0.5642565, 1.390727, 0.1568628, 0, 1, 1,
0.5386668, -1.397931, 2.919004, 0.1647059, 0, 1, 1,
0.5436881, 0.5234411, 0.6423357, 0.1686275, 0, 1, 1,
0.5462211, -0.6072403, 1.861362, 0.1764706, 0, 1, 1,
0.5468327, -0.8031911, 2.550137, 0.1803922, 0, 1, 1,
0.5491084, -0.7518926, -0.1818817, 0.1882353, 0, 1, 1,
0.5498209, 0.2188549, 0.8185896, 0.1921569, 0, 1, 1,
0.551525, -0.1539318, 2.494107, 0.2, 0, 1, 1,
0.5518216, -1.45014, 2.173922, 0.2078431, 0, 1, 1,
0.5542616, 0.5490685, 1.200929, 0.2117647, 0, 1, 1,
0.5549663, -0.07176846, 2.162957, 0.2196078, 0, 1, 1,
0.5558289, -1.086871, 3.054158, 0.2235294, 0, 1, 1,
0.5575871, -0.724224, 1.701504, 0.2313726, 0, 1, 1,
0.5597113, 0.05629022, 0.3887641, 0.2352941, 0, 1, 1,
0.5603828, -0.01534392, 3.689973, 0.2431373, 0, 1, 1,
0.5648772, 2.534604, 0.9563066, 0.2470588, 0, 1, 1,
0.571793, 0.6192062, 0.3888879, 0.254902, 0, 1, 1,
0.5748643, -0.8539938, 3.529608, 0.2588235, 0, 1, 1,
0.5755292, -2.389896, 2.971217, 0.2666667, 0, 1, 1,
0.5796257, 0.05994529, 1.319595, 0.2705882, 0, 1, 1,
0.5805688, 0.52222, 0.8842744, 0.2784314, 0, 1, 1,
0.5837348, 0.3795876, 1.515907, 0.282353, 0, 1, 1,
0.5837898, 1.641641, 0.7932073, 0.2901961, 0, 1, 1,
0.5850894, -0.8444875, 3.866622, 0.2941177, 0, 1, 1,
0.5906146, 0.8767297, 1.23426, 0.3019608, 0, 1, 1,
0.5930232, -1.649204, 4.597771, 0.3098039, 0, 1, 1,
0.595069, 0.9727744, 1.764379, 0.3137255, 0, 1, 1,
0.5975528, 0.9268826, 0.5386514, 0.3215686, 0, 1, 1,
0.6017125, 0.2966225, -0.0631327, 0.3254902, 0, 1, 1,
0.6018678, -0.8037166, 0.4511785, 0.3333333, 0, 1, 1,
0.602152, -0.5227652, 4.018698, 0.3372549, 0, 1, 1,
0.6021894, 0.7339478, 0.6486514, 0.345098, 0, 1, 1,
0.6034611, -0.5794729, 2.452435, 0.3490196, 0, 1, 1,
0.6069795, 0.4596978, 1.844926, 0.3568628, 0, 1, 1,
0.6072139, -0.9297559, 2.946319, 0.3607843, 0, 1, 1,
0.609127, 0.7142738, 0.1496411, 0.3686275, 0, 1, 1,
0.6142627, 0.3760154, 1.628152, 0.372549, 0, 1, 1,
0.6173725, 0.7229928, 0.683265, 0.3803922, 0, 1, 1,
0.6210008, -0.9698324, 4.055504, 0.3843137, 0, 1, 1,
0.6219006, 1.264385, 2.990692, 0.3921569, 0, 1, 1,
0.6220539, 0.680798, 2.278038, 0.3960784, 0, 1, 1,
0.6261806, 2.111207, 1.449824, 0.4039216, 0, 1, 1,
0.6288263, 2.037416, 0.585804, 0.4117647, 0, 1, 1,
0.6340299, -2.219582, 5.078581, 0.4156863, 0, 1, 1,
0.6354589, -0.2378284, 1.147209, 0.4235294, 0, 1, 1,
0.6358799, 0.9271827, 0.6655683, 0.427451, 0, 1, 1,
0.6521475, -1.124034, 1.111087, 0.4352941, 0, 1, 1,
0.6539222, 0.8869956, 0.873151, 0.4392157, 0, 1, 1,
0.6551353, -0.2119146, 2.30926, 0.4470588, 0, 1, 1,
0.6655825, -0.5585524, 2.463053, 0.4509804, 0, 1, 1,
0.6671242, -1.134053, 1.771303, 0.4588235, 0, 1, 1,
0.6676842, -0.0124801, 2.089429, 0.4627451, 0, 1, 1,
0.6689844, -1.142318, 3.86146, 0.4705882, 0, 1, 1,
0.6724291, 0.3922559, 1.243057, 0.4745098, 0, 1, 1,
0.6739171, 1.055963, 0.02275139, 0.4823529, 0, 1, 1,
0.6752579, -0.4146698, 2.261776, 0.4862745, 0, 1, 1,
0.6796135, -0.3798744, 1.85411, 0.4941176, 0, 1, 1,
0.6843023, -2.36055, 3.225958, 0.5019608, 0, 1, 1,
0.6846299, -1.706123, 2.934383, 0.5058824, 0, 1, 1,
0.695861, -0.9393591, 5.168798, 0.5137255, 0, 1, 1,
0.6990481, -0.4522054, -0.1448332, 0.5176471, 0, 1, 1,
0.7071426, 0.4986635, 0.4253494, 0.5254902, 0, 1, 1,
0.7121819, 0.574089, 2.618032, 0.5294118, 0, 1, 1,
0.7230455, 0.6902966, 1.391211, 0.5372549, 0, 1, 1,
0.7242558, 1.02045, 1.406798, 0.5411765, 0, 1, 1,
0.725261, -1.491837, 2.208798, 0.5490196, 0, 1, 1,
0.7264813, 0.04509101, 0.3293592, 0.5529412, 0, 1, 1,
0.7286331, 0.4369939, 2.169493, 0.5607843, 0, 1, 1,
0.7337791, -0.5051379, 3.42852, 0.5647059, 0, 1, 1,
0.7444162, -0.1363104, 2.991613, 0.572549, 0, 1, 1,
0.748275, 0.2235271, 1.124982, 0.5764706, 0, 1, 1,
0.7521951, -0.655059, 0.9632462, 0.5843138, 0, 1, 1,
0.7545373, 0.4114239, 0.003949413, 0.5882353, 0, 1, 1,
0.7573323, 0.4855966, 0.8893654, 0.5960785, 0, 1, 1,
0.7573629, -0.07114265, 1.622051, 0.6039216, 0, 1, 1,
0.7577732, -0.2730834, 0.4968183, 0.6078432, 0, 1, 1,
0.7595821, -0.1554687, 2.292431, 0.6156863, 0, 1, 1,
0.764542, -0.06159865, 2.308277, 0.6196079, 0, 1, 1,
0.7713193, 0.3398771, 2.184127, 0.627451, 0, 1, 1,
0.7746038, -1.466725, 3.15542, 0.6313726, 0, 1, 1,
0.7793857, -0.574672, 2.834186, 0.6392157, 0, 1, 1,
0.7801281, 0.5701861, 0.5340983, 0.6431373, 0, 1, 1,
0.7861257, -0.08636058, 1.566752, 0.6509804, 0, 1, 1,
0.7870477, 0.612803, 0.3025614, 0.654902, 0, 1, 1,
0.7941418, -0.3173834, 2.405753, 0.6627451, 0, 1, 1,
0.7962701, 0.4616648, 2.594332, 0.6666667, 0, 1, 1,
0.7982783, 0.05168583, 0.1474135, 0.6745098, 0, 1, 1,
0.8221338, 1.23732, 1.330673, 0.6784314, 0, 1, 1,
0.8273652, -1.227976, 3.709403, 0.6862745, 0, 1, 1,
0.8329609, 0.3020862, 1.948373, 0.6901961, 0, 1, 1,
0.8375149, -1.924652, 4.221738, 0.6980392, 0, 1, 1,
0.838284, -0.3435793, 1.50841, 0.7058824, 0, 1, 1,
0.840552, -1.270441, 2.346125, 0.7098039, 0, 1, 1,
0.8442672, -0.9523644, 2.648884, 0.7176471, 0, 1, 1,
0.8449486, -0.6937028, 2.589277, 0.7215686, 0, 1, 1,
0.8460843, -0.401213, 2.51166, 0.7294118, 0, 1, 1,
0.848096, -0.5342636, 2.659896, 0.7333333, 0, 1, 1,
0.8492532, 1.780177, 0.9450373, 0.7411765, 0, 1, 1,
0.8505868, -0.417799, 1.044845, 0.7450981, 0, 1, 1,
0.8514956, -0.1362971, 2.829578, 0.7529412, 0, 1, 1,
0.8552598, 0.1537194, 1.151063, 0.7568628, 0, 1, 1,
0.855907, 0.9339131, -0.9166327, 0.7647059, 0, 1, 1,
0.8616449, 0.8895972, -1.515201, 0.7686275, 0, 1, 1,
0.8740436, -0.03686679, 1.43293, 0.7764706, 0, 1, 1,
0.8830577, -1.047821, 3.762248, 0.7803922, 0, 1, 1,
0.8884003, -0.5848117, 3.234974, 0.7882353, 0, 1, 1,
0.8935149, -0.1206818, -0.3676136, 0.7921569, 0, 1, 1,
0.8975873, 0.3262959, 0.6933932, 0.8, 0, 1, 1,
0.9032991, -1.155912, 4.267062, 0.8078431, 0, 1, 1,
0.9044834, -1.800542, 2.595806, 0.8117647, 0, 1, 1,
0.9109755, 1.067823, 1.056285, 0.8196079, 0, 1, 1,
0.9120527, -2.542604, 2.500822, 0.8235294, 0, 1, 1,
0.914688, 0.05798846, 2.435632, 0.8313726, 0, 1, 1,
0.9157031, -0.6407697, 2.315029, 0.8352941, 0, 1, 1,
0.9178166, 0.07963809, 0.8607916, 0.8431373, 0, 1, 1,
0.9222023, 0.06799716, 3.04491, 0.8470588, 0, 1, 1,
0.9225747, 0.7727908, -0.345296, 0.854902, 0, 1, 1,
0.9264763, 0.6676883, 3.07257, 0.8588235, 0, 1, 1,
0.9265487, -1.294432, 2.934756, 0.8666667, 0, 1, 1,
0.9311394, 0.2796217, 3.572248, 0.8705882, 0, 1, 1,
0.9325503, 0.4843008, -0.9706596, 0.8784314, 0, 1, 1,
0.9442685, 0.009769063, 2.029348, 0.8823529, 0, 1, 1,
0.9466586, -1.036059, 2.193252, 0.8901961, 0, 1, 1,
0.9486212, 2.050527, 0.6130837, 0.8941177, 0, 1, 1,
0.9510318, -0.8124261, 2.382464, 0.9019608, 0, 1, 1,
0.9541302, -0.2163056, 2.275738, 0.9098039, 0, 1, 1,
0.9549462, 0.5002127, 0.33383, 0.9137255, 0, 1, 1,
0.9575396, 1.210342, -0.4387117, 0.9215686, 0, 1, 1,
0.9603461, 1.917628, 1.207286, 0.9254902, 0, 1, 1,
0.9771425, -0.02121775, 0.8590451, 0.9333333, 0, 1, 1,
0.9814606, 1.721314, 0.6535631, 0.9372549, 0, 1, 1,
0.9849638, 0.9503005, 2.810119, 0.945098, 0, 1, 1,
0.9889368, 0.01094678, 1.549827, 0.9490196, 0, 1, 1,
0.9958071, 0.06710107, 0.4060307, 0.9568627, 0, 1, 1,
1.003427, 0.4255306, 3.131054, 0.9607843, 0, 1, 1,
1.013032, 0.1017679, 2.493325, 0.9686275, 0, 1, 1,
1.018296, 1.65007, 0.6705572, 0.972549, 0, 1, 1,
1.018692, 0.8751565, 1.251804, 0.9803922, 0, 1, 1,
1.02055, -0.2657832, 0.4338989, 0.9843137, 0, 1, 1,
1.027161, -0.01934523, 3.193861, 0.9921569, 0, 1, 1,
1.02778, -0.1307249, -0.05183278, 0.9960784, 0, 1, 1,
1.033103, -0.0621143, 1.190752, 1, 0, 0.9960784, 1,
1.036724, -0.006611154, 1.660763, 1, 0, 0.9882353, 1,
1.038046, -0.2625505, 2.166655, 1, 0, 0.9843137, 1,
1.043591, 0.2744857, 1.539185, 1, 0, 0.9764706, 1,
1.046415, -0.5698387, 2.193755, 1, 0, 0.972549, 1,
1.056773, 0.4549707, 2.48698, 1, 0, 0.9647059, 1,
1.058702, 1.117606, 2.20153, 1, 0, 0.9607843, 1,
1.059372, -0.07546388, -1.537244, 1, 0, 0.9529412, 1,
1.06636, -1.211779, 4.833328, 1, 0, 0.9490196, 1,
1.070042, 1.015146, 0.883857, 1, 0, 0.9411765, 1,
1.071744, -1.222393, 2.410104, 1, 0, 0.9372549, 1,
1.074771, 0.4312174, 2.265379, 1, 0, 0.9294118, 1,
1.086858, -0.1907766, 1.446511, 1, 0, 0.9254902, 1,
1.087609, 0.3539029, 1.020511, 1, 0, 0.9176471, 1,
1.093056, -0.5139776, 4.114875, 1, 0, 0.9137255, 1,
1.095668, 1.361246, 0.04813924, 1, 0, 0.9058824, 1,
1.099167, 0.1024562, 2.686327, 1, 0, 0.9019608, 1,
1.101967, 0.4776899, 2.587228, 1, 0, 0.8941177, 1,
1.102586, -0.112187, 2.589972, 1, 0, 0.8862745, 1,
1.104025, -1.287678, 3.619973, 1, 0, 0.8823529, 1,
1.107484, -0.9593435, 2.331625, 1, 0, 0.8745098, 1,
1.108597, -3.177423, 1.947197, 1, 0, 0.8705882, 1,
1.111005, -1.689283, 1.159015, 1, 0, 0.8627451, 1,
1.114566, 2.636681, -0.8840958, 1, 0, 0.8588235, 1,
1.11793, -0.1723551, 0.3474558, 1, 0, 0.8509804, 1,
1.122814, -0.9894916, 1.99431, 1, 0, 0.8470588, 1,
1.124562, -0.6547543, 2.934964, 1, 0, 0.8392157, 1,
1.1254, 1.020125, 0.9090319, 1, 0, 0.8352941, 1,
1.130166, -0.9914182, 1.182873, 1, 0, 0.827451, 1,
1.136672, 0.3716708, 1.368323, 1, 0, 0.8235294, 1,
1.144842, -1.051131, 1.77164, 1, 0, 0.8156863, 1,
1.144955, -1.429097, 2.38486, 1, 0, 0.8117647, 1,
1.146904, 0.7341977, 1.44407, 1, 0, 0.8039216, 1,
1.148124, -0.4359958, 1.080254, 1, 0, 0.7960784, 1,
1.152647, 2.099708, -0.8393264, 1, 0, 0.7921569, 1,
1.154191, -1.658254, 1.591825, 1, 0, 0.7843137, 1,
1.155734, 1.590102, 0.7868413, 1, 0, 0.7803922, 1,
1.156449, 0.09518976, 2.202151, 1, 0, 0.772549, 1,
1.169279, 0.2659408, 0.4505501, 1, 0, 0.7686275, 1,
1.180326, -3.499478, 2.165522, 1, 0, 0.7607843, 1,
1.185541, 1.99681, 0.5137844, 1, 0, 0.7568628, 1,
1.185847, 0.222135, 1.236807, 1, 0, 0.7490196, 1,
1.192364, -2.085366, 0.3517295, 1, 0, 0.7450981, 1,
1.193003, 1.220656, 0.7683854, 1, 0, 0.7372549, 1,
1.195284, -0.05075238, 0.7373371, 1, 0, 0.7333333, 1,
1.203788, -1.244893, 2.705015, 1, 0, 0.7254902, 1,
1.204872, -0.8307812, 2.804171, 1, 0, 0.7215686, 1,
1.207843, -0.5388325, 2.165409, 1, 0, 0.7137255, 1,
1.211287, 0.3419143, 1.303279, 1, 0, 0.7098039, 1,
1.217639, 0.3627374, 2.003226, 1, 0, 0.7019608, 1,
1.221455, 0.6504841, 0.953043, 1, 0, 0.6941177, 1,
1.240141, 1.088471, 0.4352419, 1, 0, 0.6901961, 1,
1.240674, -1.563325, 2.777225, 1, 0, 0.682353, 1,
1.24977, 0.4549479, 2.141659, 1, 0, 0.6784314, 1,
1.249843, 0.3955951, 3.451654, 1, 0, 0.6705883, 1,
1.250592, -0.01919263, 3.493225, 1, 0, 0.6666667, 1,
1.252795, 2.260526, 0.2825623, 1, 0, 0.6588235, 1,
1.254426, 0.2947987, 2.86783, 1, 0, 0.654902, 1,
1.256341, -0.9557344, 1.210328, 1, 0, 0.6470588, 1,
1.257311, 0.1044955, -0.5559447, 1, 0, 0.6431373, 1,
1.272816, 0.5805014, 0.2161108, 1, 0, 0.6352941, 1,
1.273744, 0.1144257, 0.9421519, 1, 0, 0.6313726, 1,
1.277143, -0.1607993, 2.112281, 1, 0, 0.6235294, 1,
1.278746, 1.110516, 2.679498, 1, 0, 0.6196079, 1,
1.281572, -0.4556792, 1.775363, 1, 0, 0.6117647, 1,
1.284628, -1.512363, 1.451524, 1, 0, 0.6078432, 1,
1.28677, 0.3260134, 0.4520917, 1, 0, 0.6, 1,
1.288874, 0.4904307, 2.409957, 1, 0, 0.5921569, 1,
1.292885, 0.3566695, 1.974887, 1, 0, 0.5882353, 1,
1.29362, -0.1370164, 2.404783, 1, 0, 0.5803922, 1,
1.325456, -0.1793144, 1.352669, 1, 0, 0.5764706, 1,
1.33163, -0.2639817, 2.267745, 1, 0, 0.5686275, 1,
1.333889, -0.08211565, 1.416053, 1, 0, 0.5647059, 1,
1.335037, 1.704019, 0.534345, 1, 0, 0.5568628, 1,
1.33628, -0.0599534, 1.167123, 1, 0, 0.5529412, 1,
1.342136, 0.1691329, 0.2245886, 1, 0, 0.5450981, 1,
1.344776, 1.073194, 1.289772, 1, 0, 0.5411765, 1,
1.347997, -0.3541973, 0.06100558, 1, 0, 0.5333334, 1,
1.350226, -0.7742322, 1.45291, 1, 0, 0.5294118, 1,
1.363629, 0.6604879, 1.316395, 1, 0, 0.5215687, 1,
1.36522, 0.02440705, 0.426792, 1, 0, 0.5176471, 1,
1.369438, 1.028008, -0.1041571, 1, 0, 0.509804, 1,
1.389274, -0.7760234, 1.271125, 1, 0, 0.5058824, 1,
1.389314, -1.399128, 2.334646, 1, 0, 0.4980392, 1,
1.389391, -0.7225795, 2.262618, 1, 0, 0.4901961, 1,
1.393582, 0.8204756, 1.09064, 1, 0, 0.4862745, 1,
1.399492, -1.792775, 1.741108, 1, 0, 0.4784314, 1,
1.408039, 0.9527605, 1.30262, 1, 0, 0.4745098, 1,
1.418771, 0.1664226, 1.018072, 1, 0, 0.4666667, 1,
1.440894, 0.2704678, 0.5458333, 1, 0, 0.4627451, 1,
1.446416, -1.057507, 3.094792, 1, 0, 0.454902, 1,
1.452462, -0.6928493, 0.9724322, 1, 0, 0.4509804, 1,
1.454323, 3.100557, -0.3509935, 1, 0, 0.4431373, 1,
1.456395, -0.2629929, 0.5286576, 1, 0, 0.4392157, 1,
1.462311, -0.09374408, 0.0750502, 1, 0, 0.4313726, 1,
1.466156, -0.7014204, 2.741418, 1, 0, 0.427451, 1,
1.471092, 0.4162184, 2.7607, 1, 0, 0.4196078, 1,
1.503446, -0.1346381, 1.533596, 1, 0, 0.4156863, 1,
1.51562, 1.838688, 0.6289311, 1, 0, 0.4078431, 1,
1.529938, 0.5005211, 0.9959419, 1, 0, 0.4039216, 1,
1.534165, -0.9313849, 3.734711, 1, 0, 0.3960784, 1,
1.538285, 0.9632414, 2.157587, 1, 0, 0.3882353, 1,
1.545298, -0.2346157, 2.811455, 1, 0, 0.3843137, 1,
1.546497, 0.7499925, -0.1114661, 1, 0, 0.3764706, 1,
1.547016, 0.6194561, 0.2580296, 1, 0, 0.372549, 1,
1.551859, -1.682536, 2.062386, 1, 0, 0.3647059, 1,
1.59443, 0.375467, -0.1111249, 1, 0, 0.3607843, 1,
1.623723, 0.303386, 2.835049, 1, 0, 0.3529412, 1,
1.627611, 0.9867278, 2.71021, 1, 0, 0.3490196, 1,
1.654581, 0.4881522, 1.822531, 1, 0, 0.3411765, 1,
1.670437, -2.095351, 3.079247, 1, 0, 0.3372549, 1,
1.67241, -1.023988, 1.622425, 1, 0, 0.3294118, 1,
1.675072, -1.953106, 2.311398, 1, 0, 0.3254902, 1,
1.67674, 0.9677252, -0.1729414, 1, 0, 0.3176471, 1,
1.703276, 0.9184108, 1.619641, 1, 0, 0.3137255, 1,
1.706018, -1.779312, 3.259133, 1, 0, 0.3058824, 1,
1.706583, 0.5948047, 0.9765086, 1, 0, 0.2980392, 1,
1.710203, 0.6944454, 1.827142, 1, 0, 0.2941177, 1,
1.717071, -0.1788813, 2.237947, 1, 0, 0.2862745, 1,
1.719262, -1.019552, 0.6979679, 1, 0, 0.282353, 1,
1.719998, 1.131733, -0.5663997, 1, 0, 0.2745098, 1,
1.727084, -0.3217659, 2.034219, 1, 0, 0.2705882, 1,
1.757016, 2.271907, 0.6214615, 1, 0, 0.2627451, 1,
1.75809, 2.119005, -0.004027199, 1, 0, 0.2588235, 1,
1.77622, -0.8568857, 1.064145, 1, 0, 0.2509804, 1,
1.785925, -1.127273, 2.992095, 1, 0, 0.2470588, 1,
1.78779, 0.6389778, 1.624827, 1, 0, 0.2392157, 1,
1.797013, 1.148277, -0.2486101, 1, 0, 0.2352941, 1,
1.79923, 0.3340152, 2.423109, 1, 0, 0.227451, 1,
1.805863, -0.2310414, 2.074936, 1, 0, 0.2235294, 1,
1.811125, 0.2192053, 1.241025, 1, 0, 0.2156863, 1,
1.811928, 0.4473995, 0.388462, 1, 0, 0.2117647, 1,
1.82148, 1.506777, -0.09345391, 1, 0, 0.2039216, 1,
1.837702, 1.576765, 1.097638, 1, 0, 0.1960784, 1,
1.839652, -1.319635, 1.217237, 1, 0, 0.1921569, 1,
1.842166, 0.2469924, 0.8612869, 1, 0, 0.1843137, 1,
1.847561, 1.568844, 0.6662734, 1, 0, 0.1803922, 1,
1.863111, -0.0504101, 1.115834, 1, 0, 0.172549, 1,
1.882683, -1.670165, 1.516395, 1, 0, 0.1686275, 1,
1.900582, -1.106125, 1.210811, 1, 0, 0.1607843, 1,
1.91206, -0.3609178, 1.916117, 1, 0, 0.1568628, 1,
1.927119, 0.4121616, 2.839676, 1, 0, 0.1490196, 1,
1.929635, -1.095091, 1.033764, 1, 0, 0.145098, 1,
1.930398, 0.3350064, 2.445245, 1, 0, 0.1372549, 1,
1.931936, -0.6344175, 0.7950974, 1, 0, 0.1333333, 1,
1.935012, -0.1298501, 3.385919, 1, 0, 0.1254902, 1,
1.936365, 0.3651532, 0.5847919, 1, 0, 0.1215686, 1,
1.947788, -0.4977899, 3.182055, 1, 0, 0.1137255, 1,
1.954471, -0.8936568, 2.603749, 1, 0, 0.1098039, 1,
1.958362, 1.36106, 0.4797301, 1, 0, 0.1019608, 1,
1.964906, 0.009912549, 1.087808, 1, 0, 0.09411765, 1,
1.984141, -1.217194, 2.064057, 1, 0, 0.09019608, 1,
2.037315, -0.3267867, 2.406524, 1, 0, 0.08235294, 1,
2.078554, -0.694473, 1.654986, 1, 0, 0.07843138, 1,
2.078695, 1.947271, 2.893075, 1, 0, 0.07058824, 1,
2.107832, 0.6651496, -1.626941, 1, 0, 0.06666667, 1,
2.122858, -0.8993339, 0.8825563, 1, 0, 0.05882353, 1,
2.129124, 0.9287921, -0.1088162, 1, 0, 0.05490196, 1,
2.170232, 1.070729, 0.8594823, 1, 0, 0.04705882, 1,
2.317378, 0.02594814, 0.1527395, 1, 0, 0.04313726, 1,
2.398566, 0.1509583, 1.703549, 1, 0, 0.03529412, 1,
2.670847, 2.189059, -0.928042, 1, 0, 0.03137255, 1,
2.736335, -0.8070651, 2.211235, 1, 0, 0.02352941, 1,
2.752039, 0.7898489, 1.569119, 1, 0, 0.01960784, 1,
3.008998, -1.315242, -0.537425, 1, 0, 0.01176471, 1,
3.214167, 0.8668299, 2.185625, 1, 0, 0.007843138, 1
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
-0.182372, -4.618184, -7.809853, 0, -0.5, 0.5, 0.5,
-0.182372, -4.618184, -7.809853, 1, -0.5, 0.5, 0.5,
-0.182372, -4.618184, -7.809853, 1, 1.5, 0.5, 0.5,
-0.182372, -4.618184, -7.809853, 0, 1.5, 0.5, 0.5
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
-4.730338, -0.1994604, -7.809853, 0, -0.5, 0.5, 0.5,
-4.730338, -0.1994604, -7.809853, 1, -0.5, 0.5, 0.5,
-4.730338, -0.1994604, -7.809853, 1, 1.5, 0.5, 0.5,
-4.730338, -0.1994604, -7.809853, 0, 1.5, 0.5, 0.5
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
-4.730338, -4.618184, -0.0549891, 0, -0.5, 0.5, 0.5,
-4.730338, -4.618184, -0.0549891, 1, -0.5, 0.5, 0.5,
-4.730338, -4.618184, -0.0549891, 1, 1.5, 0.5, 0.5,
-4.730338, -4.618184, -0.0549891, 0, 1.5, 0.5, 0.5
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
-3, -3.598478, -6.020269,
3, -3.598478, -6.020269,
-3, -3.598478, -6.020269,
-3, -3.768429, -6.318533,
-2, -3.598478, -6.020269,
-2, -3.768429, -6.318533,
-1, -3.598478, -6.020269,
-1, -3.768429, -6.318533,
0, -3.598478, -6.020269,
0, -3.768429, -6.318533,
1, -3.598478, -6.020269,
1, -3.768429, -6.318533,
2, -3.598478, -6.020269,
2, -3.768429, -6.318533,
3, -3.598478, -6.020269,
3, -3.768429, -6.318533
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
-3, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
-3, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
-3, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
-3, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
-2, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
-2, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
-2, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
-2, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
-1, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
-1, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
-1, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
-1, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
0, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
0, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
0, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
0, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
1, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
1, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
1, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
1, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
2, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
2, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
2, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
2, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5,
3, -4.108331, -6.915061, 0, -0.5, 0.5, 0.5,
3, -4.108331, -6.915061, 1, -0.5, 0.5, 0.5,
3, -4.108331, -6.915061, 1, 1.5, 0.5, 0.5,
3, -4.108331, -6.915061, 0, 1.5, 0.5, 0.5
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
-3.680808, -3, -6.020269,
-3.680808, 3, -6.020269,
-3.680808, -3, -6.020269,
-3.855729, -3, -6.318533,
-3.680808, -2, -6.020269,
-3.855729, -2, -6.318533,
-3.680808, -1, -6.020269,
-3.855729, -1, -6.318533,
-3.680808, 0, -6.020269,
-3.855729, 0, -6.318533,
-3.680808, 1, -6.020269,
-3.855729, 1, -6.318533,
-3.680808, 2, -6.020269,
-3.855729, 2, -6.318533,
-3.680808, 3, -6.020269,
-3.855729, 3, -6.318533
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
-4.205573, -3, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, -3, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, -3, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, -3, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, -2, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, -2, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, -2, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, -2, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, -1, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, -1, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, -1, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, -1, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, 0, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, 0, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, 0, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, 0, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, 1, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, 1, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, 1, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, 1, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, 2, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, 2, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, 2, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, 2, -6.915061, 0, 1.5, 0.5, 0.5,
-4.205573, 3, -6.915061, 0, -0.5, 0.5, 0.5,
-4.205573, 3, -6.915061, 1, -0.5, 0.5, 0.5,
-4.205573, 3, -6.915061, 1, 1.5, 0.5, 0.5,
-4.205573, 3, -6.915061, 0, 1.5, 0.5, 0.5
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
-3.680808, -3.598478, -4,
-3.680808, -3.598478, 4,
-3.680808, -3.598478, -4,
-3.855729, -3.768429, -4,
-3.680808, -3.598478, -2,
-3.855729, -3.768429, -2,
-3.680808, -3.598478, 0,
-3.855729, -3.768429, 0,
-3.680808, -3.598478, 2,
-3.855729, -3.768429, 2,
-3.680808, -3.598478, 4,
-3.855729, -3.768429, 4
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
-4.205573, -4.108331, -4, 0, -0.5, 0.5, 0.5,
-4.205573, -4.108331, -4, 1, -0.5, 0.5, 0.5,
-4.205573, -4.108331, -4, 1, 1.5, 0.5, 0.5,
-4.205573, -4.108331, -4, 0, 1.5, 0.5, 0.5,
-4.205573, -4.108331, -2, 0, -0.5, 0.5, 0.5,
-4.205573, -4.108331, -2, 1, -0.5, 0.5, 0.5,
-4.205573, -4.108331, -2, 1, 1.5, 0.5, 0.5,
-4.205573, -4.108331, -2, 0, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 0, 0, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 0, 1, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 0, 1, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 0, 0, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 2, 0, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 2, 1, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 2, 1, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 2, 0, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 4, 0, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 4, 1, -0.5, 0.5, 0.5,
-4.205573, -4.108331, 4, 1, 1.5, 0.5, 0.5,
-4.205573, -4.108331, 4, 0, 1.5, 0.5, 0.5
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
-3.680808, -3.598478, -6.020269,
-3.680808, 3.199558, -6.020269,
-3.680808, -3.598478, 5.910291,
-3.680808, 3.199558, 5.910291,
-3.680808, -3.598478, -6.020269,
-3.680808, -3.598478, 5.910291,
-3.680808, 3.199558, -6.020269,
-3.680808, 3.199558, 5.910291,
-3.680808, -3.598478, -6.020269,
3.316064, -3.598478, -6.020269,
-3.680808, -3.598478, 5.910291,
3.316064, -3.598478, 5.910291,
-3.680808, 3.199558, -6.020269,
3.316064, 3.199558, -6.020269,
-3.680808, 3.199558, 5.910291,
3.316064, 3.199558, 5.910291,
3.316064, -3.598478, -6.020269,
3.316064, 3.199558, -6.020269,
3.316064, -3.598478, 5.910291,
3.316064, 3.199558, 5.910291,
3.316064, -3.598478, -6.020269,
3.316064, -3.598478, 5.910291,
3.316064, 3.199558, -6.020269,
3.316064, 3.199558, 5.910291
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
var radius = 8.229328;
var distance = 36.61321;
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
mvMatrix.translate( 0.182372, 0.1994604, 0.0549891 );
mvMatrix.scale( 1.27167, 1.308865, 0.7457916 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.61321);
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
1-dodecylguanidinium<-read.table("1-dodecylguanidinium.xyz")
```

```
## Error in read.table("1-dodecylguanidinium.xyz"): no lines available in input
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
-3.578911, -0.6583943, -1.13586, 0, 0, 1, 1, 1,
-3.376491, 1.432296, -0.5601186, 1, 0, 0, 1, 1,
-2.830812, 0.7633861, -3.356803, 1, 0, 0, 1, 1,
-2.781326, 1.936755, -0.1694819, 1, 0, 0, 1, 1,
-2.697845, 0.8076723, -1.44663, 1, 0, 0, 1, 1,
-2.606402, -0.8454379, -2.321998, 1, 0, 0, 1, 1,
-2.543741, 0.5761124, -1.315848, 0, 0, 0, 1, 1,
-2.503657, -0.8159514, -0.6235773, 0, 0, 0, 1, 1,
-2.309059, -1.960424, -2.61269, 0, 0, 0, 1, 1,
-2.295436, 0.6224748, 1.432884, 0, 0, 0, 1, 1,
-2.236976, 1.604029, -1.228067, 0, 0, 0, 1, 1,
-2.229941, 0.2394392, -2.120671, 0, 0, 0, 1, 1,
-2.207715, -0.4043481, -1.321763, 0, 0, 0, 1, 1,
-2.157189, -0.4847931, -0.2378966, 1, 1, 1, 1, 1,
-2.150587, -1.637072, -1.446172, 1, 1, 1, 1, 1,
-2.128768, 0.8248992, -0.7582749, 1, 1, 1, 1, 1,
-2.102142, 0.8985764, -0.3748253, 1, 1, 1, 1, 1,
-2.098235, 0.621235, -2.082054, 1, 1, 1, 1, 1,
-2.02409, 1.391731, -1.761347, 1, 1, 1, 1, 1,
-2.012183, -0.1203589, -2.176545, 1, 1, 1, 1, 1,
-1.983344, 0.8115005, -0.3785075, 1, 1, 1, 1, 1,
-1.970702, 0.9052081, -2.282774, 1, 1, 1, 1, 1,
-1.961766, 2.101138, -0.8354492, 1, 1, 1, 1, 1,
-1.954995, -0.02751543, -3.153339, 1, 1, 1, 1, 1,
-1.933078, 1.04195, -0.7217395, 1, 1, 1, 1, 1,
-1.874883, -0.4982653, -0.7740334, 1, 1, 1, 1, 1,
-1.866489, -1.042601, -2.557036, 1, 1, 1, 1, 1,
-1.855767, 0.6686938, -0.3637392, 1, 1, 1, 1, 1,
-1.854979, 0.02596901, -2.520076, 0, 0, 1, 1, 1,
-1.85146, -0.2881343, -0.5032287, 1, 0, 0, 1, 1,
-1.814421, -1.173123, -4.786024, 1, 0, 0, 1, 1,
-1.803174, 1.07621, 2.049388, 1, 0, 0, 1, 1,
-1.784704, 0.3663839, -1.863501, 1, 0, 0, 1, 1,
-1.776781, 0.01548161, -2.766972, 1, 0, 0, 1, 1,
-1.775235, 0.4402064, -1.352262, 0, 0, 0, 1, 1,
-1.764479, -1.521415, -2.281923, 0, 0, 0, 1, 1,
-1.751118, -1.234104, -1.13837, 0, 0, 0, 1, 1,
-1.750222, -1.156646, 0.7248354, 0, 0, 0, 1, 1,
-1.740072, 0.3708903, -1.719512, 0, 0, 0, 1, 1,
-1.726548, 0.9516969, -0.8273155, 0, 0, 0, 1, 1,
-1.707736, -0.07833473, -1.159051, 0, 0, 0, 1, 1,
-1.704, -0.9753966, -3.464145, 1, 1, 1, 1, 1,
-1.703067, 0.2084819, -2.253474, 1, 1, 1, 1, 1,
-1.702191, -1.579961, -2.925742, 1, 1, 1, 1, 1,
-1.69676, -0.4991131, -2.320717, 1, 1, 1, 1, 1,
-1.691389, -0.3534702, -2.060968, 1, 1, 1, 1, 1,
-1.675864, 0.110611, -3.097079, 1, 1, 1, 1, 1,
-1.66659, -2.096648, -1.243984, 1, 1, 1, 1, 1,
-1.647559, 1.346415, -0.6306261, 1, 1, 1, 1, 1,
-1.641254, 0.6724559, -1.18944, 1, 1, 1, 1, 1,
-1.633852, 0.6690869, -1.429565, 1, 1, 1, 1, 1,
-1.630753, 0.3793971, -2.331252, 1, 1, 1, 1, 1,
-1.628197, 2.596358, 0.4980453, 1, 1, 1, 1, 1,
-1.618456, -0.158839, -2.768803, 1, 1, 1, 1, 1,
-1.599056, 0.627633, -0.7213755, 1, 1, 1, 1, 1,
-1.587103, -0.3300468, -3.105938, 1, 1, 1, 1, 1,
-1.551473, 0.4207597, -1.066692, 0, 0, 1, 1, 1,
-1.543624, -0.109019, -3.198678, 1, 0, 0, 1, 1,
-1.541156, -0.4859455, -1.431094, 1, 0, 0, 1, 1,
-1.540489, -3.012062, -3.922787, 1, 0, 0, 1, 1,
-1.532007, 0.6342951, -2.750867, 1, 0, 0, 1, 1,
-1.531296, -0.3025928, -0.8388935, 1, 0, 0, 1, 1,
-1.519514, 1.06414, -0.7719482, 0, 0, 0, 1, 1,
-1.51431, 0.3791784, -0.5056074, 0, 0, 0, 1, 1,
-1.510041, -0.3119019, -1.628601, 0, 0, 0, 1, 1,
-1.508204, -1.716515, -2.568204, 0, 0, 0, 1, 1,
-1.500124, 0.6331947, 0.1485647, 0, 0, 0, 1, 1,
-1.489639, -0.1161707, -0.2193313, 0, 0, 0, 1, 1,
-1.488478, 0.2785391, -2.048531, 0, 0, 0, 1, 1,
-1.485338, -0.4117666, -2.780144, 1, 1, 1, 1, 1,
-1.48104, -1.023468, -0.9728734, 1, 1, 1, 1, 1,
-1.450843, -1.206424, -2.340904, 1, 1, 1, 1, 1,
-1.450628, 1.895315, 0.2388741, 1, 1, 1, 1, 1,
-1.442427, 0.4152463, -0.2963719, 1, 1, 1, 1, 1,
-1.440012, 2.339131, -0.647927, 1, 1, 1, 1, 1,
-1.43973, -0.3411443, -3.377414, 1, 1, 1, 1, 1,
-1.429227, 1.239561, -0.0597352, 1, 1, 1, 1, 1,
-1.421354, 1.023165, -1.362554, 1, 1, 1, 1, 1,
-1.411348, 0.3071555, -1.521465, 1, 1, 1, 1, 1,
-1.409558, 1.18612, -1.81038, 1, 1, 1, 1, 1,
-1.379411, 0.460629, -1.410475, 1, 1, 1, 1, 1,
-1.377867, 0.7234643, -1.344637, 1, 1, 1, 1, 1,
-1.373767, -0.1476981, -0.9851212, 1, 1, 1, 1, 1,
-1.371712, 1.895038, 0.4007857, 1, 1, 1, 1, 1,
-1.360095, 0.8685585, -2.323231, 0, 0, 1, 1, 1,
-1.357033, -0.7121262, -3.001823, 1, 0, 0, 1, 1,
-1.356796, 0.7774744, -1.158634, 1, 0, 0, 1, 1,
-1.356148, -0.1894462, -0.2066526, 1, 0, 0, 1, 1,
-1.349858, 0.1807092, -2.051014, 1, 0, 0, 1, 1,
-1.34207, -0.08136191, -2.60763, 1, 0, 0, 1, 1,
-1.338527, 0.002275488, -0.2352766, 0, 0, 0, 1, 1,
-1.337866, 0.7958536, -0.9063731, 0, 0, 0, 1, 1,
-1.325137, 1.045289, -0.8107973, 0, 0, 0, 1, 1,
-1.320906, 1.477923, -0.8065723, 0, 0, 0, 1, 1,
-1.315324, -1.174551, -0.7148772, 0, 0, 0, 1, 1,
-1.314008, 0.8061296, 0.1669405, 0, 0, 0, 1, 1,
-1.310968, 0.4659828, -0.8910418, 0, 0, 0, 1, 1,
-1.290767, -1.682489, -2.660705, 1, 1, 1, 1, 1,
-1.290114, 0.438363, -0.5746284, 1, 1, 1, 1, 1,
-1.270345, 0.644639, -1.038427, 1, 1, 1, 1, 1,
-1.258382, -0.9376648, -0.8686695, 1, 1, 1, 1, 1,
-1.254351, -2.790974, -2.182647, 1, 1, 1, 1, 1,
-1.25177, 0.2279785, -1.53301, 1, 1, 1, 1, 1,
-1.249988, 0.4846331, -1.693634, 1, 1, 1, 1, 1,
-1.238958, -0.2874358, -0.7281407, 1, 1, 1, 1, 1,
-1.235188, 0.5272043, -2.155277, 1, 1, 1, 1, 1,
-1.232211, 0.85818, -2.660446, 1, 1, 1, 1, 1,
-1.230847, 1.067083, -1.704026, 1, 1, 1, 1, 1,
-1.227964, -0.9649659, -3.475213, 1, 1, 1, 1, 1,
-1.226516, 0.6219385, -2.009736, 1, 1, 1, 1, 1,
-1.220324, -1.372948, -1.214447, 1, 1, 1, 1, 1,
-1.216734, -1.380043, -3.093588, 1, 1, 1, 1, 1,
-1.215078, -0.2696022, -2.611705, 0, 0, 1, 1, 1,
-1.213458, -0.4439119, -3.049596, 1, 0, 0, 1, 1,
-1.20347, 0.165552, -1.844467, 1, 0, 0, 1, 1,
-1.202291, -0.7037279, -0.6694568, 1, 0, 0, 1, 1,
-1.202087, -1.275653, -1.886339, 1, 0, 0, 1, 1,
-1.196615, 0.8605102, -2.625554, 1, 0, 0, 1, 1,
-1.192398, 0.2151667, -0.6783988, 0, 0, 0, 1, 1,
-1.188659, -0.1758559, -1.367316, 0, 0, 0, 1, 1,
-1.185966, 0.5125741, -2.70588, 0, 0, 0, 1, 1,
-1.173612, 0.640039, -1.157519, 0, 0, 0, 1, 1,
-1.168484, 1.278412, -1.395652, 0, 0, 0, 1, 1,
-1.162029, 1.633914, 1.610827, 0, 0, 0, 1, 1,
-1.160075, 0.1272213, -1.935288, 0, 0, 0, 1, 1,
-1.159079, 2.581323, 0.004965623, 1, 1, 1, 1, 1,
-1.15792, -0.8867996, -1.335964, 1, 1, 1, 1, 1,
-1.157128, -0.127188, -1.941212, 1, 1, 1, 1, 1,
-1.153816, -0.4503729, -2.20246, 1, 1, 1, 1, 1,
-1.135598, 0.4283714, -2.137021, 1, 1, 1, 1, 1,
-1.135169, -1.372147, -2.950782, 1, 1, 1, 1, 1,
-1.130735, 0.007964212, -1.353466, 1, 1, 1, 1, 1,
-1.128629, -0.7246722, -1.828232, 1, 1, 1, 1, 1,
-1.120453, -0.8669388, -2.518858, 1, 1, 1, 1, 1,
-1.116482, -0.3513344, -3.013668, 1, 1, 1, 1, 1,
-1.116019, 1.323547, -0.9826287, 1, 1, 1, 1, 1,
-1.114251, -0.2332534, -1.682967, 1, 1, 1, 1, 1,
-1.111051, 0.5980939, -2.266115, 1, 1, 1, 1, 1,
-1.109526, -0.5233505, -2.290449, 1, 1, 1, 1, 1,
-1.102362, 0.1483098, -1.137061, 1, 1, 1, 1, 1,
-1.097087, 0.3520609, -0.0491164, 0, 0, 1, 1, 1,
-1.094724, -1.360359, -1.584206, 1, 0, 0, 1, 1,
-1.068732, 0.5403649, -2.964627, 1, 0, 0, 1, 1,
-1.053782, -0.5825679, -2.344154, 1, 0, 0, 1, 1,
-1.047103, -0.6869694, -3.104559, 1, 0, 0, 1, 1,
-1.046988, -1.334835, -2.771253, 1, 0, 0, 1, 1,
-1.044896, -1.338854, -1.224404, 0, 0, 0, 1, 1,
-1.040699, -0.4765177, -1.58874, 0, 0, 0, 1, 1,
-1.033394, 0.3818174, -1.330456, 0, 0, 0, 1, 1,
-1.026797, 0.6256714, -1.948529, 0, 0, 0, 1, 1,
-1.026053, -0.3114205, -1.713392, 0, 0, 0, 1, 1,
-1.025205, 0.1634537, -0.9453378, 0, 0, 0, 1, 1,
-1.025145, 2.694758, -0.2606392, 0, 0, 0, 1, 1,
-1.02447, -1.079459, -3.120025, 1, 1, 1, 1, 1,
-1.010316, -0.3447709, -0.153136, 1, 1, 1, 1, 1,
-1.002547, -0.317606, -3.101084, 1, 1, 1, 1, 1,
-0.999247, -0.6637289, -0.3643954, 1, 1, 1, 1, 1,
-0.9989034, -1.186932, -2.291067, 1, 1, 1, 1, 1,
-0.9988814, 0.6840776, -1.144378, 1, 1, 1, 1, 1,
-0.991145, 0.6735971, 0.381394, 1, 1, 1, 1, 1,
-0.9894272, 0.6906503, -1.052937, 1, 1, 1, 1, 1,
-0.9840371, -0.9443256, -3.140991, 1, 1, 1, 1, 1,
-0.9788365, 0.5345406, -0.4679389, 1, 1, 1, 1, 1,
-0.9661595, 0.4711759, -0.1041315, 1, 1, 1, 1, 1,
-0.9656593, -0.4177993, -1.740645, 1, 1, 1, 1, 1,
-0.9594411, -0.8090852, -1.48302, 1, 1, 1, 1, 1,
-0.9569961, 1.412168, -1.232816, 1, 1, 1, 1, 1,
-0.9482247, -2.114676, -2.116693, 1, 1, 1, 1, 1,
-0.9451517, -0.6332296, -4.886978, 0, 0, 1, 1, 1,
-0.9447109, 0.3168383, -2.485093, 1, 0, 0, 1, 1,
-0.9397794, 0.8711682, -0.2782104, 1, 0, 0, 1, 1,
-0.9312418, -1.459357, -3.275294, 1, 0, 0, 1, 1,
-0.9297227, 0.7369642, -0.3668746, 1, 0, 0, 1, 1,
-0.9271027, -2.161696, -1.889304, 1, 0, 0, 1, 1,
-0.9222277, 0.3520306, -1.233188, 0, 0, 0, 1, 1,
-0.914283, 0.636521, -1.232867, 0, 0, 0, 1, 1,
-0.9120778, 0.9068623, 0.7312243, 0, 0, 0, 1, 1,
-0.9111831, 2.368163, -0.4389812, 0, 0, 0, 1, 1,
-0.90866, -1.574932, -2.625813, 0, 0, 0, 1, 1,
-0.9046882, -1.160761, -2.261284, 0, 0, 0, 1, 1,
-0.9040055, -0.1682298, 0.03839995, 0, 0, 0, 1, 1,
-0.901421, 0.04149844, -0.9541046, 1, 1, 1, 1, 1,
-0.9003054, 0.403778, -0.7619714, 1, 1, 1, 1, 1,
-0.8910028, -1.280275, -1.776462, 1, 1, 1, 1, 1,
-0.8903106, 0.443094, 0.1804157, 1, 1, 1, 1, 1,
-0.8892939, 0.1733783, -2.636018, 1, 1, 1, 1, 1,
-0.8828534, -1.024004, -1.989708, 1, 1, 1, 1, 1,
-0.8825181, 0.9911307, -1.075783, 1, 1, 1, 1, 1,
-0.8815563, 1.20473, -1.120873, 1, 1, 1, 1, 1,
-0.8791299, 1.728857, -0.7097605, 1, 1, 1, 1, 1,
-0.8785883, -0.0315402, 0.5367209, 1, 1, 1, 1, 1,
-0.8753178, 0.3056045, -1.75312, 1, 1, 1, 1, 1,
-0.8737315, 0.8960427, -2.396971, 1, 1, 1, 1, 1,
-0.8736765, 0.541576, -1.748382, 1, 1, 1, 1, 1,
-0.8736154, -0.302744, -0.9933722, 1, 1, 1, 1, 1,
-0.8698921, 0.528532, -1.773496, 1, 1, 1, 1, 1,
-0.862221, -1.090709, -2.535302, 0, 0, 1, 1, 1,
-0.8556936, -0.1081633, -1.755464, 1, 0, 0, 1, 1,
-0.8545105, -1.7512, -3.849995, 1, 0, 0, 1, 1,
-0.8538888, -0.8858763, -4.233394, 1, 0, 0, 1, 1,
-0.8491884, 1.208863, -0.9919972, 1, 0, 0, 1, 1,
-0.8423526, -0.4112487, -1.377447, 1, 0, 0, 1, 1,
-0.8422324, 0.9069238, -1.600474, 0, 0, 0, 1, 1,
-0.8390698, 1.060794, 0.655145, 0, 0, 0, 1, 1,
-0.837567, 0.5413301, -1.695943, 0, 0, 0, 1, 1,
-0.8131543, -0.669, -3.292823, 0, 0, 0, 1, 1,
-0.8125059, -0.2778853, -0.7722651, 0, 0, 0, 1, 1,
-0.8116572, -0.005937073, -2.968825, 0, 0, 0, 1, 1,
-0.8070186, 0.04668238, -1.384486, 0, 0, 0, 1, 1,
-0.8059537, -0.2132785, -2.476261, 1, 1, 1, 1, 1,
-0.8046016, -1.457266, -3.128601, 1, 1, 1, 1, 1,
-0.8045592, 1.209731, 1.603913, 1, 1, 1, 1, 1,
-0.7994172, 2.464385, 0.07596858, 1, 1, 1, 1, 1,
-0.7943201, 1.222842, 0.4056954, 1, 1, 1, 1, 1,
-0.7853958, -0.9833132, -2.609574, 1, 1, 1, 1, 1,
-0.7816795, 0.3061324, -0.9888542, 1, 1, 1, 1, 1,
-0.7791502, -0.6488298, -1.830537, 1, 1, 1, 1, 1,
-0.7788627, -1.247138, -0.4881947, 1, 1, 1, 1, 1,
-0.7726572, 0.1779159, 0.001948194, 1, 1, 1, 1, 1,
-0.7726274, -1.574543, -3.047207, 1, 1, 1, 1, 1,
-0.7690693, -0.6521711, -0.7040712, 1, 1, 1, 1, 1,
-0.7649561, -0.7346886, -3.101207, 1, 1, 1, 1, 1,
-0.7610791, -1.720139, -2.420428, 1, 1, 1, 1, 1,
-0.757637, -0.4682268, -1.565651, 1, 1, 1, 1, 1,
-0.7460169, 0.1802303, -1.345829, 0, 0, 1, 1, 1,
-0.7460008, 0.3107945, -0.7885122, 1, 0, 0, 1, 1,
-0.7443553, 0.4095187, -0.2846357, 1, 0, 0, 1, 1,
-0.7387854, -0.798455, -1.263879, 1, 0, 0, 1, 1,
-0.7371532, -0.2848128, -2.809992, 1, 0, 0, 1, 1,
-0.7081149, 0.629272, 0.6128638, 1, 0, 0, 1, 1,
-0.706931, 1.355665, -0.1314288, 0, 0, 0, 1, 1,
-0.7025712, -0.6809216, -4.135384, 0, 0, 0, 1, 1,
-0.6985416, 0.4446431, -2.739313, 0, 0, 0, 1, 1,
-0.6981375, 0.5401163, -1.200235, 0, 0, 0, 1, 1,
-0.6942651, 0.9912016, 0.6753106, 0, 0, 0, 1, 1,
-0.6918185, 0.1358501, -0.4144099, 0, 0, 0, 1, 1,
-0.6832498, 0.04697123, -2.570062, 0, 0, 0, 1, 1,
-0.67026, 0.3255474, -0.333429, 1, 1, 1, 1, 1,
-0.6690413, -0.5523705, -1.59173, 1, 1, 1, 1, 1,
-0.6672494, -0.2957925, -2.849865, 1, 1, 1, 1, 1,
-0.6670455, -1.292036, -2.280694, 1, 1, 1, 1, 1,
-0.6661119, 0.7239633, -0.111933, 1, 1, 1, 1, 1,
-0.6660892, 1.457962, -2.360816, 1, 1, 1, 1, 1,
-0.6638386, 0.2157408, -2.576915, 1, 1, 1, 1, 1,
-0.6629367, 0.2189796, -0.7108079, 1, 1, 1, 1, 1,
-0.6613365, -0.6231874, -2.829921, 1, 1, 1, 1, 1,
-0.659596, -0.1756946, -2.797706, 1, 1, 1, 1, 1,
-0.6594368, -1.701137, -2.28665, 1, 1, 1, 1, 1,
-0.6554243, 1.848137, 0.4121681, 1, 1, 1, 1, 1,
-0.6521831, -0.5034522, -2.253586, 1, 1, 1, 1, 1,
-0.6518382, -1.09454, -3.970081, 1, 1, 1, 1, 1,
-0.6492482, 0.3059943, -0.6019561, 1, 1, 1, 1, 1,
-0.6483698, -1.104601, -3.601101, 0, 0, 1, 1, 1,
-0.6448212, 1.039409, -0.3856125, 1, 0, 0, 1, 1,
-0.6381814, -1.076613, -2.58965, 1, 0, 0, 1, 1,
-0.6335139, -1.504599, -3.542733, 1, 0, 0, 1, 1,
-0.6296692, -0.6105213, -3.465423, 1, 0, 0, 1, 1,
-0.6272498, -0.1923038, -2.916317, 1, 0, 0, 1, 1,
-0.6251446, 0.03737059, -1.864938, 0, 0, 0, 1, 1,
-0.6231155, -0.7563105, -2.00993, 0, 0, 0, 1, 1,
-0.6217151, -0.2222755, -0.567623, 0, 0, 0, 1, 1,
-0.6187073, -0.122355, -3.103284, 0, 0, 0, 1, 1,
-0.6185435, -0.3842671, -1.732164, 0, 0, 0, 1, 1,
-0.6131713, -0.7911109, -1.989068, 0, 0, 0, 1, 1,
-0.6120542, 0.3855258, -2.672857, 0, 0, 0, 1, 1,
-0.6101604, -0.665466, -1.653051, 1, 1, 1, 1, 1,
-0.6045471, 0.3918938, 1.0224, 1, 1, 1, 1, 1,
-0.6011218, -0.6791607, -2.377778, 1, 1, 1, 1, 1,
-0.6011008, -1.252841, -2.574876, 1, 1, 1, 1, 1,
-0.600433, 0.8146324, -0.7652226, 1, 1, 1, 1, 1,
-0.5987596, 0.1953378, -0.2067031, 1, 1, 1, 1, 1,
-0.5981327, -2.600822, -3.286927, 1, 1, 1, 1, 1,
-0.5978729, -0.9589843, -2.648318, 1, 1, 1, 1, 1,
-0.5967438, 0.1068043, -1.480142, 1, 1, 1, 1, 1,
-0.5942028, 0.4017678, -1.052362, 1, 1, 1, 1, 1,
-0.5925271, 1.726058, 0.9587328, 1, 1, 1, 1, 1,
-0.5924251, -0.612878, -2.144519, 1, 1, 1, 1, 1,
-0.5877455, 0.9041914, -0.4537662, 1, 1, 1, 1, 1,
-0.5858765, -1.196392, -3.226327, 1, 1, 1, 1, 1,
-0.5849507, 0.003315773, -1.653712, 1, 1, 1, 1, 1,
-0.5823755, -0.9983429, -2.316091, 0, 0, 1, 1, 1,
-0.5820926, 0.9247375, -0.2166443, 1, 0, 0, 1, 1,
-0.5791376, 0.3996712, -1.137121, 1, 0, 0, 1, 1,
-0.5779937, -0.05671187, -0.9610649, 1, 0, 0, 1, 1,
-0.5722134, 0.2025446, -2.459998, 1, 0, 0, 1, 1,
-0.5713405, 0.270825, -1.017533, 1, 0, 0, 1, 1,
-0.5693495, 0.03250912, -2.041335, 0, 0, 0, 1, 1,
-0.5595145, 0.3714219, -1.813128, 0, 0, 0, 1, 1,
-0.5592457, 1.247341, 0.9058267, 0, 0, 0, 1, 1,
-0.5581807, 0.09826314, -2.480281, 0, 0, 0, 1, 1,
-0.5504264, -1.622991, -4.248346, 0, 0, 0, 1, 1,
-0.5459877, 0.9878263, -0.5609646, 0, 0, 0, 1, 1,
-0.5375564, -1.157129, -1.137431, 0, 0, 0, 1, 1,
-0.537199, 0.5978042, -1.56574, 1, 1, 1, 1, 1,
-0.5365717, -0.5039697, -1.025737, 1, 1, 1, 1, 1,
-0.5330077, 0.7598801, -2.132712, 1, 1, 1, 1, 1,
-0.5305365, 0.4232979, -0.5110438, 1, 1, 1, 1, 1,
-0.5274793, -0.1420591, -1.835009, 1, 1, 1, 1, 1,
-0.5274392, 0.732871, -0.171632, 1, 1, 1, 1, 1,
-0.525631, -0.9198445, -4.392046, 1, 1, 1, 1, 1,
-0.5216588, 0.1242554, -1.487355, 1, 1, 1, 1, 1,
-0.5206664, -0.005498506, -2.732111, 1, 1, 1, 1, 1,
-0.5206147, -1.134863, -2.760065, 1, 1, 1, 1, 1,
-0.5176379, -1.059965, -3.860111, 1, 1, 1, 1, 1,
-0.5163483, 0.2988478, -1.360422, 1, 1, 1, 1, 1,
-0.5088993, -1.291953, -2.813004, 1, 1, 1, 1, 1,
-0.5078068, 1.034414, -0.889634, 1, 1, 1, 1, 1,
-0.5062011, -1.217368, -3.99752, 1, 1, 1, 1, 1,
-0.498601, 0.4036432, -0.2588855, 0, 0, 1, 1, 1,
-0.4973753, 0.3902752, -1.340921, 1, 0, 0, 1, 1,
-0.4960181, -0.8056874, -2.752846, 1, 0, 0, 1, 1,
-0.4955574, 0.2439774, -2.122959, 1, 0, 0, 1, 1,
-0.4939862, -0.5266091, -1.444525, 1, 0, 0, 1, 1,
-0.4930853, 0.1982176, -3.013127, 1, 0, 0, 1, 1,
-0.4913498, 0.03386998, -0.8009537, 0, 0, 0, 1, 1,
-0.490494, 0.8482446, 1.032819, 0, 0, 0, 1, 1,
-0.4888444, 1.4409, -0.1292963, 0, 0, 0, 1, 1,
-0.4888233, 0.5414429, -0.1419898, 0, 0, 0, 1, 1,
-0.4855089, -0.5853692, -4.231145, 0, 0, 0, 1, 1,
-0.4801548, -0.7224865, -1.361134, 0, 0, 0, 1, 1,
-0.4794117, 2.72821, -0.6180733, 0, 0, 0, 1, 1,
-0.4786419, -1.078149, -1.525419, 1, 1, 1, 1, 1,
-0.472804, 2.406654, -2.347031, 1, 1, 1, 1, 1,
-0.472296, -0.587302, -2.841127, 1, 1, 1, 1, 1,
-0.4675978, 0.7377111, 1.132021, 1, 1, 1, 1, 1,
-0.4641784, 2.146492, -0.2502804, 1, 1, 1, 1, 1,
-0.4634248, -0.2882954, -1.985601, 1, 1, 1, 1, 1,
-0.4631308, 1.135593, -0.3514481, 1, 1, 1, 1, 1,
-0.4575151, 0.8302654, -2.051973, 1, 1, 1, 1, 1,
-0.4566489, -0.7275859, -1.635378, 1, 1, 1, 1, 1,
-0.452184, 0.8918476, -1.535429, 1, 1, 1, 1, 1,
-0.4438782, 0.4384738, -1.612215, 1, 1, 1, 1, 1,
-0.4433496, -1.077178, -2.815451, 1, 1, 1, 1, 1,
-0.4425973, 0.4059567, -1.243251, 1, 1, 1, 1, 1,
-0.4418945, 0.3805869, -1.226932, 1, 1, 1, 1, 1,
-0.4416915, 0.1452469, 1.398905, 1, 1, 1, 1, 1,
-0.4372293, 0.2984336, -0.4917337, 0, 0, 1, 1, 1,
-0.4365684, -1.213251, -3.619458, 1, 0, 0, 1, 1,
-0.4306831, -0.5514538, -2.456961, 1, 0, 0, 1, 1,
-0.4279019, 0.1921841, -3.723582, 1, 0, 0, 1, 1,
-0.4197263, 0.7163121, -0.6185222, 1, 0, 0, 1, 1,
-0.4171524, -1.597498, -1.964874, 1, 0, 0, 1, 1,
-0.4164006, 0.4390896, -2.684983, 0, 0, 0, 1, 1,
-0.4127591, -1.371208, -2.070392, 0, 0, 0, 1, 1,
-0.4121117, -1.418276, -5.074451, 0, 0, 0, 1, 1,
-0.4115873, -0.7256983, 0.04162994, 0, 0, 0, 1, 1,
-0.4060197, -0.9024355, -3.880603, 0, 0, 0, 1, 1,
-0.4000803, 0.2061471, -1.790116, 0, 0, 0, 1, 1,
-0.3980839, 0.917812, -0.4331519, 0, 0, 0, 1, 1,
-0.3957125, 0.5420542, -1.835534, 1, 1, 1, 1, 1,
-0.3917875, 1.024654, -0.6302149, 1, 1, 1, 1, 1,
-0.3912927, -0.445366, -3.09116, 1, 1, 1, 1, 1,
-0.3910578, -0.5821694, -0.6961288, 1, 1, 1, 1, 1,
-0.3893132, -1.194145, -3.186413, 1, 1, 1, 1, 1,
-0.3876983, 0.8637379, -1.685975, 1, 1, 1, 1, 1,
-0.3855865, -0.722434, -2.539384, 1, 1, 1, 1, 1,
-0.3842023, 0.2188136, -0.9608141, 1, 1, 1, 1, 1,
-0.3810629, -0.3878381, -1.936933, 1, 1, 1, 1, 1,
-0.3785779, 0.5865539, 0.7375093, 1, 1, 1, 1, 1,
-0.375655, 0.7982905, -1.033269, 1, 1, 1, 1, 1,
-0.3669294, -0.09697998, -2.378776, 1, 1, 1, 1, 1,
-0.3653858, 0.3280505, -1.896926, 1, 1, 1, 1, 1,
-0.363248, -0.9120088, -2.36516, 1, 1, 1, 1, 1,
-0.3630973, -0.8572344, -2.677963, 1, 1, 1, 1, 1,
-0.360513, -1.08747, -2.865704, 0, 0, 1, 1, 1,
-0.3591273, -1.287078, -4.009635, 1, 0, 0, 1, 1,
-0.3570409, -0.6855209, -1.67299, 1, 0, 0, 1, 1,
-0.3569081, -0.09198281, -1.903883, 1, 0, 0, 1, 1,
-0.353061, -1.302194, -2.431141, 1, 0, 0, 1, 1,
-0.3521962, -0.3906095, -3.491826, 1, 0, 0, 1, 1,
-0.3448028, 0.1133283, -1.716884, 0, 0, 0, 1, 1,
-0.3444367, -2.18097, -2.914607, 0, 0, 0, 1, 1,
-0.3406708, -0.2246634, -1.994059, 0, 0, 0, 1, 1,
-0.3318449, 0.5808303, 0.4075937, 0, 0, 0, 1, 1,
-0.3282989, -0.2704287, -2.560452, 0, 0, 0, 1, 1,
-0.3277371, -1.25209, -1.904551, 0, 0, 0, 1, 1,
-0.3274789, -1.02674, -3.45492, 0, 0, 0, 1, 1,
-0.3262294, 1.16381, -0.3849193, 1, 1, 1, 1, 1,
-0.3254635, 2.08358, 1.763785, 1, 1, 1, 1, 1,
-0.3245195, -0.8058707, -2.357712, 1, 1, 1, 1, 1,
-0.3197332, 1.290498, 1.508856, 1, 1, 1, 1, 1,
-0.3195627, 1.006452, -0.117535, 1, 1, 1, 1, 1,
-0.3179072, 0.2180621, -0.7714455, 1, 1, 1, 1, 1,
-0.3165361, -1.403972, -3.269124, 1, 1, 1, 1, 1,
-0.314443, -0.1870178, 0.7606344, 1, 1, 1, 1, 1,
-0.3002231, 2.015086, 1.649542, 1, 1, 1, 1, 1,
-0.2957176, 1.517415, 2.130212, 1, 1, 1, 1, 1,
-0.2935283, 0.9568017, -1.014273, 1, 1, 1, 1, 1,
-0.293231, 1.262693, 1.34277, 1, 1, 1, 1, 1,
-0.2912434, -0.6270924, -4.318166, 1, 1, 1, 1, 1,
-0.289787, -0.4661281, -2.977057, 1, 1, 1, 1, 1,
-0.2836884, 0.1935328, -0.6145515, 1, 1, 1, 1, 1,
-0.2807599, -0.01731223, -1.068833, 0, 0, 1, 1, 1,
-0.2780494, -0.3542077, 0.7798434, 1, 0, 0, 1, 1,
-0.277223, -0.6659833, -1.56839, 1, 0, 0, 1, 1,
-0.2712483, 0.925137, -0.318132, 1, 0, 0, 1, 1,
-0.2699333, 0.7483629, -1.23728, 1, 0, 0, 1, 1,
-0.2695236, -1.397946, -2.534087, 1, 0, 0, 1, 1,
-0.2660417, 0.03845234, -1.3147, 0, 0, 0, 1, 1,
-0.2615583, -0.5381247, -4.249656, 0, 0, 0, 1, 1,
-0.2596365, 0.9823695, 0.2885332, 0, 0, 0, 1, 1,
-0.2584627, 1.12014, 0.104382, 0, 0, 0, 1, 1,
-0.2576814, -0.9937868, -2.509533, 0, 0, 0, 1, 1,
-0.2562146, 0.311634, 0.2591907, 0, 0, 0, 1, 1,
-0.2546914, -0.1837903, -3.177114, 0, 0, 0, 1, 1,
-0.2532855, 0.4462002, -2.474673, 1, 1, 1, 1, 1,
-0.2443704, -0.4183804, -2.433533, 1, 1, 1, 1, 1,
-0.2415264, 0.2111173, -1.490344, 1, 1, 1, 1, 1,
-0.2410929, -2.277615, -3.616171, 1, 1, 1, 1, 1,
-0.2385454, -0.9852816, -5.214976, 1, 1, 1, 1, 1,
-0.2383642, 1.117339, 1.150501, 1, 1, 1, 1, 1,
-0.2358531, 1.042272, -0.2075267, 1, 1, 1, 1, 1,
-0.2332958, 1.390923, -1.021656, 1, 1, 1, 1, 1,
-0.2296712, -0.2847811, 0.2466677, 1, 1, 1, 1, 1,
-0.2283718, -1.707574, -1.847335, 1, 1, 1, 1, 1,
-0.2282566, 0.305493, -0.349372, 1, 1, 1, 1, 1,
-0.2166215, -1.488818, -2.453462, 1, 1, 1, 1, 1,
-0.2073055, 1.296883, -1.663172, 1, 1, 1, 1, 1,
-0.2063547, -1.492409, -1.116435, 1, 1, 1, 1, 1,
-0.2062502, 0.05522052, -0.5052525, 1, 1, 1, 1, 1,
-0.2002399, 0.901243, 0.5983151, 0, 0, 1, 1, 1,
-0.1983919, -0.7228554, -3.638855, 1, 0, 0, 1, 1,
-0.1981947, -0.2722991, -2.53279, 1, 0, 0, 1, 1,
-0.1981211, 2.392857, 0.9828191, 1, 0, 0, 1, 1,
-0.1926278, 1.686927, 0.5107331, 1, 0, 0, 1, 1,
-0.1871566, 2.059968, -1.145693, 1, 0, 0, 1, 1,
-0.1815371, -0.652799, -4.900514, 0, 0, 0, 1, 1,
-0.1815193, 0.7847512, 0.5066971, 0, 0, 0, 1, 1,
-0.1771129, -1.303575, -3.924056, 0, 0, 0, 1, 1,
-0.1694769, 0.269618, -1.742475, 0, 0, 0, 1, 1,
-0.1689878, 0.7254338, 1.685109, 0, 0, 0, 1, 1,
-0.167348, 0.6868599, -2.178892, 0, 0, 0, 1, 1,
-0.1634965, -1.152113, -2.911021, 0, 0, 0, 1, 1,
-0.1613447, 0.3790014, -1.239377, 1, 1, 1, 1, 1,
-0.157274, -0.3372872, -1.480029, 1, 1, 1, 1, 1,
-0.1553968, 0.4109861, -0.9033923, 1, 1, 1, 1, 1,
-0.1531429, -1.13331, -5.846523, 1, 1, 1, 1, 1,
-0.1491645, -1.276519, -3.790083, 1, 1, 1, 1, 1,
-0.1489733, 1.054429, -0.6464518, 1, 1, 1, 1, 1,
-0.146238, 0.6342468, -0.735485, 1, 1, 1, 1, 1,
-0.1455158, -0.9207172, -4.347685, 1, 1, 1, 1, 1,
-0.1412095, -0.1947791, -1.660336, 1, 1, 1, 1, 1,
-0.1292198, 0.9612694, 0.8304183, 1, 1, 1, 1, 1,
-0.1292015, 1.231191, -0.6627727, 1, 1, 1, 1, 1,
-0.1240846, 2.127617, 0.7286462, 1, 1, 1, 1, 1,
-0.1233341, -0.4434961, -3.809176, 1, 1, 1, 1, 1,
-0.1188327, 0.8437773, -1.095449, 1, 1, 1, 1, 1,
-0.1162172, -0.5755338, -2.133329, 1, 1, 1, 1, 1,
-0.1132222, 0.9083968, 0.003529941, 0, 0, 1, 1, 1,
-0.1124915, 1.567071, 0.2857227, 1, 0, 0, 1, 1,
-0.1089415, 0.5665971, 0.1155562, 1, 0, 0, 1, 1,
-0.1081468, -0.7843481, -1.151771, 1, 0, 0, 1, 1,
-0.1080308, 0.5558464, 0.2797164, 1, 0, 0, 1, 1,
-0.1031372, -1.508979, -4.034951, 1, 0, 0, 1, 1,
-0.1025421, -1.118105, -3.554057, 0, 0, 0, 1, 1,
-0.1000714, 1.104401, -0.5641116, 0, 0, 0, 1, 1,
-0.09671284, -1.316802, -3.806053, 0, 0, 0, 1, 1,
-0.09643742, -0.7857125, -3.742695, 0, 0, 0, 1, 1,
-0.09617277, 0.4184491, 0.3409189, 0, 0, 0, 1, 1,
-0.09592874, 0.07099178, -3.115118, 0, 0, 0, 1, 1,
-0.0861828, 1.048859, -0.6631853, 0, 0, 0, 1, 1,
-0.08460622, -0.7961399, -1.585948, 1, 1, 1, 1, 1,
-0.08408485, -0.1008768, -2.624701, 1, 1, 1, 1, 1,
-0.08396375, -0.6468537, -1.093384, 1, 1, 1, 1, 1,
-0.07865626, 0.4003885, -0.2311208, 1, 1, 1, 1, 1,
-0.07521164, -1.032251, -4.707947, 1, 1, 1, 1, 1,
-0.06972738, -0.8944983, -3.363939, 1, 1, 1, 1, 1,
-0.06900783, -1.691265, -2.961424, 1, 1, 1, 1, 1,
-0.06603467, 1.164884, 0.8071916, 1, 1, 1, 1, 1,
-0.06557395, 0.2862752, -1.174612, 1, 1, 1, 1, 1,
-0.06352604, -0.4271208, -1.466169, 1, 1, 1, 1, 1,
-0.06157209, -1.004463, -2.549333, 1, 1, 1, 1, 1,
-0.0562381, 1.820061, -1.320338, 1, 1, 1, 1, 1,
-0.05469603, -0.5386419, -2.95887, 1, 1, 1, 1, 1,
-0.05307948, 1.835341, 0.2895247, 1, 1, 1, 1, 1,
-0.05246528, -0.7952499, -2.636049, 1, 1, 1, 1, 1,
-0.05190941, -0.6108734, -3.379293, 0, 0, 1, 1, 1,
-0.04914743, 0.5786361, 0.5491418, 1, 0, 0, 1, 1,
-0.04286456, 0.3577713, -0.5843661, 1, 0, 0, 1, 1,
-0.03540139, -1.787875, -3.727018, 1, 0, 0, 1, 1,
-0.0353982, -1.218329, -2.942674, 1, 0, 0, 1, 1,
-0.03059359, -0.5624567, -4.510933, 1, 0, 0, 1, 1,
-0.02756901, 0.8308269, 0.7006241, 0, 0, 0, 1, 1,
-0.0273285, -0.7733236, -3.32323, 0, 0, 0, 1, 1,
-0.02571792, 0.4907221, -0.2085294, 0, 0, 0, 1, 1,
-0.02324969, 0.6210473, 0.1232477, 0, 0, 0, 1, 1,
-0.02267572, -0.9113146, -3.713089, 0, 0, 0, 1, 1,
-0.01809715, 0.117777, 0.9633301, 0, 0, 0, 1, 1,
-0.01662176, -0.3063875, -3.69531, 0, 0, 0, 1, 1,
-0.01643745, -0.8316245, -3.593479, 1, 1, 1, 1, 1,
-0.01642231, 0.4129495, 1.428361, 1, 1, 1, 1, 1,
-0.01420414, 1.051787, -1.77133, 1, 1, 1, 1, 1,
-0.01321915, -1.095207, -0.7500653, 1, 1, 1, 1, 1,
-0.007418202, -1.286119, -0.05057314, 1, 1, 1, 1, 1,
-0.006821082, 0.2476465, 1.014574, 1, 1, 1, 1, 1,
-0.005662853, 0.3305737, -1.197842, 1, 1, 1, 1, 1,
-0.005305444, -2.107472, -2.809494, 1, 1, 1, 1, 1,
-0.003202938, -0.2370665, -3.320927, 1, 1, 1, 1, 1,
-0.0005613752, 0.5672032, -0.4938606, 1, 1, 1, 1, 1,
0.005544072, 0.9213363, 0.2874486, 1, 1, 1, 1, 1,
0.01316454, 0.394046, -0.5168743, 1, 1, 1, 1, 1,
0.01388436, 2.102535, -1.429584, 1, 1, 1, 1, 1,
0.01463418, -0.3934136, 3.433779, 1, 1, 1, 1, 1,
0.01546269, 1.059944, -0.7904786, 1, 1, 1, 1, 1,
0.01731624, 1.202788, -0.7767961, 0, 0, 1, 1, 1,
0.02066166, 0.9626197, 0.5282961, 1, 0, 0, 1, 1,
0.02319769, -0.2572421, 2.913518, 1, 0, 0, 1, 1,
0.03320105, 0.9105759, 0.6344934, 1, 0, 0, 1, 1,
0.03327799, 0.3018689, -0.1082401, 1, 0, 0, 1, 1,
0.03928411, 1.510358, -2.107847, 1, 0, 0, 1, 1,
0.04303283, -1.392328, 3.31118, 0, 0, 0, 1, 1,
0.04338482, -0.06520102, 1.329066, 0, 0, 0, 1, 1,
0.04702261, 0.1772441, -0.04242699, 0, 0, 0, 1, 1,
0.05093047, 2.94521, -1.386486, 0, 0, 0, 1, 1,
0.05236994, 0.2279416, 0.4939965, 0, 0, 0, 1, 1,
0.05760111, -1.246628, 4.133443, 0, 0, 0, 1, 1,
0.05829643, 0.6965984, 1.12187, 0, 0, 0, 1, 1,
0.06087853, 1.964804, 0.2502734, 1, 1, 1, 1, 1,
0.06344116, 0.5108785, 0.3364085, 1, 1, 1, 1, 1,
0.06428748, 1.716512, -0.3582316, 1, 1, 1, 1, 1,
0.06750146, -0.01171068, 3.460894, 1, 1, 1, 1, 1,
0.07031085, -0.9259927, 4.909346, 1, 1, 1, 1, 1,
0.07630967, -1.201436, 4.443429, 1, 1, 1, 1, 1,
0.07720935, 0.5452734, 1.509512, 1, 1, 1, 1, 1,
0.07904201, -1.499943, 2.883825, 1, 1, 1, 1, 1,
0.07962048, -1.864314, 2.770799, 1, 1, 1, 1, 1,
0.08589895, 0.3837291, 0.9717228, 1, 1, 1, 1, 1,
0.08867422, -0.005091713, 1.54153, 1, 1, 1, 1, 1,
0.08930091, -0.2924457, 2.038445, 1, 1, 1, 1, 1,
0.09018922, -0.307094, 1.566459, 1, 1, 1, 1, 1,
0.09044904, 1.37564, -0.4030912, 1, 1, 1, 1, 1,
0.09122238, 0.6035486, 2.138361, 1, 1, 1, 1, 1,
0.09322888, -0.5256044, 1.937733, 0, 0, 1, 1, 1,
0.0985321, 1.04195, -1.040082, 1, 0, 0, 1, 1,
0.1009898, 0.3942243, 2.316231, 1, 0, 0, 1, 1,
0.1032764, -0.2701387, 4.592451, 1, 0, 0, 1, 1,
0.1034928, -0.1338444, 2.362802, 1, 0, 0, 1, 1,
0.103952, -0.6238299, 3.799184, 1, 0, 0, 1, 1,
0.106675, -0.6640018, 3.237299, 0, 0, 0, 1, 1,
0.1076737, -1.584879, 1.469358, 0, 0, 0, 1, 1,
0.107835, -0.3557532, 1.078564, 0, 0, 0, 1, 1,
0.1092869, -1.590123, 4.477875, 0, 0, 0, 1, 1,
0.1202146, -0.2837054, 2.303199, 0, 0, 0, 1, 1,
0.1214929, -0.8671249, 1.506447, 0, 0, 0, 1, 1,
0.1217559, -0.3114098, 4.17034, 0, 0, 0, 1, 1,
0.1245002, -1.353054, 4.031998, 1, 1, 1, 1, 1,
0.1262931, -0.5087872, 2.304525, 1, 1, 1, 1, 1,
0.1265225, 0.702366, 0.6843061, 1, 1, 1, 1, 1,
0.1268428, 0.6744211, 0.2739867, 1, 1, 1, 1, 1,
0.1289206, -0.4336451, 2.261825, 1, 1, 1, 1, 1,
0.1306586, -1.828162, 1.769094, 1, 1, 1, 1, 1,
0.1310311, 0.4140203, -0.3752314, 1, 1, 1, 1, 1,
0.1320298, -1.167439, 2.572846, 1, 1, 1, 1, 1,
0.133487, 0.5189168, -0.7461262, 1, 1, 1, 1, 1,
0.1369203, -0.2835686, 2.866367, 1, 1, 1, 1, 1,
0.1396836, -0.2763792, 1.32715, 1, 1, 1, 1, 1,
0.1400416, 0.3496867, -0.265048, 1, 1, 1, 1, 1,
0.1447661, 0.179056, 2.660043, 1, 1, 1, 1, 1,
0.1466806, 1.258706, -1.211413, 1, 1, 1, 1, 1,
0.1492087, -0.8719729, 3.593547, 1, 1, 1, 1, 1,
0.1524615, -0.2847633, 3.380126, 0, 0, 1, 1, 1,
0.1547959, -0.00568905, 1.308103, 1, 0, 0, 1, 1,
0.1618655, -0.3839105, 3.042885, 1, 0, 0, 1, 1,
0.1632855, -1.023511, 3.255026, 1, 0, 0, 1, 1,
0.1650534, 1.538665, -0.6370463, 1, 0, 0, 1, 1,
0.1651325, -0.6862986, 3.527359, 1, 0, 0, 1, 1,
0.1710661, 1.827122, -0.549715, 0, 0, 0, 1, 1,
0.1743985, -0.02983469, 1.407749, 0, 0, 0, 1, 1,
0.1770275, -1.042626, 2.799498, 0, 0, 0, 1, 1,
0.1819509, -2.434177, 3.788678, 0, 0, 0, 1, 1,
0.1868536, -1.475544, 4.122623, 0, 0, 0, 1, 1,
0.1877048, -1.570067, 3.647993, 0, 0, 0, 1, 1,
0.1899721, 0.1229309, 0.9429233, 0, 0, 0, 1, 1,
0.190552, 1.057133, -0.2664962, 1, 1, 1, 1, 1,
0.1929482, -0.734151, 2.724382, 1, 1, 1, 1, 1,
0.193302, 0.01922401, 0.1253529, 1, 1, 1, 1, 1,
0.193773, 1.348565, 0.332078, 1, 1, 1, 1, 1,
0.195641, 0.5194222, 0.01099291, 1, 1, 1, 1, 1,
0.2002525, -0.409214, 3.209751, 1, 1, 1, 1, 1,
0.2033919, -0.4918849, 3.32193, 1, 1, 1, 1, 1,
0.210232, -0.1978236, 2.821773, 1, 1, 1, 1, 1,
0.2219888, -1.803609, 1.321616, 1, 1, 1, 1, 1,
0.2250737, -0.9626052, 3.096793, 1, 1, 1, 1, 1,
0.2262197, -0.2890503, 1.79174, 1, 1, 1, 1, 1,
0.2280118, 0.6345266, -1.408112, 1, 1, 1, 1, 1,
0.2302035, -0.1565254, 2.751962, 1, 1, 1, 1, 1,
0.239389, 0.4199988, 2.875635, 1, 1, 1, 1, 1,
0.2397102, 0.08858258, -0.1482816, 1, 1, 1, 1, 1,
0.2402756, -0.6527827, 3.075578, 0, 0, 1, 1, 1,
0.2444706, -1.269607, 1.839321, 1, 0, 0, 1, 1,
0.2459118, -0.7633209, 3.960181, 1, 0, 0, 1, 1,
0.2481295, -1.065234, 2.649263, 1, 0, 0, 1, 1,
0.2542565, 0.3622641, -0.07699512, 1, 0, 0, 1, 1,
0.2576045, -0.1808298, 0.4872455, 1, 0, 0, 1, 1,
0.2577852, -0.9590809, 3.957016, 0, 0, 0, 1, 1,
0.2634072, 1.211802, 0.8053706, 0, 0, 0, 1, 1,
0.2658093, 0.05301751, 1.770505, 0, 0, 0, 1, 1,
0.2666419, -0.986832, 5.736545, 0, 0, 0, 1, 1,
0.2673135, -1.474744, 1.520571, 0, 0, 0, 1, 1,
0.2709396, 1.311703, 0.9158098, 0, 0, 0, 1, 1,
0.2751646, -1.652774, 2.024411, 0, 0, 0, 1, 1,
0.2780789, 0.7477998, -0.7653812, 1, 1, 1, 1, 1,
0.2848757, -0.1274085, 3.164178, 1, 1, 1, 1, 1,
0.2876317, 1.197491, 0.9651419, 1, 1, 1, 1, 1,
0.2967187, -0.4202715, 2.483277, 1, 1, 1, 1, 1,
0.304617, 0.1214668, 1.936607, 1, 1, 1, 1, 1,
0.306943, 0.4543422, 1.178104, 1, 1, 1, 1, 1,
0.3090622, -1.0536, 2.615341, 1, 1, 1, 1, 1,
0.3120415, 0.138074, -0.00380058, 1, 1, 1, 1, 1,
0.3149437, 1.735073, -1.34405, 1, 1, 1, 1, 1,
0.3173703, 0.3205545, 0.5095435, 1, 1, 1, 1, 1,
0.3177787, 0.335072, 0.3322324, 1, 1, 1, 1, 1,
0.3183961, 0.4050153, -0.5478086, 1, 1, 1, 1, 1,
0.3185667, -0.4135859, 3.233868, 1, 1, 1, 1, 1,
0.3250543, 0.1658539, -0.233691, 1, 1, 1, 1, 1,
0.3296414, 0.6567281, 1.878973, 1, 1, 1, 1, 1,
0.3334957, -1.634398, 2.579827, 0, 0, 1, 1, 1,
0.3362884, -0.257992, 1.252304, 1, 0, 0, 1, 1,
0.3387732, -0.5886177, 3.496132, 1, 0, 0, 1, 1,
0.3391455, -0.363575, 2.308305, 1, 0, 0, 1, 1,
0.3442123, 1.72467, 0.3516868, 1, 0, 0, 1, 1,
0.3446327, -0.6037535, 1.631699, 1, 0, 0, 1, 1,
0.3449918, -0.07147449, 1.823675, 0, 0, 0, 1, 1,
0.3517905, 0.4238467, 1.023791, 0, 0, 0, 1, 1,
0.3559934, -1.680361, 3.530808, 0, 0, 0, 1, 1,
0.3561204, 2.187846, -1.074731, 0, 0, 0, 1, 1,
0.3561803, 0.5259926, -0.3740527, 0, 0, 0, 1, 1,
0.3608912, -0.4336618, 4.647863, 0, 0, 0, 1, 1,
0.3610179, -0.9392805, 2.149931, 0, 0, 0, 1, 1,
0.3612782, 1.794294, 0.2277082, 1, 1, 1, 1, 1,
0.3668182, -1.870098, 3.787101, 1, 1, 1, 1, 1,
0.3674355, 0.3855259, 0.5198365, 1, 1, 1, 1, 1,
0.3675243, 0.331329, 0.9352996, 1, 1, 1, 1, 1,
0.3744563, -1.461463, 1.968103, 1, 1, 1, 1, 1,
0.3754351, -0.04547415, 1.122174, 1, 1, 1, 1, 1,
0.3780125, -0.4167187, 1.304667, 1, 1, 1, 1, 1,
0.3798692, 1.084571, -0.4785575, 1, 1, 1, 1, 1,
0.3922879, -0.5211185, 2.828936, 1, 1, 1, 1, 1,
0.3925922, 0.04792051, 0.5959883, 1, 1, 1, 1, 1,
0.396013, 0.9301828, -0.2431958, 1, 1, 1, 1, 1,
0.3971341, -1.654803, 1.11991, 1, 1, 1, 1, 1,
0.3998417, 0.5455981, 0.7868582, 1, 1, 1, 1, 1,
0.4017314, 0.1389703, 2.067152, 1, 1, 1, 1, 1,
0.4032954, 0.3339103, -0.9378217, 1, 1, 1, 1, 1,
0.4040708, 1.870116, 1.042899, 0, 0, 1, 1, 1,
0.4045919, 0.01007013, 2.111392, 1, 0, 0, 1, 1,
0.4101222, -1.731388, 2.495831, 1, 0, 0, 1, 1,
0.4138181, 0.06831295, 1.911424, 1, 0, 0, 1, 1,
0.4165094, -0.8190103, 1.991592, 1, 0, 0, 1, 1,
0.4184817, -0.6913202, 2.990955, 1, 0, 0, 1, 1,
0.4245075, -0.8622215, 2.66494, 0, 0, 0, 1, 1,
0.4257523, -0.9059578, 2.094854, 0, 0, 0, 1, 1,
0.4325562, 0.4209734, -0.01959291, 0, 0, 0, 1, 1,
0.4381409, 0.3106946, 1.298545, 0, 0, 0, 1, 1,
0.4385582, 0.4560902, 1.326515, 0, 0, 0, 1, 1,
0.439027, 0.9198154, 2.031824, 0, 0, 0, 1, 1,
0.4441663, 0.7089031, 2.026273, 0, 0, 0, 1, 1,
0.4465307, -0.4057019, 3.667693, 1, 1, 1, 1, 1,
0.4465986, 0.8950449, 0.2386518, 1, 1, 1, 1, 1,
0.4478056, -0.5585415, 2.935925, 1, 1, 1, 1, 1,
0.465169, 0.8094923, 1.410167, 1, 1, 1, 1, 1,
0.4658608, 0.2081001, -0.2266863, 1, 1, 1, 1, 1,
0.4687373, 0.1406562, 1.129527, 1, 1, 1, 1, 1,
0.4701496, 2.921316, -0.6071028, 1, 1, 1, 1, 1,
0.4703737, 0.1157544, 2.154956, 1, 1, 1, 1, 1,
0.4732918, 0.05206807, 1.867165, 1, 1, 1, 1, 1,
0.4766153, 1.826597, -1.047352, 1, 1, 1, 1, 1,
0.4803646, -0.3472081, 3.180764, 1, 1, 1, 1, 1,
0.48157, 1.490284, 1.053209, 1, 1, 1, 1, 1,
0.4817547, -1.813567, 1.777671, 1, 1, 1, 1, 1,
0.4823325, -2.418698, 3.644874, 1, 1, 1, 1, 1,
0.4830482, -1.025009, 3.331991, 1, 1, 1, 1, 1,
0.4871673, -0.2437665, 2.292074, 0, 0, 1, 1, 1,
0.4879917, -2.076167, 2.530797, 1, 0, 0, 1, 1,
0.488909, 0.3930539, -0.2284349, 1, 0, 0, 1, 1,
0.501686, 0.5377149, -0.7630519, 1, 0, 0, 1, 1,
0.5023499, 0.3246018, -0.5084603, 1, 0, 0, 1, 1,
0.5031992, -0.6989158, 1.147055, 1, 0, 0, 1, 1,
0.5042556, 1.691424, -1.58785, 0, 0, 0, 1, 1,
0.5046113, -1.7469, 4.389018, 0, 0, 0, 1, 1,
0.5163646, 0.5428663, 1.507304, 0, 0, 0, 1, 1,
0.5190535, 0.4914227, 0.8192605, 0, 0, 0, 1, 1,
0.5191398, 0.7450632, 0.6570742, 0, 0, 0, 1, 1,
0.5233489, 0.2775556, 1.881058, 0, 0, 0, 1, 1,
0.5233723, -0.4254363, 2.150539, 0, 0, 0, 1, 1,
0.5233732, -0.3477567, 2.178165, 1, 1, 1, 1, 1,
0.5247855, 1.57556, 0.3827544, 1, 1, 1, 1, 1,
0.5250452, -2.193277, 3.463583, 1, 1, 1, 1, 1,
0.5254396, -0.7284094, 2.482071, 1, 1, 1, 1, 1,
0.5263132, 0.4841242, -0.5834477, 1, 1, 1, 1, 1,
0.5298099, 0.4451742, 0.8817534, 1, 1, 1, 1, 1,
0.5301141, 1.059058, -0.9726889, 1, 1, 1, 1, 1,
0.5324062, -1.895927, 4.314198, 1, 1, 1, 1, 1,
0.5348266, 0.5642565, 1.390727, 1, 1, 1, 1, 1,
0.5386668, -1.397931, 2.919004, 1, 1, 1, 1, 1,
0.5436881, 0.5234411, 0.6423357, 1, 1, 1, 1, 1,
0.5462211, -0.6072403, 1.861362, 1, 1, 1, 1, 1,
0.5468327, -0.8031911, 2.550137, 1, 1, 1, 1, 1,
0.5491084, -0.7518926, -0.1818817, 1, 1, 1, 1, 1,
0.5498209, 0.2188549, 0.8185896, 1, 1, 1, 1, 1,
0.551525, -0.1539318, 2.494107, 0, 0, 1, 1, 1,
0.5518216, -1.45014, 2.173922, 1, 0, 0, 1, 1,
0.5542616, 0.5490685, 1.200929, 1, 0, 0, 1, 1,
0.5549663, -0.07176846, 2.162957, 1, 0, 0, 1, 1,
0.5558289, -1.086871, 3.054158, 1, 0, 0, 1, 1,
0.5575871, -0.724224, 1.701504, 1, 0, 0, 1, 1,
0.5597113, 0.05629022, 0.3887641, 0, 0, 0, 1, 1,
0.5603828, -0.01534392, 3.689973, 0, 0, 0, 1, 1,
0.5648772, 2.534604, 0.9563066, 0, 0, 0, 1, 1,
0.571793, 0.6192062, 0.3888879, 0, 0, 0, 1, 1,
0.5748643, -0.8539938, 3.529608, 0, 0, 0, 1, 1,
0.5755292, -2.389896, 2.971217, 0, 0, 0, 1, 1,
0.5796257, 0.05994529, 1.319595, 0, 0, 0, 1, 1,
0.5805688, 0.52222, 0.8842744, 1, 1, 1, 1, 1,
0.5837348, 0.3795876, 1.515907, 1, 1, 1, 1, 1,
0.5837898, 1.641641, 0.7932073, 1, 1, 1, 1, 1,
0.5850894, -0.8444875, 3.866622, 1, 1, 1, 1, 1,
0.5906146, 0.8767297, 1.23426, 1, 1, 1, 1, 1,
0.5930232, -1.649204, 4.597771, 1, 1, 1, 1, 1,
0.595069, 0.9727744, 1.764379, 1, 1, 1, 1, 1,
0.5975528, 0.9268826, 0.5386514, 1, 1, 1, 1, 1,
0.6017125, 0.2966225, -0.0631327, 1, 1, 1, 1, 1,
0.6018678, -0.8037166, 0.4511785, 1, 1, 1, 1, 1,
0.602152, -0.5227652, 4.018698, 1, 1, 1, 1, 1,
0.6021894, 0.7339478, 0.6486514, 1, 1, 1, 1, 1,
0.6034611, -0.5794729, 2.452435, 1, 1, 1, 1, 1,
0.6069795, 0.4596978, 1.844926, 1, 1, 1, 1, 1,
0.6072139, -0.9297559, 2.946319, 1, 1, 1, 1, 1,
0.609127, 0.7142738, 0.1496411, 0, 0, 1, 1, 1,
0.6142627, 0.3760154, 1.628152, 1, 0, 0, 1, 1,
0.6173725, 0.7229928, 0.683265, 1, 0, 0, 1, 1,
0.6210008, -0.9698324, 4.055504, 1, 0, 0, 1, 1,
0.6219006, 1.264385, 2.990692, 1, 0, 0, 1, 1,
0.6220539, 0.680798, 2.278038, 1, 0, 0, 1, 1,
0.6261806, 2.111207, 1.449824, 0, 0, 0, 1, 1,
0.6288263, 2.037416, 0.585804, 0, 0, 0, 1, 1,
0.6340299, -2.219582, 5.078581, 0, 0, 0, 1, 1,
0.6354589, -0.2378284, 1.147209, 0, 0, 0, 1, 1,
0.6358799, 0.9271827, 0.6655683, 0, 0, 0, 1, 1,
0.6521475, -1.124034, 1.111087, 0, 0, 0, 1, 1,
0.6539222, 0.8869956, 0.873151, 0, 0, 0, 1, 1,
0.6551353, -0.2119146, 2.30926, 1, 1, 1, 1, 1,
0.6655825, -0.5585524, 2.463053, 1, 1, 1, 1, 1,
0.6671242, -1.134053, 1.771303, 1, 1, 1, 1, 1,
0.6676842, -0.0124801, 2.089429, 1, 1, 1, 1, 1,
0.6689844, -1.142318, 3.86146, 1, 1, 1, 1, 1,
0.6724291, 0.3922559, 1.243057, 1, 1, 1, 1, 1,
0.6739171, 1.055963, 0.02275139, 1, 1, 1, 1, 1,
0.6752579, -0.4146698, 2.261776, 1, 1, 1, 1, 1,
0.6796135, -0.3798744, 1.85411, 1, 1, 1, 1, 1,
0.6843023, -2.36055, 3.225958, 1, 1, 1, 1, 1,
0.6846299, -1.706123, 2.934383, 1, 1, 1, 1, 1,
0.695861, -0.9393591, 5.168798, 1, 1, 1, 1, 1,
0.6990481, -0.4522054, -0.1448332, 1, 1, 1, 1, 1,
0.7071426, 0.4986635, 0.4253494, 1, 1, 1, 1, 1,
0.7121819, 0.574089, 2.618032, 1, 1, 1, 1, 1,
0.7230455, 0.6902966, 1.391211, 0, 0, 1, 1, 1,
0.7242558, 1.02045, 1.406798, 1, 0, 0, 1, 1,
0.725261, -1.491837, 2.208798, 1, 0, 0, 1, 1,
0.7264813, 0.04509101, 0.3293592, 1, 0, 0, 1, 1,
0.7286331, 0.4369939, 2.169493, 1, 0, 0, 1, 1,
0.7337791, -0.5051379, 3.42852, 1, 0, 0, 1, 1,
0.7444162, -0.1363104, 2.991613, 0, 0, 0, 1, 1,
0.748275, 0.2235271, 1.124982, 0, 0, 0, 1, 1,
0.7521951, -0.655059, 0.9632462, 0, 0, 0, 1, 1,
0.7545373, 0.4114239, 0.003949413, 0, 0, 0, 1, 1,
0.7573323, 0.4855966, 0.8893654, 0, 0, 0, 1, 1,
0.7573629, -0.07114265, 1.622051, 0, 0, 0, 1, 1,
0.7577732, -0.2730834, 0.4968183, 0, 0, 0, 1, 1,
0.7595821, -0.1554687, 2.292431, 1, 1, 1, 1, 1,
0.764542, -0.06159865, 2.308277, 1, 1, 1, 1, 1,
0.7713193, 0.3398771, 2.184127, 1, 1, 1, 1, 1,
0.7746038, -1.466725, 3.15542, 1, 1, 1, 1, 1,
0.7793857, -0.574672, 2.834186, 1, 1, 1, 1, 1,
0.7801281, 0.5701861, 0.5340983, 1, 1, 1, 1, 1,
0.7861257, -0.08636058, 1.566752, 1, 1, 1, 1, 1,
0.7870477, 0.612803, 0.3025614, 1, 1, 1, 1, 1,
0.7941418, -0.3173834, 2.405753, 1, 1, 1, 1, 1,
0.7962701, 0.4616648, 2.594332, 1, 1, 1, 1, 1,
0.7982783, 0.05168583, 0.1474135, 1, 1, 1, 1, 1,
0.8221338, 1.23732, 1.330673, 1, 1, 1, 1, 1,
0.8273652, -1.227976, 3.709403, 1, 1, 1, 1, 1,
0.8329609, 0.3020862, 1.948373, 1, 1, 1, 1, 1,
0.8375149, -1.924652, 4.221738, 1, 1, 1, 1, 1,
0.838284, -0.3435793, 1.50841, 0, 0, 1, 1, 1,
0.840552, -1.270441, 2.346125, 1, 0, 0, 1, 1,
0.8442672, -0.9523644, 2.648884, 1, 0, 0, 1, 1,
0.8449486, -0.6937028, 2.589277, 1, 0, 0, 1, 1,
0.8460843, -0.401213, 2.51166, 1, 0, 0, 1, 1,
0.848096, -0.5342636, 2.659896, 1, 0, 0, 1, 1,
0.8492532, 1.780177, 0.9450373, 0, 0, 0, 1, 1,
0.8505868, -0.417799, 1.044845, 0, 0, 0, 1, 1,
0.8514956, -0.1362971, 2.829578, 0, 0, 0, 1, 1,
0.8552598, 0.1537194, 1.151063, 0, 0, 0, 1, 1,
0.855907, 0.9339131, -0.9166327, 0, 0, 0, 1, 1,
0.8616449, 0.8895972, -1.515201, 0, 0, 0, 1, 1,
0.8740436, -0.03686679, 1.43293, 0, 0, 0, 1, 1,
0.8830577, -1.047821, 3.762248, 1, 1, 1, 1, 1,
0.8884003, -0.5848117, 3.234974, 1, 1, 1, 1, 1,
0.8935149, -0.1206818, -0.3676136, 1, 1, 1, 1, 1,
0.8975873, 0.3262959, 0.6933932, 1, 1, 1, 1, 1,
0.9032991, -1.155912, 4.267062, 1, 1, 1, 1, 1,
0.9044834, -1.800542, 2.595806, 1, 1, 1, 1, 1,
0.9109755, 1.067823, 1.056285, 1, 1, 1, 1, 1,
0.9120527, -2.542604, 2.500822, 1, 1, 1, 1, 1,
0.914688, 0.05798846, 2.435632, 1, 1, 1, 1, 1,
0.9157031, -0.6407697, 2.315029, 1, 1, 1, 1, 1,
0.9178166, 0.07963809, 0.8607916, 1, 1, 1, 1, 1,
0.9222023, 0.06799716, 3.04491, 1, 1, 1, 1, 1,
0.9225747, 0.7727908, -0.345296, 1, 1, 1, 1, 1,
0.9264763, 0.6676883, 3.07257, 1, 1, 1, 1, 1,
0.9265487, -1.294432, 2.934756, 1, 1, 1, 1, 1,
0.9311394, 0.2796217, 3.572248, 0, 0, 1, 1, 1,
0.9325503, 0.4843008, -0.9706596, 1, 0, 0, 1, 1,
0.9442685, 0.009769063, 2.029348, 1, 0, 0, 1, 1,
0.9466586, -1.036059, 2.193252, 1, 0, 0, 1, 1,
0.9486212, 2.050527, 0.6130837, 1, 0, 0, 1, 1,
0.9510318, -0.8124261, 2.382464, 1, 0, 0, 1, 1,
0.9541302, -0.2163056, 2.275738, 0, 0, 0, 1, 1,
0.9549462, 0.5002127, 0.33383, 0, 0, 0, 1, 1,
0.9575396, 1.210342, -0.4387117, 0, 0, 0, 1, 1,
0.9603461, 1.917628, 1.207286, 0, 0, 0, 1, 1,
0.9771425, -0.02121775, 0.8590451, 0, 0, 0, 1, 1,
0.9814606, 1.721314, 0.6535631, 0, 0, 0, 1, 1,
0.9849638, 0.9503005, 2.810119, 0, 0, 0, 1, 1,
0.9889368, 0.01094678, 1.549827, 1, 1, 1, 1, 1,
0.9958071, 0.06710107, 0.4060307, 1, 1, 1, 1, 1,
1.003427, 0.4255306, 3.131054, 1, 1, 1, 1, 1,
1.013032, 0.1017679, 2.493325, 1, 1, 1, 1, 1,
1.018296, 1.65007, 0.6705572, 1, 1, 1, 1, 1,
1.018692, 0.8751565, 1.251804, 1, 1, 1, 1, 1,
1.02055, -0.2657832, 0.4338989, 1, 1, 1, 1, 1,
1.027161, -0.01934523, 3.193861, 1, 1, 1, 1, 1,
1.02778, -0.1307249, -0.05183278, 1, 1, 1, 1, 1,
1.033103, -0.0621143, 1.190752, 1, 1, 1, 1, 1,
1.036724, -0.006611154, 1.660763, 1, 1, 1, 1, 1,
1.038046, -0.2625505, 2.166655, 1, 1, 1, 1, 1,
1.043591, 0.2744857, 1.539185, 1, 1, 1, 1, 1,
1.046415, -0.5698387, 2.193755, 1, 1, 1, 1, 1,
1.056773, 0.4549707, 2.48698, 1, 1, 1, 1, 1,
1.058702, 1.117606, 2.20153, 0, 0, 1, 1, 1,
1.059372, -0.07546388, -1.537244, 1, 0, 0, 1, 1,
1.06636, -1.211779, 4.833328, 1, 0, 0, 1, 1,
1.070042, 1.015146, 0.883857, 1, 0, 0, 1, 1,
1.071744, -1.222393, 2.410104, 1, 0, 0, 1, 1,
1.074771, 0.4312174, 2.265379, 1, 0, 0, 1, 1,
1.086858, -0.1907766, 1.446511, 0, 0, 0, 1, 1,
1.087609, 0.3539029, 1.020511, 0, 0, 0, 1, 1,
1.093056, -0.5139776, 4.114875, 0, 0, 0, 1, 1,
1.095668, 1.361246, 0.04813924, 0, 0, 0, 1, 1,
1.099167, 0.1024562, 2.686327, 0, 0, 0, 1, 1,
1.101967, 0.4776899, 2.587228, 0, 0, 0, 1, 1,
1.102586, -0.112187, 2.589972, 0, 0, 0, 1, 1,
1.104025, -1.287678, 3.619973, 1, 1, 1, 1, 1,
1.107484, -0.9593435, 2.331625, 1, 1, 1, 1, 1,
1.108597, -3.177423, 1.947197, 1, 1, 1, 1, 1,
1.111005, -1.689283, 1.159015, 1, 1, 1, 1, 1,
1.114566, 2.636681, -0.8840958, 1, 1, 1, 1, 1,
1.11793, -0.1723551, 0.3474558, 1, 1, 1, 1, 1,
1.122814, -0.9894916, 1.99431, 1, 1, 1, 1, 1,
1.124562, -0.6547543, 2.934964, 1, 1, 1, 1, 1,
1.1254, 1.020125, 0.9090319, 1, 1, 1, 1, 1,
1.130166, -0.9914182, 1.182873, 1, 1, 1, 1, 1,
1.136672, 0.3716708, 1.368323, 1, 1, 1, 1, 1,
1.144842, -1.051131, 1.77164, 1, 1, 1, 1, 1,
1.144955, -1.429097, 2.38486, 1, 1, 1, 1, 1,
1.146904, 0.7341977, 1.44407, 1, 1, 1, 1, 1,
1.148124, -0.4359958, 1.080254, 1, 1, 1, 1, 1,
1.152647, 2.099708, -0.8393264, 0, 0, 1, 1, 1,
1.154191, -1.658254, 1.591825, 1, 0, 0, 1, 1,
1.155734, 1.590102, 0.7868413, 1, 0, 0, 1, 1,
1.156449, 0.09518976, 2.202151, 1, 0, 0, 1, 1,
1.169279, 0.2659408, 0.4505501, 1, 0, 0, 1, 1,
1.180326, -3.499478, 2.165522, 1, 0, 0, 1, 1,
1.185541, 1.99681, 0.5137844, 0, 0, 0, 1, 1,
1.185847, 0.222135, 1.236807, 0, 0, 0, 1, 1,
1.192364, -2.085366, 0.3517295, 0, 0, 0, 1, 1,
1.193003, 1.220656, 0.7683854, 0, 0, 0, 1, 1,
1.195284, -0.05075238, 0.7373371, 0, 0, 0, 1, 1,
1.203788, -1.244893, 2.705015, 0, 0, 0, 1, 1,
1.204872, -0.8307812, 2.804171, 0, 0, 0, 1, 1,
1.207843, -0.5388325, 2.165409, 1, 1, 1, 1, 1,
1.211287, 0.3419143, 1.303279, 1, 1, 1, 1, 1,
1.217639, 0.3627374, 2.003226, 1, 1, 1, 1, 1,
1.221455, 0.6504841, 0.953043, 1, 1, 1, 1, 1,
1.240141, 1.088471, 0.4352419, 1, 1, 1, 1, 1,
1.240674, -1.563325, 2.777225, 1, 1, 1, 1, 1,
1.24977, 0.4549479, 2.141659, 1, 1, 1, 1, 1,
1.249843, 0.3955951, 3.451654, 1, 1, 1, 1, 1,
1.250592, -0.01919263, 3.493225, 1, 1, 1, 1, 1,
1.252795, 2.260526, 0.2825623, 1, 1, 1, 1, 1,
1.254426, 0.2947987, 2.86783, 1, 1, 1, 1, 1,
1.256341, -0.9557344, 1.210328, 1, 1, 1, 1, 1,
1.257311, 0.1044955, -0.5559447, 1, 1, 1, 1, 1,
1.272816, 0.5805014, 0.2161108, 1, 1, 1, 1, 1,
1.273744, 0.1144257, 0.9421519, 1, 1, 1, 1, 1,
1.277143, -0.1607993, 2.112281, 0, 0, 1, 1, 1,
1.278746, 1.110516, 2.679498, 1, 0, 0, 1, 1,
1.281572, -0.4556792, 1.775363, 1, 0, 0, 1, 1,
1.284628, -1.512363, 1.451524, 1, 0, 0, 1, 1,
1.28677, 0.3260134, 0.4520917, 1, 0, 0, 1, 1,
1.288874, 0.4904307, 2.409957, 1, 0, 0, 1, 1,
1.292885, 0.3566695, 1.974887, 0, 0, 0, 1, 1,
1.29362, -0.1370164, 2.404783, 0, 0, 0, 1, 1,
1.325456, -0.1793144, 1.352669, 0, 0, 0, 1, 1,
1.33163, -0.2639817, 2.267745, 0, 0, 0, 1, 1,
1.333889, -0.08211565, 1.416053, 0, 0, 0, 1, 1,
1.335037, 1.704019, 0.534345, 0, 0, 0, 1, 1,
1.33628, -0.0599534, 1.167123, 0, 0, 0, 1, 1,
1.342136, 0.1691329, 0.2245886, 1, 1, 1, 1, 1,
1.344776, 1.073194, 1.289772, 1, 1, 1, 1, 1,
1.347997, -0.3541973, 0.06100558, 1, 1, 1, 1, 1,
1.350226, -0.7742322, 1.45291, 1, 1, 1, 1, 1,
1.363629, 0.6604879, 1.316395, 1, 1, 1, 1, 1,
1.36522, 0.02440705, 0.426792, 1, 1, 1, 1, 1,
1.369438, 1.028008, -0.1041571, 1, 1, 1, 1, 1,
1.389274, -0.7760234, 1.271125, 1, 1, 1, 1, 1,
1.389314, -1.399128, 2.334646, 1, 1, 1, 1, 1,
1.389391, -0.7225795, 2.262618, 1, 1, 1, 1, 1,
1.393582, 0.8204756, 1.09064, 1, 1, 1, 1, 1,
1.399492, -1.792775, 1.741108, 1, 1, 1, 1, 1,
1.408039, 0.9527605, 1.30262, 1, 1, 1, 1, 1,
1.418771, 0.1664226, 1.018072, 1, 1, 1, 1, 1,
1.440894, 0.2704678, 0.5458333, 1, 1, 1, 1, 1,
1.446416, -1.057507, 3.094792, 0, 0, 1, 1, 1,
1.452462, -0.6928493, 0.9724322, 1, 0, 0, 1, 1,
1.454323, 3.100557, -0.3509935, 1, 0, 0, 1, 1,
1.456395, -0.2629929, 0.5286576, 1, 0, 0, 1, 1,
1.462311, -0.09374408, 0.0750502, 1, 0, 0, 1, 1,
1.466156, -0.7014204, 2.741418, 1, 0, 0, 1, 1,
1.471092, 0.4162184, 2.7607, 0, 0, 0, 1, 1,
1.503446, -0.1346381, 1.533596, 0, 0, 0, 1, 1,
1.51562, 1.838688, 0.6289311, 0, 0, 0, 1, 1,
1.529938, 0.5005211, 0.9959419, 0, 0, 0, 1, 1,
1.534165, -0.9313849, 3.734711, 0, 0, 0, 1, 1,
1.538285, 0.9632414, 2.157587, 0, 0, 0, 1, 1,
1.545298, -0.2346157, 2.811455, 0, 0, 0, 1, 1,
1.546497, 0.7499925, -0.1114661, 1, 1, 1, 1, 1,
1.547016, 0.6194561, 0.2580296, 1, 1, 1, 1, 1,
1.551859, -1.682536, 2.062386, 1, 1, 1, 1, 1,
1.59443, 0.375467, -0.1111249, 1, 1, 1, 1, 1,
1.623723, 0.303386, 2.835049, 1, 1, 1, 1, 1,
1.627611, 0.9867278, 2.71021, 1, 1, 1, 1, 1,
1.654581, 0.4881522, 1.822531, 1, 1, 1, 1, 1,
1.670437, -2.095351, 3.079247, 1, 1, 1, 1, 1,
1.67241, -1.023988, 1.622425, 1, 1, 1, 1, 1,
1.675072, -1.953106, 2.311398, 1, 1, 1, 1, 1,
1.67674, 0.9677252, -0.1729414, 1, 1, 1, 1, 1,
1.703276, 0.9184108, 1.619641, 1, 1, 1, 1, 1,
1.706018, -1.779312, 3.259133, 1, 1, 1, 1, 1,
1.706583, 0.5948047, 0.9765086, 1, 1, 1, 1, 1,
1.710203, 0.6944454, 1.827142, 1, 1, 1, 1, 1,
1.717071, -0.1788813, 2.237947, 0, 0, 1, 1, 1,
1.719262, -1.019552, 0.6979679, 1, 0, 0, 1, 1,
1.719998, 1.131733, -0.5663997, 1, 0, 0, 1, 1,
1.727084, -0.3217659, 2.034219, 1, 0, 0, 1, 1,
1.757016, 2.271907, 0.6214615, 1, 0, 0, 1, 1,
1.75809, 2.119005, -0.004027199, 1, 0, 0, 1, 1,
1.77622, -0.8568857, 1.064145, 0, 0, 0, 1, 1,
1.785925, -1.127273, 2.992095, 0, 0, 0, 1, 1,
1.78779, 0.6389778, 1.624827, 0, 0, 0, 1, 1,
1.797013, 1.148277, -0.2486101, 0, 0, 0, 1, 1,
1.79923, 0.3340152, 2.423109, 0, 0, 0, 1, 1,
1.805863, -0.2310414, 2.074936, 0, 0, 0, 1, 1,
1.811125, 0.2192053, 1.241025, 0, 0, 0, 1, 1,
1.811928, 0.4473995, 0.388462, 1, 1, 1, 1, 1,
1.82148, 1.506777, -0.09345391, 1, 1, 1, 1, 1,
1.837702, 1.576765, 1.097638, 1, 1, 1, 1, 1,
1.839652, -1.319635, 1.217237, 1, 1, 1, 1, 1,
1.842166, 0.2469924, 0.8612869, 1, 1, 1, 1, 1,
1.847561, 1.568844, 0.6662734, 1, 1, 1, 1, 1,
1.863111, -0.0504101, 1.115834, 1, 1, 1, 1, 1,
1.882683, -1.670165, 1.516395, 1, 1, 1, 1, 1,
1.900582, -1.106125, 1.210811, 1, 1, 1, 1, 1,
1.91206, -0.3609178, 1.916117, 1, 1, 1, 1, 1,
1.927119, 0.4121616, 2.839676, 1, 1, 1, 1, 1,
1.929635, -1.095091, 1.033764, 1, 1, 1, 1, 1,
1.930398, 0.3350064, 2.445245, 1, 1, 1, 1, 1,
1.931936, -0.6344175, 0.7950974, 1, 1, 1, 1, 1,
1.935012, -0.1298501, 3.385919, 1, 1, 1, 1, 1,
1.936365, 0.3651532, 0.5847919, 0, 0, 1, 1, 1,
1.947788, -0.4977899, 3.182055, 1, 0, 0, 1, 1,
1.954471, -0.8936568, 2.603749, 1, 0, 0, 1, 1,
1.958362, 1.36106, 0.4797301, 1, 0, 0, 1, 1,
1.964906, 0.009912549, 1.087808, 1, 0, 0, 1, 1,
1.984141, -1.217194, 2.064057, 1, 0, 0, 1, 1,
2.037315, -0.3267867, 2.406524, 0, 0, 0, 1, 1,
2.078554, -0.694473, 1.654986, 0, 0, 0, 1, 1,
2.078695, 1.947271, 2.893075, 0, 0, 0, 1, 1,
2.107832, 0.6651496, -1.626941, 0, 0, 0, 1, 1,
2.122858, -0.8993339, 0.8825563, 0, 0, 0, 1, 1,
2.129124, 0.9287921, -0.1088162, 0, 0, 0, 1, 1,
2.170232, 1.070729, 0.8594823, 0, 0, 0, 1, 1,
2.317378, 0.02594814, 0.1527395, 1, 1, 1, 1, 1,
2.398566, 0.1509583, 1.703549, 1, 1, 1, 1, 1,
2.670847, 2.189059, -0.928042, 1, 1, 1, 1, 1,
2.736335, -0.8070651, 2.211235, 1, 1, 1, 1, 1,
2.752039, 0.7898489, 1.569119, 1, 1, 1, 1, 1,
3.008998, -1.315242, -0.537425, 1, 1, 1, 1, 1,
3.214167, 0.8668299, 2.185625, 1, 1, 1, 1, 1
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
var radius = 10.07834;
var distance = 35.39975;
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
mvMatrix.translate( 0.1823719, 0.1994603, 0.0549891 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.39975);
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
