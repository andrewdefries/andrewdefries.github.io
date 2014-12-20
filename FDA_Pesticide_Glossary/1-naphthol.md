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
-3.427082, -0.4150771, -0.170764, 1, 0, 0, 1,
-2.706121, 0.3395805, -0.6598058, 1, 0.007843138, 0, 1,
-2.682621, 1.014981, -0.7555081, 1, 0.01176471, 0, 1,
-2.574579, 1.333073, 1.454267, 1, 0.01960784, 0, 1,
-2.506673, -1.115617, 0.3526767, 1, 0.02352941, 0, 1,
-2.388864, 0.2672692, -0.5585792, 1, 0.03137255, 0, 1,
-2.318267, 0.4752653, -1.214217, 1, 0.03529412, 0, 1,
-2.299717, -1.329407, -1.160479, 1, 0.04313726, 0, 1,
-2.298958, -0.2489527, -0.3484794, 1, 0.04705882, 0, 1,
-2.298867, 1.301588, -0.06240058, 1, 0.05490196, 0, 1,
-2.257324, 1.513915, -0.4118556, 1, 0.05882353, 0, 1,
-2.245006, -1.267369, -3.673338, 1, 0.06666667, 0, 1,
-2.241461, 0.5217763, -0.4103844, 1, 0.07058824, 0, 1,
-2.208815, 1.017874, 0.1196475, 1, 0.07843138, 0, 1,
-2.19998, 1.670952, 0.5014875, 1, 0.08235294, 0, 1,
-2.187237, 1.478781, -0.3035103, 1, 0.09019608, 0, 1,
-2.180194, 1.210264, -1.462081, 1, 0.09411765, 0, 1,
-2.144515, 0.7440057, -0.9288664, 1, 0.1019608, 0, 1,
-2.134767, -2.840047, -2.368613, 1, 0.1098039, 0, 1,
-2.132229, -0.418831, -3.041841, 1, 0.1137255, 0, 1,
-2.124458, -0.838758, -1.492605, 1, 0.1215686, 0, 1,
-2.094099, -0.536411, -1.518274, 1, 0.1254902, 0, 1,
-2.081786, 1.856121, -0.6124851, 1, 0.1333333, 0, 1,
-2.065926, -1.16788, -0.7159027, 1, 0.1372549, 0, 1,
-1.996459, 0.7514752, -1.874543, 1, 0.145098, 0, 1,
-1.954229, 1.101818, -0.2916045, 1, 0.1490196, 0, 1,
-1.935777, 2.18378, -1.20363, 1, 0.1568628, 0, 1,
-1.93223, -0.5732377, -2.102592, 1, 0.1607843, 0, 1,
-1.915271, 1.483516, -1.584439, 1, 0.1686275, 0, 1,
-1.866158, 0.435867, -0.9708022, 1, 0.172549, 0, 1,
-1.850049, -0.9562547, -1.623071, 1, 0.1803922, 0, 1,
-1.844091, 1.196013, -0.5789108, 1, 0.1843137, 0, 1,
-1.83601, -0.1938254, -1.637855, 1, 0.1921569, 0, 1,
-1.827128, -0.2560669, -1.736866, 1, 0.1960784, 0, 1,
-1.810401, -0.2913338, -3.130513, 1, 0.2039216, 0, 1,
-1.804944, 0.6680942, -0.5053231, 1, 0.2117647, 0, 1,
-1.800377, -0.9360454, -1.159773, 1, 0.2156863, 0, 1,
-1.781168, -0.9309613, -1.430308, 1, 0.2235294, 0, 1,
-1.775598, -0.5924099, -2.194406, 1, 0.227451, 0, 1,
-1.769293, 1.871475, -2.064931, 1, 0.2352941, 0, 1,
-1.762047, 1.240151, -0.8434817, 1, 0.2392157, 0, 1,
-1.756558, -0.6447883, -1.618723, 1, 0.2470588, 0, 1,
-1.751719, 1.421389, -1.11034, 1, 0.2509804, 0, 1,
-1.735919, 0.7167993, -1.735086, 1, 0.2588235, 0, 1,
-1.707157, -1.033551, -1.631935, 1, 0.2627451, 0, 1,
-1.697676, -0.1771655, -1.19377, 1, 0.2705882, 0, 1,
-1.682786, -0.7804723, -2.699968, 1, 0.2745098, 0, 1,
-1.673186, -1.183982, -1.639983, 1, 0.282353, 0, 1,
-1.65419, 0.5162234, -0.994839, 1, 0.2862745, 0, 1,
-1.648183, -1.019775, -0.9943691, 1, 0.2941177, 0, 1,
-1.635227, -0.8537675, -2.405042, 1, 0.3019608, 0, 1,
-1.586734, -0.1088439, -1.925879, 1, 0.3058824, 0, 1,
-1.577511, -1.024617, -1.245642, 1, 0.3137255, 0, 1,
-1.570062, 1.174627, -0.7330992, 1, 0.3176471, 0, 1,
-1.562753, 0.8422583, -1.758525, 1, 0.3254902, 0, 1,
-1.562447, -1.26215, -3.240813, 1, 0.3294118, 0, 1,
-1.556998, 0.620969, -0.1137661, 1, 0.3372549, 0, 1,
-1.542117, 0.1460693, -0.8352327, 1, 0.3411765, 0, 1,
-1.541836, 0.6944631, -1.677127, 1, 0.3490196, 0, 1,
-1.537205, -0.5086074, -1.203166, 1, 0.3529412, 0, 1,
-1.527737, -1.233235, -2.741246, 1, 0.3607843, 0, 1,
-1.525724, -0.1320802, -3.185142, 1, 0.3647059, 0, 1,
-1.51289, 1.687028, -0.09098906, 1, 0.372549, 0, 1,
-1.511233, -0.3847795, -2.769493, 1, 0.3764706, 0, 1,
-1.509084, 0.1415154, -1.719454, 1, 0.3843137, 0, 1,
-1.50092, 0.7176527, -2.363833, 1, 0.3882353, 0, 1,
-1.486388, 0.01075283, -2.483017, 1, 0.3960784, 0, 1,
-1.482904, -0.7746525, -3.201497, 1, 0.4039216, 0, 1,
-1.477447, 0.7451802, -1.728541, 1, 0.4078431, 0, 1,
-1.475712, 0.05029047, -2.249322, 1, 0.4156863, 0, 1,
-1.471249, -0.3804865, -0.8791931, 1, 0.4196078, 0, 1,
-1.468057, 0.7882528, -2.474156, 1, 0.427451, 0, 1,
-1.454971, -1.315264, -2.821541, 1, 0.4313726, 0, 1,
-1.445439, 0.1046915, -2.296222, 1, 0.4392157, 0, 1,
-1.441913, -0.1064181, -1.689161, 1, 0.4431373, 0, 1,
-1.43916, 0.2819084, -1.81202, 1, 0.4509804, 0, 1,
-1.434436, -0.5688937, -1.194981, 1, 0.454902, 0, 1,
-1.422612, -1.171211, -2.257312, 1, 0.4627451, 0, 1,
-1.400494, 0.506579, -1.546941, 1, 0.4666667, 0, 1,
-1.400089, -0.07464015, -2.671816, 1, 0.4745098, 0, 1,
-1.385345, 2.34515, -0.5802412, 1, 0.4784314, 0, 1,
-1.383836, -0.01217121, -2.828772, 1, 0.4862745, 0, 1,
-1.368483, -1.565031, -2.233743, 1, 0.4901961, 0, 1,
-1.365087, 1.772957, 0.3412325, 1, 0.4980392, 0, 1,
-1.361517, 1.292853, -0.5728169, 1, 0.5058824, 0, 1,
-1.360613, -1.498709, -2.347202, 1, 0.509804, 0, 1,
-1.356463, -0.3251851, -0.2722054, 1, 0.5176471, 0, 1,
-1.355586, -0.8794243, -1.020588, 1, 0.5215687, 0, 1,
-1.35279, -0.9263788, -2.626039, 1, 0.5294118, 0, 1,
-1.351458, 0.1241447, -1.819609, 1, 0.5333334, 0, 1,
-1.349708, -0.4236881, -1.542865, 1, 0.5411765, 0, 1,
-1.338304, 0.0005339009, -0.612049, 1, 0.5450981, 0, 1,
-1.331682, 0.5098398, -1.066827, 1, 0.5529412, 0, 1,
-1.325296, -0.4049592, -1.64096, 1, 0.5568628, 0, 1,
-1.323229, 1.071087, -0.5259334, 1, 0.5647059, 0, 1,
-1.309606, -1.213492, -3.003852, 1, 0.5686275, 0, 1,
-1.302915, 0.7723212, -0.4909348, 1, 0.5764706, 0, 1,
-1.294057, 0.9420891, -0.9748359, 1, 0.5803922, 0, 1,
-1.288396, 0.4564877, -0.04805691, 1, 0.5882353, 0, 1,
-1.277158, 0.5264567, -0.7391642, 1, 0.5921569, 0, 1,
-1.276731, -0.2385662, -1.062344, 1, 0.6, 0, 1,
-1.272272, 0.7522092, -0.5413699, 1, 0.6078432, 0, 1,
-1.264747, -0.8536049, -3.183914, 1, 0.6117647, 0, 1,
-1.257026, -0.9118672, -2.571877, 1, 0.6196079, 0, 1,
-1.253204, -1.294029, -2.328354, 1, 0.6235294, 0, 1,
-1.245823, 1.196817, 0.3213076, 1, 0.6313726, 0, 1,
-1.244626, -1.180488, -2.360727, 1, 0.6352941, 0, 1,
-1.234454, -0.460041, -2.866316, 1, 0.6431373, 0, 1,
-1.232528, 1.420017, -1.71203, 1, 0.6470588, 0, 1,
-1.22253, -0.09445148, -2.028218, 1, 0.654902, 0, 1,
-1.219842, 1.516271, -1.617595, 1, 0.6588235, 0, 1,
-1.218491, -0.3034263, -2.32972, 1, 0.6666667, 0, 1,
-1.218217, -1.162202, -3.305911, 1, 0.6705883, 0, 1,
-1.217175, -0.7704709, -1.980726, 1, 0.6784314, 0, 1,
-1.204244, -0.3436037, -2.360403, 1, 0.682353, 0, 1,
-1.195565, -0.1156235, -3.141264, 1, 0.6901961, 0, 1,
-1.193748, 0.8931057, -0.1602604, 1, 0.6941177, 0, 1,
-1.191149, 1.088129, -0.4617774, 1, 0.7019608, 0, 1,
-1.190262, -0.4657743, -1.746332, 1, 0.7098039, 0, 1,
-1.185749, -1.10519, -2.606238, 1, 0.7137255, 0, 1,
-1.184878, 1.529235, -1.472219, 1, 0.7215686, 0, 1,
-1.182486, -1.076819, -1.961912, 1, 0.7254902, 0, 1,
-1.176187, 1.428063, -0.7423571, 1, 0.7333333, 0, 1,
-1.1563, 0.4552059, -1.432259, 1, 0.7372549, 0, 1,
-1.139914, 0.6868223, -0.4890655, 1, 0.7450981, 0, 1,
-1.139847, 1.227341, -2.187127, 1, 0.7490196, 0, 1,
-1.138951, 1.028676, -1.652825, 1, 0.7568628, 0, 1,
-1.137179, 1.582597, -0.2512501, 1, 0.7607843, 0, 1,
-1.13612, 1.739042, -2.759167, 1, 0.7686275, 0, 1,
-1.127794, -0.6972973, -2.533143, 1, 0.772549, 0, 1,
-1.117594, 0.4677342, -2.17228, 1, 0.7803922, 0, 1,
-1.114059, 0.8845281, 0.2282999, 1, 0.7843137, 0, 1,
-1.11262, 0.3915465, -0.05894189, 1, 0.7921569, 0, 1,
-1.110172, -0.6362108, -1.292642, 1, 0.7960784, 0, 1,
-1.101619, 1.530309, 0.2793437, 1, 0.8039216, 0, 1,
-1.097795, 0.3373238, -2.870981, 1, 0.8117647, 0, 1,
-1.095649, -0.7044795, -4.147977, 1, 0.8156863, 0, 1,
-1.094573, -1.577472, -3.650064, 1, 0.8235294, 0, 1,
-1.09409, -0.1010896, -1.483221, 1, 0.827451, 0, 1,
-1.089819, -1.081664, -2.587191, 1, 0.8352941, 0, 1,
-1.083494, 0.9416535, 0.08853067, 1, 0.8392157, 0, 1,
-1.077008, -0.066373, -2.704533, 1, 0.8470588, 0, 1,
-1.073494, 0.02310145, -2.373875, 1, 0.8509804, 0, 1,
-1.07257, 2.384816, -1.672127, 1, 0.8588235, 0, 1,
-1.07222, 1.212096, -1.811546, 1, 0.8627451, 0, 1,
-1.057389, -0.3113106, -1.974899, 1, 0.8705882, 0, 1,
-1.044153, 1.641276, -0.9138548, 1, 0.8745098, 0, 1,
-1.036715, -0.01893011, 0.4174718, 1, 0.8823529, 0, 1,
-1.034477, -0.3301579, -3.51518, 1, 0.8862745, 0, 1,
-1.024617, 0.03908096, -1.245259, 1, 0.8941177, 0, 1,
-1.018281, -1.042962, -2.157367, 1, 0.8980392, 0, 1,
-1.017838, 0.4580503, -1.100309, 1, 0.9058824, 0, 1,
-1.001212, -0.6763315, -2.131247, 1, 0.9137255, 0, 1,
-0.9997072, 0.4164723, -0.133664, 1, 0.9176471, 0, 1,
-0.9928315, -1.032125, -1.745994, 1, 0.9254902, 0, 1,
-0.9855728, 0.3447329, -0.1307806, 1, 0.9294118, 0, 1,
-0.9849672, -0.3062243, -2.000864, 1, 0.9372549, 0, 1,
-0.9840389, 1.788393, -0.1833158, 1, 0.9411765, 0, 1,
-0.9822953, -0.271289, -3.084858, 1, 0.9490196, 0, 1,
-0.9795187, 1.47124, 0.01477144, 1, 0.9529412, 0, 1,
-0.9737466, -0.03535789, -3.372792, 1, 0.9607843, 0, 1,
-0.9722777, 0.3245659, -1.983738, 1, 0.9647059, 0, 1,
-0.9668715, 0.2159466, -0.8664802, 1, 0.972549, 0, 1,
-0.9657809, 0.7295782, -2.82513, 1, 0.9764706, 0, 1,
-0.9634839, -1.198408, -0.9724872, 1, 0.9843137, 0, 1,
-0.9629298, -0.911718, -3.56768, 1, 0.9882353, 0, 1,
-0.9578973, -0.3455788, -0.6901781, 1, 0.9960784, 0, 1,
-0.9552494, 1.003427, -0.686443, 0.9960784, 1, 0, 1,
-0.9535386, -0.5729815, -2.233472, 0.9921569, 1, 0, 1,
-0.9530518, 0.5172778, -1.563106, 0.9843137, 1, 0, 1,
-0.9526014, 2.05337, -0.1316225, 0.9803922, 1, 0, 1,
-0.9501171, -0.3198502, -1.066097, 0.972549, 1, 0, 1,
-0.9441211, 0.1856919, -0.3365144, 0.9686275, 1, 0, 1,
-0.9410885, 0.5998167, 0.6258666, 0.9607843, 1, 0, 1,
-0.9395879, -1.106255, -3.826041, 0.9568627, 1, 0, 1,
-0.9368554, -0.2371337, -1.191002, 0.9490196, 1, 0, 1,
-0.9367546, -0.239522, -1.434264, 0.945098, 1, 0, 1,
-0.926213, 0.7089161, -3.110287, 0.9372549, 1, 0, 1,
-0.9181542, -0.3120998, -1.610963, 0.9333333, 1, 0, 1,
-0.9174267, -0.3813846, -2.429971, 0.9254902, 1, 0, 1,
-0.9159712, -0.06771122, -1.360459, 0.9215686, 1, 0, 1,
-0.9158117, -0.4655563, -0.9933861, 0.9137255, 1, 0, 1,
-0.9152265, -0.3548944, -2.540177, 0.9098039, 1, 0, 1,
-0.9129053, 0.5138785, 0.1944948, 0.9019608, 1, 0, 1,
-0.912748, -0.705633, -0.4163329, 0.8941177, 1, 0, 1,
-0.9099835, 1.65948, -1.325744, 0.8901961, 1, 0, 1,
-0.9080846, -1.190655, -3.62898, 0.8823529, 1, 0, 1,
-0.9004164, -1.578619, -4.164728, 0.8784314, 1, 0, 1,
-0.899214, 1.778428, -1.02018, 0.8705882, 1, 0, 1,
-0.8837004, 1.349781, -0.5871015, 0.8666667, 1, 0, 1,
-0.8833221, 0.2848417, -1.17778, 0.8588235, 1, 0, 1,
-0.8771998, 0.2949572, -2.629102, 0.854902, 1, 0, 1,
-0.8770967, 0.4255517, -1.565781, 0.8470588, 1, 0, 1,
-0.8758158, 0.185188, -1.170416, 0.8431373, 1, 0, 1,
-0.8740356, 1.44025, -0.2626589, 0.8352941, 1, 0, 1,
-0.8730229, 0.03264612, -0.4294091, 0.8313726, 1, 0, 1,
-0.867502, -0.4578801, -1.828828, 0.8235294, 1, 0, 1,
-0.8650171, -0.1643189, 0.4456903, 0.8196079, 1, 0, 1,
-0.8628008, -0.2215565, -1.198931, 0.8117647, 1, 0, 1,
-0.8606293, 0.1974241, -1.315031, 0.8078431, 1, 0, 1,
-0.8536724, -1.845948, -1.812988, 0.8, 1, 0, 1,
-0.8531479, 0.2330971, -2.769931, 0.7921569, 1, 0, 1,
-0.8457035, 1.429927, 0.7045286, 0.7882353, 1, 0, 1,
-0.8446754, -1.628692, -3.361775, 0.7803922, 1, 0, 1,
-0.8410815, 0.8320716, 0.5811742, 0.7764706, 1, 0, 1,
-0.8407813, -0.6898074, -2.705964, 0.7686275, 1, 0, 1,
-0.8389354, -0.3900153, -2.375731, 0.7647059, 1, 0, 1,
-0.838551, -2.326859, -3.931209, 0.7568628, 1, 0, 1,
-0.837709, -0.4712295, -3.01335, 0.7529412, 1, 0, 1,
-0.8333515, 0.5759921, 0.7339668, 0.7450981, 1, 0, 1,
-0.8317355, -0.2001511, -1.771181, 0.7411765, 1, 0, 1,
-0.8195783, -0.3614011, -1.137362, 0.7333333, 1, 0, 1,
-0.8195115, 1.157514, -1.519935, 0.7294118, 1, 0, 1,
-0.8180403, -1.978978, -2.487167, 0.7215686, 1, 0, 1,
-0.812887, 0.09062795, -0.3319335, 0.7176471, 1, 0, 1,
-0.8117814, -1.975715, -3.084774, 0.7098039, 1, 0, 1,
-0.804332, -1.171162, -4.425132, 0.7058824, 1, 0, 1,
-0.7975345, 0.6332191, -2.26941, 0.6980392, 1, 0, 1,
-0.7885998, 1.167472, -1.221926, 0.6901961, 1, 0, 1,
-0.7864008, 0.8612351, -1.940308, 0.6862745, 1, 0, 1,
-0.7831371, 0.3729978, -1.815153, 0.6784314, 1, 0, 1,
-0.7801162, -1.662586, -5.201634, 0.6745098, 1, 0, 1,
-0.7799955, 0.9542369, -1.51422, 0.6666667, 1, 0, 1,
-0.7782095, 0.4164649, 0.424453, 0.6627451, 1, 0, 1,
-0.7764987, 0.1420137, -1.273226, 0.654902, 1, 0, 1,
-0.7737525, 0.3438552, 0.8325194, 0.6509804, 1, 0, 1,
-0.769616, 0.2194116, -1.882049, 0.6431373, 1, 0, 1,
-0.7688811, 2.245037, -1.1334, 0.6392157, 1, 0, 1,
-0.7676744, 0.6622609, -2.566121, 0.6313726, 1, 0, 1,
-0.7663654, 0.004772151, -2.172563, 0.627451, 1, 0, 1,
-0.7592863, -0.7337649, -2.955166, 0.6196079, 1, 0, 1,
-0.7588947, 2.108057, 0.1148174, 0.6156863, 1, 0, 1,
-0.7566851, -1.16388, -3.395926, 0.6078432, 1, 0, 1,
-0.7554954, -1.656206, -1.711107, 0.6039216, 1, 0, 1,
-0.7519509, -0.2257979, -2.419801, 0.5960785, 1, 0, 1,
-0.7488374, 0.9854183, 0.1781421, 0.5882353, 1, 0, 1,
-0.7485445, -0.5823601, -2.595156, 0.5843138, 1, 0, 1,
-0.7462363, -0.352446, -2.120909, 0.5764706, 1, 0, 1,
-0.7444043, 1.46947, -1.296722, 0.572549, 1, 0, 1,
-0.7439857, 1.586042, -0.6902841, 0.5647059, 1, 0, 1,
-0.7430727, -0.8838733, -2.253473, 0.5607843, 1, 0, 1,
-0.7414612, 0.5205669, -1.089753, 0.5529412, 1, 0, 1,
-0.7410756, 0.6652803, -1.324337, 0.5490196, 1, 0, 1,
-0.7329441, 0.3017986, -0.02582228, 0.5411765, 1, 0, 1,
-0.7307466, -1.07987, -1.293126, 0.5372549, 1, 0, 1,
-0.7294124, 0.7077716, -0.4902926, 0.5294118, 1, 0, 1,
-0.7189814, -0.545786, -3.050633, 0.5254902, 1, 0, 1,
-0.7150264, -0.219161, -1.979058, 0.5176471, 1, 0, 1,
-0.7050782, -0.4638686, -2.950938, 0.5137255, 1, 0, 1,
-0.7002972, 0.008171059, -0.8983573, 0.5058824, 1, 0, 1,
-0.6967674, -0.4436255, -2.810046, 0.5019608, 1, 0, 1,
-0.6897412, -0.4015616, -0.7780471, 0.4941176, 1, 0, 1,
-0.6877403, 0.8242326, 0.536745, 0.4862745, 1, 0, 1,
-0.6843835, -0.3807369, -3.848138, 0.4823529, 1, 0, 1,
-0.6813675, 0.926665, 1.021968, 0.4745098, 1, 0, 1,
-0.6660898, 0.373905, 0.7593051, 0.4705882, 1, 0, 1,
-0.6642907, 2.1744, -1.693041, 0.4627451, 1, 0, 1,
-0.6617014, 0.09683765, -2.67362, 0.4588235, 1, 0, 1,
-0.6549478, -0.1020936, -2.074148, 0.4509804, 1, 0, 1,
-0.6491919, -1.813691, -2.561157, 0.4470588, 1, 0, 1,
-0.6429317, -0.7748586, -3.274358, 0.4392157, 1, 0, 1,
-0.6360676, 0.04459887, -0.168515, 0.4352941, 1, 0, 1,
-0.6304975, -0.6615932, -0.4004624, 0.427451, 1, 0, 1,
-0.6264085, -0.2939385, -2.963392, 0.4235294, 1, 0, 1,
-0.6255939, 0.3594463, -1.987183, 0.4156863, 1, 0, 1,
-0.6247502, -0.5726284, -1.501074, 0.4117647, 1, 0, 1,
-0.6239, 0.6445649, -2.002381, 0.4039216, 1, 0, 1,
-0.6222772, -0.6786149, -1.810545, 0.3960784, 1, 0, 1,
-0.6208647, -0.1702817, -2.270414, 0.3921569, 1, 0, 1,
-0.6178097, 0.4190396, -3.446008, 0.3843137, 1, 0, 1,
-0.6157486, -0.2064114, -1.976238, 0.3803922, 1, 0, 1,
-0.6152344, 1.102563, -0.3663699, 0.372549, 1, 0, 1,
-0.6106889, -0.6828215, -2.507114, 0.3686275, 1, 0, 1,
-0.6081283, -0.9511302, -3.8632, 0.3607843, 1, 0, 1,
-0.6071521, 1.159134, 0.8633851, 0.3568628, 1, 0, 1,
-0.6058522, 0.2499313, -0.6220367, 0.3490196, 1, 0, 1,
-0.6034828, -0.6370632, -2.275309, 0.345098, 1, 0, 1,
-0.6030509, -0.533185, -2.713604, 0.3372549, 1, 0, 1,
-0.600615, -2.529313, -3.840384, 0.3333333, 1, 0, 1,
-0.6000202, -1.045941, -3.200486, 0.3254902, 1, 0, 1,
-0.5982962, 1.164234, -0.3883657, 0.3215686, 1, 0, 1,
-0.5980315, -0.6078795, -0.3442885, 0.3137255, 1, 0, 1,
-0.597645, 0.5533463, -2.212681, 0.3098039, 1, 0, 1,
-0.5965753, 0.4789528, -3.63029, 0.3019608, 1, 0, 1,
-0.5957748, -0.7721313, -3.481609, 0.2941177, 1, 0, 1,
-0.5892116, 0.4316511, -0.8293388, 0.2901961, 1, 0, 1,
-0.5889382, -1.5927, -3.441644, 0.282353, 1, 0, 1,
-0.5846139, 1.432028, 0.5411206, 0.2784314, 1, 0, 1,
-0.5838311, 1.415911, -0.9137229, 0.2705882, 1, 0, 1,
-0.5812788, 1.821635, -0.5925675, 0.2666667, 1, 0, 1,
-0.5750573, 0.2168965, -0.03510703, 0.2588235, 1, 0, 1,
-0.5605717, -2.00811, -2.323211, 0.254902, 1, 0, 1,
-0.5582674, -0.9340488, -2.408023, 0.2470588, 1, 0, 1,
-0.5568744, 0.2774136, -1.540121, 0.2431373, 1, 0, 1,
-0.5535044, -0.9782486, -1.969488, 0.2352941, 1, 0, 1,
-0.5425681, -0.2127485, -0.780653, 0.2313726, 1, 0, 1,
-0.5408679, 0.343296, -2.386564, 0.2235294, 1, 0, 1,
-0.5390905, 1.389729, -1.530115, 0.2196078, 1, 0, 1,
-0.5379634, 3.266045, 1.135099, 0.2117647, 1, 0, 1,
-0.537651, -0.8470806, -1.715552, 0.2078431, 1, 0, 1,
-0.5361326, 0.7251327, 0.5853102, 0.2, 1, 0, 1,
-0.5343494, -0.8494027, -4.279342, 0.1921569, 1, 0, 1,
-0.5329797, -0.6185595, -2.419607, 0.1882353, 1, 0, 1,
-0.524944, -0.0006521548, -0.08563547, 0.1803922, 1, 0, 1,
-0.5236666, 0.6573417, -0.5387489, 0.1764706, 1, 0, 1,
-0.5183812, -1.833385, -2.698143, 0.1686275, 1, 0, 1,
-0.516259, -0.7400492, -2.484538, 0.1647059, 1, 0, 1,
-0.5137604, -1.766424, -4.366193, 0.1568628, 1, 0, 1,
-0.5120659, -1.458221, -1.479305, 0.1529412, 1, 0, 1,
-0.5113643, -1.450987, -4.011067, 0.145098, 1, 0, 1,
-0.5075049, -0.9786473, -3.890027, 0.1411765, 1, 0, 1,
-0.5013384, 0.4108243, -1.469388, 0.1333333, 1, 0, 1,
-0.5010781, -1.433995, -1.683628, 0.1294118, 1, 0, 1,
-0.4972757, -0.4164124, -3.068288, 0.1215686, 1, 0, 1,
-0.4948772, 0.7597399, 1.936363, 0.1176471, 1, 0, 1,
-0.4931194, -0.3237403, -1.34812, 0.1098039, 1, 0, 1,
-0.492453, -0.3904099, 0.1609644, 0.1058824, 1, 0, 1,
-0.4721192, 0.3674442, -1.752374, 0.09803922, 1, 0, 1,
-0.4663545, 0.9112493, -2.192257, 0.09019608, 1, 0, 1,
-0.4628787, 0.05711503, -3.046236, 0.08627451, 1, 0, 1,
-0.4584011, -0.6194535, -1.614349, 0.07843138, 1, 0, 1,
-0.4564482, 1.122742, 0.1963032, 0.07450981, 1, 0, 1,
-0.4559054, 0.8635019, 0.4121736, 0.06666667, 1, 0, 1,
-0.4556146, 0.2654023, -2.431782, 0.0627451, 1, 0, 1,
-0.4546547, -0.2064688, -3.068679, 0.05490196, 1, 0, 1,
-0.4532312, -0.2683934, -5.545237, 0.05098039, 1, 0, 1,
-0.4460417, -0.9484842, -1.080538, 0.04313726, 1, 0, 1,
-0.4440428, -0.170061, -2.52541, 0.03921569, 1, 0, 1,
-0.4382602, -0.7185072, -4.662001, 0.03137255, 1, 0, 1,
-0.4342695, -1.986866, -3.216316, 0.02745098, 1, 0, 1,
-0.4312079, 0.2577971, -1.293888, 0.01960784, 1, 0, 1,
-0.4306728, 0.0758207, -1.265507, 0.01568628, 1, 0, 1,
-0.4295097, 0.344262, -2.731466, 0.007843138, 1, 0, 1,
-0.4264072, -0.5393993, -1.385214, 0.003921569, 1, 0, 1,
-0.4250564, -0.2621121, -1.562883, 0, 1, 0.003921569, 1,
-0.4230003, -1.54492, -2.715934, 0, 1, 0.01176471, 1,
-0.4189475, 1.397054, -0.6597996, 0, 1, 0.01568628, 1,
-0.4172168, 0.4158649, -1.242493, 0, 1, 0.02352941, 1,
-0.4159331, -0.4160372, -2.07753, 0, 1, 0.02745098, 1,
-0.4119724, 0.08023477, -2.224334, 0, 1, 0.03529412, 1,
-0.407649, 0.701297, -0.1778645, 0, 1, 0.03921569, 1,
-0.4071556, -1.137473, -1.861139, 0, 1, 0.04705882, 1,
-0.4067532, 1.302971, -1.127606, 0, 1, 0.05098039, 1,
-0.4050232, 1.33615, 0.9544981, 0, 1, 0.05882353, 1,
-0.4040091, 0.5545347, 0.2559649, 0, 1, 0.0627451, 1,
-0.4033266, 1.040287, 1.052307, 0, 1, 0.07058824, 1,
-0.4019085, -0.8691946, -3.759457, 0, 1, 0.07450981, 1,
-0.3987727, -1.31431, -4.577469, 0, 1, 0.08235294, 1,
-0.3978527, -1.110231, -2.574124, 0, 1, 0.08627451, 1,
-0.3976475, 1.180857, 0.8565412, 0, 1, 0.09411765, 1,
-0.3973978, -0.03470948, -1.557692, 0, 1, 0.1019608, 1,
-0.396809, -1.607192, 0.02579375, 0, 1, 0.1058824, 1,
-0.3896505, -0.5830146, -2.44256, 0, 1, 0.1137255, 1,
-0.3884034, 0.5874339, -0.5447724, 0, 1, 0.1176471, 1,
-0.3852981, -0.1585559, -2.457279, 0, 1, 0.1254902, 1,
-0.3831146, -0.6253821, -3.393769, 0, 1, 0.1294118, 1,
-0.3827294, 0.3920254, -1.321304, 0, 1, 0.1372549, 1,
-0.3770793, -0.7516136, -3.865468, 0, 1, 0.1411765, 1,
-0.3759248, -0.3901537, -0.6424727, 0, 1, 0.1490196, 1,
-0.3752017, 1.588893, -0.06606381, 0, 1, 0.1529412, 1,
-0.3659048, -0.6029057, -2.102557, 0, 1, 0.1607843, 1,
-0.3657515, 0.9359388, 0.09158134, 0, 1, 0.1647059, 1,
-0.3638667, -1.678311, -2.336816, 0, 1, 0.172549, 1,
-0.3618805, -1.626676, -4.239641, 0, 1, 0.1764706, 1,
-0.3580994, 0.3188809, -2.465387, 0, 1, 0.1843137, 1,
-0.3543125, 0.3116667, -0.1562192, 0, 1, 0.1882353, 1,
-0.354207, 0.3837013, -0.1218499, 0, 1, 0.1960784, 1,
-0.3505143, -0.3596355, -3.04373, 0, 1, 0.2039216, 1,
-0.350065, -0.1148375, -2.08973, 0, 1, 0.2078431, 1,
-0.3467049, -1.373553, -3.219948, 0, 1, 0.2156863, 1,
-0.3441722, 0.2683041, 0.3477983, 0, 1, 0.2196078, 1,
-0.3431928, 1.433591, -1.122728, 0, 1, 0.227451, 1,
-0.3423611, 1.556033, -0.5386118, 0, 1, 0.2313726, 1,
-0.3386931, 0.5630361, -0.6123497, 0, 1, 0.2392157, 1,
-0.3323583, 0.2597414, -1.021305, 0, 1, 0.2431373, 1,
-0.3316272, 0.4064302, -2.258583, 0, 1, 0.2509804, 1,
-0.3314775, 0.7769662, 1.310956, 0, 1, 0.254902, 1,
-0.3308769, -0.3187256, -2.310491, 0, 1, 0.2627451, 1,
-0.3300959, 2.164015, -0.5624751, 0, 1, 0.2666667, 1,
-0.3265056, 0.3284239, -0.7976697, 0, 1, 0.2745098, 1,
-0.3174659, -0.5837228, -0.4089614, 0, 1, 0.2784314, 1,
-0.3147725, -0.9411995, -2.961457, 0, 1, 0.2862745, 1,
-0.3145898, -1.900813, -2.847065, 0, 1, 0.2901961, 1,
-0.3122362, 1.034232, 1.986404, 0, 1, 0.2980392, 1,
-0.304814, 2.150544, 0.2939647, 0, 1, 0.3058824, 1,
-0.3047218, 0.2245128, -0.0002490729, 0, 1, 0.3098039, 1,
-0.3031406, 0.4537822, -0.3105474, 0, 1, 0.3176471, 1,
-0.3007603, -1.559053, -3.767534, 0, 1, 0.3215686, 1,
-0.2972121, -1.813327, -2.857979, 0, 1, 0.3294118, 1,
-0.2958246, 0.4839739, -0.8864549, 0, 1, 0.3333333, 1,
-0.2917664, 0.2878477, -0.681874, 0, 1, 0.3411765, 1,
-0.2858624, 0.1075149, -1.66063, 0, 1, 0.345098, 1,
-0.2848092, 1.651564, -0.0008980121, 0, 1, 0.3529412, 1,
-0.2846053, 0.05057417, -0.5570354, 0, 1, 0.3568628, 1,
-0.2835642, 1.193052, -1.582914, 0, 1, 0.3647059, 1,
-0.2827085, -0.05742759, -2.865046, 0, 1, 0.3686275, 1,
-0.275674, 0.2863106, 1.022252, 0, 1, 0.3764706, 1,
-0.274283, -0.6934963, -2.453136, 0, 1, 0.3803922, 1,
-0.2719271, -0.01105257, 0.1697035, 0, 1, 0.3882353, 1,
-0.2678459, 1.626339, 2.86089, 0, 1, 0.3921569, 1,
-0.2637321, 1.561049, -1.289521, 0, 1, 0.4, 1,
-0.262105, 0.9736574, -0.6824881, 0, 1, 0.4078431, 1,
-0.2614993, 1.461569, -0.2739376, 0, 1, 0.4117647, 1,
-0.2614269, 0.5151857, 2.030887, 0, 1, 0.4196078, 1,
-0.2613152, 0.1441869, 0.8124028, 0, 1, 0.4235294, 1,
-0.2574499, -0.4326302, -4.53816, 0, 1, 0.4313726, 1,
-0.2557866, -0.3914225, -2.543248, 0, 1, 0.4352941, 1,
-0.2545448, 1.168291, -0.9574773, 0, 1, 0.4431373, 1,
-0.2513504, 0.2739202, -0.2886052, 0, 1, 0.4470588, 1,
-0.2509033, 0.4609477, -0.009252386, 0, 1, 0.454902, 1,
-0.2467401, 0.0970818, -0.6508777, 0, 1, 0.4588235, 1,
-0.2446492, -0.4967434, -2.273342, 0, 1, 0.4666667, 1,
-0.2433756, -0.4325586, -4.265924, 0, 1, 0.4705882, 1,
-0.242874, -1.03945, -1.356685, 0, 1, 0.4784314, 1,
-0.2408102, 0.3236482, -1.03151, 0, 1, 0.4823529, 1,
-0.2383602, -0.5410049, -2.975664, 0, 1, 0.4901961, 1,
-0.2358295, 0.1731825, 0.0665499, 0, 1, 0.4941176, 1,
-0.2342262, 0.7039239, -0.1734709, 0, 1, 0.5019608, 1,
-0.2313482, -0.5498261, -3.216766, 0, 1, 0.509804, 1,
-0.2304479, -0.3237525, -0.1748562, 0, 1, 0.5137255, 1,
-0.2290201, -0.01256172, 0.4532632, 0, 1, 0.5215687, 1,
-0.225503, -0.205806, -3.769685, 0, 1, 0.5254902, 1,
-0.2254648, -2.059808, -3.327868, 0, 1, 0.5333334, 1,
-0.2213262, 1.144098, 0.9596689, 0, 1, 0.5372549, 1,
-0.2202371, -0.6941566, -3.906518, 0, 1, 0.5450981, 1,
-0.2192967, 1.195166, -0.5676271, 0, 1, 0.5490196, 1,
-0.2185322, 2.026539, 0.1883541, 0, 1, 0.5568628, 1,
-0.2170592, 0.4012743, -1.834215, 0, 1, 0.5607843, 1,
-0.2160443, 0.5603334, -1.352802, 0, 1, 0.5686275, 1,
-0.2139464, -0.9381735, -4.578299, 0, 1, 0.572549, 1,
-0.2135585, 0.3185606, -0.6183582, 0, 1, 0.5803922, 1,
-0.2116083, -0.63864, -2.639785, 0, 1, 0.5843138, 1,
-0.2113521, 2.053263, 0.682404, 0, 1, 0.5921569, 1,
-0.2036924, 0.350197, -0.01938134, 0, 1, 0.5960785, 1,
-0.1976898, 0.3113246, 1.130913, 0, 1, 0.6039216, 1,
-0.1974556, -1.139478, -1.56008, 0, 1, 0.6117647, 1,
-0.189716, 0.01272751, -1.766509, 0, 1, 0.6156863, 1,
-0.1865171, 0.9303434, -1.011302, 0, 1, 0.6235294, 1,
-0.1832914, -0.6805552, -2.257308, 0, 1, 0.627451, 1,
-0.1830467, 1.483111, -0.08916581, 0, 1, 0.6352941, 1,
-0.1804737, 0.2504048, -1.133466, 0, 1, 0.6392157, 1,
-0.1796382, -0.7797524, -2.777508, 0, 1, 0.6470588, 1,
-0.1791013, -0.9435249, -3.170232, 0, 1, 0.6509804, 1,
-0.1771137, 0.2285796, 0.09732553, 0, 1, 0.6588235, 1,
-0.1762334, 0.1261304, -1.053952, 0, 1, 0.6627451, 1,
-0.1733275, -2.298962, -4.062105, 0, 1, 0.6705883, 1,
-0.1727764, -0.0749727, -1.943907, 0, 1, 0.6745098, 1,
-0.1710321, -0.4020178, -2.206177, 0, 1, 0.682353, 1,
-0.1657553, 0.6141092, -1.67711, 0, 1, 0.6862745, 1,
-0.1634255, 1.575899, 0.2489066, 0, 1, 0.6941177, 1,
-0.1627918, -1.683716, -1.771178, 0, 1, 0.7019608, 1,
-0.16022, -1.899328, -2.223247, 0, 1, 0.7058824, 1,
-0.1577295, -0.3771223, -2.11516, 0, 1, 0.7137255, 1,
-0.1449268, 0.254724, -0.3650034, 0, 1, 0.7176471, 1,
-0.1437419, 0.3151799, -1.859976, 0, 1, 0.7254902, 1,
-0.1436784, -0.2653756, -2.229112, 0, 1, 0.7294118, 1,
-0.143173, -0.69204, -2.585795, 0, 1, 0.7372549, 1,
-0.1422424, -0.04823418, -3.188632, 0, 1, 0.7411765, 1,
-0.1393924, -0.7764883, -2.96626, 0, 1, 0.7490196, 1,
-0.1382925, 1.127799, 0.721088, 0, 1, 0.7529412, 1,
-0.1355005, -0.4770086, -3.482146, 0, 1, 0.7607843, 1,
-0.133523, -0.1368173, -1.761548, 0, 1, 0.7647059, 1,
-0.1328684, 0.3454697, 0.3253712, 0, 1, 0.772549, 1,
-0.1286448, -0.9715703, -2.072747, 0, 1, 0.7764706, 1,
-0.1276094, -0.0435974, -1.996038, 0, 1, 0.7843137, 1,
-0.1247641, -1.171411, -3.778349, 0, 1, 0.7882353, 1,
-0.1243872, 0.9123545, -1.787113, 0, 1, 0.7960784, 1,
-0.1243807, -0.1388022, -2.357021, 0, 1, 0.8039216, 1,
-0.1153446, -0.2660292, -1.940566, 0, 1, 0.8078431, 1,
-0.113707, -0.2696136, -2.802305, 0, 1, 0.8156863, 1,
-0.1127176, -0.07936457, -1.789044, 0, 1, 0.8196079, 1,
-0.1095277, -0.4148353, -4.077151, 0, 1, 0.827451, 1,
-0.1064558, 0.6491047, 0.984184, 0, 1, 0.8313726, 1,
-0.1013445, 0.996837, -0.6710511, 0, 1, 0.8392157, 1,
-0.09873715, -0.7896407, -1.399023, 0, 1, 0.8431373, 1,
-0.09818804, 0.6491926, 0.4285151, 0, 1, 0.8509804, 1,
-0.09051137, -0.4263129, -3.617291, 0, 1, 0.854902, 1,
-0.09045652, 0.373458, -0.3248663, 0, 1, 0.8627451, 1,
-0.08701349, 1.217508, -0.3538267, 0, 1, 0.8666667, 1,
-0.08469998, 1.399315, 0.8970438, 0, 1, 0.8745098, 1,
-0.08344321, 1.775414, -1.141215, 0, 1, 0.8784314, 1,
-0.0736829, -1.15749, -2.709173, 0, 1, 0.8862745, 1,
-0.07348359, -0.1618935, -4.29023, 0, 1, 0.8901961, 1,
-0.07307887, 0.8391979, -0.1022255, 0, 1, 0.8980392, 1,
-0.07083379, 0.6026613, -0.1456522, 0, 1, 0.9058824, 1,
-0.07056902, -0.1883998, -2.628229, 0, 1, 0.9098039, 1,
-0.06977573, -0.6390001, -3.747438, 0, 1, 0.9176471, 1,
-0.06761201, 1.738401, -1.402481, 0, 1, 0.9215686, 1,
-0.06386124, 0.04929976, 0.2093799, 0, 1, 0.9294118, 1,
-0.0582024, 0.6675528, -1.224069, 0, 1, 0.9333333, 1,
-0.05585647, -2.062384, -3.138439, 0, 1, 0.9411765, 1,
-0.05035105, 1.218834, -0.9370031, 0, 1, 0.945098, 1,
-0.04824857, -2.132402, -4.11449, 0, 1, 0.9529412, 1,
-0.04777626, -0.9046279, -3.349903, 0, 1, 0.9568627, 1,
-0.04311617, 0.3986712, 0.9922543, 0, 1, 0.9647059, 1,
-0.04142175, -0.04413417, -2.60566, 0, 1, 0.9686275, 1,
-0.04023116, 1.532041, 0.676177, 0, 1, 0.9764706, 1,
-0.03697186, -0.09180451, -2.901611, 0, 1, 0.9803922, 1,
-0.03584794, -0.4285634, -2.696564, 0, 1, 0.9882353, 1,
-0.03484027, 0.1604367, 0.4706612, 0, 1, 0.9921569, 1,
-0.03054025, -0.3912676, -3.529737, 0, 1, 1, 1,
-0.0245374, 0.6150653, 0.5815283, 0, 0.9921569, 1, 1,
-0.02201327, -1.694631, -4.861952, 0, 0.9882353, 1, 1,
-0.02180092, -0.3050898, -2.370001, 0, 0.9803922, 1, 1,
-0.01602245, -0.4349828, -4.177326, 0, 0.9764706, 1, 1,
-0.01495859, -1.148075, -3.292934, 0, 0.9686275, 1, 1,
-0.01374177, -1.277498, -2.972708, 0, 0.9647059, 1, 1,
-0.01300099, -0.422974, -1.662681, 0, 0.9568627, 1, 1,
-0.0101064, 0.7751517, -0.8638555, 0, 0.9529412, 1, 1,
-0.005782539, 1.388596, 0.6881151, 0, 0.945098, 1, 1,
-0.002948937, -1.395757, -4.414615, 0, 0.9411765, 1, 1,
0.0001917778, 1.096901, -0.6754805, 0, 0.9333333, 1, 1,
0.0004303816, 0.8151255, 0.301273, 0, 0.9294118, 1, 1,
0.005106854, 1.10861, -0.3480662, 0, 0.9215686, 1, 1,
0.007727739, -0.2870854, 2.576624, 0, 0.9176471, 1, 1,
0.008851571, 0.7352043, -0.3433049, 0, 0.9098039, 1, 1,
0.01079885, -0.1157118, 2.294814, 0, 0.9058824, 1, 1,
0.01130042, 0.3722386, 0.7010577, 0, 0.8980392, 1, 1,
0.01428228, 1.886526, -1.142544, 0, 0.8901961, 1, 1,
0.01894807, -0.4441146, 2.26628, 0, 0.8862745, 1, 1,
0.02019464, -0.6804295, 1.824993, 0, 0.8784314, 1, 1,
0.02020637, 0.1682418, 0.1935349, 0, 0.8745098, 1, 1,
0.02703631, -0.9908454, 3.988208, 0, 0.8666667, 1, 1,
0.02844952, 0.2055946, 1.359741, 0, 0.8627451, 1, 1,
0.02881821, 0.496343, -0.5249639, 0, 0.854902, 1, 1,
0.03303366, 0.4508833, 0.4944709, 0, 0.8509804, 1, 1,
0.03422903, 0.5334933, -0.2326854, 0, 0.8431373, 1, 1,
0.03520399, 1.363893, 0.03712992, 0, 0.8392157, 1, 1,
0.03537714, -0.09558423, 2.486633, 0, 0.8313726, 1, 1,
0.04133842, 1.487577, -0.1532102, 0, 0.827451, 1, 1,
0.0437027, -1.835108, 3.332723, 0, 0.8196079, 1, 1,
0.04416151, 1.253764, 0.6658904, 0, 0.8156863, 1, 1,
0.04702508, 2.267585, 0.2924819, 0, 0.8078431, 1, 1,
0.04805871, -1.141129, 2.97566, 0, 0.8039216, 1, 1,
0.04861009, 1.267865, 1.421723, 0, 0.7960784, 1, 1,
0.0515876, -0.3317071, 1.843596, 0, 0.7882353, 1, 1,
0.05323625, 0.8826069, -0.7971874, 0, 0.7843137, 1, 1,
0.05470959, -1.411292, 3.787703, 0, 0.7764706, 1, 1,
0.0576815, -0.0658638, 2.428206, 0, 0.772549, 1, 1,
0.05942839, -1.086959, 5.118773, 0, 0.7647059, 1, 1,
0.07966668, -1.487796, 2.044343, 0, 0.7607843, 1, 1,
0.08664725, -0.8857689, 1.971071, 0, 0.7529412, 1, 1,
0.08751775, -0.5759476, 2.987372, 0, 0.7490196, 1, 1,
0.08898516, 0.4202553, 0.3837319, 0, 0.7411765, 1, 1,
0.08908154, 0.1993993, 1.854819, 0, 0.7372549, 1, 1,
0.08982787, 0.8844081, 1.221409, 0, 0.7294118, 1, 1,
0.0903488, 0.03996317, 0.05167946, 0, 0.7254902, 1, 1,
0.0915207, -1.108364, 3.442956, 0, 0.7176471, 1, 1,
0.09469596, 0.5812708, 0.3157705, 0, 0.7137255, 1, 1,
0.1029742, 1.193271, -0.5037968, 0, 0.7058824, 1, 1,
0.1047026, -0.9697602, 3.868044, 0, 0.6980392, 1, 1,
0.1069372, 1.54554, -1.189283, 0, 0.6941177, 1, 1,
0.1079517, -0.2375046, 2.798918, 0, 0.6862745, 1, 1,
0.108405, -1.948264, 2.151047, 0, 0.682353, 1, 1,
0.1095753, 0.3385062, -0.4600136, 0, 0.6745098, 1, 1,
0.1199081, -0.2833935, 2.469295, 0, 0.6705883, 1, 1,
0.1231758, 1.893609, -1.180043, 0, 0.6627451, 1, 1,
0.1245575, -0.2465201, 0.9012398, 0, 0.6588235, 1, 1,
0.1253596, 1.069781, 0.1982965, 0, 0.6509804, 1, 1,
0.1291542, -0.4510985, 3.937357, 0, 0.6470588, 1, 1,
0.1349031, -1.586631, 1.94303, 0, 0.6392157, 1, 1,
0.1368159, -1.632701, 2.408144, 0, 0.6352941, 1, 1,
0.1372624, 0.6039929, 1.101429, 0, 0.627451, 1, 1,
0.1397774, 0.1743009, 0.6119108, 0, 0.6235294, 1, 1,
0.1417552, 0.05357251, 2.566391, 0, 0.6156863, 1, 1,
0.1432108, -0.06663661, 0.769117, 0, 0.6117647, 1, 1,
0.1436336, -0.3432215, 3.364726, 0, 0.6039216, 1, 1,
0.1441503, -0.1103339, 1.07713, 0, 0.5960785, 1, 1,
0.1458757, 1.25583, -0.4792429, 0, 0.5921569, 1, 1,
0.1509379, -0.03792218, 3.343647, 0, 0.5843138, 1, 1,
0.1538011, 1.436236, -0.06283066, 0, 0.5803922, 1, 1,
0.1554833, 0.04987592, -0.2758664, 0, 0.572549, 1, 1,
0.1565313, 1.274646, 1.428465, 0, 0.5686275, 1, 1,
0.1601434, 1.407506, 0.9636582, 0, 0.5607843, 1, 1,
0.1626372, 0.1318724, 2.156985, 0, 0.5568628, 1, 1,
0.1653979, 0.5968422, -1.412768, 0, 0.5490196, 1, 1,
0.1657093, 1.030362, 0.6694668, 0, 0.5450981, 1, 1,
0.1724795, 0.120052, 0.1658383, 0, 0.5372549, 1, 1,
0.1735865, 1.332855, 0.8618696, 0, 0.5333334, 1, 1,
0.1746103, -2.082947, 1.864764, 0, 0.5254902, 1, 1,
0.1779485, -0.003066425, 3.474823, 0, 0.5215687, 1, 1,
0.1802371, -0.9388008, 3.870633, 0, 0.5137255, 1, 1,
0.1852024, -0.3916577, 2.583295, 0, 0.509804, 1, 1,
0.1855608, 1.205031, 0.08007526, 0, 0.5019608, 1, 1,
0.1858675, -0.6492136, 4.736199, 0, 0.4941176, 1, 1,
0.1895063, 1.162227, -0.4439825, 0, 0.4901961, 1, 1,
0.190199, -0.06422016, 1.170178, 0, 0.4823529, 1, 1,
0.1909617, -0.3601818, 1.330327, 0, 0.4784314, 1, 1,
0.1928813, -0.07323605, 1.890466, 0, 0.4705882, 1, 1,
0.1960565, 0.6349909, -0.7204646, 0, 0.4666667, 1, 1,
0.196418, -1.163062, 1.200937, 0, 0.4588235, 1, 1,
0.2028862, 0.6717954, 2.100532, 0, 0.454902, 1, 1,
0.2085491, 1.693324, 0.396086, 0, 0.4470588, 1, 1,
0.2093675, -0.1176388, 0.6258925, 0, 0.4431373, 1, 1,
0.2140154, -1.419666, 2.464088, 0, 0.4352941, 1, 1,
0.2186384, -1.247374, 2.55357, 0, 0.4313726, 1, 1,
0.2198727, -0.8892893, 2.665135, 0, 0.4235294, 1, 1,
0.2204848, -0.6144286, 3.293555, 0, 0.4196078, 1, 1,
0.2219785, 1.760443, -0.009259973, 0, 0.4117647, 1, 1,
0.2231726, -0.6508281, 4.86656, 0, 0.4078431, 1, 1,
0.2274695, -1.357763, 1.070513, 0, 0.4, 1, 1,
0.2280719, 0.9842567, 0.05093163, 0, 0.3921569, 1, 1,
0.2285947, 0.3120751, 1.741795, 0, 0.3882353, 1, 1,
0.2288776, -0.7560273, 2.472318, 0, 0.3803922, 1, 1,
0.2302627, -1.089268, 2.113554, 0, 0.3764706, 1, 1,
0.2504581, 1.058464, 1.439313, 0, 0.3686275, 1, 1,
0.2532644, 2.17846, 0.631083, 0, 0.3647059, 1, 1,
0.2580396, -0.9643567, 4.21367, 0, 0.3568628, 1, 1,
0.2598807, -1.168662, 2.163012, 0, 0.3529412, 1, 1,
0.2604199, 0.657061, 0.8082989, 0, 0.345098, 1, 1,
0.266078, 0.9632611, 1.28883, 0, 0.3411765, 1, 1,
0.2661267, -0.3385195, 4.76839, 0, 0.3333333, 1, 1,
0.2783853, 1.794461, 0.5763669, 0, 0.3294118, 1, 1,
0.2827918, -1.097463, 2.185274, 0, 0.3215686, 1, 1,
0.2828641, 0.06989244, 1.941761, 0, 0.3176471, 1, 1,
0.2856581, -1.127658, 1.138743, 0, 0.3098039, 1, 1,
0.2922235, -1.114652, 2.380438, 0, 0.3058824, 1, 1,
0.2927769, -1.7626, 2.57177, 0, 0.2980392, 1, 1,
0.2949255, -0.2959388, 2.311206, 0, 0.2901961, 1, 1,
0.2973005, -0.0562178, 0.5787678, 0, 0.2862745, 1, 1,
0.2973102, -1.224335, 3.060972, 0, 0.2784314, 1, 1,
0.298662, 0.4300591, 1.525844, 0, 0.2745098, 1, 1,
0.2990606, 1.636132, -1.05938, 0, 0.2666667, 1, 1,
0.3008412, -0.5537802, 3.155259, 0, 0.2627451, 1, 1,
0.302271, -1.035308, 1.313815, 0, 0.254902, 1, 1,
0.3054093, -1.532812, 4.356821, 0, 0.2509804, 1, 1,
0.3130223, 0.5871574, 0.7860113, 0, 0.2431373, 1, 1,
0.3197726, -0.8044009, 3.50636, 0, 0.2392157, 1, 1,
0.3251173, 0.8781819, -0.03449811, 0, 0.2313726, 1, 1,
0.3268108, 0.2267051, 1.143559, 0, 0.227451, 1, 1,
0.3282573, 0.4722217, -0.07308742, 0, 0.2196078, 1, 1,
0.3301387, -0.1482426, 0.1243568, 0, 0.2156863, 1, 1,
0.3346637, 0.871138, 1.174255, 0, 0.2078431, 1, 1,
0.337257, 0.6711144, 0.9911028, 0, 0.2039216, 1, 1,
0.3379264, -0.2471782, 3.167983, 0, 0.1960784, 1, 1,
0.3389302, -1.444349, 2.239145, 0, 0.1882353, 1, 1,
0.342462, -1.038841, 3.115021, 0, 0.1843137, 1, 1,
0.3437668, 1.135728, 1.854774, 0, 0.1764706, 1, 1,
0.3440707, 0.693338, -0.5717146, 0, 0.172549, 1, 1,
0.3444166, -1.061198, 1.853988, 0, 0.1647059, 1, 1,
0.3451699, 1.095465, -0.4720891, 0, 0.1607843, 1, 1,
0.3478672, 0.5838423, 0.2120479, 0, 0.1529412, 1, 1,
0.3594971, -2.4654, 3.505847, 0, 0.1490196, 1, 1,
0.3620659, 0.943194, 1.006241, 0, 0.1411765, 1, 1,
0.3632762, -1.894827, 2.719149, 0, 0.1372549, 1, 1,
0.3654341, 1.564036, -0.6970133, 0, 0.1294118, 1, 1,
0.3733851, 1.97245, 0.931856, 0, 0.1254902, 1, 1,
0.3744798, 0.53252, -0.1193962, 0, 0.1176471, 1, 1,
0.3764743, -0.873322, 2.149506, 0, 0.1137255, 1, 1,
0.3780606, -0.2181011, 0.7070135, 0, 0.1058824, 1, 1,
0.3821223, 0.2318313, 0.08139495, 0, 0.09803922, 1, 1,
0.3823678, -0.2874872, 2.665601, 0, 0.09411765, 1, 1,
0.3915458, -0.1010156, 1.317486, 0, 0.08627451, 1, 1,
0.3961445, 1.420478, -1.353655, 0, 0.08235294, 1, 1,
0.4002087, 0.02062739, 0.3755509, 0, 0.07450981, 1, 1,
0.4004127, 0.1761539, 0.8382197, 0, 0.07058824, 1, 1,
0.4016522, 1.071899, 0.4464439, 0, 0.0627451, 1, 1,
0.4032652, 0.03272108, 2.336214, 0, 0.05882353, 1, 1,
0.4047078, 2.509928, -1.540719, 0, 0.05098039, 1, 1,
0.4072215, -0.1583335, 2.889678, 0, 0.04705882, 1, 1,
0.4103356, -0.2651688, 2.617253, 0, 0.03921569, 1, 1,
0.4110137, 0.8469132, 1.936491, 0, 0.03529412, 1, 1,
0.425956, 1.762381, -0.4320976, 0, 0.02745098, 1, 1,
0.4264439, -0.4674628, 4.823995, 0, 0.02352941, 1, 1,
0.4297283, 1.454392, 0.8948032, 0, 0.01568628, 1, 1,
0.4327277, 1.326754, 0.7118724, 0, 0.01176471, 1, 1,
0.4338265, -0.9670395, 3.310607, 0, 0.003921569, 1, 1,
0.4356373, -0.4195103, 1.472359, 0.003921569, 0, 1, 1,
0.4359925, 0.2087184, 0.299131, 0.007843138, 0, 1, 1,
0.4361609, -1.024956, 3.561644, 0.01568628, 0, 1, 1,
0.4405951, -0.02208149, 2.05646, 0.01960784, 0, 1, 1,
0.4408959, -0.519073, 0.8159037, 0.02745098, 0, 1, 1,
0.4430444, 0.2345881, 2.290485, 0.03137255, 0, 1, 1,
0.4437106, 0.9240258, 0.4817544, 0.03921569, 0, 1, 1,
0.4448823, -0.7636374, 2.857429, 0.04313726, 0, 1, 1,
0.4496897, -0.09205059, 1.269791, 0.05098039, 0, 1, 1,
0.4537389, -0.684909, 3.524045, 0.05490196, 0, 1, 1,
0.45402, 0.6252292, 0.66461, 0.0627451, 0, 1, 1,
0.4565839, 0.7285611, -0.2740237, 0.06666667, 0, 1, 1,
0.4609722, 0.6935887, 0.2484316, 0.07450981, 0, 1, 1,
0.4658926, -0.1850483, 1.889343, 0.07843138, 0, 1, 1,
0.4700434, 0.7950642, 1.859103, 0.08627451, 0, 1, 1,
0.4719225, -0.5022206, 0.186118, 0.09019608, 0, 1, 1,
0.4763027, 1.881963, -0.8300616, 0.09803922, 0, 1, 1,
0.4763822, 1.274607, 0.7828696, 0.1058824, 0, 1, 1,
0.4772715, 0.455347, 0.7269062, 0.1098039, 0, 1, 1,
0.4842381, 0.1828996, 2.816655, 0.1176471, 0, 1, 1,
0.4995863, -0.3664842, 1.146441, 0.1215686, 0, 1, 1,
0.5009881, 0.5299897, 0.9620577, 0.1294118, 0, 1, 1,
0.5049422, 1.428805, 1.431901, 0.1333333, 0, 1, 1,
0.5080313, 0.6181261, -1.499104, 0.1411765, 0, 1, 1,
0.5090243, 1.545753, 1.328498, 0.145098, 0, 1, 1,
0.5104348, -2.066018, 4.440829, 0.1529412, 0, 1, 1,
0.5108587, -0.3223119, 0.1901705, 0.1568628, 0, 1, 1,
0.511286, -0.9633822, 3.10541, 0.1647059, 0, 1, 1,
0.5126462, 1.076739, -1.913069, 0.1686275, 0, 1, 1,
0.5253037, 0.1976066, 1.14448, 0.1764706, 0, 1, 1,
0.5259153, -0.748544, 2.130653, 0.1803922, 0, 1, 1,
0.5264742, 1.51096, 0.7145387, 0.1882353, 0, 1, 1,
0.5271181, -0.01444013, 0.3892252, 0.1921569, 0, 1, 1,
0.5324791, -0.03377348, 1.638228, 0.2, 0, 1, 1,
0.5337536, 1.224236, 1.433517, 0.2078431, 0, 1, 1,
0.5344861, -0.8214818, 4.103064, 0.2117647, 0, 1, 1,
0.5443982, 0.4125368, 1.522644, 0.2196078, 0, 1, 1,
0.5515801, -1.565637, 2.560603, 0.2235294, 0, 1, 1,
0.5535362, 0.005324021, 2.069473, 0.2313726, 0, 1, 1,
0.5586169, 0.2937624, 0.908399, 0.2352941, 0, 1, 1,
0.5586906, 0.9829809, 1.750085, 0.2431373, 0, 1, 1,
0.5604703, 0.507923, -0.07754506, 0.2470588, 0, 1, 1,
0.5632147, -0.5146381, 1.119468, 0.254902, 0, 1, 1,
0.5639371, -1.804593, 1.250881, 0.2588235, 0, 1, 1,
0.5640311, -0.9958751, 3.108116, 0.2666667, 0, 1, 1,
0.5641018, 0.7666943, -0.1761913, 0.2705882, 0, 1, 1,
0.5643407, 0.1412184, 3.377018, 0.2784314, 0, 1, 1,
0.5669602, 0.5050058, -0.2703018, 0.282353, 0, 1, 1,
0.5691393, 1.392897, 2.038424, 0.2901961, 0, 1, 1,
0.5717171, 1.80215, -0.1115127, 0.2941177, 0, 1, 1,
0.5724601, 0.801168, -1.115431, 0.3019608, 0, 1, 1,
0.5775834, 0.8278399, 1.747448, 0.3098039, 0, 1, 1,
0.5783406, 0.4851912, -0.657084, 0.3137255, 0, 1, 1,
0.580628, 1.067194, 0.393919, 0.3215686, 0, 1, 1,
0.5825861, 1.05421, 0.88226, 0.3254902, 0, 1, 1,
0.5883424, 0.3874992, 2.138326, 0.3333333, 0, 1, 1,
0.5914296, -1.707647, 2.350108, 0.3372549, 0, 1, 1,
0.5925595, -2.550788, 3.267565, 0.345098, 0, 1, 1,
0.5999405, 1.612288, -1.007425, 0.3490196, 0, 1, 1,
0.6019002, 0.2058661, 2.678548, 0.3568628, 0, 1, 1,
0.607026, -1.496688, 3.01426, 0.3607843, 0, 1, 1,
0.6078369, -0.8358573, 3.688452, 0.3686275, 0, 1, 1,
0.6083416, -0.8261645, 3.709654, 0.372549, 0, 1, 1,
0.618518, -1.252905, 3.26476, 0.3803922, 0, 1, 1,
0.6202875, 1.426966, 1.395355, 0.3843137, 0, 1, 1,
0.6239208, -1.642619, 1.127342, 0.3921569, 0, 1, 1,
0.6332247, 0.126025, 1.54955, 0.3960784, 0, 1, 1,
0.6378168, 0.5446547, -0.5731021, 0.4039216, 0, 1, 1,
0.6442435, 1.040065, 0.5169055, 0.4117647, 0, 1, 1,
0.6459295, 0.3096147, -0.7114289, 0.4156863, 0, 1, 1,
0.646657, -0.9503074, 2.582894, 0.4235294, 0, 1, 1,
0.6576602, -1.964932, 1.840785, 0.427451, 0, 1, 1,
0.6581011, -0.7901777, 3.242163, 0.4352941, 0, 1, 1,
0.660542, -0.5988674, 1.634024, 0.4392157, 0, 1, 1,
0.6707944, 0.6564109, 1.291964, 0.4470588, 0, 1, 1,
0.6739255, -0.3828024, 1.7572, 0.4509804, 0, 1, 1,
0.6804318, 2.040015, -0.7587194, 0.4588235, 0, 1, 1,
0.6915547, -0.4222398, 2.408735, 0.4627451, 0, 1, 1,
0.7005667, 0.3539389, 1.627342, 0.4705882, 0, 1, 1,
0.7014931, -1.81221, 1.994578, 0.4745098, 0, 1, 1,
0.7019827, 0.09831522, 3.412227, 0.4823529, 0, 1, 1,
0.7108113, 1.652047, 2.86917, 0.4862745, 0, 1, 1,
0.7133527, 0.8696226, 1.52848, 0.4941176, 0, 1, 1,
0.7142861, 1.230281, 0.4326216, 0.5019608, 0, 1, 1,
0.7275051, -0.2601311, 0.8908055, 0.5058824, 0, 1, 1,
0.7280074, -1.225203, 3.726102, 0.5137255, 0, 1, 1,
0.7327588, -0.4782745, 2.697565, 0.5176471, 0, 1, 1,
0.7329119, -0.195375, 2.815808, 0.5254902, 0, 1, 1,
0.7332042, -0.7434465, 2.488395, 0.5294118, 0, 1, 1,
0.734832, -1.222525, 1.269096, 0.5372549, 0, 1, 1,
0.7367346, 1.053632, -0.02611311, 0.5411765, 0, 1, 1,
0.7421161, -0.3404851, 1.187479, 0.5490196, 0, 1, 1,
0.7433376, 0.6229732, 1.424508, 0.5529412, 0, 1, 1,
0.7434164, -2.100502, 3.316479, 0.5607843, 0, 1, 1,
0.7444043, -0.4387928, 3.499158, 0.5647059, 0, 1, 1,
0.7469356, 1.972034, -1.236613, 0.572549, 0, 1, 1,
0.7488492, -0.4565861, 2.886205, 0.5764706, 0, 1, 1,
0.7552647, -0.2455651, 1.550851, 0.5843138, 0, 1, 1,
0.7579569, -0.9428645, 3.625563, 0.5882353, 0, 1, 1,
0.7604835, 1.610895, -1.021592, 0.5960785, 0, 1, 1,
0.7634485, -0.9857345, 3.331759, 0.6039216, 0, 1, 1,
0.7697625, 0.0528249, 1.070433, 0.6078432, 0, 1, 1,
0.7714828, 0.691611, 1.162328, 0.6156863, 0, 1, 1,
0.782666, -0.5387315, 1.940558, 0.6196079, 0, 1, 1,
0.7843753, 1.654875, -0.1011407, 0.627451, 0, 1, 1,
0.7868687, -0.5542297, 1.7766, 0.6313726, 0, 1, 1,
0.7901156, 0.05811055, 3.460706, 0.6392157, 0, 1, 1,
0.7901239, 0.8117301, 1.238194, 0.6431373, 0, 1, 1,
0.7924009, -0.1375114, 1.042631, 0.6509804, 0, 1, 1,
0.7935708, -0.2125462, 1.173066, 0.654902, 0, 1, 1,
0.7942641, -0.6362188, 2.585523, 0.6627451, 0, 1, 1,
0.7947313, -0.09267608, 2.127256, 0.6666667, 0, 1, 1,
0.7960533, -1.506838, 3.809222, 0.6745098, 0, 1, 1,
0.804144, 0.6713936, -0.4622552, 0.6784314, 0, 1, 1,
0.8084791, 2.559296, 1.438276, 0.6862745, 0, 1, 1,
0.8092605, 1.049357, -0.403282, 0.6901961, 0, 1, 1,
0.8102184, -0.2176884, 1.684559, 0.6980392, 0, 1, 1,
0.8194322, 1.076499, 0.1223968, 0.7058824, 0, 1, 1,
0.8250717, -1.710755, -0.09090487, 0.7098039, 0, 1, 1,
0.8295623, 0.2524163, 0.9699759, 0.7176471, 0, 1, 1,
0.8332608, 1.456931, -0.6156406, 0.7215686, 0, 1, 1,
0.8345537, 2.471314, -0.5256559, 0.7294118, 0, 1, 1,
0.8368507, -0.602961, 0.6136591, 0.7333333, 0, 1, 1,
0.8415958, -0.2765592, 2.260462, 0.7411765, 0, 1, 1,
0.8419328, 0.3609031, 0.6343554, 0.7450981, 0, 1, 1,
0.8441781, 1.574144, -1.202504, 0.7529412, 0, 1, 1,
0.8447888, -1.496964, 3.240197, 0.7568628, 0, 1, 1,
0.8474169, -0.4123051, 1.045322, 0.7647059, 0, 1, 1,
0.8507848, 1.852468, -0.2342118, 0.7686275, 0, 1, 1,
0.851603, -0.02958948, 2.094973, 0.7764706, 0, 1, 1,
0.8518468, 0.1211556, 0.4088604, 0.7803922, 0, 1, 1,
0.8534266, -0.6527305, 3.959227, 0.7882353, 0, 1, 1,
0.8548935, 0.2903852, 2.058217, 0.7921569, 0, 1, 1,
0.8557426, 0.001622106, 1.407139, 0.8, 0, 1, 1,
0.8581619, -1.22488, 3.208458, 0.8078431, 0, 1, 1,
0.8621163, -0.5792454, 2.24537, 0.8117647, 0, 1, 1,
0.8621508, -1.398801, 2.739053, 0.8196079, 0, 1, 1,
0.871362, 0.39569, 0.5621597, 0.8235294, 0, 1, 1,
0.8713904, -1.185962, 2.11682, 0.8313726, 0, 1, 1,
0.8722377, 0.5543227, 1.227145, 0.8352941, 0, 1, 1,
0.8727232, 0.7722117, 0.7202591, 0.8431373, 0, 1, 1,
0.8734614, -0.8025715, 0.9054199, 0.8470588, 0, 1, 1,
0.8763809, 0.7809255, 3.056611, 0.854902, 0, 1, 1,
0.8797107, -2.095001, 2.456655, 0.8588235, 0, 1, 1,
0.8874084, 0.6966566, 1.905333, 0.8666667, 0, 1, 1,
0.8875802, 0.7508937, 0.2812864, 0.8705882, 0, 1, 1,
0.8894688, -1.580752, 1.798982, 0.8784314, 0, 1, 1,
0.8945187, 1.151396, -0.0596163, 0.8823529, 0, 1, 1,
0.8969981, 1.966203, 1.896373, 0.8901961, 0, 1, 1,
0.9077646, 0.02453223, 1.396411, 0.8941177, 0, 1, 1,
0.9079317, 1.794983, 1.110702, 0.9019608, 0, 1, 1,
0.9112284, -2.158572, 3.48855, 0.9098039, 0, 1, 1,
0.9343529, 1.085575, -2.218181, 0.9137255, 0, 1, 1,
0.9357255, 0.7132633, 1.85759, 0.9215686, 0, 1, 1,
0.9390994, 0.7544974, -1.604172, 0.9254902, 0, 1, 1,
0.947284, 0.6924323, -0.3712628, 0.9333333, 0, 1, 1,
0.9532036, 2.080031, 1.246811, 0.9372549, 0, 1, 1,
0.9581154, 0.5855735, 1.362542, 0.945098, 0, 1, 1,
0.9648105, -0.01876939, 2.704275, 0.9490196, 0, 1, 1,
0.9656651, 1.143344, 0.1707443, 0.9568627, 0, 1, 1,
0.9711999, 1.219194, 1.538964, 0.9607843, 0, 1, 1,
0.9777087, 1.100117, 0.5372104, 0.9686275, 0, 1, 1,
0.9788763, -1.630258, 2.66548, 0.972549, 0, 1, 1,
0.9827421, 0.02297783, 0.2035273, 0.9803922, 0, 1, 1,
0.9840215, -1.188115, 1.295639, 0.9843137, 0, 1, 1,
0.9857253, 0.1448854, 2.901971, 0.9921569, 0, 1, 1,
0.9907314, 1.193341, 0.3607187, 0.9960784, 0, 1, 1,
0.9912137, 0.9824706, -1.148123, 1, 0, 0.9960784, 1,
0.9955969, -0.6290326, 2.342968, 1, 0, 0.9882353, 1,
0.9978378, 0.03471025, 2.500923, 1, 0, 0.9843137, 1,
1.001646, -0.8287876, 1.551053, 1, 0, 0.9764706, 1,
1.001942, 1.249533, 1.523266, 1, 0, 0.972549, 1,
1.009239, -0.9294167, 2.220258, 1, 0, 0.9647059, 1,
1.012087, -0.6809274, 2.168264, 1, 0, 0.9607843, 1,
1.015467, 0.3766324, -0.2888823, 1, 0, 0.9529412, 1,
1.01985, 1.600566, 0.2424526, 1, 0, 0.9490196, 1,
1.033585, -0.1204287, 1.625178, 1, 0, 0.9411765, 1,
1.034201, -1.036382, 1.963369, 1, 0, 0.9372549, 1,
1.034829, -0.7164701, 2.985167, 1, 0, 0.9294118, 1,
1.035222, 0.9725717, 1.477138, 1, 0, 0.9254902, 1,
1.04217, 1.037875, 1.231069, 1, 0, 0.9176471, 1,
1.045907, -0.5981212, 4.209848, 1, 0, 0.9137255, 1,
1.059468, -2.066572, 2.168625, 1, 0, 0.9058824, 1,
1.061157, -0.2400915, 1.974985, 1, 0, 0.9019608, 1,
1.06189, -0.6213894, 1.231297, 1, 0, 0.8941177, 1,
1.065757, 1.021654, 3.182882, 1, 0, 0.8862745, 1,
1.068891, 0.2628509, 1.413776, 1, 0, 0.8823529, 1,
1.07617, 0.3339265, 0.8249421, 1, 0, 0.8745098, 1,
1.079051, 0.7398343, 1.840934, 1, 0, 0.8705882, 1,
1.080549, -0.5952758, 2.039135, 1, 0, 0.8627451, 1,
1.080774, -0.4078354, 1.694779, 1, 0, 0.8588235, 1,
1.081507, 0.7550995, 0.8041446, 1, 0, 0.8509804, 1,
1.083651, -0.2536082, 1.47503, 1, 0, 0.8470588, 1,
1.087644, -0.007393287, 0.6291804, 1, 0, 0.8392157, 1,
1.090231, -0.0609265, 0.9604136, 1, 0, 0.8352941, 1,
1.092349, 0.651689, 0.9275442, 1, 0, 0.827451, 1,
1.092541, -0.4752758, 2.952892, 1, 0, 0.8235294, 1,
1.094868, -0.4373267, 2.291713, 1, 0, 0.8156863, 1,
1.098867, -0.9200367, 2.481339, 1, 0, 0.8117647, 1,
1.100511, -1.97395, 3.777497, 1, 0, 0.8039216, 1,
1.111533, 0.1064251, -0.829508, 1, 0, 0.7960784, 1,
1.120414, -0.1607678, 0.9086652, 1, 0, 0.7921569, 1,
1.120603, -0.1577959, 0.6097091, 1, 0, 0.7843137, 1,
1.127426, -1.582892, 2.416453, 1, 0, 0.7803922, 1,
1.135485, -0.8588799, 3.317496, 1, 0, 0.772549, 1,
1.135736, -0.5349567, 3.381367, 1, 0, 0.7686275, 1,
1.135744, 0.5746134, 1.857105, 1, 0, 0.7607843, 1,
1.136432, 1.651801, -0.1129618, 1, 0, 0.7568628, 1,
1.138159, 0.6735142, 1.809905, 1, 0, 0.7490196, 1,
1.14612, -0.3219633, 2.652719, 1, 0, 0.7450981, 1,
1.146695, -0.08724037, -0.5539064, 1, 0, 0.7372549, 1,
1.146839, -0.897283, 2.281037, 1, 0, 0.7333333, 1,
1.155929, 0.2878774, 1.443253, 1, 0, 0.7254902, 1,
1.15768, 1.047165, 1.713377, 1, 0, 0.7215686, 1,
1.164414, -0.7584801, 2.782279, 1, 0, 0.7137255, 1,
1.165113, 1.34698, 0.4624167, 1, 0, 0.7098039, 1,
1.173848, -0.4477486, 2.569083, 1, 0, 0.7019608, 1,
1.175141, 0.5355369, 1.427208, 1, 0, 0.6941177, 1,
1.183578, 0.8365817, 0.886867, 1, 0, 0.6901961, 1,
1.187482, 0.01482816, 0.03244203, 1, 0, 0.682353, 1,
1.198738, -0.2736544, 2.59466, 1, 0, 0.6784314, 1,
1.201183, -0.5900212, 2.28897, 1, 0, 0.6705883, 1,
1.218624, 0.952039, 0.2905776, 1, 0, 0.6666667, 1,
1.221164, 0.9841254, -0.2224153, 1, 0, 0.6588235, 1,
1.225894, 0.9500128, 2.269525, 1, 0, 0.654902, 1,
1.227277, -0.6104026, 2.066526, 1, 0, 0.6470588, 1,
1.238902, -0.4797821, 2.981492, 1, 0, 0.6431373, 1,
1.242563, -0.6713743, 2.908123, 1, 0, 0.6352941, 1,
1.250929, 0.09320107, 0.3577357, 1, 0, 0.6313726, 1,
1.255302, 0.488541, 0.5733844, 1, 0, 0.6235294, 1,
1.256604, -1.155007, 2.066407, 1, 0, 0.6196079, 1,
1.266089, 0.08346669, 0.9102802, 1, 0, 0.6117647, 1,
1.268253, -0.6784983, 2.666585, 1, 0, 0.6078432, 1,
1.27188, 0.2539178, 0.6606513, 1, 0, 0.6, 1,
1.274287, 0.8945862, 0.5389065, 1, 0, 0.5921569, 1,
1.277253, 0.5141692, 0.9095849, 1, 0, 0.5882353, 1,
1.284242, 0.572385, 0.4889764, 1, 0, 0.5803922, 1,
1.287973, 0.4862199, 2.51122, 1, 0, 0.5764706, 1,
1.304374, 1.903121, 0.2611718, 1, 0, 0.5686275, 1,
1.304639, -0.8925786, 2.641711, 1, 0, 0.5647059, 1,
1.312866, 0.039117, 2.411583, 1, 0, 0.5568628, 1,
1.314993, 0.9702452, -0.7017853, 1, 0, 0.5529412, 1,
1.315213, -0.4669149, 2.485763, 1, 0, 0.5450981, 1,
1.321485, -1.886054, 0.4189236, 1, 0, 0.5411765, 1,
1.329783, -1.251498, 1.891012, 1, 0, 0.5333334, 1,
1.334954, -2.441636, 2.434239, 1, 0, 0.5294118, 1,
1.346518, 0.126839, 1.125912, 1, 0, 0.5215687, 1,
1.354097, 0.1267696, 3.760677, 1, 0, 0.5176471, 1,
1.355005, -0.4817383, 3.316482, 1, 0, 0.509804, 1,
1.356319, -0.4633003, 2.376329, 1, 0, 0.5058824, 1,
1.363423, -1.4526, 4.386112, 1, 0, 0.4980392, 1,
1.365552, 0.2212198, 2.028852, 1, 0, 0.4901961, 1,
1.378183, -0.6374296, 1.807312, 1, 0, 0.4862745, 1,
1.38055, -0.02121736, 0.7117229, 1, 0, 0.4784314, 1,
1.391005, -0.07028327, 1.232862, 1, 0, 0.4745098, 1,
1.394242, -0.8305345, 1.923882, 1, 0, 0.4666667, 1,
1.398397, 0.5961158, 0.3572904, 1, 0, 0.4627451, 1,
1.41402, 0.3851747, 2.326633, 1, 0, 0.454902, 1,
1.446285, -1.001758, 3.684591, 1, 0, 0.4509804, 1,
1.456477, -1.187744, 0.9043082, 1, 0, 0.4431373, 1,
1.467807, 1.074865, 1.503988, 1, 0, 0.4392157, 1,
1.472975, -0.3309875, 0.8591505, 1, 0, 0.4313726, 1,
1.487198, 0.06715514, 1.589799, 1, 0, 0.427451, 1,
1.494652, 0.8739417, 0.7857171, 1, 0, 0.4196078, 1,
1.498091, 0.5643668, 0.4678841, 1, 0, 0.4156863, 1,
1.505745, -0.2644085, 1.655359, 1, 0, 0.4078431, 1,
1.508353, 1.288592, 2.861111, 1, 0, 0.4039216, 1,
1.515276, -0.7377146, 1.982966, 1, 0, 0.3960784, 1,
1.521428, 0.8607677, 2.451312, 1, 0, 0.3882353, 1,
1.522435, -1.604691, 2.005779, 1, 0, 0.3843137, 1,
1.531104, -0.9807833, 4.024121, 1, 0, 0.3764706, 1,
1.532786, -0.6169051, 1.002786, 1, 0, 0.372549, 1,
1.539094, -0.1112705, 3.299454, 1, 0, 0.3647059, 1,
1.549707, 0.02149105, 0.9188201, 1, 0, 0.3607843, 1,
1.562609, -0.6009911, 2.722702, 1, 0, 0.3529412, 1,
1.575835, 0.4865232, 0.1319978, 1, 0, 0.3490196, 1,
1.582528, 0.7191806, -0.1038012, 1, 0, 0.3411765, 1,
1.589671, -0.337172, 1.697351, 1, 0, 0.3372549, 1,
1.589922, -0.1095055, 2.286178, 1, 0, 0.3294118, 1,
1.606768, 1.627775, -0.6450093, 1, 0, 0.3254902, 1,
1.609591, -0.918612, 3.257021, 1, 0, 0.3176471, 1,
1.621882, -0.3723969, 1.74376, 1, 0, 0.3137255, 1,
1.625597, -0.6124424, 2.707536, 1, 0, 0.3058824, 1,
1.625903, -0.9988998, 1.918148, 1, 0, 0.2980392, 1,
1.639797, -1.759964, 2.552568, 1, 0, 0.2941177, 1,
1.654071, -0.9849243, 2.620806, 1, 0, 0.2862745, 1,
1.659324, -0.8985329, 1.141253, 1, 0, 0.282353, 1,
1.668317, 1.807019, -0.4353457, 1, 0, 0.2745098, 1,
1.675065, -2.453226, 2.709909, 1, 0, 0.2705882, 1,
1.681772, -0.7984463, 1.713973, 1, 0, 0.2627451, 1,
1.70658, -0.2064649, 0.001872396, 1, 0, 0.2588235, 1,
1.73424, -1.295868, 1.581461, 1, 0, 0.2509804, 1,
1.745434, 0.2069908, 1.263316, 1, 0, 0.2470588, 1,
1.750046, -0.5231927, 2.833661, 1, 0, 0.2392157, 1,
1.759068, 0.425444, 2.999823, 1, 0, 0.2352941, 1,
1.796188, 0.8530036, 3.372046, 1, 0, 0.227451, 1,
1.803268, 0.412355, 1.278255, 1, 0, 0.2235294, 1,
1.807461, 0.002707285, 0.9443303, 1, 0, 0.2156863, 1,
1.812183, -0.1874803, 2.222051, 1, 0, 0.2117647, 1,
1.854531, -0.6906046, 2.682754, 1, 0, 0.2039216, 1,
1.866655, 0.486035, 0.4379286, 1, 0, 0.1960784, 1,
1.920776, 0.2372888, 0.8245174, 1, 0, 0.1921569, 1,
1.937802, -1.186639, 3.613963, 1, 0, 0.1843137, 1,
1.98866, 1.119488, 1.209707, 1, 0, 0.1803922, 1,
1.998469, -0.6063958, 1.194973, 1, 0, 0.172549, 1,
2.028507, 1.035037, 1.312677, 1, 0, 0.1686275, 1,
2.030429, -0.9888601, 1.216327, 1, 0, 0.1607843, 1,
2.044426, -0.1932124, 1.791373, 1, 0, 0.1568628, 1,
2.04565, 1.019405, 2.800965, 1, 0, 0.1490196, 1,
2.068777, 0.02251009, 3.332743, 1, 0, 0.145098, 1,
2.144737, 1.210636, 0.6526802, 1, 0, 0.1372549, 1,
2.171595, 1.306046, 1.366936, 1, 0, 0.1333333, 1,
2.191785, -1.366361, 2.223888, 1, 0, 0.1254902, 1,
2.214617, 1.588151, 2.107587, 1, 0, 0.1215686, 1,
2.21628, -0.6142793, 1.557028, 1, 0, 0.1137255, 1,
2.230592, -0.4177471, 1.742661, 1, 0, 0.1098039, 1,
2.276885, -2.060754, 3.094473, 1, 0, 0.1019608, 1,
2.307398, 2.029066, 1.760254, 1, 0, 0.09411765, 1,
2.350252, 0.290944, 0.2272679, 1, 0, 0.09019608, 1,
2.452549, -0.08039738, 1.795578, 1, 0, 0.08235294, 1,
2.462138, -0.6588802, 2.33314, 1, 0, 0.07843138, 1,
2.465451, -0.0835706, 1.275978, 1, 0, 0.07058824, 1,
2.49326, 1.151317, -1.583361, 1, 0, 0.06666667, 1,
2.531324, 0.1338884, 0.9796516, 1, 0, 0.05882353, 1,
2.641777, 1.508283, 0.6608585, 1, 0, 0.05490196, 1,
2.677777, -1.053851, 1.348009, 1, 0, 0.04705882, 1,
2.711582, 0.8780328, 0.7257688, 1, 0, 0.04313726, 1,
2.786337, 0.3998888, 1.865463, 1, 0, 0.03529412, 1,
2.787382, 1.345833, 0.9241062, 1, 0, 0.03137255, 1,
2.877728, -1.073194, 1.462842, 1, 0, 0.02352941, 1,
3.081015, 2.036427, 0.9967939, 1, 0, 0.01960784, 1,
3.109526, 1.12428, 1.101573, 1, 0, 0.01176471, 1,
3.22687, -0.3835809, 1.358348, 1, 0, 0.007843138, 1
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
-0.1001056, -3.875029, -7.352787, 0, -0.5, 0.5, 0.5,
-0.1001056, -3.875029, -7.352787, 1, -0.5, 0.5, 0.5,
-0.1001056, -3.875029, -7.352787, 1, 1.5, 0.5, 0.5,
-0.1001056, -3.875029, -7.352787, 0, 1.5, 0.5, 0.5
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
-4.554926, 0.2129989, -7.352787, 0, -0.5, 0.5, 0.5,
-4.554926, 0.2129989, -7.352787, 1, -0.5, 0.5, 0.5,
-4.554926, 0.2129989, -7.352787, 1, 1.5, 0.5, 0.5,
-4.554926, 0.2129989, -7.352787, 0, 1.5, 0.5, 0.5
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
-4.554926, -3.875029, -0.2132323, 0, -0.5, 0.5, 0.5,
-4.554926, -3.875029, -0.2132323, 1, -0.5, 0.5, 0.5,
-4.554926, -3.875029, -0.2132323, 1, 1.5, 0.5, 0.5,
-4.554926, -3.875029, -0.2132323, 0, 1.5, 0.5, 0.5
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
-3, -2.931638, -5.705197,
3, -2.931638, -5.705197,
-3, -2.931638, -5.705197,
-3, -3.08887, -5.979795,
-2, -2.931638, -5.705197,
-2, -3.08887, -5.979795,
-1, -2.931638, -5.705197,
-1, -3.08887, -5.979795,
0, -2.931638, -5.705197,
0, -3.08887, -5.979795,
1, -2.931638, -5.705197,
1, -3.08887, -5.979795,
2, -2.931638, -5.705197,
2, -3.08887, -5.979795,
3, -2.931638, -5.705197,
3, -3.08887, -5.979795
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
-3, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
-3, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
-3, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
-3, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
-2, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
-2, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
-2, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
-2, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
-1, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
-1, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
-1, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
-1, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
0, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
0, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
0, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
0, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
1, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
1, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
1, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
1, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
2, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
2, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
2, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
2, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5,
3, -3.403334, -6.528992, 0, -0.5, 0.5, 0.5,
3, -3.403334, -6.528992, 1, -0.5, 0.5, 0.5,
3, -3.403334, -6.528992, 1, 1.5, 0.5, 0.5,
3, -3.403334, -6.528992, 0, 1.5, 0.5, 0.5
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
-3.526891, -2, -5.705197,
-3.526891, 3, -5.705197,
-3.526891, -2, -5.705197,
-3.69823, -2, -5.979795,
-3.526891, -1, -5.705197,
-3.69823, -1, -5.979795,
-3.526891, 0, -5.705197,
-3.69823, 0, -5.979795,
-3.526891, 1, -5.705197,
-3.69823, 1, -5.979795,
-3.526891, 2, -5.705197,
-3.69823, 2, -5.979795,
-3.526891, 3, -5.705197,
-3.69823, 3, -5.979795
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
-4.040909, -2, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, -2, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, -2, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, -2, -6.528992, 0, 1.5, 0.5, 0.5,
-4.040909, -1, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, -1, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, -1, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, -1, -6.528992, 0, 1.5, 0.5, 0.5,
-4.040909, 0, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, 0, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, 0, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, 0, -6.528992, 0, 1.5, 0.5, 0.5,
-4.040909, 1, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, 1, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, 1, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, 1, -6.528992, 0, 1.5, 0.5, 0.5,
-4.040909, 2, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, 2, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, 2, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, 2, -6.528992, 0, 1.5, 0.5, 0.5,
-4.040909, 3, -6.528992, 0, -0.5, 0.5, 0.5,
-4.040909, 3, -6.528992, 1, -0.5, 0.5, 0.5,
-4.040909, 3, -6.528992, 1, 1.5, 0.5, 0.5,
-4.040909, 3, -6.528992, 0, 1.5, 0.5, 0.5
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
-3.526891, -2.931638, -4,
-3.526891, -2.931638, 4,
-3.526891, -2.931638, -4,
-3.69823, -3.08887, -4,
-3.526891, -2.931638, -2,
-3.69823, -3.08887, -2,
-3.526891, -2.931638, 0,
-3.69823, -3.08887, 0,
-3.526891, -2.931638, 2,
-3.69823, -3.08887, 2,
-3.526891, -2.931638, 4,
-3.69823, -3.08887, 4
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
-4.040909, -3.403334, -4, 0, -0.5, 0.5, 0.5,
-4.040909, -3.403334, -4, 1, -0.5, 0.5, 0.5,
-4.040909, -3.403334, -4, 1, 1.5, 0.5, 0.5,
-4.040909, -3.403334, -4, 0, 1.5, 0.5, 0.5,
-4.040909, -3.403334, -2, 0, -0.5, 0.5, 0.5,
-4.040909, -3.403334, -2, 1, -0.5, 0.5, 0.5,
-4.040909, -3.403334, -2, 1, 1.5, 0.5, 0.5,
-4.040909, -3.403334, -2, 0, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 0, 0, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 0, 1, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 0, 1, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 0, 0, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 2, 0, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 2, 1, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 2, 1, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 2, 0, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 4, 0, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 4, 1, -0.5, 0.5, 0.5,
-4.040909, -3.403334, 4, 1, 1.5, 0.5, 0.5,
-4.040909, -3.403334, 4, 0, 1.5, 0.5, 0.5
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
-3.526891, -2.931638, -5.705197,
-3.526891, 3.357636, -5.705197,
-3.526891, -2.931638, 5.278733,
-3.526891, 3.357636, 5.278733,
-3.526891, -2.931638, -5.705197,
-3.526891, -2.931638, 5.278733,
-3.526891, 3.357636, -5.705197,
-3.526891, 3.357636, 5.278733,
-3.526891, -2.931638, -5.705197,
3.326679, -2.931638, -5.705197,
-3.526891, -2.931638, 5.278733,
3.326679, -2.931638, 5.278733,
-3.526891, 3.357636, -5.705197,
3.326679, 3.357636, -5.705197,
-3.526891, 3.357636, 5.278733,
3.326679, 3.357636, 5.278733,
3.326679, -2.931638, -5.705197,
3.326679, 3.357636, -5.705197,
3.326679, -2.931638, 5.278733,
3.326679, 3.357636, 5.278733,
3.326679, -2.931638, -5.705197,
3.326679, -2.931638, 5.278733,
3.326679, 3.357636, -5.705197,
3.326679, 3.357636, 5.278733
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
var radius = 7.685854;
var distance = 34.19524;
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
mvMatrix.translate( 0.1001056, -0.2129989, 0.2132323 );
mvMatrix.scale( 1.212521, 1.321312, 0.7565686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19524);
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
1-naphthol<-read.table("1-naphthol.xyz")
```

```
## Error in read.table("1-naphthol.xyz"): no lines available in input
```

```r
x<-1-naphthol$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthol' not found
```

```r
y<-1-naphthol$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthol' not found
```

```r
z<-1-naphthol$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthol' not found
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
-3.427082, -0.4150771, -0.170764, 0, 0, 1, 1, 1,
-2.706121, 0.3395805, -0.6598058, 1, 0, 0, 1, 1,
-2.682621, 1.014981, -0.7555081, 1, 0, 0, 1, 1,
-2.574579, 1.333073, 1.454267, 1, 0, 0, 1, 1,
-2.506673, -1.115617, 0.3526767, 1, 0, 0, 1, 1,
-2.388864, 0.2672692, -0.5585792, 1, 0, 0, 1, 1,
-2.318267, 0.4752653, -1.214217, 0, 0, 0, 1, 1,
-2.299717, -1.329407, -1.160479, 0, 0, 0, 1, 1,
-2.298958, -0.2489527, -0.3484794, 0, 0, 0, 1, 1,
-2.298867, 1.301588, -0.06240058, 0, 0, 0, 1, 1,
-2.257324, 1.513915, -0.4118556, 0, 0, 0, 1, 1,
-2.245006, -1.267369, -3.673338, 0, 0, 0, 1, 1,
-2.241461, 0.5217763, -0.4103844, 0, 0, 0, 1, 1,
-2.208815, 1.017874, 0.1196475, 1, 1, 1, 1, 1,
-2.19998, 1.670952, 0.5014875, 1, 1, 1, 1, 1,
-2.187237, 1.478781, -0.3035103, 1, 1, 1, 1, 1,
-2.180194, 1.210264, -1.462081, 1, 1, 1, 1, 1,
-2.144515, 0.7440057, -0.9288664, 1, 1, 1, 1, 1,
-2.134767, -2.840047, -2.368613, 1, 1, 1, 1, 1,
-2.132229, -0.418831, -3.041841, 1, 1, 1, 1, 1,
-2.124458, -0.838758, -1.492605, 1, 1, 1, 1, 1,
-2.094099, -0.536411, -1.518274, 1, 1, 1, 1, 1,
-2.081786, 1.856121, -0.6124851, 1, 1, 1, 1, 1,
-2.065926, -1.16788, -0.7159027, 1, 1, 1, 1, 1,
-1.996459, 0.7514752, -1.874543, 1, 1, 1, 1, 1,
-1.954229, 1.101818, -0.2916045, 1, 1, 1, 1, 1,
-1.935777, 2.18378, -1.20363, 1, 1, 1, 1, 1,
-1.93223, -0.5732377, -2.102592, 1, 1, 1, 1, 1,
-1.915271, 1.483516, -1.584439, 0, 0, 1, 1, 1,
-1.866158, 0.435867, -0.9708022, 1, 0, 0, 1, 1,
-1.850049, -0.9562547, -1.623071, 1, 0, 0, 1, 1,
-1.844091, 1.196013, -0.5789108, 1, 0, 0, 1, 1,
-1.83601, -0.1938254, -1.637855, 1, 0, 0, 1, 1,
-1.827128, -0.2560669, -1.736866, 1, 0, 0, 1, 1,
-1.810401, -0.2913338, -3.130513, 0, 0, 0, 1, 1,
-1.804944, 0.6680942, -0.5053231, 0, 0, 0, 1, 1,
-1.800377, -0.9360454, -1.159773, 0, 0, 0, 1, 1,
-1.781168, -0.9309613, -1.430308, 0, 0, 0, 1, 1,
-1.775598, -0.5924099, -2.194406, 0, 0, 0, 1, 1,
-1.769293, 1.871475, -2.064931, 0, 0, 0, 1, 1,
-1.762047, 1.240151, -0.8434817, 0, 0, 0, 1, 1,
-1.756558, -0.6447883, -1.618723, 1, 1, 1, 1, 1,
-1.751719, 1.421389, -1.11034, 1, 1, 1, 1, 1,
-1.735919, 0.7167993, -1.735086, 1, 1, 1, 1, 1,
-1.707157, -1.033551, -1.631935, 1, 1, 1, 1, 1,
-1.697676, -0.1771655, -1.19377, 1, 1, 1, 1, 1,
-1.682786, -0.7804723, -2.699968, 1, 1, 1, 1, 1,
-1.673186, -1.183982, -1.639983, 1, 1, 1, 1, 1,
-1.65419, 0.5162234, -0.994839, 1, 1, 1, 1, 1,
-1.648183, -1.019775, -0.9943691, 1, 1, 1, 1, 1,
-1.635227, -0.8537675, -2.405042, 1, 1, 1, 1, 1,
-1.586734, -0.1088439, -1.925879, 1, 1, 1, 1, 1,
-1.577511, -1.024617, -1.245642, 1, 1, 1, 1, 1,
-1.570062, 1.174627, -0.7330992, 1, 1, 1, 1, 1,
-1.562753, 0.8422583, -1.758525, 1, 1, 1, 1, 1,
-1.562447, -1.26215, -3.240813, 1, 1, 1, 1, 1,
-1.556998, 0.620969, -0.1137661, 0, 0, 1, 1, 1,
-1.542117, 0.1460693, -0.8352327, 1, 0, 0, 1, 1,
-1.541836, 0.6944631, -1.677127, 1, 0, 0, 1, 1,
-1.537205, -0.5086074, -1.203166, 1, 0, 0, 1, 1,
-1.527737, -1.233235, -2.741246, 1, 0, 0, 1, 1,
-1.525724, -0.1320802, -3.185142, 1, 0, 0, 1, 1,
-1.51289, 1.687028, -0.09098906, 0, 0, 0, 1, 1,
-1.511233, -0.3847795, -2.769493, 0, 0, 0, 1, 1,
-1.509084, 0.1415154, -1.719454, 0, 0, 0, 1, 1,
-1.50092, 0.7176527, -2.363833, 0, 0, 0, 1, 1,
-1.486388, 0.01075283, -2.483017, 0, 0, 0, 1, 1,
-1.482904, -0.7746525, -3.201497, 0, 0, 0, 1, 1,
-1.477447, 0.7451802, -1.728541, 0, 0, 0, 1, 1,
-1.475712, 0.05029047, -2.249322, 1, 1, 1, 1, 1,
-1.471249, -0.3804865, -0.8791931, 1, 1, 1, 1, 1,
-1.468057, 0.7882528, -2.474156, 1, 1, 1, 1, 1,
-1.454971, -1.315264, -2.821541, 1, 1, 1, 1, 1,
-1.445439, 0.1046915, -2.296222, 1, 1, 1, 1, 1,
-1.441913, -0.1064181, -1.689161, 1, 1, 1, 1, 1,
-1.43916, 0.2819084, -1.81202, 1, 1, 1, 1, 1,
-1.434436, -0.5688937, -1.194981, 1, 1, 1, 1, 1,
-1.422612, -1.171211, -2.257312, 1, 1, 1, 1, 1,
-1.400494, 0.506579, -1.546941, 1, 1, 1, 1, 1,
-1.400089, -0.07464015, -2.671816, 1, 1, 1, 1, 1,
-1.385345, 2.34515, -0.5802412, 1, 1, 1, 1, 1,
-1.383836, -0.01217121, -2.828772, 1, 1, 1, 1, 1,
-1.368483, -1.565031, -2.233743, 1, 1, 1, 1, 1,
-1.365087, 1.772957, 0.3412325, 1, 1, 1, 1, 1,
-1.361517, 1.292853, -0.5728169, 0, 0, 1, 1, 1,
-1.360613, -1.498709, -2.347202, 1, 0, 0, 1, 1,
-1.356463, -0.3251851, -0.2722054, 1, 0, 0, 1, 1,
-1.355586, -0.8794243, -1.020588, 1, 0, 0, 1, 1,
-1.35279, -0.9263788, -2.626039, 1, 0, 0, 1, 1,
-1.351458, 0.1241447, -1.819609, 1, 0, 0, 1, 1,
-1.349708, -0.4236881, -1.542865, 0, 0, 0, 1, 1,
-1.338304, 0.0005339009, -0.612049, 0, 0, 0, 1, 1,
-1.331682, 0.5098398, -1.066827, 0, 0, 0, 1, 1,
-1.325296, -0.4049592, -1.64096, 0, 0, 0, 1, 1,
-1.323229, 1.071087, -0.5259334, 0, 0, 0, 1, 1,
-1.309606, -1.213492, -3.003852, 0, 0, 0, 1, 1,
-1.302915, 0.7723212, -0.4909348, 0, 0, 0, 1, 1,
-1.294057, 0.9420891, -0.9748359, 1, 1, 1, 1, 1,
-1.288396, 0.4564877, -0.04805691, 1, 1, 1, 1, 1,
-1.277158, 0.5264567, -0.7391642, 1, 1, 1, 1, 1,
-1.276731, -0.2385662, -1.062344, 1, 1, 1, 1, 1,
-1.272272, 0.7522092, -0.5413699, 1, 1, 1, 1, 1,
-1.264747, -0.8536049, -3.183914, 1, 1, 1, 1, 1,
-1.257026, -0.9118672, -2.571877, 1, 1, 1, 1, 1,
-1.253204, -1.294029, -2.328354, 1, 1, 1, 1, 1,
-1.245823, 1.196817, 0.3213076, 1, 1, 1, 1, 1,
-1.244626, -1.180488, -2.360727, 1, 1, 1, 1, 1,
-1.234454, -0.460041, -2.866316, 1, 1, 1, 1, 1,
-1.232528, 1.420017, -1.71203, 1, 1, 1, 1, 1,
-1.22253, -0.09445148, -2.028218, 1, 1, 1, 1, 1,
-1.219842, 1.516271, -1.617595, 1, 1, 1, 1, 1,
-1.218491, -0.3034263, -2.32972, 1, 1, 1, 1, 1,
-1.218217, -1.162202, -3.305911, 0, 0, 1, 1, 1,
-1.217175, -0.7704709, -1.980726, 1, 0, 0, 1, 1,
-1.204244, -0.3436037, -2.360403, 1, 0, 0, 1, 1,
-1.195565, -0.1156235, -3.141264, 1, 0, 0, 1, 1,
-1.193748, 0.8931057, -0.1602604, 1, 0, 0, 1, 1,
-1.191149, 1.088129, -0.4617774, 1, 0, 0, 1, 1,
-1.190262, -0.4657743, -1.746332, 0, 0, 0, 1, 1,
-1.185749, -1.10519, -2.606238, 0, 0, 0, 1, 1,
-1.184878, 1.529235, -1.472219, 0, 0, 0, 1, 1,
-1.182486, -1.076819, -1.961912, 0, 0, 0, 1, 1,
-1.176187, 1.428063, -0.7423571, 0, 0, 0, 1, 1,
-1.1563, 0.4552059, -1.432259, 0, 0, 0, 1, 1,
-1.139914, 0.6868223, -0.4890655, 0, 0, 0, 1, 1,
-1.139847, 1.227341, -2.187127, 1, 1, 1, 1, 1,
-1.138951, 1.028676, -1.652825, 1, 1, 1, 1, 1,
-1.137179, 1.582597, -0.2512501, 1, 1, 1, 1, 1,
-1.13612, 1.739042, -2.759167, 1, 1, 1, 1, 1,
-1.127794, -0.6972973, -2.533143, 1, 1, 1, 1, 1,
-1.117594, 0.4677342, -2.17228, 1, 1, 1, 1, 1,
-1.114059, 0.8845281, 0.2282999, 1, 1, 1, 1, 1,
-1.11262, 0.3915465, -0.05894189, 1, 1, 1, 1, 1,
-1.110172, -0.6362108, -1.292642, 1, 1, 1, 1, 1,
-1.101619, 1.530309, 0.2793437, 1, 1, 1, 1, 1,
-1.097795, 0.3373238, -2.870981, 1, 1, 1, 1, 1,
-1.095649, -0.7044795, -4.147977, 1, 1, 1, 1, 1,
-1.094573, -1.577472, -3.650064, 1, 1, 1, 1, 1,
-1.09409, -0.1010896, -1.483221, 1, 1, 1, 1, 1,
-1.089819, -1.081664, -2.587191, 1, 1, 1, 1, 1,
-1.083494, 0.9416535, 0.08853067, 0, 0, 1, 1, 1,
-1.077008, -0.066373, -2.704533, 1, 0, 0, 1, 1,
-1.073494, 0.02310145, -2.373875, 1, 0, 0, 1, 1,
-1.07257, 2.384816, -1.672127, 1, 0, 0, 1, 1,
-1.07222, 1.212096, -1.811546, 1, 0, 0, 1, 1,
-1.057389, -0.3113106, -1.974899, 1, 0, 0, 1, 1,
-1.044153, 1.641276, -0.9138548, 0, 0, 0, 1, 1,
-1.036715, -0.01893011, 0.4174718, 0, 0, 0, 1, 1,
-1.034477, -0.3301579, -3.51518, 0, 0, 0, 1, 1,
-1.024617, 0.03908096, -1.245259, 0, 0, 0, 1, 1,
-1.018281, -1.042962, -2.157367, 0, 0, 0, 1, 1,
-1.017838, 0.4580503, -1.100309, 0, 0, 0, 1, 1,
-1.001212, -0.6763315, -2.131247, 0, 0, 0, 1, 1,
-0.9997072, 0.4164723, -0.133664, 1, 1, 1, 1, 1,
-0.9928315, -1.032125, -1.745994, 1, 1, 1, 1, 1,
-0.9855728, 0.3447329, -0.1307806, 1, 1, 1, 1, 1,
-0.9849672, -0.3062243, -2.000864, 1, 1, 1, 1, 1,
-0.9840389, 1.788393, -0.1833158, 1, 1, 1, 1, 1,
-0.9822953, -0.271289, -3.084858, 1, 1, 1, 1, 1,
-0.9795187, 1.47124, 0.01477144, 1, 1, 1, 1, 1,
-0.9737466, -0.03535789, -3.372792, 1, 1, 1, 1, 1,
-0.9722777, 0.3245659, -1.983738, 1, 1, 1, 1, 1,
-0.9668715, 0.2159466, -0.8664802, 1, 1, 1, 1, 1,
-0.9657809, 0.7295782, -2.82513, 1, 1, 1, 1, 1,
-0.9634839, -1.198408, -0.9724872, 1, 1, 1, 1, 1,
-0.9629298, -0.911718, -3.56768, 1, 1, 1, 1, 1,
-0.9578973, -0.3455788, -0.6901781, 1, 1, 1, 1, 1,
-0.9552494, 1.003427, -0.686443, 1, 1, 1, 1, 1,
-0.9535386, -0.5729815, -2.233472, 0, 0, 1, 1, 1,
-0.9530518, 0.5172778, -1.563106, 1, 0, 0, 1, 1,
-0.9526014, 2.05337, -0.1316225, 1, 0, 0, 1, 1,
-0.9501171, -0.3198502, -1.066097, 1, 0, 0, 1, 1,
-0.9441211, 0.1856919, -0.3365144, 1, 0, 0, 1, 1,
-0.9410885, 0.5998167, 0.6258666, 1, 0, 0, 1, 1,
-0.9395879, -1.106255, -3.826041, 0, 0, 0, 1, 1,
-0.9368554, -0.2371337, -1.191002, 0, 0, 0, 1, 1,
-0.9367546, -0.239522, -1.434264, 0, 0, 0, 1, 1,
-0.926213, 0.7089161, -3.110287, 0, 0, 0, 1, 1,
-0.9181542, -0.3120998, -1.610963, 0, 0, 0, 1, 1,
-0.9174267, -0.3813846, -2.429971, 0, 0, 0, 1, 1,
-0.9159712, -0.06771122, -1.360459, 0, 0, 0, 1, 1,
-0.9158117, -0.4655563, -0.9933861, 1, 1, 1, 1, 1,
-0.9152265, -0.3548944, -2.540177, 1, 1, 1, 1, 1,
-0.9129053, 0.5138785, 0.1944948, 1, 1, 1, 1, 1,
-0.912748, -0.705633, -0.4163329, 1, 1, 1, 1, 1,
-0.9099835, 1.65948, -1.325744, 1, 1, 1, 1, 1,
-0.9080846, -1.190655, -3.62898, 1, 1, 1, 1, 1,
-0.9004164, -1.578619, -4.164728, 1, 1, 1, 1, 1,
-0.899214, 1.778428, -1.02018, 1, 1, 1, 1, 1,
-0.8837004, 1.349781, -0.5871015, 1, 1, 1, 1, 1,
-0.8833221, 0.2848417, -1.17778, 1, 1, 1, 1, 1,
-0.8771998, 0.2949572, -2.629102, 1, 1, 1, 1, 1,
-0.8770967, 0.4255517, -1.565781, 1, 1, 1, 1, 1,
-0.8758158, 0.185188, -1.170416, 1, 1, 1, 1, 1,
-0.8740356, 1.44025, -0.2626589, 1, 1, 1, 1, 1,
-0.8730229, 0.03264612, -0.4294091, 1, 1, 1, 1, 1,
-0.867502, -0.4578801, -1.828828, 0, 0, 1, 1, 1,
-0.8650171, -0.1643189, 0.4456903, 1, 0, 0, 1, 1,
-0.8628008, -0.2215565, -1.198931, 1, 0, 0, 1, 1,
-0.8606293, 0.1974241, -1.315031, 1, 0, 0, 1, 1,
-0.8536724, -1.845948, -1.812988, 1, 0, 0, 1, 1,
-0.8531479, 0.2330971, -2.769931, 1, 0, 0, 1, 1,
-0.8457035, 1.429927, 0.7045286, 0, 0, 0, 1, 1,
-0.8446754, -1.628692, -3.361775, 0, 0, 0, 1, 1,
-0.8410815, 0.8320716, 0.5811742, 0, 0, 0, 1, 1,
-0.8407813, -0.6898074, -2.705964, 0, 0, 0, 1, 1,
-0.8389354, -0.3900153, -2.375731, 0, 0, 0, 1, 1,
-0.838551, -2.326859, -3.931209, 0, 0, 0, 1, 1,
-0.837709, -0.4712295, -3.01335, 0, 0, 0, 1, 1,
-0.8333515, 0.5759921, 0.7339668, 1, 1, 1, 1, 1,
-0.8317355, -0.2001511, -1.771181, 1, 1, 1, 1, 1,
-0.8195783, -0.3614011, -1.137362, 1, 1, 1, 1, 1,
-0.8195115, 1.157514, -1.519935, 1, 1, 1, 1, 1,
-0.8180403, -1.978978, -2.487167, 1, 1, 1, 1, 1,
-0.812887, 0.09062795, -0.3319335, 1, 1, 1, 1, 1,
-0.8117814, -1.975715, -3.084774, 1, 1, 1, 1, 1,
-0.804332, -1.171162, -4.425132, 1, 1, 1, 1, 1,
-0.7975345, 0.6332191, -2.26941, 1, 1, 1, 1, 1,
-0.7885998, 1.167472, -1.221926, 1, 1, 1, 1, 1,
-0.7864008, 0.8612351, -1.940308, 1, 1, 1, 1, 1,
-0.7831371, 0.3729978, -1.815153, 1, 1, 1, 1, 1,
-0.7801162, -1.662586, -5.201634, 1, 1, 1, 1, 1,
-0.7799955, 0.9542369, -1.51422, 1, 1, 1, 1, 1,
-0.7782095, 0.4164649, 0.424453, 1, 1, 1, 1, 1,
-0.7764987, 0.1420137, -1.273226, 0, 0, 1, 1, 1,
-0.7737525, 0.3438552, 0.8325194, 1, 0, 0, 1, 1,
-0.769616, 0.2194116, -1.882049, 1, 0, 0, 1, 1,
-0.7688811, 2.245037, -1.1334, 1, 0, 0, 1, 1,
-0.7676744, 0.6622609, -2.566121, 1, 0, 0, 1, 1,
-0.7663654, 0.004772151, -2.172563, 1, 0, 0, 1, 1,
-0.7592863, -0.7337649, -2.955166, 0, 0, 0, 1, 1,
-0.7588947, 2.108057, 0.1148174, 0, 0, 0, 1, 1,
-0.7566851, -1.16388, -3.395926, 0, 0, 0, 1, 1,
-0.7554954, -1.656206, -1.711107, 0, 0, 0, 1, 1,
-0.7519509, -0.2257979, -2.419801, 0, 0, 0, 1, 1,
-0.7488374, 0.9854183, 0.1781421, 0, 0, 0, 1, 1,
-0.7485445, -0.5823601, -2.595156, 0, 0, 0, 1, 1,
-0.7462363, -0.352446, -2.120909, 1, 1, 1, 1, 1,
-0.7444043, 1.46947, -1.296722, 1, 1, 1, 1, 1,
-0.7439857, 1.586042, -0.6902841, 1, 1, 1, 1, 1,
-0.7430727, -0.8838733, -2.253473, 1, 1, 1, 1, 1,
-0.7414612, 0.5205669, -1.089753, 1, 1, 1, 1, 1,
-0.7410756, 0.6652803, -1.324337, 1, 1, 1, 1, 1,
-0.7329441, 0.3017986, -0.02582228, 1, 1, 1, 1, 1,
-0.7307466, -1.07987, -1.293126, 1, 1, 1, 1, 1,
-0.7294124, 0.7077716, -0.4902926, 1, 1, 1, 1, 1,
-0.7189814, -0.545786, -3.050633, 1, 1, 1, 1, 1,
-0.7150264, -0.219161, -1.979058, 1, 1, 1, 1, 1,
-0.7050782, -0.4638686, -2.950938, 1, 1, 1, 1, 1,
-0.7002972, 0.008171059, -0.8983573, 1, 1, 1, 1, 1,
-0.6967674, -0.4436255, -2.810046, 1, 1, 1, 1, 1,
-0.6897412, -0.4015616, -0.7780471, 1, 1, 1, 1, 1,
-0.6877403, 0.8242326, 0.536745, 0, 0, 1, 1, 1,
-0.6843835, -0.3807369, -3.848138, 1, 0, 0, 1, 1,
-0.6813675, 0.926665, 1.021968, 1, 0, 0, 1, 1,
-0.6660898, 0.373905, 0.7593051, 1, 0, 0, 1, 1,
-0.6642907, 2.1744, -1.693041, 1, 0, 0, 1, 1,
-0.6617014, 0.09683765, -2.67362, 1, 0, 0, 1, 1,
-0.6549478, -0.1020936, -2.074148, 0, 0, 0, 1, 1,
-0.6491919, -1.813691, -2.561157, 0, 0, 0, 1, 1,
-0.6429317, -0.7748586, -3.274358, 0, 0, 0, 1, 1,
-0.6360676, 0.04459887, -0.168515, 0, 0, 0, 1, 1,
-0.6304975, -0.6615932, -0.4004624, 0, 0, 0, 1, 1,
-0.6264085, -0.2939385, -2.963392, 0, 0, 0, 1, 1,
-0.6255939, 0.3594463, -1.987183, 0, 0, 0, 1, 1,
-0.6247502, -0.5726284, -1.501074, 1, 1, 1, 1, 1,
-0.6239, 0.6445649, -2.002381, 1, 1, 1, 1, 1,
-0.6222772, -0.6786149, -1.810545, 1, 1, 1, 1, 1,
-0.6208647, -0.1702817, -2.270414, 1, 1, 1, 1, 1,
-0.6178097, 0.4190396, -3.446008, 1, 1, 1, 1, 1,
-0.6157486, -0.2064114, -1.976238, 1, 1, 1, 1, 1,
-0.6152344, 1.102563, -0.3663699, 1, 1, 1, 1, 1,
-0.6106889, -0.6828215, -2.507114, 1, 1, 1, 1, 1,
-0.6081283, -0.9511302, -3.8632, 1, 1, 1, 1, 1,
-0.6071521, 1.159134, 0.8633851, 1, 1, 1, 1, 1,
-0.6058522, 0.2499313, -0.6220367, 1, 1, 1, 1, 1,
-0.6034828, -0.6370632, -2.275309, 1, 1, 1, 1, 1,
-0.6030509, -0.533185, -2.713604, 1, 1, 1, 1, 1,
-0.600615, -2.529313, -3.840384, 1, 1, 1, 1, 1,
-0.6000202, -1.045941, -3.200486, 1, 1, 1, 1, 1,
-0.5982962, 1.164234, -0.3883657, 0, 0, 1, 1, 1,
-0.5980315, -0.6078795, -0.3442885, 1, 0, 0, 1, 1,
-0.597645, 0.5533463, -2.212681, 1, 0, 0, 1, 1,
-0.5965753, 0.4789528, -3.63029, 1, 0, 0, 1, 1,
-0.5957748, -0.7721313, -3.481609, 1, 0, 0, 1, 1,
-0.5892116, 0.4316511, -0.8293388, 1, 0, 0, 1, 1,
-0.5889382, -1.5927, -3.441644, 0, 0, 0, 1, 1,
-0.5846139, 1.432028, 0.5411206, 0, 0, 0, 1, 1,
-0.5838311, 1.415911, -0.9137229, 0, 0, 0, 1, 1,
-0.5812788, 1.821635, -0.5925675, 0, 0, 0, 1, 1,
-0.5750573, 0.2168965, -0.03510703, 0, 0, 0, 1, 1,
-0.5605717, -2.00811, -2.323211, 0, 0, 0, 1, 1,
-0.5582674, -0.9340488, -2.408023, 0, 0, 0, 1, 1,
-0.5568744, 0.2774136, -1.540121, 1, 1, 1, 1, 1,
-0.5535044, -0.9782486, -1.969488, 1, 1, 1, 1, 1,
-0.5425681, -0.2127485, -0.780653, 1, 1, 1, 1, 1,
-0.5408679, 0.343296, -2.386564, 1, 1, 1, 1, 1,
-0.5390905, 1.389729, -1.530115, 1, 1, 1, 1, 1,
-0.5379634, 3.266045, 1.135099, 1, 1, 1, 1, 1,
-0.537651, -0.8470806, -1.715552, 1, 1, 1, 1, 1,
-0.5361326, 0.7251327, 0.5853102, 1, 1, 1, 1, 1,
-0.5343494, -0.8494027, -4.279342, 1, 1, 1, 1, 1,
-0.5329797, -0.6185595, -2.419607, 1, 1, 1, 1, 1,
-0.524944, -0.0006521548, -0.08563547, 1, 1, 1, 1, 1,
-0.5236666, 0.6573417, -0.5387489, 1, 1, 1, 1, 1,
-0.5183812, -1.833385, -2.698143, 1, 1, 1, 1, 1,
-0.516259, -0.7400492, -2.484538, 1, 1, 1, 1, 1,
-0.5137604, -1.766424, -4.366193, 1, 1, 1, 1, 1,
-0.5120659, -1.458221, -1.479305, 0, 0, 1, 1, 1,
-0.5113643, -1.450987, -4.011067, 1, 0, 0, 1, 1,
-0.5075049, -0.9786473, -3.890027, 1, 0, 0, 1, 1,
-0.5013384, 0.4108243, -1.469388, 1, 0, 0, 1, 1,
-0.5010781, -1.433995, -1.683628, 1, 0, 0, 1, 1,
-0.4972757, -0.4164124, -3.068288, 1, 0, 0, 1, 1,
-0.4948772, 0.7597399, 1.936363, 0, 0, 0, 1, 1,
-0.4931194, -0.3237403, -1.34812, 0, 0, 0, 1, 1,
-0.492453, -0.3904099, 0.1609644, 0, 0, 0, 1, 1,
-0.4721192, 0.3674442, -1.752374, 0, 0, 0, 1, 1,
-0.4663545, 0.9112493, -2.192257, 0, 0, 0, 1, 1,
-0.4628787, 0.05711503, -3.046236, 0, 0, 0, 1, 1,
-0.4584011, -0.6194535, -1.614349, 0, 0, 0, 1, 1,
-0.4564482, 1.122742, 0.1963032, 1, 1, 1, 1, 1,
-0.4559054, 0.8635019, 0.4121736, 1, 1, 1, 1, 1,
-0.4556146, 0.2654023, -2.431782, 1, 1, 1, 1, 1,
-0.4546547, -0.2064688, -3.068679, 1, 1, 1, 1, 1,
-0.4532312, -0.2683934, -5.545237, 1, 1, 1, 1, 1,
-0.4460417, -0.9484842, -1.080538, 1, 1, 1, 1, 1,
-0.4440428, -0.170061, -2.52541, 1, 1, 1, 1, 1,
-0.4382602, -0.7185072, -4.662001, 1, 1, 1, 1, 1,
-0.4342695, -1.986866, -3.216316, 1, 1, 1, 1, 1,
-0.4312079, 0.2577971, -1.293888, 1, 1, 1, 1, 1,
-0.4306728, 0.0758207, -1.265507, 1, 1, 1, 1, 1,
-0.4295097, 0.344262, -2.731466, 1, 1, 1, 1, 1,
-0.4264072, -0.5393993, -1.385214, 1, 1, 1, 1, 1,
-0.4250564, -0.2621121, -1.562883, 1, 1, 1, 1, 1,
-0.4230003, -1.54492, -2.715934, 1, 1, 1, 1, 1,
-0.4189475, 1.397054, -0.6597996, 0, 0, 1, 1, 1,
-0.4172168, 0.4158649, -1.242493, 1, 0, 0, 1, 1,
-0.4159331, -0.4160372, -2.07753, 1, 0, 0, 1, 1,
-0.4119724, 0.08023477, -2.224334, 1, 0, 0, 1, 1,
-0.407649, 0.701297, -0.1778645, 1, 0, 0, 1, 1,
-0.4071556, -1.137473, -1.861139, 1, 0, 0, 1, 1,
-0.4067532, 1.302971, -1.127606, 0, 0, 0, 1, 1,
-0.4050232, 1.33615, 0.9544981, 0, 0, 0, 1, 1,
-0.4040091, 0.5545347, 0.2559649, 0, 0, 0, 1, 1,
-0.4033266, 1.040287, 1.052307, 0, 0, 0, 1, 1,
-0.4019085, -0.8691946, -3.759457, 0, 0, 0, 1, 1,
-0.3987727, -1.31431, -4.577469, 0, 0, 0, 1, 1,
-0.3978527, -1.110231, -2.574124, 0, 0, 0, 1, 1,
-0.3976475, 1.180857, 0.8565412, 1, 1, 1, 1, 1,
-0.3973978, -0.03470948, -1.557692, 1, 1, 1, 1, 1,
-0.396809, -1.607192, 0.02579375, 1, 1, 1, 1, 1,
-0.3896505, -0.5830146, -2.44256, 1, 1, 1, 1, 1,
-0.3884034, 0.5874339, -0.5447724, 1, 1, 1, 1, 1,
-0.3852981, -0.1585559, -2.457279, 1, 1, 1, 1, 1,
-0.3831146, -0.6253821, -3.393769, 1, 1, 1, 1, 1,
-0.3827294, 0.3920254, -1.321304, 1, 1, 1, 1, 1,
-0.3770793, -0.7516136, -3.865468, 1, 1, 1, 1, 1,
-0.3759248, -0.3901537, -0.6424727, 1, 1, 1, 1, 1,
-0.3752017, 1.588893, -0.06606381, 1, 1, 1, 1, 1,
-0.3659048, -0.6029057, -2.102557, 1, 1, 1, 1, 1,
-0.3657515, 0.9359388, 0.09158134, 1, 1, 1, 1, 1,
-0.3638667, -1.678311, -2.336816, 1, 1, 1, 1, 1,
-0.3618805, -1.626676, -4.239641, 1, 1, 1, 1, 1,
-0.3580994, 0.3188809, -2.465387, 0, 0, 1, 1, 1,
-0.3543125, 0.3116667, -0.1562192, 1, 0, 0, 1, 1,
-0.354207, 0.3837013, -0.1218499, 1, 0, 0, 1, 1,
-0.3505143, -0.3596355, -3.04373, 1, 0, 0, 1, 1,
-0.350065, -0.1148375, -2.08973, 1, 0, 0, 1, 1,
-0.3467049, -1.373553, -3.219948, 1, 0, 0, 1, 1,
-0.3441722, 0.2683041, 0.3477983, 0, 0, 0, 1, 1,
-0.3431928, 1.433591, -1.122728, 0, 0, 0, 1, 1,
-0.3423611, 1.556033, -0.5386118, 0, 0, 0, 1, 1,
-0.3386931, 0.5630361, -0.6123497, 0, 0, 0, 1, 1,
-0.3323583, 0.2597414, -1.021305, 0, 0, 0, 1, 1,
-0.3316272, 0.4064302, -2.258583, 0, 0, 0, 1, 1,
-0.3314775, 0.7769662, 1.310956, 0, 0, 0, 1, 1,
-0.3308769, -0.3187256, -2.310491, 1, 1, 1, 1, 1,
-0.3300959, 2.164015, -0.5624751, 1, 1, 1, 1, 1,
-0.3265056, 0.3284239, -0.7976697, 1, 1, 1, 1, 1,
-0.3174659, -0.5837228, -0.4089614, 1, 1, 1, 1, 1,
-0.3147725, -0.9411995, -2.961457, 1, 1, 1, 1, 1,
-0.3145898, -1.900813, -2.847065, 1, 1, 1, 1, 1,
-0.3122362, 1.034232, 1.986404, 1, 1, 1, 1, 1,
-0.304814, 2.150544, 0.2939647, 1, 1, 1, 1, 1,
-0.3047218, 0.2245128, -0.0002490729, 1, 1, 1, 1, 1,
-0.3031406, 0.4537822, -0.3105474, 1, 1, 1, 1, 1,
-0.3007603, -1.559053, -3.767534, 1, 1, 1, 1, 1,
-0.2972121, -1.813327, -2.857979, 1, 1, 1, 1, 1,
-0.2958246, 0.4839739, -0.8864549, 1, 1, 1, 1, 1,
-0.2917664, 0.2878477, -0.681874, 1, 1, 1, 1, 1,
-0.2858624, 0.1075149, -1.66063, 1, 1, 1, 1, 1,
-0.2848092, 1.651564, -0.0008980121, 0, 0, 1, 1, 1,
-0.2846053, 0.05057417, -0.5570354, 1, 0, 0, 1, 1,
-0.2835642, 1.193052, -1.582914, 1, 0, 0, 1, 1,
-0.2827085, -0.05742759, -2.865046, 1, 0, 0, 1, 1,
-0.275674, 0.2863106, 1.022252, 1, 0, 0, 1, 1,
-0.274283, -0.6934963, -2.453136, 1, 0, 0, 1, 1,
-0.2719271, -0.01105257, 0.1697035, 0, 0, 0, 1, 1,
-0.2678459, 1.626339, 2.86089, 0, 0, 0, 1, 1,
-0.2637321, 1.561049, -1.289521, 0, 0, 0, 1, 1,
-0.262105, 0.9736574, -0.6824881, 0, 0, 0, 1, 1,
-0.2614993, 1.461569, -0.2739376, 0, 0, 0, 1, 1,
-0.2614269, 0.5151857, 2.030887, 0, 0, 0, 1, 1,
-0.2613152, 0.1441869, 0.8124028, 0, 0, 0, 1, 1,
-0.2574499, -0.4326302, -4.53816, 1, 1, 1, 1, 1,
-0.2557866, -0.3914225, -2.543248, 1, 1, 1, 1, 1,
-0.2545448, 1.168291, -0.9574773, 1, 1, 1, 1, 1,
-0.2513504, 0.2739202, -0.2886052, 1, 1, 1, 1, 1,
-0.2509033, 0.4609477, -0.009252386, 1, 1, 1, 1, 1,
-0.2467401, 0.0970818, -0.6508777, 1, 1, 1, 1, 1,
-0.2446492, -0.4967434, -2.273342, 1, 1, 1, 1, 1,
-0.2433756, -0.4325586, -4.265924, 1, 1, 1, 1, 1,
-0.242874, -1.03945, -1.356685, 1, 1, 1, 1, 1,
-0.2408102, 0.3236482, -1.03151, 1, 1, 1, 1, 1,
-0.2383602, -0.5410049, -2.975664, 1, 1, 1, 1, 1,
-0.2358295, 0.1731825, 0.0665499, 1, 1, 1, 1, 1,
-0.2342262, 0.7039239, -0.1734709, 1, 1, 1, 1, 1,
-0.2313482, -0.5498261, -3.216766, 1, 1, 1, 1, 1,
-0.2304479, -0.3237525, -0.1748562, 1, 1, 1, 1, 1,
-0.2290201, -0.01256172, 0.4532632, 0, 0, 1, 1, 1,
-0.225503, -0.205806, -3.769685, 1, 0, 0, 1, 1,
-0.2254648, -2.059808, -3.327868, 1, 0, 0, 1, 1,
-0.2213262, 1.144098, 0.9596689, 1, 0, 0, 1, 1,
-0.2202371, -0.6941566, -3.906518, 1, 0, 0, 1, 1,
-0.2192967, 1.195166, -0.5676271, 1, 0, 0, 1, 1,
-0.2185322, 2.026539, 0.1883541, 0, 0, 0, 1, 1,
-0.2170592, 0.4012743, -1.834215, 0, 0, 0, 1, 1,
-0.2160443, 0.5603334, -1.352802, 0, 0, 0, 1, 1,
-0.2139464, -0.9381735, -4.578299, 0, 0, 0, 1, 1,
-0.2135585, 0.3185606, -0.6183582, 0, 0, 0, 1, 1,
-0.2116083, -0.63864, -2.639785, 0, 0, 0, 1, 1,
-0.2113521, 2.053263, 0.682404, 0, 0, 0, 1, 1,
-0.2036924, 0.350197, -0.01938134, 1, 1, 1, 1, 1,
-0.1976898, 0.3113246, 1.130913, 1, 1, 1, 1, 1,
-0.1974556, -1.139478, -1.56008, 1, 1, 1, 1, 1,
-0.189716, 0.01272751, -1.766509, 1, 1, 1, 1, 1,
-0.1865171, 0.9303434, -1.011302, 1, 1, 1, 1, 1,
-0.1832914, -0.6805552, -2.257308, 1, 1, 1, 1, 1,
-0.1830467, 1.483111, -0.08916581, 1, 1, 1, 1, 1,
-0.1804737, 0.2504048, -1.133466, 1, 1, 1, 1, 1,
-0.1796382, -0.7797524, -2.777508, 1, 1, 1, 1, 1,
-0.1791013, -0.9435249, -3.170232, 1, 1, 1, 1, 1,
-0.1771137, 0.2285796, 0.09732553, 1, 1, 1, 1, 1,
-0.1762334, 0.1261304, -1.053952, 1, 1, 1, 1, 1,
-0.1733275, -2.298962, -4.062105, 1, 1, 1, 1, 1,
-0.1727764, -0.0749727, -1.943907, 1, 1, 1, 1, 1,
-0.1710321, -0.4020178, -2.206177, 1, 1, 1, 1, 1,
-0.1657553, 0.6141092, -1.67711, 0, 0, 1, 1, 1,
-0.1634255, 1.575899, 0.2489066, 1, 0, 0, 1, 1,
-0.1627918, -1.683716, -1.771178, 1, 0, 0, 1, 1,
-0.16022, -1.899328, -2.223247, 1, 0, 0, 1, 1,
-0.1577295, -0.3771223, -2.11516, 1, 0, 0, 1, 1,
-0.1449268, 0.254724, -0.3650034, 1, 0, 0, 1, 1,
-0.1437419, 0.3151799, -1.859976, 0, 0, 0, 1, 1,
-0.1436784, -0.2653756, -2.229112, 0, 0, 0, 1, 1,
-0.143173, -0.69204, -2.585795, 0, 0, 0, 1, 1,
-0.1422424, -0.04823418, -3.188632, 0, 0, 0, 1, 1,
-0.1393924, -0.7764883, -2.96626, 0, 0, 0, 1, 1,
-0.1382925, 1.127799, 0.721088, 0, 0, 0, 1, 1,
-0.1355005, -0.4770086, -3.482146, 0, 0, 0, 1, 1,
-0.133523, -0.1368173, -1.761548, 1, 1, 1, 1, 1,
-0.1328684, 0.3454697, 0.3253712, 1, 1, 1, 1, 1,
-0.1286448, -0.9715703, -2.072747, 1, 1, 1, 1, 1,
-0.1276094, -0.0435974, -1.996038, 1, 1, 1, 1, 1,
-0.1247641, -1.171411, -3.778349, 1, 1, 1, 1, 1,
-0.1243872, 0.9123545, -1.787113, 1, 1, 1, 1, 1,
-0.1243807, -0.1388022, -2.357021, 1, 1, 1, 1, 1,
-0.1153446, -0.2660292, -1.940566, 1, 1, 1, 1, 1,
-0.113707, -0.2696136, -2.802305, 1, 1, 1, 1, 1,
-0.1127176, -0.07936457, -1.789044, 1, 1, 1, 1, 1,
-0.1095277, -0.4148353, -4.077151, 1, 1, 1, 1, 1,
-0.1064558, 0.6491047, 0.984184, 1, 1, 1, 1, 1,
-0.1013445, 0.996837, -0.6710511, 1, 1, 1, 1, 1,
-0.09873715, -0.7896407, -1.399023, 1, 1, 1, 1, 1,
-0.09818804, 0.6491926, 0.4285151, 1, 1, 1, 1, 1,
-0.09051137, -0.4263129, -3.617291, 0, 0, 1, 1, 1,
-0.09045652, 0.373458, -0.3248663, 1, 0, 0, 1, 1,
-0.08701349, 1.217508, -0.3538267, 1, 0, 0, 1, 1,
-0.08469998, 1.399315, 0.8970438, 1, 0, 0, 1, 1,
-0.08344321, 1.775414, -1.141215, 1, 0, 0, 1, 1,
-0.0736829, -1.15749, -2.709173, 1, 0, 0, 1, 1,
-0.07348359, -0.1618935, -4.29023, 0, 0, 0, 1, 1,
-0.07307887, 0.8391979, -0.1022255, 0, 0, 0, 1, 1,
-0.07083379, 0.6026613, -0.1456522, 0, 0, 0, 1, 1,
-0.07056902, -0.1883998, -2.628229, 0, 0, 0, 1, 1,
-0.06977573, -0.6390001, -3.747438, 0, 0, 0, 1, 1,
-0.06761201, 1.738401, -1.402481, 0, 0, 0, 1, 1,
-0.06386124, 0.04929976, 0.2093799, 0, 0, 0, 1, 1,
-0.0582024, 0.6675528, -1.224069, 1, 1, 1, 1, 1,
-0.05585647, -2.062384, -3.138439, 1, 1, 1, 1, 1,
-0.05035105, 1.218834, -0.9370031, 1, 1, 1, 1, 1,
-0.04824857, -2.132402, -4.11449, 1, 1, 1, 1, 1,
-0.04777626, -0.9046279, -3.349903, 1, 1, 1, 1, 1,
-0.04311617, 0.3986712, 0.9922543, 1, 1, 1, 1, 1,
-0.04142175, -0.04413417, -2.60566, 1, 1, 1, 1, 1,
-0.04023116, 1.532041, 0.676177, 1, 1, 1, 1, 1,
-0.03697186, -0.09180451, -2.901611, 1, 1, 1, 1, 1,
-0.03584794, -0.4285634, -2.696564, 1, 1, 1, 1, 1,
-0.03484027, 0.1604367, 0.4706612, 1, 1, 1, 1, 1,
-0.03054025, -0.3912676, -3.529737, 1, 1, 1, 1, 1,
-0.0245374, 0.6150653, 0.5815283, 1, 1, 1, 1, 1,
-0.02201327, -1.694631, -4.861952, 1, 1, 1, 1, 1,
-0.02180092, -0.3050898, -2.370001, 1, 1, 1, 1, 1,
-0.01602245, -0.4349828, -4.177326, 0, 0, 1, 1, 1,
-0.01495859, -1.148075, -3.292934, 1, 0, 0, 1, 1,
-0.01374177, -1.277498, -2.972708, 1, 0, 0, 1, 1,
-0.01300099, -0.422974, -1.662681, 1, 0, 0, 1, 1,
-0.0101064, 0.7751517, -0.8638555, 1, 0, 0, 1, 1,
-0.005782539, 1.388596, 0.6881151, 1, 0, 0, 1, 1,
-0.002948937, -1.395757, -4.414615, 0, 0, 0, 1, 1,
0.0001917778, 1.096901, -0.6754805, 0, 0, 0, 1, 1,
0.0004303816, 0.8151255, 0.301273, 0, 0, 0, 1, 1,
0.005106854, 1.10861, -0.3480662, 0, 0, 0, 1, 1,
0.007727739, -0.2870854, 2.576624, 0, 0, 0, 1, 1,
0.008851571, 0.7352043, -0.3433049, 0, 0, 0, 1, 1,
0.01079885, -0.1157118, 2.294814, 0, 0, 0, 1, 1,
0.01130042, 0.3722386, 0.7010577, 1, 1, 1, 1, 1,
0.01428228, 1.886526, -1.142544, 1, 1, 1, 1, 1,
0.01894807, -0.4441146, 2.26628, 1, 1, 1, 1, 1,
0.02019464, -0.6804295, 1.824993, 1, 1, 1, 1, 1,
0.02020637, 0.1682418, 0.1935349, 1, 1, 1, 1, 1,
0.02703631, -0.9908454, 3.988208, 1, 1, 1, 1, 1,
0.02844952, 0.2055946, 1.359741, 1, 1, 1, 1, 1,
0.02881821, 0.496343, -0.5249639, 1, 1, 1, 1, 1,
0.03303366, 0.4508833, 0.4944709, 1, 1, 1, 1, 1,
0.03422903, 0.5334933, -0.2326854, 1, 1, 1, 1, 1,
0.03520399, 1.363893, 0.03712992, 1, 1, 1, 1, 1,
0.03537714, -0.09558423, 2.486633, 1, 1, 1, 1, 1,
0.04133842, 1.487577, -0.1532102, 1, 1, 1, 1, 1,
0.0437027, -1.835108, 3.332723, 1, 1, 1, 1, 1,
0.04416151, 1.253764, 0.6658904, 1, 1, 1, 1, 1,
0.04702508, 2.267585, 0.2924819, 0, 0, 1, 1, 1,
0.04805871, -1.141129, 2.97566, 1, 0, 0, 1, 1,
0.04861009, 1.267865, 1.421723, 1, 0, 0, 1, 1,
0.0515876, -0.3317071, 1.843596, 1, 0, 0, 1, 1,
0.05323625, 0.8826069, -0.7971874, 1, 0, 0, 1, 1,
0.05470959, -1.411292, 3.787703, 1, 0, 0, 1, 1,
0.0576815, -0.0658638, 2.428206, 0, 0, 0, 1, 1,
0.05942839, -1.086959, 5.118773, 0, 0, 0, 1, 1,
0.07966668, -1.487796, 2.044343, 0, 0, 0, 1, 1,
0.08664725, -0.8857689, 1.971071, 0, 0, 0, 1, 1,
0.08751775, -0.5759476, 2.987372, 0, 0, 0, 1, 1,
0.08898516, 0.4202553, 0.3837319, 0, 0, 0, 1, 1,
0.08908154, 0.1993993, 1.854819, 0, 0, 0, 1, 1,
0.08982787, 0.8844081, 1.221409, 1, 1, 1, 1, 1,
0.0903488, 0.03996317, 0.05167946, 1, 1, 1, 1, 1,
0.0915207, -1.108364, 3.442956, 1, 1, 1, 1, 1,
0.09469596, 0.5812708, 0.3157705, 1, 1, 1, 1, 1,
0.1029742, 1.193271, -0.5037968, 1, 1, 1, 1, 1,
0.1047026, -0.9697602, 3.868044, 1, 1, 1, 1, 1,
0.1069372, 1.54554, -1.189283, 1, 1, 1, 1, 1,
0.1079517, -0.2375046, 2.798918, 1, 1, 1, 1, 1,
0.108405, -1.948264, 2.151047, 1, 1, 1, 1, 1,
0.1095753, 0.3385062, -0.4600136, 1, 1, 1, 1, 1,
0.1199081, -0.2833935, 2.469295, 1, 1, 1, 1, 1,
0.1231758, 1.893609, -1.180043, 1, 1, 1, 1, 1,
0.1245575, -0.2465201, 0.9012398, 1, 1, 1, 1, 1,
0.1253596, 1.069781, 0.1982965, 1, 1, 1, 1, 1,
0.1291542, -0.4510985, 3.937357, 1, 1, 1, 1, 1,
0.1349031, -1.586631, 1.94303, 0, 0, 1, 1, 1,
0.1368159, -1.632701, 2.408144, 1, 0, 0, 1, 1,
0.1372624, 0.6039929, 1.101429, 1, 0, 0, 1, 1,
0.1397774, 0.1743009, 0.6119108, 1, 0, 0, 1, 1,
0.1417552, 0.05357251, 2.566391, 1, 0, 0, 1, 1,
0.1432108, -0.06663661, 0.769117, 1, 0, 0, 1, 1,
0.1436336, -0.3432215, 3.364726, 0, 0, 0, 1, 1,
0.1441503, -0.1103339, 1.07713, 0, 0, 0, 1, 1,
0.1458757, 1.25583, -0.4792429, 0, 0, 0, 1, 1,
0.1509379, -0.03792218, 3.343647, 0, 0, 0, 1, 1,
0.1538011, 1.436236, -0.06283066, 0, 0, 0, 1, 1,
0.1554833, 0.04987592, -0.2758664, 0, 0, 0, 1, 1,
0.1565313, 1.274646, 1.428465, 0, 0, 0, 1, 1,
0.1601434, 1.407506, 0.9636582, 1, 1, 1, 1, 1,
0.1626372, 0.1318724, 2.156985, 1, 1, 1, 1, 1,
0.1653979, 0.5968422, -1.412768, 1, 1, 1, 1, 1,
0.1657093, 1.030362, 0.6694668, 1, 1, 1, 1, 1,
0.1724795, 0.120052, 0.1658383, 1, 1, 1, 1, 1,
0.1735865, 1.332855, 0.8618696, 1, 1, 1, 1, 1,
0.1746103, -2.082947, 1.864764, 1, 1, 1, 1, 1,
0.1779485, -0.003066425, 3.474823, 1, 1, 1, 1, 1,
0.1802371, -0.9388008, 3.870633, 1, 1, 1, 1, 1,
0.1852024, -0.3916577, 2.583295, 1, 1, 1, 1, 1,
0.1855608, 1.205031, 0.08007526, 1, 1, 1, 1, 1,
0.1858675, -0.6492136, 4.736199, 1, 1, 1, 1, 1,
0.1895063, 1.162227, -0.4439825, 1, 1, 1, 1, 1,
0.190199, -0.06422016, 1.170178, 1, 1, 1, 1, 1,
0.1909617, -0.3601818, 1.330327, 1, 1, 1, 1, 1,
0.1928813, -0.07323605, 1.890466, 0, 0, 1, 1, 1,
0.1960565, 0.6349909, -0.7204646, 1, 0, 0, 1, 1,
0.196418, -1.163062, 1.200937, 1, 0, 0, 1, 1,
0.2028862, 0.6717954, 2.100532, 1, 0, 0, 1, 1,
0.2085491, 1.693324, 0.396086, 1, 0, 0, 1, 1,
0.2093675, -0.1176388, 0.6258925, 1, 0, 0, 1, 1,
0.2140154, -1.419666, 2.464088, 0, 0, 0, 1, 1,
0.2186384, -1.247374, 2.55357, 0, 0, 0, 1, 1,
0.2198727, -0.8892893, 2.665135, 0, 0, 0, 1, 1,
0.2204848, -0.6144286, 3.293555, 0, 0, 0, 1, 1,
0.2219785, 1.760443, -0.009259973, 0, 0, 0, 1, 1,
0.2231726, -0.6508281, 4.86656, 0, 0, 0, 1, 1,
0.2274695, -1.357763, 1.070513, 0, 0, 0, 1, 1,
0.2280719, 0.9842567, 0.05093163, 1, 1, 1, 1, 1,
0.2285947, 0.3120751, 1.741795, 1, 1, 1, 1, 1,
0.2288776, -0.7560273, 2.472318, 1, 1, 1, 1, 1,
0.2302627, -1.089268, 2.113554, 1, 1, 1, 1, 1,
0.2504581, 1.058464, 1.439313, 1, 1, 1, 1, 1,
0.2532644, 2.17846, 0.631083, 1, 1, 1, 1, 1,
0.2580396, -0.9643567, 4.21367, 1, 1, 1, 1, 1,
0.2598807, -1.168662, 2.163012, 1, 1, 1, 1, 1,
0.2604199, 0.657061, 0.8082989, 1, 1, 1, 1, 1,
0.266078, 0.9632611, 1.28883, 1, 1, 1, 1, 1,
0.2661267, -0.3385195, 4.76839, 1, 1, 1, 1, 1,
0.2783853, 1.794461, 0.5763669, 1, 1, 1, 1, 1,
0.2827918, -1.097463, 2.185274, 1, 1, 1, 1, 1,
0.2828641, 0.06989244, 1.941761, 1, 1, 1, 1, 1,
0.2856581, -1.127658, 1.138743, 1, 1, 1, 1, 1,
0.2922235, -1.114652, 2.380438, 0, 0, 1, 1, 1,
0.2927769, -1.7626, 2.57177, 1, 0, 0, 1, 1,
0.2949255, -0.2959388, 2.311206, 1, 0, 0, 1, 1,
0.2973005, -0.0562178, 0.5787678, 1, 0, 0, 1, 1,
0.2973102, -1.224335, 3.060972, 1, 0, 0, 1, 1,
0.298662, 0.4300591, 1.525844, 1, 0, 0, 1, 1,
0.2990606, 1.636132, -1.05938, 0, 0, 0, 1, 1,
0.3008412, -0.5537802, 3.155259, 0, 0, 0, 1, 1,
0.302271, -1.035308, 1.313815, 0, 0, 0, 1, 1,
0.3054093, -1.532812, 4.356821, 0, 0, 0, 1, 1,
0.3130223, 0.5871574, 0.7860113, 0, 0, 0, 1, 1,
0.3197726, -0.8044009, 3.50636, 0, 0, 0, 1, 1,
0.3251173, 0.8781819, -0.03449811, 0, 0, 0, 1, 1,
0.3268108, 0.2267051, 1.143559, 1, 1, 1, 1, 1,
0.3282573, 0.4722217, -0.07308742, 1, 1, 1, 1, 1,
0.3301387, -0.1482426, 0.1243568, 1, 1, 1, 1, 1,
0.3346637, 0.871138, 1.174255, 1, 1, 1, 1, 1,
0.337257, 0.6711144, 0.9911028, 1, 1, 1, 1, 1,
0.3379264, -0.2471782, 3.167983, 1, 1, 1, 1, 1,
0.3389302, -1.444349, 2.239145, 1, 1, 1, 1, 1,
0.342462, -1.038841, 3.115021, 1, 1, 1, 1, 1,
0.3437668, 1.135728, 1.854774, 1, 1, 1, 1, 1,
0.3440707, 0.693338, -0.5717146, 1, 1, 1, 1, 1,
0.3444166, -1.061198, 1.853988, 1, 1, 1, 1, 1,
0.3451699, 1.095465, -0.4720891, 1, 1, 1, 1, 1,
0.3478672, 0.5838423, 0.2120479, 1, 1, 1, 1, 1,
0.3594971, -2.4654, 3.505847, 1, 1, 1, 1, 1,
0.3620659, 0.943194, 1.006241, 1, 1, 1, 1, 1,
0.3632762, -1.894827, 2.719149, 0, 0, 1, 1, 1,
0.3654341, 1.564036, -0.6970133, 1, 0, 0, 1, 1,
0.3733851, 1.97245, 0.931856, 1, 0, 0, 1, 1,
0.3744798, 0.53252, -0.1193962, 1, 0, 0, 1, 1,
0.3764743, -0.873322, 2.149506, 1, 0, 0, 1, 1,
0.3780606, -0.2181011, 0.7070135, 1, 0, 0, 1, 1,
0.3821223, 0.2318313, 0.08139495, 0, 0, 0, 1, 1,
0.3823678, -0.2874872, 2.665601, 0, 0, 0, 1, 1,
0.3915458, -0.1010156, 1.317486, 0, 0, 0, 1, 1,
0.3961445, 1.420478, -1.353655, 0, 0, 0, 1, 1,
0.4002087, 0.02062739, 0.3755509, 0, 0, 0, 1, 1,
0.4004127, 0.1761539, 0.8382197, 0, 0, 0, 1, 1,
0.4016522, 1.071899, 0.4464439, 0, 0, 0, 1, 1,
0.4032652, 0.03272108, 2.336214, 1, 1, 1, 1, 1,
0.4047078, 2.509928, -1.540719, 1, 1, 1, 1, 1,
0.4072215, -0.1583335, 2.889678, 1, 1, 1, 1, 1,
0.4103356, -0.2651688, 2.617253, 1, 1, 1, 1, 1,
0.4110137, 0.8469132, 1.936491, 1, 1, 1, 1, 1,
0.425956, 1.762381, -0.4320976, 1, 1, 1, 1, 1,
0.4264439, -0.4674628, 4.823995, 1, 1, 1, 1, 1,
0.4297283, 1.454392, 0.8948032, 1, 1, 1, 1, 1,
0.4327277, 1.326754, 0.7118724, 1, 1, 1, 1, 1,
0.4338265, -0.9670395, 3.310607, 1, 1, 1, 1, 1,
0.4356373, -0.4195103, 1.472359, 1, 1, 1, 1, 1,
0.4359925, 0.2087184, 0.299131, 1, 1, 1, 1, 1,
0.4361609, -1.024956, 3.561644, 1, 1, 1, 1, 1,
0.4405951, -0.02208149, 2.05646, 1, 1, 1, 1, 1,
0.4408959, -0.519073, 0.8159037, 1, 1, 1, 1, 1,
0.4430444, 0.2345881, 2.290485, 0, 0, 1, 1, 1,
0.4437106, 0.9240258, 0.4817544, 1, 0, 0, 1, 1,
0.4448823, -0.7636374, 2.857429, 1, 0, 0, 1, 1,
0.4496897, -0.09205059, 1.269791, 1, 0, 0, 1, 1,
0.4537389, -0.684909, 3.524045, 1, 0, 0, 1, 1,
0.45402, 0.6252292, 0.66461, 1, 0, 0, 1, 1,
0.4565839, 0.7285611, -0.2740237, 0, 0, 0, 1, 1,
0.4609722, 0.6935887, 0.2484316, 0, 0, 0, 1, 1,
0.4658926, -0.1850483, 1.889343, 0, 0, 0, 1, 1,
0.4700434, 0.7950642, 1.859103, 0, 0, 0, 1, 1,
0.4719225, -0.5022206, 0.186118, 0, 0, 0, 1, 1,
0.4763027, 1.881963, -0.8300616, 0, 0, 0, 1, 1,
0.4763822, 1.274607, 0.7828696, 0, 0, 0, 1, 1,
0.4772715, 0.455347, 0.7269062, 1, 1, 1, 1, 1,
0.4842381, 0.1828996, 2.816655, 1, 1, 1, 1, 1,
0.4995863, -0.3664842, 1.146441, 1, 1, 1, 1, 1,
0.5009881, 0.5299897, 0.9620577, 1, 1, 1, 1, 1,
0.5049422, 1.428805, 1.431901, 1, 1, 1, 1, 1,
0.5080313, 0.6181261, -1.499104, 1, 1, 1, 1, 1,
0.5090243, 1.545753, 1.328498, 1, 1, 1, 1, 1,
0.5104348, -2.066018, 4.440829, 1, 1, 1, 1, 1,
0.5108587, -0.3223119, 0.1901705, 1, 1, 1, 1, 1,
0.511286, -0.9633822, 3.10541, 1, 1, 1, 1, 1,
0.5126462, 1.076739, -1.913069, 1, 1, 1, 1, 1,
0.5253037, 0.1976066, 1.14448, 1, 1, 1, 1, 1,
0.5259153, -0.748544, 2.130653, 1, 1, 1, 1, 1,
0.5264742, 1.51096, 0.7145387, 1, 1, 1, 1, 1,
0.5271181, -0.01444013, 0.3892252, 1, 1, 1, 1, 1,
0.5324791, -0.03377348, 1.638228, 0, 0, 1, 1, 1,
0.5337536, 1.224236, 1.433517, 1, 0, 0, 1, 1,
0.5344861, -0.8214818, 4.103064, 1, 0, 0, 1, 1,
0.5443982, 0.4125368, 1.522644, 1, 0, 0, 1, 1,
0.5515801, -1.565637, 2.560603, 1, 0, 0, 1, 1,
0.5535362, 0.005324021, 2.069473, 1, 0, 0, 1, 1,
0.5586169, 0.2937624, 0.908399, 0, 0, 0, 1, 1,
0.5586906, 0.9829809, 1.750085, 0, 0, 0, 1, 1,
0.5604703, 0.507923, -0.07754506, 0, 0, 0, 1, 1,
0.5632147, -0.5146381, 1.119468, 0, 0, 0, 1, 1,
0.5639371, -1.804593, 1.250881, 0, 0, 0, 1, 1,
0.5640311, -0.9958751, 3.108116, 0, 0, 0, 1, 1,
0.5641018, 0.7666943, -0.1761913, 0, 0, 0, 1, 1,
0.5643407, 0.1412184, 3.377018, 1, 1, 1, 1, 1,
0.5669602, 0.5050058, -0.2703018, 1, 1, 1, 1, 1,
0.5691393, 1.392897, 2.038424, 1, 1, 1, 1, 1,
0.5717171, 1.80215, -0.1115127, 1, 1, 1, 1, 1,
0.5724601, 0.801168, -1.115431, 1, 1, 1, 1, 1,
0.5775834, 0.8278399, 1.747448, 1, 1, 1, 1, 1,
0.5783406, 0.4851912, -0.657084, 1, 1, 1, 1, 1,
0.580628, 1.067194, 0.393919, 1, 1, 1, 1, 1,
0.5825861, 1.05421, 0.88226, 1, 1, 1, 1, 1,
0.5883424, 0.3874992, 2.138326, 1, 1, 1, 1, 1,
0.5914296, -1.707647, 2.350108, 1, 1, 1, 1, 1,
0.5925595, -2.550788, 3.267565, 1, 1, 1, 1, 1,
0.5999405, 1.612288, -1.007425, 1, 1, 1, 1, 1,
0.6019002, 0.2058661, 2.678548, 1, 1, 1, 1, 1,
0.607026, -1.496688, 3.01426, 1, 1, 1, 1, 1,
0.6078369, -0.8358573, 3.688452, 0, 0, 1, 1, 1,
0.6083416, -0.8261645, 3.709654, 1, 0, 0, 1, 1,
0.618518, -1.252905, 3.26476, 1, 0, 0, 1, 1,
0.6202875, 1.426966, 1.395355, 1, 0, 0, 1, 1,
0.6239208, -1.642619, 1.127342, 1, 0, 0, 1, 1,
0.6332247, 0.126025, 1.54955, 1, 0, 0, 1, 1,
0.6378168, 0.5446547, -0.5731021, 0, 0, 0, 1, 1,
0.6442435, 1.040065, 0.5169055, 0, 0, 0, 1, 1,
0.6459295, 0.3096147, -0.7114289, 0, 0, 0, 1, 1,
0.646657, -0.9503074, 2.582894, 0, 0, 0, 1, 1,
0.6576602, -1.964932, 1.840785, 0, 0, 0, 1, 1,
0.6581011, -0.7901777, 3.242163, 0, 0, 0, 1, 1,
0.660542, -0.5988674, 1.634024, 0, 0, 0, 1, 1,
0.6707944, 0.6564109, 1.291964, 1, 1, 1, 1, 1,
0.6739255, -0.3828024, 1.7572, 1, 1, 1, 1, 1,
0.6804318, 2.040015, -0.7587194, 1, 1, 1, 1, 1,
0.6915547, -0.4222398, 2.408735, 1, 1, 1, 1, 1,
0.7005667, 0.3539389, 1.627342, 1, 1, 1, 1, 1,
0.7014931, -1.81221, 1.994578, 1, 1, 1, 1, 1,
0.7019827, 0.09831522, 3.412227, 1, 1, 1, 1, 1,
0.7108113, 1.652047, 2.86917, 1, 1, 1, 1, 1,
0.7133527, 0.8696226, 1.52848, 1, 1, 1, 1, 1,
0.7142861, 1.230281, 0.4326216, 1, 1, 1, 1, 1,
0.7275051, -0.2601311, 0.8908055, 1, 1, 1, 1, 1,
0.7280074, -1.225203, 3.726102, 1, 1, 1, 1, 1,
0.7327588, -0.4782745, 2.697565, 1, 1, 1, 1, 1,
0.7329119, -0.195375, 2.815808, 1, 1, 1, 1, 1,
0.7332042, -0.7434465, 2.488395, 1, 1, 1, 1, 1,
0.734832, -1.222525, 1.269096, 0, 0, 1, 1, 1,
0.7367346, 1.053632, -0.02611311, 1, 0, 0, 1, 1,
0.7421161, -0.3404851, 1.187479, 1, 0, 0, 1, 1,
0.7433376, 0.6229732, 1.424508, 1, 0, 0, 1, 1,
0.7434164, -2.100502, 3.316479, 1, 0, 0, 1, 1,
0.7444043, -0.4387928, 3.499158, 1, 0, 0, 1, 1,
0.7469356, 1.972034, -1.236613, 0, 0, 0, 1, 1,
0.7488492, -0.4565861, 2.886205, 0, 0, 0, 1, 1,
0.7552647, -0.2455651, 1.550851, 0, 0, 0, 1, 1,
0.7579569, -0.9428645, 3.625563, 0, 0, 0, 1, 1,
0.7604835, 1.610895, -1.021592, 0, 0, 0, 1, 1,
0.7634485, -0.9857345, 3.331759, 0, 0, 0, 1, 1,
0.7697625, 0.0528249, 1.070433, 0, 0, 0, 1, 1,
0.7714828, 0.691611, 1.162328, 1, 1, 1, 1, 1,
0.782666, -0.5387315, 1.940558, 1, 1, 1, 1, 1,
0.7843753, 1.654875, -0.1011407, 1, 1, 1, 1, 1,
0.7868687, -0.5542297, 1.7766, 1, 1, 1, 1, 1,
0.7901156, 0.05811055, 3.460706, 1, 1, 1, 1, 1,
0.7901239, 0.8117301, 1.238194, 1, 1, 1, 1, 1,
0.7924009, -0.1375114, 1.042631, 1, 1, 1, 1, 1,
0.7935708, -0.2125462, 1.173066, 1, 1, 1, 1, 1,
0.7942641, -0.6362188, 2.585523, 1, 1, 1, 1, 1,
0.7947313, -0.09267608, 2.127256, 1, 1, 1, 1, 1,
0.7960533, -1.506838, 3.809222, 1, 1, 1, 1, 1,
0.804144, 0.6713936, -0.4622552, 1, 1, 1, 1, 1,
0.8084791, 2.559296, 1.438276, 1, 1, 1, 1, 1,
0.8092605, 1.049357, -0.403282, 1, 1, 1, 1, 1,
0.8102184, -0.2176884, 1.684559, 1, 1, 1, 1, 1,
0.8194322, 1.076499, 0.1223968, 0, 0, 1, 1, 1,
0.8250717, -1.710755, -0.09090487, 1, 0, 0, 1, 1,
0.8295623, 0.2524163, 0.9699759, 1, 0, 0, 1, 1,
0.8332608, 1.456931, -0.6156406, 1, 0, 0, 1, 1,
0.8345537, 2.471314, -0.5256559, 1, 0, 0, 1, 1,
0.8368507, -0.602961, 0.6136591, 1, 0, 0, 1, 1,
0.8415958, -0.2765592, 2.260462, 0, 0, 0, 1, 1,
0.8419328, 0.3609031, 0.6343554, 0, 0, 0, 1, 1,
0.8441781, 1.574144, -1.202504, 0, 0, 0, 1, 1,
0.8447888, -1.496964, 3.240197, 0, 0, 0, 1, 1,
0.8474169, -0.4123051, 1.045322, 0, 0, 0, 1, 1,
0.8507848, 1.852468, -0.2342118, 0, 0, 0, 1, 1,
0.851603, -0.02958948, 2.094973, 0, 0, 0, 1, 1,
0.8518468, 0.1211556, 0.4088604, 1, 1, 1, 1, 1,
0.8534266, -0.6527305, 3.959227, 1, 1, 1, 1, 1,
0.8548935, 0.2903852, 2.058217, 1, 1, 1, 1, 1,
0.8557426, 0.001622106, 1.407139, 1, 1, 1, 1, 1,
0.8581619, -1.22488, 3.208458, 1, 1, 1, 1, 1,
0.8621163, -0.5792454, 2.24537, 1, 1, 1, 1, 1,
0.8621508, -1.398801, 2.739053, 1, 1, 1, 1, 1,
0.871362, 0.39569, 0.5621597, 1, 1, 1, 1, 1,
0.8713904, -1.185962, 2.11682, 1, 1, 1, 1, 1,
0.8722377, 0.5543227, 1.227145, 1, 1, 1, 1, 1,
0.8727232, 0.7722117, 0.7202591, 1, 1, 1, 1, 1,
0.8734614, -0.8025715, 0.9054199, 1, 1, 1, 1, 1,
0.8763809, 0.7809255, 3.056611, 1, 1, 1, 1, 1,
0.8797107, -2.095001, 2.456655, 1, 1, 1, 1, 1,
0.8874084, 0.6966566, 1.905333, 1, 1, 1, 1, 1,
0.8875802, 0.7508937, 0.2812864, 0, 0, 1, 1, 1,
0.8894688, -1.580752, 1.798982, 1, 0, 0, 1, 1,
0.8945187, 1.151396, -0.0596163, 1, 0, 0, 1, 1,
0.8969981, 1.966203, 1.896373, 1, 0, 0, 1, 1,
0.9077646, 0.02453223, 1.396411, 1, 0, 0, 1, 1,
0.9079317, 1.794983, 1.110702, 1, 0, 0, 1, 1,
0.9112284, -2.158572, 3.48855, 0, 0, 0, 1, 1,
0.9343529, 1.085575, -2.218181, 0, 0, 0, 1, 1,
0.9357255, 0.7132633, 1.85759, 0, 0, 0, 1, 1,
0.9390994, 0.7544974, -1.604172, 0, 0, 0, 1, 1,
0.947284, 0.6924323, -0.3712628, 0, 0, 0, 1, 1,
0.9532036, 2.080031, 1.246811, 0, 0, 0, 1, 1,
0.9581154, 0.5855735, 1.362542, 0, 0, 0, 1, 1,
0.9648105, -0.01876939, 2.704275, 1, 1, 1, 1, 1,
0.9656651, 1.143344, 0.1707443, 1, 1, 1, 1, 1,
0.9711999, 1.219194, 1.538964, 1, 1, 1, 1, 1,
0.9777087, 1.100117, 0.5372104, 1, 1, 1, 1, 1,
0.9788763, -1.630258, 2.66548, 1, 1, 1, 1, 1,
0.9827421, 0.02297783, 0.2035273, 1, 1, 1, 1, 1,
0.9840215, -1.188115, 1.295639, 1, 1, 1, 1, 1,
0.9857253, 0.1448854, 2.901971, 1, 1, 1, 1, 1,
0.9907314, 1.193341, 0.3607187, 1, 1, 1, 1, 1,
0.9912137, 0.9824706, -1.148123, 1, 1, 1, 1, 1,
0.9955969, -0.6290326, 2.342968, 1, 1, 1, 1, 1,
0.9978378, 0.03471025, 2.500923, 1, 1, 1, 1, 1,
1.001646, -0.8287876, 1.551053, 1, 1, 1, 1, 1,
1.001942, 1.249533, 1.523266, 1, 1, 1, 1, 1,
1.009239, -0.9294167, 2.220258, 1, 1, 1, 1, 1,
1.012087, -0.6809274, 2.168264, 0, 0, 1, 1, 1,
1.015467, 0.3766324, -0.2888823, 1, 0, 0, 1, 1,
1.01985, 1.600566, 0.2424526, 1, 0, 0, 1, 1,
1.033585, -0.1204287, 1.625178, 1, 0, 0, 1, 1,
1.034201, -1.036382, 1.963369, 1, 0, 0, 1, 1,
1.034829, -0.7164701, 2.985167, 1, 0, 0, 1, 1,
1.035222, 0.9725717, 1.477138, 0, 0, 0, 1, 1,
1.04217, 1.037875, 1.231069, 0, 0, 0, 1, 1,
1.045907, -0.5981212, 4.209848, 0, 0, 0, 1, 1,
1.059468, -2.066572, 2.168625, 0, 0, 0, 1, 1,
1.061157, -0.2400915, 1.974985, 0, 0, 0, 1, 1,
1.06189, -0.6213894, 1.231297, 0, 0, 0, 1, 1,
1.065757, 1.021654, 3.182882, 0, 0, 0, 1, 1,
1.068891, 0.2628509, 1.413776, 1, 1, 1, 1, 1,
1.07617, 0.3339265, 0.8249421, 1, 1, 1, 1, 1,
1.079051, 0.7398343, 1.840934, 1, 1, 1, 1, 1,
1.080549, -0.5952758, 2.039135, 1, 1, 1, 1, 1,
1.080774, -0.4078354, 1.694779, 1, 1, 1, 1, 1,
1.081507, 0.7550995, 0.8041446, 1, 1, 1, 1, 1,
1.083651, -0.2536082, 1.47503, 1, 1, 1, 1, 1,
1.087644, -0.007393287, 0.6291804, 1, 1, 1, 1, 1,
1.090231, -0.0609265, 0.9604136, 1, 1, 1, 1, 1,
1.092349, 0.651689, 0.9275442, 1, 1, 1, 1, 1,
1.092541, -0.4752758, 2.952892, 1, 1, 1, 1, 1,
1.094868, -0.4373267, 2.291713, 1, 1, 1, 1, 1,
1.098867, -0.9200367, 2.481339, 1, 1, 1, 1, 1,
1.100511, -1.97395, 3.777497, 1, 1, 1, 1, 1,
1.111533, 0.1064251, -0.829508, 1, 1, 1, 1, 1,
1.120414, -0.1607678, 0.9086652, 0, 0, 1, 1, 1,
1.120603, -0.1577959, 0.6097091, 1, 0, 0, 1, 1,
1.127426, -1.582892, 2.416453, 1, 0, 0, 1, 1,
1.135485, -0.8588799, 3.317496, 1, 0, 0, 1, 1,
1.135736, -0.5349567, 3.381367, 1, 0, 0, 1, 1,
1.135744, 0.5746134, 1.857105, 1, 0, 0, 1, 1,
1.136432, 1.651801, -0.1129618, 0, 0, 0, 1, 1,
1.138159, 0.6735142, 1.809905, 0, 0, 0, 1, 1,
1.14612, -0.3219633, 2.652719, 0, 0, 0, 1, 1,
1.146695, -0.08724037, -0.5539064, 0, 0, 0, 1, 1,
1.146839, -0.897283, 2.281037, 0, 0, 0, 1, 1,
1.155929, 0.2878774, 1.443253, 0, 0, 0, 1, 1,
1.15768, 1.047165, 1.713377, 0, 0, 0, 1, 1,
1.164414, -0.7584801, 2.782279, 1, 1, 1, 1, 1,
1.165113, 1.34698, 0.4624167, 1, 1, 1, 1, 1,
1.173848, -0.4477486, 2.569083, 1, 1, 1, 1, 1,
1.175141, 0.5355369, 1.427208, 1, 1, 1, 1, 1,
1.183578, 0.8365817, 0.886867, 1, 1, 1, 1, 1,
1.187482, 0.01482816, 0.03244203, 1, 1, 1, 1, 1,
1.198738, -0.2736544, 2.59466, 1, 1, 1, 1, 1,
1.201183, -0.5900212, 2.28897, 1, 1, 1, 1, 1,
1.218624, 0.952039, 0.2905776, 1, 1, 1, 1, 1,
1.221164, 0.9841254, -0.2224153, 1, 1, 1, 1, 1,
1.225894, 0.9500128, 2.269525, 1, 1, 1, 1, 1,
1.227277, -0.6104026, 2.066526, 1, 1, 1, 1, 1,
1.238902, -0.4797821, 2.981492, 1, 1, 1, 1, 1,
1.242563, -0.6713743, 2.908123, 1, 1, 1, 1, 1,
1.250929, 0.09320107, 0.3577357, 1, 1, 1, 1, 1,
1.255302, 0.488541, 0.5733844, 0, 0, 1, 1, 1,
1.256604, -1.155007, 2.066407, 1, 0, 0, 1, 1,
1.266089, 0.08346669, 0.9102802, 1, 0, 0, 1, 1,
1.268253, -0.6784983, 2.666585, 1, 0, 0, 1, 1,
1.27188, 0.2539178, 0.6606513, 1, 0, 0, 1, 1,
1.274287, 0.8945862, 0.5389065, 1, 0, 0, 1, 1,
1.277253, 0.5141692, 0.9095849, 0, 0, 0, 1, 1,
1.284242, 0.572385, 0.4889764, 0, 0, 0, 1, 1,
1.287973, 0.4862199, 2.51122, 0, 0, 0, 1, 1,
1.304374, 1.903121, 0.2611718, 0, 0, 0, 1, 1,
1.304639, -0.8925786, 2.641711, 0, 0, 0, 1, 1,
1.312866, 0.039117, 2.411583, 0, 0, 0, 1, 1,
1.314993, 0.9702452, -0.7017853, 0, 0, 0, 1, 1,
1.315213, -0.4669149, 2.485763, 1, 1, 1, 1, 1,
1.321485, -1.886054, 0.4189236, 1, 1, 1, 1, 1,
1.329783, -1.251498, 1.891012, 1, 1, 1, 1, 1,
1.334954, -2.441636, 2.434239, 1, 1, 1, 1, 1,
1.346518, 0.126839, 1.125912, 1, 1, 1, 1, 1,
1.354097, 0.1267696, 3.760677, 1, 1, 1, 1, 1,
1.355005, -0.4817383, 3.316482, 1, 1, 1, 1, 1,
1.356319, -0.4633003, 2.376329, 1, 1, 1, 1, 1,
1.363423, -1.4526, 4.386112, 1, 1, 1, 1, 1,
1.365552, 0.2212198, 2.028852, 1, 1, 1, 1, 1,
1.378183, -0.6374296, 1.807312, 1, 1, 1, 1, 1,
1.38055, -0.02121736, 0.7117229, 1, 1, 1, 1, 1,
1.391005, -0.07028327, 1.232862, 1, 1, 1, 1, 1,
1.394242, -0.8305345, 1.923882, 1, 1, 1, 1, 1,
1.398397, 0.5961158, 0.3572904, 1, 1, 1, 1, 1,
1.41402, 0.3851747, 2.326633, 0, 0, 1, 1, 1,
1.446285, -1.001758, 3.684591, 1, 0, 0, 1, 1,
1.456477, -1.187744, 0.9043082, 1, 0, 0, 1, 1,
1.467807, 1.074865, 1.503988, 1, 0, 0, 1, 1,
1.472975, -0.3309875, 0.8591505, 1, 0, 0, 1, 1,
1.487198, 0.06715514, 1.589799, 1, 0, 0, 1, 1,
1.494652, 0.8739417, 0.7857171, 0, 0, 0, 1, 1,
1.498091, 0.5643668, 0.4678841, 0, 0, 0, 1, 1,
1.505745, -0.2644085, 1.655359, 0, 0, 0, 1, 1,
1.508353, 1.288592, 2.861111, 0, 0, 0, 1, 1,
1.515276, -0.7377146, 1.982966, 0, 0, 0, 1, 1,
1.521428, 0.8607677, 2.451312, 0, 0, 0, 1, 1,
1.522435, -1.604691, 2.005779, 0, 0, 0, 1, 1,
1.531104, -0.9807833, 4.024121, 1, 1, 1, 1, 1,
1.532786, -0.6169051, 1.002786, 1, 1, 1, 1, 1,
1.539094, -0.1112705, 3.299454, 1, 1, 1, 1, 1,
1.549707, 0.02149105, 0.9188201, 1, 1, 1, 1, 1,
1.562609, -0.6009911, 2.722702, 1, 1, 1, 1, 1,
1.575835, 0.4865232, 0.1319978, 1, 1, 1, 1, 1,
1.582528, 0.7191806, -0.1038012, 1, 1, 1, 1, 1,
1.589671, -0.337172, 1.697351, 1, 1, 1, 1, 1,
1.589922, -0.1095055, 2.286178, 1, 1, 1, 1, 1,
1.606768, 1.627775, -0.6450093, 1, 1, 1, 1, 1,
1.609591, -0.918612, 3.257021, 1, 1, 1, 1, 1,
1.621882, -0.3723969, 1.74376, 1, 1, 1, 1, 1,
1.625597, -0.6124424, 2.707536, 1, 1, 1, 1, 1,
1.625903, -0.9988998, 1.918148, 1, 1, 1, 1, 1,
1.639797, -1.759964, 2.552568, 1, 1, 1, 1, 1,
1.654071, -0.9849243, 2.620806, 0, 0, 1, 1, 1,
1.659324, -0.8985329, 1.141253, 1, 0, 0, 1, 1,
1.668317, 1.807019, -0.4353457, 1, 0, 0, 1, 1,
1.675065, -2.453226, 2.709909, 1, 0, 0, 1, 1,
1.681772, -0.7984463, 1.713973, 1, 0, 0, 1, 1,
1.70658, -0.2064649, 0.001872396, 1, 0, 0, 1, 1,
1.73424, -1.295868, 1.581461, 0, 0, 0, 1, 1,
1.745434, 0.2069908, 1.263316, 0, 0, 0, 1, 1,
1.750046, -0.5231927, 2.833661, 0, 0, 0, 1, 1,
1.759068, 0.425444, 2.999823, 0, 0, 0, 1, 1,
1.796188, 0.8530036, 3.372046, 0, 0, 0, 1, 1,
1.803268, 0.412355, 1.278255, 0, 0, 0, 1, 1,
1.807461, 0.002707285, 0.9443303, 0, 0, 0, 1, 1,
1.812183, -0.1874803, 2.222051, 1, 1, 1, 1, 1,
1.854531, -0.6906046, 2.682754, 1, 1, 1, 1, 1,
1.866655, 0.486035, 0.4379286, 1, 1, 1, 1, 1,
1.920776, 0.2372888, 0.8245174, 1, 1, 1, 1, 1,
1.937802, -1.186639, 3.613963, 1, 1, 1, 1, 1,
1.98866, 1.119488, 1.209707, 1, 1, 1, 1, 1,
1.998469, -0.6063958, 1.194973, 1, 1, 1, 1, 1,
2.028507, 1.035037, 1.312677, 1, 1, 1, 1, 1,
2.030429, -0.9888601, 1.216327, 1, 1, 1, 1, 1,
2.044426, -0.1932124, 1.791373, 1, 1, 1, 1, 1,
2.04565, 1.019405, 2.800965, 1, 1, 1, 1, 1,
2.068777, 0.02251009, 3.332743, 1, 1, 1, 1, 1,
2.144737, 1.210636, 0.6526802, 1, 1, 1, 1, 1,
2.171595, 1.306046, 1.366936, 1, 1, 1, 1, 1,
2.191785, -1.366361, 2.223888, 1, 1, 1, 1, 1,
2.214617, 1.588151, 2.107587, 0, 0, 1, 1, 1,
2.21628, -0.6142793, 1.557028, 1, 0, 0, 1, 1,
2.230592, -0.4177471, 1.742661, 1, 0, 0, 1, 1,
2.276885, -2.060754, 3.094473, 1, 0, 0, 1, 1,
2.307398, 2.029066, 1.760254, 1, 0, 0, 1, 1,
2.350252, 0.290944, 0.2272679, 1, 0, 0, 1, 1,
2.452549, -0.08039738, 1.795578, 0, 0, 0, 1, 1,
2.462138, -0.6588802, 2.33314, 0, 0, 0, 1, 1,
2.465451, -0.0835706, 1.275978, 0, 0, 0, 1, 1,
2.49326, 1.151317, -1.583361, 0, 0, 0, 1, 1,
2.531324, 0.1338884, 0.9796516, 0, 0, 0, 1, 1,
2.641777, 1.508283, 0.6608585, 0, 0, 0, 1, 1,
2.677777, -1.053851, 1.348009, 0, 0, 0, 1, 1,
2.711582, 0.8780328, 0.7257688, 1, 1, 1, 1, 1,
2.786337, 0.3998888, 1.865463, 1, 1, 1, 1, 1,
2.787382, 1.345833, 0.9241062, 1, 1, 1, 1, 1,
2.877728, -1.073194, 1.462842, 1, 1, 1, 1, 1,
3.081015, 2.036427, 0.9967939, 1, 1, 1, 1, 1,
3.109526, 1.12428, 1.101573, 1, 1, 1, 1, 1,
3.22687, -0.3835809, 1.358348, 1, 1, 1, 1, 1
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
var radius = 9.541775;
var distance = 33.51508;
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
mvMatrix.translate( 0.1001055, -0.2129989, 0.2132323 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51508);
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
