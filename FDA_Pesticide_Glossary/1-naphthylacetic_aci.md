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
-2.742154, -0.876997, -1.1049, 1, 0, 0, 1,
-2.720551, 1.144612, -1.338935, 1, 0.007843138, 0, 1,
-2.701251, 1.021918, -1.626179, 1, 0.01176471, 0, 1,
-2.601777, -1.367262, -1.681839, 1, 0.01960784, 0, 1,
-2.536709, -0.1828189, -0.1109756, 1, 0.02352941, 0, 1,
-2.489376, 0.03685397, -0.7014018, 1, 0.03137255, 0, 1,
-2.451745, 0.5573418, -0.1938987, 1, 0.03529412, 0, 1,
-2.434787, 0.3005203, -1.107484, 1, 0.04313726, 0, 1,
-2.392004, -0.8803101, -1.723669, 1, 0.04705882, 0, 1,
-2.308432, 0.5870248, -0.4500801, 1, 0.05490196, 0, 1,
-2.274894, 1.845002, -1.14035, 1, 0.05882353, 0, 1,
-2.225925, 0.5829461, -0.3538884, 1, 0.06666667, 0, 1,
-2.189766, 0.8874392, -1.432261, 1, 0.07058824, 0, 1,
-2.113343, -0.01654017, -3.595339, 1, 0.07843138, 0, 1,
-2.107836, 0.9361885, -3.427744, 1, 0.08235294, 0, 1,
-2.094693, 0.5444542, 0.3506791, 1, 0.09019608, 0, 1,
-2.09285, -1.21471, -0.7838258, 1, 0.09411765, 0, 1,
-2.084972, 1.634677, 0.1970778, 1, 0.1019608, 0, 1,
-2.060186, -0.6536117, -4.033147, 1, 0.1098039, 0, 1,
-2.04574, 0.2549382, 0.4236932, 1, 0.1137255, 0, 1,
-2.02843, -0.4212408, 0.4589162, 1, 0.1215686, 0, 1,
-2.007766, 0.7122553, -0.8918602, 1, 0.1254902, 0, 1,
-1.978969, 0.04315749, -0.169471, 1, 0.1333333, 0, 1,
-1.949275, -0.3685376, -2.090556, 1, 0.1372549, 0, 1,
-1.935326, 1.306378, -3.249206, 1, 0.145098, 0, 1,
-1.921598, -0.4280598, -2.534801, 1, 0.1490196, 0, 1,
-1.905098, -0.03942776, -1.217762, 1, 0.1568628, 0, 1,
-1.894176, -1.335189, -1.88429, 1, 0.1607843, 0, 1,
-1.864052, -0.8865896, -1.997164, 1, 0.1686275, 0, 1,
-1.85424, 0.9513421, -0.2202965, 1, 0.172549, 0, 1,
-1.838732, -0.5975848, -0.8032062, 1, 0.1803922, 0, 1,
-1.825707, -1.28019, -2.00591, 1, 0.1843137, 0, 1,
-1.776532, 0.1219771, -0.8767386, 1, 0.1921569, 0, 1,
-1.776181, -1.593, -2.125942, 1, 0.1960784, 0, 1,
-1.773455, 0.7723142, -0.02109721, 1, 0.2039216, 0, 1,
-1.772096, 0.8055204, 0.1714236, 1, 0.2117647, 0, 1,
-1.769263, -1.449994, -1.90538, 1, 0.2156863, 0, 1,
-1.73528, 1.682747, -0.182718, 1, 0.2235294, 0, 1,
-1.698948, -1.601709, -2.16805, 1, 0.227451, 0, 1,
-1.659355, 0.5859463, -0.1162823, 1, 0.2352941, 0, 1,
-1.649331, -0.3793719, -0.7578555, 1, 0.2392157, 0, 1,
-1.633088, -0.4933061, -0.958532, 1, 0.2470588, 0, 1,
-1.629389, -0.3397597, -1.998695, 1, 0.2509804, 0, 1,
-1.597335, 0.6369586, -2.818549, 1, 0.2588235, 0, 1,
-1.592459, -0.5057831, -1.099776, 1, 0.2627451, 0, 1,
-1.589795, -0.8093362, -2.598724, 1, 0.2705882, 0, 1,
-1.589484, -0.5981043, -2.569385, 1, 0.2745098, 0, 1,
-1.581988, -1.295946, -1.629596, 1, 0.282353, 0, 1,
-1.574449, 0.1222798, -1.13434, 1, 0.2862745, 0, 1,
-1.571075, 1.009853, -1.574366, 1, 0.2941177, 0, 1,
-1.570544, -1.857547, -2.555998, 1, 0.3019608, 0, 1,
-1.569115, -1.220437, -3.6414, 1, 0.3058824, 0, 1,
-1.557975, 0.4564946, -0.920733, 1, 0.3137255, 0, 1,
-1.552761, -1.314957, -2.211459, 1, 0.3176471, 0, 1,
-1.550031, 1.048602, -1.069137, 1, 0.3254902, 0, 1,
-1.504369, -1.123011, -2.801913, 1, 0.3294118, 0, 1,
-1.486946, -0.02279803, -3.080574, 1, 0.3372549, 0, 1,
-1.482632, 0.5346577, -2.329267, 1, 0.3411765, 0, 1,
-1.481741, 0.7636043, -0.9756595, 1, 0.3490196, 0, 1,
-1.474586, -1.91328, -1.289588, 1, 0.3529412, 0, 1,
-1.466897, 0.5891612, -1.103068, 1, 0.3607843, 0, 1,
-1.464037, 1.674311, -0.4898847, 1, 0.3647059, 0, 1,
-1.462324, -0.01299003, -2.506383, 1, 0.372549, 0, 1,
-1.45735, 1.341353, 0.354668, 1, 0.3764706, 0, 1,
-1.450874, -0.6870087, -2.307053, 1, 0.3843137, 0, 1,
-1.436875, 0.2775331, -1.064232, 1, 0.3882353, 0, 1,
-1.426317, -0.6378872, -1.285147, 1, 0.3960784, 0, 1,
-1.425004, 0.2198146, -3.131395, 1, 0.4039216, 0, 1,
-1.417837, -0.2668594, -2.264139, 1, 0.4078431, 0, 1,
-1.417272, -0.8005977, -3.510105, 1, 0.4156863, 0, 1,
-1.413248, -0.6466053, -2.801913, 1, 0.4196078, 0, 1,
-1.37299, 0.196454, -2.092776, 1, 0.427451, 0, 1,
-1.371096, 0.2932498, -0.3321969, 1, 0.4313726, 0, 1,
-1.367898, -0.3439584, -1.708672, 1, 0.4392157, 0, 1,
-1.364227, 0.1798054, -2.128671, 1, 0.4431373, 0, 1,
-1.360172, 1.431329, -1.107875, 1, 0.4509804, 0, 1,
-1.346513, 1.687525, -0.8426242, 1, 0.454902, 0, 1,
-1.331309, 2.074945, -0.7949184, 1, 0.4627451, 0, 1,
-1.326283, 0.7369738, -2.841018, 1, 0.4666667, 0, 1,
-1.321904, -0.543021, -2.638477, 1, 0.4745098, 0, 1,
-1.318978, 1.87257, -2.463423, 1, 0.4784314, 0, 1,
-1.31541, 0.9800917, 0.06572748, 1, 0.4862745, 0, 1,
-1.313787, -0.4410305, -2.879324, 1, 0.4901961, 0, 1,
-1.292947, 2.273645, -1.358624, 1, 0.4980392, 0, 1,
-1.292527, -0.313249, -2.314167, 1, 0.5058824, 0, 1,
-1.289387, 1.2013, -0.2558587, 1, 0.509804, 0, 1,
-1.28671, 0.2343136, -1.23709, 1, 0.5176471, 0, 1,
-1.285249, 0.3219861, -0.1504581, 1, 0.5215687, 0, 1,
-1.28074, 1.013747, -1.078209, 1, 0.5294118, 0, 1,
-1.278998, 0.4931686, -1.223641, 1, 0.5333334, 0, 1,
-1.277134, 0.3817195, -1.511149, 1, 0.5411765, 0, 1,
-1.269694, -2.228497, -1.962005, 1, 0.5450981, 0, 1,
-1.268255, -0.06535994, -1.864187, 1, 0.5529412, 0, 1,
-1.260398, -0.1750862, 0.2529351, 1, 0.5568628, 0, 1,
-1.254012, 1.973533, -1.779377, 1, 0.5647059, 0, 1,
-1.253964, 0.3156795, -1.531757, 1, 0.5686275, 0, 1,
-1.253877, 1.560212, -0.8346306, 1, 0.5764706, 0, 1,
-1.253692, 1.841278, -0.8666504, 1, 0.5803922, 0, 1,
-1.235727, -1.327301, -3.31013, 1, 0.5882353, 0, 1,
-1.235299, -1.154561, -2.945173, 1, 0.5921569, 0, 1,
-1.225897, -1.280292, -3.792917, 1, 0.6, 0, 1,
-1.219209, 0.8506835, -0.762903, 1, 0.6078432, 0, 1,
-1.217883, -0.6206664, -1.416508, 1, 0.6117647, 0, 1,
-1.214328, 0.01278387, -2.197458, 1, 0.6196079, 0, 1,
-1.203859, 0.06294862, -2.131733, 1, 0.6235294, 0, 1,
-1.203321, -0.7975574, -2.174655, 1, 0.6313726, 0, 1,
-1.200975, 0.3405823, -0.2088316, 1, 0.6352941, 0, 1,
-1.199491, -0.8177676, -2.948789, 1, 0.6431373, 0, 1,
-1.196864, -0.7532002, -2.073413, 1, 0.6470588, 0, 1,
-1.190433, -0.2050233, -1.548453, 1, 0.654902, 0, 1,
-1.190408, -2.231542, -1.45003, 1, 0.6588235, 0, 1,
-1.188369, 1.160555, -1.80537, 1, 0.6666667, 0, 1,
-1.187901, 1.045913, -0.3726504, 1, 0.6705883, 0, 1,
-1.182992, 0.2140433, -1.388168, 1, 0.6784314, 0, 1,
-1.174573, 0.3839636, -1.48457, 1, 0.682353, 0, 1,
-1.169799, -1.771532, -3.624142, 1, 0.6901961, 0, 1,
-1.169052, -0.9127812, -1.207454, 1, 0.6941177, 0, 1,
-1.163014, -0.8397759, -1.743257, 1, 0.7019608, 0, 1,
-1.161712, 0.6994506, -2.233213, 1, 0.7098039, 0, 1,
-1.134594, 0.269625, -0.6471384, 1, 0.7137255, 0, 1,
-1.134316, -0.1692254, -2.409929, 1, 0.7215686, 0, 1,
-1.128424, -1.533535, -2.280502, 1, 0.7254902, 0, 1,
-1.123181, 1.37352, 0.471572, 1, 0.7333333, 0, 1,
-1.121062, 0.2817464, -1.798245, 1, 0.7372549, 0, 1,
-1.120516, 1.42676, 0.05913987, 1, 0.7450981, 0, 1,
-1.108493, -0.5105081, -2.799506, 1, 0.7490196, 0, 1,
-1.106002, 0.1604865, -2.244616, 1, 0.7568628, 0, 1,
-1.105944, -0.8614615, -2.172131, 1, 0.7607843, 0, 1,
-1.105524, -1.167579, -1.279571, 1, 0.7686275, 0, 1,
-1.103872, -0.2068725, -1.130557, 1, 0.772549, 0, 1,
-1.096246, 0.6659836, 1.045462, 1, 0.7803922, 0, 1,
-1.095875, -1.368621, -3.303735, 1, 0.7843137, 0, 1,
-1.084406, -0.3468837, -2.179764, 1, 0.7921569, 0, 1,
-1.081243, 0.06471478, -2.130128, 1, 0.7960784, 0, 1,
-1.07755, -0.5199665, -2.735189, 1, 0.8039216, 0, 1,
-1.069482, 0.9164087, -1.699234, 1, 0.8117647, 0, 1,
-1.063561, -0.4469307, -1.564889, 1, 0.8156863, 0, 1,
-1.060655, -0.2917855, -2.133747, 1, 0.8235294, 0, 1,
-1.059623, 0.496036, -1.460477, 1, 0.827451, 0, 1,
-1.055866, -0.351143, -3.812483, 1, 0.8352941, 0, 1,
-1.051924, -1.074508, -2.081913, 1, 0.8392157, 0, 1,
-1.051481, 0.4071439, -1.371917, 1, 0.8470588, 0, 1,
-1.045176, -1.202937, -1.261443, 1, 0.8509804, 0, 1,
-1.041291, 0.7577714, -1.307599, 1, 0.8588235, 0, 1,
-1.033321, -0.7354918, -2.455201, 1, 0.8627451, 0, 1,
-1.033245, 0.1106375, -1.850931, 1, 0.8705882, 0, 1,
-1.026649, 0.6703972, -0.2984524, 1, 0.8745098, 0, 1,
-1.018714, 1.147573, -1.737604, 1, 0.8823529, 0, 1,
-1.012729, 0.6337528, -0.5051777, 1, 0.8862745, 0, 1,
-1.007169, 0.4279953, -0.1541611, 1, 0.8941177, 0, 1,
-1.006147, 0.3935481, -1.993092, 1, 0.8980392, 0, 1,
-1.005124, -0.6575119, -3.146576, 1, 0.9058824, 0, 1,
-1.002533, 1.20528, -1.374265, 1, 0.9137255, 0, 1,
-0.9988706, 1.044706, -0.4198073, 1, 0.9176471, 0, 1,
-0.9939312, 1.304419, 0.2406483, 1, 0.9254902, 0, 1,
-0.9924389, -0.3243641, -1.362211, 1, 0.9294118, 0, 1,
-0.9902427, -1.890591, -2.824331, 1, 0.9372549, 0, 1,
-0.9895645, 0.2913508, -1.016196, 1, 0.9411765, 0, 1,
-0.984601, 0.4643756, -1.284457, 1, 0.9490196, 0, 1,
-0.9838868, 0.8515635, -1.309729, 1, 0.9529412, 0, 1,
-0.9817929, 1.312864, 1.113025, 1, 0.9607843, 0, 1,
-0.9779994, 0.8889805, -1.607283, 1, 0.9647059, 0, 1,
-0.9763438, 0.4488945, -1.714496, 1, 0.972549, 0, 1,
-0.9736686, 1.405694, -0.539939, 1, 0.9764706, 0, 1,
-0.9717987, -0.4162301, -3.417229, 1, 0.9843137, 0, 1,
-0.9693847, 1.710904, 0.4007937, 1, 0.9882353, 0, 1,
-0.9664366, -0.0248641, -1.122432, 1, 0.9960784, 0, 1,
-0.9632638, -0.08286073, -1.070597, 0.9960784, 1, 0, 1,
-0.959587, -0.4054415, -1.282352, 0.9921569, 1, 0, 1,
-0.9564329, 0.958285, -2.73193, 0.9843137, 1, 0, 1,
-0.9462217, -0.7570332, -2.151325, 0.9803922, 1, 0, 1,
-0.9442464, 0.7584804, -0.3550992, 0.972549, 1, 0, 1,
-0.9357703, -0.9547034, -1.925621, 0.9686275, 1, 0, 1,
-0.9334578, -0.359743, -2.127009, 0.9607843, 1, 0, 1,
-0.933398, -0.08633753, -1.709768, 0.9568627, 1, 0, 1,
-0.9270957, -1.429556, -3.231354, 0.9490196, 1, 0, 1,
-0.9121336, -0.7164742, -2.530612, 0.945098, 1, 0, 1,
-0.9079274, -0.4949575, -0.9150671, 0.9372549, 1, 0, 1,
-0.9012936, 0.6482014, -0.9312348, 0.9333333, 1, 0, 1,
-0.8994287, 0.4114505, -3.396644, 0.9254902, 1, 0, 1,
-0.8954978, -0.8319414, -1.891955, 0.9215686, 1, 0, 1,
-0.8891686, 1.432641, 0.1743582, 0.9137255, 1, 0, 1,
-0.8839265, 1.929362, 0.2082476, 0.9098039, 1, 0, 1,
-0.8825005, 1.422992, 0.1938714, 0.9019608, 1, 0, 1,
-0.8760177, 0.5480688, -1.976453, 0.8941177, 1, 0, 1,
-0.8749649, -1.6426, -1.837594, 0.8901961, 1, 0, 1,
-0.8702816, 0.1886321, -1.915179, 0.8823529, 1, 0, 1,
-0.8661091, -2.159876, -4.629954, 0.8784314, 1, 0, 1,
-0.8589866, 0.3195951, -2.207869, 0.8705882, 1, 0, 1,
-0.8566526, -0.7897728, -0.7731909, 0.8666667, 1, 0, 1,
-0.8532465, -0.9377958, -4.056664, 0.8588235, 1, 0, 1,
-0.8516501, -0.0008599926, -2.881135, 0.854902, 1, 0, 1,
-0.8468872, 0.07529273, -1.819458, 0.8470588, 1, 0, 1,
-0.8460999, -0.07769879, -1.768765, 0.8431373, 1, 0, 1,
-0.8404178, -0.2729678, -1.827451, 0.8352941, 1, 0, 1,
-0.8400088, -1.737628, -3.122118, 0.8313726, 1, 0, 1,
-0.8396647, -0.1549884, -1.516374, 0.8235294, 1, 0, 1,
-0.838604, 0.2587983, -1.300493, 0.8196079, 1, 0, 1,
-0.8301241, 0.1357752, -3.515793, 0.8117647, 1, 0, 1,
-0.8251173, 0.6658608, -1.949816, 0.8078431, 1, 0, 1,
-0.8240485, 0.5064065, -2.347741, 0.8, 1, 0, 1,
-0.8231922, 1.043021, -0.2894951, 0.7921569, 1, 0, 1,
-0.8121275, -0.8199118, -0.8670179, 0.7882353, 1, 0, 1,
-0.8033528, -0.5357716, -0.4260674, 0.7803922, 1, 0, 1,
-0.79823, -1.497506, -4.885322, 0.7764706, 1, 0, 1,
-0.796331, -0.2691942, -1.353183, 0.7686275, 1, 0, 1,
-0.788175, 1.194651, -0.874684, 0.7647059, 1, 0, 1,
-0.7860881, -0.5814006, -2.489731, 0.7568628, 1, 0, 1,
-0.7851771, -1.007753, -2.39097, 0.7529412, 1, 0, 1,
-0.7851701, -1.520345, -2.808628, 0.7450981, 1, 0, 1,
-0.785087, 2.043559, -1.574964, 0.7411765, 1, 0, 1,
-0.7693537, -0.3069421, -2.792495, 0.7333333, 1, 0, 1,
-0.7685097, 0.2881011, -1.780748, 0.7294118, 1, 0, 1,
-0.7674326, -0.5526956, -1.463267, 0.7215686, 1, 0, 1,
-0.7617034, -0.04818581, -1.580004, 0.7176471, 1, 0, 1,
-0.7596707, 0.2035072, -0.4479887, 0.7098039, 1, 0, 1,
-0.7530326, 0.6499556, -0.9574475, 0.7058824, 1, 0, 1,
-0.7513627, 0.04664293, -3.4876, 0.6980392, 1, 0, 1,
-0.7444967, -1.004328, -2.067811, 0.6901961, 1, 0, 1,
-0.7435867, -0.8864123, -0.7360733, 0.6862745, 1, 0, 1,
-0.7411067, 0.7683675, -2.501683, 0.6784314, 1, 0, 1,
-0.7392923, -0.4901301, -2.270265, 0.6745098, 1, 0, 1,
-0.7377978, 0.7122433, -0.589541, 0.6666667, 1, 0, 1,
-0.7347325, 1.008747, -1.429601, 0.6627451, 1, 0, 1,
-0.7310128, -0.9234766, -2.736137, 0.654902, 1, 0, 1,
-0.7305639, -0.8998903, -0.3318914, 0.6509804, 1, 0, 1,
-0.7294763, -1.939887, -3.377033, 0.6431373, 1, 0, 1,
-0.7122761, 0.83639, 0.4167819, 0.6392157, 1, 0, 1,
-0.7052901, 0.2798599, -1.616694, 0.6313726, 1, 0, 1,
-0.6995869, 1.685028, 0.3189703, 0.627451, 1, 0, 1,
-0.6978105, -0.969363, -1.412151, 0.6196079, 1, 0, 1,
-0.6956949, 1.400168, -2.398123, 0.6156863, 1, 0, 1,
-0.6935174, -0.3490171, -1.416529, 0.6078432, 1, 0, 1,
-0.6796733, -0.5475299, -2.017977, 0.6039216, 1, 0, 1,
-0.6744721, 0.607371, -3.696125, 0.5960785, 1, 0, 1,
-0.6737833, 0.6583841, -1.755538, 0.5882353, 1, 0, 1,
-0.6706439, -0.2114018, -2.764329, 0.5843138, 1, 0, 1,
-0.6683409, -0.4936084, -1.662211, 0.5764706, 1, 0, 1,
-0.6645777, 1.208241, -0.6693164, 0.572549, 1, 0, 1,
-0.6597816, 0.8061854, 0.1819552, 0.5647059, 1, 0, 1,
-0.6554267, 1.257942, -0.06370525, 0.5607843, 1, 0, 1,
-0.6494815, 1.3022, -1.121146, 0.5529412, 1, 0, 1,
-0.6490214, 0.1387461, -1.150235, 0.5490196, 1, 0, 1,
-0.6463354, -0.9442318, -2.717973, 0.5411765, 1, 0, 1,
-0.6432599, 1.828388, -0.4413027, 0.5372549, 1, 0, 1,
-0.6363088, 1.076321, -1.195713, 0.5294118, 1, 0, 1,
-0.6331869, -0.1943207, -2.46349, 0.5254902, 1, 0, 1,
-0.6316427, -0.321938, -2.541595, 0.5176471, 1, 0, 1,
-0.6290012, 1.546344, -0.01117256, 0.5137255, 1, 0, 1,
-0.6236568, -1.440134, -2.135624, 0.5058824, 1, 0, 1,
-0.6214533, 0.2079982, -0.8366117, 0.5019608, 1, 0, 1,
-0.6213849, 0.9791552, 0.07130326, 0.4941176, 1, 0, 1,
-0.6207855, 1.783779, 0.08825327, 0.4862745, 1, 0, 1,
-0.6189486, -0.08470015, -0.9470343, 0.4823529, 1, 0, 1,
-0.6150341, -0.5162424, -3.951239, 0.4745098, 1, 0, 1,
-0.6137791, -1.75088, -3.876201, 0.4705882, 1, 0, 1,
-0.6089219, 0.2293944, -2.047401, 0.4627451, 1, 0, 1,
-0.6037512, -1.603822, -3.154311, 0.4588235, 1, 0, 1,
-0.6016312, 0.3407036, -1.826669, 0.4509804, 1, 0, 1,
-0.5985532, 2.121151, 0.2070488, 0.4470588, 1, 0, 1,
-0.5983771, -0.4571313, -1.020577, 0.4392157, 1, 0, 1,
-0.597742, -0.03326935, 0.3740176, 0.4352941, 1, 0, 1,
-0.5868347, -0.6776817, -2.49371, 0.427451, 1, 0, 1,
-0.5868162, 0.7663243, -2.469868, 0.4235294, 1, 0, 1,
-0.5787278, -0.2051675, -1.33053, 0.4156863, 1, 0, 1,
-0.5775497, 0.01336909, -2.077268, 0.4117647, 1, 0, 1,
-0.5717991, 0.7883731, -1.576375, 0.4039216, 1, 0, 1,
-0.571089, 1.172276, 0.5102338, 0.3960784, 1, 0, 1,
-0.5686439, 1.297459, -0.5307305, 0.3921569, 1, 0, 1,
-0.5645283, 0.2553347, -1.990747, 0.3843137, 1, 0, 1,
-0.5616426, 0.8963039, -2.00576, 0.3803922, 1, 0, 1,
-0.5526343, -0.7884688, -3.228072, 0.372549, 1, 0, 1,
-0.5479943, 0.2464446, -1.327638, 0.3686275, 1, 0, 1,
-0.5412291, -0.3218449, -0.1945157, 0.3607843, 1, 0, 1,
-0.5390483, 1.039899, 0.8521611, 0.3568628, 1, 0, 1,
-0.5362449, 0.09297667, -3.021551, 0.3490196, 1, 0, 1,
-0.5350464, 0.942912, -0.3072897, 0.345098, 1, 0, 1,
-0.5340663, -0.7842075, -3.418614, 0.3372549, 1, 0, 1,
-0.5327541, 0.7030318, -0.9270648, 0.3333333, 1, 0, 1,
-0.5324391, -0.4681748, -0.6033714, 0.3254902, 1, 0, 1,
-0.5310565, 0.359319, -1.084515, 0.3215686, 1, 0, 1,
-0.5298603, 1.461092, 0.1614897, 0.3137255, 1, 0, 1,
-0.5282561, 1.876162, -1.458382, 0.3098039, 1, 0, 1,
-0.527766, 1.487168, 0.6401047, 0.3019608, 1, 0, 1,
-0.5189374, 0.5001398, 1.099629, 0.2941177, 1, 0, 1,
-0.514657, 1.442578, -0.06728616, 0.2901961, 1, 0, 1,
-0.5115023, -0.1198134, -0.8925444, 0.282353, 1, 0, 1,
-0.5099033, 1.232267, -0.5400404, 0.2784314, 1, 0, 1,
-0.5032832, -0.04680155, -1.536395, 0.2705882, 1, 0, 1,
-0.5028684, -1.532721, -2.757172, 0.2666667, 1, 0, 1,
-0.5006883, -0.09709757, -1.558782, 0.2588235, 1, 0, 1,
-0.4993267, 0.4305048, -1.005368, 0.254902, 1, 0, 1,
-0.4982961, -0.08525381, -1.568511, 0.2470588, 1, 0, 1,
-0.4895909, -1.54372, -3.202437, 0.2431373, 1, 0, 1,
-0.4895239, -1.041513, -1.106228, 0.2352941, 1, 0, 1,
-0.4855821, -0.371545, -2.71032, 0.2313726, 1, 0, 1,
-0.4833643, 0.02414045, -1.526426, 0.2235294, 1, 0, 1,
-0.4774955, -1.884391, -3.032758, 0.2196078, 1, 0, 1,
-0.4753185, -1.123085, -2.700368, 0.2117647, 1, 0, 1,
-0.4728916, -1.503705, -2.302831, 0.2078431, 1, 0, 1,
-0.4725404, 1.306956, 0.772034, 0.2, 1, 0, 1,
-0.4716891, 1.069512, 1.278614, 0.1921569, 1, 0, 1,
-0.4694289, -0.5790291, -1.427634, 0.1882353, 1, 0, 1,
-0.4676474, -1.857231, -2.70987, 0.1803922, 1, 0, 1,
-0.4671083, -0.330105, -1.354169, 0.1764706, 1, 0, 1,
-0.4602918, -2.09589, -3.380149, 0.1686275, 1, 0, 1,
-0.4599141, -1.121155, -1.590127, 0.1647059, 1, 0, 1,
-0.4561915, -0.01818179, -1.639875, 0.1568628, 1, 0, 1,
-0.4520874, 0.1977476, -2.367087, 0.1529412, 1, 0, 1,
-0.4482195, -2.171179, -3.60576, 0.145098, 1, 0, 1,
-0.4461688, -2.630538, -3.486567, 0.1411765, 1, 0, 1,
-0.4449649, -0.5239992, -2.465021, 0.1333333, 1, 0, 1,
-0.4391147, 0.7087761, -0.1770643, 0.1294118, 1, 0, 1,
-0.4388414, 0.02202411, -1.938957, 0.1215686, 1, 0, 1,
-0.436428, 0.541186, -1.124928, 0.1176471, 1, 0, 1,
-0.4341333, 1.269445, 1.268923, 0.1098039, 1, 0, 1,
-0.4328949, -0.859008, -3.394528, 0.1058824, 1, 0, 1,
-0.4321715, -0.3993838, -2.239983, 0.09803922, 1, 0, 1,
-0.4319604, 0.08555374, -1.731678, 0.09019608, 1, 0, 1,
-0.4256062, -2.902616, -2.995767, 0.08627451, 1, 0, 1,
-0.4249516, -0.7472481, -3.556499, 0.07843138, 1, 0, 1,
-0.4222768, 1.30794, 0.007972061, 0.07450981, 1, 0, 1,
-0.4209142, 1.694215, -1.417117, 0.06666667, 1, 0, 1,
-0.4193608, 0.6189979, -1.817556, 0.0627451, 1, 0, 1,
-0.4191923, 0.3628373, -0.779865, 0.05490196, 1, 0, 1,
-0.4141407, 0.4100255, -1.531819, 0.05098039, 1, 0, 1,
-0.4136399, 0.1019509, -2.410357, 0.04313726, 1, 0, 1,
-0.4120363, 1.051311, -0.8474411, 0.03921569, 1, 0, 1,
-0.4100681, 1.311696, 0.06297312, 0.03137255, 1, 0, 1,
-0.4052715, 0.03210266, 0.9632712, 0.02745098, 1, 0, 1,
-0.4035599, -0.9238894, -3.279764, 0.01960784, 1, 0, 1,
-0.3969406, -0.02248019, -1.766763, 0.01568628, 1, 0, 1,
-0.3966976, 0.8828303, -0.09743819, 0.007843138, 1, 0, 1,
-0.396169, -1.245038, -2.622952, 0.003921569, 1, 0, 1,
-0.3919374, 0.5365409, -0.7612985, 0, 1, 0.003921569, 1,
-0.391778, 0.6899496, 0.8787882, 0, 1, 0.01176471, 1,
-0.3845777, 1.425458, -0.6435943, 0, 1, 0.01568628, 1,
-0.3762784, -1.177594, -2.067926, 0, 1, 0.02352941, 1,
-0.3745185, 0.05763372, -2.535952, 0, 1, 0.02745098, 1,
-0.3732254, -0.9601581, -3.856076, 0, 1, 0.03529412, 1,
-0.3727634, -1.582835, -3.484899, 0, 1, 0.03921569, 1,
-0.371635, -1.07366, -4.963242, 0, 1, 0.04705882, 1,
-0.3690715, 0.11775, -1.549629, 0, 1, 0.05098039, 1,
-0.3664272, -0.672448, -3.536517, 0, 1, 0.05882353, 1,
-0.3658859, 1.486946, 1.26876, 0, 1, 0.0627451, 1,
-0.3623719, 0.5733724, 0.1269347, 0, 1, 0.07058824, 1,
-0.3612389, 0.5998766, -0.7535884, 0, 1, 0.07450981, 1,
-0.3599365, 0.9120032, -1.770648, 0, 1, 0.08235294, 1,
-0.3587846, 0.8712086, -0.1109042, 0, 1, 0.08627451, 1,
-0.3459355, 0.2439745, -2.05968, 0, 1, 0.09411765, 1,
-0.3428371, 0.02753807, -1.496937, 0, 1, 0.1019608, 1,
-0.3423393, -1.213547, -2.677563, 0, 1, 0.1058824, 1,
-0.342222, -1.200086, -1.984109, 0, 1, 0.1137255, 1,
-0.3421755, 0.1708956, -2.213323, 0, 1, 0.1176471, 1,
-0.3351469, -0.5079613, -2.193497, 0, 1, 0.1254902, 1,
-0.3322692, -1.443144, -1.749, 0, 1, 0.1294118, 1,
-0.3309197, -0.05029548, -1.432036, 0, 1, 0.1372549, 1,
-0.3290666, 0.02062698, -1.528695, 0, 1, 0.1411765, 1,
-0.3285351, -0.491013, -4.669529, 0, 1, 0.1490196, 1,
-0.3279672, -0.8076814, -1.456279, 0, 1, 0.1529412, 1,
-0.3269088, 0.3459348, -0.2286002, 0, 1, 0.1607843, 1,
-0.3264831, 1.47831, -1.897798, 0, 1, 0.1647059, 1,
-0.3222514, -1.129447, -2.870059, 0, 1, 0.172549, 1,
-0.3219182, -0.9629623, -2.452113, 0, 1, 0.1764706, 1,
-0.321333, 0.1763533, -0.4245169, 0, 1, 0.1843137, 1,
-0.3202684, -1.517384, -3.912795, 0, 1, 0.1882353, 1,
-0.3201651, -0.8388834, -2.813228, 0, 1, 0.1960784, 1,
-0.3184592, -0.461958, -1.162392, 0, 1, 0.2039216, 1,
-0.317495, -0.4950053, -4.450621, 0, 1, 0.2078431, 1,
-0.3161559, -0.313758, -1.937044, 0, 1, 0.2156863, 1,
-0.3140292, 2.325377, 0.4997918, 0, 1, 0.2196078, 1,
-0.3132201, 1.065403, 1.051717, 0, 1, 0.227451, 1,
-0.3081041, -0.1905641, -1.363891, 0, 1, 0.2313726, 1,
-0.2991156, -1.977314, -2.691265, 0, 1, 0.2392157, 1,
-0.2982628, 0.03666825, -1.10723, 0, 1, 0.2431373, 1,
-0.2919976, 0.2795282, 0.554399, 0, 1, 0.2509804, 1,
-0.2861004, 0.7678279, -0.7198781, 0, 1, 0.254902, 1,
-0.2788635, 2.108389, -0.8220373, 0, 1, 0.2627451, 1,
-0.2788082, -0.7500932, -1.281452, 0, 1, 0.2666667, 1,
-0.2776711, -0.1044821, -1.575465, 0, 1, 0.2745098, 1,
-0.2728586, 0.5621643, 0.9453922, 0, 1, 0.2784314, 1,
-0.2647564, 1.56016, 1.17048, 0, 1, 0.2862745, 1,
-0.260311, -2.296463, -3.846057, 0, 1, 0.2901961, 1,
-0.2533976, 2.072905, -0.8233735, 0, 1, 0.2980392, 1,
-0.2525581, 0.2795098, 0.9478731, 0, 1, 0.3058824, 1,
-0.2523787, -0.6754254, -2.483112, 0, 1, 0.3098039, 1,
-0.2474821, -0.3845223, -2.960246, 0, 1, 0.3176471, 1,
-0.2462112, -0.4159281, -2.729392, 0, 1, 0.3215686, 1,
-0.2441057, 2.180593, -1.20048, 0, 1, 0.3294118, 1,
-0.2425299, -0.9228008, -3.490484, 0, 1, 0.3333333, 1,
-0.2417152, -0.6108817, -4.290185, 0, 1, 0.3411765, 1,
-0.2402979, 1.403276, -0.8485008, 0, 1, 0.345098, 1,
-0.2378197, 0.4666752, -1.512621, 0, 1, 0.3529412, 1,
-0.2376939, -0.5425037, -0.1145852, 0, 1, 0.3568628, 1,
-0.2331798, 0.2895597, -1.29369, 0, 1, 0.3647059, 1,
-0.2321121, 0.2464512, -1.205767, 0, 1, 0.3686275, 1,
-0.2309517, 1.160009, -0.3508494, 0, 1, 0.3764706, 1,
-0.2300541, -0.1070462, -1.80125, 0, 1, 0.3803922, 1,
-0.2296338, -1.240178, -3.518585, 0, 1, 0.3882353, 1,
-0.2291132, 1.385982, -0.8037463, 0, 1, 0.3921569, 1,
-0.2262588, -0.6805723, -2.424194, 0, 1, 0.4, 1,
-0.2256521, -1.489611, -4.463598, 0, 1, 0.4078431, 1,
-0.2243349, -1.086504, -2.494985, 0, 1, 0.4117647, 1,
-0.2239038, 0.1501438, -1.185079, 0, 1, 0.4196078, 1,
-0.2178378, 0.008634902, -0.9205086, 0, 1, 0.4235294, 1,
-0.2166349, 1.042575, 0.4685958, 0, 1, 0.4313726, 1,
-0.2155207, 0.8814747, -1.78694, 0, 1, 0.4352941, 1,
-0.2150504, 0.2550213, -2.330162, 0, 1, 0.4431373, 1,
-0.2134016, -0.05130625, -1.269033, 0, 1, 0.4470588, 1,
-0.2084924, 1.995899, -0.4411015, 0, 1, 0.454902, 1,
-0.2037001, -0.1554799, -0.9772956, 0, 1, 0.4588235, 1,
-0.2032877, -1.259373, -4.564874, 0, 1, 0.4666667, 1,
-0.2028141, -1.026129, -3.149096, 0, 1, 0.4705882, 1,
-0.2025824, -1.312799, -2.043928, 0, 1, 0.4784314, 1,
-0.202311, 0.8913911, -1.756707, 0, 1, 0.4823529, 1,
-0.2014506, 0.02506318, -1.815415, 0, 1, 0.4901961, 1,
-0.1999995, -0.3333805, -2.871091, 0, 1, 0.4941176, 1,
-0.199347, -0.3169899, -2.257276, 0, 1, 0.5019608, 1,
-0.1965765, 0.3481789, 0.8178036, 0, 1, 0.509804, 1,
-0.1960524, -1.117511, -2.712752, 0, 1, 0.5137255, 1,
-0.1923737, -1.191501, -1.30813, 0, 1, 0.5215687, 1,
-0.1920331, -0.01895203, -2.040369, 0, 1, 0.5254902, 1,
-0.1908249, -0.728923, -4.203262, 0, 1, 0.5333334, 1,
-0.1877886, -1.117949, -2.827206, 0, 1, 0.5372549, 1,
-0.1782526, 0.7637265, -0.511338, 0, 1, 0.5450981, 1,
-0.1780584, 0.2192463, -1.080359, 0, 1, 0.5490196, 1,
-0.1765567, -0.3976565, -4.013337, 0, 1, 0.5568628, 1,
-0.175438, -1.123702, -2.436007, 0, 1, 0.5607843, 1,
-0.1753933, -1.637075, -3.673669, 0, 1, 0.5686275, 1,
-0.1747099, -0.5706716, -0.9411116, 0, 1, 0.572549, 1,
-0.1697097, 1.370147, -1.701426, 0, 1, 0.5803922, 1,
-0.1642466, -1.239156, -2.78262, 0, 1, 0.5843138, 1,
-0.1638108, 0.4725741, -2.58759, 0, 1, 0.5921569, 1,
-0.1632841, -0.02620639, -3.399748, 0, 1, 0.5960785, 1,
-0.1625056, -0.3037016, -2.382828, 0, 1, 0.6039216, 1,
-0.1618629, -0.2628046, -2.868647, 0, 1, 0.6117647, 1,
-0.1607998, 0.740887, -0.1970815, 0, 1, 0.6156863, 1,
-0.1554073, 0.9623638, -0.9441444, 0, 1, 0.6235294, 1,
-0.1539131, -1.091405, -2.7538, 0, 1, 0.627451, 1,
-0.1519291, 0.8618135, 0.55515, 0, 1, 0.6352941, 1,
-0.1453949, -0.4541779, -2.484192, 0, 1, 0.6392157, 1,
-0.1448558, 1.272609, -0.2149726, 0, 1, 0.6470588, 1,
-0.1447057, 0.2014854, -1.480375, 0, 1, 0.6509804, 1,
-0.1445621, -0.4511175, -2.309321, 0, 1, 0.6588235, 1,
-0.1366584, -0.3634079, -3.035469, 0, 1, 0.6627451, 1,
-0.1353565, -0.4035283, -0.6123575, 0, 1, 0.6705883, 1,
-0.1349837, -0.6784272, -3.341997, 0, 1, 0.6745098, 1,
-0.132972, -0.4058303, -2.301961, 0, 1, 0.682353, 1,
-0.1324831, -0.899292, -5.093125, 0, 1, 0.6862745, 1,
-0.1269749, 1.12306, 0.4335208, 0, 1, 0.6941177, 1,
-0.1262367, 0.1636011, -0.6778032, 0, 1, 0.7019608, 1,
-0.1231314, -0.7727028, -2.134436, 0, 1, 0.7058824, 1,
-0.1229913, 1.116394, 1.078136, 0, 1, 0.7137255, 1,
-0.1182076, 2.094466, 0.1757636, 0, 1, 0.7176471, 1,
-0.1168904, -1.878399, -5.042526, 0, 1, 0.7254902, 1,
-0.1142138, 1.07198, 1.096132, 0, 1, 0.7294118, 1,
-0.1068059, 1.136967, 0.4778843, 0, 1, 0.7372549, 1,
-0.1014729, -0.3725753, -1.258162, 0, 1, 0.7411765, 1,
-0.0987575, 2.350967, -0.05664591, 0, 1, 0.7490196, 1,
-0.09846557, 1.287649, -0.3948684, 0, 1, 0.7529412, 1,
-0.09552816, 0.4303779, 1.988023, 0, 1, 0.7607843, 1,
-0.09537666, 0.1611152, -2.263421, 0, 1, 0.7647059, 1,
-0.09448915, 1.096528, -1.353719, 0, 1, 0.772549, 1,
-0.0912495, 1.015751, -0.7359012, 0, 1, 0.7764706, 1,
-0.08890537, 0.3304939, -2.188419, 0, 1, 0.7843137, 1,
-0.08884957, -1.777787, -2.146237, 0, 1, 0.7882353, 1,
-0.08640726, -1.046611, -0.982071, 0, 1, 0.7960784, 1,
-0.08593804, -0.1530262, -3.389881, 0, 1, 0.8039216, 1,
-0.08584619, 0.369749, 0.7065887, 0, 1, 0.8078431, 1,
-0.08457645, 0.4905179, 2.12943, 0, 1, 0.8156863, 1,
-0.08435851, 0.8066954, 0.3399807, 0, 1, 0.8196079, 1,
-0.08072641, 0.4306564, -0.07909272, 0, 1, 0.827451, 1,
-0.0788882, 0.3161854, -0.3721852, 0, 1, 0.8313726, 1,
-0.07839786, 0.4066611, 0.9728099, 0, 1, 0.8392157, 1,
-0.07438206, 0.600041, 0.2730573, 0, 1, 0.8431373, 1,
-0.06907225, 0.7690553, 1.366503, 0, 1, 0.8509804, 1,
-0.06513441, -0.1141398, -3.548749, 0, 1, 0.854902, 1,
-0.05764202, 0.6074345, -0.3346818, 0, 1, 0.8627451, 1,
-0.0553341, -0.5671648, -2.534111, 0, 1, 0.8666667, 1,
-0.0530211, 0.5292656, -0.3642066, 0, 1, 0.8745098, 1,
-0.05007973, 0.773232, -1.096797, 0, 1, 0.8784314, 1,
-0.0491703, -1.251265, -0.7783724, 0, 1, 0.8862745, 1,
-0.047668, 2.283837, 0.7450415, 0, 1, 0.8901961, 1,
-0.04649777, 1.900458, 0.03933357, 0, 1, 0.8980392, 1,
-0.04593119, 0.4311173, 1.377733, 0, 1, 0.9058824, 1,
-0.04574069, 0.5681307, -0.7579825, 0, 1, 0.9098039, 1,
-0.04373129, -1.079554, -5.382772, 0, 1, 0.9176471, 1,
-0.03785498, -0.03996902, -1.37757, 0, 1, 0.9215686, 1,
-0.03481507, 0.09668739, -0.6180335, 0, 1, 0.9294118, 1,
-0.03336368, -1.357057, -2.288489, 0, 1, 0.9333333, 1,
-0.03176666, 0.08638111, -0.6959081, 0, 1, 0.9411765, 1,
-0.03135063, 0.3094767, -0.08889647, 0, 1, 0.945098, 1,
-0.02648488, -0.3181384, -4.226719, 0, 1, 0.9529412, 1,
-0.02648069, -0.4226068, -1.451135, 0, 1, 0.9568627, 1,
-0.0261436, -0.2211634, -2.840127, 0, 1, 0.9647059, 1,
-0.02524536, -1.118552, -3.17239, 0, 1, 0.9686275, 1,
-0.02248381, -0.1434152, -3.569286, 0, 1, 0.9764706, 1,
-0.02184641, -1.387713, -2.233497, 0, 1, 0.9803922, 1,
-0.02017124, -1.519211, -2.31694, 0, 1, 0.9882353, 1,
-0.01998844, -0.9945967, -5.639493, 0, 1, 0.9921569, 1,
-0.01932532, -0.6252775, -3.051858, 0, 1, 1, 1,
-0.0189192, -0.1703274, -1.895502, 0, 0.9921569, 1, 1,
-0.01558265, -0.6071085, -1.315148, 0, 0.9882353, 1, 1,
-0.0125026, 0.2205402, -0.1335141, 0, 0.9803922, 1, 1,
-0.009645349, 0.1938682, -0.655369, 0, 0.9764706, 1, 1,
-0.007230586, -0.5372095, -3.562164, 0, 0.9686275, 1, 1,
-0.000304099, -0.5167654, -4.37539, 0, 0.9647059, 1, 1,
0.002926991, -1.892716, 1.728877, 0, 0.9568627, 1, 1,
0.009801509, 0.3631947, 0.1704252, 0, 0.9529412, 1, 1,
0.01392393, -0.2384638, 3.528858, 0, 0.945098, 1, 1,
0.02056012, 0.01992543, 1.62673, 0, 0.9411765, 1, 1,
0.02214016, 1.372082, -0.581333, 0, 0.9333333, 1, 1,
0.02394822, -0.4840712, 2.006582, 0, 0.9294118, 1, 1,
0.02539589, 1.289142, 0.4690185, 0, 0.9215686, 1, 1,
0.02669538, -0.510298, 6.068242, 0, 0.9176471, 1, 1,
0.03428582, 0.1968014, -0.565904, 0, 0.9098039, 1, 1,
0.03622276, 0.4291019, -1.079493, 0, 0.9058824, 1, 1,
0.03812233, 0.7043135, -0.6732632, 0, 0.8980392, 1, 1,
0.03845292, 1.091714, 0.2153848, 0, 0.8901961, 1, 1,
0.04246645, -0.2843534, 2.409539, 0, 0.8862745, 1, 1,
0.04643698, 0.006024359, 1.332323, 0, 0.8784314, 1, 1,
0.05488782, 0.4707883, -1.484097, 0, 0.8745098, 1, 1,
0.0549069, -0.1731402, 4.258615, 0, 0.8666667, 1, 1,
0.06084202, -0.9216568, 3.20012, 0, 0.8627451, 1, 1,
0.06179474, -0.4154651, 1.680561, 0, 0.854902, 1, 1,
0.0652547, 0.1982948, 0.4911185, 0, 0.8509804, 1, 1,
0.06685147, 2.529483, -0.3550926, 0, 0.8431373, 1, 1,
0.06712276, -0.5340278, 3.133891, 0, 0.8392157, 1, 1,
0.07272857, -0.8050889, 4.311697, 0, 0.8313726, 1, 1,
0.07828964, 0.3639069, -0.2612166, 0, 0.827451, 1, 1,
0.07895864, 1.469271, -1.046884, 0, 0.8196079, 1, 1,
0.07945719, 0.6149949, -1.24599, 0, 0.8156863, 1, 1,
0.0798562, -1.895422, 3.510118, 0, 0.8078431, 1, 1,
0.08098964, 0.8637176, -0.07172687, 0, 0.8039216, 1, 1,
0.08300395, 1.283356, 0.9936541, 0, 0.7960784, 1, 1,
0.08745141, -0.982713, 3.087276, 0, 0.7882353, 1, 1,
0.08882759, -1.695693, -0.8439458, 0, 0.7843137, 1, 1,
0.08903801, -0.6342582, 1.399866, 0, 0.7764706, 1, 1,
0.09873495, 0.2303723, -1.144605, 0, 0.772549, 1, 1,
0.1119234, -1.181529, 2.098061, 0, 0.7647059, 1, 1,
0.114875, 0.1244379, 2.572597, 0, 0.7607843, 1, 1,
0.1166081, 0.69481, -1.041174, 0, 0.7529412, 1, 1,
0.1195949, 0.1782609, 1.215073, 0, 0.7490196, 1, 1,
0.124336, 0.4684454, 0.9716184, 0, 0.7411765, 1, 1,
0.1306139, -0.678364, 1.864064, 0, 0.7372549, 1, 1,
0.1341917, 1.093831, 0.6830978, 0, 0.7294118, 1, 1,
0.1349682, 0.950895, 0.1029656, 0, 0.7254902, 1, 1,
0.1358789, -0.135246, 3.9492, 0, 0.7176471, 1, 1,
0.1360045, -0.3914219, 4.068082, 0, 0.7137255, 1, 1,
0.1423842, 1.741769, 0.1154639, 0, 0.7058824, 1, 1,
0.1452378, -0.8256708, 1.310445, 0, 0.6980392, 1, 1,
0.1458349, -0.7045248, 1.773184, 0, 0.6941177, 1, 1,
0.1486046, 1.274549, -0.02089894, 0, 0.6862745, 1, 1,
0.1546173, 0.6735245, 1.445126, 0, 0.682353, 1, 1,
0.1573157, 1.228029, 0.862819, 0, 0.6745098, 1, 1,
0.1583621, 0.4102823, -1.776374, 0, 0.6705883, 1, 1,
0.1591156, -0.3300167, 4.411119, 0, 0.6627451, 1, 1,
0.1636819, 1.3523, 1.665497, 0, 0.6588235, 1, 1,
0.1684565, -0.4268433, 3.209043, 0, 0.6509804, 1, 1,
0.1689949, 2.001349, -0.915123, 0, 0.6470588, 1, 1,
0.1692396, 0.1944817, 0.09636757, 0, 0.6392157, 1, 1,
0.1702161, -0.08311098, 3.896474, 0, 0.6352941, 1, 1,
0.1717556, 2.25818, 0.7154027, 0, 0.627451, 1, 1,
0.1779098, 1.495542, -0.02005741, 0, 0.6235294, 1, 1,
0.1786333, 0.4926927, 0.1921669, 0, 0.6156863, 1, 1,
0.1793586, -0.9592168, 3.175867, 0, 0.6117647, 1, 1,
0.1806488, -0.729321, 1.657684, 0, 0.6039216, 1, 1,
0.181418, 0.3269383, 2.653947, 0, 0.5960785, 1, 1,
0.1839039, 0.7371326, 1.247491, 0, 0.5921569, 1, 1,
0.1843223, -2.024377, 1.879001, 0, 0.5843138, 1, 1,
0.1844905, -9.932478e-05, 0.474929, 0, 0.5803922, 1, 1,
0.1847862, 0.9457396, 0.3006062, 0, 0.572549, 1, 1,
0.186426, 0.4965581, -0.4572464, 0, 0.5686275, 1, 1,
0.1866565, 0.4516597, 1.759333, 0, 0.5607843, 1, 1,
0.1893547, -0.3179464, 2.572706, 0, 0.5568628, 1, 1,
0.1927959, -0.04047612, 1.631506, 0, 0.5490196, 1, 1,
0.1959468, -1.854527, 3.074408, 0, 0.5450981, 1, 1,
0.1976191, -1.555419, 2.14182, 0, 0.5372549, 1, 1,
0.1983442, 0.1162307, -0.6806627, 0, 0.5333334, 1, 1,
0.2007417, 0.863026, 0.08574693, 0, 0.5254902, 1, 1,
0.2098216, 0.8164077, 0.6697031, 0, 0.5215687, 1, 1,
0.2112842, 0.803553, -0.9725455, 0, 0.5137255, 1, 1,
0.2136574, -0.4894828, 1.662563, 0, 0.509804, 1, 1,
0.2147428, 2.135762, -0.1269453, 0, 0.5019608, 1, 1,
0.2161261, -0.2705624, 1.381014, 0, 0.4941176, 1, 1,
0.21876, 0.6042268, 1.245867, 0, 0.4901961, 1, 1,
0.2263946, -0.8752807, 4.676422, 0, 0.4823529, 1, 1,
0.2266242, -1.059895, 4.252192, 0, 0.4784314, 1, 1,
0.2362058, -0.1579913, 4.749272, 0, 0.4705882, 1, 1,
0.2416052, 0.0148164, 1.742752, 0, 0.4666667, 1, 1,
0.2449991, -0.06814336, 1.474523, 0, 0.4588235, 1, 1,
0.2462027, -0.2353065, 1.684685, 0, 0.454902, 1, 1,
0.2545997, 0.5942788, 0.3963748, 0, 0.4470588, 1, 1,
0.2555126, -0.8491044, 2.082441, 0, 0.4431373, 1, 1,
0.2556749, 0.3894806, -0.3901661, 0, 0.4352941, 1, 1,
0.2596974, 0.4093899, 1.067454, 0, 0.4313726, 1, 1,
0.2610537, -1.260278, 1.856957, 0, 0.4235294, 1, 1,
0.2650539, -1.439925, 2.058989, 0, 0.4196078, 1, 1,
0.2672752, -0.6333379, 2.022758, 0, 0.4117647, 1, 1,
0.2695046, -0.6826632, 5.279094, 0, 0.4078431, 1, 1,
0.274126, 1.484039, 0.6007974, 0, 0.4, 1, 1,
0.2805483, -0.3390442, 2.236847, 0, 0.3921569, 1, 1,
0.280772, -0.3498128, 0.8138093, 0, 0.3882353, 1, 1,
0.2858807, -1.179517, 2.266861, 0, 0.3803922, 1, 1,
0.2861906, 0.02166669, 1.07287, 0, 0.3764706, 1, 1,
0.2892032, -0.1250247, 2.193527, 0, 0.3686275, 1, 1,
0.2955168, -0.1300546, 2.625016, 0, 0.3647059, 1, 1,
0.2979298, 1.520933, 0.2222064, 0, 0.3568628, 1, 1,
0.3058177, -0.1040815, 2.22149, 0, 0.3529412, 1, 1,
0.3098997, -0.7096504, 3.1776, 0, 0.345098, 1, 1,
0.3116158, 0.09041665, 2.284431, 0, 0.3411765, 1, 1,
0.3129912, -0.690497, 1.975906, 0, 0.3333333, 1, 1,
0.3155354, 1.134461, 0.388737, 0, 0.3294118, 1, 1,
0.3175226, -0.4621482, 3.724574, 0, 0.3215686, 1, 1,
0.3178068, -0.2306527, 3.486868, 0, 0.3176471, 1, 1,
0.3178707, -1.892641, 4.179375, 0, 0.3098039, 1, 1,
0.320403, 0.2399489, 0.3930171, 0, 0.3058824, 1, 1,
0.3207505, -0.2213806, 3.030866, 0, 0.2980392, 1, 1,
0.3212737, -0.3812611, 2.439053, 0, 0.2901961, 1, 1,
0.3221623, 1.114158, -1.088045, 0, 0.2862745, 1, 1,
0.3267322, -0.0135587, 1.706534, 0, 0.2784314, 1, 1,
0.3273903, 0.09283901, 1.471596, 0, 0.2745098, 1, 1,
0.3363924, -0.2214294, 1.976865, 0, 0.2666667, 1, 1,
0.3364088, -1.12716, 2.055149, 0, 0.2627451, 1, 1,
0.3392615, -0.8376944, 4.710331, 0, 0.254902, 1, 1,
0.3456759, 0.8100621, 0.6040066, 0, 0.2509804, 1, 1,
0.348561, -0.6353243, 2.114456, 0, 0.2431373, 1, 1,
0.3487669, 0.2899168, -0.5842892, 0, 0.2392157, 1, 1,
0.349867, 0.2345202, 1.824143, 0, 0.2313726, 1, 1,
0.3515584, 2.432229, 2.018627, 0, 0.227451, 1, 1,
0.352948, -0.01703505, 2.665302, 0, 0.2196078, 1, 1,
0.3627106, 0.05967362, 1.726138, 0, 0.2156863, 1, 1,
0.364065, -0.07078601, 3.197556, 0, 0.2078431, 1, 1,
0.3645206, -0.06215823, 1.687508, 0, 0.2039216, 1, 1,
0.3673707, -0.7284727, 0.1292599, 0, 0.1960784, 1, 1,
0.3683539, -0.01704365, 0.4936379, 0, 0.1882353, 1, 1,
0.3714083, -0.1067181, 3.020213, 0, 0.1843137, 1, 1,
0.3718189, -0.3242948, 1.33802, 0, 0.1764706, 1, 1,
0.3764854, 0.985535, 0.09404945, 0, 0.172549, 1, 1,
0.3766207, -0.258437, 1.834236, 0, 0.1647059, 1, 1,
0.3789832, -0.9772351, 2.692684, 0, 0.1607843, 1, 1,
0.3862129, -0.7107516, 3.256493, 0, 0.1529412, 1, 1,
0.3875086, -0.5320448, 1.672482, 0, 0.1490196, 1, 1,
0.3928688, -0.318641, 3.233937, 0, 0.1411765, 1, 1,
0.4094959, 0.04302163, 1.06366, 0, 0.1372549, 1, 1,
0.4121088, -0.4928261, 3.961224, 0, 0.1294118, 1, 1,
0.4155692, -0.005498385, 1.21395, 0, 0.1254902, 1, 1,
0.417248, 1.109921, 1.877443, 0, 0.1176471, 1, 1,
0.4185231, 0.458229, 0.9790182, 0, 0.1137255, 1, 1,
0.4210565, -0.3205663, 2.012774, 0, 0.1058824, 1, 1,
0.423971, 2.503049, -0.8424693, 0, 0.09803922, 1, 1,
0.4257585, -1.079847, 3.70469, 0, 0.09411765, 1, 1,
0.4384518, -0.0561363, 3.330198, 0, 0.08627451, 1, 1,
0.4461678, -0.3742968, 1.622243, 0, 0.08235294, 1, 1,
0.4472021, -0.8213323, 1.657035, 0, 0.07450981, 1, 1,
0.450642, -0.486087, 2.647706, 0, 0.07058824, 1, 1,
0.4531381, 0.07275997, 2.606139, 0, 0.0627451, 1, 1,
0.4536472, 0.6595701, 1.20671, 0, 0.05882353, 1, 1,
0.454265, -0.1671526, 0.6256928, 0, 0.05098039, 1, 1,
0.4582832, 0.0486862, 1.947917, 0, 0.04705882, 1, 1,
0.4582916, 0.4714798, -0.5413306, 0, 0.03921569, 1, 1,
0.459583, -1.045617, 3.176517, 0, 0.03529412, 1, 1,
0.4602928, -1.217749, 4.575006, 0, 0.02745098, 1, 1,
0.4649249, 0.6329106, -0.3437837, 0, 0.02352941, 1, 1,
0.4665156, -1.374838, 2.749174, 0, 0.01568628, 1, 1,
0.4698414, 0.7021093, -0.3535394, 0, 0.01176471, 1, 1,
0.4729485, -1.272189, 3.847423, 0, 0.003921569, 1, 1,
0.4737619, 0.5337421, 0.4053729, 0.003921569, 0, 1, 1,
0.4810676, -1.817132, 1.453062, 0.007843138, 0, 1, 1,
0.4828475, -0.6960056, 2.567882, 0.01568628, 0, 1, 1,
0.483242, 1.283676, 0.5055812, 0.01960784, 0, 1, 1,
0.4832903, -0.9269832, 3.134997, 0.02745098, 0, 1, 1,
0.4834104, -1.008903, 1.898432, 0.03137255, 0, 1, 1,
0.4854809, 1.054255, -0.8922026, 0.03921569, 0, 1, 1,
0.4897066, 0.8369461, 1.206236, 0.04313726, 0, 1, 1,
0.4946022, 1.325787, 0.3818277, 0.05098039, 0, 1, 1,
0.5022883, -1.339502, 3.439458, 0.05490196, 0, 1, 1,
0.5072559, 0.4556276, 0.9847412, 0.0627451, 0, 1, 1,
0.5084162, 1.381843, 1.846267, 0.06666667, 0, 1, 1,
0.5095204, 0.7755567, 1.623812, 0.07450981, 0, 1, 1,
0.5100856, 0.5244542, 1.099192, 0.07843138, 0, 1, 1,
0.5107087, -0.2269589, 2.716017, 0.08627451, 0, 1, 1,
0.5108516, -1.39281, 2.356893, 0.09019608, 0, 1, 1,
0.5118998, 0.3934985, 1.548018, 0.09803922, 0, 1, 1,
0.5170304, 0.3813163, -0.1827844, 0.1058824, 0, 1, 1,
0.518356, 0.4875698, 1.349872, 0.1098039, 0, 1, 1,
0.5203793, 0.9995271, 0.3755474, 0.1176471, 0, 1, 1,
0.5215724, 0.5707638, 0.4279489, 0.1215686, 0, 1, 1,
0.5232584, -0.5213207, 2.019998, 0.1294118, 0, 1, 1,
0.5255373, -0.4136562, 2.86959, 0.1333333, 0, 1, 1,
0.5273762, -0.9112391, 4.267497, 0.1411765, 0, 1, 1,
0.5302063, 0.2944009, 1.726045, 0.145098, 0, 1, 1,
0.5306174, -0.2348707, 2.18646, 0.1529412, 0, 1, 1,
0.5306515, 0.3868105, 0.2670392, 0.1568628, 0, 1, 1,
0.5308537, -0.5734215, 3.122716, 0.1647059, 0, 1, 1,
0.5334513, 0.1613446, 1.085229, 0.1686275, 0, 1, 1,
0.5336426, 0.04091372, 2.797236, 0.1764706, 0, 1, 1,
0.534673, 1.300277, 0.8687774, 0.1803922, 0, 1, 1,
0.5364161, -0.06787387, 0.9459524, 0.1882353, 0, 1, 1,
0.5370535, 1.686009, 0.7183138, 0.1921569, 0, 1, 1,
0.5406677, 0.2148775, -0.2123984, 0.2, 0, 1, 1,
0.5413934, -0.05856889, 0.876254, 0.2078431, 0, 1, 1,
0.5417621, 0.8310728, 1.660824, 0.2117647, 0, 1, 1,
0.5457463, 0.1772691, 0.9851524, 0.2196078, 0, 1, 1,
0.5505852, -0.6369659, 4.294854, 0.2235294, 0, 1, 1,
0.552366, -2.037045, 4.619898, 0.2313726, 0, 1, 1,
0.5595098, -0.5230449, 1.571238, 0.2352941, 0, 1, 1,
0.5629188, -1.417998, 3.887773, 0.2431373, 0, 1, 1,
0.5674082, 1.253116, 0.01107894, 0.2470588, 0, 1, 1,
0.5701438, 0.5455166, 0.1066883, 0.254902, 0, 1, 1,
0.5707895, -1.068139, 1.89977, 0.2588235, 0, 1, 1,
0.5783202, -0.6827157, 3.081599, 0.2666667, 0, 1, 1,
0.5823694, 1.248005, -0.3875194, 0.2705882, 0, 1, 1,
0.5860482, -0.3022595, 2.677995, 0.2784314, 0, 1, 1,
0.5863879, -1.318379, 1.375831, 0.282353, 0, 1, 1,
0.5915401, 1.25051, -0.5722526, 0.2901961, 0, 1, 1,
0.5940613, 0.2759702, 1.234165, 0.2941177, 0, 1, 1,
0.5943398, -0.4489161, 3.368253, 0.3019608, 0, 1, 1,
0.5954323, 0.3668988, 0.9382747, 0.3098039, 0, 1, 1,
0.5958089, 1.120849, 0.8275303, 0.3137255, 0, 1, 1,
0.5995188, -0.2530119, 1.097622, 0.3215686, 0, 1, 1,
0.5997104, 0.8757917, 1.28701, 0.3254902, 0, 1, 1,
0.6037202, 0.9890952, 0.5322064, 0.3333333, 0, 1, 1,
0.6096628, 0.5072128, -0.4193962, 0.3372549, 0, 1, 1,
0.6113674, -0.6936479, 4.839931, 0.345098, 0, 1, 1,
0.6124071, 0.4309095, 1.761448, 0.3490196, 0, 1, 1,
0.6131483, -0.06050298, 1.497659, 0.3568628, 0, 1, 1,
0.6148703, -1.01883, 1.631578, 0.3607843, 0, 1, 1,
0.6150573, 1.660323, -0.5389748, 0.3686275, 0, 1, 1,
0.6152642, -0.1773031, 0.09735554, 0.372549, 0, 1, 1,
0.6155885, 1.050634, -0.1423592, 0.3803922, 0, 1, 1,
0.623242, 1.395095, -0.321404, 0.3843137, 0, 1, 1,
0.6242687, 1.169835, 0.5697418, 0.3921569, 0, 1, 1,
0.6329924, -0.8435629, 1.12985, 0.3960784, 0, 1, 1,
0.6341788, 0.6290686, 1.553469, 0.4039216, 0, 1, 1,
0.6484195, 0.3159434, 1.156007, 0.4117647, 0, 1, 1,
0.6485122, 0.3679309, 0.214924, 0.4156863, 0, 1, 1,
0.6488453, -0.5687261, 1.191816, 0.4235294, 0, 1, 1,
0.6503886, -2.312915, 1.147198, 0.427451, 0, 1, 1,
0.6549764, 0.8119996, 0.8834714, 0.4352941, 0, 1, 1,
0.6557409, 1.374572, -0.6210327, 0.4392157, 0, 1, 1,
0.6578999, -1.180708, 2.52644, 0.4470588, 0, 1, 1,
0.6609167, 0.7485023, 1.125618, 0.4509804, 0, 1, 1,
0.6611403, -0.07023758, -0.2753496, 0.4588235, 0, 1, 1,
0.6637496, -0.09142336, 2.494448, 0.4627451, 0, 1, 1,
0.6641543, -0.4059898, 2.610404, 0.4705882, 0, 1, 1,
0.6645011, -1.700682, 3.34658, 0.4745098, 0, 1, 1,
0.666342, 1.204257, 1.639408, 0.4823529, 0, 1, 1,
0.6665318, 0.06144447, 1.530477, 0.4862745, 0, 1, 1,
0.6680744, 0.6731139, 0.6897011, 0.4941176, 0, 1, 1,
0.6744162, 1.326053, -0.9084808, 0.5019608, 0, 1, 1,
0.6771526, -0.5497039, 3.599725, 0.5058824, 0, 1, 1,
0.6800186, 0.5158446, 0.178047, 0.5137255, 0, 1, 1,
0.6840022, -0.2644048, 1.133069, 0.5176471, 0, 1, 1,
0.6845425, -0.737634, 1.622393, 0.5254902, 0, 1, 1,
0.6854251, 1.208634, -0.595905, 0.5294118, 0, 1, 1,
0.687562, -0.2356983, 2.964733, 0.5372549, 0, 1, 1,
0.688621, 0.3657227, 2.173077, 0.5411765, 0, 1, 1,
0.6901252, 1.262479, 0.2798981, 0.5490196, 0, 1, 1,
0.6951626, 0.9079422, 0.2651275, 0.5529412, 0, 1, 1,
0.6954525, -0.08216317, 0.4055306, 0.5607843, 0, 1, 1,
0.6995239, 0.2533408, 1.799535, 0.5647059, 0, 1, 1,
0.7066483, 1.323358, 0.1745548, 0.572549, 0, 1, 1,
0.7084543, -0.01258125, 2.22331, 0.5764706, 0, 1, 1,
0.7152314, -0.7199649, 2.947608, 0.5843138, 0, 1, 1,
0.7158222, 0.940385, -0.3277973, 0.5882353, 0, 1, 1,
0.7158468, -0.387289, 1.848113, 0.5960785, 0, 1, 1,
0.7176141, 0.3945104, 0.5989888, 0.6039216, 0, 1, 1,
0.7180752, -1.607398, 2.221422, 0.6078432, 0, 1, 1,
0.7187122, 0.1087713, 1.814014, 0.6156863, 0, 1, 1,
0.7218159, 1.500814, -0.1621348, 0.6196079, 0, 1, 1,
0.7335234, -0.001448595, 2.824963, 0.627451, 0, 1, 1,
0.7337732, -0.7842107, 1.47459, 0.6313726, 0, 1, 1,
0.7341387, 1.608516, 0.9130118, 0.6392157, 0, 1, 1,
0.7344525, -1.201188, 2.549361, 0.6431373, 0, 1, 1,
0.7460768, 0.7217199, 1.106359, 0.6509804, 0, 1, 1,
0.747026, 0.4621737, 0.2105729, 0.654902, 0, 1, 1,
0.7472783, 0.04707385, 1.606601, 0.6627451, 0, 1, 1,
0.7476951, 0.9526607, 2.055786, 0.6666667, 0, 1, 1,
0.7522283, 0.4319595, -0.356349, 0.6745098, 0, 1, 1,
0.7533052, 1.032972, 0.4156674, 0.6784314, 0, 1, 1,
0.7624298, 1.266786, -1.270018, 0.6862745, 0, 1, 1,
0.7654195, 1.879542, -0.6427085, 0.6901961, 0, 1, 1,
0.7676155, -0.07626031, 2.096332, 0.6980392, 0, 1, 1,
0.7737273, -1.645445, 4.000421, 0.7058824, 0, 1, 1,
0.7777235, 0.0977321, 1.52507, 0.7098039, 0, 1, 1,
0.7781745, 0.07784118, 1.005285, 0.7176471, 0, 1, 1,
0.7781959, 0.4212226, 1.562833, 0.7215686, 0, 1, 1,
0.7831552, -0.09484787, 3.981624, 0.7294118, 0, 1, 1,
0.7945285, 0.09556749, 0.123334, 0.7333333, 0, 1, 1,
0.7945388, 0.4950143, 1.346191, 0.7411765, 0, 1, 1,
0.8023272, 0.4847186, 1.603706, 0.7450981, 0, 1, 1,
0.8089402, -0.2234538, -0.633923, 0.7529412, 0, 1, 1,
0.8096882, 0.1679235, 0.9951007, 0.7568628, 0, 1, 1,
0.811955, 0.9204836, 0.5830952, 0.7647059, 0, 1, 1,
0.8128904, 0.687064, 0.7553706, 0.7686275, 0, 1, 1,
0.8157629, 0.4147219, 1.778373, 0.7764706, 0, 1, 1,
0.8211859, 0.05820284, 0.7887754, 0.7803922, 0, 1, 1,
0.8219805, 2.520308, 0.9112052, 0.7882353, 0, 1, 1,
0.8222886, 0.7649039, 1.039319, 0.7921569, 0, 1, 1,
0.8235872, -0.5451778, 1.930379, 0.8, 0, 1, 1,
0.8268855, 1.083355, 0.5028588, 0.8078431, 0, 1, 1,
0.8273642, -0.4742699, 2.191056, 0.8117647, 0, 1, 1,
0.8280273, -2.657972, 1.616146, 0.8196079, 0, 1, 1,
0.8289191, -0.8377385, 4.50748, 0.8235294, 0, 1, 1,
0.8304107, -1.496938, 1.97638, 0.8313726, 0, 1, 1,
0.8362231, -0.3276596, 1.970897, 0.8352941, 0, 1, 1,
0.8362792, -2.186037, 4.107226, 0.8431373, 0, 1, 1,
0.8385744, -2.997178, 2.328793, 0.8470588, 0, 1, 1,
0.8406658, 0.4439712, 0.5644742, 0.854902, 0, 1, 1,
0.8412067, -0.02216453, 3.156903, 0.8588235, 0, 1, 1,
0.8441372, 0.5537338, 0.7987868, 0.8666667, 0, 1, 1,
0.8456801, -2.694017, 1.479009, 0.8705882, 0, 1, 1,
0.8457702, -0.5311398, 3.37248, 0.8784314, 0, 1, 1,
0.8589362, 0.4117046, 0.1034952, 0.8823529, 0, 1, 1,
0.8648188, -0.06467392, 3.778667, 0.8901961, 0, 1, 1,
0.8719729, -0.1630318, 2.307764, 0.8941177, 0, 1, 1,
0.8736628, 0.1275119, 1.731791, 0.9019608, 0, 1, 1,
0.8833299, 0.04552232, 0.6443301, 0.9098039, 0, 1, 1,
0.8858536, -1.90993, 2.910388, 0.9137255, 0, 1, 1,
0.8872994, 0.7874042, 1.089017, 0.9215686, 0, 1, 1,
0.899584, -0.733201, 2.994599, 0.9254902, 0, 1, 1,
0.9007922, 2.129291, -2.881007, 0.9333333, 0, 1, 1,
0.9009991, 0.3871852, 2.385865, 0.9372549, 0, 1, 1,
0.9117928, -0.6936449, 1.935258, 0.945098, 0, 1, 1,
0.9171194, 0.4756173, 0.03252598, 0.9490196, 0, 1, 1,
0.9225512, 0.6425104, 0.1456822, 0.9568627, 0, 1, 1,
0.9314785, -0.480437, 3.336951, 0.9607843, 0, 1, 1,
0.9366547, -0.9280334, 1.814594, 0.9686275, 0, 1, 1,
0.9371359, 0.971046, -0.5479248, 0.972549, 0, 1, 1,
0.9391677, -1.021781, 1.969781, 0.9803922, 0, 1, 1,
0.9405667, -0.1309682, 1.117836, 0.9843137, 0, 1, 1,
0.9407843, -0.1612363, 2.211834, 0.9921569, 0, 1, 1,
0.9413862, 0.6164168, 2.23388, 0.9960784, 0, 1, 1,
0.9547372, 0.5967113, 0.4855984, 1, 0, 0.9960784, 1,
0.9677648, 1.230709, 0.6107043, 1, 0, 0.9882353, 1,
0.9700385, -0.08758696, -0.6328687, 1, 0, 0.9843137, 1,
0.9845845, 0.2345876, 1.681515, 1, 0, 0.9764706, 1,
0.9875672, 0.09398308, 1.276541, 1, 0, 0.972549, 1,
0.9917634, 0.7930102, 1.675173, 1, 0, 0.9647059, 1,
1.007625, 0.9414782, 2.073748, 1, 0, 0.9607843, 1,
1.013576, -1.110475, 3.373887, 1, 0, 0.9529412, 1,
1.021303, -1.687829, 3.623531, 1, 0, 0.9490196, 1,
1.025901, 0.9015527, 1.16277, 1, 0, 0.9411765, 1,
1.025971, -2.258775, 3.558588, 1, 0, 0.9372549, 1,
1.035523, -0.8611603, 2.93813, 1, 0, 0.9294118, 1,
1.040954, -0.2755487, 1.265676, 1, 0, 0.9254902, 1,
1.062962, -0.38611, 3.715177, 1, 0, 0.9176471, 1,
1.064138, 0.6566316, 1.51373, 1, 0, 0.9137255, 1,
1.067019, -0.9469587, 1.884083, 1, 0, 0.9058824, 1,
1.068297, -1.493067, 4.136782, 1, 0, 0.9019608, 1,
1.06992, 0.01953013, 2.219603, 1, 0, 0.8941177, 1,
1.070113, 0.5169888, 0.03426936, 1, 0, 0.8862745, 1,
1.075479, -0.6123301, 2.995917, 1, 0, 0.8823529, 1,
1.078139, 0.470221, 1.142217, 1, 0, 0.8745098, 1,
1.089106, -0.01711259, 1.689941, 1, 0, 0.8705882, 1,
1.093939, 1.008296, 1.680999, 1, 0, 0.8627451, 1,
1.09432, -0.003711823, 3.685849, 1, 0, 0.8588235, 1,
1.109046, -0.2200354, 0.5610166, 1, 0, 0.8509804, 1,
1.111001, -2.65811, 2.676555, 1, 0, 0.8470588, 1,
1.115768, -2.074366, 2.909136, 1, 0, 0.8392157, 1,
1.126112, 1.308813, -0.7182363, 1, 0, 0.8352941, 1,
1.126619, -0.07851733, 1.263222, 1, 0, 0.827451, 1,
1.128237, 1.533396, 0.9836593, 1, 0, 0.8235294, 1,
1.13391, 0.623624, 1.301168, 1, 0, 0.8156863, 1,
1.134541, 2.500974, -0.8938737, 1, 0, 0.8117647, 1,
1.135863, 0.6087139, 2.482472, 1, 0, 0.8039216, 1,
1.142514, 0.2978167, -0.1319328, 1, 0, 0.7960784, 1,
1.143261, 0.06179038, 2.664711, 1, 0, 0.7921569, 1,
1.148131, -1.272296, 2.124335, 1, 0, 0.7843137, 1,
1.148244, 1.896715, 1.901931, 1, 0, 0.7803922, 1,
1.153842, 0.5598246, 1.38491, 1, 0, 0.772549, 1,
1.154905, -1.045696, 1.182959, 1, 0, 0.7686275, 1,
1.163131, 0.4341018, 0.6132292, 1, 0, 0.7607843, 1,
1.169788, 0.2506496, 0.4545563, 1, 0, 0.7568628, 1,
1.174126, 0.1804277, 2.091243, 1, 0, 0.7490196, 1,
1.17437, 0.326094, 1.372652, 1, 0, 0.7450981, 1,
1.176555, 0.2961052, 2.719588, 1, 0, 0.7372549, 1,
1.180996, -1.098346, 3.008772, 1, 0, 0.7333333, 1,
1.187299, 0.985775, -0.2729699, 1, 0, 0.7254902, 1,
1.192309, -1.084878, 3.056828, 1, 0, 0.7215686, 1,
1.193596, 0.2215989, 1.412676, 1, 0, 0.7137255, 1,
1.196933, -1.192386, 3.381915, 1, 0, 0.7098039, 1,
1.215522, 0.01255914, 1.272504, 1, 0, 0.7019608, 1,
1.21616, -0.1039507, 1.35573, 1, 0, 0.6941177, 1,
1.217602, 1.762138, -0.6253646, 1, 0, 0.6901961, 1,
1.219588, -1.275068, 1.342361, 1, 0, 0.682353, 1,
1.227538, -1.165368, 3.38644, 1, 0, 0.6784314, 1,
1.227639, 0.231717, 0.7417346, 1, 0, 0.6705883, 1,
1.228314, -0.233746, 3.446736, 1, 0, 0.6666667, 1,
1.231966, 0.8887271, 1.399702, 1, 0, 0.6588235, 1,
1.24847, -1.989019, 4.207867, 1, 0, 0.654902, 1,
1.250751, -0.2440427, 2.392832, 1, 0, 0.6470588, 1,
1.251794, -0.1691575, 1.267286, 1, 0, 0.6431373, 1,
1.254449, -0.697174, 3.111414, 1, 0, 0.6352941, 1,
1.259647, 0.7506067, 3.050461, 1, 0, 0.6313726, 1,
1.261012, 0.1190231, 1.649478, 1, 0, 0.6235294, 1,
1.262729, 0.2765199, 1.836552, 1, 0, 0.6196079, 1,
1.270156, -0.4038683, 2.414449, 1, 0, 0.6117647, 1,
1.271079, -0.8214585, 3.6091, 1, 0, 0.6078432, 1,
1.273825, 0.2237104, 1.131473, 1, 0, 0.6, 1,
1.274045, -0.09908906, 1.300958, 1, 0, 0.5921569, 1,
1.284572, -0.9043465, 2.499418, 1, 0, 0.5882353, 1,
1.288738, -0.3917665, 3.23491, 1, 0, 0.5803922, 1,
1.298897, 0.2563814, 3.032079, 1, 0, 0.5764706, 1,
1.299607, -1.018966, 1.434508, 1, 0, 0.5686275, 1,
1.300596, 0.5078492, 1.216134, 1, 0, 0.5647059, 1,
1.329568, 2.150905, 0.3829844, 1, 0, 0.5568628, 1,
1.335747, -2.021326, 4.740839, 1, 0, 0.5529412, 1,
1.346295, -1.792722, 3.071711, 1, 0, 0.5450981, 1,
1.361059, -0.8836051, 1.162642, 1, 0, 0.5411765, 1,
1.377273, 0.88388, 0.8917053, 1, 0, 0.5333334, 1,
1.380261, 0.589756, 1.57126, 1, 0, 0.5294118, 1,
1.381273, 0.1461018, 2.008592, 1, 0, 0.5215687, 1,
1.393347, -1.38667, 2.052352, 1, 0, 0.5176471, 1,
1.39395, 0.5940839, 2.247057, 1, 0, 0.509804, 1,
1.399235, 0.04432367, 2.910755, 1, 0, 0.5058824, 1,
1.405501, -1.54467, 1.819999, 1, 0, 0.4980392, 1,
1.409992, -1.280475, 1.313359, 1, 0, 0.4901961, 1,
1.410905, -0.5638523, 0.7580657, 1, 0, 0.4862745, 1,
1.412448, 1.810835, 0.9963546, 1, 0, 0.4784314, 1,
1.413136, 0.7414968, -0.2780693, 1, 0, 0.4745098, 1,
1.413187, -3.038496, 3.810023, 1, 0, 0.4666667, 1,
1.416175, 0.2662927, 0.200953, 1, 0, 0.4627451, 1,
1.421124, 1.578341, 2.201008, 1, 0, 0.454902, 1,
1.425083, 0.6135584, 2.295713, 1, 0, 0.4509804, 1,
1.427098, -1.505316, 2.405431, 1, 0, 0.4431373, 1,
1.427348, 0.1760289, 0.1398912, 1, 0, 0.4392157, 1,
1.429226, 0.486645, 0.6134595, 1, 0, 0.4313726, 1,
1.431848, 1.361743, 1.513876, 1, 0, 0.427451, 1,
1.463604, -0.2031644, 1.09073, 1, 0, 0.4196078, 1,
1.466894, 0.2308775, 1.807397, 1, 0, 0.4156863, 1,
1.474074, -0.892395, 1.927303, 1, 0, 0.4078431, 1,
1.482795, 0.2438604, 1.238373, 1, 0, 0.4039216, 1,
1.483748, 1.075537, 1.672701, 1, 0, 0.3960784, 1,
1.489482, 0.1581003, 2.020682, 1, 0, 0.3882353, 1,
1.496259, -0.6321042, 1.469544, 1, 0, 0.3843137, 1,
1.501622, 0.6415015, 2.243288, 1, 0, 0.3764706, 1,
1.522762, -1.809072, 3.800803, 1, 0, 0.372549, 1,
1.523954, 0.6284549, -0.05325478, 1, 0, 0.3647059, 1,
1.526291, 0.03408415, 0.8649408, 1, 0, 0.3607843, 1,
1.529991, 0.5259522, 0.05004314, 1, 0, 0.3529412, 1,
1.550836, -1.226171, 1.486898, 1, 0, 0.3490196, 1,
1.555082, 0.126527, 2.77685, 1, 0, 0.3411765, 1,
1.59016, -2.08994, 2.664141, 1, 0, 0.3372549, 1,
1.596122, 1.037398, 0.4510314, 1, 0, 0.3294118, 1,
1.599569, -0.7842324, 2.164437, 1, 0, 0.3254902, 1,
1.607604, -0.05575642, 1.988237, 1, 0, 0.3176471, 1,
1.633057, -0.4209182, 1.51399, 1, 0, 0.3137255, 1,
1.653436, 0.7099891, 0.2722486, 1, 0, 0.3058824, 1,
1.653548, -1.265258, 0.3408067, 1, 0, 0.2980392, 1,
1.659228, -0.2208439, 2.122021, 1, 0, 0.2941177, 1,
1.688368, -0.03003, 2.010664, 1, 0, 0.2862745, 1,
1.693178, -1.343152, 2.768318, 1, 0, 0.282353, 1,
1.715231, 1.974818, 0.09784745, 1, 0, 0.2745098, 1,
1.756191, 0.06734155, 3.897333, 1, 0, 0.2705882, 1,
1.757564, 0.4610284, 1.667266, 1, 0, 0.2627451, 1,
1.778288, -1.52397, 0.8840595, 1, 0, 0.2588235, 1,
1.782079, 0.2783037, -1.045346, 1, 0, 0.2509804, 1,
1.802357, 0.2331367, 1.057953, 1, 0, 0.2470588, 1,
1.81757, 0.3566506, 0.5811605, 1, 0, 0.2392157, 1,
1.82342, -2.547044, 3.284474, 1, 0, 0.2352941, 1,
1.825666, -0.5048521, 1.993756, 1, 0, 0.227451, 1,
1.83209, -0.7951217, 2.909926, 1, 0, 0.2235294, 1,
1.854775, 0.9073994, 3.197346, 1, 0, 0.2156863, 1,
1.862409, 0.1163074, 1.114896, 1, 0, 0.2117647, 1,
1.870544, -0.705094, 0.2050083, 1, 0, 0.2039216, 1,
1.88617, 0.499546, -0.09644897, 1, 0, 0.1960784, 1,
1.892142, 0.268787, 1.104624, 1, 0, 0.1921569, 1,
1.899357, 0.8598157, 2.031978, 1, 0, 0.1843137, 1,
1.912919, -0.1628287, 2.893706, 1, 0, 0.1803922, 1,
1.917781, 0.09894798, 1.475687, 1, 0, 0.172549, 1,
1.925524, 0.8682629, 0.6604042, 1, 0, 0.1686275, 1,
1.926419, 0.6261985, 0.7898226, 1, 0, 0.1607843, 1,
1.937573, -0.9584631, 2.563494, 1, 0, 0.1568628, 1,
1.944111, 0.553646, 1.143918, 1, 0, 0.1490196, 1,
1.954999, 0.3521763, 1.58015, 1, 0, 0.145098, 1,
1.966659, -1.91984, 1.606233, 1, 0, 0.1372549, 1,
1.974503, -1.880549, 0.3496138, 1, 0, 0.1333333, 1,
1.976997, -0.74859, 1.086988, 1, 0, 0.1254902, 1,
2.017512, -0.3108377, 0.4369892, 1, 0, 0.1215686, 1,
2.041625, -0.0004055931, 0.569203, 1, 0, 0.1137255, 1,
2.042435, -0.1011564, 1.336605, 1, 0, 0.1098039, 1,
2.064022, -0.1073293, 2.222837, 1, 0, 0.1019608, 1,
2.087946, -1.043835, 0.6266725, 1, 0, 0.09411765, 1,
2.090867, -1.382559, 3.827132, 1, 0, 0.09019608, 1,
2.107275, 1.651459, 2.747579, 1, 0, 0.08235294, 1,
2.159023, 1.916975, 0.3797714, 1, 0, 0.07843138, 1,
2.176792, -0.04566667, 1.14186, 1, 0, 0.07058824, 1,
2.19876, -1.084147, 2.788722, 1, 0, 0.06666667, 1,
2.270389, 0.2209547, 2.69794, 1, 0, 0.05882353, 1,
2.282851, 0.3732975, -0.04720451, 1, 0, 0.05490196, 1,
2.286654, -1.359551, 1.061066, 1, 0, 0.04705882, 1,
2.303324, -1.13118, 2.472977, 1, 0, 0.04313726, 1,
2.331449, 1.133002, 0.9152354, 1, 0, 0.03529412, 1,
2.364034, 1.120463, 0.2347623, 1, 0, 0.03137255, 1,
2.540696, 0.978171, 1.434803, 1, 0, 0.02352941, 1,
2.622885, 0.07345981, 2.269086, 1, 0, 0.01960784, 1,
2.643731, 0.1789199, 1.095308, 1, 0, 0.01176471, 1,
2.655381, 0.06872588, 2.729138, 1, 0, 0.007843138, 1
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
-0.0433861, -3.982268, -7.623955, 0, -0.5, 0.5, 0.5,
-0.0433861, -3.982268, -7.623955, 1, -0.5, 0.5, 0.5,
-0.0433861, -3.982268, -7.623955, 1, 1.5, 0.5, 0.5,
-0.0433861, -3.982268, -7.623955, 0, 1.5, 0.5, 0.5
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
-3.657036, -0.2545061, -7.623955, 0, -0.5, 0.5, 0.5,
-3.657036, -0.2545061, -7.623955, 1, -0.5, 0.5, 0.5,
-3.657036, -0.2545061, -7.623955, 1, 1.5, 0.5, 0.5,
-3.657036, -0.2545061, -7.623955, 0, 1.5, 0.5, 0.5
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
-3.657036, -3.982268, 0.2143741, 0, -0.5, 0.5, 0.5,
-3.657036, -3.982268, 0.2143741, 1, -0.5, 0.5, 0.5,
-3.657036, -3.982268, 0.2143741, 1, 1.5, 0.5, 0.5,
-3.657036, -3.982268, 0.2143741, 0, 1.5, 0.5, 0.5
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
-2, -3.122015, -5.815109,
2, -3.122015, -5.815109,
-2, -3.122015, -5.815109,
-2, -3.265391, -6.116584,
-1, -3.122015, -5.815109,
-1, -3.265391, -6.116584,
0, -3.122015, -5.815109,
0, -3.265391, -6.116584,
1, -3.122015, -5.815109,
1, -3.265391, -6.116584,
2, -3.122015, -5.815109,
2, -3.265391, -6.116584
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
-2, -3.552142, -6.719532, 0, -0.5, 0.5, 0.5,
-2, -3.552142, -6.719532, 1, -0.5, 0.5, 0.5,
-2, -3.552142, -6.719532, 1, 1.5, 0.5, 0.5,
-2, -3.552142, -6.719532, 0, 1.5, 0.5, 0.5,
-1, -3.552142, -6.719532, 0, -0.5, 0.5, 0.5,
-1, -3.552142, -6.719532, 1, -0.5, 0.5, 0.5,
-1, -3.552142, -6.719532, 1, 1.5, 0.5, 0.5,
-1, -3.552142, -6.719532, 0, 1.5, 0.5, 0.5,
0, -3.552142, -6.719532, 0, -0.5, 0.5, 0.5,
0, -3.552142, -6.719532, 1, -0.5, 0.5, 0.5,
0, -3.552142, -6.719532, 1, 1.5, 0.5, 0.5,
0, -3.552142, -6.719532, 0, 1.5, 0.5, 0.5,
1, -3.552142, -6.719532, 0, -0.5, 0.5, 0.5,
1, -3.552142, -6.719532, 1, -0.5, 0.5, 0.5,
1, -3.552142, -6.719532, 1, 1.5, 0.5, 0.5,
1, -3.552142, -6.719532, 0, 1.5, 0.5, 0.5,
2, -3.552142, -6.719532, 0, -0.5, 0.5, 0.5,
2, -3.552142, -6.719532, 1, -0.5, 0.5, 0.5,
2, -3.552142, -6.719532, 1, 1.5, 0.5, 0.5,
2, -3.552142, -6.719532, 0, 1.5, 0.5, 0.5
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
-2.823117, -3, -5.815109,
-2.823117, 2, -5.815109,
-2.823117, -3, -5.815109,
-2.962103, -3, -6.116584,
-2.823117, -2, -5.815109,
-2.962103, -2, -6.116584,
-2.823117, -1, -5.815109,
-2.962103, -1, -6.116584,
-2.823117, 0, -5.815109,
-2.962103, 0, -6.116584,
-2.823117, 1, -5.815109,
-2.962103, 1, -6.116584,
-2.823117, 2, -5.815109,
-2.962103, 2, -6.116584
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
-3.240076, -3, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, -3, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, -3, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, -3, -6.719532, 0, 1.5, 0.5, 0.5,
-3.240076, -2, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, -2, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, -2, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, -2, -6.719532, 0, 1.5, 0.5, 0.5,
-3.240076, -1, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, -1, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, -1, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, -1, -6.719532, 0, 1.5, 0.5, 0.5,
-3.240076, 0, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, 0, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, 0, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, 0, -6.719532, 0, 1.5, 0.5, 0.5,
-3.240076, 1, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, 1, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, 1, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, 1, -6.719532, 0, 1.5, 0.5, 0.5,
-3.240076, 2, -6.719532, 0, -0.5, 0.5, 0.5,
-3.240076, 2, -6.719532, 1, -0.5, 0.5, 0.5,
-3.240076, 2, -6.719532, 1, 1.5, 0.5, 0.5,
-3.240076, 2, -6.719532, 0, 1.5, 0.5, 0.5
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
-2.823117, -3.122015, -4,
-2.823117, -3.122015, 6,
-2.823117, -3.122015, -4,
-2.962103, -3.265391, -4,
-2.823117, -3.122015, -2,
-2.962103, -3.265391, -2,
-2.823117, -3.122015, 0,
-2.962103, -3.265391, 0,
-2.823117, -3.122015, 2,
-2.962103, -3.265391, 2,
-2.823117, -3.122015, 4,
-2.962103, -3.265391, 4,
-2.823117, -3.122015, 6,
-2.962103, -3.265391, 6
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
"4",
"6"
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
-3.240076, -3.552142, -4, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, -4, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, -4, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, -4, 0, 1.5, 0.5, 0.5,
-3.240076, -3.552142, -2, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, -2, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, -2, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, -2, 0, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 0, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 0, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 0, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 0, 0, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 2, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 2, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 2, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 2, 0, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 4, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 4, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 4, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 4, 0, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 6, 0, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 6, 1, -0.5, 0.5, 0.5,
-3.240076, -3.552142, 6, 1, 1.5, 0.5, 0.5,
-3.240076, -3.552142, 6, 0, 1.5, 0.5, 0.5
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
-2.823117, -3.122015, -5.815109,
-2.823117, 2.613003, -5.815109,
-2.823117, -3.122015, 6.243857,
-2.823117, 2.613003, 6.243857,
-2.823117, -3.122015, -5.815109,
-2.823117, -3.122015, 6.243857,
-2.823117, 2.613003, -5.815109,
-2.823117, 2.613003, 6.243857,
-2.823117, -3.122015, -5.815109,
2.736345, -3.122015, -5.815109,
-2.823117, -3.122015, 6.243857,
2.736345, -3.122015, 6.243857,
-2.823117, 2.613003, -5.815109,
2.736345, 2.613003, -5.815109,
-2.823117, 2.613003, 6.243857,
2.736345, 2.613003, 6.243857,
2.736345, -3.122015, -5.815109,
2.736345, 2.613003, -5.815109,
2.736345, -3.122015, 6.243857,
2.736345, 2.613003, 6.243857,
2.736345, -3.122015, -5.815109,
2.736345, -3.122015, 6.243857,
2.736345, 2.613003, -5.815109,
2.736345, 2.613003, 6.243857
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
var radius = 7.723669;
var distance = 34.36348;
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
mvMatrix.translate( 0.0433861, 0.2545061, -0.2143741 );
mvMatrix.scale( 1.502121, 1.456139, 0.6925123 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36348);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
1-naphthylacetic_aci<-read.table("1-naphthylacetic_aci.xyz", skip=1)
```

```
## Error in read.table("1-naphthylacetic_aci.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-1-naphthylacetic_aci$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthylacetic_aci' not found
```

```r
y<-1-naphthylacetic_aci$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthylacetic_aci' not found
```

```r
z<-1-naphthylacetic_aci$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthylacetic_aci' not found
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
-2.742154, -0.876997, -1.1049, 0, 0, 1, 1, 1,
-2.720551, 1.144612, -1.338935, 1, 0, 0, 1, 1,
-2.701251, 1.021918, -1.626179, 1, 0, 0, 1, 1,
-2.601777, -1.367262, -1.681839, 1, 0, 0, 1, 1,
-2.536709, -0.1828189, -0.1109756, 1, 0, 0, 1, 1,
-2.489376, 0.03685397, -0.7014018, 1, 0, 0, 1, 1,
-2.451745, 0.5573418, -0.1938987, 0, 0, 0, 1, 1,
-2.434787, 0.3005203, -1.107484, 0, 0, 0, 1, 1,
-2.392004, -0.8803101, -1.723669, 0, 0, 0, 1, 1,
-2.308432, 0.5870248, -0.4500801, 0, 0, 0, 1, 1,
-2.274894, 1.845002, -1.14035, 0, 0, 0, 1, 1,
-2.225925, 0.5829461, -0.3538884, 0, 0, 0, 1, 1,
-2.189766, 0.8874392, -1.432261, 0, 0, 0, 1, 1,
-2.113343, -0.01654017, -3.595339, 1, 1, 1, 1, 1,
-2.107836, 0.9361885, -3.427744, 1, 1, 1, 1, 1,
-2.094693, 0.5444542, 0.3506791, 1, 1, 1, 1, 1,
-2.09285, -1.21471, -0.7838258, 1, 1, 1, 1, 1,
-2.084972, 1.634677, 0.1970778, 1, 1, 1, 1, 1,
-2.060186, -0.6536117, -4.033147, 1, 1, 1, 1, 1,
-2.04574, 0.2549382, 0.4236932, 1, 1, 1, 1, 1,
-2.02843, -0.4212408, 0.4589162, 1, 1, 1, 1, 1,
-2.007766, 0.7122553, -0.8918602, 1, 1, 1, 1, 1,
-1.978969, 0.04315749, -0.169471, 1, 1, 1, 1, 1,
-1.949275, -0.3685376, -2.090556, 1, 1, 1, 1, 1,
-1.935326, 1.306378, -3.249206, 1, 1, 1, 1, 1,
-1.921598, -0.4280598, -2.534801, 1, 1, 1, 1, 1,
-1.905098, -0.03942776, -1.217762, 1, 1, 1, 1, 1,
-1.894176, -1.335189, -1.88429, 1, 1, 1, 1, 1,
-1.864052, -0.8865896, -1.997164, 0, 0, 1, 1, 1,
-1.85424, 0.9513421, -0.2202965, 1, 0, 0, 1, 1,
-1.838732, -0.5975848, -0.8032062, 1, 0, 0, 1, 1,
-1.825707, -1.28019, -2.00591, 1, 0, 0, 1, 1,
-1.776532, 0.1219771, -0.8767386, 1, 0, 0, 1, 1,
-1.776181, -1.593, -2.125942, 1, 0, 0, 1, 1,
-1.773455, 0.7723142, -0.02109721, 0, 0, 0, 1, 1,
-1.772096, 0.8055204, 0.1714236, 0, 0, 0, 1, 1,
-1.769263, -1.449994, -1.90538, 0, 0, 0, 1, 1,
-1.73528, 1.682747, -0.182718, 0, 0, 0, 1, 1,
-1.698948, -1.601709, -2.16805, 0, 0, 0, 1, 1,
-1.659355, 0.5859463, -0.1162823, 0, 0, 0, 1, 1,
-1.649331, -0.3793719, -0.7578555, 0, 0, 0, 1, 1,
-1.633088, -0.4933061, -0.958532, 1, 1, 1, 1, 1,
-1.629389, -0.3397597, -1.998695, 1, 1, 1, 1, 1,
-1.597335, 0.6369586, -2.818549, 1, 1, 1, 1, 1,
-1.592459, -0.5057831, -1.099776, 1, 1, 1, 1, 1,
-1.589795, -0.8093362, -2.598724, 1, 1, 1, 1, 1,
-1.589484, -0.5981043, -2.569385, 1, 1, 1, 1, 1,
-1.581988, -1.295946, -1.629596, 1, 1, 1, 1, 1,
-1.574449, 0.1222798, -1.13434, 1, 1, 1, 1, 1,
-1.571075, 1.009853, -1.574366, 1, 1, 1, 1, 1,
-1.570544, -1.857547, -2.555998, 1, 1, 1, 1, 1,
-1.569115, -1.220437, -3.6414, 1, 1, 1, 1, 1,
-1.557975, 0.4564946, -0.920733, 1, 1, 1, 1, 1,
-1.552761, -1.314957, -2.211459, 1, 1, 1, 1, 1,
-1.550031, 1.048602, -1.069137, 1, 1, 1, 1, 1,
-1.504369, -1.123011, -2.801913, 1, 1, 1, 1, 1,
-1.486946, -0.02279803, -3.080574, 0, 0, 1, 1, 1,
-1.482632, 0.5346577, -2.329267, 1, 0, 0, 1, 1,
-1.481741, 0.7636043, -0.9756595, 1, 0, 0, 1, 1,
-1.474586, -1.91328, -1.289588, 1, 0, 0, 1, 1,
-1.466897, 0.5891612, -1.103068, 1, 0, 0, 1, 1,
-1.464037, 1.674311, -0.4898847, 1, 0, 0, 1, 1,
-1.462324, -0.01299003, -2.506383, 0, 0, 0, 1, 1,
-1.45735, 1.341353, 0.354668, 0, 0, 0, 1, 1,
-1.450874, -0.6870087, -2.307053, 0, 0, 0, 1, 1,
-1.436875, 0.2775331, -1.064232, 0, 0, 0, 1, 1,
-1.426317, -0.6378872, -1.285147, 0, 0, 0, 1, 1,
-1.425004, 0.2198146, -3.131395, 0, 0, 0, 1, 1,
-1.417837, -0.2668594, -2.264139, 0, 0, 0, 1, 1,
-1.417272, -0.8005977, -3.510105, 1, 1, 1, 1, 1,
-1.413248, -0.6466053, -2.801913, 1, 1, 1, 1, 1,
-1.37299, 0.196454, -2.092776, 1, 1, 1, 1, 1,
-1.371096, 0.2932498, -0.3321969, 1, 1, 1, 1, 1,
-1.367898, -0.3439584, -1.708672, 1, 1, 1, 1, 1,
-1.364227, 0.1798054, -2.128671, 1, 1, 1, 1, 1,
-1.360172, 1.431329, -1.107875, 1, 1, 1, 1, 1,
-1.346513, 1.687525, -0.8426242, 1, 1, 1, 1, 1,
-1.331309, 2.074945, -0.7949184, 1, 1, 1, 1, 1,
-1.326283, 0.7369738, -2.841018, 1, 1, 1, 1, 1,
-1.321904, -0.543021, -2.638477, 1, 1, 1, 1, 1,
-1.318978, 1.87257, -2.463423, 1, 1, 1, 1, 1,
-1.31541, 0.9800917, 0.06572748, 1, 1, 1, 1, 1,
-1.313787, -0.4410305, -2.879324, 1, 1, 1, 1, 1,
-1.292947, 2.273645, -1.358624, 1, 1, 1, 1, 1,
-1.292527, -0.313249, -2.314167, 0, 0, 1, 1, 1,
-1.289387, 1.2013, -0.2558587, 1, 0, 0, 1, 1,
-1.28671, 0.2343136, -1.23709, 1, 0, 0, 1, 1,
-1.285249, 0.3219861, -0.1504581, 1, 0, 0, 1, 1,
-1.28074, 1.013747, -1.078209, 1, 0, 0, 1, 1,
-1.278998, 0.4931686, -1.223641, 1, 0, 0, 1, 1,
-1.277134, 0.3817195, -1.511149, 0, 0, 0, 1, 1,
-1.269694, -2.228497, -1.962005, 0, 0, 0, 1, 1,
-1.268255, -0.06535994, -1.864187, 0, 0, 0, 1, 1,
-1.260398, -0.1750862, 0.2529351, 0, 0, 0, 1, 1,
-1.254012, 1.973533, -1.779377, 0, 0, 0, 1, 1,
-1.253964, 0.3156795, -1.531757, 0, 0, 0, 1, 1,
-1.253877, 1.560212, -0.8346306, 0, 0, 0, 1, 1,
-1.253692, 1.841278, -0.8666504, 1, 1, 1, 1, 1,
-1.235727, -1.327301, -3.31013, 1, 1, 1, 1, 1,
-1.235299, -1.154561, -2.945173, 1, 1, 1, 1, 1,
-1.225897, -1.280292, -3.792917, 1, 1, 1, 1, 1,
-1.219209, 0.8506835, -0.762903, 1, 1, 1, 1, 1,
-1.217883, -0.6206664, -1.416508, 1, 1, 1, 1, 1,
-1.214328, 0.01278387, -2.197458, 1, 1, 1, 1, 1,
-1.203859, 0.06294862, -2.131733, 1, 1, 1, 1, 1,
-1.203321, -0.7975574, -2.174655, 1, 1, 1, 1, 1,
-1.200975, 0.3405823, -0.2088316, 1, 1, 1, 1, 1,
-1.199491, -0.8177676, -2.948789, 1, 1, 1, 1, 1,
-1.196864, -0.7532002, -2.073413, 1, 1, 1, 1, 1,
-1.190433, -0.2050233, -1.548453, 1, 1, 1, 1, 1,
-1.190408, -2.231542, -1.45003, 1, 1, 1, 1, 1,
-1.188369, 1.160555, -1.80537, 1, 1, 1, 1, 1,
-1.187901, 1.045913, -0.3726504, 0, 0, 1, 1, 1,
-1.182992, 0.2140433, -1.388168, 1, 0, 0, 1, 1,
-1.174573, 0.3839636, -1.48457, 1, 0, 0, 1, 1,
-1.169799, -1.771532, -3.624142, 1, 0, 0, 1, 1,
-1.169052, -0.9127812, -1.207454, 1, 0, 0, 1, 1,
-1.163014, -0.8397759, -1.743257, 1, 0, 0, 1, 1,
-1.161712, 0.6994506, -2.233213, 0, 0, 0, 1, 1,
-1.134594, 0.269625, -0.6471384, 0, 0, 0, 1, 1,
-1.134316, -0.1692254, -2.409929, 0, 0, 0, 1, 1,
-1.128424, -1.533535, -2.280502, 0, 0, 0, 1, 1,
-1.123181, 1.37352, 0.471572, 0, 0, 0, 1, 1,
-1.121062, 0.2817464, -1.798245, 0, 0, 0, 1, 1,
-1.120516, 1.42676, 0.05913987, 0, 0, 0, 1, 1,
-1.108493, -0.5105081, -2.799506, 1, 1, 1, 1, 1,
-1.106002, 0.1604865, -2.244616, 1, 1, 1, 1, 1,
-1.105944, -0.8614615, -2.172131, 1, 1, 1, 1, 1,
-1.105524, -1.167579, -1.279571, 1, 1, 1, 1, 1,
-1.103872, -0.2068725, -1.130557, 1, 1, 1, 1, 1,
-1.096246, 0.6659836, 1.045462, 1, 1, 1, 1, 1,
-1.095875, -1.368621, -3.303735, 1, 1, 1, 1, 1,
-1.084406, -0.3468837, -2.179764, 1, 1, 1, 1, 1,
-1.081243, 0.06471478, -2.130128, 1, 1, 1, 1, 1,
-1.07755, -0.5199665, -2.735189, 1, 1, 1, 1, 1,
-1.069482, 0.9164087, -1.699234, 1, 1, 1, 1, 1,
-1.063561, -0.4469307, -1.564889, 1, 1, 1, 1, 1,
-1.060655, -0.2917855, -2.133747, 1, 1, 1, 1, 1,
-1.059623, 0.496036, -1.460477, 1, 1, 1, 1, 1,
-1.055866, -0.351143, -3.812483, 1, 1, 1, 1, 1,
-1.051924, -1.074508, -2.081913, 0, 0, 1, 1, 1,
-1.051481, 0.4071439, -1.371917, 1, 0, 0, 1, 1,
-1.045176, -1.202937, -1.261443, 1, 0, 0, 1, 1,
-1.041291, 0.7577714, -1.307599, 1, 0, 0, 1, 1,
-1.033321, -0.7354918, -2.455201, 1, 0, 0, 1, 1,
-1.033245, 0.1106375, -1.850931, 1, 0, 0, 1, 1,
-1.026649, 0.6703972, -0.2984524, 0, 0, 0, 1, 1,
-1.018714, 1.147573, -1.737604, 0, 0, 0, 1, 1,
-1.012729, 0.6337528, -0.5051777, 0, 0, 0, 1, 1,
-1.007169, 0.4279953, -0.1541611, 0, 0, 0, 1, 1,
-1.006147, 0.3935481, -1.993092, 0, 0, 0, 1, 1,
-1.005124, -0.6575119, -3.146576, 0, 0, 0, 1, 1,
-1.002533, 1.20528, -1.374265, 0, 0, 0, 1, 1,
-0.9988706, 1.044706, -0.4198073, 1, 1, 1, 1, 1,
-0.9939312, 1.304419, 0.2406483, 1, 1, 1, 1, 1,
-0.9924389, -0.3243641, -1.362211, 1, 1, 1, 1, 1,
-0.9902427, -1.890591, -2.824331, 1, 1, 1, 1, 1,
-0.9895645, 0.2913508, -1.016196, 1, 1, 1, 1, 1,
-0.984601, 0.4643756, -1.284457, 1, 1, 1, 1, 1,
-0.9838868, 0.8515635, -1.309729, 1, 1, 1, 1, 1,
-0.9817929, 1.312864, 1.113025, 1, 1, 1, 1, 1,
-0.9779994, 0.8889805, -1.607283, 1, 1, 1, 1, 1,
-0.9763438, 0.4488945, -1.714496, 1, 1, 1, 1, 1,
-0.9736686, 1.405694, -0.539939, 1, 1, 1, 1, 1,
-0.9717987, -0.4162301, -3.417229, 1, 1, 1, 1, 1,
-0.9693847, 1.710904, 0.4007937, 1, 1, 1, 1, 1,
-0.9664366, -0.0248641, -1.122432, 1, 1, 1, 1, 1,
-0.9632638, -0.08286073, -1.070597, 1, 1, 1, 1, 1,
-0.959587, -0.4054415, -1.282352, 0, 0, 1, 1, 1,
-0.9564329, 0.958285, -2.73193, 1, 0, 0, 1, 1,
-0.9462217, -0.7570332, -2.151325, 1, 0, 0, 1, 1,
-0.9442464, 0.7584804, -0.3550992, 1, 0, 0, 1, 1,
-0.9357703, -0.9547034, -1.925621, 1, 0, 0, 1, 1,
-0.9334578, -0.359743, -2.127009, 1, 0, 0, 1, 1,
-0.933398, -0.08633753, -1.709768, 0, 0, 0, 1, 1,
-0.9270957, -1.429556, -3.231354, 0, 0, 0, 1, 1,
-0.9121336, -0.7164742, -2.530612, 0, 0, 0, 1, 1,
-0.9079274, -0.4949575, -0.9150671, 0, 0, 0, 1, 1,
-0.9012936, 0.6482014, -0.9312348, 0, 0, 0, 1, 1,
-0.8994287, 0.4114505, -3.396644, 0, 0, 0, 1, 1,
-0.8954978, -0.8319414, -1.891955, 0, 0, 0, 1, 1,
-0.8891686, 1.432641, 0.1743582, 1, 1, 1, 1, 1,
-0.8839265, 1.929362, 0.2082476, 1, 1, 1, 1, 1,
-0.8825005, 1.422992, 0.1938714, 1, 1, 1, 1, 1,
-0.8760177, 0.5480688, -1.976453, 1, 1, 1, 1, 1,
-0.8749649, -1.6426, -1.837594, 1, 1, 1, 1, 1,
-0.8702816, 0.1886321, -1.915179, 1, 1, 1, 1, 1,
-0.8661091, -2.159876, -4.629954, 1, 1, 1, 1, 1,
-0.8589866, 0.3195951, -2.207869, 1, 1, 1, 1, 1,
-0.8566526, -0.7897728, -0.7731909, 1, 1, 1, 1, 1,
-0.8532465, -0.9377958, -4.056664, 1, 1, 1, 1, 1,
-0.8516501, -0.0008599926, -2.881135, 1, 1, 1, 1, 1,
-0.8468872, 0.07529273, -1.819458, 1, 1, 1, 1, 1,
-0.8460999, -0.07769879, -1.768765, 1, 1, 1, 1, 1,
-0.8404178, -0.2729678, -1.827451, 1, 1, 1, 1, 1,
-0.8400088, -1.737628, -3.122118, 1, 1, 1, 1, 1,
-0.8396647, -0.1549884, -1.516374, 0, 0, 1, 1, 1,
-0.838604, 0.2587983, -1.300493, 1, 0, 0, 1, 1,
-0.8301241, 0.1357752, -3.515793, 1, 0, 0, 1, 1,
-0.8251173, 0.6658608, -1.949816, 1, 0, 0, 1, 1,
-0.8240485, 0.5064065, -2.347741, 1, 0, 0, 1, 1,
-0.8231922, 1.043021, -0.2894951, 1, 0, 0, 1, 1,
-0.8121275, -0.8199118, -0.8670179, 0, 0, 0, 1, 1,
-0.8033528, -0.5357716, -0.4260674, 0, 0, 0, 1, 1,
-0.79823, -1.497506, -4.885322, 0, 0, 0, 1, 1,
-0.796331, -0.2691942, -1.353183, 0, 0, 0, 1, 1,
-0.788175, 1.194651, -0.874684, 0, 0, 0, 1, 1,
-0.7860881, -0.5814006, -2.489731, 0, 0, 0, 1, 1,
-0.7851771, -1.007753, -2.39097, 0, 0, 0, 1, 1,
-0.7851701, -1.520345, -2.808628, 1, 1, 1, 1, 1,
-0.785087, 2.043559, -1.574964, 1, 1, 1, 1, 1,
-0.7693537, -0.3069421, -2.792495, 1, 1, 1, 1, 1,
-0.7685097, 0.2881011, -1.780748, 1, 1, 1, 1, 1,
-0.7674326, -0.5526956, -1.463267, 1, 1, 1, 1, 1,
-0.7617034, -0.04818581, -1.580004, 1, 1, 1, 1, 1,
-0.7596707, 0.2035072, -0.4479887, 1, 1, 1, 1, 1,
-0.7530326, 0.6499556, -0.9574475, 1, 1, 1, 1, 1,
-0.7513627, 0.04664293, -3.4876, 1, 1, 1, 1, 1,
-0.7444967, -1.004328, -2.067811, 1, 1, 1, 1, 1,
-0.7435867, -0.8864123, -0.7360733, 1, 1, 1, 1, 1,
-0.7411067, 0.7683675, -2.501683, 1, 1, 1, 1, 1,
-0.7392923, -0.4901301, -2.270265, 1, 1, 1, 1, 1,
-0.7377978, 0.7122433, -0.589541, 1, 1, 1, 1, 1,
-0.7347325, 1.008747, -1.429601, 1, 1, 1, 1, 1,
-0.7310128, -0.9234766, -2.736137, 0, 0, 1, 1, 1,
-0.7305639, -0.8998903, -0.3318914, 1, 0, 0, 1, 1,
-0.7294763, -1.939887, -3.377033, 1, 0, 0, 1, 1,
-0.7122761, 0.83639, 0.4167819, 1, 0, 0, 1, 1,
-0.7052901, 0.2798599, -1.616694, 1, 0, 0, 1, 1,
-0.6995869, 1.685028, 0.3189703, 1, 0, 0, 1, 1,
-0.6978105, -0.969363, -1.412151, 0, 0, 0, 1, 1,
-0.6956949, 1.400168, -2.398123, 0, 0, 0, 1, 1,
-0.6935174, -0.3490171, -1.416529, 0, 0, 0, 1, 1,
-0.6796733, -0.5475299, -2.017977, 0, 0, 0, 1, 1,
-0.6744721, 0.607371, -3.696125, 0, 0, 0, 1, 1,
-0.6737833, 0.6583841, -1.755538, 0, 0, 0, 1, 1,
-0.6706439, -0.2114018, -2.764329, 0, 0, 0, 1, 1,
-0.6683409, -0.4936084, -1.662211, 1, 1, 1, 1, 1,
-0.6645777, 1.208241, -0.6693164, 1, 1, 1, 1, 1,
-0.6597816, 0.8061854, 0.1819552, 1, 1, 1, 1, 1,
-0.6554267, 1.257942, -0.06370525, 1, 1, 1, 1, 1,
-0.6494815, 1.3022, -1.121146, 1, 1, 1, 1, 1,
-0.6490214, 0.1387461, -1.150235, 1, 1, 1, 1, 1,
-0.6463354, -0.9442318, -2.717973, 1, 1, 1, 1, 1,
-0.6432599, 1.828388, -0.4413027, 1, 1, 1, 1, 1,
-0.6363088, 1.076321, -1.195713, 1, 1, 1, 1, 1,
-0.6331869, -0.1943207, -2.46349, 1, 1, 1, 1, 1,
-0.6316427, -0.321938, -2.541595, 1, 1, 1, 1, 1,
-0.6290012, 1.546344, -0.01117256, 1, 1, 1, 1, 1,
-0.6236568, -1.440134, -2.135624, 1, 1, 1, 1, 1,
-0.6214533, 0.2079982, -0.8366117, 1, 1, 1, 1, 1,
-0.6213849, 0.9791552, 0.07130326, 1, 1, 1, 1, 1,
-0.6207855, 1.783779, 0.08825327, 0, 0, 1, 1, 1,
-0.6189486, -0.08470015, -0.9470343, 1, 0, 0, 1, 1,
-0.6150341, -0.5162424, -3.951239, 1, 0, 0, 1, 1,
-0.6137791, -1.75088, -3.876201, 1, 0, 0, 1, 1,
-0.6089219, 0.2293944, -2.047401, 1, 0, 0, 1, 1,
-0.6037512, -1.603822, -3.154311, 1, 0, 0, 1, 1,
-0.6016312, 0.3407036, -1.826669, 0, 0, 0, 1, 1,
-0.5985532, 2.121151, 0.2070488, 0, 0, 0, 1, 1,
-0.5983771, -0.4571313, -1.020577, 0, 0, 0, 1, 1,
-0.597742, -0.03326935, 0.3740176, 0, 0, 0, 1, 1,
-0.5868347, -0.6776817, -2.49371, 0, 0, 0, 1, 1,
-0.5868162, 0.7663243, -2.469868, 0, 0, 0, 1, 1,
-0.5787278, -0.2051675, -1.33053, 0, 0, 0, 1, 1,
-0.5775497, 0.01336909, -2.077268, 1, 1, 1, 1, 1,
-0.5717991, 0.7883731, -1.576375, 1, 1, 1, 1, 1,
-0.571089, 1.172276, 0.5102338, 1, 1, 1, 1, 1,
-0.5686439, 1.297459, -0.5307305, 1, 1, 1, 1, 1,
-0.5645283, 0.2553347, -1.990747, 1, 1, 1, 1, 1,
-0.5616426, 0.8963039, -2.00576, 1, 1, 1, 1, 1,
-0.5526343, -0.7884688, -3.228072, 1, 1, 1, 1, 1,
-0.5479943, 0.2464446, -1.327638, 1, 1, 1, 1, 1,
-0.5412291, -0.3218449, -0.1945157, 1, 1, 1, 1, 1,
-0.5390483, 1.039899, 0.8521611, 1, 1, 1, 1, 1,
-0.5362449, 0.09297667, -3.021551, 1, 1, 1, 1, 1,
-0.5350464, 0.942912, -0.3072897, 1, 1, 1, 1, 1,
-0.5340663, -0.7842075, -3.418614, 1, 1, 1, 1, 1,
-0.5327541, 0.7030318, -0.9270648, 1, 1, 1, 1, 1,
-0.5324391, -0.4681748, -0.6033714, 1, 1, 1, 1, 1,
-0.5310565, 0.359319, -1.084515, 0, 0, 1, 1, 1,
-0.5298603, 1.461092, 0.1614897, 1, 0, 0, 1, 1,
-0.5282561, 1.876162, -1.458382, 1, 0, 0, 1, 1,
-0.527766, 1.487168, 0.6401047, 1, 0, 0, 1, 1,
-0.5189374, 0.5001398, 1.099629, 1, 0, 0, 1, 1,
-0.514657, 1.442578, -0.06728616, 1, 0, 0, 1, 1,
-0.5115023, -0.1198134, -0.8925444, 0, 0, 0, 1, 1,
-0.5099033, 1.232267, -0.5400404, 0, 0, 0, 1, 1,
-0.5032832, -0.04680155, -1.536395, 0, 0, 0, 1, 1,
-0.5028684, -1.532721, -2.757172, 0, 0, 0, 1, 1,
-0.5006883, -0.09709757, -1.558782, 0, 0, 0, 1, 1,
-0.4993267, 0.4305048, -1.005368, 0, 0, 0, 1, 1,
-0.4982961, -0.08525381, -1.568511, 0, 0, 0, 1, 1,
-0.4895909, -1.54372, -3.202437, 1, 1, 1, 1, 1,
-0.4895239, -1.041513, -1.106228, 1, 1, 1, 1, 1,
-0.4855821, -0.371545, -2.71032, 1, 1, 1, 1, 1,
-0.4833643, 0.02414045, -1.526426, 1, 1, 1, 1, 1,
-0.4774955, -1.884391, -3.032758, 1, 1, 1, 1, 1,
-0.4753185, -1.123085, -2.700368, 1, 1, 1, 1, 1,
-0.4728916, -1.503705, -2.302831, 1, 1, 1, 1, 1,
-0.4725404, 1.306956, 0.772034, 1, 1, 1, 1, 1,
-0.4716891, 1.069512, 1.278614, 1, 1, 1, 1, 1,
-0.4694289, -0.5790291, -1.427634, 1, 1, 1, 1, 1,
-0.4676474, -1.857231, -2.70987, 1, 1, 1, 1, 1,
-0.4671083, -0.330105, -1.354169, 1, 1, 1, 1, 1,
-0.4602918, -2.09589, -3.380149, 1, 1, 1, 1, 1,
-0.4599141, -1.121155, -1.590127, 1, 1, 1, 1, 1,
-0.4561915, -0.01818179, -1.639875, 1, 1, 1, 1, 1,
-0.4520874, 0.1977476, -2.367087, 0, 0, 1, 1, 1,
-0.4482195, -2.171179, -3.60576, 1, 0, 0, 1, 1,
-0.4461688, -2.630538, -3.486567, 1, 0, 0, 1, 1,
-0.4449649, -0.5239992, -2.465021, 1, 0, 0, 1, 1,
-0.4391147, 0.7087761, -0.1770643, 1, 0, 0, 1, 1,
-0.4388414, 0.02202411, -1.938957, 1, 0, 0, 1, 1,
-0.436428, 0.541186, -1.124928, 0, 0, 0, 1, 1,
-0.4341333, 1.269445, 1.268923, 0, 0, 0, 1, 1,
-0.4328949, -0.859008, -3.394528, 0, 0, 0, 1, 1,
-0.4321715, -0.3993838, -2.239983, 0, 0, 0, 1, 1,
-0.4319604, 0.08555374, -1.731678, 0, 0, 0, 1, 1,
-0.4256062, -2.902616, -2.995767, 0, 0, 0, 1, 1,
-0.4249516, -0.7472481, -3.556499, 0, 0, 0, 1, 1,
-0.4222768, 1.30794, 0.007972061, 1, 1, 1, 1, 1,
-0.4209142, 1.694215, -1.417117, 1, 1, 1, 1, 1,
-0.4193608, 0.6189979, -1.817556, 1, 1, 1, 1, 1,
-0.4191923, 0.3628373, -0.779865, 1, 1, 1, 1, 1,
-0.4141407, 0.4100255, -1.531819, 1, 1, 1, 1, 1,
-0.4136399, 0.1019509, -2.410357, 1, 1, 1, 1, 1,
-0.4120363, 1.051311, -0.8474411, 1, 1, 1, 1, 1,
-0.4100681, 1.311696, 0.06297312, 1, 1, 1, 1, 1,
-0.4052715, 0.03210266, 0.9632712, 1, 1, 1, 1, 1,
-0.4035599, -0.9238894, -3.279764, 1, 1, 1, 1, 1,
-0.3969406, -0.02248019, -1.766763, 1, 1, 1, 1, 1,
-0.3966976, 0.8828303, -0.09743819, 1, 1, 1, 1, 1,
-0.396169, -1.245038, -2.622952, 1, 1, 1, 1, 1,
-0.3919374, 0.5365409, -0.7612985, 1, 1, 1, 1, 1,
-0.391778, 0.6899496, 0.8787882, 1, 1, 1, 1, 1,
-0.3845777, 1.425458, -0.6435943, 0, 0, 1, 1, 1,
-0.3762784, -1.177594, -2.067926, 1, 0, 0, 1, 1,
-0.3745185, 0.05763372, -2.535952, 1, 0, 0, 1, 1,
-0.3732254, -0.9601581, -3.856076, 1, 0, 0, 1, 1,
-0.3727634, -1.582835, -3.484899, 1, 0, 0, 1, 1,
-0.371635, -1.07366, -4.963242, 1, 0, 0, 1, 1,
-0.3690715, 0.11775, -1.549629, 0, 0, 0, 1, 1,
-0.3664272, -0.672448, -3.536517, 0, 0, 0, 1, 1,
-0.3658859, 1.486946, 1.26876, 0, 0, 0, 1, 1,
-0.3623719, 0.5733724, 0.1269347, 0, 0, 0, 1, 1,
-0.3612389, 0.5998766, -0.7535884, 0, 0, 0, 1, 1,
-0.3599365, 0.9120032, -1.770648, 0, 0, 0, 1, 1,
-0.3587846, 0.8712086, -0.1109042, 0, 0, 0, 1, 1,
-0.3459355, 0.2439745, -2.05968, 1, 1, 1, 1, 1,
-0.3428371, 0.02753807, -1.496937, 1, 1, 1, 1, 1,
-0.3423393, -1.213547, -2.677563, 1, 1, 1, 1, 1,
-0.342222, -1.200086, -1.984109, 1, 1, 1, 1, 1,
-0.3421755, 0.1708956, -2.213323, 1, 1, 1, 1, 1,
-0.3351469, -0.5079613, -2.193497, 1, 1, 1, 1, 1,
-0.3322692, -1.443144, -1.749, 1, 1, 1, 1, 1,
-0.3309197, -0.05029548, -1.432036, 1, 1, 1, 1, 1,
-0.3290666, 0.02062698, -1.528695, 1, 1, 1, 1, 1,
-0.3285351, -0.491013, -4.669529, 1, 1, 1, 1, 1,
-0.3279672, -0.8076814, -1.456279, 1, 1, 1, 1, 1,
-0.3269088, 0.3459348, -0.2286002, 1, 1, 1, 1, 1,
-0.3264831, 1.47831, -1.897798, 1, 1, 1, 1, 1,
-0.3222514, -1.129447, -2.870059, 1, 1, 1, 1, 1,
-0.3219182, -0.9629623, -2.452113, 1, 1, 1, 1, 1,
-0.321333, 0.1763533, -0.4245169, 0, 0, 1, 1, 1,
-0.3202684, -1.517384, -3.912795, 1, 0, 0, 1, 1,
-0.3201651, -0.8388834, -2.813228, 1, 0, 0, 1, 1,
-0.3184592, -0.461958, -1.162392, 1, 0, 0, 1, 1,
-0.317495, -0.4950053, -4.450621, 1, 0, 0, 1, 1,
-0.3161559, -0.313758, -1.937044, 1, 0, 0, 1, 1,
-0.3140292, 2.325377, 0.4997918, 0, 0, 0, 1, 1,
-0.3132201, 1.065403, 1.051717, 0, 0, 0, 1, 1,
-0.3081041, -0.1905641, -1.363891, 0, 0, 0, 1, 1,
-0.2991156, -1.977314, -2.691265, 0, 0, 0, 1, 1,
-0.2982628, 0.03666825, -1.10723, 0, 0, 0, 1, 1,
-0.2919976, 0.2795282, 0.554399, 0, 0, 0, 1, 1,
-0.2861004, 0.7678279, -0.7198781, 0, 0, 0, 1, 1,
-0.2788635, 2.108389, -0.8220373, 1, 1, 1, 1, 1,
-0.2788082, -0.7500932, -1.281452, 1, 1, 1, 1, 1,
-0.2776711, -0.1044821, -1.575465, 1, 1, 1, 1, 1,
-0.2728586, 0.5621643, 0.9453922, 1, 1, 1, 1, 1,
-0.2647564, 1.56016, 1.17048, 1, 1, 1, 1, 1,
-0.260311, -2.296463, -3.846057, 1, 1, 1, 1, 1,
-0.2533976, 2.072905, -0.8233735, 1, 1, 1, 1, 1,
-0.2525581, 0.2795098, 0.9478731, 1, 1, 1, 1, 1,
-0.2523787, -0.6754254, -2.483112, 1, 1, 1, 1, 1,
-0.2474821, -0.3845223, -2.960246, 1, 1, 1, 1, 1,
-0.2462112, -0.4159281, -2.729392, 1, 1, 1, 1, 1,
-0.2441057, 2.180593, -1.20048, 1, 1, 1, 1, 1,
-0.2425299, -0.9228008, -3.490484, 1, 1, 1, 1, 1,
-0.2417152, -0.6108817, -4.290185, 1, 1, 1, 1, 1,
-0.2402979, 1.403276, -0.8485008, 1, 1, 1, 1, 1,
-0.2378197, 0.4666752, -1.512621, 0, 0, 1, 1, 1,
-0.2376939, -0.5425037, -0.1145852, 1, 0, 0, 1, 1,
-0.2331798, 0.2895597, -1.29369, 1, 0, 0, 1, 1,
-0.2321121, 0.2464512, -1.205767, 1, 0, 0, 1, 1,
-0.2309517, 1.160009, -0.3508494, 1, 0, 0, 1, 1,
-0.2300541, -0.1070462, -1.80125, 1, 0, 0, 1, 1,
-0.2296338, -1.240178, -3.518585, 0, 0, 0, 1, 1,
-0.2291132, 1.385982, -0.8037463, 0, 0, 0, 1, 1,
-0.2262588, -0.6805723, -2.424194, 0, 0, 0, 1, 1,
-0.2256521, -1.489611, -4.463598, 0, 0, 0, 1, 1,
-0.2243349, -1.086504, -2.494985, 0, 0, 0, 1, 1,
-0.2239038, 0.1501438, -1.185079, 0, 0, 0, 1, 1,
-0.2178378, 0.008634902, -0.9205086, 0, 0, 0, 1, 1,
-0.2166349, 1.042575, 0.4685958, 1, 1, 1, 1, 1,
-0.2155207, 0.8814747, -1.78694, 1, 1, 1, 1, 1,
-0.2150504, 0.2550213, -2.330162, 1, 1, 1, 1, 1,
-0.2134016, -0.05130625, -1.269033, 1, 1, 1, 1, 1,
-0.2084924, 1.995899, -0.4411015, 1, 1, 1, 1, 1,
-0.2037001, -0.1554799, -0.9772956, 1, 1, 1, 1, 1,
-0.2032877, -1.259373, -4.564874, 1, 1, 1, 1, 1,
-0.2028141, -1.026129, -3.149096, 1, 1, 1, 1, 1,
-0.2025824, -1.312799, -2.043928, 1, 1, 1, 1, 1,
-0.202311, 0.8913911, -1.756707, 1, 1, 1, 1, 1,
-0.2014506, 0.02506318, -1.815415, 1, 1, 1, 1, 1,
-0.1999995, -0.3333805, -2.871091, 1, 1, 1, 1, 1,
-0.199347, -0.3169899, -2.257276, 1, 1, 1, 1, 1,
-0.1965765, 0.3481789, 0.8178036, 1, 1, 1, 1, 1,
-0.1960524, -1.117511, -2.712752, 1, 1, 1, 1, 1,
-0.1923737, -1.191501, -1.30813, 0, 0, 1, 1, 1,
-0.1920331, -0.01895203, -2.040369, 1, 0, 0, 1, 1,
-0.1908249, -0.728923, -4.203262, 1, 0, 0, 1, 1,
-0.1877886, -1.117949, -2.827206, 1, 0, 0, 1, 1,
-0.1782526, 0.7637265, -0.511338, 1, 0, 0, 1, 1,
-0.1780584, 0.2192463, -1.080359, 1, 0, 0, 1, 1,
-0.1765567, -0.3976565, -4.013337, 0, 0, 0, 1, 1,
-0.175438, -1.123702, -2.436007, 0, 0, 0, 1, 1,
-0.1753933, -1.637075, -3.673669, 0, 0, 0, 1, 1,
-0.1747099, -0.5706716, -0.9411116, 0, 0, 0, 1, 1,
-0.1697097, 1.370147, -1.701426, 0, 0, 0, 1, 1,
-0.1642466, -1.239156, -2.78262, 0, 0, 0, 1, 1,
-0.1638108, 0.4725741, -2.58759, 0, 0, 0, 1, 1,
-0.1632841, -0.02620639, -3.399748, 1, 1, 1, 1, 1,
-0.1625056, -0.3037016, -2.382828, 1, 1, 1, 1, 1,
-0.1618629, -0.2628046, -2.868647, 1, 1, 1, 1, 1,
-0.1607998, 0.740887, -0.1970815, 1, 1, 1, 1, 1,
-0.1554073, 0.9623638, -0.9441444, 1, 1, 1, 1, 1,
-0.1539131, -1.091405, -2.7538, 1, 1, 1, 1, 1,
-0.1519291, 0.8618135, 0.55515, 1, 1, 1, 1, 1,
-0.1453949, -0.4541779, -2.484192, 1, 1, 1, 1, 1,
-0.1448558, 1.272609, -0.2149726, 1, 1, 1, 1, 1,
-0.1447057, 0.2014854, -1.480375, 1, 1, 1, 1, 1,
-0.1445621, -0.4511175, -2.309321, 1, 1, 1, 1, 1,
-0.1366584, -0.3634079, -3.035469, 1, 1, 1, 1, 1,
-0.1353565, -0.4035283, -0.6123575, 1, 1, 1, 1, 1,
-0.1349837, -0.6784272, -3.341997, 1, 1, 1, 1, 1,
-0.132972, -0.4058303, -2.301961, 1, 1, 1, 1, 1,
-0.1324831, -0.899292, -5.093125, 0, 0, 1, 1, 1,
-0.1269749, 1.12306, 0.4335208, 1, 0, 0, 1, 1,
-0.1262367, 0.1636011, -0.6778032, 1, 0, 0, 1, 1,
-0.1231314, -0.7727028, -2.134436, 1, 0, 0, 1, 1,
-0.1229913, 1.116394, 1.078136, 1, 0, 0, 1, 1,
-0.1182076, 2.094466, 0.1757636, 1, 0, 0, 1, 1,
-0.1168904, -1.878399, -5.042526, 0, 0, 0, 1, 1,
-0.1142138, 1.07198, 1.096132, 0, 0, 0, 1, 1,
-0.1068059, 1.136967, 0.4778843, 0, 0, 0, 1, 1,
-0.1014729, -0.3725753, -1.258162, 0, 0, 0, 1, 1,
-0.0987575, 2.350967, -0.05664591, 0, 0, 0, 1, 1,
-0.09846557, 1.287649, -0.3948684, 0, 0, 0, 1, 1,
-0.09552816, 0.4303779, 1.988023, 0, 0, 0, 1, 1,
-0.09537666, 0.1611152, -2.263421, 1, 1, 1, 1, 1,
-0.09448915, 1.096528, -1.353719, 1, 1, 1, 1, 1,
-0.0912495, 1.015751, -0.7359012, 1, 1, 1, 1, 1,
-0.08890537, 0.3304939, -2.188419, 1, 1, 1, 1, 1,
-0.08884957, -1.777787, -2.146237, 1, 1, 1, 1, 1,
-0.08640726, -1.046611, -0.982071, 1, 1, 1, 1, 1,
-0.08593804, -0.1530262, -3.389881, 1, 1, 1, 1, 1,
-0.08584619, 0.369749, 0.7065887, 1, 1, 1, 1, 1,
-0.08457645, 0.4905179, 2.12943, 1, 1, 1, 1, 1,
-0.08435851, 0.8066954, 0.3399807, 1, 1, 1, 1, 1,
-0.08072641, 0.4306564, -0.07909272, 1, 1, 1, 1, 1,
-0.0788882, 0.3161854, -0.3721852, 1, 1, 1, 1, 1,
-0.07839786, 0.4066611, 0.9728099, 1, 1, 1, 1, 1,
-0.07438206, 0.600041, 0.2730573, 1, 1, 1, 1, 1,
-0.06907225, 0.7690553, 1.366503, 1, 1, 1, 1, 1,
-0.06513441, -0.1141398, -3.548749, 0, 0, 1, 1, 1,
-0.05764202, 0.6074345, -0.3346818, 1, 0, 0, 1, 1,
-0.0553341, -0.5671648, -2.534111, 1, 0, 0, 1, 1,
-0.0530211, 0.5292656, -0.3642066, 1, 0, 0, 1, 1,
-0.05007973, 0.773232, -1.096797, 1, 0, 0, 1, 1,
-0.0491703, -1.251265, -0.7783724, 1, 0, 0, 1, 1,
-0.047668, 2.283837, 0.7450415, 0, 0, 0, 1, 1,
-0.04649777, 1.900458, 0.03933357, 0, 0, 0, 1, 1,
-0.04593119, 0.4311173, 1.377733, 0, 0, 0, 1, 1,
-0.04574069, 0.5681307, -0.7579825, 0, 0, 0, 1, 1,
-0.04373129, -1.079554, -5.382772, 0, 0, 0, 1, 1,
-0.03785498, -0.03996902, -1.37757, 0, 0, 0, 1, 1,
-0.03481507, 0.09668739, -0.6180335, 0, 0, 0, 1, 1,
-0.03336368, -1.357057, -2.288489, 1, 1, 1, 1, 1,
-0.03176666, 0.08638111, -0.6959081, 1, 1, 1, 1, 1,
-0.03135063, 0.3094767, -0.08889647, 1, 1, 1, 1, 1,
-0.02648488, -0.3181384, -4.226719, 1, 1, 1, 1, 1,
-0.02648069, -0.4226068, -1.451135, 1, 1, 1, 1, 1,
-0.0261436, -0.2211634, -2.840127, 1, 1, 1, 1, 1,
-0.02524536, -1.118552, -3.17239, 1, 1, 1, 1, 1,
-0.02248381, -0.1434152, -3.569286, 1, 1, 1, 1, 1,
-0.02184641, -1.387713, -2.233497, 1, 1, 1, 1, 1,
-0.02017124, -1.519211, -2.31694, 1, 1, 1, 1, 1,
-0.01998844, -0.9945967, -5.639493, 1, 1, 1, 1, 1,
-0.01932532, -0.6252775, -3.051858, 1, 1, 1, 1, 1,
-0.0189192, -0.1703274, -1.895502, 1, 1, 1, 1, 1,
-0.01558265, -0.6071085, -1.315148, 1, 1, 1, 1, 1,
-0.0125026, 0.2205402, -0.1335141, 1, 1, 1, 1, 1,
-0.009645349, 0.1938682, -0.655369, 0, 0, 1, 1, 1,
-0.007230586, -0.5372095, -3.562164, 1, 0, 0, 1, 1,
-0.000304099, -0.5167654, -4.37539, 1, 0, 0, 1, 1,
0.002926991, -1.892716, 1.728877, 1, 0, 0, 1, 1,
0.009801509, 0.3631947, 0.1704252, 1, 0, 0, 1, 1,
0.01392393, -0.2384638, 3.528858, 1, 0, 0, 1, 1,
0.02056012, 0.01992543, 1.62673, 0, 0, 0, 1, 1,
0.02214016, 1.372082, -0.581333, 0, 0, 0, 1, 1,
0.02394822, -0.4840712, 2.006582, 0, 0, 0, 1, 1,
0.02539589, 1.289142, 0.4690185, 0, 0, 0, 1, 1,
0.02669538, -0.510298, 6.068242, 0, 0, 0, 1, 1,
0.03428582, 0.1968014, -0.565904, 0, 0, 0, 1, 1,
0.03622276, 0.4291019, -1.079493, 0, 0, 0, 1, 1,
0.03812233, 0.7043135, -0.6732632, 1, 1, 1, 1, 1,
0.03845292, 1.091714, 0.2153848, 1, 1, 1, 1, 1,
0.04246645, -0.2843534, 2.409539, 1, 1, 1, 1, 1,
0.04643698, 0.006024359, 1.332323, 1, 1, 1, 1, 1,
0.05488782, 0.4707883, -1.484097, 1, 1, 1, 1, 1,
0.0549069, -0.1731402, 4.258615, 1, 1, 1, 1, 1,
0.06084202, -0.9216568, 3.20012, 1, 1, 1, 1, 1,
0.06179474, -0.4154651, 1.680561, 1, 1, 1, 1, 1,
0.0652547, 0.1982948, 0.4911185, 1, 1, 1, 1, 1,
0.06685147, 2.529483, -0.3550926, 1, 1, 1, 1, 1,
0.06712276, -0.5340278, 3.133891, 1, 1, 1, 1, 1,
0.07272857, -0.8050889, 4.311697, 1, 1, 1, 1, 1,
0.07828964, 0.3639069, -0.2612166, 1, 1, 1, 1, 1,
0.07895864, 1.469271, -1.046884, 1, 1, 1, 1, 1,
0.07945719, 0.6149949, -1.24599, 1, 1, 1, 1, 1,
0.0798562, -1.895422, 3.510118, 0, 0, 1, 1, 1,
0.08098964, 0.8637176, -0.07172687, 1, 0, 0, 1, 1,
0.08300395, 1.283356, 0.9936541, 1, 0, 0, 1, 1,
0.08745141, -0.982713, 3.087276, 1, 0, 0, 1, 1,
0.08882759, -1.695693, -0.8439458, 1, 0, 0, 1, 1,
0.08903801, -0.6342582, 1.399866, 1, 0, 0, 1, 1,
0.09873495, 0.2303723, -1.144605, 0, 0, 0, 1, 1,
0.1119234, -1.181529, 2.098061, 0, 0, 0, 1, 1,
0.114875, 0.1244379, 2.572597, 0, 0, 0, 1, 1,
0.1166081, 0.69481, -1.041174, 0, 0, 0, 1, 1,
0.1195949, 0.1782609, 1.215073, 0, 0, 0, 1, 1,
0.124336, 0.4684454, 0.9716184, 0, 0, 0, 1, 1,
0.1306139, -0.678364, 1.864064, 0, 0, 0, 1, 1,
0.1341917, 1.093831, 0.6830978, 1, 1, 1, 1, 1,
0.1349682, 0.950895, 0.1029656, 1, 1, 1, 1, 1,
0.1358789, -0.135246, 3.9492, 1, 1, 1, 1, 1,
0.1360045, -0.3914219, 4.068082, 1, 1, 1, 1, 1,
0.1423842, 1.741769, 0.1154639, 1, 1, 1, 1, 1,
0.1452378, -0.8256708, 1.310445, 1, 1, 1, 1, 1,
0.1458349, -0.7045248, 1.773184, 1, 1, 1, 1, 1,
0.1486046, 1.274549, -0.02089894, 1, 1, 1, 1, 1,
0.1546173, 0.6735245, 1.445126, 1, 1, 1, 1, 1,
0.1573157, 1.228029, 0.862819, 1, 1, 1, 1, 1,
0.1583621, 0.4102823, -1.776374, 1, 1, 1, 1, 1,
0.1591156, -0.3300167, 4.411119, 1, 1, 1, 1, 1,
0.1636819, 1.3523, 1.665497, 1, 1, 1, 1, 1,
0.1684565, -0.4268433, 3.209043, 1, 1, 1, 1, 1,
0.1689949, 2.001349, -0.915123, 1, 1, 1, 1, 1,
0.1692396, 0.1944817, 0.09636757, 0, 0, 1, 1, 1,
0.1702161, -0.08311098, 3.896474, 1, 0, 0, 1, 1,
0.1717556, 2.25818, 0.7154027, 1, 0, 0, 1, 1,
0.1779098, 1.495542, -0.02005741, 1, 0, 0, 1, 1,
0.1786333, 0.4926927, 0.1921669, 1, 0, 0, 1, 1,
0.1793586, -0.9592168, 3.175867, 1, 0, 0, 1, 1,
0.1806488, -0.729321, 1.657684, 0, 0, 0, 1, 1,
0.181418, 0.3269383, 2.653947, 0, 0, 0, 1, 1,
0.1839039, 0.7371326, 1.247491, 0, 0, 0, 1, 1,
0.1843223, -2.024377, 1.879001, 0, 0, 0, 1, 1,
0.1844905, -9.932478e-05, 0.474929, 0, 0, 0, 1, 1,
0.1847862, 0.9457396, 0.3006062, 0, 0, 0, 1, 1,
0.186426, 0.4965581, -0.4572464, 0, 0, 0, 1, 1,
0.1866565, 0.4516597, 1.759333, 1, 1, 1, 1, 1,
0.1893547, -0.3179464, 2.572706, 1, 1, 1, 1, 1,
0.1927959, -0.04047612, 1.631506, 1, 1, 1, 1, 1,
0.1959468, -1.854527, 3.074408, 1, 1, 1, 1, 1,
0.1976191, -1.555419, 2.14182, 1, 1, 1, 1, 1,
0.1983442, 0.1162307, -0.6806627, 1, 1, 1, 1, 1,
0.2007417, 0.863026, 0.08574693, 1, 1, 1, 1, 1,
0.2098216, 0.8164077, 0.6697031, 1, 1, 1, 1, 1,
0.2112842, 0.803553, -0.9725455, 1, 1, 1, 1, 1,
0.2136574, -0.4894828, 1.662563, 1, 1, 1, 1, 1,
0.2147428, 2.135762, -0.1269453, 1, 1, 1, 1, 1,
0.2161261, -0.2705624, 1.381014, 1, 1, 1, 1, 1,
0.21876, 0.6042268, 1.245867, 1, 1, 1, 1, 1,
0.2263946, -0.8752807, 4.676422, 1, 1, 1, 1, 1,
0.2266242, -1.059895, 4.252192, 1, 1, 1, 1, 1,
0.2362058, -0.1579913, 4.749272, 0, 0, 1, 1, 1,
0.2416052, 0.0148164, 1.742752, 1, 0, 0, 1, 1,
0.2449991, -0.06814336, 1.474523, 1, 0, 0, 1, 1,
0.2462027, -0.2353065, 1.684685, 1, 0, 0, 1, 1,
0.2545997, 0.5942788, 0.3963748, 1, 0, 0, 1, 1,
0.2555126, -0.8491044, 2.082441, 1, 0, 0, 1, 1,
0.2556749, 0.3894806, -0.3901661, 0, 0, 0, 1, 1,
0.2596974, 0.4093899, 1.067454, 0, 0, 0, 1, 1,
0.2610537, -1.260278, 1.856957, 0, 0, 0, 1, 1,
0.2650539, -1.439925, 2.058989, 0, 0, 0, 1, 1,
0.2672752, -0.6333379, 2.022758, 0, 0, 0, 1, 1,
0.2695046, -0.6826632, 5.279094, 0, 0, 0, 1, 1,
0.274126, 1.484039, 0.6007974, 0, 0, 0, 1, 1,
0.2805483, -0.3390442, 2.236847, 1, 1, 1, 1, 1,
0.280772, -0.3498128, 0.8138093, 1, 1, 1, 1, 1,
0.2858807, -1.179517, 2.266861, 1, 1, 1, 1, 1,
0.2861906, 0.02166669, 1.07287, 1, 1, 1, 1, 1,
0.2892032, -0.1250247, 2.193527, 1, 1, 1, 1, 1,
0.2955168, -0.1300546, 2.625016, 1, 1, 1, 1, 1,
0.2979298, 1.520933, 0.2222064, 1, 1, 1, 1, 1,
0.3058177, -0.1040815, 2.22149, 1, 1, 1, 1, 1,
0.3098997, -0.7096504, 3.1776, 1, 1, 1, 1, 1,
0.3116158, 0.09041665, 2.284431, 1, 1, 1, 1, 1,
0.3129912, -0.690497, 1.975906, 1, 1, 1, 1, 1,
0.3155354, 1.134461, 0.388737, 1, 1, 1, 1, 1,
0.3175226, -0.4621482, 3.724574, 1, 1, 1, 1, 1,
0.3178068, -0.2306527, 3.486868, 1, 1, 1, 1, 1,
0.3178707, -1.892641, 4.179375, 1, 1, 1, 1, 1,
0.320403, 0.2399489, 0.3930171, 0, 0, 1, 1, 1,
0.3207505, -0.2213806, 3.030866, 1, 0, 0, 1, 1,
0.3212737, -0.3812611, 2.439053, 1, 0, 0, 1, 1,
0.3221623, 1.114158, -1.088045, 1, 0, 0, 1, 1,
0.3267322, -0.0135587, 1.706534, 1, 0, 0, 1, 1,
0.3273903, 0.09283901, 1.471596, 1, 0, 0, 1, 1,
0.3363924, -0.2214294, 1.976865, 0, 0, 0, 1, 1,
0.3364088, -1.12716, 2.055149, 0, 0, 0, 1, 1,
0.3392615, -0.8376944, 4.710331, 0, 0, 0, 1, 1,
0.3456759, 0.8100621, 0.6040066, 0, 0, 0, 1, 1,
0.348561, -0.6353243, 2.114456, 0, 0, 0, 1, 1,
0.3487669, 0.2899168, -0.5842892, 0, 0, 0, 1, 1,
0.349867, 0.2345202, 1.824143, 0, 0, 0, 1, 1,
0.3515584, 2.432229, 2.018627, 1, 1, 1, 1, 1,
0.352948, -0.01703505, 2.665302, 1, 1, 1, 1, 1,
0.3627106, 0.05967362, 1.726138, 1, 1, 1, 1, 1,
0.364065, -0.07078601, 3.197556, 1, 1, 1, 1, 1,
0.3645206, -0.06215823, 1.687508, 1, 1, 1, 1, 1,
0.3673707, -0.7284727, 0.1292599, 1, 1, 1, 1, 1,
0.3683539, -0.01704365, 0.4936379, 1, 1, 1, 1, 1,
0.3714083, -0.1067181, 3.020213, 1, 1, 1, 1, 1,
0.3718189, -0.3242948, 1.33802, 1, 1, 1, 1, 1,
0.3764854, 0.985535, 0.09404945, 1, 1, 1, 1, 1,
0.3766207, -0.258437, 1.834236, 1, 1, 1, 1, 1,
0.3789832, -0.9772351, 2.692684, 1, 1, 1, 1, 1,
0.3862129, -0.7107516, 3.256493, 1, 1, 1, 1, 1,
0.3875086, -0.5320448, 1.672482, 1, 1, 1, 1, 1,
0.3928688, -0.318641, 3.233937, 1, 1, 1, 1, 1,
0.4094959, 0.04302163, 1.06366, 0, 0, 1, 1, 1,
0.4121088, -0.4928261, 3.961224, 1, 0, 0, 1, 1,
0.4155692, -0.005498385, 1.21395, 1, 0, 0, 1, 1,
0.417248, 1.109921, 1.877443, 1, 0, 0, 1, 1,
0.4185231, 0.458229, 0.9790182, 1, 0, 0, 1, 1,
0.4210565, -0.3205663, 2.012774, 1, 0, 0, 1, 1,
0.423971, 2.503049, -0.8424693, 0, 0, 0, 1, 1,
0.4257585, -1.079847, 3.70469, 0, 0, 0, 1, 1,
0.4384518, -0.0561363, 3.330198, 0, 0, 0, 1, 1,
0.4461678, -0.3742968, 1.622243, 0, 0, 0, 1, 1,
0.4472021, -0.8213323, 1.657035, 0, 0, 0, 1, 1,
0.450642, -0.486087, 2.647706, 0, 0, 0, 1, 1,
0.4531381, 0.07275997, 2.606139, 0, 0, 0, 1, 1,
0.4536472, 0.6595701, 1.20671, 1, 1, 1, 1, 1,
0.454265, -0.1671526, 0.6256928, 1, 1, 1, 1, 1,
0.4582832, 0.0486862, 1.947917, 1, 1, 1, 1, 1,
0.4582916, 0.4714798, -0.5413306, 1, 1, 1, 1, 1,
0.459583, -1.045617, 3.176517, 1, 1, 1, 1, 1,
0.4602928, -1.217749, 4.575006, 1, 1, 1, 1, 1,
0.4649249, 0.6329106, -0.3437837, 1, 1, 1, 1, 1,
0.4665156, -1.374838, 2.749174, 1, 1, 1, 1, 1,
0.4698414, 0.7021093, -0.3535394, 1, 1, 1, 1, 1,
0.4729485, -1.272189, 3.847423, 1, 1, 1, 1, 1,
0.4737619, 0.5337421, 0.4053729, 1, 1, 1, 1, 1,
0.4810676, -1.817132, 1.453062, 1, 1, 1, 1, 1,
0.4828475, -0.6960056, 2.567882, 1, 1, 1, 1, 1,
0.483242, 1.283676, 0.5055812, 1, 1, 1, 1, 1,
0.4832903, -0.9269832, 3.134997, 1, 1, 1, 1, 1,
0.4834104, -1.008903, 1.898432, 0, 0, 1, 1, 1,
0.4854809, 1.054255, -0.8922026, 1, 0, 0, 1, 1,
0.4897066, 0.8369461, 1.206236, 1, 0, 0, 1, 1,
0.4946022, 1.325787, 0.3818277, 1, 0, 0, 1, 1,
0.5022883, -1.339502, 3.439458, 1, 0, 0, 1, 1,
0.5072559, 0.4556276, 0.9847412, 1, 0, 0, 1, 1,
0.5084162, 1.381843, 1.846267, 0, 0, 0, 1, 1,
0.5095204, 0.7755567, 1.623812, 0, 0, 0, 1, 1,
0.5100856, 0.5244542, 1.099192, 0, 0, 0, 1, 1,
0.5107087, -0.2269589, 2.716017, 0, 0, 0, 1, 1,
0.5108516, -1.39281, 2.356893, 0, 0, 0, 1, 1,
0.5118998, 0.3934985, 1.548018, 0, 0, 0, 1, 1,
0.5170304, 0.3813163, -0.1827844, 0, 0, 0, 1, 1,
0.518356, 0.4875698, 1.349872, 1, 1, 1, 1, 1,
0.5203793, 0.9995271, 0.3755474, 1, 1, 1, 1, 1,
0.5215724, 0.5707638, 0.4279489, 1, 1, 1, 1, 1,
0.5232584, -0.5213207, 2.019998, 1, 1, 1, 1, 1,
0.5255373, -0.4136562, 2.86959, 1, 1, 1, 1, 1,
0.5273762, -0.9112391, 4.267497, 1, 1, 1, 1, 1,
0.5302063, 0.2944009, 1.726045, 1, 1, 1, 1, 1,
0.5306174, -0.2348707, 2.18646, 1, 1, 1, 1, 1,
0.5306515, 0.3868105, 0.2670392, 1, 1, 1, 1, 1,
0.5308537, -0.5734215, 3.122716, 1, 1, 1, 1, 1,
0.5334513, 0.1613446, 1.085229, 1, 1, 1, 1, 1,
0.5336426, 0.04091372, 2.797236, 1, 1, 1, 1, 1,
0.534673, 1.300277, 0.8687774, 1, 1, 1, 1, 1,
0.5364161, -0.06787387, 0.9459524, 1, 1, 1, 1, 1,
0.5370535, 1.686009, 0.7183138, 1, 1, 1, 1, 1,
0.5406677, 0.2148775, -0.2123984, 0, 0, 1, 1, 1,
0.5413934, -0.05856889, 0.876254, 1, 0, 0, 1, 1,
0.5417621, 0.8310728, 1.660824, 1, 0, 0, 1, 1,
0.5457463, 0.1772691, 0.9851524, 1, 0, 0, 1, 1,
0.5505852, -0.6369659, 4.294854, 1, 0, 0, 1, 1,
0.552366, -2.037045, 4.619898, 1, 0, 0, 1, 1,
0.5595098, -0.5230449, 1.571238, 0, 0, 0, 1, 1,
0.5629188, -1.417998, 3.887773, 0, 0, 0, 1, 1,
0.5674082, 1.253116, 0.01107894, 0, 0, 0, 1, 1,
0.5701438, 0.5455166, 0.1066883, 0, 0, 0, 1, 1,
0.5707895, -1.068139, 1.89977, 0, 0, 0, 1, 1,
0.5783202, -0.6827157, 3.081599, 0, 0, 0, 1, 1,
0.5823694, 1.248005, -0.3875194, 0, 0, 0, 1, 1,
0.5860482, -0.3022595, 2.677995, 1, 1, 1, 1, 1,
0.5863879, -1.318379, 1.375831, 1, 1, 1, 1, 1,
0.5915401, 1.25051, -0.5722526, 1, 1, 1, 1, 1,
0.5940613, 0.2759702, 1.234165, 1, 1, 1, 1, 1,
0.5943398, -0.4489161, 3.368253, 1, 1, 1, 1, 1,
0.5954323, 0.3668988, 0.9382747, 1, 1, 1, 1, 1,
0.5958089, 1.120849, 0.8275303, 1, 1, 1, 1, 1,
0.5995188, -0.2530119, 1.097622, 1, 1, 1, 1, 1,
0.5997104, 0.8757917, 1.28701, 1, 1, 1, 1, 1,
0.6037202, 0.9890952, 0.5322064, 1, 1, 1, 1, 1,
0.6096628, 0.5072128, -0.4193962, 1, 1, 1, 1, 1,
0.6113674, -0.6936479, 4.839931, 1, 1, 1, 1, 1,
0.6124071, 0.4309095, 1.761448, 1, 1, 1, 1, 1,
0.6131483, -0.06050298, 1.497659, 1, 1, 1, 1, 1,
0.6148703, -1.01883, 1.631578, 1, 1, 1, 1, 1,
0.6150573, 1.660323, -0.5389748, 0, 0, 1, 1, 1,
0.6152642, -0.1773031, 0.09735554, 1, 0, 0, 1, 1,
0.6155885, 1.050634, -0.1423592, 1, 0, 0, 1, 1,
0.623242, 1.395095, -0.321404, 1, 0, 0, 1, 1,
0.6242687, 1.169835, 0.5697418, 1, 0, 0, 1, 1,
0.6329924, -0.8435629, 1.12985, 1, 0, 0, 1, 1,
0.6341788, 0.6290686, 1.553469, 0, 0, 0, 1, 1,
0.6484195, 0.3159434, 1.156007, 0, 0, 0, 1, 1,
0.6485122, 0.3679309, 0.214924, 0, 0, 0, 1, 1,
0.6488453, -0.5687261, 1.191816, 0, 0, 0, 1, 1,
0.6503886, -2.312915, 1.147198, 0, 0, 0, 1, 1,
0.6549764, 0.8119996, 0.8834714, 0, 0, 0, 1, 1,
0.6557409, 1.374572, -0.6210327, 0, 0, 0, 1, 1,
0.6578999, -1.180708, 2.52644, 1, 1, 1, 1, 1,
0.6609167, 0.7485023, 1.125618, 1, 1, 1, 1, 1,
0.6611403, -0.07023758, -0.2753496, 1, 1, 1, 1, 1,
0.6637496, -0.09142336, 2.494448, 1, 1, 1, 1, 1,
0.6641543, -0.4059898, 2.610404, 1, 1, 1, 1, 1,
0.6645011, -1.700682, 3.34658, 1, 1, 1, 1, 1,
0.666342, 1.204257, 1.639408, 1, 1, 1, 1, 1,
0.6665318, 0.06144447, 1.530477, 1, 1, 1, 1, 1,
0.6680744, 0.6731139, 0.6897011, 1, 1, 1, 1, 1,
0.6744162, 1.326053, -0.9084808, 1, 1, 1, 1, 1,
0.6771526, -0.5497039, 3.599725, 1, 1, 1, 1, 1,
0.6800186, 0.5158446, 0.178047, 1, 1, 1, 1, 1,
0.6840022, -0.2644048, 1.133069, 1, 1, 1, 1, 1,
0.6845425, -0.737634, 1.622393, 1, 1, 1, 1, 1,
0.6854251, 1.208634, -0.595905, 1, 1, 1, 1, 1,
0.687562, -0.2356983, 2.964733, 0, 0, 1, 1, 1,
0.688621, 0.3657227, 2.173077, 1, 0, 0, 1, 1,
0.6901252, 1.262479, 0.2798981, 1, 0, 0, 1, 1,
0.6951626, 0.9079422, 0.2651275, 1, 0, 0, 1, 1,
0.6954525, -0.08216317, 0.4055306, 1, 0, 0, 1, 1,
0.6995239, 0.2533408, 1.799535, 1, 0, 0, 1, 1,
0.7066483, 1.323358, 0.1745548, 0, 0, 0, 1, 1,
0.7084543, -0.01258125, 2.22331, 0, 0, 0, 1, 1,
0.7152314, -0.7199649, 2.947608, 0, 0, 0, 1, 1,
0.7158222, 0.940385, -0.3277973, 0, 0, 0, 1, 1,
0.7158468, -0.387289, 1.848113, 0, 0, 0, 1, 1,
0.7176141, 0.3945104, 0.5989888, 0, 0, 0, 1, 1,
0.7180752, -1.607398, 2.221422, 0, 0, 0, 1, 1,
0.7187122, 0.1087713, 1.814014, 1, 1, 1, 1, 1,
0.7218159, 1.500814, -0.1621348, 1, 1, 1, 1, 1,
0.7335234, -0.001448595, 2.824963, 1, 1, 1, 1, 1,
0.7337732, -0.7842107, 1.47459, 1, 1, 1, 1, 1,
0.7341387, 1.608516, 0.9130118, 1, 1, 1, 1, 1,
0.7344525, -1.201188, 2.549361, 1, 1, 1, 1, 1,
0.7460768, 0.7217199, 1.106359, 1, 1, 1, 1, 1,
0.747026, 0.4621737, 0.2105729, 1, 1, 1, 1, 1,
0.7472783, 0.04707385, 1.606601, 1, 1, 1, 1, 1,
0.7476951, 0.9526607, 2.055786, 1, 1, 1, 1, 1,
0.7522283, 0.4319595, -0.356349, 1, 1, 1, 1, 1,
0.7533052, 1.032972, 0.4156674, 1, 1, 1, 1, 1,
0.7624298, 1.266786, -1.270018, 1, 1, 1, 1, 1,
0.7654195, 1.879542, -0.6427085, 1, 1, 1, 1, 1,
0.7676155, -0.07626031, 2.096332, 1, 1, 1, 1, 1,
0.7737273, -1.645445, 4.000421, 0, 0, 1, 1, 1,
0.7777235, 0.0977321, 1.52507, 1, 0, 0, 1, 1,
0.7781745, 0.07784118, 1.005285, 1, 0, 0, 1, 1,
0.7781959, 0.4212226, 1.562833, 1, 0, 0, 1, 1,
0.7831552, -0.09484787, 3.981624, 1, 0, 0, 1, 1,
0.7945285, 0.09556749, 0.123334, 1, 0, 0, 1, 1,
0.7945388, 0.4950143, 1.346191, 0, 0, 0, 1, 1,
0.8023272, 0.4847186, 1.603706, 0, 0, 0, 1, 1,
0.8089402, -0.2234538, -0.633923, 0, 0, 0, 1, 1,
0.8096882, 0.1679235, 0.9951007, 0, 0, 0, 1, 1,
0.811955, 0.9204836, 0.5830952, 0, 0, 0, 1, 1,
0.8128904, 0.687064, 0.7553706, 0, 0, 0, 1, 1,
0.8157629, 0.4147219, 1.778373, 0, 0, 0, 1, 1,
0.8211859, 0.05820284, 0.7887754, 1, 1, 1, 1, 1,
0.8219805, 2.520308, 0.9112052, 1, 1, 1, 1, 1,
0.8222886, 0.7649039, 1.039319, 1, 1, 1, 1, 1,
0.8235872, -0.5451778, 1.930379, 1, 1, 1, 1, 1,
0.8268855, 1.083355, 0.5028588, 1, 1, 1, 1, 1,
0.8273642, -0.4742699, 2.191056, 1, 1, 1, 1, 1,
0.8280273, -2.657972, 1.616146, 1, 1, 1, 1, 1,
0.8289191, -0.8377385, 4.50748, 1, 1, 1, 1, 1,
0.8304107, -1.496938, 1.97638, 1, 1, 1, 1, 1,
0.8362231, -0.3276596, 1.970897, 1, 1, 1, 1, 1,
0.8362792, -2.186037, 4.107226, 1, 1, 1, 1, 1,
0.8385744, -2.997178, 2.328793, 1, 1, 1, 1, 1,
0.8406658, 0.4439712, 0.5644742, 1, 1, 1, 1, 1,
0.8412067, -0.02216453, 3.156903, 1, 1, 1, 1, 1,
0.8441372, 0.5537338, 0.7987868, 1, 1, 1, 1, 1,
0.8456801, -2.694017, 1.479009, 0, 0, 1, 1, 1,
0.8457702, -0.5311398, 3.37248, 1, 0, 0, 1, 1,
0.8589362, 0.4117046, 0.1034952, 1, 0, 0, 1, 1,
0.8648188, -0.06467392, 3.778667, 1, 0, 0, 1, 1,
0.8719729, -0.1630318, 2.307764, 1, 0, 0, 1, 1,
0.8736628, 0.1275119, 1.731791, 1, 0, 0, 1, 1,
0.8833299, 0.04552232, 0.6443301, 0, 0, 0, 1, 1,
0.8858536, -1.90993, 2.910388, 0, 0, 0, 1, 1,
0.8872994, 0.7874042, 1.089017, 0, 0, 0, 1, 1,
0.899584, -0.733201, 2.994599, 0, 0, 0, 1, 1,
0.9007922, 2.129291, -2.881007, 0, 0, 0, 1, 1,
0.9009991, 0.3871852, 2.385865, 0, 0, 0, 1, 1,
0.9117928, -0.6936449, 1.935258, 0, 0, 0, 1, 1,
0.9171194, 0.4756173, 0.03252598, 1, 1, 1, 1, 1,
0.9225512, 0.6425104, 0.1456822, 1, 1, 1, 1, 1,
0.9314785, -0.480437, 3.336951, 1, 1, 1, 1, 1,
0.9366547, -0.9280334, 1.814594, 1, 1, 1, 1, 1,
0.9371359, 0.971046, -0.5479248, 1, 1, 1, 1, 1,
0.9391677, -1.021781, 1.969781, 1, 1, 1, 1, 1,
0.9405667, -0.1309682, 1.117836, 1, 1, 1, 1, 1,
0.9407843, -0.1612363, 2.211834, 1, 1, 1, 1, 1,
0.9413862, 0.6164168, 2.23388, 1, 1, 1, 1, 1,
0.9547372, 0.5967113, 0.4855984, 1, 1, 1, 1, 1,
0.9677648, 1.230709, 0.6107043, 1, 1, 1, 1, 1,
0.9700385, -0.08758696, -0.6328687, 1, 1, 1, 1, 1,
0.9845845, 0.2345876, 1.681515, 1, 1, 1, 1, 1,
0.9875672, 0.09398308, 1.276541, 1, 1, 1, 1, 1,
0.9917634, 0.7930102, 1.675173, 1, 1, 1, 1, 1,
1.007625, 0.9414782, 2.073748, 0, 0, 1, 1, 1,
1.013576, -1.110475, 3.373887, 1, 0, 0, 1, 1,
1.021303, -1.687829, 3.623531, 1, 0, 0, 1, 1,
1.025901, 0.9015527, 1.16277, 1, 0, 0, 1, 1,
1.025971, -2.258775, 3.558588, 1, 0, 0, 1, 1,
1.035523, -0.8611603, 2.93813, 1, 0, 0, 1, 1,
1.040954, -0.2755487, 1.265676, 0, 0, 0, 1, 1,
1.062962, -0.38611, 3.715177, 0, 0, 0, 1, 1,
1.064138, 0.6566316, 1.51373, 0, 0, 0, 1, 1,
1.067019, -0.9469587, 1.884083, 0, 0, 0, 1, 1,
1.068297, -1.493067, 4.136782, 0, 0, 0, 1, 1,
1.06992, 0.01953013, 2.219603, 0, 0, 0, 1, 1,
1.070113, 0.5169888, 0.03426936, 0, 0, 0, 1, 1,
1.075479, -0.6123301, 2.995917, 1, 1, 1, 1, 1,
1.078139, 0.470221, 1.142217, 1, 1, 1, 1, 1,
1.089106, -0.01711259, 1.689941, 1, 1, 1, 1, 1,
1.093939, 1.008296, 1.680999, 1, 1, 1, 1, 1,
1.09432, -0.003711823, 3.685849, 1, 1, 1, 1, 1,
1.109046, -0.2200354, 0.5610166, 1, 1, 1, 1, 1,
1.111001, -2.65811, 2.676555, 1, 1, 1, 1, 1,
1.115768, -2.074366, 2.909136, 1, 1, 1, 1, 1,
1.126112, 1.308813, -0.7182363, 1, 1, 1, 1, 1,
1.126619, -0.07851733, 1.263222, 1, 1, 1, 1, 1,
1.128237, 1.533396, 0.9836593, 1, 1, 1, 1, 1,
1.13391, 0.623624, 1.301168, 1, 1, 1, 1, 1,
1.134541, 2.500974, -0.8938737, 1, 1, 1, 1, 1,
1.135863, 0.6087139, 2.482472, 1, 1, 1, 1, 1,
1.142514, 0.2978167, -0.1319328, 1, 1, 1, 1, 1,
1.143261, 0.06179038, 2.664711, 0, 0, 1, 1, 1,
1.148131, -1.272296, 2.124335, 1, 0, 0, 1, 1,
1.148244, 1.896715, 1.901931, 1, 0, 0, 1, 1,
1.153842, 0.5598246, 1.38491, 1, 0, 0, 1, 1,
1.154905, -1.045696, 1.182959, 1, 0, 0, 1, 1,
1.163131, 0.4341018, 0.6132292, 1, 0, 0, 1, 1,
1.169788, 0.2506496, 0.4545563, 0, 0, 0, 1, 1,
1.174126, 0.1804277, 2.091243, 0, 0, 0, 1, 1,
1.17437, 0.326094, 1.372652, 0, 0, 0, 1, 1,
1.176555, 0.2961052, 2.719588, 0, 0, 0, 1, 1,
1.180996, -1.098346, 3.008772, 0, 0, 0, 1, 1,
1.187299, 0.985775, -0.2729699, 0, 0, 0, 1, 1,
1.192309, -1.084878, 3.056828, 0, 0, 0, 1, 1,
1.193596, 0.2215989, 1.412676, 1, 1, 1, 1, 1,
1.196933, -1.192386, 3.381915, 1, 1, 1, 1, 1,
1.215522, 0.01255914, 1.272504, 1, 1, 1, 1, 1,
1.21616, -0.1039507, 1.35573, 1, 1, 1, 1, 1,
1.217602, 1.762138, -0.6253646, 1, 1, 1, 1, 1,
1.219588, -1.275068, 1.342361, 1, 1, 1, 1, 1,
1.227538, -1.165368, 3.38644, 1, 1, 1, 1, 1,
1.227639, 0.231717, 0.7417346, 1, 1, 1, 1, 1,
1.228314, -0.233746, 3.446736, 1, 1, 1, 1, 1,
1.231966, 0.8887271, 1.399702, 1, 1, 1, 1, 1,
1.24847, -1.989019, 4.207867, 1, 1, 1, 1, 1,
1.250751, -0.2440427, 2.392832, 1, 1, 1, 1, 1,
1.251794, -0.1691575, 1.267286, 1, 1, 1, 1, 1,
1.254449, -0.697174, 3.111414, 1, 1, 1, 1, 1,
1.259647, 0.7506067, 3.050461, 1, 1, 1, 1, 1,
1.261012, 0.1190231, 1.649478, 0, 0, 1, 1, 1,
1.262729, 0.2765199, 1.836552, 1, 0, 0, 1, 1,
1.270156, -0.4038683, 2.414449, 1, 0, 0, 1, 1,
1.271079, -0.8214585, 3.6091, 1, 0, 0, 1, 1,
1.273825, 0.2237104, 1.131473, 1, 0, 0, 1, 1,
1.274045, -0.09908906, 1.300958, 1, 0, 0, 1, 1,
1.284572, -0.9043465, 2.499418, 0, 0, 0, 1, 1,
1.288738, -0.3917665, 3.23491, 0, 0, 0, 1, 1,
1.298897, 0.2563814, 3.032079, 0, 0, 0, 1, 1,
1.299607, -1.018966, 1.434508, 0, 0, 0, 1, 1,
1.300596, 0.5078492, 1.216134, 0, 0, 0, 1, 1,
1.329568, 2.150905, 0.3829844, 0, 0, 0, 1, 1,
1.335747, -2.021326, 4.740839, 0, 0, 0, 1, 1,
1.346295, -1.792722, 3.071711, 1, 1, 1, 1, 1,
1.361059, -0.8836051, 1.162642, 1, 1, 1, 1, 1,
1.377273, 0.88388, 0.8917053, 1, 1, 1, 1, 1,
1.380261, 0.589756, 1.57126, 1, 1, 1, 1, 1,
1.381273, 0.1461018, 2.008592, 1, 1, 1, 1, 1,
1.393347, -1.38667, 2.052352, 1, 1, 1, 1, 1,
1.39395, 0.5940839, 2.247057, 1, 1, 1, 1, 1,
1.399235, 0.04432367, 2.910755, 1, 1, 1, 1, 1,
1.405501, -1.54467, 1.819999, 1, 1, 1, 1, 1,
1.409992, -1.280475, 1.313359, 1, 1, 1, 1, 1,
1.410905, -0.5638523, 0.7580657, 1, 1, 1, 1, 1,
1.412448, 1.810835, 0.9963546, 1, 1, 1, 1, 1,
1.413136, 0.7414968, -0.2780693, 1, 1, 1, 1, 1,
1.413187, -3.038496, 3.810023, 1, 1, 1, 1, 1,
1.416175, 0.2662927, 0.200953, 1, 1, 1, 1, 1,
1.421124, 1.578341, 2.201008, 0, 0, 1, 1, 1,
1.425083, 0.6135584, 2.295713, 1, 0, 0, 1, 1,
1.427098, -1.505316, 2.405431, 1, 0, 0, 1, 1,
1.427348, 0.1760289, 0.1398912, 1, 0, 0, 1, 1,
1.429226, 0.486645, 0.6134595, 1, 0, 0, 1, 1,
1.431848, 1.361743, 1.513876, 1, 0, 0, 1, 1,
1.463604, -0.2031644, 1.09073, 0, 0, 0, 1, 1,
1.466894, 0.2308775, 1.807397, 0, 0, 0, 1, 1,
1.474074, -0.892395, 1.927303, 0, 0, 0, 1, 1,
1.482795, 0.2438604, 1.238373, 0, 0, 0, 1, 1,
1.483748, 1.075537, 1.672701, 0, 0, 0, 1, 1,
1.489482, 0.1581003, 2.020682, 0, 0, 0, 1, 1,
1.496259, -0.6321042, 1.469544, 0, 0, 0, 1, 1,
1.501622, 0.6415015, 2.243288, 1, 1, 1, 1, 1,
1.522762, -1.809072, 3.800803, 1, 1, 1, 1, 1,
1.523954, 0.6284549, -0.05325478, 1, 1, 1, 1, 1,
1.526291, 0.03408415, 0.8649408, 1, 1, 1, 1, 1,
1.529991, 0.5259522, 0.05004314, 1, 1, 1, 1, 1,
1.550836, -1.226171, 1.486898, 1, 1, 1, 1, 1,
1.555082, 0.126527, 2.77685, 1, 1, 1, 1, 1,
1.59016, -2.08994, 2.664141, 1, 1, 1, 1, 1,
1.596122, 1.037398, 0.4510314, 1, 1, 1, 1, 1,
1.599569, -0.7842324, 2.164437, 1, 1, 1, 1, 1,
1.607604, -0.05575642, 1.988237, 1, 1, 1, 1, 1,
1.633057, -0.4209182, 1.51399, 1, 1, 1, 1, 1,
1.653436, 0.7099891, 0.2722486, 1, 1, 1, 1, 1,
1.653548, -1.265258, 0.3408067, 1, 1, 1, 1, 1,
1.659228, -0.2208439, 2.122021, 1, 1, 1, 1, 1,
1.688368, -0.03003, 2.010664, 0, 0, 1, 1, 1,
1.693178, -1.343152, 2.768318, 1, 0, 0, 1, 1,
1.715231, 1.974818, 0.09784745, 1, 0, 0, 1, 1,
1.756191, 0.06734155, 3.897333, 1, 0, 0, 1, 1,
1.757564, 0.4610284, 1.667266, 1, 0, 0, 1, 1,
1.778288, -1.52397, 0.8840595, 1, 0, 0, 1, 1,
1.782079, 0.2783037, -1.045346, 0, 0, 0, 1, 1,
1.802357, 0.2331367, 1.057953, 0, 0, 0, 1, 1,
1.81757, 0.3566506, 0.5811605, 0, 0, 0, 1, 1,
1.82342, -2.547044, 3.284474, 0, 0, 0, 1, 1,
1.825666, -0.5048521, 1.993756, 0, 0, 0, 1, 1,
1.83209, -0.7951217, 2.909926, 0, 0, 0, 1, 1,
1.854775, 0.9073994, 3.197346, 0, 0, 0, 1, 1,
1.862409, 0.1163074, 1.114896, 1, 1, 1, 1, 1,
1.870544, -0.705094, 0.2050083, 1, 1, 1, 1, 1,
1.88617, 0.499546, -0.09644897, 1, 1, 1, 1, 1,
1.892142, 0.268787, 1.104624, 1, 1, 1, 1, 1,
1.899357, 0.8598157, 2.031978, 1, 1, 1, 1, 1,
1.912919, -0.1628287, 2.893706, 1, 1, 1, 1, 1,
1.917781, 0.09894798, 1.475687, 1, 1, 1, 1, 1,
1.925524, 0.8682629, 0.6604042, 1, 1, 1, 1, 1,
1.926419, 0.6261985, 0.7898226, 1, 1, 1, 1, 1,
1.937573, -0.9584631, 2.563494, 1, 1, 1, 1, 1,
1.944111, 0.553646, 1.143918, 1, 1, 1, 1, 1,
1.954999, 0.3521763, 1.58015, 1, 1, 1, 1, 1,
1.966659, -1.91984, 1.606233, 1, 1, 1, 1, 1,
1.974503, -1.880549, 0.3496138, 1, 1, 1, 1, 1,
1.976997, -0.74859, 1.086988, 1, 1, 1, 1, 1,
2.017512, -0.3108377, 0.4369892, 0, 0, 1, 1, 1,
2.041625, -0.0004055931, 0.569203, 1, 0, 0, 1, 1,
2.042435, -0.1011564, 1.336605, 1, 0, 0, 1, 1,
2.064022, -0.1073293, 2.222837, 1, 0, 0, 1, 1,
2.087946, -1.043835, 0.6266725, 1, 0, 0, 1, 1,
2.090867, -1.382559, 3.827132, 1, 0, 0, 1, 1,
2.107275, 1.651459, 2.747579, 0, 0, 0, 1, 1,
2.159023, 1.916975, 0.3797714, 0, 0, 0, 1, 1,
2.176792, -0.04566667, 1.14186, 0, 0, 0, 1, 1,
2.19876, -1.084147, 2.788722, 0, 0, 0, 1, 1,
2.270389, 0.2209547, 2.69794, 0, 0, 0, 1, 1,
2.282851, 0.3732975, -0.04720451, 0, 0, 0, 1, 1,
2.286654, -1.359551, 1.061066, 0, 0, 0, 1, 1,
2.303324, -1.13118, 2.472977, 1, 1, 1, 1, 1,
2.331449, 1.133002, 0.9152354, 1, 1, 1, 1, 1,
2.364034, 1.120463, 0.2347623, 1, 1, 1, 1, 1,
2.540696, 0.978171, 1.434803, 1, 1, 1, 1, 1,
2.622885, 0.07345981, 2.269086, 1, 1, 1, 1, 1,
2.643731, 0.1789199, 1.095308, 1, 1, 1, 1, 1,
2.655381, 0.06872588, 2.729138, 1, 1, 1, 1, 1
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
var radius = 9.524689;
var distance = 33.45507;
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
mvMatrix.translate( 0.0433861, 0.2545061, -0.2143741 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45507);
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
