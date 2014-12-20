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
-3.183334, -0.1959816, -2.443114, 1, 0, 0, 1,
-2.711428, -1.861833, -3.337199, 1, 0.007843138, 0, 1,
-2.545452, 0.3889192, -1.435585, 1, 0.01176471, 0, 1,
-2.45945, 0.2698177, 0.4452623, 1, 0.01960784, 0, 1,
-2.374741, -0.7297421, -1.880479, 1, 0.02352941, 0, 1,
-2.316921, -1.139484, -2.849634, 1, 0.03137255, 0, 1,
-2.302189, 0.9005234, -0.881344, 1, 0.03529412, 0, 1,
-2.28722, 1.268995, -0.1980436, 1, 0.04313726, 0, 1,
-2.208734, 1.034433, 0.04610163, 1, 0.04705882, 0, 1,
-2.18274, 0.9120644, -0.4397328, 1, 0.05490196, 0, 1,
-2.138206, 0.2528372, -2.936663, 1, 0.05882353, 0, 1,
-2.127876, 0.4697356, -0.7215543, 1, 0.06666667, 0, 1,
-2.102232, 0.9624482, -1.764167, 1, 0.07058824, 0, 1,
-2.078412, 0.4745246, -2.330389, 1, 0.07843138, 0, 1,
-2.066429, 0.476605, -0.2998568, 1, 0.08235294, 0, 1,
-2.0061, 0.7551311, -2.907006, 1, 0.09019608, 0, 1,
-1.97189, 0.4106726, -2.815316, 1, 0.09411765, 0, 1,
-1.925341, -0.0364594, -0.1410899, 1, 0.1019608, 0, 1,
-1.919754, -0.7647387, -2.520012, 1, 0.1098039, 0, 1,
-1.877772, 0.3866069, -1.218002, 1, 0.1137255, 0, 1,
-1.868118, -1.592101, -1.638428, 1, 0.1215686, 0, 1,
-1.864602, 0.8272721, -1.129135, 1, 0.1254902, 0, 1,
-1.854003, -1.485156, -2.663661, 1, 0.1333333, 0, 1,
-1.838004, 0.8737689, -0.4822737, 1, 0.1372549, 0, 1,
-1.831396, 0.5711733, -1.340245, 1, 0.145098, 0, 1,
-1.825155, 2.242038, -1.064564, 1, 0.1490196, 0, 1,
-1.801077, -1.029158, -1.967379, 1, 0.1568628, 0, 1,
-1.795349, -0.9233389, -2.172481, 1, 0.1607843, 0, 1,
-1.784101, 0.681841, -1.602184, 1, 0.1686275, 0, 1,
-1.777246, 1.829907, -0.1190355, 1, 0.172549, 0, 1,
-1.771426, 0.9546245, -1.218284, 1, 0.1803922, 0, 1,
-1.768567, 1.108927, 0.5547763, 1, 0.1843137, 0, 1,
-1.734884, 1.169327, -1.370411, 1, 0.1921569, 0, 1,
-1.733884, 0.08434959, -0.8385991, 1, 0.1960784, 0, 1,
-1.731919, 0.3210707, -2.434858, 1, 0.2039216, 0, 1,
-1.731187, 0.557804, -1.551033, 1, 0.2117647, 0, 1,
-1.720767, 1.222752, -1.749142, 1, 0.2156863, 0, 1,
-1.718918, 0.2069619, -1.432676, 1, 0.2235294, 0, 1,
-1.696747, 0.02445449, 0.5209224, 1, 0.227451, 0, 1,
-1.693948, -0.7717206, -2.496637, 1, 0.2352941, 0, 1,
-1.688165, 0.2834845, -0.5128877, 1, 0.2392157, 0, 1,
-1.678083, 0.138758, -3.237716, 1, 0.2470588, 0, 1,
-1.673006, 0.9326915, -1.076362, 1, 0.2509804, 0, 1,
-1.665782, -1.03194, -4.198432, 1, 0.2588235, 0, 1,
-1.665211, 0.6714562, 0.3821719, 1, 0.2627451, 0, 1,
-1.663894, -0.10303, -2.302753, 1, 0.2705882, 0, 1,
-1.661065, 1.264614, -1.292599, 1, 0.2745098, 0, 1,
-1.651151, -0.7833515, -2.261052, 1, 0.282353, 0, 1,
-1.621401, 1.899694, -1.634273, 1, 0.2862745, 0, 1,
-1.607128, 0.4278983, -1.167266, 1, 0.2941177, 0, 1,
-1.606735, -0.2384474, -3.489874, 1, 0.3019608, 0, 1,
-1.583942, -0.4293559, -1.223708, 1, 0.3058824, 0, 1,
-1.567248, -0.06404503, -2.810295, 1, 0.3137255, 0, 1,
-1.548946, 0.9985211, -1.664043, 1, 0.3176471, 0, 1,
-1.537172, -1.603776, -2.152675, 1, 0.3254902, 0, 1,
-1.533841, -1.132315, -0.5220004, 1, 0.3294118, 0, 1,
-1.532302, -0.7050624, -1.836766, 1, 0.3372549, 0, 1,
-1.525857, 1.278793, -3.938037, 1, 0.3411765, 0, 1,
-1.525202, -0.2597608, -2.546994, 1, 0.3490196, 0, 1,
-1.513914, 0.3192612, -0.6763206, 1, 0.3529412, 0, 1,
-1.513113, 0.1556309, -2.752167, 1, 0.3607843, 0, 1,
-1.510957, -0.1816655, -2.098372, 1, 0.3647059, 0, 1,
-1.510903, 2.118427, -0.4850139, 1, 0.372549, 0, 1,
-1.510763, -0.1496145, -2.61408, 1, 0.3764706, 0, 1,
-1.50912, 0.1875506, -1.205034, 1, 0.3843137, 0, 1,
-1.506601, 0.6878275, -0.1907336, 1, 0.3882353, 0, 1,
-1.497084, 0.6226743, -1.938864, 1, 0.3960784, 0, 1,
-1.482192, -0.0918871, -1.656403, 1, 0.4039216, 0, 1,
-1.479854, 0.1210396, -1.382971, 1, 0.4078431, 0, 1,
-1.476592, 0.8381307, 0.8028725, 1, 0.4156863, 0, 1,
-1.463632, -0.5626272, -1.564635, 1, 0.4196078, 0, 1,
-1.462463, 0.876915, 0.2996478, 1, 0.427451, 0, 1,
-1.461658, 0.2764963, -0.6655533, 1, 0.4313726, 0, 1,
-1.447339, 0.4993042, -0.6390536, 1, 0.4392157, 0, 1,
-1.440069, -1.199949, -3.023522, 1, 0.4431373, 0, 1,
-1.43328, 1.388848, -0.5961004, 1, 0.4509804, 0, 1,
-1.428442, -0.3415838, -2.597708, 1, 0.454902, 0, 1,
-1.39476, 0.6090474, 0.1105116, 1, 0.4627451, 0, 1,
-1.391218, -0.111635, 0.05270119, 1, 0.4666667, 0, 1,
-1.384338, -0.8865427, -2.322538, 1, 0.4745098, 0, 1,
-1.379731, 1.611605, -0.513728, 1, 0.4784314, 0, 1,
-1.373214, -0.9687985, -2.788471, 1, 0.4862745, 0, 1,
-1.364622, 0.2926449, 1.024363, 1, 0.4901961, 0, 1,
-1.362779, 0.0957769, -1.615209, 1, 0.4980392, 0, 1,
-1.358914, -1.083279, -2.933201, 1, 0.5058824, 0, 1,
-1.352596, 0.9737173, -1.602433, 1, 0.509804, 0, 1,
-1.350319, 1.19071, -2.060113, 1, 0.5176471, 0, 1,
-1.349031, 0.339676, -1.191701, 1, 0.5215687, 0, 1,
-1.342786, 0.7986415, -3.02891, 1, 0.5294118, 0, 1,
-1.34181, 0.6718302, -2.740515, 1, 0.5333334, 0, 1,
-1.320436, -0.2349705, -3.955097, 1, 0.5411765, 0, 1,
-1.300426, 0.7893962, 0.350416, 1, 0.5450981, 0, 1,
-1.291874, -0.9183648, -1.071419, 1, 0.5529412, 0, 1,
-1.288397, 0.6556382, -3.006213, 1, 0.5568628, 0, 1,
-1.28564, -0.3775412, -2.34874, 1, 0.5647059, 0, 1,
-1.284264, 0.2069344, -1.399162, 1, 0.5686275, 0, 1,
-1.279526, 0.2541924, -1.05059, 1, 0.5764706, 0, 1,
-1.275528, 0.3887766, -1.424672, 1, 0.5803922, 0, 1,
-1.272203, 2.039899, 0.9581238, 1, 0.5882353, 0, 1,
-1.269923, -0.2558856, -1.985, 1, 0.5921569, 0, 1,
-1.263006, -2.953174, -2.825818, 1, 0.6, 0, 1,
-1.261959, 0.6234152, -0.4003171, 1, 0.6078432, 0, 1,
-1.256414, 0.1776322, -1.415442, 1, 0.6117647, 0, 1,
-1.256266, 0.1148021, -1.484313, 1, 0.6196079, 0, 1,
-1.24273, -0.1889726, -2.007184, 1, 0.6235294, 0, 1,
-1.238386, 0.366294, -0.2303189, 1, 0.6313726, 0, 1,
-1.22714, 0.4316119, -1.466328, 1, 0.6352941, 0, 1,
-1.204978, -1.022373, -2.654271, 1, 0.6431373, 0, 1,
-1.201046, 1.097111, 0.5075828, 1, 0.6470588, 0, 1,
-1.198885, 0.6011541, -1.600862, 1, 0.654902, 0, 1,
-1.198746, -0.1219243, -1.518526, 1, 0.6588235, 0, 1,
-1.191777, -1.068868, -1.589332, 1, 0.6666667, 0, 1,
-1.188625, 0.3614493, -0.7231399, 1, 0.6705883, 0, 1,
-1.176762, -0.07195164, -0.472305, 1, 0.6784314, 0, 1,
-1.174537, -0.2728252, -0.745809, 1, 0.682353, 0, 1,
-1.173007, -2.031787, -2.145329, 1, 0.6901961, 0, 1,
-1.169558, 0.4108125, -2.384993, 1, 0.6941177, 0, 1,
-1.167952, -2.54573, -2.722134, 1, 0.7019608, 0, 1,
-1.164746, -0.921227, -4.096193, 1, 0.7098039, 0, 1,
-1.158662, -0.03060405, 0.3621844, 1, 0.7137255, 0, 1,
-1.146513, 0.883076, -0.4906217, 1, 0.7215686, 0, 1,
-1.13799, -0.34685, -2.202274, 1, 0.7254902, 0, 1,
-1.132856, -0.2438022, -1.63991, 1, 0.7333333, 0, 1,
-1.127436, -0.05011677, 0.284422, 1, 0.7372549, 0, 1,
-1.126223, -0.5468786, -1.44914, 1, 0.7450981, 0, 1,
-1.126192, -1.118651, -1.255413, 1, 0.7490196, 0, 1,
-1.11196, 0.1379887, -0.7699007, 1, 0.7568628, 0, 1,
-1.111014, 0.4363899, -0.4737339, 1, 0.7607843, 0, 1,
-1.109235, -0.5194396, -1.427689, 1, 0.7686275, 0, 1,
-1.105956, -0.09882457, -2.435586, 1, 0.772549, 0, 1,
-1.103645, 1.169544, -0.8792866, 1, 0.7803922, 0, 1,
-1.087862, 0.4115429, -0.6082735, 1, 0.7843137, 0, 1,
-1.087208, 0.1586912, -2.356234, 1, 0.7921569, 0, 1,
-1.084552, -1.152486, -1.728807, 1, 0.7960784, 0, 1,
-1.084179, 0.6259897, -1.79589, 1, 0.8039216, 0, 1,
-1.077436, 0.7423955, 1.014359, 1, 0.8117647, 0, 1,
-1.076176, -0.9269698, -3.853927, 1, 0.8156863, 0, 1,
-1.066404, -0.05894983, -3.320204, 1, 0.8235294, 0, 1,
-1.061539, -0.04411867, -1.635529, 1, 0.827451, 0, 1,
-1.049206, 2.042022, -1.406026, 1, 0.8352941, 0, 1,
-1.048049, -0.257348, -1.434911, 1, 0.8392157, 0, 1,
-1.047613, 0.1644686, -1.499744, 1, 0.8470588, 0, 1,
-1.02653, -0.7261478, -1.938011, 1, 0.8509804, 0, 1,
-1.026512, 0.01325124, -1.28218, 1, 0.8588235, 0, 1,
-1.026065, 0.539056, -2.990845, 1, 0.8627451, 0, 1,
-1.022453, 0.260783, -1.754587, 1, 0.8705882, 0, 1,
-1.02182, -1.484576, -2.104647, 1, 0.8745098, 0, 1,
-1.017958, -0.371049, -2.133877, 1, 0.8823529, 0, 1,
-1.012515, 2.19684, -0.8981156, 1, 0.8862745, 0, 1,
-1.007202, -1.595491, -4.287712, 1, 0.8941177, 0, 1,
-1.001257, -0.1957526, -1.659359, 1, 0.8980392, 0, 1,
-1.000064, 0.7211399, 0.08686709, 1, 0.9058824, 0, 1,
-0.9967207, 0.3423725, -0.7488247, 1, 0.9137255, 0, 1,
-0.9958793, 3.038076, -1.060845, 1, 0.9176471, 0, 1,
-0.9944133, -0.987069, -4.952804, 1, 0.9254902, 0, 1,
-0.9941728, -0.4820712, -2.580631, 1, 0.9294118, 0, 1,
-0.9892716, -2.250444, -2.047699, 1, 0.9372549, 0, 1,
-0.9889292, -0.5404893, 0.5872881, 1, 0.9411765, 0, 1,
-0.9885387, -0.9372401, -2.183269, 1, 0.9490196, 0, 1,
-0.987936, -0.4063555, -2.684319, 1, 0.9529412, 0, 1,
-0.9870099, 0.1796229, -1.538502, 1, 0.9607843, 0, 1,
-0.968716, 0.2654218, -0.2932561, 1, 0.9647059, 0, 1,
-0.9678464, -1.950991, -3.677499, 1, 0.972549, 0, 1,
-0.965551, -0.8480957, -1.647282, 1, 0.9764706, 0, 1,
-0.9579106, 1.127091, -2.687726, 1, 0.9843137, 0, 1,
-0.9498535, -0.5461564, -1.997761, 1, 0.9882353, 0, 1,
-0.9442157, -0.2926708, -0.4466957, 1, 0.9960784, 0, 1,
-0.936972, -0.1815782, -1.228448, 0.9960784, 1, 0, 1,
-0.931636, 1.689393, 1.52385, 0.9921569, 1, 0, 1,
-0.9292721, -1.013878, -0.7745669, 0.9843137, 1, 0, 1,
-0.9273049, -0.3577592, -2.982965, 0.9803922, 1, 0, 1,
-0.9114202, -0.3869445, -1.75336, 0.972549, 1, 0, 1,
-0.9054825, 1.445108, -0.003147595, 0.9686275, 1, 0, 1,
-0.8958995, -0.06713772, -2.081853, 0.9607843, 1, 0, 1,
-0.8874532, 2.415056, 0.1089766, 0.9568627, 1, 0, 1,
-0.887257, -0.1411537, -2.775264, 0.9490196, 1, 0, 1,
-0.885538, 1.184892, -0.09962526, 0.945098, 1, 0, 1,
-0.8844455, 0.9980944, -1.466267, 0.9372549, 1, 0, 1,
-0.8776252, 0.3432879, -0.5528861, 0.9333333, 1, 0, 1,
-0.877302, 0.283864, -0.6016448, 0.9254902, 1, 0, 1,
-0.8730117, -1.852787, -3.457403, 0.9215686, 1, 0, 1,
-0.8710626, 0.811591, 0.1055553, 0.9137255, 1, 0, 1,
-0.8681868, 0.2463523, -4.189798, 0.9098039, 1, 0, 1,
-0.8627502, 0.789527, 2.065353, 0.9019608, 1, 0, 1,
-0.862426, -1.003556, -2.646168, 0.8941177, 1, 0, 1,
-0.8604542, 0.09738511, -1.057163, 0.8901961, 1, 0, 1,
-0.8582476, 0.4267439, -1.4263, 0.8823529, 1, 0, 1,
-0.8573071, -1.006375, -3.102695, 0.8784314, 1, 0, 1,
-0.8446493, -1.868074, -3.336695, 0.8705882, 1, 0, 1,
-0.841428, -0.4089783, -1.992405, 0.8666667, 1, 0, 1,
-0.8384042, 1.325598, -0.2004278, 0.8588235, 1, 0, 1,
-0.8356384, -0.688755, -1.765688, 0.854902, 1, 0, 1,
-0.8344916, -0.07699194, -2.411757, 0.8470588, 1, 0, 1,
-0.8336108, -0.636947, -2.530025, 0.8431373, 1, 0, 1,
-0.8333088, -0.4734604, -3.79912, 0.8352941, 1, 0, 1,
-0.8258724, 0.2548671, -1.494418, 0.8313726, 1, 0, 1,
-0.8225536, -0.2249375, -1.922169, 0.8235294, 1, 0, 1,
-0.819032, 0.3342738, -2.076329, 0.8196079, 1, 0, 1,
-0.8180795, 0.1283638, -2.710496, 0.8117647, 1, 0, 1,
-0.8178389, -1.155398, -2.600527, 0.8078431, 1, 0, 1,
-0.8150296, -2.502107, -2.30367, 0.8, 1, 0, 1,
-0.8133367, -1.035817, -4.023817, 0.7921569, 1, 0, 1,
-0.8128909, 0.482109, 0.1283094, 0.7882353, 1, 0, 1,
-0.7984856, -0.5461524, -2.321602, 0.7803922, 1, 0, 1,
-0.7980738, 1.046544, -1.206104, 0.7764706, 1, 0, 1,
-0.7947975, 0.01207367, 0.8198825, 0.7686275, 1, 0, 1,
-0.7925695, -0.467093, -2.513417, 0.7647059, 1, 0, 1,
-0.7909105, 1.480764, -0.1013555, 0.7568628, 1, 0, 1,
-0.7893854, 0.2764138, -0.5735422, 0.7529412, 1, 0, 1,
-0.7893348, 1.077062, -0.4732808, 0.7450981, 1, 0, 1,
-0.7893093, 0.5560672, 0.4663648, 0.7411765, 1, 0, 1,
-0.7869509, 0.4250552, -3.661881, 0.7333333, 1, 0, 1,
-0.7809114, 0.2599734, -0.8834437, 0.7294118, 1, 0, 1,
-0.7666593, 0.1459828, -0.5645958, 0.7215686, 1, 0, 1,
-0.7628353, 1.124645, 0.1750668, 0.7176471, 1, 0, 1,
-0.7615727, -1.549057, -1.440753, 0.7098039, 1, 0, 1,
-0.7583732, -0.9408098, -3.727581, 0.7058824, 1, 0, 1,
-0.7483151, -0.8487011, -1.098492, 0.6980392, 1, 0, 1,
-0.7464604, -1.14766, -3.170672, 0.6901961, 1, 0, 1,
-0.7444295, 1.508831, 1.049539, 0.6862745, 1, 0, 1,
-0.743153, -2.19693, -3.18307, 0.6784314, 1, 0, 1,
-0.7413118, -1.338092, -5.13197, 0.6745098, 1, 0, 1,
-0.7384453, -0.6787337, -2.433959, 0.6666667, 1, 0, 1,
-0.7273445, -0.4655363, -1.406945, 0.6627451, 1, 0, 1,
-0.7272802, 0.1634552, -2.145722, 0.654902, 1, 0, 1,
-0.7243028, 0.7067154, -0.6496624, 0.6509804, 1, 0, 1,
-0.7220035, -0.6493994, -3.032843, 0.6431373, 1, 0, 1,
-0.7194331, -0.1188963, -2.068094, 0.6392157, 1, 0, 1,
-0.7188592, 0.2891679, -0.9318706, 0.6313726, 1, 0, 1,
-0.7163891, -0.5328636, -3.552318, 0.627451, 1, 0, 1,
-0.7124706, 1.610183, 0.2751844, 0.6196079, 1, 0, 1,
-0.7103869, 0.4013745, -2.316127, 0.6156863, 1, 0, 1,
-0.7088733, -0.4619702, -2.686914, 0.6078432, 1, 0, 1,
-0.7079822, 0.212967, -0.4315176, 0.6039216, 1, 0, 1,
-0.7071353, 0.799217, 0.5457681, 0.5960785, 1, 0, 1,
-0.7035698, 0.661684, -0.7129458, 0.5882353, 1, 0, 1,
-0.7018676, -0.5249919, -2.345395, 0.5843138, 1, 0, 1,
-0.7004591, -1.060529, -3.06685, 0.5764706, 1, 0, 1,
-0.6975495, 0.06682431, -0.515501, 0.572549, 1, 0, 1,
-0.6968549, 1.833337, 0.03805416, 0.5647059, 1, 0, 1,
-0.6906654, -0.485027, -0.9321404, 0.5607843, 1, 0, 1,
-0.6855085, -0.3753023, -3.381803, 0.5529412, 1, 0, 1,
-0.6828901, 0.621704, -1.616311, 0.5490196, 1, 0, 1,
-0.682452, -0.6448505, -1.653332, 0.5411765, 1, 0, 1,
-0.6818337, -1.167638, -3.114393, 0.5372549, 1, 0, 1,
-0.6790298, -0.1157878, -0.8256894, 0.5294118, 1, 0, 1,
-0.6785366, -0.8255001, -3.88156, 0.5254902, 1, 0, 1,
-0.6758487, 1.314704, 0.2466413, 0.5176471, 1, 0, 1,
-0.6737735, 0.08860627, -1.955719, 0.5137255, 1, 0, 1,
-0.6657978, 1.606349, 0.7600986, 0.5058824, 1, 0, 1,
-0.6652175, 0.7169884, -0.9182932, 0.5019608, 1, 0, 1,
-0.6643174, -0.2911204, -1.685552, 0.4941176, 1, 0, 1,
-0.6607981, -0.1866316, -1.780796, 0.4862745, 1, 0, 1,
-0.6578801, 0.6678977, -0.6986871, 0.4823529, 1, 0, 1,
-0.6522935, -1.026266, -2.068164, 0.4745098, 1, 0, 1,
-0.6519339, -1.366819, -1.789782, 0.4705882, 1, 0, 1,
-0.6494743, -0.4754798, -2.703021, 0.4627451, 1, 0, 1,
-0.648317, -0.06144873, -1.734799, 0.4588235, 1, 0, 1,
-0.6407478, 0.9340548, -1.075226, 0.4509804, 1, 0, 1,
-0.6382255, 2.025831, -0.9201113, 0.4470588, 1, 0, 1,
-0.6378074, 1.18116, 1.204476, 0.4392157, 1, 0, 1,
-0.6350683, -1.599649, -2.590483, 0.4352941, 1, 0, 1,
-0.6344641, 1.464677, -1.593246, 0.427451, 1, 0, 1,
-0.6327895, -0.8926526, -1.835151, 0.4235294, 1, 0, 1,
-0.631955, 1.290356, -0.1009326, 0.4156863, 1, 0, 1,
-0.6285066, 1.383276, -1.408802, 0.4117647, 1, 0, 1,
-0.6273945, 0.1871687, -1.048164, 0.4039216, 1, 0, 1,
-0.6215234, 0.1821065, -1.013508, 0.3960784, 1, 0, 1,
-0.6207144, 0.3358322, -1.638445, 0.3921569, 1, 0, 1,
-0.6192628, -0.02824587, -2.277223, 0.3843137, 1, 0, 1,
-0.6185537, -0.8359281, -2.840798, 0.3803922, 1, 0, 1,
-0.6069875, -1.517837, -2.426871, 0.372549, 1, 0, 1,
-0.6059404, -1.597066, -3.517475, 0.3686275, 1, 0, 1,
-0.596829, -0.5159591, -3.448113, 0.3607843, 1, 0, 1,
-0.5922602, -0.4216631, -2.551002, 0.3568628, 1, 0, 1,
-0.589857, -1.388526, -2.796825, 0.3490196, 1, 0, 1,
-0.5874686, -0.04667644, -0.275672, 0.345098, 1, 0, 1,
-0.5859794, 0.3369162, -3.093218, 0.3372549, 1, 0, 1,
-0.5827727, 0.1607256, 0.7685454, 0.3333333, 1, 0, 1,
-0.5827364, 1.104962, -1.537663, 0.3254902, 1, 0, 1,
-0.5822157, -0.1915154, -1.045873, 0.3215686, 1, 0, 1,
-0.5743285, 0.4950335, -0.7766038, 0.3137255, 1, 0, 1,
-0.5741543, 2.064461, -1.018748, 0.3098039, 1, 0, 1,
-0.5709512, 1.154155, -0.6805757, 0.3019608, 1, 0, 1,
-0.563961, 0.972204, -0.7452946, 0.2941177, 1, 0, 1,
-0.5638635, -1.801179, -3.131598, 0.2901961, 1, 0, 1,
-0.5598929, -0.8911641, -2.063224, 0.282353, 1, 0, 1,
-0.5583688, 0.9294937, -0.3705882, 0.2784314, 1, 0, 1,
-0.5504199, -0.6840525, -2.170491, 0.2705882, 1, 0, 1,
-0.5502084, -1.771768, -4.187049, 0.2666667, 1, 0, 1,
-0.5439584, -0.3027882, -2.732997, 0.2588235, 1, 0, 1,
-0.5429877, 0.623197, -0.7907944, 0.254902, 1, 0, 1,
-0.5371362, 0.5267639, -1.20361, 0.2470588, 1, 0, 1,
-0.5332767, -0.3948641, -3.568294, 0.2431373, 1, 0, 1,
-0.53126, -0.7142694, -2.685748, 0.2352941, 1, 0, 1,
-0.5302268, -1.398252, -1.547401, 0.2313726, 1, 0, 1,
-0.5271702, -0.3974081, -1.825872, 0.2235294, 1, 0, 1,
-0.5215492, 1.095444, -0.6422068, 0.2196078, 1, 0, 1,
-0.5205551, -0.9200194, -1.391776, 0.2117647, 1, 0, 1,
-0.515478, -1.229487, -1.630148, 0.2078431, 1, 0, 1,
-0.5121434, -0.1172125, -2.960379, 0.2, 1, 0, 1,
-0.5097052, 0.7630389, -0.006278803, 0.1921569, 1, 0, 1,
-0.5090187, 0.9873972, 0.2064884, 0.1882353, 1, 0, 1,
-0.507997, 0.7103264, -0.2295091, 0.1803922, 1, 0, 1,
-0.5062777, -0.08508283, -0.5942655, 0.1764706, 1, 0, 1,
-0.5037676, -1.374782, -2.435996, 0.1686275, 1, 0, 1,
-0.5031422, 0.3796782, -1.41369, 0.1647059, 1, 0, 1,
-0.4984768, -0.1736192, -0.4773512, 0.1568628, 1, 0, 1,
-0.4970752, 0.3512823, -1.858918, 0.1529412, 1, 0, 1,
-0.4951565, -0.4571414, -3.15977, 0.145098, 1, 0, 1,
-0.4919971, -1.40936, -1.053279, 0.1411765, 1, 0, 1,
-0.4919415, 0.3817543, -0.3883809, 0.1333333, 1, 0, 1,
-0.4916503, 0.8811278, -0.4226208, 0.1294118, 1, 0, 1,
-0.4912686, -1.344516, -1.515333, 0.1215686, 1, 0, 1,
-0.4911694, 0.08123802, -1.167227, 0.1176471, 1, 0, 1,
-0.4909477, -0.4250387, -1.238476, 0.1098039, 1, 0, 1,
-0.4880295, -1.677524, -2.685856, 0.1058824, 1, 0, 1,
-0.487236, -1.111514, -2.11747, 0.09803922, 1, 0, 1,
-0.4846911, 0.5597141, 0.6899169, 0.09019608, 1, 0, 1,
-0.4734429, 0.5955824, -1.70408, 0.08627451, 1, 0, 1,
-0.473055, 1.674051, -0.403428, 0.07843138, 1, 0, 1,
-0.4722624, 0.8339523, -0.2326618, 0.07450981, 1, 0, 1,
-0.4696477, -1.069093, -2.999668, 0.06666667, 1, 0, 1,
-0.464875, 1.139797, -0.9579745, 0.0627451, 1, 0, 1,
-0.4616614, -0.07112278, -0.7890899, 0.05490196, 1, 0, 1,
-0.460991, 1.280651, -0.2164103, 0.05098039, 1, 0, 1,
-0.4608303, 0.685122, -1.291069, 0.04313726, 1, 0, 1,
-0.4575794, -2.871685, -5.207969, 0.03921569, 1, 0, 1,
-0.4573772, 0.6383114, -1.170771, 0.03137255, 1, 0, 1,
-0.4525109, 1.583627, 2.037389, 0.02745098, 1, 0, 1,
-0.4512201, 0.1565425, -1.185746, 0.01960784, 1, 0, 1,
-0.4509848, 0.1029377, 1.015532, 0.01568628, 1, 0, 1,
-0.4506014, -0.2294484, -1.799033, 0.007843138, 1, 0, 1,
-0.4490284, 0.07062163, -0.01647523, 0.003921569, 1, 0, 1,
-0.4460841, -0.2476404, -1.106588, 0, 1, 0.003921569, 1,
-0.4437529, 0.6026168, 0.2405147, 0, 1, 0.01176471, 1,
-0.4405856, 1.837392, 1.742645, 0, 1, 0.01568628, 1,
-0.4377699, 0.1612405, -1.875662, 0, 1, 0.02352941, 1,
-0.4328853, -0.3257953, -3.932804, 0, 1, 0.02745098, 1,
-0.4328238, 0.5825084, -1.129566, 0, 1, 0.03529412, 1,
-0.4322018, 0.9768221, 1.076615, 0, 1, 0.03921569, 1,
-0.4243927, -1.321156, -1.851743, 0, 1, 0.04705882, 1,
-0.4243902, -0.9437509, -2.813622, 0, 1, 0.05098039, 1,
-0.4237194, 1.628147, -0.08669405, 0, 1, 0.05882353, 1,
-0.422135, -0.9862449, -2.52464, 0, 1, 0.0627451, 1,
-0.4217528, -1.101992, -2.859568, 0, 1, 0.07058824, 1,
-0.4207735, 0.5789981, -1.262892, 0, 1, 0.07450981, 1,
-0.4201654, 1.654422, 1.757455, 0, 1, 0.08235294, 1,
-0.4196143, 1.156793, 0.3628539, 0, 1, 0.08627451, 1,
-0.4193857, -0.6714454, -2.497219, 0, 1, 0.09411765, 1,
-0.4140146, -1.36408, -3.373743, 0, 1, 0.1019608, 1,
-0.404566, -0.1838332, -2.393291, 0, 1, 0.1058824, 1,
-0.4022806, 0.6613908, -0.00896269, 0, 1, 0.1137255, 1,
-0.4013014, -1.6625, -1.867612, 0, 1, 0.1176471, 1,
-0.4006559, 1.005941, -0.3384259, 0, 1, 0.1254902, 1,
-0.3969033, -1.685349, -2.521762, 0, 1, 0.1294118, 1,
-0.3967304, 1.276973, -2.522215, 0, 1, 0.1372549, 1,
-0.3937946, 0.596644, -1.502536, 0, 1, 0.1411765, 1,
-0.3926314, -1.033887, -2.758057, 0, 1, 0.1490196, 1,
-0.3907425, 1.015177, 0.0197561, 0, 1, 0.1529412, 1,
-0.3903899, 0.8757179, -0.2018048, 0, 1, 0.1607843, 1,
-0.3893685, -1.325598, -2.902482, 0, 1, 0.1647059, 1,
-0.387594, 1.040814, -1.716106, 0, 1, 0.172549, 1,
-0.3860035, 0.3568479, 0.5561476, 0, 1, 0.1764706, 1,
-0.3855727, 0.5593876, 0.0623218, 0, 1, 0.1843137, 1,
-0.3813675, 0.2700986, -1.976959, 0, 1, 0.1882353, 1,
-0.3796332, -0.6045208, -0.5447364, 0, 1, 0.1960784, 1,
-0.3782488, 1.719495, -1.59476, 0, 1, 0.2039216, 1,
-0.3731559, -0.8575421, -3.468398, 0, 1, 0.2078431, 1,
-0.3709057, 1.219302, -1.211654, 0, 1, 0.2156863, 1,
-0.3675398, 0.330922, -0.007463736, 0, 1, 0.2196078, 1,
-0.3622545, 1.37419, 0.6554513, 0, 1, 0.227451, 1,
-0.3611201, 0.4522217, 0.7772894, 0, 1, 0.2313726, 1,
-0.3597623, 1.717263, -0.7198758, 0, 1, 0.2392157, 1,
-0.3572629, 3.163513, 1.495476, 0, 1, 0.2431373, 1,
-0.3548848, 0.6112906, -2.537934, 0, 1, 0.2509804, 1,
-0.3496425, -0.1165737, -1.608757, 0, 1, 0.254902, 1,
-0.3482772, -0.402766, -2.524476, 0, 1, 0.2627451, 1,
-0.3479018, -0.7988068, -3.565025, 0, 1, 0.2666667, 1,
-0.3477238, 0.0663522, -0.2294328, 0, 1, 0.2745098, 1,
-0.3468099, -0.3014136, -1.955751, 0, 1, 0.2784314, 1,
-0.3463176, -1.219962, -2.343164, 0, 1, 0.2862745, 1,
-0.3445367, 1.708467, -0.6991717, 0, 1, 0.2901961, 1,
-0.3444884, -0.2042578, -1.633866, 0, 1, 0.2980392, 1,
-0.3440219, 0.147319, -2.756718, 0, 1, 0.3058824, 1,
-0.3412648, -0.9101257, -4.055783, 0, 1, 0.3098039, 1,
-0.3368858, 0.2323742, -0.8958625, 0, 1, 0.3176471, 1,
-0.3360274, -1.313243, -2.994985, 0, 1, 0.3215686, 1,
-0.3315467, -0.2623779, -1.733638, 0, 1, 0.3294118, 1,
-0.3313663, 0.5441644, -1.608444, 0, 1, 0.3333333, 1,
-0.3301526, -0.7755127, -3.247569, 0, 1, 0.3411765, 1,
-0.3188342, 0.3010727, 1.300797, 0, 1, 0.345098, 1,
-0.3183273, 0.2494951, -1.110086, 0, 1, 0.3529412, 1,
-0.316437, 0.9620661, -3.00244, 0, 1, 0.3568628, 1,
-0.3142834, 0.2502193, -0.7146153, 0, 1, 0.3647059, 1,
-0.3092999, 0.2815847, -0.8503475, 0, 1, 0.3686275, 1,
-0.305735, 0.5374812, -0.7344205, 0, 1, 0.3764706, 1,
-0.293958, -0.6224755, -2.112598, 0, 1, 0.3803922, 1,
-0.2885109, -1.097222, -1.969225, 0, 1, 0.3882353, 1,
-0.2836987, 0.02411936, -0.4543037, 0, 1, 0.3921569, 1,
-0.2764458, -0.2211383, -1.174115, 0, 1, 0.4, 1,
-0.270678, 0.391803, -0.7601101, 0, 1, 0.4078431, 1,
-0.2703973, -1.358759, -4.394293, 0, 1, 0.4117647, 1,
-0.2696262, -0.7108172, -3.384386, 0, 1, 0.4196078, 1,
-0.2659232, 0.2597732, -1.500975, 0, 1, 0.4235294, 1,
-0.2630654, -2.140271, -2.910743, 0, 1, 0.4313726, 1,
-0.2550724, 0.431903, 0.4325452, 0, 1, 0.4352941, 1,
-0.2550637, -0.9523219, -2.470038, 0, 1, 0.4431373, 1,
-0.2543356, 0.7523056, 1.226639, 0, 1, 0.4470588, 1,
-0.2522698, 0.1583427, -0.7292376, 0, 1, 0.454902, 1,
-0.2489259, -0.03670246, -0.2779467, 0, 1, 0.4588235, 1,
-0.2431559, -2.110217, -3.570338, 0, 1, 0.4666667, 1,
-0.2427515, 2.418631, -2.205849, 0, 1, 0.4705882, 1,
-0.2416809, 0.1449654, -2.52438, 0, 1, 0.4784314, 1,
-0.2415881, -0.7773277, -2.642488, 0, 1, 0.4823529, 1,
-0.2415147, 0.2069891, -0.08533005, 0, 1, 0.4901961, 1,
-0.2394934, -0.9787938, -2.391706, 0, 1, 0.4941176, 1,
-0.2391198, 0.3592744, 0.3966531, 0, 1, 0.5019608, 1,
-0.2380186, -1.833911, -2.968822, 0, 1, 0.509804, 1,
-0.23703, -1.42717, -2.272845, 0, 1, 0.5137255, 1,
-0.236669, -1.715069, -2.50062, 0, 1, 0.5215687, 1,
-0.2365796, -0.5818009, -1.591489, 0, 1, 0.5254902, 1,
-0.2340565, -0.1052063, 0.2600929, 0, 1, 0.5333334, 1,
-0.2311801, -1.269415, -3.539544, 0, 1, 0.5372549, 1,
-0.2301265, 0.1071042, -1.901434, 0, 1, 0.5450981, 1,
-0.2299384, -1.805543, -4.495053, 0, 1, 0.5490196, 1,
-0.2195959, 0.25317, -1.900446, 0, 1, 0.5568628, 1,
-0.2175345, -0.5017446, -5.042663, 0, 1, 0.5607843, 1,
-0.2174815, -0.07103829, -3.439358, 0, 1, 0.5686275, 1,
-0.2164747, -0.7833064, -0.8075541, 0, 1, 0.572549, 1,
-0.2157912, 0.6466449, -1.936851, 0, 1, 0.5803922, 1,
-0.215453, -0.193358, -2.802189, 0, 1, 0.5843138, 1,
-0.2148113, -0.09377053, -2.14948, 0, 1, 0.5921569, 1,
-0.2144298, 0.2092674, -1.499648, 0, 1, 0.5960785, 1,
-0.2134059, 0.1076752, -0.28113, 0, 1, 0.6039216, 1,
-0.2078453, 0.5803866, -0.8318722, 0, 1, 0.6117647, 1,
-0.2064854, -0.348904, -4.318927, 0, 1, 0.6156863, 1,
-0.2063875, 2.095331, -0.1180327, 0, 1, 0.6235294, 1,
-0.2052483, 0.9893253, 1.089164, 0, 1, 0.627451, 1,
-0.2039479, 0.04391115, -0.7121771, 0, 1, 0.6352941, 1,
-0.2028804, -0.7905574, -3.25375, 0, 1, 0.6392157, 1,
-0.1993749, 1.702655, 1.837926, 0, 1, 0.6470588, 1,
-0.195878, 0.4222699, -0.905674, 0, 1, 0.6509804, 1,
-0.1956532, -1.768723, -3.4356, 0, 1, 0.6588235, 1,
-0.1931747, 0.3036518, -0.2505144, 0, 1, 0.6627451, 1,
-0.1883379, 0.5857385, 0.9266509, 0, 1, 0.6705883, 1,
-0.1780093, 1.401469, 1.628007, 0, 1, 0.6745098, 1,
-0.1769417, -0.7631771, -3.727458, 0, 1, 0.682353, 1,
-0.1767556, -1.835562, -1.451405, 0, 1, 0.6862745, 1,
-0.1763056, 0.2672536, -0.2867625, 0, 1, 0.6941177, 1,
-0.1677266, -0.3346292, -4.362282, 0, 1, 0.7019608, 1,
-0.1676471, 0.3367303, 0.7719167, 0, 1, 0.7058824, 1,
-0.1633733, 0.1214986, -0.6112134, 0, 1, 0.7137255, 1,
-0.1606878, -1.097319, -3.511615, 0, 1, 0.7176471, 1,
-0.1554755, -0.5281443, -2.649718, 0, 1, 0.7254902, 1,
-0.1508963, -1.921337, -3.994802, 0, 1, 0.7294118, 1,
-0.1420845, -2.013844, -3.371689, 0, 1, 0.7372549, 1,
-0.1331436, -0.6781853, -2.944433, 0, 1, 0.7411765, 1,
-0.1311983, 0.1793621, -0.1043473, 0, 1, 0.7490196, 1,
-0.1308523, -2.426683, -1.660955, 0, 1, 0.7529412, 1,
-0.1304315, 2.448533, -0.6006062, 0, 1, 0.7607843, 1,
-0.1285061, -1.237323, -3.55412, 0, 1, 0.7647059, 1,
-0.1279749, 0.3757938, -2.403988, 0, 1, 0.772549, 1,
-0.1231016, -1.885467, -1.302666, 0, 1, 0.7764706, 1,
-0.1205353, 0.2642678, -1.162179, 0, 1, 0.7843137, 1,
-0.1179693, 0.6994081, -2.265413, 0, 1, 0.7882353, 1,
-0.1175993, 1.495087, -0.04681071, 0, 1, 0.7960784, 1,
-0.1037604, -0.8761881, -3.230718, 0, 1, 0.8039216, 1,
-0.1033145, -0.808823, -0.7628474, 0, 1, 0.8078431, 1,
-0.1013858, -0.3648705, -2.482148, 0, 1, 0.8156863, 1,
-0.09454226, 0.5414309, -1.968301, 0, 1, 0.8196079, 1,
-0.09293159, 0.6217718, -0.4626507, 0, 1, 0.827451, 1,
-0.0928063, 1.237139, 1.866882, 0, 1, 0.8313726, 1,
-0.09020741, 1.407035, -0.3535414, 0, 1, 0.8392157, 1,
-0.08998255, 1.354584, 1.920906, 0, 1, 0.8431373, 1,
-0.08871898, 2.53518, -0.1635424, 0, 1, 0.8509804, 1,
-0.08406023, -0.3009046, -4.614965, 0, 1, 0.854902, 1,
-0.08394682, -0.7772771, -2.998872, 0, 1, 0.8627451, 1,
-0.07936628, -2.017397, -1.112448, 0, 1, 0.8666667, 1,
-0.0671708, 0.6996703, -0.4810187, 0, 1, 0.8745098, 1,
-0.06588387, -0.9730805, -4.365972, 0, 1, 0.8784314, 1,
-0.05996512, 0.9981349, 0.7380972, 0, 1, 0.8862745, 1,
-0.05663412, -0.8139797, -2.710894, 0, 1, 0.8901961, 1,
-0.04873011, 0.3448371, 0.173926, 0, 1, 0.8980392, 1,
-0.04759134, -0.7329825, -2.932586, 0, 1, 0.9058824, 1,
-0.04724739, 0.738159, -0.3747236, 0, 1, 0.9098039, 1,
-0.0465671, 0.6228826, -0.5860512, 0, 1, 0.9176471, 1,
-0.04350911, -0.2286953, -1.516199, 0, 1, 0.9215686, 1,
-0.03144896, 1.194483, 0.4822452, 0, 1, 0.9294118, 1,
-0.02874831, 0.07781397, -0.4473678, 0, 1, 0.9333333, 1,
-0.02869485, -0.1036701, -3.467328, 0, 1, 0.9411765, 1,
-0.0262449, 0.8913226, -0.04486338, 0, 1, 0.945098, 1,
-0.02181919, -1.301816, -2.508971, 0, 1, 0.9529412, 1,
-0.02096235, -1.793677, -2.538435, 0, 1, 0.9568627, 1,
-0.01797276, -0.3179637, -2.539713, 0, 1, 0.9647059, 1,
-0.01727563, 0.6722689, -1.285502, 0, 1, 0.9686275, 1,
-0.01646876, -0.4952955, -2.272751, 0, 1, 0.9764706, 1,
-0.01563104, -0.6338708, -1.712903, 0, 1, 0.9803922, 1,
-0.01522497, -0.6120661, -2.393094, 0, 1, 0.9882353, 1,
-0.00754466, 1.016194, -0.7008097, 0, 1, 0.9921569, 1,
-0.007518156, -0.2280847, -1.228881, 0, 1, 1, 1,
-0.006224234, 1.209403, 0.09943157, 0, 0.9921569, 1, 1,
-0.00508042, 1.251283, -0.4632718, 0, 0.9882353, 1, 1,
-0.0008611173, 0.4970225, 0.9974323, 0, 0.9803922, 1, 1,
-0.0003596017, -1.89628, -2.409491, 0, 0.9764706, 1, 1,
-4.274907e-06, -2.237943, -2.815691, 0, 0.9686275, 1, 1,
0.001735989, 1.453951, -0.06386411, 0, 0.9647059, 1, 1,
0.001810091, 1.106212, 0.9898654, 0, 0.9568627, 1, 1,
0.00201596, -0.006372934, 2.257561, 0, 0.9529412, 1, 1,
0.003643243, 0.1004042, 1.333407, 0, 0.945098, 1, 1,
0.004743617, -0.6713473, 2.536791, 0, 0.9411765, 1, 1,
0.005581677, -0.08663052, 3.104289, 0, 0.9333333, 1, 1,
0.006367532, 0.1111532, -0.6114805, 0, 0.9294118, 1, 1,
0.008535597, 0.1402643, -1.656206, 0, 0.9215686, 1, 1,
0.01274346, -0.07221869, 2.105862, 0, 0.9176471, 1, 1,
0.01408328, -1.031128, 1.634542, 0, 0.9098039, 1, 1,
0.01573397, 1.978896, -0.7709041, 0, 0.9058824, 1, 1,
0.01584614, -1.458948, 2.186486, 0, 0.8980392, 1, 1,
0.01625606, 1.753762, 1.081878, 0, 0.8901961, 1, 1,
0.01835976, -0.5744368, 3.160511, 0, 0.8862745, 1, 1,
0.02164878, -0.08879281, 2.5214, 0, 0.8784314, 1, 1,
0.02813203, -0.1196855, 2.461936, 0, 0.8745098, 1, 1,
0.03208509, 0.02100744, 0.7868679, 0, 0.8666667, 1, 1,
0.0347924, -0.507747, 4.280155, 0, 0.8627451, 1, 1,
0.03664111, -1.661511, 1.920603, 0, 0.854902, 1, 1,
0.03923124, -0.03301749, 1.285186, 0, 0.8509804, 1, 1,
0.04931968, -0.735294, 4.338653, 0, 0.8431373, 1, 1,
0.050053, -1.203142, 5.116907, 0, 0.8392157, 1, 1,
0.0505389, -1.405729, 2.405881, 0, 0.8313726, 1, 1,
0.0509191, 0.4963908, -0.6713321, 0, 0.827451, 1, 1,
0.05115446, -0.04749659, 1.338355, 0, 0.8196079, 1, 1,
0.05365768, 0.5366036, -0.8989708, 0, 0.8156863, 1, 1,
0.05491681, -1.13297, 2.730628, 0, 0.8078431, 1, 1,
0.05732343, 1.731377, 0.2908551, 0, 0.8039216, 1, 1,
0.05825114, -0.7926276, 3.115131, 0, 0.7960784, 1, 1,
0.06362182, -0.8184956, 3.864192, 0, 0.7882353, 1, 1,
0.06582803, 2.733253, -2.357281, 0, 0.7843137, 1, 1,
0.06593493, -0.2743359, 2.32277, 0, 0.7764706, 1, 1,
0.06608667, 0.8805463, -0.005575213, 0, 0.772549, 1, 1,
0.06962753, -1.581419, 2.485145, 0, 0.7647059, 1, 1,
0.07027694, 1.839, 1.217638, 0, 0.7607843, 1, 1,
0.07122215, 2.183142, -0.8618387, 0, 0.7529412, 1, 1,
0.07481996, -0.7992831, 2.389085, 0, 0.7490196, 1, 1,
0.0749848, 1.281134, -0.8227091, 0, 0.7411765, 1, 1,
0.07656483, -0.4477503, 4.34517, 0, 0.7372549, 1, 1,
0.07778082, -0.4120602, 1.263721, 0, 0.7294118, 1, 1,
0.08286425, -0.4470725, 3.364656, 0, 0.7254902, 1, 1,
0.08555967, 0.06043769, -0.5113467, 0, 0.7176471, 1, 1,
0.09221721, -1.32824, 3.836713, 0, 0.7137255, 1, 1,
0.09859445, -0.9052175, 5.213292, 0, 0.7058824, 1, 1,
0.09930503, 1.228735, 0.7980712, 0, 0.6980392, 1, 1,
0.100799, 0.7194888, 0.1767008, 0, 0.6941177, 1, 1,
0.1030255, -0.9564901, 2.574368, 0, 0.6862745, 1, 1,
0.1033732, -0.7498193, 2.00198, 0, 0.682353, 1, 1,
0.1098746, -0.1617747, 3.141448, 0, 0.6745098, 1, 1,
0.1119096, -0.8004999, 2.181226, 0, 0.6705883, 1, 1,
0.1136735, 0.269603, 0.3114382, 0, 0.6627451, 1, 1,
0.116574, 1.060414, -0.09313936, 0, 0.6588235, 1, 1,
0.11763, 0.01073197, 1.607312, 0, 0.6509804, 1, 1,
0.1211074, 0.5961447, -0.1722595, 0, 0.6470588, 1, 1,
0.1216121, -0.6214243, 2.57639, 0, 0.6392157, 1, 1,
0.1244377, -0.5150157, 3.999133, 0, 0.6352941, 1, 1,
0.1268934, 1.905523, -0.2865341, 0, 0.627451, 1, 1,
0.1276503, -0.7282802, 3.210566, 0, 0.6235294, 1, 1,
0.127681, 2.440641, -1.396904, 0, 0.6156863, 1, 1,
0.1315673, -0.07234517, 2.941341, 0, 0.6117647, 1, 1,
0.1323716, -1.748404, 3.162254, 0, 0.6039216, 1, 1,
0.1340787, -1.794272, 3.388326, 0, 0.5960785, 1, 1,
0.1367265, -0.08421737, 1.899309, 0, 0.5921569, 1, 1,
0.1389431, 1.782297, -0.421344, 0, 0.5843138, 1, 1,
0.1410395, -1.504289, 2.400446, 0, 0.5803922, 1, 1,
0.1424529, -0.837751, 3.268247, 0, 0.572549, 1, 1,
0.1439142, 0.1684954, 1.257697, 0, 0.5686275, 1, 1,
0.1444938, -0.928772, 1.456886, 0, 0.5607843, 1, 1,
0.1452845, -1.448403, 2.897728, 0, 0.5568628, 1, 1,
0.1462736, -1.000409, 4.726095, 0, 0.5490196, 1, 1,
0.1471492, -1.592946, 3.882104, 0, 0.5450981, 1, 1,
0.1491244, 0.4863917, 1.956004, 0, 0.5372549, 1, 1,
0.152369, 0.6878448, -0.06896117, 0, 0.5333334, 1, 1,
0.1558743, 0.3603793, 0.2128549, 0, 0.5254902, 1, 1,
0.1559471, 0.9121174, -0.8914452, 0, 0.5215687, 1, 1,
0.1569367, 1.281296, 0.3673187, 0, 0.5137255, 1, 1,
0.1586422, 0.3496771, 0.8077337, 0, 0.509804, 1, 1,
0.1611996, -0.9853083, 4.593181, 0, 0.5019608, 1, 1,
0.1673519, -1.144068, 3.003091, 0, 0.4941176, 1, 1,
0.1733677, 0.4075517, 1.214299, 0, 0.4901961, 1, 1,
0.1746384, 1.152957, -0.7556303, 0, 0.4823529, 1, 1,
0.1747284, -0.6949829, 1.828425, 0, 0.4784314, 1, 1,
0.1837538, 2.970212, 0.1436072, 0, 0.4705882, 1, 1,
0.1901774, -0.4461795, 3.560413, 0, 0.4666667, 1, 1,
0.1903439, -0.4005094, 2.479107, 0, 0.4588235, 1, 1,
0.1920883, -0.4379925, 2.501011, 0, 0.454902, 1, 1,
0.1962893, 1.801372, -0.1512157, 0, 0.4470588, 1, 1,
0.1978802, 0.3849735, 0.5235283, 0, 0.4431373, 1, 1,
0.2031885, -0.5243052, 2.115355, 0, 0.4352941, 1, 1,
0.2036995, 0.3789753, 0.7611165, 0, 0.4313726, 1, 1,
0.2069946, 1.11588, -1.48895, 0, 0.4235294, 1, 1,
0.207937, -0.4322662, 3.717404, 0, 0.4196078, 1, 1,
0.2109358, -0.4508022, 0.1992149, 0, 0.4117647, 1, 1,
0.2132158, 1.036293, -0.56011, 0, 0.4078431, 1, 1,
0.2255547, -0.950017, 3.867311, 0, 0.4, 1, 1,
0.2320237, 0.3812384, -0.2045731, 0, 0.3921569, 1, 1,
0.2340894, 0.1724003, 1.911846, 0, 0.3882353, 1, 1,
0.2366606, 0.7517318, -0.09204023, 0, 0.3803922, 1, 1,
0.2388337, 1.820513, -0.13284, 0, 0.3764706, 1, 1,
0.2400459, -1.492304, 3.838237, 0, 0.3686275, 1, 1,
0.247369, -0.05791093, 2.670116, 0, 0.3647059, 1, 1,
0.2477782, -0.978412, 3.070354, 0, 0.3568628, 1, 1,
0.2484226, 0.2682023, 1.9238, 0, 0.3529412, 1, 1,
0.2484612, 1.262457, -1.149913, 0, 0.345098, 1, 1,
0.2490836, -0.7967, 2.919211, 0, 0.3411765, 1, 1,
0.2524703, 1.752582, 1.300536, 0, 0.3333333, 1, 1,
0.2574502, 0.04846519, 0.9571253, 0, 0.3294118, 1, 1,
0.2693928, -0.799839, 2.940137, 0, 0.3215686, 1, 1,
0.2719073, -1.032259, 3.664355, 0, 0.3176471, 1, 1,
0.2731661, -0.3014418, 1.320552, 0, 0.3098039, 1, 1,
0.2732525, -0.3190656, 2.491553, 0, 0.3058824, 1, 1,
0.276418, 0.620864, 0.8529275, 0, 0.2980392, 1, 1,
0.2815486, 0.9295355, 0.4585406, 0, 0.2901961, 1, 1,
0.2822009, -0.9310496, 2.838873, 0, 0.2862745, 1, 1,
0.2830139, 1.192368, 0.9115754, 0, 0.2784314, 1, 1,
0.2831767, -0.06889632, 1.858072, 0, 0.2745098, 1, 1,
0.2837706, -0.3242949, 1.921033, 0, 0.2666667, 1, 1,
0.2837714, 1.661218, 1.146902, 0, 0.2627451, 1, 1,
0.2879412, -0.1074966, 1.945424, 0, 0.254902, 1, 1,
0.2892619, -0.1579686, 2.353814, 0, 0.2509804, 1, 1,
0.2896736, -0.979269, 2.252832, 0, 0.2431373, 1, 1,
0.2951297, 1.305326, 0.9793644, 0, 0.2392157, 1, 1,
0.2956947, -0.4439165, 2.230653, 0, 0.2313726, 1, 1,
0.2986073, -1.256509, 2.853423, 0, 0.227451, 1, 1,
0.3006868, -0.3561242, 2.229454, 0, 0.2196078, 1, 1,
0.3008668, -0.8830385, 2.521849, 0, 0.2156863, 1, 1,
0.3017514, 0.1852271, 1.186685, 0, 0.2078431, 1, 1,
0.3039892, 0.4615248, -0.7448284, 0, 0.2039216, 1, 1,
0.3088584, 0.04707242, 2.068328, 0, 0.1960784, 1, 1,
0.309245, -0.4988997, 1.878106, 0, 0.1882353, 1, 1,
0.3193892, 0.1775361, 0.3992417, 0, 0.1843137, 1, 1,
0.3223841, -0.3706459, 2.361384, 0, 0.1764706, 1, 1,
0.3239622, 0.4520093, 0.5845578, 0, 0.172549, 1, 1,
0.3276829, -0.7361493, 2.745429, 0, 0.1647059, 1, 1,
0.3277433, 1.225231, -0.7557307, 0, 0.1607843, 1, 1,
0.3280734, 0.2677315, 1.369867, 0, 0.1529412, 1, 1,
0.3299284, -0.986198, 1.97886, 0, 0.1490196, 1, 1,
0.3323222, 0.6405113, 1.818785, 0, 0.1411765, 1, 1,
0.3329739, 0.763761, -0.7684739, 0, 0.1372549, 1, 1,
0.3350439, -0.08390062, 0.9711689, 0, 0.1294118, 1, 1,
0.335273, 0.1535614, -0.2198355, 0, 0.1254902, 1, 1,
0.3412876, -0.9609265, 2.279328, 0, 0.1176471, 1, 1,
0.3424056, 2.419291, -0.415061, 0, 0.1137255, 1, 1,
0.3446634, 0.1565147, -0.3858379, 0, 0.1058824, 1, 1,
0.3447963, -0.7213985, 2.052902, 0, 0.09803922, 1, 1,
0.3529122, -1.348266, 1.290745, 0, 0.09411765, 1, 1,
0.35398, 0.5176624, 1.002453, 0, 0.08627451, 1, 1,
0.357455, -2.105094, 2.618061, 0, 0.08235294, 1, 1,
0.3622836, 0.922342, 0.291705, 0, 0.07450981, 1, 1,
0.3743885, -1.028308, 1.767493, 0, 0.07058824, 1, 1,
0.3744873, -0.3389243, 2.132168, 0, 0.0627451, 1, 1,
0.3775071, -1.488614, 3.473947, 0, 0.05882353, 1, 1,
0.3807637, 0.116661, 1.259291, 0, 0.05098039, 1, 1,
0.3831103, 1.618775, 0.3448128, 0, 0.04705882, 1, 1,
0.384401, -0.3391113, 1.836029, 0, 0.03921569, 1, 1,
0.3871098, -1.281681, 3.026965, 0, 0.03529412, 1, 1,
0.3891166, -0.05230854, 0.2584053, 0, 0.02745098, 1, 1,
0.3905435, 0.2025932, 1.266861, 0, 0.02352941, 1, 1,
0.40228, 2.350979, 1.081166, 0, 0.01568628, 1, 1,
0.4054145, -0.5717065, 1.019071, 0, 0.01176471, 1, 1,
0.4056804, -1.362558, 2.98104, 0, 0.003921569, 1, 1,
0.4060643, 0.6589576, -0.6646509, 0.003921569, 0, 1, 1,
0.416763, -0.3929239, 2.584662, 0.007843138, 0, 1, 1,
0.4304181, 1.217068, -0.7923195, 0.01568628, 0, 1, 1,
0.4322935, -0.7334481, 1.853372, 0.01960784, 0, 1, 1,
0.432814, 0.2928712, 1.80058, 0.02745098, 0, 1, 1,
0.4345342, 0.3246931, -0.3020101, 0.03137255, 0, 1, 1,
0.4368303, 1.011146, -0.005304098, 0.03921569, 0, 1, 1,
0.4371333, -1.738336, 3.138187, 0.04313726, 0, 1, 1,
0.4426934, -1.836352, 2.055651, 0.05098039, 0, 1, 1,
0.446358, -0.4890115, 2.012097, 0.05490196, 0, 1, 1,
0.4476388, 1.131067, 0.8605401, 0.0627451, 0, 1, 1,
0.452587, 0.7546412, 1.32589, 0.06666667, 0, 1, 1,
0.4531751, -0.3734721, 3.827817, 0.07450981, 0, 1, 1,
0.4540059, 0.7225921, 1.000063, 0.07843138, 0, 1, 1,
0.4576246, -0.2016991, 1.245147, 0.08627451, 0, 1, 1,
0.4579011, 1.34235, -0.7098368, 0.09019608, 0, 1, 1,
0.4636519, -0.9282416, 3.159858, 0.09803922, 0, 1, 1,
0.4720656, -0.5997854, 3.034834, 0.1058824, 0, 1, 1,
0.4752962, 1.804392, -0.512094, 0.1098039, 0, 1, 1,
0.4764498, 1.098641, -0.07465263, 0.1176471, 0, 1, 1,
0.4769268, 0.6592309, -0.4544345, 0.1215686, 0, 1, 1,
0.4797723, -0.7133231, 1.828481, 0.1294118, 0, 1, 1,
0.4816065, 1.858123, -0.1290231, 0.1333333, 0, 1, 1,
0.4854528, -0.4663397, 1.599428, 0.1411765, 0, 1, 1,
0.4901637, 0.9561859, -1.224061, 0.145098, 0, 1, 1,
0.4906993, -0.2860444, 1.386529, 0.1529412, 0, 1, 1,
0.4947848, 1.060075, 0.2454388, 0.1568628, 0, 1, 1,
0.4962662, 1.768977, 0.2981788, 0.1647059, 0, 1, 1,
0.4962846, 1.429567, 0.2371004, 0.1686275, 0, 1, 1,
0.4976994, -1.315485, 2.405046, 0.1764706, 0, 1, 1,
0.498093, 0.9253229, -0.2727383, 0.1803922, 0, 1, 1,
0.5003193, 2.27525, -0.8098872, 0.1882353, 0, 1, 1,
0.5048367, 0.4968216, 0.6691038, 0.1921569, 0, 1, 1,
0.5064158, 0.9327915, 0.4466319, 0.2, 0, 1, 1,
0.5074456, -0.1961173, 1.767491, 0.2078431, 0, 1, 1,
0.5075811, 0.8471108, 1.1252, 0.2117647, 0, 1, 1,
0.5085824, -2.013254, 3.35643, 0.2196078, 0, 1, 1,
0.5123696, -1.565946, 3.6389, 0.2235294, 0, 1, 1,
0.512757, -0.08345157, 1.702599, 0.2313726, 0, 1, 1,
0.5185794, -0.6050383, 3.75013, 0.2352941, 0, 1, 1,
0.5188921, 0.2519461, 1.069415, 0.2431373, 0, 1, 1,
0.5223963, 0.9131321, 0.7921049, 0.2470588, 0, 1, 1,
0.5226342, 0.3367297, 0.9521607, 0.254902, 0, 1, 1,
0.5240553, -0.9993712, 3.377312, 0.2588235, 0, 1, 1,
0.5256903, -1.276413, 2.949968, 0.2666667, 0, 1, 1,
0.5265614, -0.7089859, 2.871056, 0.2705882, 0, 1, 1,
0.5271696, -0.4344445, 2.345796, 0.2784314, 0, 1, 1,
0.5272065, -2.619514, 2.039411, 0.282353, 0, 1, 1,
0.5398483, -0.3050723, 2.018657, 0.2901961, 0, 1, 1,
0.541746, 0.7683355, 1.685535, 0.2941177, 0, 1, 1,
0.5452363, 0.8115528, 0.5664594, 0.3019608, 0, 1, 1,
0.5453468, 0.4177835, 0.2450733, 0.3098039, 0, 1, 1,
0.5457936, -0.5071536, 3.327706, 0.3137255, 0, 1, 1,
0.5498162, 0.2230378, 1.676134, 0.3215686, 0, 1, 1,
0.5537463, -0.8248282, 3.707013, 0.3254902, 0, 1, 1,
0.5540795, -0.7174316, 0.8291769, 0.3333333, 0, 1, 1,
0.5600241, -2.285121, 0.9022778, 0.3372549, 0, 1, 1,
0.5602938, 0.7486839, -0.0843022, 0.345098, 0, 1, 1,
0.5603038, 0.8870881, -1.069907, 0.3490196, 0, 1, 1,
0.5642735, 0.1007403, 0.6584614, 0.3568628, 0, 1, 1,
0.5648748, -0.05884115, 2.211497, 0.3607843, 0, 1, 1,
0.5664536, 0.9443725, -2.36457, 0.3686275, 0, 1, 1,
0.5670409, 1.056717, -0.1629969, 0.372549, 0, 1, 1,
0.5680889, -1.307113, 4.036712, 0.3803922, 0, 1, 1,
0.5684696, 1.490016, 0.4472921, 0.3843137, 0, 1, 1,
0.5722111, -0.3266688, 2.666858, 0.3921569, 0, 1, 1,
0.5755434, 1.058619, 0.8518091, 0.3960784, 0, 1, 1,
0.5776824, 1.415585, 0.7182267, 0.4039216, 0, 1, 1,
0.5817606, 1.940238, -0.8619801, 0.4117647, 0, 1, 1,
0.5903497, -0.9348677, 2.1129, 0.4156863, 0, 1, 1,
0.5909109, 0.5328255, 2.101755, 0.4235294, 0, 1, 1,
0.5911446, 0.9700838, -0.2959855, 0.427451, 0, 1, 1,
0.5977749, -1.102856, 2.695766, 0.4352941, 0, 1, 1,
0.6001732, 0.7972543, 1.012457, 0.4392157, 0, 1, 1,
0.6072581, 0.2707169, 1.286539, 0.4470588, 0, 1, 1,
0.6072761, 0.1661816, 0.9025497, 0.4509804, 0, 1, 1,
0.6101651, 0.1513833, 0.362969, 0.4588235, 0, 1, 1,
0.6130661, -0.2976702, 2.821093, 0.4627451, 0, 1, 1,
0.6132121, 1.117039, 0.4528035, 0.4705882, 0, 1, 1,
0.6162422, -1.063849, 1.605015, 0.4745098, 0, 1, 1,
0.6181649, -0.8627402, 4.579713, 0.4823529, 0, 1, 1,
0.6184824, 1.005668, 1.701472, 0.4862745, 0, 1, 1,
0.6201778, -0.236011, 1.408567, 0.4941176, 0, 1, 1,
0.620938, -0.0187154, 2.603533, 0.5019608, 0, 1, 1,
0.621718, -0.1547033, 1.188997, 0.5058824, 0, 1, 1,
0.6217718, -0.4663693, 1.139091, 0.5137255, 0, 1, 1,
0.6253427, -0.6066146, 2.995291, 0.5176471, 0, 1, 1,
0.6282267, -0.6331538, 2.670804, 0.5254902, 0, 1, 1,
0.6284373, 0.1017878, 2.866175, 0.5294118, 0, 1, 1,
0.6294675, -1.10681, 2.548677, 0.5372549, 0, 1, 1,
0.629611, 0.6934667, 1.017655, 0.5411765, 0, 1, 1,
0.6296114, -1.39129, 4.007864, 0.5490196, 0, 1, 1,
0.6304062, -1.032677, 2.9288, 0.5529412, 0, 1, 1,
0.6304504, -0.463715, 4.909745, 0.5607843, 0, 1, 1,
0.6312104, -0.8069208, 2.095995, 0.5647059, 0, 1, 1,
0.6318019, -0.7282504, 2.952153, 0.572549, 0, 1, 1,
0.6388446, -1.67559, 0.7048779, 0.5764706, 0, 1, 1,
0.6454744, -0.2027457, 0.05927606, 0.5843138, 0, 1, 1,
0.6540977, -0.4943841, 1.877315, 0.5882353, 0, 1, 1,
0.655549, 0.06291345, 0.7377614, 0.5960785, 0, 1, 1,
0.6645476, -0.2849984, 1.985763, 0.6039216, 0, 1, 1,
0.674193, 0.77146, 1.640467, 0.6078432, 0, 1, 1,
0.6769131, -1.920587, 1.136946, 0.6156863, 0, 1, 1,
0.6775537, 1.935332, -0.1342298, 0.6196079, 0, 1, 1,
0.6776819, -2.143897, 2.286845, 0.627451, 0, 1, 1,
0.6800289, -2.360737, 2.72262, 0.6313726, 0, 1, 1,
0.6826746, 0.8985703, 0.3234536, 0.6392157, 0, 1, 1,
0.6860849, -0.2748155, 1.581521, 0.6431373, 0, 1, 1,
0.6982241, 0.7042282, -0.4738621, 0.6509804, 0, 1, 1,
0.7013218, 0.2698998, 0.4829791, 0.654902, 0, 1, 1,
0.70242, -1.984716, 2.038346, 0.6627451, 0, 1, 1,
0.7110119, -1.303307, 2.800228, 0.6666667, 0, 1, 1,
0.7128485, -0.763874, 3.49462, 0.6745098, 0, 1, 1,
0.7141432, 0.03993306, 1.296595, 0.6784314, 0, 1, 1,
0.7156988, 1.461334, 2.108473, 0.6862745, 0, 1, 1,
0.7254802, -1.847629, 0.669354, 0.6901961, 0, 1, 1,
0.7316303, 0.2302574, 0.9907653, 0.6980392, 0, 1, 1,
0.7349675, -1.113984, 2.122855, 0.7058824, 0, 1, 1,
0.7399544, 0.6538802, 0.02844543, 0.7098039, 0, 1, 1,
0.7448776, 1.305554, 0.7679081, 0.7176471, 0, 1, 1,
0.7465101, -1.770391, 1.816436, 0.7215686, 0, 1, 1,
0.7510716, -0.2269425, 4.413127, 0.7294118, 0, 1, 1,
0.7511808, 0.9444251, 0.1451082, 0.7333333, 0, 1, 1,
0.7513162, -2.055336, 2.286723, 0.7411765, 0, 1, 1,
0.751597, 1.621751, 0.3907968, 0.7450981, 0, 1, 1,
0.752105, 0.3263259, 2.794127, 0.7529412, 0, 1, 1,
0.7613766, -1.809243, 3.761221, 0.7568628, 0, 1, 1,
0.7637994, -0.8793783, 1.43374, 0.7647059, 0, 1, 1,
0.7673517, 1.779234, 1.241806, 0.7686275, 0, 1, 1,
0.7695293, 0.1310984, 0.6416771, 0.7764706, 0, 1, 1,
0.7715184, 1.312721, 1.281573, 0.7803922, 0, 1, 1,
0.7829049, -1.588333, 3.174872, 0.7882353, 0, 1, 1,
0.7852644, -1.553116, 1.451406, 0.7921569, 0, 1, 1,
0.7880922, -0.6443117, 2.106528, 0.8, 0, 1, 1,
0.7949379, -0.07539424, 3.207509, 0.8078431, 0, 1, 1,
0.7959932, -0.3943673, 1.693075, 0.8117647, 0, 1, 1,
0.7976816, -0.1469923, 2.646126, 0.8196079, 0, 1, 1,
0.8079818, 0.6352577, 1.863245, 0.8235294, 0, 1, 1,
0.8096526, -0.9366996, 1.702932, 0.8313726, 0, 1, 1,
0.810769, -0.560798, 2.30939, 0.8352941, 0, 1, 1,
0.8125978, 0.951511, 0.7873173, 0.8431373, 0, 1, 1,
0.8152938, -0.1938433, 2.231074, 0.8470588, 0, 1, 1,
0.8157362, -1.95012, 3.014029, 0.854902, 0, 1, 1,
0.8184379, 0.4704567, 1.01885, 0.8588235, 0, 1, 1,
0.8217938, -0.8396109, 2.293813, 0.8666667, 0, 1, 1,
0.8230074, 0.5780158, -0.971103, 0.8705882, 0, 1, 1,
0.8232284, 0.379443, 0.3006943, 0.8784314, 0, 1, 1,
0.8251861, 0.254977, -0.2266194, 0.8823529, 0, 1, 1,
0.8327207, -1.361375, 1.140221, 0.8901961, 0, 1, 1,
0.8335782, -1.607276, 2.393984, 0.8941177, 0, 1, 1,
0.8418814, 0.9951739, 1.894524, 0.9019608, 0, 1, 1,
0.8449674, -0.5778101, 2.398938, 0.9098039, 0, 1, 1,
0.847261, 2.117697, 0.7585779, 0.9137255, 0, 1, 1,
0.8489947, -1.393686, 3.485776, 0.9215686, 0, 1, 1,
0.8500734, -0.2466014, 1.576564, 0.9254902, 0, 1, 1,
0.8544338, -0.2458736, 1.073185, 0.9333333, 0, 1, 1,
0.8577842, 0.9050487, 1.659587, 0.9372549, 0, 1, 1,
0.8675375, 0.2863846, 1.033103, 0.945098, 0, 1, 1,
0.8715383, 1.59835, -0.1086052, 0.9490196, 0, 1, 1,
0.8725616, -1.276829, 2.214315, 0.9568627, 0, 1, 1,
0.8775963, -0.1594695, 2.237413, 0.9607843, 0, 1, 1,
0.8794871, -0.2938273, 2.668677, 0.9686275, 0, 1, 1,
0.8811976, -1.480676, 1.154845, 0.972549, 0, 1, 1,
0.8832706, 0.8418069, 0.839516, 0.9803922, 0, 1, 1,
0.8912048, 0.07339758, 2.648009, 0.9843137, 0, 1, 1,
0.8997959, -0.8427145, 2.586671, 0.9921569, 0, 1, 1,
0.9027669, -0.07337788, 0.7477819, 0.9960784, 0, 1, 1,
0.903307, -0.2767796, 3.054044, 1, 0, 0.9960784, 1,
0.9067744, -0.9381702, 3.563595, 1, 0, 0.9882353, 1,
0.9205336, 1.184738, 0.7977234, 1, 0, 0.9843137, 1,
0.9274969, 0.6099238, 0.9665943, 1, 0, 0.9764706, 1,
0.9373704, 0.5888948, 1.419613, 1, 0, 0.972549, 1,
0.9387592, 0.7326308, 1.363136, 1, 0, 0.9647059, 1,
0.9437298, -0.5055986, 2.084594, 1, 0, 0.9607843, 1,
0.9508797, -0.8140022, 1.26454, 1, 0, 0.9529412, 1,
0.9512294, 0.6861902, 1.580522, 1, 0, 0.9490196, 1,
0.9552316, 1.614393, 2.438974, 1, 0, 0.9411765, 1,
0.9566463, 0.1179299, 2.486374, 1, 0, 0.9372549, 1,
0.9566469, 0.361872, 2.568304, 1, 0, 0.9294118, 1,
0.9572646, -0.7814598, 1.944114, 1, 0, 0.9254902, 1,
0.9619066, -0.9228382, 1.557801, 1, 0, 0.9176471, 1,
0.9627573, 0.1197467, 1.861506, 1, 0, 0.9137255, 1,
0.9673623, 0.3746256, 2.292317, 1, 0, 0.9058824, 1,
0.9711506, -1.242412, 2.49135, 1, 0, 0.9019608, 1,
0.9764308, 0.2609842, 2.482597, 1, 0, 0.8941177, 1,
0.9844162, -0.3832332, 2.398419, 1, 0, 0.8862745, 1,
0.988363, -0.5778954, 2.917238, 1, 0, 0.8823529, 1,
0.9942978, 0.5609242, 1.329219, 1, 0, 0.8745098, 1,
1.003023, 0.6864333, 1.658304, 1, 0, 0.8705882, 1,
1.003066, -1.936455, 2.436789, 1, 0, 0.8627451, 1,
1.005425, -0.02883944, 1.254981, 1, 0, 0.8588235, 1,
1.019609, -1.776838, 1.596801, 1, 0, 0.8509804, 1,
1.023333, 0.2669114, 1.042653, 1, 0, 0.8470588, 1,
1.033908, -0.5722228, 1.670758, 1, 0, 0.8392157, 1,
1.034874, -0.4352458, 1.617995, 1, 0, 0.8352941, 1,
1.040947, -0.008010426, 3.669358, 1, 0, 0.827451, 1,
1.041878, 0.42728, 0.5660548, 1, 0, 0.8235294, 1,
1.045667, 1.202849, -0.3303194, 1, 0, 0.8156863, 1,
1.051483, 0.6140533, 0.01068175, 1, 0, 0.8117647, 1,
1.055557, 0.6634507, 1.414314, 1, 0, 0.8039216, 1,
1.058294, 0.7809311, 0.1090665, 1, 0, 0.7960784, 1,
1.058801, -1.571399, 1.326841, 1, 0, 0.7921569, 1,
1.062868, -0.03004256, 1.799874, 1, 0, 0.7843137, 1,
1.062933, 1.613835, 0.711324, 1, 0, 0.7803922, 1,
1.063884, -1.17966, 3.023156, 1, 0, 0.772549, 1,
1.065036, -0.6438743, 2.250448, 1, 0, 0.7686275, 1,
1.06514, 0.6722542, -0.6449929, 1, 0, 0.7607843, 1,
1.068199, 1.389403, 1.5633, 1, 0, 0.7568628, 1,
1.072542, 0.1777562, -0.7275456, 1, 0, 0.7490196, 1,
1.073661, -0.2800065, 1.615486, 1, 0, 0.7450981, 1,
1.079961, -1.664095, 1.920365, 1, 0, 0.7372549, 1,
1.101857, -1.10931, 2.391138, 1, 0, 0.7333333, 1,
1.108701, -0.9954878, 1.882633, 1, 0, 0.7254902, 1,
1.111555, 0.4710763, 0.9366426, 1, 0, 0.7215686, 1,
1.113173, -0.6707888, 2.894809, 1, 0, 0.7137255, 1,
1.11534, -0.1616783, 0.5261244, 1, 0, 0.7098039, 1,
1.116918, -0.2517995, 2.163474, 1, 0, 0.7019608, 1,
1.117759, 1.743171, 0.9341173, 1, 0, 0.6941177, 1,
1.126296, -1.129113, 2.743201, 1, 0, 0.6901961, 1,
1.126996, -0.7440499, 0.4020583, 1, 0, 0.682353, 1,
1.137535, 1.119496, -1.031074, 1, 0, 0.6784314, 1,
1.141254, 0.1043934, 3.785268, 1, 0, 0.6705883, 1,
1.152147, 0.7814298, -0.877889, 1, 0, 0.6666667, 1,
1.161995, 0.7684478, -0.2147158, 1, 0, 0.6588235, 1,
1.183277, -0.5943357, 2.232693, 1, 0, 0.654902, 1,
1.19366, 0.8580207, 1.805341, 1, 0, 0.6470588, 1,
1.194149, -0.9912195, 2.886721, 1, 0, 0.6431373, 1,
1.195954, -0.1042023, 3.21781, 1, 0, 0.6352941, 1,
1.200466, -1.196045, 3.26726, 1, 0, 0.6313726, 1,
1.21068, 1.441542, -0.9801618, 1, 0, 0.6235294, 1,
1.217894, 0.7302663, 2.177802, 1, 0, 0.6196079, 1,
1.218022, 0.9413615, 0.8798484, 1, 0, 0.6117647, 1,
1.219526, -0.3759739, 4.508988, 1, 0, 0.6078432, 1,
1.220446, -0.5807185, 1.639663, 1, 0, 0.6, 1,
1.227611, 0.9034563, -0.3437085, 1, 0, 0.5921569, 1,
1.2304, -0.6722789, 2.681335, 1, 0, 0.5882353, 1,
1.234866, 1.443007, -1.085326, 1, 0, 0.5803922, 1,
1.235, -1.18312, 2.126403, 1, 0, 0.5764706, 1,
1.236286, -0.9355706, 1.497996, 1, 0, 0.5686275, 1,
1.23722, -1.67881, 3.267589, 1, 0, 0.5647059, 1,
1.244029, -0.8100457, 0.7323745, 1, 0, 0.5568628, 1,
1.256878, -0.4953079, 2.228102, 1, 0, 0.5529412, 1,
1.258649, -1.469537, 1.119181, 1, 0, 0.5450981, 1,
1.277492, -0.2886494, 1.079438, 1, 0, 0.5411765, 1,
1.281848, -0.9451562, 0.7643344, 1, 0, 0.5333334, 1,
1.282849, -0.3933007, 1.635086, 1, 0, 0.5294118, 1,
1.286182, -0.3492818, 1.180971, 1, 0, 0.5215687, 1,
1.286878, 0.03805512, -0.308792, 1, 0, 0.5176471, 1,
1.291842, -2.136803, 1.830431, 1, 0, 0.509804, 1,
1.298802, 0.6619615, 1.735442, 1, 0, 0.5058824, 1,
1.308509, -0.4440815, 1.791543, 1, 0, 0.4980392, 1,
1.309401, -1.855723, 3.340502, 1, 0, 0.4901961, 1,
1.309543, -0.8125819, 2.089767, 1, 0, 0.4862745, 1,
1.31296, -0.5974472, 3.125927, 1, 0, 0.4784314, 1,
1.313224, -0.8019491, 2.657606, 1, 0, 0.4745098, 1,
1.317139, -1.271801, 2.320657, 1, 0, 0.4666667, 1,
1.340349, -0.2757485, 1.931569, 1, 0, 0.4627451, 1,
1.340809, 0.03171349, 3.247493, 1, 0, 0.454902, 1,
1.34105, -0.7277071, 3.056112, 1, 0, 0.4509804, 1,
1.353533, 2.341271, 0.6784106, 1, 0, 0.4431373, 1,
1.356866, -0.1397264, 2.429181, 1, 0, 0.4392157, 1,
1.364465, 1.088087, 0.4572074, 1, 0, 0.4313726, 1,
1.382779, -0.1282043, 2.324551, 1, 0, 0.427451, 1,
1.385666, 1.548717, 1.304471, 1, 0, 0.4196078, 1,
1.400958, -1.076571, 3.786342, 1, 0, 0.4156863, 1,
1.402062, -0.5938947, 2.620186, 1, 0, 0.4078431, 1,
1.404579, -0.9005288, 2.484319, 1, 0, 0.4039216, 1,
1.429001, 2.043653, 0.4344297, 1, 0, 0.3960784, 1,
1.438027, -0.05882812, 1.169558, 1, 0, 0.3882353, 1,
1.442605, -0.3830368, 2.685112, 1, 0, 0.3843137, 1,
1.453537, -0.925855, 0.8091732, 1, 0, 0.3764706, 1,
1.460865, 1.007957, 1.068628, 1, 0, 0.372549, 1,
1.460877, 0.2644803, 1.442127, 1, 0, 0.3647059, 1,
1.461689, -0.9526569, 3.230514, 1, 0, 0.3607843, 1,
1.473002, -0.3769501, 2.608821, 1, 0, 0.3529412, 1,
1.499417, 0.05663236, 2.090553, 1, 0, 0.3490196, 1,
1.502038, 2.981148, 2.101612, 1, 0, 0.3411765, 1,
1.512111, -1.04234, 3.03122, 1, 0, 0.3372549, 1,
1.519796, 0.3938794, 1.543674, 1, 0, 0.3294118, 1,
1.533902, -0.2903049, 1.854533, 1, 0, 0.3254902, 1,
1.544385, -0.6712568, 1.919376, 1, 0, 0.3176471, 1,
1.564236, -0.6026842, 2.277418, 1, 0, 0.3137255, 1,
1.572072, 1.358399, 1.780982, 1, 0, 0.3058824, 1,
1.580659, 1.151828, 1.974313, 1, 0, 0.2980392, 1,
1.583322, 0.9936322, -0.3547521, 1, 0, 0.2941177, 1,
1.586963, 0.03626589, 0.6592151, 1, 0, 0.2862745, 1,
1.591173, 1.025138, 1.686674, 1, 0, 0.282353, 1,
1.597019, 0.9507107, 0.3926011, 1, 0, 0.2745098, 1,
1.605533, 0.6425148, 1.91407, 1, 0, 0.2705882, 1,
1.616955, -1.641491, 1.457122, 1, 0, 0.2627451, 1,
1.622718, -0.4559638, 1.171669, 1, 0, 0.2588235, 1,
1.631489, 0.02322528, 3.014354, 1, 0, 0.2509804, 1,
1.635078, 0.9857378, 2.418849, 1, 0, 0.2470588, 1,
1.638667, 1.091646, 0.9409088, 1, 0, 0.2392157, 1,
1.671511, 0.5430061, 1.852737, 1, 0, 0.2352941, 1,
1.675867, -0.4844985, 3.243017, 1, 0, 0.227451, 1,
1.706672, 0.4941203, 0.7301725, 1, 0, 0.2235294, 1,
1.720045, -1.122399, 2.514372, 1, 0, 0.2156863, 1,
1.720262, 0.1379156, 2.000822, 1, 0, 0.2117647, 1,
1.722062, -0.4829713, 0.2700632, 1, 0, 0.2039216, 1,
1.744784, 0.8912213, -0.03655853, 1, 0, 0.1960784, 1,
1.771769, 2.496135, 0.9152311, 1, 0, 0.1921569, 1,
1.845091, 1.594561, 0.03518625, 1, 0, 0.1843137, 1,
1.847381, -1.377511, 2.860582, 1, 0, 0.1803922, 1,
1.848626, -0.008369418, 2.675445, 1, 0, 0.172549, 1,
1.859179, 0.2560958, 1.320312, 1, 0, 0.1686275, 1,
1.870648, -0.1727005, 1.255466, 1, 0, 0.1607843, 1,
1.874429, -0.3460025, 1.616274, 1, 0, 0.1568628, 1,
1.97773, 0.4708234, 1.137622, 1, 0, 0.1490196, 1,
1.983886, -0.06056431, 0.4743536, 1, 0, 0.145098, 1,
2.05675, 1.779789, 2.079611, 1, 0, 0.1372549, 1,
2.057326, -0.5932783, 0.05644211, 1, 0, 0.1333333, 1,
2.060799, 1.578832, 0.840876, 1, 0, 0.1254902, 1,
2.141105, 0.873449, 1.282054, 1, 0, 0.1215686, 1,
2.158055, 0.408959, 1.780466, 1, 0, 0.1137255, 1,
2.16145, -0.1672302, 3.006991, 1, 0, 0.1098039, 1,
2.242809, -0.09568413, 3.235138, 1, 0, 0.1019608, 1,
2.261497, -0.1334557, 2.403126, 1, 0, 0.09411765, 1,
2.267947, 1.008136, 1.057605, 1, 0, 0.09019608, 1,
2.270155, 0.2835777, 2.802026, 1, 0, 0.08235294, 1,
2.303946, 0.9503123, 1.374449, 1, 0, 0.07843138, 1,
2.323737, -2.067768, 2.970175, 1, 0, 0.07058824, 1,
2.335521, 0.4918364, 2.553922, 1, 0, 0.06666667, 1,
2.345337, -1.517117, 2.793551, 1, 0, 0.05882353, 1,
2.364822, 1.303651, 2.207027, 1, 0, 0.05490196, 1,
2.381887, 0.1523759, 1.806621, 1, 0, 0.04705882, 1,
2.423793, 1.13732, 1.281543, 1, 0, 0.04313726, 1,
2.427173, 0.2731918, 1.103739, 1, 0, 0.03529412, 1,
2.435848, 0.3395286, 1.899282, 1, 0, 0.03137255, 1,
2.585055, -1.460404, 2.707031, 1, 0, 0.02352941, 1,
2.626554, 0.4067446, 3.522905, 1, 0, 0.01960784, 1,
2.758361, 0.4167903, 0.9033448, 1, 0, 0.01176471, 1,
3.151653, 0.3408867, -0.1562139, 1, 0, 0.007843138, 1
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
-0.01584053, -3.989952, -6.974372, 0, -0.5, 0.5, 0.5,
-0.01584053, -3.989952, -6.974372, 1, -0.5, 0.5, 0.5,
-0.01584053, -3.989952, -6.974372, 1, 1.5, 0.5, 0.5,
-0.01584053, -3.989952, -6.974372, 0, 1.5, 0.5, 0.5
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
-4.257114, 0.1051698, -6.974372, 0, -0.5, 0.5, 0.5,
-4.257114, 0.1051698, -6.974372, 1, -0.5, 0.5, 0.5,
-4.257114, 0.1051698, -6.974372, 1, 1.5, 0.5, 0.5,
-4.257114, 0.1051698, -6.974372, 0, 1.5, 0.5, 0.5
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
-4.257114, -3.989952, 0.002661467, 0, -0.5, 0.5, 0.5,
-4.257114, -3.989952, 0.002661467, 1, -0.5, 0.5, 0.5,
-4.257114, -3.989952, 0.002661467, 1, 1.5, 0.5, 0.5,
-4.257114, -3.989952, 0.002661467, 0, 1.5, 0.5, 0.5
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
-3, -3.044924, -5.364288,
3, -3.044924, -5.364288,
-3, -3.044924, -5.364288,
-3, -3.202429, -5.632635,
-2, -3.044924, -5.364288,
-2, -3.202429, -5.632635,
-1, -3.044924, -5.364288,
-1, -3.202429, -5.632635,
0, -3.044924, -5.364288,
0, -3.202429, -5.632635,
1, -3.044924, -5.364288,
1, -3.202429, -5.632635,
2, -3.044924, -5.364288,
2, -3.202429, -5.632635,
3, -3.044924, -5.364288,
3, -3.202429, -5.632635
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
-3, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
-3, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
-3, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
-3, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
-2, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
-2, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
-2, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
-2, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
-1, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
-1, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
-1, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
-1, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
0, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
0, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
0, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
0, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
1, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
1, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
1, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
1, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
2, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
2, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
2, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
2, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5,
3, -3.517438, -6.16933, 0, -0.5, 0.5, 0.5,
3, -3.517438, -6.16933, 1, -0.5, 0.5, 0.5,
3, -3.517438, -6.16933, 1, 1.5, 0.5, 0.5,
3, -3.517438, -6.16933, 0, 1.5, 0.5, 0.5
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
-3.278358, -2, -5.364288,
-3.278358, 3, -5.364288,
-3.278358, -2, -5.364288,
-3.441484, -2, -5.632635,
-3.278358, -1, -5.364288,
-3.441484, -1, -5.632635,
-3.278358, 0, -5.364288,
-3.441484, 0, -5.632635,
-3.278358, 1, -5.364288,
-3.441484, 1, -5.632635,
-3.278358, 2, -5.364288,
-3.441484, 2, -5.632635,
-3.278358, 3, -5.364288,
-3.441484, 3, -5.632635
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
-3.767736, -2, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, -2, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, -2, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, -2, -6.16933, 0, 1.5, 0.5, 0.5,
-3.767736, -1, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, -1, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, -1, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, -1, -6.16933, 0, 1.5, 0.5, 0.5,
-3.767736, 0, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, 0, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, 0, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, 0, -6.16933, 0, 1.5, 0.5, 0.5,
-3.767736, 1, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, 1, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, 1, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, 1, -6.16933, 0, 1.5, 0.5, 0.5,
-3.767736, 2, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, 2, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, 2, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, 2, -6.16933, 0, 1.5, 0.5, 0.5,
-3.767736, 3, -6.16933, 0, -0.5, 0.5, 0.5,
-3.767736, 3, -6.16933, 1, -0.5, 0.5, 0.5,
-3.767736, 3, -6.16933, 1, 1.5, 0.5, 0.5,
-3.767736, 3, -6.16933, 0, 1.5, 0.5, 0.5
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
-3.278358, -3.044924, -4,
-3.278358, -3.044924, 4,
-3.278358, -3.044924, -4,
-3.441484, -3.202429, -4,
-3.278358, -3.044924, -2,
-3.441484, -3.202429, -2,
-3.278358, -3.044924, 0,
-3.441484, -3.202429, 0,
-3.278358, -3.044924, 2,
-3.441484, -3.202429, 2,
-3.278358, -3.044924, 4,
-3.441484, -3.202429, 4
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
-3.767736, -3.517438, -4, 0, -0.5, 0.5, 0.5,
-3.767736, -3.517438, -4, 1, -0.5, 0.5, 0.5,
-3.767736, -3.517438, -4, 1, 1.5, 0.5, 0.5,
-3.767736, -3.517438, -4, 0, 1.5, 0.5, 0.5,
-3.767736, -3.517438, -2, 0, -0.5, 0.5, 0.5,
-3.767736, -3.517438, -2, 1, -0.5, 0.5, 0.5,
-3.767736, -3.517438, -2, 1, 1.5, 0.5, 0.5,
-3.767736, -3.517438, -2, 0, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 0, 0, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 0, 1, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 0, 1, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 0, 0, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 2, 0, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 2, 1, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 2, 1, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 2, 0, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 4, 0, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 4, 1, -0.5, 0.5, 0.5,
-3.767736, -3.517438, 4, 1, 1.5, 0.5, 0.5,
-3.767736, -3.517438, 4, 0, 1.5, 0.5, 0.5
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
-3.278358, -3.044924, -5.364288,
-3.278358, 3.255264, -5.364288,
-3.278358, -3.044924, 5.369611,
-3.278358, 3.255264, 5.369611,
-3.278358, -3.044924, -5.364288,
-3.278358, -3.044924, 5.369611,
-3.278358, 3.255264, -5.364288,
-3.278358, 3.255264, 5.369611,
-3.278358, -3.044924, -5.364288,
3.246677, -3.044924, -5.364288,
-3.278358, -3.044924, 5.369611,
3.246677, -3.044924, 5.369611,
-3.278358, 3.255264, -5.364288,
3.246677, 3.255264, -5.364288,
-3.278358, 3.255264, 5.369611,
3.246677, 3.255264, 5.369611,
3.246677, -3.044924, -5.364288,
3.246677, 3.255264, -5.364288,
3.246677, -3.044924, 5.369611,
3.246677, 3.255264, 5.369611,
3.246677, -3.044924, -5.364288,
3.246677, -3.044924, 5.369611,
3.246677, 3.255264, -5.364288,
3.246677, 3.255264, 5.369611
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
var radius = 7.503995;
var distance = 33.38612;
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
mvMatrix.translate( 0.01584053, -0.1051698, -0.002661467 );
mvMatrix.scale( 1.243436, 1.287813, 0.7558733 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.38612);
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
2-Anilino-4-methyl-6<-read.table("2-Anilino-4-methyl-6.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-Anilino-4-methyl-6$V2
```

```
## Error in eval(expr, envir, enclos): object 'Anilino' not found
```

```r
y<-2-Anilino-4-methyl-6$V3
```

```
## Error in eval(expr, envir, enclos): object 'Anilino' not found
```

```r
z<-2-Anilino-4-methyl-6$V4
```

```
## Error in eval(expr, envir, enclos): object 'Anilino' not found
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
-3.183334, -0.1959816, -2.443114, 0, 0, 1, 1, 1,
-2.711428, -1.861833, -3.337199, 1, 0, 0, 1, 1,
-2.545452, 0.3889192, -1.435585, 1, 0, 0, 1, 1,
-2.45945, 0.2698177, 0.4452623, 1, 0, 0, 1, 1,
-2.374741, -0.7297421, -1.880479, 1, 0, 0, 1, 1,
-2.316921, -1.139484, -2.849634, 1, 0, 0, 1, 1,
-2.302189, 0.9005234, -0.881344, 0, 0, 0, 1, 1,
-2.28722, 1.268995, -0.1980436, 0, 0, 0, 1, 1,
-2.208734, 1.034433, 0.04610163, 0, 0, 0, 1, 1,
-2.18274, 0.9120644, -0.4397328, 0, 0, 0, 1, 1,
-2.138206, 0.2528372, -2.936663, 0, 0, 0, 1, 1,
-2.127876, 0.4697356, -0.7215543, 0, 0, 0, 1, 1,
-2.102232, 0.9624482, -1.764167, 0, 0, 0, 1, 1,
-2.078412, 0.4745246, -2.330389, 1, 1, 1, 1, 1,
-2.066429, 0.476605, -0.2998568, 1, 1, 1, 1, 1,
-2.0061, 0.7551311, -2.907006, 1, 1, 1, 1, 1,
-1.97189, 0.4106726, -2.815316, 1, 1, 1, 1, 1,
-1.925341, -0.0364594, -0.1410899, 1, 1, 1, 1, 1,
-1.919754, -0.7647387, -2.520012, 1, 1, 1, 1, 1,
-1.877772, 0.3866069, -1.218002, 1, 1, 1, 1, 1,
-1.868118, -1.592101, -1.638428, 1, 1, 1, 1, 1,
-1.864602, 0.8272721, -1.129135, 1, 1, 1, 1, 1,
-1.854003, -1.485156, -2.663661, 1, 1, 1, 1, 1,
-1.838004, 0.8737689, -0.4822737, 1, 1, 1, 1, 1,
-1.831396, 0.5711733, -1.340245, 1, 1, 1, 1, 1,
-1.825155, 2.242038, -1.064564, 1, 1, 1, 1, 1,
-1.801077, -1.029158, -1.967379, 1, 1, 1, 1, 1,
-1.795349, -0.9233389, -2.172481, 1, 1, 1, 1, 1,
-1.784101, 0.681841, -1.602184, 0, 0, 1, 1, 1,
-1.777246, 1.829907, -0.1190355, 1, 0, 0, 1, 1,
-1.771426, 0.9546245, -1.218284, 1, 0, 0, 1, 1,
-1.768567, 1.108927, 0.5547763, 1, 0, 0, 1, 1,
-1.734884, 1.169327, -1.370411, 1, 0, 0, 1, 1,
-1.733884, 0.08434959, -0.8385991, 1, 0, 0, 1, 1,
-1.731919, 0.3210707, -2.434858, 0, 0, 0, 1, 1,
-1.731187, 0.557804, -1.551033, 0, 0, 0, 1, 1,
-1.720767, 1.222752, -1.749142, 0, 0, 0, 1, 1,
-1.718918, 0.2069619, -1.432676, 0, 0, 0, 1, 1,
-1.696747, 0.02445449, 0.5209224, 0, 0, 0, 1, 1,
-1.693948, -0.7717206, -2.496637, 0, 0, 0, 1, 1,
-1.688165, 0.2834845, -0.5128877, 0, 0, 0, 1, 1,
-1.678083, 0.138758, -3.237716, 1, 1, 1, 1, 1,
-1.673006, 0.9326915, -1.076362, 1, 1, 1, 1, 1,
-1.665782, -1.03194, -4.198432, 1, 1, 1, 1, 1,
-1.665211, 0.6714562, 0.3821719, 1, 1, 1, 1, 1,
-1.663894, -0.10303, -2.302753, 1, 1, 1, 1, 1,
-1.661065, 1.264614, -1.292599, 1, 1, 1, 1, 1,
-1.651151, -0.7833515, -2.261052, 1, 1, 1, 1, 1,
-1.621401, 1.899694, -1.634273, 1, 1, 1, 1, 1,
-1.607128, 0.4278983, -1.167266, 1, 1, 1, 1, 1,
-1.606735, -0.2384474, -3.489874, 1, 1, 1, 1, 1,
-1.583942, -0.4293559, -1.223708, 1, 1, 1, 1, 1,
-1.567248, -0.06404503, -2.810295, 1, 1, 1, 1, 1,
-1.548946, 0.9985211, -1.664043, 1, 1, 1, 1, 1,
-1.537172, -1.603776, -2.152675, 1, 1, 1, 1, 1,
-1.533841, -1.132315, -0.5220004, 1, 1, 1, 1, 1,
-1.532302, -0.7050624, -1.836766, 0, 0, 1, 1, 1,
-1.525857, 1.278793, -3.938037, 1, 0, 0, 1, 1,
-1.525202, -0.2597608, -2.546994, 1, 0, 0, 1, 1,
-1.513914, 0.3192612, -0.6763206, 1, 0, 0, 1, 1,
-1.513113, 0.1556309, -2.752167, 1, 0, 0, 1, 1,
-1.510957, -0.1816655, -2.098372, 1, 0, 0, 1, 1,
-1.510903, 2.118427, -0.4850139, 0, 0, 0, 1, 1,
-1.510763, -0.1496145, -2.61408, 0, 0, 0, 1, 1,
-1.50912, 0.1875506, -1.205034, 0, 0, 0, 1, 1,
-1.506601, 0.6878275, -0.1907336, 0, 0, 0, 1, 1,
-1.497084, 0.6226743, -1.938864, 0, 0, 0, 1, 1,
-1.482192, -0.0918871, -1.656403, 0, 0, 0, 1, 1,
-1.479854, 0.1210396, -1.382971, 0, 0, 0, 1, 1,
-1.476592, 0.8381307, 0.8028725, 1, 1, 1, 1, 1,
-1.463632, -0.5626272, -1.564635, 1, 1, 1, 1, 1,
-1.462463, 0.876915, 0.2996478, 1, 1, 1, 1, 1,
-1.461658, 0.2764963, -0.6655533, 1, 1, 1, 1, 1,
-1.447339, 0.4993042, -0.6390536, 1, 1, 1, 1, 1,
-1.440069, -1.199949, -3.023522, 1, 1, 1, 1, 1,
-1.43328, 1.388848, -0.5961004, 1, 1, 1, 1, 1,
-1.428442, -0.3415838, -2.597708, 1, 1, 1, 1, 1,
-1.39476, 0.6090474, 0.1105116, 1, 1, 1, 1, 1,
-1.391218, -0.111635, 0.05270119, 1, 1, 1, 1, 1,
-1.384338, -0.8865427, -2.322538, 1, 1, 1, 1, 1,
-1.379731, 1.611605, -0.513728, 1, 1, 1, 1, 1,
-1.373214, -0.9687985, -2.788471, 1, 1, 1, 1, 1,
-1.364622, 0.2926449, 1.024363, 1, 1, 1, 1, 1,
-1.362779, 0.0957769, -1.615209, 1, 1, 1, 1, 1,
-1.358914, -1.083279, -2.933201, 0, 0, 1, 1, 1,
-1.352596, 0.9737173, -1.602433, 1, 0, 0, 1, 1,
-1.350319, 1.19071, -2.060113, 1, 0, 0, 1, 1,
-1.349031, 0.339676, -1.191701, 1, 0, 0, 1, 1,
-1.342786, 0.7986415, -3.02891, 1, 0, 0, 1, 1,
-1.34181, 0.6718302, -2.740515, 1, 0, 0, 1, 1,
-1.320436, -0.2349705, -3.955097, 0, 0, 0, 1, 1,
-1.300426, 0.7893962, 0.350416, 0, 0, 0, 1, 1,
-1.291874, -0.9183648, -1.071419, 0, 0, 0, 1, 1,
-1.288397, 0.6556382, -3.006213, 0, 0, 0, 1, 1,
-1.28564, -0.3775412, -2.34874, 0, 0, 0, 1, 1,
-1.284264, 0.2069344, -1.399162, 0, 0, 0, 1, 1,
-1.279526, 0.2541924, -1.05059, 0, 0, 0, 1, 1,
-1.275528, 0.3887766, -1.424672, 1, 1, 1, 1, 1,
-1.272203, 2.039899, 0.9581238, 1, 1, 1, 1, 1,
-1.269923, -0.2558856, -1.985, 1, 1, 1, 1, 1,
-1.263006, -2.953174, -2.825818, 1, 1, 1, 1, 1,
-1.261959, 0.6234152, -0.4003171, 1, 1, 1, 1, 1,
-1.256414, 0.1776322, -1.415442, 1, 1, 1, 1, 1,
-1.256266, 0.1148021, -1.484313, 1, 1, 1, 1, 1,
-1.24273, -0.1889726, -2.007184, 1, 1, 1, 1, 1,
-1.238386, 0.366294, -0.2303189, 1, 1, 1, 1, 1,
-1.22714, 0.4316119, -1.466328, 1, 1, 1, 1, 1,
-1.204978, -1.022373, -2.654271, 1, 1, 1, 1, 1,
-1.201046, 1.097111, 0.5075828, 1, 1, 1, 1, 1,
-1.198885, 0.6011541, -1.600862, 1, 1, 1, 1, 1,
-1.198746, -0.1219243, -1.518526, 1, 1, 1, 1, 1,
-1.191777, -1.068868, -1.589332, 1, 1, 1, 1, 1,
-1.188625, 0.3614493, -0.7231399, 0, 0, 1, 1, 1,
-1.176762, -0.07195164, -0.472305, 1, 0, 0, 1, 1,
-1.174537, -0.2728252, -0.745809, 1, 0, 0, 1, 1,
-1.173007, -2.031787, -2.145329, 1, 0, 0, 1, 1,
-1.169558, 0.4108125, -2.384993, 1, 0, 0, 1, 1,
-1.167952, -2.54573, -2.722134, 1, 0, 0, 1, 1,
-1.164746, -0.921227, -4.096193, 0, 0, 0, 1, 1,
-1.158662, -0.03060405, 0.3621844, 0, 0, 0, 1, 1,
-1.146513, 0.883076, -0.4906217, 0, 0, 0, 1, 1,
-1.13799, -0.34685, -2.202274, 0, 0, 0, 1, 1,
-1.132856, -0.2438022, -1.63991, 0, 0, 0, 1, 1,
-1.127436, -0.05011677, 0.284422, 0, 0, 0, 1, 1,
-1.126223, -0.5468786, -1.44914, 0, 0, 0, 1, 1,
-1.126192, -1.118651, -1.255413, 1, 1, 1, 1, 1,
-1.11196, 0.1379887, -0.7699007, 1, 1, 1, 1, 1,
-1.111014, 0.4363899, -0.4737339, 1, 1, 1, 1, 1,
-1.109235, -0.5194396, -1.427689, 1, 1, 1, 1, 1,
-1.105956, -0.09882457, -2.435586, 1, 1, 1, 1, 1,
-1.103645, 1.169544, -0.8792866, 1, 1, 1, 1, 1,
-1.087862, 0.4115429, -0.6082735, 1, 1, 1, 1, 1,
-1.087208, 0.1586912, -2.356234, 1, 1, 1, 1, 1,
-1.084552, -1.152486, -1.728807, 1, 1, 1, 1, 1,
-1.084179, 0.6259897, -1.79589, 1, 1, 1, 1, 1,
-1.077436, 0.7423955, 1.014359, 1, 1, 1, 1, 1,
-1.076176, -0.9269698, -3.853927, 1, 1, 1, 1, 1,
-1.066404, -0.05894983, -3.320204, 1, 1, 1, 1, 1,
-1.061539, -0.04411867, -1.635529, 1, 1, 1, 1, 1,
-1.049206, 2.042022, -1.406026, 1, 1, 1, 1, 1,
-1.048049, -0.257348, -1.434911, 0, 0, 1, 1, 1,
-1.047613, 0.1644686, -1.499744, 1, 0, 0, 1, 1,
-1.02653, -0.7261478, -1.938011, 1, 0, 0, 1, 1,
-1.026512, 0.01325124, -1.28218, 1, 0, 0, 1, 1,
-1.026065, 0.539056, -2.990845, 1, 0, 0, 1, 1,
-1.022453, 0.260783, -1.754587, 1, 0, 0, 1, 1,
-1.02182, -1.484576, -2.104647, 0, 0, 0, 1, 1,
-1.017958, -0.371049, -2.133877, 0, 0, 0, 1, 1,
-1.012515, 2.19684, -0.8981156, 0, 0, 0, 1, 1,
-1.007202, -1.595491, -4.287712, 0, 0, 0, 1, 1,
-1.001257, -0.1957526, -1.659359, 0, 0, 0, 1, 1,
-1.000064, 0.7211399, 0.08686709, 0, 0, 0, 1, 1,
-0.9967207, 0.3423725, -0.7488247, 0, 0, 0, 1, 1,
-0.9958793, 3.038076, -1.060845, 1, 1, 1, 1, 1,
-0.9944133, -0.987069, -4.952804, 1, 1, 1, 1, 1,
-0.9941728, -0.4820712, -2.580631, 1, 1, 1, 1, 1,
-0.9892716, -2.250444, -2.047699, 1, 1, 1, 1, 1,
-0.9889292, -0.5404893, 0.5872881, 1, 1, 1, 1, 1,
-0.9885387, -0.9372401, -2.183269, 1, 1, 1, 1, 1,
-0.987936, -0.4063555, -2.684319, 1, 1, 1, 1, 1,
-0.9870099, 0.1796229, -1.538502, 1, 1, 1, 1, 1,
-0.968716, 0.2654218, -0.2932561, 1, 1, 1, 1, 1,
-0.9678464, -1.950991, -3.677499, 1, 1, 1, 1, 1,
-0.965551, -0.8480957, -1.647282, 1, 1, 1, 1, 1,
-0.9579106, 1.127091, -2.687726, 1, 1, 1, 1, 1,
-0.9498535, -0.5461564, -1.997761, 1, 1, 1, 1, 1,
-0.9442157, -0.2926708, -0.4466957, 1, 1, 1, 1, 1,
-0.936972, -0.1815782, -1.228448, 1, 1, 1, 1, 1,
-0.931636, 1.689393, 1.52385, 0, 0, 1, 1, 1,
-0.9292721, -1.013878, -0.7745669, 1, 0, 0, 1, 1,
-0.9273049, -0.3577592, -2.982965, 1, 0, 0, 1, 1,
-0.9114202, -0.3869445, -1.75336, 1, 0, 0, 1, 1,
-0.9054825, 1.445108, -0.003147595, 1, 0, 0, 1, 1,
-0.8958995, -0.06713772, -2.081853, 1, 0, 0, 1, 1,
-0.8874532, 2.415056, 0.1089766, 0, 0, 0, 1, 1,
-0.887257, -0.1411537, -2.775264, 0, 0, 0, 1, 1,
-0.885538, 1.184892, -0.09962526, 0, 0, 0, 1, 1,
-0.8844455, 0.9980944, -1.466267, 0, 0, 0, 1, 1,
-0.8776252, 0.3432879, -0.5528861, 0, 0, 0, 1, 1,
-0.877302, 0.283864, -0.6016448, 0, 0, 0, 1, 1,
-0.8730117, -1.852787, -3.457403, 0, 0, 0, 1, 1,
-0.8710626, 0.811591, 0.1055553, 1, 1, 1, 1, 1,
-0.8681868, 0.2463523, -4.189798, 1, 1, 1, 1, 1,
-0.8627502, 0.789527, 2.065353, 1, 1, 1, 1, 1,
-0.862426, -1.003556, -2.646168, 1, 1, 1, 1, 1,
-0.8604542, 0.09738511, -1.057163, 1, 1, 1, 1, 1,
-0.8582476, 0.4267439, -1.4263, 1, 1, 1, 1, 1,
-0.8573071, -1.006375, -3.102695, 1, 1, 1, 1, 1,
-0.8446493, -1.868074, -3.336695, 1, 1, 1, 1, 1,
-0.841428, -0.4089783, -1.992405, 1, 1, 1, 1, 1,
-0.8384042, 1.325598, -0.2004278, 1, 1, 1, 1, 1,
-0.8356384, -0.688755, -1.765688, 1, 1, 1, 1, 1,
-0.8344916, -0.07699194, -2.411757, 1, 1, 1, 1, 1,
-0.8336108, -0.636947, -2.530025, 1, 1, 1, 1, 1,
-0.8333088, -0.4734604, -3.79912, 1, 1, 1, 1, 1,
-0.8258724, 0.2548671, -1.494418, 1, 1, 1, 1, 1,
-0.8225536, -0.2249375, -1.922169, 0, 0, 1, 1, 1,
-0.819032, 0.3342738, -2.076329, 1, 0, 0, 1, 1,
-0.8180795, 0.1283638, -2.710496, 1, 0, 0, 1, 1,
-0.8178389, -1.155398, -2.600527, 1, 0, 0, 1, 1,
-0.8150296, -2.502107, -2.30367, 1, 0, 0, 1, 1,
-0.8133367, -1.035817, -4.023817, 1, 0, 0, 1, 1,
-0.8128909, 0.482109, 0.1283094, 0, 0, 0, 1, 1,
-0.7984856, -0.5461524, -2.321602, 0, 0, 0, 1, 1,
-0.7980738, 1.046544, -1.206104, 0, 0, 0, 1, 1,
-0.7947975, 0.01207367, 0.8198825, 0, 0, 0, 1, 1,
-0.7925695, -0.467093, -2.513417, 0, 0, 0, 1, 1,
-0.7909105, 1.480764, -0.1013555, 0, 0, 0, 1, 1,
-0.7893854, 0.2764138, -0.5735422, 0, 0, 0, 1, 1,
-0.7893348, 1.077062, -0.4732808, 1, 1, 1, 1, 1,
-0.7893093, 0.5560672, 0.4663648, 1, 1, 1, 1, 1,
-0.7869509, 0.4250552, -3.661881, 1, 1, 1, 1, 1,
-0.7809114, 0.2599734, -0.8834437, 1, 1, 1, 1, 1,
-0.7666593, 0.1459828, -0.5645958, 1, 1, 1, 1, 1,
-0.7628353, 1.124645, 0.1750668, 1, 1, 1, 1, 1,
-0.7615727, -1.549057, -1.440753, 1, 1, 1, 1, 1,
-0.7583732, -0.9408098, -3.727581, 1, 1, 1, 1, 1,
-0.7483151, -0.8487011, -1.098492, 1, 1, 1, 1, 1,
-0.7464604, -1.14766, -3.170672, 1, 1, 1, 1, 1,
-0.7444295, 1.508831, 1.049539, 1, 1, 1, 1, 1,
-0.743153, -2.19693, -3.18307, 1, 1, 1, 1, 1,
-0.7413118, -1.338092, -5.13197, 1, 1, 1, 1, 1,
-0.7384453, -0.6787337, -2.433959, 1, 1, 1, 1, 1,
-0.7273445, -0.4655363, -1.406945, 1, 1, 1, 1, 1,
-0.7272802, 0.1634552, -2.145722, 0, 0, 1, 1, 1,
-0.7243028, 0.7067154, -0.6496624, 1, 0, 0, 1, 1,
-0.7220035, -0.6493994, -3.032843, 1, 0, 0, 1, 1,
-0.7194331, -0.1188963, -2.068094, 1, 0, 0, 1, 1,
-0.7188592, 0.2891679, -0.9318706, 1, 0, 0, 1, 1,
-0.7163891, -0.5328636, -3.552318, 1, 0, 0, 1, 1,
-0.7124706, 1.610183, 0.2751844, 0, 0, 0, 1, 1,
-0.7103869, 0.4013745, -2.316127, 0, 0, 0, 1, 1,
-0.7088733, -0.4619702, -2.686914, 0, 0, 0, 1, 1,
-0.7079822, 0.212967, -0.4315176, 0, 0, 0, 1, 1,
-0.7071353, 0.799217, 0.5457681, 0, 0, 0, 1, 1,
-0.7035698, 0.661684, -0.7129458, 0, 0, 0, 1, 1,
-0.7018676, -0.5249919, -2.345395, 0, 0, 0, 1, 1,
-0.7004591, -1.060529, -3.06685, 1, 1, 1, 1, 1,
-0.6975495, 0.06682431, -0.515501, 1, 1, 1, 1, 1,
-0.6968549, 1.833337, 0.03805416, 1, 1, 1, 1, 1,
-0.6906654, -0.485027, -0.9321404, 1, 1, 1, 1, 1,
-0.6855085, -0.3753023, -3.381803, 1, 1, 1, 1, 1,
-0.6828901, 0.621704, -1.616311, 1, 1, 1, 1, 1,
-0.682452, -0.6448505, -1.653332, 1, 1, 1, 1, 1,
-0.6818337, -1.167638, -3.114393, 1, 1, 1, 1, 1,
-0.6790298, -0.1157878, -0.8256894, 1, 1, 1, 1, 1,
-0.6785366, -0.8255001, -3.88156, 1, 1, 1, 1, 1,
-0.6758487, 1.314704, 0.2466413, 1, 1, 1, 1, 1,
-0.6737735, 0.08860627, -1.955719, 1, 1, 1, 1, 1,
-0.6657978, 1.606349, 0.7600986, 1, 1, 1, 1, 1,
-0.6652175, 0.7169884, -0.9182932, 1, 1, 1, 1, 1,
-0.6643174, -0.2911204, -1.685552, 1, 1, 1, 1, 1,
-0.6607981, -0.1866316, -1.780796, 0, 0, 1, 1, 1,
-0.6578801, 0.6678977, -0.6986871, 1, 0, 0, 1, 1,
-0.6522935, -1.026266, -2.068164, 1, 0, 0, 1, 1,
-0.6519339, -1.366819, -1.789782, 1, 0, 0, 1, 1,
-0.6494743, -0.4754798, -2.703021, 1, 0, 0, 1, 1,
-0.648317, -0.06144873, -1.734799, 1, 0, 0, 1, 1,
-0.6407478, 0.9340548, -1.075226, 0, 0, 0, 1, 1,
-0.6382255, 2.025831, -0.9201113, 0, 0, 0, 1, 1,
-0.6378074, 1.18116, 1.204476, 0, 0, 0, 1, 1,
-0.6350683, -1.599649, -2.590483, 0, 0, 0, 1, 1,
-0.6344641, 1.464677, -1.593246, 0, 0, 0, 1, 1,
-0.6327895, -0.8926526, -1.835151, 0, 0, 0, 1, 1,
-0.631955, 1.290356, -0.1009326, 0, 0, 0, 1, 1,
-0.6285066, 1.383276, -1.408802, 1, 1, 1, 1, 1,
-0.6273945, 0.1871687, -1.048164, 1, 1, 1, 1, 1,
-0.6215234, 0.1821065, -1.013508, 1, 1, 1, 1, 1,
-0.6207144, 0.3358322, -1.638445, 1, 1, 1, 1, 1,
-0.6192628, -0.02824587, -2.277223, 1, 1, 1, 1, 1,
-0.6185537, -0.8359281, -2.840798, 1, 1, 1, 1, 1,
-0.6069875, -1.517837, -2.426871, 1, 1, 1, 1, 1,
-0.6059404, -1.597066, -3.517475, 1, 1, 1, 1, 1,
-0.596829, -0.5159591, -3.448113, 1, 1, 1, 1, 1,
-0.5922602, -0.4216631, -2.551002, 1, 1, 1, 1, 1,
-0.589857, -1.388526, -2.796825, 1, 1, 1, 1, 1,
-0.5874686, -0.04667644, -0.275672, 1, 1, 1, 1, 1,
-0.5859794, 0.3369162, -3.093218, 1, 1, 1, 1, 1,
-0.5827727, 0.1607256, 0.7685454, 1, 1, 1, 1, 1,
-0.5827364, 1.104962, -1.537663, 1, 1, 1, 1, 1,
-0.5822157, -0.1915154, -1.045873, 0, 0, 1, 1, 1,
-0.5743285, 0.4950335, -0.7766038, 1, 0, 0, 1, 1,
-0.5741543, 2.064461, -1.018748, 1, 0, 0, 1, 1,
-0.5709512, 1.154155, -0.6805757, 1, 0, 0, 1, 1,
-0.563961, 0.972204, -0.7452946, 1, 0, 0, 1, 1,
-0.5638635, -1.801179, -3.131598, 1, 0, 0, 1, 1,
-0.5598929, -0.8911641, -2.063224, 0, 0, 0, 1, 1,
-0.5583688, 0.9294937, -0.3705882, 0, 0, 0, 1, 1,
-0.5504199, -0.6840525, -2.170491, 0, 0, 0, 1, 1,
-0.5502084, -1.771768, -4.187049, 0, 0, 0, 1, 1,
-0.5439584, -0.3027882, -2.732997, 0, 0, 0, 1, 1,
-0.5429877, 0.623197, -0.7907944, 0, 0, 0, 1, 1,
-0.5371362, 0.5267639, -1.20361, 0, 0, 0, 1, 1,
-0.5332767, -0.3948641, -3.568294, 1, 1, 1, 1, 1,
-0.53126, -0.7142694, -2.685748, 1, 1, 1, 1, 1,
-0.5302268, -1.398252, -1.547401, 1, 1, 1, 1, 1,
-0.5271702, -0.3974081, -1.825872, 1, 1, 1, 1, 1,
-0.5215492, 1.095444, -0.6422068, 1, 1, 1, 1, 1,
-0.5205551, -0.9200194, -1.391776, 1, 1, 1, 1, 1,
-0.515478, -1.229487, -1.630148, 1, 1, 1, 1, 1,
-0.5121434, -0.1172125, -2.960379, 1, 1, 1, 1, 1,
-0.5097052, 0.7630389, -0.006278803, 1, 1, 1, 1, 1,
-0.5090187, 0.9873972, 0.2064884, 1, 1, 1, 1, 1,
-0.507997, 0.7103264, -0.2295091, 1, 1, 1, 1, 1,
-0.5062777, -0.08508283, -0.5942655, 1, 1, 1, 1, 1,
-0.5037676, -1.374782, -2.435996, 1, 1, 1, 1, 1,
-0.5031422, 0.3796782, -1.41369, 1, 1, 1, 1, 1,
-0.4984768, -0.1736192, -0.4773512, 1, 1, 1, 1, 1,
-0.4970752, 0.3512823, -1.858918, 0, 0, 1, 1, 1,
-0.4951565, -0.4571414, -3.15977, 1, 0, 0, 1, 1,
-0.4919971, -1.40936, -1.053279, 1, 0, 0, 1, 1,
-0.4919415, 0.3817543, -0.3883809, 1, 0, 0, 1, 1,
-0.4916503, 0.8811278, -0.4226208, 1, 0, 0, 1, 1,
-0.4912686, -1.344516, -1.515333, 1, 0, 0, 1, 1,
-0.4911694, 0.08123802, -1.167227, 0, 0, 0, 1, 1,
-0.4909477, -0.4250387, -1.238476, 0, 0, 0, 1, 1,
-0.4880295, -1.677524, -2.685856, 0, 0, 0, 1, 1,
-0.487236, -1.111514, -2.11747, 0, 0, 0, 1, 1,
-0.4846911, 0.5597141, 0.6899169, 0, 0, 0, 1, 1,
-0.4734429, 0.5955824, -1.70408, 0, 0, 0, 1, 1,
-0.473055, 1.674051, -0.403428, 0, 0, 0, 1, 1,
-0.4722624, 0.8339523, -0.2326618, 1, 1, 1, 1, 1,
-0.4696477, -1.069093, -2.999668, 1, 1, 1, 1, 1,
-0.464875, 1.139797, -0.9579745, 1, 1, 1, 1, 1,
-0.4616614, -0.07112278, -0.7890899, 1, 1, 1, 1, 1,
-0.460991, 1.280651, -0.2164103, 1, 1, 1, 1, 1,
-0.4608303, 0.685122, -1.291069, 1, 1, 1, 1, 1,
-0.4575794, -2.871685, -5.207969, 1, 1, 1, 1, 1,
-0.4573772, 0.6383114, -1.170771, 1, 1, 1, 1, 1,
-0.4525109, 1.583627, 2.037389, 1, 1, 1, 1, 1,
-0.4512201, 0.1565425, -1.185746, 1, 1, 1, 1, 1,
-0.4509848, 0.1029377, 1.015532, 1, 1, 1, 1, 1,
-0.4506014, -0.2294484, -1.799033, 1, 1, 1, 1, 1,
-0.4490284, 0.07062163, -0.01647523, 1, 1, 1, 1, 1,
-0.4460841, -0.2476404, -1.106588, 1, 1, 1, 1, 1,
-0.4437529, 0.6026168, 0.2405147, 1, 1, 1, 1, 1,
-0.4405856, 1.837392, 1.742645, 0, 0, 1, 1, 1,
-0.4377699, 0.1612405, -1.875662, 1, 0, 0, 1, 1,
-0.4328853, -0.3257953, -3.932804, 1, 0, 0, 1, 1,
-0.4328238, 0.5825084, -1.129566, 1, 0, 0, 1, 1,
-0.4322018, 0.9768221, 1.076615, 1, 0, 0, 1, 1,
-0.4243927, -1.321156, -1.851743, 1, 0, 0, 1, 1,
-0.4243902, -0.9437509, -2.813622, 0, 0, 0, 1, 1,
-0.4237194, 1.628147, -0.08669405, 0, 0, 0, 1, 1,
-0.422135, -0.9862449, -2.52464, 0, 0, 0, 1, 1,
-0.4217528, -1.101992, -2.859568, 0, 0, 0, 1, 1,
-0.4207735, 0.5789981, -1.262892, 0, 0, 0, 1, 1,
-0.4201654, 1.654422, 1.757455, 0, 0, 0, 1, 1,
-0.4196143, 1.156793, 0.3628539, 0, 0, 0, 1, 1,
-0.4193857, -0.6714454, -2.497219, 1, 1, 1, 1, 1,
-0.4140146, -1.36408, -3.373743, 1, 1, 1, 1, 1,
-0.404566, -0.1838332, -2.393291, 1, 1, 1, 1, 1,
-0.4022806, 0.6613908, -0.00896269, 1, 1, 1, 1, 1,
-0.4013014, -1.6625, -1.867612, 1, 1, 1, 1, 1,
-0.4006559, 1.005941, -0.3384259, 1, 1, 1, 1, 1,
-0.3969033, -1.685349, -2.521762, 1, 1, 1, 1, 1,
-0.3967304, 1.276973, -2.522215, 1, 1, 1, 1, 1,
-0.3937946, 0.596644, -1.502536, 1, 1, 1, 1, 1,
-0.3926314, -1.033887, -2.758057, 1, 1, 1, 1, 1,
-0.3907425, 1.015177, 0.0197561, 1, 1, 1, 1, 1,
-0.3903899, 0.8757179, -0.2018048, 1, 1, 1, 1, 1,
-0.3893685, -1.325598, -2.902482, 1, 1, 1, 1, 1,
-0.387594, 1.040814, -1.716106, 1, 1, 1, 1, 1,
-0.3860035, 0.3568479, 0.5561476, 1, 1, 1, 1, 1,
-0.3855727, 0.5593876, 0.0623218, 0, 0, 1, 1, 1,
-0.3813675, 0.2700986, -1.976959, 1, 0, 0, 1, 1,
-0.3796332, -0.6045208, -0.5447364, 1, 0, 0, 1, 1,
-0.3782488, 1.719495, -1.59476, 1, 0, 0, 1, 1,
-0.3731559, -0.8575421, -3.468398, 1, 0, 0, 1, 1,
-0.3709057, 1.219302, -1.211654, 1, 0, 0, 1, 1,
-0.3675398, 0.330922, -0.007463736, 0, 0, 0, 1, 1,
-0.3622545, 1.37419, 0.6554513, 0, 0, 0, 1, 1,
-0.3611201, 0.4522217, 0.7772894, 0, 0, 0, 1, 1,
-0.3597623, 1.717263, -0.7198758, 0, 0, 0, 1, 1,
-0.3572629, 3.163513, 1.495476, 0, 0, 0, 1, 1,
-0.3548848, 0.6112906, -2.537934, 0, 0, 0, 1, 1,
-0.3496425, -0.1165737, -1.608757, 0, 0, 0, 1, 1,
-0.3482772, -0.402766, -2.524476, 1, 1, 1, 1, 1,
-0.3479018, -0.7988068, -3.565025, 1, 1, 1, 1, 1,
-0.3477238, 0.0663522, -0.2294328, 1, 1, 1, 1, 1,
-0.3468099, -0.3014136, -1.955751, 1, 1, 1, 1, 1,
-0.3463176, -1.219962, -2.343164, 1, 1, 1, 1, 1,
-0.3445367, 1.708467, -0.6991717, 1, 1, 1, 1, 1,
-0.3444884, -0.2042578, -1.633866, 1, 1, 1, 1, 1,
-0.3440219, 0.147319, -2.756718, 1, 1, 1, 1, 1,
-0.3412648, -0.9101257, -4.055783, 1, 1, 1, 1, 1,
-0.3368858, 0.2323742, -0.8958625, 1, 1, 1, 1, 1,
-0.3360274, -1.313243, -2.994985, 1, 1, 1, 1, 1,
-0.3315467, -0.2623779, -1.733638, 1, 1, 1, 1, 1,
-0.3313663, 0.5441644, -1.608444, 1, 1, 1, 1, 1,
-0.3301526, -0.7755127, -3.247569, 1, 1, 1, 1, 1,
-0.3188342, 0.3010727, 1.300797, 1, 1, 1, 1, 1,
-0.3183273, 0.2494951, -1.110086, 0, 0, 1, 1, 1,
-0.316437, 0.9620661, -3.00244, 1, 0, 0, 1, 1,
-0.3142834, 0.2502193, -0.7146153, 1, 0, 0, 1, 1,
-0.3092999, 0.2815847, -0.8503475, 1, 0, 0, 1, 1,
-0.305735, 0.5374812, -0.7344205, 1, 0, 0, 1, 1,
-0.293958, -0.6224755, -2.112598, 1, 0, 0, 1, 1,
-0.2885109, -1.097222, -1.969225, 0, 0, 0, 1, 1,
-0.2836987, 0.02411936, -0.4543037, 0, 0, 0, 1, 1,
-0.2764458, -0.2211383, -1.174115, 0, 0, 0, 1, 1,
-0.270678, 0.391803, -0.7601101, 0, 0, 0, 1, 1,
-0.2703973, -1.358759, -4.394293, 0, 0, 0, 1, 1,
-0.2696262, -0.7108172, -3.384386, 0, 0, 0, 1, 1,
-0.2659232, 0.2597732, -1.500975, 0, 0, 0, 1, 1,
-0.2630654, -2.140271, -2.910743, 1, 1, 1, 1, 1,
-0.2550724, 0.431903, 0.4325452, 1, 1, 1, 1, 1,
-0.2550637, -0.9523219, -2.470038, 1, 1, 1, 1, 1,
-0.2543356, 0.7523056, 1.226639, 1, 1, 1, 1, 1,
-0.2522698, 0.1583427, -0.7292376, 1, 1, 1, 1, 1,
-0.2489259, -0.03670246, -0.2779467, 1, 1, 1, 1, 1,
-0.2431559, -2.110217, -3.570338, 1, 1, 1, 1, 1,
-0.2427515, 2.418631, -2.205849, 1, 1, 1, 1, 1,
-0.2416809, 0.1449654, -2.52438, 1, 1, 1, 1, 1,
-0.2415881, -0.7773277, -2.642488, 1, 1, 1, 1, 1,
-0.2415147, 0.2069891, -0.08533005, 1, 1, 1, 1, 1,
-0.2394934, -0.9787938, -2.391706, 1, 1, 1, 1, 1,
-0.2391198, 0.3592744, 0.3966531, 1, 1, 1, 1, 1,
-0.2380186, -1.833911, -2.968822, 1, 1, 1, 1, 1,
-0.23703, -1.42717, -2.272845, 1, 1, 1, 1, 1,
-0.236669, -1.715069, -2.50062, 0, 0, 1, 1, 1,
-0.2365796, -0.5818009, -1.591489, 1, 0, 0, 1, 1,
-0.2340565, -0.1052063, 0.2600929, 1, 0, 0, 1, 1,
-0.2311801, -1.269415, -3.539544, 1, 0, 0, 1, 1,
-0.2301265, 0.1071042, -1.901434, 1, 0, 0, 1, 1,
-0.2299384, -1.805543, -4.495053, 1, 0, 0, 1, 1,
-0.2195959, 0.25317, -1.900446, 0, 0, 0, 1, 1,
-0.2175345, -0.5017446, -5.042663, 0, 0, 0, 1, 1,
-0.2174815, -0.07103829, -3.439358, 0, 0, 0, 1, 1,
-0.2164747, -0.7833064, -0.8075541, 0, 0, 0, 1, 1,
-0.2157912, 0.6466449, -1.936851, 0, 0, 0, 1, 1,
-0.215453, -0.193358, -2.802189, 0, 0, 0, 1, 1,
-0.2148113, -0.09377053, -2.14948, 0, 0, 0, 1, 1,
-0.2144298, 0.2092674, -1.499648, 1, 1, 1, 1, 1,
-0.2134059, 0.1076752, -0.28113, 1, 1, 1, 1, 1,
-0.2078453, 0.5803866, -0.8318722, 1, 1, 1, 1, 1,
-0.2064854, -0.348904, -4.318927, 1, 1, 1, 1, 1,
-0.2063875, 2.095331, -0.1180327, 1, 1, 1, 1, 1,
-0.2052483, 0.9893253, 1.089164, 1, 1, 1, 1, 1,
-0.2039479, 0.04391115, -0.7121771, 1, 1, 1, 1, 1,
-0.2028804, -0.7905574, -3.25375, 1, 1, 1, 1, 1,
-0.1993749, 1.702655, 1.837926, 1, 1, 1, 1, 1,
-0.195878, 0.4222699, -0.905674, 1, 1, 1, 1, 1,
-0.1956532, -1.768723, -3.4356, 1, 1, 1, 1, 1,
-0.1931747, 0.3036518, -0.2505144, 1, 1, 1, 1, 1,
-0.1883379, 0.5857385, 0.9266509, 1, 1, 1, 1, 1,
-0.1780093, 1.401469, 1.628007, 1, 1, 1, 1, 1,
-0.1769417, -0.7631771, -3.727458, 1, 1, 1, 1, 1,
-0.1767556, -1.835562, -1.451405, 0, 0, 1, 1, 1,
-0.1763056, 0.2672536, -0.2867625, 1, 0, 0, 1, 1,
-0.1677266, -0.3346292, -4.362282, 1, 0, 0, 1, 1,
-0.1676471, 0.3367303, 0.7719167, 1, 0, 0, 1, 1,
-0.1633733, 0.1214986, -0.6112134, 1, 0, 0, 1, 1,
-0.1606878, -1.097319, -3.511615, 1, 0, 0, 1, 1,
-0.1554755, -0.5281443, -2.649718, 0, 0, 0, 1, 1,
-0.1508963, -1.921337, -3.994802, 0, 0, 0, 1, 1,
-0.1420845, -2.013844, -3.371689, 0, 0, 0, 1, 1,
-0.1331436, -0.6781853, -2.944433, 0, 0, 0, 1, 1,
-0.1311983, 0.1793621, -0.1043473, 0, 0, 0, 1, 1,
-0.1308523, -2.426683, -1.660955, 0, 0, 0, 1, 1,
-0.1304315, 2.448533, -0.6006062, 0, 0, 0, 1, 1,
-0.1285061, -1.237323, -3.55412, 1, 1, 1, 1, 1,
-0.1279749, 0.3757938, -2.403988, 1, 1, 1, 1, 1,
-0.1231016, -1.885467, -1.302666, 1, 1, 1, 1, 1,
-0.1205353, 0.2642678, -1.162179, 1, 1, 1, 1, 1,
-0.1179693, 0.6994081, -2.265413, 1, 1, 1, 1, 1,
-0.1175993, 1.495087, -0.04681071, 1, 1, 1, 1, 1,
-0.1037604, -0.8761881, -3.230718, 1, 1, 1, 1, 1,
-0.1033145, -0.808823, -0.7628474, 1, 1, 1, 1, 1,
-0.1013858, -0.3648705, -2.482148, 1, 1, 1, 1, 1,
-0.09454226, 0.5414309, -1.968301, 1, 1, 1, 1, 1,
-0.09293159, 0.6217718, -0.4626507, 1, 1, 1, 1, 1,
-0.0928063, 1.237139, 1.866882, 1, 1, 1, 1, 1,
-0.09020741, 1.407035, -0.3535414, 1, 1, 1, 1, 1,
-0.08998255, 1.354584, 1.920906, 1, 1, 1, 1, 1,
-0.08871898, 2.53518, -0.1635424, 1, 1, 1, 1, 1,
-0.08406023, -0.3009046, -4.614965, 0, 0, 1, 1, 1,
-0.08394682, -0.7772771, -2.998872, 1, 0, 0, 1, 1,
-0.07936628, -2.017397, -1.112448, 1, 0, 0, 1, 1,
-0.0671708, 0.6996703, -0.4810187, 1, 0, 0, 1, 1,
-0.06588387, -0.9730805, -4.365972, 1, 0, 0, 1, 1,
-0.05996512, 0.9981349, 0.7380972, 1, 0, 0, 1, 1,
-0.05663412, -0.8139797, -2.710894, 0, 0, 0, 1, 1,
-0.04873011, 0.3448371, 0.173926, 0, 0, 0, 1, 1,
-0.04759134, -0.7329825, -2.932586, 0, 0, 0, 1, 1,
-0.04724739, 0.738159, -0.3747236, 0, 0, 0, 1, 1,
-0.0465671, 0.6228826, -0.5860512, 0, 0, 0, 1, 1,
-0.04350911, -0.2286953, -1.516199, 0, 0, 0, 1, 1,
-0.03144896, 1.194483, 0.4822452, 0, 0, 0, 1, 1,
-0.02874831, 0.07781397, -0.4473678, 1, 1, 1, 1, 1,
-0.02869485, -0.1036701, -3.467328, 1, 1, 1, 1, 1,
-0.0262449, 0.8913226, -0.04486338, 1, 1, 1, 1, 1,
-0.02181919, -1.301816, -2.508971, 1, 1, 1, 1, 1,
-0.02096235, -1.793677, -2.538435, 1, 1, 1, 1, 1,
-0.01797276, -0.3179637, -2.539713, 1, 1, 1, 1, 1,
-0.01727563, 0.6722689, -1.285502, 1, 1, 1, 1, 1,
-0.01646876, -0.4952955, -2.272751, 1, 1, 1, 1, 1,
-0.01563104, -0.6338708, -1.712903, 1, 1, 1, 1, 1,
-0.01522497, -0.6120661, -2.393094, 1, 1, 1, 1, 1,
-0.00754466, 1.016194, -0.7008097, 1, 1, 1, 1, 1,
-0.007518156, -0.2280847, -1.228881, 1, 1, 1, 1, 1,
-0.006224234, 1.209403, 0.09943157, 1, 1, 1, 1, 1,
-0.00508042, 1.251283, -0.4632718, 1, 1, 1, 1, 1,
-0.0008611173, 0.4970225, 0.9974323, 1, 1, 1, 1, 1,
-0.0003596017, -1.89628, -2.409491, 0, 0, 1, 1, 1,
-4.274907e-06, -2.237943, -2.815691, 1, 0, 0, 1, 1,
0.001735989, 1.453951, -0.06386411, 1, 0, 0, 1, 1,
0.001810091, 1.106212, 0.9898654, 1, 0, 0, 1, 1,
0.00201596, -0.006372934, 2.257561, 1, 0, 0, 1, 1,
0.003643243, 0.1004042, 1.333407, 1, 0, 0, 1, 1,
0.004743617, -0.6713473, 2.536791, 0, 0, 0, 1, 1,
0.005581677, -0.08663052, 3.104289, 0, 0, 0, 1, 1,
0.006367532, 0.1111532, -0.6114805, 0, 0, 0, 1, 1,
0.008535597, 0.1402643, -1.656206, 0, 0, 0, 1, 1,
0.01274346, -0.07221869, 2.105862, 0, 0, 0, 1, 1,
0.01408328, -1.031128, 1.634542, 0, 0, 0, 1, 1,
0.01573397, 1.978896, -0.7709041, 0, 0, 0, 1, 1,
0.01584614, -1.458948, 2.186486, 1, 1, 1, 1, 1,
0.01625606, 1.753762, 1.081878, 1, 1, 1, 1, 1,
0.01835976, -0.5744368, 3.160511, 1, 1, 1, 1, 1,
0.02164878, -0.08879281, 2.5214, 1, 1, 1, 1, 1,
0.02813203, -0.1196855, 2.461936, 1, 1, 1, 1, 1,
0.03208509, 0.02100744, 0.7868679, 1, 1, 1, 1, 1,
0.0347924, -0.507747, 4.280155, 1, 1, 1, 1, 1,
0.03664111, -1.661511, 1.920603, 1, 1, 1, 1, 1,
0.03923124, -0.03301749, 1.285186, 1, 1, 1, 1, 1,
0.04931968, -0.735294, 4.338653, 1, 1, 1, 1, 1,
0.050053, -1.203142, 5.116907, 1, 1, 1, 1, 1,
0.0505389, -1.405729, 2.405881, 1, 1, 1, 1, 1,
0.0509191, 0.4963908, -0.6713321, 1, 1, 1, 1, 1,
0.05115446, -0.04749659, 1.338355, 1, 1, 1, 1, 1,
0.05365768, 0.5366036, -0.8989708, 1, 1, 1, 1, 1,
0.05491681, -1.13297, 2.730628, 0, 0, 1, 1, 1,
0.05732343, 1.731377, 0.2908551, 1, 0, 0, 1, 1,
0.05825114, -0.7926276, 3.115131, 1, 0, 0, 1, 1,
0.06362182, -0.8184956, 3.864192, 1, 0, 0, 1, 1,
0.06582803, 2.733253, -2.357281, 1, 0, 0, 1, 1,
0.06593493, -0.2743359, 2.32277, 1, 0, 0, 1, 1,
0.06608667, 0.8805463, -0.005575213, 0, 0, 0, 1, 1,
0.06962753, -1.581419, 2.485145, 0, 0, 0, 1, 1,
0.07027694, 1.839, 1.217638, 0, 0, 0, 1, 1,
0.07122215, 2.183142, -0.8618387, 0, 0, 0, 1, 1,
0.07481996, -0.7992831, 2.389085, 0, 0, 0, 1, 1,
0.0749848, 1.281134, -0.8227091, 0, 0, 0, 1, 1,
0.07656483, -0.4477503, 4.34517, 0, 0, 0, 1, 1,
0.07778082, -0.4120602, 1.263721, 1, 1, 1, 1, 1,
0.08286425, -0.4470725, 3.364656, 1, 1, 1, 1, 1,
0.08555967, 0.06043769, -0.5113467, 1, 1, 1, 1, 1,
0.09221721, -1.32824, 3.836713, 1, 1, 1, 1, 1,
0.09859445, -0.9052175, 5.213292, 1, 1, 1, 1, 1,
0.09930503, 1.228735, 0.7980712, 1, 1, 1, 1, 1,
0.100799, 0.7194888, 0.1767008, 1, 1, 1, 1, 1,
0.1030255, -0.9564901, 2.574368, 1, 1, 1, 1, 1,
0.1033732, -0.7498193, 2.00198, 1, 1, 1, 1, 1,
0.1098746, -0.1617747, 3.141448, 1, 1, 1, 1, 1,
0.1119096, -0.8004999, 2.181226, 1, 1, 1, 1, 1,
0.1136735, 0.269603, 0.3114382, 1, 1, 1, 1, 1,
0.116574, 1.060414, -0.09313936, 1, 1, 1, 1, 1,
0.11763, 0.01073197, 1.607312, 1, 1, 1, 1, 1,
0.1211074, 0.5961447, -0.1722595, 1, 1, 1, 1, 1,
0.1216121, -0.6214243, 2.57639, 0, 0, 1, 1, 1,
0.1244377, -0.5150157, 3.999133, 1, 0, 0, 1, 1,
0.1268934, 1.905523, -0.2865341, 1, 0, 0, 1, 1,
0.1276503, -0.7282802, 3.210566, 1, 0, 0, 1, 1,
0.127681, 2.440641, -1.396904, 1, 0, 0, 1, 1,
0.1315673, -0.07234517, 2.941341, 1, 0, 0, 1, 1,
0.1323716, -1.748404, 3.162254, 0, 0, 0, 1, 1,
0.1340787, -1.794272, 3.388326, 0, 0, 0, 1, 1,
0.1367265, -0.08421737, 1.899309, 0, 0, 0, 1, 1,
0.1389431, 1.782297, -0.421344, 0, 0, 0, 1, 1,
0.1410395, -1.504289, 2.400446, 0, 0, 0, 1, 1,
0.1424529, -0.837751, 3.268247, 0, 0, 0, 1, 1,
0.1439142, 0.1684954, 1.257697, 0, 0, 0, 1, 1,
0.1444938, -0.928772, 1.456886, 1, 1, 1, 1, 1,
0.1452845, -1.448403, 2.897728, 1, 1, 1, 1, 1,
0.1462736, -1.000409, 4.726095, 1, 1, 1, 1, 1,
0.1471492, -1.592946, 3.882104, 1, 1, 1, 1, 1,
0.1491244, 0.4863917, 1.956004, 1, 1, 1, 1, 1,
0.152369, 0.6878448, -0.06896117, 1, 1, 1, 1, 1,
0.1558743, 0.3603793, 0.2128549, 1, 1, 1, 1, 1,
0.1559471, 0.9121174, -0.8914452, 1, 1, 1, 1, 1,
0.1569367, 1.281296, 0.3673187, 1, 1, 1, 1, 1,
0.1586422, 0.3496771, 0.8077337, 1, 1, 1, 1, 1,
0.1611996, -0.9853083, 4.593181, 1, 1, 1, 1, 1,
0.1673519, -1.144068, 3.003091, 1, 1, 1, 1, 1,
0.1733677, 0.4075517, 1.214299, 1, 1, 1, 1, 1,
0.1746384, 1.152957, -0.7556303, 1, 1, 1, 1, 1,
0.1747284, -0.6949829, 1.828425, 1, 1, 1, 1, 1,
0.1837538, 2.970212, 0.1436072, 0, 0, 1, 1, 1,
0.1901774, -0.4461795, 3.560413, 1, 0, 0, 1, 1,
0.1903439, -0.4005094, 2.479107, 1, 0, 0, 1, 1,
0.1920883, -0.4379925, 2.501011, 1, 0, 0, 1, 1,
0.1962893, 1.801372, -0.1512157, 1, 0, 0, 1, 1,
0.1978802, 0.3849735, 0.5235283, 1, 0, 0, 1, 1,
0.2031885, -0.5243052, 2.115355, 0, 0, 0, 1, 1,
0.2036995, 0.3789753, 0.7611165, 0, 0, 0, 1, 1,
0.2069946, 1.11588, -1.48895, 0, 0, 0, 1, 1,
0.207937, -0.4322662, 3.717404, 0, 0, 0, 1, 1,
0.2109358, -0.4508022, 0.1992149, 0, 0, 0, 1, 1,
0.2132158, 1.036293, -0.56011, 0, 0, 0, 1, 1,
0.2255547, -0.950017, 3.867311, 0, 0, 0, 1, 1,
0.2320237, 0.3812384, -0.2045731, 1, 1, 1, 1, 1,
0.2340894, 0.1724003, 1.911846, 1, 1, 1, 1, 1,
0.2366606, 0.7517318, -0.09204023, 1, 1, 1, 1, 1,
0.2388337, 1.820513, -0.13284, 1, 1, 1, 1, 1,
0.2400459, -1.492304, 3.838237, 1, 1, 1, 1, 1,
0.247369, -0.05791093, 2.670116, 1, 1, 1, 1, 1,
0.2477782, -0.978412, 3.070354, 1, 1, 1, 1, 1,
0.2484226, 0.2682023, 1.9238, 1, 1, 1, 1, 1,
0.2484612, 1.262457, -1.149913, 1, 1, 1, 1, 1,
0.2490836, -0.7967, 2.919211, 1, 1, 1, 1, 1,
0.2524703, 1.752582, 1.300536, 1, 1, 1, 1, 1,
0.2574502, 0.04846519, 0.9571253, 1, 1, 1, 1, 1,
0.2693928, -0.799839, 2.940137, 1, 1, 1, 1, 1,
0.2719073, -1.032259, 3.664355, 1, 1, 1, 1, 1,
0.2731661, -0.3014418, 1.320552, 1, 1, 1, 1, 1,
0.2732525, -0.3190656, 2.491553, 0, 0, 1, 1, 1,
0.276418, 0.620864, 0.8529275, 1, 0, 0, 1, 1,
0.2815486, 0.9295355, 0.4585406, 1, 0, 0, 1, 1,
0.2822009, -0.9310496, 2.838873, 1, 0, 0, 1, 1,
0.2830139, 1.192368, 0.9115754, 1, 0, 0, 1, 1,
0.2831767, -0.06889632, 1.858072, 1, 0, 0, 1, 1,
0.2837706, -0.3242949, 1.921033, 0, 0, 0, 1, 1,
0.2837714, 1.661218, 1.146902, 0, 0, 0, 1, 1,
0.2879412, -0.1074966, 1.945424, 0, 0, 0, 1, 1,
0.2892619, -0.1579686, 2.353814, 0, 0, 0, 1, 1,
0.2896736, -0.979269, 2.252832, 0, 0, 0, 1, 1,
0.2951297, 1.305326, 0.9793644, 0, 0, 0, 1, 1,
0.2956947, -0.4439165, 2.230653, 0, 0, 0, 1, 1,
0.2986073, -1.256509, 2.853423, 1, 1, 1, 1, 1,
0.3006868, -0.3561242, 2.229454, 1, 1, 1, 1, 1,
0.3008668, -0.8830385, 2.521849, 1, 1, 1, 1, 1,
0.3017514, 0.1852271, 1.186685, 1, 1, 1, 1, 1,
0.3039892, 0.4615248, -0.7448284, 1, 1, 1, 1, 1,
0.3088584, 0.04707242, 2.068328, 1, 1, 1, 1, 1,
0.309245, -0.4988997, 1.878106, 1, 1, 1, 1, 1,
0.3193892, 0.1775361, 0.3992417, 1, 1, 1, 1, 1,
0.3223841, -0.3706459, 2.361384, 1, 1, 1, 1, 1,
0.3239622, 0.4520093, 0.5845578, 1, 1, 1, 1, 1,
0.3276829, -0.7361493, 2.745429, 1, 1, 1, 1, 1,
0.3277433, 1.225231, -0.7557307, 1, 1, 1, 1, 1,
0.3280734, 0.2677315, 1.369867, 1, 1, 1, 1, 1,
0.3299284, -0.986198, 1.97886, 1, 1, 1, 1, 1,
0.3323222, 0.6405113, 1.818785, 1, 1, 1, 1, 1,
0.3329739, 0.763761, -0.7684739, 0, 0, 1, 1, 1,
0.3350439, -0.08390062, 0.9711689, 1, 0, 0, 1, 1,
0.335273, 0.1535614, -0.2198355, 1, 0, 0, 1, 1,
0.3412876, -0.9609265, 2.279328, 1, 0, 0, 1, 1,
0.3424056, 2.419291, -0.415061, 1, 0, 0, 1, 1,
0.3446634, 0.1565147, -0.3858379, 1, 0, 0, 1, 1,
0.3447963, -0.7213985, 2.052902, 0, 0, 0, 1, 1,
0.3529122, -1.348266, 1.290745, 0, 0, 0, 1, 1,
0.35398, 0.5176624, 1.002453, 0, 0, 0, 1, 1,
0.357455, -2.105094, 2.618061, 0, 0, 0, 1, 1,
0.3622836, 0.922342, 0.291705, 0, 0, 0, 1, 1,
0.3743885, -1.028308, 1.767493, 0, 0, 0, 1, 1,
0.3744873, -0.3389243, 2.132168, 0, 0, 0, 1, 1,
0.3775071, -1.488614, 3.473947, 1, 1, 1, 1, 1,
0.3807637, 0.116661, 1.259291, 1, 1, 1, 1, 1,
0.3831103, 1.618775, 0.3448128, 1, 1, 1, 1, 1,
0.384401, -0.3391113, 1.836029, 1, 1, 1, 1, 1,
0.3871098, -1.281681, 3.026965, 1, 1, 1, 1, 1,
0.3891166, -0.05230854, 0.2584053, 1, 1, 1, 1, 1,
0.3905435, 0.2025932, 1.266861, 1, 1, 1, 1, 1,
0.40228, 2.350979, 1.081166, 1, 1, 1, 1, 1,
0.4054145, -0.5717065, 1.019071, 1, 1, 1, 1, 1,
0.4056804, -1.362558, 2.98104, 1, 1, 1, 1, 1,
0.4060643, 0.6589576, -0.6646509, 1, 1, 1, 1, 1,
0.416763, -0.3929239, 2.584662, 1, 1, 1, 1, 1,
0.4304181, 1.217068, -0.7923195, 1, 1, 1, 1, 1,
0.4322935, -0.7334481, 1.853372, 1, 1, 1, 1, 1,
0.432814, 0.2928712, 1.80058, 1, 1, 1, 1, 1,
0.4345342, 0.3246931, -0.3020101, 0, 0, 1, 1, 1,
0.4368303, 1.011146, -0.005304098, 1, 0, 0, 1, 1,
0.4371333, -1.738336, 3.138187, 1, 0, 0, 1, 1,
0.4426934, -1.836352, 2.055651, 1, 0, 0, 1, 1,
0.446358, -0.4890115, 2.012097, 1, 0, 0, 1, 1,
0.4476388, 1.131067, 0.8605401, 1, 0, 0, 1, 1,
0.452587, 0.7546412, 1.32589, 0, 0, 0, 1, 1,
0.4531751, -0.3734721, 3.827817, 0, 0, 0, 1, 1,
0.4540059, 0.7225921, 1.000063, 0, 0, 0, 1, 1,
0.4576246, -0.2016991, 1.245147, 0, 0, 0, 1, 1,
0.4579011, 1.34235, -0.7098368, 0, 0, 0, 1, 1,
0.4636519, -0.9282416, 3.159858, 0, 0, 0, 1, 1,
0.4720656, -0.5997854, 3.034834, 0, 0, 0, 1, 1,
0.4752962, 1.804392, -0.512094, 1, 1, 1, 1, 1,
0.4764498, 1.098641, -0.07465263, 1, 1, 1, 1, 1,
0.4769268, 0.6592309, -0.4544345, 1, 1, 1, 1, 1,
0.4797723, -0.7133231, 1.828481, 1, 1, 1, 1, 1,
0.4816065, 1.858123, -0.1290231, 1, 1, 1, 1, 1,
0.4854528, -0.4663397, 1.599428, 1, 1, 1, 1, 1,
0.4901637, 0.9561859, -1.224061, 1, 1, 1, 1, 1,
0.4906993, -0.2860444, 1.386529, 1, 1, 1, 1, 1,
0.4947848, 1.060075, 0.2454388, 1, 1, 1, 1, 1,
0.4962662, 1.768977, 0.2981788, 1, 1, 1, 1, 1,
0.4962846, 1.429567, 0.2371004, 1, 1, 1, 1, 1,
0.4976994, -1.315485, 2.405046, 1, 1, 1, 1, 1,
0.498093, 0.9253229, -0.2727383, 1, 1, 1, 1, 1,
0.5003193, 2.27525, -0.8098872, 1, 1, 1, 1, 1,
0.5048367, 0.4968216, 0.6691038, 1, 1, 1, 1, 1,
0.5064158, 0.9327915, 0.4466319, 0, 0, 1, 1, 1,
0.5074456, -0.1961173, 1.767491, 1, 0, 0, 1, 1,
0.5075811, 0.8471108, 1.1252, 1, 0, 0, 1, 1,
0.5085824, -2.013254, 3.35643, 1, 0, 0, 1, 1,
0.5123696, -1.565946, 3.6389, 1, 0, 0, 1, 1,
0.512757, -0.08345157, 1.702599, 1, 0, 0, 1, 1,
0.5185794, -0.6050383, 3.75013, 0, 0, 0, 1, 1,
0.5188921, 0.2519461, 1.069415, 0, 0, 0, 1, 1,
0.5223963, 0.9131321, 0.7921049, 0, 0, 0, 1, 1,
0.5226342, 0.3367297, 0.9521607, 0, 0, 0, 1, 1,
0.5240553, -0.9993712, 3.377312, 0, 0, 0, 1, 1,
0.5256903, -1.276413, 2.949968, 0, 0, 0, 1, 1,
0.5265614, -0.7089859, 2.871056, 0, 0, 0, 1, 1,
0.5271696, -0.4344445, 2.345796, 1, 1, 1, 1, 1,
0.5272065, -2.619514, 2.039411, 1, 1, 1, 1, 1,
0.5398483, -0.3050723, 2.018657, 1, 1, 1, 1, 1,
0.541746, 0.7683355, 1.685535, 1, 1, 1, 1, 1,
0.5452363, 0.8115528, 0.5664594, 1, 1, 1, 1, 1,
0.5453468, 0.4177835, 0.2450733, 1, 1, 1, 1, 1,
0.5457936, -0.5071536, 3.327706, 1, 1, 1, 1, 1,
0.5498162, 0.2230378, 1.676134, 1, 1, 1, 1, 1,
0.5537463, -0.8248282, 3.707013, 1, 1, 1, 1, 1,
0.5540795, -0.7174316, 0.8291769, 1, 1, 1, 1, 1,
0.5600241, -2.285121, 0.9022778, 1, 1, 1, 1, 1,
0.5602938, 0.7486839, -0.0843022, 1, 1, 1, 1, 1,
0.5603038, 0.8870881, -1.069907, 1, 1, 1, 1, 1,
0.5642735, 0.1007403, 0.6584614, 1, 1, 1, 1, 1,
0.5648748, -0.05884115, 2.211497, 1, 1, 1, 1, 1,
0.5664536, 0.9443725, -2.36457, 0, 0, 1, 1, 1,
0.5670409, 1.056717, -0.1629969, 1, 0, 0, 1, 1,
0.5680889, -1.307113, 4.036712, 1, 0, 0, 1, 1,
0.5684696, 1.490016, 0.4472921, 1, 0, 0, 1, 1,
0.5722111, -0.3266688, 2.666858, 1, 0, 0, 1, 1,
0.5755434, 1.058619, 0.8518091, 1, 0, 0, 1, 1,
0.5776824, 1.415585, 0.7182267, 0, 0, 0, 1, 1,
0.5817606, 1.940238, -0.8619801, 0, 0, 0, 1, 1,
0.5903497, -0.9348677, 2.1129, 0, 0, 0, 1, 1,
0.5909109, 0.5328255, 2.101755, 0, 0, 0, 1, 1,
0.5911446, 0.9700838, -0.2959855, 0, 0, 0, 1, 1,
0.5977749, -1.102856, 2.695766, 0, 0, 0, 1, 1,
0.6001732, 0.7972543, 1.012457, 0, 0, 0, 1, 1,
0.6072581, 0.2707169, 1.286539, 1, 1, 1, 1, 1,
0.6072761, 0.1661816, 0.9025497, 1, 1, 1, 1, 1,
0.6101651, 0.1513833, 0.362969, 1, 1, 1, 1, 1,
0.6130661, -0.2976702, 2.821093, 1, 1, 1, 1, 1,
0.6132121, 1.117039, 0.4528035, 1, 1, 1, 1, 1,
0.6162422, -1.063849, 1.605015, 1, 1, 1, 1, 1,
0.6181649, -0.8627402, 4.579713, 1, 1, 1, 1, 1,
0.6184824, 1.005668, 1.701472, 1, 1, 1, 1, 1,
0.6201778, -0.236011, 1.408567, 1, 1, 1, 1, 1,
0.620938, -0.0187154, 2.603533, 1, 1, 1, 1, 1,
0.621718, -0.1547033, 1.188997, 1, 1, 1, 1, 1,
0.6217718, -0.4663693, 1.139091, 1, 1, 1, 1, 1,
0.6253427, -0.6066146, 2.995291, 1, 1, 1, 1, 1,
0.6282267, -0.6331538, 2.670804, 1, 1, 1, 1, 1,
0.6284373, 0.1017878, 2.866175, 1, 1, 1, 1, 1,
0.6294675, -1.10681, 2.548677, 0, 0, 1, 1, 1,
0.629611, 0.6934667, 1.017655, 1, 0, 0, 1, 1,
0.6296114, -1.39129, 4.007864, 1, 0, 0, 1, 1,
0.6304062, -1.032677, 2.9288, 1, 0, 0, 1, 1,
0.6304504, -0.463715, 4.909745, 1, 0, 0, 1, 1,
0.6312104, -0.8069208, 2.095995, 1, 0, 0, 1, 1,
0.6318019, -0.7282504, 2.952153, 0, 0, 0, 1, 1,
0.6388446, -1.67559, 0.7048779, 0, 0, 0, 1, 1,
0.6454744, -0.2027457, 0.05927606, 0, 0, 0, 1, 1,
0.6540977, -0.4943841, 1.877315, 0, 0, 0, 1, 1,
0.655549, 0.06291345, 0.7377614, 0, 0, 0, 1, 1,
0.6645476, -0.2849984, 1.985763, 0, 0, 0, 1, 1,
0.674193, 0.77146, 1.640467, 0, 0, 0, 1, 1,
0.6769131, -1.920587, 1.136946, 1, 1, 1, 1, 1,
0.6775537, 1.935332, -0.1342298, 1, 1, 1, 1, 1,
0.6776819, -2.143897, 2.286845, 1, 1, 1, 1, 1,
0.6800289, -2.360737, 2.72262, 1, 1, 1, 1, 1,
0.6826746, 0.8985703, 0.3234536, 1, 1, 1, 1, 1,
0.6860849, -0.2748155, 1.581521, 1, 1, 1, 1, 1,
0.6982241, 0.7042282, -0.4738621, 1, 1, 1, 1, 1,
0.7013218, 0.2698998, 0.4829791, 1, 1, 1, 1, 1,
0.70242, -1.984716, 2.038346, 1, 1, 1, 1, 1,
0.7110119, -1.303307, 2.800228, 1, 1, 1, 1, 1,
0.7128485, -0.763874, 3.49462, 1, 1, 1, 1, 1,
0.7141432, 0.03993306, 1.296595, 1, 1, 1, 1, 1,
0.7156988, 1.461334, 2.108473, 1, 1, 1, 1, 1,
0.7254802, -1.847629, 0.669354, 1, 1, 1, 1, 1,
0.7316303, 0.2302574, 0.9907653, 1, 1, 1, 1, 1,
0.7349675, -1.113984, 2.122855, 0, 0, 1, 1, 1,
0.7399544, 0.6538802, 0.02844543, 1, 0, 0, 1, 1,
0.7448776, 1.305554, 0.7679081, 1, 0, 0, 1, 1,
0.7465101, -1.770391, 1.816436, 1, 0, 0, 1, 1,
0.7510716, -0.2269425, 4.413127, 1, 0, 0, 1, 1,
0.7511808, 0.9444251, 0.1451082, 1, 0, 0, 1, 1,
0.7513162, -2.055336, 2.286723, 0, 0, 0, 1, 1,
0.751597, 1.621751, 0.3907968, 0, 0, 0, 1, 1,
0.752105, 0.3263259, 2.794127, 0, 0, 0, 1, 1,
0.7613766, -1.809243, 3.761221, 0, 0, 0, 1, 1,
0.7637994, -0.8793783, 1.43374, 0, 0, 0, 1, 1,
0.7673517, 1.779234, 1.241806, 0, 0, 0, 1, 1,
0.7695293, 0.1310984, 0.6416771, 0, 0, 0, 1, 1,
0.7715184, 1.312721, 1.281573, 1, 1, 1, 1, 1,
0.7829049, -1.588333, 3.174872, 1, 1, 1, 1, 1,
0.7852644, -1.553116, 1.451406, 1, 1, 1, 1, 1,
0.7880922, -0.6443117, 2.106528, 1, 1, 1, 1, 1,
0.7949379, -0.07539424, 3.207509, 1, 1, 1, 1, 1,
0.7959932, -0.3943673, 1.693075, 1, 1, 1, 1, 1,
0.7976816, -0.1469923, 2.646126, 1, 1, 1, 1, 1,
0.8079818, 0.6352577, 1.863245, 1, 1, 1, 1, 1,
0.8096526, -0.9366996, 1.702932, 1, 1, 1, 1, 1,
0.810769, -0.560798, 2.30939, 1, 1, 1, 1, 1,
0.8125978, 0.951511, 0.7873173, 1, 1, 1, 1, 1,
0.8152938, -0.1938433, 2.231074, 1, 1, 1, 1, 1,
0.8157362, -1.95012, 3.014029, 1, 1, 1, 1, 1,
0.8184379, 0.4704567, 1.01885, 1, 1, 1, 1, 1,
0.8217938, -0.8396109, 2.293813, 1, 1, 1, 1, 1,
0.8230074, 0.5780158, -0.971103, 0, 0, 1, 1, 1,
0.8232284, 0.379443, 0.3006943, 1, 0, 0, 1, 1,
0.8251861, 0.254977, -0.2266194, 1, 0, 0, 1, 1,
0.8327207, -1.361375, 1.140221, 1, 0, 0, 1, 1,
0.8335782, -1.607276, 2.393984, 1, 0, 0, 1, 1,
0.8418814, 0.9951739, 1.894524, 1, 0, 0, 1, 1,
0.8449674, -0.5778101, 2.398938, 0, 0, 0, 1, 1,
0.847261, 2.117697, 0.7585779, 0, 0, 0, 1, 1,
0.8489947, -1.393686, 3.485776, 0, 0, 0, 1, 1,
0.8500734, -0.2466014, 1.576564, 0, 0, 0, 1, 1,
0.8544338, -0.2458736, 1.073185, 0, 0, 0, 1, 1,
0.8577842, 0.9050487, 1.659587, 0, 0, 0, 1, 1,
0.8675375, 0.2863846, 1.033103, 0, 0, 0, 1, 1,
0.8715383, 1.59835, -0.1086052, 1, 1, 1, 1, 1,
0.8725616, -1.276829, 2.214315, 1, 1, 1, 1, 1,
0.8775963, -0.1594695, 2.237413, 1, 1, 1, 1, 1,
0.8794871, -0.2938273, 2.668677, 1, 1, 1, 1, 1,
0.8811976, -1.480676, 1.154845, 1, 1, 1, 1, 1,
0.8832706, 0.8418069, 0.839516, 1, 1, 1, 1, 1,
0.8912048, 0.07339758, 2.648009, 1, 1, 1, 1, 1,
0.8997959, -0.8427145, 2.586671, 1, 1, 1, 1, 1,
0.9027669, -0.07337788, 0.7477819, 1, 1, 1, 1, 1,
0.903307, -0.2767796, 3.054044, 1, 1, 1, 1, 1,
0.9067744, -0.9381702, 3.563595, 1, 1, 1, 1, 1,
0.9205336, 1.184738, 0.7977234, 1, 1, 1, 1, 1,
0.9274969, 0.6099238, 0.9665943, 1, 1, 1, 1, 1,
0.9373704, 0.5888948, 1.419613, 1, 1, 1, 1, 1,
0.9387592, 0.7326308, 1.363136, 1, 1, 1, 1, 1,
0.9437298, -0.5055986, 2.084594, 0, 0, 1, 1, 1,
0.9508797, -0.8140022, 1.26454, 1, 0, 0, 1, 1,
0.9512294, 0.6861902, 1.580522, 1, 0, 0, 1, 1,
0.9552316, 1.614393, 2.438974, 1, 0, 0, 1, 1,
0.9566463, 0.1179299, 2.486374, 1, 0, 0, 1, 1,
0.9566469, 0.361872, 2.568304, 1, 0, 0, 1, 1,
0.9572646, -0.7814598, 1.944114, 0, 0, 0, 1, 1,
0.9619066, -0.9228382, 1.557801, 0, 0, 0, 1, 1,
0.9627573, 0.1197467, 1.861506, 0, 0, 0, 1, 1,
0.9673623, 0.3746256, 2.292317, 0, 0, 0, 1, 1,
0.9711506, -1.242412, 2.49135, 0, 0, 0, 1, 1,
0.9764308, 0.2609842, 2.482597, 0, 0, 0, 1, 1,
0.9844162, -0.3832332, 2.398419, 0, 0, 0, 1, 1,
0.988363, -0.5778954, 2.917238, 1, 1, 1, 1, 1,
0.9942978, 0.5609242, 1.329219, 1, 1, 1, 1, 1,
1.003023, 0.6864333, 1.658304, 1, 1, 1, 1, 1,
1.003066, -1.936455, 2.436789, 1, 1, 1, 1, 1,
1.005425, -0.02883944, 1.254981, 1, 1, 1, 1, 1,
1.019609, -1.776838, 1.596801, 1, 1, 1, 1, 1,
1.023333, 0.2669114, 1.042653, 1, 1, 1, 1, 1,
1.033908, -0.5722228, 1.670758, 1, 1, 1, 1, 1,
1.034874, -0.4352458, 1.617995, 1, 1, 1, 1, 1,
1.040947, -0.008010426, 3.669358, 1, 1, 1, 1, 1,
1.041878, 0.42728, 0.5660548, 1, 1, 1, 1, 1,
1.045667, 1.202849, -0.3303194, 1, 1, 1, 1, 1,
1.051483, 0.6140533, 0.01068175, 1, 1, 1, 1, 1,
1.055557, 0.6634507, 1.414314, 1, 1, 1, 1, 1,
1.058294, 0.7809311, 0.1090665, 1, 1, 1, 1, 1,
1.058801, -1.571399, 1.326841, 0, 0, 1, 1, 1,
1.062868, -0.03004256, 1.799874, 1, 0, 0, 1, 1,
1.062933, 1.613835, 0.711324, 1, 0, 0, 1, 1,
1.063884, -1.17966, 3.023156, 1, 0, 0, 1, 1,
1.065036, -0.6438743, 2.250448, 1, 0, 0, 1, 1,
1.06514, 0.6722542, -0.6449929, 1, 0, 0, 1, 1,
1.068199, 1.389403, 1.5633, 0, 0, 0, 1, 1,
1.072542, 0.1777562, -0.7275456, 0, 0, 0, 1, 1,
1.073661, -0.2800065, 1.615486, 0, 0, 0, 1, 1,
1.079961, -1.664095, 1.920365, 0, 0, 0, 1, 1,
1.101857, -1.10931, 2.391138, 0, 0, 0, 1, 1,
1.108701, -0.9954878, 1.882633, 0, 0, 0, 1, 1,
1.111555, 0.4710763, 0.9366426, 0, 0, 0, 1, 1,
1.113173, -0.6707888, 2.894809, 1, 1, 1, 1, 1,
1.11534, -0.1616783, 0.5261244, 1, 1, 1, 1, 1,
1.116918, -0.2517995, 2.163474, 1, 1, 1, 1, 1,
1.117759, 1.743171, 0.9341173, 1, 1, 1, 1, 1,
1.126296, -1.129113, 2.743201, 1, 1, 1, 1, 1,
1.126996, -0.7440499, 0.4020583, 1, 1, 1, 1, 1,
1.137535, 1.119496, -1.031074, 1, 1, 1, 1, 1,
1.141254, 0.1043934, 3.785268, 1, 1, 1, 1, 1,
1.152147, 0.7814298, -0.877889, 1, 1, 1, 1, 1,
1.161995, 0.7684478, -0.2147158, 1, 1, 1, 1, 1,
1.183277, -0.5943357, 2.232693, 1, 1, 1, 1, 1,
1.19366, 0.8580207, 1.805341, 1, 1, 1, 1, 1,
1.194149, -0.9912195, 2.886721, 1, 1, 1, 1, 1,
1.195954, -0.1042023, 3.21781, 1, 1, 1, 1, 1,
1.200466, -1.196045, 3.26726, 1, 1, 1, 1, 1,
1.21068, 1.441542, -0.9801618, 0, 0, 1, 1, 1,
1.217894, 0.7302663, 2.177802, 1, 0, 0, 1, 1,
1.218022, 0.9413615, 0.8798484, 1, 0, 0, 1, 1,
1.219526, -0.3759739, 4.508988, 1, 0, 0, 1, 1,
1.220446, -0.5807185, 1.639663, 1, 0, 0, 1, 1,
1.227611, 0.9034563, -0.3437085, 1, 0, 0, 1, 1,
1.2304, -0.6722789, 2.681335, 0, 0, 0, 1, 1,
1.234866, 1.443007, -1.085326, 0, 0, 0, 1, 1,
1.235, -1.18312, 2.126403, 0, 0, 0, 1, 1,
1.236286, -0.9355706, 1.497996, 0, 0, 0, 1, 1,
1.23722, -1.67881, 3.267589, 0, 0, 0, 1, 1,
1.244029, -0.8100457, 0.7323745, 0, 0, 0, 1, 1,
1.256878, -0.4953079, 2.228102, 0, 0, 0, 1, 1,
1.258649, -1.469537, 1.119181, 1, 1, 1, 1, 1,
1.277492, -0.2886494, 1.079438, 1, 1, 1, 1, 1,
1.281848, -0.9451562, 0.7643344, 1, 1, 1, 1, 1,
1.282849, -0.3933007, 1.635086, 1, 1, 1, 1, 1,
1.286182, -0.3492818, 1.180971, 1, 1, 1, 1, 1,
1.286878, 0.03805512, -0.308792, 1, 1, 1, 1, 1,
1.291842, -2.136803, 1.830431, 1, 1, 1, 1, 1,
1.298802, 0.6619615, 1.735442, 1, 1, 1, 1, 1,
1.308509, -0.4440815, 1.791543, 1, 1, 1, 1, 1,
1.309401, -1.855723, 3.340502, 1, 1, 1, 1, 1,
1.309543, -0.8125819, 2.089767, 1, 1, 1, 1, 1,
1.31296, -0.5974472, 3.125927, 1, 1, 1, 1, 1,
1.313224, -0.8019491, 2.657606, 1, 1, 1, 1, 1,
1.317139, -1.271801, 2.320657, 1, 1, 1, 1, 1,
1.340349, -0.2757485, 1.931569, 1, 1, 1, 1, 1,
1.340809, 0.03171349, 3.247493, 0, 0, 1, 1, 1,
1.34105, -0.7277071, 3.056112, 1, 0, 0, 1, 1,
1.353533, 2.341271, 0.6784106, 1, 0, 0, 1, 1,
1.356866, -0.1397264, 2.429181, 1, 0, 0, 1, 1,
1.364465, 1.088087, 0.4572074, 1, 0, 0, 1, 1,
1.382779, -0.1282043, 2.324551, 1, 0, 0, 1, 1,
1.385666, 1.548717, 1.304471, 0, 0, 0, 1, 1,
1.400958, -1.076571, 3.786342, 0, 0, 0, 1, 1,
1.402062, -0.5938947, 2.620186, 0, 0, 0, 1, 1,
1.404579, -0.9005288, 2.484319, 0, 0, 0, 1, 1,
1.429001, 2.043653, 0.4344297, 0, 0, 0, 1, 1,
1.438027, -0.05882812, 1.169558, 0, 0, 0, 1, 1,
1.442605, -0.3830368, 2.685112, 0, 0, 0, 1, 1,
1.453537, -0.925855, 0.8091732, 1, 1, 1, 1, 1,
1.460865, 1.007957, 1.068628, 1, 1, 1, 1, 1,
1.460877, 0.2644803, 1.442127, 1, 1, 1, 1, 1,
1.461689, -0.9526569, 3.230514, 1, 1, 1, 1, 1,
1.473002, -0.3769501, 2.608821, 1, 1, 1, 1, 1,
1.499417, 0.05663236, 2.090553, 1, 1, 1, 1, 1,
1.502038, 2.981148, 2.101612, 1, 1, 1, 1, 1,
1.512111, -1.04234, 3.03122, 1, 1, 1, 1, 1,
1.519796, 0.3938794, 1.543674, 1, 1, 1, 1, 1,
1.533902, -0.2903049, 1.854533, 1, 1, 1, 1, 1,
1.544385, -0.6712568, 1.919376, 1, 1, 1, 1, 1,
1.564236, -0.6026842, 2.277418, 1, 1, 1, 1, 1,
1.572072, 1.358399, 1.780982, 1, 1, 1, 1, 1,
1.580659, 1.151828, 1.974313, 1, 1, 1, 1, 1,
1.583322, 0.9936322, -0.3547521, 1, 1, 1, 1, 1,
1.586963, 0.03626589, 0.6592151, 0, 0, 1, 1, 1,
1.591173, 1.025138, 1.686674, 1, 0, 0, 1, 1,
1.597019, 0.9507107, 0.3926011, 1, 0, 0, 1, 1,
1.605533, 0.6425148, 1.91407, 1, 0, 0, 1, 1,
1.616955, -1.641491, 1.457122, 1, 0, 0, 1, 1,
1.622718, -0.4559638, 1.171669, 1, 0, 0, 1, 1,
1.631489, 0.02322528, 3.014354, 0, 0, 0, 1, 1,
1.635078, 0.9857378, 2.418849, 0, 0, 0, 1, 1,
1.638667, 1.091646, 0.9409088, 0, 0, 0, 1, 1,
1.671511, 0.5430061, 1.852737, 0, 0, 0, 1, 1,
1.675867, -0.4844985, 3.243017, 0, 0, 0, 1, 1,
1.706672, 0.4941203, 0.7301725, 0, 0, 0, 1, 1,
1.720045, -1.122399, 2.514372, 0, 0, 0, 1, 1,
1.720262, 0.1379156, 2.000822, 1, 1, 1, 1, 1,
1.722062, -0.4829713, 0.2700632, 1, 1, 1, 1, 1,
1.744784, 0.8912213, -0.03655853, 1, 1, 1, 1, 1,
1.771769, 2.496135, 0.9152311, 1, 1, 1, 1, 1,
1.845091, 1.594561, 0.03518625, 1, 1, 1, 1, 1,
1.847381, -1.377511, 2.860582, 1, 1, 1, 1, 1,
1.848626, -0.008369418, 2.675445, 1, 1, 1, 1, 1,
1.859179, 0.2560958, 1.320312, 1, 1, 1, 1, 1,
1.870648, -0.1727005, 1.255466, 1, 1, 1, 1, 1,
1.874429, -0.3460025, 1.616274, 1, 1, 1, 1, 1,
1.97773, 0.4708234, 1.137622, 1, 1, 1, 1, 1,
1.983886, -0.06056431, 0.4743536, 1, 1, 1, 1, 1,
2.05675, 1.779789, 2.079611, 1, 1, 1, 1, 1,
2.057326, -0.5932783, 0.05644211, 1, 1, 1, 1, 1,
2.060799, 1.578832, 0.840876, 1, 1, 1, 1, 1,
2.141105, 0.873449, 1.282054, 0, 0, 1, 1, 1,
2.158055, 0.408959, 1.780466, 1, 0, 0, 1, 1,
2.16145, -0.1672302, 3.006991, 1, 0, 0, 1, 1,
2.242809, -0.09568413, 3.235138, 1, 0, 0, 1, 1,
2.261497, -0.1334557, 2.403126, 1, 0, 0, 1, 1,
2.267947, 1.008136, 1.057605, 1, 0, 0, 1, 1,
2.270155, 0.2835777, 2.802026, 0, 0, 0, 1, 1,
2.303946, 0.9503123, 1.374449, 0, 0, 0, 1, 1,
2.323737, -2.067768, 2.970175, 0, 0, 0, 1, 1,
2.335521, 0.4918364, 2.553922, 0, 0, 0, 1, 1,
2.345337, -1.517117, 2.793551, 0, 0, 0, 1, 1,
2.364822, 1.303651, 2.207027, 0, 0, 0, 1, 1,
2.381887, 0.1523759, 1.806621, 0, 0, 0, 1, 1,
2.423793, 1.13732, 1.281543, 1, 1, 1, 1, 1,
2.427173, 0.2731918, 1.103739, 1, 1, 1, 1, 1,
2.435848, 0.3395286, 1.899282, 1, 1, 1, 1, 1,
2.585055, -1.460404, 2.707031, 1, 1, 1, 1, 1,
2.626554, 0.4067446, 3.522905, 1, 1, 1, 1, 1,
2.758361, 0.4167903, 0.9033448, 1, 1, 1, 1, 1,
3.151653, 0.3408867, -0.1562139, 1, 1, 1, 1, 1
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
var radius = 9.360352;
var distance = 32.87784;
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
mvMatrix.translate( 0.01584053, -0.1051697, -0.002661467 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87784);
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
