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
-2.706957, 0.6169481, -1.887695, 1, 0, 0, 1,
-2.661259, 1.807475, -1.096319, 1, 0.007843138, 0, 1,
-2.619315, 0.003880268, -2.137094, 1, 0.01176471, 0, 1,
-2.380181, -3.681878, -3.461398, 1, 0.01960784, 0, 1,
-2.324145, -1.052402, -1.608365, 1, 0.02352941, 0, 1,
-2.32039, -0.731816, -1.838592, 1, 0.03137255, 0, 1,
-2.255952, -0.02075227, -1.293251, 1, 0.03529412, 0, 1,
-2.15605, 0.9720725, -1.9775, 1, 0.04313726, 0, 1,
-2.153561, 0.6875867, -0.9750232, 1, 0.04705882, 0, 1,
-2.106556, -0.301784, -0.9696601, 1, 0.05490196, 0, 1,
-2.069189, 1.057063, -0.5768329, 1, 0.05882353, 0, 1,
-2.066696, 0.6330491, -0.6051255, 1, 0.06666667, 0, 1,
-2.057191, 0.3399583, -1.378276, 1, 0.07058824, 0, 1,
-2.027895, -0.8333892, -2.010028, 1, 0.07843138, 0, 1,
-1.991102, 1.363463, -1.926243, 1, 0.08235294, 0, 1,
-1.983399, 0.8004029, -0.8934324, 1, 0.09019608, 0, 1,
-1.928929, -0.9641477, -2.339666, 1, 0.09411765, 0, 1,
-1.910098, -0.3306344, -1.28722, 1, 0.1019608, 0, 1,
-1.871458, 0.1160243, -0.2266452, 1, 0.1098039, 0, 1,
-1.852558, -0.0194169, -2.097938, 1, 0.1137255, 0, 1,
-1.83918, -0.007468966, -1.125382, 1, 0.1215686, 0, 1,
-1.805078, -1.445453, -2.559694, 1, 0.1254902, 0, 1,
-1.795104, -0.3685399, -3.444267, 1, 0.1333333, 0, 1,
-1.794335, -0.5904046, 0.4633251, 1, 0.1372549, 0, 1,
-1.774831, 0.3521518, -1.746547, 1, 0.145098, 0, 1,
-1.759147, -0.3976408, -2.104262, 1, 0.1490196, 0, 1,
-1.744565, -0.7084304, -0.4289211, 1, 0.1568628, 0, 1,
-1.736617, 0.9717055, -2.115194, 1, 0.1607843, 0, 1,
-1.736261, 1.385232, 2.873344, 1, 0.1686275, 0, 1,
-1.722799, 1.761036, -0.03894419, 1, 0.172549, 0, 1,
-1.720071, -0.5151355, -3.5102, 1, 0.1803922, 0, 1,
-1.716915, 1.429091, -2.162462, 1, 0.1843137, 0, 1,
-1.711821, -0.8652946, -2.172315, 1, 0.1921569, 0, 1,
-1.708332, -0.09345915, -3.101625, 1, 0.1960784, 0, 1,
-1.705211, 0.3386289, -0.8600054, 1, 0.2039216, 0, 1,
-1.700961, 0.3531237, -0.9844077, 1, 0.2117647, 0, 1,
-1.695168, 0.3058571, -1.532595, 1, 0.2156863, 0, 1,
-1.693549, -0.3544253, -2.777688, 1, 0.2235294, 0, 1,
-1.692196, 1.111191, -1.359337, 1, 0.227451, 0, 1,
-1.687337, -1.534019, -1.346007, 1, 0.2352941, 0, 1,
-1.670099, -0.9789376, -0.7803983, 1, 0.2392157, 0, 1,
-1.640382, -0.6381465, -2.368571, 1, 0.2470588, 0, 1,
-1.617746, 0.2941443, -0.5752945, 1, 0.2509804, 0, 1,
-1.599405, -0.3123823, -1.647479, 1, 0.2588235, 0, 1,
-1.581181, 1.137425, -1.185581, 1, 0.2627451, 0, 1,
-1.559791, 0.8270467, -1.167606, 1, 0.2705882, 0, 1,
-1.549132, 1.284652, -2.702207, 1, 0.2745098, 0, 1,
-1.541571, -0.6667556, -2.482499, 1, 0.282353, 0, 1,
-1.539096, -0.5301987, -0.8912947, 1, 0.2862745, 0, 1,
-1.53603, -0.09214865, -1.648042, 1, 0.2941177, 0, 1,
-1.53042, 1.602531, -2.261584, 1, 0.3019608, 0, 1,
-1.525182, -0.5579247, 0.692972, 1, 0.3058824, 0, 1,
-1.524925, -0.5788214, -0.08645032, 1, 0.3137255, 0, 1,
-1.508137, -1.520136, -3.004579, 1, 0.3176471, 0, 1,
-1.496479, 1.074832, 0.3389396, 1, 0.3254902, 0, 1,
-1.483812, -0.2195353, -0.2738317, 1, 0.3294118, 0, 1,
-1.483258, 0.1026954, -1.161333, 1, 0.3372549, 0, 1,
-1.482546, -1.980397, -2.040124, 1, 0.3411765, 0, 1,
-1.474284, 0.5939621, -1.029213, 1, 0.3490196, 0, 1,
-1.469194, -2.062483, -2.318671, 1, 0.3529412, 0, 1,
-1.467637, 0.9511626, -0.5497651, 1, 0.3607843, 0, 1,
-1.465006, 0.5029888, -0.3786347, 1, 0.3647059, 0, 1,
-1.460184, 1.959836, 1.149193, 1, 0.372549, 0, 1,
-1.450066, -0.9435635, -1.894246, 1, 0.3764706, 0, 1,
-1.447002, 1.46202, -0.2412866, 1, 0.3843137, 0, 1,
-1.446959, 0.2765234, -2.674712, 1, 0.3882353, 0, 1,
-1.4399, -0.0449727, -2.255564, 1, 0.3960784, 0, 1,
-1.413539, -0.8072855, -1.043907, 1, 0.4039216, 0, 1,
-1.40944, -0.2210495, -1.276463, 1, 0.4078431, 0, 1,
-1.408964, 0.2979628, -1.019859, 1, 0.4156863, 0, 1,
-1.402384, -0.9884282, -1.663131, 1, 0.4196078, 0, 1,
-1.399824, 0.5636442, -2.478384, 1, 0.427451, 0, 1,
-1.392564, -0.9192181, -0.6910293, 1, 0.4313726, 0, 1,
-1.380011, -0.7820031, -3.291275, 1, 0.4392157, 0, 1,
-1.371072, 0.2794105, -1.769023, 1, 0.4431373, 0, 1,
-1.370199, 0.5749807, -0.7996894, 1, 0.4509804, 0, 1,
-1.368192, -1.456667, -2.303117, 1, 0.454902, 0, 1,
-1.335717, -0.8992721, -0.2618768, 1, 0.4627451, 0, 1,
-1.332004, -0.05090545, -2.019563, 1, 0.4666667, 0, 1,
-1.326389, 0.7759055, -1.791796, 1, 0.4745098, 0, 1,
-1.309454, 1.568699, -1.801832, 1, 0.4784314, 0, 1,
-1.302181, -0.6082362, -2.897139, 1, 0.4862745, 0, 1,
-1.301411, -0.8896967, -2.367168, 1, 0.4901961, 0, 1,
-1.298515, -1.6246, -2.805874, 1, 0.4980392, 0, 1,
-1.297723, 0.5591862, -0.5171849, 1, 0.5058824, 0, 1,
-1.294037, 1.953088, -0.9210429, 1, 0.509804, 0, 1,
-1.291383, 1.588433, -1.181673, 1, 0.5176471, 0, 1,
-1.290563, -1.223707, -0.9550064, 1, 0.5215687, 0, 1,
-1.290531, 1.75195, -0.6528132, 1, 0.5294118, 0, 1,
-1.278957, 1.302078, -1.97932, 1, 0.5333334, 0, 1,
-1.278257, -1.688479, -3.445474, 1, 0.5411765, 0, 1,
-1.253585, 0.6396506, -2.052832, 1, 0.5450981, 0, 1,
-1.24852, -1.264879, -2.71527, 1, 0.5529412, 0, 1,
-1.246731, -0.4550088, -2.210502, 1, 0.5568628, 0, 1,
-1.245638, 0.7640751, -1.052575, 1, 0.5647059, 0, 1,
-1.244231, 0.4830752, -0.8641205, 1, 0.5686275, 0, 1,
-1.242063, 1.048226, -0.45645, 1, 0.5764706, 0, 1,
-1.237942, 0.1646071, -3.416651, 1, 0.5803922, 0, 1,
-1.236498, -0.3497679, -0.2026802, 1, 0.5882353, 0, 1,
-1.23599, -0.3098724, -2.656656, 1, 0.5921569, 0, 1,
-1.235619, 1.163153, -1.309067, 1, 0.6, 0, 1,
-1.234097, -0.5188152, -2.525083, 1, 0.6078432, 0, 1,
-1.228011, 0.5642843, -2.374025, 1, 0.6117647, 0, 1,
-1.227687, 0.537171, -1.405696, 1, 0.6196079, 0, 1,
-1.221502, 0.5503064, -2.223569, 1, 0.6235294, 0, 1,
-1.217545, 1.225826, -1.480641, 1, 0.6313726, 0, 1,
-1.201813, 0.578341, -0.7359308, 1, 0.6352941, 0, 1,
-1.199039, 0.01575667, -2.196806, 1, 0.6431373, 0, 1,
-1.19571, 1.714565, -0.8506193, 1, 0.6470588, 0, 1,
-1.195083, 1.482501, 0.01355336, 1, 0.654902, 0, 1,
-1.192771, 0.2816001, -1.492596, 1, 0.6588235, 0, 1,
-1.177039, -0.5119933, -3.686053, 1, 0.6666667, 0, 1,
-1.168534, 1.403087, -0.02561993, 1, 0.6705883, 0, 1,
-1.155416, 1.634049, -0.05642119, 1, 0.6784314, 0, 1,
-1.153188, 0.7274252, -2.235672, 1, 0.682353, 0, 1,
-1.153033, 0.6211978, -1.723845, 1, 0.6901961, 0, 1,
-1.143156, 0.1589404, 0.4485221, 1, 0.6941177, 0, 1,
-1.140692, -0.3633319, -2.044246, 1, 0.7019608, 0, 1,
-1.135806, -0.05526069, -3.237066, 1, 0.7098039, 0, 1,
-1.128531, -1.385973, -1.895222, 1, 0.7137255, 0, 1,
-1.123725, 0.1312646, -0.7107317, 1, 0.7215686, 0, 1,
-1.122524, -0.3519971, -3.351995, 1, 0.7254902, 0, 1,
-1.110771, -0.2385018, -1.828868, 1, 0.7333333, 0, 1,
-1.110737, -2.393789, -3.066874, 1, 0.7372549, 0, 1,
-1.110182, 1.208335, -1.025734, 1, 0.7450981, 0, 1,
-1.108361, -0.2971749, -1.056648, 1, 0.7490196, 0, 1,
-1.104705, 1.40368, -0.04107099, 1, 0.7568628, 0, 1,
-1.09236, 1.550572, 0.7940548, 1, 0.7607843, 0, 1,
-1.091659, -0.700479, -3.800926, 1, 0.7686275, 0, 1,
-1.090616, 1.460682, -0.2178961, 1, 0.772549, 0, 1,
-1.081397, 1.643736, -1.156232, 1, 0.7803922, 0, 1,
-1.080283, 0.08318779, -2.074649, 1, 0.7843137, 0, 1,
-1.079499, 1.153237, -0.4810515, 1, 0.7921569, 0, 1,
-1.069095, -0.418264, -1.393392, 1, 0.7960784, 0, 1,
-1.06657, 1.251978, -0.7465453, 1, 0.8039216, 0, 1,
-1.06481, 0.59298, -2.523803, 1, 0.8117647, 0, 1,
-1.062262, 0.9392277, -0.02088098, 1, 0.8156863, 0, 1,
-1.052821, 0.593221, -1.07022, 1, 0.8235294, 0, 1,
-1.04948, 0.1017049, -1.729714, 1, 0.827451, 0, 1,
-1.040372, -0.3894629, -2.47148, 1, 0.8352941, 0, 1,
-1.03758, -1.683158, -3.452384, 1, 0.8392157, 0, 1,
-1.031615, -2.439274, -1.092335, 1, 0.8470588, 0, 1,
-1.02949, 0.1090865, -0.7647305, 1, 0.8509804, 0, 1,
-1.028239, 0.1007179, -2.88764, 1, 0.8588235, 0, 1,
-1.025366, -0.598366, -1.880167, 1, 0.8627451, 0, 1,
-1.01543, 0.7306494, -0.5715065, 1, 0.8705882, 0, 1,
-1.014292, -1.35884, -2.376532, 1, 0.8745098, 0, 1,
-1.010677, 0.8656217, -0.7620935, 1, 0.8823529, 0, 1,
-1.009196, 0.5226808, -2.475538, 1, 0.8862745, 0, 1,
-1.00741, 0.9639693, -2.282031, 1, 0.8941177, 0, 1,
-1.006895, -1.924431, -0.8687737, 1, 0.8980392, 0, 1,
-1.004502, -1.22328, -2.595786, 1, 0.9058824, 0, 1,
-1.000858, 0.1649084, -1.498417, 1, 0.9137255, 0, 1,
-0.9945576, 0.9236564, -1.128937, 1, 0.9176471, 0, 1,
-0.9907255, -0.08936587, -1.125272, 1, 0.9254902, 0, 1,
-0.9897168, 1.099743, -0.3068363, 1, 0.9294118, 0, 1,
-0.9894016, 0.4282893, -0.7920534, 1, 0.9372549, 0, 1,
-0.9880264, 0.1742789, -1.018849, 1, 0.9411765, 0, 1,
-0.9874932, 1.121873, -0.3959608, 1, 0.9490196, 0, 1,
-0.9831405, 0.9146013, -1.127924, 1, 0.9529412, 0, 1,
-0.9830703, 0.403084, 0.4429494, 1, 0.9607843, 0, 1,
-0.9828529, 0.3660915, 0.1746834, 1, 0.9647059, 0, 1,
-0.9798571, 0.07171082, 0.5595046, 1, 0.972549, 0, 1,
-0.9794599, 0.2157274, -1.884188, 1, 0.9764706, 0, 1,
-0.9759154, 0.8141886, -1.160928, 1, 0.9843137, 0, 1,
-0.9669668, 0.8689052, 1.775114, 1, 0.9882353, 0, 1,
-0.9665816, 0.5235981, 0.754676, 1, 0.9960784, 0, 1,
-0.9661366, -0.8151716, -1.290717, 0.9960784, 1, 0, 1,
-0.96281, -1.831598, -1.910223, 0.9921569, 1, 0, 1,
-0.9559293, -0.08212136, -0.288233, 0.9843137, 1, 0, 1,
-0.9558727, 0.3274741, -0.4165646, 0.9803922, 1, 0, 1,
-0.955498, 0.3256222, -0.832692, 0.972549, 1, 0, 1,
-0.9508209, 0.9247347, 0.4298348, 0.9686275, 1, 0, 1,
-0.9492, -1.308157, -3.276563, 0.9607843, 1, 0, 1,
-0.9487402, 0.3556955, 0.6283643, 0.9568627, 1, 0, 1,
-0.9457549, -0.4020513, -2.329177, 0.9490196, 1, 0, 1,
-0.9446709, 0.2205927, -1.828051, 0.945098, 1, 0, 1,
-0.9431487, 0.9028092, 0.5823911, 0.9372549, 1, 0, 1,
-0.9377185, 2.53137, -0.1518106, 0.9333333, 1, 0, 1,
-0.9368325, -1.04608, -1.701304, 0.9254902, 1, 0, 1,
-0.9290431, -1.073363, -1.182666, 0.9215686, 1, 0, 1,
-0.9222876, 0.5509542, 0.2679175, 0.9137255, 1, 0, 1,
-0.9213401, -0.05575292, -0.9149212, 0.9098039, 1, 0, 1,
-0.916294, -0.03336596, -2.457108, 0.9019608, 1, 0, 1,
-0.9106165, 0.4159549, -1.283829, 0.8941177, 1, 0, 1,
-0.9042425, -0.01201263, -1.92842, 0.8901961, 1, 0, 1,
-0.9038381, -0.3258473, -2.570052, 0.8823529, 1, 0, 1,
-0.8995056, -0.383592, -1.364995, 0.8784314, 1, 0, 1,
-0.892088, -1.616974, -4.226473, 0.8705882, 1, 0, 1,
-0.8867999, -0.004110153, -0.8569556, 0.8666667, 1, 0, 1,
-0.8834957, 0.7560456, 0.1465016, 0.8588235, 1, 0, 1,
-0.8826234, 1.203047, 2.635005, 0.854902, 1, 0, 1,
-0.8727458, 0.7206454, -0.8902769, 0.8470588, 1, 0, 1,
-0.8724204, -0.1205575, -0.104093, 0.8431373, 1, 0, 1,
-0.8714421, -1.8902, -4.037018, 0.8352941, 1, 0, 1,
-0.8682398, -0.3546563, -2.102154, 0.8313726, 1, 0, 1,
-0.860815, -0.3519034, -0.4870395, 0.8235294, 1, 0, 1,
-0.8579719, -0.4672391, -2.674745, 0.8196079, 1, 0, 1,
-0.8565871, -1.462697, -1.442325, 0.8117647, 1, 0, 1,
-0.852838, 1.244865, -0.2978849, 0.8078431, 1, 0, 1,
-0.8518528, -0.4754403, -2.603808, 0.8, 1, 0, 1,
-0.851334, -1.061857, -3.352165, 0.7921569, 1, 0, 1,
-0.8505644, -0.03336981, -1.389382, 0.7882353, 1, 0, 1,
-0.8439808, 1.412953, 1.366033, 0.7803922, 1, 0, 1,
-0.8385445, 0.5087485, -0.2909528, 0.7764706, 1, 0, 1,
-0.8346035, -0.1814317, -1.263436, 0.7686275, 1, 0, 1,
-0.8340591, -1.389692, -2.834229, 0.7647059, 1, 0, 1,
-0.8154564, 0.6918337, 0.0838055, 0.7568628, 1, 0, 1,
-0.8135155, 0.1585244, -2.525382, 0.7529412, 1, 0, 1,
-0.8134962, 0.300447, -1.79195, 0.7450981, 1, 0, 1,
-0.8123763, -1.554383, -3.903755, 0.7411765, 1, 0, 1,
-0.8114725, -1.815755, -2.183161, 0.7333333, 1, 0, 1,
-0.8105267, 0.3384282, -0.0185826, 0.7294118, 1, 0, 1,
-0.8090059, 0.4979169, -1.389005, 0.7215686, 1, 0, 1,
-0.8018684, -0.6685727, -3.172118, 0.7176471, 1, 0, 1,
-0.795171, 0.1915933, -1.936222, 0.7098039, 1, 0, 1,
-0.7893336, -1.192844, -2.866587, 0.7058824, 1, 0, 1,
-0.787989, -2.499558, -1.888433, 0.6980392, 1, 0, 1,
-0.7798481, -0.7130914, -2.630701, 0.6901961, 1, 0, 1,
-0.7728736, -0.6353399, -2.139807, 0.6862745, 1, 0, 1,
-0.7706527, 1.092359, -0.7567638, 0.6784314, 1, 0, 1,
-0.7697639, -1.556473, -3.24684, 0.6745098, 1, 0, 1,
-0.764914, -0.08885187, -1.276465, 0.6666667, 1, 0, 1,
-0.7548901, 1.069092, 0.1725162, 0.6627451, 1, 0, 1,
-0.7497233, -0.3022844, -3.095997, 0.654902, 1, 0, 1,
-0.7444369, -0.8545218, -3.297727, 0.6509804, 1, 0, 1,
-0.7410128, -1.028947, -2.943849, 0.6431373, 1, 0, 1,
-0.7386053, 0.3032505, -0.2287171, 0.6392157, 1, 0, 1,
-0.7377775, 0.01780088, -0.7564204, 0.6313726, 1, 0, 1,
-0.7356335, -0.7456295, -3.825136, 0.627451, 1, 0, 1,
-0.7338508, 0.7381103, 0.3932094, 0.6196079, 1, 0, 1,
-0.7310434, -0.4637741, -2.157804, 0.6156863, 1, 0, 1,
-0.7282529, 0.1860868, -0.7926537, 0.6078432, 1, 0, 1,
-0.7270199, 0.8823539, 0.1045969, 0.6039216, 1, 0, 1,
-0.7205415, 0.7291777, -1.530512, 0.5960785, 1, 0, 1,
-0.7205129, 3.207217, -1.957619, 0.5882353, 1, 0, 1,
-0.720299, 0.5949321, -0.2140954, 0.5843138, 1, 0, 1,
-0.7178187, 0.7191556, -0.549107, 0.5764706, 1, 0, 1,
-0.7137434, 0.07392034, -0.5167798, 0.572549, 1, 0, 1,
-0.7106642, -0.1519488, -2.132581, 0.5647059, 1, 0, 1,
-0.7105924, 2.335042, -1.182089, 0.5607843, 1, 0, 1,
-0.710277, 0.3103372, -2.214909, 0.5529412, 1, 0, 1,
-0.7056168, -1.115159, -2.7424, 0.5490196, 1, 0, 1,
-0.6948302, 0.1177347, -2.722764, 0.5411765, 1, 0, 1,
-0.6939281, -1.144231, -2.069594, 0.5372549, 1, 0, 1,
-0.6909288, -1.159251, -3.593825, 0.5294118, 1, 0, 1,
-0.6890333, 1.604286, 0.9072171, 0.5254902, 1, 0, 1,
-0.6871359, 0.3844542, -0.2820383, 0.5176471, 1, 0, 1,
-0.6865215, -2.344851, -3.150516, 0.5137255, 1, 0, 1,
-0.6819956, -1.906062, -3.233591, 0.5058824, 1, 0, 1,
-0.6696505, 0.5806216, -2.519185, 0.5019608, 1, 0, 1,
-0.6677999, 0.02317734, -3.150129, 0.4941176, 1, 0, 1,
-0.6636584, -0.4090635, -1.596599, 0.4862745, 1, 0, 1,
-0.660414, 0.7883259, -0.2330054, 0.4823529, 1, 0, 1,
-0.6601217, -0.5654969, -3.091419, 0.4745098, 1, 0, 1,
-0.6578255, 1.314258, -0.991372, 0.4705882, 1, 0, 1,
-0.656572, 2.088157, -2.151728, 0.4627451, 1, 0, 1,
-0.6555479, -0.675898, -1.159474, 0.4588235, 1, 0, 1,
-0.6487347, -0.5585473, -1.955616, 0.4509804, 1, 0, 1,
-0.6448565, 0.1909208, -2.183859, 0.4470588, 1, 0, 1,
-0.6431652, 0.1341592, -1.564005, 0.4392157, 1, 0, 1,
-0.6430084, 1.226113, -0.9098403, 0.4352941, 1, 0, 1,
-0.6391835, -0.9623027, -2.609006, 0.427451, 1, 0, 1,
-0.6324601, 0.02766852, -1.686551, 0.4235294, 1, 0, 1,
-0.6092943, -0.1506024, -0.9935096, 0.4156863, 1, 0, 1,
-0.6090615, -1.174052, -2.904537, 0.4117647, 1, 0, 1,
-0.6077211, 0.2534157, -1.640937, 0.4039216, 1, 0, 1,
-0.6069067, -1.906334, -4.082185, 0.3960784, 1, 0, 1,
-0.6053193, 0.3730424, -0.6199605, 0.3921569, 1, 0, 1,
-0.6017197, -0.8686104, -2.450143, 0.3843137, 1, 0, 1,
-0.5994958, -0.495782, -2.023375, 0.3803922, 1, 0, 1,
-0.5980794, 0.1572902, 0.06559397, 0.372549, 1, 0, 1,
-0.59712, 0.1536993, -0.8978204, 0.3686275, 1, 0, 1,
-0.5966704, -0.5195572, -0.9614584, 0.3607843, 1, 0, 1,
-0.5935299, 1.034987, 0.1409049, 0.3568628, 1, 0, 1,
-0.593003, -1.154705, -2.595258, 0.3490196, 1, 0, 1,
-0.5869851, 1.078665, -0.911907, 0.345098, 1, 0, 1,
-0.5819625, 0.7823563, -1.747432, 0.3372549, 1, 0, 1,
-0.5808507, 1.201486, -1.95425, 0.3333333, 1, 0, 1,
-0.5804034, 0.530915, -1.601551, 0.3254902, 1, 0, 1,
-0.5771326, 0.3429672, -0.3206667, 0.3215686, 1, 0, 1,
-0.5630426, -0.02621097, -1.414867, 0.3137255, 1, 0, 1,
-0.5546949, -0.07109937, -3.147909, 0.3098039, 1, 0, 1,
-0.5513811, 0.8288636, -0.3672515, 0.3019608, 1, 0, 1,
-0.5502999, 1.447175, -0.7300132, 0.2941177, 1, 0, 1,
-0.5499629, 1.091178, -0.9763088, 0.2901961, 1, 0, 1,
-0.5466431, -1.555592, -3.558164, 0.282353, 1, 0, 1,
-0.5457074, -0.1536044, -1.301228, 0.2784314, 1, 0, 1,
-0.5436721, -0.6575255, -4.394545, 0.2705882, 1, 0, 1,
-0.5434901, -0.5192876, -2.517815, 0.2666667, 1, 0, 1,
-0.5427602, 0.9030243, -1.095975, 0.2588235, 1, 0, 1,
-0.542729, 1.956694, -1.459432, 0.254902, 1, 0, 1,
-0.5424338, 0.1504778, -1.9773, 0.2470588, 1, 0, 1,
-0.5408066, 0.5757281, -1.098941, 0.2431373, 1, 0, 1,
-0.5334761, -0.1132562, -2.505915, 0.2352941, 1, 0, 1,
-0.5275199, -2.40524, -3.48131, 0.2313726, 1, 0, 1,
-0.5273507, -0.5349506, -3.867217, 0.2235294, 1, 0, 1,
-0.5251562, -2.477068, -1.812529, 0.2196078, 1, 0, 1,
-0.5228704, 0.8475429, -1.968393, 0.2117647, 1, 0, 1,
-0.5218741, 0.2980475, -0.788129, 0.2078431, 1, 0, 1,
-0.5211547, -0.01989697, -0.7529302, 0.2, 1, 0, 1,
-0.5208023, 1.906265, -0.6459851, 0.1921569, 1, 0, 1,
-0.5190056, -1.950546, -3.554411, 0.1882353, 1, 0, 1,
-0.5166302, -1.158735, -3.459929, 0.1803922, 1, 0, 1,
-0.5026703, -1.090068, -2.010247, 0.1764706, 1, 0, 1,
-0.5023732, -0.9609811, -3.662543, 0.1686275, 1, 0, 1,
-0.4983324, -0.6505491, -1.199051, 0.1647059, 1, 0, 1,
-0.4977419, 0.1970832, -1.584239, 0.1568628, 1, 0, 1,
-0.4952616, -0.8118426, -1.565851, 0.1529412, 1, 0, 1,
-0.4917473, -1.226575, -5.161981, 0.145098, 1, 0, 1,
-0.4894735, 0.2859254, 0.160284, 0.1411765, 1, 0, 1,
-0.4888435, 0.4654287, 0.1085724, 0.1333333, 1, 0, 1,
-0.4884804, -0.1753306, -1.877876, 0.1294118, 1, 0, 1,
-0.4813641, 1.687526, -0.9932475, 0.1215686, 1, 0, 1,
-0.4810909, 1.176765, -1.19643, 0.1176471, 1, 0, 1,
-0.4796455, -0.05678169, -1.957124, 0.1098039, 1, 0, 1,
-0.4743488, 1.684438, -0.3371902, 0.1058824, 1, 0, 1,
-0.4719535, -0.4579967, -2.920208, 0.09803922, 1, 0, 1,
-0.4719056, 0.4994733, -0.8401894, 0.09019608, 1, 0, 1,
-0.4706744, -1.370092, -3.275629, 0.08627451, 1, 0, 1,
-0.4660804, 1.348501, -0.163024, 0.07843138, 1, 0, 1,
-0.4610302, -0.523529, -0.199669, 0.07450981, 1, 0, 1,
-0.4560355, -1.354789, -3.336735, 0.06666667, 1, 0, 1,
-0.4549217, 1.569077, -0.488818, 0.0627451, 1, 0, 1,
-0.4544045, -0.527504, -2.538527, 0.05490196, 1, 0, 1,
-0.4481867, -0.2775673, -3.232049, 0.05098039, 1, 0, 1,
-0.4453713, -0.8052227, -0.5284785, 0.04313726, 1, 0, 1,
-0.4415871, 0.9616649, -1.091325, 0.03921569, 1, 0, 1,
-0.4336553, 1.701757, 0.05393701, 0.03137255, 1, 0, 1,
-0.4296773, 1.068133, 1.503586, 0.02745098, 1, 0, 1,
-0.4292792, 0.3944905, -0.3547572, 0.01960784, 1, 0, 1,
-0.4289834, -0.1388361, 0.5046316, 0.01568628, 1, 0, 1,
-0.426766, -0.1769246, -3.672773, 0.007843138, 1, 0, 1,
-0.4218083, 0.5126557, -0.08575865, 0.003921569, 1, 0, 1,
-0.419257, -2.588321, -2.241817, 0, 1, 0.003921569, 1,
-0.41878, -0.1840501, -2.496731, 0, 1, 0.01176471, 1,
-0.4140978, -1.916348, -2.93435, 0, 1, 0.01568628, 1,
-0.4092222, -0.9423675, -3.115464, 0, 1, 0.02352941, 1,
-0.4066606, -0.6797878, -2.479125, 0, 1, 0.02745098, 1,
-0.4058605, 0.4915029, -0.4424327, 0, 1, 0.03529412, 1,
-0.4053579, -0.5436458, -2.816052, 0, 1, 0.03921569, 1,
-0.4016304, -0.1838203, -1.290354, 0, 1, 0.04705882, 1,
-0.3999683, 1.282812, -2.019386, 0, 1, 0.05098039, 1,
-0.3951165, 1.929042, 0.6699657, 0, 1, 0.05882353, 1,
-0.3942131, 0.5137087, 0.9070013, 0, 1, 0.0627451, 1,
-0.3941087, -0.07770752, -3.131101, 0, 1, 0.07058824, 1,
-0.3883566, 1.134573, -1.500019, 0, 1, 0.07450981, 1,
-0.3870987, -0.4814553, -2.546774, 0, 1, 0.08235294, 1,
-0.3852019, -0.02829918, -1.252413, 0, 1, 0.08627451, 1,
-0.3736337, 0.7670392, -0.01754684, 0, 1, 0.09411765, 1,
-0.3712465, -0.2476742, -2.446661, 0, 1, 0.1019608, 1,
-0.3696439, 0.7217481, -0.1146278, 0, 1, 0.1058824, 1,
-0.3685812, -1.271309, -1.691234, 0, 1, 0.1137255, 1,
-0.3673598, 0.6917167, -1.240354, 0, 1, 0.1176471, 1,
-0.3656676, -0.9056281, -3.427871, 0, 1, 0.1254902, 1,
-0.3612744, -0.1929539, -2.556079, 0, 1, 0.1294118, 1,
-0.3611055, -0.709896, -3.117834, 0, 1, 0.1372549, 1,
-0.3600609, 1.583732, 0.3080193, 0, 1, 0.1411765, 1,
-0.3571423, -1.888121, -3.09138, 0, 1, 0.1490196, 1,
-0.3544277, -1.222176, -1.246754, 0, 1, 0.1529412, 1,
-0.3529406, 0.3978167, -0.8849389, 0, 1, 0.1607843, 1,
-0.3527256, 1.032331, -0.4179839, 0, 1, 0.1647059, 1,
-0.3519558, 1.080007, 0.3814701, 0, 1, 0.172549, 1,
-0.3516481, -0.005193747, -0.8856824, 0, 1, 0.1764706, 1,
-0.3448996, 0.9101887, -0.3180428, 0, 1, 0.1843137, 1,
-0.3447272, 0.9516476, 0.3927465, 0, 1, 0.1882353, 1,
-0.3438398, -0.5892815, -2.873152, 0, 1, 0.1960784, 1,
-0.3434417, -0.4166745, -1.700482, 0, 1, 0.2039216, 1,
-0.3424149, -0.4981465, -1.04505, 0, 1, 0.2078431, 1,
-0.3362473, 0.03706378, -1.121312, 0, 1, 0.2156863, 1,
-0.335362, -0.8750882, -3.81716, 0, 1, 0.2196078, 1,
-0.3352857, 1.908995, -1.086171, 0, 1, 0.227451, 1,
-0.3337905, 0.07011077, -3.476728, 0, 1, 0.2313726, 1,
-0.3336754, 0.8165238, -0.9661915, 0, 1, 0.2392157, 1,
-0.3313575, 0.08368786, -0.2979681, 0, 1, 0.2431373, 1,
-0.3208687, 1.724804, -2.401997, 0, 1, 0.2509804, 1,
-0.313959, -0.04079368, -0.981058, 0, 1, 0.254902, 1,
-0.3137235, 0.9894035, 0.08882552, 0, 1, 0.2627451, 1,
-0.3115947, 0.6914041, -0.1134461, 0, 1, 0.2666667, 1,
-0.3076389, 0.05052036, -3.491883, 0, 1, 0.2745098, 1,
-0.3063265, 0.08123551, -0.4880503, 0, 1, 0.2784314, 1,
-0.3027855, -0.4174605, -2.667362, 0, 1, 0.2862745, 1,
-0.302551, 1.139438, -0.2854633, 0, 1, 0.2901961, 1,
-0.3014347, -0.1762408, -3.213609, 0, 1, 0.2980392, 1,
-0.3012106, -1.497367, -1.588808, 0, 1, 0.3058824, 1,
-0.2959146, 0.2248552, -1.627395, 0, 1, 0.3098039, 1,
-0.2950943, 2.042431, -0.4784555, 0, 1, 0.3176471, 1,
-0.2888811, 0.9756759, -0.7572811, 0, 1, 0.3215686, 1,
-0.2884728, 2.265038, -0.2420835, 0, 1, 0.3294118, 1,
-0.2877039, 1.672544, -2.290631, 0, 1, 0.3333333, 1,
-0.2862605, -0.6795485, -1.895995, 0, 1, 0.3411765, 1,
-0.2853889, 0.3703391, 0.408981, 0, 1, 0.345098, 1,
-0.2827482, 0.4259991, -1.143209, 0, 1, 0.3529412, 1,
-0.2819571, -0.102532, -2.658455, 0, 1, 0.3568628, 1,
-0.2784655, -0.4061093, -2.642889, 0, 1, 0.3647059, 1,
-0.2784158, -0.09888937, -1.564581, 0, 1, 0.3686275, 1,
-0.2767373, -0.1474501, -1.285491, 0, 1, 0.3764706, 1,
-0.2744343, 0.0201009, -0.5741647, 0, 1, 0.3803922, 1,
-0.274204, 0.3246671, -2.78521, 0, 1, 0.3882353, 1,
-0.2703865, -0.9879988, -3.049719, 0, 1, 0.3921569, 1,
-0.2700758, -1.058813, -2.998622, 0, 1, 0.4, 1,
-0.2688513, 1.679238, -1.110064, 0, 1, 0.4078431, 1,
-0.2673727, 0.3565308, 0.4087206, 0, 1, 0.4117647, 1,
-0.2664968, 0.5837533, -0.7109263, 0, 1, 0.4196078, 1,
-0.264835, 0.5441009, 0.1357311, 0, 1, 0.4235294, 1,
-0.2646394, -0.4370119, -1.791686, 0, 1, 0.4313726, 1,
-0.2640177, -0.976297, -4.369719, 0, 1, 0.4352941, 1,
-0.2628587, 1.12485, 1.326572, 0, 1, 0.4431373, 1,
-0.2626335, -1.654684, -0.06617292, 0, 1, 0.4470588, 1,
-0.2626166, -0.4566321, -3.829182, 0, 1, 0.454902, 1,
-0.2575542, 0.4353454, -0.8526052, 0, 1, 0.4588235, 1,
-0.2574538, -1.0544, -2.841062, 0, 1, 0.4666667, 1,
-0.2529253, -0.7058411, -2.570955, 0, 1, 0.4705882, 1,
-0.2494028, -0.2096704, -3.799761, 0, 1, 0.4784314, 1,
-0.2477778, 0.2390912, -1.809429, 0, 1, 0.4823529, 1,
-0.2476781, 0.1035844, -0.6839004, 0, 1, 0.4901961, 1,
-0.2458391, -0.2445599, -1.99148, 0, 1, 0.4941176, 1,
-0.2445526, 0.1921546, -0.9540437, 0, 1, 0.5019608, 1,
-0.2437824, -0.01483883, -1.294177, 0, 1, 0.509804, 1,
-0.2437185, -1.258292, -2.814099, 0, 1, 0.5137255, 1,
-0.2413963, -1.641277, -3.979534, 0, 1, 0.5215687, 1,
-0.2395706, 0.1212409, -0.07808853, 0, 1, 0.5254902, 1,
-0.2386763, 1.375443, 0.971047, 0, 1, 0.5333334, 1,
-0.2384664, -2.985624, -3.103597, 0, 1, 0.5372549, 1,
-0.2355155, -0.5280578, -3.549762, 0, 1, 0.5450981, 1,
-0.2339531, -0.4332058, -2.267428, 0, 1, 0.5490196, 1,
-0.2323856, -0.5852075, -2.581021, 0, 1, 0.5568628, 1,
-0.2253613, -0.5372282, -3.493893, 0, 1, 0.5607843, 1,
-0.2227667, -0.01478242, -2.824461, 0, 1, 0.5686275, 1,
-0.2225823, -1.049744, -3.80582, 0, 1, 0.572549, 1,
-0.2212537, -0.3706647, -1.930927, 0, 1, 0.5803922, 1,
-0.2204565, -1.024045, -2.676871, 0, 1, 0.5843138, 1,
-0.2168522, 0.1422383, -1.223747, 0, 1, 0.5921569, 1,
-0.2088052, 0.4999763, 0.9216897, 0, 1, 0.5960785, 1,
-0.2065927, 0.4031663, -0.6838371, 0, 1, 0.6039216, 1,
-0.2063698, 1.111203, 1.012623, 0, 1, 0.6117647, 1,
-0.2023285, 0.1090173, 1.058404, 0, 1, 0.6156863, 1,
-0.200064, -0.75528, -4.545771, 0, 1, 0.6235294, 1,
-0.1997028, 0.02476843, -1.62062, 0, 1, 0.627451, 1,
-0.1991705, -1.179892, -3.178812, 0, 1, 0.6352941, 1,
-0.1981283, -1.459922, -2.655262, 0, 1, 0.6392157, 1,
-0.1875813, -0.1724062, -2.07267, 0, 1, 0.6470588, 1,
-0.1870238, 0.01040357, -1.324099, 0, 1, 0.6509804, 1,
-0.1855552, -0.1615348, -0.8537554, 0, 1, 0.6588235, 1,
-0.1840404, -0.4500588, -3.26231, 0, 1, 0.6627451, 1,
-0.1830204, 1.394528, 0.8794582, 0, 1, 0.6705883, 1,
-0.1810178, 0.6070523, 0.05204394, 0, 1, 0.6745098, 1,
-0.1761955, -0.4166889, -1.809193, 0, 1, 0.682353, 1,
-0.1729096, -0.2083091, -1.68356, 0, 1, 0.6862745, 1,
-0.1694521, -1.763626, -4.012568, 0, 1, 0.6941177, 1,
-0.1689089, -0.6134025, -2.583317, 0, 1, 0.7019608, 1,
-0.1679605, -0.7460666, -4.000069, 0, 1, 0.7058824, 1,
-0.1567214, 0.1333735, -1.507367, 0, 1, 0.7137255, 1,
-0.1526947, -0.6080338, -2.757978, 0, 1, 0.7176471, 1,
-0.1451185, -0.9118659, -2.142998, 0, 1, 0.7254902, 1,
-0.1407457, -1.601909, -2.887079, 0, 1, 0.7294118, 1,
-0.1381951, 1.076185, -0.1006361, 0, 1, 0.7372549, 1,
-0.1331711, 0.8149893, 0.6553068, 0, 1, 0.7411765, 1,
-0.1322283, 0.08257503, -0.6287697, 0, 1, 0.7490196, 1,
-0.1316373, 0.5794857, -0.4536977, 0, 1, 0.7529412, 1,
-0.1283033, -0.0568542, -0.9503324, 0, 1, 0.7607843, 1,
-0.1191234, 1.836475, -0.4289879, 0, 1, 0.7647059, 1,
-0.1173112, -2.676195, -3.800165, 0, 1, 0.772549, 1,
-0.1159903, -0.2147947, -1.70727, 0, 1, 0.7764706, 1,
-0.1124697, 0.7350624, -0.5395176, 0, 1, 0.7843137, 1,
-0.1054305, -0.2867849, -1.933679, 0, 1, 0.7882353, 1,
-0.09881607, -0.8947266, -4.536629, 0, 1, 0.7960784, 1,
-0.09484471, 1.243429, 1.748777, 0, 1, 0.8039216, 1,
-0.09465264, -1.2256, -3.020149, 0, 1, 0.8078431, 1,
-0.09064042, 0.8414981, -0.3919082, 0, 1, 0.8156863, 1,
-0.08703135, 1.00095, -1.11672, 0, 1, 0.8196079, 1,
-0.08564521, 1.694642, -0.8331401, 0, 1, 0.827451, 1,
-0.08384495, -0.856035, -4.921171, 0, 1, 0.8313726, 1,
-0.08216245, -1.811621, -5.688889, 0, 1, 0.8392157, 1,
-0.08017796, 0.009801649, 0.2466878, 0, 1, 0.8431373, 1,
-0.07989439, -0.4596566, -3.528658, 0, 1, 0.8509804, 1,
-0.0763189, -1.858354, -3.725591, 0, 1, 0.854902, 1,
-0.07401107, -0.3453705, -2.979575, 0, 1, 0.8627451, 1,
-0.07148905, -0.3702632, -3.77515, 0, 1, 0.8666667, 1,
-0.06720717, 0.6008997, 2.036201, 0, 1, 0.8745098, 1,
-0.06541188, 1.09335, -1.27074, 0, 1, 0.8784314, 1,
-0.0622034, 0.9528264, 0.3670336, 0, 1, 0.8862745, 1,
-0.06101327, 1.226169, -0.656936, 0, 1, 0.8901961, 1,
-0.06088648, -0.3566679, -3.269538, 0, 1, 0.8980392, 1,
-0.06083896, 1.011874, -0.2754523, 0, 1, 0.9058824, 1,
-0.05968855, 0.9242403, 0.5463749, 0, 1, 0.9098039, 1,
-0.0568791, -0.8558236, -2.828882, 0, 1, 0.9176471, 1,
-0.05175466, -0.2490954, -4.513925, 0, 1, 0.9215686, 1,
-0.05145752, 1.638835, 1.168296, 0, 1, 0.9294118, 1,
-0.025568, -0.0905762, -2.143816, 0, 1, 0.9333333, 1,
-0.02402905, -0.3221925, -3.437885, 0, 1, 0.9411765, 1,
-0.02160485, -0.8536028, -1.990606, 0, 1, 0.945098, 1,
-0.01932427, 0.5580222, -0.6943189, 0, 1, 0.9529412, 1,
-0.0179002, 1.27979, -0.1178378, 0, 1, 0.9568627, 1,
-0.01612961, 2.505299, -0.9864212, 0, 1, 0.9647059, 1,
-0.01076559, 0.1290849, 0.9137553, 0, 1, 0.9686275, 1,
-0.01017589, -1.879976, -1.984263, 0, 1, 0.9764706, 1,
-0.009295261, 0.3283855, -1.347079, 0, 1, 0.9803922, 1,
-0.006553986, -2.914242, -3.408906, 0, 1, 0.9882353, 1,
-0.006032368, -0.6439079, -1.622703, 0, 1, 0.9921569, 1,
-0.002888404, -2.118518, -4.015357, 0, 1, 1, 1,
0.003756825, 0.06489405, -1.340841, 0, 0.9921569, 1, 1,
0.00476601, 2.130056, 2.581343, 0, 0.9882353, 1, 1,
0.006863032, -0.2553761, 3.203084, 0, 0.9803922, 1, 1,
0.01316515, 0.1774584, -1.038972, 0, 0.9764706, 1, 1,
0.01596588, 0.2068322, -0.1700229, 0, 0.9686275, 1, 1,
0.01607437, -1.191541, 3.640749, 0, 0.9647059, 1, 1,
0.01675417, 1.021809, 1.685139, 0, 0.9568627, 1, 1,
0.01698272, -0.06010518, 3.423701, 0, 0.9529412, 1, 1,
0.01748518, 0.7675824, 0.8923206, 0, 0.945098, 1, 1,
0.01871256, 1.172056, -0.2534645, 0, 0.9411765, 1, 1,
0.01952094, -0.08645687, 3.073749, 0, 0.9333333, 1, 1,
0.01957852, -0.1801955, 2.322514, 0, 0.9294118, 1, 1,
0.02242753, 1.344681, -0.3137049, 0, 0.9215686, 1, 1,
0.02250668, -0.3796378, 3.771379, 0, 0.9176471, 1, 1,
0.02383746, 1.289792, 1.740468, 0, 0.9098039, 1, 1,
0.02519928, 0.8502182, 0.7450473, 0, 0.9058824, 1, 1,
0.02573495, 0.7308989, 2.849833, 0, 0.8980392, 1, 1,
0.02667889, -0.1370715, 2.690907, 0, 0.8901961, 1, 1,
0.02769561, -0.9505467, 2.521903, 0, 0.8862745, 1, 1,
0.0292869, -0.4941223, 0.7821772, 0, 0.8784314, 1, 1,
0.03523324, 1.059057, -0.5485151, 0, 0.8745098, 1, 1,
0.04118165, 1.896112, 1.014786, 0, 0.8666667, 1, 1,
0.0411818, 1.700768, -0.5758367, 0, 0.8627451, 1, 1,
0.04650416, -0.2442559, 5.030058, 0, 0.854902, 1, 1,
0.04868363, -1.705318, 4.378697, 0, 0.8509804, 1, 1,
0.04893816, 0.7136745, 0.3613364, 0, 0.8431373, 1, 1,
0.05447165, -0.5099645, 1.708467, 0, 0.8392157, 1, 1,
0.05822641, 1.242087, -0.8716682, 0, 0.8313726, 1, 1,
0.05960708, -0.3056924, 3.452126, 0, 0.827451, 1, 1,
0.0605981, -0.4340762, 3.33005, 0, 0.8196079, 1, 1,
0.06193215, -0.6625327, 2.165535, 0, 0.8156863, 1, 1,
0.06307144, 0.219765, -1.533364, 0, 0.8078431, 1, 1,
0.06327586, 2.056836, -0.2253693, 0, 0.8039216, 1, 1,
0.06384473, 0.6624712, 0.1139234, 0, 0.7960784, 1, 1,
0.06604257, 0.5383735, 1.888654, 0, 0.7882353, 1, 1,
0.06681086, 1.621992, 0.3361685, 0, 0.7843137, 1, 1,
0.0686919, -0.4566977, 2.340801, 0, 0.7764706, 1, 1,
0.07204976, -0.3862044, 3.738131, 0, 0.772549, 1, 1,
0.07486125, -0.8430201, 4.306828, 0, 0.7647059, 1, 1,
0.07761414, -0.5967393, 3.664461, 0, 0.7607843, 1, 1,
0.07775846, 0.1571378, -0.8124388, 0, 0.7529412, 1, 1,
0.0789128, -0.4808081, 4.424198, 0, 0.7490196, 1, 1,
0.07916699, 0.5973734, -0.04371418, 0, 0.7411765, 1, 1,
0.07966164, 0.01749805, 0.3222365, 0, 0.7372549, 1, 1,
0.09044489, 0.4197288, -0.8040736, 0, 0.7294118, 1, 1,
0.09491903, 1.055858, -1.013572, 0, 0.7254902, 1, 1,
0.1008587, 0.2334663, 0.9711459, 0, 0.7176471, 1, 1,
0.1025274, -0.9821095, 1.742854, 0, 0.7137255, 1, 1,
0.1055021, 1.252777, 0.7699761, 0, 0.7058824, 1, 1,
0.107236, 0.0991425, -1.627863, 0, 0.6980392, 1, 1,
0.1087348, 0.8399783, 0.8504497, 0, 0.6941177, 1, 1,
0.1105498, -0.3765204, 4.379236, 0, 0.6862745, 1, 1,
0.1113028, 1.129048, 0.4076521, 0, 0.682353, 1, 1,
0.1114485, -0.6910138, 2.896031, 0, 0.6745098, 1, 1,
0.1120721, 0.4890815, -1.292327, 0, 0.6705883, 1, 1,
0.1161074, -1.07028, 4.184651, 0, 0.6627451, 1, 1,
0.1192599, -0.08494211, 3.445765, 0, 0.6588235, 1, 1,
0.1193687, -1.216213, 2.895878, 0, 0.6509804, 1, 1,
0.1195414, -0.3257759, 3.625892, 0, 0.6470588, 1, 1,
0.1224569, 0.94113, 0.3156608, 0, 0.6392157, 1, 1,
0.1235166, 0.8628111, 0.4687139, 0, 0.6352941, 1, 1,
0.1247516, -0.2864655, 3.235792, 0, 0.627451, 1, 1,
0.1257072, 0.4136414, 1.684245, 0, 0.6235294, 1, 1,
0.1257592, 0.4182959, -0.2577233, 0, 0.6156863, 1, 1,
0.1382085, 1.204793, -0.2767441, 0, 0.6117647, 1, 1,
0.1382737, -0.5974306, 4.896124, 0, 0.6039216, 1, 1,
0.1431028, 1.342234, -0.7882475, 0, 0.5960785, 1, 1,
0.14577, 0.4521788, 0.2030151, 0, 0.5921569, 1, 1,
0.1458387, -0.6800493, 2.285356, 0, 0.5843138, 1, 1,
0.1488658, 0.06200087, 1.240278, 0, 0.5803922, 1, 1,
0.151389, 0.1370379, 2.886574, 0, 0.572549, 1, 1,
0.1533607, -0.7841965, 3.104704, 0, 0.5686275, 1, 1,
0.1538974, 0.09141427, 2.210939, 0, 0.5607843, 1, 1,
0.1549532, -1.143922, 2.76494, 0, 0.5568628, 1, 1,
0.1611185, 0.258762, -0.9661236, 0, 0.5490196, 1, 1,
0.1642948, 1.343103, -1.015837, 0, 0.5450981, 1, 1,
0.1652663, -1.751162, 3.73929, 0, 0.5372549, 1, 1,
0.1698919, 1.039152, 1.570823, 0, 0.5333334, 1, 1,
0.1859692, 1.476852, 0.3337483, 0, 0.5254902, 1, 1,
0.1867676, 1.835591, -0.1431609, 0, 0.5215687, 1, 1,
0.1891457, -0.1996328, 3.772399, 0, 0.5137255, 1, 1,
0.1906275, -0.3356416, 0.6362656, 0, 0.509804, 1, 1,
0.19167, 1.076425, 0.6922447, 0, 0.5019608, 1, 1,
0.1977501, -0.407346, 0.2518989, 0, 0.4941176, 1, 1,
0.2008044, 0.2643583, 0.4382472, 0, 0.4901961, 1, 1,
0.2013699, 0.2096617, 0.00813932, 0, 0.4823529, 1, 1,
0.2048996, 0.3621368, -0.1290297, 0, 0.4784314, 1, 1,
0.205994, 0.3364942, 2.231925, 0, 0.4705882, 1, 1,
0.2071626, -0.9184166, 3.47133, 0, 0.4666667, 1, 1,
0.208592, 1.623923, 1.388702, 0, 0.4588235, 1, 1,
0.211248, -0.5327992, 2.086172, 0, 0.454902, 1, 1,
0.2113374, 0.394645, 0.4573771, 0, 0.4470588, 1, 1,
0.2141307, 0.4290779, -0.1375637, 0, 0.4431373, 1, 1,
0.217686, -0.5848032, 1.881312, 0, 0.4352941, 1, 1,
0.2229904, 0.9235824, 1.305785, 0, 0.4313726, 1, 1,
0.2233216, -2.06319, 1.463518, 0, 0.4235294, 1, 1,
0.2250686, -0.4339584, 2.412601, 0, 0.4196078, 1, 1,
0.2258656, -0.7855412, 4.819962, 0, 0.4117647, 1, 1,
0.2334073, -0.6651455, 1.765548, 0, 0.4078431, 1, 1,
0.2350612, -0.1835005, 2.405853, 0, 0.4, 1, 1,
0.2448839, 0.6015827, 0.8332032, 0, 0.3921569, 1, 1,
0.2506931, 1.59396, -1.072167, 0, 0.3882353, 1, 1,
0.2544229, 1.658191, -0.741105, 0, 0.3803922, 1, 1,
0.2603948, 0.4760474, 0.8598157, 0, 0.3764706, 1, 1,
0.2638389, -0.09642309, 2.553418, 0, 0.3686275, 1, 1,
0.2639152, 1.111119, 0.866152, 0, 0.3647059, 1, 1,
0.2644542, 0.7488825, 1.441746, 0, 0.3568628, 1, 1,
0.2713035, 0.1610703, 0.2132854, 0, 0.3529412, 1, 1,
0.2729568, -0.8938668, 3.417792, 0, 0.345098, 1, 1,
0.2744349, -1.212713, 0.2831461, 0, 0.3411765, 1, 1,
0.2746827, 1.758589, 0.9871065, 0, 0.3333333, 1, 1,
0.2785678, 0.06776841, 1.269051, 0, 0.3294118, 1, 1,
0.2818564, 1.286409, 0.7520753, 0, 0.3215686, 1, 1,
0.2820656, -0.6305452, 3.16837, 0, 0.3176471, 1, 1,
0.2822347, 0.6532153, 0.7179554, 0, 0.3098039, 1, 1,
0.2862221, 0.1704229, 0.8497998, 0, 0.3058824, 1, 1,
0.2886495, 0.1154626, 0.8328973, 0, 0.2980392, 1, 1,
0.2948039, -2.366921, 3.177164, 0, 0.2901961, 1, 1,
0.2959704, 0.8895817, 0.6163414, 0, 0.2862745, 1, 1,
0.2970812, -0.607422, 2.757662, 0, 0.2784314, 1, 1,
0.2975369, 1.21836, 0.2735421, 0, 0.2745098, 1, 1,
0.3059295, 0.569892, 0.9403325, 0, 0.2666667, 1, 1,
0.3071714, -1.543556, 3.112563, 0, 0.2627451, 1, 1,
0.3125553, 0.0757045, 0.4825801, 0, 0.254902, 1, 1,
0.3144937, 1.285917, -1.064531, 0, 0.2509804, 1, 1,
0.3161153, 1.085362, -1.648316, 0, 0.2431373, 1, 1,
0.3216116, 0.1662478, 2.544147, 0, 0.2392157, 1, 1,
0.3241761, 0.1556156, -0.5908647, 0, 0.2313726, 1, 1,
0.3342668, -0.8279005, 1.947407, 0, 0.227451, 1, 1,
0.3343371, 0.02022982, 2.320392, 0, 0.2196078, 1, 1,
0.3359123, 1.003086, -0.5959435, 0, 0.2156863, 1, 1,
0.3370723, -0.2720046, 2.362918, 0, 0.2078431, 1, 1,
0.3413037, 0.1284166, 0.8463551, 0, 0.2039216, 1, 1,
0.3418957, -0.6405414, 2.271595, 0, 0.1960784, 1, 1,
0.3421394, 0.2662555, 2.257325, 0, 0.1882353, 1, 1,
0.3471355, -0.7783158, 0.841895, 0, 0.1843137, 1, 1,
0.3521024, 0.1778653, -1.424146, 0, 0.1764706, 1, 1,
0.3568531, -1.60081, 3.144226, 0, 0.172549, 1, 1,
0.3571736, 2.670358, -1.143577, 0, 0.1647059, 1, 1,
0.3578675, -0.4257923, 2.323637, 0, 0.1607843, 1, 1,
0.3639701, 0.6947826, 1.113752, 0, 0.1529412, 1, 1,
0.3652191, -0.856398, 2.470172, 0, 0.1490196, 1, 1,
0.3659807, -1.408944, 2.533753, 0, 0.1411765, 1, 1,
0.3684348, -1.285099, 2.183918, 0, 0.1372549, 1, 1,
0.371359, -0.01388337, 4.173527, 0, 0.1294118, 1, 1,
0.3729786, 3.338414, -0.3399182, 0, 0.1254902, 1, 1,
0.3737617, -2.061407, 3.839464, 0, 0.1176471, 1, 1,
0.3739396, 0.5815906, 1.108413, 0, 0.1137255, 1, 1,
0.3765847, -1.035786, 1.783868, 0, 0.1058824, 1, 1,
0.3777649, -0.5342405, 3.51134, 0, 0.09803922, 1, 1,
0.3780493, -0.9126917, 3.651564, 0, 0.09411765, 1, 1,
0.3782668, -0.285119, 1.890986, 0, 0.08627451, 1, 1,
0.3810849, 1.250909, 0.583272, 0, 0.08235294, 1, 1,
0.3820829, -1.666446, 3.094277, 0, 0.07450981, 1, 1,
0.3827842, -0.805679, 0.9887785, 0, 0.07058824, 1, 1,
0.3853487, -0.8700983, 2.803135, 0, 0.0627451, 1, 1,
0.3854374, -0.9871292, 1.357824, 0, 0.05882353, 1, 1,
0.3981183, -1.583117, 2.469389, 0, 0.05098039, 1, 1,
0.3989136, 1.426757, 0.1471471, 0, 0.04705882, 1, 1,
0.4060179, 0.6092055, 0.2811182, 0, 0.03921569, 1, 1,
0.4064085, 0.2902521, 1.602944, 0, 0.03529412, 1, 1,
0.4083946, -0.1867281, 1.754749, 0, 0.02745098, 1, 1,
0.4160969, 1.411493, -0.1676575, 0, 0.02352941, 1, 1,
0.4169527, -0.5886569, 1.354681, 0, 0.01568628, 1, 1,
0.4177256, -1.344117, 1.644728, 0, 0.01176471, 1, 1,
0.4183722, -0.4003603, 0.7464443, 0, 0.003921569, 1, 1,
0.4190642, -0.3767445, 2.759323, 0.003921569, 0, 1, 1,
0.4211003, 0.07388316, 1.530565, 0.007843138, 0, 1, 1,
0.4216194, -0.03776318, 3.047225, 0.01568628, 0, 1, 1,
0.4254969, 1.270947, 0.4006263, 0.01960784, 0, 1, 1,
0.4315467, 0.216342, 1.765824, 0.02745098, 0, 1, 1,
0.4465348, -0.6971211, 1.65281, 0.03137255, 0, 1, 1,
0.452246, -1.075125, 2.498124, 0.03921569, 0, 1, 1,
0.4525636, 0.1560278, 1.919208, 0.04313726, 0, 1, 1,
0.4560432, 1.175768, 0.06653318, 0.05098039, 0, 1, 1,
0.4611959, -1.204723, 1.545729, 0.05490196, 0, 1, 1,
0.4624842, 0.2107563, 0.7389432, 0.0627451, 0, 1, 1,
0.4667044, 0.3111944, 1.976735, 0.06666667, 0, 1, 1,
0.4681462, -2.646157, 3.538808, 0.07450981, 0, 1, 1,
0.4733624, -0.5381335, 1.499684, 0.07843138, 0, 1, 1,
0.4797864, -1.481684, 3.079112, 0.08627451, 0, 1, 1,
0.4816329, -0.9945702, 3.116886, 0.09019608, 0, 1, 1,
0.484091, 0.6429917, 0.8384699, 0.09803922, 0, 1, 1,
0.4861942, -0.3953269, 1.706367, 0.1058824, 0, 1, 1,
0.4866751, 1.07862, 1.679204, 0.1098039, 0, 1, 1,
0.4903554, 0.9624654, -0.7080387, 0.1176471, 0, 1, 1,
0.4903688, -0.3365848, 1.702788, 0.1215686, 0, 1, 1,
0.5024733, -0.5845278, 2.477081, 0.1294118, 0, 1, 1,
0.505387, 2.201924, -0.1888951, 0.1333333, 0, 1, 1,
0.5063548, -0.3340392, 0.353805, 0.1411765, 0, 1, 1,
0.5063635, 1.986827, 1.877697, 0.145098, 0, 1, 1,
0.5108348, -0.2768659, -0.3712193, 0.1529412, 0, 1, 1,
0.5196766, 0.8660043, -0.7476614, 0.1568628, 0, 1, 1,
0.5233539, 0.1832711, -1.027151, 0.1647059, 0, 1, 1,
0.5274867, -0.8972976, 3.643805, 0.1686275, 0, 1, 1,
0.5297134, -0.6478431, 3.067951, 0.1764706, 0, 1, 1,
0.5358059, 0.5583366, 0.7917692, 0.1803922, 0, 1, 1,
0.5373772, 0.2749072, -1.375292, 0.1882353, 0, 1, 1,
0.5429918, -1.061872, 1.176975, 0.1921569, 0, 1, 1,
0.545074, -1.659309, 1.45557, 0.2, 0, 1, 1,
0.5506595, -0.7561677, 3.267123, 0.2078431, 0, 1, 1,
0.5518899, 1.572444, 2.002251, 0.2117647, 0, 1, 1,
0.5520303, -0.7765347, 2.781986, 0.2196078, 0, 1, 1,
0.5559129, 0.6104571, -0.1419627, 0.2235294, 0, 1, 1,
0.5603413, 1.284265, 0.1753782, 0.2313726, 0, 1, 1,
0.5622534, 0.1187368, 0.9119008, 0.2352941, 0, 1, 1,
0.5650673, 0.126168, 1.447911, 0.2431373, 0, 1, 1,
0.5665561, -0.06605183, 1.967239, 0.2470588, 0, 1, 1,
0.5666447, 1.355795, 0.5575276, 0.254902, 0, 1, 1,
0.5681623, 1.068125, 1.276587, 0.2588235, 0, 1, 1,
0.5716032, -0.4699389, 3.555288, 0.2666667, 0, 1, 1,
0.5763936, -0.1023408, 2.568377, 0.2705882, 0, 1, 1,
0.5836477, 1.930211, 1.374639, 0.2784314, 0, 1, 1,
0.5850371, 0.1275465, 1.071514, 0.282353, 0, 1, 1,
0.5922013, -0.7637928, 3.373526, 0.2901961, 0, 1, 1,
0.5925272, 0.6761771, 0.6823394, 0.2941177, 0, 1, 1,
0.595264, 0.6476352, 1.516, 0.3019608, 0, 1, 1,
0.6022689, 0.3330477, 1.295427, 0.3098039, 0, 1, 1,
0.6063638, -0.5524504, 2.261858, 0.3137255, 0, 1, 1,
0.6096575, 0.04528664, 0.7571599, 0.3215686, 0, 1, 1,
0.611302, -1.118309, 1.902446, 0.3254902, 0, 1, 1,
0.6121945, 1.178036, 0.9918686, 0.3333333, 0, 1, 1,
0.6125833, -0.8596494, 3.833317, 0.3372549, 0, 1, 1,
0.6200626, -0.01313095, 2.079414, 0.345098, 0, 1, 1,
0.6239229, 0.5454388, 1.973706, 0.3490196, 0, 1, 1,
0.6251599, 1.973714, -1.237972, 0.3568628, 0, 1, 1,
0.627121, 1.838828, 1.189974, 0.3607843, 0, 1, 1,
0.6336004, 1.207235, -1.826599, 0.3686275, 0, 1, 1,
0.6338159, -0.7827358, 2.785991, 0.372549, 0, 1, 1,
0.6404536, -1.705328, 3.41062, 0.3803922, 0, 1, 1,
0.6417189, -0.187043, 0.6437875, 0.3843137, 0, 1, 1,
0.6453214, -0.9396994, 0.5967289, 0.3921569, 0, 1, 1,
0.6536701, -0.02810957, 0.9319564, 0.3960784, 0, 1, 1,
0.6537217, -0.6560162, 0.8726774, 0.4039216, 0, 1, 1,
0.6635399, 0.02153223, 3.619307, 0.4117647, 0, 1, 1,
0.6654287, 0.5463341, 0.6483319, 0.4156863, 0, 1, 1,
0.6690171, 0.2223241, 0.2607128, 0.4235294, 0, 1, 1,
0.6702835, 1.258365, 0.5992633, 0.427451, 0, 1, 1,
0.6722895, -0.3231129, 2.368031, 0.4352941, 0, 1, 1,
0.675429, 1.359963, 0.9063207, 0.4392157, 0, 1, 1,
0.6773213, 0.01763012, 0.9613023, 0.4470588, 0, 1, 1,
0.6805288, 2.281945, 1.154573, 0.4509804, 0, 1, 1,
0.6834477, 0.08744782, -1.107239, 0.4588235, 0, 1, 1,
0.6851822, -0.2112649, 3.751594, 0.4627451, 0, 1, 1,
0.6907539, -1.1347, 2.85896, 0.4705882, 0, 1, 1,
0.6948709, -0.1009366, 2.251364, 0.4745098, 0, 1, 1,
0.6949292, 0.07403425, 1.111958, 0.4823529, 0, 1, 1,
0.6985155, -0.2824602, 0.9625972, 0.4862745, 0, 1, 1,
0.7032973, 1.163942, -0.5964543, 0.4941176, 0, 1, 1,
0.7049745, 0.007827601, 2.298978, 0.5019608, 0, 1, 1,
0.7070817, 0.9200758, 0.8206809, 0.5058824, 0, 1, 1,
0.708458, -0.883213, 3.065609, 0.5137255, 0, 1, 1,
0.7102038, -0.1132294, 0.9426364, 0.5176471, 0, 1, 1,
0.712472, 0.3497765, 1.414629, 0.5254902, 0, 1, 1,
0.7134189, -1.256492, 3.890125, 0.5294118, 0, 1, 1,
0.7188598, 0.5833679, 0.4358201, 0.5372549, 0, 1, 1,
0.7223306, 0.1219889, 1.412527, 0.5411765, 0, 1, 1,
0.7279957, -2.128922, 3.803993, 0.5490196, 0, 1, 1,
0.7322357, 1.096319, -0.07014646, 0.5529412, 0, 1, 1,
0.737505, 0.3115874, 0.6545863, 0.5607843, 0, 1, 1,
0.743816, 0.602576, 0.4694528, 0.5647059, 0, 1, 1,
0.7445949, -1.194018, 2.652518, 0.572549, 0, 1, 1,
0.7446426, 0.1537635, 1.222182, 0.5764706, 0, 1, 1,
0.7462342, 0.9230194, 0.1947, 0.5843138, 0, 1, 1,
0.7522822, -1.470031, 2.914145, 0.5882353, 0, 1, 1,
0.7553352, -0.4913365, 1.31567, 0.5960785, 0, 1, 1,
0.7596359, -1.379752, 2.127793, 0.6039216, 0, 1, 1,
0.7612991, 0.2124993, 2.135748, 0.6078432, 0, 1, 1,
0.7628141, 1.326955, 1.005098, 0.6156863, 0, 1, 1,
0.7667369, 0.2432944, 2.023049, 0.6196079, 0, 1, 1,
0.7712276, -2.425648, 3.638519, 0.627451, 0, 1, 1,
0.7716694, 0.7642432, 0.95069, 0.6313726, 0, 1, 1,
0.7734559, 0.682216, -0.6365905, 0.6392157, 0, 1, 1,
0.7738923, 0.05271853, 1.645348, 0.6431373, 0, 1, 1,
0.7801782, 0.2912816, 3.392868, 0.6509804, 0, 1, 1,
0.7828981, -1.138671, 1.197359, 0.654902, 0, 1, 1,
0.7832068, -1.573467, 2.014516, 0.6627451, 0, 1, 1,
0.7836199, -0.9158962, 2.84052, 0.6666667, 0, 1, 1,
0.7841622, -0.8834011, 3.347484, 0.6745098, 0, 1, 1,
0.7886056, 1.812595, 2.137321, 0.6784314, 0, 1, 1,
0.7914083, 1.237513, 0.1681257, 0.6862745, 0, 1, 1,
0.7925378, 0.1090913, 1.812341, 0.6901961, 0, 1, 1,
0.8015561, -2.443904, 1.431695, 0.6980392, 0, 1, 1,
0.802554, -0.1262571, 1.205749, 0.7058824, 0, 1, 1,
0.8089637, -0.4494471, 1.465805, 0.7098039, 0, 1, 1,
0.8105535, 0.5670782, -0.5481722, 0.7176471, 0, 1, 1,
0.8109254, -0.764028, 3.119914, 0.7215686, 0, 1, 1,
0.812757, -0.571817, 1.307319, 0.7294118, 0, 1, 1,
0.8141218, -0.3962983, 1.136314, 0.7333333, 0, 1, 1,
0.8161031, 0.5670632, 0.8308187, 0.7411765, 0, 1, 1,
0.8162816, 0.4819146, 0.7820383, 0.7450981, 0, 1, 1,
0.8174049, 0.2575132, 3.007746, 0.7529412, 0, 1, 1,
0.8220666, -0.2726928, 0.7366542, 0.7568628, 0, 1, 1,
0.8325728, 0.4812638, 0.6871343, 0.7647059, 0, 1, 1,
0.8363414, 1.522869, 1.850473, 0.7686275, 0, 1, 1,
0.8391557, -0.8643586, 3.556685, 0.7764706, 0, 1, 1,
0.8434904, 0.4189236, 1.124481, 0.7803922, 0, 1, 1,
0.847642, -0.7267185, 0.8586125, 0.7882353, 0, 1, 1,
0.8479524, -0.4904292, 1.03472, 0.7921569, 0, 1, 1,
0.8491648, 0.006440629, -0.4591614, 0.8, 0, 1, 1,
0.8505552, -0.07025316, 0.5669295, 0.8078431, 0, 1, 1,
0.8527975, 0.5058907, 2.003201, 0.8117647, 0, 1, 1,
0.8530579, 0.205046, 0.2950189, 0.8196079, 0, 1, 1,
0.8632454, 0.5067796, 2.106988, 0.8235294, 0, 1, 1,
0.8634151, 1.000185, 0.5703695, 0.8313726, 0, 1, 1,
0.8645234, -1.879075, 3.742017, 0.8352941, 0, 1, 1,
0.8683468, 0.0188264, 1.335826, 0.8431373, 0, 1, 1,
0.8699459, 0.5941638, 0.5868528, 0.8470588, 0, 1, 1,
0.8765829, 0.7847139, 0.259425, 0.854902, 0, 1, 1,
0.8766987, -0.6509191, 2.570153, 0.8588235, 0, 1, 1,
0.8893495, 1.488004, 1.041559, 0.8666667, 0, 1, 1,
0.8947358, 2.147015, 0.1647974, 0.8705882, 0, 1, 1,
0.8966696, 0.6348988, -0.5404465, 0.8784314, 0, 1, 1,
0.8994823, 0.2239033, 1.690232, 0.8823529, 0, 1, 1,
0.9007545, -0.1607266, 3.105792, 0.8901961, 0, 1, 1,
0.9010483, 0.3056814, 3.112947, 0.8941177, 0, 1, 1,
0.903733, -1.77462, 3.343888, 0.9019608, 0, 1, 1,
0.9104562, 1.665091, -0.685575, 0.9098039, 0, 1, 1,
0.9196288, 0.1532934, 1.877682, 0.9137255, 0, 1, 1,
0.9296575, -0.5885555, 1.117657, 0.9215686, 0, 1, 1,
0.9330066, 0.2988329, 1.813997, 0.9254902, 0, 1, 1,
0.9351958, 1.563085, -0.6220743, 0.9333333, 0, 1, 1,
0.9403991, 0.3019117, -0.4936334, 0.9372549, 0, 1, 1,
0.9436656, 0.1503195, -1.216233, 0.945098, 0, 1, 1,
0.9454659, 0.5719311, 1.773896, 0.9490196, 0, 1, 1,
0.955345, 0.1474765, 1.534772, 0.9568627, 0, 1, 1,
0.9564459, 1.196047, 2.046151, 0.9607843, 0, 1, 1,
0.9645674, 0.8298284, 2.436847, 0.9686275, 0, 1, 1,
0.9725119, -2.191176, 2.286631, 0.972549, 0, 1, 1,
0.9740011, -1.480311, 5.311119, 0.9803922, 0, 1, 1,
0.9743727, -0.7297473, 1.321902, 0.9843137, 0, 1, 1,
0.9790398, 0.1469885, 1.107655, 0.9921569, 0, 1, 1,
0.9796122, 0.2410986, 1.754004, 0.9960784, 0, 1, 1,
0.980585, -2.061086, 2.978506, 1, 0, 0.9960784, 1,
0.9815192, 1.474698, 1.084144, 1, 0, 0.9882353, 1,
0.9852753, 0.3670604, 1.879368, 1, 0, 0.9843137, 1,
0.9878151, 0.1901862, 2.240583, 1, 0, 0.9764706, 1,
1.001889, 0.6284738, 0.8419476, 1, 0, 0.972549, 1,
1.004068, 0.2620066, 1.123414, 1, 0, 0.9647059, 1,
1.004767, -0.5937987, 3.001688, 1, 0, 0.9607843, 1,
1.006084, 1.130258, 0.2959117, 1, 0, 0.9529412, 1,
1.008759, 0.6675906, 1.11025, 1, 0, 0.9490196, 1,
1.025577, -1.318139, 0.5330562, 1, 0, 0.9411765, 1,
1.026374, 0.7207255, 1.794579, 1, 0, 0.9372549, 1,
1.028567, -0.8346964, 1.318695, 1, 0, 0.9294118, 1,
1.029459, 0.3421865, 1.563038, 1, 0, 0.9254902, 1,
1.029923, -1.212754, 0.561433, 1, 0, 0.9176471, 1,
1.031408, 0.09265561, 2.05797, 1, 0, 0.9137255, 1,
1.032261, 0.9629824, 1.715439, 1, 0, 0.9058824, 1,
1.034531, -0.9907932, 3.27201, 1, 0, 0.9019608, 1,
1.034723, 0.1945821, 0.8154905, 1, 0, 0.8941177, 1,
1.039438, 0.8143548, 0.7463653, 1, 0, 0.8862745, 1,
1.040421, -0.9055371, 1.619054, 1, 0, 0.8823529, 1,
1.053575, -0.5311496, 1.017468, 1, 0, 0.8745098, 1,
1.057389, -0.614092, 0.9037008, 1, 0, 0.8705882, 1,
1.057679, -0.08512081, 1.288482, 1, 0, 0.8627451, 1,
1.062745, 1.101927, 2.114275, 1, 0, 0.8588235, 1,
1.064579, 0.05558193, 0.0498067, 1, 0, 0.8509804, 1,
1.065555, -0.6387769, 4.273414, 1, 0, 0.8470588, 1,
1.074802, 0.7910873, 1.392942, 1, 0, 0.8392157, 1,
1.075817, 1.39467, 0.6046543, 1, 0, 0.8352941, 1,
1.079422, 1.791008, -0.4042462, 1, 0, 0.827451, 1,
1.0828, 1.034724, -0.06210639, 1, 0, 0.8235294, 1,
1.083056, -1.354448, 1.41987, 1, 0, 0.8156863, 1,
1.094635, 1.239018, 0.7972407, 1, 0, 0.8117647, 1,
1.107736, -0.5355897, 1.861134, 1, 0, 0.8039216, 1,
1.108027, 1.501012, 1.413835, 1, 0, 0.7960784, 1,
1.119285, -0.1678175, 1.757594, 1, 0, 0.7921569, 1,
1.137614, 1.101983, -1.164445, 1, 0, 0.7843137, 1,
1.142922, -0.55368, 2.525123, 1, 0, 0.7803922, 1,
1.148637, 1.114879, 0.935977, 1, 0, 0.772549, 1,
1.157935, 0.6525007, 2.029565, 1, 0, 0.7686275, 1,
1.157943, 0.6166968, 2.23337, 1, 0, 0.7607843, 1,
1.162656, -0.7153854, 1.527521, 1, 0, 0.7568628, 1,
1.172005, 1.192038, 1.592905, 1, 0, 0.7490196, 1,
1.174147, 2.525291, -1.6241, 1, 0, 0.7450981, 1,
1.17642, -0.7916961, 2.394536, 1, 0, 0.7372549, 1,
1.182325, -0.06748503, -0.9194676, 1, 0, 0.7333333, 1,
1.183987, -0.01431898, 3.374569, 1, 0, 0.7254902, 1,
1.191491, -1.219566, 1.656519, 1, 0, 0.7215686, 1,
1.201678, -0.6572614, 3.526738, 1, 0, 0.7137255, 1,
1.202728, -0.2460587, 2.443714, 1, 0, 0.7098039, 1,
1.203242, 0.1925034, 0.5288721, 1, 0, 0.7019608, 1,
1.204774, 0.6230009, 1.159458, 1, 0, 0.6941177, 1,
1.212093, -0.1074146, 3.931532, 1, 0, 0.6901961, 1,
1.214333, 0.06768204, 1.094606, 1, 0, 0.682353, 1,
1.217438, 0.5314633, 2.613806, 1, 0, 0.6784314, 1,
1.224475, 0.4704859, 0.7483366, 1, 0, 0.6705883, 1,
1.226818, 2.303711, -1.281653, 1, 0, 0.6666667, 1,
1.232706, 1.749396, 1.620199, 1, 0, 0.6588235, 1,
1.237245, -1.435926, 2.022698, 1, 0, 0.654902, 1,
1.239813, -1.134638, 2.870725, 1, 0, 0.6470588, 1,
1.240201, 0.3496636, 1.948254, 1, 0, 0.6431373, 1,
1.24083, -1.324419, 2.635609, 1, 0, 0.6352941, 1,
1.242975, 0.4872397, 2.012991, 1, 0, 0.6313726, 1,
1.255189, -0.09471306, 1.169233, 1, 0, 0.6235294, 1,
1.257004, 0.4475194, 0.7672611, 1, 0, 0.6196079, 1,
1.263257, 0.34328, 1.144934, 1, 0, 0.6117647, 1,
1.265814, -1.216848, 2.689378, 1, 0, 0.6078432, 1,
1.270417, 0.1885976, 0.7420042, 1, 0, 0.6, 1,
1.270446, 0.04873756, 2.235751, 1, 0, 0.5921569, 1,
1.276598, 0.5652512, 1.215712, 1, 0, 0.5882353, 1,
1.285328, 0.4265347, 0.7784233, 1, 0, 0.5803922, 1,
1.287788, 0.2593355, 1.619265, 1, 0, 0.5764706, 1,
1.296698, -0.8184574, 1.58849, 1, 0, 0.5686275, 1,
1.301599, -1.575981, 4.586904, 1, 0, 0.5647059, 1,
1.310112, 2.077132, 0.02352301, 1, 0, 0.5568628, 1,
1.31111, 2.078077, 1.427571, 1, 0, 0.5529412, 1,
1.313816, -0.4271955, 2.52716, 1, 0, 0.5450981, 1,
1.318911, 1.329648, 1.03474, 1, 0, 0.5411765, 1,
1.329489, 1.266088, 0.6329989, 1, 0, 0.5333334, 1,
1.331463, -0.8792775, 1.366504, 1, 0, 0.5294118, 1,
1.334351, 2.263468, -0.4647216, 1, 0, 0.5215687, 1,
1.353374, -0.3710352, 1.427348, 1, 0, 0.5176471, 1,
1.359661, -0.3242226, 2.634443, 1, 0, 0.509804, 1,
1.365903, 0.3731261, 2.72356, 1, 0, 0.5058824, 1,
1.381566, -0.1247706, 3.239458, 1, 0, 0.4980392, 1,
1.390186, 0.3079107, 2.008335, 1, 0, 0.4901961, 1,
1.391014, -1.133906, 3.297777, 1, 0, 0.4862745, 1,
1.407787, 0.4456054, 2.253286, 1, 0, 0.4784314, 1,
1.420614, -0.2472935, 2.892532, 1, 0, 0.4745098, 1,
1.429216, 1.176747, 1.293807, 1, 0, 0.4666667, 1,
1.440836, 1.044176, 1.338737, 1, 0, 0.4627451, 1,
1.451128, -0.3357415, 1.666849, 1, 0, 0.454902, 1,
1.452396, 1.559366, 0.6195793, 1, 0, 0.4509804, 1,
1.452666, -0.3243469, 1.095807, 1, 0, 0.4431373, 1,
1.453277, 0.7535897, 1.208443, 1, 0, 0.4392157, 1,
1.455212, 2.54089, -1.014099, 1, 0, 0.4313726, 1,
1.464286, -0.6184058, 1.447625, 1, 0, 0.427451, 1,
1.466856, -0.9889091, 3.909354, 1, 0, 0.4196078, 1,
1.47427, -1.105861, 1.811885, 1, 0, 0.4156863, 1,
1.475798, 0.5000508, 0.7954905, 1, 0, 0.4078431, 1,
1.482225, 0.4353717, 0.8540455, 1, 0, 0.4039216, 1,
1.482452, 0.2043839, 3.594127, 1, 0, 0.3960784, 1,
1.483723, 0.6539928, 2.249619, 1, 0, 0.3882353, 1,
1.485981, 1.417827, 1.028626, 1, 0, 0.3843137, 1,
1.487273, 1.203876, 0.4786613, 1, 0, 0.3764706, 1,
1.501076, -0.6035732, 3.507209, 1, 0, 0.372549, 1,
1.525178, 0.07480023, -0.2931978, 1, 0, 0.3647059, 1,
1.526058, -0.6413931, 2.08831, 1, 0, 0.3607843, 1,
1.531276, 0.9972275, 1.340744, 1, 0, 0.3529412, 1,
1.5492, -0.5155942, 2.327682, 1, 0, 0.3490196, 1,
1.552324, -0.6144816, 2.25438, 1, 0, 0.3411765, 1,
1.575475, -0.1582044, 2.582128, 1, 0, 0.3372549, 1,
1.577422, -0.09270789, 1.006695, 1, 0, 0.3294118, 1,
1.583906, 0.4849249, -0.8128111, 1, 0, 0.3254902, 1,
1.592097, -1.709932, 2.779488, 1, 0, 0.3176471, 1,
1.609263, -1.021448, 3.177371, 1, 0, 0.3137255, 1,
1.610423, 0.5276886, 1.238316, 1, 0, 0.3058824, 1,
1.625421, 1.589093, 1.306189, 1, 0, 0.2980392, 1,
1.633113, -0.7156815, 2.360843, 1, 0, 0.2941177, 1,
1.65714, -0.2504998, 2.274827, 1, 0, 0.2862745, 1,
1.659726, 0.555108, 2.603524, 1, 0, 0.282353, 1,
1.676791, 0.925703, -0.3690097, 1, 0, 0.2745098, 1,
1.698576, 1.039242, 1.30672, 1, 0, 0.2705882, 1,
1.701688, -1.229794, 2.585727, 1, 0, 0.2627451, 1,
1.717365, 0.1514478, 2.166127, 1, 0, 0.2588235, 1,
1.722854, 0.02358113, 0.8536875, 1, 0, 0.2509804, 1,
1.727994, -0.1358712, 3.164393, 1, 0, 0.2470588, 1,
1.741428, -2.062725, 1.505664, 1, 0, 0.2392157, 1,
1.750429, -0.8748312, 0.3507975, 1, 0, 0.2352941, 1,
1.773988, -0.0667325, 0.103071, 1, 0, 0.227451, 1,
1.775383, -0.03242071, 2.880633, 1, 0, 0.2235294, 1,
1.777554, 0.4784389, 1.672651, 1, 0, 0.2156863, 1,
1.786932, -0.26851, 0.5704166, 1, 0, 0.2117647, 1,
1.791616, -1.086737, 0.466168, 1, 0, 0.2039216, 1,
1.793743, -0.04472308, 3.376214, 1, 0, 0.1960784, 1,
1.811098, -3.14005, 2.589996, 1, 0, 0.1921569, 1,
1.822681, 0.006575111, 3.471748, 1, 0, 0.1843137, 1,
1.832403, -1.508289, 3.767984, 1, 0, 0.1803922, 1,
1.836871, -0.9104977, 2.499324, 1, 0, 0.172549, 1,
1.845064, -0.1047263, 1.412734, 1, 0, 0.1686275, 1,
1.847165, 1.172259, 1.015885, 1, 0, 0.1607843, 1,
1.855663, 1.752419, 0.7798928, 1, 0, 0.1568628, 1,
1.857682, 1.688444, 2.002093, 1, 0, 0.1490196, 1,
1.86869, -1.526941, 4.004784, 1, 0, 0.145098, 1,
1.882356, 0.3126639, 3.436584, 1, 0, 0.1372549, 1,
1.882945, 0.3214496, 0.3458029, 1, 0, 0.1333333, 1,
1.886898, 0.07444548, 0.4725449, 1, 0, 0.1254902, 1,
1.896315, -0.6410197, 2.346382, 1, 0, 0.1215686, 1,
1.920551, -0.4378106, 1.973328, 1, 0, 0.1137255, 1,
1.929067, -2.406845, 3.501284, 1, 0, 0.1098039, 1,
1.959922, -1.418722, 3.132882, 1, 0, 0.1019608, 1,
1.996796, -1.049603, 3.255377, 1, 0, 0.09411765, 1,
2.001329, 0.008609799, 1.133985, 1, 0, 0.09019608, 1,
2.010463, -0.4041616, 2.279161, 1, 0, 0.08235294, 1,
2.017955, -1.746006, 1.872405, 1, 0, 0.07843138, 1,
2.125304, 1.324076, 0.4483863, 1, 0, 0.07058824, 1,
2.13745, -0.5440522, 1.065897, 1, 0, 0.06666667, 1,
2.152154, -0.2537595, 0.8798811, 1, 0, 0.05882353, 1,
2.181491, 1.044822, -0.006815084, 1, 0, 0.05490196, 1,
2.182786, 0.1352356, 0.7241731, 1, 0, 0.04705882, 1,
2.312678, -0.7687885, 1.65878, 1, 0, 0.04313726, 1,
2.317841, -0.5776886, 1.582438, 1, 0, 0.03529412, 1,
2.365539, 0.9321649, 1.603749, 1, 0, 0.03137255, 1,
2.395434, -0.1438487, 1.59448, 1, 0, 0.02352941, 1,
2.721395, 0.1775019, 1.004668, 1, 0, 0.01960784, 1,
2.981127, -1.289652, 2.620116, 1, 0, 0.01176471, 1,
3.110951, -0.6434674, 2.658854, 1, 0, 0.007843138, 1
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
0.2019972, -4.871818, -7.553391, 0, -0.5, 0.5, 0.5,
0.2019972, -4.871818, -7.553391, 1, -0.5, 0.5, 0.5,
0.2019972, -4.871818, -7.553391, 1, 1.5, 0.5, 0.5,
0.2019972, -4.871818, -7.553391, 0, 1.5, 0.5, 0.5
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
-3.693092, -0.1717318, -7.553391, 0, -0.5, 0.5, 0.5,
-3.693092, -0.1717318, -7.553391, 1, -0.5, 0.5, 0.5,
-3.693092, -0.1717318, -7.553391, 1, 1.5, 0.5, 0.5,
-3.693092, -0.1717318, -7.553391, 0, 1.5, 0.5, 0.5
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
-3.693092, -4.871818, -0.188885, 0, -0.5, 0.5, 0.5,
-3.693092, -4.871818, -0.188885, 1, -0.5, 0.5, 0.5,
-3.693092, -4.871818, -0.188885, 1, 1.5, 0.5, 0.5,
-3.693092, -4.871818, -0.188885, 0, 1.5, 0.5, 0.5
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
-2, -3.787182, -5.853889,
3, -3.787182, -5.853889,
-2, -3.787182, -5.853889,
-2, -3.967955, -6.137139,
-1, -3.787182, -5.853889,
-1, -3.967955, -6.137139,
0, -3.787182, -5.853889,
0, -3.967955, -6.137139,
1, -3.787182, -5.853889,
1, -3.967955, -6.137139,
2, -3.787182, -5.853889,
2, -3.967955, -6.137139,
3, -3.787182, -5.853889,
3, -3.967955, -6.137139
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
-2, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
-2, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
-2, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
-2, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5,
-1, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
-1, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
-1, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
-1, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5,
0, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
0, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
0, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
0, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5,
1, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
1, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
1, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
1, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5,
2, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
2, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
2, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
2, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5,
3, -4.3295, -6.70364, 0, -0.5, 0.5, 0.5,
3, -4.3295, -6.70364, 1, -0.5, 0.5, 0.5,
3, -4.3295, -6.70364, 1, 1.5, 0.5, 0.5,
3, -4.3295, -6.70364, 0, 1.5, 0.5, 0.5
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
-2.794225, -2, -5.853889,
-2.794225, 2, -5.853889,
-2.794225, -2, -5.853889,
-2.944036, -2, -6.137139,
-2.794225, 0, -5.853889,
-2.944036, 0, -6.137139,
-2.794225, 2, -5.853889,
-2.944036, 2, -6.137139
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
"0",
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
-3.243659, -2, -6.70364, 0, -0.5, 0.5, 0.5,
-3.243659, -2, -6.70364, 1, -0.5, 0.5, 0.5,
-3.243659, -2, -6.70364, 1, 1.5, 0.5, 0.5,
-3.243659, -2, -6.70364, 0, 1.5, 0.5, 0.5,
-3.243659, 0, -6.70364, 0, -0.5, 0.5, 0.5,
-3.243659, 0, -6.70364, 1, -0.5, 0.5, 0.5,
-3.243659, 0, -6.70364, 1, 1.5, 0.5, 0.5,
-3.243659, 0, -6.70364, 0, 1.5, 0.5, 0.5,
-3.243659, 2, -6.70364, 0, -0.5, 0.5, 0.5,
-3.243659, 2, -6.70364, 1, -0.5, 0.5, 0.5,
-3.243659, 2, -6.70364, 1, 1.5, 0.5, 0.5,
-3.243659, 2, -6.70364, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.794225, -3.787182, -4,
-2.794225, -3.787182, 4,
-2.794225, -3.787182, -4,
-2.944036, -3.967955, -4,
-2.794225, -3.787182, -2,
-2.944036, -3.967955, -2,
-2.794225, -3.787182, 0,
-2.944036, -3.967955, 0,
-2.794225, -3.787182, 2,
-2.944036, -3.967955, 2,
-2.794225, -3.787182, 4,
-2.944036, -3.967955, 4
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
-3.243659, -4.3295, -4, 0, -0.5, 0.5, 0.5,
-3.243659, -4.3295, -4, 1, -0.5, 0.5, 0.5,
-3.243659, -4.3295, -4, 1, 1.5, 0.5, 0.5,
-3.243659, -4.3295, -4, 0, 1.5, 0.5, 0.5,
-3.243659, -4.3295, -2, 0, -0.5, 0.5, 0.5,
-3.243659, -4.3295, -2, 1, -0.5, 0.5, 0.5,
-3.243659, -4.3295, -2, 1, 1.5, 0.5, 0.5,
-3.243659, -4.3295, -2, 0, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 0, 0, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 0, 1, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 0, 1, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 0, 0, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 2, 0, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 2, 1, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 2, 1, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 2, 0, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 4, 0, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 4, 1, -0.5, 0.5, 0.5,
-3.243659, -4.3295, 4, 1, 1.5, 0.5, 0.5,
-3.243659, -4.3295, 4, 0, 1.5, 0.5, 0.5
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
-2.794225, -3.787182, -5.853889,
-2.794225, 3.443719, -5.853889,
-2.794225, -3.787182, 5.476119,
-2.794225, 3.443719, 5.476119,
-2.794225, -3.787182, -5.853889,
-2.794225, -3.787182, 5.476119,
-2.794225, 3.443719, -5.853889,
-2.794225, 3.443719, 5.476119,
-2.794225, -3.787182, -5.853889,
3.19822, -3.787182, -5.853889,
-2.794225, -3.787182, 5.476119,
3.19822, -3.787182, 5.476119,
-2.794225, 3.443719, -5.853889,
3.19822, 3.443719, -5.853889,
-2.794225, 3.443719, 5.476119,
3.19822, 3.443719, 5.476119,
3.19822, -3.787182, -5.853889,
3.19822, 3.443719, -5.853889,
3.19822, -3.787182, 5.476119,
3.19822, 3.443719, 5.476119,
3.19822, -3.787182, -5.853889,
3.19822, -3.787182, 5.476119,
3.19822, 3.443719, -5.853889,
3.19822, 3.443719, 5.476119
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
var radius = 7.858126;
var distance = 34.96169;
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
mvMatrix.translate( -0.2019972, 0.1717318, 0.188885 );
mvMatrix.scale( 1.417845, 1.175007, 0.7498989 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.96169);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
1-naphthol_naphthoxy<-read.table("1-naphthol_naphthoxy.xyz", skip=1)
```

```
## Error in read.table("1-naphthol_naphthoxy.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-1-naphthol_naphthoxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthol_naphthoxy' not found
```

```r
y<-1-naphthol_naphthoxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthol_naphthoxy' not found
```

```r
z<-1-naphthol_naphthoxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthol_naphthoxy' not found
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
-2.706957, 0.6169481, -1.887695, 0, 0, 1, 1, 1,
-2.661259, 1.807475, -1.096319, 1, 0, 0, 1, 1,
-2.619315, 0.003880268, -2.137094, 1, 0, 0, 1, 1,
-2.380181, -3.681878, -3.461398, 1, 0, 0, 1, 1,
-2.324145, -1.052402, -1.608365, 1, 0, 0, 1, 1,
-2.32039, -0.731816, -1.838592, 1, 0, 0, 1, 1,
-2.255952, -0.02075227, -1.293251, 0, 0, 0, 1, 1,
-2.15605, 0.9720725, -1.9775, 0, 0, 0, 1, 1,
-2.153561, 0.6875867, -0.9750232, 0, 0, 0, 1, 1,
-2.106556, -0.301784, -0.9696601, 0, 0, 0, 1, 1,
-2.069189, 1.057063, -0.5768329, 0, 0, 0, 1, 1,
-2.066696, 0.6330491, -0.6051255, 0, 0, 0, 1, 1,
-2.057191, 0.3399583, -1.378276, 0, 0, 0, 1, 1,
-2.027895, -0.8333892, -2.010028, 1, 1, 1, 1, 1,
-1.991102, 1.363463, -1.926243, 1, 1, 1, 1, 1,
-1.983399, 0.8004029, -0.8934324, 1, 1, 1, 1, 1,
-1.928929, -0.9641477, -2.339666, 1, 1, 1, 1, 1,
-1.910098, -0.3306344, -1.28722, 1, 1, 1, 1, 1,
-1.871458, 0.1160243, -0.2266452, 1, 1, 1, 1, 1,
-1.852558, -0.0194169, -2.097938, 1, 1, 1, 1, 1,
-1.83918, -0.007468966, -1.125382, 1, 1, 1, 1, 1,
-1.805078, -1.445453, -2.559694, 1, 1, 1, 1, 1,
-1.795104, -0.3685399, -3.444267, 1, 1, 1, 1, 1,
-1.794335, -0.5904046, 0.4633251, 1, 1, 1, 1, 1,
-1.774831, 0.3521518, -1.746547, 1, 1, 1, 1, 1,
-1.759147, -0.3976408, -2.104262, 1, 1, 1, 1, 1,
-1.744565, -0.7084304, -0.4289211, 1, 1, 1, 1, 1,
-1.736617, 0.9717055, -2.115194, 1, 1, 1, 1, 1,
-1.736261, 1.385232, 2.873344, 0, 0, 1, 1, 1,
-1.722799, 1.761036, -0.03894419, 1, 0, 0, 1, 1,
-1.720071, -0.5151355, -3.5102, 1, 0, 0, 1, 1,
-1.716915, 1.429091, -2.162462, 1, 0, 0, 1, 1,
-1.711821, -0.8652946, -2.172315, 1, 0, 0, 1, 1,
-1.708332, -0.09345915, -3.101625, 1, 0, 0, 1, 1,
-1.705211, 0.3386289, -0.8600054, 0, 0, 0, 1, 1,
-1.700961, 0.3531237, -0.9844077, 0, 0, 0, 1, 1,
-1.695168, 0.3058571, -1.532595, 0, 0, 0, 1, 1,
-1.693549, -0.3544253, -2.777688, 0, 0, 0, 1, 1,
-1.692196, 1.111191, -1.359337, 0, 0, 0, 1, 1,
-1.687337, -1.534019, -1.346007, 0, 0, 0, 1, 1,
-1.670099, -0.9789376, -0.7803983, 0, 0, 0, 1, 1,
-1.640382, -0.6381465, -2.368571, 1, 1, 1, 1, 1,
-1.617746, 0.2941443, -0.5752945, 1, 1, 1, 1, 1,
-1.599405, -0.3123823, -1.647479, 1, 1, 1, 1, 1,
-1.581181, 1.137425, -1.185581, 1, 1, 1, 1, 1,
-1.559791, 0.8270467, -1.167606, 1, 1, 1, 1, 1,
-1.549132, 1.284652, -2.702207, 1, 1, 1, 1, 1,
-1.541571, -0.6667556, -2.482499, 1, 1, 1, 1, 1,
-1.539096, -0.5301987, -0.8912947, 1, 1, 1, 1, 1,
-1.53603, -0.09214865, -1.648042, 1, 1, 1, 1, 1,
-1.53042, 1.602531, -2.261584, 1, 1, 1, 1, 1,
-1.525182, -0.5579247, 0.692972, 1, 1, 1, 1, 1,
-1.524925, -0.5788214, -0.08645032, 1, 1, 1, 1, 1,
-1.508137, -1.520136, -3.004579, 1, 1, 1, 1, 1,
-1.496479, 1.074832, 0.3389396, 1, 1, 1, 1, 1,
-1.483812, -0.2195353, -0.2738317, 1, 1, 1, 1, 1,
-1.483258, 0.1026954, -1.161333, 0, 0, 1, 1, 1,
-1.482546, -1.980397, -2.040124, 1, 0, 0, 1, 1,
-1.474284, 0.5939621, -1.029213, 1, 0, 0, 1, 1,
-1.469194, -2.062483, -2.318671, 1, 0, 0, 1, 1,
-1.467637, 0.9511626, -0.5497651, 1, 0, 0, 1, 1,
-1.465006, 0.5029888, -0.3786347, 1, 0, 0, 1, 1,
-1.460184, 1.959836, 1.149193, 0, 0, 0, 1, 1,
-1.450066, -0.9435635, -1.894246, 0, 0, 0, 1, 1,
-1.447002, 1.46202, -0.2412866, 0, 0, 0, 1, 1,
-1.446959, 0.2765234, -2.674712, 0, 0, 0, 1, 1,
-1.4399, -0.0449727, -2.255564, 0, 0, 0, 1, 1,
-1.413539, -0.8072855, -1.043907, 0, 0, 0, 1, 1,
-1.40944, -0.2210495, -1.276463, 0, 0, 0, 1, 1,
-1.408964, 0.2979628, -1.019859, 1, 1, 1, 1, 1,
-1.402384, -0.9884282, -1.663131, 1, 1, 1, 1, 1,
-1.399824, 0.5636442, -2.478384, 1, 1, 1, 1, 1,
-1.392564, -0.9192181, -0.6910293, 1, 1, 1, 1, 1,
-1.380011, -0.7820031, -3.291275, 1, 1, 1, 1, 1,
-1.371072, 0.2794105, -1.769023, 1, 1, 1, 1, 1,
-1.370199, 0.5749807, -0.7996894, 1, 1, 1, 1, 1,
-1.368192, -1.456667, -2.303117, 1, 1, 1, 1, 1,
-1.335717, -0.8992721, -0.2618768, 1, 1, 1, 1, 1,
-1.332004, -0.05090545, -2.019563, 1, 1, 1, 1, 1,
-1.326389, 0.7759055, -1.791796, 1, 1, 1, 1, 1,
-1.309454, 1.568699, -1.801832, 1, 1, 1, 1, 1,
-1.302181, -0.6082362, -2.897139, 1, 1, 1, 1, 1,
-1.301411, -0.8896967, -2.367168, 1, 1, 1, 1, 1,
-1.298515, -1.6246, -2.805874, 1, 1, 1, 1, 1,
-1.297723, 0.5591862, -0.5171849, 0, 0, 1, 1, 1,
-1.294037, 1.953088, -0.9210429, 1, 0, 0, 1, 1,
-1.291383, 1.588433, -1.181673, 1, 0, 0, 1, 1,
-1.290563, -1.223707, -0.9550064, 1, 0, 0, 1, 1,
-1.290531, 1.75195, -0.6528132, 1, 0, 0, 1, 1,
-1.278957, 1.302078, -1.97932, 1, 0, 0, 1, 1,
-1.278257, -1.688479, -3.445474, 0, 0, 0, 1, 1,
-1.253585, 0.6396506, -2.052832, 0, 0, 0, 1, 1,
-1.24852, -1.264879, -2.71527, 0, 0, 0, 1, 1,
-1.246731, -0.4550088, -2.210502, 0, 0, 0, 1, 1,
-1.245638, 0.7640751, -1.052575, 0, 0, 0, 1, 1,
-1.244231, 0.4830752, -0.8641205, 0, 0, 0, 1, 1,
-1.242063, 1.048226, -0.45645, 0, 0, 0, 1, 1,
-1.237942, 0.1646071, -3.416651, 1, 1, 1, 1, 1,
-1.236498, -0.3497679, -0.2026802, 1, 1, 1, 1, 1,
-1.23599, -0.3098724, -2.656656, 1, 1, 1, 1, 1,
-1.235619, 1.163153, -1.309067, 1, 1, 1, 1, 1,
-1.234097, -0.5188152, -2.525083, 1, 1, 1, 1, 1,
-1.228011, 0.5642843, -2.374025, 1, 1, 1, 1, 1,
-1.227687, 0.537171, -1.405696, 1, 1, 1, 1, 1,
-1.221502, 0.5503064, -2.223569, 1, 1, 1, 1, 1,
-1.217545, 1.225826, -1.480641, 1, 1, 1, 1, 1,
-1.201813, 0.578341, -0.7359308, 1, 1, 1, 1, 1,
-1.199039, 0.01575667, -2.196806, 1, 1, 1, 1, 1,
-1.19571, 1.714565, -0.8506193, 1, 1, 1, 1, 1,
-1.195083, 1.482501, 0.01355336, 1, 1, 1, 1, 1,
-1.192771, 0.2816001, -1.492596, 1, 1, 1, 1, 1,
-1.177039, -0.5119933, -3.686053, 1, 1, 1, 1, 1,
-1.168534, 1.403087, -0.02561993, 0, 0, 1, 1, 1,
-1.155416, 1.634049, -0.05642119, 1, 0, 0, 1, 1,
-1.153188, 0.7274252, -2.235672, 1, 0, 0, 1, 1,
-1.153033, 0.6211978, -1.723845, 1, 0, 0, 1, 1,
-1.143156, 0.1589404, 0.4485221, 1, 0, 0, 1, 1,
-1.140692, -0.3633319, -2.044246, 1, 0, 0, 1, 1,
-1.135806, -0.05526069, -3.237066, 0, 0, 0, 1, 1,
-1.128531, -1.385973, -1.895222, 0, 0, 0, 1, 1,
-1.123725, 0.1312646, -0.7107317, 0, 0, 0, 1, 1,
-1.122524, -0.3519971, -3.351995, 0, 0, 0, 1, 1,
-1.110771, -0.2385018, -1.828868, 0, 0, 0, 1, 1,
-1.110737, -2.393789, -3.066874, 0, 0, 0, 1, 1,
-1.110182, 1.208335, -1.025734, 0, 0, 0, 1, 1,
-1.108361, -0.2971749, -1.056648, 1, 1, 1, 1, 1,
-1.104705, 1.40368, -0.04107099, 1, 1, 1, 1, 1,
-1.09236, 1.550572, 0.7940548, 1, 1, 1, 1, 1,
-1.091659, -0.700479, -3.800926, 1, 1, 1, 1, 1,
-1.090616, 1.460682, -0.2178961, 1, 1, 1, 1, 1,
-1.081397, 1.643736, -1.156232, 1, 1, 1, 1, 1,
-1.080283, 0.08318779, -2.074649, 1, 1, 1, 1, 1,
-1.079499, 1.153237, -0.4810515, 1, 1, 1, 1, 1,
-1.069095, -0.418264, -1.393392, 1, 1, 1, 1, 1,
-1.06657, 1.251978, -0.7465453, 1, 1, 1, 1, 1,
-1.06481, 0.59298, -2.523803, 1, 1, 1, 1, 1,
-1.062262, 0.9392277, -0.02088098, 1, 1, 1, 1, 1,
-1.052821, 0.593221, -1.07022, 1, 1, 1, 1, 1,
-1.04948, 0.1017049, -1.729714, 1, 1, 1, 1, 1,
-1.040372, -0.3894629, -2.47148, 1, 1, 1, 1, 1,
-1.03758, -1.683158, -3.452384, 0, 0, 1, 1, 1,
-1.031615, -2.439274, -1.092335, 1, 0, 0, 1, 1,
-1.02949, 0.1090865, -0.7647305, 1, 0, 0, 1, 1,
-1.028239, 0.1007179, -2.88764, 1, 0, 0, 1, 1,
-1.025366, -0.598366, -1.880167, 1, 0, 0, 1, 1,
-1.01543, 0.7306494, -0.5715065, 1, 0, 0, 1, 1,
-1.014292, -1.35884, -2.376532, 0, 0, 0, 1, 1,
-1.010677, 0.8656217, -0.7620935, 0, 0, 0, 1, 1,
-1.009196, 0.5226808, -2.475538, 0, 0, 0, 1, 1,
-1.00741, 0.9639693, -2.282031, 0, 0, 0, 1, 1,
-1.006895, -1.924431, -0.8687737, 0, 0, 0, 1, 1,
-1.004502, -1.22328, -2.595786, 0, 0, 0, 1, 1,
-1.000858, 0.1649084, -1.498417, 0, 0, 0, 1, 1,
-0.9945576, 0.9236564, -1.128937, 1, 1, 1, 1, 1,
-0.9907255, -0.08936587, -1.125272, 1, 1, 1, 1, 1,
-0.9897168, 1.099743, -0.3068363, 1, 1, 1, 1, 1,
-0.9894016, 0.4282893, -0.7920534, 1, 1, 1, 1, 1,
-0.9880264, 0.1742789, -1.018849, 1, 1, 1, 1, 1,
-0.9874932, 1.121873, -0.3959608, 1, 1, 1, 1, 1,
-0.9831405, 0.9146013, -1.127924, 1, 1, 1, 1, 1,
-0.9830703, 0.403084, 0.4429494, 1, 1, 1, 1, 1,
-0.9828529, 0.3660915, 0.1746834, 1, 1, 1, 1, 1,
-0.9798571, 0.07171082, 0.5595046, 1, 1, 1, 1, 1,
-0.9794599, 0.2157274, -1.884188, 1, 1, 1, 1, 1,
-0.9759154, 0.8141886, -1.160928, 1, 1, 1, 1, 1,
-0.9669668, 0.8689052, 1.775114, 1, 1, 1, 1, 1,
-0.9665816, 0.5235981, 0.754676, 1, 1, 1, 1, 1,
-0.9661366, -0.8151716, -1.290717, 1, 1, 1, 1, 1,
-0.96281, -1.831598, -1.910223, 0, 0, 1, 1, 1,
-0.9559293, -0.08212136, -0.288233, 1, 0, 0, 1, 1,
-0.9558727, 0.3274741, -0.4165646, 1, 0, 0, 1, 1,
-0.955498, 0.3256222, -0.832692, 1, 0, 0, 1, 1,
-0.9508209, 0.9247347, 0.4298348, 1, 0, 0, 1, 1,
-0.9492, -1.308157, -3.276563, 1, 0, 0, 1, 1,
-0.9487402, 0.3556955, 0.6283643, 0, 0, 0, 1, 1,
-0.9457549, -0.4020513, -2.329177, 0, 0, 0, 1, 1,
-0.9446709, 0.2205927, -1.828051, 0, 0, 0, 1, 1,
-0.9431487, 0.9028092, 0.5823911, 0, 0, 0, 1, 1,
-0.9377185, 2.53137, -0.1518106, 0, 0, 0, 1, 1,
-0.9368325, -1.04608, -1.701304, 0, 0, 0, 1, 1,
-0.9290431, -1.073363, -1.182666, 0, 0, 0, 1, 1,
-0.9222876, 0.5509542, 0.2679175, 1, 1, 1, 1, 1,
-0.9213401, -0.05575292, -0.9149212, 1, 1, 1, 1, 1,
-0.916294, -0.03336596, -2.457108, 1, 1, 1, 1, 1,
-0.9106165, 0.4159549, -1.283829, 1, 1, 1, 1, 1,
-0.9042425, -0.01201263, -1.92842, 1, 1, 1, 1, 1,
-0.9038381, -0.3258473, -2.570052, 1, 1, 1, 1, 1,
-0.8995056, -0.383592, -1.364995, 1, 1, 1, 1, 1,
-0.892088, -1.616974, -4.226473, 1, 1, 1, 1, 1,
-0.8867999, -0.004110153, -0.8569556, 1, 1, 1, 1, 1,
-0.8834957, 0.7560456, 0.1465016, 1, 1, 1, 1, 1,
-0.8826234, 1.203047, 2.635005, 1, 1, 1, 1, 1,
-0.8727458, 0.7206454, -0.8902769, 1, 1, 1, 1, 1,
-0.8724204, -0.1205575, -0.104093, 1, 1, 1, 1, 1,
-0.8714421, -1.8902, -4.037018, 1, 1, 1, 1, 1,
-0.8682398, -0.3546563, -2.102154, 1, 1, 1, 1, 1,
-0.860815, -0.3519034, -0.4870395, 0, 0, 1, 1, 1,
-0.8579719, -0.4672391, -2.674745, 1, 0, 0, 1, 1,
-0.8565871, -1.462697, -1.442325, 1, 0, 0, 1, 1,
-0.852838, 1.244865, -0.2978849, 1, 0, 0, 1, 1,
-0.8518528, -0.4754403, -2.603808, 1, 0, 0, 1, 1,
-0.851334, -1.061857, -3.352165, 1, 0, 0, 1, 1,
-0.8505644, -0.03336981, -1.389382, 0, 0, 0, 1, 1,
-0.8439808, 1.412953, 1.366033, 0, 0, 0, 1, 1,
-0.8385445, 0.5087485, -0.2909528, 0, 0, 0, 1, 1,
-0.8346035, -0.1814317, -1.263436, 0, 0, 0, 1, 1,
-0.8340591, -1.389692, -2.834229, 0, 0, 0, 1, 1,
-0.8154564, 0.6918337, 0.0838055, 0, 0, 0, 1, 1,
-0.8135155, 0.1585244, -2.525382, 0, 0, 0, 1, 1,
-0.8134962, 0.300447, -1.79195, 1, 1, 1, 1, 1,
-0.8123763, -1.554383, -3.903755, 1, 1, 1, 1, 1,
-0.8114725, -1.815755, -2.183161, 1, 1, 1, 1, 1,
-0.8105267, 0.3384282, -0.0185826, 1, 1, 1, 1, 1,
-0.8090059, 0.4979169, -1.389005, 1, 1, 1, 1, 1,
-0.8018684, -0.6685727, -3.172118, 1, 1, 1, 1, 1,
-0.795171, 0.1915933, -1.936222, 1, 1, 1, 1, 1,
-0.7893336, -1.192844, -2.866587, 1, 1, 1, 1, 1,
-0.787989, -2.499558, -1.888433, 1, 1, 1, 1, 1,
-0.7798481, -0.7130914, -2.630701, 1, 1, 1, 1, 1,
-0.7728736, -0.6353399, -2.139807, 1, 1, 1, 1, 1,
-0.7706527, 1.092359, -0.7567638, 1, 1, 1, 1, 1,
-0.7697639, -1.556473, -3.24684, 1, 1, 1, 1, 1,
-0.764914, -0.08885187, -1.276465, 1, 1, 1, 1, 1,
-0.7548901, 1.069092, 0.1725162, 1, 1, 1, 1, 1,
-0.7497233, -0.3022844, -3.095997, 0, 0, 1, 1, 1,
-0.7444369, -0.8545218, -3.297727, 1, 0, 0, 1, 1,
-0.7410128, -1.028947, -2.943849, 1, 0, 0, 1, 1,
-0.7386053, 0.3032505, -0.2287171, 1, 0, 0, 1, 1,
-0.7377775, 0.01780088, -0.7564204, 1, 0, 0, 1, 1,
-0.7356335, -0.7456295, -3.825136, 1, 0, 0, 1, 1,
-0.7338508, 0.7381103, 0.3932094, 0, 0, 0, 1, 1,
-0.7310434, -0.4637741, -2.157804, 0, 0, 0, 1, 1,
-0.7282529, 0.1860868, -0.7926537, 0, 0, 0, 1, 1,
-0.7270199, 0.8823539, 0.1045969, 0, 0, 0, 1, 1,
-0.7205415, 0.7291777, -1.530512, 0, 0, 0, 1, 1,
-0.7205129, 3.207217, -1.957619, 0, 0, 0, 1, 1,
-0.720299, 0.5949321, -0.2140954, 0, 0, 0, 1, 1,
-0.7178187, 0.7191556, -0.549107, 1, 1, 1, 1, 1,
-0.7137434, 0.07392034, -0.5167798, 1, 1, 1, 1, 1,
-0.7106642, -0.1519488, -2.132581, 1, 1, 1, 1, 1,
-0.7105924, 2.335042, -1.182089, 1, 1, 1, 1, 1,
-0.710277, 0.3103372, -2.214909, 1, 1, 1, 1, 1,
-0.7056168, -1.115159, -2.7424, 1, 1, 1, 1, 1,
-0.6948302, 0.1177347, -2.722764, 1, 1, 1, 1, 1,
-0.6939281, -1.144231, -2.069594, 1, 1, 1, 1, 1,
-0.6909288, -1.159251, -3.593825, 1, 1, 1, 1, 1,
-0.6890333, 1.604286, 0.9072171, 1, 1, 1, 1, 1,
-0.6871359, 0.3844542, -0.2820383, 1, 1, 1, 1, 1,
-0.6865215, -2.344851, -3.150516, 1, 1, 1, 1, 1,
-0.6819956, -1.906062, -3.233591, 1, 1, 1, 1, 1,
-0.6696505, 0.5806216, -2.519185, 1, 1, 1, 1, 1,
-0.6677999, 0.02317734, -3.150129, 1, 1, 1, 1, 1,
-0.6636584, -0.4090635, -1.596599, 0, 0, 1, 1, 1,
-0.660414, 0.7883259, -0.2330054, 1, 0, 0, 1, 1,
-0.6601217, -0.5654969, -3.091419, 1, 0, 0, 1, 1,
-0.6578255, 1.314258, -0.991372, 1, 0, 0, 1, 1,
-0.656572, 2.088157, -2.151728, 1, 0, 0, 1, 1,
-0.6555479, -0.675898, -1.159474, 1, 0, 0, 1, 1,
-0.6487347, -0.5585473, -1.955616, 0, 0, 0, 1, 1,
-0.6448565, 0.1909208, -2.183859, 0, 0, 0, 1, 1,
-0.6431652, 0.1341592, -1.564005, 0, 0, 0, 1, 1,
-0.6430084, 1.226113, -0.9098403, 0, 0, 0, 1, 1,
-0.6391835, -0.9623027, -2.609006, 0, 0, 0, 1, 1,
-0.6324601, 0.02766852, -1.686551, 0, 0, 0, 1, 1,
-0.6092943, -0.1506024, -0.9935096, 0, 0, 0, 1, 1,
-0.6090615, -1.174052, -2.904537, 1, 1, 1, 1, 1,
-0.6077211, 0.2534157, -1.640937, 1, 1, 1, 1, 1,
-0.6069067, -1.906334, -4.082185, 1, 1, 1, 1, 1,
-0.6053193, 0.3730424, -0.6199605, 1, 1, 1, 1, 1,
-0.6017197, -0.8686104, -2.450143, 1, 1, 1, 1, 1,
-0.5994958, -0.495782, -2.023375, 1, 1, 1, 1, 1,
-0.5980794, 0.1572902, 0.06559397, 1, 1, 1, 1, 1,
-0.59712, 0.1536993, -0.8978204, 1, 1, 1, 1, 1,
-0.5966704, -0.5195572, -0.9614584, 1, 1, 1, 1, 1,
-0.5935299, 1.034987, 0.1409049, 1, 1, 1, 1, 1,
-0.593003, -1.154705, -2.595258, 1, 1, 1, 1, 1,
-0.5869851, 1.078665, -0.911907, 1, 1, 1, 1, 1,
-0.5819625, 0.7823563, -1.747432, 1, 1, 1, 1, 1,
-0.5808507, 1.201486, -1.95425, 1, 1, 1, 1, 1,
-0.5804034, 0.530915, -1.601551, 1, 1, 1, 1, 1,
-0.5771326, 0.3429672, -0.3206667, 0, 0, 1, 1, 1,
-0.5630426, -0.02621097, -1.414867, 1, 0, 0, 1, 1,
-0.5546949, -0.07109937, -3.147909, 1, 0, 0, 1, 1,
-0.5513811, 0.8288636, -0.3672515, 1, 0, 0, 1, 1,
-0.5502999, 1.447175, -0.7300132, 1, 0, 0, 1, 1,
-0.5499629, 1.091178, -0.9763088, 1, 0, 0, 1, 1,
-0.5466431, -1.555592, -3.558164, 0, 0, 0, 1, 1,
-0.5457074, -0.1536044, -1.301228, 0, 0, 0, 1, 1,
-0.5436721, -0.6575255, -4.394545, 0, 0, 0, 1, 1,
-0.5434901, -0.5192876, -2.517815, 0, 0, 0, 1, 1,
-0.5427602, 0.9030243, -1.095975, 0, 0, 0, 1, 1,
-0.542729, 1.956694, -1.459432, 0, 0, 0, 1, 1,
-0.5424338, 0.1504778, -1.9773, 0, 0, 0, 1, 1,
-0.5408066, 0.5757281, -1.098941, 1, 1, 1, 1, 1,
-0.5334761, -0.1132562, -2.505915, 1, 1, 1, 1, 1,
-0.5275199, -2.40524, -3.48131, 1, 1, 1, 1, 1,
-0.5273507, -0.5349506, -3.867217, 1, 1, 1, 1, 1,
-0.5251562, -2.477068, -1.812529, 1, 1, 1, 1, 1,
-0.5228704, 0.8475429, -1.968393, 1, 1, 1, 1, 1,
-0.5218741, 0.2980475, -0.788129, 1, 1, 1, 1, 1,
-0.5211547, -0.01989697, -0.7529302, 1, 1, 1, 1, 1,
-0.5208023, 1.906265, -0.6459851, 1, 1, 1, 1, 1,
-0.5190056, -1.950546, -3.554411, 1, 1, 1, 1, 1,
-0.5166302, -1.158735, -3.459929, 1, 1, 1, 1, 1,
-0.5026703, -1.090068, -2.010247, 1, 1, 1, 1, 1,
-0.5023732, -0.9609811, -3.662543, 1, 1, 1, 1, 1,
-0.4983324, -0.6505491, -1.199051, 1, 1, 1, 1, 1,
-0.4977419, 0.1970832, -1.584239, 1, 1, 1, 1, 1,
-0.4952616, -0.8118426, -1.565851, 0, 0, 1, 1, 1,
-0.4917473, -1.226575, -5.161981, 1, 0, 0, 1, 1,
-0.4894735, 0.2859254, 0.160284, 1, 0, 0, 1, 1,
-0.4888435, 0.4654287, 0.1085724, 1, 0, 0, 1, 1,
-0.4884804, -0.1753306, -1.877876, 1, 0, 0, 1, 1,
-0.4813641, 1.687526, -0.9932475, 1, 0, 0, 1, 1,
-0.4810909, 1.176765, -1.19643, 0, 0, 0, 1, 1,
-0.4796455, -0.05678169, -1.957124, 0, 0, 0, 1, 1,
-0.4743488, 1.684438, -0.3371902, 0, 0, 0, 1, 1,
-0.4719535, -0.4579967, -2.920208, 0, 0, 0, 1, 1,
-0.4719056, 0.4994733, -0.8401894, 0, 0, 0, 1, 1,
-0.4706744, -1.370092, -3.275629, 0, 0, 0, 1, 1,
-0.4660804, 1.348501, -0.163024, 0, 0, 0, 1, 1,
-0.4610302, -0.523529, -0.199669, 1, 1, 1, 1, 1,
-0.4560355, -1.354789, -3.336735, 1, 1, 1, 1, 1,
-0.4549217, 1.569077, -0.488818, 1, 1, 1, 1, 1,
-0.4544045, -0.527504, -2.538527, 1, 1, 1, 1, 1,
-0.4481867, -0.2775673, -3.232049, 1, 1, 1, 1, 1,
-0.4453713, -0.8052227, -0.5284785, 1, 1, 1, 1, 1,
-0.4415871, 0.9616649, -1.091325, 1, 1, 1, 1, 1,
-0.4336553, 1.701757, 0.05393701, 1, 1, 1, 1, 1,
-0.4296773, 1.068133, 1.503586, 1, 1, 1, 1, 1,
-0.4292792, 0.3944905, -0.3547572, 1, 1, 1, 1, 1,
-0.4289834, -0.1388361, 0.5046316, 1, 1, 1, 1, 1,
-0.426766, -0.1769246, -3.672773, 1, 1, 1, 1, 1,
-0.4218083, 0.5126557, -0.08575865, 1, 1, 1, 1, 1,
-0.419257, -2.588321, -2.241817, 1, 1, 1, 1, 1,
-0.41878, -0.1840501, -2.496731, 1, 1, 1, 1, 1,
-0.4140978, -1.916348, -2.93435, 0, 0, 1, 1, 1,
-0.4092222, -0.9423675, -3.115464, 1, 0, 0, 1, 1,
-0.4066606, -0.6797878, -2.479125, 1, 0, 0, 1, 1,
-0.4058605, 0.4915029, -0.4424327, 1, 0, 0, 1, 1,
-0.4053579, -0.5436458, -2.816052, 1, 0, 0, 1, 1,
-0.4016304, -0.1838203, -1.290354, 1, 0, 0, 1, 1,
-0.3999683, 1.282812, -2.019386, 0, 0, 0, 1, 1,
-0.3951165, 1.929042, 0.6699657, 0, 0, 0, 1, 1,
-0.3942131, 0.5137087, 0.9070013, 0, 0, 0, 1, 1,
-0.3941087, -0.07770752, -3.131101, 0, 0, 0, 1, 1,
-0.3883566, 1.134573, -1.500019, 0, 0, 0, 1, 1,
-0.3870987, -0.4814553, -2.546774, 0, 0, 0, 1, 1,
-0.3852019, -0.02829918, -1.252413, 0, 0, 0, 1, 1,
-0.3736337, 0.7670392, -0.01754684, 1, 1, 1, 1, 1,
-0.3712465, -0.2476742, -2.446661, 1, 1, 1, 1, 1,
-0.3696439, 0.7217481, -0.1146278, 1, 1, 1, 1, 1,
-0.3685812, -1.271309, -1.691234, 1, 1, 1, 1, 1,
-0.3673598, 0.6917167, -1.240354, 1, 1, 1, 1, 1,
-0.3656676, -0.9056281, -3.427871, 1, 1, 1, 1, 1,
-0.3612744, -0.1929539, -2.556079, 1, 1, 1, 1, 1,
-0.3611055, -0.709896, -3.117834, 1, 1, 1, 1, 1,
-0.3600609, 1.583732, 0.3080193, 1, 1, 1, 1, 1,
-0.3571423, -1.888121, -3.09138, 1, 1, 1, 1, 1,
-0.3544277, -1.222176, -1.246754, 1, 1, 1, 1, 1,
-0.3529406, 0.3978167, -0.8849389, 1, 1, 1, 1, 1,
-0.3527256, 1.032331, -0.4179839, 1, 1, 1, 1, 1,
-0.3519558, 1.080007, 0.3814701, 1, 1, 1, 1, 1,
-0.3516481, -0.005193747, -0.8856824, 1, 1, 1, 1, 1,
-0.3448996, 0.9101887, -0.3180428, 0, 0, 1, 1, 1,
-0.3447272, 0.9516476, 0.3927465, 1, 0, 0, 1, 1,
-0.3438398, -0.5892815, -2.873152, 1, 0, 0, 1, 1,
-0.3434417, -0.4166745, -1.700482, 1, 0, 0, 1, 1,
-0.3424149, -0.4981465, -1.04505, 1, 0, 0, 1, 1,
-0.3362473, 0.03706378, -1.121312, 1, 0, 0, 1, 1,
-0.335362, -0.8750882, -3.81716, 0, 0, 0, 1, 1,
-0.3352857, 1.908995, -1.086171, 0, 0, 0, 1, 1,
-0.3337905, 0.07011077, -3.476728, 0, 0, 0, 1, 1,
-0.3336754, 0.8165238, -0.9661915, 0, 0, 0, 1, 1,
-0.3313575, 0.08368786, -0.2979681, 0, 0, 0, 1, 1,
-0.3208687, 1.724804, -2.401997, 0, 0, 0, 1, 1,
-0.313959, -0.04079368, -0.981058, 0, 0, 0, 1, 1,
-0.3137235, 0.9894035, 0.08882552, 1, 1, 1, 1, 1,
-0.3115947, 0.6914041, -0.1134461, 1, 1, 1, 1, 1,
-0.3076389, 0.05052036, -3.491883, 1, 1, 1, 1, 1,
-0.3063265, 0.08123551, -0.4880503, 1, 1, 1, 1, 1,
-0.3027855, -0.4174605, -2.667362, 1, 1, 1, 1, 1,
-0.302551, 1.139438, -0.2854633, 1, 1, 1, 1, 1,
-0.3014347, -0.1762408, -3.213609, 1, 1, 1, 1, 1,
-0.3012106, -1.497367, -1.588808, 1, 1, 1, 1, 1,
-0.2959146, 0.2248552, -1.627395, 1, 1, 1, 1, 1,
-0.2950943, 2.042431, -0.4784555, 1, 1, 1, 1, 1,
-0.2888811, 0.9756759, -0.7572811, 1, 1, 1, 1, 1,
-0.2884728, 2.265038, -0.2420835, 1, 1, 1, 1, 1,
-0.2877039, 1.672544, -2.290631, 1, 1, 1, 1, 1,
-0.2862605, -0.6795485, -1.895995, 1, 1, 1, 1, 1,
-0.2853889, 0.3703391, 0.408981, 1, 1, 1, 1, 1,
-0.2827482, 0.4259991, -1.143209, 0, 0, 1, 1, 1,
-0.2819571, -0.102532, -2.658455, 1, 0, 0, 1, 1,
-0.2784655, -0.4061093, -2.642889, 1, 0, 0, 1, 1,
-0.2784158, -0.09888937, -1.564581, 1, 0, 0, 1, 1,
-0.2767373, -0.1474501, -1.285491, 1, 0, 0, 1, 1,
-0.2744343, 0.0201009, -0.5741647, 1, 0, 0, 1, 1,
-0.274204, 0.3246671, -2.78521, 0, 0, 0, 1, 1,
-0.2703865, -0.9879988, -3.049719, 0, 0, 0, 1, 1,
-0.2700758, -1.058813, -2.998622, 0, 0, 0, 1, 1,
-0.2688513, 1.679238, -1.110064, 0, 0, 0, 1, 1,
-0.2673727, 0.3565308, 0.4087206, 0, 0, 0, 1, 1,
-0.2664968, 0.5837533, -0.7109263, 0, 0, 0, 1, 1,
-0.264835, 0.5441009, 0.1357311, 0, 0, 0, 1, 1,
-0.2646394, -0.4370119, -1.791686, 1, 1, 1, 1, 1,
-0.2640177, -0.976297, -4.369719, 1, 1, 1, 1, 1,
-0.2628587, 1.12485, 1.326572, 1, 1, 1, 1, 1,
-0.2626335, -1.654684, -0.06617292, 1, 1, 1, 1, 1,
-0.2626166, -0.4566321, -3.829182, 1, 1, 1, 1, 1,
-0.2575542, 0.4353454, -0.8526052, 1, 1, 1, 1, 1,
-0.2574538, -1.0544, -2.841062, 1, 1, 1, 1, 1,
-0.2529253, -0.7058411, -2.570955, 1, 1, 1, 1, 1,
-0.2494028, -0.2096704, -3.799761, 1, 1, 1, 1, 1,
-0.2477778, 0.2390912, -1.809429, 1, 1, 1, 1, 1,
-0.2476781, 0.1035844, -0.6839004, 1, 1, 1, 1, 1,
-0.2458391, -0.2445599, -1.99148, 1, 1, 1, 1, 1,
-0.2445526, 0.1921546, -0.9540437, 1, 1, 1, 1, 1,
-0.2437824, -0.01483883, -1.294177, 1, 1, 1, 1, 1,
-0.2437185, -1.258292, -2.814099, 1, 1, 1, 1, 1,
-0.2413963, -1.641277, -3.979534, 0, 0, 1, 1, 1,
-0.2395706, 0.1212409, -0.07808853, 1, 0, 0, 1, 1,
-0.2386763, 1.375443, 0.971047, 1, 0, 0, 1, 1,
-0.2384664, -2.985624, -3.103597, 1, 0, 0, 1, 1,
-0.2355155, -0.5280578, -3.549762, 1, 0, 0, 1, 1,
-0.2339531, -0.4332058, -2.267428, 1, 0, 0, 1, 1,
-0.2323856, -0.5852075, -2.581021, 0, 0, 0, 1, 1,
-0.2253613, -0.5372282, -3.493893, 0, 0, 0, 1, 1,
-0.2227667, -0.01478242, -2.824461, 0, 0, 0, 1, 1,
-0.2225823, -1.049744, -3.80582, 0, 0, 0, 1, 1,
-0.2212537, -0.3706647, -1.930927, 0, 0, 0, 1, 1,
-0.2204565, -1.024045, -2.676871, 0, 0, 0, 1, 1,
-0.2168522, 0.1422383, -1.223747, 0, 0, 0, 1, 1,
-0.2088052, 0.4999763, 0.9216897, 1, 1, 1, 1, 1,
-0.2065927, 0.4031663, -0.6838371, 1, 1, 1, 1, 1,
-0.2063698, 1.111203, 1.012623, 1, 1, 1, 1, 1,
-0.2023285, 0.1090173, 1.058404, 1, 1, 1, 1, 1,
-0.200064, -0.75528, -4.545771, 1, 1, 1, 1, 1,
-0.1997028, 0.02476843, -1.62062, 1, 1, 1, 1, 1,
-0.1991705, -1.179892, -3.178812, 1, 1, 1, 1, 1,
-0.1981283, -1.459922, -2.655262, 1, 1, 1, 1, 1,
-0.1875813, -0.1724062, -2.07267, 1, 1, 1, 1, 1,
-0.1870238, 0.01040357, -1.324099, 1, 1, 1, 1, 1,
-0.1855552, -0.1615348, -0.8537554, 1, 1, 1, 1, 1,
-0.1840404, -0.4500588, -3.26231, 1, 1, 1, 1, 1,
-0.1830204, 1.394528, 0.8794582, 1, 1, 1, 1, 1,
-0.1810178, 0.6070523, 0.05204394, 1, 1, 1, 1, 1,
-0.1761955, -0.4166889, -1.809193, 1, 1, 1, 1, 1,
-0.1729096, -0.2083091, -1.68356, 0, 0, 1, 1, 1,
-0.1694521, -1.763626, -4.012568, 1, 0, 0, 1, 1,
-0.1689089, -0.6134025, -2.583317, 1, 0, 0, 1, 1,
-0.1679605, -0.7460666, -4.000069, 1, 0, 0, 1, 1,
-0.1567214, 0.1333735, -1.507367, 1, 0, 0, 1, 1,
-0.1526947, -0.6080338, -2.757978, 1, 0, 0, 1, 1,
-0.1451185, -0.9118659, -2.142998, 0, 0, 0, 1, 1,
-0.1407457, -1.601909, -2.887079, 0, 0, 0, 1, 1,
-0.1381951, 1.076185, -0.1006361, 0, 0, 0, 1, 1,
-0.1331711, 0.8149893, 0.6553068, 0, 0, 0, 1, 1,
-0.1322283, 0.08257503, -0.6287697, 0, 0, 0, 1, 1,
-0.1316373, 0.5794857, -0.4536977, 0, 0, 0, 1, 1,
-0.1283033, -0.0568542, -0.9503324, 0, 0, 0, 1, 1,
-0.1191234, 1.836475, -0.4289879, 1, 1, 1, 1, 1,
-0.1173112, -2.676195, -3.800165, 1, 1, 1, 1, 1,
-0.1159903, -0.2147947, -1.70727, 1, 1, 1, 1, 1,
-0.1124697, 0.7350624, -0.5395176, 1, 1, 1, 1, 1,
-0.1054305, -0.2867849, -1.933679, 1, 1, 1, 1, 1,
-0.09881607, -0.8947266, -4.536629, 1, 1, 1, 1, 1,
-0.09484471, 1.243429, 1.748777, 1, 1, 1, 1, 1,
-0.09465264, -1.2256, -3.020149, 1, 1, 1, 1, 1,
-0.09064042, 0.8414981, -0.3919082, 1, 1, 1, 1, 1,
-0.08703135, 1.00095, -1.11672, 1, 1, 1, 1, 1,
-0.08564521, 1.694642, -0.8331401, 1, 1, 1, 1, 1,
-0.08384495, -0.856035, -4.921171, 1, 1, 1, 1, 1,
-0.08216245, -1.811621, -5.688889, 1, 1, 1, 1, 1,
-0.08017796, 0.009801649, 0.2466878, 1, 1, 1, 1, 1,
-0.07989439, -0.4596566, -3.528658, 1, 1, 1, 1, 1,
-0.0763189, -1.858354, -3.725591, 0, 0, 1, 1, 1,
-0.07401107, -0.3453705, -2.979575, 1, 0, 0, 1, 1,
-0.07148905, -0.3702632, -3.77515, 1, 0, 0, 1, 1,
-0.06720717, 0.6008997, 2.036201, 1, 0, 0, 1, 1,
-0.06541188, 1.09335, -1.27074, 1, 0, 0, 1, 1,
-0.0622034, 0.9528264, 0.3670336, 1, 0, 0, 1, 1,
-0.06101327, 1.226169, -0.656936, 0, 0, 0, 1, 1,
-0.06088648, -0.3566679, -3.269538, 0, 0, 0, 1, 1,
-0.06083896, 1.011874, -0.2754523, 0, 0, 0, 1, 1,
-0.05968855, 0.9242403, 0.5463749, 0, 0, 0, 1, 1,
-0.0568791, -0.8558236, -2.828882, 0, 0, 0, 1, 1,
-0.05175466, -0.2490954, -4.513925, 0, 0, 0, 1, 1,
-0.05145752, 1.638835, 1.168296, 0, 0, 0, 1, 1,
-0.025568, -0.0905762, -2.143816, 1, 1, 1, 1, 1,
-0.02402905, -0.3221925, -3.437885, 1, 1, 1, 1, 1,
-0.02160485, -0.8536028, -1.990606, 1, 1, 1, 1, 1,
-0.01932427, 0.5580222, -0.6943189, 1, 1, 1, 1, 1,
-0.0179002, 1.27979, -0.1178378, 1, 1, 1, 1, 1,
-0.01612961, 2.505299, -0.9864212, 1, 1, 1, 1, 1,
-0.01076559, 0.1290849, 0.9137553, 1, 1, 1, 1, 1,
-0.01017589, -1.879976, -1.984263, 1, 1, 1, 1, 1,
-0.009295261, 0.3283855, -1.347079, 1, 1, 1, 1, 1,
-0.006553986, -2.914242, -3.408906, 1, 1, 1, 1, 1,
-0.006032368, -0.6439079, -1.622703, 1, 1, 1, 1, 1,
-0.002888404, -2.118518, -4.015357, 1, 1, 1, 1, 1,
0.003756825, 0.06489405, -1.340841, 1, 1, 1, 1, 1,
0.00476601, 2.130056, 2.581343, 1, 1, 1, 1, 1,
0.006863032, -0.2553761, 3.203084, 1, 1, 1, 1, 1,
0.01316515, 0.1774584, -1.038972, 0, 0, 1, 1, 1,
0.01596588, 0.2068322, -0.1700229, 1, 0, 0, 1, 1,
0.01607437, -1.191541, 3.640749, 1, 0, 0, 1, 1,
0.01675417, 1.021809, 1.685139, 1, 0, 0, 1, 1,
0.01698272, -0.06010518, 3.423701, 1, 0, 0, 1, 1,
0.01748518, 0.7675824, 0.8923206, 1, 0, 0, 1, 1,
0.01871256, 1.172056, -0.2534645, 0, 0, 0, 1, 1,
0.01952094, -0.08645687, 3.073749, 0, 0, 0, 1, 1,
0.01957852, -0.1801955, 2.322514, 0, 0, 0, 1, 1,
0.02242753, 1.344681, -0.3137049, 0, 0, 0, 1, 1,
0.02250668, -0.3796378, 3.771379, 0, 0, 0, 1, 1,
0.02383746, 1.289792, 1.740468, 0, 0, 0, 1, 1,
0.02519928, 0.8502182, 0.7450473, 0, 0, 0, 1, 1,
0.02573495, 0.7308989, 2.849833, 1, 1, 1, 1, 1,
0.02667889, -0.1370715, 2.690907, 1, 1, 1, 1, 1,
0.02769561, -0.9505467, 2.521903, 1, 1, 1, 1, 1,
0.0292869, -0.4941223, 0.7821772, 1, 1, 1, 1, 1,
0.03523324, 1.059057, -0.5485151, 1, 1, 1, 1, 1,
0.04118165, 1.896112, 1.014786, 1, 1, 1, 1, 1,
0.0411818, 1.700768, -0.5758367, 1, 1, 1, 1, 1,
0.04650416, -0.2442559, 5.030058, 1, 1, 1, 1, 1,
0.04868363, -1.705318, 4.378697, 1, 1, 1, 1, 1,
0.04893816, 0.7136745, 0.3613364, 1, 1, 1, 1, 1,
0.05447165, -0.5099645, 1.708467, 1, 1, 1, 1, 1,
0.05822641, 1.242087, -0.8716682, 1, 1, 1, 1, 1,
0.05960708, -0.3056924, 3.452126, 1, 1, 1, 1, 1,
0.0605981, -0.4340762, 3.33005, 1, 1, 1, 1, 1,
0.06193215, -0.6625327, 2.165535, 1, 1, 1, 1, 1,
0.06307144, 0.219765, -1.533364, 0, 0, 1, 1, 1,
0.06327586, 2.056836, -0.2253693, 1, 0, 0, 1, 1,
0.06384473, 0.6624712, 0.1139234, 1, 0, 0, 1, 1,
0.06604257, 0.5383735, 1.888654, 1, 0, 0, 1, 1,
0.06681086, 1.621992, 0.3361685, 1, 0, 0, 1, 1,
0.0686919, -0.4566977, 2.340801, 1, 0, 0, 1, 1,
0.07204976, -0.3862044, 3.738131, 0, 0, 0, 1, 1,
0.07486125, -0.8430201, 4.306828, 0, 0, 0, 1, 1,
0.07761414, -0.5967393, 3.664461, 0, 0, 0, 1, 1,
0.07775846, 0.1571378, -0.8124388, 0, 0, 0, 1, 1,
0.0789128, -0.4808081, 4.424198, 0, 0, 0, 1, 1,
0.07916699, 0.5973734, -0.04371418, 0, 0, 0, 1, 1,
0.07966164, 0.01749805, 0.3222365, 0, 0, 0, 1, 1,
0.09044489, 0.4197288, -0.8040736, 1, 1, 1, 1, 1,
0.09491903, 1.055858, -1.013572, 1, 1, 1, 1, 1,
0.1008587, 0.2334663, 0.9711459, 1, 1, 1, 1, 1,
0.1025274, -0.9821095, 1.742854, 1, 1, 1, 1, 1,
0.1055021, 1.252777, 0.7699761, 1, 1, 1, 1, 1,
0.107236, 0.0991425, -1.627863, 1, 1, 1, 1, 1,
0.1087348, 0.8399783, 0.8504497, 1, 1, 1, 1, 1,
0.1105498, -0.3765204, 4.379236, 1, 1, 1, 1, 1,
0.1113028, 1.129048, 0.4076521, 1, 1, 1, 1, 1,
0.1114485, -0.6910138, 2.896031, 1, 1, 1, 1, 1,
0.1120721, 0.4890815, -1.292327, 1, 1, 1, 1, 1,
0.1161074, -1.07028, 4.184651, 1, 1, 1, 1, 1,
0.1192599, -0.08494211, 3.445765, 1, 1, 1, 1, 1,
0.1193687, -1.216213, 2.895878, 1, 1, 1, 1, 1,
0.1195414, -0.3257759, 3.625892, 1, 1, 1, 1, 1,
0.1224569, 0.94113, 0.3156608, 0, 0, 1, 1, 1,
0.1235166, 0.8628111, 0.4687139, 1, 0, 0, 1, 1,
0.1247516, -0.2864655, 3.235792, 1, 0, 0, 1, 1,
0.1257072, 0.4136414, 1.684245, 1, 0, 0, 1, 1,
0.1257592, 0.4182959, -0.2577233, 1, 0, 0, 1, 1,
0.1382085, 1.204793, -0.2767441, 1, 0, 0, 1, 1,
0.1382737, -0.5974306, 4.896124, 0, 0, 0, 1, 1,
0.1431028, 1.342234, -0.7882475, 0, 0, 0, 1, 1,
0.14577, 0.4521788, 0.2030151, 0, 0, 0, 1, 1,
0.1458387, -0.6800493, 2.285356, 0, 0, 0, 1, 1,
0.1488658, 0.06200087, 1.240278, 0, 0, 0, 1, 1,
0.151389, 0.1370379, 2.886574, 0, 0, 0, 1, 1,
0.1533607, -0.7841965, 3.104704, 0, 0, 0, 1, 1,
0.1538974, 0.09141427, 2.210939, 1, 1, 1, 1, 1,
0.1549532, -1.143922, 2.76494, 1, 1, 1, 1, 1,
0.1611185, 0.258762, -0.9661236, 1, 1, 1, 1, 1,
0.1642948, 1.343103, -1.015837, 1, 1, 1, 1, 1,
0.1652663, -1.751162, 3.73929, 1, 1, 1, 1, 1,
0.1698919, 1.039152, 1.570823, 1, 1, 1, 1, 1,
0.1859692, 1.476852, 0.3337483, 1, 1, 1, 1, 1,
0.1867676, 1.835591, -0.1431609, 1, 1, 1, 1, 1,
0.1891457, -0.1996328, 3.772399, 1, 1, 1, 1, 1,
0.1906275, -0.3356416, 0.6362656, 1, 1, 1, 1, 1,
0.19167, 1.076425, 0.6922447, 1, 1, 1, 1, 1,
0.1977501, -0.407346, 0.2518989, 1, 1, 1, 1, 1,
0.2008044, 0.2643583, 0.4382472, 1, 1, 1, 1, 1,
0.2013699, 0.2096617, 0.00813932, 1, 1, 1, 1, 1,
0.2048996, 0.3621368, -0.1290297, 1, 1, 1, 1, 1,
0.205994, 0.3364942, 2.231925, 0, 0, 1, 1, 1,
0.2071626, -0.9184166, 3.47133, 1, 0, 0, 1, 1,
0.208592, 1.623923, 1.388702, 1, 0, 0, 1, 1,
0.211248, -0.5327992, 2.086172, 1, 0, 0, 1, 1,
0.2113374, 0.394645, 0.4573771, 1, 0, 0, 1, 1,
0.2141307, 0.4290779, -0.1375637, 1, 0, 0, 1, 1,
0.217686, -0.5848032, 1.881312, 0, 0, 0, 1, 1,
0.2229904, 0.9235824, 1.305785, 0, 0, 0, 1, 1,
0.2233216, -2.06319, 1.463518, 0, 0, 0, 1, 1,
0.2250686, -0.4339584, 2.412601, 0, 0, 0, 1, 1,
0.2258656, -0.7855412, 4.819962, 0, 0, 0, 1, 1,
0.2334073, -0.6651455, 1.765548, 0, 0, 0, 1, 1,
0.2350612, -0.1835005, 2.405853, 0, 0, 0, 1, 1,
0.2448839, 0.6015827, 0.8332032, 1, 1, 1, 1, 1,
0.2506931, 1.59396, -1.072167, 1, 1, 1, 1, 1,
0.2544229, 1.658191, -0.741105, 1, 1, 1, 1, 1,
0.2603948, 0.4760474, 0.8598157, 1, 1, 1, 1, 1,
0.2638389, -0.09642309, 2.553418, 1, 1, 1, 1, 1,
0.2639152, 1.111119, 0.866152, 1, 1, 1, 1, 1,
0.2644542, 0.7488825, 1.441746, 1, 1, 1, 1, 1,
0.2713035, 0.1610703, 0.2132854, 1, 1, 1, 1, 1,
0.2729568, -0.8938668, 3.417792, 1, 1, 1, 1, 1,
0.2744349, -1.212713, 0.2831461, 1, 1, 1, 1, 1,
0.2746827, 1.758589, 0.9871065, 1, 1, 1, 1, 1,
0.2785678, 0.06776841, 1.269051, 1, 1, 1, 1, 1,
0.2818564, 1.286409, 0.7520753, 1, 1, 1, 1, 1,
0.2820656, -0.6305452, 3.16837, 1, 1, 1, 1, 1,
0.2822347, 0.6532153, 0.7179554, 1, 1, 1, 1, 1,
0.2862221, 0.1704229, 0.8497998, 0, 0, 1, 1, 1,
0.2886495, 0.1154626, 0.8328973, 1, 0, 0, 1, 1,
0.2948039, -2.366921, 3.177164, 1, 0, 0, 1, 1,
0.2959704, 0.8895817, 0.6163414, 1, 0, 0, 1, 1,
0.2970812, -0.607422, 2.757662, 1, 0, 0, 1, 1,
0.2975369, 1.21836, 0.2735421, 1, 0, 0, 1, 1,
0.3059295, 0.569892, 0.9403325, 0, 0, 0, 1, 1,
0.3071714, -1.543556, 3.112563, 0, 0, 0, 1, 1,
0.3125553, 0.0757045, 0.4825801, 0, 0, 0, 1, 1,
0.3144937, 1.285917, -1.064531, 0, 0, 0, 1, 1,
0.3161153, 1.085362, -1.648316, 0, 0, 0, 1, 1,
0.3216116, 0.1662478, 2.544147, 0, 0, 0, 1, 1,
0.3241761, 0.1556156, -0.5908647, 0, 0, 0, 1, 1,
0.3342668, -0.8279005, 1.947407, 1, 1, 1, 1, 1,
0.3343371, 0.02022982, 2.320392, 1, 1, 1, 1, 1,
0.3359123, 1.003086, -0.5959435, 1, 1, 1, 1, 1,
0.3370723, -0.2720046, 2.362918, 1, 1, 1, 1, 1,
0.3413037, 0.1284166, 0.8463551, 1, 1, 1, 1, 1,
0.3418957, -0.6405414, 2.271595, 1, 1, 1, 1, 1,
0.3421394, 0.2662555, 2.257325, 1, 1, 1, 1, 1,
0.3471355, -0.7783158, 0.841895, 1, 1, 1, 1, 1,
0.3521024, 0.1778653, -1.424146, 1, 1, 1, 1, 1,
0.3568531, -1.60081, 3.144226, 1, 1, 1, 1, 1,
0.3571736, 2.670358, -1.143577, 1, 1, 1, 1, 1,
0.3578675, -0.4257923, 2.323637, 1, 1, 1, 1, 1,
0.3639701, 0.6947826, 1.113752, 1, 1, 1, 1, 1,
0.3652191, -0.856398, 2.470172, 1, 1, 1, 1, 1,
0.3659807, -1.408944, 2.533753, 1, 1, 1, 1, 1,
0.3684348, -1.285099, 2.183918, 0, 0, 1, 1, 1,
0.371359, -0.01388337, 4.173527, 1, 0, 0, 1, 1,
0.3729786, 3.338414, -0.3399182, 1, 0, 0, 1, 1,
0.3737617, -2.061407, 3.839464, 1, 0, 0, 1, 1,
0.3739396, 0.5815906, 1.108413, 1, 0, 0, 1, 1,
0.3765847, -1.035786, 1.783868, 1, 0, 0, 1, 1,
0.3777649, -0.5342405, 3.51134, 0, 0, 0, 1, 1,
0.3780493, -0.9126917, 3.651564, 0, 0, 0, 1, 1,
0.3782668, -0.285119, 1.890986, 0, 0, 0, 1, 1,
0.3810849, 1.250909, 0.583272, 0, 0, 0, 1, 1,
0.3820829, -1.666446, 3.094277, 0, 0, 0, 1, 1,
0.3827842, -0.805679, 0.9887785, 0, 0, 0, 1, 1,
0.3853487, -0.8700983, 2.803135, 0, 0, 0, 1, 1,
0.3854374, -0.9871292, 1.357824, 1, 1, 1, 1, 1,
0.3981183, -1.583117, 2.469389, 1, 1, 1, 1, 1,
0.3989136, 1.426757, 0.1471471, 1, 1, 1, 1, 1,
0.4060179, 0.6092055, 0.2811182, 1, 1, 1, 1, 1,
0.4064085, 0.2902521, 1.602944, 1, 1, 1, 1, 1,
0.4083946, -0.1867281, 1.754749, 1, 1, 1, 1, 1,
0.4160969, 1.411493, -0.1676575, 1, 1, 1, 1, 1,
0.4169527, -0.5886569, 1.354681, 1, 1, 1, 1, 1,
0.4177256, -1.344117, 1.644728, 1, 1, 1, 1, 1,
0.4183722, -0.4003603, 0.7464443, 1, 1, 1, 1, 1,
0.4190642, -0.3767445, 2.759323, 1, 1, 1, 1, 1,
0.4211003, 0.07388316, 1.530565, 1, 1, 1, 1, 1,
0.4216194, -0.03776318, 3.047225, 1, 1, 1, 1, 1,
0.4254969, 1.270947, 0.4006263, 1, 1, 1, 1, 1,
0.4315467, 0.216342, 1.765824, 1, 1, 1, 1, 1,
0.4465348, -0.6971211, 1.65281, 0, 0, 1, 1, 1,
0.452246, -1.075125, 2.498124, 1, 0, 0, 1, 1,
0.4525636, 0.1560278, 1.919208, 1, 0, 0, 1, 1,
0.4560432, 1.175768, 0.06653318, 1, 0, 0, 1, 1,
0.4611959, -1.204723, 1.545729, 1, 0, 0, 1, 1,
0.4624842, 0.2107563, 0.7389432, 1, 0, 0, 1, 1,
0.4667044, 0.3111944, 1.976735, 0, 0, 0, 1, 1,
0.4681462, -2.646157, 3.538808, 0, 0, 0, 1, 1,
0.4733624, -0.5381335, 1.499684, 0, 0, 0, 1, 1,
0.4797864, -1.481684, 3.079112, 0, 0, 0, 1, 1,
0.4816329, -0.9945702, 3.116886, 0, 0, 0, 1, 1,
0.484091, 0.6429917, 0.8384699, 0, 0, 0, 1, 1,
0.4861942, -0.3953269, 1.706367, 0, 0, 0, 1, 1,
0.4866751, 1.07862, 1.679204, 1, 1, 1, 1, 1,
0.4903554, 0.9624654, -0.7080387, 1, 1, 1, 1, 1,
0.4903688, -0.3365848, 1.702788, 1, 1, 1, 1, 1,
0.5024733, -0.5845278, 2.477081, 1, 1, 1, 1, 1,
0.505387, 2.201924, -0.1888951, 1, 1, 1, 1, 1,
0.5063548, -0.3340392, 0.353805, 1, 1, 1, 1, 1,
0.5063635, 1.986827, 1.877697, 1, 1, 1, 1, 1,
0.5108348, -0.2768659, -0.3712193, 1, 1, 1, 1, 1,
0.5196766, 0.8660043, -0.7476614, 1, 1, 1, 1, 1,
0.5233539, 0.1832711, -1.027151, 1, 1, 1, 1, 1,
0.5274867, -0.8972976, 3.643805, 1, 1, 1, 1, 1,
0.5297134, -0.6478431, 3.067951, 1, 1, 1, 1, 1,
0.5358059, 0.5583366, 0.7917692, 1, 1, 1, 1, 1,
0.5373772, 0.2749072, -1.375292, 1, 1, 1, 1, 1,
0.5429918, -1.061872, 1.176975, 1, 1, 1, 1, 1,
0.545074, -1.659309, 1.45557, 0, 0, 1, 1, 1,
0.5506595, -0.7561677, 3.267123, 1, 0, 0, 1, 1,
0.5518899, 1.572444, 2.002251, 1, 0, 0, 1, 1,
0.5520303, -0.7765347, 2.781986, 1, 0, 0, 1, 1,
0.5559129, 0.6104571, -0.1419627, 1, 0, 0, 1, 1,
0.5603413, 1.284265, 0.1753782, 1, 0, 0, 1, 1,
0.5622534, 0.1187368, 0.9119008, 0, 0, 0, 1, 1,
0.5650673, 0.126168, 1.447911, 0, 0, 0, 1, 1,
0.5665561, -0.06605183, 1.967239, 0, 0, 0, 1, 1,
0.5666447, 1.355795, 0.5575276, 0, 0, 0, 1, 1,
0.5681623, 1.068125, 1.276587, 0, 0, 0, 1, 1,
0.5716032, -0.4699389, 3.555288, 0, 0, 0, 1, 1,
0.5763936, -0.1023408, 2.568377, 0, 0, 0, 1, 1,
0.5836477, 1.930211, 1.374639, 1, 1, 1, 1, 1,
0.5850371, 0.1275465, 1.071514, 1, 1, 1, 1, 1,
0.5922013, -0.7637928, 3.373526, 1, 1, 1, 1, 1,
0.5925272, 0.6761771, 0.6823394, 1, 1, 1, 1, 1,
0.595264, 0.6476352, 1.516, 1, 1, 1, 1, 1,
0.6022689, 0.3330477, 1.295427, 1, 1, 1, 1, 1,
0.6063638, -0.5524504, 2.261858, 1, 1, 1, 1, 1,
0.6096575, 0.04528664, 0.7571599, 1, 1, 1, 1, 1,
0.611302, -1.118309, 1.902446, 1, 1, 1, 1, 1,
0.6121945, 1.178036, 0.9918686, 1, 1, 1, 1, 1,
0.6125833, -0.8596494, 3.833317, 1, 1, 1, 1, 1,
0.6200626, -0.01313095, 2.079414, 1, 1, 1, 1, 1,
0.6239229, 0.5454388, 1.973706, 1, 1, 1, 1, 1,
0.6251599, 1.973714, -1.237972, 1, 1, 1, 1, 1,
0.627121, 1.838828, 1.189974, 1, 1, 1, 1, 1,
0.6336004, 1.207235, -1.826599, 0, 0, 1, 1, 1,
0.6338159, -0.7827358, 2.785991, 1, 0, 0, 1, 1,
0.6404536, -1.705328, 3.41062, 1, 0, 0, 1, 1,
0.6417189, -0.187043, 0.6437875, 1, 0, 0, 1, 1,
0.6453214, -0.9396994, 0.5967289, 1, 0, 0, 1, 1,
0.6536701, -0.02810957, 0.9319564, 1, 0, 0, 1, 1,
0.6537217, -0.6560162, 0.8726774, 0, 0, 0, 1, 1,
0.6635399, 0.02153223, 3.619307, 0, 0, 0, 1, 1,
0.6654287, 0.5463341, 0.6483319, 0, 0, 0, 1, 1,
0.6690171, 0.2223241, 0.2607128, 0, 0, 0, 1, 1,
0.6702835, 1.258365, 0.5992633, 0, 0, 0, 1, 1,
0.6722895, -0.3231129, 2.368031, 0, 0, 0, 1, 1,
0.675429, 1.359963, 0.9063207, 0, 0, 0, 1, 1,
0.6773213, 0.01763012, 0.9613023, 1, 1, 1, 1, 1,
0.6805288, 2.281945, 1.154573, 1, 1, 1, 1, 1,
0.6834477, 0.08744782, -1.107239, 1, 1, 1, 1, 1,
0.6851822, -0.2112649, 3.751594, 1, 1, 1, 1, 1,
0.6907539, -1.1347, 2.85896, 1, 1, 1, 1, 1,
0.6948709, -0.1009366, 2.251364, 1, 1, 1, 1, 1,
0.6949292, 0.07403425, 1.111958, 1, 1, 1, 1, 1,
0.6985155, -0.2824602, 0.9625972, 1, 1, 1, 1, 1,
0.7032973, 1.163942, -0.5964543, 1, 1, 1, 1, 1,
0.7049745, 0.007827601, 2.298978, 1, 1, 1, 1, 1,
0.7070817, 0.9200758, 0.8206809, 1, 1, 1, 1, 1,
0.708458, -0.883213, 3.065609, 1, 1, 1, 1, 1,
0.7102038, -0.1132294, 0.9426364, 1, 1, 1, 1, 1,
0.712472, 0.3497765, 1.414629, 1, 1, 1, 1, 1,
0.7134189, -1.256492, 3.890125, 1, 1, 1, 1, 1,
0.7188598, 0.5833679, 0.4358201, 0, 0, 1, 1, 1,
0.7223306, 0.1219889, 1.412527, 1, 0, 0, 1, 1,
0.7279957, -2.128922, 3.803993, 1, 0, 0, 1, 1,
0.7322357, 1.096319, -0.07014646, 1, 0, 0, 1, 1,
0.737505, 0.3115874, 0.6545863, 1, 0, 0, 1, 1,
0.743816, 0.602576, 0.4694528, 1, 0, 0, 1, 1,
0.7445949, -1.194018, 2.652518, 0, 0, 0, 1, 1,
0.7446426, 0.1537635, 1.222182, 0, 0, 0, 1, 1,
0.7462342, 0.9230194, 0.1947, 0, 0, 0, 1, 1,
0.7522822, -1.470031, 2.914145, 0, 0, 0, 1, 1,
0.7553352, -0.4913365, 1.31567, 0, 0, 0, 1, 1,
0.7596359, -1.379752, 2.127793, 0, 0, 0, 1, 1,
0.7612991, 0.2124993, 2.135748, 0, 0, 0, 1, 1,
0.7628141, 1.326955, 1.005098, 1, 1, 1, 1, 1,
0.7667369, 0.2432944, 2.023049, 1, 1, 1, 1, 1,
0.7712276, -2.425648, 3.638519, 1, 1, 1, 1, 1,
0.7716694, 0.7642432, 0.95069, 1, 1, 1, 1, 1,
0.7734559, 0.682216, -0.6365905, 1, 1, 1, 1, 1,
0.7738923, 0.05271853, 1.645348, 1, 1, 1, 1, 1,
0.7801782, 0.2912816, 3.392868, 1, 1, 1, 1, 1,
0.7828981, -1.138671, 1.197359, 1, 1, 1, 1, 1,
0.7832068, -1.573467, 2.014516, 1, 1, 1, 1, 1,
0.7836199, -0.9158962, 2.84052, 1, 1, 1, 1, 1,
0.7841622, -0.8834011, 3.347484, 1, 1, 1, 1, 1,
0.7886056, 1.812595, 2.137321, 1, 1, 1, 1, 1,
0.7914083, 1.237513, 0.1681257, 1, 1, 1, 1, 1,
0.7925378, 0.1090913, 1.812341, 1, 1, 1, 1, 1,
0.8015561, -2.443904, 1.431695, 1, 1, 1, 1, 1,
0.802554, -0.1262571, 1.205749, 0, 0, 1, 1, 1,
0.8089637, -0.4494471, 1.465805, 1, 0, 0, 1, 1,
0.8105535, 0.5670782, -0.5481722, 1, 0, 0, 1, 1,
0.8109254, -0.764028, 3.119914, 1, 0, 0, 1, 1,
0.812757, -0.571817, 1.307319, 1, 0, 0, 1, 1,
0.8141218, -0.3962983, 1.136314, 1, 0, 0, 1, 1,
0.8161031, 0.5670632, 0.8308187, 0, 0, 0, 1, 1,
0.8162816, 0.4819146, 0.7820383, 0, 0, 0, 1, 1,
0.8174049, 0.2575132, 3.007746, 0, 0, 0, 1, 1,
0.8220666, -0.2726928, 0.7366542, 0, 0, 0, 1, 1,
0.8325728, 0.4812638, 0.6871343, 0, 0, 0, 1, 1,
0.8363414, 1.522869, 1.850473, 0, 0, 0, 1, 1,
0.8391557, -0.8643586, 3.556685, 0, 0, 0, 1, 1,
0.8434904, 0.4189236, 1.124481, 1, 1, 1, 1, 1,
0.847642, -0.7267185, 0.8586125, 1, 1, 1, 1, 1,
0.8479524, -0.4904292, 1.03472, 1, 1, 1, 1, 1,
0.8491648, 0.006440629, -0.4591614, 1, 1, 1, 1, 1,
0.8505552, -0.07025316, 0.5669295, 1, 1, 1, 1, 1,
0.8527975, 0.5058907, 2.003201, 1, 1, 1, 1, 1,
0.8530579, 0.205046, 0.2950189, 1, 1, 1, 1, 1,
0.8632454, 0.5067796, 2.106988, 1, 1, 1, 1, 1,
0.8634151, 1.000185, 0.5703695, 1, 1, 1, 1, 1,
0.8645234, -1.879075, 3.742017, 1, 1, 1, 1, 1,
0.8683468, 0.0188264, 1.335826, 1, 1, 1, 1, 1,
0.8699459, 0.5941638, 0.5868528, 1, 1, 1, 1, 1,
0.8765829, 0.7847139, 0.259425, 1, 1, 1, 1, 1,
0.8766987, -0.6509191, 2.570153, 1, 1, 1, 1, 1,
0.8893495, 1.488004, 1.041559, 1, 1, 1, 1, 1,
0.8947358, 2.147015, 0.1647974, 0, 0, 1, 1, 1,
0.8966696, 0.6348988, -0.5404465, 1, 0, 0, 1, 1,
0.8994823, 0.2239033, 1.690232, 1, 0, 0, 1, 1,
0.9007545, -0.1607266, 3.105792, 1, 0, 0, 1, 1,
0.9010483, 0.3056814, 3.112947, 1, 0, 0, 1, 1,
0.903733, -1.77462, 3.343888, 1, 0, 0, 1, 1,
0.9104562, 1.665091, -0.685575, 0, 0, 0, 1, 1,
0.9196288, 0.1532934, 1.877682, 0, 0, 0, 1, 1,
0.9296575, -0.5885555, 1.117657, 0, 0, 0, 1, 1,
0.9330066, 0.2988329, 1.813997, 0, 0, 0, 1, 1,
0.9351958, 1.563085, -0.6220743, 0, 0, 0, 1, 1,
0.9403991, 0.3019117, -0.4936334, 0, 0, 0, 1, 1,
0.9436656, 0.1503195, -1.216233, 0, 0, 0, 1, 1,
0.9454659, 0.5719311, 1.773896, 1, 1, 1, 1, 1,
0.955345, 0.1474765, 1.534772, 1, 1, 1, 1, 1,
0.9564459, 1.196047, 2.046151, 1, 1, 1, 1, 1,
0.9645674, 0.8298284, 2.436847, 1, 1, 1, 1, 1,
0.9725119, -2.191176, 2.286631, 1, 1, 1, 1, 1,
0.9740011, -1.480311, 5.311119, 1, 1, 1, 1, 1,
0.9743727, -0.7297473, 1.321902, 1, 1, 1, 1, 1,
0.9790398, 0.1469885, 1.107655, 1, 1, 1, 1, 1,
0.9796122, 0.2410986, 1.754004, 1, 1, 1, 1, 1,
0.980585, -2.061086, 2.978506, 1, 1, 1, 1, 1,
0.9815192, 1.474698, 1.084144, 1, 1, 1, 1, 1,
0.9852753, 0.3670604, 1.879368, 1, 1, 1, 1, 1,
0.9878151, 0.1901862, 2.240583, 1, 1, 1, 1, 1,
1.001889, 0.6284738, 0.8419476, 1, 1, 1, 1, 1,
1.004068, 0.2620066, 1.123414, 1, 1, 1, 1, 1,
1.004767, -0.5937987, 3.001688, 0, 0, 1, 1, 1,
1.006084, 1.130258, 0.2959117, 1, 0, 0, 1, 1,
1.008759, 0.6675906, 1.11025, 1, 0, 0, 1, 1,
1.025577, -1.318139, 0.5330562, 1, 0, 0, 1, 1,
1.026374, 0.7207255, 1.794579, 1, 0, 0, 1, 1,
1.028567, -0.8346964, 1.318695, 1, 0, 0, 1, 1,
1.029459, 0.3421865, 1.563038, 0, 0, 0, 1, 1,
1.029923, -1.212754, 0.561433, 0, 0, 0, 1, 1,
1.031408, 0.09265561, 2.05797, 0, 0, 0, 1, 1,
1.032261, 0.9629824, 1.715439, 0, 0, 0, 1, 1,
1.034531, -0.9907932, 3.27201, 0, 0, 0, 1, 1,
1.034723, 0.1945821, 0.8154905, 0, 0, 0, 1, 1,
1.039438, 0.8143548, 0.7463653, 0, 0, 0, 1, 1,
1.040421, -0.9055371, 1.619054, 1, 1, 1, 1, 1,
1.053575, -0.5311496, 1.017468, 1, 1, 1, 1, 1,
1.057389, -0.614092, 0.9037008, 1, 1, 1, 1, 1,
1.057679, -0.08512081, 1.288482, 1, 1, 1, 1, 1,
1.062745, 1.101927, 2.114275, 1, 1, 1, 1, 1,
1.064579, 0.05558193, 0.0498067, 1, 1, 1, 1, 1,
1.065555, -0.6387769, 4.273414, 1, 1, 1, 1, 1,
1.074802, 0.7910873, 1.392942, 1, 1, 1, 1, 1,
1.075817, 1.39467, 0.6046543, 1, 1, 1, 1, 1,
1.079422, 1.791008, -0.4042462, 1, 1, 1, 1, 1,
1.0828, 1.034724, -0.06210639, 1, 1, 1, 1, 1,
1.083056, -1.354448, 1.41987, 1, 1, 1, 1, 1,
1.094635, 1.239018, 0.7972407, 1, 1, 1, 1, 1,
1.107736, -0.5355897, 1.861134, 1, 1, 1, 1, 1,
1.108027, 1.501012, 1.413835, 1, 1, 1, 1, 1,
1.119285, -0.1678175, 1.757594, 0, 0, 1, 1, 1,
1.137614, 1.101983, -1.164445, 1, 0, 0, 1, 1,
1.142922, -0.55368, 2.525123, 1, 0, 0, 1, 1,
1.148637, 1.114879, 0.935977, 1, 0, 0, 1, 1,
1.157935, 0.6525007, 2.029565, 1, 0, 0, 1, 1,
1.157943, 0.6166968, 2.23337, 1, 0, 0, 1, 1,
1.162656, -0.7153854, 1.527521, 0, 0, 0, 1, 1,
1.172005, 1.192038, 1.592905, 0, 0, 0, 1, 1,
1.174147, 2.525291, -1.6241, 0, 0, 0, 1, 1,
1.17642, -0.7916961, 2.394536, 0, 0, 0, 1, 1,
1.182325, -0.06748503, -0.9194676, 0, 0, 0, 1, 1,
1.183987, -0.01431898, 3.374569, 0, 0, 0, 1, 1,
1.191491, -1.219566, 1.656519, 0, 0, 0, 1, 1,
1.201678, -0.6572614, 3.526738, 1, 1, 1, 1, 1,
1.202728, -0.2460587, 2.443714, 1, 1, 1, 1, 1,
1.203242, 0.1925034, 0.5288721, 1, 1, 1, 1, 1,
1.204774, 0.6230009, 1.159458, 1, 1, 1, 1, 1,
1.212093, -0.1074146, 3.931532, 1, 1, 1, 1, 1,
1.214333, 0.06768204, 1.094606, 1, 1, 1, 1, 1,
1.217438, 0.5314633, 2.613806, 1, 1, 1, 1, 1,
1.224475, 0.4704859, 0.7483366, 1, 1, 1, 1, 1,
1.226818, 2.303711, -1.281653, 1, 1, 1, 1, 1,
1.232706, 1.749396, 1.620199, 1, 1, 1, 1, 1,
1.237245, -1.435926, 2.022698, 1, 1, 1, 1, 1,
1.239813, -1.134638, 2.870725, 1, 1, 1, 1, 1,
1.240201, 0.3496636, 1.948254, 1, 1, 1, 1, 1,
1.24083, -1.324419, 2.635609, 1, 1, 1, 1, 1,
1.242975, 0.4872397, 2.012991, 1, 1, 1, 1, 1,
1.255189, -0.09471306, 1.169233, 0, 0, 1, 1, 1,
1.257004, 0.4475194, 0.7672611, 1, 0, 0, 1, 1,
1.263257, 0.34328, 1.144934, 1, 0, 0, 1, 1,
1.265814, -1.216848, 2.689378, 1, 0, 0, 1, 1,
1.270417, 0.1885976, 0.7420042, 1, 0, 0, 1, 1,
1.270446, 0.04873756, 2.235751, 1, 0, 0, 1, 1,
1.276598, 0.5652512, 1.215712, 0, 0, 0, 1, 1,
1.285328, 0.4265347, 0.7784233, 0, 0, 0, 1, 1,
1.287788, 0.2593355, 1.619265, 0, 0, 0, 1, 1,
1.296698, -0.8184574, 1.58849, 0, 0, 0, 1, 1,
1.301599, -1.575981, 4.586904, 0, 0, 0, 1, 1,
1.310112, 2.077132, 0.02352301, 0, 0, 0, 1, 1,
1.31111, 2.078077, 1.427571, 0, 0, 0, 1, 1,
1.313816, -0.4271955, 2.52716, 1, 1, 1, 1, 1,
1.318911, 1.329648, 1.03474, 1, 1, 1, 1, 1,
1.329489, 1.266088, 0.6329989, 1, 1, 1, 1, 1,
1.331463, -0.8792775, 1.366504, 1, 1, 1, 1, 1,
1.334351, 2.263468, -0.4647216, 1, 1, 1, 1, 1,
1.353374, -0.3710352, 1.427348, 1, 1, 1, 1, 1,
1.359661, -0.3242226, 2.634443, 1, 1, 1, 1, 1,
1.365903, 0.3731261, 2.72356, 1, 1, 1, 1, 1,
1.381566, -0.1247706, 3.239458, 1, 1, 1, 1, 1,
1.390186, 0.3079107, 2.008335, 1, 1, 1, 1, 1,
1.391014, -1.133906, 3.297777, 1, 1, 1, 1, 1,
1.407787, 0.4456054, 2.253286, 1, 1, 1, 1, 1,
1.420614, -0.2472935, 2.892532, 1, 1, 1, 1, 1,
1.429216, 1.176747, 1.293807, 1, 1, 1, 1, 1,
1.440836, 1.044176, 1.338737, 1, 1, 1, 1, 1,
1.451128, -0.3357415, 1.666849, 0, 0, 1, 1, 1,
1.452396, 1.559366, 0.6195793, 1, 0, 0, 1, 1,
1.452666, -0.3243469, 1.095807, 1, 0, 0, 1, 1,
1.453277, 0.7535897, 1.208443, 1, 0, 0, 1, 1,
1.455212, 2.54089, -1.014099, 1, 0, 0, 1, 1,
1.464286, -0.6184058, 1.447625, 1, 0, 0, 1, 1,
1.466856, -0.9889091, 3.909354, 0, 0, 0, 1, 1,
1.47427, -1.105861, 1.811885, 0, 0, 0, 1, 1,
1.475798, 0.5000508, 0.7954905, 0, 0, 0, 1, 1,
1.482225, 0.4353717, 0.8540455, 0, 0, 0, 1, 1,
1.482452, 0.2043839, 3.594127, 0, 0, 0, 1, 1,
1.483723, 0.6539928, 2.249619, 0, 0, 0, 1, 1,
1.485981, 1.417827, 1.028626, 0, 0, 0, 1, 1,
1.487273, 1.203876, 0.4786613, 1, 1, 1, 1, 1,
1.501076, -0.6035732, 3.507209, 1, 1, 1, 1, 1,
1.525178, 0.07480023, -0.2931978, 1, 1, 1, 1, 1,
1.526058, -0.6413931, 2.08831, 1, 1, 1, 1, 1,
1.531276, 0.9972275, 1.340744, 1, 1, 1, 1, 1,
1.5492, -0.5155942, 2.327682, 1, 1, 1, 1, 1,
1.552324, -0.6144816, 2.25438, 1, 1, 1, 1, 1,
1.575475, -0.1582044, 2.582128, 1, 1, 1, 1, 1,
1.577422, -0.09270789, 1.006695, 1, 1, 1, 1, 1,
1.583906, 0.4849249, -0.8128111, 1, 1, 1, 1, 1,
1.592097, -1.709932, 2.779488, 1, 1, 1, 1, 1,
1.609263, -1.021448, 3.177371, 1, 1, 1, 1, 1,
1.610423, 0.5276886, 1.238316, 1, 1, 1, 1, 1,
1.625421, 1.589093, 1.306189, 1, 1, 1, 1, 1,
1.633113, -0.7156815, 2.360843, 1, 1, 1, 1, 1,
1.65714, -0.2504998, 2.274827, 0, 0, 1, 1, 1,
1.659726, 0.555108, 2.603524, 1, 0, 0, 1, 1,
1.676791, 0.925703, -0.3690097, 1, 0, 0, 1, 1,
1.698576, 1.039242, 1.30672, 1, 0, 0, 1, 1,
1.701688, -1.229794, 2.585727, 1, 0, 0, 1, 1,
1.717365, 0.1514478, 2.166127, 1, 0, 0, 1, 1,
1.722854, 0.02358113, 0.8536875, 0, 0, 0, 1, 1,
1.727994, -0.1358712, 3.164393, 0, 0, 0, 1, 1,
1.741428, -2.062725, 1.505664, 0, 0, 0, 1, 1,
1.750429, -0.8748312, 0.3507975, 0, 0, 0, 1, 1,
1.773988, -0.0667325, 0.103071, 0, 0, 0, 1, 1,
1.775383, -0.03242071, 2.880633, 0, 0, 0, 1, 1,
1.777554, 0.4784389, 1.672651, 0, 0, 0, 1, 1,
1.786932, -0.26851, 0.5704166, 1, 1, 1, 1, 1,
1.791616, -1.086737, 0.466168, 1, 1, 1, 1, 1,
1.793743, -0.04472308, 3.376214, 1, 1, 1, 1, 1,
1.811098, -3.14005, 2.589996, 1, 1, 1, 1, 1,
1.822681, 0.006575111, 3.471748, 1, 1, 1, 1, 1,
1.832403, -1.508289, 3.767984, 1, 1, 1, 1, 1,
1.836871, -0.9104977, 2.499324, 1, 1, 1, 1, 1,
1.845064, -0.1047263, 1.412734, 1, 1, 1, 1, 1,
1.847165, 1.172259, 1.015885, 1, 1, 1, 1, 1,
1.855663, 1.752419, 0.7798928, 1, 1, 1, 1, 1,
1.857682, 1.688444, 2.002093, 1, 1, 1, 1, 1,
1.86869, -1.526941, 4.004784, 1, 1, 1, 1, 1,
1.882356, 0.3126639, 3.436584, 1, 1, 1, 1, 1,
1.882945, 0.3214496, 0.3458029, 1, 1, 1, 1, 1,
1.886898, 0.07444548, 0.4725449, 1, 1, 1, 1, 1,
1.896315, -0.6410197, 2.346382, 0, 0, 1, 1, 1,
1.920551, -0.4378106, 1.973328, 1, 0, 0, 1, 1,
1.929067, -2.406845, 3.501284, 1, 0, 0, 1, 1,
1.959922, -1.418722, 3.132882, 1, 0, 0, 1, 1,
1.996796, -1.049603, 3.255377, 1, 0, 0, 1, 1,
2.001329, 0.008609799, 1.133985, 1, 0, 0, 1, 1,
2.010463, -0.4041616, 2.279161, 0, 0, 0, 1, 1,
2.017955, -1.746006, 1.872405, 0, 0, 0, 1, 1,
2.125304, 1.324076, 0.4483863, 0, 0, 0, 1, 1,
2.13745, -0.5440522, 1.065897, 0, 0, 0, 1, 1,
2.152154, -0.2537595, 0.8798811, 0, 0, 0, 1, 1,
2.181491, 1.044822, -0.006815084, 0, 0, 0, 1, 1,
2.182786, 0.1352356, 0.7241731, 0, 0, 0, 1, 1,
2.312678, -0.7687885, 1.65878, 1, 1, 1, 1, 1,
2.317841, -0.5776886, 1.582438, 1, 1, 1, 1, 1,
2.365539, 0.9321649, 1.603749, 1, 1, 1, 1, 1,
2.395434, -0.1438487, 1.59448, 1, 1, 1, 1, 1,
2.721395, 0.1775019, 1.004668, 1, 1, 1, 1, 1,
2.981127, -1.289652, 2.620116, 1, 1, 1, 1, 1,
3.110951, -0.6434674, 2.658854, 1, 1, 1, 1, 1
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
var radius = 9.706924;
var distance = 34.09516;
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
mvMatrix.translate( -0.2019972, 0.1717319, 0.188885 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09516);
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