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
-3.471222, -0.3192008, -2.020861, 1, 0, 0, 1,
-3.274209, 0.3172154, 0.287226, 1, 0.007843138, 0, 1,
-3.147643, -1.281341, -3.371575, 1, 0.01176471, 0, 1,
-2.652668, 1.074352, -2.50744, 1, 0.01960784, 0, 1,
-2.626991, 0.2278724, -1.993491, 1, 0.02352941, 0, 1,
-2.567949, 0.8965907, -1.572068, 1, 0.03137255, 0, 1,
-2.525047, -1.491842, -1.982257, 1, 0.03529412, 0, 1,
-2.505164, 0.9536659, -1.187901, 1, 0.04313726, 0, 1,
-2.42551, -0.1873072, -2.341118, 1, 0.04705882, 0, 1,
-2.397976, 1.533927, -1.68842, 1, 0.05490196, 0, 1,
-2.380975, 1.065818, -2.115386, 1, 0.05882353, 0, 1,
-2.33177, 1.799644, -0.4861432, 1, 0.06666667, 0, 1,
-2.27403, 0.03811023, -0.6352721, 1, 0.07058824, 0, 1,
-2.232226, 1.29157, 0.4945116, 1, 0.07843138, 0, 1,
-2.192314, 1.975188, -1.292519, 1, 0.08235294, 0, 1,
-2.143809, 0.1274148, -1.078881, 1, 0.09019608, 0, 1,
-2.119394, 1.633986, 0.1895912, 1, 0.09411765, 0, 1,
-2.101129, 0.8407196, -1.049458, 1, 0.1019608, 0, 1,
-2.088683, -0.245767, -2.143938, 1, 0.1098039, 0, 1,
-2.056147, -0.2160563, -2.073726, 1, 0.1137255, 0, 1,
-2.052992, -0.4865977, -2.033233, 1, 0.1215686, 0, 1,
-2.019251, -0.378112, -2.466698, 1, 0.1254902, 0, 1,
-2.017416, 0.478375, -2.830847, 1, 0.1333333, 0, 1,
-1.989422, -1.122314, -0.1335677, 1, 0.1372549, 0, 1,
-1.976164, -1.382058, -2.93654, 1, 0.145098, 0, 1,
-1.973409, 0.3739305, -1.732876, 1, 0.1490196, 0, 1,
-1.931701, 0.8988267, -1.906509, 1, 0.1568628, 0, 1,
-1.912852, -0.5092322, -1.587429, 1, 0.1607843, 0, 1,
-1.909122, -1.343706, 0.2027916, 1, 0.1686275, 0, 1,
-1.899575, -0.6420303, -1.213875, 1, 0.172549, 0, 1,
-1.893281, -2.199767, -1.419153, 1, 0.1803922, 0, 1,
-1.876627, -0.31586, -0.8542857, 1, 0.1843137, 0, 1,
-1.869974, 0.5333918, -1.878508, 1, 0.1921569, 0, 1,
-1.856913, 0.4948497, -2.78386, 1, 0.1960784, 0, 1,
-1.841894, 0.04112015, -1.324445, 1, 0.2039216, 0, 1,
-1.825218, 0.8223235, -1.891086, 1, 0.2117647, 0, 1,
-1.824563, -0.4542491, -2.366183, 1, 0.2156863, 0, 1,
-1.794295, -0.4656603, -2.469217, 1, 0.2235294, 0, 1,
-1.782502, 1.135257, -0.4047833, 1, 0.227451, 0, 1,
-1.76306, 1.178243, -0.5555348, 1, 0.2352941, 0, 1,
-1.743371, -0.06172648, -0.3445237, 1, 0.2392157, 0, 1,
-1.739898, 0.7649539, -1.146665, 1, 0.2470588, 0, 1,
-1.733384, -0.3804525, -0.553508, 1, 0.2509804, 0, 1,
-1.732769, -0.7834383, -2.314528, 1, 0.2588235, 0, 1,
-1.72849, -1.134368, -1.351424, 1, 0.2627451, 0, 1,
-1.708524, -0.160851, -1.961484, 1, 0.2705882, 0, 1,
-1.702264, 0.2904324, -0.2827619, 1, 0.2745098, 0, 1,
-1.689342, 2.263175, -0.8895849, 1, 0.282353, 0, 1,
-1.687746, 0.02565784, -0.9816645, 1, 0.2862745, 0, 1,
-1.677709, 0.008108653, -1.907264, 1, 0.2941177, 0, 1,
-1.649506, 1.548416, 0.1174368, 1, 0.3019608, 0, 1,
-1.63367, -0.1311822, -2.306098, 1, 0.3058824, 0, 1,
-1.631717, -0.7700177, 0.1801108, 1, 0.3137255, 0, 1,
-1.628487, -1.748184, -1.701722, 1, 0.3176471, 0, 1,
-1.621225, 0.5856157, -0.8717129, 1, 0.3254902, 0, 1,
-1.619634, -0.9009671, -2.529206, 1, 0.3294118, 0, 1,
-1.615166, -0.3920189, -0.8469877, 1, 0.3372549, 0, 1,
-1.611701, 1.090002, -1.748695, 1, 0.3411765, 0, 1,
-1.607487, -0.9112152, -2.246273, 1, 0.3490196, 0, 1,
-1.600234, 0.4141264, -0.7774536, 1, 0.3529412, 0, 1,
-1.584794, 1.945187, -0.09656147, 1, 0.3607843, 0, 1,
-1.578997, -2.333026, -2.525069, 1, 0.3647059, 0, 1,
-1.574274, 0.8342506, -0.7548693, 1, 0.372549, 0, 1,
-1.567485, 0.3991504, -1.433302, 1, 0.3764706, 0, 1,
-1.558282, 2.367707, -1.151743, 1, 0.3843137, 0, 1,
-1.548616, 1.015122, 0.270938, 1, 0.3882353, 0, 1,
-1.54542, 1.255391, 1.189947, 1, 0.3960784, 0, 1,
-1.542583, -0.6932483, -1.643816, 1, 0.4039216, 0, 1,
-1.541856, 0.03733183, -0.4340609, 1, 0.4078431, 0, 1,
-1.541215, 0.3336, 0.2732031, 1, 0.4156863, 0, 1,
-1.531082, 0.4030332, -2.937309, 1, 0.4196078, 0, 1,
-1.527709, -0.5871147, -0.6328906, 1, 0.427451, 0, 1,
-1.525265, -0.1915392, -3.640464, 1, 0.4313726, 0, 1,
-1.513335, -0.1045587, -3.017733, 1, 0.4392157, 0, 1,
-1.51026, 0.7404709, -0.2857573, 1, 0.4431373, 0, 1,
-1.507889, 0.2086612, -1.069585, 1, 0.4509804, 0, 1,
-1.507412, 0.05887071, -1.216138, 1, 0.454902, 0, 1,
-1.498277, 0.5420437, -1.913823, 1, 0.4627451, 0, 1,
-1.496333, 0.1904549, -2.264546, 1, 0.4666667, 0, 1,
-1.492368, -0.1441103, -2.377177, 1, 0.4745098, 0, 1,
-1.489662, -0.4199462, -2.555266, 1, 0.4784314, 0, 1,
-1.486226, 0.5789844, -1.906357, 1, 0.4862745, 0, 1,
-1.48164, 0.7408456, 0.7218313, 1, 0.4901961, 0, 1,
-1.47499, 1.019075, -1.009756, 1, 0.4980392, 0, 1,
-1.452768, 0.514554, -1.904275, 1, 0.5058824, 0, 1,
-1.444712, 0.1482419, -0.6723216, 1, 0.509804, 0, 1,
-1.44346, -0.68445, -3.901101, 1, 0.5176471, 0, 1,
-1.439945, 0.6905867, -2.018396, 1, 0.5215687, 0, 1,
-1.431312, -3.226273, -1.30692, 1, 0.5294118, 0, 1,
-1.422138, 0.1628489, -1.18606, 1, 0.5333334, 0, 1,
-1.421921, -0.4468729, -2.02896, 1, 0.5411765, 0, 1,
-1.40273, -0.8036948, -1.272565, 1, 0.5450981, 0, 1,
-1.401384, 0.4278675, -0.8755556, 1, 0.5529412, 0, 1,
-1.386224, -2.052867, -3.465255, 1, 0.5568628, 0, 1,
-1.385232, 0.9673483, -2.108702, 1, 0.5647059, 0, 1,
-1.368939, 0.3464667, -1.290945, 1, 0.5686275, 0, 1,
-1.363951, -0.8096011, -1.745581, 1, 0.5764706, 0, 1,
-1.357137, 1.789714, -0.8125622, 1, 0.5803922, 0, 1,
-1.356656, 1.403646, -0.08349935, 1, 0.5882353, 0, 1,
-1.353106, -1.506671, -0.8586503, 1, 0.5921569, 0, 1,
-1.352092, -0.08852885, -1.809036, 1, 0.6, 0, 1,
-1.350428, -0.3868047, -0.676144, 1, 0.6078432, 0, 1,
-1.347043, -0.1552076, -1.699302, 1, 0.6117647, 0, 1,
-1.344114, -0.8430303, -1.323013, 1, 0.6196079, 0, 1,
-1.343686, -1.7478, -1.3744, 1, 0.6235294, 0, 1,
-1.333066, -0.781449, -0.9371246, 1, 0.6313726, 0, 1,
-1.330327, -0.6746263, -0.8671366, 1, 0.6352941, 0, 1,
-1.330273, 1.335817, -0.4675235, 1, 0.6431373, 0, 1,
-1.328896, -0.6559224, -1.409248, 1, 0.6470588, 0, 1,
-1.316003, -0.6441247, -3.934837, 1, 0.654902, 0, 1,
-1.314574, -0.6588492, -2.53264, 1, 0.6588235, 0, 1,
-1.305992, -0.8499646, -0.5442294, 1, 0.6666667, 0, 1,
-1.302859, 0.3564967, -1.868093, 1, 0.6705883, 0, 1,
-1.302481, 0.1251708, -0.5336041, 1, 0.6784314, 0, 1,
-1.297942, 0.908944, -2.788855, 1, 0.682353, 0, 1,
-1.294152, -1.763648, -1.522199, 1, 0.6901961, 0, 1,
-1.290908, 0.1445789, -1.553235, 1, 0.6941177, 0, 1,
-1.282487, -2.80875, -4.191808, 1, 0.7019608, 0, 1,
-1.276404, -0.3016699, -2.344505, 1, 0.7098039, 0, 1,
-1.274738, 0.2614024, -0.6035872, 1, 0.7137255, 0, 1,
-1.264201, 0.5201136, 0.2656989, 1, 0.7215686, 0, 1,
-1.263062, 0.0275418, -1.858043, 1, 0.7254902, 0, 1,
-1.258738, -0.560456, -3.900608, 1, 0.7333333, 0, 1,
-1.25273, 1.800306, -0.6952802, 1, 0.7372549, 0, 1,
-1.252607, 0.07156458, -2.3631, 1, 0.7450981, 0, 1,
-1.251603, 1.377654, -1.227993, 1, 0.7490196, 0, 1,
-1.246601, -0.5451248, -1.055898, 1, 0.7568628, 0, 1,
-1.235115, -0.9247971, -2.489458, 1, 0.7607843, 0, 1,
-1.218427, 0.84465, -0.1624166, 1, 0.7686275, 0, 1,
-1.217435, 0.6006681, -0.757156, 1, 0.772549, 0, 1,
-1.214776, -0.09577532, -2.314741, 1, 0.7803922, 0, 1,
-1.212203, 0.8618079, -0.4926775, 1, 0.7843137, 0, 1,
-1.203068, 2.748324, 0.1628038, 1, 0.7921569, 0, 1,
-1.199738, 1.469695, 0.6900854, 1, 0.7960784, 0, 1,
-1.19776, -0.3261013, -2.327844, 1, 0.8039216, 0, 1,
-1.197229, -0.2519291, -2.719774, 1, 0.8117647, 0, 1,
-1.192303, -0.7239671, -4.225881, 1, 0.8156863, 0, 1,
-1.180534, 1.444971, -2.233619, 1, 0.8235294, 0, 1,
-1.163332, -0.1698014, -2.494604, 1, 0.827451, 0, 1,
-1.158388, -0.1146506, -2.262393, 1, 0.8352941, 0, 1,
-1.156872, -0.6262309, -2.102382, 1, 0.8392157, 0, 1,
-1.152797, 1.446455, -0.2792262, 1, 0.8470588, 0, 1,
-1.152036, 0.4812575, -2.290487, 1, 0.8509804, 0, 1,
-1.151203, 0.528662, -2.955398, 1, 0.8588235, 0, 1,
-1.148427, 0.4151053, -0.1310162, 1, 0.8627451, 0, 1,
-1.143784, 1.37005, -1.438076, 1, 0.8705882, 0, 1,
-1.138926, 1.238753, 0.4660271, 1, 0.8745098, 0, 1,
-1.127231, 0.5438443, -1.437733, 1, 0.8823529, 0, 1,
-1.11264, -2.532785, -2.584365, 1, 0.8862745, 0, 1,
-1.112218, -0.07025086, -3.892937, 1, 0.8941177, 0, 1,
-1.108767, -0.3721069, -2.401451, 1, 0.8980392, 0, 1,
-1.104737, 0.8547854, -0.008412379, 1, 0.9058824, 0, 1,
-1.097894, -0.04374632, -0.7570167, 1, 0.9137255, 0, 1,
-1.089745, 0.2681641, -1.458999, 1, 0.9176471, 0, 1,
-1.086446, 0.335083, -1.350868, 1, 0.9254902, 0, 1,
-1.086146, 0.8043501, -1.404579, 1, 0.9294118, 0, 1,
-1.070175, -0.6685364, -2.449122, 1, 0.9372549, 0, 1,
-1.068758, 1.3809, -0.6891136, 1, 0.9411765, 0, 1,
-1.067705, 1.581629, 0.06059175, 1, 0.9490196, 0, 1,
-1.066988, 0.5460255, 0.004119938, 1, 0.9529412, 0, 1,
-1.06207, 1.774119, 1.198439, 1, 0.9607843, 0, 1,
-1.058093, -0.03219407, -0.607492, 1, 0.9647059, 0, 1,
-1.05768, -1.03075, -1.416288, 1, 0.972549, 0, 1,
-1.057658, 3.161341, 0.09896819, 1, 0.9764706, 0, 1,
-1.051372, 0.175777, 0.289178, 1, 0.9843137, 0, 1,
-1.040225, 0.2422764, -1.98586, 1, 0.9882353, 0, 1,
-1.038378, -0.6854814, -4.145424, 1, 0.9960784, 0, 1,
-1.033651, 0.6292489, -0.6637183, 0.9960784, 1, 0, 1,
-1.025961, 0.312099, 0.636223, 0.9921569, 1, 0, 1,
-1.019965, 1.030426, -0.9838738, 0.9843137, 1, 0, 1,
-1.017187, 1.080163, -2.099075, 0.9803922, 1, 0, 1,
-1.015264, 1.216918, -0.3543556, 0.972549, 1, 0, 1,
-1.012503, -0.998238, -3.328384, 0.9686275, 1, 0, 1,
-1.012076, -1.526551, -2.784292, 0.9607843, 1, 0, 1,
-1.011923, -0.9029794, -1.749725, 0.9568627, 1, 0, 1,
-1.008464, -1.421942, -3.024927, 0.9490196, 1, 0, 1,
-1.007152, -0.2476333, -0.03689785, 0.945098, 1, 0, 1,
-1.003064, -1.133111, -3.822501, 0.9372549, 1, 0, 1,
-1.002178, -1.288394, -2.970514, 0.9333333, 1, 0, 1,
-0.996965, -0.6975046, -2.792432, 0.9254902, 1, 0, 1,
-0.9942237, 1.35416, -1.166943, 0.9215686, 1, 0, 1,
-0.9866529, -0.2580349, -1.850808, 0.9137255, 1, 0, 1,
-0.9833952, 1.724987, 0.07838111, 0.9098039, 1, 0, 1,
-0.982253, -1.216802, -2.703343, 0.9019608, 1, 0, 1,
-0.9788374, -1.377297, -2.562647, 0.8941177, 1, 0, 1,
-0.9672439, -0.7122654, -2.093412, 0.8901961, 1, 0, 1,
-0.96691, 0.2118775, -0.9837998, 0.8823529, 1, 0, 1,
-0.9668043, 1.39465, -1.788695, 0.8784314, 1, 0, 1,
-0.9601693, -1.65548, -2.800123, 0.8705882, 1, 0, 1,
-0.9577522, 0.6362378, -1.874676, 0.8666667, 1, 0, 1,
-0.9482844, 0.7629232, -1.861463, 0.8588235, 1, 0, 1,
-0.9463163, -0.04227669, -1.263827, 0.854902, 1, 0, 1,
-0.9451866, -1.295128, -2.8169, 0.8470588, 1, 0, 1,
-0.9408962, 0.7029594, 1.132027, 0.8431373, 1, 0, 1,
-0.9269099, -1.119667, -3.022349, 0.8352941, 1, 0, 1,
-0.9265202, -0.890995, -2.391426, 0.8313726, 1, 0, 1,
-0.9185009, 0.1035603, -1.666384, 0.8235294, 1, 0, 1,
-0.916989, -0.8468255, -2.762584, 0.8196079, 1, 0, 1,
-0.9147459, 0.5661463, -0.9575836, 0.8117647, 1, 0, 1,
-0.9127994, -0.02050556, -1.914095, 0.8078431, 1, 0, 1,
-0.9127676, -1.108973, -2.627296, 0.8, 1, 0, 1,
-0.8995591, -0.5709702, -2.801823, 0.7921569, 1, 0, 1,
-0.8989353, -1.818569, -2.943966, 0.7882353, 1, 0, 1,
-0.8980352, -1.296677, -2.985198, 0.7803922, 1, 0, 1,
-0.8976864, -1.092229, -2.73201, 0.7764706, 1, 0, 1,
-0.8942747, -0.09814114, -1.054736, 0.7686275, 1, 0, 1,
-0.8873799, 0.02232056, -3.230876, 0.7647059, 1, 0, 1,
-0.8859732, -0.03220809, -0.9097096, 0.7568628, 1, 0, 1,
-0.8839476, 1.588514, 0.02534857, 0.7529412, 1, 0, 1,
-0.8804265, 0.2562535, 0.3835533, 0.7450981, 1, 0, 1,
-0.8791062, 0.1074557, -0.3264253, 0.7411765, 1, 0, 1,
-0.8756278, -1.016008, -0.571465, 0.7333333, 1, 0, 1,
-0.8755782, -0.6154734, -0.9683613, 0.7294118, 1, 0, 1,
-0.867866, -0.4684289, -1.222886, 0.7215686, 1, 0, 1,
-0.8671535, 1.539731, 0.1020164, 0.7176471, 1, 0, 1,
-0.8661516, -0.6788406, -3.964081, 0.7098039, 1, 0, 1,
-0.8642986, -0.1423881, -1.19416, 0.7058824, 1, 0, 1,
-0.856244, -1.828404, -3.113435, 0.6980392, 1, 0, 1,
-0.8560427, -0.5629998, -2.703662, 0.6901961, 1, 0, 1,
-0.8555791, -0.5040271, -2.387116, 0.6862745, 1, 0, 1,
-0.8527641, 0.4290202, -0.773255, 0.6784314, 1, 0, 1,
-0.8406175, 0.0994767, -1.701341, 0.6745098, 1, 0, 1,
-0.8278091, -0.3241431, -0.9790555, 0.6666667, 1, 0, 1,
-0.8257384, -1.731146, -1.811013, 0.6627451, 1, 0, 1,
-0.8249721, 0.8034572, -0.3736208, 0.654902, 1, 0, 1,
-0.8246415, -1.193695, -3.362618, 0.6509804, 1, 0, 1,
-0.8195878, -2.10627, -3.489688, 0.6431373, 1, 0, 1,
-0.8179898, -1.203268, -2.168412, 0.6392157, 1, 0, 1,
-0.8177692, -1.66808, -2.716951, 0.6313726, 1, 0, 1,
-0.8133113, -0.5178789, -0.927958, 0.627451, 1, 0, 1,
-0.8100462, 0.5223511, -1.32707, 0.6196079, 1, 0, 1,
-0.8028329, 0.3302737, -0.4495431, 0.6156863, 1, 0, 1,
-0.7923369, -0.0686439, -0.9072866, 0.6078432, 1, 0, 1,
-0.7894321, 1.946095, 1.441661, 0.6039216, 1, 0, 1,
-0.7857571, -0.2080258, -2.024675, 0.5960785, 1, 0, 1,
-0.7768843, -0.9637779, -0.503198, 0.5882353, 1, 0, 1,
-0.7766623, -0.5503945, -0.585638, 0.5843138, 1, 0, 1,
-0.7752981, -0.1475251, -2.711202, 0.5764706, 1, 0, 1,
-0.7741782, 0.7409999, 0.3935132, 0.572549, 1, 0, 1,
-0.7723622, 0.122984, -2.141212, 0.5647059, 1, 0, 1,
-0.7708887, -1.030464, -1.930504, 0.5607843, 1, 0, 1,
-0.7669089, 0.3691432, -2.530442, 0.5529412, 1, 0, 1,
-0.7655973, -1.826626, -2.657343, 0.5490196, 1, 0, 1,
-0.7636665, -0.1776497, -2.450331, 0.5411765, 1, 0, 1,
-0.762738, -1.12242, -0.3716587, 0.5372549, 1, 0, 1,
-0.760137, 1.384403, 0.346396, 0.5294118, 1, 0, 1,
-0.7534398, -0.9988405, -0.8871266, 0.5254902, 1, 0, 1,
-0.7514597, 0.4398898, 0.1353019, 0.5176471, 1, 0, 1,
-0.7485865, 1.460388, -0.7742738, 0.5137255, 1, 0, 1,
-0.7464384, 0.2624515, -0.7223725, 0.5058824, 1, 0, 1,
-0.7445634, -0.1536116, 0.8128061, 0.5019608, 1, 0, 1,
-0.7400764, -1.394941, -3.968799, 0.4941176, 1, 0, 1,
-0.7384439, -1.045322, -3.955029, 0.4862745, 1, 0, 1,
-0.73058, -0.2228061, -2.2109, 0.4823529, 1, 0, 1,
-0.7304607, -0.6830183, -0.7692195, 0.4745098, 1, 0, 1,
-0.7298937, 1.034647, 0.5202287, 0.4705882, 1, 0, 1,
-0.7279642, -0.4629607, -1.004698, 0.4627451, 1, 0, 1,
-0.7218555, 0.6828641, -0.122716, 0.4588235, 1, 0, 1,
-0.7180665, 0.3417056, 1.892421, 0.4509804, 1, 0, 1,
-0.7146748, -1.045193, -2.544105, 0.4470588, 1, 0, 1,
-0.7075729, 1.044393, -1.203777, 0.4392157, 1, 0, 1,
-0.7045021, 0.0007270491, -1.035128, 0.4352941, 1, 0, 1,
-0.6969164, -0.3540111, -1.87701, 0.427451, 1, 0, 1,
-0.6950027, -0.906105, -2.823407, 0.4235294, 1, 0, 1,
-0.6933324, 0.1469062, -1.347695, 0.4156863, 1, 0, 1,
-0.690078, 0.3097242, -2.015763, 0.4117647, 1, 0, 1,
-0.6876937, -0.8216757, -2.098501, 0.4039216, 1, 0, 1,
-0.6864404, -1.149343, -2.053052, 0.3960784, 1, 0, 1,
-0.6830723, -1.205031, -1.504673, 0.3921569, 1, 0, 1,
-0.6774874, 1.215589, 1.497501, 0.3843137, 1, 0, 1,
-0.6770244, 1.618632, -0.02698504, 0.3803922, 1, 0, 1,
-0.676971, 0.5656002, 0.31637, 0.372549, 1, 0, 1,
-0.6678764, -0.2751928, -1.32525, 0.3686275, 1, 0, 1,
-0.6652666, 1.095681, -0.129314, 0.3607843, 1, 0, 1,
-0.6625199, 1.233445, -0.9080192, 0.3568628, 1, 0, 1,
-0.660328, -0.07401068, -2.357891, 0.3490196, 1, 0, 1,
-0.6600451, -1.329696, -1.91387, 0.345098, 1, 0, 1,
-0.6599028, 0.4638032, 0.4582371, 0.3372549, 1, 0, 1,
-0.6596985, -0.07259111, -1.453686, 0.3333333, 1, 0, 1,
-0.656818, -1.029567, -1.434936, 0.3254902, 1, 0, 1,
-0.6559917, 1.09299, -0.6794469, 0.3215686, 1, 0, 1,
-0.6558042, 0.5322018, -0.9246138, 0.3137255, 1, 0, 1,
-0.65533, -0.01713379, -1.536388, 0.3098039, 1, 0, 1,
-0.6536465, -0.7878265, -2.326817, 0.3019608, 1, 0, 1,
-0.6518984, 0.09077399, -2.96936, 0.2941177, 1, 0, 1,
-0.6485151, -0.2515273, -1.807963, 0.2901961, 1, 0, 1,
-0.6378803, 0.9017169, 0.1300309, 0.282353, 1, 0, 1,
-0.6373467, 1.780736, 0.3629464, 0.2784314, 1, 0, 1,
-0.6372237, -0.4555824, -0.5062005, 0.2705882, 1, 0, 1,
-0.6371791, -0.03857437, -1.056845, 0.2666667, 1, 0, 1,
-0.6365952, -0.4604942, -2.758317, 0.2588235, 1, 0, 1,
-0.6336204, 0.163316, -1.875552, 0.254902, 1, 0, 1,
-0.6331269, 0.7162182, -0.9360725, 0.2470588, 1, 0, 1,
-0.6284556, -1.626022, -3.35837, 0.2431373, 1, 0, 1,
-0.6275389, -0.6871231, -4.382254, 0.2352941, 1, 0, 1,
-0.6198, 0.1469613, 1.02018, 0.2313726, 1, 0, 1,
-0.6151022, 1.144803, -1.739669, 0.2235294, 1, 0, 1,
-0.6112747, -0.5278937, -1.206493, 0.2196078, 1, 0, 1,
-0.6021335, 1.077443, -1.008305, 0.2117647, 1, 0, 1,
-0.6005666, 0.1410837, -2.627718, 0.2078431, 1, 0, 1,
-0.5994612, -1.644714, -2.129415, 0.2, 1, 0, 1,
-0.5924335, 1.135602, 1.108022, 0.1921569, 1, 0, 1,
-0.5894538, -0.3038883, -2.957736, 0.1882353, 1, 0, 1,
-0.5868412, 0.1343171, -0.2244119, 0.1803922, 1, 0, 1,
-0.5818347, 0.8716585, -3.220963, 0.1764706, 1, 0, 1,
-0.5783628, -2.444264, -1.658684, 0.1686275, 1, 0, 1,
-0.5761698, 0.3036227, -1.625141, 0.1647059, 1, 0, 1,
-0.57041, -0.7928855, -3.320258, 0.1568628, 1, 0, 1,
-0.5692884, 0.8411912, -0.4942794, 0.1529412, 1, 0, 1,
-0.5667121, -0.3478957, -1.063376, 0.145098, 1, 0, 1,
-0.5623515, 1.26974, -0.07012726, 0.1411765, 1, 0, 1,
-0.5608671, 0.1963178, -1.060334, 0.1333333, 1, 0, 1,
-0.5524117, -1.458858, -3.242215, 0.1294118, 1, 0, 1,
-0.5513285, 0.6972205, -1.222825, 0.1215686, 1, 0, 1,
-0.5479677, -0.1833791, -1.24871, 0.1176471, 1, 0, 1,
-0.5479606, -0.8546571, -0.4764194, 0.1098039, 1, 0, 1,
-0.5473162, -0.8026892, -1.310225, 0.1058824, 1, 0, 1,
-0.5468544, 1.161858, 1.184946, 0.09803922, 1, 0, 1,
-0.5450468, -0.7551704, -2.419548, 0.09019608, 1, 0, 1,
-0.5407172, -0.3507976, -3.335729, 0.08627451, 1, 0, 1,
-0.5331023, 0.2883324, -0.6713874, 0.07843138, 1, 0, 1,
-0.5316238, 0.8349869, -0.3219959, 0.07450981, 1, 0, 1,
-0.5295262, 0.06637753, -1.302829, 0.06666667, 1, 0, 1,
-0.5270622, 0.8841491, -1.795183, 0.0627451, 1, 0, 1,
-0.5268877, 0.7506357, -0.3759031, 0.05490196, 1, 0, 1,
-0.5137325, -1.094604, -4.453109, 0.05098039, 1, 0, 1,
-0.5090751, 0.8270564, -0.134592, 0.04313726, 1, 0, 1,
-0.5064178, 1.903636, -1.839434, 0.03921569, 1, 0, 1,
-0.5038933, -0.6695532, -2.662179, 0.03137255, 1, 0, 1,
-0.5022641, -0.5031598, -3.637016, 0.02745098, 1, 0, 1,
-0.4999107, -0.3995693, -2.346819, 0.01960784, 1, 0, 1,
-0.4996984, 0.4792022, -1.220096, 0.01568628, 1, 0, 1,
-0.4930849, -0.6584266, -3.172941, 0.007843138, 1, 0, 1,
-0.4901059, -0.3055785, -0.4912736, 0.003921569, 1, 0, 1,
-0.4893301, 0.1376005, -2.341767, 0, 1, 0.003921569, 1,
-0.4886087, 2.645593, -1.036516, 0, 1, 0.01176471, 1,
-0.4863385, -0.2291407, -1.59166, 0, 1, 0.01568628, 1,
-0.4854585, 1.056539, 1.039934, 0, 1, 0.02352941, 1,
-0.4845559, 0.2935329, -0.978601, 0, 1, 0.02745098, 1,
-0.4829592, -1.593638, -1.915191, 0, 1, 0.03529412, 1,
-0.4824649, 1.386398, -2.038581, 0, 1, 0.03921569, 1,
-0.47356, -0.620941, -2.101403, 0, 1, 0.04705882, 1,
-0.4631225, 0.3022454, -2.184515, 0, 1, 0.05098039, 1,
-0.4588902, -0.1673022, -3.415793, 0, 1, 0.05882353, 1,
-0.4547018, 1.284714, 1.457034, 0, 1, 0.0627451, 1,
-0.44722, -1.370174, -2.819894, 0, 1, 0.07058824, 1,
-0.4434527, -0.6538088, -2.558221, 0, 1, 0.07450981, 1,
-0.4408242, 0.549475, -0.9794725, 0, 1, 0.08235294, 1,
-0.4344643, -0.6968042, -1.960041, 0, 1, 0.08627451, 1,
-0.4316084, -0.2339567, -2.866719, 0, 1, 0.09411765, 1,
-0.4273188, -1.467064, -2.398029, 0, 1, 0.1019608, 1,
-0.4270844, 0.1060287, -0.7883365, 0, 1, 0.1058824, 1,
-0.424179, 0.2405054, -2.461032, 0, 1, 0.1137255, 1,
-0.4232416, 1.467186, 0.7689122, 0, 1, 0.1176471, 1,
-0.4193636, 0.3323426, -0.6683044, 0, 1, 0.1254902, 1,
-0.4158808, 1.729969, 0.8000699, 0, 1, 0.1294118, 1,
-0.411472, -0.9644245, -1.514969, 0, 1, 0.1372549, 1,
-0.4105797, 0.7645329, -2.268774, 0, 1, 0.1411765, 1,
-0.4101969, -0.9560576, -2.349992, 0, 1, 0.1490196, 1,
-0.4100084, -1.517485, -2.179693, 0, 1, 0.1529412, 1,
-0.4035201, -0.8322268, -1.501036, 0, 1, 0.1607843, 1,
-0.4028749, 0.9863917, -3.593512, 0, 1, 0.1647059, 1,
-0.4023661, 0.1712518, -0.2677324, 0, 1, 0.172549, 1,
-0.3961422, 1.331247, -0.2009455, 0, 1, 0.1764706, 1,
-0.3930388, -0.2292193, -1.286769, 0, 1, 0.1843137, 1,
-0.3921385, -0.3952275, -2.311064, 0, 1, 0.1882353, 1,
-0.391761, -1.34511, -3.592618, 0, 1, 0.1960784, 1,
-0.3873111, 1.363544, 1.120072, 0, 1, 0.2039216, 1,
-0.3840257, 0.6395265, 1.291813, 0, 1, 0.2078431, 1,
-0.3808853, -1.473748, -2.762293, 0, 1, 0.2156863, 1,
-0.3790842, 0.002002333, -1.535393, 0, 1, 0.2196078, 1,
-0.3787477, -0.4879988, -0.8373495, 0, 1, 0.227451, 1,
-0.3777701, 0.1471619, -0.7224478, 0, 1, 0.2313726, 1,
-0.3749545, -0.01772389, -2.394156, 0, 1, 0.2392157, 1,
-0.3726867, -0.7360036, -2.703869, 0, 1, 0.2431373, 1,
-0.3656187, -1.553027, -4.567671, 0, 1, 0.2509804, 1,
-0.3654505, 0.8239955, -0.2405747, 0, 1, 0.254902, 1,
-0.3639395, -0.4621232, -3.297511, 0, 1, 0.2627451, 1,
-0.3608236, 0.1252346, -1.299358, 0, 1, 0.2666667, 1,
-0.3501185, 0.3443746, -1.014648, 0, 1, 0.2745098, 1,
-0.3497833, 0.9450644, -0.7491572, 0, 1, 0.2784314, 1,
-0.3444398, -0.02635157, -0.2741614, 0, 1, 0.2862745, 1,
-0.3438286, -0.3972894, -4.725183, 0, 1, 0.2901961, 1,
-0.3421399, -1.704205, -2.411656, 0, 1, 0.2980392, 1,
-0.3412609, -0.776048, -3.215494, 0, 1, 0.3058824, 1,
-0.3365541, 0.09034101, -0.8158116, 0, 1, 0.3098039, 1,
-0.3336474, 0.7886504, -1.280231, 0, 1, 0.3176471, 1,
-0.3311652, -0.7165723, -3.92108, 0, 1, 0.3215686, 1,
-0.3308104, 0.3889064, -1.675793, 0, 1, 0.3294118, 1,
-0.3295179, -0.01983997, -2.048547, 0, 1, 0.3333333, 1,
-0.3283682, 0.5820136, 0.3786939, 0, 1, 0.3411765, 1,
-0.3204152, -1.73857, -2.532476, 0, 1, 0.345098, 1,
-0.3178454, 0.1680762, -2.654738, 0, 1, 0.3529412, 1,
-0.3157233, -2.331954, -2.193664, 0, 1, 0.3568628, 1,
-0.306547, -0.7738701, -2.533346, 0, 1, 0.3647059, 1,
-0.3058436, -0.0270023, -1.148858, 0, 1, 0.3686275, 1,
-0.2989295, -2.328268, -2.600444, 0, 1, 0.3764706, 1,
-0.2989058, 1.95661, -0.5246333, 0, 1, 0.3803922, 1,
-0.2983343, 1.066134, 1.967611, 0, 1, 0.3882353, 1,
-0.2943926, -0.9842637, -2.632725, 0, 1, 0.3921569, 1,
-0.2926909, -0.2117835, -1.600296, 0, 1, 0.4, 1,
-0.2908435, -0.5650526, -2.85381, 0, 1, 0.4078431, 1,
-0.2882295, -0.7734845, -3.582072, 0, 1, 0.4117647, 1,
-0.2866806, 1.467622, 1.226388, 0, 1, 0.4196078, 1,
-0.2863298, 0.6575341, -0.354982, 0, 1, 0.4235294, 1,
-0.2846849, 1.390269, -1.651219, 0, 1, 0.4313726, 1,
-0.2808102, -1.914919, -1.426244, 0, 1, 0.4352941, 1,
-0.2757486, 0.9719931, -0.1145013, 0, 1, 0.4431373, 1,
-0.2755504, -1.391866, -4.768149, 0, 1, 0.4470588, 1,
-0.271638, 0.2689736, -0.9009896, 0, 1, 0.454902, 1,
-0.2703461, -0.04451989, -0.6483997, 0, 1, 0.4588235, 1,
-0.2690579, 1.69594, 1.258442, 0, 1, 0.4666667, 1,
-0.2574462, 0.9387977, 0.1603956, 0, 1, 0.4705882, 1,
-0.2530028, -0.2580607, -1.421049, 0, 1, 0.4784314, 1,
-0.2518731, 0.3936732, -1.900059, 0, 1, 0.4823529, 1,
-0.2511467, -1.263274, -4.191231, 0, 1, 0.4901961, 1,
-0.2510703, -0.5867763, -1.964829, 0, 1, 0.4941176, 1,
-0.2480861, 0.9493392, -1.807131, 0, 1, 0.5019608, 1,
-0.2446773, 0.7424439, -1.378127, 0, 1, 0.509804, 1,
-0.2431415, -0.7227324, -2.64589, 0, 1, 0.5137255, 1,
-0.2223182, 0.9336845, 0.07943256, 0, 1, 0.5215687, 1,
-0.2205638, 0.7490382, 0.01177896, 0, 1, 0.5254902, 1,
-0.2194913, -1.572359, -2.891317, 0, 1, 0.5333334, 1,
-0.2177403, -0.007602652, 0.314067, 0, 1, 0.5372549, 1,
-0.2156896, 0.01090262, -0.7871386, 0, 1, 0.5450981, 1,
-0.2095663, -1.75604, -3.220127, 0, 1, 0.5490196, 1,
-0.2048244, -0.1947193, -2.595563, 0, 1, 0.5568628, 1,
-0.2033332, -0.5219857, -2.850446, 0, 1, 0.5607843, 1,
-0.2002583, -1.683218, -3.439033, 0, 1, 0.5686275, 1,
-0.197574, -0.2066531, -1.380222, 0, 1, 0.572549, 1,
-0.1970991, 0.211756, -0.5912137, 0, 1, 0.5803922, 1,
-0.1961145, -0.4295011, -2.483623, 0, 1, 0.5843138, 1,
-0.1936076, -1.191256, -2.602671, 0, 1, 0.5921569, 1,
-0.1925728, -0.1481122, -2.48928, 0, 1, 0.5960785, 1,
-0.1922268, -0.5408552, -3.739545, 0, 1, 0.6039216, 1,
-0.1889441, -1.88705, -3.328064, 0, 1, 0.6117647, 1,
-0.1824175, 1.304076, 1.253387, 0, 1, 0.6156863, 1,
-0.1802163, -1.75447, -4.028002, 0, 1, 0.6235294, 1,
-0.1789935, -0.2769698, -1.086495, 0, 1, 0.627451, 1,
-0.178043, -0.7361191, -2.270727, 0, 1, 0.6352941, 1,
-0.1754261, 1.463406, 0.4548943, 0, 1, 0.6392157, 1,
-0.1748048, 0.1898573, -0.3226323, 0, 1, 0.6470588, 1,
-0.1618364, -1.56485, -2.486902, 0, 1, 0.6509804, 1,
-0.161104, -1.051697, -3.104509, 0, 1, 0.6588235, 1,
-0.1496648, 0.2970305, -1.05118, 0, 1, 0.6627451, 1,
-0.1475276, -0.3698133, -2.894092, 0, 1, 0.6705883, 1,
-0.147445, -0.4006391, -3.384169, 0, 1, 0.6745098, 1,
-0.1452355, -0.8591751, -2.205329, 0, 1, 0.682353, 1,
-0.1447612, -0.3522269, -3.333159, 0, 1, 0.6862745, 1,
-0.1444655, -0.7221462, -3.688365, 0, 1, 0.6941177, 1,
-0.143228, 1.309516, -0.4518588, 0, 1, 0.7019608, 1,
-0.1382305, 1.624809, -0.1077329, 0, 1, 0.7058824, 1,
-0.1363172, -0.5233208, -1.105093, 0, 1, 0.7137255, 1,
-0.1347947, -1.140537, -4.609868, 0, 1, 0.7176471, 1,
-0.1291446, 0.1300275, -1.119686, 0, 1, 0.7254902, 1,
-0.1267209, 0.1034464, 0.3770296, 0, 1, 0.7294118, 1,
-0.117782, -0.283624, -3.276244, 0, 1, 0.7372549, 1,
-0.1174837, -0.6603507, -3.28015, 0, 1, 0.7411765, 1,
-0.1160078, -0.8302881, -3.789907, 0, 1, 0.7490196, 1,
-0.1138883, 0.1239924, -0.5705513, 0, 1, 0.7529412, 1,
-0.1136625, 1.147927, 0.8928233, 0, 1, 0.7607843, 1,
-0.1131641, -0.4264119, -1.973801, 0, 1, 0.7647059, 1,
-0.1127275, 1.057969, 0.3244131, 0, 1, 0.772549, 1,
-0.1089501, -1.415164, -4.648499, 0, 1, 0.7764706, 1,
-0.1085383, 0.1939202, -0.6649715, 0, 1, 0.7843137, 1,
-0.1074796, -0.9441367, -2.489843, 0, 1, 0.7882353, 1,
-0.1068009, -1.021306, -1.57783, 0, 1, 0.7960784, 1,
-0.1062366, 0.7322814, -0.8546848, 0, 1, 0.8039216, 1,
-0.1055282, -0.7835342, -1.030525, 0, 1, 0.8078431, 1,
-0.1047294, -1.069139, -2.274681, 0, 1, 0.8156863, 1,
-0.1003557, 0.2391705, 0.6884072, 0, 1, 0.8196079, 1,
-0.09955991, -0.2853178, -1.177811, 0, 1, 0.827451, 1,
-0.08609683, -0.033573, -3.023487, 0, 1, 0.8313726, 1,
-0.08435281, 0.7529921, -0.9241586, 0, 1, 0.8392157, 1,
-0.08341206, -0.6050619, -4.812312, 0, 1, 0.8431373, 1,
-0.0749649, -0.4955898, -4.123309, 0, 1, 0.8509804, 1,
-0.07488126, -0.1792493, -3.113631, 0, 1, 0.854902, 1,
-0.07021868, 0.9315345, 1.623996, 0, 1, 0.8627451, 1,
-0.06957716, -0.97663, -3.474321, 0, 1, 0.8666667, 1,
-0.06618609, 0.0543457, -0.8813754, 0, 1, 0.8745098, 1,
-0.06598905, 1.920221, 1.089408, 0, 1, 0.8784314, 1,
-0.06484767, 0.05039831, -0.7092585, 0, 1, 0.8862745, 1,
-0.06408499, -2.572879, -4.07162, 0, 1, 0.8901961, 1,
-0.06268889, -0.4364946, -0.51278, 0, 1, 0.8980392, 1,
-0.05809613, 0.7092131, -0.1564219, 0, 1, 0.9058824, 1,
-0.05757866, -0.7342072, -2.680063, 0, 1, 0.9098039, 1,
-0.05613107, 1.796525, -1.768386, 0, 1, 0.9176471, 1,
-0.05515989, 0.1127043, -0.3622971, 0, 1, 0.9215686, 1,
-0.05390139, -0.580937, -3.754958, 0, 1, 0.9294118, 1,
-0.05203886, -0.6488735, -4.001063, 0, 1, 0.9333333, 1,
-0.04873791, 0.8320134, 0.4030599, 0, 1, 0.9411765, 1,
-0.04682267, 2.401815, 0.1740739, 0, 1, 0.945098, 1,
-0.04633516, -0.4724954, -3.082897, 0, 1, 0.9529412, 1,
-0.04589476, 0.6639621, -1.050512, 0, 1, 0.9568627, 1,
-0.04383632, -0.940873, -3.94637, 0, 1, 0.9647059, 1,
-0.04186865, -0.4603194, -2.422625, 0, 1, 0.9686275, 1,
-0.0396917, -1.300582, -1.925727, 0, 1, 0.9764706, 1,
-0.03952936, -1.039493, -4.282063, 0, 1, 0.9803922, 1,
-0.03893376, -0.09300721, -3.33199, 0, 1, 0.9882353, 1,
-0.03496419, 0.2298256, -0.7493846, 0, 1, 0.9921569, 1,
-0.03012403, -1.659618, -3.266599, 0, 1, 1, 1,
-0.02817678, 1.488001, -0.8403879, 0, 0.9921569, 1, 1,
-0.02798809, -0.5083954, -2.382273, 0, 0.9882353, 1, 1,
-0.02682662, 1.339204, -1.587298, 0, 0.9803922, 1, 1,
-0.0246569, 0.6379417, 0.226933, 0, 0.9764706, 1, 1,
-0.02438634, -1.152338, -2.569333, 0, 0.9686275, 1, 1,
-0.01399177, 0.611662, -0.7428176, 0, 0.9647059, 1, 1,
-0.01296673, 1.58001, -0.3099894, 0, 0.9568627, 1, 1,
-0.01231679, -1.015606, -2.780838, 0, 0.9529412, 1, 1,
-0.009902961, 0.8486425, 0.8090783, 0, 0.945098, 1, 1,
-0.00738382, -1.697316, -2.203118, 0, 0.9411765, 1, 1,
-0.006247233, 0.6149114, 1.567921, 0, 0.9333333, 1, 1,
-0.006143169, -0.4410243, -1.367357, 0, 0.9294118, 1, 1,
-0.005269943, -0.2666728, -1.037703, 0, 0.9215686, 1, 1,
-0.004545508, -0.212813, -1.779363, 0, 0.9176471, 1, 1,
-0.002538936, 1.651559, 0.7890745, 0, 0.9098039, 1, 1,
-0.001961938, 1.347607, -3.035131, 0, 0.9058824, 1, 1,
-0.001324323, -0.2461903, -2.009682, 0, 0.8980392, 1, 1,
-0.0003365007, 0.2910402, -0.7803742, 0, 0.8901961, 1, 1,
0.00231971, -0.8968406, 3.339322, 0, 0.8862745, 1, 1,
0.003170073, 0.8983957, -0.3257411, 0, 0.8784314, 1, 1,
0.007284384, -0.8124036, 3.660146, 0, 0.8745098, 1, 1,
0.00840688, 0.681276, 1.191921, 0, 0.8666667, 1, 1,
0.01172544, 0.2617599, 0.714663, 0, 0.8627451, 1, 1,
0.01738762, 0.9390765, 0.4968341, 0, 0.854902, 1, 1,
0.02045284, 0.3925303, 0.3149856, 0, 0.8509804, 1, 1,
0.02081211, 0.7405897, 0.6157408, 0, 0.8431373, 1, 1,
0.02346199, -1.41868, 3.186293, 0, 0.8392157, 1, 1,
0.02369751, -3.086612, 3.851086, 0, 0.8313726, 1, 1,
0.02423189, 0.287029, -1.222714, 0, 0.827451, 1, 1,
0.0299258, -0.4301423, 3.055872, 0, 0.8196079, 1, 1,
0.03259328, 1.08822, -0.3996565, 0, 0.8156863, 1, 1,
0.03260358, 1.45813, 0.7263542, 0, 0.8078431, 1, 1,
0.03356307, -2.055428, 2.412112, 0, 0.8039216, 1, 1,
0.03529178, 0.5141857, 0.782636, 0, 0.7960784, 1, 1,
0.03734834, -0.4985746, 3.717167, 0, 0.7882353, 1, 1,
0.03903515, 1.167157, -0.5586858, 0, 0.7843137, 1, 1,
0.04673615, -0.5574276, 2.938799, 0, 0.7764706, 1, 1,
0.04885368, -0.4328344, 3.797051, 0, 0.772549, 1, 1,
0.0490156, 0.6533424, -0.09365614, 0, 0.7647059, 1, 1,
0.0564951, 0.3635015, 0.424961, 0, 0.7607843, 1, 1,
0.05892538, -1.918333, 3.033316, 0, 0.7529412, 1, 1,
0.05921764, 0.6005467, -0.8768889, 0, 0.7490196, 1, 1,
0.06495268, -0.3372124, 1.602596, 0, 0.7411765, 1, 1,
0.06649926, -0.3349418, 4.056737, 0, 0.7372549, 1, 1,
0.07074615, 0.8177156, 1.342388, 0, 0.7294118, 1, 1,
0.07087161, 0.2412385, 0.9501767, 0, 0.7254902, 1, 1,
0.0753141, -1.093468, 3.566855, 0, 0.7176471, 1, 1,
0.07682598, -0.4180323, 3.600187, 0, 0.7137255, 1, 1,
0.07883386, 0.401764, 0.7393786, 0, 0.7058824, 1, 1,
0.08159237, -0.8838251, 3.115909, 0, 0.6980392, 1, 1,
0.08583697, -0.6680447, 5.989897, 0, 0.6941177, 1, 1,
0.08593892, -1.110875, 1.767967, 0, 0.6862745, 1, 1,
0.08732522, 0.4646616, -0.2170304, 0, 0.682353, 1, 1,
0.08799165, 1.14369, -0.4522775, 0, 0.6745098, 1, 1,
0.0902335, 0.7188176, 0.3821554, 0, 0.6705883, 1, 1,
0.09115758, -0.0390088, 1.708311, 0, 0.6627451, 1, 1,
0.0939685, -0.3118252, 2.156526, 0, 0.6588235, 1, 1,
0.09516612, -0.1396842, 3.384496, 0, 0.6509804, 1, 1,
0.09805489, -0.893932, 3.19907, 0, 0.6470588, 1, 1,
0.1003019, -0.5869276, 3.087085, 0, 0.6392157, 1, 1,
0.1104114, -0.07163537, 2.224128, 0, 0.6352941, 1, 1,
0.114242, -1.267175, 2.651113, 0, 0.627451, 1, 1,
0.1202299, 1.170269, 0.9732967, 0, 0.6235294, 1, 1,
0.1224396, -0.2262403, 2.39618, 0, 0.6156863, 1, 1,
0.1225286, 0.2464235, 2.351823, 0, 0.6117647, 1, 1,
0.1238616, -1.442269, 3.502956, 0, 0.6039216, 1, 1,
0.1278731, -1.590538, 3.112162, 0, 0.5960785, 1, 1,
0.135362, -1.312114, 2.275472, 0, 0.5921569, 1, 1,
0.13817, -0.9574621, 4.210897, 0, 0.5843138, 1, 1,
0.138284, -0.2330815, 1.350154, 0, 0.5803922, 1, 1,
0.1407513, -1.177828, 4.467732, 0, 0.572549, 1, 1,
0.1439192, -0.7713004, 1.84373, 0, 0.5686275, 1, 1,
0.1462577, 0.4281581, 0.1447154, 0, 0.5607843, 1, 1,
0.1474176, 0.1301516, -0.5954401, 0, 0.5568628, 1, 1,
0.1476113, -1.764626, 2.783399, 0, 0.5490196, 1, 1,
0.1488522, -0.9871026, 4.4481, 0, 0.5450981, 1, 1,
0.1496416, -1.885956, 2.379124, 0, 0.5372549, 1, 1,
0.1580037, -0.3016078, 1.025116, 0, 0.5333334, 1, 1,
0.1594875, 1.380733, 1.457482, 0, 0.5254902, 1, 1,
0.1603351, -1.858362, 3.676111, 0, 0.5215687, 1, 1,
0.1618244, -0.9842193, 3.698326, 0, 0.5137255, 1, 1,
0.1628622, -0.4624534, 3.069648, 0, 0.509804, 1, 1,
0.1630429, 0.6864905, 1.115279, 0, 0.5019608, 1, 1,
0.1644208, -0.5536205, 3.415595, 0, 0.4941176, 1, 1,
0.1750557, 0.4416507, 0.4883672, 0, 0.4901961, 1, 1,
0.1821411, -1.141255, 1.951993, 0, 0.4823529, 1, 1,
0.1822082, 0.03898292, 1.715973, 0, 0.4784314, 1, 1,
0.1846859, 1.064647, 0.7653517, 0, 0.4705882, 1, 1,
0.1852085, 0.485597, 0.1605953, 0, 0.4666667, 1, 1,
0.1873562, 0.4061429, 0.7562426, 0, 0.4588235, 1, 1,
0.1903291, 0.7402819, -1.084955, 0, 0.454902, 1, 1,
0.1903795, -0.1464259, 2.020524, 0, 0.4470588, 1, 1,
0.1962737, 1.052163, -0.3905134, 0, 0.4431373, 1, 1,
0.1973731, 0.5416728, 0.9127035, 0, 0.4352941, 1, 1,
0.1993516, 0.4092372, -1.543242, 0, 0.4313726, 1, 1,
0.2035328, -1.000615, 4.233732, 0, 0.4235294, 1, 1,
0.2069421, 0.5426447, 0.2045113, 0, 0.4196078, 1, 1,
0.2074649, 0.8288613, -0.80074, 0, 0.4117647, 1, 1,
0.209814, -0.7727522, 3.843148, 0, 0.4078431, 1, 1,
0.2114174, -0.1301978, 2.971382, 0, 0.4, 1, 1,
0.2133059, 1.729328, -0.1686954, 0, 0.3921569, 1, 1,
0.2136046, 0.7173424, 1.953003, 0, 0.3882353, 1, 1,
0.2207394, -0.342175, 2.560107, 0, 0.3803922, 1, 1,
0.2214572, 1.476318, 2.128484, 0, 0.3764706, 1, 1,
0.2248821, -0.08291899, 0.6629708, 0, 0.3686275, 1, 1,
0.2249876, -1.809844, 3.930659, 0, 0.3647059, 1, 1,
0.2275459, -0.01942661, 1.899654, 0, 0.3568628, 1, 1,
0.2278025, -0.1690356, 2.527215, 0, 0.3529412, 1, 1,
0.2318853, -0.01736157, -1.024322, 0, 0.345098, 1, 1,
0.2361483, 0.3348943, 0.2019796, 0, 0.3411765, 1, 1,
0.24613, -0.07515909, 2.178603, 0, 0.3333333, 1, 1,
0.2606772, -1.329778, 3.009447, 0, 0.3294118, 1, 1,
0.2611044, -0.1010085, 1.750588, 0, 0.3215686, 1, 1,
0.2628443, -1.4343, 4.277362, 0, 0.3176471, 1, 1,
0.2684192, -0.2095648, 2.713481, 0, 0.3098039, 1, 1,
0.2727934, -0.4219825, 2.201699, 0, 0.3058824, 1, 1,
0.2748637, -1.371831, 2.682094, 0, 0.2980392, 1, 1,
0.2839189, 0.683018, -0.49797, 0, 0.2901961, 1, 1,
0.2892287, -0.30836, 3.163664, 0, 0.2862745, 1, 1,
0.291012, -2.050596, 2.222355, 0, 0.2784314, 1, 1,
0.2914501, -0.4669948, 2.907517, 0, 0.2745098, 1, 1,
0.2919458, -1.183479, 4.139846, 0, 0.2666667, 1, 1,
0.2920844, 1.123555, -0.7642025, 0, 0.2627451, 1, 1,
0.2934076, -0.0281361, 0.9670082, 0, 0.254902, 1, 1,
0.2981499, 0.177214, 0.2188249, 0, 0.2509804, 1, 1,
0.3029878, -0.5752005, 3.222538, 0, 0.2431373, 1, 1,
0.3044827, -0.8623667, 2.13793, 0, 0.2392157, 1, 1,
0.3056327, -0.1164623, 2.316079, 0, 0.2313726, 1, 1,
0.3062202, 1.007995, 1.561178, 0, 0.227451, 1, 1,
0.3062388, 0.27695, 0.7661635, 0, 0.2196078, 1, 1,
0.3065332, 0.2500678, 1.103343, 0, 0.2156863, 1, 1,
0.3085988, 2.239331, -0.4107884, 0, 0.2078431, 1, 1,
0.3094703, -0.2780653, 1.169499, 0, 0.2039216, 1, 1,
0.3103521, -1.982311, 3.344249, 0, 0.1960784, 1, 1,
0.3153819, -0.8209929, 2.416568, 0, 0.1882353, 1, 1,
0.315614, -0.480264, 1.72323, 0, 0.1843137, 1, 1,
0.3271253, -0.0056265, 1.304429, 0, 0.1764706, 1, 1,
0.3299897, 0.07975098, 1.323745, 0, 0.172549, 1, 1,
0.331663, -0.7790456, 2.687907, 0, 0.1647059, 1, 1,
0.332075, -0.4735128, 2.851459, 0, 0.1607843, 1, 1,
0.3328997, 0.7655793, 0.231987, 0, 0.1529412, 1, 1,
0.3345751, -1.723361, 3.436637, 0, 0.1490196, 1, 1,
0.3362733, 0.2867771, 2.609723, 0, 0.1411765, 1, 1,
0.3368655, 0.02360444, 1.665372, 0, 0.1372549, 1, 1,
0.3373814, -1.463595, 3.739854, 0, 0.1294118, 1, 1,
0.3395034, 0.3255462, 0.9872324, 0, 0.1254902, 1, 1,
0.3398362, -0.1397947, 1.1981, 0, 0.1176471, 1, 1,
0.3424443, -0.4082092, 3.088102, 0, 0.1137255, 1, 1,
0.3446005, 0.2991599, -0.1963343, 0, 0.1058824, 1, 1,
0.348811, -0.3477358, 2.587122, 0, 0.09803922, 1, 1,
0.3493893, 0.317649, 1.015799, 0, 0.09411765, 1, 1,
0.3610014, 2.581023, 0.1203185, 0, 0.08627451, 1, 1,
0.368007, 0.6560109, 1.789495, 0, 0.08235294, 1, 1,
0.371772, -0.2675049, 3.575035, 0, 0.07450981, 1, 1,
0.3902089, 0.296904, 1.334768, 0, 0.07058824, 1, 1,
0.3904422, -0.2138279, -0.1186003, 0, 0.0627451, 1, 1,
0.3977678, 0.2398269, 1.641495, 0, 0.05882353, 1, 1,
0.3982762, -0.3570414, 1.760658, 0, 0.05098039, 1, 1,
0.4002386, 0.3234149, 1.395413, 0, 0.04705882, 1, 1,
0.4005834, 0.3603692, -0.1648519, 0, 0.03921569, 1, 1,
0.4008151, 0.7974154, 0.7387862, 0, 0.03529412, 1, 1,
0.4017107, -0.5000743, 1.912075, 0, 0.02745098, 1, 1,
0.404876, 0.4413258, 0.07707313, 0, 0.02352941, 1, 1,
0.4065801, 0.3102753, 0.7241302, 0, 0.01568628, 1, 1,
0.4073295, 1.032697, 1.999529, 0, 0.01176471, 1, 1,
0.4080589, 0.04983287, 1.505826, 0, 0.003921569, 1, 1,
0.4088831, -3.703931, 1.102257, 0.003921569, 0, 1, 1,
0.4107726, -0.8784981, 2.478955, 0.007843138, 0, 1, 1,
0.4139619, 0.3427581, 0.7195986, 0.01568628, 0, 1, 1,
0.4156855, 0.2433752, 0.2732367, 0.01960784, 0, 1, 1,
0.4173304, -0.3297197, 2.340017, 0.02745098, 0, 1, 1,
0.4176715, -0.1357169, 2.521006, 0.03137255, 0, 1, 1,
0.4244646, -0.2222921, 0.4710105, 0.03921569, 0, 1, 1,
0.4259279, -0.6449939, 3.358922, 0.04313726, 0, 1, 1,
0.4259348, -1.243211, 2.385055, 0.05098039, 0, 1, 1,
0.4288489, -1.276959, 3.236928, 0.05490196, 0, 1, 1,
0.4350265, -1.082681, 1.586397, 0.0627451, 0, 1, 1,
0.4461334, 3.119114, -0.3316952, 0.06666667, 0, 1, 1,
0.4469167, 0.2604727, 0.1851697, 0.07450981, 0, 1, 1,
0.4485798, -0.3748212, 1.243431, 0.07843138, 0, 1, 1,
0.4511768, -0.2191203, 1.906842, 0.08627451, 0, 1, 1,
0.4513961, -1.476872, 1.635524, 0.09019608, 0, 1, 1,
0.4530119, -0.6879103, 1.879363, 0.09803922, 0, 1, 1,
0.4559243, 0.7682536, -0.1497254, 0.1058824, 0, 1, 1,
0.456428, -0.345986, 1.324865, 0.1098039, 0, 1, 1,
0.4594935, -0.9418009, 0.4801543, 0.1176471, 0, 1, 1,
0.4595476, 0.7772376, 0.9712286, 0.1215686, 0, 1, 1,
0.4609964, 0.9483535, 0.5039794, 0.1294118, 0, 1, 1,
0.4620983, -0.4808953, 2.539731, 0.1333333, 0, 1, 1,
0.4639459, 0.3463155, 1.550055, 0.1411765, 0, 1, 1,
0.4678937, 0.2534563, 2.825787, 0.145098, 0, 1, 1,
0.4692729, -0.4459378, 4.62993, 0.1529412, 0, 1, 1,
0.4707052, 1.106769, -1.277603, 0.1568628, 0, 1, 1,
0.4708236, -0.6878951, 1.615511, 0.1647059, 0, 1, 1,
0.4825066, 0.1814592, 1.263051, 0.1686275, 0, 1, 1,
0.4872424, -1.687219, 0.666091, 0.1764706, 0, 1, 1,
0.4878944, -0.4450467, 4.295584, 0.1803922, 0, 1, 1,
0.4885101, -0.2039447, 0.8507408, 0.1882353, 0, 1, 1,
0.4892561, -2.577635, 3.986469, 0.1921569, 0, 1, 1,
0.4900804, 2.023545, 0.7661929, 0.2, 0, 1, 1,
0.4948869, 0.004963294, 2.299973, 0.2078431, 0, 1, 1,
0.4962946, -0.9899689, 2.027458, 0.2117647, 0, 1, 1,
0.49669, 0.391084, 1.174674, 0.2196078, 0, 1, 1,
0.5067853, 1.844715, -1.637583, 0.2235294, 0, 1, 1,
0.5082459, -1.791459, 1.96801, 0.2313726, 0, 1, 1,
0.5111296, 1.215071, -0.3127878, 0.2352941, 0, 1, 1,
0.5146263, -0.4852046, 1.510082, 0.2431373, 0, 1, 1,
0.514874, 1.717543, -0.5152977, 0.2470588, 0, 1, 1,
0.5174911, -0.2869793, 2.041352, 0.254902, 0, 1, 1,
0.5355904, -0.8871399, 0.871636, 0.2588235, 0, 1, 1,
0.5365579, 0.291243, 0.3995027, 0.2666667, 0, 1, 1,
0.54056, 1.256917, 2.343777, 0.2705882, 0, 1, 1,
0.5464054, 0.3885751, 2.097813, 0.2784314, 0, 1, 1,
0.5477536, 2.597617, 0.5812091, 0.282353, 0, 1, 1,
0.5492238, -0.4611879, 3.196464, 0.2901961, 0, 1, 1,
0.5513715, -0.1919865, 1.015588, 0.2941177, 0, 1, 1,
0.5528969, 0.07739946, 1.704118, 0.3019608, 0, 1, 1,
0.5543414, 0.09156691, 2.371876, 0.3098039, 0, 1, 1,
0.554527, 0.08541289, 0.9148835, 0.3137255, 0, 1, 1,
0.5565175, -2.022052, 3.035592, 0.3215686, 0, 1, 1,
0.5581173, 1.0382, -0.6328673, 0.3254902, 0, 1, 1,
0.5594325, -0.2253195, 1.316185, 0.3333333, 0, 1, 1,
0.5604978, -0.4662296, 3.201221, 0.3372549, 0, 1, 1,
0.561847, 1.111856, 1.544557, 0.345098, 0, 1, 1,
0.5651675, 0.03885693, 2.036215, 0.3490196, 0, 1, 1,
0.5658385, -1.190803, 3.685316, 0.3568628, 0, 1, 1,
0.5700174, -3.324082, 3.185311, 0.3607843, 0, 1, 1,
0.5704614, 0.8656975, 0.9412691, 0.3686275, 0, 1, 1,
0.5719866, 1.305667, -0.4060508, 0.372549, 0, 1, 1,
0.5773014, 0.8848467, 0.8067446, 0.3803922, 0, 1, 1,
0.5844152, -0.5535612, 3.23708, 0.3843137, 0, 1, 1,
0.5851243, 0.6104661, 1.048982, 0.3921569, 0, 1, 1,
0.5857038, 0.7348969, 0.5849696, 0.3960784, 0, 1, 1,
0.5863874, -1.854105, 3.07067, 0.4039216, 0, 1, 1,
0.5885527, -2.250585, 2.294136, 0.4117647, 0, 1, 1,
0.6031417, 0.8730584, -0.9990587, 0.4156863, 0, 1, 1,
0.6039909, -0.2720097, -0.6540541, 0.4235294, 0, 1, 1,
0.6053957, -1.058802, 1.808374, 0.427451, 0, 1, 1,
0.6061757, -1.509809, 3.418969, 0.4352941, 0, 1, 1,
0.6072261, -0.6533258, 0.8669901, 0.4392157, 0, 1, 1,
0.608281, -0.5296272, 3.755915, 0.4470588, 0, 1, 1,
0.6104044, 0.4035187, 2.110789, 0.4509804, 0, 1, 1,
0.6141717, 0.9711098, 0.421134, 0.4588235, 0, 1, 1,
0.6149942, -0.6876497, 2.255824, 0.4627451, 0, 1, 1,
0.6160427, 0.2132786, 1.648423, 0.4705882, 0, 1, 1,
0.6172003, 0.9872028, 1.057302, 0.4745098, 0, 1, 1,
0.6205365, 0.8267214, 0.8192921, 0.4823529, 0, 1, 1,
0.6245829, -1.365337, 2.012246, 0.4862745, 0, 1, 1,
0.6268888, 1.615091, 1.337029, 0.4941176, 0, 1, 1,
0.632054, 0.5040923, 1.592717, 0.5019608, 0, 1, 1,
0.6325921, -1.082229, 2.973918, 0.5058824, 0, 1, 1,
0.6338361, -0.5129049, 1.463181, 0.5137255, 0, 1, 1,
0.6357616, 0.671434, 1.038217, 0.5176471, 0, 1, 1,
0.6362091, -1.248311, 2.618203, 0.5254902, 0, 1, 1,
0.6362401, 0.8501393, 2.96265, 0.5294118, 0, 1, 1,
0.6363434, -0.2186234, 1.572894, 0.5372549, 0, 1, 1,
0.6389953, -1.810395, 2.524712, 0.5411765, 0, 1, 1,
0.6465412, 0.6297855, 1.698748, 0.5490196, 0, 1, 1,
0.6506295, -0.1618171, 1.404533, 0.5529412, 0, 1, 1,
0.6506478, 2.179087, -0.217734, 0.5607843, 0, 1, 1,
0.6523532, -1.03102, 2.284039, 0.5647059, 0, 1, 1,
0.6530378, -1.107233, 2.478352, 0.572549, 0, 1, 1,
0.6581937, -0.4394763, 2.02813, 0.5764706, 0, 1, 1,
0.6607856, 2.069296, 2.153637, 0.5843138, 0, 1, 1,
0.6648492, -1.089162, 3.112096, 0.5882353, 0, 1, 1,
0.6653927, -0.09677162, 2.08497, 0.5960785, 0, 1, 1,
0.6686069, -0.8076862, 3.056468, 0.6039216, 0, 1, 1,
0.6749305, -1.54504, 2.167039, 0.6078432, 0, 1, 1,
0.6771557, 0.3705591, 1.879209, 0.6156863, 0, 1, 1,
0.6775935, -0.5186661, 3.932501, 0.6196079, 0, 1, 1,
0.6795658, -0.3926049, 1.304154, 0.627451, 0, 1, 1,
0.6797776, 0.07661611, 2.036087, 0.6313726, 0, 1, 1,
0.6844428, -0.9289417, 3.625444, 0.6392157, 0, 1, 1,
0.6889524, 1.181258, 1.187514, 0.6431373, 0, 1, 1,
0.6897809, 1.700287, 0.3689712, 0.6509804, 0, 1, 1,
0.6970937, 0.1107581, 0.07240415, 0.654902, 0, 1, 1,
0.6982076, -1.483191, 3.63305, 0.6627451, 0, 1, 1,
0.7044089, -1.995959, 2.206617, 0.6666667, 0, 1, 1,
0.7054439, 1.639085, -0.6190504, 0.6745098, 0, 1, 1,
0.7059513, 0.6464017, -0.1123666, 0.6784314, 0, 1, 1,
0.7123832, -0.08658908, 1.570576, 0.6862745, 0, 1, 1,
0.7198297, 0.02420074, -0.4677704, 0.6901961, 0, 1, 1,
0.7210572, -1.032631, 2.015051, 0.6980392, 0, 1, 1,
0.7284303, -0.3061191, 0.346507, 0.7058824, 0, 1, 1,
0.7285607, -1.54829, 3.648116, 0.7098039, 0, 1, 1,
0.7404453, 2.052842, 1.330526, 0.7176471, 0, 1, 1,
0.7407674, -1.252639, 3.383392, 0.7215686, 0, 1, 1,
0.7439343, 0.1275467, 1.699911, 0.7294118, 0, 1, 1,
0.7461202, 0.1886234, 0.7648256, 0.7333333, 0, 1, 1,
0.7481155, 0.5554812, 0.7758025, 0.7411765, 0, 1, 1,
0.7501186, -0.2949531, 1.638149, 0.7450981, 0, 1, 1,
0.7513344, -0.869904, 2.613637, 0.7529412, 0, 1, 1,
0.7533201, 0.8960571, 0.02862019, 0.7568628, 0, 1, 1,
0.753859, 0.1762146, -0.3906784, 0.7647059, 0, 1, 1,
0.7541147, -1.228227, 1.004835, 0.7686275, 0, 1, 1,
0.7590662, -0.5207403, 2.202378, 0.7764706, 0, 1, 1,
0.7636814, -0.5377287, 0.9298767, 0.7803922, 0, 1, 1,
0.7646827, 0.6105406, 1.607043, 0.7882353, 0, 1, 1,
0.7650484, 1.399994, -0.5465764, 0.7921569, 0, 1, 1,
0.7787309, 1.414149, -0.4775633, 0.8, 0, 1, 1,
0.7794782, 0.3149168, 1.986689, 0.8078431, 0, 1, 1,
0.7828663, -0.3251695, 3.302416, 0.8117647, 0, 1, 1,
0.7845525, -0.116114, 0.357488, 0.8196079, 0, 1, 1,
0.7881131, -0.08171772, 1.973081, 0.8235294, 0, 1, 1,
0.7889751, -1.432186, 0.6289356, 0.8313726, 0, 1, 1,
0.7961519, 1.241639, 1.534987, 0.8352941, 0, 1, 1,
0.7995025, 0.7655168, 1.156924, 0.8431373, 0, 1, 1,
0.8028763, -0.8769396, 1.937322, 0.8470588, 0, 1, 1,
0.8031987, 1.142637, 0.979943, 0.854902, 0, 1, 1,
0.811412, 0.01604593, 2.439775, 0.8588235, 0, 1, 1,
0.8136044, -0.7266385, 3.74115, 0.8666667, 0, 1, 1,
0.8161672, 1.518048, 1.411236, 0.8705882, 0, 1, 1,
0.818675, 0.6717199, 1.816086, 0.8784314, 0, 1, 1,
0.8226408, -0.05670039, 2.665117, 0.8823529, 0, 1, 1,
0.8327665, -0.7469516, 1.362831, 0.8901961, 0, 1, 1,
0.8381507, 0.1864632, -0.3041804, 0.8941177, 0, 1, 1,
0.8382127, 0.2056994, 0.6712965, 0.9019608, 0, 1, 1,
0.8452561, -0.4271375, -0.4450416, 0.9098039, 0, 1, 1,
0.8488261, -0.0860433, 1.863862, 0.9137255, 0, 1, 1,
0.8503037, 1.394679, 1.401954, 0.9215686, 0, 1, 1,
0.8522853, -0.3643815, 0.421099, 0.9254902, 0, 1, 1,
0.8578207, -0.6229051, 2.00579, 0.9333333, 0, 1, 1,
0.8578328, -0.004797769, -0.02772055, 0.9372549, 0, 1, 1,
0.8653334, 0.5980646, 1.828977, 0.945098, 0, 1, 1,
0.8685395, -1.242169, 1.380763, 0.9490196, 0, 1, 1,
0.8862222, 0.7645323, 0.6120722, 0.9568627, 0, 1, 1,
0.8877491, -0.4207116, 2.678238, 0.9607843, 0, 1, 1,
0.889532, 0.2968513, 1.277545, 0.9686275, 0, 1, 1,
0.8909411, 1.66126, 1.626067, 0.972549, 0, 1, 1,
0.8920419, -1.241814, 3.033276, 0.9803922, 0, 1, 1,
0.9003484, 2.084995, 0.3360802, 0.9843137, 0, 1, 1,
0.904583, 0.6053268, 0.09148626, 0.9921569, 0, 1, 1,
0.9108471, 0.1474665, -1.612293, 0.9960784, 0, 1, 1,
0.9157246, -1.284247, 2.394715, 1, 0, 0.9960784, 1,
0.9159881, 0.4179932, 2.743179, 1, 0, 0.9882353, 1,
0.9162056, 0.416523, 0.07506043, 1, 0, 0.9843137, 1,
0.9176419, -1.249376, 3.141071, 1, 0, 0.9764706, 1,
0.920768, 1.545352, 1.907007, 1, 0, 0.972549, 1,
0.9229731, 1.22551, 3.968804, 1, 0, 0.9647059, 1,
0.9255049, 0.7501466, 0.833533, 1, 0, 0.9607843, 1,
0.9353402, 0.4000845, 0.7686608, 1, 0, 0.9529412, 1,
0.9384518, -1.449255, 3.423053, 1, 0, 0.9490196, 1,
0.9402015, 0.3739512, 1.783015, 1, 0, 0.9411765, 1,
0.9428566, -0.01034888, 1.779026, 1, 0, 0.9372549, 1,
0.9433671, -0.8531902, 2.079404, 1, 0, 0.9294118, 1,
0.9450424, -0.4600442, 2.345295, 1, 0, 0.9254902, 1,
0.9521646, -0.5813448, 1.189132, 1, 0, 0.9176471, 1,
0.9562905, -0.5186892, 2.213067, 1, 0, 0.9137255, 1,
0.9581218, 1.263259, 0.6906586, 1, 0, 0.9058824, 1,
0.9608021, -0.1039278, 0.9896131, 1, 0, 0.9019608, 1,
0.9613181, -0.5315023, 3.712359, 1, 0, 0.8941177, 1,
0.963582, -0.8421006, 2.014441, 1, 0, 0.8862745, 1,
0.9641978, -0.4156046, 3.183794, 1, 0, 0.8823529, 1,
0.9662419, 1.12426, -0.1193723, 1, 0, 0.8745098, 1,
0.966523, 0.8730322, 2.875774, 1, 0, 0.8705882, 1,
0.9667688, -1.220909, 2.70048, 1, 0, 0.8627451, 1,
0.9731119, -0.8542912, 2.453655, 1, 0, 0.8588235, 1,
0.9735932, 1.34146, 1.113271, 1, 0, 0.8509804, 1,
0.9748455, -0.1268394, 2.049829, 1, 0, 0.8470588, 1,
0.9763616, 1.341417, 0.5820193, 1, 0, 0.8392157, 1,
0.9771299, -0.684641, 3.597282, 1, 0, 0.8352941, 1,
0.9800985, 1.14178, 0.3813054, 1, 0, 0.827451, 1,
0.9815598, -1.450165, 0.1047127, 1, 0, 0.8235294, 1,
0.9818723, 0.9982944, 0.2929133, 1, 0, 0.8156863, 1,
0.9916552, -0.2254811, 1.368237, 1, 0, 0.8117647, 1,
1.019806, -1.453554, 1.406824, 1, 0, 0.8039216, 1,
1.031612, -1.289197, 2.102768, 1, 0, 0.7960784, 1,
1.033105, 1.369358, 1.389455, 1, 0, 0.7921569, 1,
1.035752, 0.3426898, 0.7437028, 1, 0, 0.7843137, 1,
1.041139, -0.8492688, 3.45893, 1, 0, 0.7803922, 1,
1.04454, 1.352197, 0.5010012, 1, 0, 0.772549, 1,
1.06381, 0.5219687, 2.034765, 1, 0, 0.7686275, 1,
1.06506, 0.5160092, -0.3317246, 1, 0, 0.7607843, 1,
1.067145, -1.194401, 0.5498923, 1, 0, 0.7568628, 1,
1.07009, -2.548124, 3.973111, 1, 0, 0.7490196, 1,
1.07237, -0.9101887, 0.9693721, 1, 0, 0.7450981, 1,
1.08102, 0.7849446, 0.3281121, 1, 0, 0.7372549, 1,
1.086674, -0.6730562, 2.804013, 1, 0, 0.7333333, 1,
1.089019, -0.05038704, 1.667727, 1, 0, 0.7254902, 1,
1.094843, 0.03485667, 2.72368, 1, 0, 0.7215686, 1,
1.094862, -0.8205432, 2.418267, 1, 0, 0.7137255, 1,
1.104316, -0.8443108, 0.7796522, 1, 0, 0.7098039, 1,
1.111259, 1.583724, 1.801172, 1, 0, 0.7019608, 1,
1.122027, 0.6608172, 0.7509571, 1, 0, 0.6941177, 1,
1.126684, 0.1828695, 1.943321, 1, 0, 0.6901961, 1,
1.142853, -0.1433989, 0.851772, 1, 0, 0.682353, 1,
1.163804, 0.9967724, 0.829766, 1, 0, 0.6784314, 1,
1.165152, -0.6482972, -0.4113194, 1, 0, 0.6705883, 1,
1.167192, -0.5245231, 1.719738, 1, 0, 0.6666667, 1,
1.182682, 0.2495381, 1.091021, 1, 0, 0.6588235, 1,
1.183425, -0.07976726, 1.977467, 1, 0, 0.654902, 1,
1.184999, -0.7125067, 2.672413, 1, 0, 0.6470588, 1,
1.186323, 0.4790592, 1.932006, 1, 0, 0.6431373, 1,
1.215106, -1.078044, 0.09356482, 1, 0, 0.6352941, 1,
1.220197, -0.2139127, 1.126553, 1, 0, 0.6313726, 1,
1.221131, -1.014157, 2.467514, 1, 0, 0.6235294, 1,
1.22165, -0.105463, 1.303897, 1, 0, 0.6196079, 1,
1.225671, -0.3907326, 1.119214, 1, 0, 0.6117647, 1,
1.234026, 0.6196242, 0.1032839, 1, 0, 0.6078432, 1,
1.241001, -0.8121203, 1.475345, 1, 0, 0.6, 1,
1.241498, -0.7511305, 1.880085, 1, 0, 0.5921569, 1,
1.264793, -0.7007594, 0.397098, 1, 0, 0.5882353, 1,
1.268842, -0.6416152, 2.59222, 1, 0, 0.5803922, 1,
1.272058, 0.6124282, 1.320048, 1, 0, 0.5764706, 1,
1.276807, -1.192124, 0.7446296, 1, 0, 0.5686275, 1,
1.278217, -1.14974, 1.726648, 1, 0, 0.5647059, 1,
1.278467, 0.2172068, 1.593847, 1, 0, 0.5568628, 1,
1.286336, 0.9828255, 1.470536, 1, 0, 0.5529412, 1,
1.288394, 0.6123931, 2.629589, 1, 0, 0.5450981, 1,
1.300815, 0.5439027, -0.5737193, 1, 0, 0.5411765, 1,
1.303572, -0.0111629, 2.322336, 1, 0, 0.5333334, 1,
1.311313, -1.274634, 0.2879416, 1, 0, 0.5294118, 1,
1.312597, 0.07132212, 0.5932945, 1, 0, 0.5215687, 1,
1.313855, -1.519408, 1.846525, 1, 0, 0.5176471, 1,
1.318751, 0.3224475, -0.3699815, 1, 0, 0.509804, 1,
1.3489, 0.9978251, 1.930332, 1, 0, 0.5058824, 1,
1.367516, -0.4767711, 1.767146, 1, 0, 0.4980392, 1,
1.369172, 0.9098382, 1.69292, 1, 0, 0.4901961, 1,
1.370368, -0.7997639, 2.391865, 1, 0, 0.4862745, 1,
1.377833, -0.7079203, 2.602779, 1, 0, 0.4784314, 1,
1.397526, -0.0141356, 1.827301, 1, 0, 0.4745098, 1,
1.399927, 1.13742, -0.2169875, 1, 0, 0.4666667, 1,
1.40258, 1.36891, 0.3529105, 1, 0, 0.4627451, 1,
1.411747, -1.387246, 3.815043, 1, 0, 0.454902, 1,
1.417188, 0.5025812, 0.123688, 1, 0, 0.4509804, 1,
1.429252, -0.01771051, 0.5430554, 1, 0, 0.4431373, 1,
1.431991, 0.07613204, 1.899698, 1, 0, 0.4392157, 1,
1.432903, -0.04207204, 1.150858, 1, 0, 0.4313726, 1,
1.43849, -1.174773, 3.806117, 1, 0, 0.427451, 1,
1.44427, -0.6095859, 2.599467, 1, 0, 0.4196078, 1,
1.446333, -0.1601775, 1.141516, 1, 0, 0.4156863, 1,
1.446678, 1.264736, -0.6157749, 1, 0, 0.4078431, 1,
1.456572, 0.8605987, 2.565257, 1, 0, 0.4039216, 1,
1.480204, 1.299561, -0.2531403, 1, 0, 0.3960784, 1,
1.487159, -0.9113962, 1.692167, 1, 0, 0.3882353, 1,
1.497044, -0.2880689, 2.126259, 1, 0, 0.3843137, 1,
1.514894, -0.07902244, 1.708598, 1, 0, 0.3764706, 1,
1.518243, 0.2044583, 1.06167, 1, 0, 0.372549, 1,
1.51851, 0.9853439, 0.3047058, 1, 0, 0.3647059, 1,
1.523657, 0.9664161, 0.9679445, 1, 0, 0.3607843, 1,
1.531689, 1.374113, 0.1495446, 1, 0, 0.3529412, 1,
1.534433, -0.2327265, 0.7826401, 1, 0, 0.3490196, 1,
1.54717, 1.557105, 0.7575217, 1, 0, 0.3411765, 1,
1.548459, -0.3616584, 1.547079, 1, 0, 0.3372549, 1,
1.553565, -1.002653, 3.210325, 1, 0, 0.3294118, 1,
1.556256, 0.3078825, 1.729612, 1, 0, 0.3254902, 1,
1.559228, 1.215308, 1.156004, 1, 0, 0.3176471, 1,
1.565257, 0.01060776, 0.03108174, 1, 0, 0.3137255, 1,
1.580271, 0.5671853, 0.702842, 1, 0, 0.3058824, 1,
1.597219, -0.07168669, 0.9214818, 1, 0, 0.2980392, 1,
1.603299, 0.2387268, 0.3642889, 1, 0, 0.2941177, 1,
1.605913, 0.02517591, 2.665056, 1, 0, 0.2862745, 1,
1.621411, -0.7146373, -0.3439154, 1, 0, 0.282353, 1,
1.631436, -2.329665, 4.037082, 1, 0, 0.2745098, 1,
1.658162, 0.7416915, -0.3904694, 1, 0, 0.2705882, 1,
1.659232, 0.8969356, 0.3326727, 1, 0, 0.2627451, 1,
1.681408, -2.805124, 0.4692875, 1, 0, 0.2588235, 1,
1.692272, -0.2106089, 1.308782, 1, 0, 0.2509804, 1,
1.724919, 0.5294425, -1.082184, 1, 0, 0.2470588, 1,
1.752403, 1.35752, 0.4726843, 1, 0, 0.2392157, 1,
1.762127, 0.4290449, 2.319573, 1, 0, 0.2352941, 1,
1.791126, -0.9828911, -0.5357872, 1, 0, 0.227451, 1,
1.807688, 1.959245, 1.332088, 1, 0, 0.2235294, 1,
1.811338, -0.5735968, 1.384999, 1, 0, 0.2156863, 1,
1.811661, 0.03271037, 1.070205, 1, 0, 0.2117647, 1,
1.823577, -2.630428, 4.070284, 1, 0, 0.2039216, 1,
1.836041, -0.7031216, 3.898816, 1, 0, 0.1960784, 1,
1.840458, 1.028323, 2.182575, 1, 0, 0.1921569, 1,
1.847108, -1.568443, 1.891362, 1, 0, 0.1843137, 1,
1.849967, 0.9745094, 0.4177888, 1, 0, 0.1803922, 1,
1.858113, -0.859549, 1.112767, 1, 0, 0.172549, 1,
1.880057, 0.1901658, 0.589601, 1, 0, 0.1686275, 1,
1.881382, 0.02283743, -0.4885094, 1, 0, 0.1607843, 1,
1.904728, 0.6268794, 1.658704, 1, 0, 0.1568628, 1,
1.906436, 1.763095, -0.2540164, 1, 0, 0.1490196, 1,
1.931445, 1.208099, -0.879289, 1, 0, 0.145098, 1,
1.940236, -1.523779, 0.1460479, 1, 0, 0.1372549, 1,
1.945645, -0.657162, 3.173541, 1, 0, 0.1333333, 1,
1.966127, 0.2715853, 0.7125745, 1, 0, 0.1254902, 1,
2.014657, 0.8480124, 1.09606, 1, 0, 0.1215686, 1,
2.018899, -0.7109566, 2.474583, 1, 0, 0.1137255, 1,
2.034636, -0.2242881, 0.1951822, 1, 0, 0.1098039, 1,
2.061437, -0.7596989, 0.7770612, 1, 0, 0.1019608, 1,
2.063123, -0.905595, 4.015009, 1, 0, 0.09411765, 1,
2.126348, -0.9789675, 2.071063, 1, 0, 0.09019608, 1,
2.127264, 0.4491314, 0.4016731, 1, 0, 0.08235294, 1,
2.144447, 0.120274, 1.339347, 1, 0, 0.07843138, 1,
2.182235, 0.6162916, 1.294694, 1, 0, 0.07058824, 1,
2.211509, -0.009441581, 0.723789, 1, 0, 0.06666667, 1,
2.225977, -0.446614, 1.903731, 1, 0, 0.05882353, 1,
2.242942, -0.02804335, 2.618595, 1, 0, 0.05490196, 1,
2.318548, 0.3885292, 0.495123, 1, 0, 0.04705882, 1,
2.411944, -0.5720552, 2.66741, 1, 0, 0.04313726, 1,
2.653067, 0.7393182, 0.476645, 1, 0, 0.03529412, 1,
2.70864, -2.355416, 2.334447, 1, 0, 0.03137255, 1,
2.790622, 0.5166926, 1.717385, 1, 0, 0.02352941, 1,
2.873472, -0.671321, 3.431145, 1, 0, 0.01960784, 1,
2.935352, -1.347941, 2.454691, 1, 0, 0.01176471, 1,
3.325563, 1.419101, 0.2755754, 1, 0, 0.007843138, 1
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
-0.07282972, -4.867595, -6.643287, 0, -0.5, 0.5, 0.5,
-0.07282972, -4.867595, -6.643287, 1, -0.5, 0.5, 0.5,
-0.07282972, -4.867595, -6.643287, 1, 1.5, 0.5, 0.5,
-0.07282972, -4.867595, -6.643287, 0, 1.5, 0.5, 0.5
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
-4.623277, -0.271295, -6.643287, 0, -0.5, 0.5, 0.5,
-4.623277, -0.271295, -6.643287, 1, -0.5, 0.5, 0.5,
-4.623277, -0.271295, -6.643287, 1, 1.5, 0.5, 0.5,
-4.623277, -0.271295, -6.643287, 0, 1.5, 0.5, 0.5
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
-4.623277, -4.867595, 0.5887923, 0, -0.5, 0.5, 0.5,
-4.623277, -4.867595, 0.5887923, 1, -0.5, 0.5, 0.5,
-4.623277, -4.867595, 0.5887923, 1, 1.5, 0.5, 0.5,
-4.623277, -4.867595, 0.5887923, 0, 1.5, 0.5, 0.5
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
-3, -3.80691, -4.974345,
3, -3.80691, -4.974345,
-3, -3.80691, -4.974345,
-3, -3.983691, -5.252502,
-2, -3.80691, -4.974345,
-2, -3.983691, -5.252502,
-1, -3.80691, -4.974345,
-1, -3.983691, -5.252502,
0, -3.80691, -4.974345,
0, -3.983691, -5.252502,
1, -3.80691, -4.974345,
1, -3.983691, -5.252502,
2, -3.80691, -4.974345,
2, -3.983691, -5.252502,
3, -3.80691, -4.974345,
3, -3.983691, -5.252502
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
-3, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
-3, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
-3, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
-3, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
-2, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
-2, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
-2, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
-2, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
-1, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
-1, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
-1, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
-1, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
0, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
0, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
0, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
0, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
1, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
1, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
1, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
1, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
2, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
2, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
2, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
2, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5,
3, -4.337253, -5.808816, 0, -0.5, 0.5, 0.5,
3, -4.337253, -5.808816, 1, -0.5, 0.5, 0.5,
3, -4.337253, -5.808816, 1, 1.5, 0.5, 0.5,
3, -4.337253, -5.808816, 0, 1.5, 0.5, 0.5
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
-3.573174, -3, -4.974345,
-3.573174, 3, -4.974345,
-3.573174, -3, -4.974345,
-3.748191, -3, -5.252502,
-3.573174, -2, -4.974345,
-3.748191, -2, -5.252502,
-3.573174, -1, -4.974345,
-3.748191, -1, -5.252502,
-3.573174, 0, -4.974345,
-3.748191, 0, -5.252502,
-3.573174, 1, -4.974345,
-3.748191, 1, -5.252502,
-3.573174, 2, -4.974345,
-3.748191, 2, -5.252502,
-3.573174, 3, -4.974345,
-3.748191, 3, -5.252502
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
-4.098226, -3, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, -3, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, -3, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, -3, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, -2, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, -2, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, -2, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, -2, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, -1, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, -1, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, -1, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, -1, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, 0, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, 0, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, 0, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, 0, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, 1, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, 1, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, 1, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, 1, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, 2, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, 2, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, 2, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, 2, -5.808816, 0, 1.5, 0.5, 0.5,
-4.098226, 3, -5.808816, 0, -0.5, 0.5, 0.5,
-4.098226, 3, -5.808816, 1, -0.5, 0.5, 0.5,
-4.098226, 3, -5.808816, 1, 1.5, 0.5, 0.5,
-4.098226, 3, -5.808816, 0, 1.5, 0.5, 0.5
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
-3.573174, -3.80691, -4,
-3.573174, -3.80691, 4,
-3.573174, -3.80691, -4,
-3.748191, -3.983691, -4,
-3.573174, -3.80691, -2,
-3.748191, -3.983691, -2,
-3.573174, -3.80691, 0,
-3.748191, -3.983691, 0,
-3.573174, -3.80691, 2,
-3.748191, -3.983691, 2,
-3.573174, -3.80691, 4,
-3.748191, -3.983691, 4
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
-4.098226, -4.337253, -4, 0, -0.5, 0.5, 0.5,
-4.098226, -4.337253, -4, 1, -0.5, 0.5, 0.5,
-4.098226, -4.337253, -4, 1, 1.5, 0.5, 0.5,
-4.098226, -4.337253, -4, 0, 1.5, 0.5, 0.5,
-4.098226, -4.337253, -2, 0, -0.5, 0.5, 0.5,
-4.098226, -4.337253, -2, 1, -0.5, 0.5, 0.5,
-4.098226, -4.337253, -2, 1, 1.5, 0.5, 0.5,
-4.098226, -4.337253, -2, 0, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 0, 0, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 0, 1, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 0, 1, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 0, 0, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 2, 0, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 2, 1, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 2, 1, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 2, 0, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 4, 0, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 4, 1, -0.5, 0.5, 0.5,
-4.098226, -4.337253, 4, 1, 1.5, 0.5, 0.5,
-4.098226, -4.337253, 4, 0, 1.5, 0.5, 0.5
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
-3.573174, -3.80691, -4.974345,
-3.573174, 3.26432, -4.974345,
-3.573174, -3.80691, 6.15193,
-3.573174, 3.26432, 6.15193,
-3.573174, -3.80691, -4.974345,
-3.573174, -3.80691, 6.15193,
-3.573174, 3.26432, -4.974345,
-3.573174, 3.26432, 6.15193,
-3.573174, -3.80691, -4.974345,
3.427515, -3.80691, -4.974345,
-3.573174, -3.80691, 6.15193,
3.427515, -3.80691, 6.15193,
-3.573174, 3.26432, -4.974345,
3.427515, 3.26432, -4.974345,
-3.573174, 3.26432, 6.15193,
3.427515, 3.26432, 6.15193,
3.427515, -3.80691, -4.974345,
3.427515, 3.26432, -4.974345,
3.427515, -3.80691, 6.15193,
3.427515, 3.26432, 6.15193,
3.427515, -3.80691, -4.974345,
3.427515, -3.80691, 6.15193,
3.427515, 3.26432, -4.974345,
3.427515, 3.26432, 6.15193
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
var radius = 7.97056;
var distance = 35.46192;
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
mvMatrix.translate( 0.07282972, 0.271295, -0.5887923 );
mvMatrix.scale( 1.231011, 1.218731, 0.7745562 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46192);
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


