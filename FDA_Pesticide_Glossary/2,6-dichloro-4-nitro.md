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
-4.425872, -0.798757, -1.75156, 1, 0, 0, 1,
-4.084873, -0.2813044, -1.645304, 1, 0.007843138, 0, 1,
-3.132227, 0.001636185, -1.308569, 1, 0.01176471, 0, 1,
-3.103692, -0.153333, -1.600924, 1, 0.01960784, 0, 1,
-2.756875, -0.1706118, -3.462628, 1, 0.02352941, 0, 1,
-2.693543, -0.1831476, -2.643968, 1, 0.03137255, 0, 1,
-2.670341, 0.166659, -1.0127, 1, 0.03529412, 0, 1,
-2.571463, 0.4000129, -1.932159, 1, 0.04313726, 0, 1,
-2.482702, 0.3706258, -2.5984, 1, 0.04705882, 0, 1,
-2.465311, -1.480848, -2.473906, 1, 0.05490196, 0, 1,
-2.455345, 0.05220462, -0.9192075, 1, 0.05882353, 0, 1,
-2.431627, -0.04045761, 0.1876977, 1, 0.06666667, 0, 1,
-2.39335, 0.9358166, -1.811868, 1, 0.07058824, 0, 1,
-2.356043, 0.5188297, -0.3457551, 1, 0.07843138, 0, 1,
-2.263449, -0.04172427, -0.3284305, 1, 0.08235294, 0, 1,
-2.255164, -0.3163557, -2.622219, 1, 0.09019608, 0, 1,
-2.191618, 1.759391, -2.914089, 1, 0.09411765, 0, 1,
-2.17587, 1.581373, -1.196452, 1, 0.1019608, 0, 1,
-2.142855, 0.9730169, 0.1110653, 1, 0.1098039, 0, 1,
-2.123212, -0.04869256, 0.237297, 1, 0.1137255, 0, 1,
-2.107909, 0.4092307, -2.702125, 1, 0.1215686, 0, 1,
-2.096087, -0.2025289, -2.685735, 1, 0.1254902, 0, 1,
-2.094322, -0.6852682, -2.1915, 1, 0.1333333, 0, 1,
-2.077314, -0.8762738, -1.329568, 1, 0.1372549, 0, 1,
-2.076676, -0.1254057, -1.801024, 1, 0.145098, 0, 1,
-2.072901, -0.1416606, -1.034764, 1, 0.1490196, 0, 1,
-2.025611, 0.01292703, -3.419286, 1, 0.1568628, 0, 1,
-2.0184, 0.9234291, -1.231848, 1, 0.1607843, 0, 1,
-2.015145, -0.2206286, -2.416964, 1, 0.1686275, 0, 1,
-2.004255, 1.72048, 0.5000633, 1, 0.172549, 0, 1,
-2.002542, 2.099842, -0.6595744, 1, 0.1803922, 0, 1,
-1.994162, -0.9876341, -2.0088, 1, 0.1843137, 0, 1,
-1.986598, 0.6187689, -1.478098, 1, 0.1921569, 0, 1,
-1.976395, -0.5970355, -0.7465512, 1, 0.1960784, 0, 1,
-1.932111, -1.352471, -1.982728, 1, 0.2039216, 0, 1,
-1.922518, 0.5710112, -1.365812, 1, 0.2117647, 0, 1,
-1.917148, 0.5908977, -0.9385558, 1, 0.2156863, 0, 1,
-1.911419, -0.4039646, -0.5145912, 1, 0.2235294, 0, 1,
-1.870848, -0.3724035, -1.953317, 1, 0.227451, 0, 1,
-1.838745, -0.08215535, -0.7940269, 1, 0.2352941, 0, 1,
-1.814382, -0.3867556, -4.097098, 1, 0.2392157, 0, 1,
-1.814279, -0.9957852, -0.9916264, 1, 0.2470588, 0, 1,
-1.798368, 0.4101754, -0.2093695, 1, 0.2509804, 0, 1,
-1.768219, 0.9474565, -0.964632, 1, 0.2588235, 0, 1,
-1.763929, -0.02967454, -1.275839, 1, 0.2627451, 0, 1,
-1.74577, -2.110742, -2.774803, 1, 0.2705882, 0, 1,
-1.689267, -1.20499, -2.593755, 1, 0.2745098, 0, 1,
-1.685429, -0.2493882, -0.8432479, 1, 0.282353, 0, 1,
-1.681984, -0.9807553, -3.354495, 1, 0.2862745, 0, 1,
-1.66351, 0.1945921, -1.209055, 1, 0.2941177, 0, 1,
-1.658836, -0.1341752, -0.9939271, 1, 0.3019608, 0, 1,
-1.64768, -3.202008, -1.437527, 1, 0.3058824, 0, 1,
-1.638926, -0.9181083, -3.051047, 1, 0.3137255, 0, 1,
-1.632793, 0.4255842, -3.412391, 1, 0.3176471, 0, 1,
-1.61171, 0.3456386, -2.19734, 1, 0.3254902, 0, 1,
-1.597508, -0.207381, -1.277217, 1, 0.3294118, 0, 1,
-1.588471, 0.9513003, -1.176751, 1, 0.3372549, 0, 1,
-1.584201, 0.5177478, -2.144644, 1, 0.3411765, 0, 1,
-1.57422, 0.2873161, -2.323895, 1, 0.3490196, 0, 1,
-1.571619, -0.1744441, -2.304333, 1, 0.3529412, 0, 1,
-1.566332, -0.5585048, -1.016474, 1, 0.3607843, 0, 1,
-1.564009, -0.6420923, -2.278795, 1, 0.3647059, 0, 1,
-1.55179, 0.9021666, -0.6829746, 1, 0.372549, 0, 1,
-1.54938, 0.2523049, -2.261674, 1, 0.3764706, 0, 1,
-1.542592, 0.1556425, -2.751697, 1, 0.3843137, 0, 1,
-1.521907, 1.631314, -1.325847, 1, 0.3882353, 0, 1,
-1.519065, 1.352143, 2.383455, 1, 0.3960784, 0, 1,
-1.515789, -0.5140723, -1.327291, 1, 0.4039216, 0, 1,
-1.512978, -0.9972994, -1.101434, 1, 0.4078431, 0, 1,
-1.510357, 1.291917, -2.159089, 1, 0.4156863, 0, 1,
-1.50816, -1.049409, -0.3405951, 1, 0.4196078, 0, 1,
-1.507507, 1.285943, -1.963813, 1, 0.427451, 0, 1,
-1.494405, 0.04243032, 0.004407082, 1, 0.4313726, 0, 1,
-1.481036, -0.4122911, -1.599996, 1, 0.4392157, 0, 1,
-1.476441, 0.05923735, -1.498113, 1, 0.4431373, 0, 1,
-1.474699, -1.261913, -3.193434, 1, 0.4509804, 0, 1,
-1.454208, -1.001867, -2.685035, 1, 0.454902, 0, 1,
-1.447835, -1.253014, -1.033294, 1, 0.4627451, 0, 1,
-1.4111, 0.1995324, -0.652242, 1, 0.4666667, 0, 1,
-1.404957, 1.567524, -2.200774, 1, 0.4745098, 0, 1,
-1.384908, -2.382098, -1.736945, 1, 0.4784314, 0, 1,
-1.382061, 0.7287339, -1.240804, 1, 0.4862745, 0, 1,
-1.380221, -1.689006, 0.07333805, 1, 0.4901961, 0, 1,
-1.379252, -0.4659411, -1.495322, 1, 0.4980392, 0, 1,
-1.36702, -1.495868, -3.258961, 1, 0.5058824, 0, 1,
-1.362233, -0.1914533, -1.831448, 1, 0.509804, 0, 1,
-1.356646, 0.1861439, -0.8884031, 1, 0.5176471, 0, 1,
-1.350034, -1.160257, -2.96176, 1, 0.5215687, 0, 1,
-1.348684, 0.06753165, -2.140341, 1, 0.5294118, 0, 1,
-1.347158, -0.3109432, -0.5424648, 1, 0.5333334, 0, 1,
-1.339399, 1.218923, 0.2622268, 1, 0.5411765, 0, 1,
-1.33634, -0.5685358, -0.9050304, 1, 0.5450981, 0, 1,
-1.326976, 0.4282259, -1.977268, 1, 0.5529412, 0, 1,
-1.326751, 1.22242, 0.02702635, 1, 0.5568628, 0, 1,
-1.308541, -0.3571238, -1.283867, 1, 0.5647059, 0, 1,
-1.296631, 0.06890623, -2.38397, 1, 0.5686275, 0, 1,
-1.292358, -0.1529239, -3.341172, 1, 0.5764706, 0, 1,
-1.277275, 0.6774832, -1.234652, 1, 0.5803922, 0, 1,
-1.274108, -1.00613, -2.427159, 1, 0.5882353, 0, 1,
-1.270966, -0.8377847, -2.488638, 1, 0.5921569, 0, 1,
-1.262368, 2.075808, -0.09513048, 1, 0.6, 0, 1,
-1.255244, -0.1967449, 0.6997101, 1, 0.6078432, 0, 1,
-1.253213, -0.5466398, -1.82507, 1, 0.6117647, 0, 1,
-1.251848, -1.342304, -3.43961, 1, 0.6196079, 0, 1,
-1.247231, 1.530765, -1.798559, 1, 0.6235294, 0, 1,
-1.24639, 0.5888197, -0.08324936, 1, 0.6313726, 0, 1,
-1.240125, -1.280968, -2.559232, 1, 0.6352941, 0, 1,
-1.239379, -1.404437, -2.972892, 1, 0.6431373, 0, 1,
-1.239141, 1.900669, 1.436141, 1, 0.6470588, 0, 1,
-1.228994, 0.7416375, -0.1095767, 1, 0.654902, 0, 1,
-1.228001, -0.4420069, 0.09599392, 1, 0.6588235, 0, 1,
-1.227093, -2.062245, -4.891747, 1, 0.6666667, 0, 1,
-1.222114, -1.374182, -3.39494, 1, 0.6705883, 0, 1,
-1.219347, 1.210471, 0.1830407, 1, 0.6784314, 0, 1,
-1.211684, 0.4350142, -0.9817976, 1, 0.682353, 0, 1,
-1.210557, 0.2271223, -2.256112, 1, 0.6901961, 0, 1,
-1.191912, -1.474294, -2.742002, 1, 0.6941177, 0, 1,
-1.187329, -0.9670403, -2.720999, 1, 0.7019608, 0, 1,
-1.180633, 1.268889, -1.576398, 1, 0.7098039, 0, 1,
-1.177144, 0.6807238, -1.79715, 1, 0.7137255, 0, 1,
-1.175053, -0.3704417, -2.225364, 1, 0.7215686, 0, 1,
-1.166091, -0.6577101, -3.255978, 1, 0.7254902, 0, 1,
-1.162454, 0.07067932, -0.05484332, 1, 0.7333333, 0, 1,
-1.158584, -1.601917, -2.498042, 1, 0.7372549, 0, 1,
-1.158263, -0.05100801, -1.828324, 1, 0.7450981, 0, 1,
-1.154092, -0.3316722, -1.165114, 1, 0.7490196, 0, 1,
-1.153406, 0.06457426, -1.083183, 1, 0.7568628, 0, 1,
-1.148397, 0.1476925, -2.41886, 1, 0.7607843, 0, 1,
-1.139248, -1.700628, -3.25406, 1, 0.7686275, 0, 1,
-1.138588, 2.025924, -0.9928775, 1, 0.772549, 0, 1,
-1.134495, 2.675281, 0.7523344, 1, 0.7803922, 0, 1,
-1.12371, 1.167893, 0.1133617, 1, 0.7843137, 0, 1,
-1.12048, -0.5993122, -3.416038, 1, 0.7921569, 0, 1,
-1.119919, -0.2854195, -2.448498, 1, 0.7960784, 0, 1,
-1.119585, 0.8547568, -1.268099, 1, 0.8039216, 0, 1,
-1.118717, -1.463364, -2.664903, 1, 0.8117647, 0, 1,
-1.111649, 0.371048, -1.852287, 1, 0.8156863, 0, 1,
-1.111597, 0.7866184, -0.2205428, 1, 0.8235294, 0, 1,
-1.105698, -1.975439, -3.174179, 1, 0.827451, 0, 1,
-1.094279, 0.3808381, -0.2167432, 1, 0.8352941, 0, 1,
-1.093501, 1.009485, -2.338438, 1, 0.8392157, 0, 1,
-1.093442, 0.4003477, -2.76941, 1, 0.8470588, 0, 1,
-1.092193, -0.09302305, -2.77126, 1, 0.8509804, 0, 1,
-1.0861, -0.4692089, -1.751004, 1, 0.8588235, 0, 1,
-1.077159, -1.166812, -1.9873, 1, 0.8627451, 0, 1,
-1.070572, -0.2558998, -2.778274, 1, 0.8705882, 0, 1,
-1.066828, -0.5574718, -3.517013, 1, 0.8745098, 0, 1,
-1.063458, 0.7809814, -0.4180445, 1, 0.8823529, 0, 1,
-1.054295, -0.525703, -1.760882, 1, 0.8862745, 0, 1,
-1.041379, 0.2268905, -2.773659, 1, 0.8941177, 0, 1,
-1.030596, -0.1367785, -0.4213685, 1, 0.8980392, 0, 1,
-1.030429, -0.5712658, -3.116505, 1, 0.9058824, 0, 1,
-1.0301, -1.034717, -3.480211, 1, 0.9137255, 0, 1,
-1.020432, 0.3492043, -2.659355, 1, 0.9176471, 0, 1,
-1.017957, -0.4460336, -0.7098292, 1, 0.9254902, 0, 1,
-1.016904, -1.546995, -2.305232, 1, 0.9294118, 0, 1,
-1.013566, -0.06130731, -2.386142, 1, 0.9372549, 0, 1,
-1.01297, 0.5369897, -0.1476607, 1, 0.9411765, 0, 1,
-1.01245, 0.9741927, 1.02376, 1, 0.9490196, 0, 1,
-1.010327, -0.07361329, -2.205551, 1, 0.9529412, 0, 1,
-1.006616, -0.01782472, -0.1300824, 1, 0.9607843, 0, 1,
-0.9919769, 0.0407663, -0.6385659, 1, 0.9647059, 0, 1,
-0.9869575, 0.476727, -1.023909, 1, 0.972549, 0, 1,
-0.9802333, -0.8632044, -2.077232, 1, 0.9764706, 0, 1,
-0.9776797, -0.407543, -0.6516722, 1, 0.9843137, 0, 1,
-0.9759303, -0.9071845, -3.307629, 1, 0.9882353, 0, 1,
-0.9722576, -0.564833, -2.739287, 1, 0.9960784, 0, 1,
-0.9708028, -0.8192711, -3.088297, 0.9960784, 1, 0, 1,
-0.9691886, -1.427838, -2.316668, 0.9921569, 1, 0, 1,
-0.9689942, 1.471163, -1.166438, 0.9843137, 1, 0, 1,
-0.9685893, -1.230017, -1.428522, 0.9803922, 1, 0, 1,
-0.9674343, 1.980967, 0.6798331, 0.972549, 1, 0, 1,
-0.9655424, 0.911771, 0.4046617, 0.9686275, 1, 0, 1,
-0.9552027, 0.01159762, -0.7259111, 0.9607843, 1, 0, 1,
-0.9442914, -1.778647, -0.6336651, 0.9568627, 1, 0, 1,
-0.9432888, -0.5593031, -3.062963, 0.9490196, 1, 0, 1,
-0.9380578, 0.2549849, -2.773609, 0.945098, 1, 0, 1,
-0.9357856, -0.02895948, -1.157179, 0.9372549, 1, 0, 1,
-0.9287712, -1.620358, -3.609341, 0.9333333, 1, 0, 1,
-0.9274046, -0.2589163, -2.666693, 0.9254902, 1, 0, 1,
-0.9137612, 1.745819, 0.3627332, 0.9215686, 1, 0, 1,
-0.9001637, 0.3890133, -0.8212273, 0.9137255, 1, 0, 1,
-0.8996671, 0.7755888, -1.183529, 0.9098039, 1, 0, 1,
-0.8964122, -0.6997676, -2.077749, 0.9019608, 1, 0, 1,
-0.8929415, 0.1127149, -1.541495, 0.8941177, 1, 0, 1,
-0.8914242, 0.168952, -1.345606, 0.8901961, 1, 0, 1,
-0.8900248, 0.2445462, -0.0940216, 0.8823529, 1, 0, 1,
-0.8880758, -0.4377028, -2.175479, 0.8784314, 1, 0, 1,
-0.8832195, -1.927998, -2.175636, 0.8705882, 1, 0, 1,
-0.8806575, 0.4318623, 0.1644457, 0.8666667, 1, 0, 1,
-0.8793558, 0.4380538, -2.010513, 0.8588235, 1, 0, 1,
-0.8790969, 0.8408416, -2.234498, 0.854902, 1, 0, 1,
-0.8750221, 1.113872, 0.9788063, 0.8470588, 1, 0, 1,
-0.8712072, 0.08248434, -1.742964, 0.8431373, 1, 0, 1,
-0.8637772, 1.362984, 0.719245, 0.8352941, 1, 0, 1,
-0.8627824, 0.1049799, -0.2579532, 0.8313726, 1, 0, 1,
-0.8589044, -1.54216, -1.786381, 0.8235294, 1, 0, 1,
-0.8571393, 0.9667302, 0.3733138, 0.8196079, 1, 0, 1,
-0.8434542, -0.7945727, -4.223846, 0.8117647, 1, 0, 1,
-0.8434451, -0.202773, -2.447166, 0.8078431, 1, 0, 1,
-0.8420685, -0.4929655, -0.9986355, 0.8, 1, 0, 1,
-0.8417248, 0.1418281, -1.309467, 0.7921569, 1, 0, 1,
-0.8386002, 0.9276612, -1.017765, 0.7882353, 1, 0, 1,
-0.8339775, 1.763363, -1.17197, 0.7803922, 1, 0, 1,
-0.8286933, 0.8834993, -1.107667, 0.7764706, 1, 0, 1,
-0.8243983, -0.4086045, -1.494667, 0.7686275, 1, 0, 1,
-0.8034571, -3.021433, -3.87622, 0.7647059, 1, 0, 1,
-0.8018379, 0.8686522, -0.5651197, 0.7568628, 1, 0, 1,
-0.8003147, -1.323885, -3.108702, 0.7529412, 1, 0, 1,
-0.7972525, 0.7413092, -1.020651, 0.7450981, 1, 0, 1,
-0.7906978, -1.36496, -3.071185, 0.7411765, 1, 0, 1,
-0.7896858, -0.6256841, -3.235468, 0.7333333, 1, 0, 1,
-0.789575, -0.08292808, -0.904586, 0.7294118, 1, 0, 1,
-0.7890531, 0.2524423, -1.389534, 0.7215686, 1, 0, 1,
-0.7858397, -0.1209873, -1.757632, 0.7176471, 1, 0, 1,
-0.7849097, -0.9242592, -2.581633, 0.7098039, 1, 0, 1,
-0.781753, -0.5888216, -1.631382, 0.7058824, 1, 0, 1,
-0.7780213, -1.590809, -3.700086, 0.6980392, 1, 0, 1,
-0.7760316, -0.2498206, -3.556644, 0.6901961, 1, 0, 1,
-0.7755032, 0.1078299, -3.054664, 0.6862745, 1, 0, 1,
-0.7716568, 0.2537326, -1.367888, 0.6784314, 1, 0, 1,
-0.76534, -0.5269522, -1.418672, 0.6745098, 1, 0, 1,
-0.761292, 1.067551, 0.7405767, 0.6666667, 1, 0, 1,
-0.7580849, 0.3684294, -0.3667315, 0.6627451, 1, 0, 1,
-0.7580737, 1.396911, -1.221346, 0.654902, 1, 0, 1,
-0.7562762, 0.1547729, -1.134292, 0.6509804, 1, 0, 1,
-0.7547961, -0.9878913, -2.783888, 0.6431373, 1, 0, 1,
-0.7526047, 0.6835666, -3.056168, 0.6392157, 1, 0, 1,
-0.749728, -0.9712147, -2.395596, 0.6313726, 1, 0, 1,
-0.7470052, -0.2697162, 0.0854206, 0.627451, 1, 0, 1,
-0.7442033, -0.3528582, -2.880823, 0.6196079, 1, 0, 1,
-0.7438609, -0.5613227, -1.727189, 0.6156863, 1, 0, 1,
-0.7363341, 0.2474259, 0.4258719, 0.6078432, 1, 0, 1,
-0.7354786, -0.1201144, 0.4065208, 0.6039216, 1, 0, 1,
-0.7334918, 0.7938989, 0.05077827, 0.5960785, 1, 0, 1,
-0.7325222, -0.3695353, -2.182708, 0.5882353, 1, 0, 1,
-0.720615, 0.3324733, -0.9653318, 0.5843138, 1, 0, 1,
-0.7202826, 0.02257132, -0.6139268, 0.5764706, 1, 0, 1,
-0.7186882, -0.008546767, -2.775905, 0.572549, 1, 0, 1,
-0.7185226, 0.9284003, -0.4167331, 0.5647059, 1, 0, 1,
-0.7136486, -0.2046278, -2.714901, 0.5607843, 1, 0, 1,
-0.7125787, 1.691978, -0.2114987, 0.5529412, 1, 0, 1,
-0.7125419, -0.2271577, -1.12949, 0.5490196, 1, 0, 1,
-0.712264, -0.2982934, -0.6631876, 0.5411765, 1, 0, 1,
-0.7086233, 0.9685519, -0.3495514, 0.5372549, 1, 0, 1,
-0.7032033, -0.3059278, -1.333919, 0.5294118, 1, 0, 1,
-0.7018917, -0.2679847, -0.4022624, 0.5254902, 1, 0, 1,
-0.7004454, 0.8638361, -1.709847, 0.5176471, 1, 0, 1,
-0.6952984, 1.118037, 0.3286, 0.5137255, 1, 0, 1,
-0.6947179, 1.867861, -0.3715274, 0.5058824, 1, 0, 1,
-0.6935043, 1.754877, 1.857814, 0.5019608, 1, 0, 1,
-0.693279, 1.902628, 0.7808362, 0.4941176, 1, 0, 1,
-0.6920193, 2.66324, -0.8899063, 0.4862745, 1, 0, 1,
-0.6897232, -0.4517506, -0.476212, 0.4823529, 1, 0, 1,
-0.6890505, -0.1355504, -3.523984, 0.4745098, 1, 0, 1,
-0.688696, -0.4257454, -2.469867, 0.4705882, 1, 0, 1,
-0.6863667, -0.5613176, -2.341533, 0.4627451, 1, 0, 1,
-0.6840517, -0.05747661, -2.49054, 0.4588235, 1, 0, 1,
-0.6745752, -0.006942571, -1.328315, 0.4509804, 1, 0, 1,
-0.6665205, 0.4416613, -0.29476, 0.4470588, 1, 0, 1,
-0.6657631, -0.03106892, -0.5712624, 0.4392157, 1, 0, 1,
-0.6632758, -1.293568, -1.696129, 0.4352941, 1, 0, 1,
-0.6574526, 0.0779736, -3.386526, 0.427451, 1, 0, 1,
-0.6563845, -0.7273802, -2.572133, 0.4235294, 1, 0, 1,
-0.6530843, -0.3219858, -2.453513, 0.4156863, 1, 0, 1,
-0.6483221, -2.496697, -3.324775, 0.4117647, 1, 0, 1,
-0.647792, -0.9923601, -1.356089, 0.4039216, 1, 0, 1,
-0.6439227, -0.8183243, -1.205822, 0.3960784, 1, 0, 1,
-0.6434581, -0.893904, -2.981259, 0.3921569, 1, 0, 1,
-0.6399525, 0.7400092, -1.501331, 0.3843137, 1, 0, 1,
-0.6371599, -2.468555, -3.851203, 0.3803922, 1, 0, 1,
-0.6337517, 0.2857438, -0.6923161, 0.372549, 1, 0, 1,
-0.6269411, -0.04334169, -1.979864, 0.3686275, 1, 0, 1,
-0.6246386, 0.9298805, -0.02765197, 0.3607843, 1, 0, 1,
-0.6245114, 0.8592069, -1.179284, 0.3568628, 1, 0, 1,
-0.6134948, -0.7702636, -3.222388, 0.3490196, 1, 0, 1,
-0.607192, -1.022737, -2.285042, 0.345098, 1, 0, 1,
-0.6033039, 0.5801848, 0.7285012, 0.3372549, 1, 0, 1,
-0.6008822, -0.5048717, -1.308601, 0.3333333, 1, 0, 1,
-0.5928342, -0.320031, -1.239281, 0.3254902, 1, 0, 1,
-0.5848123, -0.4854132, -2.671871, 0.3215686, 1, 0, 1,
-0.5830072, -2.837739, -2.736081, 0.3137255, 1, 0, 1,
-0.5797413, 0.6472894, -0.8298554, 0.3098039, 1, 0, 1,
-0.5750546, -0.677182, -3.551429, 0.3019608, 1, 0, 1,
-0.5737264, 2.672292, -0.7825196, 0.2941177, 1, 0, 1,
-0.5721269, -1.112654, -1.890755, 0.2901961, 1, 0, 1,
-0.5702621, 1.238605, -1.591497, 0.282353, 1, 0, 1,
-0.5693997, 0.7230335, -2.840693, 0.2784314, 1, 0, 1,
-0.568661, 1.554586, -0.9090279, 0.2705882, 1, 0, 1,
-0.564127, 0.4418201, -0.918202, 0.2666667, 1, 0, 1,
-0.5636637, 0.6726565, -0.8739277, 0.2588235, 1, 0, 1,
-0.5629267, 1.299677, 1.036381, 0.254902, 1, 0, 1,
-0.5619947, -1.542705, -4.562653, 0.2470588, 1, 0, 1,
-0.560588, -0.04261991, -0.8567731, 0.2431373, 1, 0, 1,
-0.5591254, 0.8885663, -0.8385567, 0.2352941, 1, 0, 1,
-0.5516206, 1.947474, -0.6683028, 0.2313726, 1, 0, 1,
-0.5463028, 0.3004805, -1.317046, 0.2235294, 1, 0, 1,
-0.5434483, 0.3278204, -1.390794, 0.2196078, 1, 0, 1,
-0.5423991, -0.5346812, -1.891384, 0.2117647, 1, 0, 1,
-0.5403149, 0.308284, -1.885504, 0.2078431, 1, 0, 1,
-0.5335066, 0.2882289, -2.137507, 0.2, 1, 0, 1,
-0.5320588, 0.03491142, -2.740073, 0.1921569, 1, 0, 1,
-0.5311159, -1.737685, -4.151601, 0.1882353, 1, 0, 1,
-0.5301402, 0.7590905, -0.6692951, 0.1803922, 1, 0, 1,
-0.5292776, 0.9388395, -0.4671623, 0.1764706, 1, 0, 1,
-0.5290939, -0.960452, -2.354051, 0.1686275, 1, 0, 1,
-0.5231362, -0.4417129, 0.1087236, 0.1647059, 1, 0, 1,
-0.51842, 1.204025, -1.426467, 0.1568628, 1, 0, 1,
-0.5161999, -0.8208343, -3.788633, 0.1529412, 1, 0, 1,
-0.5138137, -0.08675523, -2.528125, 0.145098, 1, 0, 1,
-0.5077571, 1.090196, -2.566532, 0.1411765, 1, 0, 1,
-0.504755, -1.255567, -2.624026, 0.1333333, 1, 0, 1,
-0.5025258, 2.04282, 1.29268, 0.1294118, 1, 0, 1,
-0.5003033, -1.17098, -3.719407, 0.1215686, 1, 0, 1,
-0.5000503, 0.7476393, 0.09357205, 0.1176471, 1, 0, 1,
-0.4992712, -0.7594369, -2.12931, 0.1098039, 1, 0, 1,
-0.4969779, -0.7610289, -1.184422, 0.1058824, 1, 0, 1,
-0.4920882, 0.2217969, -1.222716, 0.09803922, 1, 0, 1,
-0.4888725, -0.3736924, -3.740854, 0.09019608, 1, 0, 1,
-0.4873716, -0.2886944, -3.789268, 0.08627451, 1, 0, 1,
-0.4873157, 0.7943612, 1.430201, 0.07843138, 1, 0, 1,
-0.4846431, 0.2306233, -2.42916, 0.07450981, 1, 0, 1,
-0.4791767, -1.452574, -3.266918, 0.06666667, 1, 0, 1,
-0.4770225, -1.114876, -1.518281, 0.0627451, 1, 0, 1,
-0.4755823, -1.330025, -2.095218, 0.05490196, 1, 0, 1,
-0.4724318, -0.645241, -2.858331, 0.05098039, 1, 0, 1,
-0.4718028, -0.7183498, -2.707831, 0.04313726, 1, 0, 1,
-0.4676291, -0.9814466, -3.51241, 0.03921569, 1, 0, 1,
-0.4663309, -1.491999, -2.619535, 0.03137255, 1, 0, 1,
-0.4629405, 1.568623, -0.2331832, 0.02745098, 1, 0, 1,
-0.4462489, 0.1729735, -1.030782, 0.01960784, 1, 0, 1,
-0.4426859, -0.3251718, -1.295056, 0.01568628, 1, 0, 1,
-0.4419992, -0.6798636, -4.089195, 0.007843138, 1, 0, 1,
-0.4352517, -1.17016, -1.223703, 0.003921569, 1, 0, 1,
-0.4335178, -1.141438, -2.827864, 0, 1, 0.003921569, 1,
-0.4311724, -1.39893, -4.022985, 0, 1, 0.01176471, 1,
-0.4270718, -0.8207303, -1.66665, 0, 1, 0.01568628, 1,
-0.4269377, 1.1006, 1.469827, 0, 1, 0.02352941, 1,
-0.4261626, 1.28602, 0.07129294, 0, 1, 0.02745098, 1,
-0.4254361, -0.1632859, -1.592616, 0, 1, 0.03529412, 1,
-0.4238085, -0.6560532, -2.607814, 0, 1, 0.03921569, 1,
-0.4192582, -0.08956024, -0.536339, 0, 1, 0.04705882, 1,
-0.4178813, 0.8882397, -0.1648062, 0, 1, 0.05098039, 1,
-0.4162742, -0.5134741, -2.890808, 0, 1, 0.05882353, 1,
-0.4049757, 1.638575, 1.154289, 0, 1, 0.0627451, 1,
-0.4028851, -1.270486, -0.7631783, 0, 1, 0.07058824, 1,
-0.4004469, -1.194027, -3.838059, 0, 1, 0.07450981, 1,
-0.3977741, -1.185976, -3.40619, 0, 1, 0.08235294, 1,
-0.3948253, -0.4917438, -1.095417, 0, 1, 0.08627451, 1,
-0.3903396, 1.135649, -0.5993094, 0, 1, 0.09411765, 1,
-0.389435, -0.3501618, -3.591409, 0, 1, 0.1019608, 1,
-0.3893371, 1.365209, -1.526587, 0, 1, 0.1058824, 1,
-0.3808284, 0.250692, -0.0496675, 0, 1, 0.1137255, 1,
-0.3749221, 0.1067876, -1.641456, 0, 1, 0.1176471, 1,
-0.3737165, 0.1275927, -2.173229, 0, 1, 0.1254902, 1,
-0.372677, 0.4554971, 0.3991766, 0, 1, 0.1294118, 1,
-0.3688211, 1.559312, 1.442644, 0, 1, 0.1372549, 1,
-0.3672261, 1.744827, -0.7892069, 0, 1, 0.1411765, 1,
-0.3650223, 0.9693618, -0.6232737, 0, 1, 0.1490196, 1,
-0.3639534, -0.4932976, -2.92247, 0, 1, 0.1529412, 1,
-0.3623739, -0.6804088, -1.587855, 0, 1, 0.1607843, 1,
-0.3590336, 1.382853, -0.03470092, 0, 1, 0.1647059, 1,
-0.3583201, 0.5252954, -0.3141037, 0, 1, 0.172549, 1,
-0.3544346, -0.002712475, -2.093617, 0, 1, 0.1764706, 1,
-0.3503036, -0.5121515, -2.80834, 0, 1, 0.1843137, 1,
-0.3493735, 0.740106, -0.1602139, 0, 1, 0.1882353, 1,
-0.3426325, -0.4913383, -2.513083, 0, 1, 0.1960784, 1,
-0.3378501, 1.048809, -0.382991, 0, 1, 0.2039216, 1,
-0.3341387, 0.6501566, 0.838186, 0, 1, 0.2078431, 1,
-0.3283964, 0.1790454, 0.2796691, 0, 1, 0.2156863, 1,
-0.3271858, 0.2902975, -1.118381, 0, 1, 0.2196078, 1,
-0.3253497, -0.7678718, -3.752609, 0, 1, 0.227451, 1,
-0.3181794, -0.5194736, -4.076096, 0, 1, 0.2313726, 1,
-0.3170115, 0.1316129, -2.693213, 0, 1, 0.2392157, 1,
-0.308643, -1.051041, -3.380311, 0, 1, 0.2431373, 1,
-0.3074763, -0.7883548, -0.4114717, 0, 1, 0.2509804, 1,
-0.3061658, 1.991574, 0.277924, 0, 1, 0.254902, 1,
-0.3039073, -0.3837306, -2.507275, 0, 1, 0.2627451, 1,
-0.3031779, 0.4634759, -1.22236, 0, 1, 0.2666667, 1,
-0.2986376, -0.5344098, -2.045686, 0, 1, 0.2745098, 1,
-0.2978153, 1.747886, 0.3935075, 0, 1, 0.2784314, 1,
-0.2974825, 0.8907734, -0.15415, 0, 1, 0.2862745, 1,
-0.2973021, 1.829074, -1.701311, 0, 1, 0.2901961, 1,
-0.2933424, -1.462994, -2.598816, 0, 1, 0.2980392, 1,
-0.2886105, 1.204542, -0.968303, 0, 1, 0.3058824, 1,
-0.2884732, 0.2078651, -0.214388, 0, 1, 0.3098039, 1,
-0.288269, 1.653738, -0.2305524, 0, 1, 0.3176471, 1,
-0.2877872, 0.07073703, 0.1866729, 0, 1, 0.3215686, 1,
-0.2828293, -0.5661439, -2.640217, 0, 1, 0.3294118, 1,
-0.2792514, 0.9167021, -0.8669406, 0, 1, 0.3333333, 1,
-0.2792501, -0.03457742, -2.496966, 0, 1, 0.3411765, 1,
-0.2770586, -1.064385, -3.456038, 0, 1, 0.345098, 1,
-0.2740594, -0.8123616, -4.430924, 0, 1, 0.3529412, 1,
-0.2724849, -0.3337702, -2.789764, 0, 1, 0.3568628, 1,
-0.2676885, -1.526043, -3.530343, 0, 1, 0.3647059, 1,
-0.2676012, 1.065157, 0.6114314, 0, 1, 0.3686275, 1,
-0.26435, 1.498051, 2.793055, 0, 1, 0.3764706, 1,
-0.2630526, 0.4727246, -0.3136362, 0, 1, 0.3803922, 1,
-0.2630516, 2.17947, 0.7884506, 0, 1, 0.3882353, 1,
-0.2615689, 1.001541, -0.9432101, 0, 1, 0.3921569, 1,
-0.2614584, -0.248222, -1.696519, 0, 1, 0.4, 1,
-0.2570782, 1.810835, 0.1300197, 0, 1, 0.4078431, 1,
-0.2536184, -0.3403774, -2.13418, 0, 1, 0.4117647, 1,
-0.2516283, -0.4252389, -1.491325, 0, 1, 0.4196078, 1,
-0.2481774, 0.4514334, 1.732053, 0, 1, 0.4235294, 1,
-0.2359905, 1.153006, 0.9581162, 0, 1, 0.4313726, 1,
-0.2322712, -1.199721, -0.8551476, 0, 1, 0.4352941, 1,
-0.2306759, 0.8017686, -1.079801, 0, 1, 0.4431373, 1,
-0.226196, 0.3154947, -0.04519526, 0, 1, 0.4470588, 1,
-0.2249183, 0.5175234, -1.541328, 0, 1, 0.454902, 1,
-0.2245008, 1.265126, -1.073844, 0, 1, 0.4588235, 1,
-0.221802, 0.3387014, 1.1915, 0, 1, 0.4666667, 1,
-0.2168409, -0.3842857, -3.458112, 0, 1, 0.4705882, 1,
-0.2140171, 1.534506, -1.396793, 0, 1, 0.4784314, 1,
-0.2122933, 0.1613186, -0.6257008, 0, 1, 0.4823529, 1,
-0.21195, 0.7479748, 0.5254496, 0, 1, 0.4901961, 1,
-0.2096573, -0.0942001, -2.577095, 0, 1, 0.4941176, 1,
-0.2096057, 0.1498152, -0.858896, 0, 1, 0.5019608, 1,
-0.209351, -1.624091, -3.458697, 0, 1, 0.509804, 1,
-0.2051113, 0.2634216, -0.6948771, 0, 1, 0.5137255, 1,
-0.2050061, -0.06133479, -1.33999, 0, 1, 0.5215687, 1,
-0.2046974, 0.6827574, 1.418373, 0, 1, 0.5254902, 1,
-0.2039998, 0.4785719, -0.5864435, 0, 1, 0.5333334, 1,
-0.1991558, 0.3142289, 2.655716, 0, 1, 0.5372549, 1,
-0.1974973, -1.624145, -1.615309, 0, 1, 0.5450981, 1,
-0.19271, -0.3919469, -2.881858, 0, 1, 0.5490196, 1,
-0.1910059, 0.9477167, -0.4469168, 0, 1, 0.5568628, 1,
-0.1900623, 0.7953243, 0.7738916, 0, 1, 0.5607843, 1,
-0.185606, -0.3189766, -1.465665, 0, 1, 0.5686275, 1,
-0.1837394, 0.243411, -0.03952519, 0, 1, 0.572549, 1,
-0.181777, -0.7411082, -2.98145, 0, 1, 0.5803922, 1,
-0.1817583, 1.966126, -0.6148516, 0, 1, 0.5843138, 1,
-0.1793952, 0.7601336, -1.889759, 0, 1, 0.5921569, 1,
-0.1791982, -0.9346965, -3.116385, 0, 1, 0.5960785, 1,
-0.1788569, 1.037616, -0.6073983, 0, 1, 0.6039216, 1,
-0.1749464, -1.012029, -1.05188, 0, 1, 0.6117647, 1,
-0.1744407, -0.9084914, -4.244702, 0, 1, 0.6156863, 1,
-0.1741186, 1.409365, -0.834402, 0, 1, 0.6235294, 1,
-0.168665, -1.071835, -1.891611, 0, 1, 0.627451, 1,
-0.1679767, 0.6828233, -1.070689, 0, 1, 0.6352941, 1,
-0.1660838, -1.191883, -3.41769, 0, 1, 0.6392157, 1,
-0.1592809, 1.470288, 0.07722805, 0, 1, 0.6470588, 1,
-0.1576383, -0.907138, -4.260858, 0, 1, 0.6509804, 1,
-0.1538936, 0.3306077, 0.6907513, 0, 1, 0.6588235, 1,
-0.1537147, 1.755722, -0.9923116, 0, 1, 0.6627451, 1,
-0.1514933, 0.04432413, -1.349, 0, 1, 0.6705883, 1,
-0.1486001, 1.877477, -0.3754957, 0, 1, 0.6745098, 1,
-0.1334528, 0.1761044, 0.5379938, 0, 1, 0.682353, 1,
-0.1327234, 0.361617, -1.93886, 0, 1, 0.6862745, 1,
-0.1256341, 1.254537, 0.08258802, 0, 1, 0.6941177, 1,
-0.1197707, -0.9869606, -1.881887, 0, 1, 0.7019608, 1,
-0.1194715, 0.0418879, -1.98453, 0, 1, 0.7058824, 1,
-0.1172661, -0.1367349, -4.273181, 0, 1, 0.7137255, 1,
-0.1146781, 0.5240852, -1.574253, 0, 1, 0.7176471, 1,
-0.1137815, 0.736213, 0.4450486, 0, 1, 0.7254902, 1,
-0.1123686, 0.906032, -1.121029, 0, 1, 0.7294118, 1,
-0.1123305, 0.410338, -0.6856563, 0, 1, 0.7372549, 1,
-0.1121088, -1.466063, -4.70947, 0, 1, 0.7411765, 1,
-0.1098614, -1.249546, -4.238571, 0, 1, 0.7490196, 1,
-0.1087116, -0.5391145, -4.291357, 0, 1, 0.7529412, 1,
-0.1061107, 0.1129663, -0.8223517, 0, 1, 0.7607843, 1,
-0.1046093, 1.083742, 1.417613, 0, 1, 0.7647059, 1,
-0.1011958, -0.08084717, -2.994606, 0, 1, 0.772549, 1,
-0.09999983, -1.449065, -2.220107, 0, 1, 0.7764706, 1,
-0.09997851, -0.4813734, -1.503895, 0, 1, 0.7843137, 1,
-0.09864227, 0.6387898, -0.380216, 0, 1, 0.7882353, 1,
-0.09113384, 1.921348, 0.261627, 0, 1, 0.7960784, 1,
-0.08371601, -0.03259492, -2.083846, 0, 1, 0.8039216, 1,
-0.08151174, 0.05678633, 0.4761764, 0, 1, 0.8078431, 1,
-0.08035287, -0.8499898, -4.023735, 0, 1, 0.8156863, 1,
-0.0773998, -0.1821389, -3.80301, 0, 1, 0.8196079, 1,
-0.07591811, -0.2164267, -3.721103, 0, 1, 0.827451, 1,
-0.07175686, -1.354736, -5.037126, 0, 1, 0.8313726, 1,
-0.061402, -0.03209863, -3.072287, 0, 1, 0.8392157, 1,
-0.06052915, -1.419983, -3.843396, 0, 1, 0.8431373, 1,
-0.05772256, -2.43282, -2.804253, 0, 1, 0.8509804, 1,
-0.05457071, 1.167256, -0.4123144, 0, 1, 0.854902, 1,
-0.04506482, -2.775793, -2.798935, 0, 1, 0.8627451, 1,
-0.04029972, 0.4934548, -0.6576766, 0, 1, 0.8666667, 1,
-0.03954507, 0.9534474, 0.5376108, 0, 1, 0.8745098, 1,
-0.03937486, 0.1933643, -1.121846, 0, 1, 0.8784314, 1,
-0.03855534, -0.2207053, -1.651501, 0, 1, 0.8862745, 1,
-0.03621051, -1.479388, -2.51216, 0, 1, 0.8901961, 1,
-0.03076993, 1.108666, 2.531853, 0, 1, 0.8980392, 1,
-0.02813025, -0.1114416, -2.157344, 0, 1, 0.9058824, 1,
-0.02753904, -0.1082573, -3.283916, 0, 1, 0.9098039, 1,
-0.02465952, 1.498654, -0.09632855, 0, 1, 0.9176471, 1,
-0.02115267, 1.243448, 0.5028849, 0, 1, 0.9215686, 1,
-0.01704925, -0.9378738, -5.282348, 0, 1, 0.9294118, 1,
-0.01680963, -0.2148183, -1.399766, 0, 1, 0.9333333, 1,
-0.01670079, -0.3751022, -4.164215, 0, 1, 0.9411765, 1,
-0.01223594, 0.5765849, -0.1727655, 0, 1, 0.945098, 1,
-0.01151258, -0.7457888, -4.429779, 0, 1, 0.9529412, 1,
-0.01141129, -0.8983344, -1.266638, 0, 1, 0.9568627, 1,
-0.009416563, 0.2442681, -1.368627, 0, 1, 0.9647059, 1,
-0.008923285, 1.579781, -0.2624711, 0, 1, 0.9686275, 1,
-0.006566519, -1.198515, -5.040674, 0, 1, 0.9764706, 1,
-0.004209004, -0.07585359, -3.135707, 0, 1, 0.9803922, 1,
-0.003099715, -0.3836577, -2.808407, 0, 1, 0.9882353, 1,
-0.002545833, -0.3676873, -3.527038, 0, 1, 0.9921569, 1,
-0.001507717, -1.147087, -3.122025, 0, 1, 1, 1,
-0.0002094006, 0.3237502, -2.194307, 0, 0.9921569, 1, 1,
0.002725643, -1.005927, 4.892661, 0, 0.9882353, 1, 1,
0.00550952, -1.278455, 4.392743, 0, 0.9803922, 1, 1,
0.006198376, 1.689744, 0.4481902, 0, 0.9764706, 1, 1,
0.006640847, 1.049649, 1.39722, 0, 0.9686275, 1, 1,
0.007180398, -0.4210894, 2.653451, 0, 0.9647059, 1, 1,
0.01241476, -0.9717705, 3.377821, 0, 0.9568627, 1, 1,
0.01351641, -0.5100212, 1.868956, 0, 0.9529412, 1, 1,
0.01443929, -0.8440216, 3.663525, 0, 0.945098, 1, 1,
0.01458498, 1.982353, 0.3059308, 0, 0.9411765, 1, 1,
0.01778485, 1.750173, -0.5630382, 0, 0.9333333, 1, 1,
0.01789518, 1.51342, 2.717252, 0, 0.9294118, 1, 1,
0.01848017, -0.6352533, 4.676185, 0, 0.9215686, 1, 1,
0.01935153, -1.082307, 3.913462, 0, 0.9176471, 1, 1,
0.02049376, -1.219722, 3.432513, 0, 0.9098039, 1, 1,
0.02165006, -2.03774, 1.460059, 0, 0.9058824, 1, 1,
0.02210123, -0.2504142, 3.527385, 0, 0.8980392, 1, 1,
0.02340794, 1.898075, 0.06608115, 0, 0.8901961, 1, 1,
0.02442377, 0.7196149, -0.4512741, 0, 0.8862745, 1, 1,
0.02467609, 0.06027456, -0.825547, 0, 0.8784314, 1, 1,
0.03061882, 0.4389113, 0.05329454, 0, 0.8745098, 1, 1,
0.03122492, -0.4591215, 5.095552, 0, 0.8666667, 1, 1,
0.03319455, 0.8833596, 0.3893176, 0, 0.8627451, 1, 1,
0.03433982, 1.231027, -0.5151846, 0, 0.854902, 1, 1,
0.0348529, -0.5310723, 2.100245, 0, 0.8509804, 1, 1,
0.03702191, -2.019127, 1.54061, 0, 0.8431373, 1, 1,
0.04229879, 1.46, 1.172542, 0, 0.8392157, 1, 1,
0.04308511, -1.422266, 4.090983, 0, 0.8313726, 1, 1,
0.0485779, 0.2309327, 0.5524825, 0, 0.827451, 1, 1,
0.05321376, 1.605441, 1.091747, 0, 0.8196079, 1, 1,
0.05555026, -1.483875, 2.865693, 0, 0.8156863, 1, 1,
0.05586934, 1.507898, -0.5759404, 0, 0.8078431, 1, 1,
0.061073, -1.596621, 4.333027, 0, 0.8039216, 1, 1,
0.06528272, -0.1691098, 4.882524, 0, 0.7960784, 1, 1,
0.06530569, -0.248926, 3.035855, 0, 0.7882353, 1, 1,
0.06913068, 1.499959, 0.05612257, 0, 0.7843137, 1, 1,
0.0713748, -1.799431, 3.685511, 0, 0.7764706, 1, 1,
0.07524343, -2.241489, 3.277829, 0, 0.772549, 1, 1,
0.07828974, 0.04831138, 1.795509, 0, 0.7647059, 1, 1,
0.07917573, 0.5000159, 0.03578474, 0, 0.7607843, 1, 1,
0.08048301, 0.1039917, 0.9914196, 0, 0.7529412, 1, 1,
0.08057839, -0.8111374, 1.167505, 0, 0.7490196, 1, 1,
0.08060032, 1.341285, -0.388028, 0, 0.7411765, 1, 1,
0.08416244, 1.791371, -0.6271227, 0, 0.7372549, 1, 1,
0.08444234, -0.361811, 1.247953, 0, 0.7294118, 1, 1,
0.08606008, -0.2012583, 2.861866, 0, 0.7254902, 1, 1,
0.08624481, 0.789122, -0.3030374, 0, 0.7176471, 1, 1,
0.08838971, 0.6241694, -0.3140541, 0, 0.7137255, 1, 1,
0.08866812, 1.422503, 1.494421, 0, 0.7058824, 1, 1,
0.09301587, -0.7141929, 4.432283, 0, 0.6980392, 1, 1,
0.09653523, 0.2454927, 0.4215129, 0, 0.6941177, 1, 1,
0.09807421, 1.208518, -0.7484925, 0, 0.6862745, 1, 1,
0.09941653, -1.222658, 2.549445, 0, 0.682353, 1, 1,
0.101589, -0.9814158, 2.549718, 0, 0.6745098, 1, 1,
0.1038488, -1.470836, 2.628461, 0, 0.6705883, 1, 1,
0.111522, 1.439558, -0.273275, 0, 0.6627451, 1, 1,
0.1153699, 0.1722203, 1.430329, 0, 0.6588235, 1, 1,
0.1226283, -0.6704904, 1.355505, 0, 0.6509804, 1, 1,
0.1272613, -1.144951, 2.595335, 0, 0.6470588, 1, 1,
0.130381, -0.4232305, 1.464106, 0, 0.6392157, 1, 1,
0.1306167, 1.17636, 1.205929, 0, 0.6352941, 1, 1,
0.1393094, -0.3169928, 2.257516, 0, 0.627451, 1, 1,
0.1407766, 0.6389204, 0.5968304, 0, 0.6235294, 1, 1,
0.1502874, -1.49993, 2.1875, 0, 0.6156863, 1, 1,
0.1519725, 1.121508, -0.2108121, 0, 0.6117647, 1, 1,
0.1557046, 1.311428, 1.198669, 0, 0.6039216, 1, 1,
0.1557294, 1.297712, 1.579348, 0, 0.5960785, 1, 1,
0.156451, -0.2236035, 3.455113, 0, 0.5921569, 1, 1,
0.1575718, -1.372472, 3.982745, 0, 0.5843138, 1, 1,
0.160285, -0.7625108, 2.641745, 0, 0.5803922, 1, 1,
0.1623202, -0.2169445, 1.912261, 0, 0.572549, 1, 1,
0.1626295, -1.477515, 4.026201, 0, 0.5686275, 1, 1,
0.1648292, 0.1534032, 1.473399, 0, 0.5607843, 1, 1,
0.1649419, 0.5623005, -0.9082531, 0, 0.5568628, 1, 1,
0.1657662, -0.74936, 2.015684, 0, 0.5490196, 1, 1,
0.1671876, -0.6451585, 1.644496, 0, 0.5450981, 1, 1,
0.1686753, -0.2299068, 3.896546, 0, 0.5372549, 1, 1,
0.1701329, -0.9688447, 4.768002, 0, 0.5333334, 1, 1,
0.175552, 0.3970321, -0.5103675, 0, 0.5254902, 1, 1,
0.1765801, -2.04654, 5.771444, 0, 0.5215687, 1, 1,
0.1772214, -0.3075006, 2.049903, 0, 0.5137255, 1, 1,
0.1802215, 1.536159, -0.4015379, 0, 0.509804, 1, 1,
0.1816323, 0.8990233, 0.06067497, 0, 0.5019608, 1, 1,
0.1834382, 0.2568768, 0.780244, 0, 0.4941176, 1, 1,
0.1841492, 1.22065, 0.7377599, 0, 0.4901961, 1, 1,
0.1847739, -0.08472393, 3.527584, 0, 0.4823529, 1, 1,
0.1849552, 0.6018449, 1.264635, 0, 0.4784314, 1, 1,
0.1850354, -0.7517892, 3.144909, 0, 0.4705882, 1, 1,
0.1891352, -1.93393, 4.089482, 0, 0.4666667, 1, 1,
0.1907972, 0.4347847, -0.415427, 0, 0.4588235, 1, 1,
0.1947644, -0.775997, 1.432973, 0, 0.454902, 1, 1,
0.1995787, 0.2722288, -0.6371521, 0, 0.4470588, 1, 1,
0.2010817, 0.5323678, 1.045724, 0, 0.4431373, 1, 1,
0.2011527, 1.80596, 0.09989798, 0, 0.4352941, 1, 1,
0.2048533, 0.396115, 1.160331, 0, 0.4313726, 1, 1,
0.2055612, -0.9188064, 3.013014, 0, 0.4235294, 1, 1,
0.2060285, 1.003424, 0.387836, 0, 0.4196078, 1, 1,
0.2121387, -0.9442163, 4.819883, 0, 0.4117647, 1, 1,
0.216879, -1.469915, 0.5349531, 0, 0.4078431, 1, 1,
0.2188387, 0.66222, 0.1855264, 0, 0.4, 1, 1,
0.2203572, 0.2872325, 1.381544, 0, 0.3921569, 1, 1,
0.2221623, -0.3468026, 3.810657, 0, 0.3882353, 1, 1,
0.2265832, -1.391366, 3.122615, 0, 0.3803922, 1, 1,
0.2353945, 0.161718, 2.775879, 0, 0.3764706, 1, 1,
0.2354653, -0.5759809, 2.338673, 0, 0.3686275, 1, 1,
0.2368452, 0.3402029, 0.9531886, 0, 0.3647059, 1, 1,
0.2402735, 0.3561756, -1.047628, 0, 0.3568628, 1, 1,
0.2410264, 0.5365817, 0.2895503, 0, 0.3529412, 1, 1,
0.2415292, 0.5319347, -0.4263371, 0, 0.345098, 1, 1,
0.2445641, -0.6678625, 2.190593, 0, 0.3411765, 1, 1,
0.2451135, 1.472634, 0.7222704, 0, 0.3333333, 1, 1,
0.2484742, 1.250769, -0.6886781, 0, 0.3294118, 1, 1,
0.2504335, 0.04742604, 0.7422249, 0, 0.3215686, 1, 1,
0.2573941, -0.03184666, 1.655711, 0, 0.3176471, 1, 1,
0.2611572, 1.339795, -0.4357264, 0, 0.3098039, 1, 1,
0.2637345, -0.3320541, 2.617456, 0, 0.3058824, 1, 1,
0.270139, -2.067275, 3.915454, 0, 0.2980392, 1, 1,
0.2705498, -1.357487, 2.35686, 0, 0.2901961, 1, 1,
0.2708806, -1.204022, 3.974107, 0, 0.2862745, 1, 1,
0.2753452, -1.785704, 3.339909, 0, 0.2784314, 1, 1,
0.2760217, -1.514791, 4.606865, 0, 0.2745098, 1, 1,
0.2770043, 0.8194824, 2.085204, 0, 0.2666667, 1, 1,
0.281768, -2.035966, 3.502004, 0, 0.2627451, 1, 1,
0.2851463, 1.320403, -0.5719852, 0, 0.254902, 1, 1,
0.286547, 0.3966567, -1.344494, 0, 0.2509804, 1, 1,
0.2895771, 1.534368, 0.2464605, 0, 0.2431373, 1, 1,
0.2950576, 0.8449451, 0.9698571, 0, 0.2392157, 1, 1,
0.2954673, 0.4237376, -1.328738, 0, 0.2313726, 1, 1,
0.2960474, 0.2537801, 0.6815439, 0, 0.227451, 1, 1,
0.2964767, -0.3252857, 4.09248, 0, 0.2196078, 1, 1,
0.2995948, 1.176384, 1.352746, 0, 0.2156863, 1, 1,
0.3001209, 0.9650072, -0.7542669, 0, 0.2078431, 1, 1,
0.3007202, -1.014054, 3.135405, 0, 0.2039216, 1, 1,
0.3069193, -1.249323, 2.526423, 0, 0.1960784, 1, 1,
0.3148046, -1.24418, 3.771774, 0, 0.1882353, 1, 1,
0.3149313, -1.967897, 3.011173, 0, 0.1843137, 1, 1,
0.3178823, -0.7936505, 2.76383, 0, 0.1764706, 1, 1,
0.3198435, -0.04789789, 2.463487, 0, 0.172549, 1, 1,
0.3218983, 0.5910039, 0.1109453, 0, 0.1647059, 1, 1,
0.3235025, -0.6926855, 1.291786, 0, 0.1607843, 1, 1,
0.3246848, -0.0839505, 0.6841252, 0, 0.1529412, 1, 1,
0.326745, 2.012951, -0.4428148, 0, 0.1490196, 1, 1,
0.3269444, 0.7885118, 0.06074597, 0, 0.1411765, 1, 1,
0.3288838, 0.6595084, 1.429792, 0, 0.1372549, 1, 1,
0.3305013, -1.761156, 5.120968, 0, 0.1294118, 1, 1,
0.3318475, 0.9067161, -0.8112058, 0, 0.1254902, 1, 1,
0.3400336, 0.2278863, -0.6782408, 0, 0.1176471, 1, 1,
0.3401542, -0.2057163, 2.58277, 0, 0.1137255, 1, 1,
0.3410921, -0.1801535, 1.753783, 0, 0.1058824, 1, 1,
0.3415427, -1.372278, 3.04138, 0, 0.09803922, 1, 1,
0.3429369, -0.5119602, 0.9321079, 0, 0.09411765, 1, 1,
0.3446835, -0.3386739, 3.848328, 0, 0.08627451, 1, 1,
0.344869, 1.054594, -0.153472, 0, 0.08235294, 1, 1,
0.3452384, 0.1827134, -0.2114781, 0, 0.07450981, 1, 1,
0.3465492, 0.4347898, 1.146037, 0, 0.07058824, 1, 1,
0.3469439, 2.205668, 0.4008293, 0, 0.0627451, 1, 1,
0.3496063, 0.5352969, -0.5229116, 0, 0.05882353, 1, 1,
0.3496232, -0.6322999, 1.873987, 0, 0.05098039, 1, 1,
0.3525517, -0.4534293, 1.644317, 0, 0.04705882, 1, 1,
0.3548909, 0.4451172, -0.9892817, 0, 0.03921569, 1, 1,
0.3619816, -2.288756, 3.033197, 0, 0.03529412, 1, 1,
0.3645026, -1.02252, 2.484942, 0, 0.02745098, 1, 1,
0.3688435, 1.111404, 0.4316653, 0, 0.02352941, 1, 1,
0.3716044, -0.5479282, 1.99399, 0, 0.01568628, 1, 1,
0.3724236, 0.6254281, 2.320729, 0, 0.01176471, 1, 1,
0.3726276, -2.178068, 3.309622, 0, 0.003921569, 1, 1,
0.3739426, -0.716056, 3.764956, 0.003921569, 0, 1, 1,
0.3743505, -0.8843175, 3.995091, 0.007843138, 0, 1, 1,
0.3817095, -0.3034405, 3.222013, 0.01568628, 0, 1, 1,
0.3884021, 1.429215, 0.1674753, 0.01960784, 0, 1, 1,
0.3900184, -0.7522311, 2.089101, 0.02745098, 0, 1, 1,
0.3960501, -0.2694842, 3.836, 0.03137255, 0, 1, 1,
0.3960575, 2.44083, -0.44808, 0.03921569, 0, 1, 1,
0.3976394, 0.6980462, 1.759038, 0.04313726, 0, 1, 1,
0.4002206, -0.2291541, 1.721279, 0.05098039, 0, 1, 1,
0.4007446, -1.455886, 2.274, 0.05490196, 0, 1, 1,
0.4022466, -0.0516107, 2.738456, 0.0627451, 0, 1, 1,
0.4030674, -1.322398, 1.997501, 0.06666667, 0, 1, 1,
0.4058301, -1.685252, 3.662225, 0.07450981, 0, 1, 1,
0.4061254, -0.2706945, 2.306512, 0.07843138, 0, 1, 1,
0.4103112, 0.1948725, 0.503449, 0.08627451, 0, 1, 1,
0.4152676, -1.024822, 1.94319, 0.09019608, 0, 1, 1,
0.4178421, -0.3687595, 2.630422, 0.09803922, 0, 1, 1,
0.4201346, -1.155741, 2.966318, 0.1058824, 0, 1, 1,
0.420663, 0.9075083, 0.7401743, 0.1098039, 0, 1, 1,
0.4222534, -1.662114, 2.695346, 0.1176471, 0, 1, 1,
0.4239005, 0.6172369, 0.2523306, 0.1215686, 0, 1, 1,
0.4269858, 1.373926, -0.02780595, 0.1294118, 0, 1, 1,
0.4276328, 0.2090759, 1.40742, 0.1333333, 0, 1, 1,
0.4296948, -1.302335, 3.988808, 0.1411765, 0, 1, 1,
0.430966, 1.586245, 0.620907, 0.145098, 0, 1, 1,
0.4313761, -0.9508638, 1.867673, 0.1529412, 0, 1, 1,
0.4349502, 1.157009, 1.338722, 0.1568628, 0, 1, 1,
0.4408777, -0.8989705, 1.163652, 0.1647059, 0, 1, 1,
0.4425589, -1.652287, 3.65753, 0.1686275, 0, 1, 1,
0.4431068, 1.42115, 0.06714269, 0.1764706, 0, 1, 1,
0.4464982, 0.6817214, 0.2785803, 0.1803922, 0, 1, 1,
0.4514132, 1.723889, 0.4946334, 0.1882353, 0, 1, 1,
0.4539643, -1.625091, 3.698243, 0.1921569, 0, 1, 1,
0.4563282, 2.659055, 0.7948489, 0.2, 0, 1, 1,
0.4615684, 1.563624, 0.3167953, 0.2078431, 0, 1, 1,
0.4664961, 0.3831222, 2.169085, 0.2117647, 0, 1, 1,
0.4690968, -0.8895472, 3.077082, 0.2196078, 0, 1, 1,
0.4715147, -0.1010471, 1.581522, 0.2235294, 0, 1, 1,
0.4733317, 0.1148489, 0.4214954, 0.2313726, 0, 1, 1,
0.4740801, -0.1635195, 3.293139, 0.2352941, 0, 1, 1,
0.4787053, 0.2509318, 1.335277, 0.2431373, 0, 1, 1,
0.4809123, -2.34528, 4.009823, 0.2470588, 0, 1, 1,
0.4879841, -0.4540744, 1.770273, 0.254902, 0, 1, 1,
0.4918272, -0.4644395, 2.458481, 0.2588235, 0, 1, 1,
0.4919534, -0.01602366, 2.858544, 0.2666667, 0, 1, 1,
0.49216, -1.589662, 2.089117, 0.2705882, 0, 1, 1,
0.4927932, -0.4978691, 3.239475, 0.2784314, 0, 1, 1,
0.4932931, 0.4229077, 0.009350648, 0.282353, 0, 1, 1,
0.4998176, -1.441887, 3.674875, 0.2901961, 0, 1, 1,
0.5057943, 0.6753693, 0.1417114, 0.2941177, 0, 1, 1,
0.5061157, 0.9111225, 1.04787, 0.3019608, 0, 1, 1,
0.5093502, 0.5028618, 0.04478223, 0.3098039, 0, 1, 1,
0.5099749, -1.512432, 2.474033, 0.3137255, 0, 1, 1,
0.5152205, -0.4179156, 2.605061, 0.3215686, 0, 1, 1,
0.5160075, -2.222039, 3.964493, 0.3254902, 0, 1, 1,
0.5249914, -0.4865568, 1.892379, 0.3333333, 0, 1, 1,
0.5253363, -0.5055497, 2.052764, 0.3372549, 0, 1, 1,
0.5282552, -2.247942, 1.259693, 0.345098, 0, 1, 1,
0.5321709, -0.5998964, 2.844316, 0.3490196, 0, 1, 1,
0.5356421, 0.719715, 0.4758285, 0.3568628, 0, 1, 1,
0.5386211, -0.1783088, 2.146337, 0.3607843, 0, 1, 1,
0.5411122, 0.09309644, 3.08907, 0.3686275, 0, 1, 1,
0.5436513, -0.07015093, 2.010827, 0.372549, 0, 1, 1,
0.5477797, 0.8844957, 0.7865381, 0.3803922, 0, 1, 1,
0.5639363, 1.309863, -0.2306335, 0.3843137, 0, 1, 1,
0.5643743, -0.8154255, 3.072742, 0.3921569, 0, 1, 1,
0.5675365, -0.3444653, 2.143254, 0.3960784, 0, 1, 1,
0.5686843, 0.2399777, 1.39485, 0.4039216, 0, 1, 1,
0.5794022, 1.022078, 0.08512812, 0.4117647, 0, 1, 1,
0.5932108, 0.6129872, -1.039438, 0.4156863, 0, 1, 1,
0.5953857, -0.1686224, 0.1569094, 0.4235294, 0, 1, 1,
0.5956872, -1.795599, 3.993386, 0.427451, 0, 1, 1,
0.5976398, 0.5780163, 1.292752, 0.4352941, 0, 1, 1,
0.5982054, -1.320614, 2.316308, 0.4392157, 0, 1, 1,
0.6011925, -0.04063072, 1.216651, 0.4470588, 0, 1, 1,
0.602201, 0.7912254, 1.272644, 0.4509804, 0, 1, 1,
0.603515, -1.527087, 2.233767, 0.4588235, 0, 1, 1,
0.6055483, 0.7815951, 1.600166, 0.4627451, 0, 1, 1,
0.6062244, 1.818711, 0.8579963, 0.4705882, 0, 1, 1,
0.6121232, -2.922129, 2.267813, 0.4745098, 0, 1, 1,
0.6146812, 0.07094675, 1.115219, 0.4823529, 0, 1, 1,
0.614971, 0.1205813, -0.5286067, 0.4862745, 0, 1, 1,
0.6176565, -0.3915752, 1.177973, 0.4941176, 0, 1, 1,
0.6178265, -0.9135086, 2.849892, 0.5019608, 0, 1, 1,
0.6185864, 0.1661431, 3.184102, 0.5058824, 0, 1, 1,
0.6227218, -0.1641459, 0.9977203, 0.5137255, 0, 1, 1,
0.6233944, 1.792492, -0.1332189, 0.5176471, 0, 1, 1,
0.6273021, -1.580263, 2.729795, 0.5254902, 0, 1, 1,
0.6332489, -0.4263346, 1.374835, 0.5294118, 0, 1, 1,
0.6349538, 1.13884, 1.114937, 0.5372549, 0, 1, 1,
0.6373599, -0.1615766, 2.651894, 0.5411765, 0, 1, 1,
0.6377959, 0.4364455, -0.2186465, 0.5490196, 0, 1, 1,
0.651106, -0.857712, 2.386705, 0.5529412, 0, 1, 1,
0.657185, -0.7168311, 2.95222, 0.5607843, 0, 1, 1,
0.6574246, 0.2981921, 0.9023908, 0.5647059, 0, 1, 1,
0.6579887, 1.096949, -0.3902417, 0.572549, 0, 1, 1,
0.6594782, -0.5344536, 3.273469, 0.5764706, 0, 1, 1,
0.6618595, 1.877752, 2.561965, 0.5843138, 0, 1, 1,
0.6641299, -1.458999, 2.22965, 0.5882353, 0, 1, 1,
0.6674158, 0.1336752, 2.296179, 0.5960785, 0, 1, 1,
0.6680287, -0.2711292, 3.112891, 0.6039216, 0, 1, 1,
0.6703941, 0.4713625, 1.28094, 0.6078432, 0, 1, 1,
0.6727021, -1.83886, 2.286193, 0.6156863, 0, 1, 1,
0.6764927, 1.397325, -0.6301855, 0.6196079, 0, 1, 1,
0.6847302, -0.4247525, 3.315541, 0.627451, 0, 1, 1,
0.6889989, 1.254036, 1.627046, 0.6313726, 0, 1, 1,
0.6894588, -0.1981734, 2.236064, 0.6392157, 0, 1, 1,
0.6928235, 0.2430376, 1.67787, 0.6431373, 0, 1, 1,
0.6962072, -0.3287447, 2.850883, 0.6509804, 0, 1, 1,
0.700619, -0.4610449, 2.287206, 0.654902, 0, 1, 1,
0.7036716, -0.5692109, 0.5608364, 0.6627451, 0, 1, 1,
0.7130961, -1.734664, 5.687745, 0.6666667, 0, 1, 1,
0.7148049, -1.384643, -0.4295962, 0.6745098, 0, 1, 1,
0.7158566, 0.4715636, 1.313668, 0.6784314, 0, 1, 1,
0.7289776, 0.2475325, 2.037302, 0.6862745, 0, 1, 1,
0.7313954, -0.5539697, 3.451141, 0.6901961, 0, 1, 1,
0.7347918, -0.1884677, 0.8471085, 0.6980392, 0, 1, 1,
0.7364215, -0.7508702, 2.314295, 0.7058824, 0, 1, 1,
0.7461374, -0.7822876, 2.361665, 0.7098039, 0, 1, 1,
0.7489868, 0.003654538, 1.483831, 0.7176471, 0, 1, 1,
0.7499111, 1.032005, -0.6216189, 0.7215686, 0, 1, 1,
0.7505816, -1.080806, 0.07916223, 0.7294118, 0, 1, 1,
0.7564962, -0.2209006, 1.498768, 0.7333333, 0, 1, 1,
0.7586625, 0.007254965, 2.560645, 0.7411765, 0, 1, 1,
0.7639761, -0.2615708, 2.795541, 0.7450981, 0, 1, 1,
0.7682155, -0.7467514, 0.962876, 0.7529412, 0, 1, 1,
0.773954, -1.020793, 3.419948, 0.7568628, 0, 1, 1,
0.7763397, -1.332098, 2.338667, 0.7647059, 0, 1, 1,
0.7805616, 1.368799, 0.4106441, 0.7686275, 0, 1, 1,
0.8031492, -0.2844796, -0.1341018, 0.7764706, 0, 1, 1,
0.8051291, 0.1477714, 3.561313, 0.7803922, 0, 1, 1,
0.808121, -0.07678901, 0.207693, 0.7882353, 0, 1, 1,
0.8120429, 1.067499, 1.471743, 0.7921569, 0, 1, 1,
0.8158413, 0.01047696, 1.952562, 0.8, 0, 1, 1,
0.8210456, 0.3758533, 0.4798681, 0.8078431, 0, 1, 1,
0.8372646, -1.627657, 2.499637, 0.8117647, 0, 1, 1,
0.8412507, -0.5943223, 1.898423, 0.8196079, 0, 1, 1,
0.8414871, -0.6594683, 2.371011, 0.8235294, 0, 1, 1,
0.8501937, 0.88642, 1.179606, 0.8313726, 0, 1, 1,
0.8519306, -0.7224694, 1.271979, 0.8352941, 0, 1, 1,
0.8527554, 0.4254115, 0.6264986, 0.8431373, 0, 1, 1,
0.8558173, -0.2192581, 5.237325, 0.8470588, 0, 1, 1,
0.8567737, 0.266462, 1.158872, 0.854902, 0, 1, 1,
0.857314, -0.2540125, 1.077323, 0.8588235, 0, 1, 1,
0.8602584, 0.5857164, 1.711719, 0.8666667, 0, 1, 1,
0.860418, -0.2730508, 2.080556, 0.8705882, 0, 1, 1,
0.8671065, 0.03571582, 1.693307, 0.8784314, 0, 1, 1,
0.8681589, -1.413688, 1.502825, 0.8823529, 0, 1, 1,
0.8803753, 0.3675651, 0.8115094, 0.8901961, 0, 1, 1,
0.8811663, -1.387072, 1.584849, 0.8941177, 0, 1, 1,
0.8900532, -1.053641, 3.201859, 0.9019608, 0, 1, 1,
0.8983473, 0.5807691, 0.1040909, 0.9098039, 0, 1, 1,
0.9032918, 0.2150202, 0.4993085, 0.9137255, 0, 1, 1,
0.904987, 1.263008, -0.01985523, 0.9215686, 0, 1, 1,
0.9140139, 0.3664492, 0.7514933, 0.9254902, 0, 1, 1,
0.9192326, 2.252026, 0.2658837, 0.9333333, 0, 1, 1,
0.9211189, 1.264676, -0.2267225, 0.9372549, 0, 1, 1,
0.9220194, -0.1157759, 3.917217, 0.945098, 0, 1, 1,
0.9235174, -0.8924022, 1.449614, 0.9490196, 0, 1, 1,
0.9266772, 1.919181, -1.875343, 0.9568627, 0, 1, 1,
0.9307651, -1.966918, 2.78263, 0.9607843, 0, 1, 1,
0.9350781, 1.183638, 0.5191011, 0.9686275, 0, 1, 1,
0.9407661, 0.9442797, 0.6432666, 0.972549, 0, 1, 1,
0.9430013, -0.09256155, 0.9280498, 0.9803922, 0, 1, 1,
0.94757, 0.9177793, 0.7846023, 0.9843137, 0, 1, 1,
0.9484469, 0.2411852, 0.5999799, 0.9921569, 0, 1, 1,
0.951272, 2.255294, 2.082512, 0.9960784, 0, 1, 1,
0.9536914, 0.2791995, 0.2576097, 1, 0, 0.9960784, 1,
0.9616027, 0.6732664, 0.7521952, 1, 0, 0.9882353, 1,
0.9644104, -0.1141876, 1.463194, 1, 0, 0.9843137, 1,
0.9644377, -0.7478355, 2.254216, 1, 0, 0.9764706, 1,
0.9711218, 1.318735, 0.6049189, 1, 0, 0.972549, 1,
0.9766645, -0.08861668, 0.9576554, 1, 0, 0.9647059, 1,
0.978214, 0.5159843, 0.268671, 1, 0, 0.9607843, 1,
0.985193, 0.9422171, 0.3090196, 1, 0, 0.9529412, 1,
0.9865654, -1.188172, 2.634056, 1, 0, 0.9490196, 1,
0.9876297, 0.1431682, 1.665491, 1, 0, 0.9411765, 1,
0.9900766, -0.7648869, 2.593089, 1, 0, 0.9372549, 1,
0.9928534, 0.7180163, -0.622703, 1, 0, 0.9294118, 1,
0.993601, 1.238875, -0.9590614, 1, 0, 0.9254902, 1,
0.998389, 0.449663, -0.02823742, 1, 0, 0.9176471, 1,
1.00597, 0.328328, 1.657371, 1, 0, 0.9137255, 1,
1.009262, -1.405869, 1.776417, 1, 0, 0.9058824, 1,
1.012215, 0.6861925, 0.779282, 1, 0, 0.9019608, 1,
1.014107, 0.5020456, 0.2457428, 1, 0, 0.8941177, 1,
1.016309, -0.2802005, 1.436325, 1, 0, 0.8862745, 1,
1.017187, 1.897609, 0.8405693, 1, 0, 0.8823529, 1,
1.01825, 0.7548668, -1.053169, 1, 0, 0.8745098, 1,
1.022364, 0.09076247, -2.18646, 1, 0, 0.8705882, 1,
1.023003, 0.1028794, 2.890125, 1, 0, 0.8627451, 1,
1.024952, 1.157912, 1.725792, 1, 0, 0.8588235, 1,
1.028786, 0.2139948, 3.007263, 1, 0, 0.8509804, 1,
1.02984, 1.158937, 2.08515, 1, 0, 0.8470588, 1,
1.031997, 0.5905089, 1.941329, 1, 0, 0.8392157, 1,
1.035239, -1.408365, 0.4002556, 1, 0, 0.8352941, 1,
1.042802, 0.03307652, 0.3031462, 1, 0, 0.827451, 1,
1.053995, -1.772, 2.030878, 1, 0, 0.8235294, 1,
1.054141, 0.5336089, 0.5940482, 1, 0, 0.8156863, 1,
1.080748, 1.01639, -0.1333712, 1, 0, 0.8117647, 1,
1.08873, 1.390387, 0.07042719, 1, 0, 0.8039216, 1,
1.092556, -1.754532, 1.184657, 1, 0, 0.7960784, 1,
1.104324, 0.4238876, -0.1578197, 1, 0, 0.7921569, 1,
1.104851, 1.271672, -0.661232, 1, 0, 0.7843137, 1,
1.105901, -0.1405282, 1.506075, 1, 0, 0.7803922, 1,
1.115775, 0.2562506, 0.3009722, 1, 0, 0.772549, 1,
1.116743, 0.7214404, 1.141262, 1, 0, 0.7686275, 1,
1.120202, -0.2783758, 0.958078, 1, 0, 0.7607843, 1,
1.120339, 0.6022627, 1.080154, 1, 0, 0.7568628, 1,
1.120425, 1.256978, -0.7024405, 1, 0, 0.7490196, 1,
1.120497, -1.29901, 2.199362, 1, 0, 0.7450981, 1,
1.121337, 0.5162816, 1.544819, 1, 0, 0.7372549, 1,
1.12386, 0.544544, -0.1007771, 1, 0, 0.7333333, 1,
1.124375, 0.2897351, 1.186487, 1, 0, 0.7254902, 1,
1.129398, 0.04804552, 3.753594, 1, 0, 0.7215686, 1,
1.130201, -0.4910525, 1.360932, 1, 0, 0.7137255, 1,
1.131035, -0.4746788, 1.417089, 1, 0, 0.7098039, 1,
1.133019, 1.398041, -0.655494, 1, 0, 0.7019608, 1,
1.135364, 0.4502873, 0.8207256, 1, 0, 0.6941177, 1,
1.142254, -0.7898952, 0.58517, 1, 0, 0.6901961, 1,
1.142263, -1.394563, 2.431671, 1, 0, 0.682353, 1,
1.155843, 0.7465238, 1.916192, 1, 0, 0.6784314, 1,
1.167173, 0.6205786, 1.986734, 1, 0, 0.6705883, 1,
1.168638, -1.262319, 2.985697, 1, 0, 0.6666667, 1,
1.179997, 0.07958075, 0.9729091, 1, 0, 0.6588235, 1,
1.183473, 0.6623507, 3.228698, 1, 0, 0.654902, 1,
1.188019, 1.958178, 0.586246, 1, 0, 0.6470588, 1,
1.188255, -0.6410563, 1.481099, 1, 0, 0.6431373, 1,
1.192081, -0.7241997, 2.70531, 1, 0, 0.6352941, 1,
1.193867, 1.085806, 1.825168, 1, 0, 0.6313726, 1,
1.194548, 0.3049023, 1.416051, 1, 0, 0.6235294, 1,
1.204952, 0.6970843, 0.2321069, 1, 0, 0.6196079, 1,
1.205292, -0.722137, 3.307727, 1, 0, 0.6117647, 1,
1.210166, 0.1990605, 0.6790958, 1, 0, 0.6078432, 1,
1.223193, 0.8151838, 0.3192378, 1, 0, 0.6, 1,
1.224424, -1.137856, 2.471837, 1, 0, 0.5921569, 1,
1.233003, -0.5864474, 1.970143, 1, 0, 0.5882353, 1,
1.233544, 0.4688076, 2.277534, 1, 0, 0.5803922, 1,
1.236076, 1.328836, 0.5970824, 1, 0, 0.5764706, 1,
1.243495, 0.09171911, -1.117517, 1, 0, 0.5686275, 1,
1.243877, 1.057947, 0.7550675, 1, 0, 0.5647059, 1,
1.245199, -0.352785, -0.02397695, 1, 0, 0.5568628, 1,
1.246025, 0.1866913, 2.009557, 1, 0, 0.5529412, 1,
1.246549, 0.6106667, 0.2530399, 1, 0, 0.5450981, 1,
1.248506, -2.829784, 3.581457, 1, 0, 0.5411765, 1,
1.250001, 0.5512996, 2.828961, 1, 0, 0.5333334, 1,
1.260057, 0.3296413, 0.1541104, 1, 0, 0.5294118, 1,
1.264282, 0.4979027, 0.8644061, 1, 0, 0.5215687, 1,
1.272508, 1.057174, 0.8260322, 1, 0, 0.5176471, 1,
1.295681, -0.8728076, 2.57105, 1, 0, 0.509804, 1,
1.302757, -0.3407293, 1.140815, 1, 0, 0.5058824, 1,
1.310592, 0.3522551, -1.171905, 1, 0, 0.4980392, 1,
1.315475, -0.6555989, 2.585814, 1, 0, 0.4901961, 1,
1.322971, -0.1148475, 1.599705, 1, 0, 0.4862745, 1,
1.337688, -0.6794375, 1.66288, 1, 0, 0.4784314, 1,
1.34726, 2.001096, -0.9521327, 1, 0, 0.4745098, 1,
1.349653, -0.7623037, 2.426749, 1, 0, 0.4666667, 1,
1.353889, 0.2728292, 1.086251, 1, 0, 0.4627451, 1,
1.361207, 0.8484933, 1.212825, 1, 0, 0.454902, 1,
1.37628, -0.6438503, 0.4036931, 1, 0, 0.4509804, 1,
1.38183, -1.629608, 1.773054, 1, 0, 0.4431373, 1,
1.381875, -0.6933132, 4.061136, 1, 0, 0.4392157, 1,
1.389386, 0.9637716, 1.53956, 1, 0, 0.4313726, 1,
1.399524, 1.152158, 0.946219, 1, 0, 0.427451, 1,
1.42375, -0.638416, 1.647915, 1, 0, 0.4196078, 1,
1.425766, -0.01374221, 1.81476, 1, 0, 0.4156863, 1,
1.439351, -0.5275044, 2.431273, 1, 0, 0.4078431, 1,
1.448789, -1.495401, 3.69181, 1, 0, 0.4039216, 1,
1.470251, 1.121576, -0.4027201, 1, 0, 0.3960784, 1,
1.478407, -0.6945017, 1.90075, 1, 0, 0.3882353, 1,
1.482703, -0.98079, 2.847274, 1, 0, 0.3843137, 1,
1.493387, 1.48165, -0.5520334, 1, 0, 0.3764706, 1,
1.497745, -0.282885, 0.9583946, 1, 0, 0.372549, 1,
1.522224, -0.6927279, 4.531515, 1, 0, 0.3647059, 1,
1.527796, 1.395704, 0.6445722, 1, 0, 0.3607843, 1,
1.528859, -0.06246335, 0.2344293, 1, 0, 0.3529412, 1,
1.534754, -1.687721, 2.048629, 1, 0, 0.3490196, 1,
1.557456, 0.3611085, 2.009269, 1, 0, 0.3411765, 1,
1.559384, -0.07762875, 1.628253, 1, 0, 0.3372549, 1,
1.561485, -0.447468, 2.841962, 1, 0, 0.3294118, 1,
1.570657, -0.1555125, 3.406771, 1, 0, 0.3254902, 1,
1.574395, -1.019403, 3.132023, 1, 0, 0.3176471, 1,
1.575717, 1.987927, 0.2173649, 1, 0, 0.3137255, 1,
1.582338, 0.7912256, 1.088993, 1, 0, 0.3058824, 1,
1.582463, 0.4861655, 0.8821524, 1, 0, 0.2980392, 1,
1.589162, -0.3277856, 1.019336, 1, 0, 0.2941177, 1,
1.594549, -1.032471, 3.25616, 1, 0, 0.2862745, 1,
1.600796, 0.7848244, 0.6323035, 1, 0, 0.282353, 1,
1.620351, 0.5220227, 0.5722419, 1, 0, 0.2745098, 1,
1.621935, 0.8641127, 1.435978, 1, 0, 0.2705882, 1,
1.627559, -0.1471504, 2.257952, 1, 0, 0.2627451, 1,
1.635467, -1.255468, 1.270397, 1, 0, 0.2588235, 1,
1.635849, 0.838873, -0.4527821, 1, 0, 0.2509804, 1,
1.666652, 0.4193062, 0.581574, 1, 0, 0.2470588, 1,
1.68344, -0.1216959, 1.567216, 1, 0, 0.2392157, 1,
1.685945, -1.668382, 2.715378, 1, 0, 0.2352941, 1,
1.692335, -0.9406856, 1.043656, 1, 0, 0.227451, 1,
1.694893, -0.8364928, 2.752957, 1, 0, 0.2235294, 1,
1.695358, 0.1030464, 0.693889, 1, 0, 0.2156863, 1,
1.704457, -0.2575508, 2.039215, 1, 0, 0.2117647, 1,
1.72963, 0.1088704, 0.5111878, 1, 0, 0.2039216, 1,
1.731675, 1.35702, 1.227113, 1, 0, 0.1960784, 1,
1.748215, 0.7927568, 2.834283, 1, 0, 0.1921569, 1,
1.749238, 0.3117918, 1.636394, 1, 0, 0.1843137, 1,
1.753627, -1.826016, 1.203174, 1, 0, 0.1803922, 1,
1.755096, -1.622293, 0.5711042, 1, 0, 0.172549, 1,
1.755312, -0.8512797, 2.976059, 1, 0, 0.1686275, 1,
1.764781, -0.0896564, 1.895666, 1, 0, 0.1607843, 1,
1.777343, -0.1876493, 1.352069, 1, 0, 0.1568628, 1,
1.787364, -1.114256, 3.749089, 1, 0, 0.1490196, 1,
1.792341, 1.043927, -1.210221, 1, 0, 0.145098, 1,
1.803468, 0.5738991, 2.308692, 1, 0, 0.1372549, 1,
1.80576, -1.338994, 2.089102, 1, 0, 0.1333333, 1,
1.814026, -0.9903381, 1.652466, 1, 0, 0.1254902, 1,
1.814372, -0.02185995, 1.886899, 1, 0, 0.1215686, 1,
1.854198, -0.1964059, 2.830234, 1, 0, 0.1137255, 1,
1.906606, 0.9732771, -0.1956336, 1, 0, 0.1098039, 1,
1.929245, 0.08930381, 3.485801, 1, 0, 0.1019608, 1,
1.963186, -0.06486094, 2.398879, 1, 0, 0.09411765, 1,
1.969429, 0.100599, 2.484881, 1, 0, 0.09019608, 1,
1.983854, 0.528834, 1.144788, 1, 0, 0.08235294, 1,
1.992378, -0.2571137, 0.2692568, 1, 0, 0.07843138, 1,
2.05063, -0.8001451, 0.9493779, 1, 0, 0.07058824, 1,
2.115586, 0.5046542, 1.390831, 1, 0, 0.06666667, 1,
2.116644, 0.6456306, 0.3283264, 1, 0, 0.05882353, 1,
2.117274, 0.389521, 0.4759291, 1, 0, 0.05490196, 1,
2.206901, 0.6619848, 2.002764, 1, 0, 0.04705882, 1,
2.455225, 1.559665, -1.205131, 1, 0, 0.04313726, 1,
2.456424, 0.8680562, 0.6646027, 1, 0, 0.03529412, 1,
2.527093, -0.152465, 0.7732252, 1, 0, 0.03137255, 1,
2.689495, 0.669597, 1.815395, 1, 0, 0.02352941, 1,
2.982189, -0.8889545, 1.595564, 1, 0, 0.01960784, 1,
2.987913, 0.5314296, 1.993338, 1, 0, 0.01176471, 1,
3.599659, 0.3152367, 0.04888292, 1, 0, 0.007843138, 1
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
-0.4131066, -4.198209, -7.155966, 0, -0.5, 0.5, 0.5,
-0.4131066, -4.198209, -7.155966, 1, -0.5, 0.5, 0.5,
-0.4131066, -4.198209, -7.155966, 1, 1.5, 0.5, 0.5,
-0.4131066, -4.198209, -7.155966, 0, 1.5, 0.5, 0.5
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
-5.7862, -0.2633637, -7.155966, 0, -0.5, 0.5, 0.5,
-5.7862, -0.2633637, -7.155966, 1, -0.5, 0.5, 0.5,
-5.7862, -0.2633637, -7.155966, 1, 1.5, 0.5, 0.5,
-5.7862, -0.2633637, -7.155966, 0, 1.5, 0.5, 0.5
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
-5.7862, -4.198209, 0.2445478, 0, -0.5, 0.5, 0.5,
-5.7862, -4.198209, 0.2445478, 1, -0.5, 0.5, 0.5,
-5.7862, -4.198209, 0.2445478, 1, 1.5, 0.5, 0.5,
-5.7862, -4.198209, 0.2445478, 0, 1.5, 0.5, 0.5
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
-4, -3.290168, -5.448155,
2, -3.290168, -5.448155,
-4, -3.290168, -5.448155,
-4, -3.441508, -5.73279,
-2, -3.290168, -5.448155,
-2, -3.441508, -5.73279,
0, -3.290168, -5.448155,
0, -3.441508, -5.73279,
2, -3.290168, -5.448155,
2, -3.441508, -5.73279
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
"-4",
"-2",
"0",
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
-4, -3.744188, -6.302061, 0, -0.5, 0.5, 0.5,
-4, -3.744188, -6.302061, 1, -0.5, 0.5, 0.5,
-4, -3.744188, -6.302061, 1, 1.5, 0.5, 0.5,
-4, -3.744188, -6.302061, 0, 1.5, 0.5, 0.5,
-2, -3.744188, -6.302061, 0, -0.5, 0.5, 0.5,
-2, -3.744188, -6.302061, 1, -0.5, 0.5, 0.5,
-2, -3.744188, -6.302061, 1, 1.5, 0.5, 0.5,
-2, -3.744188, -6.302061, 0, 1.5, 0.5, 0.5,
0, -3.744188, -6.302061, 0, -0.5, 0.5, 0.5,
0, -3.744188, -6.302061, 1, -0.5, 0.5, 0.5,
0, -3.744188, -6.302061, 1, 1.5, 0.5, 0.5,
0, -3.744188, -6.302061, 0, 1.5, 0.5, 0.5,
2, -3.744188, -6.302061, 0, -0.5, 0.5, 0.5,
2, -3.744188, -6.302061, 1, -0.5, 0.5, 0.5,
2, -3.744188, -6.302061, 1, 1.5, 0.5, 0.5,
2, -3.744188, -6.302061, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.546255, -3, -5.448155,
-4.546255, 2, -5.448155,
-4.546255, -3, -5.448155,
-4.752913, -3, -5.73279,
-4.546255, -2, -5.448155,
-4.752913, -2, -5.73279,
-4.546255, -1, -5.448155,
-4.752913, -1, -5.73279,
-4.546255, 0, -5.448155,
-4.752913, 0, -5.73279,
-4.546255, 1, -5.448155,
-4.752913, 1, -5.73279,
-4.546255, 2, -5.448155,
-4.752913, 2, -5.73279
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
-5.166228, -3, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, -3, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, -3, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, -3, -6.302061, 0, 1.5, 0.5, 0.5,
-5.166228, -2, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, -2, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, -2, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, -2, -6.302061, 0, 1.5, 0.5, 0.5,
-5.166228, -1, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, -1, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, -1, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, -1, -6.302061, 0, 1.5, 0.5, 0.5,
-5.166228, 0, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, 0, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, 0, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, 0, -6.302061, 0, 1.5, 0.5, 0.5,
-5.166228, 1, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, 1, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, 1, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, 1, -6.302061, 0, 1.5, 0.5, 0.5,
-5.166228, 2, -6.302061, 0, -0.5, 0.5, 0.5,
-5.166228, 2, -6.302061, 1, -0.5, 0.5, 0.5,
-5.166228, 2, -6.302061, 1, 1.5, 0.5, 0.5,
-5.166228, 2, -6.302061, 0, 1.5, 0.5, 0.5
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
-4.546255, -3.290168, -4,
-4.546255, -3.290168, 4,
-4.546255, -3.290168, -4,
-4.752913, -3.441508, -4,
-4.546255, -3.290168, -2,
-4.752913, -3.441508, -2,
-4.546255, -3.290168, 0,
-4.752913, -3.441508, 0,
-4.546255, -3.290168, 2,
-4.752913, -3.441508, 2,
-4.546255, -3.290168, 4,
-4.752913, -3.441508, 4
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
-5.166228, -3.744188, -4, 0, -0.5, 0.5, 0.5,
-5.166228, -3.744188, -4, 1, -0.5, 0.5, 0.5,
-5.166228, -3.744188, -4, 1, 1.5, 0.5, 0.5,
-5.166228, -3.744188, -4, 0, 1.5, 0.5, 0.5,
-5.166228, -3.744188, -2, 0, -0.5, 0.5, 0.5,
-5.166228, -3.744188, -2, 1, -0.5, 0.5, 0.5,
-5.166228, -3.744188, -2, 1, 1.5, 0.5, 0.5,
-5.166228, -3.744188, -2, 0, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 0, 0, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 0, 1, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 0, 1, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 0, 0, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 2, 0, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 2, 1, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 2, 1, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 2, 0, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 4, 0, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 4, 1, -0.5, 0.5, 0.5,
-5.166228, -3.744188, 4, 1, 1.5, 0.5, 0.5,
-5.166228, -3.744188, 4, 0, 1.5, 0.5, 0.5
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
-4.546255, -3.290168, -5.448155,
-4.546255, 2.76344, -5.448155,
-4.546255, -3.290168, 5.937251,
-4.546255, 2.76344, 5.937251,
-4.546255, -3.290168, -5.448155,
-4.546255, -3.290168, 5.937251,
-4.546255, 2.76344, -5.448155,
-4.546255, 2.76344, 5.937251,
-4.546255, -3.290168, -5.448155,
3.720042, -3.290168, -5.448155,
-4.546255, -3.290168, 5.937251,
3.720042, -3.290168, 5.937251,
-4.546255, 2.76344, -5.448155,
3.720042, 2.76344, -5.448155,
-4.546255, 2.76344, 5.937251,
3.720042, 2.76344, 5.937251,
3.720042, -3.290168, -5.448155,
3.720042, 2.76344, -5.448155,
3.720042, -3.290168, 5.937251,
3.720042, 2.76344, 5.937251,
3.720042, -3.290168, -5.448155,
3.720042, -3.290168, 5.937251,
3.720042, 2.76344, -5.448155,
3.720042, 2.76344, 5.937251
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
var radius = 8.17889;
var distance = 36.38881;
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
mvMatrix.translate( 0.4131066, 0.2633637, -0.2445478 );
mvMatrix.scale( 1.069787, 1.460811, 0.7767116 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.38881);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


