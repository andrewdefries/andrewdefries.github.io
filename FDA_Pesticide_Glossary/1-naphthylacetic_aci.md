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
-3.455269, 0.6211326, -0.3850932, 1, 0, 0, 1,
-3.420435, 2.253119, -0.06440133, 1, 0.007843138, 0, 1,
-2.805411, -1.376552, -1.768302, 1, 0.01176471, 0, 1,
-2.689871, 0.3980538, -2.480586, 1, 0.01960784, 0, 1,
-2.66575, 0.8096482, -2.570971, 1, 0.02352941, 0, 1,
-2.61841, -0.03343102, -1.269231, 1, 0.03137255, 0, 1,
-2.579422, 2.114629, -0.9393056, 1, 0.03529412, 0, 1,
-2.538823, -0.9818239, -3.324964, 1, 0.04313726, 0, 1,
-2.435924, 0.3372786, -2.661829, 1, 0.04705882, 0, 1,
-2.3742, -0.4786586, -0.705771, 1, 0.05490196, 0, 1,
-2.343836, 0.2763745, -1.489415, 1, 0.05882353, 0, 1,
-2.30088, 1.430787, -1.479741, 1, 0.06666667, 0, 1,
-2.277694, -0.6754154, -2.567094, 1, 0.07058824, 0, 1,
-2.27188, -1.802622, -0.9318939, 1, 0.07843138, 0, 1,
-2.228919, 0.4776731, -0.4409193, 1, 0.08235294, 0, 1,
-2.212372, -0.8805103, -1.617261, 1, 0.09019608, 0, 1,
-2.195998, -0.02027118, -2.391361, 1, 0.09411765, 0, 1,
-2.170368, 1.217695, -1.587517, 1, 0.1019608, 0, 1,
-2.158888, -0.4891551, -1.669634, 1, 0.1098039, 0, 1,
-2.119647, -0.8802988, -0.9993224, 1, 0.1137255, 0, 1,
-2.083277, 1.387656, -1.225625, 1, 0.1215686, 0, 1,
-2.073056, 1.455049, -1.029191, 1, 0.1254902, 0, 1,
-2.062769, 0.4576906, -0.3899658, 1, 0.1333333, 0, 1,
-2.059793, 0.08978111, -1.663927, 1, 0.1372549, 0, 1,
-2.048806, 0.6045101, 0.2803406, 1, 0.145098, 0, 1,
-2.032258, -0.4226874, -1.74212, 1, 0.1490196, 0, 1,
-2.009055, -0.2906794, -2.243831, 1, 0.1568628, 0, 1,
-2.003263, 0.4110008, -0.8854398, 1, 0.1607843, 0, 1,
-1.976344, -0.1755605, -1.376272, 1, 0.1686275, 0, 1,
-1.970332, -0.7637169, -2.201186, 1, 0.172549, 0, 1,
-1.941463, 0.9643968, -0.8274912, 1, 0.1803922, 0, 1,
-1.9149, 0.9685327, -0.8473434, 1, 0.1843137, 0, 1,
-1.914217, 1.617196, -0.3410449, 1, 0.1921569, 0, 1,
-1.912921, 0.08538033, -0.289221, 1, 0.1960784, 0, 1,
-1.882069, -0.8388062, -0.05713458, 1, 0.2039216, 0, 1,
-1.879002, 0.9916511, -0.5521822, 1, 0.2117647, 0, 1,
-1.863949, 0.6960427, -1.283532, 1, 0.2156863, 0, 1,
-1.854535, -0.8023975, -2.912211, 1, 0.2235294, 0, 1,
-1.826824, -0.7331305, -3.36116, 1, 0.227451, 0, 1,
-1.826585, -0.5262184, -2.086751, 1, 0.2352941, 0, 1,
-1.813847, 1.026067, -1.595182, 1, 0.2392157, 0, 1,
-1.811642, 0.7448276, -1.232302, 1, 0.2470588, 0, 1,
-1.807329, -0.02124142, -1.629253, 1, 0.2509804, 0, 1,
-1.805366, 1.377746, -0.9162046, 1, 0.2588235, 0, 1,
-1.785322, 1.142938, -1.893582, 1, 0.2627451, 0, 1,
-1.710565, -0.3781123, -2.680203, 1, 0.2705882, 0, 1,
-1.696606, -1.186977, -1.378992, 1, 0.2745098, 0, 1,
-1.685688, -0.5346729, -1.745321, 1, 0.282353, 0, 1,
-1.682304, -0.6218473, -2.732311, 1, 0.2862745, 0, 1,
-1.673568, -0.02329922, -0.4787499, 1, 0.2941177, 0, 1,
-1.671775, 0.007426253, -1.026469, 1, 0.3019608, 0, 1,
-1.671001, 1.40674, -0.09159537, 1, 0.3058824, 0, 1,
-1.651671, -0.1401986, -2.255358, 1, 0.3137255, 0, 1,
-1.647718, 0.4484169, -0.875784, 1, 0.3176471, 0, 1,
-1.642921, -1.526513, -1.570079, 1, 0.3254902, 0, 1,
-1.637911, 1.065845, -1.006949, 1, 0.3294118, 0, 1,
-1.633955, 0.5749251, -0.726031, 1, 0.3372549, 0, 1,
-1.623064, -1.097321, -2.510967, 1, 0.3411765, 0, 1,
-1.612057, -0.05252075, -2.127502, 1, 0.3490196, 0, 1,
-1.60301, -0.01693691, -0.2856905, 1, 0.3529412, 0, 1,
-1.584451, -0.4375595, -1.507349, 1, 0.3607843, 0, 1,
-1.583292, 0.7770711, -1.211161, 1, 0.3647059, 0, 1,
-1.575177, -0.2543468, -0.8116684, 1, 0.372549, 0, 1,
-1.562183, 1.095271, -0.979992, 1, 0.3764706, 0, 1,
-1.561387, -0.5299841, -2.969624, 1, 0.3843137, 0, 1,
-1.552873, -1.305141, -1.831189, 1, 0.3882353, 0, 1,
-1.551967, -0.7551263, -1.736849, 1, 0.3960784, 0, 1,
-1.549875, -1.382484, -0.7128392, 1, 0.4039216, 0, 1,
-1.54634, -0.5718043, -0.6925949, 1, 0.4078431, 0, 1,
-1.545397, 0.155085, -2.232423, 1, 0.4156863, 0, 1,
-1.54379, -1.244321, -2.049624, 1, 0.4196078, 0, 1,
-1.541275, 1.205092, -0.4919792, 1, 0.427451, 0, 1,
-1.537598, 0.3703729, -3.016474, 1, 0.4313726, 0, 1,
-1.532942, 0.9572195, -1.663511, 1, 0.4392157, 0, 1,
-1.526694, -0.07623234, -1.612232, 1, 0.4431373, 0, 1,
-1.509708, -0.1616422, -1.646919, 1, 0.4509804, 0, 1,
-1.486323, -1.057572, -2.097463, 1, 0.454902, 0, 1,
-1.481225, -1.383662, -3.702816, 1, 0.4627451, 0, 1,
-1.480302, -0.2070728, -2.701961, 1, 0.4666667, 0, 1,
-1.475297, -0.418525, 0.004909929, 1, 0.4745098, 0, 1,
-1.472228, -0.1127249, -1.847459, 1, 0.4784314, 0, 1,
-1.449677, -0.2560067, -2.830542, 1, 0.4862745, 0, 1,
-1.443544, 0.6146028, -1.940391, 1, 0.4901961, 0, 1,
-1.443003, -0.04879329, -2.127245, 1, 0.4980392, 0, 1,
-1.434404, -0.2660889, 2.107055, 1, 0.5058824, 0, 1,
-1.429546, -0.830493, -2.361219, 1, 0.509804, 0, 1,
-1.410429, 1.771338, -0.4666434, 1, 0.5176471, 0, 1,
-1.407746, 1.130541, -1.57345, 1, 0.5215687, 0, 1,
-1.40472, 0.3390141, -0.9279574, 1, 0.5294118, 0, 1,
-1.390744, 0.4420682, -1.844887, 1, 0.5333334, 0, 1,
-1.371654, -0.6445842, -1.996618, 1, 0.5411765, 0, 1,
-1.369553, 2.204778, -1.186804, 1, 0.5450981, 0, 1,
-1.365327, -0.588047, -0.783244, 1, 0.5529412, 0, 1,
-1.347455, 0.2241547, -1.444249, 1, 0.5568628, 0, 1,
-1.344148, -1.017313, -1.625756, 1, 0.5647059, 0, 1,
-1.34157, 0.6972563, -1.378326, 1, 0.5686275, 0, 1,
-1.34048, 1.100924, 0.4700517, 1, 0.5764706, 0, 1,
-1.322304, 2.756907, -0.3101153, 1, 0.5803922, 0, 1,
-1.310395, -0.1623023, -3.45711, 1, 0.5882353, 0, 1,
-1.310344, -0.6544979, -2.166598, 1, 0.5921569, 0, 1,
-1.30836, -0.2361852, -1.719058, 1, 0.6, 0, 1,
-1.302662, 0.1439533, -1.898438, 1, 0.6078432, 0, 1,
-1.300222, 0.04540753, -1.671378, 1, 0.6117647, 0, 1,
-1.298905, 0.9951726, -2.948728, 1, 0.6196079, 0, 1,
-1.289101, 0.1393849, -1.613963, 1, 0.6235294, 0, 1,
-1.277445, -0.934554, -3.000728, 1, 0.6313726, 0, 1,
-1.274888, -0.02766509, -2.85186, 1, 0.6352941, 0, 1,
-1.274755, 0.7524633, -2.081367, 1, 0.6431373, 0, 1,
-1.270975, 0.1389116, -0.04081587, 1, 0.6470588, 0, 1,
-1.270355, -0.3931716, -1.963159, 1, 0.654902, 0, 1,
-1.267967, -0.728806, -1.019175, 1, 0.6588235, 0, 1,
-1.266797, 0.09466803, -2.362555, 1, 0.6666667, 0, 1,
-1.266748, -0.8959944, -3.05437, 1, 0.6705883, 0, 1,
-1.261779, 0.504836, -2.430323, 1, 0.6784314, 0, 1,
-1.257231, 0.47512, -1.38933, 1, 0.682353, 0, 1,
-1.25679, -0.3719628, -0.6656162, 1, 0.6901961, 0, 1,
-1.246951, -1.089733, -1.030972, 1, 0.6941177, 0, 1,
-1.245887, 2.023251, -1.362824, 1, 0.7019608, 0, 1,
-1.243126, 1.110864, -2.333215, 1, 0.7098039, 0, 1,
-1.237719, -0.03416808, -2.672054, 1, 0.7137255, 0, 1,
-1.216693, 1.668405, -0.3013364, 1, 0.7215686, 0, 1,
-1.214148, -0.2748835, -2.918472, 1, 0.7254902, 0, 1,
-1.211544, -0.430563, -0.8735751, 1, 0.7333333, 0, 1,
-1.208491, 0.9697345, 0.6885353, 1, 0.7372549, 0, 1,
-1.204301, 0.3593004, -0.3930695, 1, 0.7450981, 0, 1,
-1.204201, -0.2840461, -0.7815567, 1, 0.7490196, 0, 1,
-1.202634, -0.05477224, -1.973225, 1, 0.7568628, 0, 1,
-1.195736, 0.7663826, 0.5790984, 1, 0.7607843, 0, 1,
-1.194307, -0.03711075, -1.768812, 1, 0.7686275, 0, 1,
-1.192645, -1.543213, -3.267267, 1, 0.772549, 0, 1,
-1.184178, 0.6171385, -0.9121584, 1, 0.7803922, 0, 1,
-1.183033, -1.138989, -2.217542, 1, 0.7843137, 0, 1,
-1.179596, -0.3475254, 0.06286247, 1, 0.7921569, 0, 1,
-1.174541, -1.073294, -2.302675, 1, 0.7960784, 0, 1,
-1.169683, 1.350909, -0.1463721, 1, 0.8039216, 0, 1,
-1.168264, 0.2894437, -1.264288, 1, 0.8117647, 0, 1,
-1.161571, -0.07368603, -1.93633, 1, 0.8156863, 0, 1,
-1.137594, -0.07205163, -1.92549, 1, 0.8235294, 0, 1,
-1.133857, 1.035609, -1.085541, 1, 0.827451, 0, 1,
-1.130506, 1.556481, -1.584062, 1, 0.8352941, 0, 1,
-1.12893, -0.3655312, -1.404413, 1, 0.8392157, 0, 1,
-1.128582, -0.956211, -3.605652, 1, 0.8470588, 0, 1,
-1.106849, 0.9060509, -0.2284053, 1, 0.8509804, 0, 1,
-1.1058, -0.6272444, -0.7728699, 1, 0.8588235, 0, 1,
-1.100753, -0.3734812, -2.814004, 1, 0.8627451, 0, 1,
-1.097067, 0.5448672, -0.6663852, 1, 0.8705882, 0, 1,
-1.08798, -1.774161, -1.666814, 1, 0.8745098, 0, 1,
-1.08792, -1.058033, -2.605075, 1, 0.8823529, 0, 1,
-1.087238, -2.212111, -3.441069, 1, 0.8862745, 0, 1,
-1.082085, -0.2205833, -2.575179, 1, 0.8941177, 0, 1,
-1.079768, -0.7281117, -0.8264619, 1, 0.8980392, 0, 1,
-1.07822, -0.4185894, -1.568001, 1, 0.9058824, 0, 1,
-1.077414, 0.2239484, -0.521997, 1, 0.9137255, 0, 1,
-1.072482, 0.7714303, -2.048918, 1, 0.9176471, 0, 1,
-1.066468, -0.2645153, -2.513579, 1, 0.9254902, 0, 1,
-1.062598, 2.028896, 0.2478573, 1, 0.9294118, 0, 1,
-1.061193, -1.60639, -1.876132, 1, 0.9372549, 0, 1,
-1.055387, 0.8004042, -1.092766, 1, 0.9411765, 0, 1,
-1.053536, 1.937706, -0.2481192, 1, 0.9490196, 0, 1,
-1.050669, -0.4889812, -1.560796, 1, 0.9529412, 0, 1,
-1.044341, 0.8092056, 0.1261381, 1, 0.9607843, 0, 1,
-1.035547, 1.875287, -2.604225, 1, 0.9647059, 0, 1,
-1.033921, -0.3361539, -3.396188, 1, 0.972549, 0, 1,
-1.030371, -1.687589, -3.995142, 1, 0.9764706, 0, 1,
-1.020933, 0.4798081, -1.921391, 1, 0.9843137, 0, 1,
-1.01775, 2.597994, 0.1214641, 1, 0.9882353, 0, 1,
-0.9994227, 0.8009399, -2.870931, 1, 0.9960784, 0, 1,
-0.9964988, 1.29883, -0.06693532, 0.9960784, 1, 0, 1,
-0.9774752, 2.335453, -0.3013419, 0.9921569, 1, 0, 1,
-0.974388, -0.8065124, -2.94819, 0.9843137, 1, 0, 1,
-0.9687902, 0.493668, -1.535049, 0.9803922, 1, 0, 1,
-0.9672401, -1.27291, -3.534112, 0.972549, 1, 0, 1,
-0.9596837, -0.3587942, -1.252786, 0.9686275, 1, 0, 1,
-0.9554038, 0.8041536, -1.231582, 0.9607843, 1, 0, 1,
-0.9541027, -2.457778, -2.751223, 0.9568627, 1, 0, 1,
-0.9524051, -0.6282539, -1.959392, 0.9490196, 1, 0, 1,
-0.9494768, -2.147216, -3.060884, 0.945098, 1, 0, 1,
-0.9463375, 0.534641, -2.859198, 0.9372549, 1, 0, 1,
-0.9423878, -0.8096721, -1.697361, 0.9333333, 1, 0, 1,
-0.9391398, -2.081287, -2.540424, 0.9254902, 1, 0, 1,
-0.9367508, 2.828231, 0.05728751, 0.9215686, 1, 0, 1,
-0.9338642, -0.215317, -1.455131, 0.9137255, 1, 0, 1,
-0.933602, -0.1780082, -0.4206232, 0.9098039, 1, 0, 1,
-0.9324688, -0.790746, -2.703982, 0.9019608, 1, 0, 1,
-0.9289235, -0.2426386, -1.30088, 0.8941177, 1, 0, 1,
-0.9201266, 1.092963, -1.110614, 0.8901961, 1, 0, 1,
-0.9196936, -1.207175, -4.647077, 0.8823529, 1, 0, 1,
-0.916674, 1.405142, -1.597883, 0.8784314, 1, 0, 1,
-0.9162605, -0.1376231, -2.876832, 0.8705882, 1, 0, 1,
-0.9097111, -1.680706, -1.32914, 0.8666667, 1, 0, 1,
-0.9089677, 0.009224061, -0.6206261, 0.8588235, 1, 0, 1,
-0.9083254, 0.2643968, -1.525115, 0.854902, 1, 0, 1,
-0.9064127, -1.983508, -1.221899, 0.8470588, 1, 0, 1,
-0.9017398, 0.06130483, -2.776373, 0.8431373, 1, 0, 1,
-0.8999831, -1.264923, -3.977011, 0.8352941, 1, 0, 1,
-0.8965077, -1.533353, -3.126752, 0.8313726, 1, 0, 1,
-0.8958491, -0.87721, -5.201323, 0.8235294, 1, 0, 1,
-0.894729, 0.3614962, -0.6068929, 0.8196079, 1, 0, 1,
-0.892123, 0.9667573, -0.07612614, 0.8117647, 1, 0, 1,
-0.8898236, 1.383945, -1.568331, 0.8078431, 1, 0, 1,
-0.8884214, -1.312382, -2.357864, 0.8, 1, 0, 1,
-0.8811051, -0.4191341, -0.8588458, 0.7921569, 1, 0, 1,
-0.8793327, -0.2826335, -4.636465, 0.7882353, 1, 0, 1,
-0.8789472, 0.7214648, -0.148256, 0.7803922, 1, 0, 1,
-0.8765565, -0.4896457, 1.525554, 0.7764706, 1, 0, 1,
-0.8759423, -0.8361646, -1.297398, 0.7686275, 1, 0, 1,
-0.8742077, 0.4850688, -1.611842, 0.7647059, 1, 0, 1,
-0.8690856, 2.111208, -2.557339, 0.7568628, 1, 0, 1,
-0.8633629, -0.3082475, -0.9685565, 0.7529412, 1, 0, 1,
-0.8604604, -0.4210613, -1.793613, 0.7450981, 1, 0, 1,
-0.856824, -0.2952713, -1.598876, 0.7411765, 1, 0, 1,
-0.855891, 0.002225297, -1.755613, 0.7333333, 1, 0, 1,
-0.854081, 0.4804616, -2.638997, 0.7294118, 1, 0, 1,
-0.8539904, -0.1067057, -0.6509292, 0.7215686, 1, 0, 1,
-0.8530779, 0.3663359, -1.572959, 0.7176471, 1, 0, 1,
-0.8529543, 1.317407, -1.250491, 0.7098039, 1, 0, 1,
-0.8526905, -0.3138978, -1.698749, 0.7058824, 1, 0, 1,
-0.8522395, 1.382934, 0.5607335, 0.6980392, 1, 0, 1,
-0.8511793, 0.9098871, 0.6350775, 0.6901961, 1, 0, 1,
-0.8446578, 1.634213, -1.317378, 0.6862745, 1, 0, 1,
-0.8307801, -1.097729, -1.909929, 0.6784314, 1, 0, 1,
-0.813566, 0.5367478, -1.812407, 0.6745098, 1, 0, 1,
-0.8124485, 0.6428633, -0.4999711, 0.6666667, 1, 0, 1,
-0.8113998, 0.8583785, 0.2691621, 0.6627451, 1, 0, 1,
-0.8101668, 0.9664165, -1.33077, 0.654902, 1, 0, 1,
-0.808839, 0.5259228, -1.564019, 0.6509804, 1, 0, 1,
-0.8086815, 0.836769, -0.7652084, 0.6431373, 1, 0, 1,
-0.8067836, -0.4964221, -2.538965, 0.6392157, 1, 0, 1,
-0.8028269, -0.6922677, -2.054076, 0.6313726, 1, 0, 1,
-0.8027217, 0.5874681, -1.607031, 0.627451, 1, 0, 1,
-0.7903612, -1.998373, -1.618111, 0.6196079, 1, 0, 1,
-0.785697, 0.5600005, -1.886638, 0.6156863, 1, 0, 1,
-0.7849358, -0.399085, -2.68382, 0.6078432, 1, 0, 1,
-0.7816256, 0.9821625, -0.6526372, 0.6039216, 1, 0, 1,
-0.7746041, 0.163083, -2.190443, 0.5960785, 1, 0, 1,
-0.7625613, -0.5372605, -3.118316, 0.5882353, 1, 0, 1,
-0.7568995, -1.00589, -1.056934, 0.5843138, 1, 0, 1,
-0.7541245, -0.9853295, -3.175016, 0.5764706, 1, 0, 1,
-0.7539898, 0.4541614, -0.7185268, 0.572549, 1, 0, 1,
-0.7512813, -0.4545104, -2.531608, 0.5647059, 1, 0, 1,
-0.7436633, -1.188761, -1.992645, 0.5607843, 1, 0, 1,
-0.7424505, -1.41193, -3.028912, 0.5529412, 1, 0, 1,
-0.7362326, 0.2535583, -0.4464815, 0.5490196, 1, 0, 1,
-0.7355328, -0.03778515, -1.127914, 0.5411765, 1, 0, 1,
-0.7348171, -1.208584, -3.238223, 0.5372549, 1, 0, 1,
-0.7339196, 0.1865344, -0.5563086, 0.5294118, 1, 0, 1,
-0.7334688, 1.154527, 1.73125, 0.5254902, 1, 0, 1,
-0.7318882, 1.824738, -0.9232433, 0.5176471, 1, 0, 1,
-0.731306, -0.08352498, -1.874179, 0.5137255, 1, 0, 1,
-0.7303419, -0.9086855, -3.534262, 0.5058824, 1, 0, 1,
-0.7298156, 1.302679, -2.663432, 0.5019608, 1, 0, 1,
-0.7289338, 1.234265, -0.4922281, 0.4941176, 1, 0, 1,
-0.7285392, -0.544775, -0.3332976, 0.4862745, 1, 0, 1,
-0.7282476, 1.075005, -1.857089, 0.4823529, 1, 0, 1,
-0.7248105, -0.9236527, -1.515864, 0.4745098, 1, 0, 1,
-0.7140269, -0.8494257, -3.042432, 0.4705882, 1, 0, 1,
-0.709773, -0.3920913, -3.040405, 0.4627451, 1, 0, 1,
-0.7093014, -0.3379128, -1.841186, 0.4588235, 1, 0, 1,
-0.7063609, -0.1127372, -1.910273, 0.4509804, 1, 0, 1,
-0.7055665, -0.5800269, -0.2815322, 0.4470588, 1, 0, 1,
-0.7041708, 1.231008, 0.6487111, 0.4392157, 1, 0, 1,
-0.7008646, 0.8530251, -0.1951243, 0.4352941, 1, 0, 1,
-0.6983142, 0.6883848, -0.8662475, 0.427451, 1, 0, 1,
-0.6976545, 1.206904, -0.06279272, 0.4235294, 1, 0, 1,
-0.6940181, 0.263934, -2.059725, 0.4156863, 1, 0, 1,
-0.6939057, -1.560399, -0.9159781, 0.4117647, 1, 0, 1,
-0.6841625, 0.8994858, -2.309318, 0.4039216, 1, 0, 1,
-0.681696, 0.04643834, -0.887662, 0.3960784, 1, 0, 1,
-0.6764089, 2.167151, -2.330011, 0.3921569, 1, 0, 1,
-0.6727028, 1.704088, 0.5186864, 0.3843137, 1, 0, 1,
-0.6687677, -0.04058691, -1.371127, 0.3803922, 1, 0, 1,
-0.6663111, 0.2967638, -0.210449, 0.372549, 1, 0, 1,
-0.6660572, 1.15505, -0.4544699, 0.3686275, 1, 0, 1,
-0.6621495, 0.5552869, -1.648909, 0.3607843, 1, 0, 1,
-0.6555991, 1.291734, -1.152905, 0.3568628, 1, 0, 1,
-0.6502697, 0.01741196, -2.833204, 0.3490196, 1, 0, 1,
-0.6458012, 0.2707761, -2.240759, 0.345098, 1, 0, 1,
-0.6445924, 1.152664, 0.8846619, 0.3372549, 1, 0, 1,
-0.6421238, 0.2210478, -1.601142, 0.3333333, 1, 0, 1,
-0.6377689, -1.299981, -2.24349, 0.3254902, 1, 0, 1,
-0.6375969, -0.2928151, -1.230015, 0.3215686, 1, 0, 1,
-0.629833, 0.3323429, 0.4526625, 0.3137255, 1, 0, 1,
-0.6230495, -0.6050825, -1.219077, 0.3098039, 1, 0, 1,
-0.6184295, 0.5976962, -1.247306, 0.3019608, 1, 0, 1,
-0.616584, 0.2850349, -2.139309, 0.2941177, 1, 0, 1,
-0.6158073, -1.060094, -3.939419, 0.2901961, 1, 0, 1,
-0.6105532, -0.4774694, -1.450896, 0.282353, 1, 0, 1,
-0.6029559, 1.151388, -0.5356648, 0.2784314, 1, 0, 1,
-0.6028331, 1.560948, 0.03672374, 0.2705882, 1, 0, 1,
-0.5936685, -1.817939, -1.604998, 0.2666667, 1, 0, 1,
-0.5881633, -0.3876817, -2.879112, 0.2588235, 1, 0, 1,
-0.587712, 2.420762, 1.166183, 0.254902, 1, 0, 1,
-0.5790101, 0.5372317, 0.2114979, 0.2470588, 1, 0, 1,
-0.5770656, -0.08427622, -0.4347553, 0.2431373, 1, 0, 1,
-0.5756994, 1.343446, 0.8826802, 0.2352941, 1, 0, 1,
-0.575316, -0.3754957, -1.669991, 0.2313726, 1, 0, 1,
-0.5709019, 1.259714, 0.7197008, 0.2235294, 1, 0, 1,
-0.569879, 0.5583431, 0.7115424, 0.2196078, 1, 0, 1,
-0.5613552, -0.09136063, -0.5378407, 0.2117647, 1, 0, 1,
-0.5585478, 1.355177, -2.250189, 0.2078431, 1, 0, 1,
-0.5585093, -1.909203, -4.167544, 0.2, 1, 0, 1,
-0.5584244, 0.2724883, -0.7860197, 0.1921569, 1, 0, 1,
-0.5541303, -0.5642321, -5.565171, 0.1882353, 1, 0, 1,
-0.5541054, -0.6268642, -2.496193, 0.1803922, 1, 0, 1,
-0.5540129, -1.312418, -3.371922, 0.1764706, 1, 0, 1,
-0.5511496, -1.150797, -2.271868, 0.1686275, 1, 0, 1,
-0.551023, -0.8699806, -2.431233, 0.1647059, 1, 0, 1,
-0.5504946, 0.8434132, -0.6041226, 0.1568628, 1, 0, 1,
-0.5498378, -0.9110427, -2.062414, 0.1529412, 1, 0, 1,
-0.5431706, 1.33474, -1.271839, 0.145098, 1, 0, 1,
-0.5422795, -0.07700095, -3.257453, 0.1411765, 1, 0, 1,
-0.5360605, 0.4443651, -2.026408, 0.1333333, 1, 0, 1,
-0.5359641, -1.046513, -1.875544, 0.1294118, 1, 0, 1,
-0.5338584, -1.120418, -2.571016, 0.1215686, 1, 0, 1,
-0.5321583, -0.8339874, -2.773925, 0.1176471, 1, 0, 1,
-0.5310432, 0.2493267, -1.325954, 0.1098039, 1, 0, 1,
-0.5303044, -0.8874502, -2.105251, 0.1058824, 1, 0, 1,
-0.5291395, -0.4402143, -2.266482, 0.09803922, 1, 0, 1,
-0.5256004, -0.469574, -0.3169404, 0.09019608, 1, 0, 1,
-0.5244618, 2.139278, -1.467257, 0.08627451, 1, 0, 1,
-0.5227474, -0.438832, -1.550978, 0.07843138, 1, 0, 1,
-0.5225751, -0.1050238, -1.612485, 0.07450981, 1, 0, 1,
-0.5199266, 0.4754526, -0.7340998, 0.06666667, 1, 0, 1,
-0.5173915, 0.1985896, -0.3925817, 0.0627451, 1, 0, 1,
-0.5077565, 1.237752, -0.3366909, 0.05490196, 1, 0, 1,
-0.4990728, 0.4549924, 0.3785325, 0.05098039, 1, 0, 1,
-0.4968013, 1.113539, -0.5192913, 0.04313726, 1, 0, 1,
-0.4893509, -2.958271, -3.502045, 0.03921569, 1, 0, 1,
-0.4868678, -1.57129, -1.77941, 0.03137255, 1, 0, 1,
-0.4842187, 0.4589186, -0.525294, 0.02745098, 1, 0, 1,
-0.4768399, -0.4557098, -2.308218, 0.01960784, 1, 0, 1,
-0.4716855, 0.5641585, -1.323506, 0.01568628, 1, 0, 1,
-0.4684608, 0.3292559, -1.003948, 0.007843138, 1, 0, 1,
-0.4667869, -1.996431, -3.357991, 0.003921569, 1, 0, 1,
-0.4618025, 1.163375, -0.6540171, 0, 1, 0.003921569, 1,
-0.4546959, 0.9099227, 0.825875, 0, 1, 0.01176471, 1,
-0.4535761, 1.305725, -0.4662744, 0, 1, 0.01568628, 1,
-0.4493451, -0.4078819, -2.452534, 0, 1, 0.02352941, 1,
-0.4467607, -0.7559022, -2.952215, 0, 1, 0.02745098, 1,
-0.4430095, 1.321222, -1.323802, 0, 1, 0.03529412, 1,
-0.4326196, -2.008323, -2.162797, 0, 1, 0.03921569, 1,
-0.4310557, 0.9397904, 0.05473481, 0, 1, 0.04705882, 1,
-0.4276357, 0.5385866, -0.647997, 0, 1, 0.05098039, 1,
-0.4188261, -0.9456018, -2.295785, 0, 1, 0.05882353, 1,
-0.4163921, -0.7159855, -4.386424, 0, 1, 0.0627451, 1,
-0.4148549, -2.462305, -2.451292, 0, 1, 0.07058824, 1,
-0.4139521, 0.4856697, -0.3218535, 0, 1, 0.07450981, 1,
-0.4109613, -0.7867127, -3.404104, 0, 1, 0.08235294, 1,
-0.4102235, 1.224412, -0.8311208, 0, 1, 0.08627451, 1,
-0.409722, -1.488588, -2.733457, 0, 1, 0.09411765, 1,
-0.4072977, 0.777536, -0.4755794, 0, 1, 0.1019608, 1,
-0.4032218, -0.7423006, -3.455693, 0, 1, 0.1058824, 1,
-0.4029011, -0.5572655, -1.767612, 0, 1, 0.1137255, 1,
-0.4016737, 0.7168531, -0.5604407, 0, 1, 0.1176471, 1,
-0.400662, 0.5179952, -1.820246, 0, 1, 0.1254902, 1,
-0.3958998, 0.871429, 0.328442, 0, 1, 0.1294118, 1,
-0.3943851, -0.1678168, -1.935211, 0, 1, 0.1372549, 1,
-0.3941137, -0.111993, -2.866157, 0, 1, 0.1411765, 1,
-0.3919124, -0.5859003, -3.510595, 0, 1, 0.1490196, 1,
-0.3907101, -0.3673062, -2.425932, 0, 1, 0.1529412, 1,
-0.3855023, 1.26646, -0.7723097, 0, 1, 0.1607843, 1,
-0.3821312, 0.08452978, -0.2940243, 0, 1, 0.1647059, 1,
-0.3784476, -1.144645, -1.288306, 0, 1, 0.172549, 1,
-0.3719256, 0.1916417, -0.3295298, 0, 1, 0.1764706, 1,
-0.3681908, 1.227945, 0.417012, 0, 1, 0.1843137, 1,
-0.3604248, -1.078869, -3.394173, 0, 1, 0.1882353, 1,
-0.3489505, 0.6518959, 0.5461597, 0, 1, 0.1960784, 1,
-0.3474505, -0.02476809, -1.27948, 0, 1, 0.2039216, 1,
-0.3405933, 0.3688926, 0.2412356, 0, 1, 0.2078431, 1,
-0.3379114, -1.179923, -1.220094, 0, 1, 0.2156863, 1,
-0.3376472, -1.171082, -2.669029, 0, 1, 0.2196078, 1,
-0.3360632, -0.6433261, -0.9693339, 0, 1, 0.227451, 1,
-0.3359065, -0.3580439, -1.282909, 0, 1, 0.2313726, 1,
-0.3358974, -1.419058, -3.203016, 0, 1, 0.2392157, 1,
-0.333027, -0.5695445, -1.50959, 0, 1, 0.2431373, 1,
-0.3316105, 0.1860971, -1.422794, 0, 1, 0.2509804, 1,
-0.3305891, 0.7862993, -1.081409, 0, 1, 0.254902, 1,
-0.3296497, 1.221104, 0.5003725, 0, 1, 0.2627451, 1,
-0.3268767, -1.688308, -3.677061, 0, 1, 0.2666667, 1,
-0.3265415, -0.8506224, -2.339479, 0, 1, 0.2745098, 1,
-0.3240377, 0.7503397, -1.525291, 0, 1, 0.2784314, 1,
-0.3237425, 0.4279392, -0.1840138, 0, 1, 0.2862745, 1,
-0.3212933, 1.481875, -1.141519, 0, 1, 0.2901961, 1,
-0.3189197, -0.778915, -4.294019, 0, 1, 0.2980392, 1,
-0.3147081, 0.2225581, -1.163978, 0, 1, 0.3058824, 1,
-0.3110273, 0.9011759, 0.8672019, 0, 1, 0.3098039, 1,
-0.3095751, -0.7814544, -2.099089, 0, 1, 0.3176471, 1,
-0.3091291, -0.384895, -2.091735, 0, 1, 0.3215686, 1,
-0.302505, 0.3926798, -0.4838395, 0, 1, 0.3294118, 1,
-0.2949369, -0.1355813, -1.417711, 0, 1, 0.3333333, 1,
-0.2904101, -0.2254978, -0.1953529, 0, 1, 0.3411765, 1,
-0.2895077, -0.1675572, -2.045853, 0, 1, 0.345098, 1,
-0.2886772, 1.875277, 0.5923926, 0, 1, 0.3529412, 1,
-0.2836246, 1.364281, -1.166753, 0, 1, 0.3568628, 1,
-0.2835501, -1.304579, -3.493099, 0, 1, 0.3647059, 1,
-0.2821077, 0.938817, -1.434772, 0, 1, 0.3686275, 1,
-0.2802036, -0.3613176, -2.215413, 0, 1, 0.3764706, 1,
-0.2740904, -0.81903, -3.322076, 0, 1, 0.3803922, 1,
-0.2720409, -0.5379955, -3.286527, 0, 1, 0.3882353, 1,
-0.2714021, -0.3430108, -3.049772, 0, 1, 0.3921569, 1,
-0.2670103, -0.0644612, -1.611047, 0, 1, 0.4, 1,
-0.265302, -0.09823779, -0.5876893, 0, 1, 0.4078431, 1,
-0.2638982, 1.27437, 1.043266, 0, 1, 0.4117647, 1,
-0.2603603, 0.619521, 0.2651017, 0, 1, 0.4196078, 1,
-0.2591991, 2.006861, 0.5680956, 0, 1, 0.4235294, 1,
-0.2575793, 1.124428, -1.187147, 0, 1, 0.4313726, 1,
-0.2555839, -1.007375, -4.632771, 0, 1, 0.4352941, 1,
-0.2549732, 0.5645426, 0.8211608, 0, 1, 0.4431373, 1,
-0.2384026, -0.1027696, -0.7796931, 0, 1, 0.4470588, 1,
-0.2363562, 0.3702953, -2.271132, 0, 1, 0.454902, 1,
-0.2313587, 0.217089, -0.457623, 0, 1, 0.4588235, 1,
-0.2310022, 0.6757678, -0.05358889, 0, 1, 0.4666667, 1,
-0.2307226, 0.3118058, -0.2547408, 0, 1, 0.4705882, 1,
-0.2220133, -0.2264426, -2.145198, 0, 1, 0.4784314, 1,
-0.2217335, 1.711774, 0.805733, 0, 1, 0.4823529, 1,
-0.2197775, 0.8742098, 0.8413137, 0, 1, 0.4901961, 1,
-0.217842, 0.1722195, -2.307452, 0, 1, 0.4941176, 1,
-0.2171579, -0.9097349, -3.820519, 0, 1, 0.5019608, 1,
-0.2148225, -0.2537703, -2.152792, 0, 1, 0.509804, 1,
-0.213689, -0.5059296, -2.860806, 0, 1, 0.5137255, 1,
-0.2116434, -0.9645795, -3.300422, 0, 1, 0.5215687, 1,
-0.2100897, -0.4512736, -2.993796, 0, 1, 0.5254902, 1,
-0.2083502, -0.1997885, -2.219761, 0, 1, 0.5333334, 1,
-0.2029828, 2.019312, 2.287184, 0, 1, 0.5372549, 1,
-0.199727, 0.68657, 1.076182, 0, 1, 0.5450981, 1,
-0.1976276, 0.7622857, -0.4479479, 0, 1, 0.5490196, 1,
-0.1966925, 1.135884, -1.710831, 0, 1, 0.5568628, 1,
-0.1961201, -0.7625498, -2.683727, 0, 1, 0.5607843, 1,
-0.1928121, -0.4955711, -2.654235, 0, 1, 0.5686275, 1,
-0.1902155, -0.7489116, -3.697775, 0, 1, 0.572549, 1,
-0.189965, 0.2552529, -0.8689325, 0, 1, 0.5803922, 1,
-0.182144, 1.782125, -2.11164, 0, 1, 0.5843138, 1,
-0.1799615, 1.528113, -0.6114007, 0, 1, 0.5921569, 1,
-0.1751363, -0.3604791, -1.908749, 0, 1, 0.5960785, 1,
-0.1751114, -0.3336263, -3.152282, 0, 1, 0.6039216, 1,
-0.1750978, -0.7744357, -3.077967, 0, 1, 0.6117647, 1,
-0.1745649, -0.3962253, -4.343668, 0, 1, 0.6156863, 1,
-0.1741829, -1.004028, -2.941146, 0, 1, 0.6235294, 1,
-0.1707248, 0.2209712, -1.271678, 0, 1, 0.627451, 1,
-0.1695171, 1.646561, 0.2978698, 0, 1, 0.6352941, 1,
-0.1634188, -0.2809153, -2.988689, 0, 1, 0.6392157, 1,
-0.1579829, -0.9658487, -3.518387, 0, 1, 0.6470588, 1,
-0.1564083, -0.3067599, -1.960087, 0, 1, 0.6509804, 1,
-0.1557411, -0.5677336, -3.278393, 0, 1, 0.6588235, 1,
-0.1506054, 0.9579549, -1.21995, 0, 1, 0.6627451, 1,
-0.1473916, -0.6269007, -4.530652, 0, 1, 0.6705883, 1,
-0.1439621, -1.659935, -3.359911, 0, 1, 0.6745098, 1,
-0.1421634, -0.8555015, -3.959989, 0, 1, 0.682353, 1,
-0.1344895, 0.003170646, -1.900784, 0, 1, 0.6862745, 1,
-0.1306165, 2.95828, 0.1284597, 0, 1, 0.6941177, 1,
-0.1297123, 0.45039, 1.50922, 0, 1, 0.7019608, 1,
-0.1240685, -1.10823, -2.436725, 0, 1, 0.7058824, 1,
-0.1237266, 1.022008, -0.1561015, 0, 1, 0.7137255, 1,
-0.1236304, -0.2031153, -1.23193, 0, 1, 0.7176471, 1,
-0.1226505, 0.03034258, -0.4937139, 0, 1, 0.7254902, 1,
-0.1224951, 0.4746332, 0.4107791, 0, 1, 0.7294118, 1,
-0.1206611, 0.427051, 1.383217, 0, 1, 0.7372549, 1,
-0.1194589, -0.2460675, -4.9403, 0, 1, 0.7411765, 1,
-0.1163402, 1.168738, -0.7452865, 0, 1, 0.7490196, 1,
-0.1139824, 1.056753, -2.000823, 0, 1, 0.7529412, 1,
-0.1112205, -2.091876, -1.269814, 0, 1, 0.7607843, 1,
-0.1066929, -0.8718346, -3.633803, 0, 1, 0.7647059, 1,
-0.1060147, 1.209746, 1.013062, 0, 1, 0.772549, 1,
-0.1013541, -1.524194, -3.22075, 0, 1, 0.7764706, 1,
-0.1003359, 0.7395723, -0.4884226, 0, 1, 0.7843137, 1,
-0.09585814, -0.8563622, -4.379336, 0, 1, 0.7882353, 1,
-0.09447951, 1.393786, -0.1650628, 0, 1, 0.7960784, 1,
-0.09436107, 0.3497386, 0.06398898, 0, 1, 0.8039216, 1,
-0.09369693, -0.8260595, -3.0203, 0, 1, 0.8078431, 1,
-0.09228872, 0.1071674, -2.574038, 0, 1, 0.8156863, 1,
-0.09110209, 0.7991634, 0.1558623, 0, 1, 0.8196079, 1,
-0.08746561, 0.2405069, 0.6961313, 0, 1, 0.827451, 1,
-0.08229548, -0.3678912, -1.815472, 0, 1, 0.8313726, 1,
-0.07902887, 0.701734, -0.06280086, 0, 1, 0.8392157, 1,
-0.07636761, 0.8679099, -0.05023869, 0, 1, 0.8431373, 1,
-0.07556333, 0.09024643, -1.333889, 0, 1, 0.8509804, 1,
-0.07308659, -0.9550824, -2.553545, 0, 1, 0.854902, 1,
-0.07232003, 1.103509, -0.149427, 0, 1, 0.8627451, 1,
-0.06933644, 0.3152895, 0.4951307, 0, 1, 0.8666667, 1,
-0.06079553, 0.5069289, -1.80189, 0, 1, 0.8745098, 1,
-0.05989756, -1.127912, -3.799238, 0, 1, 0.8784314, 1,
-0.05715485, -0.3302948, -4.484739, 0, 1, 0.8862745, 1,
-0.0531978, 0.1806185, -0.2483858, 0, 1, 0.8901961, 1,
-0.050779, -0.8420204, -2.135404, 0, 1, 0.8980392, 1,
-0.03979548, -0.7427683, -1.961604, 0, 1, 0.9058824, 1,
-0.03753424, -0.3615631, -1.4873, 0, 1, 0.9098039, 1,
-0.03573678, 2.764467, -0.2819996, 0, 1, 0.9176471, 1,
-0.03490797, 0.9444296, -0.5069731, 0, 1, 0.9215686, 1,
-0.03271445, -1.060718, -3.747859, 0, 1, 0.9294118, 1,
-0.0324388, 0.5839875, -0.4397283, 0, 1, 0.9333333, 1,
-0.02734294, 2.463985, -0.6086972, 0, 1, 0.9411765, 1,
-0.0257774, -0.1901406, -4.184424, 0, 1, 0.945098, 1,
-0.01831852, 0.413181, -0.5581253, 0, 1, 0.9529412, 1,
-0.01645564, 1.081414, -0.8709954, 0, 1, 0.9568627, 1,
-0.01642299, -0.6687327, -3.418901, 0, 1, 0.9647059, 1,
-0.01486612, 2.042242, 0.7677099, 0, 1, 0.9686275, 1,
-0.0141196, 3.178757, 0.4630258, 0, 1, 0.9764706, 1,
-0.004843671, 0.06475258, -1.428451, 0, 1, 0.9803922, 1,
0.0008872813, -0.03722577, 1.799482, 0, 1, 0.9882353, 1,
0.002480911, 0.2888905, 2.36479, 0, 1, 0.9921569, 1,
0.002904223, 0.221745, -0.2846735, 0, 1, 1, 1,
0.003667793, -0.1514227, 3.777532, 0, 0.9921569, 1, 1,
0.004589305, 0.258903, 1.023422, 0, 0.9882353, 1, 1,
0.005435665, -1.615579, 4.646565, 0, 0.9803922, 1, 1,
0.006921571, -1.174331, 2.517208, 0, 0.9764706, 1, 1,
0.007057262, -0.2184707, 1.716622, 0, 0.9686275, 1, 1,
0.01037125, -0.07159521, 1.930161, 0, 0.9647059, 1, 1,
0.01336451, -0.681156, 2.508109, 0, 0.9568627, 1, 1,
0.01826388, -1.114989, 2.926056, 0, 0.9529412, 1, 1,
0.02893701, 0.6869411, -0.2864822, 0, 0.945098, 1, 1,
0.03256532, -0.7150272, 2.845087, 0, 0.9411765, 1, 1,
0.03307438, -0.1931805, 3.244553, 0, 0.9333333, 1, 1,
0.03648708, -0.4206253, 3.702843, 0, 0.9294118, 1, 1,
0.03825552, -0.5374051, 3.453562, 0, 0.9215686, 1, 1,
0.04171436, -0.7453864, 3.789684, 0, 0.9176471, 1, 1,
0.04235489, 0.5615133, -1.35774, 0, 0.9098039, 1, 1,
0.04392039, -0.9131273, 2.608798, 0, 0.9058824, 1, 1,
0.04396857, 0.01478556, 1.105866, 0, 0.8980392, 1, 1,
0.04848945, -0.08825818, 3.387111, 0, 0.8901961, 1, 1,
0.05154895, -1.388987, 2.779304, 0, 0.8862745, 1, 1,
0.05224911, 1.659086, -0.9308483, 0, 0.8784314, 1, 1,
0.05322243, -0.9656682, 3.073856, 0, 0.8745098, 1, 1,
0.0596525, 1.008158, 0.7377988, 0, 0.8666667, 1, 1,
0.06239024, 0.5418551, 1.896192, 0, 0.8627451, 1, 1,
0.06239728, 0.1394773, 0.8127498, 0, 0.854902, 1, 1,
0.06577028, -0.710031, 2.850957, 0, 0.8509804, 1, 1,
0.07083055, -1.266355, 1.888333, 0, 0.8431373, 1, 1,
0.07096776, 1.624287, 0.8062213, 0, 0.8392157, 1, 1,
0.07224553, -2.592795, 4.299507, 0, 0.8313726, 1, 1,
0.07243741, 2.103086, -1.490675, 0, 0.827451, 1, 1,
0.0775943, 0.04595512, 1.783758, 0, 0.8196079, 1, 1,
0.08063459, -0.1159125, 2.889928, 0, 0.8156863, 1, 1,
0.08197527, -0.7123788, 2.488688, 0, 0.8078431, 1, 1,
0.08537279, -1.325744, 0.9643778, 0, 0.8039216, 1, 1,
0.09233788, -1.475421, 4.08559, 0, 0.7960784, 1, 1,
0.0942735, -0.9269821, 3.881406, 0, 0.7882353, 1, 1,
0.09608213, 0.2309825, -0.3108164, 0, 0.7843137, 1, 1,
0.09742439, 1.51744, -1.311639, 0, 0.7764706, 1, 1,
0.09963019, -0.3754641, 1.961716, 0, 0.772549, 1, 1,
0.1021048, 0.5834582, 0.7350998, 0, 0.7647059, 1, 1,
0.1053812, -0.6574987, 3.273347, 0, 0.7607843, 1, 1,
0.1117184, -2.13901, 4.243882, 0, 0.7529412, 1, 1,
0.1148741, -0.2937118, 3.445504, 0, 0.7490196, 1, 1,
0.1187958, 0.269786, 0.7346762, 0, 0.7411765, 1, 1,
0.1190769, -0.2992091, 1.764515, 0, 0.7372549, 1, 1,
0.1203233, -1.374095, 2.732763, 0, 0.7294118, 1, 1,
0.1278873, -0.4213445, 1.568242, 0, 0.7254902, 1, 1,
0.1314937, -0.2859175, 3.816915, 0, 0.7176471, 1, 1,
0.132752, 0.3179233, -0.5609351, 0, 0.7137255, 1, 1,
0.1334175, 0.175901, 0.5029691, 0, 0.7058824, 1, 1,
0.1349273, 0.4885358, 0.8360639, 0, 0.6980392, 1, 1,
0.1369554, 0.293818, 2.104033, 0, 0.6941177, 1, 1,
0.1381239, -2.212264, 2.999624, 0, 0.6862745, 1, 1,
0.1402453, 0.03766818, 1.774367, 0, 0.682353, 1, 1,
0.1403836, 0.3787694, 1.136818, 0, 0.6745098, 1, 1,
0.1441723, -0.8609285, 4.797683, 0, 0.6705883, 1, 1,
0.1475855, 1.494296, -0.08649958, 0, 0.6627451, 1, 1,
0.148671, -0.7551615, 3.265916, 0, 0.6588235, 1, 1,
0.1505913, -1.374769, 3.373716, 0, 0.6509804, 1, 1,
0.1535614, -1.12734, 2.955627, 0, 0.6470588, 1, 1,
0.1555988, -1.313004, 3.143062, 0, 0.6392157, 1, 1,
0.1565816, 0.3937517, 0.4619718, 0, 0.6352941, 1, 1,
0.1585314, 0.7032906, -1.047128, 0, 0.627451, 1, 1,
0.1627671, -0.393965, 3.152858, 0, 0.6235294, 1, 1,
0.1658366, -0.840095, 2.805475, 0, 0.6156863, 1, 1,
0.1677772, -0.4951775, 3.273979, 0, 0.6117647, 1, 1,
0.1683504, -0.3284449, 3.146083, 0, 0.6039216, 1, 1,
0.168846, -0.8266761, 3.048227, 0, 0.5960785, 1, 1,
0.174868, 0.6917952, 0.2299431, 0, 0.5921569, 1, 1,
0.1802157, -0.5084806, 4.206772, 0, 0.5843138, 1, 1,
0.1840194, -1.317096, 4.433005, 0, 0.5803922, 1, 1,
0.190834, 0.05570585, 2.301022, 0, 0.572549, 1, 1,
0.1958311, -0.5446685, 2.335928, 0, 0.5686275, 1, 1,
0.198352, -0.9922174, 3.832451, 0, 0.5607843, 1, 1,
0.2001305, -2.486101, 4.012195, 0, 0.5568628, 1, 1,
0.203167, 0.8729347, -0.2311403, 0, 0.5490196, 1, 1,
0.2033321, -1.513795, 2.092092, 0, 0.5450981, 1, 1,
0.2087699, -0.04501029, 1.285124, 0, 0.5372549, 1, 1,
0.209231, -1.055769, 2.765535, 0, 0.5333334, 1, 1,
0.210196, -0.4060708, 3.655344, 0, 0.5254902, 1, 1,
0.2112785, -1.960104, 2.823014, 0, 0.5215687, 1, 1,
0.2152264, -1.222038, 2.759703, 0, 0.5137255, 1, 1,
0.2152779, 0.06573147, -0.4613965, 0, 0.509804, 1, 1,
0.2175826, -1.74361, 2.475441, 0, 0.5019608, 1, 1,
0.2183627, -0.5452006, 4.469316, 0, 0.4941176, 1, 1,
0.2220504, 1.608241, 0.04644486, 0, 0.4901961, 1, 1,
0.2223286, 0.6553462, -0.2580239, 0, 0.4823529, 1, 1,
0.2233491, -0.04369396, 0.843513, 0, 0.4784314, 1, 1,
0.2263087, 0.3013376, 0.8296988, 0, 0.4705882, 1, 1,
0.2296073, -1.51457, 3.183918, 0, 0.4666667, 1, 1,
0.2301511, 0.7385054, 1.601177, 0, 0.4588235, 1, 1,
0.2362646, 1.983485, -1.287072, 0, 0.454902, 1, 1,
0.2363135, -0.3743653, 2.32916, 0, 0.4470588, 1, 1,
0.2378626, 1.671126, -0.1061918, 0, 0.4431373, 1, 1,
0.2405654, -0.9265951, 3.875047, 0, 0.4352941, 1, 1,
0.242577, -1.783689, 3.369771, 0, 0.4313726, 1, 1,
0.2430842, -0.08669706, 1.504622, 0, 0.4235294, 1, 1,
0.2452247, 0.5308822, 0.3837977, 0, 0.4196078, 1, 1,
0.2458466, 1.143844, -0.2601026, 0, 0.4117647, 1, 1,
0.248573, 0.6193036, 0.2201734, 0, 0.4078431, 1, 1,
0.2497165, 0.01091182, 1.630055, 0, 0.4, 1, 1,
0.2501397, -0.2615848, 2.869304, 0, 0.3921569, 1, 1,
0.2555138, -1.130835, 2.715156, 0, 0.3882353, 1, 1,
0.256811, 0.08658502, 1.183718, 0, 0.3803922, 1, 1,
0.2592076, 1.27866, -0.7149072, 0, 0.3764706, 1, 1,
0.2616561, -0.3268702, 3.0437, 0, 0.3686275, 1, 1,
0.2659984, 0.00671559, 0.0310306, 0, 0.3647059, 1, 1,
0.2805112, 0.5842637, -0.003429222, 0, 0.3568628, 1, 1,
0.2836273, 1.703969, -0.8455457, 0, 0.3529412, 1, 1,
0.2837985, 2.556057, 0.5775591, 0, 0.345098, 1, 1,
0.285975, 1.485041, -1.133085, 0, 0.3411765, 1, 1,
0.2876554, -1.720403, 4.332853, 0, 0.3333333, 1, 1,
0.2965457, 1.585309, 1.086182, 0, 0.3294118, 1, 1,
0.2973848, -0.6887166, 1.654849, 0, 0.3215686, 1, 1,
0.3040698, -1.082974, 3.06279, 0, 0.3176471, 1, 1,
0.3055543, 0.6173149, 1.559219, 0, 0.3098039, 1, 1,
0.3078631, -0.6801735, 0.9452129, 0, 0.3058824, 1, 1,
0.3108643, 1.50034, 0.9528859, 0, 0.2980392, 1, 1,
0.3120853, 0.4800023, 0.8621166, 0, 0.2901961, 1, 1,
0.3141872, -0.8117791, 2.924445, 0, 0.2862745, 1, 1,
0.3166259, -0.7905997, 2.050128, 0, 0.2784314, 1, 1,
0.3200487, -0.0307479, 0.7849882, 0, 0.2745098, 1, 1,
0.3267024, -0.1832822, 2.64239, 0, 0.2666667, 1, 1,
0.3286557, 1.011984, 0.3699344, 0, 0.2627451, 1, 1,
0.3337682, 0.9487548, 0.7946844, 0, 0.254902, 1, 1,
0.3338497, 0.2988658, 0.886654, 0, 0.2509804, 1, 1,
0.3346514, 1.303812, 0.4839043, 0, 0.2431373, 1, 1,
0.33544, -0.06808446, 3.593012, 0, 0.2392157, 1, 1,
0.3409367, -0.2891384, 2.762858, 0, 0.2313726, 1, 1,
0.3410799, -0.3406114, 0.635823, 0, 0.227451, 1, 1,
0.3422191, 0.5457117, 0.3061273, 0, 0.2196078, 1, 1,
0.3445432, 0.2916321, 1.154549, 0, 0.2156863, 1, 1,
0.3449429, 0.2572857, 0.001040439, 0, 0.2078431, 1, 1,
0.3455029, 0.9444355, 0.1615924, 0, 0.2039216, 1, 1,
0.3472033, -0.8524215, 1.811906, 0, 0.1960784, 1, 1,
0.3506959, -1.039184, 3.14572, 0, 0.1882353, 1, 1,
0.3590132, -0.5276373, 1.696074, 0, 0.1843137, 1, 1,
0.3625591, 0.5435193, 1.51589, 0, 0.1764706, 1, 1,
0.3672077, 0.075068, 1.555854, 0, 0.172549, 1, 1,
0.3677928, -1.010404, 2.526762, 0, 0.1647059, 1, 1,
0.3679185, -0.5117626, 2.617034, 0, 0.1607843, 1, 1,
0.3679957, 1.45367, 0.7354499, 0, 0.1529412, 1, 1,
0.3720183, 0.1793056, 1.957096, 0, 0.1490196, 1, 1,
0.3773417, 0.2933004, -1.073368, 0, 0.1411765, 1, 1,
0.3820995, 0.1009734, 1.126932, 0, 0.1372549, 1, 1,
0.3853533, -0.9768819, 3.838928, 0, 0.1294118, 1, 1,
0.3863029, -2.188955, 2.240877, 0, 0.1254902, 1, 1,
0.3983119, -0.6878679, 2.920455, 0, 0.1176471, 1, 1,
0.4033578, 1.547256, 0.6014996, 0, 0.1137255, 1, 1,
0.4035757, 1.173508, 0.5680404, 0, 0.1058824, 1, 1,
0.4048817, 0.686686, -0.2948145, 0, 0.09803922, 1, 1,
0.4053175, -1.593833, 3.340317, 0, 0.09411765, 1, 1,
0.4053462, -1.104263, 2.575055, 0, 0.08627451, 1, 1,
0.4072723, 1.329665, -0.3994715, 0, 0.08235294, 1, 1,
0.4073237, 0.4051844, -0.3647214, 0, 0.07450981, 1, 1,
0.4096583, 0.1922577, 0.8575467, 0, 0.07058824, 1, 1,
0.4104846, 1.570938, -0.2601634, 0, 0.0627451, 1, 1,
0.4125844, 0.1003202, 3.009747, 0, 0.05882353, 1, 1,
0.4128477, 1.251063, -0.07089639, 0, 0.05098039, 1, 1,
0.4133553, -1.674218, 3.171643, 0, 0.04705882, 1, 1,
0.414225, -0.1182692, 1.545237, 0, 0.03921569, 1, 1,
0.4150586, -1.16083, 1.979294, 0, 0.03529412, 1, 1,
0.4154874, -0.2217418, 0.9651406, 0, 0.02745098, 1, 1,
0.4161155, 2.409647, -0.2280293, 0, 0.02352941, 1, 1,
0.4194603, 0.8928159, 0.03549425, 0, 0.01568628, 1, 1,
0.4222618, 3.097494, 1.956348, 0, 0.01176471, 1, 1,
0.4258436, -0.9003354, 1.198773, 0, 0.003921569, 1, 1,
0.4261297, -2.112822, 2.456884, 0.003921569, 0, 1, 1,
0.4284422, 0.6160067, 1.688852, 0.007843138, 0, 1, 1,
0.4284783, -0.05654741, 2.784703, 0.01568628, 0, 1, 1,
0.4330949, -1.123932, 3.586624, 0.01960784, 0, 1, 1,
0.4355653, 1.95335, 0.8005854, 0.02745098, 0, 1, 1,
0.4377396, -0.6806055, 2.352731, 0.03137255, 0, 1, 1,
0.4380082, 0.7054451, -0.8261868, 0.03921569, 0, 1, 1,
0.4384332, -0.5210134, 1.898811, 0.04313726, 0, 1, 1,
0.4396268, 0.2162331, -0.2955526, 0.05098039, 0, 1, 1,
0.443605, -0.550145, 0.8551846, 0.05490196, 0, 1, 1,
0.4457763, -1.832301, 2.00204, 0.0627451, 0, 1, 1,
0.4500492, 1.625513, -0.2334739, 0.06666667, 0, 1, 1,
0.4507252, 1.425222, -0.587689, 0.07450981, 0, 1, 1,
0.4517012, -0.8352547, 2.148112, 0.07843138, 0, 1, 1,
0.4537492, -0.9167978, 2.301559, 0.08627451, 0, 1, 1,
0.4540102, -1.25304, 1.71783, 0.09019608, 0, 1, 1,
0.4567364, -0.3215387, 3.275706, 0.09803922, 0, 1, 1,
0.4596749, -0.04388002, 1.921685, 0.1058824, 0, 1, 1,
0.4624645, -0.5832044, 1.726014, 0.1098039, 0, 1, 1,
0.4634195, -0.2730671, 1.176788, 0.1176471, 0, 1, 1,
0.4671622, -0.06757376, 2.95996, 0.1215686, 0, 1, 1,
0.4691059, -0.6499157, 2.902278, 0.1294118, 0, 1, 1,
0.4740565, -0.2219952, 0.1677881, 0.1333333, 0, 1, 1,
0.481871, -0.2948942, 1.478413, 0.1411765, 0, 1, 1,
0.4848995, -0.04551125, 1.858349, 0.145098, 0, 1, 1,
0.4867228, 2.34585, 1.140748, 0.1529412, 0, 1, 1,
0.4877336, 0.9611789, -0.2088175, 0.1568628, 0, 1, 1,
0.4878186, -1.754762, 0.4367073, 0.1647059, 0, 1, 1,
0.5040535, -0.6666851, 1.712198, 0.1686275, 0, 1, 1,
0.5041122, 0.5021278, 2.092809, 0.1764706, 0, 1, 1,
0.5055527, 0.2972346, 0.833989, 0.1803922, 0, 1, 1,
0.5093274, -0.6206017, 3.484192, 0.1882353, 0, 1, 1,
0.5137064, -2.2635, 2.498977, 0.1921569, 0, 1, 1,
0.5151046, 1.161184, -1.01897, 0.2, 0, 1, 1,
0.5190483, -0.1221785, 2.616314, 0.2078431, 0, 1, 1,
0.5219064, 1.061685, -0.3991327, 0.2117647, 0, 1, 1,
0.5224603, 0.3952443, 0.6670683, 0.2196078, 0, 1, 1,
0.5225785, 0.2177718, 3.80757, 0.2235294, 0, 1, 1,
0.5274, -0.4447552, 2.693401, 0.2313726, 0, 1, 1,
0.5281715, 1.022812, 2.892933, 0.2352941, 0, 1, 1,
0.5282168, -0.07929181, 3.930251, 0.2431373, 0, 1, 1,
0.5334896, -0.5050726, 2.575301, 0.2470588, 0, 1, 1,
0.5370747, -0.3185458, 0.9984555, 0.254902, 0, 1, 1,
0.542527, 0.04454434, 2.36459, 0.2588235, 0, 1, 1,
0.5447456, -0.3070743, -0.2524795, 0.2666667, 0, 1, 1,
0.5458598, -0.8294067, 3.244916, 0.2705882, 0, 1, 1,
0.5497519, -0.62931, 2.255373, 0.2784314, 0, 1, 1,
0.5515146, 0.6047123, 1.885259, 0.282353, 0, 1, 1,
0.5523679, 0.8677883, 0.7720241, 0.2901961, 0, 1, 1,
0.5533558, 0.4467071, -0.6163268, 0.2941177, 0, 1, 1,
0.5601486, 1.492664, 0.7789807, 0.3019608, 0, 1, 1,
0.5631207, -0.03453177, 1.706253, 0.3098039, 0, 1, 1,
0.5642111, 0.000972293, 1.055609, 0.3137255, 0, 1, 1,
0.564449, -0.3007054, -0.6650754, 0.3215686, 0, 1, 1,
0.5658662, -1.008371, 2.380558, 0.3254902, 0, 1, 1,
0.56627, 1.384773, 2.029111, 0.3333333, 0, 1, 1,
0.5756789, -0.9880505, 2.852563, 0.3372549, 0, 1, 1,
0.5793569, 1.280533, -1.037328, 0.345098, 0, 1, 1,
0.5900607, -1.16724, 1.010745, 0.3490196, 0, 1, 1,
0.5904185, -0.3641934, 5.456718, 0.3568628, 0, 1, 1,
0.5962338, 0.2541621, 0.9725193, 0.3607843, 0, 1, 1,
0.5983519, 2.160909, -0.2432164, 0.3686275, 0, 1, 1,
0.5994446, 0.1625312, 2.114582, 0.372549, 0, 1, 1,
0.6079483, -1.959501, 0.5617465, 0.3803922, 0, 1, 1,
0.617637, 1.706309, 0.5848431, 0.3843137, 0, 1, 1,
0.6215234, -0.5238125, 4.151456, 0.3921569, 0, 1, 1,
0.6216342, 0.1805477, 3.334987, 0.3960784, 0, 1, 1,
0.6248701, 1.094661, 0.559922, 0.4039216, 0, 1, 1,
0.6328664, 0.167896, -0.9703907, 0.4117647, 0, 1, 1,
0.6337885, -0.2316181, 2.193083, 0.4156863, 0, 1, 1,
0.6367775, 0.263024, 1.634334, 0.4235294, 0, 1, 1,
0.6380039, 0.1166958, 2.301863, 0.427451, 0, 1, 1,
0.6418406, -0.2203468, 2.458092, 0.4352941, 0, 1, 1,
0.6494802, -0.7300224, 3.842627, 0.4392157, 0, 1, 1,
0.6533453, 2.039713, 0.4934955, 0.4470588, 0, 1, 1,
0.6611866, 1.707784, 0.1254733, 0.4509804, 0, 1, 1,
0.663258, 1.075415, 1.256995, 0.4588235, 0, 1, 1,
0.6713445, 0.1229571, -0.2353183, 0.4627451, 0, 1, 1,
0.6727008, 0.01060687, 1.878812, 0.4705882, 0, 1, 1,
0.6727462, -1.143795, 1.475055, 0.4745098, 0, 1, 1,
0.6760387, -1.235109, 1.773697, 0.4823529, 0, 1, 1,
0.6771543, -0.4580596, 1.052933, 0.4862745, 0, 1, 1,
0.6784404, 1.573853, 0.6580901, 0.4941176, 0, 1, 1,
0.6842943, -0.5726566, 3.119754, 0.5019608, 0, 1, 1,
0.6932772, 0.1719143, 2.388274, 0.5058824, 0, 1, 1,
0.6946092, -0.07319201, 1.820689, 0.5137255, 0, 1, 1,
0.7055519, 0.7139644, 1.03022, 0.5176471, 0, 1, 1,
0.7069505, -0.4603309, 3.524477, 0.5254902, 0, 1, 1,
0.7163692, -0.1965021, 1.345262, 0.5294118, 0, 1, 1,
0.7251445, -0.4343513, 2.975401, 0.5372549, 0, 1, 1,
0.7258248, -0.3894486, 1.920704, 0.5411765, 0, 1, 1,
0.7269925, -2.109052, 0.6640103, 0.5490196, 0, 1, 1,
0.7318851, 0.3195224, 0.9599856, 0.5529412, 0, 1, 1,
0.7336055, 0.2959954, -0.5168896, 0.5607843, 0, 1, 1,
0.7344727, -1.051485, 1.197894, 0.5647059, 0, 1, 1,
0.7380038, -0.1874747, 1.280054, 0.572549, 0, 1, 1,
0.746828, -2.201584, 3.138503, 0.5764706, 0, 1, 1,
0.7487204, 0.07570173, 2.232654, 0.5843138, 0, 1, 1,
0.7515579, 1.379415, -0.650106, 0.5882353, 0, 1, 1,
0.7519605, -0.5001476, 1.277317, 0.5960785, 0, 1, 1,
0.7519742, -0.5900793, 1.892662, 0.6039216, 0, 1, 1,
0.7559147, -1.604393, 2.312178, 0.6078432, 0, 1, 1,
0.7575287, -0.1586996, 1.864244, 0.6156863, 0, 1, 1,
0.7586464, 1.893897, -0.4053133, 0.6196079, 0, 1, 1,
0.7606097, -0.7187545, 1.544698, 0.627451, 0, 1, 1,
0.7606105, -0.485219, 0.2452839, 0.6313726, 0, 1, 1,
0.7633326, -0.6936185, 1.415966, 0.6392157, 0, 1, 1,
0.7730328, 1.363555, 1.506736, 0.6431373, 0, 1, 1,
0.7771299, -0.9753126, 2.279132, 0.6509804, 0, 1, 1,
0.7783638, 0.9252864, 0.8959191, 0.654902, 0, 1, 1,
0.7906944, 0.6131079, 0.1500361, 0.6627451, 0, 1, 1,
0.7919548, 0.8522281, 0.8129788, 0.6666667, 0, 1, 1,
0.7964658, -1.467597, 1.840297, 0.6745098, 0, 1, 1,
0.7994586, -1.031478, 1.349173, 0.6784314, 0, 1, 1,
0.8022483, 0.5969993, 1.528165, 0.6862745, 0, 1, 1,
0.8041307, -0.1634895, 1.947888, 0.6901961, 0, 1, 1,
0.8043138, -0.5395668, 2.536596, 0.6980392, 0, 1, 1,
0.8076062, 0.9913673, 0.2876078, 0.7058824, 0, 1, 1,
0.8080081, -0.9284664, 2.518589, 0.7098039, 0, 1, 1,
0.8081592, -0.3870884, 1.081406, 0.7176471, 0, 1, 1,
0.8081716, 0.553023, 1.793529, 0.7215686, 0, 1, 1,
0.8094018, 0.949232, 1.893114, 0.7294118, 0, 1, 1,
0.8111285, 0.1191986, -0.06472492, 0.7333333, 0, 1, 1,
0.813836, 0.4072134, 1.603635, 0.7411765, 0, 1, 1,
0.8240883, -0.7886444, 2.593494, 0.7450981, 0, 1, 1,
0.8269824, -0.09559934, 1.573221, 0.7529412, 0, 1, 1,
0.8285317, 1.812325, 0.3380553, 0.7568628, 0, 1, 1,
0.8454195, 0.7325186, 1.61063, 0.7647059, 0, 1, 1,
0.8465956, -0.01745796, 2.05919, 0.7686275, 0, 1, 1,
0.8479514, 1.092749, -0.4561513, 0.7764706, 0, 1, 1,
0.8506454, -0.6207405, 1.94793, 0.7803922, 0, 1, 1,
0.8526018, -1.681788, 2.009998, 0.7882353, 0, 1, 1,
0.8672431, 0.4478271, 2.400267, 0.7921569, 0, 1, 1,
0.8782065, -1.945906, 3.842664, 0.8, 0, 1, 1,
0.8884338, 0.02423459, 1.136641, 0.8078431, 0, 1, 1,
0.8895981, -0.219421, 3.333442, 0.8117647, 0, 1, 1,
0.8911955, -0.1158416, 3.944174, 0.8196079, 0, 1, 1,
0.8923628, 0.1299516, 2.437623, 0.8235294, 0, 1, 1,
0.9011685, 0.7815769, 0.5926684, 0.8313726, 0, 1, 1,
0.9080555, 0.4028356, 1.325409, 0.8352941, 0, 1, 1,
0.9085693, -0.5697741, 0.08710071, 0.8431373, 0, 1, 1,
0.9171774, -1.086704, 1.363368, 0.8470588, 0, 1, 1,
0.9210467, -0.3207243, 2.58347, 0.854902, 0, 1, 1,
0.9252471, -1.184286, 2.050185, 0.8588235, 0, 1, 1,
0.9312139, -0.6161425, 1.24018, 0.8666667, 0, 1, 1,
0.9337589, -0.6700122, 1.711537, 0.8705882, 0, 1, 1,
0.9353852, -0.1158764, 2.323427, 0.8784314, 0, 1, 1,
0.9357918, -0.02291236, 3.245862, 0.8823529, 0, 1, 1,
0.9369958, 0.8613684, 0.007680089, 0.8901961, 0, 1, 1,
0.9534029, 1.30553, 1.407195, 0.8941177, 0, 1, 1,
0.9536871, -1.211551, 2.413134, 0.9019608, 0, 1, 1,
0.9558468, 0.8079038, 0.3274593, 0.9098039, 0, 1, 1,
0.9561278, -0.66526, 2.080867, 0.9137255, 0, 1, 1,
0.9608693, 0.71658, 0.1716375, 0.9215686, 0, 1, 1,
0.9610991, 0.7649428, 2.182745, 0.9254902, 0, 1, 1,
0.9641213, -0.4285478, 2.992465, 0.9333333, 0, 1, 1,
0.9653674, -0.2798536, 1.646927, 0.9372549, 0, 1, 1,
0.9789668, 0.03570842, 3.26805, 0.945098, 0, 1, 1,
0.9799505, 1.891029, 1.289228, 0.9490196, 0, 1, 1,
0.9800443, -0.3561344, 2.30048, 0.9568627, 0, 1, 1,
0.9821333, -1.032815, 2.194403, 0.9607843, 0, 1, 1,
0.9842181, 0.2595129, 0.4587993, 0.9686275, 0, 1, 1,
0.9927394, 0.3380111, 0.7389693, 0.972549, 0, 1, 1,
0.9948793, 0.3585997, 1.151799, 0.9803922, 0, 1, 1,
0.9969034, 0.4226658, 1.028969, 0.9843137, 0, 1, 1,
1.007197, -0.9845394, 2.643219, 0.9921569, 0, 1, 1,
1.01084, 0.3114721, 0.5181205, 0.9960784, 0, 1, 1,
1.012298, -0.6796876, 1.801843, 1, 0, 0.9960784, 1,
1.014942, 0.7970646, -0.409086, 1, 0, 0.9882353, 1,
1.018113, -2.351362, 3.193386, 1, 0, 0.9843137, 1,
1.018867, 0.5152257, 1.239553, 1, 0, 0.9764706, 1,
1.021194, -0.8265973, 2.580361, 1, 0, 0.972549, 1,
1.0252, -0.1118664, 0.331482, 1, 0, 0.9647059, 1,
1.026938, -1.086789, 2.296764, 1, 0, 0.9607843, 1,
1.042246, -0.4764659, 2.553733, 1, 0, 0.9529412, 1,
1.04277, -0.6289887, 0.9674802, 1, 0, 0.9490196, 1,
1.042967, -0.760159, 2.244836, 1, 0, 0.9411765, 1,
1.045459, 0.09908994, 1.887723, 1, 0, 0.9372549, 1,
1.050689, -0.6311905, -0.3046817, 1, 0, 0.9294118, 1,
1.054867, -0.06969441, 0.681721, 1, 0, 0.9254902, 1,
1.055698, -0.4703407, 2.789135, 1, 0, 0.9176471, 1,
1.065325, -0.009293471, 0.8515184, 1, 0, 0.9137255, 1,
1.0682, -1.623075, 2.842497, 1, 0, 0.9058824, 1,
1.071279, -2.457365, 3.317569, 1, 0, 0.9019608, 1,
1.0763, -1.664684, 1.892302, 1, 0, 0.8941177, 1,
1.076592, -0.2372184, 1.240716, 1, 0, 0.8862745, 1,
1.077684, -1.987063, 1.352133, 1, 0, 0.8823529, 1,
1.079931, -1.212813, 1.183063, 1, 0, 0.8745098, 1,
1.082829, -0.3397816, 1.291586, 1, 0, 0.8705882, 1,
1.085655, 0.5377355, 2.403409, 1, 0, 0.8627451, 1,
1.092332, 0.6083872, 2.807873, 1, 0, 0.8588235, 1,
1.092369, 0.1175758, 0.1336149, 1, 0, 0.8509804, 1,
1.095652, -1.023214, 4.068864, 1, 0, 0.8470588, 1,
1.096681, 1.505729, 1.002983, 1, 0, 0.8392157, 1,
1.104665, -0.2854411, 3.437469, 1, 0, 0.8352941, 1,
1.106496, 0.7989104, 0.01947779, 1, 0, 0.827451, 1,
1.10674, -0.09606393, 0.6507199, 1, 0, 0.8235294, 1,
1.110119, 1.187652, -0.03809147, 1, 0, 0.8156863, 1,
1.118435, -1.98625, 1.311156, 1, 0, 0.8117647, 1,
1.124274, 1.119362, 2.306902, 1, 0, 0.8039216, 1,
1.125257, -1.684523, 1.332611, 1, 0, 0.7960784, 1,
1.128348, 1.020413, 1.340939, 1, 0, 0.7921569, 1,
1.129296, 0.4595071, -0.1212105, 1, 0, 0.7843137, 1,
1.132254, -1.224812, 3.423444, 1, 0, 0.7803922, 1,
1.141617, -0.3838123, 1.529157, 1, 0, 0.772549, 1,
1.149283, -0.07682965, 0.5900109, 1, 0, 0.7686275, 1,
1.150164, -0.1289499, 3.537092, 1, 0, 0.7607843, 1,
1.150365, -0.315628, 3.186955, 1, 0, 0.7568628, 1,
1.15153, 1.275787, -0.6310408, 1, 0, 0.7490196, 1,
1.152274, 1.486103, 0.3112312, 1, 0, 0.7450981, 1,
1.163434, 0.321519, 1.982782, 1, 0, 0.7372549, 1,
1.165535, -1.113232, 0.6242341, 1, 0, 0.7333333, 1,
1.169412, -2.17293, 2.574492, 1, 0, 0.7254902, 1,
1.176401, -1.17799, 1.91914, 1, 0, 0.7215686, 1,
1.178757, 0.251934, 0.3291796, 1, 0, 0.7137255, 1,
1.179411, 2.049743, -0.585532, 1, 0, 0.7098039, 1,
1.180333, 1.44891, 0.1122018, 1, 0, 0.7019608, 1,
1.181029, 1.598119, 1.25078, 1, 0, 0.6941177, 1,
1.188021, -0.4328664, -0.9671981, 1, 0, 0.6901961, 1,
1.193029, -2.385582, 2.100707, 1, 0, 0.682353, 1,
1.201363, 0.2164981, 3.344431, 1, 0, 0.6784314, 1,
1.208406, 1.592558, 0.9061066, 1, 0, 0.6705883, 1,
1.214308, -1.250409, 3.567176, 1, 0, 0.6666667, 1,
1.222011, -1.042364, 1.499045, 1, 0, 0.6588235, 1,
1.227741, -1.464402, 3.00243, 1, 0, 0.654902, 1,
1.228505, -0.2467248, 1.891992, 1, 0, 0.6470588, 1,
1.229632, 0.0983057, 1.343526, 1, 0, 0.6431373, 1,
1.23284, -2.214748, 2.394321, 1, 0, 0.6352941, 1,
1.2379, 0.4607651, 0.6091092, 1, 0, 0.6313726, 1,
1.25228, 0.9602641, 1.511531, 1, 0, 0.6235294, 1,
1.259087, 1.058357, 2.557772, 1, 0, 0.6196079, 1,
1.261346, -1.603601, 2.245853, 1, 0, 0.6117647, 1,
1.278312, -0.05260123, 3.093652, 1, 0, 0.6078432, 1,
1.288788, -0.5411722, 1.612445, 1, 0, 0.6, 1,
1.294883, 0.4763704, 0.1950145, 1, 0, 0.5921569, 1,
1.296997, -0.9039651, 0.4974796, 1, 0, 0.5882353, 1,
1.311257, -1.241455, 4.435723, 1, 0, 0.5803922, 1,
1.313774, 0.4037073, 1.669701, 1, 0, 0.5764706, 1,
1.314094, -0.1138181, 1.443175, 1, 0, 0.5686275, 1,
1.328535, 0.7974102, 1.65199, 1, 0, 0.5647059, 1,
1.346882, 0.4194297, -0.1268277, 1, 0, 0.5568628, 1,
1.355388, 0.01308651, 1.980922, 1, 0, 0.5529412, 1,
1.363092, -1.242335, 1.023401, 1, 0, 0.5450981, 1,
1.36849, -1.460873, 0.2727991, 1, 0, 0.5411765, 1,
1.371186, -0.6559064, 3.110219, 1, 0, 0.5333334, 1,
1.377717, -2.140528, 3.241108, 1, 0, 0.5294118, 1,
1.382763, -1.375725, 0.7623152, 1, 0, 0.5215687, 1,
1.386824, -1.569396, 3.890109, 1, 0, 0.5176471, 1,
1.394619, -0.6028131, 2.34504, 1, 0, 0.509804, 1,
1.395463, 0.7376867, 0.6141216, 1, 0, 0.5058824, 1,
1.40272, -0.02220278, 1.348201, 1, 0, 0.4980392, 1,
1.414695, -1.882673, 1.453165, 1, 0, 0.4901961, 1,
1.42189, -0.7400441, 3.718014, 1, 0, 0.4862745, 1,
1.422711, 0.6351575, 0.1744636, 1, 0, 0.4784314, 1,
1.423177, 0.1685158, 1.122004, 1, 0, 0.4745098, 1,
1.424136, 1.193927, 0.8540854, 1, 0, 0.4666667, 1,
1.44556, -0.09690485, 2.539399, 1, 0, 0.4627451, 1,
1.470433, -0.3468189, -0.2896708, 1, 0, 0.454902, 1,
1.48797, -0.06590482, 1.579195, 1, 0, 0.4509804, 1,
1.504475, -0.06789259, 0.6922622, 1, 0, 0.4431373, 1,
1.51423, -0.2452423, 3.137843, 1, 0, 0.4392157, 1,
1.52779, 1.450511, 1.684527, 1, 0, 0.4313726, 1,
1.53159, -0.6472546, 3.371238, 1, 0, 0.427451, 1,
1.555383, 0.2068151, 0.8783787, 1, 0, 0.4196078, 1,
1.559599, 0.7811671, 1.641464, 1, 0, 0.4156863, 1,
1.561635, 0.3804774, 0.4763177, 1, 0, 0.4078431, 1,
1.565332, 0.3722205, 1.365559, 1, 0, 0.4039216, 1,
1.567605, 0.602474, 0.1659648, 1, 0, 0.3960784, 1,
1.567641, -1.223308, 4.332013, 1, 0, 0.3882353, 1,
1.571462, 0.09370326, 0.732172, 1, 0, 0.3843137, 1,
1.586153, 0.649057, 0.2143211, 1, 0, 0.3764706, 1,
1.594304, -0.2766832, 1.504524, 1, 0, 0.372549, 1,
1.622042, 0.2560169, 2.800425, 1, 0, 0.3647059, 1,
1.624682, 0.323382, 0.7362688, 1, 0, 0.3607843, 1,
1.630093, 0.4421168, 1.803676, 1, 0, 0.3529412, 1,
1.631663, -0.6242926, 2.711578, 1, 0, 0.3490196, 1,
1.639556, -0.1806767, 0.009888962, 1, 0, 0.3411765, 1,
1.646259, 0.3477151, 2.144148, 1, 0, 0.3372549, 1,
1.651118, 0.4697322, -0.00365805, 1, 0, 0.3294118, 1,
1.653421, -2.903727, 1.009961, 1, 0, 0.3254902, 1,
1.663942, 0.1814761, 1.486527, 1, 0, 0.3176471, 1,
1.685078, -0.4915019, 2.395802, 1, 0, 0.3137255, 1,
1.708737, 0.9586564, -0.6580125, 1, 0, 0.3058824, 1,
1.711953, -1.026157, 1.129166, 1, 0, 0.2980392, 1,
1.715984, 0.03866933, 1.855197, 1, 0, 0.2941177, 1,
1.735598, 0.3223925, 1.586043, 1, 0, 0.2862745, 1,
1.755062, 0.3828404, 0.4189162, 1, 0, 0.282353, 1,
1.769833, -0.3970643, 1.866064, 1, 0, 0.2745098, 1,
1.772035, -0.5712645, 1.125613, 1, 0, 0.2705882, 1,
1.77466, -0.4269339, 1.637406, 1, 0, 0.2627451, 1,
1.776877, 2.341306, 0.7474723, 1, 0, 0.2588235, 1,
1.78624, -0.06437507, 2.27495, 1, 0, 0.2509804, 1,
1.793499, 1.655686, 0.5498039, 1, 0, 0.2470588, 1,
1.795533, -0.1045268, 2.448724, 1, 0, 0.2392157, 1,
1.813279, -0.1882449, 1.187951, 1, 0, 0.2352941, 1,
1.818764, 1.767861, 0.5855513, 1, 0, 0.227451, 1,
1.829761, 0.2080716, 3.173401, 1, 0, 0.2235294, 1,
1.830347, -1.10461, 1.727314, 1, 0, 0.2156863, 1,
1.834424, 0.9381203, 1.3633, 1, 0, 0.2117647, 1,
1.8377, -1.101264, 0.450074, 1, 0, 0.2039216, 1,
1.840526, 0.2793214, 2.111248, 1, 0, 0.1960784, 1,
1.899501, -1.289449, 3.832927, 1, 0, 0.1921569, 1,
1.908165, -1.415474, 3.466536, 1, 0, 0.1843137, 1,
1.915027, 0.2249176, 1.610258, 1, 0, 0.1803922, 1,
1.927093, -0.5267776, 2.587935, 1, 0, 0.172549, 1,
1.945625, 0.729131, 1.915696, 1, 0, 0.1686275, 1,
2.021114, -1.62222, 3.066435, 1, 0, 0.1607843, 1,
2.024845, 0.8918946, 1.606832, 1, 0, 0.1568628, 1,
2.04303, 2.459678, -0.2544325, 1, 0, 0.1490196, 1,
2.05375, 0.5035997, 0.1300405, 1, 0, 0.145098, 1,
2.073636, 0.1027754, 1.186157, 1, 0, 0.1372549, 1,
2.088925, 1.971722, -0.06430183, 1, 0, 0.1333333, 1,
2.089694, 0.3894793, 0.3880538, 1, 0, 0.1254902, 1,
2.119544, 0.1680178, 0.7172394, 1, 0, 0.1215686, 1,
2.193418, -1.414949, 0.5922315, 1, 0, 0.1137255, 1,
2.197616, 1.87124, 1.491758, 1, 0, 0.1098039, 1,
2.241573, 0.254536, 2.494012, 1, 0, 0.1019608, 1,
2.249683, -1.145199, 3.050905, 1, 0, 0.09411765, 1,
2.25035, 0.3614394, 0.8063942, 1, 0, 0.09019608, 1,
2.253256, -1.045903, 1.674446, 1, 0, 0.08235294, 1,
2.334107, -0.3028082, 1.037219, 1, 0, 0.07843138, 1,
2.372865, -0.7592976, 0.1361795, 1, 0, 0.07058824, 1,
2.429574, -1.137096, 3.213416, 1, 0, 0.06666667, 1,
2.439681, 2.09952, -0.3961285, 1, 0, 0.05882353, 1,
2.511104, -0.01642973, 0.2604946, 1, 0, 0.05490196, 1,
2.559326, 0.1890986, 1.59384, 1, 0, 0.04705882, 1,
2.627772, -1.597329, 2.054922, 1, 0, 0.04313726, 1,
2.661721, -1.729452, 2.527699, 1, 0, 0.03529412, 1,
2.829303, -0.4227042, 1.643137, 1, 0, 0.03137255, 1,
2.932061, 0.5223624, 0.5580982, 1, 0, 0.02352941, 1,
3.008942, -1.065314, 2.321012, 1, 0, 0.01960784, 1,
3.309182, -0.04905817, 2.987398, 1, 0, 0.01176471, 1,
3.427796, -0.8445618, 1.278951, 1, 0, 0.007843138, 1
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
-0.01373661, -3.998497, -7.433382, 0, -0.5, 0.5, 0.5,
-0.01373661, -3.998497, -7.433382, 1, -0.5, 0.5, 0.5,
-0.01373661, -3.998497, -7.433382, 1, 1.5, 0.5, 0.5,
-0.01373661, -3.998497, -7.433382, 0, 1.5, 0.5, 0.5
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
-4.621949, 0.110243, -7.433382, 0, -0.5, 0.5, 0.5,
-4.621949, 0.110243, -7.433382, 1, -0.5, 0.5, 0.5,
-4.621949, 0.110243, -7.433382, 1, 1.5, 0.5, 0.5,
-4.621949, 0.110243, -7.433382, 0, 1.5, 0.5, 0.5
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
-4.621949, -3.998497, -0.05422664, 0, -0.5, 0.5, 0.5,
-4.621949, -3.998497, -0.05422664, 1, -0.5, 0.5, 0.5,
-4.621949, -3.998497, -0.05422664, 1, 1.5, 0.5, 0.5,
-4.621949, -3.998497, -0.05422664, 0, 1.5, 0.5, 0.5
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
-3, -3.050327, -5.7305,
3, -3.050327, -5.7305,
-3, -3.050327, -5.7305,
-3, -3.208355, -6.014313,
-2, -3.050327, -5.7305,
-2, -3.208355, -6.014313,
-1, -3.050327, -5.7305,
-1, -3.208355, -6.014313,
0, -3.050327, -5.7305,
0, -3.208355, -6.014313,
1, -3.050327, -5.7305,
1, -3.208355, -6.014313,
2, -3.050327, -5.7305,
2, -3.208355, -6.014313,
3, -3.050327, -5.7305,
3, -3.208355, -6.014313
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
-3, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
-3, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
-3, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
-3, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
-2, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
-2, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
-2, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
-2, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
-1, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
-1, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
-1, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
-1, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
0, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
0, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
0, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
0, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
1, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
1, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
1, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
1, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
2, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
2, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
2, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
2, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5,
3, -3.524412, -6.581941, 0, -0.5, 0.5, 0.5,
3, -3.524412, -6.581941, 1, -0.5, 0.5, 0.5,
3, -3.524412, -6.581941, 1, 1.5, 0.5, 0.5,
3, -3.524412, -6.581941, 0, 1.5, 0.5, 0.5
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
-3.558515, -2, -5.7305,
-3.558515, 3, -5.7305,
-3.558515, -2, -5.7305,
-3.735754, -2, -6.014313,
-3.558515, -1, -5.7305,
-3.735754, -1, -6.014313,
-3.558515, 0, -5.7305,
-3.735754, 0, -6.014313,
-3.558515, 1, -5.7305,
-3.735754, 1, -6.014313,
-3.558515, 2, -5.7305,
-3.735754, 2, -6.014313,
-3.558515, 3, -5.7305,
-3.735754, 3, -6.014313
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
-4.090232, -2, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, -2, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, -2, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, -2, -6.581941, 0, 1.5, 0.5, 0.5,
-4.090232, -1, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, -1, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, -1, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, -1, -6.581941, 0, 1.5, 0.5, 0.5,
-4.090232, 0, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, 0, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, 0, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, 0, -6.581941, 0, 1.5, 0.5, 0.5,
-4.090232, 1, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, 1, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, 1, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, 1, -6.581941, 0, 1.5, 0.5, 0.5,
-4.090232, 2, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, 2, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, 2, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, 2, -6.581941, 0, 1.5, 0.5, 0.5,
-4.090232, 3, -6.581941, 0, -0.5, 0.5, 0.5,
-4.090232, 3, -6.581941, 1, -0.5, 0.5, 0.5,
-4.090232, 3, -6.581941, 1, 1.5, 0.5, 0.5,
-4.090232, 3, -6.581941, 0, 1.5, 0.5, 0.5
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
-3.558515, -3.050327, -4,
-3.558515, -3.050327, 4,
-3.558515, -3.050327, -4,
-3.735754, -3.208355, -4,
-3.558515, -3.050327, -2,
-3.735754, -3.208355, -2,
-3.558515, -3.050327, 0,
-3.735754, -3.208355, 0,
-3.558515, -3.050327, 2,
-3.735754, -3.208355, 2,
-3.558515, -3.050327, 4,
-3.735754, -3.208355, 4
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
-4.090232, -3.524412, -4, 0, -0.5, 0.5, 0.5,
-4.090232, -3.524412, -4, 1, -0.5, 0.5, 0.5,
-4.090232, -3.524412, -4, 1, 1.5, 0.5, 0.5,
-4.090232, -3.524412, -4, 0, 1.5, 0.5, 0.5,
-4.090232, -3.524412, -2, 0, -0.5, 0.5, 0.5,
-4.090232, -3.524412, -2, 1, -0.5, 0.5, 0.5,
-4.090232, -3.524412, -2, 1, 1.5, 0.5, 0.5,
-4.090232, -3.524412, -2, 0, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 0, 0, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 0, 1, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 0, 1, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 0, 0, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 2, 0, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 2, 1, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 2, 1, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 2, 0, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 4, 0, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 4, 1, -0.5, 0.5, 0.5,
-4.090232, -3.524412, 4, 1, 1.5, 0.5, 0.5,
-4.090232, -3.524412, 4, 0, 1.5, 0.5, 0.5
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
-3.558515, -3.050327, -5.7305,
-3.558515, 3.270813, -5.7305,
-3.558515, -3.050327, 5.622046,
-3.558515, 3.270813, 5.622046,
-3.558515, -3.050327, -5.7305,
-3.558515, -3.050327, 5.622046,
-3.558515, 3.270813, -5.7305,
-3.558515, 3.270813, 5.622046,
-3.558515, -3.050327, -5.7305,
3.531042, -3.050327, -5.7305,
-3.558515, -3.050327, 5.622046,
3.531042, -3.050327, 5.622046,
-3.558515, 3.270813, -5.7305,
3.531042, 3.270813, -5.7305,
-3.558515, 3.270813, 5.622046,
3.531042, 3.270813, 5.622046,
3.531042, -3.050327, -5.7305,
3.531042, 3.270813, -5.7305,
3.531042, -3.050327, 5.622046,
3.531042, 3.270813, 5.622046,
3.531042, -3.050327, -5.7305,
3.531042, -3.050327, 5.622046,
3.531042, 3.270813, -5.7305,
3.531042, 3.270813, 5.622046
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
var radius = 7.903975;
var distance = 35.16568;
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
mvMatrix.translate( 0.01373661, -0.110243, 0.05422664 );
mvMatrix.scale( 1.205426, 1.351961, 0.7527768 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16568);
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
1-naphthylacetic_aci<-read.table("1-naphthylacetic_aci.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.455269, 0.6211326, -0.3850932, 0, 0, 1, 1, 1,
-3.420435, 2.253119, -0.06440133, 1, 0, 0, 1, 1,
-2.805411, -1.376552, -1.768302, 1, 0, 0, 1, 1,
-2.689871, 0.3980538, -2.480586, 1, 0, 0, 1, 1,
-2.66575, 0.8096482, -2.570971, 1, 0, 0, 1, 1,
-2.61841, -0.03343102, -1.269231, 1, 0, 0, 1, 1,
-2.579422, 2.114629, -0.9393056, 0, 0, 0, 1, 1,
-2.538823, -0.9818239, -3.324964, 0, 0, 0, 1, 1,
-2.435924, 0.3372786, -2.661829, 0, 0, 0, 1, 1,
-2.3742, -0.4786586, -0.705771, 0, 0, 0, 1, 1,
-2.343836, 0.2763745, -1.489415, 0, 0, 0, 1, 1,
-2.30088, 1.430787, -1.479741, 0, 0, 0, 1, 1,
-2.277694, -0.6754154, -2.567094, 0, 0, 0, 1, 1,
-2.27188, -1.802622, -0.9318939, 1, 1, 1, 1, 1,
-2.228919, 0.4776731, -0.4409193, 1, 1, 1, 1, 1,
-2.212372, -0.8805103, -1.617261, 1, 1, 1, 1, 1,
-2.195998, -0.02027118, -2.391361, 1, 1, 1, 1, 1,
-2.170368, 1.217695, -1.587517, 1, 1, 1, 1, 1,
-2.158888, -0.4891551, -1.669634, 1, 1, 1, 1, 1,
-2.119647, -0.8802988, -0.9993224, 1, 1, 1, 1, 1,
-2.083277, 1.387656, -1.225625, 1, 1, 1, 1, 1,
-2.073056, 1.455049, -1.029191, 1, 1, 1, 1, 1,
-2.062769, 0.4576906, -0.3899658, 1, 1, 1, 1, 1,
-2.059793, 0.08978111, -1.663927, 1, 1, 1, 1, 1,
-2.048806, 0.6045101, 0.2803406, 1, 1, 1, 1, 1,
-2.032258, -0.4226874, -1.74212, 1, 1, 1, 1, 1,
-2.009055, -0.2906794, -2.243831, 1, 1, 1, 1, 1,
-2.003263, 0.4110008, -0.8854398, 1, 1, 1, 1, 1,
-1.976344, -0.1755605, -1.376272, 0, 0, 1, 1, 1,
-1.970332, -0.7637169, -2.201186, 1, 0, 0, 1, 1,
-1.941463, 0.9643968, -0.8274912, 1, 0, 0, 1, 1,
-1.9149, 0.9685327, -0.8473434, 1, 0, 0, 1, 1,
-1.914217, 1.617196, -0.3410449, 1, 0, 0, 1, 1,
-1.912921, 0.08538033, -0.289221, 1, 0, 0, 1, 1,
-1.882069, -0.8388062, -0.05713458, 0, 0, 0, 1, 1,
-1.879002, 0.9916511, -0.5521822, 0, 0, 0, 1, 1,
-1.863949, 0.6960427, -1.283532, 0, 0, 0, 1, 1,
-1.854535, -0.8023975, -2.912211, 0, 0, 0, 1, 1,
-1.826824, -0.7331305, -3.36116, 0, 0, 0, 1, 1,
-1.826585, -0.5262184, -2.086751, 0, 0, 0, 1, 1,
-1.813847, 1.026067, -1.595182, 0, 0, 0, 1, 1,
-1.811642, 0.7448276, -1.232302, 1, 1, 1, 1, 1,
-1.807329, -0.02124142, -1.629253, 1, 1, 1, 1, 1,
-1.805366, 1.377746, -0.9162046, 1, 1, 1, 1, 1,
-1.785322, 1.142938, -1.893582, 1, 1, 1, 1, 1,
-1.710565, -0.3781123, -2.680203, 1, 1, 1, 1, 1,
-1.696606, -1.186977, -1.378992, 1, 1, 1, 1, 1,
-1.685688, -0.5346729, -1.745321, 1, 1, 1, 1, 1,
-1.682304, -0.6218473, -2.732311, 1, 1, 1, 1, 1,
-1.673568, -0.02329922, -0.4787499, 1, 1, 1, 1, 1,
-1.671775, 0.007426253, -1.026469, 1, 1, 1, 1, 1,
-1.671001, 1.40674, -0.09159537, 1, 1, 1, 1, 1,
-1.651671, -0.1401986, -2.255358, 1, 1, 1, 1, 1,
-1.647718, 0.4484169, -0.875784, 1, 1, 1, 1, 1,
-1.642921, -1.526513, -1.570079, 1, 1, 1, 1, 1,
-1.637911, 1.065845, -1.006949, 1, 1, 1, 1, 1,
-1.633955, 0.5749251, -0.726031, 0, 0, 1, 1, 1,
-1.623064, -1.097321, -2.510967, 1, 0, 0, 1, 1,
-1.612057, -0.05252075, -2.127502, 1, 0, 0, 1, 1,
-1.60301, -0.01693691, -0.2856905, 1, 0, 0, 1, 1,
-1.584451, -0.4375595, -1.507349, 1, 0, 0, 1, 1,
-1.583292, 0.7770711, -1.211161, 1, 0, 0, 1, 1,
-1.575177, -0.2543468, -0.8116684, 0, 0, 0, 1, 1,
-1.562183, 1.095271, -0.979992, 0, 0, 0, 1, 1,
-1.561387, -0.5299841, -2.969624, 0, 0, 0, 1, 1,
-1.552873, -1.305141, -1.831189, 0, 0, 0, 1, 1,
-1.551967, -0.7551263, -1.736849, 0, 0, 0, 1, 1,
-1.549875, -1.382484, -0.7128392, 0, 0, 0, 1, 1,
-1.54634, -0.5718043, -0.6925949, 0, 0, 0, 1, 1,
-1.545397, 0.155085, -2.232423, 1, 1, 1, 1, 1,
-1.54379, -1.244321, -2.049624, 1, 1, 1, 1, 1,
-1.541275, 1.205092, -0.4919792, 1, 1, 1, 1, 1,
-1.537598, 0.3703729, -3.016474, 1, 1, 1, 1, 1,
-1.532942, 0.9572195, -1.663511, 1, 1, 1, 1, 1,
-1.526694, -0.07623234, -1.612232, 1, 1, 1, 1, 1,
-1.509708, -0.1616422, -1.646919, 1, 1, 1, 1, 1,
-1.486323, -1.057572, -2.097463, 1, 1, 1, 1, 1,
-1.481225, -1.383662, -3.702816, 1, 1, 1, 1, 1,
-1.480302, -0.2070728, -2.701961, 1, 1, 1, 1, 1,
-1.475297, -0.418525, 0.004909929, 1, 1, 1, 1, 1,
-1.472228, -0.1127249, -1.847459, 1, 1, 1, 1, 1,
-1.449677, -0.2560067, -2.830542, 1, 1, 1, 1, 1,
-1.443544, 0.6146028, -1.940391, 1, 1, 1, 1, 1,
-1.443003, -0.04879329, -2.127245, 1, 1, 1, 1, 1,
-1.434404, -0.2660889, 2.107055, 0, 0, 1, 1, 1,
-1.429546, -0.830493, -2.361219, 1, 0, 0, 1, 1,
-1.410429, 1.771338, -0.4666434, 1, 0, 0, 1, 1,
-1.407746, 1.130541, -1.57345, 1, 0, 0, 1, 1,
-1.40472, 0.3390141, -0.9279574, 1, 0, 0, 1, 1,
-1.390744, 0.4420682, -1.844887, 1, 0, 0, 1, 1,
-1.371654, -0.6445842, -1.996618, 0, 0, 0, 1, 1,
-1.369553, 2.204778, -1.186804, 0, 0, 0, 1, 1,
-1.365327, -0.588047, -0.783244, 0, 0, 0, 1, 1,
-1.347455, 0.2241547, -1.444249, 0, 0, 0, 1, 1,
-1.344148, -1.017313, -1.625756, 0, 0, 0, 1, 1,
-1.34157, 0.6972563, -1.378326, 0, 0, 0, 1, 1,
-1.34048, 1.100924, 0.4700517, 0, 0, 0, 1, 1,
-1.322304, 2.756907, -0.3101153, 1, 1, 1, 1, 1,
-1.310395, -0.1623023, -3.45711, 1, 1, 1, 1, 1,
-1.310344, -0.6544979, -2.166598, 1, 1, 1, 1, 1,
-1.30836, -0.2361852, -1.719058, 1, 1, 1, 1, 1,
-1.302662, 0.1439533, -1.898438, 1, 1, 1, 1, 1,
-1.300222, 0.04540753, -1.671378, 1, 1, 1, 1, 1,
-1.298905, 0.9951726, -2.948728, 1, 1, 1, 1, 1,
-1.289101, 0.1393849, -1.613963, 1, 1, 1, 1, 1,
-1.277445, -0.934554, -3.000728, 1, 1, 1, 1, 1,
-1.274888, -0.02766509, -2.85186, 1, 1, 1, 1, 1,
-1.274755, 0.7524633, -2.081367, 1, 1, 1, 1, 1,
-1.270975, 0.1389116, -0.04081587, 1, 1, 1, 1, 1,
-1.270355, -0.3931716, -1.963159, 1, 1, 1, 1, 1,
-1.267967, -0.728806, -1.019175, 1, 1, 1, 1, 1,
-1.266797, 0.09466803, -2.362555, 1, 1, 1, 1, 1,
-1.266748, -0.8959944, -3.05437, 0, 0, 1, 1, 1,
-1.261779, 0.504836, -2.430323, 1, 0, 0, 1, 1,
-1.257231, 0.47512, -1.38933, 1, 0, 0, 1, 1,
-1.25679, -0.3719628, -0.6656162, 1, 0, 0, 1, 1,
-1.246951, -1.089733, -1.030972, 1, 0, 0, 1, 1,
-1.245887, 2.023251, -1.362824, 1, 0, 0, 1, 1,
-1.243126, 1.110864, -2.333215, 0, 0, 0, 1, 1,
-1.237719, -0.03416808, -2.672054, 0, 0, 0, 1, 1,
-1.216693, 1.668405, -0.3013364, 0, 0, 0, 1, 1,
-1.214148, -0.2748835, -2.918472, 0, 0, 0, 1, 1,
-1.211544, -0.430563, -0.8735751, 0, 0, 0, 1, 1,
-1.208491, 0.9697345, 0.6885353, 0, 0, 0, 1, 1,
-1.204301, 0.3593004, -0.3930695, 0, 0, 0, 1, 1,
-1.204201, -0.2840461, -0.7815567, 1, 1, 1, 1, 1,
-1.202634, -0.05477224, -1.973225, 1, 1, 1, 1, 1,
-1.195736, 0.7663826, 0.5790984, 1, 1, 1, 1, 1,
-1.194307, -0.03711075, -1.768812, 1, 1, 1, 1, 1,
-1.192645, -1.543213, -3.267267, 1, 1, 1, 1, 1,
-1.184178, 0.6171385, -0.9121584, 1, 1, 1, 1, 1,
-1.183033, -1.138989, -2.217542, 1, 1, 1, 1, 1,
-1.179596, -0.3475254, 0.06286247, 1, 1, 1, 1, 1,
-1.174541, -1.073294, -2.302675, 1, 1, 1, 1, 1,
-1.169683, 1.350909, -0.1463721, 1, 1, 1, 1, 1,
-1.168264, 0.2894437, -1.264288, 1, 1, 1, 1, 1,
-1.161571, -0.07368603, -1.93633, 1, 1, 1, 1, 1,
-1.137594, -0.07205163, -1.92549, 1, 1, 1, 1, 1,
-1.133857, 1.035609, -1.085541, 1, 1, 1, 1, 1,
-1.130506, 1.556481, -1.584062, 1, 1, 1, 1, 1,
-1.12893, -0.3655312, -1.404413, 0, 0, 1, 1, 1,
-1.128582, -0.956211, -3.605652, 1, 0, 0, 1, 1,
-1.106849, 0.9060509, -0.2284053, 1, 0, 0, 1, 1,
-1.1058, -0.6272444, -0.7728699, 1, 0, 0, 1, 1,
-1.100753, -0.3734812, -2.814004, 1, 0, 0, 1, 1,
-1.097067, 0.5448672, -0.6663852, 1, 0, 0, 1, 1,
-1.08798, -1.774161, -1.666814, 0, 0, 0, 1, 1,
-1.08792, -1.058033, -2.605075, 0, 0, 0, 1, 1,
-1.087238, -2.212111, -3.441069, 0, 0, 0, 1, 1,
-1.082085, -0.2205833, -2.575179, 0, 0, 0, 1, 1,
-1.079768, -0.7281117, -0.8264619, 0, 0, 0, 1, 1,
-1.07822, -0.4185894, -1.568001, 0, 0, 0, 1, 1,
-1.077414, 0.2239484, -0.521997, 0, 0, 0, 1, 1,
-1.072482, 0.7714303, -2.048918, 1, 1, 1, 1, 1,
-1.066468, -0.2645153, -2.513579, 1, 1, 1, 1, 1,
-1.062598, 2.028896, 0.2478573, 1, 1, 1, 1, 1,
-1.061193, -1.60639, -1.876132, 1, 1, 1, 1, 1,
-1.055387, 0.8004042, -1.092766, 1, 1, 1, 1, 1,
-1.053536, 1.937706, -0.2481192, 1, 1, 1, 1, 1,
-1.050669, -0.4889812, -1.560796, 1, 1, 1, 1, 1,
-1.044341, 0.8092056, 0.1261381, 1, 1, 1, 1, 1,
-1.035547, 1.875287, -2.604225, 1, 1, 1, 1, 1,
-1.033921, -0.3361539, -3.396188, 1, 1, 1, 1, 1,
-1.030371, -1.687589, -3.995142, 1, 1, 1, 1, 1,
-1.020933, 0.4798081, -1.921391, 1, 1, 1, 1, 1,
-1.01775, 2.597994, 0.1214641, 1, 1, 1, 1, 1,
-0.9994227, 0.8009399, -2.870931, 1, 1, 1, 1, 1,
-0.9964988, 1.29883, -0.06693532, 1, 1, 1, 1, 1,
-0.9774752, 2.335453, -0.3013419, 0, 0, 1, 1, 1,
-0.974388, -0.8065124, -2.94819, 1, 0, 0, 1, 1,
-0.9687902, 0.493668, -1.535049, 1, 0, 0, 1, 1,
-0.9672401, -1.27291, -3.534112, 1, 0, 0, 1, 1,
-0.9596837, -0.3587942, -1.252786, 1, 0, 0, 1, 1,
-0.9554038, 0.8041536, -1.231582, 1, 0, 0, 1, 1,
-0.9541027, -2.457778, -2.751223, 0, 0, 0, 1, 1,
-0.9524051, -0.6282539, -1.959392, 0, 0, 0, 1, 1,
-0.9494768, -2.147216, -3.060884, 0, 0, 0, 1, 1,
-0.9463375, 0.534641, -2.859198, 0, 0, 0, 1, 1,
-0.9423878, -0.8096721, -1.697361, 0, 0, 0, 1, 1,
-0.9391398, -2.081287, -2.540424, 0, 0, 0, 1, 1,
-0.9367508, 2.828231, 0.05728751, 0, 0, 0, 1, 1,
-0.9338642, -0.215317, -1.455131, 1, 1, 1, 1, 1,
-0.933602, -0.1780082, -0.4206232, 1, 1, 1, 1, 1,
-0.9324688, -0.790746, -2.703982, 1, 1, 1, 1, 1,
-0.9289235, -0.2426386, -1.30088, 1, 1, 1, 1, 1,
-0.9201266, 1.092963, -1.110614, 1, 1, 1, 1, 1,
-0.9196936, -1.207175, -4.647077, 1, 1, 1, 1, 1,
-0.916674, 1.405142, -1.597883, 1, 1, 1, 1, 1,
-0.9162605, -0.1376231, -2.876832, 1, 1, 1, 1, 1,
-0.9097111, -1.680706, -1.32914, 1, 1, 1, 1, 1,
-0.9089677, 0.009224061, -0.6206261, 1, 1, 1, 1, 1,
-0.9083254, 0.2643968, -1.525115, 1, 1, 1, 1, 1,
-0.9064127, -1.983508, -1.221899, 1, 1, 1, 1, 1,
-0.9017398, 0.06130483, -2.776373, 1, 1, 1, 1, 1,
-0.8999831, -1.264923, -3.977011, 1, 1, 1, 1, 1,
-0.8965077, -1.533353, -3.126752, 1, 1, 1, 1, 1,
-0.8958491, -0.87721, -5.201323, 0, 0, 1, 1, 1,
-0.894729, 0.3614962, -0.6068929, 1, 0, 0, 1, 1,
-0.892123, 0.9667573, -0.07612614, 1, 0, 0, 1, 1,
-0.8898236, 1.383945, -1.568331, 1, 0, 0, 1, 1,
-0.8884214, -1.312382, -2.357864, 1, 0, 0, 1, 1,
-0.8811051, -0.4191341, -0.8588458, 1, 0, 0, 1, 1,
-0.8793327, -0.2826335, -4.636465, 0, 0, 0, 1, 1,
-0.8789472, 0.7214648, -0.148256, 0, 0, 0, 1, 1,
-0.8765565, -0.4896457, 1.525554, 0, 0, 0, 1, 1,
-0.8759423, -0.8361646, -1.297398, 0, 0, 0, 1, 1,
-0.8742077, 0.4850688, -1.611842, 0, 0, 0, 1, 1,
-0.8690856, 2.111208, -2.557339, 0, 0, 0, 1, 1,
-0.8633629, -0.3082475, -0.9685565, 0, 0, 0, 1, 1,
-0.8604604, -0.4210613, -1.793613, 1, 1, 1, 1, 1,
-0.856824, -0.2952713, -1.598876, 1, 1, 1, 1, 1,
-0.855891, 0.002225297, -1.755613, 1, 1, 1, 1, 1,
-0.854081, 0.4804616, -2.638997, 1, 1, 1, 1, 1,
-0.8539904, -0.1067057, -0.6509292, 1, 1, 1, 1, 1,
-0.8530779, 0.3663359, -1.572959, 1, 1, 1, 1, 1,
-0.8529543, 1.317407, -1.250491, 1, 1, 1, 1, 1,
-0.8526905, -0.3138978, -1.698749, 1, 1, 1, 1, 1,
-0.8522395, 1.382934, 0.5607335, 1, 1, 1, 1, 1,
-0.8511793, 0.9098871, 0.6350775, 1, 1, 1, 1, 1,
-0.8446578, 1.634213, -1.317378, 1, 1, 1, 1, 1,
-0.8307801, -1.097729, -1.909929, 1, 1, 1, 1, 1,
-0.813566, 0.5367478, -1.812407, 1, 1, 1, 1, 1,
-0.8124485, 0.6428633, -0.4999711, 1, 1, 1, 1, 1,
-0.8113998, 0.8583785, 0.2691621, 1, 1, 1, 1, 1,
-0.8101668, 0.9664165, -1.33077, 0, 0, 1, 1, 1,
-0.808839, 0.5259228, -1.564019, 1, 0, 0, 1, 1,
-0.8086815, 0.836769, -0.7652084, 1, 0, 0, 1, 1,
-0.8067836, -0.4964221, -2.538965, 1, 0, 0, 1, 1,
-0.8028269, -0.6922677, -2.054076, 1, 0, 0, 1, 1,
-0.8027217, 0.5874681, -1.607031, 1, 0, 0, 1, 1,
-0.7903612, -1.998373, -1.618111, 0, 0, 0, 1, 1,
-0.785697, 0.5600005, -1.886638, 0, 0, 0, 1, 1,
-0.7849358, -0.399085, -2.68382, 0, 0, 0, 1, 1,
-0.7816256, 0.9821625, -0.6526372, 0, 0, 0, 1, 1,
-0.7746041, 0.163083, -2.190443, 0, 0, 0, 1, 1,
-0.7625613, -0.5372605, -3.118316, 0, 0, 0, 1, 1,
-0.7568995, -1.00589, -1.056934, 0, 0, 0, 1, 1,
-0.7541245, -0.9853295, -3.175016, 1, 1, 1, 1, 1,
-0.7539898, 0.4541614, -0.7185268, 1, 1, 1, 1, 1,
-0.7512813, -0.4545104, -2.531608, 1, 1, 1, 1, 1,
-0.7436633, -1.188761, -1.992645, 1, 1, 1, 1, 1,
-0.7424505, -1.41193, -3.028912, 1, 1, 1, 1, 1,
-0.7362326, 0.2535583, -0.4464815, 1, 1, 1, 1, 1,
-0.7355328, -0.03778515, -1.127914, 1, 1, 1, 1, 1,
-0.7348171, -1.208584, -3.238223, 1, 1, 1, 1, 1,
-0.7339196, 0.1865344, -0.5563086, 1, 1, 1, 1, 1,
-0.7334688, 1.154527, 1.73125, 1, 1, 1, 1, 1,
-0.7318882, 1.824738, -0.9232433, 1, 1, 1, 1, 1,
-0.731306, -0.08352498, -1.874179, 1, 1, 1, 1, 1,
-0.7303419, -0.9086855, -3.534262, 1, 1, 1, 1, 1,
-0.7298156, 1.302679, -2.663432, 1, 1, 1, 1, 1,
-0.7289338, 1.234265, -0.4922281, 1, 1, 1, 1, 1,
-0.7285392, -0.544775, -0.3332976, 0, 0, 1, 1, 1,
-0.7282476, 1.075005, -1.857089, 1, 0, 0, 1, 1,
-0.7248105, -0.9236527, -1.515864, 1, 0, 0, 1, 1,
-0.7140269, -0.8494257, -3.042432, 1, 0, 0, 1, 1,
-0.709773, -0.3920913, -3.040405, 1, 0, 0, 1, 1,
-0.7093014, -0.3379128, -1.841186, 1, 0, 0, 1, 1,
-0.7063609, -0.1127372, -1.910273, 0, 0, 0, 1, 1,
-0.7055665, -0.5800269, -0.2815322, 0, 0, 0, 1, 1,
-0.7041708, 1.231008, 0.6487111, 0, 0, 0, 1, 1,
-0.7008646, 0.8530251, -0.1951243, 0, 0, 0, 1, 1,
-0.6983142, 0.6883848, -0.8662475, 0, 0, 0, 1, 1,
-0.6976545, 1.206904, -0.06279272, 0, 0, 0, 1, 1,
-0.6940181, 0.263934, -2.059725, 0, 0, 0, 1, 1,
-0.6939057, -1.560399, -0.9159781, 1, 1, 1, 1, 1,
-0.6841625, 0.8994858, -2.309318, 1, 1, 1, 1, 1,
-0.681696, 0.04643834, -0.887662, 1, 1, 1, 1, 1,
-0.6764089, 2.167151, -2.330011, 1, 1, 1, 1, 1,
-0.6727028, 1.704088, 0.5186864, 1, 1, 1, 1, 1,
-0.6687677, -0.04058691, -1.371127, 1, 1, 1, 1, 1,
-0.6663111, 0.2967638, -0.210449, 1, 1, 1, 1, 1,
-0.6660572, 1.15505, -0.4544699, 1, 1, 1, 1, 1,
-0.6621495, 0.5552869, -1.648909, 1, 1, 1, 1, 1,
-0.6555991, 1.291734, -1.152905, 1, 1, 1, 1, 1,
-0.6502697, 0.01741196, -2.833204, 1, 1, 1, 1, 1,
-0.6458012, 0.2707761, -2.240759, 1, 1, 1, 1, 1,
-0.6445924, 1.152664, 0.8846619, 1, 1, 1, 1, 1,
-0.6421238, 0.2210478, -1.601142, 1, 1, 1, 1, 1,
-0.6377689, -1.299981, -2.24349, 1, 1, 1, 1, 1,
-0.6375969, -0.2928151, -1.230015, 0, 0, 1, 1, 1,
-0.629833, 0.3323429, 0.4526625, 1, 0, 0, 1, 1,
-0.6230495, -0.6050825, -1.219077, 1, 0, 0, 1, 1,
-0.6184295, 0.5976962, -1.247306, 1, 0, 0, 1, 1,
-0.616584, 0.2850349, -2.139309, 1, 0, 0, 1, 1,
-0.6158073, -1.060094, -3.939419, 1, 0, 0, 1, 1,
-0.6105532, -0.4774694, -1.450896, 0, 0, 0, 1, 1,
-0.6029559, 1.151388, -0.5356648, 0, 0, 0, 1, 1,
-0.6028331, 1.560948, 0.03672374, 0, 0, 0, 1, 1,
-0.5936685, -1.817939, -1.604998, 0, 0, 0, 1, 1,
-0.5881633, -0.3876817, -2.879112, 0, 0, 0, 1, 1,
-0.587712, 2.420762, 1.166183, 0, 0, 0, 1, 1,
-0.5790101, 0.5372317, 0.2114979, 0, 0, 0, 1, 1,
-0.5770656, -0.08427622, -0.4347553, 1, 1, 1, 1, 1,
-0.5756994, 1.343446, 0.8826802, 1, 1, 1, 1, 1,
-0.575316, -0.3754957, -1.669991, 1, 1, 1, 1, 1,
-0.5709019, 1.259714, 0.7197008, 1, 1, 1, 1, 1,
-0.569879, 0.5583431, 0.7115424, 1, 1, 1, 1, 1,
-0.5613552, -0.09136063, -0.5378407, 1, 1, 1, 1, 1,
-0.5585478, 1.355177, -2.250189, 1, 1, 1, 1, 1,
-0.5585093, -1.909203, -4.167544, 1, 1, 1, 1, 1,
-0.5584244, 0.2724883, -0.7860197, 1, 1, 1, 1, 1,
-0.5541303, -0.5642321, -5.565171, 1, 1, 1, 1, 1,
-0.5541054, -0.6268642, -2.496193, 1, 1, 1, 1, 1,
-0.5540129, -1.312418, -3.371922, 1, 1, 1, 1, 1,
-0.5511496, -1.150797, -2.271868, 1, 1, 1, 1, 1,
-0.551023, -0.8699806, -2.431233, 1, 1, 1, 1, 1,
-0.5504946, 0.8434132, -0.6041226, 1, 1, 1, 1, 1,
-0.5498378, -0.9110427, -2.062414, 0, 0, 1, 1, 1,
-0.5431706, 1.33474, -1.271839, 1, 0, 0, 1, 1,
-0.5422795, -0.07700095, -3.257453, 1, 0, 0, 1, 1,
-0.5360605, 0.4443651, -2.026408, 1, 0, 0, 1, 1,
-0.5359641, -1.046513, -1.875544, 1, 0, 0, 1, 1,
-0.5338584, -1.120418, -2.571016, 1, 0, 0, 1, 1,
-0.5321583, -0.8339874, -2.773925, 0, 0, 0, 1, 1,
-0.5310432, 0.2493267, -1.325954, 0, 0, 0, 1, 1,
-0.5303044, -0.8874502, -2.105251, 0, 0, 0, 1, 1,
-0.5291395, -0.4402143, -2.266482, 0, 0, 0, 1, 1,
-0.5256004, -0.469574, -0.3169404, 0, 0, 0, 1, 1,
-0.5244618, 2.139278, -1.467257, 0, 0, 0, 1, 1,
-0.5227474, -0.438832, -1.550978, 0, 0, 0, 1, 1,
-0.5225751, -0.1050238, -1.612485, 1, 1, 1, 1, 1,
-0.5199266, 0.4754526, -0.7340998, 1, 1, 1, 1, 1,
-0.5173915, 0.1985896, -0.3925817, 1, 1, 1, 1, 1,
-0.5077565, 1.237752, -0.3366909, 1, 1, 1, 1, 1,
-0.4990728, 0.4549924, 0.3785325, 1, 1, 1, 1, 1,
-0.4968013, 1.113539, -0.5192913, 1, 1, 1, 1, 1,
-0.4893509, -2.958271, -3.502045, 1, 1, 1, 1, 1,
-0.4868678, -1.57129, -1.77941, 1, 1, 1, 1, 1,
-0.4842187, 0.4589186, -0.525294, 1, 1, 1, 1, 1,
-0.4768399, -0.4557098, -2.308218, 1, 1, 1, 1, 1,
-0.4716855, 0.5641585, -1.323506, 1, 1, 1, 1, 1,
-0.4684608, 0.3292559, -1.003948, 1, 1, 1, 1, 1,
-0.4667869, -1.996431, -3.357991, 1, 1, 1, 1, 1,
-0.4618025, 1.163375, -0.6540171, 1, 1, 1, 1, 1,
-0.4546959, 0.9099227, 0.825875, 1, 1, 1, 1, 1,
-0.4535761, 1.305725, -0.4662744, 0, 0, 1, 1, 1,
-0.4493451, -0.4078819, -2.452534, 1, 0, 0, 1, 1,
-0.4467607, -0.7559022, -2.952215, 1, 0, 0, 1, 1,
-0.4430095, 1.321222, -1.323802, 1, 0, 0, 1, 1,
-0.4326196, -2.008323, -2.162797, 1, 0, 0, 1, 1,
-0.4310557, 0.9397904, 0.05473481, 1, 0, 0, 1, 1,
-0.4276357, 0.5385866, -0.647997, 0, 0, 0, 1, 1,
-0.4188261, -0.9456018, -2.295785, 0, 0, 0, 1, 1,
-0.4163921, -0.7159855, -4.386424, 0, 0, 0, 1, 1,
-0.4148549, -2.462305, -2.451292, 0, 0, 0, 1, 1,
-0.4139521, 0.4856697, -0.3218535, 0, 0, 0, 1, 1,
-0.4109613, -0.7867127, -3.404104, 0, 0, 0, 1, 1,
-0.4102235, 1.224412, -0.8311208, 0, 0, 0, 1, 1,
-0.409722, -1.488588, -2.733457, 1, 1, 1, 1, 1,
-0.4072977, 0.777536, -0.4755794, 1, 1, 1, 1, 1,
-0.4032218, -0.7423006, -3.455693, 1, 1, 1, 1, 1,
-0.4029011, -0.5572655, -1.767612, 1, 1, 1, 1, 1,
-0.4016737, 0.7168531, -0.5604407, 1, 1, 1, 1, 1,
-0.400662, 0.5179952, -1.820246, 1, 1, 1, 1, 1,
-0.3958998, 0.871429, 0.328442, 1, 1, 1, 1, 1,
-0.3943851, -0.1678168, -1.935211, 1, 1, 1, 1, 1,
-0.3941137, -0.111993, -2.866157, 1, 1, 1, 1, 1,
-0.3919124, -0.5859003, -3.510595, 1, 1, 1, 1, 1,
-0.3907101, -0.3673062, -2.425932, 1, 1, 1, 1, 1,
-0.3855023, 1.26646, -0.7723097, 1, 1, 1, 1, 1,
-0.3821312, 0.08452978, -0.2940243, 1, 1, 1, 1, 1,
-0.3784476, -1.144645, -1.288306, 1, 1, 1, 1, 1,
-0.3719256, 0.1916417, -0.3295298, 1, 1, 1, 1, 1,
-0.3681908, 1.227945, 0.417012, 0, 0, 1, 1, 1,
-0.3604248, -1.078869, -3.394173, 1, 0, 0, 1, 1,
-0.3489505, 0.6518959, 0.5461597, 1, 0, 0, 1, 1,
-0.3474505, -0.02476809, -1.27948, 1, 0, 0, 1, 1,
-0.3405933, 0.3688926, 0.2412356, 1, 0, 0, 1, 1,
-0.3379114, -1.179923, -1.220094, 1, 0, 0, 1, 1,
-0.3376472, -1.171082, -2.669029, 0, 0, 0, 1, 1,
-0.3360632, -0.6433261, -0.9693339, 0, 0, 0, 1, 1,
-0.3359065, -0.3580439, -1.282909, 0, 0, 0, 1, 1,
-0.3358974, -1.419058, -3.203016, 0, 0, 0, 1, 1,
-0.333027, -0.5695445, -1.50959, 0, 0, 0, 1, 1,
-0.3316105, 0.1860971, -1.422794, 0, 0, 0, 1, 1,
-0.3305891, 0.7862993, -1.081409, 0, 0, 0, 1, 1,
-0.3296497, 1.221104, 0.5003725, 1, 1, 1, 1, 1,
-0.3268767, -1.688308, -3.677061, 1, 1, 1, 1, 1,
-0.3265415, -0.8506224, -2.339479, 1, 1, 1, 1, 1,
-0.3240377, 0.7503397, -1.525291, 1, 1, 1, 1, 1,
-0.3237425, 0.4279392, -0.1840138, 1, 1, 1, 1, 1,
-0.3212933, 1.481875, -1.141519, 1, 1, 1, 1, 1,
-0.3189197, -0.778915, -4.294019, 1, 1, 1, 1, 1,
-0.3147081, 0.2225581, -1.163978, 1, 1, 1, 1, 1,
-0.3110273, 0.9011759, 0.8672019, 1, 1, 1, 1, 1,
-0.3095751, -0.7814544, -2.099089, 1, 1, 1, 1, 1,
-0.3091291, -0.384895, -2.091735, 1, 1, 1, 1, 1,
-0.302505, 0.3926798, -0.4838395, 1, 1, 1, 1, 1,
-0.2949369, -0.1355813, -1.417711, 1, 1, 1, 1, 1,
-0.2904101, -0.2254978, -0.1953529, 1, 1, 1, 1, 1,
-0.2895077, -0.1675572, -2.045853, 1, 1, 1, 1, 1,
-0.2886772, 1.875277, 0.5923926, 0, 0, 1, 1, 1,
-0.2836246, 1.364281, -1.166753, 1, 0, 0, 1, 1,
-0.2835501, -1.304579, -3.493099, 1, 0, 0, 1, 1,
-0.2821077, 0.938817, -1.434772, 1, 0, 0, 1, 1,
-0.2802036, -0.3613176, -2.215413, 1, 0, 0, 1, 1,
-0.2740904, -0.81903, -3.322076, 1, 0, 0, 1, 1,
-0.2720409, -0.5379955, -3.286527, 0, 0, 0, 1, 1,
-0.2714021, -0.3430108, -3.049772, 0, 0, 0, 1, 1,
-0.2670103, -0.0644612, -1.611047, 0, 0, 0, 1, 1,
-0.265302, -0.09823779, -0.5876893, 0, 0, 0, 1, 1,
-0.2638982, 1.27437, 1.043266, 0, 0, 0, 1, 1,
-0.2603603, 0.619521, 0.2651017, 0, 0, 0, 1, 1,
-0.2591991, 2.006861, 0.5680956, 0, 0, 0, 1, 1,
-0.2575793, 1.124428, -1.187147, 1, 1, 1, 1, 1,
-0.2555839, -1.007375, -4.632771, 1, 1, 1, 1, 1,
-0.2549732, 0.5645426, 0.8211608, 1, 1, 1, 1, 1,
-0.2384026, -0.1027696, -0.7796931, 1, 1, 1, 1, 1,
-0.2363562, 0.3702953, -2.271132, 1, 1, 1, 1, 1,
-0.2313587, 0.217089, -0.457623, 1, 1, 1, 1, 1,
-0.2310022, 0.6757678, -0.05358889, 1, 1, 1, 1, 1,
-0.2307226, 0.3118058, -0.2547408, 1, 1, 1, 1, 1,
-0.2220133, -0.2264426, -2.145198, 1, 1, 1, 1, 1,
-0.2217335, 1.711774, 0.805733, 1, 1, 1, 1, 1,
-0.2197775, 0.8742098, 0.8413137, 1, 1, 1, 1, 1,
-0.217842, 0.1722195, -2.307452, 1, 1, 1, 1, 1,
-0.2171579, -0.9097349, -3.820519, 1, 1, 1, 1, 1,
-0.2148225, -0.2537703, -2.152792, 1, 1, 1, 1, 1,
-0.213689, -0.5059296, -2.860806, 1, 1, 1, 1, 1,
-0.2116434, -0.9645795, -3.300422, 0, 0, 1, 1, 1,
-0.2100897, -0.4512736, -2.993796, 1, 0, 0, 1, 1,
-0.2083502, -0.1997885, -2.219761, 1, 0, 0, 1, 1,
-0.2029828, 2.019312, 2.287184, 1, 0, 0, 1, 1,
-0.199727, 0.68657, 1.076182, 1, 0, 0, 1, 1,
-0.1976276, 0.7622857, -0.4479479, 1, 0, 0, 1, 1,
-0.1966925, 1.135884, -1.710831, 0, 0, 0, 1, 1,
-0.1961201, -0.7625498, -2.683727, 0, 0, 0, 1, 1,
-0.1928121, -0.4955711, -2.654235, 0, 0, 0, 1, 1,
-0.1902155, -0.7489116, -3.697775, 0, 0, 0, 1, 1,
-0.189965, 0.2552529, -0.8689325, 0, 0, 0, 1, 1,
-0.182144, 1.782125, -2.11164, 0, 0, 0, 1, 1,
-0.1799615, 1.528113, -0.6114007, 0, 0, 0, 1, 1,
-0.1751363, -0.3604791, -1.908749, 1, 1, 1, 1, 1,
-0.1751114, -0.3336263, -3.152282, 1, 1, 1, 1, 1,
-0.1750978, -0.7744357, -3.077967, 1, 1, 1, 1, 1,
-0.1745649, -0.3962253, -4.343668, 1, 1, 1, 1, 1,
-0.1741829, -1.004028, -2.941146, 1, 1, 1, 1, 1,
-0.1707248, 0.2209712, -1.271678, 1, 1, 1, 1, 1,
-0.1695171, 1.646561, 0.2978698, 1, 1, 1, 1, 1,
-0.1634188, -0.2809153, -2.988689, 1, 1, 1, 1, 1,
-0.1579829, -0.9658487, -3.518387, 1, 1, 1, 1, 1,
-0.1564083, -0.3067599, -1.960087, 1, 1, 1, 1, 1,
-0.1557411, -0.5677336, -3.278393, 1, 1, 1, 1, 1,
-0.1506054, 0.9579549, -1.21995, 1, 1, 1, 1, 1,
-0.1473916, -0.6269007, -4.530652, 1, 1, 1, 1, 1,
-0.1439621, -1.659935, -3.359911, 1, 1, 1, 1, 1,
-0.1421634, -0.8555015, -3.959989, 1, 1, 1, 1, 1,
-0.1344895, 0.003170646, -1.900784, 0, 0, 1, 1, 1,
-0.1306165, 2.95828, 0.1284597, 1, 0, 0, 1, 1,
-0.1297123, 0.45039, 1.50922, 1, 0, 0, 1, 1,
-0.1240685, -1.10823, -2.436725, 1, 0, 0, 1, 1,
-0.1237266, 1.022008, -0.1561015, 1, 0, 0, 1, 1,
-0.1236304, -0.2031153, -1.23193, 1, 0, 0, 1, 1,
-0.1226505, 0.03034258, -0.4937139, 0, 0, 0, 1, 1,
-0.1224951, 0.4746332, 0.4107791, 0, 0, 0, 1, 1,
-0.1206611, 0.427051, 1.383217, 0, 0, 0, 1, 1,
-0.1194589, -0.2460675, -4.9403, 0, 0, 0, 1, 1,
-0.1163402, 1.168738, -0.7452865, 0, 0, 0, 1, 1,
-0.1139824, 1.056753, -2.000823, 0, 0, 0, 1, 1,
-0.1112205, -2.091876, -1.269814, 0, 0, 0, 1, 1,
-0.1066929, -0.8718346, -3.633803, 1, 1, 1, 1, 1,
-0.1060147, 1.209746, 1.013062, 1, 1, 1, 1, 1,
-0.1013541, -1.524194, -3.22075, 1, 1, 1, 1, 1,
-0.1003359, 0.7395723, -0.4884226, 1, 1, 1, 1, 1,
-0.09585814, -0.8563622, -4.379336, 1, 1, 1, 1, 1,
-0.09447951, 1.393786, -0.1650628, 1, 1, 1, 1, 1,
-0.09436107, 0.3497386, 0.06398898, 1, 1, 1, 1, 1,
-0.09369693, -0.8260595, -3.0203, 1, 1, 1, 1, 1,
-0.09228872, 0.1071674, -2.574038, 1, 1, 1, 1, 1,
-0.09110209, 0.7991634, 0.1558623, 1, 1, 1, 1, 1,
-0.08746561, 0.2405069, 0.6961313, 1, 1, 1, 1, 1,
-0.08229548, -0.3678912, -1.815472, 1, 1, 1, 1, 1,
-0.07902887, 0.701734, -0.06280086, 1, 1, 1, 1, 1,
-0.07636761, 0.8679099, -0.05023869, 1, 1, 1, 1, 1,
-0.07556333, 0.09024643, -1.333889, 1, 1, 1, 1, 1,
-0.07308659, -0.9550824, -2.553545, 0, 0, 1, 1, 1,
-0.07232003, 1.103509, -0.149427, 1, 0, 0, 1, 1,
-0.06933644, 0.3152895, 0.4951307, 1, 0, 0, 1, 1,
-0.06079553, 0.5069289, -1.80189, 1, 0, 0, 1, 1,
-0.05989756, -1.127912, -3.799238, 1, 0, 0, 1, 1,
-0.05715485, -0.3302948, -4.484739, 1, 0, 0, 1, 1,
-0.0531978, 0.1806185, -0.2483858, 0, 0, 0, 1, 1,
-0.050779, -0.8420204, -2.135404, 0, 0, 0, 1, 1,
-0.03979548, -0.7427683, -1.961604, 0, 0, 0, 1, 1,
-0.03753424, -0.3615631, -1.4873, 0, 0, 0, 1, 1,
-0.03573678, 2.764467, -0.2819996, 0, 0, 0, 1, 1,
-0.03490797, 0.9444296, -0.5069731, 0, 0, 0, 1, 1,
-0.03271445, -1.060718, -3.747859, 0, 0, 0, 1, 1,
-0.0324388, 0.5839875, -0.4397283, 1, 1, 1, 1, 1,
-0.02734294, 2.463985, -0.6086972, 1, 1, 1, 1, 1,
-0.0257774, -0.1901406, -4.184424, 1, 1, 1, 1, 1,
-0.01831852, 0.413181, -0.5581253, 1, 1, 1, 1, 1,
-0.01645564, 1.081414, -0.8709954, 1, 1, 1, 1, 1,
-0.01642299, -0.6687327, -3.418901, 1, 1, 1, 1, 1,
-0.01486612, 2.042242, 0.7677099, 1, 1, 1, 1, 1,
-0.0141196, 3.178757, 0.4630258, 1, 1, 1, 1, 1,
-0.004843671, 0.06475258, -1.428451, 1, 1, 1, 1, 1,
0.0008872813, -0.03722577, 1.799482, 1, 1, 1, 1, 1,
0.002480911, 0.2888905, 2.36479, 1, 1, 1, 1, 1,
0.002904223, 0.221745, -0.2846735, 1, 1, 1, 1, 1,
0.003667793, -0.1514227, 3.777532, 1, 1, 1, 1, 1,
0.004589305, 0.258903, 1.023422, 1, 1, 1, 1, 1,
0.005435665, -1.615579, 4.646565, 1, 1, 1, 1, 1,
0.006921571, -1.174331, 2.517208, 0, 0, 1, 1, 1,
0.007057262, -0.2184707, 1.716622, 1, 0, 0, 1, 1,
0.01037125, -0.07159521, 1.930161, 1, 0, 0, 1, 1,
0.01336451, -0.681156, 2.508109, 1, 0, 0, 1, 1,
0.01826388, -1.114989, 2.926056, 1, 0, 0, 1, 1,
0.02893701, 0.6869411, -0.2864822, 1, 0, 0, 1, 1,
0.03256532, -0.7150272, 2.845087, 0, 0, 0, 1, 1,
0.03307438, -0.1931805, 3.244553, 0, 0, 0, 1, 1,
0.03648708, -0.4206253, 3.702843, 0, 0, 0, 1, 1,
0.03825552, -0.5374051, 3.453562, 0, 0, 0, 1, 1,
0.04171436, -0.7453864, 3.789684, 0, 0, 0, 1, 1,
0.04235489, 0.5615133, -1.35774, 0, 0, 0, 1, 1,
0.04392039, -0.9131273, 2.608798, 0, 0, 0, 1, 1,
0.04396857, 0.01478556, 1.105866, 1, 1, 1, 1, 1,
0.04848945, -0.08825818, 3.387111, 1, 1, 1, 1, 1,
0.05154895, -1.388987, 2.779304, 1, 1, 1, 1, 1,
0.05224911, 1.659086, -0.9308483, 1, 1, 1, 1, 1,
0.05322243, -0.9656682, 3.073856, 1, 1, 1, 1, 1,
0.0596525, 1.008158, 0.7377988, 1, 1, 1, 1, 1,
0.06239024, 0.5418551, 1.896192, 1, 1, 1, 1, 1,
0.06239728, 0.1394773, 0.8127498, 1, 1, 1, 1, 1,
0.06577028, -0.710031, 2.850957, 1, 1, 1, 1, 1,
0.07083055, -1.266355, 1.888333, 1, 1, 1, 1, 1,
0.07096776, 1.624287, 0.8062213, 1, 1, 1, 1, 1,
0.07224553, -2.592795, 4.299507, 1, 1, 1, 1, 1,
0.07243741, 2.103086, -1.490675, 1, 1, 1, 1, 1,
0.0775943, 0.04595512, 1.783758, 1, 1, 1, 1, 1,
0.08063459, -0.1159125, 2.889928, 1, 1, 1, 1, 1,
0.08197527, -0.7123788, 2.488688, 0, 0, 1, 1, 1,
0.08537279, -1.325744, 0.9643778, 1, 0, 0, 1, 1,
0.09233788, -1.475421, 4.08559, 1, 0, 0, 1, 1,
0.0942735, -0.9269821, 3.881406, 1, 0, 0, 1, 1,
0.09608213, 0.2309825, -0.3108164, 1, 0, 0, 1, 1,
0.09742439, 1.51744, -1.311639, 1, 0, 0, 1, 1,
0.09963019, -0.3754641, 1.961716, 0, 0, 0, 1, 1,
0.1021048, 0.5834582, 0.7350998, 0, 0, 0, 1, 1,
0.1053812, -0.6574987, 3.273347, 0, 0, 0, 1, 1,
0.1117184, -2.13901, 4.243882, 0, 0, 0, 1, 1,
0.1148741, -0.2937118, 3.445504, 0, 0, 0, 1, 1,
0.1187958, 0.269786, 0.7346762, 0, 0, 0, 1, 1,
0.1190769, -0.2992091, 1.764515, 0, 0, 0, 1, 1,
0.1203233, -1.374095, 2.732763, 1, 1, 1, 1, 1,
0.1278873, -0.4213445, 1.568242, 1, 1, 1, 1, 1,
0.1314937, -0.2859175, 3.816915, 1, 1, 1, 1, 1,
0.132752, 0.3179233, -0.5609351, 1, 1, 1, 1, 1,
0.1334175, 0.175901, 0.5029691, 1, 1, 1, 1, 1,
0.1349273, 0.4885358, 0.8360639, 1, 1, 1, 1, 1,
0.1369554, 0.293818, 2.104033, 1, 1, 1, 1, 1,
0.1381239, -2.212264, 2.999624, 1, 1, 1, 1, 1,
0.1402453, 0.03766818, 1.774367, 1, 1, 1, 1, 1,
0.1403836, 0.3787694, 1.136818, 1, 1, 1, 1, 1,
0.1441723, -0.8609285, 4.797683, 1, 1, 1, 1, 1,
0.1475855, 1.494296, -0.08649958, 1, 1, 1, 1, 1,
0.148671, -0.7551615, 3.265916, 1, 1, 1, 1, 1,
0.1505913, -1.374769, 3.373716, 1, 1, 1, 1, 1,
0.1535614, -1.12734, 2.955627, 1, 1, 1, 1, 1,
0.1555988, -1.313004, 3.143062, 0, 0, 1, 1, 1,
0.1565816, 0.3937517, 0.4619718, 1, 0, 0, 1, 1,
0.1585314, 0.7032906, -1.047128, 1, 0, 0, 1, 1,
0.1627671, -0.393965, 3.152858, 1, 0, 0, 1, 1,
0.1658366, -0.840095, 2.805475, 1, 0, 0, 1, 1,
0.1677772, -0.4951775, 3.273979, 1, 0, 0, 1, 1,
0.1683504, -0.3284449, 3.146083, 0, 0, 0, 1, 1,
0.168846, -0.8266761, 3.048227, 0, 0, 0, 1, 1,
0.174868, 0.6917952, 0.2299431, 0, 0, 0, 1, 1,
0.1802157, -0.5084806, 4.206772, 0, 0, 0, 1, 1,
0.1840194, -1.317096, 4.433005, 0, 0, 0, 1, 1,
0.190834, 0.05570585, 2.301022, 0, 0, 0, 1, 1,
0.1958311, -0.5446685, 2.335928, 0, 0, 0, 1, 1,
0.198352, -0.9922174, 3.832451, 1, 1, 1, 1, 1,
0.2001305, -2.486101, 4.012195, 1, 1, 1, 1, 1,
0.203167, 0.8729347, -0.2311403, 1, 1, 1, 1, 1,
0.2033321, -1.513795, 2.092092, 1, 1, 1, 1, 1,
0.2087699, -0.04501029, 1.285124, 1, 1, 1, 1, 1,
0.209231, -1.055769, 2.765535, 1, 1, 1, 1, 1,
0.210196, -0.4060708, 3.655344, 1, 1, 1, 1, 1,
0.2112785, -1.960104, 2.823014, 1, 1, 1, 1, 1,
0.2152264, -1.222038, 2.759703, 1, 1, 1, 1, 1,
0.2152779, 0.06573147, -0.4613965, 1, 1, 1, 1, 1,
0.2175826, -1.74361, 2.475441, 1, 1, 1, 1, 1,
0.2183627, -0.5452006, 4.469316, 1, 1, 1, 1, 1,
0.2220504, 1.608241, 0.04644486, 1, 1, 1, 1, 1,
0.2223286, 0.6553462, -0.2580239, 1, 1, 1, 1, 1,
0.2233491, -0.04369396, 0.843513, 1, 1, 1, 1, 1,
0.2263087, 0.3013376, 0.8296988, 0, 0, 1, 1, 1,
0.2296073, -1.51457, 3.183918, 1, 0, 0, 1, 1,
0.2301511, 0.7385054, 1.601177, 1, 0, 0, 1, 1,
0.2362646, 1.983485, -1.287072, 1, 0, 0, 1, 1,
0.2363135, -0.3743653, 2.32916, 1, 0, 0, 1, 1,
0.2378626, 1.671126, -0.1061918, 1, 0, 0, 1, 1,
0.2405654, -0.9265951, 3.875047, 0, 0, 0, 1, 1,
0.242577, -1.783689, 3.369771, 0, 0, 0, 1, 1,
0.2430842, -0.08669706, 1.504622, 0, 0, 0, 1, 1,
0.2452247, 0.5308822, 0.3837977, 0, 0, 0, 1, 1,
0.2458466, 1.143844, -0.2601026, 0, 0, 0, 1, 1,
0.248573, 0.6193036, 0.2201734, 0, 0, 0, 1, 1,
0.2497165, 0.01091182, 1.630055, 0, 0, 0, 1, 1,
0.2501397, -0.2615848, 2.869304, 1, 1, 1, 1, 1,
0.2555138, -1.130835, 2.715156, 1, 1, 1, 1, 1,
0.256811, 0.08658502, 1.183718, 1, 1, 1, 1, 1,
0.2592076, 1.27866, -0.7149072, 1, 1, 1, 1, 1,
0.2616561, -0.3268702, 3.0437, 1, 1, 1, 1, 1,
0.2659984, 0.00671559, 0.0310306, 1, 1, 1, 1, 1,
0.2805112, 0.5842637, -0.003429222, 1, 1, 1, 1, 1,
0.2836273, 1.703969, -0.8455457, 1, 1, 1, 1, 1,
0.2837985, 2.556057, 0.5775591, 1, 1, 1, 1, 1,
0.285975, 1.485041, -1.133085, 1, 1, 1, 1, 1,
0.2876554, -1.720403, 4.332853, 1, 1, 1, 1, 1,
0.2965457, 1.585309, 1.086182, 1, 1, 1, 1, 1,
0.2973848, -0.6887166, 1.654849, 1, 1, 1, 1, 1,
0.3040698, -1.082974, 3.06279, 1, 1, 1, 1, 1,
0.3055543, 0.6173149, 1.559219, 1, 1, 1, 1, 1,
0.3078631, -0.6801735, 0.9452129, 0, 0, 1, 1, 1,
0.3108643, 1.50034, 0.9528859, 1, 0, 0, 1, 1,
0.3120853, 0.4800023, 0.8621166, 1, 0, 0, 1, 1,
0.3141872, -0.8117791, 2.924445, 1, 0, 0, 1, 1,
0.3166259, -0.7905997, 2.050128, 1, 0, 0, 1, 1,
0.3200487, -0.0307479, 0.7849882, 1, 0, 0, 1, 1,
0.3267024, -0.1832822, 2.64239, 0, 0, 0, 1, 1,
0.3286557, 1.011984, 0.3699344, 0, 0, 0, 1, 1,
0.3337682, 0.9487548, 0.7946844, 0, 0, 0, 1, 1,
0.3338497, 0.2988658, 0.886654, 0, 0, 0, 1, 1,
0.3346514, 1.303812, 0.4839043, 0, 0, 0, 1, 1,
0.33544, -0.06808446, 3.593012, 0, 0, 0, 1, 1,
0.3409367, -0.2891384, 2.762858, 0, 0, 0, 1, 1,
0.3410799, -0.3406114, 0.635823, 1, 1, 1, 1, 1,
0.3422191, 0.5457117, 0.3061273, 1, 1, 1, 1, 1,
0.3445432, 0.2916321, 1.154549, 1, 1, 1, 1, 1,
0.3449429, 0.2572857, 0.001040439, 1, 1, 1, 1, 1,
0.3455029, 0.9444355, 0.1615924, 1, 1, 1, 1, 1,
0.3472033, -0.8524215, 1.811906, 1, 1, 1, 1, 1,
0.3506959, -1.039184, 3.14572, 1, 1, 1, 1, 1,
0.3590132, -0.5276373, 1.696074, 1, 1, 1, 1, 1,
0.3625591, 0.5435193, 1.51589, 1, 1, 1, 1, 1,
0.3672077, 0.075068, 1.555854, 1, 1, 1, 1, 1,
0.3677928, -1.010404, 2.526762, 1, 1, 1, 1, 1,
0.3679185, -0.5117626, 2.617034, 1, 1, 1, 1, 1,
0.3679957, 1.45367, 0.7354499, 1, 1, 1, 1, 1,
0.3720183, 0.1793056, 1.957096, 1, 1, 1, 1, 1,
0.3773417, 0.2933004, -1.073368, 1, 1, 1, 1, 1,
0.3820995, 0.1009734, 1.126932, 0, 0, 1, 1, 1,
0.3853533, -0.9768819, 3.838928, 1, 0, 0, 1, 1,
0.3863029, -2.188955, 2.240877, 1, 0, 0, 1, 1,
0.3983119, -0.6878679, 2.920455, 1, 0, 0, 1, 1,
0.4033578, 1.547256, 0.6014996, 1, 0, 0, 1, 1,
0.4035757, 1.173508, 0.5680404, 1, 0, 0, 1, 1,
0.4048817, 0.686686, -0.2948145, 0, 0, 0, 1, 1,
0.4053175, -1.593833, 3.340317, 0, 0, 0, 1, 1,
0.4053462, -1.104263, 2.575055, 0, 0, 0, 1, 1,
0.4072723, 1.329665, -0.3994715, 0, 0, 0, 1, 1,
0.4073237, 0.4051844, -0.3647214, 0, 0, 0, 1, 1,
0.4096583, 0.1922577, 0.8575467, 0, 0, 0, 1, 1,
0.4104846, 1.570938, -0.2601634, 0, 0, 0, 1, 1,
0.4125844, 0.1003202, 3.009747, 1, 1, 1, 1, 1,
0.4128477, 1.251063, -0.07089639, 1, 1, 1, 1, 1,
0.4133553, -1.674218, 3.171643, 1, 1, 1, 1, 1,
0.414225, -0.1182692, 1.545237, 1, 1, 1, 1, 1,
0.4150586, -1.16083, 1.979294, 1, 1, 1, 1, 1,
0.4154874, -0.2217418, 0.9651406, 1, 1, 1, 1, 1,
0.4161155, 2.409647, -0.2280293, 1, 1, 1, 1, 1,
0.4194603, 0.8928159, 0.03549425, 1, 1, 1, 1, 1,
0.4222618, 3.097494, 1.956348, 1, 1, 1, 1, 1,
0.4258436, -0.9003354, 1.198773, 1, 1, 1, 1, 1,
0.4261297, -2.112822, 2.456884, 1, 1, 1, 1, 1,
0.4284422, 0.6160067, 1.688852, 1, 1, 1, 1, 1,
0.4284783, -0.05654741, 2.784703, 1, 1, 1, 1, 1,
0.4330949, -1.123932, 3.586624, 1, 1, 1, 1, 1,
0.4355653, 1.95335, 0.8005854, 1, 1, 1, 1, 1,
0.4377396, -0.6806055, 2.352731, 0, 0, 1, 1, 1,
0.4380082, 0.7054451, -0.8261868, 1, 0, 0, 1, 1,
0.4384332, -0.5210134, 1.898811, 1, 0, 0, 1, 1,
0.4396268, 0.2162331, -0.2955526, 1, 0, 0, 1, 1,
0.443605, -0.550145, 0.8551846, 1, 0, 0, 1, 1,
0.4457763, -1.832301, 2.00204, 1, 0, 0, 1, 1,
0.4500492, 1.625513, -0.2334739, 0, 0, 0, 1, 1,
0.4507252, 1.425222, -0.587689, 0, 0, 0, 1, 1,
0.4517012, -0.8352547, 2.148112, 0, 0, 0, 1, 1,
0.4537492, -0.9167978, 2.301559, 0, 0, 0, 1, 1,
0.4540102, -1.25304, 1.71783, 0, 0, 0, 1, 1,
0.4567364, -0.3215387, 3.275706, 0, 0, 0, 1, 1,
0.4596749, -0.04388002, 1.921685, 0, 0, 0, 1, 1,
0.4624645, -0.5832044, 1.726014, 1, 1, 1, 1, 1,
0.4634195, -0.2730671, 1.176788, 1, 1, 1, 1, 1,
0.4671622, -0.06757376, 2.95996, 1, 1, 1, 1, 1,
0.4691059, -0.6499157, 2.902278, 1, 1, 1, 1, 1,
0.4740565, -0.2219952, 0.1677881, 1, 1, 1, 1, 1,
0.481871, -0.2948942, 1.478413, 1, 1, 1, 1, 1,
0.4848995, -0.04551125, 1.858349, 1, 1, 1, 1, 1,
0.4867228, 2.34585, 1.140748, 1, 1, 1, 1, 1,
0.4877336, 0.9611789, -0.2088175, 1, 1, 1, 1, 1,
0.4878186, -1.754762, 0.4367073, 1, 1, 1, 1, 1,
0.5040535, -0.6666851, 1.712198, 1, 1, 1, 1, 1,
0.5041122, 0.5021278, 2.092809, 1, 1, 1, 1, 1,
0.5055527, 0.2972346, 0.833989, 1, 1, 1, 1, 1,
0.5093274, -0.6206017, 3.484192, 1, 1, 1, 1, 1,
0.5137064, -2.2635, 2.498977, 1, 1, 1, 1, 1,
0.5151046, 1.161184, -1.01897, 0, 0, 1, 1, 1,
0.5190483, -0.1221785, 2.616314, 1, 0, 0, 1, 1,
0.5219064, 1.061685, -0.3991327, 1, 0, 0, 1, 1,
0.5224603, 0.3952443, 0.6670683, 1, 0, 0, 1, 1,
0.5225785, 0.2177718, 3.80757, 1, 0, 0, 1, 1,
0.5274, -0.4447552, 2.693401, 1, 0, 0, 1, 1,
0.5281715, 1.022812, 2.892933, 0, 0, 0, 1, 1,
0.5282168, -0.07929181, 3.930251, 0, 0, 0, 1, 1,
0.5334896, -0.5050726, 2.575301, 0, 0, 0, 1, 1,
0.5370747, -0.3185458, 0.9984555, 0, 0, 0, 1, 1,
0.542527, 0.04454434, 2.36459, 0, 0, 0, 1, 1,
0.5447456, -0.3070743, -0.2524795, 0, 0, 0, 1, 1,
0.5458598, -0.8294067, 3.244916, 0, 0, 0, 1, 1,
0.5497519, -0.62931, 2.255373, 1, 1, 1, 1, 1,
0.5515146, 0.6047123, 1.885259, 1, 1, 1, 1, 1,
0.5523679, 0.8677883, 0.7720241, 1, 1, 1, 1, 1,
0.5533558, 0.4467071, -0.6163268, 1, 1, 1, 1, 1,
0.5601486, 1.492664, 0.7789807, 1, 1, 1, 1, 1,
0.5631207, -0.03453177, 1.706253, 1, 1, 1, 1, 1,
0.5642111, 0.000972293, 1.055609, 1, 1, 1, 1, 1,
0.564449, -0.3007054, -0.6650754, 1, 1, 1, 1, 1,
0.5658662, -1.008371, 2.380558, 1, 1, 1, 1, 1,
0.56627, 1.384773, 2.029111, 1, 1, 1, 1, 1,
0.5756789, -0.9880505, 2.852563, 1, 1, 1, 1, 1,
0.5793569, 1.280533, -1.037328, 1, 1, 1, 1, 1,
0.5900607, -1.16724, 1.010745, 1, 1, 1, 1, 1,
0.5904185, -0.3641934, 5.456718, 1, 1, 1, 1, 1,
0.5962338, 0.2541621, 0.9725193, 1, 1, 1, 1, 1,
0.5983519, 2.160909, -0.2432164, 0, 0, 1, 1, 1,
0.5994446, 0.1625312, 2.114582, 1, 0, 0, 1, 1,
0.6079483, -1.959501, 0.5617465, 1, 0, 0, 1, 1,
0.617637, 1.706309, 0.5848431, 1, 0, 0, 1, 1,
0.6215234, -0.5238125, 4.151456, 1, 0, 0, 1, 1,
0.6216342, 0.1805477, 3.334987, 1, 0, 0, 1, 1,
0.6248701, 1.094661, 0.559922, 0, 0, 0, 1, 1,
0.6328664, 0.167896, -0.9703907, 0, 0, 0, 1, 1,
0.6337885, -0.2316181, 2.193083, 0, 0, 0, 1, 1,
0.6367775, 0.263024, 1.634334, 0, 0, 0, 1, 1,
0.6380039, 0.1166958, 2.301863, 0, 0, 0, 1, 1,
0.6418406, -0.2203468, 2.458092, 0, 0, 0, 1, 1,
0.6494802, -0.7300224, 3.842627, 0, 0, 0, 1, 1,
0.6533453, 2.039713, 0.4934955, 1, 1, 1, 1, 1,
0.6611866, 1.707784, 0.1254733, 1, 1, 1, 1, 1,
0.663258, 1.075415, 1.256995, 1, 1, 1, 1, 1,
0.6713445, 0.1229571, -0.2353183, 1, 1, 1, 1, 1,
0.6727008, 0.01060687, 1.878812, 1, 1, 1, 1, 1,
0.6727462, -1.143795, 1.475055, 1, 1, 1, 1, 1,
0.6760387, -1.235109, 1.773697, 1, 1, 1, 1, 1,
0.6771543, -0.4580596, 1.052933, 1, 1, 1, 1, 1,
0.6784404, 1.573853, 0.6580901, 1, 1, 1, 1, 1,
0.6842943, -0.5726566, 3.119754, 1, 1, 1, 1, 1,
0.6932772, 0.1719143, 2.388274, 1, 1, 1, 1, 1,
0.6946092, -0.07319201, 1.820689, 1, 1, 1, 1, 1,
0.7055519, 0.7139644, 1.03022, 1, 1, 1, 1, 1,
0.7069505, -0.4603309, 3.524477, 1, 1, 1, 1, 1,
0.7163692, -0.1965021, 1.345262, 1, 1, 1, 1, 1,
0.7251445, -0.4343513, 2.975401, 0, 0, 1, 1, 1,
0.7258248, -0.3894486, 1.920704, 1, 0, 0, 1, 1,
0.7269925, -2.109052, 0.6640103, 1, 0, 0, 1, 1,
0.7318851, 0.3195224, 0.9599856, 1, 0, 0, 1, 1,
0.7336055, 0.2959954, -0.5168896, 1, 0, 0, 1, 1,
0.7344727, -1.051485, 1.197894, 1, 0, 0, 1, 1,
0.7380038, -0.1874747, 1.280054, 0, 0, 0, 1, 1,
0.746828, -2.201584, 3.138503, 0, 0, 0, 1, 1,
0.7487204, 0.07570173, 2.232654, 0, 0, 0, 1, 1,
0.7515579, 1.379415, -0.650106, 0, 0, 0, 1, 1,
0.7519605, -0.5001476, 1.277317, 0, 0, 0, 1, 1,
0.7519742, -0.5900793, 1.892662, 0, 0, 0, 1, 1,
0.7559147, -1.604393, 2.312178, 0, 0, 0, 1, 1,
0.7575287, -0.1586996, 1.864244, 1, 1, 1, 1, 1,
0.7586464, 1.893897, -0.4053133, 1, 1, 1, 1, 1,
0.7606097, -0.7187545, 1.544698, 1, 1, 1, 1, 1,
0.7606105, -0.485219, 0.2452839, 1, 1, 1, 1, 1,
0.7633326, -0.6936185, 1.415966, 1, 1, 1, 1, 1,
0.7730328, 1.363555, 1.506736, 1, 1, 1, 1, 1,
0.7771299, -0.9753126, 2.279132, 1, 1, 1, 1, 1,
0.7783638, 0.9252864, 0.8959191, 1, 1, 1, 1, 1,
0.7906944, 0.6131079, 0.1500361, 1, 1, 1, 1, 1,
0.7919548, 0.8522281, 0.8129788, 1, 1, 1, 1, 1,
0.7964658, -1.467597, 1.840297, 1, 1, 1, 1, 1,
0.7994586, -1.031478, 1.349173, 1, 1, 1, 1, 1,
0.8022483, 0.5969993, 1.528165, 1, 1, 1, 1, 1,
0.8041307, -0.1634895, 1.947888, 1, 1, 1, 1, 1,
0.8043138, -0.5395668, 2.536596, 1, 1, 1, 1, 1,
0.8076062, 0.9913673, 0.2876078, 0, 0, 1, 1, 1,
0.8080081, -0.9284664, 2.518589, 1, 0, 0, 1, 1,
0.8081592, -0.3870884, 1.081406, 1, 0, 0, 1, 1,
0.8081716, 0.553023, 1.793529, 1, 0, 0, 1, 1,
0.8094018, 0.949232, 1.893114, 1, 0, 0, 1, 1,
0.8111285, 0.1191986, -0.06472492, 1, 0, 0, 1, 1,
0.813836, 0.4072134, 1.603635, 0, 0, 0, 1, 1,
0.8240883, -0.7886444, 2.593494, 0, 0, 0, 1, 1,
0.8269824, -0.09559934, 1.573221, 0, 0, 0, 1, 1,
0.8285317, 1.812325, 0.3380553, 0, 0, 0, 1, 1,
0.8454195, 0.7325186, 1.61063, 0, 0, 0, 1, 1,
0.8465956, -0.01745796, 2.05919, 0, 0, 0, 1, 1,
0.8479514, 1.092749, -0.4561513, 0, 0, 0, 1, 1,
0.8506454, -0.6207405, 1.94793, 1, 1, 1, 1, 1,
0.8526018, -1.681788, 2.009998, 1, 1, 1, 1, 1,
0.8672431, 0.4478271, 2.400267, 1, 1, 1, 1, 1,
0.8782065, -1.945906, 3.842664, 1, 1, 1, 1, 1,
0.8884338, 0.02423459, 1.136641, 1, 1, 1, 1, 1,
0.8895981, -0.219421, 3.333442, 1, 1, 1, 1, 1,
0.8911955, -0.1158416, 3.944174, 1, 1, 1, 1, 1,
0.8923628, 0.1299516, 2.437623, 1, 1, 1, 1, 1,
0.9011685, 0.7815769, 0.5926684, 1, 1, 1, 1, 1,
0.9080555, 0.4028356, 1.325409, 1, 1, 1, 1, 1,
0.9085693, -0.5697741, 0.08710071, 1, 1, 1, 1, 1,
0.9171774, -1.086704, 1.363368, 1, 1, 1, 1, 1,
0.9210467, -0.3207243, 2.58347, 1, 1, 1, 1, 1,
0.9252471, -1.184286, 2.050185, 1, 1, 1, 1, 1,
0.9312139, -0.6161425, 1.24018, 1, 1, 1, 1, 1,
0.9337589, -0.6700122, 1.711537, 0, 0, 1, 1, 1,
0.9353852, -0.1158764, 2.323427, 1, 0, 0, 1, 1,
0.9357918, -0.02291236, 3.245862, 1, 0, 0, 1, 1,
0.9369958, 0.8613684, 0.007680089, 1, 0, 0, 1, 1,
0.9534029, 1.30553, 1.407195, 1, 0, 0, 1, 1,
0.9536871, -1.211551, 2.413134, 1, 0, 0, 1, 1,
0.9558468, 0.8079038, 0.3274593, 0, 0, 0, 1, 1,
0.9561278, -0.66526, 2.080867, 0, 0, 0, 1, 1,
0.9608693, 0.71658, 0.1716375, 0, 0, 0, 1, 1,
0.9610991, 0.7649428, 2.182745, 0, 0, 0, 1, 1,
0.9641213, -0.4285478, 2.992465, 0, 0, 0, 1, 1,
0.9653674, -0.2798536, 1.646927, 0, 0, 0, 1, 1,
0.9789668, 0.03570842, 3.26805, 0, 0, 0, 1, 1,
0.9799505, 1.891029, 1.289228, 1, 1, 1, 1, 1,
0.9800443, -0.3561344, 2.30048, 1, 1, 1, 1, 1,
0.9821333, -1.032815, 2.194403, 1, 1, 1, 1, 1,
0.9842181, 0.2595129, 0.4587993, 1, 1, 1, 1, 1,
0.9927394, 0.3380111, 0.7389693, 1, 1, 1, 1, 1,
0.9948793, 0.3585997, 1.151799, 1, 1, 1, 1, 1,
0.9969034, 0.4226658, 1.028969, 1, 1, 1, 1, 1,
1.007197, -0.9845394, 2.643219, 1, 1, 1, 1, 1,
1.01084, 0.3114721, 0.5181205, 1, 1, 1, 1, 1,
1.012298, -0.6796876, 1.801843, 1, 1, 1, 1, 1,
1.014942, 0.7970646, -0.409086, 1, 1, 1, 1, 1,
1.018113, -2.351362, 3.193386, 1, 1, 1, 1, 1,
1.018867, 0.5152257, 1.239553, 1, 1, 1, 1, 1,
1.021194, -0.8265973, 2.580361, 1, 1, 1, 1, 1,
1.0252, -0.1118664, 0.331482, 1, 1, 1, 1, 1,
1.026938, -1.086789, 2.296764, 0, 0, 1, 1, 1,
1.042246, -0.4764659, 2.553733, 1, 0, 0, 1, 1,
1.04277, -0.6289887, 0.9674802, 1, 0, 0, 1, 1,
1.042967, -0.760159, 2.244836, 1, 0, 0, 1, 1,
1.045459, 0.09908994, 1.887723, 1, 0, 0, 1, 1,
1.050689, -0.6311905, -0.3046817, 1, 0, 0, 1, 1,
1.054867, -0.06969441, 0.681721, 0, 0, 0, 1, 1,
1.055698, -0.4703407, 2.789135, 0, 0, 0, 1, 1,
1.065325, -0.009293471, 0.8515184, 0, 0, 0, 1, 1,
1.0682, -1.623075, 2.842497, 0, 0, 0, 1, 1,
1.071279, -2.457365, 3.317569, 0, 0, 0, 1, 1,
1.0763, -1.664684, 1.892302, 0, 0, 0, 1, 1,
1.076592, -0.2372184, 1.240716, 0, 0, 0, 1, 1,
1.077684, -1.987063, 1.352133, 1, 1, 1, 1, 1,
1.079931, -1.212813, 1.183063, 1, 1, 1, 1, 1,
1.082829, -0.3397816, 1.291586, 1, 1, 1, 1, 1,
1.085655, 0.5377355, 2.403409, 1, 1, 1, 1, 1,
1.092332, 0.6083872, 2.807873, 1, 1, 1, 1, 1,
1.092369, 0.1175758, 0.1336149, 1, 1, 1, 1, 1,
1.095652, -1.023214, 4.068864, 1, 1, 1, 1, 1,
1.096681, 1.505729, 1.002983, 1, 1, 1, 1, 1,
1.104665, -0.2854411, 3.437469, 1, 1, 1, 1, 1,
1.106496, 0.7989104, 0.01947779, 1, 1, 1, 1, 1,
1.10674, -0.09606393, 0.6507199, 1, 1, 1, 1, 1,
1.110119, 1.187652, -0.03809147, 1, 1, 1, 1, 1,
1.118435, -1.98625, 1.311156, 1, 1, 1, 1, 1,
1.124274, 1.119362, 2.306902, 1, 1, 1, 1, 1,
1.125257, -1.684523, 1.332611, 1, 1, 1, 1, 1,
1.128348, 1.020413, 1.340939, 0, 0, 1, 1, 1,
1.129296, 0.4595071, -0.1212105, 1, 0, 0, 1, 1,
1.132254, -1.224812, 3.423444, 1, 0, 0, 1, 1,
1.141617, -0.3838123, 1.529157, 1, 0, 0, 1, 1,
1.149283, -0.07682965, 0.5900109, 1, 0, 0, 1, 1,
1.150164, -0.1289499, 3.537092, 1, 0, 0, 1, 1,
1.150365, -0.315628, 3.186955, 0, 0, 0, 1, 1,
1.15153, 1.275787, -0.6310408, 0, 0, 0, 1, 1,
1.152274, 1.486103, 0.3112312, 0, 0, 0, 1, 1,
1.163434, 0.321519, 1.982782, 0, 0, 0, 1, 1,
1.165535, -1.113232, 0.6242341, 0, 0, 0, 1, 1,
1.169412, -2.17293, 2.574492, 0, 0, 0, 1, 1,
1.176401, -1.17799, 1.91914, 0, 0, 0, 1, 1,
1.178757, 0.251934, 0.3291796, 1, 1, 1, 1, 1,
1.179411, 2.049743, -0.585532, 1, 1, 1, 1, 1,
1.180333, 1.44891, 0.1122018, 1, 1, 1, 1, 1,
1.181029, 1.598119, 1.25078, 1, 1, 1, 1, 1,
1.188021, -0.4328664, -0.9671981, 1, 1, 1, 1, 1,
1.193029, -2.385582, 2.100707, 1, 1, 1, 1, 1,
1.201363, 0.2164981, 3.344431, 1, 1, 1, 1, 1,
1.208406, 1.592558, 0.9061066, 1, 1, 1, 1, 1,
1.214308, -1.250409, 3.567176, 1, 1, 1, 1, 1,
1.222011, -1.042364, 1.499045, 1, 1, 1, 1, 1,
1.227741, -1.464402, 3.00243, 1, 1, 1, 1, 1,
1.228505, -0.2467248, 1.891992, 1, 1, 1, 1, 1,
1.229632, 0.0983057, 1.343526, 1, 1, 1, 1, 1,
1.23284, -2.214748, 2.394321, 1, 1, 1, 1, 1,
1.2379, 0.4607651, 0.6091092, 1, 1, 1, 1, 1,
1.25228, 0.9602641, 1.511531, 0, 0, 1, 1, 1,
1.259087, 1.058357, 2.557772, 1, 0, 0, 1, 1,
1.261346, -1.603601, 2.245853, 1, 0, 0, 1, 1,
1.278312, -0.05260123, 3.093652, 1, 0, 0, 1, 1,
1.288788, -0.5411722, 1.612445, 1, 0, 0, 1, 1,
1.294883, 0.4763704, 0.1950145, 1, 0, 0, 1, 1,
1.296997, -0.9039651, 0.4974796, 0, 0, 0, 1, 1,
1.311257, -1.241455, 4.435723, 0, 0, 0, 1, 1,
1.313774, 0.4037073, 1.669701, 0, 0, 0, 1, 1,
1.314094, -0.1138181, 1.443175, 0, 0, 0, 1, 1,
1.328535, 0.7974102, 1.65199, 0, 0, 0, 1, 1,
1.346882, 0.4194297, -0.1268277, 0, 0, 0, 1, 1,
1.355388, 0.01308651, 1.980922, 0, 0, 0, 1, 1,
1.363092, -1.242335, 1.023401, 1, 1, 1, 1, 1,
1.36849, -1.460873, 0.2727991, 1, 1, 1, 1, 1,
1.371186, -0.6559064, 3.110219, 1, 1, 1, 1, 1,
1.377717, -2.140528, 3.241108, 1, 1, 1, 1, 1,
1.382763, -1.375725, 0.7623152, 1, 1, 1, 1, 1,
1.386824, -1.569396, 3.890109, 1, 1, 1, 1, 1,
1.394619, -0.6028131, 2.34504, 1, 1, 1, 1, 1,
1.395463, 0.7376867, 0.6141216, 1, 1, 1, 1, 1,
1.40272, -0.02220278, 1.348201, 1, 1, 1, 1, 1,
1.414695, -1.882673, 1.453165, 1, 1, 1, 1, 1,
1.42189, -0.7400441, 3.718014, 1, 1, 1, 1, 1,
1.422711, 0.6351575, 0.1744636, 1, 1, 1, 1, 1,
1.423177, 0.1685158, 1.122004, 1, 1, 1, 1, 1,
1.424136, 1.193927, 0.8540854, 1, 1, 1, 1, 1,
1.44556, -0.09690485, 2.539399, 1, 1, 1, 1, 1,
1.470433, -0.3468189, -0.2896708, 0, 0, 1, 1, 1,
1.48797, -0.06590482, 1.579195, 1, 0, 0, 1, 1,
1.504475, -0.06789259, 0.6922622, 1, 0, 0, 1, 1,
1.51423, -0.2452423, 3.137843, 1, 0, 0, 1, 1,
1.52779, 1.450511, 1.684527, 1, 0, 0, 1, 1,
1.53159, -0.6472546, 3.371238, 1, 0, 0, 1, 1,
1.555383, 0.2068151, 0.8783787, 0, 0, 0, 1, 1,
1.559599, 0.7811671, 1.641464, 0, 0, 0, 1, 1,
1.561635, 0.3804774, 0.4763177, 0, 0, 0, 1, 1,
1.565332, 0.3722205, 1.365559, 0, 0, 0, 1, 1,
1.567605, 0.602474, 0.1659648, 0, 0, 0, 1, 1,
1.567641, -1.223308, 4.332013, 0, 0, 0, 1, 1,
1.571462, 0.09370326, 0.732172, 0, 0, 0, 1, 1,
1.586153, 0.649057, 0.2143211, 1, 1, 1, 1, 1,
1.594304, -0.2766832, 1.504524, 1, 1, 1, 1, 1,
1.622042, 0.2560169, 2.800425, 1, 1, 1, 1, 1,
1.624682, 0.323382, 0.7362688, 1, 1, 1, 1, 1,
1.630093, 0.4421168, 1.803676, 1, 1, 1, 1, 1,
1.631663, -0.6242926, 2.711578, 1, 1, 1, 1, 1,
1.639556, -0.1806767, 0.009888962, 1, 1, 1, 1, 1,
1.646259, 0.3477151, 2.144148, 1, 1, 1, 1, 1,
1.651118, 0.4697322, -0.00365805, 1, 1, 1, 1, 1,
1.653421, -2.903727, 1.009961, 1, 1, 1, 1, 1,
1.663942, 0.1814761, 1.486527, 1, 1, 1, 1, 1,
1.685078, -0.4915019, 2.395802, 1, 1, 1, 1, 1,
1.708737, 0.9586564, -0.6580125, 1, 1, 1, 1, 1,
1.711953, -1.026157, 1.129166, 1, 1, 1, 1, 1,
1.715984, 0.03866933, 1.855197, 1, 1, 1, 1, 1,
1.735598, 0.3223925, 1.586043, 0, 0, 1, 1, 1,
1.755062, 0.3828404, 0.4189162, 1, 0, 0, 1, 1,
1.769833, -0.3970643, 1.866064, 1, 0, 0, 1, 1,
1.772035, -0.5712645, 1.125613, 1, 0, 0, 1, 1,
1.77466, -0.4269339, 1.637406, 1, 0, 0, 1, 1,
1.776877, 2.341306, 0.7474723, 1, 0, 0, 1, 1,
1.78624, -0.06437507, 2.27495, 0, 0, 0, 1, 1,
1.793499, 1.655686, 0.5498039, 0, 0, 0, 1, 1,
1.795533, -0.1045268, 2.448724, 0, 0, 0, 1, 1,
1.813279, -0.1882449, 1.187951, 0, 0, 0, 1, 1,
1.818764, 1.767861, 0.5855513, 0, 0, 0, 1, 1,
1.829761, 0.2080716, 3.173401, 0, 0, 0, 1, 1,
1.830347, -1.10461, 1.727314, 0, 0, 0, 1, 1,
1.834424, 0.9381203, 1.3633, 1, 1, 1, 1, 1,
1.8377, -1.101264, 0.450074, 1, 1, 1, 1, 1,
1.840526, 0.2793214, 2.111248, 1, 1, 1, 1, 1,
1.899501, -1.289449, 3.832927, 1, 1, 1, 1, 1,
1.908165, -1.415474, 3.466536, 1, 1, 1, 1, 1,
1.915027, 0.2249176, 1.610258, 1, 1, 1, 1, 1,
1.927093, -0.5267776, 2.587935, 1, 1, 1, 1, 1,
1.945625, 0.729131, 1.915696, 1, 1, 1, 1, 1,
2.021114, -1.62222, 3.066435, 1, 1, 1, 1, 1,
2.024845, 0.8918946, 1.606832, 1, 1, 1, 1, 1,
2.04303, 2.459678, -0.2544325, 1, 1, 1, 1, 1,
2.05375, 0.5035997, 0.1300405, 1, 1, 1, 1, 1,
2.073636, 0.1027754, 1.186157, 1, 1, 1, 1, 1,
2.088925, 1.971722, -0.06430183, 1, 1, 1, 1, 1,
2.089694, 0.3894793, 0.3880538, 1, 1, 1, 1, 1,
2.119544, 0.1680178, 0.7172394, 0, 0, 1, 1, 1,
2.193418, -1.414949, 0.5922315, 1, 0, 0, 1, 1,
2.197616, 1.87124, 1.491758, 1, 0, 0, 1, 1,
2.241573, 0.254536, 2.494012, 1, 0, 0, 1, 1,
2.249683, -1.145199, 3.050905, 1, 0, 0, 1, 1,
2.25035, 0.3614394, 0.8063942, 1, 0, 0, 1, 1,
2.253256, -1.045903, 1.674446, 0, 0, 0, 1, 1,
2.334107, -0.3028082, 1.037219, 0, 0, 0, 1, 1,
2.372865, -0.7592976, 0.1361795, 0, 0, 0, 1, 1,
2.429574, -1.137096, 3.213416, 0, 0, 0, 1, 1,
2.439681, 2.09952, -0.3961285, 0, 0, 0, 1, 1,
2.511104, -0.01642973, 0.2604946, 0, 0, 0, 1, 1,
2.559326, 0.1890986, 1.59384, 0, 0, 0, 1, 1,
2.627772, -1.597329, 2.054922, 1, 1, 1, 1, 1,
2.661721, -1.729452, 2.527699, 1, 1, 1, 1, 1,
2.829303, -0.4227042, 1.643137, 1, 1, 1, 1, 1,
2.932061, 0.5223624, 0.5580982, 1, 1, 1, 1, 1,
3.008942, -1.065314, 2.321012, 1, 1, 1, 1, 1,
3.309182, -0.04905817, 2.987398, 1, 1, 1, 1, 1,
3.427796, -0.8445618, 1.278951, 1, 1, 1, 1, 1
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
var radius = 9.756722;
var distance = 34.27007;
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
mvMatrix.translate( 0.01373649, -0.110243, 0.05422664 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27007);
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
