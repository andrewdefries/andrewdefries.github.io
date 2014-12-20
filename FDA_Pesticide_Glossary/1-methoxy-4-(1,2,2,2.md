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
-3.411398, 0.9603326, -1.286334, 1, 0, 0, 1,
-3.240159, -0.2672547, -2.509796, 1, 0.007843138, 0, 1,
-3.214942, -0.6784595, -1.238901, 1, 0.01176471, 0, 1,
-2.952459, 0.5624337, -1.579138, 1, 0.01960784, 0, 1,
-2.776654, -1.821615, -0.3643117, 1, 0.02352941, 0, 1,
-2.712372, 0.3427646, -1.95559, 1, 0.03137255, 0, 1,
-2.539785, 1.073676, -1.864538, 1, 0.03529412, 0, 1,
-2.516038, 0.8614395, 0.3440793, 1, 0.04313726, 0, 1,
-2.501765, 2.029036, -1.540527, 1, 0.04705882, 0, 1,
-2.451314, 1.687629, -1.292529, 1, 0.05490196, 0, 1,
-2.447572, -0.4950333, -1.233816, 1, 0.05882353, 0, 1,
-2.401566, 0.3007818, -2.176358, 1, 0.06666667, 0, 1,
-2.368267, 0.6473972, -2.312952, 1, 0.07058824, 0, 1,
-2.337804, 0.5013047, 0.4828778, 1, 0.07843138, 0, 1,
-2.335527, 1.01047, 0.2051032, 1, 0.08235294, 0, 1,
-2.303372, 0.7480186, -1.198119, 1, 0.09019608, 0, 1,
-2.299225, 0.5168598, -0.09807648, 1, 0.09411765, 0, 1,
-2.264379, -0.9132597, -3.688061, 1, 0.1019608, 0, 1,
-2.10988, 0.6460138, -1.512076, 1, 0.1098039, 0, 1,
-2.096283, -1.085978, -2.27821, 1, 0.1137255, 0, 1,
-2.083536, 1.416664, -2.999085, 1, 0.1215686, 0, 1,
-2.05136, 0.5496169, 0.1982277, 1, 0.1254902, 0, 1,
-2.01305, 0.2013007, -2.07375, 1, 0.1333333, 0, 1,
-2.001674, -0.9120734, -2.339205, 1, 0.1372549, 0, 1,
-1.992729, -0.158965, -2.777571, 1, 0.145098, 0, 1,
-1.972876, -0.5497255, -3.222536, 1, 0.1490196, 0, 1,
-1.967118, -0.8460812, 0.718764, 1, 0.1568628, 0, 1,
-1.952666, 0.1554662, -1.139289, 1, 0.1607843, 0, 1,
-1.952033, 1.382384, -1.60173, 1, 0.1686275, 0, 1,
-1.950778, -0.4327924, -2.508244, 1, 0.172549, 0, 1,
-1.943306, -1.365103, -2.725812, 1, 0.1803922, 0, 1,
-1.943183, -0.8140171, -1.495085, 1, 0.1843137, 0, 1,
-1.891973, 0.6590317, -2.656705, 1, 0.1921569, 0, 1,
-1.876422, 0.9047487, 0.08863888, 1, 0.1960784, 0, 1,
-1.872046, 0.2634176, -2.988836, 1, 0.2039216, 0, 1,
-1.869081, 0.5693636, -0.2201626, 1, 0.2117647, 0, 1,
-1.862659, 0.4112625, -0.5962566, 1, 0.2156863, 0, 1,
-1.857483, -0.8951178, -2.213485, 1, 0.2235294, 0, 1,
-1.85737, -1.044642, -3.16624, 1, 0.227451, 0, 1,
-1.851358, 0.5121631, -2.834695, 1, 0.2352941, 0, 1,
-1.828141, 0.3810438, -1.871828, 1, 0.2392157, 0, 1,
-1.825961, 0.6943352, 0.2412718, 1, 0.2470588, 0, 1,
-1.818274, -0.6410766, -1.751047, 1, 0.2509804, 0, 1,
-1.809787, 1.055882, -0.9216064, 1, 0.2588235, 0, 1,
-1.799213, -0.1769026, -2.692559, 1, 0.2627451, 0, 1,
-1.789301, 1.093858, -0.5991355, 1, 0.2705882, 0, 1,
-1.787571, 1.876998, -1.960665, 1, 0.2745098, 0, 1,
-1.769299, 0.3885516, -0.5349588, 1, 0.282353, 0, 1,
-1.759101, -0.06858947, 0.374409, 1, 0.2862745, 0, 1,
-1.758136, 1.08569, -1.335891, 1, 0.2941177, 0, 1,
-1.758072, 0.984785, -1.664876, 1, 0.3019608, 0, 1,
-1.755595, -1.429713, -3.726323, 1, 0.3058824, 0, 1,
-1.73253, -0.3720577, -2.856045, 1, 0.3137255, 0, 1,
-1.730356, 0.01434631, -2.41399, 1, 0.3176471, 0, 1,
-1.730295, -0.6726081, -1.957611, 1, 0.3254902, 0, 1,
-1.723904, 1.005763, -1.467021, 1, 0.3294118, 0, 1,
-1.72038, 0.07413872, -1.626305, 1, 0.3372549, 0, 1,
-1.712591, 0.4184401, -0.7279075, 1, 0.3411765, 0, 1,
-1.711023, 0.7983872, -0.3599835, 1, 0.3490196, 0, 1,
-1.701528, 0.05843793, -1.000642, 1, 0.3529412, 0, 1,
-1.681843, -0.0732486, -0.1478688, 1, 0.3607843, 0, 1,
-1.67941, 1.174016, -1.412637, 1, 0.3647059, 0, 1,
-1.676231, -1.739516, -3.934834, 1, 0.372549, 0, 1,
-1.672365, 0.1800141, -0.598479, 1, 0.3764706, 0, 1,
-1.671746, -1.167516, -0.8253099, 1, 0.3843137, 0, 1,
-1.667248, -0.4991596, -2.341138, 1, 0.3882353, 0, 1,
-1.650787, 0.8714082, -1.594982, 1, 0.3960784, 0, 1,
-1.634622, 2.438806, -0.719586, 1, 0.4039216, 0, 1,
-1.622691, 1.099966, -0.8091356, 1, 0.4078431, 0, 1,
-1.620041, 1.102349, -0.05751517, 1, 0.4156863, 0, 1,
-1.619153, -0.08684031, -2.065113, 1, 0.4196078, 0, 1,
-1.608883, -0.7164593, -2.093766, 1, 0.427451, 0, 1,
-1.593936, 2.134071, -0.3670447, 1, 0.4313726, 0, 1,
-1.587421, -0.311031, -1.570348, 1, 0.4392157, 0, 1,
-1.585215, 1.473914, -0.03858444, 1, 0.4431373, 0, 1,
-1.558988, 0.2993514, -1.763882, 1, 0.4509804, 0, 1,
-1.5534, -0.1652393, -2.318604, 1, 0.454902, 0, 1,
-1.552427, 0.4450904, -2.694127, 1, 0.4627451, 0, 1,
-1.515937, 0.8547123, -1.76133, 1, 0.4666667, 0, 1,
-1.509803, 1.751388, -1.39095, 1, 0.4745098, 0, 1,
-1.501623, -0.177173, -1.408054, 1, 0.4784314, 0, 1,
-1.501297, 0.7628605, 0.6536511, 1, 0.4862745, 0, 1,
-1.493764, 3.358117, 0.9429791, 1, 0.4901961, 0, 1,
-1.48179, 1.543413, 0.310669, 1, 0.4980392, 0, 1,
-1.472983, -0.3182273, -1.974914, 1, 0.5058824, 0, 1,
-1.470956, 1.05258, -0.8100888, 1, 0.509804, 0, 1,
-1.464529, -0.7761882, -1.585596, 1, 0.5176471, 0, 1,
-1.463949, 0.8711151, 0.3561261, 1, 0.5215687, 0, 1,
-1.456518, -1.279912, -3.100553, 1, 0.5294118, 0, 1,
-1.449831, -1.016978, -0.3223341, 1, 0.5333334, 0, 1,
-1.442659, 0.04730681, -1.782344, 1, 0.5411765, 0, 1,
-1.442435, -0.2697056, -2.548144, 1, 0.5450981, 0, 1,
-1.427594, -1.186823, -1.692604, 1, 0.5529412, 0, 1,
-1.414523, 0.2927117, -0.9461002, 1, 0.5568628, 0, 1,
-1.409514, 0.3541264, -4.094535, 1, 0.5647059, 0, 1,
-1.407132, -0.3901886, -0.9909685, 1, 0.5686275, 0, 1,
-1.395692, 1.049416, -0.7415604, 1, 0.5764706, 0, 1,
-1.391287, 0.5012605, -1.064081, 1, 0.5803922, 0, 1,
-1.390001, -0.05109821, 0.2221363, 1, 0.5882353, 0, 1,
-1.387998, -0.4031479, -0.01136725, 1, 0.5921569, 0, 1,
-1.38398, -0.97384, -2.990984, 1, 0.6, 0, 1,
-1.374317, 0.9875691, -0.7630068, 1, 0.6078432, 0, 1,
-1.366275, 0.09095884, -2.120503, 1, 0.6117647, 0, 1,
-1.359183, -0.6931834, -2.489851, 1, 0.6196079, 0, 1,
-1.358098, -0.6340865, -1.025413, 1, 0.6235294, 0, 1,
-1.355946, 0.6121349, -1.304552, 1, 0.6313726, 0, 1,
-1.338542, 0.00133894, -1.62462, 1, 0.6352941, 0, 1,
-1.333983, -0.3391466, -1.45244, 1, 0.6431373, 0, 1,
-1.324796, 0.005442278, -2.033463, 1, 0.6470588, 0, 1,
-1.314592, 0.5847614, -1.597646, 1, 0.654902, 0, 1,
-1.311463, -1.237709, -2.510542, 1, 0.6588235, 0, 1,
-1.293162, -0.7068887, -2.916678, 1, 0.6666667, 0, 1,
-1.293024, -0.3439268, -2.336267, 1, 0.6705883, 0, 1,
-1.286621, 0.3977956, -0.09577936, 1, 0.6784314, 0, 1,
-1.283152, -0.7446783, -3.546396, 1, 0.682353, 0, 1,
-1.281952, -1.053196, -2.622033, 1, 0.6901961, 0, 1,
-1.276567, -1.436567, -3.274029, 1, 0.6941177, 0, 1,
-1.276351, 0.8202207, -1.603397, 1, 0.7019608, 0, 1,
-1.27572, -0.610738, -1.122028, 1, 0.7098039, 0, 1,
-1.254789, 0.835071, -0.5278583, 1, 0.7137255, 0, 1,
-1.25381, -0.08915941, -0.6746994, 1, 0.7215686, 0, 1,
-1.249955, 0.7915298, -1.892749, 1, 0.7254902, 0, 1,
-1.24572, 0.2848382, -0.8898315, 1, 0.7333333, 0, 1,
-1.245397, 0.5904827, -0.9157972, 1, 0.7372549, 0, 1,
-1.243446, -1.026111, -5.382961, 1, 0.7450981, 0, 1,
-1.2357, 0.5204991, -3.097399, 1, 0.7490196, 0, 1,
-1.224248, 0.4298449, 1.179759, 1, 0.7568628, 0, 1,
-1.222995, -0.4212794, -2.06279, 1, 0.7607843, 0, 1,
-1.222243, 1.04038, -1.19339, 1, 0.7686275, 0, 1,
-1.217454, 1.535328, -1.781365, 1, 0.772549, 0, 1,
-1.210216, -0.2513161, -1.835771, 1, 0.7803922, 0, 1,
-1.208842, -0.8864552, -3.94409, 1, 0.7843137, 0, 1,
-1.207518, -0.4633325, -2.67591, 1, 0.7921569, 0, 1,
-1.207299, 1.600847, -1.49358, 1, 0.7960784, 0, 1,
-1.206018, -1.094979, -4.278101, 1, 0.8039216, 0, 1,
-1.19772, -1.383164, -0.7815217, 1, 0.8117647, 0, 1,
-1.18721, -0.6025616, -1.889555, 1, 0.8156863, 0, 1,
-1.184734, -0.1866019, -0.2382479, 1, 0.8235294, 0, 1,
-1.179991, 0.1921464, -1.076772, 1, 0.827451, 0, 1,
-1.174491, 1.014334, -0.4025399, 1, 0.8352941, 0, 1,
-1.172366, 0.04203229, -1.482164, 1, 0.8392157, 0, 1,
-1.17114, 0.7223461, -1.022663, 1, 0.8470588, 0, 1,
-1.16794, -0.4726743, -0.5001999, 1, 0.8509804, 0, 1,
-1.167785, -1.412573, -3.469679, 1, 0.8588235, 0, 1,
-1.165231, 0.08125585, -0.677846, 1, 0.8627451, 0, 1,
-1.163511, 0.6752194, -2.239912, 1, 0.8705882, 0, 1,
-1.163061, -0.2406856, -0.9830551, 1, 0.8745098, 0, 1,
-1.161094, -0.4604899, -3.324074, 1, 0.8823529, 0, 1,
-1.159474, 0.8444314, 0.06146304, 1, 0.8862745, 0, 1,
-1.119979, -0.5939037, -2.693009, 1, 0.8941177, 0, 1,
-1.119325, 0.8851182, -1.49947, 1, 0.8980392, 0, 1,
-1.118553, -0.2588896, -1.144934, 1, 0.9058824, 0, 1,
-1.114815, -0.4280125, -2.428685, 1, 0.9137255, 0, 1,
-1.112911, 0.2788183, -0.3059664, 1, 0.9176471, 0, 1,
-1.108255, -1.724218, -2.211177, 1, 0.9254902, 0, 1,
-1.096054, -0.4592443, -0.9604847, 1, 0.9294118, 0, 1,
-1.086324, 1.877127, -0.5445148, 1, 0.9372549, 0, 1,
-1.068727, 1.360442, -0.4174962, 1, 0.9411765, 0, 1,
-1.045534, 1.46978, 0.2818499, 1, 0.9490196, 0, 1,
-1.04421, -0.08695876, -2.765442, 1, 0.9529412, 0, 1,
-1.031627, -1.143543, -1.566832, 1, 0.9607843, 0, 1,
-1.024224, -0.4121622, -2.098292, 1, 0.9647059, 0, 1,
-1.018874, -1.121876, -2.458277, 1, 0.972549, 0, 1,
-1.012558, -1.850754, -3.964743, 1, 0.9764706, 0, 1,
-1.010761, 0.8120968, -0.3299217, 1, 0.9843137, 0, 1,
-1.010364, -0.7079061, -2.800822, 1, 0.9882353, 0, 1,
-1.01035, -1.169547, -1.638133, 1, 0.9960784, 0, 1,
-0.9969066, -0.2050679, -4.250932, 0.9960784, 1, 0, 1,
-0.9960784, -0.06836059, -2.196638, 0.9921569, 1, 0, 1,
-0.9903435, 0.4203178, -2.314729, 0.9843137, 1, 0, 1,
-0.9808492, 0.9220693, -1.279473, 0.9803922, 1, 0, 1,
-0.9774443, 0.3620828, -0.02127078, 0.972549, 1, 0, 1,
-0.9758182, -0.9422905, -3.127557, 0.9686275, 1, 0, 1,
-0.9698848, 1.50989, -1.614007, 0.9607843, 1, 0, 1,
-0.9652174, 0.7570594, -2.001718, 0.9568627, 1, 0, 1,
-0.9651554, 1.872663, -0.2982947, 0.9490196, 1, 0, 1,
-0.9565495, -0.06480401, -0.05555429, 0.945098, 1, 0, 1,
-0.9550849, -1.402593, -1.913833, 0.9372549, 1, 0, 1,
-0.9471838, 1.42376, 0.7326434, 0.9333333, 1, 0, 1,
-0.94531, 1.353477, -0.2452373, 0.9254902, 1, 0, 1,
-0.9449655, -0.4609817, -1.585237, 0.9215686, 1, 0, 1,
-0.9295248, 1.252694, -1.892371, 0.9137255, 1, 0, 1,
-0.9161636, 3.484021, -0.08276807, 0.9098039, 1, 0, 1,
-0.9106923, -1.045662, -3.092109, 0.9019608, 1, 0, 1,
-0.9081646, -0.909638, -2.73904, 0.8941177, 1, 0, 1,
-0.9055033, 0.8638321, -1.150913, 0.8901961, 1, 0, 1,
-0.904943, 0.08959941, -2.300891, 0.8823529, 1, 0, 1,
-0.9041473, -1.007069, -3.140396, 0.8784314, 1, 0, 1,
-0.9016431, -1.46372, -3.214217, 0.8705882, 1, 0, 1,
-0.8972886, -0.7266268, -1.661714, 0.8666667, 1, 0, 1,
-0.8958859, 0.06679521, 0.2039378, 0.8588235, 1, 0, 1,
-0.8886926, -1.967553, -1.53786, 0.854902, 1, 0, 1,
-0.8886496, -0.7543634, -3.12836, 0.8470588, 1, 0, 1,
-0.8861836, 0.3998134, -1.475919, 0.8431373, 1, 0, 1,
-0.8839372, -1.344742, -1.785227, 0.8352941, 1, 0, 1,
-0.8828962, 0.0466542, -0.8564855, 0.8313726, 1, 0, 1,
-0.878023, 0.8443918, -0.3267799, 0.8235294, 1, 0, 1,
-0.8763183, -0.4184861, -2.851596, 0.8196079, 1, 0, 1,
-0.8653875, 1.549341, -1.710419, 0.8117647, 1, 0, 1,
-0.8651025, -0.2154516, -0.8685061, 0.8078431, 1, 0, 1,
-0.8516562, 0.1867686, -0.6435969, 0.8, 1, 0, 1,
-0.8375891, -1.428705, -3.072863, 0.7921569, 1, 0, 1,
-0.8354687, -1.499113, -2.917082, 0.7882353, 1, 0, 1,
-0.8314992, -0.06411354, -2.00138, 0.7803922, 1, 0, 1,
-0.8292741, -0.6228641, -3.08757, 0.7764706, 1, 0, 1,
-0.8280424, 1.006085, -0.9815737, 0.7686275, 1, 0, 1,
-0.8227604, 2.728067, -0.4168951, 0.7647059, 1, 0, 1,
-0.8143557, 0.7990462, -1.639768, 0.7568628, 1, 0, 1,
-0.8141926, -0.7349085, -2.476238, 0.7529412, 1, 0, 1,
-0.8137839, 0.05594446, -3.333771, 0.7450981, 1, 0, 1,
-0.8131853, -1.754306, -1.840551, 0.7411765, 1, 0, 1,
-0.8129826, 0.7137453, -0.9811313, 0.7333333, 1, 0, 1,
-0.8120059, -1.907838, -2.597446, 0.7294118, 1, 0, 1,
-0.8106162, -1.163293, -2.416375, 0.7215686, 1, 0, 1,
-0.8085558, 0.01775574, -3.174884, 0.7176471, 1, 0, 1,
-0.8066745, 0.7490584, -0.9181673, 0.7098039, 1, 0, 1,
-0.8055769, -0.09592833, -1.355541, 0.7058824, 1, 0, 1,
-0.7929242, -0.2525896, -1.705774, 0.6980392, 1, 0, 1,
-0.7924401, -0.1684813, -1.051946, 0.6901961, 1, 0, 1,
-0.7910011, 1.52096, -1.07535, 0.6862745, 1, 0, 1,
-0.7901958, -0.5422792, -3.586761, 0.6784314, 1, 0, 1,
-0.7898284, 0.4592111, -1.479431, 0.6745098, 1, 0, 1,
-0.7875926, -0.4762535, -2.089427, 0.6666667, 1, 0, 1,
-0.7865525, 1.861289, -1.456377, 0.6627451, 1, 0, 1,
-0.7863063, -0.8818103, -1.442912, 0.654902, 1, 0, 1,
-0.7856471, -0.2610299, -1.855452, 0.6509804, 1, 0, 1,
-0.78555, 0.3389838, -1.183544, 0.6431373, 1, 0, 1,
-0.7818165, 0.5511515, -1.997465, 0.6392157, 1, 0, 1,
-0.7813006, -0.04839854, -2.764488, 0.6313726, 1, 0, 1,
-0.7807858, 0.4877406, -1.48035, 0.627451, 1, 0, 1,
-0.7807001, 0.8224118, -1.251875, 0.6196079, 1, 0, 1,
-0.7787164, -2.132301, -3.88158, 0.6156863, 1, 0, 1,
-0.776917, 0.3927233, 0.1801731, 0.6078432, 1, 0, 1,
-0.7720702, -0.04306151, -2.33602, 0.6039216, 1, 0, 1,
-0.7580753, -0.4976737, -1.263951, 0.5960785, 1, 0, 1,
-0.7528797, -1.417672, -2.433575, 0.5882353, 1, 0, 1,
-0.7482541, -0.1646735, -1.955537, 0.5843138, 1, 0, 1,
-0.7434929, 1.067465, 0.7489424, 0.5764706, 1, 0, 1,
-0.7430063, 2.029326, -0.2254634, 0.572549, 1, 0, 1,
-0.7415691, 1.194963, 0.6141469, 0.5647059, 1, 0, 1,
-0.7352744, 1.242846, -0.5162951, 0.5607843, 1, 0, 1,
-0.7348304, 0.8740132, -0.315541, 0.5529412, 1, 0, 1,
-0.7318131, -0.741009, -2.678735, 0.5490196, 1, 0, 1,
-0.7273865, -0.5393495, -1.266232, 0.5411765, 1, 0, 1,
-0.7229669, 1.538559, -0.5744358, 0.5372549, 1, 0, 1,
-0.7198212, -1.015051, -3.630085, 0.5294118, 1, 0, 1,
-0.7148803, -0.27442, -0.03659398, 0.5254902, 1, 0, 1,
-0.7146698, 1.647706, -0.2446055, 0.5176471, 1, 0, 1,
-0.7125192, -0.6280719, -1.919806, 0.5137255, 1, 0, 1,
-0.7108276, 0.9569904, -0.1225618, 0.5058824, 1, 0, 1,
-0.7069973, 0.908165, 0.5243761, 0.5019608, 1, 0, 1,
-0.7039158, -0.4704655, -0.6641236, 0.4941176, 1, 0, 1,
-0.7020972, -0.3072117, -2.676993, 0.4862745, 1, 0, 1,
-0.7015268, -2.417203, -2.254494, 0.4823529, 1, 0, 1,
-0.7000435, 0.5385979, 0.5267119, 0.4745098, 1, 0, 1,
-0.694198, 0.8828405, -0.3629719, 0.4705882, 1, 0, 1,
-0.6909011, -1.284876, -1.792533, 0.4627451, 1, 0, 1,
-0.690064, 0.1609853, -2.858187, 0.4588235, 1, 0, 1,
-0.6889036, -0.453921, -0.8735631, 0.4509804, 1, 0, 1,
-0.6868677, 2.299742, 0.6399912, 0.4470588, 1, 0, 1,
-0.6852685, 0.06620414, -3.138934, 0.4392157, 1, 0, 1,
-0.6738989, 0.2581996, -0.3506283, 0.4352941, 1, 0, 1,
-0.6735853, 0.1276379, -1.093838, 0.427451, 1, 0, 1,
-0.6728035, -0.478857, -1.835779, 0.4235294, 1, 0, 1,
-0.6716074, -0.2310419, -1.221446, 0.4156863, 1, 0, 1,
-0.6697387, -2.376219, -0.688233, 0.4117647, 1, 0, 1,
-0.6682776, 0.8568066, 0.169873, 0.4039216, 1, 0, 1,
-0.6626476, -0.8036973, -2.319532, 0.3960784, 1, 0, 1,
-0.6588122, 0.5493698, 0.7124776, 0.3921569, 1, 0, 1,
-0.657468, -0.4558202, -2.389393, 0.3843137, 1, 0, 1,
-0.6558353, 1.606377, 1.458477, 0.3803922, 1, 0, 1,
-0.6433839, 0.06635321, -3.430815, 0.372549, 1, 0, 1,
-0.6411552, -1.675952, -2.594759, 0.3686275, 1, 0, 1,
-0.6337959, -0.02883719, -2.68461, 0.3607843, 1, 0, 1,
-0.631394, -0.6067808, -2.921998, 0.3568628, 1, 0, 1,
-0.6250171, -1.647198, -1.841725, 0.3490196, 1, 0, 1,
-0.6237338, 0.7607825, -0.4183759, 0.345098, 1, 0, 1,
-0.6218321, -0.8897319, -2.793287, 0.3372549, 1, 0, 1,
-0.6193798, -0.5075692, -3.567039, 0.3333333, 1, 0, 1,
-0.6140832, 1.495465, -0.9473308, 0.3254902, 1, 0, 1,
-0.6109982, -1.080824, -2.110808, 0.3215686, 1, 0, 1,
-0.6060236, 0.430505, -0.6431922, 0.3137255, 1, 0, 1,
-0.6034905, 0.04045036, -0.62384, 0.3098039, 1, 0, 1,
-0.6021408, 0.8078058, 0.3611917, 0.3019608, 1, 0, 1,
-0.599775, -0.007763691, -1.202908, 0.2941177, 1, 0, 1,
-0.5979132, -0.5664953, -3.630352, 0.2901961, 1, 0, 1,
-0.5975362, -1.861584, -3.871188, 0.282353, 1, 0, 1,
-0.5884663, 0.1214195, -0.4990404, 0.2784314, 1, 0, 1,
-0.5880505, -0.269124, -3.596721, 0.2705882, 1, 0, 1,
-0.5854076, 0.7294437, 0.0355186, 0.2666667, 1, 0, 1,
-0.5844698, 0.3634992, -0.4578975, 0.2588235, 1, 0, 1,
-0.5782043, 1.988261, 0.719082, 0.254902, 1, 0, 1,
-0.5762562, -0.4840493, -1.363762, 0.2470588, 1, 0, 1,
-0.57504, -1.115618, -2.886755, 0.2431373, 1, 0, 1,
-0.5699493, 0.03114431, -0.830648, 0.2352941, 1, 0, 1,
-0.5689129, -0.9660514, -2.444837, 0.2313726, 1, 0, 1,
-0.5681526, 1.140965, 0.6602742, 0.2235294, 1, 0, 1,
-0.5664272, 1.4249, -2.243092, 0.2196078, 1, 0, 1,
-0.5637833, 0.9386825, 0.9466636, 0.2117647, 1, 0, 1,
-0.5616446, -0.4073329, -1.688988, 0.2078431, 1, 0, 1,
-0.558443, 0.02936875, -0.5045003, 0.2, 1, 0, 1,
-0.5561888, 1.049048, -1.734899, 0.1921569, 1, 0, 1,
-0.5555064, -0.1243292, -2.858128, 0.1882353, 1, 0, 1,
-0.5546988, -1.240344, -3.362582, 0.1803922, 1, 0, 1,
-0.5532242, -1.209457, -3.29996, 0.1764706, 1, 0, 1,
-0.553162, 0.2493745, -1.363849, 0.1686275, 1, 0, 1,
-0.5519837, 0.7598648, -0.7026673, 0.1647059, 1, 0, 1,
-0.5492691, -1.643265, -2.28581, 0.1568628, 1, 0, 1,
-0.5490875, 2.071869, -0.3496775, 0.1529412, 1, 0, 1,
-0.543841, 1.115773, -0.767499, 0.145098, 1, 0, 1,
-0.5410885, 0.2757594, -1.818677, 0.1411765, 1, 0, 1,
-0.5301505, 0.2165606, -0.9665541, 0.1333333, 1, 0, 1,
-0.5300637, -1.03894, -3.560667, 0.1294118, 1, 0, 1,
-0.5221072, 0.772588, 1.263105, 0.1215686, 1, 0, 1,
-0.5220355, 1.668102, 1.98545, 0.1176471, 1, 0, 1,
-0.5202317, -2.31471, -2.038245, 0.1098039, 1, 0, 1,
-0.5182368, -0.8240929, -2.634517, 0.1058824, 1, 0, 1,
-0.5164915, -0.1073053, -2.502867, 0.09803922, 1, 0, 1,
-0.5157555, 1.394251, -1.745947, 0.09019608, 1, 0, 1,
-0.5124856, 0.08610724, -0.602906, 0.08627451, 1, 0, 1,
-0.5105979, 0.2709871, -0.3543531, 0.07843138, 1, 0, 1,
-0.5090054, -0.3369048, -0.9148678, 0.07450981, 1, 0, 1,
-0.5085828, -0.8447042, -2.215494, 0.06666667, 1, 0, 1,
-0.5080135, 0.3848239, -1.872055, 0.0627451, 1, 0, 1,
-0.5022468, -0.5344611, -2.919252, 0.05490196, 1, 0, 1,
-0.5021673, -0.3790596, -2.627198, 0.05098039, 1, 0, 1,
-0.4974337, 0.6271032, -0.1282459, 0.04313726, 1, 0, 1,
-0.4973426, -1.456845, -3.183527, 0.03921569, 1, 0, 1,
-0.4973044, -1.684597, -3.008535, 0.03137255, 1, 0, 1,
-0.4966088, -0.4382659, -0.8314312, 0.02745098, 1, 0, 1,
-0.4948922, 0.123624, -2.726925, 0.01960784, 1, 0, 1,
-0.4911912, -0.2213704, -1.481966, 0.01568628, 1, 0, 1,
-0.4907221, -0.4406657, -3.196489, 0.007843138, 1, 0, 1,
-0.4905411, -1.005653, -2.602449, 0.003921569, 1, 0, 1,
-0.4902555, -0.192483, -2.006001, 0, 1, 0.003921569, 1,
-0.4877774, -0.3114038, -3.62853, 0, 1, 0.01176471, 1,
-0.4808778, 0.4019067, 0.006709575, 0, 1, 0.01568628, 1,
-0.4716039, 1.443497, -0.5601378, 0, 1, 0.02352941, 1,
-0.4682035, 0.584982, -0.5886161, 0, 1, 0.02745098, 1,
-0.4664682, 0.9192871, -1.319871, 0, 1, 0.03529412, 1,
-0.4647129, -0.3770691, -3.227946, 0, 1, 0.03921569, 1,
-0.4627517, 0.8520268, 1.720252, 0, 1, 0.04705882, 1,
-0.4623352, 0.7549167, 1.046631, 0, 1, 0.05098039, 1,
-0.4538387, -0.2523328, -2.94787, 0, 1, 0.05882353, 1,
-0.4486791, -0.2198356, -3.751122, 0, 1, 0.0627451, 1,
-0.4484836, 0.1847834, -3.115655, 0, 1, 0.07058824, 1,
-0.4467352, 0.3059554, -1.67965, 0, 1, 0.07450981, 1,
-0.446199, -0.7316493, 0.4557502, 0, 1, 0.08235294, 1,
-0.4461441, 0.3546341, -0.73849, 0, 1, 0.08627451, 1,
-0.4440062, 0.2367064, -2.178959, 0, 1, 0.09411765, 1,
-0.4335374, -0.03951535, -2.82003, 0, 1, 0.1019608, 1,
-0.432225, -1.42518, -4.032826, 0, 1, 0.1058824, 1,
-0.4261459, 0.2951935, -0.8608006, 0, 1, 0.1137255, 1,
-0.420452, 0.4931271, 0.6828107, 0, 1, 0.1176471, 1,
-0.420363, -0.7378728, -3.818854, 0, 1, 0.1254902, 1,
-0.41907, -1.781969, -2.780477, 0, 1, 0.1294118, 1,
-0.410601, -0.03493188, 0.288404, 0, 1, 0.1372549, 1,
-0.4046243, 0.4578604, -0.9270741, 0, 1, 0.1411765, 1,
-0.4022838, -0.3590496, -1.959053, 0, 1, 0.1490196, 1,
-0.3988157, 0.5011309, -1.131839, 0, 1, 0.1529412, 1,
-0.3933125, -0.6357979, -1.388536, 0, 1, 0.1607843, 1,
-0.3927931, 1.144909, 0.08570801, 0, 1, 0.1647059, 1,
-0.3922153, 0.2280439, -1.794591, 0, 1, 0.172549, 1,
-0.3896924, 0.3491687, -1.775715, 0, 1, 0.1764706, 1,
-0.3892085, 0.7024646, -1.9683, 0, 1, 0.1843137, 1,
-0.3788588, -0.4069166, -3.416797, 0, 1, 0.1882353, 1,
-0.3781616, -0.951482, -2.917963, 0, 1, 0.1960784, 1,
-0.3777606, -0.06479444, -2.540453, 0, 1, 0.2039216, 1,
-0.3711173, 0.4727903, -2.937404, 0, 1, 0.2078431, 1,
-0.3693721, 0.318628, -0.3496738, 0, 1, 0.2156863, 1,
-0.3646143, -2.52155, -3.243869, 0, 1, 0.2196078, 1,
-0.3641632, -0.7258477, -3.795023, 0, 1, 0.227451, 1,
-0.3599137, -2.102736, -4.670866, 0, 1, 0.2313726, 1,
-0.3593442, -0.2034836, -2.709293, 0, 1, 0.2392157, 1,
-0.3581423, -1.177203, -2.473619, 0, 1, 0.2431373, 1,
-0.3575709, -0.04028422, 0.2842602, 0, 1, 0.2509804, 1,
-0.3572887, -0.2387384, -3.080853, 0, 1, 0.254902, 1,
-0.3535938, 0.5620817, -0.09970316, 0, 1, 0.2627451, 1,
-0.3524315, -0.3655369, -2.818319, 0, 1, 0.2666667, 1,
-0.342222, 1.223231, -0.9817137, 0, 1, 0.2745098, 1,
-0.3393576, -0.6077314, -3.802942, 0, 1, 0.2784314, 1,
-0.3367245, -0.01989935, -2.277122, 0, 1, 0.2862745, 1,
-0.3361638, -1.229236, -3.120539, 0, 1, 0.2901961, 1,
-0.3323676, 0.9778238, -1.157328, 0, 1, 0.2980392, 1,
-0.3305515, 1.678966, -1.396492, 0, 1, 0.3058824, 1,
-0.3304128, 0.9140501, 0.1059707, 0, 1, 0.3098039, 1,
-0.3299642, 1.410692, -0.8650873, 0, 1, 0.3176471, 1,
-0.3285141, 0.1537798, -1.239236, 0, 1, 0.3215686, 1,
-0.3251576, -0.3681512, -2.074372, 0, 1, 0.3294118, 1,
-0.3242671, -0.4058286, -0.9048473, 0, 1, 0.3333333, 1,
-0.3196306, 0.01740706, -1.228843, 0, 1, 0.3411765, 1,
-0.3185346, -1.389626, -2.886165, 0, 1, 0.345098, 1,
-0.3110843, -1.341777, -3.64138, 0, 1, 0.3529412, 1,
-0.3101228, 0.012347, -1.265362, 0, 1, 0.3568628, 1,
-0.309436, -0.2140106, -0.8625081, 0, 1, 0.3647059, 1,
-0.3086803, 0.667306, 0.3400353, 0, 1, 0.3686275, 1,
-0.3079726, -0.01984108, -1.896434, 0, 1, 0.3764706, 1,
-0.3071529, 0.8725994, -0.06102942, 0, 1, 0.3803922, 1,
-0.3018817, -0.9371835, -2.927637, 0, 1, 0.3882353, 1,
-0.2998827, 0.8692301, 0.8585823, 0, 1, 0.3921569, 1,
-0.2994464, -1.236302, -0.9164771, 0, 1, 0.4, 1,
-0.2980961, 0.8456532, -1.557192, 0, 1, 0.4078431, 1,
-0.2948363, -0.4850412, -3.087901, 0, 1, 0.4117647, 1,
-0.2910562, -0.9555677, -4.100582, 0, 1, 0.4196078, 1,
-0.2857204, 0.8891701, 0.07445886, 0, 1, 0.4235294, 1,
-0.2790522, 0.154738, -2.361714, 0, 1, 0.4313726, 1,
-0.2775353, -0.7127713, -2.44383, 0, 1, 0.4352941, 1,
-0.2729877, -0.4201733, -1.505478, 0, 1, 0.4431373, 1,
-0.2721497, -0.6398624, -3.720712, 0, 1, 0.4470588, 1,
-0.2705047, 1.285368, 0.149372, 0, 1, 0.454902, 1,
-0.2692048, -0.1639396, -3.329485, 0, 1, 0.4588235, 1,
-0.2691432, 2.242654, 0.07322334, 0, 1, 0.4666667, 1,
-0.2658654, 0.3691641, 0.3894129, 0, 1, 0.4705882, 1,
-0.2637144, -0.7737483, -2.534507, 0, 1, 0.4784314, 1,
-0.2617112, 1.134469, -1.5234, 0, 1, 0.4823529, 1,
-0.2589357, 1.648682, 0.3562768, 0, 1, 0.4901961, 1,
-0.2523285, 0.6525463, -0.9952682, 0, 1, 0.4941176, 1,
-0.250582, -0.2937366, -1.692644, 0, 1, 0.5019608, 1,
-0.2404252, -0.362487, -2.989857, 0, 1, 0.509804, 1,
-0.2401813, 1.78447, -0.05364502, 0, 1, 0.5137255, 1,
-0.234235, 0.8938316, 0.2068971, 0, 1, 0.5215687, 1,
-0.2330716, 0.4603949, -1.381607, 0, 1, 0.5254902, 1,
-0.232081, 1.24098, 0.301662, 0, 1, 0.5333334, 1,
-0.2264167, -1.108186, -3.236897, 0, 1, 0.5372549, 1,
-0.2237551, -0.8733354, -4.887491, 0, 1, 0.5450981, 1,
-0.2220467, -0.8777586, -3.845435, 0, 1, 0.5490196, 1,
-0.2157541, 1.228291, -0.7836515, 0, 1, 0.5568628, 1,
-0.215097, -0.0367583, -1.881169, 0, 1, 0.5607843, 1,
-0.2140687, 0.1841082, -1.647091, 0, 1, 0.5686275, 1,
-0.2098813, -0.7930678, -4.997067, 0, 1, 0.572549, 1,
-0.2091737, -1.200477, -2.862916, 0, 1, 0.5803922, 1,
-0.2063948, 0.2590142, 0.1803398, 0, 1, 0.5843138, 1,
-0.2057285, -0.9938473, -3.740777, 0, 1, 0.5921569, 1,
-0.2055772, 0.8873753, -1.154194, 0, 1, 0.5960785, 1,
-0.2041674, -0.182173, -1.770564, 0, 1, 0.6039216, 1,
-0.2029071, 0.588775, -2.032573, 0, 1, 0.6117647, 1,
-0.201782, -0.2523244, -0.5240428, 0, 1, 0.6156863, 1,
-0.1995222, 2.440526, 1.674301, 0, 1, 0.6235294, 1,
-0.1936834, 0.1534763, -0.469242, 0, 1, 0.627451, 1,
-0.1921663, -0.2191372, -4.051344, 0, 1, 0.6352941, 1,
-0.1903117, -1.316415, -3.105693, 0, 1, 0.6392157, 1,
-0.1888543, -0.9896173, -3.748183, 0, 1, 0.6470588, 1,
-0.1885302, -0.354581, -2.708416, 0, 1, 0.6509804, 1,
-0.1873167, 1.130648, -1.39258, 0, 1, 0.6588235, 1,
-0.1866755, -1.080314, -2.787535, 0, 1, 0.6627451, 1,
-0.185893, -1.987486, -1.081377, 0, 1, 0.6705883, 1,
-0.1834658, -0.3921795, -2.693354, 0, 1, 0.6745098, 1,
-0.1813399, -0.4357309, -4.536197, 0, 1, 0.682353, 1,
-0.1793237, 0.538733, -0.224157, 0, 1, 0.6862745, 1,
-0.1769129, 1.623601, -0.4888097, 0, 1, 0.6941177, 1,
-0.1764382, -0.1031317, -1.630202, 0, 1, 0.7019608, 1,
-0.1761876, -0.3471271, -3.169596, 0, 1, 0.7058824, 1,
-0.1727516, -0.4713694, -1.959049, 0, 1, 0.7137255, 1,
-0.1717704, 1.823331, -0.2932933, 0, 1, 0.7176471, 1,
-0.1716882, 0.06134551, -1.602526, 0, 1, 0.7254902, 1,
-0.1703864, 0.4987689, -1.934745, 0, 1, 0.7294118, 1,
-0.1673291, 0.3850773, 0.466305, 0, 1, 0.7372549, 1,
-0.1651979, 0.1402262, -0.6559674, 0, 1, 0.7411765, 1,
-0.1648607, 0.5215621, -1.946837, 0, 1, 0.7490196, 1,
-0.1613927, -0.02303677, -3.35787, 0, 1, 0.7529412, 1,
-0.1607037, -1.039041, -3.682751, 0, 1, 0.7607843, 1,
-0.1595011, -1.067722, -1.504347, 0, 1, 0.7647059, 1,
-0.1571576, -0.8330604, -2.341776, 0, 1, 0.772549, 1,
-0.1504667, 0.6418569, 0.490597, 0, 1, 0.7764706, 1,
-0.148482, 1.94445, -0.1229833, 0, 1, 0.7843137, 1,
-0.1435164, 1.578924, -0.1661785, 0, 1, 0.7882353, 1,
-0.141825, -1.412823, -3.292243, 0, 1, 0.7960784, 1,
-0.1401906, -0.1003032, -3.556621, 0, 1, 0.8039216, 1,
-0.139861, 0.8765991, -1.496523, 0, 1, 0.8078431, 1,
-0.1240854, -1.065881, -2.177224, 0, 1, 0.8156863, 1,
-0.1232286, -1.574976, -5.223699, 0, 1, 0.8196079, 1,
-0.119734, 1.924629, -0.9674966, 0, 1, 0.827451, 1,
-0.1177882, -1.4183, -3.237899, 0, 1, 0.8313726, 1,
-0.1103772, -0.02660857, -2.366084, 0, 1, 0.8392157, 1,
-0.1081691, 1.303084, 0.1755652, 0, 1, 0.8431373, 1,
-0.1070474, -0.2531394, -3.314527, 0, 1, 0.8509804, 1,
-0.1052699, -0.630401, -2.548063, 0, 1, 0.854902, 1,
-0.1010555, 1.668491, 0.05566065, 0, 1, 0.8627451, 1,
-0.100841, -1.599816, -3.838677, 0, 1, 0.8666667, 1,
-0.1000348, -0.9597777, -3.821029, 0, 1, 0.8745098, 1,
-0.09725647, -0.03356495, -0.1999912, 0, 1, 0.8784314, 1,
-0.09655149, -0.2111019, -2.008343, 0, 1, 0.8862745, 1,
-0.09255099, 0.05809427, -0.7716366, 0, 1, 0.8901961, 1,
-0.08878037, 1.357817, -0.6425286, 0, 1, 0.8980392, 1,
-0.08681633, -0.4620253, -2.860122, 0, 1, 0.9058824, 1,
-0.08396475, 1.153758, -0.4942269, 0, 1, 0.9098039, 1,
-0.08087323, -2.269914, -4.009447, 0, 1, 0.9176471, 1,
-0.0802796, -0.8261221, -1.51657, 0, 1, 0.9215686, 1,
-0.0785833, 2.206566, 0.7810693, 0, 1, 0.9294118, 1,
-0.07641066, -0.3884279, -4.239504, 0, 1, 0.9333333, 1,
-0.07570143, -0.005432491, -0.3727318, 0, 1, 0.9411765, 1,
-0.07490683, -0.9489501, -4.142334, 0, 1, 0.945098, 1,
-0.07078591, 0.7390126, -0.9172746, 0, 1, 0.9529412, 1,
-0.07039585, 0.09052716, -0.9935434, 0, 1, 0.9568627, 1,
-0.06938906, 0.1081361, 0.3607573, 0, 1, 0.9647059, 1,
-0.06790365, -0.9263928, -3.353709, 0, 1, 0.9686275, 1,
-0.06694219, 0.9322379, -1.108225, 0, 1, 0.9764706, 1,
-0.06574838, 0.3076516, -0.1314351, 0, 1, 0.9803922, 1,
-0.06468692, -0.8199635, -3.297842, 0, 1, 0.9882353, 1,
-0.06142285, 1.033531, 0.1978529, 0, 1, 0.9921569, 1,
-0.06113506, -0.06496704, -2.130047, 0, 1, 1, 1,
-0.05891783, 0.6770559, -0.8326871, 0, 0.9921569, 1, 1,
-0.05438242, 0.1300446, 0.745461, 0, 0.9882353, 1, 1,
-0.05102206, 0.3721833, -1.849328, 0, 0.9803922, 1, 1,
-0.04971888, 1.185593, -1.452585, 0, 0.9764706, 1, 1,
-0.04764719, -1.080518, -2.756989, 0, 0.9686275, 1, 1,
-0.04734853, 0.4018373, -0.8860762, 0, 0.9647059, 1, 1,
-0.04372142, 1.157483, -0.7482165, 0, 0.9568627, 1, 1,
-0.04365441, -0.6583292, -2.642915, 0, 0.9529412, 1, 1,
-0.04280573, 1.35863, 0.7856712, 0, 0.945098, 1, 1,
-0.04193467, 3.645793, -0.5764238, 0, 0.9411765, 1, 1,
-0.03752802, -0.8401548, -3.363401, 0, 0.9333333, 1, 1,
-0.03705377, -0.07617897, -4.137331, 0, 0.9294118, 1, 1,
-0.03576103, -0.4734651, -3.102112, 0, 0.9215686, 1, 1,
-0.03132669, 0.2886733, 1.087971, 0, 0.9176471, 1, 1,
-0.03104934, 0.2933447, 1.026501, 0, 0.9098039, 1, 1,
-0.02602217, 0.3915295, 0.6290229, 0, 0.9058824, 1, 1,
-0.02243536, -0.635106, -2.655138, 0, 0.8980392, 1, 1,
-0.01676667, 2.026928, -1.757281, 0, 0.8901961, 1, 1,
-0.01454902, 0.5133486, 1.635583, 0, 0.8862745, 1, 1,
-0.01390646, 1.883998, 1.344502, 0, 0.8784314, 1, 1,
-0.01289699, 0.5760015, 0.71992, 0, 0.8745098, 1, 1,
-0.009593991, 1.696199, 0.6822464, 0, 0.8666667, 1, 1,
-0.004844761, 0.2854183, -1.19793, 0, 0.8627451, 1, 1,
-0.003950699, -0.8664085, -3.470838, 0, 0.854902, 1, 1,
-0.003873576, 1.193566, -0.3737356, 0, 0.8509804, 1, 1,
-0.002603825, 0.7529852, -0.4297775, 0, 0.8431373, 1, 1,
0.0001043742, 0.5991027, -1.802455, 0, 0.8392157, 1, 1,
0.0007792379, -0.1943574, 1.517096, 0, 0.8313726, 1, 1,
0.003335257, 1.495375, -0.8840581, 0, 0.827451, 1, 1,
0.009419307, -0.4275451, 3.208693, 0, 0.8196079, 1, 1,
0.009457615, -0.6513874, 3.890485, 0, 0.8156863, 1, 1,
0.01020877, -0.4929385, 3.143476, 0, 0.8078431, 1, 1,
0.01309188, 0.6115151, 0.1770192, 0, 0.8039216, 1, 1,
0.01693778, -0.2831186, 2.347869, 0, 0.7960784, 1, 1,
0.02363095, -0.03688531, 1.526075, 0, 0.7882353, 1, 1,
0.02390527, 0.5969811, 1.575263, 0, 0.7843137, 1, 1,
0.03256389, 0.8828049, 0.2058766, 0, 0.7764706, 1, 1,
0.03385868, 0.4366394, 0.6799209, 0, 0.772549, 1, 1,
0.03711196, 2.411345, -0.06905355, 0, 0.7647059, 1, 1,
0.03902683, 0.5457957, 2.578719, 0, 0.7607843, 1, 1,
0.0403881, -0.7688543, 4.509948, 0, 0.7529412, 1, 1,
0.04081422, 0.05135239, 1.873819, 0, 0.7490196, 1, 1,
0.04229315, 0.3122027, 1.559199, 0, 0.7411765, 1, 1,
0.04365962, 0.3255733, -0.6575508, 0, 0.7372549, 1, 1,
0.04517673, -0.4297581, 2.518806, 0, 0.7294118, 1, 1,
0.04718607, -1.863596, 5.189902, 0, 0.7254902, 1, 1,
0.05450459, 0.8881378, 0.4025262, 0, 0.7176471, 1, 1,
0.05881069, 2.11486, 0.2230511, 0, 0.7137255, 1, 1,
0.06334721, 0.03422183, -0.5247123, 0, 0.7058824, 1, 1,
0.06798806, 1.665449, 1.086822, 0, 0.6980392, 1, 1,
0.06982432, -1.813289, 3.210235, 0, 0.6941177, 1, 1,
0.07323788, 0.06478635, 2.15924, 0, 0.6862745, 1, 1,
0.07533087, 1.064044, 0.02523775, 0, 0.682353, 1, 1,
0.07620624, 0.4863302, 0.1106616, 0, 0.6745098, 1, 1,
0.08132045, -0.9125445, 3.181055, 0, 0.6705883, 1, 1,
0.08136424, -0.5673802, 1.08116, 0, 0.6627451, 1, 1,
0.0838503, -0.6187786, 2.002186, 0, 0.6588235, 1, 1,
0.08907256, 1.462436, 0.272816, 0, 0.6509804, 1, 1,
0.09328165, 0.5989508, 1.734179, 0, 0.6470588, 1, 1,
0.09504577, 0.209398, 0.4110241, 0, 0.6392157, 1, 1,
0.1040837, 0.6965448, -1.240699, 0, 0.6352941, 1, 1,
0.1061103, -0.5421127, 2.579521, 0, 0.627451, 1, 1,
0.1068821, -1.076662, 2.534874, 0, 0.6235294, 1, 1,
0.1083913, -0.1911064, 2.577887, 0, 0.6156863, 1, 1,
0.1106112, -1.152412, 3.303763, 0, 0.6117647, 1, 1,
0.1130376, 0.1117671, 0.2517855, 0, 0.6039216, 1, 1,
0.1184965, -2.209224, 3.486275, 0, 0.5960785, 1, 1,
0.1189747, 0.4893251, 3.141545, 0, 0.5921569, 1, 1,
0.1201742, -1.782992, 4.46868, 0, 0.5843138, 1, 1,
0.1202962, -0.5852466, 3.326959, 0, 0.5803922, 1, 1,
0.1209477, 0.4692823, -1.427316, 0, 0.572549, 1, 1,
0.1222366, 1.061915, -0.1491319, 0, 0.5686275, 1, 1,
0.1288512, 0.09344669, 2.65237, 0, 0.5607843, 1, 1,
0.1298682, -0.2888263, 3.335832, 0, 0.5568628, 1, 1,
0.1317177, -0.09224101, 2.881855, 0, 0.5490196, 1, 1,
0.1355798, 0.2090166, -0.2176837, 0, 0.5450981, 1, 1,
0.141199, -0.3667624, 4.035428, 0, 0.5372549, 1, 1,
0.1426411, 0.4248238, 0.5460201, 0, 0.5333334, 1, 1,
0.1451691, 1.057524, 0.2610355, 0, 0.5254902, 1, 1,
0.1465545, 1.185714, 0.07733745, 0, 0.5215687, 1, 1,
0.1473424, 0.7888899, -0.4548406, 0, 0.5137255, 1, 1,
0.1505662, -0.8693246, 3.53959, 0, 0.509804, 1, 1,
0.155475, 0.2564818, -0.6253005, 0, 0.5019608, 1, 1,
0.1562167, -1.171687, 2.250761, 0, 0.4941176, 1, 1,
0.1574541, 1.781561, 0.6015942, 0, 0.4901961, 1, 1,
0.1574574, 1.041015, -0.2340864, 0, 0.4823529, 1, 1,
0.1588313, 0.4132714, 1.806332, 0, 0.4784314, 1, 1,
0.1639379, -1.055541, 1.861217, 0, 0.4705882, 1, 1,
0.1684685, 0.6323792, -0.983045, 0, 0.4666667, 1, 1,
0.1694503, -1.651213, 1.741896, 0, 0.4588235, 1, 1,
0.1730019, -0.1418176, 1.594711, 0, 0.454902, 1, 1,
0.1745744, -0.6340929, 3.807926, 0, 0.4470588, 1, 1,
0.1748405, -0.4495572, 4.73041, 0, 0.4431373, 1, 1,
0.1749989, 2.70014, -0.8849454, 0, 0.4352941, 1, 1,
0.1794623, -0.09308621, 2.065459, 0, 0.4313726, 1, 1,
0.1863373, -0.2266145, 0.1977277, 0, 0.4235294, 1, 1,
0.1863441, -0.1173811, 3.220708, 0, 0.4196078, 1, 1,
0.1890742, -0.3463452, 2.206754, 0, 0.4117647, 1, 1,
0.1930255, -0.9799619, 1.650901, 0, 0.4078431, 1, 1,
0.1954286, 0.3014264, 1.361738, 0, 0.4, 1, 1,
0.1962187, 0.2341335, 0.438228, 0, 0.3921569, 1, 1,
0.2009644, 0.03218323, 2.157942, 0, 0.3882353, 1, 1,
0.2012642, -0.1230377, 2.622694, 0, 0.3803922, 1, 1,
0.2034472, 0.310083, 0.882068, 0, 0.3764706, 1, 1,
0.2054366, -0.04082607, 2.505281, 0, 0.3686275, 1, 1,
0.207828, -1.083182, 5.542403, 0, 0.3647059, 1, 1,
0.2156235, -2.206834, 2.465427, 0, 0.3568628, 1, 1,
0.218011, 1.050461, 1.086883, 0, 0.3529412, 1, 1,
0.218719, 0.1652316, 2.423704, 0, 0.345098, 1, 1,
0.2199564, -1.085422, 2.289582, 0, 0.3411765, 1, 1,
0.2373717, 0.9066169, -0.3150333, 0, 0.3333333, 1, 1,
0.2426761, 0.9219127, -0.001952137, 0, 0.3294118, 1, 1,
0.2460065, 0.1904129, -1.461359, 0, 0.3215686, 1, 1,
0.2468718, -0.1711542, 1.610679, 0, 0.3176471, 1, 1,
0.261386, -1.364727, 2.952467, 0, 0.3098039, 1, 1,
0.2673005, -0.1189769, 2.510107, 0, 0.3058824, 1, 1,
0.2679179, 1.167533, -0.327704, 0, 0.2980392, 1, 1,
0.270447, 0.08782276, 1.590928, 0, 0.2901961, 1, 1,
0.2717505, 1.099319, -1.159506, 0, 0.2862745, 1, 1,
0.2729699, 1.678199, 0.06261739, 0, 0.2784314, 1, 1,
0.2749487, 0.6568933, 0.3943636, 0, 0.2745098, 1, 1,
0.2753069, 0.05280989, 2.575081, 0, 0.2666667, 1, 1,
0.2754577, -1.672532, 3.228468, 0, 0.2627451, 1, 1,
0.2759489, -1.449272, 0.8526316, 0, 0.254902, 1, 1,
0.2767134, -0.08287068, 0.5735698, 0, 0.2509804, 1, 1,
0.2803973, 0.1962884, -0.2528536, 0, 0.2431373, 1, 1,
0.2813647, -0.06534921, 1.823807, 0, 0.2392157, 1, 1,
0.2821459, -1.25792, 2.80536, 0, 0.2313726, 1, 1,
0.2832037, 0.3193707, 0.4721925, 0, 0.227451, 1, 1,
0.2868213, -0.1581277, 2.694822, 0, 0.2196078, 1, 1,
0.2890373, 0.7781062, 0.2121495, 0, 0.2156863, 1, 1,
0.2903906, 0.9853297, 1.957193, 0, 0.2078431, 1, 1,
0.2912161, 0.7353137, -0.7345545, 0, 0.2039216, 1, 1,
0.2927477, 2.446613, 0.7605292, 0, 0.1960784, 1, 1,
0.293648, -0.4679865, 2.858768, 0, 0.1882353, 1, 1,
0.2942502, -1.420397, 1.610138, 0, 0.1843137, 1, 1,
0.2942515, 1.692202, 0.2662194, 0, 0.1764706, 1, 1,
0.3029143, 0.5404682, 0.4507714, 0, 0.172549, 1, 1,
0.3036045, -0.05407402, 0.4247726, 0, 0.1647059, 1, 1,
0.304688, -1.104502, 3.499569, 0, 0.1607843, 1, 1,
0.3088049, -1.227732, 2.84973, 0, 0.1529412, 1, 1,
0.309678, 0.7133092, -1.401976, 0, 0.1490196, 1, 1,
0.3124162, 0.6672393, 1.084132, 0, 0.1411765, 1, 1,
0.3125085, 0.5501238, 0.1583731, 0, 0.1372549, 1, 1,
0.3173785, 0.503911, 0.5858935, 0, 0.1294118, 1, 1,
0.3219088, 0.1571586, 1.956614, 0, 0.1254902, 1, 1,
0.3236056, -0.7640471, 3.218369, 0, 0.1176471, 1, 1,
0.3237063, 0.4657039, -1.607427, 0, 0.1137255, 1, 1,
0.3261437, 0.8429542, -1.350147, 0, 0.1058824, 1, 1,
0.3297452, -0.6435071, 0.2605768, 0, 0.09803922, 1, 1,
0.3302511, -1.359029, -0.2456206, 0, 0.09411765, 1, 1,
0.3332468, -0.04219012, 0.958638, 0, 0.08627451, 1, 1,
0.3372335, 0.8971493, 3.105969, 0, 0.08235294, 1, 1,
0.3420645, -1.129307, 2.730904, 0, 0.07450981, 1, 1,
0.3447299, -0.3568542, 2.204155, 0, 0.07058824, 1, 1,
0.3448235, -0.1422493, 0.9562394, 0, 0.0627451, 1, 1,
0.3453732, 0.2791917, -0.4248683, 0, 0.05882353, 1, 1,
0.3462874, 0.505555, 0.817969, 0, 0.05098039, 1, 1,
0.3493286, 1.455627, -0.4681023, 0, 0.04705882, 1, 1,
0.3526177, -1.327616, 1.386038, 0, 0.03921569, 1, 1,
0.3538603, 0.6537144, 0.01075409, 0, 0.03529412, 1, 1,
0.3557573, 0.4550882, -0.3418044, 0, 0.02745098, 1, 1,
0.3574575, 1.519892, 1.789421, 0, 0.02352941, 1, 1,
0.3628533, 0.5293581, 0.08250582, 0, 0.01568628, 1, 1,
0.3669101, 1.642073, -0.8018358, 0, 0.01176471, 1, 1,
0.3715957, 1.299835, 2.020051, 0, 0.003921569, 1, 1,
0.3753178, 0.7148291, 2.537442, 0.003921569, 0, 1, 1,
0.3772581, 0.4334425, -0.4683183, 0.007843138, 0, 1, 1,
0.3781369, -0.8741749, 1.152861, 0.01568628, 0, 1, 1,
0.3781643, 1.033605, 1.893674, 0.01960784, 0, 1, 1,
0.3840304, 1.579873, -0.8067312, 0.02745098, 0, 1, 1,
0.3883751, -0.5881174, 3.773623, 0.03137255, 0, 1, 1,
0.3933576, 2.049485, -1.285517, 0.03921569, 0, 1, 1,
0.3938408, 0.459023, -0.8941978, 0.04313726, 0, 1, 1,
0.4013348, -0.4965832, 2.049074, 0.05098039, 0, 1, 1,
0.4127724, -0.4763156, 0.8457435, 0.05490196, 0, 1, 1,
0.4201382, 0.001971823, 1.017149, 0.0627451, 0, 1, 1,
0.4210989, 0.9981552, -0.8524486, 0.06666667, 0, 1, 1,
0.4216722, 1.291035, 0.9115586, 0.07450981, 0, 1, 1,
0.4310568, 1.495979, 0.9531962, 0.07843138, 0, 1, 1,
0.444061, -0.1211473, 1.607279, 0.08627451, 0, 1, 1,
0.4458334, -1.293181, 0.8017728, 0.09019608, 0, 1, 1,
0.4465893, -0.09836262, -0.1856, 0.09803922, 0, 1, 1,
0.4519646, 0.4447723, 1.986266, 0.1058824, 0, 1, 1,
0.4612389, -0.8414798, 3.047765, 0.1098039, 0, 1, 1,
0.4682271, -1.948628, 3.359325, 0.1176471, 0, 1, 1,
0.4716454, 0.7176485, 0.2605217, 0.1215686, 0, 1, 1,
0.4753228, -0.3572765, 1.902678, 0.1294118, 0, 1, 1,
0.4753473, -0.6732368, 2.438008, 0.1333333, 0, 1, 1,
0.4791141, 1.282835, -0.3751347, 0.1411765, 0, 1, 1,
0.47914, -1.002862, 3.38333, 0.145098, 0, 1, 1,
0.4854802, 0.1207982, 1.62889, 0.1529412, 0, 1, 1,
0.486078, 1.263232, -0.8032211, 0.1568628, 0, 1, 1,
0.4894543, 0.562929, 1.280298, 0.1647059, 0, 1, 1,
0.4909658, -0.006645186, -0.6475027, 0.1686275, 0, 1, 1,
0.4916493, 1.154185, 0.2733299, 0.1764706, 0, 1, 1,
0.5024223, -0.01717997, 1.801116, 0.1803922, 0, 1, 1,
0.5030978, 0.4076235, 1.573186, 0.1882353, 0, 1, 1,
0.5055613, 0.5690305, 0.954792, 0.1921569, 0, 1, 1,
0.5091048, -0.07283716, 2.782739, 0.2, 0, 1, 1,
0.5098393, 1.076173, -0.006841597, 0.2078431, 0, 1, 1,
0.5111545, 0.09836614, 1.635196, 0.2117647, 0, 1, 1,
0.5116393, 0.5759873, -0.8344367, 0.2196078, 0, 1, 1,
0.5135884, -0.01124325, 2.261609, 0.2235294, 0, 1, 1,
0.5155197, 2.101781, 0.464629, 0.2313726, 0, 1, 1,
0.5174651, -0.8876261, 0.4930659, 0.2352941, 0, 1, 1,
0.5182171, -0.4810822, 2.374841, 0.2431373, 0, 1, 1,
0.5216395, 1.248637, -0.1019211, 0.2470588, 0, 1, 1,
0.52772, 1.641413, 0.7682148, 0.254902, 0, 1, 1,
0.5332339, 0.650816, 0.1412814, 0.2588235, 0, 1, 1,
0.5352971, -0.1206517, 1.413782, 0.2666667, 0, 1, 1,
0.5365185, -0.1146038, 2.971921, 0.2705882, 0, 1, 1,
0.5426188, -0.772666, 1.962604, 0.2784314, 0, 1, 1,
0.5466014, 0.4154122, 0.443832, 0.282353, 0, 1, 1,
0.5478632, -0.8092538, 3.674073, 0.2901961, 0, 1, 1,
0.5498322, 0.4322545, 1.448571, 0.2941177, 0, 1, 1,
0.5504769, 0.641326, 0.4716554, 0.3019608, 0, 1, 1,
0.5638689, 1.440132, -0.4382212, 0.3098039, 0, 1, 1,
0.567838, -1.253728, 2.849717, 0.3137255, 0, 1, 1,
0.5771613, 0.7981759, 1.605702, 0.3215686, 0, 1, 1,
0.5777334, 0.7486612, 0.5670857, 0.3254902, 0, 1, 1,
0.5798174, 0.1628484, 1.444427, 0.3333333, 0, 1, 1,
0.5868818, -1.283745, 1.877978, 0.3372549, 0, 1, 1,
0.5871247, -2.476651, 3.304669, 0.345098, 0, 1, 1,
0.5920625, 1.464572, -0.2150194, 0.3490196, 0, 1, 1,
0.5948443, 0.2966419, -0.4560162, 0.3568628, 0, 1, 1,
0.5976778, 0.7297435, 0.6805945, 0.3607843, 0, 1, 1,
0.6037651, 1.035942, -0.05489304, 0.3686275, 0, 1, 1,
0.6060653, 0.2151446, 1.786085, 0.372549, 0, 1, 1,
0.6072299, 0.4419701, 0.8136497, 0.3803922, 0, 1, 1,
0.60798, 0.8427674, 0.08385466, 0.3843137, 0, 1, 1,
0.613196, 1.315471, 0.4130831, 0.3921569, 0, 1, 1,
0.6156415, -0.2655768, 1.124617, 0.3960784, 0, 1, 1,
0.6167675, -0.2749164, 1.086749, 0.4039216, 0, 1, 1,
0.6193947, -0.9448091, 2.372646, 0.4117647, 0, 1, 1,
0.622074, -0.9119951, 2.003412, 0.4156863, 0, 1, 1,
0.6258001, -0.1694947, 1.030559, 0.4235294, 0, 1, 1,
0.6320607, -0.5231494, 2.699546, 0.427451, 0, 1, 1,
0.6324992, -0.00648208, 2.077806, 0.4352941, 0, 1, 1,
0.634126, -1.672298, 2.916492, 0.4392157, 0, 1, 1,
0.6352866, -0.0528598, 2.133484, 0.4470588, 0, 1, 1,
0.6363505, -0.5274875, 1.32105, 0.4509804, 0, 1, 1,
0.6428494, -1.746728, 3.977029, 0.4588235, 0, 1, 1,
0.6449507, 0.7950441, 1.425594, 0.4627451, 0, 1, 1,
0.6451789, 0.1317621, 1.417445, 0.4705882, 0, 1, 1,
0.6461767, 0.5706583, 0.007783443, 0.4745098, 0, 1, 1,
0.6475452, -1.011429, 2.583035, 0.4823529, 0, 1, 1,
0.650826, 0.5019214, 1.163494, 0.4862745, 0, 1, 1,
0.6554434, -0.3395724, 2.906866, 0.4941176, 0, 1, 1,
0.6555432, 0.7583368, 1.900214, 0.5019608, 0, 1, 1,
0.6567973, 0.248553, 0.7417197, 0.5058824, 0, 1, 1,
0.6663242, -1.4585, 1.675147, 0.5137255, 0, 1, 1,
0.6677369, -1.994362, 2.472433, 0.5176471, 0, 1, 1,
0.6700993, 2.087835, 0.6241744, 0.5254902, 0, 1, 1,
0.6712256, 0.1526088, 2.952541, 0.5294118, 0, 1, 1,
0.673282, 1.640718, -0.7966718, 0.5372549, 0, 1, 1,
0.6739095, 0.2005515, 1.137948, 0.5411765, 0, 1, 1,
0.6775814, 0.5848342, -0.02666833, 0.5490196, 0, 1, 1,
0.6783201, 0.6697848, 1.635319, 0.5529412, 0, 1, 1,
0.6791648, -1.340346, 1.954871, 0.5607843, 0, 1, 1,
0.6804529, -0.3726801, 2.52445, 0.5647059, 0, 1, 1,
0.6905897, 0.2200518, 0.9861596, 0.572549, 0, 1, 1,
0.6915329, 0.6877536, 1.177189, 0.5764706, 0, 1, 1,
0.694958, -0.3333044, 2.285818, 0.5843138, 0, 1, 1,
0.7004798, 0.2481369, 2.019623, 0.5882353, 0, 1, 1,
0.7060285, 1.149937, 1.989217, 0.5960785, 0, 1, 1,
0.7061065, 0.1940548, 0.6229162, 0.6039216, 0, 1, 1,
0.7081152, -1.304479, 1.553646, 0.6078432, 0, 1, 1,
0.7095973, 0.8701456, 1.327509, 0.6156863, 0, 1, 1,
0.7109974, 0.8779481, 0.3197909, 0.6196079, 0, 1, 1,
0.7141647, 0.3843261, 2.295121, 0.627451, 0, 1, 1,
0.7174862, -0.05162615, 2.452235, 0.6313726, 0, 1, 1,
0.7200017, -0.8018484, 1.934029, 0.6392157, 0, 1, 1,
0.720293, 1.550761, -0.2125985, 0.6431373, 0, 1, 1,
0.724243, -1.272756, 2.484257, 0.6509804, 0, 1, 1,
0.7266838, -1.630786, 3.001899, 0.654902, 0, 1, 1,
0.7296202, -0.1656729, 3.337797, 0.6627451, 0, 1, 1,
0.7364332, -0.532977, 2.079181, 0.6666667, 0, 1, 1,
0.7393758, 0.438133, 1.377196, 0.6745098, 0, 1, 1,
0.7422602, 0.640108, 0.4972193, 0.6784314, 0, 1, 1,
0.7466258, -1.638778, 3.193426, 0.6862745, 0, 1, 1,
0.7519043, 0.6171661, -0.0379034, 0.6901961, 0, 1, 1,
0.7532203, -0.4075373, 2.154674, 0.6980392, 0, 1, 1,
0.7588615, -2.144665, 3.557952, 0.7058824, 0, 1, 1,
0.7612574, 0.5797707, 1.328549, 0.7098039, 0, 1, 1,
0.7643669, -0.1493579, 2.235783, 0.7176471, 0, 1, 1,
0.7763837, -0.5603236, 1.152028, 0.7215686, 0, 1, 1,
0.7776617, -0.9793367, 4.324691, 0.7294118, 0, 1, 1,
0.7790762, 0.2531991, 1.653059, 0.7333333, 0, 1, 1,
0.7855237, -0.4279491, 4.113645, 0.7411765, 0, 1, 1,
0.7940658, -1.220861, 2.452587, 0.7450981, 0, 1, 1,
0.7964212, 1.049412, 0.6774275, 0.7529412, 0, 1, 1,
0.8011716, -0.4739103, 1.98625, 0.7568628, 0, 1, 1,
0.8110607, -0.1111279, 2.986493, 0.7647059, 0, 1, 1,
0.8164195, -1.560873, 2.638401, 0.7686275, 0, 1, 1,
0.8167766, 1.059217, 1.130856, 0.7764706, 0, 1, 1,
0.8185064, 1.139398, 0.9751098, 0.7803922, 0, 1, 1,
0.8194714, 1.022304, 1.275371, 0.7882353, 0, 1, 1,
0.8250145, 1.335882, 0.5299246, 0.7921569, 0, 1, 1,
0.8257467, 1.127328, -0.8208951, 0.8, 0, 1, 1,
0.8270335, 1.515297, -0.2226931, 0.8078431, 0, 1, 1,
0.830946, 0.07929391, 3.064654, 0.8117647, 0, 1, 1,
0.8324327, -0.9811342, 2.372623, 0.8196079, 0, 1, 1,
0.8344305, -0.9752328, 2.092413, 0.8235294, 0, 1, 1,
0.836154, -1.361108, 2.19795, 0.8313726, 0, 1, 1,
0.8389592, -1.351481, 2.578543, 0.8352941, 0, 1, 1,
0.839984, -0.5168121, 1.681345, 0.8431373, 0, 1, 1,
0.841189, 0.7271519, 0.9217349, 0.8470588, 0, 1, 1,
0.8419417, -0.1306815, 2.129004, 0.854902, 0, 1, 1,
0.8459849, -0.7405637, 1.379132, 0.8588235, 0, 1, 1,
0.85305, 0.892585, 1.362682, 0.8666667, 0, 1, 1,
0.8605936, -0.8826059, 2.959539, 0.8705882, 0, 1, 1,
0.8619175, 1.112533, -1.136467, 0.8784314, 0, 1, 1,
0.8804978, 0.4715694, 1.02714, 0.8823529, 0, 1, 1,
0.8928288, 0.09442145, 0.3853239, 0.8901961, 0, 1, 1,
0.8965694, 0.6558903, 0.03324299, 0.8941177, 0, 1, 1,
0.8966905, -0.04719825, 1.090013, 0.9019608, 0, 1, 1,
0.9053744, -0.3374046, 0.9844342, 0.9098039, 0, 1, 1,
0.905921, -0.7115539, 1.827806, 0.9137255, 0, 1, 1,
0.9068109, -0.7769335, 2.615298, 0.9215686, 0, 1, 1,
0.9114291, 0.2934665, 0.4728769, 0.9254902, 0, 1, 1,
0.9164077, -0.4276893, 2.22229, 0.9333333, 0, 1, 1,
0.9261712, 0.2753347, 2.011029, 0.9372549, 0, 1, 1,
0.934714, -0.4502744, 1.960745, 0.945098, 0, 1, 1,
0.93571, -0.2825257, 2.366359, 0.9490196, 0, 1, 1,
0.93813, -0.2715347, 0.7444659, 0.9568627, 0, 1, 1,
0.9416924, 1.284013, 0.6977089, 0.9607843, 0, 1, 1,
0.9434387, 0.07789458, 1.933942, 0.9686275, 0, 1, 1,
0.9453404, 0.7986395, -0.04850455, 0.972549, 0, 1, 1,
0.9455031, -0.9087017, 2.029004, 0.9803922, 0, 1, 1,
0.9471949, 0.8441519, 0.3922156, 0.9843137, 0, 1, 1,
0.9480796, -1.11474, 0.5669045, 0.9921569, 0, 1, 1,
0.9546875, -1.568385, 2.104799, 0.9960784, 0, 1, 1,
0.9575475, 1.485232, -0.6402105, 1, 0, 0.9960784, 1,
0.9578483, 0.6192763, 3.820263, 1, 0, 0.9882353, 1,
0.9594495, -0.6003466, 2.648926, 1, 0, 0.9843137, 1,
0.9596276, -0.9285533, 1.711819, 1, 0, 0.9764706, 1,
0.9629974, 2.196085, 0.8872004, 1, 0, 0.972549, 1,
0.9675224, -0.7633148, 1.424574, 1, 0, 0.9647059, 1,
0.9742848, 0.7753786, -1.590918, 1, 0, 0.9607843, 1,
0.9793271, 1.649909, -1.370338, 1, 0, 0.9529412, 1,
0.9812317, -2.284382, 2.431856, 1, 0, 0.9490196, 1,
0.9818097, 1.149614, 0.6799949, 1, 0, 0.9411765, 1,
0.9896432, 1.183758, 0.596009, 1, 0, 0.9372549, 1,
0.9901722, -0.0237043, 1.711843, 1, 0, 0.9294118, 1,
0.9938712, 0.2399415, 2.13194, 1, 0, 0.9254902, 1,
0.9970614, -0.9440412, 4.252157, 1, 0, 0.9176471, 1,
0.998934, 0.8009539, -0.5031863, 1, 0, 0.9137255, 1,
1.004561, -0.7053279, 3.605842, 1, 0, 0.9058824, 1,
1.004706, 1.035585, 1.021275, 1, 0, 0.9019608, 1,
1.016101, 0.3316441, 1.22425, 1, 0, 0.8941177, 1,
1.016998, 1.82856, 1.700925, 1, 0, 0.8862745, 1,
1.030653, 1.092019, 1.669698, 1, 0, 0.8823529, 1,
1.036589, -1.053089, 2.358174, 1, 0, 0.8745098, 1,
1.038785, 0.5779142, 0.930673, 1, 0, 0.8705882, 1,
1.043797, -0.8184119, 1.975456, 1, 0, 0.8627451, 1,
1.051495, 0.6044153, 0.888624, 1, 0, 0.8588235, 1,
1.059626, -1.067067, 0.8971267, 1, 0, 0.8509804, 1,
1.067365, -1.349987, 1.054831, 1, 0, 0.8470588, 1,
1.067581, -0.5657063, 1.862186, 1, 0, 0.8392157, 1,
1.06989, -0.06416775, 1.203876, 1, 0, 0.8352941, 1,
1.075995, 0.5387509, 0.9009059, 1, 0, 0.827451, 1,
1.080568, 0.400627, 0.9825156, 1, 0, 0.8235294, 1,
1.082462, -0.5326208, 0.9259135, 1, 0, 0.8156863, 1,
1.082778, -0.6284274, 1.683127, 1, 0, 0.8117647, 1,
1.084082, 0.8492166, 0.5346444, 1, 0, 0.8039216, 1,
1.086297, 0.965019, 0.5793637, 1, 0, 0.7960784, 1,
1.096469, 0.169346, 0.9125852, 1, 0, 0.7921569, 1,
1.098181, -1.375134, 3.070496, 1, 0, 0.7843137, 1,
1.101795, 1.142357, 0.2747895, 1, 0, 0.7803922, 1,
1.103235, 0.3469479, 0.4149219, 1, 0, 0.772549, 1,
1.103829, -2.036368, 1.461289, 1, 0, 0.7686275, 1,
1.104478, 0.8945882, 1.713457, 1, 0, 0.7607843, 1,
1.10534, -0.002695292, 2.549147, 1, 0, 0.7568628, 1,
1.105495, 1.701803, 1.067124, 1, 0, 0.7490196, 1,
1.106447, 0.89594, 0.4906267, 1, 0, 0.7450981, 1,
1.114553, 0.48094, 0.8374964, 1, 0, 0.7372549, 1,
1.117749, 0.7061567, 0.7534032, 1, 0, 0.7333333, 1,
1.120341, -1.750852, 3.208589, 1, 0, 0.7254902, 1,
1.122522, 0.267265, 2.092313, 1, 0, 0.7215686, 1,
1.124156, 0.3886221, 0.001585115, 1, 0, 0.7137255, 1,
1.124367, 0.5943682, 2.107445, 1, 0, 0.7098039, 1,
1.125659, 0.7299795, 2.835941, 1, 0, 0.7019608, 1,
1.130601, -0.2463634, 1.202088, 1, 0, 0.6941177, 1,
1.136139, 1.197502, 0.2395906, 1, 0, 0.6901961, 1,
1.137287, 0.004334799, 2.103703, 1, 0, 0.682353, 1,
1.14736, -0.8201132, 2.004433, 1, 0, 0.6784314, 1,
1.155743, 0.1820913, 2.717648, 1, 0, 0.6705883, 1,
1.156331, -1.189066, 2.127866, 1, 0, 0.6666667, 1,
1.157168, -1.182693, 1.459566, 1, 0, 0.6588235, 1,
1.15947, 0.4865828, 1.254688, 1, 0, 0.654902, 1,
1.161618, -0.06982987, 2.676516, 1, 0, 0.6470588, 1,
1.163112, -0.5310901, 1.02806, 1, 0, 0.6431373, 1,
1.173456, 0.507838, 0.4850458, 1, 0, 0.6352941, 1,
1.176767, -0.302562, 2.348036, 1, 0, 0.6313726, 1,
1.182293, 0.5009572, 0.325224, 1, 0, 0.6235294, 1,
1.18742, 0.6353809, 1.821814, 1, 0, 0.6196079, 1,
1.201515, 0.9039, 1.557152, 1, 0, 0.6117647, 1,
1.20199, -0.4064049, 1.497508, 1, 0, 0.6078432, 1,
1.210042, 1.351058, -0.9274284, 1, 0, 0.6, 1,
1.216145, -1.248148, 3.552929, 1, 0, 0.5921569, 1,
1.217728, 1.416759, 0.0901387, 1, 0, 0.5882353, 1,
1.222916, 0.2791769, 2.319001, 1, 0, 0.5803922, 1,
1.229069, -0.1214322, 0.5462058, 1, 0, 0.5764706, 1,
1.233281, 1.215323, -0.3401961, 1, 0, 0.5686275, 1,
1.244178, -0.1330545, 2.213928, 1, 0, 0.5647059, 1,
1.245578, 0.3381163, 0.8274901, 1, 0, 0.5568628, 1,
1.246921, 0.819418, -0.207784, 1, 0, 0.5529412, 1,
1.25731, 0.3627696, 0.641905, 1, 0, 0.5450981, 1,
1.258956, -0.08006797, 3.101383, 1, 0, 0.5411765, 1,
1.259295, -0.6668928, 2.432651, 1, 0, 0.5333334, 1,
1.264242, 0.6671662, 1.774937, 1, 0, 0.5294118, 1,
1.27811, 2.73332, 1.304461, 1, 0, 0.5215687, 1,
1.293021, 1.35, 2.047127, 1, 0, 0.5176471, 1,
1.29495, -0.7292554, 1.692625, 1, 0, 0.509804, 1,
1.299887, 0.7736858, 1.417726, 1, 0, 0.5058824, 1,
1.302543, 0.2358243, 0.7316891, 1, 0, 0.4980392, 1,
1.306878, -0.8157369, 2.699346, 1, 0, 0.4901961, 1,
1.308072, -1.127594, 2.861895, 1, 0, 0.4862745, 1,
1.320605, -0.06540431, -0.6556134, 1, 0, 0.4784314, 1,
1.321323, -0.1683288, 2.372121, 1, 0, 0.4745098, 1,
1.327971, 1.430033, -0.543196, 1, 0, 0.4666667, 1,
1.348875, 0.8054221, 1.565484, 1, 0, 0.4627451, 1,
1.355717, -0.7750093, 3.098205, 1, 0, 0.454902, 1,
1.36077, 0.6154268, 1.930432, 1, 0, 0.4509804, 1,
1.360857, -0.0075178, 0.8055782, 1, 0, 0.4431373, 1,
1.368961, -0.8178366, 0.5008003, 1, 0, 0.4392157, 1,
1.371494, -1.269265, 1.022026, 1, 0, 0.4313726, 1,
1.373964, -1.622969, 2.051652, 1, 0, 0.427451, 1,
1.383965, -0.3951792, 0.2770205, 1, 0, 0.4196078, 1,
1.399972, 2.199223, 0.466369, 1, 0, 0.4156863, 1,
1.41066, 0.4676407, 1.374529, 1, 0, 0.4078431, 1,
1.417618, 0.1101146, 1.598453, 1, 0, 0.4039216, 1,
1.422969, 0.2744872, 1.491965, 1, 0, 0.3960784, 1,
1.431901, -0.5899777, 0.3244085, 1, 0, 0.3882353, 1,
1.43955, 1.675792, 0.5277389, 1, 0, 0.3843137, 1,
1.446273, -1.501516, 1.879929, 1, 0, 0.3764706, 1,
1.463972, -1.552519, 3.936996, 1, 0, 0.372549, 1,
1.467145, 0.01868913, 3.196644, 1, 0, 0.3647059, 1,
1.471706, 0.4626034, 0.5859447, 1, 0, 0.3607843, 1,
1.474756, 0.9422235, -0.9397154, 1, 0, 0.3529412, 1,
1.48427, 0.005042305, 2.148655, 1, 0, 0.3490196, 1,
1.497577, 0.3545368, 1.510944, 1, 0, 0.3411765, 1,
1.525893, 0.8748485, 2.151754, 1, 0, 0.3372549, 1,
1.53819, 1.828543, -1.154425, 1, 0, 0.3294118, 1,
1.555753, -0.790414, 1.767979, 1, 0, 0.3254902, 1,
1.557133, -0.2268284, 1.956456, 1, 0, 0.3176471, 1,
1.559245, -0.0650935, 0.09034812, 1, 0, 0.3137255, 1,
1.580575, -0.229097, 2.005145, 1, 0, 0.3058824, 1,
1.583276, 0.1181516, 2.851285, 1, 0, 0.2980392, 1,
1.586201, -0.4605471, 0.955951, 1, 0, 0.2941177, 1,
1.590518, -0.3525636, 1.807199, 1, 0, 0.2862745, 1,
1.596266, -1.712702, 1.18341, 1, 0, 0.282353, 1,
1.599498, 0.5686888, 0.8975902, 1, 0, 0.2745098, 1,
1.608304, 0.9627748, 1.492583, 1, 0, 0.2705882, 1,
1.609134, 0.9273301, 2.587209, 1, 0, 0.2627451, 1,
1.631091, -0.7276989, 0.05614506, 1, 0, 0.2588235, 1,
1.635975, 0.700862, 0.1951673, 1, 0, 0.2509804, 1,
1.650168, 0.635755, 2.190309, 1, 0, 0.2470588, 1,
1.656045, 0.7635511, 1.577838, 1, 0, 0.2392157, 1,
1.658482, 0.05004662, 1.230954, 1, 0, 0.2352941, 1,
1.662905, -0.6659384, 0.4852434, 1, 0, 0.227451, 1,
1.67714, -0.5036319, 1.63555, 1, 0, 0.2235294, 1,
1.69792, -1.316656, 0.6844264, 1, 0, 0.2156863, 1,
1.698717, 1.46068, -0.1004377, 1, 0, 0.2117647, 1,
1.722565, 0.08110621, 1.456182, 1, 0, 0.2039216, 1,
1.725837, -0.7678827, 1.860953, 1, 0, 0.1960784, 1,
1.729059, -0.126065, 0.8649693, 1, 0, 0.1921569, 1,
1.742962, -0.3259574, 2.795513, 1, 0, 0.1843137, 1,
1.758325, -0.4742705, 3.271708, 1, 0, 0.1803922, 1,
1.779316, 0.6184434, 0.9852583, 1, 0, 0.172549, 1,
1.783553, -0.8974387, 2.26782, 1, 0, 0.1686275, 1,
1.803764, -1.402436, 2.373112, 1, 0, 0.1607843, 1,
1.842558, -0.5539023, 2.029673, 1, 0, 0.1568628, 1,
1.860973, 0.4872431, 1.644273, 1, 0, 0.1490196, 1,
1.898026, -2.159667, 1.421706, 1, 0, 0.145098, 1,
1.900579, -2.124913, 3.892492, 1, 0, 0.1372549, 1,
1.912923, -0.1143272, 3.665562, 1, 0, 0.1333333, 1,
1.933978, 0.7516357, 1.06962, 1, 0, 0.1254902, 1,
1.991633, 1.146779, 1.311354, 1, 0, 0.1215686, 1,
2.003272, -0.2652763, 4.190078, 1, 0, 0.1137255, 1,
2.014946, -1.162366, 1.629527, 1, 0, 0.1098039, 1,
2.034043, -1.142068, 3.131382, 1, 0, 0.1019608, 1,
2.040108, -0.7127537, 2.916698, 1, 0, 0.09411765, 1,
2.059598, 1.083256, 2.256318, 1, 0, 0.09019608, 1,
2.117323, 0.3781331, 0.32465, 1, 0, 0.08235294, 1,
2.147119, -0.0320531, 1.196799, 1, 0, 0.07843138, 1,
2.159873, -1.456768, -0.4696514, 1, 0, 0.07058824, 1,
2.171266, -1.316857, 1.303682, 1, 0, 0.06666667, 1,
2.177023, 2.691823, 2.587407, 1, 0, 0.05882353, 1,
2.178463, 0.1130696, 0.5154669, 1, 0, 0.05490196, 1,
2.215615, -0.3921989, 0.7409007, 1, 0, 0.04705882, 1,
2.271116, -1.035988, 3.379596, 1, 0, 0.04313726, 1,
2.273464, 0.8952521, 1.599273, 1, 0, 0.03529412, 1,
2.365787, -0.5226172, 0.9704759, 1, 0, 0.03137255, 1,
2.399241, 0.9516767, 1.744084, 1, 0, 0.02352941, 1,
2.50973, 1.62949, 0.1156768, 1, 0, 0.01960784, 1,
2.651332, 1.176219, 1.616119, 1, 0, 0.01176471, 1,
2.769086, 1.717029, 0.3042539, 1, 0, 0.007843138, 1
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
-0.3211564, -3.566915, -7.23481, 0, -0.5, 0.5, 0.5,
-0.3211564, -3.566915, -7.23481, 1, -0.5, 0.5, 0.5,
-0.3211564, -3.566915, -7.23481, 1, 1.5, 0.5, 0.5,
-0.3211564, -3.566915, -7.23481, 0, 1.5, 0.5, 0.5
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
-4.458991, 0.5621214, -7.23481, 0, -0.5, 0.5, 0.5,
-4.458991, 0.5621214, -7.23481, 1, -0.5, 0.5, 0.5,
-4.458991, 0.5621214, -7.23481, 1, 1.5, 0.5, 0.5,
-4.458991, 0.5621214, -7.23481, 0, 1.5, 0.5, 0.5
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
-4.458991, -3.566915, 0.07972074, 0, -0.5, 0.5, 0.5,
-4.458991, -3.566915, 0.07972074, 1, -0.5, 0.5, 0.5,
-4.458991, -3.566915, 0.07972074, 1, 1.5, 0.5, 0.5,
-4.458991, -3.566915, 0.07972074, 0, 1.5, 0.5, 0.5
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
-3, -2.61406, -5.546842,
2, -2.61406, -5.546842,
-3, -2.61406, -5.546842,
-3, -2.772869, -5.82817,
-2, -2.61406, -5.546842,
-2, -2.772869, -5.82817,
-1, -2.61406, -5.546842,
-1, -2.772869, -5.82817,
0, -2.61406, -5.546842,
0, -2.772869, -5.82817,
1, -2.61406, -5.546842,
1, -2.772869, -5.82817,
2, -2.61406, -5.546842,
2, -2.772869, -5.82817
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
-3, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
-3, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
-3, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
-3, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5,
-2, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
-2, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
-2, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
-2, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5,
-1, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
-1, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
-1, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
-1, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5,
0, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
0, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
0, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
0, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5,
1, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
1, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
1, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
1, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5,
2, -3.090487, -6.390826, 0, -0.5, 0.5, 0.5,
2, -3.090487, -6.390826, 1, -0.5, 0.5, 0.5,
2, -3.090487, -6.390826, 1, 1.5, 0.5, 0.5,
2, -3.090487, -6.390826, 0, 1.5, 0.5, 0.5
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
-3.504106, -2, -5.546842,
-3.504106, 3, -5.546842,
-3.504106, -2, -5.546842,
-3.663253, -2, -5.82817,
-3.504106, -1, -5.546842,
-3.663253, -1, -5.82817,
-3.504106, 0, -5.546842,
-3.663253, 0, -5.82817,
-3.504106, 1, -5.546842,
-3.663253, 1, -5.82817,
-3.504106, 2, -5.546842,
-3.663253, 2, -5.82817,
-3.504106, 3, -5.546842,
-3.663253, 3, -5.82817
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
-3.981548, -2, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, -2, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, -2, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, -2, -6.390826, 0, 1.5, 0.5, 0.5,
-3.981548, -1, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, -1, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, -1, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, -1, -6.390826, 0, 1.5, 0.5, 0.5,
-3.981548, 0, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, 0, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, 0, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, 0, -6.390826, 0, 1.5, 0.5, 0.5,
-3.981548, 1, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, 1, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, 1, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, 1, -6.390826, 0, 1.5, 0.5, 0.5,
-3.981548, 2, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, 2, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, 2, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, 2, -6.390826, 0, 1.5, 0.5, 0.5,
-3.981548, 3, -6.390826, 0, -0.5, 0.5, 0.5,
-3.981548, 3, -6.390826, 1, -0.5, 0.5, 0.5,
-3.981548, 3, -6.390826, 1, 1.5, 0.5, 0.5,
-3.981548, 3, -6.390826, 0, 1.5, 0.5, 0.5
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
-3.504106, -2.61406, -4,
-3.504106, -2.61406, 4,
-3.504106, -2.61406, -4,
-3.663253, -2.772869, -4,
-3.504106, -2.61406, -2,
-3.663253, -2.772869, -2,
-3.504106, -2.61406, 0,
-3.663253, -2.772869, 0,
-3.504106, -2.61406, 2,
-3.663253, -2.772869, 2,
-3.504106, -2.61406, 4,
-3.663253, -2.772869, 4
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
-3.981548, -3.090487, -4, 0, -0.5, 0.5, 0.5,
-3.981548, -3.090487, -4, 1, -0.5, 0.5, 0.5,
-3.981548, -3.090487, -4, 1, 1.5, 0.5, 0.5,
-3.981548, -3.090487, -4, 0, 1.5, 0.5, 0.5,
-3.981548, -3.090487, -2, 0, -0.5, 0.5, 0.5,
-3.981548, -3.090487, -2, 1, -0.5, 0.5, 0.5,
-3.981548, -3.090487, -2, 1, 1.5, 0.5, 0.5,
-3.981548, -3.090487, -2, 0, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 0, 0, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 0, 1, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 0, 1, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 0, 0, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 2, 0, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 2, 1, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 2, 1, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 2, 0, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 4, 0, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 4, 1, -0.5, 0.5, 0.5,
-3.981548, -3.090487, 4, 1, 1.5, 0.5, 0.5,
-3.981548, -3.090487, 4, 0, 1.5, 0.5, 0.5
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
-3.504106, -2.61406, -5.546842,
-3.504106, 3.738303, -5.546842,
-3.504106, -2.61406, 5.706283,
-3.504106, 3.738303, 5.706283,
-3.504106, -2.61406, -5.546842,
-3.504106, -2.61406, 5.706283,
-3.504106, 3.738303, -5.546842,
-3.504106, 3.738303, 5.706283,
-3.504106, -2.61406, -5.546842,
2.861793, -2.61406, -5.546842,
-3.504106, -2.61406, 5.706283,
2.861793, -2.61406, 5.706283,
-3.504106, 3.738303, -5.546842,
2.861793, 3.738303, -5.546842,
-3.504106, 3.738303, 5.706283,
2.861793, 3.738303, 5.706283,
2.861793, -2.61406, -5.546842,
2.861793, 3.738303, -5.546842,
2.861793, -2.61406, 5.706283,
2.861793, 3.738303, 5.706283,
2.861793, -2.61406, -5.546842,
2.861793, -2.61406, 5.706283,
2.861793, 3.738303, -5.546842,
2.861793, 3.738303, 5.706283
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
var radius = 7.692101;
var distance = 34.22303;
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
mvMatrix.translate( 0.3211564, -0.5621214, -0.07972074 );
mvMatrix.scale( 1.306469, 1.309253, 0.7390703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22303);
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


