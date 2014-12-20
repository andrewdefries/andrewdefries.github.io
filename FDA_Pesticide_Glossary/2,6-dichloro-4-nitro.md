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
-4.000618, 0.3967807, -1.397856, 1, 0, 0, 1,
-2.983241, 0.3577738, -0.4555568, 1, 0.007843138, 0, 1,
-2.77356, -2.051919, -0.5997779, 1, 0.01176471, 0, 1,
-2.771429, -0.5578754, 0.1795905, 1, 0.01960784, 0, 1,
-2.676122, -0.5250593, -0.9385347, 1, 0.02352941, 0, 1,
-2.569652, 0.3991265, -1.163042, 1, 0.03137255, 0, 1,
-2.525369, -0.40391, 0.3400157, 1, 0.03529412, 0, 1,
-2.4103, 0.921568, -2.158846, 1, 0.04313726, 0, 1,
-2.333102, 0.3912299, -1.965761, 1, 0.04705882, 0, 1,
-2.212659, -2.820763, -4.028936, 1, 0.05490196, 0, 1,
-2.208978, 0.7840122, -2.577433, 1, 0.05882353, 0, 1,
-2.201098, -1.985721, -1.993313, 1, 0.06666667, 0, 1,
-2.200267, -0.5860115, -1.907739, 1, 0.07058824, 0, 1,
-2.181589, 1.830189, 1.346686, 1, 0.07843138, 0, 1,
-2.138648, 0.6375962, -1.494962, 1, 0.08235294, 0, 1,
-2.088559, -0.08182759, -0.9903493, 1, 0.09019608, 0, 1,
-2.050894, 0.746829, -0.3575209, 1, 0.09411765, 0, 1,
-2.04423, -0.08062024, -1.764928, 1, 0.1019608, 0, 1,
-2.033901, 0.4788762, -1.122864, 1, 0.1098039, 0, 1,
-2.027323, -2.189068, -2.854812, 1, 0.1137255, 0, 1,
-1.997726, -0.2113195, -0.337429, 1, 0.1215686, 0, 1,
-1.981354, -2.715403, -2.291842, 1, 0.1254902, 0, 1,
-1.956689, -0.165873, -1.581445, 1, 0.1333333, 0, 1,
-1.950923, -0.9306348, -2.294395, 1, 0.1372549, 0, 1,
-1.930861, -0.3630826, -1.317089, 1, 0.145098, 0, 1,
-1.911405, -2.277094, -1.712862, 1, 0.1490196, 0, 1,
-1.90729, -0.005179426, -1.198467, 1, 0.1568628, 0, 1,
-1.890854, -1.305814, -2.770365, 1, 0.1607843, 0, 1,
-1.869508, -0.717997, -0.8459073, 1, 0.1686275, 0, 1,
-1.859087, 0.7790891, 1.539127, 1, 0.172549, 0, 1,
-1.853351, 1.279687, 0.4647338, 1, 0.1803922, 0, 1,
-1.825582, 0.8681974, -0.9441884, 1, 0.1843137, 0, 1,
-1.807072, 1.134464, -2.403854, 1, 0.1921569, 0, 1,
-1.805384, -0.9668958, -3.600992, 1, 0.1960784, 0, 1,
-1.802946, -2.042841, -1.593988, 1, 0.2039216, 0, 1,
-1.79891, -0.4689131, -1.787643, 1, 0.2117647, 0, 1,
-1.794675, 1.601335, -0.7074916, 1, 0.2156863, 0, 1,
-1.794667, 1.008965, -0.4291088, 1, 0.2235294, 0, 1,
-1.793369, 0.3195255, -1.410806, 1, 0.227451, 0, 1,
-1.790459, 1.079379, -2.194291, 1, 0.2352941, 0, 1,
-1.789451, 1.007045, -1.487677, 1, 0.2392157, 0, 1,
-1.780296, -1.398079, -3.370845, 1, 0.2470588, 0, 1,
-1.763334, -0.8416528, -1.159773, 1, 0.2509804, 0, 1,
-1.752089, 0.2204041, 0.4051737, 1, 0.2588235, 0, 1,
-1.743662, 1.004148, -1.993656, 1, 0.2627451, 0, 1,
-1.736684, -0.4570401, -2.525973, 1, 0.2705882, 0, 1,
-1.728894, -0.5856967, -3.194167, 1, 0.2745098, 0, 1,
-1.727134, -1.162761, -2.378521, 1, 0.282353, 0, 1,
-1.721876, -1.080654, -2.478991, 1, 0.2862745, 0, 1,
-1.710481, 0.1167895, -1.440688, 1, 0.2941177, 0, 1,
-1.693326, -0.1202164, -2.220185, 1, 0.3019608, 0, 1,
-1.658986, 0.2678221, -1.263036, 1, 0.3058824, 0, 1,
-1.649843, 0.1851704, -0.9905382, 1, 0.3137255, 0, 1,
-1.64482, -0.8415143, -3.683836, 1, 0.3176471, 0, 1,
-1.641247, -0.8930544, -2.165113, 1, 0.3254902, 0, 1,
-1.635206, -0.299407, 0.2550369, 1, 0.3294118, 0, 1,
-1.629233, -0.5116256, -1.06212, 1, 0.3372549, 0, 1,
-1.616525, -0.3206195, -3.861532, 1, 0.3411765, 0, 1,
-1.615342, -1.123262, -1.705264, 1, 0.3490196, 0, 1,
-1.604365, 0.2305148, -2.367974, 1, 0.3529412, 0, 1,
-1.602589, 0.459377, -1.91531, 1, 0.3607843, 0, 1,
-1.589802, 0.7839872, -0.4732915, 1, 0.3647059, 0, 1,
-1.586072, -0.2634793, -0.7490157, 1, 0.372549, 0, 1,
-1.570498, 0.8572209, -2.645725, 1, 0.3764706, 0, 1,
-1.560236, 0.2228567, -0.03086383, 1, 0.3843137, 0, 1,
-1.555157, 0.5168453, -0.8441839, 1, 0.3882353, 0, 1,
-1.553843, 0.9197022, -1.64188, 1, 0.3960784, 0, 1,
-1.552643, 0.3163229, -1.615214, 1, 0.4039216, 0, 1,
-1.540873, -0.04755703, -2.680551, 1, 0.4078431, 0, 1,
-1.533426, 0.7001384, 0.126281, 1, 0.4156863, 0, 1,
-1.526417, -1.590508, -3.305679, 1, 0.4196078, 0, 1,
-1.505976, -0.1765325, -1.843151, 1, 0.427451, 0, 1,
-1.497016, 1.297799, 2.689774, 1, 0.4313726, 0, 1,
-1.469528, -0.575822, -1.412777, 1, 0.4392157, 0, 1,
-1.455936, -0.9599759, -2.670434, 1, 0.4431373, 0, 1,
-1.446652, -1.515367, -2.901967, 1, 0.4509804, 0, 1,
-1.433273, 0.001783326, -2.598097, 1, 0.454902, 0, 1,
-1.432485, -0.02305493, -0.485091, 1, 0.4627451, 0, 1,
-1.409231, 0.7376889, -1.416797, 1, 0.4666667, 0, 1,
-1.401717, 2.590098, -0.5469779, 1, 0.4745098, 0, 1,
-1.380256, 1.230651, -0.2609455, 1, 0.4784314, 0, 1,
-1.368239, 0.273517, -2.29284, 1, 0.4862745, 0, 1,
-1.365706, 0.662168, -1.279922, 1, 0.4901961, 0, 1,
-1.357963, 0.1417422, -2.65371, 1, 0.4980392, 0, 1,
-1.34126, -0.2055598, -1.813511, 1, 0.5058824, 0, 1,
-1.336506, -0.7722216, -1.13173, 1, 0.509804, 0, 1,
-1.335654, -0.1368442, -1.707687, 1, 0.5176471, 0, 1,
-1.332916, 0.5461035, -2.717922, 1, 0.5215687, 0, 1,
-1.329735, -0.460297, -3.72691, 1, 0.5294118, 0, 1,
-1.328302, -0.6835075, -2.268935, 1, 0.5333334, 0, 1,
-1.327373, -0.07936538, -1.19729, 1, 0.5411765, 0, 1,
-1.323384, -1.135018, -0.8814544, 1, 0.5450981, 0, 1,
-1.322101, -1.312606, -2.040207, 1, 0.5529412, 0, 1,
-1.313771, 0.6593915, -3.592277, 1, 0.5568628, 0, 1,
-1.312203, -0.1009513, -2.035997, 1, 0.5647059, 0, 1,
-1.307578, 0.9428753, -0.7698896, 1, 0.5686275, 0, 1,
-1.297449, 2.491981, 0.1512763, 1, 0.5764706, 0, 1,
-1.288148, 0.07947541, -1.266086, 1, 0.5803922, 0, 1,
-1.287696, -0.2801034, -2.347276, 1, 0.5882353, 0, 1,
-1.282373, -0.5282655, -0.6470152, 1, 0.5921569, 0, 1,
-1.276803, -0.2800433, -2.660455, 1, 0.6, 0, 1,
-1.274241, -0.1197876, -2.865904, 1, 0.6078432, 0, 1,
-1.264713, -0.6207991, -4.076876, 1, 0.6117647, 0, 1,
-1.259969, -0.4414958, -3.366659, 1, 0.6196079, 0, 1,
-1.256984, -1.482807, -2.110278, 1, 0.6235294, 0, 1,
-1.25509, 1.790086, -0.4570585, 1, 0.6313726, 0, 1,
-1.253053, 0.5713165, -0.5352357, 1, 0.6352941, 0, 1,
-1.250561, -1.13224, -2.692937, 1, 0.6431373, 0, 1,
-1.248639, -0.01099473, 1.361645, 1, 0.6470588, 0, 1,
-1.244131, -0.4840592, 0.1343886, 1, 0.654902, 0, 1,
-1.235348, -1.011701, -3.159002, 1, 0.6588235, 0, 1,
-1.233986, -0.5898991, -2.040252, 1, 0.6666667, 0, 1,
-1.229531, -0.1160775, -1.783572, 1, 0.6705883, 0, 1,
-1.228361, -0.6334491, -0.9821659, 1, 0.6784314, 0, 1,
-1.21983, 0.1765568, -3.876581, 1, 0.682353, 0, 1,
-1.209845, 1.181104, -2.577828, 1, 0.6901961, 0, 1,
-1.197209, 0.8608784, -0.8415182, 1, 0.6941177, 0, 1,
-1.187494, -0.3995832, -0.7820557, 1, 0.7019608, 0, 1,
-1.182341, 0.1419882, -0.4354426, 1, 0.7098039, 0, 1,
-1.167013, -0.4057208, -1.436892, 1, 0.7137255, 0, 1,
-1.15958, 0.5866365, -1.922729, 1, 0.7215686, 0, 1,
-1.158962, 1.414431, 0.5261706, 1, 0.7254902, 0, 1,
-1.157744, -0.9210988, -2.07965, 1, 0.7333333, 0, 1,
-1.145353, 0.5718314, 0.1954612, 1, 0.7372549, 0, 1,
-1.129668, 0.8930212, -0.2060059, 1, 0.7450981, 0, 1,
-1.11403, 0.3163641, -1.770187, 1, 0.7490196, 0, 1,
-1.113708, -0.6587856, -1.90328, 1, 0.7568628, 0, 1,
-1.109941, -0.4389953, -1.469062, 1, 0.7607843, 0, 1,
-1.085744, 0.1563787, -2.184714, 1, 0.7686275, 0, 1,
-1.084944, 1.992236, 1.433442, 1, 0.772549, 0, 1,
-1.074769, -0.7727233, -2.191734, 1, 0.7803922, 0, 1,
-1.072759, -0.1899476, -2.717693, 1, 0.7843137, 0, 1,
-1.06545, 1.568005, -1.235199, 1, 0.7921569, 0, 1,
-1.057418, 1.20538, -1.183173, 1, 0.7960784, 0, 1,
-1.050204, -0.5257587, -1.71601, 1, 0.8039216, 0, 1,
-1.047614, 0.619359, -0.1117332, 1, 0.8117647, 0, 1,
-1.038437, 0.2145898, -2.421731, 1, 0.8156863, 0, 1,
-1.023804, -0.03283259, -2.314334, 1, 0.8235294, 0, 1,
-1.018588, -1.305052, -2.152969, 1, 0.827451, 0, 1,
-1.014065, -0.9740544, -3.282364, 1, 0.8352941, 0, 1,
-1.012873, 1.152058, -0.1151813, 1, 0.8392157, 0, 1,
-1.01017, 0.6980137, -0.8017145, 1, 0.8470588, 0, 1,
-1.004526, -0.3032935, -2.554137, 1, 0.8509804, 0, 1,
-0.9959035, 1.210556, -1.898503, 1, 0.8588235, 0, 1,
-0.9927776, 8.365466e-05, -0.9403906, 1, 0.8627451, 0, 1,
-0.9911163, -0.5250646, -1.973987, 1, 0.8705882, 0, 1,
-0.990565, -0.7631691, -3.380933, 1, 0.8745098, 0, 1,
-0.9863566, 0.03475899, -0.1398074, 1, 0.8823529, 0, 1,
-0.9861593, 0.9156035, 0.08624319, 1, 0.8862745, 0, 1,
-0.9848502, -1.188798, -2.819127, 1, 0.8941177, 0, 1,
-0.9822004, 0.2142768, -2.718784, 1, 0.8980392, 0, 1,
-0.97995, 1.850283, 0.7460577, 1, 0.9058824, 0, 1,
-0.9757336, -2.940289, -4.149659, 1, 0.9137255, 0, 1,
-0.9757328, -1.061306, -2.185786, 1, 0.9176471, 0, 1,
-0.9732857, 1.02662, 1.145198, 1, 0.9254902, 0, 1,
-0.9683644, 0.1547055, -0.307496, 1, 0.9294118, 0, 1,
-0.9574853, 0.7801272, -1.34295, 1, 0.9372549, 0, 1,
-0.9519369, -0.4598728, -3.883022, 1, 0.9411765, 0, 1,
-0.9385976, -0.8453931, -4.049837, 1, 0.9490196, 0, 1,
-0.9336429, -0.1851699, -2.282808, 1, 0.9529412, 0, 1,
-0.9307446, -0.5390809, -2.177341, 1, 0.9607843, 0, 1,
-0.9250025, 0.1919222, -2.002194, 1, 0.9647059, 0, 1,
-0.9179099, -0.3979662, -1.733781, 1, 0.972549, 0, 1,
-0.8997366, -0.01539071, -1.097725, 1, 0.9764706, 0, 1,
-0.8944346, 1.043215, 0.07852961, 1, 0.9843137, 0, 1,
-0.8846521, 0.09461452, -0.7318704, 1, 0.9882353, 0, 1,
-0.8831133, -1.33309, -1.52529, 1, 0.9960784, 0, 1,
-0.8824353, 0.5614009, -1.977722, 0.9960784, 1, 0, 1,
-0.8703782, 1.053399, 0.2772674, 0.9921569, 1, 0, 1,
-0.87033, -1.2513, -3.138574, 0.9843137, 1, 0, 1,
-0.8691033, 1.944239, -0.9144628, 0.9803922, 1, 0, 1,
-0.8685466, 0.05232064, 0.07112268, 0.972549, 1, 0, 1,
-0.8536736, -0.3134819, -2.206594, 0.9686275, 1, 0, 1,
-0.8477649, -0.2318677, -1.670361, 0.9607843, 1, 0, 1,
-0.8463861, 0.1882106, -2.084821, 0.9568627, 1, 0, 1,
-0.8393804, -0.3053891, -1.165402, 0.9490196, 1, 0, 1,
-0.8325894, 0.4303428, -0.3750317, 0.945098, 1, 0, 1,
-0.8284563, 0.5350939, -0.1278088, 0.9372549, 1, 0, 1,
-0.8224561, 0.1877111, -2.985689, 0.9333333, 1, 0, 1,
-0.8165126, 0.9239763, -0.7453008, 0.9254902, 1, 0, 1,
-0.813404, -1.34277, -1.875134, 0.9215686, 1, 0, 1,
-0.8130047, -0.4522982, -2.007621, 0.9137255, 1, 0, 1,
-0.8041688, -0.6751574, -1.290082, 0.9098039, 1, 0, 1,
-0.7982564, -0.4066765, -3.613017, 0.9019608, 1, 0, 1,
-0.7967445, 0.9996927, -2.906292, 0.8941177, 1, 0, 1,
-0.7937519, 2.131789, -1.226086, 0.8901961, 1, 0, 1,
-0.7827269, 0.7987577, -1.02705, 0.8823529, 1, 0, 1,
-0.7764971, 0.7088337, -0.1815754, 0.8784314, 1, 0, 1,
-0.7747882, 1.609061, -0.3188192, 0.8705882, 1, 0, 1,
-0.7696767, 1.565845, 0.7263715, 0.8666667, 1, 0, 1,
-0.7616842, -0.01137354, 0.4912349, 0.8588235, 1, 0, 1,
-0.7541505, -0.03631781, -0.9368057, 0.854902, 1, 0, 1,
-0.7506912, -1.134679, -2.602187, 0.8470588, 1, 0, 1,
-0.7490298, 0.2155465, -0.4172761, 0.8431373, 1, 0, 1,
-0.7471038, 0.875793, -1.016075, 0.8352941, 1, 0, 1,
-0.7392895, 2.279812, -0.5555071, 0.8313726, 1, 0, 1,
-0.7381816, 0.3004861, -0.7935039, 0.8235294, 1, 0, 1,
-0.7367271, 0.8017157, -1.923719, 0.8196079, 1, 0, 1,
-0.7343767, 0.3219595, -1.668784, 0.8117647, 1, 0, 1,
-0.7300829, 0.4787472, -1.935642, 0.8078431, 1, 0, 1,
-0.7289415, 0.9701935, -0.2595892, 0.8, 1, 0, 1,
-0.7274491, 0.02739624, 0.1203029, 0.7921569, 1, 0, 1,
-0.7270983, 2.100657, -1.272486, 0.7882353, 1, 0, 1,
-0.7254182, -1.406469, -2.557896, 0.7803922, 1, 0, 1,
-0.7236688, -0.63222, -0.3093615, 0.7764706, 1, 0, 1,
-0.7218168, 0.5201921, -1.562501, 0.7686275, 1, 0, 1,
-0.7114142, 1.637519, 0.1054273, 0.7647059, 1, 0, 1,
-0.7105667, -0.9190403, -2.453768, 0.7568628, 1, 0, 1,
-0.7068526, 0.2406588, -0.5720481, 0.7529412, 1, 0, 1,
-0.7062302, -0.07416414, -2.442556, 0.7450981, 1, 0, 1,
-0.7039362, -0.09919278, -1.684563, 0.7411765, 1, 0, 1,
-0.7018235, 0.7857224, -2.071266, 0.7333333, 1, 0, 1,
-0.6998232, -0.6513426, -3.047717, 0.7294118, 1, 0, 1,
-0.6938507, -0.9546375, -3.090793, 0.7215686, 1, 0, 1,
-0.6907735, 1.547308, -0.3191815, 0.7176471, 1, 0, 1,
-0.6905313, -0.2521166, -0.9472994, 0.7098039, 1, 0, 1,
-0.6856812, 0.4672526, -0.3700264, 0.7058824, 1, 0, 1,
-0.6856207, 0.8487509, -0.4979581, 0.6980392, 1, 0, 1,
-0.6851479, -0.4237566, -2.640581, 0.6901961, 1, 0, 1,
-0.6846548, 0.927411, 1.532864, 0.6862745, 1, 0, 1,
-0.6842327, 0.3922779, -2.149611, 0.6784314, 1, 0, 1,
-0.6826843, -0.9707113, -3.460173, 0.6745098, 1, 0, 1,
-0.6826126, -1.065505, -2.44873, 0.6666667, 1, 0, 1,
-0.6780906, -0.5114667, -2.733946, 0.6627451, 1, 0, 1,
-0.6757822, -1.027265, -1.860459, 0.654902, 1, 0, 1,
-0.6710166, -1.458029, -2.857465, 0.6509804, 1, 0, 1,
-0.6627513, 0.7280133, -1.024939, 0.6431373, 1, 0, 1,
-0.6611618, 0.7192389, -0.3179885, 0.6392157, 1, 0, 1,
-0.6547627, 0.7940872, -2.25438, 0.6313726, 1, 0, 1,
-0.6520916, -0.350547, -2.025159, 0.627451, 1, 0, 1,
-0.6514165, 0.2862239, 0.008937571, 0.6196079, 1, 0, 1,
-0.6505488, -0.5762094, -1.703839, 0.6156863, 1, 0, 1,
-0.649484, -0.3659996, -2.791396, 0.6078432, 1, 0, 1,
-0.6474455, -1.306232, -3.472668, 0.6039216, 1, 0, 1,
-0.6473585, -0.3509941, -2.577268, 0.5960785, 1, 0, 1,
-0.6425156, -0.03674519, -0.6889895, 0.5882353, 1, 0, 1,
-0.6420913, 0.4105482, 0.6347192, 0.5843138, 1, 0, 1,
-0.6419428, -0.3037633, -2.9458, 0.5764706, 1, 0, 1,
-0.6417304, 1.873982, 0.2739998, 0.572549, 1, 0, 1,
-0.6412459, -2.791074, -3.242011, 0.5647059, 1, 0, 1,
-0.6340588, -1.131167, -2.791461, 0.5607843, 1, 0, 1,
-0.6335481, 0.9720434, -1.019772, 0.5529412, 1, 0, 1,
-0.6316921, 0.5448014, 1.251754, 0.5490196, 1, 0, 1,
-0.628755, -0.4450231, -1.882576, 0.5411765, 1, 0, 1,
-0.6228984, -1.260126, -1.986981, 0.5372549, 1, 0, 1,
-0.6213707, -0.5131201, -1.989094, 0.5294118, 1, 0, 1,
-0.6200176, 0.3063602, -1.205043, 0.5254902, 1, 0, 1,
-0.619539, -0.13153, -2.080461, 0.5176471, 1, 0, 1,
-0.6100761, 1.496488, -0.008358774, 0.5137255, 1, 0, 1,
-0.6072049, 0.2215028, 0.2203682, 0.5058824, 1, 0, 1,
-0.6052698, -2.206176, -1.176146, 0.5019608, 1, 0, 1,
-0.5985653, -1.420904, -2.785055, 0.4941176, 1, 0, 1,
-0.5968785, 0.9211991, -0.2791592, 0.4862745, 1, 0, 1,
-0.5955436, -1.045852, -1.560683, 0.4823529, 1, 0, 1,
-0.5945691, 0.1927579, -0.6158521, 0.4745098, 1, 0, 1,
-0.5925954, -0.6084892, -1.696998, 0.4705882, 1, 0, 1,
-0.5885997, 0.3080846, -0.5959501, 0.4627451, 1, 0, 1,
-0.5857685, -0.3340065, -1.040884, 0.4588235, 1, 0, 1,
-0.5842051, -0.7677805, -3.691174, 0.4509804, 1, 0, 1,
-0.5801954, 0.7215767, -2.130834, 0.4470588, 1, 0, 1,
-0.5792516, -0.5284546, -2.620348, 0.4392157, 1, 0, 1,
-0.5785782, 0.2981022, -0.9308678, 0.4352941, 1, 0, 1,
-0.5740868, 1.195524, 1.138088, 0.427451, 1, 0, 1,
-0.5643427, 0.328606, -3.811043, 0.4235294, 1, 0, 1,
-0.555573, 0.05035298, -1.911856, 0.4156863, 1, 0, 1,
-0.5548854, -1.380755, -4.479706, 0.4117647, 1, 0, 1,
-0.554259, 0.4010392, -1.39671, 0.4039216, 1, 0, 1,
-0.5538874, 0.8157202, 0.2701761, 0.3960784, 1, 0, 1,
-0.5457602, -2.367216, -3.421362, 0.3921569, 1, 0, 1,
-0.5448558, 2.596826, -2.456089, 0.3843137, 1, 0, 1,
-0.5386099, -0.8935762, -2.789109, 0.3803922, 1, 0, 1,
-0.5381447, -0.2972694, -1.870071, 0.372549, 1, 0, 1,
-0.5364354, -1.093351, -3.125574, 0.3686275, 1, 0, 1,
-0.5353858, 0.8152387, -0.2688437, 0.3607843, 1, 0, 1,
-0.5319531, 1.612066, -0.343203, 0.3568628, 1, 0, 1,
-0.5308595, 0.5634172, -0.8023603, 0.3490196, 1, 0, 1,
-0.5307348, -2.352463, -4.186773, 0.345098, 1, 0, 1,
-0.5305148, 0.04412771, -1.391454, 0.3372549, 1, 0, 1,
-0.5193887, -0.208008, -1.441236, 0.3333333, 1, 0, 1,
-0.5164291, 0.8583034, 0.792857, 0.3254902, 1, 0, 1,
-0.51631, 0.06325934, -0.588528, 0.3215686, 1, 0, 1,
-0.5109529, -0.5050225, -2.560289, 0.3137255, 1, 0, 1,
-0.5095862, 1.468089, -2.471328, 0.3098039, 1, 0, 1,
-0.5090414, -0.5103657, -1.645396, 0.3019608, 1, 0, 1,
-0.5053704, -1.59956, -2.471378, 0.2941177, 1, 0, 1,
-0.5020522, -0.3326809, -2.13961, 0.2901961, 1, 0, 1,
-0.4962108, 0.9055029, 0.6256042, 0.282353, 1, 0, 1,
-0.4928353, -1.03161, -3.367827, 0.2784314, 1, 0, 1,
-0.4887089, 0.2587599, -1.95338, 0.2705882, 1, 0, 1,
-0.4880563, 1.052952, -1.678336, 0.2666667, 1, 0, 1,
-0.4853426, 0.3603022, -0.8262717, 0.2588235, 1, 0, 1,
-0.4820862, 0.8698899, -0.08677269, 0.254902, 1, 0, 1,
-0.4812976, -2.106968, -4.125949, 0.2470588, 1, 0, 1,
-0.4809226, -1.815429, -4.294878, 0.2431373, 1, 0, 1,
-0.4775724, 0.6522407, 0.9858836, 0.2352941, 1, 0, 1,
-0.4772407, 0.9755552, -0.9321344, 0.2313726, 1, 0, 1,
-0.4755942, 0.2979253, 1.093843, 0.2235294, 1, 0, 1,
-0.473858, -0.5093592, -1.458315, 0.2196078, 1, 0, 1,
-0.4723842, 2.584988, 0.185683, 0.2117647, 1, 0, 1,
-0.4718978, 0.07050147, -2.193908, 0.2078431, 1, 0, 1,
-0.4715396, 1.902663, 0.1083354, 0.2, 1, 0, 1,
-0.4629273, -0.3821754, -3.778615, 0.1921569, 1, 0, 1,
-0.4628132, 1.002087, -2.23383, 0.1882353, 1, 0, 1,
-0.4627826, 1.187857, 1.079142, 0.1803922, 1, 0, 1,
-0.455213, -0.2345583, -1.614941, 0.1764706, 1, 0, 1,
-0.4548875, 0.7776823, -0.6282476, 0.1686275, 1, 0, 1,
-0.4525066, 0.4327751, -0.9989403, 0.1647059, 1, 0, 1,
-0.4510337, 0.3452834, -0.01683316, 0.1568628, 1, 0, 1,
-0.4501697, -0.270805, -2.107972, 0.1529412, 1, 0, 1,
-0.4487026, 1.570208, -0.3555803, 0.145098, 1, 0, 1,
-0.4458526, 0.2405821, -1.56761, 0.1411765, 1, 0, 1,
-0.4440191, -0.4693477, -2.652378, 0.1333333, 1, 0, 1,
-0.441286, 1.454807, -1.203342, 0.1294118, 1, 0, 1,
-0.4359859, -0.6934798, -2.75686, 0.1215686, 1, 0, 1,
-0.4341204, -0.111847, -0.3652524, 0.1176471, 1, 0, 1,
-0.4318246, -1.150511, -1.675753, 0.1098039, 1, 0, 1,
-0.4311891, 1.213244, -0.8887536, 0.1058824, 1, 0, 1,
-0.4289069, 1.948593, 0.3494248, 0.09803922, 1, 0, 1,
-0.4217892, 0.006890016, -3.347292, 0.09019608, 1, 0, 1,
-0.4215534, -1.030612, -2.972513, 0.08627451, 1, 0, 1,
-0.4204429, -0.7405961, -2.690062, 0.07843138, 1, 0, 1,
-0.4195461, 0.509974, 0.2879606, 0.07450981, 1, 0, 1,
-0.4182074, 0.4092171, -3.267422, 0.06666667, 1, 0, 1,
-0.4159124, 0.001230205, 0.2401518, 0.0627451, 1, 0, 1,
-0.412427, 0.4571258, -1.251584, 0.05490196, 1, 0, 1,
-0.4117098, -1.183535, -1.149332, 0.05098039, 1, 0, 1,
-0.4098743, 0.5311986, -0.8860862, 0.04313726, 1, 0, 1,
-0.409657, -1.691944, -2.91256, 0.03921569, 1, 0, 1,
-0.4065749, -0.3293256, -3.914154, 0.03137255, 1, 0, 1,
-0.4060039, -1.013069, -3.902364, 0.02745098, 1, 0, 1,
-0.4025116, 0.1259093, -1.388104, 0.01960784, 1, 0, 1,
-0.4022382, -1.838672, -1.931906, 0.01568628, 1, 0, 1,
-0.4014454, -0.1046515, -1.967459, 0.007843138, 1, 0, 1,
-0.3950222, -1.814391, -3.095512, 0.003921569, 1, 0, 1,
-0.3941052, 0.1773305, -0.3630886, 0, 1, 0.003921569, 1,
-0.3874435, 1.899805, -1.255913, 0, 1, 0.01176471, 1,
-0.3870216, 0.6000479, -0.2653599, 0, 1, 0.01568628, 1,
-0.3859546, -1.215267, -3.112075, 0, 1, 0.02352941, 1,
-0.3856353, 1.661352, -0.4499334, 0, 1, 0.02745098, 1,
-0.3847105, 0.3970324, -1.948486, 0, 1, 0.03529412, 1,
-0.3835217, 0.9779885, -0.6963077, 0, 1, 0.03921569, 1,
-0.3822303, -1.159107, -3.378844, 0, 1, 0.04705882, 1,
-0.3776692, -0.07297581, -2.417309, 0, 1, 0.05098039, 1,
-0.3701501, 0.09470271, -1.782669, 0, 1, 0.05882353, 1,
-0.3676566, -0.5772378, -4.3597, 0, 1, 0.0627451, 1,
-0.3629708, 0.05853942, -0.9437729, 0, 1, 0.07058824, 1,
-0.3618921, 0.5945847, -0.5102053, 0, 1, 0.07450981, 1,
-0.3578469, 0.8171648, 0.04053424, 0, 1, 0.08235294, 1,
-0.3569926, -0.9167528, -1.993789, 0, 1, 0.08627451, 1,
-0.3558641, 1.563699, 0.01701327, 0, 1, 0.09411765, 1,
-0.3553295, 0.3975554, -1.471768, 0, 1, 0.1019608, 1,
-0.3513259, 1.134852, -0.6141628, 0, 1, 0.1058824, 1,
-0.3446378, 0.1150257, -0.06677642, 0, 1, 0.1137255, 1,
-0.3430045, -0.892839, -2.661468, 0, 1, 0.1176471, 1,
-0.3369053, -0.5904391, -2.068031, 0, 1, 0.1254902, 1,
-0.3359513, -0.6661478, -1.970545, 0, 1, 0.1294118, 1,
-0.3323827, 0.2916563, -0.06726697, 0, 1, 0.1372549, 1,
-0.3304448, 1.379579, 3.014862, 0, 1, 0.1411765, 1,
-0.3281259, -0.5788895, -2.835577, 0, 1, 0.1490196, 1,
-0.3203218, -1.605557, -2.553311, 0, 1, 0.1529412, 1,
-0.3163701, 0.2157876, -0.5739795, 0, 1, 0.1607843, 1,
-0.3156505, -0.7316871, -1.039366, 0, 1, 0.1647059, 1,
-0.3155925, -1.627088, -2.927544, 0, 1, 0.172549, 1,
-0.3108503, 1.136448, 1.366596, 0, 1, 0.1764706, 1,
-0.3103175, 0.2243222, -2.071012, 0, 1, 0.1843137, 1,
-0.309105, 1.330125, -2.143142, 0, 1, 0.1882353, 1,
-0.3079369, -2.565706, -3.335714, 0, 1, 0.1960784, 1,
-0.3037564, -1.240752, -2.170702, 0, 1, 0.2039216, 1,
-0.3017608, -0.8388988, -3.489446, 0, 1, 0.2078431, 1,
-0.2959494, 0.8228278, -1.027786, 0, 1, 0.2156863, 1,
-0.2839755, -0.165544, -2.235372, 0, 1, 0.2196078, 1,
-0.2833074, -0.4483842, -1.904187, 0, 1, 0.227451, 1,
-0.2793715, -0.1555694, -1.875358, 0, 1, 0.2313726, 1,
-0.2770634, -1.070194, -3.935516, 0, 1, 0.2392157, 1,
-0.2765274, 0.1349266, 0.1804871, 0, 1, 0.2431373, 1,
-0.270772, 1.091387, -0.1046287, 0, 1, 0.2509804, 1,
-0.2690885, -0.8577576, -1.716542, 0, 1, 0.254902, 1,
-0.2688856, 0.2146711, -1.033124, 0, 1, 0.2627451, 1,
-0.2674002, 0.4690435, 1.533486, 0, 1, 0.2666667, 1,
-0.2658117, 1.069089, -0.0783551, 0, 1, 0.2745098, 1,
-0.265639, -0.9100732, -2.534467, 0, 1, 0.2784314, 1,
-0.2610013, 0.3153185, -0.2031283, 0, 1, 0.2862745, 1,
-0.2594424, -0.0945641, -1.954749, 0, 1, 0.2901961, 1,
-0.2582589, -1.211919, -2.798594, 0, 1, 0.2980392, 1,
-0.2552778, 0.08493757, -0.7576008, 0, 1, 0.3058824, 1,
-0.2543463, 0.3397674, -0.0789464, 0, 1, 0.3098039, 1,
-0.2532219, 1.345006, -1.014474, 0, 1, 0.3176471, 1,
-0.2521352, -0.2060087, -2.201809, 0, 1, 0.3215686, 1,
-0.2448836, 0.5695319, -0.01606944, 0, 1, 0.3294118, 1,
-0.2422394, -1.927664, -1.393867, 0, 1, 0.3333333, 1,
-0.2397884, -0.7454994, -3.632554, 0, 1, 0.3411765, 1,
-0.2378733, 1.373837, -0.06372541, 0, 1, 0.345098, 1,
-0.2358106, 0.0536229, 0.5020325, 0, 1, 0.3529412, 1,
-0.2353489, 0.6683999, -0.6617938, 0, 1, 0.3568628, 1,
-0.2330236, -1.241241, -3.52514, 0, 1, 0.3647059, 1,
-0.2254126, -1.461361, -4.258503, 0, 1, 0.3686275, 1,
-0.2212602, -1.642609, -5.332288, 0, 1, 0.3764706, 1,
-0.2095573, -0.6936689, -2.559406, 0, 1, 0.3803922, 1,
-0.2026206, 1.604716, 0.4685425, 0, 1, 0.3882353, 1,
-0.2005247, -1.559709, -5.554261, 0, 1, 0.3921569, 1,
-0.1982998, -1.078089, -3.521669, 0, 1, 0.4, 1,
-0.1937572, 0.7995628, -0.364105, 0, 1, 0.4078431, 1,
-0.1901867, -0.479293, -4.321448, 0, 1, 0.4117647, 1,
-0.1887781, 1.197201, 0.5814806, 0, 1, 0.4196078, 1,
-0.1883249, -1.882087, -3.324158, 0, 1, 0.4235294, 1,
-0.1859528, 0.9410226, 0.05445591, 0, 1, 0.4313726, 1,
-0.1843024, -0.1468654, -3.141809, 0, 1, 0.4352941, 1,
-0.1827086, 1.371062, 0.3367461, 0, 1, 0.4431373, 1,
-0.1813345, 0.03079128, -2.975902, 0, 1, 0.4470588, 1,
-0.1791644, 1.449988, 1.145552, 0, 1, 0.454902, 1,
-0.1781463, -0.05498197, -1.729887, 0, 1, 0.4588235, 1,
-0.1755677, 2.392564, -1.165656, 0, 1, 0.4666667, 1,
-0.173944, 0.1958443, -1.46081, 0, 1, 0.4705882, 1,
-0.1733257, 0.0385239, -1.335899, 0, 1, 0.4784314, 1,
-0.1710615, -0.835044, -4.311111, 0, 1, 0.4823529, 1,
-0.1668826, 0.1433728, -1.107761, 0, 1, 0.4901961, 1,
-0.1664436, 0.543021, 1.590189, 0, 1, 0.4941176, 1,
-0.1615265, 0.618373, -1.493749, 0, 1, 0.5019608, 1,
-0.1599446, 0.4175888, -3.332214, 0, 1, 0.509804, 1,
-0.1591869, 0.4112325, 0.8112724, 0, 1, 0.5137255, 1,
-0.1559504, 0.0523029, 0.1790541, 0, 1, 0.5215687, 1,
-0.1532541, 2.262545, -1.224051, 0, 1, 0.5254902, 1,
-0.1499204, 0.05196368, -0.9937996, 0, 1, 0.5333334, 1,
-0.1458434, 0.7482051, 2.420867, 0, 1, 0.5372549, 1,
-0.1448174, -0.1631457, -3.814189, 0, 1, 0.5450981, 1,
-0.1442407, -0.593644, -2.773812, 0, 1, 0.5490196, 1,
-0.1406129, -0.6561375, -3.094996, 0, 1, 0.5568628, 1,
-0.1374047, -0.6005054, -3.058792, 0, 1, 0.5607843, 1,
-0.1371255, -0.6403226, -2.416895, 0, 1, 0.5686275, 1,
-0.1365377, -0.7154025, -3.485275, 0, 1, 0.572549, 1,
-0.1355571, 0.1679487, -1.680213, 0, 1, 0.5803922, 1,
-0.133281, -0.05079446, -0.4136092, 0, 1, 0.5843138, 1,
-0.1309464, -0.1893637, -1.666367, 0, 1, 0.5921569, 1,
-0.1255616, 0.5645302, 1.129599, 0, 1, 0.5960785, 1,
-0.1249984, -0.804832, -2.698572, 0, 1, 0.6039216, 1,
-0.1197814, 0.3361601, -0.80365, 0, 1, 0.6117647, 1,
-0.1196715, -0.1586297, -2.01634, 0, 1, 0.6156863, 1,
-0.1144364, 0.5460696, -0.8126748, 0, 1, 0.6235294, 1,
-0.1108729, -1.674021, -2.197165, 0, 1, 0.627451, 1,
-0.1096594, -0.7284133, -3.365858, 0, 1, 0.6352941, 1,
-0.1079918, -0.2099561, -2.705615, 0, 1, 0.6392157, 1,
-0.1064959, -0.366095, -5.161223, 0, 1, 0.6470588, 1,
-0.09757887, 0.340146, 1.109933, 0, 1, 0.6509804, 1,
-0.09525365, -0.2342955, -1.654997, 0, 1, 0.6588235, 1,
-0.09406969, -1.128424, -2.986279, 0, 1, 0.6627451, 1,
-0.09285683, -0.7107489, -4.811767, 0, 1, 0.6705883, 1,
-0.09099714, -0.3293919, -2.0015, 0, 1, 0.6745098, 1,
-0.08990923, 0.1707365, 0.6270236, 0, 1, 0.682353, 1,
-0.08982948, -0.3851591, -5.282283, 0, 1, 0.6862745, 1,
-0.08805376, 1.565142, 0.7236306, 0, 1, 0.6941177, 1,
-0.08595336, -1.942269, -3.223564, 0, 1, 0.7019608, 1,
-0.08585978, -0.5069043, -2.536389, 0, 1, 0.7058824, 1,
-0.08501703, -0.5506857, -2.728951, 0, 1, 0.7137255, 1,
-0.08234623, -0.5236002, -3.307416, 0, 1, 0.7176471, 1,
-0.08205449, 0.6236131, -0.1576842, 0, 1, 0.7254902, 1,
-0.07267781, 0.4705654, -0.6169027, 0, 1, 0.7294118, 1,
-0.07211521, -1.585322, -4.503955, 0, 1, 0.7372549, 1,
-0.06941426, -1.413515, -4.595837, 0, 1, 0.7411765, 1,
-0.06932661, -0.2873262, -3.357986, 0, 1, 0.7490196, 1,
-0.06582947, -0.3541719, -3.667839, 0, 1, 0.7529412, 1,
-0.06497983, 1.897577, -1.888832, 0, 1, 0.7607843, 1,
-0.06228744, -1.789425, -2.969143, 0, 1, 0.7647059, 1,
-0.06169084, 0.007961811, -1.45859, 0, 1, 0.772549, 1,
-0.06124926, 0.9774001, 0.7466668, 0, 1, 0.7764706, 1,
-0.05967379, -0.006730373, -1.451915, 0, 1, 0.7843137, 1,
-0.05643431, -0.03773564, -1.187737, 0, 1, 0.7882353, 1,
-0.04957068, 1.436841, 1.377763, 0, 1, 0.7960784, 1,
-0.04817833, -2.027759, -3.420546, 0, 1, 0.8039216, 1,
-0.04447334, -0.7122533, -4.298771, 0, 1, 0.8078431, 1,
-0.0444473, -1.045547, -3.354795, 0, 1, 0.8156863, 1,
-0.04411602, -0.1099537, -1.732899, 0, 1, 0.8196079, 1,
-0.04109527, -0.4147779, -1.127873, 0, 1, 0.827451, 1,
-0.03521324, -1.023486, -2.999708, 0, 1, 0.8313726, 1,
-0.03520916, 1.220855, -0.1249837, 0, 1, 0.8392157, 1,
-0.03332922, 1.907969, -1.773499, 0, 1, 0.8431373, 1,
-0.02079171, 1.448627, 1.721137, 0, 1, 0.8509804, 1,
-0.01786724, -0.6230397, -3.806309, 0, 1, 0.854902, 1,
-0.01530325, 1.423901, 0.2216895, 0, 1, 0.8627451, 1,
-0.01238147, -1.309884, -4.280825, 0, 1, 0.8666667, 1,
-0.004227697, 0.1542112, 0.4364171, 0, 1, 0.8745098, 1,
-0.003334602, -0.4501974, -5.047488, 0, 1, 0.8784314, 1,
-0.0001263761, -0.2026752, -3.09037, 0, 1, 0.8862745, 1,
0.006797091, 1.10567, 0.3886197, 0, 1, 0.8901961, 1,
0.007252232, -1.248803, 2.064151, 0, 1, 0.8980392, 1,
0.008467887, 0.9236311, 0.4155944, 0, 1, 0.9058824, 1,
0.0099573, -0.203539, 3.879572, 0, 1, 0.9098039, 1,
0.01017017, 0.5673293, 0.7514277, 0, 1, 0.9176471, 1,
0.01101322, -0.9292735, 4.615146, 0, 1, 0.9215686, 1,
0.01436172, -0.03619465, 3.698206, 0, 1, 0.9294118, 1,
0.0176901, 0.5568892, -1.225947, 0, 1, 0.9333333, 1,
0.01883876, 1.121857, -1.500683, 0, 1, 0.9411765, 1,
0.02060566, -1.439616, 2.744074, 0, 1, 0.945098, 1,
0.02404451, 1.279869, -0.7876149, 0, 1, 0.9529412, 1,
0.0243013, 1.23377, 1.023162, 0, 1, 0.9568627, 1,
0.0253478, -0.8943545, 2.156641, 0, 1, 0.9647059, 1,
0.02566746, -0.0680929, 1.234596, 0, 1, 0.9686275, 1,
0.02790144, -1.389752, 5.208704, 0, 1, 0.9764706, 1,
0.03100088, -1.480035, 2.762765, 0, 1, 0.9803922, 1,
0.03542263, 1.831842, -0.617038, 0, 1, 0.9882353, 1,
0.03737045, -0.8141825, 3.216402, 0, 1, 0.9921569, 1,
0.04169728, 0.04765969, 3.492897, 0, 1, 1, 1,
0.04382097, -0.2493269, 2.04427, 0, 0.9921569, 1, 1,
0.04475748, -0.5075772, 4.325976, 0, 0.9882353, 1, 1,
0.0464559, 0.3498425, 1.986732, 0, 0.9803922, 1, 1,
0.04845764, -2.160566, 3.303566, 0, 0.9764706, 1, 1,
0.05307301, -1.81329, 1.381186, 0, 0.9686275, 1, 1,
0.05590332, 0.5616351, 1.289698, 0, 0.9647059, 1, 1,
0.06239519, -0.1328631, 3.508714, 0, 0.9568627, 1, 1,
0.06429531, -0.4278487, 4.64525, 0, 0.9529412, 1, 1,
0.07649188, -0.8463268, 2.701317, 0, 0.945098, 1, 1,
0.07770991, -0.9557235, 3.307108, 0, 0.9411765, 1, 1,
0.0783613, -2.255608, 2.671574, 0, 0.9333333, 1, 1,
0.0834839, -0.7820996, 1.565964, 0, 0.9294118, 1, 1,
0.08569776, 0.5892881, -1.0357, 0, 0.9215686, 1, 1,
0.0887977, 0.5847158, 2.036225, 0, 0.9176471, 1, 1,
0.09092287, -0.3145683, 1.345225, 0, 0.9098039, 1, 1,
0.0917299, -0.4489484, 1.929375, 0, 0.9058824, 1, 1,
0.09392233, 0.06682853, -0.1999858, 0, 0.8980392, 1, 1,
0.09893364, 0.5834754, 1.181254, 0, 0.8901961, 1, 1,
0.1068399, 1.064944, -0.2597123, 0, 0.8862745, 1, 1,
0.1092978, 1.616966, -0.8909026, 0, 0.8784314, 1, 1,
0.1113754, -1.156001, 2.170696, 0, 0.8745098, 1, 1,
0.1140674, -0.164391, 2.339707, 0, 0.8666667, 1, 1,
0.1177228, 0.4827876, 1.099111, 0, 0.8627451, 1, 1,
0.1204641, 1.43884, 0.5981608, 0, 0.854902, 1, 1,
0.1217527, 0.8164031, 0.9329739, 0, 0.8509804, 1, 1,
0.1287676, 0.537861, 0.511028, 0, 0.8431373, 1, 1,
0.1291604, -0.3785376, 1.60109, 0, 0.8392157, 1, 1,
0.1378278, 2.191426, -0.3676754, 0, 0.8313726, 1, 1,
0.1380879, -0.01456189, 1.719716, 0, 0.827451, 1, 1,
0.1385891, 2.233198, -0.09768643, 0, 0.8196079, 1, 1,
0.1408786, 0.3521098, 0.9368066, 0, 0.8156863, 1, 1,
0.1436344, 0.7846402, 1.16253, 0, 0.8078431, 1, 1,
0.1459014, 1.571743, 1.414499, 0, 0.8039216, 1, 1,
0.1484012, -0.7693519, 2.103905, 0, 0.7960784, 1, 1,
0.1493808, 2.709732, 2.141975, 0, 0.7882353, 1, 1,
0.1558896, 0.374969, 0.2372005, 0, 0.7843137, 1, 1,
0.1576697, -1.047341, 3.724291, 0, 0.7764706, 1, 1,
0.1591717, -0.1863921, 1.152794, 0, 0.772549, 1, 1,
0.161917, -0.2853478, 1.432872, 0, 0.7647059, 1, 1,
0.1644061, 1.067218, 1.927043, 0, 0.7607843, 1, 1,
0.1654764, -0.5756574, 3.972197, 0, 0.7529412, 1, 1,
0.1687652, -0.610746, 3.733143, 0, 0.7490196, 1, 1,
0.1689779, -0.848673, 2.759433, 0, 0.7411765, 1, 1,
0.1708891, -1.322239, 2.893958, 0, 0.7372549, 1, 1,
0.1733348, 0.5963283, -2.630175, 0, 0.7294118, 1, 1,
0.1735983, -2.659618, 3.003652, 0, 0.7254902, 1, 1,
0.1747281, 0.7891074, -0.6429169, 0, 0.7176471, 1, 1,
0.1779395, -0.9257903, 1.832182, 0, 0.7137255, 1, 1,
0.181105, -1.358334, 1.785758, 0, 0.7058824, 1, 1,
0.1812685, 0.02906158, 2.925043, 0, 0.6980392, 1, 1,
0.1841108, 0.6360946, 0.1602322, 0, 0.6941177, 1, 1,
0.1849387, 2.33289, 0.8604023, 0, 0.6862745, 1, 1,
0.1853668, 0.7583776, 2.060225, 0, 0.682353, 1, 1,
0.1859792, -1.131532, 2.003372, 0, 0.6745098, 1, 1,
0.1875854, 0.5545581, 1.360627, 0, 0.6705883, 1, 1,
0.1885081, -2.130156, 2.969031, 0, 0.6627451, 1, 1,
0.188509, -0.1947499, 3.172519, 0, 0.6588235, 1, 1,
0.1912775, -1.908454, 2.498516, 0, 0.6509804, 1, 1,
0.1922174, -0.9880445, 4.958878, 0, 0.6470588, 1, 1,
0.1964964, -1.674578, 1.352026, 0, 0.6392157, 1, 1,
0.1969786, -0.2965609, 1.301016, 0, 0.6352941, 1, 1,
0.2016066, 0.5002849, 2.621559, 0, 0.627451, 1, 1,
0.2049399, 1.035775, 0.6132606, 0, 0.6235294, 1, 1,
0.2057337, -0.8001297, 2.056056, 0, 0.6156863, 1, 1,
0.2071586, -0.4294538, 3.385953, 0, 0.6117647, 1, 1,
0.2118341, -0.6115075, 2.381298, 0, 0.6039216, 1, 1,
0.2148873, -0.5994956, 3.227204, 0, 0.5960785, 1, 1,
0.2164141, 0.2524059, 0.1399925, 0, 0.5921569, 1, 1,
0.2171045, -2.113778, 2.019255, 0, 0.5843138, 1, 1,
0.226118, -1.740138, 3.866203, 0, 0.5803922, 1, 1,
0.2295477, -0.2135265, 1.244949, 0, 0.572549, 1, 1,
0.2312546, 1.004756, 0.8810204, 0, 0.5686275, 1, 1,
0.2362054, 1.465433, 0.3866329, 0, 0.5607843, 1, 1,
0.2366046, 0.1490233, -0.06946838, 0, 0.5568628, 1, 1,
0.2432133, 1.236237, -1.631113, 0, 0.5490196, 1, 1,
0.2469774, -0.6311455, 3.696857, 0, 0.5450981, 1, 1,
0.2478077, -0.5406925, 1.557555, 0, 0.5372549, 1, 1,
0.2485194, 2.345781, 0.2040884, 0, 0.5333334, 1, 1,
0.2508066, -0.3611391, 2.207177, 0, 0.5254902, 1, 1,
0.2528471, -0.536227, 2.312351, 0, 0.5215687, 1, 1,
0.2563325, -0.994823, 3.495108, 0, 0.5137255, 1, 1,
0.2597213, -0.6737798, 0.8264597, 0, 0.509804, 1, 1,
0.2643142, -0.07125527, 2.476651, 0, 0.5019608, 1, 1,
0.268543, -0.6145808, 2.141658, 0, 0.4941176, 1, 1,
0.2692941, -1.330226, 4.239438, 0, 0.4901961, 1, 1,
0.2706036, 0.5245145, 0.9089969, 0, 0.4823529, 1, 1,
0.270838, -0.5317111, 2.286993, 0, 0.4784314, 1, 1,
0.2754449, 0.7183565, 0.0362809, 0, 0.4705882, 1, 1,
0.2789792, 0.5679601, -0.6343134, 0, 0.4666667, 1, 1,
0.2890754, -1.761392, 2.60872, 0, 0.4588235, 1, 1,
0.2906307, -0.5981309, 3.412132, 0, 0.454902, 1, 1,
0.2919529, -1.097552, 3.309504, 0, 0.4470588, 1, 1,
0.2950066, -0.1390979, 2.804871, 0, 0.4431373, 1, 1,
0.2971918, 1.199005, -0.495559, 0, 0.4352941, 1, 1,
0.302001, -0.4380067, 3.725802, 0, 0.4313726, 1, 1,
0.3026249, -1.305971, 2.727522, 0, 0.4235294, 1, 1,
0.3073913, 0.561557, 1.656031, 0, 0.4196078, 1, 1,
0.3075727, -1.859535, 2.700348, 0, 0.4117647, 1, 1,
0.3100678, -0.1417498, 2.017242, 0, 0.4078431, 1, 1,
0.3118502, 0.8629997, -1.557206, 0, 0.4, 1, 1,
0.3152381, -2.09596, 5.530044, 0, 0.3921569, 1, 1,
0.3152483, 0.6739407, 0.8754668, 0, 0.3882353, 1, 1,
0.3157642, 2.39268, 0.4866984, 0, 0.3803922, 1, 1,
0.3159728, -1.13693, 2.057346, 0, 0.3764706, 1, 1,
0.3160534, -0.1013622, 2.18789, 0, 0.3686275, 1, 1,
0.3219863, 0.1565604, 2.910788, 0, 0.3647059, 1, 1,
0.3220586, -0.7311293, 5.1085, 0, 0.3568628, 1, 1,
0.3264624, 0.402247, 0.4132461, 0, 0.3529412, 1, 1,
0.3283348, 2.01508, 0.7035912, 0, 0.345098, 1, 1,
0.3347197, 0.09870739, 0.6112412, 0, 0.3411765, 1, 1,
0.3395591, 0.005063893, 0.003004289, 0, 0.3333333, 1, 1,
0.340144, -0.1167582, 2.188699, 0, 0.3294118, 1, 1,
0.3402228, -0.4578143, 2.758921, 0, 0.3215686, 1, 1,
0.3420885, -1.122933, 2.09158, 0, 0.3176471, 1, 1,
0.3500274, -0.3496078, 1.280225, 0, 0.3098039, 1, 1,
0.3513463, 0.09404902, 0.5186796, 0, 0.3058824, 1, 1,
0.3544644, 0.480641, 0.00651682, 0, 0.2980392, 1, 1,
0.3558938, 0.291264, 1.583478, 0, 0.2901961, 1, 1,
0.361567, -0.2292127, 1.702086, 0, 0.2862745, 1, 1,
0.3620505, -0.2755339, 2.305284, 0, 0.2784314, 1, 1,
0.3645513, 1.276261, 0.9498632, 0, 0.2745098, 1, 1,
0.3655026, 1.573919, 0.01585236, 0, 0.2666667, 1, 1,
0.3669218, 0.9778169, 0.1166848, 0, 0.2627451, 1, 1,
0.3689576, 2.199359, 0.3375266, 0, 0.254902, 1, 1,
0.3725974, -0.1171237, -0.1258126, 0, 0.2509804, 1, 1,
0.3736362, -1.301517, 3.266193, 0, 0.2431373, 1, 1,
0.3773565, -0.4809586, 0.9406777, 0, 0.2392157, 1, 1,
0.3788079, 0.04723339, 1.45698, 0, 0.2313726, 1, 1,
0.3796345, -1.241978, 0.2430789, 0, 0.227451, 1, 1,
0.3818073, 0.4221637, 0.3765264, 0, 0.2196078, 1, 1,
0.3851319, 0.218276, -0.1368141, 0, 0.2156863, 1, 1,
0.388649, 0.6532609, -0.9536663, 0, 0.2078431, 1, 1,
0.3919695, 0.8044023, 2.200746, 0, 0.2039216, 1, 1,
0.3954588, -0.1198351, 0.5890648, 0, 0.1960784, 1, 1,
0.3972529, -1.202352, 2.757416, 0, 0.1882353, 1, 1,
0.4036551, 1.539425, -1.84024, 0, 0.1843137, 1, 1,
0.407202, 2.202175, -0.4823226, 0, 0.1764706, 1, 1,
0.4077425, -0.796701, 4.020829, 0, 0.172549, 1, 1,
0.4091337, -0.257892, 3.556344, 0, 0.1647059, 1, 1,
0.4099066, 0.4401881, 1.777089, 0, 0.1607843, 1, 1,
0.4131129, -0.8272693, 3.347605, 0, 0.1529412, 1, 1,
0.4142065, 0.58867, 0.04256399, 0, 0.1490196, 1, 1,
0.4163344, -0.5914822, 2.968331, 0, 0.1411765, 1, 1,
0.4206273, 1.298455, 1.580853, 0, 0.1372549, 1, 1,
0.4212835, -1.283774, 2.903787, 0, 0.1294118, 1, 1,
0.4226528, 0.1068213, 0.2523334, 0, 0.1254902, 1, 1,
0.4261816, -0.3754253, 1.323657, 0, 0.1176471, 1, 1,
0.427224, -0.8126275, 3.31846, 0, 0.1137255, 1, 1,
0.4274474, 2.056123, -1.44989, 0, 0.1058824, 1, 1,
0.4294179, -0.4161189, 2.616711, 0, 0.09803922, 1, 1,
0.4344173, 0.4101783, -1.041435, 0, 0.09411765, 1, 1,
0.4383435, 0.1261337, 0.9472667, 0, 0.08627451, 1, 1,
0.4385258, 0.8715657, -0.6436448, 0, 0.08235294, 1, 1,
0.4414564, -1.137893, 3.944483, 0, 0.07450981, 1, 1,
0.444297, 0.1459612, 2.224431, 0, 0.07058824, 1, 1,
0.4504963, -1.031413, 3.001054, 0, 0.0627451, 1, 1,
0.4523209, -1.556346, 1.652041, 0, 0.05882353, 1, 1,
0.4524478, -0.8262613, 2.740955, 0, 0.05098039, 1, 1,
0.45319, 0.4445542, 1.238466, 0, 0.04705882, 1, 1,
0.455411, -1.488342, 3.806951, 0, 0.03921569, 1, 1,
0.455958, 0.09227666, 1.444379, 0, 0.03529412, 1, 1,
0.4564627, 0.8977075, 0.01207472, 0, 0.02745098, 1, 1,
0.4569713, -1.387864, 1.165732, 0, 0.02352941, 1, 1,
0.4715187, 0.1647093, 2.057953, 0, 0.01568628, 1, 1,
0.4728025, -0.1408938, 0.9742075, 0, 0.01176471, 1, 1,
0.4755309, -0.4504144, 3.159685, 0, 0.003921569, 1, 1,
0.4782017, -0.6180843, 3.139092, 0.003921569, 0, 1, 1,
0.4857969, -0.02908196, 0.6344491, 0.007843138, 0, 1, 1,
0.4875112, -0.8574818, 2.330254, 0.01568628, 0, 1, 1,
0.4883194, -1.783805, 3.772775, 0.01960784, 0, 1, 1,
0.4903847, -0.1766152, 1.48441, 0.02745098, 0, 1, 1,
0.4923395, -0.4312201, 2.718798, 0.03137255, 0, 1, 1,
0.5015891, 0.4593081, 2.741624, 0.03921569, 0, 1, 1,
0.5031673, -0.03529274, 2.573826, 0.04313726, 0, 1, 1,
0.5038062, -0.8458394, 3.308154, 0.05098039, 0, 1, 1,
0.5052609, 0.5043277, 0.7215638, 0.05490196, 0, 1, 1,
0.512449, 1.266376, 0.2101932, 0.0627451, 0, 1, 1,
0.5124879, -1.311126, 3.6517, 0.06666667, 0, 1, 1,
0.5134991, -0.2296952, 1.888865, 0.07450981, 0, 1, 1,
0.5174519, 0.5886724, 1.505341, 0.07843138, 0, 1, 1,
0.5189674, -0.9304479, 0.4541958, 0.08627451, 0, 1, 1,
0.5194427, -1.60654, 2.803762, 0.09019608, 0, 1, 1,
0.5230681, -1.036947, 2.82654, 0.09803922, 0, 1, 1,
0.5231459, -0.4947563, 1.533641, 0.1058824, 0, 1, 1,
0.5252563, 1.240112, -0.5940965, 0.1098039, 0, 1, 1,
0.5267653, -0.7107975, 1.912363, 0.1176471, 0, 1, 1,
0.5293797, 0.03458077, 2.06805, 0.1215686, 0, 1, 1,
0.5385484, 0.6841068, 0.5347124, 0.1294118, 0, 1, 1,
0.539353, 0.6488055, -0.1140965, 0.1333333, 0, 1, 1,
0.5398111, -1.685989, 2.76951, 0.1411765, 0, 1, 1,
0.5399019, 0.9933438, 0.001300481, 0.145098, 0, 1, 1,
0.5448878, -1.074217, 1.952594, 0.1529412, 0, 1, 1,
0.5519446, -0.6256756, 1.169584, 0.1568628, 0, 1, 1,
0.5522044, -2.346108, 4.224491, 0.1647059, 0, 1, 1,
0.552393, -0.137719, 2.78898, 0.1686275, 0, 1, 1,
0.5565395, -1.439868, 4.342562, 0.1764706, 0, 1, 1,
0.5584116, 1.477951, 0.388134, 0.1803922, 0, 1, 1,
0.5652274, -0.7063395, 3.412763, 0.1882353, 0, 1, 1,
0.5655968, 1.857343, -0.2741782, 0.1921569, 0, 1, 1,
0.5702356, -1.184851, 2.017757, 0.2, 0, 1, 1,
0.5716125, -0.2630186, 2.175971, 0.2078431, 0, 1, 1,
0.5757365, -1.290416, 0.7248724, 0.2117647, 0, 1, 1,
0.5784213, 0.5312945, 0.5281246, 0.2196078, 0, 1, 1,
0.5810564, 0.6435171, 0.1420421, 0.2235294, 0, 1, 1,
0.5827599, 0.5262973, 1.430786, 0.2313726, 0, 1, 1,
0.5837938, 1.333544, 0.2742952, 0.2352941, 0, 1, 1,
0.5858862, 0.3586501, 2.338283, 0.2431373, 0, 1, 1,
0.59151, 0.9620366, 2.664968, 0.2470588, 0, 1, 1,
0.5936949, 1.203081, -0.6502935, 0.254902, 0, 1, 1,
0.5949814, 1.324257, 2.04973, 0.2588235, 0, 1, 1,
0.5951557, 1.026542, 0.9572989, 0.2666667, 0, 1, 1,
0.5975437, -0.2091009, 2.337497, 0.2705882, 0, 1, 1,
0.5987876, 0.6931772, -0.3152719, 0.2784314, 0, 1, 1,
0.5990462, 0.3294055, 2.474797, 0.282353, 0, 1, 1,
0.6015387, -0.8140897, 3.675975, 0.2901961, 0, 1, 1,
0.6034672, -0.7118503, 4.396989, 0.2941177, 0, 1, 1,
0.6043134, 0.4564459, 0.5448706, 0.3019608, 0, 1, 1,
0.6048011, 1.032964, 0.3478026, 0.3098039, 0, 1, 1,
0.6065789, -1.624952, 2.928072, 0.3137255, 0, 1, 1,
0.6071083, -0.7071467, 1.989374, 0.3215686, 0, 1, 1,
0.6076521, -2.080601, 3.652156, 0.3254902, 0, 1, 1,
0.6082619, 1.163571, 0.06337367, 0.3333333, 0, 1, 1,
0.6094187, -1.35574, 2.857682, 0.3372549, 0, 1, 1,
0.6109921, -0.4710461, 2.892662, 0.345098, 0, 1, 1,
0.6131382, 1.601155, 0.6713483, 0.3490196, 0, 1, 1,
0.6141425, -0.2280754, 3.142733, 0.3568628, 0, 1, 1,
0.6164319, 1.422054, 0.5239685, 0.3607843, 0, 1, 1,
0.6178871, 0.2844034, 2.130504, 0.3686275, 0, 1, 1,
0.6193408, -0.5337236, 1.31891, 0.372549, 0, 1, 1,
0.6247888, -0.3335766, 1.628003, 0.3803922, 0, 1, 1,
0.6275554, -0.925764, 3.997035, 0.3843137, 0, 1, 1,
0.6354985, -0.22802, 1.622892, 0.3921569, 0, 1, 1,
0.6370175, 0.861761, -1.307754, 0.3960784, 0, 1, 1,
0.6418365, 1.766001, 0.4272996, 0.4039216, 0, 1, 1,
0.6484333, 1.812948, 0.1840877, 0.4117647, 0, 1, 1,
0.651624, -2.283077, 2.647103, 0.4156863, 0, 1, 1,
0.6531715, -1.548727, -0.25043, 0.4235294, 0, 1, 1,
0.6536813, 0.5004058, 1.028505, 0.427451, 0, 1, 1,
0.6583082, 1.508634, -1.516191, 0.4352941, 0, 1, 1,
0.6587364, -0.7925662, 2.774807, 0.4392157, 0, 1, 1,
0.6593145, -0.9248848, 0.8906939, 0.4470588, 0, 1, 1,
0.6593425, 0.7571159, 2.214704, 0.4509804, 0, 1, 1,
0.659916, 0.8717064, 0.165274, 0.4588235, 0, 1, 1,
0.6608667, 0.1598615, 1.847227, 0.4627451, 0, 1, 1,
0.6617368, 2.836756, 0.1799428, 0.4705882, 0, 1, 1,
0.6628405, -0.3254112, 0.2351927, 0.4745098, 0, 1, 1,
0.6660709, 0.6222817, 1.481619, 0.4823529, 0, 1, 1,
0.6675872, 1.038359, 0.3972248, 0.4862745, 0, 1, 1,
0.6753991, 0.1043131, -0.4897563, 0.4941176, 0, 1, 1,
0.6759207, -1.153165, 3.040493, 0.5019608, 0, 1, 1,
0.6772717, 0.7885414, 1.084498, 0.5058824, 0, 1, 1,
0.6796092, -0.8567267, 3.471406, 0.5137255, 0, 1, 1,
0.6798958, 0.5020393, -0.2876736, 0.5176471, 0, 1, 1,
0.6805955, -1.386635, 2.362746, 0.5254902, 0, 1, 1,
0.6819458, -0.3661918, 3.420817, 0.5294118, 0, 1, 1,
0.6895736, -1.241139, 3.169026, 0.5372549, 0, 1, 1,
0.6970195, 0.9551706, 1.079084, 0.5411765, 0, 1, 1,
0.6975619, -0.5222786, 1.151788, 0.5490196, 0, 1, 1,
0.70236, 0.6184896, 0.9394405, 0.5529412, 0, 1, 1,
0.7069522, 0.3273027, 0.6241452, 0.5607843, 0, 1, 1,
0.7130809, 0.3982484, 2.037335, 0.5647059, 0, 1, 1,
0.7161198, 1.121587, 0.1986202, 0.572549, 0, 1, 1,
0.7257202, 2.468164, 0.369744, 0.5764706, 0, 1, 1,
0.7288958, 0.2416566, 2.482989, 0.5843138, 0, 1, 1,
0.7338352, -0.1551105, 0.0999276, 0.5882353, 0, 1, 1,
0.735206, -1.338374, 2.361908, 0.5960785, 0, 1, 1,
0.7358127, 0.6355587, 0.2510025, 0.6039216, 0, 1, 1,
0.7361383, -0.5794475, 1.278644, 0.6078432, 0, 1, 1,
0.7539468, -0.04034631, 0.7468957, 0.6156863, 0, 1, 1,
0.7555487, -1.193297, 3.327372, 0.6196079, 0, 1, 1,
0.7658966, 0.5882891, 0.1398637, 0.627451, 0, 1, 1,
0.7692929, -0.6035228, 1.852355, 0.6313726, 0, 1, 1,
0.7747824, 2.751411, 0.1571541, 0.6392157, 0, 1, 1,
0.7774335, -0.8640147, 2.421541, 0.6431373, 0, 1, 1,
0.7779028, 0.7972546, 0.6173108, 0.6509804, 0, 1, 1,
0.7853043, 0.1115502, 1.377772, 0.654902, 0, 1, 1,
0.7887023, 0.7764021, -1.03431, 0.6627451, 0, 1, 1,
0.8079839, 0.7125234, 2.778064, 0.6666667, 0, 1, 1,
0.8203991, -0.6635247, 2.601083, 0.6745098, 0, 1, 1,
0.8239012, 0.2504752, -0.01069222, 0.6784314, 0, 1, 1,
0.8312733, 1.500001, 1.440664, 0.6862745, 0, 1, 1,
0.8336392, -0.3538946, 1.171063, 0.6901961, 0, 1, 1,
0.8349012, -0.9521866, 1.946229, 0.6980392, 0, 1, 1,
0.8363799, -0.4584251, 1.140714, 0.7058824, 0, 1, 1,
0.8370162, -0.4290017, 3.240898, 0.7098039, 0, 1, 1,
0.837167, -0.1380548, 1.751542, 0.7176471, 0, 1, 1,
0.8421139, 1.425249, -0.2687152, 0.7215686, 0, 1, 1,
0.8422577, 0.2468466, 2.567504, 0.7294118, 0, 1, 1,
0.8443543, -0.07636351, 2.21369, 0.7333333, 0, 1, 1,
0.8461749, -2.812112, 2.887098, 0.7411765, 0, 1, 1,
0.8475444, 0.503861, 1.991445, 0.7450981, 0, 1, 1,
0.8491535, -1.429294, 4.590891, 0.7529412, 0, 1, 1,
0.8501243, 1.295771, -0.645815, 0.7568628, 0, 1, 1,
0.8567588, -0.001639592, 1.819257, 0.7647059, 0, 1, 1,
0.857999, 1.768805, -0.731269, 0.7686275, 0, 1, 1,
0.8616702, 0.06085355, 0.1897074, 0.7764706, 0, 1, 1,
0.8667381, 0.5083994, 0.4309053, 0.7803922, 0, 1, 1,
0.8678184, -1.357447, 2.849032, 0.7882353, 0, 1, 1,
0.8679608, -0.3400685, 2.319616, 0.7921569, 0, 1, 1,
0.8741415, 0.01408454, 0.7439225, 0.8, 0, 1, 1,
0.876647, -1.163895, 1.747639, 0.8078431, 0, 1, 1,
0.8773597, -0.7089105, 3.211945, 0.8117647, 0, 1, 1,
0.8790536, -0.2931268, 0.5455105, 0.8196079, 0, 1, 1,
0.8866437, -0.988159, 2.689404, 0.8235294, 0, 1, 1,
0.8884333, -0.2616494, 1.498389, 0.8313726, 0, 1, 1,
0.8887628, 0.007285557, 2.50735, 0.8352941, 0, 1, 1,
0.8893989, 1.231337, 2.21741, 0.8431373, 0, 1, 1,
0.9021029, -1.03039, 2.921033, 0.8470588, 0, 1, 1,
0.9025413, -0.08282463, 0.7828551, 0.854902, 0, 1, 1,
0.9051982, -0.1735713, 2.174957, 0.8588235, 0, 1, 1,
0.9063029, 0.1382794, 1.598631, 0.8666667, 0, 1, 1,
0.9076025, -0.2610069, 2.760781, 0.8705882, 0, 1, 1,
0.930423, 0.1322247, 2.653272, 0.8784314, 0, 1, 1,
0.9333388, -0.1160566, 2.804056, 0.8823529, 0, 1, 1,
0.9453449, 0.2996706, 3.034174, 0.8901961, 0, 1, 1,
0.9499243, 1.440036, -0.8769841, 0.8941177, 0, 1, 1,
0.9579354, -0.231934, 0.4201158, 0.9019608, 0, 1, 1,
0.9597059, 0.8600925, 0.01508029, 0.9098039, 0, 1, 1,
0.9600973, 0.05477177, 1.38779, 0.9137255, 0, 1, 1,
0.9660658, 0.9103667, -0.03701802, 0.9215686, 0, 1, 1,
0.9669458, 0.4085831, 2.214332, 0.9254902, 0, 1, 1,
0.9695704, 0.5088955, 0.05594921, 0.9333333, 0, 1, 1,
0.9696478, -0.9350999, 2.395572, 0.9372549, 0, 1, 1,
0.971518, -0.04514659, 1.14433, 0.945098, 0, 1, 1,
0.9721913, -0.7055951, 0.7355263, 0.9490196, 0, 1, 1,
0.9727419, 0.09466106, 0.6791791, 0.9568627, 0, 1, 1,
0.9838074, -1.433883, 1.132237, 0.9607843, 0, 1, 1,
0.9908379, -1.19922, 3.999086, 0.9686275, 0, 1, 1,
0.9937332, 0.06092365, 0.5667859, 0.972549, 0, 1, 1,
0.9966012, -1.548545, 3.862308, 0.9803922, 0, 1, 1,
1.002705, 0.8727751, 1.103268, 0.9843137, 0, 1, 1,
1.002873, 0.4908787, 1.592587, 0.9921569, 0, 1, 1,
1.004987, 1.629116, 0.3326654, 0.9960784, 0, 1, 1,
1.005588, -0.9229055, 2.422743, 1, 0, 0.9960784, 1,
1.016409, -2.427888, 3.329186, 1, 0, 0.9882353, 1,
1.016578, 0.4515266, 0.1184381, 1, 0, 0.9843137, 1,
1.016739, -0.2018301, 2.552821, 1, 0, 0.9764706, 1,
1.01682, -0.1707642, 2.757991, 1, 0, 0.972549, 1,
1.017003, -0.9282136, 0.6955835, 1, 0, 0.9647059, 1,
1.017533, -0.7730046, 1.69319, 1, 0, 0.9607843, 1,
1.019026, -0.3100581, 3.103292, 1, 0, 0.9529412, 1,
1.020596, -0.8241978, 2.32275, 1, 0, 0.9490196, 1,
1.02453, -0.6251368, 3.145416, 1, 0, 0.9411765, 1,
1.027974, 0.372305, 0.8450547, 1, 0, 0.9372549, 1,
1.029228, 0.2014768, 1.313873, 1, 0, 0.9294118, 1,
1.029244, -0.04852924, 3.337137, 1, 0, 0.9254902, 1,
1.039386, 1.501325, 0.6633907, 1, 0, 0.9176471, 1,
1.039546, 0.2416663, 1.054942, 1, 0, 0.9137255, 1,
1.043099, -0.6132045, 2.064815, 1, 0, 0.9058824, 1,
1.045357, -1.321288, 1.713779, 1, 0, 0.9019608, 1,
1.053009, 0.2244301, 1.179749, 1, 0, 0.8941177, 1,
1.056961, -0.6074513, 1.399199, 1, 0, 0.8862745, 1,
1.057621, 0.1235806, 1.557437, 1, 0, 0.8823529, 1,
1.058513, 0.07316619, 0.4811921, 1, 0, 0.8745098, 1,
1.05872, -0.07439392, 2.579943, 1, 0, 0.8705882, 1,
1.064925, 0.3835058, 1.202292, 1, 0, 0.8627451, 1,
1.065795, -0.02491839, 1.781011, 1, 0, 0.8588235, 1,
1.066216, -1.013559, 1.285999, 1, 0, 0.8509804, 1,
1.081731, 1.110471, 2.090257, 1, 0, 0.8470588, 1,
1.081825, 0.2256865, 1.564375, 1, 0, 0.8392157, 1,
1.085714, -1.367302, 2.405595, 1, 0, 0.8352941, 1,
1.08954, 1.642088, 0.8845899, 1, 0, 0.827451, 1,
1.089908, -0.3211651, 2.678944, 1, 0, 0.8235294, 1,
1.09667, 0.01116395, 2.165798, 1, 0, 0.8156863, 1,
1.099341, -0.8685557, 1.402142, 1, 0, 0.8117647, 1,
1.105568, -0.07193842, 0.2360828, 1, 0, 0.8039216, 1,
1.106618, 1.335882, 0.008618633, 1, 0, 0.7960784, 1,
1.107208, -0.1970832, 3.149952, 1, 0, 0.7921569, 1,
1.11246, 1.381002, 0.09162495, 1, 0, 0.7843137, 1,
1.114791, -0.42104, 0.7071515, 1, 0, 0.7803922, 1,
1.117576, -0.4028749, -0.1283108, 1, 0, 0.772549, 1,
1.118399, -0.04394934, 0.5856572, 1, 0, 0.7686275, 1,
1.119207, -0.2476269, 2.032394, 1, 0, 0.7607843, 1,
1.125475, -0.4251834, 2.125688, 1, 0, 0.7568628, 1,
1.126317, -0.1284708, 1.640393, 1, 0, 0.7490196, 1,
1.129858, 0.005193356, 2.712555, 1, 0, 0.7450981, 1,
1.131681, -0.4277992, 3.818681, 1, 0, 0.7372549, 1,
1.146743, 0.1546081, -0.8577722, 1, 0, 0.7333333, 1,
1.149201, 1.264898, 0.2014785, 1, 0, 0.7254902, 1,
1.167583, -0.6073177, 1.958821, 1, 0, 0.7215686, 1,
1.172444, -0.2718946, 3.163722, 1, 0, 0.7137255, 1,
1.176285, -2.113412, 2.376309, 1, 0, 0.7098039, 1,
1.183153, 0.4982486, 0.9169985, 1, 0, 0.7019608, 1,
1.185945, -0.2982278, 0.6581163, 1, 0, 0.6941177, 1,
1.190159, 0.2105057, 1.966, 1, 0, 0.6901961, 1,
1.198995, -0.3426049, 1.138725, 1, 0, 0.682353, 1,
1.199939, 2.553574, -1.583901, 1, 0, 0.6784314, 1,
1.201016, -1.422072, 1.822623, 1, 0, 0.6705883, 1,
1.203313, -1.309725, 2.200937, 1, 0, 0.6666667, 1,
1.205561, -1.438017, 2.110913, 1, 0, 0.6588235, 1,
1.208287, -0.479227, 3.386346, 1, 0, 0.654902, 1,
1.235778, -0.3442646, 1.65215, 1, 0, 0.6470588, 1,
1.250712, -1.115891, 3.238749, 1, 0, 0.6431373, 1,
1.256754, -1.173693, 3.970998, 1, 0, 0.6352941, 1,
1.257725, 0.7493768, 2.145947, 1, 0, 0.6313726, 1,
1.261232, 1.03992, -0.2802271, 1, 0, 0.6235294, 1,
1.261409, 0.5778477, -0.09810027, 1, 0, 0.6196079, 1,
1.262564, 0.03923826, 1.299341, 1, 0, 0.6117647, 1,
1.264085, -0.2197597, 1.647904, 1, 0, 0.6078432, 1,
1.265068, 0.2514864, 2.589568, 1, 0, 0.6, 1,
1.277437, 1.163223, 1.51976, 1, 0, 0.5921569, 1,
1.280121, -0.5964277, 3.125906, 1, 0, 0.5882353, 1,
1.283286, -0.7186761, 2.965698, 1, 0, 0.5803922, 1,
1.299747, 0.4183856, 2.07255, 1, 0, 0.5764706, 1,
1.302111, -0.9300999, 2.657311, 1, 0, 0.5686275, 1,
1.308069, -1.978269, 4.309143, 1, 0, 0.5647059, 1,
1.310182, 1.79927, -0.463685, 1, 0, 0.5568628, 1,
1.314502, -1.036438, 1.360459, 1, 0, 0.5529412, 1,
1.32209, -0.2025502, 3.169348, 1, 0, 0.5450981, 1,
1.327577, -0.09639011, 3.336037, 1, 0, 0.5411765, 1,
1.335272, -0.4661727, 1.457095, 1, 0, 0.5333334, 1,
1.335346, -1.215758, 2.991947, 1, 0, 0.5294118, 1,
1.341844, -1.34796, 1.312923, 1, 0, 0.5215687, 1,
1.343528, 1.63765, 1.52166, 1, 0, 0.5176471, 1,
1.346535, 0.04828957, 1.178443, 1, 0, 0.509804, 1,
1.352454, -1.100247, 0.3202225, 1, 0, 0.5058824, 1,
1.353119, -0.5350073, 1.705442, 1, 0, 0.4980392, 1,
1.375403, 0.6895483, -0.8844756, 1, 0, 0.4901961, 1,
1.380514, -0.7209142, 4.124119, 1, 0, 0.4862745, 1,
1.382539, -1.524342, 2.084447, 1, 0, 0.4784314, 1,
1.386733, -1.366735, 2.259892, 1, 0, 0.4745098, 1,
1.389819, 0.6397191, 2.653605, 1, 0, 0.4666667, 1,
1.39074, -0.03591115, 3.911151, 1, 0, 0.4627451, 1,
1.391919, 0.1968991, -0.03666833, 1, 0, 0.454902, 1,
1.392506, 0.1264787, 0.9457904, 1, 0, 0.4509804, 1,
1.394899, 1.215865, 0.9626909, 1, 0, 0.4431373, 1,
1.404045, -0.9671987, 2.511321, 1, 0, 0.4392157, 1,
1.419165, -0.5093614, 1.76158, 1, 0, 0.4313726, 1,
1.423273, 0.1206522, 1.204919, 1, 0, 0.427451, 1,
1.431365, 0.6334615, 0.6123546, 1, 0, 0.4196078, 1,
1.442281, 1.089244, 1.99156, 1, 0, 0.4156863, 1,
1.482276, -2.438712, 3.403981, 1, 0, 0.4078431, 1,
1.482808, 0.394996, 0.9326413, 1, 0, 0.4039216, 1,
1.486413, 1.107409, 1.05396, 1, 0, 0.3960784, 1,
1.505734, 1.194835, -0.1012793, 1, 0, 0.3882353, 1,
1.513329, -2.264813, 1.192603, 1, 0, 0.3843137, 1,
1.526476, 1.31259, 0.7855667, 1, 0, 0.3764706, 1,
1.549966, 2.627656, 0.6201698, 1, 0, 0.372549, 1,
1.551716, 0.0564246, 1.319597, 1, 0, 0.3647059, 1,
1.569726, 0.5247152, -0.1186245, 1, 0, 0.3607843, 1,
1.575164, 1.284589, 0.933236, 1, 0, 0.3529412, 1,
1.577952, 1.378333, 0.7248998, 1, 0, 0.3490196, 1,
1.586158, -0.4563957, 2.911595, 1, 0, 0.3411765, 1,
1.59115, 0.8947422, 3.245268, 1, 0, 0.3372549, 1,
1.597805, 0.1959032, 1.468191, 1, 0, 0.3294118, 1,
1.611233, -1.53544, 2.386535, 1, 0, 0.3254902, 1,
1.644441, -0.0330446, 0.6843155, 1, 0, 0.3176471, 1,
1.644551, 1.289601, -0.4247907, 1, 0, 0.3137255, 1,
1.65442, -1.406873, 2.351599, 1, 0, 0.3058824, 1,
1.689503, -0.485786, 1.920028, 1, 0, 0.2980392, 1,
1.695871, 0.7691243, 0.4876076, 1, 0, 0.2941177, 1,
1.700212, -0.109346, 3.238867, 1, 0, 0.2862745, 1,
1.711839, 0.8590578, 2.844858, 1, 0, 0.282353, 1,
1.713806, -0.1142565, 1.950257, 1, 0, 0.2745098, 1,
1.715269, 0.8582234, 1.385694, 1, 0, 0.2705882, 1,
1.723427, -0.02134522, -0.4525208, 1, 0, 0.2627451, 1,
1.737812, 0.9259007, 1.501003, 1, 0, 0.2588235, 1,
1.738508, -1.117374, 2.458616, 1, 0, 0.2509804, 1,
1.774912, -1.413623, 1.040848, 1, 0, 0.2470588, 1,
1.778346, -0.9025651, 3.304655, 1, 0, 0.2392157, 1,
1.791705, -0.849216, 0.6197616, 1, 0, 0.2352941, 1,
1.807259, 1.412323, -0.2537368, 1, 0, 0.227451, 1,
1.807813, -0.2616312, 1.63381, 1, 0, 0.2235294, 1,
1.813227, -1.303021, 2.045246, 1, 0, 0.2156863, 1,
1.821311, 0.7864497, 0.7820231, 1, 0, 0.2117647, 1,
1.828228, 0.5923156, 0.8667861, 1, 0, 0.2039216, 1,
1.83597, 0.5143784, 0.7613605, 1, 0, 0.1960784, 1,
1.845093, 1.182876, 2.535413, 1, 0, 0.1921569, 1,
1.849902, 0.2462638, 1.984629, 1, 0, 0.1843137, 1,
1.852528, -0.4795648, 3.085351, 1, 0, 0.1803922, 1,
1.857303, 0.25113, 2.589547, 1, 0, 0.172549, 1,
1.861184, 1.072704, 1.676431, 1, 0, 0.1686275, 1,
1.870466, -2.301625, 3.155251, 1, 0, 0.1607843, 1,
1.8727, 1.499835, 0.7349418, 1, 0, 0.1568628, 1,
1.91149, 0.07262092, 1.794921, 1, 0, 0.1490196, 1,
1.92593, -0.4758328, 2.99434, 1, 0, 0.145098, 1,
1.968924, -1.265519, 3.887549, 1, 0, 0.1372549, 1,
1.974232, 0.354322, 1.732803, 1, 0, 0.1333333, 1,
2.000761, 0.9309457, 1.003317, 1, 0, 0.1254902, 1,
2.012612, -0.1824243, 2.384993, 1, 0, 0.1215686, 1,
2.036498, 0.689264, 2.168059, 1, 0, 0.1137255, 1,
2.147943, -0.4767826, 0.9968306, 1, 0, 0.1098039, 1,
2.148459, -0.5195019, 2.878671, 1, 0, 0.1019608, 1,
2.199774, 0.4983499, 1.237128, 1, 0, 0.09411765, 1,
2.202358, 0.7426957, 1.922316, 1, 0, 0.09019608, 1,
2.222463, -0.6543567, -0.4844815, 1, 0, 0.08235294, 1,
2.280426, -0.02148513, 2.202134, 1, 0, 0.07843138, 1,
2.287431, -0.7552699, 1.143484, 1, 0, 0.07058824, 1,
2.289737, 0.5095748, 1.723383, 1, 0, 0.06666667, 1,
2.299274, -0.1181515, 1.646558, 1, 0, 0.05882353, 1,
2.355884, -1.052393, 2.862912, 1, 0, 0.05490196, 1,
2.37045, 0.767825, 2.887448, 1, 0, 0.04705882, 1,
2.436122, 1.234539, 0.2883438, 1, 0, 0.04313726, 1,
2.558422, -0.05220194, 2.153071, 1, 0, 0.03529412, 1,
2.632382, -0.6797389, 0.521896, 1, 0, 0.03137255, 1,
2.721146, 0.690066, 1.651322, 1, 0, 0.02352941, 1,
2.880807, -0.1366203, 1.284068, 1, 0, 0.01960784, 1,
3.007615, 1.674648, 1.031415, 1, 0, 0.01176471, 1,
3.298123, -1.075857, 3.639378, 1, 0, 0.007843138, 1
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
-0.3512477, -3.919498, -7.43305, 0, -0.5, 0.5, 0.5,
-0.3512477, -3.919498, -7.43305, 1, -0.5, 0.5, 0.5,
-0.3512477, -3.919498, -7.43305, 1, 1.5, 0.5, 0.5,
-0.3512477, -3.919498, -7.43305, 0, 1.5, 0.5, 0.5
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
-5.237755, -0.05176675, -7.43305, 0, -0.5, 0.5, 0.5,
-5.237755, -0.05176675, -7.43305, 1, -0.5, 0.5, 0.5,
-5.237755, -0.05176675, -7.43305, 1, 1.5, 0.5, 0.5,
-5.237755, -0.05176675, -7.43305, 0, 1.5, 0.5, 0.5
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
-5.237755, -3.919498, -0.01210856, 0, -0.5, 0.5, 0.5,
-5.237755, -3.919498, -0.01210856, 1, -0.5, 0.5, 0.5,
-5.237755, -3.919498, -0.01210856, 1, 1.5, 0.5, 0.5,
-5.237755, -3.919498, -0.01210856, 0, 1.5, 0.5, 0.5
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
-4, -3.026945, -5.720525,
2, -3.026945, -5.720525,
-4, -3.026945, -5.720525,
-4, -3.175704, -6.005946,
-2, -3.026945, -5.720525,
-2, -3.175704, -6.005946,
0, -3.026945, -5.720525,
0, -3.175704, -6.005946,
2, -3.026945, -5.720525,
2, -3.175704, -6.005946
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
-4, -3.473221, -6.576788, 0, -0.5, 0.5, 0.5,
-4, -3.473221, -6.576788, 1, -0.5, 0.5, 0.5,
-4, -3.473221, -6.576788, 1, 1.5, 0.5, 0.5,
-4, -3.473221, -6.576788, 0, 1.5, 0.5, 0.5,
-2, -3.473221, -6.576788, 0, -0.5, 0.5, 0.5,
-2, -3.473221, -6.576788, 1, -0.5, 0.5, 0.5,
-2, -3.473221, -6.576788, 1, 1.5, 0.5, 0.5,
-2, -3.473221, -6.576788, 0, 1.5, 0.5, 0.5,
0, -3.473221, -6.576788, 0, -0.5, 0.5, 0.5,
0, -3.473221, -6.576788, 1, -0.5, 0.5, 0.5,
0, -3.473221, -6.576788, 1, 1.5, 0.5, 0.5,
0, -3.473221, -6.576788, 0, 1.5, 0.5, 0.5,
2, -3.473221, -6.576788, 0, -0.5, 0.5, 0.5,
2, -3.473221, -6.576788, 1, -0.5, 0.5, 0.5,
2, -3.473221, -6.576788, 1, 1.5, 0.5, 0.5,
2, -3.473221, -6.576788, 0, 1.5, 0.5, 0.5
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
-4.1101, -2, -5.720525,
-4.1101, 2, -5.720525,
-4.1101, -2, -5.720525,
-4.298042, -2, -6.005946,
-4.1101, -1, -5.720525,
-4.298042, -1, -6.005946,
-4.1101, 0, -5.720525,
-4.298042, 0, -6.005946,
-4.1101, 1, -5.720525,
-4.298042, 1, -6.005946,
-4.1101, 2, -5.720525,
-4.298042, 2, -6.005946
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
-4.673927, -2, -6.576788, 0, -0.5, 0.5, 0.5,
-4.673927, -2, -6.576788, 1, -0.5, 0.5, 0.5,
-4.673927, -2, -6.576788, 1, 1.5, 0.5, 0.5,
-4.673927, -2, -6.576788, 0, 1.5, 0.5, 0.5,
-4.673927, -1, -6.576788, 0, -0.5, 0.5, 0.5,
-4.673927, -1, -6.576788, 1, -0.5, 0.5, 0.5,
-4.673927, -1, -6.576788, 1, 1.5, 0.5, 0.5,
-4.673927, -1, -6.576788, 0, 1.5, 0.5, 0.5,
-4.673927, 0, -6.576788, 0, -0.5, 0.5, 0.5,
-4.673927, 0, -6.576788, 1, -0.5, 0.5, 0.5,
-4.673927, 0, -6.576788, 1, 1.5, 0.5, 0.5,
-4.673927, 0, -6.576788, 0, 1.5, 0.5, 0.5,
-4.673927, 1, -6.576788, 0, -0.5, 0.5, 0.5,
-4.673927, 1, -6.576788, 1, -0.5, 0.5, 0.5,
-4.673927, 1, -6.576788, 1, 1.5, 0.5, 0.5,
-4.673927, 1, -6.576788, 0, 1.5, 0.5, 0.5,
-4.673927, 2, -6.576788, 0, -0.5, 0.5, 0.5,
-4.673927, 2, -6.576788, 1, -0.5, 0.5, 0.5,
-4.673927, 2, -6.576788, 1, 1.5, 0.5, 0.5,
-4.673927, 2, -6.576788, 0, 1.5, 0.5, 0.5
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
-4.1101, -3.026945, -4,
-4.1101, -3.026945, 4,
-4.1101, -3.026945, -4,
-4.298042, -3.175704, -4,
-4.1101, -3.026945, -2,
-4.298042, -3.175704, -2,
-4.1101, -3.026945, 0,
-4.298042, -3.175704, 0,
-4.1101, -3.026945, 2,
-4.298042, -3.175704, 2,
-4.1101, -3.026945, 4,
-4.298042, -3.175704, 4
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
-4.673927, -3.473221, -4, 0, -0.5, 0.5, 0.5,
-4.673927, -3.473221, -4, 1, -0.5, 0.5, 0.5,
-4.673927, -3.473221, -4, 1, 1.5, 0.5, 0.5,
-4.673927, -3.473221, -4, 0, 1.5, 0.5, 0.5,
-4.673927, -3.473221, -2, 0, -0.5, 0.5, 0.5,
-4.673927, -3.473221, -2, 1, -0.5, 0.5, 0.5,
-4.673927, -3.473221, -2, 1, 1.5, 0.5, 0.5,
-4.673927, -3.473221, -2, 0, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 0, 0, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 0, 1, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 0, 1, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 0, 0, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 2, 0, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 2, 1, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 2, 1, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 2, 0, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 4, 0, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 4, 1, -0.5, 0.5, 0.5,
-4.673927, -3.473221, 4, 1, 1.5, 0.5, 0.5,
-4.673927, -3.473221, 4, 0, 1.5, 0.5, 0.5
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
-4.1101, -3.026945, -5.720525,
-4.1101, 2.923411, -5.720525,
-4.1101, -3.026945, 5.696308,
-4.1101, 2.923411, 5.696308,
-4.1101, -3.026945, -5.720525,
-4.1101, -3.026945, 5.696308,
-4.1101, 2.923411, -5.720525,
-4.1101, 2.923411, 5.696308,
-4.1101, -3.026945, -5.720525,
3.407604, -3.026945, -5.720525,
-4.1101, -3.026945, 5.696308,
3.407604, -3.026945, 5.696308,
-4.1101, 2.923411, -5.720525,
3.407604, 2.923411, -5.720525,
-4.1101, 2.923411, 5.696308,
3.407604, 2.923411, 5.696308,
3.407604, -3.026945, -5.720525,
3.407604, 2.923411, -5.720525,
3.407604, -3.026945, 5.696308,
3.407604, 2.923411, 5.696308,
3.407604, -3.026945, -5.720525,
3.407604, -3.026945, 5.696308,
3.407604, 2.923411, -5.720525,
3.407604, 2.923411, 5.696308
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
var radius = 7.960909;
var distance = 35.41899;
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
mvMatrix.translate( 0.3512477, 0.05176675, 0.01210856 );
mvMatrix.scale( 1.144963, 1.446551, 0.7539298 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41899);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


