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
-3.701418, 0.249903, -1.165966, 1, 0, 0, 1,
-2.823764, 0.06892903, -2.827636, 1, 0.007843138, 0, 1,
-2.679253, 0.6208678, -0.243955, 1, 0.01176471, 0, 1,
-2.626469, -0.7816864, -1.298505, 1, 0.01960784, 0, 1,
-2.546182, -1.640116, -1.860305, 1, 0.02352941, 0, 1,
-2.537348, 0.7009756, -2.561042, 1, 0.03137255, 0, 1,
-2.500779, -0.7173978, -0.7491785, 1, 0.03529412, 0, 1,
-2.430807, 0.088717, -2.281013, 1, 0.04313726, 0, 1,
-2.419348, 1.113262, -1.464905, 1, 0.04705882, 0, 1,
-2.407152, 0.3841557, -1.210797, 1, 0.05490196, 0, 1,
-2.393567, 1.208146, -2.306814, 1, 0.05882353, 0, 1,
-2.389541, 0.06003433, -0.5099179, 1, 0.06666667, 0, 1,
-2.37942, -0.2225118, -2.4993, 1, 0.07058824, 0, 1,
-2.355275, 0.6030905, -0.468025, 1, 0.07843138, 0, 1,
-2.186095, -1.787715, -2.835979, 1, 0.08235294, 0, 1,
-2.181663, -1.193005, -0.8491665, 1, 0.09019608, 0, 1,
-2.16884, -0.3912891, -2.479532, 1, 0.09411765, 0, 1,
-2.146063, 0.2601898, -1.091859, 1, 0.1019608, 0, 1,
-2.089808, 0.3851948, 0.3325157, 1, 0.1098039, 0, 1,
-2.087164, 0.6507853, -0.6597323, 1, 0.1137255, 0, 1,
-2.086802, 0.4179347, -1.320674, 1, 0.1215686, 0, 1,
-2.078115, -1.383908, -2.516483, 1, 0.1254902, 0, 1,
-2.041365, -1.141137, -0.5436227, 1, 0.1333333, 0, 1,
-2.026698, 1.126267, -2.676106, 1, 0.1372549, 0, 1,
-1.987022, 0.282716, -1.745425, 1, 0.145098, 0, 1,
-1.986149, -0.3655244, -0.7401338, 1, 0.1490196, 0, 1,
-1.982468, 0.1584487, -2.055269, 1, 0.1568628, 0, 1,
-1.9787, -0.8580544, -2.768843, 1, 0.1607843, 0, 1,
-1.965468, 0.9022938, -1.508571, 1, 0.1686275, 0, 1,
-1.921488, 0.401017, -0.6967342, 1, 0.172549, 0, 1,
-1.917321, -0.6809925, -1.905036, 1, 0.1803922, 0, 1,
-1.905634, 1.446302, 0.2667719, 1, 0.1843137, 0, 1,
-1.903739, 0.9674065, 0.3070401, 1, 0.1921569, 0, 1,
-1.90088, 0.818529, -1.431233, 1, 0.1960784, 0, 1,
-1.88018, -0.00304119, -2.332222, 1, 0.2039216, 0, 1,
-1.864935, -1.297791, -3.311321, 1, 0.2117647, 0, 1,
-1.857779, 1.647152, -1.953175, 1, 0.2156863, 0, 1,
-1.846921, 1.032034, -1.04456, 1, 0.2235294, 0, 1,
-1.8446, -0.1662253, -1.152473, 1, 0.227451, 0, 1,
-1.836418, 0.4541008, -1.107571, 1, 0.2352941, 0, 1,
-1.80323, -0.4461737, -0.9817941, 1, 0.2392157, 0, 1,
-1.743268, 0.5704077, 0.4751666, 1, 0.2470588, 0, 1,
-1.739519, 0.07281353, 0.8684666, 1, 0.2509804, 0, 1,
-1.719513, 0.5587339, -1.839558, 1, 0.2588235, 0, 1,
-1.703608, -0.8125544, -3.621396, 1, 0.2627451, 0, 1,
-1.700719, 0.7350729, -1.999513, 1, 0.2705882, 0, 1,
-1.685733, -2.229244, -2.898728, 1, 0.2745098, 0, 1,
-1.685266, -0.3231624, -2.2757, 1, 0.282353, 0, 1,
-1.678295, -0.07319895, -2.06203, 1, 0.2862745, 0, 1,
-1.672472, 1.559845, -1.630302, 1, 0.2941177, 0, 1,
-1.670701, 1.764404, -0.5196495, 1, 0.3019608, 0, 1,
-1.668736, 0.5394998, -1.272193, 1, 0.3058824, 0, 1,
-1.665065, 0.3499414, -1.421725, 1, 0.3137255, 0, 1,
-1.66106, 0.9870791, -0.6879295, 1, 0.3176471, 0, 1,
-1.653895, 0.4845032, -0.4690733, 1, 0.3254902, 0, 1,
-1.653669, -0.1443136, -2.777401, 1, 0.3294118, 0, 1,
-1.650846, -1.83705, -3.348283, 1, 0.3372549, 0, 1,
-1.644087, -0.4614267, -0.8829507, 1, 0.3411765, 0, 1,
-1.637616, -0.6837682, -2.410542, 1, 0.3490196, 0, 1,
-1.623995, -1.267579, -4.136553, 1, 0.3529412, 0, 1,
-1.621129, -0.1216475, -1.412192, 1, 0.3607843, 0, 1,
-1.614164, 0.1505506, -0.2678637, 1, 0.3647059, 0, 1,
-1.596784, 0.246772, -2.042621, 1, 0.372549, 0, 1,
-1.589234, -0.5531337, -2.483766, 1, 0.3764706, 0, 1,
-1.570903, 0.3999864, -2.712314, 1, 0.3843137, 0, 1,
-1.56672, 2.340665, -0.8499424, 1, 0.3882353, 0, 1,
-1.565465, 0.6947579, -0.9386023, 1, 0.3960784, 0, 1,
-1.563861, 0.9730401, -1.486546, 1, 0.4039216, 0, 1,
-1.561394, 0.991783, -0.7206096, 1, 0.4078431, 0, 1,
-1.559536, -0.4002578, -2.281473, 1, 0.4156863, 0, 1,
-1.557835, 0.2258286, -2.189152, 1, 0.4196078, 0, 1,
-1.554457, -0.9375871, -3.748041, 1, 0.427451, 0, 1,
-1.550805, -1.971622, -1.474048, 1, 0.4313726, 0, 1,
-1.549145, 0.2086282, -1.884184, 1, 0.4392157, 0, 1,
-1.535977, -0.2917546, -1.6955, 1, 0.4431373, 0, 1,
-1.525227, -0.2803712, -1.268238, 1, 0.4509804, 0, 1,
-1.522119, 0.2512327, -1.5884, 1, 0.454902, 0, 1,
-1.521485, -0.5124323, -1.009836, 1, 0.4627451, 0, 1,
-1.512022, -0.6860722, -2.010098, 1, 0.4666667, 0, 1,
-1.491233, -1.185191, -1.08113, 1, 0.4745098, 0, 1,
-1.475987, -0.1868576, -0.4276038, 1, 0.4784314, 0, 1,
-1.470021, -1.3061, -1.255251, 1, 0.4862745, 0, 1,
-1.458467, 1.376767, -0.6678168, 1, 0.4901961, 0, 1,
-1.43881, -1.510871, -2.51003, 1, 0.4980392, 0, 1,
-1.428993, -0.9879891, 0.1673036, 1, 0.5058824, 0, 1,
-1.424583, -2.181394, -2.850887, 1, 0.509804, 0, 1,
-1.40907, 1.286878, -2.235453, 1, 0.5176471, 0, 1,
-1.401824, -0.3067964, -2.499576, 1, 0.5215687, 0, 1,
-1.399388, 0.7237774, -0.1303649, 1, 0.5294118, 0, 1,
-1.392463, -0.8426644, -2.056052, 1, 0.5333334, 0, 1,
-1.374346, -0.6365175, -2.950605, 1, 0.5411765, 0, 1,
-1.374028, 0.9393654, -1.672649, 1, 0.5450981, 0, 1,
-1.373523, 0.1713464, -1.386941, 1, 0.5529412, 0, 1,
-1.371616, -2.226719, -1.221461, 1, 0.5568628, 0, 1,
-1.367, -0.07145429, -2.055465, 1, 0.5647059, 0, 1,
-1.366765, 0.510826, -1.961871, 1, 0.5686275, 0, 1,
-1.365647, 0.3515742, -1.376004, 1, 0.5764706, 0, 1,
-1.357005, -0.6747459, -1.141559, 1, 0.5803922, 0, 1,
-1.3535, -2.21239, -4.224464, 1, 0.5882353, 0, 1,
-1.349946, 1.260907, -1.362525, 1, 0.5921569, 0, 1,
-1.341969, 1.275293, -0.09865749, 1, 0.6, 0, 1,
-1.339432, 0.4932967, -1.471803, 1, 0.6078432, 0, 1,
-1.337499, -0.7156705, -2.210265, 1, 0.6117647, 0, 1,
-1.333026, -1.345629, -1.637956, 1, 0.6196079, 0, 1,
-1.328883, -0.1197219, 2.128504, 1, 0.6235294, 0, 1,
-1.325163, 0.06319366, -1.544766, 1, 0.6313726, 0, 1,
-1.324889, -0.9768591, -1.761102, 1, 0.6352941, 0, 1,
-1.32329, 0.01494277, -2.835449, 1, 0.6431373, 0, 1,
-1.322121, 0.6546404, -2.024369, 1, 0.6470588, 0, 1,
-1.321814, 1.294479, 0.2742024, 1, 0.654902, 0, 1,
-1.312859, 0.5413535, -2.570285, 1, 0.6588235, 0, 1,
-1.305284, 0.6978802, -0.7111217, 1, 0.6666667, 0, 1,
-1.291288, -0.3087162, -0.6284297, 1, 0.6705883, 0, 1,
-1.290341, 0.252859, -3.119949, 1, 0.6784314, 0, 1,
-1.284573, -1.377681, -3.837095, 1, 0.682353, 0, 1,
-1.26882, 0.671116, -2.749077, 1, 0.6901961, 0, 1,
-1.267595, -0.7126625, -1.63862, 1, 0.6941177, 0, 1,
-1.260093, 1.508305, -1.220277, 1, 0.7019608, 0, 1,
-1.259074, 0.1329421, -1.688332, 1, 0.7098039, 0, 1,
-1.25792, -0.5570107, -0.3825353, 1, 0.7137255, 0, 1,
-1.255666, 0.1560057, -0.7842322, 1, 0.7215686, 0, 1,
-1.251064, -0.1685887, -0.4512765, 1, 0.7254902, 0, 1,
-1.246604, 0.01548181, -1.7886, 1, 0.7333333, 0, 1,
-1.24476, 2.189169, -1.068445, 1, 0.7372549, 0, 1,
-1.241586, -1.089344, -2.618809, 1, 0.7450981, 0, 1,
-1.240279, 0.03346414, -1.09787, 1, 0.7490196, 0, 1,
-1.238421, 0.4024149, -0.5621705, 1, 0.7568628, 0, 1,
-1.233277, -0.5190908, -1.825722, 1, 0.7607843, 0, 1,
-1.230759, -0.7515427, -2.545927, 1, 0.7686275, 0, 1,
-1.219939, -0.06343984, -2.48508, 1, 0.772549, 0, 1,
-1.21793, -0.4005963, -0.9880174, 1, 0.7803922, 0, 1,
-1.217251, 0.6314256, -0.8398186, 1, 0.7843137, 0, 1,
-1.216727, -0.06771728, -2.302917, 1, 0.7921569, 0, 1,
-1.213888, -0.5896643, -3.721621, 1, 0.7960784, 0, 1,
-1.207287, -0.06651409, -1.879017, 1, 0.8039216, 0, 1,
-1.206162, 0.0380493, 0.8350508, 1, 0.8117647, 0, 1,
-1.205887, -2.514546, -1.906372, 1, 0.8156863, 0, 1,
-1.205123, 0.03849392, -1.364051, 1, 0.8235294, 0, 1,
-1.186409, 1.742884, -0.917469, 1, 0.827451, 0, 1,
-1.183941, -1.747971, -3.33393, 1, 0.8352941, 0, 1,
-1.178017, -1.112143, -2.122803, 1, 0.8392157, 0, 1,
-1.172709, 1.787021, -0.5354332, 1, 0.8470588, 0, 1,
-1.167357, 0.2569839, 1.101329, 1, 0.8509804, 0, 1,
-1.133137, -1.787415, -2.030859, 1, 0.8588235, 0, 1,
-1.130578, 0.4586241, -0.2024114, 1, 0.8627451, 0, 1,
-1.124974, 0.3118062, -2.737914, 1, 0.8705882, 0, 1,
-1.120762, -0.5945783, -1.595088, 1, 0.8745098, 0, 1,
-1.116926, 0.3130255, -0.09562224, 1, 0.8823529, 0, 1,
-1.115037, -0.6581838, -2.238401, 1, 0.8862745, 0, 1,
-1.113209, 1.348488, -1.375061, 1, 0.8941177, 0, 1,
-1.107811, -0.2998128, -0.9133438, 1, 0.8980392, 0, 1,
-1.102673, -0.410302, -1.536671, 1, 0.9058824, 0, 1,
-1.101557, 0.7599164, -2.733481, 1, 0.9137255, 0, 1,
-1.099637, 1.20339, -0.9382724, 1, 0.9176471, 0, 1,
-1.090125, -1.515775, -3.097978, 1, 0.9254902, 0, 1,
-1.085669, -0.09481306, -1.834547, 1, 0.9294118, 0, 1,
-1.082967, -0.6236602, -1.520908, 1, 0.9372549, 0, 1,
-1.078799, 1.227867, -0.9354919, 1, 0.9411765, 0, 1,
-1.076589, 1.421802, -1.044969, 1, 0.9490196, 0, 1,
-1.075371, -1.302743, -2.825671, 1, 0.9529412, 0, 1,
-1.073115, -0.7794074, -2.799944, 1, 0.9607843, 0, 1,
-1.071265, -0.01850417, -1.335246, 1, 0.9647059, 0, 1,
-1.070791, 0.3351448, -3.697079, 1, 0.972549, 0, 1,
-1.070536, -0.4616361, -0.4705205, 1, 0.9764706, 0, 1,
-1.057359, 0.007852941, -3.142895, 1, 0.9843137, 0, 1,
-1.043268, 0.9045299, -2.044396, 1, 0.9882353, 0, 1,
-1.043205, 1.111254, -0.2684712, 1, 0.9960784, 0, 1,
-1.032362, 2.735354, 0.1998307, 0.9960784, 1, 0, 1,
-1.029704, -1.30008, -2.763967, 0.9921569, 1, 0, 1,
-1.02627, 0.1765055, -0.3680747, 0.9843137, 1, 0, 1,
-1.024923, -1.354754, -2.685688, 0.9803922, 1, 0, 1,
-1.024291, 0.6814072, -0.503486, 0.972549, 1, 0, 1,
-1.023178, 0.4929206, -1.661319, 0.9686275, 1, 0, 1,
-1.022727, -0.04462867, 0.2869299, 0.9607843, 1, 0, 1,
-1.021239, 1.149922, -1.99429, 0.9568627, 1, 0, 1,
-1.019512, -2.200759, -3.550255, 0.9490196, 1, 0, 1,
-1.01647, 0.6047539, -1.594568, 0.945098, 1, 0, 1,
-1.004735, -0.9891011, -2.988643, 0.9372549, 1, 0, 1,
-1.004411, -1.21437, -6.033791, 0.9333333, 1, 0, 1,
-0.9979627, -2.567686, -2.683748, 0.9254902, 1, 0, 1,
-0.9957677, 0.1807238, -1.464604, 0.9215686, 1, 0, 1,
-0.9931955, 1.701775, -1.721681, 0.9137255, 1, 0, 1,
-0.9924655, -0.7310369, -2.14668, 0.9098039, 1, 0, 1,
-0.9867839, 1.45102, -0.9906834, 0.9019608, 1, 0, 1,
-0.9825334, -1.092231, -1.409325, 0.8941177, 1, 0, 1,
-0.9809905, 0.5263679, -0.04250173, 0.8901961, 1, 0, 1,
-0.9745709, -0.9979463, -2.867269, 0.8823529, 1, 0, 1,
-0.9703513, 1.491111, -0.4571891, 0.8784314, 1, 0, 1,
-0.9690128, -0.04311521, 0.4294305, 0.8705882, 1, 0, 1,
-0.9689048, 0.1577716, 1.036865, 0.8666667, 1, 0, 1,
-0.9679142, -0.7340949, -1.546733, 0.8588235, 1, 0, 1,
-0.9660937, -1.783096, -4.644884, 0.854902, 1, 0, 1,
-0.9635113, 0.2259313, 0.06872634, 0.8470588, 1, 0, 1,
-0.962068, 0.7941543, 0.05934201, 0.8431373, 1, 0, 1,
-0.9581924, 0.2685653, -2.160058, 0.8352941, 1, 0, 1,
-0.9521908, -0.1298115, 0.5281315, 0.8313726, 1, 0, 1,
-0.9499125, -0.1686143, -2.537034, 0.8235294, 1, 0, 1,
-0.9467739, 1.043416, -0.8785717, 0.8196079, 1, 0, 1,
-0.9438523, 1.46287, -0.7451327, 0.8117647, 1, 0, 1,
-0.9430421, 0.5936107, -0.9446765, 0.8078431, 1, 0, 1,
-0.928153, -0.2243146, -1.870118, 0.8, 1, 0, 1,
-0.9180784, -0.3810044, -1.675335, 0.7921569, 1, 0, 1,
-0.9115209, 0.5057017, -2.763821, 0.7882353, 1, 0, 1,
-0.9109796, -0.9724275, -3.148685, 0.7803922, 1, 0, 1,
-0.9080563, -0.6342493, -1.622701, 0.7764706, 1, 0, 1,
-0.907648, 0.5204735, -1.214638, 0.7686275, 1, 0, 1,
-0.9034038, 0.6118532, -1.690112, 0.7647059, 1, 0, 1,
-0.8945889, -0.7092203, 0.4788141, 0.7568628, 1, 0, 1,
-0.8906915, -1.349828, -4.520529, 0.7529412, 1, 0, 1,
-0.8899504, 0.2635106, -1.240075, 0.7450981, 1, 0, 1,
-0.8811808, -2.389199, -2.402362, 0.7411765, 1, 0, 1,
-0.870374, -1.714754, -4.016495, 0.7333333, 1, 0, 1,
-0.8693022, 0.3799175, -2.325434, 0.7294118, 1, 0, 1,
-0.8692879, -0.07916305, -2.52735, 0.7215686, 1, 0, 1,
-0.86761, -2.2469, -3.256621, 0.7176471, 1, 0, 1,
-0.867283, -0.1269569, -2.363235, 0.7098039, 1, 0, 1,
-0.8538986, -0.4790671, -2.12755, 0.7058824, 1, 0, 1,
-0.8536767, 0.426126, 0.722248, 0.6980392, 1, 0, 1,
-0.8419331, -0.5112616, -2.788594, 0.6901961, 1, 0, 1,
-0.8388404, 0.1854725, -1.322279, 0.6862745, 1, 0, 1,
-0.8349388, -0.9413036, -3.822005, 0.6784314, 1, 0, 1,
-0.8332726, -0.8429783, -2.437288, 0.6745098, 1, 0, 1,
-0.8307685, 1.645577, 0.4685087, 0.6666667, 1, 0, 1,
-0.8279861, -0.9610822, -3.259808, 0.6627451, 1, 0, 1,
-0.8259462, -0.6177284, -3.362884, 0.654902, 1, 0, 1,
-0.8177259, -0.6913228, -2.678016, 0.6509804, 1, 0, 1,
-0.8136848, 0.1421529, -1.259369, 0.6431373, 1, 0, 1,
-0.8111157, 0.6742224, 0.05087403, 0.6392157, 1, 0, 1,
-0.8095436, 0.7968125, 0.372332, 0.6313726, 1, 0, 1,
-0.80628, -1.380921, -2.029663, 0.627451, 1, 0, 1,
-0.7904685, 0.6047182, -1.6734, 0.6196079, 1, 0, 1,
-0.7879829, 2.186816, -0.4056559, 0.6156863, 1, 0, 1,
-0.78136, 0.3719514, -3.369067, 0.6078432, 1, 0, 1,
-0.7751256, -0.4975175, -2.077301, 0.6039216, 1, 0, 1,
-0.7719467, -0.1891271, -1.790665, 0.5960785, 1, 0, 1,
-0.771089, -1.727708, -3.85981, 0.5882353, 1, 0, 1,
-0.7705316, -0.6354955, -1.563788, 0.5843138, 1, 0, 1,
-0.7621496, 0.1614351, -2.71727, 0.5764706, 1, 0, 1,
-0.7607108, -1.611946, -3.743052, 0.572549, 1, 0, 1,
-0.7594337, 2.527058, -1.875251, 0.5647059, 1, 0, 1,
-0.7578763, -2.624665, -2.119366, 0.5607843, 1, 0, 1,
-0.7540783, 1.445633, 0.5316973, 0.5529412, 1, 0, 1,
-0.7522754, -1.062685, -3.304472, 0.5490196, 1, 0, 1,
-0.751791, -1.435433, -3.156717, 0.5411765, 1, 0, 1,
-0.7496557, -0.008529844, -1.13549, 0.5372549, 1, 0, 1,
-0.7464263, -0.3236808, 0.3761263, 0.5294118, 1, 0, 1,
-0.745447, 0.3074358, -0.3738574, 0.5254902, 1, 0, 1,
-0.7440715, -0.364814, -1.604743, 0.5176471, 1, 0, 1,
-0.7412417, -0.7396845, -2.491407, 0.5137255, 1, 0, 1,
-0.7408258, 0.7704741, -1.127388, 0.5058824, 1, 0, 1,
-0.7364802, -0.8106321, -0.6205475, 0.5019608, 1, 0, 1,
-0.7326317, 0.8253047, -0.5531971, 0.4941176, 1, 0, 1,
-0.7311601, -0.3384801, -2.642674, 0.4862745, 1, 0, 1,
-0.725678, 1.332275, -0.6813061, 0.4823529, 1, 0, 1,
-0.7209089, 0.9247898, -0.2987882, 0.4745098, 1, 0, 1,
-0.7205008, -0.06372798, -2.445662, 0.4705882, 1, 0, 1,
-0.7201121, -0.2917356, 0.0391327, 0.4627451, 1, 0, 1,
-0.7180574, -0.747914, -3.55083, 0.4588235, 1, 0, 1,
-0.7138665, -1.125266, -2.049072, 0.4509804, 1, 0, 1,
-0.6999127, 0.2452196, -1.844758, 0.4470588, 1, 0, 1,
-0.6974782, 0.8485306, 0.8311767, 0.4392157, 1, 0, 1,
-0.6967822, 0.5196545, -3.070287, 0.4352941, 1, 0, 1,
-0.6946893, -0.5005217, -1.604101, 0.427451, 1, 0, 1,
-0.6924019, 0.7350358, -1.999565, 0.4235294, 1, 0, 1,
-0.691411, 0.6387217, -1.939978, 0.4156863, 1, 0, 1,
-0.6895757, 0.2356265, -2.289984, 0.4117647, 1, 0, 1,
-0.6891742, 0.6431918, 2.300052, 0.4039216, 1, 0, 1,
-0.6862141, 0.009147322, -0.8818004, 0.3960784, 1, 0, 1,
-0.6858294, 1.136825, 0.3552126, 0.3921569, 1, 0, 1,
-0.6851748, 1.380308, -0.9298944, 0.3843137, 1, 0, 1,
-0.6842891, 0.7960469, 0.8353754, 0.3803922, 1, 0, 1,
-0.6812311, -0.9906094, -1.696869, 0.372549, 1, 0, 1,
-0.681118, -0.09686509, -1.107255, 0.3686275, 1, 0, 1,
-0.6773477, 0.6145412, -0.8246704, 0.3607843, 1, 0, 1,
-0.6764833, 0.8225242, -0.3382221, 0.3568628, 1, 0, 1,
-0.66637, -0.4699786, -2.15775, 0.3490196, 1, 0, 1,
-0.6661015, 0.4692908, -0.1158388, 0.345098, 1, 0, 1,
-0.6485615, 0.2506742, -0.01715225, 0.3372549, 1, 0, 1,
-0.6465148, -0.3251683, -2.579822, 0.3333333, 1, 0, 1,
-0.6461836, -0.4226428, -0.7941929, 0.3254902, 1, 0, 1,
-0.6450297, 1.239412, 0.8807734, 0.3215686, 1, 0, 1,
-0.6448022, 0.7960815, -0.1654841, 0.3137255, 1, 0, 1,
-0.6439809, -0.7746552, -4.178913, 0.3098039, 1, 0, 1,
-0.6311123, 0.2458186, -1.776913, 0.3019608, 1, 0, 1,
-0.6269268, 1.436266, -0.8203624, 0.2941177, 1, 0, 1,
-0.6209588, -0.3507784, -0.7292577, 0.2901961, 1, 0, 1,
-0.6173965, 0.4037597, -1.047865, 0.282353, 1, 0, 1,
-0.6166797, 0.3059981, 0.1130566, 0.2784314, 1, 0, 1,
-0.6162277, 1.373011, -1.718808, 0.2705882, 1, 0, 1,
-0.6136523, -0.2978675, -1.841835, 0.2666667, 1, 0, 1,
-0.6129684, 0.01645286, -0.9941019, 0.2588235, 1, 0, 1,
-0.6099026, -0.558382, -0.6947047, 0.254902, 1, 0, 1,
-0.6087933, -0.3701139, -3.303699, 0.2470588, 1, 0, 1,
-0.6035099, -0.9780775, -2.715158, 0.2431373, 1, 0, 1,
-0.6026713, 0.3990767, -0.617463, 0.2352941, 1, 0, 1,
-0.6016372, -0.05182836, -3.228865, 0.2313726, 1, 0, 1,
-0.6011595, -0.655628, -2.784686, 0.2235294, 1, 0, 1,
-0.5973579, -1.767494, -2.120787, 0.2196078, 1, 0, 1,
-0.5961204, -1.931517, -2.721968, 0.2117647, 1, 0, 1,
-0.5936176, -0.7199323, -3.184605, 0.2078431, 1, 0, 1,
-0.5934194, -0.6870523, -2.037884, 0.2, 1, 0, 1,
-0.5929037, 0.2179832, -0.4233144, 0.1921569, 1, 0, 1,
-0.591845, 0.3047808, -2.120383, 0.1882353, 1, 0, 1,
-0.591809, -0.5953978, -1.935077, 0.1803922, 1, 0, 1,
-0.5838886, -0.4536873, -2.12588, 0.1764706, 1, 0, 1,
-0.582776, 1.876007, 0.2622781, 0.1686275, 1, 0, 1,
-0.5688976, -0.9018336, -1.741277, 0.1647059, 1, 0, 1,
-0.56799, 1.429428, 0.2448952, 0.1568628, 1, 0, 1,
-0.567636, -1.174666, -4.038929, 0.1529412, 1, 0, 1,
-0.5648455, -0.4626235, -3.024461, 0.145098, 1, 0, 1,
-0.564419, -0.8441537, -3.156381, 0.1411765, 1, 0, 1,
-0.5639536, 0.4705646, -2.254462, 0.1333333, 1, 0, 1,
-0.5627129, 0.2170091, -0.4572901, 0.1294118, 1, 0, 1,
-0.5609812, -0.3885378, -0.7806252, 0.1215686, 1, 0, 1,
-0.5608748, 0.9995048, 0.2699282, 0.1176471, 1, 0, 1,
-0.5589901, -1.308343, -0.4006095, 0.1098039, 1, 0, 1,
-0.5521639, -0.03397075, -1.045169, 0.1058824, 1, 0, 1,
-0.5474446, -0.3116757, -2.171017, 0.09803922, 1, 0, 1,
-0.5435625, -1.078376, -1.771575, 0.09019608, 1, 0, 1,
-0.5416134, -0.3600773, -2.768885, 0.08627451, 1, 0, 1,
-0.5408725, -0.5748803, -2.500988, 0.07843138, 1, 0, 1,
-0.5403858, -0.3486928, -2.905929, 0.07450981, 1, 0, 1,
-0.539531, -1.039213, -3.933142, 0.06666667, 1, 0, 1,
-0.5376254, 0.06683503, -1.94367, 0.0627451, 1, 0, 1,
-0.5367686, 1.624977, -0.5168962, 0.05490196, 1, 0, 1,
-0.5326903, -0.7438307, -2.228539, 0.05098039, 1, 0, 1,
-0.532096, -0.8490202, -2.224686, 0.04313726, 1, 0, 1,
-0.5320722, 1.395193, -0.6723346, 0.03921569, 1, 0, 1,
-0.5297136, 1.149479, 0.1447724, 0.03137255, 1, 0, 1,
-0.5203863, -0.5571089, -2.8752, 0.02745098, 1, 0, 1,
-0.5195193, 1.403908, 1.268096, 0.01960784, 1, 0, 1,
-0.5190981, 0.3749543, -1.273592, 0.01568628, 1, 0, 1,
-0.5184188, 0.6864147, 0.6566342, 0.007843138, 1, 0, 1,
-0.5123193, -0.6359934, -3.141191, 0.003921569, 1, 0, 1,
-0.5091122, -0.3719801, -1.320846, 0, 1, 0.003921569, 1,
-0.5082406, 0.5480675, -1.143443, 0, 1, 0.01176471, 1,
-0.5075454, -0.1025984, -2.180653, 0, 1, 0.01568628, 1,
-0.5073237, -1.277792, -5.104736, 0, 1, 0.02352941, 1,
-0.5046375, 2.811251, -0.08981541, 0, 1, 0.02745098, 1,
-0.5013713, -1.059427, -3.073406, 0, 1, 0.03529412, 1,
-0.4937691, -0.287593, -1.789917, 0, 1, 0.03921569, 1,
-0.4879385, 0.2874085, -0.8540448, 0, 1, 0.04705882, 1,
-0.4829712, 1.342129, -1.797728, 0, 1, 0.05098039, 1,
-0.4826272, -0.6609575, -2.536496, 0, 1, 0.05882353, 1,
-0.4819583, 1.838226, 0.8375562, 0, 1, 0.0627451, 1,
-0.4813141, 1.005711, -1.25333, 0, 1, 0.07058824, 1,
-0.479594, 0.5694529, -1.282679, 0, 1, 0.07450981, 1,
-0.4794526, -0.2936232, -3.624021, 0, 1, 0.08235294, 1,
-0.4744719, 0.2990054, -2.330885, 0, 1, 0.08627451, 1,
-0.4689736, -0.2019024, -2.050833, 0, 1, 0.09411765, 1,
-0.4686058, 3.075896, -0.1649204, 0, 1, 0.1019608, 1,
-0.4685127, -0.3660528, -0.4680111, 0, 1, 0.1058824, 1,
-0.4657789, 0.3165501, -0.1224818, 0, 1, 0.1137255, 1,
-0.4636301, 1.08031, 0.6507669, 0, 1, 0.1176471, 1,
-0.463047, 0.146694, -1.528956, 0, 1, 0.1254902, 1,
-0.4610198, 1.761507, 1.289648, 0, 1, 0.1294118, 1,
-0.460192, -0.8872471, -2.46664, 0, 1, 0.1372549, 1,
-0.4548011, -0.3930343, -4.399861, 0, 1, 0.1411765, 1,
-0.4475685, 0.1304304, -1.241988, 0, 1, 0.1490196, 1,
-0.444833, -0.2149831, -1.099612, 0, 1, 0.1529412, 1,
-0.442111, -0.8360288, -2.204506, 0, 1, 0.1607843, 1,
-0.4392399, 0.6875039, 0.4284514, 0, 1, 0.1647059, 1,
-0.4365494, 0.005805151, -2.438774, 0, 1, 0.172549, 1,
-0.4352043, 1.658162, -0.08015156, 0, 1, 0.1764706, 1,
-0.4321513, 0.7697709, 0.5243859, 0, 1, 0.1843137, 1,
-0.4312454, 2.062853, -1.749189, 0, 1, 0.1882353, 1,
-0.4310078, 0.4077232, -1.377316, 0, 1, 0.1960784, 1,
-0.4282075, 0.5380776, -0.8770388, 0, 1, 0.2039216, 1,
-0.4240088, -0.2810465, -4.145685, 0, 1, 0.2078431, 1,
-0.423493, 1.083437, 0.6193689, 0, 1, 0.2156863, 1,
-0.4195351, -0.516368, -2.892533, 0, 1, 0.2196078, 1,
-0.4190586, -0.9749945, -5.234456, 0, 1, 0.227451, 1,
-0.4168918, -0.01072001, -1.442474, 0, 1, 0.2313726, 1,
-0.4167206, -0.622521, -1.249393, 0, 1, 0.2392157, 1,
-0.414801, -0.8868578, -2.027511, 0, 1, 0.2431373, 1,
-0.411076, -0.137606, -3.807683, 0, 1, 0.2509804, 1,
-0.4108734, -1.196648, -0.8235662, 0, 1, 0.254902, 1,
-0.4096221, -0.5790796, -1.759548, 0, 1, 0.2627451, 1,
-0.4089753, -0.1702928, -1.481057, 0, 1, 0.2666667, 1,
-0.4087015, -1.888597, -2.392043, 0, 1, 0.2745098, 1,
-0.4054277, -0.1710702, -0.7940532, 0, 1, 0.2784314, 1,
-0.4021332, -0.3933956, -2.588748, 0, 1, 0.2862745, 1,
-0.399619, 0.2360274, -2.313114, 0, 1, 0.2901961, 1,
-0.3956211, 1.098137, 0.6005481, 0, 1, 0.2980392, 1,
-0.3906446, 0.1012353, -2.39746, 0, 1, 0.3058824, 1,
-0.3888659, -0.3068314, -3.865147, 0, 1, 0.3098039, 1,
-0.3870579, -0.1892817, -1.455845, 0, 1, 0.3176471, 1,
-0.3833368, 0.2104705, -2.354589, 0, 1, 0.3215686, 1,
-0.3814465, 1.98983, -0.8523087, 0, 1, 0.3294118, 1,
-0.3788379, -1.319307, -5.019969, 0, 1, 0.3333333, 1,
-0.3759083, -0.8586233, -3.524556, 0, 1, 0.3411765, 1,
-0.3747998, 2.102292, 0.004718177, 0, 1, 0.345098, 1,
-0.374744, -1.30357, -2.347223, 0, 1, 0.3529412, 1,
-0.3728215, 1.106522, 0.7118923, 0, 1, 0.3568628, 1,
-0.3716952, -0.3912143, -3.214328, 0, 1, 0.3647059, 1,
-0.3628636, -0.2371316, -0.8234572, 0, 1, 0.3686275, 1,
-0.3622279, -0.7709337, -3.496159, 0, 1, 0.3764706, 1,
-0.357934, -1.080636, -1.632441, 0, 1, 0.3803922, 1,
-0.3492351, -0.5880467, -2.355692, 0, 1, 0.3882353, 1,
-0.3475408, -0.9431574, -2.195268, 0, 1, 0.3921569, 1,
-0.3328276, 0.2565836, -2.473169, 0, 1, 0.4, 1,
-0.3239837, -0.1912751, -1.400578, 0, 1, 0.4078431, 1,
-0.3200744, 0.02634715, -2.358695, 0, 1, 0.4117647, 1,
-0.3142075, 1.497452, 1.859521, 0, 1, 0.4196078, 1,
-0.3084123, -0.7608011, -2.734786, 0, 1, 0.4235294, 1,
-0.3084075, 0.6215905, 0.7642009, 0, 1, 0.4313726, 1,
-0.3071939, 0.7183853, 1.116044, 0, 1, 0.4352941, 1,
-0.3055385, 1.24968, -2.21253, 0, 1, 0.4431373, 1,
-0.3046785, -0.08311433, -4.624095, 0, 1, 0.4470588, 1,
-0.3039888, 0.25359, -2.271895, 0, 1, 0.454902, 1,
-0.3035742, -0.6709518, -1.288326, 0, 1, 0.4588235, 1,
-0.3025425, 0.9014466, -0.5743039, 0, 1, 0.4666667, 1,
-0.3016124, 2.807573, -0.9463862, 0, 1, 0.4705882, 1,
-0.2996627, -0.3253876, -2.620073, 0, 1, 0.4784314, 1,
-0.2990345, 0.795558, -0.9862952, 0, 1, 0.4823529, 1,
-0.2954091, -1.08521, -3.093965, 0, 1, 0.4901961, 1,
-0.2879854, 0.6498168, 0.07424852, 0, 1, 0.4941176, 1,
-0.2877873, -0.157265, -2.558171, 0, 1, 0.5019608, 1,
-0.2863231, 1.690392, 0.8028772, 0, 1, 0.509804, 1,
-0.2822372, 1.140106, -1.108937, 0, 1, 0.5137255, 1,
-0.2758017, -1.050678, -2.191513, 0, 1, 0.5215687, 1,
-0.2564884, -0.08763953, -1.708404, 0, 1, 0.5254902, 1,
-0.253629, -0.6533952, -0.7008681, 0, 1, 0.5333334, 1,
-0.2489085, -0.2253705, -2.309132, 0, 1, 0.5372549, 1,
-0.2478536, 1.655267, 1.749527, 0, 1, 0.5450981, 1,
-0.2466182, 0.2998469, -0.8510794, 0, 1, 0.5490196, 1,
-0.2466125, -0.4200099, -2.005887, 0, 1, 0.5568628, 1,
-0.2463801, 0.06617534, 1.12184, 0, 1, 0.5607843, 1,
-0.2413149, 0.5056822, -1.900239, 0, 1, 0.5686275, 1,
-0.2412617, -0.4416082, -4.391004, 0, 1, 0.572549, 1,
-0.2392735, -0.8147715, -3.789508, 0, 1, 0.5803922, 1,
-0.2378273, 0.1923949, -0.0009749451, 0, 1, 0.5843138, 1,
-0.2304069, 0.2285256, 0.7787077, 0, 1, 0.5921569, 1,
-0.226467, 0.3280198, -1.015691, 0, 1, 0.5960785, 1,
-0.2253773, 0.5785103, 0.05190182, 0, 1, 0.6039216, 1,
-0.2176066, -0.290007, -3.860414, 0, 1, 0.6117647, 1,
-0.2164712, 1.203739, 1.203699, 0, 1, 0.6156863, 1,
-0.2160359, -0.06695522, -1.394704, 0, 1, 0.6235294, 1,
-0.2158369, 1.227493, -1.071273, 0, 1, 0.627451, 1,
-0.2123055, -1.986847, -4.240297, 0, 1, 0.6352941, 1,
-0.2100423, -2.406896, -3.646943, 0, 1, 0.6392157, 1,
-0.2091897, -0.8737549, -1.795483, 0, 1, 0.6470588, 1,
-0.2085503, 0.004018292, -2.022325, 0, 1, 0.6509804, 1,
-0.2073393, 1.029841, -0.7117701, 0, 1, 0.6588235, 1,
-0.2011594, 0.1131938, -1.941686, 0, 1, 0.6627451, 1,
-0.1994189, -0.3916441, -2.411593, 0, 1, 0.6705883, 1,
-0.1937848, -0.09748337, -2.121726, 0, 1, 0.6745098, 1,
-0.193727, -0.02121529, -0.6531707, 0, 1, 0.682353, 1,
-0.1831216, -1.042407, -2.044594, 0, 1, 0.6862745, 1,
-0.1831179, -0.6493931, -2.336784, 0, 1, 0.6941177, 1,
-0.1823521, -0.6812972, -1.315056, 0, 1, 0.7019608, 1,
-0.1765128, -1.100426, -3.019722, 0, 1, 0.7058824, 1,
-0.1763145, -1.573298, -2.333625, 0, 1, 0.7137255, 1,
-0.1739029, 0.08249383, -0.646188, 0, 1, 0.7176471, 1,
-0.1732356, -1.119109, -3.029602, 0, 1, 0.7254902, 1,
-0.1730069, 1.050917, 0.5078848, 0, 1, 0.7294118, 1,
-0.1677049, -0.1474955, -3.223435, 0, 1, 0.7372549, 1,
-0.1572132, 0.5966104, 0.3123043, 0, 1, 0.7411765, 1,
-0.1540547, -0.8466665, -3.298284, 0, 1, 0.7490196, 1,
-0.1418465, 0.1276857, -2.890808, 0, 1, 0.7529412, 1,
-0.1399076, -0.08947711, -2.33868, 0, 1, 0.7607843, 1,
-0.1382244, -1.484072, -3.729834, 0, 1, 0.7647059, 1,
-0.1354387, -0.81656, -3.765917, 0, 1, 0.772549, 1,
-0.1268873, -0.6180017, -1.818759, 0, 1, 0.7764706, 1,
-0.1222258, -0.4254877, -3.822811, 0, 1, 0.7843137, 1,
-0.1194396, -0.8685467, -1.812162, 0, 1, 0.7882353, 1,
-0.1131555, -0.5268355, -5.119589, 0, 1, 0.7960784, 1,
-0.1130634, -0.611223, -2.973944, 0, 1, 0.8039216, 1,
-0.1114023, 0.6360845, -0.02823016, 0, 1, 0.8078431, 1,
-0.1112056, 0.3924419, 0.3143847, 0, 1, 0.8156863, 1,
-0.105514, 1.057008, 0.6097685, 0, 1, 0.8196079, 1,
-0.1047853, 0.5583337, -1.889984, 0, 1, 0.827451, 1,
-0.1043057, -1.881522, -2.932791, 0, 1, 0.8313726, 1,
-0.0984334, 0.3066004, 0.3576528, 0, 1, 0.8392157, 1,
-0.09468977, -0.5686858, -3.489287, 0, 1, 0.8431373, 1,
-0.093698, 0.7930096, 0.8669476, 0, 1, 0.8509804, 1,
-0.08722007, -0.8734006, -3.443583, 0, 1, 0.854902, 1,
-0.08410254, 1.21322, -2.664236, 0, 1, 0.8627451, 1,
-0.07500623, 1.59889, -0.2602271, 0, 1, 0.8666667, 1,
-0.07408775, -1.309219, -3.30863, 0, 1, 0.8745098, 1,
-0.07357424, -1.619296, -2.030374, 0, 1, 0.8784314, 1,
-0.06780921, 1.09547, 1.251096, 0, 1, 0.8862745, 1,
-0.06768612, -0.8420385, -3.560168, 0, 1, 0.8901961, 1,
-0.06518327, -0.8506038, -0.985809, 0, 1, 0.8980392, 1,
-0.0629212, -0.1092736, -3.529766, 0, 1, 0.9058824, 1,
-0.06189962, -1.890277, -2.650349, 0, 1, 0.9098039, 1,
-0.06095555, -0.3278065, -2.845489, 0, 1, 0.9176471, 1,
-0.0607908, -0.9453942, -2.671219, 0, 1, 0.9215686, 1,
-0.0599828, 0.3254318, 0.5772312, 0, 1, 0.9294118, 1,
-0.05899617, 0.05230698, -0.2166116, 0, 1, 0.9333333, 1,
-0.05755675, 0.0110232, -1.219994, 0, 1, 0.9411765, 1,
-0.05566097, 0.01895431, -0.7802094, 0, 1, 0.945098, 1,
-0.05533006, -0.6784562, -1.261758, 0, 1, 0.9529412, 1,
-0.05530986, 0.3418913, -1.433776, 0, 1, 0.9568627, 1,
-0.05267715, 0.1946516, -2.708039, 0, 1, 0.9647059, 1,
-0.05035701, 0.8785728, 0.4101002, 0, 1, 0.9686275, 1,
-0.0492049, 0.6899707, 0.2678367, 0, 1, 0.9764706, 1,
-0.04381618, 0.2531027, -1.145839, 0, 1, 0.9803922, 1,
-0.04296803, 1.760482, 0.3621992, 0, 1, 0.9882353, 1,
-0.04239189, 0.3665373, 0.1937124, 0, 1, 0.9921569, 1,
-0.03810206, -1.439029, -3.583142, 0, 1, 1, 1,
-0.03802792, 0.7579885, 0.1440004, 0, 0.9921569, 1, 1,
-0.03527401, 1.123682, 0.4079934, 0, 0.9882353, 1, 1,
-0.03493642, -0.5169867, -2.950388, 0, 0.9803922, 1, 1,
-0.03493362, -1.06067, -4.0304, 0, 0.9764706, 1, 1,
-0.03341867, 1.959433, 0.337609, 0, 0.9686275, 1, 1,
-0.02815937, -1.488561, -4.068914, 0, 0.9647059, 1, 1,
-0.02804899, 0.5308368, -0.3220835, 0, 0.9568627, 1, 1,
-0.02655853, -0.5379393, -2.658199, 0, 0.9529412, 1, 1,
-0.02618865, 0.6074526, 0.760999, 0, 0.945098, 1, 1,
-0.02569813, -0.9439147, -3.122865, 0, 0.9411765, 1, 1,
-0.02538204, -1.684071, -4.458203, 0, 0.9333333, 1, 1,
-0.02458595, 1.537725, 1.894071, 0, 0.9294118, 1, 1,
-0.02173094, 1.190444, -0.0688602, 0, 0.9215686, 1, 1,
-0.02120706, -0.602932, -2.902034, 0, 0.9176471, 1, 1,
-0.02105766, 0.3939668, 0.02921561, 0, 0.9098039, 1, 1,
-0.02051749, -0.5583664, -2.621579, 0, 0.9058824, 1, 1,
-0.01889143, 2.367507, 0.8692886, 0, 0.8980392, 1, 1,
-0.01782322, -1.717649, -3.955356, 0, 0.8901961, 1, 1,
-0.01711627, 0.3506311, -2.273425, 0, 0.8862745, 1, 1,
-0.01562704, 0.2389632, -0.09172931, 0, 0.8784314, 1, 1,
-0.0126844, -0.6344109, -2.082493, 0, 0.8745098, 1, 1,
-0.002232217, -2.124765, -4.040609, 0, 0.8666667, 1, 1,
-0.001120504, 0.01648796, 2.068238, 0, 0.8627451, 1, 1,
0.002164155, 0.1178008, 0.2534427, 0, 0.854902, 1, 1,
0.002308717, 0.1147243, -0.660744, 0, 0.8509804, 1, 1,
0.007816252, 0.06809255, -0.4213651, 0, 0.8431373, 1, 1,
0.009878309, -1.030258, 1.281511, 0, 0.8392157, 1, 1,
0.01274716, -0.3031005, 2.478125, 0, 0.8313726, 1, 1,
0.0154668, 0.5582218, -1.034181, 0, 0.827451, 1, 1,
0.01639857, -0.1152133, 3.166931, 0, 0.8196079, 1, 1,
0.01901107, 0.2155723, 0.4648473, 0, 0.8156863, 1, 1,
0.02400759, 0.2000881, 0.2705237, 0, 0.8078431, 1, 1,
0.02472563, 1.292634, -0.4607083, 0, 0.8039216, 1, 1,
0.0267521, 0.6143272, -0.6890512, 0, 0.7960784, 1, 1,
0.02693915, 0.7359802, 0.4076859, 0, 0.7882353, 1, 1,
0.02705456, -0.9375173, 2.737715, 0, 0.7843137, 1, 1,
0.03262304, -0.9910524, 1.738604, 0, 0.7764706, 1, 1,
0.03439964, -0.7996067, 3.316288, 0, 0.772549, 1, 1,
0.04077762, -0.317958, 3.808652, 0, 0.7647059, 1, 1,
0.04281679, 0.03230703, -0.07520702, 0, 0.7607843, 1, 1,
0.04581993, -0.1375092, 3.441165, 0, 0.7529412, 1, 1,
0.04599786, -1.032482, 3.687023, 0, 0.7490196, 1, 1,
0.04602941, -1.893857, 3.538781, 0, 0.7411765, 1, 1,
0.0469883, -0.6864688, 4.478003, 0, 0.7372549, 1, 1,
0.04863074, -0.6032667, 4.32994, 0, 0.7294118, 1, 1,
0.05017686, 0.2348973, -0.9002627, 0, 0.7254902, 1, 1,
0.05164277, 0.2179162, 1.443348, 0, 0.7176471, 1, 1,
0.05438001, -0.06166898, 2.717895, 0, 0.7137255, 1, 1,
0.05554069, -2.566536, 3.165598, 0, 0.7058824, 1, 1,
0.05682756, 0.4873947, -0.06503415, 0, 0.6980392, 1, 1,
0.05948287, 1.239407, -1.104732, 0, 0.6941177, 1, 1,
0.06057514, -0.809289, 2.55771, 0, 0.6862745, 1, 1,
0.06396857, -0.06403541, 2.517428, 0, 0.682353, 1, 1,
0.06422164, 1.514281, 0.5461086, 0, 0.6745098, 1, 1,
0.07169899, 0.5991468, -0.5421459, 0, 0.6705883, 1, 1,
0.08517921, -0.06380876, 2.540307, 0, 0.6627451, 1, 1,
0.08702751, -0.6954535, 3.579455, 0, 0.6588235, 1, 1,
0.08743116, 0.2308706, -1.233372, 0, 0.6509804, 1, 1,
0.09065257, -0.6808914, 2.199041, 0, 0.6470588, 1, 1,
0.09396524, 0.5621393, 0.4143385, 0, 0.6392157, 1, 1,
0.0953258, -0.7288204, 2.769623, 0, 0.6352941, 1, 1,
0.09913809, -1.105069, 2.000053, 0, 0.627451, 1, 1,
0.09982224, 0.4934587, -1.611842, 0, 0.6235294, 1, 1,
0.1011712, -0.3628064, 2.931785, 0, 0.6156863, 1, 1,
0.1047415, -0.4031076, 4.648428, 0, 0.6117647, 1, 1,
0.1061776, 0.4610759, 0.3576957, 0, 0.6039216, 1, 1,
0.1069183, 0.9877204, 2.026448, 0, 0.5960785, 1, 1,
0.107305, 0.2307667, 2.810482, 0, 0.5921569, 1, 1,
0.1087419, -0.4860121, 2.070842, 0, 0.5843138, 1, 1,
0.1101654, 0.8101732, 0.005978405, 0, 0.5803922, 1, 1,
0.1119466, 0.2589489, 1.940531, 0, 0.572549, 1, 1,
0.1124493, -0.7352139, 4.162441, 0, 0.5686275, 1, 1,
0.1131402, -1.099777, 2.498425, 0, 0.5607843, 1, 1,
0.1172337, 0.5206968, -2.041068, 0, 0.5568628, 1, 1,
0.1205756, 0.2852944, 1.788542, 0, 0.5490196, 1, 1,
0.1220965, 0.7718568, -1.573642, 0, 0.5450981, 1, 1,
0.1331957, -1.721421, 4.290381, 0, 0.5372549, 1, 1,
0.1356938, -0.4941654, 2.393311, 0, 0.5333334, 1, 1,
0.1387445, -1.090998, 2.66738, 0, 0.5254902, 1, 1,
0.1452865, 1.078861, -0.074779, 0, 0.5215687, 1, 1,
0.1488505, -1.626681, 2.58332, 0, 0.5137255, 1, 1,
0.1516593, -1.612399, 4.962783, 0, 0.509804, 1, 1,
0.1634212, -0.6780756, 2.443533, 0, 0.5019608, 1, 1,
0.164393, -0.404799, 2.575713, 0, 0.4941176, 1, 1,
0.1646438, 0.1913307, -0.8694378, 0, 0.4901961, 1, 1,
0.1653546, -0.9266255, 2.84243, 0, 0.4823529, 1, 1,
0.1654033, 0.8552051, 0.5602504, 0, 0.4784314, 1, 1,
0.1733956, -0.9731795, 2.141089, 0, 0.4705882, 1, 1,
0.1775039, 0.7369473, 2.216684, 0, 0.4666667, 1, 1,
0.1804787, 0.06330158, 2.400858, 0, 0.4588235, 1, 1,
0.1824159, 0.3783335, -1.314384, 0, 0.454902, 1, 1,
0.1848229, 0.6935719, 0.2360467, 0, 0.4470588, 1, 1,
0.1861845, -0.7530524, 4.24286, 0, 0.4431373, 1, 1,
0.1910432, 0.1429432, 1.312762, 0, 0.4352941, 1, 1,
0.1925385, -0.5016565, 1.552342, 0, 0.4313726, 1, 1,
0.1960099, -1.61109, 2.972608, 0, 0.4235294, 1, 1,
0.1973285, 0.7601424, -0.5696031, 0, 0.4196078, 1, 1,
0.2016602, -0.3661372, 2.33669, 0, 0.4117647, 1, 1,
0.2019606, 0.3250813, 2.242976, 0, 0.4078431, 1, 1,
0.2038061, 1.788262, 1.046004, 0, 0.4, 1, 1,
0.2071397, 0.1870673, 0.6838822, 0, 0.3921569, 1, 1,
0.2078437, -1.039428, 2.427944, 0, 0.3882353, 1, 1,
0.21253, -0.2868795, 2.248175, 0, 0.3803922, 1, 1,
0.2160592, -0.03309867, 1.130025, 0, 0.3764706, 1, 1,
0.2183986, -1.550149, 2.287816, 0, 0.3686275, 1, 1,
0.22486, -1.169413, 2.696652, 0, 0.3647059, 1, 1,
0.2298849, -1.13473, 0.6055743, 0, 0.3568628, 1, 1,
0.2314902, -0.08158322, 2.389954, 0, 0.3529412, 1, 1,
0.2355341, -1.003381, 3.198895, 0, 0.345098, 1, 1,
0.2358809, 0.03791694, -0.5131529, 0, 0.3411765, 1, 1,
0.2366376, -0.3947297, 1.713736, 0, 0.3333333, 1, 1,
0.2384119, 0.3138784, 1.681152, 0, 0.3294118, 1, 1,
0.2412814, 0.4736059, -1.717929, 0, 0.3215686, 1, 1,
0.2422456, 1.100188, 1.112246, 0, 0.3176471, 1, 1,
0.2457687, 0.3949641, 0.6276916, 0, 0.3098039, 1, 1,
0.2458342, -0.9059995, 1.619582, 0, 0.3058824, 1, 1,
0.2479798, 0.4957787, 1.667118, 0, 0.2980392, 1, 1,
0.2518887, 0.1623119, 0.01015654, 0, 0.2901961, 1, 1,
0.2545728, -2.345932, 3.429213, 0, 0.2862745, 1, 1,
0.2584986, -0.2639334, 2.772006, 0, 0.2784314, 1, 1,
0.2591328, -1.796385, 5.531774, 0, 0.2745098, 1, 1,
0.2603239, -0.4798431, 3.162185, 0, 0.2666667, 1, 1,
0.265181, 0.5612059, 1.317542, 0, 0.2627451, 1, 1,
0.2670553, -0.03765239, 0.8435606, 0, 0.254902, 1, 1,
0.2676596, -0.1913416, 2.042737, 0, 0.2509804, 1, 1,
0.2715183, 0.4290639, 0.811756, 0, 0.2431373, 1, 1,
0.2722922, -2.065354, 2.043728, 0, 0.2392157, 1, 1,
0.2733838, -0.5307064, 3.505294, 0, 0.2313726, 1, 1,
0.2737232, 0.3130337, 0.4928497, 0, 0.227451, 1, 1,
0.2775294, -1.027827, 5.451562, 0, 0.2196078, 1, 1,
0.2894508, -0.07291652, 1.676232, 0, 0.2156863, 1, 1,
0.2898791, -1.107366, 2.277459, 0, 0.2078431, 1, 1,
0.3020203, -1.288351, 2.022971, 0, 0.2039216, 1, 1,
0.3032863, -0.6158826, 3.68749, 0, 0.1960784, 1, 1,
0.3054557, -1.970368, 3.657841, 0, 0.1882353, 1, 1,
0.3056454, -0.5657859, 2.715548, 0, 0.1843137, 1, 1,
0.3087873, 1.464867, 0.5023763, 0, 0.1764706, 1, 1,
0.3099181, -0.7983115, 4.111172, 0, 0.172549, 1, 1,
0.3105112, 0.2685798, -0.8244305, 0, 0.1647059, 1, 1,
0.3123007, 0.06790412, 0.8730595, 0, 0.1607843, 1, 1,
0.3126546, 1.637669, 0.01762164, 0, 0.1529412, 1, 1,
0.3137862, 0.1474083, 0.4670672, 0, 0.1490196, 1, 1,
0.3248334, -0.6277382, 2.324015, 0, 0.1411765, 1, 1,
0.3263623, -0.04068166, 1.316049, 0, 0.1372549, 1, 1,
0.3278055, -1.085879, 2.764544, 0, 0.1294118, 1, 1,
0.3287905, -0.9055255, 2.011674, 0, 0.1254902, 1, 1,
0.3334274, -0.7249594, 1.643576, 0, 0.1176471, 1, 1,
0.3365528, 0.8720321, 0.1229377, 0, 0.1137255, 1, 1,
0.3397986, -0.5879232, 1.242496, 0, 0.1058824, 1, 1,
0.3404544, -1.14054, 3.697857, 0, 0.09803922, 1, 1,
0.3449748, -0.4336252, 3.158627, 0, 0.09411765, 1, 1,
0.3481466, 0.1235027, 0.9696226, 0, 0.08627451, 1, 1,
0.3498908, 0.8629501, 0.5246096, 0, 0.08235294, 1, 1,
0.3525114, 1.970687, 1.655693, 0, 0.07450981, 1, 1,
0.3570181, 0.008914432, 1.468955, 0, 0.07058824, 1, 1,
0.3788607, 0.8503195, -0.1914026, 0, 0.0627451, 1, 1,
0.3830852, 0.2255584, 3.356954, 0, 0.05882353, 1, 1,
0.3839965, -2.161992, 4.527125, 0, 0.05098039, 1, 1,
0.3847825, -0.3020167, 1.82731, 0, 0.04705882, 1, 1,
0.3868134, 0.687214, -0.5443132, 0, 0.03921569, 1, 1,
0.3896115, -0.09144757, 0.8472873, 0, 0.03529412, 1, 1,
0.3912744, 1.314527, 1.459503, 0, 0.02745098, 1, 1,
0.3966344, -0.9440689, 3.407084, 0, 0.02352941, 1, 1,
0.3996178, 0.28401, 1.818038, 0, 0.01568628, 1, 1,
0.4002508, -1.137611, 2.523448, 0, 0.01176471, 1, 1,
0.4046707, 0.05708413, 0.7644708, 0, 0.003921569, 1, 1,
0.4054873, 0.4755546, 0.3607126, 0.003921569, 0, 1, 1,
0.4091293, -0.250554, 3.440451, 0.007843138, 0, 1, 1,
0.4143054, 0.04784806, 1.881866, 0.01568628, 0, 1, 1,
0.414673, 0.9720525, 0.7208145, 0.01960784, 0, 1, 1,
0.4192221, 1.506406, -0.02914899, 0.02745098, 0, 1, 1,
0.4244776, -1.114988, 2.503012, 0.03137255, 0, 1, 1,
0.4245151, -1.738955, 3.249112, 0.03921569, 0, 1, 1,
0.4319645, -1.736872, 3.310528, 0.04313726, 0, 1, 1,
0.434031, -0.185799, 1.314555, 0.05098039, 0, 1, 1,
0.4367636, 1.283843, 0.06326111, 0.05490196, 0, 1, 1,
0.4372932, 0.6366856, 1.269255, 0.0627451, 0, 1, 1,
0.4385863, -0.1877355, 1.974206, 0.06666667, 0, 1, 1,
0.4389357, 1.582026, 0.2514021, 0.07450981, 0, 1, 1,
0.4460342, -0.02177381, 2.534841, 0.07843138, 0, 1, 1,
0.4479623, -0.4117205, 4.127179, 0.08627451, 0, 1, 1,
0.4483563, -0.09663017, 1.232207, 0.09019608, 0, 1, 1,
0.4488871, 0.1258915, 1.113, 0.09803922, 0, 1, 1,
0.4497097, 2.055775, 0.8652481, 0.1058824, 0, 1, 1,
0.4499281, 2.043846, -0.1236826, 0.1098039, 0, 1, 1,
0.4513532, -2.428012, 3.897398, 0.1176471, 0, 1, 1,
0.4549001, -0.6645513, 2.244566, 0.1215686, 0, 1, 1,
0.4624902, 0.8602946, 0.0248134, 0.1294118, 0, 1, 1,
0.4651747, 0.3078091, 0.511965, 0.1333333, 0, 1, 1,
0.4731666, 1.027686, 0.5099285, 0.1411765, 0, 1, 1,
0.4810756, 0.5360265, 2.371031, 0.145098, 0, 1, 1,
0.4839888, 0.5004235, 0.1550536, 0.1529412, 0, 1, 1,
0.4853529, -0.1185535, 2.3125, 0.1568628, 0, 1, 1,
0.485509, 0.2366819, 1.104466, 0.1647059, 0, 1, 1,
0.4907095, 1.764101, -1.870363, 0.1686275, 0, 1, 1,
0.4926064, 0.1042555, 2.556897, 0.1764706, 0, 1, 1,
0.4961553, -1.056805, 3.394593, 0.1803922, 0, 1, 1,
0.4982066, 0.6979789, -0.02674215, 0.1882353, 0, 1, 1,
0.498208, 0.01964793, 2.149158, 0.1921569, 0, 1, 1,
0.5101975, -1.563894, 1.009118, 0.2, 0, 1, 1,
0.5213253, -0.6035611, 2.579463, 0.2078431, 0, 1, 1,
0.5237231, -0.934034, 1.817121, 0.2117647, 0, 1, 1,
0.5316651, 0.9298212, -0.02494038, 0.2196078, 0, 1, 1,
0.5319576, 0.8555607, 1.069425, 0.2235294, 0, 1, 1,
0.5336248, 0.5334865, 0.1733298, 0.2313726, 0, 1, 1,
0.5347028, 0.449289, 1.913293, 0.2352941, 0, 1, 1,
0.5381438, -0.9028378, 1.620768, 0.2431373, 0, 1, 1,
0.5386791, -0.7405143, 1.961351, 0.2470588, 0, 1, 1,
0.5422796, -1.330019, 3.759148, 0.254902, 0, 1, 1,
0.5457758, 0.1610134, 2.448118, 0.2588235, 0, 1, 1,
0.5457938, -0.3287973, 0.9687355, 0.2666667, 0, 1, 1,
0.5467456, -0.6027744, 3.866125, 0.2705882, 0, 1, 1,
0.5526391, -0.7262598, 1.856839, 0.2784314, 0, 1, 1,
0.5528607, -1.096741, 3.381581, 0.282353, 0, 1, 1,
0.5588394, 1.856981, -0.1640911, 0.2901961, 0, 1, 1,
0.5597922, -1.973053, 2.677306, 0.2941177, 0, 1, 1,
0.5628489, -0.2845736, 1.53989, 0.3019608, 0, 1, 1,
0.5638977, -1.536819, 2.834659, 0.3098039, 0, 1, 1,
0.5700976, 1.000668, 0.7371221, 0.3137255, 0, 1, 1,
0.5713769, 1.131273, -0.3995883, 0.3215686, 0, 1, 1,
0.5730756, 0.8473294, -2.417172, 0.3254902, 0, 1, 1,
0.5740889, 2.07181, 0.4239903, 0.3333333, 0, 1, 1,
0.5771554, 0.7730243, 1.042189, 0.3372549, 0, 1, 1,
0.5837194, 0.7448553, 2.149959, 0.345098, 0, 1, 1,
0.5863012, -0.9054896, 2.833343, 0.3490196, 0, 1, 1,
0.588011, -0.1903451, 3.136966, 0.3568628, 0, 1, 1,
0.5909233, 1.328674, 0.6164967, 0.3607843, 0, 1, 1,
0.5927953, -1.095261, 2.449076, 0.3686275, 0, 1, 1,
0.5933889, 0.05864945, 1.335701, 0.372549, 0, 1, 1,
0.5939286, -1.657735, 4.435722, 0.3803922, 0, 1, 1,
0.5945588, 0.937801, 0.7452533, 0.3843137, 0, 1, 1,
0.5980815, 1.324937, 0.3592407, 0.3921569, 0, 1, 1,
0.6005955, 0.8245307, 1.643821, 0.3960784, 0, 1, 1,
0.6011612, -0.6600376, 2.548906, 0.4039216, 0, 1, 1,
0.609095, 0.7730608, -0.254323, 0.4117647, 0, 1, 1,
0.6105129, 0.5105927, 0.2768959, 0.4156863, 0, 1, 1,
0.611754, -0.8120314, 3.135662, 0.4235294, 0, 1, 1,
0.6126078, 0.520041, -0.9017808, 0.427451, 0, 1, 1,
0.6185461, -0.5406991, 0.04940333, 0.4352941, 0, 1, 1,
0.6197062, -1.377476, 2.203418, 0.4392157, 0, 1, 1,
0.6210989, 0.8117282, 1.592949, 0.4470588, 0, 1, 1,
0.6215558, -0.9390262, 2.338422, 0.4509804, 0, 1, 1,
0.6249506, 0.4860619, 0.1622398, 0.4588235, 0, 1, 1,
0.6259858, -1.782571, 1.595322, 0.4627451, 0, 1, 1,
0.6277229, -0.1996521, 1.730254, 0.4705882, 0, 1, 1,
0.628641, 1.133358, 1.191096, 0.4745098, 0, 1, 1,
0.629369, 0.8422918, 0.3774973, 0.4823529, 0, 1, 1,
0.6319141, -1.320808, 2.662211, 0.4862745, 0, 1, 1,
0.633646, 0.3414167, 1.825492, 0.4941176, 0, 1, 1,
0.6397845, 1.647856, 1.122983, 0.5019608, 0, 1, 1,
0.6406141, -0.5015942, 4.032783, 0.5058824, 0, 1, 1,
0.6423038, -1.612511, 2.15553, 0.5137255, 0, 1, 1,
0.6444907, -0.2552207, 1.812573, 0.5176471, 0, 1, 1,
0.6507639, -0.5952276, 2.086446, 0.5254902, 0, 1, 1,
0.652427, -0.3663137, 1.436358, 0.5294118, 0, 1, 1,
0.6542993, -0.007880258, 0.3208936, 0.5372549, 0, 1, 1,
0.6557013, -1.565563, 1.558179, 0.5411765, 0, 1, 1,
0.655798, 1.435644, -0.1325617, 0.5490196, 0, 1, 1,
0.6564218, -0.8283082, 5.222335, 0.5529412, 0, 1, 1,
0.6589015, 0.4776605, 0.5789145, 0.5607843, 0, 1, 1,
0.6622415, -1.083868, 2.242975, 0.5647059, 0, 1, 1,
0.6629537, 0.7412819, 1.489626, 0.572549, 0, 1, 1,
0.6704553, -0.6411762, 3.65747, 0.5764706, 0, 1, 1,
0.6709471, -1.966272, 3.469015, 0.5843138, 0, 1, 1,
0.6830811, -0.6286381, 1.143692, 0.5882353, 0, 1, 1,
0.6850029, -0.9758277, 1.156497, 0.5960785, 0, 1, 1,
0.6902893, 3.09853, 0.8695862, 0.6039216, 0, 1, 1,
0.6918435, -2.083931, 2.086662, 0.6078432, 0, 1, 1,
0.6996174, 1.083037, 2.491934, 0.6156863, 0, 1, 1,
0.719686, -0.1680056, 1.745667, 0.6196079, 0, 1, 1,
0.7221603, -0.766439, 1.610869, 0.627451, 0, 1, 1,
0.7271179, -0.769165, 3.214133, 0.6313726, 0, 1, 1,
0.7281877, -1.012664, 1.445867, 0.6392157, 0, 1, 1,
0.7491291, -0.8842563, 2.86317, 0.6431373, 0, 1, 1,
0.7493026, 0.6392829, 1.466854, 0.6509804, 0, 1, 1,
0.7526171, 0.1307344, 1.323019, 0.654902, 0, 1, 1,
0.7584549, -0.1498509, 2.072303, 0.6627451, 0, 1, 1,
0.7604709, -0.2661359, 3.047376, 0.6666667, 0, 1, 1,
0.7632755, 0.4649076, 0.9139385, 0.6745098, 0, 1, 1,
0.763455, -0.1915303, 1.422222, 0.6784314, 0, 1, 1,
0.7643387, -0.4711784, 1.854312, 0.6862745, 0, 1, 1,
0.7662942, -2.410625, 5.59151, 0.6901961, 0, 1, 1,
0.7726107, 0.9504943, 0.1737211, 0.6980392, 0, 1, 1,
0.7754502, 0.2745573, 0.4818265, 0.7058824, 0, 1, 1,
0.7934482, 0.3203283, 1.667746, 0.7098039, 0, 1, 1,
0.7961818, -0.875991, 2.593994, 0.7176471, 0, 1, 1,
0.8035616, -0.8865331, 1.787799, 0.7215686, 0, 1, 1,
0.8078036, 1.173516, 0.6607122, 0.7294118, 0, 1, 1,
0.808028, 0.6134698, 1.372655, 0.7333333, 0, 1, 1,
0.8091301, -0.02276604, 3.013796, 0.7411765, 0, 1, 1,
0.8119839, -0.2073488, 0.2863678, 0.7450981, 0, 1, 1,
0.8130264, 0.8491948, 0.2418607, 0.7529412, 0, 1, 1,
0.8184199, 0.7047362, 2.778941, 0.7568628, 0, 1, 1,
0.8192048, 0.8395362, 0.6170684, 0.7647059, 0, 1, 1,
0.8254845, -0.7736071, 2.194666, 0.7686275, 0, 1, 1,
0.8268268, 0.8400221, -0.8669294, 0.7764706, 0, 1, 1,
0.839672, -0.4766104, 2.628611, 0.7803922, 0, 1, 1,
0.8448191, 0.734062, 1.716215, 0.7882353, 0, 1, 1,
0.8493131, 0.8700463, -0.154671, 0.7921569, 0, 1, 1,
0.8505871, 0.5816131, 2.000715, 0.8, 0, 1, 1,
0.8518229, -0.7723861, 0.9098695, 0.8078431, 0, 1, 1,
0.8536152, -0.704488, 0.6702912, 0.8117647, 0, 1, 1,
0.8540103, 0.6467307, 0.4674593, 0.8196079, 0, 1, 1,
0.8547634, 1.322909, 0.4152887, 0.8235294, 0, 1, 1,
0.8636639, 0.08810715, 2.102313, 0.8313726, 0, 1, 1,
0.8660855, -0.3229139, 3.422711, 0.8352941, 0, 1, 1,
0.8661861, 1.463182, 0.1463544, 0.8431373, 0, 1, 1,
0.8688675, -0.3998711, 2.68563, 0.8470588, 0, 1, 1,
0.8706809, -1.061552, 2.175545, 0.854902, 0, 1, 1,
0.8710428, 1.32483, 1.752484, 0.8588235, 0, 1, 1,
0.8716077, 0.5826136, 1.984642, 0.8666667, 0, 1, 1,
0.8758392, 0.4662138, 2.500661, 0.8705882, 0, 1, 1,
0.8879285, -0.8881505, 2.397879, 0.8784314, 0, 1, 1,
0.8882264, -1.428025, 4.05521, 0.8823529, 0, 1, 1,
0.8907774, -0.2630037, 1.570114, 0.8901961, 0, 1, 1,
0.896517, 0.422576, 1.803666, 0.8941177, 0, 1, 1,
0.9175733, 0.2478918, 2.020204, 0.9019608, 0, 1, 1,
0.9195894, -1.268214, 2.654455, 0.9098039, 0, 1, 1,
0.9196275, -0.9313328, 1.672125, 0.9137255, 0, 1, 1,
0.9227791, -0.1968856, 3.046953, 0.9215686, 0, 1, 1,
0.9270093, 1.076504, 1.064076, 0.9254902, 0, 1, 1,
0.9305045, 0.9695584, 0.1698419, 0.9333333, 0, 1, 1,
0.9349657, -0.9749414, 1.374218, 0.9372549, 0, 1, 1,
0.939064, -0.4369141, 1.772754, 0.945098, 0, 1, 1,
0.9454811, 1.455117, 0.3116752, 0.9490196, 0, 1, 1,
0.9456869, -0.0563901, 2.676141, 0.9568627, 0, 1, 1,
0.9463097, 0.8267343, 4.0515, 0.9607843, 0, 1, 1,
0.9589848, 0.2479744, 3.026372, 0.9686275, 0, 1, 1,
0.9622921, -0.01841827, 0.7580206, 0.972549, 0, 1, 1,
0.9653345, 1.101583, 1.199298, 0.9803922, 0, 1, 1,
0.9664931, 3.561816, 0.5874085, 0.9843137, 0, 1, 1,
0.9682922, 0.925588, 1.706864, 0.9921569, 0, 1, 1,
0.9755128, 1.258029, 1.257541, 0.9960784, 0, 1, 1,
0.9755279, 2.355764, 1.049224, 1, 0, 0.9960784, 1,
0.9758041, -1.357283, 0.9701369, 1, 0, 0.9882353, 1,
0.9762086, 0.6050617, 0.3127122, 1, 0, 0.9843137, 1,
0.9811829, -1.357549, 2.239232, 1, 0, 0.9764706, 1,
0.9875385, 1.991602, -0.4454941, 1, 0, 0.972549, 1,
0.9965994, 1.69883, 2.388493, 1, 0, 0.9647059, 1,
1.013216, 0.6178982, 1.178271, 1, 0, 0.9607843, 1,
1.019021, 0.6189457, 2.007852, 1, 0, 0.9529412, 1,
1.02694, -0.5276589, 2.270306, 1, 0, 0.9490196, 1,
1.036632, -0.824316, 2.194544, 1, 0, 0.9411765, 1,
1.036654, 0.04892458, 1.474506, 1, 0, 0.9372549, 1,
1.037247, -3.027767, 3.565279, 1, 0, 0.9294118, 1,
1.041523, -1.093451, 1.395283, 1, 0, 0.9254902, 1,
1.042624, 0.8241079, 1.317052, 1, 0, 0.9176471, 1,
1.043934, 0.1163201, 1.02678, 1, 0, 0.9137255, 1,
1.049699, 1.851387, 0.7300097, 1, 0, 0.9058824, 1,
1.063796, 1.059991, 0.2730418, 1, 0, 0.9019608, 1,
1.067572, -1.860404, 3.059605, 1, 0, 0.8941177, 1,
1.07298, -1.526106, 0.8316853, 1, 0, 0.8862745, 1,
1.073861, -0.5537978, 0.8865513, 1, 0, 0.8823529, 1,
1.075052, 0.8435475, 1.045497, 1, 0, 0.8745098, 1,
1.081463, 0.00568492, 2.046266, 1, 0, 0.8705882, 1,
1.087486, 1.667802, 0.6810784, 1, 0, 0.8627451, 1,
1.088956, -1.306379, 2.475378, 1, 0, 0.8588235, 1,
1.098603, -0.6486213, 2.718202, 1, 0, 0.8509804, 1,
1.098755, -0.837544, 3.260731, 1, 0, 0.8470588, 1,
1.101712, -0.3936402, 2.008926, 1, 0, 0.8392157, 1,
1.10222, -0.5938687, 1.312708, 1, 0, 0.8352941, 1,
1.1025, 1.713749, -1.068349, 1, 0, 0.827451, 1,
1.103927, -1.637145, 2.792114, 1, 0, 0.8235294, 1,
1.116647, 0.5742992, 0.3005846, 1, 0, 0.8156863, 1,
1.122531, -0.0903568, 0.7110759, 1, 0, 0.8117647, 1,
1.124902, 1.167462, -0.1075853, 1, 0, 0.8039216, 1,
1.125364, -2.445307, 3.536634, 1, 0, 0.7960784, 1,
1.127192, -0.522581, 2.550382, 1, 0, 0.7921569, 1,
1.129257, 0.2616379, 1.255029, 1, 0, 0.7843137, 1,
1.139521, 0.4766991, 1.319286, 1, 0, 0.7803922, 1,
1.144076, 0.1954587, 2.567585, 1, 0, 0.772549, 1,
1.147488, 1.112554, 2.312695, 1, 0, 0.7686275, 1,
1.148396, -1.001193, 1.188656, 1, 0, 0.7607843, 1,
1.149576, 0.3459288, 1.771308, 1, 0, 0.7568628, 1,
1.151839, 0.0467364, 2.046335, 1, 0, 0.7490196, 1,
1.157371, 0.6049374, 2.241313, 1, 0, 0.7450981, 1,
1.158171, -0.1420158, 1.064021, 1, 0, 0.7372549, 1,
1.163598, -0.821263, 1.212351, 1, 0, 0.7333333, 1,
1.175549, -1.211351, 1.563426, 1, 0, 0.7254902, 1,
1.176712, -0.8223179, 2.389095, 1, 0, 0.7215686, 1,
1.182647, 0.5623488, 1.916124, 1, 0, 0.7137255, 1,
1.191211, -0.3692952, 1.065829, 1, 0, 0.7098039, 1,
1.192485, -0.8554112, 2.328331, 1, 0, 0.7019608, 1,
1.200708, -1.217919, 2.375386, 1, 0, 0.6941177, 1,
1.202512, 0.1398304, 1.613595, 1, 0, 0.6901961, 1,
1.202515, 0.4812004, 2.169893, 1, 0, 0.682353, 1,
1.205387, 0.6817372, 0.6403331, 1, 0, 0.6784314, 1,
1.207343, -0.4801724, 2.410181, 1, 0, 0.6705883, 1,
1.213693, -0.4905178, 3.713862, 1, 0, 0.6666667, 1,
1.214281, -1.141021, 4.213149, 1, 0, 0.6588235, 1,
1.215383, 1.602951, -0.5688087, 1, 0, 0.654902, 1,
1.217669, -1.354655, 0.5800259, 1, 0, 0.6470588, 1,
1.21791, -0.3351126, 1.038989, 1, 0, 0.6431373, 1,
1.219221, -1.103705, 1.627724, 1, 0, 0.6352941, 1,
1.224224, 0.1305127, 2.049681, 1, 0, 0.6313726, 1,
1.224288, 0.8662351, 0.7388178, 1, 0, 0.6235294, 1,
1.228568, 0.07249632, 0.2579753, 1, 0, 0.6196079, 1,
1.229603, -0.1297762, 2.393061, 1, 0, 0.6117647, 1,
1.231823, -0.5511705, 1.018938, 1, 0, 0.6078432, 1,
1.241055, 0.312209, 1.751824, 1, 0, 0.6, 1,
1.244936, 0.03299067, 2.111992, 1, 0, 0.5921569, 1,
1.245102, 0.3834985, 1.836658, 1, 0, 0.5882353, 1,
1.245352, 1.59179, 0.9010348, 1, 0, 0.5803922, 1,
1.248614, -1.082988, 1.865044, 1, 0, 0.5764706, 1,
1.250266, 1.784536, -0.2214087, 1, 0, 0.5686275, 1,
1.252204, 1.436098, 0.7013374, 1, 0, 0.5647059, 1,
1.255926, -0.5872997, 2.141844, 1, 0, 0.5568628, 1,
1.258561, 0.9255889, 0.8279049, 1, 0, 0.5529412, 1,
1.260874, 0.03050354, 1.723711, 1, 0, 0.5450981, 1,
1.262784, 0.393568, 1.743672, 1, 0, 0.5411765, 1,
1.270154, -1.728081, 2.698832, 1, 0, 0.5333334, 1,
1.279803, -0.6290058, 1.65888, 1, 0, 0.5294118, 1,
1.288757, 1.489609, 0.9413164, 1, 0, 0.5215687, 1,
1.29282, 0.6798063, -0.1880214, 1, 0, 0.5176471, 1,
1.292967, -0.1708797, 1.059447, 1, 0, 0.509804, 1,
1.294379, -0.6656403, 3.00876, 1, 0, 0.5058824, 1,
1.294512, 1.067186, 0.0250951, 1, 0, 0.4980392, 1,
1.314185, -1.440568, 2.225908, 1, 0, 0.4901961, 1,
1.327224, 0.1334876, -0.6008286, 1, 0, 0.4862745, 1,
1.329807, -0.4986461, 1.697849, 1, 0, 0.4784314, 1,
1.333669, -0.4302821, 1.270258, 1, 0, 0.4745098, 1,
1.348639, -1.19572, 1.140582, 1, 0, 0.4666667, 1,
1.349557, -0.7739341, 0.7742013, 1, 0, 0.4627451, 1,
1.353489, 0.03912152, -0.9143435, 1, 0, 0.454902, 1,
1.368391, -0.6137071, 1.640215, 1, 0, 0.4509804, 1,
1.388011, 0.1091176, 2.562366, 1, 0, 0.4431373, 1,
1.3891, -0.03333803, 1.55174, 1, 0, 0.4392157, 1,
1.397698, -0.5683755, 1.761085, 1, 0, 0.4313726, 1,
1.398951, -0.2295671, 0.4755868, 1, 0, 0.427451, 1,
1.40549, -0.4778434, 2.723673, 1, 0, 0.4196078, 1,
1.408599, 1.245129, 1.911578, 1, 0, 0.4156863, 1,
1.417629, 1.23276, 0.6115319, 1, 0, 0.4078431, 1,
1.42186, -0.2084844, 2.049181, 1, 0, 0.4039216, 1,
1.430784, -1.065629, 2.710465, 1, 0, 0.3960784, 1,
1.437084, 1.134673, 1.67041, 1, 0, 0.3882353, 1,
1.444417, 0.02152085, 1.897715, 1, 0, 0.3843137, 1,
1.454143, -0.6881397, 3.402471, 1, 0, 0.3764706, 1,
1.461312, 1.076011, 1.058429, 1, 0, 0.372549, 1,
1.465595, -0.08676436, 0.4507535, 1, 0, 0.3647059, 1,
1.488613, 0.3246745, 0.4218895, 1, 0, 0.3607843, 1,
1.494009, -0.4348953, 1.951154, 1, 0, 0.3529412, 1,
1.502932, 1.762274, -1.072096, 1, 0, 0.3490196, 1,
1.509134, -1.134492, 1.997845, 1, 0, 0.3411765, 1,
1.515945, 0.1367459, 4.300972, 1, 0, 0.3372549, 1,
1.525883, 1.008071, 2.376136, 1, 0, 0.3294118, 1,
1.558426, 3.07803, 0.9357718, 1, 0, 0.3254902, 1,
1.565658, 0.1502136, 2.136045, 1, 0, 0.3176471, 1,
1.596937, -0.1082664, 2.073326, 1, 0, 0.3137255, 1,
1.611344, 1.166354, -0.7802489, 1, 0, 0.3058824, 1,
1.61542, 0.3217864, 1.364184, 1, 0, 0.2980392, 1,
1.623799, -0.2511822, 4.215497, 1, 0, 0.2941177, 1,
1.626959, -0.05757956, 1.050444, 1, 0, 0.2862745, 1,
1.629804, -0.8351003, 3.611256, 1, 0, 0.282353, 1,
1.632993, 1.491945, 0.06897295, 1, 0, 0.2745098, 1,
1.639342, -0.7831023, 2.122402, 1, 0, 0.2705882, 1,
1.647375, -0.5968798, 1.088514, 1, 0, 0.2627451, 1,
1.647473, -1.017794, 3.02813, 1, 0, 0.2588235, 1,
1.647988, -0.7399877, 2.668967, 1, 0, 0.2509804, 1,
1.705962, 0.7266543, 2.613629, 1, 0, 0.2470588, 1,
1.729518, -0.4059145, 2.798207, 1, 0, 0.2392157, 1,
1.741152, 1.049541, 1.120169, 1, 0, 0.2352941, 1,
1.748622, -1.006713, 1.166145, 1, 0, 0.227451, 1,
1.775814, 2.039652, 0.5502383, 1, 0, 0.2235294, 1,
1.79445, -0.5133827, 0.1184274, 1, 0, 0.2156863, 1,
1.814318, -0.5080117, 2.570535, 1, 0, 0.2117647, 1,
1.830231, -0.2826318, 3.061693, 1, 0, 0.2039216, 1,
1.83039, -1.586912, 4.31465, 1, 0, 0.1960784, 1,
1.835948, -1.4596, 2.84248, 1, 0, 0.1921569, 1,
1.84232, -0.03480822, 1.660049, 1, 0, 0.1843137, 1,
1.851986, 0.48815, 0.1732692, 1, 0, 0.1803922, 1,
1.862678, 0.733409, 2.881098, 1, 0, 0.172549, 1,
1.875074, 0.3992474, 2.666272, 1, 0, 0.1686275, 1,
1.883603, 1.024901, 0.1628044, 1, 0, 0.1607843, 1,
1.899938, 0.6404394, 0.3624463, 1, 0, 0.1568628, 1,
1.946619, 0.4472563, 1.132838, 1, 0, 0.1490196, 1,
1.952939, -0.0177705, 1.753893, 1, 0, 0.145098, 1,
1.982344, -0.4872712, 1.84931, 1, 0, 0.1372549, 1,
2.02065, 0.3574552, -0.7136483, 1, 0, 0.1333333, 1,
2.023195, 1.121254, 2.355764, 1, 0, 0.1254902, 1,
2.076141, -0.3493223, 1.302834, 1, 0, 0.1215686, 1,
2.110629, -1.308628, 1.827876, 1, 0, 0.1137255, 1,
2.114634, 1.070777, -0.456087, 1, 0, 0.1098039, 1,
2.120547, -1.053849, 3.447443, 1, 0, 0.1019608, 1,
2.130054, -0.4410877, 2.871578, 1, 0, 0.09411765, 1,
2.134496, -0.1503761, 1.730861, 1, 0, 0.09019608, 1,
2.219736, 0.8768883, 3.043637, 1, 0, 0.08235294, 1,
2.294495, 0.1214674, 0.7446467, 1, 0, 0.07843138, 1,
2.356796, -1.122409, 1.824239, 1, 0, 0.07058824, 1,
2.362386, -1.8032, 0.2166821, 1, 0, 0.06666667, 1,
2.39874, -1.138317, 2.528411, 1, 0, 0.05882353, 1,
2.432684, 1.026691, 2.160255, 1, 0, 0.05490196, 1,
2.511381, -0.05531877, 2.625993, 1, 0, 0.04705882, 1,
2.537289, 0.3754726, 1.364274, 1, 0, 0.04313726, 1,
2.55068, 0.6272997, 1.083447, 1, 0, 0.03529412, 1,
2.638781, 1.017027, 1.597627, 1, 0, 0.03137255, 1,
2.687843, 0.8215868, 0.8136101, 1, 0, 0.02352941, 1,
2.731912, 1.142582, 0.4339027, 1, 0, 0.01960784, 1,
2.734892, 0.8351509, 1.950604, 1, 0, 0.01176471, 1,
3.017107, -0.765725, 4.353563, 1, 0, 0.007843138, 1
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
-0.3421557, -4.144701, -8.00428, 0, -0.5, 0.5, 0.5,
-0.3421557, -4.144701, -8.00428, 1, -0.5, 0.5, 0.5,
-0.3421557, -4.144701, -8.00428, 1, 1.5, 0.5, 0.5,
-0.3421557, -4.144701, -8.00428, 0, 1.5, 0.5, 0.5
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
-4.840208, 0.2670248, -8.00428, 0, -0.5, 0.5, 0.5,
-4.840208, 0.2670248, -8.00428, 1, -0.5, 0.5, 0.5,
-4.840208, 0.2670248, -8.00428, 1, 1.5, 0.5, 0.5,
-4.840208, 0.2670248, -8.00428, 0, 1.5, 0.5, 0.5
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
-4.840208, -4.144701, -0.2211404, 0, -0.5, 0.5, 0.5,
-4.840208, -4.144701, -0.2211404, 1, -0.5, 0.5, 0.5,
-4.840208, -4.144701, -0.2211404, 1, 1.5, 0.5, 0.5,
-4.840208, -4.144701, -0.2211404, 0, 1.5, 0.5, 0.5
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
-3, -3.126611, -6.20817,
3, -3.126611, -6.20817,
-3, -3.126611, -6.20817,
-3, -3.296292, -6.507522,
-2, -3.126611, -6.20817,
-2, -3.296292, -6.507522,
-1, -3.126611, -6.20817,
-1, -3.296292, -6.507522,
0, -3.126611, -6.20817,
0, -3.296292, -6.507522,
1, -3.126611, -6.20817,
1, -3.296292, -6.507522,
2, -3.126611, -6.20817,
2, -3.296292, -6.507522,
3, -3.126611, -6.20817,
3, -3.296292, -6.507522
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
-3, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
-3, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
-3, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
-3, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
-2, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
-2, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
-2, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
-2, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
-1, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
-1, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
-1, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
-1, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
0, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
0, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
0, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
0, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
1, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
1, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
1, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
1, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
2, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
2, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
2, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
2, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5,
3, -3.635656, -7.106225, 0, -0.5, 0.5, 0.5,
3, -3.635656, -7.106225, 1, -0.5, 0.5, 0.5,
3, -3.635656, -7.106225, 1, 1.5, 0.5, 0.5,
3, -3.635656, -7.106225, 0, 1.5, 0.5, 0.5
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
-3.802196, -3, -6.20817,
-3.802196, 3, -6.20817,
-3.802196, -3, -6.20817,
-3.975198, -3, -6.507522,
-3.802196, -2, -6.20817,
-3.975198, -2, -6.507522,
-3.802196, -1, -6.20817,
-3.975198, -1, -6.507522,
-3.802196, 0, -6.20817,
-3.975198, 0, -6.507522,
-3.802196, 1, -6.20817,
-3.975198, 1, -6.507522,
-3.802196, 2, -6.20817,
-3.975198, 2, -6.507522,
-3.802196, 3, -6.20817,
-3.975198, 3, -6.507522
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
-4.321202, -3, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, -3, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, -3, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, -3, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, -2, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, -2, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, -2, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, -2, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, -1, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, -1, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, -1, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, -1, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, 0, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, 0, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, 0, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, 0, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, 1, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, 1, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, 1, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, 1, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, 2, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, 2, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, 2, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, 2, -7.106225, 0, 1.5, 0.5, 0.5,
-4.321202, 3, -7.106225, 0, -0.5, 0.5, 0.5,
-4.321202, 3, -7.106225, 1, -0.5, 0.5, 0.5,
-4.321202, 3, -7.106225, 1, 1.5, 0.5, 0.5,
-4.321202, 3, -7.106225, 0, 1.5, 0.5, 0.5
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
-3.802196, -3.126611, -6,
-3.802196, -3.126611, 4,
-3.802196, -3.126611, -6,
-3.975198, -3.296292, -6,
-3.802196, -3.126611, -4,
-3.975198, -3.296292, -4,
-3.802196, -3.126611, -2,
-3.975198, -3.296292, -2,
-3.802196, -3.126611, 0,
-3.975198, -3.296292, 0,
-3.802196, -3.126611, 2,
-3.975198, -3.296292, 2,
-3.802196, -3.126611, 4,
-3.975198, -3.296292, 4
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
-4.321202, -3.635656, -6, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -6, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -6, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, -6, 0, 1.5, 0.5, 0.5,
-4.321202, -3.635656, -4, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -4, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -4, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, -4, 0, 1.5, 0.5, 0.5,
-4.321202, -3.635656, -2, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -2, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, -2, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, -2, 0, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 0, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 0, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 0, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 0, 0, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 2, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 2, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 2, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 2, 0, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 4, 0, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 4, 1, -0.5, 0.5, 0.5,
-4.321202, -3.635656, 4, 1, 1.5, 0.5, 0.5,
-4.321202, -3.635656, 4, 0, 1.5, 0.5, 0.5
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
-3.802196, -3.126611, -6.20817,
-3.802196, 3.66066, -6.20817,
-3.802196, -3.126611, 5.76589,
-3.802196, 3.66066, 5.76589,
-3.802196, -3.126611, -6.20817,
-3.802196, -3.126611, 5.76589,
-3.802196, 3.66066, -6.20817,
-3.802196, 3.66066, 5.76589,
-3.802196, -3.126611, -6.20817,
3.117884, -3.126611, -6.20817,
-3.802196, -3.126611, 5.76589,
3.117884, -3.126611, 5.76589,
-3.802196, 3.66066, -6.20817,
3.117884, 3.66066, -6.20817,
-3.802196, 3.66066, 5.76589,
3.117884, 3.66066, 5.76589,
3.117884, -3.126611, -6.20817,
3.117884, 3.66066, -6.20817,
3.117884, -3.126611, 5.76589,
3.117884, 3.66066, 5.76589,
3.117884, -3.126611, -6.20817,
3.117884, -3.126611, 5.76589,
3.117884, 3.66066, -6.20817,
3.117884, 3.66066, 5.76589
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
var radius = 8.226294;
var distance = 36.59971;
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
mvMatrix.translate( 0.3421557, -0.2670248, 0.2211404 );
mvMatrix.scale( 1.285307, 1.310458, 0.7428082 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.59971);
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
1-methylethyl_N-benz<-read.table("1-methylethyl_N-benz.xyz")
```

```
## Error in read.table("1-methylethyl_N-benz.xyz"): no lines available in input
```

```r
x<-1-methylethyl_N-benz$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl_N' not found
```

```r
y<-1-methylethyl_N-benz$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl_N' not found
```

```r
z<-1-methylethyl_N-benz$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylethyl_N' not found
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
-3.701418, 0.249903, -1.165966, 0, 0, 1, 1, 1,
-2.823764, 0.06892903, -2.827636, 1, 0, 0, 1, 1,
-2.679253, 0.6208678, -0.243955, 1, 0, 0, 1, 1,
-2.626469, -0.7816864, -1.298505, 1, 0, 0, 1, 1,
-2.546182, -1.640116, -1.860305, 1, 0, 0, 1, 1,
-2.537348, 0.7009756, -2.561042, 1, 0, 0, 1, 1,
-2.500779, -0.7173978, -0.7491785, 0, 0, 0, 1, 1,
-2.430807, 0.088717, -2.281013, 0, 0, 0, 1, 1,
-2.419348, 1.113262, -1.464905, 0, 0, 0, 1, 1,
-2.407152, 0.3841557, -1.210797, 0, 0, 0, 1, 1,
-2.393567, 1.208146, -2.306814, 0, 0, 0, 1, 1,
-2.389541, 0.06003433, -0.5099179, 0, 0, 0, 1, 1,
-2.37942, -0.2225118, -2.4993, 0, 0, 0, 1, 1,
-2.355275, 0.6030905, -0.468025, 1, 1, 1, 1, 1,
-2.186095, -1.787715, -2.835979, 1, 1, 1, 1, 1,
-2.181663, -1.193005, -0.8491665, 1, 1, 1, 1, 1,
-2.16884, -0.3912891, -2.479532, 1, 1, 1, 1, 1,
-2.146063, 0.2601898, -1.091859, 1, 1, 1, 1, 1,
-2.089808, 0.3851948, 0.3325157, 1, 1, 1, 1, 1,
-2.087164, 0.6507853, -0.6597323, 1, 1, 1, 1, 1,
-2.086802, 0.4179347, -1.320674, 1, 1, 1, 1, 1,
-2.078115, -1.383908, -2.516483, 1, 1, 1, 1, 1,
-2.041365, -1.141137, -0.5436227, 1, 1, 1, 1, 1,
-2.026698, 1.126267, -2.676106, 1, 1, 1, 1, 1,
-1.987022, 0.282716, -1.745425, 1, 1, 1, 1, 1,
-1.986149, -0.3655244, -0.7401338, 1, 1, 1, 1, 1,
-1.982468, 0.1584487, -2.055269, 1, 1, 1, 1, 1,
-1.9787, -0.8580544, -2.768843, 1, 1, 1, 1, 1,
-1.965468, 0.9022938, -1.508571, 0, 0, 1, 1, 1,
-1.921488, 0.401017, -0.6967342, 1, 0, 0, 1, 1,
-1.917321, -0.6809925, -1.905036, 1, 0, 0, 1, 1,
-1.905634, 1.446302, 0.2667719, 1, 0, 0, 1, 1,
-1.903739, 0.9674065, 0.3070401, 1, 0, 0, 1, 1,
-1.90088, 0.818529, -1.431233, 1, 0, 0, 1, 1,
-1.88018, -0.00304119, -2.332222, 0, 0, 0, 1, 1,
-1.864935, -1.297791, -3.311321, 0, 0, 0, 1, 1,
-1.857779, 1.647152, -1.953175, 0, 0, 0, 1, 1,
-1.846921, 1.032034, -1.04456, 0, 0, 0, 1, 1,
-1.8446, -0.1662253, -1.152473, 0, 0, 0, 1, 1,
-1.836418, 0.4541008, -1.107571, 0, 0, 0, 1, 1,
-1.80323, -0.4461737, -0.9817941, 0, 0, 0, 1, 1,
-1.743268, 0.5704077, 0.4751666, 1, 1, 1, 1, 1,
-1.739519, 0.07281353, 0.8684666, 1, 1, 1, 1, 1,
-1.719513, 0.5587339, -1.839558, 1, 1, 1, 1, 1,
-1.703608, -0.8125544, -3.621396, 1, 1, 1, 1, 1,
-1.700719, 0.7350729, -1.999513, 1, 1, 1, 1, 1,
-1.685733, -2.229244, -2.898728, 1, 1, 1, 1, 1,
-1.685266, -0.3231624, -2.2757, 1, 1, 1, 1, 1,
-1.678295, -0.07319895, -2.06203, 1, 1, 1, 1, 1,
-1.672472, 1.559845, -1.630302, 1, 1, 1, 1, 1,
-1.670701, 1.764404, -0.5196495, 1, 1, 1, 1, 1,
-1.668736, 0.5394998, -1.272193, 1, 1, 1, 1, 1,
-1.665065, 0.3499414, -1.421725, 1, 1, 1, 1, 1,
-1.66106, 0.9870791, -0.6879295, 1, 1, 1, 1, 1,
-1.653895, 0.4845032, -0.4690733, 1, 1, 1, 1, 1,
-1.653669, -0.1443136, -2.777401, 1, 1, 1, 1, 1,
-1.650846, -1.83705, -3.348283, 0, 0, 1, 1, 1,
-1.644087, -0.4614267, -0.8829507, 1, 0, 0, 1, 1,
-1.637616, -0.6837682, -2.410542, 1, 0, 0, 1, 1,
-1.623995, -1.267579, -4.136553, 1, 0, 0, 1, 1,
-1.621129, -0.1216475, -1.412192, 1, 0, 0, 1, 1,
-1.614164, 0.1505506, -0.2678637, 1, 0, 0, 1, 1,
-1.596784, 0.246772, -2.042621, 0, 0, 0, 1, 1,
-1.589234, -0.5531337, -2.483766, 0, 0, 0, 1, 1,
-1.570903, 0.3999864, -2.712314, 0, 0, 0, 1, 1,
-1.56672, 2.340665, -0.8499424, 0, 0, 0, 1, 1,
-1.565465, 0.6947579, -0.9386023, 0, 0, 0, 1, 1,
-1.563861, 0.9730401, -1.486546, 0, 0, 0, 1, 1,
-1.561394, 0.991783, -0.7206096, 0, 0, 0, 1, 1,
-1.559536, -0.4002578, -2.281473, 1, 1, 1, 1, 1,
-1.557835, 0.2258286, -2.189152, 1, 1, 1, 1, 1,
-1.554457, -0.9375871, -3.748041, 1, 1, 1, 1, 1,
-1.550805, -1.971622, -1.474048, 1, 1, 1, 1, 1,
-1.549145, 0.2086282, -1.884184, 1, 1, 1, 1, 1,
-1.535977, -0.2917546, -1.6955, 1, 1, 1, 1, 1,
-1.525227, -0.2803712, -1.268238, 1, 1, 1, 1, 1,
-1.522119, 0.2512327, -1.5884, 1, 1, 1, 1, 1,
-1.521485, -0.5124323, -1.009836, 1, 1, 1, 1, 1,
-1.512022, -0.6860722, -2.010098, 1, 1, 1, 1, 1,
-1.491233, -1.185191, -1.08113, 1, 1, 1, 1, 1,
-1.475987, -0.1868576, -0.4276038, 1, 1, 1, 1, 1,
-1.470021, -1.3061, -1.255251, 1, 1, 1, 1, 1,
-1.458467, 1.376767, -0.6678168, 1, 1, 1, 1, 1,
-1.43881, -1.510871, -2.51003, 1, 1, 1, 1, 1,
-1.428993, -0.9879891, 0.1673036, 0, 0, 1, 1, 1,
-1.424583, -2.181394, -2.850887, 1, 0, 0, 1, 1,
-1.40907, 1.286878, -2.235453, 1, 0, 0, 1, 1,
-1.401824, -0.3067964, -2.499576, 1, 0, 0, 1, 1,
-1.399388, 0.7237774, -0.1303649, 1, 0, 0, 1, 1,
-1.392463, -0.8426644, -2.056052, 1, 0, 0, 1, 1,
-1.374346, -0.6365175, -2.950605, 0, 0, 0, 1, 1,
-1.374028, 0.9393654, -1.672649, 0, 0, 0, 1, 1,
-1.373523, 0.1713464, -1.386941, 0, 0, 0, 1, 1,
-1.371616, -2.226719, -1.221461, 0, 0, 0, 1, 1,
-1.367, -0.07145429, -2.055465, 0, 0, 0, 1, 1,
-1.366765, 0.510826, -1.961871, 0, 0, 0, 1, 1,
-1.365647, 0.3515742, -1.376004, 0, 0, 0, 1, 1,
-1.357005, -0.6747459, -1.141559, 1, 1, 1, 1, 1,
-1.3535, -2.21239, -4.224464, 1, 1, 1, 1, 1,
-1.349946, 1.260907, -1.362525, 1, 1, 1, 1, 1,
-1.341969, 1.275293, -0.09865749, 1, 1, 1, 1, 1,
-1.339432, 0.4932967, -1.471803, 1, 1, 1, 1, 1,
-1.337499, -0.7156705, -2.210265, 1, 1, 1, 1, 1,
-1.333026, -1.345629, -1.637956, 1, 1, 1, 1, 1,
-1.328883, -0.1197219, 2.128504, 1, 1, 1, 1, 1,
-1.325163, 0.06319366, -1.544766, 1, 1, 1, 1, 1,
-1.324889, -0.9768591, -1.761102, 1, 1, 1, 1, 1,
-1.32329, 0.01494277, -2.835449, 1, 1, 1, 1, 1,
-1.322121, 0.6546404, -2.024369, 1, 1, 1, 1, 1,
-1.321814, 1.294479, 0.2742024, 1, 1, 1, 1, 1,
-1.312859, 0.5413535, -2.570285, 1, 1, 1, 1, 1,
-1.305284, 0.6978802, -0.7111217, 1, 1, 1, 1, 1,
-1.291288, -0.3087162, -0.6284297, 0, 0, 1, 1, 1,
-1.290341, 0.252859, -3.119949, 1, 0, 0, 1, 1,
-1.284573, -1.377681, -3.837095, 1, 0, 0, 1, 1,
-1.26882, 0.671116, -2.749077, 1, 0, 0, 1, 1,
-1.267595, -0.7126625, -1.63862, 1, 0, 0, 1, 1,
-1.260093, 1.508305, -1.220277, 1, 0, 0, 1, 1,
-1.259074, 0.1329421, -1.688332, 0, 0, 0, 1, 1,
-1.25792, -0.5570107, -0.3825353, 0, 0, 0, 1, 1,
-1.255666, 0.1560057, -0.7842322, 0, 0, 0, 1, 1,
-1.251064, -0.1685887, -0.4512765, 0, 0, 0, 1, 1,
-1.246604, 0.01548181, -1.7886, 0, 0, 0, 1, 1,
-1.24476, 2.189169, -1.068445, 0, 0, 0, 1, 1,
-1.241586, -1.089344, -2.618809, 0, 0, 0, 1, 1,
-1.240279, 0.03346414, -1.09787, 1, 1, 1, 1, 1,
-1.238421, 0.4024149, -0.5621705, 1, 1, 1, 1, 1,
-1.233277, -0.5190908, -1.825722, 1, 1, 1, 1, 1,
-1.230759, -0.7515427, -2.545927, 1, 1, 1, 1, 1,
-1.219939, -0.06343984, -2.48508, 1, 1, 1, 1, 1,
-1.21793, -0.4005963, -0.9880174, 1, 1, 1, 1, 1,
-1.217251, 0.6314256, -0.8398186, 1, 1, 1, 1, 1,
-1.216727, -0.06771728, -2.302917, 1, 1, 1, 1, 1,
-1.213888, -0.5896643, -3.721621, 1, 1, 1, 1, 1,
-1.207287, -0.06651409, -1.879017, 1, 1, 1, 1, 1,
-1.206162, 0.0380493, 0.8350508, 1, 1, 1, 1, 1,
-1.205887, -2.514546, -1.906372, 1, 1, 1, 1, 1,
-1.205123, 0.03849392, -1.364051, 1, 1, 1, 1, 1,
-1.186409, 1.742884, -0.917469, 1, 1, 1, 1, 1,
-1.183941, -1.747971, -3.33393, 1, 1, 1, 1, 1,
-1.178017, -1.112143, -2.122803, 0, 0, 1, 1, 1,
-1.172709, 1.787021, -0.5354332, 1, 0, 0, 1, 1,
-1.167357, 0.2569839, 1.101329, 1, 0, 0, 1, 1,
-1.133137, -1.787415, -2.030859, 1, 0, 0, 1, 1,
-1.130578, 0.4586241, -0.2024114, 1, 0, 0, 1, 1,
-1.124974, 0.3118062, -2.737914, 1, 0, 0, 1, 1,
-1.120762, -0.5945783, -1.595088, 0, 0, 0, 1, 1,
-1.116926, 0.3130255, -0.09562224, 0, 0, 0, 1, 1,
-1.115037, -0.6581838, -2.238401, 0, 0, 0, 1, 1,
-1.113209, 1.348488, -1.375061, 0, 0, 0, 1, 1,
-1.107811, -0.2998128, -0.9133438, 0, 0, 0, 1, 1,
-1.102673, -0.410302, -1.536671, 0, 0, 0, 1, 1,
-1.101557, 0.7599164, -2.733481, 0, 0, 0, 1, 1,
-1.099637, 1.20339, -0.9382724, 1, 1, 1, 1, 1,
-1.090125, -1.515775, -3.097978, 1, 1, 1, 1, 1,
-1.085669, -0.09481306, -1.834547, 1, 1, 1, 1, 1,
-1.082967, -0.6236602, -1.520908, 1, 1, 1, 1, 1,
-1.078799, 1.227867, -0.9354919, 1, 1, 1, 1, 1,
-1.076589, 1.421802, -1.044969, 1, 1, 1, 1, 1,
-1.075371, -1.302743, -2.825671, 1, 1, 1, 1, 1,
-1.073115, -0.7794074, -2.799944, 1, 1, 1, 1, 1,
-1.071265, -0.01850417, -1.335246, 1, 1, 1, 1, 1,
-1.070791, 0.3351448, -3.697079, 1, 1, 1, 1, 1,
-1.070536, -0.4616361, -0.4705205, 1, 1, 1, 1, 1,
-1.057359, 0.007852941, -3.142895, 1, 1, 1, 1, 1,
-1.043268, 0.9045299, -2.044396, 1, 1, 1, 1, 1,
-1.043205, 1.111254, -0.2684712, 1, 1, 1, 1, 1,
-1.032362, 2.735354, 0.1998307, 1, 1, 1, 1, 1,
-1.029704, -1.30008, -2.763967, 0, 0, 1, 1, 1,
-1.02627, 0.1765055, -0.3680747, 1, 0, 0, 1, 1,
-1.024923, -1.354754, -2.685688, 1, 0, 0, 1, 1,
-1.024291, 0.6814072, -0.503486, 1, 0, 0, 1, 1,
-1.023178, 0.4929206, -1.661319, 1, 0, 0, 1, 1,
-1.022727, -0.04462867, 0.2869299, 1, 0, 0, 1, 1,
-1.021239, 1.149922, -1.99429, 0, 0, 0, 1, 1,
-1.019512, -2.200759, -3.550255, 0, 0, 0, 1, 1,
-1.01647, 0.6047539, -1.594568, 0, 0, 0, 1, 1,
-1.004735, -0.9891011, -2.988643, 0, 0, 0, 1, 1,
-1.004411, -1.21437, -6.033791, 0, 0, 0, 1, 1,
-0.9979627, -2.567686, -2.683748, 0, 0, 0, 1, 1,
-0.9957677, 0.1807238, -1.464604, 0, 0, 0, 1, 1,
-0.9931955, 1.701775, -1.721681, 1, 1, 1, 1, 1,
-0.9924655, -0.7310369, -2.14668, 1, 1, 1, 1, 1,
-0.9867839, 1.45102, -0.9906834, 1, 1, 1, 1, 1,
-0.9825334, -1.092231, -1.409325, 1, 1, 1, 1, 1,
-0.9809905, 0.5263679, -0.04250173, 1, 1, 1, 1, 1,
-0.9745709, -0.9979463, -2.867269, 1, 1, 1, 1, 1,
-0.9703513, 1.491111, -0.4571891, 1, 1, 1, 1, 1,
-0.9690128, -0.04311521, 0.4294305, 1, 1, 1, 1, 1,
-0.9689048, 0.1577716, 1.036865, 1, 1, 1, 1, 1,
-0.9679142, -0.7340949, -1.546733, 1, 1, 1, 1, 1,
-0.9660937, -1.783096, -4.644884, 1, 1, 1, 1, 1,
-0.9635113, 0.2259313, 0.06872634, 1, 1, 1, 1, 1,
-0.962068, 0.7941543, 0.05934201, 1, 1, 1, 1, 1,
-0.9581924, 0.2685653, -2.160058, 1, 1, 1, 1, 1,
-0.9521908, -0.1298115, 0.5281315, 1, 1, 1, 1, 1,
-0.9499125, -0.1686143, -2.537034, 0, 0, 1, 1, 1,
-0.9467739, 1.043416, -0.8785717, 1, 0, 0, 1, 1,
-0.9438523, 1.46287, -0.7451327, 1, 0, 0, 1, 1,
-0.9430421, 0.5936107, -0.9446765, 1, 0, 0, 1, 1,
-0.928153, -0.2243146, -1.870118, 1, 0, 0, 1, 1,
-0.9180784, -0.3810044, -1.675335, 1, 0, 0, 1, 1,
-0.9115209, 0.5057017, -2.763821, 0, 0, 0, 1, 1,
-0.9109796, -0.9724275, -3.148685, 0, 0, 0, 1, 1,
-0.9080563, -0.6342493, -1.622701, 0, 0, 0, 1, 1,
-0.907648, 0.5204735, -1.214638, 0, 0, 0, 1, 1,
-0.9034038, 0.6118532, -1.690112, 0, 0, 0, 1, 1,
-0.8945889, -0.7092203, 0.4788141, 0, 0, 0, 1, 1,
-0.8906915, -1.349828, -4.520529, 0, 0, 0, 1, 1,
-0.8899504, 0.2635106, -1.240075, 1, 1, 1, 1, 1,
-0.8811808, -2.389199, -2.402362, 1, 1, 1, 1, 1,
-0.870374, -1.714754, -4.016495, 1, 1, 1, 1, 1,
-0.8693022, 0.3799175, -2.325434, 1, 1, 1, 1, 1,
-0.8692879, -0.07916305, -2.52735, 1, 1, 1, 1, 1,
-0.86761, -2.2469, -3.256621, 1, 1, 1, 1, 1,
-0.867283, -0.1269569, -2.363235, 1, 1, 1, 1, 1,
-0.8538986, -0.4790671, -2.12755, 1, 1, 1, 1, 1,
-0.8536767, 0.426126, 0.722248, 1, 1, 1, 1, 1,
-0.8419331, -0.5112616, -2.788594, 1, 1, 1, 1, 1,
-0.8388404, 0.1854725, -1.322279, 1, 1, 1, 1, 1,
-0.8349388, -0.9413036, -3.822005, 1, 1, 1, 1, 1,
-0.8332726, -0.8429783, -2.437288, 1, 1, 1, 1, 1,
-0.8307685, 1.645577, 0.4685087, 1, 1, 1, 1, 1,
-0.8279861, -0.9610822, -3.259808, 1, 1, 1, 1, 1,
-0.8259462, -0.6177284, -3.362884, 0, 0, 1, 1, 1,
-0.8177259, -0.6913228, -2.678016, 1, 0, 0, 1, 1,
-0.8136848, 0.1421529, -1.259369, 1, 0, 0, 1, 1,
-0.8111157, 0.6742224, 0.05087403, 1, 0, 0, 1, 1,
-0.8095436, 0.7968125, 0.372332, 1, 0, 0, 1, 1,
-0.80628, -1.380921, -2.029663, 1, 0, 0, 1, 1,
-0.7904685, 0.6047182, -1.6734, 0, 0, 0, 1, 1,
-0.7879829, 2.186816, -0.4056559, 0, 0, 0, 1, 1,
-0.78136, 0.3719514, -3.369067, 0, 0, 0, 1, 1,
-0.7751256, -0.4975175, -2.077301, 0, 0, 0, 1, 1,
-0.7719467, -0.1891271, -1.790665, 0, 0, 0, 1, 1,
-0.771089, -1.727708, -3.85981, 0, 0, 0, 1, 1,
-0.7705316, -0.6354955, -1.563788, 0, 0, 0, 1, 1,
-0.7621496, 0.1614351, -2.71727, 1, 1, 1, 1, 1,
-0.7607108, -1.611946, -3.743052, 1, 1, 1, 1, 1,
-0.7594337, 2.527058, -1.875251, 1, 1, 1, 1, 1,
-0.7578763, -2.624665, -2.119366, 1, 1, 1, 1, 1,
-0.7540783, 1.445633, 0.5316973, 1, 1, 1, 1, 1,
-0.7522754, -1.062685, -3.304472, 1, 1, 1, 1, 1,
-0.751791, -1.435433, -3.156717, 1, 1, 1, 1, 1,
-0.7496557, -0.008529844, -1.13549, 1, 1, 1, 1, 1,
-0.7464263, -0.3236808, 0.3761263, 1, 1, 1, 1, 1,
-0.745447, 0.3074358, -0.3738574, 1, 1, 1, 1, 1,
-0.7440715, -0.364814, -1.604743, 1, 1, 1, 1, 1,
-0.7412417, -0.7396845, -2.491407, 1, 1, 1, 1, 1,
-0.7408258, 0.7704741, -1.127388, 1, 1, 1, 1, 1,
-0.7364802, -0.8106321, -0.6205475, 1, 1, 1, 1, 1,
-0.7326317, 0.8253047, -0.5531971, 1, 1, 1, 1, 1,
-0.7311601, -0.3384801, -2.642674, 0, 0, 1, 1, 1,
-0.725678, 1.332275, -0.6813061, 1, 0, 0, 1, 1,
-0.7209089, 0.9247898, -0.2987882, 1, 0, 0, 1, 1,
-0.7205008, -0.06372798, -2.445662, 1, 0, 0, 1, 1,
-0.7201121, -0.2917356, 0.0391327, 1, 0, 0, 1, 1,
-0.7180574, -0.747914, -3.55083, 1, 0, 0, 1, 1,
-0.7138665, -1.125266, -2.049072, 0, 0, 0, 1, 1,
-0.6999127, 0.2452196, -1.844758, 0, 0, 0, 1, 1,
-0.6974782, 0.8485306, 0.8311767, 0, 0, 0, 1, 1,
-0.6967822, 0.5196545, -3.070287, 0, 0, 0, 1, 1,
-0.6946893, -0.5005217, -1.604101, 0, 0, 0, 1, 1,
-0.6924019, 0.7350358, -1.999565, 0, 0, 0, 1, 1,
-0.691411, 0.6387217, -1.939978, 0, 0, 0, 1, 1,
-0.6895757, 0.2356265, -2.289984, 1, 1, 1, 1, 1,
-0.6891742, 0.6431918, 2.300052, 1, 1, 1, 1, 1,
-0.6862141, 0.009147322, -0.8818004, 1, 1, 1, 1, 1,
-0.6858294, 1.136825, 0.3552126, 1, 1, 1, 1, 1,
-0.6851748, 1.380308, -0.9298944, 1, 1, 1, 1, 1,
-0.6842891, 0.7960469, 0.8353754, 1, 1, 1, 1, 1,
-0.6812311, -0.9906094, -1.696869, 1, 1, 1, 1, 1,
-0.681118, -0.09686509, -1.107255, 1, 1, 1, 1, 1,
-0.6773477, 0.6145412, -0.8246704, 1, 1, 1, 1, 1,
-0.6764833, 0.8225242, -0.3382221, 1, 1, 1, 1, 1,
-0.66637, -0.4699786, -2.15775, 1, 1, 1, 1, 1,
-0.6661015, 0.4692908, -0.1158388, 1, 1, 1, 1, 1,
-0.6485615, 0.2506742, -0.01715225, 1, 1, 1, 1, 1,
-0.6465148, -0.3251683, -2.579822, 1, 1, 1, 1, 1,
-0.6461836, -0.4226428, -0.7941929, 1, 1, 1, 1, 1,
-0.6450297, 1.239412, 0.8807734, 0, 0, 1, 1, 1,
-0.6448022, 0.7960815, -0.1654841, 1, 0, 0, 1, 1,
-0.6439809, -0.7746552, -4.178913, 1, 0, 0, 1, 1,
-0.6311123, 0.2458186, -1.776913, 1, 0, 0, 1, 1,
-0.6269268, 1.436266, -0.8203624, 1, 0, 0, 1, 1,
-0.6209588, -0.3507784, -0.7292577, 1, 0, 0, 1, 1,
-0.6173965, 0.4037597, -1.047865, 0, 0, 0, 1, 1,
-0.6166797, 0.3059981, 0.1130566, 0, 0, 0, 1, 1,
-0.6162277, 1.373011, -1.718808, 0, 0, 0, 1, 1,
-0.6136523, -0.2978675, -1.841835, 0, 0, 0, 1, 1,
-0.6129684, 0.01645286, -0.9941019, 0, 0, 0, 1, 1,
-0.6099026, -0.558382, -0.6947047, 0, 0, 0, 1, 1,
-0.6087933, -0.3701139, -3.303699, 0, 0, 0, 1, 1,
-0.6035099, -0.9780775, -2.715158, 1, 1, 1, 1, 1,
-0.6026713, 0.3990767, -0.617463, 1, 1, 1, 1, 1,
-0.6016372, -0.05182836, -3.228865, 1, 1, 1, 1, 1,
-0.6011595, -0.655628, -2.784686, 1, 1, 1, 1, 1,
-0.5973579, -1.767494, -2.120787, 1, 1, 1, 1, 1,
-0.5961204, -1.931517, -2.721968, 1, 1, 1, 1, 1,
-0.5936176, -0.7199323, -3.184605, 1, 1, 1, 1, 1,
-0.5934194, -0.6870523, -2.037884, 1, 1, 1, 1, 1,
-0.5929037, 0.2179832, -0.4233144, 1, 1, 1, 1, 1,
-0.591845, 0.3047808, -2.120383, 1, 1, 1, 1, 1,
-0.591809, -0.5953978, -1.935077, 1, 1, 1, 1, 1,
-0.5838886, -0.4536873, -2.12588, 1, 1, 1, 1, 1,
-0.582776, 1.876007, 0.2622781, 1, 1, 1, 1, 1,
-0.5688976, -0.9018336, -1.741277, 1, 1, 1, 1, 1,
-0.56799, 1.429428, 0.2448952, 1, 1, 1, 1, 1,
-0.567636, -1.174666, -4.038929, 0, 0, 1, 1, 1,
-0.5648455, -0.4626235, -3.024461, 1, 0, 0, 1, 1,
-0.564419, -0.8441537, -3.156381, 1, 0, 0, 1, 1,
-0.5639536, 0.4705646, -2.254462, 1, 0, 0, 1, 1,
-0.5627129, 0.2170091, -0.4572901, 1, 0, 0, 1, 1,
-0.5609812, -0.3885378, -0.7806252, 1, 0, 0, 1, 1,
-0.5608748, 0.9995048, 0.2699282, 0, 0, 0, 1, 1,
-0.5589901, -1.308343, -0.4006095, 0, 0, 0, 1, 1,
-0.5521639, -0.03397075, -1.045169, 0, 0, 0, 1, 1,
-0.5474446, -0.3116757, -2.171017, 0, 0, 0, 1, 1,
-0.5435625, -1.078376, -1.771575, 0, 0, 0, 1, 1,
-0.5416134, -0.3600773, -2.768885, 0, 0, 0, 1, 1,
-0.5408725, -0.5748803, -2.500988, 0, 0, 0, 1, 1,
-0.5403858, -0.3486928, -2.905929, 1, 1, 1, 1, 1,
-0.539531, -1.039213, -3.933142, 1, 1, 1, 1, 1,
-0.5376254, 0.06683503, -1.94367, 1, 1, 1, 1, 1,
-0.5367686, 1.624977, -0.5168962, 1, 1, 1, 1, 1,
-0.5326903, -0.7438307, -2.228539, 1, 1, 1, 1, 1,
-0.532096, -0.8490202, -2.224686, 1, 1, 1, 1, 1,
-0.5320722, 1.395193, -0.6723346, 1, 1, 1, 1, 1,
-0.5297136, 1.149479, 0.1447724, 1, 1, 1, 1, 1,
-0.5203863, -0.5571089, -2.8752, 1, 1, 1, 1, 1,
-0.5195193, 1.403908, 1.268096, 1, 1, 1, 1, 1,
-0.5190981, 0.3749543, -1.273592, 1, 1, 1, 1, 1,
-0.5184188, 0.6864147, 0.6566342, 1, 1, 1, 1, 1,
-0.5123193, -0.6359934, -3.141191, 1, 1, 1, 1, 1,
-0.5091122, -0.3719801, -1.320846, 1, 1, 1, 1, 1,
-0.5082406, 0.5480675, -1.143443, 1, 1, 1, 1, 1,
-0.5075454, -0.1025984, -2.180653, 0, 0, 1, 1, 1,
-0.5073237, -1.277792, -5.104736, 1, 0, 0, 1, 1,
-0.5046375, 2.811251, -0.08981541, 1, 0, 0, 1, 1,
-0.5013713, -1.059427, -3.073406, 1, 0, 0, 1, 1,
-0.4937691, -0.287593, -1.789917, 1, 0, 0, 1, 1,
-0.4879385, 0.2874085, -0.8540448, 1, 0, 0, 1, 1,
-0.4829712, 1.342129, -1.797728, 0, 0, 0, 1, 1,
-0.4826272, -0.6609575, -2.536496, 0, 0, 0, 1, 1,
-0.4819583, 1.838226, 0.8375562, 0, 0, 0, 1, 1,
-0.4813141, 1.005711, -1.25333, 0, 0, 0, 1, 1,
-0.479594, 0.5694529, -1.282679, 0, 0, 0, 1, 1,
-0.4794526, -0.2936232, -3.624021, 0, 0, 0, 1, 1,
-0.4744719, 0.2990054, -2.330885, 0, 0, 0, 1, 1,
-0.4689736, -0.2019024, -2.050833, 1, 1, 1, 1, 1,
-0.4686058, 3.075896, -0.1649204, 1, 1, 1, 1, 1,
-0.4685127, -0.3660528, -0.4680111, 1, 1, 1, 1, 1,
-0.4657789, 0.3165501, -0.1224818, 1, 1, 1, 1, 1,
-0.4636301, 1.08031, 0.6507669, 1, 1, 1, 1, 1,
-0.463047, 0.146694, -1.528956, 1, 1, 1, 1, 1,
-0.4610198, 1.761507, 1.289648, 1, 1, 1, 1, 1,
-0.460192, -0.8872471, -2.46664, 1, 1, 1, 1, 1,
-0.4548011, -0.3930343, -4.399861, 1, 1, 1, 1, 1,
-0.4475685, 0.1304304, -1.241988, 1, 1, 1, 1, 1,
-0.444833, -0.2149831, -1.099612, 1, 1, 1, 1, 1,
-0.442111, -0.8360288, -2.204506, 1, 1, 1, 1, 1,
-0.4392399, 0.6875039, 0.4284514, 1, 1, 1, 1, 1,
-0.4365494, 0.005805151, -2.438774, 1, 1, 1, 1, 1,
-0.4352043, 1.658162, -0.08015156, 1, 1, 1, 1, 1,
-0.4321513, 0.7697709, 0.5243859, 0, 0, 1, 1, 1,
-0.4312454, 2.062853, -1.749189, 1, 0, 0, 1, 1,
-0.4310078, 0.4077232, -1.377316, 1, 0, 0, 1, 1,
-0.4282075, 0.5380776, -0.8770388, 1, 0, 0, 1, 1,
-0.4240088, -0.2810465, -4.145685, 1, 0, 0, 1, 1,
-0.423493, 1.083437, 0.6193689, 1, 0, 0, 1, 1,
-0.4195351, -0.516368, -2.892533, 0, 0, 0, 1, 1,
-0.4190586, -0.9749945, -5.234456, 0, 0, 0, 1, 1,
-0.4168918, -0.01072001, -1.442474, 0, 0, 0, 1, 1,
-0.4167206, -0.622521, -1.249393, 0, 0, 0, 1, 1,
-0.414801, -0.8868578, -2.027511, 0, 0, 0, 1, 1,
-0.411076, -0.137606, -3.807683, 0, 0, 0, 1, 1,
-0.4108734, -1.196648, -0.8235662, 0, 0, 0, 1, 1,
-0.4096221, -0.5790796, -1.759548, 1, 1, 1, 1, 1,
-0.4089753, -0.1702928, -1.481057, 1, 1, 1, 1, 1,
-0.4087015, -1.888597, -2.392043, 1, 1, 1, 1, 1,
-0.4054277, -0.1710702, -0.7940532, 1, 1, 1, 1, 1,
-0.4021332, -0.3933956, -2.588748, 1, 1, 1, 1, 1,
-0.399619, 0.2360274, -2.313114, 1, 1, 1, 1, 1,
-0.3956211, 1.098137, 0.6005481, 1, 1, 1, 1, 1,
-0.3906446, 0.1012353, -2.39746, 1, 1, 1, 1, 1,
-0.3888659, -0.3068314, -3.865147, 1, 1, 1, 1, 1,
-0.3870579, -0.1892817, -1.455845, 1, 1, 1, 1, 1,
-0.3833368, 0.2104705, -2.354589, 1, 1, 1, 1, 1,
-0.3814465, 1.98983, -0.8523087, 1, 1, 1, 1, 1,
-0.3788379, -1.319307, -5.019969, 1, 1, 1, 1, 1,
-0.3759083, -0.8586233, -3.524556, 1, 1, 1, 1, 1,
-0.3747998, 2.102292, 0.004718177, 1, 1, 1, 1, 1,
-0.374744, -1.30357, -2.347223, 0, 0, 1, 1, 1,
-0.3728215, 1.106522, 0.7118923, 1, 0, 0, 1, 1,
-0.3716952, -0.3912143, -3.214328, 1, 0, 0, 1, 1,
-0.3628636, -0.2371316, -0.8234572, 1, 0, 0, 1, 1,
-0.3622279, -0.7709337, -3.496159, 1, 0, 0, 1, 1,
-0.357934, -1.080636, -1.632441, 1, 0, 0, 1, 1,
-0.3492351, -0.5880467, -2.355692, 0, 0, 0, 1, 1,
-0.3475408, -0.9431574, -2.195268, 0, 0, 0, 1, 1,
-0.3328276, 0.2565836, -2.473169, 0, 0, 0, 1, 1,
-0.3239837, -0.1912751, -1.400578, 0, 0, 0, 1, 1,
-0.3200744, 0.02634715, -2.358695, 0, 0, 0, 1, 1,
-0.3142075, 1.497452, 1.859521, 0, 0, 0, 1, 1,
-0.3084123, -0.7608011, -2.734786, 0, 0, 0, 1, 1,
-0.3084075, 0.6215905, 0.7642009, 1, 1, 1, 1, 1,
-0.3071939, 0.7183853, 1.116044, 1, 1, 1, 1, 1,
-0.3055385, 1.24968, -2.21253, 1, 1, 1, 1, 1,
-0.3046785, -0.08311433, -4.624095, 1, 1, 1, 1, 1,
-0.3039888, 0.25359, -2.271895, 1, 1, 1, 1, 1,
-0.3035742, -0.6709518, -1.288326, 1, 1, 1, 1, 1,
-0.3025425, 0.9014466, -0.5743039, 1, 1, 1, 1, 1,
-0.3016124, 2.807573, -0.9463862, 1, 1, 1, 1, 1,
-0.2996627, -0.3253876, -2.620073, 1, 1, 1, 1, 1,
-0.2990345, 0.795558, -0.9862952, 1, 1, 1, 1, 1,
-0.2954091, -1.08521, -3.093965, 1, 1, 1, 1, 1,
-0.2879854, 0.6498168, 0.07424852, 1, 1, 1, 1, 1,
-0.2877873, -0.157265, -2.558171, 1, 1, 1, 1, 1,
-0.2863231, 1.690392, 0.8028772, 1, 1, 1, 1, 1,
-0.2822372, 1.140106, -1.108937, 1, 1, 1, 1, 1,
-0.2758017, -1.050678, -2.191513, 0, 0, 1, 1, 1,
-0.2564884, -0.08763953, -1.708404, 1, 0, 0, 1, 1,
-0.253629, -0.6533952, -0.7008681, 1, 0, 0, 1, 1,
-0.2489085, -0.2253705, -2.309132, 1, 0, 0, 1, 1,
-0.2478536, 1.655267, 1.749527, 1, 0, 0, 1, 1,
-0.2466182, 0.2998469, -0.8510794, 1, 0, 0, 1, 1,
-0.2466125, -0.4200099, -2.005887, 0, 0, 0, 1, 1,
-0.2463801, 0.06617534, 1.12184, 0, 0, 0, 1, 1,
-0.2413149, 0.5056822, -1.900239, 0, 0, 0, 1, 1,
-0.2412617, -0.4416082, -4.391004, 0, 0, 0, 1, 1,
-0.2392735, -0.8147715, -3.789508, 0, 0, 0, 1, 1,
-0.2378273, 0.1923949, -0.0009749451, 0, 0, 0, 1, 1,
-0.2304069, 0.2285256, 0.7787077, 0, 0, 0, 1, 1,
-0.226467, 0.3280198, -1.015691, 1, 1, 1, 1, 1,
-0.2253773, 0.5785103, 0.05190182, 1, 1, 1, 1, 1,
-0.2176066, -0.290007, -3.860414, 1, 1, 1, 1, 1,
-0.2164712, 1.203739, 1.203699, 1, 1, 1, 1, 1,
-0.2160359, -0.06695522, -1.394704, 1, 1, 1, 1, 1,
-0.2158369, 1.227493, -1.071273, 1, 1, 1, 1, 1,
-0.2123055, -1.986847, -4.240297, 1, 1, 1, 1, 1,
-0.2100423, -2.406896, -3.646943, 1, 1, 1, 1, 1,
-0.2091897, -0.8737549, -1.795483, 1, 1, 1, 1, 1,
-0.2085503, 0.004018292, -2.022325, 1, 1, 1, 1, 1,
-0.2073393, 1.029841, -0.7117701, 1, 1, 1, 1, 1,
-0.2011594, 0.1131938, -1.941686, 1, 1, 1, 1, 1,
-0.1994189, -0.3916441, -2.411593, 1, 1, 1, 1, 1,
-0.1937848, -0.09748337, -2.121726, 1, 1, 1, 1, 1,
-0.193727, -0.02121529, -0.6531707, 1, 1, 1, 1, 1,
-0.1831216, -1.042407, -2.044594, 0, 0, 1, 1, 1,
-0.1831179, -0.6493931, -2.336784, 1, 0, 0, 1, 1,
-0.1823521, -0.6812972, -1.315056, 1, 0, 0, 1, 1,
-0.1765128, -1.100426, -3.019722, 1, 0, 0, 1, 1,
-0.1763145, -1.573298, -2.333625, 1, 0, 0, 1, 1,
-0.1739029, 0.08249383, -0.646188, 1, 0, 0, 1, 1,
-0.1732356, -1.119109, -3.029602, 0, 0, 0, 1, 1,
-0.1730069, 1.050917, 0.5078848, 0, 0, 0, 1, 1,
-0.1677049, -0.1474955, -3.223435, 0, 0, 0, 1, 1,
-0.1572132, 0.5966104, 0.3123043, 0, 0, 0, 1, 1,
-0.1540547, -0.8466665, -3.298284, 0, 0, 0, 1, 1,
-0.1418465, 0.1276857, -2.890808, 0, 0, 0, 1, 1,
-0.1399076, -0.08947711, -2.33868, 0, 0, 0, 1, 1,
-0.1382244, -1.484072, -3.729834, 1, 1, 1, 1, 1,
-0.1354387, -0.81656, -3.765917, 1, 1, 1, 1, 1,
-0.1268873, -0.6180017, -1.818759, 1, 1, 1, 1, 1,
-0.1222258, -0.4254877, -3.822811, 1, 1, 1, 1, 1,
-0.1194396, -0.8685467, -1.812162, 1, 1, 1, 1, 1,
-0.1131555, -0.5268355, -5.119589, 1, 1, 1, 1, 1,
-0.1130634, -0.611223, -2.973944, 1, 1, 1, 1, 1,
-0.1114023, 0.6360845, -0.02823016, 1, 1, 1, 1, 1,
-0.1112056, 0.3924419, 0.3143847, 1, 1, 1, 1, 1,
-0.105514, 1.057008, 0.6097685, 1, 1, 1, 1, 1,
-0.1047853, 0.5583337, -1.889984, 1, 1, 1, 1, 1,
-0.1043057, -1.881522, -2.932791, 1, 1, 1, 1, 1,
-0.0984334, 0.3066004, 0.3576528, 1, 1, 1, 1, 1,
-0.09468977, -0.5686858, -3.489287, 1, 1, 1, 1, 1,
-0.093698, 0.7930096, 0.8669476, 1, 1, 1, 1, 1,
-0.08722007, -0.8734006, -3.443583, 0, 0, 1, 1, 1,
-0.08410254, 1.21322, -2.664236, 1, 0, 0, 1, 1,
-0.07500623, 1.59889, -0.2602271, 1, 0, 0, 1, 1,
-0.07408775, -1.309219, -3.30863, 1, 0, 0, 1, 1,
-0.07357424, -1.619296, -2.030374, 1, 0, 0, 1, 1,
-0.06780921, 1.09547, 1.251096, 1, 0, 0, 1, 1,
-0.06768612, -0.8420385, -3.560168, 0, 0, 0, 1, 1,
-0.06518327, -0.8506038, -0.985809, 0, 0, 0, 1, 1,
-0.0629212, -0.1092736, -3.529766, 0, 0, 0, 1, 1,
-0.06189962, -1.890277, -2.650349, 0, 0, 0, 1, 1,
-0.06095555, -0.3278065, -2.845489, 0, 0, 0, 1, 1,
-0.0607908, -0.9453942, -2.671219, 0, 0, 0, 1, 1,
-0.0599828, 0.3254318, 0.5772312, 0, 0, 0, 1, 1,
-0.05899617, 0.05230698, -0.2166116, 1, 1, 1, 1, 1,
-0.05755675, 0.0110232, -1.219994, 1, 1, 1, 1, 1,
-0.05566097, 0.01895431, -0.7802094, 1, 1, 1, 1, 1,
-0.05533006, -0.6784562, -1.261758, 1, 1, 1, 1, 1,
-0.05530986, 0.3418913, -1.433776, 1, 1, 1, 1, 1,
-0.05267715, 0.1946516, -2.708039, 1, 1, 1, 1, 1,
-0.05035701, 0.8785728, 0.4101002, 1, 1, 1, 1, 1,
-0.0492049, 0.6899707, 0.2678367, 1, 1, 1, 1, 1,
-0.04381618, 0.2531027, -1.145839, 1, 1, 1, 1, 1,
-0.04296803, 1.760482, 0.3621992, 1, 1, 1, 1, 1,
-0.04239189, 0.3665373, 0.1937124, 1, 1, 1, 1, 1,
-0.03810206, -1.439029, -3.583142, 1, 1, 1, 1, 1,
-0.03802792, 0.7579885, 0.1440004, 1, 1, 1, 1, 1,
-0.03527401, 1.123682, 0.4079934, 1, 1, 1, 1, 1,
-0.03493642, -0.5169867, -2.950388, 1, 1, 1, 1, 1,
-0.03493362, -1.06067, -4.0304, 0, 0, 1, 1, 1,
-0.03341867, 1.959433, 0.337609, 1, 0, 0, 1, 1,
-0.02815937, -1.488561, -4.068914, 1, 0, 0, 1, 1,
-0.02804899, 0.5308368, -0.3220835, 1, 0, 0, 1, 1,
-0.02655853, -0.5379393, -2.658199, 1, 0, 0, 1, 1,
-0.02618865, 0.6074526, 0.760999, 1, 0, 0, 1, 1,
-0.02569813, -0.9439147, -3.122865, 0, 0, 0, 1, 1,
-0.02538204, -1.684071, -4.458203, 0, 0, 0, 1, 1,
-0.02458595, 1.537725, 1.894071, 0, 0, 0, 1, 1,
-0.02173094, 1.190444, -0.0688602, 0, 0, 0, 1, 1,
-0.02120706, -0.602932, -2.902034, 0, 0, 0, 1, 1,
-0.02105766, 0.3939668, 0.02921561, 0, 0, 0, 1, 1,
-0.02051749, -0.5583664, -2.621579, 0, 0, 0, 1, 1,
-0.01889143, 2.367507, 0.8692886, 1, 1, 1, 1, 1,
-0.01782322, -1.717649, -3.955356, 1, 1, 1, 1, 1,
-0.01711627, 0.3506311, -2.273425, 1, 1, 1, 1, 1,
-0.01562704, 0.2389632, -0.09172931, 1, 1, 1, 1, 1,
-0.0126844, -0.6344109, -2.082493, 1, 1, 1, 1, 1,
-0.002232217, -2.124765, -4.040609, 1, 1, 1, 1, 1,
-0.001120504, 0.01648796, 2.068238, 1, 1, 1, 1, 1,
0.002164155, 0.1178008, 0.2534427, 1, 1, 1, 1, 1,
0.002308717, 0.1147243, -0.660744, 1, 1, 1, 1, 1,
0.007816252, 0.06809255, -0.4213651, 1, 1, 1, 1, 1,
0.009878309, -1.030258, 1.281511, 1, 1, 1, 1, 1,
0.01274716, -0.3031005, 2.478125, 1, 1, 1, 1, 1,
0.0154668, 0.5582218, -1.034181, 1, 1, 1, 1, 1,
0.01639857, -0.1152133, 3.166931, 1, 1, 1, 1, 1,
0.01901107, 0.2155723, 0.4648473, 1, 1, 1, 1, 1,
0.02400759, 0.2000881, 0.2705237, 0, 0, 1, 1, 1,
0.02472563, 1.292634, -0.4607083, 1, 0, 0, 1, 1,
0.0267521, 0.6143272, -0.6890512, 1, 0, 0, 1, 1,
0.02693915, 0.7359802, 0.4076859, 1, 0, 0, 1, 1,
0.02705456, -0.9375173, 2.737715, 1, 0, 0, 1, 1,
0.03262304, -0.9910524, 1.738604, 1, 0, 0, 1, 1,
0.03439964, -0.7996067, 3.316288, 0, 0, 0, 1, 1,
0.04077762, -0.317958, 3.808652, 0, 0, 0, 1, 1,
0.04281679, 0.03230703, -0.07520702, 0, 0, 0, 1, 1,
0.04581993, -0.1375092, 3.441165, 0, 0, 0, 1, 1,
0.04599786, -1.032482, 3.687023, 0, 0, 0, 1, 1,
0.04602941, -1.893857, 3.538781, 0, 0, 0, 1, 1,
0.0469883, -0.6864688, 4.478003, 0, 0, 0, 1, 1,
0.04863074, -0.6032667, 4.32994, 1, 1, 1, 1, 1,
0.05017686, 0.2348973, -0.9002627, 1, 1, 1, 1, 1,
0.05164277, 0.2179162, 1.443348, 1, 1, 1, 1, 1,
0.05438001, -0.06166898, 2.717895, 1, 1, 1, 1, 1,
0.05554069, -2.566536, 3.165598, 1, 1, 1, 1, 1,
0.05682756, 0.4873947, -0.06503415, 1, 1, 1, 1, 1,
0.05948287, 1.239407, -1.104732, 1, 1, 1, 1, 1,
0.06057514, -0.809289, 2.55771, 1, 1, 1, 1, 1,
0.06396857, -0.06403541, 2.517428, 1, 1, 1, 1, 1,
0.06422164, 1.514281, 0.5461086, 1, 1, 1, 1, 1,
0.07169899, 0.5991468, -0.5421459, 1, 1, 1, 1, 1,
0.08517921, -0.06380876, 2.540307, 1, 1, 1, 1, 1,
0.08702751, -0.6954535, 3.579455, 1, 1, 1, 1, 1,
0.08743116, 0.2308706, -1.233372, 1, 1, 1, 1, 1,
0.09065257, -0.6808914, 2.199041, 1, 1, 1, 1, 1,
0.09396524, 0.5621393, 0.4143385, 0, 0, 1, 1, 1,
0.0953258, -0.7288204, 2.769623, 1, 0, 0, 1, 1,
0.09913809, -1.105069, 2.000053, 1, 0, 0, 1, 1,
0.09982224, 0.4934587, -1.611842, 1, 0, 0, 1, 1,
0.1011712, -0.3628064, 2.931785, 1, 0, 0, 1, 1,
0.1047415, -0.4031076, 4.648428, 1, 0, 0, 1, 1,
0.1061776, 0.4610759, 0.3576957, 0, 0, 0, 1, 1,
0.1069183, 0.9877204, 2.026448, 0, 0, 0, 1, 1,
0.107305, 0.2307667, 2.810482, 0, 0, 0, 1, 1,
0.1087419, -0.4860121, 2.070842, 0, 0, 0, 1, 1,
0.1101654, 0.8101732, 0.005978405, 0, 0, 0, 1, 1,
0.1119466, 0.2589489, 1.940531, 0, 0, 0, 1, 1,
0.1124493, -0.7352139, 4.162441, 0, 0, 0, 1, 1,
0.1131402, -1.099777, 2.498425, 1, 1, 1, 1, 1,
0.1172337, 0.5206968, -2.041068, 1, 1, 1, 1, 1,
0.1205756, 0.2852944, 1.788542, 1, 1, 1, 1, 1,
0.1220965, 0.7718568, -1.573642, 1, 1, 1, 1, 1,
0.1331957, -1.721421, 4.290381, 1, 1, 1, 1, 1,
0.1356938, -0.4941654, 2.393311, 1, 1, 1, 1, 1,
0.1387445, -1.090998, 2.66738, 1, 1, 1, 1, 1,
0.1452865, 1.078861, -0.074779, 1, 1, 1, 1, 1,
0.1488505, -1.626681, 2.58332, 1, 1, 1, 1, 1,
0.1516593, -1.612399, 4.962783, 1, 1, 1, 1, 1,
0.1634212, -0.6780756, 2.443533, 1, 1, 1, 1, 1,
0.164393, -0.404799, 2.575713, 1, 1, 1, 1, 1,
0.1646438, 0.1913307, -0.8694378, 1, 1, 1, 1, 1,
0.1653546, -0.9266255, 2.84243, 1, 1, 1, 1, 1,
0.1654033, 0.8552051, 0.5602504, 1, 1, 1, 1, 1,
0.1733956, -0.9731795, 2.141089, 0, 0, 1, 1, 1,
0.1775039, 0.7369473, 2.216684, 1, 0, 0, 1, 1,
0.1804787, 0.06330158, 2.400858, 1, 0, 0, 1, 1,
0.1824159, 0.3783335, -1.314384, 1, 0, 0, 1, 1,
0.1848229, 0.6935719, 0.2360467, 1, 0, 0, 1, 1,
0.1861845, -0.7530524, 4.24286, 1, 0, 0, 1, 1,
0.1910432, 0.1429432, 1.312762, 0, 0, 0, 1, 1,
0.1925385, -0.5016565, 1.552342, 0, 0, 0, 1, 1,
0.1960099, -1.61109, 2.972608, 0, 0, 0, 1, 1,
0.1973285, 0.7601424, -0.5696031, 0, 0, 0, 1, 1,
0.2016602, -0.3661372, 2.33669, 0, 0, 0, 1, 1,
0.2019606, 0.3250813, 2.242976, 0, 0, 0, 1, 1,
0.2038061, 1.788262, 1.046004, 0, 0, 0, 1, 1,
0.2071397, 0.1870673, 0.6838822, 1, 1, 1, 1, 1,
0.2078437, -1.039428, 2.427944, 1, 1, 1, 1, 1,
0.21253, -0.2868795, 2.248175, 1, 1, 1, 1, 1,
0.2160592, -0.03309867, 1.130025, 1, 1, 1, 1, 1,
0.2183986, -1.550149, 2.287816, 1, 1, 1, 1, 1,
0.22486, -1.169413, 2.696652, 1, 1, 1, 1, 1,
0.2298849, -1.13473, 0.6055743, 1, 1, 1, 1, 1,
0.2314902, -0.08158322, 2.389954, 1, 1, 1, 1, 1,
0.2355341, -1.003381, 3.198895, 1, 1, 1, 1, 1,
0.2358809, 0.03791694, -0.5131529, 1, 1, 1, 1, 1,
0.2366376, -0.3947297, 1.713736, 1, 1, 1, 1, 1,
0.2384119, 0.3138784, 1.681152, 1, 1, 1, 1, 1,
0.2412814, 0.4736059, -1.717929, 1, 1, 1, 1, 1,
0.2422456, 1.100188, 1.112246, 1, 1, 1, 1, 1,
0.2457687, 0.3949641, 0.6276916, 1, 1, 1, 1, 1,
0.2458342, -0.9059995, 1.619582, 0, 0, 1, 1, 1,
0.2479798, 0.4957787, 1.667118, 1, 0, 0, 1, 1,
0.2518887, 0.1623119, 0.01015654, 1, 0, 0, 1, 1,
0.2545728, -2.345932, 3.429213, 1, 0, 0, 1, 1,
0.2584986, -0.2639334, 2.772006, 1, 0, 0, 1, 1,
0.2591328, -1.796385, 5.531774, 1, 0, 0, 1, 1,
0.2603239, -0.4798431, 3.162185, 0, 0, 0, 1, 1,
0.265181, 0.5612059, 1.317542, 0, 0, 0, 1, 1,
0.2670553, -0.03765239, 0.8435606, 0, 0, 0, 1, 1,
0.2676596, -0.1913416, 2.042737, 0, 0, 0, 1, 1,
0.2715183, 0.4290639, 0.811756, 0, 0, 0, 1, 1,
0.2722922, -2.065354, 2.043728, 0, 0, 0, 1, 1,
0.2733838, -0.5307064, 3.505294, 0, 0, 0, 1, 1,
0.2737232, 0.3130337, 0.4928497, 1, 1, 1, 1, 1,
0.2775294, -1.027827, 5.451562, 1, 1, 1, 1, 1,
0.2894508, -0.07291652, 1.676232, 1, 1, 1, 1, 1,
0.2898791, -1.107366, 2.277459, 1, 1, 1, 1, 1,
0.3020203, -1.288351, 2.022971, 1, 1, 1, 1, 1,
0.3032863, -0.6158826, 3.68749, 1, 1, 1, 1, 1,
0.3054557, -1.970368, 3.657841, 1, 1, 1, 1, 1,
0.3056454, -0.5657859, 2.715548, 1, 1, 1, 1, 1,
0.3087873, 1.464867, 0.5023763, 1, 1, 1, 1, 1,
0.3099181, -0.7983115, 4.111172, 1, 1, 1, 1, 1,
0.3105112, 0.2685798, -0.8244305, 1, 1, 1, 1, 1,
0.3123007, 0.06790412, 0.8730595, 1, 1, 1, 1, 1,
0.3126546, 1.637669, 0.01762164, 1, 1, 1, 1, 1,
0.3137862, 0.1474083, 0.4670672, 1, 1, 1, 1, 1,
0.3248334, -0.6277382, 2.324015, 1, 1, 1, 1, 1,
0.3263623, -0.04068166, 1.316049, 0, 0, 1, 1, 1,
0.3278055, -1.085879, 2.764544, 1, 0, 0, 1, 1,
0.3287905, -0.9055255, 2.011674, 1, 0, 0, 1, 1,
0.3334274, -0.7249594, 1.643576, 1, 0, 0, 1, 1,
0.3365528, 0.8720321, 0.1229377, 1, 0, 0, 1, 1,
0.3397986, -0.5879232, 1.242496, 1, 0, 0, 1, 1,
0.3404544, -1.14054, 3.697857, 0, 0, 0, 1, 1,
0.3449748, -0.4336252, 3.158627, 0, 0, 0, 1, 1,
0.3481466, 0.1235027, 0.9696226, 0, 0, 0, 1, 1,
0.3498908, 0.8629501, 0.5246096, 0, 0, 0, 1, 1,
0.3525114, 1.970687, 1.655693, 0, 0, 0, 1, 1,
0.3570181, 0.008914432, 1.468955, 0, 0, 0, 1, 1,
0.3788607, 0.8503195, -0.1914026, 0, 0, 0, 1, 1,
0.3830852, 0.2255584, 3.356954, 1, 1, 1, 1, 1,
0.3839965, -2.161992, 4.527125, 1, 1, 1, 1, 1,
0.3847825, -0.3020167, 1.82731, 1, 1, 1, 1, 1,
0.3868134, 0.687214, -0.5443132, 1, 1, 1, 1, 1,
0.3896115, -0.09144757, 0.8472873, 1, 1, 1, 1, 1,
0.3912744, 1.314527, 1.459503, 1, 1, 1, 1, 1,
0.3966344, -0.9440689, 3.407084, 1, 1, 1, 1, 1,
0.3996178, 0.28401, 1.818038, 1, 1, 1, 1, 1,
0.4002508, -1.137611, 2.523448, 1, 1, 1, 1, 1,
0.4046707, 0.05708413, 0.7644708, 1, 1, 1, 1, 1,
0.4054873, 0.4755546, 0.3607126, 1, 1, 1, 1, 1,
0.4091293, -0.250554, 3.440451, 1, 1, 1, 1, 1,
0.4143054, 0.04784806, 1.881866, 1, 1, 1, 1, 1,
0.414673, 0.9720525, 0.7208145, 1, 1, 1, 1, 1,
0.4192221, 1.506406, -0.02914899, 1, 1, 1, 1, 1,
0.4244776, -1.114988, 2.503012, 0, 0, 1, 1, 1,
0.4245151, -1.738955, 3.249112, 1, 0, 0, 1, 1,
0.4319645, -1.736872, 3.310528, 1, 0, 0, 1, 1,
0.434031, -0.185799, 1.314555, 1, 0, 0, 1, 1,
0.4367636, 1.283843, 0.06326111, 1, 0, 0, 1, 1,
0.4372932, 0.6366856, 1.269255, 1, 0, 0, 1, 1,
0.4385863, -0.1877355, 1.974206, 0, 0, 0, 1, 1,
0.4389357, 1.582026, 0.2514021, 0, 0, 0, 1, 1,
0.4460342, -0.02177381, 2.534841, 0, 0, 0, 1, 1,
0.4479623, -0.4117205, 4.127179, 0, 0, 0, 1, 1,
0.4483563, -0.09663017, 1.232207, 0, 0, 0, 1, 1,
0.4488871, 0.1258915, 1.113, 0, 0, 0, 1, 1,
0.4497097, 2.055775, 0.8652481, 0, 0, 0, 1, 1,
0.4499281, 2.043846, -0.1236826, 1, 1, 1, 1, 1,
0.4513532, -2.428012, 3.897398, 1, 1, 1, 1, 1,
0.4549001, -0.6645513, 2.244566, 1, 1, 1, 1, 1,
0.4624902, 0.8602946, 0.0248134, 1, 1, 1, 1, 1,
0.4651747, 0.3078091, 0.511965, 1, 1, 1, 1, 1,
0.4731666, 1.027686, 0.5099285, 1, 1, 1, 1, 1,
0.4810756, 0.5360265, 2.371031, 1, 1, 1, 1, 1,
0.4839888, 0.5004235, 0.1550536, 1, 1, 1, 1, 1,
0.4853529, -0.1185535, 2.3125, 1, 1, 1, 1, 1,
0.485509, 0.2366819, 1.104466, 1, 1, 1, 1, 1,
0.4907095, 1.764101, -1.870363, 1, 1, 1, 1, 1,
0.4926064, 0.1042555, 2.556897, 1, 1, 1, 1, 1,
0.4961553, -1.056805, 3.394593, 1, 1, 1, 1, 1,
0.4982066, 0.6979789, -0.02674215, 1, 1, 1, 1, 1,
0.498208, 0.01964793, 2.149158, 1, 1, 1, 1, 1,
0.5101975, -1.563894, 1.009118, 0, 0, 1, 1, 1,
0.5213253, -0.6035611, 2.579463, 1, 0, 0, 1, 1,
0.5237231, -0.934034, 1.817121, 1, 0, 0, 1, 1,
0.5316651, 0.9298212, -0.02494038, 1, 0, 0, 1, 1,
0.5319576, 0.8555607, 1.069425, 1, 0, 0, 1, 1,
0.5336248, 0.5334865, 0.1733298, 1, 0, 0, 1, 1,
0.5347028, 0.449289, 1.913293, 0, 0, 0, 1, 1,
0.5381438, -0.9028378, 1.620768, 0, 0, 0, 1, 1,
0.5386791, -0.7405143, 1.961351, 0, 0, 0, 1, 1,
0.5422796, -1.330019, 3.759148, 0, 0, 0, 1, 1,
0.5457758, 0.1610134, 2.448118, 0, 0, 0, 1, 1,
0.5457938, -0.3287973, 0.9687355, 0, 0, 0, 1, 1,
0.5467456, -0.6027744, 3.866125, 0, 0, 0, 1, 1,
0.5526391, -0.7262598, 1.856839, 1, 1, 1, 1, 1,
0.5528607, -1.096741, 3.381581, 1, 1, 1, 1, 1,
0.5588394, 1.856981, -0.1640911, 1, 1, 1, 1, 1,
0.5597922, -1.973053, 2.677306, 1, 1, 1, 1, 1,
0.5628489, -0.2845736, 1.53989, 1, 1, 1, 1, 1,
0.5638977, -1.536819, 2.834659, 1, 1, 1, 1, 1,
0.5700976, 1.000668, 0.7371221, 1, 1, 1, 1, 1,
0.5713769, 1.131273, -0.3995883, 1, 1, 1, 1, 1,
0.5730756, 0.8473294, -2.417172, 1, 1, 1, 1, 1,
0.5740889, 2.07181, 0.4239903, 1, 1, 1, 1, 1,
0.5771554, 0.7730243, 1.042189, 1, 1, 1, 1, 1,
0.5837194, 0.7448553, 2.149959, 1, 1, 1, 1, 1,
0.5863012, -0.9054896, 2.833343, 1, 1, 1, 1, 1,
0.588011, -0.1903451, 3.136966, 1, 1, 1, 1, 1,
0.5909233, 1.328674, 0.6164967, 1, 1, 1, 1, 1,
0.5927953, -1.095261, 2.449076, 0, 0, 1, 1, 1,
0.5933889, 0.05864945, 1.335701, 1, 0, 0, 1, 1,
0.5939286, -1.657735, 4.435722, 1, 0, 0, 1, 1,
0.5945588, 0.937801, 0.7452533, 1, 0, 0, 1, 1,
0.5980815, 1.324937, 0.3592407, 1, 0, 0, 1, 1,
0.6005955, 0.8245307, 1.643821, 1, 0, 0, 1, 1,
0.6011612, -0.6600376, 2.548906, 0, 0, 0, 1, 1,
0.609095, 0.7730608, -0.254323, 0, 0, 0, 1, 1,
0.6105129, 0.5105927, 0.2768959, 0, 0, 0, 1, 1,
0.611754, -0.8120314, 3.135662, 0, 0, 0, 1, 1,
0.6126078, 0.520041, -0.9017808, 0, 0, 0, 1, 1,
0.6185461, -0.5406991, 0.04940333, 0, 0, 0, 1, 1,
0.6197062, -1.377476, 2.203418, 0, 0, 0, 1, 1,
0.6210989, 0.8117282, 1.592949, 1, 1, 1, 1, 1,
0.6215558, -0.9390262, 2.338422, 1, 1, 1, 1, 1,
0.6249506, 0.4860619, 0.1622398, 1, 1, 1, 1, 1,
0.6259858, -1.782571, 1.595322, 1, 1, 1, 1, 1,
0.6277229, -0.1996521, 1.730254, 1, 1, 1, 1, 1,
0.628641, 1.133358, 1.191096, 1, 1, 1, 1, 1,
0.629369, 0.8422918, 0.3774973, 1, 1, 1, 1, 1,
0.6319141, -1.320808, 2.662211, 1, 1, 1, 1, 1,
0.633646, 0.3414167, 1.825492, 1, 1, 1, 1, 1,
0.6397845, 1.647856, 1.122983, 1, 1, 1, 1, 1,
0.6406141, -0.5015942, 4.032783, 1, 1, 1, 1, 1,
0.6423038, -1.612511, 2.15553, 1, 1, 1, 1, 1,
0.6444907, -0.2552207, 1.812573, 1, 1, 1, 1, 1,
0.6507639, -0.5952276, 2.086446, 1, 1, 1, 1, 1,
0.652427, -0.3663137, 1.436358, 1, 1, 1, 1, 1,
0.6542993, -0.007880258, 0.3208936, 0, 0, 1, 1, 1,
0.6557013, -1.565563, 1.558179, 1, 0, 0, 1, 1,
0.655798, 1.435644, -0.1325617, 1, 0, 0, 1, 1,
0.6564218, -0.8283082, 5.222335, 1, 0, 0, 1, 1,
0.6589015, 0.4776605, 0.5789145, 1, 0, 0, 1, 1,
0.6622415, -1.083868, 2.242975, 1, 0, 0, 1, 1,
0.6629537, 0.7412819, 1.489626, 0, 0, 0, 1, 1,
0.6704553, -0.6411762, 3.65747, 0, 0, 0, 1, 1,
0.6709471, -1.966272, 3.469015, 0, 0, 0, 1, 1,
0.6830811, -0.6286381, 1.143692, 0, 0, 0, 1, 1,
0.6850029, -0.9758277, 1.156497, 0, 0, 0, 1, 1,
0.6902893, 3.09853, 0.8695862, 0, 0, 0, 1, 1,
0.6918435, -2.083931, 2.086662, 0, 0, 0, 1, 1,
0.6996174, 1.083037, 2.491934, 1, 1, 1, 1, 1,
0.719686, -0.1680056, 1.745667, 1, 1, 1, 1, 1,
0.7221603, -0.766439, 1.610869, 1, 1, 1, 1, 1,
0.7271179, -0.769165, 3.214133, 1, 1, 1, 1, 1,
0.7281877, -1.012664, 1.445867, 1, 1, 1, 1, 1,
0.7491291, -0.8842563, 2.86317, 1, 1, 1, 1, 1,
0.7493026, 0.6392829, 1.466854, 1, 1, 1, 1, 1,
0.7526171, 0.1307344, 1.323019, 1, 1, 1, 1, 1,
0.7584549, -0.1498509, 2.072303, 1, 1, 1, 1, 1,
0.7604709, -0.2661359, 3.047376, 1, 1, 1, 1, 1,
0.7632755, 0.4649076, 0.9139385, 1, 1, 1, 1, 1,
0.763455, -0.1915303, 1.422222, 1, 1, 1, 1, 1,
0.7643387, -0.4711784, 1.854312, 1, 1, 1, 1, 1,
0.7662942, -2.410625, 5.59151, 1, 1, 1, 1, 1,
0.7726107, 0.9504943, 0.1737211, 1, 1, 1, 1, 1,
0.7754502, 0.2745573, 0.4818265, 0, 0, 1, 1, 1,
0.7934482, 0.3203283, 1.667746, 1, 0, 0, 1, 1,
0.7961818, -0.875991, 2.593994, 1, 0, 0, 1, 1,
0.8035616, -0.8865331, 1.787799, 1, 0, 0, 1, 1,
0.8078036, 1.173516, 0.6607122, 1, 0, 0, 1, 1,
0.808028, 0.6134698, 1.372655, 1, 0, 0, 1, 1,
0.8091301, -0.02276604, 3.013796, 0, 0, 0, 1, 1,
0.8119839, -0.2073488, 0.2863678, 0, 0, 0, 1, 1,
0.8130264, 0.8491948, 0.2418607, 0, 0, 0, 1, 1,
0.8184199, 0.7047362, 2.778941, 0, 0, 0, 1, 1,
0.8192048, 0.8395362, 0.6170684, 0, 0, 0, 1, 1,
0.8254845, -0.7736071, 2.194666, 0, 0, 0, 1, 1,
0.8268268, 0.8400221, -0.8669294, 0, 0, 0, 1, 1,
0.839672, -0.4766104, 2.628611, 1, 1, 1, 1, 1,
0.8448191, 0.734062, 1.716215, 1, 1, 1, 1, 1,
0.8493131, 0.8700463, -0.154671, 1, 1, 1, 1, 1,
0.8505871, 0.5816131, 2.000715, 1, 1, 1, 1, 1,
0.8518229, -0.7723861, 0.9098695, 1, 1, 1, 1, 1,
0.8536152, -0.704488, 0.6702912, 1, 1, 1, 1, 1,
0.8540103, 0.6467307, 0.4674593, 1, 1, 1, 1, 1,
0.8547634, 1.322909, 0.4152887, 1, 1, 1, 1, 1,
0.8636639, 0.08810715, 2.102313, 1, 1, 1, 1, 1,
0.8660855, -0.3229139, 3.422711, 1, 1, 1, 1, 1,
0.8661861, 1.463182, 0.1463544, 1, 1, 1, 1, 1,
0.8688675, -0.3998711, 2.68563, 1, 1, 1, 1, 1,
0.8706809, -1.061552, 2.175545, 1, 1, 1, 1, 1,
0.8710428, 1.32483, 1.752484, 1, 1, 1, 1, 1,
0.8716077, 0.5826136, 1.984642, 1, 1, 1, 1, 1,
0.8758392, 0.4662138, 2.500661, 0, 0, 1, 1, 1,
0.8879285, -0.8881505, 2.397879, 1, 0, 0, 1, 1,
0.8882264, -1.428025, 4.05521, 1, 0, 0, 1, 1,
0.8907774, -0.2630037, 1.570114, 1, 0, 0, 1, 1,
0.896517, 0.422576, 1.803666, 1, 0, 0, 1, 1,
0.9175733, 0.2478918, 2.020204, 1, 0, 0, 1, 1,
0.9195894, -1.268214, 2.654455, 0, 0, 0, 1, 1,
0.9196275, -0.9313328, 1.672125, 0, 0, 0, 1, 1,
0.9227791, -0.1968856, 3.046953, 0, 0, 0, 1, 1,
0.9270093, 1.076504, 1.064076, 0, 0, 0, 1, 1,
0.9305045, 0.9695584, 0.1698419, 0, 0, 0, 1, 1,
0.9349657, -0.9749414, 1.374218, 0, 0, 0, 1, 1,
0.939064, -0.4369141, 1.772754, 0, 0, 0, 1, 1,
0.9454811, 1.455117, 0.3116752, 1, 1, 1, 1, 1,
0.9456869, -0.0563901, 2.676141, 1, 1, 1, 1, 1,
0.9463097, 0.8267343, 4.0515, 1, 1, 1, 1, 1,
0.9589848, 0.2479744, 3.026372, 1, 1, 1, 1, 1,
0.9622921, -0.01841827, 0.7580206, 1, 1, 1, 1, 1,
0.9653345, 1.101583, 1.199298, 1, 1, 1, 1, 1,
0.9664931, 3.561816, 0.5874085, 1, 1, 1, 1, 1,
0.9682922, 0.925588, 1.706864, 1, 1, 1, 1, 1,
0.9755128, 1.258029, 1.257541, 1, 1, 1, 1, 1,
0.9755279, 2.355764, 1.049224, 1, 1, 1, 1, 1,
0.9758041, -1.357283, 0.9701369, 1, 1, 1, 1, 1,
0.9762086, 0.6050617, 0.3127122, 1, 1, 1, 1, 1,
0.9811829, -1.357549, 2.239232, 1, 1, 1, 1, 1,
0.9875385, 1.991602, -0.4454941, 1, 1, 1, 1, 1,
0.9965994, 1.69883, 2.388493, 1, 1, 1, 1, 1,
1.013216, 0.6178982, 1.178271, 0, 0, 1, 1, 1,
1.019021, 0.6189457, 2.007852, 1, 0, 0, 1, 1,
1.02694, -0.5276589, 2.270306, 1, 0, 0, 1, 1,
1.036632, -0.824316, 2.194544, 1, 0, 0, 1, 1,
1.036654, 0.04892458, 1.474506, 1, 0, 0, 1, 1,
1.037247, -3.027767, 3.565279, 1, 0, 0, 1, 1,
1.041523, -1.093451, 1.395283, 0, 0, 0, 1, 1,
1.042624, 0.8241079, 1.317052, 0, 0, 0, 1, 1,
1.043934, 0.1163201, 1.02678, 0, 0, 0, 1, 1,
1.049699, 1.851387, 0.7300097, 0, 0, 0, 1, 1,
1.063796, 1.059991, 0.2730418, 0, 0, 0, 1, 1,
1.067572, -1.860404, 3.059605, 0, 0, 0, 1, 1,
1.07298, -1.526106, 0.8316853, 0, 0, 0, 1, 1,
1.073861, -0.5537978, 0.8865513, 1, 1, 1, 1, 1,
1.075052, 0.8435475, 1.045497, 1, 1, 1, 1, 1,
1.081463, 0.00568492, 2.046266, 1, 1, 1, 1, 1,
1.087486, 1.667802, 0.6810784, 1, 1, 1, 1, 1,
1.088956, -1.306379, 2.475378, 1, 1, 1, 1, 1,
1.098603, -0.6486213, 2.718202, 1, 1, 1, 1, 1,
1.098755, -0.837544, 3.260731, 1, 1, 1, 1, 1,
1.101712, -0.3936402, 2.008926, 1, 1, 1, 1, 1,
1.10222, -0.5938687, 1.312708, 1, 1, 1, 1, 1,
1.1025, 1.713749, -1.068349, 1, 1, 1, 1, 1,
1.103927, -1.637145, 2.792114, 1, 1, 1, 1, 1,
1.116647, 0.5742992, 0.3005846, 1, 1, 1, 1, 1,
1.122531, -0.0903568, 0.7110759, 1, 1, 1, 1, 1,
1.124902, 1.167462, -0.1075853, 1, 1, 1, 1, 1,
1.125364, -2.445307, 3.536634, 1, 1, 1, 1, 1,
1.127192, -0.522581, 2.550382, 0, 0, 1, 1, 1,
1.129257, 0.2616379, 1.255029, 1, 0, 0, 1, 1,
1.139521, 0.4766991, 1.319286, 1, 0, 0, 1, 1,
1.144076, 0.1954587, 2.567585, 1, 0, 0, 1, 1,
1.147488, 1.112554, 2.312695, 1, 0, 0, 1, 1,
1.148396, -1.001193, 1.188656, 1, 0, 0, 1, 1,
1.149576, 0.3459288, 1.771308, 0, 0, 0, 1, 1,
1.151839, 0.0467364, 2.046335, 0, 0, 0, 1, 1,
1.157371, 0.6049374, 2.241313, 0, 0, 0, 1, 1,
1.158171, -0.1420158, 1.064021, 0, 0, 0, 1, 1,
1.163598, -0.821263, 1.212351, 0, 0, 0, 1, 1,
1.175549, -1.211351, 1.563426, 0, 0, 0, 1, 1,
1.176712, -0.8223179, 2.389095, 0, 0, 0, 1, 1,
1.182647, 0.5623488, 1.916124, 1, 1, 1, 1, 1,
1.191211, -0.3692952, 1.065829, 1, 1, 1, 1, 1,
1.192485, -0.8554112, 2.328331, 1, 1, 1, 1, 1,
1.200708, -1.217919, 2.375386, 1, 1, 1, 1, 1,
1.202512, 0.1398304, 1.613595, 1, 1, 1, 1, 1,
1.202515, 0.4812004, 2.169893, 1, 1, 1, 1, 1,
1.205387, 0.6817372, 0.6403331, 1, 1, 1, 1, 1,
1.207343, -0.4801724, 2.410181, 1, 1, 1, 1, 1,
1.213693, -0.4905178, 3.713862, 1, 1, 1, 1, 1,
1.214281, -1.141021, 4.213149, 1, 1, 1, 1, 1,
1.215383, 1.602951, -0.5688087, 1, 1, 1, 1, 1,
1.217669, -1.354655, 0.5800259, 1, 1, 1, 1, 1,
1.21791, -0.3351126, 1.038989, 1, 1, 1, 1, 1,
1.219221, -1.103705, 1.627724, 1, 1, 1, 1, 1,
1.224224, 0.1305127, 2.049681, 1, 1, 1, 1, 1,
1.224288, 0.8662351, 0.7388178, 0, 0, 1, 1, 1,
1.228568, 0.07249632, 0.2579753, 1, 0, 0, 1, 1,
1.229603, -0.1297762, 2.393061, 1, 0, 0, 1, 1,
1.231823, -0.5511705, 1.018938, 1, 0, 0, 1, 1,
1.241055, 0.312209, 1.751824, 1, 0, 0, 1, 1,
1.244936, 0.03299067, 2.111992, 1, 0, 0, 1, 1,
1.245102, 0.3834985, 1.836658, 0, 0, 0, 1, 1,
1.245352, 1.59179, 0.9010348, 0, 0, 0, 1, 1,
1.248614, -1.082988, 1.865044, 0, 0, 0, 1, 1,
1.250266, 1.784536, -0.2214087, 0, 0, 0, 1, 1,
1.252204, 1.436098, 0.7013374, 0, 0, 0, 1, 1,
1.255926, -0.5872997, 2.141844, 0, 0, 0, 1, 1,
1.258561, 0.9255889, 0.8279049, 0, 0, 0, 1, 1,
1.260874, 0.03050354, 1.723711, 1, 1, 1, 1, 1,
1.262784, 0.393568, 1.743672, 1, 1, 1, 1, 1,
1.270154, -1.728081, 2.698832, 1, 1, 1, 1, 1,
1.279803, -0.6290058, 1.65888, 1, 1, 1, 1, 1,
1.288757, 1.489609, 0.9413164, 1, 1, 1, 1, 1,
1.29282, 0.6798063, -0.1880214, 1, 1, 1, 1, 1,
1.292967, -0.1708797, 1.059447, 1, 1, 1, 1, 1,
1.294379, -0.6656403, 3.00876, 1, 1, 1, 1, 1,
1.294512, 1.067186, 0.0250951, 1, 1, 1, 1, 1,
1.314185, -1.440568, 2.225908, 1, 1, 1, 1, 1,
1.327224, 0.1334876, -0.6008286, 1, 1, 1, 1, 1,
1.329807, -0.4986461, 1.697849, 1, 1, 1, 1, 1,
1.333669, -0.4302821, 1.270258, 1, 1, 1, 1, 1,
1.348639, -1.19572, 1.140582, 1, 1, 1, 1, 1,
1.349557, -0.7739341, 0.7742013, 1, 1, 1, 1, 1,
1.353489, 0.03912152, -0.9143435, 0, 0, 1, 1, 1,
1.368391, -0.6137071, 1.640215, 1, 0, 0, 1, 1,
1.388011, 0.1091176, 2.562366, 1, 0, 0, 1, 1,
1.3891, -0.03333803, 1.55174, 1, 0, 0, 1, 1,
1.397698, -0.5683755, 1.761085, 1, 0, 0, 1, 1,
1.398951, -0.2295671, 0.4755868, 1, 0, 0, 1, 1,
1.40549, -0.4778434, 2.723673, 0, 0, 0, 1, 1,
1.408599, 1.245129, 1.911578, 0, 0, 0, 1, 1,
1.417629, 1.23276, 0.6115319, 0, 0, 0, 1, 1,
1.42186, -0.2084844, 2.049181, 0, 0, 0, 1, 1,
1.430784, -1.065629, 2.710465, 0, 0, 0, 1, 1,
1.437084, 1.134673, 1.67041, 0, 0, 0, 1, 1,
1.444417, 0.02152085, 1.897715, 0, 0, 0, 1, 1,
1.454143, -0.6881397, 3.402471, 1, 1, 1, 1, 1,
1.461312, 1.076011, 1.058429, 1, 1, 1, 1, 1,
1.465595, -0.08676436, 0.4507535, 1, 1, 1, 1, 1,
1.488613, 0.3246745, 0.4218895, 1, 1, 1, 1, 1,
1.494009, -0.4348953, 1.951154, 1, 1, 1, 1, 1,
1.502932, 1.762274, -1.072096, 1, 1, 1, 1, 1,
1.509134, -1.134492, 1.997845, 1, 1, 1, 1, 1,
1.515945, 0.1367459, 4.300972, 1, 1, 1, 1, 1,
1.525883, 1.008071, 2.376136, 1, 1, 1, 1, 1,
1.558426, 3.07803, 0.9357718, 1, 1, 1, 1, 1,
1.565658, 0.1502136, 2.136045, 1, 1, 1, 1, 1,
1.596937, -0.1082664, 2.073326, 1, 1, 1, 1, 1,
1.611344, 1.166354, -0.7802489, 1, 1, 1, 1, 1,
1.61542, 0.3217864, 1.364184, 1, 1, 1, 1, 1,
1.623799, -0.2511822, 4.215497, 1, 1, 1, 1, 1,
1.626959, -0.05757956, 1.050444, 0, 0, 1, 1, 1,
1.629804, -0.8351003, 3.611256, 1, 0, 0, 1, 1,
1.632993, 1.491945, 0.06897295, 1, 0, 0, 1, 1,
1.639342, -0.7831023, 2.122402, 1, 0, 0, 1, 1,
1.647375, -0.5968798, 1.088514, 1, 0, 0, 1, 1,
1.647473, -1.017794, 3.02813, 1, 0, 0, 1, 1,
1.647988, -0.7399877, 2.668967, 0, 0, 0, 1, 1,
1.705962, 0.7266543, 2.613629, 0, 0, 0, 1, 1,
1.729518, -0.4059145, 2.798207, 0, 0, 0, 1, 1,
1.741152, 1.049541, 1.120169, 0, 0, 0, 1, 1,
1.748622, -1.006713, 1.166145, 0, 0, 0, 1, 1,
1.775814, 2.039652, 0.5502383, 0, 0, 0, 1, 1,
1.79445, -0.5133827, 0.1184274, 0, 0, 0, 1, 1,
1.814318, -0.5080117, 2.570535, 1, 1, 1, 1, 1,
1.830231, -0.2826318, 3.061693, 1, 1, 1, 1, 1,
1.83039, -1.586912, 4.31465, 1, 1, 1, 1, 1,
1.835948, -1.4596, 2.84248, 1, 1, 1, 1, 1,
1.84232, -0.03480822, 1.660049, 1, 1, 1, 1, 1,
1.851986, 0.48815, 0.1732692, 1, 1, 1, 1, 1,
1.862678, 0.733409, 2.881098, 1, 1, 1, 1, 1,
1.875074, 0.3992474, 2.666272, 1, 1, 1, 1, 1,
1.883603, 1.024901, 0.1628044, 1, 1, 1, 1, 1,
1.899938, 0.6404394, 0.3624463, 1, 1, 1, 1, 1,
1.946619, 0.4472563, 1.132838, 1, 1, 1, 1, 1,
1.952939, -0.0177705, 1.753893, 1, 1, 1, 1, 1,
1.982344, -0.4872712, 1.84931, 1, 1, 1, 1, 1,
2.02065, 0.3574552, -0.7136483, 1, 1, 1, 1, 1,
2.023195, 1.121254, 2.355764, 1, 1, 1, 1, 1,
2.076141, -0.3493223, 1.302834, 0, 0, 1, 1, 1,
2.110629, -1.308628, 1.827876, 1, 0, 0, 1, 1,
2.114634, 1.070777, -0.456087, 1, 0, 0, 1, 1,
2.120547, -1.053849, 3.447443, 1, 0, 0, 1, 1,
2.130054, -0.4410877, 2.871578, 1, 0, 0, 1, 1,
2.134496, -0.1503761, 1.730861, 1, 0, 0, 1, 1,
2.219736, 0.8768883, 3.043637, 0, 0, 0, 1, 1,
2.294495, 0.1214674, 0.7446467, 0, 0, 0, 1, 1,
2.356796, -1.122409, 1.824239, 0, 0, 0, 1, 1,
2.362386, -1.8032, 0.2166821, 0, 0, 0, 1, 1,
2.39874, -1.138317, 2.528411, 0, 0, 0, 1, 1,
2.432684, 1.026691, 2.160255, 0, 0, 0, 1, 1,
2.511381, -0.05531877, 2.625993, 0, 0, 0, 1, 1,
2.537289, 0.3754726, 1.364274, 1, 1, 1, 1, 1,
2.55068, 0.6272997, 1.083447, 1, 1, 1, 1, 1,
2.638781, 1.017027, 1.597627, 1, 1, 1, 1, 1,
2.687843, 0.8215868, 0.8136101, 1, 1, 1, 1, 1,
2.731912, 1.142582, 0.4339027, 1, 1, 1, 1, 1,
2.734892, 0.8351509, 1.950604, 1, 1, 1, 1, 1,
3.017107, -0.765725, 4.353563, 1, 1, 1, 1, 1
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
var radius = 10.0733;
var distance = 35.38203;
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
mvMatrix.translate( 0.3421557, -0.2670248, 0.2211404 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.38203);
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
