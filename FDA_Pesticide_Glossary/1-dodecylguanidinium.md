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
-4.017253, -2.449601, -1.936071, 1, 0, 0, 1,
-3.068744, -1.107785, -2.137171, 1, 0.007843138, 0, 1,
-2.753607, 0.1687389, -0.8298723, 1, 0.01176471, 0, 1,
-2.738715, 0.9394456, -0.0115846, 1, 0.01960784, 0, 1,
-2.73354, 0.8508636, -1.910305, 1, 0.02352941, 0, 1,
-2.726294, -2.336771, -1.274891, 1, 0.03137255, 0, 1,
-2.683056, 0.8541852, 0.7089811, 1, 0.03529412, 0, 1,
-2.601302, 0.4890396, -1.724718, 1, 0.04313726, 0, 1,
-2.43696, -1.769818, -1.93048, 1, 0.04705882, 0, 1,
-2.410285, 0.4902315, -2.740118, 1, 0.05490196, 0, 1,
-2.319877, 1.082804, -1.591283, 1, 0.05882353, 0, 1,
-2.307135, -1.521563, -2.502061, 1, 0.06666667, 0, 1,
-2.266553, -1.004635, -0.2984008, 1, 0.07058824, 0, 1,
-2.241762, -1.408724, -2.335241, 1, 0.07843138, 0, 1,
-2.234091, -0.9163151, -2.92607, 1, 0.08235294, 0, 1,
-2.091026, 0.8307933, -0.6935472, 1, 0.09019608, 0, 1,
-2.071897, 0.1108443, -0.4912724, 1, 0.09411765, 0, 1,
-2.070514, 0.6417058, -0.4582539, 1, 0.1019608, 0, 1,
-2.062531, -0.9560012, -0.2624973, 1, 0.1098039, 0, 1,
-2.025789, -0.1766462, -1.450669, 1, 0.1137255, 0, 1,
-2.013159, -0.4294824, -2.001619, 1, 0.1215686, 0, 1,
-1.961057, -0.9097248, -3.658234, 1, 0.1254902, 0, 1,
-1.95396, -2.939142, -1.98788, 1, 0.1333333, 0, 1,
-1.910677, -0.7770532, -2.855997, 1, 0.1372549, 0, 1,
-1.887855, 0.1764342, -1.755865, 1, 0.145098, 0, 1,
-1.881719, -1.884351, -1.193343, 1, 0.1490196, 0, 1,
-1.879192, 0.2488616, 0.2200411, 1, 0.1568628, 0, 1,
-1.876658, 0.3973914, -1.155235, 1, 0.1607843, 0, 1,
-1.834132, 0.6404409, -1.927469, 1, 0.1686275, 0, 1,
-1.81382, 1.683856, -1.064408, 1, 0.172549, 0, 1,
-1.78706, 0.04041225, -0.949503, 1, 0.1803922, 0, 1,
-1.782668, 1.211625, -1.129124, 1, 0.1843137, 0, 1,
-1.779646, -0.1183175, -1.699982, 1, 0.1921569, 0, 1,
-1.767644, 0.8344897, -3.191268, 1, 0.1960784, 0, 1,
-1.764364, -0.00288341, -1.42796, 1, 0.2039216, 0, 1,
-1.741719, -0.2683158, -2.73103, 1, 0.2117647, 0, 1,
-1.736773, 1.999595, 1.15239, 1, 0.2156863, 0, 1,
-1.705217, 0.6209544, -0.176238, 1, 0.2235294, 0, 1,
-1.690078, 0.7730888, -1.049048, 1, 0.227451, 0, 1,
-1.681848, -1.83321, -2.504608, 1, 0.2352941, 0, 1,
-1.671889, 2.418009, -0.4817916, 1, 0.2392157, 0, 1,
-1.652272, 0.9503611, -2.217043, 1, 0.2470588, 0, 1,
-1.652238, -0.05812959, -1.493551, 1, 0.2509804, 0, 1,
-1.644205, 0.2410817, -1.678149, 1, 0.2588235, 0, 1,
-1.630443, 2.223368, -0.5154079, 1, 0.2627451, 0, 1,
-1.615639, -1.647384, -2.300195, 1, 0.2705882, 0, 1,
-1.606704, -0.1906184, -1.218117, 1, 0.2745098, 0, 1,
-1.593456, -1.409655, -3.210143, 1, 0.282353, 0, 1,
-1.592311, -0.84396, -2.005364, 1, 0.2862745, 0, 1,
-1.589985, -1.864309, -2.068087, 1, 0.2941177, 0, 1,
-1.570545, -0.3626251, -2.36448, 1, 0.3019608, 0, 1,
-1.561335, 0.3897043, -1.289067, 1, 0.3058824, 0, 1,
-1.545674, 0.1706914, 0.7032968, 1, 0.3137255, 0, 1,
-1.539017, -0.377606, -2.212929, 1, 0.3176471, 0, 1,
-1.53138, -0.9801162, -2.840031, 1, 0.3254902, 0, 1,
-1.529485, 1.058096, -1.250552, 1, 0.3294118, 0, 1,
-1.493788, 0.04688144, 0.9620751, 1, 0.3372549, 0, 1,
-1.492782, 0.3318529, -1.792748, 1, 0.3411765, 0, 1,
-1.489864, -0.2397787, -0.3619095, 1, 0.3490196, 0, 1,
-1.468031, -2.430625, -4.717459, 1, 0.3529412, 0, 1,
-1.456045, 0.6830679, -0.6549243, 1, 0.3607843, 0, 1,
-1.449689, 0.5944183, -0.9004763, 1, 0.3647059, 0, 1,
-1.433513, 0.7158431, -0.7284243, 1, 0.372549, 0, 1,
-1.427486, -1.199686, -1.807442, 1, 0.3764706, 0, 1,
-1.425978, 0.654725, -2.284899, 1, 0.3843137, 0, 1,
-1.424781, -0.09083065, -0.5709022, 1, 0.3882353, 0, 1,
-1.415641, -0.7389255, -2.696093, 1, 0.3960784, 0, 1,
-1.408161, 0.1504161, -1.261183, 1, 0.4039216, 0, 1,
-1.405814, 0.6840313, -1.413511, 1, 0.4078431, 0, 1,
-1.399763, -1.33316, -0.181485, 1, 0.4156863, 0, 1,
-1.394847, 0.293573, 0.7820498, 1, 0.4196078, 0, 1,
-1.387131, -0.7554645, -1.348464, 1, 0.427451, 0, 1,
-1.37905, -0.5637932, -2.384021, 1, 0.4313726, 0, 1,
-1.378814, -2.666457, -4.410013, 1, 0.4392157, 0, 1,
-1.359517, -0.6243272, -1.321985, 1, 0.4431373, 0, 1,
-1.358271, 1.142841, 0.6583953, 1, 0.4509804, 0, 1,
-1.356306, 0.2434653, -1.314148, 1, 0.454902, 0, 1,
-1.340761, -0.6728975, -0.7217873, 1, 0.4627451, 0, 1,
-1.327611, -2.149172, -2.11941, 1, 0.4666667, 0, 1,
-1.317048, -1.046061, -0.7641167, 1, 0.4745098, 0, 1,
-1.315283, 2.086414, -0.9240958, 1, 0.4784314, 0, 1,
-1.314276, -0.009011636, -1.095838, 1, 0.4862745, 0, 1,
-1.305933, 1.050737, 0.7300834, 1, 0.4901961, 0, 1,
-1.297241, 0.1439493, -0.9387754, 1, 0.4980392, 0, 1,
-1.29651, -1.835847, -3.643413, 1, 0.5058824, 0, 1,
-1.292323, 0.6020307, -2.368364, 1, 0.509804, 0, 1,
-1.290799, -0.7580302, -4.702096, 1, 0.5176471, 0, 1,
-1.287761, -0.3196565, -0.8735885, 1, 0.5215687, 0, 1,
-1.283875, -1.323498, -3.213319, 1, 0.5294118, 0, 1,
-1.280559, -0.16677, -1.97262, 1, 0.5333334, 0, 1,
-1.279956, -0.4494537, -3.185989, 1, 0.5411765, 0, 1,
-1.279887, 1.072717, -0.6847566, 1, 0.5450981, 0, 1,
-1.27715, -0.3786303, -1.914032, 1, 0.5529412, 0, 1,
-1.273073, -2.265022, -3.005337, 1, 0.5568628, 0, 1,
-1.26082, -0.002245945, -2.969142, 1, 0.5647059, 0, 1,
-1.260138, 0.242268, -1.064718, 1, 0.5686275, 0, 1,
-1.252922, 0.9476772, 0.02836297, 1, 0.5764706, 0, 1,
-1.239231, 1.476907, 1.421175, 1, 0.5803922, 0, 1,
-1.237656, 0.5036376, 0.7377082, 1, 0.5882353, 0, 1,
-1.234317, -1.03318, -1.682834, 1, 0.5921569, 0, 1,
-1.231105, 0.305922, -0.6227179, 1, 0.6, 0, 1,
-1.22979, -1.05004, -0.9194986, 1, 0.6078432, 0, 1,
-1.226477, 0.3497137, -1.502963, 1, 0.6117647, 0, 1,
-1.22432, -0.3312358, -1.940053, 1, 0.6196079, 0, 1,
-1.219764, -1.216432, -1.42847, 1, 0.6235294, 0, 1,
-1.219057, 1.821558, 0.2861028, 1, 0.6313726, 0, 1,
-1.218099, 0.2234207, -0.8083945, 1, 0.6352941, 0, 1,
-1.217973, 0.7237824, -1.607157, 1, 0.6431373, 0, 1,
-1.205516, -0.1824865, -0.435292, 1, 0.6470588, 0, 1,
-1.190991, -1.672386, -0.3617911, 1, 0.654902, 0, 1,
-1.184854, 0.04960198, -1.507233, 1, 0.6588235, 0, 1,
-1.180513, -0.01975744, -1.617366, 1, 0.6666667, 0, 1,
-1.172521, -1.340958, -0.5146223, 1, 0.6705883, 0, 1,
-1.170872, 0.06503744, -0.1924932, 1, 0.6784314, 0, 1,
-1.164719, 0.426474, -1.612177, 1, 0.682353, 0, 1,
-1.164544, 0.01029597, -1.447972, 1, 0.6901961, 0, 1,
-1.160997, -1.176196, -1.280654, 1, 0.6941177, 0, 1,
-1.15505, -0.7734864, -2.035671, 1, 0.7019608, 0, 1,
-1.154518, -0.3207259, -1.15739, 1, 0.7098039, 0, 1,
-1.153928, 0.2407879, -1.589705, 1, 0.7137255, 0, 1,
-1.150697, 0.4829662, -0.08619996, 1, 0.7215686, 0, 1,
-1.147379, 1.074195, -1.684687, 1, 0.7254902, 0, 1,
-1.143694, 1.096362, -1.390002, 1, 0.7333333, 0, 1,
-1.142438, -1.622517, -2.670884, 1, 0.7372549, 0, 1,
-1.138929, 0.9517717, 0.9780385, 1, 0.7450981, 0, 1,
-1.136248, 0.6902788, -2.913778, 1, 0.7490196, 0, 1,
-1.116495, 1.128884, -1.219601, 1, 0.7568628, 0, 1,
-1.10698, -2.148388, -3.548841, 1, 0.7607843, 0, 1,
-1.106858, 1.128546, -3.314133, 1, 0.7686275, 0, 1,
-1.10403, -0.2688915, -1.629239, 1, 0.772549, 0, 1,
-1.099164, -1.487535, -3.129475, 1, 0.7803922, 0, 1,
-1.08771, -0.8907014, -2.693378, 1, 0.7843137, 0, 1,
-1.075447, -0.09287146, -2.113397, 1, 0.7921569, 0, 1,
-1.068065, -0.6114871, -1.7904, 1, 0.7960784, 0, 1,
-1.051836, -0.8212892, -2.954879, 1, 0.8039216, 0, 1,
-1.051287, 1.006097, -1.326217, 1, 0.8117647, 0, 1,
-1.051129, -0.3228986, -2.660594, 1, 0.8156863, 0, 1,
-1.03755, 2.162204, 0.1417693, 1, 0.8235294, 0, 1,
-1.028309, -2.560119, -2.86895, 1, 0.827451, 0, 1,
-1.02777, 0.03687024, -4.020392, 1, 0.8352941, 0, 1,
-1.014539, 0.1541425, -0.3700905, 1, 0.8392157, 0, 1,
-1.010782, 0.6047138, -2.203575, 1, 0.8470588, 0, 1,
-1.008905, 0.5426702, -1.125278, 1, 0.8509804, 0, 1,
-0.9901417, -1.118837, -2.98454, 1, 0.8588235, 0, 1,
-0.987802, 0.6309602, 0.2329519, 1, 0.8627451, 0, 1,
-0.9780709, 1.781716, 0.1001482, 1, 0.8705882, 0, 1,
-0.9733086, -0.8792519, -1.859438, 1, 0.8745098, 0, 1,
-0.9699655, 1.90301, -1.066388, 1, 0.8823529, 0, 1,
-0.9653357, 0.02924674, -1.425239, 1, 0.8862745, 0, 1,
-0.9595245, -0.895413, -1.233493, 1, 0.8941177, 0, 1,
-0.9564863, 0.7062306, -1.624496, 1, 0.8980392, 0, 1,
-0.9540664, -1.296417, -2.371413, 1, 0.9058824, 0, 1,
-0.9502945, -0.6501999, -0.1859618, 1, 0.9137255, 0, 1,
-0.9479523, 0.3488246, -0.5590225, 1, 0.9176471, 0, 1,
-0.9417489, -1.050556, -3.367159, 1, 0.9254902, 0, 1,
-0.9389674, 0.09336373, -1.041706, 1, 0.9294118, 0, 1,
-0.9373139, -0.1778645, -2.237669, 1, 0.9372549, 0, 1,
-0.9265483, 0.2938986, -0.1893336, 1, 0.9411765, 0, 1,
-0.9200305, 0.08281281, -0.8290755, 1, 0.9490196, 0, 1,
-0.9194037, -0.1197488, -1.277958, 1, 0.9529412, 0, 1,
-0.9173758, 0.136727, -1.220937, 1, 0.9607843, 0, 1,
-0.9131378, 1.172243, 1.321203, 1, 0.9647059, 0, 1,
-0.907925, 0.1757144, -3.283657, 1, 0.972549, 0, 1,
-0.9040105, -0.8281299, -2.796197, 1, 0.9764706, 0, 1,
-0.9023762, 0.6674444, -0.2008327, 1, 0.9843137, 0, 1,
-0.9019468, 0.8019723, -0.1799281, 1, 0.9882353, 0, 1,
-0.9015568, 0.4182164, -1.155659, 1, 0.9960784, 0, 1,
-0.8942674, -1.07997, -2.123122, 0.9960784, 1, 0, 1,
-0.891895, -0.726298, -2.518518, 0.9921569, 1, 0, 1,
-0.887975, -0.1698336, -1.26071, 0.9843137, 1, 0, 1,
-0.8785517, -0.8006122, -2.578206, 0.9803922, 1, 0, 1,
-0.875425, -0.6609781, -1.66627, 0.972549, 1, 0, 1,
-0.8725939, -2.004128, -2.02651, 0.9686275, 1, 0, 1,
-0.8697137, 0.7644702, -1.268935, 0.9607843, 1, 0, 1,
-0.8689557, -0.7686958, -2.193059, 0.9568627, 1, 0, 1,
-0.86729, -0.6058921, -1.61064, 0.9490196, 1, 0, 1,
-0.8640919, -0.1325097, -0.8771619, 0.945098, 1, 0, 1,
-0.8630222, -0.3037992, -1.751933, 0.9372549, 1, 0, 1,
-0.8608376, -1.583824, -3.413685, 0.9333333, 1, 0, 1,
-0.8586196, 0.4536765, -2.437371, 0.9254902, 1, 0, 1,
-0.8541495, -0.1766, -1.044964, 0.9215686, 1, 0, 1,
-0.8541337, 2.064124, -0.9154998, 0.9137255, 1, 0, 1,
-0.8529129, 1.794924, -0.3829899, 0.9098039, 1, 0, 1,
-0.8498781, 1.232513, -1.214596, 0.9019608, 1, 0, 1,
-0.848204, 0.7519032, -0.1969711, 0.8941177, 1, 0, 1,
-0.8440527, 0.6782292, -2.94014, 0.8901961, 1, 0, 1,
-0.8420401, -1.038942, -0.8602349, 0.8823529, 1, 0, 1,
-0.8338948, -0.9404049, -1.592133, 0.8784314, 1, 0, 1,
-0.8297845, 0.1839606, -2.382389, 0.8705882, 1, 0, 1,
-0.8287434, 0.05236296, -1.537757, 0.8666667, 1, 0, 1,
-0.8283606, -0.3275776, -1.289758, 0.8588235, 1, 0, 1,
-0.8194332, 1.080226, 0.4204823, 0.854902, 1, 0, 1,
-0.8183745, -0.0928992, -3.079518, 0.8470588, 1, 0, 1,
-0.8179023, 1.098294, -0.08931159, 0.8431373, 1, 0, 1,
-0.8173909, 1.59818, -1.098396, 0.8352941, 1, 0, 1,
-0.8088583, -1.161813, -4.299131, 0.8313726, 1, 0, 1,
-0.7969679, 0.9856099, -1.699105, 0.8235294, 1, 0, 1,
-0.7959215, 0.1228387, -0.6845874, 0.8196079, 1, 0, 1,
-0.7958013, 1.782284, -1.681476, 0.8117647, 1, 0, 1,
-0.7902647, 0.4818735, 0.8493649, 0.8078431, 1, 0, 1,
-0.7864421, 1.41372, -0.2551757, 0.8, 1, 0, 1,
-0.7851864, 0.9881744, -1.783707, 0.7921569, 1, 0, 1,
-0.7804632, 1.270551, -0.1161923, 0.7882353, 1, 0, 1,
-0.7776753, 1.07917, -0.218187, 0.7803922, 1, 0, 1,
-0.7737023, -0.9868507, -1.307349, 0.7764706, 1, 0, 1,
-0.7731526, 1.498169, -0.3885279, 0.7686275, 1, 0, 1,
-0.7709033, -0.02145929, -2.092278, 0.7647059, 1, 0, 1,
-0.7699869, 0.8180855, 0.2486471, 0.7568628, 1, 0, 1,
-0.7614984, 1.840779, 0.1292043, 0.7529412, 1, 0, 1,
-0.7609201, 2.083143, -1.182175, 0.7450981, 1, 0, 1,
-0.7556326, -0.676231, -1.369126, 0.7411765, 1, 0, 1,
-0.7507848, -0.389764, -2.716683, 0.7333333, 1, 0, 1,
-0.7477681, 0.6256114, -0.947381, 0.7294118, 1, 0, 1,
-0.7474448, -0.2988003, -2.037756, 0.7215686, 1, 0, 1,
-0.7466618, 0.0264766, -2.566619, 0.7176471, 1, 0, 1,
-0.7387121, 0.4848329, -0.7266156, 0.7098039, 1, 0, 1,
-0.7378613, 0.8810169, -0.8347632, 0.7058824, 1, 0, 1,
-0.7348626, 1.750699, -1.236045, 0.6980392, 1, 0, 1,
-0.7322367, 0.4370357, -1.879067, 0.6901961, 1, 0, 1,
-0.7212278, 0.3239363, -0.1186304, 0.6862745, 1, 0, 1,
-0.7155084, 0.6875019, 0.3044982, 0.6784314, 1, 0, 1,
-0.7140194, 0.7608027, -1.936186, 0.6745098, 1, 0, 1,
-0.7133858, 0.2545876, -0.9390061, 0.6666667, 1, 0, 1,
-0.7127016, 0.257076, -1.441168, 0.6627451, 1, 0, 1,
-0.7086068, 0.1375181, -3.575692, 0.654902, 1, 0, 1,
-0.7077935, 0.4092526, 0.6590146, 0.6509804, 1, 0, 1,
-0.7032716, -1.252454, -3.183202, 0.6431373, 1, 0, 1,
-0.7026529, 1.127376, -0.4849262, 0.6392157, 1, 0, 1,
-0.7000909, -0.929643, -1.660435, 0.6313726, 1, 0, 1,
-0.6976637, 1.420032, -0.733995, 0.627451, 1, 0, 1,
-0.6950859, -1.129804, -1.202296, 0.6196079, 1, 0, 1,
-0.6933274, -1.244271, -3.249539, 0.6156863, 1, 0, 1,
-0.6907472, 0.4034676, -3.176806, 0.6078432, 1, 0, 1,
-0.6888279, -0.1864295, -1.185189, 0.6039216, 1, 0, 1,
-0.6881832, 1.163958, -0.6024714, 0.5960785, 1, 0, 1,
-0.6859925, -0.8822893, -2.935455, 0.5882353, 1, 0, 1,
-0.6824219, -1.224195, -1.378463, 0.5843138, 1, 0, 1,
-0.6791441, 0.3594176, -1.334821, 0.5764706, 1, 0, 1,
-0.6774629, 0.6304458, 0.571948, 0.572549, 1, 0, 1,
-0.6773199, 0.08851684, -1.232478, 0.5647059, 1, 0, 1,
-0.6721521, -0.9862385, -2.276512, 0.5607843, 1, 0, 1,
-0.671407, 0.352502, -0.7863109, 0.5529412, 1, 0, 1,
-0.6663725, -0.7877895, -1.828081, 0.5490196, 1, 0, 1,
-0.6654964, 0.3843946, -1.892348, 0.5411765, 1, 0, 1,
-0.6646303, 2.381725, 1.06059, 0.5372549, 1, 0, 1,
-0.663061, -0.00320224, -2.400333, 0.5294118, 1, 0, 1,
-0.6606064, 1.336269, 0.6584011, 0.5254902, 1, 0, 1,
-0.6544177, 0.01699993, -2.187429, 0.5176471, 1, 0, 1,
-0.6530148, 0.6912411, -0.5918882, 0.5137255, 1, 0, 1,
-0.6523753, -0.1401256, -1.443764, 0.5058824, 1, 0, 1,
-0.6470734, -0.7808825, -2.648593, 0.5019608, 1, 0, 1,
-0.6424952, 1.190848, 0.006947188, 0.4941176, 1, 0, 1,
-0.6398066, 0.67339, -0.8489799, 0.4862745, 1, 0, 1,
-0.6344265, 1.52221, -0.2019819, 0.4823529, 1, 0, 1,
-0.6298627, 0.02216711, -2.163725, 0.4745098, 1, 0, 1,
-0.6297008, -0.2139739, -1.974462, 0.4705882, 1, 0, 1,
-0.6206904, -1.212237, -3.567854, 0.4627451, 1, 0, 1,
-0.6190323, 3.029213, 0.9004431, 0.4588235, 1, 0, 1,
-0.6183051, 0.7155427, -1.324183, 0.4509804, 1, 0, 1,
-0.6176897, -0.006043779, -1.815873, 0.4470588, 1, 0, 1,
-0.6147239, -0.1270223, -2.240777, 0.4392157, 1, 0, 1,
-0.6146025, -1.079443, -1.197191, 0.4352941, 1, 0, 1,
-0.614498, -0.2026701, -0.3768515, 0.427451, 1, 0, 1,
-0.6052769, -0.8745429, -0.9987889, 0.4235294, 1, 0, 1,
-0.5991971, -1.289923, -2.925913, 0.4156863, 1, 0, 1,
-0.5956596, -0.04558636, -0.7901856, 0.4117647, 1, 0, 1,
-0.5936077, -1.033175, -2.323951, 0.4039216, 1, 0, 1,
-0.5921368, -1.951414, -2.841484, 0.3960784, 1, 0, 1,
-0.5883716, 0.2053437, -0.3128149, 0.3921569, 1, 0, 1,
-0.5838061, 0.3873471, -2.198191, 0.3843137, 1, 0, 1,
-0.5787937, -0.9191355, -3.078651, 0.3803922, 1, 0, 1,
-0.5757539, 0.6038551, -0.003282516, 0.372549, 1, 0, 1,
-0.5750334, -1.426526, -2.818898, 0.3686275, 1, 0, 1,
-0.5725724, -1.600653, -2.792427, 0.3607843, 1, 0, 1,
-0.5698298, 1.818683, -0.8955523, 0.3568628, 1, 0, 1,
-0.5691948, -0.4926977, -2.786931, 0.3490196, 1, 0, 1,
-0.5686391, 2.496829, -0.04867716, 0.345098, 1, 0, 1,
-0.5683976, 0.913397, -0.27018, 0.3372549, 1, 0, 1,
-0.56635, -0.3972431, -3.406688, 0.3333333, 1, 0, 1,
-0.5632613, 0.41783, -1.704939, 0.3254902, 1, 0, 1,
-0.5632581, -1.067843, -1.13945, 0.3215686, 1, 0, 1,
-0.5563699, -0.6715853, -3.74944, 0.3137255, 1, 0, 1,
-0.5556492, 0.6528658, -0.2360153, 0.3098039, 1, 0, 1,
-0.5514632, 1.380123, -0.8649195, 0.3019608, 1, 0, 1,
-0.5491277, -0.7520677, -1.934846, 0.2941177, 1, 0, 1,
-0.5443475, 0.6855175, -1.09105, 0.2901961, 1, 0, 1,
-0.5415676, 0.6250561, -0.3612145, 0.282353, 1, 0, 1,
-0.5348319, -0.8161736, -4.390894, 0.2784314, 1, 0, 1,
-0.5312037, -1.382406, -4.158537, 0.2705882, 1, 0, 1,
-0.5311631, 0.08188068, -0.8069778, 0.2666667, 1, 0, 1,
-0.5275725, 0.2523835, -0.6783412, 0.2588235, 1, 0, 1,
-0.5274782, 0.04738167, -0.1518934, 0.254902, 1, 0, 1,
-0.5257928, -0.1590267, -2.497906, 0.2470588, 1, 0, 1,
-0.5175709, 0.8933711, 0.273116, 0.2431373, 1, 0, 1,
-0.5157802, -0.5148446, -2.269885, 0.2352941, 1, 0, 1,
-0.5089567, -0.1480622, -0.6292723, 0.2313726, 1, 0, 1,
-0.5083735, 0.3416471, -1.054237, 0.2235294, 1, 0, 1,
-0.5075248, 0.8465844, 0.2427221, 0.2196078, 1, 0, 1,
-0.4950745, -1.321753, -3.866248, 0.2117647, 1, 0, 1,
-0.490838, -1.085938, -3.138659, 0.2078431, 1, 0, 1,
-0.4896363, 0.7513894, -2.60356, 0.2, 1, 0, 1,
-0.4894229, -1.008089, -3.876435, 0.1921569, 1, 0, 1,
-0.4880466, -0.6476409, -1.664308, 0.1882353, 1, 0, 1,
-0.4869108, 0.9765047, -0.521892, 0.1803922, 1, 0, 1,
-0.4825933, -1.022932, -3.244077, 0.1764706, 1, 0, 1,
-0.4818381, 0.4864633, -0.8403137, 0.1686275, 1, 0, 1,
-0.4705303, -0.9923282, -1.740015, 0.1647059, 1, 0, 1,
-0.4704857, 0.3085906, 0.9618262, 0.1568628, 1, 0, 1,
-0.4658545, -0.04087868, 0.1312133, 0.1529412, 1, 0, 1,
-0.4632112, -0.3770525, -3.192313, 0.145098, 1, 0, 1,
-0.4621785, 0.133643, -2.093054, 0.1411765, 1, 0, 1,
-0.4589067, -0.8262011, -2.377726, 0.1333333, 1, 0, 1,
-0.4568337, 0.8104094, -1.168713, 0.1294118, 1, 0, 1,
-0.4559098, 0.3597279, -0.2986886, 0.1215686, 1, 0, 1,
-0.4537834, 1.842172, 0.8721604, 0.1176471, 1, 0, 1,
-0.4507483, 0.6716566, -0.3826251, 0.1098039, 1, 0, 1,
-0.4487114, 0.6689442, -0.07439186, 0.1058824, 1, 0, 1,
-0.4450011, -0.4506965, -3.209103, 0.09803922, 1, 0, 1,
-0.4433996, -0.5003371, -1.059727, 0.09019608, 1, 0, 1,
-0.4421819, -0.3010597, -4.056605, 0.08627451, 1, 0, 1,
-0.4416631, -0.2644662, -2.539339, 0.07843138, 1, 0, 1,
-0.4407624, -0.9201348, -2.253203, 0.07450981, 1, 0, 1,
-0.4369611, 0.9313591, -1.637539, 0.06666667, 1, 0, 1,
-0.4341252, 0.3410798, -0.7972209, 0.0627451, 1, 0, 1,
-0.4334638, 0.5401272, 0.6525162, 0.05490196, 1, 0, 1,
-0.4308031, 0.3507007, -1.881733, 0.05098039, 1, 0, 1,
-0.4307539, -0.6780828, -3.223133, 0.04313726, 1, 0, 1,
-0.4271992, -1.087343, -2.250852, 0.03921569, 1, 0, 1,
-0.4249116, 1.362324, -1.459231, 0.03137255, 1, 0, 1,
-0.4248901, 1.363595, -0.7149189, 0.02745098, 1, 0, 1,
-0.4243579, 0.4141553, -0.2776878, 0.01960784, 1, 0, 1,
-0.4155254, -0.07237987, -2.344164, 0.01568628, 1, 0, 1,
-0.4152087, -1.421516, -0.343349, 0.007843138, 1, 0, 1,
-0.4149814, 1.44747, 0.4336092, 0.003921569, 1, 0, 1,
-0.4128201, 1.95857, -0.7737902, 0, 1, 0.003921569, 1,
-0.4095063, -0.3490319, -2.321174, 0, 1, 0.01176471, 1,
-0.4083116, 1.93785, 0.009563585, 0, 1, 0.01568628, 1,
-0.4080141, -1.704359, -1.358516, 0, 1, 0.02352941, 1,
-0.4073294, -0.7754092, -2.910956, 0, 1, 0.02745098, 1,
-0.3914835, 0.1936618, -0.03136082, 0, 1, 0.03529412, 1,
-0.390856, -0.1908723, -3.061953, 0, 1, 0.03921569, 1,
-0.3864799, -0.0331514, -3.073784, 0, 1, 0.04705882, 1,
-0.3830195, 0.8739779, 1.648429, 0, 1, 0.05098039, 1,
-0.3800516, -2.39361, -2.611328, 0, 1, 0.05882353, 1,
-0.3779054, -0.04512915, -1.438191, 0, 1, 0.0627451, 1,
-0.3763467, -0.1542412, -2.750203, 0, 1, 0.07058824, 1,
-0.3755107, -0.7781203, -2.892303, 0, 1, 0.07450981, 1,
-0.3731526, 0.1270211, -0.2255939, 0, 1, 0.08235294, 1,
-0.3723388, 0.7575163, -0.1877777, 0, 1, 0.08627451, 1,
-0.3597382, -0.7200988, -1.791634, 0, 1, 0.09411765, 1,
-0.3527041, -1.08136, -3.41463, 0, 1, 0.1019608, 1,
-0.3512648, 0.4898328, -0.4817767, 0, 1, 0.1058824, 1,
-0.3503745, -1.161755, -1.480652, 0, 1, 0.1137255, 1,
-0.3497446, -0.1844572, -0.6612708, 0, 1, 0.1176471, 1,
-0.3492366, -0.06906205, -0.9444466, 0, 1, 0.1254902, 1,
-0.3473483, 1.713458, 0.9239908, 0, 1, 0.1294118, 1,
-0.3472473, -0.7482819, -3.009203, 0, 1, 0.1372549, 1,
-0.3468046, -1.232298, -2.144155, 0, 1, 0.1411765, 1,
-0.3451836, 0.1576412, -0.9539421, 0, 1, 0.1490196, 1,
-0.3444939, -0.09257569, -1.796272, 0, 1, 0.1529412, 1,
-0.3433184, -0.6355469, -3.609182, 0, 1, 0.1607843, 1,
-0.33988, -0.7910767, -3.319751, 0, 1, 0.1647059, 1,
-0.3392251, 0.6311286, -0.8994068, 0, 1, 0.172549, 1,
-0.3372754, 1.112999, -0.7707735, 0, 1, 0.1764706, 1,
-0.3317655, 0.4778413, 0.653638, 0, 1, 0.1843137, 1,
-0.331702, 1.590948, 0.4067989, 0, 1, 0.1882353, 1,
-0.3317007, -1.536033, -2.040356, 0, 1, 0.1960784, 1,
-0.3307042, -0.7106694, -3.659892, 0, 1, 0.2039216, 1,
-0.3274758, 1.104755, 1.672552, 0, 1, 0.2078431, 1,
-0.3228692, -0.5840831, -2.083472, 0, 1, 0.2156863, 1,
-0.3156538, -0.8283517, -4.12652, 0, 1, 0.2196078, 1,
-0.3142394, -0.7845883, -3.853797, 0, 1, 0.227451, 1,
-0.3082345, 0.9450537, -0.8371341, 0, 1, 0.2313726, 1,
-0.3081653, -0.5051473, -2.703481, 0, 1, 0.2392157, 1,
-0.3059525, -0.6773323, -3.252122, 0, 1, 0.2431373, 1,
-0.3041079, 0.4579031, -2.19204, 0, 1, 0.2509804, 1,
-0.3033903, -0.5059012, -2.414607, 0, 1, 0.254902, 1,
-0.2999325, -1.07258, -4.213712, 0, 1, 0.2627451, 1,
-0.293539, 0.04147719, -0.4355254, 0, 1, 0.2666667, 1,
-0.2928842, 2.196368, 0.8812494, 0, 1, 0.2745098, 1,
-0.2838635, 0.6133577, -2.623068, 0, 1, 0.2784314, 1,
-0.2825229, 0.176102, -1.107492, 0, 1, 0.2862745, 1,
-0.2817296, 2.092478, 0.7417526, 0, 1, 0.2901961, 1,
-0.2775008, 2.171727, -0.5815976, 0, 1, 0.2980392, 1,
-0.2743442, 0.611266, 1.224452, 0, 1, 0.3058824, 1,
-0.2733155, -1.644452, -1.622965, 0, 1, 0.3098039, 1,
-0.2726313, 0.1199258, -1.3255, 0, 1, 0.3176471, 1,
-0.2722538, -0.3554286, -3.241453, 0, 1, 0.3215686, 1,
-0.271435, -2.786678, -4.34714, 0, 1, 0.3294118, 1,
-0.2597266, 0.3308465, -0.5407307, 0, 1, 0.3333333, 1,
-0.2593978, 1.03554, 1.982963, 0, 1, 0.3411765, 1,
-0.2591383, 2.437973, -0.3003196, 0, 1, 0.345098, 1,
-0.2548392, -0.06441966, -1.527123, 0, 1, 0.3529412, 1,
-0.2541894, 0.5711352, -0.3323037, 0, 1, 0.3568628, 1,
-0.2519763, -1.035275, -4.740819, 0, 1, 0.3647059, 1,
-0.2472029, -1.438742, -2.734919, 0, 1, 0.3686275, 1,
-0.2471645, -0.8790702, -4.232677, 0, 1, 0.3764706, 1,
-0.2438456, -0.2278568, -2.305864, 0, 1, 0.3803922, 1,
-0.2437305, -0.03200933, -2.844278, 0, 1, 0.3882353, 1,
-0.2411245, 1.416437, -0.01062213, 0, 1, 0.3921569, 1,
-0.2389815, 0.5551057, -0.09746736, 0, 1, 0.4, 1,
-0.2341051, -0.582043, -2.912554, 0, 1, 0.4078431, 1,
-0.227749, -0.9800239, -3.860439, 0, 1, 0.4117647, 1,
-0.2231697, -0.4905681, -4.155018, 0, 1, 0.4196078, 1,
-0.2199499, -1.13212, -2.824446, 0, 1, 0.4235294, 1,
-0.2135798, 1.018755, -0.4160002, 0, 1, 0.4313726, 1,
-0.2132377, 0.7068725, -2.131288, 0, 1, 0.4352941, 1,
-0.2118285, -2.00219, -1.514623, 0, 1, 0.4431373, 1,
-0.2099832, -1.436142, -3.387148, 0, 1, 0.4470588, 1,
-0.1985145, 1.267528, -0.4960743, 0, 1, 0.454902, 1,
-0.1978586, 1.195417, 0.9782494, 0, 1, 0.4588235, 1,
-0.192247, 0.3148722, -0.5277004, 0, 1, 0.4666667, 1,
-0.1904996, -0.9548137, -4.117685, 0, 1, 0.4705882, 1,
-0.1882115, 0.3549086, -0.9502898, 0, 1, 0.4784314, 1,
-0.1875354, 0.9771766, 0.1400413, 0, 1, 0.4823529, 1,
-0.1832893, 0.5189208, -0.3734087, 0, 1, 0.4901961, 1,
-0.1832176, 0.9353892, -1.685258, 0, 1, 0.4941176, 1,
-0.1824372, 0.02141375, -1.411763, 0, 1, 0.5019608, 1,
-0.1775722, -1.283478, -5.735183, 0, 1, 0.509804, 1,
-0.1775087, -2.052416, -2.124856, 0, 1, 0.5137255, 1,
-0.1759521, 1.084355, 1.41626, 0, 1, 0.5215687, 1,
-0.1715438, -0.4768559, -3.667542, 0, 1, 0.5254902, 1,
-0.1662681, 0.007938316, -0.481334, 0, 1, 0.5333334, 1,
-0.1646651, -0.6975769, -2.909917, 0, 1, 0.5372549, 1,
-0.1632395, -1.184863, -2.374533, 0, 1, 0.5450981, 1,
-0.1622337, 0.3786729, -0.810419, 0, 1, 0.5490196, 1,
-0.1585782, 1.47575, -0.8786768, 0, 1, 0.5568628, 1,
-0.1583137, 1.680884, -0.3606895, 0, 1, 0.5607843, 1,
-0.1529436, 0.9964193, 0.6493292, 0, 1, 0.5686275, 1,
-0.1523419, -0.5580761, -2.889381, 0, 1, 0.572549, 1,
-0.1403958, -0.2955518, -2.749988, 0, 1, 0.5803922, 1,
-0.1329238, 0.6800112, -1.303716, 0, 1, 0.5843138, 1,
-0.1319908, -0.8578017, -2.816765, 0, 1, 0.5921569, 1,
-0.1306514, 1.208813, 0.7323576, 0, 1, 0.5960785, 1,
-0.1300391, 0.2177867, -0.6358294, 0, 1, 0.6039216, 1,
-0.1297902, -0.01406409, -0.505959, 0, 1, 0.6117647, 1,
-0.1280013, 1.245621, -1.079107, 0, 1, 0.6156863, 1,
-0.1255914, 0.01822997, -0.8575321, 0, 1, 0.6235294, 1,
-0.1240709, 0.3641763, 0.5583739, 0, 1, 0.627451, 1,
-0.1223955, 0.5280864, 0.1408887, 0, 1, 0.6352941, 1,
-0.1216687, 0.3409786, -0.2642793, 0, 1, 0.6392157, 1,
-0.1215068, -0.7764642, -2.967699, 0, 1, 0.6470588, 1,
-0.1214801, -0.2000203, -1.787679, 0, 1, 0.6509804, 1,
-0.1175437, 0.03924893, -2.630289, 0, 1, 0.6588235, 1,
-0.117106, -0.2520456, -3.296003, 0, 1, 0.6627451, 1,
-0.1141277, 0.9504651, 0.4574063, 0, 1, 0.6705883, 1,
-0.1114135, -1.230222, -5.853113, 0, 1, 0.6745098, 1,
-0.1113102, -1.468818, -3.458656, 0, 1, 0.682353, 1,
-0.10953, 0.3494733, 0.4447119, 0, 1, 0.6862745, 1,
-0.1093938, -0.9220283, -3.38418, 0, 1, 0.6941177, 1,
-0.1086694, 2.192542, -0.8242935, 0, 1, 0.7019608, 1,
-0.10711, -1.332116, -1.690226, 0, 1, 0.7058824, 1,
-0.1049239, 0.7422901, -1.408473, 0, 1, 0.7137255, 1,
-0.103381, -1.185577, -4.183627, 0, 1, 0.7176471, 1,
-0.1017263, -0.194161, -2.911447, 0, 1, 0.7254902, 1,
-0.1012889, -3.684032, -4.012076, 0, 1, 0.7294118, 1,
-0.09864839, -0.6198277, -2.897124, 0, 1, 0.7372549, 1,
-0.09524913, -0.7652081, -4.216094, 0, 1, 0.7411765, 1,
-0.09483181, 0.08498184, -0.6619135, 0, 1, 0.7490196, 1,
-0.09236703, -0.6951656, -2.719151, 0, 1, 0.7529412, 1,
-0.09057692, 0.7895609, -0.06799559, 0, 1, 0.7607843, 1,
-0.09048335, -1.948432, -1.351926, 0, 1, 0.7647059, 1,
-0.09023572, 0.2197694, 0.4145666, 0, 1, 0.772549, 1,
-0.08899308, -0.6833685, -3.064129, 0, 1, 0.7764706, 1,
-0.08839101, -0.6751402, -3.79425, 0, 1, 0.7843137, 1,
-0.08747317, -0.218713, -3.572789, 0, 1, 0.7882353, 1,
-0.08492383, 0.1335455, -0.2725335, 0, 1, 0.7960784, 1,
-0.07964747, 0.8960346, -0.6618491, 0, 1, 0.8039216, 1,
-0.07681762, 1.787186, -0.1349697, 0, 1, 0.8078431, 1,
-0.07180863, -1.013976, -2.697268, 0, 1, 0.8156863, 1,
-0.07164204, 0.06439265, 0.7617843, 0, 1, 0.8196079, 1,
-0.07112458, 1.300675, 1.123589, 0, 1, 0.827451, 1,
-0.06927617, -1.428272, -1.963481, 0, 1, 0.8313726, 1,
-0.06405494, -1.925757, -2.204408, 0, 1, 0.8392157, 1,
-0.06318928, 0.6662294, 0.3697024, 0, 1, 0.8431373, 1,
-0.06314293, -1.721886, -3.820006, 0, 1, 0.8509804, 1,
-0.06304213, 0.9853076, 0.49744, 0, 1, 0.854902, 1,
-0.0621536, 1.055958, 0.5988545, 0, 1, 0.8627451, 1,
-0.0599829, -0.03231141, -2.641296, 0, 1, 0.8666667, 1,
-0.05675298, 0.7780988, 1.768484, 0, 1, 0.8745098, 1,
-0.04820074, -0.09447202, -1.773065, 0, 1, 0.8784314, 1,
-0.04602645, -0.3744306, -3.681685, 0, 1, 0.8862745, 1,
-0.0454407, -1.684224, -4.949536, 0, 1, 0.8901961, 1,
-0.04426035, 0.03798249, 1.258753, 0, 1, 0.8980392, 1,
-0.04406989, 1.162942, -1.292406, 0, 1, 0.9058824, 1,
-0.0432274, -0.9968385, -3.600645, 0, 1, 0.9098039, 1,
-0.03290649, 0.09056675, 1.767029, 0, 1, 0.9176471, 1,
-0.03189417, -1.875803, -2.508836, 0, 1, 0.9215686, 1,
-0.03144306, 2.309897, -0.6272176, 0, 1, 0.9294118, 1,
-0.02994534, 0.07440939, -0.09823918, 0, 1, 0.9333333, 1,
-0.02641217, -1.817064, -3.839579, 0, 1, 0.9411765, 1,
-0.02509508, -1.088464, -3.736678, 0, 1, 0.945098, 1,
-0.02002642, -1.802775, -2.970959, 0, 1, 0.9529412, 1,
-0.01902714, 0.6974914, -0.06753118, 0, 1, 0.9568627, 1,
-0.01566993, 1.263834, -1.423103, 0, 1, 0.9647059, 1,
-0.01386635, 1.353022, 0.581556, 0, 1, 0.9686275, 1,
-0.006243523, -0.9780981, -2.658576, 0, 1, 0.9764706, 1,
-0.005684423, -0.6233006, -2.568567, 0, 1, 0.9803922, 1,
-0.005222181, -1.106885, -4.321863, 0, 1, 0.9882353, 1,
-0.001631479, -0.7114201, -3.806189, 0, 1, 0.9921569, 1,
-0.0001556752, 0.2300322, 0.2716907, 0, 1, 1, 1,
-0.0001391617, 0.0513175, 1.543646, 0, 0.9921569, 1, 1,
0.0001910699, -1.128271, 2.705294, 0, 0.9882353, 1, 1,
0.000337147, -0.7594571, 4.599782, 0, 0.9803922, 1, 1,
0.006606389, -0.4393371, 4.012612, 0, 0.9764706, 1, 1,
0.009249671, 1.686114, 0.6303232, 0, 0.9686275, 1, 1,
0.01260532, -0.8661293, 4.148652, 0, 0.9647059, 1, 1,
0.01386954, 0.02318372, 0.1488638, 0, 0.9568627, 1, 1,
0.01816302, 0.4694531, -0.7639077, 0, 0.9529412, 1, 1,
0.02105153, -0.4426171, 1.052116, 0, 0.945098, 1, 1,
0.02264144, 1.464274, -0.1580235, 0, 0.9411765, 1, 1,
0.02424464, -0.4046818, 1.963448, 0, 0.9333333, 1, 1,
0.02487107, 0.627032, -0.05925864, 0, 0.9294118, 1, 1,
0.02894082, -1.234114, 1.240999, 0, 0.9215686, 1, 1,
0.03412238, 1.683921, 0.8974026, 0, 0.9176471, 1, 1,
0.03715176, -0.5990844, 2.671387, 0, 0.9098039, 1, 1,
0.03715854, -0.8017089, 4.820768, 0, 0.9058824, 1, 1,
0.03778278, 1.506212, -1.840001, 0, 0.8980392, 1, 1,
0.03838336, 0.2870972, 0.889094, 0, 0.8901961, 1, 1,
0.03958948, 0.4020121, 1.01175, 0, 0.8862745, 1, 1,
0.0406246, 0.3024539, 0.8031832, 0, 0.8784314, 1, 1,
0.04348854, -0.09238893, 2.657725, 0, 0.8745098, 1, 1,
0.04440252, 1.521864, 0.3836522, 0, 0.8666667, 1, 1,
0.04461763, -0.7681476, 4.697495, 0, 0.8627451, 1, 1,
0.04551237, -0.3627314, 2.994908, 0, 0.854902, 1, 1,
0.04848498, -0.4571052, 2.90298, 0, 0.8509804, 1, 1,
0.0486863, 0.5730335, 1.863913, 0, 0.8431373, 1, 1,
0.05339041, 1.53885, 1.658605, 0, 0.8392157, 1, 1,
0.05417607, 0.7432594, 0.2895005, 0, 0.8313726, 1, 1,
0.05501883, -0.01631405, 0.04104337, 0, 0.827451, 1, 1,
0.05581743, -0.954983, 4.410177, 0, 0.8196079, 1, 1,
0.05888906, -0.563732, 0.8847457, 0, 0.8156863, 1, 1,
0.05944502, 0.5392164, -1.458564, 0, 0.8078431, 1, 1,
0.0604782, 0.01820446, -0.4361345, 0, 0.8039216, 1, 1,
0.0619606, -1.370068, 2.831969, 0, 0.7960784, 1, 1,
0.0632594, 1.023605, -0.72655, 0, 0.7882353, 1, 1,
0.06999996, 0.6661431, 0.2976804, 0, 0.7843137, 1, 1,
0.07076851, -0.49192, 1.793779, 0, 0.7764706, 1, 1,
0.07125843, -0.258384, 2.487196, 0, 0.772549, 1, 1,
0.07304092, 0.7606677, 1.620627, 0, 0.7647059, 1, 1,
0.07638609, -1.197349, 5.382302, 0, 0.7607843, 1, 1,
0.07735, 1.179996, 0.9863892, 0, 0.7529412, 1, 1,
0.07806503, -1.611398, 1.488352, 0, 0.7490196, 1, 1,
0.0785082, 0.9216096, -0.2412547, 0, 0.7411765, 1, 1,
0.07947617, -1.55686, 3.038772, 0, 0.7372549, 1, 1,
0.08188237, -0.2372233, 1.373989, 0, 0.7294118, 1, 1,
0.08568939, -0.8325542, 2.572628, 0, 0.7254902, 1, 1,
0.09407152, 0.070164, 0.7457863, 0, 0.7176471, 1, 1,
0.09500124, -0.0239529, 2.017119, 0, 0.7137255, 1, 1,
0.1011618, 0.2057851, 2.566392, 0, 0.7058824, 1, 1,
0.1042315, 0.7589951, -0.5920237, 0, 0.6980392, 1, 1,
0.104401, 0.04112627, 1.204472, 0, 0.6941177, 1, 1,
0.1105553, 0.9181479, -0.8636768, 0, 0.6862745, 1, 1,
0.1108045, 0.08623566, 0.8445531, 0, 0.682353, 1, 1,
0.1111936, 0.4894222, 0.8941084, 0, 0.6745098, 1, 1,
0.1114356, 0.5482274, 0.02973222, 0, 0.6705883, 1, 1,
0.1120063, 1.423103, 0.2140445, 0, 0.6627451, 1, 1,
0.1120374, -1.316403, 3.753987, 0, 0.6588235, 1, 1,
0.1236597, -0.6573394, 3.100562, 0, 0.6509804, 1, 1,
0.1266739, -1.163926, 2.861696, 0, 0.6470588, 1, 1,
0.12795, 0.3336312, 1.47674, 0, 0.6392157, 1, 1,
0.1297099, 0.1729636, 1.082324, 0, 0.6352941, 1, 1,
0.1297612, -1.584842, 2.187284, 0, 0.627451, 1, 1,
0.1298728, 0.6958028, 0.3831384, 0, 0.6235294, 1, 1,
0.1317423, -1.362897, 2.7806, 0, 0.6156863, 1, 1,
0.132017, -0.9416034, 3.756946, 0, 0.6117647, 1, 1,
0.1334624, 1.208514, -0.4378205, 0, 0.6039216, 1, 1,
0.1362262, -2.078064, 2.404505, 0, 0.5960785, 1, 1,
0.1374588, -0.4887402, 2.420482, 0, 0.5921569, 1, 1,
0.1403247, 0.353283, 0.6563041, 0, 0.5843138, 1, 1,
0.1437922, -0.6271452, 2.165572, 0, 0.5803922, 1, 1,
0.1484876, -0.1473969, 2.637608, 0, 0.572549, 1, 1,
0.1558985, 0.4625078, -1.358231, 0, 0.5686275, 1, 1,
0.1566891, 0.7384886, -1.404751, 0, 0.5607843, 1, 1,
0.1571492, 0.8255163, -1.520417, 0, 0.5568628, 1, 1,
0.1575051, -0.247842, 3.268815, 0, 0.5490196, 1, 1,
0.1605136, -0.1085965, 1.011752, 0, 0.5450981, 1, 1,
0.1649731, 1.779462, -0.979564, 0, 0.5372549, 1, 1,
0.1664209, 0.9665332, -0.6695214, 0, 0.5333334, 1, 1,
0.1747282, 1.019826, 0.2499592, 0, 0.5254902, 1, 1,
0.1782061, 1.083692, 1.513558, 0, 0.5215687, 1, 1,
0.1820287, -0.2285752, 3.164192, 0, 0.5137255, 1, 1,
0.1830067, 0.3027585, 0.5183171, 0, 0.509804, 1, 1,
0.1841314, -0.30525, 3.10556, 0, 0.5019608, 1, 1,
0.1846699, -0.40913, 4.065372, 0, 0.4941176, 1, 1,
0.1855055, 0.4034895, -0.1059129, 0, 0.4901961, 1, 1,
0.1866526, -0.7221479, 3.587274, 0, 0.4823529, 1, 1,
0.1871475, 1.126801, 1.19731, 0, 0.4784314, 1, 1,
0.1872212, -0.6907667, 3.584545, 0, 0.4705882, 1, 1,
0.1878112, 1.06062, -0.04907036, 0, 0.4666667, 1, 1,
0.1927918, -0.5489689, 3.563972, 0, 0.4588235, 1, 1,
0.1970796, -0.3480089, 2.037357, 0, 0.454902, 1, 1,
0.2011861, -0.3831241, 3.653227, 0, 0.4470588, 1, 1,
0.2016297, -0.8147128, 2.459868, 0, 0.4431373, 1, 1,
0.2026791, -0.9054891, 3.26643, 0, 0.4352941, 1, 1,
0.2028059, -0.4429014, 2.372658, 0, 0.4313726, 1, 1,
0.2033483, -1.114917, 2.518132, 0, 0.4235294, 1, 1,
0.2065756, 0.04705926, 1.858911, 0, 0.4196078, 1, 1,
0.2074975, 0.1644878, 1.212789, 0, 0.4117647, 1, 1,
0.2083777, -0.2551751, 1.769693, 0, 0.4078431, 1, 1,
0.2093138, -0.4278836, 2.811146, 0, 0.4, 1, 1,
0.2099451, -2.14105, 2.839449, 0, 0.3921569, 1, 1,
0.2192056, -0.210708, 3.06782, 0, 0.3882353, 1, 1,
0.2300354, 0.656148, -0.4372746, 0, 0.3803922, 1, 1,
0.2326117, -0.6283497, 2.168753, 0, 0.3764706, 1, 1,
0.2428175, 0.1414687, 1.02584, 0, 0.3686275, 1, 1,
0.2435067, 0.1516035, -0.2730251, 0, 0.3647059, 1, 1,
0.2483111, 1.709804, -2.344748, 0, 0.3568628, 1, 1,
0.2495286, 0.257882, 0.9011973, 0, 0.3529412, 1, 1,
0.2505851, -0.7186217, 3.179222, 0, 0.345098, 1, 1,
0.2514121, -0.7739989, 3.592223, 0, 0.3411765, 1, 1,
0.2528752, -1.117492, 2.527643, 0, 0.3333333, 1, 1,
0.2561818, 0.4093962, 1.562327, 0, 0.3294118, 1, 1,
0.2599264, 2.29949, -0.03716647, 0, 0.3215686, 1, 1,
0.2671618, -1.625423, 4.115698, 0, 0.3176471, 1, 1,
0.268664, 1.711574, 0.9727609, 0, 0.3098039, 1, 1,
0.2720701, -0.9994982, 2.739983, 0, 0.3058824, 1, 1,
0.2779495, -0.2325472, 2.448242, 0, 0.2980392, 1, 1,
0.2793495, -0.4790539, 2.23511, 0, 0.2901961, 1, 1,
0.2823378, -0.1302025, 1.450933, 0, 0.2862745, 1, 1,
0.284972, 0.1099231, 0.7293769, 0, 0.2784314, 1, 1,
0.3028503, 0.4120004, 0.8268381, 0, 0.2745098, 1, 1,
0.3037187, 2.177873, 1.665843, 0, 0.2666667, 1, 1,
0.3049237, -0.4382014, 2.134999, 0, 0.2627451, 1, 1,
0.3082732, -1.735768, 2.48327, 0, 0.254902, 1, 1,
0.3120474, -1.611026, 3.622556, 0, 0.2509804, 1, 1,
0.3159271, 0.3384168, -1.244608, 0, 0.2431373, 1, 1,
0.3174205, -1.165172, 2.620011, 0, 0.2392157, 1, 1,
0.3184627, -0.7131993, 2.362584, 0, 0.2313726, 1, 1,
0.3191514, 1.750663, 0.8538175, 0, 0.227451, 1, 1,
0.3240586, 0.08089689, 0.1515268, 0, 0.2196078, 1, 1,
0.325758, -0.5928192, 3.521052, 0, 0.2156863, 1, 1,
0.3259797, -0.7684384, 2.957181, 0, 0.2078431, 1, 1,
0.3376188, 1.54899, 0.16416, 0, 0.2039216, 1, 1,
0.3394306, -0.3227277, 3.204809, 0, 0.1960784, 1, 1,
0.3423072, 0.2509556, 0.7007715, 0, 0.1882353, 1, 1,
0.3437666, -0.3842112, 1.882546, 0, 0.1843137, 1, 1,
0.3508426, -1.682685, 4.581652, 0, 0.1764706, 1, 1,
0.3517338, 0.9597108, 0.007843231, 0, 0.172549, 1, 1,
0.3565519, -1.681213, 3.15978, 0, 0.1647059, 1, 1,
0.3612589, -0.04940182, 2.607325, 0, 0.1607843, 1, 1,
0.3637294, 1.021649, 0.6371497, 0, 0.1529412, 1, 1,
0.366434, -0.2297985, 3.27928, 0, 0.1490196, 1, 1,
0.3672489, -0.9241331, 2.786273, 0, 0.1411765, 1, 1,
0.368221, -0.2638108, 2.572634, 0, 0.1372549, 1, 1,
0.3717383, -0.5162897, 2.221502, 0, 0.1294118, 1, 1,
0.3722694, -0.0521936, 2.792204, 0, 0.1254902, 1, 1,
0.3752623, -0.2180825, 2.617364, 0, 0.1176471, 1, 1,
0.3809215, 0.560113, 1.812173, 0, 0.1137255, 1, 1,
0.3886874, -1.117551, 2.226621, 0, 0.1058824, 1, 1,
0.3921011, -0.2072968, 1.111329, 0, 0.09803922, 1, 1,
0.3949097, 1.077966, 2.160826, 0, 0.09411765, 1, 1,
0.3973502, -0.6306479, 1.941272, 0, 0.08627451, 1, 1,
0.3992674, -0.8987043, 2.902611, 0, 0.08235294, 1, 1,
0.4014721, -0.4814686, 3.045995, 0, 0.07450981, 1, 1,
0.4191432, -0.0825019, 2.569907, 0, 0.07058824, 1, 1,
0.4204523, 0.5043015, 0.529025, 0, 0.0627451, 1, 1,
0.4236098, 0.9512849, 0.662172, 0, 0.05882353, 1, 1,
0.4290585, -0.2097621, 1.548484, 0, 0.05098039, 1, 1,
0.4314949, -1.291736, 2.675655, 0, 0.04705882, 1, 1,
0.4333294, 0.2077004, 3.755444, 0, 0.03921569, 1, 1,
0.4346777, 1.415565, 0.03676028, 0, 0.03529412, 1, 1,
0.4357715, -0.9491532, 1.667414, 0, 0.02745098, 1, 1,
0.4364909, -0.9565043, 2.233043, 0, 0.02352941, 1, 1,
0.4371917, -2.320847, 2.906336, 0, 0.01568628, 1, 1,
0.4418152, -0.6612621, 1.88629, 0, 0.01176471, 1, 1,
0.4465536, -0.2724765, 2.602653, 0, 0.003921569, 1, 1,
0.4493659, -1.469893, 4.576168, 0.003921569, 0, 1, 1,
0.4494515, 0.2778293, 0.292514, 0.007843138, 0, 1, 1,
0.4519944, 0.1607847, 1.885953, 0.01568628, 0, 1, 1,
0.4548527, 1.025407, 0.8386891, 0.01960784, 0, 1, 1,
0.4552818, 1.364234, -0.2182946, 0.02745098, 0, 1, 1,
0.4582373, 0.1131027, -0.9578096, 0.03137255, 0, 1, 1,
0.4609614, 0.7375928, -0.8411433, 0.03921569, 0, 1, 1,
0.4640848, -0.7611931, 4.511193, 0.04313726, 0, 1, 1,
0.4681008, -0.9479148, 3.775573, 0.05098039, 0, 1, 1,
0.4701979, 2.778482, -0.9660341, 0.05490196, 0, 1, 1,
0.4857131, 1.488643, 0.1700394, 0.0627451, 0, 1, 1,
0.4899856, -1.509215, 3.072598, 0.06666667, 0, 1, 1,
0.4903116, -1.209874, 4.578184, 0.07450981, 0, 1, 1,
0.4923165, 0.01637249, 1.823555, 0.07843138, 0, 1, 1,
0.4970112, 0.2261926, 1.246376, 0.08627451, 0, 1, 1,
0.498592, 0.9709541, 1.660749, 0.09019608, 0, 1, 1,
0.5013524, -0.8945071, 3.203679, 0.09803922, 0, 1, 1,
0.5058509, -1.582798, 2.670477, 0.1058824, 0, 1, 1,
0.5080717, -0.7005115, 2.492899, 0.1098039, 0, 1, 1,
0.5131999, -1.786681, 2.958033, 0.1176471, 0, 1, 1,
0.5153486, -1.351924, 2.379081, 0.1215686, 0, 1, 1,
0.5162407, 0.2942332, 0.5392311, 0.1294118, 0, 1, 1,
0.5210129, -1.527837, 2.731125, 0.1333333, 0, 1, 1,
0.5210613, 0.2119471, 3.311827, 0.1411765, 0, 1, 1,
0.5254881, -0.4760492, 2.745831, 0.145098, 0, 1, 1,
0.5258752, -0.5932025, 2.958601, 0.1529412, 0, 1, 1,
0.5272062, 0.6709774, 1.302748, 0.1568628, 0, 1, 1,
0.5337811, 0.9488501, 1.059557, 0.1647059, 0, 1, 1,
0.5339014, -1.244066, 2.695853, 0.1686275, 0, 1, 1,
0.5346756, 0.5580003, -0.5065041, 0.1764706, 0, 1, 1,
0.5356369, 1.139278, -0.1400059, 0.1803922, 0, 1, 1,
0.5359985, 1.382473, 0.3814059, 0.1882353, 0, 1, 1,
0.538137, -0.4278595, 3.713341, 0.1921569, 0, 1, 1,
0.5404605, 1.691609, 1.865947, 0.2, 0, 1, 1,
0.5410256, -0.9550735, 2.698801, 0.2078431, 0, 1, 1,
0.5466779, 1.447833, 1.973653, 0.2117647, 0, 1, 1,
0.5517851, 1.450394, 0.2432051, 0.2196078, 0, 1, 1,
0.5549485, 1.344565, -0.9540247, 0.2235294, 0, 1, 1,
0.5551723, -1.601049, 2.311052, 0.2313726, 0, 1, 1,
0.5555667, 0.1264116, 1.280371, 0.2352941, 0, 1, 1,
0.5713037, 0.6911064, -0.3566685, 0.2431373, 0, 1, 1,
0.5724784, -0.3385516, 1.228013, 0.2470588, 0, 1, 1,
0.5732371, -1.751, 3.454491, 0.254902, 0, 1, 1,
0.5828094, -0.4627088, 2.386881, 0.2588235, 0, 1, 1,
0.585757, -0.06169164, 0.004815282, 0.2666667, 0, 1, 1,
0.5867113, -0.7699383, 1.558048, 0.2705882, 0, 1, 1,
0.5875837, -1.240942, 1.718644, 0.2784314, 0, 1, 1,
0.5876316, 0.3655485, 2.181202, 0.282353, 0, 1, 1,
0.5910696, -1.29924, 2.964885, 0.2901961, 0, 1, 1,
0.5914179, -1.159065, -0.05009996, 0.2941177, 0, 1, 1,
0.593388, -0.9578974, 1.324587, 0.3019608, 0, 1, 1,
0.5994177, 0.3458647, 0.4584151, 0.3098039, 0, 1, 1,
0.6059141, 0.8051751, 1.26976, 0.3137255, 0, 1, 1,
0.607453, 0.2224087, 1.784849, 0.3215686, 0, 1, 1,
0.6078517, -0.3502804, 2.481947, 0.3254902, 0, 1, 1,
0.612216, -1.144176, 3.631689, 0.3333333, 0, 1, 1,
0.6157674, 0.8133138, 1.499632, 0.3372549, 0, 1, 1,
0.6169168, 0.9362012, 0.8156276, 0.345098, 0, 1, 1,
0.6182228, 0.7926885, 0.686365, 0.3490196, 0, 1, 1,
0.6213382, -0.6703716, 2.970985, 0.3568628, 0, 1, 1,
0.6335613, 0.07777287, 0.7090744, 0.3607843, 0, 1, 1,
0.6350437, -1.254586, 1.809531, 0.3686275, 0, 1, 1,
0.6404576, -0.5336344, 1.839208, 0.372549, 0, 1, 1,
0.6522905, -1.673839, 2.106828, 0.3803922, 0, 1, 1,
0.655201, 0.8522798, -0.5007799, 0.3843137, 0, 1, 1,
0.6639475, -0.657324, 4.32012, 0.3921569, 0, 1, 1,
0.6787825, 0.1994625, 0.8087922, 0.3960784, 0, 1, 1,
0.6799514, -1.315577, 3.004412, 0.4039216, 0, 1, 1,
0.6809848, -1.818337, 2.38547, 0.4117647, 0, 1, 1,
0.6890174, 1.972777, 1.381588, 0.4156863, 0, 1, 1,
0.6898164, -1.346352, 1.879052, 0.4235294, 0, 1, 1,
0.6904526, -0.357808, 1.351888, 0.427451, 0, 1, 1,
0.6910672, -0.2100873, 1.535527, 0.4352941, 0, 1, 1,
0.6942528, -1.556095, 4.23329, 0.4392157, 0, 1, 1,
0.694695, 0.6684754, -0.5592343, 0.4470588, 0, 1, 1,
0.6967832, 0.3523205, -0.1136371, 0.4509804, 0, 1, 1,
0.6971697, -0.2700596, -0.02339279, 0.4588235, 0, 1, 1,
0.700669, -1.717978, 2.220498, 0.4627451, 0, 1, 1,
0.7026906, -0.2241763, 2.694942, 0.4705882, 0, 1, 1,
0.7059559, -0.9066141, 3.078058, 0.4745098, 0, 1, 1,
0.7071181, -0.5191463, 3.334345, 0.4823529, 0, 1, 1,
0.7075499, -0.1956589, 1.815238, 0.4862745, 0, 1, 1,
0.7086275, 0.5126293, 2.278299, 0.4941176, 0, 1, 1,
0.7097262, -0.1413448, 3.920407, 0.5019608, 0, 1, 1,
0.7117156, -0.9654443, 1.237565, 0.5058824, 0, 1, 1,
0.7162305, 1.132041, 2.496072, 0.5137255, 0, 1, 1,
0.7195897, 0.6045581, 1.747224, 0.5176471, 0, 1, 1,
0.7249874, -2.729195, 2.477444, 0.5254902, 0, 1, 1,
0.7297344, -1.101103, 2.581496, 0.5294118, 0, 1, 1,
0.7303299, 0.9115812, 0.3825517, 0.5372549, 0, 1, 1,
0.739096, -0.4657565, 2.788962, 0.5411765, 0, 1, 1,
0.7438089, -0.8094323, 3.685205, 0.5490196, 0, 1, 1,
0.7441739, 0.964636, 1.002285, 0.5529412, 0, 1, 1,
0.7443385, -0.9187258, 2.278634, 0.5607843, 0, 1, 1,
0.746451, -0.006811425, 1.095995, 0.5647059, 0, 1, 1,
0.7474531, 0.04667744, 2.237279, 0.572549, 0, 1, 1,
0.7501324, -0.3907127, 2.750016, 0.5764706, 0, 1, 1,
0.7540516, 1.65462, 1.658293, 0.5843138, 0, 1, 1,
0.7560588, 0.09372355, 1.499509, 0.5882353, 0, 1, 1,
0.7574033, -1.425365, 3.621249, 0.5960785, 0, 1, 1,
0.7584053, -1.022769, 2.923089, 0.6039216, 0, 1, 1,
0.7587517, 0.3586303, 1.888694, 0.6078432, 0, 1, 1,
0.7758749, -0.1132719, 1.790733, 0.6156863, 0, 1, 1,
0.780083, -0.1568535, -0.5718884, 0.6196079, 0, 1, 1,
0.7816109, 0.7292292, 0.4686893, 0.627451, 0, 1, 1,
0.7836282, 1.554569, 1.608972, 0.6313726, 0, 1, 1,
0.7842597, 0.7306787, 1.300385, 0.6392157, 0, 1, 1,
0.7847079, 0.1522161, 0.7122278, 0.6431373, 0, 1, 1,
0.7856644, -0.1981946, 3.443552, 0.6509804, 0, 1, 1,
0.7909833, -0.2171893, 1.850011, 0.654902, 0, 1, 1,
0.795193, 0.9383842, 1.865377, 0.6627451, 0, 1, 1,
0.7954358, 1.685949, 0.6975062, 0.6666667, 0, 1, 1,
0.7971495, 1.417775, -1.044797, 0.6745098, 0, 1, 1,
0.7973779, -2.067722, 3.511873, 0.6784314, 0, 1, 1,
0.8000265, -0.7470028, 3.533229, 0.6862745, 0, 1, 1,
0.8003467, 1.600094, 0.2512664, 0.6901961, 0, 1, 1,
0.8017766, 0.865305, 0.8385828, 0.6980392, 0, 1, 1,
0.8057398, 0.9196282, 1.177998, 0.7058824, 0, 1, 1,
0.8066231, 0.5965044, 0.9662452, 0.7098039, 0, 1, 1,
0.8101756, -0.4283787, 0.9688236, 0.7176471, 0, 1, 1,
0.8148394, -0.6168812, 2.624752, 0.7215686, 0, 1, 1,
0.8153937, 0.4080614, 2.334808, 0.7294118, 0, 1, 1,
0.8279799, 0.3888835, 1.202357, 0.7333333, 0, 1, 1,
0.8293536, -0.9455547, 1.636369, 0.7411765, 0, 1, 1,
0.834085, -1.342836, 3.622862, 0.7450981, 0, 1, 1,
0.8378814, 2.074486, 1.395831, 0.7529412, 0, 1, 1,
0.8459284, 0.4731435, 1.548488, 0.7568628, 0, 1, 1,
0.8476823, -1.807178, 2.986449, 0.7647059, 0, 1, 1,
0.8478361, 0.6389099, 1.513485, 0.7686275, 0, 1, 1,
0.8517359, -0.8136577, 1.705485, 0.7764706, 0, 1, 1,
0.8551437, 0.02675003, 1.860878, 0.7803922, 0, 1, 1,
0.8560461, 0.3736952, 2.436174, 0.7882353, 0, 1, 1,
0.8573452, 0.2095876, -0.3020552, 0.7921569, 0, 1, 1,
0.8666053, 1.509102, 0.4446962, 0.8, 0, 1, 1,
0.8987341, -1.530783, 1.662344, 0.8078431, 0, 1, 1,
0.9011332, -0.04426496, 2.226564, 0.8117647, 0, 1, 1,
0.9015711, -0.1669258, 1.662505, 0.8196079, 0, 1, 1,
0.905466, -1.367189, 1.601108, 0.8235294, 0, 1, 1,
0.9099807, -0.06110759, 1.457158, 0.8313726, 0, 1, 1,
0.9122961, -0.3388498, 4.130672, 0.8352941, 0, 1, 1,
0.9147139, -1.013965, 1.418552, 0.8431373, 0, 1, 1,
0.9161642, -0.131996, 1.066016, 0.8470588, 0, 1, 1,
0.9175782, -0.1658362, 3.056097, 0.854902, 0, 1, 1,
0.918219, -0.6400571, 1.649615, 0.8588235, 0, 1, 1,
0.9201841, 1.263157, -0.7942446, 0.8666667, 0, 1, 1,
0.920431, -0.615011, 3.517841, 0.8705882, 0, 1, 1,
0.9208933, 0.8140886, 1.449076, 0.8784314, 0, 1, 1,
0.9255236, 1.051, -0.06995516, 0.8823529, 0, 1, 1,
0.9353239, -0.7570874, 3.619505, 0.8901961, 0, 1, 1,
0.9364035, 0.2390189, 1.418465, 0.8941177, 0, 1, 1,
0.9412767, -0.8338181, -0.06932292, 0.9019608, 0, 1, 1,
0.9414052, 1.361484, -0.5878974, 0.9098039, 0, 1, 1,
0.9466366, 0.02522511, 0.5634521, 0.9137255, 0, 1, 1,
0.9470755, 0.4540456, 1.121989, 0.9215686, 0, 1, 1,
0.9482636, 1.36055, 1.399436, 0.9254902, 0, 1, 1,
0.9526569, 1.580011, 1.075764, 0.9333333, 0, 1, 1,
0.9532033, 0.7770198, 2.712957, 0.9372549, 0, 1, 1,
0.9585223, -0.2160148, 1.533871, 0.945098, 0, 1, 1,
0.9637615, 0.3227107, 1.231506, 0.9490196, 0, 1, 1,
0.9638861, 0.06553795, 1.655275, 0.9568627, 0, 1, 1,
0.9655988, -0.8543807, 3.070298, 0.9607843, 0, 1, 1,
0.9688452, -1.098239, 3.03332, 0.9686275, 0, 1, 1,
0.9739366, -0.6935561, 1.865754, 0.972549, 0, 1, 1,
0.9811937, 0.5151668, 1.346383, 0.9803922, 0, 1, 1,
0.9831569, 0.3349379, 1.782844, 0.9843137, 0, 1, 1,
0.9849171, 0.6388318, 2.131974, 0.9921569, 0, 1, 1,
0.987093, 0.7941604, 2.125886, 0.9960784, 0, 1, 1,
0.9892572, 0.4577903, 0.5939617, 1, 0, 0.9960784, 1,
0.9940414, -1.187029, 2.911887, 1, 0, 0.9882353, 1,
0.9960168, -0.7953581, 2.96785, 1, 0, 0.9843137, 1,
1.000281, -0.1765972, 0.8959729, 1, 0, 0.9764706, 1,
1.003027, -0.4674255, 1.554511, 1, 0, 0.972549, 1,
1.018247, -0.234595, 1.641322, 1, 0, 0.9647059, 1,
1.021015, -0.6436502, 2.901282, 1, 0, 0.9607843, 1,
1.022832, -0.378328, 2.618369, 1, 0, 0.9529412, 1,
1.024277, 0.6741088, 0.4741783, 1, 0, 0.9490196, 1,
1.024424, -1.405711, 3.896123, 1, 0, 0.9411765, 1,
1.025854, -0.5111973, 3.249333, 1, 0, 0.9372549, 1,
1.03069, 0.1233365, 1.337794, 1, 0, 0.9294118, 1,
1.037238, -1.049548, 1.217688, 1, 0, 0.9254902, 1,
1.037552, -0.01620521, 0.9041012, 1, 0, 0.9176471, 1,
1.041094, -0.1235493, 2.029828, 1, 0, 0.9137255, 1,
1.042246, 1.606182, 0.4510528, 1, 0, 0.9058824, 1,
1.049165, 0.2773473, 1.370345, 1, 0, 0.9019608, 1,
1.052865, -2.340437, 3.427456, 1, 0, 0.8941177, 1,
1.0541, 0.1630783, 0.2528354, 1, 0, 0.8862745, 1,
1.07266, -0.6910629, 3.061079, 1, 0, 0.8823529, 1,
1.080667, -2.507419, 2.042865, 1, 0, 0.8745098, 1,
1.08729, -1.423265, 4.314124, 1, 0, 0.8705882, 1,
1.089796, 1.489813, 1.05227, 1, 0, 0.8627451, 1,
1.101084, -0.172626, 2.200561, 1, 0, 0.8588235, 1,
1.101974, -2.03099, 1.909247, 1, 0, 0.8509804, 1,
1.115453, 1.347021, -0.4864017, 1, 0, 0.8470588, 1,
1.117523, -0.4434018, 2.268401, 1, 0, 0.8392157, 1,
1.117783, 0.5811511, 2.476552, 1, 0, 0.8352941, 1,
1.120562, -0.4503621, 1.285839, 1, 0, 0.827451, 1,
1.132545, 0.2906604, -0.9528077, 1, 0, 0.8235294, 1,
1.135567, -0.09361349, 3.061178, 1, 0, 0.8156863, 1,
1.137779, -0.4489768, 2.526432, 1, 0, 0.8117647, 1,
1.140477, 1.120404, 0.6872975, 1, 0, 0.8039216, 1,
1.143018, -0.2970942, 2.621609, 1, 0, 0.7960784, 1,
1.15002, 0.3428649, -0.03088193, 1, 0, 0.7921569, 1,
1.15037, -1.832856, 1.956127, 1, 0, 0.7843137, 1,
1.189549, -0.5477402, 0.8579437, 1, 0, 0.7803922, 1,
1.19386, 0.09354077, 2.203282, 1, 0, 0.772549, 1,
1.194443, 0.3168454, -0.5928646, 1, 0, 0.7686275, 1,
1.198313, 1.05333, 1.685221, 1, 0, 0.7607843, 1,
1.202813, 1.042866, 1.172406, 1, 0, 0.7568628, 1,
1.204105, -0.03095454, 3.052925, 1, 0, 0.7490196, 1,
1.210045, 2.251588, 0.2485042, 1, 0, 0.7450981, 1,
1.210475, 1.728026, -0.7364841, 1, 0, 0.7372549, 1,
1.214072, 0.6795529, 2.529611, 1, 0, 0.7333333, 1,
1.214517, -0.1343173, 3.499519, 1, 0, 0.7254902, 1,
1.215513, -1.489046, 2.091656, 1, 0, 0.7215686, 1,
1.219149, -0.007470712, 2.863654, 1, 0, 0.7137255, 1,
1.22074, -1.461149, 2.760828, 1, 0, 0.7098039, 1,
1.2282, -1.037532, 2.904571, 1, 0, 0.7019608, 1,
1.229859, 1.169155, 1.48965, 1, 0, 0.6941177, 1,
1.238639, 1.467833, 1.043366, 1, 0, 0.6901961, 1,
1.239634, -0.420834, 2.273347, 1, 0, 0.682353, 1,
1.240129, 1.169801, -0.3280016, 1, 0, 0.6784314, 1,
1.241988, -0.6141384, 1.422314, 1, 0, 0.6705883, 1,
1.243871, 1.809272, 0.07912138, 1, 0, 0.6666667, 1,
1.244846, 0.3409186, 1.348833, 1, 0, 0.6588235, 1,
1.248042, -0.1828508, 1.652445, 1, 0, 0.654902, 1,
1.255104, -0.4392741, 3.393932, 1, 0, 0.6470588, 1,
1.275491, -0.01068182, 2.346414, 1, 0, 0.6431373, 1,
1.282912, 0.6590093, 2.92996, 1, 0, 0.6352941, 1,
1.283342, -0.0610384, 3.589882, 1, 0, 0.6313726, 1,
1.285843, 0.1474164, 0.4851831, 1, 0, 0.6235294, 1,
1.291459, 1.861298, 1.924265, 1, 0, 0.6196079, 1,
1.293654, 0.4783591, 0.2294888, 1, 0, 0.6117647, 1,
1.298205, -1.793896, 1.463014, 1, 0, 0.6078432, 1,
1.302684, 1.843301, -0.2833981, 1, 0, 0.6, 1,
1.310603, -1.041447, 1.992084, 1, 0, 0.5921569, 1,
1.323014, 1.436513, 1.869037, 1, 0, 0.5882353, 1,
1.323819, -0.2685314, 3.656902, 1, 0, 0.5803922, 1,
1.32441, -0.9196854, 2.221619, 1, 0, 0.5764706, 1,
1.324951, 0.6025268, -0.3399032, 1, 0, 0.5686275, 1,
1.325964, -0.5286125, 1.729779, 1, 0, 0.5647059, 1,
1.333057, 1.998302, 0.09408241, 1, 0, 0.5568628, 1,
1.338151, -0.2161564, 2.410762, 1, 0, 0.5529412, 1,
1.339195, -1.005869, 1.019917, 1, 0, 0.5450981, 1,
1.34259, 0.9294675, 0.149646, 1, 0, 0.5411765, 1,
1.34501, -0.5585665, 3.406579, 1, 0, 0.5333334, 1,
1.346373, 0.6912809, 1.842731, 1, 0, 0.5294118, 1,
1.359814, 0.1909744, 1.30023, 1, 0, 0.5215687, 1,
1.362645, -0.2985119, 2.064354, 1, 0, 0.5176471, 1,
1.362857, 0.265213, 3.106507, 1, 0, 0.509804, 1,
1.363477, 1.146048, 2.397957, 1, 0, 0.5058824, 1,
1.369261, -0.3558346, 2.704582, 1, 0, 0.4980392, 1,
1.38139, -0.06831272, 3.150283, 1, 0, 0.4901961, 1,
1.385297, -0.7429836, 1.612354, 1, 0, 0.4862745, 1,
1.40861, -0.4114099, 0.6691657, 1, 0, 0.4784314, 1,
1.415505, -0.8891379, 3.479172, 1, 0, 0.4745098, 1,
1.417234, -0.7916254, 2.744378, 1, 0, 0.4666667, 1,
1.422201, 0.06511258, 0.7566233, 1, 0, 0.4627451, 1,
1.424173, 0.1652588, 1.057323, 1, 0, 0.454902, 1,
1.438625, -0.6263608, 0.8232846, 1, 0, 0.4509804, 1,
1.44544, -1.8648, 1.779734, 1, 0, 0.4431373, 1,
1.448768, 1.161373, 1.274568, 1, 0, 0.4392157, 1,
1.457698, -0.4349601, 1.259202, 1, 0, 0.4313726, 1,
1.464883, 0.3717435, 1.170658, 1, 0, 0.427451, 1,
1.466957, 0.2581109, -0.4535196, 1, 0, 0.4196078, 1,
1.477915, -0.01095327, 2.711329, 1, 0, 0.4156863, 1,
1.483156, 0.1602738, 0.486763, 1, 0, 0.4078431, 1,
1.486214, -0.04894516, -0.4432233, 1, 0, 0.4039216, 1,
1.488941, 1.350632, 1.469242, 1, 0, 0.3960784, 1,
1.494391, 0.8670495, 1.144632, 1, 0, 0.3882353, 1,
1.514766, 0.2130869, 1.914145, 1, 0, 0.3843137, 1,
1.518248, 1.379763, 0.3995761, 1, 0, 0.3764706, 1,
1.526628, 0.115884, 2.223699, 1, 0, 0.372549, 1,
1.53734, 0.8223869, 1.411955, 1, 0, 0.3647059, 1,
1.548154, -2.682756, 2.233555, 1, 0, 0.3607843, 1,
1.559136, 1.113131, 1.149324, 1, 0, 0.3529412, 1,
1.569351, 2.046098, 0.9160593, 1, 0, 0.3490196, 1,
1.573609, 0.3746443, 0.7150089, 1, 0, 0.3411765, 1,
1.578823, 0.107429, 1.15376, 1, 0, 0.3372549, 1,
1.584352, -0.1660934, 1.734624, 1, 0, 0.3294118, 1,
1.584893, -0.06298289, 1.780933, 1, 0, 0.3254902, 1,
1.593657, 1.779101, -1.526857, 1, 0, 0.3176471, 1,
1.594817, 0.4226087, 0.5494144, 1, 0, 0.3137255, 1,
1.606264, 1.533095, 1.602378, 1, 0, 0.3058824, 1,
1.611935, 1.102278, 1.330275, 1, 0, 0.2980392, 1,
1.616139, 0.4158505, 1.134578, 1, 0, 0.2941177, 1,
1.636351, 0.3740575, 1.673146, 1, 0, 0.2862745, 1,
1.63647, 1.101565, 0.830879, 1, 0, 0.282353, 1,
1.657248, -1.44928, 2.049738, 1, 0, 0.2745098, 1,
1.677955, 0.02834756, 2.111058, 1, 0, 0.2705882, 1,
1.681993, -2.1094, 3.027517, 1, 0, 0.2627451, 1,
1.715412, -0.8178052, 0.9453544, 1, 0, 0.2588235, 1,
1.76024, -0.4589779, 2.333981, 1, 0, 0.2509804, 1,
1.761073, -0.8016095, 2.091909, 1, 0, 0.2470588, 1,
1.769379, 0.05840734, 2.622058, 1, 0, 0.2392157, 1,
1.77361, 0.6459948, 2.301477, 1, 0, 0.2352941, 1,
1.779025, 0.9886857, 2.841308, 1, 0, 0.227451, 1,
1.789846, -0.09137612, 4.69304, 1, 0, 0.2235294, 1,
1.797539, -0.1194691, 2.575065, 1, 0, 0.2156863, 1,
1.834263, -0.7075294, 2.977234, 1, 0, 0.2117647, 1,
1.835629, -0.02242414, 0.6330574, 1, 0, 0.2039216, 1,
1.83635, -0.7034611, 1.139682, 1, 0, 0.1960784, 1,
1.847662, 0.58053, 1.280393, 1, 0, 0.1921569, 1,
1.878438, 0.5907542, 1.11378, 1, 0, 0.1843137, 1,
1.882856, -1.029614, 2.789128, 1, 0, 0.1803922, 1,
1.886826, 0.4639629, 1.298651, 1, 0, 0.172549, 1,
1.88955, -1.804726, 2.441205, 1, 0, 0.1686275, 1,
1.903072, -0.5748782, -0.1170502, 1, 0, 0.1607843, 1,
1.933514, -0.400031, 2.566539, 1, 0, 0.1568628, 1,
1.934225, 0.1326336, 2.961149, 1, 0, 0.1490196, 1,
1.934358, 0.6340644, 0.8675236, 1, 0, 0.145098, 1,
2.010196, 0.1134592, 2.810212, 1, 0, 0.1372549, 1,
2.011361, 0.1434478, 0.3472604, 1, 0, 0.1333333, 1,
2.011593, 0.04698164, 0.8751845, 1, 0, 0.1254902, 1,
2.06622, 1.116176, 0.9905972, 1, 0, 0.1215686, 1,
2.089989, 0.3783838, -0.6019133, 1, 0, 0.1137255, 1,
2.091441, 0.4263801, 2.443861, 1, 0, 0.1098039, 1,
2.101661, -0.3424317, 0.609139, 1, 0, 0.1019608, 1,
2.135421, -0.3462362, -0.1136348, 1, 0, 0.09411765, 1,
2.149941, -0.5743046, 1.097722, 1, 0, 0.09019608, 1,
2.190612, -0.2418256, 2.398201, 1, 0, 0.08235294, 1,
2.2074, 0.4481615, 0.8298729, 1, 0, 0.07843138, 1,
2.222494, -1.177727, 0.7850999, 1, 0, 0.07058824, 1,
2.249649, -1.423279, 3.85207, 1, 0, 0.06666667, 1,
2.323431, 1.239183, 0.3282703, 1, 0, 0.05882353, 1,
2.403816, -0.6752726, 1.801084, 1, 0, 0.05490196, 1,
2.472492, -1.552683, 2.946364, 1, 0, 0.04705882, 1,
2.481637, 1.131144, 1.389025, 1, 0, 0.04313726, 1,
2.532804, -0.9474654, 2.965734, 1, 0, 0.03529412, 1,
2.560837, 0.6736231, 1.72016, 1, 0, 0.03137255, 1,
2.583623, -0.5207208, 1.021637, 1, 0, 0.02352941, 1,
2.649223, 0.1905362, -1.090292, 1, 0, 0.01960784, 1,
2.775484, 0.6303265, 1.279695, 1, 0, 0.01176471, 1,
2.817507, -0.1506113, 1.611246, 1, 0, 0.007843138, 1
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
-0.5998732, -4.821928, -7.757516, 0, -0.5, 0.5, 0.5,
-0.5998732, -4.821928, -7.757516, 1, -0.5, 0.5, 0.5,
-0.5998732, -4.821928, -7.757516, 1, 1.5, 0.5, 0.5,
-0.5998732, -4.821928, -7.757516, 0, 1.5, 0.5, 0.5
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
-5.175745, -0.3274095, -7.757516, 0, -0.5, 0.5, 0.5,
-5.175745, -0.3274095, -7.757516, 1, -0.5, 0.5, 0.5,
-5.175745, -0.3274095, -7.757516, 1, 1.5, 0.5, 0.5,
-5.175745, -0.3274095, -7.757516, 0, 1.5, 0.5, 0.5
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
-5.175745, -4.821928, -0.2354057, 0, -0.5, 0.5, 0.5,
-5.175745, -4.821928, -0.2354057, 1, -0.5, 0.5, 0.5,
-5.175745, -4.821928, -0.2354057, 1, 1.5, 0.5, 0.5,
-5.175745, -4.821928, -0.2354057, 0, 1.5, 0.5, 0.5
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
-4, -3.784731, -6.021645,
2, -3.784731, -6.021645,
-4, -3.784731, -6.021645,
-4, -3.957597, -6.310956,
-3, -3.784731, -6.021645,
-3, -3.957597, -6.310956,
-2, -3.784731, -6.021645,
-2, -3.957597, -6.310956,
-1, -3.784731, -6.021645,
-1, -3.957597, -6.310956,
0, -3.784731, -6.021645,
0, -3.957597, -6.310956,
1, -3.784731, -6.021645,
1, -3.957597, -6.310956,
2, -3.784731, -6.021645,
2, -3.957597, -6.310956
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
"-4",
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
-4, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
-4, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
-4, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
-4, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
-3, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
-3, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
-3, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
-3, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
-2, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
-2, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
-2, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
-2, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
-1, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
-1, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
-1, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
-1, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
0, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
0, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
0, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
0, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
1, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
1, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
1, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
1, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5,
2, -4.303329, -6.88958, 0, -0.5, 0.5, 0.5,
2, -4.303329, -6.88958, 1, -0.5, 0.5, 0.5,
2, -4.303329, -6.88958, 1, 1.5, 0.5, 0.5,
2, -4.303329, -6.88958, 0, 1.5, 0.5, 0.5
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
-4.119774, -3, -6.021645,
-4.119774, 3, -6.021645,
-4.119774, -3, -6.021645,
-4.295769, -3, -6.310956,
-4.119774, -2, -6.021645,
-4.295769, -2, -6.310956,
-4.119774, -1, -6.021645,
-4.295769, -1, -6.310956,
-4.119774, 0, -6.021645,
-4.295769, 0, -6.310956,
-4.119774, 1, -6.021645,
-4.295769, 1, -6.310956,
-4.119774, 2, -6.021645,
-4.295769, 2, -6.310956,
-4.119774, 3, -6.021645,
-4.295769, 3, -6.310956
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
-4.647759, -3, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, -3, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, -3, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, -3, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, -2, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, -2, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, -2, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, -2, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, -1, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, -1, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, -1, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, -1, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, 0, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, 0, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, 0, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, 0, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, 1, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, 1, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, 1, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, 1, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, 2, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, 2, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, 2, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, 2, -6.88958, 0, 1.5, 0.5, 0.5,
-4.647759, 3, -6.88958, 0, -0.5, 0.5, 0.5,
-4.647759, 3, -6.88958, 1, -0.5, 0.5, 0.5,
-4.647759, 3, -6.88958, 1, 1.5, 0.5, 0.5,
-4.647759, 3, -6.88958, 0, 1.5, 0.5, 0.5
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
-4.119774, -3.784731, -4,
-4.119774, -3.784731, 4,
-4.119774, -3.784731, -4,
-4.295769, -3.957597, -4,
-4.119774, -3.784731, -2,
-4.295769, -3.957597, -2,
-4.119774, -3.784731, 0,
-4.295769, -3.957597, 0,
-4.119774, -3.784731, 2,
-4.295769, -3.957597, 2,
-4.119774, -3.784731, 4,
-4.295769, -3.957597, 4
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
-4.647759, -4.303329, -4, 0, -0.5, 0.5, 0.5,
-4.647759, -4.303329, -4, 1, -0.5, 0.5, 0.5,
-4.647759, -4.303329, -4, 1, 1.5, 0.5, 0.5,
-4.647759, -4.303329, -4, 0, 1.5, 0.5, 0.5,
-4.647759, -4.303329, -2, 0, -0.5, 0.5, 0.5,
-4.647759, -4.303329, -2, 1, -0.5, 0.5, 0.5,
-4.647759, -4.303329, -2, 1, 1.5, 0.5, 0.5,
-4.647759, -4.303329, -2, 0, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 0, 0, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 0, 1, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 0, 1, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 0, 0, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 2, 0, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 2, 1, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 2, 1, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 2, 0, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 4, 0, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 4, 1, -0.5, 0.5, 0.5,
-4.647759, -4.303329, 4, 1, 1.5, 0.5, 0.5,
-4.647759, -4.303329, 4, 0, 1.5, 0.5, 0.5
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
-4.119774, -3.784731, -6.021645,
-4.119774, 3.129912, -6.021645,
-4.119774, -3.784731, 5.550833,
-4.119774, 3.129912, 5.550833,
-4.119774, -3.784731, -6.021645,
-4.119774, -3.784731, 5.550833,
-4.119774, 3.129912, -6.021645,
-4.119774, 3.129912, 5.550833,
-4.119774, -3.784731, -6.021645,
2.920028, -3.784731, -6.021645,
-4.119774, -3.784731, 5.550833,
2.920028, -3.784731, 5.550833,
-4.119774, 3.129912, -6.021645,
2.920028, 3.129912, -6.021645,
-4.119774, 3.129912, 5.550833,
2.920028, 3.129912, 5.550833,
2.920028, -3.784731, -6.021645,
2.920028, 3.129912, -6.021645,
2.920028, -3.784731, 5.550833,
2.920028, 3.129912, 5.550833,
2.920028, -3.784731, -6.021645,
2.920028, -3.784731, 5.550833,
2.920028, 3.129912, -6.021645,
2.920028, 3.129912, 5.550833
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
var radius = 8.120954;
var distance = 36.13104;
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
mvMatrix.translate( 0.5998732, 0.3274095, 0.2354057 );
mvMatrix.scale( 1.24727, 1.269846, 0.7587428 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.13104);
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
-4.017253, -2.449601, -1.936071, 0, 0, 1, 1, 1,
-3.068744, -1.107785, -2.137171, 1, 0, 0, 1, 1,
-2.753607, 0.1687389, -0.8298723, 1, 0, 0, 1, 1,
-2.738715, 0.9394456, -0.0115846, 1, 0, 0, 1, 1,
-2.73354, 0.8508636, -1.910305, 1, 0, 0, 1, 1,
-2.726294, -2.336771, -1.274891, 1, 0, 0, 1, 1,
-2.683056, 0.8541852, 0.7089811, 0, 0, 0, 1, 1,
-2.601302, 0.4890396, -1.724718, 0, 0, 0, 1, 1,
-2.43696, -1.769818, -1.93048, 0, 0, 0, 1, 1,
-2.410285, 0.4902315, -2.740118, 0, 0, 0, 1, 1,
-2.319877, 1.082804, -1.591283, 0, 0, 0, 1, 1,
-2.307135, -1.521563, -2.502061, 0, 0, 0, 1, 1,
-2.266553, -1.004635, -0.2984008, 0, 0, 0, 1, 1,
-2.241762, -1.408724, -2.335241, 1, 1, 1, 1, 1,
-2.234091, -0.9163151, -2.92607, 1, 1, 1, 1, 1,
-2.091026, 0.8307933, -0.6935472, 1, 1, 1, 1, 1,
-2.071897, 0.1108443, -0.4912724, 1, 1, 1, 1, 1,
-2.070514, 0.6417058, -0.4582539, 1, 1, 1, 1, 1,
-2.062531, -0.9560012, -0.2624973, 1, 1, 1, 1, 1,
-2.025789, -0.1766462, -1.450669, 1, 1, 1, 1, 1,
-2.013159, -0.4294824, -2.001619, 1, 1, 1, 1, 1,
-1.961057, -0.9097248, -3.658234, 1, 1, 1, 1, 1,
-1.95396, -2.939142, -1.98788, 1, 1, 1, 1, 1,
-1.910677, -0.7770532, -2.855997, 1, 1, 1, 1, 1,
-1.887855, 0.1764342, -1.755865, 1, 1, 1, 1, 1,
-1.881719, -1.884351, -1.193343, 1, 1, 1, 1, 1,
-1.879192, 0.2488616, 0.2200411, 1, 1, 1, 1, 1,
-1.876658, 0.3973914, -1.155235, 1, 1, 1, 1, 1,
-1.834132, 0.6404409, -1.927469, 0, 0, 1, 1, 1,
-1.81382, 1.683856, -1.064408, 1, 0, 0, 1, 1,
-1.78706, 0.04041225, -0.949503, 1, 0, 0, 1, 1,
-1.782668, 1.211625, -1.129124, 1, 0, 0, 1, 1,
-1.779646, -0.1183175, -1.699982, 1, 0, 0, 1, 1,
-1.767644, 0.8344897, -3.191268, 1, 0, 0, 1, 1,
-1.764364, -0.00288341, -1.42796, 0, 0, 0, 1, 1,
-1.741719, -0.2683158, -2.73103, 0, 0, 0, 1, 1,
-1.736773, 1.999595, 1.15239, 0, 0, 0, 1, 1,
-1.705217, 0.6209544, -0.176238, 0, 0, 0, 1, 1,
-1.690078, 0.7730888, -1.049048, 0, 0, 0, 1, 1,
-1.681848, -1.83321, -2.504608, 0, 0, 0, 1, 1,
-1.671889, 2.418009, -0.4817916, 0, 0, 0, 1, 1,
-1.652272, 0.9503611, -2.217043, 1, 1, 1, 1, 1,
-1.652238, -0.05812959, -1.493551, 1, 1, 1, 1, 1,
-1.644205, 0.2410817, -1.678149, 1, 1, 1, 1, 1,
-1.630443, 2.223368, -0.5154079, 1, 1, 1, 1, 1,
-1.615639, -1.647384, -2.300195, 1, 1, 1, 1, 1,
-1.606704, -0.1906184, -1.218117, 1, 1, 1, 1, 1,
-1.593456, -1.409655, -3.210143, 1, 1, 1, 1, 1,
-1.592311, -0.84396, -2.005364, 1, 1, 1, 1, 1,
-1.589985, -1.864309, -2.068087, 1, 1, 1, 1, 1,
-1.570545, -0.3626251, -2.36448, 1, 1, 1, 1, 1,
-1.561335, 0.3897043, -1.289067, 1, 1, 1, 1, 1,
-1.545674, 0.1706914, 0.7032968, 1, 1, 1, 1, 1,
-1.539017, -0.377606, -2.212929, 1, 1, 1, 1, 1,
-1.53138, -0.9801162, -2.840031, 1, 1, 1, 1, 1,
-1.529485, 1.058096, -1.250552, 1, 1, 1, 1, 1,
-1.493788, 0.04688144, 0.9620751, 0, 0, 1, 1, 1,
-1.492782, 0.3318529, -1.792748, 1, 0, 0, 1, 1,
-1.489864, -0.2397787, -0.3619095, 1, 0, 0, 1, 1,
-1.468031, -2.430625, -4.717459, 1, 0, 0, 1, 1,
-1.456045, 0.6830679, -0.6549243, 1, 0, 0, 1, 1,
-1.449689, 0.5944183, -0.9004763, 1, 0, 0, 1, 1,
-1.433513, 0.7158431, -0.7284243, 0, 0, 0, 1, 1,
-1.427486, -1.199686, -1.807442, 0, 0, 0, 1, 1,
-1.425978, 0.654725, -2.284899, 0, 0, 0, 1, 1,
-1.424781, -0.09083065, -0.5709022, 0, 0, 0, 1, 1,
-1.415641, -0.7389255, -2.696093, 0, 0, 0, 1, 1,
-1.408161, 0.1504161, -1.261183, 0, 0, 0, 1, 1,
-1.405814, 0.6840313, -1.413511, 0, 0, 0, 1, 1,
-1.399763, -1.33316, -0.181485, 1, 1, 1, 1, 1,
-1.394847, 0.293573, 0.7820498, 1, 1, 1, 1, 1,
-1.387131, -0.7554645, -1.348464, 1, 1, 1, 1, 1,
-1.37905, -0.5637932, -2.384021, 1, 1, 1, 1, 1,
-1.378814, -2.666457, -4.410013, 1, 1, 1, 1, 1,
-1.359517, -0.6243272, -1.321985, 1, 1, 1, 1, 1,
-1.358271, 1.142841, 0.6583953, 1, 1, 1, 1, 1,
-1.356306, 0.2434653, -1.314148, 1, 1, 1, 1, 1,
-1.340761, -0.6728975, -0.7217873, 1, 1, 1, 1, 1,
-1.327611, -2.149172, -2.11941, 1, 1, 1, 1, 1,
-1.317048, -1.046061, -0.7641167, 1, 1, 1, 1, 1,
-1.315283, 2.086414, -0.9240958, 1, 1, 1, 1, 1,
-1.314276, -0.009011636, -1.095838, 1, 1, 1, 1, 1,
-1.305933, 1.050737, 0.7300834, 1, 1, 1, 1, 1,
-1.297241, 0.1439493, -0.9387754, 1, 1, 1, 1, 1,
-1.29651, -1.835847, -3.643413, 0, 0, 1, 1, 1,
-1.292323, 0.6020307, -2.368364, 1, 0, 0, 1, 1,
-1.290799, -0.7580302, -4.702096, 1, 0, 0, 1, 1,
-1.287761, -0.3196565, -0.8735885, 1, 0, 0, 1, 1,
-1.283875, -1.323498, -3.213319, 1, 0, 0, 1, 1,
-1.280559, -0.16677, -1.97262, 1, 0, 0, 1, 1,
-1.279956, -0.4494537, -3.185989, 0, 0, 0, 1, 1,
-1.279887, 1.072717, -0.6847566, 0, 0, 0, 1, 1,
-1.27715, -0.3786303, -1.914032, 0, 0, 0, 1, 1,
-1.273073, -2.265022, -3.005337, 0, 0, 0, 1, 1,
-1.26082, -0.002245945, -2.969142, 0, 0, 0, 1, 1,
-1.260138, 0.242268, -1.064718, 0, 0, 0, 1, 1,
-1.252922, 0.9476772, 0.02836297, 0, 0, 0, 1, 1,
-1.239231, 1.476907, 1.421175, 1, 1, 1, 1, 1,
-1.237656, 0.5036376, 0.7377082, 1, 1, 1, 1, 1,
-1.234317, -1.03318, -1.682834, 1, 1, 1, 1, 1,
-1.231105, 0.305922, -0.6227179, 1, 1, 1, 1, 1,
-1.22979, -1.05004, -0.9194986, 1, 1, 1, 1, 1,
-1.226477, 0.3497137, -1.502963, 1, 1, 1, 1, 1,
-1.22432, -0.3312358, -1.940053, 1, 1, 1, 1, 1,
-1.219764, -1.216432, -1.42847, 1, 1, 1, 1, 1,
-1.219057, 1.821558, 0.2861028, 1, 1, 1, 1, 1,
-1.218099, 0.2234207, -0.8083945, 1, 1, 1, 1, 1,
-1.217973, 0.7237824, -1.607157, 1, 1, 1, 1, 1,
-1.205516, -0.1824865, -0.435292, 1, 1, 1, 1, 1,
-1.190991, -1.672386, -0.3617911, 1, 1, 1, 1, 1,
-1.184854, 0.04960198, -1.507233, 1, 1, 1, 1, 1,
-1.180513, -0.01975744, -1.617366, 1, 1, 1, 1, 1,
-1.172521, -1.340958, -0.5146223, 0, 0, 1, 1, 1,
-1.170872, 0.06503744, -0.1924932, 1, 0, 0, 1, 1,
-1.164719, 0.426474, -1.612177, 1, 0, 0, 1, 1,
-1.164544, 0.01029597, -1.447972, 1, 0, 0, 1, 1,
-1.160997, -1.176196, -1.280654, 1, 0, 0, 1, 1,
-1.15505, -0.7734864, -2.035671, 1, 0, 0, 1, 1,
-1.154518, -0.3207259, -1.15739, 0, 0, 0, 1, 1,
-1.153928, 0.2407879, -1.589705, 0, 0, 0, 1, 1,
-1.150697, 0.4829662, -0.08619996, 0, 0, 0, 1, 1,
-1.147379, 1.074195, -1.684687, 0, 0, 0, 1, 1,
-1.143694, 1.096362, -1.390002, 0, 0, 0, 1, 1,
-1.142438, -1.622517, -2.670884, 0, 0, 0, 1, 1,
-1.138929, 0.9517717, 0.9780385, 0, 0, 0, 1, 1,
-1.136248, 0.6902788, -2.913778, 1, 1, 1, 1, 1,
-1.116495, 1.128884, -1.219601, 1, 1, 1, 1, 1,
-1.10698, -2.148388, -3.548841, 1, 1, 1, 1, 1,
-1.106858, 1.128546, -3.314133, 1, 1, 1, 1, 1,
-1.10403, -0.2688915, -1.629239, 1, 1, 1, 1, 1,
-1.099164, -1.487535, -3.129475, 1, 1, 1, 1, 1,
-1.08771, -0.8907014, -2.693378, 1, 1, 1, 1, 1,
-1.075447, -0.09287146, -2.113397, 1, 1, 1, 1, 1,
-1.068065, -0.6114871, -1.7904, 1, 1, 1, 1, 1,
-1.051836, -0.8212892, -2.954879, 1, 1, 1, 1, 1,
-1.051287, 1.006097, -1.326217, 1, 1, 1, 1, 1,
-1.051129, -0.3228986, -2.660594, 1, 1, 1, 1, 1,
-1.03755, 2.162204, 0.1417693, 1, 1, 1, 1, 1,
-1.028309, -2.560119, -2.86895, 1, 1, 1, 1, 1,
-1.02777, 0.03687024, -4.020392, 1, 1, 1, 1, 1,
-1.014539, 0.1541425, -0.3700905, 0, 0, 1, 1, 1,
-1.010782, 0.6047138, -2.203575, 1, 0, 0, 1, 1,
-1.008905, 0.5426702, -1.125278, 1, 0, 0, 1, 1,
-0.9901417, -1.118837, -2.98454, 1, 0, 0, 1, 1,
-0.987802, 0.6309602, 0.2329519, 1, 0, 0, 1, 1,
-0.9780709, 1.781716, 0.1001482, 1, 0, 0, 1, 1,
-0.9733086, -0.8792519, -1.859438, 0, 0, 0, 1, 1,
-0.9699655, 1.90301, -1.066388, 0, 0, 0, 1, 1,
-0.9653357, 0.02924674, -1.425239, 0, 0, 0, 1, 1,
-0.9595245, -0.895413, -1.233493, 0, 0, 0, 1, 1,
-0.9564863, 0.7062306, -1.624496, 0, 0, 0, 1, 1,
-0.9540664, -1.296417, -2.371413, 0, 0, 0, 1, 1,
-0.9502945, -0.6501999, -0.1859618, 0, 0, 0, 1, 1,
-0.9479523, 0.3488246, -0.5590225, 1, 1, 1, 1, 1,
-0.9417489, -1.050556, -3.367159, 1, 1, 1, 1, 1,
-0.9389674, 0.09336373, -1.041706, 1, 1, 1, 1, 1,
-0.9373139, -0.1778645, -2.237669, 1, 1, 1, 1, 1,
-0.9265483, 0.2938986, -0.1893336, 1, 1, 1, 1, 1,
-0.9200305, 0.08281281, -0.8290755, 1, 1, 1, 1, 1,
-0.9194037, -0.1197488, -1.277958, 1, 1, 1, 1, 1,
-0.9173758, 0.136727, -1.220937, 1, 1, 1, 1, 1,
-0.9131378, 1.172243, 1.321203, 1, 1, 1, 1, 1,
-0.907925, 0.1757144, -3.283657, 1, 1, 1, 1, 1,
-0.9040105, -0.8281299, -2.796197, 1, 1, 1, 1, 1,
-0.9023762, 0.6674444, -0.2008327, 1, 1, 1, 1, 1,
-0.9019468, 0.8019723, -0.1799281, 1, 1, 1, 1, 1,
-0.9015568, 0.4182164, -1.155659, 1, 1, 1, 1, 1,
-0.8942674, -1.07997, -2.123122, 1, 1, 1, 1, 1,
-0.891895, -0.726298, -2.518518, 0, 0, 1, 1, 1,
-0.887975, -0.1698336, -1.26071, 1, 0, 0, 1, 1,
-0.8785517, -0.8006122, -2.578206, 1, 0, 0, 1, 1,
-0.875425, -0.6609781, -1.66627, 1, 0, 0, 1, 1,
-0.8725939, -2.004128, -2.02651, 1, 0, 0, 1, 1,
-0.8697137, 0.7644702, -1.268935, 1, 0, 0, 1, 1,
-0.8689557, -0.7686958, -2.193059, 0, 0, 0, 1, 1,
-0.86729, -0.6058921, -1.61064, 0, 0, 0, 1, 1,
-0.8640919, -0.1325097, -0.8771619, 0, 0, 0, 1, 1,
-0.8630222, -0.3037992, -1.751933, 0, 0, 0, 1, 1,
-0.8608376, -1.583824, -3.413685, 0, 0, 0, 1, 1,
-0.8586196, 0.4536765, -2.437371, 0, 0, 0, 1, 1,
-0.8541495, -0.1766, -1.044964, 0, 0, 0, 1, 1,
-0.8541337, 2.064124, -0.9154998, 1, 1, 1, 1, 1,
-0.8529129, 1.794924, -0.3829899, 1, 1, 1, 1, 1,
-0.8498781, 1.232513, -1.214596, 1, 1, 1, 1, 1,
-0.848204, 0.7519032, -0.1969711, 1, 1, 1, 1, 1,
-0.8440527, 0.6782292, -2.94014, 1, 1, 1, 1, 1,
-0.8420401, -1.038942, -0.8602349, 1, 1, 1, 1, 1,
-0.8338948, -0.9404049, -1.592133, 1, 1, 1, 1, 1,
-0.8297845, 0.1839606, -2.382389, 1, 1, 1, 1, 1,
-0.8287434, 0.05236296, -1.537757, 1, 1, 1, 1, 1,
-0.8283606, -0.3275776, -1.289758, 1, 1, 1, 1, 1,
-0.8194332, 1.080226, 0.4204823, 1, 1, 1, 1, 1,
-0.8183745, -0.0928992, -3.079518, 1, 1, 1, 1, 1,
-0.8179023, 1.098294, -0.08931159, 1, 1, 1, 1, 1,
-0.8173909, 1.59818, -1.098396, 1, 1, 1, 1, 1,
-0.8088583, -1.161813, -4.299131, 1, 1, 1, 1, 1,
-0.7969679, 0.9856099, -1.699105, 0, 0, 1, 1, 1,
-0.7959215, 0.1228387, -0.6845874, 1, 0, 0, 1, 1,
-0.7958013, 1.782284, -1.681476, 1, 0, 0, 1, 1,
-0.7902647, 0.4818735, 0.8493649, 1, 0, 0, 1, 1,
-0.7864421, 1.41372, -0.2551757, 1, 0, 0, 1, 1,
-0.7851864, 0.9881744, -1.783707, 1, 0, 0, 1, 1,
-0.7804632, 1.270551, -0.1161923, 0, 0, 0, 1, 1,
-0.7776753, 1.07917, -0.218187, 0, 0, 0, 1, 1,
-0.7737023, -0.9868507, -1.307349, 0, 0, 0, 1, 1,
-0.7731526, 1.498169, -0.3885279, 0, 0, 0, 1, 1,
-0.7709033, -0.02145929, -2.092278, 0, 0, 0, 1, 1,
-0.7699869, 0.8180855, 0.2486471, 0, 0, 0, 1, 1,
-0.7614984, 1.840779, 0.1292043, 0, 0, 0, 1, 1,
-0.7609201, 2.083143, -1.182175, 1, 1, 1, 1, 1,
-0.7556326, -0.676231, -1.369126, 1, 1, 1, 1, 1,
-0.7507848, -0.389764, -2.716683, 1, 1, 1, 1, 1,
-0.7477681, 0.6256114, -0.947381, 1, 1, 1, 1, 1,
-0.7474448, -0.2988003, -2.037756, 1, 1, 1, 1, 1,
-0.7466618, 0.0264766, -2.566619, 1, 1, 1, 1, 1,
-0.7387121, 0.4848329, -0.7266156, 1, 1, 1, 1, 1,
-0.7378613, 0.8810169, -0.8347632, 1, 1, 1, 1, 1,
-0.7348626, 1.750699, -1.236045, 1, 1, 1, 1, 1,
-0.7322367, 0.4370357, -1.879067, 1, 1, 1, 1, 1,
-0.7212278, 0.3239363, -0.1186304, 1, 1, 1, 1, 1,
-0.7155084, 0.6875019, 0.3044982, 1, 1, 1, 1, 1,
-0.7140194, 0.7608027, -1.936186, 1, 1, 1, 1, 1,
-0.7133858, 0.2545876, -0.9390061, 1, 1, 1, 1, 1,
-0.7127016, 0.257076, -1.441168, 1, 1, 1, 1, 1,
-0.7086068, 0.1375181, -3.575692, 0, 0, 1, 1, 1,
-0.7077935, 0.4092526, 0.6590146, 1, 0, 0, 1, 1,
-0.7032716, -1.252454, -3.183202, 1, 0, 0, 1, 1,
-0.7026529, 1.127376, -0.4849262, 1, 0, 0, 1, 1,
-0.7000909, -0.929643, -1.660435, 1, 0, 0, 1, 1,
-0.6976637, 1.420032, -0.733995, 1, 0, 0, 1, 1,
-0.6950859, -1.129804, -1.202296, 0, 0, 0, 1, 1,
-0.6933274, -1.244271, -3.249539, 0, 0, 0, 1, 1,
-0.6907472, 0.4034676, -3.176806, 0, 0, 0, 1, 1,
-0.6888279, -0.1864295, -1.185189, 0, 0, 0, 1, 1,
-0.6881832, 1.163958, -0.6024714, 0, 0, 0, 1, 1,
-0.6859925, -0.8822893, -2.935455, 0, 0, 0, 1, 1,
-0.6824219, -1.224195, -1.378463, 0, 0, 0, 1, 1,
-0.6791441, 0.3594176, -1.334821, 1, 1, 1, 1, 1,
-0.6774629, 0.6304458, 0.571948, 1, 1, 1, 1, 1,
-0.6773199, 0.08851684, -1.232478, 1, 1, 1, 1, 1,
-0.6721521, -0.9862385, -2.276512, 1, 1, 1, 1, 1,
-0.671407, 0.352502, -0.7863109, 1, 1, 1, 1, 1,
-0.6663725, -0.7877895, -1.828081, 1, 1, 1, 1, 1,
-0.6654964, 0.3843946, -1.892348, 1, 1, 1, 1, 1,
-0.6646303, 2.381725, 1.06059, 1, 1, 1, 1, 1,
-0.663061, -0.00320224, -2.400333, 1, 1, 1, 1, 1,
-0.6606064, 1.336269, 0.6584011, 1, 1, 1, 1, 1,
-0.6544177, 0.01699993, -2.187429, 1, 1, 1, 1, 1,
-0.6530148, 0.6912411, -0.5918882, 1, 1, 1, 1, 1,
-0.6523753, -0.1401256, -1.443764, 1, 1, 1, 1, 1,
-0.6470734, -0.7808825, -2.648593, 1, 1, 1, 1, 1,
-0.6424952, 1.190848, 0.006947188, 1, 1, 1, 1, 1,
-0.6398066, 0.67339, -0.8489799, 0, 0, 1, 1, 1,
-0.6344265, 1.52221, -0.2019819, 1, 0, 0, 1, 1,
-0.6298627, 0.02216711, -2.163725, 1, 0, 0, 1, 1,
-0.6297008, -0.2139739, -1.974462, 1, 0, 0, 1, 1,
-0.6206904, -1.212237, -3.567854, 1, 0, 0, 1, 1,
-0.6190323, 3.029213, 0.9004431, 1, 0, 0, 1, 1,
-0.6183051, 0.7155427, -1.324183, 0, 0, 0, 1, 1,
-0.6176897, -0.006043779, -1.815873, 0, 0, 0, 1, 1,
-0.6147239, -0.1270223, -2.240777, 0, 0, 0, 1, 1,
-0.6146025, -1.079443, -1.197191, 0, 0, 0, 1, 1,
-0.614498, -0.2026701, -0.3768515, 0, 0, 0, 1, 1,
-0.6052769, -0.8745429, -0.9987889, 0, 0, 0, 1, 1,
-0.5991971, -1.289923, -2.925913, 0, 0, 0, 1, 1,
-0.5956596, -0.04558636, -0.7901856, 1, 1, 1, 1, 1,
-0.5936077, -1.033175, -2.323951, 1, 1, 1, 1, 1,
-0.5921368, -1.951414, -2.841484, 1, 1, 1, 1, 1,
-0.5883716, 0.2053437, -0.3128149, 1, 1, 1, 1, 1,
-0.5838061, 0.3873471, -2.198191, 1, 1, 1, 1, 1,
-0.5787937, -0.9191355, -3.078651, 1, 1, 1, 1, 1,
-0.5757539, 0.6038551, -0.003282516, 1, 1, 1, 1, 1,
-0.5750334, -1.426526, -2.818898, 1, 1, 1, 1, 1,
-0.5725724, -1.600653, -2.792427, 1, 1, 1, 1, 1,
-0.5698298, 1.818683, -0.8955523, 1, 1, 1, 1, 1,
-0.5691948, -0.4926977, -2.786931, 1, 1, 1, 1, 1,
-0.5686391, 2.496829, -0.04867716, 1, 1, 1, 1, 1,
-0.5683976, 0.913397, -0.27018, 1, 1, 1, 1, 1,
-0.56635, -0.3972431, -3.406688, 1, 1, 1, 1, 1,
-0.5632613, 0.41783, -1.704939, 1, 1, 1, 1, 1,
-0.5632581, -1.067843, -1.13945, 0, 0, 1, 1, 1,
-0.5563699, -0.6715853, -3.74944, 1, 0, 0, 1, 1,
-0.5556492, 0.6528658, -0.2360153, 1, 0, 0, 1, 1,
-0.5514632, 1.380123, -0.8649195, 1, 0, 0, 1, 1,
-0.5491277, -0.7520677, -1.934846, 1, 0, 0, 1, 1,
-0.5443475, 0.6855175, -1.09105, 1, 0, 0, 1, 1,
-0.5415676, 0.6250561, -0.3612145, 0, 0, 0, 1, 1,
-0.5348319, -0.8161736, -4.390894, 0, 0, 0, 1, 1,
-0.5312037, -1.382406, -4.158537, 0, 0, 0, 1, 1,
-0.5311631, 0.08188068, -0.8069778, 0, 0, 0, 1, 1,
-0.5275725, 0.2523835, -0.6783412, 0, 0, 0, 1, 1,
-0.5274782, 0.04738167, -0.1518934, 0, 0, 0, 1, 1,
-0.5257928, -0.1590267, -2.497906, 0, 0, 0, 1, 1,
-0.5175709, 0.8933711, 0.273116, 1, 1, 1, 1, 1,
-0.5157802, -0.5148446, -2.269885, 1, 1, 1, 1, 1,
-0.5089567, -0.1480622, -0.6292723, 1, 1, 1, 1, 1,
-0.5083735, 0.3416471, -1.054237, 1, 1, 1, 1, 1,
-0.5075248, 0.8465844, 0.2427221, 1, 1, 1, 1, 1,
-0.4950745, -1.321753, -3.866248, 1, 1, 1, 1, 1,
-0.490838, -1.085938, -3.138659, 1, 1, 1, 1, 1,
-0.4896363, 0.7513894, -2.60356, 1, 1, 1, 1, 1,
-0.4894229, -1.008089, -3.876435, 1, 1, 1, 1, 1,
-0.4880466, -0.6476409, -1.664308, 1, 1, 1, 1, 1,
-0.4869108, 0.9765047, -0.521892, 1, 1, 1, 1, 1,
-0.4825933, -1.022932, -3.244077, 1, 1, 1, 1, 1,
-0.4818381, 0.4864633, -0.8403137, 1, 1, 1, 1, 1,
-0.4705303, -0.9923282, -1.740015, 1, 1, 1, 1, 1,
-0.4704857, 0.3085906, 0.9618262, 1, 1, 1, 1, 1,
-0.4658545, -0.04087868, 0.1312133, 0, 0, 1, 1, 1,
-0.4632112, -0.3770525, -3.192313, 1, 0, 0, 1, 1,
-0.4621785, 0.133643, -2.093054, 1, 0, 0, 1, 1,
-0.4589067, -0.8262011, -2.377726, 1, 0, 0, 1, 1,
-0.4568337, 0.8104094, -1.168713, 1, 0, 0, 1, 1,
-0.4559098, 0.3597279, -0.2986886, 1, 0, 0, 1, 1,
-0.4537834, 1.842172, 0.8721604, 0, 0, 0, 1, 1,
-0.4507483, 0.6716566, -0.3826251, 0, 0, 0, 1, 1,
-0.4487114, 0.6689442, -0.07439186, 0, 0, 0, 1, 1,
-0.4450011, -0.4506965, -3.209103, 0, 0, 0, 1, 1,
-0.4433996, -0.5003371, -1.059727, 0, 0, 0, 1, 1,
-0.4421819, -0.3010597, -4.056605, 0, 0, 0, 1, 1,
-0.4416631, -0.2644662, -2.539339, 0, 0, 0, 1, 1,
-0.4407624, -0.9201348, -2.253203, 1, 1, 1, 1, 1,
-0.4369611, 0.9313591, -1.637539, 1, 1, 1, 1, 1,
-0.4341252, 0.3410798, -0.7972209, 1, 1, 1, 1, 1,
-0.4334638, 0.5401272, 0.6525162, 1, 1, 1, 1, 1,
-0.4308031, 0.3507007, -1.881733, 1, 1, 1, 1, 1,
-0.4307539, -0.6780828, -3.223133, 1, 1, 1, 1, 1,
-0.4271992, -1.087343, -2.250852, 1, 1, 1, 1, 1,
-0.4249116, 1.362324, -1.459231, 1, 1, 1, 1, 1,
-0.4248901, 1.363595, -0.7149189, 1, 1, 1, 1, 1,
-0.4243579, 0.4141553, -0.2776878, 1, 1, 1, 1, 1,
-0.4155254, -0.07237987, -2.344164, 1, 1, 1, 1, 1,
-0.4152087, -1.421516, -0.343349, 1, 1, 1, 1, 1,
-0.4149814, 1.44747, 0.4336092, 1, 1, 1, 1, 1,
-0.4128201, 1.95857, -0.7737902, 1, 1, 1, 1, 1,
-0.4095063, -0.3490319, -2.321174, 1, 1, 1, 1, 1,
-0.4083116, 1.93785, 0.009563585, 0, 0, 1, 1, 1,
-0.4080141, -1.704359, -1.358516, 1, 0, 0, 1, 1,
-0.4073294, -0.7754092, -2.910956, 1, 0, 0, 1, 1,
-0.3914835, 0.1936618, -0.03136082, 1, 0, 0, 1, 1,
-0.390856, -0.1908723, -3.061953, 1, 0, 0, 1, 1,
-0.3864799, -0.0331514, -3.073784, 1, 0, 0, 1, 1,
-0.3830195, 0.8739779, 1.648429, 0, 0, 0, 1, 1,
-0.3800516, -2.39361, -2.611328, 0, 0, 0, 1, 1,
-0.3779054, -0.04512915, -1.438191, 0, 0, 0, 1, 1,
-0.3763467, -0.1542412, -2.750203, 0, 0, 0, 1, 1,
-0.3755107, -0.7781203, -2.892303, 0, 0, 0, 1, 1,
-0.3731526, 0.1270211, -0.2255939, 0, 0, 0, 1, 1,
-0.3723388, 0.7575163, -0.1877777, 0, 0, 0, 1, 1,
-0.3597382, -0.7200988, -1.791634, 1, 1, 1, 1, 1,
-0.3527041, -1.08136, -3.41463, 1, 1, 1, 1, 1,
-0.3512648, 0.4898328, -0.4817767, 1, 1, 1, 1, 1,
-0.3503745, -1.161755, -1.480652, 1, 1, 1, 1, 1,
-0.3497446, -0.1844572, -0.6612708, 1, 1, 1, 1, 1,
-0.3492366, -0.06906205, -0.9444466, 1, 1, 1, 1, 1,
-0.3473483, 1.713458, 0.9239908, 1, 1, 1, 1, 1,
-0.3472473, -0.7482819, -3.009203, 1, 1, 1, 1, 1,
-0.3468046, -1.232298, -2.144155, 1, 1, 1, 1, 1,
-0.3451836, 0.1576412, -0.9539421, 1, 1, 1, 1, 1,
-0.3444939, -0.09257569, -1.796272, 1, 1, 1, 1, 1,
-0.3433184, -0.6355469, -3.609182, 1, 1, 1, 1, 1,
-0.33988, -0.7910767, -3.319751, 1, 1, 1, 1, 1,
-0.3392251, 0.6311286, -0.8994068, 1, 1, 1, 1, 1,
-0.3372754, 1.112999, -0.7707735, 1, 1, 1, 1, 1,
-0.3317655, 0.4778413, 0.653638, 0, 0, 1, 1, 1,
-0.331702, 1.590948, 0.4067989, 1, 0, 0, 1, 1,
-0.3317007, -1.536033, -2.040356, 1, 0, 0, 1, 1,
-0.3307042, -0.7106694, -3.659892, 1, 0, 0, 1, 1,
-0.3274758, 1.104755, 1.672552, 1, 0, 0, 1, 1,
-0.3228692, -0.5840831, -2.083472, 1, 0, 0, 1, 1,
-0.3156538, -0.8283517, -4.12652, 0, 0, 0, 1, 1,
-0.3142394, -0.7845883, -3.853797, 0, 0, 0, 1, 1,
-0.3082345, 0.9450537, -0.8371341, 0, 0, 0, 1, 1,
-0.3081653, -0.5051473, -2.703481, 0, 0, 0, 1, 1,
-0.3059525, -0.6773323, -3.252122, 0, 0, 0, 1, 1,
-0.3041079, 0.4579031, -2.19204, 0, 0, 0, 1, 1,
-0.3033903, -0.5059012, -2.414607, 0, 0, 0, 1, 1,
-0.2999325, -1.07258, -4.213712, 1, 1, 1, 1, 1,
-0.293539, 0.04147719, -0.4355254, 1, 1, 1, 1, 1,
-0.2928842, 2.196368, 0.8812494, 1, 1, 1, 1, 1,
-0.2838635, 0.6133577, -2.623068, 1, 1, 1, 1, 1,
-0.2825229, 0.176102, -1.107492, 1, 1, 1, 1, 1,
-0.2817296, 2.092478, 0.7417526, 1, 1, 1, 1, 1,
-0.2775008, 2.171727, -0.5815976, 1, 1, 1, 1, 1,
-0.2743442, 0.611266, 1.224452, 1, 1, 1, 1, 1,
-0.2733155, -1.644452, -1.622965, 1, 1, 1, 1, 1,
-0.2726313, 0.1199258, -1.3255, 1, 1, 1, 1, 1,
-0.2722538, -0.3554286, -3.241453, 1, 1, 1, 1, 1,
-0.271435, -2.786678, -4.34714, 1, 1, 1, 1, 1,
-0.2597266, 0.3308465, -0.5407307, 1, 1, 1, 1, 1,
-0.2593978, 1.03554, 1.982963, 1, 1, 1, 1, 1,
-0.2591383, 2.437973, -0.3003196, 1, 1, 1, 1, 1,
-0.2548392, -0.06441966, -1.527123, 0, 0, 1, 1, 1,
-0.2541894, 0.5711352, -0.3323037, 1, 0, 0, 1, 1,
-0.2519763, -1.035275, -4.740819, 1, 0, 0, 1, 1,
-0.2472029, -1.438742, -2.734919, 1, 0, 0, 1, 1,
-0.2471645, -0.8790702, -4.232677, 1, 0, 0, 1, 1,
-0.2438456, -0.2278568, -2.305864, 1, 0, 0, 1, 1,
-0.2437305, -0.03200933, -2.844278, 0, 0, 0, 1, 1,
-0.2411245, 1.416437, -0.01062213, 0, 0, 0, 1, 1,
-0.2389815, 0.5551057, -0.09746736, 0, 0, 0, 1, 1,
-0.2341051, -0.582043, -2.912554, 0, 0, 0, 1, 1,
-0.227749, -0.9800239, -3.860439, 0, 0, 0, 1, 1,
-0.2231697, -0.4905681, -4.155018, 0, 0, 0, 1, 1,
-0.2199499, -1.13212, -2.824446, 0, 0, 0, 1, 1,
-0.2135798, 1.018755, -0.4160002, 1, 1, 1, 1, 1,
-0.2132377, 0.7068725, -2.131288, 1, 1, 1, 1, 1,
-0.2118285, -2.00219, -1.514623, 1, 1, 1, 1, 1,
-0.2099832, -1.436142, -3.387148, 1, 1, 1, 1, 1,
-0.1985145, 1.267528, -0.4960743, 1, 1, 1, 1, 1,
-0.1978586, 1.195417, 0.9782494, 1, 1, 1, 1, 1,
-0.192247, 0.3148722, -0.5277004, 1, 1, 1, 1, 1,
-0.1904996, -0.9548137, -4.117685, 1, 1, 1, 1, 1,
-0.1882115, 0.3549086, -0.9502898, 1, 1, 1, 1, 1,
-0.1875354, 0.9771766, 0.1400413, 1, 1, 1, 1, 1,
-0.1832893, 0.5189208, -0.3734087, 1, 1, 1, 1, 1,
-0.1832176, 0.9353892, -1.685258, 1, 1, 1, 1, 1,
-0.1824372, 0.02141375, -1.411763, 1, 1, 1, 1, 1,
-0.1775722, -1.283478, -5.735183, 1, 1, 1, 1, 1,
-0.1775087, -2.052416, -2.124856, 1, 1, 1, 1, 1,
-0.1759521, 1.084355, 1.41626, 0, 0, 1, 1, 1,
-0.1715438, -0.4768559, -3.667542, 1, 0, 0, 1, 1,
-0.1662681, 0.007938316, -0.481334, 1, 0, 0, 1, 1,
-0.1646651, -0.6975769, -2.909917, 1, 0, 0, 1, 1,
-0.1632395, -1.184863, -2.374533, 1, 0, 0, 1, 1,
-0.1622337, 0.3786729, -0.810419, 1, 0, 0, 1, 1,
-0.1585782, 1.47575, -0.8786768, 0, 0, 0, 1, 1,
-0.1583137, 1.680884, -0.3606895, 0, 0, 0, 1, 1,
-0.1529436, 0.9964193, 0.6493292, 0, 0, 0, 1, 1,
-0.1523419, -0.5580761, -2.889381, 0, 0, 0, 1, 1,
-0.1403958, -0.2955518, -2.749988, 0, 0, 0, 1, 1,
-0.1329238, 0.6800112, -1.303716, 0, 0, 0, 1, 1,
-0.1319908, -0.8578017, -2.816765, 0, 0, 0, 1, 1,
-0.1306514, 1.208813, 0.7323576, 1, 1, 1, 1, 1,
-0.1300391, 0.2177867, -0.6358294, 1, 1, 1, 1, 1,
-0.1297902, -0.01406409, -0.505959, 1, 1, 1, 1, 1,
-0.1280013, 1.245621, -1.079107, 1, 1, 1, 1, 1,
-0.1255914, 0.01822997, -0.8575321, 1, 1, 1, 1, 1,
-0.1240709, 0.3641763, 0.5583739, 1, 1, 1, 1, 1,
-0.1223955, 0.5280864, 0.1408887, 1, 1, 1, 1, 1,
-0.1216687, 0.3409786, -0.2642793, 1, 1, 1, 1, 1,
-0.1215068, -0.7764642, -2.967699, 1, 1, 1, 1, 1,
-0.1214801, -0.2000203, -1.787679, 1, 1, 1, 1, 1,
-0.1175437, 0.03924893, -2.630289, 1, 1, 1, 1, 1,
-0.117106, -0.2520456, -3.296003, 1, 1, 1, 1, 1,
-0.1141277, 0.9504651, 0.4574063, 1, 1, 1, 1, 1,
-0.1114135, -1.230222, -5.853113, 1, 1, 1, 1, 1,
-0.1113102, -1.468818, -3.458656, 1, 1, 1, 1, 1,
-0.10953, 0.3494733, 0.4447119, 0, 0, 1, 1, 1,
-0.1093938, -0.9220283, -3.38418, 1, 0, 0, 1, 1,
-0.1086694, 2.192542, -0.8242935, 1, 0, 0, 1, 1,
-0.10711, -1.332116, -1.690226, 1, 0, 0, 1, 1,
-0.1049239, 0.7422901, -1.408473, 1, 0, 0, 1, 1,
-0.103381, -1.185577, -4.183627, 1, 0, 0, 1, 1,
-0.1017263, -0.194161, -2.911447, 0, 0, 0, 1, 1,
-0.1012889, -3.684032, -4.012076, 0, 0, 0, 1, 1,
-0.09864839, -0.6198277, -2.897124, 0, 0, 0, 1, 1,
-0.09524913, -0.7652081, -4.216094, 0, 0, 0, 1, 1,
-0.09483181, 0.08498184, -0.6619135, 0, 0, 0, 1, 1,
-0.09236703, -0.6951656, -2.719151, 0, 0, 0, 1, 1,
-0.09057692, 0.7895609, -0.06799559, 0, 0, 0, 1, 1,
-0.09048335, -1.948432, -1.351926, 1, 1, 1, 1, 1,
-0.09023572, 0.2197694, 0.4145666, 1, 1, 1, 1, 1,
-0.08899308, -0.6833685, -3.064129, 1, 1, 1, 1, 1,
-0.08839101, -0.6751402, -3.79425, 1, 1, 1, 1, 1,
-0.08747317, -0.218713, -3.572789, 1, 1, 1, 1, 1,
-0.08492383, 0.1335455, -0.2725335, 1, 1, 1, 1, 1,
-0.07964747, 0.8960346, -0.6618491, 1, 1, 1, 1, 1,
-0.07681762, 1.787186, -0.1349697, 1, 1, 1, 1, 1,
-0.07180863, -1.013976, -2.697268, 1, 1, 1, 1, 1,
-0.07164204, 0.06439265, 0.7617843, 1, 1, 1, 1, 1,
-0.07112458, 1.300675, 1.123589, 1, 1, 1, 1, 1,
-0.06927617, -1.428272, -1.963481, 1, 1, 1, 1, 1,
-0.06405494, -1.925757, -2.204408, 1, 1, 1, 1, 1,
-0.06318928, 0.6662294, 0.3697024, 1, 1, 1, 1, 1,
-0.06314293, -1.721886, -3.820006, 1, 1, 1, 1, 1,
-0.06304213, 0.9853076, 0.49744, 0, 0, 1, 1, 1,
-0.0621536, 1.055958, 0.5988545, 1, 0, 0, 1, 1,
-0.0599829, -0.03231141, -2.641296, 1, 0, 0, 1, 1,
-0.05675298, 0.7780988, 1.768484, 1, 0, 0, 1, 1,
-0.04820074, -0.09447202, -1.773065, 1, 0, 0, 1, 1,
-0.04602645, -0.3744306, -3.681685, 1, 0, 0, 1, 1,
-0.0454407, -1.684224, -4.949536, 0, 0, 0, 1, 1,
-0.04426035, 0.03798249, 1.258753, 0, 0, 0, 1, 1,
-0.04406989, 1.162942, -1.292406, 0, 0, 0, 1, 1,
-0.0432274, -0.9968385, -3.600645, 0, 0, 0, 1, 1,
-0.03290649, 0.09056675, 1.767029, 0, 0, 0, 1, 1,
-0.03189417, -1.875803, -2.508836, 0, 0, 0, 1, 1,
-0.03144306, 2.309897, -0.6272176, 0, 0, 0, 1, 1,
-0.02994534, 0.07440939, -0.09823918, 1, 1, 1, 1, 1,
-0.02641217, -1.817064, -3.839579, 1, 1, 1, 1, 1,
-0.02509508, -1.088464, -3.736678, 1, 1, 1, 1, 1,
-0.02002642, -1.802775, -2.970959, 1, 1, 1, 1, 1,
-0.01902714, 0.6974914, -0.06753118, 1, 1, 1, 1, 1,
-0.01566993, 1.263834, -1.423103, 1, 1, 1, 1, 1,
-0.01386635, 1.353022, 0.581556, 1, 1, 1, 1, 1,
-0.006243523, -0.9780981, -2.658576, 1, 1, 1, 1, 1,
-0.005684423, -0.6233006, -2.568567, 1, 1, 1, 1, 1,
-0.005222181, -1.106885, -4.321863, 1, 1, 1, 1, 1,
-0.001631479, -0.7114201, -3.806189, 1, 1, 1, 1, 1,
-0.0001556752, 0.2300322, 0.2716907, 1, 1, 1, 1, 1,
-0.0001391617, 0.0513175, 1.543646, 1, 1, 1, 1, 1,
0.0001910699, -1.128271, 2.705294, 1, 1, 1, 1, 1,
0.000337147, -0.7594571, 4.599782, 1, 1, 1, 1, 1,
0.006606389, -0.4393371, 4.012612, 0, 0, 1, 1, 1,
0.009249671, 1.686114, 0.6303232, 1, 0, 0, 1, 1,
0.01260532, -0.8661293, 4.148652, 1, 0, 0, 1, 1,
0.01386954, 0.02318372, 0.1488638, 1, 0, 0, 1, 1,
0.01816302, 0.4694531, -0.7639077, 1, 0, 0, 1, 1,
0.02105153, -0.4426171, 1.052116, 1, 0, 0, 1, 1,
0.02264144, 1.464274, -0.1580235, 0, 0, 0, 1, 1,
0.02424464, -0.4046818, 1.963448, 0, 0, 0, 1, 1,
0.02487107, 0.627032, -0.05925864, 0, 0, 0, 1, 1,
0.02894082, -1.234114, 1.240999, 0, 0, 0, 1, 1,
0.03412238, 1.683921, 0.8974026, 0, 0, 0, 1, 1,
0.03715176, -0.5990844, 2.671387, 0, 0, 0, 1, 1,
0.03715854, -0.8017089, 4.820768, 0, 0, 0, 1, 1,
0.03778278, 1.506212, -1.840001, 1, 1, 1, 1, 1,
0.03838336, 0.2870972, 0.889094, 1, 1, 1, 1, 1,
0.03958948, 0.4020121, 1.01175, 1, 1, 1, 1, 1,
0.0406246, 0.3024539, 0.8031832, 1, 1, 1, 1, 1,
0.04348854, -0.09238893, 2.657725, 1, 1, 1, 1, 1,
0.04440252, 1.521864, 0.3836522, 1, 1, 1, 1, 1,
0.04461763, -0.7681476, 4.697495, 1, 1, 1, 1, 1,
0.04551237, -0.3627314, 2.994908, 1, 1, 1, 1, 1,
0.04848498, -0.4571052, 2.90298, 1, 1, 1, 1, 1,
0.0486863, 0.5730335, 1.863913, 1, 1, 1, 1, 1,
0.05339041, 1.53885, 1.658605, 1, 1, 1, 1, 1,
0.05417607, 0.7432594, 0.2895005, 1, 1, 1, 1, 1,
0.05501883, -0.01631405, 0.04104337, 1, 1, 1, 1, 1,
0.05581743, -0.954983, 4.410177, 1, 1, 1, 1, 1,
0.05888906, -0.563732, 0.8847457, 1, 1, 1, 1, 1,
0.05944502, 0.5392164, -1.458564, 0, 0, 1, 1, 1,
0.0604782, 0.01820446, -0.4361345, 1, 0, 0, 1, 1,
0.0619606, -1.370068, 2.831969, 1, 0, 0, 1, 1,
0.0632594, 1.023605, -0.72655, 1, 0, 0, 1, 1,
0.06999996, 0.6661431, 0.2976804, 1, 0, 0, 1, 1,
0.07076851, -0.49192, 1.793779, 1, 0, 0, 1, 1,
0.07125843, -0.258384, 2.487196, 0, 0, 0, 1, 1,
0.07304092, 0.7606677, 1.620627, 0, 0, 0, 1, 1,
0.07638609, -1.197349, 5.382302, 0, 0, 0, 1, 1,
0.07735, 1.179996, 0.9863892, 0, 0, 0, 1, 1,
0.07806503, -1.611398, 1.488352, 0, 0, 0, 1, 1,
0.0785082, 0.9216096, -0.2412547, 0, 0, 0, 1, 1,
0.07947617, -1.55686, 3.038772, 0, 0, 0, 1, 1,
0.08188237, -0.2372233, 1.373989, 1, 1, 1, 1, 1,
0.08568939, -0.8325542, 2.572628, 1, 1, 1, 1, 1,
0.09407152, 0.070164, 0.7457863, 1, 1, 1, 1, 1,
0.09500124, -0.0239529, 2.017119, 1, 1, 1, 1, 1,
0.1011618, 0.2057851, 2.566392, 1, 1, 1, 1, 1,
0.1042315, 0.7589951, -0.5920237, 1, 1, 1, 1, 1,
0.104401, 0.04112627, 1.204472, 1, 1, 1, 1, 1,
0.1105553, 0.9181479, -0.8636768, 1, 1, 1, 1, 1,
0.1108045, 0.08623566, 0.8445531, 1, 1, 1, 1, 1,
0.1111936, 0.4894222, 0.8941084, 1, 1, 1, 1, 1,
0.1114356, 0.5482274, 0.02973222, 1, 1, 1, 1, 1,
0.1120063, 1.423103, 0.2140445, 1, 1, 1, 1, 1,
0.1120374, -1.316403, 3.753987, 1, 1, 1, 1, 1,
0.1236597, -0.6573394, 3.100562, 1, 1, 1, 1, 1,
0.1266739, -1.163926, 2.861696, 1, 1, 1, 1, 1,
0.12795, 0.3336312, 1.47674, 0, 0, 1, 1, 1,
0.1297099, 0.1729636, 1.082324, 1, 0, 0, 1, 1,
0.1297612, -1.584842, 2.187284, 1, 0, 0, 1, 1,
0.1298728, 0.6958028, 0.3831384, 1, 0, 0, 1, 1,
0.1317423, -1.362897, 2.7806, 1, 0, 0, 1, 1,
0.132017, -0.9416034, 3.756946, 1, 0, 0, 1, 1,
0.1334624, 1.208514, -0.4378205, 0, 0, 0, 1, 1,
0.1362262, -2.078064, 2.404505, 0, 0, 0, 1, 1,
0.1374588, -0.4887402, 2.420482, 0, 0, 0, 1, 1,
0.1403247, 0.353283, 0.6563041, 0, 0, 0, 1, 1,
0.1437922, -0.6271452, 2.165572, 0, 0, 0, 1, 1,
0.1484876, -0.1473969, 2.637608, 0, 0, 0, 1, 1,
0.1558985, 0.4625078, -1.358231, 0, 0, 0, 1, 1,
0.1566891, 0.7384886, -1.404751, 1, 1, 1, 1, 1,
0.1571492, 0.8255163, -1.520417, 1, 1, 1, 1, 1,
0.1575051, -0.247842, 3.268815, 1, 1, 1, 1, 1,
0.1605136, -0.1085965, 1.011752, 1, 1, 1, 1, 1,
0.1649731, 1.779462, -0.979564, 1, 1, 1, 1, 1,
0.1664209, 0.9665332, -0.6695214, 1, 1, 1, 1, 1,
0.1747282, 1.019826, 0.2499592, 1, 1, 1, 1, 1,
0.1782061, 1.083692, 1.513558, 1, 1, 1, 1, 1,
0.1820287, -0.2285752, 3.164192, 1, 1, 1, 1, 1,
0.1830067, 0.3027585, 0.5183171, 1, 1, 1, 1, 1,
0.1841314, -0.30525, 3.10556, 1, 1, 1, 1, 1,
0.1846699, -0.40913, 4.065372, 1, 1, 1, 1, 1,
0.1855055, 0.4034895, -0.1059129, 1, 1, 1, 1, 1,
0.1866526, -0.7221479, 3.587274, 1, 1, 1, 1, 1,
0.1871475, 1.126801, 1.19731, 1, 1, 1, 1, 1,
0.1872212, -0.6907667, 3.584545, 0, 0, 1, 1, 1,
0.1878112, 1.06062, -0.04907036, 1, 0, 0, 1, 1,
0.1927918, -0.5489689, 3.563972, 1, 0, 0, 1, 1,
0.1970796, -0.3480089, 2.037357, 1, 0, 0, 1, 1,
0.2011861, -0.3831241, 3.653227, 1, 0, 0, 1, 1,
0.2016297, -0.8147128, 2.459868, 1, 0, 0, 1, 1,
0.2026791, -0.9054891, 3.26643, 0, 0, 0, 1, 1,
0.2028059, -0.4429014, 2.372658, 0, 0, 0, 1, 1,
0.2033483, -1.114917, 2.518132, 0, 0, 0, 1, 1,
0.2065756, 0.04705926, 1.858911, 0, 0, 0, 1, 1,
0.2074975, 0.1644878, 1.212789, 0, 0, 0, 1, 1,
0.2083777, -0.2551751, 1.769693, 0, 0, 0, 1, 1,
0.2093138, -0.4278836, 2.811146, 0, 0, 0, 1, 1,
0.2099451, -2.14105, 2.839449, 1, 1, 1, 1, 1,
0.2192056, -0.210708, 3.06782, 1, 1, 1, 1, 1,
0.2300354, 0.656148, -0.4372746, 1, 1, 1, 1, 1,
0.2326117, -0.6283497, 2.168753, 1, 1, 1, 1, 1,
0.2428175, 0.1414687, 1.02584, 1, 1, 1, 1, 1,
0.2435067, 0.1516035, -0.2730251, 1, 1, 1, 1, 1,
0.2483111, 1.709804, -2.344748, 1, 1, 1, 1, 1,
0.2495286, 0.257882, 0.9011973, 1, 1, 1, 1, 1,
0.2505851, -0.7186217, 3.179222, 1, 1, 1, 1, 1,
0.2514121, -0.7739989, 3.592223, 1, 1, 1, 1, 1,
0.2528752, -1.117492, 2.527643, 1, 1, 1, 1, 1,
0.2561818, 0.4093962, 1.562327, 1, 1, 1, 1, 1,
0.2599264, 2.29949, -0.03716647, 1, 1, 1, 1, 1,
0.2671618, -1.625423, 4.115698, 1, 1, 1, 1, 1,
0.268664, 1.711574, 0.9727609, 1, 1, 1, 1, 1,
0.2720701, -0.9994982, 2.739983, 0, 0, 1, 1, 1,
0.2779495, -0.2325472, 2.448242, 1, 0, 0, 1, 1,
0.2793495, -0.4790539, 2.23511, 1, 0, 0, 1, 1,
0.2823378, -0.1302025, 1.450933, 1, 0, 0, 1, 1,
0.284972, 0.1099231, 0.7293769, 1, 0, 0, 1, 1,
0.3028503, 0.4120004, 0.8268381, 1, 0, 0, 1, 1,
0.3037187, 2.177873, 1.665843, 0, 0, 0, 1, 1,
0.3049237, -0.4382014, 2.134999, 0, 0, 0, 1, 1,
0.3082732, -1.735768, 2.48327, 0, 0, 0, 1, 1,
0.3120474, -1.611026, 3.622556, 0, 0, 0, 1, 1,
0.3159271, 0.3384168, -1.244608, 0, 0, 0, 1, 1,
0.3174205, -1.165172, 2.620011, 0, 0, 0, 1, 1,
0.3184627, -0.7131993, 2.362584, 0, 0, 0, 1, 1,
0.3191514, 1.750663, 0.8538175, 1, 1, 1, 1, 1,
0.3240586, 0.08089689, 0.1515268, 1, 1, 1, 1, 1,
0.325758, -0.5928192, 3.521052, 1, 1, 1, 1, 1,
0.3259797, -0.7684384, 2.957181, 1, 1, 1, 1, 1,
0.3376188, 1.54899, 0.16416, 1, 1, 1, 1, 1,
0.3394306, -0.3227277, 3.204809, 1, 1, 1, 1, 1,
0.3423072, 0.2509556, 0.7007715, 1, 1, 1, 1, 1,
0.3437666, -0.3842112, 1.882546, 1, 1, 1, 1, 1,
0.3508426, -1.682685, 4.581652, 1, 1, 1, 1, 1,
0.3517338, 0.9597108, 0.007843231, 1, 1, 1, 1, 1,
0.3565519, -1.681213, 3.15978, 1, 1, 1, 1, 1,
0.3612589, -0.04940182, 2.607325, 1, 1, 1, 1, 1,
0.3637294, 1.021649, 0.6371497, 1, 1, 1, 1, 1,
0.366434, -0.2297985, 3.27928, 1, 1, 1, 1, 1,
0.3672489, -0.9241331, 2.786273, 1, 1, 1, 1, 1,
0.368221, -0.2638108, 2.572634, 0, 0, 1, 1, 1,
0.3717383, -0.5162897, 2.221502, 1, 0, 0, 1, 1,
0.3722694, -0.0521936, 2.792204, 1, 0, 0, 1, 1,
0.3752623, -0.2180825, 2.617364, 1, 0, 0, 1, 1,
0.3809215, 0.560113, 1.812173, 1, 0, 0, 1, 1,
0.3886874, -1.117551, 2.226621, 1, 0, 0, 1, 1,
0.3921011, -0.2072968, 1.111329, 0, 0, 0, 1, 1,
0.3949097, 1.077966, 2.160826, 0, 0, 0, 1, 1,
0.3973502, -0.6306479, 1.941272, 0, 0, 0, 1, 1,
0.3992674, -0.8987043, 2.902611, 0, 0, 0, 1, 1,
0.4014721, -0.4814686, 3.045995, 0, 0, 0, 1, 1,
0.4191432, -0.0825019, 2.569907, 0, 0, 0, 1, 1,
0.4204523, 0.5043015, 0.529025, 0, 0, 0, 1, 1,
0.4236098, 0.9512849, 0.662172, 1, 1, 1, 1, 1,
0.4290585, -0.2097621, 1.548484, 1, 1, 1, 1, 1,
0.4314949, -1.291736, 2.675655, 1, 1, 1, 1, 1,
0.4333294, 0.2077004, 3.755444, 1, 1, 1, 1, 1,
0.4346777, 1.415565, 0.03676028, 1, 1, 1, 1, 1,
0.4357715, -0.9491532, 1.667414, 1, 1, 1, 1, 1,
0.4364909, -0.9565043, 2.233043, 1, 1, 1, 1, 1,
0.4371917, -2.320847, 2.906336, 1, 1, 1, 1, 1,
0.4418152, -0.6612621, 1.88629, 1, 1, 1, 1, 1,
0.4465536, -0.2724765, 2.602653, 1, 1, 1, 1, 1,
0.4493659, -1.469893, 4.576168, 1, 1, 1, 1, 1,
0.4494515, 0.2778293, 0.292514, 1, 1, 1, 1, 1,
0.4519944, 0.1607847, 1.885953, 1, 1, 1, 1, 1,
0.4548527, 1.025407, 0.8386891, 1, 1, 1, 1, 1,
0.4552818, 1.364234, -0.2182946, 1, 1, 1, 1, 1,
0.4582373, 0.1131027, -0.9578096, 0, 0, 1, 1, 1,
0.4609614, 0.7375928, -0.8411433, 1, 0, 0, 1, 1,
0.4640848, -0.7611931, 4.511193, 1, 0, 0, 1, 1,
0.4681008, -0.9479148, 3.775573, 1, 0, 0, 1, 1,
0.4701979, 2.778482, -0.9660341, 1, 0, 0, 1, 1,
0.4857131, 1.488643, 0.1700394, 1, 0, 0, 1, 1,
0.4899856, -1.509215, 3.072598, 0, 0, 0, 1, 1,
0.4903116, -1.209874, 4.578184, 0, 0, 0, 1, 1,
0.4923165, 0.01637249, 1.823555, 0, 0, 0, 1, 1,
0.4970112, 0.2261926, 1.246376, 0, 0, 0, 1, 1,
0.498592, 0.9709541, 1.660749, 0, 0, 0, 1, 1,
0.5013524, -0.8945071, 3.203679, 0, 0, 0, 1, 1,
0.5058509, -1.582798, 2.670477, 0, 0, 0, 1, 1,
0.5080717, -0.7005115, 2.492899, 1, 1, 1, 1, 1,
0.5131999, -1.786681, 2.958033, 1, 1, 1, 1, 1,
0.5153486, -1.351924, 2.379081, 1, 1, 1, 1, 1,
0.5162407, 0.2942332, 0.5392311, 1, 1, 1, 1, 1,
0.5210129, -1.527837, 2.731125, 1, 1, 1, 1, 1,
0.5210613, 0.2119471, 3.311827, 1, 1, 1, 1, 1,
0.5254881, -0.4760492, 2.745831, 1, 1, 1, 1, 1,
0.5258752, -0.5932025, 2.958601, 1, 1, 1, 1, 1,
0.5272062, 0.6709774, 1.302748, 1, 1, 1, 1, 1,
0.5337811, 0.9488501, 1.059557, 1, 1, 1, 1, 1,
0.5339014, -1.244066, 2.695853, 1, 1, 1, 1, 1,
0.5346756, 0.5580003, -0.5065041, 1, 1, 1, 1, 1,
0.5356369, 1.139278, -0.1400059, 1, 1, 1, 1, 1,
0.5359985, 1.382473, 0.3814059, 1, 1, 1, 1, 1,
0.538137, -0.4278595, 3.713341, 1, 1, 1, 1, 1,
0.5404605, 1.691609, 1.865947, 0, 0, 1, 1, 1,
0.5410256, -0.9550735, 2.698801, 1, 0, 0, 1, 1,
0.5466779, 1.447833, 1.973653, 1, 0, 0, 1, 1,
0.5517851, 1.450394, 0.2432051, 1, 0, 0, 1, 1,
0.5549485, 1.344565, -0.9540247, 1, 0, 0, 1, 1,
0.5551723, -1.601049, 2.311052, 1, 0, 0, 1, 1,
0.5555667, 0.1264116, 1.280371, 0, 0, 0, 1, 1,
0.5713037, 0.6911064, -0.3566685, 0, 0, 0, 1, 1,
0.5724784, -0.3385516, 1.228013, 0, 0, 0, 1, 1,
0.5732371, -1.751, 3.454491, 0, 0, 0, 1, 1,
0.5828094, -0.4627088, 2.386881, 0, 0, 0, 1, 1,
0.585757, -0.06169164, 0.004815282, 0, 0, 0, 1, 1,
0.5867113, -0.7699383, 1.558048, 0, 0, 0, 1, 1,
0.5875837, -1.240942, 1.718644, 1, 1, 1, 1, 1,
0.5876316, 0.3655485, 2.181202, 1, 1, 1, 1, 1,
0.5910696, -1.29924, 2.964885, 1, 1, 1, 1, 1,
0.5914179, -1.159065, -0.05009996, 1, 1, 1, 1, 1,
0.593388, -0.9578974, 1.324587, 1, 1, 1, 1, 1,
0.5994177, 0.3458647, 0.4584151, 1, 1, 1, 1, 1,
0.6059141, 0.8051751, 1.26976, 1, 1, 1, 1, 1,
0.607453, 0.2224087, 1.784849, 1, 1, 1, 1, 1,
0.6078517, -0.3502804, 2.481947, 1, 1, 1, 1, 1,
0.612216, -1.144176, 3.631689, 1, 1, 1, 1, 1,
0.6157674, 0.8133138, 1.499632, 1, 1, 1, 1, 1,
0.6169168, 0.9362012, 0.8156276, 1, 1, 1, 1, 1,
0.6182228, 0.7926885, 0.686365, 1, 1, 1, 1, 1,
0.6213382, -0.6703716, 2.970985, 1, 1, 1, 1, 1,
0.6335613, 0.07777287, 0.7090744, 1, 1, 1, 1, 1,
0.6350437, -1.254586, 1.809531, 0, 0, 1, 1, 1,
0.6404576, -0.5336344, 1.839208, 1, 0, 0, 1, 1,
0.6522905, -1.673839, 2.106828, 1, 0, 0, 1, 1,
0.655201, 0.8522798, -0.5007799, 1, 0, 0, 1, 1,
0.6639475, -0.657324, 4.32012, 1, 0, 0, 1, 1,
0.6787825, 0.1994625, 0.8087922, 1, 0, 0, 1, 1,
0.6799514, -1.315577, 3.004412, 0, 0, 0, 1, 1,
0.6809848, -1.818337, 2.38547, 0, 0, 0, 1, 1,
0.6890174, 1.972777, 1.381588, 0, 0, 0, 1, 1,
0.6898164, -1.346352, 1.879052, 0, 0, 0, 1, 1,
0.6904526, -0.357808, 1.351888, 0, 0, 0, 1, 1,
0.6910672, -0.2100873, 1.535527, 0, 0, 0, 1, 1,
0.6942528, -1.556095, 4.23329, 0, 0, 0, 1, 1,
0.694695, 0.6684754, -0.5592343, 1, 1, 1, 1, 1,
0.6967832, 0.3523205, -0.1136371, 1, 1, 1, 1, 1,
0.6971697, -0.2700596, -0.02339279, 1, 1, 1, 1, 1,
0.700669, -1.717978, 2.220498, 1, 1, 1, 1, 1,
0.7026906, -0.2241763, 2.694942, 1, 1, 1, 1, 1,
0.7059559, -0.9066141, 3.078058, 1, 1, 1, 1, 1,
0.7071181, -0.5191463, 3.334345, 1, 1, 1, 1, 1,
0.7075499, -0.1956589, 1.815238, 1, 1, 1, 1, 1,
0.7086275, 0.5126293, 2.278299, 1, 1, 1, 1, 1,
0.7097262, -0.1413448, 3.920407, 1, 1, 1, 1, 1,
0.7117156, -0.9654443, 1.237565, 1, 1, 1, 1, 1,
0.7162305, 1.132041, 2.496072, 1, 1, 1, 1, 1,
0.7195897, 0.6045581, 1.747224, 1, 1, 1, 1, 1,
0.7249874, -2.729195, 2.477444, 1, 1, 1, 1, 1,
0.7297344, -1.101103, 2.581496, 1, 1, 1, 1, 1,
0.7303299, 0.9115812, 0.3825517, 0, 0, 1, 1, 1,
0.739096, -0.4657565, 2.788962, 1, 0, 0, 1, 1,
0.7438089, -0.8094323, 3.685205, 1, 0, 0, 1, 1,
0.7441739, 0.964636, 1.002285, 1, 0, 0, 1, 1,
0.7443385, -0.9187258, 2.278634, 1, 0, 0, 1, 1,
0.746451, -0.006811425, 1.095995, 1, 0, 0, 1, 1,
0.7474531, 0.04667744, 2.237279, 0, 0, 0, 1, 1,
0.7501324, -0.3907127, 2.750016, 0, 0, 0, 1, 1,
0.7540516, 1.65462, 1.658293, 0, 0, 0, 1, 1,
0.7560588, 0.09372355, 1.499509, 0, 0, 0, 1, 1,
0.7574033, -1.425365, 3.621249, 0, 0, 0, 1, 1,
0.7584053, -1.022769, 2.923089, 0, 0, 0, 1, 1,
0.7587517, 0.3586303, 1.888694, 0, 0, 0, 1, 1,
0.7758749, -0.1132719, 1.790733, 1, 1, 1, 1, 1,
0.780083, -0.1568535, -0.5718884, 1, 1, 1, 1, 1,
0.7816109, 0.7292292, 0.4686893, 1, 1, 1, 1, 1,
0.7836282, 1.554569, 1.608972, 1, 1, 1, 1, 1,
0.7842597, 0.7306787, 1.300385, 1, 1, 1, 1, 1,
0.7847079, 0.1522161, 0.7122278, 1, 1, 1, 1, 1,
0.7856644, -0.1981946, 3.443552, 1, 1, 1, 1, 1,
0.7909833, -0.2171893, 1.850011, 1, 1, 1, 1, 1,
0.795193, 0.9383842, 1.865377, 1, 1, 1, 1, 1,
0.7954358, 1.685949, 0.6975062, 1, 1, 1, 1, 1,
0.7971495, 1.417775, -1.044797, 1, 1, 1, 1, 1,
0.7973779, -2.067722, 3.511873, 1, 1, 1, 1, 1,
0.8000265, -0.7470028, 3.533229, 1, 1, 1, 1, 1,
0.8003467, 1.600094, 0.2512664, 1, 1, 1, 1, 1,
0.8017766, 0.865305, 0.8385828, 1, 1, 1, 1, 1,
0.8057398, 0.9196282, 1.177998, 0, 0, 1, 1, 1,
0.8066231, 0.5965044, 0.9662452, 1, 0, 0, 1, 1,
0.8101756, -0.4283787, 0.9688236, 1, 0, 0, 1, 1,
0.8148394, -0.6168812, 2.624752, 1, 0, 0, 1, 1,
0.8153937, 0.4080614, 2.334808, 1, 0, 0, 1, 1,
0.8279799, 0.3888835, 1.202357, 1, 0, 0, 1, 1,
0.8293536, -0.9455547, 1.636369, 0, 0, 0, 1, 1,
0.834085, -1.342836, 3.622862, 0, 0, 0, 1, 1,
0.8378814, 2.074486, 1.395831, 0, 0, 0, 1, 1,
0.8459284, 0.4731435, 1.548488, 0, 0, 0, 1, 1,
0.8476823, -1.807178, 2.986449, 0, 0, 0, 1, 1,
0.8478361, 0.6389099, 1.513485, 0, 0, 0, 1, 1,
0.8517359, -0.8136577, 1.705485, 0, 0, 0, 1, 1,
0.8551437, 0.02675003, 1.860878, 1, 1, 1, 1, 1,
0.8560461, 0.3736952, 2.436174, 1, 1, 1, 1, 1,
0.8573452, 0.2095876, -0.3020552, 1, 1, 1, 1, 1,
0.8666053, 1.509102, 0.4446962, 1, 1, 1, 1, 1,
0.8987341, -1.530783, 1.662344, 1, 1, 1, 1, 1,
0.9011332, -0.04426496, 2.226564, 1, 1, 1, 1, 1,
0.9015711, -0.1669258, 1.662505, 1, 1, 1, 1, 1,
0.905466, -1.367189, 1.601108, 1, 1, 1, 1, 1,
0.9099807, -0.06110759, 1.457158, 1, 1, 1, 1, 1,
0.9122961, -0.3388498, 4.130672, 1, 1, 1, 1, 1,
0.9147139, -1.013965, 1.418552, 1, 1, 1, 1, 1,
0.9161642, -0.131996, 1.066016, 1, 1, 1, 1, 1,
0.9175782, -0.1658362, 3.056097, 1, 1, 1, 1, 1,
0.918219, -0.6400571, 1.649615, 1, 1, 1, 1, 1,
0.9201841, 1.263157, -0.7942446, 1, 1, 1, 1, 1,
0.920431, -0.615011, 3.517841, 0, 0, 1, 1, 1,
0.9208933, 0.8140886, 1.449076, 1, 0, 0, 1, 1,
0.9255236, 1.051, -0.06995516, 1, 0, 0, 1, 1,
0.9353239, -0.7570874, 3.619505, 1, 0, 0, 1, 1,
0.9364035, 0.2390189, 1.418465, 1, 0, 0, 1, 1,
0.9412767, -0.8338181, -0.06932292, 1, 0, 0, 1, 1,
0.9414052, 1.361484, -0.5878974, 0, 0, 0, 1, 1,
0.9466366, 0.02522511, 0.5634521, 0, 0, 0, 1, 1,
0.9470755, 0.4540456, 1.121989, 0, 0, 0, 1, 1,
0.9482636, 1.36055, 1.399436, 0, 0, 0, 1, 1,
0.9526569, 1.580011, 1.075764, 0, 0, 0, 1, 1,
0.9532033, 0.7770198, 2.712957, 0, 0, 0, 1, 1,
0.9585223, -0.2160148, 1.533871, 0, 0, 0, 1, 1,
0.9637615, 0.3227107, 1.231506, 1, 1, 1, 1, 1,
0.9638861, 0.06553795, 1.655275, 1, 1, 1, 1, 1,
0.9655988, -0.8543807, 3.070298, 1, 1, 1, 1, 1,
0.9688452, -1.098239, 3.03332, 1, 1, 1, 1, 1,
0.9739366, -0.6935561, 1.865754, 1, 1, 1, 1, 1,
0.9811937, 0.5151668, 1.346383, 1, 1, 1, 1, 1,
0.9831569, 0.3349379, 1.782844, 1, 1, 1, 1, 1,
0.9849171, 0.6388318, 2.131974, 1, 1, 1, 1, 1,
0.987093, 0.7941604, 2.125886, 1, 1, 1, 1, 1,
0.9892572, 0.4577903, 0.5939617, 1, 1, 1, 1, 1,
0.9940414, -1.187029, 2.911887, 1, 1, 1, 1, 1,
0.9960168, -0.7953581, 2.96785, 1, 1, 1, 1, 1,
1.000281, -0.1765972, 0.8959729, 1, 1, 1, 1, 1,
1.003027, -0.4674255, 1.554511, 1, 1, 1, 1, 1,
1.018247, -0.234595, 1.641322, 1, 1, 1, 1, 1,
1.021015, -0.6436502, 2.901282, 0, 0, 1, 1, 1,
1.022832, -0.378328, 2.618369, 1, 0, 0, 1, 1,
1.024277, 0.6741088, 0.4741783, 1, 0, 0, 1, 1,
1.024424, -1.405711, 3.896123, 1, 0, 0, 1, 1,
1.025854, -0.5111973, 3.249333, 1, 0, 0, 1, 1,
1.03069, 0.1233365, 1.337794, 1, 0, 0, 1, 1,
1.037238, -1.049548, 1.217688, 0, 0, 0, 1, 1,
1.037552, -0.01620521, 0.9041012, 0, 0, 0, 1, 1,
1.041094, -0.1235493, 2.029828, 0, 0, 0, 1, 1,
1.042246, 1.606182, 0.4510528, 0, 0, 0, 1, 1,
1.049165, 0.2773473, 1.370345, 0, 0, 0, 1, 1,
1.052865, -2.340437, 3.427456, 0, 0, 0, 1, 1,
1.0541, 0.1630783, 0.2528354, 0, 0, 0, 1, 1,
1.07266, -0.6910629, 3.061079, 1, 1, 1, 1, 1,
1.080667, -2.507419, 2.042865, 1, 1, 1, 1, 1,
1.08729, -1.423265, 4.314124, 1, 1, 1, 1, 1,
1.089796, 1.489813, 1.05227, 1, 1, 1, 1, 1,
1.101084, -0.172626, 2.200561, 1, 1, 1, 1, 1,
1.101974, -2.03099, 1.909247, 1, 1, 1, 1, 1,
1.115453, 1.347021, -0.4864017, 1, 1, 1, 1, 1,
1.117523, -0.4434018, 2.268401, 1, 1, 1, 1, 1,
1.117783, 0.5811511, 2.476552, 1, 1, 1, 1, 1,
1.120562, -0.4503621, 1.285839, 1, 1, 1, 1, 1,
1.132545, 0.2906604, -0.9528077, 1, 1, 1, 1, 1,
1.135567, -0.09361349, 3.061178, 1, 1, 1, 1, 1,
1.137779, -0.4489768, 2.526432, 1, 1, 1, 1, 1,
1.140477, 1.120404, 0.6872975, 1, 1, 1, 1, 1,
1.143018, -0.2970942, 2.621609, 1, 1, 1, 1, 1,
1.15002, 0.3428649, -0.03088193, 0, 0, 1, 1, 1,
1.15037, -1.832856, 1.956127, 1, 0, 0, 1, 1,
1.189549, -0.5477402, 0.8579437, 1, 0, 0, 1, 1,
1.19386, 0.09354077, 2.203282, 1, 0, 0, 1, 1,
1.194443, 0.3168454, -0.5928646, 1, 0, 0, 1, 1,
1.198313, 1.05333, 1.685221, 1, 0, 0, 1, 1,
1.202813, 1.042866, 1.172406, 0, 0, 0, 1, 1,
1.204105, -0.03095454, 3.052925, 0, 0, 0, 1, 1,
1.210045, 2.251588, 0.2485042, 0, 0, 0, 1, 1,
1.210475, 1.728026, -0.7364841, 0, 0, 0, 1, 1,
1.214072, 0.6795529, 2.529611, 0, 0, 0, 1, 1,
1.214517, -0.1343173, 3.499519, 0, 0, 0, 1, 1,
1.215513, -1.489046, 2.091656, 0, 0, 0, 1, 1,
1.219149, -0.007470712, 2.863654, 1, 1, 1, 1, 1,
1.22074, -1.461149, 2.760828, 1, 1, 1, 1, 1,
1.2282, -1.037532, 2.904571, 1, 1, 1, 1, 1,
1.229859, 1.169155, 1.48965, 1, 1, 1, 1, 1,
1.238639, 1.467833, 1.043366, 1, 1, 1, 1, 1,
1.239634, -0.420834, 2.273347, 1, 1, 1, 1, 1,
1.240129, 1.169801, -0.3280016, 1, 1, 1, 1, 1,
1.241988, -0.6141384, 1.422314, 1, 1, 1, 1, 1,
1.243871, 1.809272, 0.07912138, 1, 1, 1, 1, 1,
1.244846, 0.3409186, 1.348833, 1, 1, 1, 1, 1,
1.248042, -0.1828508, 1.652445, 1, 1, 1, 1, 1,
1.255104, -0.4392741, 3.393932, 1, 1, 1, 1, 1,
1.275491, -0.01068182, 2.346414, 1, 1, 1, 1, 1,
1.282912, 0.6590093, 2.92996, 1, 1, 1, 1, 1,
1.283342, -0.0610384, 3.589882, 1, 1, 1, 1, 1,
1.285843, 0.1474164, 0.4851831, 0, 0, 1, 1, 1,
1.291459, 1.861298, 1.924265, 1, 0, 0, 1, 1,
1.293654, 0.4783591, 0.2294888, 1, 0, 0, 1, 1,
1.298205, -1.793896, 1.463014, 1, 0, 0, 1, 1,
1.302684, 1.843301, -0.2833981, 1, 0, 0, 1, 1,
1.310603, -1.041447, 1.992084, 1, 0, 0, 1, 1,
1.323014, 1.436513, 1.869037, 0, 0, 0, 1, 1,
1.323819, -0.2685314, 3.656902, 0, 0, 0, 1, 1,
1.32441, -0.9196854, 2.221619, 0, 0, 0, 1, 1,
1.324951, 0.6025268, -0.3399032, 0, 0, 0, 1, 1,
1.325964, -0.5286125, 1.729779, 0, 0, 0, 1, 1,
1.333057, 1.998302, 0.09408241, 0, 0, 0, 1, 1,
1.338151, -0.2161564, 2.410762, 0, 0, 0, 1, 1,
1.339195, -1.005869, 1.019917, 1, 1, 1, 1, 1,
1.34259, 0.9294675, 0.149646, 1, 1, 1, 1, 1,
1.34501, -0.5585665, 3.406579, 1, 1, 1, 1, 1,
1.346373, 0.6912809, 1.842731, 1, 1, 1, 1, 1,
1.359814, 0.1909744, 1.30023, 1, 1, 1, 1, 1,
1.362645, -0.2985119, 2.064354, 1, 1, 1, 1, 1,
1.362857, 0.265213, 3.106507, 1, 1, 1, 1, 1,
1.363477, 1.146048, 2.397957, 1, 1, 1, 1, 1,
1.369261, -0.3558346, 2.704582, 1, 1, 1, 1, 1,
1.38139, -0.06831272, 3.150283, 1, 1, 1, 1, 1,
1.385297, -0.7429836, 1.612354, 1, 1, 1, 1, 1,
1.40861, -0.4114099, 0.6691657, 1, 1, 1, 1, 1,
1.415505, -0.8891379, 3.479172, 1, 1, 1, 1, 1,
1.417234, -0.7916254, 2.744378, 1, 1, 1, 1, 1,
1.422201, 0.06511258, 0.7566233, 1, 1, 1, 1, 1,
1.424173, 0.1652588, 1.057323, 0, 0, 1, 1, 1,
1.438625, -0.6263608, 0.8232846, 1, 0, 0, 1, 1,
1.44544, -1.8648, 1.779734, 1, 0, 0, 1, 1,
1.448768, 1.161373, 1.274568, 1, 0, 0, 1, 1,
1.457698, -0.4349601, 1.259202, 1, 0, 0, 1, 1,
1.464883, 0.3717435, 1.170658, 1, 0, 0, 1, 1,
1.466957, 0.2581109, -0.4535196, 0, 0, 0, 1, 1,
1.477915, -0.01095327, 2.711329, 0, 0, 0, 1, 1,
1.483156, 0.1602738, 0.486763, 0, 0, 0, 1, 1,
1.486214, -0.04894516, -0.4432233, 0, 0, 0, 1, 1,
1.488941, 1.350632, 1.469242, 0, 0, 0, 1, 1,
1.494391, 0.8670495, 1.144632, 0, 0, 0, 1, 1,
1.514766, 0.2130869, 1.914145, 0, 0, 0, 1, 1,
1.518248, 1.379763, 0.3995761, 1, 1, 1, 1, 1,
1.526628, 0.115884, 2.223699, 1, 1, 1, 1, 1,
1.53734, 0.8223869, 1.411955, 1, 1, 1, 1, 1,
1.548154, -2.682756, 2.233555, 1, 1, 1, 1, 1,
1.559136, 1.113131, 1.149324, 1, 1, 1, 1, 1,
1.569351, 2.046098, 0.9160593, 1, 1, 1, 1, 1,
1.573609, 0.3746443, 0.7150089, 1, 1, 1, 1, 1,
1.578823, 0.107429, 1.15376, 1, 1, 1, 1, 1,
1.584352, -0.1660934, 1.734624, 1, 1, 1, 1, 1,
1.584893, -0.06298289, 1.780933, 1, 1, 1, 1, 1,
1.593657, 1.779101, -1.526857, 1, 1, 1, 1, 1,
1.594817, 0.4226087, 0.5494144, 1, 1, 1, 1, 1,
1.606264, 1.533095, 1.602378, 1, 1, 1, 1, 1,
1.611935, 1.102278, 1.330275, 1, 1, 1, 1, 1,
1.616139, 0.4158505, 1.134578, 1, 1, 1, 1, 1,
1.636351, 0.3740575, 1.673146, 0, 0, 1, 1, 1,
1.63647, 1.101565, 0.830879, 1, 0, 0, 1, 1,
1.657248, -1.44928, 2.049738, 1, 0, 0, 1, 1,
1.677955, 0.02834756, 2.111058, 1, 0, 0, 1, 1,
1.681993, -2.1094, 3.027517, 1, 0, 0, 1, 1,
1.715412, -0.8178052, 0.9453544, 1, 0, 0, 1, 1,
1.76024, -0.4589779, 2.333981, 0, 0, 0, 1, 1,
1.761073, -0.8016095, 2.091909, 0, 0, 0, 1, 1,
1.769379, 0.05840734, 2.622058, 0, 0, 0, 1, 1,
1.77361, 0.6459948, 2.301477, 0, 0, 0, 1, 1,
1.779025, 0.9886857, 2.841308, 0, 0, 0, 1, 1,
1.789846, -0.09137612, 4.69304, 0, 0, 0, 1, 1,
1.797539, -0.1194691, 2.575065, 0, 0, 0, 1, 1,
1.834263, -0.7075294, 2.977234, 1, 1, 1, 1, 1,
1.835629, -0.02242414, 0.6330574, 1, 1, 1, 1, 1,
1.83635, -0.7034611, 1.139682, 1, 1, 1, 1, 1,
1.847662, 0.58053, 1.280393, 1, 1, 1, 1, 1,
1.878438, 0.5907542, 1.11378, 1, 1, 1, 1, 1,
1.882856, -1.029614, 2.789128, 1, 1, 1, 1, 1,
1.886826, 0.4639629, 1.298651, 1, 1, 1, 1, 1,
1.88955, -1.804726, 2.441205, 1, 1, 1, 1, 1,
1.903072, -0.5748782, -0.1170502, 1, 1, 1, 1, 1,
1.933514, -0.400031, 2.566539, 1, 1, 1, 1, 1,
1.934225, 0.1326336, 2.961149, 1, 1, 1, 1, 1,
1.934358, 0.6340644, 0.8675236, 1, 1, 1, 1, 1,
2.010196, 0.1134592, 2.810212, 1, 1, 1, 1, 1,
2.011361, 0.1434478, 0.3472604, 1, 1, 1, 1, 1,
2.011593, 0.04698164, 0.8751845, 1, 1, 1, 1, 1,
2.06622, 1.116176, 0.9905972, 0, 0, 1, 1, 1,
2.089989, 0.3783838, -0.6019133, 1, 0, 0, 1, 1,
2.091441, 0.4263801, 2.443861, 1, 0, 0, 1, 1,
2.101661, -0.3424317, 0.609139, 1, 0, 0, 1, 1,
2.135421, -0.3462362, -0.1136348, 1, 0, 0, 1, 1,
2.149941, -0.5743046, 1.097722, 1, 0, 0, 1, 1,
2.190612, -0.2418256, 2.398201, 0, 0, 0, 1, 1,
2.2074, 0.4481615, 0.8298729, 0, 0, 0, 1, 1,
2.222494, -1.177727, 0.7850999, 0, 0, 0, 1, 1,
2.249649, -1.423279, 3.85207, 0, 0, 0, 1, 1,
2.323431, 1.239183, 0.3282703, 0, 0, 0, 1, 1,
2.403816, -0.6752726, 1.801084, 0, 0, 0, 1, 1,
2.472492, -1.552683, 2.946364, 0, 0, 0, 1, 1,
2.481637, 1.131144, 1.389025, 1, 1, 1, 1, 1,
2.532804, -0.9474654, 2.965734, 1, 1, 1, 1, 1,
2.560837, 0.6736231, 1.72016, 1, 1, 1, 1, 1,
2.583623, -0.5207208, 1.021637, 1, 1, 1, 1, 1,
2.649223, 0.1905362, -1.090292, 1, 1, 1, 1, 1,
2.775484, 0.6303265, 1.279695, 1, 1, 1, 1, 1,
2.817507, -0.1506113, 1.611246, 1, 1, 1, 1, 1
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
var radius = 9.978368;
var distance = 35.04859;
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
mvMatrix.translate( 0.5998732, 0.3274095, 0.2354057 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.04859);
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
