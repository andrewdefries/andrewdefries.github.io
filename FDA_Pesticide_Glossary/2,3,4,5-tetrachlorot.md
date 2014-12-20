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
-3.193542, -1.678289, -1.249718, 1, 0, 0, 1,
-3.180209, 0.1593097, -2.384116, 1, 0.007843138, 0, 1,
-3.039022, 0.1091916, -0.9209493, 1, 0.01176471, 0, 1,
-2.920419, 0.4026005, -2.150519, 1, 0.01960784, 0, 1,
-2.594137, 0.162312, -0.6057571, 1, 0.02352941, 0, 1,
-2.580104, -0.9483429, -2.217711, 1, 0.03137255, 0, 1,
-2.549912, -1.795172, -1.989219, 1, 0.03529412, 0, 1,
-2.548451, 0.3508624, -1.410165, 1, 0.04313726, 0, 1,
-2.50034, -0.03600601, -1.897625, 1, 0.04705882, 0, 1,
-2.465649, -1.061983, -0.6967747, 1, 0.05490196, 0, 1,
-2.463593, -0.5082927, -1.973126, 1, 0.05882353, 0, 1,
-2.440927, 0.8312081, -0.5982144, 1, 0.06666667, 0, 1,
-2.42067, -0.9870357, -3.961604, 1, 0.07058824, 0, 1,
-2.411108, -1.342561, -2.379016, 1, 0.07843138, 0, 1,
-2.403002, 0.1808562, 0.2728306, 1, 0.08235294, 0, 1,
-2.372774, -0.1640689, -1.05156, 1, 0.09019608, 0, 1,
-2.339275, 0.1691145, -1.944481, 1, 0.09411765, 0, 1,
-2.274802, -0.194654, -1.301103, 1, 0.1019608, 0, 1,
-2.267101, -0.2780571, -0.9984044, 1, 0.1098039, 0, 1,
-2.260968, -0.6818495, -2.151716, 1, 0.1137255, 0, 1,
-2.218321, 0.316664, -1.926193, 1, 0.1215686, 0, 1,
-2.201964, -0.5232847, -0.3482976, 1, 0.1254902, 0, 1,
-2.198844, -0.5123543, -2.420398, 1, 0.1333333, 0, 1,
-2.159033, 1.847131, -1.571354, 1, 0.1372549, 0, 1,
-2.147119, 0.7617153, -0.3523577, 1, 0.145098, 0, 1,
-2.14328, -0.2420546, -2.999426, 1, 0.1490196, 0, 1,
-2.135671, 1.522179, -1.129622, 1, 0.1568628, 0, 1,
-2.089339, 1.631566, -0.7472963, 1, 0.1607843, 0, 1,
-1.99865, -0.2849874, -1.410997, 1, 0.1686275, 0, 1,
-1.995885, 0.8942168, -1.519776, 1, 0.172549, 0, 1,
-1.994154, -0.4282205, -3.435769, 1, 0.1803922, 0, 1,
-1.987746, 0.190716, 1.043083, 1, 0.1843137, 0, 1,
-1.981819, -0.9262317, -2.051424, 1, 0.1921569, 0, 1,
-1.977076, -0.2740633, -1.801622, 1, 0.1960784, 0, 1,
-1.944025, -0.1981521, -1.574089, 1, 0.2039216, 0, 1,
-1.92324, 1.289982, -0.1232611, 1, 0.2117647, 0, 1,
-1.921565, 1.698516, 0.1705742, 1, 0.2156863, 0, 1,
-1.920507, -1.562335, -2.196244, 1, 0.2235294, 0, 1,
-1.898065, 0.03051916, 0.8939211, 1, 0.227451, 0, 1,
-1.867613, -0.2351123, -2.62986, 1, 0.2352941, 0, 1,
-1.85467, -1.30533, -2.271769, 1, 0.2392157, 0, 1,
-1.846171, -0.3516096, -1.813496, 1, 0.2470588, 0, 1,
-1.843107, 1.625506, -1.737256, 1, 0.2509804, 0, 1,
-1.83917, -1.238711, -3.368807, 1, 0.2588235, 0, 1,
-1.803383, 0.1252274, -3.43951, 1, 0.2627451, 0, 1,
-1.799442, 0.9977615, -1.757539, 1, 0.2705882, 0, 1,
-1.776529, 0.6242599, -0.1315474, 1, 0.2745098, 0, 1,
-1.757255, 0.2002269, -2.518187, 1, 0.282353, 0, 1,
-1.750861, -2.352846, -3.489083, 1, 0.2862745, 0, 1,
-1.741311, -1.161197, -3.682081, 1, 0.2941177, 0, 1,
-1.733081, -0.4975196, -2.172794, 1, 0.3019608, 0, 1,
-1.728336, -0.4167816, -2.736326, 1, 0.3058824, 0, 1,
-1.724341, 1.069848, -0.72321, 1, 0.3137255, 0, 1,
-1.703735, 1.062297, -2.797459, 1, 0.3176471, 0, 1,
-1.697371, -1.362419, -2.69273, 1, 0.3254902, 0, 1,
-1.666649, -0.6352233, -2.169688, 1, 0.3294118, 0, 1,
-1.665572, 1.242744, -0.1654054, 1, 0.3372549, 0, 1,
-1.657157, -0.1987454, -1.318372, 1, 0.3411765, 0, 1,
-1.647182, 0.1174009, -0.5592699, 1, 0.3490196, 0, 1,
-1.61239, -1.983556, -2.062384, 1, 0.3529412, 0, 1,
-1.610601, 1.040157, -1.439749, 1, 0.3607843, 0, 1,
-1.593691, 0.5257332, -0.667385, 1, 0.3647059, 0, 1,
-1.592124, 0.568355, -2.524426, 1, 0.372549, 0, 1,
-1.564405, -0.1129472, -1.044276, 1, 0.3764706, 0, 1,
-1.561642, 0.6078222, -2.424138, 1, 0.3843137, 0, 1,
-1.558551, -0.5762773, -1.58317, 1, 0.3882353, 0, 1,
-1.552429, 0.4668009, -1.643998, 1, 0.3960784, 0, 1,
-1.543277, 0.1095594, -2.374358, 1, 0.4039216, 0, 1,
-1.525916, -2.1305, -3.658678, 1, 0.4078431, 0, 1,
-1.505767, -1.306007, -2.467793, 1, 0.4156863, 0, 1,
-1.503032, 0.8949443, -1.326338, 1, 0.4196078, 0, 1,
-1.495146, -1.571127, -0.3889569, 1, 0.427451, 0, 1,
-1.492943, -1.385249, -1.042389, 1, 0.4313726, 0, 1,
-1.489836, 1.120981, -0.7933112, 1, 0.4392157, 0, 1,
-1.487932, 0.125685, -2.431859, 1, 0.4431373, 0, 1,
-1.472017, 0.5181542, -2.378488, 1, 0.4509804, 0, 1,
-1.467489, 1.699491, -1.098483, 1, 0.454902, 0, 1,
-1.457248, 0.3626569, -0.6520228, 1, 0.4627451, 0, 1,
-1.449718, -1.438861, -2.759902, 1, 0.4666667, 0, 1,
-1.436739, 0.9069439, -2.627201, 1, 0.4745098, 0, 1,
-1.429812, -1.155356, -3.571563, 1, 0.4784314, 0, 1,
-1.424089, -0.9082273, -2.182938, 1, 0.4862745, 0, 1,
-1.417387, 0.4302387, -0.6696754, 1, 0.4901961, 0, 1,
-1.400177, 0.2683848, -0.01387074, 1, 0.4980392, 0, 1,
-1.397658, 0.9788138, -0.0222472, 1, 0.5058824, 0, 1,
-1.390585, 0.8985192, -1.298711, 1, 0.509804, 0, 1,
-1.384698, 0.9384117, -0.3040554, 1, 0.5176471, 0, 1,
-1.381279, 1.107666, -2.342805, 1, 0.5215687, 0, 1,
-1.365086, -1.219817, -0.2755724, 1, 0.5294118, 0, 1,
-1.363049, 0.1848, -2.325676, 1, 0.5333334, 0, 1,
-1.359842, 0.1961112, -2.265127, 1, 0.5411765, 0, 1,
-1.353601, 0.108818, -0.9800028, 1, 0.5450981, 0, 1,
-1.343831, -0.3408376, -0.7942339, 1, 0.5529412, 0, 1,
-1.333278, -0.9062173, -2.978163, 1, 0.5568628, 0, 1,
-1.332544, -0.3862973, -1.063839, 1, 0.5647059, 0, 1,
-1.329202, 0.997228, -0.6321048, 1, 0.5686275, 0, 1,
-1.322953, 0.3059276, -0.6025175, 1, 0.5764706, 0, 1,
-1.320601, 0.02970522, -1.105816, 1, 0.5803922, 0, 1,
-1.318694, -0.2172962, 0.09077234, 1, 0.5882353, 0, 1,
-1.317852, 0.2661102, -0.2713662, 1, 0.5921569, 0, 1,
-1.306196, 0.9671376, -0.07042846, 1, 0.6, 0, 1,
-1.286357, -0.2534061, -3.026602, 1, 0.6078432, 0, 1,
-1.275887, -0.1868298, -3.195873, 1, 0.6117647, 0, 1,
-1.275249, -3.718844, -4.468993, 1, 0.6196079, 0, 1,
-1.272588, 1.869063, -0.2563563, 1, 0.6235294, 0, 1,
-1.271215, 0.3958088, 0.05259274, 1, 0.6313726, 0, 1,
-1.255114, -1.522584, -2.883499, 1, 0.6352941, 0, 1,
-1.250581, -1.375722, -2.431088, 1, 0.6431373, 0, 1,
-1.240112, -0.3684602, -1.880673, 1, 0.6470588, 0, 1,
-1.240072, 0.8939332, -1.254568, 1, 0.654902, 0, 1,
-1.228618, -0.2610209, -1.655005, 1, 0.6588235, 0, 1,
-1.226875, 1.195071, -1.056026, 1, 0.6666667, 0, 1,
-1.223926, 0.5095705, -1.545329, 1, 0.6705883, 0, 1,
-1.219913, -0.2230481, -2.686545, 1, 0.6784314, 0, 1,
-1.216169, 0.4465669, 0.3924884, 1, 0.682353, 0, 1,
-1.211516, -0.2917603, -1.183015, 1, 0.6901961, 0, 1,
-1.207767, -0.4140591, -1.16487, 1, 0.6941177, 0, 1,
-1.207472, -1.282834, -2.190865, 1, 0.7019608, 0, 1,
-1.204906, 0.2512563, -3.474362, 1, 0.7098039, 0, 1,
-1.204446, -1.657949, -1.176522, 1, 0.7137255, 0, 1,
-1.200099, 2.517228, 0.3117098, 1, 0.7215686, 0, 1,
-1.195851, 0.7223558, -0.6557698, 1, 0.7254902, 0, 1,
-1.188083, -0.2176424, -3.023735, 1, 0.7333333, 0, 1,
-1.186928, 0.3529744, -0.502474, 1, 0.7372549, 0, 1,
-1.176884, 0.2188296, -0.334696, 1, 0.7450981, 0, 1,
-1.17352, 3.020474, -1.66546, 1, 0.7490196, 0, 1,
-1.165682, -0.296686, -1.900966, 1, 0.7568628, 0, 1,
-1.159601, -0.9882256, -4.274011, 1, 0.7607843, 0, 1,
-1.136368, -0.3280284, -0.8276451, 1, 0.7686275, 0, 1,
-1.128466, -1.17992, -2.173334, 1, 0.772549, 0, 1,
-1.127781, 0.7494896, -2.414493, 1, 0.7803922, 0, 1,
-1.117444, -0.2775694, -2.348861, 1, 0.7843137, 0, 1,
-1.114022, -1.494992, -3.219603, 1, 0.7921569, 0, 1,
-1.109466, -0.04480425, -1.18443, 1, 0.7960784, 0, 1,
-1.084951, 0.2743767, -2.863813, 1, 0.8039216, 0, 1,
-1.083824, -2.336574, -2.674514, 1, 0.8117647, 0, 1,
-1.080768, -0.6443166, -0.9138209, 1, 0.8156863, 0, 1,
-1.080625, -0.6401034, -1.69391, 1, 0.8235294, 0, 1,
-1.078822, -0.8970287, -2.490743, 1, 0.827451, 0, 1,
-1.071879, 1.005435, -0.1685349, 1, 0.8352941, 0, 1,
-1.070688, -1.224254, -2.91888, 1, 0.8392157, 0, 1,
-1.065125, 0.2765566, -3.349779, 1, 0.8470588, 0, 1,
-1.057668, 1.018663, -0.9762344, 1, 0.8509804, 0, 1,
-1.056607, 1.032051, -2.389207, 1, 0.8588235, 0, 1,
-1.054068, -0.08502576, -0.2210108, 1, 0.8627451, 0, 1,
-1.051703, -0.894082, 0.988497, 1, 0.8705882, 0, 1,
-1.046799, -0.1070173, -3.092174, 1, 0.8745098, 0, 1,
-1.044951, -0.4411877, -0.9445199, 1, 0.8823529, 0, 1,
-1.0436, 1.357143, -1.258126, 1, 0.8862745, 0, 1,
-1.038532, -1.130543, -2.319378, 1, 0.8941177, 0, 1,
-1.026426, -0.704886, -2.11499, 1, 0.8980392, 0, 1,
-1.026066, -0.336575, -2.790656, 1, 0.9058824, 0, 1,
-1.016906, 0.3022659, -1.183854, 1, 0.9137255, 0, 1,
-1.013111, 0.4784478, -1.046652, 1, 0.9176471, 0, 1,
-1.005379, -2.461637, -3.790605, 1, 0.9254902, 0, 1,
-1.002355, 1.444668, 0.6811754, 1, 0.9294118, 0, 1,
-1.00166, 0.03374552, -0.6330635, 1, 0.9372549, 0, 1,
-1.001299, -0.006330681, -1.180009, 1, 0.9411765, 0, 1,
-0.9957507, -0.8761611, -3.195009, 1, 0.9490196, 0, 1,
-0.9849627, 0.5792245, 0.3060915, 1, 0.9529412, 0, 1,
-0.9844644, 0.9708467, 0.2221925, 1, 0.9607843, 0, 1,
-0.9811354, 0.03203737, -2.486494, 1, 0.9647059, 0, 1,
-0.9793717, -0.3102542, -1.642659, 1, 0.972549, 0, 1,
-0.978911, -0.5644639, -1.757128, 1, 0.9764706, 0, 1,
-0.9744362, 0.9109504, -0.8017709, 1, 0.9843137, 0, 1,
-0.9659598, -1.188565, -3.397487, 1, 0.9882353, 0, 1,
-0.965636, -1.076403, -2.936472, 1, 0.9960784, 0, 1,
-0.9642776, -0.7878735, -3.113847, 0.9960784, 1, 0, 1,
-0.962118, 1.317161, -0.6706558, 0.9921569, 1, 0, 1,
-0.9592239, 0.7192734, 0.5548674, 0.9843137, 1, 0, 1,
-0.9583526, -0.5452457, -1.416172, 0.9803922, 1, 0, 1,
-0.9528782, -0.5323818, -2.953084, 0.972549, 1, 0, 1,
-0.9505608, -0.5881937, -2.043939, 0.9686275, 1, 0, 1,
-0.9493962, 0.3901061, -2.146703, 0.9607843, 1, 0, 1,
-0.9455383, -0.1539365, -0.1006575, 0.9568627, 1, 0, 1,
-0.9404202, -1.576149, -2.185123, 0.9490196, 1, 0, 1,
-0.9306226, 0.01402793, -3.716937, 0.945098, 1, 0, 1,
-0.9095019, -1.130505, -0.885239, 0.9372549, 1, 0, 1,
-0.9012917, 1.383771, -0.06919692, 0.9333333, 1, 0, 1,
-0.9005551, 0.6632991, -0.6975738, 0.9254902, 1, 0, 1,
-0.8773325, 0.227537, -1.577765, 0.9215686, 1, 0, 1,
-0.8761334, -0.7874776, -2.071624, 0.9137255, 1, 0, 1,
-0.8717332, -0.8390494, -1.982772, 0.9098039, 1, 0, 1,
-0.8650171, -0.8893548, -0.6322196, 0.9019608, 1, 0, 1,
-0.8630708, 0.6480467, -3.093877, 0.8941177, 1, 0, 1,
-0.8580773, -1.583697, -2.375937, 0.8901961, 1, 0, 1,
-0.8571348, -1.018583, -2.823424, 0.8823529, 1, 0, 1,
-0.8529763, 1.286269, -0.3653016, 0.8784314, 1, 0, 1,
-0.8510267, -0.2874569, -1.196834, 0.8705882, 1, 0, 1,
-0.8486963, 0.2722075, -0.4685813, 0.8666667, 1, 0, 1,
-0.8473027, -1.163391, -0.4662577, 0.8588235, 1, 0, 1,
-0.8472183, 0.2733332, -1.884003, 0.854902, 1, 0, 1,
-0.8357843, 1.114822, -1.315469, 0.8470588, 1, 0, 1,
-0.8321324, -0.02111067, -1.132648, 0.8431373, 1, 0, 1,
-0.8314344, -0.5083093, -1.817116, 0.8352941, 1, 0, 1,
-0.8294283, 0.8249645, -1.790641, 0.8313726, 1, 0, 1,
-0.8237439, -0.6787392, -1.820021, 0.8235294, 1, 0, 1,
-0.8235826, 0.6821749, -0.4516744, 0.8196079, 1, 0, 1,
-0.8117068, -1.223198, -4.181117, 0.8117647, 1, 0, 1,
-0.8106585, -0.1974476, -2.230839, 0.8078431, 1, 0, 1,
-0.8027678, -1.056111, -2.625447, 0.8, 1, 0, 1,
-0.8003117, -1.73171, -2.817404, 0.7921569, 1, 0, 1,
-0.7998611, 1.575007, 0.2771943, 0.7882353, 1, 0, 1,
-0.7998484, 0.2274628, -1.626546, 0.7803922, 1, 0, 1,
-0.7932401, 1.041213, -0.6785177, 0.7764706, 1, 0, 1,
-0.7891446, -1.252748, -2.902523, 0.7686275, 1, 0, 1,
-0.789099, -1.512705, -3.494548, 0.7647059, 1, 0, 1,
-0.7887959, -0.1818666, -0.5753893, 0.7568628, 1, 0, 1,
-0.7867918, 0.8887619, -1.088051, 0.7529412, 1, 0, 1,
-0.7858722, -1.856663, -2.783743, 0.7450981, 1, 0, 1,
-0.782683, -0.005762396, -0.3330051, 0.7411765, 1, 0, 1,
-0.7806304, -1.950943, -2.135064, 0.7333333, 1, 0, 1,
-0.7788861, -0.3856772, -3.465935, 0.7294118, 1, 0, 1,
-0.7689099, 1.07814, -2.090126, 0.7215686, 1, 0, 1,
-0.7627454, 0.003177484, -0.4526271, 0.7176471, 1, 0, 1,
-0.7617596, 1.3896, -1.01217, 0.7098039, 1, 0, 1,
-0.7584676, 0.02932431, -0.9810262, 0.7058824, 1, 0, 1,
-0.7581761, 0.881062, -1.20541, 0.6980392, 1, 0, 1,
-0.7574269, 1.664003, 0.0063967, 0.6901961, 1, 0, 1,
-0.7573409, 0.9641935, -0.3083784, 0.6862745, 1, 0, 1,
-0.7539241, -0.7281834, -3.404333, 0.6784314, 1, 0, 1,
-0.7488009, 0.03045381, -3.35571, 0.6745098, 1, 0, 1,
-0.7427735, -0.2287323, -1.833893, 0.6666667, 1, 0, 1,
-0.7420031, -2.329424, -3.680743, 0.6627451, 1, 0, 1,
-0.7417841, 0.2827553, -0.4272329, 0.654902, 1, 0, 1,
-0.7389333, 1.107491, -0.5868068, 0.6509804, 1, 0, 1,
-0.7256978, 0.09541599, -1.151629, 0.6431373, 1, 0, 1,
-0.7252575, -0.5452542, -3.309564, 0.6392157, 1, 0, 1,
-0.7242797, 0.8931218, -1.110727, 0.6313726, 1, 0, 1,
-0.7222195, -2.41927, -3.376482, 0.627451, 1, 0, 1,
-0.7217038, 0.0461441, -1.52231, 0.6196079, 1, 0, 1,
-0.7215969, 0.8425902, -0.5511862, 0.6156863, 1, 0, 1,
-0.721129, -0.7691462, -2.932936, 0.6078432, 1, 0, 1,
-0.7206168, -0.6683438, -2.440926, 0.6039216, 1, 0, 1,
-0.7188762, -0.154431, -1.712491, 0.5960785, 1, 0, 1,
-0.7130604, -0.9368718, 0.3837842, 0.5882353, 1, 0, 1,
-0.7111081, -0.9473702, -2.33701, 0.5843138, 1, 0, 1,
-0.7101939, -0.4219926, -0.9288123, 0.5764706, 1, 0, 1,
-0.7041193, 0.261399, -1.776704, 0.572549, 1, 0, 1,
-0.7023541, 0.216473, -2.679218, 0.5647059, 1, 0, 1,
-0.6976897, 0.6785628, -1.356579, 0.5607843, 1, 0, 1,
-0.6896861, 0.3225628, 1.10077, 0.5529412, 1, 0, 1,
-0.6864643, -0.6168554, -1.9203, 0.5490196, 1, 0, 1,
-0.6797435, 0.02912349, -1.933234, 0.5411765, 1, 0, 1,
-0.6764314, -0.3921702, -3.454896, 0.5372549, 1, 0, 1,
-0.6763287, -0.3916357, 0.3917853, 0.5294118, 1, 0, 1,
-0.6741024, -0.1016567, -0.9317321, 0.5254902, 1, 0, 1,
-0.6717554, -0.005925946, -0.2893044, 0.5176471, 1, 0, 1,
-0.6686664, 1.372666, 0.2799859, 0.5137255, 1, 0, 1,
-0.6678524, 1.073079, -1.403622, 0.5058824, 1, 0, 1,
-0.6671546, -0.9170698, -1.355051, 0.5019608, 1, 0, 1,
-0.6669706, 0.5300336, -0.04286734, 0.4941176, 1, 0, 1,
-0.6562107, -0.3668259, -3.797118, 0.4862745, 1, 0, 1,
-0.6543665, 0.1154903, -0.732604, 0.4823529, 1, 0, 1,
-0.6495669, 0.8775228, 0.04024535, 0.4745098, 1, 0, 1,
-0.6477458, 1.566516, -0.5633962, 0.4705882, 1, 0, 1,
-0.647095, -0.007134716, -1.318048, 0.4627451, 1, 0, 1,
-0.6457776, 0.04493827, -3.600579, 0.4588235, 1, 0, 1,
-0.6437654, 0.07382867, 0.583243, 0.4509804, 1, 0, 1,
-0.6403551, 0.5122406, -0.4400988, 0.4470588, 1, 0, 1,
-0.6400458, 0.2222821, -0.9235819, 0.4392157, 1, 0, 1,
-0.6386178, 0.8159243, 0.2994645, 0.4352941, 1, 0, 1,
-0.6279307, 0.1274977, -2.553439, 0.427451, 1, 0, 1,
-0.6272619, 0.5409688, 0.2474396, 0.4235294, 1, 0, 1,
-0.6249117, -0.7272833, -2.739479, 0.4156863, 1, 0, 1,
-0.6248394, -0.5924373, -2.149899, 0.4117647, 1, 0, 1,
-0.6206669, 1.004091, 0.7164273, 0.4039216, 1, 0, 1,
-0.6198323, 1.229865, 0.5880265, 0.3960784, 1, 0, 1,
-0.617339, -2.339316, -3.87918, 0.3921569, 1, 0, 1,
-0.6153409, -0.8995323, -2.247672, 0.3843137, 1, 0, 1,
-0.6113108, -0.9017455, -5.025284, 0.3803922, 1, 0, 1,
-0.6108434, -1.470203, -2.961554, 0.372549, 1, 0, 1,
-0.6068538, -0.08604857, -2.59096, 0.3686275, 1, 0, 1,
-0.6050468, 0.9475524, -1.560793, 0.3607843, 1, 0, 1,
-0.6019568, 1.012946, 0.9253396, 0.3568628, 1, 0, 1,
-0.5946004, 0.3891722, -1.270569, 0.3490196, 1, 0, 1,
-0.5919068, 1.591617, -0.02096943, 0.345098, 1, 0, 1,
-0.591106, -0.5641468, -3.283298, 0.3372549, 1, 0, 1,
-0.5884281, 0.2305611, -0.4508776, 0.3333333, 1, 0, 1,
-0.5875517, -0.3401662, -0.5137503, 0.3254902, 1, 0, 1,
-0.5872697, 0.410201, -0.8631378, 0.3215686, 1, 0, 1,
-0.5856963, -1.822146, -2.681624, 0.3137255, 1, 0, 1,
-0.5856007, -1.050423, -4.199022, 0.3098039, 1, 0, 1,
-0.582504, -0.1388668, -1.567813, 0.3019608, 1, 0, 1,
-0.5789831, 0.947009, -1.647255, 0.2941177, 1, 0, 1,
-0.5772553, -0.7058299, -2.975364, 0.2901961, 1, 0, 1,
-0.5734715, -0.001713632, -2.259386, 0.282353, 1, 0, 1,
-0.573059, -1.170425, -2.478001, 0.2784314, 1, 0, 1,
-0.5672742, 0.4979178, -0.5246336, 0.2705882, 1, 0, 1,
-0.565531, 0.8885718, 1.60389, 0.2666667, 1, 0, 1,
-0.565485, 1.232832, -1.460918, 0.2588235, 1, 0, 1,
-0.5618233, 1.216351, -0.3612283, 0.254902, 1, 0, 1,
-0.5607427, -0.1533783, -0.5347866, 0.2470588, 1, 0, 1,
-0.5535584, -2.359468, -2.994822, 0.2431373, 1, 0, 1,
-0.5530512, -0.5430981, -1.985996, 0.2352941, 1, 0, 1,
-0.5529045, -0.03641931, -3.520484, 0.2313726, 1, 0, 1,
-0.55215, -0.4629728, -1.227424, 0.2235294, 1, 0, 1,
-0.5516806, 0.1773997, -0.9029094, 0.2196078, 1, 0, 1,
-0.547782, -0.945991, -2.598976, 0.2117647, 1, 0, 1,
-0.536027, -0.01140683, -2.428437, 0.2078431, 1, 0, 1,
-0.5349939, -0.02929518, -2.388911, 0.2, 1, 0, 1,
-0.5342587, -0.6026382, -1.545111, 0.1921569, 1, 0, 1,
-0.5319647, -0.4361361, -0.6000227, 0.1882353, 1, 0, 1,
-0.5248815, -1.412174, -3.048999, 0.1803922, 1, 0, 1,
-0.5227806, -0.05013698, -0.9332318, 0.1764706, 1, 0, 1,
-0.5217892, -0.4039153, -1.570336, 0.1686275, 1, 0, 1,
-0.5170351, 1.518241, 1.361151, 0.1647059, 1, 0, 1,
-0.5111061, -1.385729, -2.228335, 0.1568628, 1, 0, 1,
-0.5084392, -0.02754895, -2.04724, 0.1529412, 1, 0, 1,
-0.5069878, 1.835093, -0.3373807, 0.145098, 1, 0, 1,
-0.5067572, 1.764512, -0.1526457, 0.1411765, 1, 0, 1,
-0.502323, -0.1765679, -2.748339, 0.1333333, 1, 0, 1,
-0.5014201, 1.621612, -1.593912, 0.1294118, 1, 0, 1,
-0.4994029, 1.257151, 0.8404071, 0.1215686, 1, 0, 1,
-0.49823, -0.9071037, -2.011162, 0.1176471, 1, 0, 1,
-0.4967456, 0.6532582, -2.025118, 0.1098039, 1, 0, 1,
-0.4951237, -0.4444311, -1.697057, 0.1058824, 1, 0, 1,
-0.4893487, -2.145914, -2.200106, 0.09803922, 1, 0, 1,
-0.488175, -0.3003002, -2.275179, 0.09019608, 1, 0, 1,
-0.4847012, 0.4649059, -1.508284, 0.08627451, 1, 0, 1,
-0.4802816, -1.043416, -1.784417, 0.07843138, 1, 0, 1,
-0.4774958, -0.4434638, -3.031955, 0.07450981, 1, 0, 1,
-0.4769164, 0.4518623, -1.075856, 0.06666667, 1, 0, 1,
-0.4732559, -0.1349239, -0.1723107, 0.0627451, 1, 0, 1,
-0.4713661, 0.3895473, -1.64831, 0.05490196, 1, 0, 1,
-0.4690975, 0.1992416, -0.5303549, 0.05098039, 1, 0, 1,
-0.4688969, 0.7999078, -1.043505, 0.04313726, 1, 0, 1,
-0.466465, -0.7349685, -3.128475, 0.03921569, 1, 0, 1,
-0.4661901, -0.2863227, -0.7732747, 0.03137255, 1, 0, 1,
-0.4660519, 0.7770558, 1.249574, 0.02745098, 1, 0, 1,
-0.46365, 0.7679344, -0.1935866, 0.01960784, 1, 0, 1,
-0.4636366, 0.04020431, -2.281438, 0.01568628, 1, 0, 1,
-0.4561468, -0.9483371, -2.468016, 0.007843138, 1, 0, 1,
-0.4556731, -0.6339315, -2.471025, 0.003921569, 1, 0, 1,
-0.453673, 0.1348844, -1.046138, 0, 1, 0.003921569, 1,
-0.4501799, -1.72728, -3.241972, 0, 1, 0.01176471, 1,
-0.4392932, -2.161934, -2.893632, 0, 1, 0.01568628, 1,
-0.4346093, -0.6237985, -3.775541, 0, 1, 0.02352941, 1,
-0.430233, 1.106786, -0.6499017, 0, 1, 0.02745098, 1,
-0.4302063, -0.1945054, -2.243246, 0, 1, 0.03529412, 1,
-0.4289136, 1.830638, -1.475164, 0, 1, 0.03921569, 1,
-0.418415, 0.0532134, -0.9990197, 0, 1, 0.04705882, 1,
-0.4180638, 1.649577, -1.29464, 0, 1, 0.05098039, 1,
-0.4160543, -0.9562477, -1.702106, 0, 1, 0.05882353, 1,
-0.4068077, 0.7822861, -1.023592, 0, 1, 0.0627451, 1,
-0.4063546, 2.976847, -1.507736, 0, 1, 0.07058824, 1,
-0.4020611, -0.6385516, -2.705418, 0, 1, 0.07450981, 1,
-0.3962649, -0.05178904, -2.472464, 0, 1, 0.08235294, 1,
-0.3955697, -0.5027978, -1.792002, 0, 1, 0.08627451, 1,
-0.3937087, -0.485107, -3.921189, 0, 1, 0.09411765, 1,
-0.389944, 1.524606, 1.147547, 0, 1, 0.1019608, 1,
-0.3840741, -1.756601, -0.4866413, 0, 1, 0.1058824, 1,
-0.3838136, 1.610016, -1.328102, 0, 1, 0.1137255, 1,
-0.3814994, 0.7552046, -0.9684631, 0, 1, 0.1176471, 1,
-0.3809887, 0.6755583, -0.6567743, 0, 1, 0.1254902, 1,
-0.3775894, -1.316456, -4.688459, 0, 1, 0.1294118, 1,
-0.37476, 1.33384, -0.4700726, 0, 1, 0.1372549, 1,
-0.3718106, 0.1622092, -0.06547598, 0, 1, 0.1411765, 1,
-0.3705221, -1.081401, -2.805516, 0, 1, 0.1490196, 1,
-0.3687045, 0.4276586, -0.1415833, 0, 1, 0.1529412, 1,
-0.3670629, 0.4990624, -1.694484, 0, 1, 0.1607843, 1,
-0.364937, 0.0993598, -0.7223089, 0, 1, 0.1647059, 1,
-0.363533, -0.2376859, -2.600922, 0, 1, 0.172549, 1,
-0.3601305, 2.551676, 1.02961, 0, 1, 0.1764706, 1,
-0.3580153, -0.6269595, -1.740724, 0, 1, 0.1843137, 1,
-0.3555667, -0.2304319, -0.9209054, 0, 1, 0.1882353, 1,
-0.3505249, -0.7852363, 0.5056872, 0, 1, 0.1960784, 1,
-0.3492752, -0.9672717, -2.712698, 0, 1, 0.2039216, 1,
-0.343164, -0.05352854, -2.120096, 0, 1, 0.2078431, 1,
-0.3394049, -1.033546, -1.361972, 0, 1, 0.2156863, 1,
-0.3382136, -0.01102493, -2.253869, 0, 1, 0.2196078, 1,
-0.3371539, -1.09661, -3.198562, 0, 1, 0.227451, 1,
-0.3318824, 1.020851, 0.6972868, 0, 1, 0.2313726, 1,
-0.3318424, 1.492558, -0.9023031, 0, 1, 0.2392157, 1,
-0.3296546, 0.3857745, 2.180433, 0, 1, 0.2431373, 1,
-0.3271235, -0.5841662, -2.004716, 0, 1, 0.2509804, 1,
-0.3271192, -0.6052423, -3.383308, 0, 1, 0.254902, 1,
-0.325904, 0.4374103, -0.6320997, 0, 1, 0.2627451, 1,
-0.3244969, 0.9439451, -1.429961, 0, 1, 0.2666667, 1,
-0.3202486, -0.4308512, -2.681485, 0, 1, 0.2745098, 1,
-0.3197603, -1.445622, -3.062157, 0, 1, 0.2784314, 1,
-0.3190803, -0.388803, -2.735753, 0, 1, 0.2862745, 1,
-0.313967, 0.6927603, -0.8615482, 0, 1, 0.2901961, 1,
-0.3130814, -0.9524366, -3.720638, 0, 1, 0.2980392, 1,
-0.3113581, -0.7243992, -1.896172, 0, 1, 0.3058824, 1,
-0.3099985, -0.3438235, -1.229998, 0, 1, 0.3098039, 1,
-0.3020679, 0.6024585, -0.02910859, 0, 1, 0.3176471, 1,
-0.2995304, -0.4524322, -1.927692, 0, 1, 0.3215686, 1,
-0.2988631, -0.880928, -2.439114, 0, 1, 0.3294118, 1,
-0.2961526, -0.07610203, -1.072105, 0, 1, 0.3333333, 1,
-0.2946699, -0.7575055, -4.521135, 0, 1, 0.3411765, 1,
-0.294462, 0.7923346, -0.2268061, 0, 1, 0.345098, 1,
-0.2850936, -1.072999, -5.204005, 0, 1, 0.3529412, 1,
-0.2821603, 0.2634431, -0.9943299, 0, 1, 0.3568628, 1,
-0.2791421, -0.09373578, -0.9510021, 0, 1, 0.3647059, 1,
-0.2771779, -0.7728525, -3.195739, 0, 1, 0.3686275, 1,
-0.27598, 0.6593938, -1.548668, 0, 1, 0.3764706, 1,
-0.2747121, 0.9240072, 0.5813535, 0, 1, 0.3803922, 1,
-0.2727622, -0.3474542, -3.206822, 0, 1, 0.3882353, 1,
-0.2692897, 0.1600271, -1.203008, 0, 1, 0.3921569, 1,
-0.2679725, -0.7906905, -1.992698, 0, 1, 0.4, 1,
-0.2586799, -1.351581, -3.616545, 0, 1, 0.4078431, 1,
-0.2556142, -0.07490686, -1.562059, 0, 1, 0.4117647, 1,
-0.251344, -1.172135, -3.412829, 0, 1, 0.4196078, 1,
-0.246831, -0.1078687, -2.190439, 0, 1, 0.4235294, 1,
-0.2462208, -0.2353494, -1.969751, 0, 1, 0.4313726, 1,
-0.2420482, 0.3486425, -0.6679134, 0, 1, 0.4352941, 1,
-0.2395487, -0.4112949, -3.527362, 0, 1, 0.4431373, 1,
-0.2375265, -0.2211734, -1.267176, 0, 1, 0.4470588, 1,
-0.233056, -0.4670297, -2.735908, 0, 1, 0.454902, 1,
-0.231589, 0.9862401, 0.7679766, 0, 1, 0.4588235, 1,
-0.225553, -1.911702, -1.440918, 0, 1, 0.4666667, 1,
-0.2246909, 1.04232, 0.04015676, 0, 1, 0.4705882, 1,
-0.2240372, 0.131415, -0.3137612, 0, 1, 0.4784314, 1,
-0.2149168, 0.8440137, -2.338115, 0, 1, 0.4823529, 1,
-0.207083, -0.6907438, -1.615754, 0, 1, 0.4901961, 1,
-0.2035997, 0.3864428, -0.1784426, 0, 1, 0.4941176, 1,
-0.2012724, 1.152395, 0.355973, 0, 1, 0.5019608, 1,
-0.1998881, -0.7872974, -2.667453, 0, 1, 0.509804, 1,
-0.1984552, 1.280676, -0.1096253, 0, 1, 0.5137255, 1,
-0.1949683, -0.003301761, -2.589454, 0, 1, 0.5215687, 1,
-0.1946102, 0.4475837, -0.7447402, 0, 1, 0.5254902, 1,
-0.1933437, 1.073141, -0.3074487, 0, 1, 0.5333334, 1,
-0.1882216, -0.15693, -0.5692387, 0, 1, 0.5372549, 1,
-0.1835236, 1.283805, -1.163896, 0, 1, 0.5450981, 1,
-0.1826753, -1.186162, -2.080741, 0, 1, 0.5490196, 1,
-0.1782873, 1.238348, -0.5007411, 0, 1, 0.5568628, 1,
-0.173388, 1.327536, 0.366005, 0, 1, 0.5607843, 1,
-0.1730412, 0.6201358, 0.7986267, 0, 1, 0.5686275, 1,
-0.1721157, -0.6091878, -1.975845, 0, 1, 0.572549, 1,
-0.1710177, -0.2792501, -2.54448, 0, 1, 0.5803922, 1,
-0.1673669, 0.9154466, -0.8520218, 0, 1, 0.5843138, 1,
-0.1646428, -0.4779085, -1.760457, 0, 1, 0.5921569, 1,
-0.1636383, -0.1987852, -0.5152463, 0, 1, 0.5960785, 1,
-0.1585982, 1.710191, 2.156301, 0, 1, 0.6039216, 1,
-0.1585428, -0.1481062, -3.553825, 0, 1, 0.6117647, 1,
-0.1581042, 0.2473831, -1.759944, 0, 1, 0.6156863, 1,
-0.1579506, 0.287961, -0.5893393, 0, 1, 0.6235294, 1,
-0.1577209, 0.08264628, -0.7223315, 0, 1, 0.627451, 1,
-0.1463537, -0.3003837, -2.570458, 0, 1, 0.6352941, 1,
-0.1393951, -0.6652915, -2.946007, 0, 1, 0.6392157, 1,
-0.1384731, 0.6347545, 0.2206729, 0, 1, 0.6470588, 1,
-0.1381599, -0.6716894, -3.300627, 0, 1, 0.6509804, 1,
-0.1346926, 2.234473, -0.7324396, 0, 1, 0.6588235, 1,
-0.1335817, -0.4130558, -3.046952, 0, 1, 0.6627451, 1,
-0.1282657, -0.6173272, -1.982588, 0, 1, 0.6705883, 1,
-0.1134856, 1.990355, -0.1408688, 0, 1, 0.6745098, 1,
-0.1128086, -1.458135, -3.065194, 0, 1, 0.682353, 1,
-0.1105106, 1.406049, -0.04350221, 0, 1, 0.6862745, 1,
-0.1096229, 0.0440135, -0.9038959, 0, 1, 0.6941177, 1,
-0.1041341, 0.8608294, -1.358231, 0, 1, 0.7019608, 1,
-0.0906482, -1.521326, -3.585867, 0, 1, 0.7058824, 1,
-0.0902292, -0.4951653, -2.272359, 0, 1, 0.7137255, 1,
-0.08618151, -0.1181967, -1.589831, 0, 1, 0.7176471, 1,
-0.08326464, 1.955295, -1.009835, 0, 1, 0.7254902, 1,
-0.07777315, 0.605388, -0.5238088, 0, 1, 0.7294118, 1,
-0.0761729, 0.878256, -2.0515, 0, 1, 0.7372549, 1,
-0.07568302, -0.4728001, -3.369286, 0, 1, 0.7411765, 1,
-0.06691454, 0.1713001, -0.58399, 0, 1, 0.7490196, 1,
-0.06469223, 0.3608594, 0.9997415, 0, 1, 0.7529412, 1,
-0.06223255, -0.05937554, -2.07118, 0, 1, 0.7607843, 1,
-0.06205096, 0.1644438, 0.6823547, 0, 1, 0.7647059, 1,
-0.05796114, 0.9131102, 0.5228983, 0, 1, 0.772549, 1,
-0.05379681, 1.600398, 0.6042379, 0, 1, 0.7764706, 1,
-0.05376233, -0.4336363, -2.763155, 0, 1, 0.7843137, 1,
-0.0532347, -1.001165, -0.5967303, 0, 1, 0.7882353, 1,
-0.05267485, -1.144133, -3.645177, 0, 1, 0.7960784, 1,
-0.04599546, -1.604851, -3.699514, 0, 1, 0.8039216, 1,
-0.04377672, -0.3193146, -3.76236, 0, 1, 0.8078431, 1,
-0.04307696, -0.5969365, -2.873391, 0, 1, 0.8156863, 1,
-0.04286853, 0.5093201, -0.4879601, 0, 1, 0.8196079, 1,
-0.04136762, -0.4195642, -3.15553, 0, 1, 0.827451, 1,
-0.03960085, -1.072554, -3.571026, 0, 1, 0.8313726, 1,
-0.03610939, -1.031227, -5.050837, 0, 1, 0.8392157, 1,
-0.03523099, -1.304803, -2.783593, 0, 1, 0.8431373, 1,
-0.03336025, 1.082448, 1.951972, 0, 1, 0.8509804, 1,
-0.03220721, -0.7207812, -2.95509, 0, 1, 0.854902, 1,
-0.02217391, 1.799811, 1.174115, 0, 1, 0.8627451, 1,
-0.02214656, 1.332023, 0.6932607, 0, 1, 0.8666667, 1,
-0.01777443, -0.04037997, -3.066095, 0, 1, 0.8745098, 1,
-0.01517055, 1.301662, -0.9098658, 0, 1, 0.8784314, 1,
-0.01108634, 0.2148647, 0.9386541, 0, 1, 0.8862745, 1,
-0.009997952, -0.09934113, -2.487256, 0, 1, 0.8901961, 1,
-0.00796231, -0.4195388, -3.834593, 0, 1, 0.8980392, 1,
0.007415205, -0.5752664, 3.148554, 0, 1, 0.9058824, 1,
0.008693558, 1.211368, -1.147075, 0, 1, 0.9098039, 1,
0.009166419, -1.146654, 2.910912, 0, 1, 0.9176471, 1,
0.01511888, 0.6154419, -0.3692751, 0, 1, 0.9215686, 1,
0.01561816, 0.4227225, 1.970869, 0, 1, 0.9294118, 1,
0.01883872, -2.017093, 4.943971, 0, 1, 0.9333333, 1,
0.02360608, -0.3311148, 3.854486, 0, 1, 0.9411765, 1,
0.02848295, 1.332227, -1.820595, 0, 1, 0.945098, 1,
0.03018353, -0.2295028, 2.570363, 0, 1, 0.9529412, 1,
0.03101963, -0.9046017, 3.813373, 0, 1, 0.9568627, 1,
0.03132187, 1.516573, 0.6236348, 0, 1, 0.9647059, 1,
0.03435499, -0.6520007, 1.345046, 0, 1, 0.9686275, 1,
0.03539512, 0.9986412, -1.674289, 0, 1, 0.9764706, 1,
0.0358422, -1.691177, 1.537813, 0, 1, 0.9803922, 1,
0.03730051, 1.576706, -0.821313, 0, 1, 0.9882353, 1,
0.03807118, 0.08592083, -0.5210032, 0, 1, 0.9921569, 1,
0.0384719, -0.6041872, 4.104644, 0, 1, 1, 1,
0.03878178, -0.09790921, 2.451838, 0, 0.9921569, 1, 1,
0.03938461, 0.3193485, 0.4209009, 0, 0.9882353, 1, 1,
0.04051664, 1.537314, -0.8367326, 0, 0.9803922, 1, 1,
0.04360081, -1.461607, 2.479236, 0, 0.9764706, 1, 1,
0.04520767, -0.6623594, 3.062359, 0, 0.9686275, 1, 1,
0.04521866, 1.276967, -0.7623594, 0, 0.9647059, 1, 1,
0.04552248, 0.0958797, 0.08471776, 0, 0.9568627, 1, 1,
0.04691431, -1.998317, 2.995429, 0, 0.9529412, 1, 1,
0.04702845, 1.385723, 0.574244, 0, 0.945098, 1, 1,
0.04882238, -0.371669, 3.467946, 0, 0.9411765, 1, 1,
0.05030481, -0.3170342, 3.385481, 0, 0.9333333, 1, 1,
0.05614722, -0.16253, 2.41352, 0, 0.9294118, 1, 1,
0.05685044, -0.437183, 5.025904, 0, 0.9215686, 1, 1,
0.06602414, -1.511492, 2.788859, 0, 0.9176471, 1, 1,
0.0666978, 2.081944, -0.475003, 0, 0.9098039, 1, 1,
0.06777634, 0.7678374, 2.193057, 0, 0.9058824, 1, 1,
0.06852444, 0.6118408, -0.3264482, 0, 0.8980392, 1, 1,
0.06947831, 1.035517, 1.81258, 0, 0.8901961, 1, 1,
0.07426719, -0.2682395, 3.235158, 0, 0.8862745, 1, 1,
0.08051731, -0.6324212, 2.955823, 0, 0.8784314, 1, 1,
0.08989271, 0.3370131, 0.005329788, 0, 0.8745098, 1, 1,
0.09464332, -1.216691, 4.266121, 0, 0.8666667, 1, 1,
0.1006614, -0.06959771, 2.498311, 0, 0.8627451, 1, 1,
0.1046319, -0.2416718, 2.76113, 0, 0.854902, 1, 1,
0.1057182, 1.889762, 2.145572, 0, 0.8509804, 1, 1,
0.1082413, -0.631687, 2.337309, 0, 0.8431373, 1, 1,
0.1086584, 0.9357317, 0.8827125, 0, 0.8392157, 1, 1,
0.1121916, 0.01172208, 4.257936, 0, 0.8313726, 1, 1,
0.1130085, 0.9244764, -1.477034, 0, 0.827451, 1, 1,
0.1146905, 1.840437, -1.620841, 0, 0.8196079, 1, 1,
0.1150752, 1.631526, 0.100654, 0, 0.8156863, 1, 1,
0.1186075, 0.7426425, 1.609172, 0, 0.8078431, 1, 1,
0.1223052, -0.397795, 1.955531, 0, 0.8039216, 1, 1,
0.1267185, 0.4977574, -1.536383, 0, 0.7960784, 1, 1,
0.128431, -1.186475, 2.450912, 0, 0.7882353, 1, 1,
0.1287613, -0.7251879, 4.550948, 0, 0.7843137, 1, 1,
0.1331647, -0.7594311, 3.930364, 0, 0.7764706, 1, 1,
0.1347849, 0.05333916, 0.9759203, 0, 0.772549, 1, 1,
0.1350722, -0.8631907, 4.558458, 0, 0.7647059, 1, 1,
0.1373347, -1.74464, 2.648819, 0, 0.7607843, 1, 1,
0.1467508, -0.03754099, -0.7368997, 0, 0.7529412, 1, 1,
0.1468062, -1.361857, 2.465503, 0, 0.7490196, 1, 1,
0.1488345, -2.246124, 2.435642, 0, 0.7411765, 1, 1,
0.1529102, 1.623091, 0.1831522, 0, 0.7372549, 1, 1,
0.1545131, -0.1985618, 3.237221, 0, 0.7294118, 1, 1,
0.1580714, 1.226765, 1.523203, 0, 0.7254902, 1, 1,
0.1581128, 0.8523291, -0.5394934, 0, 0.7176471, 1, 1,
0.1588702, -1.19245, 3.244733, 0, 0.7137255, 1, 1,
0.1591046, -0.6367397, 3.672591, 0, 0.7058824, 1, 1,
0.1611687, 0.6080747, 2.255502, 0, 0.6980392, 1, 1,
0.1651505, -0.862985, 3.205883, 0, 0.6941177, 1, 1,
0.1666209, -2.240467, 3.948852, 0, 0.6862745, 1, 1,
0.1694115, 1.904079, 0.390303, 0, 0.682353, 1, 1,
0.1706063, 0.8386267, 1.995326, 0, 0.6745098, 1, 1,
0.1808502, -0.1671356, 2.611015, 0, 0.6705883, 1, 1,
0.1811302, 0.5846376, 0.4106787, 0, 0.6627451, 1, 1,
0.1843771, 1.942929, -0.9290029, 0, 0.6588235, 1, 1,
0.1855733, 0.9747399, -0.09623224, 0, 0.6509804, 1, 1,
0.1863433, -0.7764793, 2.425849, 0, 0.6470588, 1, 1,
0.1873563, -1.426799, 3.83465, 0, 0.6392157, 1, 1,
0.1944563, -1.528212, 3.730363, 0, 0.6352941, 1, 1,
0.1968525, -0.2066088, 2.572105, 0, 0.627451, 1, 1,
0.1972656, 1.155917, 1.020805, 0, 0.6235294, 1, 1,
0.1989241, 1.518436, 0.04535361, 0, 0.6156863, 1, 1,
0.2015041, 1.021618, 1.025276, 0, 0.6117647, 1, 1,
0.2083483, 1.013912, 0.3187413, 0, 0.6039216, 1, 1,
0.208594, -0.3350545, 4.008592, 0, 0.5960785, 1, 1,
0.2101789, 0.4548991, 0.697119, 0, 0.5921569, 1, 1,
0.2113451, 0.5145667, 0.246848, 0, 0.5843138, 1, 1,
0.2177985, 0.4187154, 2.218607, 0, 0.5803922, 1, 1,
0.2204362, 0.07696772, 1.852328, 0, 0.572549, 1, 1,
0.2243468, 0.2757609, 1.396828, 0, 0.5686275, 1, 1,
0.2243653, -0.2739275, 1.747123, 0, 0.5607843, 1, 1,
0.2313101, -0.6930456, 4.313893, 0, 0.5568628, 1, 1,
0.2355508, -0.9046921, 3.121341, 0, 0.5490196, 1, 1,
0.2372338, 0.6605512, -0.2733575, 0, 0.5450981, 1, 1,
0.2384694, 0.2223302, 0.9957299, 0, 0.5372549, 1, 1,
0.2413026, -0.7050232, 3.268266, 0, 0.5333334, 1, 1,
0.2432313, -0.6341239, 3.118029, 0, 0.5254902, 1, 1,
0.2433686, 0.3839495, 0.7976443, 0, 0.5215687, 1, 1,
0.2443943, 0.1807114, 2.000126, 0, 0.5137255, 1, 1,
0.2455639, -1.594987, 3.352501, 0, 0.509804, 1, 1,
0.2536955, 1.786659, 1.698827, 0, 0.5019608, 1, 1,
0.2539017, 0.3479802, 1.516477, 0, 0.4941176, 1, 1,
0.2561658, 0.5302997, 1.706905, 0, 0.4901961, 1, 1,
0.2564391, -1.0829, 2.388875, 0, 0.4823529, 1, 1,
0.2576648, 1.21279, -0.436269, 0, 0.4784314, 1, 1,
0.2594502, 0.5192168, 1.070492, 0, 0.4705882, 1, 1,
0.2602201, 0.3187994, 0.9838021, 0, 0.4666667, 1, 1,
0.261568, -1.592466, 2.058836, 0, 0.4588235, 1, 1,
0.2640724, -0.4628814, 2.128526, 0, 0.454902, 1, 1,
0.2697252, -0.08900729, 3.439235, 0, 0.4470588, 1, 1,
0.2726324, 0.9665974, 1.033071, 0, 0.4431373, 1, 1,
0.2751297, 0.4068826, -0.5904124, 0, 0.4352941, 1, 1,
0.2799701, 0.5790931, 1.139332, 0, 0.4313726, 1, 1,
0.2835512, 2.717011, -1.909182, 0, 0.4235294, 1, 1,
0.2865111, -0.5491801, 3.285459, 0, 0.4196078, 1, 1,
0.2990819, 0.05267318, 1.464219, 0, 0.4117647, 1, 1,
0.3017187, 0.03234049, 1.918781, 0, 0.4078431, 1, 1,
0.3034672, -0.4159443, 1.816137, 0, 0.4, 1, 1,
0.30393, -0.06751271, 1.319273, 0, 0.3921569, 1, 1,
0.3041412, -0.3253444, 3.286859, 0, 0.3882353, 1, 1,
0.3123866, -1.260673, 2.708988, 0, 0.3803922, 1, 1,
0.3180536, -0.2698502, 4.048787, 0, 0.3764706, 1, 1,
0.3181958, 1.527024, 1.995247, 0, 0.3686275, 1, 1,
0.3187657, 0.8414726, -0.7242854, 0, 0.3647059, 1, 1,
0.318817, -0.2759289, 0.8781415, 0, 0.3568628, 1, 1,
0.3220979, 0.3170106, -0.5679682, 0, 0.3529412, 1, 1,
0.3224003, -1.964747, 0.1707724, 0, 0.345098, 1, 1,
0.3280794, 0.02730276, 0.4816948, 0, 0.3411765, 1, 1,
0.3284538, -1.746739, 3.928388, 0, 0.3333333, 1, 1,
0.3292656, -1.023899, 2.32896, 0, 0.3294118, 1, 1,
0.3307289, -0.4813771, 1.501781, 0, 0.3215686, 1, 1,
0.3327923, 1.219839, 0.7398374, 0, 0.3176471, 1, 1,
0.3328661, 0.1279633, 1.812667, 0, 0.3098039, 1, 1,
0.3351532, -0.4714952, 2.426531, 0, 0.3058824, 1, 1,
0.3373434, 0.340483, 2.016773, 0, 0.2980392, 1, 1,
0.3471196, -1.435433, 2.928194, 0, 0.2901961, 1, 1,
0.3471643, 0.3484095, 3.23391, 0, 0.2862745, 1, 1,
0.3486089, 0.5144126, -0.9738374, 0, 0.2784314, 1, 1,
0.3526521, -0.4832936, 2.924245, 0, 0.2745098, 1, 1,
0.353985, 2.618988, -0.5458376, 0, 0.2666667, 1, 1,
0.3551958, 1.067379, 0.5649989, 0, 0.2627451, 1, 1,
0.3563851, 0.09465915, 2.346129, 0, 0.254902, 1, 1,
0.3570666, 0.6269937, 1.583824, 0, 0.2509804, 1, 1,
0.3581731, -0.4254786, 2.942179, 0, 0.2431373, 1, 1,
0.35928, -1.140119, 4.032779, 0, 0.2392157, 1, 1,
0.3606106, 0.1497172, 0.7660497, 0, 0.2313726, 1, 1,
0.3631238, -0.9354326, 1.879815, 0, 0.227451, 1, 1,
0.3633574, 0.4879076, 0.1474667, 0, 0.2196078, 1, 1,
0.3673294, -0.5301114, 3.187759, 0, 0.2156863, 1, 1,
0.368524, -0.5096226, 2.452741, 0, 0.2078431, 1, 1,
0.3718478, -0.583068, 0.9639881, 0, 0.2039216, 1, 1,
0.3768999, 0.4207901, -0.9199199, 0, 0.1960784, 1, 1,
0.3815896, 0.08002925, 1.143174, 0, 0.1882353, 1, 1,
0.3818865, -0.8204826, 2.133864, 0, 0.1843137, 1, 1,
0.3818919, 0.7233105, -0.9816395, 0, 0.1764706, 1, 1,
0.3833033, 0.3114112, 1.104717, 0, 0.172549, 1, 1,
0.3838233, -0.2860475, 2.630918, 0, 0.1647059, 1, 1,
0.3852013, 1.692017, 1.032317, 0, 0.1607843, 1, 1,
0.3901724, 1.158754, 0.8919912, 0, 0.1529412, 1, 1,
0.3922053, -0.7150112, 1.665602, 0, 0.1490196, 1, 1,
0.399206, 1.038102, 0.7317017, 0, 0.1411765, 1, 1,
0.4026688, -1.280631, 3.3746, 0, 0.1372549, 1, 1,
0.4033547, -2.173193, 1.111831, 0, 0.1294118, 1, 1,
0.4035923, -1.217143, 4.139318, 0, 0.1254902, 1, 1,
0.4053468, -1.864627, 3.915295, 0, 0.1176471, 1, 1,
0.4130243, -1.078107, 2.420694, 0, 0.1137255, 1, 1,
0.4134631, -0.9890594, 3.655687, 0, 0.1058824, 1, 1,
0.4165281, 0.1517041, 2.371798, 0, 0.09803922, 1, 1,
0.4307686, -0.8393843, 3.154377, 0, 0.09411765, 1, 1,
0.4334211, -1.415125, 4.992795, 0, 0.08627451, 1, 1,
0.4410988, 0.879698, 0.1080289, 0, 0.08235294, 1, 1,
0.4417119, 0.2523867, 1.898071, 0, 0.07450981, 1, 1,
0.4427014, -2.03488, 2.538581, 0, 0.07058824, 1, 1,
0.4440381, 0.1067705, 0.9626359, 0, 0.0627451, 1, 1,
0.4444816, 0.4232168, 0.5996644, 0, 0.05882353, 1, 1,
0.4458865, -1.205662, 2.314299, 0, 0.05098039, 1, 1,
0.4534456, 1.730406, 0.4721819, 0, 0.04705882, 1, 1,
0.4545018, 0.1421458, 1.94076, 0, 0.03921569, 1, 1,
0.4556923, -0.3311311, 2.156793, 0, 0.03529412, 1, 1,
0.4876311, 0.6772846, 2.656252, 0, 0.02745098, 1, 1,
0.4895973, -0.0782738, 0.03794305, 0, 0.02352941, 1, 1,
0.4971096, -0.7614222, 2.886643, 0, 0.01568628, 1, 1,
0.4994519, -0.1458606, 1.485888, 0, 0.01176471, 1, 1,
0.5061267, -0.5861759, 2.012954, 0, 0.003921569, 1, 1,
0.5067201, -0.5436434, 0.879829, 0.003921569, 0, 1, 1,
0.5093914, -0.9761646, 3.431786, 0.007843138, 0, 1, 1,
0.5124326, 0.7284014, 0.04226015, 0.01568628, 0, 1, 1,
0.5129691, 1.02769, 0.4968117, 0.01960784, 0, 1, 1,
0.5149494, 0.370227, 1.231324, 0.02745098, 0, 1, 1,
0.5187656, -0.9410118, 4.331463, 0.03137255, 0, 1, 1,
0.5210616, -0.927788, 2.461886, 0.03921569, 0, 1, 1,
0.5235218, -1.312713, 0.01214278, 0.04313726, 0, 1, 1,
0.5278303, -0.3494458, 3.580365, 0.05098039, 0, 1, 1,
0.5294582, 0.3283778, 0.4666426, 0.05490196, 0, 1, 1,
0.5319376, 0.6772072, 0.9954304, 0.0627451, 0, 1, 1,
0.532711, 0.3723532, 1.73282, 0.06666667, 0, 1, 1,
0.5345971, 1.849421, 2.15657, 0.07450981, 0, 1, 1,
0.5356267, 2.409579, -2.32134, 0.07843138, 0, 1, 1,
0.5396146, -0.5881309, 2.110028, 0.08627451, 0, 1, 1,
0.540324, 2.035653, 1.256531, 0.09019608, 0, 1, 1,
0.5413275, -0.2155836, 1.57012, 0.09803922, 0, 1, 1,
0.5416126, 0.27982, 1.651427, 0.1058824, 0, 1, 1,
0.5421948, 1.369904, -0.7273632, 0.1098039, 0, 1, 1,
0.5427249, 0.8737099, -0.8454865, 0.1176471, 0, 1, 1,
0.5431515, -0.2528805, 2.735293, 0.1215686, 0, 1, 1,
0.5482502, -0.9066513, 2.298495, 0.1294118, 0, 1, 1,
0.5504811, 1.515859, 0.366781, 0.1333333, 0, 1, 1,
0.5527123, -0.1511527, 1.767205, 0.1411765, 0, 1, 1,
0.5566082, -0.8260781, 1.585688, 0.145098, 0, 1, 1,
0.5654421, -0.1391982, 2.148392, 0.1529412, 0, 1, 1,
0.5658556, -1.617496, 2.760273, 0.1568628, 0, 1, 1,
0.5660987, 0.4290753, 1.507079, 0.1647059, 0, 1, 1,
0.5756444, 0.9481728, 1.088546, 0.1686275, 0, 1, 1,
0.58153, -0.3743196, 0.7829104, 0.1764706, 0, 1, 1,
0.5821677, 0.04994067, 0.9920769, 0.1803922, 0, 1, 1,
0.5826572, 1.951329, -0.4158073, 0.1882353, 0, 1, 1,
0.5829462, 0.195731, 2.520807, 0.1921569, 0, 1, 1,
0.5871743, -1.450515, 2.982026, 0.2, 0, 1, 1,
0.5902383, 0.734534, 1.49044, 0.2078431, 0, 1, 1,
0.5907606, 0.3222605, -0.1921331, 0.2117647, 0, 1, 1,
0.6038094, -2.099559, 3.583642, 0.2196078, 0, 1, 1,
0.6044059, -1.467822, 2.236865, 0.2235294, 0, 1, 1,
0.6050689, -0.6055183, 1.720322, 0.2313726, 0, 1, 1,
0.6095391, -0.07852243, 1.921081, 0.2352941, 0, 1, 1,
0.6125461, -0.3182496, 1.172007, 0.2431373, 0, 1, 1,
0.6129301, 0.09424259, 2.61983, 0.2470588, 0, 1, 1,
0.6135607, 1.171924, 2.053362, 0.254902, 0, 1, 1,
0.6155954, -1.066072, 3.456428, 0.2588235, 0, 1, 1,
0.6179663, -0.2495206, 2.109689, 0.2666667, 0, 1, 1,
0.6227893, -1.82121, 2.622424, 0.2705882, 0, 1, 1,
0.6299281, -0.5271121, 0.8714818, 0.2784314, 0, 1, 1,
0.6344426, -0.02590585, 2.595991, 0.282353, 0, 1, 1,
0.6378911, 0.8104877, 1.682552, 0.2901961, 0, 1, 1,
0.6405109, -0.4217895, 2.784336, 0.2941177, 0, 1, 1,
0.6405674, 0.2693961, -0.04988331, 0.3019608, 0, 1, 1,
0.6417262, -0.222336, 2.522058, 0.3098039, 0, 1, 1,
0.6501315, -1.595739, 3.67135, 0.3137255, 0, 1, 1,
0.6516573, -0.1179679, 2.486995, 0.3215686, 0, 1, 1,
0.6544773, -2.919523, 2.568252, 0.3254902, 0, 1, 1,
0.6552649, 1.31786, 2.406607, 0.3333333, 0, 1, 1,
0.6593498, -0.3738615, 3.422631, 0.3372549, 0, 1, 1,
0.6607163, 0.4116167, 0.2642077, 0.345098, 0, 1, 1,
0.6610464, -0.4398476, 2.211398, 0.3490196, 0, 1, 1,
0.6617124, -0.2117191, 1.28852, 0.3568628, 0, 1, 1,
0.664063, -1.464503, 2.621565, 0.3607843, 0, 1, 1,
0.6644991, -0.7593198, 1.766693, 0.3686275, 0, 1, 1,
0.6646197, 0.4333115, 0.9172603, 0.372549, 0, 1, 1,
0.6706537, 0.00353061, 1.717135, 0.3803922, 0, 1, 1,
0.6729489, 1.44706, 0.6652293, 0.3843137, 0, 1, 1,
0.6730015, 0.5187104, 1.630433, 0.3921569, 0, 1, 1,
0.6730532, -1.521051, 2.845861, 0.3960784, 0, 1, 1,
0.6749094, -0.1270294, 0.06527518, 0.4039216, 0, 1, 1,
0.680849, 0.7809091, 1.295134, 0.4117647, 0, 1, 1,
0.6823624, 0.385151, -0.01539385, 0.4156863, 0, 1, 1,
0.6865094, -0.5475778, 1.380246, 0.4235294, 0, 1, 1,
0.688177, 0.9252059, 2.880049, 0.427451, 0, 1, 1,
0.6894891, -0.4033926, 2.10356, 0.4352941, 0, 1, 1,
0.6909453, -1.392342, 3.657069, 0.4392157, 0, 1, 1,
0.6928113, -0.4452349, 1.24889, 0.4470588, 0, 1, 1,
0.6949918, -0.6064042, 2.263844, 0.4509804, 0, 1, 1,
0.6967479, -0.9173405, 3.068544, 0.4588235, 0, 1, 1,
0.6992305, 1.272317, -0.7473642, 0.4627451, 0, 1, 1,
0.7056022, 0.3168718, 0.692056, 0.4705882, 0, 1, 1,
0.7059382, -0.2884854, 1.964482, 0.4745098, 0, 1, 1,
0.7089959, -0.3262907, 1.454498, 0.4823529, 0, 1, 1,
0.7113285, 0.04879502, 0.944807, 0.4862745, 0, 1, 1,
0.7123362, 0.1320339, 2.386673, 0.4941176, 0, 1, 1,
0.7176476, -1.021295, 1.642547, 0.5019608, 0, 1, 1,
0.7194917, -0.7136808, 3.852101, 0.5058824, 0, 1, 1,
0.7209283, -0.5915537, 0.03279539, 0.5137255, 0, 1, 1,
0.7216765, -1.054947, 3.075517, 0.5176471, 0, 1, 1,
0.7240036, 1.226073, 1.354693, 0.5254902, 0, 1, 1,
0.7428013, 1.64191, -0.4761319, 0.5294118, 0, 1, 1,
0.7455238, -0.08583686, 2.599431, 0.5372549, 0, 1, 1,
0.7487005, -0.655381, 5.031341, 0.5411765, 0, 1, 1,
0.7527275, 0.708203, -2.214603, 0.5490196, 0, 1, 1,
0.7548487, 0.4256937, 1.188839, 0.5529412, 0, 1, 1,
0.7551152, -1.537666, 1.717798, 0.5607843, 0, 1, 1,
0.755845, 0.3374959, 1.638652, 0.5647059, 0, 1, 1,
0.7570564, 0.8018315, -0.04199493, 0.572549, 0, 1, 1,
0.7576243, -0.04572553, 1.78419, 0.5764706, 0, 1, 1,
0.7634273, 0.2947147, -0.6475686, 0.5843138, 0, 1, 1,
0.7647637, -0.5957904, 1.019657, 0.5882353, 0, 1, 1,
0.7672033, 1.135226, -0.8168206, 0.5960785, 0, 1, 1,
0.7731404, 0.938583, 0.1145511, 0.6039216, 0, 1, 1,
0.7798052, -0.3077636, 0.7812025, 0.6078432, 0, 1, 1,
0.7843606, -1.399205, 1.859693, 0.6156863, 0, 1, 1,
0.7847064, 0.3068802, 0.7377316, 0.6196079, 0, 1, 1,
0.7949691, -0.449068, 3.216497, 0.627451, 0, 1, 1,
0.8012863, 0.9928607, -0.9512822, 0.6313726, 0, 1, 1,
0.8042451, 0.269829, 1.339496, 0.6392157, 0, 1, 1,
0.8085729, 2.124966, -0.5551528, 0.6431373, 0, 1, 1,
0.8139513, 1.074615, 1.649857, 0.6509804, 0, 1, 1,
0.8188965, 0.8511726, 0.4652239, 0.654902, 0, 1, 1,
0.8198333, 0.7181756, 2.214111, 0.6627451, 0, 1, 1,
0.8208187, -0.550238, 3.327676, 0.6666667, 0, 1, 1,
0.8266354, 0.4037242, 1.559998, 0.6745098, 0, 1, 1,
0.830264, -0.8843611, 3.229351, 0.6784314, 0, 1, 1,
0.8306631, 0.6658219, 1.494607, 0.6862745, 0, 1, 1,
0.8319323, 0.2213487, -0.4550047, 0.6901961, 0, 1, 1,
0.8323514, 2.582957, 1.429181, 0.6980392, 0, 1, 1,
0.8344399, 0.7283415, 0.4075405, 0.7058824, 0, 1, 1,
0.846449, 1.140991, -1.011676, 0.7098039, 0, 1, 1,
0.8524476, -0.3480836, 1.406894, 0.7176471, 0, 1, 1,
0.8567713, -1.04651, 3.975521, 0.7215686, 0, 1, 1,
0.8611987, -0.4681202, 0.9039931, 0.7294118, 0, 1, 1,
0.8624649, -1.466203, 3.996042, 0.7333333, 0, 1, 1,
0.8666365, 0.1011354, 1.087424, 0.7411765, 0, 1, 1,
0.8667451, 0.9247631, 2.34135, 0.7450981, 0, 1, 1,
0.8680763, -0.1612673, 0.589481, 0.7529412, 0, 1, 1,
0.8683896, 1.787132, 1.240689, 0.7568628, 0, 1, 1,
0.8723497, -0.4005827, 2.208202, 0.7647059, 0, 1, 1,
0.8765528, 0.1319386, 0.8497509, 0.7686275, 0, 1, 1,
0.8777466, 1.903041, 1.290559, 0.7764706, 0, 1, 1,
0.8796567, 1.881034, 1.506101, 0.7803922, 0, 1, 1,
0.8818963, -0.9402204, 3.186144, 0.7882353, 0, 1, 1,
0.8886209, -0.7305375, -1.262378, 0.7921569, 0, 1, 1,
0.8928828, -1.150012, 0.7531394, 0.8, 0, 1, 1,
0.8958051, 1.005117, 1.642601, 0.8078431, 0, 1, 1,
0.8962903, -1.309941, 3.292582, 0.8117647, 0, 1, 1,
0.8976962, 0.4568584, 1.643191, 0.8196079, 0, 1, 1,
0.8993256, 0.01409873, 1.560945, 0.8235294, 0, 1, 1,
0.9004436, -1.517204, 3.339263, 0.8313726, 0, 1, 1,
0.9005688, 1.359845, 1.404883, 0.8352941, 0, 1, 1,
0.9043319, 0.7938135, -0.6285708, 0.8431373, 0, 1, 1,
0.9060823, 0.9793672, 0.4652906, 0.8470588, 0, 1, 1,
0.9061192, -0.5491064, 2.097834, 0.854902, 0, 1, 1,
0.9109584, -0.2995476, 1.37662, 0.8588235, 0, 1, 1,
0.913108, -0.03562949, 0.3017362, 0.8666667, 0, 1, 1,
0.9164696, -1.34311, 2.174513, 0.8705882, 0, 1, 1,
0.9299147, -1.41922, 4.264, 0.8784314, 0, 1, 1,
0.9324213, -0.9259159, 2.184529, 0.8823529, 0, 1, 1,
0.9347124, 0.0695845, 1.551016, 0.8901961, 0, 1, 1,
0.9356976, -0.7848731, 2.616772, 0.8941177, 0, 1, 1,
0.9357001, 1.08995, 0.9436651, 0.9019608, 0, 1, 1,
0.9413424, -0.1377599, 3.321287, 0.9098039, 0, 1, 1,
0.9459057, -0.2095616, 0.1447954, 0.9137255, 0, 1, 1,
0.9483359, -0.3406377, 1.725504, 0.9215686, 0, 1, 1,
0.9530811, 0.3244402, 0.4791677, 0.9254902, 0, 1, 1,
0.9635963, -1.420254, 1.980481, 0.9333333, 0, 1, 1,
0.9682234, -0.4096036, 2.796946, 0.9372549, 0, 1, 1,
0.9761722, -0.5042636, 1.449829, 0.945098, 0, 1, 1,
0.9813072, -0.1096119, 2.461501, 0.9490196, 0, 1, 1,
0.9890079, 0.1173842, -0.4003419, 0.9568627, 0, 1, 1,
0.9933866, -0.5515139, 2.309153, 0.9607843, 0, 1, 1,
1.000266, -0.2951468, 1.561635, 0.9686275, 0, 1, 1,
1.003469, -0.5819575, 2.83637, 0.972549, 0, 1, 1,
1.005837, 0.7329465, -0.1349738, 0.9803922, 0, 1, 1,
1.005865, -0.03346719, 0.8869579, 0.9843137, 0, 1, 1,
1.017771, 0.6426068, 0.8520436, 0.9921569, 0, 1, 1,
1.018538, -0.7458691, 2.300437, 0.9960784, 0, 1, 1,
1.019517, -0.8488567, 0.5571328, 1, 0, 0.9960784, 1,
1.022532, 1.866306, -0.9835556, 1, 0, 0.9882353, 1,
1.033545, -0.04349635, 0.4275684, 1, 0, 0.9843137, 1,
1.03402, -0.05918172, 1.762526, 1, 0, 0.9764706, 1,
1.038145, -0.1582253, 2.442513, 1, 0, 0.972549, 1,
1.040532, -0.3972014, 1.856627, 1, 0, 0.9647059, 1,
1.043998, 0.4719547, -0.8254219, 1, 0, 0.9607843, 1,
1.045445, -2.183079, 0.5233034, 1, 0, 0.9529412, 1,
1.054229, -1.116192, 1.994052, 1, 0, 0.9490196, 1,
1.072922, 0.09645431, 0.03973193, 1, 0, 0.9411765, 1,
1.074057, -0.5215799, 2.286562, 1, 0, 0.9372549, 1,
1.07459, -0.3628802, 0.7860103, 1, 0, 0.9294118, 1,
1.077237, -1.287028, 1.999808, 1, 0, 0.9254902, 1,
1.080079, 0.1075811, 3.085116, 1, 0, 0.9176471, 1,
1.08036, -1.03947, 3.403853, 1, 0, 0.9137255, 1,
1.08541, 0.9359775, 2.117554, 1, 0, 0.9058824, 1,
1.094258, 0.6074864, 1.646983, 1, 0, 0.9019608, 1,
1.095158, 1.176359, 0.3300525, 1, 0, 0.8941177, 1,
1.096696, 0.6619633, 1.077039, 1, 0, 0.8862745, 1,
1.104102, -1.084305, 3.399553, 1, 0, 0.8823529, 1,
1.110139, 1.554769, 0.9839994, 1, 0, 0.8745098, 1,
1.110347, 0.5790214, 1.755408, 1, 0, 0.8705882, 1,
1.113423, 0.1202224, 0.0842452, 1, 0, 0.8627451, 1,
1.11681, 0.1572659, 1.958146, 1, 0, 0.8588235, 1,
1.117264, 0.5947238, 0.9642006, 1, 0, 0.8509804, 1,
1.117794, -1.138603, 3.309047, 1, 0, 0.8470588, 1,
1.119355, -0.05673675, 3.983161, 1, 0, 0.8392157, 1,
1.128385, -0.8650294, 0.287327, 1, 0, 0.8352941, 1,
1.136033, -0.7868884, 2.61184, 1, 0, 0.827451, 1,
1.136613, 0.5160596, 0.2045146, 1, 0, 0.8235294, 1,
1.143397, -0.1658694, 2.75375, 1, 0, 0.8156863, 1,
1.158481, 0.3771385, 0.5336107, 1, 0, 0.8117647, 1,
1.162672, 0.1725184, 1.223935, 1, 0, 0.8039216, 1,
1.165822, -0.7924961, 2.592927, 1, 0, 0.7960784, 1,
1.174359, -0.6926132, 1.351777, 1, 0, 0.7921569, 1,
1.175285, 1.047387, -1.140673, 1, 0, 0.7843137, 1,
1.180969, 0.03386953, 2.765535, 1, 0, 0.7803922, 1,
1.184709, -0.05907116, 0.5523184, 1, 0, 0.772549, 1,
1.185545, -0.581713, 1.271466, 1, 0, 0.7686275, 1,
1.191923, -0.2577086, 0.7725849, 1, 0, 0.7607843, 1,
1.192217, -0.1572579, 1.977098, 1, 0, 0.7568628, 1,
1.207103, -0.2854478, 2.077714, 1, 0, 0.7490196, 1,
1.212386, -1.432368, 2.247265, 1, 0, 0.7450981, 1,
1.213363, -1.148744, 1.922823, 1, 0, 0.7372549, 1,
1.219322, -0.9342522, 2.35626, 1, 0, 0.7333333, 1,
1.222539, -1.620561, 4.097514, 1, 0, 0.7254902, 1,
1.231364, -0.111584, 2.937576, 1, 0, 0.7215686, 1,
1.231995, -1.514705, 1.776004, 1, 0, 0.7137255, 1,
1.232567, 2.509555, 1.259259, 1, 0, 0.7098039, 1,
1.233853, 1.203476, 0.273659, 1, 0, 0.7019608, 1,
1.242726, 1.301838, 2.703248, 1, 0, 0.6941177, 1,
1.245734, 1.355203, 1.215339, 1, 0, 0.6901961, 1,
1.251893, -0.6417263, 1.127531, 1, 0, 0.682353, 1,
1.258104, -0.9856057, 1.342042, 1, 0, 0.6784314, 1,
1.268235, -0.09076913, 2.563831, 1, 0, 0.6705883, 1,
1.268415, 0.8071246, 0.5006213, 1, 0, 0.6666667, 1,
1.275446, -1.458335, 3.742635, 1, 0, 0.6588235, 1,
1.280488, -0.04989563, 1.925318, 1, 0, 0.654902, 1,
1.290483, -0.2871135, 2.876337, 1, 0, 0.6470588, 1,
1.290561, 0.4334672, 0.8849838, 1, 0, 0.6431373, 1,
1.292663, -0.7571155, 2.170521, 1, 0, 0.6352941, 1,
1.293589, -0.6686262, 1.792313, 1, 0, 0.6313726, 1,
1.295668, -0.566655, 3.912636, 1, 0, 0.6235294, 1,
1.31452, 1.529142, -0.1340375, 1, 0, 0.6196079, 1,
1.32231, 0.2124895, 1.607007, 1, 0, 0.6117647, 1,
1.325865, -1.349789, 1.092299, 1, 0, 0.6078432, 1,
1.326978, -0.3097399, 3.411915, 1, 0, 0.6, 1,
1.332419, 1.625599, -1.17248, 1, 0, 0.5921569, 1,
1.34957, -0.04883362, 1.317966, 1, 0, 0.5882353, 1,
1.350134, -0.2916078, 0.6680745, 1, 0, 0.5803922, 1,
1.38781, 0.05210182, 2.742568, 1, 0, 0.5764706, 1,
1.393494, 0.3976631, -0.2089656, 1, 0, 0.5686275, 1,
1.398261, 0.2918778, 1.461407, 1, 0, 0.5647059, 1,
1.405181, 0.9525769, 1.62671, 1, 0, 0.5568628, 1,
1.408143, 0.4257729, 1.071501, 1, 0, 0.5529412, 1,
1.412892, -0.03704504, 1.60579, 1, 0, 0.5450981, 1,
1.421396, 1.974053, 1.820148, 1, 0, 0.5411765, 1,
1.423266, -0.7713763, 2.0391, 1, 0, 0.5333334, 1,
1.425043, 0.3678097, 1.784423, 1, 0, 0.5294118, 1,
1.426606, 0.05846124, 1.54332, 1, 0, 0.5215687, 1,
1.435593, 0.9340872, 0.3087508, 1, 0, 0.5176471, 1,
1.441028, -0.4931523, 0.9312242, 1, 0, 0.509804, 1,
1.441034, 0.5730062, 2.072435, 1, 0, 0.5058824, 1,
1.448838, -0.1022854, 0.8675439, 1, 0, 0.4980392, 1,
1.451149, 0.2189015, 2.046442, 1, 0, 0.4901961, 1,
1.45721, -0.7898667, 1.390607, 1, 0, 0.4862745, 1,
1.460647, -0.0244575, 2.261481, 1, 0, 0.4784314, 1,
1.467615, -0.5380049, 1.682617, 1, 0, 0.4745098, 1,
1.471114, 0.6332341, 1.564373, 1, 0, 0.4666667, 1,
1.500043, -0.623926, 2.212858, 1, 0, 0.4627451, 1,
1.514537, 0.8187702, 1.495917, 1, 0, 0.454902, 1,
1.526807, 0.283621, 2.044029, 1, 0, 0.4509804, 1,
1.529018, -0.04013202, 0.7663211, 1, 0, 0.4431373, 1,
1.566791, 2.123021, 1.400753, 1, 0, 0.4392157, 1,
1.572561, -1.142764, -0.0455927, 1, 0, 0.4313726, 1,
1.573256, -0.8949646, 2.93688, 1, 0, 0.427451, 1,
1.586518, -0.1232725, 2.681631, 1, 0, 0.4196078, 1,
1.590265, 1.448187, 2.394894, 1, 0, 0.4156863, 1,
1.602329, -0.04084421, 1.961005, 1, 0, 0.4078431, 1,
1.605311, -1.100853, 1.195504, 1, 0, 0.4039216, 1,
1.632602, -0.9600387, 3.64726, 1, 0, 0.3960784, 1,
1.63677, 0.9888168, 1.409359, 1, 0, 0.3882353, 1,
1.6391, -0.5476485, 2.947048, 1, 0, 0.3843137, 1,
1.648551, -1.27492, 3.088151, 1, 0, 0.3764706, 1,
1.649421, -0.9935043, 2.452064, 1, 0, 0.372549, 1,
1.653944, 1.226163, 1.338023, 1, 0, 0.3647059, 1,
1.665226, 0.9255744, 1.03343, 1, 0, 0.3607843, 1,
1.674899, 0.02552127, -0.2837091, 1, 0, 0.3529412, 1,
1.677431, -0.5087212, 0.9771191, 1, 0, 0.3490196, 1,
1.678421, -0.7242909, 1.627832, 1, 0, 0.3411765, 1,
1.679605, 0.3302484, 1.718408, 1, 0, 0.3372549, 1,
1.686459, 0.9365387, 0.9863515, 1, 0, 0.3294118, 1,
1.691499, -0.8865425, 2.993948, 1, 0, 0.3254902, 1,
1.693326, -0.3708851, 2.512736, 1, 0, 0.3176471, 1,
1.698793, -2.587566, 2.047421, 1, 0, 0.3137255, 1,
1.721006, 0.082665, 1.571591, 1, 0, 0.3058824, 1,
1.749293, -1.376028, 3.313332, 1, 0, 0.2980392, 1,
1.753515, 0.2580532, 1.303297, 1, 0, 0.2941177, 1,
1.759141, -1.688749, 1.606245, 1, 0, 0.2862745, 1,
1.761983, 0.05942497, 0.6750076, 1, 0, 0.282353, 1,
1.762571, 1.272925, 1.985129, 1, 0, 0.2745098, 1,
1.765332, 0.448584, 1.356497, 1, 0, 0.2705882, 1,
1.774664, -0.1474917, 0.4650471, 1, 0, 0.2627451, 1,
1.8044, -0.1441247, 3.87472, 1, 0, 0.2588235, 1,
1.845242, -0.4975384, 0.9722795, 1, 0, 0.2509804, 1,
1.849718, 0.7646618, 0.100958, 1, 0, 0.2470588, 1,
1.86076, -0.8725503, 2.25132, 1, 0, 0.2392157, 1,
1.864405, 0.9941227, 1.729923, 1, 0, 0.2352941, 1,
1.870184, 1.241885, -0.0592293, 1, 0, 0.227451, 1,
1.871705, -1.574084, 3.120754, 1, 0, 0.2235294, 1,
1.886719, 0.1065201, 4.392434, 1, 0, 0.2156863, 1,
1.890501, -0.6542594, 3.013919, 1, 0, 0.2117647, 1,
1.890925, 1.255878, 0.01673441, 1, 0, 0.2039216, 1,
1.89714, 2.055225, 1.495753, 1, 0, 0.1960784, 1,
1.898714, -0.09043428, 2.400811, 1, 0, 0.1921569, 1,
1.918203, -0.06145191, 2.129268, 1, 0, 0.1843137, 1,
1.950538, -1.073821, 3.073411, 1, 0, 0.1803922, 1,
1.972993, -0.0847714, 0.7614959, 1, 0, 0.172549, 1,
2.037283, 0.3068923, 0.5686709, 1, 0, 0.1686275, 1,
2.13174, 0.7247679, 1.71501, 1, 0, 0.1607843, 1,
2.184299, 1.058112, 1.9702, 1, 0, 0.1568628, 1,
2.1966, 0.8438339, -0.3557092, 1, 0, 0.1490196, 1,
2.204054, 0.5031912, 0.6743475, 1, 0, 0.145098, 1,
2.219096, -0.0270437, 2.511807, 1, 0, 0.1372549, 1,
2.222899, 0.7797006, 2.322164, 1, 0, 0.1333333, 1,
2.242832, -0.1528044, 1.56755, 1, 0, 0.1254902, 1,
2.25079, -1.017475, 0.1454931, 1, 0, 0.1215686, 1,
2.286096, -0.1407265, 1.965524, 1, 0, 0.1137255, 1,
2.290831, 1.57089, 1.721978, 1, 0, 0.1098039, 1,
2.346886, 1.07727, 1.710946, 1, 0, 0.1019608, 1,
2.355347, -0.6879258, 0.415236, 1, 0, 0.09411765, 1,
2.376786, -0.1676739, 1.140432, 1, 0, 0.09019608, 1,
2.389344, 2.622482, 0.1964956, 1, 0, 0.08235294, 1,
2.404922, -1.39891, -0.5272373, 1, 0, 0.07843138, 1,
2.467623, -0.1249718, 1.66339, 1, 0, 0.07058824, 1,
2.47242, 1.040039, 2.492165, 1, 0, 0.06666667, 1,
2.511008, -1.120368, 2.85532, 1, 0, 0.05882353, 1,
2.512806, -0.9803472, 1.195597, 1, 0, 0.05490196, 1,
2.576529, -2.071374, 1.920295, 1, 0, 0.04705882, 1,
2.61957, -0.1783978, 2.364084, 1, 0, 0.04313726, 1,
2.650805, -1.267527, 2.451249, 1, 0, 0.03529412, 1,
2.677738, 0.3281472, 1.134609, 1, 0, 0.03137255, 1,
2.819374, -0.4757684, -0.0797409, 1, 0, 0.02352941, 1,
3.088084, 0.7221638, 2.111604, 1, 0, 0.01960784, 1,
3.128671, 1.254812, -0.7110605, 1, 0, 0.01176471, 1,
3.425874, 1.496537, 1.73764, 1, 0, 0.007843138, 1
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
0.1161661, -4.861158, -6.938896, 0, -0.5, 0.5, 0.5,
0.1161661, -4.861158, -6.938896, 1, -0.5, 0.5, 0.5,
0.1161661, -4.861158, -6.938896, 1, 1.5, 0.5, 0.5,
0.1161661, -4.861158, -6.938896, 0, 1.5, 0.5, 0.5
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
-4.315533, -0.3491851, -6.938896, 0, -0.5, 0.5, 0.5,
-4.315533, -0.3491851, -6.938896, 1, -0.5, 0.5, 0.5,
-4.315533, -0.3491851, -6.938896, 1, 1.5, 0.5, 0.5,
-4.315533, -0.3491851, -6.938896, 0, 1.5, 0.5, 0.5
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
-4.315533, -4.861158, -0.08633184, 0, -0.5, 0.5, 0.5,
-4.315533, -4.861158, -0.08633184, 1, -0.5, 0.5, 0.5,
-4.315533, -4.861158, -0.08633184, 1, 1.5, 0.5, 0.5,
-4.315533, -4.861158, -0.08633184, 0, 1.5, 0.5, 0.5
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
-3, -3.819934, -5.357535,
3, -3.819934, -5.357535,
-3, -3.819934, -5.357535,
-3, -3.993471, -5.621095,
-2, -3.819934, -5.357535,
-2, -3.993471, -5.621095,
-1, -3.819934, -5.357535,
-1, -3.993471, -5.621095,
0, -3.819934, -5.357535,
0, -3.993471, -5.621095,
1, -3.819934, -5.357535,
1, -3.993471, -5.621095,
2, -3.819934, -5.357535,
2, -3.993471, -5.621095,
3, -3.819934, -5.357535,
3, -3.993471, -5.621095
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
-3, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
-3, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
-3, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
-3, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
-2, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
-2, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
-2, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
-2, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
-1, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
-1, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
-1, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
-1, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
0, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
0, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
0, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
0, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
1, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
1, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
1, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
1, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
2, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
2, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
2, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
2, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5,
3, -4.340546, -6.148215, 0, -0.5, 0.5, 0.5,
3, -4.340546, -6.148215, 1, -0.5, 0.5, 0.5,
3, -4.340546, -6.148215, 1, 1.5, 0.5, 0.5,
3, -4.340546, -6.148215, 0, 1.5, 0.5, 0.5
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
-3.292834, -3, -5.357535,
-3.292834, 3, -5.357535,
-3.292834, -3, -5.357535,
-3.463284, -3, -5.621095,
-3.292834, -2, -5.357535,
-3.463284, -2, -5.621095,
-3.292834, -1, -5.357535,
-3.463284, -1, -5.621095,
-3.292834, 0, -5.357535,
-3.463284, 0, -5.621095,
-3.292834, 1, -5.357535,
-3.463284, 1, -5.621095,
-3.292834, 2, -5.357535,
-3.463284, 2, -5.621095,
-3.292834, 3, -5.357535,
-3.463284, 3, -5.621095
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
-3.804183, -3, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, -3, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, -3, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, -3, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, -2, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, -2, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, -2, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, -2, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, -1, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, -1, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, -1, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, -1, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, 0, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, 0, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, 0, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, 0, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, 1, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, 1, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, 1, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, 1, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, 2, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, 2, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, 2, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, 2, -6.148215, 0, 1.5, 0.5, 0.5,
-3.804183, 3, -6.148215, 0, -0.5, 0.5, 0.5,
-3.804183, 3, -6.148215, 1, -0.5, 0.5, 0.5,
-3.804183, 3, -6.148215, 1, 1.5, 0.5, 0.5,
-3.804183, 3, -6.148215, 0, 1.5, 0.5, 0.5
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
-3.292834, -3.819934, -4,
-3.292834, -3.819934, 4,
-3.292834, -3.819934, -4,
-3.463284, -3.993471, -4,
-3.292834, -3.819934, -2,
-3.463284, -3.993471, -2,
-3.292834, -3.819934, 0,
-3.463284, -3.993471, 0,
-3.292834, -3.819934, 2,
-3.463284, -3.993471, 2,
-3.292834, -3.819934, 4,
-3.463284, -3.993471, 4
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
-3.804183, -4.340546, -4, 0, -0.5, 0.5, 0.5,
-3.804183, -4.340546, -4, 1, -0.5, 0.5, 0.5,
-3.804183, -4.340546, -4, 1, 1.5, 0.5, 0.5,
-3.804183, -4.340546, -4, 0, 1.5, 0.5, 0.5,
-3.804183, -4.340546, -2, 0, -0.5, 0.5, 0.5,
-3.804183, -4.340546, -2, 1, -0.5, 0.5, 0.5,
-3.804183, -4.340546, -2, 1, 1.5, 0.5, 0.5,
-3.804183, -4.340546, -2, 0, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 0, 0, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 0, 1, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 0, 1, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 0, 0, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 2, 0, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 2, 1, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 2, 1, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 2, 0, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 4, 0, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 4, 1, -0.5, 0.5, 0.5,
-3.804183, -4.340546, 4, 1, 1.5, 0.5, 0.5,
-3.804183, -4.340546, 4, 0, 1.5, 0.5, 0.5
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
-3.292834, -3.819934, -5.357535,
-3.292834, 3.121564, -5.357535,
-3.292834, -3.819934, 5.184871,
-3.292834, 3.121564, 5.184871,
-3.292834, -3.819934, -5.357535,
-3.292834, -3.819934, 5.184871,
-3.292834, 3.121564, -5.357535,
-3.292834, 3.121564, 5.184871,
-3.292834, -3.819934, -5.357535,
3.525166, -3.819934, -5.357535,
-3.292834, -3.819934, 5.184871,
3.525166, -3.819934, 5.184871,
-3.292834, 3.121564, -5.357535,
3.525166, 3.121564, -5.357535,
-3.292834, 3.121564, 5.184871,
3.525166, 3.121564, 5.184871,
3.525166, -3.819934, -5.357535,
3.525166, 3.121564, -5.357535,
3.525166, -3.819934, 5.184871,
3.525166, 3.121564, 5.184871,
3.525166, -3.819934, -5.357535,
3.525166, -3.819934, 5.184871,
3.525166, 3.121564, -5.357535,
3.525166, 3.121564, 5.184871
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
var radius = 7.660562;
var distance = 34.08271;
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
mvMatrix.translate( -0.1161661, 0.3491851, 0.08633184 );
mvMatrix.scale( 1.214836, 1.193222, 0.7856603 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08271);
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


