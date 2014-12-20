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
-2.935606, -0.5575325, -3.013687, 1, 0, 0, 1,
-2.693141, 0.484134, -1.672975, 1, 0.007843138, 0, 1,
-2.665236, -1.860127, -1.420537, 1, 0.01176471, 0, 1,
-2.466916, 0.6121936, -0.8456292, 1, 0.01960784, 0, 1,
-2.463958, -1.451483, -1.877594, 1, 0.02352941, 0, 1,
-2.459773, 0.5484785, -1.821325, 1, 0.03137255, 0, 1,
-2.417011, 1.122066, -2.358674, 1, 0.03529412, 0, 1,
-2.413791, -0.7126108, -1.833277, 1, 0.04313726, 0, 1,
-2.306346, -1.260383, -1.836361, 1, 0.04705882, 0, 1,
-2.295991, 1.349085, 0.04362657, 1, 0.05490196, 0, 1,
-2.282123, 1.084893, 0.09314882, 1, 0.05882353, 0, 1,
-2.242832, -0.161503, -1.906202, 1, 0.06666667, 0, 1,
-2.22566, -0.9772503, -0.847937, 1, 0.07058824, 0, 1,
-2.214584, -0.1640694, -2.099329, 1, 0.07843138, 0, 1,
-2.172508, -0.1670361, -0.5537762, 1, 0.08235294, 0, 1,
-2.161132, -1.003595, -2.186253, 1, 0.09019608, 0, 1,
-2.157631, -1.286321, -3.354691, 1, 0.09411765, 0, 1,
-2.076321, -0.09709023, -2.503196, 1, 0.1019608, 0, 1,
-2.058652, 0.2317694, -1.386562, 1, 0.1098039, 0, 1,
-2.044424, -1.225555, -3.892102, 1, 0.1137255, 0, 1,
-2.040984, -0.8399381, -1.445553, 1, 0.1215686, 0, 1,
-2.027017, 0.7959116, -1.834905, 1, 0.1254902, 0, 1,
-2.010319, -1.635188, -2.246128, 1, 0.1333333, 0, 1,
-2.006386, 1.233379, -1.153033, 1, 0.1372549, 0, 1,
-2.005582, -0.709843, -2.153254, 1, 0.145098, 0, 1,
-1.97102, -0.3106123, -0.9417049, 1, 0.1490196, 0, 1,
-1.945861, 2.642212, -0.8882412, 1, 0.1568628, 0, 1,
-1.923225, 0.1798792, -1.831182, 1, 0.1607843, 0, 1,
-1.884503, -0.7389942, -0.3357659, 1, 0.1686275, 0, 1,
-1.849055, 1.437573, -1.804152, 1, 0.172549, 0, 1,
-1.823979, -0.5216045, -2.779544, 1, 0.1803922, 0, 1,
-1.822533, 0.9589987, -1.72034, 1, 0.1843137, 0, 1,
-1.813079, 0.04792885, -3.406671, 1, 0.1921569, 0, 1,
-1.80961, -1.300746, -1.291882, 1, 0.1960784, 0, 1,
-1.76629, 1.101298, -0.1795911, 1, 0.2039216, 0, 1,
-1.76451, -0.8086976, -3.838972, 1, 0.2117647, 0, 1,
-1.732674, -0.195469, -1.29141, 1, 0.2156863, 0, 1,
-1.731895, 1.890967, 0.05283239, 1, 0.2235294, 0, 1,
-1.731083, 0.4927498, -0.118366, 1, 0.227451, 0, 1,
-1.720045, 0.2652606, -2.576849, 1, 0.2352941, 0, 1,
-1.681598, -0.8249727, -1.366959, 1, 0.2392157, 0, 1,
-1.677887, 0.3847318, -2.944452, 1, 0.2470588, 0, 1,
-1.676146, -1.454233, -3.486406, 1, 0.2509804, 0, 1,
-1.662917, -0.0688999, -3.475845, 1, 0.2588235, 0, 1,
-1.656044, -0.3652483, -3.296051, 1, 0.2627451, 0, 1,
-1.639034, -0.1660946, -1.431048, 1, 0.2705882, 0, 1,
-1.636429, 1.822736, 0.6460549, 1, 0.2745098, 0, 1,
-1.601001, -1.543045, -3.561284, 1, 0.282353, 0, 1,
-1.599573, -0.6371345, -2.15696, 1, 0.2862745, 0, 1,
-1.592276, -0.2638774, -2.646556, 1, 0.2941177, 0, 1,
-1.588501, 0.4893893, 0.02193948, 1, 0.3019608, 0, 1,
-1.582216, 1.143943, 0.3065399, 1, 0.3058824, 0, 1,
-1.552187, 0.1716485, -3.547238, 1, 0.3137255, 0, 1,
-1.548888, 0.4220703, -1.167099, 1, 0.3176471, 0, 1,
-1.541064, -1.91087, -2.126349, 1, 0.3254902, 0, 1,
-1.53196, 0.2933125, -2.552581, 1, 0.3294118, 0, 1,
-1.528333, 1.407734, -0.2463542, 1, 0.3372549, 0, 1,
-1.520318, 1.385912, -2.701378, 1, 0.3411765, 0, 1,
-1.502409, -0.2476158, -1.922343, 1, 0.3490196, 0, 1,
-1.491967, 0.6860806, 0.6405343, 1, 0.3529412, 0, 1,
-1.490386, 0.02122412, 0.4056228, 1, 0.3607843, 0, 1,
-1.470482, -1.317345, -2.651481, 1, 0.3647059, 0, 1,
-1.46666, -1.929704, -1.966594, 1, 0.372549, 0, 1,
-1.449456, -0.4893855, -2.966687, 1, 0.3764706, 0, 1,
-1.445388, 0.5602224, -1.388771, 1, 0.3843137, 0, 1,
-1.443367, 0.3449574, -1.244599, 1, 0.3882353, 0, 1,
-1.42664, 0.1510366, -0.8243203, 1, 0.3960784, 0, 1,
-1.422999, 1.052027, -1.578288, 1, 0.4039216, 0, 1,
-1.420293, 0.2097219, 0.2375544, 1, 0.4078431, 0, 1,
-1.419873, -0.07399479, -0.387986, 1, 0.4156863, 0, 1,
-1.41165, 0.9897032, -0.4641937, 1, 0.4196078, 0, 1,
-1.406895, 1.023567, -1.448992, 1, 0.427451, 0, 1,
-1.388597, -0.8710371, -3.532949, 1, 0.4313726, 0, 1,
-1.386852, -1.238052, -3.376176, 1, 0.4392157, 0, 1,
-1.382738, -1.608973, -1.767467, 1, 0.4431373, 0, 1,
-1.381522, 1.429852, -1.005292, 1, 0.4509804, 0, 1,
-1.379737, 0.4996626, -1.030521, 1, 0.454902, 0, 1,
-1.367627, -0.6916871, -1.405161, 1, 0.4627451, 0, 1,
-1.36473, 1.117065, -0.8874517, 1, 0.4666667, 0, 1,
-1.352206, 1.074358, -1.418183, 1, 0.4745098, 0, 1,
-1.33762, 0.871342, -0.921445, 1, 0.4784314, 0, 1,
-1.33292, -0.9673478, -1.603716, 1, 0.4862745, 0, 1,
-1.326462, 0.06122132, -2.311886, 1, 0.4901961, 0, 1,
-1.32498, -0.2716817, -1.581472, 1, 0.4980392, 0, 1,
-1.323727, 0.7785156, -0.2953893, 1, 0.5058824, 0, 1,
-1.321876, 1.306354, -1.044315, 1, 0.509804, 0, 1,
-1.318202, -1.734585, -2.615648, 1, 0.5176471, 0, 1,
-1.296239, -1.044423, -1.564869, 1, 0.5215687, 0, 1,
-1.294637, 0.4694265, -2.281445, 1, 0.5294118, 0, 1,
-1.293946, -1.659546, -2.987447, 1, 0.5333334, 0, 1,
-1.286715, -0.268767, -0.7984966, 1, 0.5411765, 0, 1,
-1.277035, -0.5678643, -1.065982, 1, 0.5450981, 0, 1,
-1.26713, 0.3648633, -1.047245, 1, 0.5529412, 0, 1,
-1.26612, -0.05235795, -1.546542, 1, 0.5568628, 0, 1,
-1.265072, -0.04301217, -0.9457674, 1, 0.5647059, 0, 1,
-1.261256, -0.1567619, -0.7424678, 1, 0.5686275, 0, 1,
-1.259542, 0.4945725, -0.3642676, 1, 0.5764706, 0, 1,
-1.255765, -0.53686, -1.853652, 1, 0.5803922, 0, 1,
-1.252353, 0.2188631, -1.550322, 1, 0.5882353, 0, 1,
-1.247988, 0.05269958, -1.544771, 1, 0.5921569, 0, 1,
-1.244594, -1.142022, -3.155617, 1, 0.6, 0, 1,
-1.243399, 1.214842, 0.65299, 1, 0.6078432, 0, 1,
-1.243354, -2.277829, -3.017878, 1, 0.6117647, 0, 1,
-1.224418, 0.506819, -0.7059007, 1, 0.6196079, 0, 1,
-1.219176, 1.720101, -1.159759, 1, 0.6235294, 0, 1,
-1.21301, 0.1740489, -0.6957315, 1, 0.6313726, 0, 1,
-1.20662, -1.188575, -1.268036, 1, 0.6352941, 0, 1,
-1.195046, 0.1193364, -1.685575, 1, 0.6431373, 0, 1,
-1.192315, 1.081854, -1.593177, 1, 0.6470588, 0, 1,
-1.172309, -1.141269, -2.006279, 1, 0.654902, 0, 1,
-1.170488, 0.3382676, -0.1836632, 1, 0.6588235, 0, 1,
-1.168611, -0.2928382, -1.211725, 1, 0.6666667, 0, 1,
-1.168587, 1.251838, -0.5033076, 1, 0.6705883, 0, 1,
-1.168219, -1.164963, -3.149528, 1, 0.6784314, 0, 1,
-1.159808, 1.546688, -1.529032, 1, 0.682353, 0, 1,
-1.154149, 0.9268833, -1.571872, 1, 0.6901961, 0, 1,
-1.147896, 0.4195232, -1.176084, 1, 0.6941177, 0, 1,
-1.145879, -0.4314963, -3.309165, 1, 0.7019608, 0, 1,
-1.144282, -0.235774, -2.38034, 1, 0.7098039, 0, 1,
-1.141771, 0.6610115, -1.980676, 1, 0.7137255, 0, 1,
-1.134245, -0.7294419, -2.495406, 1, 0.7215686, 0, 1,
-1.13083, -0.2189611, -1.86543, 1, 0.7254902, 0, 1,
-1.125571, 1.34996, -3.121356, 1, 0.7333333, 0, 1,
-1.121377, 1.08698, -0.7651238, 1, 0.7372549, 0, 1,
-1.119537, 0.9887885, -1.680141, 1, 0.7450981, 0, 1,
-1.116197, -0.9114735, -2.729312, 1, 0.7490196, 0, 1,
-1.112711, -1.33922, -0.134694, 1, 0.7568628, 0, 1,
-1.109869, -0.267543, -1.988971, 1, 0.7607843, 0, 1,
-1.105752, -2.63935, -2.994714, 1, 0.7686275, 0, 1,
-1.09994, 1.122451, 0.4090504, 1, 0.772549, 0, 1,
-1.098103, 0.2375623, -2.530989, 1, 0.7803922, 0, 1,
-1.091843, 0.02489871, 0.852532, 1, 0.7843137, 0, 1,
-1.070205, -1.003728, -3.191786, 1, 0.7921569, 0, 1,
-1.065023, -0.4221905, -2.725341, 1, 0.7960784, 0, 1,
-1.062226, -1.23096, -1.411174, 1, 0.8039216, 0, 1,
-1.060313, 0.5198725, 0.4715585, 1, 0.8117647, 0, 1,
-1.058849, -1.290725, -2.521606, 1, 0.8156863, 0, 1,
-1.057032, -0.7627722, -3.794231, 1, 0.8235294, 0, 1,
-1.045768, 0.4007517, -0.4640068, 1, 0.827451, 0, 1,
-1.045578, -2.054868, -3.023684, 1, 0.8352941, 0, 1,
-1.044022, -0.09865829, -1.664818, 1, 0.8392157, 0, 1,
-1.03804, 1.029438, -1.360473, 1, 0.8470588, 0, 1,
-1.022803, -1.347672, -2.70515, 1, 0.8509804, 0, 1,
-1.013771, 1.41303, -0.9523498, 1, 0.8588235, 0, 1,
-1.007385, 1.545238, 0.8144081, 1, 0.8627451, 0, 1,
-1.001519, -0.0921201, -1.624396, 1, 0.8705882, 0, 1,
-1.000989, 0.08564633, -1.577942, 1, 0.8745098, 0, 1,
-0.999234, -1.38334, -4.050488, 1, 0.8823529, 0, 1,
-0.9971486, 0.6117502, -2.055867, 1, 0.8862745, 0, 1,
-0.988867, -0.2430381, -2.392008, 1, 0.8941177, 0, 1,
-0.9856135, 0.989383, -0.1774181, 1, 0.8980392, 0, 1,
-0.9835042, 1.570319, 0.03033503, 1, 0.9058824, 0, 1,
-0.9823257, -0.2051355, -0.7010333, 1, 0.9137255, 0, 1,
-0.9746984, 0.2666345, -0.5495779, 1, 0.9176471, 0, 1,
-0.9693986, 0.07138058, 0.1453923, 1, 0.9254902, 0, 1,
-0.9677206, -0.05221504, -1.858599, 1, 0.9294118, 0, 1,
-0.9635067, 1.818671, -0.3022765, 1, 0.9372549, 0, 1,
-0.9530925, -0.2303672, -0.7900391, 1, 0.9411765, 0, 1,
-0.9524714, 0.3869892, -1.224879, 1, 0.9490196, 0, 1,
-0.9520479, -1.38659, -2.351821, 1, 0.9529412, 0, 1,
-0.9470448, 0.9989408, -1.661346, 1, 0.9607843, 0, 1,
-0.9435252, -0.0921942, -1.280464, 1, 0.9647059, 0, 1,
-0.9409584, -1.935469, -1.851475, 1, 0.972549, 0, 1,
-0.9407481, 0.3811861, -1.708746, 1, 0.9764706, 0, 1,
-0.9386878, -0.7702571, -2.81863, 1, 0.9843137, 0, 1,
-0.9342818, -1.672087, -3.449266, 1, 0.9882353, 0, 1,
-0.9116606, -0.1550278, -2.167334, 1, 0.9960784, 0, 1,
-0.9077156, 0.1841606, -2.065427, 0.9960784, 1, 0, 1,
-0.8916566, -1.041335, -2.440349, 0.9921569, 1, 0, 1,
-0.8914323, -0.3587813, -2.603658, 0.9843137, 1, 0, 1,
-0.8895459, 0.9286678, -0.6156619, 0.9803922, 1, 0, 1,
-0.8847926, -0.4604991, -0.382674, 0.972549, 1, 0, 1,
-0.8817313, 2.125463, 0.596119, 0.9686275, 1, 0, 1,
-0.8808972, 0.9913701, -2.005771, 0.9607843, 1, 0, 1,
-0.8766025, 0.1890972, -2.259095, 0.9568627, 1, 0, 1,
-0.8757686, 0.8275968, -1.664843, 0.9490196, 1, 0, 1,
-0.8754395, 0.2563884, -1.329211, 0.945098, 1, 0, 1,
-0.854907, 1.789014, -1.800087, 0.9372549, 1, 0, 1,
-0.8519725, 0.2702285, -3.012607, 0.9333333, 1, 0, 1,
-0.8418249, -0.3314216, -1.906096, 0.9254902, 1, 0, 1,
-0.8399894, -0.7306542, -2.065618, 0.9215686, 1, 0, 1,
-0.8384222, 0.6963881, -1.113625, 0.9137255, 1, 0, 1,
-0.83381, -1.103649, -3.025838, 0.9098039, 1, 0, 1,
-0.8300861, -0.3366029, -3.059865, 0.9019608, 1, 0, 1,
-0.7969953, -0.09729622, -2.47938, 0.8941177, 1, 0, 1,
-0.7948346, -0.08193715, -3.197495, 0.8901961, 1, 0, 1,
-0.7818226, -1.5571, -3.607727, 0.8823529, 1, 0, 1,
-0.777288, -0.8168529, -2.480329, 0.8784314, 1, 0, 1,
-0.7750965, -0.1845069, -0.3604858, 0.8705882, 1, 0, 1,
-0.774991, 0.486124, -1.403549, 0.8666667, 1, 0, 1,
-0.770856, 1.495019, -0.6756699, 0.8588235, 1, 0, 1,
-0.7623855, 0.08708019, -0.3973094, 0.854902, 1, 0, 1,
-0.7532439, 0.1265199, -0.7304558, 0.8470588, 1, 0, 1,
-0.745625, 1.421866, -0.4385477, 0.8431373, 1, 0, 1,
-0.7449525, -2.40731, -1.294829, 0.8352941, 1, 0, 1,
-0.743858, -0.369855, -1.869945, 0.8313726, 1, 0, 1,
-0.7383048, -0.4669758, -1.986438, 0.8235294, 1, 0, 1,
-0.7362519, 1.155828, -0.4371306, 0.8196079, 1, 0, 1,
-0.7348435, -0.4431928, -0.1565966, 0.8117647, 1, 0, 1,
-0.7324767, -0.8544521, -2.711861, 0.8078431, 1, 0, 1,
-0.7308995, -0.167452, -2.517185, 0.8, 1, 0, 1,
-0.7261223, -1.5488, -1.555146, 0.7921569, 1, 0, 1,
-0.7252641, -0.09714764, -2.28762, 0.7882353, 1, 0, 1,
-0.7250792, 1.767169, -1.728896, 0.7803922, 1, 0, 1,
-0.7230887, -0.3740349, -2.283191, 0.7764706, 1, 0, 1,
-0.7166052, -1.241045, -3.59107, 0.7686275, 1, 0, 1,
-0.7161187, 0.6679192, -1.554183, 0.7647059, 1, 0, 1,
-0.7146965, -0.1763744, -3.286312, 0.7568628, 1, 0, 1,
-0.7113811, -1.315129, -1.625372, 0.7529412, 1, 0, 1,
-0.7107906, -0.3391016, -2.375598, 0.7450981, 1, 0, 1,
-0.7043409, -2.05617, -2.894564, 0.7411765, 1, 0, 1,
-0.6961434, -0.6039333, -2.866778, 0.7333333, 1, 0, 1,
-0.6887021, -0.2663023, -1.418504, 0.7294118, 1, 0, 1,
-0.6836345, -0.4366843, -0.0005720269, 0.7215686, 1, 0, 1,
-0.6804571, -0.7395971, -4.602759, 0.7176471, 1, 0, 1,
-0.6776683, -0.1388036, 0.05230363, 0.7098039, 1, 0, 1,
-0.675032, 0.5738969, -1.350172, 0.7058824, 1, 0, 1,
-0.6733887, 0.3746289, 0.7990437, 0.6980392, 1, 0, 1,
-0.6632588, -1.223229, -2.060737, 0.6901961, 1, 0, 1,
-0.6595202, -0.8882549, -1.73104, 0.6862745, 1, 0, 1,
-0.6582919, 0.1155654, -2.709389, 0.6784314, 1, 0, 1,
-0.6547646, 0.7630888, 1.660002, 0.6745098, 1, 0, 1,
-0.6536289, -0.003529614, -0.5123776, 0.6666667, 1, 0, 1,
-0.6434898, -0.7750722, 0.02006222, 0.6627451, 1, 0, 1,
-0.6392365, -0.662486, -2.848215, 0.654902, 1, 0, 1,
-0.6383302, 0.4318783, -2.406237, 0.6509804, 1, 0, 1,
-0.6331341, 1.237524, -1.172394, 0.6431373, 1, 0, 1,
-0.6302276, -1.418486, -2.950171, 0.6392157, 1, 0, 1,
-0.6139542, -0.06407656, -0.6324769, 0.6313726, 1, 0, 1,
-0.607779, 0.1598196, -1.166178, 0.627451, 1, 0, 1,
-0.6077266, 1.507103, -0.4582477, 0.6196079, 1, 0, 1,
-0.6061053, 1.642827, 0.6995219, 0.6156863, 1, 0, 1,
-0.6058055, 1.421174, 0.2337483, 0.6078432, 1, 0, 1,
-0.6004482, 0.9857033, -0.5588535, 0.6039216, 1, 0, 1,
-0.5995438, -0.08788317, -0.9411306, 0.5960785, 1, 0, 1,
-0.599011, -1.426141, -2.07044, 0.5882353, 1, 0, 1,
-0.5988581, 0.1778964, -1.607581, 0.5843138, 1, 0, 1,
-0.5961213, -0.8261153, -2.731819, 0.5764706, 1, 0, 1,
-0.5956865, 0.2641436, -1.148822, 0.572549, 1, 0, 1,
-0.5931513, -0.8304269, -2.532039, 0.5647059, 1, 0, 1,
-0.5895529, 1.255021, -0.8071737, 0.5607843, 1, 0, 1,
-0.5891901, -3.231242, -3.312517, 0.5529412, 1, 0, 1,
-0.5882134, 0.2064511, -1.578772, 0.5490196, 1, 0, 1,
-0.5853891, 0.2096465, -2.009396, 0.5411765, 1, 0, 1,
-0.5766301, 0.111181, -0.8246323, 0.5372549, 1, 0, 1,
-0.5702594, -0.5891378, -2.677631, 0.5294118, 1, 0, 1,
-0.5640768, 0.8108166, -0.7491729, 0.5254902, 1, 0, 1,
-0.5639899, 0.3413532, -0.4967313, 0.5176471, 1, 0, 1,
-0.5594562, -0.947576, -2.555856, 0.5137255, 1, 0, 1,
-0.5524455, -0.0562765, -0.9171361, 0.5058824, 1, 0, 1,
-0.5522547, -2.466107, -3.842777, 0.5019608, 1, 0, 1,
-0.5451864, 1.437364, -0.7172437, 0.4941176, 1, 0, 1,
-0.5418468, 0.9185563, 1.564523, 0.4862745, 1, 0, 1,
-0.5409713, -0.5209504, -3.888984, 0.4823529, 1, 0, 1,
-0.5394912, 1.096106, -0.7592735, 0.4745098, 1, 0, 1,
-0.5303153, 0.1120278, -2.16082, 0.4705882, 1, 0, 1,
-0.5298338, -0.4574056, -2.522506, 0.4627451, 1, 0, 1,
-0.527972, -0.02567843, -3.147326, 0.4588235, 1, 0, 1,
-0.5248973, 0.4386161, -0.4161544, 0.4509804, 1, 0, 1,
-0.5191606, -0.07236642, -0.7485799, 0.4470588, 1, 0, 1,
-0.5162117, -0.5123459, -1.986652, 0.4392157, 1, 0, 1,
-0.5144288, 0.9428428, 1.395536, 0.4352941, 1, 0, 1,
-0.5128844, -2.479727, -3.356447, 0.427451, 1, 0, 1,
-0.509738, -0.8028941, -2.541383, 0.4235294, 1, 0, 1,
-0.5069119, -0.8044494, -3.490339, 0.4156863, 1, 0, 1,
-0.5047933, -0.253541, -1.276036, 0.4117647, 1, 0, 1,
-0.499937, -0.382622, -3.308709, 0.4039216, 1, 0, 1,
-0.4972042, 0.1225734, -0.8853902, 0.3960784, 1, 0, 1,
-0.4965283, -0.8183606, -3.347671, 0.3921569, 1, 0, 1,
-0.4898823, 0.7485635, 0.3623143, 0.3843137, 1, 0, 1,
-0.4832154, 0.2153188, -0.6543915, 0.3803922, 1, 0, 1,
-0.4741154, 1.213586, -0.07360925, 0.372549, 1, 0, 1,
-0.472953, -0.561745, -3.544575, 0.3686275, 1, 0, 1,
-0.4712934, -0.3970202, -1.180768, 0.3607843, 1, 0, 1,
-0.4671637, 1.394633, -0.7732915, 0.3568628, 1, 0, 1,
-0.4644579, -1.558906, -2.234906, 0.3490196, 1, 0, 1,
-0.4633686, 0.6618019, -3.219853, 0.345098, 1, 0, 1,
-0.4628696, -1.129842, -2.428407, 0.3372549, 1, 0, 1,
-0.4623224, -1.689294, -3.666104, 0.3333333, 1, 0, 1,
-0.4606912, -2.021782, -3.351428, 0.3254902, 1, 0, 1,
-0.4604954, -1.433223, -4.257155, 0.3215686, 1, 0, 1,
-0.4584214, -0.5972494, -2.544537, 0.3137255, 1, 0, 1,
-0.4559762, 1.297587, -1.066612, 0.3098039, 1, 0, 1,
-0.4520231, -0.1856329, -2.535976, 0.3019608, 1, 0, 1,
-0.450063, 3.44582, -0.4864789, 0.2941177, 1, 0, 1,
-0.448834, 0.2352616, -1.04584, 0.2901961, 1, 0, 1,
-0.4452175, -0.07651144, -2.873307, 0.282353, 1, 0, 1,
-0.4438231, 0.4570304, -1.151034, 0.2784314, 1, 0, 1,
-0.4436188, -0.1263671, -1.109111, 0.2705882, 1, 0, 1,
-0.4428744, -0.7602894, -1.950762, 0.2666667, 1, 0, 1,
-0.4391651, -0.4322432, -2.646555, 0.2588235, 1, 0, 1,
-0.4356736, 0.8451039, -2.059499, 0.254902, 1, 0, 1,
-0.4324619, -0.5176155, -2.74984, 0.2470588, 1, 0, 1,
-0.4306247, 2.840543, 1.157711, 0.2431373, 1, 0, 1,
-0.4284361, 1.367232, -1.131765, 0.2352941, 1, 0, 1,
-0.4280331, 0.664635, -0.06427751, 0.2313726, 1, 0, 1,
-0.4260849, -0.3598688, -3.056306, 0.2235294, 1, 0, 1,
-0.4254154, -0.3404746, -2.757756, 0.2196078, 1, 0, 1,
-0.4233876, -0.05685578, -3.338238, 0.2117647, 1, 0, 1,
-0.4208156, -0.3351734, -3.351268, 0.2078431, 1, 0, 1,
-0.4183652, 0.2246669, 1.269015, 0.2, 1, 0, 1,
-0.4175325, -1.395092, -2.027582, 0.1921569, 1, 0, 1,
-0.4161974, 0.7394009, -1.390908, 0.1882353, 1, 0, 1,
-0.4161582, 0.1001355, -1.24204, 0.1803922, 1, 0, 1,
-0.4157117, -0.9609768, -1.185021, 0.1764706, 1, 0, 1,
-0.4129388, -0.3482673, -2.069583, 0.1686275, 1, 0, 1,
-0.4125805, -0.1486744, -1.597387, 0.1647059, 1, 0, 1,
-0.4091451, 0.1634176, -0.9290648, 0.1568628, 1, 0, 1,
-0.4075211, 0.2590225, -3.438581, 0.1529412, 1, 0, 1,
-0.4025559, 1.05614, 0.4839827, 0.145098, 1, 0, 1,
-0.4018965, 0.5210479, -1.693427, 0.1411765, 1, 0, 1,
-0.3983236, 0.6005049, 1.226144, 0.1333333, 1, 0, 1,
-0.397772, 0.6415561, -1.515205, 0.1294118, 1, 0, 1,
-0.3950292, 1.536727, -0.8617983, 0.1215686, 1, 0, 1,
-0.3940261, -0.6854395, -1.089841, 0.1176471, 1, 0, 1,
-0.3922943, 1.336809, -0.2262582, 0.1098039, 1, 0, 1,
-0.391963, 0.1667277, -0.2685868, 0.1058824, 1, 0, 1,
-0.3883346, -2.75221, -2.500596, 0.09803922, 1, 0, 1,
-0.3865785, 0.93922, 0.5943156, 0.09019608, 1, 0, 1,
-0.3857848, -0.4759136, -4.065761, 0.08627451, 1, 0, 1,
-0.3844421, -1.047009, -4.846236, 0.07843138, 1, 0, 1,
-0.3826853, -1.685551, -4.907218, 0.07450981, 1, 0, 1,
-0.3799329, 1.246069, -0.5721739, 0.06666667, 1, 0, 1,
-0.3770784, 0.6378797, 0.02123619, 0.0627451, 1, 0, 1,
-0.3734813, -0.160854, -1.414862, 0.05490196, 1, 0, 1,
-0.3692911, 1.693441, -1.55763, 0.05098039, 1, 0, 1,
-0.3649767, -1.705875, -3.412421, 0.04313726, 1, 0, 1,
-0.3643949, -1.480687, -2.142828, 0.03921569, 1, 0, 1,
-0.3616158, 0.1664795, -1.133658, 0.03137255, 1, 0, 1,
-0.358375, -1.384228, -2.445103, 0.02745098, 1, 0, 1,
-0.3570794, 0.3759591, 0.1535957, 0.01960784, 1, 0, 1,
-0.3558924, -0.6915979, -1.52708, 0.01568628, 1, 0, 1,
-0.3507816, -0.5209931, -2.419951, 0.007843138, 1, 0, 1,
-0.3504794, -0.06837958, -1.712962, 0.003921569, 1, 0, 1,
-0.3467495, -1.061332, -4.310382, 0, 1, 0.003921569, 1,
-0.3460236, 0.6515043, -0.6225059, 0, 1, 0.01176471, 1,
-0.3444444, -0.6167659, -2.99661, 0, 1, 0.01568628, 1,
-0.3432478, -0.1668355, -1.730221, 0, 1, 0.02352941, 1,
-0.341334, 1.14976, -0.7460571, 0, 1, 0.02745098, 1,
-0.3401196, -0.7662412, -4.014365, 0, 1, 0.03529412, 1,
-0.33871, -0.03594288, -2.143393, 0, 1, 0.03921569, 1,
-0.3371743, 0.801414, -0.1731242, 0, 1, 0.04705882, 1,
-0.336971, 1.582156, 1.117028, 0, 1, 0.05098039, 1,
-0.3308112, -0.4075303, -1.5011, 0, 1, 0.05882353, 1,
-0.3307289, -0.8486284, -1.985233, 0, 1, 0.0627451, 1,
-0.3300279, -0.4039279, -1.428003, 0, 1, 0.07058824, 1,
-0.3257772, 0.7385427, -0.5293103, 0, 1, 0.07450981, 1,
-0.3207592, 0.152584, -1.329472, 0, 1, 0.08235294, 1,
-0.3160697, -1.782645, -4.155857, 0, 1, 0.08627451, 1,
-0.31078, 2.864843, 2.212457, 0, 1, 0.09411765, 1,
-0.3095784, 1.053583, -0.3658007, 0, 1, 0.1019608, 1,
-0.3049662, -1.183199, -1.685419, 0, 1, 0.1058824, 1,
-0.3047531, -1.094736, -3.074005, 0, 1, 0.1137255, 1,
-0.3027038, 0.6957363, -0.2449304, 0, 1, 0.1176471, 1,
-0.3019845, 0.4418393, -2.092849, 0, 1, 0.1254902, 1,
-0.3011106, 0.1751645, -0.6044298, 0, 1, 0.1294118, 1,
-0.3008427, 0.3187474, -0.4197048, 0, 1, 0.1372549, 1,
-0.2986503, -0.901588, -1.528168, 0, 1, 0.1411765, 1,
-0.297689, -0.8183913, -2.009171, 0, 1, 0.1490196, 1,
-0.295396, -2.041604, -5.027926, 0, 1, 0.1529412, 1,
-0.2900821, -1.876936, -2.481367, 0, 1, 0.1607843, 1,
-0.2900685, 1.527696, 1.055845, 0, 1, 0.1647059, 1,
-0.2754591, -0.7087154, -4.112861, 0, 1, 0.172549, 1,
-0.2750907, -2.228154, -2.683694, 0, 1, 0.1764706, 1,
-0.2749946, -1.467813, -1.538958, 0, 1, 0.1843137, 1,
-0.2742367, -2.140812, -3.106044, 0, 1, 0.1882353, 1,
-0.2732821, -1.020613, -2.474553, 0, 1, 0.1960784, 1,
-0.264242, 0.8777328, -1.184599, 0, 1, 0.2039216, 1,
-0.263708, 0.4899754, 1.159885, 0, 1, 0.2078431, 1,
-0.2621093, -0.009838388, -1.632983, 0, 1, 0.2156863, 1,
-0.2612037, 0.9669896, 0.03950814, 0, 1, 0.2196078, 1,
-0.2605035, 0.9634901, -0.3265206, 0, 1, 0.227451, 1,
-0.2514956, -0.7474506, -3.410522, 0, 1, 0.2313726, 1,
-0.2506236, 1.457741, -0.5867884, 0, 1, 0.2392157, 1,
-0.2458574, -0.7448912, -2.243106, 0, 1, 0.2431373, 1,
-0.2409597, 1.482761, 0.2290436, 0, 1, 0.2509804, 1,
-0.2404799, -0.7197285, -3.537623, 0, 1, 0.254902, 1,
-0.2363134, -1.4789, -1.402331, 0, 1, 0.2627451, 1,
-0.2355274, -0.9072455, -2.202182, 0, 1, 0.2666667, 1,
-0.2345462, -0.7350426, -2.604192, 0, 1, 0.2745098, 1,
-0.226944, -1.318965, -4.216873, 0, 1, 0.2784314, 1,
-0.2240057, -1.318163, -3.401055, 0, 1, 0.2862745, 1,
-0.2239799, 0.9886002, -0.3632539, 0, 1, 0.2901961, 1,
-0.2222341, -0.817076, -2.453631, 0, 1, 0.2980392, 1,
-0.2169753, 1.341426, 0.6661419, 0, 1, 0.3058824, 1,
-0.2126406, 0.044916, 0.6748645, 0, 1, 0.3098039, 1,
-0.2113618, 0.05219238, -2.049223, 0, 1, 0.3176471, 1,
-0.2087354, 1.482076, 0.9171899, 0, 1, 0.3215686, 1,
-0.2085028, 0.02181561, -1.483608, 0, 1, 0.3294118, 1,
-0.2079137, 0.2939413, -2.180648, 0, 1, 0.3333333, 1,
-0.205003, -0.1230964, 0.3738089, 0, 1, 0.3411765, 1,
-0.203164, -0.3661236, -0.9961837, 0, 1, 0.345098, 1,
-0.2021853, 1.077876, 1.205317, 0, 1, 0.3529412, 1,
-0.1998957, 1.519105, 0.06925997, 0, 1, 0.3568628, 1,
-0.1993825, 1.643187, -0.630971, 0, 1, 0.3647059, 1,
-0.1978458, 1.391805, -2.250319, 0, 1, 0.3686275, 1,
-0.1944028, -2.435762, -2.311697, 0, 1, 0.3764706, 1,
-0.1938036, -0.2381091, -1.230097, 0, 1, 0.3803922, 1,
-0.1921803, 1.540206, -0.5251097, 0, 1, 0.3882353, 1,
-0.1918299, -0.06636922, -0.9780069, 0, 1, 0.3921569, 1,
-0.1896415, -0.9441375, -3.330061, 0, 1, 0.4, 1,
-0.1853459, 1.331602, -0.5718111, 0, 1, 0.4078431, 1,
-0.184656, -1.693521, -3.072063, 0, 1, 0.4117647, 1,
-0.1808964, -0.4776107, -1.764111, 0, 1, 0.4196078, 1,
-0.1787581, -1.784056, -4.782128, 0, 1, 0.4235294, 1,
-0.175529, 0.708736, 1.156149, 0, 1, 0.4313726, 1,
-0.1728151, -0.5927478, -3.849521, 0, 1, 0.4352941, 1,
-0.1725755, 1.156412, 0.2416651, 0, 1, 0.4431373, 1,
-0.1723551, -0.7239903, -2.603052, 0, 1, 0.4470588, 1,
-0.170399, 0.06828806, -1.872291, 0, 1, 0.454902, 1,
-0.1699548, 1.06327, -3.169687, 0, 1, 0.4588235, 1,
-0.1676064, -0.5955892, -3.515033, 0, 1, 0.4666667, 1,
-0.1621765, 1.548613, -0.4509377, 0, 1, 0.4705882, 1,
-0.1613637, 1.120163, 1.493186, 0, 1, 0.4784314, 1,
-0.1575043, -0.1844239, -3.086548, 0, 1, 0.4823529, 1,
-0.1567576, -1.067466, -4.084127, 0, 1, 0.4901961, 1,
-0.1556933, -0.7480125, -1.788435, 0, 1, 0.4941176, 1,
-0.1555955, -0.1003133, -3.542535, 0, 1, 0.5019608, 1,
-0.1543716, -0.7718253, -3.699957, 0, 1, 0.509804, 1,
-0.149906, 0.290042, -0.9521983, 0, 1, 0.5137255, 1,
-0.1465035, 0.6091399, 1.48708, 0, 1, 0.5215687, 1,
-0.1417722, 0.08150985, -1.702086, 0, 1, 0.5254902, 1,
-0.1407783, -0.4702939, -3.044624, 0, 1, 0.5333334, 1,
-0.1398368, -0.4236482, -1.182222, 0, 1, 0.5372549, 1,
-0.1382986, -1.336364, -3.254559, 0, 1, 0.5450981, 1,
-0.1378146, 0.9080448, -0.7213567, 0, 1, 0.5490196, 1,
-0.1353553, 0.02539868, -1.134802, 0, 1, 0.5568628, 1,
-0.1352708, 0.2079532, 1.530716, 0, 1, 0.5607843, 1,
-0.1323307, 0.4492314, -1.442239, 0, 1, 0.5686275, 1,
-0.1304116, 0.6322896, 0.3219122, 0, 1, 0.572549, 1,
-0.1301601, -1.392931, -2.29959, 0, 1, 0.5803922, 1,
-0.1282928, -0.1013441, -0.472992, 0, 1, 0.5843138, 1,
-0.1271074, 0.2152571, -1.017736, 0, 1, 0.5921569, 1,
-0.1234572, -1.794919, -3.739708, 0, 1, 0.5960785, 1,
-0.1208368, -0.293061, -2.068069, 0, 1, 0.6039216, 1,
-0.1152769, -0.4277574, -3.364316, 0, 1, 0.6117647, 1,
-0.1137912, -0.02362873, -2.161691, 0, 1, 0.6156863, 1,
-0.1114949, -0.3928469, -1.990988, 0, 1, 0.6235294, 1,
-0.1108905, -0.2505382, -2.782877, 0, 1, 0.627451, 1,
-0.1091172, -1.556887, -3.32397, 0, 1, 0.6352941, 1,
-0.1084375, 0.750503, 1.208325, 0, 1, 0.6392157, 1,
-0.1075118, -0.797901, -3.476659, 0, 1, 0.6470588, 1,
-0.1049896, 0.169352, 0.2852584, 0, 1, 0.6509804, 1,
-0.1044678, 1.389768, -1.509617, 0, 1, 0.6588235, 1,
-0.1006226, -0.04909193, -1.869677, 0, 1, 0.6627451, 1,
-0.09527879, 1.109003, -3.327783, 0, 1, 0.6705883, 1,
-0.09511568, 0.09043946, -0.0104807, 0, 1, 0.6745098, 1,
-0.08997828, 0.2995777, 0.3517276, 0, 1, 0.682353, 1,
-0.08862889, 0.1073363, -1.019902, 0, 1, 0.6862745, 1,
-0.0875525, -1.003645, -1.478879, 0, 1, 0.6941177, 1,
-0.08363575, 1.2997, 0.2714463, 0, 1, 0.7019608, 1,
-0.07610767, 0.7682258, -0.02216074, 0, 1, 0.7058824, 1,
-0.07561488, 0.4603789, -0.3411513, 0, 1, 0.7137255, 1,
-0.07250123, 0.2701363, 0.1664508, 0, 1, 0.7176471, 1,
-0.06870021, 1.529574, 1.16318, 0, 1, 0.7254902, 1,
-0.06347689, 0.8277254, 0.04405854, 0, 1, 0.7294118, 1,
-0.05899249, -1.80607, -2.567411, 0, 1, 0.7372549, 1,
-0.05517038, -0.134497, -2.160437, 0, 1, 0.7411765, 1,
-0.0543642, -1.959244, -1.845059, 0, 1, 0.7490196, 1,
-0.05283933, -0.267886, -3.145373, 0, 1, 0.7529412, 1,
-0.05280273, 0.5866829, -0.645012, 0, 1, 0.7607843, 1,
-0.05231096, -1.565615, -2.963423, 0, 1, 0.7647059, 1,
-0.04866482, -0.9975328, -2.810001, 0, 1, 0.772549, 1,
-0.0473941, -0.02947638, -2.588081, 0, 1, 0.7764706, 1,
-0.04692875, -0.4984326, -3.59068, 0, 1, 0.7843137, 1,
-0.04577278, 1.669271, -0.5108894, 0, 1, 0.7882353, 1,
-0.04503537, -0.6669089, -3.946417, 0, 1, 0.7960784, 1,
-0.03703799, -0.8995589, -4.906448, 0, 1, 0.8039216, 1,
-0.03594955, 0.5579871, 1.675773, 0, 1, 0.8078431, 1,
-0.03488217, 0.1466812, -2.447673, 0, 1, 0.8156863, 1,
-0.03473334, -2.21227, -4.008617, 0, 1, 0.8196079, 1,
-0.03456115, -0.3501548, -3.960534, 0, 1, 0.827451, 1,
-0.03387993, -2.136145, -3.664984, 0, 1, 0.8313726, 1,
-0.03364051, 0.7651123, 1.072529, 0, 1, 0.8392157, 1,
-0.03056635, -0.1050434, -2.462338, 0, 1, 0.8431373, 1,
-0.02836225, 0.8216332, -0.7256767, 0, 1, 0.8509804, 1,
-0.02792688, -0.7704054, -2.281399, 0, 1, 0.854902, 1,
-0.02730014, 1.156326, -0.4034005, 0, 1, 0.8627451, 1,
-0.02644268, 0.6587068, 0.397818, 0, 1, 0.8666667, 1,
-0.02589137, -0.9209956, -3.190082, 0, 1, 0.8745098, 1,
-0.02038986, 0.9491976, -0.6309874, 0, 1, 0.8784314, 1,
-0.0191616, 0.3174106, -1.035743, 0, 1, 0.8862745, 1,
-0.01759218, 0.883329, 0.2948812, 0, 1, 0.8901961, 1,
-0.01757808, 0.8746188, -1.081951, 0, 1, 0.8980392, 1,
-0.01591825, 1.357771, 1.271828, 0, 1, 0.9058824, 1,
-0.01235474, 2.140828, -0.6508798, 0, 1, 0.9098039, 1,
-0.005583385, -0.1097454, -3.31309, 0, 1, 0.9176471, 1,
-0.002473448, 1.32837, 1.130155, 0, 1, 0.9215686, 1,
-0.001857346, 0.01652438, 0.1639314, 0, 1, 0.9294118, 1,
0.001858812, 0.2448398, -2.748787, 0, 1, 0.9333333, 1,
0.00385586, -0.7136686, 4.867011, 0, 1, 0.9411765, 1,
0.004690865, 0.8049228, 1.043562, 0, 1, 0.945098, 1,
0.007920465, -0.7651998, 4.113807, 0, 1, 0.9529412, 1,
0.009744936, 0.3189686, 0.5657305, 0, 1, 0.9568627, 1,
0.01307711, -0.8814669, 3.741413, 0, 1, 0.9647059, 1,
0.01547448, 1.189869, 0.3264413, 0, 1, 0.9686275, 1,
0.01585125, -0.2404702, 4.358515, 0, 1, 0.9764706, 1,
0.02103934, -0.2643305, 2.496291, 0, 1, 0.9803922, 1,
0.02496109, -2.461413, 3.909605, 0, 1, 0.9882353, 1,
0.02774203, -2.135496, 3.25762, 0, 1, 0.9921569, 1,
0.03241117, 0.1417263, 1.200647, 0, 1, 1, 1,
0.03244237, -0.3125595, 2.390372, 0, 0.9921569, 1, 1,
0.0349416, 1.479066, -1.080219, 0, 0.9882353, 1, 1,
0.04534591, -0.1237228, 4.842298, 0, 0.9803922, 1, 1,
0.05118798, -0.8778825, 4.699891, 0, 0.9764706, 1, 1,
0.05237046, 1.052787, -1.815096, 0, 0.9686275, 1, 1,
0.05620872, -0.4109856, 3.256763, 0, 0.9647059, 1, 1,
0.05676195, -0.1778974, 0.01412128, 0, 0.9568627, 1, 1,
0.058114, -1.845515, 2.504348, 0, 0.9529412, 1, 1,
0.05858503, -1.336799, 2.707565, 0, 0.945098, 1, 1,
0.06283526, 0.9643721, -0.4195858, 0, 0.9411765, 1, 1,
0.06496485, 0.8251225, 1.861406, 0, 0.9333333, 1, 1,
0.06557024, 0.8874877, 0.4901957, 0, 0.9294118, 1, 1,
0.07079882, -0.3096845, 2.374377, 0, 0.9215686, 1, 1,
0.07312611, -0.3094431, 2.344701, 0, 0.9176471, 1, 1,
0.07766054, 0.5973456, 2.010857, 0, 0.9098039, 1, 1,
0.08000981, 1.769029, -0.6353024, 0, 0.9058824, 1, 1,
0.09708671, 0.6183178, -0.3448413, 0, 0.8980392, 1, 1,
0.09779666, -2.742953, 0.9634624, 0, 0.8901961, 1, 1,
0.1057213, -0.1694448, 2.311496, 0, 0.8862745, 1, 1,
0.105968, 0.6605438, -0.9350154, 0, 0.8784314, 1, 1,
0.1062559, 1.048435, 0.4937991, 0, 0.8745098, 1, 1,
0.1070992, 1.056764, 0.703896, 0, 0.8666667, 1, 1,
0.1074317, 0.4651352, -0.882531, 0, 0.8627451, 1, 1,
0.110609, 1.358858, 0.6300827, 0, 0.854902, 1, 1,
0.1168442, 1.241066, 1.121808, 0, 0.8509804, 1, 1,
0.1270268, 0.4179834, 0.702492, 0, 0.8431373, 1, 1,
0.1282241, 0.9126548, -0.1507104, 0, 0.8392157, 1, 1,
0.1289707, 0.04755683, 1.981055, 0, 0.8313726, 1, 1,
0.129935, -1.476469, 3.431517, 0, 0.827451, 1, 1,
0.133807, -0.8109659, 2.409642, 0, 0.8196079, 1, 1,
0.1344288, 0.03421203, 1.214914, 0, 0.8156863, 1, 1,
0.1374584, -0.3231235, 3.051467, 0, 0.8078431, 1, 1,
0.1397728, -0.7086931, 1.549806, 0, 0.8039216, 1, 1,
0.1397738, -1.285858, 4.146558, 0, 0.7960784, 1, 1,
0.1425133, 0.3888935, 1.010243, 0, 0.7882353, 1, 1,
0.1425691, 1.881675, 0.4919546, 0, 0.7843137, 1, 1,
0.1442016, -0.5780804, 3.026119, 0, 0.7764706, 1, 1,
0.1454555, -0.006959785, 1.534237, 0, 0.772549, 1, 1,
0.1508904, -0.3978689, 0.5719033, 0, 0.7647059, 1, 1,
0.1633731, 1.017935, -0.3064693, 0, 0.7607843, 1, 1,
0.1647564, 0.3851577, 1.846208, 0, 0.7529412, 1, 1,
0.1671855, -0.5764467, 1.420629, 0, 0.7490196, 1, 1,
0.1681055, 3.019202, 0.5396392, 0, 0.7411765, 1, 1,
0.1762319, 0.9143132, 0.8962574, 0, 0.7372549, 1, 1,
0.177822, -0.8708153, 2.811831, 0, 0.7294118, 1, 1,
0.1781248, 0.5986239, 2.534784, 0, 0.7254902, 1, 1,
0.1787089, -0.08572888, 1.662312, 0, 0.7176471, 1, 1,
0.1789618, 0.6644284, -1.708797, 0, 0.7137255, 1, 1,
0.1801859, -2.355447, 4.350253, 0, 0.7058824, 1, 1,
0.1820198, 0.2091416, 2.079969, 0, 0.6980392, 1, 1,
0.1847864, -0.316782, 2.53676, 0, 0.6941177, 1, 1,
0.1851206, -0.1407435, 2.580324, 0, 0.6862745, 1, 1,
0.186789, -1.174826, 1.802342, 0, 0.682353, 1, 1,
0.1876577, -1.307821, 2.108172, 0, 0.6745098, 1, 1,
0.1889785, -0.02263037, 0.673867, 0, 0.6705883, 1, 1,
0.1900123, -0.4308571, 3.926422, 0, 0.6627451, 1, 1,
0.1913637, 0.6487979, 0.7878922, 0, 0.6588235, 1, 1,
0.1929953, -0.8859173, 2.224893, 0, 0.6509804, 1, 1,
0.1952523, -0.8568436, 1.073108, 0, 0.6470588, 1, 1,
0.2001388, 0.3510831, 1.126437, 0, 0.6392157, 1, 1,
0.2048721, -0.3823739, 2.905952, 0, 0.6352941, 1, 1,
0.2099719, -2.487918, 2.4843, 0, 0.627451, 1, 1,
0.2210762, -1.150924, 3.456867, 0, 0.6235294, 1, 1,
0.2274796, -0.6945699, 3.148538, 0, 0.6156863, 1, 1,
0.2275496, 0.01774682, 1.548642, 0, 0.6117647, 1, 1,
0.2311293, 0.09371896, 1.204854, 0, 0.6039216, 1, 1,
0.2334578, -0.6680921, 2.473434, 0, 0.5960785, 1, 1,
0.2344483, -0.943422, 3.96527, 0, 0.5921569, 1, 1,
0.2362987, -0.2131031, 2.405664, 0, 0.5843138, 1, 1,
0.2473223, 0.6571284, -0.1323776, 0, 0.5803922, 1, 1,
0.2507462, 0.9202836, 0.1973314, 0, 0.572549, 1, 1,
0.2530665, -0.5337726, 2.223636, 0, 0.5686275, 1, 1,
0.2539127, -0.1654713, 1.928279, 0, 0.5607843, 1, 1,
0.2582249, 1.819564, 0.122251, 0, 0.5568628, 1, 1,
0.2608294, -0.6550649, 2.537551, 0, 0.5490196, 1, 1,
0.2682953, -1.468984, 1.912339, 0, 0.5450981, 1, 1,
0.2740203, -0.613568, 3.292942, 0, 0.5372549, 1, 1,
0.2741233, 0.3816713, 2.027834, 0, 0.5333334, 1, 1,
0.276905, -1.216968, 1.966619, 0, 0.5254902, 1, 1,
0.2775766, 0.07443813, 1.258973, 0, 0.5215687, 1, 1,
0.2810605, -0.3487923, 4.433897, 0, 0.5137255, 1, 1,
0.2812468, -0.2822985, 2.219812, 0, 0.509804, 1, 1,
0.2826456, 0.1201618, 0.3112383, 0, 0.5019608, 1, 1,
0.2863751, 0.9664147, 0.1761644, 0, 0.4941176, 1, 1,
0.2867835, -0.1932921, 1.995398, 0, 0.4901961, 1, 1,
0.2879818, 1.474532, -0.7411282, 0, 0.4823529, 1, 1,
0.2901021, -0.5990916, 2.5786, 0, 0.4784314, 1, 1,
0.2925241, 1.154812, -0.3809625, 0, 0.4705882, 1, 1,
0.2972583, 1.342391, 0.8211426, 0, 0.4666667, 1, 1,
0.297801, 0.8191282, 0.8964781, 0, 0.4588235, 1, 1,
0.2983314, 2.010859, 1.262598, 0, 0.454902, 1, 1,
0.2993572, 0.9666349, 1.683446, 0, 0.4470588, 1, 1,
0.3023722, 0.248492, 0.1941865, 0, 0.4431373, 1, 1,
0.3090033, 0.2335327, 0.7653187, 0, 0.4352941, 1, 1,
0.3105964, -0.5730187, 3.601882, 0, 0.4313726, 1, 1,
0.3114272, 1.051319, 0.5255353, 0, 0.4235294, 1, 1,
0.3115317, 0.1503672, 0.9576011, 0, 0.4196078, 1, 1,
0.312435, -0.05129147, -1.280401, 0, 0.4117647, 1, 1,
0.3130336, 0.05923154, 0.8956191, 0, 0.4078431, 1, 1,
0.3145587, 0.123827, 3.675783, 0, 0.4, 1, 1,
0.3146836, -0.2833089, 0.4280305, 0, 0.3921569, 1, 1,
0.3156335, 0.4560573, 0.2101909, 0, 0.3882353, 1, 1,
0.3169721, -1.808308, 1.846198, 0, 0.3803922, 1, 1,
0.3183022, 0.8746319, 2.342564, 0, 0.3764706, 1, 1,
0.3213688, 0.7982606, -0.3303085, 0, 0.3686275, 1, 1,
0.3275273, -1.250476, 4.229111, 0, 0.3647059, 1, 1,
0.3325215, 1.316742, -0.5841997, 0, 0.3568628, 1, 1,
0.3358839, 1.171373, -0.0646636, 0, 0.3529412, 1, 1,
0.336853, -0.5424133, 2.354224, 0, 0.345098, 1, 1,
0.3416072, 0.3475685, -0.6477486, 0, 0.3411765, 1, 1,
0.3418584, 0.7612634, 1.144558, 0, 0.3333333, 1, 1,
0.3435704, -2.038655, 0.9386805, 0, 0.3294118, 1, 1,
0.345387, -1.654095, 2.228998, 0, 0.3215686, 1, 1,
0.3584001, 0.3720327, 0.4785799, 0, 0.3176471, 1, 1,
0.3647415, -0.2137198, 2.320017, 0, 0.3098039, 1, 1,
0.3656867, 0.0398247, 2.322222, 0, 0.3058824, 1, 1,
0.3680308, -0.03922882, 1.049165, 0, 0.2980392, 1, 1,
0.3707868, 1.694895, 0.4820797, 0, 0.2901961, 1, 1,
0.3712012, 0.1246793, 1.509995, 0, 0.2862745, 1, 1,
0.3729932, 0.6774099, 0.2059386, 0, 0.2784314, 1, 1,
0.3764944, -1.297843, 3.83434, 0, 0.2745098, 1, 1,
0.3812405, 2.246536, 1.403826, 0, 0.2666667, 1, 1,
0.3816556, 0.5754167, 0.7399781, 0, 0.2627451, 1, 1,
0.3840998, 0.1743768, 0.5345681, 0, 0.254902, 1, 1,
0.3841712, -1.548429, 3.779428, 0, 0.2509804, 1, 1,
0.3851488, -0.4002918, 1.958642, 0, 0.2431373, 1, 1,
0.3897392, 2.143626, 0.8761457, 0, 0.2392157, 1, 1,
0.3931285, -0.5880629, 4.208353, 0, 0.2313726, 1, 1,
0.3941734, -1.413721, 2.888663, 0, 0.227451, 1, 1,
0.3958565, -1.450141, 4.415046, 0, 0.2196078, 1, 1,
0.3964731, -0.322347, 3.088694, 0, 0.2156863, 1, 1,
0.3973757, 0.2511563, 0.7685739, 0, 0.2078431, 1, 1,
0.405505, -0.7885079, 0.8863601, 0, 0.2039216, 1, 1,
0.4064893, 0.3777614, -1.271761, 0, 0.1960784, 1, 1,
0.407639, 0.3290853, 1.684769, 0, 0.1882353, 1, 1,
0.4081467, -0.7169952, 2.673246, 0, 0.1843137, 1, 1,
0.4154077, 0.2109212, 1.094974, 0, 0.1764706, 1, 1,
0.4176342, -0.4957765, 4.259672, 0, 0.172549, 1, 1,
0.4246159, -0.680382, 3.092825, 0, 0.1647059, 1, 1,
0.4249548, -0.6257057, 1.629747, 0, 0.1607843, 1, 1,
0.4261411, -1.755327, 3.352586, 0, 0.1529412, 1, 1,
0.4285302, 0.1704629, 0.7034364, 0, 0.1490196, 1, 1,
0.4336945, -1.539224, 3.444493, 0, 0.1411765, 1, 1,
0.435151, -0.06124589, 1.358366, 0, 0.1372549, 1, 1,
0.4360538, -1.888627, 1.520931, 0, 0.1294118, 1, 1,
0.4368412, 0.3364544, 2.539981, 0, 0.1254902, 1, 1,
0.4368736, 1.460362, -0.6219992, 0, 0.1176471, 1, 1,
0.4392196, 0.3353541, 0.7952668, 0, 0.1137255, 1, 1,
0.4398418, 1.480819, 0.9079453, 0, 0.1058824, 1, 1,
0.4436125, 0.1504156, 1.26933, 0, 0.09803922, 1, 1,
0.4454122, -0.03681811, 0.4938045, 0, 0.09411765, 1, 1,
0.4456216, -1.446281, 0.9955016, 0, 0.08627451, 1, 1,
0.4463498, 0.03420181, 2.585546, 0, 0.08235294, 1, 1,
0.447728, 0.3928906, 0.3666831, 0, 0.07450981, 1, 1,
0.4478765, -0.7814698, 1.285773, 0, 0.07058824, 1, 1,
0.4494432, -0.7149974, 1.891793, 0, 0.0627451, 1, 1,
0.4541827, 0.4175143, -0.5416264, 0, 0.05882353, 1, 1,
0.4555957, 2.170073, -0.05600733, 0, 0.05098039, 1, 1,
0.4561397, 0.1727669, 3.131126, 0, 0.04705882, 1, 1,
0.457677, 1.064089, 0.3812844, 0, 0.03921569, 1, 1,
0.4578238, -1.006052, 3.413344, 0, 0.03529412, 1, 1,
0.4582953, -0.1994174, 1.986327, 0, 0.02745098, 1, 1,
0.4617512, 1.809713, 3.059879, 0, 0.02352941, 1, 1,
0.4618068, -0.01501574, 1.142368, 0, 0.01568628, 1, 1,
0.46261, -0.4960283, 2.60589, 0, 0.01176471, 1, 1,
0.4627032, 0.1861066, 0.9890888, 0, 0.003921569, 1, 1,
0.4643945, 1.406755, 1.804539, 0.003921569, 0, 1, 1,
0.4722497, 0.4321579, 2.299067, 0.007843138, 0, 1, 1,
0.4731437, -1.480076, 1.660771, 0.01568628, 0, 1, 1,
0.475323, -0.7036395, 2.927399, 0.01960784, 0, 1, 1,
0.4761955, 2.692715, -0.6970333, 0.02745098, 0, 1, 1,
0.4825958, 0.6283908, -0.6258425, 0.03137255, 0, 1, 1,
0.50249, -0.03612687, 1.302745, 0.03921569, 0, 1, 1,
0.5053558, 0.1356211, 1.006439, 0.04313726, 0, 1, 1,
0.506121, 1.081042, 1.197398, 0.05098039, 0, 1, 1,
0.507748, 2.299184, 0.5918899, 0.05490196, 0, 1, 1,
0.5080147, -0.6442711, 1.555478, 0.0627451, 0, 1, 1,
0.5102963, 1.270933, -0.7430251, 0.06666667, 0, 1, 1,
0.5107557, 0.7231714, -0.2328552, 0.07450981, 0, 1, 1,
0.5216546, -0.8230817, 4.009941, 0.07843138, 0, 1, 1,
0.5232553, 0.6774971, 1.453848, 0.08627451, 0, 1, 1,
0.5323765, -0.8186642, 2.541241, 0.09019608, 0, 1, 1,
0.5329098, -0.692145, 2.377833, 0.09803922, 0, 1, 1,
0.5340574, 0.9415907, 1.004927, 0.1058824, 0, 1, 1,
0.5366604, -0.5464249, 2.873416, 0.1098039, 0, 1, 1,
0.5407562, -0.4055683, 1.876727, 0.1176471, 0, 1, 1,
0.5415534, -1.087544, 2.593521, 0.1215686, 0, 1, 1,
0.5432777, -1.218051, 3.385262, 0.1294118, 0, 1, 1,
0.5433126, 0.5982633, 0.8241153, 0.1333333, 0, 1, 1,
0.5443416, -0.8559005, 2.045629, 0.1411765, 0, 1, 1,
0.5469509, -0.5554605, 2.670463, 0.145098, 0, 1, 1,
0.54729, -0.0606099, 1.080565, 0.1529412, 0, 1, 1,
0.5517741, -0.79184, 2.444532, 0.1568628, 0, 1, 1,
0.5539159, -0.1666326, 2.499436, 0.1647059, 0, 1, 1,
0.5581902, -0.2181817, -0.383126, 0.1686275, 0, 1, 1,
0.5601386, 0.5514421, 0.9128324, 0.1764706, 0, 1, 1,
0.5668759, 0.1368024, 1.153199, 0.1803922, 0, 1, 1,
0.5674611, -0.09376512, 4.633969, 0.1882353, 0, 1, 1,
0.5686855, 0.5798396, 0.5056287, 0.1921569, 0, 1, 1,
0.5688103, 0.4076467, 0.8251145, 0.2, 0, 1, 1,
0.574324, 1.831226, 0.3809702, 0.2078431, 0, 1, 1,
0.5754071, -1.78016, 3.035726, 0.2117647, 0, 1, 1,
0.5776716, -2.643361, 3.773183, 0.2196078, 0, 1, 1,
0.5805517, 0.3130689, 0.5602438, 0.2235294, 0, 1, 1,
0.5817628, -0.3681293, 1.271012, 0.2313726, 0, 1, 1,
0.5972853, -0.4092611, 2.121603, 0.2352941, 0, 1, 1,
0.5986503, 1.592674, 1.621511, 0.2431373, 0, 1, 1,
0.6002991, 0.25186, 1.032835, 0.2470588, 0, 1, 1,
0.6016574, -0.7943967, 1.884207, 0.254902, 0, 1, 1,
0.6088651, 0.4989922, 0.4648414, 0.2588235, 0, 1, 1,
0.6092537, 0.2775283, 2.177569, 0.2666667, 0, 1, 1,
0.609768, -1.592663, 3.904442, 0.2705882, 0, 1, 1,
0.6154941, 0.3382358, 0.04432772, 0.2784314, 0, 1, 1,
0.619571, 0.3526907, 0.5387272, 0.282353, 0, 1, 1,
0.6202722, -0.4735608, 1.601471, 0.2901961, 0, 1, 1,
0.6275803, -0.07630652, 3.292063, 0.2941177, 0, 1, 1,
0.6327487, 1.635829, -0.537257, 0.3019608, 0, 1, 1,
0.6348171, 1.534059, 0.5425691, 0.3098039, 0, 1, 1,
0.6348653, -0.944546, 1.202098, 0.3137255, 0, 1, 1,
0.6386099, -1.451075, 2.58376, 0.3215686, 0, 1, 1,
0.6413832, -0.2914975, 0.9986718, 0.3254902, 0, 1, 1,
0.6427119, -0.7792097, 3.781904, 0.3333333, 0, 1, 1,
0.6643919, -0.2587752, 2.914618, 0.3372549, 0, 1, 1,
0.6653495, 1.206875, -1.394428, 0.345098, 0, 1, 1,
0.6676787, -0.08397894, 1.912772, 0.3490196, 0, 1, 1,
0.6681733, 0.1700334, -0.2111041, 0.3568628, 0, 1, 1,
0.6701647, 0.6151817, 0.6497897, 0.3607843, 0, 1, 1,
0.672938, -1.654437, 1.20926, 0.3686275, 0, 1, 1,
0.6740852, -0.9469386, 2.29275, 0.372549, 0, 1, 1,
0.6793427, -0.9418791, 0.966754, 0.3803922, 0, 1, 1,
0.6816738, -0.4929238, 2.251406, 0.3843137, 0, 1, 1,
0.6868041, -0.8427789, 0.850657, 0.3921569, 0, 1, 1,
0.6872184, 1.063145, 0.191554, 0.3960784, 0, 1, 1,
0.6910587, -0.9061586, 2.13377, 0.4039216, 0, 1, 1,
0.6921908, 1.053968, -0.4887139, 0.4117647, 0, 1, 1,
0.6940902, 0.5641748, 0.7744532, 0.4156863, 0, 1, 1,
0.7019843, -0.9538329, 3.067625, 0.4235294, 0, 1, 1,
0.7030254, -0.2923706, 2.16375, 0.427451, 0, 1, 1,
0.7136089, 0.9672997, 2.255644, 0.4352941, 0, 1, 1,
0.7145368, 1.05904, -1.170135, 0.4392157, 0, 1, 1,
0.7147736, -1.456102, 2.464191, 0.4470588, 0, 1, 1,
0.7150679, 0.04391396, 1.632477, 0.4509804, 0, 1, 1,
0.7158616, 2.008101, 0.05776659, 0.4588235, 0, 1, 1,
0.7226629, -0.01664774, 3.386703, 0.4627451, 0, 1, 1,
0.7239285, -1.613453, 2.869939, 0.4705882, 0, 1, 1,
0.7245214, -0.7951289, 1.442149, 0.4745098, 0, 1, 1,
0.7254207, -0.5889422, 0.6943861, 0.4823529, 0, 1, 1,
0.7277544, -0.5949742, 3.167027, 0.4862745, 0, 1, 1,
0.7281162, 0.9220892, 0.2278625, 0.4941176, 0, 1, 1,
0.7283921, 1.366591, 1.135201, 0.5019608, 0, 1, 1,
0.7374927, 1.687838, 0.0359473, 0.5058824, 0, 1, 1,
0.7382343, 0.2096191, 1.474565, 0.5137255, 0, 1, 1,
0.7395821, -1.551045, 5.300758, 0.5176471, 0, 1, 1,
0.7408252, -0.9237518, 1.277509, 0.5254902, 0, 1, 1,
0.7409487, 0.368481, 0.03114329, 0.5294118, 0, 1, 1,
0.7416846, -0.204913, 2.188154, 0.5372549, 0, 1, 1,
0.7464583, 0.699481, -0.2008559, 0.5411765, 0, 1, 1,
0.7500655, 1.882313, 0.06420944, 0.5490196, 0, 1, 1,
0.7503538, 2.650503, 2.208255, 0.5529412, 0, 1, 1,
0.7532874, 1.228868, 1.825404, 0.5607843, 0, 1, 1,
0.7546415, 0.3056446, 1.895694, 0.5647059, 0, 1, 1,
0.7550568, -1.386323, 3.705003, 0.572549, 0, 1, 1,
0.7574711, 1.191489, -0.3769006, 0.5764706, 0, 1, 1,
0.7582161, -1.58522, 2.399895, 0.5843138, 0, 1, 1,
0.7646166, -0.8000266, 3.557717, 0.5882353, 0, 1, 1,
0.7670522, 1.061259, 0.5634041, 0.5960785, 0, 1, 1,
0.7673874, -1.093111, -0.07307028, 0.6039216, 0, 1, 1,
0.769239, -1.183141, 1.85706, 0.6078432, 0, 1, 1,
0.7732527, -0.1508792, 2.438199, 0.6156863, 0, 1, 1,
0.7763841, 1.612421, 0.239812, 0.6196079, 0, 1, 1,
0.7875133, 0.1398301, 0.7968794, 0.627451, 0, 1, 1,
0.7878561, -0.6608862, 2.59553, 0.6313726, 0, 1, 1,
0.7891051, 1.821248, 0.8899679, 0.6392157, 0, 1, 1,
0.7899167, -1.947517, 2.177984, 0.6431373, 0, 1, 1,
0.7978076, -1.572758, 2.423166, 0.6509804, 0, 1, 1,
0.799588, -0.5685578, 1.103116, 0.654902, 0, 1, 1,
0.8000315, 0.2428631, 1.840064, 0.6627451, 0, 1, 1,
0.8040981, 1.193076, 0.09171452, 0.6666667, 0, 1, 1,
0.8044209, 0.4089756, 2.98521, 0.6745098, 0, 1, 1,
0.8063577, -1.211108, 3.373238, 0.6784314, 0, 1, 1,
0.808831, -0.7334225, 2.209096, 0.6862745, 0, 1, 1,
0.8182272, -0.532069, 0.1276346, 0.6901961, 0, 1, 1,
0.8194646, 1.219165, 0.2108277, 0.6980392, 0, 1, 1,
0.8229796, -0.3159512, 1.658887, 0.7058824, 0, 1, 1,
0.8229964, -0.004815974, 1.358558, 0.7098039, 0, 1, 1,
0.8253837, -1.585355, 5.100631, 0.7176471, 0, 1, 1,
0.8296393, -0.04891461, 0.4320402, 0.7215686, 0, 1, 1,
0.8303871, 0.6786925, 0.5786521, 0.7294118, 0, 1, 1,
0.8354915, 0.770766, 0.5706108, 0.7333333, 0, 1, 1,
0.8435273, -1.966651, 2.497182, 0.7411765, 0, 1, 1,
0.8471689, -0.6091803, 1.623094, 0.7450981, 0, 1, 1,
0.8483278, -2.081757, 2.926969, 0.7529412, 0, 1, 1,
0.8486517, -2.725505, 2.070396, 0.7568628, 0, 1, 1,
0.8576028, 0.6379064, 0.3236751, 0.7647059, 0, 1, 1,
0.8617906, 0.1955663, 1.220768, 0.7686275, 0, 1, 1,
0.8620545, 0.4332922, -0.2399156, 0.7764706, 0, 1, 1,
0.8695212, 0.1495872, 1.343587, 0.7803922, 0, 1, 1,
0.869656, 0.7445652, 0.569277, 0.7882353, 0, 1, 1,
0.8707924, 0.4637046, 0.6960854, 0.7921569, 0, 1, 1,
0.8714985, -0.06055497, 1.90973, 0.8, 0, 1, 1,
0.8726716, 0.1239805, 1.54844, 0.8078431, 0, 1, 1,
0.8760391, -0.694324, 1.605141, 0.8117647, 0, 1, 1,
0.888948, 0.1081356, 1.424744, 0.8196079, 0, 1, 1,
0.8994486, -0.6152882, 2.711293, 0.8235294, 0, 1, 1,
0.9015272, -1.080564, -0.006108615, 0.8313726, 0, 1, 1,
0.9063106, 0.421995, -0.1511203, 0.8352941, 0, 1, 1,
0.9089042, -0.1221668, 1.105124, 0.8431373, 0, 1, 1,
0.9107625, -0.2270009, 3.484309, 0.8470588, 0, 1, 1,
0.9199566, 1.717831, 0.7874514, 0.854902, 0, 1, 1,
0.9202394, 0.5855129, -0.4656762, 0.8588235, 0, 1, 1,
0.921095, -0.7495706, 0.6154178, 0.8666667, 0, 1, 1,
0.9259521, -0.04058488, 1.571009, 0.8705882, 0, 1, 1,
0.9260111, -0.54393, 1.730222, 0.8784314, 0, 1, 1,
0.9296749, 0.1787262, 3.682483, 0.8823529, 0, 1, 1,
0.929871, 0.9009079, 0.7112553, 0.8901961, 0, 1, 1,
0.9390067, 1.54729, -0.1240163, 0.8941177, 0, 1, 1,
0.9393005, -1.077724, 0.5314784, 0.9019608, 0, 1, 1,
0.9403222, 0.978213, -0.1912026, 0.9098039, 0, 1, 1,
0.9405125, 1.090223, 0.7139347, 0.9137255, 0, 1, 1,
0.9417547, -1.777087, 0.218861, 0.9215686, 0, 1, 1,
0.9443415, 0.6915838, 1.89518, 0.9254902, 0, 1, 1,
0.9528055, -0.1189833, 0.9520791, 0.9333333, 0, 1, 1,
0.9529338, 0.3353472, 0.3587879, 0.9372549, 0, 1, 1,
0.953578, 1.012148, 2.993118, 0.945098, 0, 1, 1,
0.957283, 1.313149, -0.775789, 0.9490196, 0, 1, 1,
0.9610776, -1.176758, 1.234413, 0.9568627, 0, 1, 1,
0.9619623, 2.265953, 0.8889645, 0.9607843, 0, 1, 1,
0.9623187, 0.2667862, -0.145534, 0.9686275, 0, 1, 1,
0.9676622, 3.045326, -0.109027, 0.972549, 0, 1, 1,
0.9785426, -0.3549611, 1.939719, 0.9803922, 0, 1, 1,
0.9839365, 0.698557, 0.8795254, 0.9843137, 0, 1, 1,
0.9851173, 0.4783188, 1.098249, 0.9921569, 0, 1, 1,
1.007373, -1.791278, 2.466231, 0.9960784, 0, 1, 1,
1.013549, -0.4092677, 1.020918, 1, 0, 0.9960784, 1,
1.016673, 1.992292, 2.148919, 1, 0, 0.9882353, 1,
1.017693, 0.4959809, 0.9524366, 1, 0, 0.9843137, 1,
1.018566, 0.4135397, 1.720466, 1, 0, 0.9764706, 1,
1.024853, -1.195154, 2.299486, 1, 0, 0.972549, 1,
1.025027, -1.364018, 4.29819, 1, 0, 0.9647059, 1,
1.033481, -0.5994118, 2.002344, 1, 0, 0.9607843, 1,
1.033605, -0.3851253, 3.433059, 1, 0, 0.9529412, 1,
1.034056, -2.182732, 4.743487, 1, 0, 0.9490196, 1,
1.035781, -0.9467241, 3.053626, 1, 0, 0.9411765, 1,
1.037638, 0.8652549, -0.7212096, 1, 0, 0.9372549, 1,
1.052385, 0.8831225, 2.713286, 1, 0, 0.9294118, 1,
1.056111, -0.07098434, 2.315411, 1, 0, 0.9254902, 1,
1.058269, 0.1414204, 0.8779694, 1, 0, 0.9176471, 1,
1.059408, 1.227988, 1.64844, 1, 0, 0.9137255, 1,
1.059606, -1.725384, 4.786691, 1, 0, 0.9058824, 1,
1.066014, 0.9622401, 0.1059241, 1, 0, 0.9019608, 1,
1.066478, 0.7827704, 3.158604, 1, 0, 0.8941177, 1,
1.069251, -0.3755383, 1.115592, 1, 0, 0.8862745, 1,
1.070731, -0.1749335, -0.1815348, 1, 0, 0.8823529, 1,
1.071366, 2.216102, -0.7203269, 1, 0, 0.8745098, 1,
1.071561, 1.262321, 2.632922, 1, 0, 0.8705882, 1,
1.072835, -2.062722, 2.785357, 1, 0, 0.8627451, 1,
1.074567, -0.4449561, 1.096515, 1, 0, 0.8588235, 1,
1.074769, -0.2868512, 1.539817, 1, 0, 0.8509804, 1,
1.076596, 0.184348, 2.627798, 1, 0, 0.8470588, 1,
1.080605, -1.189424, 2.325723, 1, 0, 0.8392157, 1,
1.080674, 0.06382249, 1.759926, 1, 0, 0.8352941, 1,
1.08377, 0.9423949, -1.576527, 1, 0, 0.827451, 1,
1.085626, 1.127374, 1.425682, 1, 0, 0.8235294, 1,
1.086212, 1.256841, 1.889225, 1, 0, 0.8156863, 1,
1.089258, 0.7474496, 0.8861376, 1, 0, 0.8117647, 1,
1.092343, 1.124723, 0.1629607, 1, 0, 0.8039216, 1,
1.096192, 1.350542, 0.7013476, 1, 0, 0.7960784, 1,
1.100047, 0.4413361, -0.3575636, 1, 0, 0.7921569, 1,
1.101095, -1.47127, 2.518379, 1, 0, 0.7843137, 1,
1.103104, 0.4425957, 2.711175, 1, 0, 0.7803922, 1,
1.109385, 1.346006, 0.786558, 1, 0, 0.772549, 1,
1.109611, 1.29417, 0.4519072, 1, 0, 0.7686275, 1,
1.119989, 0.3582554, 1.728509, 1, 0, 0.7607843, 1,
1.134143, -0.2221627, 2.878112, 1, 0, 0.7568628, 1,
1.139137, 1.618065, 0.4467621, 1, 0, 0.7490196, 1,
1.139756, 1.029374, 0.2701798, 1, 0, 0.7450981, 1,
1.145548, -0.04356173, 1.336566, 1, 0, 0.7372549, 1,
1.148519, 1.521355, -0.8628297, 1, 0, 0.7333333, 1,
1.153239, -0.3389182, 2.156655, 1, 0, 0.7254902, 1,
1.155186, -0.5737325, 2.183167, 1, 0, 0.7215686, 1,
1.160909, 0.8063827, 1.209631, 1, 0, 0.7137255, 1,
1.166425, 0.930211, 0.7877735, 1, 0, 0.7098039, 1,
1.172505, 0.3940584, 2.632106, 1, 0, 0.7019608, 1,
1.172806, -0.7289096, 1.862878, 1, 0, 0.6941177, 1,
1.177077, 2.065968, 0.5082858, 1, 0, 0.6901961, 1,
1.187829, -2.044977, 3.529335, 1, 0, 0.682353, 1,
1.190321, -0.6990535, 1.407226, 1, 0, 0.6784314, 1,
1.191251, -0.0316177, 1.150865, 1, 0, 0.6705883, 1,
1.191534, 0.7987647, 1.103086, 1, 0, 0.6666667, 1,
1.201444, -0.9734438, 0.4437051, 1, 0, 0.6588235, 1,
1.2072, 0.1276484, 0.09595078, 1, 0, 0.654902, 1,
1.210596, -1.751011, 3.171619, 1, 0, 0.6470588, 1,
1.211353, 0.4011542, 1.091978, 1, 0, 0.6431373, 1,
1.216349, -0.6158175, 1.746452, 1, 0, 0.6352941, 1,
1.217561, 0.02640997, 0.3775838, 1, 0, 0.6313726, 1,
1.218892, -1.417131, 2.961344, 1, 0, 0.6235294, 1,
1.222531, 0.5991609, 0.5174804, 1, 0, 0.6196079, 1,
1.223647, 1.592312, 1.254869, 1, 0, 0.6117647, 1,
1.234395, 0.7663679, 0.6113283, 1, 0, 0.6078432, 1,
1.234578, 1.662982, 2.030905, 1, 0, 0.6, 1,
1.239885, 0.2270708, 1.009728, 1, 0, 0.5921569, 1,
1.242856, 0.0881873, 0.00705808, 1, 0, 0.5882353, 1,
1.249329, 0.1333845, -0.1121631, 1, 0, 0.5803922, 1,
1.250019, 1.003254, 0.4942528, 1, 0, 0.5764706, 1,
1.251397, 0.3074228, 2.53723, 1, 0, 0.5686275, 1,
1.256638, -0.1499371, 1.404851, 1, 0, 0.5647059, 1,
1.266982, 0.4861232, 2.83337, 1, 0, 0.5568628, 1,
1.271744, -0.006069323, 2.324702, 1, 0, 0.5529412, 1,
1.277572, 1.334507, 1.833206, 1, 0, 0.5450981, 1,
1.281191, -0.6030372, 1.448524, 1, 0, 0.5411765, 1,
1.284268, -0.3784615, 1.596712, 1, 0, 0.5333334, 1,
1.295832, -0.6043911, 1.164499, 1, 0, 0.5294118, 1,
1.307002, -1.144413, 2.165197, 1, 0, 0.5215687, 1,
1.307261, -0.06658524, 2.473971, 1, 0, 0.5176471, 1,
1.310471, 0.7138377, 1.610678, 1, 0, 0.509804, 1,
1.314396, 0.7878479, 2.501336, 1, 0, 0.5058824, 1,
1.329923, -1.699297, 1.058072, 1, 0, 0.4980392, 1,
1.338928, -1.053735, 1.699073, 1, 0, 0.4901961, 1,
1.345694, -0.6885163, 3.559117, 1, 0, 0.4862745, 1,
1.349571, 1.023086, 1.475176, 1, 0, 0.4784314, 1,
1.352793, 0.4269587, 2.194764, 1, 0, 0.4745098, 1,
1.355638, -0.4997081, 3.667629, 1, 0, 0.4666667, 1,
1.364174, -0.6820643, 3.717175, 1, 0, 0.4627451, 1,
1.370679, -1.58321, 3.10866, 1, 0, 0.454902, 1,
1.375165, 0.7532141, -0.5742897, 1, 0, 0.4509804, 1,
1.375554, 0.1356348, 2.479326, 1, 0, 0.4431373, 1,
1.395517, 2.603952, 1.109736, 1, 0, 0.4392157, 1,
1.397128, 0.8963837, 1.462113, 1, 0, 0.4313726, 1,
1.399877, -0.3286661, 2.470596, 1, 0, 0.427451, 1,
1.40052, -1.081603, 4.479408, 1, 0, 0.4196078, 1,
1.411336, 0.1859434, 0.9536141, 1, 0, 0.4156863, 1,
1.428845, -0.2559753, 2.554887, 1, 0, 0.4078431, 1,
1.431701, 0.782523, 1.522037, 1, 0, 0.4039216, 1,
1.440219, 0.4723644, 2.289263, 1, 0, 0.3960784, 1,
1.441278, 0.8067858, -0.8313316, 1, 0, 0.3882353, 1,
1.447118, 1.402252, 1.531131, 1, 0, 0.3843137, 1,
1.459025, 1.09357, 2.350342, 1, 0, 0.3764706, 1,
1.495042, 0.805158, 2.465007, 1, 0, 0.372549, 1,
1.49576, 0.162451, 1.319101, 1, 0, 0.3647059, 1,
1.506088, -0.9534204, 1.252588, 1, 0, 0.3607843, 1,
1.524518, -1.293024, 2.777735, 1, 0, 0.3529412, 1,
1.526168, -0.03189338, 1.894869, 1, 0, 0.3490196, 1,
1.542897, 1.512416, 1.689721, 1, 0, 0.3411765, 1,
1.545306, -0.05329963, 2.280186, 1, 0, 0.3372549, 1,
1.554811, -1.041424, 3.092723, 1, 0, 0.3294118, 1,
1.562533, 0.8159689, 0.4881791, 1, 0, 0.3254902, 1,
1.56659, 1.54414, 0.6009567, 1, 0, 0.3176471, 1,
1.58593, 0.5287856, 1.273844, 1, 0, 0.3137255, 1,
1.587166, -0.4046861, 1.434645, 1, 0, 0.3058824, 1,
1.600899, 0.9834214, 1.117472, 1, 0, 0.2980392, 1,
1.61159, 0.01482488, 1.529304, 1, 0, 0.2941177, 1,
1.627471, -1.780154, 1.976436, 1, 0, 0.2862745, 1,
1.668179, 0.4576792, 0.3009103, 1, 0, 0.282353, 1,
1.683985, -0.537079, 1.81592, 1, 0, 0.2745098, 1,
1.692383, 0.2205179, 0.6833207, 1, 0, 0.2705882, 1,
1.693397, -1.244402, 2.336536, 1, 0, 0.2627451, 1,
1.694072, 0.8139281, 0.5359429, 1, 0, 0.2588235, 1,
1.695592, -3.375131, 1.869858, 1, 0, 0.2509804, 1,
1.699389, 1.146286, 2.179296, 1, 0, 0.2470588, 1,
1.699536, -0.2110733, 2.47154, 1, 0, 0.2392157, 1,
1.734629, 2.274454, 1.229563, 1, 0, 0.2352941, 1,
1.751614, 0.1747992, 0.8983048, 1, 0, 0.227451, 1,
1.780621, 0.7077407, 3.832701, 1, 0, 0.2235294, 1,
1.790609, 0.4103155, 0.1587124, 1, 0, 0.2156863, 1,
1.803424, 0.7164618, 1.659501, 1, 0, 0.2117647, 1,
1.81946, -0.04861259, 1.311395, 1, 0, 0.2039216, 1,
1.836581, 0.5030347, 0.8630063, 1, 0, 0.1960784, 1,
1.837942, 0.8292585, 1.954674, 1, 0, 0.1921569, 1,
1.8455, -0.3006999, -0.01486808, 1, 0, 0.1843137, 1,
1.852032, 0.4265605, 0.1083716, 1, 0, 0.1803922, 1,
1.864893, 0.3048803, 2.649275, 1, 0, 0.172549, 1,
1.889374, -1.48416, 2.666429, 1, 0, 0.1686275, 1,
1.889618, -0.9580186, 0.3298706, 1, 0, 0.1607843, 1,
1.896987, 1.02393, -0.4826249, 1, 0, 0.1568628, 1,
1.899737, -1.333198, 0.7514583, 1, 0, 0.1490196, 1,
1.906309, -1.345145, 2.710477, 1, 0, 0.145098, 1,
1.983198, 0.02717963, 0.721469, 1, 0, 0.1372549, 1,
2.001265, 0.3319475, 1.483223, 1, 0, 0.1333333, 1,
2.044525, 0.2971229, 1.257517, 1, 0, 0.1254902, 1,
2.044764, -2.498756, 1.632049, 1, 0, 0.1215686, 1,
2.048153, -1.639195, 2.466347, 1, 0, 0.1137255, 1,
2.05822, 1.389951, 2.340663, 1, 0, 0.1098039, 1,
2.075256, -2.332445, 2.45038, 1, 0, 0.1019608, 1,
2.110008, -0.3940064, 2.230042, 1, 0, 0.09411765, 1,
2.110189, -0.5418639, 0.9949703, 1, 0, 0.09019608, 1,
2.176857, -1.251141, 3.355074, 1, 0, 0.08235294, 1,
2.323499, 1.218637, -1.047669, 1, 0, 0.07843138, 1,
2.369365, 0.6139485, 1.339507, 1, 0, 0.07058824, 1,
2.436409, 0.9662017, 2.681906, 1, 0, 0.06666667, 1,
2.478015, -0.296172, 2.841888, 1, 0, 0.05882353, 1,
2.573693, 1.189109, 1.237915, 1, 0, 0.05490196, 1,
2.629498, 0.8671376, 1.678093, 1, 0, 0.04705882, 1,
2.758224, 0.4552881, 2.431919, 1, 0, 0.04313726, 1,
2.861609, 0.4172665, 2.78609, 1, 0, 0.03529412, 1,
2.886049, -0.06144158, 2.773496, 1, 0, 0.03137255, 1,
3.061032, 0.2292693, 0.7645522, 1, 0, 0.02352941, 1,
3.082568, -0.7088426, 1.980033, 1, 0, 0.01960784, 1,
3.127218, -1.080314, 0.505512, 1, 0, 0.01176471, 1,
3.734424, -0.6916099, 0.8757414, 1, 0, 0.007843138, 1
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
0.3994089, -4.531282, -6.778638, 0, -0.5, 0.5, 0.5,
0.3994089, -4.531282, -6.778638, 1, -0.5, 0.5, 0.5,
0.3994089, -4.531282, -6.778638, 1, 1.5, 0.5, 0.5,
0.3994089, -4.531282, -6.778638, 0, 1.5, 0.5, 0.5
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
-4.066177, 0.0353446, -6.778638, 0, -0.5, 0.5, 0.5,
-4.066177, 0.0353446, -6.778638, 1, -0.5, 0.5, 0.5,
-4.066177, 0.0353446, -6.778638, 1, 1.5, 0.5, 0.5,
-4.066177, 0.0353446, -6.778638, 0, 1.5, 0.5, 0.5
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
-4.066177, -4.531282, 0.1364162, 0, -0.5, 0.5, 0.5,
-4.066177, -4.531282, 0.1364162, 1, -0.5, 0.5, 0.5,
-4.066177, -4.531282, 0.1364162, 1, 1.5, 0.5, 0.5,
-4.066177, -4.531282, 0.1364162, 0, 1.5, 0.5, 0.5
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
-2, -3.477445, -5.182856,
3, -3.477445, -5.182856,
-2, -3.477445, -5.182856,
-2, -3.653085, -5.44882,
-1, -3.477445, -5.182856,
-1, -3.653085, -5.44882,
0, -3.477445, -5.182856,
0, -3.653085, -5.44882,
1, -3.477445, -5.182856,
1, -3.653085, -5.44882,
2, -3.477445, -5.182856,
2, -3.653085, -5.44882,
3, -3.477445, -5.182856,
3, -3.653085, -5.44882
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
-2, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
-2, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
-2, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
-2, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5,
-1, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
-1, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
-1, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
-1, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5,
0, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
0, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
0, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
0, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5,
1, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
1, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
1, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
1, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5,
2, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
2, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
2, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
2, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5,
3, -4.004364, -5.980747, 0, -0.5, 0.5, 0.5,
3, -4.004364, -5.980747, 1, -0.5, 0.5, 0.5,
3, -4.004364, -5.980747, 1, 1.5, 0.5, 0.5,
3, -4.004364, -5.980747, 0, 1.5, 0.5, 0.5
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
-3.035657, -3, -5.182856,
-3.035657, 3, -5.182856,
-3.035657, -3, -5.182856,
-3.20741, -3, -5.44882,
-3.035657, -2, -5.182856,
-3.20741, -2, -5.44882,
-3.035657, -1, -5.182856,
-3.20741, -1, -5.44882,
-3.035657, 0, -5.182856,
-3.20741, 0, -5.44882,
-3.035657, 1, -5.182856,
-3.20741, 1, -5.44882,
-3.035657, 2, -5.182856,
-3.20741, 2, -5.44882,
-3.035657, 3, -5.182856,
-3.20741, 3, -5.44882
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
-3.550917, -3, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, -3, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, -3, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, -3, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, -2, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, -2, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, -2, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, -2, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, -1, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, -1, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, -1, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, -1, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, 0, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, 0, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, 0, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, 0, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, 1, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, 1, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, 1, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, 1, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, 2, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, 2, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, 2, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, 2, -5.980747, 0, 1.5, 0.5, 0.5,
-3.550917, 3, -5.980747, 0, -0.5, 0.5, 0.5,
-3.550917, 3, -5.980747, 1, -0.5, 0.5, 0.5,
-3.550917, 3, -5.980747, 1, 1.5, 0.5, 0.5,
-3.550917, 3, -5.980747, 0, 1.5, 0.5, 0.5
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
-3.035657, -3.477445, -4,
-3.035657, -3.477445, 4,
-3.035657, -3.477445, -4,
-3.20741, -3.653085, -4,
-3.035657, -3.477445, -2,
-3.20741, -3.653085, -2,
-3.035657, -3.477445, 0,
-3.20741, -3.653085, 0,
-3.035657, -3.477445, 2,
-3.20741, -3.653085, 2,
-3.035657, -3.477445, 4,
-3.20741, -3.653085, 4
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
-3.550917, -4.004364, -4, 0, -0.5, 0.5, 0.5,
-3.550917, -4.004364, -4, 1, -0.5, 0.5, 0.5,
-3.550917, -4.004364, -4, 1, 1.5, 0.5, 0.5,
-3.550917, -4.004364, -4, 0, 1.5, 0.5, 0.5,
-3.550917, -4.004364, -2, 0, -0.5, 0.5, 0.5,
-3.550917, -4.004364, -2, 1, -0.5, 0.5, 0.5,
-3.550917, -4.004364, -2, 1, 1.5, 0.5, 0.5,
-3.550917, -4.004364, -2, 0, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 0, 0, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 0, 1, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 0, 1, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 0, 0, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 2, 0, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 2, 1, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 2, 1, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 2, 0, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 4, 0, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 4, 1, -0.5, 0.5, 0.5,
-3.550917, -4.004364, 4, 1, 1.5, 0.5, 0.5,
-3.550917, -4.004364, 4, 0, 1.5, 0.5, 0.5
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
-3.035657, -3.477445, -5.182856,
-3.035657, 3.548135, -5.182856,
-3.035657, -3.477445, 5.455688,
-3.035657, 3.548135, 5.455688,
-3.035657, -3.477445, -5.182856,
-3.035657, -3.477445, 5.455688,
-3.035657, 3.548135, -5.182856,
-3.035657, 3.548135, 5.455688,
-3.035657, -3.477445, -5.182856,
3.834475, -3.477445, -5.182856,
-3.035657, -3.477445, 5.455688,
3.834475, -3.477445, 5.455688,
-3.035657, 3.548135, -5.182856,
3.834475, 3.548135, -5.182856,
-3.035657, 3.548135, 5.455688,
3.834475, 3.548135, 5.455688,
3.834475, -3.477445, -5.182856,
3.834475, 3.548135, -5.182856,
3.834475, -3.477445, 5.455688,
3.834475, 3.548135, 5.455688,
3.834475, -3.477445, -5.182856,
3.834475, -3.477445, 5.455688,
3.834475, 3.548135, -5.182856,
3.834475, 3.548135, 5.455688
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
var radius = 7.73325;
var distance = 34.40611;
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
mvMatrix.translate( -0.3994089, -0.0353446, -0.1364162 );
mvMatrix.scale( 1.217057, 1.190128, 0.7859479 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40611);
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
1-methylethyl_N-benz<-read.table("1-methylethyl_N-benz.xyz", skip=1)
```

```
## Error in read.table("1-methylethyl_N-benz.xyz", skip = 1): duplicate 'row.names' are not allowed
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
-2.935606, -0.5575325, -3.013687, 0, 0, 1, 1, 1,
-2.693141, 0.484134, -1.672975, 1, 0, 0, 1, 1,
-2.665236, -1.860127, -1.420537, 1, 0, 0, 1, 1,
-2.466916, 0.6121936, -0.8456292, 1, 0, 0, 1, 1,
-2.463958, -1.451483, -1.877594, 1, 0, 0, 1, 1,
-2.459773, 0.5484785, -1.821325, 1, 0, 0, 1, 1,
-2.417011, 1.122066, -2.358674, 0, 0, 0, 1, 1,
-2.413791, -0.7126108, -1.833277, 0, 0, 0, 1, 1,
-2.306346, -1.260383, -1.836361, 0, 0, 0, 1, 1,
-2.295991, 1.349085, 0.04362657, 0, 0, 0, 1, 1,
-2.282123, 1.084893, 0.09314882, 0, 0, 0, 1, 1,
-2.242832, -0.161503, -1.906202, 0, 0, 0, 1, 1,
-2.22566, -0.9772503, -0.847937, 0, 0, 0, 1, 1,
-2.214584, -0.1640694, -2.099329, 1, 1, 1, 1, 1,
-2.172508, -0.1670361, -0.5537762, 1, 1, 1, 1, 1,
-2.161132, -1.003595, -2.186253, 1, 1, 1, 1, 1,
-2.157631, -1.286321, -3.354691, 1, 1, 1, 1, 1,
-2.076321, -0.09709023, -2.503196, 1, 1, 1, 1, 1,
-2.058652, 0.2317694, -1.386562, 1, 1, 1, 1, 1,
-2.044424, -1.225555, -3.892102, 1, 1, 1, 1, 1,
-2.040984, -0.8399381, -1.445553, 1, 1, 1, 1, 1,
-2.027017, 0.7959116, -1.834905, 1, 1, 1, 1, 1,
-2.010319, -1.635188, -2.246128, 1, 1, 1, 1, 1,
-2.006386, 1.233379, -1.153033, 1, 1, 1, 1, 1,
-2.005582, -0.709843, -2.153254, 1, 1, 1, 1, 1,
-1.97102, -0.3106123, -0.9417049, 1, 1, 1, 1, 1,
-1.945861, 2.642212, -0.8882412, 1, 1, 1, 1, 1,
-1.923225, 0.1798792, -1.831182, 1, 1, 1, 1, 1,
-1.884503, -0.7389942, -0.3357659, 0, 0, 1, 1, 1,
-1.849055, 1.437573, -1.804152, 1, 0, 0, 1, 1,
-1.823979, -0.5216045, -2.779544, 1, 0, 0, 1, 1,
-1.822533, 0.9589987, -1.72034, 1, 0, 0, 1, 1,
-1.813079, 0.04792885, -3.406671, 1, 0, 0, 1, 1,
-1.80961, -1.300746, -1.291882, 1, 0, 0, 1, 1,
-1.76629, 1.101298, -0.1795911, 0, 0, 0, 1, 1,
-1.76451, -0.8086976, -3.838972, 0, 0, 0, 1, 1,
-1.732674, -0.195469, -1.29141, 0, 0, 0, 1, 1,
-1.731895, 1.890967, 0.05283239, 0, 0, 0, 1, 1,
-1.731083, 0.4927498, -0.118366, 0, 0, 0, 1, 1,
-1.720045, 0.2652606, -2.576849, 0, 0, 0, 1, 1,
-1.681598, -0.8249727, -1.366959, 0, 0, 0, 1, 1,
-1.677887, 0.3847318, -2.944452, 1, 1, 1, 1, 1,
-1.676146, -1.454233, -3.486406, 1, 1, 1, 1, 1,
-1.662917, -0.0688999, -3.475845, 1, 1, 1, 1, 1,
-1.656044, -0.3652483, -3.296051, 1, 1, 1, 1, 1,
-1.639034, -0.1660946, -1.431048, 1, 1, 1, 1, 1,
-1.636429, 1.822736, 0.6460549, 1, 1, 1, 1, 1,
-1.601001, -1.543045, -3.561284, 1, 1, 1, 1, 1,
-1.599573, -0.6371345, -2.15696, 1, 1, 1, 1, 1,
-1.592276, -0.2638774, -2.646556, 1, 1, 1, 1, 1,
-1.588501, 0.4893893, 0.02193948, 1, 1, 1, 1, 1,
-1.582216, 1.143943, 0.3065399, 1, 1, 1, 1, 1,
-1.552187, 0.1716485, -3.547238, 1, 1, 1, 1, 1,
-1.548888, 0.4220703, -1.167099, 1, 1, 1, 1, 1,
-1.541064, -1.91087, -2.126349, 1, 1, 1, 1, 1,
-1.53196, 0.2933125, -2.552581, 1, 1, 1, 1, 1,
-1.528333, 1.407734, -0.2463542, 0, 0, 1, 1, 1,
-1.520318, 1.385912, -2.701378, 1, 0, 0, 1, 1,
-1.502409, -0.2476158, -1.922343, 1, 0, 0, 1, 1,
-1.491967, 0.6860806, 0.6405343, 1, 0, 0, 1, 1,
-1.490386, 0.02122412, 0.4056228, 1, 0, 0, 1, 1,
-1.470482, -1.317345, -2.651481, 1, 0, 0, 1, 1,
-1.46666, -1.929704, -1.966594, 0, 0, 0, 1, 1,
-1.449456, -0.4893855, -2.966687, 0, 0, 0, 1, 1,
-1.445388, 0.5602224, -1.388771, 0, 0, 0, 1, 1,
-1.443367, 0.3449574, -1.244599, 0, 0, 0, 1, 1,
-1.42664, 0.1510366, -0.8243203, 0, 0, 0, 1, 1,
-1.422999, 1.052027, -1.578288, 0, 0, 0, 1, 1,
-1.420293, 0.2097219, 0.2375544, 0, 0, 0, 1, 1,
-1.419873, -0.07399479, -0.387986, 1, 1, 1, 1, 1,
-1.41165, 0.9897032, -0.4641937, 1, 1, 1, 1, 1,
-1.406895, 1.023567, -1.448992, 1, 1, 1, 1, 1,
-1.388597, -0.8710371, -3.532949, 1, 1, 1, 1, 1,
-1.386852, -1.238052, -3.376176, 1, 1, 1, 1, 1,
-1.382738, -1.608973, -1.767467, 1, 1, 1, 1, 1,
-1.381522, 1.429852, -1.005292, 1, 1, 1, 1, 1,
-1.379737, 0.4996626, -1.030521, 1, 1, 1, 1, 1,
-1.367627, -0.6916871, -1.405161, 1, 1, 1, 1, 1,
-1.36473, 1.117065, -0.8874517, 1, 1, 1, 1, 1,
-1.352206, 1.074358, -1.418183, 1, 1, 1, 1, 1,
-1.33762, 0.871342, -0.921445, 1, 1, 1, 1, 1,
-1.33292, -0.9673478, -1.603716, 1, 1, 1, 1, 1,
-1.326462, 0.06122132, -2.311886, 1, 1, 1, 1, 1,
-1.32498, -0.2716817, -1.581472, 1, 1, 1, 1, 1,
-1.323727, 0.7785156, -0.2953893, 0, 0, 1, 1, 1,
-1.321876, 1.306354, -1.044315, 1, 0, 0, 1, 1,
-1.318202, -1.734585, -2.615648, 1, 0, 0, 1, 1,
-1.296239, -1.044423, -1.564869, 1, 0, 0, 1, 1,
-1.294637, 0.4694265, -2.281445, 1, 0, 0, 1, 1,
-1.293946, -1.659546, -2.987447, 1, 0, 0, 1, 1,
-1.286715, -0.268767, -0.7984966, 0, 0, 0, 1, 1,
-1.277035, -0.5678643, -1.065982, 0, 0, 0, 1, 1,
-1.26713, 0.3648633, -1.047245, 0, 0, 0, 1, 1,
-1.26612, -0.05235795, -1.546542, 0, 0, 0, 1, 1,
-1.265072, -0.04301217, -0.9457674, 0, 0, 0, 1, 1,
-1.261256, -0.1567619, -0.7424678, 0, 0, 0, 1, 1,
-1.259542, 0.4945725, -0.3642676, 0, 0, 0, 1, 1,
-1.255765, -0.53686, -1.853652, 1, 1, 1, 1, 1,
-1.252353, 0.2188631, -1.550322, 1, 1, 1, 1, 1,
-1.247988, 0.05269958, -1.544771, 1, 1, 1, 1, 1,
-1.244594, -1.142022, -3.155617, 1, 1, 1, 1, 1,
-1.243399, 1.214842, 0.65299, 1, 1, 1, 1, 1,
-1.243354, -2.277829, -3.017878, 1, 1, 1, 1, 1,
-1.224418, 0.506819, -0.7059007, 1, 1, 1, 1, 1,
-1.219176, 1.720101, -1.159759, 1, 1, 1, 1, 1,
-1.21301, 0.1740489, -0.6957315, 1, 1, 1, 1, 1,
-1.20662, -1.188575, -1.268036, 1, 1, 1, 1, 1,
-1.195046, 0.1193364, -1.685575, 1, 1, 1, 1, 1,
-1.192315, 1.081854, -1.593177, 1, 1, 1, 1, 1,
-1.172309, -1.141269, -2.006279, 1, 1, 1, 1, 1,
-1.170488, 0.3382676, -0.1836632, 1, 1, 1, 1, 1,
-1.168611, -0.2928382, -1.211725, 1, 1, 1, 1, 1,
-1.168587, 1.251838, -0.5033076, 0, 0, 1, 1, 1,
-1.168219, -1.164963, -3.149528, 1, 0, 0, 1, 1,
-1.159808, 1.546688, -1.529032, 1, 0, 0, 1, 1,
-1.154149, 0.9268833, -1.571872, 1, 0, 0, 1, 1,
-1.147896, 0.4195232, -1.176084, 1, 0, 0, 1, 1,
-1.145879, -0.4314963, -3.309165, 1, 0, 0, 1, 1,
-1.144282, -0.235774, -2.38034, 0, 0, 0, 1, 1,
-1.141771, 0.6610115, -1.980676, 0, 0, 0, 1, 1,
-1.134245, -0.7294419, -2.495406, 0, 0, 0, 1, 1,
-1.13083, -0.2189611, -1.86543, 0, 0, 0, 1, 1,
-1.125571, 1.34996, -3.121356, 0, 0, 0, 1, 1,
-1.121377, 1.08698, -0.7651238, 0, 0, 0, 1, 1,
-1.119537, 0.9887885, -1.680141, 0, 0, 0, 1, 1,
-1.116197, -0.9114735, -2.729312, 1, 1, 1, 1, 1,
-1.112711, -1.33922, -0.134694, 1, 1, 1, 1, 1,
-1.109869, -0.267543, -1.988971, 1, 1, 1, 1, 1,
-1.105752, -2.63935, -2.994714, 1, 1, 1, 1, 1,
-1.09994, 1.122451, 0.4090504, 1, 1, 1, 1, 1,
-1.098103, 0.2375623, -2.530989, 1, 1, 1, 1, 1,
-1.091843, 0.02489871, 0.852532, 1, 1, 1, 1, 1,
-1.070205, -1.003728, -3.191786, 1, 1, 1, 1, 1,
-1.065023, -0.4221905, -2.725341, 1, 1, 1, 1, 1,
-1.062226, -1.23096, -1.411174, 1, 1, 1, 1, 1,
-1.060313, 0.5198725, 0.4715585, 1, 1, 1, 1, 1,
-1.058849, -1.290725, -2.521606, 1, 1, 1, 1, 1,
-1.057032, -0.7627722, -3.794231, 1, 1, 1, 1, 1,
-1.045768, 0.4007517, -0.4640068, 1, 1, 1, 1, 1,
-1.045578, -2.054868, -3.023684, 1, 1, 1, 1, 1,
-1.044022, -0.09865829, -1.664818, 0, 0, 1, 1, 1,
-1.03804, 1.029438, -1.360473, 1, 0, 0, 1, 1,
-1.022803, -1.347672, -2.70515, 1, 0, 0, 1, 1,
-1.013771, 1.41303, -0.9523498, 1, 0, 0, 1, 1,
-1.007385, 1.545238, 0.8144081, 1, 0, 0, 1, 1,
-1.001519, -0.0921201, -1.624396, 1, 0, 0, 1, 1,
-1.000989, 0.08564633, -1.577942, 0, 0, 0, 1, 1,
-0.999234, -1.38334, -4.050488, 0, 0, 0, 1, 1,
-0.9971486, 0.6117502, -2.055867, 0, 0, 0, 1, 1,
-0.988867, -0.2430381, -2.392008, 0, 0, 0, 1, 1,
-0.9856135, 0.989383, -0.1774181, 0, 0, 0, 1, 1,
-0.9835042, 1.570319, 0.03033503, 0, 0, 0, 1, 1,
-0.9823257, -0.2051355, -0.7010333, 0, 0, 0, 1, 1,
-0.9746984, 0.2666345, -0.5495779, 1, 1, 1, 1, 1,
-0.9693986, 0.07138058, 0.1453923, 1, 1, 1, 1, 1,
-0.9677206, -0.05221504, -1.858599, 1, 1, 1, 1, 1,
-0.9635067, 1.818671, -0.3022765, 1, 1, 1, 1, 1,
-0.9530925, -0.2303672, -0.7900391, 1, 1, 1, 1, 1,
-0.9524714, 0.3869892, -1.224879, 1, 1, 1, 1, 1,
-0.9520479, -1.38659, -2.351821, 1, 1, 1, 1, 1,
-0.9470448, 0.9989408, -1.661346, 1, 1, 1, 1, 1,
-0.9435252, -0.0921942, -1.280464, 1, 1, 1, 1, 1,
-0.9409584, -1.935469, -1.851475, 1, 1, 1, 1, 1,
-0.9407481, 0.3811861, -1.708746, 1, 1, 1, 1, 1,
-0.9386878, -0.7702571, -2.81863, 1, 1, 1, 1, 1,
-0.9342818, -1.672087, -3.449266, 1, 1, 1, 1, 1,
-0.9116606, -0.1550278, -2.167334, 1, 1, 1, 1, 1,
-0.9077156, 0.1841606, -2.065427, 1, 1, 1, 1, 1,
-0.8916566, -1.041335, -2.440349, 0, 0, 1, 1, 1,
-0.8914323, -0.3587813, -2.603658, 1, 0, 0, 1, 1,
-0.8895459, 0.9286678, -0.6156619, 1, 0, 0, 1, 1,
-0.8847926, -0.4604991, -0.382674, 1, 0, 0, 1, 1,
-0.8817313, 2.125463, 0.596119, 1, 0, 0, 1, 1,
-0.8808972, 0.9913701, -2.005771, 1, 0, 0, 1, 1,
-0.8766025, 0.1890972, -2.259095, 0, 0, 0, 1, 1,
-0.8757686, 0.8275968, -1.664843, 0, 0, 0, 1, 1,
-0.8754395, 0.2563884, -1.329211, 0, 0, 0, 1, 1,
-0.854907, 1.789014, -1.800087, 0, 0, 0, 1, 1,
-0.8519725, 0.2702285, -3.012607, 0, 0, 0, 1, 1,
-0.8418249, -0.3314216, -1.906096, 0, 0, 0, 1, 1,
-0.8399894, -0.7306542, -2.065618, 0, 0, 0, 1, 1,
-0.8384222, 0.6963881, -1.113625, 1, 1, 1, 1, 1,
-0.83381, -1.103649, -3.025838, 1, 1, 1, 1, 1,
-0.8300861, -0.3366029, -3.059865, 1, 1, 1, 1, 1,
-0.7969953, -0.09729622, -2.47938, 1, 1, 1, 1, 1,
-0.7948346, -0.08193715, -3.197495, 1, 1, 1, 1, 1,
-0.7818226, -1.5571, -3.607727, 1, 1, 1, 1, 1,
-0.777288, -0.8168529, -2.480329, 1, 1, 1, 1, 1,
-0.7750965, -0.1845069, -0.3604858, 1, 1, 1, 1, 1,
-0.774991, 0.486124, -1.403549, 1, 1, 1, 1, 1,
-0.770856, 1.495019, -0.6756699, 1, 1, 1, 1, 1,
-0.7623855, 0.08708019, -0.3973094, 1, 1, 1, 1, 1,
-0.7532439, 0.1265199, -0.7304558, 1, 1, 1, 1, 1,
-0.745625, 1.421866, -0.4385477, 1, 1, 1, 1, 1,
-0.7449525, -2.40731, -1.294829, 1, 1, 1, 1, 1,
-0.743858, -0.369855, -1.869945, 1, 1, 1, 1, 1,
-0.7383048, -0.4669758, -1.986438, 0, 0, 1, 1, 1,
-0.7362519, 1.155828, -0.4371306, 1, 0, 0, 1, 1,
-0.7348435, -0.4431928, -0.1565966, 1, 0, 0, 1, 1,
-0.7324767, -0.8544521, -2.711861, 1, 0, 0, 1, 1,
-0.7308995, -0.167452, -2.517185, 1, 0, 0, 1, 1,
-0.7261223, -1.5488, -1.555146, 1, 0, 0, 1, 1,
-0.7252641, -0.09714764, -2.28762, 0, 0, 0, 1, 1,
-0.7250792, 1.767169, -1.728896, 0, 0, 0, 1, 1,
-0.7230887, -0.3740349, -2.283191, 0, 0, 0, 1, 1,
-0.7166052, -1.241045, -3.59107, 0, 0, 0, 1, 1,
-0.7161187, 0.6679192, -1.554183, 0, 0, 0, 1, 1,
-0.7146965, -0.1763744, -3.286312, 0, 0, 0, 1, 1,
-0.7113811, -1.315129, -1.625372, 0, 0, 0, 1, 1,
-0.7107906, -0.3391016, -2.375598, 1, 1, 1, 1, 1,
-0.7043409, -2.05617, -2.894564, 1, 1, 1, 1, 1,
-0.6961434, -0.6039333, -2.866778, 1, 1, 1, 1, 1,
-0.6887021, -0.2663023, -1.418504, 1, 1, 1, 1, 1,
-0.6836345, -0.4366843, -0.0005720269, 1, 1, 1, 1, 1,
-0.6804571, -0.7395971, -4.602759, 1, 1, 1, 1, 1,
-0.6776683, -0.1388036, 0.05230363, 1, 1, 1, 1, 1,
-0.675032, 0.5738969, -1.350172, 1, 1, 1, 1, 1,
-0.6733887, 0.3746289, 0.7990437, 1, 1, 1, 1, 1,
-0.6632588, -1.223229, -2.060737, 1, 1, 1, 1, 1,
-0.6595202, -0.8882549, -1.73104, 1, 1, 1, 1, 1,
-0.6582919, 0.1155654, -2.709389, 1, 1, 1, 1, 1,
-0.6547646, 0.7630888, 1.660002, 1, 1, 1, 1, 1,
-0.6536289, -0.003529614, -0.5123776, 1, 1, 1, 1, 1,
-0.6434898, -0.7750722, 0.02006222, 1, 1, 1, 1, 1,
-0.6392365, -0.662486, -2.848215, 0, 0, 1, 1, 1,
-0.6383302, 0.4318783, -2.406237, 1, 0, 0, 1, 1,
-0.6331341, 1.237524, -1.172394, 1, 0, 0, 1, 1,
-0.6302276, -1.418486, -2.950171, 1, 0, 0, 1, 1,
-0.6139542, -0.06407656, -0.6324769, 1, 0, 0, 1, 1,
-0.607779, 0.1598196, -1.166178, 1, 0, 0, 1, 1,
-0.6077266, 1.507103, -0.4582477, 0, 0, 0, 1, 1,
-0.6061053, 1.642827, 0.6995219, 0, 0, 0, 1, 1,
-0.6058055, 1.421174, 0.2337483, 0, 0, 0, 1, 1,
-0.6004482, 0.9857033, -0.5588535, 0, 0, 0, 1, 1,
-0.5995438, -0.08788317, -0.9411306, 0, 0, 0, 1, 1,
-0.599011, -1.426141, -2.07044, 0, 0, 0, 1, 1,
-0.5988581, 0.1778964, -1.607581, 0, 0, 0, 1, 1,
-0.5961213, -0.8261153, -2.731819, 1, 1, 1, 1, 1,
-0.5956865, 0.2641436, -1.148822, 1, 1, 1, 1, 1,
-0.5931513, -0.8304269, -2.532039, 1, 1, 1, 1, 1,
-0.5895529, 1.255021, -0.8071737, 1, 1, 1, 1, 1,
-0.5891901, -3.231242, -3.312517, 1, 1, 1, 1, 1,
-0.5882134, 0.2064511, -1.578772, 1, 1, 1, 1, 1,
-0.5853891, 0.2096465, -2.009396, 1, 1, 1, 1, 1,
-0.5766301, 0.111181, -0.8246323, 1, 1, 1, 1, 1,
-0.5702594, -0.5891378, -2.677631, 1, 1, 1, 1, 1,
-0.5640768, 0.8108166, -0.7491729, 1, 1, 1, 1, 1,
-0.5639899, 0.3413532, -0.4967313, 1, 1, 1, 1, 1,
-0.5594562, -0.947576, -2.555856, 1, 1, 1, 1, 1,
-0.5524455, -0.0562765, -0.9171361, 1, 1, 1, 1, 1,
-0.5522547, -2.466107, -3.842777, 1, 1, 1, 1, 1,
-0.5451864, 1.437364, -0.7172437, 1, 1, 1, 1, 1,
-0.5418468, 0.9185563, 1.564523, 0, 0, 1, 1, 1,
-0.5409713, -0.5209504, -3.888984, 1, 0, 0, 1, 1,
-0.5394912, 1.096106, -0.7592735, 1, 0, 0, 1, 1,
-0.5303153, 0.1120278, -2.16082, 1, 0, 0, 1, 1,
-0.5298338, -0.4574056, -2.522506, 1, 0, 0, 1, 1,
-0.527972, -0.02567843, -3.147326, 1, 0, 0, 1, 1,
-0.5248973, 0.4386161, -0.4161544, 0, 0, 0, 1, 1,
-0.5191606, -0.07236642, -0.7485799, 0, 0, 0, 1, 1,
-0.5162117, -0.5123459, -1.986652, 0, 0, 0, 1, 1,
-0.5144288, 0.9428428, 1.395536, 0, 0, 0, 1, 1,
-0.5128844, -2.479727, -3.356447, 0, 0, 0, 1, 1,
-0.509738, -0.8028941, -2.541383, 0, 0, 0, 1, 1,
-0.5069119, -0.8044494, -3.490339, 0, 0, 0, 1, 1,
-0.5047933, -0.253541, -1.276036, 1, 1, 1, 1, 1,
-0.499937, -0.382622, -3.308709, 1, 1, 1, 1, 1,
-0.4972042, 0.1225734, -0.8853902, 1, 1, 1, 1, 1,
-0.4965283, -0.8183606, -3.347671, 1, 1, 1, 1, 1,
-0.4898823, 0.7485635, 0.3623143, 1, 1, 1, 1, 1,
-0.4832154, 0.2153188, -0.6543915, 1, 1, 1, 1, 1,
-0.4741154, 1.213586, -0.07360925, 1, 1, 1, 1, 1,
-0.472953, -0.561745, -3.544575, 1, 1, 1, 1, 1,
-0.4712934, -0.3970202, -1.180768, 1, 1, 1, 1, 1,
-0.4671637, 1.394633, -0.7732915, 1, 1, 1, 1, 1,
-0.4644579, -1.558906, -2.234906, 1, 1, 1, 1, 1,
-0.4633686, 0.6618019, -3.219853, 1, 1, 1, 1, 1,
-0.4628696, -1.129842, -2.428407, 1, 1, 1, 1, 1,
-0.4623224, -1.689294, -3.666104, 1, 1, 1, 1, 1,
-0.4606912, -2.021782, -3.351428, 1, 1, 1, 1, 1,
-0.4604954, -1.433223, -4.257155, 0, 0, 1, 1, 1,
-0.4584214, -0.5972494, -2.544537, 1, 0, 0, 1, 1,
-0.4559762, 1.297587, -1.066612, 1, 0, 0, 1, 1,
-0.4520231, -0.1856329, -2.535976, 1, 0, 0, 1, 1,
-0.450063, 3.44582, -0.4864789, 1, 0, 0, 1, 1,
-0.448834, 0.2352616, -1.04584, 1, 0, 0, 1, 1,
-0.4452175, -0.07651144, -2.873307, 0, 0, 0, 1, 1,
-0.4438231, 0.4570304, -1.151034, 0, 0, 0, 1, 1,
-0.4436188, -0.1263671, -1.109111, 0, 0, 0, 1, 1,
-0.4428744, -0.7602894, -1.950762, 0, 0, 0, 1, 1,
-0.4391651, -0.4322432, -2.646555, 0, 0, 0, 1, 1,
-0.4356736, 0.8451039, -2.059499, 0, 0, 0, 1, 1,
-0.4324619, -0.5176155, -2.74984, 0, 0, 0, 1, 1,
-0.4306247, 2.840543, 1.157711, 1, 1, 1, 1, 1,
-0.4284361, 1.367232, -1.131765, 1, 1, 1, 1, 1,
-0.4280331, 0.664635, -0.06427751, 1, 1, 1, 1, 1,
-0.4260849, -0.3598688, -3.056306, 1, 1, 1, 1, 1,
-0.4254154, -0.3404746, -2.757756, 1, 1, 1, 1, 1,
-0.4233876, -0.05685578, -3.338238, 1, 1, 1, 1, 1,
-0.4208156, -0.3351734, -3.351268, 1, 1, 1, 1, 1,
-0.4183652, 0.2246669, 1.269015, 1, 1, 1, 1, 1,
-0.4175325, -1.395092, -2.027582, 1, 1, 1, 1, 1,
-0.4161974, 0.7394009, -1.390908, 1, 1, 1, 1, 1,
-0.4161582, 0.1001355, -1.24204, 1, 1, 1, 1, 1,
-0.4157117, -0.9609768, -1.185021, 1, 1, 1, 1, 1,
-0.4129388, -0.3482673, -2.069583, 1, 1, 1, 1, 1,
-0.4125805, -0.1486744, -1.597387, 1, 1, 1, 1, 1,
-0.4091451, 0.1634176, -0.9290648, 1, 1, 1, 1, 1,
-0.4075211, 0.2590225, -3.438581, 0, 0, 1, 1, 1,
-0.4025559, 1.05614, 0.4839827, 1, 0, 0, 1, 1,
-0.4018965, 0.5210479, -1.693427, 1, 0, 0, 1, 1,
-0.3983236, 0.6005049, 1.226144, 1, 0, 0, 1, 1,
-0.397772, 0.6415561, -1.515205, 1, 0, 0, 1, 1,
-0.3950292, 1.536727, -0.8617983, 1, 0, 0, 1, 1,
-0.3940261, -0.6854395, -1.089841, 0, 0, 0, 1, 1,
-0.3922943, 1.336809, -0.2262582, 0, 0, 0, 1, 1,
-0.391963, 0.1667277, -0.2685868, 0, 0, 0, 1, 1,
-0.3883346, -2.75221, -2.500596, 0, 0, 0, 1, 1,
-0.3865785, 0.93922, 0.5943156, 0, 0, 0, 1, 1,
-0.3857848, -0.4759136, -4.065761, 0, 0, 0, 1, 1,
-0.3844421, -1.047009, -4.846236, 0, 0, 0, 1, 1,
-0.3826853, -1.685551, -4.907218, 1, 1, 1, 1, 1,
-0.3799329, 1.246069, -0.5721739, 1, 1, 1, 1, 1,
-0.3770784, 0.6378797, 0.02123619, 1, 1, 1, 1, 1,
-0.3734813, -0.160854, -1.414862, 1, 1, 1, 1, 1,
-0.3692911, 1.693441, -1.55763, 1, 1, 1, 1, 1,
-0.3649767, -1.705875, -3.412421, 1, 1, 1, 1, 1,
-0.3643949, -1.480687, -2.142828, 1, 1, 1, 1, 1,
-0.3616158, 0.1664795, -1.133658, 1, 1, 1, 1, 1,
-0.358375, -1.384228, -2.445103, 1, 1, 1, 1, 1,
-0.3570794, 0.3759591, 0.1535957, 1, 1, 1, 1, 1,
-0.3558924, -0.6915979, -1.52708, 1, 1, 1, 1, 1,
-0.3507816, -0.5209931, -2.419951, 1, 1, 1, 1, 1,
-0.3504794, -0.06837958, -1.712962, 1, 1, 1, 1, 1,
-0.3467495, -1.061332, -4.310382, 1, 1, 1, 1, 1,
-0.3460236, 0.6515043, -0.6225059, 1, 1, 1, 1, 1,
-0.3444444, -0.6167659, -2.99661, 0, 0, 1, 1, 1,
-0.3432478, -0.1668355, -1.730221, 1, 0, 0, 1, 1,
-0.341334, 1.14976, -0.7460571, 1, 0, 0, 1, 1,
-0.3401196, -0.7662412, -4.014365, 1, 0, 0, 1, 1,
-0.33871, -0.03594288, -2.143393, 1, 0, 0, 1, 1,
-0.3371743, 0.801414, -0.1731242, 1, 0, 0, 1, 1,
-0.336971, 1.582156, 1.117028, 0, 0, 0, 1, 1,
-0.3308112, -0.4075303, -1.5011, 0, 0, 0, 1, 1,
-0.3307289, -0.8486284, -1.985233, 0, 0, 0, 1, 1,
-0.3300279, -0.4039279, -1.428003, 0, 0, 0, 1, 1,
-0.3257772, 0.7385427, -0.5293103, 0, 0, 0, 1, 1,
-0.3207592, 0.152584, -1.329472, 0, 0, 0, 1, 1,
-0.3160697, -1.782645, -4.155857, 0, 0, 0, 1, 1,
-0.31078, 2.864843, 2.212457, 1, 1, 1, 1, 1,
-0.3095784, 1.053583, -0.3658007, 1, 1, 1, 1, 1,
-0.3049662, -1.183199, -1.685419, 1, 1, 1, 1, 1,
-0.3047531, -1.094736, -3.074005, 1, 1, 1, 1, 1,
-0.3027038, 0.6957363, -0.2449304, 1, 1, 1, 1, 1,
-0.3019845, 0.4418393, -2.092849, 1, 1, 1, 1, 1,
-0.3011106, 0.1751645, -0.6044298, 1, 1, 1, 1, 1,
-0.3008427, 0.3187474, -0.4197048, 1, 1, 1, 1, 1,
-0.2986503, -0.901588, -1.528168, 1, 1, 1, 1, 1,
-0.297689, -0.8183913, -2.009171, 1, 1, 1, 1, 1,
-0.295396, -2.041604, -5.027926, 1, 1, 1, 1, 1,
-0.2900821, -1.876936, -2.481367, 1, 1, 1, 1, 1,
-0.2900685, 1.527696, 1.055845, 1, 1, 1, 1, 1,
-0.2754591, -0.7087154, -4.112861, 1, 1, 1, 1, 1,
-0.2750907, -2.228154, -2.683694, 1, 1, 1, 1, 1,
-0.2749946, -1.467813, -1.538958, 0, 0, 1, 1, 1,
-0.2742367, -2.140812, -3.106044, 1, 0, 0, 1, 1,
-0.2732821, -1.020613, -2.474553, 1, 0, 0, 1, 1,
-0.264242, 0.8777328, -1.184599, 1, 0, 0, 1, 1,
-0.263708, 0.4899754, 1.159885, 1, 0, 0, 1, 1,
-0.2621093, -0.009838388, -1.632983, 1, 0, 0, 1, 1,
-0.2612037, 0.9669896, 0.03950814, 0, 0, 0, 1, 1,
-0.2605035, 0.9634901, -0.3265206, 0, 0, 0, 1, 1,
-0.2514956, -0.7474506, -3.410522, 0, 0, 0, 1, 1,
-0.2506236, 1.457741, -0.5867884, 0, 0, 0, 1, 1,
-0.2458574, -0.7448912, -2.243106, 0, 0, 0, 1, 1,
-0.2409597, 1.482761, 0.2290436, 0, 0, 0, 1, 1,
-0.2404799, -0.7197285, -3.537623, 0, 0, 0, 1, 1,
-0.2363134, -1.4789, -1.402331, 1, 1, 1, 1, 1,
-0.2355274, -0.9072455, -2.202182, 1, 1, 1, 1, 1,
-0.2345462, -0.7350426, -2.604192, 1, 1, 1, 1, 1,
-0.226944, -1.318965, -4.216873, 1, 1, 1, 1, 1,
-0.2240057, -1.318163, -3.401055, 1, 1, 1, 1, 1,
-0.2239799, 0.9886002, -0.3632539, 1, 1, 1, 1, 1,
-0.2222341, -0.817076, -2.453631, 1, 1, 1, 1, 1,
-0.2169753, 1.341426, 0.6661419, 1, 1, 1, 1, 1,
-0.2126406, 0.044916, 0.6748645, 1, 1, 1, 1, 1,
-0.2113618, 0.05219238, -2.049223, 1, 1, 1, 1, 1,
-0.2087354, 1.482076, 0.9171899, 1, 1, 1, 1, 1,
-0.2085028, 0.02181561, -1.483608, 1, 1, 1, 1, 1,
-0.2079137, 0.2939413, -2.180648, 1, 1, 1, 1, 1,
-0.205003, -0.1230964, 0.3738089, 1, 1, 1, 1, 1,
-0.203164, -0.3661236, -0.9961837, 1, 1, 1, 1, 1,
-0.2021853, 1.077876, 1.205317, 0, 0, 1, 1, 1,
-0.1998957, 1.519105, 0.06925997, 1, 0, 0, 1, 1,
-0.1993825, 1.643187, -0.630971, 1, 0, 0, 1, 1,
-0.1978458, 1.391805, -2.250319, 1, 0, 0, 1, 1,
-0.1944028, -2.435762, -2.311697, 1, 0, 0, 1, 1,
-0.1938036, -0.2381091, -1.230097, 1, 0, 0, 1, 1,
-0.1921803, 1.540206, -0.5251097, 0, 0, 0, 1, 1,
-0.1918299, -0.06636922, -0.9780069, 0, 0, 0, 1, 1,
-0.1896415, -0.9441375, -3.330061, 0, 0, 0, 1, 1,
-0.1853459, 1.331602, -0.5718111, 0, 0, 0, 1, 1,
-0.184656, -1.693521, -3.072063, 0, 0, 0, 1, 1,
-0.1808964, -0.4776107, -1.764111, 0, 0, 0, 1, 1,
-0.1787581, -1.784056, -4.782128, 0, 0, 0, 1, 1,
-0.175529, 0.708736, 1.156149, 1, 1, 1, 1, 1,
-0.1728151, -0.5927478, -3.849521, 1, 1, 1, 1, 1,
-0.1725755, 1.156412, 0.2416651, 1, 1, 1, 1, 1,
-0.1723551, -0.7239903, -2.603052, 1, 1, 1, 1, 1,
-0.170399, 0.06828806, -1.872291, 1, 1, 1, 1, 1,
-0.1699548, 1.06327, -3.169687, 1, 1, 1, 1, 1,
-0.1676064, -0.5955892, -3.515033, 1, 1, 1, 1, 1,
-0.1621765, 1.548613, -0.4509377, 1, 1, 1, 1, 1,
-0.1613637, 1.120163, 1.493186, 1, 1, 1, 1, 1,
-0.1575043, -0.1844239, -3.086548, 1, 1, 1, 1, 1,
-0.1567576, -1.067466, -4.084127, 1, 1, 1, 1, 1,
-0.1556933, -0.7480125, -1.788435, 1, 1, 1, 1, 1,
-0.1555955, -0.1003133, -3.542535, 1, 1, 1, 1, 1,
-0.1543716, -0.7718253, -3.699957, 1, 1, 1, 1, 1,
-0.149906, 0.290042, -0.9521983, 1, 1, 1, 1, 1,
-0.1465035, 0.6091399, 1.48708, 0, 0, 1, 1, 1,
-0.1417722, 0.08150985, -1.702086, 1, 0, 0, 1, 1,
-0.1407783, -0.4702939, -3.044624, 1, 0, 0, 1, 1,
-0.1398368, -0.4236482, -1.182222, 1, 0, 0, 1, 1,
-0.1382986, -1.336364, -3.254559, 1, 0, 0, 1, 1,
-0.1378146, 0.9080448, -0.7213567, 1, 0, 0, 1, 1,
-0.1353553, 0.02539868, -1.134802, 0, 0, 0, 1, 1,
-0.1352708, 0.2079532, 1.530716, 0, 0, 0, 1, 1,
-0.1323307, 0.4492314, -1.442239, 0, 0, 0, 1, 1,
-0.1304116, 0.6322896, 0.3219122, 0, 0, 0, 1, 1,
-0.1301601, -1.392931, -2.29959, 0, 0, 0, 1, 1,
-0.1282928, -0.1013441, -0.472992, 0, 0, 0, 1, 1,
-0.1271074, 0.2152571, -1.017736, 0, 0, 0, 1, 1,
-0.1234572, -1.794919, -3.739708, 1, 1, 1, 1, 1,
-0.1208368, -0.293061, -2.068069, 1, 1, 1, 1, 1,
-0.1152769, -0.4277574, -3.364316, 1, 1, 1, 1, 1,
-0.1137912, -0.02362873, -2.161691, 1, 1, 1, 1, 1,
-0.1114949, -0.3928469, -1.990988, 1, 1, 1, 1, 1,
-0.1108905, -0.2505382, -2.782877, 1, 1, 1, 1, 1,
-0.1091172, -1.556887, -3.32397, 1, 1, 1, 1, 1,
-0.1084375, 0.750503, 1.208325, 1, 1, 1, 1, 1,
-0.1075118, -0.797901, -3.476659, 1, 1, 1, 1, 1,
-0.1049896, 0.169352, 0.2852584, 1, 1, 1, 1, 1,
-0.1044678, 1.389768, -1.509617, 1, 1, 1, 1, 1,
-0.1006226, -0.04909193, -1.869677, 1, 1, 1, 1, 1,
-0.09527879, 1.109003, -3.327783, 1, 1, 1, 1, 1,
-0.09511568, 0.09043946, -0.0104807, 1, 1, 1, 1, 1,
-0.08997828, 0.2995777, 0.3517276, 1, 1, 1, 1, 1,
-0.08862889, 0.1073363, -1.019902, 0, 0, 1, 1, 1,
-0.0875525, -1.003645, -1.478879, 1, 0, 0, 1, 1,
-0.08363575, 1.2997, 0.2714463, 1, 0, 0, 1, 1,
-0.07610767, 0.7682258, -0.02216074, 1, 0, 0, 1, 1,
-0.07561488, 0.4603789, -0.3411513, 1, 0, 0, 1, 1,
-0.07250123, 0.2701363, 0.1664508, 1, 0, 0, 1, 1,
-0.06870021, 1.529574, 1.16318, 0, 0, 0, 1, 1,
-0.06347689, 0.8277254, 0.04405854, 0, 0, 0, 1, 1,
-0.05899249, -1.80607, -2.567411, 0, 0, 0, 1, 1,
-0.05517038, -0.134497, -2.160437, 0, 0, 0, 1, 1,
-0.0543642, -1.959244, -1.845059, 0, 0, 0, 1, 1,
-0.05283933, -0.267886, -3.145373, 0, 0, 0, 1, 1,
-0.05280273, 0.5866829, -0.645012, 0, 0, 0, 1, 1,
-0.05231096, -1.565615, -2.963423, 1, 1, 1, 1, 1,
-0.04866482, -0.9975328, -2.810001, 1, 1, 1, 1, 1,
-0.0473941, -0.02947638, -2.588081, 1, 1, 1, 1, 1,
-0.04692875, -0.4984326, -3.59068, 1, 1, 1, 1, 1,
-0.04577278, 1.669271, -0.5108894, 1, 1, 1, 1, 1,
-0.04503537, -0.6669089, -3.946417, 1, 1, 1, 1, 1,
-0.03703799, -0.8995589, -4.906448, 1, 1, 1, 1, 1,
-0.03594955, 0.5579871, 1.675773, 1, 1, 1, 1, 1,
-0.03488217, 0.1466812, -2.447673, 1, 1, 1, 1, 1,
-0.03473334, -2.21227, -4.008617, 1, 1, 1, 1, 1,
-0.03456115, -0.3501548, -3.960534, 1, 1, 1, 1, 1,
-0.03387993, -2.136145, -3.664984, 1, 1, 1, 1, 1,
-0.03364051, 0.7651123, 1.072529, 1, 1, 1, 1, 1,
-0.03056635, -0.1050434, -2.462338, 1, 1, 1, 1, 1,
-0.02836225, 0.8216332, -0.7256767, 1, 1, 1, 1, 1,
-0.02792688, -0.7704054, -2.281399, 0, 0, 1, 1, 1,
-0.02730014, 1.156326, -0.4034005, 1, 0, 0, 1, 1,
-0.02644268, 0.6587068, 0.397818, 1, 0, 0, 1, 1,
-0.02589137, -0.9209956, -3.190082, 1, 0, 0, 1, 1,
-0.02038986, 0.9491976, -0.6309874, 1, 0, 0, 1, 1,
-0.0191616, 0.3174106, -1.035743, 1, 0, 0, 1, 1,
-0.01759218, 0.883329, 0.2948812, 0, 0, 0, 1, 1,
-0.01757808, 0.8746188, -1.081951, 0, 0, 0, 1, 1,
-0.01591825, 1.357771, 1.271828, 0, 0, 0, 1, 1,
-0.01235474, 2.140828, -0.6508798, 0, 0, 0, 1, 1,
-0.005583385, -0.1097454, -3.31309, 0, 0, 0, 1, 1,
-0.002473448, 1.32837, 1.130155, 0, 0, 0, 1, 1,
-0.001857346, 0.01652438, 0.1639314, 0, 0, 0, 1, 1,
0.001858812, 0.2448398, -2.748787, 1, 1, 1, 1, 1,
0.00385586, -0.7136686, 4.867011, 1, 1, 1, 1, 1,
0.004690865, 0.8049228, 1.043562, 1, 1, 1, 1, 1,
0.007920465, -0.7651998, 4.113807, 1, 1, 1, 1, 1,
0.009744936, 0.3189686, 0.5657305, 1, 1, 1, 1, 1,
0.01307711, -0.8814669, 3.741413, 1, 1, 1, 1, 1,
0.01547448, 1.189869, 0.3264413, 1, 1, 1, 1, 1,
0.01585125, -0.2404702, 4.358515, 1, 1, 1, 1, 1,
0.02103934, -0.2643305, 2.496291, 1, 1, 1, 1, 1,
0.02496109, -2.461413, 3.909605, 1, 1, 1, 1, 1,
0.02774203, -2.135496, 3.25762, 1, 1, 1, 1, 1,
0.03241117, 0.1417263, 1.200647, 1, 1, 1, 1, 1,
0.03244237, -0.3125595, 2.390372, 1, 1, 1, 1, 1,
0.0349416, 1.479066, -1.080219, 1, 1, 1, 1, 1,
0.04534591, -0.1237228, 4.842298, 1, 1, 1, 1, 1,
0.05118798, -0.8778825, 4.699891, 0, 0, 1, 1, 1,
0.05237046, 1.052787, -1.815096, 1, 0, 0, 1, 1,
0.05620872, -0.4109856, 3.256763, 1, 0, 0, 1, 1,
0.05676195, -0.1778974, 0.01412128, 1, 0, 0, 1, 1,
0.058114, -1.845515, 2.504348, 1, 0, 0, 1, 1,
0.05858503, -1.336799, 2.707565, 1, 0, 0, 1, 1,
0.06283526, 0.9643721, -0.4195858, 0, 0, 0, 1, 1,
0.06496485, 0.8251225, 1.861406, 0, 0, 0, 1, 1,
0.06557024, 0.8874877, 0.4901957, 0, 0, 0, 1, 1,
0.07079882, -0.3096845, 2.374377, 0, 0, 0, 1, 1,
0.07312611, -0.3094431, 2.344701, 0, 0, 0, 1, 1,
0.07766054, 0.5973456, 2.010857, 0, 0, 0, 1, 1,
0.08000981, 1.769029, -0.6353024, 0, 0, 0, 1, 1,
0.09708671, 0.6183178, -0.3448413, 1, 1, 1, 1, 1,
0.09779666, -2.742953, 0.9634624, 1, 1, 1, 1, 1,
0.1057213, -0.1694448, 2.311496, 1, 1, 1, 1, 1,
0.105968, 0.6605438, -0.9350154, 1, 1, 1, 1, 1,
0.1062559, 1.048435, 0.4937991, 1, 1, 1, 1, 1,
0.1070992, 1.056764, 0.703896, 1, 1, 1, 1, 1,
0.1074317, 0.4651352, -0.882531, 1, 1, 1, 1, 1,
0.110609, 1.358858, 0.6300827, 1, 1, 1, 1, 1,
0.1168442, 1.241066, 1.121808, 1, 1, 1, 1, 1,
0.1270268, 0.4179834, 0.702492, 1, 1, 1, 1, 1,
0.1282241, 0.9126548, -0.1507104, 1, 1, 1, 1, 1,
0.1289707, 0.04755683, 1.981055, 1, 1, 1, 1, 1,
0.129935, -1.476469, 3.431517, 1, 1, 1, 1, 1,
0.133807, -0.8109659, 2.409642, 1, 1, 1, 1, 1,
0.1344288, 0.03421203, 1.214914, 1, 1, 1, 1, 1,
0.1374584, -0.3231235, 3.051467, 0, 0, 1, 1, 1,
0.1397728, -0.7086931, 1.549806, 1, 0, 0, 1, 1,
0.1397738, -1.285858, 4.146558, 1, 0, 0, 1, 1,
0.1425133, 0.3888935, 1.010243, 1, 0, 0, 1, 1,
0.1425691, 1.881675, 0.4919546, 1, 0, 0, 1, 1,
0.1442016, -0.5780804, 3.026119, 1, 0, 0, 1, 1,
0.1454555, -0.006959785, 1.534237, 0, 0, 0, 1, 1,
0.1508904, -0.3978689, 0.5719033, 0, 0, 0, 1, 1,
0.1633731, 1.017935, -0.3064693, 0, 0, 0, 1, 1,
0.1647564, 0.3851577, 1.846208, 0, 0, 0, 1, 1,
0.1671855, -0.5764467, 1.420629, 0, 0, 0, 1, 1,
0.1681055, 3.019202, 0.5396392, 0, 0, 0, 1, 1,
0.1762319, 0.9143132, 0.8962574, 0, 0, 0, 1, 1,
0.177822, -0.8708153, 2.811831, 1, 1, 1, 1, 1,
0.1781248, 0.5986239, 2.534784, 1, 1, 1, 1, 1,
0.1787089, -0.08572888, 1.662312, 1, 1, 1, 1, 1,
0.1789618, 0.6644284, -1.708797, 1, 1, 1, 1, 1,
0.1801859, -2.355447, 4.350253, 1, 1, 1, 1, 1,
0.1820198, 0.2091416, 2.079969, 1, 1, 1, 1, 1,
0.1847864, -0.316782, 2.53676, 1, 1, 1, 1, 1,
0.1851206, -0.1407435, 2.580324, 1, 1, 1, 1, 1,
0.186789, -1.174826, 1.802342, 1, 1, 1, 1, 1,
0.1876577, -1.307821, 2.108172, 1, 1, 1, 1, 1,
0.1889785, -0.02263037, 0.673867, 1, 1, 1, 1, 1,
0.1900123, -0.4308571, 3.926422, 1, 1, 1, 1, 1,
0.1913637, 0.6487979, 0.7878922, 1, 1, 1, 1, 1,
0.1929953, -0.8859173, 2.224893, 1, 1, 1, 1, 1,
0.1952523, -0.8568436, 1.073108, 1, 1, 1, 1, 1,
0.2001388, 0.3510831, 1.126437, 0, 0, 1, 1, 1,
0.2048721, -0.3823739, 2.905952, 1, 0, 0, 1, 1,
0.2099719, -2.487918, 2.4843, 1, 0, 0, 1, 1,
0.2210762, -1.150924, 3.456867, 1, 0, 0, 1, 1,
0.2274796, -0.6945699, 3.148538, 1, 0, 0, 1, 1,
0.2275496, 0.01774682, 1.548642, 1, 0, 0, 1, 1,
0.2311293, 0.09371896, 1.204854, 0, 0, 0, 1, 1,
0.2334578, -0.6680921, 2.473434, 0, 0, 0, 1, 1,
0.2344483, -0.943422, 3.96527, 0, 0, 0, 1, 1,
0.2362987, -0.2131031, 2.405664, 0, 0, 0, 1, 1,
0.2473223, 0.6571284, -0.1323776, 0, 0, 0, 1, 1,
0.2507462, 0.9202836, 0.1973314, 0, 0, 0, 1, 1,
0.2530665, -0.5337726, 2.223636, 0, 0, 0, 1, 1,
0.2539127, -0.1654713, 1.928279, 1, 1, 1, 1, 1,
0.2582249, 1.819564, 0.122251, 1, 1, 1, 1, 1,
0.2608294, -0.6550649, 2.537551, 1, 1, 1, 1, 1,
0.2682953, -1.468984, 1.912339, 1, 1, 1, 1, 1,
0.2740203, -0.613568, 3.292942, 1, 1, 1, 1, 1,
0.2741233, 0.3816713, 2.027834, 1, 1, 1, 1, 1,
0.276905, -1.216968, 1.966619, 1, 1, 1, 1, 1,
0.2775766, 0.07443813, 1.258973, 1, 1, 1, 1, 1,
0.2810605, -0.3487923, 4.433897, 1, 1, 1, 1, 1,
0.2812468, -0.2822985, 2.219812, 1, 1, 1, 1, 1,
0.2826456, 0.1201618, 0.3112383, 1, 1, 1, 1, 1,
0.2863751, 0.9664147, 0.1761644, 1, 1, 1, 1, 1,
0.2867835, -0.1932921, 1.995398, 1, 1, 1, 1, 1,
0.2879818, 1.474532, -0.7411282, 1, 1, 1, 1, 1,
0.2901021, -0.5990916, 2.5786, 1, 1, 1, 1, 1,
0.2925241, 1.154812, -0.3809625, 0, 0, 1, 1, 1,
0.2972583, 1.342391, 0.8211426, 1, 0, 0, 1, 1,
0.297801, 0.8191282, 0.8964781, 1, 0, 0, 1, 1,
0.2983314, 2.010859, 1.262598, 1, 0, 0, 1, 1,
0.2993572, 0.9666349, 1.683446, 1, 0, 0, 1, 1,
0.3023722, 0.248492, 0.1941865, 1, 0, 0, 1, 1,
0.3090033, 0.2335327, 0.7653187, 0, 0, 0, 1, 1,
0.3105964, -0.5730187, 3.601882, 0, 0, 0, 1, 1,
0.3114272, 1.051319, 0.5255353, 0, 0, 0, 1, 1,
0.3115317, 0.1503672, 0.9576011, 0, 0, 0, 1, 1,
0.312435, -0.05129147, -1.280401, 0, 0, 0, 1, 1,
0.3130336, 0.05923154, 0.8956191, 0, 0, 0, 1, 1,
0.3145587, 0.123827, 3.675783, 0, 0, 0, 1, 1,
0.3146836, -0.2833089, 0.4280305, 1, 1, 1, 1, 1,
0.3156335, 0.4560573, 0.2101909, 1, 1, 1, 1, 1,
0.3169721, -1.808308, 1.846198, 1, 1, 1, 1, 1,
0.3183022, 0.8746319, 2.342564, 1, 1, 1, 1, 1,
0.3213688, 0.7982606, -0.3303085, 1, 1, 1, 1, 1,
0.3275273, -1.250476, 4.229111, 1, 1, 1, 1, 1,
0.3325215, 1.316742, -0.5841997, 1, 1, 1, 1, 1,
0.3358839, 1.171373, -0.0646636, 1, 1, 1, 1, 1,
0.336853, -0.5424133, 2.354224, 1, 1, 1, 1, 1,
0.3416072, 0.3475685, -0.6477486, 1, 1, 1, 1, 1,
0.3418584, 0.7612634, 1.144558, 1, 1, 1, 1, 1,
0.3435704, -2.038655, 0.9386805, 1, 1, 1, 1, 1,
0.345387, -1.654095, 2.228998, 1, 1, 1, 1, 1,
0.3584001, 0.3720327, 0.4785799, 1, 1, 1, 1, 1,
0.3647415, -0.2137198, 2.320017, 1, 1, 1, 1, 1,
0.3656867, 0.0398247, 2.322222, 0, 0, 1, 1, 1,
0.3680308, -0.03922882, 1.049165, 1, 0, 0, 1, 1,
0.3707868, 1.694895, 0.4820797, 1, 0, 0, 1, 1,
0.3712012, 0.1246793, 1.509995, 1, 0, 0, 1, 1,
0.3729932, 0.6774099, 0.2059386, 1, 0, 0, 1, 1,
0.3764944, -1.297843, 3.83434, 1, 0, 0, 1, 1,
0.3812405, 2.246536, 1.403826, 0, 0, 0, 1, 1,
0.3816556, 0.5754167, 0.7399781, 0, 0, 0, 1, 1,
0.3840998, 0.1743768, 0.5345681, 0, 0, 0, 1, 1,
0.3841712, -1.548429, 3.779428, 0, 0, 0, 1, 1,
0.3851488, -0.4002918, 1.958642, 0, 0, 0, 1, 1,
0.3897392, 2.143626, 0.8761457, 0, 0, 0, 1, 1,
0.3931285, -0.5880629, 4.208353, 0, 0, 0, 1, 1,
0.3941734, -1.413721, 2.888663, 1, 1, 1, 1, 1,
0.3958565, -1.450141, 4.415046, 1, 1, 1, 1, 1,
0.3964731, -0.322347, 3.088694, 1, 1, 1, 1, 1,
0.3973757, 0.2511563, 0.7685739, 1, 1, 1, 1, 1,
0.405505, -0.7885079, 0.8863601, 1, 1, 1, 1, 1,
0.4064893, 0.3777614, -1.271761, 1, 1, 1, 1, 1,
0.407639, 0.3290853, 1.684769, 1, 1, 1, 1, 1,
0.4081467, -0.7169952, 2.673246, 1, 1, 1, 1, 1,
0.4154077, 0.2109212, 1.094974, 1, 1, 1, 1, 1,
0.4176342, -0.4957765, 4.259672, 1, 1, 1, 1, 1,
0.4246159, -0.680382, 3.092825, 1, 1, 1, 1, 1,
0.4249548, -0.6257057, 1.629747, 1, 1, 1, 1, 1,
0.4261411, -1.755327, 3.352586, 1, 1, 1, 1, 1,
0.4285302, 0.1704629, 0.7034364, 1, 1, 1, 1, 1,
0.4336945, -1.539224, 3.444493, 1, 1, 1, 1, 1,
0.435151, -0.06124589, 1.358366, 0, 0, 1, 1, 1,
0.4360538, -1.888627, 1.520931, 1, 0, 0, 1, 1,
0.4368412, 0.3364544, 2.539981, 1, 0, 0, 1, 1,
0.4368736, 1.460362, -0.6219992, 1, 0, 0, 1, 1,
0.4392196, 0.3353541, 0.7952668, 1, 0, 0, 1, 1,
0.4398418, 1.480819, 0.9079453, 1, 0, 0, 1, 1,
0.4436125, 0.1504156, 1.26933, 0, 0, 0, 1, 1,
0.4454122, -0.03681811, 0.4938045, 0, 0, 0, 1, 1,
0.4456216, -1.446281, 0.9955016, 0, 0, 0, 1, 1,
0.4463498, 0.03420181, 2.585546, 0, 0, 0, 1, 1,
0.447728, 0.3928906, 0.3666831, 0, 0, 0, 1, 1,
0.4478765, -0.7814698, 1.285773, 0, 0, 0, 1, 1,
0.4494432, -0.7149974, 1.891793, 0, 0, 0, 1, 1,
0.4541827, 0.4175143, -0.5416264, 1, 1, 1, 1, 1,
0.4555957, 2.170073, -0.05600733, 1, 1, 1, 1, 1,
0.4561397, 0.1727669, 3.131126, 1, 1, 1, 1, 1,
0.457677, 1.064089, 0.3812844, 1, 1, 1, 1, 1,
0.4578238, -1.006052, 3.413344, 1, 1, 1, 1, 1,
0.4582953, -0.1994174, 1.986327, 1, 1, 1, 1, 1,
0.4617512, 1.809713, 3.059879, 1, 1, 1, 1, 1,
0.4618068, -0.01501574, 1.142368, 1, 1, 1, 1, 1,
0.46261, -0.4960283, 2.60589, 1, 1, 1, 1, 1,
0.4627032, 0.1861066, 0.9890888, 1, 1, 1, 1, 1,
0.4643945, 1.406755, 1.804539, 1, 1, 1, 1, 1,
0.4722497, 0.4321579, 2.299067, 1, 1, 1, 1, 1,
0.4731437, -1.480076, 1.660771, 1, 1, 1, 1, 1,
0.475323, -0.7036395, 2.927399, 1, 1, 1, 1, 1,
0.4761955, 2.692715, -0.6970333, 1, 1, 1, 1, 1,
0.4825958, 0.6283908, -0.6258425, 0, 0, 1, 1, 1,
0.50249, -0.03612687, 1.302745, 1, 0, 0, 1, 1,
0.5053558, 0.1356211, 1.006439, 1, 0, 0, 1, 1,
0.506121, 1.081042, 1.197398, 1, 0, 0, 1, 1,
0.507748, 2.299184, 0.5918899, 1, 0, 0, 1, 1,
0.5080147, -0.6442711, 1.555478, 1, 0, 0, 1, 1,
0.5102963, 1.270933, -0.7430251, 0, 0, 0, 1, 1,
0.5107557, 0.7231714, -0.2328552, 0, 0, 0, 1, 1,
0.5216546, -0.8230817, 4.009941, 0, 0, 0, 1, 1,
0.5232553, 0.6774971, 1.453848, 0, 0, 0, 1, 1,
0.5323765, -0.8186642, 2.541241, 0, 0, 0, 1, 1,
0.5329098, -0.692145, 2.377833, 0, 0, 0, 1, 1,
0.5340574, 0.9415907, 1.004927, 0, 0, 0, 1, 1,
0.5366604, -0.5464249, 2.873416, 1, 1, 1, 1, 1,
0.5407562, -0.4055683, 1.876727, 1, 1, 1, 1, 1,
0.5415534, -1.087544, 2.593521, 1, 1, 1, 1, 1,
0.5432777, -1.218051, 3.385262, 1, 1, 1, 1, 1,
0.5433126, 0.5982633, 0.8241153, 1, 1, 1, 1, 1,
0.5443416, -0.8559005, 2.045629, 1, 1, 1, 1, 1,
0.5469509, -0.5554605, 2.670463, 1, 1, 1, 1, 1,
0.54729, -0.0606099, 1.080565, 1, 1, 1, 1, 1,
0.5517741, -0.79184, 2.444532, 1, 1, 1, 1, 1,
0.5539159, -0.1666326, 2.499436, 1, 1, 1, 1, 1,
0.5581902, -0.2181817, -0.383126, 1, 1, 1, 1, 1,
0.5601386, 0.5514421, 0.9128324, 1, 1, 1, 1, 1,
0.5668759, 0.1368024, 1.153199, 1, 1, 1, 1, 1,
0.5674611, -0.09376512, 4.633969, 1, 1, 1, 1, 1,
0.5686855, 0.5798396, 0.5056287, 1, 1, 1, 1, 1,
0.5688103, 0.4076467, 0.8251145, 0, 0, 1, 1, 1,
0.574324, 1.831226, 0.3809702, 1, 0, 0, 1, 1,
0.5754071, -1.78016, 3.035726, 1, 0, 0, 1, 1,
0.5776716, -2.643361, 3.773183, 1, 0, 0, 1, 1,
0.5805517, 0.3130689, 0.5602438, 1, 0, 0, 1, 1,
0.5817628, -0.3681293, 1.271012, 1, 0, 0, 1, 1,
0.5972853, -0.4092611, 2.121603, 0, 0, 0, 1, 1,
0.5986503, 1.592674, 1.621511, 0, 0, 0, 1, 1,
0.6002991, 0.25186, 1.032835, 0, 0, 0, 1, 1,
0.6016574, -0.7943967, 1.884207, 0, 0, 0, 1, 1,
0.6088651, 0.4989922, 0.4648414, 0, 0, 0, 1, 1,
0.6092537, 0.2775283, 2.177569, 0, 0, 0, 1, 1,
0.609768, -1.592663, 3.904442, 0, 0, 0, 1, 1,
0.6154941, 0.3382358, 0.04432772, 1, 1, 1, 1, 1,
0.619571, 0.3526907, 0.5387272, 1, 1, 1, 1, 1,
0.6202722, -0.4735608, 1.601471, 1, 1, 1, 1, 1,
0.6275803, -0.07630652, 3.292063, 1, 1, 1, 1, 1,
0.6327487, 1.635829, -0.537257, 1, 1, 1, 1, 1,
0.6348171, 1.534059, 0.5425691, 1, 1, 1, 1, 1,
0.6348653, -0.944546, 1.202098, 1, 1, 1, 1, 1,
0.6386099, -1.451075, 2.58376, 1, 1, 1, 1, 1,
0.6413832, -0.2914975, 0.9986718, 1, 1, 1, 1, 1,
0.6427119, -0.7792097, 3.781904, 1, 1, 1, 1, 1,
0.6643919, -0.2587752, 2.914618, 1, 1, 1, 1, 1,
0.6653495, 1.206875, -1.394428, 1, 1, 1, 1, 1,
0.6676787, -0.08397894, 1.912772, 1, 1, 1, 1, 1,
0.6681733, 0.1700334, -0.2111041, 1, 1, 1, 1, 1,
0.6701647, 0.6151817, 0.6497897, 1, 1, 1, 1, 1,
0.672938, -1.654437, 1.20926, 0, 0, 1, 1, 1,
0.6740852, -0.9469386, 2.29275, 1, 0, 0, 1, 1,
0.6793427, -0.9418791, 0.966754, 1, 0, 0, 1, 1,
0.6816738, -0.4929238, 2.251406, 1, 0, 0, 1, 1,
0.6868041, -0.8427789, 0.850657, 1, 0, 0, 1, 1,
0.6872184, 1.063145, 0.191554, 1, 0, 0, 1, 1,
0.6910587, -0.9061586, 2.13377, 0, 0, 0, 1, 1,
0.6921908, 1.053968, -0.4887139, 0, 0, 0, 1, 1,
0.6940902, 0.5641748, 0.7744532, 0, 0, 0, 1, 1,
0.7019843, -0.9538329, 3.067625, 0, 0, 0, 1, 1,
0.7030254, -0.2923706, 2.16375, 0, 0, 0, 1, 1,
0.7136089, 0.9672997, 2.255644, 0, 0, 0, 1, 1,
0.7145368, 1.05904, -1.170135, 0, 0, 0, 1, 1,
0.7147736, -1.456102, 2.464191, 1, 1, 1, 1, 1,
0.7150679, 0.04391396, 1.632477, 1, 1, 1, 1, 1,
0.7158616, 2.008101, 0.05776659, 1, 1, 1, 1, 1,
0.7226629, -0.01664774, 3.386703, 1, 1, 1, 1, 1,
0.7239285, -1.613453, 2.869939, 1, 1, 1, 1, 1,
0.7245214, -0.7951289, 1.442149, 1, 1, 1, 1, 1,
0.7254207, -0.5889422, 0.6943861, 1, 1, 1, 1, 1,
0.7277544, -0.5949742, 3.167027, 1, 1, 1, 1, 1,
0.7281162, 0.9220892, 0.2278625, 1, 1, 1, 1, 1,
0.7283921, 1.366591, 1.135201, 1, 1, 1, 1, 1,
0.7374927, 1.687838, 0.0359473, 1, 1, 1, 1, 1,
0.7382343, 0.2096191, 1.474565, 1, 1, 1, 1, 1,
0.7395821, -1.551045, 5.300758, 1, 1, 1, 1, 1,
0.7408252, -0.9237518, 1.277509, 1, 1, 1, 1, 1,
0.7409487, 0.368481, 0.03114329, 1, 1, 1, 1, 1,
0.7416846, -0.204913, 2.188154, 0, 0, 1, 1, 1,
0.7464583, 0.699481, -0.2008559, 1, 0, 0, 1, 1,
0.7500655, 1.882313, 0.06420944, 1, 0, 0, 1, 1,
0.7503538, 2.650503, 2.208255, 1, 0, 0, 1, 1,
0.7532874, 1.228868, 1.825404, 1, 0, 0, 1, 1,
0.7546415, 0.3056446, 1.895694, 1, 0, 0, 1, 1,
0.7550568, -1.386323, 3.705003, 0, 0, 0, 1, 1,
0.7574711, 1.191489, -0.3769006, 0, 0, 0, 1, 1,
0.7582161, -1.58522, 2.399895, 0, 0, 0, 1, 1,
0.7646166, -0.8000266, 3.557717, 0, 0, 0, 1, 1,
0.7670522, 1.061259, 0.5634041, 0, 0, 0, 1, 1,
0.7673874, -1.093111, -0.07307028, 0, 0, 0, 1, 1,
0.769239, -1.183141, 1.85706, 0, 0, 0, 1, 1,
0.7732527, -0.1508792, 2.438199, 1, 1, 1, 1, 1,
0.7763841, 1.612421, 0.239812, 1, 1, 1, 1, 1,
0.7875133, 0.1398301, 0.7968794, 1, 1, 1, 1, 1,
0.7878561, -0.6608862, 2.59553, 1, 1, 1, 1, 1,
0.7891051, 1.821248, 0.8899679, 1, 1, 1, 1, 1,
0.7899167, -1.947517, 2.177984, 1, 1, 1, 1, 1,
0.7978076, -1.572758, 2.423166, 1, 1, 1, 1, 1,
0.799588, -0.5685578, 1.103116, 1, 1, 1, 1, 1,
0.8000315, 0.2428631, 1.840064, 1, 1, 1, 1, 1,
0.8040981, 1.193076, 0.09171452, 1, 1, 1, 1, 1,
0.8044209, 0.4089756, 2.98521, 1, 1, 1, 1, 1,
0.8063577, -1.211108, 3.373238, 1, 1, 1, 1, 1,
0.808831, -0.7334225, 2.209096, 1, 1, 1, 1, 1,
0.8182272, -0.532069, 0.1276346, 1, 1, 1, 1, 1,
0.8194646, 1.219165, 0.2108277, 1, 1, 1, 1, 1,
0.8229796, -0.3159512, 1.658887, 0, 0, 1, 1, 1,
0.8229964, -0.004815974, 1.358558, 1, 0, 0, 1, 1,
0.8253837, -1.585355, 5.100631, 1, 0, 0, 1, 1,
0.8296393, -0.04891461, 0.4320402, 1, 0, 0, 1, 1,
0.8303871, 0.6786925, 0.5786521, 1, 0, 0, 1, 1,
0.8354915, 0.770766, 0.5706108, 1, 0, 0, 1, 1,
0.8435273, -1.966651, 2.497182, 0, 0, 0, 1, 1,
0.8471689, -0.6091803, 1.623094, 0, 0, 0, 1, 1,
0.8483278, -2.081757, 2.926969, 0, 0, 0, 1, 1,
0.8486517, -2.725505, 2.070396, 0, 0, 0, 1, 1,
0.8576028, 0.6379064, 0.3236751, 0, 0, 0, 1, 1,
0.8617906, 0.1955663, 1.220768, 0, 0, 0, 1, 1,
0.8620545, 0.4332922, -0.2399156, 0, 0, 0, 1, 1,
0.8695212, 0.1495872, 1.343587, 1, 1, 1, 1, 1,
0.869656, 0.7445652, 0.569277, 1, 1, 1, 1, 1,
0.8707924, 0.4637046, 0.6960854, 1, 1, 1, 1, 1,
0.8714985, -0.06055497, 1.90973, 1, 1, 1, 1, 1,
0.8726716, 0.1239805, 1.54844, 1, 1, 1, 1, 1,
0.8760391, -0.694324, 1.605141, 1, 1, 1, 1, 1,
0.888948, 0.1081356, 1.424744, 1, 1, 1, 1, 1,
0.8994486, -0.6152882, 2.711293, 1, 1, 1, 1, 1,
0.9015272, -1.080564, -0.006108615, 1, 1, 1, 1, 1,
0.9063106, 0.421995, -0.1511203, 1, 1, 1, 1, 1,
0.9089042, -0.1221668, 1.105124, 1, 1, 1, 1, 1,
0.9107625, -0.2270009, 3.484309, 1, 1, 1, 1, 1,
0.9199566, 1.717831, 0.7874514, 1, 1, 1, 1, 1,
0.9202394, 0.5855129, -0.4656762, 1, 1, 1, 1, 1,
0.921095, -0.7495706, 0.6154178, 1, 1, 1, 1, 1,
0.9259521, -0.04058488, 1.571009, 0, 0, 1, 1, 1,
0.9260111, -0.54393, 1.730222, 1, 0, 0, 1, 1,
0.9296749, 0.1787262, 3.682483, 1, 0, 0, 1, 1,
0.929871, 0.9009079, 0.7112553, 1, 0, 0, 1, 1,
0.9390067, 1.54729, -0.1240163, 1, 0, 0, 1, 1,
0.9393005, -1.077724, 0.5314784, 1, 0, 0, 1, 1,
0.9403222, 0.978213, -0.1912026, 0, 0, 0, 1, 1,
0.9405125, 1.090223, 0.7139347, 0, 0, 0, 1, 1,
0.9417547, -1.777087, 0.218861, 0, 0, 0, 1, 1,
0.9443415, 0.6915838, 1.89518, 0, 0, 0, 1, 1,
0.9528055, -0.1189833, 0.9520791, 0, 0, 0, 1, 1,
0.9529338, 0.3353472, 0.3587879, 0, 0, 0, 1, 1,
0.953578, 1.012148, 2.993118, 0, 0, 0, 1, 1,
0.957283, 1.313149, -0.775789, 1, 1, 1, 1, 1,
0.9610776, -1.176758, 1.234413, 1, 1, 1, 1, 1,
0.9619623, 2.265953, 0.8889645, 1, 1, 1, 1, 1,
0.9623187, 0.2667862, -0.145534, 1, 1, 1, 1, 1,
0.9676622, 3.045326, -0.109027, 1, 1, 1, 1, 1,
0.9785426, -0.3549611, 1.939719, 1, 1, 1, 1, 1,
0.9839365, 0.698557, 0.8795254, 1, 1, 1, 1, 1,
0.9851173, 0.4783188, 1.098249, 1, 1, 1, 1, 1,
1.007373, -1.791278, 2.466231, 1, 1, 1, 1, 1,
1.013549, -0.4092677, 1.020918, 1, 1, 1, 1, 1,
1.016673, 1.992292, 2.148919, 1, 1, 1, 1, 1,
1.017693, 0.4959809, 0.9524366, 1, 1, 1, 1, 1,
1.018566, 0.4135397, 1.720466, 1, 1, 1, 1, 1,
1.024853, -1.195154, 2.299486, 1, 1, 1, 1, 1,
1.025027, -1.364018, 4.29819, 1, 1, 1, 1, 1,
1.033481, -0.5994118, 2.002344, 0, 0, 1, 1, 1,
1.033605, -0.3851253, 3.433059, 1, 0, 0, 1, 1,
1.034056, -2.182732, 4.743487, 1, 0, 0, 1, 1,
1.035781, -0.9467241, 3.053626, 1, 0, 0, 1, 1,
1.037638, 0.8652549, -0.7212096, 1, 0, 0, 1, 1,
1.052385, 0.8831225, 2.713286, 1, 0, 0, 1, 1,
1.056111, -0.07098434, 2.315411, 0, 0, 0, 1, 1,
1.058269, 0.1414204, 0.8779694, 0, 0, 0, 1, 1,
1.059408, 1.227988, 1.64844, 0, 0, 0, 1, 1,
1.059606, -1.725384, 4.786691, 0, 0, 0, 1, 1,
1.066014, 0.9622401, 0.1059241, 0, 0, 0, 1, 1,
1.066478, 0.7827704, 3.158604, 0, 0, 0, 1, 1,
1.069251, -0.3755383, 1.115592, 0, 0, 0, 1, 1,
1.070731, -0.1749335, -0.1815348, 1, 1, 1, 1, 1,
1.071366, 2.216102, -0.7203269, 1, 1, 1, 1, 1,
1.071561, 1.262321, 2.632922, 1, 1, 1, 1, 1,
1.072835, -2.062722, 2.785357, 1, 1, 1, 1, 1,
1.074567, -0.4449561, 1.096515, 1, 1, 1, 1, 1,
1.074769, -0.2868512, 1.539817, 1, 1, 1, 1, 1,
1.076596, 0.184348, 2.627798, 1, 1, 1, 1, 1,
1.080605, -1.189424, 2.325723, 1, 1, 1, 1, 1,
1.080674, 0.06382249, 1.759926, 1, 1, 1, 1, 1,
1.08377, 0.9423949, -1.576527, 1, 1, 1, 1, 1,
1.085626, 1.127374, 1.425682, 1, 1, 1, 1, 1,
1.086212, 1.256841, 1.889225, 1, 1, 1, 1, 1,
1.089258, 0.7474496, 0.8861376, 1, 1, 1, 1, 1,
1.092343, 1.124723, 0.1629607, 1, 1, 1, 1, 1,
1.096192, 1.350542, 0.7013476, 1, 1, 1, 1, 1,
1.100047, 0.4413361, -0.3575636, 0, 0, 1, 1, 1,
1.101095, -1.47127, 2.518379, 1, 0, 0, 1, 1,
1.103104, 0.4425957, 2.711175, 1, 0, 0, 1, 1,
1.109385, 1.346006, 0.786558, 1, 0, 0, 1, 1,
1.109611, 1.29417, 0.4519072, 1, 0, 0, 1, 1,
1.119989, 0.3582554, 1.728509, 1, 0, 0, 1, 1,
1.134143, -0.2221627, 2.878112, 0, 0, 0, 1, 1,
1.139137, 1.618065, 0.4467621, 0, 0, 0, 1, 1,
1.139756, 1.029374, 0.2701798, 0, 0, 0, 1, 1,
1.145548, -0.04356173, 1.336566, 0, 0, 0, 1, 1,
1.148519, 1.521355, -0.8628297, 0, 0, 0, 1, 1,
1.153239, -0.3389182, 2.156655, 0, 0, 0, 1, 1,
1.155186, -0.5737325, 2.183167, 0, 0, 0, 1, 1,
1.160909, 0.8063827, 1.209631, 1, 1, 1, 1, 1,
1.166425, 0.930211, 0.7877735, 1, 1, 1, 1, 1,
1.172505, 0.3940584, 2.632106, 1, 1, 1, 1, 1,
1.172806, -0.7289096, 1.862878, 1, 1, 1, 1, 1,
1.177077, 2.065968, 0.5082858, 1, 1, 1, 1, 1,
1.187829, -2.044977, 3.529335, 1, 1, 1, 1, 1,
1.190321, -0.6990535, 1.407226, 1, 1, 1, 1, 1,
1.191251, -0.0316177, 1.150865, 1, 1, 1, 1, 1,
1.191534, 0.7987647, 1.103086, 1, 1, 1, 1, 1,
1.201444, -0.9734438, 0.4437051, 1, 1, 1, 1, 1,
1.2072, 0.1276484, 0.09595078, 1, 1, 1, 1, 1,
1.210596, -1.751011, 3.171619, 1, 1, 1, 1, 1,
1.211353, 0.4011542, 1.091978, 1, 1, 1, 1, 1,
1.216349, -0.6158175, 1.746452, 1, 1, 1, 1, 1,
1.217561, 0.02640997, 0.3775838, 1, 1, 1, 1, 1,
1.218892, -1.417131, 2.961344, 0, 0, 1, 1, 1,
1.222531, 0.5991609, 0.5174804, 1, 0, 0, 1, 1,
1.223647, 1.592312, 1.254869, 1, 0, 0, 1, 1,
1.234395, 0.7663679, 0.6113283, 1, 0, 0, 1, 1,
1.234578, 1.662982, 2.030905, 1, 0, 0, 1, 1,
1.239885, 0.2270708, 1.009728, 1, 0, 0, 1, 1,
1.242856, 0.0881873, 0.00705808, 0, 0, 0, 1, 1,
1.249329, 0.1333845, -0.1121631, 0, 0, 0, 1, 1,
1.250019, 1.003254, 0.4942528, 0, 0, 0, 1, 1,
1.251397, 0.3074228, 2.53723, 0, 0, 0, 1, 1,
1.256638, -0.1499371, 1.404851, 0, 0, 0, 1, 1,
1.266982, 0.4861232, 2.83337, 0, 0, 0, 1, 1,
1.271744, -0.006069323, 2.324702, 0, 0, 0, 1, 1,
1.277572, 1.334507, 1.833206, 1, 1, 1, 1, 1,
1.281191, -0.6030372, 1.448524, 1, 1, 1, 1, 1,
1.284268, -0.3784615, 1.596712, 1, 1, 1, 1, 1,
1.295832, -0.6043911, 1.164499, 1, 1, 1, 1, 1,
1.307002, -1.144413, 2.165197, 1, 1, 1, 1, 1,
1.307261, -0.06658524, 2.473971, 1, 1, 1, 1, 1,
1.310471, 0.7138377, 1.610678, 1, 1, 1, 1, 1,
1.314396, 0.7878479, 2.501336, 1, 1, 1, 1, 1,
1.329923, -1.699297, 1.058072, 1, 1, 1, 1, 1,
1.338928, -1.053735, 1.699073, 1, 1, 1, 1, 1,
1.345694, -0.6885163, 3.559117, 1, 1, 1, 1, 1,
1.349571, 1.023086, 1.475176, 1, 1, 1, 1, 1,
1.352793, 0.4269587, 2.194764, 1, 1, 1, 1, 1,
1.355638, -0.4997081, 3.667629, 1, 1, 1, 1, 1,
1.364174, -0.6820643, 3.717175, 1, 1, 1, 1, 1,
1.370679, -1.58321, 3.10866, 0, 0, 1, 1, 1,
1.375165, 0.7532141, -0.5742897, 1, 0, 0, 1, 1,
1.375554, 0.1356348, 2.479326, 1, 0, 0, 1, 1,
1.395517, 2.603952, 1.109736, 1, 0, 0, 1, 1,
1.397128, 0.8963837, 1.462113, 1, 0, 0, 1, 1,
1.399877, -0.3286661, 2.470596, 1, 0, 0, 1, 1,
1.40052, -1.081603, 4.479408, 0, 0, 0, 1, 1,
1.411336, 0.1859434, 0.9536141, 0, 0, 0, 1, 1,
1.428845, -0.2559753, 2.554887, 0, 0, 0, 1, 1,
1.431701, 0.782523, 1.522037, 0, 0, 0, 1, 1,
1.440219, 0.4723644, 2.289263, 0, 0, 0, 1, 1,
1.441278, 0.8067858, -0.8313316, 0, 0, 0, 1, 1,
1.447118, 1.402252, 1.531131, 0, 0, 0, 1, 1,
1.459025, 1.09357, 2.350342, 1, 1, 1, 1, 1,
1.495042, 0.805158, 2.465007, 1, 1, 1, 1, 1,
1.49576, 0.162451, 1.319101, 1, 1, 1, 1, 1,
1.506088, -0.9534204, 1.252588, 1, 1, 1, 1, 1,
1.524518, -1.293024, 2.777735, 1, 1, 1, 1, 1,
1.526168, -0.03189338, 1.894869, 1, 1, 1, 1, 1,
1.542897, 1.512416, 1.689721, 1, 1, 1, 1, 1,
1.545306, -0.05329963, 2.280186, 1, 1, 1, 1, 1,
1.554811, -1.041424, 3.092723, 1, 1, 1, 1, 1,
1.562533, 0.8159689, 0.4881791, 1, 1, 1, 1, 1,
1.56659, 1.54414, 0.6009567, 1, 1, 1, 1, 1,
1.58593, 0.5287856, 1.273844, 1, 1, 1, 1, 1,
1.587166, -0.4046861, 1.434645, 1, 1, 1, 1, 1,
1.600899, 0.9834214, 1.117472, 1, 1, 1, 1, 1,
1.61159, 0.01482488, 1.529304, 1, 1, 1, 1, 1,
1.627471, -1.780154, 1.976436, 0, 0, 1, 1, 1,
1.668179, 0.4576792, 0.3009103, 1, 0, 0, 1, 1,
1.683985, -0.537079, 1.81592, 1, 0, 0, 1, 1,
1.692383, 0.2205179, 0.6833207, 1, 0, 0, 1, 1,
1.693397, -1.244402, 2.336536, 1, 0, 0, 1, 1,
1.694072, 0.8139281, 0.5359429, 1, 0, 0, 1, 1,
1.695592, -3.375131, 1.869858, 0, 0, 0, 1, 1,
1.699389, 1.146286, 2.179296, 0, 0, 0, 1, 1,
1.699536, -0.2110733, 2.47154, 0, 0, 0, 1, 1,
1.734629, 2.274454, 1.229563, 0, 0, 0, 1, 1,
1.751614, 0.1747992, 0.8983048, 0, 0, 0, 1, 1,
1.780621, 0.7077407, 3.832701, 0, 0, 0, 1, 1,
1.790609, 0.4103155, 0.1587124, 0, 0, 0, 1, 1,
1.803424, 0.7164618, 1.659501, 1, 1, 1, 1, 1,
1.81946, -0.04861259, 1.311395, 1, 1, 1, 1, 1,
1.836581, 0.5030347, 0.8630063, 1, 1, 1, 1, 1,
1.837942, 0.8292585, 1.954674, 1, 1, 1, 1, 1,
1.8455, -0.3006999, -0.01486808, 1, 1, 1, 1, 1,
1.852032, 0.4265605, 0.1083716, 1, 1, 1, 1, 1,
1.864893, 0.3048803, 2.649275, 1, 1, 1, 1, 1,
1.889374, -1.48416, 2.666429, 1, 1, 1, 1, 1,
1.889618, -0.9580186, 0.3298706, 1, 1, 1, 1, 1,
1.896987, 1.02393, -0.4826249, 1, 1, 1, 1, 1,
1.899737, -1.333198, 0.7514583, 1, 1, 1, 1, 1,
1.906309, -1.345145, 2.710477, 1, 1, 1, 1, 1,
1.983198, 0.02717963, 0.721469, 1, 1, 1, 1, 1,
2.001265, 0.3319475, 1.483223, 1, 1, 1, 1, 1,
2.044525, 0.2971229, 1.257517, 1, 1, 1, 1, 1,
2.044764, -2.498756, 1.632049, 0, 0, 1, 1, 1,
2.048153, -1.639195, 2.466347, 1, 0, 0, 1, 1,
2.05822, 1.389951, 2.340663, 1, 0, 0, 1, 1,
2.075256, -2.332445, 2.45038, 1, 0, 0, 1, 1,
2.110008, -0.3940064, 2.230042, 1, 0, 0, 1, 1,
2.110189, -0.5418639, 0.9949703, 1, 0, 0, 1, 1,
2.176857, -1.251141, 3.355074, 0, 0, 0, 1, 1,
2.323499, 1.218637, -1.047669, 0, 0, 0, 1, 1,
2.369365, 0.6139485, 1.339507, 0, 0, 0, 1, 1,
2.436409, 0.9662017, 2.681906, 0, 0, 0, 1, 1,
2.478015, -0.296172, 2.841888, 0, 0, 0, 1, 1,
2.573693, 1.189109, 1.237915, 0, 0, 0, 1, 1,
2.629498, 0.8671376, 1.678093, 0, 0, 0, 1, 1,
2.758224, 0.4552881, 2.431919, 1, 1, 1, 1, 1,
2.861609, 0.4172665, 2.78609, 1, 1, 1, 1, 1,
2.886049, -0.06144158, 2.773496, 1, 1, 1, 1, 1,
3.061032, 0.2292693, 0.7645522, 1, 1, 1, 1, 1,
3.082568, -0.7088426, 1.980033, 1, 1, 1, 1, 1,
3.127218, -1.080314, 0.505512, 1, 1, 1, 1, 1,
3.734424, -0.6916099, 0.8757414, 1, 1, 1, 1, 1
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
var radius = 9.604945;
var distance = 33.73696;
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
mvMatrix.translate( -0.3994091, -0.0353446, -0.1364162 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73696);
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
