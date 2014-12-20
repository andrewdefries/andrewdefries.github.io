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
-3.621286, -0.5931726, -2.181132, 1, 0, 0, 1,
-3.119365, -0.5510858, -1.306691, 1, 0.007843138, 0, 1,
-2.829178, 1.6967, -1.938339, 1, 0.01176471, 0, 1,
-2.814074, 0.9155179, -2.063167, 1, 0.01960784, 0, 1,
-2.63751, -0.5570569, -1.506001, 1, 0.02352941, 0, 1,
-2.461654, 0.5738208, -2.386008, 1, 0.03137255, 0, 1,
-2.352744, 0.7164809, -1.655802, 1, 0.03529412, 0, 1,
-2.317442, 0.3839897, -2.460834, 1, 0.04313726, 0, 1,
-2.297024, -0.2307595, -2.194272, 1, 0.04705882, 0, 1,
-2.284112, 1.099258, -3.139817, 1, 0.05490196, 0, 1,
-2.186998, 1.217958, -0.4576828, 1, 0.05882353, 0, 1,
-2.178113, 0.5669003, -1.567627, 1, 0.06666667, 0, 1,
-2.174545, -0.4412129, -2.161828, 1, 0.07058824, 0, 1,
-2.165219, 0.03239831, -0.9972549, 1, 0.07843138, 0, 1,
-2.162878, 0.1551676, 0.2685193, 1, 0.08235294, 0, 1,
-2.135813, -0.8573075, -2.15775, 1, 0.09019608, 0, 1,
-2.107561, -0.6485198, -2.129141, 1, 0.09411765, 0, 1,
-2.095698, 2.751781, -0.6421445, 1, 0.1019608, 0, 1,
-2.093286, -1.057139, -2.466759, 1, 0.1098039, 0, 1,
-2.063491, 1.205452, -2.034714, 1, 0.1137255, 0, 1,
-2.060546, 0.7592599, -0.5487496, 1, 0.1215686, 0, 1,
-2.029897, -0.8224679, -3.342379, 1, 0.1254902, 0, 1,
-1.988161, -0.3719648, -1.749251, 1, 0.1333333, 0, 1,
-1.987729, 0.7034176, -2.886694, 1, 0.1372549, 0, 1,
-1.978585, 1.136956, -2.108497, 1, 0.145098, 0, 1,
-1.954588, -0.03668115, -2.390029, 1, 0.1490196, 0, 1,
-1.945313, -0.7039935, -0.7656471, 1, 0.1568628, 0, 1,
-1.856749, -0.4933683, -2.170965, 1, 0.1607843, 0, 1,
-1.85598, -1.315447, -3.135692, 1, 0.1686275, 0, 1,
-1.846891, 2.128798, -1.427271, 1, 0.172549, 0, 1,
-1.84268, -0.00459613, -1.032001, 1, 0.1803922, 0, 1,
-1.827865, -0.7454072, -2.388708, 1, 0.1843137, 0, 1,
-1.825889, -0.5079969, -1.114848, 1, 0.1921569, 0, 1,
-1.822656, 0.3195598, 0.2441147, 1, 0.1960784, 0, 1,
-1.815692, -1.916892, -2.859991, 1, 0.2039216, 0, 1,
-1.815579, -1.635522, -3.304857, 1, 0.2117647, 0, 1,
-1.786942, 1.200728, -0.1714183, 1, 0.2156863, 0, 1,
-1.744924, 1.195925, -2.851099, 1, 0.2235294, 0, 1,
-1.728287, 0.5250631, -0.6060859, 1, 0.227451, 0, 1,
-1.724647, -0.6245713, -1.879251, 1, 0.2352941, 0, 1,
-1.709235, 1.03832, 0.009192709, 1, 0.2392157, 0, 1,
-1.708965, -0.2468926, -0.5254214, 1, 0.2470588, 0, 1,
-1.704624, -0.2166784, -3.206236, 1, 0.2509804, 0, 1,
-1.70268, -1.741328, -3.010432, 1, 0.2588235, 0, 1,
-1.695214, -0.2686617, -2.414413, 1, 0.2627451, 0, 1,
-1.663241, 0.4617447, -1.835655, 1, 0.2705882, 0, 1,
-1.660215, 1.032472, -1.288556, 1, 0.2745098, 0, 1,
-1.658069, -1.229224, -2.782743, 1, 0.282353, 0, 1,
-1.651573, 1.353619, -0.3968918, 1, 0.2862745, 0, 1,
-1.594005, -0.04986754, 0.4757145, 1, 0.2941177, 0, 1,
-1.593278, 0.03004213, -1.662743, 1, 0.3019608, 0, 1,
-1.585599, 2.566772, -1.560852, 1, 0.3058824, 0, 1,
-1.58476, -0.5828939, -1.720006, 1, 0.3137255, 0, 1,
-1.575203, -1.227137, -3.099683, 1, 0.3176471, 0, 1,
-1.56969, 1.427083, -1.945098, 1, 0.3254902, 0, 1,
-1.568686, -0.8450646, -2.094741, 1, 0.3294118, 0, 1,
-1.56188, -0.4922971, -2.069298, 1, 0.3372549, 0, 1,
-1.539751, -0.148988, -0.3473738, 1, 0.3411765, 0, 1,
-1.538049, 0.8796895, -0.5622334, 1, 0.3490196, 0, 1,
-1.537522, 0.9742007, -0.7068543, 1, 0.3529412, 0, 1,
-1.514685, -0.07810331, 0.1068809, 1, 0.3607843, 0, 1,
-1.509966, -0.4564519, -1.273861, 1, 0.3647059, 0, 1,
-1.506401, -0.2741892, -0.83208, 1, 0.372549, 0, 1,
-1.495966, 1.07194, -0.2915788, 1, 0.3764706, 0, 1,
-1.492147, 1.259927, -0.892963, 1, 0.3843137, 0, 1,
-1.491179, 0.411445, -0.7120733, 1, 0.3882353, 0, 1,
-1.487694, 0.4414207, -1.492711, 1, 0.3960784, 0, 1,
-1.476112, -0.5307348, 0.3644452, 1, 0.4039216, 0, 1,
-1.475996, 0.08129833, -0.4315475, 1, 0.4078431, 0, 1,
-1.473306, -2.162105, -1.971417, 1, 0.4156863, 0, 1,
-1.46598, 0.1544386, -1.943004, 1, 0.4196078, 0, 1,
-1.463361, 0.1588366, -1.653488, 1, 0.427451, 0, 1,
-1.456228, 0.2167762, -0.7232702, 1, 0.4313726, 0, 1,
-1.448611, 1.508068, -0.4152941, 1, 0.4392157, 0, 1,
-1.446139, -1.158553, -2.05864, 1, 0.4431373, 0, 1,
-1.429814, -0.6112629, -1.517595, 1, 0.4509804, 0, 1,
-1.428783, -1.921374, -0.5431129, 1, 0.454902, 0, 1,
-1.424766, -0.9284248, -2.31035, 1, 0.4627451, 0, 1,
-1.423647, 0.196656, -0.9979622, 1, 0.4666667, 0, 1,
-1.413571, -1.36934, -1.661627, 1, 0.4745098, 0, 1,
-1.410951, 0.1193282, -1.367858, 1, 0.4784314, 0, 1,
-1.410787, 0.487783, -0.3121415, 1, 0.4862745, 0, 1,
-1.409613, 0.7216173, -1.269188, 1, 0.4901961, 0, 1,
-1.403667, -0.7084103, -0.7365185, 1, 0.4980392, 0, 1,
-1.396305, 0.8942722, -2.945948, 1, 0.5058824, 0, 1,
-1.384975, 1.621484, -0.6407126, 1, 0.509804, 0, 1,
-1.383179, -1.004997, -3.455607, 1, 0.5176471, 0, 1,
-1.378192, 1.434571, -1.736035, 1, 0.5215687, 0, 1,
-1.362446, 0.01543815, -2.739799, 1, 0.5294118, 0, 1,
-1.360997, -0.5260868, -3.897418, 1, 0.5333334, 0, 1,
-1.354776, 0.4492224, -0.6595553, 1, 0.5411765, 0, 1,
-1.342368, -1.795672, -0.4995425, 1, 0.5450981, 0, 1,
-1.336848, 0.03450472, -2.107991, 1, 0.5529412, 0, 1,
-1.333436, -2.161142, -3.2277, 1, 0.5568628, 0, 1,
-1.330888, 0.1239188, -0.571292, 1, 0.5647059, 0, 1,
-1.321145, -0.9362378, -2.260118, 1, 0.5686275, 0, 1,
-1.315663, -0.1651862, -2.727067, 1, 0.5764706, 0, 1,
-1.307673, 1.674028, 0.3304745, 1, 0.5803922, 0, 1,
-1.301055, -0.4677798, -2.318156, 1, 0.5882353, 0, 1,
-1.283918, 0.3841305, -0.5248041, 1, 0.5921569, 0, 1,
-1.279628, -1.20856, -1.415246, 1, 0.6, 0, 1,
-1.275814, -0.1942859, -1.416565, 1, 0.6078432, 0, 1,
-1.270947, 1.651335, 0.1798151, 1, 0.6117647, 0, 1,
-1.268077, 0.9607106, -0.5754694, 1, 0.6196079, 0, 1,
-1.256935, -1.084718, -1.994187, 1, 0.6235294, 0, 1,
-1.254116, 0.1734068, -1.658388, 1, 0.6313726, 0, 1,
-1.251209, -1.678247, -0.8959306, 1, 0.6352941, 0, 1,
-1.247271, -0.8647757, -1.434583, 1, 0.6431373, 0, 1,
-1.240688, -0.8109623, -2.258994, 1, 0.6470588, 0, 1,
-1.236367, -1.719042, -1.94216, 1, 0.654902, 0, 1,
-1.233223, -1.092384, -2.370069, 1, 0.6588235, 0, 1,
-1.21889, 0.6962125, -1.013609, 1, 0.6666667, 0, 1,
-1.216936, -0.9427301, -1.998311, 1, 0.6705883, 0, 1,
-1.215565, 0.8343173, -2.19808, 1, 0.6784314, 0, 1,
-1.215071, -1.160507, -0.2574601, 1, 0.682353, 0, 1,
-1.215005, -0.8895298, -2.518018, 1, 0.6901961, 0, 1,
-1.208345, 1.112659, 0.06954574, 1, 0.6941177, 0, 1,
-1.204402, -0.8734417, -3.373155, 1, 0.7019608, 0, 1,
-1.201812, -0.3068308, -2.868657, 1, 0.7098039, 0, 1,
-1.199531, 0.2467059, -0.6359346, 1, 0.7137255, 0, 1,
-1.197852, -1.001996, -4.237062, 1, 0.7215686, 0, 1,
-1.194664, -2.727536, -1.923246, 1, 0.7254902, 0, 1,
-1.194638, -0.4368064, -1.711157, 1, 0.7333333, 0, 1,
-1.189985, -0.5763709, -2.269541, 1, 0.7372549, 0, 1,
-1.188374, -1.293858, -2.621465, 1, 0.7450981, 0, 1,
-1.186132, 0.5389565, -0.352331, 1, 0.7490196, 0, 1,
-1.178541, -0.1053314, -1.46818, 1, 0.7568628, 0, 1,
-1.178195, -2.030616, -2.443109, 1, 0.7607843, 0, 1,
-1.168409, -1.377586, -2.588218, 1, 0.7686275, 0, 1,
-1.158049, 1.159708, -2.130339, 1, 0.772549, 0, 1,
-1.15537, 0.1020445, -0.02168608, 1, 0.7803922, 0, 1,
-1.154969, 1.777942, 1.487356, 1, 0.7843137, 0, 1,
-1.152123, -0.3733711, -3.129357, 1, 0.7921569, 0, 1,
-1.151718, 1.547813, -2.017325, 1, 0.7960784, 0, 1,
-1.139167, -1.256196, -0.6344619, 1, 0.8039216, 0, 1,
-1.136487, 0.041633, -2.866475, 1, 0.8117647, 0, 1,
-1.13619, -0.1324828, -0.60353, 1, 0.8156863, 0, 1,
-1.130827, -1.125348, -1.995015, 1, 0.8235294, 0, 1,
-1.129287, -0.4875728, -2.156235, 1, 0.827451, 0, 1,
-1.124326, 1.243667, -0.9218492, 1, 0.8352941, 0, 1,
-1.123563, 0.6847498, -2.233454, 1, 0.8392157, 0, 1,
-1.122439, -0.9090261, -1.622809, 1, 0.8470588, 0, 1,
-1.112664, -0.1724728, -1.299783, 1, 0.8509804, 0, 1,
-1.107551, -0.4543821, -0.4720515, 1, 0.8588235, 0, 1,
-1.105641, -1.987734, -3.802068, 1, 0.8627451, 0, 1,
-1.102297, -0.7008971, -1.391336, 1, 0.8705882, 0, 1,
-1.099326, -1.474585, -3.301785, 1, 0.8745098, 0, 1,
-1.094724, -1.113008, -2.168306, 1, 0.8823529, 0, 1,
-1.094091, -0.5690429, -2.14694, 1, 0.8862745, 0, 1,
-1.088228, -0.4124067, -1.875324, 1, 0.8941177, 0, 1,
-1.084887, 0.6209487, -1.506259, 1, 0.8980392, 0, 1,
-1.082313, 0.5694382, -1.278337, 1, 0.9058824, 0, 1,
-1.070196, 0.1318493, -1.525673, 1, 0.9137255, 0, 1,
-1.065708, -0.4267407, -3.019403, 1, 0.9176471, 0, 1,
-1.060852, 1.761552, -0.9063632, 1, 0.9254902, 0, 1,
-1.058311, 1.886657, 1.206015, 1, 0.9294118, 0, 1,
-1.055829, 0.6846209, -1.953715, 1, 0.9372549, 0, 1,
-1.052771, -0.4109756, -0.6191407, 1, 0.9411765, 0, 1,
-1.052096, 0.9180807, -0.7390732, 1, 0.9490196, 0, 1,
-1.042604, 1.156971, -1.285591, 1, 0.9529412, 0, 1,
-1.036814, -0.9966662, -3.403283, 1, 0.9607843, 0, 1,
-1.023345, 0.542166, -1.948171, 1, 0.9647059, 0, 1,
-1.012222, -0.9229928, -3.701359, 1, 0.972549, 0, 1,
-1.007871, 0.2017398, -0.3279499, 1, 0.9764706, 0, 1,
-1.005438, -0.3309112, -2.242903, 1, 0.9843137, 0, 1,
-0.9937916, 0.8871452, -1.448885, 1, 0.9882353, 0, 1,
-0.9887008, -0.2120041, -2.530469, 1, 0.9960784, 0, 1,
-0.9885721, -1.387464, -4.100976, 0.9960784, 1, 0, 1,
-0.9853622, 1.489976, 0.8831901, 0.9921569, 1, 0, 1,
-0.9802227, -0.8712673, -3.263644, 0.9843137, 1, 0, 1,
-0.9727716, -0.3022583, -2.585276, 0.9803922, 1, 0, 1,
-0.9716471, -1.106149, -2.903641, 0.972549, 1, 0, 1,
-0.9679667, -0.1311842, -2.177813, 0.9686275, 1, 0, 1,
-0.9622822, 0.7549255, 0.2116128, 0.9607843, 1, 0, 1,
-0.9620072, -0.2368369, -1.817798, 0.9568627, 1, 0, 1,
-0.9579096, -0.3770635, -2.287421, 0.9490196, 1, 0, 1,
-0.9573328, -1.164185, -1.429429, 0.945098, 1, 0, 1,
-0.9566819, -0.2616067, -2.563353, 0.9372549, 1, 0, 1,
-0.9544821, -0.6298365, -2.279514, 0.9333333, 1, 0, 1,
-0.9530413, -1.101748, -2.528107, 0.9254902, 1, 0, 1,
-0.9530209, 1.029356, -0.3700415, 0.9215686, 1, 0, 1,
-0.9395867, 0.975439, -1.79483, 0.9137255, 1, 0, 1,
-0.9341642, 0.03115957, -3.131348, 0.9098039, 1, 0, 1,
-0.9315403, -0.4663269, -3.189909, 0.9019608, 1, 0, 1,
-0.9258055, -0.119242, -1.785935, 0.8941177, 1, 0, 1,
-0.9158452, -0.9767781, -3.468502, 0.8901961, 1, 0, 1,
-0.9122021, -0.2116751, -2.348344, 0.8823529, 1, 0, 1,
-0.9115118, -1.176649, -2.612514, 0.8784314, 1, 0, 1,
-0.9077797, -0.5606866, -3.972186, 0.8705882, 1, 0, 1,
-0.904148, -1.282027, -2.358948, 0.8666667, 1, 0, 1,
-0.9031326, 1.491651, -1.717533, 0.8588235, 1, 0, 1,
-0.9027933, -2.459084, -2.567794, 0.854902, 1, 0, 1,
-0.9006193, 0.01980782, -0.9980226, 0.8470588, 1, 0, 1,
-0.892869, -0.2386877, -0.351481, 0.8431373, 1, 0, 1,
-0.8894494, 1.954131, -0.2753203, 0.8352941, 1, 0, 1,
-0.8877235, 1.503222, 0.6519468, 0.8313726, 1, 0, 1,
-0.8818673, 0.4363691, -0.2079164, 0.8235294, 1, 0, 1,
-0.8807103, 0.6989012, 1.58053, 0.8196079, 1, 0, 1,
-0.8582572, 0.2143888, -1.102431, 0.8117647, 1, 0, 1,
-0.8479452, 0.4942809, -0.5482217, 0.8078431, 1, 0, 1,
-0.847606, 0.9241676, -0.1432274, 0.8, 1, 0, 1,
-0.845369, 1.579556, -1.605664, 0.7921569, 1, 0, 1,
-0.8437074, -1.600035, -1.926073, 0.7882353, 1, 0, 1,
-0.8425849, -0.171584, -1.236065, 0.7803922, 1, 0, 1,
-0.8364662, 0.1341839, -3.032415, 0.7764706, 1, 0, 1,
-0.836131, 0.1839039, 0.1891453, 0.7686275, 1, 0, 1,
-0.8359039, 0.5420686, -0.4639658, 0.7647059, 1, 0, 1,
-0.8337935, -0.7029345, -2.79364, 0.7568628, 1, 0, 1,
-0.8336161, -0.311302, -3.459923, 0.7529412, 1, 0, 1,
-0.8292513, -0.4537725, -2.934133, 0.7450981, 1, 0, 1,
-0.8263471, -0.5692905, -1.997775, 0.7411765, 1, 0, 1,
-0.8217568, -1.519081, -4.760118, 0.7333333, 1, 0, 1,
-0.8200716, -1.427905, -3.08718, 0.7294118, 1, 0, 1,
-0.8170178, -1.095777, -2.916438, 0.7215686, 1, 0, 1,
-0.8142841, -0.8849858, -1.755595, 0.7176471, 1, 0, 1,
-0.8127255, 0.2626832, 0.4568641, 0.7098039, 1, 0, 1,
-0.8113998, -0.8827724, -3.033614, 0.7058824, 1, 0, 1,
-0.8081405, -0.7906752, -3.789252, 0.6980392, 1, 0, 1,
-0.8026068, 0.4438484, 1.012951, 0.6901961, 1, 0, 1,
-0.80157, -1.030954, -3.398669, 0.6862745, 1, 0, 1,
-0.7963394, 0.7786722, -1.83783, 0.6784314, 1, 0, 1,
-0.7959253, -1.079207, -0.2726452, 0.6745098, 1, 0, 1,
-0.7933578, -0.001790401, -0.2828925, 0.6666667, 1, 0, 1,
-0.7907232, -1.673733, -2.474493, 0.6627451, 1, 0, 1,
-0.7799751, -0.4176035, -2.607731, 0.654902, 1, 0, 1,
-0.7772695, -0.3914628, -2.040996, 0.6509804, 1, 0, 1,
-0.7772449, 0.9963859, -0.1736279, 0.6431373, 1, 0, 1,
-0.7751188, 0.2806936, -0.3681225, 0.6392157, 1, 0, 1,
-0.7744294, -0.4465054, -3.697084, 0.6313726, 1, 0, 1,
-0.7739788, 0.0558748, -2.722021, 0.627451, 1, 0, 1,
-0.7698584, 0.7195802, 0.3658501, 0.6196079, 1, 0, 1,
-0.765141, -1.08718, -1.711765, 0.6156863, 1, 0, 1,
-0.7534444, 1.176281, -0.9743233, 0.6078432, 1, 0, 1,
-0.7513728, -0.3801895, -2.83394, 0.6039216, 1, 0, 1,
-0.7475635, -0.9986895, -3.565823, 0.5960785, 1, 0, 1,
-0.745323, -0.7764305, -3.332861, 0.5882353, 1, 0, 1,
-0.7362067, 0.6418426, -0.8610784, 0.5843138, 1, 0, 1,
-0.7348711, -0.2315535, -1.236488, 0.5764706, 1, 0, 1,
-0.733041, -0.07352992, -1.432406, 0.572549, 1, 0, 1,
-0.732402, 1.132451, -2.349175, 0.5647059, 1, 0, 1,
-0.7275473, -0.6124184, -3.952497, 0.5607843, 1, 0, 1,
-0.7229138, 0.487669, -1.870077, 0.5529412, 1, 0, 1,
-0.7218083, -0.1835603, -1.855545, 0.5490196, 1, 0, 1,
-0.7179232, 0.7706687, 1.266259, 0.5411765, 1, 0, 1,
-0.7026684, 1.595824, 0.6348708, 0.5372549, 1, 0, 1,
-0.7016574, -0.5091896, -1.509218, 0.5294118, 1, 0, 1,
-0.7004382, 1.308862, -1.074645, 0.5254902, 1, 0, 1,
-0.6999982, -0.4400595, -2.417273, 0.5176471, 1, 0, 1,
-0.692595, 0.1855181, 0.08690985, 0.5137255, 1, 0, 1,
-0.6893006, 1.388797, -0.6692113, 0.5058824, 1, 0, 1,
-0.6795473, -0.9641151, -2.738793, 0.5019608, 1, 0, 1,
-0.6774878, 0.270688, -1.263171, 0.4941176, 1, 0, 1,
-0.6770138, -1.500402, -2.24356, 0.4862745, 1, 0, 1,
-0.672501, 0.3698108, -2.994161, 0.4823529, 1, 0, 1,
-0.6717783, -1.37586, -3.186921, 0.4745098, 1, 0, 1,
-0.6693885, 0.08074474, -0.519162, 0.4705882, 1, 0, 1,
-0.6675128, -0.3098174, -0.5638067, 0.4627451, 1, 0, 1,
-0.6667909, -1.373561, -2.589505, 0.4588235, 1, 0, 1,
-0.6657875, 2.132578, -0.481839, 0.4509804, 1, 0, 1,
-0.6633325, 0.6256512, -1.53259, 0.4470588, 1, 0, 1,
-0.6630234, 1.163597, -0.9286401, 0.4392157, 1, 0, 1,
-0.6583992, -1.058343, -2.095733, 0.4352941, 1, 0, 1,
-0.6557563, -0.04400286, -1.128441, 0.427451, 1, 0, 1,
-0.6548025, -0.0614108, -4.275191, 0.4235294, 1, 0, 1,
-0.6539435, 0.7987213, -2.004218, 0.4156863, 1, 0, 1,
-0.6520845, 0.1427145, -1.013972, 0.4117647, 1, 0, 1,
-0.651448, -0.5510281, -2.082458, 0.4039216, 1, 0, 1,
-0.6462337, -0.4586882, -3.885125, 0.3960784, 1, 0, 1,
-0.6328275, 0.6978077, -2.02958, 0.3921569, 1, 0, 1,
-0.6309733, 0.9713365, 0.3024379, 0.3843137, 1, 0, 1,
-0.6303, -0.7408195, -2.615714, 0.3803922, 1, 0, 1,
-0.6289055, -0.4642504, -2.555817, 0.372549, 1, 0, 1,
-0.627515, -0.009318491, -2.317124, 0.3686275, 1, 0, 1,
-0.6239046, 2.602275, -0.5010436, 0.3607843, 1, 0, 1,
-0.6210185, -0.1672367, -1.880238, 0.3568628, 1, 0, 1,
-0.6203092, 0.5601665, -0.03895315, 0.3490196, 1, 0, 1,
-0.6136962, 1.229597, 0.527333, 0.345098, 1, 0, 1,
-0.6096916, -0.0219631, -1.571762, 0.3372549, 1, 0, 1,
-0.600148, 0.5233822, -1.372228, 0.3333333, 1, 0, 1,
-0.5997013, -0.4083376, -4.402401, 0.3254902, 1, 0, 1,
-0.5984459, 0.2312973, -2.974323, 0.3215686, 1, 0, 1,
-0.5974486, -1.276141, -2.066767, 0.3137255, 1, 0, 1,
-0.5971636, -0.4762846, -2.625309, 0.3098039, 1, 0, 1,
-0.5971365, -1.466627, -3.078446, 0.3019608, 1, 0, 1,
-0.5956793, 0.6711567, -0.2307331, 0.2941177, 1, 0, 1,
-0.5948234, 0.2048793, -1.018075, 0.2901961, 1, 0, 1,
-0.591973, -0.2823359, -1.344209, 0.282353, 1, 0, 1,
-0.5914656, 2.514816, -1.418604, 0.2784314, 1, 0, 1,
-0.5910522, 1.596991, 0.9133512, 0.2705882, 1, 0, 1,
-0.5885201, 1.800124, -0.5120341, 0.2666667, 1, 0, 1,
-0.5874937, 0.4122136, -1.248305, 0.2588235, 1, 0, 1,
-0.5835577, -0.3667135, -1.300626, 0.254902, 1, 0, 1,
-0.5802796, 0.4815157, -2.10474, 0.2470588, 1, 0, 1,
-0.5774372, 0.1931377, -2.362752, 0.2431373, 1, 0, 1,
-0.5733845, 0.08042923, -1.550068, 0.2352941, 1, 0, 1,
-0.5707837, 0.8749938, -2.136959, 0.2313726, 1, 0, 1,
-0.5651376, -1.457699, -2.588621, 0.2235294, 1, 0, 1,
-0.5622109, -0.3318194, -1.593814, 0.2196078, 1, 0, 1,
-0.5609655, -0.3356656, -1.80863, 0.2117647, 1, 0, 1,
-0.5595717, 0.2519229, -0.2160598, 0.2078431, 1, 0, 1,
-0.5508984, -0.3147006, -2.768035, 0.2, 1, 0, 1,
-0.544192, -2.240831, -1.342291, 0.1921569, 1, 0, 1,
-0.5437465, 0.2003135, 0.9422078, 0.1882353, 1, 0, 1,
-0.5424675, -0.1502089, -1.395436, 0.1803922, 1, 0, 1,
-0.5386236, 1.077798, 0.6456875, 0.1764706, 1, 0, 1,
-0.5264492, -0.05387336, -0.7620736, 0.1686275, 1, 0, 1,
-0.5212247, -0.06875682, -0.3496785, 0.1647059, 1, 0, 1,
-0.5203014, 0.3243815, -0.5935042, 0.1568628, 1, 0, 1,
-0.5176637, -2.783313, -3.701599, 0.1529412, 1, 0, 1,
-0.514304, -1.193444, -4.39092, 0.145098, 1, 0, 1,
-0.5117959, -0.402973, -0.5902499, 0.1411765, 1, 0, 1,
-0.5116616, 1.218011, 1.93925, 0.1333333, 1, 0, 1,
-0.5098562, 3.558889, -0.3936563, 0.1294118, 1, 0, 1,
-0.5018488, 0.8439016, 0.2942248, 0.1215686, 1, 0, 1,
-0.4998457, -0.5076171, -3.789468, 0.1176471, 1, 0, 1,
-0.4900743, -0.7533844, -3.859716, 0.1098039, 1, 0, 1,
-0.4866451, -0.5113618, -3.402494, 0.1058824, 1, 0, 1,
-0.4832702, 1.821414, -0.5578579, 0.09803922, 1, 0, 1,
-0.4828756, -0.8140159, -3.549028, 0.09019608, 1, 0, 1,
-0.4795845, 0.3279926, -0.9544769, 0.08627451, 1, 0, 1,
-0.4782207, 1.223211, -0.8434045, 0.07843138, 1, 0, 1,
-0.4772726, -0.4245204, -0.8530312, 0.07450981, 1, 0, 1,
-0.4763775, -0.2587326, -1.129099, 0.06666667, 1, 0, 1,
-0.4745187, -0.6669412, -2.514174, 0.0627451, 1, 0, 1,
-0.4742563, 0.3198847, -0.5988277, 0.05490196, 1, 0, 1,
-0.4716576, -1.410612, -2.587146, 0.05098039, 1, 0, 1,
-0.4716093, 1.054228, 0.2695621, 0.04313726, 1, 0, 1,
-0.4694329, 0.9789392, 0.2359424, 0.03921569, 1, 0, 1,
-0.4679215, -0.4214676, -4.007702, 0.03137255, 1, 0, 1,
-0.4657193, -0.2399419, -0.8611268, 0.02745098, 1, 0, 1,
-0.4605796, -1.958562, -3.625709, 0.01960784, 1, 0, 1,
-0.4603154, -0.09427513, -0.9312312, 0.01568628, 1, 0, 1,
-0.4532613, 1.588098, -0.1048582, 0.007843138, 1, 0, 1,
-0.4528548, 0.9760516, -0.1901415, 0.003921569, 1, 0, 1,
-0.4504405, 2.825192, -0.6598254, 0, 1, 0.003921569, 1,
-0.4454258, -0.03250488, -3.170861, 0, 1, 0.01176471, 1,
-0.4425575, 1.114676, 0.4635308, 0, 1, 0.01568628, 1,
-0.4418423, -1.771606, -2.345531, 0, 1, 0.02352941, 1,
-0.4247438, 1.454038, -0.0472786, 0, 1, 0.02745098, 1,
-0.4146549, -1.550601, -3.218626, 0, 1, 0.03529412, 1,
-0.4128779, -0.02841906, -0.2091495, 0, 1, 0.03921569, 1,
-0.4111847, 0.5753296, -0.7878795, 0, 1, 0.04705882, 1,
-0.4090659, -0.9837196, -3.260406, 0, 1, 0.05098039, 1,
-0.4090486, 0.3706567, -0.007654748, 0, 1, 0.05882353, 1,
-0.4009821, -0.4584329, -3.839069, 0, 1, 0.0627451, 1,
-0.3984309, 0.272083, -0.8293874, 0, 1, 0.07058824, 1,
-0.3903369, -0.9638696, -2.190968, 0, 1, 0.07450981, 1,
-0.376842, 1.077471, 0.1293982, 0, 1, 0.08235294, 1,
-0.3744347, -1.552409, -4.344346, 0, 1, 0.08627451, 1,
-0.3738306, 0.5041183, -0.5166759, 0, 1, 0.09411765, 1,
-0.3712743, -0.389105, -2.575869, 0, 1, 0.1019608, 1,
-0.3696625, -0.3291711, -3.578673, 0, 1, 0.1058824, 1,
-0.3665232, 0.95692, -1.464779, 0, 1, 0.1137255, 1,
-0.3577922, -0.4930747, -3.374345, 0, 1, 0.1176471, 1,
-0.3512803, -0.5232669, -2.65642, 0, 1, 0.1254902, 1,
-0.349728, -1.609889, -1.862971, 0, 1, 0.1294118, 1,
-0.3481684, -0.3305905, -3.358622, 0, 1, 0.1372549, 1,
-0.3477454, -0.3723202, -1.950397, 0, 1, 0.1411765, 1,
-0.3425464, -0.2390774, -6.433838, 0, 1, 0.1490196, 1,
-0.3352536, -1.654006, -2.261234, 0, 1, 0.1529412, 1,
-0.328659, 0.3241369, -0.5490175, 0, 1, 0.1607843, 1,
-0.3250295, 0.2394666, -0.9806004, 0, 1, 0.1647059, 1,
-0.3249061, 1.131348, -0.5477, 0, 1, 0.172549, 1,
-0.3246608, -0.1653396, -2.455296, 0, 1, 0.1764706, 1,
-0.3229395, -0.9111406, -3.852152, 0, 1, 0.1843137, 1,
-0.322162, -0.2485541, -2.364671, 0, 1, 0.1882353, 1,
-0.3199419, 0.5748208, -1.001691, 0, 1, 0.1960784, 1,
-0.3191673, -0.1600567, -1.0792, 0, 1, 0.2039216, 1,
-0.3147745, -2.069578, -4.302928, 0, 1, 0.2078431, 1,
-0.3136465, -0.4346517, -1.303945, 0, 1, 0.2156863, 1,
-0.3126732, -0.7410146, -2.381635, 0, 1, 0.2196078, 1,
-0.3123907, 0.2450284, 1.379076, 0, 1, 0.227451, 1,
-0.3101141, 1.384977, 0.5810359, 0, 1, 0.2313726, 1,
-0.3087446, -0.06787358, -0.7753561, 0, 1, 0.2392157, 1,
-0.3064584, 1.240819, 0.3619613, 0, 1, 0.2431373, 1,
-0.3048998, 0.7452381, 0.03310088, 0, 1, 0.2509804, 1,
-0.3027804, 0.8831393, -0.2268457, 0, 1, 0.254902, 1,
-0.2983892, -0.1876253, 0.5201695, 0, 1, 0.2627451, 1,
-0.2928403, 0.6226304, -0.5192114, 0, 1, 0.2666667, 1,
-0.2916277, -0.9466501, -3.579273, 0, 1, 0.2745098, 1,
-0.2903275, 0.2234216, -0.5094056, 0, 1, 0.2784314, 1,
-0.287917, 0.9386144, 0.5762749, 0, 1, 0.2862745, 1,
-0.2864147, 0.4300658, -0.7441212, 0, 1, 0.2901961, 1,
-0.2845692, 1.404694, 0.3871669, 0, 1, 0.2980392, 1,
-0.2826479, 1.074821, -2.846226, 0, 1, 0.3058824, 1,
-0.2784508, 0.2694253, -0.9973788, 0, 1, 0.3098039, 1,
-0.2781082, -1.127622, -2.587178, 0, 1, 0.3176471, 1,
-0.2734084, 0.9384198, -0.4351043, 0, 1, 0.3215686, 1,
-0.2717592, 0.6577908, -0.03640945, 0, 1, 0.3294118, 1,
-0.265559, -1.530175, -3.038482, 0, 1, 0.3333333, 1,
-0.2653406, -0.913637, -2.615119, 0, 1, 0.3411765, 1,
-0.2627231, 0.04347658, -0.6394912, 0, 1, 0.345098, 1,
-0.2618829, -1.759232, -3.377469, 0, 1, 0.3529412, 1,
-0.2611536, 0.2485203, -2.0559, 0, 1, 0.3568628, 1,
-0.2608755, 0.317792, -0.4714159, 0, 1, 0.3647059, 1,
-0.2605849, 0.04249201, -2.43593, 0, 1, 0.3686275, 1,
-0.2568672, -0.8571903, -3.705587, 0, 1, 0.3764706, 1,
-0.2555354, -0.09931357, -1.188815, 0, 1, 0.3803922, 1,
-0.2552565, 0.2702706, -0.1000732, 0, 1, 0.3882353, 1,
-0.2524072, -0.7653352, -3.108067, 0, 1, 0.3921569, 1,
-0.2511855, 0.03322401, 0.3522423, 0, 1, 0.4, 1,
-0.2458361, -2.620243, -2.106281, 0, 1, 0.4078431, 1,
-0.2446711, 0.3599593, -1.458116, 0, 1, 0.4117647, 1,
-0.2373037, -0.5999548, -2.238779, 0, 1, 0.4196078, 1,
-0.2333978, -0.2991967, -2.742755, 0, 1, 0.4235294, 1,
-0.233029, 2.216583, -0.4938777, 0, 1, 0.4313726, 1,
-0.23005, -1.893198, -5.218333, 0, 1, 0.4352941, 1,
-0.227763, 0.3759574, -0.5219105, 0, 1, 0.4431373, 1,
-0.2270999, -1.312524, -1.127948, 0, 1, 0.4470588, 1,
-0.2249507, -2.094187, -3.656882, 0, 1, 0.454902, 1,
-0.2232343, -0.6644644, -2.749901, 0, 1, 0.4588235, 1,
-0.2213662, 0.2755058, -0.7701586, 0, 1, 0.4666667, 1,
-0.2191852, 1.410339, -0.06379566, 0, 1, 0.4705882, 1,
-0.2165626, -0.5561647, -2.845576, 0, 1, 0.4784314, 1,
-0.2149925, 1.261436, -1.101652, 0, 1, 0.4823529, 1,
-0.2039769, 0.0597597, -0.1177591, 0, 1, 0.4901961, 1,
-0.2036682, 0.3752173, -2.376387, 0, 1, 0.4941176, 1,
-0.2026223, -1.015867, -3.002192, 0, 1, 0.5019608, 1,
-0.2015855, -0.314788, -2.789945, 0, 1, 0.509804, 1,
-0.2010947, 0.6469513, -0.2301523, 0, 1, 0.5137255, 1,
-0.200399, -0.01724503, -2.733088, 0, 1, 0.5215687, 1,
-0.1989473, 0.07629996, -0.6981871, 0, 1, 0.5254902, 1,
-0.1968224, 1.266526, 0.6560013, 0, 1, 0.5333334, 1,
-0.1937558, 0.2917569, -0.06158779, 0, 1, 0.5372549, 1,
-0.1933962, 0.4880194, 0.3307948, 0, 1, 0.5450981, 1,
-0.1931904, -0.5114822, -1.025226, 0, 1, 0.5490196, 1,
-0.1929299, 0.09843381, -1.298024, 0, 1, 0.5568628, 1,
-0.1830045, 0.09590162, -2.554135, 0, 1, 0.5607843, 1,
-0.181397, -0.4053395, -2.880122, 0, 1, 0.5686275, 1,
-0.1795805, 0.1072997, 0.03670204, 0, 1, 0.572549, 1,
-0.1767296, -0.6359532, -3.460866, 0, 1, 0.5803922, 1,
-0.1751408, 0.6823859, -0.2273528, 0, 1, 0.5843138, 1,
-0.1749498, -0.6954509, -1.985384, 0, 1, 0.5921569, 1,
-0.1733899, 0.08924172, -1.82908, 0, 1, 0.5960785, 1,
-0.1672866, -1.456123, -1.579293, 0, 1, 0.6039216, 1,
-0.1671275, 0.02615449, -1.549966, 0, 1, 0.6117647, 1,
-0.1666289, -1.040234, -2.832055, 0, 1, 0.6156863, 1,
-0.162651, 0.4396917, -1.656304, 0, 1, 0.6235294, 1,
-0.1591641, 0.3170469, -1.951469, 0, 1, 0.627451, 1,
-0.1588588, 1.654043, -1.234967, 0, 1, 0.6352941, 1,
-0.1585153, 1.969813, -0.9118579, 0, 1, 0.6392157, 1,
-0.156881, 0.9527422, 1.002523, 0, 1, 0.6470588, 1,
-0.1561454, 0.4737706, -0.4650596, 0, 1, 0.6509804, 1,
-0.14933, -1.073318, -1.974026, 0, 1, 0.6588235, 1,
-0.1480726, -1.68936, -4.174037, 0, 1, 0.6627451, 1,
-0.1479488, -0.4726994, -2.81907, 0, 1, 0.6705883, 1,
-0.1455534, 0.6816581, 0.4073041, 0, 1, 0.6745098, 1,
-0.1391399, -0.4937031, -2.329533, 0, 1, 0.682353, 1,
-0.1336267, -0.1773008, -2.470876, 0, 1, 0.6862745, 1,
-0.1294207, 0.7835062, -0.3653206, 0, 1, 0.6941177, 1,
-0.1294003, 1.200964, -1.949754, 0, 1, 0.7019608, 1,
-0.126478, -0.05591308, -2.698276, 0, 1, 0.7058824, 1,
-0.1257107, 0.6845891, -0.2507639, 0, 1, 0.7137255, 1,
-0.1235911, -1.773063, -2.64635, 0, 1, 0.7176471, 1,
-0.1231586, -0.6302858, -2.85195, 0, 1, 0.7254902, 1,
-0.1227253, 0.6386729, -1.904635, 0, 1, 0.7294118, 1,
-0.119302, 1.407347, -0.2924388, 0, 1, 0.7372549, 1,
-0.1129118, 0.2179918, -1.316483, 0, 1, 0.7411765, 1,
-0.1095434, -1.280246, -1.733433, 0, 1, 0.7490196, 1,
-0.09895607, 1.484437, 0.562279, 0, 1, 0.7529412, 1,
-0.09795637, 1.634822, -0.6779564, 0, 1, 0.7607843, 1,
-0.09487986, 0.3324823, 1.261405, 0, 1, 0.7647059, 1,
-0.09376974, 0.02972899, -2.127149, 0, 1, 0.772549, 1,
-0.09040654, -0.2582247, -2.927987, 0, 1, 0.7764706, 1,
-0.08836575, 0.388002, 0.7750667, 0, 1, 0.7843137, 1,
-0.0854848, -0.5947508, -3.030937, 0, 1, 0.7882353, 1,
-0.08258312, 0.2972119, 0.9298197, 0, 1, 0.7960784, 1,
-0.07835853, 1.600813, -0.3900307, 0, 1, 0.8039216, 1,
-0.07525966, -1.099135, -2.699816, 0, 1, 0.8078431, 1,
-0.07320502, 0.257916, -0.5372134, 0, 1, 0.8156863, 1,
-0.07103294, -0.4707491, -1.047079, 0, 1, 0.8196079, 1,
-0.06981061, 2.700419, 0.1253099, 0, 1, 0.827451, 1,
-0.05929105, 0.7301661, -0.9483079, 0, 1, 0.8313726, 1,
-0.05914462, 1.127473, -0.6089077, 0, 1, 0.8392157, 1,
-0.05624553, -1.244218, -2.291978, 0, 1, 0.8431373, 1,
-0.05491641, 0.07915334, 1.04686, 0, 1, 0.8509804, 1,
-0.05404104, -1.320938, -4.112378, 0, 1, 0.854902, 1,
-0.05363274, -1.609517, -1.345112, 0, 1, 0.8627451, 1,
-0.0534644, 0.8844119, 0.2084544, 0, 1, 0.8666667, 1,
-0.04910209, -0.4187468, -3.403841, 0, 1, 0.8745098, 1,
-0.04890228, 0.9919731, -0.1590772, 0, 1, 0.8784314, 1,
-0.04692639, -0.170549, -2.91433, 0, 1, 0.8862745, 1,
-0.0395271, 0.3527474, -0.843566, 0, 1, 0.8901961, 1,
-0.03928594, -0.05045661, -4.383441, 0, 1, 0.8980392, 1,
-0.03305941, 0.8186783, -0.9618598, 0, 1, 0.9058824, 1,
-0.03236874, 0.01576643, -1.254022, 0, 1, 0.9098039, 1,
-0.03188951, 1.612622, 1.81887, 0, 1, 0.9176471, 1,
-0.03133458, 0.8309576, -0.09916528, 0, 1, 0.9215686, 1,
-0.03031253, -0.1311744, -3.655396, 0, 1, 0.9294118, 1,
-0.03005595, 0.02830025, -0.5147074, 0, 1, 0.9333333, 1,
-0.02881429, 0.7942379, -0.08898994, 0, 1, 0.9411765, 1,
-0.02825339, 0.7800836, 1.577201, 0, 1, 0.945098, 1,
-0.02634948, -0.1234265, -2.699528, 0, 1, 0.9529412, 1,
-0.02257498, -0.7850996, -1.928882, 0, 1, 0.9568627, 1,
-0.01086802, -0.5014108, -3.740777, 0, 1, 0.9647059, 1,
-0.008824242, 0.054448, 0.277833, 0, 1, 0.9686275, 1,
-0.007822713, 0.08563466, -1.773548, 0, 1, 0.9764706, 1,
-0.007530212, 1.066677, 0.07814056, 0, 1, 0.9803922, 1,
-0.0049703, 0.9197441, 0.01718037, 0, 1, 0.9882353, 1,
0.003947597, 1.104104, -0.3585941, 0, 1, 0.9921569, 1,
0.006206843, 0.3228955, -1.059879, 0, 1, 1, 1,
0.007088008, 1.360557, 0.9813316, 0, 0.9921569, 1, 1,
0.008159807, -1.224309, 2.836378, 0, 0.9882353, 1, 1,
0.01947477, 0.09185351, 0.6006902, 0, 0.9803922, 1, 1,
0.01978532, 0.08397159, 0.3266978, 0, 0.9764706, 1, 1,
0.02088564, -1.330895, 2.488887, 0, 0.9686275, 1, 1,
0.02881752, 1.197578, 0.4524612, 0, 0.9647059, 1, 1,
0.03106794, -0.8339562, 2.722709, 0, 0.9568627, 1, 1,
0.03155947, 0.1630976, -0.7527388, 0, 0.9529412, 1, 1,
0.03339498, 1.405125, -0.8852587, 0, 0.945098, 1, 1,
0.0368616, -0.001933964, 1.057604, 0, 0.9411765, 1, 1,
0.04138738, -0.6224533, 4.546258, 0, 0.9333333, 1, 1,
0.04267666, 0.1645168, 1.674351, 0, 0.9294118, 1, 1,
0.0459642, -2.076888, 1.567707, 0, 0.9215686, 1, 1,
0.04735365, -0.3104658, 2.84819, 0, 0.9176471, 1, 1,
0.04922626, -1.023502, 2.040156, 0, 0.9098039, 1, 1,
0.05241267, -1.672099, 4.402394, 0, 0.9058824, 1, 1,
0.05660852, 0.1111116, 0.8159553, 0, 0.8980392, 1, 1,
0.05670612, -0.152533, 4.769666, 0, 0.8901961, 1, 1,
0.06269434, 0.6072445, 1.119934, 0, 0.8862745, 1, 1,
0.06274396, 1.776398, 0.6429509, 0, 0.8784314, 1, 1,
0.06300052, -0.6413121, 2.185391, 0, 0.8745098, 1, 1,
0.06574066, -2.69301, 4.387842, 0, 0.8666667, 1, 1,
0.0667077, -0.6327173, 2.999593, 0, 0.8627451, 1, 1,
0.06702799, 0.4804705, 0.4960119, 0, 0.854902, 1, 1,
0.06712732, 1.92499, 0.8759097, 0, 0.8509804, 1, 1,
0.07226346, 1.073686, 0.4825506, 0, 0.8431373, 1, 1,
0.07809065, -0.08079701, 2.166032, 0, 0.8392157, 1, 1,
0.07928646, 0.5645251, 2.107994, 0, 0.8313726, 1, 1,
0.08006857, 1.126348, 0.7715775, 0, 0.827451, 1, 1,
0.08110071, -1.988169, 3.37461, 0, 0.8196079, 1, 1,
0.08341917, 1.005612, -0.08305023, 0, 0.8156863, 1, 1,
0.08373767, -0.5185663, 3.459194, 0, 0.8078431, 1, 1,
0.08508693, -0.3696136, 3.21442, 0, 0.8039216, 1, 1,
0.0871539, -0.410015, 2.175939, 0, 0.7960784, 1, 1,
0.08947825, 1.299498, -0.05342565, 0, 0.7882353, 1, 1,
0.09209394, -0.8409715, 2.55157, 0, 0.7843137, 1, 1,
0.09305245, 0.4645444, -1.762951, 0, 0.7764706, 1, 1,
0.09800955, 0.2626712, -0.1097494, 0, 0.772549, 1, 1,
0.101624, 3.054076, -0.07156205, 0, 0.7647059, 1, 1,
0.1077661, 0.08616743, 0.4389866, 0, 0.7607843, 1, 1,
0.1088511, -0.0554892, 2.409696, 0, 0.7529412, 1, 1,
0.1089632, 0.1635159, -0.2545784, 0, 0.7490196, 1, 1,
0.1111865, 0.1410791, 0.1337732, 0, 0.7411765, 1, 1,
0.1261182, 0.3001037, 0.6959959, 0, 0.7372549, 1, 1,
0.1313233, 0.4349054, 2.457766, 0, 0.7294118, 1, 1,
0.1337319, -0.6939294, 3.524262, 0, 0.7254902, 1, 1,
0.1340168, -0.495403, 0.497939, 0, 0.7176471, 1, 1,
0.1352074, -1.252957, 1.616416, 0, 0.7137255, 1, 1,
0.1379176, -1.288885, 3.343599, 0, 0.7058824, 1, 1,
0.1405102, -0.03192205, 1.114909, 0, 0.6980392, 1, 1,
0.1408387, -0.4135643, 3.250937, 0, 0.6941177, 1, 1,
0.1433865, -0.8147423, 3.319949, 0, 0.6862745, 1, 1,
0.1445627, -0.1868789, 1.271351, 0, 0.682353, 1, 1,
0.1454665, 0.6016904, 1.09771, 0, 0.6745098, 1, 1,
0.1465217, 0.6532768, -0.4121431, 0, 0.6705883, 1, 1,
0.1467319, -1.507732, 3.898692, 0, 0.6627451, 1, 1,
0.1477248, 0.6478332, 1.666082, 0, 0.6588235, 1, 1,
0.1480347, -1.530922, 2.187309, 0, 0.6509804, 1, 1,
0.1541422, -1.207456, 1.539495, 0, 0.6470588, 1, 1,
0.1558562, -0.5280749, 2.119436, 0, 0.6392157, 1, 1,
0.162335, 0.5655589, -1.482682, 0, 0.6352941, 1, 1,
0.163763, -0.8138477, 2.163754, 0, 0.627451, 1, 1,
0.1648233, 1.851822, 1.388741, 0, 0.6235294, 1, 1,
0.1680856, 0.4174349, 0.09417889, 0, 0.6156863, 1, 1,
0.1684438, -0.5633678, 4.145606, 0, 0.6117647, 1, 1,
0.170732, -0.004859355, 0.4815661, 0, 0.6039216, 1, 1,
0.1710681, 0.7684286, 1.745216, 0, 0.5960785, 1, 1,
0.1823111, 1.256705, -0.2878743, 0, 0.5921569, 1, 1,
0.1846981, 0.09569843, 0.3429508, 0, 0.5843138, 1, 1,
0.1878877, -0.448193, 1.479224, 0, 0.5803922, 1, 1,
0.1884349, -1.52949, 5.199721, 0, 0.572549, 1, 1,
0.1901072, -0.1440401, 3.433811, 0, 0.5686275, 1, 1,
0.192657, -1.285601, 3.307384, 0, 0.5607843, 1, 1,
0.1994726, 0.4126848, 1.32926, 0, 0.5568628, 1, 1,
0.2038072, 0.1274862, 1.548723, 0, 0.5490196, 1, 1,
0.2047272, -0.5425032, -0.531404, 0, 0.5450981, 1, 1,
0.2065279, 1.6173, 0.6347411, 0, 0.5372549, 1, 1,
0.210721, 0.2917939, 2.454012, 0, 0.5333334, 1, 1,
0.2128069, -0.9936625, 1.324532, 0, 0.5254902, 1, 1,
0.2147718, 0.8478292, -1.264457, 0, 0.5215687, 1, 1,
0.2183746, -0.1011895, 1.120485, 0, 0.5137255, 1, 1,
0.2192958, 0.9936967, -0.6593394, 0, 0.509804, 1, 1,
0.2250616, 0.3505299, 0.2316522, 0, 0.5019608, 1, 1,
0.2296617, 1.619933, 0.753196, 0, 0.4941176, 1, 1,
0.2298651, 0.4328396, 2.054636, 0, 0.4901961, 1, 1,
0.2396175, -0.5013189, 4.818168, 0, 0.4823529, 1, 1,
0.240195, 1.081015, -0.8127294, 0, 0.4784314, 1, 1,
0.2434839, -0.2415734, 0.8657832, 0, 0.4705882, 1, 1,
0.2440699, 0.2513669, -0.1516644, 0, 0.4666667, 1, 1,
0.2494051, 0.1834878, 0.8795098, 0, 0.4588235, 1, 1,
0.2513431, -2.0871, 3.349606, 0, 0.454902, 1, 1,
0.2523392, 0.2877661, 0.9880059, 0, 0.4470588, 1, 1,
0.2551181, 0.8156464, -1.168114, 0, 0.4431373, 1, 1,
0.2561817, -1.810386, 3.019979, 0, 0.4352941, 1, 1,
0.2638428, -0.100315, 0.6729422, 0, 0.4313726, 1, 1,
0.2642131, -0.1906113, 2.579896, 0, 0.4235294, 1, 1,
0.2666604, 0.2236596, 1.299608, 0, 0.4196078, 1, 1,
0.2680668, -0.2354158, -0.6114517, 0, 0.4117647, 1, 1,
0.26825, 0.1035414, 2.418759, 0, 0.4078431, 1, 1,
0.2684615, -2.201474, 3.080848, 0, 0.4, 1, 1,
0.2687295, 0.1622006, 1.93977, 0, 0.3921569, 1, 1,
0.270467, 0.5085023, -0.2635221, 0, 0.3882353, 1, 1,
0.2732044, -0.276707, 2.636972, 0, 0.3803922, 1, 1,
0.273226, -1.573377, 2.084171, 0, 0.3764706, 1, 1,
0.2739696, 0.1007634, 0.194076, 0, 0.3686275, 1, 1,
0.277015, 0.1728808, 1.391988, 0, 0.3647059, 1, 1,
0.2791007, 0.6494076, -0.01949806, 0, 0.3568628, 1, 1,
0.2810066, 0.558607, -1.127527, 0, 0.3529412, 1, 1,
0.2824857, 0.91319, -0.7346144, 0, 0.345098, 1, 1,
0.2885036, -0.2997661, 3.420378, 0, 0.3411765, 1, 1,
0.3067467, -1.494406, 1.216118, 0, 0.3333333, 1, 1,
0.3089936, -0.4832898, 3.193107, 0, 0.3294118, 1, 1,
0.3106546, -1.331016, 3.587995, 0, 0.3215686, 1, 1,
0.3107547, -2.296066, 3.376699, 0, 0.3176471, 1, 1,
0.3122469, -0.02786642, 3.920765, 0, 0.3098039, 1, 1,
0.3172569, -1.656739, 3.714311, 0, 0.3058824, 1, 1,
0.3207942, 0.4832923, 0.9265003, 0, 0.2980392, 1, 1,
0.3266429, 0.1130238, 1.668284, 0, 0.2901961, 1, 1,
0.3328215, -1.054551, 1.727574, 0, 0.2862745, 1, 1,
0.3333121, 1.364085, -1.501748, 0, 0.2784314, 1, 1,
0.3379171, 0.6649463, -1.497425, 0, 0.2745098, 1, 1,
0.3406812, 0.6314225, 0.8662584, 0, 0.2666667, 1, 1,
0.3413821, 0.2677441, -1.590644, 0, 0.2627451, 1, 1,
0.3478589, 1.931208, 0.5713739, 0, 0.254902, 1, 1,
0.3503778, 1.081372, 1.150171, 0, 0.2509804, 1, 1,
0.3547392, 0.1251066, 0.9309752, 0, 0.2431373, 1, 1,
0.3673015, -0.04163153, 1.6457, 0, 0.2392157, 1, 1,
0.3701678, 0.8008805, -0.3297039, 0, 0.2313726, 1, 1,
0.3834986, 0.09812604, 1.411483, 0, 0.227451, 1, 1,
0.3884072, -0.9361226, 4.171257, 0, 0.2196078, 1, 1,
0.3897629, -1.617832, 3.077477, 0, 0.2156863, 1, 1,
0.3927977, -0.8045181, 3.046517, 0, 0.2078431, 1, 1,
0.396318, 1.791407, -0.1727126, 0, 0.2039216, 1, 1,
0.396585, -0.3122381, 2.838286, 0, 0.1960784, 1, 1,
0.3967802, -1.184641, 3.104555, 0, 0.1882353, 1, 1,
0.3987994, 0.2547864, 0.4771779, 0, 0.1843137, 1, 1,
0.4050347, 0.7922342, -1.158561, 0, 0.1764706, 1, 1,
0.4065624, -0.2885293, 2.694042, 0, 0.172549, 1, 1,
0.4073159, 2.330045, 0.7285041, 0, 0.1647059, 1, 1,
0.4077465, 0.9521769, 1.591971, 0, 0.1607843, 1, 1,
0.4078752, -0.9062027, 2.871313, 0, 0.1529412, 1, 1,
0.4091305, 2.803909, 0.2195423, 0, 0.1490196, 1, 1,
0.4095927, -1.311821, 1.291611, 0, 0.1411765, 1, 1,
0.4101453, 0.165794, 0.5585238, 0, 0.1372549, 1, 1,
0.4110414, 0.3569813, 1.129968, 0, 0.1294118, 1, 1,
0.4172602, -0.2848158, 1.780379, 0, 0.1254902, 1, 1,
0.4177906, 1.065949, 0.3554756, 0, 0.1176471, 1, 1,
0.4178617, -0.4161049, 3.344555, 0, 0.1137255, 1, 1,
0.419576, -0.168689, 0.0268679, 0, 0.1058824, 1, 1,
0.4271829, 1.93145, 1.167757, 0, 0.09803922, 1, 1,
0.4275482, -1.1115, 3.437471, 0, 0.09411765, 1, 1,
0.4277477, 0.8275556, -0.09633736, 0, 0.08627451, 1, 1,
0.4299272, 1.542114, -0.2587106, 0, 0.08235294, 1, 1,
0.4326426, -0.3594587, 0.2113802, 0, 0.07450981, 1, 1,
0.4363564, -1.088947, 1.676329, 0, 0.07058824, 1, 1,
0.436417, 1.889371, 0.2157268, 0, 0.0627451, 1, 1,
0.4524147, -1.099, 2.365675, 0, 0.05882353, 1, 1,
0.4541286, 2.16146, -0.7774884, 0, 0.05098039, 1, 1,
0.455282, -0.4959414, 1.950032, 0, 0.04705882, 1, 1,
0.4574838, -0.571191, 2.829832, 0, 0.03921569, 1, 1,
0.4589226, 1.873941, 0.6652146, 0, 0.03529412, 1, 1,
0.4601097, -1.304088, 3.449877, 0, 0.02745098, 1, 1,
0.4641726, -0.3180971, 1.290562, 0, 0.02352941, 1, 1,
0.4694746, 0.1054707, 1.977945, 0, 0.01568628, 1, 1,
0.4695296, -0.6609151, 4.513319, 0, 0.01176471, 1, 1,
0.4730671, 1.130392, -0.3107013, 0, 0.003921569, 1, 1,
0.4757169, -0.03294583, 3.602805, 0.003921569, 0, 1, 1,
0.4775093, 1.492351, 0.4346527, 0.007843138, 0, 1, 1,
0.4783598, 0.967475, 0.1891645, 0.01568628, 0, 1, 1,
0.4803004, -0.05095296, 1.935154, 0.01960784, 0, 1, 1,
0.4882693, 0.1386903, -0.3555807, 0.02745098, 0, 1, 1,
0.490514, 1.420649, 1.300957, 0.03137255, 0, 1, 1,
0.4988224, -0.1214922, 1.268588, 0.03921569, 0, 1, 1,
0.4998882, 0.2987941, 1.188866, 0.04313726, 0, 1, 1,
0.5070944, 0.447576, 0.8058292, 0.05098039, 0, 1, 1,
0.5100588, -0.4025806, 1.361653, 0.05490196, 0, 1, 1,
0.5164299, 0.8596606, -0.8973771, 0.0627451, 0, 1, 1,
0.5194911, 0.5392005, -1.044147, 0.06666667, 0, 1, 1,
0.5211448, -0.08110993, 2.091333, 0.07450981, 0, 1, 1,
0.525472, -1.140435, 2.346131, 0.07843138, 0, 1, 1,
0.5304368, 0.2520831, 1.300176, 0.08627451, 0, 1, 1,
0.5348629, 0.6000326, -0.5959327, 0.09019608, 0, 1, 1,
0.5380244, -0.588344, 1.269964, 0.09803922, 0, 1, 1,
0.5436624, 0.3503683, 1.434525, 0.1058824, 0, 1, 1,
0.5454112, -0.8197238, 3.038945, 0.1098039, 0, 1, 1,
0.5483629, 1.640477, 0.9385542, 0.1176471, 0, 1, 1,
0.5489271, -0.6671047, 2.446975, 0.1215686, 0, 1, 1,
0.5644687, -0.1127039, 1.255739, 0.1294118, 0, 1, 1,
0.5691409, -0.8923485, 2.168435, 0.1333333, 0, 1, 1,
0.5798574, -0.02335871, 1.854223, 0.1411765, 0, 1, 1,
0.5830094, 0.4221413, 2.585714, 0.145098, 0, 1, 1,
0.5841076, 0.5324606, 1.316693, 0.1529412, 0, 1, 1,
0.5865954, 0.1083798, 1.977584, 0.1568628, 0, 1, 1,
0.5908412, 0.1619789, 2.206664, 0.1647059, 0, 1, 1,
0.5924857, -0.3213004, 1.436286, 0.1686275, 0, 1, 1,
0.596559, -0.1532768, 1.417159, 0.1764706, 0, 1, 1,
0.6026868, -0.4717791, 3.192094, 0.1803922, 0, 1, 1,
0.6038982, 0.6181637, -0.1226735, 0.1882353, 0, 1, 1,
0.605412, -1.554137, 3.658767, 0.1921569, 0, 1, 1,
0.610009, 0.6083112, 0.2342075, 0.2, 0, 1, 1,
0.6110976, 0.4071283, 2.063115, 0.2078431, 0, 1, 1,
0.6131455, 0.1587902, -0.7033547, 0.2117647, 0, 1, 1,
0.61659, -0.5047156, 2.413657, 0.2196078, 0, 1, 1,
0.6221699, 0.836676, 1.473186, 0.2235294, 0, 1, 1,
0.628354, 0.6989344, 0.7887151, 0.2313726, 0, 1, 1,
0.6337814, -0.255724, 1.978741, 0.2352941, 0, 1, 1,
0.6423442, 1.371825, 1.59546, 0.2431373, 0, 1, 1,
0.6425145, 0.5032414, -0.5298262, 0.2470588, 0, 1, 1,
0.6448895, 1.257771, -0.1643526, 0.254902, 0, 1, 1,
0.6511718, -0.2743566, 2.025277, 0.2588235, 0, 1, 1,
0.6581339, -1.373702, 2.39765, 0.2666667, 0, 1, 1,
0.6589636, 0.1856432, 1.117978, 0.2705882, 0, 1, 1,
0.6628842, 0.7792753, 0.4636115, 0.2784314, 0, 1, 1,
0.664063, 0.8398902, 1.407888, 0.282353, 0, 1, 1,
0.6661478, -0.1530706, 2.255166, 0.2901961, 0, 1, 1,
0.6663301, 0.3975177, 0.1312792, 0.2941177, 0, 1, 1,
0.6668842, -1.025646, 1.583206, 0.3019608, 0, 1, 1,
0.6695475, -0.2383279, 2.318992, 0.3098039, 0, 1, 1,
0.6703306, 1.391789, 2.710324, 0.3137255, 0, 1, 1,
0.6716847, 0.4716359, 0.3660449, 0.3215686, 0, 1, 1,
0.6754688, -0.2379821, 2.001745, 0.3254902, 0, 1, 1,
0.6778727, 0.5188461, 0.5942188, 0.3333333, 0, 1, 1,
0.678557, 0.8299737, -0.972366, 0.3372549, 0, 1, 1,
0.6796597, 1.160557, 1.130131, 0.345098, 0, 1, 1,
0.6803955, -1.831892, 1.238595, 0.3490196, 0, 1, 1,
0.6830532, -0.4300235, 0.6568638, 0.3568628, 0, 1, 1,
0.6872889, 1.705551, 0.2680662, 0.3607843, 0, 1, 1,
0.6884338, 0.2565115, 2.443855, 0.3686275, 0, 1, 1,
0.689059, -0.1766436, 2.643056, 0.372549, 0, 1, 1,
0.6921949, 0.07417631, 2.950614, 0.3803922, 0, 1, 1,
0.6936965, -0.002139165, 1.628954, 0.3843137, 0, 1, 1,
0.7044834, 0.9255084, -0.1269526, 0.3921569, 0, 1, 1,
0.7061163, -0.2129087, 1.034051, 0.3960784, 0, 1, 1,
0.7062773, 0.6019653, 0.97229, 0.4039216, 0, 1, 1,
0.7124183, -1.758058, 2.461145, 0.4117647, 0, 1, 1,
0.7127141, -1.545886, 3.984017, 0.4156863, 0, 1, 1,
0.7271934, 0.1816392, 1.093762, 0.4235294, 0, 1, 1,
0.7291573, 1.024788, 0.6044722, 0.427451, 0, 1, 1,
0.7291939, 0.400652, 0.7389672, 0.4352941, 0, 1, 1,
0.7296036, 2.275924, -0.4049945, 0.4392157, 0, 1, 1,
0.730572, 0.6327698, -0.02690897, 0.4470588, 0, 1, 1,
0.7321557, 0.2272408, 0.1793754, 0.4509804, 0, 1, 1,
0.7339641, -2.04806, 2.50671, 0.4588235, 0, 1, 1,
0.7349774, 0.3040356, 1.260115, 0.4627451, 0, 1, 1,
0.7354556, -1.870908, 3.283651, 0.4705882, 0, 1, 1,
0.7379333, 0.2400636, 1.746806, 0.4745098, 0, 1, 1,
0.7445828, -2.24284, 2.373025, 0.4823529, 0, 1, 1,
0.7459224, -0.8317143, -0.1282489, 0.4862745, 0, 1, 1,
0.7490279, 0.9091251, 0.04427523, 0.4941176, 0, 1, 1,
0.755905, -1.354555, 3.983368, 0.5019608, 0, 1, 1,
0.7604083, 1.441208, 1.326337, 0.5058824, 0, 1, 1,
0.7722744, -0.02707356, 0.3170464, 0.5137255, 0, 1, 1,
0.7781492, -0.7730832, 1.497799, 0.5176471, 0, 1, 1,
0.7827144, -0.5657307, 1.161569, 0.5254902, 0, 1, 1,
0.7945352, -0.8839571, 2.371193, 0.5294118, 0, 1, 1,
0.7984907, -0.697489, 0.7962334, 0.5372549, 0, 1, 1,
0.8014089, -1.043837, 3.618645, 0.5411765, 0, 1, 1,
0.8036975, 0.001138759, 1.043709, 0.5490196, 0, 1, 1,
0.8078767, 0.05256895, 0.9366817, 0.5529412, 0, 1, 1,
0.8103173, 0.07052862, 2.088579, 0.5607843, 0, 1, 1,
0.8109792, -0.04811798, 1.751245, 0.5647059, 0, 1, 1,
0.8153942, -0.5533573, 2.124753, 0.572549, 0, 1, 1,
0.8158721, -0.2767663, 2.535014, 0.5764706, 0, 1, 1,
0.8206128, 0.2580501, 1.570932, 0.5843138, 0, 1, 1,
0.8252254, 0.4446667, 1.326296, 0.5882353, 0, 1, 1,
0.8258479, -0.6589405, 1.535402, 0.5960785, 0, 1, 1,
0.8276888, -0.441117, 1.538431, 0.6039216, 0, 1, 1,
0.8277496, 0.8888754, 0.4357775, 0.6078432, 0, 1, 1,
0.8283682, -0.7896963, 2.828755, 0.6156863, 0, 1, 1,
0.8293964, -1.028636, 4.160741, 0.6196079, 0, 1, 1,
0.8297786, 1.465244, 0.7361709, 0.627451, 0, 1, 1,
0.8307293, -0.5743125, 3.938504, 0.6313726, 0, 1, 1,
0.8317842, -0.1387267, 1.106246, 0.6392157, 0, 1, 1,
0.8317949, 0.8689099, -0.7713843, 0.6431373, 0, 1, 1,
0.8319867, 1.27731, -0.1306431, 0.6509804, 0, 1, 1,
0.8342961, 0.3347813, 1.341305, 0.654902, 0, 1, 1,
0.8395758, 0.1388732, 1.174455, 0.6627451, 0, 1, 1,
0.8403781, -0.9837663, 2.923175, 0.6666667, 0, 1, 1,
0.8418912, 0.2593612, 2.917327, 0.6745098, 0, 1, 1,
0.8502558, -0.867853, 3.234288, 0.6784314, 0, 1, 1,
0.8591463, 1.848555, -0.2514767, 0.6862745, 0, 1, 1,
0.8609453, -0.7552659, 2.253052, 0.6901961, 0, 1, 1,
0.8613781, -0.4503329, 2.655514, 0.6980392, 0, 1, 1,
0.8615869, -0.3486725, 1.935328, 0.7058824, 0, 1, 1,
0.8659817, -0.466538, 0.9682151, 0.7098039, 0, 1, 1,
0.8703151, -1.101008, 1.823851, 0.7176471, 0, 1, 1,
0.8711357, -0.7094123, 4.424122, 0.7215686, 0, 1, 1,
0.8715436, -1.582292, 4.194011, 0.7294118, 0, 1, 1,
0.8715849, 1.158304, 0.3128828, 0.7333333, 0, 1, 1,
0.8779264, -1.816326, 1.391376, 0.7411765, 0, 1, 1,
0.8790987, 1.730746, -0.0493107, 0.7450981, 0, 1, 1,
0.8811256, -0.1869074, 1.051486, 0.7529412, 0, 1, 1,
0.8853122, 0.1212661, 2.267115, 0.7568628, 0, 1, 1,
0.8872762, 0.5095334, 0.6864643, 0.7647059, 0, 1, 1,
0.8879394, -0.5716909, 2.311279, 0.7686275, 0, 1, 1,
0.889693, 1.005071, 4.047145, 0.7764706, 0, 1, 1,
0.8916655, 0.7840207, 2.013064, 0.7803922, 0, 1, 1,
0.8959967, 0.3384213, 3.606655, 0.7882353, 0, 1, 1,
0.9035462, -0.05992479, -0.7749391, 0.7921569, 0, 1, 1,
0.9040995, 0.05909305, 0.8456507, 0.8, 0, 1, 1,
0.9103575, 0.3462059, 0.5868523, 0.8078431, 0, 1, 1,
0.9131187, 1.742672, 0.5022051, 0.8117647, 0, 1, 1,
0.9144691, -0.8720073, 0.6147687, 0.8196079, 0, 1, 1,
0.9304358, 0.8485432, 1.143359, 0.8235294, 0, 1, 1,
0.9385576, 0.02049036, 1.494144, 0.8313726, 0, 1, 1,
0.9435183, 0.7816494, 1.132109, 0.8352941, 0, 1, 1,
0.9438135, 1.488308, 0.5320495, 0.8431373, 0, 1, 1,
0.9486037, 1.15269, 1.83088, 0.8470588, 0, 1, 1,
0.9487231, -2.464685, 2.048678, 0.854902, 0, 1, 1,
0.9490381, -1.982897, 2.526617, 0.8588235, 0, 1, 1,
0.9494464, 1.055627, 1.660463, 0.8666667, 0, 1, 1,
0.9504095, 0.9707183, 0.9690592, 0.8705882, 0, 1, 1,
0.9565945, -0.8729934, 3.920182, 0.8784314, 0, 1, 1,
0.9602214, -1.426288, 2.673406, 0.8823529, 0, 1, 1,
0.9605426, 0.3887112, 0.953115, 0.8901961, 0, 1, 1,
0.9622061, 0.2941842, -0.02032281, 0.8941177, 0, 1, 1,
0.9638102, -0.6580169, 1.956702, 0.9019608, 0, 1, 1,
0.9664041, -1.310058, 2.207523, 0.9098039, 0, 1, 1,
0.9677047, -1.156479, 1.865628, 0.9137255, 0, 1, 1,
0.9762707, -1.698944, 1.41969, 0.9215686, 0, 1, 1,
0.9825778, 0.2546953, 0.563565, 0.9254902, 0, 1, 1,
0.9855625, 0.02903255, 0.3905031, 0.9333333, 0, 1, 1,
0.9880208, -1.833164, 3.374422, 0.9372549, 0, 1, 1,
0.9914865, -1.586507, 3.274748, 0.945098, 0, 1, 1,
0.9959496, -2.016078, 3.045011, 0.9490196, 0, 1, 1,
0.9965975, 1.422876, -1.607424, 0.9568627, 0, 1, 1,
0.9984729, 0.5736504, 0.2345393, 0.9607843, 0, 1, 1,
1.002924, 1.704296, 0.8370872, 0.9686275, 0, 1, 1,
1.005812, -0.8763156, 1.577693, 0.972549, 0, 1, 1,
1.007342, 1.017446, 0.689462, 0.9803922, 0, 1, 1,
1.010688, 0.3360252, 2.259734, 0.9843137, 0, 1, 1,
1.013477, -0.4471093, 1.867114, 0.9921569, 0, 1, 1,
1.017271, -0.3059192, 1.64833, 0.9960784, 0, 1, 1,
1.033905, 0.1494028, 0.4996726, 1, 0, 0.9960784, 1,
1.037815, 0.05843356, -0.3962317, 1, 0, 0.9882353, 1,
1.039358, -0.6608962, 2.334896, 1, 0, 0.9843137, 1,
1.04231, -0.6630936, 2.080029, 1, 0, 0.9764706, 1,
1.044761, -0.1443502, 2.48991, 1, 0, 0.972549, 1,
1.046199, -1.098693, 2.443936, 1, 0, 0.9647059, 1,
1.047266, -2.148192, 2.175992, 1, 0, 0.9607843, 1,
1.047659, -0.6940079, 0.7982521, 1, 0, 0.9529412, 1,
1.049521, -1.567036, 2.072192, 1, 0, 0.9490196, 1,
1.053842, -0.8042448, 3.027835, 1, 0, 0.9411765, 1,
1.054877, 0.7216223, -0.5615646, 1, 0, 0.9372549, 1,
1.057716, 0.04928279, 1.640705, 1, 0, 0.9294118, 1,
1.063555, 0.2942766, 0.4894141, 1, 0, 0.9254902, 1,
1.074964, 0.4866157, 0.1182105, 1, 0, 0.9176471, 1,
1.077725, 0.2149782, 2.030678, 1, 0, 0.9137255, 1,
1.088994, -0.05057844, 0.2239433, 1, 0, 0.9058824, 1,
1.093672, -0.5643612, 0.7353429, 1, 0, 0.9019608, 1,
1.095013, 0.1561937, 0.7960518, 1, 0, 0.8941177, 1,
1.097155, 1.495166, 0.500742, 1, 0, 0.8862745, 1,
1.097388, -1.253891, 1.325843, 1, 0, 0.8823529, 1,
1.09801, -1.223966, 1.378127, 1, 0, 0.8745098, 1,
1.106207, -1.113655, 2.52265, 1, 0, 0.8705882, 1,
1.112187, 1.641311, 1.408502, 1, 0, 0.8627451, 1,
1.119373, 0.2957886, 0.1714997, 1, 0, 0.8588235, 1,
1.12156, -1.26484, 1.045345, 1, 0, 0.8509804, 1,
1.122556, -0.8570812, 2.425839, 1, 0, 0.8470588, 1,
1.124727, 0.6770053, 2.081531, 1, 0, 0.8392157, 1,
1.129905, -0.05898698, 2.45998, 1, 0, 0.8352941, 1,
1.130911, -1.182849, 2.543672, 1, 0, 0.827451, 1,
1.137905, -1.002476, 0.8344255, 1, 0, 0.8235294, 1,
1.141201, -0.8299925, 2.151437, 1, 0, 0.8156863, 1,
1.144208, 0.1377798, 0.4091092, 1, 0, 0.8117647, 1,
1.148574, 0.8321105, 1.798333, 1, 0, 0.8039216, 1,
1.15016, -0.614974, 2.235772, 1, 0, 0.7960784, 1,
1.154143, 0.8064625, 1.418383, 1, 0, 0.7921569, 1,
1.154782, 0.09738088, 1.952739, 1, 0, 0.7843137, 1,
1.157519, -1.635263, 0.9555941, 1, 0, 0.7803922, 1,
1.171523, 0.6086113, 1.55272, 1, 0, 0.772549, 1,
1.171956, 0.3306414, -0.4380499, 1, 0, 0.7686275, 1,
1.179116, -0.0007926906, 1.610399, 1, 0, 0.7607843, 1,
1.180246, -0.003845814, 1.98778, 1, 0, 0.7568628, 1,
1.190978, -0.0598946, 2.641908, 1, 0, 0.7490196, 1,
1.192891, -1.120236, 4.862858, 1, 0, 0.7450981, 1,
1.200346, -0.5076822, 1.924483, 1, 0, 0.7372549, 1,
1.205275, 0.6455908, 0.4858136, 1, 0, 0.7333333, 1,
1.207979, 1.168256, 0.03286795, 1, 0, 0.7254902, 1,
1.211486, -0.593313, 2.473861, 1, 0, 0.7215686, 1,
1.219087, 1.475161, 1.909905, 1, 0, 0.7137255, 1,
1.223361, -0.0003423001, 2.822605, 1, 0, 0.7098039, 1,
1.22927, 0.8841201, 2.334135, 1, 0, 0.7019608, 1,
1.22931, 0.4922577, 0.341204, 1, 0, 0.6941177, 1,
1.229901, -0.7938291, 1.694378, 1, 0, 0.6901961, 1,
1.233646, -0.09119047, 1.47227, 1, 0, 0.682353, 1,
1.234343, 1.046274, 0.7370904, 1, 0, 0.6784314, 1,
1.237328, 0.2707633, 1.219568, 1, 0, 0.6705883, 1,
1.239137, -0.6330732, 2.606319, 1, 0, 0.6666667, 1,
1.243601, -1.114461, 1.198388, 1, 0, 0.6588235, 1,
1.244181, -1.700763, 3.431824, 1, 0, 0.654902, 1,
1.244901, 0.005578802, 1.47281, 1, 0, 0.6470588, 1,
1.253455, -0.9819458, 1.293744, 1, 0, 0.6431373, 1,
1.255864, -1.001344, 1.032424, 1, 0, 0.6352941, 1,
1.277813, 1.155664, 1.512578, 1, 0, 0.6313726, 1,
1.28135, -0.5298237, 1.310768, 1, 0, 0.6235294, 1,
1.286157, 1.064147, 0.95921, 1, 0, 0.6196079, 1,
1.28929, -0.6700856, 1.661326, 1, 0, 0.6117647, 1,
1.300185, 0.8924797, 2.14661, 1, 0, 0.6078432, 1,
1.303155, -0.8030983, 1.525224, 1, 0, 0.6, 1,
1.303495, -0.8204121, 3.440336, 1, 0, 0.5921569, 1,
1.30395, -0.990183, 0.2353914, 1, 0, 0.5882353, 1,
1.303961, 0.8311504, 2.027529, 1, 0, 0.5803922, 1,
1.309165, -1.16256, 1.126214, 1, 0, 0.5764706, 1,
1.317404, 1.217641, 2.097717, 1, 0, 0.5686275, 1,
1.32654, 0.1364084, 1.406189, 1, 0, 0.5647059, 1,
1.328802, -0.1035451, -0.03448401, 1, 0, 0.5568628, 1,
1.3326, 0.02709665, 2.362905, 1, 0, 0.5529412, 1,
1.343485, 1.384879, 0.4889546, 1, 0, 0.5450981, 1,
1.346116, 0.334673, 2.699405, 1, 0, 0.5411765, 1,
1.356503, 0.07654387, 2.638956, 1, 0, 0.5333334, 1,
1.361004, 0.2504365, 2.258429, 1, 0, 0.5294118, 1,
1.361263, 0.7522178, 0.007934632, 1, 0, 0.5215687, 1,
1.366277, 0.106065, 2.279797, 1, 0, 0.5176471, 1,
1.379633, 0.1239807, 3.505382, 1, 0, 0.509804, 1,
1.383029, -0.5079752, 0.5088218, 1, 0, 0.5058824, 1,
1.391629, -1.769139, 3.367121, 1, 0, 0.4980392, 1,
1.396389, 1.117373, -0.4928469, 1, 0, 0.4901961, 1,
1.401434, 0.5180206, 1.398636, 1, 0, 0.4862745, 1,
1.415034, -0.6058512, 2.564037, 1, 0, 0.4784314, 1,
1.420746, 0.7036011, -0.1241158, 1, 0, 0.4745098, 1,
1.422442, 1.372109, -0.2413145, 1, 0, 0.4666667, 1,
1.424462, 1.154784, 1.373842, 1, 0, 0.4627451, 1,
1.43277, -1.096785, 3.326984, 1, 0, 0.454902, 1,
1.438406, 1.059566, 2.293956, 1, 0, 0.4509804, 1,
1.451629, 0.4135889, 1.870192, 1, 0, 0.4431373, 1,
1.454113, 0.1569761, 2.550202, 1, 0, 0.4392157, 1,
1.454609, -0.808889, 1.63391, 1, 0, 0.4313726, 1,
1.456365, -0.1731514, 0.9259509, 1, 0, 0.427451, 1,
1.486476, 0.08646936, 0.7040992, 1, 0, 0.4196078, 1,
1.506005, 0.01767885, 0.4788229, 1, 0, 0.4156863, 1,
1.510263, -0.9213824, 3.173694, 1, 0, 0.4078431, 1,
1.512658, 0.04674472, 1.031069, 1, 0, 0.4039216, 1,
1.535326, -0.8305758, 3.156122, 1, 0, 0.3960784, 1,
1.541407, -0.03985889, 0.6377864, 1, 0, 0.3882353, 1,
1.545191, 1.039593, 1.454225, 1, 0, 0.3843137, 1,
1.548189, -0.6832751, 2.864887, 1, 0, 0.3764706, 1,
1.562351, -0.3736311, 3.651729, 1, 0, 0.372549, 1,
1.590009, -0.301097, 2.933156, 1, 0, 0.3647059, 1,
1.59729, 0.05992319, 0.4779657, 1, 0, 0.3607843, 1,
1.598039, -1.130993, 2.548613, 1, 0, 0.3529412, 1,
1.602963, 1.051895, 0.5209565, 1, 0, 0.3490196, 1,
1.621246, -2.088974, 0.3270296, 1, 0, 0.3411765, 1,
1.637302, -1.43017, 2.823231, 1, 0, 0.3372549, 1,
1.637579, -1.064811, 1.974704, 1, 0, 0.3294118, 1,
1.642879, -0.2154253, 2.062966, 1, 0, 0.3254902, 1,
1.647006, 0.01695632, 0.7110545, 1, 0, 0.3176471, 1,
1.678138, 0.1103703, 0.8922997, 1, 0, 0.3137255, 1,
1.679328, 0.2043204, 2.670968, 1, 0, 0.3058824, 1,
1.687756, 1.406925, 1.475163, 1, 0, 0.2980392, 1,
1.689197, -1.059972, 2.13535, 1, 0, 0.2941177, 1,
1.699184, -1.043901, 1.179392, 1, 0, 0.2862745, 1,
1.699609, -1.117293, 2.92531, 1, 0, 0.282353, 1,
1.73919, 0.3710093, 0.484493, 1, 0, 0.2745098, 1,
1.739358, -1.182549, 3.314502, 1, 0, 0.2705882, 1,
1.744629, -1.415025, 2.953205, 1, 0, 0.2627451, 1,
1.747238, -0.5553705, 2.730897, 1, 0, 0.2588235, 1,
1.752717, 0.9438955, 0.1034967, 1, 0, 0.2509804, 1,
1.752817, -0.4644315, 0.5315695, 1, 0, 0.2470588, 1,
1.753438, -0.2129857, 0.8136615, 1, 0, 0.2392157, 1,
1.76187, -0.118034, 1.404041, 1, 0, 0.2352941, 1,
1.770308, -0.8813229, 2.807877, 1, 0, 0.227451, 1,
1.77075, 0.9507861, -0.7718567, 1, 0, 0.2235294, 1,
1.787083, 1.375243, -0.107612, 1, 0, 0.2156863, 1,
1.810518, -0.02367498, 1.342128, 1, 0, 0.2117647, 1,
1.812147, -0.9629208, 2.167074, 1, 0, 0.2039216, 1,
1.812742, -0.6646898, 2.090964, 1, 0, 0.1960784, 1,
1.821132, 0.1203556, 3.210718, 1, 0, 0.1921569, 1,
1.825091, -0.3678893, 1.299741, 1, 0, 0.1843137, 1,
1.826927, -2.500714, 2.252488, 1, 0, 0.1803922, 1,
1.829516, -0.4409996, 1.292012, 1, 0, 0.172549, 1,
1.834527, 1.866879, 0.6233853, 1, 0, 0.1686275, 1,
1.836723, -1.72164, 4.028807, 1, 0, 0.1607843, 1,
1.837371, 1.971542, 1.137675, 1, 0, 0.1568628, 1,
1.837527, -1.917886, 2.043687, 1, 0, 0.1490196, 1,
1.866377, 1.166373, 0.05869846, 1, 0, 0.145098, 1,
1.871189, 0.2704284, 0.6839717, 1, 0, 0.1372549, 1,
1.875208, -1.427459, 1.961671, 1, 0, 0.1333333, 1,
1.892556, 3.259601, 1.090767, 1, 0, 0.1254902, 1,
1.901911, 0.6832172, 0.02637017, 1, 0, 0.1215686, 1,
1.909729, -1.036493, 1.613378, 1, 0, 0.1137255, 1,
1.929791, -1.208961, 2.512011, 1, 0, 0.1098039, 1,
1.966057, -0.4099721, 3.678253, 1, 0, 0.1019608, 1,
1.994626, -0.4740236, 0.8275384, 1, 0, 0.09411765, 1,
2.009581, -1.709586, 3.375224, 1, 0, 0.09019608, 1,
2.060833, -0.8669012, 2.719771, 1, 0, 0.08235294, 1,
2.102662, 0.4231781, 1.638394, 1, 0, 0.07843138, 1,
2.168059, 1.467938, -0.6662131, 1, 0, 0.07058824, 1,
2.171204, -1.305318, 2.339021, 1, 0, 0.06666667, 1,
2.17203, -1.701958, 1.754404, 1, 0, 0.05882353, 1,
2.276194, -0.06047298, 2.00956, 1, 0, 0.05490196, 1,
2.285165, -1.217699, 2.190703, 1, 0, 0.04705882, 1,
2.304231, -0.3771182, 2.340521, 1, 0, 0.04313726, 1,
2.315018, 0.245336, 1.38491, 1, 0, 0.03529412, 1,
2.43449, -0.9019767, 1.349753, 1, 0, 0.03137255, 1,
2.670135, -0.1412992, 4.019398, 1, 0, 0.02352941, 1,
2.717818, 0.2570612, 2.184556, 1, 0, 0.01960784, 1,
2.864411, -0.4917776, 2.694779, 1, 0, 0.01176471, 1,
3.283912, -1.725864, 1.299551, 1, 0, 0.007843138, 1
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
-0.1686866, -3.858316, -8.405726, 0, -0.5, 0.5, 0.5,
-0.1686866, -3.858316, -8.405726, 1, -0.5, 0.5, 0.5,
-0.1686866, -3.858316, -8.405726, 1, 1.5, 0.5, 0.5,
-0.1686866, -3.858316, -8.405726, 0, 1.5, 0.5, 0.5
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
-4.791717, 0.3877877, -8.405726, 0, -0.5, 0.5, 0.5,
-4.791717, 0.3877877, -8.405726, 1, -0.5, 0.5, 0.5,
-4.791717, 0.3877877, -8.405726, 1, 1.5, 0.5, 0.5,
-4.791717, 0.3877877, -8.405726, 0, 1.5, 0.5, 0.5
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
-4.791717, -3.858316, -0.6170583, 0, -0.5, 0.5, 0.5,
-4.791717, -3.858316, -0.6170583, 1, -0.5, 0.5, 0.5,
-4.791717, -3.858316, -0.6170583, 1, 1.5, 0.5, 0.5,
-4.791717, -3.858316, -0.6170583, 0, 1.5, 0.5, 0.5
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
-3, -2.878446, -6.608341,
3, -2.878446, -6.608341,
-3, -2.878446, -6.608341,
-3, -3.041758, -6.907906,
-2, -2.878446, -6.608341,
-2, -3.041758, -6.907906,
-1, -2.878446, -6.608341,
-1, -3.041758, -6.907906,
0, -2.878446, -6.608341,
0, -3.041758, -6.907906,
1, -2.878446, -6.608341,
1, -3.041758, -6.907906,
2, -2.878446, -6.608341,
2, -3.041758, -6.907906,
3, -2.878446, -6.608341,
3, -3.041758, -6.907906
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
-3, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
-3, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
-3, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
-3, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
-2, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
-2, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
-2, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
-2, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
-1, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
-1, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
-1, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
-1, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
0, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
0, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
0, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
0, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
1, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
1, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
1, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
1, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
2, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
2, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
2, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
2, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5,
3, -3.368382, -7.507034, 0, -0.5, 0.5, 0.5,
3, -3.368382, -7.507034, 1, -0.5, 0.5, 0.5,
3, -3.368382, -7.507034, 1, 1.5, 0.5, 0.5,
3, -3.368382, -7.507034, 0, 1.5, 0.5, 0.5
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
-3.724864, -2, -6.608341,
-3.724864, 3, -6.608341,
-3.724864, -2, -6.608341,
-3.902673, -2, -6.907906,
-3.724864, -1, -6.608341,
-3.902673, -1, -6.907906,
-3.724864, 0, -6.608341,
-3.902673, 0, -6.907906,
-3.724864, 1, -6.608341,
-3.902673, 1, -6.907906,
-3.724864, 2, -6.608341,
-3.902673, 2, -6.907906,
-3.724864, 3, -6.608341,
-3.902673, 3, -6.907906
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
-4.25829, -2, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, -2, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, -2, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, -2, -7.507034, 0, 1.5, 0.5, 0.5,
-4.25829, -1, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, -1, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, -1, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, -1, -7.507034, 0, 1.5, 0.5, 0.5,
-4.25829, 0, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, 0, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, 0, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, 0, -7.507034, 0, 1.5, 0.5, 0.5,
-4.25829, 1, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, 1, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, 1, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, 1, -7.507034, 0, 1.5, 0.5, 0.5,
-4.25829, 2, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, 2, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, 2, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, 2, -7.507034, 0, 1.5, 0.5, 0.5,
-4.25829, 3, -7.507034, 0, -0.5, 0.5, 0.5,
-4.25829, 3, -7.507034, 1, -0.5, 0.5, 0.5,
-4.25829, 3, -7.507034, 1, 1.5, 0.5, 0.5,
-4.25829, 3, -7.507034, 0, 1.5, 0.5, 0.5
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
-3.724864, -2.878446, -6,
-3.724864, -2.878446, 4,
-3.724864, -2.878446, -6,
-3.902673, -3.041758, -6,
-3.724864, -2.878446, -4,
-3.902673, -3.041758, -4,
-3.724864, -2.878446, -2,
-3.902673, -3.041758, -2,
-3.724864, -2.878446, 0,
-3.902673, -3.041758, 0,
-3.724864, -2.878446, 2,
-3.902673, -3.041758, 2,
-3.724864, -2.878446, 4,
-3.902673, -3.041758, 4
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
-4.25829, -3.368382, -6, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -6, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -6, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, -6, 0, 1.5, 0.5, 0.5,
-4.25829, -3.368382, -4, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -4, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -4, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, -4, 0, 1.5, 0.5, 0.5,
-4.25829, -3.368382, -2, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -2, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, -2, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, -2, 0, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 0, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 0, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 0, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 0, 0, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 2, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 2, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 2, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 2, 0, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 4, 0, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 4, 1, -0.5, 0.5, 0.5,
-4.25829, -3.368382, 4, 1, 1.5, 0.5, 0.5,
-4.25829, -3.368382, 4, 0, 1.5, 0.5, 0.5
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
-3.724864, -2.878446, -6.608341,
-3.724864, 3.654022, -6.608341,
-3.724864, -2.878446, 5.374225,
-3.724864, 3.654022, 5.374225,
-3.724864, -2.878446, -6.608341,
-3.724864, -2.878446, 5.374225,
-3.724864, 3.654022, -6.608341,
-3.724864, 3.654022, 5.374225,
-3.724864, -2.878446, -6.608341,
3.38749, -2.878446, -6.608341,
-3.724864, -2.878446, 5.374225,
3.38749, -2.878446, 5.374225,
-3.724864, 3.654022, -6.608341,
3.38749, 3.654022, -6.608341,
-3.724864, 3.654022, 5.374225,
3.38749, 3.654022, 5.374225,
3.38749, -2.878446, -6.608341,
3.38749, 3.654022, -6.608341,
3.38749, -2.878446, 5.374225,
3.38749, 3.654022, 5.374225,
3.38749, -2.878446, -6.608341,
3.38749, -2.878446, 5.374225,
3.38749, 3.654022, -6.608341,
3.38749, 3.654022, 5.374225
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
var radius = 8.217762;
var distance = 36.56175;
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
mvMatrix.translate( 0.1686866, -0.3877877, 0.6170583 );
mvMatrix.scale( 1.249264, 1.36016, 0.741511 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.56175);
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


