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
-3.15517, -1.242456, -3.262197, 1, 0, 0, 1,
-2.902071, -0.7367327, -1.239224, 1, 0.007843138, 0, 1,
-2.859221, -0.5892768, -2.602393, 1, 0.01176471, 0, 1,
-2.717164, -0.2140811, -1.290909, 1, 0.01960784, 0, 1,
-2.497608, -1.904255, -3.035213, 1, 0.02352941, 0, 1,
-2.473216, 0.2409355, -1.37277, 1, 0.03137255, 0, 1,
-2.429485, 0.1782721, -2.862579, 1, 0.03529412, 0, 1,
-2.370307, -0.8477742, -0.8163306, 1, 0.04313726, 0, 1,
-2.277341, -1.656379, -2.688892, 1, 0.04705882, 0, 1,
-2.247142, 1.499357, -1.957801, 1, 0.05490196, 0, 1,
-2.218452, -1.239005, -2.125495, 1, 0.05882353, 0, 1,
-2.208889, -0.5250437, -1.979472, 1, 0.06666667, 0, 1,
-2.192228, -0.4273967, -1.89727, 1, 0.07058824, 0, 1,
-2.136496, 2.268792, 0.5192343, 1, 0.07843138, 0, 1,
-2.131772, -0.7905183, 0.1746973, 1, 0.08235294, 0, 1,
-2.106314, 0.1881626, -0.8532786, 1, 0.09019608, 0, 1,
-2.093317, 0.4047277, -2.575779, 1, 0.09411765, 0, 1,
-2.041612, -2.494958, -2.419875, 1, 0.1019608, 0, 1,
-2.016936, -0.2858781, -0.6351133, 1, 0.1098039, 0, 1,
-2.0065, -1.215786, -2.96911, 1, 0.1137255, 0, 1,
-1.982095, 0.9308012, -1.552125, 1, 0.1215686, 0, 1,
-1.922051, 1.671357, -2.515272, 1, 0.1254902, 0, 1,
-1.919994, 1.596237, -1.706666, 1, 0.1333333, 0, 1,
-1.899637, -0.8341492, 0.5421097, 1, 0.1372549, 0, 1,
-1.890562, -0.6886017, -2.265567, 1, 0.145098, 0, 1,
-1.875267, -0.1032902, -2.166248, 1, 0.1490196, 0, 1,
-1.865063, -1.166773, -2.746165, 1, 0.1568628, 0, 1,
-1.862414, -1.43876, 0.3997437, 1, 0.1607843, 0, 1,
-1.845406, 0.4099811, -1.252573, 1, 0.1686275, 0, 1,
-1.787723, -0.7239423, -1.301738, 1, 0.172549, 0, 1,
-1.787412, -0.5681528, -1.810234, 1, 0.1803922, 0, 1,
-1.786533, -0.4375018, -2.966996, 1, 0.1843137, 0, 1,
-1.776973, -1.352522, -2.19412, 1, 0.1921569, 0, 1,
-1.764385, 1.190199, -0.1541479, 1, 0.1960784, 0, 1,
-1.713837, -1.40697, -2.812442, 1, 0.2039216, 0, 1,
-1.71234, -0.5999359, -1.899152, 1, 0.2117647, 0, 1,
-1.69804, -1.402392, 0.4188224, 1, 0.2156863, 0, 1,
-1.689022, -0.7494504, -1.311888, 1, 0.2235294, 0, 1,
-1.67582, 0.406435, -1.763368, 1, 0.227451, 0, 1,
-1.673679, 0.1633899, -2.261945, 1, 0.2352941, 0, 1,
-1.666818, -0.510879, -0.7809268, 1, 0.2392157, 0, 1,
-1.659599, -0.9978886, -1.71129, 1, 0.2470588, 0, 1,
-1.640734, -1.3692, -3.646315, 1, 0.2509804, 0, 1,
-1.635911, 0.002394508, -0.7714913, 1, 0.2588235, 0, 1,
-1.624493, 0.1927753, -2.236257, 1, 0.2627451, 0, 1,
-1.624197, -0.7677534, -1.454401, 1, 0.2705882, 0, 1,
-1.615656, 0.01938274, -2.368746, 1, 0.2745098, 0, 1,
-1.606411, -1.94147, -2.105163, 1, 0.282353, 0, 1,
-1.602694, 0.8287737, -0.5144833, 1, 0.2862745, 0, 1,
-1.595896, -0.9999354, -3.818064, 1, 0.2941177, 0, 1,
-1.591379, -0.1833459, -3.461944, 1, 0.3019608, 0, 1,
-1.579275, 0.5222117, -0.7036857, 1, 0.3058824, 0, 1,
-1.57911, 0.200624, 0.5247669, 1, 0.3137255, 0, 1,
-1.566262, -0.2271772, -0.6890536, 1, 0.3176471, 0, 1,
-1.564962, -0.02290057, -1.520867, 1, 0.3254902, 0, 1,
-1.557575, 0.1373471, -2.455347, 1, 0.3294118, 0, 1,
-1.556605, 0.9076604, -1.740744, 1, 0.3372549, 0, 1,
-1.556114, 0.181527, -0.3579872, 1, 0.3411765, 0, 1,
-1.555498, -1.863791, -2.894786, 1, 0.3490196, 0, 1,
-1.54779, 0.8268694, -1.249911, 1, 0.3529412, 0, 1,
-1.540303, -0.5076184, -0.6436007, 1, 0.3607843, 0, 1,
-1.539509, 1.355662, -1.64551, 1, 0.3647059, 0, 1,
-1.517589, -0.3590754, -2.271743, 1, 0.372549, 0, 1,
-1.506383, 0.1915935, -0.3465071, 1, 0.3764706, 0, 1,
-1.502106, 0.74103, -1.530885, 1, 0.3843137, 0, 1,
-1.499998, 1.793061, -0.3004893, 1, 0.3882353, 0, 1,
-1.482686, -0.271294, -1.823563, 1, 0.3960784, 0, 1,
-1.477452, -0.3864738, -1.160404, 1, 0.4039216, 0, 1,
-1.475723, -0.2348927, -0.7938283, 1, 0.4078431, 0, 1,
-1.469783, 1.362948, -3.419405, 1, 0.4156863, 0, 1,
-1.469429, 0.4310176, -2.224586, 1, 0.4196078, 0, 1,
-1.466436, -0.844565, -3.073041, 1, 0.427451, 0, 1,
-1.461751, -1.089472, -1.230215, 1, 0.4313726, 0, 1,
-1.46094, 0.3494141, -0.49768, 1, 0.4392157, 0, 1,
-1.460554, 0.6637737, -1.648811, 1, 0.4431373, 0, 1,
-1.459396, -0.08313874, -2.213178, 1, 0.4509804, 0, 1,
-1.439107, 2.149405, 0.9120196, 1, 0.454902, 0, 1,
-1.436847, 0.2726938, 0.3269691, 1, 0.4627451, 0, 1,
-1.427263, 2.2108, 0.6068124, 1, 0.4666667, 0, 1,
-1.425996, 0.6473541, -1.297969, 1, 0.4745098, 0, 1,
-1.41882, 1.257071, 1.023807, 1, 0.4784314, 0, 1,
-1.404739, 0.03902615, -1.120616, 1, 0.4862745, 0, 1,
-1.386075, -0.7404349, -2.244208, 1, 0.4901961, 0, 1,
-1.381704, -2.156183, -3.309819, 1, 0.4980392, 0, 1,
-1.373543, 0.6002735, -0.3632567, 1, 0.5058824, 0, 1,
-1.363208, -0.7178645, -1.972201, 1, 0.509804, 0, 1,
-1.361169, -1.680135, -1.082384, 1, 0.5176471, 0, 1,
-1.355608, -0.1591907, -1.020213, 1, 0.5215687, 0, 1,
-1.354764, -0.2551894, -2.386911, 1, 0.5294118, 0, 1,
-1.346675, 1.902757, -1.247379, 1, 0.5333334, 0, 1,
-1.339544, -1.007928, -2.829216, 1, 0.5411765, 0, 1,
-1.336763, 1.562773, -1.087946, 1, 0.5450981, 0, 1,
-1.333619, -0.5255858, -2.308288, 1, 0.5529412, 0, 1,
-1.33087, -0.2049361, -2.299366, 1, 0.5568628, 0, 1,
-1.330381, -1.620819, -3.902359, 1, 0.5647059, 0, 1,
-1.319414, -0.7228321, -2.095855, 1, 0.5686275, 0, 1,
-1.317188, 0.9761036, -0.7003356, 1, 0.5764706, 0, 1,
-1.316348, -0.5875984, -1.469154, 1, 0.5803922, 0, 1,
-1.311394, -0.04865274, -2.324606, 1, 0.5882353, 0, 1,
-1.309299, -0.8671787, -3.218466, 1, 0.5921569, 0, 1,
-1.308282, 0.6873578, -0.7002021, 1, 0.6, 0, 1,
-1.267481, -0.2911164, -3.896823, 1, 0.6078432, 0, 1,
-1.264213, -1.055516, -2.008542, 1, 0.6117647, 0, 1,
-1.256508, -0.584566, 0.1066752, 1, 0.6196079, 0, 1,
-1.252715, 1.493193, -0.345647, 1, 0.6235294, 0, 1,
-1.251969, -0.5743449, -1.852771, 1, 0.6313726, 0, 1,
-1.251269, 0.5451581, -0.9849845, 1, 0.6352941, 0, 1,
-1.24858, 0.2678979, -0.8850746, 1, 0.6431373, 0, 1,
-1.246424, 0.9846779, 0.629756, 1, 0.6470588, 0, 1,
-1.244668, -0.8397045, -1.645797, 1, 0.654902, 0, 1,
-1.238964, 1.173163, 0.1187113, 1, 0.6588235, 0, 1,
-1.227108, 3.507153, -0.3786993, 1, 0.6666667, 0, 1,
-1.224119, 1.495824, -0.945116, 1, 0.6705883, 0, 1,
-1.222713, -0.08216728, -1.194589, 1, 0.6784314, 0, 1,
-1.213089, -1.285692, -3.794411, 1, 0.682353, 0, 1,
-1.21183, -0.4390402, -2.047816, 1, 0.6901961, 0, 1,
-1.20787, 1.087027, -1.486675, 1, 0.6941177, 0, 1,
-1.206754, 1.133129, 0.4366019, 1, 0.7019608, 0, 1,
-1.20402, -0.3268855, -2.476802, 1, 0.7098039, 0, 1,
-1.201729, 0.8808032, -0.6714926, 1, 0.7137255, 0, 1,
-1.18814, -2.034577, -2.406929, 1, 0.7215686, 0, 1,
-1.182221, 1.501051, -0.6325607, 1, 0.7254902, 0, 1,
-1.171156, -0.7358226, -0.5602105, 1, 0.7333333, 0, 1,
-1.167465, -0.6156125, -2.565674, 1, 0.7372549, 0, 1,
-1.146065, -0.4425828, -2.479842, 1, 0.7450981, 0, 1,
-1.135055, 0.708468, -0.1513404, 1, 0.7490196, 0, 1,
-1.133187, -0.4337425, -1.679194, 1, 0.7568628, 0, 1,
-1.126241, -1.184258, -1.610914, 1, 0.7607843, 0, 1,
-1.118302, 1.002764, -0.466406, 1, 0.7686275, 0, 1,
-1.102474, 2.247967, -0.97958, 1, 0.772549, 0, 1,
-1.09918, 0.5845307, -0.7992074, 1, 0.7803922, 0, 1,
-1.091683, 1.283393, -0.1127649, 1, 0.7843137, 0, 1,
-1.086323, 0.5686452, -2.412905, 1, 0.7921569, 0, 1,
-1.084043, -1.318928, -2.679452, 1, 0.7960784, 0, 1,
-1.080891, 0.8236212, -0.7046543, 1, 0.8039216, 0, 1,
-1.075804, 0.6643525, -0.3132377, 1, 0.8117647, 0, 1,
-1.070516, -0.725507, -1.713985, 1, 0.8156863, 0, 1,
-1.069643, -0.5671813, -3.656576, 1, 0.8235294, 0, 1,
-1.056921, 0.9401869, -0.5702333, 1, 0.827451, 0, 1,
-1.049893, 0.4826783, -2.256281, 1, 0.8352941, 0, 1,
-1.036951, 1.129068, -0.6852133, 1, 0.8392157, 0, 1,
-1.026953, -2.32023, -4.029285, 1, 0.8470588, 0, 1,
-1.026157, 1.629583, -1.104801, 1, 0.8509804, 0, 1,
-1.018928, -0.06403985, -2.103967, 1, 0.8588235, 0, 1,
-1.009, -1.345714, -2.615976, 1, 0.8627451, 0, 1,
-1.007297, -0.05575955, 0.8792482, 1, 0.8705882, 0, 1,
-0.9989445, -0.1119543, -1.680327, 1, 0.8745098, 0, 1,
-0.9955416, 0.4766114, -0.1853518, 1, 0.8823529, 0, 1,
-0.9947371, 0.2901118, -3.3051, 1, 0.8862745, 0, 1,
-0.9942831, -1.453663, -2.043797, 1, 0.8941177, 0, 1,
-0.9924266, -0.3839896, -1.214388, 1, 0.8980392, 0, 1,
-0.9840732, 0.7249848, -1.635336, 1, 0.9058824, 0, 1,
-0.984027, -1.53892, -1.83992, 1, 0.9137255, 0, 1,
-0.9831811, 0.003161774, -1.531284, 1, 0.9176471, 0, 1,
-0.9679913, -1.077163, -3.01152, 1, 0.9254902, 0, 1,
-0.9594609, -0.2484463, -2.201291, 1, 0.9294118, 0, 1,
-0.9587184, -0.1011166, -3.303499, 1, 0.9372549, 0, 1,
-0.9557125, 0.5208454, -2.559388, 1, 0.9411765, 0, 1,
-0.9541578, 0.3387939, -1.272065, 1, 0.9490196, 0, 1,
-0.9541482, -1.393035, -1.197964, 1, 0.9529412, 0, 1,
-0.952342, -1.173151, -2.283386, 1, 0.9607843, 0, 1,
-0.9482565, -1.286583, -2.451969, 1, 0.9647059, 0, 1,
-0.9450015, 1.217262, 0.9698785, 1, 0.972549, 0, 1,
-0.9435751, 1.056675, -0.9156746, 1, 0.9764706, 0, 1,
-0.9377006, 1.175969, -1.406669, 1, 0.9843137, 0, 1,
-0.9349886, 0.9110546, -2.867792, 1, 0.9882353, 0, 1,
-0.9270456, 0.7363566, 0.3126276, 1, 0.9960784, 0, 1,
-0.9256844, 2.021668, -1.836407, 0.9960784, 1, 0, 1,
-0.9255554, -0.6916981, -1.433548, 0.9921569, 1, 0, 1,
-0.9254518, -0.5384629, -2.3249, 0.9843137, 1, 0, 1,
-0.9228197, 0.01833978, -1.704744, 0.9803922, 1, 0, 1,
-0.9227431, -0.4164785, -1.950258, 0.972549, 1, 0, 1,
-0.9225531, 0.2164028, -1.933753, 0.9686275, 1, 0, 1,
-0.9196212, -0.1834217, -2.119275, 0.9607843, 1, 0, 1,
-0.9149853, 0.07678213, -1.727776, 0.9568627, 1, 0, 1,
-0.9084319, 0.4854068, -1.138651, 0.9490196, 1, 0, 1,
-0.9066218, 0.2497827, -1.676714, 0.945098, 1, 0, 1,
-0.9056503, -0.9985449, -1.773485, 0.9372549, 1, 0, 1,
-0.9045073, 0.03408957, -0.148011, 0.9333333, 1, 0, 1,
-0.9010365, 0.7571564, -2.24163, 0.9254902, 1, 0, 1,
-0.8952149, -1.378314, -2.73535, 0.9215686, 1, 0, 1,
-0.8933063, -2.034816, -3.526071, 0.9137255, 1, 0, 1,
-0.8856645, 1.685329, -1.512356, 0.9098039, 1, 0, 1,
-0.8837811, 0.1811065, -1.436679, 0.9019608, 1, 0, 1,
-0.875608, -0.8586199, -0.0732253, 0.8941177, 1, 0, 1,
-0.8731663, -0.5176942, -1.164057, 0.8901961, 1, 0, 1,
-0.873034, -0.8440739, -2.973218, 0.8823529, 1, 0, 1,
-0.8678137, -0.9031802, -2.981709, 0.8784314, 1, 0, 1,
-0.8575152, 0.9399957, 0.5343202, 0.8705882, 1, 0, 1,
-0.8468779, -0.8485161, -2.155789, 0.8666667, 1, 0, 1,
-0.8437952, -1.409152, -3.634621, 0.8588235, 1, 0, 1,
-0.8383163, 1.009806, -2.599462, 0.854902, 1, 0, 1,
-0.8374702, -1.619364, -2.890402, 0.8470588, 1, 0, 1,
-0.8366812, -0.6383945, -3.237981, 0.8431373, 1, 0, 1,
-0.8356446, 0.1915096, 0.01766866, 0.8352941, 1, 0, 1,
-0.8338683, -0.3347003, -2.205959, 0.8313726, 1, 0, 1,
-0.8330084, 0.4379247, -0.7989265, 0.8235294, 1, 0, 1,
-0.8297749, -1.008765, -3.728517, 0.8196079, 1, 0, 1,
-0.8267343, -0.488591, -1.959691, 0.8117647, 1, 0, 1,
-0.8098798, -0.0147555, -1.793934, 0.8078431, 1, 0, 1,
-0.8059217, -2.020791, -3.291267, 0.8, 1, 0, 1,
-0.8054681, -0.8745456, -3.350346, 0.7921569, 1, 0, 1,
-0.7980345, 0.9427566, -0.4127028, 0.7882353, 1, 0, 1,
-0.7934781, 0.1536043, -1.659738, 0.7803922, 1, 0, 1,
-0.7816721, -0.2573712, -1.752473, 0.7764706, 1, 0, 1,
-0.7776204, -0.5800766, -1.651996, 0.7686275, 1, 0, 1,
-0.7677087, 1.397616, 1.981449, 0.7647059, 1, 0, 1,
-0.7676455, -0.6654584, -2.714618, 0.7568628, 1, 0, 1,
-0.76668, -0.2127902, -1.100192, 0.7529412, 1, 0, 1,
-0.7623223, 0.3609134, -0.5481292, 0.7450981, 1, 0, 1,
-0.7615871, 1.184796, -0.3011928, 0.7411765, 1, 0, 1,
-0.7611412, -0.2591152, -0.9208195, 0.7333333, 1, 0, 1,
-0.753249, 0.2997873, -0.5032711, 0.7294118, 1, 0, 1,
-0.7510542, 0.3728337, -2.221113, 0.7215686, 1, 0, 1,
-0.7447393, -1.03584, -3.68343, 0.7176471, 1, 0, 1,
-0.7392437, 0.2623549, -0.8123202, 0.7098039, 1, 0, 1,
-0.7305205, -0.2448486, -1.56948, 0.7058824, 1, 0, 1,
-0.7292924, -0.7540466, -3.229717, 0.6980392, 1, 0, 1,
-0.7160155, -1.053226, -3.107181, 0.6901961, 1, 0, 1,
-0.7029412, -1.737418, -2.22372, 0.6862745, 1, 0, 1,
-0.6901179, 0.4104128, -0.1807604, 0.6784314, 1, 0, 1,
-0.6877449, -0.2204856, -2.127553, 0.6745098, 1, 0, 1,
-0.6751181, 1.05363, -2.266807, 0.6666667, 1, 0, 1,
-0.6667485, 0.01283533, -2.003609, 0.6627451, 1, 0, 1,
-0.6666353, -0.2828028, -0.1644982, 0.654902, 1, 0, 1,
-0.6637599, -0.8128204, -1.598894, 0.6509804, 1, 0, 1,
-0.6600888, 0.1024656, -1.757754, 0.6431373, 1, 0, 1,
-0.6581183, -0.8067832, -1.353402, 0.6392157, 1, 0, 1,
-0.6576992, 0.2644016, -1.074088, 0.6313726, 1, 0, 1,
-0.6471384, -1.254413, -2.403447, 0.627451, 1, 0, 1,
-0.6434366, 0.3990704, 0.06816148, 0.6196079, 1, 0, 1,
-0.6407369, 0.2012391, -2.943758, 0.6156863, 1, 0, 1,
-0.6382323, 0.3236387, -2.799567, 0.6078432, 1, 0, 1,
-0.6323284, -0.5659069, -2.629808, 0.6039216, 1, 0, 1,
-0.6242753, -0.9248343, -2.217076, 0.5960785, 1, 0, 1,
-0.6235639, -1.224879, -1.871365, 0.5882353, 1, 0, 1,
-0.6207281, -1.748861, -1.481159, 0.5843138, 1, 0, 1,
-0.6202372, -1.093235, -2.756279, 0.5764706, 1, 0, 1,
-0.6201373, 0.629918, 0.5374709, 0.572549, 1, 0, 1,
-0.6186613, -0.2895676, -2.724127, 0.5647059, 1, 0, 1,
-0.6121331, -1.235865, -1.578615, 0.5607843, 1, 0, 1,
-0.6047344, 1.136449, 0.3596102, 0.5529412, 1, 0, 1,
-0.6037762, 0.8341529, -1.076306, 0.5490196, 1, 0, 1,
-0.6009778, -0.284157, -0.9059772, 0.5411765, 1, 0, 1,
-0.5895815, 1.349608, -1.925964, 0.5372549, 1, 0, 1,
-0.5857217, -2.504248, -2.227027, 0.5294118, 1, 0, 1,
-0.5807805, -0.1653471, -1.399028, 0.5254902, 1, 0, 1,
-0.5762281, -0.2824647, -2.255161, 0.5176471, 1, 0, 1,
-0.5729222, 1.603841, -0.9933039, 0.5137255, 1, 0, 1,
-0.5696526, -2.418259, -2.573412, 0.5058824, 1, 0, 1,
-0.5688961, 0.9972704, 0.2527896, 0.5019608, 1, 0, 1,
-0.5637664, -1.105756, -4.394937, 0.4941176, 1, 0, 1,
-0.5604824, -0.5894756, -2.132093, 0.4862745, 1, 0, 1,
-0.5591057, 1.90599, 0.008967701, 0.4823529, 1, 0, 1,
-0.5564836, -1.219028, -2.090582, 0.4745098, 1, 0, 1,
-0.5556094, 0.1234329, 0.5310568, 0.4705882, 1, 0, 1,
-0.5554709, 1.0832, -0.0996138, 0.4627451, 1, 0, 1,
-0.5546651, 1.198833, -0.1608197, 0.4588235, 1, 0, 1,
-0.5534599, 0.6984148, -0.06694593, 0.4509804, 1, 0, 1,
-0.5504898, 0.917839, 1.346464, 0.4470588, 1, 0, 1,
-0.5490782, -0.0290434, -1.92591, 0.4392157, 1, 0, 1,
-0.5464343, 0.854959, -0.8872375, 0.4352941, 1, 0, 1,
-0.5445251, -0.9270051, -2.549939, 0.427451, 1, 0, 1,
-0.5420058, -0.6256501, -2.50846, 0.4235294, 1, 0, 1,
-0.5390115, 0.7633858, -1.557566, 0.4156863, 1, 0, 1,
-0.5379583, -0.2217991, -3.111616, 0.4117647, 1, 0, 1,
-0.5373083, 0.4478431, -0.2061461, 0.4039216, 1, 0, 1,
-0.535859, -0.2271951, -1.833579, 0.3960784, 1, 0, 1,
-0.5343854, 1.360055, -0.6333427, 0.3921569, 1, 0, 1,
-0.5340163, 0.2436577, 0.5521673, 0.3843137, 1, 0, 1,
-0.5323707, -0.6753011, -3.458004, 0.3803922, 1, 0, 1,
-0.53235, -1.388922, -3.623917, 0.372549, 1, 0, 1,
-0.5256624, -0.3413039, -2.32416, 0.3686275, 1, 0, 1,
-0.5209066, 0.5504051, -1.036865, 0.3607843, 1, 0, 1,
-0.5204027, 0.7502754, -0.09765998, 0.3568628, 1, 0, 1,
-0.5184149, 0.9231212, 1.330939, 0.3490196, 1, 0, 1,
-0.5087069, -0.5589204, -2.022463, 0.345098, 1, 0, 1,
-0.5023125, 0.1834619, -1.05872, 0.3372549, 1, 0, 1,
-0.5002523, 0.9378594, 0.02427741, 0.3333333, 1, 0, 1,
-0.4937197, -0.1012326, -2.452727, 0.3254902, 1, 0, 1,
-0.4936508, 0.1546673, -0.118689, 0.3215686, 1, 0, 1,
-0.4936276, 0.3548696, -1.198555, 0.3137255, 1, 0, 1,
-0.4877928, -0.3459299, -0.6496053, 0.3098039, 1, 0, 1,
-0.4873694, 0.264091, -0.910188, 0.3019608, 1, 0, 1,
-0.4867991, 1.138918, -0.5385842, 0.2941177, 1, 0, 1,
-0.486524, -2.802752, -3.640509, 0.2901961, 1, 0, 1,
-0.4860781, 0.7275078, 0.9458348, 0.282353, 1, 0, 1,
-0.4856502, -1.625173, -4.17843, 0.2784314, 1, 0, 1,
-0.4808417, -2.052958, -1.890258, 0.2705882, 1, 0, 1,
-0.4803978, 0.4561726, -0.3298743, 0.2666667, 1, 0, 1,
-0.4757978, 1.029505, 0.9488183, 0.2588235, 1, 0, 1,
-0.4657733, -0.6101608, -1.209472, 0.254902, 1, 0, 1,
-0.4592408, 1.034989, -0.9043889, 0.2470588, 1, 0, 1,
-0.4496578, 1.260033, -1.298822, 0.2431373, 1, 0, 1,
-0.4479738, 0.6035155, -0.397134, 0.2352941, 1, 0, 1,
-0.4467471, 1.386362, -1.22946, 0.2313726, 1, 0, 1,
-0.4416108, 0.3501954, -1.342334, 0.2235294, 1, 0, 1,
-0.4414797, -0.5763736, -2.920971, 0.2196078, 1, 0, 1,
-0.4382356, 1.524856, -1.226809, 0.2117647, 1, 0, 1,
-0.4380327, -0.9458991, -1.978215, 0.2078431, 1, 0, 1,
-0.4343573, -0.4460843, -2.054507, 0.2, 1, 0, 1,
-0.4299989, -0.647513, -3.209497, 0.1921569, 1, 0, 1,
-0.4292611, 2.070509, 0.4119717, 0.1882353, 1, 0, 1,
-0.4255496, -1.018642, -4.400456, 0.1803922, 1, 0, 1,
-0.4241789, -1.157818, -4.724495, 0.1764706, 1, 0, 1,
-0.4201847, -1.109679, -2.91163, 0.1686275, 1, 0, 1,
-0.41974, -0.2639763, -1.34751, 0.1647059, 1, 0, 1,
-0.4175051, 2.287613, -1.090888, 0.1568628, 1, 0, 1,
-0.416596, -0.6343191, -2.473286, 0.1529412, 1, 0, 1,
-0.4164359, -0.1190539, -1.322517, 0.145098, 1, 0, 1,
-0.4150198, -0.4033063, -0.5010683, 0.1411765, 1, 0, 1,
-0.4148681, 0.09709764, -1.904212, 0.1333333, 1, 0, 1,
-0.4133538, -1.58168, -2.359665, 0.1294118, 1, 0, 1,
-0.4056921, -1.002655, -4.626637, 0.1215686, 1, 0, 1,
-0.4030559, 1.697102, 0.1137692, 0.1176471, 1, 0, 1,
-0.4011991, -1.440705, -1.991563, 0.1098039, 1, 0, 1,
-0.4002754, 0.2893477, -0.7319432, 0.1058824, 1, 0, 1,
-0.3986858, 0.6426855, -0.7702288, 0.09803922, 1, 0, 1,
-0.393297, 0.966741, 0.02186982, 0.09019608, 1, 0, 1,
-0.3927197, -0.4281728, -0.6447607, 0.08627451, 1, 0, 1,
-0.3919839, -0.08215712, -2.546372, 0.07843138, 1, 0, 1,
-0.3910702, 0.7073573, 1.345855, 0.07450981, 1, 0, 1,
-0.3898499, -1.360567, -3.390736, 0.06666667, 1, 0, 1,
-0.3866653, -0.6203767, -2.642251, 0.0627451, 1, 0, 1,
-0.3828048, 1.94577, -0.09681081, 0.05490196, 1, 0, 1,
-0.3788718, 0.6977358, -1.804729, 0.05098039, 1, 0, 1,
-0.3776154, 0.3956116, -0.946937, 0.04313726, 1, 0, 1,
-0.3773774, -0.1161001, -1.458087, 0.03921569, 1, 0, 1,
-0.3752207, 0.9840634, 0.3760263, 0.03137255, 1, 0, 1,
-0.371796, -0.3373258, -1.940953, 0.02745098, 1, 0, 1,
-0.3698345, -0.4562617, -1.466239, 0.01960784, 1, 0, 1,
-0.3695063, 0.7345297, -1.970955, 0.01568628, 1, 0, 1,
-0.3659665, 1.486977, 0.3258644, 0.007843138, 1, 0, 1,
-0.3638721, -0.5872927, -2.571793, 0.003921569, 1, 0, 1,
-0.3611166, 0.204384, -0.5891669, 0, 1, 0.003921569, 1,
-0.3605922, 0.4408888, -1.634412, 0, 1, 0.01176471, 1,
-0.3596145, 1.08547, -1.900954, 0, 1, 0.01568628, 1,
-0.3580881, 0.8690766, -0.2410835, 0, 1, 0.02352941, 1,
-0.3554368, 1.141026, 0.01838415, 0, 1, 0.02745098, 1,
-0.3528491, 0.2510874, -0.9333333, 0, 1, 0.03529412, 1,
-0.3436055, 1.563965, 1.271066, 0, 1, 0.03921569, 1,
-0.3434398, -0.7975724, -4.518791, 0, 1, 0.04705882, 1,
-0.3427384, -0.2266749, -0.7140071, 0, 1, 0.05098039, 1,
-0.3417653, -1.08857, -2.888232, 0, 1, 0.05882353, 1,
-0.3385378, -0.07266081, -0.3307272, 0, 1, 0.0627451, 1,
-0.3381628, -0.4160618, -2.477414, 0, 1, 0.07058824, 1,
-0.3349177, -0.6616018, -1.28857, 0, 1, 0.07450981, 1,
-0.3344334, 2.225953, -1.114846, 0, 1, 0.08235294, 1,
-0.3312118, 0.6267214, -1.893007, 0, 1, 0.08627451, 1,
-0.3248528, -0.01121627, -1.362285, 0, 1, 0.09411765, 1,
-0.3235851, 0.3817743, -0.5910869, 0, 1, 0.1019608, 1,
-0.3205446, -0.3407243, -3.714467, 0, 1, 0.1058824, 1,
-0.3195542, 1.279881, -0.7856081, 0, 1, 0.1137255, 1,
-0.3153742, 0.8320245, 0.8782664, 0, 1, 0.1176471, 1,
-0.3151089, 1.342661, -0.4069327, 0, 1, 0.1254902, 1,
-0.3057018, 0.558483, -0.3715154, 0, 1, 0.1294118, 1,
-0.3020463, 0.286646, -1.887546, 0, 1, 0.1372549, 1,
-0.3012953, -0.9021717, -1.868309, 0, 1, 0.1411765, 1,
-0.2998626, 0.0856883, -3.093754, 0, 1, 0.1490196, 1,
-0.2987182, -1.136366, -2.107645, 0, 1, 0.1529412, 1,
-0.2972045, -0.2534848, -1.086774, 0, 1, 0.1607843, 1,
-0.2968991, -0.944892, -2.670008, 0, 1, 0.1647059, 1,
-0.2957199, 0.7016748, -1.269416, 0, 1, 0.172549, 1,
-0.2955036, -1.073152, -3.415505, 0, 1, 0.1764706, 1,
-0.2946146, -0.476387, -2.4959, 0, 1, 0.1843137, 1,
-0.292217, -1.052095, -2.785095, 0, 1, 0.1882353, 1,
-0.290522, 0.9618217, -0.3338758, 0, 1, 0.1960784, 1,
-0.2903342, 0.8511327, -0.3926808, 0, 1, 0.2039216, 1,
-0.2899649, -1.861134, -1.782517, 0, 1, 0.2078431, 1,
-0.2857522, -0.8074701, -2.608191, 0, 1, 0.2156863, 1,
-0.281261, 0.363441, -0.1881402, 0, 1, 0.2196078, 1,
-0.2810031, -1.090631, -4.288219, 0, 1, 0.227451, 1,
-0.2748721, 0.2257321, -0.7686896, 0, 1, 0.2313726, 1,
-0.2735824, 0.2181101, -1.601705, 0, 1, 0.2392157, 1,
-0.2735143, -0.3025061, -1.870178, 0, 1, 0.2431373, 1,
-0.2716744, 0.09827557, -0.6427344, 0, 1, 0.2509804, 1,
-0.2684222, -0.9360118, -3.10264, 0, 1, 0.254902, 1,
-0.2658819, -0.8154746, -2.127847, 0, 1, 0.2627451, 1,
-0.2655015, -0.5092275, -4.465782, 0, 1, 0.2666667, 1,
-0.2645587, -0.5868765, -2.43333, 0, 1, 0.2745098, 1,
-0.2634033, -0.03847424, -2.590982, 0, 1, 0.2784314, 1,
-0.2614377, -0.7357655, -3.392668, 0, 1, 0.2862745, 1,
-0.2596349, 2.098115, -0.9388782, 0, 1, 0.2901961, 1,
-0.2590968, 0.8225579, 1.542462, 0, 1, 0.2980392, 1,
-0.253173, -0.9107817, -3.101592, 0, 1, 0.3058824, 1,
-0.2517, -0.08644141, -2.896641, 0, 1, 0.3098039, 1,
-0.2508055, 0.5379968, -0.04256347, 0, 1, 0.3176471, 1,
-0.2493066, 0.3625822, -1.132272, 0, 1, 0.3215686, 1,
-0.2456634, -0.2122087, -3.872591, 0, 1, 0.3294118, 1,
-0.2449896, -2.577982, -4.54151, 0, 1, 0.3333333, 1,
-0.2430118, -0.7789161, -2.540455, 0, 1, 0.3411765, 1,
-0.2415954, 0.1306848, -0.2915672, 0, 1, 0.345098, 1,
-0.2381822, 0.0749292, 0.3479822, 0, 1, 0.3529412, 1,
-0.2355738, 1.18843, -0.9138207, 0, 1, 0.3568628, 1,
-0.235028, -0.04652669, -0.9655324, 0, 1, 0.3647059, 1,
-0.2310328, 0.2922063, -2.284118, 0, 1, 0.3686275, 1,
-0.2306136, -0.47389, -0.8385684, 0, 1, 0.3764706, 1,
-0.2300027, 0.7501424, 0.4733463, 0, 1, 0.3803922, 1,
-0.2275865, 0.4939541, -0.07053141, 0, 1, 0.3882353, 1,
-0.2253354, -0.5647539, -3.167734, 0, 1, 0.3921569, 1,
-0.223818, -1.549517, -3.795403, 0, 1, 0.4, 1,
-0.2197476, -0.1156982, -2.68464, 0, 1, 0.4078431, 1,
-0.2196215, 1.239047, -0.423407, 0, 1, 0.4117647, 1,
-0.2149276, 0.6356986, 1.11105, 0, 1, 0.4196078, 1,
-0.2125915, -0.8115191, -2.576553, 0, 1, 0.4235294, 1,
-0.2119112, -0.4795567, -3.772454, 0, 1, 0.4313726, 1,
-0.207382, 0.8076387, -0.9567194, 0, 1, 0.4352941, 1,
-0.2042038, -0.3603528, -2.06842, 0, 1, 0.4431373, 1,
-0.1951363, 0.3634561, -2.346396, 0, 1, 0.4470588, 1,
-0.1947319, -1.285532, -3.782938, 0, 1, 0.454902, 1,
-0.1929229, 0.8359569, 0.7973056, 0, 1, 0.4588235, 1,
-0.1928374, 0.7001857, -0.7366116, 0, 1, 0.4666667, 1,
-0.1922553, -0.6384725, -1.979354, 0, 1, 0.4705882, 1,
-0.190274, -1.265171, -2.826543, 0, 1, 0.4784314, 1,
-0.1867411, -1.425567, -2.562178, 0, 1, 0.4823529, 1,
-0.1866881, 0.2819113, -1.784325, 0, 1, 0.4901961, 1,
-0.186337, -0.4446329, -2.787929, 0, 1, 0.4941176, 1,
-0.1861145, -0.5610141, -1.166591, 0, 1, 0.5019608, 1,
-0.1854685, 0.03716948, -0.193437, 0, 1, 0.509804, 1,
-0.1841537, 0.7621714, 0.846054, 0, 1, 0.5137255, 1,
-0.1798373, -1.383113, -2.040763, 0, 1, 0.5215687, 1,
-0.1748631, -0.6705791, -1.59392, 0, 1, 0.5254902, 1,
-0.1711059, 0.9620836, 0.3786449, 0, 1, 0.5333334, 1,
-0.1697353, -1.729328, -1.851249, 0, 1, 0.5372549, 1,
-0.1670272, -1.713926, -3.20664, 0, 1, 0.5450981, 1,
-0.1657897, 1.549862, -0.1273792, 0, 1, 0.5490196, 1,
-0.1646695, 0.2832368, -0.9389064, 0, 1, 0.5568628, 1,
-0.1632013, 0.3759237, -0.2010654, 0, 1, 0.5607843, 1,
-0.1600009, -1.208774, -1.465504, 0, 1, 0.5686275, 1,
-0.1595171, -0.121491, -3.536155, 0, 1, 0.572549, 1,
-0.1569783, -0.18593, -1.609795, 0, 1, 0.5803922, 1,
-0.1562066, -1.360105, -3.427242, 0, 1, 0.5843138, 1,
-0.141564, -0.6183711, -4.014502, 0, 1, 0.5921569, 1,
-0.1404547, 0.3691093, 0.618509, 0, 1, 0.5960785, 1,
-0.1383582, 0.02898081, -1.682898, 0, 1, 0.6039216, 1,
-0.1372482, 1.118743, 1.461539, 0, 1, 0.6117647, 1,
-0.1360829, -1.021193, -1.813901, 0, 1, 0.6156863, 1,
-0.1313469, -0.9524469, -2.061636, 0, 1, 0.6235294, 1,
-0.1253856, -1.247214, -0.8201317, 0, 1, 0.627451, 1,
-0.1250449, 0.1819618, -0.5657864, 0, 1, 0.6352941, 1,
-0.1231237, -1.465641, -4.178624, 0, 1, 0.6392157, 1,
-0.1194842, -1.204728, -1.731212, 0, 1, 0.6470588, 1,
-0.1172475, -0.8305084, -3.637221, 0, 1, 0.6509804, 1,
-0.1137227, 0.04196236, -0.7518101, 0, 1, 0.6588235, 1,
-0.1122669, -0.381694, -4.96947, 0, 1, 0.6627451, 1,
-0.1119955, 0.07027732, 0.02269807, 0, 1, 0.6705883, 1,
-0.1091203, -1.134198, -3.837428, 0, 1, 0.6745098, 1,
-0.1085309, 0.3182575, -0.1161224, 0, 1, 0.682353, 1,
-0.1052696, 0.1795413, -0.4299612, 0, 1, 0.6862745, 1,
-0.1052613, 1.138571, 0.7352362, 0, 1, 0.6941177, 1,
-0.101996, 1.758924, -0.8112183, 0, 1, 0.7019608, 1,
-0.0984906, -1.756327, -2.582861, 0, 1, 0.7058824, 1,
-0.09201575, -0.206158, -2.725702, 0, 1, 0.7137255, 1,
-0.0891511, -0.08271847, -3.339201, 0, 1, 0.7176471, 1,
-0.08902647, -1.040025, -3.016811, 0, 1, 0.7254902, 1,
-0.08802748, 0.3165703, -0.005419692, 0, 1, 0.7294118, 1,
-0.08754174, -0.2349031, -4.084699, 0, 1, 0.7372549, 1,
-0.08742606, 1.058422, 0.6390805, 0, 1, 0.7411765, 1,
-0.08709865, 1.080602, 0.3156665, 0, 1, 0.7490196, 1,
-0.08500439, -0.2724188, -4.573649, 0, 1, 0.7529412, 1,
-0.08079094, -1.625086, -2.455124, 0, 1, 0.7607843, 1,
-0.07998987, -0.5349767, -2.76686, 0, 1, 0.7647059, 1,
-0.07944649, 0.07579178, -0.9541483, 0, 1, 0.772549, 1,
-0.07927141, -0.3437153, -2.180082, 0, 1, 0.7764706, 1,
-0.07917167, 0.6823268, 0.3343695, 0, 1, 0.7843137, 1,
-0.07693157, -0.05475718, -1.392531, 0, 1, 0.7882353, 1,
-0.07636882, 0.1807377, 0.7499215, 0, 1, 0.7960784, 1,
-0.07538544, -0.2349629, -2.746499, 0, 1, 0.8039216, 1,
-0.07108123, -0.4375556, -4.022863, 0, 1, 0.8078431, 1,
-0.06959869, 0.3812563, -0.7183259, 0, 1, 0.8156863, 1,
-0.06814686, 0.1162615, 0.4312142, 0, 1, 0.8196079, 1,
-0.06578182, -0.251622, -4.481327, 0, 1, 0.827451, 1,
-0.06219709, -1.072413, -3.757208, 0, 1, 0.8313726, 1,
-0.06189677, 0.9239464, 1.328364, 0, 1, 0.8392157, 1,
-0.05464192, 0.2166899, -1.519219, 0, 1, 0.8431373, 1,
-0.05386425, -2.816054, -3.645299, 0, 1, 0.8509804, 1,
-0.0525453, -0.5137619, -3.04967, 0, 1, 0.854902, 1,
-0.0520831, -0.8197241, -1.46063, 0, 1, 0.8627451, 1,
-0.05203192, -2.029532, -5.693639, 0, 1, 0.8666667, 1,
-0.05134797, 1.228794, 0.5793763, 0, 1, 0.8745098, 1,
-0.05130771, -1.324306, -3.513015, 0, 1, 0.8784314, 1,
-0.04995517, -0.323699, -3.111579, 0, 1, 0.8862745, 1,
-0.04045255, 1.229122, -0.3257391, 0, 1, 0.8901961, 1,
-0.03892345, -0.4224758, -1.920745, 0, 1, 0.8980392, 1,
-0.03434308, 0.004061578, -1.060456, 0, 1, 0.9058824, 1,
-0.03408931, 0.3625214, 0.5266077, 0, 1, 0.9098039, 1,
-0.03040976, 0.4294228, -0.2674707, 0, 1, 0.9176471, 1,
-0.02984953, 0.2513274, -0.4821095, 0, 1, 0.9215686, 1,
-0.02948684, 0.1629718, 0.8806366, 0, 1, 0.9294118, 1,
-0.02685747, 0.3765149, -0.5039886, 0, 1, 0.9333333, 1,
-0.02118188, 0.8557303, -0.4966296, 0, 1, 0.9411765, 1,
-0.0203326, 2.314444, -0.9742919, 0, 1, 0.945098, 1,
-0.01633848, -0.5569966, -2.851135, 0, 1, 0.9529412, 1,
-0.01111187, -0.2073574, -4.52647, 0, 1, 0.9568627, 1,
-0.01066129, -0.2156061, -3.220601, 0, 1, 0.9647059, 1,
-0.008161882, -0.7738739, -3.387833, 0, 1, 0.9686275, 1,
-0.00523981, -0.3403908, -3.639342, 0, 1, 0.9764706, 1,
-0.004055135, -0.5406669, -3.403953, 0, 1, 0.9803922, 1,
0.0006997401, -0.3942501, 1.376744, 0, 1, 0.9882353, 1,
0.001071547, 1.596985, 0.7087116, 0, 1, 0.9921569, 1,
0.008495811, -0.2205358, 1.918001, 0, 1, 1, 1,
0.009004757, -0.6153936, 2.19727, 0, 0.9921569, 1, 1,
0.01129742, 0.9926349, 1.23449, 0, 0.9882353, 1, 1,
0.01447124, -0.3135378, 3.368555, 0, 0.9803922, 1, 1,
0.01646987, -0.3372816, 3.355349, 0, 0.9764706, 1, 1,
0.02215013, 0.5412337, -1.016702, 0, 0.9686275, 1, 1,
0.02301412, -2.066443, 4.288644, 0, 0.9647059, 1, 1,
0.02527596, 1.177974, 0.2982776, 0, 0.9568627, 1, 1,
0.02542933, -0.7768953, 3.785183, 0, 0.9529412, 1, 1,
0.0257066, -0.1058434, 4.040017, 0, 0.945098, 1, 1,
0.02625016, -1.02918, 1.367581, 0, 0.9411765, 1, 1,
0.02675182, 0.7598813, 1.052721, 0, 0.9333333, 1, 1,
0.0309749, -0.4507596, 2.706135, 0, 0.9294118, 1, 1,
0.03166263, 0.8638729, 0.8471889, 0, 0.9215686, 1, 1,
0.03233772, -1.614673, 1.709789, 0, 0.9176471, 1, 1,
0.03313686, 0.02958955, 0.8564874, 0, 0.9098039, 1, 1,
0.0346865, -0.6821681, 5.136735, 0, 0.9058824, 1, 1,
0.03557433, 0.8277993, -1.063911, 0, 0.8980392, 1, 1,
0.03820023, -0.5297884, 5.829653, 0, 0.8901961, 1, 1,
0.03852131, -0.4643826, 4.166056, 0, 0.8862745, 1, 1,
0.03892222, -0.0947063, 3.505562, 0, 0.8784314, 1, 1,
0.04277105, 1.800379, 0.04245534, 0, 0.8745098, 1, 1,
0.04728613, -0.8340542, 5.819956, 0, 0.8666667, 1, 1,
0.04772475, 0.7250586, -1.587263, 0, 0.8627451, 1, 1,
0.04808822, -0.7906345, 2.607089, 0, 0.854902, 1, 1,
0.04809719, -0.03972588, 2.300253, 0, 0.8509804, 1, 1,
0.04870757, 0.1925763, 0.4876546, 0, 0.8431373, 1, 1,
0.04941816, -2.010895, 3.989365, 0, 0.8392157, 1, 1,
0.06166823, 0.3950104, -0.4252674, 0, 0.8313726, 1, 1,
0.06634099, 0.4533489, 0.04396563, 0, 0.827451, 1, 1,
0.06845473, 0.5388076, 1.125118, 0, 0.8196079, 1, 1,
0.07107921, -0.1937484, 2.809427, 0, 0.8156863, 1, 1,
0.07453749, -0.3574146, 2.165589, 0, 0.8078431, 1, 1,
0.07768589, -2.197546, 2.346104, 0, 0.8039216, 1, 1,
0.07822012, -1.30814, 4.001412, 0, 0.7960784, 1, 1,
0.07888556, 2.403703, 0.5929838, 0, 0.7882353, 1, 1,
0.08641528, 0.5439724, 0.7818259, 0, 0.7843137, 1, 1,
0.08701992, 1.672469, 0.9727974, 0, 0.7764706, 1, 1,
0.08886284, -2.691855, 2.957947, 0, 0.772549, 1, 1,
0.08968388, 0.8632573, 0.365122, 0, 0.7647059, 1, 1,
0.09160475, 1.926268, -0.700169, 0, 0.7607843, 1, 1,
0.09396233, -1.841785, 0.3593158, 0, 0.7529412, 1, 1,
0.09583676, 0.4151276, 1.097896, 0, 0.7490196, 1, 1,
0.09783298, -0.6354864, 2.684121, 0, 0.7411765, 1, 1,
0.09820414, -1.118994, 2.919583, 0, 0.7372549, 1, 1,
0.1005887, 0.2720939, -0.1156022, 0, 0.7294118, 1, 1,
0.1043855, -0.1816476, 2.81763, 0, 0.7254902, 1, 1,
0.105033, 0.06524015, 0.1314612, 0, 0.7176471, 1, 1,
0.1060123, -0.1723969, 2.832666, 0, 0.7137255, 1, 1,
0.1069775, 0.4152219, 0.678689, 0, 0.7058824, 1, 1,
0.1094594, 0.6111438, -0.1926233, 0, 0.6980392, 1, 1,
0.1136597, -1.093783, 3.603698, 0, 0.6941177, 1, 1,
0.1205693, 1.492302, 0.1168135, 0, 0.6862745, 1, 1,
0.1210452, -1.599558, 4.766644, 0, 0.682353, 1, 1,
0.1232599, -0.3975287, 3.176294, 0, 0.6745098, 1, 1,
0.1252125, 0.6246021, 0.9723929, 0, 0.6705883, 1, 1,
0.1308137, 1.164198, 0.8694862, 0, 0.6627451, 1, 1,
0.1339161, -0.5621993, 2.653602, 0, 0.6588235, 1, 1,
0.1343123, -0.105054, -0.2487404, 0, 0.6509804, 1, 1,
0.1350256, -0.3078091, 1.647841, 0, 0.6470588, 1, 1,
0.1379663, -1.347581, 3.011428, 0, 0.6392157, 1, 1,
0.1413718, -1.851833, 1.116709, 0, 0.6352941, 1, 1,
0.1417908, -0.8567137, 4.860149, 0, 0.627451, 1, 1,
0.1460067, 1.444674, 1.709151, 0, 0.6235294, 1, 1,
0.1481727, -0.2552935, 1.952429, 0, 0.6156863, 1, 1,
0.1579086, -0.1927855, 2.961294, 0, 0.6117647, 1, 1,
0.1603694, -0.552303, 2.68706, 0, 0.6039216, 1, 1,
0.1709796, 1.468478, 1.663216, 0, 0.5960785, 1, 1,
0.1714968, -0.2751558, 2.813644, 0, 0.5921569, 1, 1,
0.1718375, 0.8722187, -0.990383, 0, 0.5843138, 1, 1,
0.1745679, 0.7523456, -0.9063008, 0, 0.5803922, 1, 1,
0.174906, -0.1282008, 3.405417, 0, 0.572549, 1, 1,
0.1753105, 0.7682557, 0.5533311, 0, 0.5686275, 1, 1,
0.1816458, 0.2843427, 1.506843, 0, 0.5607843, 1, 1,
0.1818545, -1.071136, 4.23704, 0, 0.5568628, 1, 1,
0.1832674, -0.9088728, 0.1752871, 0, 0.5490196, 1, 1,
0.1834642, -1.553418, 2.224464, 0, 0.5450981, 1, 1,
0.1883953, 1.664416, -0.5129067, 0, 0.5372549, 1, 1,
0.1904816, -0.9420223, 2.409804, 0, 0.5333334, 1, 1,
0.1910903, 0.3132014, -0.5394596, 0, 0.5254902, 1, 1,
0.1936306, -0.0005366474, 1.407519, 0, 0.5215687, 1, 1,
0.1946398, 0.9587707, -0.07640018, 0, 0.5137255, 1, 1,
0.1964241, -0.5593141, 1.138107, 0, 0.509804, 1, 1,
0.1965524, 2.561173, 0.6579077, 0, 0.5019608, 1, 1,
0.1967439, 0.5135257, -0.7515243, 0, 0.4941176, 1, 1,
0.2003798, 0.972818, 0.6650328, 0, 0.4901961, 1, 1,
0.2060549, -0.8184968, 2.737994, 0, 0.4823529, 1, 1,
0.206282, 1.738996, 1.148824, 0, 0.4784314, 1, 1,
0.209718, 0.1759036, 0.1530216, 0, 0.4705882, 1, 1,
0.2098047, -0.252157, 3.486229, 0, 0.4666667, 1, 1,
0.2118332, -0.6431117, 1.313142, 0, 0.4588235, 1, 1,
0.2155979, -0.2185348, 2.066204, 0, 0.454902, 1, 1,
0.2179494, 0.5600079, 0.07801121, 0, 0.4470588, 1, 1,
0.2185851, -0.7120789, 1.566424, 0, 0.4431373, 1, 1,
0.2209493, 2.862621, 0.7331576, 0, 0.4352941, 1, 1,
0.2238382, -0.6851522, 2.421364, 0, 0.4313726, 1, 1,
0.2281734, 1.037902, 1.147037, 0, 0.4235294, 1, 1,
0.2317972, 0.6731576, 0.1596815, 0, 0.4196078, 1, 1,
0.2323044, -0.3663914, 2.031572, 0, 0.4117647, 1, 1,
0.2373152, 0.1355197, 0.945434, 0, 0.4078431, 1, 1,
0.2434226, -0.4034545, 2.138989, 0, 0.4, 1, 1,
0.244844, -0.4596311, 2.672733, 0, 0.3921569, 1, 1,
0.2482311, -1.628634, 2.762087, 0, 0.3882353, 1, 1,
0.2526483, 0.5126797, 0.6449697, 0, 0.3803922, 1, 1,
0.2537396, 0.7697682, -1.164204, 0, 0.3764706, 1, 1,
0.2543477, 0.418105, 0.9282686, 0, 0.3686275, 1, 1,
0.2544184, 0.1743421, 0.7765205, 0, 0.3647059, 1, 1,
0.256252, 2.052672, -0.4162631, 0, 0.3568628, 1, 1,
0.2571503, -1.419294, 2.109439, 0, 0.3529412, 1, 1,
0.2642639, 0.5349653, 1.910336, 0, 0.345098, 1, 1,
0.2657365, -0.5803668, 5.029302, 0, 0.3411765, 1, 1,
0.2696109, -0.1069249, 1.827912, 0, 0.3333333, 1, 1,
0.2703057, 0.2903025, 0.7343152, 0, 0.3294118, 1, 1,
0.2707129, -0.4590738, 4.098759, 0, 0.3215686, 1, 1,
0.27299, -0.3342684, 1.942576, 0, 0.3176471, 1, 1,
0.2746609, 0.7518552, 1.187212, 0, 0.3098039, 1, 1,
0.2759435, -0.8833393, 3.306789, 0, 0.3058824, 1, 1,
0.2808413, -0.1123202, 1.84011, 0, 0.2980392, 1, 1,
0.2816437, -0.5024785, 2.626688, 0, 0.2901961, 1, 1,
0.2852274, -1.093998, 2.62857, 0, 0.2862745, 1, 1,
0.2897858, -1.669713, 4.447189, 0, 0.2784314, 1, 1,
0.290534, 0.2996047, 0.7679424, 0, 0.2745098, 1, 1,
0.2913303, 1.524093, -0.1139724, 0, 0.2666667, 1, 1,
0.2947913, 0.6356153, 2.186394, 0, 0.2627451, 1, 1,
0.2955271, 0.06775549, 2.961477, 0, 0.254902, 1, 1,
0.305282, 0.1389959, 1.486973, 0, 0.2509804, 1, 1,
0.3059022, -0.7397798, 2.282567, 0, 0.2431373, 1, 1,
0.3062723, 0.01452638, 2.197588, 0, 0.2392157, 1, 1,
0.3070354, 0.4878629, 0.181999, 0, 0.2313726, 1, 1,
0.3121895, 1.590411, -0.1876469, 0, 0.227451, 1, 1,
0.3136736, -0.4151302, 4.844748, 0, 0.2196078, 1, 1,
0.3144128, -0.6900153, 3.08847, 0, 0.2156863, 1, 1,
0.3145116, 1.312951, 0.08621857, 0, 0.2078431, 1, 1,
0.3146926, 0.1947099, 1.658711, 0, 0.2039216, 1, 1,
0.3181891, 2.608119, 1.248667, 0, 0.1960784, 1, 1,
0.3189786, -0.8039309, 1.095458, 0, 0.1882353, 1, 1,
0.3191904, -1.144903, 2.453044, 0, 0.1843137, 1, 1,
0.3193775, 0.6423447, 0.9489583, 0, 0.1764706, 1, 1,
0.3219323, 0.5840749, 1.883383, 0, 0.172549, 1, 1,
0.3224927, 0.8008924, -0.6374539, 0, 0.1647059, 1, 1,
0.3242869, -0.1547823, 0.9251543, 0, 0.1607843, 1, 1,
0.3297502, 0.3320754, 1.055945, 0, 0.1529412, 1, 1,
0.3350168, 1.165945, -0.8205483, 0, 0.1490196, 1, 1,
0.3529574, 0.4881863, -1.17377, 0, 0.1411765, 1, 1,
0.3537433, -1.041859, 2.571706, 0, 0.1372549, 1, 1,
0.3554435, 1.007371, -0.008694079, 0, 0.1294118, 1, 1,
0.3617259, -0.5347877, 3.120228, 0, 0.1254902, 1, 1,
0.3630258, -0.6621271, 4.685664, 0, 0.1176471, 1, 1,
0.3637013, 0.231245, 0.4930957, 0, 0.1137255, 1, 1,
0.3710651, 0.3050616, 0.9598603, 0, 0.1058824, 1, 1,
0.3718086, 1.610686, 0.1484776, 0, 0.09803922, 1, 1,
0.3720501, -1.051843, 3.564485, 0, 0.09411765, 1, 1,
0.3734346, 1.961423, -0.5487548, 0, 0.08627451, 1, 1,
0.3738682, 0.6277763, 0.987175, 0, 0.08235294, 1, 1,
0.379899, 0.7930473, -0.7376799, 0, 0.07450981, 1, 1,
0.3822463, 0.2612367, 0.7780768, 0, 0.07058824, 1, 1,
0.3861012, -0.5577267, 1.786426, 0, 0.0627451, 1, 1,
0.3863542, 0.5766822, 1.169254, 0, 0.05882353, 1, 1,
0.3920207, -0.1144186, 0.6003841, 0, 0.05098039, 1, 1,
0.3930462, 0.5567216, 2.444721, 0, 0.04705882, 1, 1,
0.3944669, 0.09147163, -0.5374638, 0, 0.03921569, 1, 1,
0.3950691, -0.6695612, 2.974505, 0, 0.03529412, 1, 1,
0.3975387, -0.558415, 4.094254, 0, 0.02745098, 1, 1,
0.3981714, -2.084918, 2.903491, 0, 0.02352941, 1, 1,
0.4035319, 1.000503, -0.8632753, 0, 0.01568628, 1, 1,
0.4041429, 0.8819929, 0.6228609, 0, 0.01176471, 1, 1,
0.4080218, -1.006967, 1.988777, 0, 0.003921569, 1, 1,
0.4184127, -0.3044944, 2.040004, 0.003921569, 0, 1, 1,
0.4184152, 0.1981733, 1.16157, 0.007843138, 0, 1, 1,
0.4237342, 0.906114, 0.7700834, 0.01568628, 0, 1, 1,
0.4253868, 0.02450935, 2.499405, 0.01960784, 0, 1, 1,
0.4278823, 0.4152939, -1.33158, 0.02745098, 0, 1, 1,
0.431297, 0.08464286, 0.1535732, 0.03137255, 0, 1, 1,
0.4318361, -0.8335119, 2.954526, 0.03921569, 0, 1, 1,
0.4341702, 1.14599, 0.3222109, 0.04313726, 0, 1, 1,
0.4440434, 1.308906, -0.5924922, 0.05098039, 0, 1, 1,
0.4463182, 0.4300943, 1.699818, 0.05490196, 0, 1, 1,
0.4464304, 0.3985159, 1.48526, 0.0627451, 0, 1, 1,
0.4504597, 0.2457935, 2.349372, 0.06666667, 0, 1, 1,
0.451277, 0.1635371, 0.9413776, 0.07450981, 0, 1, 1,
0.464215, 1.491773, -0.1059414, 0.07843138, 0, 1, 1,
0.4733166, -0.0494268, 2.690443, 0.08627451, 0, 1, 1,
0.4737064, 0.7914649, 1.446377, 0.09019608, 0, 1, 1,
0.4766316, -0.6359333, 1.838103, 0.09803922, 0, 1, 1,
0.4789152, -0.2033791, 1.408259, 0.1058824, 0, 1, 1,
0.4795491, 0.1190097, 2.782434, 0.1098039, 0, 1, 1,
0.4801462, -0.1765081, 1.024207, 0.1176471, 0, 1, 1,
0.4811567, -1.678192, 2.086735, 0.1215686, 0, 1, 1,
0.482976, -0.08869123, 2.079506, 0.1294118, 0, 1, 1,
0.4843276, 0.4341906, 0.9854829, 0.1333333, 0, 1, 1,
0.4902346, -1.369194, 1.896731, 0.1411765, 0, 1, 1,
0.4958165, -1.438686, 1.823829, 0.145098, 0, 1, 1,
0.49591, 2.413454, 0.6617074, 0.1529412, 0, 1, 1,
0.5093521, 0.6422528, 1.708331, 0.1568628, 0, 1, 1,
0.5122082, -0.7547765, 4.823648, 0.1647059, 0, 1, 1,
0.5149783, 0.9281989, -0.7090374, 0.1686275, 0, 1, 1,
0.5171946, 2.756851, 0.5497107, 0.1764706, 0, 1, 1,
0.5204318, -0.111659, 2.523681, 0.1803922, 0, 1, 1,
0.5238348, 0.9787973, -0.01770425, 0.1882353, 0, 1, 1,
0.5243714, -0.2663482, 1.753191, 0.1921569, 0, 1, 1,
0.5359276, -0.4373014, 0.9239009, 0.2, 0, 1, 1,
0.5384118, 1.000573, 0.4095572, 0.2078431, 0, 1, 1,
0.5419804, 0.9281604, -1.727581, 0.2117647, 0, 1, 1,
0.5426583, 0.5218054, 0.6809583, 0.2196078, 0, 1, 1,
0.5429201, 0.1309361, 1.355373, 0.2235294, 0, 1, 1,
0.5448472, 0.9575062, 0.8433223, 0.2313726, 0, 1, 1,
0.5466463, -1.115543, 0.6414694, 0.2352941, 0, 1, 1,
0.5473412, 0.772119, 1.862413, 0.2431373, 0, 1, 1,
0.5504459, -0.8687851, 3.183841, 0.2470588, 0, 1, 1,
0.557822, 0.512022, 0.3415246, 0.254902, 0, 1, 1,
0.5594164, 0.0357479, -0.2601761, 0.2588235, 0, 1, 1,
0.562407, 0.1429415, 2.874823, 0.2666667, 0, 1, 1,
0.5644007, -0.1927233, 1.001808, 0.2705882, 0, 1, 1,
0.5674926, 0.9096394, 0.6612706, 0.2784314, 0, 1, 1,
0.5687291, 0.5494897, -0.4320637, 0.282353, 0, 1, 1,
0.5702007, -0.3598745, 2.426615, 0.2901961, 0, 1, 1,
0.5733454, -2.062032, 1.577436, 0.2941177, 0, 1, 1,
0.5818821, -0.5774921, 2.096692, 0.3019608, 0, 1, 1,
0.5859033, 0.9654886, 0.3503339, 0.3098039, 0, 1, 1,
0.5876502, -0.03789876, 1.87308, 0.3137255, 0, 1, 1,
0.5918908, -1.206722, -0.358781, 0.3215686, 0, 1, 1,
0.5980121, 0.5070896, 1.563401, 0.3254902, 0, 1, 1,
0.6083786, 1.599827, -0.6223034, 0.3333333, 0, 1, 1,
0.6169252, -0.07199036, 0.9267523, 0.3372549, 0, 1, 1,
0.6202757, -0.8464093, 1.032722, 0.345098, 0, 1, 1,
0.6283948, 0.7589449, -0.8000582, 0.3490196, 0, 1, 1,
0.6377404, -1.61458, 3.525475, 0.3568628, 0, 1, 1,
0.6414825, -0.7651803, 2.894651, 0.3607843, 0, 1, 1,
0.6480401, 1.287042, -0.1345022, 0.3686275, 0, 1, 1,
0.6481888, -1.530172, 3.807042, 0.372549, 0, 1, 1,
0.6527233, -0.3197485, 2.814054, 0.3803922, 0, 1, 1,
0.6534211, -1.874347, 3.300737, 0.3843137, 0, 1, 1,
0.6562403, 1.725142, 0.5665705, 0.3921569, 0, 1, 1,
0.65964, -1.105795, 2.425073, 0.3960784, 0, 1, 1,
0.6627045, 0.4811948, 2.30529, 0.4039216, 0, 1, 1,
0.6663614, -1.149456, 3.283556, 0.4117647, 0, 1, 1,
0.6669077, 0.123847, 0.9758529, 0.4156863, 0, 1, 1,
0.6708452, -0.9542221, 1.162307, 0.4235294, 0, 1, 1,
0.6712241, -1.116158, 2.099276, 0.427451, 0, 1, 1,
0.6752127, -1.84902, 3.940943, 0.4352941, 0, 1, 1,
0.6766178, -0.3206202, 1.585786, 0.4392157, 0, 1, 1,
0.6822782, -1.447337, 2.555761, 0.4470588, 0, 1, 1,
0.6826441, -1.441111, 2.32482, 0.4509804, 0, 1, 1,
0.6875083, -0.8312187, 1.624423, 0.4588235, 0, 1, 1,
0.6881974, 1.015452, 0.1160194, 0.4627451, 0, 1, 1,
0.689363, -1.65508, 3.136497, 0.4705882, 0, 1, 1,
0.6895348, -0.4142416, 1.405361, 0.4745098, 0, 1, 1,
0.6907603, -1.429388, 1.810027, 0.4823529, 0, 1, 1,
0.6974017, -0.2584986, 1.958095, 0.4862745, 0, 1, 1,
0.6978737, 0.05700699, 0.9699361, 0.4941176, 0, 1, 1,
0.7045227, -1.303956, 5.108158, 0.5019608, 0, 1, 1,
0.7112466, 0.3341334, 0.8168516, 0.5058824, 0, 1, 1,
0.7131026, 1.114224, 1.098116, 0.5137255, 0, 1, 1,
0.7170035, -1.188892, 4.793373, 0.5176471, 0, 1, 1,
0.7205324, 0.8288562, 1.200261, 0.5254902, 0, 1, 1,
0.720616, 0.1469114, -0.04658299, 0.5294118, 0, 1, 1,
0.7212963, -0.5121378, 3.183965, 0.5372549, 0, 1, 1,
0.7304498, 0.72281, 0.8201106, 0.5411765, 0, 1, 1,
0.731528, -0.296915, -0.1870283, 0.5490196, 0, 1, 1,
0.7340711, -0.6047667, 1.652399, 0.5529412, 0, 1, 1,
0.735484, 1.080193, 0.6754172, 0.5607843, 0, 1, 1,
0.7367609, 0.03044689, 1.086516, 0.5647059, 0, 1, 1,
0.7370999, 1.137577, -0.4820329, 0.572549, 0, 1, 1,
0.7445282, -0.394623, 2.792711, 0.5764706, 0, 1, 1,
0.7463661, -0.2891046, 2.696041, 0.5843138, 0, 1, 1,
0.7517882, -0.624972, 3.299024, 0.5882353, 0, 1, 1,
0.752867, 0.6814976, 1.960575, 0.5960785, 0, 1, 1,
0.7562307, -0.3893077, 2.629962, 0.6039216, 0, 1, 1,
0.7634478, 0.8949695, 0.880538, 0.6078432, 0, 1, 1,
0.7680489, -0.6866115, 0.8948403, 0.6156863, 0, 1, 1,
0.7692222, 1.992992, 1.218455, 0.6196079, 0, 1, 1,
0.7706751, 1.096377, 0.5795906, 0.627451, 0, 1, 1,
0.777854, 0.278625, 1.562808, 0.6313726, 0, 1, 1,
0.7905203, 1.099974, 0.8441201, 0.6392157, 0, 1, 1,
0.7921765, -1.667354, 3.807768, 0.6431373, 0, 1, 1,
0.7940642, 1.303675, -1.48148, 0.6509804, 0, 1, 1,
0.7958239, 1.004514, 1.824417, 0.654902, 0, 1, 1,
0.8001497, 1.322264, -0.2997219, 0.6627451, 0, 1, 1,
0.8042271, 0.409841, -0.188786, 0.6666667, 0, 1, 1,
0.8095213, 2.291848, 0.4948615, 0.6745098, 0, 1, 1,
0.8120298, -1.510622, 1.5986, 0.6784314, 0, 1, 1,
0.8125327, 1.738985, 0.6813067, 0.6862745, 0, 1, 1,
0.8139299, 0.1238316, 0.3896503, 0.6901961, 0, 1, 1,
0.8155417, -1.245137, 2.651273, 0.6980392, 0, 1, 1,
0.8184758, 0.9242527, 1.52633, 0.7058824, 0, 1, 1,
0.8188734, 0.7381724, 0.6113297, 0.7098039, 0, 1, 1,
0.8217278, 0.4000566, 1.396222, 0.7176471, 0, 1, 1,
0.8231902, 1.7887, 0.9155986, 0.7215686, 0, 1, 1,
0.83148, 0.6499501, -1.100946, 0.7294118, 0, 1, 1,
0.8328646, 0.6451952, 1.844973, 0.7333333, 0, 1, 1,
0.8336095, -1.594778, 3.771767, 0.7411765, 0, 1, 1,
0.8374631, 0.2298107, -0.05000937, 0.7450981, 0, 1, 1,
0.8377152, -1.247831, 1.535943, 0.7529412, 0, 1, 1,
0.8443446, -0.4087719, 2.307836, 0.7568628, 0, 1, 1,
0.8581624, -0.07751583, 1.967699, 0.7647059, 0, 1, 1,
0.8584378, 1.425253, -1.261428, 0.7686275, 0, 1, 1,
0.8610216, -1.814265, 3.402512, 0.7764706, 0, 1, 1,
0.8622507, 0.6165246, 1.540501, 0.7803922, 0, 1, 1,
0.8630275, -0.9982329, 2.354341, 0.7882353, 0, 1, 1,
0.8674102, -0.7857001, 2.372226, 0.7921569, 0, 1, 1,
0.8681441, -2.390079, 2.201419, 0.8, 0, 1, 1,
0.8681514, -0.6011819, 2.757854, 0.8078431, 0, 1, 1,
0.8706453, -1.496319, 3.023982, 0.8117647, 0, 1, 1,
0.8727497, -1.761015, 2.402088, 0.8196079, 0, 1, 1,
0.8795992, -0.686285, 1.658978, 0.8235294, 0, 1, 1,
0.8809221, 0.4556038, 1.517171, 0.8313726, 0, 1, 1,
0.8869988, -0.540499, 0.06717663, 0.8352941, 0, 1, 1,
0.8894687, -0.1729153, 2.26228, 0.8431373, 0, 1, 1,
0.8909153, 1.270998, 1.022109, 0.8470588, 0, 1, 1,
0.8951054, 1.106826, 0.1141664, 0.854902, 0, 1, 1,
0.8992231, 0.1913763, 2.306155, 0.8588235, 0, 1, 1,
0.9000195, -0.2540144, 2.172105, 0.8666667, 0, 1, 1,
0.9020912, -0.352209, 1.482414, 0.8705882, 0, 1, 1,
0.9031849, 0.8308296, -0.3744839, 0.8784314, 0, 1, 1,
0.9045195, 0.8018957, 0.7567697, 0.8823529, 0, 1, 1,
0.9091476, 0.5202855, 0.803184, 0.8901961, 0, 1, 1,
0.9204538, -0.007947633, 0.4361671, 0.8941177, 0, 1, 1,
0.9209077, 0.9574201, -0.2000181, 0.9019608, 0, 1, 1,
0.9230737, 1.275873, 1.923692, 0.9098039, 0, 1, 1,
0.9405811, -0.1677325, 2.881969, 0.9137255, 0, 1, 1,
0.9427056, 0.2651349, 1.320983, 0.9215686, 0, 1, 1,
0.94312, -0.3041485, 2.016113, 0.9254902, 0, 1, 1,
0.9500334, -2.021887, 2.286312, 0.9333333, 0, 1, 1,
0.9504672, 2.038501, 0.6302783, 0.9372549, 0, 1, 1,
0.9600478, 0.6407708, -0.7349814, 0.945098, 0, 1, 1,
0.9680656, -0.2881401, 2.460412, 0.9490196, 0, 1, 1,
0.9682534, 0.4250022, 2.530455, 0.9568627, 0, 1, 1,
0.9686255, -0.4410881, 4.048643, 0.9607843, 0, 1, 1,
0.9702837, -0.6886283, 1.560702, 0.9686275, 0, 1, 1,
0.9710895, 1.037269, 1.360257, 0.972549, 0, 1, 1,
0.971884, 0.391683, -0.4261973, 0.9803922, 0, 1, 1,
0.9763374, 0.9743069, -0.01633968, 0.9843137, 0, 1, 1,
0.9857044, -0.9440069, 2.165195, 0.9921569, 0, 1, 1,
0.9864256, -0.05564454, 2.217336, 0.9960784, 0, 1, 1,
0.9881232, -1.441774, 3.815755, 1, 0, 0.9960784, 1,
0.9900587, -0.4107272, 1.497545, 1, 0, 0.9882353, 1,
0.9923351, -1.683725, 2.334897, 1, 0, 0.9843137, 1,
0.9942117, 1.336029, 0.1750368, 1, 0, 0.9764706, 1,
0.9958819, 0.2500642, 1.707715, 1, 0, 0.972549, 1,
1.005247, -0.849717, 2.923578, 1, 0, 0.9647059, 1,
1.009318, -0.9228487, 2.423765, 1, 0, 0.9607843, 1,
1.020309, 0.1132987, 2.714725, 1, 0, 0.9529412, 1,
1.026469, -0.5179963, 3.541542, 1, 0, 0.9490196, 1,
1.028756, 0.2807851, 2.417051, 1, 0, 0.9411765, 1,
1.048099, -0.06830078, 1.314979, 1, 0, 0.9372549, 1,
1.049519, -0.1583398, 1.879155, 1, 0, 0.9294118, 1,
1.054106, 2.70678, -0.3927874, 1, 0, 0.9254902, 1,
1.059903, 0.9023317, 0.2631321, 1, 0, 0.9176471, 1,
1.064896, 0.5264898, 2.257984, 1, 0, 0.9137255, 1,
1.0713, -1.488124, 1.436631, 1, 0, 0.9058824, 1,
1.071316, 0.6646603, 1.266074, 1, 0, 0.9019608, 1,
1.073748, 0.3305352, 2.242546, 1, 0, 0.8941177, 1,
1.075428, 1.173403, 0.7827554, 1, 0, 0.8862745, 1,
1.082802, 0.1285535, 1.4928, 1, 0, 0.8823529, 1,
1.086015, -0.6099465, 1.659563, 1, 0, 0.8745098, 1,
1.086351, -0.6347129, 3.177943, 1, 0, 0.8705882, 1,
1.088574, -1.408558, 2.286079, 1, 0, 0.8627451, 1,
1.093393, -0.983668, 2.67374, 1, 0, 0.8588235, 1,
1.095567, -0.2075281, 1.963845, 1, 0, 0.8509804, 1,
1.097424, -0.4594161, 2.168483, 1, 0, 0.8470588, 1,
1.109989, -0.1219226, 1.679288, 1, 0, 0.8392157, 1,
1.110526, 1.252566, 1.375074, 1, 0, 0.8352941, 1,
1.113694, 0.7295579, 0.09545565, 1, 0, 0.827451, 1,
1.136436, -0.4260339, 1.519641, 1, 0, 0.8235294, 1,
1.141189, -0.4337288, 1.943583, 1, 0, 0.8156863, 1,
1.147732, -0.4116862, 1.887213, 1, 0, 0.8117647, 1,
1.148026, 1.041502, -0.5523388, 1, 0, 0.8039216, 1,
1.159607, 0.04037188, 1.177184, 1, 0, 0.7960784, 1,
1.15971, 0.7957038, -0.7964924, 1, 0, 0.7921569, 1,
1.163928, 1.085232, -2.711315, 1, 0, 0.7843137, 1,
1.172214, 0.4133782, 2.106469, 1, 0, 0.7803922, 1,
1.177119, 0.3056867, 2.079869, 1, 0, 0.772549, 1,
1.178958, 0.5063438, 0.8611148, 1, 0, 0.7686275, 1,
1.181388, 0.04472292, 1.941052, 1, 0, 0.7607843, 1,
1.188541, 0.2651785, 1.699409, 1, 0, 0.7568628, 1,
1.192451, -0.765515, 2.487676, 1, 0, 0.7490196, 1,
1.194363, 1.284827, 0.5208336, 1, 0, 0.7450981, 1,
1.210747, -1.075028, 4.250153, 1, 0, 0.7372549, 1,
1.213009, 0.2372535, 0.6605963, 1, 0, 0.7333333, 1,
1.222579, -1.959699, 1.464237, 1, 0, 0.7254902, 1,
1.225403, 0.966327, -0.4237207, 1, 0, 0.7215686, 1,
1.2325, 0.1827472, 0.7431154, 1, 0, 0.7137255, 1,
1.236838, 0.2513689, 2.366119, 1, 0, 0.7098039, 1,
1.257942, 0.1645823, 0.7000036, 1, 0, 0.7019608, 1,
1.264497, 0.8866791, 1.314388, 1, 0, 0.6941177, 1,
1.279946, 0.897096, 1.127263, 1, 0, 0.6901961, 1,
1.295119, 1.096975, 0.6205015, 1, 0, 0.682353, 1,
1.297886, 1.642246, 1.481158, 1, 0, 0.6784314, 1,
1.301053, -0.5513831, -0.06568008, 1, 0, 0.6705883, 1,
1.313706, -0.4167905, 1.518526, 1, 0, 0.6666667, 1,
1.335817, 0.3838623, 1.012181, 1, 0, 0.6588235, 1,
1.336979, 0.1006523, 2.740206, 1, 0, 0.654902, 1,
1.340287, 0.2464614, 2.184865, 1, 0, 0.6470588, 1,
1.340663, 1.433965, 0.3206896, 1, 0, 0.6431373, 1,
1.358736, -0.7279359, 2.216522, 1, 0, 0.6352941, 1,
1.360068, -0.3861478, 2.013278, 1, 0, 0.6313726, 1,
1.363312, -0.1479513, 1.069276, 1, 0, 0.6235294, 1,
1.365875, 0.3447737, 2.496823, 1, 0, 0.6196079, 1,
1.377052, 0.4110959, 1.554078, 1, 0, 0.6117647, 1,
1.377119, 1.226952, 1.671347, 1, 0, 0.6078432, 1,
1.378086, 0.008907653, 1.211318, 1, 0, 0.6, 1,
1.380413, 0.9876478, 1.274931, 1, 0, 0.5921569, 1,
1.382388, -0.7774657, 2.537103, 1, 0, 0.5882353, 1,
1.387289, -0.1002605, 1.960768, 1, 0, 0.5803922, 1,
1.408012, 1.255889, 1.995563, 1, 0, 0.5764706, 1,
1.416115, -2.215191, 4.202596, 1, 0, 0.5686275, 1,
1.425507, 0.3685376, 0.9002761, 1, 0, 0.5647059, 1,
1.425998, -0.988286, 2.807322, 1, 0, 0.5568628, 1,
1.429245, -0.8562437, 4.203661, 1, 0, 0.5529412, 1,
1.434694, -1.617486, 1.291851, 1, 0, 0.5450981, 1,
1.440955, -0.3697385, 1.860186, 1, 0, 0.5411765, 1,
1.459706, 0.2826315, 0.09336027, 1, 0, 0.5333334, 1,
1.461013, -1.325994, 2.534407, 1, 0, 0.5294118, 1,
1.464752, -0.4488129, 3.286442, 1, 0, 0.5215687, 1,
1.470335, 1.851721, 0.3563159, 1, 0, 0.5176471, 1,
1.471585, -0.3599941, 1.675086, 1, 0, 0.509804, 1,
1.475522, -0.5262895, 1.051226, 1, 0, 0.5058824, 1,
1.477624, -0.6735012, 2.96792, 1, 0, 0.4980392, 1,
1.493658, 0.4609353, 0.7286597, 1, 0, 0.4901961, 1,
1.494053, -2.771061, 2.809157, 1, 0, 0.4862745, 1,
1.496194, -0.5902363, 0.7273695, 1, 0, 0.4784314, 1,
1.510147, 0.928554, 1.481279, 1, 0, 0.4745098, 1,
1.5117, 0.4467025, 1.659761, 1, 0, 0.4666667, 1,
1.514134, -0.8396131, 0.1491004, 1, 0, 0.4627451, 1,
1.514341, 0.1854317, 2.838804, 1, 0, 0.454902, 1,
1.522219, -0.1356567, -0.03877617, 1, 0, 0.4509804, 1,
1.525112, -0.88333, 1.109191, 1, 0, 0.4431373, 1,
1.53303, 0.3135195, 2.141111, 1, 0, 0.4392157, 1,
1.536111, -1.840332, 2.720496, 1, 0, 0.4313726, 1,
1.536552, 2.560686, 1.528071, 1, 0, 0.427451, 1,
1.540813, -0.1959555, 0.1986927, 1, 0, 0.4196078, 1,
1.547702, 1.30452, 3.740708, 1, 0, 0.4156863, 1,
1.556052, -0.5017384, 1.199826, 1, 0, 0.4078431, 1,
1.579377, -0.9064341, 1.197297, 1, 0, 0.4039216, 1,
1.593518, -0.8335698, 2.592452, 1, 0, 0.3960784, 1,
1.602712, -0.1547451, 1.883492, 1, 0, 0.3882353, 1,
1.612363, -0.4275666, 0.9179741, 1, 0, 0.3843137, 1,
1.613552, -0.09960731, 1.202517, 1, 0, 0.3764706, 1,
1.623474, -0.965755, 2.292903, 1, 0, 0.372549, 1,
1.624404, -1.663386, 1.468906, 1, 0, 0.3647059, 1,
1.634631, 1.418178, 2.228103, 1, 0, 0.3607843, 1,
1.636647, 1.074463, 2.060199, 1, 0, 0.3529412, 1,
1.637437, -0.5912816, -0.1291068, 1, 0, 0.3490196, 1,
1.646102, 0.2742451, 2.769485, 1, 0, 0.3411765, 1,
1.646434, -2.840806, 3.700824, 1, 0, 0.3372549, 1,
1.650319, 0.281825, 0.8752124, 1, 0, 0.3294118, 1,
1.665611, 0.9754424, 2.93481, 1, 0, 0.3254902, 1,
1.702454, 0.2551842, 2.320794, 1, 0, 0.3176471, 1,
1.71309, -1.535204, 3.134043, 1, 0, 0.3137255, 1,
1.714665, 0.4583032, 0.1763901, 1, 0, 0.3058824, 1,
1.722117, -0.870577, 1.842065, 1, 0, 0.2980392, 1,
1.72776, -1.496548, 1.55049, 1, 0, 0.2941177, 1,
1.73483, -0.1674116, 3.36831, 1, 0, 0.2862745, 1,
1.754555, -0.34775, 2.953262, 1, 0, 0.282353, 1,
1.756436, 1.370888, 0.4761558, 1, 0, 0.2745098, 1,
1.770928, -0.946129, 2.321616, 1, 0, 0.2705882, 1,
1.777216, -0.09842989, 0.3690015, 1, 0, 0.2627451, 1,
1.780166, -2.110698, 2.709765, 1, 0, 0.2588235, 1,
1.796188, -0.7745544, 2.35709, 1, 0, 0.2509804, 1,
1.803805, 0.7748969, -0.1351483, 1, 0, 0.2470588, 1,
1.819441, 1.235095, 2.439754, 1, 0, 0.2392157, 1,
1.822668, 1.009266, 1.842289, 1, 0, 0.2352941, 1,
1.842645, -1.309688, 3.127429, 1, 0, 0.227451, 1,
1.848272, -1.141407, 2.344676, 1, 0, 0.2235294, 1,
1.851373, -0.861284, 2.04283, 1, 0, 0.2156863, 1,
1.855235, -0.8669499, 2.293222, 1, 0, 0.2117647, 1,
1.869661, -1.227679, -0.1662191, 1, 0, 0.2039216, 1,
1.882643, -0.8233641, 2.436495, 1, 0, 0.1960784, 1,
1.884778, -0.3192613, -0.4671123, 1, 0, 0.1921569, 1,
1.898963, 1.17043, 0.1621285, 1, 0, 0.1843137, 1,
1.902368, -0.007700711, 1.702444, 1, 0, 0.1803922, 1,
1.918262, -0.3376816, 2.923965, 1, 0, 0.172549, 1,
1.919878, 0.2964551, 0.2325695, 1, 0, 0.1686275, 1,
1.937397, -0.624329, 0.480853, 1, 0, 0.1607843, 1,
1.981664, -1.116012, 1.997248, 1, 0, 0.1568628, 1,
2.009849, -0.1634986, 1.884586, 1, 0, 0.1490196, 1,
2.022405, 1.367533, 1.777893, 1, 0, 0.145098, 1,
2.051566, -0.762765, 2.241712, 1, 0, 0.1372549, 1,
2.057487, 1.582032, 1.746725, 1, 0, 0.1333333, 1,
2.06807, 0.001009828, 0.4190703, 1, 0, 0.1254902, 1,
2.151603, -0.5507702, 2.587148, 1, 0, 0.1215686, 1,
2.158087, -0.06686909, 1.84409, 1, 0, 0.1137255, 1,
2.161498, 0.1167293, -0.5135403, 1, 0, 0.1098039, 1,
2.171494, -1.343731, 1.664139, 1, 0, 0.1019608, 1,
2.172774, -0.546344, 0.3445628, 1, 0, 0.09411765, 1,
2.1951, -0.8085417, 2.487108, 1, 0, 0.09019608, 1,
2.219603, -0.7781299, 0.2271306, 1, 0, 0.08235294, 1,
2.239287, 1.134709, 1.530049, 1, 0, 0.07843138, 1,
2.262933, -0.2911175, 2.173775, 1, 0, 0.07058824, 1,
2.293113, -1.150509, 1.735835, 1, 0, 0.06666667, 1,
2.317389, -0.4668225, 1.811, 1, 0, 0.05882353, 1,
2.352923, 1.304994, -0.04079386, 1, 0, 0.05490196, 1,
2.373168, 1.023792, 1.472616, 1, 0, 0.04705882, 1,
2.391339, 0.1505516, -0.5238568, 1, 0, 0.04313726, 1,
2.471419, 1.443073, 2.308401, 1, 0, 0.03529412, 1,
2.473685, -0.2964274, 3.075451, 1, 0, 0.03137255, 1,
2.760738, -2.895061, 3.0285, 1, 0, 0.02352941, 1,
2.761189, -1.503538, 3.625541, 1, 0, 0.01960784, 1,
2.901237, 1.270073, 1.261483, 1, 0, 0.01176471, 1,
3.354765, -0.4532917, 2.578084, 1, 0, 0.007843138, 1
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
0.09979737, -3.980236, -7.646837, 0, -0.5, 0.5, 0.5,
0.09979737, -3.980236, -7.646837, 1, -0.5, 0.5, 0.5,
0.09979737, -3.980236, -7.646837, 1, 1.5, 0.5, 0.5,
0.09979737, -3.980236, -7.646837, 0, 1.5, 0.5, 0.5
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
-4.258604, 0.3060464, -7.646837, 0, -0.5, 0.5, 0.5,
-4.258604, 0.3060464, -7.646837, 1, -0.5, 0.5, 0.5,
-4.258604, 0.3060464, -7.646837, 1, 1.5, 0.5, 0.5,
-4.258604, 0.3060464, -7.646837, 0, 1.5, 0.5, 0.5
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
-4.258604, -3.980236, 0.06800699, 0, -0.5, 0.5, 0.5,
-4.258604, -3.980236, 0.06800699, 1, -0.5, 0.5, 0.5,
-4.258604, -3.980236, 0.06800699, 1, 1.5, 0.5, 0.5,
-4.258604, -3.980236, 0.06800699, 0, 1.5, 0.5, 0.5
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
-3, -2.991094, -5.866488,
3, -2.991094, -5.866488,
-3, -2.991094, -5.866488,
-3, -3.155951, -6.163213,
-2, -2.991094, -5.866488,
-2, -3.155951, -6.163213,
-1, -2.991094, -5.866488,
-1, -3.155951, -6.163213,
0, -2.991094, -5.866488,
0, -3.155951, -6.163213,
1, -2.991094, -5.866488,
1, -3.155951, -6.163213,
2, -2.991094, -5.866488,
2, -3.155951, -6.163213,
3, -2.991094, -5.866488,
3, -3.155951, -6.163213
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
-3, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
-3, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
-3, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
-3, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
-2, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
-2, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
-2, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
-2, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
-1, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
-1, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
-1, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
-1, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
0, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
0, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
0, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
0, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
1, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
1, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
1, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
1, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
2, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
2, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
2, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
2, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5,
3, -3.485665, -6.756662, 0, -0.5, 0.5, 0.5,
3, -3.485665, -6.756662, 1, -0.5, 0.5, 0.5,
3, -3.485665, -6.756662, 1, 1.5, 0.5, 0.5,
3, -3.485665, -6.756662, 0, 1.5, 0.5, 0.5
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
-3.252819, -2, -5.866488,
-3.252819, 3, -5.866488,
-3.252819, -2, -5.866488,
-3.42045, -2, -6.163213,
-3.252819, -1, -5.866488,
-3.42045, -1, -6.163213,
-3.252819, 0, -5.866488,
-3.42045, 0, -6.163213,
-3.252819, 1, -5.866488,
-3.42045, 1, -6.163213,
-3.252819, 2, -5.866488,
-3.42045, 2, -6.163213,
-3.252819, 3, -5.866488,
-3.42045, 3, -6.163213
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
-3.755712, -2, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, -2, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, -2, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, -2, -6.756662, 0, 1.5, 0.5, 0.5,
-3.755712, -1, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, -1, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, -1, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, -1, -6.756662, 0, 1.5, 0.5, 0.5,
-3.755712, 0, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, 0, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, 0, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, 0, -6.756662, 0, 1.5, 0.5, 0.5,
-3.755712, 1, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, 1, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, 1, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, 1, -6.756662, 0, 1.5, 0.5, 0.5,
-3.755712, 2, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, 2, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, 2, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, 2, -6.756662, 0, 1.5, 0.5, 0.5,
-3.755712, 3, -6.756662, 0, -0.5, 0.5, 0.5,
-3.755712, 3, -6.756662, 1, -0.5, 0.5, 0.5,
-3.755712, 3, -6.756662, 1, 1.5, 0.5, 0.5,
-3.755712, 3, -6.756662, 0, 1.5, 0.5, 0.5
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
-3.252819, -2.991094, -4,
-3.252819, -2.991094, 4,
-3.252819, -2.991094, -4,
-3.42045, -3.155951, -4,
-3.252819, -2.991094, -2,
-3.42045, -3.155951, -2,
-3.252819, -2.991094, 0,
-3.42045, -3.155951, 0,
-3.252819, -2.991094, 2,
-3.42045, -3.155951, 2,
-3.252819, -2.991094, 4,
-3.42045, -3.155951, 4
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
-3.755712, -3.485665, -4, 0, -0.5, 0.5, 0.5,
-3.755712, -3.485665, -4, 1, -0.5, 0.5, 0.5,
-3.755712, -3.485665, -4, 1, 1.5, 0.5, 0.5,
-3.755712, -3.485665, -4, 0, 1.5, 0.5, 0.5,
-3.755712, -3.485665, -2, 0, -0.5, 0.5, 0.5,
-3.755712, -3.485665, -2, 1, -0.5, 0.5, 0.5,
-3.755712, -3.485665, -2, 1, 1.5, 0.5, 0.5,
-3.755712, -3.485665, -2, 0, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 0, 0, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 0, 1, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 0, 1, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 0, 0, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 2, 0, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 2, 1, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 2, 1, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 2, 0, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 4, 0, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 4, 1, -0.5, 0.5, 0.5,
-3.755712, -3.485665, 4, 1, 1.5, 0.5, 0.5,
-3.755712, -3.485665, 4, 0, 1.5, 0.5, 0.5
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
-3.252819, -2.991094, -5.866488,
-3.252819, 3.603186, -5.866488,
-3.252819, -2.991094, 6.002502,
-3.252819, 3.603186, 6.002502,
-3.252819, -2.991094, -5.866488,
-3.252819, -2.991094, 6.002502,
-3.252819, 3.603186, -5.866488,
-3.252819, 3.603186, 6.002502,
-3.252819, -2.991094, -5.866488,
3.452414, -2.991094, -5.866488,
-3.252819, -2.991094, 6.002502,
3.452414, -2.991094, 6.002502,
-3.252819, 3.603186, -5.866488,
3.452414, 3.603186, -5.866488,
-3.252819, 3.603186, 6.002502,
3.452414, 3.603186, 6.002502,
3.452414, -2.991094, -5.866488,
3.452414, 3.603186, -5.866488,
3.452414, -2.991094, 6.002502,
3.452414, 3.603186, 6.002502,
3.452414, -2.991094, -5.866488,
3.452414, -2.991094, 6.002502,
3.452414, 3.603186, -5.866488,
3.452414, 3.603186, 6.002502
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
var radius = 8.086195;
var distance = 35.97639;
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
mvMatrix.translate( -0.09979737, -0.3060464, -0.06800699 );
mvMatrix.scale( 1.3039, 1.325839, 0.7366214 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.97639);
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


