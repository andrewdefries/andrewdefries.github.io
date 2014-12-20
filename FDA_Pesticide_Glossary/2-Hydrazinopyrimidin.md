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
-2.714489, -1.238788, -0.8836607, 1, 0, 0, 1,
-2.600297, 0.7058386, -0.772871, 1, 0.007843138, 0, 1,
-2.500523, -0.04069176, -1.761658, 1, 0.01176471, 0, 1,
-2.410408, -1.223692, -2.069828, 1, 0.01960784, 0, 1,
-2.334561, -1.053653, -2.868556, 1, 0.02352941, 0, 1,
-2.289104, 0.6606319, -2.756751, 1, 0.03137255, 0, 1,
-2.274107, -0.79143, -1.691066, 1, 0.03529412, 0, 1,
-2.246166, -0.4749885, -0.6228936, 1, 0.04313726, 0, 1,
-2.226495, -2.319655, -1.767656, 1, 0.04705882, 0, 1,
-2.213418, 0.6646242, -1.764853, 1, 0.05490196, 0, 1,
-2.169554, -0.6464674, -1.504243, 1, 0.05882353, 0, 1,
-2.135382, 1.149179, -2.188237, 1, 0.06666667, 0, 1,
-2.131818, 1.139881, -0.1946836, 1, 0.07058824, 0, 1,
-2.113916, -0.8004125, -0.9808592, 1, 0.07843138, 0, 1,
-2.079003, -0.145973, -1.76493, 1, 0.08235294, 0, 1,
-2.059533, -1.882538, -1.990451, 1, 0.09019608, 0, 1,
-2.024477, -1.622707, -3.362218, 1, 0.09411765, 0, 1,
-2.023334, 0.1433557, -1.605914, 1, 0.1019608, 0, 1,
-1.956308, -0.4906548, -1.321499, 1, 0.1098039, 0, 1,
-1.929038, -0.9019877, -2.029799, 1, 0.1137255, 0, 1,
-1.913543, -0.7979671, -1.674555, 1, 0.1215686, 0, 1,
-1.873008, 1.241303, -1.273664, 1, 0.1254902, 0, 1,
-1.833755, -0.8134704, -2.161544, 1, 0.1333333, 0, 1,
-1.778408, 1.442685, 0.5878044, 1, 0.1372549, 0, 1,
-1.770911, 0.2664464, -1.962033, 1, 0.145098, 0, 1,
-1.765145, -0.9106581, -1.424027, 1, 0.1490196, 0, 1,
-1.761935, 0.9923825, -1.950667, 1, 0.1568628, 0, 1,
-1.754901, 0.5352169, -2.542292, 1, 0.1607843, 0, 1,
-1.753891, -1.028957, -1.987895, 1, 0.1686275, 0, 1,
-1.717039, -1.507713, -2.900338, 1, 0.172549, 0, 1,
-1.716482, -0.3605205, -3.129252, 1, 0.1803922, 0, 1,
-1.711997, -0.1160809, -1.622398, 1, 0.1843137, 0, 1,
-1.704421, 1.677951, -0.8500174, 1, 0.1921569, 0, 1,
-1.699669, 0.4714731, -1.221537, 1, 0.1960784, 0, 1,
-1.695188, -0.2877128, -2.848072, 1, 0.2039216, 0, 1,
-1.680549, 0.6923914, -1.44694, 1, 0.2117647, 0, 1,
-1.672798, 0.1656048, -2.133573, 1, 0.2156863, 0, 1,
-1.652087, 0.2466108, -1.685136, 1, 0.2235294, 0, 1,
-1.649272, 1.220625, -1.069311, 1, 0.227451, 0, 1,
-1.635041, 1.081359, -1.480049, 1, 0.2352941, 0, 1,
-1.620499, -1.097276, -1.101577, 1, 0.2392157, 0, 1,
-1.620276, -0.7336468, -1.846559, 1, 0.2470588, 0, 1,
-1.618174, -0.628472, -1.892054, 1, 0.2509804, 0, 1,
-1.599265, 0.09573715, -1.454275, 1, 0.2588235, 0, 1,
-1.592159, -0.2638518, -1.882855, 1, 0.2627451, 0, 1,
-1.584172, 0.1579885, -2.120272, 1, 0.2705882, 0, 1,
-1.580381, 0.0790968, -0.07060204, 1, 0.2745098, 0, 1,
-1.565176, 0.1638905, -0.6475407, 1, 0.282353, 0, 1,
-1.557218, 1.664576, -0.6421767, 1, 0.2862745, 0, 1,
-1.539583, 0.02503237, -1.586611, 1, 0.2941177, 0, 1,
-1.530174, 0.2494157, -1.287805, 1, 0.3019608, 0, 1,
-1.526601, 0.1149178, -1.97331, 1, 0.3058824, 0, 1,
-1.518533, 0.734926, -1.50868, 1, 0.3137255, 0, 1,
-1.512951, 1.642676, 0.4590462, 1, 0.3176471, 0, 1,
-1.508, 0.1472233, -2.255371, 1, 0.3254902, 0, 1,
-1.49848, 1.403796, -0.006615791, 1, 0.3294118, 0, 1,
-1.493766, -0.281165, -2.055456, 1, 0.3372549, 0, 1,
-1.4831, 0.7691594, 0.1765804, 1, 0.3411765, 0, 1,
-1.473847, -0.9602381, -1.840446, 1, 0.3490196, 0, 1,
-1.455008, -0.06821373, -1.055084, 1, 0.3529412, 0, 1,
-1.452851, -1.096893, -1.209961, 1, 0.3607843, 0, 1,
-1.426855, 1.393619, -1.016065, 1, 0.3647059, 0, 1,
-1.41982, 0.4026206, -0.9008595, 1, 0.372549, 0, 1,
-1.417253, -2.208391, -3.395457, 1, 0.3764706, 0, 1,
-1.402137, -0.1981326, -1.62451, 1, 0.3843137, 0, 1,
-1.393045, -0.2203044, -0.1885257, 1, 0.3882353, 0, 1,
-1.390026, 2.123445, 0.1170596, 1, 0.3960784, 0, 1,
-1.386518, 0.7948648, -0.1367054, 1, 0.4039216, 0, 1,
-1.372277, 1.038571, 0.638725, 1, 0.4078431, 0, 1,
-1.359701, -1.240885, -2.906407, 1, 0.4156863, 0, 1,
-1.340286, -1.130262, -0.4028345, 1, 0.4196078, 0, 1,
-1.336355, -0.8930512, -1.733296, 1, 0.427451, 0, 1,
-1.312309, -0.3028754, -3.412349, 1, 0.4313726, 0, 1,
-1.312254, -1.254707, -3.567299, 1, 0.4392157, 0, 1,
-1.295939, -0.08967577, -1.0629, 1, 0.4431373, 0, 1,
-1.283537, 0.5806971, -2.165679, 1, 0.4509804, 0, 1,
-1.279405, -0.515857, -3.254887, 1, 0.454902, 0, 1,
-1.266235, 1.068933, -1.463748, 1, 0.4627451, 0, 1,
-1.26349, 0.7868095, 1.819864, 1, 0.4666667, 0, 1,
-1.260358, -0.5469454, 0.4806699, 1, 0.4745098, 0, 1,
-1.253363, -2.508987, -2.657776, 1, 0.4784314, 0, 1,
-1.249026, 1.322527, -1.832154, 1, 0.4862745, 0, 1,
-1.243193, -1.417162, -2.46229, 1, 0.4901961, 0, 1,
-1.238339, -0.8852654, -3.687123, 1, 0.4980392, 0, 1,
-1.236961, -0.1990599, -1.577141, 1, 0.5058824, 0, 1,
-1.234501, -2.554428, -0.07223412, 1, 0.509804, 0, 1,
-1.22444, -0.4990989, -1.567417, 1, 0.5176471, 0, 1,
-1.221028, 0.247201, -1.856992, 1, 0.5215687, 0, 1,
-1.220604, -0.7885112, -2.002548, 1, 0.5294118, 0, 1,
-1.217686, -0.2729552, -2.180663, 1, 0.5333334, 0, 1,
-1.216544, 0.5031249, 1.439394, 1, 0.5411765, 0, 1,
-1.215025, 0.2268482, -1.229044, 1, 0.5450981, 0, 1,
-1.21472, 0.09510282, 0.3728289, 1, 0.5529412, 0, 1,
-1.205182, 1.336116, 0.3128534, 1, 0.5568628, 0, 1,
-1.200527, 1.701361, 0.9172121, 1, 0.5647059, 0, 1,
-1.194595, 1.688946, 0.0722068, 1, 0.5686275, 0, 1,
-1.184341, 0.8006178, 0.05018887, 1, 0.5764706, 0, 1,
-1.182051, -0.8246629, -2.659189, 1, 0.5803922, 0, 1,
-1.179285, 1.084324, -0.7038555, 1, 0.5882353, 0, 1,
-1.17827, 0.4203927, -1.244874, 1, 0.5921569, 0, 1,
-1.170389, 0.398481, -1.529554, 1, 0.6, 0, 1,
-1.168633, -0.8707496, -1.945383, 1, 0.6078432, 0, 1,
-1.165418, -1.537375, -1.90626, 1, 0.6117647, 0, 1,
-1.160784, -0.9630415, -2.588904, 1, 0.6196079, 0, 1,
-1.159902, 1.36705, -0.4878764, 1, 0.6235294, 0, 1,
-1.156482, 2.166219, -1.071367, 1, 0.6313726, 0, 1,
-1.153923, -1.258318, -1.095399, 1, 0.6352941, 0, 1,
-1.14904, -0.230559, -0.8598137, 1, 0.6431373, 0, 1,
-1.145312, -0.8530632, -4.311562, 1, 0.6470588, 0, 1,
-1.144702, -1.021915, -1.928634, 1, 0.654902, 0, 1,
-1.144256, 1.434884, -1.012975, 1, 0.6588235, 0, 1,
-1.144251, 0.596909, -1.033312, 1, 0.6666667, 0, 1,
-1.129122, -0.9251292, -2.925797, 1, 0.6705883, 0, 1,
-1.127594, -0.8057075, -2.639543, 1, 0.6784314, 0, 1,
-1.108981, 0.913016, -1.770889, 1, 0.682353, 0, 1,
-1.108855, 0.1677294, -0.8016906, 1, 0.6901961, 0, 1,
-1.106632, 0.6962203, -1.328135, 1, 0.6941177, 0, 1,
-1.103693, 0.9035341, -1.00758, 1, 0.7019608, 0, 1,
-1.096527, 0.7923365, -1.796519, 1, 0.7098039, 0, 1,
-1.093387, -1.047626, -3.707626, 1, 0.7137255, 0, 1,
-1.091936, 0.003935851, -2.673269, 1, 0.7215686, 0, 1,
-1.091133, -0.8535529, -1.676571, 1, 0.7254902, 0, 1,
-1.083825, 0.6063257, -0.3086451, 1, 0.7333333, 0, 1,
-1.07963, 0.441808, -2.105449, 1, 0.7372549, 0, 1,
-1.075648, -0.3796839, -2.292098, 1, 0.7450981, 0, 1,
-1.065556, -0.7926472, -3.097119, 1, 0.7490196, 0, 1,
-1.065509, 1.966681, -1.655718, 1, 0.7568628, 0, 1,
-1.062205, 0.9046939, -0.9764773, 1, 0.7607843, 0, 1,
-1.059375, -0.4647578, -2.017463, 1, 0.7686275, 0, 1,
-1.056471, -1.594779, -3.530146, 1, 0.772549, 0, 1,
-1.054506, -0.08280773, -2.325102, 1, 0.7803922, 0, 1,
-1.051326, 0.08611064, -1.81532, 1, 0.7843137, 0, 1,
-1.049112, -1.144928, -0.9124985, 1, 0.7921569, 0, 1,
-1.047609, -0.05427495, -0.7566066, 1, 0.7960784, 0, 1,
-1.045602, 2.090315, -1.431942, 1, 0.8039216, 0, 1,
-1.036639, -0.4372965, -3.306191, 1, 0.8117647, 0, 1,
-1.032247, -0.0517453, -0.9336945, 1, 0.8156863, 0, 1,
-1.02599, -1.349679, -2.79587, 1, 0.8235294, 0, 1,
-1.025196, -0.4388358, -2.918678, 1, 0.827451, 0, 1,
-1.021357, 1.296004, -0.3117233, 1, 0.8352941, 0, 1,
-1.020662, -1.298477, -2.665103, 1, 0.8392157, 0, 1,
-1.017433, -0.4205919, -1.764495, 1, 0.8470588, 0, 1,
-1.014199, 2.423836, 1.166386, 1, 0.8509804, 0, 1,
-1.006723, 0.3163278, 0.1085382, 1, 0.8588235, 0, 1,
-1.001563, -0.4142082, -1.817044, 1, 0.8627451, 0, 1,
-1.001552, -0.04749936, -1.435488, 1, 0.8705882, 0, 1,
-0.9902467, 0.2146941, 0.504298, 1, 0.8745098, 0, 1,
-0.9884998, 0.07217678, -1.836551, 1, 0.8823529, 0, 1,
-0.980778, 2.074368, 0.1859053, 1, 0.8862745, 0, 1,
-0.9766739, -0.1888435, -2.606521, 1, 0.8941177, 0, 1,
-0.9762592, 0.7312336, -0.09576834, 1, 0.8980392, 0, 1,
-0.972967, 1.610171, -2.766893, 1, 0.9058824, 0, 1,
-0.9709487, -1.581704, -3.996974, 1, 0.9137255, 0, 1,
-0.9709381, 1.139031, 0.06800374, 1, 0.9176471, 0, 1,
-0.9663718, -0.1389716, -0.7167664, 1, 0.9254902, 0, 1,
-0.9632278, 0.2328248, -0.9948514, 1, 0.9294118, 0, 1,
-0.9601514, -1.322033, -2.23591, 1, 0.9372549, 0, 1,
-0.9492877, 1.056195, -1.308852, 1, 0.9411765, 0, 1,
-0.946367, 1.040966, -0.9627645, 1, 0.9490196, 0, 1,
-0.9375796, 1.315552, 0.1529387, 1, 0.9529412, 0, 1,
-0.9319845, -0.09232152, -1.475213, 1, 0.9607843, 0, 1,
-0.9288021, -0.6493575, -2.757166, 1, 0.9647059, 0, 1,
-0.9271236, 1.170568, -1.561641, 1, 0.972549, 0, 1,
-0.9229119, -0.5031484, -2.319075, 1, 0.9764706, 0, 1,
-0.9224859, 3.008541, 0.8597513, 1, 0.9843137, 0, 1,
-0.9157642, 0.4855562, 0.715273, 1, 0.9882353, 0, 1,
-0.9130508, 0.1839857, -2.418243, 1, 0.9960784, 0, 1,
-0.9076856, -1.670507, -3.368514, 0.9960784, 1, 0, 1,
-0.905602, -0.2689611, -1.617617, 0.9921569, 1, 0, 1,
-0.8992435, -1.102531, -2.486158, 0.9843137, 1, 0, 1,
-0.8991631, -1.528538, -1.383014, 0.9803922, 1, 0, 1,
-0.8952014, 0.9722282, 0.04766959, 0.972549, 1, 0, 1,
-0.8858212, -0.8235945, -3.214663, 0.9686275, 1, 0, 1,
-0.8795585, -0.4468956, -2.113434, 0.9607843, 1, 0, 1,
-0.8787044, 1.023176, 0.2941929, 0.9568627, 1, 0, 1,
-0.8768404, 0.9788325, -2.260853, 0.9490196, 1, 0, 1,
-0.87508, -0.07115594, -0.8886425, 0.945098, 1, 0, 1,
-0.8725839, 0.1438315, -0.6671293, 0.9372549, 1, 0, 1,
-0.8718027, -0.6940361, -2.075862, 0.9333333, 1, 0, 1,
-0.8685086, 1.641847, -1.30116, 0.9254902, 1, 0, 1,
-0.8647326, -2.296062, -2.041319, 0.9215686, 1, 0, 1,
-0.8542798, -1.240738, -3.555991, 0.9137255, 1, 0, 1,
-0.8488169, -0.1176469, -2.090925, 0.9098039, 1, 0, 1,
-0.8467944, 0.1397316, -2.297817, 0.9019608, 1, 0, 1,
-0.8460246, 1.2312, -0.09089154, 0.8941177, 1, 0, 1,
-0.8403219, -0.5949426, -3.93016, 0.8901961, 1, 0, 1,
-0.8370599, -0.6414148, -3.255525, 0.8823529, 1, 0, 1,
-0.8369299, 1.285748, 0.2261029, 0.8784314, 1, 0, 1,
-0.8274508, 2.455766, -0.4485627, 0.8705882, 1, 0, 1,
-0.8162883, -1.572678, -2.58641, 0.8666667, 1, 0, 1,
-0.8153207, 2.305424, -1.343938, 0.8588235, 1, 0, 1,
-0.7999251, 1.350639, 0.5039666, 0.854902, 1, 0, 1,
-0.7970592, 2.560956, -0.8973958, 0.8470588, 1, 0, 1,
-0.7960689, 0.9163596, -0.7303974, 0.8431373, 1, 0, 1,
-0.7945723, 0.3106201, -0.1944751, 0.8352941, 1, 0, 1,
-0.7819684, -1.221577, -2.571191, 0.8313726, 1, 0, 1,
-0.7791858, -0.3565967, -1.318172, 0.8235294, 1, 0, 1,
-0.7772836, 1.210718, -1.122859, 0.8196079, 1, 0, 1,
-0.7765904, -0.2522388, -0.6058835, 0.8117647, 1, 0, 1,
-0.7722831, 0.1625074, -2.214868, 0.8078431, 1, 0, 1,
-0.7716247, 0.2461637, -1.207782, 0.8, 1, 0, 1,
-0.7679155, 1.034662, -0.8376735, 0.7921569, 1, 0, 1,
-0.767331, -0.1778802, -2.235801, 0.7882353, 1, 0, 1,
-0.7660128, -1.37771, -3.029575, 0.7803922, 1, 0, 1,
-0.7626371, -1.087503, -1.585231, 0.7764706, 1, 0, 1,
-0.7596884, -1.845037, -3.134914, 0.7686275, 1, 0, 1,
-0.7569402, -0.2136747, -1.087602, 0.7647059, 1, 0, 1,
-0.7543036, -1.908409, -3.831399, 0.7568628, 1, 0, 1,
-0.7511732, 1.422813, 0.0816073, 0.7529412, 1, 0, 1,
-0.743234, -0.2724655, 0.2190136, 0.7450981, 1, 0, 1,
-0.7399374, 0.7748907, -2.090822, 0.7411765, 1, 0, 1,
-0.7386875, 0.4981104, -0.07131567, 0.7333333, 1, 0, 1,
-0.7330669, -0.468507, -2.324005, 0.7294118, 1, 0, 1,
-0.7307574, -1.235428, -1.529644, 0.7215686, 1, 0, 1,
-0.7301543, -0.694322, -3.217159, 0.7176471, 1, 0, 1,
-0.7238157, 0.1535629, -1.204466, 0.7098039, 1, 0, 1,
-0.7231806, 0.3727628, 0.8215485, 0.7058824, 1, 0, 1,
-0.7227749, -1.664586, -1.641873, 0.6980392, 1, 0, 1,
-0.7196848, 0.6198326, -0.6002934, 0.6901961, 1, 0, 1,
-0.7178122, -0.7974294, -1.292138, 0.6862745, 1, 0, 1,
-0.7138501, 1.811452, -0.8014718, 0.6784314, 1, 0, 1,
-0.707217, 1.213204, -0.4327972, 0.6745098, 1, 0, 1,
-0.7063686, 0.7, -0.4515995, 0.6666667, 1, 0, 1,
-0.7050937, 0.4676874, -1.469337, 0.6627451, 1, 0, 1,
-0.700062, -0.3975724, -2.371979, 0.654902, 1, 0, 1,
-0.6927148, 0.7142078, -2.287963, 0.6509804, 1, 0, 1,
-0.6908606, 2.084813, 0.4444858, 0.6431373, 1, 0, 1,
-0.6860067, -1.523399, -2.700918, 0.6392157, 1, 0, 1,
-0.680239, 1.749692, -0.2859335, 0.6313726, 1, 0, 1,
-0.6800106, -0.03719482, -2.322154, 0.627451, 1, 0, 1,
-0.679871, -1.215929, -2.355024, 0.6196079, 1, 0, 1,
-0.6797372, -0.09905105, -2.001976, 0.6156863, 1, 0, 1,
-0.6752619, -2.238686, -3.107975, 0.6078432, 1, 0, 1,
-0.6710624, -0.5787849, -1.717233, 0.6039216, 1, 0, 1,
-0.669764, -0.6620003, -3.603546, 0.5960785, 1, 0, 1,
-0.669701, -3.184543, -2.629532, 0.5882353, 1, 0, 1,
-0.6676956, -0.1675415, -2.888078, 0.5843138, 1, 0, 1,
-0.660998, -2.497632, -2.706944, 0.5764706, 1, 0, 1,
-0.6597609, -1.965014, -3.936272, 0.572549, 1, 0, 1,
-0.6587495, -0.8154052, -1.374144, 0.5647059, 1, 0, 1,
-0.658549, 0.2366752, -2.218125, 0.5607843, 1, 0, 1,
-0.6571284, 1.472632, -1.64072, 0.5529412, 1, 0, 1,
-0.6558352, 1.017504, -0.8898103, 0.5490196, 1, 0, 1,
-0.6509288, -1.951974, -1.502232, 0.5411765, 1, 0, 1,
-0.6483495, 0.9929919, 1.235016, 0.5372549, 1, 0, 1,
-0.6468709, -1.740519, -2.624886, 0.5294118, 1, 0, 1,
-0.6396616, 0.8428906, -0.3705249, 0.5254902, 1, 0, 1,
-0.6385507, -0.8199409, -3.047513, 0.5176471, 1, 0, 1,
-0.6354466, -0.7118688, -2.594764, 0.5137255, 1, 0, 1,
-0.6318882, 0.8695671, -2.621521, 0.5058824, 1, 0, 1,
-0.6301134, 0.1375074, -1.723891, 0.5019608, 1, 0, 1,
-0.6253337, -0.7755418, -0.833683, 0.4941176, 1, 0, 1,
-0.624844, -0.007384412, -2.189126, 0.4862745, 1, 0, 1,
-0.6219007, -0.08736211, 0.01830546, 0.4823529, 1, 0, 1,
-0.6213267, -0.1164455, -2.942764, 0.4745098, 1, 0, 1,
-0.6194987, 0.8359817, -0.7692058, 0.4705882, 1, 0, 1,
-0.6153646, -0.2077634, -1.75319, 0.4627451, 1, 0, 1,
-0.6145222, -0.4505651, -1.771821, 0.4588235, 1, 0, 1,
-0.6132812, 0.6877335, -1.663277, 0.4509804, 1, 0, 1,
-0.6126192, 1.224941, -0.2149723, 0.4470588, 1, 0, 1,
-0.6096, -0.4880643, -2.958913, 0.4392157, 1, 0, 1,
-0.603784, -1.551637, -2.727814, 0.4352941, 1, 0, 1,
-0.5997751, 0.7187083, -2.451173, 0.427451, 1, 0, 1,
-0.5997247, -0.9859493, -3.111148, 0.4235294, 1, 0, 1,
-0.5994924, -1.555395, -3.44763, 0.4156863, 1, 0, 1,
-0.5991026, -0.1180365, -4.131991, 0.4117647, 1, 0, 1,
-0.5953413, 0.04154326, -1.412505, 0.4039216, 1, 0, 1,
-0.5938122, -0.7019671, -1.296041, 0.3960784, 1, 0, 1,
-0.5920737, 0.3270891, -1.840846, 0.3921569, 1, 0, 1,
-0.590557, -0.329222, -2.169345, 0.3843137, 1, 0, 1,
-0.5814739, -1.414566, -2.161377, 0.3803922, 1, 0, 1,
-0.578203, -1.593374, -1.537622, 0.372549, 1, 0, 1,
-0.576324, 0.6426421, -0.9435112, 0.3686275, 1, 0, 1,
-0.5754405, 0.1382406, 0.4511293, 0.3607843, 1, 0, 1,
-0.5743456, -0.4527513, -2.642782, 0.3568628, 1, 0, 1,
-0.5742658, 0.780624, -1.013822, 0.3490196, 1, 0, 1,
-0.5694909, 0.9241012, -0.2762044, 0.345098, 1, 0, 1,
-0.5690633, 0.1427186, -1.354967, 0.3372549, 1, 0, 1,
-0.5672272, 0.6421952, 0.1886265, 0.3333333, 1, 0, 1,
-0.5668423, -0.5158251, -2.719094, 0.3254902, 1, 0, 1,
-0.5655974, 1.794021, -0.4595676, 0.3215686, 1, 0, 1,
-0.5620944, -0.5823345, -2.196699, 0.3137255, 1, 0, 1,
-0.5619857, 0.7971965, -0.4164738, 0.3098039, 1, 0, 1,
-0.5587149, -0.3096718, -1.661354, 0.3019608, 1, 0, 1,
-0.5578925, -1.021632, -2.214621, 0.2941177, 1, 0, 1,
-0.5525947, 1.23755, -1.796999, 0.2901961, 1, 0, 1,
-0.5511748, -0.08775593, -2.314961, 0.282353, 1, 0, 1,
-0.5506805, -0.1814315, -0.9624017, 0.2784314, 1, 0, 1,
-0.546887, 0.7958862, -1.282365, 0.2705882, 1, 0, 1,
-0.5457051, 0.2198192, -2.882307, 0.2666667, 1, 0, 1,
-0.5454569, 2.000261, -0.003607834, 0.2588235, 1, 0, 1,
-0.5421307, -0.08944532, -0.8444367, 0.254902, 1, 0, 1,
-0.5411328, 1.615829, -0.3494421, 0.2470588, 1, 0, 1,
-0.5404351, 0.3330853, -1.612487, 0.2431373, 1, 0, 1,
-0.5402101, -1.333704, -2.682533, 0.2352941, 1, 0, 1,
-0.5392372, -0.1672146, -0.8627579, 0.2313726, 1, 0, 1,
-0.5345843, 0.8565156, -0.2372395, 0.2235294, 1, 0, 1,
-0.5310054, -1.832399, -2.650461, 0.2196078, 1, 0, 1,
-0.5281581, 1.267016, -0.7797502, 0.2117647, 1, 0, 1,
-0.5270346, -0.9313239, -3.009937, 0.2078431, 1, 0, 1,
-0.5253069, -0.2146006, -0.1591244, 0.2, 1, 0, 1,
-0.5252542, 0.4724022, -1.017943, 0.1921569, 1, 0, 1,
-0.5235284, 1.537475, 0.4187909, 0.1882353, 1, 0, 1,
-0.5224697, -1.271757, -0.4954883, 0.1803922, 1, 0, 1,
-0.521704, -0.2187716, -0.5017636, 0.1764706, 1, 0, 1,
-0.5215333, -0.5246614, -1.64422, 0.1686275, 1, 0, 1,
-0.5140516, -0.6226932, -3.319121, 0.1647059, 1, 0, 1,
-0.5086858, 0.9600243, 3.184948, 0.1568628, 1, 0, 1,
-0.5059351, 1.782245, -0.1095563, 0.1529412, 1, 0, 1,
-0.5039036, -0.1649034, -3.016852, 0.145098, 1, 0, 1,
-0.5035911, -0.7218703, -3.57617, 0.1411765, 1, 0, 1,
-0.5018181, 0.3335085, -0.01502829, 0.1333333, 1, 0, 1,
-0.4999502, -1.446887, -2.209962, 0.1294118, 1, 0, 1,
-0.4983024, 0.61551, -0.4220551, 0.1215686, 1, 0, 1,
-0.4981768, 1.282687, 0.473085, 0.1176471, 1, 0, 1,
-0.4955315, 0.6248289, -0.9586942, 0.1098039, 1, 0, 1,
-0.494406, -0.1143275, -0.6787963, 0.1058824, 1, 0, 1,
-0.4938057, 0.02508884, -1.285598, 0.09803922, 1, 0, 1,
-0.4909371, -0.3436065, -0.6898057, 0.09019608, 1, 0, 1,
-0.4850894, -0.3585717, -2.8516, 0.08627451, 1, 0, 1,
-0.4754735, -0.7860695, -1.686265, 0.07843138, 1, 0, 1,
-0.4741846, -0.1697941, 0.09844297, 0.07450981, 1, 0, 1,
-0.4736828, -0.2998891, -2.254728, 0.06666667, 1, 0, 1,
-0.4733745, 2.485901, 0.06174695, 0.0627451, 1, 0, 1,
-0.4714862, -1.294194, -3.998266, 0.05490196, 1, 0, 1,
-0.4712513, 0.3461128, -1.359497, 0.05098039, 1, 0, 1,
-0.4675319, 0.3564355, -0.2318114, 0.04313726, 1, 0, 1,
-0.4645851, -0.6297812, -3.73809, 0.03921569, 1, 0, 1,
-0.4620116, -0.5351743, -1.362826, 0.03137255, 1, 0, 1,
-0.4607792, 1.402649, 0.2768829, 0.02745098, 1, 0, 1,
-0.4603185, -1.712089, -3.912107, 0.01960784, 1, 0, 1,
-0.458512, 1.853873, -0.1549741, 0.01568628, 1, 0, 1,
-0.4549305, 0.1267536, -0.5221109, 0.007843138, 1, 0, 1,
-0.4546632, 0.1391007, -2.081609, 0.003921569, 1, 0, 1,
-0.4459812, -0.3506524, -1.360758, 0, 1, 0.003921569, 1,
-0.4435489, -0.8134826, -0.7797971, 0, 1, 0.01176471, 1,
-0.4411378, -0.108878, -2.621462, 0, 1, 0.01568628, 1,
-0.4395204, 1.797258, -0.3982392, 0, 1, 0.02352941, 1,
-0.439286, 0.2695386, -0.1122781, 0, 1, 0.02745098, 1,
-0.438962, 2.1737, 0.5405189, 0, 1, 0.03529412, 1,
-0.4386778, -0.2166326, -2.625317, 0, 1, 0.03921569, 1,
-0.4372496, 0.6158513, -2.13411, 0, 1, 0.04705882, 1,
-0.4344378, 0.4310742, -1.436045, 0, 1, 0.05098039, 1,
-0.4339551, 1.383186, -2.523257, 0, 1, 0.05882353, 1,
-0.4321591, -1.046309, -3.694756, 0, 1, 0.0627451, 1,
-0.4301488, 1.598388, -0.2902508, 0, 1, 0.07058824, 1,
-0.4272489, 1.085416, 0.67835, 0, 1, 0.07450981, 1,
-0.4245192, 1.251618, -1.352393, 0, 1, 0.08235294, 1,
-0.4235501, 0.2693592, 0.07962156, 0, 1, 0.08627451, 1,
-0.4229496, -0.6749091, -1.329439, 0, 1, 0.09411765, 1,
-0.4159674, -0.8941818, -3.567132, 0, 1, 0.1019608, 1,
-0.4037138, 0.2836554, -0.6008554, 0, 1, 0.1058824, 1,
-0.4036107, -1.454442, -2.668549, 0, 1, 0.1137255, 1,
-0.4011524, -0.22493, -2.120592, 0, 1, 0.1176471, 1,
-0.3944506, -0.3407646, -2.14705, 0, 1, 0.1254902, 1,
-0.389102, 1.008235, -0.01264489, 0, 1, 0.1294118, 1,
-0.3852001, 0.6306753, -1.510805, 0, 1, 0.1372549, 1,
-0.378565, 1.318438, -1.297176, 0, 1, 0.1411765, 1,
-0.3773138, -0.1883419, -2.627049, 0, 1, 0.1490196, 1,
-0.3759402, -0.9499831, -3.196386, 0, 1, 0.1529412, 1,
-0.3757041, 0.6337559, -0.9229122, 0, 1, 0.1607843, 1,
-0.3728688, 1.735025, -1.400537, 0, 1, 0.1647059, 1,
-0.3698632, -1.620076, -2.016949, 0, 1, 0.172549, 1,
-0.3673662, -0.104588, -3.150017, 0, 1, 0.1764706, 1,
-0.3640688, -0.1639208, -0.7594211, 0, 1, 0.1843137, 1,
-0.3627315, 0.06803913, 0.04392432, 0, 1, 0.1882353, 1,
-0.3596692, -0.2466264, -1.904857, 0, 1, 0.1960784, 1,
-0.3554732, -1.318911, -2.000419, 0, 1, 0.2039216, 1,
-0.3539414, -0.6803626, -2.102988, 0, 1, 0.2078431, 1,
-0.3482893, 0.7038143, -0.2185698, 0, 1, 0.2156863, 1,
-0.3463421, 0.387768, -0.79966, 0, 1, 0.2196078, 1,
-0.3458381, 0.2170386, -1.131372, 0, 1, 0.227451, 1,
-0.3351983, -1.882945, -2.557517, 0, 1, 0.2313726, 1,
-0.3348127, 1.810047, -0.3118608, 0, 1, 0.2392157, 1,
-0.3339893, 1.129586, -0.2442768, 0, 1, 0.2431373, 1,
-0.3316353, -1.546254, -2.544388, 0, 1, 0.2509804, 1,
-0.3301074, 0.5536392, 0.2510899, 0, 1, 0.254902, 1,
-0.3283738, 0.03988959, 0.5594409, 0, 1, 0.2627451, 1,
-0.3283424, -0.1707828, -2.269731, 0, 1, 0.2666667, 1,
-0.3273452, 1.875354, -1.179141, 0, 1, 0.2745098, 1,
-0.3249661, 1.280226, -0.631843, 0, 1, 0.2784314, 1,
-0.3232232, 1.211653, 0.04816918, 0, 1, 0.2862745, 1,
-0.3222365, 0.3060337, 1.168397, 0, 1, 0.2901961, 1,
-0.3159045, 0.444862, -1.892374, 0, 1, 0.2980392, 1,
-0.3148, 0.7261597, 0.1994078, 0, 1, 0.3058824, 1,
-0.3139232, 1.347177, 0.9429738, 0, 1, 0.3098039, 1,
-0.3065692, 0.7165956, -2.038559, 0, 1, 0.3176471, 1,
-0.3049629, -1.05859, -3.584407, 0, 1, 0.3215686, 1,
-0.3003556, -0.4042399, -1.846282, 0, 1, 0.3294118, 1,
-0.2995806, 1.013535, -1.635876, 0, 1, 0.3333333, 1,
-0.2977518, 1.061052, 0.9162557, 0, 1, 0.3411765, 1,
-0.2964818, 0.07323326, -4.483902, 0, 1, 0.345098, 1,
-0.295431, 1.578311, 0.3965294, 0, 1, 0.3529412, 1,
-0.2936889, -0.07919648, -2.587215, 0, 1, 0.3568628, 1,
-0.2885506, 0.06178831, -0.2907542, 0, 1, 0.3647059, 1,
-0.2877853, 0.4758133, -2.216417, 0, 1, 0.3686275, 1,
-0.2858775, 0.3700285, -0.5816089, 0, 1, 0.3764706, 1,
-0.2852209, 1.247576, -0.1774465, 0, 1, 0.3803922, 1,
-0.2838759, -0.6104741, -2.518321, 0, 1, 0.3882353, 1,
-0.2834074, -0.184664, -2.432553, 0, 1, 0.3921569, 1,
-0.281809, -0.3589421, -0.4841076, 0, 1, 0.4, 1,
-0.274537, 0.1601236, -2.347439, 0, 1, 0.4078431, 1,
-0.2744536, 1.211092, 0.7500623, 0, 1, 0.4117647, 1,
-0.2739157, -1.829882, -1.827713, 0, 1, 0.4196078, 1,
-0.273624, -1.442757, -1.072697, 0, 1, 0.4235294, 1,
-0.2727503, 0.8086456, -1.557924, 0, 1, 0.4313726, 1,
-0.2718188, -0.9987438, -4.17271, 0, 1, 0.4352941, 1,
-0.2671112, 2.000439, 0.6529199, 0, 1, 0.4431373, 1,
-0.2657598, -0.2104891, -3.135276, 0, 1, 0.4470588, 1,
-0.2645135, 0.2675102, -0.6792343, 0, 1, 0.454902, 1,
-0.2640271, 0.949937, 1.380611, 0, 1, 0.4588235, 1,
-0.2636228, 0.3746493, 0.573393, 0, 1, 0.4666667, 1,
-0.2628965, 0.8124797, -0.7693051, 0, 1, 0.4705882, 1,
-0.2611822, -0.01229489, -2.508252, 0, 1, 0.4784314, 1,
-0.2603302, 0.6419748, -0.4156975, 0, 1, 0.4823529, 1,
-0.2556141, 0.3261499, -0.2089645, 0, 1, 0.4901961, 1,
-0.2555697, 0.8487074, -1.158834, 0, 1, 0.4941176, 1,
-0.2437942, -0.04164804, -2.433745, 0, 1, 0.5019608, 1,
-0.23985, 0.8290127, -0.1896279, 0, 1, 0.509804, 1,
-0.2369449, 0.526929, 0.5759745, 0, 1, 0.5137255, 1,
-0.2343672, 0.854484, -0.9185058, 0, 1, 0.5215687, 1,
-0.2273474, -1.292916, -3.089947, 0, 1, 0.5254902, 1,
-0.2190863, 0.3988166, -1.348982, 0, 1, 0.5333334, 1,
-0.2184588, -0.3717085, -3.855971, 0, 1, 0.5372549, 1,
-0.2157179, -0.342849, -2.330384, 0, 1, 0.5450981, 1,
-0.215493, 0.8957567, -0.7295867, 0, 1, 0.5490196, 1,
-0.2123855, -1.04674, -1.935055, 0, 1, 0.5568628, 1,
-0.2112226, -0.7308624, -2.29627, 0, 1, 0.5607843, 1,
-0.2095629, -0.1748982, 0.1088291, 0, 1, 0.5686275, 1,
-0.1998082, 0.4664806, -0.3866114, 0, 1, 0.572549, 1,
-0.1937748, 0.9711483, 1.234022, 0, 1, 0.5803922, 1,
-0.1933626, -0.438675, -2.640148, 0, 1, 0.5843138, 1,
-0.1918304, -0.7025435, -1.752297, 0, 1, 0.5921569, 1,
-0.183305, 2.087997, -1.27779, 0, 1, 0.5960785, 1,
-0.1828502, -1.295197, -2.20927, 0, 1, 0.6039216, 1,
-0.1802752, -1.844085, -4.373693, 0, 1, 0.6117647, 1,
-0.1788669, 0.1751689, -1.492108, 0, 1, 0.6156863, 1,
-0.1740215, 0.759523, 0.4877429, 0, 1, 0.6235294, 1,
-0.1733307, 1.036437, -0.3940684, 0, 1, 0.627451, 1,
-0.1732779, 0.7618014, -1.413275, 0, 1, 0.6352941, 1,
-0.1631839, -0.9760851, -3.972418, 0, 1, 0.6392157, 1,
-0.1605669, 0.8054207, -1.257438, 0, 1, 0.6470588, 1,
-0.1590435, 0.2937354, -1.226188, 0, 1, 0.6509804, 1,
-0.1572642, -1.671135, -2.67837, 0, 1, 0.6588235, 1,
-0.1563995, -0.4103092, -3.406918, 0, 1, 0.6627451, 1,
-0.1464875, -0.7385148, -2.671361, 0, 1, 0.6705883, 1,
-0.1462184, 1.084032, -1.202505, 0, 1, 0.6745098, 1,
-0.1331907, 0.04254188, -1.368203, 0, 1, 0.682353, 1,
-0.1324848, -1.517833, -2.622105, 0, 1, 0.6862745, 1,
-0.1323892, -0.1754589, -3.185151, 0, 1, 0.6941177, 1,
-0.1316119, 0.0784016, -2.639068, 0, 1, 0.7019608, 1,
-0.1285172, 0.151799, -2.530221, 0, 1, 0.7058824, 1,
-0.1280912, 2.116219, 0.2905942, 0, 1, 0.7137255, 1,
-0.1270727, 0.7454831, -0.7000573, 0, 1, 0.7176471, 1,
-0.1241694, 0.2877394, -0.6335351, 0, 1, 0.7254902, 1,
-0.1220868, 1.613657, -0.5274556, 0, 1, 0.7294118, 1,
-0.1219457, 1.408866, -1.778588, 0, 1, 0.7372549, 1,
-0.1210381, 0.5245862, -0.3042775, 0, 1, 0.7411765, 1,
-0.1190159, 0.7775136, -2.062531, 0, 1, 0.7490196, 1,
-0.1177158, 0.6577748, 1.259666, 0, 1, 0.7529412, 1,
-0.1166798, -0.06252598, -3.140227, 0, 1, 0.7607843, 1,
-0.1153549, -1.175813, -4.573424, 0, 1, 0.7647059, 1,
-0.113455, -0.9939546, -3.990303, 0, 1, 0.772549, 1,
-0.1058045, 1.671454, -0.5163518, 0, 1, 0.7764706, 1,
-0.1044394, -0.6626756, -3.520939, 0, 1, 0.7843137, 1,
-0.1023691, -0.4452294, -3.699142, 0, 1, 0.7882353, 1,
-0.09859542, -1.338182, -2.564944, 0, 1, 0.7960784, 1,
-0.09563348, -0.04134412, -1.75291, 0, 1, 0.8039216, 1,
-0.0942096, -0.8636215, -2.273191, 0, 1, 0.8078431, 1,
-0.09221333, 0.5110992, 0.684533, 0, 1, 0.8156863, 1,
-0.08719605, -0.269888, -1.625129, 0, 1, 0.8196079, 1,
-0.08711728, 1.252053, 0.2920679, 0, 1, 0.827451, 1,
-0.08097661, -0.9416476, -5.59158, 0, 1, 0.8313726, 1,
-0.0766613, 0.58713, -0.04847931, 0, 1, 0.8392157, 1,
-0.07258121, -0.4629214, -3.297811, 0, 1, 0.8431373, 1,
-0.07207179, -1.159681, -2.939754, 0, 1, 0.8509804, 1,
-0.07121526, -0.8503812, -3.141859, 0, 1, 0.854902, 1,
-0.06696638, 0.8484682, -0.2445966, 0, 1, 0.8627451, 1,
-0.06612536, -0.8165299, -3.339395, 0, 1, 0.8666667, 1,
-0.06335794, -0.8757073, -3.799234, 0, 1, 0.8745098, 1,
-0.05857674, -0.7278829, -4.478029, 0, 1, 0.8784314, 1,
-0.0567904, 0.7070985, 0.2185412, 0, 1, 0.8862745, 1,
-0.05634836, 1.897442, 0.6307324, 0, 1, 0.8901961, 1,
-0.05482451, -1.231647, -3.52631, 0, 1, 0.8980392, 1,
-0.05278656, -1.052868, -2.257454, 0, 1, 0.9058824, 1,
-0.05100155, 0.4346298, -1.55287, 0, 1, 0.9098039, 1,
-0.05093904, 0.7910832, -0.294836, 0, 1, 0.9176471, 1,
-0.04612296, 3.600231, -0.8347268, 0, 1, 0.9215686, 1,
-0.04063257, 0.03749485, -0.2772273, 0, 1, 0.9294118, 1,
-0.03811112, -2.386477, -3.468282, 0, 1, 0.9333333, 1,
-0.0355193, 0.1715696, 2.246171, 0, 1, 0.9411765, 1,
-0.03457804, 0.7581812, -0.01437064, 0, 1, 0.945098, 1,
-0.03450623, -0.7877268, -2.779214, 0, 1, 0.9529412, 1,
-0.03309825, -1.240482, -3.315288, 0, 1, 0.9568627, 1,
-0.02685097, 1.431243, -0.4985039, 0, 1, 0.9647059, 1,
-0.02210224, 0.238513, 0.2110939, 0, 1, 0.9686275, 1,
-0.02158242, 2.707417, -0.5431426, 0, 1, 0.9764706, 1,
-0.01941068, 0.07497819, 1.513906, 0, 1, 0.9803922, 1,
-0.01734092, 0.5928779, -0.6772822, 0, 1, 0.9882353, 1,
-0.01677035, -1.179732, -3.365304, 0, 1, 0.9921569, 1,
-0.01455429, 1.077018, -0.9024773, 0, 1, 1, 1,
-0.001790333, -0.6804246, -3.451925, 0, 0.9921569, 1, 1,
0.003014808, -0.3931602, 3.139791, 0, 0.9882353, 1, 1,
0.003954665, 1.026667, -0.03671746, 0, 0.9803922, 1, 1,
0.007040255, 1.145015, 2.167873, 0, 0.9764706, 1, 1,
0.01075435, -0.4856429, 2.085206, 0, 0.9686275, 1, 1,
0.01080749, -1.0113, 3.368154, 0, 0.9647059, 1, 1,
0.0108126, -0.3976789, 2.920543, 0, 0.9568627, 1, 1,
0.01346975, 0.06079467, 0.660403, 0, 0.9529412, 1, 1,
0.01478661, -0.0953481, 5.828006, 0, 0.945098, 1, 1,
0.0182112, 0.5673336, -0.02858792, 0, 0.9411765, 1, 1,
0.01908602, -0.005792747, 1.889524, 0, 0.9333333, 1, 1,
0.02782511, -1.054822, 3.45881, 0, 0.9294118, 1, 1,
0.03004569, 1.2791, 0.746071, 0, 0.9215686, 1, 1,
0.03019251, 0.5900622, -0.2998544, 0, 0.9176471, 1, 1,
0.03089495, 0.0858747, 1.888717, 0, 0.9098039, 1, 1,
0.03242823, -1.214231, 1.75488, 0, 0.9058824, 1, 1,
0.03687655, -1.374592, 2.862591, 0, 0.8980392, 1, 1,
0.03915469, -0.2874829, 2.499784, 0, 0.8901961, 1, 1,
0.04111618, 1.698473, -1.86873, 0, 0.8862745, 1, 1,
0.04627939, -1.646814, 3.30068, 0, 0.8784314, 1, 1,
0.04979989, -0.4356921, 1.366632, 0, 0.8745098, 1, 1,
0.05495314, -1.155832, 3.188238, 0, 0.8666667, 1, 1,
0.05528379, 0.1944012, -0.680527, 0, 0.8627451, 1, 1,
0.05828735, 2.169427, -0.7596431, 0, 0.854902, 1, 1,
0.0616187, -0.2246866, 3.057189, 0, 0.8509804, 1, 1,
0.06304822, 0.3416189, 0.7586928, 0, 0.8431373, 1, 1,
0.06717495, 1.150531, -0.9462689, 0, 0.8392157, 1, 1,
0.06932778, 0.4570314, -0.8643748, 0, 0.8313726, 1, 1,
0.06947298, 0.5868916, -0.3932713, 0, 0.827451, 1, 1,
0.07656683, 0.1467294, -0.3458804, 0, 0.8196079, 1, 1,
0.07704534, 0.04049894, 0.1058673, 0, 0.8156863, 1, 1,
0.07710455, 0.03686073, 1.197318, 0, 0.8078431, 1, 1,
0.07868816, 1.730199, 1.68104, 0, 0.8039216, 1, 1,
0.08108308, -0.7369328, 1.554941, 0, 0.7960784, 1, 1,
0.08558916, -1.121614, 4.305002, 0, 0.7882353, 1, 1,
0.08577514, -1.017212, 2.83293, 0, 0.7843137, 1, 1,
0.08841003, -0.2460879, 4.225335, 0, 0.7764706, 1, 1,
0.08900885, -1.056935, 3.302593, 0, 0.772549, 1, 1,
0.09005051, -1.235869, 3.859282, 0, 0.7647059, 1, 1,
0.09073415, -0.402164, 2.47847, 0, 0.7607843, 1, 1,
0.09367605, 2.176666, -0.1547961, 0, 0.7529412, 1, 1,
0.0957958, -1.756061, 4.445462, 0, 0.7490196, 1, 1,
0.09583207, -0.6004347, 2.996891, 0, 0.7411765, 1, 1,
0.09766263, 0.5234546, -0.6103789, 0, 0.7372549, 1, 1,
0.09818722, 0.9555704, -0.3316105, 0, 0.7294118, 1, 1,
0.09882644, 1.443843, 0.4170076, 0, 0.7254902, 1, 1,
0.09950209, -0.8118308, 3.369642, 0, 0.7176471, 1, 1,
0.1021163, -0.7024684, 2.847532, 0, 0.7137255, 1, 1,
0.1021392, 0.3278925, 1.528945, 0, 0.7058824, 1, 1,
0.1030249, 1.576108, -0.3460761, 0, 0.6980392, 1, 1,
0.1040519, -1.471437, 3.609489, 0, 0.6941177, 1, 1,
0.1070042, 0.114078, -0.1033035, 0, 0.6862745, 1, 1,
0.1073013, -0.8510268, 2.815269, 0, 0.682353, 1, 1,
0.1102417, 0.3694149, 1.280315, 0, 0.6745098, 1, 1,
0.1121724, -0.108247, 2.358374, 0, 0.6705883, 1, 1,
0.1133041, 0.09374916, 0.9484222, 0, 0.6627451, 1, 1,
0.1165202, -1.181655, 2.532458, 0, 0.6588235, 1, 1,
0.1166534, 0.8033693, 0.03124793, 0, 0.6509804, 1, 1,
0.1173595, -0.9182307, 3.755332, 0, 0.6470588, 1, 1,
0.118135, -0.1421064, 0.6363131, 0, 0.6392157, 1, 1,
0.1256877, -0.323557, 3.718188, 0, 0.6352941, 1, 1,
0.1259131, -1.004668, 3.285404, 0, 0.627451, 1, 1,
0.1293392, 2.35884, -0.5396845, 0, 0.6235294, 1, 1,
0.1298114, 0.04642276, 1.212586, 0, 0.6156863, 1, 1,
0.1299906, -0.6730015, 2.524012, 0, 0.6117647, 1, 1,
0.1345448, -0.971048, 5.214119, 0, 0.6039216, 1, 1,
0.1374567, -0.6475887, 3.322675, 0, 0.5960785, 1, 1,
0.1437245, -1.431997, 3.288578, 0, 0.5921569, 1, 1,
0.1464625, 1.464586, 0.08467311, 0, 0.5843138, 1, 1,
0.1486135, -0.5819337, 2.785737, 0, 0.5803922, 1, 1,
0.152415, -1.727838, 3.513601, 0, 0.572549, 1, 1,
0.1526079, 0.8204835, 0.2818408, 0, 0.5686275, 1, 1,
0.1544293, 1.256859, -0.6550825, 0, 0.5607843, 1, 1,
0.156018, 0.01219018, 3.158989, 0, 0.5568628, 1, 1,
0.1575486, 0.4356706, 1.722622, 0, 0.5490196, 1, 1,
0.1596193, -0.2784756, 1.525737, 0, 0.5450981, 1, 1,
0.1621009, -0.4536729, 2.301311, 0, 0.5372549, 1, 1,
0.1631732, 0.3387819, 1.524856, 0, 0.5333334, 1, 1,
0.1634549, -0.2279071, 2.323558, 0, 0.5254902, 1, 1,
0.1693783, 0.5911239, 0.05558991, 0, 0.5215687, 1, 1,
0.1699571, 0.7281098, 0.3272281, 0, 0.5137255, 1, 1,
0.172593, 0.4788317, 0.6465663, 0, 0.509804, 1, 1,
0.1727425, -0.5568686, 2.128229, 0, 0.5019608, 1, 1,
0.1796705, -0.8607226, 2.087309, 0, 0.4941176, 1, 1,
0.1823573, -0.587288, 3.313002, 0, 0.4901961, 1, 1,
0.1839548, -1.849388, 2.377278, 0, 0.4823529, 1, 1,
0.1841116, 0.6612768, -1.449383, 0, 0.4784314, 1, 1,
0.2010824, -0.1139164, 0.3595509, 0, 0.4705882, 1, 1,
0.201884, 0.3329435, 1.670668, 0, 0.4666667, 1, 1,
0.2050589, -0.7485672, 3.560102, 0, 0.4588235, 1, 1,
0.209401, -0.3618239, 4.50559, 0, 0.454902, 1, 1,
0.2094733, -0.8186458, 1.927316, 0, 0.4470588, 1, 1,
0.2127284, -1.046579, 2.403732, 0, 0.4431373, 1, 1,
0.2140966, -1.235016, 4.777156, 0, 0.4352941, 1, 1,
0.2186778, -1.35441, 3.850551, 0, 0.4313726, 1, 1,
0.2198334, 0.5341858, 0.2334625, 0, 0.4235294, 1, 1,
0.220134, 1.485359, 0.688103, 0, 0.4196078, 1, 1,
0.2245573, 0.06095035, 2.422952, 0, 0.4117647, 1, 1,
0.2279426, 0.516206, 1.297397, 0, 0.4078431, 1, 1,
0.2365668, 1.768806, 0.3360679, 0, 0.4, 1, 1,
0.2392065, 1.198135, -0.5624277, 0, 0.3921569, 1, 1,
0.2403379, -2.554561, 2.651787, 0, 0.3882353, 1, 1,
0.2425207, 0.7301624, -1.718711, 0, 0.3803922, 1, 1,
0.243688, -0.5176196, 0.5544919, 0, 0.3764706, 1, 1,
0.2444971, 0.1011038, 1.850531, 0, 0.3686275, 1, 1,
0.2447047, -0.02412328, 2.797881, 0, 0.3647059, 1, 1,
0.2472304, 0.2387517, 1.530673, 0, 0.3568628, 1, 1,
0.248455, 0.03568622, -0.1025395, 0, 0.3529412, 1, 1,
0.2507609, 0.6664948, -0.4029876, 0, 0.345098, 1, 1,
0.2507971, -0.5132263, 3.138561, 0, 0.3411765, 1, 1,
0.2543825, -0.198451, 2.58245, 0, 0.3333333, 1, 1,
0.2548628, 0.2402383, 2.838474, 0, 0.3294118, 1, 1,
0.2567643, 0.5339432, -0.1490397, 0, 0.3215686, 1, 1,
0.2625829, 0.5331344, -0.4871466, 0, 0.3176471, 1, 1,
0.2628227, -1.389715, 2.744486, 0, 0.3098039, 1, 1,
0.2645667, 0.2402816, 2.442749, 0, 0.3058824, 1, 1,
0.2662185, -0.07506442, 1.68894, 0, 0.2980392, 1, 1,
0.2665236, 0.9200438, 0.9288674, 0, 0.2901961, 1, 1,
0.2680119, -1.127143, 4.012231, 0, 0.2862745, 1, 1,
0.269952, -0.5515852, 3.517358, 0, 0.2784314, 1, 1,
0.2703151, -1.790706, 3.497076, 0, 0.2745098, 1, 1,
0.275072, -0.5317714, 3.290363, 0, 0.2666667, 1, 1,
0.275845, -0.01445835, 0.945255, 0, 0.2627451, 1, 1,
0.2798974, -0.01056352, 3.349375, 0, 0.254902, 1, 1,
0.2809502, -0.3916993, 1.479048, 0, 0.2509804, 1, 1,
0.281602, -0.07372058, 4.087699, 0, 0.2431373, 1, 1,
0.2864717, 1.685168, 0.0354201, 0, 0.2392157, 1, 1,
0.2899837, -2.225219, 1.264965, 0, 0.2313726, 1, 1,
0.2912957, 0.6930478, -0.1218702, 0, 0.227451, 1, 1,
0.2940108, 0.1762528, -0.3357794, 0, 0.2196078, 1, 1,
0.2949834, -0.4590848, 2.621774, 0, 0.2156863, 1, 1,
0.2959141, 1.588398, 0.5523201, 0, 0.2078431, 1, 1,
0.2966065, -0.7859771, 1.890925, 0, 0.2039216, 1, 1,
0.2969427, -1.348882, 1.32981, 0, 0.1960784, 1, 1,
0.3104723, -0.2625769, 2.643669, 0, 0.1882353, 1, 1,
0.3123208, 1.277859, 1.30178, 0, 0.1843137, 1, 1,
0.3131843, -0.6124123, 2.904671, 0, 0.1764706, 1, 1,
0.3135317, 0.9245654, 0.3556466, 0, 0.172549, 1, 1,
0.3151188, -0.801553, 4.129969, 0, 0.1647059, 1, 1,
0.3161166, 0.9005893, 0.5138102, 0, 0.1607843, 1, 1,
0.3178835, -1.006471, 4.379256, 0, 0.1529412, 1, 1,
0.3284653, 0.4220615, 0.8480257, 0, 0.1490196, 1, 1,
0.3310794, -0.04909619, 1.806375, 0, 0.1411765, 1, 1,
0.331119, -0.04230578, 1.706442, 0, 0.1372549, 1, 1,
0.3317191, -0.3656653, 0.07297093, 0, 0.1294118, 1, 1,
0.3390322, -0.1405599, 1.877459, 0, 0.1254902, 1, 1,
0.3514393, 0.3053863, 1.130863, 0, 0.1176471, 1, 1,
0.3516661, -1.873157, 3.601738, 0, 0.1137255, 1, 1,
0.3656544, 1.995901, 0.5625882, 0, 0.1058824, 1, 1,
0.3659465, -0.7314517, 4.055668, 0, 0.09803922, 1, 1,
0.3668607, 0.5876721, 0.736819, 0, 0.09411765, 1, 1,
0.3710703, -0.2971661, 3.270041, 0, 0.08627451, 1, 1,
0.3733223, 1.083215, 0.9014987, 0, 0.08235294, 1, 1,
0.3744823, -1.611845, 3.063869, 0, 0.07450981, 1, 1,
0.3893811, 1.95478, 0.7809715, 0, 0.07058824, 1, 1,
0.3902155, -0.04356033, 0.8696926, 0, 0.0627451, 1, 1,
0.3934563, 0.1825513, 1.98122, 0, 0.05882353, 1, 1,
0.3944458, 2.268377, 0.1461672, 0, 0.05098039, 1, 1,
0.3961211, -1.375022, 2.987992, 0, 0.04705882, 1, 1,
0.3999681, 0.3780862, -0.286468, 0, 0.03921569, 1, 1,
0.4017414, 0.4739882, -0.3582453, 0, 0.03529412, 1, 1,
0.4032823, -1.12372, 2.133472, 0, 0.02745098, 1, 1,
0.4040967, -0.5205792, 1.384269, 0, 0.02352941, 1, 1,
0.4050203, 1.335526, 0.0775173, 0, 0.01568628, 1, 1,
0.4051878, 2.576485, 1.131553, 0, 0.01176471, 1, 1,
0.4072448, -0.1016485, 1.659601, 0, 0.003921569, 1, 1,
0.4119168, -2.664017, 2.042292, 0.003921569, 0, 1, 1,
0.415451, -0.9067433, 2.847203, 0.007843138, 0, 1, 1,
0.416637, -0.3720434, 2.423862, 0.01568628, 0, 1, 1,
0.4171837, 1.245926, 0.1858201, 0.01960784, 0, 1, 1,
0.4172506, -1.042241, 4.868696, 0.02745098, 0, 1, 1,
0.422881, -0.2742572, 2.074616, 0.03137255, 0, 1, 1,
0.4353506, -0.03239344, 1.688343, 0.03921569, 0, 1, 1,
0.4364466, 0.3535609, -0.01249372, 0.04313726, 0, 1, 1,
0.4394734, 0.2088591, 0.1447449, 0.05098039, 0, 1, 1,
0.4398033, 0.5422044, 1.411758, 0.05490196, 0, 1, 1,
0.4494397, -2.343002, 2.624581, 0.0627451, 0, 1, 1,
0.4544543, -2.552183, 2.013598, 0.06666667, 0, 1, 1,
0.4545356, -0.471384, 3.982087, 0.07450981, 0, 1, 1,
0.4562562, 1.222214, 0.5402998, 0.07843138, 0, 1, 1,
0.4569657, 1.297771, 0.739997, 0.08627451, 0, 1, 1,
0.4575714, 1.147537, -1.361504, 0.09019608, 0, 1, 1,
0.4594085, 0.6617815, 0.7804328, 0.09803922, 0, 1, 1,
0.4641786, 1.440046, 1.279063, 0.1058824, 0, 1, 1,
0.4700974, 0.362242, -0.4850909, 0.1098039, 0, 1, 1,
0.4729115, 1.253511, 0.08786526, 0.1176471, 0, 1, 1,
0.4784862, 0.03510109, 1.478812, 0.1215686, 0, 1, 1,
0.481068, -0.7639087, 2.504122, 0.1294118, 0, 1, 1,
0.4877163, -2.224328, 3.486172, 0.1333333, 0, 1, 1,
0.4878885, 1.044269, -0.7373357, 0.1411765, 0, 1, 1,
0.4915469, 0.4659149, 1.385766, 0.145098, 0, 1, 1,
0.4953378, 0.03659512, 0.8342416, 0.1529412, 0, 1, 1,
0.5044034, -0.5674019, 2.135703, 0.1568628, 0, 1, 1,
0.5083156, -1.033823, 2.005706, 0.1647059, 0, 1, 1,
0.5131845, -1.405453, 4.303825, 0.1686275, 0, 1, 1,
0.5141217, 0.2384469, 1.828222, 0.1764706, 0, 1, 1,
0.5205459, -0.3430775, 2.443946, 0.1803922, 0, 1, 1,
0.5247123, -0.9671754, 2.80742, 0.1882353, 0, 1, 1,
0.5264065, 1.015866, 1.121587, 0.1921569, 0, 1, 1,
0.5304474, -0.6094977, 3.441968, 0.2, 0, 1, 1,
0.5311018, 0.261603, 0.109284, 0.2078431, 0, 1, 1,
0.5353758, 0.149953, -0.6432855, 0.2117647, 0, 1, 1,
0.5450758, -0.6322424, 2.315651, 0.2196078, 0, 1, 1,
0.5456625, 0.1985745, 2.226464, 0.2235294, 0, 1, 1,
0.5471216, 0.2543154, 0.003346824, 0.2313726, 0, 1, 1,
0.5479502, 0.06946228, 0.6249717, 0.2352941, 0, 1, 1,
0.549849, 1.56098, -1.058486, 0.2431373, 0, 1, 1,
0.5523314, 0.9897432, -0.03172017, 0.2470588, 0, 1, 1,
0.5576897, 0.03446967, 0.8103397, 0.254902, 0, 1, 1,
0.5589841, 0.06958336, -0.3683673, 0.2588235, 0, 1, 1,
0.5594758, -0.4464594, 3.344095, 0.2666667, 0, 1, 1,
0.5605575, -1.17775, 1.345827, 0.2705882, 0, 1, 1,
0.561955, -0.2426569, 0.9563638, 0.2784314, 0, 1, 1,
0.5630051, -0.1114797, 4.121875, 0.282353, 0, 1, 1,
0.5651095, -1.965105, 3.502101, 0.2901961, 0, 1, 1,
0.5664855, -1.269556, 3.566333, 0.2941177, 0, 1, 1,
0.5666343, 0.2268959, 2.425342, 0.3019608, 0, 1, 1,
0.5675694, 0.394405, -0.2931566, 0.3098039, 0, 1, 1,
0.5693165, 1.384759, 1.089772, 0.3137255, 0, 1, 1,
0.5816643, 0.9066841, 1.820361, 0.3215686, 0, 1, 1,
0.5820701, 0.152217, 0.02326008, 0.3254902, 0, 1, 1,
0.5843489, -0.8195249, 2.376619, 0.3333333, 0, 1, 1,
0.5886943, 1.911343, -0.8828663, 0.3372549, 0, 1, 1,
0.5902788, -0.1404727, 1.58252, 0.345098, 0, 1, 1,
0.5915462, 0.8188155, 0.3668159, 0.3490196, 0, 1, 1,
0.5952796, -0.8570519, 2.816746, 0.3568628, 0, 1, 1,
0.5969364, -0.8260936, 3.831022, 0.3607843, 0, 1, 1,
0.605926, 0.1987478, -0.8073542, 0.3686275, 0, 1, 1,
0.6092403, -1.326243, 1.130044, 0.372549, 0, 1, 1,
0.6117591, 0.2633569, 0.4845703, 0.3803922, 0, 1, 1,
0.621435, -1.226242, 1.835714, 0.3843137, 0, 1, 1,
0.6253433, 0.3362248, 0.9418699, 0.3921569, 0, 1, 1,
0.6272099, -0.8662449, 3.249824, 0.3960784, 0, 1, 1,
0.6272889, -0.1383539, 0.8426834, 0.4039216, 0, 1, 1,
0.6342476, 1.41376, -0.02152066, 0.4117647, 0, 1, 1,
0.6382297, 0.9931653, -0.2028677, 0.4156863, 0, 1, 1,
0.6432666, 0.4226706, 0.4654133, 0.4235294, 0, 1, 1,
0.6443841, -0.0594382, 1.126251, 0.427451, 0, 1, 1,
0.6461853, 1.268638, -0.3731489, 0.4352941, 0, 1, 1,
0.651557, 0.1446538, 1.316622, 0.4392157, 0, 1, 1,
0.654381, 0.6560453, -0.6168461, 0.4470588, 0, 1, 1,
0.6569409, -0.0030083, 2.464806, 0.4509804, 0, 1, 1,
0.657958, 1.680191, 1.435302, 0.4588235, 0, 1, 1,
0.6604968, 0.2502456, 1.723487, 0.4627451, 0, 1, 1,
0.6737531, 0.01198184, 4.079067, 0.4705882, 0, 1, 1,
0.6749746, -2.634598, 1.351096, 0.4745098, 0, 1, 1,
0.6762608, 1.5219, 1.952002, 0.4823529, 0, 1, 1,
0.6763236, -0.42431, 3.14243, 0.4862745, 0, 1, 1,
0.6783311, 0.3614106, 2.03598, 0.4941176, 0, 1, 1,
0.6793208, 0.2882148, 1.299225, 0.5019608, 0, 1, 1,
0.6824107, 0.239082, 0.8721403, 0.5058824, 0, 1, 1,
0.6852393, 0.5872238, 1.697722, 0.5137255, 0, 1, 1,
0.686545, -2.010893, 2.801044, 0.5176471, 0, 1, 1,
0.6897891, -1.119765, 2.056816, 0.5254902, 0, 1, 1,
0.6910907, 1.10281, 1.552434, 0.5294118, 0, 1, 1,
0.6935495, -0.1973527, 0.5992267, 0.5372549, 0, 1, 1,
0.699937, 1.248641, -0.09165075, 0.5411765, 0, 1, 1,
0.7003778, 0.2751305, 1.779987, 0.5490196, 0, 1, 1,
0.7005242, 0.2032992, 3.132466, 0.5529412, 0, 1, 1,
0.7016401, 1.273032, -0.877857, 0.5607843, 0, 1, 1,
0.7046754, -0.2752186, 2.024408, 0.5647059, 0, 1, 1,
0.7058805, 2.132859, 1.278016, 0.572549, 0, 1, 1,
0.7074677, -2.038665, 2.291877, 0.5764706, 0, 1, 1,
0.7076542, 1.471233, 0.585907, 0.5843138, 0, 1, 1,
0.7110398, -0.4960824, 2.093078, 0.5882353, 0, 1, 1,
0.7166723, 0.2661417, 1.745062, 0.5960785, 0, 1, 1,
0.7199177, -0.9035335, 1.940028, 0.6039216, 0, 1, 1,
0.7226712, -0.5820299, 1.368638, 0.6078432, 0, 1, 1,
0.7227746, -0.5533291, -0.005339548, 0.6156863, 0, 1, 1,
0.7233899, 0.1445348, 1.600039, 0.6196079, 0, 1, 1,
0.7307003, 0.5947511, 1.549406, 0.627451, 0, 1, 1,
0.7330637, 0.1640632, 2.496598, 0.6313726, 0, 1, 1,
0.736385, 1.051585, -0.8982476, 0.6392157, 0, 1, 1,
0.7406589, 0.1418456, 0.3789509, 0.6431373, 0, 1, 1,
0.7448326, -0.3290753, 1.134056, 0.6509804, 0, 1, 1,
0.7456768, 0.6051921, 0.6822457, 0.654902, 0, 1, 1,
0.7468442, -2.135184, 2.554422, 0.6627451, 0, 1, 1,
0.7483129, 0.5245103, 0.9722367, 0.6666667, 0, 1, 1,
0.7517741, 0.5700856, -0.4946283, 0.6745098, 0, 1, 1,
0.7553456, -1.579774, 2.732586, 0.6784314, 0, 1, 1,
0.7571723, -0.1848217, 2.4028, 0.6862745, 0, 1, 1,
0.7670547, -1.454094, 2.088052, 0.6901961, 0, 1, 1,
0.7696403, 0.5183461, 2.016641, 0.6980392, 0, 1, 1,
0.7867225, -0.9193795, 3.215835, 0.7058824, 0, 1, 1,
0.7885066, 0.7076757, 2.407445, 0.7098039, 0, 1, 1,
0.7947736, -0.8278847, 1.251095, 0.7176471, 0, 1, 1,
0.8024032, 0.6324518, 2.723324, 0.7215686, 0, 1, 1,
0.8052579, -0.05299027, 0.3943457, 0.7294118, 0, 1, 1,
0.8133326, -1.792551, 2.657096, 0.7333333, 0, 1, 1,
0.8145138, 0.08500762, 1.484723, 0.7411765, 0, 1, 1,
0.8154603, 1.691752, 0.9830438, 0.7450981, 0, 1, 1,
0.8222318, 0.1625991, 1.057361, 0.7529412, 0, 1, 1,
0.8333062, 0.5455355, -0.6435016, 0.7568628, 0, 1, 1,
0.8366555, -0.4121138, 2.763604, 0.7647059, 0, 1, 1,
0.8375971, -0.8210773, 1.096487, 0.7686275, 0, 1, 1,
0.8458192, 0.6468031, 2.038316, 0.7764706, 0, 1, 1,
0.8566697, -0.8652554, 2.178179, 0.7803922, 0, 1, 1,
0.8576717, -1.127665, 4.859247, 0.7882353, 0, 1, 1,
0.8581022, 0.1052246, 0.8405271, 0.7921569, 0, 1, 1,
0.8585594, 2.373443, 0.8819172, 0.8, 0, 1, 1,
0.8591022, -0.3919041, 1.814109, 0.8078431, 0, 1, 1,
0.8602657, -0.4608465, 1.831204, 0.8117647, 0, 1, 1,
0.8607659, 3.810688, 0.6623867, 0.8196079, 0, 1, 1,
0.8612763, 0.2368677, 1.949964, 0.8235294, 0, 1, 1,
0.8641031, -0.5863701, 1.385063, 0.8313726, 0, 1, 1,
0.8744069, -2.252096, 3.729513, 0.8352941, 0, 1, 1,
0.8780021, 1.653571, 0.9804152, 0.8431373, 0, 1, 1,
0.8819903, -0.494534, 1.020376, 0.8470588, 0, 1, 1,
0.8822758, -0.9244861, 5.011168, 0.854902, 0, 1, 1,
0.8825744, -0.8478517, 1.268015, 0.8588235, 0, 1, 1,
0.890391, -3.564847e-05, 0.03588971, 0.8666667, 0, 1, 1,
0.8912484, -0.1372968, 2.088993, 0.8705882, 0, 1, 1,
0.8945997, -1.180882, 2.335033, 0.8784314, 0, 1, 1,
0.8973005, -0.6953621, 2.179884, 0.8823529, 0, 1, 1,
0.9007517, -0.8186892, 3.512341, 0.8901961, 0, 1, 1,
0.9025345, -0.8109733, 3.141716, 0.8941177, 0, 1, 1,
0.9033616, 1.263693, 1.118009, 0.9019608, 0, 1, 1,
0.9036565, -0.5041524, 2.036608, 0.9098039, 0, 1, 1,
0.9059551, -1.210876, 1.566262, 0.9137255, 0, 1, 1,
0.9128011, -0.9616655, 2.688272, 0.9215686, 0, 1, 1,
0.9183882, -0.2707417, 3.603038, 0.9254902, 0, 1, 1,
0.9202659, -0.2053742, 1.75011, 0.9333333, 0, 1, 1,
0.9208699, -0.3007811, 1.199517, 0.9372549, 0, 1, 1,
0.9227146, -0.6322719, 0.3556891, 0.945098, 0, 1, 1,
0.9265629, -0.9566257, 1.282472, 0.9490196, 0, 1, 1,
0.9298522, -0.3245274, 1.69073, 0.9568627, 0, 1, 1,
0.9385003, -1.319444, 3.108694, 0.9607843, 0, 1, 1,
0.9406711, -1.431938, 3.04562, 0.9686275, 0, 1, 1,
0.9559975, -0.5505723, 0.5728188, 0.972549, 0, 1, 1,
0.9597561, 1.612244, -0.1270741, 0.9803922, 0, 1, 1,
0.9616693, 0.1101868, 0.9930618, 0.9843137, 0, 1, 1,
0.9697402, 0.8443822, 1.760091, 0.9921569, 0, 1, 1,
0.9785088, -1.603352, 3.712774, 0.9960784, 0, 1, 1,
0.9844829, 0.3445583, 2.337877, 1, 0, 0.9960784, 1,
0.9892585, 0.9449987, 1.062975, 1, 0, 0.9882353, 1,
0.9978735, 0.749172, 0.1672464, 1, 0, 0.9843137, 1,
0.999817, -1.528407, 4.223106, 1, 0, 0.9764706, 1,
1.005262, -0.9786816, 2.480827, 1, 0, 0.972549, 1,
1.005711, -1.057391, 2.465816, 1, 0, 0.9647059, 1,
1.014847, -0.9706063, 2.627209, 1, 0, 0.9607843, 1,
1.017245, -0.2888984, 1.61669, 1, 0, 0.9529412, 1,
1.018056, -0.4518104, 0.9331461, 1, 0, 0.9490196, 1,
1.018955, -0.3255509, 4.115635, 1, 0, 0.9411765, 1,
1.022001, 0.02442994, 2.807807, 1, 0, 0.9372549, 1,
1.024887, -0.3901586, 2.506448, 1, 0, 0.9294118, 1,
1.027878, 0.2111171, 0.9459875, 1, 0, 0.9254902, 1,
1.0345, -1.213368, 2.554566, 1, 0, 0.9176471, 1,
1.038236, 0.5442287, 0.07821859, 1, 0, 0.9137255, 1,
1.046108, -1.136042, 2.865962, 1, 0, 0.9058824, 1,
1.048339, 0.55845, 0.2000371, 1, 0, 0.9019608, 1,
1.050034, -0.2645106, 2.016124, 1, 0, 0.8941177, 1,
1.052408, -0.829425, 3.975898, 1, 0, 0.8862745, 1,
1.053349, 1.261888, 2.361732, 1, 0, 0.8823529, 1,
1.053974, 0.08026928, 1.076968, 1, 0, 0.8745098, 1,
1.055048, 0.1755279, 1.797297, 1, 0, 0.8705882, 1,
1.068914, 0.9961525, 0.8486091, 1, 0, 0.8627451, 1,
1.069955, 0.02873775, 2.126529, 1, 0, 0.8588235, 1,
1.079845, -0.2816429, 3.79832, 1, 0, 0.8509804, 1,
1.090137, 0.3492781, -0.34284, 1, 0, 0.8470588, 1,
1.100656, 2.012444, 1.165469, 1, 0, 0.8392157, 1,
1.101399, 0.9581663, -0.2732802, 1, 0, 0.8352941, 1,
1.103023, -0.3489509, 2.419471, 1, 0, 0.827451, 1,
1.108595, -1.884737, 2.82558, 1, 0, 0.8235294, 1,
1.116647, 0.2003459, 1.807897, 1, 0, 0.8156863, 1,
1.119552, 0.08315144, 1.679884, 1, 0, 0.8117647, 1,
1.134111, -1.469862, 2.320014, 1, 0, 0.8039216, 1,
1.14281, -0.3764648, 2.870439, 1, 0, 0.7960784, 1,
1.149075, -0.6570743, 1.777254, 1, 0, 0.7921569, 1,
1.155812, 0.1041584, 1.58553, 1, 0, 0.7843137, 1,
1.160028, -0.4647652, 2.181468, 1, 0, 0.7803922, 1,
1.162722, -2.1646, 2.020021, 1, 0, 0.772549, 1,
1.164159, 0.5493115, 1.448313, 1, 0, 0.7686275, 1,
1.166299, -0.9974917, 2.208777, 1, 0, 0.7607843, 1,
1.169858, -0.8555148, 3.467169, 1, 0, 0.7568628, 1,
1.17048, -0.1137921, 3.066723, 1, 0, 0.7490196, 1,
1.17223, 0.2342146, 0.7679745, 1, 0, 0.7450981, 1,
1.175621, 0.8038819, -0.6057228, 1, 0, 0.7372549, 1,
1.176296, -2.216764, 4.106936, 1, 0, 0.7333333, 1,
1.179479, 0.01279966, 1.944218, 1, 0, 0.7254902, 1,
1.183241, 0.04679673, 3.328181, 1, 0, 0.7215686, 1,
1.183616, 1.147395, 2.387281, 1, 0, 0.7137255, 1,
1.187637, 0.616945, 1.766879, 1, 0, 0.7098039, 1,
1.187743, -0.7208986, 2.193815, 1, 0, 0.7019608, 1,
1.192614, 1.950637, -0.2527834, 1, 0, 0.6941177, 1,
1.195421, -0.4023537, 1.806125, 1, 0, 0.6901961, 1,
1.201904, 2.289997, 0.126117, 1, 0, 0.682353, 1,
1.213014, 0.6039559, 0.7617506, 1, 0, 0.6784314, 1,
1.218416, 0.6403174, 0.9657659, 1, 0, 0.6705883, 1,
1.227067, 0.435541, 2.604974, 1, 0, 0.6666667, 1,
1.227619, 1.377549, 0.1054886, 1, 0, 0.6588235, 1,
1.230005, -1.113856, 3.445224, 1, 0, 0.654902, 1,
1.238559, -0.05045817, -0.6329448, 1, 0, 0.6470588, 1,
1.241013, -0.5567269, 4.77346, 1, 0, 0.6431373, 1,
1.245953, 0.4631433, 0.5591959, 1, 0, 0.6352941, 1,
1.251592, 0.7138277, 0.8663085, 1, 0, 0.6313726, 1,
1.25642, 0.3974218, 1.086809, 1, 0, 0.6235294, 1,
1.260951, -0.2497574, 1.766013, 1, 0, 0.6196079, 1,
1.261353, -0.5014797, 2.723865, 1, 0, 0.6117647, 1,
1.26302, 1.067441, 0.1711117, 1, 0, 0.6078432, 1,
1.263759, -0.4812213, 1.926568, 1, 0, 0.6, 1,
1.27136, -1.76205, 2.806964, 1, 0, 0.5921569, 1,
1.271497, 0.7795057, -0.5555438, 1, 0, 0.5882353, 1,
1.285617, -1.310792, 2.222582, 1, 0, 0.5803922, 1,
1.292948, 0.29192, 0.3982288, 1, 0, 0.5764706, 1,
1.298317, 0.7206317, 1.957977, 1, 0, 0.5686275, 1,
1.299585, 0.721772, 1.309801, 1, 0, 0.5647059, 1,
1.32341, -0.06950118, 0.9172278, 1, 0, 0.5568628, 1,
1.337132, -0.1172664, 1.653035, 1, 0, 0.5529412, 1,
1.337431, -0.8592744, 2.575838, 1, 0, 0.5450981, 1,
1.343301, -0.5370137, 3.863784, 1, 0, 0.5411765, 1,
1.345712, -1.391484, 2.257665, 1, 0, 0.5333334, 1,
1.345812, 1.074101, 0.049077, 1, 0, 0.5294118, 1,
1.349129, -1.942841, 2.969364, 1, 0, 0.5215687, 1,
1.35167, -0.6554844, 1.610992, 1, 0, 0.5176471, 1,
1.358964, -0.6028994, 1.188906, 1, 0, 0.509804, 1,
1.364515, 0.5802924, 0.9176397, 1, 0, 0.5058824, 1,
1.378983, -0.7910272, 1.764852, 1, 0, 0.4980392, 1,
1.396924, 0.7219507, 2.27612, 1, 0, 0.4901961, 1,
1.408282, 0.002366581, 1.842973, 1, 0, 0.4862745, 1,
1.419901, -0.5093826, 2.309175, 1, 0, 0.4784314, 1,
1.437044, 0.3025357, 1.753057, 1, 0, 0.4745098, 1,
1.43899, -0.5363601, 3.420227, 1, 0, 0.4666667, 1,
1.448557, 1.460729, 1.38261, 1, 0, 0.4627451, 1,
1.450542, -1.195104, 1.859257, 1, 0, 0.454902, 1,
1.450885, -0.4087059, 2.679933, 1, 0, 0.4509804, 1,
1.453953, 0.178893, 1.35754, 1, 0, 0.4431373, 1,
1.455213, 1.961784, 0.7742577, 1, 0, 0.4392157, 1,
1.47009, -0.3206521, 3.501188, 1, 0, 0.4313726, 1,
1.473682, -0.3661966, 2.049619, 1, 0, 0.427451, 1,
1.495275, 1.64924, 0.05510715, 1, 0, 0.4196078, 1,
1.496677, -0.06455916, 0.3126081, 1, 0, 0.4156863, 1,
1.507753, -0.5864879, 2.139271, 1, 0, 0.4078431, 1,
1.51628, -0.08039534, 0.5779496, 1, 0, 0.4039216, 1,
1.51838, 0.7390984, 1.296256, 1, 0, 0.3960784, 1,
1.51982, -1.166369, 0.9562261, 1, 0, 0.3882353, 1,
1.530802, 0.5714255, 1.937779, 1, 0, 0.3843137, 1,
1.533447, -1.365289, 4.260293, 1, 0, 0.3764706, 1,
1.543242, 1.76441, 0.4144128, 1, 0, 0.372549, 1,
1.54657, -0.3110272, 0.2378496, 1, 0, 0.3647059, 1,
1.56718, 0.5626851, 1.267731, 1, 0, 0.3607843, 1,
1.569779, 0.6319274, 1.501343, 1, 0, 0.3529412, 1,
1.576115, -0.9402269, 1.818567, 1, 0, 0.3490196, 1,
1.585592, 1.126157, 0.7043186, 1, 0, 0.3411765, 1,
1.587935, 0.1533655, 1.868586, 1, 0, 0.3372549, 1,
1.603034, -2.144747, 3.22393, 1, 0, 0.3294118, 1,
1.617637, 0.7675018, -0.7559546, 1, 0, 0.3254902, 1,
1.626339, -0.240123, 3.733196, 1, 0, 0.3176471, 1,
1.629354, -0.04597308, 2.840714, 1, 0, 0.3137255, 1,
1.641527, -0.3757434, 2.613511, 1, 0, 0.3058824, 1,
1.64832, -1.303762, 0.3861764, 1, 0, 0.2980392, 1,
1.648523, 0.4003009, 0.1636855, 1, 0, 0.2941177, 1,
1.674171, -0.7603562, 1.738809, 1, 0, 0.2862745, 1,
1.686497, -0.5895196, 1.570748, 1, 0, 0.282353, 1,
1.688452, 1.534272, 1.737096, 1, 0, 0.2745098, 1,
1.693143, 0.7203098, 1.048502, 1, 0, 0.2705882, 1,
1.696733, 0.7308978, 2.27069, 1, 0, 0.2627451, 1,
1.712336, -0.9888064, 1.697382, 1, 0, 0.2588235, 1,
1.721688, -2.218843, 3.670321, 1, 0, 0.2509804, 1,
1.734047, 0.5434079, 1.072453, 1, 0, 0.2470588, 1,
1.749687, -0.5861884, 2.886357, 1, 0, 0.2392157, 1,
1.756687, -0.3051969, 2.436171, 1, 0, 0.2352941, 1,
1.756719, -0.07878485, 3.506285, 1, 0, 0.227451, 1,
1.764489, -0.4703509, 2.089137, 1, 0, 0.2235294, 1,
1.766041, -0.1431466, 2.39222, 1, 0, 0.2156863, 1,
1.782537, -0.5085773, 1.837234, 1, 0, 0.2117647, 1,
1.786117, -1.013836, 2.973621, 1, 0, 0.2039216, 1,
1.790353, -0.359622, 0.9857945, 1, 0, 0.1960784, 1,
1.791161, 0.3850346, 0.5161604, 1, 0, 0.1921569, 1,
1.798855, -1.752122, 3.699799, 1, 0, 0.1843137, 1,
1.80148, 1.369146, 0.9126762, 1, 0, 0.1803922, 1,
1.806784, -1.077522, 0.9717445, 1, 0, 0.172549, 1,
1.817091, -0.04070842, 2.435103, 1, 0, 0.1686275, 1,
1.848945, -0.3684471, 2.327528, 1, 0, 0.1607843, 1,
1.865804, 2.481659, 1.838693, 1, 0, 0.1568628, 1,
1.898745, 0.216248, 2.266789, 1, 0, 0.1490196, 1,
1.906104, 0.5040108, 1.098025, 1, 0, 0.145098, 1,
1.922429, 0.8073795, -0.2013322, 1, 0, 0.1372549, 1,
1.933058, -0.2884644, 0.4241185, 1, 0, 0.1333333, 1,
1.940489, -0.09458162, -0.190288, 1, 0, 0.1254902, 1,
1.940947, 1.778534, 0.4454757, 1, 0, 0.1215686, 1,
1.945604, 0.7190381, 0.1510243, 1, 0, 0.1137255, 1,
1.94636, 0.2148925, 3.437693, 1, 0, 0.1098039, 1,
1.983406, -0.3405107, 2.051202, 1, 0, 0.1019608, 1,
1.987816, -0.9792497, 2.482206, 1, 0, 0.09411765, 1,
1.994833, -1.875321, 2.613428, 1, 0, 0.09019608, 1,
2.051989, 0.7666245, 0.6694908, 1, 0, 0.08235294, 1,
2.052147, 0.4754553, 1.01981, 1, 0, 0.07843138, 1,
2.081195, 0.1339978, 1.888129, 1, 0, 0.07058824, 1,
2.082286, -1.038444, 1.078918, 1, 0, 0.06666667, 1,
2.088985, -0.2962991, 1.743536, 1, 0, 0.05882353, 1,
2.103301, 0.5874984, 1.225702, 1, 0, 0.05490196, 1,
2.14504, -0.03697768, 1.929965, 1, 0, 0.04705882, 1,
2.229774, -0.6013578, -1.190954, 1, 0, 0.04313726, 1,
2.289155, -0.1465052, 2.186943, 1, 0, 0.03529412, 1,
2.296041, -0.1515908, 1.261938, 1, 0, 0.03137255, 1,
2.394631, 0.09457295, 1.541858, 1, 0, 0.02352941, 1,
2.803386, 0.2417366, 2.015417, 1, 0, 0.01960784, 1,
2.806079, 0.2112443, 2.205727, 1, 0, 0.01176471, 1,
3.213344, 2.501513, 0.5650235, 1, 0, 0.007843138, 1
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
0.2494276, -4.370235, -7.5272, 0, -0.5, 0.5, 0.5,
0.2494276, -4.370235, -7.5272, 1, -0.5, 0.5, 0.5,
0.2494276, -4.370235, -7.5272, 1, 1.5, 0.5, 0.5,
0.2494276, -4.370235, -7.5272, 0, 1.5, 0.5, 0.5
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
-3.719257, 0.3130726, -7.5272, 0, -0.5, 0.5, 0.5,
-3.719257, 0.3130726, -7.5272, 1, -0.5, 0.5, 0.5,
-3.719257, 0.3130726, -7.5272, 1, 1.5, 0.5, 0.5,
-3.719257, 0.3130726, -7.5272, 0, 1.5, 0.5, 0.5
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
-3.719257, -4.370235, 0.1182127, 0, -0.5, 0.5, 0.5,
-3.719257, -4.370235, 0.1182127, 1, -0.5, 0.5, 0.5,
-3.719257, -4.370235, 0.1182127, 1, 1.5, 0.5, 0.5,
-3.719257, -4.370235, 0.1182127, 0, 1.5, 0.5, 0.5
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
-2, -3.289472, -5.762874,
3, -3.289472, -5.762874,
-2, -3.289472, -5.762874,
-2, -3.469599, -6.056929,
-1, -3.289472, -5.762874,
-1, -3.469599, -6.056929,
0, -3.289472, -5.762874,
0, -3.469599, -6.056929,
1, -3.289472, -5.762874,
1, -3.469599, -6.056929,
2, -3.289472, -5.762874,
2, -3.469599, -6.056929,
3, -3.289472, -5.762874,
3, -3.469599, -6.056929
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
-2, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
-2, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
-2, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
-2, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5,
-1, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
-1, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
-1, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
-1, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5,
0, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
0, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
0, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
0, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5,
1, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
1, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
1, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
1, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5,
2, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
2, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
2, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
2, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5,
3, -3.829853, -6.645037, 0, -0.5, 0.5, 0.5,
3, -3.829853, -6.645037, 1, -0.5, 0.5, 0.5,
3, -3.829853, -6.645037, 1, 1.5, 0.5, 0.5,
3, -3.829853, -6.645037, 0, 1.5, 0.5, 0.5
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
-2.803407, -3, -5.762874,
-2.803407, 3, -5.762874,
-2.803407, -3, -5.762874,
-2.956048, -3, -6.056929,
-2.803407, -2, -5.762874,
-2.956048, -2, -6.056929,
-2.803407, -1, -5.762874,
-2.956048, -1, -6.056929,
-2.803407, 0, -5.762874,
-2.956048, 0, -6.056929,
-2.803407, 1, -5.762874,
-2.956048, 1, -6.056929,
-2.803407, 2, -5.762874,
-2.956048, 2, -6.056929,
-2.803407, 3, -5.762874,
-2.956048, 3, -6.056929
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
-3.261332, -3, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, -3, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, -3, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, -3, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, -2, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, -2, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, -2, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, -2, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, -1, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, -1, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, -1, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, -1, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, 0, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, 0, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, 0, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, 0, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, 1, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, 1, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, 1, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, 1, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, 2, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, 2, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, 2, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, 2, -6.645037, 0, 1.5, 0.5, 0.5,
-3.261332, 3, -6.645037, 0, -0.5, 0.5, 0.5,
-3.261332, 3, -6.645037, 1, -0.5, 0.5, 0.5,
-3.261332, 3, -6.645037, 1, 1.5, 0.5, 0.5,
-3.261332, 3, -6.645037, 0, 1.5, 0.5, 0.5
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
-2.803407, -3.289472, -4,
-2.803407, -3.289472, 4,
-2.803407, -3.289472, -4,
-2.956048, -3.469599, -4,
-2.803407, -3.289472, -2,
-2.956048, -3.469599, -2,
-2.803407, -3.289472, 0,
-2.956048, -3.469599, 0,
-2.803407, -3.289472, 2,
-2.956048, -3.469599, 2,
-2.803407, -3.289472, 4,
-2.956048, -3.469599, 4
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
-3.261332, -3.829853, -4, 0, -0.5, 0.5, 0.5,
-3.261332, -3.829853, -4, 1, -0.5, 0.5, 0.5,
-3.261332, -3.829853, -4, 1, 1.5, 0.5, 0.5,
-3.261332, -3.829853, -4, 0, 1.5, 0.5, 0.5,
-3.261332, -3.829853, -2, 0, -0.5, 0.5, 0.5,
-3.261332, -3.829853, -2, 1, -0.5, 0.5, 0.5,
-3.261332, -3.829853, -2, 1, 1.5, 0.5, 0.5,
-3.261332, -3.829853, -2, 0, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 0, 0, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 0, 1, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 0, 1, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 0, 0, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 2, 0, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 2, 1, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 2, 1, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 2, 0, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 4, 0, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 4, 1, -0.5, 0.5, 0.5,
-3.261332, -3.829853, 4, 1, 1.5, 0.5, 0.5,
-3.261332, -3.829853, 4, 0, 1.5, 0.5, 0.5
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
-2.803407, -3.289472, -5.762874,
-2.803407, 3.915617, -5.762874,
-2.803407, -3.289472, 5.9993,
-2.803407, 3.915617, 5.9993,
-2.803407, -3.289472, -5.762874,
-2.803407, -3.289472, 5.9993,
-2.803407, 3.915617, -5.762874,
-2.803407, 3.915617, 5.9993,
-2.803407, -3.289472, -5.762874,
3.302262, -3.289472, -5.762874,
-2.803407, -3.289472, 5.9993,
3.302262, -3.289472, 5.9993,
-2.803407, 3.915617, -5.762874,
3.302262, 3.915617, -5.762874,
-2.803407, 3.915617, 5.9993,
3.302262, 3.915617, 5.9993,
3.302262, -3.289472, -5.762874,
3.302262, 3.915617, -5.762874,
3.302262, -3.289472, 5.9993,
3.302262, 3.915617, 5.9993,
3.302262, -3.289472, -5.762874,
3.302262, -3.289472, 5.9993,
3.302262, 3.915617, -5.762874,
3.302262, 3.915617, 5.9993
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
var radius = 8.054814;
var distance = 35.83678;
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
mvMatrix.translate( -0.2494276, -0.3130726, -0.1182127 );
mvMatrix.scale( 1.426383, 1.208732, 0.7404263 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83678);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
2-Hydrazinopyrimidin<-read.table("2-Hydrazinopyrimidin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-Hydrazinopyrimidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hydrazinopyrimidin' not found
```

```r
y<-2-Hydrazinopyrimidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hydrazinopyrimidin' not found
```

```r
z<-2-Hydrazinopyrimidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hydrazinopyrimidin' not found
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
-2.714489, -1.238788, -0.8836607, 0, 0, 1, 1, 1,
-2.600297, 0.7058386, -0.772871, 1, 0, 0, 1, 1,
-2.500523, -0.04069176, -1.761658, 1, 0, 0, 1, 1,
-2.410408, -1.223692, -2.069828, 1, 0, 0, 1, 1,
-2.334561, -1.053653, -2.868556, 1, 0, 0, 1, 1,
-2.289104, 0.6606319, -2.756751, 1, 0, 0, 1, 1,
-2.274107, -0.79143, -1.691066, 0, 0, 0, 1, 1,
-2.246166, -0.4749885, -0.6228936, 0, 0, 0, 1, 1,
-2.226495, -2.319655, -1.767656, 0, 0, 0, 1, 1,
-2.213418, 0.6646242, -1.764853, 0, 0, 0, 1, 1,
-2.169554, -0.6464674, -1.504243, 0, 0, 0, 1, 1,
-2.135382, 1.149179, -2.188237, 0, 0, 0, 1, 1,
-2.131818, 1.139881, -0.1946836, 0, 0, 0, 1, 1,
-2.113916, -0.8004125, -0.9808592, 1, 1, 1, 1, 1,
-2.079003, -0.145973, -1.76493, 1, 1, 1, 1, 1,
-2.059533, -1.882538, -1.990451, 1, 1, 1, 1, 1,
-2.024477, -1.622707, -3.362218, 1, 1, 1, 1, 1,
-2.023334, 0.1433557, -1.605914, 1, 1, 1, 1, 1,
-1.956308, -0.4906548, -1.321499, 1, 1, 1, 1, 1,
-1.929038, -0.9019877, -2.029799, 1, 1, 1, 1, 1,
-1.913543, -0.7979671, -1.674555, 1, 1, 1, 1, 1,
-1.873008, 1.241303, -1.273664, 1, 1, 1, 1, 1,
-1.833755, -0.8134704, -2.161544, 1, 1, 1, 1, 1,
-1.778408, 1.442685, 0.5878044, 1, 1, 1, 1, 1,
-1.770911, 0.2664464, -1.962033, 1, 1, 1, 1, 1,
-1.765145, -0.9106581, -1.424027, 1, 1, 1, 1, 1,
-1.761935, 0.9923825, -1.950667, 1, 1, 1, 1, 1,
-1.754901, 0.5352169, -2.542292, 1, 1, 1, 1, 1,
-1.753891, -1.028957, -1.987895, 0, 0, 1, 1, 1,
-1.717039, -1.507713, -2.900338, 1, 0, 0, 1, 1,
-1.716482, -0.3605205, -3.129252, 1, 0, 0, 1, 1,
-1.711997, -0.1160809, -1.622398, 1, 0, 0, 1, 1,
-1.704421, 1.677951, -0.8500174, 1, 0, 0, 1, 1,
-1.699669, 0.4714731, -1.221537, 1, 0, 0, 1, 1,
-1.695188, -0.2877128, -2.848072, 0, 0, 0, 1, 1,
-1.680549, 0.6923914, -1.44694, 0, 0, 0, 1, 1,
-1.672798, 0.1656048, -2.133573, 0, 0, 0, 1, 1,
-1.652087, 0.2466108, -1.685136, 0, 0, 0, 1, 1,
-1.649272, 1.220625, -1.069311, 0, 0, 0, 1, 1,
-1.635041, 1.081359, -1.480049, 0, 0, 0, 1, 1,
-1.620499, -1.097276, -1.101577, 0, 0, 0, 1, 1,
-1.620276, -0.7336468, -1.846559, 1, 1, 1, 1, 1,
-1.618174, -0.628472, -1.892054, 1, 1, 1, 1, 1,
-1.599265, 0.09573715, -1.454275, 1, 1, 1, 1, 1,
-1.592159, -0.2638518, -1.882855, 1, 1, 1, 1, 1,
-1.584172, 0.1579885, -2.120272, 1, 1, 1, 1, 1,
-1.580381, 0.0790968, -0.07060204, 1, 1, 1, 1, 1,
-1.565176, 0.1638905, -0.6475407, 1, 1, 1, 1, 1,
-1.557218, 1.664576, -0.6421767, 1, 1, 1, 1, 1,
-1.539583, 0.02503237, -1.586611, 1, 1, 1, 1, 1,
-1.530174, 0.2494157, -1.287805, 1, 1, 1, 1, 1,
-1.526601, 0.1149178, -1.97331, 1, 1, 1, 1, 1,
-1.518533, 0.734926, -1.50868, 1, 1, 1, 1, 1,
-1.512951, 1.642676, 0.4590462, 1, 1, 1, 1, 1,
-1.508, 0.1472233, -2.255371, 1, 1, 1, 1, 1,
-1.49848, 1.403796, -0.006615791, 1, 1, 1, 1, 1,
-1.493766, -0.281165, -2.055456, 0, 0, 1, 1, 1,
-1.4831, 0.7691594, 0.1765804, 1, 0, 0, 1, 1,
-1.473847, -0.9602381, -1.840446, 1, 0, 0, 1, 1,
-1.455008, -0.06821373, -1.055084, 1, 0, 0, 1, 1,
-1.452851, -1.096893, -1.209961, 1, 0, 0, 1, 1,
-1.426855, 1.393619, -1.016065, 1, 0, 0, 1, 1,
-1.41982, 0.4026206, -0.9008595, 0, 0, 0, 1, 1,
-1.417253, -2.208391, -3.395457, 0, 0, 0, 1, 1,
-1.402137, -0.1981326, -1.62451, 0, 0, 0, 1, 1,
-1.393045, -0.2203044, -0.1885257, 0, 0, 0, 1, 1,
-1.390026, 2.123445, 0.1170596, 0, 0, 0, 1, 1,
-1.386518, 0.7948648, -0.1367054, 0, 0, 0, 1, 1,
-1.372277, 1.038571, 0.638725, 0, 0, 0, 1, 1,
-1.359701, -1.240885, -2.906407, 1, 1, 1, 1, 1,
-1.340286, -1.130262, -0.4028345, 1, 1, 1, 1, 1,
-1.336355, -0.8930512, -1.733296, 1, 1, 1, 1, 1,
-1.312309, -0.3028754, -3.412349, 1, 1, 1, 1, 1,
-1.312254, -1.254707, -3.567299, 1, 1, 1, 1, 1,
-1.295939, -0.08967577, -1.0629, 1, 1, 1, 1, 1,
-1.283537, 0.5806971, -2.165679, 1, 1, 1, 1, 1,
-1.279405, -0.515857, -3.254887, 1, 1, 1, 1, 1,
-1.266235, 1.068933, -1.463748, 1, 1, 1, 1, 1,
-1.26349, 0.7868095, 1.819864, 1, 1, 1, 1, 1,
-1.260358, -0.5469454, 0.4806699, 1, 1, 1, 1, 1,
-1.253363, -2.508987, -2.657776, 1, 1, 1, 1, 1,
-1.249026, 1.322527, -1.832154, 1, 1, 1, 1, 1,
-1.243193, -1.417162, -2.46229, 1, 1, 1, 1, 1,
-1.238339, -0.8852654, -3.687123, 1, 1, 1, 1, 1,
-1.236961, -0.1990599, -1.577141, 0, 0, 1, 1, 1,
-1.234501, -2.554428, -0.07223412, 1, 0, 0, 1, 1,
-1.22444, -0.4990989, -1.567417, 1, 0, 0, 1, 1,
-1.221028, 0.247201, -1.856992, 1, 0, 0, 1, 1,
-1.220604, -0.7885112, -2.002548, 1, 0, 0, 1, 1,
-1.217686, -0.2729552, -2.180663, 1, 0, 0, 1, 1,
-1.216544, 0.5031249, 1.439394, 0, 0, 0, 1, 1,
-1.215025, 0.2268482, -1.229044, 0, 0, 0, 1, 1,
-1.21472, 0.09510282, 0.3728289, 0, 0, 0, 1, 1,
-1.205182, 1.336116, 0.3128534, 0, 0, 0, 1, 1,
-1.200527, 1.701361, 0.9172121, 0, 0, 0, 1, 1,
-1.194595, 1.688946, 0.0722068, 0, 0, 0, 1, 1,
-1.184341, 0.8006178, 0.05018887, 0, 0, 0, 1, 1,
-1.182051, -0.8246629, -2.659189, 1, 1, 1, 1, 1,
-1.179285, 1.084324, -0.7038555, 1, 1, 1, 1, 1,
-1.17827, 0.4203927, -1.244874, 1, 1, 1, 1, 1,
-1.170389, 0.398481, -1.529554, 1, 1, 1, 1, 1,
-1.168633, -0.8707496, -1.945383, 1, 1, 1, 1, 1,
-1.165418, -1.537375, -1.90626, 1, 1, 1, 1, 1,
-1.160784, -0.9630415, -2.588904, 1, 1, 1, 1, 1,
-1.159902, 1.36705, -0.4878764, 1, 1, 1, 1, 1,
-1.156482, 2.166219, -1.071367, 1, 1, 1, 1, 1,
-1.153923, -1.258318, -1.095399, 1, 1, 1, 1, 1,
-1.14904, -0.230559, -0.8598137, 1, 1, 1, 1, 1,
-1.145312, -0.8530632, -4.311562, 1, 1, 1, 1, 1,
-1.144702, -1.021915, -1.928634, 1, 1, 1, 1, 1,
-1.144256, 1.434884, -1.012975, 1, 1, 1, 1, 1,
-1.144251, 0.596909, -1.033312, 1, 1, 1, 1, 1,
-1.129122, -0.9251292, -2.925797, 0, 0, 1, 1, 1,
-1.127594, -0.8057075, -2.639543, 1, 0, 0, 1, 1,
-1.108981, 0.913016, -1.770889, 1, 0, 0, 1, 1,
-1.108855, 0.1677294, -0.8016906, 1, 0, 0, 1, 1,
-1.106632, 0.6962203, -1.328135, 1, 0, 0, 1, 1,
-1.103693, 0.9035341, -1.00758, 1, 0, 0, 1, 1,
-1.096527, 0.7923365, -1.796519, 0, 0, 0, 1, 1,
-1.093387, -1.047626, -3.707626, 0, 0, 0, 1, 1,
-1.091936, 0.003935851, -2.673269, 0, 0, 0, 1, 1,
-1.091133, -0.8535529, -1.676571, 0, 0, 0, 1, 1,
-1.083825, 0.6063257, -0.3086451, 0, 0, 0, 1, 1,
-1.07963, 0.441808, -2.105449, 0, 0, 0, 1, 1,
-1.075648, -0.3796839, -2.292098, 0, 0, 0, 1, 1,
-1.065556, -0.7926472, -3.097119, 1, 1, 1, 1, 1,
-1.065509, 1.966681, -1.655718, 1, 1, 1, 1, 1,
-1.062205, 0.9046939, -0.9764773, 1, 1, 1, 1, 1,
-1.059375, -0.4647578, -2.017463, 1, 1, 1, 1, 1,
-1.056471, -1.594779, -3.530146, 1, 1, 1, 1, 1,
-1.054506, -0.08280773, -2.325102, 1, 1, 1, 1, 1,
-1.051326, 0.08611064, -1.81532, 1, 1, 1, 1, 1,
-1.049112, -1.144928, -0.9124985, 1, 1, 1, 1, 1,
-1.047609, -0.05427495, -0.7566066, 1, 1, 1, 1, 1,
-1.045602, 2.090315, -1.431942, 1, 1, 1, 1, 1,
-1.036639, -0.4372965, -3.306191, 1, 1, 1, 1, 1,
-1.032247, -0.0517453, -0.9336945, 1, 1, 1, 1, 1,
-1.02599, -1.349679, -2.79587, 1, 1, 1, 1, 1,
-1.025196, -0.4388358, -2.918678, 1, 1, 1, 1, 1,
-1.021357, 1.296004, -0.3117233, 1, 1, 1, 1, 1,
-1.020662, -1.298477, -2.665103, 0, 0, 1, 1, 1,
-1.017433, -0.4205919, -1.764495, 1, 0, 0, 1, 1,
-1.014199, 2.423836, 1.166386, 1, 0, 0, 1, 1,
-1.006723, 0.3163278, 0.1085382, 1, 0, 0, 1, 1,
-1.001563, -0.4142082, -1.817044, 1, 0, 0, 1, 1,
-1.001552, -0.04749936, -1.435488, 1, 0, 0, 1, 1,
-0.9902467, 0.2146941, 0.504298, 0, 0, 0, 1, 1,
-0.9884998, 0.07217678, -1.836551, 0, 0, 0, 1, 1,
-0.980778, 2.074368, 0.1859053, 0, 0, 0, 1, 1,
-0.9766739, -0.1888435, -2.606521, 0, 0, 0, 1, 1,
-0.9762592, 0.7312336, -0.09576834, 0, 0, 0, 1, 1,
-0.972967, 1.610171, -2.766893, 0, 0, 0, 1, 1,
-0.9709487, -1.581704, -3.996974, 0, 0, 0, 1, 1,
-0.9709381, 1.139031, 0.06800374, 1, 1, 1, 1, 1,
-0.9663718, -0.1389716, -0.7167664, 1, 1, 1, 1, 1,
-0.9632278, 0.2328248, -0.9948514, 1, 1, 1, 1, 1,
-0.9601514, -1.322033, -2.23591, 1, 1, 1, 1, 1,
-0.9492877, 1.056195, -1.308852, 1, 1, 1, 1, 1,
-0.946367, 1.040966, -0.9627645, 1, 1, 1, 1, 1,
-0.9375796, 1.315552, 0.1529387, 1, 1, 1, 1, 1,
-0.9319845, -0.09232152, -1.475213, 1, 1, 1, 1, 1,
-0.9288021, -0.6493575, -2.757166, 1, 1, 1, 1, 1,
-0.9271236, 1.170568, -1.561641, 1, 1, 1, 1, 1,
-0.9229119, -0.5031484, -2.319075, 1, 1, 1, 1, 1,
-0.9224859, 3.008541, 0.8597513, 1, 1, 1, 1, 1,
-0.9157642, 0.4855562, 0.715273, 1, 1, 1, 1, 1,
-0.9130508, 0.1839857, -2.418243, 1, 1, 1, 1, 1,
-0.9076856, -1.670507, -3.368514, 1, 1, 1, 1, 1,
-0.905602, -0.2689611, -1.617617, 0, 0, 1, 1, 1,
-0.8992435, -1.102531, -2.486158, 1, 0, 0, 1, 1,
-0.8991631, -1.528538, -1.383014, 1, 0, 0, 1, 1,
-0.8952014, 0.9722282, 0.04766959, 1, 0, 0, 1, 1,
-0.8858212, -0.8235945, -3.214663, 1, 0, 0, 1, 1,
-0.8795585, -0.4468956, -2.113434, 1, 0, 0, 1, 1,
-0.8787044, 1.023176, 0.2941929, 0, 0, 0, 1, 1,
-0.8768404, 0.9788325, -2.260853, 0, 0, 0, 1, 1,
-0.87508, -0.07115594, -0.8886425, 0, 0, 0, 1, 1,
-0.8725839, 0.1438315, -0.6671293, 0, 0, 0, 1, 1,
-0.8718027, -0.6940361, -2.075862, 0, 0, 0, 1, 1,
-0.8685086, 1.641847, -1.30116, 0, 0, 0, 1, 1,
-0.8647326, -2.296062, -2.041319, 0, 0, 0, 1, 1,
-0.8542798, -1.240738, -3.555991, 1, 1, 1, 1, 1,
-0.8488169, -0.1176469, -2.090925, 1, 1, 1, 1, 1,
-0.8467944, 0.1397316, -2.297817, 1, 1, 1, 1, 1,
-0.8460246, 1.2312, -0.09089154, 1, 1, 1, 1, 1,
-0.8403219, -0.5949426, -3.93016, 1, 1, 1, 1, 1,
-0.8370599, -0.6414148, -3.255525, 1, 1, 1, 1, 1,
-0.8369299, 1.285748, 0.2261029, 1, 1, 1, 1, 1,
-0.8274508, 2.455766, -0.4485627, 1, 1, 1, 1, 1,
-0.8162883, -1.572678, -2.58641, 1, 1, 1, 1, 1,
-0.8153207, 2.305424, -1.343938, 1, 1, 1, 1, 1,
-0.7999251, 1.350639, 0.5039666, 1, 1, 1, 1, 1,
-0.7970592, 2.560956, -0.8973958, 1, 1, 1, 1, 1,
-0.7960689, 0.9163596, -0.7303974, 1, 1, 1, 1, 1,
-0.7945723, 0.3106201, -0.1944751, 1, 1, 1, 1, 1,
-0.7819684, -1.221577, -2.571191, 1, 1, 1, 1, 1,
-0.7791858, -0.3565967, -1.318172, 0, 0, 1, 1, 1,
-0.7772836, 1.210718, -1.122859, 1, 0, 0, 1, 1,
-0.7765904, -0.2522388, -0.6058835, 1, 0, 0, 1, 1,
-0.7722831, 0.1625074, -2.214868, 1, 0, 0, 1, 1,
-0.7716247, 0.2461637, -1.207782, 1, 0, 0, 1, 1,
-0.7679155, 1.034662, -0.8376735, 1, 0, 0, 1, 1,
-0.767331, -0.1778802, -2.235801, 0, 0, 0, 1, 1,
-0.7660128, -1.37771, -3.029575, 0, 0, 0, 1, 1,
-0.7626371, -1.087503, -1.585231, 0, 0, 0, 1, 1,
-0.7596884, -1.845037, -3.134914, 0, 0, 0, 1, 1,
-0.7569402, -0.2136747, -1.087602, 0, 0, 0, 1, 1,
-0.7543036, -1.908409, -3.831399, 0, 0, 0, 1, 1,
-0.7511732, 1.422813, 0.0816073, 0, 0, 0, 1, 1,
-0.743234, -0.2724655, 0.2190136, 1, 1, 1, 1, 1,
-0.7399374, 0.7748907, -2.090822, 1, 1, 1, 1, 1,
-0.7386875, 0.4981104, -0.07131567, 1, 1, 1, 1, 1,
-0.7330669, -0.468507, -2.324005, 1, 1, 1, 1, 1,
-0.7307574, -1.235428, -1.529644, 1, 1, 1, 1, 1,
-0.7301543, -0.694322, -3.217159, 1, 1, 1, 1, 1,
-0.7238157, 0.1535629, -1.204466, 1, 1, 1, 1, 1,
-0.7231806, 0.3727628, 0.8215485, 1, 1, 1, 1, 1,
-0.7227749, -1.664586, -1.641873, 1, 1, 1, 1, 1,
-0.7196848, 0.6198326, -0.6002934, 1, 1, 1, 1, 1,
-0.7178122, -0.7974294, -1.292138, 1, 1, 1, 1, 1,
-0.7138501, 1.811452, -0.8014718, 1, 1, 1, 1, 1,
-0.707217, 1.213204, -0.4327972, 1, 1, 1, 1, 1,
-0.7063686, 0.7, -0.4515995, 1, 1, 1, 1, 1,
-0.7050937, 0.4676874, -1.469337, 1, 1, 1, 1, 1,
-0.700062, -0.3975724, -2.371979, 0, 0, 1, 1, 1,
-0.6927148, 0.7142078, -2.287963, 1, 0, 0, 1, 1,
-0.6908606, 2.084813, 0.4444858, 1, 0, 0, 1, 1,
-0.6860067, -1.523399, -2.700918, 1, 0, 0, 1, 1,
-0.680239, 1.749692, -0.2859335, 1, 0, 0, 1, 1,
-0.6800106, -0.03719482, -2.322154, 1, 0, 0, 1, 1,
-0.679871, -1.215929, -2.355024, 0, 0, 0, 1, 1,
-0.6797372, -0.09905105, -2.001976, 0, 0, 0, 1, 1,
-0.6752619, -2.238686, -3.107975, 0, 0, 0, 1, 1,
-0.6710624, -0.5787849, -1.717233, 0, 0, 0, 1, 1,
-0.669764, -0.6620003, -3.603546, 0, 0, 0, 1, 1,
-0.669701, -3.184543, -2.629532, 0, 0, 0, 1, 1,
-0.6676956, -0.1675415, -2.888078, 0, 0, 0, 1, 1,
-0.660998, -2.497632, -2.706944, 1, 1, 1, 1, 1,
-0.6597609, -1.965014, -3.936272, 1, 1, 1, 1, 1,
-0.6587495, -0.8154052, -1.374144, 1, 1, 1, 1, 1,
-0.658549, 0.2366752, -2.218125, 1, 1, 1, 1, 1,
-0.6571284, 1.472632, -1.64072, 1, 1, 1, 1, 1,
-0.6558352, 1.017504, -0.8898103, 1, 1, 1, 1, 1,
-0.6509288, -1.951974, -1.502232, 1, 1, 1, 1, 1,
-0.6483495, 0.9929919, 1.235016, 1, 1, 1, 1, 1,
-0.6468709, -1.740519, -2.624886, 1, 1, 1, 1, 1,
-0.6396616, 0.8428906, -0.3705249, 1, 1, 1, 1, 1,
-0.6385507, -0.8199409, -3.047513, 1, 1, 1, 1, 1,
-0.6354466, -0.7118688, -2.594764, 1, 1, 1, 1, 1,
-0.6318882, 0.8695671, -2.621521, 1, 1, 1, 1, 1,
-0.6301134, 0.1375074, -1.723891, 1, 1, 1, 1, 1,
-0.6253337, -0.7755418, -0.833683, 1, 1, 1, 1, 1,
-0.624844, -0.007384412, -2.189126, 0, 0, 1, 1, 1,
-0.6219007, -0.08736211, 0.01830546, 1, 0, 0, 1, 1,
-0.6213267, -0.1164455, -2.942764, 1, 0, 0, 1, 1,
-0.6194987, 0.8359817, -0.7692058, 1, 0, 0, 1, 1,
-0.6153646, -0.2077634, -1.75319, 1, 0, 0, 1, 1,
-0.6145222, -0.4505651, -1.771821, 1, 0, 0, 1, 1,
-0.6132812, 0.6877335, -1.663277, 0, 0, 0, 1, 1,
-0.6126192, 1.224941, -0.2149723, 0, 0, 0, 1, 1,
-0.6096, -0.4880643, -2.958913, 0, 0, 0, 1, 1,
-0.603784, -1.551637, -2.727814, 0, 0, 0, 1, 1,
-0.5997751, 0.7187083, -2.451173, 0, 0, 0, 1, 1,
-0.5997247, -0.9859493, -3.111148, 0, 0, 0, 1, 1,
-0.5994924, -1.555395, -3.44763, 0, 0, 0, 1, 1,
-0.5991026, -0.1180365, -4.131991, 1, 1, 1, 1, 1,
-0.5953413, 0.04154326, -1.412505, 1, 1, 1, 1, 1,
-0.5938122, -0.7019671, -1.296041, 1, 1, 1, 1, 1,
-0.5920737, 0.3270891, -1.840846, 1, 1, 1, 1, 1,
-0.590557, -0.329222, -2.169345, 1, 1, 1, 1, 1,
-0.5814739, -1.414566, -2.161377, 1, 1, 1, 1, 1,
-0.578203, -1.593374, -1.537622, 1, 1, 1, 1, 1,
-0.576324, 0.6426421, -0.9435112, 1, 1, 1, 1, 1,
-0.5754405, 0.1382406, 0.4511293, 1, 1, 1, 1, 1,
-0.5743456, -0.4527513, -2.642782, 1, 1, 1, 1, 1,
-0.5742658, 0.780624, -1.013822, 1, 1, 1, 1, 1,
-0.5694909, 0.9241012, -0.2762044, 1, 1, 1, 1, 1,
-0.5690633, 0.1427186, -1.354967, 1, 1, 1, 1, 1,
-0.5672272, 0.6421952, 0.1886265, 1, 1, 1, 1, 1,
-0.5668423, -0.5158251, -2.719094, 1, 1, 1, 1, 1,
-0.5655974, 1.794021, -0.4595676, 0, 0, 1, 1, 1,
-0.5620944, -0.5823345, -2.196699, 1, 0, 0, 1, 1,
-0.5619857, 0.7971965, -0.4164738, 1, 0, 0, 1, 1,
-0.5587149, -0.3096718, -1.661354, 1, 0, 0, 1, 1,
-0.5578925, -1.021632, -2.214621, 1, 0, 0, 1, 1,
-0.5525947, 1.23755, -1.796999, 1, 0, 0, 1, 1,
-0.5511748, -0.08775593, -2.314961, 0, 0, 0, 1, 1,
-0.5506805, -0.1814315, -0.9624017, 0, 0, 0, 1, 1,
-0.546887, 0.7958862, -1.282365, 0, 0, 0, 1, 1,
-0.5457051, 0.2198192, -2.882307, 0, 0, 0, 1, 1,
-0.5454569, 2.000261, -0.003607834, 0, 0, 0, 1, 1,
-0.5421307, -0.08944532, -0.8444367, 0, 0, 0, 1, 1,
-0.5411328, 1.615829, -0.3494421, 0, 0, 0, 1, 1,
-0.5404351, 0.3330853, -1.612487, 1, 1, 1, 1, 1,
-0.5402101, -1.333704, -2.682533, 1, 1, 1, 1, 1,
-0.5392372, -0.1672146, -0.8627579, 1, 1, 1, 1, 1,
-0.5345843, 0.8565156, -0.2372395, 1, 1, 1, 1, 1,
-0.5310054, -1.832399, -2.650461, 1, 1, 1, 1, 1,
-0.5281581, 1.267016, -0.7797502, 1, 1, 1, 1, 1,
-0.5270346, -0.9313239, -3.009937, 1, 1, 1, 1, 1,
-0.5253069, -0.2146006, -0.1591244, 1, 1, 1, 1, 1,
-0.5252542, 0.4724022, -1.017943, 1, 1, 1, 1, 1,
-0.5235284, 1.537475, 0.4187909, 1, 1, 1, 1, 1,
-0.5224697, -1.271757, -0.4954883, 1, 1, 1, 1, 1,
-0.521704, -0.2187716, -0.5017636, 1, 1, 1, 1, 1,
-0.5215333, -0.5246614, -1.64422, 1, 1, 1, 1, 1,
-0.5140516, -0.6226932, -3.319121, 1, 1, 1, 1, 1,
-0.5086858, 0.9600243, 3.184948, 1, 1, 1, 1, 1,
-0.5059351, 1.782245, -0.1095563, 0, 0, 1, 1, 1,
-0.5039036, -0.1649034, -3.016852, 1, 0, 0, 1, 1,
-0.5035911, -0.7218703, -3.57617, 1, 0, 0, 1, 1,
-0.5018181, 0.3335085, -0.01502829, 1, 0, 0, 1, 1,
-0.4999502, -1.446887, -2.209962, 1, 0, 0, 1, 1,
-0.4983024, 0.61551, -0.4220551, 1, 0, 0, 1, 1,
-0.4981768, 1.282687, 0.473085, 0, 0, 0, 1, 1,
-0.4955315, 0.6248289, -0.9586942, 0, 0, 0, 1, 1,
-0.494406, -0.1143275, -0.6787963, 0, 0, 0, 1, 1,
-0.4938057, 0.02508884, -1.285598, 0, 0, 0, 1, 1,
-0.4909371, -0.3436065, -0.6898057, 0, 0, 0, 1, 1,
-0.4850894, -0.3585717, -2.8516, 0, 0, 0, 1, 1,
-0.4754735, -0.7860695, -1.686265, 0, 0, 0, 1, 1,
-0.4741846, -0.1697941, 0.09844297, 1, 1, 1, 1, 1,
-0.4736828, -0.2998891, -2.254728, 1, 1, 1, 1, 1,
-0.4733745, 2.485901, 0.06174695, 1, 1, 1, 1, 1,
-0.4714862, -1.294194, -3.998266, 1, 1, 1, 1, 1,
-0.4712513, 0.3461128, -1.359497, 1, 1, 1, 1, 1,
-0.4675319, 0.3564355, -0.2318114, 1, 1, 1, 1, 1,
-0.4645851, -0.6297812, -3.73809, 1, 1, 1, 1, 1,
-0.4620116, -0.5351743, -1.362826, 1, 1, 1, 1, 1,
-0.4607792, 1.402649, 0.2768829, 1, 1, 1, 1, 1,
-0.4603185, -1.712089, -3.912107, 1, 1, 1, 1, 1,
-0.458512, 1.853873, -0.1549741, 1, 1, 1, 1, 1,
-0.4549305, 0.1267536, -0.5221109, 1, 1, 1, 1, 1,
-0.4546632, 0.1391007, -2.081609, 1, 1, 1, 1, 1,
-0.4459812, -0.3506524, -1.360758, 1, 1, 1, 1, 1,
-0.4435489, -0.8134826, -0.7797971, 1, 1, 1, 1, 1,
-0.4411378, -0.108878, -2.621462, 0, 0, 1, 1, 1,
-0.4395204, 1.797258, -0.3982392, 1, 0, 0, 1, 1,
-0.439286, 0.2695386, -0.1122781, 1, 0, 0, 1, 1,
-0.438962, 2.1737, 0.5405189, 1, 0, 0, 1, 1,
-0.4386778, -0.2166326, -2.625317, 1, 0, 0, 1, 1,
-0.4372496, 0.6158513, -2.13411, 1, 0, 0, 1, 1,
-0.4344378, 0.4310742, -1.436045, 0, 0, 0, 1, 1,
-0.4339551, 1.383186, -2.523257, 0, 0, 0, 1, 1,
-0.4321591, -1.046309, -3.694756, 0, 0, 0, 1, 1,
-0.4301488, 1.598388, -0.2902508, 0, 0, 0, 1, 1,
-0.4272489, 1.085416, 0.67835, 0, 0, 0, 1, 1,
-0.4245192, 1.251618, -1.352393, 0, 0, 0, 1, 1,
-0.4235501, 0.2693592, 0.07962156, 0, 0, 0, 1, 1,
-0.4229496, -0.6749091, -1.329439, 1, 1, 1, 1, 1,
-0.4159674, -0.8941818, -3.567132, 1, 1, 1, 1, 1,
-0.4037138, 0.2836554, -0.6008554, 1, 1, 1, 1, 1,
-0.4036107, -1.454442, -2.668549, 1, 1, 1, 1, 1,
-0.4011524, -0.22493, -2.120592, 1, 1, 1, 1, 1,
-0.3944506, -0.3407646, -2.14705, 1, 1, 1, 1, 1,
-0.389102, 1.008235, -0.01264489, 1, 1, 1, 1, 1,
-0.3852001, 0.6306753, -1.510805, 1, 1, 1, 1, 1,
-0.378565, 1.318438, -1.297176, 1, 1, 1, 1, 1,
-0.3773138, -0.1883419, -2.627049, 1, 1, 1, 1, 1,
-0.3759402, -0.9499831, -3.196386, 1, 1, 1, 1, 1,
-0.3757041, 0.6337559, -0.9229122, 1, 1, 1, 1, 1,
-0.3728688, 1.735025, -1.400537, 1, 1, 1, 1, 1,
-0.3698632, -1.620076, -2.016949, 1, 1, 1, 1, 1,
-0.3673662, -0.104588, -3.150017, 1, 1, 1, 1, 1,
-0.3640688, -0.1639208, -0.7594211, 0, 0, 1, 1, 1,
-0.3627315, 0.06803913, 0.04392432, 1, 0, 0, 1, 1,
-0.3596692, -0.2466264, -1.904857, 1, 0, 0, 1, 1,
-0.3554732, -1.318911, -2.000419, 1, 0, 0, 1, 1,
-0.3539414, -0.6803626, -2.102988, 1, 0, 0, 1, 1,
-0.3482893, 0.7038143, -0.2185698, 1, 0, 0, 1, 1,
-0.3463421, 0.387768, -0.79966, 0, 0, 0, 1, 1,
-0.3458381, 0.2170386, -1.131372, 0, 0, 0, 1, 1,
-0.3351983, -1.882945, -2.557517, 0, 0, 0, 1, 1,
-0.3348127, 1.810047, -0.3118608, 0, 0, 0, 1, 1,
-0.3339893, 1.129586, -0.2442768, 0, 0, 0, 1, 1,
-0.3316353, -1.546254, -2.544388, 0, 0, 0, 1, 1,
-0.3301074, 0.5536392, 0.2510899, 0, 0, 0, 1, 1,
-0.3283738, 0.03988959, 0.5594409, 1, 1, 1, 1, 1,
-0.3283424, -0.1707828, -2.269731, 1, 1, 1, 1, 1,
-0.3273452, 1.875354, -1.179141, 1, 1, 1, 1, 1,
-0.3249661, 1.280226, -0.631843, 1, 1, 1, 1, 1,
-0.3232232, 1.211653, 0.04816918, 1, 1, 1, 1, 1,
-0.3222365, 0.3060337, 1.168397, 1, 1, 1, 1, 1,
-0.3159045, 0.444862, -1.892374, 1, 1, 1, 1, 1,
-0.3148, 0.7261597, 0.1994078, 1, 1, 1, 1, 1,
-0.3139232, 1.347177, 0.9429738, 1, 1, 1, 1, 1,
-0.3065692, 0.7165956, -2.038559, 1, 1, 1, 1, 1,
-0.3049629, -1.05859, -3.584407, 1, 1, 1, 1, 1,
-0.3003556, -0.4042399, -1.846282, 1, 1, 1, 1, 1,
-0.2995806, 1.013535, -1.635876, 1, 1, 1, 1, 1,
-0.2977518, 1.061052, 0.9162557, 1, 1, 1, 1, 1,
-0.2964818, 0.07323326, -4.483902, 1, 1, 1, 1, 1,
-0.295431, 1.578311, 0.3965294, 0, 0, 1, 1, 1,
-0.2936889, -0.07919648, -2.587215, 1, 0, 0, 1, 1,
-0.2885506, 0.06178831, -0.2907542, 1, 0, 0, 1, 1,
-0.2877853, 0.4758133, -2.216417, 1, 0, 0, 1, 1,
-0.2858775, 0.3700285, -0.5816089, 1, 0, 0, 1, 1,
-0.2852209, 1.247576, -0.1774465, 1, 0, 0, 1, 1,
-0.2838759, -0.6104741, -2.518321, 0, 0, 0, 1, 1,
-0.2834074, -0.184664, -2.432553, 0, 0, 0, 1, 1,
-0.281809, -0.3589421, -0.4841076, 0, 0, 0, 1, 1,
-0.274537, 0.1601236, -2.347439, 0, 0, 0, 1, 1,
-0.2744536, 1.211092, 0.7500623, 0, 0, 0, 1, 1,
-0.2739157, -1.829882, -1.827713, 0, 0, 0, 1, 1,
-0.273624, -1.442757, -1.072697, 0, 0, 0, 1, 1,
-0.2727503, 0.8086456, -1.557924, 1, 1, 1, 1, 1,
-0.2718188, -0.9987438, -4.17271, 1, 1, 1, 1, 1,
-0.2671112, 2.000439, 0.6529199, 1, 1, 1, 1, 1,
-0.2657598, -0.2104891, -3.135276, 1, 1, 1, 1, 1,
-0.2645135, 0.2675102, -0.6792343, 1, 1, 1, 1, 1,
-0.2640271, 0.949937, 1.380611, 1, 1, 1, 1, 1,
-0.2636228, 0.3746493, 0.573393, 1, 1, 1, 1, 1,
-0.2628965, 0.8124797, -0.7693051, 1, 1, 1, 1, 1,
-0.2611822, -0.01229489, -2.508252, 1, 1, 1, 1, 1,
-0.2603302, 0.6419748, -0.4156975, 1, 1, 1, 1, 1,
-0.2556141, 0.3261499, -0.2089645, 1, 1, 1, 1, 1,
-0.2555697, 0.8487074, -1.158834, 1, 1, 1, 1, 1,
-0.2437942, -0.04164804, -2.433745, 1, 1, 1, 1, 1,
-0.23985, 0.8290127, -0.1896279, 1, 1, 1, 1, 1,
-0.2369449, 0.526929, 0.5759745, 1, 1, 1, 1, 1,
-0.2343672, 0.854484, -0.9185058, 0, 0, 1, 1, 1,
-0.2273474, -1.292916, -3.089947, 1, 0, 0, 1, 1,
-0.2190863, 0.3988166, -1.348982, 1, 0, 0, 1, 1,
-0.2184588, -0.3717085, -3.855971, 1, 0, 0, 1, 1,
-0.2157179, -0.342849, -2.330384, 1, 0, 0, 1, 1,
-0.215493, 0.8957567, -0.7295867, 1, 0, 0, 1, 1,
-0.2123855, -1.04674, -1.935055, 0, 0, 0, 1, 1,
-0.2112226, -0.7308624, -2.29627, 0, 0, 0, 1, 1,
-0.2095629, -0.1748982, 0.1088291, 0, 0, 0, 1, 1,
-0.1998082, 0.4664806, -0.3866114, 0, 0, 0, 1, 1,
-0.1937748, 0.9711483, 1.234022, 0, 0, 0, 1, 1,
-0.1933626, -0.438675, -2.640148, 0, 0, 0, 1, 1,
-0.1918304, -0.7025435, -1.752297, 0, 0, 0, 1, 1,
-0.183305, 2.087997, -1.27779, 1, 1, 1, 1, 1,
-0.1828502, -1.295197, -2.20927, 1, 1, 1, 1, 1,
-0.1802752, -1.844085, -4.373693, 1, 1, 1, 1, 1,
-0.1788669, 0.1751689, -1.492108, 1, 1, 1, 1, 1,
-0.1740215, 0.759523, 0.4877429, 1, 1, 1, 1, 1,
-0.1733307, 1.036437, -0.3940684, 1, 1, 1, 1, 1,
-0.1732779, 0.7618014, -1.413275, 1, 1, 1, 1, 1,
-0.1631839, -0.9760851, -3.972418, 1, 1, 1, 1, 1,
-0.1605669, 0.8054207, -1.257438, 1, 1, 1, 1, 1,
-0.1590435, 0.2937354, -1.226188, 1, 1, 1, 1, 1,
-0.1572642, -1.671135, -2.67837, 1, 1, 1, 1, 1,
-0.1563995, -0.4103092, -3.406918, 1, 1, 1, 1, 1,
-0.1464875, -0.7385148, -2.671361, 1, 1, 1, 1, 1,
-0.1462184, 1.084032, -1.202505, 1, 1, 1, 1, 1,
-0.1331907, 0.04254188, -1.368203, 1, 1, 1, 1, 1,
-0.1324848, -1.517833, -2.622105, 0, 0, 1, 1, 1,
-0.1323892, -0.1754589, -3.185151, 1, 0, 0, 1, 1,
-0.1316119, 0.0784016, -2.639068, 1, 0, 0, 1, 1,
-0.1285172, 0.151799, -2.530221, 1, 0, 0, 1, 1,
-0.1280912, 2.116219, 0.2905942, 1, 0, 0, 1, 1,
-0.1270727, 0.7454831, -0.7000573, 1, 0, 0, 1, 1,
-0.1241694, 0.2877394, -0.6335351, 0, 0, 0, 1, 1,
-0.1220868, 1.613657, -0.5274556, 0, 0, 0, 1, 1,
-0.1219457, 1.408866, -1.778588, 0, 0, 0, 1, 1,
-0.1210381, 0.5245862, -0.3042775, 0, 0, 0, 1, 1,
-0.1190159, 0.7775136, -2.062531, 0, 0, 0, 1, 1,
-0.1177158, 0.6577748, 1.259666, 0, 0, 0, 1, 1,
-0.1166798, -0.06252598, -3.140227, 0, 0, 0, 1, 1,
-0.1153549, -1.175813, -4.573424, 1, 1, 1, 1, 1,
-0.113455, -0.9939546, -3.990303, 1, 1, 1, 1, 1,
-0.1058045, 1.671454, -0.5163518, 1, 1, 1, 1, 1,
-0.1044394, -0.6626756, -3.520939, 1, 1, 1, 1, 1,
-0.1023691, -0.4452294, -3.699142, 1, 1, 1, 1, 1,
-0.09859542, -1.338182, -2.564944, 1, 1, 1, 1, 1,
-0.09563348, -0.04134412, -1.75291, 1, 1, 1, 1, 1,
-0.0942096, -0.8636215, -2.273191, 1, 1, 1, 1, 1,
-0.09221333, 0.5110992, 0.684533, 1, 1, 1, 1, 1,
-0.08719605, -0.269888, -1.625129, 1, 1, 1, 1, 1,
-0.08711728, 1.252053, 0.2920679, 1, 1, 1, 1, 1,
-0.08097661, -0.9416476, -5.59158, 1, 1, 1, 1, 1,
-0.0766613, 0.58713, -0.04847931, 1, 1, 1, 1, 1,
-0.07258121, -0.4629214, -3.297811, 1, 1, 1, 1, 1,
-0.07207179, -1.159681, -2.939754, 1, 1, 1, 1, 1,
-0.07121526, -0.8503812, -3.141859, 0, 0, 1, 1, 1,
-0.06696638, 0.8484682, -0.2445966, 1, 0, 0, 1, 1,
-0.06612536, -0.8165299, -3.339395, 1, 0, 0, 1, 1,
-0.06335794, -0.8757073, -3.799234, 1, 0, 0, 1, 1,
-0.05857674, -0.7278829, -4.478029, 1, 0, 0, 1, 1,
-0.0567904, 0.7070985, 0.2185412, 1, 0, 0, 1, 1,
-0.05634836, 1.897442, 0.6307324, 0, 0, 0, 1, 1,
-0.05482451, -1.231647, -3.52631, 0, 0, 0, 1, 1,
-0.05278656, -1.052868, -2.257454, 0, 0, 0, 1, 1,
-0.05100155, 0.4346298, -1.55287, 0, 0, 0, 1, 1,
-0.05093904, 0.7910832, -0.294836, 0, 0, 0, 1, 1,
-0.04612296, 3.600231, -0.8347268, 0, 0, 0, 1, 1,
-0.04063257, 0.03749485, -0.2772273, 0, 0, 0, 1, 1,
-0.03811112, -2.386477, -3.468282, 1, 1, 1, 1, 1,
-0.0355193, 0.1715696, 2.246171, 1, 1, 1, 1, 1,
-0.03457804, 0.7581812, -0.01437064, 1, 1, 1, 1, 1,
-0.03450623, -0.7877268, -2.779214, 1, 1, 1, 1, 1,
-0.03309825, -1.240482, -3.315288, 1, 1, 1, 1, 1,
-0.02685097, 1.431243, -0.4985039, 1, 1, 1, 1, 1,
-0.02210224, 0.238513, 0.2110939, 1, 1, 1, 1, 1,
-0.02158242, 2.707417, -0.5431426, 1, 1, 1, 1, 1,
-0.01941068, 0.07497819, 1.513906, 1, 1, 1, 1, 1,
-0.01734092, 0.5928779, -0.6772822, 1, 1, 1, 1, 1,
-0.01677035, -1.179732, -3.365304, 1, 1, 1, 1, 1,
-0.01455429, 1.077018, -0.9024773, 1, 1, 1, 1, 1,
-0.001790333, -0.6804246, -3.451925, 1, 1, 1, 1, 1,
0.003014808, -0.3931602, 3.139791, 1, 1, 1, 1, 1,
0.003954665, 1.026667, -0.03671746, 1, 1, 1, 1, 1,
0.007040255, 1.145015, 2.167873, 0, 0, 1, 1, 1,
0.01075435, -0.4856429, 2.085206, 1, 0, 0, 1, 1,
0.01080749, -1.0113, 3.368154, 1, 0, 0, 1, 1,
0.0108126, -0.3976789, 2.920543, 1, 0, 0, 1, 1,
0.01346975, 0.06079467, 0.660403, 1, 0, 0, 1, 1,
0.01478661, -0.0953481, 5.828006, 1, 0, 0, 1, 1,
0.0182112, 0.5673336, -0.02858792, 0, 0, 0, 1, 1,
0.01908602, -0.005792747, 1.889524, 0, 0, 0, 1, 1,
0.02782511, -1.054822, 3.45881, 0, 0, 0, 1, 1,
0.03004569, 1.2791, 0.746071, 0, 0, 0, 1, 1,
0.03019251, 0.5900622, -0.2998544, 0, 0, 0, 1, 1,
0.03089495, 0.0858747, 1.888717, 0, 0, 0, 1, 1,
0.03242823, -1.214231, 1.75488, 0, 0, 0, 1, 1,
0.03687655, -1.374592, 2.862591, 1, 1, 1, 1, 1,
0.03915469, -0.2874829, 2.499784, 1, 1, 1, 1, 1,
0.04111618, 1.698473, -1.86873, 1, 1, 1, 1, 1,
0.04627939, -1.646814, 3.30068, 1, 1, 1, 1, 1,
0.04979989, -0.4356921, 1.366632, 1, 1, 1, 1, 1,
0.05495314, -1.155832, 3.188238, 1, 1, 1, 1, 1,
0.05528379, 0.1944012, -0.680527, 1, 1, 1, 1, 1,
0.05828735, 2.169427, -0.7596431, 1, 1, 1, 1, 1,
0.0616187, -0.2246866, 3.057189, 1, 1, 1, 1, 1,
0.06304822, 0.3416189, 0.7586928, 1, 1, 1, 1, 1,
0.06717495, 1.150531, -0.9462689, 1, 1, 1, 1, 1,
0.06932778, 0.4570314, -0.8643748, 1, 1, 1, 1, 1,
0.06947298, 0.5868916, -0.3932713, 1, 1, 1, 1, 1,
0.07656683, 0.1467294, -0.3458804, 1, 1, 1, 1, 1,
0.07704534, 0.04049894, 0.1058673, 1, 1, 1, 1, 1,
0.07710455, 0.03686073, 1.197318, 0, 0, 1, 1, 1,
0.07868816, 1.730199, 1.68104, 1, 0, 0, 1, 1,
0.08108308, -0.7369328, 1.554941, 1, 0, 0, 1, 1,
0.08558916, -1.121614, 4.305002, 1, 0, 0, 1, 1,
0.08577514, -1.017212, 2.83293, 1, 0, 0, 1, 1,
0.08841003, -0.2460879, 4.225335, 1, 0, 0, 1, 1,
0.08900885, -1.056935, 3.302593, 0, 0, 0, 1, 1,
0.09005051, -1.235869, 3.859282, 0, 0, 0, 1, 1,
0.09073415, -0.402164, 2.47847, 0, 0, 0, 1, 1,
0.09367605, 2.176666, -0.1547961, 0, 0, 0, 1, 1,
0.0957958, -1.756061, 4.445462, 0, 0, 0, 1, 1,
0.09583207, -0.6004347, 2.996891, 0, 0, 0, 1, 1,
0.09766263, 0.5234546, -0.6103789, 0, 0, 0, 1, 1,
0.09818722, 0.9555704, -0.3316105, 1, 1, 1, 1, 1,
0.09882644, 1.443843, 0.4170076, 1, 1, 1, 1, 1,
0.09950209, -0.8118308, 3.369642, 1, 1, 1, 1, 1,
0.1021163, -0.7024684, 2.847532, 1, 1, 1, 1, 1,
0.1021392, 0.3278925, 1.528945, 1, 1, 1, 1, 1,
0.1030249, 1.576108, -0.3460761, 1, 1, 1, 1, 1,
0.1040519, -1.471437, 3.609489, 1, 1, 1, 1, 1,
0.1070042, 0.114078, -0.1033035, 1, 1, 1, 1, 1,
0.1073013, -0.8510268, 2.815269, 1, 1, 1, 1, 1,
0.1102417, 0.3694149, 1.280315, 1, 1, 1, 1, 1,
0.1121724, -0.108247, 2.358374, 1, 1, 1, 1, 1,
0.1133041, 0.09374916, 0.9484222, 1, 1, 1, 1, 1,
0.1165202, -1.181655, 2.532458, 1, 1, 1, 1, 1,
0.1166534, 0.8033693, 0.03124793, 1, 1, 1, 1, 1,
0.1173595, -0.9182307, 3.755332, 1, 1, 1, 1, 1,
0.118135, -0.1421064, 0.6363131, 0, 0, 1, 1, 1,
0.1256877, -0.323557, 3.718188, 1, 0, 0, 1, 1,
0.1259131, -1.004668, 3.285404, 1, 0, 0, 1, 1,
0.1293392, 2.35884, -0.5396845, 1, 0, 0, 1, 1,
0.1298114, 0.04642276, 1.212586, 1, 0, 0, 1, 1,
0.1299906, -0.6730015, 2.524012, 1, 0, 0, 1, 1,
0.1345448, -0.971048, 5.214119, 0, 0, 0, 1, 1,
0.1374567, -0.6475887, 3.322675, 0, 0, 0, 1, 1,
0.1437245, -1.431997, 3.288578, 0, 0, 0, 1, 1,
0.1464625, 1.464586, 0.08467311, 0, 0, 0, 1, 1,
0.1486135, -0.5819337, 2.785737, 0, 0, 0, 1, 1,
0.152415, -1.727838, 3.513601, 0, 0, 0, 1, 1,
0.1526079, 0.8204835, 0.2818408, 0, 0, 0, 1, 1,
0.1544293, 1.256859, -0.6550825, 1, 1, 1, 1, 1,
0.156018, 0.01219018, 3.158989, 1, 1, 1, 1, 1,
0.1575486, 0.4356706, 1.722622, 1, 1, 1, 1, 1,
0.1596193, -0.2784756, 1.525737, 1, 1, 1, 1, 1,
0.1621009, -0.4536729, 2.301311, 1, 1, 1, 1, 1,
0.1631732, 0.3387819, 1.524856, 1, 1, 1, 1, 1,
0.1634549, -0.2279071, 2.323558, 1, 1, 1, 1, 1,
0.1693783, 0.5911239, 0.05558991, 1, 1, 1, 1, 1,
0.1699571, 0.7281098, 0.3272281, 1, 1, 1, 1, 1,
0.172593, 0.4788317, 0.6465663, 1, 1, 1, 1, 1,
0.1727425, -0.5568686, 2.128229, 1, 1, 1, 1, 1,
0.1796705, -0.8607226, 2.087309, 1, 1, 1, 1, 1,
0.1823573, -0.587288, 3.313002, 1, 1, 1, 1, 1,
0.1839548, -1.849388, 2.377278, 1, 1, 1, 1, 1,
0.1841116, 0.6612768, -1.449383, 1, 1, 1, 1, 1,
0.2010824, -0.1139164, 0.3595509, 0, 0, 1, 1, 1,
0.201884, 0.3329435, 1.670668, 1, 0, 0, 1, 1,
0.2050589, -0.7485672, 3.560102, 1, 0, 0, 1, 1,
0.209401, -0.3618239, 4.50559, 1, 0, 0, 1, 1,
0.2094733, -0.8186458, 1.927316, 1, 0, 0, 1, 1,
0.2127284, -1.046579, 2.403732, 1, 0, 0, 1, 1,
0.2140966, -1.235016, 4.777156, 0, 0, 0, 1, 1,
0.2186778, -1.35441, 3.850551, 0, 0, 0, 1, 1,
0.2198334, 0.5341858, 0.2334625, 0, 0, 0, 1, 1,
0.220134, 1.485359, 0.688103, 0, 0, 0, 1, 1,
0.2245573, 0.06095035, 2.422952, 0, 0, 0, 1, 1,
0.2279426, 0.516206, 1.297397, 0, 0, 0, 1, 1,
0.2365668, 1.768806, 0.3360679, 0, 0, 0, 1, 1,
0.2392065, 1.198135, -0.5624277, 1, 1, 1, 1, 1,
0.2403379, -2.554561, 2.651787, 1, 1, 1, 1, 1,
0.2425207, 0.7301624, -1.718711, 1, 1, 1, 1, 1,
0.243688, -0.5176196, 0.5544919, 1, 1, 1, 1, 1,
0.2444971, 0.1011038, 1.850531, 1, 1, 1, 1, 1,
0.2447047, -0.02412328, 2.797881, 1, 1, 1, 1, 1,
0.2472304, 0.2387517, 1.530673, 1, 1, 1, 1, 1,
0.248455, 0.03568622, -0.1025395, 1, 1, 1, 1, 1,
0.2507609, 0.6664948, -0.4029876, 1, 1, 1, 1, 1,
0.2507971, -0.5132263, 3.138561, 1, 1, 1, 1, 1,
0.2543825, -0.198451, 2.58245, 1, 1, 1, 1, 1,
0.2548628, 0.2402383, 2.838474, 1, 1, 1, 1, 1,
0.2567643, 0.5339432, -0.1490397, 1, 1, 1, 1, 1,
0.2625829, 0.5331344, -0.4871466, 1, 1, 1, 1, 1,
0.2628227, -1.389715, 2.744486, 1, 1, 1, 1, 1,
0.2645667, 0.2402816, 2.442749, 0, 0, 1, 1, 1,
0.2662185, -0.07506442, 1.68894, 1, 0, 0, 1, 1,
0.2665236, 0.9200438, 0.9288674, 1, 0, 0, 1, 1,
0.2680119, -1.127143, 4.012231, 1, 0, 0, 1, 1,
0.269952, -0.5515852, 3.517358, 1, 0, 0, 1, 1,
0.2703151, -1.790706, 3.497076, 1, 0, 0, 1, 1,
0.275072, -0.5317714, 3.290363, 0, 0, 0, 1, 1,
0.275845, -0.01445835, 0.945255, 0, 0, 0, 1, 1,
0.2798974, -0.01056352, 3.349375, 0, 0, 0, 1, 1,
0.2809502, -0.3916993, 1.479048, 0, 0, 0, 1, 1,
0.281602, -0.07372058, 4.087699, 0, 0, 0, 1, 1,
0.2864717, 1.685168, 0.0354201, 0, 0, 0, 1, 1,
0.2899837, -2.225219, 1.264965, 0, 0, 0, 1, 1,
0.2912957, 0.6930478, -0.1218702, 1, 1, 1, 1, 1,
0.2940108, 0.1762528, -0.3357794, 1, 1, 1, 1, 1,
0.2949834, -0.4590848, 2.621774, 1, 1, 1, 1, 1,
0.2959141, 1.588398, 0.5523201, 1, 1, 1, 1, 1,
0.2966065, -0.7859771, 1.890925, 1, 1, 1, 1, 1,
0.2969427, -1.348882, 1.32981, 1, 1, 1, 1, 1,
0.3104723, -0.2625769, 2.643669, 1, 1, 1, 1, 1,
0.3123208, 1.277859, 1.30178, 1, 1, 1, 1, 1,
0.3131843, -0.6124123, 2.904671, 1, 1, 1, 1, 1,
0.3135317, 0.9245654, 0.3556466, 1, 1, 1, 1, 1,
0.3151188, -0.801553, 4.129969, 1, 1, 1, 1, 1,
0.3161166, 0.9005893, 0.5138102, 1, 1, 1, 1, 1,
0.3178835, -1.006471, 4.379256, 1, 1, 1, 1, 1,
0.3284653, 0.4220615, 0.8480257, 1, 1, 1, 1, 1,
0.3310794, -0.04909619, 1.806375, 1, 1, 1, 1, 1,
0.331119, -0.04230578, 1.706442, 0, 0, 1, 1, 1,
0.3317191, -0.3656653, 0.07297093, 1, 0, 0, 1, 1,
0.3390322, -0.1405599, 1.877459, 1, 0, 0, 1, 1,
0.3514393, 0.3053863, 1.130863, 1, 0, 0, 1, 1,
0.3516661, -1.873157, 3.601738, 1, 0, 0, 1, 1,
0.3656544, 1.995901, 0.5625882, 1, 0, 0, 1, 1,
0.3659465, -0.7314517, 4.055668, 0, 0, 0, 1, 1,
0.3668607, 0.5876721, 0.736819, 0, 0, 0, 1, 1,
0.3710703, -0.2971661, 3.270041, 0, 0, 0, 1, 1,
0.3733223, 1.083215, 0.9014987, 0, 0, 0, 1, 1,
0.3744823, -1.611845, 3.063869, 0, 0, 0, 1, 1,
0.3893811, 1.95478, 0.7809715, 0, 0, 0, 1, 1,
0.3902155, -0.04356033, 0.8696926, 0, 0, 0, 1, 1,
0.3934563, 0.1825513, 1.98122, 1, 1, 1, 1, 1,
0.3944458, 2.268377, 0.1461672, 1, 1, 1, 1, 1,
0.3961211, -1.375022, 2.987992, 1, 1, 1, 1, 1,
0.3999681, 0.3780862, -0.286468, 1, 1, 1, 1, 1,
0.4017414, 0.4739882, -0.3582453, 1, 1, 1, 1, 1,
0.4032823, -1.12372, 2.133472, 1, 1, 1, 1, 1,
0.4040967, -0.5205792, 1.384269, 1, 1, 1, 1, 1,
0.4050203, 1.335526, 0.0775173, 1, 1, 1, 1, 1,
0.4051878, 2.576485, 1.131553, 1, 1, 1, 1, 1,
0.4072448, -0.1016485, 1.659601, 1, 1, 1, 1, 1,
0.4119168, -2.664017, 2.042292, 1, 1, 1, 1, 1,
0.415451, -0.9067433, 2.847203, 1, 1, 1, 1, 1,
0.416637, -0.3720434, 2.423862, 1, 1, 1, 1, 1,
0.4171837, 1.245926, 0.1858201, 1, 1, 1, 1, 1,
0.4172506, -1.042241, 4.868696, 1, 1, 1, 1, 1,
0.422881, -0.2742572, 2.074616, 0, 0, 1, 1, 1,
0.4353506, -0.03239344, 1.688343, 1, 0, 0, 1, 1,
0.4364466, 0.3535609, -0.01249372, 1, 0, 0, 1, 1,
0.4394734, 0.2088591, 0.1447449, 1, 0, 0, 1, 1,
0.4398033, 0.5422044, 1.411758, 1, 0, 0, 1, 1,
0.4494397, -2.343002, 2.624581, 1, 0, 0, 1, 1,
0.4544543, -2.552183, 2.013598, 0, 0, 0, 1, 1,
0.4545356, -0.471384, 3.982087, 0, 0, 0, 1, 1,
0.4562562, 1.222214, 0.5402998, 0, 0, 0, 1, 1,
0.4569657, 1.297771, 0.739997, 0, 0, 0, 1, 1,
0.4575714, 1.147537, -1.361504, 0, 0, 0, 1, 1,
0.4594085, 0.6617815, 0.7804328, 0, 0, 0, 1, 1,
0.4641786, 1.440046, 1.279063, 0, 0, 0, 1, 1,
0.4700974, 0.362242, -0.4850909, 1, 1, 1, 1, 1,
0.4729115, 1.253511, 0.08786526, 1, 1, 1, 1, 1,
0.4784862, 0.03510109, 1.478812, 1, 1, 1, 1, 1,
0.481068, -0.7639087, 2.504122, 1, 1, 1, 1, 1,
0.4877163, -2.224328, 3.486172, 1, 1, 1, 1, 1,
0.4878885, 1.044269, -0.7373357, 1, 1, 1, 1, 1,
0.4915469, 0.4659149, 1.385766, 1, 1, 1, 1, 1,
0.4953378, 0.03659512, 0.8342416, 1, 1, 1, 1, 1,
0.5044034, -0.5674019, 2.135703, 1, 1, 1, 1, 1,
0.5083156, -1.033823, 2.005706, 1, 1, 1, 1, 1,
0.5131845, -1.405453, 4.303825, 1, 1, 1, 1, 1,
0.5141217, 0.2384469, 1.828222, 1, 1, 1, 1, 1,
0.5205459, -0.3430775, 2.443946, 1, 1, 1, 1, 1,
0.5247123, -0.9671754, 2.80742, 1, 1, 1, 1, 1,
0.5264065, 1.015866, 1.121587, 1, 1, 1, 1, 1,
0.5304474, -0.6094977, 3.441968, 0, 0, 1, 1, 1,
0.5311018, 0.261603, 0.109284, 1, 0, 0, 1, 1,
0.5353758, 0.149953, -0.6432855, 1, 0, 0, 1, 1,
0.5450758, -0.6322424, 2.315651, 1, 0, 0, 1, 1,
0.5456625, 0.1985745, 2.226464, 1, 0, 0, 1, 1,
0.5471216, 0.2543154, 0.003346824, 1, 0, 0, 1, 1,
0.5479502, 0.06946228, 0.6249717, 0, 0, 0, 1, 1,
0.549849, 1.56098, -1.058486, 0, 0, 0, 1, 1,
0.5523314, 0.9897432, -0.03172017, 0, 0, 0, 1, 1,
0.5576897, 0.03446967, 0.8103397, 0, 0, 0, 1, 1,
0.5589841, 0.06958336, -0.3683673, 0, 0, 0, 1, 1,
0.5594758, -0.4464594, 3.344095, 0, 0, 0, 1, 1,
0.5605575, -1.17775, 1.345827, 0, 0, 0, 1, 1,
0.561955, -0.2426569, 0.9563638, 1, 1, 1, 1, 1,
0.5630051, -0.1114797, 4.121875, 1, 1, 1, 1, 1,
0.5651095, -1.965105, 3.502101, 1, 1, 1, 1, 1,
0.5664855, -1.269556, 3.566333, 1, 1, 1, 1, 1,
0.5666343, 0.2268959, 2.425342, 1, 1, 1, 1, 1,
0.5675694, 0.394405, -0.2931566, 1, 1, 1, 1, 1,
0.5693165, 1.384759, 1.089772, 1, 1, 1, 1, 1,
0.5816643, 0.9066841, 1.820361, 1, 1, 1, 1, 1,
0.5820701, 0.152217, 0.02326008, 1, 1, 1, 1, 1,
0.5843489, -0.8195249, 2.376619, 1, 1, 1, 1, 1,
0.5886943, 1.911343, -0.8828663, 1, 1, 1, 1, 1,
0.5902788, -0.1404727, 1.58252, 1, 1, 1, 1, 1,
0.5915462, 0.8188155, 0.3668159, 1, 1, 1, 1, 1,
0.5952796, -0.8570519, 2.816746, 1, 1, 1, 1, 1,
0.5969364, -0.8260936, 3.831022, 1, 1, 1, 1, 1,
0.605926, 0.1987478, -0.8073542, 0, 0, 1, 1, 1,
0.6092403, -1.326243, 1.130044, 1, 0, 0, 1, 1,
0.6117591, 0.2633569, 0.4845703, 1, 0, 0, 1, 1,
0.621435, -1.226242, 1.835714, 1, 0, 0, 1, 1,
0.6253433, 0.3362248, 0.9418699, 1, 0, 0, 1, 1,
0.6272099, -0.8662449, 3.249824, 1, 0, 0, 1, 1,
0.6272889, -0.1383539, 0.8426834, 0, 0, 0, 1, 1,
0.6342476, 1.41376, -0.02152066, 0, 0, 0, 1, 1,
0.6382297, 0.9931653, -0.2028677, 0, 0, 0, 1, 1,
0.6432666, 0.4226706, 0.4654133, 0, 0, 0, 1, 1,
0.6443841, -0.0594382, 1.126251, 0, 0, 0, 1, 1,
0.6461853, 1.268638, -0.3731489, 0, 0, 0, 1, 1,
0.651557, 0.1446538, 1.316622, 0, 0, 0, 1, 1,
0.654381, 0.6560453, -0.6168461, 1, 1, 1, 1, 1,
0.6569409, -0.0030083, 2.464806, 1, 1, 1, 1, 1,
0.657958, 1.680191, 1.435302, 1, 1, 1, 1, 1,
0.6604968, 0.2502456, 1.723487, 1, 1, 1, 1, 1,
0.6737531, 0.01198184, 4.079067, 1, 1, 1, 1, 1,
0.6749746, -2.634598, 1.351096, 1, 1, 1, 1, 1,
0.6762608, 1.5219, 1.952002, 1, 1, 1, 1, 1,
0.6763236, -0.42431, 3.14243, 1, 1, 1, 1, 1,
0.6783311, 0.3614106, 2.03598, 1, 1, 1, 1, 1,
0.6793208, 0.2882148, 1.299225, 1, 1, 1, 1, 1,
0.6824107, 0.239082, 0.8721403, 1, 1, 1, 1, 1,
0.6852393, 0.5872238, 1.697722, 1, 1, 1, 1, 1,
0.686545, -2.010893, 2.801044, 1, 1, 1, 1, 1,
0.6897891, -1.119765, 2.056816, 1, 1, 1, 1, 1,
0.6910907, 1.10281, 1.552434, 1, 1, 1, 1, 1,
0.6935495, -0.1973527, 0.5992267, 0, 0, 1, 1, 1,
0.699937, 1.248641, -0.09165075, 1, 0, 0, 1, 1,
0.7003778, 0.2751305, 1.779987, 1, 0, 0, 1, 1,
0.7005242, 0.2032992, 3.132466, 1, 0, 0, 1, 1,
0.7016401, 1.273032, -0.877857, 1, 0, 0, 1, 1,
0.7046754, -0.2752186, 2.024408, 1, 0, 0, 1, 1,
0.7058805, 2.132859, 1.278016, 0, 0, 0, 1, 1,
0.7074677, -2.038665, 2.291877, 0, 0, 0, 1, 1,
0.7076542, 1.471233, 0.585907, 0, 0, 0, 1, 1,
0.7110398, -0.4960824, 2.093078, 0, 0, 0, 1, 1,
0.7166723, 0.2661417, 1.745062, 0, 0, 0, 1, 1,
0.7199177, -0.9035335, 1.940028, 0, 0, 0, 1, 1,
0.7226712, -0.5820299, 1.368638, 0, 0, 0, 1, 1,
0.7227746, -0.5533291, -0.005339548, 1, 1, 1, 1, 1,
0.7233899, 0.1445348, 1.600039, 1, 1, 1, 1, 1,
0.7307003, 0.5947511, 1.549406, 1, 1, 1, 1, 1,
0.7330637, 0.1640632, 2.496598, 1, 1, 1, 1, 1,
0.736385, 1.051585, -0.8982476, 1, 1, 1, 1, 1,
0.7406589, 0.1418456, 0.3789509, 1, 1, 1, 1, 1,
0.7448326, -0.3290753, 1.134056, 1, 1, 1, 1, 1,
0.7456768, 0.6051921, 0.6822457, 1, 1, 1, 1, 1,
0.7468442, -2.135184, 2.554422, 1, 1, 1, 1, 1,
0.7483129, 0.5245103, 0.9722367, 1, 1, 1, 1, 1,
0.7517741, 0.5700856, -0.4946283, 1, 1, 1, 1, 1,
0.7553456, -1.579774, 2.732586, 1, 1, 1, 1, 1,
0.7571723, -0.1848217, 2.4028, 1, 1, 1, 1, 1,
0.7670547, -1.454094, 2.088052, 1, 1, 1, 1, 1,
0.7696403, 0.5183461, 2.016641, 1, 1, 1, 1, 1,
0.7867225, -0.9193795, 3.215835, 0, 0, 1, 1, 1,
0.7885066, 0.7076757, 2.407445, 1, 0, 0, 1, 1,
0.7947736, -0.8278847, 1.251095, 1, 0, 0, 1, 1,
0.8024032, 0.6324518, 2.723324, 1, 0, 0, 1, 1,
0.8052579, -0.05299027, 0.3943457, 1, 0, 0, 1, 1,
0.8133326, -1.792551, 2.657096, 1, 0, 0, 1, 1,
0.8145138, 0.08500762, 1.484723, 0, 0, 0, 1, 1,
0.8154603, 1.691752, 0.9830438, 0, 0, 0, 1, 1,
0.8222318, 0.1625991, 1.057361, 0, 0, 0, 1, 1,
0.8333062, 0.5455355, -0.6435016, 0, 0, 0, 1, 1,
0.8366555, -0.4121138, 2.763604, 0, 0, 0, 1, 1,
0.8375971, -0.8210773, 1.096487, 0, 0, 0, 1, 1,
0.8458192, 0.6468031, 2.038316, 0, 0, 0, 1, 1,
0.8566697, -0.8652554, 2.178179, 1, 1, 1, 1, 1,
0.8576717, -1.127665, 4.859247, 1, 1, 1, 1, 1,
0.8581022, 0.1052246, 0.8405271, 1, 1, 1, 1, 1,
0.8585594, 2.373443, 0.8819172, 1, 1, 1, 1, 1,
0.8591022, -0.3919041, 1.814109, 1, 1, 1, 1, 1,
0.8602657, -0.4608465, 1.831204, 1, 1, 1, 1, 1,
0.8607659, 3.810688, 0.6623867, 1, 1, 1, 1, 1,
0.8612763, 0.2368677, 1.949964, 1, 1, 1, 1, 1,
0.8641031, -0.5863701, 1.385063, 1, 1, 1, 1, 1,
0.8744069, -2.252096, 3.729513, 1, 1, 1, 1, 1,
0.8780021, 1.653571, 0.9804152, 1, 1, 1, 1, 1,
0.8819903, -0.494534, 1.020376, 1, 1, 1, 1, 1,
0.8822758, -0.9244861, 5.011168, 1, 1, 1, 1, 1,
0.8825744, -0.8478517, 1.268015, 1, 1, 1, 1, 1,
0.890391, -3.564847e-05, 0.03588971, 1, 1, 1, 1, 1,
0.8912484, -0.1372968, 2.088993, 0, 0, 1, 1, 1,
0.8945997, -1.180882, 2.335033, 1, 0, 0, 1, 1,
0.8973005, -0.6953621, 2.179884, 1, 0, 0, 1, 1,
0.9007517, -0.8186892, 3.512341, 1, 0, 0, 1, 1,
0.9025345, -0.8109733, 3.141716, 1, 0, 0, 1, 1,
0.9033616, 1.263693, 1.118009, 1, 0, 0, 1, 1,
0.9036565, -0.5041524, 2.036608, 0, 0, 0, 1, 1,
0.9059551, -1.210876, 1.566262, 0, 0, 0, 1, 1,
0.9128011, -0.9616655, 2.688272, 0, 0, 0, 1, 1,
0.9183882, -0.2707417, 3.603038, 0, 0, 0, 1, 1,
0.9202659, -0.2053742, 1.75011, 0, 0, 0, 1, 1,
0.9208699, -0.3007811, 1.199517, 0, 0, 0, 1, 1,
0.9227146, -0.6322719, 0.3556891, 0, 0, 0, 1, 1,
0.9265629, -0.9566257, 1.282472, 1, 1, 1, 1, 1,
0.9298522, -0.3245274, 1.69073, 1, 1, 1, 1, 1,
0.9385003, -1.319444, 3.108694, 1, 1, 1, 1, 1,
0.9406711, -1.431938, 3.04562, 1, 1, 1, 1, 1,
0.9559975, -0.5505723, 0.5728188, 1, 1, 1, 1, 1,
0.9597561, 1.612244, -0.1270741, 1, 1, 1, 1, 1,
0.9616693, 0.1101868, 0.9930618, 1, 1, 1, 1, 1,
0.9697402, 0.8443822, 1.760091, 1, 1, 1, 1, 1,
0.9785088, -1.603352, 3.712774, 1, 1, 1, 1, 1,
0.9844829, 0.3445583, 2.337877, 1, 1, 1, 1, 1,
0.9892585, 0.9449987, 1.062975, 1, 1, 1, 1, 1,
0.9978735, 0.749172, 0.1672464, 1, 1, 1, 1, 1,
0.999817, -1.528407, 4.223106, 1, 1, 1, 1, 1,
1.005262, -0.9786816, 2.480827, 1, 1, 1, 1, 1,
1.005711, -1.057391, 2.465816, 1, 1, 1, 1, 1,
1.014847, -0.9706063, 2.627209, 0, 0, 1, 1, 1,
1.017245, -0.2888984, 1.61669, 1, 0, 0, 1, 1,
1.018056, -0.4518104, 0.9331461, 1, 0, 0, 1, 1,
1.018955, -0.3255509, 4.115635, 1, 0, 0, 1, 1,
1.022001, 0.02442994, 2.807807, 1, 0, 0, 1, 1,
1.024887, -0.3901586, 2.506448, 1, 0, 0, 1, 1,
1.027878, 0.2111171, 0.9459875, 0, 0, 0, 1, 1,
1.0345, -1.213368, 2.554566, 0, 0, 0, 1, 1,
1.038236, 0.5442287, 0.07821859, 0, 0, 0, 1, 1,
1.046108, -1.136042, 2.865962, 0, 0, 0, 1, 1,
1.048339, 0.55845, 0.2000371, 0, 0, 0, 1, 1,
1.050034, -0.2645106, 2.016124, 0, 0, 0, 1, 1,
1.052408, -0.829425, 3.975898, 0, 0, 0, 1, 1,
1.053349, 1.261888, 2.361732, 1, 1, 1, 1, 1,
1.053974, 0.08026928, 1.076968, 1, 1, 1, 1, 1,
1.055048, 0.1755279, 1.797297, 1, 1, 1, 1, 1,
1.068914, 0.9961525, 0.8486091, 1, 1, 1, 1, 1,
1.069955, 0.02873775, 2.126529, 1, 1, 1, 1, 1,
1.079845, -0.2816429, 3.79832, 1, 1, 1, 1, 1,
1.090137, 0.3492781, -0.34284, 1, 1, 1, 1, 1,
1.100656, 2.012444, 1.165469, 1, 1, 1, 1, 1,
1.101399, 0.9581663, -0.2732802, 1, 1, 1, 1, 1,
1.103023, -0.3489509, 2.419471, 1, 1, 1, 1, 1,
1.108595, -1.884737, 2.82558, 1, 1, 1, 1, 1,
1.116647, 0.2003459, 1.807897, 1, 1, 1, 1, 1,
1.119552, 0.08315144, 1.679884, 1, 1, 1, 1, 1,
1.134111, -1.469862, 2.320014, 1, 1, 1, 1, 1,
1.14281, -0.3764648, 2.870439, 1, 1, 1, 1, 1,
1.149075, -0.6570743, 1.777254, 0, 0, 1, 1, 1,
1.155812, 0.1041584, 1.58553, 1, 0, 0, 1, 1,
1.160028, -0.4647652, 2.181468, 1, 0, 0, 1, 1,
1.162722, -2.1646, 2.020021, 1, 0, 0, 1, 1,
1.164159, 0.5493115, 1.448313, 1, 0, 0, 1, 1,
1.166299, -0.9974917, 2.208777, 1, 0, 0, 1, 1,
1.169858, -0.8555148, 3.467169, 0, 0, 0, 1, 1,
1.17048, -0.1137921, 3.066723, 0, 0, 0, 1, 1,
1.17223, 0.2342146, 0.7679745, 0, 0, 0, 1, 1,
1.175621, 0.8038819, -0.6057228, 0, 0, 0, 1, 1,
1.176296, -2.216764, 4.106936, 0, 0, 0, 1, 1,
1.179479, 0.01279966, 1.944218, 0, 0, 0, 1, 1,
1.183241, 0.04679673, 3.328181, 0, 0, 0, 1, 1,
1.183616, 1.147395, 2.387281, 1, 1, 1, 1, 1,
1.187637, 0.616945, 1.766879, 1, 1, 1, 1, 1,
1.187743, -0.7208986, 2.193815, 1, 1, 1, 1, 1,
1.192614, 1.950637, -0.2527834, 1, 1, 1, 1, 1,
1.195421, -0.4023537, 1.806125, 1, 1, 1, 1, 1,
1.201904, 2.289997, 0.126117, 1, 1, 1, 1, 1,
1.213014, 0.6039559, 0.7617506, 1, 1, 1, 1, 1,
1.218416, 0.6403174, 0.9657659, 1, 1, 1, 1, 1,
1.227067, 0.435541, 2.604974, 1, 1, 1, 1, 1,
1.227619, 1.377549, 0.1054886, 1, 1, 1, 1, 1,
1.230005, -1.113856, 3.445224, 1, 1, 1, 1, 1,
1.238559, -0.05045817, -0.6329448, 1, 1, 1, 1, 1,
1.241013, -0.5567269, 4.77346, 1, 1, 1, 1, 1,
1.245953, 0.4631433, 0.5591959, 1, 1, 1, 1, 1,
1.251592, 0.7138277, 0.8663085, 1, 1, 1, 1, 1,
1.25642, 0.3974218, 1.086809, 0, 0, 1, 1, 1,
1.260951, -0.2497574, 1.766013, 1, 0, 0, 1, 1,
1.261353, -0.5014797, 2.723865, 1, 0, 0, 1, 1,
1.26302, 1.067441, 0.1711117, 1, 0, 0, 1, 1,
1.263759, -0.4812213, 1.926568, 1, 0, 0, 1, 1,
1.27136, -1.76205, 2.806964, 1, 0, 0, 1, 1,
1.271497, 0.7795057, -0.5555438, 0, 0, 0, 1, 1,
1.285617, -1.310792, 2.222582, 0, 0, 0, 1, 1,
1.292948, 0.29192, 0.3982288, 0, 0, 0, 1, 1,
1.298317, 0.7206317, 1.957977, 0, 0, 0, 1, 1,
1.299585, 0.721772, 1.309801, 0, 0, 0, 1, 1,
1.32341, -0.06950118, 0.9172278, 0, 0, 0, 1, 1,
1.337132, -0.1172664, 1.653035, 0, 0, 0, 1, 1,
1.337431, -0.8592744, 2.575838, 1, 1, 1, 1, 1,
1.343301, -0.5370137, 3.863784, 1, 1, 1, 1, 1,
1.345712, -1.391484, 2.257665, 1, 1, 1, 1, 1,
1.345812, 1.074101, 0.049077, 1, 1, 1, 1, 1,
1.349129, -1.942841, 2.969364, 1, 1, 1, 1, 1,
1.35167, -0.6554844, 1.610992, 1, 1, 1, 1, 1,
1.358964, -0.6028994, 1.188906, 1, 1, 1, 1, 1,
1.364515, 0.5802924, 0.9176397, 1, 1, 1, 1, 1,
1.378983, -0.7910272, 1.764852, 1, 1, 1, 1, 1,
1.396924, 0.7219507, 2.27612, 1, 1, 1, 1, 1,
1.408282, 0.002366581, 1.842973, 1, 1, 1, 1, 1,
1.419901, -0.5093826, 2.309175, 1, 1, 1, 1, 1,
1.437044, 0.3025357, 1.753057, 1, 1, 1, 1, 1,
1.43899, -0.5363601, 3.420227, 1, 1, 1, 1, 1,
1.448557, 1.460729, 1.38261, 1, 1, 1, 1, 1,
1.450542, -1.195104, 1.859257, 0, 0, 1, 1, 1,
1.450885, -0.4087059, 2.679933, 1, 0, 0, 1, 1,
1.453953, 0.178893, 1.35754, 1, 0, 0, 1, 1,
1.455213, 1.961784, 0.7742577, 1, 0, 0, 1, 1,
1.47009, -0.3206521, 3.501188, 1, 0, 0, 1, 1,
1.473682, -0.3661966, 2.049619, 1, 0, 0, 1, 1,
1.495275, 1.64924, 0.05510715, 0, 0, 0, 1, 1,
1.496677, -0.06455916, 0.3126081, 0, 0, 0, 1, 1,
1.507753, -0.5864879, 2.139271, 0, 0, 0, 1, 1,
1.51628, -0.08039534, 0.5779496, 0, 0, 0, 1, 1,
1.51838, 0.7390984, 1.296256, 0, 0, 0, 1, 1,
1.51982, -1.166369, 0.9562261, 0, 0, 0, 1, 1,
1.530802, 0.5714255, 1.937779, 0, 0, 0, 1, 1,
1.533447, -1.365289, 4.260293, 1, 1, 1, 1, 1,
1.543242, 1.76441, 0.4144128, 1, 1, 1, 1, 1,
1.54657, -0.3110272, 0.2378496, 1, 1, 1, 1, 1,
1.56718, 0.5626851, 1.267731, 1, 1, 1, 1, 1,
1.569779, 0.6319274, 1.501343, 1, 1, 1, 1, 1,
1.576115, -0.9402269, 1.818567, 1, 1, 1, 1, 1,
1.585592, 1.126157, 0.7043186, 1, 1, 1, 1, 1,
1.587935, 0.1533655, 1.868586, 1, 1, 1, 1, 1,
1.603034, -2.144747, 3.22393, 1, 1, 1, 1, 1,
1.617637, 0.7675018, -0.7559546, 1, 1, 1, 1, 1,
1.626339, -0.240123, 3.733196, 1, 1, 1, 1, 1,
1.629354, -0.04597308, 2.840714, 1, 1, 1, 1, 1,
1.641527, -0.3757434, 2.613511, 1, 1, 1, 1, 1,
1.64832, -1.303762, 0.3861764, 1, 1, 1, 1, 1,
1.648523, 0.4003009, 0.1636855, 1, 1, 1, 1, 1,
1.674171, -0.7603562, 1.738809, 0, 0, 1, 1, 1,
1.686497, -0.5895196, 1.570748, 1, 0, 0, 1, 1,
1.688452, 1.534272, 1.737096, 1, 0, 0, 1, 1,
1.693143, 0.7203098, 1.048502, 1, 0, 0, 1, 1,
1.696733, 0.7308978, 2.27069, 1, 0, 0, 1, 1,
1.712336, -0.9888064, 1.697382, 1, 0, 0, 1, 1,
1.721688, -2.218843, 3.670321, 0, 0, 0, 1, 1,
1.734047, 0.5434079, 1.072453, 0, 0, 0, 1, 1,
1.749687, -0.5861884, 2.886357, 0, 0, 0, 1, 1,
1.756687, -0.3051969, 2.436171, 0, 0, 0, 1, 1,
1.756719, -0.07878485, 3.506285, 0, 0, 0, 1, 1,
1.764489, -0.4703509, 2.089137, 0, 0, 0, 1, 1,
1.766041, -0.1431466, 2.39222, 0, 0, 0, 1, 1,
1.782537, -0.5085773, 1.837234, 1, 1, 1, 1, 1,
1.786117, -1.013836, 2.973621, 1, 1, 1, 1, 1,
1.790353, -0.359622, 0.9857945, 1, 1, 1, 1, 1,
1.791161, 0.3850346, 0.5161604, 1, 1, 1, 1, 1,
1.798855, -1.752122, 3.699799, 1, 1, 1, 1, 1,
1.80148, 1.369146, 0.9126762, 1, 1, 1, 1, 1,
1.806784, -1.077522, 0.9717445, 1, 1, 1, 1, 1,
1.817091, -0.04070842, 2.435103, 1, 1, 1, 1, 1,
1.848945, -0.3684471, 2.327528, 1, 1, 1, 1, 1,
1.865804, 2.481659, 1.838693, 1, 1, 1, 1, 1,
1.898745, 0.216248, 2.266789, 1, 1, 1, 1, 1,
1.906104, 0.5040108, 1.098025, 1, 1, 1, 1, 1,
1.922429, 0.8073795, -0.2013322, 1, 1, 1, 1, 1,
1.933058, -0.2884644, 0.4241185, 1, 1, 1, 1, 1,
1.940489, -0.09458162, -0.190288, 1, 1, 1, 1, 1,
1.940947, 1.778534, 0.4454757, 0, 0, 1, 1, 1,
1.945604, 0.7190381, 0.1510243, 1, 0, 0, 1, 1,
1.94636, 0.2148925, 3.437693, 1, 0, 0, 1, 1,
1.983406, -0.3405107, 2.051202, 1, 0, 0, 1, 1,
1.987816, -0.9792497, 2.482206, 1, 0, 0, 1, 1,
1.994833, -1.875321, 2.613428, 1, 0, 0, 1, 1,
2.051989, 0.7666245, 0.6694908, 0, 0, 0, 1, 1,
2.052147, 0.4754553, 1.01981, 0, 0, 0, 1, 1,
2.081195, 0.1339978, 1.888129, 0, 0, 0, 1, 1,
2.082286, -1.038444, 1.078918, 0, 0, 0, 1, 1,
2.088985, -0.2962991, 1.743536, 0, 0, 0, 1, 1,
2.103301, 0.5874984, 1.225702, 0, 0, 0, 1, 1,
2.14504, -0.03697768, 1.929965, 0, 0, 0, 1, 1,
2.229774, -0.6013578, -1.190954, 1, 1, 1, 1, 1,
2.289155, -0.1465052, 2.186943, 1, 1, 1, 1, 1,
2.296041, -0.1515908, 1.261938, 1, 1, 1, 1, 1,
2.394631, 0.09457295, 1.541858, 1, 1, 1, 1, 1,
2.803386, 0.2417366, 2.015417, 1, 1, 1, 1, 1,
2.806079, 0.2112443, 2.205727, 1, 1, 1, 1, 1,
3.213344, 2.501513, 0.5650235, 1, 1, 1, 1, 1
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
var radius = 9.897708;
var distance = 34.76528;
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
mvMatrix.translate( -0.2494277, -0.3130724, -0.1182127 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76528);
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
