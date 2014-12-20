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
-3.417547, -0.3712998, 0.01799215, 1, 0, 0, 1,
-3.016067, 1.328677, -0.1547578, 1, 0.007843138, 0, 1,
-2.965004, -1.037546, -3.214575, 1, 0.01176471, 0, 1,
-2.68015, -2.012288, -1.947715, 1, 0.01960784, 0, 1,
-2.660264, 2.747594, -0.405966, 1, 0.02352941, 0, 1,
-2.457937, -0.9510927, -0.9166783, 1, 0.03137255, 0, 1,
-2.448723, 1.322977, -4.223831, 1, 0.03529412, 0, 1,
-2.446162, 1.638707, -0.6397504, 1, 0.04313726, 0, 1,
-2.437788, -0.2567925, -0.9475333, 1, 0.04705882, 0, 1,
-2.409777, 0.200744, -0.5897326, 1, 0.05490196, 0, 1,
-2.339045, 2.124134, -2.620586, 1, 0.05882353, 0, 1,
-2.303382, 0.9583258, -0.5275664, 1, 0.06666667, 0, 1,
-2.286919, -0.8184295, -1.760443, 1, 0.07058824, 0, 1,
-2.249835, 0.8722432, 1.166666, 1, 0.07843138, 0, 1,
-2.246231, 1.014947, -1.098926, 1, 0.08235294, 0, 1,
-2.13463, 0.2408002, -0.9888383, 1, 0.09019608, 0, 1,
-2.127927, -0.05208308, -0.09742041, 1, 0.09411765, 0, 1,
-2.068031, 0.5437716, -1.634259, 1, 0.1019608, 0, 1,
-2.059779, -1.171552, -1.666826, 1, 0.1098039, 0, 1,
-2.059138, 0.2806284, -2.49606, 1, 0.1137255, 0, 1,
-1.987844, 0.5064741, -2.625799, 1, 0.1215686, 0, 1,
-1.949738, -0.05117582, -2.656348, 1, 0.1254902, 0, 1,
-1.94555, 0.2353844, -1.508773, 1, 0.1333333, 0, 1,
-1.942725, -1.425033, -2.208427, 1, 0.1372549, 0, 1,
-1.918375, 0.1292356, -1.527519, 1, 0.145098, 0, 1,
-1.907352, -1.597265, -3.158703, 1, 0.1490196, 0, 1,
-1.90251, -0.02395589, -0.2609941, 1, 0.1568628, 0, 1,
-1.88808, -0.3988981, -1.729832, 1, 0.1607843, 0, 1,
-1.886778, 1.493915, -2.044918, 1, 0.1686275, 0, 1,
-1.876509, 1.27829, -0.209282, 1, 0.172549, 0, 1,
-1.873044, -0.7839589, 0.4398556, 1, 0.1803922, 0, 1,
-1.872114, -0.2941119, -2.408514, 1, 0.1843137, 0, 1,
-1.854328, -0.3323315, -2.232864, 1, 0.1921569, 0, 1,
-1.810793, 0.2785732, -0.7492622, 1, 0.1960784, 0, 1,
-1.806261, 0.7500833, -1.056894, 1, 0.2039216, 0, 1,
-1.799528, -1.210606, -2.557225, 1, 0.2117647, 0, 1,
-1.746112, 0.5769143, -1.272201, 1, 0.2156863, 0, 1,
-1.724995, -0.1267853, -1.315939, 1, 0.2235294, 0, 1,
-1.724181, -0.7753189, -0.7594873, 1, 0.227451, 0, 1,
-1.719922, -1.629775, -4.132493, 1, 0.2352941, 0, 1,
-1.707692, -0.9327697, -1.407458, 1, 0.2392157, 0, 1,
-1.693195, -2.047755, -2.399302, 1, 0.2470588, 0, 1,
-1.692569, -0.2070035, -1.604674, 1, 0.2509804, 0, 1,
-1.675251, -0.6571792, -1.750243, 1, 0.2588235, 0, 1,
-1.664157, -0.1310964, -2.44389, 1, 0.2627451, 0, 1,
-1.656312, -1.481357, -2.485924, 1, 0.2705882, 0, 1,
-1.643641, 0.02756613, 0.05571568, 1, 0.2745098, 0, 1,
-1.643105, -0.2172916, -0.9087741, 1, 0.282353, 0, 1,
-1.621829, 0.5345346, -2.507723, 1, 0.2862745, 0, 1,
-1.605314, 0.07905781, -1.956097, 1, 0.2941177, 0, 1,
-1.59785, -0.187736, -0.01736043, 1, 0.3019608, 0, 1,
-1.577428, 0.2630133, -1.465574, 1, 0.3058824, 0, 1,
-1.573709, -1.728924, -2.722907, 1, 0.3137255, 0, 1,
-1.572743, -0.151765, -1.302507, 1, 0.3176471, 0, 1,
-1.569375, -0.3691263, -1.9243, 1, 0.3254902, 0, 1,
-1.563889, -1.149599, -3.364893, 1, 0.3294118, 0, 1,
-1.559338, -0.3333599, -1.991305, 1, 0.3372549, 0, 1,
-1.557459, -0.5112057, -3.03015, 1, 0.3411765, 0, 1,
-1.541952, -0.4363473, -3.434864, 1, 0.3490196, 0, 1,
-1.541659, -0.218403, -0.8082961, 1, 0.3529412, 0, 1,
-1.537655, 0.1789545, -1.118444, 1, 0.3607843, 0, 1,
-1.519779, 0.4945003, -0.5706165, 1, 0.3647059, 0, 1,
-1.487456, 0.4931949, -1.118129, 1, 0.372549, 0, 1,
-1.486413, 0.9458942, -0.2618104, 1, 0.3764706, 0, 1,
-1.474084, 1.249344, -0.2146491, 1, 0.3843137, 0, 1,
-1.464461, 1.046623, 0.01747841, 1, 0.3882353, 0, 1,
-1.460095, -0.5719723, -0.574645, 1, 0.3960784, 0, 1,
-1.457477, 0.1221809, -0.3719, 1, 0.4039216, 0, 1,
-1.455818, -0.07260623, -1.911767, 1, 0.4078431, 0, 1,
-1.442086, -0.6130544, -2.938488, 1, 0.4156863, 0, 1,
-1.440946, 1.126053, -0.4987925, 1, 0.4196078, 0, 1,
-1.425351, 0.2792898, -2.690907, 1, 0.427451, 0, 1,
-1.403659, 0.1487521, -0.7826791, 1, 0.4313726, 0, 1,
-1.403197, -0.465761, -1.736835, 1, 0.4392157, 0, 1,
-1.395508, 1.013937, -0.6804381, 1, 0.4431373, 0, 1,
-1.383376, 0.8637416, -1.585199, 1, 0.4509804, 0, 1,
-1.37075, -1.125901, -3.59302, 1, 0.454902, 0, 1,
-1.36948, -0.3035944, -3.634993, 1, 0.4627451, 0, 1,
-1.366454, -1.512443, -2.521759, 1, 0.4666667, 0, 1,
-1.359341, 0.5598912, -0.6948734, 1, 0.4745098, 0, 1,
-1.347885, 0.4705599, -0.5243806, 1, 0.4784314, 0, 1,
-1.333109, 0.982474, -0.6079192, 1, 0.4862745, 0, 1,
-1.32337, -0.4685131, -2.470759, 1, 0.4901961, 0, 1,
-1.3197, 0.0465061, 0.1975544, 1, 0.4980392, 0, 1,
-1.311726, -0.225229, -1.720883, 1, 0.5058824, 0, 1,
-1.310755, 2.294378, 0.5938204, 1, 0.509804, 0, 1,
-1.306968, -0.9838593, -2.761156, 1, 0.5176471, 0, 1,
-1.278482, 1.129344, 1.090233, 1, 0.5215687, 0, 1,
-1.269194, -0.2139969, -2.785243, 1, 0.5294118, 0, 1,
-1.268655, 0.07007773, -2.539579, 1, 0.5333334, 0, 1,
-1.267321, 1.338861, -2.633204, 1, 0.5411765, 0, 1,
-1.257873, 1.26285, -1.086677, 1, 0.5450981, 0, 1,
-1.256778, -1.101341, -1.536067, 1, 0.5529412, 0, 1,
-1.249625, 0.05166191, 0.5173468, 1, 0.5568628, 0, 1,
-1.24903, -1.623033, -4.3681, 1, 0.5647059, 0, 1,
-1.239923, 0.6630499, 1.165377, 1, 0.5686275, 0, 1,
-1.233007, 0.5479418, -0.6405196, 1, 0.5764706, 0, 1,
-1.226683, 2.109681, -0.816654, 1, 0.5803922, 0, 1,
-1.219649, -2.233043, -2.335205, 1, 0.5882353, 0, 1,
-1.213231, 0.5979939, -0.6528829, 1, 0.5921569, 0, 1,
-1.212816, -1.216227, -2.836731, 1, 0.6, 0, 1,
-1.208705, 0.8787997, -1.481162, 1, 0.6078432, 0, 1,
-1.203882, 0.8396255, -2.74502, 1, 0.6117647, 0, 1,
-1.19279, -1.313408, -0.8008217, 1, 0.6196079, 0, 1,
-1.183176, -0.1781077, -2.082938, 1, 0.6235294, 0, 1,
-1.178692, -1.018028, -1.740778, 1, 0.6313726, 0, 1,
-1.166975, 2.156411, 0.07542684, 1, 0.6352941, 0, 1,
-1.163463, -0.4140676, -1.248827, 1, 0.6431373, 0, 1,
-1.154488, 0.338519, -1.064982, 1, 0.6470588, 0, 1,
-1.142239, -1.901815, -2.948052, 1, 0.654902, 0, 1,
-1.141626, 0.4029489, -1.461343, 1, 0.6588235, 0, 1,
-1.137353, -1.210211, -2.096559, 1, 0.6666667, 0, 1,
-1.137027, 0.7134975, -2.3122, 1, 0.6705883, 0, 1,
-1.132096, -0.1853252, -2.685519, 1, 0.6784314, 0, 1,
-1.125396, -1.450048, -3.646171, 1, 0.682353, 0, 1,
-1.118935, -1.57995, -1.867386, 1, 0.6901961, 0, 1,
-1.110873, 0.7520834, -1.99608, 1, 0.6941177, 0, 1,
-1.106965, -1.429346, -1.482252, 1, 0.7019608, 0, 1,
-1.104373, 1.641621, -0.4321226, 1, 0.7098039, 0, 1,
-1.09997, 0.8055653, -0.9735722, 1, 0.7137255, 0, 1,
-1.0999, -1.32929, -2.106756, 1, 0.7215686, 0, 1,
-1.098049, 0.4313114, 1.773443, 1, 0.7254902, 0, 1,
-1.090316, -0.3737939, -2.643398, 1, 0.7333333, 0, 1,
-1.089795, 0.4045128, -0.4986726, 1, 0.7372549, 0, 1,
-1.089086, -0.2225503, -2.667196, 1, 0.7450981, 0, 1,
-1.079598, -0.647926, -3.895025, 1, 0.7490196, 0, 1,
-1.07747, -0.03235273, -1.307606, 1, 0.7568628, 0, 1,
-1.069865, -0.6055182, -3.376404, 1, 0.7607843, 0, 1,
-1.069116, 0.6377093, -1.282014, 1, 0.7686275, 0, 1,
-1.068632, 0.3165238, -1.063689, 1, 0.772549, 0, 1,
-1.068111, -0.6183262, -1.058084, 1, 0.7803922, 0, 1,
-1.055045, 0.5699454, 1.264872, 1, 0.7843137, 0, 1,
-1.054953, 1.031415, -0.9136754, 1, 0.7921569, 0, 1,
-1.051945, -1.332517, -1.305229, 1, 0.7960784, 0, 1,
-1.04789, -0.07072605, -1.559391, 1, 0.8039216, 0, 1,
-1.046857, -0.3402748, -2.147686, 1, 0.8117647, 0, 1,
-1.04346, 0.534644, -1.16263, 1, 0.8156863, 0, 1,
-1.042226, 1.482643, 0.2358409, 1, 0.8235294, 0, 1,
-1.037154, -0.066373, -2.132844, 1, 0.827451, 0, 1,
-1.033291, -0.2741125, -1.451822, 1, 0.8352941, 0, 1,
-1.025581, -0.6778527, -3.663311, 1, 0.8392157, 0, 1,
-1.023851, -1.258235, -3.36596, 1, 0.8470588, 0, 1,
-1.021699, -0.8821702, -2.311118, 1, 0.8509804, 0, 1,
-1.018224, 0.4630535, -1.220151, 1, 0.8588235, 0, 1,
-1.015124, 0.2557225, -2.029511, 1, 0.8627451, 0, 1,
-1.014566, 1.28009, 0.02435542, 1, 0.8705882, 0, 1,
-1.007306, 0.3273519, -3.48485, 1, 0.8745098, 0, 1,
-0.9977953, -1.183365, -3.038057, 1, 0.8823529, 0, 1,
-0.9977589, -0.9020446, -3.26014, 1, 0.8862745, 0, 1,
-0.9955117, -0.7146306, -1.904138, 1, 0.8941177, 0, 1,
-0.992266, -1.481525, -2.468301, 1, 0.8980392, 0, 1,
-0.9885322, 0.3731479, -1.815104, 1, 0.9058824, 0, 1,
-0.9880238, 0.6428373, -3.638658, 1, 0.9137255, 0, 1,
-0.9817766, 0.7857606, -1.184612, 1, 0.9176471, 0, 1,
-0.9746647, 0.1044996, -1.67432, 1, 0.9254902, 0, 1,
-0.9708059, -0.1455975, -2.015811, 1, 0.9294118, 0, 1,
-0.9674528, 0.7574953, -1.514599, 1, 0.9372549, 0, 1,
-0.9627749, 1.11608, -0.8647097, 1, 0.9411765, 0, 1,
-0.9525204, 0.2287167, -1.051168, 1, 0.9490196, 0, 1,
-0.9505827, 0.3608535, -0.8030629, 1, 0.9529412, 0, 1,
-0.9494994, -0.4011594, -2.965608, 1, 0.9607843, 0, 1,
-0.9494018, 1.004164, -2.412626, 1, 0.9647059, 0, 1,
-0.9408357, -0.300337, -2.000327, 1, 0.972549, 0, 1,
-0.9384775, -0.1770368, -0.9996471, 1, 0.9764706, 0, 1,
-0.9372906, 1.438214, -1.114362, 1, 0.9843137, 0, 1,
-0.934554, 1.017336, -0.9873765, 1, 0.9882353, 0, 1,
-0.9315431, -1.166483, -2.358847, 1, 0.9960784, 0, 1,
-0.9314099, 0.00819794, -0.9639447, 0.9960784, 1, 0, 1,
-0.9286479, -0.7872018, -1.175131, 0.9921569, 1, 0, 1,
-0.9238715, 0.5692698, -1.961284, 0.9843137, 1, 0, 1,
-0.9223843, 1.722751, -0.5619488, 0.9803922, 1, 0, 1,
-0.9193805, -0.8569785, -1.916681, 0.972549, 1, 0, 1,
-0.9180347, -0.06737456, -3.45966, 0.9686275, 1, 0, 1,
-0.9160737, -0.6324955, -0.8735443, 0.9607843, 1, 0, 1,
-0.9157353, 1.428739, 0.08914092, 0.9568627, 1, 0, 1,
-0.893159, 2.201159, -0.1846134, 0.9490196, 1, 0, 1,
-0.8930972, -0.9286922, 0.005918218, 0.945098, 1, 0, 1,
-0.8883516, -1.271186, -3.585386, 0.9372549, 1, 0, 1,
-0.8847686, -0.2643488, -3.272797, 0.9333333, 1, 0, 1,
-0.8810225, -1.967448, -3.023285, 0.9254902, 1, 0, 1,
-0.8791482, 1.057858, -1.034219, 0.9215686, 1, 0, 1,
-0.8736538, -0.8650495, -2.179917, 0.9137255, 1, 0, 1,
-0.8710312, 0.1233935, 0.3405297, 0.9098039, 1, 0, 1,
-0.8609461, 0.5002803, -2.89182, 0.9019608, 1, 0, 1,
-0.853779, -0.8336982, -2.841062, 0.8941177, 1, 0, 1,
-0.8507641, -0.5742195, -3.094599, 0.8901961, 1, 0, 1,
-0.8504676, 0.5248687, -2.179004, 0.8823529, 1, 0, 1,
-0.8361699, -0.2243948, -1.307887, 0.8784314, 1, 0, 1,
-0.8359566, -0.2865551, -1.986906, 0.8705882, 1, 0, 1,
-0.834742, -0.8510019, -4.147041, 0.8666667, 1, 0, 1,
-0.826712, 0.4042745, -1.488052, 0.8588235, 1, 0, 1,
-0.8249158, -0.3173944, -1.562322, 0.854902, 1, 0, 1,
-0.8221313, -0.6283723, -2.787977, 0.8470588, 1, 0, 1,
-0.820294, -0.2576287, -2.127572, 0.8431373, 1, 0, 1,
-0.8176789, -0.1043033, -0.5590169, 0.8352941, 1, 0, 1,
-0.8140794, 2.011511, -1.244883, 0.8313726, 1, 0, 1,
-0.8046167, -1.38702, -1.600404, 0.8235294, 1, 0, 1,
-0.7945144, -0.6605674, -1.729683, 0.8196079, 1, 0, 1,
-0.7847849, -0.414057, -1.332152, 0.8117647, 1, 0, 1,
-0.7840914, 0.5527605, -0.3617835, 0.8078431, 1, 0, 1,
-0.7825724, -0.08202586, -1.686092, 0.8, 1, 0, 1,
-0.7764097, -1.586804, -4.148798, 0.7921569, 1, 0, 1,
-0.7723249, -0.8855811, -3.122572, 0.7882353, 1, 0, 1,
-0.7702064, -0.1338757, -1.035979, 0.7803922, 1, 0, 1,
-0.7681578, -0.1036272, -3.19433, 0.7764706, 1, 0, 1,
-0.7651072, -0.5698313, -1.782126, 0.7686275, 1, 0, 1,
-0.7636244, -0.5957949, -3.248019, 0.7647059, 1, 0, 1,
-0.7620566, 1.034369, 0.01967193, 0.7568628, 1, 0, 1,
-0.7599462, 0.03623658, -3.503018, 0.7529412, 1, 0, 1,
-0.7594889, 1.286304, -2.562174, 0.7450981, 1, 0, 1,
-0.7537677, 0.5003882, -1.407562, 0.7411765, 1, 0, 1,
-0.7513222, -0.1987655, -1.779293, 0.7333333, 1, 0, 1,
-0.7466782, 2.382844, 0.4261435, 0.7294118, 1, 0, 1,
-0.7390549, 0.1412121, -0.993511, 0.7215686, 1, 0, 1,
-0.737911, -0.06341615, -4.014406, 0.7176471, 1, 0, 1,
-0.7342377, 0.7568769, -0.4438981, 0.7098039, 1, 0, 1,
-0.7334481, -0.6671751, -3.183315, 0.7058824, 1, 0, 1,
-0.7299773, -0.6174651, -2.45871, 0.6980392, 1, 0, 1,
-0.7274362, -1.767358, -2.693505, 0.6901961, 1, 0, 1,
-0.7250617, 0.6172615, -1.83163, 0.6862745, 1, 0, 1,
-0.7249489, 0.1435498, -0.8228035, 0.6784314, 1, 0, 1,
-0.7195452, 0.3808172, -0.9949915, 0.6745098, 1, 0, 1,
-0.7190168, 1.007488, -1.24833, 0.6666667, 1, 0, 1,
-0.718262, 0.1237572, -1.05434, 0.6627451, 1, 0, 1,
-0.7180817, 0.3452953, -0.4040557, 0.654902, 1, 0, 1,
-0.7174553, -2.175403, -1.802056, 0.6509804, 1, 0, 1,
-0.709617, -0.2595536, -1.189938, 0.6431373, 1, 0, 1,
-0.707998, -0.06237344, 0.8419391, 0.6392157, 1, 0, 1,
-0.699971, -0.6897599, -1.621883, 0.6313726, 1, 0, 1,
-0.6996787, 1.343513, 0.1169007, 0.627451, 1, 0, 1,
-0.6985168, -0.02902279, -0.6013007, 0.6196079, 1, 0, 1,
-0.6965661, -1.190524, -2.11323, 0.6156863, 1, 0, 1,
-0.6872958, -1.069172, -2.596011, 0.6078432, 1, 0, 1,
-0.6750118, -1.592741, -1.758981, 0.6039216, 1, 0, 1,
-0.673631, -1.564342, -0.6993816, 0.5960785, 1, 0, 1,
-0.6725483, 1.183235, 0.02977168, 0.5882353, 1, 0, 1,
-0.6685155, 2.107539, -0.08386444, 0.5843138, 1, 0, 1,
-0.6655937, 1.180879, -0.6517588, 0.5764706, 1, 0, 1,
-0.6638304, 0.2569285, -0.9643573, 0.572549, 1, 0, 1,
-0.6624793, -1.344488, -1.633146, 0.5647059, 1, 0, 1,
-0.653624, -0.892949, -3.596127, 0.5607843, 1, 0, 1,
-0.645488, -0.6295527, -2.793375, 0.5529412, 1, 0, 1,
-0.6404346, -0.7311849, -2.610576, 0.5490196, 1, 0, 1,
-0.6386817, 0.2304618, -2.941556, 0.5411765, 1, 0, 1,
-0.6332124, 0.4127123, -0.4134256, 0.5372549, 1, 0, 1,
-0.6298105, 0.4599328, -2.052134, 0.5294118, 1, 0, 1,
-0.6295969, 0.8129855, -0.3307982, 0.5254902, 1, 0, 1,
-0.6249563, -0.2081427, -2.206762, 0.5176471, 1, 0, 1,
-0.6205009, -0.6861964, -2.761251, 0.5137255, 1, 0, 1,
-0.614882, 0.2697421, 0.5473931, 0.5058824, 1, 0, 1,
-0.6115274, -0.0003728712, -1.777422, 0.5019608, 1, 0, 1,
-0.6104111, -0.4046571, -1.576738, 0.4941176, 1, 0, 1,
-0.6060291, -0.4012607, -3.802664, 0.4862745, 1, 0, 1,
-0.60408, -0.7533846, -4.25, 0.4823529, 1, 0, 1,
-0.5948643, 0.4390637, -0.765525, 0.4745098, 1, 0, 1,
-0.5928491, -0.7013368, -2.749455, 0.4705882, 1, 0, 1,
-0.5874435, -0.3360635, -2.529219, 0.4627451, 1, 0, 1,
-0.5838347, 0.8513197, 1.710624, 0.4588235, 1, 0, 1,
-0.5836287, -0.5754518, -0.8692549, 0.4509804, 1, 0, 1,
-0.5712157, 0.1413424, -1.503872, 0.4470588, 1, 0, 1,
-0.5653896, -0.7167309, -2.857157, 0.4392157, 1, 0, 1,
-0.564818, 1.672565, 0.1857244, 0.4352941, 1, 0, 1,
-0.5632566, 0.2354978, -1.844142, 0.427451, 1, 0, 1,
-0.5593677, 0.8937032, -1.476848, 0.4235294, 1, 0, 1,
-0.5571342, 2.703719, -0.9311712, 0.4156863, 1, 0, 1,
-0.5491729, 0.1992847, -2.690659, 0.4117647, 1, 0, 1,
-0.5489275, -2.070797, -3.368376, 0.4039216, 1, 0, 1,
-0.5474716, -0.7053881, -3.251752, 0.3960784, 1, 0, 1,
-0.5403532, 1.720427, 0.9417748, 0.3921569, 1, 0, 1,
-0.539395, 0.8649393, 1.00294, 0.3843137, 1, 0, 1,
-0.5386802, -0.2181219, -0.9752148, 0.3803922, 1, 0, 1,
-0.5315285, 1.324088, 0.291457, 0.372549, 1, 0, 1,
-0.5301117, -0.02425582, -0.6631198, 0.3686275, 1, 0, 1,
-0.5297311, 0.2971153, 0.1519715, 0.3607843, 1, 0, 1,
-0.5285248, -2.065664, -3.476207, 0.3568628, 1, 0, 1,
-0.5250971, -0.03428403, -0.7737169, 0.3490196, 1, 0, 1,
-0.5250365, 1.934909, -0.2333955, 0.345098, 1, 0, 1,
-0.5187832, -1.963789, -4.673708, 0.3372549, 1, 0, 1,
-0.5145704, 0.5919738, -0.8267928, 0.3333333, 1, 0, 1,
-0.5125835, 0.7948924, 0.4196774, 0.3254902, 1, 0, 1,
-0.4999487, -0.6040801, -1.736354, 0.3215686, 1, 0, 1,
-0.4975479, 0.1278573, -2.470381, 0.3137255, 1, 0, 1,
-0.4916801, -1.097961, -1.259443, 0.3098039, 1, 0, 1,
-0.4916042, -0.6810574, -2.236569, 0.3019608, 1, 0, 1,
-0.487403, -0.3502607, -3.978013, 0.2941177, 1, 0, 1,
-0.484823, 0.6169703, -0.5218577, 0.2901961, 1, 0, 1,
-0.4828205, 1.077889, -0.8011781, 0.282353, 1, 0, 1,
-0.4828022, 1.265427, 0.08984065, 0.2784314, 1, 0, 1,
-0.4792601, 0.0150646, -1.456238, 0.2705882, 1, 0, 1,
-0.478496, -0.4068642, -2.506561, 0.2666667, 1, 0, 1,
-0.4757179, 0.4817269, -1.291053, 0.2588235, 1, 0, 1,
-0.4665143, -0.350079, -1.21107, 0.254902, 1, 0, 1,
-0.4656024, -0.1358564, -2.153002, 0.2470588, 1, 0, 1,
-0.4619369, 1.117985, -1.243207, 0.2431373, 1, 0, 1,
-0.4597424, 0.5640306, -0.667248, 0.2352941, 1, 0, 1,
-0.4509193, 1.80582, -0.02679443, 0.2313726, 1, 0, 1,
-0.449355, -0.04546496, -1.668417, 0.2235294, 1, 0, 1,
-0.440468, -2.497123, -4.084026, 0.2196078, 1, 0, 1,
-0.4399515, 0.5792455, 0.7289265, 0.2117647, 1, 0, 1,
-0.4379445, 0.9110765, 0.4311578, 0.2078431, 1, 0, 1,
-0.4368064, -0.2165541, -2.487486, 0.2, 1, 0, 1,
-0.4366384, 0.2717038, 0.5000724, 0.1921569, 1, 0, 1,
-0.4361112, 1.349682, -0.01698575, 0.1882353, 1, 0, 1,
-0.4338496, 1.574775, 0.373115, 0.1803922, 1, 0, 1,
-0.4326368, 1.20803, -0.6201392, 0.1764706, 1, 0, 1,
-0.4311126, 1.642528, 0.8291785, 0.1686275, 1, 0, 1,
-0.4255828, -1.315921, -1.653762, 0.1647059, 1, 0, 1,
-0.4206901, -0.3491907, -0.7275844, 0.1568628, 1, 0, 1,
-0.4150996, -1.3174, -2.888636, 0.1529412, 1, 0, 1,
-0.4150089, -0.973699, -1.644771, 0.145098, 1, 0, 1,
-0.4145756, 0.3690451, -0.3073464, 0.1411765, 1, 0, 1,
-0.4118807, 1.405837, -1.115722, 0.1333333, 1, 0, 1,
-0.4109015, 2.050458, -0.9698352, 0.1294118, 1, 0, 1,
-0.4075683, -1.870257, -3.217335, 0.1215686, 1, 0, 1,
-0.4010477, 0.5086707, -0.2578234, 0.1176471, 1, 0, 1,
-0.3895989, 1.460624, 0.2136131, 0.1098039, 1, 0, 1,
-0.3891122, -0.2202814, -3.066818, 0.1058824, 1, 0, 1,
-0.3883163, -0.9400253, -4.706752, 0.09803922, 1, 0, 1,
-0.3872479, -0.005551272, 0.1908244, 0.09019608, 1, 0, 1,
-0.386921, 0.008986508, -1.777173, 0.08627451, 1, 0, 1,
-0.3836811, 0.3940324, -0.6950464, 0.07843138, 1, 0, 1,
-0.3788489, -0.3909529, -3.041848, 0.07450981, 1, 0, 1,
-0.3748134, 0.9377794, 0.9912571, 0.06666667, 1, 0, 1,
-0.3745763, 0.09306773, 0.8573291, 0.0627451, 1, 0, 1,
-0.3704532, -0.1767004, -1.518105, 0.05490196, 1, 0, 1,
-0.3623034, -0.8316944, -3.529231, 0.05098039, 1, 0, 1,
-0.35948, -0.1686199, -1.082849, 0.04313726, 1, 0, 1,
-0.358958, -0.9388917, -3.708896, 0.03921569, 1, 0, 1,
-0.3585361, 0.4714198, -2.111991, 0.03137255, 1, 0, 1,
-0.3581794, -0.8091717, -2.875326, 0.02745098, 1, 0, 1,
-0.3545663, -0.6724755, -1.595822, 0.01960784, 1, 0, 1,
-0.3475985, -0.9892988, -1.89766, 0.01568628, 1, 0, 1,
-0.3470574, 0.1441419, -0.3766092, 0.007843138, 1, 0, 1,
-0.3457154, 0.58061, -0.03305937, 0.003921569, 1, 0, 1,
-0.3378066, 0.8126876, 0.2205612, 0, 1, 0.003921569, 1,
-0.3363196, 2.438373, 0.8957055, 0, 1, 0.01176471, 1,
-0.3306759, -1.349412, -3.235898, 0, 1, 0.01568628, 1,
-0.3279349, 0.377838, -0.8930983, 0, 1, 0.02352941, 1,
-0.3279324, 2.518157, 1.982537, 0, 1, 0.02745098, 1,
-0.3236558, 1.303485, 1.630614, 0, 1, 0.03529412, 1,
-0.3233884, 1.079067, -0.8391448, 0, 1, 0.03921569, 1,
-0.3209269, 0.4203507, -2.450021, 0, 1, 0.04705882, 1,
-0.31928, -0.4003231, -1.324246, 0, 1, 0.05098039, 1,
-0.3192617, -1.257529, -3.006336, 0, 1, 0.05882353, 1,
-0.3162111, -0.3782504, -3.256465, 0, 1, 0.0627451, 1,
-0.3131066, 0.5342097, -0.9945966, 0, 1, 0.07058824, 1,
-0.3125781, -1.627167, -1.285053, 0, 1, 0.07450981, 1,
-0.310005, 1.449073, -0.1826587, 0, 1, 0.08235294, 1,
-0.304919, 1.600476, -1.888853, 0, 1, 0.08627451, 1,
-0.3044572, 0.1642215, -0.5203053, 0, 1, 0.09411765, 1,
-0.3036089, -0.001030954, -1.378892, 0, 1, 0.1019608, 1,
-0.2996903, -0.4894924, -2.627303, 0, 1, 0.1058824, 1,
-0.2962189, 1.753362, 0.3543993, 0, 1, 0.1137255, 1,
-0.2911918, -0.8298364, -4.707017, 0, 1, 0.1176471, 1,
-0.2898962, -0.04659658, 0.3801022, 0, 1, 0.1254902, 1,
-0.2858826, 0.03775892, -0.9614607, 0, 1, 0.1294118, 1,
-0.2837704, -0.3716914, -4.794907, 0, 1, 0.1372549, 1,
-0.2820497, -0.5464619, -3.144349, 0, 1, 0.1411765, 1,
-0.278836, -0.5200362, -2.765005, 0, 1, 0.1490196, 1,
-0.273785, 0.6133477, 1.300549, 0, 1, 0.1529412, 1,
-0.2694215, 0.4893928, -1.975544, 0, 1, 0.1607843, 1,
-0.2684809, -0.5431494, -1.534158, 0, 1, 0.1647059, 1,
-0.2658861, 0.6752591, 0.9185805, 0, 1, 0.172549, 1,
-0.2642391, -0.7303861, -3.644048, 0, 1, 0.1764706, 1,
-0.2637666, 0.8949464, 1.369947, 0, 1, 0.1843137, 1,
-0.2609768, 0.7914766, 0.7549749, 0, 1, 0.1882353, 1,
-0.2585092, -0.3373701, -1.6154, 0, 1, 0.1960784, 1,
-0.2578916, 1.021315, 0.7176341, 0, 1, 0.2039216, 1,
-0.2564159, -0.9460049, -3.163085, 0, 1, 0.2078431, 1,
-0.2550429, 0.02664382, -1.680142, 0, 1, 0.2156863, 1,
-0.2548992, -0.9148081, -1.902062, 0, 1, 0.2196078, 1,
-0.2540889, -0.05074607, -1.870494, 0, 1, 0.227451, 1,
-0.242205, -1.071111, -3.568149, 0, 1, 0.2313726, 1,
-0.2394398, 0.08792365, -0.6918113, 0, 1, 0.2392157, 1,
-0.2317635, 0.5954656, -2.191272, 0, 1, 0.2431373, 1,
-0.2301719, -0.6909655, -3.099419, 0, 1, 0.2509804, 1,
-0.223499, -0.6832266, -4.317286, 0, 1, 0.254902, 1,
-0.2232381, 0.3592344, 0.6524332, 0, 1, 0.2627451, 1,
-0.2193219, -3.019617, -4.475758, 0, 1, 0.2666667, 1,
-0.2034718, 1.379226, -0.9919506, 0, 1, 0.2745098, 1,
-0.1976064, 1.170288, 2.101151, 0, 1, 0.2784314, 1,
-0.1967962, -0.853546, -2.040825, 0, 1, 0.2862745, 1,
-0.1951516, -2.082577, -2.86482, 0, 1, 0.2901961, 1,
-0.1933565, -1.821913, -3.773225, 0, 1, 0.2980392, 1,
-0.191731, -0.2196066, -1.987088, 0, 1, 0.3058824, 1,
-0.1862193, -1.340295, -2.224784, 0, 1, 0.3098039, 1,
-0.1828316, 1.742742, -0.2896542, 0, 1, 0.3176471, 1,
-0.180937, 0.2579852, 1.226673, 0, 1, 0.3215686, 1,
-0.178673, 0.4221455, 0.3333836, 0, 1, 0.3294118, 1,
-0.1774949, 0.6039085, 0.008317559, 0, 1, 0.3333333, 1,
-0.176538, 0.6584813, 1.216482, 0, 1, 0.3411765, 1,
-0.1747409, 0.4775026, -1.405071, 0, 1, 0.345098, 1,
-0.1741878, -1.096672, -3.231783, 0, 1, 0.3529412, 1,
-0.1738362, 0.5828649, -0.7347944, 0, 1, 0.3568628, 1,
-0.1727024, 0.6541013, 0.4687265, 0, 1, 0.3647059, 1,
-0.1722615, -0.02096672, -3.901214, 0, 1, 0.3686275, 1,
-0.1712444, 0.1687243, 1.473891, 0, 1, 0.3764706, 1,
-0.1707895, -0.1248823, -1.26288, 0, 1, 0.3803922, 1,
-0.1704395, -0.9297662, -2.039897, 0, 1, 0.3882353, 1,
-0.1655657, 0.368452, -1.441615, 0, 1, 0.3921569, 1,
-0.1646088, -0.1593165, -3.585584, 0, 1, 0.4, 1,
-0.1639402, 0.7682712, 0.4019024, 0, 1, 0.4078431, 1,
-0.1621891, 0.05984074, -3.155574, 0, 1, 0.4117647, 1,
-0.1611499, 0.5686824, -0.5159057, 0, 1, 0.4196078, 1,
-0.1611277, 1.322227, -0.3776915, 0, 1, 0.4235294, 1,
-0.1580603, 1.838847, 1.034905, 0, 1, 0.4313726, 1,
-0.1577709, -0.6806121, -2.822493, 0, 1, 0.4352941, 1,
-0.1563717, -1.007865, -2.440035, 0, 1, 0.4431373, 1,
-0.1556937, 0.5861827, -1.305472, 0, 1, 0.4470588, 1,
-0.1512468, 1.361582, 0.5522355, 0, 1, 0.454902, 1,
-0.1503936, 1.052274, -3.116555, 0, 1, 0.4588235, 1,
-0.1478394, -0.9512902, -2.988241, 0, 1, 0.4666667, 1,
-0.1440767, 0.7109454, -1.698081, 0, 1, 0.4705882, 1,
-0.1423974, -0.8359503, -2.260257, 0, 1, 0.4784314, 1,
-0.1423683, 1.474041, -2.276194, 0, 1, 0.4823529, 1,
-0.1351693, 0.3727694, -1.772423, 0, 1, 0.4901961, 1,
-0.1326569, 0.521075, -0.01496233, 0, 1, 0.4941176, 1,
-0.1321049, -0.01704368, -2.581075, 0, 1, 0.5019608, 1,
-0.130035, 0.0130251, -0.8363118, 0, 1, 0.509804, 1,
-0.1265626, 1.632761, -0.4015882, 0, 1, 0.5137255, 1,
-0.1234106, -0.2088122, -1.818621, 0, 1, 0.5215687, 1,
-0.1205696, -0.3145064, -3.498684, 0, 1, 0.5254902, 1,
-0.1201002, -0.144707, -3.612502, 0, 1, 0.5333334, 1,
-0.119165, 1.954254, -2.639294, 0, 1, 0.5372549, 1,
-0.1166154, -0.9739148, -2.802903, 0, 1, 0.5450981, 1,
-0.1150696, -0.5048617, -2.85014, 0, 1, 0.5490196, 1,
-0.1088766, 1.872563, 0.2300475, 0, 1, 0.5568628, 1,
-0.1083796, 0.4219576, -0.6220943, 0, 1, 0.5607843, 1,
-0.108011, -0.2765649, -1.661795, 0, 1, 0.5686275, 1,
-0.1069784, -0.6680701, -3.37514, 0, 1, 0.572549, 1,
-0.1057123, -1.105035, -5.685503, 0, 1, 0.5803922, 1,
-0.101746, -0.2907262, -3.159807, 0, 1, 0.5843138, 1,
-0.1014258, 0.2657101, -0.3257034, 0, 1, 0.5921569, 1,
-0.09747916, -0.5396621, -2.895541, 0, 1, 0.5960785, 1,
-0.09597403, 1.52194, 0.3309219, 0, 1, 0.6039216, 1,
-0.09482685, -1.379127, -4.465209, 0, 1, 0.6117647, 1,
-0.08956313, -0.615239, -3.573175, 0, 1, 0.6156863, 1,
-0.08735277, -1.448423, -3.532127, 0, 1, 0.6235294, 1,
-0.08498646, -1.342926, -3.675339, 0, 1, 0.627451, 1,
-0.08291437, -0.8335344, -3.374156, 0, 1, 0.6352941, 1,
-0.082072, -0.1035056, -2.234329, 0, 1, 0.6392157, 1,
-0.07953001, -0.9458418, -3.261571, 0, 1, 0.6470588, 1,
-0.07833186, 0.4494525, -0.01999908, 0, 1, 0.6509804, 1,
-0.07630599, -0.9229916, -4.994351, 0, 1, 0.6588235, 1,
-0.07590672, 0.1005755, 0.4260157, 0, 1, 0.6627451, 1,
-0.07470126, -1.605644, -1.501062, 0, 1, 0.6705883, 1,
-0.07460288, 0.4293356, 2.165061, 0, 1, 0.6745098, 1,
-0.07340286, -1.427265, -3.294159, 0, 1, 0.682353, 1,
-0.07271534, 0.2063909, -0.4342343, 0, 1, 0.6862745, 1,
-0.0720601, -0.07458135, -3.798911, 0, 1, 0.6941177, 1,
-0.07197956, -0.6387576, -3.503367, 0, 1, 0.7019608, 1,
-0.07177353, 1.159461, -1.976151, 0, 1, 0.7058824, 1,
-0.07078626, 0.4074268, -0.7401213, 0, 1, 0.7137255, 1,
-0.07042462, -1.501396, -3.829491, 0, 1, 0.7176471, 1,
-0.07012022, 1.005428, 0.1758061, 0, 1, 0.7254902, 1,
-0.06754706, -0.3864893, -2.110645, 0, 1, 0.7294118, 1,
-0.06613132, -0.1122139, -2.996699, 0, 1, 0.7372549, 1,
-0.06454316, 0.3456638, -2.280063, 0, 1, 0.7411765, 1,
-0.06371111, 0.08410128, -1.723026, 0, 1, 0.7490196, 1,
-0.06245222, -0.01235848, -2.715902, 0, 1, 0.7529412, 1,
-0.05965336, -0.150726, -3.117646, 0, 1, 0.7607843, 1,
-0.05571976, -0.3815026, -3.681743, 0, 1, 0.7647059, 1,
-0.05496199, -0.7708845, -1.802326, 0, 1, 0.772549, 1,
-0.05425423, 0.6330164, -1.227843, 0, 1, 0.7764706, 1,
-0.04885627, -0.6216735, -2.278678, 0, 1, 0.7843137, 1,
-0.0456476, 1.062262, -0.2416473, 0, 1, 0.7882353, 1,
-0.04193197, -0.7963755, -2.942104, 0, 1, 0.7960784, 1,
-0.04136267, -0.902973, -2.525781, 0, 1, 0.8039216, 1,
-0.04105645, -0.455164, -2.351412, 0, 1, 0.8078431, 1,
-0.03985472, -3.918414, -2.683012, 0, 1, 0.8156863, 1,
-0.03596293, -2.101763, -3.98507, 0, 1, 0.8196079, 1,
-0.02890028, -0.1890151, -4.894886, 0, 1, 0.827451, 1,
-0.02810038, 0.08626758, -1.8414, 0, 1, 0.8313726, 1,
-0.02751449, -0.5972917, -2.931426, 0, 1, 0.8392157, 1,
-0.02428932, -2.049174, -2.640055, 0, 1, 0.8431373, 1,
-0.02274899, 0.4063835, -0.2893425, 0, 1, 0.8509804, 1,
-0.02273216, 0.6030908, -0.8158121, 0, 1, 0.854902, 1,
-0.02041214, -0.9244797, -2.441585, 0, 1, 0.8627451, 1,
-0.01501002, 0.3974509, 0.7592839, 0, 1, 0.8666667, 1,
-0.01458784, -0.2395023, -2.256197, 0, 1, 0.8745098, 1,
-0.01238347, -0.762956, -1.745239, 0, 1, 0.8784314, 1,
-0.01125707, -0.9504611, -2.940717, 0, 1, 0.8862745, 1,
-0.00972637, 0.4543679, 1.520898, 0, 1, 0.8901961, 1,
-0.00658321, 1.373349, 0.7245348, 0, 1, 0.8980392, 1,
-0.005433598, 0.6157136, -0.2103701, 0, 1, 0.9058824, 1,
0.0004336101, 0.7131742, 0.8259084, 0, 1, 0.9098039, 1,
0.001236605, 1.376043, -0.3580795, 0, 1, 0.9176471, 1,
0.002364576, -0.0149238, 3.35474, 0, 1, 0.9215686, 1,
0.005825185, -1.114969, 2.883837, 0, 1, 0.9294118, 1,
0.006331007, 0.426076, -0.3001077, 0, 1, 0.9333333, 1,
0.007241113, 1.012966, 0.1263992, 0, 1, 0.9411765, 1,
0.008725541, 1.290507, -0.7338191, 0, 1, 0.945098, 1,
0.009035659, -1.660293, 2.405808, 0, 1, 0.9529412, 1,
0.01350732, -0.4884458, 3.999538, 0, 1, 0.9568627, 1,
0.01353168, -0.4816251, 4.641519, 0, 1, 0.9647059, 1,
0.01461628, 1.458265, 0.8092686, 0, 1, 0.9686275, 1,
0.01832688, -0.3230473, 2.042645, 0, 1, 0.9764706, 1,
0.01851935, -0.2275705, 2.338842, 0, 1, 0.9803922, 1,
0.02047287, 0.5275396, -0.629159, 0, 1, 0.9882353, 1,
0.02092038, 0.7027324, 0.6257566, 0, 1, 0.9921569, 1,
0.02300725, 0.6202938, 3.165105, 0, 1, 1, 1,
0.02731106, 1.539712, -0.8389643, 0, 0.9921569, 1, 1,
0.02804846, -1.471388, 1.73765, 0, 0.9882353, 1, 1,
0.03227109, -0.5865596, 3.287653, 0, 0.9803922, 1, 1,
0.03238945, 0.6746305, 0.2645446, 0, 0.9764706, 1, 1,
0.03302555, 0.2702733, 1.477334, 0, 0.9686275, 1, 1,
0.0347726, -0.1114535, 2.331335, 0, 0.9647059, 1, 1,
0.03524606, -0.6922459, 1.286445, 0, 0.9568627, 1, 1,
0.03591625, -0.3894091, 3.94252, 0, 0.9529412, 1, 1,
0.03764369, -0.5798216, 2.150095, 0, 0.945098, 1, 1,
0.03915794, -0.6925643, 4.064621, 0, 0.9411765, 1, 1,
0.03936333, -0.3100731, 2.416855, 0, 0.9333333, 1, 1,
0.04371113, -0.1886646, 2.663322, 0, 0.9294118, 1, 1,
0.04493858, 0.3752097, 1.240744, 0, 0.9215686, 1, 1,
0.04523953, -1.074663, 4.093243, 0, 0.9176471, 1, 1,
0.04603074, 1.423352, 1.762406, 0, 0.9098039, 1, 1,
0.04659728, -0.4182167, 2.96059, 0, 0.9058824, 1, 1,
0.04802825, -0.4620463, 4.400645, 0, 0.8980392, 1, 1,
0.05325074, -0.6805554, 4.192721, 0, 0.8901961, 1, 1,
0.05538643, 0.09688661, 1.452723, 0, 0.8862745, 1, 1,
0.05584471, -0.04794409, 0.9184857, 0, 0.8784314, 1, 1,
0.06061972, -1.487812, 1.998083, 0, 0.8745098, 1, 1,
0.06248995, 0.1080917, 1.307503, 0, 0.8666667, 1, 1,
0.06308641, 1.689044, 0.1417963, 0, 0.8627451, 1, 1,
0.06471497, -0.8745388, 1.910789, 0, 0.854902, 1, 1,
0.06604764, 0.5525579, 0.4654531, 0, 0.8509804, 1, 1,
0.06735058, 0.3170175, -1.701862, 0, 0.8431373, 1, 1,
0.07314665, 0.6715791, 2.237365, 0, 0.8392157, 1, 1,
0.07431269, 0.02119273, 1.697959, 0, 0.8313726, 1, 1,
0.07676808, 0.2258824, -1.271824, 0, 0.827451, 1, 1,
0.07704148, -1.04258, 4.944573, 0, 0.8196079, 1, 1,
0.07883705, 0.07150598, -0.5699298, 0, 0.8156863, 1, 1,
0.0812849, -1.214823, 5.151954, 0, 0.8078431, 1, 1,
0.08207388, 0.9433616, 1.204625, 0, 0.8039216, 1, 1,
0.08580709, 0.5992832, 0.1010669, 0, 0.7960784, 1, 1,
0.08644252, 1.136109, 0.08835718, 0, 0.7882353, 1, 1,
0.0882282, -2.04943, 1.305046, 0, 0.7843137, 1, 1,
0.09027141, -1.693918, 2.350294, 0, 0.7764706, 1, 1,
0.09439567, 0.1331228, 0.4473726, 0, 0.772549, 1, 1,
0.09741316, -0.5129418, 5.015537, 0, 0.7647059, 1, 1,
0.1071727, -0.6374338, 3.012019, 0, 0.7607843, 1, 1,
0.1071844, 0.1008922, 0.2398334, 0, 0.7529412, 1, 1,
0.1072191, 0.6144366, -0.5251572, 0, 0.7490196, 1, 1,
0.1098941, 0.2757298, -0.1730682, 0, 0.7411765, 1, 1,
0.1122598, -0.7035006, 4.003526, 0, 0.7372549, 1, 1,
0.1142098, 0.8784806, 0.1021142, 0, 0.7294118, 1, 1,
0.1155334, -2.302676, 3.602629, 0, 0.7254902, 1, 1,
0.1208318, 0.5691164, -0.1289346, 0, 0.7176471, 1, 1,
0.1218062, 1.187859, 1.537756, 0, 0.7137255, 1, 1,
0.1263151, -1.239282, 2.512707, 0, 0.7058824, 1, 1,
0.1276857, 0.9678587, -0.4904979, 0, 0.6980392, 1, 1,
0.1321731, 0.01146131, 1.375839, 0, 0.6941177, 1, 1,
0.1373576, -0.1515761, 2.161396, 0, 0.6862745, 1, 1,
0.1420625, 0.6085704, 0.2802061, 0, 0.682353, 1, 1,
0.1432905, -0.3066751, 1.313154, 0, 0.6745098, 1, 1,
0.1480314, -0.5718591, 3.187809, 0, 0.6705883, 1, 1,
0.1494395, 0.9905902, -0.08169229, 0, 0.6627451, 1, 1,
0.1507838, 0.9683145, 0.6068706, 0, 0.6588235, 1, 1,
0.1515878, 0.5837334, 0.6710034, 0, 0.6509804, 1, 1,
0.1517207, 1.130917, -0.07727479, 0, 0.6470588, 1, 1,
0.1528883, 0.05971007, 1.453689, 0, 0.6392157, 1, 1,
0.152929, -1.437871, 3.449012, 0, 0.6352941, 1, 1,
0.1581109, 0.164331, 1.0986, 0, 0.627451, 1, 1,
0.1607055, -1.580854, 2.558873, 0, 0.6235294, 1, 1,
0.1664045, -0.5717161, 2.635724, 0, 0.6156863, 1, 1,
0.1674264, -0.4946236, 3.596522, 0, 0.6117647, 1, 1,
0.1713208, 0.3618331, -0.7436084, 0, 0.6039216, 1, 1,
0.1726712, 0.7572832, 0.01138781, 0, 0.5960785, 1, 1,
0.1804951, 0.5178367, -0.7001294, 0, 0.5921569, 1, 1,
0.1848887, 0.2725311, 1.236283, 0, 0.5843138, 1, 1,
0.1861233, -0.8562139, 2.15321, 0, 0.5803922, 1, 1,
0.1869362, 0.9604785, 0.4566868, 0, 0.572549, 1, 1,
0.1976938, -0.266489, 2.683454, 0, 0.5686275, 1, 1,
0.1985103, -0.5432035, 3.606994, 0, 0.5607843, 1, 1,
0.2015071, -1.214236, 3.457531, 0, 0.5568628, 1, 1,
0.2084156, 1.029321, -0.5543522, 0, 0.5490196, 1, 1,
0.2098889, -0.8646812, 2.198965, 0, 0.5450981, 1, 1,
0.2183917, 0.9235042, 1.052373, 0, 0.5372549, 1, 1,
0.221185, -0.7685943, 1.246984, 0, 0.5333334, 1, 1,
0.2226401, 1.509323, -0.09741693, 0, 0.5254902, 1, 1,
0.2266956, 0.2944338, 0.7989377, 0, 0.5215687, 1, 1,
0.2368318, 1.222028, -0.09128959, 0, 0.5137255, 1, 1,
0.241476, 0.824096, -0.7690089, 0, 0.509804, 1, 1,
0.2430441, 0.212432, 2.787827, 0, 0.5019608, 1, 1,
0.245844, 1.109088, 1.584518, 0, 0.4941176, 1, 1,
0.2485464, -0.09487002, 1.954885, 0, 0.4901961, 1, 1,
0.2497026, -0.941877, 1.596125, 0, 0.4823529, 1, 1,
0.2501143, -0.9186808, 3.021036, 0, 0.4784314, 1, 1,
0.2505035, -1.76063, 2.076549, 0, 0.4705882, 1, 1,
0.255527, -0.5066789, 1.632188, 0, 0.4666667, 1, 1,
0.2558643, -0.7671164, 2.9148, 0, 0.4588235, 1, 1,
0.2618583, 0.02637544, 0.5579656, 0, 0.454902, 1, 1,
0.2653766, 0.9667428, -0.06914759, 0, 0.4470588, 1, 1,
0.2659987, -0.2276472, 3.024409, 0, 0.4431373, 1, 1,
0.2675113, -0.6485955, 2.463164, 0, 0.4352941, 1, 1,
0.270732, 0.1443107, -1.296006, 0, 0.4313726, 1, 1,
0.2708801, 0.5716066, 0.1077953, 0, 0.4235294, 1, 1,
0.275235, 1.108062, 1.343996, 0, 0.4196078, 1, 1,
0.2755041, 1.30995, 1.062989, 0, 0.4117647, 1, 1,
0.2759948, 0.5477045, 1.078742, 0, 0.4078431, 1, 1,
0.2780494, 0.9550122, -0.7417223, 0, 0.4, 1, 1,
0.2796018, -1.918009, 4.195135, 0, 0.3921569, 1, 1,
0.2824222, -0.5321847, 1.250463, 0, 0.3882353, 1, 1,
0.2830962, 0.371896, 0.7111312, 0, 0.3803922, 1, 1,
0.2834451, 0.3617645, 0.08200356, 0, 0.3764706, 1, 1,
0.284458, 1.144701, -0.1443002, 0, 0.3686275, 1, 1,
0.2885986, -0.1802594, 0.9462446, 0, 0.3647059, 1, 1,
0.2895002, 0.214491, -0.8062102, 0, 0.3568628, 1, 1,
0.2905859, 0.2789022, 2.701017, 0, 0.3529412, 1, 1,
0.2918094, 1.370553, 0.8642641, 0, 0.345098, 1, 1,
0.295329, 0.2010039, 1.237561, 0, 0.3411765, 1, 1,
0.2954996, -0.05158045, 3.339581, 0, 0.3333333, 1, 1,
0.2967199, 0.6751374, 2.145487, 0, 0.3294118, 1, 1,
0.2991936, -0.4922196, 2.225825, 0, 0.3215686, 1, 1,
0.2995661, 0.04583817, 0.7178093, 0, 0.3176471, 1, 1,
0.3001191, 0.9308618, 0.1153433, 0, 0.3098039, 1, 1,
0.3028216, 0.4047608, 0.02526382, 0, 0.3058824, 1, 1,
0.302988, 1.607784, -0.08572548, 0, 0.2980392, 1, 1,
0.3064467, -0.6131768, 3.332181, 0, 0.2901961, 1, 1,
0.3116869, 0.05888129, 2.263346, 0, 0.2862745, 1, 1,
0.31514, -0.6780863, 3.33018, 0, 0.2784314, 1, 1,
0.3156472, 0.8783637, 1.36064, 0, 0.2745098, 1, 1,
0.3166921, -0.9977114, 2.950534, 0, 0.2666667, 1, 1,
0.3183511, 1.48372, -0.2250897, 0, 0.2627451, 1, 1,
0.3204771, -0.4616214, 3.845082, 0, 0.254902, 1, 1,
0.3282424, 1.339024, 0.7193889, 0, 0.2509804, 1, 1,
0.3295797, -1.325593, 3.658536, 0, 0.2431373, 1, 1,
0.3490332, -0.2325923, 1.460068, 0, 0.2392157, 1, 1,
0.3536216, 1.129424, 0.6482517, 0, 0.2313726, 1, 1,
0.3575437, 1.42347, -1.276375, 0, 0.227451, 1, 1,
0.3600144, 1.03812, 1.345495, 0, 0.2196078, 1, 1,
0.367032, -0.1447876, 3.413692, 0, 0.2156863, 1, 1,
0.3710787, -0.1887726, 0.8892385, 0, 0.2078431, 1, 1,
0.3752702, 0.3254323, -0.09085543, 0, 0.2039216, 1, 1,
0.3766376, 0.7853799, 1.790168, 0, 0.1960784, 1, 1,
0.3793142, -1.143695, 3.192929, 0, 0.1882353, 1, 1,
0.3856739, -1.873971, 2.325064, 0, 0.1843137, 1, 1,
0.3862565, 0.0680003, 1.148541, 0, 0.1764706, 1, 1,
0.3942842, 1.501347, -0.292517, 0, 0.172549, 1, 1,
0.4004755, 1.386161, -0.8304008, 0, 0.1647059, 1, 1,
0.4012072, 0.972164, -0.6446323, 0, 0.1607843, 1, 1,
0.4026953, -1.333914, 4.52082, 0, 0.1529412, 1, 1,
0.4033476, 1.095712, 0.3401463, 0, 0.1490196, 1, 1,
0.40615, -0.785187, 2.008824, 0, 0.1411765, 1, 1,
0.4072494, -0.3281787, 2.351784, 0, 0.1372549, 1, 1,
0.4079483, -0.7354546, 2.430676, 0, 0.1294118, 1, 1,
0.4092353, 0.4814575, -0.375262, 0, 0.1254902, 1, 1,
0.4128447, 2.327655, -0.1854829, 0, 0.1176471, 1, 1,
0.41295, 0.4815121, 0.2954916, 0, 0.1137255, 1, 1,
0.4171774, -0.1400165, 1.605495, 0, 0.1058824, 1, 1,
0.4191853, 1.007041, 0.7182826, 0, 0.09803922, 1, 1,
0.4209014, 0.1510657, 1.201578, 0, 0.09411765, 1, 1,
0.4214919, 0.09262096, 2.078879, 0, 0.08627451, 1, 1,
0.4312409, 0.8682858, 0.8240918, 0, 0.08235294, 1, 1,
0.4376983, -1.699197, 2.656496, 0, 0.07450981, 1, 1,
0.4384022, 0.5061212, -0.3888984, 0, 0.07058824, 1, 1,
0.4388191, -0.9842945, 2.169804, 0, 0.0627451, 1, 1,
0.443783, 0.205293, 1.155548, 0, 0.05882353, 1, 1,
0.4472229, 0.1734334, 0.6520479, 0, 0.05098039, 1, 1,
0.4484125, -0.3649383, 1.20734, 0, 0.04705882, 1, 1,
0.4495568, -1.261287, 3.136481, 0, 0.03921569, 1, 1,
0.4515506, -0.09372815, 2.979756, 0, 0.03529412, 1, 1,
0.4527792, 1.285222, 1.527468, 0, 0.02745098, 1, 1,
0.4528753, -1.075716, 2.722262, 0, 0.02352941, 1, 1,
0.456314, -0.7858095, 3.761223, 0, 0.01568628, 1, 1,
0.4568796, -1.155634, 3.356403, 0, 0.01176471, 1, 1,
0.4584144, 1.042983, 0.8426248, 0, 0.003921569, 1, 1,
0.4619291, 1.548106, 1.737125, 0.003921569, 0, 1, 1,
0.462844, -0.9595318, 3.293784, 0.007843138, 0, 1, 1,
0.4660135, 1.080698, 1.604351, 0.01568628, 0, 1, 1,
0.4665635, 0.3310643, 1.510355, 0.01960784, 0, 1, 1,
0.4697838, -0.8012641, 3.320369, 0.02745098, 0, 1, 1,
0.4792228, -0.2928962, 2.143125, 0.03137255, 0, 1, 1,
0.4847471, 0.7326938, 1.92282, 0.03921569, 0, 1, 1,
0.4969022, 0.9362696, 0.7541949, 0.04313726, 0, 1, 1,
0.500711, 0.002533045, 2.456568, 0.05098039, 0, 1, 1,
0.5066774, -2.73753, 1.602304, 0.05490196, 0, 1, 1,
0.5067383, -0.311107, 2.836857, 0.0627451, 0, 1, 1,
0.5072028, -0.6274074, 2.048661, 0.06666667, 0, 1, 1,
0.5072366, -0.07029057, 2.418087, 0.07450981, 0, 1, 1,
0.5084445, 0.2580703, 1.552995, 0.07843138, 0, 1, 1,
0.5124812, 1.929787, -0.5262998, 0.08627451, 0, 1, 1,
0.5178643, 1.141056, -0.7388933, 0.09019608, 0, 1, 1,
0.5180395, 1.965127, 0.6732165, 0.09803922, 0, 1, 1,
0.5229478, 0.226011, 1.746705, 0.1058824, 0, 1, 1,
0.5240253, -0.2956336, 2.867157, 0.1098039, 0, 1, 1,
0.5290161, 0.009987584, 0.6373783, 0.1176471, 0, 1, 1,
0.5312756, -0.3977779, -0.3405826, 0.1215686, 0, 1, 1,
0.5346347, 0.5576508, 1.388055, 0.1294118, 0, 1, 1,
0.5417934, -1.22677, 2.30184, 0.1333333, 0, 1, 1,
0.5490954, 0.246874, 0.7914655, 0.1411765, 0, 1, 1,
0.552299, 2.010218, 0.9008872, 0.145098, 0, 1, 1,
0.5563974, 0.08788073, 1.629762, 0.1529412, 0, 1, 1,
0.5566204, 1.251958, -1.81834, 0.1568628, 0, 1, 1,
0.5566783, -1.073403, 4.271025, 0.1647059, 0, 1, 1,
0.5569349, 0.557173, -0.8323683, 0.1686275, 0, 1, 1,
0.5570881, 0.2396211, 1.438967, 0.1764706, 0, 1, 1,
0.5604407, -2.094474, 4.108903, 0.1803922, 0, 1, 1,
0.5612692, 0.6365663, 0.2492926, 0.1882353, 0, 1, 1,
0.5659634, 0.256977, 2.035044, 0.1921569, 0, 1, 1,
0.5666256, 0.7154265, 1.506104, 0.2, 0, 1, 1,
0.5675267, 0.002574634, 0.6452312, 0.2078431, 0, 1, 1,
0.5679275, 1.624206, 1.783607, 0.2117647, 0, 1, 1,
0.5699947, -1.468555, 1.624988, 0.2196078, 0, 1, 1,
0.5718228, -2.039875, 2.857275, 0.2235294, 0, 1, 1,
0.5725061, 0.4502206, 2.445419, 0.2313726, 0, 1, 1,
0.5744535, 0.03356572, 1.207426, 0.2352941, 0, 1, 1,
0.5765679, -0.4150799, 2.79352, 0.2431373, 0, 1, 1,
0.5775785, 0.4113752, 0.7414767, 0.2470588, 0, 1, 1,
0.5856583, 1.372886, 1.255871, 0.254902, 0, 1, 1,
0.5858997, -1.277398, 2.255502, 0.2588235, 0, 1, 1,
0.5875105, 1.038841, 0.6172999, 0.2666667, 0, 1, 1,
0.5895583, 1.097793, -2.18627, 0.2705882, 0, 1, 1,
0.5908573, 0.7077112, 2.070234, 0.2784314, 0, 1, 1,
0.5951367, 1.226307, -1.65063, 0.282353, 0, 1, 1,
0.6003485, -0.5690226, 1.587288, 0.2901961, 0, 1, 1,
0.6038646, 0.7373905, 0.9420124, 0.2941177, 0, 1, 1,
0.6129221, -0.1402978, 1.034595, 0.3019608, 0, 1, 1,
0.6171023, -0.2094266, 0.2796959, 0.3098039, 0, 1, 1,
0.6299251, 0.7198059, 1.143224, 0.3137255, 0, 1, 1,
0.629998, 0.2854675, 2.426935, 0.3215686, 0, 1, 1,
0.6331211, -0.5462581, 1.175343, 0.3254902, 0, 1, 1,
0.6331245, 1.236806, 0.2079051, 0.3333333, 0, 1, 1,
0.6335976, 0.833625, 1.854143, 0.3372549, 0, 1, 1,
0.6351655, -1.034478, 2.709706, 0.345098, 0, 1, 1,
0.6406955, -0.8995292, 0.7467372, 0.3490196, 0, 1, 1,
0.6411641, -1.000493, 2.887022, 0.3568628, 0, 1, 1,
0.6442226, -0.1586744, 3.638169, 0.3607843, 0, 1, 1,
0.6468952, 0.3467573, 1.831949, 0.3686275, 0, 1, 1,
0.6496412, -0.331965, 2.575181, 0.372549, 0, 1, 1,
0.6521677, -0.08981206, 3.445083, 0.3803922, 0, 1, 1,
0.6551616, -1.082686, 2.041591, 0.3843137, 0, 1, 1,
0.65631, 0.9035582, -0.9357869, 0.3921569, 0, 1, 1,
0.6638976, 0.02429033, -0.1031946, 0.3960784, 0, 1, 1,
0.6682939, -2.813264, 3.511692, 0.4039216, 0, 1, 1,
0.6748967, -0.5018093, 2.430215, 0.4117647, 0, 1, 1,
0.6777191, 0.2309785, -0.8217781, 0.4156863, 0, 1, 1,
0.6791533, -1.300131, 2.848009, 0.4235294, 0, 1, 1,
0.6828694, 1.109178, 1.108259, 0.427451, 0, 1, 1,
0.6906794, -0.4460762, 1.701409, 0.4352941, 0, 1, 1,
0.6917698, -1.822158, 3.53397, 0.4392157, 0, 1, 1,
0.696209, 1.241922, 1.21463, 0.4470588, 0, 1, 1,
0.6971657, 0.8442874, 0.3814948, 0.4509804, 0, 1, 1,
0.6976768, 1.455315, 0.2921968, 0.4588235, 0, 1, 1,
0.7001312, -0.7634813, 1.952922, 0.4627451, 0, 1, 1,
0.7008591, -1.62175, 3.736675, 0.4705882, 0, 1, 1,
0.7031456, 1.616299, 1.261782, 0.4745098, 0, 1, 1,
0.7043429, 1.21844, 1.106564, 0.4823529, 0, 1, 1,
0.706332, -0.09875531, 1.080414, 0.4862745, 0, 1, 1,
0.7110311, -1.615584, 2.440263, 0.4941176, 0, 1, 1,
0.7129222, -1.742062, 2.591478, 0.5019608, 0, 1, 1,
0.7139112, -1.666611, 2.455518, 0.5058824, 0, 1, 1,
0.7181837, -0.3348911, 2.095746, 0.5137255, 0, 1, 1,
0.7317157, 0.9113706, 1.424234, 0.5176471, 0, 1, 1,
0.732495, -0.3119174, 1.44325, 0.5254902, 0, 1, 1,
0.7367443, -1.212442, 2.272472, 0.5294118, 0, 1, 1,
0.7378519, -1.215959, 3.445588, 0.5372549, 0, 1, 1,
0.7423463, -1.005589, 1.887024, 0.5411765, 0, 1, 1,
0.7464805, 0.4445791, 2.338889, 0.5490196, 0, 1, 1,
0.7550062, -1.900563, 1.30163, 0.5529412, 0, 1, 1,
0.7555252, 0.8323776, 0.4436114, 0.5607843, 0, 1, 1,
0.762591, 0.442787, 0.7906325, 0.5647059, 0, 1, 1,
0.7647468, 0.5122961, 1.612935, 0.572549, 0, 1, 1,
0.7657636, 0.4115608, 0.5408217, 0.5764706, 0, 1, 1,
0.7661354, -0.9390013, 3.691906, 0.5843138, 0, 1, 1,
0.7668074, 0.8798548, 3.012713, 0.5882353, 0, 1, 1,
0.7690483, 1.30893, 1.005194, 0.5960785, 0, 1, 1,
0.7751222, -2.063126, 2.359448, 0.6039216, 0, 1, 1,
0.7767336, -0.2023078, 2.264378, 0.6078432, 0, 1, 1,
0.7779119, -0.9984601, 1.610916, 0.6156863, 0, 1, 1,
0.7785246, -0.322441, 0.8349636, 0.6196079, 0, 1, 1,
0.7785428, 0.1140367, 1.615607, 0.627451, 0, 1, 1,
0.7842674, 0.569727, 1.101703, 0.6313726, 0, 1, 1,
0.7881718, 0.09957039, 3.1131, 0.6392157, 0, 1, 1,
0.7911582, 1.016441, 0.04575842, 0.6431373, 0, 1, 1,
0.7957816, -1.561434, 1.576949, 0.6509804, 0, 1, 1,
0.8035812, 0.5539976, -0.460133, 0.654902, 0, 1, 1,
0.8042891, 0.2665941, -0.3163029, 0.6627451, 0, 1, 1,
0.8048634, -1.566594, 1.17976, 0.6666667, 0, 1, 1,
0.8098387, 1.726537, -0.392699, 0.6745098, 0, 1, 1,
0.8149363, -2.384143, 2.763067, 0.6784314, 0, 1, 1,
0.8162944, -0.07029445, 0.3331804, 0.6862745, 0, 1, 1,
0.8163186, 0.2939362, 1.64193, 0.6901961, 0, 1, 1,
0.8209271, 0.02622807, 0.6853692, 0.6980392, 0, 1, 1,
0.8240123, 0.739711, 2.366968, 0.7058824, 0, 1, 1,
0.8243157, -0.1418427, 2.83559, 0.7098039, 0, 1, 1,
0.8249039, -1.405311, 2.576604, 0.7176471, 0, 1, 1,
0.8284317, -0.9899898, 3.4304, 0.7215686, 0, 1, 1,
0.8315886, -0.5902768, 2.433979, 0.7294118, 0, 1, 1,
0.831664, 1.049786, 2.650459, 0.7333333, 0, 1, 1,
0.8324946, -0.3158988, 2.615067, 0.7411765, 0, 1, 1,
0.834284, 1.212202, -0.4874631, 0.7450981, 0, 1, 1,
0.8346781, -0.3610148, 1.789475, 0.7529412, 0, 1, 1,
0.8363106, 1.318013, 2.055658, 0.7568628, 0, 1, 1,
0.8375681, 1.587789, -0.2409404, 0.7647059, 0, 1, 1,
0.8386562, 0.6495192, 1.224323, 0.7686275, 0, 1, 1,
0.8413136, -0.2847192, 1.801986, 0.7764706, 0, 1, 1,
0.8423674, -0.9998404, 3.150849, 0.7803922, 0, 1, 1,
0.8464305, 0.3443396, 1.293413, 0.7882353, 0, 1, 1,
0.8552215, 0.7379901, 0.09891276, 0.7921569, 0, 1, 1,
0.8561957, -0.4226413, 0.3990759, 0.8, 0, 1, 1,
0.8570597, 0.1727973, 1.417194, 0.8078431, 0, 1, 1,
0.8573407, 0.7037815, 0.006864603, 0.8117647, 0, 1, 1,
0.8730222, 0.4909803, 1.928961, 0.8196079, 0, 1, 1,
0.8816235, 1.810828, 1.763279, 0.8235294, 0, 1, 1,
0.8840426, -0.7058328, 2.688798, 0.8313726, 0, 1, 1,
0.8855197, -0.7020717, 4.211654, 0.8352941, 0, 1, 1,
0.8926039, 0.1612296, 0.9504065, 0.8431373, 0, 1, 1,
0.8963586, 0.9757289, 0.669589, 0.8470588, 0, 1, 1,
0.9014887, -0.2834539, 2.323483, 0.854902, 0, 1, 1,
0.9096758, 1.141738, 0.6970153, 0.8588235, 0, 1, 1,
0.9124088, 1.165197, -0.1431704, 0.8666667, 0, 1, 1,
0.9155188, 0.6782696, 0.1026606, 0.8705882, 0, 1, 1,
0.9163713, -0.7999983, 2.312907, 0.8784314, 0, 1, 1,
0.9235241, 0.6940912, 0.51271, 0.8823529, 0, 1, 1,
0.9253997, 0.2367275, 0.2976782, 0.8901961, 0, 1, 1,
0.925687, -1.483604, 3.97551, 0.8941177, 0, 1, 1,
0.9277772, -1.178119, 1.474661, 0.9019608, 0, 1, 1,
0.9288883, -0.06380425, 1.723489, 0.9098039, 0, 1, 1,
0.9311819, -0.6410059, 3.061574, 0.9137255, 0, 1, 1,
0.93151, 0.9743759, 0.05002046, 0.9215686, 0, 1, 1,
0.9328647, 1.223579, 0.769611, 0.9254902, 0, 1, 1,
0.935304, -1.603128, 1.887022, 0.9333333, 0, 1, 1,
0.9374388, 0.930083, 0.1955778, 0.9372549, 0, 1, 1,
0.9403482, -1.381564, 3.517774, 0.945098, 0, 1, 1,
0.9438342, 0.3062047, 0.07477408, 0.9490196, 0, 1, 1,
0.9457713, -0.8035401, 2.250907, 0.9568627, 0, 1, 1,
0.9524424, -0.6882641, 1.933774, 0.9607843, 0, 1, 1,
0.9545417, 0.4540741, 2.479201, 0.9686275, 0, 1, 1,
0.9555085, -0.01135024, 0.7587057, 0.972549, 0, 1, 1,
0.9602214, 0.9161474, -0.2535685, 0.9803922, 0, 1, 1,
0.9631457, 1.546375, 2.068665, 0.9843137, 0, 1, 1,
0.9634324, 0.3314515, 1.619457, 0.9921569, 0, 1, 1,
0.9660696, 0.8470035, 2.081177, 0.9960784, 0, 1, 1,
0.9698642, -0.8706252, 1.430405, 1, 0, 0.9960784, 1,
0.9706149, 0.8135259, -0.2506777, 1, 0, 0.9882353, 1,
0.9714172, 0.6412802, -1.299214, 1, 0, 0.9843137, 1,
0.9755415, -0.1475062, 0.7870549, 1, 0, 0.9764706, 1,
0.9757546, -1.192408, 2.975772, 1, 0, 0.972549, 1,
0.9769458, 0.9547467, 0.399724, 1, 0, 0.9647059, 1,
0.9813552, 0.436783, 1.814916, 1, 0, 0.9607843, 1,
0.9874017, 1.011723, -0.5172271, 1, 0, 0.9529412, 1,
0.9874555, -0.2548604, 1.499061, 1, 0, 0.9490196, 1,
0.9897633, -1.30765, 3.356381, 1, 0, 0.9411765, 1,
0.9921725, 1.078891, 0.5222041, 1, 0, 0.9372549, 1,
0.9960486, 0.1644995, 1.282106, 1, 0, 0.9294118, 1,
0.9968067, -0.5550139, 3.881567, 1, 0, 0.9254902, 1,
1.009264, -1.537572, 4.114992, 1, 0, 0.9176471, 1,
1.00994, 1.688856, 1.461205, 1, 0, 0.9137255, 1,
1.017448, 1.468092, -0.05276372, 1, 0, 0.9058824, 1,
1.023235, -1.132434, 3.009426, 1, 0, 0.9019608, 1,
1.029078, -0.1760023, 1.34294, 1, 0, 0.8941177, 1,
1.043874, -1.780113, 2.33984, 1, 0, 0.8862745, 1,
1.04392, -0.6044111, 1.677686, 1, 0, 0.8823529, 1,
1.058857, 0.02363356, 0.1708024, 1, 0, 0.8745098, 1,
1.059214, 0.2404092, 2.308997, 1, 0, 0.8705882, 1,
1.064731, -1.215367, 0.8351347, 1, 0, 0.8627451, 1,
1.065361, -1.56839, 1.758486, 1, 0, 0.8588235, 1,
1.067469, -1.898792, 2.715201, 1, 0, 0.8509804, 1,
1.076453, -0.6231564, 1.858485, 1, 0, 0.8470588, 1,
1.091176, -1.005593, 4.297109, 1, 0, 0.8392157, 1,
1.094554, 0.3479186, -0.05398594, 1, 0, 0.8352941, 1,
1.097897, -0.4281976, 0.4190584, 1, 0, 0.827451, 1,
1.10979, 1.276915, -0.1578271, 1, 0, 0.8235294, 1,
1.115405, -1.57864, 1.512731, 1, 0, 0.8156863, 1,
1.116813, 0.486403, 1.074062, 1, 0, 0.8117647, 1,
1.121645, 1.302944, 1.644024, 1, 0, 0.8039216, 1,
1.122442, -0.4783707, 1.85578, 1, 0, 0.7960784, 1,
1.125852, 0.2025934, -0.409497, 1, 0, 0.7921569, 1,
1.132219, -0.5248158, 2.531195, 1, 0, 0.7843137, 1,
1.135751, -1.125911, 2.296601, 1, 0, 0.7803922, 1,
1.145639, 1.659381, -0.5197158, 1, 0, 0.772549, 1,
1.146079, -0.5369779, 1.103059, 1, 0, 0.7686275, 1,
1.150338, 1.795469, -0.2413622, 1, 0, 0.7607843, 1,
1.154644, 0.1472792, 1.208839, 1, 0, 0.7568628, 1,
1.155324, -0.02487409, 0.780374, 1, 0, 0.7490196, 1,
1.161187, -0.4703556, 2.321364, 1, 0, 0.7450981, 1,
1.162784, -0.43965, 1.002149, 1, 0, 0.7372549, 1,
1.165463, 0.4053155, -0.2763306, 1, 0, 0.7333333, 1,
1.173367, 1.966583, 0.7348014, 1, 0, 0.7254902, 1,
1.180651, -0.2419498, 2.153652, 1, 0, 0.7215686, 1,
1.186281, -1.467254, 1.450082, 1, 0, 0.7137255, 1,
1.189234, 0.7244872, 0.05482358, 1, 0, 0.7098039, 1,
1.191781, -0.02314866, 1.447964, 1, 0, 0.7019608, 1,
1.197059, -1.510568, 2.356748, 1, 0, 0.6941177, 1,
1.200943, -1.32159, 1.789539, 1, 0, 0.6901961, 1,
1.201156, -0.341475, 1.008432, 1, 0, 0.682353, 1,
1.207879, -0.1224619, 1.494943, 1, 0, 0.6784314, 1,
1.211492, -0.6598409, 2.296715, 1, 0, 0.6705883, 1,
1.214058, 0.6026175, -0.3158412, 1, 0, 0.6666667, 1,
1.220603, -1.194431, 3.667061, 1, 0, 0.6588235, 1,
1.223798, 0.6518377, 0.3752572, 1, 0, 0.654902, 1,
1.232669, -0.3949111, 1.854558, 1, 0, 0.6470588, 1,
1.234323, -0.649341, 1.492951, 1, 0, 0.6431373, 1,
1.235488, -0.9673772, 2.519141, 1, 0, 0.6352941, 1,
1.236773, -1.142657, 2.42978, 1, 0, 0.6313726, 1,
1.243727, -1.885817, 2.988999, 1, 0, 0.6235294, 1,
1.250343, -0.3340358, 1.519654, 1, 0, 0.6196079, 1,
1.257795, 0.9466604, -0.07294906, 1, 0, 0.6117647, 1,
1.273337, -1.722421, 2.921749, 1, 0, 0.6078432, 1,
1.275303, -2.330059, 3.644862, 1, 0, 0.6, 1,
1.283913, 0.5277501, 0.758924, 1, 0, 0.5921569, 1,
1.294247, 0.6615252, 1.724075, 1, 0, 0.5882353, 1,
1.299403, 1.100821, 0.1743332, 1, 0, 0.5803922, 1,
1.300769, 0.4836528, 2.965054, 1, 0, 0.5764706, 1,
1.302694, -0.9219131, 2.797211, 1, 0, 0.5686275, 1,
1.310876, 0.2972331, 2.229908, 1, 0, 0.5647059, 1,
1.319096, 1.061473, 0.4341114, 1, 0, 0.5568628, 1,
1.322966, -0.6394888, 2.936264, 1, 0, 0.5529412, 1,
1.325346, -0.7888339, 3.495227, 1, 0, 0.5450981, 1,
1.325792, -0.8319857, 2.635966, 1, 0, 0.5411765, 1,
1.329462, 0.4761687, 0.8785352, 1, 0, 0.5333334, 1,
1.331651, 1.510754, -0.8078464, 1, 0, 0.5294118, 1,
1.337902, -0.1302509, 2.149798, 1, 0, 0.5215687, 1,
1.359727, 0.6164357, 1.511426, 1, 0, 0.5176471, 1,
1.360042, 0.8169272, 2.523725, 1, 0, 0.509804, 1,
1.363069, 0.2970966, 0.03644785, 1, 0, 0.5058824, 1,
1.364911, 0.7465166, 1.493446, 1, 0, 0.4980392, 1,
1.366551, 1.469894, 1.578412, 1, 0, 0.4901961, 1,
1.36689, -0.1103822, 3.220538, 1, 0, 0.4862745, 1,
1.367963, -0.9128689, 1.853942, 1, 0, 0.4784314, 1,
1.371697, 0.3867163, 1.497087, 1, 0, 0.4745098, 1,
1.380755, -0.5972546, 3.311903, 1, 0, 0.4666667, 1,
1.387009, 0.4753157, 1.477493, 1, 0, 0.4627451, 1,
1.407323, -0.2903727, 2.958861, 1, 0, 0.454902, 1,
1.438821, 0.7777408, 0.03475373, 1, 0, 0.4509804, 1,
1.470082, -0.004689413, 3.296684, 1, 0, 0.4431373, 1,
1.474341, -1.369468, 2.902651, 1, 0, 0.4392157, 1,
1.485032, 1.526484, 0.7803468, 1, 0, 0.4313726, 1,
1.495366, -0.4613691, 2.826182, 1, 0, 0.427451, 1,
1.505789, 0.3289697, 2.924321, 1, 0, 0.4196078, 1,
1.506037, -0.4929387, 3.21637, 1, 0, 0.4156863, 1,
1.511438, -0.1684229, 1.032954, 1, 0, 0.4078431, 1,
1.513527, -0.06602214, 3.008157, 1, 0, 0.4039216, 1,
1.524287, -0.5980947, 1.962191, 1, 0, 0.3960784, 1,
1.526242, 0.5747752, 1.501938, 1, 0, 0.3882353, 1,
1.550283, 1.062919, 1.7821, 1, 0, 0.3843137, 1,
1.563268, 0.8542511, 2.889402, 1, 0, 0.3764706, 1,
1.568509, -0.5968014, 2.129884, 1, 0, 0.372549, 1,
1.570664, 0.8407112, 1.327698, 1, 0, 0.3647059, 1,
1.582606, -0.3595296, 2.839298, 1, 0, 0.3607843, 1,
1.591191, 1.403876, 1.006392, 1, 0, 0.3529412, 1,
1.592504, 1.504701, 0.2335769, 1, 0, 0.3490196, 1,
1.601256, 1.764797, 1.123874, 1, 0, 0.3411765, 1,
1.60704, 0.3235041, 0.3516668, 1, 0, 0.3372549, 1,
1.613342, -0.806564, 2.624668, 1, 0, 0.3294118, 1,
1.625798, 0.8705044, 0.9112345, 1, 0, 0.3254902, 1,
1.633404, -0.5407834, 1.314879, 1, 0, 0.3176471, 1,
1.639694, 0.8295993, 3.186479, 1, 0, 0.3137255, 1,
1.646826, 0.4718722, 1.884634, 1, 0, 0.3058824, 1,
1.66408, 1.613152, 2.528734, 1, 0, 0.2980392, 1,
1.667146, -0.9832501, 1.958061, 1, 0, 0.2941177, 1,
1.671828, -0.2900752, -1.146346, 1, 0, 0.2862745, 1,
1.683421, 0.5748865, 0.3238236, 1, 0, 0.282353, 1,
1.693485, -0.8382102, 1.255823, 1, 0, 0.2745098, 1,
1.707342, -1.132283, 2.65756, 1, 0, 0.2705882, 1,
1.727864, -0.3362082, -0.4298053, 1, 0, 0.2627451, 1,
1.763736, 1.709549, 1.968562, 1, 0, 0.2588235, 1,
1.783394, 1.770368, 0.6909357, 1, 0, 0.2509804, 1,
1.783841, 0.9352002, -0.1114898, 1, 0, 0.2470588, 1,
1.807644, -0.2598529, -1.389053, 1, 0, 0.2392157, 1,
1.808856, 0.2561422, 1.465023, 1, 0, 0.2352941, 1,
1.814764, 0.9233728, 1.762945, 1, 0, 0.227451, 1,
1.815931, 1.063615, 1.099198, 1, 0, 0.2235294, 1,
1.817767, 1.959136, 0.9808207, 1, 0, 0.2156863, 1,
1.823603, 0.2180685, 2.477373, 1, 0, 0.2117647, 1,
1.832291, -0.0407611, 3.569591, 1, 0, 0.2039216, 1,
1.839645, 0.00359271, 1.07084, 1, 0, 0.1960784, 1,
1.858045, -0.2812079, 0.3256521, 1, 0, 0.1921569, 1,
1.888803, -0.7554392, 1.044994, 1, 0, 0.1843137, 1,
1.901464, 0.7243347, 1.929169, 1, 0, 0.1803922, 1,
1.919462, -0.8805555, 1.124432, 1, 0, 0.172549, 1,
1.94398, 1.598984, 0.2044093, 1, 0, 0.1686275, 1,
1.96535, -0.4266344, 1.653009, 1, 0, 0.1607843, 1,
1.98202, 0.9812414, -0.06882677, 1, 0, 0.1568628, 1,
1.985991, -0.2376803, 1.886361, 1, 0, 0.1490196, 1,
1.989235, 1.012739, -0.002190456, 1, 0, 0.145098, 1,
2.011739, -0.1065934, 1.465926, 1, 0, 0.1372549, 1,
2.052784, 0.8334324, 0.1833271, 1, 0, 0.1333333, 1,
2.078439, 1.198592, 2.848299, 1, 0, 0.1254902, 1,
2.105404, 1.830324, 2.461273, 1, 0, 0.1215686, 1,
2.149985, -0.3763422, 2.091628, 1, 0, 0.1137255, 1,
2.166421, -0.3544852, 1.752547, 1, 0, 0.1098039, 1,
2.183661, -0.6315148, 2.514368, 1, 0, 0.1019608, 1,
2.188856, -0.8674689, 0.685179, 1, 0, 0.09411765, 1,
2.18988, -1.534703, 2.626834, 1, 0, 0.09019608, 1,
2.215533, -0.8097476, 2.638802, 1, 0, 0.08235294, 1,
2.239825, -1.333323, 2.368514, 1, 0, 0.07843138, 1,
2.301203, -1.043232, 1.867069, 1, 0, 0.07058824, 1,
2.308378, 0.906661, 0.6939844, 1, 0, 0.06666667, 1,
2.310074, 0.2997601, 0.550581, 1, 0, 0.05882353, 1,
2.321093, -2.391141, 2.879792, 1, 0, 0.05490196, 1,
2.400857, -1.869225, 2.198603, 1, 0, 0.04705882, 1,
2.452298, -0.6290153, 2.555547, 1, 0, 0.04313726, 1,
2.520639, -0.1177984, 0.1704255, 1, 0, 0.03529412, 1,
2.551038, 1.649339, 2.068185, 1, 0, 0.03137255, 1,
2.566952, 2.602885, 0.2124339, 1, 0, 0.02352941, 1,
3.098593, -0.6884292, 1.290303, 1, 0, 0.01960784, 1,
3.161601, -0.4075907, 2.173987, 1, 0, 0.01176471, 1,
3.604396, -0.04890608, 1.106746, 1, 0, 0.007843138, 1
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
0.09342456, -5.048302, -7.522452, 0, -0.5, 0.5, 0.5,
0.09342456, -5.048302, -7.522452, 1, -0.5, 0.5, 0.5,
0.09342456, -5.048302, -7.522452, 1, 1.5, 0.5, 0.5,
0.09342456, -5.048302, -7.522452, 0, 1.5, 0.5, 0.5
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
-4.607767, -0.5854098, -7.522452, 0, -0.5, 0.5, 0.5,
-4.607767, -0.5854098, -7.522452, 1, -0.5, 0.5, 0.5,
-4.607767, -0.5854098, -7.522452, 1, 1.5, 0.5, 0.5,
-4.607767, -0.5854098, -7.522452, 0, 1.5, 0.5, 0.5
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
-4.607767, -5.048302, -0.2667747, 0, -0.5, 0.5, 0.5,
-4.607767, -5.048302, -0.2667747, 1, -0.5, 0.5, 0.5,
-4.607767, -5.048302, -0.2667747, 1, 1.5, 0.5, 0.5,
-4.607767, -5.048302, -0.2667747, 0, 1.5, 0.5, 0.5
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
-2, -4.018404, -5.848065,
2, -4.018404, -5.848065,
-2, -4.018404, -5.848065,
-2, -4.190054, -6.12713,
0, -4.018404, -5.848065,
0, -4.190054, -6.12713,
2, -4.018404, -5.848065,
2, -4.190054, -6.12713
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
-2, -4.533353, -6.685258, 0, -0.5, 0.5, 0.5,
-2, -4.533353, -6.685258, 1, -0.5, 0.5, 0.5,
-2, -4.533353, -6.685258, 1, 1.5, 0.5, 0.5,
-2, -4.533353, -6.685258, 0, 1.5, 0.5, 0.5,
0, -4.533353, -6.685258, 0, -0.5, 0.5, 0.5,
0, -4.533353, -6.685258, 1, -0.5, 0.5, 0.5,
0, -4.533353, -6.685258, 1, 1.5, 0.5, 0.5,
0, -4.533353, -6.685258, 0, 1.5, 0.5, 0.5,
2, -4.533353, -6.685258, 0, -0.5, 0.5, 0.5,
2, -4.533353, -6.685258, 1, -0.5, 0.5, 0.5,
2, -4.533353, -6.685258, 1, 1.5, 0.5, 0.5,
2, -4.533353, -6.685258, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.522876, -3, -5.848065,
-3.522876, 2, -5.848065,
-3.522876, -3, -5.848065,
-3.703691, -3, -6.12713,
-3.522876, -2, -5.848065,
-3.703691, -2, -6.12713,
-3.522876, -1, -5.848065,
-3.703691, -1, -6.12713,
-3.522876, 0, -5.848065,
-3.703691, 0, -6.12713,
-3.522876, 1, -5.848065,
-3.703691, 1, -6.12713,
-3.522876, 2, -5.848065,
-3.703691, 2, -6.12713
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
-4.065321, -3, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, -3, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, -3, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, -3, -6.685258, 0, 1.5, 0.5, 0.5,
-4.065321, -2, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, -2, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, -2, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, -2, -6.685258, 0, 1.5, 0.5, 0.5,
-4.065321, -1, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, -1, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, -1, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, -1, -6.685258, 0, 1.5, 0.5, 0.5,
-4.065321, 0, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, 0, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, 0, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, 0, -6.685258, 0, 1.5, 0.5, 0.5,
-4.065321, 1, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, 1, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, 1, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, 1, -6.685258, 0, 1.5, 0.5, 0.5,
-4.065321, 2, -6.685258, 0, -0.5, 0.5, 0.5,
-4.065321, 2, -6.685258, 1, -0.5, 0.5, 0.5,
-4.065321, 2, -6.685258, 1, 1.5, 0.5, 0.5,
-4.065321, 2, -6.685258, 0, 1.5, 0.5, 0.5
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
-3.522876, -4.018404, -4,
-3.522876, -4.018404, 4,
-3.522876, -4.018404, -4,
-3.703691, -4.190054, -4,
-3.522876, -4.018404, -2,
-3.703691, -4.190054, -2,
-3.522876, -4.018404, 0,
-3.703691, -4.190054, 0,
-3.522876, -4.018404, 2,
-3.703691, -4.190054, 2,
-3.522876, -4.018404, 4,
-3.703691, -4.190054, 4
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
-4.065321, -4.533353, -4, 0, -0.5, 0.5, 0.5,
-4.065321, -4.533353, -4, 1, -0.5, 0.5, 0.5,
-4.065321, -4.533353, -4, 1, 1.5, 0.5, 0.5,
-4.065321, -4.533353, -4, 0, 1.5, 0.5, 0.5,
-4.065321, -4.533353, -2, 0, -0.5, 0.5, 0.5,
-4.065321, -4.533353, -2, 1, -0.5, 0.5, 0.5,
-4.065321, -4.533353, -2, 1, 1.5, 0.5, 0.5,
-4.065321, -4.533353, -2, 0, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 0, 0, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 0, 1, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 0, 1, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 0, 0, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 2, 0, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 2, 1, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 2, 1, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 2, 0, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 4, 0, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 4, 1, -0.5, 0.5, 0.5,
-4.065321, -4.533353, 4, 1, 1.5, 0.5, 0.5,
-4.065321, -4.533353, 4, 0, 1.5, 0.5, 0.5
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
-3.522876, -4.018404, -5.848065,
-3.522876, 2.847584, -5.848065,
-3.522876, -4.018404, 5.314516,
-3.522876, 2.847584, 5.314516,
-3.522876, -4.018404, -5.848065,
-3.522876, -4.018404, 5.314516,
-3.522876, 2.847584, -5.848065,
-3.522876, 2.847584, 5.314516,
-3.522876, -4.018404, -5.848065,
3.709725, -4.018404, -5.848065,
-3.522876, -4.018404, 5.314516,
3.709725, -4.018404, 5.314516,
-3.522876, 2.847584, -5.848065,
3.709725, 2.847584, -5.848065,
-3.522876, 2.847584, 5.314516,
3.709725, 2.847584, 5.314516,
3.709725, -4.018404, -5.848065,
3.709725, 2.847584, -5.848065,
3.709725, -4.018404, 5.314516,
3.709725, 2.847584, 5.314516,
3.709725, -4.018404, -5.848065,
3.709725, -4.018404, 5.314516,
3.709725, 2.847584, -5.848065,
3.709725, 2.847584, 5.314516
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
var radius = 7.99288;
var distance = 35.56123;
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
mvMatrix.translate( -0.09342456, 0.5854098, 0.2667747 );
mvMatrix.scale( 1.194875, 1.258677, 0.774199 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.56123);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


