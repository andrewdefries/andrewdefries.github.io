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
-2.883641, 1.634536, -2.071367, 1, 0, 0, 1,
-2.843144, -0.02989101, -0.6624312, 1, 0.007843138, 0, 1,
-2.615895, 0.3351897, -0.2681874, 1, 0.01176471, 0, 1,
-2.484653, -0.4264155, -1.704126, 1, 0.01960784, 0, 1,
-2.404212, -0.7813804, -2.038118, 1, 0.02352941, 0, 1,
-2.373806, -0.02685223, -0.1125912, 1, 0.03137255, 0, 1,
-2.364704, 0.4513294, -2.258209, 1, 0.03529412, 0, 1,
-2.308254, -0.3144795, -0.908996, 1, 0.04313726, 0, 1,
-2.304976, -1.13581, -3.416508, 1, 0.04705882, 0, 1,
-2.223451, -0.2974654, 0.05070635, 1, 0.05490196, 0, 1,
-2.217824, 0.7873483, -1.611225, 1, 0.05882353, 0, 1,
-2.171685, -0.432196, -2.4972, 1, 0.06666667, 0, 1,
-2.170412, -0.06923298, -0.9753583, 1, 0.07058824, 0, 1,
-2.128855, 0.3771985, -0.1793116, 1, 0.07843138, 0, 1,
-2.091499, -0.3700808, -3.066292, 1, 0.08235294, 0, 1,
-2.055962, 1.343073, -0.4750094, 1, 0.09019608, 0, 1,
-2.048717, 0.664081, -1.664196, 1, 0.09411765, 0, 1,
-2.015494, -0.6603555, -1.710918, 1, 0.1019608, 0, 1,
-1.970269, -0.04794883, -1.979245, 1, 0.1098039, 0, 1,
-1.959891, 0.3260388, -3.853802, 1, 0.1137255, 0, 1,
-1.958057, -1.188429, -1.425793, 1, 0.1215686, 0, 1,
-1.951646, -0.03710826, -1.440937, 1, 0.1254902, 0, 1,
-1.947157, -0.6152003, -3.142502, 1, 0.1333333, 0, 1,
-1.926457, 1.392634, -2.413198, 1, 0.1372549, 0, 1,
-1.913218, 2.595096, 1.583964, 1, 0.145098, 0, 1,
-1.906559, 0.3327959, -0.7011026, 1, 0.1490196, 0, 1,
-1.89369, -0.4821982, -1.839762, 1, 0.1568628, 0, 1,
-1.868062, -0.05274561, -1.267867, 1, 0.1607843, 0, 1,
-1.852351, -1.171641, -3.263033, 1, 0.1686275, 0, 1,
-1.839479, -0.2841653, -3.266667, 1, 0.172549, 0, 1,
-1.834234, 0.5131189, -1.197987, 1, 0.1803922, 0, 1,
-1.815155, 0.06242178, -0.01282284, 1, 0.1843137, 0, 1,
-1.799969, -0.7490346, -0.08047745, 1, 0.1921569, 0, 1,
-1.773643, -1.761944, -4.410471, 1, 0.1960784, 0, 1,
-1.77097, 0.7525563, 0.7311773, 1, 0.2039216, 0, 1,
-1.768131, 1.578986, 0.1126313, 1, 0.2117647, 0, 1,
-1.759176, 0.269928, 0.1534735, 1, 0.2156863, 0, 1,
-1.753705, 0.07410673, -3.217094, 1, 0.2235294, 0, 1,
-1.74051, 0.1803959, -1.975352, 1, 0.227451, 0, 1,
-1.734532, -1.112677, -2.338917, 1, 0.2352941, 0, 1,
-1.732889, 1.081888, -1.540372, 1, 0.2392157, 0, 1,
-1.711635, -0.2101152, -2.178713, 1, 0.2470588, 0, 1,
-1.710611, -0.6519917, -2.203229, 1, 0.2509804, 0, 1,
-1.70812, -2.100554, -2.201809, 1, 0.2588235, 0, 1,
-1.705281, 0.08711781, -3.265952, 1, 0.2627451, 0, 1,
-1.700007, -1.459834, -3.728549, 1, 0.2705882, 0, 1,
-1.668067, -1.392456, -4.11624, 1, 0.2745098, 0, 1,
-1.629105, 0.2128292, -1.262902, 1, 0.282353, 0, 1,
-1.591258, 0.6402422, -1.951964, 1, 0.2862745, 0, 1,
-1.588507, 0.621632, -0.9340746, 1, 0.2941177, 0, 1,
-1.564964, 0.7952599, -2.43902, 1, 0.3019608, 0, 1,
-1.561343, 0.836449, -1.343686, 1, 0.3058824, 0, 1,
-1.558921, 0.3695935, -1.995664, 1, 0.3137255, 0, 1,
-1.555012, 0.4309785, -0.5959455, 1, 0.3176471, 0, 1,
-1.548563, 0.1286408, -3.229415, 1, 0.3254902, 0, 1,
-1.536233, 0.1543275, -1.538724, 1, 0.3294118, 0, 1,
-1.533533, 0.6054518, -2.090975, 1, 0.3372549, 0, 1,
-1.526457, -0.09893761, -1.762321, 1, 0.3411765, 0, 1,
-1.522687, -0.5201509, -1.668767, 1, 0.3490196, 0, 1,
-1.518961, 1.325253, 0.179802, 1, 0.3529412, 0, 1,
-1.515596, -0.9564598, -2.282586, 1, 0.3607843, 0, 1,
-1.512742, -0.1309623, -2.282794, 1, 0.3647059, 0, 1,
-1.504507, 0.8722396, -2.045281, 1, 0.372549, 0, 1,
-1.500008, 0.2343215, -1.435077, 1, 0.3764706, 0, 1,
-1.491284, 1.256819, 1.113899, 1, 0.3843137, 0, 1,
-1.475637, 1.434294, -0.5658557, 1, 0.3882353, 0, 1,
-1.47541, 0.5153684, -1.377408, 1, 0.3960784, 0, 1,
-1.473007, -0.2274946, -1.333713, 1, 0.4039216, 0, 1,
-1.47038, -0.4424373, -2.540456, 1, 0.4078431, 0, 1,
-1.464608, 0.3421062, -3.11514, 1, 0.4156863, 0, 1,
-1.463916, 0.4676379, -0.8678762, 1, 0.4196078, 0, 1,
-1.449998, 1.37904, -0.8647751, 1, 0.427451, 0, 1,
-1.443342, -1.184593, -1.090631, 1, 0.4313726, 0, 1,
-1.440237, -0.8344272, -1.285715, 1, 0.4392157, 0, 1,
-1.433556, -0.356357, -3.739636, 1, 0.4431373, 0, 1,
-1.433291, -0.6849009, -2.414698, 1, 0.4509804, 0, 1,
-1.429112, 0.515696, 0.7406406, 1, 0.454902, 0, 1,
-1.407209, 0.2761165, -1.417691, 1, 0.4627451, 0, 1,
-1.403997, 0.4118086, -1.172683, 1, 0.4666667, 0, 1,
-1.400436, -0.4200328, -2.24273, 1, 0.4745098, 0, 1,
-1.395379, 1.279276, -1.630618, 1, 0.4784314, 0, 1,
-1.387787, -0.9327639, -2.562904, 1, 0.4862745, 0, 1,
-1.379216, 0.9617367, -1.581286, 1, 0.4901961, 0, 1,
-1.377926, 0.04212288, -0.795339, 1, 0.4980392, 0, 1,
-1.368716, 1.354908, -0.7398378, 1, 0.5058824, 0, 1,
-1.346622, 0.9518754, 2.177588, 1, 0.509804, 0, 1,
-1.333243, 0.7498286, -1.269306, 1, 0.5176471, 0, 1,
-1.329121, 0.2210509, -1.559461, 1, 0.5215687, 0, 1,
-1.315196, -0.4151638, -3.787536, 1, 0.5294118, 0, 1,
-1.307502, -1.189946, -1.277026, 1, 0.5333334, 0, 1,
-1.301908, -0.1338219, -1.464918, 1, 0.5411765, 0, 1,
-1.287403, 1.409888, 0.05269954, 1, 0.5450981, 0, 1,
-1.286778, -0.7928431, -4.094281, 1, 0.5529412, 0, 1,
-1.28147, 0.03210277, -0.1759936, 1, 0.5568628, 0, 1,
-1.280328, 0.9707533, -0.739773, 1, 0.5647059, 0, 1,
-1.280082, -0.06976633, -0.2540649, 1, 0.5686275, 0, 1,
-1.276474, 1.46319, 0.2666272, 1, 0.5764706, 0, 1,
-1.265667, -3.256734, -0.985701, 1, 0.5803922, 0, 1,
-1.261938, -1.102564, -2.987363, 1, 0.5882353, 0, 1,
-1.258471, -0.9370029, -0.838876, 1, 0.5921569, 0, 1,
-1.252921, 1.230635, -2.060467, 1, 0.6, 0, 1,
-1.248978, -0.2353635, -2.52082, 1, 0.6078432, 0, 1,
-1.242865, 0.2556677, -1.591283, 1, 0.6117647, 0, 1,
-1.235034, -1.535922, -2.226943, 1, 0.6196079, 0, 1,
-1.22619, -0.2629621, -3.276354, 1, 0.6235294, 0, 1,
-1.218628, 0.6296226, -1.172692, 1, 0.6313726, 0, 1,
-1.215497, -0.07479704, -1.470884, 1, 0.6352941, 0, 1,
-1.215303, -1.046349, -2.266408, 1, 0.6431373, 0, 1,
-1.214774, -0.04281183, -0.2581671, 1, 0.6470588, 0, 1,
-1.21322, 0.609273, -2.693901, 1, 0.654902, 0, 1,
-1.199918, -0.2131719, -1.626079, 1, 0.6588235, 0, 1,
-1.194697, -2.129463, -2.835676, 1, 0.6666667, 0, 1,
-1.192765, -1.026976, -3.036836, 1, 0.6705883, 0, 1,
-1.185523, 0.4729932, -2.266093, 1, 0.6784314, 0, 1,
-1.180547, 0.6404415, 0.05781067, 1, 0.682353, 0, 1,
-1.173582, -0.8133644, -3.478601, 1, 0.6901961, 0, 1,
-1.171747, 1.07855, -0.4705193, 1, 0.6941177, 0, 1,
-1.160527, -0.01581797, -1.493518, 1, 0.7019608, 0, 1,
-1.156588, -0.3001878, -1.312035, 1, 0.7098039, 0, 1,
-1.155048, 0.4590572, -1.154773, 1, 0.7137255, 0, 1,
-1.15069, 0.3727635, -1.117227, 1, 0.7215686, 0, 1,
-1.13816, 0.1853152, -3.420206, 1, 0.7254902, 0, 1,
-1.121688, -1.024918, -0.6085271, 1, 0.7333333, 0, 1,
-1.119, 0.9899057, -1.077298, 1, 0.7372549, 0, 1,
-1.117677, 1.100274, 0.3823091, 1, 0.7450981, 0, 1,
-1.115366, -0.1461485, -1.790591, 1, 0.7490196, 0, 1,
-1.107807, 0.9579574, 0.2777556, 1, 0.7568628, 0, 1,
-1.099816, 0.9369732, -1.021016, 1, 0.7607843, 0, 1,
-1.097335, -0.7312832, -0.6965498, 1, 0.7686275, 0, 1,
-1.095103, -0.05077465, -2.050495, 1, 0.772549, 0, 1,
-1.093042, -1.155198, -1.675366, 1, 0.7803922, 0, 1,
-1.081225, 0.8401986, -0.3073681, 1, 0.7843137, 0, 1,
-1.079153, -0.6956802, -2.676976, 1, 0.7921569, 0, 1,
-1.077974, 1.058723, -1.38384, 1, 0.7960784, 0, 1,
-1.07523, 1.279538, -0.4989898, 1, 0.8039216, 0, 1,
-1.073558, -0.2810195, -1.872115, 1, 0.8117647, 0, 1,
-1.073541, -2.097893, -2.419574, 1, 0.8156863, 0, 1,
-1.069791, -0.1280627, -2.037064, 1, 0.8235294, 0, 1,
-1.06708, -1.183411, -1.2564, 1, 0.827451, 0, 1,
-1.058526, 0.2705401, -0.6222366, 1, 0.8352941, 0, 1,
-1.054727, -0.544466, -1.481141, 1, 0.8392157, 0, 1,
-1.045874, 0.3802037, -0.3930749, 1, 0.8470588, 0, 1,
-1.043679, 0.1478999, -2.280583, 1, 0.8509804, 0, 1,
-1.043558, -0.896795, -1.654852, 1, 0.8588235, 0, 1,
-1.03231, -0.6674009, -0.6027617, 1, 0.8627451, 0, 1,
-1.029576, -0.06450928, -3.210224, 1, 0.8705882, 0, 1,
-1.017919, -1.349911, -2.665349, 1, 0.8745098, 0, 1,
-1.016568, -0.8676908, -2.379134, 1, 0.8823529, 0, 1,
-1.013896, -0.2369503, -3.705832, 1, 0.8862745, 0, 1,
-0.9906099, -0.2712499, -2.269406, 1, 0.8941177, 0, 1,
-0.9884207, -1.659855, -3.466334, 1, 0.8980392, 0, 1,
-0.9747241, -0.6331663, -4.676465, 1, 0.9058824, 0, 1,
-0.9673131, 1.036227, -0.2995092, 1, 0.9137255, 0, 1,
-0.9669204, -0.3595406, -3.145682, 1, 0.9176471, 0, 1,
-0.9566805, 0.1699579, -1.40168, 1, 0.9254902, 0, 1,
-0.9500926, -0.7427729, -0.9838414, 1, 0.9294118, 0, 1,
-0.9473794, 0.4325412, -2.789983, 1, 0.9372549, 0, 1,
-0.9447576, -0.4008516, -2.495465, 1, 0.9411765, 0, 1,
-0.9443538, 0.8178549, -1.786146, 1, 0.9490196, 0, 1,
-0.9443207, -0.01499563, -1.483744, 1, 0.9529412, 0, 1,
-0.9410479, 0.3304817, -3.289199, 1, 0.9607843, 0, 1,
-0.9399291, -2.310877, -3.90814, 1, 0.9647059, 0, 1,
-0.9282301, 2.566275, -1.440531, 1, 0.972549, 0, 1,
-0.9209809, -1.900612, -3.450323, 1, 0.9764706, 0, 1,
-0.9131123, -0.1637387, -1.616715, 1, 0.9843137, 0, 1,
-0.9089787, -0.4520367, -1.470906, 1, 0.9882353, 0, 1,
-0.9006786, -1.052333, -2.419959, 1, 0.9960784, 0, 1,
-0.8921049, -0.5011069, -2.925426, 0.9960784, 1, 0, 1,
-0.8895966, -0.6876255, -3.678087, 0.9921569, 1, 0, 1,
-0.8873042, 1.130275, -1.290299, 0.9843137, 1, 0, 1,
-0.8842632, 0.3871956, -0.3817166, 0.9803922, 1, 0, 1,
-0.8770919, -0.05354916, -1.161114, 0.972549, 1, 0, 1,
-0.875992, 0.4178787, -0.3678221, 0.9686275, 1, 0, 1,
-0.8757619, 0.9090334, -1.436194, 0.9607843, 1, 0, 1,
-0.8719618, -0.6397957, -0.9767766, 0.9568627, 1, 0, 1,
-0.8707596, -1.16296, -4.317995, 0.9490196, 1, 0, 1,
-0.8690034, 0.3613779, -1.526283, 0.945098, 1, 0, 1,
-0.8669851, -1.282592, -3.702156, 0.9372549, 1, 0, 1,
-0.8621747, 0.06117245, 0.02990203, 0.9333333, 1, 0, 1,
-0.8615965, -0.6395911, -2.316758, 0.9254902, 1, 0, 1,
-0.8519012, -0.4606402, -1.26334, 0.9215686, 1, 0, 1,
-0.8484222, -0.8929657, -0.6121539, 0.9137255, 1, 0, 1,
-0.8451974, 1.723774, 0.5986173, 0.9098039, 1, 0, 1,
-0.8446935, -0.4902188, -1.665276, 0.9019608, 1, 0, 1,
-0.8331745, 1.291162, 0.4397326, 0.8941177, 1, 0, 1,
-0.8328447, -0.1926596, -0.1812691, 0.8901961, 1, 0, 1,
-0.8281561, 1.023823, 1.016106, 0.8823529, 1, 0, 1,
-0.8277748, -1.252331, -1.570858, 0.8784314, 1, 0, 1,
-0.8275686, 0.1376565, -2.998655, 0.8705882, 1, 0, 1,
-0.8223719, -1.024994, -1.945499, 0.8666667, 1, 0, 1,
-0.8191593, -1.159818, -2.642758, 0.8588235, 1, 0, 1,
-0.8179234, 1.723447, -0.9070093, 0.854902, 1, 0, 1,
-0.8169163, -0.9156926, -0.5438359, 0.8470588, 1, 0, 1,
-0.8165157, -0.6412047, -1.869706, 0.8431373, 1, 0, 1,
-0.8142476, 0.9037673, -1.635084, 0.8352941, 1, 0, 1,
-0.8135918, -0.4510096, -1.727021, 0.8313726, 1, 0, 1,
-0.8098457, -0.04808819, -1.641334, 0.8235294, 1, 0, 1,
-0.8088268, 0.8681368, -1.442478, 0.8196079, 1, 0, 1,
-0.8046358, 0.5218279, -1.216186, 0.8117647, 1, 0, 1,
-0.8000559, -0.5993864, -1.823137, 0.8078431, 1, 0, 1,
-0.7949973, -0.3870638, -3.227204, 0.8, 1, 0, 1,
-0.7921222, 0.918273, -0.2367627, 0.7921569, 1, 0, 1,
-0.7920631, 2.065198, 0.4057476, 0.7882353, 1, 0, 1,
-0.7766303, 0.2147894, -1.825788, 0.7803922, 1, 0, 1,
-0.7737387, -1.702607, -0.8836397, 0.7764706, 1, 0, 1,
-0.7732251, 0.9662911, -1.083687, 0.7686275, 1, 0, 1,
-0.7726111, -0.5256533, -2.325208, 0.7647059, 1, 0, 1,
-0.7661723, -0.7820132, -2.676771, 0.7568628, 1, 0, 1,
-0.7638363, -1.535816, -2.203937, 0.7529412, 1, 0, 1,
-0.7633504, -0.1786852, -0.8468899, 0.7450981, 1, 0, 1,
-0.7631015, -0.4085997, 0.1571162, 0.7411765, 1, 0, 1,
-0.7617919, 0.3355399, -2.073272, 0.7333333, 1, 0, 1,
-0.7544659, -0.1465475, -1.645439, 0.7294118, 1, 0, 1,
-0.7538432, 0.5475583, -2.592525, 0.7215686, 1, 0, 1,
-0.7534002, 0.1091679, -0.8437737, 0.7176471, 1, 0, 1,
-0.7430773, -0.8832681, -3.020077, 0.7098039, 1, 0, 1,
-0.7381566, 1.632797, 0.3235181, 0.7058824, 1, 0, 1,
-0.7344778, -0.569799, -2.238064, 0.6980392, 1, 0, 1,
-0.7335763, 1.019306, 0.9969609, 0.6901961, 1, 0, 1,
-0.7319286, 1.431585, -0.4350798, 0.6862745, 1, 0, 1,
-0.721929, 1.684578, -0.9583789, 0.6784314, 1, 0, 1,
-0.72159, -1.130832, -2.784286, 0.6745098, 1, 0, 1,
-0.7204183, -1.223437, -1.026214, 0.6666667, 1, 0, 1,
-0.7203588, 0.4573931, -0.6340571, 0.6627451, 1, 0, 1,
-0.718065, -2.226791, -3.058447, 0.654902, 1, 0, 1,
-0.7085122, -0.7852554, -1.710511, 0.6509804, 1, 0, 1,
-0.7029595, 0.8278146, -2.038875, 0.6431373, 1, 0, 1,
-0.7002834, 0.5377273, -2.737507, 0.6392157, 1, 0, 1,
-0.6960742, 0.2641652, -0.6135765, 0.6313726, 1, 0, 1,
-0.6955439, -0.9837778, -2.06759, 0.627451, 1, 0, 1,
-0.6918314, 0.8384258, -1.671898, 0.6196079, 1, 0, 1,
-0.691418, 1.501674, -0.07452548, 0.6156863, 1, 0, 1,
-0.690958, -0.5453771, -2.122317, 0.6078432, 1, 0, 1,
-0.6907849, 1.762339, 1.398545, 0.6039216, 1, 0, 1,
-0.6894751, 1.280712, 0.4081461, 0.5960785, 1, 0, 1,
-0.6880407, 1.21158, -1.267774, 0.5882353, 1, 0, 1,
-0.6866762, -0.9232706, -2.150227, 0.5843138, 1, 0, 1,
-0.684566, 0.3934622, -1.735107, 0.5764706, 1, 0, 1,
-0.6825442, -0.8670141, -2.812962, 0.572549, 1, 0, 1,
-0.6714921, -0.1412679, -2.063971, 0.5647059, 1, 0, 1,
-0.6710899, -0.01967671, -1.260342, 0.5607843, 1, 0, 1,
-0.6660143, -0.09180526, -0.9903954, 0.5529412, 1, 0, 1,
-0.6654801, -1.555125, -3.181723, 0.5490196, 1, 0, 1,
-0.6604951, -0.6348706, -4.529079, 0.5411765, 1, 0, 1,
-0.6589054, 0.4414673, -2.198517, 0.5372549, 1, 0, 1,
-0.655367, -0.2282259, -1.928184, 0.5294118, 1, 0, 1,
-0.6542838, 1.258968, -0.5552403, 0.5254902, 1, 0, 1,
-0.6538988, -1.732007, -3.604367, 0.5176471, 1, 0, 1,
-0.6505007, 0.7022281, -1.643631, 0.5137255, 1, 0, 1,
-0.6503845, -0.9972048, -2.970399, 0.5058824, 1, 0, 1,
-0.6454697, 0.3364905, 1.197397, 0.5019608, 1, 0, 1,
-0.6418356, 0.6251622, -0.06074341, 0.4941176, 1, 0, 1,
-0.6306617, 1.512713, -0.9521285, 0.4862745, 1, 0, 1,
-0.6277932, 0.5537726, -0.02899393, 0.4823529, 1, 0, 1,
-0.6272133, -0.1411319, 0.5733515, 0.4745098, 1, 0, 1,
-0.6233656, -0.355372, -1.34227, 0.4705882, 1, 0, 1,
-0.6224569, 0.7396026, -0.935966, 0.4627451, 1, 0, 1,
-0.6203967, 0.8207948, 0.4438866, 0.4588235, 1, 0, 1,
-0.6140375, 0.09743384, -2.439976, 0.4509804, 1, 0, 1,
-0.6130146, -0.5979952, -1.733117, 0.4470588, 1, 0, 1,
-0.6081836, -1.869023, -2.720289, 0.4392157, 1, 0, 1,
-0.6016607, 0.3034314, -2.62111, 0.4352941, 1, 0, 1,
-0.6003689, 2.068631, 0.252001, 0.427451, 1, 0, 1,
-0.5994716, 1.013153, -1.003741, 0.4235294, 1, 0, 1,
-0.5905529, 1.489285, -1.024608, 0.4156863, 1, 0, 1,
-0.584242, 1.291236, 0.1959522, 0.4117647, 1, 0, 1,
-0.5813656, -0.1311766, 0.7257932, 0.4039216, 1, 0, 1,
-0.581265, 0.1317849, -1.294455, 0.3960784, 1, 0, 1,
-0.5805422, 1.467598, 0.4409788, 0.3921569, 1, 0, 1,
-0.5779453, 0.1285686, -0.5443892, 0.3843137, 1, 0, 1,
-0.5741015, -1.710711, -2.685896, 0.3803922, 1, 0, 1,
-0.5725961, 0.821731, -0.0511579, 0.372549, 1, 0, 1,
-0.5716414, 0.1657277, -0.5750135, 0.3686275, 1, 0, 1,
-0.5706997, 0.4755518, 0.4048818, 0.3607843, 1, 0, 1,
-0.564977, 0.1592309, -1.582966, 0.3568628, 1, 0, 1,
-0.5648363, 0.4807697, -2.226624, 0.3490196, 1, 0, 1,
-0.5647528, -1.125585, -2.319237, 0.345098, 1, 0, 1,
-0.5623893, 2.498621, 1.420432, 0.3372549, 1, 0, 1,
-0.5598732, -0.4299453, -3.485621, 0.3333333, 1, 0, 1,
-0.5594156, -1.82174, -2.47955, 0.3254902, 1, 0, 1,
-0.5503294, 0.5206332, 1.277537, 0.3215686, 1, 0, 1,
-0.5486481, 0.07844224, -2.016729, 0.3137255, 1, 0, 1,
-0.5473251, 0.4922919, -0.4409216, 0.3098039, 1, 0, 1,
-0.5413019, -1.124694, -3.890675, 0.3019608, 1, 0, 1,
-0.5401356, -0.6990182, -3.051751, 0.2941177, 1, 0, 1,
-0.5391882, -0.6167533, -0.05856804, 0.2901961, 1, 0, 1,
-0.538981, -0.4810497, -1.342774, 0.282353, 1, 0, 1,
-0.5381472, -0.6331376, -3.565383, 0.2784314, 1, 0, 1,
-0.5330357, 0.7207971, -0.03868649, 0.2705882, 1, 0, 1,
-0.5320545, 1.783512, 0.2022911, 0.2666667, 1, 0, 1,
-0.5268909, 0.4300543, -0.9903507, 0.2588235, 1, 0, 1,
-0.5267088, 0.6321331, -2.663817, 0.254902, 1, 0, 1,
-0.5260874, 0.1959917, 0.4930852, 0.2470588, 1, 0, 1,
-0.5254689, -0.1573586, -1.320071, 0.2431373, 1, 0, 1,
-0.5235049, -0.4712043, -0.6847608, 0.2352941, 1, 0, 1,
-0.5165101, -1.977003, -2.036503, 0.2313726, 1, 0, 1,
-0.5151932, -1.063574, -3.794724, 0.2235294, 1, 0, 1,
-0.5142258, 1.387485, -0.0452433, 0.2196078, 1, 0, 1,
-0.5128598, -1.145976, -2.128655, 0.2117647, 1, 0, 1,
-0.4994512, -0.04399498, 0.8116764, 0.2078431, 1, 0, 1,
-0.4975244, 2.404459, 1.775785, 0.2, 1, 0, 1,
-0.4966202, 0.1919112, -1.267195, 0.1921569, 1, 0, 1,
-0.4938008, 0.2895887, -0.8262321, 0.1882353, 1, 0, 1,
-0.4927455, 1.397334, -0.1152664, 0.1803922, 1, 0, 1,
-0.492728, -0.4845584, -0.9472245, 0.1764706, 1, 0, 1,
-0.4874643, -0.3098456, -0.4452737, 0.1686275, 1, 0, 1,
-0.4849152, -0.01270385, -2.001846, 0.1647059, 1, 0, 1,
-0.4821631, -0.859268, -1.527679, 0.1568628, 1, 0, 1,
-0.478693, 0.8961373, -0.2061993, 0.1529412, 1, 0, 1,
-0.4728832, -1.167709, -4.821665, 0.145098, 1, 0, 1,
-0.4719528, -0.4268951, -2.392257, 0.1411765, 1, 0, 1,
-0.4715575, 0.7231946, 1.293194, 0.1333333, 1, 0, 1,
-0.4637343, 0.3984586, 0.427857, 0.1294118, 1, 0, 1,
-0.463071, -1.293962, -2.637017, 0.1215686, 1, 0, 1,
-0.4617307, -1.297334, -3.909704, 0.1176471, 1, 0, 1,
-0.4615256, 0.4188044, -0.8395312, 0.1098039, 1, 0, 1,
-0.4604335, -0.009519772, -1.792117, 0.1058824, 1, 0, 1,
-0.4538786, 0.1687066, -0.6081413, 0.09803922, 1, 0, 1,
-0.4500214, 0.9101354, -0.401212, 0.09019608, 1, 0, 1,
-0.4495923, 0.154127, -2.008148, 0.08627451, 1, 0, 1,
-0.4472289, -0.7062503, -1.885716, 0.07843138, 1, 0, 1,
-0.4413064, 1.350595, -0.8903582, 0.07450981, 1, 0, 1,
-0.4401887, -0.6032637, -4.349322, 0.06666667, 1, 0, 1,
-0.435916, 0.081143, -1.687994, 0.0627451, 1, 0, 1,
-0.4353173, -0.6590933, -2.363481, 0.05490196, 1, 0, 1,
-0.4344164, -0.8281255, -4.645496, 0.05098039, 1, 0, 1,
-0.4328841, -0.7387705, -1.016297, 0.04313726, 1, 0, 1,
-0.4274963, 0.5121086, -1.692975, 0.03921569, 1, 0, 1,
-0.4250109, -0.2480377, -1.141285, 0.03137255, 1, 0, 1,
-0.4215415, 0.07174607, -3.794139, 0.02745098, 1, 0, 1,
-0.4215304, -1.242521, -2.876589, 0.01960784, 1, 0, 1,
-0.4205566, 1.944707, 0.1649047, 0.01568628, 1, 0, 1,
-0.4137121, 0.1448449, -1.758839, 0.007843138, 1, 0, 1,
-0.4129825, -0.8427743, -2.756561, 0.003921569, 1, 0, 1,
-0.4126548, -0.2182534, -1.444094, 0, 1, 0.003921569, 1,
-0.4115826, -0.8982011, -2.472331, 0, 1, 0.01176471, 1,
-0.403196, 2.736507, 0.5697361, 0, 1, 0.01568628, 1,
-0.4031554, -0.4589316, -3.065236, 0, 1, 0.02352941, 1,
-0.4027792, 0.5669582, -0.2719021, 0, 1, 0.02745098, 1,
-0.3992629, -1.185651, -3.969417, 0, 1, 0.03529412, 1,
-0.397116, -2.300052, -3.608577, 0, 1, 0.03921569, 1,
-0.3967323, 0.9300045, -0.9350809, 0, 1, 0.04705882, 1,
-0.3926104, 0.2778854, -1.459985, 0, 1, 0.05098039, 1,
-0.3920438, 0.01842695, -1.647608, 0, 1, 0.05882353, 1,
-0.3858809, -0.07746749, -3.710842, 0, 1, 0.0627451, 1,
-0.3834111, -0.6398564, -4.320485, 0, 1, 0.07058824, 1,
-0.3804474, -1.259574, -2.486487, 0, 1, 0.07450981, 1,
-0.378917, 0.4794255, -0.1028895, 0, 1, 0.08235294, 1,
-0.3769455, 0.9189299, -0.6058642, 0, 1, 0.08627451, 1,
-0.3759621, -0.3088803, -2.981626, 0, 1, 0.09411765, 1,
-0.3742463, -0.5573598, -1.271667, 0, 1, 0.1019608, 1,
-0.3742303, 0.2910547, -1.337354, 0, 1, 0.1058824, 1,
-0.3729458, -0.1690191, -1.619015, 0, 1, 0.1137255, 1,
-0.3711231, 0.6777548, -0.4461219, 0, 1, 0.1176471, 1,
-0.3691975, -2.488543, -4.433989, 0, 1, 0.1254902, 1,
-0.3684192, 1.687288, -0.5229143, 0, 1, 0.1294118, 1,
-0.3671839, -1.288094, -4.111519, 0, 1, 0.1372549, 1,
-0.3567323, 0.6762455, -0.3393914, 0, 1, 0.1411765, 1,
-0.3537171, 1.265216, -1.181604, 0, 1, 0.1490196, 1,
-0.3534081, 0.1140836, -0.5268853, 0, 1, 0.1529412, 1,
-0.3530634, -0.8415263, -3.308561, 0, 1, 0.1607843, 1,
-0.3523305, -1.314648, -5.063812, 0, 1, 0.1647059, 1,
-0.3480524, -0.2751353, -1.922783, 0, 1, 0.172549, 1,
-0.3462755, 0.5148023, -1.467663, 0, 1, 0.1764706, 1,
-0.341392, -0.691177, -0.6622466, 0, 1, 0.1843137, 1,
-0.3410886, 0.08281533, -0.7272272, 0, 1, 0.1882353, 1,
-0.3394448, 0.4508776, -0.7868364, 0, 1, 0.1960784, 1,
-0.3394059, 0.6057218, -0.8110089, 0, 1, 0.2039216, 1,
-0.3379298, -0.2479961, -3.894247, 0, 1, 0.2078431, 1,
-0.3374574, 0.6216851, -1.87276, 0, 1, 0.2156863, 1,
-0.3371423, -0.9417012, -1.604782, 0, 1, 0.2196078, 1,
-0.3365423, 0.3144934, -2.576553, 0, 1, 0.227451, 1,
-0.335548, 0.004609705, -1.031367, 0, 1, 0.2313726, 1,
-0.3342373, -0.1752696, -2.577448, 0, 1, 0.2392157, 1,
-0.3300369, 1.099398, -1.467967, 0, 1, 0.2431373, 1,
-0.3268341, -1.004674, -1.633561, 0, 1, 0.2509804, 1,
-0.3232474, 0.2203571, 0.1541779, 0, 1, 0.254902, 1,
-0.3174146, -1.375378, -2.995456, 0, 1, 0.2627451, 1,
-0.317352, 0.9342517, -0.7335746, 0, 1, 0.2666667, 1,
-0.3146433, -0.09134304, -1.212038, 0, 1, 0.2745098, 1,
-0.3135848, 0.8304322, -0.6249306, 0, 1, 0.2784314, 1,
-0.3098992, 1.770131, -0.1379203, 0, 1, 0.2862745, 1,
-0.3074481, 1.689367, 1.250587, 0, 1, 0.2901961, 1,
-0.3024233, 0.5025192, -1.504395, 0, 1, 0.2980392, 1,
-0.2996974, 1.118038, 0.7803701, 0, 1, 0.3058824, 1,
-0.298215, 0.4913369, -0.9360813, 0, 1, 0.3098039, 1,
-0.2942503, -1.875056, -2.645781, 0, 1, 0.3176471, 1,
-0.2924608, -0.1225228, -2.589394, 0, 1, 0.3215686, 1,
-0.2922205, -0.537453, -3.476741, 0, 1, 0.3294118, 1,
-0.2832042, 2.076042, -0.0874257, 0, 1, 0.3333333, 1,
-0.2831945, -0.7528325, -1.875189, 0, 1, 0.3411765, 1,
-0.2785892, -1.550224, -2.874117, 0, 1, 0.345098, 1,
-0.2777505, -0.8148584, -1.46055, 0, 1, 0.3529412, 1,
-0.2774929, 0.3046153, 0.2894162, 0, 1, 0.3568628, 1,
-0.2726028, 1.824582, -0.51365, 0, 1, 0.3647059, 1,
-0.2715464, -1.373547, -5.192107, 0, 1, 0.3686275, 1,
-0.2712059, 0.0569663, -0.8183679, 0, 1, 0.3764706, 1,
-0.2698244, 0.6731764, -1.579874, 0, 1, 0.3803922, 1,
-0.2693354, -0.28859, -4.294848, 0, 1, 0.3882353, 1,
-0.2681342, 0.250742, 0.6811262, 0, 1, 0.3921569, 1,
-0.2637286, -0.7384658, -5.112455, 0, 1, 0.4, 1,
-0.2607843, 0.8912548, -0.3922012, 0, 1, 0.4078431, 1,
-0.2584766, -2.098579, -5.229038, 0, 1, 0.4117647, 1,
-0.2570681, -0.6418032, -3.450042, 0, 1, 0.4196078, 1,
-0.2553326, 0.2472449, -1.339196, 0, 1, 0.4235294, 1,
-0.2545311, -0.0916082, -4.077346, 0, 1, 0.4313726, 1,
-0.2518474, 0.8648819, -0.3674726, 0, 1, 0.4352941, 1,
-0.2515055, 0.6357453, -2.293377, 0, 1, 0.4431373, 1,
-0.2469482, 0.9292877, -1.012935, 0, 1, 0.4470588, 1,
-0.2465669, -1.276416, -2.72545, 0, 1, 0.454902, 1,
-0.2438651, 0.1948806, -1.009872, 0, 1, 0.4588235, 1,
-0.2437392, -0.918654, -3.072789, 0, 1, 0.4666667, 1,
-0.2411207, -1.165299, -3.944983, 0, 1, 0.4705882, 1,
-0.2386899, -0.3584062, -3.625536, 0, 1, 0.4784314, 1,
-0.2362264, 1.168978, 0.4726599, 0, 1, 0.4823529, 1,
-0.2321101, 0.6718881, -0.5168738, 0, 1, 0.4901961, 1,
-0.2318678, 0.693162, -1.975346, 0, 1, 0.4941176, 1,
-0.23126, 1.124665, 0.1901532, 0, 1, 0.5019608, 1,
-0.2277926, 0.7344726, 0.3624918, 0, 1, 0.509804, 1,
-0.2266016, 0.1545673, -0.3095596, 0, 1, 0.5137255, 1,
-0.2213971, -0.1920892, -3.929609, 0, 1, 0.5215687, 1,
-0.2209617, 2.534531, 0.68233, 0, 1, 0.5254902, 1,
-0.219887, -1.637969, -3.511492, 0, 1, 0.5333334, 1,
-0.2190867, 1.795384, -2.270342, 0, 1, 0.5372549, 1,
-0.2175167, -1.475108, -3.82192, 0, 1, 0.5450981, 1,
-0.214282, -0.310185, -2.929888, 0, 1, 0.5490196, 1,
-0.2131381, 1.266004, -1.097454, 0, 1, 0.5568628, 1,
-0.2125716, 1.158913, 0.1949972, 0, 1, 0.5607843, 1,
-0.2105806, 0.3103119, 0.8048844, 0, 1, 0.5686275, 1,
-0.2093829, -0.280212, -2.388113, 0, 1, 0.572549, 1,
-0.2021751, 1.240208, -1.181726, 0, 1, 0.5803922, 1,
-0.2013965, -0.436535, -3.146342, 0, 1, 0.5843138, 1,
-0.1997347, 0.3801547, -1.121863, 0, 1, 0.5921569, 1,
-0.1987211, -0.5753009, -1.844146, 0, 1, 0.5960785, 1,
-0.1952639, -0.5475256, -2.384128, 0, 1, 0.6039216, 1,
-0.1925855, -0.7602214, -2.744596, 0, 1, 0.6117647, 1,
-0.1921389, 0.4345592, -1.064221, 0, 1, 0.6156863, 1,
-0.1880548, -0.9683408, -3.687284, 0, 1, 0.6235294, 1,
-0.1875295, -0.9981556, -4.609509, 0, 1, 0.627451, 1,
-0.1862429, -0.5503581, -2.902382, 0, 1, 0.6352941, 1,
-0.16714, 1.565535, 0.5369384, 0, 1, 0.6392157, 1,
-0.1667336, 0.4393041, -0.3917555, 0, 1, 0.6470588, 1,
-0.1588626, -1.24674, -3.511751, 0, 1, 0.6509804, 1,
-0.1578769, -0.7962336, -3.242776, 0, 1, 0.6588235, 1,
-0.1561182, 1.026065, -0.2100406, 0, 1, 0.6627451, 1,
-0.1558764, -1.049737, -4.371466, 0, 1, 0.6705883, 1,
-0.1552592, 0.8279401, -0.1846489, 0, 1, 0.6745098, 1,
-0.1493389, -0.6790415, -3.511574, 0, 1, 0.682353, 1,
-0.1486979, 0.09097181, -0.5087945, 0, 1, 0.6862745, 1,
-0.1473965, 0.4368994, 0.5847737, 0, 1, 0.6941177, 1,
-0.1456495, -0.3921274, -2.52541, 0, 1, 0.7019608, 1,
-0.1449323, 0.9146297, -0.3659098, 0, 1, 0.7058824, 1,
-0.135396, 0.3519125, -1.138227, 0, 1, 0.7137255, 1,
-0.1306662, 0.6555207, 0.3821695, 0, 1, 0.7176471, 1,
-0.1294737, -0.9699168, -3.167492, 0, 1, 0.7254902, 1,
-0.1293513, -1.277055, -4.436172, 0, 1, 0.7294118, 1,
-0.121362, 0.4732745, -0.3698569, 0, 1, 0.7372549, 1,
-0.1194427, -0.87632, -2.955951, 0, 1, 0.7411765, 1,
-0.116449, 0.8273436, -1.797336, 0, 1, 0.7490196, 1,
-0.1136002, -0.4312704, -5.874469, 0, 1, 0.7529412, 1,
-0.1115171, -0.472875, -4.174355, 0, 1, 0.7607843, 1,
-0.1100149, -0.07387404, -1.288723, 0, 1, 0.7647059, 1,
-0.109972, -0.02056983, -2.129349, 0, 1, 0.772549, 1,
-0.1083891, 0.5901807, 0.9295795, 0, 1, 0.7764706, 1,
-0.10681, 0.331356, -0.6567506, 0, 1, 0.7843137, 1,
-0.1053063, 0.2897573, -1.367488, 0, 1, 0.7882353, 1,
-0.1015011, 0.3332699, -0.4000947, 0, 1, 0.7960784, 1,
-0.1014179, 0.6542058, -1.136134, 0, 1, 0.8039216, 1,
-0.1004193, 1.371013, -0.9728549, 0, 1, 0.8078431, 1,
-0.09890784, 0.2489076, -1.377439, 0, 1, 0.8156863, 1,
-0.09836213, -0.5365831, -2.275485, 0, 1, 0.8196079, 1,
-0.09009539, 0.7957531, 0.02896871, 0, 1, 0.827451, 1,
-0.0869547, -0.8643851, -1.998785, 0, 1, 0.8313726, 1,
-0.08608492, -0.2363617, -0.4724543, 0, 1, 0.8392157, 1,
-0.08568241, -0.2866053, -2.406957, 0, 1, 0.8431373, 1,
-0.08299512, -0.3675932, -2.674767, 0, 1, 0.8509804, 1,
-0.0814015, -1.05978, -5.202217, 0, 1, 0.854902, 1,
-0.08019034, -0.2304255, -2.616097, 0, 1, 0.8627451, 1,
-0.0774148, -0.8108035, -3.26478, 0, 1, 0.8666667, 1,
-0.07725041, -0.4328423, -2.541978, 0, 1, 0.8745098, 1,
-0.07295246, 0.9212121, 0.5689172, 0, 1, 0.8784314, 1,
-0.06998359, 0.6301672, 0.2292567, 0, 1, 0.8862745, 1,
-0.06892662, -0.6616862, -4.359967, 0, 1, 0.8901961, 1,
-0.06811395, -1.47875, -3.26514, 0, 1, 0.8980392, 1,
-0.06561894, -0.5063088, -2.46675, 0, 1, 0.9058824, 1,
-0.06169509, 1.145288, -0.6977253, 0, 1, 0.9098039, 1,
-0.05472443, 1.495733, 0.2685482, 0, 1, 0.9176471, 1,
-0.05131341, 0.4936878, 0.3189999, 0, 1, 0.9215686, 1,
-0.05067318, -0.5937704, -2.111757, 0, 1, 0.9294118, 1,
-0.04775938, 0.2814363, 0.03216708, 0, 1, 0.9333333, 1,
-0.04735352, -1.781839, -3.116494, 0, 1, 0.9411765, 1,
-0.04592304, -0.2331505, -2.02389, 0, 1, 0.945098, 1,
-0.0405129, -0.3367468, -2.104991, 0, 1, 0.9529412, 1,
-0.03377864, 0.09845397, 1.367073, 0, 1, 0.9568627, 1,
-0.03177987, -0.3833789, -1.819169, 0, 1, 0.9647059, 1,
-0.03159614, -0.3931981, -2.943536, 0, 1, 0.9686275, 1,
-0.02867786, -0.8100232, -2.904854, 0, 1, 0.9764706, 1,
-0.02831397, 0.911733, -1.040974, 0, 1, 0.9803922, 1,
-0.01631377, -0.2104935, -2.779127, 0, 1, 0.9882353, 1,
-0.01624735, 0.1295518, 0.435389, 0, 1, 0.9921569, 1,
-0.01080765, 0.943257, 0.2378164, 0, 1, 1, 1,
-0.007816918, 1.024099, -0.7498563, 0, 0.9921569, 1, 1,
-0.00514194, 0.5969756, 0.5439664, 0, 0.9882353, 1, 1,
-0.002800361, -0.2191629, -2.500662, 0, 0.9803922, 1, 1,
-0.002202491, 0.6696535, 0.2058339, 0, 0.9764706, 1, 1,
-0.0003668893, -0.2855421, -4.421634, 0, 0.9686275, 1, 1,
0.0009950624, 1.924498, 0.03139625, 0, 0.9647059, 1, 1,
0.002685671, -0.1558681, 4.901558, 0, 0.9568627, 1, 1,
0.003292768, 0.5672429, 0.5155827, 0, 0.9529412, 1, 1,
0.01498471, 1.104789, -0.519308, 0, 0.945098, 1, 1,
0.01512661, 0.11204, 1.023951, 0, 0.9411765, 1, 1,
0.02095445, -1.541037, 3.661573, 0, 0.9333333, 1, 1,
0.02349992, -1.593347, 5.055329, 0, 0.9294118, 1, 1,
0.02519701, 0.364828, 1.936573, 0, 0.9215686, 1, 1,
0.0297502, 0.4348259, 1.953404, 0, 0.9176471, 1, 1,
0.03018806, -0.3788245, 1.408456, 0, 0.9098039, 1, 1,
0.03093832, -0.6313362, 2.941813, 0, 0.9058824, 1, 1,
0.03128719, 1.551347, -0.1080595, 0, 0.8980392, 1, 1,
0.03248587, -1.960177, 2.966948, 0, 0.8901961, 1, 1,
0.03532284, -1.112725, 1.991538, 0, 0.8862745, 1, 1,
0.04446612, -0.3018435, 4.323057, 0, 0.8784314, 1, 1,
0.04747325, 0.245658, 0.1765182, 0, 0.8745098, 1, 1,
0.04819356, -1.097822, 0.7601144, 0, 0.8666667, 1, 1,
0.05121524, -0.09621585, 3.651032, 0, 0.8627451, 1, 1,
0.05144683, -0.9892715, 2.741324, 0, 0.854902, 1, 1,
0.05177437, 0.112124, 1.438739, 0, 0.8509804, 1, 1,
0.05379228, 0.6325524, 1.899968, 0, 0.8431373, 1, 1,
0.05710652, -0.7602734, 4.506205, 0, 0.8392157, 1, 1,
0.05792851, 1.846261, 0.9645829, 0, 0.8313726, 1, 1,
0.05944328, -0.04127571, 2.901318, 0, 0.827451, 1, 1,
0.05973797, -1.769585, 2.494486, 0, 0.8196079, 1, 1,
0.06234321, 0.2631644, 0.2859892, 0, 0.8156863, 1, 1,
0.06287394, 2.12964, -0.01954635, 0, 0.8078431, 1, 1,
0.06331012, 0.9666849, 0.6793471, 0, 0.8039216, 1, 1,
0.06474594, 0.6297609, 1.073414, 0, 0.7960784, 1, 1,
0.06525639, -0.7675869, 3.683094, 0, 0.7882353, 1, 1,
0.06529839, 0.02495037, 2.627189, 0, 0.7843137, 1, 1,
0.06599625, -0.9140405, 1.481782, 0, 0.7764706, 1, 1,
0.0671678, -0.8287639, 2.863786, 0, 0.772549, 1, 1,
0.07053709, 0.132103, 2.965481, 0, 0.7647059, 1, 1,
0.07073665, -0.8940091, 3.867126, 0, 0.7607843, 1, 1,
0.07111022, 0.1115556, 1.237704, 0, 0.7529412, 1, 1,
0.07208433, -0.2081425, 3.090667, 0, 0.7490196, 1, 1,
0.07315759, -0.1544573, 2.160311, 0, 0.7411765, 1, 1,
0.07333002, 0.5286717, 0.9422451, 0, 0.7372549, 1, 1,
0.0740879, 0.4460238, 0.9339237, 0, 0.7294118, 1, 1,
0.08179139, 1.245233, 1.293311, 0, 0.7254902, 1, 1,
0.08687551, -2.933288, 5.051145, 0, 0.7176471, 1, 1,
0.08836548, -0.9048914, 3.679498, 0, 0.7137255, 1, 1,
0.08907126, -0.9677143, 2.960368, 0, 0.7058824, 1, 1,
0.08922917, 0.3493953, -0.9818504, 0, 0.6980392, 1, 1,
0.09059771, 0.1123428, 1.846259, 0, 0.6941177, 1, 1,
0.09083501, -0.2196286, 2.385259, 0, 0.6862745, 1, 1,
0.09160664, 0.386193, 0.9019249, 0, 0.682353, 1, 1,
0.09686927, -0.4103771, 2.288514, 0, 0.6745098, 1, 1,
0.09714713, -0.5902191, 4.437146, 0, 0.6705883, 1, 1,
0.09825329, -0.6746624, 2.330803, 0, 0.6627451, 1, 1,
0.09855424, 0.2810228, 0.04987298, 0, 0.6588235, 1, 1,
0.09873701, 0.01616503, 0.5372666, 0, 0.6509804, 1, 1,
0.1049034, 0.03084, 0.7538838, 0, 0.6470588, 1, 1,
0.1069921, 1.726388, 1.360492, 0, 0.6392157, 1, 1,
0.1070838, 0.9735309, -0.1963029, 0, 0.6352941, 1, 1,
0.1082334, -0.2250331, 2.575705, 0, 0.627451, 1, 1,
0.1089105, -0.03508641, 2.377624, 0, 0.6235294, 1, 1,
0.1093098, 0.1658992, 2.215081, 0, 0.6156863, 1, 1,
0.1094177, 0.4454719, 2.07074, 0, 0.6117647, 1, 1,
0.1096682, -0.3775341, 2.161344, 0, 0.6039216, 1, 1,
0.1116428, -0.528547, 2.78751, 0, 0.5960785, 1, 1,
0.1175752, -1.631365, 3.403809, 0, 0.5921569, 1, 1,
0.1227154, -0.5571008, 3.571163, 0, 0.5843138, 1, 1,
0.1272407, -0.5018706, 3.164639, 0, 0.5803922, 1, 1,
0.1296697, 0.03572924, 0.5946922, 0, 0.572549, 1, 1,
0.1317703, 1.102158, 2.083087, 0, 0.5686275, 1, 1,
0.1329626, -0.2081768, 0.474204, 0, 0.5607843, 1, 1,
0.1443665, 1.271378, 0.1221942, 0, 0.5568628, 1, 1,
0.1520239, -1.066551, 4.661693, 0, 0.5490196, 1, 1,
0.1549408, -1.565894, 3.921999, 0, 0.5450981, 1, 1,
0.161171, -0.1064421, 3.982528, 0, 0.5372549, 1, 1,
0.1612713, 0.8690583, 1.135094, 0, 0.5333334, 1, 1,
0.1640615, -1.83971, 2.99492, 0, 0.5254902, 1, 1,
0.1665884, -1.562258, 2.754563, 0, 0.5215687, 1, 1,
0.1668939, 0.5457497, 0.3531998, 0, 0.5137255, 1, 1,
0.1684727, -0.7220601, 3.164853, 0, 0.509804, 1, 1,
0.1704655, 0.1116487, 0.251873, 0, 0.5019608, 1, 1,
0.1730506, 0.6318262, 0.369078, 0, 0.4941176, 1, 1,
0.179345, 0.5844026, -0.06103867, 0, 0.4901961, 1, 1,
0.1794136, -0.2726128, 1.742429, 0, 0.4823529, 1, 1,
0.187361, 0.1256445, -0.1325615, 0, 0.4784314, 1, 1,
0.1907903, -0.6880292, 4.102933, 0, 0.4705882, 1, 1,
0.1916517, -0.3941808, 1.759663, 0, 0.4666667, 1, 1,
0.1931355, 2.448799, 0.8950451, 0, 0.4588235, 1, 1,
0.193747, 0.8338768, -0.4358036, 0, 0.454902, 1, 1,
0.2006029, 0.4390822, 0.8871427, 0, 0.4470588, 1, 1,
0.2010079, 1.92354, 0.1020024, 0, 0.4431373, 1, 1,
0.2053163, 0.3241012, -1.156089, 0, 0.4352941, 1, 1,
0.2058908, -0.8174304, 2.001214, 0, 0.4313726, 1, 1,
0.2114782, 0.1917512, 0.1373173, 0, 0.4235294, 1, 1,
0.2217628, -0.4554107, 2.437868, 0, 0.4196078, 1, 1,
0.2257093, 0.8848808, 0.779918, 0, 0.4117647, 1, 1,
0.2271373, -0.42368, 1.914936, 0, 0.4078431, 1, 1,
0.22845, 0.106511, -0.3499884, 0, 0.4, 1, 1,
0.2289034, -0.006676999, 1.899829, 0, 0.3921569, 1, 1,
0.229468, -0.3283802, 3.359751, 0, 0.3882353, 1, 1,
0.2332887, -0.91368, 1.998109, 0, 0.3803922, 1, 1,
0.2337872, 0.714483, 1.062253, 0, 0.3764706, 1, 1,
0.2381728, 0.0007722623, 0.6488356, 0, 0.3686275, 1, 1,
0.2386367, 1.136051, 0.9534742, 0, 0.3647059, 1, 1,
0.2405509, -0.7590326, 3.733366, 0, 0.3568628, 1, 1,
0.2418078, 2.558025, -1.647751, 0, 0.3529412, 1, 1,
0.2447317, 0.4054231, 0.5517594, 0, 0.345098, 1, 1,
0.2505342, -0.8392694, 3.617635, 0, 0.3411765, 1, 1,
0.2583395, 1.152669, -1.004116, 0, 0.3333333, 1, 1,
0.2632002, 1.208902, 0.8616048, 0, 0.3294118, 1, 1,
0.2651028, 0.1869002, 1.161754, 0, 0.3215686, 1, 1,
0.2654524, -0.6423066, 3.262486, 0, 0.3176471, 1, 1,
0.2673762, 0.9441597, -0.1271366, 0, 0.3098039, 1, 1,
0.2731413, 1.306258, -0.6622517, 0, 0.3058824, 1, 1,
0.2735297, -0.08148196, 0.2294739, 0, 0.2980392, 1, 1,
0.274303, 0.6400231, 0.08625086, 0, 0.2901961, 1, 1,
0.2870745, -1.832124, 2.984974, 0, 0.2862745, 1, 1,
0.2910545, -0.114499, 1.431819, 0, 0.2784314, 1, 1,
0.2927763, 0.1754765, 1.359506, 0, 0.2745098, 1, 1,
0.2998239, 0.7263213, 1.381619, 0, 0.2666667, 1, 1,
0.3009109, -0.8726504, 3.433071, 0, 0.2627451, 1, 1,
0.3025907, -0.2060981, 1.941646, 0, 0.254902, 1, 1,
0.3026374, 1.48582, -2.568669, 0, 0.2509804, 1, 1,
0.3031719, -0.2520723, 3.148501, 0, 0.2431373, 1, 1,
0.3069885, -0.1409866, 3.025901, 0, 0.2392157, 1, 1,
0.307067, 0.8941625, -0.1728348, 0, 0.2313726, 1, 1,
0.3086483, 2.125626, -0.1535082, 0, 0.227451, 1, 1,
0.3201673, -0.16478, 2.109587, 0, 0.2196078, 1, 1,
0.3237554, 2.472444, -0.269772, 0, 0.2156863, 1, 1,
0.3288016, -0.04246429, 0.474994, 0, 0.2078431, 1, 1,
0.3317384, 1.137431, 0.9065449, 0, 0.2039216, 1, 1,
0.3355969, -0.7982045, 4.15036, 0, 0.1960784, 1, 1,
0.335629, 0.7777098, 0.5275927, 0, 0.1882353, 1, 1,
0.3382734, -0.05135519, -0.0191515, 0, 0.1843137, 1, 1,
0.3422735, -0.6228647, 1.272211, 0, 0.1764706, 1, 1,
0.3443942, 1.542075, 1.640178, 0, 0.172549, 1, 1,
0.3457796, 0.6117338, 0.9300618, 0, 0.1647059, 1, 1,
0.3474748, 0.9329269, 0.7034889, 0, 0.1607843, 1, 1,
0.3509888, 1.816227, 0.2858115, 0, 0.1529412, 1, 1,
0.3526293, -1.407235, 2.329961, 0, 0.1490196, 1, 1,
0.3588944, -0.2812669, 3.427435, 0, 0.1411765, 1, 1,
0.3599598, 0.9902403, 1.415623, 0, 0.1372549, 1, 1,
0.3625182, -0.5491908, 3.881126, 0, 0.1294118, 1, 1,
0.3760721, 0.9065905, 0.868513, 0, 0.1254902, 1, 1,
0.3769706, -0.8808432, 3.387517, 0, 0.1176471, 1, 1,
0.3774867, -0.9643809, 3.111266, 0, 0.1137255, 1, 1,
0.3806463, -1.227265, 3.066031, 0, 0.1058824, 1, 1,
0.3834088, 0.3372629, 0.3931361, 0, 0.09803922, 1, 1,
0.3834334, -0.6341898, 2.063248, 0, 0.09411765, 1, 1,
0.3896698, -1.079569, 3.580388, 0, 0.08627451, 1, 1,
0.3924656, 0.3930116, 1.427816, 0, 0.08235294, 1, 1,
0.3961774, 1.52025, -0.8235589, 0, 0.07450981, 1, 1,
0.3980067, -0.5755644, 2.252476, 0, 0.07058824, 1, 1,
0.3984195, 0.2351638, 2.246573, 0, 0.0627451, 1, 1,
0.4037722, 1.062764, -0.4250796, 0, 0.05882353, 1, 1,
0.4060602, -0.7434739, 2.470952, 0, 0.05098039, 1, 1,
0.4086474, -0.8912076, 4.076831, 0, 0.04705882, 1, 1,
0.4091223, -0.007632588, 1.281733, 0, 0.03921569, 1, 1,
0.4128322, -0.09129988, 2.673316, 0, 0.03529412, 1, 1,
0.4132175, 0.8067797, 0.8002955, 0, 0.02745098, 1, 1,
0.4172649, -0.2243584, 1.071587, 0, 0.02352941, 1, 1,
0.4222724, 1.393101, -0.4531501, 0, 0.01568628, 1, 1,
0.4231233, 0.4586332, 2.18037, 0, 0.01176471, 1, 1,
0.4243308, 0.1204574, 3.492193, 0, 0.003921569, 1, 1,
0.4281778, 1.497331, -0.5490102, 0.003921569, 0, 1, 1,
0.4303519, 0.2865165, 1.39287, 0.007843138, 0, 1, 1,
0.4323098, -1.289594, 2.423123, 0.01568628, 0, 1, 1,
0.4333516, -0.5235587, 2.1874, 0.01960784, 0, 1, 1,
0.4339471, -1.022425, 2.963426, 0.02745098, 0, 1, 1,
0.4358446, -0.1399578, 2.087483, 0.03137255, 0, 1, 1,
0.448636, -0.9210461, 2.432863, 0.03921569, 0, 1, 1,
0.4493763, -0.6614146, 3.382158, 0.04313726, 0, 1, 1,
0.4507342, 0.8349565, -1.286375, 0.05098039, 0, 1, 1,
0.4522946, -1.082805, 2.696051, 0.05490196, 0, 1, 1,
0.4549029, 0.09533254, -0.0917694, 0.0627451, 0, 1, 1,
0.4560696, 0.5758443, -0.3637633, 0.06666667, 0, 1, 1,
0.45939, -2.737869, 2.740177, 0.07450981, 0, 1, 1,
0.4627338, 2.06357, 0.03700123, 0.07843138, 0, 1, 1,
0.4642885, 0.6973103, 1.374953, 0.08627451, 0, 1, 1,
0.4670664, -1.538681, 1.197062, 0.09019608, 0, 1, 1,
0.4687594, -0.7368463, 2.144177, 0.09803922, 0, 1, 1,
0.4695852, 1.074971, 1.269104, 0.1058824, 0, 1, 1,
0.4760392, 1.082143, 0.7871348, 0.1098039, 0, 1, 1,
0.4797293, 0.105279, 0.2734305, 0.1176471, 0, 1, 1,
0.4861886, 0.04585207, 0.3233027, 0.1215686, 0, 1, 1,
0.4877238, -0.9141132, 3.616947, 0.1294118, 0, 1, 1,
0.4982474, 0.2861062, 1.109053, 0.1333333, 0, 1, 1,
0.4985194, -0.5714213, 5.494493, 0.1411765, 0, 1, 1,
0.5029433, 0.8487028, -0.6660021, 0.145098, 0, 1, 1,
0.5059084, 2.415956, 0.08246399, 0.1529412, 0, 1, 1,
0.5066593, 1.617966, -0.1224919, 0.1568628, 0, 1, 1,
0.5069677, -1.088916, 1.573982, 0.1647059, 0, 1, 1,
0.5091861, -1.28993, 3.517543, 0.1686275, 0, 1, 1,
0.5119669, 1.031792, 1.946738, 0.1764706, 0, 1, 1,
0.5143911, 0.3121591, 0.1035605, 0.1803922, 0, 1, 1,
0.51526, 0.6638761, 0.2075645, 0.1882353, 0, 1, 1,
0.5159422, 0.3091357, 2.890571, 0.1921569, 0, 1, 1,
0.5224471, -0.04705181, 1.729432, 0.2, 0, 1, 1,
0.5267369, 0.9011212, -1.923866, 0.2078431, 0, 1, 1,
0.5319359, -0.3555955, 2.251327, 0.2117647, 0, 1, 1,
0.5361563, 0.410694, 0.8559945, 0.2196078, 0, 1, 1,
0.5364585, -1.199229, 2.616588, 0.2235294, 0, 1, 1,
0.5406488, 0.627202, 1.005355, 0.2313726, 0, 1, 1,
0.5417853, 1.377858, -0.6200359, 0.2352941, 0, 1, 1,
0.5422966, -1.915543, 4.122795, 0.2431373, 0, 1, 1,
0.5426906, -0.8351191, 1.742648, 0.2470588, 0, 1, 1,
0.5436879, -1.287952, 1.27352, 0.254902, 0, 1, 1,
0.5442312, -0.08122346, 2.124859, 0.2588235, 0, 1, 1,
0.5488141, 1.731784, -0.2616107, 0.2666667, 0, 1, 1,
0.5488814, -0.06285419, 1.839102, 0.2705882, 0, 1, 1,
0.5492927, -0.8302016, 3.884179, 0.2784314, 0, 1, 1,
0.5508872, 0.1471976, -0.2593763, 0.282353, 0, 1, 1,
0.5510165, 1.065969, 0.02626807, 0.2901961, 0, 1, 1,
0.5514662, -0.1272689, 0.2645127, 0.2941177, 0, 1, 1,
0.5527188, -0.3190513, 3.320074, 0.3019608, 0, 1, 1,
0.5530009, -1.085556, 4.552486, 0.3098039, 0, 1, 1,
0.5615807, 1.565136, -0.3337882, 0.3137255, 0, 1, 1,
0.5653673, 0.2995335, -0.3083314, 0.3215686, 0, 1, 1,
0.5728819, 1.712421, 1.925158, 0.3254902, 0, 1, 1,
0.5756969, 0.7805322, 0.4881285, 0.3333333, 0, 1, 1,
0.5773908, -0.2750773, 2.406392, 0.3372549, 0, 1, 1,
0.5957847, -0.4797592, 2.997751, 0.345098, 0, 1, 1,
0.5975208, 0.3206272, -0.4077867, 0.3490196, 0, 1, 1,
0.5992221, 0.1406908, 0.7090718, 0.3568628, 0, 1, 1,
0.5993019, 0.6069986, 1.322466, 0.3607843, 0, 1, 1,
0.6009665, -0.4591532, 0.9182116, 0.3686275, 0, 1, 1,
0.6030791, -0.7600788, 2.226974, 0.372549, 0, 1, 1,
0.6041369, -0.8125466, 2.83719, 0.3803922, 0, 1, 1,
0.6050353, 0.6687068, -0.06413744, 0.3843137, 0, 1, 1,
0.6056832, -0.3477412, 1.700983, 0.3921569, 0, 1, 1,
0.605819, -2.177641, 2.340452, 0.3960784, 0, 1, 1,
0.6122466, -0.8874242, 2.458551, 0.4039216, 0, 1, 1,
0.6151631, -2.136825, 1.807401, 0.4117647, 0, 1, 1,
0.6170146, 0.7505031, 1.237246, 0.4156863, 0, 1, 1,
0.6197867, -2.19022, 2.869498, 0.4235294, 0, 1, 1,
0.6278544, 2.165236, 0.04035357, 0.427451, 0, 1, 1,
0.6280642, -1.059935, 1.86794, 0.4352941, 0, 1, 1,
0.6294423, 0.3854387, 1.972674, 0.4392157, 0, 1, 1,
0.6361706, -1.35007, 3.648136, 0.4470588, 0, 1, 1,
0.6386154, -1.446099, 2.629101, 0.4509804, 0, 1, 1,
0.6388307, -0.2372668, 1.145537, 0.4588235, 0, 1, 1,
0.6423583, -2.041485, 3.620131, 0.4627451, 0, 1, 1,
0.6446124, -1.855447, 2.714551, 0.4705882, 0, 1, 1,
0.6448718, -2.162769, 3.617131, 0.4745098, 0, 1, 1,
0.669036, 1.926556, 0.2364002, 0.4823529, 0, 1, 1,
0.6755602, 1.459233, -0.7046859, 0.4862745, 0, 1, 1,
0.6777411, -0.3096769, 1.305479, 0.4941176, 0, 1, 1,
0.6964799, -0.6276888, 1.092902, 0.5019608, 0, 1, 1,
0.7015309, -0.550479, 1.399462, 0.5058824, 0, 1, 1,
0.7024294, 1.951674, -0.9892235, 0.5137255, 0, 1, 1,
0.7074714, 1.148188, 2.169637, 0.5176471, 0, 1, 1,
0.7088518, 0.8758517, 0.5527959, 0.5254902, 0, 1, 1,
0.7098823, -0.1589557, 0.8062121, 0.5294118, 0, 1, 1,
0.7106473, 0.6222895, 0.7648404, 0.5372549, 0, 1, 1,
0.7131181, -1.678456, 3.046169, 0.5411765, 0, 1, 1,
0.7147683, -0.787096, 2.316185, 0.5490196, 0, 1, 1,
0.7165565, 0.5910558, 0.2177999, 0.5529412, 0, 1, 1,
0.7175085, 1.145783, -0.03413402, 0.5607843, 0, 1, 1,
0.7188926, 0.5542986, -1.050766, 0.5647059, 0, 1, 1,
0.7223746, -0.977433, 2.739531, 0.572549, 0, 1, 1,
0.7229803, 0.3268629, 1.448875, 0.5764706, 0, 1, 1,
0.725402, -1.74141, 3.289572, 0.5843138, 0, 1, 1,
0.7292114, 1.092029, 0.08685051, 0.5882353, 0, 1, 1,
0.7312537, 0.4119896, 2.449211, 0.5960785, 0, 1, 1,
0.7336414, 1.067523, 0.9517915, 0.6039216, 0, 1, 1,
0.7353458, 0.2141591, 1.629053, 0.6078432, 0, 1, 1,
0.7446105, 0.5864867, -1.543965, 0.6156863, 0, 1, 1,
0.7591476, 0.2031591, 0.4262892, 0.6196079, 0, 1, 1,
0.7592314, 0.7929412, 0.5960577, 0.627451, 0, 1, 1,
0.7643517, -0.9258304, 2.228085, 0.6313726, 0, 1, 1,
0.7654986, 0.5469232, 0.8518087, 0.6392157, 0, 1, 1,
0.7672613, 0.01384697, 1.758286, 0.6431373, 0, 1, 1,
0.776661, 1.115704, 0.2184648, 0.6509804, 0, 1, 1,
0.7781082, 1.048308, -0.5115208, 0.654902, 0, 1, 1,
0.7821206, 0.2729785, 2.254692, 0.6627451, 0, 1, 1,
0.791255, -0.05459179, 1.476532, 0.6666667, 0, 1, 1,
0.7919044, 0.506174, -0.0645282, 0.6745098, 0, 1, 1,
0.7950726, 0.906863, -0.4706574, 0.6784314, 0, 1, 1,
0.8005245, 0.5574188, 1.001433, 0.6862745, 0, 1, 1,
0.8008797, -1.292167, 3.457667, 0.6901961, 0, 1, 1,
0.8016151, 0.2615336, 0.2514174, 0.6980392, 0, 1, 1,
0.8021287, 1.452005, -1.480263, 0.7058824, 0, 1, 1,
0.8025169, -0.2959987, 1.096082, 0.7098039, 0, 1, 1,
0.8041626, 0.8772636, 0.6697909, 0.7176471, 0, 1, 1,
0.8054917, -0.2197012, 1.879215, 0.7215686, 0, 1, 1,
0.8078787, -1.360317, 3.810892, 0.7294118, 0, 1, 1,
0.8080192, 0.04123205, 3.814602, 0.7333333, 0, 1, 1,
0.811258, -0.9212276, 2.616848, 0.7411765, 0, 1, 1,
0.8145889, -0.6980441, 2.719243, 0.7450981, 0, 1, 1,
0.8184325, 0.5105733, -0.50129, 0.7529412, 0, 1, 1,
0.8192175, 1.003006, 0.2424035, 0.7568628, 0, 1, 1,
0.8208334, -0.9586097, 4.530557, 0.7647059, 0, 1, 1,
0.8245286, -0.6333269, 1.349896, 0.7686275, 0, 1, 1,
0.8277565, 0.4629842, 2.057506, 0.7764706, 0, 1, 1,
0.8285638, 0.7378032, 0.6320266, 0.7803922, 0, 1, 1,
0.8328088, 0.7092283, 0.5818743, 0.7882353, 0, 1, 1,
0.8342183, 0.3629536, 1.556792, 0.7921569, 0, 1, 1,
0.8349506, -1.363973, 1.180306, 0.8, 0, 1, 1,
0.8391204, 0.4482251, 2.021142, 0.8078431, 0, 1, 1,
0.8400844, -0.3346741, 1.785319, 0.8117647, 0, 1, 1,
0.8517494, -0.262898, 1.924617, 0.8196079, 0, 1, 1,
0.8583241, -0.005520954, 0.04234091, 0.8235294, 0, 1, 1,
0.8642307, -0.651671, 2.172135, 0.8313726, 0, 1, 1,
0.86773, 1.790353, 0.2196437, 0.8352941, 0, 1, 1,
0.8712062, 0.6038237, 0.9563146, 0.8431373, 0, 1, 1,
0.8726167, -0.1433306, 0.9835169, 0.8470588, 0, 1, 1,
0.874551, -0.9261099, 2.231226, 0.854902, 0, 1, 1,
0.8745696, 1.031164, 0.4528155, 0.8588235, 0, 1, 1,
0.8821958, 0.3172278, 1.704585, 0.8666667, 0, 1, 1,
0.8846984, -0.07995686, 2.381294, 0.8705882, 0, 1, 1,
0.8914626, 2.42823, 0.5768401, 0.8784314, 0, 1, 1,
0.8982328, 1.110117, 0.2017799, 0.8823529, 0, 1, 1,
0.9064178, 0.08065843, 1.653499, 0.8901961, 0, 1, 1,
0.9084449, 0.3728794, 0.2896622, 0.8941177, 0, 1, 1,
0.9104794, 0.707, 0.8719445, 0.9019608, 0, 1, 1,
0.9154875, 1.620733, 0.9403749, 0.9098039, 0, 1, 1,
0.9242585, 0.4700245, 1.207632, 0.9137255, 0, 1, 1,
0.9269524, -0.4053482, 2.140239, 0.9215686, 0, 1, 1,
0.9286677, -1.73163, 3.604322, 0.9254902, 0, 1, 1,
0.9334919, 0.1352577, 2.840032, 0.9333333, 0, 1, 1,
0.9380355, -2.269276, 2.635039, 0.9372549, 0, 1, 1,
0.9390863, -0.9024822, 1.945133, 0.945098, 0, 1, 1,
0.9402649, 0.4620381, 2.258039, 0.9490196, 0, 1, 1,
0.9425334, 0.1047238, 2.82809, 0.9568627, 0, 1, 1,
0.9478143, 0.4827764, -0.7119048, 0.9607843, 0, 1, 1,
0.9554085, 0.758462, 1.301525, 0.9686275, 0, 1, 1,
0.9557788, 0.2640977, 2.068846, 0.972549, 0, 1, 1,
0.9573286, 1.269553, 0.04001256, 0.9803922, 0, 1, 1,
0.975732, 1.311122, 1.895807, 0.9843137, 0, 1, 1,
0.9773137, -1.081037, 2.261626, 0.9921569, 0, 1, 1,
0.9859528, 0.04167767, 2.301691, 0.9960784, 0, 1, 1,
0.990695, 0.4336322, -0.4777682, 1, 0, 0.9960784, 1,
0.9912245, 0.4221561, -0.659041, 1, 0, 0.9882353, 1,
0.9929664, 0.1347931, 1.780665, 1, 0, 0.9843137, 1,
0.9959702, -0.5374038, 1.729607, 1, 0, 0.9764706, 1,
1.000717, -0.8109761, 3.241593, 1, 0, 0.972549, 1,
1.011898, 1.602462, 0.7327164, 1, 0, 0.9647059, 1,
1.025153, 0.09839155, 1.644285, 1, 0, 0.9607843, 1,
1.026919, -0.5763841, 2.916587, 1, 0, 0.9529412, 1,
1.028966, 0.3997126, 0.4060856, 1, 0, 0.9490196, 1,
1.030467, 0.3005455, 1.275575, 1, 0, 0.9411765, 1,
1.032163, 0.2126251, 1.125829, 1, 0, 0.9372549, 1,
1.035239, -0.3715667, 1.594484, 1, 0, 0.9294118, 1,
1.04289, 1.275187, 0.3811951, 1, 0, 0.9254902, 1,
1.05051, 0.5528421, 0.5740197, 1, 0, 0.9176471, 1,
1.050792, -0.8065496, 2.37819, 1, 0, 0.9137255, 1,
1.057189, 0.09542442, 0.4081839, 1, 0, 0.9058824, 1,
1.057814, 0.3740253, 1.117552, 1, 0, 0.9019608, 1,
1.058504, 0.2482331, 1.72061, 1, 0, 0.8941177, 1,
1.061551, -0.8231754, 1.556397, 1, 0, 0.8862745, 1,
1.064798, 1.728628, 0.4915725, 1, 0, 0.8823529, 1,
1.066262, -0.5248001, 4.04831, 1, 0, 0.8745098, 1,
1.06734, -2.418864, 3.072965, 1, 0, 0.8705882, 1,
1.069051, 0.5545797, 2.623356, 1, 0, 0.8627451, 1,
1.069527, 1.518996, 0.1223862, 1, 0, 0.8588235, 1,
1.073092, 0.6963843, 1.41648, 1, 0, 0.8509804, 1,
1.075097, 0.1459628, 2.400936, 1, 0, 0.8470588, 1,
1.081994, 1.886521, -1.575567, 1, 0, 0.8392157, 1,
1.082847, 0.9135414, 3.239501, 1, 0, 0.8352941, 1,
1.086498, 1.291545, -0.316865, 1, 0, 0.827451, 1,
1.089467, -0.2416987, 2.8978, 1, 0, 0.8235294, 1,
1.092817, -2.321547, 2.743236, 1, 0, 0.8156863, 1,
1.096836, -0.866389, 1.917793, 1, 0, 0.8117647, 1,
1.099971, 0.724484, 0.3872134, 1, 0, 0.8039216, 1,
1.126543, -0.4800321, 0.9946117, 1, 0, 0.7960784, 1,
1.127444, -1.435665, 2.276915, 1, 0, 0.7921569, 1,
1.130831, 0.6178875, 1.586052, 1, 0, 0.7843137, 1,
1.133962, -0.3868712, 1.688886, 1, 0, 0.7803922, 1,
1.13781, 0.007479812, 2.348655, 1, 0, 0.772549, 1,
1.138693, 0.6335905, 0.4314189, 1, 0, 0.7686275, 1,
1.143277, 0.2263902, -0.1790398, 1, 0, 0.7607843, 1,
1.145659, 1.125631, 0.4345794, 1, 0, 0.7568628, 1,
1.150832, 0.4627814, 1.025236, 1, 0, 0.7490196, 1,
1.152651, 0.5558388, 2.055141, 1, 0, 0.7450981, 1,
1.154065, 0.6128199, 0.8842427, 1, 0, 0.7372549, 1,
1.185963, -0.1177819, -0.2034367, 1, 0, 0.7333333, 1,
1.186869, -0.6482269, -0.1066491, 1, 0, 0.7254902, 1,
1.187611, -1.495494, 1.542971, 1, 0, 0.7215686, 1,
1.20205, 0.9516653, 0.5119188, 1, 0, 0.7137255, 1,
1.211079, -0.5587668, 2.19926, 1, 0, 0.7098039, 1,
1.219261, -0.6198823, 1.534754, 1, 0, 0.7019608, 1,
1.22049, -0.1156417, 3.588879, 1, 0, 0.6941177, 1,
1.221952, -0.9373693, 1.128677, 1, 0, 0.6901961, 1,
1.226411, 0.4854252, 2.04798, 1, 0, 0.682353, 1,
1.231348, 0.30494, 2.539916, 1, 0, 0.6784314, 1,
1.24062, 0.2611566, 1.517083, 1, 0, 0.6705883, 1,
1.240799, -0.5580212, 3.993826, 1, 0, 0.6666667, 1,
1.241262, 0.2440978, 1.464315, 1, 0, 0.6588235, 1,
1.251187, 0.3908786, 3.035945, 1, 0, 0.654902, 1,
1.252912, 1.653516, 0.2178661, 1, 0, 0.6470588, 1,
1.269138, 0.08962125, 1.522112, 1, 0, 0.6431373, 1,
1.269445, -0.2856489, 0.9270415, 1, 0, 0.6352941, 1,
1.269943, -0.7506518, 2.493197, 1, 0, 0.6313726, 1,
1.270895, -1.090888, 1.253942, 1, 0, 0.6235294, 1,
1.275892, 1.119394, -0.9305943, 1, 0, 0.6196079, 1,
1.279042, 0.3485559, 0.3809657, 1, 0, 0.6117647, 1,
1.280983, -1.140929, 1.216332, 1, 0, 0.6078432, 1,
1.294221, -0.1006627, 0.2385786, 1, 0, 0.6, 1,
1.295794, 1.016844, 0.5616119, 1, 0, 0.5921569, 1,
1.30003, -0.651167, 2.575489, 1, 0, 0.5882353, 1,
1.310776, 0.7458595, 1.808681, 1, 0, 0.5803922, 1,
1.311831, 0.8126493, 1.740089, 1, 0, 0.5764706, 1,
1.315716, 1.404387, -0.01724683, 1, 0, 0.5686275, 1,
1.321209, -0.2155816, 1.616555, 1, 0, 0.5647059, 1,
1.330052, -1.017952, 1.812597, 1, 0, 0.5568628, 1,
1.340925, 0.4983482, 0.05624043, 1, 0, 0.5529412, 1,
1.347068, 0.1801104, 0.7557893, 1, 0, 0.5450981, 1,
1.361857, -1.839063, 2.771253, 1, 0, 0.5411765, 1,
1.364239, 0.5214071, -0.6918781, 1, 0, 0.5333334, 1,
1.367761, -1.824884, 1.486816, 1, 0, 0.5294118, 1,
1.368716, -0.5826991, 2.779988, 1, 0, 0.5215687, 1,
1.368814, 0.1268701, 1.93974, 1, 0, 0.5176471, 1,
1.378806, -1.640595, 2.696047, 1, 0, 0.509804, 1,
1.381762, -0.4533936, 1.477653, 1, 0, 0.5058824, 1,
1.391906, -0.1006911, 1.401936, 1, 0, 0.4980392, 1,
1.399427, -0.2091743, 1.032351, 1, 0, 0.4901961, 1,
1.401918, -0.1682624, 1.726999, 1, 0, 0.4862745, 1,
1.408919, -0.4977335, 4.350278, 1, 0, 0.4784314, 1,
1.412333, -1.267949, 3.204358, 1, 0, 0.4745098, 1,
1.414948, -0.2717341, 3.682618, 1, 0, 0.4666667, 1,
1.425627, 1.392399, 2.05712, 1, 0, 0.4627451, 1,
1.439736, -1.199537, 4.178617, 1, 0, 0.454902, 1,
1.446335, 1.087396, 1.015866, 1, 0, 0.4509804, 1,
1.460721, -1.159833, 1.961083, 1, 0, 0.4431373, 1,
1.466115, 0.7474447, 2.953651, 1, 0, 0.4392157, 1,
1.500024, 1.310696, 0.3398765, 1, 0, 0.4313726, 1,
1.502624, 0.7250612, 1.909971, 1, 0, 0.427451, 1,
1.505497, 0.09754053, 1.041759, 1, 0, 0.4196078, 1,
1.506272, -0.9223104, 2.362941, 1, 0, 0.4156863, 1,
1.515292, -0.7683121, 1.90146, 1, 0, 0.4078431, 1,
1.522044, 0.1448674, 1.738686, 1, 0, 0.4039216, 1,
1.529016, -1.10233, -0.2752933, 1, 0, 0.3960784, 1,
1.540995, -3.472742, 3.199872, 1, 0, 0.3882353, 1,
1.545601, -0.8443339, 1.228411, 1, 0, 0.3843137, 1,
1.545842, 0.325797, 0.7752079, 1, 0, 0.3764706, 1,
1.560994, -1.494133, 2.532662, 1, 0, 0.372549, 1,
1.563377, -1.208579, 2.434536, 1, 0, 0.3647059, 1,
1.570077, -1.623898, 3.722338, 1, 0, 0.3607843, 1,
1.579569, -1.273472, 1.817148, 1, 0, 0.3529412, 1,
1.608109, 1.215353, -0.4864328, 1, 0, 0.3490196, 1,
1.619061, -1.318018, 3.297185, 1, 0, 0.3411765, 1,
1.633789, -2.422639, 2.204946, 1, 0, 0.3372549, 1,
1.644243, 0.5916498, 1.911431, 1, 0, 0.3294118, 1,
1.648038, -1.136347, 3.630625, 1, 0, 0.3254902, 1,
1.666625, -0.1227398, 3.650738, 1, 0, 0.3176471, 1,
1.668126, 0.1754245, 1.686255, 1, 0, 0.3137255, 1,
1.669128, -0.8077607, 1.513549, 1, 0, 0.3058824, 1,
1.68023, 1.489298, 1.644493, 1, 0, 0.2980392, 1,
1.682304, -0.6968991, 0.9041702, 1, 0, 0.2941177, 1,
1.697835, 0.6247607, 1.685205, 1, 0, 0.2862745, 1,
1.714362, -1.64337, 3.303939, 1, 0, 0.282353, 1,
1.718855, -0.9842883, 0.7120005, 1, 0, 0.2745098, 1,
1.737146, -0.8857429, 1.510779, 1, 0, 0.2705882, 1,
1.751662, 0.06711692, 2.766186, 1, 0, 0.2627451, 1,
1.754716, -1.930429, 2.548766, 1, 0, 0.2588235, 1,
1.783074, -0.7026888, 1.226017, 1, 0, 0.2509804, 1,
1.796465, -0.7383823, 0.9686493, 1, 0, 0.2470588, 1,
1.801762, -0.2914656, 3.066668, 1, 0, 0.2392157, 1,
1.810903, -0.5971389, 1.623821, 1, 0, 0.2352941, 1,
1.850154, -0.5723877, 1.128774, 1, 0, 0.227451, 1,
1.873729, 1.551542, 2.690522, 1, 0, 0.2235294, 1,
1.881025, 0.6739464, 0.9585819, 1, 0, 0.2156863, 1,
1.881446, -0.641876, 2.901795, 1, 0, 0.2117647, 1,
1.8887, -0.2408409, 1.5099, 1, 0, 0.2039216, 1,
1.890244, -0.6517224, 3.364982, 1, 0, 0.1960784, 1,
1.894207, 0.5752985, 2.053628, 1, 0, 0.1921569, 1,
1.895045, 0.8031735, 2.315799, 1, 0, 0.1843137, 1,
1.917756, 0.8267668, 0.3701862, 1, 0, 0.1803922, 1,
1.934606, -1.079577, 2.76724, 1, 0, 0.172549, 1,
1.95064, -0.4998628, 3.512369, 1, 0, 0.1686275, 1,
2.003663, 2.370059, -1.099295, 1, 0, 0.1607843, 1,
2.015937, 0.4777018, 0.1074721, 1, 0, 0.1568628, 1,
2.020265, -0.6966298, 3.315604, 1, 0, 0.1490196, 1,
2.032788, -0.7766805, 2.534236, 1, 0, 0.145098, 1,
2.054337, -0.01066071, 1.216343, 1, 0, 0.1372549, 1,
2.071822, -1.402533, 2.238092, 1, 0, 0.1333333, 1,
2.093688, -1.126684, 1.816356, 1, 0, 0.1254902, 1,
2.145008, -0.4839096, 3.101275, 1, 0, 0.1215686, 1,
2.149333, -1.710358, 4.829679, 1, 0, 0.1137255, 1,
2.165611, -1.724876, 2.17489, 1, 0, 0.1098039, 1,
2.190056, -1.240953, 3.451715, 1, 0, 0.1019608, 1,
2.203055, 1.313753, 0.831075, 1, 0, 0.09411765, 1,
2.205297, -2.702958, 3.383863, 1, 0, 0.09019608, 1,
2.220781, -2.44028, 2.825668, 1, 0, 0.08235294, 1,
2.237233, 1.516814, 2.380046, 1, 0, 0.07843138, 1,
2.308472, -0.1054599, 1.994991, 1, 0, 0.07058824, 1,
2.311686, -0.008941776, 2.512694, 1, 0, 0.06666667, 1,
2.366087, -0.01199213, 1.252402, 1, 0, 0.05882353, 1,
2.381798, -0.003063858, 1.790238, 1, 0, 0.05490196, 1,
2.385368, -1.480944, -0.3390266, 1, 0, 0.04705882, 1,
2.436103, -2.052459, 2.500379, 1, 0, 0.04313726, 1,
2.447738, 0.1516939, 3.47102, 1, 0, 0.03529412, 1,
2.532446, 0.3653524, -0.0106027, 1, 0, 0.03137255, 1,
2.651594, 1.805021, -0.6439758, 1, 0, 0.02352941, 1,
2.689045, 0.676981, -0.08948728, 1, 0, 0.01960784, 1,
3.227795, 0.7931669, 3.259741, 1, 0, 0.01176471, 1,
3.319662, 0.1229731, 3.425441, 1, 0, 0.007843138, 1
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
0.2180104, -4.52521, -7.801508, 0, -0.5, 0.5, 0.5,
0.2180104, -4.52521, -7.801508, 1, -0.5, 0.5, 0.5,
0.2180104, -4.52521, -7.801508, 1, 1.5, 0.5, 0.5,
0.2180104, -4.52521, -7.801508, 0, 1.5, 0.5, 0.5
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
-3.935101, -0.3681178, -7.801508, 0, -0.5, 0.5, 0.5,
-3.935101, -0.3681178, -7.801508, 1, -0.5, 0.5, 0.5,
-3.935101, -0.3681178, -7.801508, 1, 1.5, 0.5, 0.5,
-3.935101, -0.3681178, -7.801508, 0, 1.5, 0.5, 0.5
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
-3.935101, -4.52521, -0.1899879, 0, -0.5, 0.5, 0.5,
-3.935101, -4.52521, -0.1899879, 1, -0.5, 0.5, 0.5,
-3.935101, -4.52521, -0.1899879, 1, 1.5, 0.5, 0.5,
-3.935101, -4.52521, -0.1899879, 0, 1.5, 0.5, 0.5
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
-2, -3.565881, -6.045004,
3, -3.565881, -6.045004,
-2, -3.565881, -6.045004,
-2, -3.725769, -6.337755,
-1, -3.565881, -6.045004,
-1, -3.725769, -6.337755,
0, -3.565881, -6.045004,
0, -3.725769, -6.337755,
1, -3.565881, -6.045004,
1, -3.725769, -6.337755,
2, -3.565881, -6.045004,
2, -3.725769, -6.337755,
3, -3.565881, -6.045004,
3, -3.725769, -6.337755
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
-2, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
-2, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
-2, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
-2, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5,
-1, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
-1, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
-1, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
-1, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5,
0, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
0, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
0, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
0, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5,
1, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
1, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
1, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
1, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5,
2, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
2, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
2, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
2, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5,
3, -4.045546, -6.923256, 0, -0.5, 0.5, 0.5,
3, -4.045546, -6.923256, 1, -0.5, 0.5, 0.5,
3, -4.045546, -6.923256, 1, 1.5, 0.5, 0.5,
3, -4.045546, -6.923256, 0, 1.5, 0.5, 0.5
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
-2.97669, -3, -6.045004,
-2.97669, 2, -6.045004,
-2.97669, -3, -6.045004,
-3.136425, -3, -6.337755,
-2.97669, -2, -6.045004,
-3.136425, -2, -6.337755,
-2.97669, -1, -6.045004,
-3.136425, -1, -6.337755,
-2.97669, 0, -6.045004,
-3.136425, 0, -6.337755,
-2.97669, 1, -6.045004,
-3.136425, 1, -6.337755,
-2.97669, 2, -6.045004,
-3.136425, 2, -6.337755
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
-3.455895, -3, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, -3, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, -3, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, -3, -6.923256, 0, 1.5, 0.5, 0.5,
-3.455895, -2, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, -2, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, -2, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, -2, -6.923256, 0, 1.5, 0.5, 0.5,
-3.455895, -1, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, -1, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, -1, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, -1, -6.923256, 0, 1.5, 0.5, 0.5,
-3.455895, 0, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, 0, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, 0, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, 0, -6.923256, 0, 1.5, 0.5, 0.5,
-3.455895, 1, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, 1, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, 1, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, 1, -6.923256, 0, 1.5, 0.5, 0.5,
-3.455895, 2, -6.923256, 0, -0.5, 0.5, 0.5,
-3.455895, 2, -6.923256, 1, -0.5, 0.5, 0.5,
-3.455895, 2, -6.923256, 1, 1.5, 0.5, 0.5,
-3.455895, 2, -6.923256, 0, 1.5, 0.5, 0.5
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
-2.97669, -3.565881, -4,
-2.97669, -3.565881, 4,
-2.97669, -3.565881, -4,
-3.136425, -3.725769, -4,
-2.97669, -3.565881, -2,
-3.136425, -3.725769, -2,
-2.97669, -3.565881, 0,
-3.136425, -3.725769, 0,
-2.97669, -3.565881, 2,
-3.136425, -3.725769, 2,
-2.97669, -3.565881, 4,
-3.136425, -3.725769, 4
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
-3.455895, -4.045546, -4, 0, -0.5, 0.5, 0.5,
-3.455895, -4.045546, -4, 1, -0.5, 0.5, 0.5,
-3.455895, -4.045546, -4, 1, 1.5, 0.5, 0.5,
-3.455895, -4.045546, -4, 0, 1.5, 0.5, 0.5,
-3.455895, -4.045546, -2, 0, -0.5, 0.5, 0.5,
-3.455895, -4.045546, -2, 1, -0.5, 0.5, 0.5,
-3.455895, -4.045546, -2, 1, 1.5, 0.5, 0.5,
-3.455895, -4.045546, -2, 0, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 0, 0, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 0, 1, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 0, 1, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 0, 0, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 2, 0, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 2, 1, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 2, 1, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 2, 0, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 4, 0, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 4, 1, -0.5, 0.5, 0.5,
-3.455895, -4.045546, 4, 1, 1.5, 0.5, 0.5,
-3.455895, -4.045546, 4, 0, 1.5, 0.5, 0.5
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
-2.97669, -3.565881, -6.045004,
-2.97669, 2.829645, -6.045004,
-2.97669, -3.565881, 5.665028,
-2.97669, 2.829645, 5.665028,
-2.97669, -3.565881, -6.045004,
-2.97669, -3.565881, 5.665028,
-2.97669, 2.829645, -6.045004,
-2.97669, 2.829645, 5.665028,
-2.97669, -3.565881, -6.045004,
3.412711, -3.565881, -6.045004,
-2.97669, -3.565881, 5.665028,
3.412711, -3.565881, 5.665028,
-2.97669, 2.829645, -6.045004,
3.412711, 2.829645, -6.045004,
-2.97669, 2.829645, 5.665028,
3.412711, 2.829645, 5.665028,
3.412711, -3.565881, -6.045004,
3.412711, 2.829645, -6.045004,
3.412711, -3.565881, 5.665028,
3.412711, 2.829645, 5.665028,
3.412711, -3.565881, -6.045004,
3.412711, -3.565881, 5.665028,
3.412711, 2.829645, -6.045004,
3.412711, 2.829645, 5.665028
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
var radius = 7.899521;
var distance = 35.14586;
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
mvMatrix.translate( -0.2180104, 0.3681178, 0.1899879 );
mvMatrix.scale( 1.336763, 1.335483, 0.7293847 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14586);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
1-naphthol<-read.table("1-naphthol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.883641, 1.634536, -2.071367, 0, 0, 1, 1, 1,
-2.843144, -0.02989101, -0.6624312, 1, 0, 0, 1, 1,
-2.615895, 0.3351897, -0.2681874, 1, 0, 0, 1, 1,
-2.484653, -0.4264155, -1.704126, 1, 0, 0, 1, 1,
-2.404212, -0.7813804, -2.038118, 1, 0, 0, 1, 1,
-2.373806, -0.02685223, -0.1125912, 1, 0, 0, 1, 1,
-2.364704, 0.4513294, -2.258209, 0, 0, 0, 1, 1,
-2.308254, -0.3144795, -0.908996, 0, 0, 0, 1, 1,
-2.304976, -1.13581, -3.416508, 0, 0, 0, 1, 1,
-2.223451, -0.2974654, 0.05070635, 0, 0, 0, 1, 1,
-2.217824, 0.7873483, -1.611225, 0, 0, 0, 1, 1,
-2.171685, -0.432196, -2.4972, 0, 0, 0, 1, 1,
-2.170412, -0.06923298, -0.9753583, 0, 0, 0, 1, 1,
-2.128855, 0.3771985, -0.1793116, 1, 1, 1, 1, 1,
-2.091499, -0.3700808, -3.066292, 1, 1, 1, 1, 1,
-2.055962, 1.343073, -0.4750094, 1, 1, 1, 1, 1,
-2.048717, 0.664081, -1.664196, 1, 1, 1, 1, 1,
-2.015494, -0.6603555, -1.710918, 1, 1, 1, 1, 1,
-1.970269, -0.04794883, -1.979245, 1, 1, 1, 1, 1,
-1.959891, 0.3260388, -3.853802, 1, 1, 1, 1, 1,
-1.958057, -1.188429, -1.425793, 1, 1, 1, 1, 1,
-1.951646, -0.03710826, -1.440937, 1, 1, 1, 1, 1,
-1.947157, -0.6152003, -3.142502, 1, 1, 1, 1, 1,
-1.926457, 1.392634, -2.413198, 1, 1, 1, 1, 1,
-1.913218, 2.595096, 1.583964, 1, 1, 1, 1, 1,
-1.906559, 0.3327959, -0.7011026, 1, 1, 1, 1, 1,
-1.89369, -0.4821982, -1.839762, 1, 1, 1, 1, 1,
-1.868062, -0.05274561, -1.267867, 1, 1, 1, 1, 1,
-1.852351, -1.171641, -3.263033, 0, 0, 1, 1, 1,
-1.839479, -0.2841653, -3.266667, 1, 0, 0, 1, 1,
-1.834234, 0.5131189, -1.197987, 1, 0, 0, 1, 1,
-1.815155, 0.06242178, -0.01282284, 1, 0, 0, 1, 1,
-1.799969, -0.7490346, -0.08047745, 1, 0, 0, 1, 1,
-1.773643, -1.761944, -4.410471, 1, 0, 0, 1, 1,
-1.77097, 0.7525563, 0.7311773, 0, 0, 0, 1, 1,
-1.768131, 1.578986, 0.1126313, 0, 0, 0, 1, 1,
-1.759176, 0.269928, 0.1534735, 0, 0, 0, 1, 1,
-1.753705, 0.07410673, -3.217094, 0, 0, 0, 1, 1,
-1.74051, 0.1803959, -1.975352, 0, 0, 0, 1, 1,
-1.734532, -1.112677, -2.338917, 0, 0, 0, 1, 1,
-1.732889, 1.081888, -1.540372, 0, 0, 0, 1, 1,
-1.711635, -0.2101152, -2.178713, 1, 1, 1, 1, 1,
-1.710611, -0.6519917, -2.203229, 1, 1, 1, 1, 1,
-1.70812, -2.100554, -2.201809, 1, 1, 1, 1, 1,
-1.705281, 0.08711781, -3.265952, 1, 1, 1, 1, 1,
-1.700007, -1.459834, -3.728549, 1, 1, 1, 1, 1,
-1.668067, -1.392456, -4.11624, 1, 1, 1, 1, 1,
-1.629105, 0.2128292, -1.262902, 1, 1, 1, 1, 1,
-1.591258, 0.6402422, -1.951964, 1, 1, 1, 1, 1,
-1.588507, 0.621632, -0.9340746, 1, 1, 1, 1, 1,
-1.564964, 0.7952599, -2.43902, 1, 1, 1, 1, 1,
-1.561343, 0.836449, -1.343686, 1, 1, 1, 1, 1,
-1.558921, 0.3695935, -1.995664, 1, 1, 1, 1, 1,
-1.555012, 0.4309785, -0.5959455, 1, 1, 1, 1, 1,
-1.548563, 0.1286408, -3.229415, 1, 1, 1, 1, 1,
-1.536233, 0.1543275, -1.538724, 1, 1, 1, 1, 1,
-1.533533, 0.6054518, -2.090975, 0, 0, 1, 1, 1,
-1.526457, -0.09893761, -1.762321, 1, 0, 0, 1, 1,
-1.522687, -0.5201509, -1.668767, 1, 0, 0, 1, 1,
-1.518961, 1.325253, 0.179802, 1, 0, 0, 1, 1,
-1.515596, -0.9564598, -2.282586, 1, 0, 0, 1, 1,
-1.512742, -0.1309623, -2.282794, 1, 0, 0, 1, 1,
-1.504507, 0.8722396, -2.045281, 0, 0, 0, 1, 1,
-1.500008, 0.2343215, -1.435077, 0, 0, 0, 1, 1,
-1.491284, 1.256819, 1.113899, 0, 0, 0, 1, 1,
-1.475637, 1.434294, -0.5658557, 0, 0, 0, 1, 1,
-1.47541, 0.5153684, -1.377408, 0, 0, 0, 1, 1,
-1.473007, -0.2274946, -1.333713, 0, 0, 0, 1, 1,
-1.47038, -0.4424373, -2.540456, 0, 0, 0, 1, 1,
-1.464608, 0.3421062, -3.11514, 1, 1, 1, 1, 1,
-1.463916, 0.4676379, -0.8678762, 1, 1, 1, 1, 1,
-1.449998, 1.37904, -0.8647751, 1, 1, 1, 1, 1,
-1.443342, -1.184593, -1.090631, 1, 1, 1, 1, 1,
-1.440237, -0.8344272, -1.285715, 1, 1, 1, 1, 1,
-1.433556, -0.356357, -3.739636, 1, 1, 1, 1, 1,
-1.433291, -0.6849009, -2.414698, 1, 1, 1, 1, 1,
-1.429112, 0.515696, 0.7406406, 1, 1, 1, 1, 1,
-1.407209, 0.2761165, -1.417691, 1, 1, 1, 1, 1,
-1.403997, 0.4118086, -1.172683, 1, 1, 1, 1, 1,
-1.400436, -0.4200328, -2.24273, 1, 1, 1, 1, 1,
-1.395379, 1.279276, -1.630618, 1, 1, 1, 1, 1,
-1.387787, -0.9327639, -2.562904, 1, 1, 1, 1, 1,
-1.379216, 0.9617367, -1.581286, 1, 1, 1, 1, 1,
-1.377926, 0.04212288, -0.795339, 1, 1, 1, 1, 1,
-1.368716, 1.354908, -0.7398378, 0, 0, 1, 1, 1,
-1.346622, 0.9518754, 2.177588, 1, 0, 0, 1, 1,
-1.333243, 0.7498286, -1.269306, 1, 0, 0, 1, 1,
-1.329121, 0.2210509, -1.559461, 1, 0, 0, 1, 1,
-1.315196, -0.4151638, -3.787536, 1, 0, 0, 1, 1,
-1.307502, -1.189946, -1.277026, 1, 0, 0, 1, 1,
-1.301908, -0.1338219, -1.464918, 0, 0, 0, 1, 1,
-1.287403, 1.409888, 0.05269954, 0, 0, 0, 1, 1,
-1.286778, -0.7928431, -4.094281, 0, 0, 0, 1, 1,
-1.28147, 0.03210277, -0.1759936, 0, 0, 0, 1, 1,
-1.280328, 0.9707533, -0.739773, 0, 0, 0, 1, 1,
-1.280082, -0.06976633, -0.2540649, 0, 0, 0, 1, 1,
-1.276474, 1.46319, 0.2666272, 0, 0, 0, 1, 1,
-1.265667, -3.256734, -0.985701, 1, 1, 1, 1, 1,
-1.261938, -1.102564, -2.987363, 1, 1, 1, 1, 1,
-1.258471, -0.9370029, -0.838876, 1, 1, 1, 1, 1,
-1.252921, 1.230635, -2.060467, 1, 1, 1, 1, 1,
-1.248978, -0.2353635, -2.52082, 1, 1, 1, 1, 1,
-1.242865, 0.2556677, -1.591283, 1, 1, 1, 1, 1,
-1.235034, -1.535922, -2.226943, 1, 1, 1, 1, 1,
-1.22619, -0.2629621, -3.276354, 1, 1, 1, 1, 1,
-1.218628, 0.6296226, -1.172692, 1, 1, 1, 1, 1,
-1.215497, -0.07479704, -1.470884, 1, 1, 1, 1, 1,
-1.215303, -1.046349, -2.266408, 1, 1, 1, 1, 1,
-1.214774, -0.04281183, -0.2581671, 1, 1, 1, 1, 1,
-1.21322, 0.609273, -2.693901, 1, 1, 1, 1, 1,
-1.199918, -0.2131719, -1.626079, 1, 1, 1, 1, 1,
-1.194697, -2.129463, -2.835676, 1, 1, 1, 1, 1,
-1.192765, -1.026976, -3.036836, 0, 0, 1, 1, 1,
-1.185523, 0.4729932, -2.266093, 1, 0, 0, 1, 1,
-1.180547, 0.6404415, 0.05781067, 1, 0, 0, 1, 1,
-1.173582, -0.8133644, -3.478601, 1, 0, 0, 1, 1,
-1.171747, 1.07855, -0.4705193, 1, 0, 0, 1, 1,
-1.160527, -0.01581797, -1.493518, 1, 0, 0, 1, 1,
-1.156588, -0.3001878, -1.312035, 0, 0, 0, 1, 1,
-1.155048, 0.4590572, -1.154773, 0, 0, 0, 1, 1,
-1.15069, 0.3727635, -1.117227, 0, 0, 0, 1, 1,
-1.13816, 0.1853152, -3.420206, 0, 0, 0, 1, 1,
-1.121688, -1.024918, -0.6085271, 0, 0, 0, 1, 1,
-1.119, 0.9899057, -1.077298, 0, 0, 0, 1, 1,
-1.117677, 1.100274, 0.3823091, 0, 0, 0, 1, 1,
-1.115366, -0.1461485, -1.790591, 1, 1, 1, 1, 1,
-1.107807, 0.9579574, 0.2777556, 1, 1, 1, 1, 1,
-1.099816, 0.9369732, -1.021016, 1, 1, 1, 1, 1,
-1.097335, -0.7312832, -0.6965498, 1, 1, 1, 1, 1,
-1.095103, -0.05077465, -2.050495, 1, 1, 1, 1, 1,
-1.093042, -1.155198, -1.675366, 1, 1, 1, 1, 1,
-1.081225, 0.8401986, -0.3073681, 1, 1, 1, 1, 1,
-1.079153, -0.6956802, -2.676976, 1, 1, 1, 1, 1,
-1.077974, 1.058723, -1.38384, 1, 1, 1, 1, 1,
-1.07523, 1.279538, -0.4989898, 1, 1, 1, 1, 1,
-1.073558, -0.2810195, -1.872115, 1, 1, 1, 1, 1,
-1.073541, -2.097893, -2.419574, 1, 1, 1, 1, 1,
-1.069791, -0.1280627, -2.037064, 1, 1, 1, 1, 1,
-1.06708, -1.183411, -1.2564, 1, 1, 1, 1, 1,
-1.058526, 0.2705401, -0.6222366, 1, 1, 1, 1, 1,
-1.054727, -0.544466, -1.481141, 0, 0, 1, 1, 1,
-1.045874, 0.3802037, -0.3930749, 1, 0, 0, 1, 1,
-1.043679, 0.1478999, -2.280583, 1, 0, 0, 1, 1,
-1.043558, -0.896795, -1.654852, 1, 0, 0, 1, 1,
-1.03231, -0.6674009, -0.6027617, 1, 0, 0, 1, 1,
-1.029576, -0.06450928, -3.210224, 1, 0, 0, 1, 1,
-1.017919, -1.349911, -2.665349, 0, 0, 0, 1, 1,
-1.016568, -0.8676908, -2.379134, 0, 0, 0, 1, 1,
-1.013896, -0.2369503, -3.705832, 0, 0, 0, 1, 1,
-0.9906099, -0.2712499, -2.269406, 0, 0, 0, 1, 1,
-0.9884207, -1.659855, -3.466334, 0, 0, 0, 1, 1,
-0.9747241, -0.6331663, -4.676465, 0, 0, 0, 1, 1,
-0.9673131, 1.036227, -0.2995092, 0, 0, 0, 1, 1,
-0.9669204, -0.3595406, -3.145682, 1, 1, 1, 1, 1,
-0.9566805, 0.1699579, -1.40168, 1, 1, 1, 1, 1,
-0.9500926, -0.7427729, -0.9838414, 1, 1, 1, 1, 1,
-0.9473794, 0.4325412, -2.789983, 1, 1, 1, 1, 1,
-0.9447576, -0.4008516, -2.495465, 1, 1, 1, 1, 1,
-0.9443538, 0.8178549, -1.786146, 1, 1, 1, 1, 1,
-0.9443207, -0.01499563, -1.483744, 1, 1, 1, 1, 1,
-0.9410479, 0.3304817, -3.289199, 1, 1, 1, 1, 1,
-0.9399291, -2.310877, -3.90814, 1, 1, 1, 1, 1,
-0.9282301, 2.566275, -1.440531, 1, 1, 1, 1, 1,
-0.9209809, -1.900612, -3.450323, 1, 1, 1, 1, 1,
-0.9131123, -0.1637387, -1.616715, 1, 1, 1, 1, 1,
-0.9089787, -0.4520367, -1.470906, 1, 1, 1, 1, 1,
-0.9006786, -1.052333, -2.419959, 1, 1, 1, 1, 1,
-0.8921049, -0.5011069, -2.925426, 1, 1, 1, 1, 1,
-0.8895966, -0.6876255, -3.678087, 0, 0, 1, 1, 1,
-0.8873042, 1.130275, -1.290299, 1, 0, 0, 1, 1,
-0.8842632, 0.3871956, -0.3817166, 1, 0, 0, 1, 1,
-0.8770919, -0.05354916, -1.161114, 1, 0, 0, 1, 1,
-0.875992, 0.4178787, -0.3678221, 1, 0, 0, 1, 1,
-0.8757619, 0.9090334, -1.436194, 1, 0, 0, 1, 1,
-0.8719618, -0.6397957, -0.9767766, 0, 0, 0, 1, 1,
-0.8707596, -1.16296, -4.317995, 0, 0, 0, 1, 1,
-0.8690034, 0.3613779, -1.526283, 0, 0, 0, 1, 1,
-0.8669851, -1.282592, -3.702156, 0, 0, 0, 1, 1,
-0.8621747, 0.06117245, 0.02990203, 0, 0, 0, 1, 1,
-0.8615965, -0.6395911, -2.316758, 0, 0, 0, 1, 1,
-0.8519012, -0.4606402, -1.26334, 0, 0, 0, 1, 1,
-0.8484222, -0.8929657, -0.6121539, 1, 1, 1, 1, 1,
-0.8451974, 1.723774, 0.5986173, 1, 1, 1, 1, 1,
-0.8446935, -0.4902188, -1.665276, 1, 1, 1, 1, 1,
-0.8331745, 1.291162, 0.4397326, 1, 1, 1, 1, 1,
-0.8328447, -0.1926596, -0.1812691, 1, 1, 1, 1, 1,
-0.8281561, 1.023823, 1.016106, 1, 1, 1, 1, 1,
-0.8277748, -1.252331, -1.570858, 1, 1, 1, 1, 1,
-0.8275686, 0.1376565, -2.998655, 1, 1, 1, 1, 1,
-0.8223719, -1.024994, -1.945499, 1, 1, 1, 1, 1,
-0.8191593, -1.159818, -2.642758, 1, 1, 1, 1, 1,
-0.8179234, 1.723447, -0.9070093, 1, 1, 1, 1, 1,
-0.8169163, -0.9156926, -0.5438359, 1, 1, 1, 1, 1,
-0.8165157, -0.6412047, -1.869706, 1, 1, 1, 1, 1,
-0.8142476, 0.9037673, -1.635084, 1, 1, 1, 1, 1,
-0.8135918, -0.4510096, -1.727021, 1, 1, 1, 1, 1,
-0.8098457, -0.04808819, -1.641334, 0, 0, 1, 1, 1,
-0.8088268, 0.8681368, -1.442478, 1, 0, 0, 1, 1,
-0.8046358, 0.5218279, -1.216186, 1, 0, 0, 1, 1,
-0.8000559, -0.5993864, -1.823137, 1, 0, 0, 1, 1,
-0.7949973, -0.3870638, -3.227204, 1, 0, 0, 1, 1,
-0.7921222, 0.918273, -0.2367627, 1, 0, 0, 1, 1,
-0.7920631, 2.065198, 0.4057476, 0, 0, 0, 1, 1,
-0.7766303, 0.2147894, -1.825788, 0, 0, 0, 1, 1,
-0.7737387, -1.702607, -0.8836397, 0, 0, 0, 1, 1,
-0.7732251, 0.9662911, -1.083687, 0, 0, 0, 1, 1,
-0.7726111, -0.5256533, -2.325208, 0, 0, 0, 1, 1,
-0.7661723, -0.7820132, -2.676771, 0, 0, 0, 1, 1,
-0.7638363, -1.535816, -2.203937, 0, 0, 0, 1, 1,
-0.7633504, -0.1786852, -0.8468899, 1, 1, 1, 1, 1,
-0.7631015, -0.4085997, 0.1571162, 1, 1, 1, 1, 1,
-0.7617919, 0.3355399, -2.073272, 1, 1, 1, 1, 1,
-0.7544659, -0.1465475, -1.645439, 1, 1, 1, 1, 1,
-0.7538432, 0.5475583, -2.592525, 1, 1, 1, 1, 1,
-0.7534002, 0.1091679, -0.8437737, 1, 1, 1, 1, 1,
-0.7430773, -0.8832681, -3.020077, 1, 1, 1, 1, 1,
-0.7381566, 1.632797, 0.3235181, 1, 1, 1, 1, 1,
-0.7344778, -0.569799, -2.238064, 1, 1, 1, 1, 1,
-0.7335763, 1.019306, 0.9969609, 1, 1, 1, 1, 1,
-0.7319286, 1.431585, -0.4350798, 1, 1, 1, 1, 1,
-0.721929, 1.684578, -0.9583789, 1, 1, 1, 1, 1,
-0.72159, -1.130832, -2.784286, 1, 1, 1, 1, 1,
-0.7204183, -1.223437, -1.026214, 1, 1, 1, 1, 1,
-0.7203588, 0.4573931, -0.6340571, 1, 1, 1, 1, 1,
-0.718065, -2.226791, -3.058447, 0, 0, 1, 1, 1,
-0.7085122, -0.7852554, -1.710511, 1, 0, 0, 1, 1,
-0.7029595, 0.8278146, -2.038875, 1, 0, 0, 1, 1,
-0.7002834, 0.5377273, -2.737507, 1, 0, 0, 1, 1,
-0.6960742, 0.2641652, -0.6135765, 1, 0, 0, 1, 1,
-0.6955439, -0.9837778, -2.06759, 1, 0, 0, 1, 1,
-0.6918314, 0.8384258, -1.671898, 0, 0, 0, 1, 1,
-0.691418, 1.501674, -0.07452548, 0, 0, 0, 1, 1,
-0.690958, -0.5453771, -2.122317, 0, 0, 0, 1, 1,
-0.6907849, 1.762339, 1.398545, 0, 0, 0, 1, 1,
-0.6894751, 1.280712, 0.4081461, 0, 0, 0, 1, 1,
-0.6880407, 1.21158, -1.267774, 0, 0, 0, 1, 1,
-0.6866762, -0.9232706, -2.150227, 0, 0, 0, 1, 1,
-0.684566, 0.3934622, -1.735107, 1, 1, 1, 1, 1,
-0.6825442, -0.8670141, -2.812962, 1, 1, 1, 1, 1,
-0.6714921, -0.1412679, -2.063971, 1, 1, 1, 1, 1,
-0.6710899, -0.01967671, -1.260342, 1, 1, 1, 1, 1,
-0.6660143, -0.09180526, -0.9903954, 1, 1, 1, 1, 1,
-0.6654801, -1.555125, -3.181723, 1, 1, 1, 1, 1,
-0.6604951, -0.6348706, -4.529079, 1, 1, 1, 1, 1,
-0.6589054, 0.4414673, -2.198517, 1, 1, 1, 1, 1,
-0.655367, -0.2282259, -1.928184, 1, 1, 1, 1, 1,
-0.6542838, 1.258968, -0.5552403, 1, 1, 1, 1, 1,
-0.6538988, -1.732007, -3.604367, 1, 1, 1, 1, 1,
-0.6505007, 0.7022281, -1.643631, 1, 1, 1, 1, 1,
-0.6503845, -0.9972048, -2.970399, 1, 1, 1, 1, 1,
-0.6454697, 0.3364905, 1.197397, 1, 1, 1, 1, 1,
-0.6418356, 0.6251622, -0.06074341, 1, 1, 1, 1, 1,
-0.6306617, 1.512713, -0.9521285, 0, 0, 1, 1, 1,
-0.6277932, 0.5537726, -0.02899393, 1, 0, 0, 1, 1,
-0.6272133, -0.1411319, 0.5733515, 1, 0, 0, 1, 1,
-0.6233656, -0.355372, -1.34227, 1, 0, 0, 1, 1,
-0.6224569, 0.7396026, -0.935966, 1, 0, 0, 1, 1,
-0.6203967, 0.8207948, 0.4438866, 1, 0, 0, 1, 1,
-0.6140375, 0.09743384, -2.439976, 0, 0, 0, 1, 1,
-0.6130146, -0.5979952, -1.733117, 0, 0, 0, 1, 1,
-0.6081836, -1.869023, -2.720289, 0, 0, 0, 1, 1,
-0.6016607, 0.3034314, -2.62111, 0, 0, 0, 1, 1,
-0.6003689, 2.068631, 0.252001, 0, 0, 0, 1, 1,
-0.5994716, 1.013153, -1.003741, 0, 0, 0, 1, 1,
-0.5905529, 1.489285, -1.024608, 0, 0, 0, 1, 1,
-0.584242, 1.291236, 0.1959522, 1, 1, 1, 1, 1,
-0.5813656, -0.1311766, 0.7257932, 1, 1, 1, 1, 1,
-0.581265, 0.1317849, -1.294455, 1, 1, 1, 1, 1,
-0.5805422, 1.467598, 0.4409788, 1, 1, 1, 1, 1,
-0.5779453, 0.1285686, -0.5443892, 1, 1, 1, 1, 1,
-0.5741015, -1.710711, -2.685896, 1, 1, 1, 1, 1,
-0.5725961, 0.821731, -0.0511579, 1, 1, 1, 1, 1,
-0.5716414, 0.1657277, -0.5750135, 1, 1, 1, 1, 1,
-0.5706997, 0.4755518, 0.4048818, 1, 1, 1, 1, 1,
-0.564977, 0.1592309, -1.582966, 1, 1, 1, 1, 1,
-0.5648363, 0.4807697, -2.226624, 1, 1, 1, 1, 1,
-0.5647528, -1.125585, -2.319237, 1, 1, 1, 1, 1,
-0.5623893, 2.498621, 1.420432, 1, 1, 1, 1, 1,
-0.5598732, -0.4299453, -3.485621, 1, 1, 1, 1, 1,
-0.5594156, -1.82174, -2.47955, 1, 1, 1, 1, 1,
-0.5503294, 0.5206332, 1.277537, 0, 0, 1, 1, 1,
-0.5486481, 0.07844224, -2.016729, 1, 0, 0, 1, 1,
-0.5473251, 0.4922919, -0.4409216, 1, 0, 0, 1, 1,
-0.5413019, -1.124694, -3.890675, 1, 0, 0, 1, 1,
-0.5401356, -0.6990182, -3.051751, 1, 0, 0, 1, 1,
-0.5391882, -0.6167533, -0.05856804, 1, 0, 0, 1, 1,
-0.538981, -0.4810497, -1.342774, 0, 0, 0, 1, 1,
-0.5381472, -0.6331376, -3.565383, 0, 0, 0, 1, 1,
-0.5330357, 0.7207971, -0.03868649, 0, 0, 0, 1, 1,
-0.5320545, 1.783512, 0.2022911, 0, 0, 0, 1, 1,
-0.5268909, 0.4300543, -0.9903507, 0, 0, 0, 1, 1,
-0.5267088, 0.6321331, -2.663817, 0, 0, 0, 1, 1,
-0.5260874, 0.1959917, 0.4930852, 0, 0, 0, 1, 1,
-0.5254689, -0.1573586, -1.320071, 1, 1, 1, 1, 1,
-0.5235049, -0.4712043, -0.6847608, 1, 1, 1, 1, 1,
-0.5165101, -1.977003, -2.036503, 1, 1, 1, 1, 1,
-0.5151932, -1.063574, -3.794724, 1, 1, 1, 1, 1,
-0.5142258, 1.387485, -0.0452433, 1, 1, 1, 1, 1,
-0.5128598, -1.145976, -2.128655, 1, 1, 1, 1, 1,
-0.4994512, -0.04399498, 0.8116764, 1, 1, 1, 1, 1,
-0.4975244, 2.404459, 1.775785, 1, 1, 1, 1, 1,
-0.4966202, 0.1919112, -1.267195, 1, 1, 1, 1, 1,
-0.4938008, 0.2895887, -0.8262321, 1, 1, 1, 1, 1,
-0.4927455, 1.397334, -0.1152664, 1, 1, 1, 1, 1,
-0.492728, -0.4845584, -0.9472245, 1, 1, 1, 1, 1,
-0.4874643, -0.3098456, -0.4452737, 1, 1, 1, 1, 1,
-0.4849152, -0.01270385, -2.001846, 1, 1, 1, 1, 1,
-0.4821631, -0.859268, -1.527679, 1, 1, 1, 1, 1,
-0.478693, 0.8961373, -0.2061993, 0, 0, 1, 1, 1,
-0.4728832, -1.167709, -4.821665, 1, 0, 0, 1, 1,
-0.4719528, -0.4268951, -2.392257, 1, 0, 0, 1, 1,
-0.4715575, 0.7231946, 1.293194, 1, 0, 0, 1, 1,
-0.4637343, 0.3984586, 0.427857, 1, 0, 0, 1, 1,
-0.463071, -1.293962, -2.637017, 1, 0, 0, 1, 1,
-0.4617307, -1.297334, -3.909704, 0, 0, 0, 1, 1,
-0.4615256, 0.4188044, -0.8395312, 0, 0, 0, 1, 1,
-0.4604335, -0.009519772, -1.792117, 0, 0, 0, 1, 1,
-0.4538786, 0.1687066, -0.6081413, 0, 0, 0, 1, 1,
-0.4500214, 0.9101354, -0.401212, 0, 0, 0, 1, 1,
-0.4495923, 0.154127, -2.008148, 0, 0, 0, 1, 1,
-0.4472289, -0.7062503, -1.885716, 0, 0, 0, 1, 1,
-0.4413064, 1.350595, -0.8903582, 1, 1, 1, 1, 1,
-0.4401887, -0.6032637, -4.349322, 1, 1, 1, 1, 1,
-0.435916, 0.081143, -1.687994, 1, 1, 1, 1, 1,
-0.4353173, -0.6590933, -2.363481, 1, 1, 1, 1, 1,
-0.4344164, -0.8281255, -4.645496, 1, 1, 1, 1, 1,
-0.4328841, -0.7387705, -1.016297, 1, 1, 1, 1, 1,
-0.4274963, 0.5121086, -1.692975, 1, 1, 1, 1, 1,
-0.4250109, -0.2480377, -1.141285, 1, 1, 1, 1, 1,
-0.4215415, 0.07174607, -3.794139, 1, 1, 1, 1, 1,
-0.4215304, -1.242521, -2.876589, 1, 1, 1, 1, 1,
-0.4205566, 1.944707, 0.1649047, 1, 1, 1, 1, 1,
-0.4137121, 0.1448449, -1.758839, 1, 1, 1, 1, 1,
-0.4129825, -0.8427743, -2.756561, 1, 1, 1, 1, 1,
-0.4126548, -0.2182534, -1.444094, 1, 1, 1, 1, 1,
-0.4115826, -0.8982011, -2.472331, 1, 1, 1, 1, 1,
-0.403196, 2.736507, 0.5697361, 0, 0, 1, 1, 1,
-0.4031554, -0.4589316, -3.065236, 1, 0, 0, 1, 1,
-0.4027792, 0.5669582, -0.2719021, 1, 0, 0, 1, 1,
-0.3992629, -1.185651, -3.969417, 1, 0, 0, 1, 1,
-0.397116, -2.300052, -3.608577, 1, 0, 0, 1, 1,
-0.3967323, 0.9300045, -0.9350809, 1, 0, 0, 1, 1,
-0.3926104, 0.2778854, -1.459985, 0, 0, 0, 1, 1,
-0.3920438, 0.01842695, -1.647608, 0, 0, 0, 1, 1,
-0.3858809, -0.07746749, -3.710842, 0, 0, 0, 1, 1,
-0.3834111, -0.6398564, -4.320485, 0, 0, 0, 1, 1,
-0.3804474, -1.259574, -2.486487, 0, 0, 0, 1, 1,
-0.378917, 0.4794255, -0.1028895, 0, 0, 0, 1, 1,
-0.3769455, 0.9189299, -0.6058642, 0, 0, 0, 1, 1,
-0.3759621, -0.3088803, -2.981626, 1, 1, 1, 1, 1,
-0.3742463, -0.5573598, -1.271667, 1, 1, 1, 1, 1,
-0.3742303, 0.2910547, -1.337354, 1, 1, 1, 1, 1,
-0.3729458, -0.1690191, -1.619015, 1, 1, 1, 1, 1,
-0.3711231, 0.6777548, -0.4461219, 1, 1, 1, 1, 1,
-0.3691975, -2.488543, -4.433989, 1, 1, 1, 1, 1,
-0.3684192, 1.687288, -0.5229143, 1, 1, 1, 1, 1,
-0.3671839, -1.288094, -4.111519, 1, 1, 1, 1, 1,
-0.3567323, 0.6762455, -0.3393914, 1, 1, 1, 1, 1,
-0.3537171, 1.265216, -1.181604, 1, 1, 1, 1, 1,
-0.3534081, 0.1140836, -0.5268853, 1, 1, 1, 1, 1,
-0.3530634, -0.8415263, -3.308561, 1, 1, 1, 1, 1,
-0.3523305, -1.314648, -5.063812, 1, 1, 1, 1, 1,
-0.3480524, -0.2751353, -1.922783, 1, 1, 1, 1, 1,
-0.3462755, 0.5148023, -1.467663, 1, 1, 1, 1, 1,
-0.341392, -0.691177, -0.6622466, 0, 0, 1, 1, 1,
-0.3410886, 0.08281533, -0.7272272, 1, 0, 0, 1, 1,
-0.3394448, 0.4508776, -0.7868364, 1, 0, 0, 1, 1,
-0.3394059, 0.6057218, -0.8110089, 1, 0, 0, 1, 1,
-0.3379298, -0.2479961, -3.894247, 1, 0, 0, 1, 1,
-0.3374574, 0.6216851, -1.87276, 1, 0, 0, 1, 1,
-0.3371423, -0.9417012, -1.604782, 0, 0, 0, 1, 1,
-0.3365423, 0.3144934, -2.576553, 0, 0, 0, 1, 1,
-0.335548, 0.004609705, -1.031367, 0, 0, 0, 1, 1,
-0.3342373, -0.1752696, -2.577448, 0, 0, 0, 1, 1,
-0.3300369, 1.099398, -1.467967, 0, 0, 0, 1, 1,
-0.3268341, -1.004674, -1.633561, 0, 0, 0, 1, 1,
-0.3232474, 0.2203571, 0.1541779, 0, 0, 0, 1, 1,
-0.3174146, -1.375378, -2.995456, 1, 1, 1, 1, 1,
-0.317352, 0.9342517, -0.7335746, 1, 1, 1, 1, 1,
-0.3146433, -0.09134304, -1.212038, 1, 1, 1, 1, 1,
-0.3135848, 0.8304322, -0.6249306, 1, 1, 1, 1, 1,
-0.3098992, 1.770131, -0.1379203, 1, 1, 1, 1, 1,
-0.3074481, 1.689367, 1.250587, 1, 1, 1, 1, 1,
-0.3024233, 0.5025192, -1.504395, 1, 1, 1, 1, 1,
-0.2996974, 1.118038, 0.7803701, 1, 1, 1, 1, 1,
-0.298215, 0.4913369, -0.9360813, 1, 1, 1, 1, 1,
-0.2942503, -1.875056, -2.645781, 1, 1, 1, 1, 1,
-0.2924608, -0.1225228, -2.589394, 1, 1, 1, 1, 1,
-0.2922205, -0.537453, -3.476741, 1, 1, 1, 1, 1,
-0.2832042, 2.076042, -0.0874257, 1, 1, 1, 1, 1,
-0.2831945, -0.7528325, -1.875189, 1, 1, 1, 1, 1,
-0.2785892, -1.550224, -2.874117, 1, 1, 1, 1, 1,
-0.2777505, -0.8148584, -1.46055, 0, 0, 1, 1, 1,
-0.2774929, 0.3046153, 0.2894162, 1, 0, 0, 1, 1,
-0.2726028, 1.824582, -0.51365, 1, 0, 0, 1, 1,
-0.2715464, -1.373547, -5.192107, 1, 0, 0, 1, 1,
-0.2712059, 0.0569663, -0.8183679, 1, 0, 0, 1, 1,
-0.2698244, 0.6731764, -1.579874, 1, 0, 0, 1, 1,
-0.2693354, -0.28859, -4.294848, 0, 0, 0, 1, 1,
-0.2681342, 0.250742, 0.6811262, 0, 0, 0, 1, 1,
-0.2637286, -0.7384658, -5.112455, 0, 0, 0, 1, 1,
-0.2607843, 0.8912548, -0.3922012, 0, 0, 0, 1, 1,
-0.2584766, -2.098579, -5.229038, 0, 0, 0, 1, 1,
-0.2570681, -0.6418032, -3.450042, 0, 0, 0, 1, 1,
-0.2553326, 0.2472449, -1.339196, 0, 0, 0, 1, 1,
-0.2545311, -0.0916082, -4.077346, 1, 1, 1, 1, 1,
-0.2518474, 0.8648819, -0.3674726, 1, 1, 1, 1, 1,
-0.2515055, 0.6357453, -2.293377, 1, 1, 1, 1, 1,
-0.2469482, 0.9292877, -1.012935, 1, 1, 1, 1, 1,
-0.2465669, -1.276416, -2.72545, 1, 1, 1, 1, 1,
-0.2438651, 0.1948806, -1.009872, 1, 1, 1, 1, 1,
-0.2437392, -0.918654, -3.072789, 1, 1, 1, 1, 1,
-0.2411207, -1.165299, -3.944983, 1, 1, 1, 1, 1,
-0.2386899, -0.3584062, -3.625536, 1, 1, 1, 1, 1,
-0.2362264, 1.168978, 0.4726599, 1, 1, 1, 1, 1,
-0.2321101, 0.6718881, -0.5168738, 1, 1, 1, 1, 1,
-0.2318678, 0.693162, -1.975346, 1, 1, 1, 1, 1,
-0.23126, 1.124665, 0.1901532, 1, 1, 1, 1, 1,
-0.2277926, 0.7344726, 0.3624918, 1, 1, 1, 1, 1,
-0.2266016, 0.1545673, -0.3095596, 1, 1, 1, 1, 1,
-0.2213971, -0.1920892, -3.929609, 0, 0, 1, 1, 1,
-0.2209617, 2.534531, 0.68233, 1, 0, 0, 1, 1,
-0.219887, -1.637969, -3.511492, 1, 0, 0, 1, 1,
-0.2190867, 1.795384, -2.270342, 1, 0, 0, 1, 1,
-0.2175167, -1.475108, -3.82192, 1, 0, 0, 1, 1,
-0.214282, -0.310185, -2.929888, 1, 0, 0, 1, 1,
-0.2131381, 1.266004, -1.097454, 0, 0, 0, 1, 1,
-0.2125716, 1.158913, 0.1949972, 0, 0, 0, 1, 1,
-0.2105806, 0.3103119, 0.8048844, 0, 0, 0, 1, 1,
-0.2093829, -0.280212, -2.388113, 0, 0, 0, 1, 1,
-0.2021751, 1.240208, -1.181726, 0, 0, 0, 1, 1,
-0.2013965, -0.436535, -3.146342, 0, 0, 0, 1, 1,
-0.1997347, 0.3801547, -1.121863, 0, 0, 0, 1, 1,
-0.1987211, -0.5753009, -1.844146, 1, 1, 1, 1, 1,
-0.1952639, -0.5475256, -2.384128, 1, 1, 1, 1, 1,
-0.1925855, -0.7602214, -2.744596, 1, 1, 1, 1, 1,
-0.1921389, 0.4345592, -1.064221, 1, 1, 1, 1, 1,
-0.1880548, -0.9683408, -3.687284, 1, 1, 1, 1, 1,
-0.1875295, -0.9981556, -4.609509, 1, 1, 1, 1, 1,
-0.1862429, -0.5503581, -2.902382, 1, 1, 1, 1, 1,
-0.16714, 1.565535, 0.5369384, 1, 1, 1, 1, 1,
-0.1667336, 0.4393041, -0.3917555, 1, 1, 1, 1, 1,
-0.1588626, -1.24674, -3.511751, 1, 1, 1, 1, 1,
-0.1578769, -0.7962336, -3.242776, 1, 1, 1, 1, 1,
-0.1561182, 1.026065, -0.2100406, 1, 1, 1, 1, 1,
-0.1558764, -1.049737, -4.371466, 1, 1, 1, 1, 1,
-0.1552592, 0.8279401, -0.1846489, 1, 1, 1, 1, 1,
-0.1493389, -0.6790415, -3.511574, 1, 1, 1, 1, 1,
-0.1486979, 0.09097181, -0.5087945, 0, 0, 1, 1, 1,
-0.1473965, 0.4368994, 0.5847737, 1, 0, 0, 1, 1,
-0.1456495, -0.3921274, -2.52541, 1, 0, 0, 1, 1,
-0.1449323, 0.9146297, -0.3659098, 1, 0, 0, 1, 1,
-0.135396, 0.3519125, -1.138227, 1, 0, 0, 1, 1,
-0.1306662, 0.6555207, 0.3821695, 1, 0, 0, 1, 1,
-0.1294737, -0.9699168, -3.167492, 0, 0, 0, 1, 1,
-0.1293513, -1.277055, -4.436172, 0, 0, 0, 1, 1,
-0.121362, 0.4732745, -0.3698569, 0, 0, 0, 1, 1,
-0.1194427, -0.87632, -2.955951, 0, 0, 0, 1, 1,
-0.116449, 0.8273436, -1.797336, 0, 0, 0, 1, 1,
-0.1136002, -0.4312704, -5.874469, 0, 0, 0, 1, 1,
-0.1115171, -0.472875, -4.174355, 0, 0, 0, 1, 1,
-0.1100149, -0.07387404, -1.288723, 1, 1, 1, 1, 1,
-0.109972, -0.02056983, -2.129349, 1, 1, 1, 1, 1,
-0.1083891, 0.5901807, 0.9295795, 1, 1, 1, 1, 1,
-0.10681, 0.331356, -0.6567506, 1, 1, 1, 1, 1,
-0.1053063, 0.2897573, -1.367488, 1, 1, 1, 1, 1,
-0.1015011, 0.3332699, -0.4000947, 1, 1, 1, 1, 1,
-0.1014179, 0.6542058, -1.136134, 1, 1, 1, 1, 1,
-0.1004193, 1.371013, -0.9728549, 1, 1, 1, 1, 1,
-0.09890784, 0.2489076, -1.377439, 1, 1, 1, 1, 1,
-0.09836213, -0.5365831, -2.275485, 1, 1, 1, 1, 1,
-0.09009539, 0.7957531, 0.02896871, 1, 1, 1, 1, 1,
-0.0869547, -0.8643851, -1.998785, 1, 1, 1, 1, 1,
-0.08608492, -0.2363617, -0.4724543, 1, 1, 1, 1, 1,
-0.08568241, -0.2866053, -2.406957, 1, 1, 1, 1, 1,
-0.08299512, -0.3675932, -2.674767, 1, 1, 1, 1, 1,
-0.0814015, -1.05978, -5.202217, 0, 0, 1, 1, 1,
-0.08019034, -0.2304255, -2.616097, 1, 0, 0, 1, 1,
-0.0774148, -0.8108035, -3.26478, 1, 0, 0, 1, 1,
-0.07725041, -0.4328423, -2.541978, 1, 0, 0, 1, 1,
-0.07295246, 0.9212121, 0.5689172, 1, 0, 0, 1, 1,
-0.06998359, 0.6301672, 0.2292567, 1, 0, 0, 1, 1,
-0.06892662, -0.6616862, -4.359967, 0, 0, 0, 1, 1,
-0.06811395, -1.47875, -3.26514, 0, 0, 0, 1, 1,
-0.06561894, -0.5063088, -2.46675, 0, 0, 0, 1, 1,
-0.06169509, 1.145288, -0.6977253, 0, 0, 0, 1, 1,
-0.05472443, 1.495733, 0.2685482, 0, 0, 0, 1, 1,
-0.05131341, 0.4936878, 0.3189999, 0, 0, 0, 1, 1,
-0.05067318, -0.5937704, -2.111757, 0, 0, 0, 1, 1,
-0.04775938, 0.2814363, 0.03216708, 1, 1, 1, 1, 1,
-0.04735352, -1.781839, -3.116494, 1, 1, 1, 1, 1,
-0.04592304, -0.2331505, -2.02389, 1, 1, 1, 1, 1,
-0.0405129, -0.3367468, -2.104991, 1, 1, 1, 1, 1,
-0.03377864, 0.09845397, 1.367073, 1, 1, 1, 1, 1,
-0.03177987, -0.3833789, -1.819169, 1, 1, 1, 1, 1,
-0.03159614, -0.3931981, -2.943536, 1, 1, 1, 1, 1,
-0.02867786, -0.8100232, -2.904854, 1, 1, 1, 1, 1,
-0.02831397, 0.911733, -1.040974, 1, 1, 1, 1, 1,
-0.01631377, -0.2104935, -2.779127, 1, 1, 1, 1, 1,
-0.01624735, 0.1295518, 0.435389, 1, 1, 1, 1, 1,
-0.01080765, 0.943257, 0.2378164, 1, 1, 1, 1, 1,
-0.007816918, 1.024099, -0.7498563, 1, 1, 1, 1, 1,
-0.00514194, 0.5969756, 0.5439664, 1, 1, 1, 1, 1,
-0.002800361, -0.2191629, -2.500662, 1, 1, 1, 1, 1,
-0.002202491, 0.6696535, 0.2058339, 0, 0, 1, 1, 1,
-0.0003668893, -0.2855421, -4.421634, 1, 0, 0, 1, 1,
0.0009950624, 1.924498, 0.03139625, 1, 0, 0, 1, 1,
0.002685671, -0.1558681, 4.901558, 1, 0, 0, 1, 1,
0.003292768, 0.5672429, 0.5155827, 1, 0, 0, 1, 1,
0.01498471, 1.104789, -0.519308, 1, 0, 0, 1, 1,
0.01512661, 0.11204, 1.023951, 0, 0, 0, 1, 1,
0.02095445, -1.541037, 3.661573, 0, 0, 0, 1, 1,
0.02349992, -1.593347, 5.055329, 0, 0, 0, 1, 1,
0.02519701, 0.364828, 1.936573, 0, 0, 0, 1, 1,
0.0297502, 0.4348259, 1.953404, 0, 0, 0, 1, 1,
0.03018806, -0.3788245, 1.408456, 0, 0, 0, 1, 1,
0.03093832, -0.6313362, 2.941813, 0, 0, 0, 1, 1,
0.03128719, 1.551347, -0.1080595, 1, 1, 1, 1, 1,
0.03248587, -1.960177, 2.966948, 1, 1, 1, 1, 1,
0.03532284, -1.112725, 1.991538, 1, 1, 1, 1, 1,
0.04446612, -0.3018435, 4.323057, 1, 1, 1, 1, 1,
0.04747325, 0.245658, 0.1765182, 1, 1, 1, 1, 1,
0.04819356, -1.097822, 0.7601144, 1, 1, 1, 1, 1,
0.05121524, -0.09621585, 3.651032, 1, 1, 1, 1, 1,
0.05144683, -0.9892715, 2.741324, 1, 1, 1, 1, 1,
0.05177437, 0.112124, 1.438739, 1, 1, 1, 1, 1,
0.05379228, 0.6325524, 1.899968, 1, 1, 1, 1, 1,
0.05710652, -0.7602734, 4.506205, 1, 1, 1, 1, 1,
0.05792851, 1.846261, 0.9645829, 1, 1, 1, 1, 1,
0.05944328, -0.04127571, 2.901318, 1, 1, 1, 1, 1,
0.05973797, -1.769585, 2.494486, 1, 1, 1, 1, 1,
0.06234321, 0.2631644, 0.2859892, 1, 1, 1, 1, 1,
0.06287394, 2.12964, -0.01954635, 0, 0, 1, 1, 1,
0.06331012, 0.9666849, 0.6793471, 1, 0, 0, 1, 1,
0.06474594, 0.6297609, 1.073414, 1, 0, 0, 1, 1,
0.06525639, -0.7675869, 3.683094, 1, 0, 0, 1, 1,
0.06529839, 0.02495037, 2.627189, 1, 0, 0, 1, 1,
0.06599625, -0.9140405, 1.481782, 1, 0, 0, 1, 1,
0.0671678, -0.8287639, 2.863786, 0, 0, 0, 1, 1,
0.07053709, 0.132103, 2.965481, 0, 0, 0, 1, 1,
0.07073665, -0.8940091, 3.867126, 0, 0, 0, 1, 1,
0.07111022, 0.1115556, 1.237704, 0, 0, 0, 1, 1,
0.07208433, -0.2081425, 3.090667, 0, 0, 0, 1, 1,
0.07315759, -0.1544573, 2.160311, 0, 0, 0, 1, 1,
0.07333002, 0.5286717, 0.9422451, 0, 0, 0, 1, 1,
0.0740879, 0.4460238, 0.9339237, 1, 1, 1, 1, 1,
0.08179139, 1.245233, 1.293311, 1, 1, 1, 1, 1,
0.08687551, -2.933288, 5.051145, 1, 1, 1, 1, 1,
0.08836548, -0.9048914, 3.679498, 1, 1, 1, 1, 1,
0.08907126, -0.9677143, 2.960368, 1, 1, 1, 1, 1,
0.08922917, 0.3493953, -0.9818504, 1, 1, 1, 1, 1,
0.09059771, 0.1123428, 1.846259, 1, 1, 1, 1, 1,
0.09083501, -0.2196286, 2.385259, 1, 1, 1, 1, 1,
0.09160664, 0.386193, 0.9019249, 1, 1, 1, 1, 1,
0.09686927, -0.4103771, 2.288514, 1, 1, 1, 1, 1,
0.09714713, -0.5902191, 4.437146, 1, 1, 1, 1, 1,
0.09825329, -0.6746624, 2.330803, 1, 1, 1, 1, 1,
0.09855424, 0.2810228, 0.04987298, 1, 1, 1, 1, 1,
0.09873701, 0.01616503, 0.5372666, 1, 1, 1, 1, 1,
0.1049034, 0.03084, 0.7538838, 1, 1, 1, 1, 1,
0.1069921, 1.726388, 1.360492, 0, 0, 1, 1, 1,
0.1070838, 0.9735309, -0.1963029, 1, 0, 0, 1, 1,
0.1082334, -0.2250331, 2.575705, 1, 0, 0, 1, 1,
0.1089105, -0.03508641, 2.377624, 1, 0, 0, 1, 1,
0.1093098, 0.1658992, 2.215081, 1, 0, 0, 1, 1,
0.1094177, 0.4454719, 2.07074, 1, 0, 0, 1, 1,
0.1096682, -0.3775341, 2.161344, 0, 0, 0, 1, 1,
0.1116428, -0.528547, 2.78751, 0, 0, 0, 1, 1,
0.1175752, -1.631365, 3.403809, 0, 0, 0, 1, 1,
0.1227154, -0.5571008, 3.571163, 0, 0, 0, 1, 1,
0.1272407, -0.5018706, 3.164639, 0, 0, 0, 1, 1,
0.1296697, 0.03572924, 0.5946922, 0, 0, 0, 1, 1,
0.1317703, 1.102158, 2.083087, 0, 0, 0, 1, 1,
0.1329626, -0.2081768, 0.474204, 1, 1, 1, 1, 1,
0.1443665, 1.271378, 0.1221942, 1, 1, 1, 1, 1,
0.1520239, -1.066551, 4.661693, 1, 1, 1, 1, 1,
0.1549408, -1.565894, 3.921999, 1, 1, 1, 1, 1,
0.161171, -0.1064421, 3.982528, 1, 1, 1, 1, 1,
0.1612713, 0.8690583, 1.135094, 1, 1, 1, 1, 1,
0.1640615, -1.83971, 2.99492, 1, 1, 1, 1, 1,
0.1665884, -1.562258, 2.754563, 1, 1, 1, 1, 1,
0.1668939, 0.5457497, 0.3531998, 1, 1, 1, 1, 1,
0.1684727, -0.7220601, 3.164853, 1, 1, 1, 1, 1,
0.1704655, 0.1116487, 0.251873, 1, 1, 1, 1, 1,
0.1730506, 0.6318262, 0.369078, 1, 1, 1, 1, 1,
0.179345, 0.5844026, -0.06103867, 1, 1, 1, 1, 1,
0.1794136, -0.2726128, 1.742429, 1, 1, 1, 1, 1,
0.187361, 0.1256445, -0.1325615, 1, 1, 1, 1, 1,
0.1907903, -0.6880292, 4.102933, 0, 0, 1, 1, 1,
0.1916517, -0.3941808, 1.759663, 1, 0, 0, 1, 1,
0.1931355, 2.448799, 0.8950451, 1, 0, 0, 1, 1,
0.193747, 0.8338768, -0.4358036, 1, 0, 0, 1, 1,
0.2006029, 0.4390822, 0.8871427, 1, 0, 0, 1, 1,
0.2010079, 1.92354, 0.1020024, 1, 0, 0, 1, 1,
0.2053163, 0.3241012, -1.156089, 0, 0, 0, 1, 1,
0.2058908, -0.8174304, 2.001214, 0, 0, 0, 1, 1,
0.2114782, 0.1917512, 0.1373173, 0, 0, 0, 1, 1,
0.2217628, -0.4554107, 2.437868, 0, 0, 0, 1, 1,
0.2257093, 0.8848808, 0.779918, 0, 0, 0, 1, 1,
0.2271373, -0.42368, 1.914936, 0, 0, 0, 1, 1,
0.22845, 0.106511, -0.3499884, 0, 0, 0, 1, 1,
0.2289034, -0.006676999, 1.899829, 1, 1, 1, 1, 1,
0.229468, -0.3283802, 3.359751, 1, 1, 1, 1, 1,
0.2332887, -0.91368, 1.998109, 1, 1, 1, 1, 1,
0.2337872, 0.714483, 1.062253, 1, 1, 1, 1, 1,
0.2381728, 0.0007722623, 0.6488356, 1, 1, 1, 1, 1,
0.2386367, 1.136051, 0.9534742, 1, 1, 1, 1, 1,
0.2405509, -0.7590326, 3.733366, 1, 1, 1, 1, 1,
0.2418078, 2.558025, -1.647751, 1, 1, 1, 1, 1,
0.2447317, 0.4054231, 0.5517594, 1, 1, 1, 1, 1,
0.2505342, -0.8392694, 3.617635, 1, 1, 1, 1, 1,
0.2583395, 1.152669, -1.004116, 1, 1, 1, 1, 1,
0.2632002, 1.208902, 0.8616048, 1, 1, 1, 1, 1,
0.2651028, 0.1869002, 1.161754, 1, 1, 1, 1, 1,
0.2654524, -0.6423066, 3.262486, 1, 1, 1, 1, 1,
0.2673762, 0.9441597, -0.1271366, 1, 1, 1, 1, 1,
0.2731413, 1.306258, -0.6622517, 0, 0, 1, 1, 1,
0.2735297, -0.08148196, 0.2294739, 1, 0, 0, 1, 1,
0.274303, 0.6400231, 0.08625086, 1, 0, 0, 1, 1,
0.2870745, -1.832124, 2.984974, 1, 0, 0, 1, 1,
0.2910545, -0.114499, 1.431819, 1, 0, 0, 1, 1,
0.2927763, 0.1754765, 1.359506, 1, 0, 0, 1, 1,
0.2998239, 0.7263213, 1.381619, 0, 0, 0, 1, 1,
0.3009109, -0.8726504, 3.433071, 0, 0, 0, 1, 1,
0.3025907, -0.2060981, 1.941646, 0, 0, 0, 1, 1,
0.3026374, 1.48582, -2.568669, 0, 0, 0, 1, 1,
0.3031719, -0.2520723, 3.148501, 0, 0, 0, 1, 1,
0.3069885, -0.1409866, 3.025901, 0, 0, 0, 1, 1,
0.307067, 0.8941625, -0.1728348, 0, 0, 0, 1, 1,
0.3086483, 2.125626, -0.1535082, 1, 1, 1, 1, 1,
0.3201673, -0.16478, 2.109587, 1, 1, 1, 1, 1,
0.3237554, 2.472444, -0.269772, 1, 1, 1, 1, 1,
0.3288016, -0.04246429, 0.474994, 1, 1, 1, 1, 1,
0.3317384, 1.137431, 0.9065449, 1, 1, 1, 1, 1,
0.3355969, -0.7982045, 4.15036, 1, 1, 1, 1, 1,
0.335629, 0.7777098, 0.5275927, 1, 1, 1, 1, 1,
0.3382734, -0.05135519, -0.0191515, 1, 1, 1, 1, 1,
0.3422735, -0.6228647, 1.272211, 1, 1, 1, 1, 1,
0.3443942, 1.542075, 1.640178, 1, 1, 1, 1, 1,
0.3457796, 0.6117338, 0.9300618, 1, 1, 1, 1, 1,
0.3474748, 0.9329269, 0.7034889, 1, 1, 1, 1, 1,
0.3509888, 1.816227, 0.2858115, 1, 1, 1, 1, 1,
0.3526293, -1.407235, 2.329961, 1, 1, 1, 1, 1,
0.3588944, -0.2812669, 3.427435, 1, 1, 1, 1, 1,
0.3599598, 0.9902403, 1.415623, 0, 0, 1, 1, 1,
0.3625182, -0.5491908, 3.881126, 1, 0, 0, 1, 1,
0.3760721, 0.9065905, 0.868513, 1, 0, 0, 1, 1,
0.3769706, -0.8808432, 3.387517, 1, 0, 0, 1, 1,
0.3774867, -0.9643809, 3.111266, 1, 0, 0, 1, 1,
0.3806463, -1.227265, 3.066031, 1, 0, 0, 1, 1,
0.3834088, 0.3372629, 0.3931361, 0, 0, 0, 1, 1,
0.3834334, -0.6341898, 2.063248, 0, 0, 0, 1, 1,
0.3896698, -1.079569, 3.580388, 0, 0, 0, 1, 1,
0.3924656, 0.3930116, 1.427816, 0, 0, 0, 1, 1,
0.3961774, 1.52025, -0.8235589, 0, 0, 0, 1, 1,
0.3980067, -0.5755644, 2.252476, 0, 0, 0, 1, 1,
0.3984195, 0.2351638, 2.246573, 0, 0, 0, 1, 1,
0.4037722, 1.062764, -0.4250796, 1, 1, 1, 1, 1,
0.4060602, -0.7434739, 2.470952, 1, 1, 1, 1, 1,
0.4086474, -0.8912076, 4.076831, 1, 1, 1, 1, 1,
0.4091223, -0.007632588, 1.281733, 1, 1, 1, 1, 1,
0.4128322, -0.09129988, 2.673316, 1, 1, 1, 1, 1,
0.4132175, 0.8067797, 0.8002955, 1, 1, 1, 1, 1,
0.4172649, -0.2243584, 1.071587, 1, 1, 1, 1, 1,
0.4222724, 1.393101, -0.4531501, 1, 1, 1, 1, 1,
0.4231233, 0.4586332, 2.18037, 1, 1, 1, 1, 1,
0.4243308, 0.1204574, 3.492193, 1, 1, 1, 1, 1,
0.4281778, 1.497331, -0.5490102, 1, 1, 1, 1, 1,
0.4303519, 0.2865165, 1.39287, 1, 1, 1, 1, 1,
0.4323098, -1.289594, 2.423123, 1, 1, 1, 1, 1,
0.4333516, -0.5235587, 2.1874, 1, 1, 1, 1, 1,
0.4339471, -1.022425, 2.963426, 1, 1, 1, 1, 1,
0.4358446, -0.1399578, 2.087483, 0, 0, 1, 1, 1,
0.448636, -0.9210461, 2.432863, 1, 0, 0, 1, 1,
0.4493763, -0.6614146, 3.382158, 1, 0, 0, 1, 1,
0.4507342, 0.8349565, -1.286375, 1, 0, 0, 1, 1,
0.4522946, -1.082805, 2.696051, 1, 0, 0, 1, 1,
0.4549029, 0.09533254, -0.0917694, 1, 0, 0, 1, 1,
0.4560696, 0.5758443, -0.3637633, 0, 0, 0, 1, 1,
0.45939, -2.737869, 2.740177, 0, 0, 0, 1, 1,
0.4627338, 2.06357, 0.03700123, 0, 0, 0, 1, 1,
0.4642885, 0.6973103, 1.374953, 0, 0, 0, 1, 1,
0.4670664, -1.538681, 1.197062, 0, 0, 0, 1, 1,
0.4687594, -0.7368463, 2.144177, 0, 0, 0, 1, 1,
0.4695852, 1.074971, 1.269104, 0, 0, 0, 1, 1,
0.4760392, 1.082143, 0.7871348, 1, 1, 1, 1, 1,
0.4797293, 0.105279, 0.2734305, 1, 1, 1, 1, 1,
0.4861886, 0.04585207, 0.3233027, 1, 1, 1, 1, 1,
0.4877238, -0.9141132, 3.616947, 1, 1, 1, 1, 1,
0.4982474, 0.2861062, 1.109053, 1, 1, 1, 1, 1,
0.4985194, -0.5714213, 5.494493, 1, 1, 1, 1, 1,
0.5029433, 0.8487028, -0.6660021, 1, 1, 1, 1, 1,
0.5059084, 2.415956, 0.08246399, 1, 1, 1, 1, 1,
0.5066593, 1.617966, -0.1224919, 1, 1, 1, 1, 1,
0.5069677, -1.088916, 1.573982, 1, 1, 1, 1, 1,
0.5091861, -1.28993, 3.517543, 1, 1, 1, 1, 1,
0.5119669, 1.031792, 1.946738, 1, 1, 1, 1, 1,
0.5143911, 0.3121591, 0.1035605, 1, 1, 1, 1, 1,
0.51526, 0.6638761, 0.2075645, 1, 1, 1, 1, 1,
0.5159422, 0.3091357, 2.890571, 1, 1, 1, 1, 1,
0.5224471, -0.04705181, 1.729432, 0, 0, 1, 1, 1,
0.5267369, 0.9011212, -1.923866, 1, 0, 0, 1, 1,
0.5319359, -0.3555955, 2.251327, 1, 0, 0, 1, 1,
0.5361563, 0.410694, 0.8559945, 1, 0, 0, 1, 1,
0.5364585, -1.199229, 2.616588, 1, 0, 0, 1, 1,
0.5406488, 0.627202, 1.005355, 1, 0, 0, 1, 1,
0.5417853, 1.377858, -0.6200359, 0, 0, 0, 1, 1,
0.5422966, -1.915543, 4.122795, 0, 0, 0, 1, 1,
0.5426906, -0.8351191, 1.742648, 0, 0, 0, 1, 1,
0.5436879, -1.287952, 1.27352, 0, 0, 0, 1, 1,
0.5442312, -0.08122346, 2.124859, 0, 0, 0, 1, 1,
0.5488141, 1.731784, -0.2616107, 0, 0, 0, 1, 1,
0.5488814, -0.06285419, 1.839102, 0, 0, 0, 1, 1,
0.5492927, -0.8302016, 3.884179, 1, 1, 1, 1, 1,
0.5508872, 0.1471976, -0.2593763, 1, 1, 1, 1, 1,
0.5510165, 1.065969, 0.02626807, 1, 1, 1, 1, 1,
0.5514662, -0.1272689, 0.2645127, 1, 1, 1, 1, 1,
0.5527188, -0.3190513, 3.320074, 1, 1, 1, 1, 1,
0.5530009, -1.085556, 4.552486, 1, 1, 1, 1, 1,
0.5615807, 1.565136, -0.3337882, 1, 1, 1, 1, 1,
0.5653673, 0.2995335, -0.3083314, 1, 1, 1, 1, 1,
0.5728819, 1.712421, 1.925158, 1, 1, 1, 1, 1,
0.5756969, 0.7805322, 0.4881285, 1, 1, 1, 1, 1,
0.5773908, -0.2750773, 2.406392, 1, 1, 1, 1, 1,
0.5957847, -0.4797592, 2.997751, 1, 1, 1, 1, 1,
0.5975208, 0.3206272, -0.4077867, 1, 1, 1, 1, 1,
0.5992221, 0.1406908, 0.7090718, 1, 1, 1, 1, 1,
0.5993019, 0.6069986, 1.322466, 1, 1, 1, 1, 1,
0.6009665, -0.4591532, 0.9182116, 0, 0, 1, 1, 1,
0.6030791, -0.7600788, 2.226974, 1, 0, 0, 1, 1,
0.6041369, -0.8125466, 2.83719, 1, 0, 0, 1, 1,
0.6050353, 0.6687068, -0.06413744, 1, 0, 0, 1, 1,
0.6056832, -0.3477412, 1.700983, 1, 0, 0, 1, 1,
0.605819, -2.177641, 2.340452, 1, 0, 0, 1, 1,
0.6122466, -0.8874242, 2.458551, 0, 0, 0, 1, 1,
0.6151631, -2.136825, 1.807401, 0, 0, 0, 1, 1,
0.6170146, 0.7505031, 1.237246, 0, 0, 0, 1, 1,
0.6197867, -2.19022, 2.869498, 0, 0, 0, 1, 1,
0.6278544, 2.165236, 0.04035357, 0, 0, 0, 1, 1,
0.6280642, -1.059935, 1.86794, 0, 0, 0, 1, 1,
0.6294423, 0.3854387, 1.972674, 0, 0, 0, 1, 1,
0.6361706, -1.35007, 3.648136, 1, 1, 1, 1, 1,
0.6386154, -1.446099, 2.629101, 1, 1, 1, 1, 1,
0.6388307, -0.2372668, 1.145537, 1, 1, 1, 1, 1,
0.6423583, -2.041485, 3.620131, 1, 1, 1, 1, 1,
0.6446124, -1.855447, 2.714551, 1, 1, 1, 1, 1,
0.6448718, -2.162769, 3.617131, 1, 1, 1, 1, 1,
0.669036, 1.926556, 0.2364002, 1, 1, 1, 1, 1,
0.6755602, 1.459233, -0.7046859, 1, 1, 1, 1, 1,
0.6777411, -0.3096769, 1.305479, 1, 1, 1, 1, 1,
0.6964799, -0.6276888, 1.092902, 1, 1, 1, 1, 1,
0.7015309, -0.550479, 1.399462, 1, 1, 1, 1, 1,
0.7024294, 1.951674, -0.9892235, 1, 1, 1, 1, 1,
0.7074714, 1.148188, 2.169637, 1, 1, 1, 1, 1,
0.7088518, 0.8758517, 0.5527959, 1, 1, 1, 1, 1,
0.7098823, -0.1589557, 0.8062121, 1, 1, 1, 1, 1,
0.7106473, 0.6222895, 0.7648404, 0, 0, 1, 1, 1,
0.7131181, -1.678456, 3.046169, 1, 0, 0, 1, 1,
0.7147683, -0.787096, 2.316185, 1, 0, 0, 1, 1,
0.7165565, 0.5910558, 0.2177999, 1, 0, 0, 1, 1,
0.7175085, 1.145783, -0.03413402, 1, 0, 0, 1, 1,
0.7188926, 0.5542986, -1.050766, 1, 0, 0, 1, 1,
0.7223746, -0.977433, 2.739531, 0, 0, 0, 1, 1,
0.7229803, 0.3268629, 1.448875, 0, 0, 0, 1, 1,
0.725402, -1.74141, 3.289572, 0, 0, 0, 1, 1,
0.7292114, 1.092029, 0.08685051, 0, 0, 0, 1, 1,
0.7312537, 0.4119896, 2.449211, 0, 0, 0, 1, 1,
0.7336414, 1.067523, 0.9517915, 0, 0, 0, 1, 1,
0.7353458, 0.2141591, 1.629053, 0, 0, 0, 1, 1,
0.7446105, 0.5864867, -1.543965, 1, 1, 1, 1, 1,
0.7591476, 0.2031591, 0.4262892, 1, 1, 1, 1, 1,
0.7592314, 0.7929412, 0.5960577, 1, 1, 1, 1, 1,
0.7643517, -0.9258304, 2.228085, 1, 1, 1, 1, 1,
0.7654986, 0.5469232, 0.8518087, 1, 1, 1, 1, 1,
0.7672613, 0.01384697, 1.758286, 1, 1, 1, 1, 1,
0.776661, 1.115704, 0.2184648, 1, 1, 1, 1, 1,
0.7781082, 1.048308, -0.5115208, 1, 1, 1, 1, 1,
0.7821206, 0.2729785, 2.254692, 1, 1, 1, 1, 1,
0.791255, -0.05459179, 1.476532, 1, 1, 1, 1, 1,
0.7919044, 0.506174, -0.0645282, 1, 1, 1, 1, 1,
0.7950726, 0.906863, -0.4706574, 1, 1, 1, 1, 1,
0.8005245, 0.5574188, 1.001433, 1, 1, 1, 1, 1,
0.8008797, -1.292167, 3.457667, 1, 1, 1, 1, 1,
0.8016151, 0.2615336, 0.2514174, 1, 1, 1, 1, 1,
0.8021287, 1.452005, -1.480263, 0, 0, 1, 1, 1,
0.8025169, -0.2959987, 1.096082, 1, 0, 0, 1, 1,
0.8041626, 0.8772636, 0.6697909, 1, 0, 0, 1, 1,
0.8054917, -0.2197012, 1.879215, 1, 0, 0, 1, 1,
0.8078787, -1.360317, 3.810892, 1, 0, 0, 1, 1,
0.8080192, 0.04123205, 3.814602, 1, 0, 0, 1, 1,
0.811258, -0.9212276, 2.616848, 0, 0, 0, 1, 1,
0.8145889, -0.6980441, 2.719243, 0, 0, 0, 1, 1,
0.8184325, 0.5105733, -0.50129, 0, 0, 0, 1, 1,
0.8192175, 1.003006, 0.2424035, 0, 0, 0, 1, 1,
0.8208334, -0.9586097, 4.530557, 0, 0, 0, 1, 1,
0.8245286, -0.6333269, 1.349896, 0, 0, 0, 1, 1,
0.8277565, 0.4629842, 2.057506, 0, 0, 0, 1, 1,
0.8285638, 0.7378032, 0.6320266, 1, 1, 1, 1, 1,
0.8328088, 0.7092283, 0.5818743, 1, 1, 1, 1, 1,
0.8342183, 0.3629536, 1.556792, 1, 1, 1, 1, 1,
0.8349506, -1.363973, 1.180306, 1, 1, 1, 1, 1,
0.8391204, 0.4482251, 2.021142, 1, 1, 1, 1, 1,
0.8400844, -0.3346741, 1.785319, 1, 1, 1, 1, 1,
0.8517494, -0.262898, 1.924617, 1, 1, 1, 1, 1,
0.8583241, -0.005520954, 0.04234091, 1, 1, 1, 1, 1,
0.8642307, -0.651671, 2.172135, 1, 1, 1, 1, 1,
0.86773, 1.790353, 0.2196437, 1, 1, 1, 1, 1,
0.8712062, 0.6038237, 0.9563146, 1, 1, 1, 1, 1,
0.8726167, -0.1433306, 0.9835169, 1, 1, 1, 1, 1,
0.874551, -0.9261099, 2.231226, 1, 1, 1, 1, 1,
0.8745696, 1.031164, 0.4528155, 1, 1, 1, 1, 1,
0.8821958, 0.3172278, 1.704585, 1, 1, 1, 1, 1,
0.8846984, -0.07995686, 2.381294, 0, 0, 1, 1, 1,
0.8914626, 2.42823, 0.5768401, 1, 0, 0, 1, 1,
0.8982328, 1.110117, 0.2017799, 1, 0, 0, 1, 1,
0.9064178, 0.08065843, 1.653499, 1, 0, 0, 1, 1,
0.9084449, 0.3728794, 0.2896622, 1, 0, 0, 1, 1,
0.9104794, 0.707, 0.8719445, 1, 0, 0, 1, 1,
0.9154875, 1.620733, 0.9403749, 0, 0, 0, 1, 1,
0.9242585, 0.4700245, 1.207632, 0, 0, 0, 1, 1,
0.9269524, -0.4053482, 2.140239, 0, 0, 0, 1, 1,
0.9286677, -1.73163, 3.604322, 0, 0, 0, 1, 1,
0.9334919, 0.1352577, 2.840032, 0, 0, 0, 1, 1,
0.9380355, -2.269276, 2.635039, 0, 0, 0, 1, 1,
0.9390863, -0.9024822, 1.945133, 0, 0, 0, 1, 1,
0.9402649, 0.4620381, 2.258039, 1, 1, 1, 1, 1,
0.9425334, 0.1047238, 2.82809, 1, 1, 1, 1, 1,
0.9478143, 0.4827764, -0.7119048, 1, 1, 1, 1, 1,
0.9554085, 0.758462, 1.301525, 1, 1, 1, 1, 1,
0.9557788, 0.2640977, 2.068846, 1, 1, 1, 1, 1,
0.9573286, 1.269553, 0.04001256, 1, 1, 1, 1, 1,
0.975732, 1.311122, 1.895807, 1, 1, 1, 1, 1,
0.9773137, -1.081037, 2.261626, 1, 1, 1, 1, 1,
0.9859528, 0.04167767, 2.301691, 1, 1, 1, 1, 1,
0.990695, 0.4336322, -0.4777682, 1, 1, 1, 1, 1,
0.9912245, 0.4221561, -0.659041, 1, 1, 1, 1, 1,
0.9929664, 0.1347931, 1.780665, 1, 1, 1, 1, 1,
0.9959702, -0.5374038, 1.729607, 1, 1, 1, 1, 1,
1.000717, -0.8109761, 3.241593, 1, 1, 1, 1, 1,
1.011898, 1.602462, 0.7327164, 1, 1, 1, 1, 1,
1.025153, 0.09839155, 1.644285, 0, 0, 1, 1, 1,
1.026919, -0.5763841, 2.916587, 1, 0, 0, 1, 1,
1.028966, 0.3997126, 0.4060856, 1, 0, 0, 1, 1,
1.030467, 0.3005455, 1.275575, 1, 0, 0, 1, 1,
1.032163, 0.2126251, 1.125829, 1, 0, 0, 1, 1,
1.035239, -0.3715667, 1.594484, 1, 0, 0, 1, 1,
1.04289, 1.275187, 0.3811951, 0, 0, 0, 1, 1,
1.05051, 0.5528421, 0.5740197, 0, 0, 0, 1, 1,
1.050792, -0.8065496, 2.37819, 0, 0, 0, 1, 1,
1.057189, 0.09542442, 0.4081839, 0, 0, 0, 1, 1,
1.057814, 0.3740253, 1.117552, 0, 0, 0, 1, 1,
1.058504, 0.2482331, 1.72061, 0, 0, 0, 1, 1,
1.061551, -0.8231754, 1.556397, 0, 0, 0, 1, 1,
1.064798, 1.728628, 0.4915725, 1, 1, 1, 1, 1,
1.066262, -0.5248001, 4.04831, 1, 1, 1, 1, 1,
1.06734, -2.418864, 3.072965, 1, 1, 1, 1, 1,
1.069051, 0.5545797, 2.623356, 1, 1, 1, 1, 1,
1.069527, 1.518996, 0.1223862, 1, 1, 1, 1, 1,
1.073092, 0.6963843, 1.41648, 1, 1, 1, 1, 1,
1.075097, 0.1459628, 2.400936, 1, 1, 1, 1, 1,
1.081994, 1.886521, -1.575567, 1, 1, 1, 1, 1,
1.082847, 0.9135414, 3.239501, 1, 1, 1, 1, 1,
1.086498, 1.291545, -0.316865, 1, 1, 1, 1, 1,
1.089467, -0.2416987, 2.8978, 1, 1, 1, 1, 1,
1.092817, -2.321547, 2.743236, 1, 1, 1, 1, 1,
1.096836, -0.866389, 1.917793, 1, 1, 1, 1, 1,
1.099971, 0.724484, 0.3872134, 1, 1, 1, 1, 1,
1.126543, -0.4800321, 0.9946117, 1, 1, 1, 1, 1,
1.127444, -1.435665, 2.276915, 0, 0, 1, 1, 1,
1.130831, 0.6178875, 1.586052, 1, 0, 0, 1, 1,
1.133962, -0.3868712, 1.688886, 1, 0, 0, 1, 1,
1.13781, 0.007479812, 2.348655, 1, 0, 0, 1, 1,
1.138693, 0.6335905, 0.4314189, 1, 0, 0, 1, 1,
1.143277, 0.2263902, -0.1790398, 1, 0, 0, 1, 1,
1.145659, 1.125631, 0.4345794, 0, 0, 0, 1, 1,
1.150832, 0.4627814, 1.025236, 0, 0, 0, 1, 1,
1.152651, 0.5558388, 2.055141, 0, 0, 0, 1, 1,
1.154065, 0.6128199, 0.8842427, 0, 0, 0, 1, 1,
1.185963, -0.1177819, -0.2034367, 0, 0, 0, 1, 1,
1.186869, -0.6482269, -0.1066491, 0, 0, 0, 1, 1,
1.187611, -1.495494, 1.542971, 0, 0, 0, 1, 1,
1.20205, 0.9516653, 0.5119188, 1, 1, 1, 1, 1,
1.211079, -0.5587668, 2.19926, 1, 1, 1, 1, 1,
1.219261, -0.6198823, 1.534754, 1, 1, 1, 1, 1,
1.22049, -0.1156417, 3.588879, 1, 1, 1, 1, 1,
1.221952, -0.9373693, 1.128677, 1, 1, 1, 1, 1,
1.226411, 0.4854252, 2.04798, 1, 1, 1, 1, 1,
1.231348, 0.30494, 2.539916, 1, 1, 1, 1, 1,
1.24062, 0.2611566, 1.517083, 1, 1, 1, 1, 1,
1.240799, -0.5580212, 3.993826, 1, 1, 1, 1, 1,
1.241262, 0.2440978, 1.464315, 1, 1, 1, 1, 1,
1.251187, 0.3908786, 3.035945, 1, 1, 1, 1, 1,
1.252912, 1.653516, 0.2178661, 1, 1, 1, 1, 1,
1.269138, 0.08962125, 1.522112, 1, 1, 1, 1, 1,
1.269445, -0.2856489, 0.9270415, 1, 1, 1, 1, 1,
1.269943, -0.7506518, 2.493197, 1, 1, 1, 1, 1,
1.270895, -1.090888, 1.253942, 0, 0, 1, 1, 1,
1.275892, 1.119394, -0.9305943, 1, 0, 0, 1, 1,
1.279042, 0.3485559, 0.3809657, 1, 0, 0, 1, 1,
1.280983, -1.140929, 1.216332, 1, 0, 0, 1, 1,
1.294221, -0.1006627, 0.2385786, 1, 0, 0, 1, 1,
1.295794, 1.016844, 0.5616119, 1, 0, 0, 1, 1,
1.30003, -0.651167, 2.575489, 0, 0, 0, 1, 1,
1.310776, 0.7458595, 1.808681, 0, 0, 0, 1, 1,
1.311831, 0.8126493, 1.740089, 0, 0, 0, 1, 1,
1.315716, 1.404387, -0.01724683, 0, 0, 0, 1, 1,
1.321209, -0.2155816, 1.616555, 0, 0, 0, 1, 1,
1.330052, -1.017952, 1.812597, 0, 0, 0, 1, 1,
1.340925, 0.4983482, 0.05624043, 0, 0, 0, 1, 1,
1.347068, 0.1801104, 0.7557893, 1, 1, 1, 1, 1,
1.361857, -1.839063, 2.771253, 1, 1, 1, 1, 1,
1.364239, 0.5214071, -0.6918781, 1, 1, 1, 1, 1,
1.367761, -1.824884, 1.486816, 1, 1, 1, 1, 1,
1.368716, -0.5826991, 2.779988, 1, 1, 1, 1, 1,
1.368814, 0.1268701, 1.93974, 1, 1, 1, 1, 1,
1.378806, -1.640595, 2.696047, 1, 1, 1, 1, 1,
1.381762, -0.4533936, 1.477653, 1, 1, 1, 1, 1,
1.391906, -0.1006911, 1.401936, 1, 1, 1, 1, 1,
1.399427, -0.2091743, 1.032351, 1, 1, 1, 1, 1,
1.401918, -0.1682624, 1.726999, 1, 1, 1, 1, 1,
1.408919, -0.4977335, 4.350278, 1, 1, 1, 1, 1,
1.412333, -1.267949, 3.204358, 1, 1, 1, 1, 1,
1.414948, -0.2717341, 3.682618, 1, 1, 1, 1, 1,
1.425627, 1.392399, 2.05712, 1, 1, 1, 1, 1,
1.439736, -1.199537, 4.178617, 0, 0, 1, 1, 1,
1.446335, 1.087396, 1.015866, 1, 0, 0, 1, 1,
1.460721, -1.159833, 1.961083, 1, 0, 0, 1, 1,
1.466115, 0.7474447, 2.953651, 1, 0, 0, 1, 1,
1.500024, 1.310696, 0.3398765, 1, 0, 0, 1, 1,
1.502624, 0.7250612, 1.909971, 1, 0, 0, 1, 1,
1.505497, 0.09754053, 1.041759, 0, 0, 0, 1, 1,
1.506272, -0.9223104, 2.362941, 0, 0, 0, 1, 1,
1.515292, -0.7683121, 1.90146, 0, 0, 0, 1, 1,
1.522044, 0.1448674, 1.738686, 0, 0, 0, 1, 1,
1.529016, -1.10233, -0.2752933, 0, 0, 0, 1, 1,
1.540995, -3.472742, 3.199872, 0, 0, 0, 1, 1,
1.545601, -0.8443339, 1.228411, 0, 0, 0, 1, 1,
1.545842, 0.325797, 0.7752079, 1, 1, 1, 1, 1,
1.560994, -1.494133, 2.532662, 1, 1, 1, 1, 1,
1.563377, -1.208579, 2.434536, 1, 1, 1, 1, 1,
1.570077, -1.623898, 3.722338, 1, 1, 1, 1, 1,
1.579569, -1.273472, 1.817148, 1, 1, 1, 1, 1,
1.608109, 1.215353, -0.4864328, 1, 1, 1, 1, 1,
1.619061, -1.318018, 3.297185, 1, 1, 1, 1, 1,
1.633789, -2.422639, 2.204946, 1, 1, 1, 1, 1,
1.644243, 0.5916498, 1.911431, 1, 1, 1, 1, 1,
1.648038, -1.136347, 3.630625, 1, 1, 1, 1, 1,
1.666625, -0.1227398, 3.650738, 1, 1, 1, 1, 1,
1.668126, 0.1754245, 1.686255, 1, 1, 1, 1, 1,
1.669128, -0.8077607, 1.513549, 1, 1, 1, 1, 1,
1.68023, 1.489298, 1.644493, 1, 1, 1, 1, 1,
1.682304, -0.6968991, 0.9041702, 1, 1, 1, 1, 1,
1.697835, 0.6247607, 1.685205, 0, 0, 1, 1, 1,
1.714362, -1.64337, 3.303939, 1, 0, 0, 1, 1,
1.718855, -0.9842883, 0.7120005, 1, 0, 0, 1, 1,
1.737146, -0.8857429, 1.510779, 1, 0, 0, 1, 1,
1.751662, 0.06711692, 2.766186, 1, 0, 0, 1, 1,
1.754716, -1.930429, 2.548766, 1, 0, 0, 1, 1,
1.783074, -0.7026888, 1.226017, 0, 0, 0, 1, 1,
1.796465, -0.7383823, 0.9686493, 0, 0, 0, 1, 1,
1.801762, -0.2914656, 3.066668, 0, 0, 0, 1, 1,
1.810903, -0.5971389, 1.623821, 0, 0, 0, 1, 1,
1.850154, -0.5723877, 1.128774, 0, 0, 0, 1, 1,
1.873729, 1.551542, 2.690522, 0, 0, 0, 1, 1,
1.881025, 0.6739464, 0.9585819, 0, 0, 0, 1, 1,
1.881446, -0.641876, 2.901795, 1, 1, 1, 1, 1,
1.8887, -0.2408409, 1.5099, 1, 1, 1, 1, 1,
1.890244, -0.6517224, 3.364982, 1, 1, 1, 1, 1,
1.894207, 0.5752985, 2.053628, 1, 1, 1, 1, 1,
1.895045, 0.8031735, 2.315799, 1, 1, 1, 1, 1,
1.917756, 0.8267668, 0.3701862, 1, 1, 1, 1, 1,
1.934606, -1.079577, 2.76724, 1, 1, 1, 1, 1,
1.95064, -0.4998628, 3.512369, 1, 1, 1, 1, 1,
2.003663, 2.370059, -1.099295, 1, 1, 1, 1, 1,
2.015937, 0.4777018, 0.1074721, 1, 1, 1, 1, 1,
2.020265, -0.6966298, 3.315604, 1, 1, 1, 1, 1,
2.032788, -0.7766805, 2.534236, 1, 1, 1, 1, 1,
2.054337, -0.01066071, 1.216343, 1, 1, 1, 1, 1,
2.071822, -1.402533, 2.238092, 1, 1, 1, 1, 1,
2.093688, -1.126684, 1.816356, 1, 1, 1, 1, 1,
2.145008, -0.4839096, 3.101275, 0, 0, 1, 1, 1,
2.149333, -1.710358, 4.829679, 1, 0, 0, 1, 1,
2.165611, -1.724876, 2.17489, 1, 0, 0, 1, 1,
2.190056, -1.240953, 3.451715, 1, 0, 0, 1, 1,
2.203055, 1.313753, 0.831075, 1, 0, 0, 1, 1,
2.205297, -2.702958, 3.383863, 1, 0, 0, 1, 1,
2.220781, -2.44028, 2.825668, 0, 0, 0, 1, 1,
2.237233, 1.516814, 2.380046, 0, 0, 0, 1, 1,
2.308472, -0.1054599, 1.994991, 0, 0, 0, 1, 1,
2.311686, -0.008941776, 2.512694, 0, 0, 0, 1, 1,
2.366087, -0.01199213, 1.252402, 0, 0, 0, 1, 1,
2.381798, -0.003063858, 1.790238, 0, 0, 0, 1, 1,
2.385368, -1.480944, -0.3390266, 0, 0, 0, 1, 1,
2.436103, -2.052459, 2.500379, 1, 1, 1, 1, 1,
2.447738, 0.1516939, 3.47102, 1, 1, 1, 1, 1,
2.532446, 0.3653524, -0.0106027, 1, 1, 1, 1, 1,
2.651594, 1.805021, -0.6439758, 1, 1, 1, 1, 1,
2.689045, 0.676981, -0.08948728, 1, 1, 1, 1, 1,
3.227795, 0.7931669, 3.259741, 1, 1, 1, 1, 1,
3.319662, 0.1229731, 3.425441, 1, 1, 1, 1, 1
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
var radius = 9.736943;
var distance = 34.2006;
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
mvMatrix.translate( -0.2180104, 0.3681177, 0.1899879 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2006);
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
