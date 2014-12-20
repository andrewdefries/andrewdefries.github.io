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
-2.976752, 1.085323, -0.8794265, 1, 0, 0, 1,
-2.47174, 0.07929943, -1.45982, 1, 0.007843138, 0, 1,
-2.463756, -0.6719465, 0.09776992, 1, 0.01176471, 0, 1,
-2.415414, -0.5986223, -1.672382, 1, 0.01960784, 0, 1,
-2.412534, 0.7450229, -1.688688, 1, 0.02352941, 0, 1,
-2.335667, -1.483539, -1.960331, 1, 0.03137255, 0, 1,
-2.328618, 0.8495914, -1.786269, 1, 0.03529412, 0, 1,
-2.326135, 0.04772589, -1.230098, 1, 0.04313726, 0, 1,
-2.31881, 0.4753435, -2.22178, 1, 0.04705882, 0, 1,
-2.273158, 0.3613077, -0.6312014, 1, 0.05490196, 0, 1,
-2.266732, -0.5412775, -2.758142, 1, 0.05882353, 0, 1,
-2.225724, -1.629068, -2.152997, 1, 0.06666667, 0, 1,
-2.200307, 0.4973442, -0.2840411, 1, 0.07058824, 0, 1,
-2.17803, 0.5740658, -0.01317701, 1, 0.07843138, 0, 1,
-2.156037, -0.4460934, -0.1847747, 1, 0.08235294, 0, 1,
-2.147929, 0.1591019, -0.3755228, 1, 0.09019608, 0, 1,
-2.147175, 1.838132, -1.179618, 1, 0.09411765, 0, 1,
-2.131043, 1.218253, -1.456035, 1, 0.1019608, 0, 1,
-2.123124, 0.4909921, 0.03560998, 1, 0.1098039, 0, 1,
-2.107319, -0.7559611, -2.93381, 1, 0.1137255, 0, 1,
-2.096498, 0.115847, -1.250891, 1, 0.1215686, 0, 1,
-2.096329, 0.4206156, -0.2632869, 1, 0.1254902, 0, 1,
-2.035372, 0.4395097, -1.105627, 1, 0.1333333, 0, 1,
-2.030564, -2.008471, -0.8659675, 1, 0.1372549, 0, 1,
-2.02725, -0.3527487, -2.224963, 1, 0.145098, 0, 1,
-2.021353, 0.7231796, -1.023147, 1, 0.1490196, 0, 1,
-2.019217, -0.07053518, -0.8674675, 1, 0.1568628, 0, 1,
-2.008734, 0.4271798, -1.747132, 1, 0.1607843, 0, 1,
-1.999149, 0.5392743, -2.009605, 1, 0.1686275, 0, 1,
-1.991986, -0.589524, -1.878566, 1, 0.172549, 0, 1,
-1.988824, -0.9996657, -3.687827, 1, 0.1803922, 0, 1,
-1.987198, -0.738676, -3.013813, 1, 0.1843137, 0, 1,
-1.96236, 0.2759139, 0.08431396, 1, 0.1921569, 0, 1,
-1.873971, 0.3870817, -1.59402, 1, 0.1960784, 0, 1,
-1.86307, -0.2596699, -1.968214, 1, 0.2039216, 0, 1,
-1.861784, -0.4115213, -2.091466, 1, 0.2117647, 0, 1,
-1.833264, -1.701413, -3.020686, 1, 0.2156863, 0, 1,
-1.828101, 1.28548, -0.3490568, 1, 0.2235294, 0, 1,
-1.819045, 1.035836, -1.046316, 1, 0.227451, 0, 1,
-1.813135, 0.7143039, -2.328426, 1, 0.2352941, 0, 1,
-1.791328, 0.7253934, -0.7108112, 1, 0.2392157, 0, 1,
-1.785139, -2.198403, -2.203448, 1, 0.2470588, 0, 1,
-1.775231, -1.377049, -3.020668, 1, 0.2509804, 0, 1,
-1.772543, 0.3861573, -3.641618, 1, 0.2588235, 0, 1,
-1.766657, -0.7556022, -2.458399, 1, 0.2627451, 0, 1,
-1.751298, 0.3042845, -1.321214, 1, 0.2705882, 0, 1,
-1.750321, -0.1410432, -0.5800948, 1, 0.2745098, 0, 1,
-1.73685, 0.9894031, -1.003311, 1, 0.282353, 0, 1,
-1.722237, -0.3593514, -1.404947, 1, 0.2862745, 0, 1,
-1.698324, -1.520325, -2.676902, 1, 0.2941177, 0, 1,
-1.69352, -3.085472, -2.985605, 1, 0.3019608, 0, 1,
-1.674549, 1.230602, -1.303238, 1, 0.3058824, 0, 1,
-1.662439, -0.4729901, -2.040103, 1, 0.3137255, 0, 1,
-1.656601, 0.4983933, -1.134843, 1, 0.3176471, 0, 1,
-1.653582, 2.945731, 0.436703, 1, 0.3254902, 0, 1,
-1.653318, 0.5783393, -0.8508682, 1, 0.3294118, 0, 1,
-1.647422, -0.1122529, -1.777715, 1, 0.3372549, 0, 1,
-1.645184, -0.361293, -3.858181, 1, 0.3411765, 0, 1,
-1.624009, 0.6580083, -1.784807, 1, 0.3490196, 0, 1,
-1.597366, 0.9536431, -1.470472, 1, 0.3529412, 0, 1,
-1.591628, -1.100759, -2.984626, 1, 0.3607843, 0, 1,
-1.576584, 0.2550834, -1.574799, 1, 0.3647059, 0, 1,
-1.565493, -1.661751, -3.020974, 1, 0.372549, 0, 1,
-1.562475, -0.02387941, -0.5117152, 1, 0.3764706, 0, 1,
-1.554001, -0.3485995, -2.597998, 1, 0.3843137, 0, 1,
-1.550884, 0.2344687, -0.5064754, 1, 0.3882353, 0, 1,
-1.546174, -0.8095174, -0.4732932, 1, 0.3960784, 0, 1,
-1.531878, -0.836082, -2.37581, 1, 0.4039216, 0, 1,
-1.516914, -2.032024, -1.433301, 1, 0.4078431, 0, 1,
-1.515583, 1.814146, -0.7050683, 1, 0.4156863, 0, 1,
-1.514519, -0.9091837, -0.4700371, 1, 0.4196078, 0, 1,
-1.504367, 2.107882, 0.7113621, 1, 0.427451, 0, 1,
-1.495178, -0.2672914, -3.047525, 1, 0.4313726, 0, 1,
-1.49315, -0.04978201, -1.928299, 1, 0.4392157, 0, 1,
-1.489608, -0.4102452, -1.917654, 1, 0.4431373, 0, 1,
-1.483464, -0.7086935, -2.03126, 1, 0.4509804, 0, 1,
-1.474587, -0.8297225, -1.187894, 1, 0.454902, 0, 1,
-1.467253, 0.5533596, 0.077303, 1, 0.4627451, 0, 1,
-1.445749, -1.057584, -1.46384, 1, 0.4666667, 0, 1,
-1.440918, 0.9039106, 1.593864, 1, 0.4745098, 0, 1,
-1.439414, 0.4646202, 0.3981907, 1, 0.4784314, 0, 1,
-1.435153, -1.296898, -4.082668, 1, 0.4862745, 0, 1,
-1.430878, 0.009293353, -1.445208, 1, 0.4901961, 0, 1,
-1.429509, 0.9356055, 0.02202044, 1, 0.4980392, 0, 1,
-1.429484, 1.726947, 0.4795465, 1, 0.5058824, 0, 1,
-1.428766, -0.07395656, 0.03839654, 1, 0.509804, 0, 1,
-1.425481, 1.115557, -0.7662338, 1, 0.5176471, 0, 1,
-1.417153, -0.3279245, -1.032174, 1, 0.5215687, 0, 1,
-1.409809, 0.799826, -0.04607317, 1, 0.5294118, 0, 1,
-1.407854, 0.5950044, -1.542822, 1, 0.5333334, 0, 1,
-1.385977, -1.344547, -2.677395, 1, 0.5411765, 0, 1,
-1.366549, 1.736628, -0.3552323, 1, 0.5450981, 0, 1,
-1.364281, -0.2189907, -2.334135, 1, 0.5529412, 0, 1,
-1.349942, -0.2340009, -1.992832, 1, 0.5568628, 0, 1,
-1.343093, -0.5202411, -2.419349, 1, 0.5647059, 0, 1,
-1.333284, -0.6095604, -2.338459, 1, 0.5686275, 0, 1,
-1.332412, -0.3420878, -1.862791, 1, 0.5764706, 0, 1,
-1.320481, -0.2789577, -2.492325, 1, 0.5803922, 0, 1,
-1.311031, 0.8884372, -0.6047516, 1, 0.5882353, 0, 1,
-1.295528, -0.4846986, -3.05, 1, 0.5921569, 0, 1,
-1.294057, 0.7683311, -0.4789848, 1, 0.6, 0, 1,
-1.288619, -0.5782229, -3.271972, 1, 0.6078432, 0, 1,
-1.288086, -1.051264, -0.4387548, 1, 0.6117647, 0, 1,
-1.277856, -0.9133117, -2.636646, 1, 0.6196079, 0, 1,
-1.272386, -0.4471849, -0.4921598, 1, 0.6235294, 0, 1,
-1.251837, -0.1083152, -2.322397, 1, 0.6313726, 0, 1,
-1.231922, 2.782146, 0.01854797, 1, 0.6352941, 0, 1,
-1.217726, -0.164842, -1.668488, 1, 0.6431373, 0, 1,
-1.209923, 1.553297, -0.7469131, 1, 0.6470588, 0, 1,
-1.207683, -0.1686542, -1.254624, 1, 0.654902, 0, 1,
-1.207499, -0.6516349, -2.839083, 1, 0.6588235, 0, 1,
-1.20629, -0.3630584, -3.613423, 1, 0.6666667, 0, 1,
-1.179199, -0.4373612, -0.7333276, 1, 0.6705883, 0, 1,
-1.169454, -0.09663263, -3.084801, 1, 0.6784314, 0, 1,
-1.160603, -0.3594089, -2.93671, 1, 0.682353, 0, 1,
-1.160536, -0.2834301, -2.322012, 1, 0.6901961, 0, 1,
-1.158038, 1.987447, -0.5001514, 1, 0.6941177, 0, 1,
-1.148511, 1.20462, -1.464823, 1, 0.7019608, 0, 1,
-1.144775, -0.9306124, -3.646217, 1, 0.7098039, 0, 1,
-1.14387, 0.1770864, -1.572372, 1, 0.7137255, 0, 1,
-1.143769, -1.212719, -3.826462, 1, 0.7215686, 0, 1,
-1.139285, -0.2437793, -2.580845, 1, 0.7254902, 0, 1,
-1.137967, 1.109464, -0.628841, 1, 0.7333333, 0, 1,
-1.135381, -1.291102, -2.658355, 1, 0.7372549, 0, 1,
-1.128021, 2.307843, -0.4338846, 1, 0.7450981, 0, 1,
-1.126185, 1.52849, -0.3440117, 1, 0.7490196, 0, 1,
-1.125316, 1.724948, 0.03656295, 1, 0.7568628, 0, 1,
-1.123474, -0.4869611, -1.702607, 1, 0.7607843, 0, 1,
-1.10857, -0.7215559, -2.721385, 1, 0.7686275, 0, 1,
-1.105242, 0.01720459, -2.054971, 1, 0.772549, 0, 1,
-1.100206, 2.958326, -0.4968725, 1, 0.7803922, 0, 1,
-1.090833, -0.2850275, -1.796251, 1, 0.7843137, 0, 1,
-1.075527, -0.04014535, 0.6434318, 1, 0.7921569, 0, 1,
-1.071748, -0.2257378, -0.8883046, 1, 0.7960784, 0, 1,
-1.070866, -0.862376, -1.804269, 1, 0.8039216, 0, 1,
-1.067839, -1.409577, -1.494532, 1, 0.8117647, 0, 1,
-1.065591, 1.36006, 0.001012522, 1, 0.8156863, 0, 1,
-1.058941, -0.2464573, -0.4568674, 1, 0.8235294, 0, 1,
-1.057656, 0.5101495, -2.019664, 1, 0.827451, 0, 1,
-1.055058, 2.077712, 1.694707, 1, 0.8352941, 0, 1,
-1.053489, -0.258439, -1.338548, 1, 0.8392157, 0, 1,
-1.051142, -1.368631, -1.446659, 1, 0.8470588, 0, 1,
-1.048781, 0.2880236, 0.6719614, 1, 0.8509804, 0, 1,
-1.040979, -0.6176286, -3.133389, 1, 0.8588235, 0, 1,
-1.03547, 2.277481, 0.3590735, 1, 0.8627451, 0, 1,
-1.034508, 0.645354, -1.830746, 1, 0.8705882, 0, 1,
-1.029068, 1.402145, -0.04943177, 1, 0.8745098, 0, 1,
-1.028639, -0.4314086, -1.769963, 1, 0.8823529, 0, 1,
-1.022758, 0.7320287, -2.307054, 1, 0.8862745, 0, 1,
-1.019546, -0.9553724, -2.711862, 1, 0.8941177, 0, 1,
-1.006156, 0.6707292, -1.360682, 1, 0.8980392, 0, 1,
-1.005324, -1.176536, -3.622079, 1, 0.9058824, 0, 1,
-0.9990703, 1.5864, 0.1563165, 1, 0.9137255, 0, 1,
-0.9971976, -0.7097245, -1.736446, 1, 0.9176471, 0, 1,
-0.9873716, -0.07232201, -1.712008, 1, 0.9254902, 0, 1,
-0.9779328, -0.4471396, -0.3839197, 1, 0.9294118, 0, 1,
-0.9717191, -1.190485, -3.300169, 1, 0.9372549, 0, 1,
-0.9631634, 0.4604555, -0.5654538, 1, 0.9411765, 0, 1,
-0.9610454, 1.276676, -1.144819, 1, 0.9490196, 0, 1,
-0.9597037, -1.043027, -2.223451, 1, 0.9529412, 0, 1,
-0.9579474, -0.2964896, -1.106992, 1, 0.9607843, 0, 1,
-0.9524256, 1.508484, -1.492018, 1, 0.9647059, 0, 1,
-0.946225, -0.257884, -2.80932, 1, 0.972549, 0, 1,
-0.9400461, -0.5194772, -2.35796, 1, 0.9764706, 0, 1,
-0.9263493, -1.361883, -4.24558, 1, 0.9843137, 0, 1,
-0.92498, -0.07816183, -2.643012, 1, 0.9882353, 0, 1,
-0.9190032, -0.7717053, -2.686809, 1, 0.9960784, 0, 1,
-0.918863, -1.160826, -3.890579, 0.9960784, 1, 0, 1,
-0.9153399, -1.714673, -2.908293, 0.9921569, 1, 0, 1,
-0.9144583, -0.2005581, -2.727135, 0.9843137, 1, 0, 1,
-0.9138987, 1.654696, 0.8762655, 0.9803922, 1, 0, 1,
-0.9136965, 0.5199068, -0.7044752, 0.972549, 1, 0, 1,
-0.9135554, -2.009953, -3.830055, 0.9686275, 1, 0, 1,
-0.910455, 0.5080611, -2.363976, 0.9607843, 1, 0, 1,
-0.9084731, -0.2270688, -1.341967, 0.9568627, 1, 0, 1,
-0.9081475, -0.193814, -2.156086, 0.9490196, 1, 0, 1,
-0.9061714, 2.331698, 0.4330979, 0.945098, 1, 0, 1,
-0.8968743, 1.107334, -0.8847615, 0.9372549, 1, 0, 1,
-0.895249, 1.413951, 0.07343405, 0.9333333, 1, 0, 1,
-0.8950722, 0.0265879, -1.573689, 0.9254902, 1, 0, 1,
-0.8902999, 1.231284, 0.02503254, 0.9215686, 1, 0, 1,
-0.8699487, 0.8982978, -1.805473, 0.9137255, 1, 0, 1,
-0.8682156, 1.421617, -1.303531, 0.9098039, 1, 0, 1,
-0.8672355, -0.8491114, -1.918353, 0.9019608, 1, 0, 1,
-0.8646573, -3.000619, -2.839205, 0.8941177, 1, 0, 1,
-0.8638817, -0.3419871, 0.5876979, 0.8901961, 1, 0, 1,
-0.8586918, -0.9648598, -3.514432, 0.8823529, 1, 0, 1,
-0.8571191, -1.987593, -2.088878, 0.8784314, 1, 0, 1,
-0.8523927, -1.750257, -2.670839, 0.8705882, 1, 0, 1,
-0.8506327, -1.852312, -3.430378, 0.8666667, 1, 0, 1,
-0.8419986, 0.5724227, -2.54976, 0.8588235, 1, 0, 1,
-0.835408, -0.4353754, -0.9643821, 0.854902, 1, 0, 1,
-0.8322748, 0.1127781, -3.371517, 0.8470588, 1, 0, 1,
-0.8318143, 0.8384265, -1.374768, 0.8431373, 1, 0, 1,
-0.8285927, -0.414231, -2.294636, 0.8352941, 1, 0, 1,
-0.8283397, 1.196409, -1.012982, 0.8313726, 1, 0, 1,
-0.8220109, -0.945636, -0.1865592, 0.8235294, 1, 0, 1,
-0.8213676, -1.72765, -2.063412, 0.8196079, 1, 0, 1,
-0.8181223, 1.420694, 0.8342406, 0.8117647, 1, 0, 1,
-0.8170802, 0.1091611, -0.2219159, 0.8078431, 1, 0, 1,
-0.8160699, -0.4612156, -2.748196, 0.8, 1, 0, 1,
-0.8137256, -0.1695944, -3.903661, 0.7921569, 1, 0, 1,
-0.8136262, -0.3170188, -3.103322, 0.7882353, 1, 0, 1,
-0.8125893, -0.5315064, -3.054642, 0.7803922, 1, 0, 1,
-0.812313, 0.3003639, -2.477828, 0.7764706, 1, 0, 1,
-0.8074355, 0.8754451, -3.132522, 0.7686275, 1, 0, 1,
-0.7987899, -0.02698942, -1.327954, 0.7647059, 1, 0, 1,
-0.7984464, 0.9047108, 0.03854316, 0.7568628, 1, 0, 1,
-0.7946801, 0.07654746, -1.521355, 0.7529412, 1, 0, 1,
-0.7929572, -0.01589203, -1.542112, 0.7450981, 1, 0, 1,
-0.7925529, 0.03580147, -1.303176, 0.7411765, 1, 0, 1,
-0.7856391, -0.5208662, -2.167805, 0.7333333, 1, 0, 1,
-0.7835702, -0.2460574, -0.5575226, 0.7294118, 1, 0, 1,
-0.7808489, 0.300466, -0.5558605, 0.7215686, 1, 0, 1,
-0.7763948, 0.2958927, -2.202518, 0.7176471, 1, 0, 1,
-0.7757581, 0.01366089, -1.349645, 0.7098039, 1, 0, 1,
-0.7748432, -0.8118177, -1.486627, 0.7058824, 1, 0, 1,
-0.7743014, -1.107291, -2.650735, 0.6980392, 1, 0, 1,
-0.7734669, 0.2748677, -1.003127, 0.6901961, 1, 0, 1,
-0.7715721, -0.4001315, -2.366103, 0.6862745, 1, 0, 1,
-0.7707955, 0.1901187, -0.8767073, 0.6784314, 1, 0, 1,
-0.7704226, 1.656005, -2.248094, 0.6745098, 1, 0, 1,
-0.7653633, 0.5665773, 0.1714769, 0.6666667, 1, 0, 1,
-0.7637011, -0.9331601, -2.461842, 0.6627451, 1, 0, 1,
-0.7633132, -2.015465, -2.465635, 0.654902, 1, 0, 1,
-0.7624629, 0.7872984, 0.8240045, 0.6509804, 1, 0, 1,
-0.7595488, -0.5404404, -1.315398, 0.6431373, 1, 0, 1,
-0.7525635, -0.2323936, -3.972832, 0.6392157, 1, 0, 1,
-0.7454994, 1.710067, -2.869049, 0.6313726, 1, 0, 1,
-0.7440585, 0.4269063, 0.7627756, 0.627451, 1, 0, 1,
-0.74311, -0.4886075, -2.793045, 0.6196079, 1, 0, 1,
-0.7376354, -0.3225238, -2.349355, 0.6156863, 1, 0, 1,
-0.7317021, 0.8378867, -2.249954, 0.6078432, 1, 0, 1,
-0.7306121, 0.3580753, -0.3564639, 0.6039216, 1, 0, 1,
-0.7288751, -0.1024095, -1.950267, 0.5960785, 1, 0, 1,
-0.7267868, 1.319858, 1.499657, 0.5882353, 1, 0, 1,
-0.7232476, 0.2105868, -1.481506, 0.5843138, 1, 0, 1,
-0.7219834, 0.9509435, -0.3918087, 0.5764706, 1, 0, 1,
-0.7172946, 0.1906296, -2.912869, 0.572549, 1, 0, 1,
-0.7091885, -0.7532863, -2.096032, 0.5647059, 1, 0, 1,
-0.7061301, -0.2990602, -0.2328215, 0.5607843, 1, 0, 1,
-0.6922854, 0.3350187, -1.70067, 0.5529412, 1, 0, 1,
-0.6921192, 1.220558, -2.107413, 0.5490196, 1, 0, 1,
-0.6893125, 1.398292, -0.7900202, 0.5411765, 1, 0, 1,
-0.6871998, 1.03686, -2.294441, 0.5372549, 1, 0, 1,
-0.6814083, -0.3404287, -0.3460183, 0.5294118, 1, 0, 1,
-0.6804342, 0.6905283, 0.1837905, 0.5254902, 1, 0, 1,
-0.6723158, -0.1711209, -1.532381, 0.5176471, 1, 0, 1,
-0.6701683, 2.251692, -0.2127473, 0.5137255, 1, 0, 1,
-0.6667056, -0.4191757, -0.8871634, 0.5058824, 1, 0, 1,
-0.6641259, -0.6843991, -4.255043, 0.5019608, 1, 0, 1,
-0.6623473, 0.8379062, -2.796328, 0.4941176, 1, 0, 1,
-0.6576434, 1.126541, -0.003578984, 0.4862745, 1, 0, 1,
-0.6569417, 0.4793077, -0.8481157, 0.4823529, 1, 0, 1,
-0.6541224, 0.06140101, -0.7343863, 0.4745098, 1, 0, 1,
-0.6530492, 0.310648, 1.86053, 0.4705882, 1, 0, 1,
-0.642867, -1.136979, -1.31849, 0.4627451, 1, 0, 1,
-0.6397077, 2.354547, 0.609075, 0.4588235, 1, 0, 1,
-0.6279219, -1.151986, -1.642272, 0.4509804, 1, 0, 1,
-0.6260814, 0.5823095, -0.1575556, 0.4470588, 1, 0, 1,
-0.6186251, 1.698409, 0.6148767, 0.4392157, 1, 0, 1,
-0.6176826, -1.506861, -3.370117, 0.4352941, 1, 0, 1,
-0.6123779, -1.33234, -4.602923, 0.427451, 1, 0, 1,
-0.6121539, 1.134526, -0.6567655, 0.4235294, 1, 0, 1,
-0.6056283, 0.04604473, -1.631511, 0.4156863, 1, 0, 1,
-0.6020637, 0.7714796, -0.8084027, 0.4117647, 1, 0, 1,
-0.5975797, -0.8386115, -1.883186, 0.4039216, 1, 0, 1,
-0.5937264, 1.188767, -2.081073, 0.3960784, 1, 0, 1,
-0.5932634, -0.9633429, -3.942983, 0.3921569, 1, 0, 1,
-0.592454, 0.5026113, -0.006233257, 0.3843137, 1, 0, 1,
-0.5913689, 0.3270628, -1.906229, 0.3803922, 1, 0, 1,
-0.5907252, -0.366519, -1.517583, 0.372549, 1, 0, 1,
-0.5902289, -0.3419995, -2.937528, 0.3686275, 1, 0, 1,
-0.5846068, -0.003708075, -0.4248515, 0.3607843, 1, 0, 1,
-0.5807089, 0.7833785, 1.261344, 0.3568628, 1, 0, 1,
-0.5800227, -1.922658, -3.193425, 0.3490196, 1, 0, 1,
-0.5798396, 0.5331184, 0.4498151, 0.345098, 1, 0, 1,
-0.5777009, 0.5674982, -1.184439, 0.3372549, 1, 0, 1,
-0.5736374, 0.5522612, 0.6587855, 0.3333333, 1, 0, 1,
-0.5727501, 0.9037152, 1.364996, 0.3254902, 1, 0, 1,
-0.5707687, -0.9094158, -0.6806994, 0.3215686, 1, 0, 1,
-0.5651399, -1.485084, -2.14451, 0.3137255, 1, 0, 1,
-0.5625226, -1.637825, -2.338042, 0.3098039, 1, 0, 1,
-0.5553785, -1.07774, -2.469592, 0.3019608, 1, 0, 1,
-0.5550755, -0.9381036, -2.109637, 0.2941177, 1, 0, 1,
-0.5504211, 1.141526, -1.44805, 0.2901961, 1, 0, 1,
-0.5502385, -0.3925768, -1.434946, 0.282353, 1, 0, 1,
-0.5463139, 1.357116, -0.2393427, 0.2784314, 1, 0, 1,
-0.5452592, -0.7795964, -3.054217, 0.2705882, 1, 0, 1,
-0.5373196, -2.423594, -3.144328, 0.2666667, 1, 0, 1,
-0.535723, 2.465229, 0.4970341, 0.2588235, 1, 0, 1,
-0.5351384, -1.178473, -3.641477, 0.254902, 1, 0, 1,
-0.5309787, -1.1599, -2.430058, 0.2470588, 1, 0, 1,
-0.5269558, 0.8059713, 0.5522735, 0.2431373, 1, 0, 1,
-0.5254756, 0.6882154, -1.781984, 0.2352941, 1, 0, 1,
-0.5254518, 0.6212557, -1.351479, 0.2313726, 1, 0, 1,
-0.5246793, -0.007660687, -2.705917, 0.2235294, 1, 0, 1,
-0.5246066, 1.034313, 1.720165, 0.2196078, 1, 0, 1,
-0.5158839, -1.804929, -2.140286, 0.2117647, 1, 0, 1,
-0.5113333, 0.2757317, -1.32669, 0.2078431, 1, 0, 1,
-0.5111566, 1.363188, -0.8892202, 0.2, 1, 0, 1,
-0.5104045, -0.1477194, -1.564506, 0.1921569, 1, 0, 1,
-0.5101651, 0.2944444, -2.50715, 0.1882353, 1, 0, 1,
-0.5010111, 0.5884354, -1.711633, 0.1803922, 1, 0, 1,
-0.4988567, -0.1303825, -0.1211699, 0.1764706, 1, 0, 1,
-0.4982009, -1.339636, -2.680797, 0.1686275, 1, 0, 1,
-0.4948504, 1.331519, -0.2201161, 0.1647059, 1, 0, 1,
-0.4946128, 0.01806258, -3.477648, 0.1568628, 1, 0, 1,
-0.4898795, 0.5043195, -0.2279975, 0.1529412, 1, 0, 1,
-0.4870653, -0.6384917, -3.861409, 0.145098, 1, 0, 1,
-0.4868347, 1.458757, 1.302188, 0.1411765, 1, 0, 1,
-0.4817783, 1.135817, -0.3835782, 0.1333333, 1, 0, 1,
-0.475545, 1.556714, 1.589727, 0.1294118, 1, 0, 1,
-0.4745218, 1.43124, 0.4519005, 0.1215686, 1, 0, 1,
-0.4724739, 1.085936, -0.6705446, 0.1176471, 1, 0, 1,
-0.4670955, 0.6637848, -1.233096, 0.1098039, 1, 0, 1,
-0.4649399, 1.285352, -0.7331243, 0.1058824, 1, 0, 1,
-0.4621385, -1.985723, -2.361894, 0.09803922, 1, 0, 1,
-0.4607083, 0.9257638, 0.3246489, 0.09019608, 1, 0, 1,
-0.4604287, -0.9466596, -3.033199, 0.08627451, 1, 0, 1,
-0.4575785, 0.6068182, 1.049633, 0.07843138, 1, 0, 1,
-0.4559754, -0.4674891, -0.4566897, 0.07450981, 1, 0, 1,
-0.4553645, 0.8943991, -1.166523, 0.06666667, 1, 0, 1,
-0.4553248, 3.548564, 0.4646992, 0.0627451, 1, 0, 1,
-0.45488, 1.654639, -0.6284326, 0.05490196, 1, 0, 1,
-0.4541061, 0.5436423, -0.4066241, 0.05098039, 1, 0, 1,
-0.4522761, -0.4025021, -3.563006, 0.04313726, 1, 0, 1,
-0.4519767, -0.9638363, -3.204047, 0.03921569, 1, 0, 1,
-0.4516964, -0.06252161, -3.150315, 0.03137255, 1, 0, 1,
-0.4466579, 0.5201547, 0.7108099, 0.02745098, 1, 0, 1,
-0.4418885, -1.975492, -3.585752, 0.01960784, 1, 0, 1,
-0.4389111, -0.6427413, -2.493275, 0.01568628, 1, 0, 1,
-0.438304, 0.6384453, 0.9353768, 0.007843138, 1, 0, 1,
-0.4356703, 0.8042639, -1.301786, 0.003921569, 1, 0, 1,
-0.424647, 0.7907202, -0.9308953, 0, 1, 0.003921569, 1,
-0.4130438, 2.3843, -1.026916, 0, 1, 0.01176471, 1,
-0.4107616, 0.3591322, 0.6181558, 0, 1, 0.01568628, 1,
-0.4105515, -0.2233173, -1.557536, 0, 1, 0.02352941, 1,
-0.4055402, 0.07040593, -1.60389, 0, 1, 0.02745098, 1,
-0.4011227, 0.4960072, -0.9039032, 0, 1, 0.03529412, 1,
-0.3960584, 0.8102809, -0.7959522, 0, 1, 0.03921569, 1,
-0.3922836, -0.1084149, -3.389836, 0, 1, 0.04705882, 1,
-0.3893991, -0.838229, -4.284739, 0, 1, 0.05098039, 1,
-0.3830543, -0.5575141, -1.977374, 0, 1, 0.05882353, 1,
-0.3774669, 0.2254547, -0.4066719, 0, 1, 0.0627451, 1,
-0.3706661, -0.7632725, -3.406362, 0, 1, 0.07058824, 1,
-0.3650355, -0.165318, -0.4325674, 0, 1, 0.07450981, 1,
-0.3637599, 1.657947, 0.6340331, 0, 1, 0.08235294, 1,
-0.356652, 3.658782, 1.825995, 0, 1, 0.08627451, 1,
-0.352347, -0.3582054, -1.575208, 0, 1, 0.09411765, 1,
-0.3483783, 0.3277849, -1.513609, 0, 1, 0.1019608, 1,
-0.3466186, -0.5391161, -2.614873, 0, 1, 0.1058824, 1,
-0.3420943, 0.6711168, -0.914148, 0, 1, 0.1137255, 1,
-0.3390612, -1.164922, -3.949574, 0, 1, 0.1176471, 1,
-0.3368197, 2.156409, -0.1655542, 0, 1, 0.1254902, 1,
-0.3361401, 0.02004692, -2.206676, 0, 1, 0.1294118, 1,
-0.3327988, -2.163117, -3.196618, 0, 1, 0.1372549, 1,
-0.3325876, -0.3023747, -1.725775, 0, 1, 0.1411765, 1,
-0.3296574, 0.4726064, 0.9042998, 0, 1, 0.1490196, 1,
-0.3275205, 0.6712698, -0.8762429, 0, 1, 0.1529412, 1,
-0.319137, 1.726562, -0.2245665, 0, 1, 0.1607843, 1,
-0.3152398, 1.200694, 1.313935, 0, 1, 0.1647059, 1,
-0.3123123, 0.1056083, -2.293012, 0, 1, 0.172549, 1,
-0.311603, 0.3521729, -0.538445, 0, 1, 0.1764706, 1,
-0.3090652, 1.688609, 1.145711, 0, 1, 0.1843137, 1,
-0.3079738, 0.9997213, -1.75299, 0, 1, 0.1882353, 1,
-0.3066986, 0.3400356, 1.450609, 0, 1, 0.1960784, 1,
-0.305461, -0.6821941, -2.375694, 0, 1, 0.2039216, 1,
-0.3029653, -0.4067118, -3.538531, 0, 1, 0.2078431, 1,
-0.3022475, -0.7459996, -1.85411, 0, 1, 0.2156863, 1,
-0.3016153, -0.1327828, -3.04275, 0, 1, 0.2196078, 1,
-0.3003466, -0.467778, -4.409451, 0, 1, 0.227451, 1,
-0.3000416, 0.343043, 0.1743166, 0, 1, 0.2313726, 1,
-0.2995603, -0.217832, -3.164391, 0, 1, 0.2392157, 1,
-0.2984245, 0.5768073, -1.291375, 0, 1, 0.2431373, 1,
-0.2978455, -1.354606, -1.8807, 0, 1, 0.2509804, 1,
-0.2936702, -1.581459, -3.619105, 0, 1, 0.254902, 1,
-0.2926993, 0.5914385, -0.4163799, 0, 1, 0.2627451, 1,
-0.2857172, -1.178739, -3.049769, 0, 1, 0.2666667, 1,
-0.2845636, -0.9318007, -2.318648, 0, 1, 0.2745098, 1,
-0.2837642, 0.3967705, -0.5345891, 0, 1, 0.2784314, 1,
-0.28374, 0.09422415, -0.9469896, 0, 1, 0.2862745, 1,
-0.2834616, 0.2175671, -1.197526, 0, 1, 0.2901961, 1,
-0.2815864, -0.7113944, -2.411841, 0, 1, 0.2980392, 1,
-0.2815364, -0.8464253, -3.329633, 0, 1, 0.3058824, 1,
-0.2764818, -0.009896196, -0.6190323, 0, 1, 0.3098039, 1,
-0.2752947, 0.26426, -2.31245, 0, 1, 0.3176471, 1,
-0.2732845, -0.7264749, -1.740193, 0, 1, 0.3215686, 1,
-0.2726878, -0.3626331, -2.687546, 0, 1, 0.3294118, 1,
-0.2678077, 0.4661446, -0.2265633, 0, 1, 0.3333333, 1,
-0.2616199, 0.2067966, -1.509715, 0, 1, 0.3411765, 1,
-0.2609059, -0.2838157, -3.187421, 0, 1, 0.345098, 1,
-0.2608763, -0.540573, -2.851934, 0, 1, 0.3529412, 1,
-0.2542631, 2.858648, -1.681519, 0, 1, 0.3568628, 1,
-0.2518553, 0.04246585, -0.3839609, 0, 1, 0.3647059, 1,
-0.2510411, 0.04254705, -2.199151, 0, 1, 0.3686275, 1,
-0.2509856, 1.69149, -1.159289, 0, 1, 0.3764706, 1,
-0.2462913, 0.06647835, -3.868577, 0, 1, 0.3803922, 1,
-0.2442839, 0.2547926, -0.7840948, 0, 1, 0.3882353, 1,
-0.2388607, 0.2099432, -1.45238, 0, 1, 0.3921569, 1,
-0.2386504, -0.03395275, -2.956023, 0, 1, 0.4, 1,
-0.2378542, 0.9367417, -0.4762957, 0, 1, 0.4078431, 1,
-0.2329596, -1.928632, -2.188274, 0, 1, 0.4117647, 1,
-0.2325441, 0.6506154, -1.102563, 0, 1, 0.4196078, 1,
-0.2284036, -0.1500667, -1.266738, 0, 1, 0.4235294, 1,
-0.2274215, -0.1518115, -1.437109, 0, 1, 0.4313726, 1,
-0.2252451, 1.563587, -2.436074, 0, 1, 0.4352941, 1,
-0.2227102, 0.06275449, -2.08189, 0, 1, 0.4431373, 1,
-0.2213405, 0.6788042, 0.6311218, 0, 1, 0.4470588, 1,
-0.2196351, -0.7941041, -1.593198, 0, 1, 0.454902, 1,
-0.2167988, 0.7776402, 0.1367012, 0, 1, 0.4588235, 1,
-0.2149258, 1.49753, -1.604633, 0, 1, 0.4666667, 1,
-0.2135076, -0.8624792, -3.478664, 0, 1, 0.4705882, 1,
-0.2035454, 2.255679, -0.1906093, 0, 1, 0.4784314, 1,
-0.1986512, 0.08100741, -2.522922, 0, 1, 0.4823529, 1,
-0.1985804, -1.390875, -2.624895, 0, 1, 0.4901961, 1,
-0.195986, 1.262878, -0.4018959, 0, 1, 0.4941176, 1,
-0.1956141, 0.7286708, 0.3169043, 0, 1, 0.5019608, 1,
-0.1914518, -0.07779011, -2.246101, 0, 1, 0.509804, 1,
-0.1873126, -0.7576719, -5.092167, 0, 1, 0.5137255, 1,
-0.1837084, -0.1285545, -3.000824, 0, 1, 0.5215687, 1,
-0.1803059, -1.900369, -3.99122, 0, 1, 0.5254902, 1,
-0.1791489, 0.1286061, -0.3653342, 0, 1, 0.5333334, 1,
-0.1780348, -0.141991, -0.9376447, 0, 1, 0.5372549, 1,
-0.177043, -1.131194, -3.210972, 0, 1, 0.5450981, 1,
-0.1619249, 0.5795673, -1.254602, 0, 1, 0.5490196, 1,
-0.1617926, -0.1351294, -2.556258, 0, 1, 0.5568628, 1,
-0.1604159, -0.8519811, -3.969443, 0, 1, 0.5607843, 1,
-0.1599839, 1.523182, 0.8061631, 0, 1, 0.5686275, 1,
-0.1598255, 0.5978648, -0.4848464, 0, 1, 0.572549, 1,
-0.1590072, -1.712843, -2.96224, 0, 1, 0.5803922, 1,
-0.1539462, 0.1244556, -0.8825414, 0, 1, 0.5843138, 1,
-0.1530705, 0.421627, 0.1360632, 0, 1, 0.5921569, 1,
-0.1467906, 0.1988708, -1.156805, 0, 1, 0.5960785, 1,
-0.1457418, 0.5443768, -1.866625, 0, 1, 0.6039216, 1,
-0.1436974, -0.4865102, -2.218517, 0, 1, 0.6117647, 1,
-0.1415007, 0.4697877, -0.5892733, 0, 1, 0.6156863, 1,
-0.1342911, -0.8373329, -3.473193, 0, 1, 0.6235294, 1,
-0.1333847, -0.1069848, -3.671584, 0, 1, 0.627451, 1,
-0.1324246, 0.465259, -1.096094, 0, 1, 0.6352941, 1,
-0.1290207, 0.7734761, 0.3806227, 0, 1, 0.6392157, 1,
-0.1257594, -0.1354019, -2.666785, 0, 1, 0.6470588, 1,
-0.1213995, -1.06943, -2.166017, 0, 1, 0.6509804, 1,
-0.1159353, 0.6181854, -0.7231914, 0, 1, 0.6588235, 1,
-0.1144536, -0.1749213, -0.5794548, 0, 1, 0.6627451, 1,
-0.1136835, 0.1941067, -0.8533425, 0, 1, 0.6705883, 1,
-0.1086297, 0.6113526, -0.1238782, 0, 1, 0.6745098, 1,
-0.1078591, -0.2875163, -3.677249, 0, 1, 0.682353, 1,
-0.1078328, 0.8130022, 0.832506, 0, 1, 0.6862745, 1,
-0.1048007, 0.5164688, 0.1111188, 0, 1, 0.6941177, 1,
-0.1039177, -1.149127, -2.250145, 0, 1, 0.7019608, 1,
-0.1029898, -0.2025421, -1.664731, 0, 1, 0.7058824, 1,
-0.1024235, 0.9603292, 1.506709, 0, 1, 0.7137255, 1,
-0.1005903, -1.083028, -3.141263, 0, 1, 0.7176471, 1,
-0.09798817, 0.5627241, 0.4931838, 0, 1, 0.7254902, 1,
-0.0973196, 1.02724, -0.9977262, 0, 1, 0.7294118, 1,
-0.0944443, 0.4124176, -0.7060844, 0, 1, 0.7372549, 1,
-0.09183801, -1.702494, -3.859239, 0, 1, 0.7411765, 1,
-0.09136461, -0.4488867, -4.211887, 0, 1, 0.7490196, 1,
-0.09009523, -1.467754, -3.984969, 0, 1, 0.7529412, 1,
-0.08891185, -0.02105366, -2.575937, 0, 1, 0.7607843, 1,
-0.08569751, 0.5790622, -2.099333, 0, 1, 0.7647059, 1,
-0.08131284, -1.66247, -3.211417, 0, 1, 0.772549, 1,
-0.07551936, -0.5997517, -3.85836, 0, 1, 0.7764706, 1,
-0.07492282, 0.4622462, 0.1015205, 0, 1, 0.7843137, 1,
-0.07414471, -1.566398, -4.181453, 0, 1, 0.7882353, 1,
-0.07082918, 0.05464217, -1.428776, 0, 1, 0.7960784, 1,
-0.06968518, 1.29254, 0.2131499, 0, 1, 0.8039216, 1,
-0.06878178, -2.663192, -3.179048, 0, 1, 0.8078431, 1,
-0.06733715, 0.7365717, 0.9203791, 0, 1, 0.8156863, 1,
-0.06673691, -0.5577719, -2.785934, 0, 1, 0.8196079, 1,
-0.06534602, 1.086652, -1.797434, 0, 1, 0.827451, 1,
-0.06485756, 2.234352, 0.1666673, 0, 1, 0.8313726, 1,
-0.06361272, -0.05592986, -2.064479, 0, 1, 0.8392157, 1,
-0.06226244, 0.7432334, -2.360011, 0, 1, 0.8431373, 1,
-0.06091943, -1.204209, -1.734053, 0, 1, 0.8509804, 1,
-0.05966148, -1.146908, -1.985766, 0, 1, 0.854902, 1,
-0.05695038, -0.7402149, -0.3025445, 0, 1, 0.8627451, 1,
-0.05644745, -0.6147924, -0.1330359, 0, 1, 0.8666667, 1,
-0.05634375, -0.8080478, -4.441966, 0, 1, 0.8745098, 1,
-0.0538059, -0.7068017, -3.302074, 0, 1, 0.8784314, 1,
-0.04105211, 1.812411, -0.09582447, 0, 1, 0.8862745, 1,
-0.03905578, 1.194645, 2.109255, 0, 1, 0.8901961, 1,
-0.03491014, 0.9603019, -0.2605484, 0, 1, 0.8980392, 1,
-0.03062934, 0.6521655, -0.5218798, 0, 1, 0.9058824, 1,
-0.02478855, 0.5494662, -1.944756, 0, 1, 0.9098039, 1,
-0.02267366, -0.6771569, -3.9208, 0, 1, 0.9176471, 1,
-0.01897612, 0.9660832, -0.6795543, 0, 1, 0.9215686, 1,
-0.01116796, -0.03854399, -2.880419, 0, 1, 0.9294118, 1,
-0.009082355, 1.187869, -0.4028841, 0, 1, 0.9333333, 1,
-0.008404501, -0.1929893, -1.753891, 0, 1, 0.9411765, 1,
-0.006975855, 0.409629, -0.5648661, 0, 1, 0.945098, 1,
-0.003694437, 0.7331011, -0.5894792, 0, 1, 0.9529412, 1,
-0.001999182, -0.5451932, -3.652745, 0, 1, 0.9568627, 1,
0.001676822, 0.5184073, 0.2888938, 0, 1, 0.9647059, 1,
0.004470333, 0.7479156, 0.1184061, 0, 1, 0.9686275, 1,
0.006164867, -0.1240039, 3.634694, 0, 1, 0.9764706, 1,
0.008096874, 0.8208801, -0.3940763, 0, 1, 0.9803922, 1,
0.008677009, -0.8082823, 2.428468, 0, 1, 0.9882353, 1,
0.008886959, -1.211884, 2.512553, 0, 1, 0.9921569, 1,
0.009381997, 0.5042921, 2.010996, 0, 1, 1, 1,
0.01015655, 0.3830564, 0.5068067, 0, 0.9921569, 1, 1,
0.01131943, -0.7519063, 1.944002, 0, 0.9882353, 1, 1,
0.01299405, 1.684751, 1.001496, 0, 0.9803922, 1, 1,
0.01391891, -1.29868, 3.000691, 0, 0.9764706, 1, 1,
0.01401745, 1.015589, -0.7750188, 0, 0.9686275, 1, 1,
0.01462147, -0.9181983, 2.930059, 0, 0.9647059, 1, 1,
0.01575954, 0.5345696, 1.102116, 0, 0.9568627, 1, 1,
0.01756057, 1.955821, -2.105634, 0, 0.9529412, 1, 1,
0.01844578, -0.3267715, 2.933832, 0, 0.945098, 1, 1,
0.01908964, -0.08188695, 3.113972, 0, 0.9411765, 1, 1,
0.01975167, 0.5509004, -1.23802, 0, 0.9333333, 1, 1,
0.02029654, -1.192358, 3.523784, 0, 0.9294118, 1, 1,
0.02361981, -1.182389, 3.759811, 0, 0.9215686, 1, 1,
0.02544833, -0.2702545, 6.328073, 0, 0.9176471, 1, 1,
0.02569596, 2.604782, 0.2556969, 0, 0.9098039, 1, 1,
0.02887233, -1.581776, 2.35245, 0, 0.9058824, 1, 1,
0.03039108, 1.13975, -1.565709, 0, 0.8980392, 1, 1,
0.03400455, 0.6545007, -1.738672, 0, 0.8901961, 1, 1,
0.03862592, -0.8673775, 3.642783, 0, 0.8862745, 1, 1,
0.04127951, 0.2506722, 1.393184, 0, 0.8784314, 1, 1,
0.04265771, -0.6034004, 3.63025, 0, 0.8745098, 1, 1,
0.04530121, 0.5788479, 1.081136, 0, 0.8666667, 1, 1,
0.04560888, 0.1707524, 0.2513783, 0, 0.8627451, 1, 1,
0.04734448, -0.3098856, 3.719918, 0, 0.854902, 1, 1,
0.05108566, -1.296372, 3.138728, 0, 0.8509804, 1, 1,
0.05780553, 0.8071535, -0.6096905, 0, 0.8431373, 1, 1,
0.06615834, 1.056801, 0.7165496, 0, 0.8392157, 1, 1,
0.06960911, -0.8141772, 2.696136, 0, 0.8313726, 1, 1,
0.07033423, 0.234005, -0.7448922, 0, 0.827451, 1, 1,
0.07145905, 0.7311706, 0.6521533, 0, 0.8196079, 1, 1,
0.07262506, 0.8723308, 0.6389665, 0, 0.8156863, 1, 1,
0.07530507, -0.3773026, 3.438008, 0, 0.8078431, 1, 1,
0.07743674, 0.6915495, 0.8602219, 0, 0.8039216, 1, 1,
0.07898992, -1.146419, 6.007228, 0, 0.7960784, 1, 1,
0.08641406, -0.8054177, 3.117851, 0, 0.7882353, 1, 1,
0.08642942, 0.1519723, -1.26419, 0, 0.7843137, 1, 1,
0.08732823, 0.5809535, 0.3652181, 0, 0.7764706, 1, 1,
0.08803903, 0.5302431, 0.8044086, 0, 0.772549, 1, 1,
0.08864468, 1.117612, -1.254232, 0, 0.7647059, 1, 1,
0.09049768, 2.005479, 0.09516426, 0, 0.7607843, 1, 1,
0.09248701, -0.902777, 3.072036, 0, 0.7529412, 1, 1,
0.09562039, 0.8412395, 0.7751685, 0, 0.7490196, 1, 1,
0.09581191, -0.000322005, 1.507513, 0, 0.7411765, 1, 1,
0.09639704, 0.7180323, 0.2387826, 0, 0.7372549, 1, 1,
0.1012694, 0.8925257, -0.3305788, 0, 0.7294118, 1, 1,
0.1016338, 1.32734, 0.6229469, 0, 0.7254902, 1, 1,
0.105528, 1.10211, -0.1047717, 0, 0.7176471, 1, 1,
0.1116614, 0.5423487, 0.05713769, 0, 0.7137255, 1, 1,
0.1144019, -0.3360964, 2.666649, 0, 0.7058824, 1, 1,
0.1177187, -0.4500117, 3.387647, 0, 0.6980392, 1, 1,
0.1186963, -0.003783645, 1.976031, 0, 0.6941177, 1, 1,
0.1199543, -0.06099371, 2.481817, 0, 0.6862745, 1, 1,
0.1210658, -1.400779, 3.895329, 0, 0.682353, 1, 1,
0.1270398, -1.038656, 4.947658, 0, 0.6745098, 1, 1,
0.1272355, -1.243651, 2.537892, 0, 0.6705883, 1, 1,
0.1306881, -0.5306619, 4.095372, 0, 0.6627451, 1, 1,
0.134433, 0.3204511, 1.84611, 0, 0.6588235, 1, 1,
0.1348096, 0.1457323, 0.5921053, 0, 0.6509804, 1, 1,
0.1404498, 0.8697534, 0.2325445, 0, 0.6470588, 1, 1,
0.1417731, -0.9090208, 3.031372, 0, 0.6392157, 1, 1,
0.1423411, 1.224305, -1.598107, 0, 0.6352941, 1, 1,
0.1451276, 0.4598846, 1.556904, 0, 0.627451, 1, 1,
0.1451678, 1.222789, 0.1150281, 0, 0.6235294, 1, 1,
0.1468541, -1.982113, 2.969606, 0, 0.6156863, 1, 1,
0.1476948, -0.9554691, 3.642519, 0, 0.6117647, 1, 1,
0.1494518, 0.6267185, 0.3801598, 0, 0.6039216, 1, 1,
0.1512872, -0.7203897, 4.891537, 0, 0.5960785, 1, 1,
0.1532033, -0.5981036, 2.920739, 0, 0.5921569, 1, 1,
0.1538107, -0.5088776, 3.40182, 0, 0.5843138, 1, 1,
0.1539765, -0.71334, 1.648376, 0, 0.5803922, 1, 1,
0.1544326, 0.2314068, 0.4034177, 0, 0.572549, 1, 1,
0.1559271, 0.6610014, -0.8416364, 0, 0.5686275, 1, 1,
0.1563177, -0.4218863, 3.9281, 0, 0.5607843, 1, 1,
0.1598229, -0.653141, 2.484607, 0, 0.5568628, 1, 1,
0.1599963, -0.542831, 2.962527, 0, 0.5490196, 1, 1,
0.1616957, 1.368245, 0.2717294, 0, 0.5450981, 1, 1,
0.1651823, -0.1703638, 3.414146, 0, 0.5372549, 1, 1,
0.16522, -0.1866666, 1.660096, 0, 0.5333334, 1, 1,
0.1675803, -1.687232, 1.817257, 0, 0.5254902, 1, 1,
0.168283, 0.4446028, -1.630781, 0, 0.5215687, 1, 1,
0.1730332, 1.386282, 0.6512773, 0, 0.5137255, 1, 1,
0.1732311, -1.637071, 2.22092, 0, 0.509804, 1, 1,
0.1733394, -1.109042, 2.648417, 0, 0.5019608, 1, 1,
0.1806064, -0.01327906, 1.321963, 0, 0.4941176, 1, 1,
0.1817834, 0.5527152, 1.45833, 0, 0.4901961, 1, 1,
0.1889333, 0.1356951, -0.7926832, 0, 0.4823529, 1, 1,
0.1930574, 0.2044118, 0.7753965, 0, 0.4784314, 1, 1,
0.1939511, -0.4514972, 2.702148, 0, 0.4705882, 1, 1,
0.1962135, 2.279215, -1.363788, 0, 0.4666667, 1, 1,
0.1979364, -0.0006543508, 1.559009, 0, 0.4588235, 1, 1,
0.2042212, -1.336931, 4.216806, 0, 0.454902, 1, 1,
0.2093887, 0.02154357, 0.3890049, 0, 0.4470588, 1, 1,
0.2120735, -0.02606328, 1.848494, 0, 0.4431373, 1, 1,
0.2123187, -0.1842008, 0.797941, 0, 0.4352941, 1, 1,
0.2242814, -1.104506, 3.291796, 0, 0.4313726, 1, 1,
0.2268694, 0.08702929, 0.936583, 0, 0.4235294, 1, 1,
0.227713, 0.164189, 0.4490735, 0, 0.4196078, 1, 1,
0.2286089, 1.061795, 0.2684899, 0, 0.4117647, 1, 1,
0.2314845, -1.463859, 3.48012, 0, 0.4078431, 1, 1,
0.2342617, 1.111347, 1.716802, 0, 0.4, 1, 1,
0.2360811, -0.4475603, 2.986905, 0, 0.3921569, 1, 1,
0.2440165, -0.1651485, 1.678506, 0, 0.3882353, 1, 1,
0.2453632, 0.06441015, 2.544197, 0, 0.3803922, 1, 1,
0.2466377, 0.5157507, 1.327898, 0, 0.3764706, 1, 1,
0.2481306, -0.1223871, 1.516036, 0, 0.3686275, 1, 1,
0.2494839, -3.071966, 2.541729, 0, 0.3647059, 1, 1,
0.2514604, 0.5017993, 0.2542295, 0, 0.3568628, 1, 1,
0.251681, 0.253123, 1.162297, 0, 0.3529412, 1, 1,
0.2524354, -0.8542163, 1.445974, 0, 0.345098, 1, 1,
0.2558191, 0.8068227, 2.346266, 0, 0.3411765, 1, 1,
0.2560697, 2.043247, -0.975039, 0, 0.3333333, 1, 1,
0.2573422, -1.45042, 2.467536, 0, 0.3294118, 1, 1,
0.2617009, 0.1649426, 0.6525772, 0, 0.3215686, 1, 1,
0.2696933, -0.03383699, 0.3250156, 0, 0.3176471, 1, 1,
0.270204, -0.07679655, 3.044665, 0, 0.3098039, 1, 1,
0.2721973, 0.19134, 2.705237, 0, 0.3058824, 1, 1,
0.2750887, -1.888476, 3.52411, 0, 0.2980392, 1, 1,
0.2772394, 0.5914205, -0.5985073, 0, 0.2901961, 1, 1,
0.2773334, -0.1274628, 1.749025, 0, 0.2862745, 1, 1,
0.2826518, 0.05064138, 1.617335, 0, 0.2784314, 1, 1,
0.2847185, 0.8718488, -0.6534374, 0, 0.2745098, 1, 1,
0.2896547, -0.2259171, 0.628261, 0, 0.2666667, 1, 1,
0.2944524, 1.015863, 0.9388039, 0, 0.2627451, 1, 1,
0.2956394, -0.6299101, 3.198094, 0, 0.254902, 1, 1,
0.2957998, 1.265169, -0.8437082, 0, 0.2509804, 1, 1,
0.2975388, -0.563532, 2.232021, 0, 0.2431373, 1, 1,
0.3001817, -0.6883758, 2.763995, 0, 0.2392157, 1, 1,
0.3008651, -0.6365758, 4.052877, 0, 0.2313726, 1, 1,
0.3022259, -0.4916078, 2.946696, 0, 0.227451, 1, 1,
0.3030106, 1.033671, -0.8299767, 0, 0.2196078, 1, 1,
0.3043914, 1.770276, 1.538798, 0, 0.2156863, 1, 1,
0.3053972, 0.8464158, 1.094778, 0, 0.2078431, 1, 1,
0.3073298, 0.339437, 0.5908064, 0, 0.2039216, 1, 1,
0.3127882, 0.3697171, 1.702311, 0, 0.1960784, 1, 1,
0.3165481, 0.5280349, 0.06346142, 0, 0.1882353, 1, 1,
0.3182646, -1.627662, 3.209872, 0, 0.1843137, 1, 1,
0.3193825, -0.7841888, 3.786383, 0, 0.1764706, 1, 1,
0.3214281, -1.605985, 2.67568, 0, 0.172549, 1, 1,
0.3234036, 1.845149, -0.3744642, 0, 0.1647059, 1, 1,
0.3236282, 0.1436132, 0.7881777, 0, 0.1607843, 1, 1,
0.3288898, -0.5561681, 1.248527, 0, 0.1529412, 1, 1,
0.3289524, -0.3111267, 3.5266, 0, 0.1490196, 1, 1,
0.3304881, -1.313607, 3.050943, 0, 0.1411765, 1, 1,
0.3386811, -1.172799, 2.262175, 0, 0.1372549, 1, 1,
0.338682, -1.748493, 2.138187, 0, 0.1294118, 1, 1,
0.3398626, 1.026951, 0.4580932, 0, 0.1254902, 1, 1,
0.3429446, 0.6289436, 0.6290875, 0, 0.1176471, 1, 1,
0.3450169, -1.635186, 2.626063, 0, 0.1137255, 1, 1,
0.3457177, -0.6863855, 4.277882, 0, 0.1058824, 1, 1,
0.3538388, 0.2729893, 1.317358, 0, 0.09803922, 1, 1,
0.3557242, -1.305785, 1.997678, 0, 0.09411765, 1, 1,
0.3558438, -0.7086898, 0.7037878, 0, 0.08627451, 1, 1,
0.3633108, -0.1494747, 2.378299, 0, 0.08235294, 1, 1,
0.3656038, 0.3471889, -0.3968615, 0, 0.07450981, 1, 1,
0.3715963, -0.6536286, 2.257383, 0, 0.07058824, 1, 1,
0.3737057, 0.3911394, 1.47591, 0, 0.0627451, 1, 1,
0.3786173, -0.531809, 3.040825, 0, 0.05882353, 1, 1,
0.3866114, 0.4778007, 0.9166363, 0, 0.05098039, 1, 1,
0.3897519, -0.5648761, 2.543361, 0, 0.04705882, 1, 1,
0.3900528, 2.033643, 0.107254, 0, 0.03921569, 1, 1,
0.3916549, -0.3929761, 2.960559, 0, 0.03529412, 1, 1,
0.3921004, -1.923779, 2.085168, 0, 0.02745098, 1, 1,
0.3937958, -0.593874, 2.235047, 0, 0.02352941, 1, 1,
0.4012913, -0.9190348, 2.22134, 0, 0.01568628, 1, 1,
0.4018902, -0.3390296, 2.909403, 0, 0.01176471, 1, 1,
0.4037848, 0.2808276, 1.398813, 0, 0.003921569, 1, 1,
0.411389, -1.531622, 2.095764, 0.003921569, 0, 1, 1,
0.4120181, -2.476977, 3.068505, 0.007843138, 0, 1, 1,
0.4147892, 0.4364605, 1.098919, 0.01568628, 0, 1, 1,
0.4157468, -0.427168, 0.8265203, 0.01960784, 0, 1, 1,
0.4165732, 0.4625653, 0.8429947, 0.02745098, 0, 1, 1,
0.4169078, 1.258531, -1.937487, 0.03137255, 0, 1, 1,
0.4172281, -0.2485943, 3.581369, 0.03921569, 0, 1, 1,
0.4272516, 1.77284, -0.3450076, 0.04313726, 0, 1, 1,
0.4281237, 0.01976913, 3.274565, 0.05098039, 0, 1, 1,
0.4410518, -2.430311, 2.31331, 0.05490196, 0, 1, 1,
0.443879, 1.296289, 0.3570966, 0.0627451, 0, 1, 1,
0.4443623, -2.077029, 4.177923, 0.06666667, 0, 1, 1,
0.4476925, -0.05600943, 1.622504, 0.07450981, 0, 1, 1,
0.4492824, -0.2776455, 2.131635, 0.07843138, 0, 1, 1,
0.4545522, -0.3183759, 1.933019, 0.08627451, 0, 1, 1,
0.4552703, 0.2155972, 0.362151, 0.09019608, 0, 1, 1,
0.4564345, -0.3534534, 2.229319, 0.09803922, 0, 1, 1,
0.4582441, 0.8214248, 1.033503, 0.1058824, 0, 1, 1,
0.4586341, 0.9959008, 1.055795, 0.1098039, 0, 1, 1,
0.4607288, 1.534552, -0.4311145, 0.1176471, 0, 1, 1,
0.4612989, 1.061486, 2.203331, 0.1215686, 0, 1, 1,
0.4627805, 0.5020683, 1.465074, 0.1294118, 0, 1, 1,
0.4638354, -1.938108, 2.446413, 0.1333333, 0, 1, 1,
0.4682408, -0.1187288, 1.928443, 0.1411765, 0, 1, 1,
0.4709344, -1.785474, 4.59616, 0.145098, 0, 1, 1,
0.4728192, -0.4163353, 1.381667, 0.1529412, 0, 1, 1,
0.4754508, -1.400168, 1.117005, 0.1568628, 0, 1, 1,
0.4799243, -0.2982173, 2.669432, 0.1647059, 0, 1, 1,
0.4879576, 0.9396343, -0.2420854, 0.1686275, 0, 1, 1,
0.4881074, 0.2522498, 2.107425, 0.1764706, 0, 1, 1,
0.4967075, -0.4934644, 1.092596, 0.1803922, 0, 1, 1,
0.4979983, -1.480492, 4.030108, 0.1882353, 0, 1, 1,
0.4982949, 0.05467789, 0.04580152, 0.1921569, 0, 1, 1,
0.4983819, 0.6167342, 0.4504163, 0.2, 0, 1, 1,
0.5092015, -0.04068503, 2.740216, 0.2078431, 0, 1, 1,
0.5117794, -0.3811205, 1.183281, 0.2117647, 0, 1, 1,
0.5241823, -0.4429612, 1.657726, 0.2196078, 0, 1, 1,
0.5261117, 1.004912, 0.6235505, 0.2235294, 0, 1, 1,
0.5266618, -0.238593, 2.571849, 0.2313726, 0, 1, 1,
0.5341198, 0.06661954, 3.831102, 0.2352941, 0, 1, 1,
0.5432502, -0.4326066, 1.740761, 0.2431373, 0, 1, 1,
0.5511521, 0.8380971, 1.173436, 0.2470588, 0, 1, 1,
0.551467, 1.512836, -0.6631725, 0.254902, 0, 1, 1,
0.5540428, -0.1050859, 0.5021589, 0.2588235, 0, 1, 1,
0.5540648, -1.178256, 4.231797, 0.2666667, 0, 1, 1,
0.5559489, -1.385554, 2.348253, 0.2705882, 0, 1, 1,
0.5597839, -3.169791, 2.955431, 0.2784314, 0, 1, 1,
0.5674513, 0.1001364, -0.3648433, 0.282353, 0, 1, 1,
0.5733768, 0.2307108, 2.554045, 0.2901961, 0, 1, 1,
0.574199, 0.7832923, 0.4129004, 0.2941177, 0, 1, 1,
0.5745927, -0.5967463, 2.146415, 0.3019608, 0, 1, 1,
0.5759162, 0.5099479, 0.2023608, 0.3098039, 0, 1, 1,
0.5795191, -1.256995, 0.8320205, 0.3137255, 0, 1, 1,
0.5836154, 0.8661223, -0.375757, 0.3215686, 0, 1, 1,
0.584549, 0.637391, 0.4941128, 0.3254902, 0, 1, 1,
0.5847898, -0.2067767, 1.843592, 0.3333333, 0, 1, 1,
0.5931655, -1.001445, 1.545458, 0.3372549, 0, 1, 1,
0.5971786, 0.3574056, 0.4688911, 0.345098, 0, 1, 1,
0.6000867, -0.07518557, 0.7267899, 0.3490196, 0, 1, 1,
0.6012936, 0.5615705, 0.9708602, 0.3568628, 0, 1, 1,
0.6029551, 0.002924394, 0.5628429, 0.3607843, 0, 1, 1,
0.6031957, -0.7495703, 3.901721, 0.3686275, 0, 1, 1,
0.6086072, 1.113608, -1.073823, 0.372549, 0, 1, 1,
0.6105862, -1.396774, 3.130394, 0.3803922, 0, 1, 1,
0.6110966, 0.4740096, 1.091198, 0.3843137, 0, 1, 1,
0.6113712, -0.3139911, 2.002268, 0.3921569, 0, 1, 1,
0.6126795, -0.1830511, 2.61174, 0.3960784, 0, 1, 1,
0.6236107, -2.006842, 2.997211, 0.4039216, 0, 1, 1,
0.6275864, 1.997073, 0.9261232, 0.4117647, 0, 1, 1,
0.628877, 0.9088476, 0.8721244, 0.4156863, 0, 1, 1,
0.6405412, -0.1185199, 2.057216, 0.4235294, 0, 1, 1,
0.6422314, 1.953881, 0.2162472, 0.427451, 0, 1, 1,
0.6438655, -0.186738, 1.314581, 0.4352941, 0, 1, 1,
0.651491, 1.245062, 0.5736247, 0.4392157, 0, 1, 1,
0.6529732, -1.05098, 1.820732, 0.4470588, 0, 1, 1,
0.655739, -1.686264, 1.993468, 0.4509804, 0, 1, 1,
0.6592735, -0.7986743, 0.1989001, 0.4588235, 0, 1, 1,
0.6623423, -0.9364442, 3.96237, 0.4627451, 0, 1, 1,
0.6626727, 0.6779743, -0.04849177, 0.4705882, 0, 1, 1,
0.6649771, 0.8205739, 0.4849589, 0.4745098, 0, 1, 1,
0.6656128, -1.043848, 3.417511, 0.4823529, 0, 1, 1,
0.6657677, 0.00212181, 0.3998908, 0.4862745, 0, 1, 1,
0.666803, -0.4639173, 2.091916, 0.4941176, 0, 1, 1,
0.6704158, 1.481457, 0.1835378, 0.5019608, 0, 1, 1,
0.6731148, 0.1344764, 0.5927275, 0.5058824, 0, 1, 1,
0.6731932, 1.248934, 0.3362889, 0.5137255, 0, 1, 1,
0.6771358, 0.3549302, -0.5760709, 0.5176471, 0, 1, 1,
0.680194, -0.9155928, 1.566452, 0.5254902, 0, 1, 1,
0.6890355, -1.603017, 1.885922, 0.5294118, 0, 1, 1,
0.6892336, 0.05226504, 0.7791848, 0.5372549, 0, 1, 1,
0.6953723, -0.9463731, 2.724467, 0.5411765, 0, 1, 1,
0.7003973, 0.5606703, 0.03488092, 0.5490196, 0, 1, 1,
0.7023066, -2.377305, 3.02016, 0.5529412, 0, 1, 1,
0.707297, 1.159068, 1.795419, 0.5607843, 0, 1, 1,
0.7079486, 0.4920982, 2.848236, 0.5647059, 0, 1, 1,
0.7079522, 0.02612543, 2.442199, 0.572549, 0, 1, 1,
0.7108564, 1.603696, 2.462324, 0.5764706, 0, 1, 1,
0.715385, -0.255061, 1.768715, 0.5843138, 0, 1, 1,
0.7173511, -0.671424, 2.96266, 0.5882353, 0, 1, 1,
0.7178693, 1.032393, 0.6312953, 0.5960785, 0, 1, 1,
0.7271428, -0.5539626, 1.945403, 0.6039216, 0, 1, 1,
0.7292918, 1.60146, -0.9958116, 0.6078432, 0, 1, 1,
0.739706, -0.3344937, 0.9478334, 0.6156863, 0, 1, 1,
0.7407464, -0.1776546, 1.345046, 0.6196079, 0, 1, 1,
0.7410949, -0.196991, 1.365663, 0.627451, 0, 1, 1,
0.7422321, -1.416568, 2.952773, 0.6313726, 0, 1, 1,
0.7465097, 0.5624769, 0.2766803, 0.6392157, 0, 1, 1,
0.7498398, -0.7206425, 1.539596, 0.6431373, 0, 1, 1,
0.7551468, -1.181371, 4.508556, 0.6509804, 0, 1, 1,
0.7571592, 0.5829597, 0.7205489, 0.654902, 0, 1, 1,
0.7601672, -0.8853838, 1.890557, 0.6627451, 0, 1, 1,
0.7609244, 0.3486173, 2.033029, 0.6666667, 0, 1, 1,
0.7651178, 0.3148606, 0.3748348, 0.6745098, 0, 1, 1,
0.7664738, -2.121913, 2.971499, 0.6784314, 0, 1, 1,
0.7702686, 0.211609, -0.7661332, 0.6862745, 0, 1, 1,
0.7825905, -0.9120684, 1.365973, 0.6901961, 0, 1, 1,
0.7826146, 1.880358, -0.3846158, 0.6980392, 0, 1, 1,
0.7828497, 0.006926893, 2.514782, 0.7058824, 0, 1, 1,
0.7828913, 1.457049, 1.159089, 0.7098039, 0, 1, 1,
0.7831482, 1.146744, 0.8596409, 0.7176471, 0, 1, 1,
0.784772, 0.7642074, 1.113426, 0.7215686, 0, 1, 1,
0.7915077, 0.5170827, 0.757577, 0.7294118, 0, 1, 1,
0.7949653, 0.9719778, 0.4841156, 0.7333333, 0, 1, 1,
0.8046371, 0.9764889, 1.347319, 0.7411765, 0, 1, 1,
0.8058318, 0.4201005, 1.018368, 0.7450981, 0, 1, 1,
0.8065928, -0.3591176, 2.300996, 0.7529412, 0, 1, 1,
0.8101674, 1.151483, 1.590631, 0.7568628, 0, 1, 1,
0.8109822, 1.283046, 0.8954988, 0.7647059, 0, 1, 1,
0.8110934, 0.717413, 0.563738, 0.7686275, 0, 1, 1,
0.8160188, -1.114481, 3.776985, 0.7764706, 0, 1, 1,
0.822987, 0.08067631, 2.692607, 0.7803922, 0, 1, 1,
0.8257527, 0.9634916, 0.2459993, 0.7882353, 0, 1, 1,
0.8297063, 0.3077714, 0.4157659, 0.7921569, 0, 1, 1,
0.8337411, -1.702726, 1.292385, 0.8, 0, 1, 1,
0.8366267, -0.09549695, 1.310666, 0.8078431, 0, 1, 1,
0.8566411, 0.8309178, 1.282621, 0.8117647, 0, 1, 1,
0.8620458, 1.03487, 1.776069, 0.8196079, 0, 1, 1,
0.8623834, 0.371892, 1.414984, 0.8235294, 0, 1, 1,
0.8654653, 0.3554402, -0.1946519, 0.8313726, 0, 1, 1,
0.8689514, -0.5205829, 1.253794, 0.8352941, 0, 1, 1,
0.8718039, -0.0629345, 0.9475986, 0.8431373, 0, 1, 1,
0.8785879, 0.08637908, 1.62861, 0.8470588, 0, 1, 1,
0.8808921, 0.01593916, 2.187759, 0.854902, 0, 1, 1,
0.883665, -0.7194601, 1.135595, 0.8588235, 0, 1, 1,
0.8889973, -0.8054119, 1.009588, 0.8666667, 0, 1, 1,
0.8946128, 1.046139, 1.646432, 0.8705882, 0, 1, 1,
0.8961608, -0.1524594, 0.08163679, 0.8784314, 0, 1, 1,
0.8996109, 1.043194, -0.5137467, 0.8823529, 0, 1, 1,
0.9133347, -0.309362, 0.8618132, 0.8901961, 0, 1, 1,
0.9151319, -1.91079, 1.975858, 0.8941177, 0, 1, 1,
0.9174075, -1.261133, 2.812541, 0.9019608, 0, 1, 1,
0.9330178, 0.2408136, 0.1241485, 0.9098039, 0, 1, 1,
0.9486578, -0.1688024, 3.451389, 0.9137255, 0, 1, 1,
0.9555489, -0.4288676, 1.808817, 0.9215686, 0, 1, 1,
0.9591582, -2.102875, 3.870709, 0.9254902, 0, 1, 1,
0.9643022, 0.5329681, 2.717717, 0.9333333, 0, 1, 1,
0.9713363, -0.3301257, 2.410723, 0.9372549, 0, 1, 1,
0.9784887, -0.7602302, 1.875752, 0.945098, 0, 1, 1,
0.9791584, 0.7631255, 1.510555, 0.9490196, 0, 1, 1,
0.9815478, -1.603567, 1.116918, 0.9568627, 0, 1, 1,
0.9846727, 0.6235431, 1.727988, 0.9607843, 0, 1, 1,
0.9887705, -1.064024, 3.450547, 0.9686275, 0, 1, 1,
0.993117, 0.3765385, 0.862239, 0.972549, 0, 1, 1,
0.9971673, 0.3531308, 1.668308, 0.9803922, 0, 1, 1,
1.000993, 0.3736268, 0.6711257, 0.9843137, 0, 1, 1,
1.001047, 0.6611241, 2.119935, 0.9921569, 0, 1, 1,
1.016521, 1.896043, 2.153278, 0.9960784, 0, 1, 1,
1.025535, 0.7234696, -0.2926864, 1, 0, 0.9960784, 1,
1.028861, -0.7082487, 2.127988, 1, 0, 0.9882353, 1,
1.030856, -0.672555, 3.734009, 1, 0, 0.9843137, 1,
1.034608, 0.4968587, 0.9852405, 1, 0, 0.9764706, 1,
1.042049, -1.038296, 2.594392, 1, 0, 0.972549, 1,
1.049997, 0.2605073, 2.176651, 1, 0, 0.9647059, 1,
1.062763, -0.8746244, 1.733766, 1, 0, 0.9607843, 1,
1.065987, 0.4966673, -0.06424799, 1, 0, 0.9529412, 1,
1.066119, 1.519728, -0.2916423, 1, 0, 0.9490196, 1,
1.06873, 0.4272124, 0.7588017, 1, 0, 0.9411765, 1,
1.069222, 0.6118089, 0.05347586, 1, 0, 0.9372549, 1,
1.080338, 0.05914333, -0.8192259, 1, 0, 0.9294118, 1,
1.084537, -0.0745465, 1.68745, 1, 0, 0.9254902, 1,
1.094181, 2.750352, -2.189523, 1, 0, 0.9176471, 1,
1.098833, -0.1087631, 1.627599, 1, 0, 0.9137255, 1,
1.100181, -1.140156, 2.654681, 1, 0, 0.9058824, 1,
1.112907, -0.2766933, 2.071025, 1, 0, 0.9019608, 1,
1.114851, -2.593749, 4.285458, 1, 0, 0.8941177, 1,
1.117949, -0.07990111, 0.7784176, 1, 0, 0.8862745, 1,
1.118524, -0.2404176, 2.329937, 1, 0, 0.8823529, 1,
1.119845, 1.208545, 0.1557862, 1, 0, 0.8745098, 1,
1.122499, 0.4331197, 0.7782702, 1, 0, 0.8705882, 1,
1.12539, -1.46021, 1.25158, 1, 0, 0.8627451, 1,
1.127741, -0.881216, 1.820929, 1, 0, 0.8588235, 1,
1.131994, 1.523908, -1.188353, 1, 0, 0.8509804, 1,
1.142885, -1.357223, 1.234289, 1, 0, 0.8470588, 1,
1.14564, 0.8812715, 0.9383123, 1, 0, 0.8392157, 1,
1.146356, 0.8559315, 1.980271, 1, 0, 0.8352941, 1,
1.14654, -0.1504504, 0.1479336, 1, 0, 0.827451, 1,
1.16477, 0.3825875, 3.602652, 1, 0, 0.8235294, 1,
1.165741, 1.314324, 0.7173651, 1, 0, 0.8156863, 1,
1.165926, -1.113917, 2.601868, 1, 0, 0.8117647, 1,
1.173304, -0.4791547, 0.8722494, 1, 0, 0.8039216, 1,
1.180876, 2.010323, 0.4280558, 1, 0, 0.7960784, 1,
1.195388, -0.7331653, 0.4256404, 1, 0, 0.7921569, 1,
1.197768, -0.4104372, 1.662055, 1, 0, 0.7843137, 1,
1.202311, -0.1527224, 0.7821135, 1, 0, 0.7803922, 1,
1.211296, 0.2592223, 2.849796, 1, 0, 0.772549, 1,
1.211805, 0.807245, -0.8418603, 1, 0, 0.7686275, 1,
1.216891, -1.818065, 2.466368, 1, 0, 0.7607843, 1,
1.224453, 0.6215056, 0.006029426, 1, 0, 0.7568628, 1,
1.237975, 0.900954, 1.14286, 1, 0, 0.7490196, 1,
1.240169, 0.2139669, 1.464164, 1, 0, 0.7450981, 1,
1.246962, -0.04393033, 0.9284948, 1, 0, 0.7372549, 1,
1.256035, -0.7697749, -0.2339881, 1, 0, 0.7333333, 1,
1.266269, -1.236247, 3.121693, 1, 0, 0.7254902, 1,
1.269185, 1.027185, 1.704192, 1, 0, 0.7215686, 1,
1.270558, -0.6274382, 1.578528, 1, 0, 0.7137255, 1,
1.271383, 1.108573, 1.347859, 1, 0, 0.7098039, 1,
1.276255, 0.2928212, 0.1689109, 1, 0, 0.7019608, 1,
1.283736, -0.1728878, 4.705235, 1, 0, 0.6941177, 1,
1.284354, 0.1294827, 0.2782715, 1, 0, 0.6901961, 1,
1.285403, 0.6780306, 0.8742211, 1, 0, 0.682353, 1,
1.287601, 0.1116922, 0.9923249, 1, 0, 0.6784314, 1,
1.291036, 1.009767, -0.06506115, 1, 0, 0.6705883, 1,
1.291868, 0.4471675, 0.6416615, 1, 0, 0.6666667, 1,
1.307232, -0.08699612, 3.337152, 1, 0, 0.6588235, 1,
1.309905, 0.1203113, 0.9776745, 1, 0, 0.654902, 1,
1.310598, -0.8132002, 2.241346, 1, 0, 0.6470588, 1,
1.313992, -0.1935765, 0.9189715, 1, 0, 0.6431373, 1,
1.316635, -0.4187564, 2.532959, 1, 0, 0.6352941, 1,
1.327062, 0.5825374, 0.4025567, 1, 0, 0.6313726, 1,
1.328133, 0.5077558, 1.541128, 1, 0, 0.6235294, 1,
1.329669, -0.3618462, 1.784294, 1, 0, 0.6196079, 1,
1.340944, -0.04656243, 1.515117, 1, 0, 0.6117647, 1,
1.362006, 0.5637608, -1.168826, 1, 0, 0.6078432, 1,
1.363024, 0.7939959, 1.411941, 1, 0, 0.6, 1,
1.370328, -0.4947669, 1.33774, 1, 0, 0.5921569, 1,
1.372244, -1.882499, 3.327616, 1, 0, 0.5882353, 1,
1.373966, 0.5261881, 1.683562, 1, 0, 0.5803922, 1,
1.378477, 1.597758, -0.04587653, 1, 0, 0.5764706, 1,
1.385145, 1.743375, 1.496404, 1, 0, 0.5686275, 1,
1.389525, 0.1998656, 1.495782, 1, 0, 0.5647059, 1,
1.39018, -0.568498, 4.602511, 1, 0, 0.5568628, 1,
1.400988, -1.959338, 2.032379, 1, 0, 0.5529412, 1,
1.409439, -0.8051997, 0.6402549, 1, 0, 0.5450981, 1,
1.409667, 0.08820974, 0.7380251, 1, 0, 0.5411765, 1,
1.421163, -1.449923, 2.160613, 1, 0, 0.5333334, 1,
1.429302, -0.2912559, 1.735464, 1, 0, 0.5294118, 1,
1.435356, 0.2880601, 1.668286, 1, 0, 0.5215687, 1,
1.443741, 0.1951147, 3.072732, 1, 0, 0.5176471, 1,
1.444741, 0.5192249, 2.019773, 1, 0, 0.509804, 1,
1.449535, 1.026572, 1.881818, 1, 0, 0.5058824, 1,
1.452566, 0.3681712, 0.01833197, 1, 0, 0.4980392, 1,
1.462973, 1.058218, 0.05680919, 1, 0, 0.4901961, 1,
1.467541, -0.3955234, 1.51636, 1, 0, 0.4862745, 1,
1.481131, 1.72955, 0.676778, 1, 0, 0.4784314, 1,
1.502634, -2.290242, 5.378422, 1, 0, 0.4745098, 1,
1.511976, 1.713619, -0.1473076, 1, 0, 0.4666667, 1,
1.521265, -0.9198935, 0.4670338, 1, 0, 0.4627451, 1,
1.522759, 0.01815948, 2.175343, 1, 0, 0.454902, 1,
1.535985, -0.4888824, 2.17003, 1, 0, 0.4509804, 1,
1.537833, 0.5768762, 2.156802, 1, 0, 0.4431373, 1,
1.542414, 0.534746, 0.6877369, 1, 0, 0.4392157, 1,
1.546587, 1.036768, 0.7466163, 1, 0, 0.4313726, 1,
1.557069, -0.7664379, 1.717427, 1, 0, 0.427451, 1,
1.566615, -1.077595, 1.480476, 1, 0, 0.4196078, 1,
1.573505, -1.085361, 2.705753, 1, 0, 0.4156863, 1,
1.589733, -0.2779149, -0.1566511, 1, 0, 0.4078431, 1,
1.60812, -1.887017, 3.181713, 1, 0, 0.4039216, 1,
1.617279, 0.009092757, 0.9549532, 1, 0, 0.3960784, 1,
1.619938, 0.3055152, 3.638031, 1, 0, 0.3882353, 1,
1.628372, -1.122746, 2.679535, 1, 0, 0.3843137, 1,
1.645695, -0.9041565, 3.432229, 1, 0, 0.3764706, 1,
1.659163, -1.643817, 2.905236, 1, 0, 0.372549, 1,
1.659243, -0.09174581, 2.127154, 1, 0, 0.3647059, 1,
1.670295, 1.102271, 3.24037, 1, 0, 0.3607843, 1,
1.670834, -1.273098, 1.173964, 1, 0, 0.3529412, 1,
1.675105, 0.8335546, 0.9531495, 1, 0, 0.3490196, 1,
1.675316, -0.5844125, 2.870256, 1, 0, 0.3411765, 1,
1.681094, 0.703276, 0.2034065, 1, 0, 0.3372549, 1,
1.68507, -0.1052925, 3.333238, 1, 0, 0.3294118, 1,
1.686848, 0.5039448, 1.132432, 1, 0, 0.3254902, 1,
1.690988, 2.328712, 1.957378, 1, 0, 0.3176471, 1,
1.692291, 0.9344918, 1.157866, 1, 0, 0.3137255, 1,
1.692548, 0.4966154, 2.84785, 1, 0, 0.3058824, 1,
1.6973, 1.222281, 0.6528515, 1, 0, 0.2980392, 1,
1.715226, 1.09511, 0.4680134, 1, 0, 0.2941177, 1,
1.720624, -0.2561341, 2.584864, 1, 0, 0.2862745, 1,
1.75103, 0.6045808, 2.161904, 1, 0, 0.282353, 1,
1.774046, 1.078757, 0.3510846, 1, 0, 0.2745098, 1,
1.78936, -1.197786, 1.617947, 1, 0, 0.2705882, 1,
1.792354, -0.2181316, 2.102004, 1, 0, 0.2627451, 1,
1.805898, -0.8794513, 4.913001, 1, 0, 0.2588235, 1,
1.816333, -1.756586, 1.760412, 1, 0, 0.2509804, 1,
1.818363, -1.235708, 1.893436, 1, 0, 0.2470588, 1,
1.824123, 0.01995409, 2.967785, 1, 0, 0.2392157, 1,
1.825812, -0.04521512, 0.671623, 1, 0, 0.2352941, 1,
1.838631, -1.658656, 1.871106, 1, 0, 0.227451, 1,
1.83922, -0.7548241, 4.407901, 1, 0, 0.2235294, 1,
1.866808, 0.08250475, 0.3532319, 1, 0, 0.2156863, 1,
1.897091, 0.7780291, -0.424069, 1, 0, 0.2117647, 1,
1.901286, 0.06357011, 1.251157, 1, 0, 0.2039216, 1,
1.925721, -1.726136, 2.916104, 1, 0, 0.1960784, 1,
1.939729, 0.560052, 1.502746, 1, 0, 0.1921569, 1,
1.993107, -2.017228, 2.834207, 1, 0, 0.1843137, 1,
2.001037, 0.04171435, 1.648126, 1, 0, 0.1803922, 1,
2.015036, 1.149381, 1.596373, 1, 0, 0.172549, 1,
2.030719, -2.333031, 1.029241, 1, 0, 0.1686275, 1,
2.062471, -0.07530794, 1.07823, 1, 0, 0.1607843, 1,
2.067082, 0.634158, 1.359466, 1, 0, 0.1568628, 1,
2.110487, 0.2543021, 1.962262, 1, 0, 0.1490196, 1,
2.125905, -0.01229898, 1.856059, 1, 0, 0.145098, 1,
2.164096, 0.9473651, 0.6700661, 1, 0, 0.1372549, 1,
2.180615, 0.3905562, 1.421527, 1, 0, 0.1333333, 1,
2.184037, 0.07403176, 1.621208, 1, 0, 0.1254902, 1,
2.190522, 2.169257, -0.6028906, 1, 0, 0.1215686, 1,
2.19112, -0.7629058, 1.553934, 1, 0, 0.1137255, 1,
2.191859, -1.582844, 3.328892, 1, 0, 0.1098039, 1,
2.197128, 0.6320098, -0.3720629, 1, 0, 0.1019608, 1,
2.209783, -1.55439, 3.734729, 1, 0, 0.09411765, 1,
2.217748, 2.31688, 0.4590635, 1, 0, 0.09019608, 1,
2.269159, -0.8031173, 1.685198, 1, 0, 0.08235294, 1,
2.285439, 0.1162798, 1.565322, 1, 0, 0.07843138, 1,
2.290591, -0.4314921, 1.225106, 1, 0, 0.07058824, 1,
2.344242, 1.467494, -1.961002, 1, 0, 0.06666667, 1,
2.358169, -1.083706, 2.594903, 1, 0, 0.05882353, 1,
2.373096, -0.6132172, 3.287838, 1, 0, 0.05490196, 1,
2.404644, 0.5802111, 2.332806, 1, 0, 0.04705882, 1,
2.411286, -1.208555, 1.447563, 1, 0, 0.04313726, 1,
2.419507, 0.5591283, 2.058555, 1, 0, 0.03529412, 1,
2.508474, 0.5023237, 2.485777, 1, 0, 0.03137255, 1,
2.518991, -0.2005418, 1.3955, 1, 0, 0.02352941, 1,
2.732523, -0.3924654, -0.4699318, 1, 0, 0.01960784, 1,
2.739339, 0.604273, 1.831265, 1, 0, 0.01176471, 1,
2.804504, -0.8761997, 1.033105, 1, 0, 0.007843138, 1
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
-0.08612406, -4.327234, -7.027897, 0, -0.5, 0.5, 0.5,
-0.08612406, -4.327234, -7.027897, 1, -0.5, 0.5, 0.5,
-0.08612406, -4.327234, -7.027897, 1, 1.5, 0.5, 0.5,
-0.08612406, -4.327234, -7.027897, 0, 1.5, 0.5, 0.5
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
-3.956675, 0.2444959, -7.027897, 0, -0.5, 0.5, 0.5,
-3.956675, 0.2444959, -7.027897, 1, -0.5, 0.5, 0.5,
-3.956675, 0.2444959, -7.027897, 1, 1.5, 0.5, 0.5,
-3.956675, 0.2444959, -7.027897, 0, 1.5, 0.5, 0.5
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
-3.956675, -4.327234, 0.6179528, 0, -0.5, 0.5, 0.5,
-3.956675, -4.327234, 0.6179528, 1, -0.5, 0.5, 0.5,
-3.956675, -4.327234, 0.6179528, 1, 1.5, 0.5, 0.5,
-3.956675, -4.327234, 0.6179528, 0, 1.5, 0.5, 0.5
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
-2, -3.272219, -5.263471,
2, -3.272219, -5.263471,
-2, -3.272219, -5.263471,
-2, -3.448055, -5.557542,
-1, -3.272219, -5.263471,
-1, -3.448055, -5.557542,
0, -3.272219, -5.263471,
0, -3.448055, -5.557542,
1, -3.272219, -5.263471,
1, -3.448055, -5.557542,
2, -3.272219, -5.263471,
2, -3.448055, -5.557542
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
-2, -3.799726, -6.145684, 0, -0.5, 0.5, 0.5,
-2, -3.799726, -6.145684, 1, -0.5, 0.5, 0.5,
-2, -3.799726, -6.145684, 1, 1.5, 0.5, 0.5,
-2, -3.799726, -6.145684, 0, 1.5, 0.5, 0.5,
-1, -3.799726, -6.145684, 0, -0.5, 0.5, 0.5,
-1, -3.799726, -6.145684, 1, -0.5, 0.5, 0.5,
-1, -3.799726, -6.145684, 1, 1.5, 0.5, 0.5,
-1, -3.799726, -6.145684, 0, 1.5, 0.5, 0.5,
0, -3.799726, -6.145684, 0, -0.5, 0.5, 0.5,
0, -3.799726, -6.145684, 1, -0.5, 0.5, 0.5,
0, -3.799726, -6.145684, 1, 1.5, 0.5, 0.5,
0, -3.799726, -6.145684, 0, 1.5, 0.5, 0.5,
1, -3.799726, -6.145684, 0, -0.5, 0.5, 0.5,
1, -3.799726, -6.145684, 1, -0.5, 0.5, 0.5,
1, -3.799726, -6.145684, 1, 1.5, 0.5, 0.5,
1, -3.799726, -6.145684, 0, 1.5, 0.5, 0.5,
2, -3.799726, -6.145684, 0, -0.5, 0.5, 0.5,
2, -3.799726, -6.145684, 1, -0.5, 0.5, 0.5,
2, -3.799726, -6.145684, 1, 1.5, 0.5, 0.5,
2, -3.799726, -6.145684, 0, 1.5, 0.5, 0.5
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
-3.063471, -3, -5.263471,
-3.063471, 3, -5.263471,
-3.063471, -3, -5.263471,
-3.212338, -3, -5.557542,
-3.063471, -2, -5.263471,
-3.212338, -2, -5.557542,
-3.063471, -1, -5.263471,
-3.212338, -1, -5.557542,
-3.063471, 0, -5.263471,
-3.212338, 0, -5.557542,
-3.063471, 1, -5.263471,
-3.212338, 1, -5.557542,
-3.063471, 2, -5.263471,
-3.212338, 2, -5.557542,
-3.063471, 3, -5.263471,
-3.212338, 3, -5.557542
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
-3.510073, -3, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, -3, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, -3, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, -3, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, -2, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, -2, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, -2, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, -2, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, -1, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, -1, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, -1, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, -1, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, 0, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, 0, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, 0, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, 0, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, 1, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, 1, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, 1, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, 1, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, 2, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, 2, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, 2, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, 2, -6.145684, 0, 1.5, 0.5, 0.5,
-3.510073, 3, -6.145684, 0, -0.5, 0.5, 0.5,
-3.510073, 3, -6.145684, 1, -0.5, 0.5, 0.5,
-3.510073, 3, -6.145684, 1, 1.5, 0.5, 0.5,
-3.510073, 3, -6.145684, 0, 1.5, 0.5, 0.5
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
-3.063471, -3.272219, -4,
-3.063471, -3.272219, 6,
-3.063471, -3.272219, -4,
-3.212338, -3.448055, -4,
-3.063471, -3.272219, -2,
-3.212338, -3.448055, -2,
-3.063471, -3.272219, 0,
-3.212338, -3.448055, 0,
-3.063471, -3.272219, 2,
-3.212338, -3.448055, 2,
-3.063471, -3.272219, 4,
-3.212338, -3.448055, 4,
-3.063471, -3.272219, 6,
-3.212338, -3.448055, 6
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
-3.510073, -3.799726, -4, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, -4, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, -4, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, -4, 0, 1.5, 0.5, 0.5,
-3.510073, -3.799726, -2, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, -2, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, -2, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, -2, 0, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 0, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 0, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 0, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 0, 0, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 2, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 2, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 2, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 2, 0, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 4, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 4, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 4, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 4, 0, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 6, 0, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 6, 1, -0.5, 0.5, 0.5,
-3.510073, -3.799726, 6, 1, 1.5, 0.5, 0.5,
-3.510073, -3.799726, 6, 0, 1.5, 0.5, 0.5
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
-3.063471, -3.272219, -5.263471,
-3.063471, 3.761211, -5.263471,
-3.063471, -3.272219, 6.499376,
-3.063471, 3.761211, 6.499376,
-3.063471, -3.272219, -5.263471,
-3.063471, -3.272219, 6.499376,
-3.063471, 3.761211, -5.263471,
-3.063471, 3.761211, 6.499376,
-3.063471, -3.272219, -5.263471,
2.891223, -3.272219, -5.263471,
-3.063471, -3.272219, 6.499376,
2.891223, -3.272219, 6.499376,
-3.063471, 3.761211, -5.263471,
2.891223, 3.761211, -5.263471,
-3.063471, 3.761211, 6.499376,
2.891223, 3.761211, 6.499376,
2.891223, -3.272219, -5.263471,
2.891223, 3.761211, -5.263471,
2.891223, -3.272219, 6.499376,
2.891223, 3.761211, 6.499376,
2.891223, -3.272219, -5.263471,
2.891223, -3.272219, 6.499376,
2.891223, 3.761211, -5.263471,
2.891223, 3.761211, 6.499376
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
var radius = 7.979251;
var distance = 35.50059;
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
mvMatrix.translate( 0.08612406, -0.2444959, -0.6179528 );
mvMatrix.scale( 1.448827, 1.226617, 0.7334383 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50059);
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


