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
-2.7462, 0.2032471, -1.578837, 1, 0, 0, 1,
-2.701089, 0.3695633, -0.5532256, 1, 0.007843138, 0, 1,
-2.556913, -0.6851722, -2.202979, 1, 0.01176471, 0, 1,
-2.52154, 0.6850299, -1.270854, 1, 0.01960784, 0, 1,
-2.517608, 0.06052689, -1.522525, 1, 0.02352941, 0, 1,
-2.475078, 0.8506294, -0.2355835, 1, 0.03137255, 0, 1,
-2.456685, 0.4093808, -0.9238529, 1, 0.03529412, 0, 1,
-2.435997, 0.3917903, -3.090736, 1, 0.04313726, 0, 1,
-2.403382, 0.1475743, -1.915188, 1, 0.04705882, 0, 1,
-2.357758, 1.1198, 0.6951113, 1, 0.05490196, 0, 1,
-2.292249, -0.1979772, -3.269564, 1, 0.05882353, 0, 1,
-2.277148, -0.2589904, -0.8696544, 1, 0.06666667, 0, 1,
-2.214882, -0.8723909, -2.594432, 1, 0.07058824, 0, 1,
-2.185299, 0.6661142, -0.4146003, 1, 0.07843138, 0, 1,
-2.166688, 0.2613297, -1.651693, 1, 0.08235294, 0, 1,
-2.152218, -1.110517, -3.75619, 1, 0.09019608, 0, 1,
-2.131875, -0.3586231, -1.174677, 1, 0.09411765, 0, 1,
-2.118658, 1.026406, -1.678751, 1, 0.1019608, 0, 1,
-2.093674, -0.10844, -2.484906, 1, 0.1098039, 0, 1,
-2.084804, -0.9891982, -1.336164, 1, 0.1137255, 0, 1,
-2.063344, 1.242345, -1.034529, 1, 0.1215686, 0, 1,
-2.050598, -0.9568188, -2.621837, 1, 0.1254902, 0, 1,
-2.03018, -0.3502995, -0.9231154, 1, 0.1333333, 0, 1,
-2.005221, -0.8979248, -1.895882, 1, 0.1372549, 0, 1,
-2.001647, 0.6147292, 1.069909, 1, 0.145098, 0, 1,
-1.969892, 0.06788022, -2.105751, 1, 0.1490196, 0, 1,
-1.958983, -0.1709244, -2.951147, 1, 0.1568628, 0, 1,
-1.954991, -0.3155276, -3.571728, 1, 0.1607843, 0, 1,
-1.953496, 0.05852384, -1.313858, 1, 0.1686275, 0, 1,
-1.943432, 0.7635128, -2.992743, 1, 0.172549, 0, 1,
-1.927461, -0.9807013, -2.531478, 1, 0.1803922, 0, 1,
-1.92401, 0.06970668, -1.179314, 1, 0.1843137, 0, 1,
-1.904947, -0.01479962, -3.13795, 1, 0.1921569, 0, 1,
-1.872327, 0.349333, -1.515835, 1, 0.1960784, 0, 1,
-1.826877, 0.1256872, -1.171202, 1, 0.2039216, 0, 1,
-1.814139, -0.4646297, -2.2204, 1, 0.2117647, 0, 1,
-1.80986, 0.3538804, -1.06757, 1, 0.2156863, 0, 1,
-1.807765, -0.1527045, -0.03590343, 1, 0.2235294, 0, 1,
-1.807427, 0.8501499, -3.060909, 1, 0.227451, 0, 1,
-1.797484, 0.009980184, -2.399363, 1, 0.2352941, 0, 1,
-1.788099, -0.1901117, -1.971666, 1, 0.2392157, 0, 1,
-1.780896, -0.4358143, 0.1475842, 1, 0.2470588, 0, 1,
-1.768464, 0.1703459, -3.005027, 1, 0.2509804, 0, 1,
-1.750093, -0.6841972, -1.853294, 1, 0.2588235, 0, 1,
-1.736953, 1.284384, -2.407531, 1, 0.2627451, 0, 1,
-1.735236, 0.04169116, 0.5401611, 1, 0.2705882, 0, 1,
-1.716356, -1.179315, 0.05208195, 1, 0.2745098, 0, 1,
-1.692305, 0.413357, -0.7372353, 1, 0.282353, 0, 1,
-1.687698, -0.5382645, -1.878519, 1, 0.2862745, 0, 1,
-1.673238, 1.012839, 0.5216255, 1, 0.2941177, 0, 1,
-1.670115, -0.7546747, -5.371814, 1, 0.3019608, 0, 1,
-1.661265, 0.1342425, -2.458466, 1, 0.3058824, 0, 1,
-1.658757, -1.36938, -2.190317, 1, 0.3137255, 0, 1,
-1.653908, -1.072891, -2.506758, 1, 0.3176471, 0, 1,
-1.65268, 1.400206, -0.4884095, 1, 0.3254902, 0, 1,
-1.633454, 0.8350133, -1.693525, 1, 0.3294118, 0, 1,
-1.632268, -0.1647519, -2.640493, 1, 0.3372549, 0, 1,
-1.611476, 0.04308636, 0.1950557, 1, 0.3411765, 0, 1,
-1.608244, 0.4081308, -0.1939574, 1, 0.3490196, 0, 1,
-1.603828, -0.3421079, -2.842143, 1, 0.3529412, 0, 1,
-1.598306, -0.6115628, -2.540084, 1, 0.3607843, 0, 1,
-1.597686, 0.522888, -0.7677659, 1, 0.3647059, 0, 1,
-1.587929, -2.298924, -2.796396, 1, 0.372549, 0, 1,
-1.581259, -0.3397481, -2.207874, 1, 0.3764706, 0, 1,
-1.570631, -0.4651392, -2.388875, 1, 0.3843137, 0, 1,
-1.563641, -1.173253, -2.213464, 1, 0.3882353, 0, 1,
-1.557283, -0.6893959, -0.450373, 1, 0.3960784, 0, 1,
-1.548384, -0.7490464, -1.749223, 1, 0.4039216, 0, 1,
-1.509592, -0.08047463, -1.194686, 1, 0.4078431, 0, 1,
-1.50759, -2.890813, -2.799837, 1, 0.4156863, 0, 1,
-1.493068, -0.5426021, -3.296568, 1, 0.4196078, 0, 1,
-1.477755, 1.136412, -0.5199048, 1, 0.427451, 0, 1,
-1.476734, -1.528596, -2.3112, 1, 0.4313726, 0, 1,
-1.468091, 0.8124297, -0.6305241, 1, 0.4392157, 0, 1,
-1.467525, -0.05664458, -1.941, 1, 0.4431373, 0, 1,
-1.460884, 0.4637197, -1.182306, 1, 0.4509804, 0, 1,
-1.445001, -0.590358, -1.819378, 1, 0.454902, 0, 1,
-1.442377, -1.089996, -1.325108, 1, 0.4627451, 0, 1,
-1.436783, 1.221699, -0.5524887, 1, 0.4666667, 0, 1,
-1.436064, 0.09901899, -1.396027, 1, 0.4745098, 0, 1,
-1.433755, 0.4170204, -1.99373, 1, 0.4784314, 0, 1,
-1.41412, -1.273473, -2.140373, 1, 0.4862745, 0, 1,
-1.406573, -0.00589801, -2.814368, 1, 0.4901961, 0, 1,
-1.40142, 0.5933342, -1.420282, 1, 0.4980392, 0, 1,
-1.386137, 0.219508, 0.9292977, 1, 0.5058824, 0, 1,
-1.378546, -0.3258774, -1.982235, 1, 0.509804, 0, 1,
-1.363348, 0.282012, -0.249939, 1, 0.5176471, 0, 1,
-1.358507, 0.1421682, -1.55552, 1, 0.5215687, 0, 1,
-1.347234, 0.7582136, -0.7776636, 1, 0.5294118, 0, 1,
-1.343172, -0.8272747, -1.298431, 1, 0.5333334, 0, 1,
-1.341246, 0.4058622, -1.713493, 1, 0.5411765, 0, 1,
-1.340357, 1.249273, -0.5750376, 1, 0.5450981, 0, 1,
-1.332714, 1.082912, -1.177805, 1, 0.5529412, 0, 1,
-1.32482, -0.7363124, -1.232365, 1, 0.5568628, 0, 1,
-1.320755, 1.174143, -1.42045, 1, 0.5647059, 0, 1,
-1.314432, -0.3904725, -3.172205, 1, 0.5686275, 0, 1,
-1.312066, 0.1023432, -2.305194, 1, 0.5764706, 0, 1,
-1.309091, -1.331193, -3.232708, 1, 0.5803922, 0, 1,
-1.307052, 0.6549877, -0.3519157, 1, 0.5882353, 0, 1,
-1.305015, -0.1317788, -3.298383, 1, 0.5921569, 0, 1,
-1.302682, 0.3931438, -0.1004605, 1, 0.6, 0, 1,
-1.295286, -1.582527, -1.927236, 1, 0.6078432, 0, 1,
-1.289959, 0.2262212, -1.863668, 1, 0.6117647, 0, 1,
-1.274587, 0.7205583, -1.835838, 1, 0.6196079, 0, 1,
-1.273914, 1.406849, -1.706263, 1, 0.6235294, 0, 1,
-1.272084, 1.566109, -1.035333, 1, 0.6313726, 0, 1,
-1.269825, 1.043054, -1.494035, 1, 0.6352941, 0, 1,
-1.269796, -0.9130265, -3.106931, 1, 0.6431373, 0, 1,
-1.258896, 0.8202666, -1.523796, 1, 0.6470588, 0, 1,
-1.258135, 0.5127654, -1.232075, 1, 0.654902, 0, 1,
-1.256021, 0.4603058, -1.999891, 1, 0.6588235, 0, 1,
-1.246226, 1.41273, 1.563626, 1, 0.6666667, 0, 1,
-1.241985, 0.2835602, -2.423154, 1, 0.6705883, 0, 1,
-1.241285, -1.366217, -3.032856, 1, 0.6784314, 0, 1,
-1.240638, 0.256794, -0.4879205, 1, 0.682353, 0, 1,
-1.229782, 1.663296, -0.1097362, 1, 0.6901961, 0, 1,
-1.229153, 1.546447, -0.4068486, 1, 0.6941177, 0, 1,
-1.215775, -0.7500991, -3.159315, 1, 0.7019608, 0, 1,
-1.211783, 0.570197, -0.4939952, 1, 0.7098039, 0, 1,
-1.211777, 0.3952794, -0.5253347, 1, 0.7137255, 0, 1,
-1.203435, -1.417582, -3.73313, 1, 0.7215686, 0, 1,
-1.202354, -0.7210668, -1.977812, 1, 0.7254902, 0, 1,
-1.198605, 0.636204, -0.5504298, 1, 0.7333333, 0, 1,
-1.196783, 1.057826, 0.4552513, 1, 0.7372549, 0, 1,
-1.189379, -0.3798011, -4.162982, 1, 0.7450981, 0, 1,
-1.186496, -0.6078081, -2.316357, 1, 0.7490196, 0, 1,
-1.184233, 0.6060351, -2.462391, 1, 0.7568628, 0, 1,
-1.179762, -0.9222976, -1.541778, 1, 0.7607843, 0, 1,
-1.178449, -0.7556063, -2.040641, 1, 0.7686275, 0, 1,
-1.175442, 1.131627, -0.757018, 1, 0.772549, 0, 1,
-1.173262, -0.5155883, -1.310754, 1, 0.7803922, 0, 1,
-1.172407, -0.09033089, -1.484144, 1, 0.7843137, 0, 1,
-1.168415, -0.6200067, -1.907152, 1, 0.7921569, 0, 1,
-1.162973, 0.4410539, -0.6629392, 1, 0.7960784, 0, 1,
-1.160015, -0.2912853, -2.67799, 1, 0.8039216, 0, 1,
-1.157632, -0.03844942, -0.967703, 1, 0.8117647, 0, 1,
-1.151054, 0.1738822, -2.826406, 1, 0.8156863, 0, 1,
-1.140972, -0.7495699, -2.665905, 1, 0.8235294, 0, 1,
-1.137251, 0.2217653, -1.444238, 1, 0.827451, 0, 1,
-1.136498, 1.397906, -1.22058, 1, 0.8352941, 0, 1,
-1.133602, 0.457467, -2.918344, 1, 0.8392157, 0, 1,
-1.117799, 0.185684, -0.4426348, 1, 0.8470588, 0, 1,
-1.116795, -1.056358, -2.766247, 1, 0.8509804, 0, 1,
-1.11502, 0.008290396, -3.319587, 1, 0.8588235, 0, 1,
-1.102339, -1.635182, -1.158047, 1, 0.8627451, 0, 1,
-1.101134, 1.955878, 0.06000393, 1, 0.8705882, 0, 1,
-1.100406, 3.224565, -0.5429361, 1, 0.8745098, 0, 1,
-1.097685, 3.330597, 1.358528, 1, 0.8823529, 0, 1,
-1.086604, -0.6217591, -0.6945072, 1, 0.8862745, 0, 1,
-1.082523, 0.3473899, 0.2117178, 1, 0.8941177, 0, 1,
-1.080519, -0.3998652, -3.160637, 1, 0.8980392, 0, 1,
-1.070692, -0.9323502, -2.110698, 1, 0.9058824, 0, 1,
-1.058313, -2.178387, -1.135891, 1, 0.9137255, 0, 1,
-1.058154, -1.263831, -1.807341, 1, 0.9176471, 0, 1,
-1.058127, -0.005464136, -1.998025, 1, 0.9254902, 0, 1,
-1.05362, -0.6981214, -3.121261, 1, 0.9294118, 0, 1,
-1.043923, 0.2671326, -2.592791, 1, 0.9372549, 0, 1,
-1.041822, -0.312781, -1.596358, 1, 0.9411765, 0, 1,
-1.033526, -0.2475771, -3.828996, 1, 0.9490196, 0, 1,
-1.032005, -0.2763436, -3.131438, 1, 0.9529412, 0, 1,
-1.026516, -0.2432031, -1.640901, 1, 0.9607843, 0, 1,
-1.004276, -0.767789, -2.842117, 1, 0.9647059, 0, 1,
-1.002435, 0.5220997, -0.6627513, 1, 0.972549, 0, 1,
-1.002202, 0.9984401, -1.719716, 1, 0.9764706, 0, 1,
-1.001199, 0.04550664, 0.4409685, 1, 0.9843137, 0, 1,
-0.9966079, -1.600926, -2.421474, 1, 0.9882353, 0, 1,
-0.9934632, 1.486202, 0.4578263, 1, 0.9960784, 0, 1,
-0.9841714, 1.114762, -2.099931, 0.9960784, 1, 0, 1,
-0.9837819, 1.190684, 0.4461375, 0.9921569, 1, 0, 1,
-0.9747729, -1.118936, -0.8806559, 0.9843137, 1, 0, 1,
-0.9712027, -0.7694404, -1.788181, 0.9803922, 1, 0, 1,
-0.9669358, 1.413627, 0.8736085, 0.972549, 1, 0, 1,
-0.9655689, -0.3957946, -1.276548, 0.9686275, 1, 0, 1,
-0.9654971, 1.214966, -0.5607865, 0.9607843, 1, 0, 1,
-0.9622608, 0.6283455, -1.300171, 0.9568627, 1, 0, 1,
-0.9609472, -0.2696484, -3.029425, 0.9490196, 1, 0, 1,
-0.9543449, 0.2812333, -1.417404, 0.945098, 1, 0, 1,
-0.9518479, -0.4767693, -3.164961, 0.9372549, 1, 0, 1,
-0.9514613, -0.6057273, -1.957207, 0.9333333, 1, 0, 1,
-0.946502, 1.22437, 0.4091434, 0.9254902, 1, 0, 1,
-0.9416438, 2.506153, 0.01242999, 0.9215686, 1, 0, 1,
-0.9391775, 1.055355, -0.5287769, 0.9137255, 1, 0, 1,
-0.9377452, 1.340531, -1.550238, 0.9098039, 1, 0, 1,
-0.9342765, -0.07350964, -1.905002, 0.9019608, 1, 0, 1,
-0.9159456, -2.439308, -3.669086, 0.8941177, 1, 0, 1,
-0.9108481, 2.293247, -0.2631946, 0.8901961, 1, 0, 1,
-0.9101775, 0.2167645, -2.508987, 0.8823529, 1, 0, 1,
-0.9066038, 1.746949, -1.837845, 0.8784314, 1, 0, 1,
-0.9031979, 2.502131, -0.001689449, 0.8705882, 1, 0, 1,
-0.9016042, 0.7576594, -1.037843, 0.8666667, 1, 0, 1,
-0.8950737, 0.4651477, 2.002329, 0.8588235, 1, 0, 1,
-0.8915231, 0.2491801, -1.843838, 0.854902, 1, 0, 1,
-0.8887454, 2.61575, -1.350416, 0.8470588, 1, 0, 1,
-0.8867941, -1.263183, -1.894926, 0.8431373, 1, 0, 1,
-0.8832946, 0.5824691, -0.6128085, 0.8352941, 1, 0, 1,
-0.8821114, 0.2268812, -1.542704, 0.8313726, 1, 0, 1,
-0.8797825, -0.1311748, -1.44926, 0.8235294, 1, 0, 1,
-0.8703121, -0.2798994, -1.760888, 0.8196079, 1, 0, 1,
-0.8669996, -1.589619, -2.384706, 0.8117647, 1, 0, 1,
-0.8643982, 0.2197507, -0.2243077, 0.8078431, 1, 0, 1,
-0.8612238, 0.8424294, -0.1034323, 0.8, 1, 0, 1,
-0.8612216, 0.4402922, -1.582405, 0.7921569, 1, 0, 1,
-0.8554251, -0.09639321, -1.615407, 0.7882353, 1, 0, 1,
-0.8543502, 2.129129, 2.116926, 0.7803922, 1, 0, 1,
-0.8524036, 1.263492, 0.1688585, 0.7764706, 1, 0, 1,
-0.8408385, 1.153124, -0.0123305, 0.7686275, 1, 0, 1,
-0.8341836, -0.9736722, -1.987236, 0.7647059, 1, 0, 1,
-0.831669, -2.106367, -1.937839, 0.7568628, 1, 0, 1,
-0.8258373, 0.2639313, -1.475963, 0.7529412, 1, 0, 1,
-0.8197492, 1.217582, -1.255316, 0.7450981, 1, 0, 1,
-0.8172007, -0.8274349, -3.564845, 0.7411765, 1, 0, 1,
-0.8170903, -0.3577405, -2.708739, 0.7333333, 1, 0, 1,
-0.8167347, -0.3191412, -2.294515, 0.7294118, 1, 0, 1,
-0.8160529, 0.4074951, -2.009765, 0.7215686, 1, 0, 1,
-0.8129724, 1.185719, -1.265083, 0.7176471, 1, 0, 1,
-0.8123659, 0.4966595, -0.8957949, 0.7098039, 1, 0, 1,
-0.8086932, 0.4734327, -0.2989013, 0.7058824, 1, 0, 1,
-0.806457, -0.8897182, -3.7107, 0.6980392, 1, 0, 1,
-0.8044, -0.3001298, -1.927852, 0.6901961, 1, 0, 1,
-0.8025814, -0.2355897, -4.178178, 0.6862745, 1, 0, 1,
-0.8004654, 0.05297918, -0.1790105, 0.6784314, 1, 0, 1,
-0.7999621, -0.06473663, -0.8833367, 0.6745098, 1, 0, 1,
-0.7945402, 2.587249, 0.7178509, 0.6666667, 1, 0, 1,
-0.7918735, 0.3432388, -1.316886, 0.6627451, 1, 0, 1,
-0.7851834, 0.2166629, 0.005185707, 0.654902, 1, 0, 1,
-0.7844468, 0.5201354, -0.649179, 0.6509804, 1, 0, 1,
-0.7797801, -0.08362982, -1.891275, 0.6431373, 1, 0, 1,
-0.7785474, -0.1308719, -3.089396, 0.6392157, 1, 0, 1,
-0.777054, -0.1743296, 0.5709656, 0.6313726, 1, 0, 1,
-0.775583, 0.2759714, -0.5257742, 0.627451, 1, 0, 1,
-0.7693322, -4.139468, -3.006642, 0.6196079, 1, 0, 1,
-0.7673084, -1.590086, -3.629085, 0.6156863, 1, 0, 1,
-0.761442, 0.2485617, -0.7174931, 0.6078432, 1, 0, 1,
-0.7503445, 0.846785, -1.289372, 0.6039216, 1, 0, 1,
-0.7494354, -0.0937008, -2.766332, 0.5960785, 1, 0, 1,
-0.7474808, 0.7842131, -1.011986, 0.5882353, 1, 0, 1,
-0.7452943, 0.553728, -0.8248674, 0.5843138, 1, 0, 1,
-0.7378331, 1.047409, -0.8992137, 0.5764706, 1, 0, 1,
-0.7302762, 0.1611672, -2.30044, 0.572549, 1, 0, 1,
-0.7297938, -2.005248, -2.542802, 0.5647059, 1, 0, 1,
-0.7254695, -1.798968, -3.011784, 0.5607843, 1, 0, 1,
-0.7223822, -0.6070012, -1.810549, 0.5529412, 1, 0, 1,
-0.7124544, -0.05390114, -0.9077003, 0.5490196, 1, 0, 1,
-0.7062604, -0.972222, -3.310701, 0.5411765, 1, 0, 1,
-0.705631, 1.626543, 0.5187896, 0.5372549, 1, 0, 1,
-0.7050195, 0.6316997, -1.810053, 0.5294118, 1, 0, 1,
-0.7046444, -0.7693576, -3.427095, 0.5254902, 1, 0, 1,
-0.7025518, -1.04126, -2.180765, 0.5176471, 1, 0, 1,
-0.6963038, -0.3017808, -1.461315, 0.5137255, 1, 0, 1,
-0.692844, -0.995663, -3.988067, 0.5058824, 1, 0, 1,
-0.689846, -0.4762592, -1.100839, 0.5019608, 1, 0, 1,
-0.6869196, -0.6044159, -2.413716, 0.4941176, 1, 0, 1,
-0.6865321, -0.2723726, -1.477287, 0.4862745, 1, 0, 1,
-0.6809418, -1.305216, -4.389353, 0.4823529, 1, 0, 1,
-0.6804318, 0.0488245, -1.435736, 0.4745098, 1, 0, 1,
-0.6671, -0.2949631, -2.063791, 0.4705882, 1, 0, 1,
-0.6657536, -1.257911, -2.642387, 0.4627451, 1, 0, 1,
-0.6610013, 0.1501225, -2.062371, 0.4588235, 1, 0, 1,
-0.6574379, 0.556664, -0.766489, 0.4509804, 1, 0, 1,
-0.653409, -0.3823223, -1.673349, 0.4470588, 1, 0, 1,
-0.6531103, 0.2219595, -1.625363, 0.4392157, 1, 0, 1,
-0.6508657, 0.4788823, -1.237954, 0.4352941, 1, 0, 1,
-0.6490495, 0.4726341, -3.63116, 0.427451, 1, 0, 1,
-0.643084, -0.0677406, -1.947211, 0.4235294, 1, 0, 1,
-0.6427078, -1.819397, -1.567969, 0.4156863, 1, 0, 1,
-0.6421357, 0.6703956, -0.2858288, 0.4117647, 1, 0, 1,
-0.6370501, -1.390054, -3.184163, 0.4039216, 1, 0, 1,
-0.622479, 0.6017684, -0.01540006, 0.3960784, 1, 0, 1,
-0.616168, -1.287337, -2.105006, 0.3921569, 1, 0, 1,
-0.6153679, 2.089705, 0.541364, 0.3843137, 1, 0, 1,
-0.6134111, 1.836969, -1.886733, 0.3803922, 1, 0, 1,
-0.6042558, -0.2627122, -2.201819, 0.372549, 1, 0, 1,
-0.5988021, -0.2278215, -0.8301883, 0.3686275, 1, 0, 1,
-0.5985487, 0.683033, -0.2357524, 0.3607843, 1, 0, 1,
-0.5916629, 0.8992818, -0.9094674, 0.3568628, 1, 0, 1,
-0.587554, 0.06242571, -2.234462, 0.3490196, 1, 0, 1,
-0.5863702, -0.06565505, -1.375776, 0.345098, 1, 0, 1,
-0.5843319, 0.6350604, -0.4153521, 0.3372549, 1, 0, 1,
-0.5775962, 1.503789, 0.6329677, 0.3333333, 1, 0, 1,
-0.5760766, 0.8926466, -1.108071, 0.3254902, 1, 0, 1,
-0.5705006, -0.2473774, -3.159619, 0.3215686, 1, 0, 1,
-0.5685443, 1.556445, -0.05909629, 0.3137255, 1, 0, 1,
-0.5682856, -1.313755, -3.046552, 0.3098039, 1, 0, 1,
-0.5671861, 0.5938985, -2.009231, 0.3019608, 1, 0, 1,
-0.5617269, 0.06841639, -2.195073, 0.2941177, 1, 0, 1,
-0.5615278, 1.507209, -1.229984, 0.2901961, 1, 0, 1,
-0.5583686, 0.5340682, 0.3680347, 0.282353, 1, 0, 1,
-0.5581617, 0.5943967, 0.03463518, 0.2784314, 1, 0, 1,
-0.5580642, 0.02662152, -2.085103, 0.2705882, 1, 0, 1,
-0.5553306, -0.2128152, -1.44094, 0.2666667, 1, 0, 1,
-0.5541033, -1.235683, -2.12715, 0.2588235, 1, 0, 1,
-0.548679, 0.1116233, -1.643342, 0.254902, 1, 0, 1,
-0.5486552, 0.7317846, -0.04803789, 0.2470588, 1, 0, 1,
-0.5467008, 0.3917776, -0.7275724, 0.2431373, 1, 0, 1,
-0.5435703, -0.2912939, -2.261075, 0.2352941, 1, 0, 1,
-0.5417138, -0.9029172, -0.1402886, 0.2313726, 1, 0, 1,
-0.5406179, -1.487247, -1.41961, 0.2235294, 1, 0, 1,
-0.5298697, 0.1518831, -1.861773, 0.2196078, 1, 0, 1,
-0.5285938, -0.3968894, -1.812501, 0.2117647, 1, 0, 1,
-0.5213178, -1.23198, -2.122677, 0.2078431, 1, 0, 1,
-0.5097196, -0.6024133, -1.878026, 0.2, 1, 0, 1,
-0.503533, -1.91037, -4.621187, 0.1921569, 1, 0, 1,
-0.4951054, -0.3226544, -2.222862, 0.1882353, 1, 0, 1,
-0.4949732, -1.394225, -1.005459, 0.1803922, 1, 0, 1,
-0.4842865, -0.8054266, -1.563706, 0.1764706, 1, 0, 1,
-0.4819081, 0.4931714, -1.941322, 0.1686275, 1, 0, 1,
-0.4802377, -0.6333932, -1.445786, 0.1647059, 1, 0, 1,
-0.4798975, -0.2753096, -3.754177, 0.1568628, 1, 0, 1,
-0.4768277, -1.322457, -2.467102, 0.1529412, 1, 0, 1,
-0.476621, -0.2659679, -1.369354, 0.145098, 1, 0, 1,
-0.4738834, -0.5245497, -1.703787, 0.1411765, 1, 0, 1,
-0.4727767, -0.2960006, -0.9220812, 0.1333333, 1, 0, 1,
-0.4714806, -0.02496143, -1.489107, 0.1294118, 1, 0, 1,
-0.4683101, -1.039599, -3.717186, 0.1215686, 1, 0, 1,
-0.4681159, -0.1603549, -2.807125, 0.1176471, 1, 0, 1,
-0.4671625, 1.120574, -1.888886, 0.1098039, 1, 0, 1,
-0.4660792, -0.01969534, -2.784425, 0.1058824, 1, 0, 1,
-0.4630189, 0.8900575, -0.9025882, 0.09803922, 1, 0, 1,
-0.4387827, 1.004556, -0.001622236, 0.09019608, 1, 0, 1,
-0.4387503, -2.435316, -3.548017, 0.08627451, 1, 0, 1,
-0.4357566, -2.751013, -3.648912, 0.07843138, 1, 0, 1,
-0.4317595, -0.3495632, -2.85679, 0.07450981, 1, 0, 1,
-0.4263368, 0.6565484, -0.8510959, 0.06666667, 1, 0, 1,
-0.4227259, 0.3017214, 0.8383456, 0.0627451, 1, 0, 1,
-0.4192955, -0.9192955, -3.027261, 0.05490196, 1, 0, 1,
-0.4189543, -1.959077, -3.772101, 0.05098039, 1, 0, 1,
-0.4182389, 0.3521695, -1.804738, 0.04313726, 1, 0, 1,
-0.4122291, -1.235992, -2.735181, 0.03921569, 1, 0, 1,
-0.4113667, 0.5902908, -1.479233, 0.03137255, 1, 0, 1,
-0.4102507, -0.4735306, -3.492309, 0.02745098, 1, 0, 1,
-0.4082563, -0.1362812, -1.620493, 0.01960784, 1, 0, 1,
-0.3983613, -0.2133004, -3.075157, 0.01568628, 1, 0, 1,
-0.3923829, -0.5151178, -1.558542, 0.007843138, 1, 0, 1,
-0.386622, -0.3139114, -1.273708, 0.003921569, 1, 0, 1,
-0.37999, -0.2303427, -1.693608, 0, 1, 0.003921569, 1,
-0.3788648, 0.3606329, -0.1929011, 0, 1, 0.01176471, 1,
-0.3783415, 1.031166, -1.035777, 0, 1, 0.01568628, 1,
-0.377368, -1.347798, -2.294032, 0, 1, 0.02352941, 1,
-0.3772412, 0.2210159, -0.04105826, 0, 1, 0.02745098, 1,
-0.3764445, 0.1836235, -3.92852, 0, 1, 0.03529412, 1,
-0.3684102, 0.01492392, -2.349188, 0, 1, 0.03921569, 1,
-0.3621575, -0.3033617, -1.608539, 0, 1, 0.04705882, 1,
-0.3620965, -0.857829, -1.510983, 0, 1, 0.05098039, 1,
-0.3598767, -2.40863, -2.712697, 0, 1, 0.05882353, 1,
-0.3592213, -0.499782, -1.296988, 0, 1, 0.0627451, 1,
-0.3560509, -0.8934512, -2.551491, 0, 1, 0.07058824, 1,
-0.3530999, 0.2601786, 0.05548869, 0, 1, 0.07450981, 1,
-0.3529618, 0.6846437, -1.31494, 0, 1, 0.08235294, 1,
-0.3495153, 1.091713, 0.1930506, 0, 1, 0.08627451, 1,
-0.3371948, -1.226014, -2.977606, 0, 1, 0.09411765, 1,
-0.3335023, 0.001528402, -1.422577, 0, 1, 0.1019608, 1,
-0.3331294, 0.06577598, -1.89125, 0, 1, 0.1058824, 1,
-0.332228, 0.8125326, 0.04821727, 0, 1, 0.1137255, 1,
-0.323675, 0.7245775, -0.8359525, 0, 1, 0.1176471, 1,
-0.3182867, 2.10518, 0.8090367, 0, 1, 0.1254902, 1,
-0.3143916, -0.4815517, -2.636911, 0, 1, 0.1294118, 1,
-0.3127024, 0.8609338, -0.6865106, 0, 1, 0.1372549, 1,
-0.3009082, -2.790327, -2.929495, 0, 1, 0.1411765, 1,
-0.2953714, 0.3054458, -1.481037, 0, 1, 0.1490196, 1,
-0.2912032, -0.7126104, -3.06527, 0, 1, 0.1529412, 1,
-0.2886492, -0.4432496, -3.890297, 0, 1, 0.1607843, 1,
-0.2884542, 0.4798249, -0.3825388, 0, 1, 0.1647059, 1,
-0.2864561, -0.6287685, -2.14824, 0, 1, 0.172549, 1,
-0.283461, -0.4244178, -3.114397, 0, 1, 0.1764706, 1,
-0.2833272, -0.1373875, -1.469875, 0, 1, 0.1843137, 1,
-0.2793908, 0.1332072, -0.2744976, 0, 1, 0.1882353, 1,
-0.2761623, 1.416195, 0.5862088, 0, 1, 0.1960784, 1,
-0.272686, -0.0440824, -1.896765, 0, 1, 0.2039216, 1,
-0.2705832, 0.0199707, -2.120149, 0, 1, 0.2078431, 1,
-0.2664338, 1.424345, -0.06089472, 0, 1, 0.2156863, 1,
-0.2659979, 2.454295, 0.3693614, 0, 1, 0.2196078, 1,
-0.2624458, 0.3114075, -1.122812, 0, 1, 0.227451, 1,
-0.2620671, 0.2446312, 0.3526102, 0, 1, 0.2313726, 1,
-0.25516, 0.2844803, -1.126214, 0, 1, 0.2392157, 1,
-0.2524643, 0.7501008, 0.08983216, 0, 1, 0.2431373, 1,
-0.2481037, 0.2813113, -0.296023, 0, 1, 0.2509804, 1,
-0.2468667, -1.088404, -4.316376, 0, 1, 0.254902, 1,
-0.243952, -0.8432293, -1.816663, 0, 1, 0.2627451, 1,
-0.2373134, 1.163078, -1.121021, 0, 1, 0.2666667, 1,
-0.2269408, 0.4065928, -1.117317, 0, 1, 0.2745098, 1,
-0.2268076, -1.826199, -1.775412, 0, 1, 0.2784314, 1,
-0.2248403, 0.3974886, 0.6014951, 0, 1, 0.2862745, 1,
-0.2244313, 0.4230488, 1.06921, 0, 1, 0.2901961, 1,
-0.2234047, 0.2930608, -0.4634469, 0, 1, 0.2980392, 1,
-0.2223144, -0.402217, -3.054875, 0, 1, 0.3058824, 1,
-0.2196934, 1.504007, -1.902171, 0, 1, 0.3098039, 1,
-0.2195115, 0.9223372, -1.374089, 0, 1, 0.3176471, 1,
-0.2144668, -0.7673479, -3.119528, 0, 1, 0.3215686, 1,
-0.2055689, 0.5016384, 0.8440607, 0, 1, 0.3294118, 1,
-0.204175, -0.5260568, -3.996233, 0, 1, 0.3333333, 1,
-0.2038164, 0.6280046, 0.3860632, 0, 1, 0.3411765, 1,
-0.2037533, -0.1506427, -2.105466, 0, 1, 0.345098, 1,
-0.1982246, 0.2421118, -0.6358747, 0, 1, 0.3529412, 1,
-0.1956403, -0.1306266, -0.6804855, 0, 1, 0.3568628, 1,
-0.1923672, -0.1701414, -2.361504, 0, 1, 0.3647059, 1,
-0.1874817, 0.7369587, -0.1247924, 0, 1, 0.3686275, 1,
-0.1870798, -1.157387, -3.016465, 0, 1, 0.3764706, 1,
-0.1855758, 0.5034319, -1.367657, 0, 1, 0.3803922, 1,
-0.184885, -0.744908, -5.669874, 0, 1, 0.3882353, 1,
-0.1762419, 0.7181355, -0.5936685, 0, 1, 0.3921569, 1,
-0.1754764, 0.1735502, -0.6716356, 0, 1, 0.4, 1,
-0.1730881, -0.004312481, -0.9146063, 0, 1, 0.4078431, 1,
-0.172567, 0.2866414, -0.9357762, 0, 1, 0.4117647, 1,
-0.1720936, 1.139056, 1.49875, 0, 1, 0.4196078, 1,
-0.1691627, -0.2126657, -3.96558, 0, 1, 0.4235294, 1,
-0.1637045, -0.06638347, -1.763481, 0, 1, 0.4313726, 1,
-0.1613884, -0.1629484, -2.004866, 0, 1, 0.4352941, 1,
-0.1599364, -0.1661826, -1.2838, 0, 1, 0.4431373, 1,
-0.1578175, 0.885326, 0.4075764, 0, 1, 0.4470588, 1,
-0.1571493, 0.8712637, 0.7834564, 0, 1, 0.454902, 1,
-0.1539231, 0.05326456, -0.6480395, 0, 1, 0.4588235, 1,
-0.1536135, 1.078099, -0.4623771, 0, 1, 0.4666667, 1,
-0.1533201, -0.2424185, -1.852678, 0, 1, 0.4705882, 1,
-0.1507286, 0.7320139, 0.0842596, 0, 1, 0.4784314, 1,
-0.1431252, 1.216318, -0.4885781, 0, 1, 0.4823529, 1,
-0.1427006, 0.3758642, 0.5270855, 0, 1, 0.4901961, 1,
-0.141017, 0.1863767, -2.422598, 0, 1, 0.4941176, 1,
-0.1381074, -0.4689547, -4.063796, 0, 1, 0.5019608, 1,
-0.1371472, 0.2145618, -0.5894582, 0, 1, 0.509804, 1,
-0.1356417, -0.1465041, -1.590598, 0, 1, 0.5137255, 1,
-0.1346644, 1.20556, -0.06913931, 0, 1, 0.5215687, 1,
-0.1307853, -0.08028489, -3.343109, 0, 1, 0.5254902, 1,
-0.1229965, -0.6359969, -2.810602, 0, 1, 0.5333334, 1,
-0.1163095, 0.3578998, -1.055105, 0, 1, 0.5372549, 1,
-0.1146961, -0.2560285, -1.712095, 0, 1, 0.5450981, 1,
-0.108852, -0.6747494, -1.288206, 0, 1, 0.5490196, 1,
-0.1074156, 0.4922444, -0.003831603, 0, 1, 0.5568628, 1,
-0.1044081, 0.6026584, 0.3963562, 0, 1, 0.5607843, 1,
-0.1039359, -1.219038, -2.483258, 0, 1, 0.5686275, 1,
-0.101757, -1.102168, -3.840249, 0, 1, 0.572549, 1,
-0.101233, 0.4198602, -2.075537, 0, 1, 0.5803922, 1,
-0.100185, -0.5170123, -2.157699, 0, 1, 0.5843138, 1,
-0.09370493, 0.9058418, 1.195087, 0, 1, 0.5921569, 1,
-0.0864936, 0.2655995, -0.3374749, 0, 1, 0.5960785, 1,
-0.08497491, -0.9056392, -2.662539, 0, 1, 0.6039216, 1,
-0.08381897, 1.082435, -1.337134, 0, 1, 0.6117647, 1,
-0.07707624, 0.129286, -2.90329, 0, 1, 0.6156863, 1,
-0.06117613, -0.02878655, -1.398913, 0, 1, 0.6235294, 1,
-0.05655492, -2.240533, -3.623698, 0, 1, 0.627451, 1,
-0.0520555, 0.318665, 0.04880543, 0, 1, 0.6352941, 1,
-0.04844831, -0.5626097, -2.68353, 0, 1, 0.6392157, 1,
-0.04089318, -1.292096, -1.559661, 0, 1, 0.6470588, 1,
-0.03936608, -1.815706, -1.645473, 0, 1, 0.6509804, 1,
-0.03824642, 1.338997, -1.768705, 0, 1, 0.6588235, 1,
-0.0379541, -0.2401742, -3.035903, 0, 1, 0.6627451, 1,
-0.03732452, 0.5873505, -0.3444138, 0, 1, 0.6705883, 1,
-0.01941298, -1.394543, -2.102119, 0, 1, 0.6745098, 1,
-0.01848859, 0.9823968, 0.1159978, 0, 1, 0.682353, 1,
-0.01834455, 0.9225924, -2.000057, 0, 1, 0.6862745, 1,
-0.01738083, 0.0935199, 0.1516567, 0, 1, 0.6941177, 1,
-0.01646106, -0.9215622, -2.863868, 0, 1, 0.7019608, 1,
-0.01571503, 0.8550548, 0.7137602, 0, 1, 0.7058824, 1,
-0.01390068, 0.3082067, -0.9309705, 0, 1, 0.7137255, 1,
-0.01191911, 1.080609, 0.3301569, 0, 1, 0.7176471, 1,
-0.007166663, 0.8191851, 0.5021386, 0, 1, 0.7254902, 1,
-0.007014333, -0.3867708, -2.089433, 0, 1, 0.7294118, 1,
-0.004664153, 0.467805, 0.02112423, 0, 1, 0.7372549, 1,
-0.0005236048, 1.194402, -0.8894132, 0, 1, 0.7411765, 1,
-0.0001826668, -0.4490443, -3.926996, 0, 1, 0.7490196, 1,
0.001524144, 0.844581, -0.7782447, 0, 1, 0.7529412, 1,
0.004355718, -0.1859321, 2.370042, 0, 1, 0.7607843, 1,
0.01183857, 1.033891, 0.4254521, 0, 1, 0.7647059, 1,
0.01235473, -0.08005129, 3.239931, 0, 1, 0.772549, 1,
0.01759399, 0.5817506, -0.6570389, 0, 1, 0.7764706, 1,
0.01781946, 0.1393146, 0.450326, 0, 1, 0.7843137, 1,
0.01851891, 0.211797, -1.066787, 0, 1, 0.7882353, 1,
0.0193462, 0.2733801, -1.185956, 0, 1, 0.7960784, 1,
0.01946397, 0.1294398, 0.2743049, 0, 1, 0.8039216, 1,
0.02107503, -0.3276097, 1.259306, 0, 1, 0.8078431, 1,
0.02628921, 1.015834, -0.2094319, 0, 1, 0.8156863, 1,
0.02698333, 0.07537704, 0.16052, 0, 1, 0.8196079, 1,
0.02797068, -1.840294, 1.172007, 0, 1, 0.827451, 1,
0.03173105, 2.171051, -0.2720641, 0, 1, 0.8313726, 1,
0.03193887, -0.2201194, 3.36109, 0, 1, 0.8392157, 1,
0.03488241, -1.024616, 3.106497, 0, 1, 0.8431373, 1,
0.0389791, -1.032779, 3.009168, 0, 1, 0.8509804, 1,
0.04005907, -0.07842171, 1.074437, 0, 1, 0.854902, 1,
0.04850634, -0.3528259, 3.108441, 0, 1, 0.8627451, 1,
0.05126031, 0.1655404, 1.773818, 0, 1, 0.8666667, 1,
0.05295626, 1.933804, 0.8600623, 0, 1, 0.8745098, 1,
0.05635421, 1.42768, -0.02197984, 0, 1, 0.8784314, 1,
0.05893973, -1.024759, 2.508259, 0, 1, 0.8862745, 1,
0.05996108, 0.2781063, 1.173527, 0, 1, 0.8901961, 1,
0.06231744, -0.4955841, 2.25659, 0, 1, 0.8980392, 1,
0.06313583, -0.7316004, 2.211502, 0, 1, 0.9058824, 1,
0.07169019, 1.717279, 1.164299, 0, 1, 0.9098039, 1,
0.07650064, -0.3385832, 0.4735227, 0, 1, 0.9176471, 1,
0.07718377, 1.454472, -0.1670535, 0, 1, 0.9215686, 1,
0.08051056, -0.1096074, 1.46931, 0, 1, 0.9294118, 1,
0.0822768, 2.195036, -1.761477, 0, 1, 0.9333333, 1,
0.0865861, -0.4805498, 2.950012, 0, 1, 0.9411765, 1,
0.09103175, -0.7543744, 2.99623, 0, 1, 0.945098, 1,
0.09246232, 1.470626, 0.2465263, 0, 1, 0.9529412, 1,
0.09267855, 0.6224442, -0.3571733, 0, 1, 0.9568627, 1,
0.09280036, 1.07372, 0.1088016, 0, 1, 0.9647059, 1,
0.09379556, -0.4675891, 2.343844, 0, 1, 0.9686275, 1,
0.09451173, 0.6051804, -0.3357105, 0, 1, 0.9764706, 1,
0.09478067, 0.9135546, 0.01086743, 0, 1, 0.9803922, 1,
0.106815, -0.9950165, 2.731651, 0, 1, 0.9882353, 1,
0.1069663, 0.08048411, 0.1490267, 0, 1, 0.9921569, 1,
0.1069766, 0.3002654, 0.6056294, 0, 1, 1, 1,
0.1079231, -0.932794, 5.159762, 0, 0.9921569, 1, 1,
0.1156949, -0.0822112, 4.5219, 0, 0.9882353, 1, 1,
0.1159201, 0.0006801999, 0.6421208, 0, 0.9803922, 1, 1,
0.1171183, 2.708909, -0.8903033, 0, 0.9764706, 1, 1,
0.123012, 0.3545135, -1.078023, 0, 0.9686275, 1, 1,
0.123739, 1.554182, 0.5738306, 0, 0.9647059, 1, 1,
0.124771, 1.53738, 1.019365, 0, 0.9568627, 1, 1,
0.1270069, 0.4150009, 0.6415418, 0, 0.9529412, 1, 1,
0.1278426, 0.07292116, 2.90848, 0, 0.945098, 1, 1,
0.1300401, -0.3793092, 2.41213, 0, 0.9411765, 1, 1,
0.1315521, 0.5729887, -0.1246272, 0, 0.9333333, 1, 1,
0.1320316, 0.5826057, 0.7890474, 0, 0.9294118, 1, 1,
0.1326754, -1.351561, 1.571021, 0, 0.9215686, 1, 1,
0.1333687, -0.06956252, 3.486123, 0, 0.9176471, 1, 1,
0.1359883, 0.2428461, -0.885789, 0, 0.9098039, 1, 1,
0.1483775, -0.1223682, 1.961458, 0, 0.9058824, 1, 1,
0.1485666, 0.05586024, 2.650157, 0, 0.8980392, 1, 1,
0.1496839, -0.09842256, -0.135985, 0, 0.8901961, 1, 1,
0.1544126, -0.3419319, 3.657593, 0, 0.8862745, 1, 1,
0.1575881, -0.8060383, 2.687932, 0, 0.8784314, 1, 1,
0.1582843, 0.09232015, -1.167076, 0, 0.8745098, 1, 1,
0.1608123, 1.078586, 0.1375114, 0, 0.8666667, 1, 1,
0.1636452, -1.825464, 2.923483, 0, 0.8627451, 1, 1,
0.1656147, -0.4418129, 1.269384, 0, 0.854902, 1, 1,
0.1659892, 0.1059611, 2.52415, 0, 0.8509804, 1, 1,
0.1660462, 1.234787, 1.658464, 0, 0.8431373, 1, 1,
0.1661966, 1.114106, 0.08357732, 0, 0.8392157, 1, 1,
0.1677675, 0.7232233, -0.6248345, 0, 0.8313726, 1, 1,
0.1678318, -1.121883, 3.613927, 0, 0.827451, 1, 1,
0.1719377, -1.195169, 3.40451, 0, 0.8196079, 1, 1,
0.1723871, 0.1972698, 0.04353456, 0, 0.8156863, 1, 1,
0.1743474, -0.4154119, 3.871007, 0, 0.8078431, 1, 1,
0.1775334, 1.018338, 1.917463, 0, 0.8039216, 1, 1,
0.1785647, -0.1303119, 1.786741, 0, 0.7960784, 1, 1,
0.1794003, -0.5241662, 4.753935, 0, 0.7882353, 1, 1,
0.1894147, 1.506744, -0.1179647, 0, 0.7843137, 1, 1,
0.1909713, -0.1072894, 4.577001, 0, 0.7764706, 1, 1,
0.1915702, 0.3328422, 1.272384, 0, 0.772549, 1, 1,
0.1927961, 1.67655, 0.3459487, 0, 0.7647059, 1, 1,
0.1962959, -0.5485957, 0.1681766, 0, 0.7607843, 1, 1,
0.1990967, 1.06291, -2.067958, 0, 0.7529412, 1, 1,
0.2009329, -0.7851772, 2.367815, 0, 0.7490196, 1, 1,
0.201488, 1.129392, -0.9910934, 0, 0.7411765, 1, 1,
0.2060268, -1.753542, 2.923529, 0, 0.7372549, 1, 1,
0.2074516, 0.8640654, 1.145577, 0, 0.7294118, 1, 1,
0.2080486, 0.2969338, 0.3562458, 0, 0.7254902, 1, 1,
0.2138427, -1.793642, 3.169219, 0, 0.7176471, 1, 1,
0.2162374, 0.4164542, -0.6983356, 0, 0.7137255, 1, 1,
0.2194368, -0.2135205, 1.481096, 0, 0.7058824, 1, 1,
0.2206163, 1.014078, -0.869236, 0, 0.6980392, 1, 1,
0.2241123, 0.4192137, -0.1229026, 0, 0.6941177, 1, 1,
0.2251126, -0.6677307, 2.551977, 0, 0.6862745, 1, 1,
0.2289776, -1.107695, 3.734535, 0, 0.682353, 1, 1,
0.2371056, -0.4817999, 2.067555, 0, 0.6745098, 1, 1,
0.2401813, 0.2764002, -0.4017236, 0, 0.6705883, 1, 1,
0.2405242, -1.242659, 2.313221, 0, 0.6627451, 1, 1,
0.2412626, 0.1444519, 2.285213, 0, 0.6588235, 1, 1,
0.246426, 0.8397938, 1.873852, 0, 0.6509804, 1, 1,
0.2477217, -0.6408405, 3.284404, 0, 0.6470588, 1, 1,
0.2480061, 0.2132397, 0.6693272, 0, 0.6392157, 1, 1,
0.2493755, 1.343554, 0.1270497, 0, 0.6352941, 1, 1,
0.252212, 1.010118, 1.946088, 0, 0.627451, 1, 1,
0.2531011, 1.054776, 1.166003, 0, 0.6235294, 1, 1,
0.2539579, 0.1455741, 1.789988, 0, 0.6156863, 1, 1,
0.2589672, -1.549397, 4.634743, 0, 0.6117647, 1, 1,
0.2622189, 1.449199, -1.44408, 0, 0.6039216, 1, 1,
0.2628987, -0.9769741, 2.452635, 0, 0.5960785, 1, 1,
0.2638828, 0.4620084, 0.170935, 0, 0.5921569, 1, 1,
0.2671824, 0.2645592, 0.2838165, 0, 0.5843138, 1, 1,
0.2676699, 0.7290069, -0.2618503, 0, 0.5803922, 1, 1,
0.2681338, -1.789551, 2.417682, 0, 0.572549, 1, 1,
0.2688718, -0.003798888, 1.112514, 0, 0.5686275, 1, 1,
0.2695828, 0.7408132, 1.250866, 0, 0.5607843, 1, 1,
0.2698449, 0.7698784, -0.7560931, 0, 0.5568628, 1, 1,
0.2713199, -0.1806599, 3.231888, 0, 0.5490196, 1, 1,
0.2730425, 0.3570774, 1.015247, 0, 0.5450981, 1, 1,
0.2786926, 0.4637398, -0.1411905, 0, 0.5372549, 1, 1,
0.281967, 0.6991642, -0.1299515, 0, 0.5333334, 1, 1,
0.2835303, -0.9274629, 2.904442, 0, 0.5254902, 1, 1,
0.2881809, 0.4398586, 1.881396, 0, 0.5215687, 1, 1,
0.2890266, 1.047374, 0.8016625, 0, 0.5137255, 1, 1,
0.2904669, -0.3326879, 0.9891671, 0, 0.509804, 1, 1,
0.2905718, 0.431376, -0.8371349, 0, 0.5019608, 1, 1,
0.2910807, -1.181247, 1.253322, 0, 0.4941176, 1, 1,
0.2955271, -1.101919, 2.984741, 0, 0.4901961, 1, 1,
0.3005792, -0.374405, 2.72278, 0, 0.4823529, 1, 1,
0.3009071, -0.009122258, 3.606817, 0, 0.4784314, 1, 1,
0.3028417, -1.193625, 3.555182, 0, 0.4705882, 1, 1,
0.303029, 2.168016, 1.53071, 0, 0.4666667, 1, 1,
0.3031245, -0.485662, 1.212406, 0, 0.4588235, 1, 1,
0.3047987, -0.4052029, -0.8014454, 0, 0.454902, 1, 1,
0.3049215, 1.56554, -0.5927309, 0, 0.4470588, 1, 1,
0.3060202, 0.8975286, -0.1961695, 0, 0.4431373, 1, 1,
0.3062041, -0.08927661, 1.767941, 0, 0.4352941, 1, 1,
0.3115562, 1.327085, 0.296501, 0, 0.4313726, 1, 1,
0.3154053, -0.8300885, 1.765281, 0, 0.4235294, 1, 1,
0.3187923, -0.3033095, 2.340139, 0, 0.4196078, 1, 1,
0.3188153, 0.5997285, -0.2524984, 0, 0.4117647, 1, 1,
0.3305448, -0.4528779, 4.169428, 0, 0.4078431, 1, 1,
0.3359686, -0.1701398, 1.80311, 0, 0.4, 1, 1,
0.3396158, -2.390742, 2.818621, 0, 0.3921569, 1, 1,
0.3432768, -0.3342191, 3.509243, 0, 0.3882353, 1, 1,
0.3448999, 0.3478195, -0.9192942, 0, 0.3803922, 1, 1,
0.3500914, -1.036464, 1.593247, 0, 0.3764706, 1, 1,
0.3502237, 0.4128642, -0.7117906, 0, 0.3686275, 1, 1,
0.3502731, 1.161, -0.5769377, 0, 0.3647059, 1, 1,
0.3516775, -1.063579, 3.587305, 0, 0.3568628, 1, 1,
0.3555094, -0.5708176, 3.724709, 0, 0.3529412, 1, 1,
0.357522, 0.02839332, 1.745651, 0, 0.345098, 1, 1,
0.3580303, 0.4513656, 0.3724799, 0, 0.3411765, 1, 1,
0.3601385, -1.752733, 0.5974579, 0, 0.3333333, 1, 1,
0.3612741, -0.5037109, 4.444042, 0, 0.3294118, 1, 1,
0.3613689, -1.740953, 3.471448, 0, 0.3215686, 1, 1,
0.363432, -2.170428, 2.041788, 0, 0.3176471, 1, 1,
0.3635928, -1.786327, 2.934822, 0, 0.3098039, 1, 1,
0.3697143, -0.5028921, 1.224521, 0, 0.3058824, 1, 1,
0.3698107, 0.5223334, 0.2291719, 0, 0.2980392, 1, 1,
0.3698264, -0.0148554, 1.492214, 0, 0.2901961, 1, 1,
0.371372, -0.09841538, 2.449635, 0, 0.2862745, 1, 1,
0.3713996, -0.8232509, 3.093645, 0, 0.2784314, 1, 1,
0.3729696, -1.192551, 2.755319, 0, 0.2745098, 1, 1,
0.3748321, -1.550977, 3.208648, 0, 0.2666667, 1, 1,
0.3781097, -0.2526495, 2.500675, 0, 0.2627451, 1, 1,
0.3795569, 0.5538023, 1.81203, 0, 0.254902, 1, 1,
0.3847834, 2.309327, 0.9265966, 0, 0.2509804, 1, 1,
0.3851597, 0.4095531, -0.1861171, 0, 0.2431373, 1, 1,
0.3893862, -2.049708, 4.281342, 0, 0.2392157, 1, 1,
0.3906014, -0.1131194, 3.04792, 0, 0.2313726, 1, 1,
0.3928528, -0.01363996, 1.053648, 0, 0.227451, 1, 1,
0.3957729, -1.325539, 2.724406, 0, 0.2196078, 1, 1,
0.396235, -0.5236147, 2.18115, 0, 0.2156863, 1, 1,
0.3971356, 0.2797879, -0.04392591, 0, 0.2078431, 1, 1,
0.3978491, 1.995145, 0.3392886, 0, 0.2039216, 1, 1,
0.3997372, -0.5229703, 3.884939, 0, 0.1960784, 1, 1,
0.4028696, 0.9877543, 0.06525963, 0, 0.1882353, 1, 1,
0.4031901, 1.1848, 1.244341, 0, 0.1843137, 1, 1,
0.4032333, -0.8578097, 2.167072, 0, 0.1764706, 1, 1,
0.4038102, 0.6274465, -0.5100936, 0, 0.172549, 1, 1,
0.4068383, 0.1477688, 3.276868, 0, 0.1647059, 1, 1,
0.4091112, 1.13176, -1.103728, 0, 0.1607843, 1, 1,
0.4131953, -0.136189, 0.5906133, 0, 0.1529412, 1, 1,
0.4142867, 0.2909774, -0.4560606, 0, 0.1490196, 1, 1,
0.4188306, 1.086935, 2.037316, 0, 0.1411765, 1, 1,
0.4202707, -0.1178053, 1.160778, 0, 0.1372549, 1, 1,
0.4220742, 1.039172, 0.2163524, 0, 0.1294118, 1, 1,
0.4263121, 0.1309058, 0.9373225, 0, 0.1254902, 1, 1,
0.4293817, 1.121347, -0.04490136, 0, 0.1176471, 1, 1,
0.4293893, -0.3878618, 1.032951, 0, 0.1137255, 1, 1,
0.4311795, -0.4770211, 2.711967, 0, 0.1058824, 1, 1,
0.4330948, 0.9330842, 2.125978, 0, 0.09803922, 1, 1,
0.4355198, -1.185019, 3.212365, 0, 0.09411765, 1, 1,
0.4359443, 1.032003, 0.3750114, 0, 0.08627451, 1, 1,
0.4397897, -2.200662, 3.713127, 0, 0.08235294, 1, 1,
0.4412383, 0.9633189, 1.431183, 0, 0.07450981, 1, 1,
0.4427901, -0.08658169, 1.372265, 0, 0.07058824, 1, 1,
0.4460824, -0.2277334, 1.389165, 0, 0.0627451, 1, 1,
0.447239, -0.4938174, 1.6155, 0, 0.05882353, 1, 1,
0.454877, 1.529462, 0.1963909, 0, 0.05098039, 1, 1,
0.4557686, 1.466916, 0.6789258, 0, 0.04705882, 1, 1,
0.4587417, -0.08571957, 2.415812, 0, 0.03921569, 1, 1,
0.4613323, 0.1996039, 1.205704, 0, 0.03529412, 1, 1,
0.4649825, 1.478831, 0.1016271, 0, 0.02745098, 1, 1,
0.4650721, 1.02227, 0.9240102, 0, 0.02352941, 1, 1,
0.4651743, -0.7289905, 2.914855, 0, 0.01568628, 1, 1,
0.4667103, 1.148475, -0.7471724, 0, 0.01176471, 1, 1,
0.4670822, -0.05738351, 0.7092683, 0, 0.003921569, 1, 1,
0.4676433, -0.6452105, 3.77388, 0.003921569, 0, 1, 1,
0.4700015, -0.7786927, 1.915558, 0.007843138, 0, 1, 1,
0.4722243, -0.471217, 2.951136, 0.01568628, 0, 1, 1,
0.4745435, -0.7521713, 2.850588, 0.01960784, 0, 1, 1,
0.4782461, -0.07894098, 1.175806, 0.02745098, 0, 1, 1,
0.480243, -0.7330632, 1.831482, 0.03137255, 0, 1, 1,
0.4819585, 0.9837511, -0.3177543, 0.03921569, 0, 1, 1,
0.4981806, -0.2535752, 0.8526802, 0.04313726, 0, 1, 1,
0.5008179, 1.11071, -0.8245012, 0.05098039, 0, 1, 1,
0.5011038, 0.4610062, 0.1295236, 0.05490196, 0, 1, 1,
0.5029339, 0.2287709, 0.8142096, 0.0627451, 0, 1, 1,
0.5055912, -0.174178, -0.1416575, 0.06666667, 0, 1, 1,
0.506119, 0.8749743, -0.6022953, 0.07450981, 0, 1, 1,
0.5083359, -0.3533096, 0.1619146, 0.07843138, 0, 1, 1,
0.5107415, 0.304376, 0.7569399, 0.08627451, 0, 1, 1,
0.5120414, -0.9525493, 1.312179, 0.09019608, 0, 1, 1,
0.5154599, 0.335558, 1.667831, 0.09803922, 0, 1, 1,
0.52004, 1.03128, 0.9284737, 0.1058824, 0, 1, 1,
0.5211105, 1.238114, -0.2056419, 0.1098039, 0, 1, 1,
0.5267766, 1.357557, 1.353746, 0.1176471, 0, 1, 1,
0.5273346, -0.2146284, 3.631424, 0.1215686, 0, 1, 1,
0.5289716, 0.7620233, 0.3769223, 0.1294118, 0, 1, 1,
0.5293252, 1.191841, -1.158963, 0.1333333, 0, 1, 1,
0.5305355, -0.5673791, 3.85559, 0.1411765, 0, 1, 1,
0.5306382, 0.04568034, -0.7728624, 0.145098, 0, 1, 1,
0.5341319, 0.3595377, -0.01621928, 0.1529412, 0, 1, 1,
0.5442938, -0.641932, 3.081808, 0.1568628, 0, 1, 1,
0.5452891, -0.7582862, 3.211103, 0.1647059, 0, 1, 1,
0.5455852, -1.302329, 4.142015, 0.1686275, 0, 1, 1,
0.5500013, -0.2404707, 2.350758, 0.1764706, 0, 1, 1,
0.5522389, 0.553971, 2.084141, 0.1803922, 0, 1, 1,
0.5547109, -0.96843, 2.333259, 0.1882353, 0, 1, 1,
0.5590357, -0.06714408, 2.138467, 0.1921569, 0, 1, 1,
0.5605856, 1.043177, 1.76216, 0.2, 0, 1, 1,
0.5623989, -2.434892, 2.655764, 0.2078431, 0, 1, 1,
0.562415, 0.7769693, 1.605615, 0.2117647, 0, 1, 1,
0.5652772, 0.5945455, -0.2161198, 0.2196078, 0, 1, 1,
0.5662671, -0.5211942, 1.83931, 0.2235294, 0, 1, 1,
0.5670512, 0.826312, 0.1575308, 0.2313726, 0, 1, 1,
0.5758718, -0.6866478, 1.71562, 0.2352941, 0, 1, 1,
0.5821304, -0.5124783, 4.770511, 0.2431373, 0, 1, 1,
0.585644, 0.3543058, 1.173756, 0.2470588, 0, 1, 1,
0.5860711, 0.453223, 1.047089, 0.254902, 0, 1, 1,
0.587016, -0.1721622, 2.239971, 0.2588235, 0, 1, 1,
0.5937856, 0.4887533, 0.2517673, 0.2666667, 0, 1, 1,
0.5948394, 1.732165, -0.100968, 0.2705882, 0, 1, 1,
0.597402, -0.4965295, 0.4850367, 0.2784314, 0, 1, 1,
0.5999201, -0.3196712, 1.150983, 0.282353, 0, 1, 1,
0.6004943, -1.318338, 2.11875, 0.2901961, 0, 1, 1,
0.6064641, -1.167879, 3.310952, 0.2941177, 0, 1, 1,
0.6101347, -0.2823581, 1.867948, 0.3019608, 0, 1, 1,
0.613344, 0.7853863, 0.5575045, 0.3098039, 0, 1, 1,
0.6140968, -0.1903222, 0.6723748, 0.3137255, 0, 1, 1,
0.6160111, 1.572159, 1.739442, 0.3215686, 0, 1, 1,
0.6177995, -0.6739751, 1.979125, 0.3254902, 0, 1, 1,
0.6182244, -0.7468641, 1.900135, 0.3333333, 0, 1, 1,
0.6231396, -0.3725682, 1.263158, 0.3372549, 0, 1, 1,
0.627196, -0.5857396, 1.566581, 0.345098, 0, 1, 1,
0.6338098, -0.3966493, 0.4587931, 0.3490196, 0, 1, 1,
0.6404575, -0.9036048, 2.21926, 0.3568628, 0, 1, 1,
0.6408989, 2.211544, -0.5166255, 0.3607843, 0, 1, 1,
0.6420177, -0.247015, 2.173595, 0.3686275, 0, 1, 1,
0.6432741, 0.8375224, -0.1324598, 0.372549, 0, 1, 1,
0.6498305, -1.696901, 3.137239, 0.3803922, 0, 1, 1,
0.6513928, 1.291764, -0.182642, 0.3843137, 0, 1, 1,
0.6545961, 1.147325, -0.240491, 0.3921569, 0, 1, 1,
0.6602726, 0.3798117, 1.299914, 0.3960784, 0, 1, 1,
0.6621699, -0.0470016, -0.09236071, 0.4039216, 0, 1, 1,
0.6634856, -0.5849121, 1.71601, 0.4117647, 0, 1, 1,
0.6688079, 0.4601037, 2.359182, 0.4156863, 0, 1, 1,
0.6733745, 0.9734017, 1.287002, 0.4235294, 0, 1, 1,
0.6788998, -4.093721, 2.582137, 0.427451, 0, 1, 1,
0.6821319, 0.3460424, 0.5603951, 0.4352941, 0, 1, 1,
0.6849476, 0.698488, 0.5813722, 0.4392157, 0, 1, 1,
0.6854578, 0.1834945, 3.481767, 0.4470588, 0, 1, 1,
0.6854789, 0.5155226, 0.4303076, 0.4509804, 0, 1, 1,
0.686083, 1.413537, -0.2861078, 0.4588235, 0, 1, 1,
0.6930113, 0.7347314, -0.5833457, 0.4627451, 0, 1, 1,
0.7025409, 1.340828, -1.467867, 0.4705882, 0, 1, 1,
0.7047274, 0.5069649, 2.11778, 0.4745098, 0, 1, 1,
0.7077267, 0.8300946, 1.084604, 0.4823529, 0, 1, 1,
0.7120839, -0.166807, 1.873628, 0.4862745, 0, 1, 1,
0.714822, 2.465539, 1.329914, 0.4941176, 0, 1, 1,
0.7167816, -0.6281893, 4.404634, 0.5019608, 0, 1, 1,
0.7168514, 1.604202, 1.041538, 0.5058824, 0, 1, 1,
0.7196786, -0.4588656, 2.171584, 0.5137255, 0, 1, 1,
0.7233599, 0.2342666, 1.833516, 0.5176471, 0, 1, 1,
0.7260407, 1.229946, 0.2754245, 0.5254902, 0, 1, 1,
0.7297322, 2.083507, 0.08504514, 0.5294118, 0, 1, 1,
0.7311594, 1.689924, 1.103079, 0.5372549, 0, 1, 1,
0.7358884, 0.05707189, 1.432183, 0.5411765, 0, 1, 1,
0.7361172, -0.9486108, 2.648356, 0.5490196, 0, 1, 1,
0.7366008, 0.3069331, 0.5826361, 0.5529412, 0, 1, 1,
0.7367274, -0.3683943, 0.4963396, 0.5607843, 0, 1, 1,
0.7369399, 1.00542, -1.265435, 0.5647059, 0, 1, 1,
0.7371807, 0.2821013, 2.074184, 0.572549, 0, 1, 1,
0.7432189, 1.0226, -0.5123187, 0.5764706, 0, 1, 1,
0.7496046, 0.7988376, 2.501261, 0.5843138, 0, 1, 1,
0.7580523, -1.753593, 3.842731, 0.5882353, 0, 1, 1,
0.7615695, -0.3078139, 2.432411, 0.5960785, 0, 1, 1,
0.762164, 1.109388, 0.8781341, 0.6039216, 0, 1, 1,
0.7623922, 0.5309638, 1.765524, 0.6078432, 0, 1, 1,
0.7748303, -1.346358, 3.392659, 0.6156863, 0, 1, 1,
0.7773485, 0.8285083, 0.1936612, 0.6196079, 0, 1, 1,
0.7793363, -0.709857, 2.221588, 0.627451, 0, 1, 1,
0.780772, -1.643308, 3.506806, 0.6313726, 0, 1, 1,
0.7870385, -1.507406, 3.26638, 0.6392157, 0, 1, 1,
0.7893714, -0.8170359, 1.025474, 0.6431373, 0, 1, 1,
0.7972572, 0.8348487, -0.8168287, 0.6509804, 0, 1, 1,
0.7993427, -1.248759, 1.08005, 0.654902, 0, 1, 1,
0.8049865, 0.9184547, 1.647771, 0.6627451, 0, 1, 1,
0.8050639, -1.360156, 0.8590272, 0.6666667, 0, 1, 1,
0.8102124, -1.079084, 0.9544591, 0.6745098, 0, 1, 1,
0.8123033, -0.1979401, 1.786812, 0.6784314, 0, 1, 1,
0.8124428, -0.5011573, 1.972949, 0.6862745, 0, 1, 1,
0.8147914, -0.8171889, 2.916883, 0.6901961, 0, 1, 1,
0.8162063, -1.572376, 1.593565, 0.6980392, 0, 1, 1,
0.8188424, -0.4683059, 0.934929, 0.7058824, 0, 1, 1,
0.8199918, -0.2636295, 2.041386, 0.7098039, 0, 1, 1,
0.8206511, 2.246085, -1.246562, 0.7176471, 0, 1, 1,
0.8223894, 2.55896, -0.2306741, 0.7215686, 0, 1, 1,
0.8241067, 2.08097, 0.5935368, 0.7294118, 0, 1, 1,
0.824595, -1.61456, 0.3906167, 0.7333333, 0, 1, 1,
0.826468, 1.035214, -0.01004548, 0.7411765, 0, 1, 1,
0.8317745, 0.5822903, 0.6863742, 0.7450981, 0, 1, 1,
0.8351491, -0.1370186, 1.02438, 0.7529412, 0, 1, 1,
0.838515, 2.54202, -0.9883466, 0.7568628, 0, 1, 1,
0.8391612, 1.41088, 0.08725771, 0.7647059, 0, 1, 1,
0.8403667, 0.9442588, 1.751783, 0.7686275, 0, 1, 1,
0.8419788, -0.3102071, 4.121644, 0.7764706, 0, 1, 1,
0.8449693, -1.533551, 1.902423, 0.7803922, 0, 1, 1,
0.8455203, 0.5348598, 1.681523, 0.7882353, 0, 1, 1,
0.8544746, -1.281479, 3.94357, 0.7921569, 0, 1, 1,
0.8589327, 0.2598003, 3.268667, 0.8, 0, 1, 1,
0.8759014, 0.688755, -1.050599, 0.8078431, 0, 1, 1,
0.8847792, 0.5462133, 0.1573873, 0.8117647, 0, 1, 1,
0.8855127, -0.2571927, 1.532004, 0.8196079, 0, 1, 1,
0.8913816, 1.298786, 0.587633, 0.8235294, 0, 1, 1,
0.893151, 1.254938, -0.2275659, 0.8313726, 0, 1, 1,
0.8972271, -0.566361, 2.289522, 0.8352941, 0, 1, 1,
0.8981289, -0.8243592, 2.645881, 0.8431373, 0, 1, 1,
0.8988301, -1.37975, 0.6505941, 0.8470588, 0, 1, 1,
0.8994542, 1.248215, 0.03857428, 0.854902, 0, 1, 1,
0.9010339, -0.06097868, 2.735336, 0.8588235, 0, 1, 1,
0.9124985, 0.5088173, 0.572728, 0.8666667, 0, 1, 1,
0.9165641, -0.05491507, 0.3884995, 0.8705882, 0, 1, 1,
0.9187064, 0.4776543, 1.013817, 0.8784314, 0, 1, 1,
0.9208844, -0.3013928, 3.322546, 0.8823529, 0, 1, 1,
0.9221501, 0.08940395, -0.1203437, 0.8901961, 0, 1, 1,
0.9280335, 1.49572, -0.2390072, 0.8941177, 0, 1, 1,
0.9351389, -1.206291, -0.5179552, 0.9019608, 0, 1, 1,
0.940034, 1.635861, 0.7464101, 0.9098039, 0, 1, 1,
0.9401256, -0.8371698, 2.353169, 0.9137255, 0, 1, 1,
0.9424373, 0.1614691, 0.1342229, 0.9215686, 0, 1, 1,
0.9462262, 0.03436494, 3.366576, 0.9254902, 0, 1, 1,
0.946748, -0.6088552, 2.357792, 0.9333333, 0, 1, 1,
0.9495698, 0.5664051, 1.104077, 0.9372549, 0, 1, 1,
0.9503443, -0.5945392, 4.011267, 0.945098, 0, 1, 1,
0.9569003, 1.85082, -0.56287, 0.9490196, 0, 1, 1,
0.960701, -0.8905715, 4.28136, 0.9568627, 0, 1, 1,
0.9609011, 1.685354, 0.5243867, 0.9607843, 0, 1, 1,
0.9615359, -1.024382, 2.213924, 0.9686275, 0, 1, 1,
0.9660578, 0.7937476, 0.6181506, 0.972549, 0, 1, 1,
0.9692529, 0.7905425, 0.6709619, 0.9803922, 0, 1, 1,
0.970168, 0.8849583, -1.235182, 0.9843137, 0, 1, 1,
0.9816126, 1.721282, 0.3201867, 0.9921569, 0, 1, 1,
0.9894924, -0.4941761, 1.050894, 0.9960784, 0, 1, 1,
0.9903798, 0.6348669, 1.328416, 1, 0, 0.9960784, 1,
0.9904567, 1.568363, 0.3317821, 1, 0, 0.9882353, 1,
0.9907733, -0.8953805, 2.171185, 1, 0, 0.9843137, 1,
0.991268, -1.834841, 4.001166, 1, 0, 0.9764706, 1,
0.9928817, -0.02812312, 0.1601944, 1, 0, 0.972549, 1,
0.9954908, 0.4043363, 1.841657, 1, 0, 0.9647059, 1,
1.000655, 0.4562912, 2.182337, 1, 0, 0.9607843, 1,
1.001562, -0.2468327, -0.6731034, 1, 0, 0.9529412, 1,
1.004557, 0.5063087, 0.2626304, 1, 0, 0.9490196, 1,
1.018356, 0.03705653, 0.3712228, 1, 0, 0.9411765, 1,
1.019242, 0.3086949, 1.266886, 1, 0, 0.9372549, 1,
1.023406, 0.5299544, 1.256973, 1, 0, 0.9294118, 1,
1.02591, -0.1199701, 1.59842, 1, 0, 0.9254902, 1,
1.026009, -1.105294, 2.138448, 1, 0, 0.9176471, 1,
1.032944, -0.9065564, 2.405238, 1, 0, 0.9137255, 1,
1.033993, -0.6443092, 2.790333, 1, 0, 0.9058824, 1,
1.039523, -0.3489987, 3.230165, 1, 0, 0.9019608, 1,
1.041122, 1.339859, -1.728692, 1, 0, 0.8941177, 1,
1.047885, 0.5352364, 0.4687493, 1, 0, 0.8862745, 1,
1.052878, -0.7887638, 2.512556, 1, 0, 0.8823529, 1,
1.06091, -0.5140094, 1.556528, 1, 0, 0.8745098, 1,
1.061398, -0.2612669, 1.767078, 1, 0, 0.8705882, 1,
1.064824, -1.222687, 3.887065, 1, 0, 0.8627451, 1,
1.077217, 0.9716125, 1.750977, 1, 0, 0.8588235, 1,
1.083206, -0.3498271, 2.295893, 1, 0, 0.8509804, 1,
1.086795, 0.5024179, 2.69086, 1, 0, 0.8470588, 1,
1.088009, -0.9779909, 1.839447, 1, 0, 0.8392157, 1,
1.088107, -0.7274705, 1.087243, 1, 0, 0.8352941, 1,
1.09197, -0.8885298, 1.77047, 1, 0, 0.827451, 1,
1.103062, -1.400488, 1.859065, 1, 0, 0.8235294, 1,
1.103405, 1.174965, 1.732977, 1, 0, 0.8156863, 1,
1.103409, -1.637239, 1.599962, 1, 0, 0.8117647, 1,
1.112084, 0.8215644, 1.812391, 1, 0, 0.8039216, 1,
1.118255, -0.4271127, 2.087924, 1, 0, 0.7960784, 1,
1.119058, -1.313956, 1.922562, 1, 0, 0.7921569, 1,
1.120221, -0.8403285, 2.591998, 1, 0, 0.7843137, 1,
1.125175, -0.5959477, 0.08306512, 1, 0, 0.7803922, 1,
1.161039, 0.4447019, 0.8955472, 1, 0, 0.772549, 1,
1.163798, -1.140513, 0.9760937, 1, 0, 0.7686275, 1,
1.165372, -0.7014141, 4.599305, 1, 0, 0.7607843, 1,
1.167899, 1.51327, -0.7669768, 1, 0, 0.7568628, 1,
1.170672, 0.08375423, 0.01662123, 1, 0, 0.7490196, 1,
1.176807, -0.5217404, 0.9764116, 1, 0, 0.7450981, 1,
1.18969, 1.23156, 0.2625148, 1, 0, 0.7372549, 1,
1.194088, 0.8901576, 0.2106104, 1, 0, 0.7333333, 1,
1.195557, 1.741204, 0.2094186, 1, 0, 0.7254902, 1,
1.196212, 0.9456449, 0.5028632, 1, 0, 0.7215686, 1,
1.200843, -0.102708, -1.233315, 1, 0, 0.7137255, 1,
1.200884, 0.09285671, -0.575206, 1, 0, 0.7098039, 1,
1.203566, -2.080536, 2.971714, 1, 0, 0.7019608, 1,
1.205757, -0.8668869, 2.72378, 1, 0, 0.6941177, 1,
1.211125, 0.07219108, 2.188936, 1, 0, 0.6901961, 1,
1.213291, -0.6166682, 2.699132, 1, 0, 0.682353, 1,
1.220751, -0.2365507, 4.541181, 1, 0, 0.6784314, 1,
1.222626, 0.7142634, 2.431705, 1, 0, 0.6705883, 1,
1.225824, -1.033131, 0.2045259, 1, 0, 0.6666667, 1,
1.229099, 0.3543013, 1.476732, 1, 0, 0.6588235, 1,
1.240667, -0.6961025, 3.357051, 1, 0, 0.654902, 1,
1.247367, 0.3424583, 2.46781, 1, 0, 0.6470588, 1,
1.256616, 0.2146573, 0.8484063, 1, 0, 0.6431373, 1,
1.258805, -2.046906, 2.667406, 1, 0, 0.6352941, 1,
1.261057, 1.406429, -0.8961823, 1, 0, 0.6313726, 1,
1.26301, -0.4416165, 1.818383, 1, 0, 0.6235294, 1,
1.276721, -0.5945112, 1.015104, 1, 0, 0.6196079, 1,
1.283516, 0.7814522, 0.01003593, 1, 0, 0.6117647, 1,
1.28401, -0.1915355, 1.691232, 1, 0, 0.6078432, 1,
1.293476, 1.179545, 0.9393989, 1, 0, 0.6, 1,
1.29621, 0.432279, 1.107155, 1, 0, 0.5921569, 1,
1.303676, 1.530052, 0.5829287, 1, 0, 0.5882353, 1,
1.321412, 1.071576, 1.856991, 1, 0, 0.5803922, 1,
1.324733, -2.008685, 2.696295, 1, 0, 0.5764706, 1,
1.325406, -0.2503036, 1.657256, 1, 0, 0.5686275, 1,
1.337527, 0.6809699, 1.3336, 1, 0, 0.5647059, 1,
1.338536, -1.086525, 3.634236, 1, 0, 0.5568628, 1,
1.340076, -0.5245681, 0.8861637, 1, 0, 0.5529412, 1,
1.342219, 1.010847, 0.9302307, 1, 0, 0.5450981, 1,
1.345158, -0.4837042, 2.936053, 1, 0, 0.5411765, 1,
1.345483, -0.6752608, 1.240779, 1, 0, 0.5333334, 1,
1.347509, 2.008175, 1.77362, 1, 0, 0.5294118, 1,
1.349044, 0.03899172, 3.336221, 1, 0, 0.5215687, 1,
1.349156, -0.8811886, 2.753054, 1, 0, 0.5176471, 1,
1.354091, 0.230916, 2.630713, 1, 0, 0.509804, 1,
1.354777, 0.813529, -0.1979138, 1, 0, 0.5058824, 1,
1.36155, 0.4881555, 2.509111, 1, 0, 0.4980392, 1,
1.366135, -0.08376773, 2.182669, 1, 0, 0.4901961, 1,
1.366702, -0.206655, 0.8480184, 1, 0, 0.4862745, 1,
1.370115, -1.024183, 3.528864, 1, 0, 0.4784314, 1,
1.375582, -0.4195985, 0.8067401, 1, 0, 0.4745098, 1,
1.378268, 0.01667637, 0.9795847, 1, 0, 0.4666667, 1,
1.387284, -1.101836, 2.482494, 1, 0, 0.4627451, 1,
1.395283, -0.3568575, 0.4665222, 1, 0, 0.454902, 1,
1.414523, -0.208687, 2.356351, 1, 0, 0.4509804, 1,
1.414597, 0.44004, 2.53429, 1, 0, 0.4431373, 1,
1.432925, -0.8757394, 2.965698, 1, 0, 0.4392157, 1,
1.443413, 1.395991, -0.09572728, 1, 0, 0.4313726, 1,
1.44414, 1.613565, 1.02179, 1, 0, 0.427451, 1,
1.452558, 0.6158839, -0.08978895, 1, 0, 0.4196078, 1,
1.456601, 1.077195, 1.435653, 1, 0, 0.4156863, 1,
1.462865, -1.283328, 1.470367, 1, 0, 0.4078431, 1,
1.473058, -0.6247129, 3.247899, 1, 0, 0.4039216, 1,
1.49175, -0.4303744, 2.43744, 1, 0, 0.3960784, 1,
1.492867, 1.682987, 0.2741913, 1, 0, 0.3882353, 1,
1.512678, 2.148467, -0.1737202, 1, 0, 0.3843137, 1,
1.512885, -1.122072, 2.361461, 1, 0, 0.3764706, 1,
1.517086, 0.2274327, 1.2121, 1, 0, 0.372549, 1,
1.520381, -0.561034, 1.757142, 1, 0, 0.3647059, 1,
1.526535, 1.108663, 1.182665, 1, 0, 0.3607843, 1,
1.541682, -1.058269, 2.151806, 1, 0, 0.3529412, 1,
1.55253, -0.3649492, 2.153975, 1, 0, 0.3490196, 1,
1.564529, 0.5003794, 1.909124, 1, 0, 0.3411765, 1,
1.568758, 0.5724627, 1.266976, 1, 0, 0.3372549, 1,
1.570716, -0.5166113, 2.74477, 1, 0, 0.3294118, 1,
1.579565, 0.932941, 1.480776, 1, 0, 0.3254902, 1,
1.591436, 0.3700205, 1.80131, 1, 0, 0.3176471, 1,
1.593065, 0.4396509, 0.06160462, 1, 0, 0.3137255, 1,
1.594825, -0.1238559, 3.273361, 1, 0, 0.3058824, 1,
1.596483, -0.0744643, 1.354839, 1, 0, 0.2980392, 1,
1.62331, -1.084944, 2.476637, 1, 0, 0.2941177, 1,
1.638097, 0.3884784, 1.66512, 1, 0, 0.2862745, 1,
1.650883, -1.342715, 2.329662, 1, 0, 0.282353, 1,
1.651341, 0.1074841, 2.146326, 1, 0, 0.2745098, 1,
1.661164, -0.970127, 2.027303, 1, 0, 0.2705882, 1,
1.682133, -0.2568242, 2.492581, 1, 0, 0.2627451, 1,
1.69407, -0.7272807, 0.2479898, 1, 0, 0.2588235, 1,
1.713733, 0.1152974, 1.384062, 1, 0, 0.2509804, 1,
1.719399, 0.1393983, 3.020417, 1, 0, 0.2470588, 1,
1.721174, 0.9947717, 0.0858001, 1, 0, 0.2392157, 1,
1.752192, -0.4194734, 3.98214, 1, 0, 0.2352941, 1,
1.766036, 0.3032071, 0.7292876, 1, 0, 0.227451, 1,
1.820749, 0.3995101, 0.1712606, 1, 0, 0.2235294, 1,
1.83665, 1.201829, 0.700255, 1, 0, 0.2156863, 1,
1.851976, 0.1179317, 1.679857, 1, 0, 0.2117647, 1,
1.857374, 0.2271743, 1.922451, 1, 0, 0.2039216, 1,
1.885373, 0.4930338, 0.7247884, 1, 0, 0.1960784, 1,
1.896778, -0.1643305, 0.6600314, 1, 0, 0.1921569, 1,
1.897716, -1.011979, 1.443212, 1, 0, 0.1843137, 1,
1.91275, 0.6777318, 0.3291501, 1, 0, 0.1803922, 1,
1.915107, 1.378463, -0.2911657, 1, 0, 0.172549, 1,
1.922411, -0.9782532, 2.100135, 1, 0, 0.1686275, 1,
1.939862, -0.2467889, 1.284673, 1, 0, 0.1607843, 1,
1.948344, 0.08027513, 2.477061, 1, 0, 0.1568628, 1,
1.950404, -0.8676089, 2.716263, 1, 0, 0.1490196, 1,
2.037366, 0.1187514, 2.042468, 1, 0, 0.145098, 1,
2.044772, 0.5735405, 1.157617, 1, 0, 0.1372549, 1,
2.061686, 0.1009065, 0.7506765, 1, 0, 0.1333333, 1,
2.064583, -0.4511121, 1.201292, 1, 0, 0.1254902, 1,
2.096561, 0.5147588, 2.03653, 1, 0, 0.1215686, 1,
2.10689, 1.320693, 1.324085, 1, 0, 0.1137255, 1,
2.114007, -2.363955, 2.315923, 1, 0, 0.1098039, 1,
2.134308, 1.613581, -0.02541975, 1, 0, 0.1019608, 1,
2.18182, 0.5496374, -0.2803567, 1, 0, 0.09411765, 1,
2.194754, -0.155149, 2.298712, 1, 0, 0.09019608, 1,
2.233164, -1.353617, 3.419801, 1, 0, 0.08235294, 1,
2.269495, -0.3493233, 1.850061, 1, 0, 0.07843138, 1,
2.281469, 1.249705, 1.052063, 1, 0, 0.07058824, 1,
2.343081, -0.1737246, 2.507954, 1, 0, 0.06666667, 1,
2.350928, 0.4045117, 1.528377, 1, 0, 0.05882353, 1,
2.404694, -0.5826119, 1.875723, 1, 0, 0.05490196, 1,
2.434252, 0.3540551, 0.4055554, 1, 0, 0.04705882, 1,
2.45751, 0.345429, 1.457979, 1, 0, 0.04313726, 1,
2.481533, 1.143999, -0.05332512, 1, 0, 0.03529412, 1,
2.48543, 0.4719174, 0.6223411, 1, 0, 0.03137255, 1,
2.698236, 1.346372, 1.602726, 1, 0, 0.02352941, 1,
2.883297, 0.106397, 2.902773, 1, 0, 0.01960784, 1,
2.982685, -0.4148041, 2.185966, 1, 0, 0.01176471, 1,
3.019822, -0.2242809, 2.690228, 1, 0, 0.007843138, 1
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
0.136811, -5.405644, -7.505497, 0, -0.5, 0.5, 0.5,
0.136811, -5.405644, -7.505497, 1, -0.5, 0.5, 0.5,
0.136811, -5.405644, -7.505497, 1, 1.5, 0.5, 0.5,
0.136811, -5.405644, -7.505497, 0, 1.5, 0.5, 0.5
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
-3.723541, -0.4044352, -7.505497, 0, -0.5, 0.5, 0.5,
-3.723541, -0.4044352, -7.505497, 1, -0.5, 0.5, 0.5,
-3.723541, -0.4044352, -7.505497, 1, 1.5, 0.5, 0.5,
-3.723541, -0.4044352, -7.505497, 0, 1.5, 0.5, 0.5
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
-3.723541, -5.405644, -0.2550561, 0, -0.5, 0.5, 0.5,
-3.723541, -5.405644, -0.2550561, 1, -0.5, 0.5, 0.5,
-3.723541, -5.405644, -0.2550561, 1, 1.5, 0.5, 0.5,
-3.723541, -5.405644, -0.2550561, 0, 1.5, 0.5, 0.5
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
-2, -4.251519, -5.832319,
3, -4.251519, -5.832319,
-2, -4.251519, -5.832319,
-2, -4.443873, -6.111182,
-1, -4.251519, -5.832319,
-1, -4.443873, -6.111182,
0, -4.251519, -5.832319,
0, -4.443873, -6.111182,
1, -4.251519, -5.832319,
1, -4.443873, -6.111182,
2, -4.251519, -5.832319,
2, -4.443873, -6.111182,
3, -4.251519, -5.832319,
3, -4.443873, -6.111182
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
-2, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
-2, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
-2, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
-2, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5,
-1, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
-1, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
-1, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
-1, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5,
0, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
0, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
0, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
0, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5,
1, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
1, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
1, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
1, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5,
2, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
2, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
2, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
2, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5,
3, -4.828581, -6.668908, 0, -0.5, 0.5, 0.5,
3, -4.828581, -6.668908, 1, -0.5, 0.5, 0.5,
3, -4.828581, -6.668908, 1, 1.5, 0.5, 0.5,
3, -4.828581, -6.668908, 0, 1.5, 0.5, 0.5
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
-2.832691, -4, -5.832319,
-2.832691, 2, -5.832319,
-2.832691, -4, -5.832319,
-2.981166, -4, -6.111182,
-2.832691, -2, -5.832319,
-2.981166, -2, -6.111182,
-2.832691, 0, -5.832319,
-2.981166, 0, -6.111182,
-2.832691, 2, -5.832319,
-2.981166, 2, -6.111182
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
"-4",
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
-3.278116, -4, -6.668908, 0, -0.5, 0.5, 0.5,
-3.278116, -4, -6.668908, 1, -0.5, 0.5, 0.5,
-3.278116, -4, -6.668908, 1, 1.5, 0.5, 0.5,
-3.278116, -4, -6.668908, 0, 1.5, 0.5, 0.5,
-3.278116, -2, -6.668908, 0, -0.5, 0.5, 0.5,
-3.278116, -2, -6.668908, 1, -0.5, 0.5, 0.5,
-3.278116, -2, -6.668908, 1, 1.5, 0.5, 0.5,
-3.278116, -2, -6.668908, 0, 1.5, 0.5, 0.5,
-3.278116, 0, -6.668908, 0, -0.5, 0.5, 0.5,
-3.278116, 0, -6.668908, 1, -0.5, 0.5, 0.5,
-3.278116, 0, -6.668908, 1, 1.5, 0.5, 0.5,
-3.278116, 0, -6.668908, 0, 1.5, 0.5, 0.5,
-3.278116, 2, -6.668908, 0, -0.5, 0.5, 0.5,
-3.278116, 2, -6.668908, 1, -0.5, 0.5, 0.5,
-3.278116, 2, -6.668908, 1, 1.5, 0.5, 0.5,
-3.278116, 2, -6.668908, 0, 1.5, 0.5, 0.5
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
-2.832691, -4.251519, -4,
-2.832691, -4.251519, 4,
-2.832691, -4.251519, -4,
-2.981166, -4.443873, -4,
-2.832691, -4.251519, -2,
-2.981166, -4.443873, -2,
-2.832691, -4.251519, 0,
-2.981166, -4.443873, 0,
-2.832691, -4.251519, 2,
-2.981166, -4.443873, 2,
-2.832691, -4.251519, 4,
-2.981166, -4.443873, 4
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
-3.278116, -4.828581, -4, 0, -0.5, 0.5, 0.5,
-3.278116, -4.828581, -4, 1, -0.5, 0.5, 0.5,
-3.278116, -4.828581, -4, 1, 1.5, 0.5, 0.5,
-3.278116, -4.828581, -4, 0, 1.5, 0.5, 0.5,
-3.278116, -4.828581, -2, 0, -0.5, 0.5, 0.5,
-3.278116, -4.828581, -2, 1, -0.5, 0.5, 0.5,
-3.278116, -4.828581, -2, 1, 1.5, 0.5, 0.5,
-3.278116, -4.828581, -2, 0, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 0, 0, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 0, 1, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 0, 1, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 0, 0, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 2, 0, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 2, 1, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 2, 1, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 2, 0, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 4, 0, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 4, 1, -0.5, 0.5, 0.5,
-3.278116, -4.828581, 4, 1, 1.5, 0.5, 0.5,
-3.278116, -4.828581, 4, 0, 1.5, 0.5, 0.5
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
-2.832691, -4.251519, -5.832319,
-2.832691, 3.442648, -5.832319,
-2.832691, -4.251519, 5.322206,
-2.832691, 3.442648, 5.322206,
-2.832691, -4.251519, -5.832319,
-2.832691, -4.251519, 5.322206,
-2.832691, 3.442648, -5.832319,
-2.832691, 3.442648, 5.322206,
-2.832691, -4.251519, -5.832319,
3.106313, -4.251519, -5.832319,
-2.832691, -4.251519, 5.322206,
3.106313, -4.251519, 5.322206,
-2.832691, 3.442648, -5.832319,
3.106313, 3.442648, -5.832319,
-2.832691, 3.442648, 5.322206,
3.106313, 3.442648, 5.322206,
3.106313, -4.251519, -5.832319,
3.106313, 3.442648, -5.832319,
3.106313, -4.251519, 5.322206,
3.106313, 3.442648, 5.322206,
3.106313, -4.251519, -5.832319,
3.106313, -4.251519, 5.322206,
3.106313, 3.442648, -5.832319,
3.106313, 3.442648, 5.322206
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
var radius = 7.900304;
var distance = 35.14935;
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
mvMatrix.translate( -0.136811, 0.4044352, 0.2550561 );
mvMatrix.scale( 1.438282, 1.110187, 0.7657846 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14935);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


