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
-3.903103, 1.228336, -0.5586758, 1, 0, 0, 1,
-3.419429, 0.4318763, -2.846359, 1, 0.007843138, 0, 1,
-3.262315, 0.936857, -2.162571, 1, 0.01176471, 0, 1,
-3.20279, 0.8582792, -1.355469, 1, 0.01960784, 0, 1,
-3.180806, -1.050053, -0.9342771, 1, 0.02352941, 0, 1,
-2.985588, -0.1945932, -0.929805, 1, 0.03137255, 0, 1,
-2.960848, 0.2570024, -0.7778476, 1, 0.03529412, 0, 1,
-2.668753, -0.8546798, -0.8677517, 1, 0.04313726, 0, 1,
-2.510569, -0.5330137, 0.08152761, 1, 0.04705882, 0, 1,
-2.489336, 0.2674868, -1.017702, 1, 0.05490196, 0, 1,
-2.474018, 0.2547566, -2.491281, 1, 0.05882353, 0, 1,
-2.471097, 0.547392, -2.470821, 1, 0.06666667, 0, 1,
-2.430455, -0.1690456, -0.01537387, 1, 0.07058824, 0, 1,
-2.428145, 0.01548948, -1.302026, 1, 0.07843138, 0, 1,
-2.421509, -1.116276, -3.023381, 1, 0.08235294, 0, 1,
-2.310916, 1.557687, 0.7075305, 1, 0.09019608, 0, 1,
-2.31013, 0.8964636, -1.227035, 1, 0.09411765, 0, 1,
-2.295373, 0.07612158, -2.944148, 1, 0.1019608, 0, 1,
-2.254369, -0.8819568, -0.9467283, 1, 0.1098039, 0, 1,
-2.24777, 1.189999, -0.7971366, 1, 0.1137255, 0, 1,
-2.238684, -0.02540604, -1.019991, 1, 0.1215686, 0, 1,
-2.233232, 0.7630827, -1.896583, 1, 0.1254902, 0, 1,
-2.160818, 1.551172, -2.074685, 1, 0.1333333, 0, 1,
-2.108962, -2.203898, -1.581656, 1, 0.1372549, 0, 1,
-2.091172, 0.9146725, -2.623294, 1, 0.145098, 0, 1,
-2.087206, -1.526886, -2.313707, 1, 0.1490196, 0, 1,
-2.070569, 0.5922713, -1.091715, 1, 0.1568628, 0, 1,
-2.053793, -0.08978239, -2.010801, 1, 0.1607843, 0, 1,
-2.040519, -0.9100562, -2.710983, 1, 0.1686275, 0, 1,
-2.013178, -0.3883096, -0.6516106, 1, 0.172549, 0, 1,
-2.007105, -0.2511443, -2.25615, 1, 0.1803922, 0, 1,
-2.003133, 0.6143786, 0.909685, 1, 0.1843137, 0, 1,
-2.001511, -0.4705557, -1.560094, 1, 0.1921569, 0, 1,
-1.994322, -0.9521269, -2.404372, 1, 0.1960784, 0, 1,
-1.991811, 0.7640586, -2.045977, 1, 0.2039216, 0, 1,
-1.972434, 0.2995894, -2.419373, 1, 0.2117647, 0, 1,
-1.921305, -0.1765361, -1.543331, 1, 0.2156863, 0, 1,
-1.914564, 0.8385887, -2.794928, 1, 0.2235294, 0, 1,
-1.895683, -1.745109, -0.3654979, 1, 0.227451, 0, 1,
-1.886413, -1.938494, -2.643501, 1, 0.2352941, 0, 1,
-1.8649, 2.469542, 0.3861915, 1, 0.2392157, 0, 1,
-1.854349, 0.763784, -1.520497, 1, 0.2470588, 0, 1,
-1.827259, -0.02701681, -1.192611, 1, 0.2509804, 0, 1,
-1.816151, -1.549906, -0.6468288, 1, 0.2588235, 0, 1,
-1.805226, 0.7728049, -1.271995, 1, 0.2627451, 0, 1,
-1.770146, -0.8231097, -2.370357, 1, 0.2705882, 0, 1,
-1.755651, -0.9059238, -2.17087, 1, 0.2745098, 0, 1,
-1.731173, -0.5315427, -2.850037, 1, 0.282353, 0, 1,
-1.664432, -0.01838424, -1.701012, 1, 0.2862745, 0, 1,
-1.644735, 1.501263, -1.704584, 1, 0.2941177, 0, 1,
-1.638266, -0.4297114, -2.944716, 1, 0.3019608, 0, 1,
-1.634631, 0.1750281, -0.6714545, 1, 0.3058824, 0, 1,
-1.620399, 1.24968, -1.002666, 1, 0.3137255, 0, 1,
-1.615693, 0.08047321, -1.55805, 1, 0.3176471, 0, 1,
-1.61254, 1.27465, -2.226558, 1, 0.3254902, 0, 1,
-1.609998, -1.029247, -2.488795, 1, 0.3294118, 0, 1,
-1.589724, -0.6206886, -2.430066, 1, 0.3372549, 0, 1,
-1.57401, -0.1061743, -2.200214, 1, 0.3411765, 0, 1,
-1.553788, -0.1110469, -2.262652, 1, 0.3490196, 0, 1,
-1.54824, -0.5265015, -2.306151, 1, 0.3529412, 0, 1,
-1.540547, 0.1049686, -1.46171, 1, 0.3607843, 0, 1,
-1.540115, -1.382099, 0.2989318, 1, 0.3647059, 0, 1,
-1.5292, -0.4014986, -0.3253112, 1, 0.372549, 0, 1,
-1.519829, -0.523772, -0.4162633, 1, 0.3764706, 0, 1,
-1.518413, -0.5238818, -1.350249, 1, 0.3843137, 0, 1,
-1.501484, 2.83981, 0.3469181, 1, 0.3882353, 0, 1,
-1.500608, -0.8625695, -2.783284, 1, 0.3960784, 0, 1,
-1.499691, 0.2561796, -1.888273, 1, 0.4039216, 0, 1,
-1.495558, 1.983707, 0.1549133, 1, 0.4078431, 0, 1,
-1.486404, -0.5596458, -1.964624, 1, 0.4156863, 0, 1,
-1.485183, -0.4584286, -2.353702, 1, 0.4196078, 0, 1,
-1.467668, -0.6871709, -3.206824, 1, 0.427451, 0, 1,
-1.459178, 0.05207207, -0.2534901, 1, 0.4313726, 0, 1,
-1.451941, -3.026108, -1.944322, 1, 0.4392157, 0, 1,
-1.44418, -0.9194542, -1.692497, 1, 0.4431373, 0, 1,
-1.44263, -1.157661, -4.280988, 1, 0.4509804, 0, 1,
-1.437363, 2.11788, -0.4995955, 1, 0.454902, 0, 1,
-1.436455, 0.02287776, -2.461141, 1, 0.4627451, 0, 1,
-1.434923, -0.2358493, -2.586344, 1, 0.4666667, 0, 1,
-1.413238, 0.7355569, -0.9375064, 1, 0.4745098, 0, 1,
-1.403277, 0.02916957, -0.9839622, 1, 0.4784314, 0, 1,
-1.387933, -0.1575387, -1.785851, 1, 0.4862745, 0, 1,
-1.380045, -0.1922383, -1.11643, 1, 0.4901961, 0, 1,
-1.379153, -0.02270325, -0.8514633, 1, 0.4980392, 0, 1,
-1.377978, -2.049994, -1.515944, 1, 0.5058824, 0, 1,
-1.374317, -0.7240821, -1.324352, 1, 0.509804, 0, 1,
-1.367815, -0.2814169, -2.671014, 1, 0.5176471, 0, 1,
-1.367676, 0.240922, -1.542302, 1, 0.5215687, 0, 1,
-1.36405, -0.1062666, -1.012723, 1, 0.5294118, 0, 1,
-1.363291, -1.351615, -1.884941, 1, 0.5333334, 0, 1,
-1.358449, 0.9687014, -2.502802, 1, 0.5411765, 0, 1,
-1.357089, 0.7355676, -1.7248, 1, 0.5450981, 0, 1,
-1.347619, -0.5172627, -2.818135, 1, 0.5529412, 0, 1,
-1.344544, -1.087546, -1.873823, 1, 0.5568628, 0, 1,
-1.328556, -0.3888487, -1.944773, 1, 0.5647059, 0, 1,
-1.299058, 0.04122304, -1.591845, 1, 0.5686275, 0, 1,
-1.296696, -0.207156, -0.8681685, 1, 0.5764706, 0, 1,
-1.285257, -1.255049, -3.118642, 1, 0.5803922, 0, 1,
-1.280006, -0.2801704, -3.671231, 1, 0.5882353, 0, 1,
-1.279433, 1.120099, 0.4280293, 1, 0.5921569, 0, 1,
-1.276234, -1.833173, -3.934822, 1, 0.6, 0, 1,
-1.268183, 1.713869, -1.497307, 1, 0.6078432, 0, 1,
-1.268061, 0.8656323, -0.2234467, 1, 0.6117647, 0, 1,
-1.265494, 0.4927128, -3.933152, 1, 0.6196079, 0, 1,
-1.261555, -0.8211049, -2.682473, 1, 0.6235294, 0, 1,
-1.259034, -0.7613499, -1.846414, 1, 0.6313726, 0, 1,
-1.247678, -1.225091, -2.600251, 1, 0.6352941, 0, 1,
-1.244757, -1.300905, -1.340954, 1, 0.6431373, 0, 1,
-1.239263, -0.7248244, -1.599237, 1, 0.6470588, 0, 1,
-1.232637, -0.6653949, -3.143417, 1, 0.654902, 0, 1,
-1.229259, 0.2374083, -1.700626, 1, 0.6588235, 0, 1,
-1.22468, -0.3132377, -3.212009, 1, 0.6666667, 0, 1,
-1.218116, -1.193318, -1.630545, 1, 0.6705883, 0, 1,
-1.213854, 1.380524, -0.7561479, 1, 0.6784314, 0, 1,
-1.213213, -1.538172, -2.800909, 1, 0.682353, 0, 1,
-1.198058, -0.6972656, -1.725692, 1, 0.6901961, 0, 1,
-1.195467, -0.1389137, -2.52196, 1, 0.6941177, 0, 1,
-1.193796, -0.8295482, -0.9192733, 1, 0.7019608, 0, 1,
-1.193307, -1.174734, -3.372123, 1, 0.7098039, 0, 1,
-1.193213, -1.172581, -1.765925, 1, 0.7137255, 0, 1,
-1.16889, 0.5223528, -0.2570667, 1, 0.7215686, 0, 1,
-1.161847, -1.14024, -1.258814, 1, 0.7254902, 0, 1,
-1.161704, -0.3682954, -2.037839, 1, 0.7333333, 0, 1,
-1.158599, -1.092636, -1.14372, 1, 0.7372549, 0, 1,
-1.156809, -2.136691, -2.992663, 1, 0.7450981, 0, 1,
-1.13882, -0.5183698, -3.242227, 1, 0.7490196, 0, 1,
-1.126503, 0.06140987, -1.457627, 1, 0.7568628, 0, 1,
-1.121796, 0.3995748, -1.033699, 1, 0.7607843, 0, 1,
-1.120366, -0.1773992, -2.730993, 1, 0.7686275, 0, 1,
-1.117525, -1.498774, -3.749451, 1, 0.772549, 0, 1,
-1.116602, -0.100632, -2.041399, 1, 0.7803922, 0, 1,
-1.111814, -1.415906, -3.944342, 1, 0.7843137, 0, 1,
-1.110887, -0.5231725, -2.273755, 1, 0.7921569, 0, 1,
-1.107782, 0.9206918, -1.325609, 1, 0.7960784, 0, 1,
-1.096928, 0.7776327, -0.1581504, 1, 0.8039216, 0, 1,
-1.091321, 1.011056, -2.654491, 1, 0.8117647, 0, 1,
-1.089279, -0.7029369, -3.938081, 1, 0.8156863, 0, 1,
-1.088426, 1.10166, -0.04871144, 1, 0.8235294, 0, 1,
-1.079852, -0.8279549, -3.988841, 1, 0.827451, 0, 1,
-1.079308, 1.151714, 0.4226105, 1, 0.8352941, 0, 1,
-1.079157, -0.823657, -2.981511, 1, 0.8392157, 0, 1,
-1.073462, 0.6539493, -2.508933, 1, 0.8470588, 0, 1,
-1.066041, -0.1157961, -3.278328, 1, 0.8509804, 0, 1,
-1.05931, -1.913004, -1.419591, 1, 0.8588235, 0, 1,
-1.059196, -0.3070911, -1.692725, 1, 0.8627451, 0, 1,
-1.053439, -1.462262, -1.526884, 1, 0.8705882, 0, 1,
-1.052467, -0.7970272, -2.819206, 1, 0.8745098, 0, 1,
-1.052203, 0.5005962, -0.5294423, 1, 0.8823529, 0, 1,
-1.0503, -2.172179, -3.42844, 1, 0.8862745, 0, 1,
-1.046396, 1.095382, -0.707342, 1, 0.8941177, 0, 1,
-1.042461, -1.474922, -2.822043, 1, 0.8980392, 0, 1,
-1.031152, 0.4979379, 0.7354094, 1, 0.9058824, 0, 1,
-1.030969, 2.524164, -0.09266141, 1, 0.9137255, 0, 1,
-1.030131, -1.463179, -2.043746, 1, 0.9176471, 0, 1,
-1.023876, 1.052998, 0.7657832, 1, 0.9254902, 0, 1,
-1.019853, 0.1644231, -2.259655, 1, 0.9294118, 0, 1,
-1.012549, -0.3878806, -3.102252, 1, 0.9372549, 0, 1,
-1.012475, -0.7934327, -3.594375, 1, 0.9411765, 0, 1,
-1.011562, -0.3864741, -0.6109114, 1, 0.9490196, 0, 1,
-1.010532, 1.621222, -1.730438, 1, 0.9529412, 0, 1,
-0.9992031, -0.2015293, -1.257382, 1, 0.9607843, 0, 1,
-0.9972582, 1.14133, -1.305038, 1, 0.9647059, 0, 1,
-0.9967182, 0.9295379, -3.252489, 1, 0.972549, 0, 1,
-0.9938327, -0.6782471, -1.093788, 1, 0.9764706, 0, 1,
-0.9885647, 0.09769472, -1.703755, 1, 0.9843137, 0, 1,
-0.9849916, -3.048965, -3.755269, 1, 0.9882353, 0, 1,
-0.982377, 1.183003, -0.2087318, 1, 0.9960784, 0, 1,
-0.9801174, 0.4647404, -1.003282, 0.9960784, 1, 0, 1,
-0.9727933, 1.266068, 0.6129643, 0.9921569, 1, 0, 1,
-0.9401234, -0.02380026, -1.042967, 0.9843137, 1, 0, 1,
-0.9386572, 1.755026, -0.7863483, 0.9803922, 1, 0, 1,
-0.9361063, -0.5248268, -2.990603, 0.972549, 1, 0, 1,
-0.9308437, -0.9452568, -2.657003, 0.9686275, 1, 0, 1,
-0.9292118, 0.5471818, -2.206983, 0.9607843, 1, 0, 1,
-0.9164439, -0.03372911, -0.02765227, 0.9568627, 1, 0, 1,
-0.9104745, -0.3164932, -1.03251, 0.9490196, 1, 0, 1,
-0.9020842, 0.4020559, -1.304299, 0.945098, 1, 0, 1,
-0.8990249, 0.2770641, -1.90036, 0.9372549, 1, 0, 1,
-0.8983234, -0.8221098, -2.589931, 0.9333333, 1, 0, 1,
-0.895577, 0.7910244, -1.843495, 0.9254902, 1, 0, 1,
-0.8925437, 0.8326941, -0.8144808, 0.9215686, 1, 0, 1,
-0.8923386, -0.08918472, -0.3635474, 0.9137255, 1, 0, 1,
-0.8901731, 1.660267, -2.597155, 0.9098039, 1, 0, 1,
-0.8888048, -1.144277, -2.330762, 0.9019608, 1, 0, 1,
-0.8855229, 1.094197, 0.2359305, 0.8941177, 1, 0, 1,
-0.8852923, -1.659925, -2.664596, 0.8901961, 1, 0, 1,
-0.8822411, 0.3287349, -2.382155, 0.8823529, 1, 0, 1,
-0.8796635, 0.7371708, -2.03988, 0.8784314, 1, 0, 1,
-0.8794121, -1.797372, -2.154127, 0.8705882, 1, 0, 1,
-0.8770066, 0.09057911, -1.510233, 0.8666667, 1, 0, 1,
-0.8756818, 1.954637, -0.5431424, 0.8588235, 1, 0, 1,
-0.8744323, -0.4997724, -2.534219, 0.854902, 1, 0, 1,
-0.8732625, -1.758798, -3.241692, 0.8470588, 1, 0, 1,
-0.8728085, 0.5048211, 0.4787443, 0.8431373, 1, 0, 1,
-0.8657073, 0.05485613, 0.5379859, 0.8352941, 1, 0, 1,
-0.864688, 0.7904583, -0.3582657, 0.8313726, 1, 0, 1,
-0.8594192, -1.939307, -2.503838, 0.8235294, 1, 0, 1,
-0.8546695, -0.1201793, -1.37173, 0.8196079, 1, 0, 1,
-0.8441543, -0.3985917, -2.180217, 0.8117647, 1, 0, 1,
-0.8400478, -1.030339, -1.340644, 0.8078431, 1, 0, 1,
-0.837853, -0.1104489, -2.711355, 0.8, 1, 0, 1,
-0.8365511, 0.5594649, -1.136739, 0.7921569, 1, 0, 1,
-0.836509, 1.077676, 0.1596836, 0.7882353, 1, 0, 1,
-0.8316166, -0.822584, -1.7703, 0.7803922, 1, 0, 1,
-0.8307256, 0.3832885, 0.0107859, 0.7764706, 1, 0, 1,
-0.824735, -0.7995939, -1.859962, 0.7686275, 1, 0, 1,
-0.8213862, 0.7763475, -1.596653, 0.7647059, 1, 0, 1,
-0.8192729, 1.842381, 0.9766056, 0.7568628, 1, 0, 1,
-0.8143742, -1.616762, -2.272436, 0.7529412, 1, 0, 1,
-0.8123462, 0.7005571, -1.695264, 0.7450981, 1, 0, 1,
-0.8113236, -0.6130055, -1.57269, 0.7411765, 1, 0, 1,
-0.8070394, -0.5690695, -2.001642, 0.7333333, 1, 0, 1,
-0.802629, -0.796836, -2.567478, 0.7294118, 1, 0, 1,
-0.7963001, 0.438587, 0.3949212, 0.7215686, 1, 0, 1,
-0.7836708, -0.02743862, -2.072819, 0.7176471, 1, 0, 1,
-0.7704402, -2.385023, -4.682005, 0.7098039, 1, 0, 1,
-0.7676052, 0.5363682, 0.528014, 0.7058824, 1, 0, 1,
-0.7664688, 0.583762, -2.208405, 0.6980392, 1, 0, 1,
-0.7646252, 0.270372, -1.423025, 0.6901961, 1, 0, 1,
-0.7588295, -0.374079, -1.094808, 0.6862745, 1, 0, 1,
-0.7472932, -0.3780143, -0.4533426, 0.6784314, 1, 0, 1,
-0.7467316, 0.947886, -0.9855524, 0.6745098, 1, 0, 1,
-0.7454824, 0.4745468, -0.8861979, 0.6666667, 1, 0, 1,
-0.7441738, 1.50319, -0.569486, 0.6627451, 1, 0, 1,
-0.7440293, 0.804929, 0.8793858, 0.654902, 1, 0, 1,
-0.7407669, 2.182116, -2.792269, 0.6509804, 1, 0, 1,
-0.7334962, 0.8986037, 1.176392, 0.6431373, 1, 0, 1,
-0.7232466, 0.02314795, -0.5507688, 0.6392157, 1, 0, 1,
-0.7171785, 0.3692982, 0.1897096, 0.6313726, 1, 0, 1,
-0.7159851, 0.9095154, -0.960978, 0.627451, 1, 0, 1,
-0.7070474, -0.4276924, 0.3822914, 0.6196079, 1, 0, 1,
-0.7069803, -1.894335, -4.350672, 0.6156863, 1, 0, 1,
-0.7053282, 0.2233924, -3.782844, 0.6078432, 1, 0, 1,
-0.7050314, -0.3182049, -2.644694, 0.6039216, 1, 0, 1,
-0.7037008, -0.7840341, -2.938668, 0.5960785, 1, 0, 1,
-0.7004439, 0.3721387, -0.4875251, 0.5882353, 1, 0, 1,
-0.6963274, 1.075822, 0.004800716, 0.5843138, 1, 0, 1,
-0.6959932, 2.969189, -1.228648, 0.5764706, 1, 0, 1,
-0.6951538, -0.9000551, -1.453915, 0.572549, 1, 0, 1,
-0.6917803, 1.29118, 0.005283535, 0.5647059, 1, 0, 1,
-0.6899989, -0.9834781, -1.289351, 0.5607843, 1, 0, 1,
-0.6873435, 0.8787183, 0.3022096, 0.5529412, 1, 0, 1,
-0.686031, -0.1543175, -1.352249, 0.5490196, 1, 0, 1,
-0.6835681, 0.06509256, -1.41514, 0.5411765, 1, 0, 1,
-0.6796266, -0.5805503, -1.987761, 0.5372549, 1, 0, 1,
-0.6786622, -0.03092483, -1.887294, 0.5294118, 1, 0, 1,
-0.6739049, -0.5975322, -1.954083, 0.5254902, 1, 0, 1,
-0.6695354, 0.08041792, -0.6023723, 0.5176471, 1, 0, 1,
-0.6694314, 0.2044195, -1.674714, 0.5137255, 1, 0, 1,
-0.6688343, 0.9225126, -0.1990203, 0.5058824, 1, 0, 1,
-0.6667863, -2.722127, -1.82949, 0.5019608, 1, 0, 1,
-0.6564035, -0.1845404, -2.857909, 0.4941176, 1, 0, 1,
-0.6550775, -0.5427977, -3.603655, 0.4862745, 1, 0, 1,
-0.6532187, -1.214141, -1.153582, 0.4823529, 1, 0, 1,
-0.6476065, 1.391019, 0.2592328, 0.4745098, 1, 0, 1,
-0.6431589, 0.5343307, -1.777789, 0.4705882, 1, 0, 1,
-0.6410232, 1.196665, -0.8556708, 0.4627451, 1, 0, 1,
-0.6397423, 0.8538098, 0.1215975, 0.4588235, 1, 0, 1,
-0.6394356, -0.9567382, -0.7976044, 0.4509804, 1, 0, 1,
-0.6330104, -1.344406, -4.001373, 0.4470588, 1, 0, 1,
-0.6318455, -0.5461815, -1.541291, 0.4392157, 1, 0, 1,
-0.6291043, 0.7307085, -3.347854, 0.4352941, 1, 0, 1,
-0.6276042, 0.7121885, 0.5094885, 0.427451, 1, 0, 1,
-0.6169735, -1.289269, -3.465575, 0.4235294, 1, 0, 1,
-0.61601, 1.160922, 0.9723266, 0.4156863, 1, 0, 1,
-0.6154079, 0.1599744, -0.7491749, 0.4117647, 1, 0, 1,
-0.6058387, 1.008634, 0.4632552, 0.4039216, 1, 0, 1,
-0.6043273, -0.3628322, -3.057845, 0.3960784, 1, 0, 1,
-0.6017318, -0.4057672, -3.015305, 0.3921569, 1, 0, 1,
-0.6003858, 0.9135031, 0.1847415, 0.3843137, 1, 0, 1,
-0.5984921, -1.513921, -2.444424, 0.3803922, 1, 0, 1,
-0.5943254, -0.5302688, -0.9004068, 0.372549, 1, 0, 1,
-0.591491, 0.06393821, -0.125389, 0.3686275, 1, 0, 1,
-0.5881616, 0.4268664, -0.3025108, 0.3607843, 1, 0, 1,
-0.5872841, -1.158397, -2.823966, 0.3568628, 1, 0, 1,
-0.5866387, 1.605203, 0.123169, 0.3490196, 1, 0, 1,
-0.5860173, -0.0803114, -1.719982, 0.345098, 1, 0, 1,
-0.5856173, 1.073775, -0.271848, 0.3372549, 1, 0, 1,
-0.5837298, -1.500605, -4.462049, 0.3333333, 1, 0, 1,
-0.5813688, 0.5119809, -0.357049, 0.3254902, 1, 0, 1,
-0.5811387, 1.479709, -0.3400476, 0.3215686, 1, 0, 1,
-0.5807344, -1.650719, -1.93203, 0.3137255, 1, 0, 1,
-0.5797237, 0.4531646, -1.366235, 0.3098039, 1, 0, 1,
-0.57381, 1.163259, -1.4372, 0.3019608, 1, 0, 1,
-0.5685512, 0.8475627, -1.113449, 0.2941177, 1, 0, 1,
-0.5615892, 0.02696104, -0.1408423, 0.2901961, 1, 0, 1,
-0.5520831, -0.2706029, -1.333522, 0.282353, 1, 0, 1,
-0.548444, 0.3943993, 0.4196033, 0.2784314, 1, 0, 1,
-0.5470046, 0.2355615, -1.451596, 0.2705882, 1, 0, 1,
-0.5451885, 1.057631, 0.8165547, 0.2666667, 1, 0, 1,
-0.5432525, 0.4058161, 0.7033576, 0.2588235, 1, 0, 1,
-0.5402716, -0.08096158, -0.8772911, 0.254902, 1, 0, 1,
-0.5398885, 0.590934, -1.024164, 0.2470588, 1, 0, 1,
-0.5397655, -0.9666407, -3.338315, 0.2431373, 1, 0, 1,
-0.5392835, -2.399173, -2.887495, 0.2352941, 1, 0, 1,
-0.5392079, -0.2380135, -1.747095, 0.2313726, 1, 0, 1,
-0.5366259, -0.8571412, -0.6952485, 0.2235294, 1, 0, 1,
-0.5313172, -0.9983704, -2.213406, 0.2196078, 1, 0, 1,
-0.5289823, -0.7057663, -2.027417, 0.2117647, 1, 0, 1,
-0.5275229, 0.4828497, -0.8257183, 0.2078431, 1, 0, 1,
-0.5245978, 2.496136, 0.1064057, 0.2, 1, 0, 1,
-0.5193483, 1.35752, -0.954393, 0.1921569, 1, 0, 1,
-0.5179027, -0.7247699, -3.850876, 0.1882353, 1, 0, 1,
-0.5151863, -0.02736389, -1.599125, 0.1803922, 1, 0, 1,
-0.4947855, -0.6471893, -1.592615, 0.1764706, 1, 0, 1,
-0.4934044, 0.2015527, -0.5039148, 0.1686275, 1, 0, 1,
-0.4911346, -0.3170106, -3.486641, 0.1647059, 1, 0, 1,
-0.4903689, -0.5857869, -2.787815, 0.1568628, 1, 0, 1,
-0.4859951, -0.196591, -3.009969, 0.1529412, 1, 0, 1,
-0.4768128, -1.083969, -1.777734, 0.145098, 1, 0, 1,
-0.4743867, 1.902699, 0.3249896, 0.1411765, 1, 0, 1,
-0.470931, -0.6526754, -1.360797, 0.1333333, 1, 0, 1,
-0.4697537, 0.5985917, -2.262872, 0.1294118, 1, 0, 1,
-0.4693205, 0.7625128, -0.4347794, 0.1215686, 1, 0, 1,
-0.4648201, -1.521432, -2.789098, 0.1176471, 1, 0, 1,
-0.4616468, -0.2730813, -1.051821, 0.1098039, 1, 0, 1,
-0.4600827, 1.531471, -0.9597586, 0.1058824, 1, 0, 1,
-0.4506023, -1.719079, -1.512967, 0.09803922, 1, 0, 1,
-0.4461479, -0.8408082, -2.468492, 0.09019608, 1, 0, 1,
-0.4445719, 1.033839, -2.846939, 0.08627451, 1, 0, 1,
-0.4406171, -0.7460816, -1.946781, 0.07843138, 1, 0, 1,
-0.4402993, 1.437011, -0.09286896, 0.07450981, 1, 0, 1,
-0.4397336, -0.7540586, -3.960877, 0.06666667, 1, 0, 1,
-0.434822, -2.410182, -4.104941, 0.0627451, 1, 0, 1,
-0.4319816, -0.8971368, -2.993532, 0.05490196, 1, 0, 1,
-0.427146, 0.142757, -2.217919, 0.05098039, 1, 0, 1,
-0.4269522, 0.6888205, -1.03022, 0.04313726, 1, 0, 1,
-0.4259354, 0.3612046, -1.564371, 0.03921569, 1, 0, 1,
-0.425118, 0.4868115, -1.867511, 0.03137255, 1, 0, 1,
-0.4243907, 1.425742, -0.7915718, 0.02745098, 1, 0, 1,
-0.4235716, 1.400037, -1.773593, 0.01960784, 1, 0, 1,
-0.4216507, 0.1204719, -1.700511, 0.01568628, 1, 0, 1,
-0.4177882, 0.6952655, 0.3459152, 0.007843138, 1, 0, 1,
-0.4142398, -0.1172894, -0.4325939, 0.003921569, 1, 0, 1,
-0.4133537, -0.5257186, -4.047933, 0, 1, 0.003921569, 1,
-0.4133478, -0.04212269, 0.400191, 0, 1, 0.01176471, 1,
-0.4131768, -0.1502632, -2.133065, 0, 1, 0.01568628, 1,
-0.4111182, 0.4062129, -0.4279358, 0, 1, 0.02352941, 1,
-0.4101746, -2.15891, -3.666704, 0, 1, 0.02745098, 1,
-0.407682, -1.614708, -4.187051, 0, 1, 0.03529412, 1,
-0.4046764, 1.339341, -0.4453035, 0, 1, 0.03921569, 1,
-0.403966, 2.069184, 0.1839259, 0, 1, 0.04705882, 1,
-0.4033405, -1.418789, -3.664538, 0, 1, 0.05098039, 1,
-0.4026223, 1.242935, -0.6049297, 0, 1, 0.05882353, 1,
-0.4023565, 0.9524821, -0.4317294, 0, 1, 0.0627451, 1,
-0.3986712, -1.447109, -3.117814, 0, 1, 0.07058824, 1,
-0.397899, -0.2996332, -0.6736116, 0, 1, 0.07450981, 1,
-0.3953761, 0.06497712, -1.667713, 0, 1, 0.08235294, 1,
-0.3942621, 1.454053, -0.4012951, 0, 1, 0.08627451, 1,
-0.3932318, -0.3210373, -3.894943, 0, 1, 0.09411765, 1,
-0.3928295, 1.919086, -0.2655983, 0, 1, 0.1019608, 1,
-0.3914419, -0.1036178, -1.313123, 0, 1, 0.1058824, 1,
-0.3901446, 0.7735789, -0.6762476, 0, 1, 0.1137255, 1,
-0.382506, -0.4553587, -3.466223, 0, 1, 0.1176471, 1,
-0.3782061, -0.2540078, -3.09199, 0, 1, 0.1254902, 1,
-0.3645892, 1.061071, -0.65347, 0, 1, 0.1294118, 1,
-0.3644395, -2.248352, -4.438463, 0, 1, 0.1372549, 1,
-0.3644319, -0.1899801, -2.975106, 0, 1, 0.1411765, 1,
-0.3633394, -0.5340849, -0.6899278, 0, 1, 0.1490196, 1,
-0.3625076, 0.3530807, -0.6955639, 0, 1, 0.1529412, 1,
-0.3618257, 0.884187, -0.4179487, 0, 1, 0.1607843, 1,
-0.3617841, 0.5789605, -1.007365, 0, 1, 0.1647059, 1,
-0.3616086, -0.5513223, -2.124173, 0, 1, 0.172549, 1,
-0.3595794, 1.420252, -1.763301, 0, 1, 0.1764706, 1,
-0.3558623, -0.3968128, -1.338555, 0, 1, 0.1843137, 1,
-0.3549553, -1.539145, -3.934867, 0, 1, 0.1882353, 1,
-0.3450585, 1.468608, 0.009805987, 0, 1, 0.1960784, 1,
-0.3438047, 0.7847541, -2.375952, 0, 1, 0.2039216, 1,
-0.3418581, 0.2286704, -1.106007, 0, 1, 0.2078431, 1,
-0.3405842, -0.05638165, -1.568546, 0, 1, 0.2156863, 1,
-0.3398656, -0.01238837, -2.637355, 0, 1, 0.2196078, 1,
-0.3396517, -0.04399372, -1.099081, 0, 1, 0.227451, 1,
-0.3394318, -0.5377899, -1.963203, 0, 1, 0.2313726, 1,
-0.3350904, -0.08561847, -3.090675, 0, 1, 0.2392157, 1,
-0.333067, 1.611016, -0.6318932, 0, 1, 0.2431373, 1,
-0.3329724, 0.585345, -0.3943035, 0, 1, 0.2509804, 1,
-0.3319549, -0.8178976, -1.60491, 0, 1, 0.254902, 1,
-0.3314413, -0.9904513, -2.320041, 0, 1, 0.2627451, 1,
-0.324211, 1.938797, -0.5259402, 0, 1, 0.2666667, 1,
-0.3221, 0.1305054, -1.980513, 0, 1, 0.2745098, 1,
-0.3211746, -0.447044, -2.532502, 0, 1, 0.2784314, 1,
-0.3199274, -0.2114711, -3.40506, 0, 1, 0.2862745, 1,
-0.3181193, 1.001255, -1.621596, 0, 1, 0.2901961, 1,
-0.3145941, 0.7884496, -0.0317431, 0, 1, 0.2980392, 1,
-0.3078377, 1.359635, 0.1608371, 0, 1, 0.3058824, 1,
-0.2973, -0.9606639, -3.764375, 0, 1, 0.3098039, 1,
-0.293047, -0.4725463, -3.96366, 0, 1, 0.3176471, 1,
-0.2923425, -0.4146595, -2.265538, 0, 1, 0.3215686, 1,
-0.289816, 1.217426, 0.6430463, 0, 1, 0.3294118, 1,
-0.2882965, -0.3890297, -1.479289, 0, 1, 0.3333333, 1,
-0.2875161, -0.6845459, -3.879159, 0, 1, 0.3411765, 1,
-0.2815729, -0.07767183, -2.326119, 0, 1, 0.345098, 1,
-0.2804432, -0.2328497, -5.45987, 0, 1, 0.3529412, 1,
-0.277433, -0.1540228, -1.817006, 0, 1, 0.3568628, 1,
-0.270678, -0.8340921, -3.580072, 0, 1, 0.3647059, 1,
-0.262473, -0.917525, -3.005262, 0, 1, 0.3686275, 1,
-0.2616063, 1.833887, -1.290851, 0, 1, 0.3764706, 1,
-0.261466, -0.138958, -1.498037, 0, 1, 0.3803922, 1,
-0.2600492, -0.2631455, -2.503698, 0, 1, 0.3882353, 1,
-0.25968, -0.4144169, -2.955325, 0, 1, 0.3921569, 1,
-0.2584802, -0.6830705, -3.441188, 0, 1, 0.4, 1,
-0.2574728, 1.60025, -0.2946673, 0, 1, 0.4078431, 1,
-0.2564336, -0.828607, -2.170241, 0, 1, 0.4117647, 1,
-0.2542239, 0.992426, -0.8843857, 0, 1, 0.4196078, 1,
-0.2523038, 0.3805423, -0.6132519, 0, 1, 0.4235294, 1,
-0.2511302, -0.3579709, -2.272694, 0, 1, 0.4313726, 1,
-0.2499606, -1.095476, -3.482762, 0, 1, 0.4352941, 1,
-0.2493977, -0.6016759, -2.68499, 0, 1, 0.4431373, 1,
-0.2430487, 0.6465487, 0.02971285, 0, 1, 0.4470588, 1,
-0.2409841, 0.6829875, -0.3797838, 0, 1, 0.454902, 1,
-0.2402889, 1.207213, -1.110626, 0, 1, 0.4588235, 1,
-0.2396911, -0.6746949, -2.83414, 0, 1, 0.4666667, 1,
-0.2325522, -0.1102301, -2.387656, 0, 1, 0.4705882, 1,
-0.2277518, 0.3101003, 0.005316013, 0, 1, 0.4784314, 1,
-0.2276682, 0.2691843, -1.524261, 0, 1, 0.4823529, 1,
-0.2264113, -1.638753, -2.167857, 0, 1, 0.4901961, 1,
-0.2256923, 0.6483018, -1.041507, 0, 1, 0.4941176, 1,
-0.2243754, 1.946285, -0.5546482, 0, 1, 0.5019608, 1,
-0.2232023, -0.7177246, -2.438754, 0, 1, 0.509804, 1,
-0.2225809, 0.06442893, -1.134964, 0, 1, 0.5137255, 1,
-0.2221141, 0.9693367, 0.6592889, 0, 1, 0.5215687, 1,
-0.2217534, 1.223123, 1.348052, 0, 1, 0.5254902, 1,
-0.2210519, 0.6020166, 0.4201218, 0, 1, 0.5333334, 1,
-0.2210445, 0.1664733, -2.45706, 0, 1, 0.5372549, 1,
-0.2193869, 0.6719995, 0.3286728, 0, 1, 0.5450981, 1,
-0.2137741, 1.275835, -0.9147358, 0, 1, 0.5490196, 1,
-0.2129672, -0.907537, -2.225424, 0, 1, 0.5568628, 1,
-0.2077608, 1.51148, 0.9718855, 0, 1, 0.5607843, 1,
-0.2048969, 0.3566798, -1.990999, 0, 1, 0.5686275, 1,
-0.202757, 0.4085479, 0.6152721, 0, 1, 0.572549, 1,
-0.1986462, 1.391366, 1.284417, 0, 1, 0.5803922, 1,
-0.1937612, -1.470056, -1.374252, 0, 1, 0.5843138, 1,
-0.1937597, 0.2683089, -0.6777589, 0, 1, 0.5921569, 1,
-0.1904629, 0.587885, -1.715421, 0, 1, 0.5960785, 1,
-0.1840052, -1.533508, -2.548206, 0, 1, 0.6039216, 1,
-0.1751038, -0.6806099, -3.745173, 0, 1, 0.6117647, 1,
-0.1713837, -0.1927179, -2.537315, 0, 1, 0.6156863, 1,
-0.1651953, 1.11153, 0.6291133, 0, 1, 0.6235294, 1,
-0.1616864, 0.5727018, -0.4867502, 0, 1, 0.627451, 1,
-0.1603612, -0.2068904, -3.363289, 0, 1, 0.6352941, 1,
-0.157696, 0.7897602, 0.2561572, 0, 1, 0.6392157, 1,
-0.1574704, 1.248966, 0.4252983, 0, 1, 0.6470588, 1,
-0.1561534, -1.490773, -2.515637, 0, 1, 0.6509804, 1,
-0.1547444, 1.084999, -0.7803507, 0, 1, 0.6588235, 1,
-0.1481917, 0.8025386, -0.4965364, 0, 1, 0.6627451, 1,
-0.1481685, -0.6075428, -2.339211, 0, 1, 0.6705883, 1,
-0.1406808, -0.8313556, -3.411602, 0, 1, 0.6745098, 1,
-0.1402566, 1.100236, 1.310529, 0, 1, 0.682353, 1,
-0.1343511, 1.773356, 0.08328889, 0, 1, 0.6862745, 1,
-0.1322661, 1.039673, 0.5856182, 0, 1, 0.6941177, 1,
-0.1301368, -0.554172, -2.553498, 0, 1, 0.7019608, 1,
-0.1287994, -1.140811, -1.852909, 0, 1, 0.7058824, 1,
-0.1253543, 0.9679251, -0.5685111, 0, 1, 0.7137255, 1,
-0.1252678, -0.8313851, -2.873215, 0, 1, 0.7176471, 1,
-0.1199585, 0.1895388, -1.030731, 0, 1, 0.7254902, 1,
-0.1192585, 0.3952371, -0.06215107, 0, 1, 0.7294118, 1,
-0.1137884, -0.5040013, -2.722246, 0, 1, 0.7372549, 1,
-0.1130025, -0.4922816, -2.01858, 0, 1, 0.7411765, 1,
-0.1129817, 0.5774282, 0.7513311, 0, 1, 0.7490196, 1,
-0.1117567, 0.5064003, 0.3497518, 0, 1, 0.7529412, 1,
-0.1063255, 0.3799521, -1.192213, 0, 1, 0.7607843, 1,
-0.1042494, 0.03977599, -1.868191, 0, 1, 0.7647059, 1,
-0.100345, 0.2571882, -0.6742978, 0, 1, 0.772549, 1,
-0.09795988, 0.5891798, 0.2755882, 0, 1, 0.7764706, 1,
-0.09255637, -0.5626746, -3.096436, 0, 1, 0.7843137, 1,
-0.08312012, -1.006244, -4.249238, 0, 1, 0.7882353, 1,
-0.07814015, 1.569734, 0.8129545, 0, 1, 0.7960784, 1,
-0.07718147, -1.65176, -1.659334, 0, 1, 0.8039216, 1,
-0.07481597, -0.3445915, -2.296273, 0, 1, 0.8078431, 1,
-0.0726695, -0.3570405, -4.062272, 0, 1, 0.8156863, 1,
-0.07190623, 0.4046405, 0.7099586, 0, 1, 0.8196079, 1,
-0.06581227, 1.458931, -0.6357536, 0, 1, 0.827451, 1,
-0.06121921, 0.4390846, 0.5605737, 0, 1, 0.8313726, 1,
-0.05739868, 0.918526, 0.5920518, 0, 1, 0.8392157, 1,
-0.05666641, 0.9388486, 0.009968055, 0, 1, 0.8431373, 1,
-0.05413995, -1.696378, -5.091975, 0, 1, 0.8509804, 1,
-0.05176736, 1.776571, -0.8536305, 0, 1, 0.854902, 1,
-0.05034287, 1.044549, 0.6065428, 0, 1, 0.8627451, 1,
-0.04610769, 0.6273082, -0.4303221, 0, 1, 0.8666667, 1,
-0.04269773, -1.071869, -3.828284, 0, 1, 0.8745098, 1,
-0.04028102, -1.101095, -4.977397, 0, 1, 0.8784314, 1,
-0.03713794, -1.033536, -2.672067, 0, 1, 0.8862745, 1,
-0.03059011, -0.05370212, -2.117488, 0, 1, 0.8901961, 1,
-0.02946637, -0.06613958, -2.12218, 0, 1, 0.8980392, 1,
-0.02792927, -1.447437, -2.35008, 0, 1, 0.9058824, 1,
-0.02474869, 0.1235154, 0.2413168, 0, 1, 0.9098039, 1,
-0.02117778, 1.176612, -1.147479, 0, 1, 0.9176471, 1,
-0.0208558, 0.253354, -0.02983512, 0, 1, 0.9215686, 1,
-0.01249673, -0.495183, -4.140141, 0, 1, 0.9294118, 1,
-0.01164795, -0.6938426, -2.78363, 0, 1, 0.9333333, 1,
-0.008727088, 0.1549973, -0.7981347, 0, 1, 0.9411765, 1,
-0.002868435, 1.556966, 0.7800305, 0, 1, 0.945098, 1,
-0.002748091, 1.114847, -1.706719, 0, 1, 0.9529412, 1,
-0.0004385159, 0.6409712, -2.538009, 0, 1, 0.9568627, 1,
0.0008867827, -1.707369, 3.93962, 0, 1, 0.9647059, 1,
0.001086418, 0.4964744, -1.214454, 0, 1, 0.9686275, 1,
0.003348804, 0.2481671, 0.8275512, 0, 1, 0.9764706, 1,
0.003574272, -0.1818341, 3.956041, 0, 1, 0.9803922, 1,
0.003963649, -0.8662228, 2.197527, 0, 1, 0.9882353, 1,
0.006894101, 1.261563, 0.2069189, 0, 1, 0.9921569, 1,
0.01122011, 0.4699005, 0.206872, 0, 1, 1, 1,
0.01281518, 0.5098981, -1.479266, 0, 0.9921569, 1, 1,
0.01333084, -1.942991, 3.349525, 0, 0.9882353, 1, 1,
0.01351817, -0.4404892, 3.069039, 0, 0.9803922, 1, 1,
0.01399486, -0.05348815, 2.834053, 0, 0.9764706, 1, 1,
0.01433963, 0.7897847, -0.182971, 0, 0.9686275, 1, 1,
0.0167482, -0.4920337, 3.629985, 0, 0.9647059, 1, 1,
0.01877009, 1.375278, -1.927745, 0, 0.9568627, 1, 1,
0.01910094, -2.559896, 3.009573, 0, 0.9529412, 1, 1,
0.02339362, -0.02207492, 0.3488013, 0, 0.945098, 1, 1,
0.02516555, 0.5616627, 0.3259325, 0, 0.9411765, 1, 1,
0.02642679, 0.3437022, -0.3399627, 0, 0.9333333, 1, 1,
0.0288829, -2.277253, 3.441704, 0, 0.9294118, 1, 1,
0.03045828, -1.4813, 2.534245, 0, 0.9215686, 1, 1,
0.03361491, -0.07651637, 3.373179, 0, 0.9176471, 1, 1,
0.03652332, 1.211374, -0.2905864, 0, 0.9098039, 1, 1,
0.0381824, 0.3441766, -0.908662, 0, 0.9058824, 1, 1,
0.04392063, -1.444045, 2.968398, 0, 0.8980392, 1, 1,
0.04620789, -1.591422, 3.767354, 0, 0.8901961, 1, 1,
0.04861747, -0.09931806, 2.685461, 0, 0.8862745, 1, 1,
0.04919307, 0.4706713, 1.090349, 0, 0.8784314, 1, 1,
0.05247676, -1.404836, 2.478754, 0, 0.8745098, 1, 1,
0.05332368, -0.9529958, 3.757638, 0, 0.8666667, 1, 1,
0.05333236, 2.68669, -0.1863962, 0, 0.8627451, 1, 1,
0.05433783, 1.655229, 0.7196964, 0, 0.854902, 1, 1,
0.05605173, 0.4052998, -0.01786393, 0, 0.8509804, 1, 1,
0.05654065, 0.4980432, -0.1118969, 0, 0.8431373, 1, 1,
0.05702647, 1.229694, 0.828501, 0, 0.8392157, 1, 1,
0.06121995, -1.213934, 4.842434, 0, 0.8313726, 1, 1,
0.06152584, 0.3192091, -0.06442469, 0, 0.827451, 1, 1,
0.06184733, 0.956757, 0.1324987, 0, 0.8196079, 1, 1,
0.06498579, -0.9748735, 2.598355, 0, 0.8156863, 1, 1,
0.06533736, -0.1482559, 4.750169, 0, 0.8078431, 1, 1,
0.06967195, 1.478078, -0.5257842, 0, 0.8039216, 1, 1,
0.07470224, -0.7089357, 4.153356, 0, 0.7960784, 1, 1,
0.07601472, 1.815814, 0.5906057, 0, 0.7882353, 1, 1,
0.07625808, 0.7683581, 1.241781, 0, 0.7843137, 1, 1,
0.07939717, -0.7230976, 5.063564, 0, 0.7764706, 1, 1,
0.08168698, -0.7996052, 4.214159, 0, 0.772549, 1, 1,
0.08264626, 1.506592, 1.174415, 0, 0.7647059, 1, 1,
0.09136882, -0.8257938, 3.628407, 0, 0.7607843, 1, 1,
0.09317449, 0.5229948, 0.3767177, 0, 0.7529412, 1, 1,
0.09596567, -0.5539314, 4.052805, 0, 0.7490196, 1, 1,
0.09684556, 0.3224584, 1.292178, 0, 0.7411765, 1, 1,
0.09870213, -1.031553, 3.113864, 0, 0.7372549, 1, 1,
0.1013993, -0.0929036, 3.419962, 0, 0.7294118, 1, 1,
0.1027705, 0.1475034, -0.4227385, 0, 0.7254902, 1, 1,
0.1051905, -0.116419, 2.177505, 0, 0.7176471, 1, 1,
0.1072266, 1.581385, 0.6203871, 0, 0.7137255, 1, 1,
0.1087736, -0.03997372, 1.332874, 0, 0.7058824, 1, 1,
0.1110198, -1.200848, 1.870198, 0, 0.6980392, 1, 1,
0.1128054, -0.2471961, 3.637436, 0, 0.6941177, 1, 1,
0.1139286, -1.244812, 2.429384, 0, 0.6862745, 1, 1,
0.1179287, 1.058897, 0.8115222, 0, 0.682353, 1, 1,
0.1203863, -0.9644715, 2.608587, 0, 0.6745098, 1, 1,
0.1209194, 0.9537882, -0.1703385, 0, 0.6705883, 1, 1,
0.1241293, 0.1722669, -0.3374116, 0, 0.6627451, 1, 1,
0.1290253, 0.864894, -0.7563301, 0, 0.6588235, 1, 1,
0.1310183, -1.248679, 4.273109, 0, 0.6509804, 1, 1,
0.1336598, 1.602029, 1.031544, 0, 0.6470588, 1, 1,
0.1357801, -0.359178, 2.379764, 0, 0.6392157, 1, 1,
0.1358566, -0.09186828, 3.528411, 0, 0.6352941, 1, 1,
0.1407422, -0.58686, 2.905686, 0, 0.627451, 1, 1,
0.1419403, 0.8142809, 1.428641, 0, 0.6235294, 1, 1,
0.1423953, 1.020934, -1.016381, 0, 0.6156863, 1, 1,
0.1438004, 1.170902, -0.5881307, 0, 0.6117647, 1, 1,
0.1438274, 0.9266074, 1.451565, 0, 0.6039216, 1, 1,
0.1487713, -0.08193151, 3.03032, 0, 0.5960785, 1, 1,
0.1488934, -0.3161838, 3.136536, 0, 0.5921569, 1, 1,
0.1495546, -0.231847, 3.132634, 0, 0.5843138, 1, 1,
0.1500845, 0.6782855, -0.7156978, 0, 0.5803922, 1, 1,
0.1523561, -1.079246, 3.633931, 0, 0.572549, 1, 1,
0.1558352, 0.09879842, 1.696846, 0, 0.5686275, 1, 1,
0.1592968, -0.2160711, 3.005157, 0, 0.5607843, 1, 1,
0.1610726, -0.7635839, 2.534577, 0, 0.5568628, 1, 1,
0.1633205, 1.499292, 0.8964443, 0, 0.5490196, 1, 1,
0.1695542, -0.9473975, 3.842458, 0, 0.5450981, 1, 1,
0.1706165, -1.557744, 2.598045, 0, 0.5372549, 1, 1,
0.1762336, 0.02973922, 0.07228962, 0, 0.5333334, 1, 1,
0.1768551, 2.125278, -0.6220974, 0, 0.5254902, 1, 1,
0.1810043, 0.10145, 1.726041, 0, 0.5215687, 1, 1,
0.1818707, 0.1001296, 2.302945, 0, 0.5137255, 1, 1,
0.1851345, 2.295032, -0.067353, 0, 0.509804, 1, 1,
0.187783, -0.6538591, 2.240343, 0, 0.5019608, 1, 1,
0.1930531, 0.9807087, -2.88626, 0, 0.4941176, 1, 1,
0.1936696, 0.7005914, 0.6851059, 0, 0.4901961, 1, 1,
0.194613, 1.214343, -0.0914555, 0, 0.4823529, 1, 1,
0.2004012, -0.4163062, 3.121677, 0, 0.4784314, 1, 1,
0.2005692, -0.4709611, 1.822955, 0, 0.4705882, 1, 1,
0.2067011, 1.000341, -1.099941, 0, 0.4666667, 1, 1,
0.2114157, 1.066523, 1.608306, 0, 0.4588235, 1, 1,
0.2164521, 0.2065245, 2.315958, 0, 0.454902, 1, 1,
0.2214974, -0.6254727, 2.899981, 0, 0.4470588, 1, 1,
0.222478, 0.8502142, -1.476227, 0, 0.4431373, 1, 1,
0.2241478, -2.172994, 2.812465, 0, 0.4352941, 1, 1,
0.2323096, 0.2885105, 2.177114, 0, 0.4313726, 1, 1,
0.2368096, 0.8269541, -0.7129946, 0, 0.4235294, 1, 1,
0.2497709, 0.1447469, 2.230809, 0, 0.4196078, 1, 1,
0.2538043, 1.487297, -1.38408, 0, 0.4117647, 1, 1,
0.2543309, -0.9583828, 4.264709, 0, 0.4078431, 1, 1,
0.2552664, 0.7094693, 0.7630736, 0, 0.4, 1, 1,
0.2590551, 2.072842, -0.0622419, 0, 0.3921569, 1, 1,
0.2605666, -1.7005, 0.2416608, 0, 0.3882353, 1, 1,
0.2635301, -1.842187, 4.442742, 0, 0.3803922, 1, 1,
0.2637806, -2.412307, 2.083955, 0, 0.3764706, 1, 1,
0.2670806, -1.574803, 2.369627, 0, 0.3686275, 1, 1,
0.2681872, -0.1142408, 2.193053, 0, 0.3647059, 1, 1,
0.2719649, -1.182012, 1.972566, 0, 0.3568628, 1, 1,
0.2742389, -0.01748548, 1.2227, 0, 0.3529412, 1, 1,
0.2771512, -1.415684, 3.62828, 0, 0.345098, 1, 1,
0.2834914, 0.6178574, -0.6496863, 0, 0.3411765, 1, 1,
0.2878137, -0.4044235, 2.136352, 0, 0.3333333, 1, 1,
0.291538, 1.589064, -0.6572282, 0, 0.3294118, 1, 1,
0.2918583, 0.6407347, 1.427262, 0, 0.3215686, 1, 1,
0.2933132, -0.6902096, 3.023235, 0, 0.3176471, 1, 1,
0.2943971, 0.4675618, 1.497861, 0, 0.3098039, 1, 1,
0.296069, 0.09102302, 0.5080231, 0, 0.3058824, 1, 1,
0.2967436, -0.6406131, 3.592074, 0, 0.2980392, 1, 1,
0.2981712, -0.5272852, 3.125206, 0, 0.2901961, 1, 1,
0.299069, -1.823279, 2.332473, 0, 0.2862745, 1, 1,
0.3011913, 0.7806801, -0.08195266, 0, 0.2784314, 1, 1,
0.3037724, 0.7090773, 0.4073582, 0, 0.2745098, 1, 1,
0.3043472, 1.900597, -0.1472666, 0, 0.2666667, 1, 1,
0.3050282, -0.2350893, 1.788453, 0, 0.2627451, 1, 1,
0.3066944, 0.8726669, -1.986795, 0, 0.254902, 1, 1,
0.3067655, 0.1697922, 0.4216925, 0, 0.2509804, 1, 1,
0.3097558, 0.9345279, 0.9492493, 0, 0.2431373, 1, 1,
0.3115172, 0.05056859, 0.0912181, 0, 0.2392157, 1, 1,
0.3128644, -0.8895714, 2.691308, 0, 0.2313726, 1, 1,
0.3135349, 0.8740401, 3.543309, 0, 0.227451, 1, 1,
0.3196556, -0.3122956, 1.791687, 0, 0.2196078, 1, 1,
0.3305701, -0.02553022, 0.9892477, 0, 0.2156863, 1, 1,
0.3321541, -1.079463, 3.26581, 0, 0.2078431, 1, 1,
0.3341736, -1.832511, 2.41579, 0, 0.2039216, 1, 1,
0.3348699, 0.3628897, 1.122596, 0, 0.1960784, 1, 1,
0.3419769, -0.6001563, 2.023787, 0, 0.1882353, 1, 1,
0.3464378, 0.08854997, 0.06062639, 0, 0.1843137, 1, 1,
0.3477249, -0.4736618, 0.4386951, 0, 0.1764706, 1, 1,
0.3500858, -1.248105, 1.969924, 0, 0.172549, 1, 1,
0.3562872, 0.1136424, 2.397496, 0, 0.1647059, 1, 1,
0.3572535, -0.8462787, 3.020108, 0, 0.1607843, 1, 1,
0.3579729, 0.887529, 0.3308092, 0, 0.1529412, 1, 1,
0.3650869, -1.041751, 2.95324, 0, 0.1490196, 1, 1,
0.3651571, 0.9578081, 1.767971, 0, 0.1411765, 1, 1,
0.3681293, -0.3235962, 2.784162, 0, 0.1372549, 1, 1,
0.3694183, 0.5124225, 0.305038, 0, 0.1294118, 1, 1,
0.3695134, -1.82023, 1.788931, 0, 0.1254902, 1, 1,
0.3740614, 1.122896, -0.1516511, 0, 0.1176471, 1, 1,
0.3761818, -1.177591, 2.45228, 0, 0.1137255, 1, 1,
0.3820534, 0.7350765, 0.125411, 0, 0.1058824, 1, 1,
0.3823554, 1.075745, 0.6154679, 0, 0.09803922, 1, 1,
0.3845988, -0.6153354, 2.59645, 0, 0.09411765, 1, 1,
0.3846316, -0.8790651, 3.994381, 0, 0.08627451, 1, 1,
0.3868755, 0.7712717, 0.3094542, 0, 0.08235294, 1, 1,
0.393456, 0.9172888, -0.3430078, 0, 0.07450981, 1, 1,
0.3972346, 0.8595653, -0.9449377, 0, 0.07058824, 1, 1,
0.3997186, 0.6100813, 0.05368025, 0, 0.0627451, 1, 1,
0.402137, -0.1640984, 1.643303, 0, 0.05882353, 1, 1,
0.4030695, 0.1671864, 1.664494, 0, 0.05098039, 1, 1,
0.4049619, -0.3548599, 1.936769, 0, 0.04705882, 1, 1,
0.4050304, 0.6613244, 1.883352, 0, 0.03921569, 1, 1,
0.4069643, -2.309485, 2.000133, 0, 0.03529412, 1, 1,
0.4113733, 0.9976134, 0.9319223, 0, 0.02745098, 1, 1,
0.4167391, -0.8621383, 3.161968, 0, 0.02352941, 1, 1,
0.4176365, 0.05475466, 0.9530028, 0, 0.01568628, 1, 1,
0.4192106, 1.281707, -0.8398539, 0, 0.01176471, 1, 1,
0.4210007, -1.802857, 0.184291, 0, 0.003921569, 1, 1,
0.4241081, -0.02277176, 1.722231, 0.003921569, 0, 1, 1,
0.4259405, 0.399591, 1.582687, 0.007843138, 0, 1, 1,
0.4286889, -0.591365, 3.225381, 0.01568628, 0, 1, 1,
0.4310744, -0.7253352, 3.389306, 0.01960784, 0, 1, 1,
0.4348311, 0.275205, 1.605433, 0.02745098, 0, 1, 1,
0.4369919, -2.08037, 3.846135, 0.03137255, 0, 1, 1,
0.4376014, -0.465828, 2.684204, 0.03921569, 0, 1, 1,
0.4426044, 0.517893, 0.7843813, 0.04313726, 0, 1, 1,
0.4445812, -1.573546, 2.464257, 0.05098039, 0, 1, 1,
0.4488793, -0.5095154, 2.461749, 0.05490196, 0, 1, 1,
0.4495524, 0.2023607, 1.731636, 0.0627451, 0, 1, 1,
0.4509966, 2.2215, 0.7375618, 0.06666667, 0, 1, 1,
0.4524595, 0.4756547, 1.572291, 0.07450981, 0, 1, 1,
0.4533685, -0.4955973, 3.108544, 0.07843138, 0, 1, 1,
0.4541272, 0.3346997, 1.352123, 0.08627451, 0, 1, 1,
0.4572802, 1.659669, 0.4016377, 0.09019608, 0, 1, 1,
0.4605779, -0.8243662, 1.201889, 0.09803922, 0, 1, 1,
0.4616737, 1.125781, -0.3759946, 0.1058824, 0, 1, 1,
0.4673611, 0.1857776, 0.5039458, 0.1098039, 0, 1, 1,
0.4721307, 1.544602, -0.2191371, 0.1176471, 0, 1, 1,
0.4730423, -0.358112, 3.485881, 0.1215686, 0, 1, 1,
0.4748525, 1.143808, 0.2860147, 0.1294118, 0, 1, 1,
0.4749509, 0.2308477, 2.522089, 0.1333333, 0, 1, 1,
0.4832686, 0.2434608, 0.7018415, 0.1411765, 0, 1, 1,
0.4890457, -1.027483, 2.431839, 0.145098, 0, 1, 1,
0.5007003, -1.322754, 3.654451, 0.1529412, 0, 1, 1,
0.5013869, 0.422471, -0.2544003, 0.1568628, 0, 1, 1,
0.5025099, -0.6187915, 2.280473, 0.1647059, 0, 1, 1,
0.5060923, 1.008228, 0.1960008, 0.1686275, 0, 1, 1,
0.5111984, -2.025734, 1.931353, 0.1764706, 0, 1, 1,
0.5151431, 0.2883022, 2.019804, 0.1803922, 0, 1, 1,
0.5155994, -0.1212458, 0.9541146, 0.1882353, 0, 1, 1,
0.5159318, 0.1030316, 1.658042, 0.1921569, 0, 1, 1,
0.5244093, -0.6407462, 3.504117, 0.2, 0, 1, 1,
0.5249321, 0.6766453, 0.4719445, 0.2078431, 0, 1, 1,
0.5249627, 0.09670624, 1.408109, 0.2117647, 0, 1, 1,
0.5266237, -1.409333, 3.484446, 0.2196078, 0, 1, 1,
0.5272949, 1.519378, 1.906801, 0.2235294, 0, 1, 1,
0.5305638, -0.00343431, 1.924465, 0.2313726, 0, 1, 1,
0.5353721, -1.740921, 3.115264, 0.2352941, 0, 1, 1,
0.5382793, 0.8080106, -0.06136431, 0.2431373, 0, 1, 1,
0.538836, -0.5366195, 1.782378, 0.2470588, 0, 1, 1,
0.5419788, -0.3280635, 1.405995, 0.254902, 0, 1, 1,
0.5465034, -3.149232, 3.648785, 0.2588235, 0, 1, 1,
0.5478728, -0.04237526, 1.200881, 0.2666667, 0, 1, 1,
0.5536477, -0.8649168, 3.322272, 0.2705882, 0, 1, 1,
0.55717, -1.047793, 3.260242, 0.2784314, 0, 1, 1,
0.5618773, -0.6451441, 1.939977, 0.282353, 0, 1, 1,
0.5674304, 0.4524933, 1.71503, 0.2901961, 0, 1, 1,
0.5680197, -1.386782, 2.764769, 0.2941177, 0, 1, 1,
0.5703688, 2.098947, 1.999838, 0.3019608, 0, 1, 1,
0.570707, -1.462763, 4.493527, 0.3098039, 0, 1, 1,
0.572386, 0.3233181, 0.5732024, 0.3137255, 0, 1, 1,
0.5727243, 0.1468853, 1.381719, 0.3215686, 0, 1, 1,
0.576864, 1.16682, 2.037374, 0.3254902, 0, 1, 1,
0.5792303, -0.7760833, 2.411159, 0.3333333, 0, 1, 1,
0.5846555, -2.011501, 3.50917, 0.3372549, 0, 1, 1,
0.5846621, -1.658039, 3.532232, 0.345098, 0, 1, 1,
0.586599, -0.02071617, 0.3014172, 0.3490196, 0, 1, 1,
0.5922945, 0.01593186, 1.665245, 0.3568628, 0, 1, 1,
0.5954936, -0.1574547, 1.696578, 0.3607843, 0, 1, 1,
0.6102515, -0.6898479, 2.333762, 0.3686275, 0, 1, 1,
0.6116409, 1.278226, 0.5831891, 0.372549, 0, 1, 1,
0.6121836, -1.53937, 3.271852, 0.3803922, 0, 1, 1,
0.6127058, 0.8422856, -0.4382794, 0.3843137, 0, 1, 1,
0.6161911, -0.415886, 1.960222, 0.3921569, 0, 1, 1,
0.6171839, -0.4609082, 2.740233, 0.3960784, 0, 1, 1,
0.6181802, 0.2921651, 0.0251709, 0.4039216, 0, 1, 1,
0.6195852, -0.9367133, 1.858933, 0.4117647, 0, 1, 1,
0.6221821, -1.178293, 4.03159, 0.4156863, 0, 1, 1,
0.6307114, 0.5176362, -0.1204568, 0.4235294, 0, 1, 1,
0.6314607, 1.031131, 0.3815825, 0.427451, 0, 1, 1,
0.6333759, 0.2956538, 2.134379, 0.4352941, 0, 1, 1,
0.6428843, 1.222412, 2.031923, 0.4392157, 0, 1, 1,
0.6532677, 0.7539781, 2.225278, 0.4470588, 0, 1, 1,
0.6585617, 1.044057, 1.289007, 0.4509804, 0, 1, 1,
0.662744, -0.3866687, -0.3702523, 0.4588235, 0, 1, 1,
0.6643143, -0.7275672, 3.594586, 0.4627451, 0, 1, 1,
0.6674619, 0.5761675, 1.314288, 0.4705882, 0, 1, 1,
0.667534, -0.7683309, 2.0249, 0.4745098, 0, 1, 1,
0.6716925, -0.2492945, 2.773902, 0.4823529, 0, 1, 1,
0.6730628, -0.4633658, 0.9587381, 0.4862745, 0, 1, 1,
0.6741944, -1.273046, 2.965663, 0.4941176, 0, 1, 1,
0.6772094, 0.4158293, 0.2581348, 0.5019608, 0, 1, 1,
0.6787337, -0.4704421, 3.644698, 0.5058824, 0, 1, 1,
0.6797902, -1.366408, 2.525945, 0.5137255, 0, 1, 1,
0.6806127, -1.993252, 2.774126, 0.5176471, 0, 1, 1,
0.6823474, -0.1683832, 0.7915409, 0.5254902, 0, 1, 1,
0.684967, -0.3220658, 1.35996, 0.5294118, 0, 1, 1,
0.6879846, -0.6376385, 2.206005, 0.5372549, 0, 1, 1,
0.690203, 0.2110916, -0.1568591, 0.5411765, 0, 1, 1,
0.6945196, 0.8045638, 0.7533919, 0.5490196, 0, 1, 1,
0.6945796, 0.2817893, 1.937971, 0.5529412, 0, 1, 1,
0.6960157, 0.4536938, 2.802582, 0.5607843, 0, 1, 1,
0.7006199, 1.17405, -0.6697487, 0.5647059, 0, 1, 1,
0.7017177, -0.8971395, 3.194526, 0.572549, 0, 1, 1,
0.7070003, -0.9407516, 2.277562, 0.5764706, 0, 1, 1,
0.7106438, -0.3805569, 1.798058, 0.5843138, 0, 1, 1,
0.7156023, 0.8552734, 1.25248, 0.5882353, 0, 1, 1,
0.7159289, 0.4708064, -0.2963555, 0.5960785, 0, 1, 1,
0.7159939, 1.192569, -2.01867, 0.6039216, 0, 1, 1,
0.7166473, 1.173986, 1.408856, 0.6078432, 0, 1, 1,
0.7179012, 0.7547544, 1.398803, 0.6156863, 0, 1, 1,
0.7197796, -0.5383137, 2.236964, 0.6196079, 0, 1, 1,
0.723437, 0.1252212, 0.8036117, 0.627451, 0, 1, 1,
0.7262912, -2.186667, 2.165932, 0.6313726, 0, 1, 1,
0.7265608, -0.3273472, 2.074762, 0.6392157, 0, 1, 1,
0.7268578, -0.2880996, 1.039982, 0.6431373, 0, 1, 1,
0.7496004, -1.435753, 2.124734, 0.6509804, 0, 1, 1,
0.7511162, 1.409122, 2.778514, 0.654902, 0, 1, 1,
0.7540336, -0.3222583, 2.762045, 0.6627451, 0, 1, 1,
0.7559874, 2.139458, -1.877861, 0.6666667, 0, 1, 1,
0.7563897, -0.7367405, 2.998881, 0.6745098, 0, 1, 1,
0.7622296, -0.3933934, 1.72944, 0.6784314, 0, 1, 1,
0.763387, -1.024078, 3.075631, 0.6862745, 0, 1, 1,
0.7647216, 0.5199043, 0.5990225, 0.6901961, 0, 1, 1,
0.7753251, -0.074531, 0.4992836, 0.6980392, 0, 1, 1,
0.7767574, 0.6822354, 0.4241433, 0.7058824, 0, 1, 1,
0.7773776, 0.1760513, 1.318669, 0.7098039, 0, 1, 1,
0.7799481, 1.060624, -0.008600106, 0.7176471, 0, 1, 1,
0.7846521, 0.7185786, 0.6005779, 0.7215686, 0, 1, 1,
0.7870821, -0.5128763, 2.692935, 0.7294118, 0, 1, 1,
0.7872314, -0.4354342, 0.9689896, 0.7333333, 0, 1, 1,
0.7879221, 0.3414069, 0.8928618, 0.7411765, 0, 1, 1,
0.7903728, 0.7774557, 1.170032, 0.7450981, 0, 1, 1,
0.794971, 0.3774104, 2.007538, 0.7529412, 0, 1, 1,
0.810903, -1.766062, 1.486198, 0.7568628, 0, 1, 1,
0.8123211, -0.3619941, 2.952288, 0.7647059, 0, 1, 1,
0.8144718, -0.811025, 3.813495, 0.7686275, 0, 1, 1,
0.8151767, 1.407816, -0.5071082, 0.7764706, 0, 1, 1,
0.8153234, 0.8789498, 0.5133035, 0.7803922, 0, 1, 1,
0.8226826, 1.111473, 1.855411, 0.7882353, 0, 1, 1,
0.8273966, -0.3493741, 2.050616, 0.7921569, 0, 1, 1,
0.8363108, 1.05547, 1.104349, 0.8, 0, 1, 1,
0.8379278, -0.3614021, 0.8715986, 0.8078431, 0, 1, 1,
0.8404164, -0.8616998, 2.381734, 0.8117647, 0, 1, 1,
0.8410943, -0.5872718, 1.040215, 0.8196079, 0, 1, 1,
0.8419677, -1.145503, 2.190998, 0.8235294, 0, 1, 1,
0.8434722, -0.05257585, 0.5586303, 0.8313726, 0, 1, 1,
0.8440931, -0.3046327, 2.384233, 0.8352941, 0, 1, 1,
0.8511425, 0.896462, 0.034945, 0.8431373, 0, 1, 1,
0.8684171, -0.1677465, 0.8866611, 0.8470588, 0, 1, 1,
0.8688903, -0.4443786, 0.9806437, 0.854902, 0, 1, 1,
0.8713149, 0.1314046, -0.5575322, 0.8588235, 0, 1, 1,
0.871785, -2.583339, 4.695242, 0.8666667, 0, 1, 1,
0.8755022, 1.066892, 0.6443886, 0.8705882, 0, 1, 1,
0.8762357, -1.139877, 1.94384, 0.8784314, 0, 1, 1,
0.8808576, 0.5843996, 0.2995303, 0.8823529, 0, 1, 1,
0.8841063, 0.8662022, 1.127058, 0.8901961, 0, 1, 1,
0.8885766, -0.4727609, 3.032944, 0.8941177, 0, 1, 1,
0.8966706, -1.074835, 2.473855, 0.9019608, 0, 1, 1,
0.9067874, -0.9521646, 4.585327, 0.9098039, 0, 1, 1,
0.9114053, 0.2327214, 1.61225, 0.9137255, 0, 1, 1,
0.9119823, -1.371077, 1.003096, 0.9215686, 0, 1, 1,
0.912899, -1.410699, 4.873813, 0.9254902, 0, 1, 1,
0.9132097, -2.580479, 2.999145, 0.9333333, 0, 1, 1,
0.9169418, -0.8152509, 2.793983, 0.9372549, 0, 1, 1,
0.9184005, -0.05991652, 0.8796882, 0.945098, 0, 1, 1,
0.9342661, 0.7791694, 0.96161, 0.9490196, 0, 1, 1,
0.9407644, 0.2092885, 2.023015, 0.9568627, 0, 1, 1,
0.9437062, 1.759071, 0.6748169, 0.9607843, 0, 1, 1,
0.9438353, -0.8054469, 2.937468, 0.9686275, 0, 1, 1,
0.94546, -0.8003643, 2.908783, 0.972549, 0, 1, 1,
0.9617227, -0.7534725, 1.942664, 0.9803922, 0, 1, 1,
0.9671038, 0.1250343, 2.106552, 0.9843137, 0, 1, 1,
0.9671569, -0.08855657, 0.3882675, 0.9921569, 0, 1, 1,
0.9817336, 1.023177, 0.2425453, 0.9960784, 0, 1, 1,
0.9819647, 0.8074418, 0.05699012, 1, 0, 0.9960784, 1,
0.9928936, 0.7921174, 0.2998658, 1, 0, 0.9882353, 1,
0.9985421, -0.06994743, 0.7894207, 1, 0, 0.9843137, 1,
1.000582, -0.4745502, 2.720337, 1, 0, 0.9764706, 1,
1.009483, 1.896024, -2.242339, 1, 0, 0.972549, 1,
1.012599, 0.3610071, 0.5928243, 1, 0, 0.9647059, 1,
1.022437, 0.9816075, 2.205072, 1, 0, 0.9607843, 1,
1.029753, 0.5392622, 2.952225, 1, 0, 0.9529412, 1,
1.033908, 0.2161589, 2.048519, 1, 0, 0.9490196, 1,
1.049572, 0.4977756, 2.435717, 1, 0, 0.9411765, 1,
1.050579, -0.9279272, 2.787657, 1, 0, 0.9372549, 1,
1.05245, 0.4648897, 1.496512, 1, 0, 0.9294118, 1,
1.053031, 0.4430533, 2.943566, 1, 0, 0.9254902, 1,
1.057273, 1.13293, 0.4170306, 1, 0, 0.9176471, 1,
1.057359, -0.4253907, 1.447745, 1, 0, 0.9137255, 1,
1.065596, -0.8818734, 3.569342, 1, 0, 0.9058824, 1,
1.066453, -0.6483135, 1.135941, 1, 0, 0.9019608, 1,
1.073232, 0.1043088, 0.5658354, 1, 0, 0.8941177, 1,
1.078321, 0.2797783, 2.265206, 1, 0, 0.8862745, 1,
1.083142, 0.0268666, 1.558532, 1, 0, 0.8823529, 1,
1.09159, -0.4773152, 0.8463396, 1, 0, 0.8745098, 1,
1.094961, 0.9265378, 2.638996, 1, 0, 0.8705882, 1,
1.108143, 1.056889, 0.7939124, 1, 0, 0.8627451, 1,
1.116577, -0.2571724, 2.056388, 1, 0, 0.8588235, 1,
1.123078, -0.09500061, 1.947516, 1, 0, 0.8509804, 1,
1.123087, -0.1149157, 1.899188, 1, 0, 0.8470588, 1,
1.12679, 0.4314228, 0.1363004, 1, 0, 0.8392157, 1,
1.135036, 1.441656, 0.5617384, 1, 0, 0.8352941, 1,
1.144304, -0.9018639, 1.521527, 1, 0, 0.827451, 1,
1.150971, 0.01261745, 0.8730381, 1, 0, 0.8235294, 1,
1.154865, 1.178425, 1.138258, 1, 0, 0.8156863, 1,
1.156417, 1.532806, 0.0975462, 1, 0, 0.8117647, 1,
1.167427, 1.653791, 1.628508, 1, 0, 0.8039216, 1,
1.173554, -0.7161326, 1.879937, 1, 0, 0.7960784, 1,
1.198856, -0.3937875, 1.879564, 1, 0, 0.7921569, 1,
1.199391, -1.902141, 2.577314, 1, 0, 0.7843137, 1,
1.201429, 0.06966605, 1.866838, 1, 0, 0.7803922, 1,
1.204775, 1.131806, -0.124253, 1, 0, 0.772549, 1,
1.212456, 1.184708, 0.3483145, 1, 0, 0.7686275, 1,
1.238545, 0.841657, 0.8106469, 1, 0, 0.7607843, 1,
1.242701, -1.290771, 0.3930608, 1, 0, 0.7568628, 1,
1.244715, -0.9962404, 2.768397, 1, 0, 0.7490196, 1,
1.246856, -0.5997791, 2.340129, 1, 0, 0.7450981, 1,
1.259354, -1.017161, 1.910149, 1, 0, 0.7372549, 1,
1.259542, 0.7386736, 2.835824, 1, 0, 0.7333333, 1,
1.264254, -1.256105, 2.218131, 1, 0, 0.7254902, 1,
1.2728, 1.684828, 0.5194885, 1, 0, 0.7215686, 1,
1.27327, 1.095922, 0.08980855, 1, 0, 0.7137255, 1,
1.278606, -3.225846, 2.795289, 1, 0, 0.7098039, 1,
1.278851, -0.6685382, 1.484075, 1, 0, 0.7019608, 1,
1.28405, -0.7362732, 3.084524, 1, 0, 0.6941177, 1,
1.285504, 0.3872045, -0.1398078, 1, 0, 0.6901961, 1,
1.288757, -1.034884, 3.205957, 1, 0, 0.682353, 1,
1.289164, -0.6967769, 2.119436, 1, 0, 0.6784314, 1,
1.290405, 0.07744957, 1.496506, 1, 0, 0.6705883, 1,
1.292815, -1.23715, 1.509665, 1, 0, 0.6666667, 1,
1.298545, -2.760736, 3.581866, 1, 0, 0.6588235, 1,
1.299976, 0.5883663, 1.776168, 1, 0, 0.654902, 1,
1.306207, -0.006508201, 2.675368, 1, 0, 0.6470588, 1,
1.313042, -0.1031382, 1.948106, 1, 0, 0.6431373, 1,
1.313044, 0.2218581, 2.5219, 1, 0, 0.6352941, 1,
1.325782, 0.6594014, -0.2968567, 1, 0, 0.6313726, 1,
1.328368, -0.1446704, 4.514643, 1, 0, 0.6235294, 1,
1.332539, -0.3224595, 4.033657, 1, 0, 0.6196079, 1,
1.34053, -0.8932681, 2.534343, 1, 0, 0.6117647, 1,
1.341325, -0.9522299, 1.42203, 1, 0, 0.6078432, 1,
1.360919, -0.2971734, -0.4621939, 1, 0, 0.6, 1,
1.36211, -0.5726594, 1.95731, 1, 0, 0.5921569, 1,
1.370672, 0.02630976, 1.956494, 1, 0, 0.5882353, 1,
1.398882, 0.8252462, 0.6769447, 1, 0, 0.5803922, 1,
1.404236, 0.7342245, 0.4805823, 1, 0, 0.5764706, 1,
1.405436, -1.290731, 1.240063, 1, 0, 0.5686275, 1,
1.412748, -2.152889, 3.80153, 1, 0, 0.5647059, 1,
1.428979, 0.05498315, 1.414973, 1, 0, 0.5568628, 1,
1.430192, 0.04451583, -0.4415971, 1, 0, 0.5529412, 1,
1.430749, 1.615654, 1.358813, 1, 0, 0.5450981, 1,
1.437255, -0.6302193, 1.700706, 1, 0, 0.5411765, 1,
1.439662, 0.3337978, 1.402636, 1, 0, 0.5333334, 1,
1.443976, 0.2319802, 1.281018, 1, 0, 0.5294118, 1,
1.448243, 0.7586417, 0.8586371, 1, 0, 0.5215687, 1,
1.467594, -0.6233857, 2.573968, 1, 0, 0.5176471, 1,
1.479172, 0.3921594, 1.18467, 1, 0, 0.509804, 1,
1.479341, 0.91688, 1.789016, 1, 0, 0.5058824, 1,
1.480277, -2.432353, 2.172049, 1, 0, 0.4980392, 1,
1.492525, 0.9214681, -0.2147348, 1, 0, 0.4901961, 1,
1.499552, -0.7401201, -0.3781431, 1, 0, 0.4862745, 1,
1.50001, 0.8828755, 1.988296, 1, 0, 0.4784314, 1,
1.50982, 1.017482, 2.349816, 1, 0, 0.4745098, 1,
1.510935, 1.069642, 1.492018, 1, 0, 0.4666667, 1,
1.516065, 1.596712, 1.17841, 1, 0, 0.4627451, 1,
1.517272, 0.1623803, 3.669522, 1, 0, 0.454902, 1,
1.517596, 0.9175528, -0.2540167, 1, 0, 0.4509804, 1,
1.521305, -2.695059, 2.617278, 1, 0, 0.4431373, 1,
1.521621, 0.1381561, 1.004747, 1, 0, 0.4392157, 1,
1.521708, 1.135541, 2.362092, 1, 0, 0.4313726, 1,
1.523611, 1.308804, 1.028227, 1, 0, 0.427451, 1,
1.530937, 0.0949341, 1.34665, 1, 0, 0.4196078, 1,
1.536469, -0.354019, 1.045849, 1, 0, 0.4156863, 1,
1.546188, -0.5891643, 1.69978, 1, 0, 0.4078431, 1,
1.562091, 1.111552, 0.7843245, 1, 0, 0.4039216, 1,
1.566858, -0.5992923, 0.8831267, 1, 0, 0.3960784, 1,
1.571943, 1.308791, 0.3795125, 1, 0, 0.3882353, 1,
1.575255, 0.6270375, 0.7378092, 1, 0, 0.3843137, 1,
1.579897, 0.5318036, 0.9284629, 1, 0, 0.3764706, 1,
1.586705, 0.9190968, 0.4325251, 1, 0, 0.372549, 1,
1.597915, -1.239667, 2.297705, 1, 0, 0.3647059, 1,
1.606443, -0.9936497, 2.909406, 1, 0, 0.3607843, 1,
1.622681, 0.3062631, 0.02683069, 1, 0, 0.3529412, 1,
1.626717, 0.4224758, 0.6567894, 1, 0, 0.3490196, 1,
1.632294, 0.4938516, 2.522721, 1, 0, 0.3411765, 1,
1.645926, 0.4947823, 1.413351, 1, 0, 0.3372549, 1,
1.653879, -0.2058783, 0.03685576, 1, 0, 0.3294118, 1,
1.665298, -0.0463432, 2.064993, 1, 0, 0.3254902, 1,
1.672914, -1.504306, 4.352913, 1, 0, 0.3176471, 1,
1.675339, 0.4926431, 0.449269, 1, 0, 0.3137255, 1,
1.700258, -0.410608, 2.76819, 1, 0, 0.3058824, 1,
1.705504, -1.239046, 2.449893, 1, 0, 0.2980392, 1,
1.719791, 1.200497, 2.414029, 1, 0, 0.2941177, 1,
1.731572, 1.883943, 0.708758, 1, 0, 0.2862745, 1,
1.732597, -0.3806192, 0.2740248, 1, 0, 0.282353, 1,
1.736659, -0.01649505, 3.432953, 1, 0, 0.2745098, 1,
1.738576, -0.1954524, 2.057176, 1, 0, 0.2705882, 1,
1.742582, -0.4027276, 1.686576, 1, 0, 0.2627451, 1,
1.744135, -0.009040643, 1.94286, 1, 0, 0.2588235, 1,
1.747502, -0.4481254, 2.393904, 1, 0, 0.2509804, 1,
1.748468, 0.213758, 2.077812, 1, 0, 0.2470588, 1,
1.763772, -0.3700789, 1.462286, 1, 0, 0.2392157, 1,
1.788084, 1.205925, 1.645975, 1, 0, 0.2352941, 1,
1.789049, -0.8818384, 2.507732, 1, 0, 0.227451, 1,
1.791278, -2.568241, 1.807821, 1, 0, 0.2235294, 1,
1.793722, 0.8913671, 1.662381, 1, 0, 0.2156863, 1,
1.827538, -0.02404026, 1.375452, 1, 0, 0.2117647, 1,
1.854077, -0.5087317, 2.822077, 1, 0, 0.2039216, 1,
1.856138, -0.6586835, 1.901179, 1, 0, 0.1960784, 1,
1.858949, -0.4841469, 1.255866, 1, 0, 0.1921569, 1,
1.870161, 0.2850961, 1.820404, 1, 0, 0.1843137, 1,
1.899524, -0.1174109, 0.6943439, 1, 0, 0.1803922, 1,
1.92803, 0.5268629, 1.776171, 1, 0, 0.172549, 1,
1.958719, 0.221677, 1.563177, 1, 0, 0.1686275, 1,
1.972444, 0.689833, -0.2186779, 1, 0, 0.1607843, 1,
1.974264, 0.2203817, 1.166389, 1, 0, 0.1568628, 1,
1.996089, -0.931395, 2.148752, 1, 0, 0.1490196, 1,
2.057208, 0.5338496, 1.931013, 1, 0, 0.145098, 1,
2.072485, 0.4612204, 0.4149415, 1, 0, 0.1372549, 1,
2.084882, -0.4072418, 2.597985, 1, 0, 0.1333333, 1,
2.092129, 0.5469056, 0.2758545, 1, 0, 0.1254902, 1,
2.117832, -0.07875368, 0.7415085, 1, 0, 0.1215686, 1,
2.136836, 0.7899759, -1.275464, 1, 0, 0.1137255, 1,
2.142168, -0.9400404, 1.315506, 1, 0, 0.1098039, 1,
2.176434, -0.2891171, 2.392388, 1, 0, 0.1019608, 1,
2.277278, -1.127544, 0.9036419, 1, 0, 0.09411765, 1,
2.310497, 0.8617485, 0.9401264, 1, 0, 0.09019608, 1,
2.322451, -1.902333, 1.034698, 1, 0, 0.08235294, 1,
2.361096, 0.2511083, 2.178175, 1, 0, 0.07843138, 1,
2.388049, 0.6624544, 1.088161, 1, 0, 0.07058824, 1,
2.410942, -1.766991, 4.130207, 1, 0, 0.06666667, 1,
2.427084, -0.5261235, 2.166041, 1, 0, 0.05882353, 1,
2.464158, -2.450282, 2.514118, 1, 0, 0.05490196, 1,
2.468419, 1.555206, 0.3352621, 1, 0, 0.04705882, 1,
2.472287, 0.1769697, 1.828427, 1, 0, 0.04313726, 1,
2.475724, -0.09584633, 0.7617912, 1, 0, 0.03529412, 1,
2.537108, 0.7334666, -2.391793, 1, 0, 0.03137255, 1,
2.612203, -1.926017, 2.466337, 1, 0, 0.02352941, 1,
2.625971, 0.8569131, 0.9492848, 1, 0, 0.01960784, 1,
2.730032, 0.09925253, 2.345231, 1, 0, 0.01176471, 1,
2.909932, 0.5277517, 1.721714, 1, 0, 0.007843138, 1
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
-0.4965855, -4.275904, -7.243592, 0, -0.5, 0.5, 0.5,
-0.4965855, -4.275904, -7.243592, 1, -0.5, 0.5, 0.5,
-0.4965855, -4.275904, -7.243592, 1, 1.5, 0.5, 0.5,
-0.4965855, -4.275904, -7.243592, 0, 1.5, 0.5, 0.5
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
-5.057912, -0.1283282, -7.243592, 0, -0.5, 0.5, 0.5,
-5.057912, -0.1283282, -7.243592, 1, -0.5, 0.5, 0.5,
-5.057912, -0.1283282, -7.243592, 1, 1.5, 0.5, 0.5,
-5.057912, -0.1283282, -7.243592, 0, 1.5, 0.5, 0.5
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
-5.057912, -4.275904, -0.1981533, 0, -0.5, 0.5, 0.5,
-5.057912, -4.275904, -0.1981533, 1, -0.5, 0.5, 0.5,
-5.057912, -4.275904, -0.1981533, 1, 1.5, 0.5, 0.5,
-5.057912, -4.275904, -0.1981533, 0, 1.5, 0.5, 0.5
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
-3, -3.318771, -5.617722,
2, -3.318771, -5.617722,
-3, -3.318771, -5.617722,
-3, -3.478293, -5.8887,
-2, -3.318771, -5.617722,
-2, -3.478293, -5.8887,
-1, -3.318771, -5.617722,
-1, -3.478293, -5.8887,
0, -3.318771, -5.617722,
0, -3.478293, -5.8887,
1, -3.318771, -5.617722,
1, -3.478293, -5.8887,
2, -3.318771, -5.617722,
2, -3.478293, -5.8887
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
-3, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
-3, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
-3, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
-3, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5,
-2, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
-2, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
-2, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
-2, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5,
-1, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
-1, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
-1, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
-1, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5,
0, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
0, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
0, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
0, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5,
1, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
1, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
1, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
1, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5,
2, -3.797338, -6.430657, 0, -0.5, 0.5, 0.5,
2, -3.797338, -6.430657, 1, -0.5, 0.5, 0.5,
2, -3.797338, -6.430657, 1, 1.5, 0.5, 0.5,
2, -3.797338, -6.430657, 0, 1.5, 0.5, 0.5
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
-4.005298, -3, -5.617722,
-4.005298, 2, -5.617722,
-4.005298, -3, -5.617722,
-4.180734, -3, -5.8887,
-4.005298, -2, -5.617722,
-4.180734, -2, -5.8887,
-4.005298, -1, -5.617722,
-4.180734, -1, -5.8887,
-4.005298, 0, -5.617722,
-4.180734, 0, -5.8887,
-4.005298, 1, -5.617722,
-4.180734, 1, -5.8887,
-4.005298, 2, -5.617722,
-4.180734, 2, -5.8887
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
-4.531605, -3, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, -3, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, -3, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, -3, -6.430657, 0, 1.5, 0.5, 0.5,
-4.531605, -2, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, -2, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, -2, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, -2, -6.430657, 0, 1.5, 0.5, 0.5,
-4.531605, -1, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, -1, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, -1, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, -1, -6.430657, 0, 1.5, 0.5, 0.5,
-4.531605, 0, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, 0, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, 0, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, 0, -6.430657, 0, 1.5, 0.5, 0.5,
-4.531605, 1, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, 1, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, 1, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, 1, -6.430657, 0, 1.5, 0.5, 0.5,
-4.531605, 2, -6.430657, 0, -0.5, 0.5, 0.5,
-4.531605, 2, -6.430657, 1, -0.5, 0.5, 0.5,
-4.531605, 2, -6.430657, 1, 1.5, 0.5, 0.5,
-4.531605, 2, -6.430657, 0, 1.5, 0.5, 0.5
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
-4.005298, -3.318771, -4,
-4.005298, -3.318771, 4,
-4.005298, -3.318771, -4,
-4.180734, -3.478293, -4,
-4.005298, -3.318771, -2,
-4.180734, -3.478293, -2,
-4.005298, -3.318771, 0,
-4.180734, -3.478293, 0,
-4.005298, -3.318771, 2,
-4.180734, -3.478293, 2,
-4.005298, -3.318771, 4,
-4.180734, -3.478293, 4
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
-4.531605, -3.797338, -4, 0, -0.5, 0.5, 0.5,
-4.531605, -3.797338, -4, 1, -0.5, 0.5, 0.5,
-4.531605, -3.797338, -4, 1, 1.5, 0.5, 0.5,
-4.531605, -3.797338, -4, 0, 1.5, 0.5, 0.5,
-4.531605, -3.797338, -2, 0, -0.5, 0.5, 0.5,
-4.531605, -3.797338, -2, 1, -0.5, 0.5, 0.5,
-4.531605, -3.797338, -2, 1, 1.5, 0.5, 0.5,
-4.531605, -3.797338, -2, 0, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 0, 0, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 0, 1, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 0, 1, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 0, 0, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 2, 0, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 2, 1, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 2, 1, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 2, 0, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 4, 0, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 4, 1, -0.5, 0.5, 0.5,
-4.531605, -3.797338, 4, 1, 1.5, 0.5, 0.5,
-4.531605, -3.797338, 4, 0, 1.5, 0.5, 0.5
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
-4.005298, -3.318771, -5.617722,
-4.005298, 3.062115, -5.617722,
-4.005298, -3.318771, 5.221416,
-4.005298, 3.062115, 5.221416,
-4.005298, -3.318771, -5.617722,
-4.005298, -3.318771, 5.221416,
-4.005298, 3.062115, -5.617722,
-4.005298, 3.062115, 5.221416,
-4.005298, -3.318771, -5.617722,
3.012127, -3.318771, -5.617722,
-4.005298, -3.318771, 5.221416,
3.012127, -3.318771, 5.221416,
-4.005298, 3.062115, -5.617722,
3.012127, 3.062115, -5.617722,
-4.005298, 3.062115, 5.221416,
3.012127, 3.062115, 5.221416,
3.012127, -3.318771, -5.617722,
3.012127, 3.062115, -5.617722,
3.012127, -3.318771, 5.221416,
3.012127, 3.062115, 5.221416,
3.012127, -3.318771, -5.617722,
3.012127, -3.318771, 5.221416,
3.012127, 3.062115, -5.617722,
3.012127, 3.062115, 5.221416
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
var radius = 7.690931;
var distance = 34.21782;
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
mvMatrix.translate( 0.4965855, 0.1283282, 0.1981533 );
mvMatrix.scale( 1.184991, 1.303202, 0.7671815 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.21782);
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


