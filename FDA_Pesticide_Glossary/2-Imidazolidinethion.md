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
-3.150647, -0.1151147, -1.000321, 1, 0, 0, 1,
-2.955012, -0.749953, -0.8073575, 1, 0.007843138, 0, 1,
-2.639684, 0.07446584, -1.498741, 1, 0.01176471, 0, 1,
-2.612378, 1.52971, -1.977839, 1, 0.01960784, 0, 1,
-2.56373, -0.5263846, -1.878642, 1, 0.02352941, 0, 1,
-2.504011, -0.461953, -0.4090377, 1, 0.03137255, 0, 1,
-2.487601, -1.763311, -2.764908, 1, 0.03529412, 0, 1,
-2.475683, 0.8248864, -2.481616, 1, 0.04313726, 0, 1,
-2.432127, 1.17187, -1.650733, 1, 0.04705882, 0, 1,
-2.243758, 0.02570349, -2.421975, 1, 0.05490196, 0, 1,
-2.160058, -2.554299, -4.736856, 1, 0.05882353, 0, 1,
-2.154869, -0.7377671, -1.797727, 1, 0.06666667, 0, 1,
-2.135111, -1.218399, -2.003302, 1, 0.07058824, 0, 1,
-2.12367, -0.190196, -1.509645, 1, 0.07843138, 0, 1,
-2.117245, -0.6405929, -2.187802, 1, 0.08235294, 0, 1,
-2.086747, 0.4473644, -1.55444, 1, 0.09019608, 0, 1,
-2.072665, 0.7921816, -2.040837, 1, 0.09411765, 0, 1,
-2.047273, -1.778249, -1.877074, 1, 0.1019608, 0, 1,
-2.040046, 0.4113796, -0.3167251, 1, 0.1098039, 0, 1,
-2.021946, 0.7123863, -1.990289, 1, 0.1137255, 0, 1,
-2.008893, -1.128328, -2.504596, 1, 0.1215686, 0, 1,
-1.99398, 1.494803, -1.62184, 1, 0.1254902, 0, 1,
-1.991671, 1.674325, -1.40054, 1, 0.1333333, 0, 1,
-1.983539, -0.9340855, -3.92906, 1, 0.1372549, 0, 1,
-1.983177, -2.177845, -1.675916, 1, 0.145098, 0, 1,
-1.97507, 1.011252, -1.122316, 1, 0.1490196, 0, 1,
-1.96298, -2.098789, -4.035719, 1, 0.1568628, 0, 1,
-1.937684, -1.258386, -0.696909, 1, 0.1607843, 0, 1,
-1.931021, -0.6569761, -0.987875, 1, 0.1686275, 0, 1,
-1.923309, 0.1416393, -1.564536, 1, 0.172549, 0, 1,
-1.912514, 0.3593838, -3.618431, 1, 0.1803922, 0, 1,
-1.888941, -0.7916293, -2.887743, 1, 0.1843137, 0, 1,
-1.855441, 0.8064678, -0.9788045, 1, 0.1921569, 0, 1,
-1.839878, 0.6766655, -0.8551397, 1, 0.1960784, 0, 1,
-1.837762, 0.7783616, -2.583045, 1, 0.2039216, 0, 1,
-1.823892, -0.1745579, -1.082039, 1, 0.2117647, 0, 1,
-1.798135, -2.149512, -3.72568, 1, 0.2156863, 0, 1,
-1.758388, 0.03134994, -3.188452, 1, 0.2235294, 0, 1,
-1.749849, -1.173911, -2.150414, 1, 0.227451, 0, 1,
-1.745349, -0.5324665, -1.50736, 1, 0.2352941, 0, 1,
-1.739698, -1.549276, -3.12004, 1, 0.2392157, 0, 1,
-1.733729, 0.1744166, -3.013978, 1, 0.2470588, 0, 1,
-1.725953, -0.0471111, -1.112817, 1, 0.2509804, 0, 1,
-1.725122, -0.4303516, -2.497932, 1, 0.2588235, 0, 1,
-1.706732, -0.7831553, -2.615418, 1, 0.2627451, 0, 1,
-1.701942, -0.6338183, -3.421425, 1, 0.2705882, 0, 1,
-1.696342, -1.433376, -0.5704023, 1, 0.2745098, 0, 1,
-1.677723, -0.5653545, -0.9654004, 1, 0.282353, 0, 1,
-1.674744, 0.7594488, -0.9801956, 1, 0.2862745, 0, 1,
-1.670207, -0.2320216, -2.782075, 1, 0.2941177, 0, 1,
-1.661882, -1.180316, -1.436345, 1, 0.3019608, 0, 1,
-1.637484, -0.6773625, -1.452632, 1, 0.3058824, 0, 1,
-1.626929, 1.105094, -1.525675, 1, 0.3137255, 0, 1,
-1.624873, 0.1906862, -1.21101, 1, 0.3176471, 0, 1,
-1.619983, -0.3889029, -3.652402, 1, 0.3254902, 0, 1,
-1.616274, 1.610672, -0.7146264, 1, 0.3294118, 0, 1,
-1.608541, 0.0949912, -2.272684, 1, 0.3372549, 0, 1,
-1.562218, -0.1684231, -3.041856, 1, 0.3411765, 0, 1,
-1.549933, -0.008043617, -1.143442, 1, 0.3490196, 0, 1,
-1.546644, -0.148267, -2.230824, 1, 0.3529412, 0, 1,
-1.542752, -0.8424947, -2.496302, 1, 0.3607843, 0, 1,
-1.533735, 2.131283, -1.500172, 1, 0.3647059, 0, 1,
-1.530934, -0.4323468, -2.197819, 1, 0.372549, 0, 1,
-1.504969, 0.6962729, -1.454163, 1, 0.3764706, 0, 1,
-1.503991, 0.08130158, -1.783958, 1, 0.3843137, 0, 1,
-1.502108, -0.3566119, -1.115422, 1, 0.3882353, 0, 1,
-1.48913, -1.552199, -2.644052, 1, 0.3960784, 0, 1,
-1.486968, -0.3702915, -1.89964, 1, 0.4039216, 0, 1,
-1.471024, 0.4919298, -1.81236, 1, 0.4078431, 0, 1,
-1.470485, -1.30822, -3.187364, 1, 0.4156863, 0, 1,
-1.465711, 1.900046, 0.9033013, 1, 0.4196078, 0, 1,
-1.465137, -0.1278245, -2.375461, 1, 0.427451, 0, 1,
-1.454913, 0.2676432, -1.432354, 1, 0.4313726, 0, 1,
-1.451028, -0.9698725, -0.2934009, 1, 0.4392157, 0, 1,
-1.447989, 0.2988983, -2.272726, 1, 0.4431373, 0, 1,
-1.439972, 1.769797, -1.646153, 1, 0.4509804, 0, 1,
-1.43333, -0.3747925, -2.532488, 1, 0.454902, 0, 1,
-1.430602, -1.575618, -2.215864, 1, 0.4627451, 0, 1,
-1.425297, 0.8532944, -0.9294237, 1, 0.4666667, 0, 1,
-1.422948, -1.443766, -3.857703, 1, 0.4745098, 0, 1,
-1.422536, -1.360228, -2.7062, 1, 0.4784314, 0, 1,
-1.410357, 0.2240867, -0.4767102, 1, 0.4862745, 0, 1,
-1.40801, 2.54881, -0.4752026, 1, 0.4901961, 0, 1,
-1.406966, 0.7710176, -1.188295, 1, 0.4980392, 0, 1,
-1.384004, -0.3795487, -1.755344, 1, 0.5058824, 0, 1,
-1.370059, -0.3794233, -3.466383, 1, 0.509804, 0, 1,
-1.365147, 1.319231, -1.243116, 1, 0.5176471, 0, 1,
-1.354623, 1.057817, 0.761225, 1, 0.5215687, 0, 1,
-1.349543, 1.306806, -0.564483, 1, 0.5294118, 0, 1,
-1.346758, -0.4610733, -2.304156, 1, 0.5333334, 0, 1,
-1.341174, -1.25273, -2.319141, 1, 0.5411765, 0, 1,
-1.339561, -0.3333458, -1.386408, 1, 0.5450981, 0, 1,
-1.333497, -0.009537796, -3.767836, 1, 0.5529412, 0, 1,
-1.331029, 0.4893089, 0.3209896, 1, 0.5568628, 0, 1,
-1.329345, 1.266185, -0.7069728, 1, 0.5647059, 0, 1,
-1.316673, -1.811075, -0.8367812, 1, 0.5686275, 0, 1,
-1.303444, 0.2783423, -1.225982, 1, 0.5764706, 0, 1,
-1.272012, -0.5965083, -1.857154, 1, 0.5803922, 0, 1,
-1.268673, -0.6157043, -1.48953, 1, 0.5882353, 0, 1,
-1.243888, -0.2712878, -1.866781, 1, 0.5921569, 0, 1,
-1.234169, 0.5715664, -0.4195828, 1, 0.6, 0, 1,
-1.220643, -1.55675, -3.919765, 1, 0.6078432, 0, 1,
-1.214168, -0.06698637, -1.517512, 1, 0.6117647, 0, 1,
-1.202211, 1.014163, -1.296301, 1, 0.6196079, 0, 1,
-1.195241, 0.1359288, -0.7852733, 1, 0.6235294, 0, 1,
-1.192712, 0.7416203, -2.033436, 1, 0.6313726, 0, 1,
-1.191468, -0.0681945, -0.7771892, 1, 0.6352941, 0, 1,
-1.186781, 1.120257, 0.2598944, 1, 0.6431373, 0, 1,
-1.182592, -0.6566551, -3.02042, 1, 0.6470588, 0, 1,
-1.182284, 0.01715091, -2.037047, 1, 0.654902, 0, 1,
-1.172029, -0.4823014, -1.268719, 1, 0.6588235, 0, 1,
-1.17087, -2.447229, -1.548322, 1, 0.6666667, 0, 1,
-1.163969, 0.2830065, -0.1093467, 1, 0.6705883, 0, 1,
-1.154789, -0.7108561, -2.205952, 1, 0.6784314, 0, 1,
-1.150664, 1.246689, -1.652607, 1, 0.682353, 0, 1,
-1.149531, 1.750243, -1.021052, 1, 0.6901961, 0, 1,
-1.143616, 0.4661607, -0.192772, 1, 0.6941177, 0, 1,
-1.130409, -0.8001871, -3.210174, 1, 0.7019608, 0, 1,
-1.128134, 0.6369007, -1.205379, 1, 0.7098039, 0, 1,
-1.127626, 2.470916, -0.7467953, 1, 0.7137255, 0, 1,
-1.123341, -0.3600543, -2.348511, 1, 0.7215686, 0, 1,
-1.121793, -1.793227, -2.757172, 1, 0.7254902, 0, 1,
-1.120342, 1.190964, -1.575521, 1, 0.7333333, 0, 1,
-1.117808, 0.331095, 0.6411167, 1, 0.7372549, 0, 1,
-1.11689, 0.3112291, 0.05920204, 1, 0.7450981, 0, 1,
-1.116797, -1.460145, -2.583644, 1, 0.7490196, 0, 1,
-1.10866, 0.5244448, -0.7813241, 1, 0.7568628, 0, 1,
-1.108295, 1.322798, 0.5594807, 1, 0.7607843, 0, 1,
-1.10817, -0.2394012, -0.2738873, 1, 0.7686275, 0, 1,
-1.103817, -0.7973844, -2.062906, 1, 0.772549, 0, 1,
-1.100411, 0.5926821, 0.2494095, 1, 0.7803922, 0, 1,
-1.093903, -0.2667218, -3.104883, 1, 0.7843137, 0, 1,
-1.078625, -0.5916998, -1.861437, 1, 0.7921569, 0, 1,
-1.077384, 0.8487313, -0.3003374, 1, 0.7960784, 0, 1,
-1.069899, 0.6424965, -0.9169718, 1, 0.8039216, 0, 1,
-1.065831, -1.884779, -3.19955, 1, 0.8117647, 0, 1,
-1.064243, -0.7104912, -3.52304, 1, 0.8156863, 0, 1,
-1.062594, -0.4875124, -0.6031392, 1, 0.8235294, 0, 1,
-1.062113, -0.3616954, -1.948714, 1, 0.827451, 0, 1,
-1.049094, 1.135622, -1.178806, 1, 0.8352941, 0, 1,
-1.047366, 1.233969, -1.245666, 1, 0.8392157, 0, 1,
-1.044211, -0.1234093, -0.6652946, 1, 0.8470588, 0, 1,
-1.040145, -1.476654, -1.478495, 1, 0.8509804, 0, 1,
-1.032746, 1.186191, 0.6806647, 1, 0.8588235, 0, 1,
-1.019739, -0.8275114, -2.447677, 1, 0.8627451, 0, 1,
-1.016852, -0.5990081, -2.785298, 1, 0.8705882, 0, 1,
-1.016753, 0.1796516, -3.246897, 1, 0.8745098, 0, 1,
-1.015607, -0.0003979451, -2.003814, 1, 0.8823529, 0, 1,
-1.006983, -0.1012451, -1.421964, 1, 0.8862745, 0, 1,
-1.001796, -1.36039, -3.545369, 1, 0.8941177, 0, 1,
-0.9887888, 1.202031, -1.646586, 1, 0.8980392, 0, 1,
-0.9868973, -0.5549493, -0.8034992, 1, 0.9058824, 0, 1,
-0.9849913, -1.323821, -1.503327, 1, 0.9137255, 0, 1,
-0.9831782, 1.463132, -2.06977, 1, 0.9176471, 0, 1,
-0.9798118, 0.1121216, 0.006025287, 1, 0.9254902, 0, 1,
-0.9772578, 0.8658568, 0.7078122, 1, 0.9294118, 0, 1,
-0.9727845, 0.2036049, -1.230361, 1, 0.9372549, 0, 1,
-0.9711321, 0.5351227, 0.293683, 1, 0.9411765, 0, 1,
-0.9672171, 0.6949037, -1.06387, 1, 0.9490196, 0, 1,
-0.9648092, 0.1160538, -2.478037, 1, 0.9529412, 0, 1,
-0.9645969, -1.312692, -3.016714, 1, 0.9607843, 0, 1,
-0.9614428, -0.1367798, -2.281943, 1, 0.9647059, 0, 1,
-0.9569666, 1.410681, -1.188667, 1, 0.972549, 0, 1,
-0.9427854, 1.446681, -0.2842101, 1, 0.9764706, 0, 1,
-0.9418141, 0.6667156, -1.927808, 1, 0.9843137, 0, 1,
-0.932969, -1.046691, -1.141651, 1, 0.9882353, 0, 1,
-0.9323089, 0.354099, -1.372161, 1, 0.9960784, 0, 1,
-0.9248883, 0.4833606, 0.2740535, 0.9960784, 1, 0, 1,
-0.9234869, 0.2853656, -2.524947, 0.9921569, 1, 0, 1,
-0.9222887, 0.4483082, -1.830308, 0.9843137, 1, 0, 1,
-0.9138028, -0.7532335, -2.365828, 0.9803922, 1, 0, 1,
-0.9123607, -1.265093, -3.177905, 0.972549, 1, 0, 1,
-0.9088233, 0.2952598, -1.188156, 0.9686275, 1, 0, 1,
-0.8999703, 1.129118, -0.6527719, 0.9607843, 1, 0, 1,
-0.8990929, -0.3665818, -0.5970556, 0.9568627, 1, 0, 1,
-0.8973293, -1.508285, -2.116704, 0.9490196, 1, 0, 1,
-0.8912885, -0.08445217, -0.0227728, 0.945098, 1, 0, 1,
-0.8900032, -0.2357896, -2.127549, 0.9372549, 1, 0, 1,
-0.8860947, -1.225314, -2.955159, 0.9333333, 1, 0, 1,
-0.8744664, 0.1340118, -1.975663, 0.9254902, 1, 0, 1,
-0.8737336, 0.4856415, -1.617468, 0.9215686, 1, 0, 1,
-0.8660853, -0.7100214, -2.3033, 0.9137255, 1, 0, 1,
-0.8607873, 0.2605393, -0.7822478, 0.9098039, 1, 0, 1,
-0.8603137, -1.958254, -1.768764, 0.9019608, 1, 0, 1,
-0.8595428, 1.185213, -0.1119865, 0.8941177, 1, 0, 1,
-0.8580238, 0.729747, -2.143711, 0.8901961, 1, 0, 1,
-0.8510242, -1.058674, -3.242872, 0.8823529, 1, 0, 1,
-0.8503078, 1.325058, 0.5272855, 0.8784314, 1, 0, 1,
-0.8495458, -0.8781586, -1.525982, 0.8705882, 1, 0, 1,
-0.8480817, -0.3438157, -2.50549, 0.8666667, 1, 0, 1,
-0.8448968, 0.4949075, -0.1751366, 0.8588235, 1, 0, 1,
-0.8419923, -1.240295, -2.324839, 0.854902, 1, 0, 1,
-0.8378429, -0.3440129, -0.2585368, 0.8470588, 1, 0, 1,
-0.8319184, 0.5218658, -1.852156, 0.8431373, 1, 0, 1,
-0.8271462, 1.042405, -0.5527766, 0.8352941, 1, 0, 1,
-0.8250873, -2.261074, -3.457624, 0.8313726, 1, 0, 1,
-0.8217941, -0.758234, -2.001689, 0.8235294, 1, 0, 1,
-0.8210431, -0.1676468, -1.021395, 0.8196079, 1, 0, 1,
-0.8197585, -0.2149919, -2.333792, 0.8117647, 1, 0, 1,
-0.8187696, -0.4768311, -2.021192, 0.8078431, 1, 0, 1,
-0.8184135, -0.7943286, -0.8882399, 0.8, 1, 0, 1,
-0.8180257, -0.3643226, -2.312319, 0.7921569, 1, 0, 1,
-0.8180253, -0.01335261, -1.219087, 0.7882353, 1, 0, 1,
-0.8156601, 0.2431206, -0.7005571, 0.7803922, 1, 0, 1,
-0.8150853, -0.3629122, -1.370901, 0.7764706, 1, 0, 1,
-0.8037869, 0.3432672, -0.188201, 0.7686275, 1, 0, 1,
-0.802506, -0.2017141, -2.369627, 0.7647059, 1, 0, 1,
-0.8003899, 0.4098509, -0.9995441, 0.7568628, 1, 0, 1,
-0.7996523, -0.8405076, -3.484261, 0.7529412, 1, 0, 1,
-0.7977183, -0.8910434, -1.979143, 0.7450981, 1, 0, 1,
-0.7936075, 0.3852699, -1.048423, 0.7411765, 1, 0, 1,
-0.7919727, 2.0867, 0.5321481, 0.7333333, 1, 0, 1,
-0.7908313, 0.4964973, -0.09845566, 0.7294118, 1, 0, 1,
-0.7880176, -1.176589, -0.3130641, 0.7215686, 1, 0, 1,
-0.7858921, 0.5219108, 0.2026639, 0.7176471, 1, 0, 1,
-0.7838652, 0.701541, -1.272984, 0.7098039, 1, 0, 1,
-0.7837359, -0.6661418, -1.785963, 0.7058824, 1, 0, 1,
-0.7796034, 0.1852155, -0.8013497, 0.6980392, 1, 0, 1,
-0.775772, 0.7693649, -1.019355, 0.6901961, 1, 0, 1,
-0.7719522, 1.566113, -1.011565, 0.6862745, 1, 0, 1,
-0.7707107, 0.7978647, -1.504415, 0.6784314, 1, 0, 1,
-0.7679575, 0.7676435, -1.979571, 0.6745098, 1, 0, 1,
-0.76639, 0.7277257, -0.876467, 0.6666667, 1, 0, 1,
-0.7661434, -2.470293, -3.22391, 0.6627451, 1, 0, 1,
-0.7618676, 1.966079, -1.651503, 0.654902, 1, 0, 1,
-0.7582979, -0.8838902, -4.58994, 0.6509804, 1, 0, 1,
-0.7516063, -0.3664314, -1.046958, 0.6431373, 1, 0, 1,
-0.7506037, 0.5885788, -1.182711, 0.6392157, 1, 0, 1,
-0.749459, -1.79301, -2.452893, 0.6313726, 1, 0, 1,
-0.7488414, -0.1012836, -1.888359, 0.627451, 1, 0, 1,
-0.7474924, 0.5011143, -0.2123448, 0.6196079, 1, 0, 1,
-0.7444695, -1.14373, -2.998699, 0.6156863, 1, 0, 1,
-0.7359882, 1.095825, -1.183007, 0.6078432, 1, 0, 1,
-0.7359278, -1.206222, -0.7286656, 0.6039216, 1, 0, 1,
-0.7344823, 0.7964103, -1.431867, 0.5960785, 1, 0, 1,
-0.7337534, 1.487626, -0.2827921, 0.5882353, 1, 0, 1,
-0.7308095, 0.1180438, -1.537228, 0.5843138, 1, 0, 1,
-0.7291033, -0.216514, -4.093877, 0.5764706, 1, 0, 1,
-0.7270103, -0.2726989, -1.647888, 0.572549, 1, 0, 1,
-0.7213556, 0.09595234, -2.164169, 0.5647059, 1, 0, 1,
-0.7204614, 2.003534, -0.7726372, 0.5607843, 1, 0, 1,
-0.7191536, 0.3069508, -1.84634, 0.5529412, 1, 0, 1,
-0.7162436, -0.1399986, -0.6193533, 0.5490196, 1, 0, 1,
-0.7161745, 0.2354919, 0.1202591, 0.5411765, 1, 0, 1,
-0.7160227, -1.082616, -1.221305, 0.5372549, 1, 0, 1,
-0.7159876, -0.7665469, -2.823096, 0.5294118, 1, 0, 1,
-0.7121654, 0.5425342, -0.4267078, 0.5254902, 1, 0, 1,
-0.7022339, 0.4545178, -1.767579, 0.5176471, 1, 0, 1,
-0.7007577, 1.483765, -1.815607, 0.5137255, 1, 0, 1,
-0.6931859, -0.09274424, -2.973193, 0.5058824, 1, 0, 1,
-0.6832966, -1.589926, -3.707254, 0.5019608, 1, 0, 1,
-0.6816332, -1.277649, -2.650598, 0.4941176, 1, 0, 1,
-0.6812314, 1.171436, -0.7426982, 0.4862745, 1, 0, 1,
-0.6802844, -1.556181, -3.81292, 0.4823529, 1, 0, 1,
-0.6758687, -0.05451794, -2.361754, 0.4745098, 1, 0, 1,
-0.674135, -0.7143322, -2.017145, 0.4705882, 1, 0, 1,
-0.6727606, -0.604214, -2.386273, 0.4627451, 1, 0, 1,
-0.6719002, 0.8511604, 1.052901, 0.4588235, 1, 0, 1,
-0.670086, 0.09540603, -0.198979, 0.4509804, 1, 0, 1,
-0.668261, -0.02521145, -2.89312, 0.4470588, 1, 0, 1,
-0.6638545, -1.995564, -2.479431, 0.4392157, 1, 0, 1,
-0.6617175, -1.082458, -2.213232, 0.4352941, 1, 0, 1,
-0.6591384, 0.2746499, -1.835456, 0.427451, 1, 0, 1,
-0.6557922, 0.256894, -0.2386795, 0.4235294, 1, 0, 1,
-0.6449869, -0.3573556, -4.022614, 0.4156863, 1, 0, 1,
-0.6429503, 0.6307095, -2.185707, 0.4117647, 1, 0, 1,
-0.6415567, -0.1316472, -0.9714832, 0.4039216, 1, 0, 1,
-0.6373374, 0.07751054, -2.408379, 0.3960784, 1, 0, 1,
-0.6345952, 2.05915, 0.3208781, 0.3921569, 1, 0, 1,
-0.63318, -0.07849319, -2.956527, 0.3843137, 1, 0, 1,
-0.6314871, -1.578722, -3.89909, 0.3803922, 1, 0, 1,
-0.6294588, -0.8950781, -2.489045, 0.372549, 1, 0, 1,
-0.6266221, 1.897884, -0.4814939, 0.3686275, 1, 0, 1,
-0.6264309, -0.8779476, -1.125084, 0.3607843, 1, 0, 1,
-0.6255317, -0.5987812, -3.383336, 0.3568628, 1, 0, 1,
-0.6247547, -0.7614415, -2.971927, 0.3490196, 1, 0, 1,
-0.6245893, -0.6806791, -1.136486, 0.345098, 1, 0, 1,
-0.6219541, -0.03131033, -0.3624327, 0.3372549, 1, 0, 1,
-0.6158196, 0.2924972, -1.127713, 0.3333333, 1, 0, 1,
-0.6147335, 0.06670091, -0.6910194, 0.3254902, 1, 0, 1,
-0.6140908, 1.115543, -2.196712, 0.3215686, 1, 0, 1,
-0.6131859, 1.046173, -1.395445, 0.3137255, 1, 0, 1,
-0.6122469, -1.434111, -3.575417, 0.3098039, 1, 0, 1,
-0.61001, 0.6379766, 1.25772, 0.3019608, 1, 0, 1,
-0.6047203, 0.5576084, -1.166586, 0.2941177, 1, 0, 1,
-0.6028249, 1.193278, 0.04233797, 0.2901961, 1, 0, 1,
-0.5984876, 1.43794, -2.187326, 0.282353, 1, 0, 1,
-0.5960078, -0.692478, -3.17412, 0.2784314, 1, 0, 1,
-0.5938298, -1.517283, 0.01601593, 0.2705882, 1, 0, 1,
-0.5875452, 0.186526, -1.906952, 0.2666667, 1, 0, 1,
-0.5839348, -0.1797196, -1.045717, 0.2588235, 1, 0, 1,
-0.5829781, -0.3792225, -0.7534423, 0.254902, 1, 0, 1,
-0.578678, -0.5200286, -3.561083, 0.2470588, 1, 0, 1,
-0.575475, -1.984575, -2.208772, 0.2431373, 1, 0, 1,
-0.5738633, 0.4501951, -1.312848, 0.2352941, 1, 0, 1,
-0.5667756, 0.8844736, -1.586467, 0.2313726, 1, 0, 1,
-0.5647123, 0.4006597, -2.320974, 0.2235294, 1, 0, 1,
-0.5605544, 0.337863, -2.725614, 0.2196078, 1, 0, 1,
-0.556485, 0.08614054, -1.504588, 0.2117647, 1, 0, 1,
-0.5554318, 0.1839623, -2.46567, 0.2078431, 1, 0, 1,
-0.5507978, 0.3363251, -0.7934808, 0.2, 1, 0, 1,
-0.5430177, 0.9906753, -0.966888, 0.1921569, 1, 0, 1,
-0.5363061, 0.5699133, -2.131389, 0.1882353, 1, 0, 1,
-0.5315946, 0.1023307, -0.9750108, 0.1803922, 1, 0, 1,
-0.5282084, -0.7886268, -2.174788, 0.1764706, 1, 0, 1,
-0.5275666, 0.6445051, 0.5571514, 0.1686275, 1, 0, 1,
-0.5264251, 0.2540197, -1.32563, 0.1647059, 1, 0, 1,
-0.5249267, -0.4889316, -3.637088, 0.1568628, 1, 0, 1,
-0.5240283, -1.166185, -2.958484, 0.1529412, 1, 0, 1,
-0.5218728, 1.269194, -0.5865719, 0.145098, 1, 0, 1,
-0.5178128, -1.223947, -5.607984, 0.1411765, 1, 0, 1,
-0.5136294, 1.285939, -0.594437, 0.1333333, 1, 0, 1,
-0.5127854, 0.5271469, -1.157328, 0.1294118, 1, 0, 1,
-0.5089546, -0.1249793, -5.296612, 0.1215686, 1, 0, 1,
-0.5013285, 0.666553, -0.4332008, 0.1176471, 1, 0, 1,
-0.4959057, 1.366247, -1.890617, 0.1098039, 1, 0, 1,
-0.4957587, 1.323062, -0.0145554, 0.1058824, 1, 0, 1,
-0.4876719, -1.083843, -1.860054, 0.09803922, 1, 0, 1,
-0.4865897, 2.277734, 0.8579272, 0.09019608, 1, 0, 1,
-0.485935, 0.613894, -0.000117456, 0.08627451, 1, 0, 1,
-0.4846483, -0.2381556, -2.104543, 0.07843138, 1, 0, 1,
-0.4797555, -0.8940929, -1.914101, 0.07450981, 1, 0, 1,
-0.4778984, -0.4074371, -1.980709, 0.06666667, 1, 0, 1,
-0.4740582, 2.320302, -1.804756, 0.0627451, 1, 0, 1,
-0.4716184, -0.1283316, -2.325036, 0.05490196, 1, 0, 1,
-0.4696141, 0.04206207, -0.2759736, 0.05098039, 1, 0, 1,
-0.468774, 2.171292, 0.4518092, 0.04313726, 1, 0, 1,
-0.4673781, -0.5740674, -3.093595, 0.03921569, 1, 0, 1,
-0.4670585, -0.05238966, -2.507226, 0.03137255, 1, 0, 1,
-0.4606245, 0.2159999, -1.048921, 0.02745098, 1, 0, 1,
-0.457946, -2.61454, -2.591363, 0.01960784, 1, 0, 1,
-0.455872, -0.6201629, -2.837212, 0.01568628, 1, 0, 1,
-0.4547091, 0.5546024, 0.3069109, 0.007843138, 1, 0, 1,
-0.4534929, 0.6556244, -0.9927721, 0.003921569, 1, 0, 1,
-0.4532024, -0.1502586, -2.166865, 0, 1, 0.003921569, 1,
-0.4498353, 0.4855755, -0.450781, 0, 1, 0.01176471, 1,
-0.4464009, 0.6055306, -0.2560547, 0, 1, 0.01568628, 1,
-0.4359863, 0.5855573, -0.5431556, 0, 1, 0.02352941, 1,
-0.4344693, 0.8915014, 0.923094, 0, 1, 0.02745098, 1,
-0.4307846, 2.30213, -1.074591, 0, 1, 0.03529412, 1,
-0.4288644, 1.758591, 0.004807786, 0, 1, 0.03921569, 1,
-0.4286465, 0.944935, -0.5715804, 0, 1, 0.04705882, 1,
-0.4282733, 0.4056535, -0.9014376, 0, 1, 0.05098039, 1,
-0.4270909, 0.09274339, -2.001669, 0, 1, 0.05882353, 1,
-0.4183884, -0.3761677, -2.30715, 0, 1, 0.0627451, 1,
-0.4176185, 1.094608, -0.5951345, 0, 1, 0.07058824, 1,
-0.4087103, -0.4834083, -4.214836, 0, 1, 0.07450981, 1,
-0.4084419, -0.8330372, -3.271895, 0, 1, 0.08235294, 1,
-0.4078183, -1.712382, -2.049805, 0, 1, 0.08627451, 1,
-0.405541, -1.930398, -2.712675, 0, 1, 0.09411765, 1,
-0.3981737, -0.3613427, -2.241113, 0, 1, 0.1019608, 1,
-0.3964394, 1.572906, -0.05285005, 0, 1, 0.1058824, 1,
-0.3956518, -0.4574093, -1.935912, 0, 1, 0.1137255, 1,
-0.393685, 1.509859, -0.1204047, 0, 1, 0.1176471, 1,
-0.3931984, 0.5072324, -1.404916, 0, 1, 0.1254902, 1,
-0.3897755, 1.009349, -0.322885, 0, 1, 0.1294118, 1,
-0.389653, -1.072877, -3.253788, 0, 1, 0.1372549, 1,
-0.3804861, -1.658063, -1.967333, 0, 1, 0.1411765, 1,
-0.3790258, 0.2368562, 1.964262, 0, 1, 0.1490196, 1,
-0.3734418, -1.160651, -2.134847, 0, 1, 0.1529412, 1,
-0.3723224, 2.077901, 0.3881356, 0, 1, 0.1607843, 1,
-0.3721212, 0.1300464, -4.231072, 0, 1, 0.1647059, 1,
-0.3603134, 2.094863, -1.255863, 0, 1, 0.172549, 1,
-0.35807, 2.490698, 0.02641677, 0, 1, 0.1764706, 1,
-0.3522426, -1.069976, -3.639966, 0, 1, 0.1843137, 1,
-0.3502245, -1.048772, -4.284505, 0, 1, 0.1882353, 1,
-0.3471552, -0.5116794, -0.3209772, 0, 1, 0.1960784, 1,
-0.345859, 0.6532699, 0.3277841, 0, 1, 0.2039216, 1,
-0.3434913, 0.6720264, -1.66496, 0, 1, 0.2078431, 1,
-0.3424184, 0.2667302, -0.7714478, 0, 1, 0.2156863, 1,
-0.3401681, -2.079238, -3.47933, 0, 1, 0.2196078, 1,
-0.3399289, -0.9131193, -3.203578, 0, 1, 0.227451, 1,
-0.3387497, 1.040141, 0.4682065, 0, 1, 0.2313726, 1,
-0.3332309, 0.5888295, 0.9217511, 0, 1, 0.2392157, 1,
-0.3322292, 1.276721, -1.356036, 0, 1, 0.2431373, 1,
-0.330751, -1.777741, -1.34286, 0, 1, 0.2509804, 1,
-0.3269444, -0.9899525, -3.751641, 0, 1, 0.254902, 1,
-0.3253378, -0.1666055, -1.924856, 0, 1, 0.2627451, 1,
-0.3232338, 0.3018878, -2.226953, 0, 1, 0.2666667, 1,
-0.3216605, 1.343014, 0.0769252, 0, 1, 0.2745098, 1,
-0.321568, -1.576453, -1.623929, 0, 1, 0.2784314, 1,
-0.318186, -1.44851, -2.083311, 0, 1, 0.2862745, 1,
-0.3140747, 0.4667411, -1.236211, 0, 1, 0.2901961, 1,
-0.3090462, -0.8880414, -2.751018, 0, 1, 0.2980392, 1,
-0.308735, 0.8734452, 1.708771, 0, 1, 0.3058824, 1,
-0.3015888, -0.8736896, -3.905725, 0, 1, 0.3098039, 1,
-0.299797, 0.1430704, -1.322501, 0, 1, 0.3176471, 1,
-0.2994025, 0.2588271, -0.4217566, 0, 1, 0.3215686, 1,
-0.2960543, -0.1062987, -0.1370225, 0, 1, 0.3294118, 1,
-0.2935765, 0.6015199, 0.6182956, 0, 1, 0.3333333, 1,
-0.2922952, 1.151689, -0.8427013, 0, 1, 0.3411765, 1,
-0.292217, -1.417205, -2.987127, 0, 1, 0.345098, 1,
-0.2858714, -0.8359535, -3.361541, 0, 1, 0.3529412, 1,
-0.2813766, -0.7697057, -3.767001, 0, 1, 0.3568628, 1,
-0.2745996, 0.5642704, 1.417994, 0, 1, 0.3647059, 1,
-0.2732433, 0.502896, -1.315917, 0, 1, 0.3686275, 1,
-0.2720559, -0.5815526, -2.417274, 0, 1, 0.3764706, 1,
-0.2689368, 0.1498068, -0.8410073, 0, 1, 0.3803922, 1,
-0.2644235, -0.2067779, -1.329833, 0, 1, 0.3882353, 1,
-0.261187, -0.2059217, -1.869737, 0, 1, 0.3921569, 1,
-0.2596577, 0.2161193, -1.319208, 0, 1, 0.4, 1,
-0.2572312, 1.965979, -2.97004, 0, 1, 0.4078431, 1,
-0.2538636, -0.42931, -2.90167, 0, 1, 0.4117647, 1,
-0.2501979, 0.5490631, -0.7284896, 0, 1, 0.4196078, 1,
-0.2497122, -0.3078325, -2.757268, 0, 1, 0.4235294, 1,
-0.2496257, -1.076355, -3.342824, 0, 1, 0.4313726, 1,
-0.2485261, -0.3682169, -4.285192, 0, 1, 0.4352941, 1,
-0.2460886, -0.1852926, -2.092315, 0, 1, 0.4431373, 1,
-0.2459989, -0.8935573, -3.32176, 0, 1, 0.4470588, 1,
-0.24544, -0.04159564, -1.692035, 0, 1, 0.454902, 1,
-0.2424233, 0.1094034, 0.9692965, 0, 1, 0.4588235, 1,
-0.2419402, 0.933833, -0.7247414, 0, 1, 0.4666667, 1,
-0.2376247, 1.224283, -0.1513828, 0, 1, 0.4705882, 1,
-0.2357196, -0.4204827, -3.430023, 0, 1, 0.4784314, 1,
-0.234919, -0.006267715, -0.8676307, 0, 1, 0.4823529, 1,
-0.2340323, -1.013364, -3.03769, 0, 1, 0.4901961, 1,
-0.2300793, 0.5124606, -0.3907103, 0, 1, 0.4941176, 1,
-0.228822, 0.04664897, -2.96931, 0, 1, 0.5019608, 1,
-0.2271299, -0.5937898, -4.059302, 0, 1, 0.509804, 1,
-0.2169669, 1.603513, -0.5304173, 0, 1, 0.5137255, 1,
-0.2146359, 0.5694765, -1.073535, 0, 1, 0.5215687, 1,
-0.2135122, 0.2607479, -0.6081744, 0, 1, 0.5254902, 1,
-0.2071828, -0.5472447, -4.368707, 0, 1, 0.5333334, 1,
-0.2055932, -0.7990191, -4.179718, 0, 1, 0.5372549, 1,
-0.2028137, -0.627641, -3.510368, 0, 1, 0.5450981, 1,
-0.1973491, 1.023612, -0.06062546, 0, 1, 0.5490196, 1,
-0.1967984, 0.3260995, -0.5558355, 0, 1, 0.5568628, 1,
-0.1959499, 0.03689222, -0.5255422, 0, 1, 0.5607843, 1,
-0.1918404, 0.3637942, -0.2403335, 0, 1, 0.5686275, 1,
-0.1871249, -0.4481446, -3.94812, 0, 1, 0.572549, 1,
-0.1863847, -0.2211292, -2.069968, 0, 1, 0.5803922, 1,
-0.1843278, 0.3703927, 0.1978022, 0, 1, 0.5843138, 1,
-0.1750362, 0.3934367, -0.7054754, 0, 1, 0.5921569, 1,
-0.1747844, 0.4494861, -0.6039195, 0, 1, 0.5960785, 1,
-0.1718926, -1.001185, -1.694012, 0, 1, 0.6039216, 1,
-0.1668356, 1.170554, -0.3206548, 0, 1, 0.6117647, 1,
-0.1659235, -0.7545333, -1.829063, 0, 1, 0.6156863, 1,
-0.162662, -0.2093555, -2.347451, 0, 1, 0.6235294, 1,
-0.1623384, -0.4511489, -1.079122, 0, 1, 0.627451, 1,
-0.1609369, -0.2398074, 0.1113404, 0, 1, 0.6352941, 1,
-0.15962, 1.133288, -0.8667884, 0, 1, 0.6392157, 1,
-0.1593764, -0.304203, -2.494383, 0, 1, 0.6470588, 1,
-0.1562072, -0.3632843, -4.25403, 0, 1, 0.6509804, 1,
-0.1533389, -0.4312539, -0.8969018, 0, 1, 0.6588235, 1,
-0.1499755, -0.07504354, -2.573692, 0, 1, 0.6627451, 1,
-0.148615, -0.2231523, -2.502231, 0, 1, 0.6705883, 1,
-0.1479909, 1.663517, 0.5170055, 0, 1, 0.6745098, 1,
-0.1477634, 0.4310354, -0.112737, 0, 1, 0.682353, 1,
-0.1468085, -0.1952295, -2.980097, 0, 1, 0.6862745, 1,
-0.1442162, 0.4762107, -1.466472, 0, 1, 0.6941177, 1,
-0.1311529, 0.2416571, -0.1531612, 0, 1, 0.7019608, 1,
-0.1274796, 0.6057487, -1.373861, 0, 1, 0.7058824, 1,
-0.1274788, -1.554172, -4.042068, 0, 1, 0.7137255, 1,
-0.1264704, 0.5226457, -0.7140749, 0, 1, 0.7176471, 1,
-0.1227342, -0.3198271, -2.419894, 0, 1, 0.7254902, 1,
-0.1209379, -1.511817, -3.134055, 0, 1, 0.7294118, 1,
-0.119062, -1.646541, -2.351789, 0, 1, 0.7372549, 1,
-0.118334, 0.7374135, -0.3915189, 0, 1, 0.7411765, 1,
-0.1151738, 0.9005293, 0.9194468, 0, 1, 0.7490196, 1,
-0.1143915, 1.09933, 0.2221907, 0, 1, 0.7529412, 1,
-0.1134754, 1.354525, -0.04137644, 0, 1, 0.7607843, 1,
-0.110833, 1.136615, -0.50122, 0, 1, 0.7647059, 1,
-0.1086238, 0.1173875, -1.058647, 0, 1, 0.772549, 1,
-0.1071603, 0.4901874, -0.4464704, 0, 1, 0.7764706, 1,
-0.105727, -1.206699, -2.543577, 0, 1, 0.7843137, 1,
-0.1032743, 1.019995, -1.518134, 0, 1, 0.7882353, 1,
-0.1006836, -1.006982, -2.657446, 0, 1, 0.7960784, 1,
-0.09540571, 0.3402825, -0.7968444, 0, 1, 0.8039216, 1,
-0.09182543, -0.2452029, -2.699148, 0, 1, 0.8078431, 1,
-0.08916193, 0.7069582, -0.516421, 0, 1, 0.8156863, 1,
-0.08449578, 0.5239061, 0.8038429, 0, 1, 0.8196079, 1,
-0.07794663, -0.9700379, -4.81406, 0, 1, 0.827451, 1,
-0.07117897, 0.1241027, -1.141434, 0, 1, 0.8313726, 1,
-0.07114612, 0.5014538, -0.8189521, 0, 1, 0.8392157, 1,
-0.06395561, 0.8449388, -0.8110015, 0, 1, 0.8431373, 1,
-0.06233766, -0.2481739, -1.918408, 0, 1, 0.8509804, 1,
-0.0619567, -0.4446179, -3.444891, 0, 1, 0.854902, 1,
-0.06114395, -1.101817, -4.60058, 0, 1, 0.8627451, 1,
-0.06035344, 0.5294599, -0.7732909, 0, 1, 0.8666667, 1,
-0.05996686, 0.1619584, 0.3051464, 0, 1, 0.8745098, 1,
-0.05954969, -0.6135988, -2.762038, 0, 1, 0.8784314, 1,
-0.05727967, 1.836694, -0.1401028, 0, 1, 0.8862745, 1,
-0.05247862, -0.8652555, -1.974131, 0, 1, 0.8901961, 1,
-0.04846486, 0.9335142, -0.7908582, 0, 1, 0.8980392, 1,
-0.04618173, -0.2626716, -3.729315, 0, 1, 0.9058824, 1,
-0.04545299, -0.6439487, -2.065545, 0, 1, 0.9098039, 1,
-0.04443062, -0.9339566, -3.534093, 0, 1, 0.9176471, 1,
-0.04407848, 0.2593842, -1.340528, 0, 1, 0.9215686, 1,
-0.04379361, -0.1412302, -2.60206, 0, 1, 0.9294118, 1,
-0.03210506, 0.1123328, -1.03282, 0, 1, 0.9333333, 1,
-0.02855461, 0.3885752, 0.9519774, 0, 1, 0.9411765, 1,
-0.02347833, -0.5289682, -5.1158, 0, 1, 0.945098, 1,
-0.01919133, 0.4322584, -0.07704586, 0, 1, 0.9529412, 1,
-0.01530103, -1.246493, -4.086837, 0, 1, 0.9568627, 1,
-0.01508682, -1.025539, -3.465237, 0, 1, 0.9647059, 1,
-0.01334779, -1.329957, -2.964954, 0, 1, 0.9686275, 1,
-0.009846476, 0.4779415, 1.754807, 0, 1, 0.9764706, 1,
-0.008526137, -0.7270556, -3.227491, 0, 1, 0.9803922, 1,
-0.002644917, -0.08687454, -1.848281, 0, 1, 0.9882353, 1,
-0.002382975, -0.5647039, -3.608118, 0, 1, 0.9921569, 1,
-0.002360252, -0.4982401, -3.146212, 0, 1, 1, 1,
0.001161708, 0.5988463, 1.507315, 0, 0.9921569, 1, 1,
0.008982867, -0.4371157, 3.088287, 0, 0.9882353, 1, 1,
0.0140977, 1.22221, 0.7361944, 0, 0.9803922, 1, 1,
0.01534108, 1.15696, -0.9499189, 0, 0.9764706, 1, 1,
0.01675896, 1.455407, 1.494128, 0, 0.9686275, 1, 1,
0.02055669, -0.8154741, 3.002792, 0, 0.9647059, 1, 1,
0.02428207, 0.7128639, -1.166601, 0, 0.9568627, 1, 1,
0.02517917, -0.2099768, 3.566249, 0, 0.9529412, 1, 1,
0.02712015, 0.2623804, -0.2041496, 0, 0.945098, 1, 1,
0.02926759, 0.9837934, 0.287758, 0, 0.9411765, 1, 1,
0.03005012, 0.5565014, 1.755105, 0, 0.9333333, 1, 1,
0.03063341, -0.2212286, 2.436617, 0, 0.9294118, 1, 1,
0.03392395, -0.4866894, 5.095456, 0, 0.9215686, 1, 1,
0.034778, -1.046564, 4.319067, 0, 0.9176471, 1, 1,
0.03477944, -1.823636, 3.855052, 0, 0.9098039, 1, 1,
0.03745208, -0.2349568, 3.990653, 0, 0.9058824, 1, 1,
0.03910181, 0.2021715, 1.032853, 0, 0.8980392, 1, 1,
0.04100292, -1.92806, 5.011188, 0, 0.8901961, 1, 1,
0.04143681, -0.6753238, 2.589349, 0, 0.8862745, 1, 1,
0.04861259, 1.104769, -1.431795, 0, 0.8784314, 1, 1,
0.05399035, 1.172598, 0.6960971, 0, 0.8745098, 1, 1,
0.0547453, 1.179018, -0.005190591, 0, 0.8666667, 1, 1,
0.05639241, 0.3867468, -0.9955374, 0, 0.8627451, 1, 1,
0.05660616, 1.777839, 0.9968668, 0, 0.854902, 1, 1,
0.0569075, 0.4073234, -0.1060831, 0, 0.8509804, 1, 1,
0.0576691, -0.2169737, 3.124696, 0, 0.8431373, 1, 1,
0.05905062, 0.6966341, 0.2460692, 0, 0.8392157, 1, 1,
0.06157945, 1.009544, 0.8733457, 0, 0.8313726, 1, 1,
0.06446093, 0.2595873, -0.4472469, 0, 0.827451, 1, 1,
0.06841075, 0.7435029, 1.715521, 0, 0.8196079, 1, 1,
0.06847259, -1.205257, 1.60398, 0, 0.8156863, 1, 1,
0.07300574, -0.09147194, 3.630021, 0, 0.8078431, 1, 1,
0.0732231, -1.020804, 2.234097, 0, 0.8039216, 1, 1,
0.07355135, -0.1230269, 2.089371, 0, 0.7960784, 1, 1,
0.0816067, 0.164393, 1.153879, 0, 0.7882353, 1, 1,
0.08809359, 1.28211, -1.027447, 0, 0.7843137, 1, 1,
0.09091741, 1.884318, -0.41079, 0, 0.7764706, 1, 1,
0.0924118, -0.3332292, 1.712523, 0, 0.772549, 1, 1,
0.09677961, -0.641605, 3.230688, 0, 0.7647059, 1, 1,
0.09809937, 1.739848, 0.5493056, 0, 0.7607843, 1, 1,
0.1002092, -1.744799, 1.471798, 0, 0.7529412, 1, 1,
0.1034363, -1.766558, 3.280209, 0, 0.7490196, 1, 1,
0.105285, -1.513862, 2.092292, 0, 0.7411765, 1, 1,
0.1115849, 0.9627687, 0.07044594, 0, 0.7372549, 1, 1,
0.1136099, -0.2827734, 3.563952, 0, 0.7294118, 1, 1,
0.1178714, 0.6356391, 0.6899825, 0, 0.7254902, 1, 1,
0.1183957, -1.023654, 2.578007, 0, 0.7176471, 1, 1,
0.1188219, -2.394177, 3.030612, 0, 0.7137255, 1, 1,
0.1224956, 1.081525, 2.283845, 0, 0.7058824, 1, 1,
0.1270221, 0.2338115, -1.316921, 0, 0.6980392, 1, 1,
0.1292115, 0.08603653, 1.718678, 0, 0.6941177, 1, 1,
0.1323541, 0.2347274, -1.06365, 0, 0.6862745, 1, 1,
0.1355646, -0.9280114, 2.447171, 0, 0.682353, 1, 1,
0.1389915, -0.4101822, 3.592383, 0, 0.6745098, 1, 1,
0.1396894, -0.3980671, 2.314524, 0, 0.6705883, 1, 1,
0.1412442, 0.7656987, 0.3124088, 0, 0.6627451, 1, 1,
0.1462161, -0.2348641, 1.71596, 0, 0.6588235, 1, 1,
0.146685, -0.9640202, 2.795447, 0, 0.6509804, 1, 1,
0.1483395, -0.7642069, 3.456357, 0, 0.6470588, 1, 1,
0.1490192, 0.3892149, -0.6432245, 0, 0.6392157, 1, 1,
0.1493591, 1.49751, -0.2370265, 0, 0.6352941, 1, 1,
0.1503038, 0.5181971, -0.527611, 0, 0.627451, 1, 1,
0.1503079, -0.523558, 3.893051, 0, 0.6235294, 1, 1,
0.1503213, -0.2355741, 2.398813, 0, 0.6156863, 1, 1,
0.154458, 0.3068517, 1.101023, 0, 0.6117647, 1, 1,
0.1549787, 0.6432714, 0.8776856, 0, 0.6039216, 1, 1,
0.1649439, -0.2814255, 3.970512, 0, 0.5960785, 1, 1,
0.1709922, -0.7957093, 2.68235, 0, 0.5921569, 1, 1,
0.1733225, 1.042486, -2.112166, 0, 0.5843138, 1, 1,
0.1749368, -0.5015181, 4.872533, 0, 0.5803922, 1, 1,
0.176262, -0.8834043, 2.821551, 0, 0.572549, 1, 1,
0.1782307, -0.6687284, 2.848308, 0, 0.5686275, 1, 1,
0.1805709, -0.7211772, 3.879141, 0, 0.5607843, 1, 1,
0.1813154, -0.299227, 3.219052, 0, 0.5568628, 1, 1,
0.1888401, 1.35142, 1.342224, 0, 0.5490196, 1, 1,
0.1896843, -1.307776, 2.616431, 0, 0.5450981, 1, 1,
0.1901885, 0.6581611, 0.6072432, 0, 0.5372549, 1, 1,
0.1926944, -1.197579, 4.676074, 0, 0.5333334, 1, 1,
0.199585, 0.2927841, 1.277102, 0, 0.5254902, 1, 1,
0.2009765, 0.3844565, -0.02916063, 0, 0.5215687, 1, 1,
0.2029257, 1.295667, -0.4269411, 0, 0.5137255, 1, 1,
0.2043122, 0.3567756, 1.659606, 0, 0.509804, 1, 1,
0.2055776, -0.6814308, 2.189125, 0, 0.5019608, 1, 1,
0.2078236, 0.8708262, 0.210815, 0, 0.4941176, 1, 1,
0.2081129, 1.490647, -0.06493887, 0, 0.4901961, 1, 1,
0.208719, -1.209089, 2.221079, 0, 0.4823529, 1, 1,
0.2121359, -0.1851721, 3.922733, 0, 0.4784314, 1, 1,
0.214531, -1.48271, 4.885495, 0, 0.4705882, 1, 1,
0.2151184, -0.08032674, 2.911613, 0, 0.4666667, 1, 1,
0.218447, -0.1619477, 3.025503, 0, 0.4588235, 1, 1,
0.2221436, 0.1573457, 0.6915733, 0, 0.454902, 1, 1,
0.2224557, -0.03466405, 3.699069, 0, 0.4470588, 1, 1,
0.2301065, -0.8901587, 3.105196, 0, 0.4431373, 1, 1,
0.2368927, 0.3703086, 0.002290689, 0, 0.4352941, 1, 1,
0.2419635, 1.525358, -0.8587124, 0, 0.4313726, 1, 1,
0.2433628, 0.09740346, 1.590318, 0, 0.4235294, 1, 1,
0.2459398, -2.348252, 3.458023, 0, 0.4196078, 1, 1,
0.2545266, 0.6213917, 2.479156, 0, 0.4117647, 1, 1,
0.256686, -0.5797382, 2.843081, 0, 0.4078431, 1, 1,
0.25907, 1.051609, -0.691736, 0, 0.4, 1, 1,
0.2606502, 0.174771, 1.851547, 0, 0.3921569, 1, 1,
0.2643945, -0.5242778, 2.033363, 0, 0.3882353, 1, 1,
0.2646201, -0.4819573, 1.063336, 0, 0.3803922, 1, 1,
0.2665119, 0.3095691, 1.134484, 0, 0.3764706, 1, 1,
0.2717986, 0.2130695, 1.063308, 0, 0.3686275, 1, 1,
0.2732889, 0.2087051, 1.529948, 0, 0.3647059, 1, 1,
0.2753851, 0.01597211, 1.132693, 0, 0.3568628, 1, 1,
0.2771419, -2.23575, 4.268253, 0, 0.3529412, 1, 1,
0.2776327, -0.5543518, 1.720275, 0, 0.345098, 1, 1,
0.2794913, -2.808656, 1.263169, 0, 0.3411765, 1, 1,
0.2804406, -0.06545365, 0.9262134, 0, 0.3333333, 1, 1,
0.2809661, 0.06271718, 1.402476, 0, 0.3294118, 1, 1,
0.28294, -0.5481321, 2.008252, 0, 0.3215686, 1, 1,
0.2838834, 1.02956, 0.3178433, 0, 0.3176471, 1, 1,
0.2883703, 1.843008, -0.7926909, 0, 0.3098039, 1, 1,
0.2896109, 0.1281117, 2.026674, 0, 0.3058824, 1, 1,
0.2916511, -0.7248948, 3.784706, 0, 0.2980392, 1, 1,
0.2933713, 0.8270561, 0.01390983, 0, 0.2901961, 1, 1,
0.2998642, -0.5197496, 2.520019, 0, 0.2862745, 1, 1,
0.3067895, -0.2925069, 3.667733, 0, 0.2784314, 1, 1,
0.3085935, -0.4132566, 2.749811, 0, 0.2745098, 1, 1,
0.3118151, 1.113405, 0.1527609, 0, 0.2666667, 1, 1,
0.3120949, -0.1131691, 2.075807, 0, 0.2627451, 1, 1,
0.3131116, 0.5529631, 0.6123939, 0, 0.254902, 1, 1,
0.3143988, -0.6927847, 3.566059, 0, 0.2509804, 1, 1,
0.321813, 1.068896, 0.1123314, 0, 0.2431373, 1, 1,
0.3271587, 1.155843, -0.4225578, 0, 0.2392157, 1, 1,
0.3362113, 0.9565304, 1.427638, 0, 0.2313726, 1, 1,
0.3376503, 0.1621744, 2.10353, 0, 0.227451, 1, 1,
0.3393887, -0.2796304, 1.985933, 0, 0.2196078, 1, 1,
0.3394868, -0.1379891, 0.4445114, 0, 0.2156863, 1, 1,
0.340033, -0.2052657, 2.392515, 0, 0.2078431, 1, 1,
0.3414693, 0.7348699, 0.710423, 0, 0.2039216, 1, 1,
0.3425348, 1.444841, 0.6759787, 0, 0.1960784, 1, 1,
0.3426568, 2.381485, 0.3821561, 0, 0.1882353, 1, 1,
0.3461917, 0.4270369, -0.181913, 0, 0.1843137, 1, 1,
0.3462484, -0.6550535, 4.545256, 0, 0.1764706, 1, 1,
0.3484395, 1.439665, 0.5507921, 0, 0.172549, 1, 1,
0.3539338, -1.164429, 4.004617, 0, 0.1647059, 1, 1,
0.3596514, 1.200115, 0.8085202, 0, 0.1607843, 1, 1,
0.3605098, -1.242669, 2.291134, 0, 0.1529412, 1, 1,
0.3650069, 1.060024, 1.257913, 0, 0.1490196, 1, 1,
0.36767, -0.581028, 2.648332, 0, 0.1411765, 1, 1,
0.3679004, -0.4941552, 1.959136, 0, 0.1372549, 1, 1,
0.3702627, -1.524977, 2.576315, 0, 0.1294118, 1, 1,
0.3722242, -0.1053278, 3.996699, 0, 0.1254902, 1, 1,
0.3742196, -1.787118, 1.209006, 0, 0.1176471, 1, 1,
0.3742414, -0.2309711, 1.578872, 0, 0.1137255, 1, 1,
0.377564, -1.603467, 4.209261, 0, 0.1058824, 1, 1,
0.3778849, 0.9265365, -0.07323046, 0, 0.09803922, 1, 1,
0.3814973, -0.6069008, 1.74673, 0, 0.09411765, 1, 1,
0.3819184, -0.8302843, 3.274907, 0, 0.08627451, 1, 1,
0.3866971, 1.92667, -2.162472, 0, 0.08235294, 1, 1,
0.3905471, -0.918115, 2.279859, 0, 0.07450981, 1, 1,
0.3939806, -0.6866501, 1.950424, 0, 0.07058824, 1, 1,
0.3949684, 0.5788714, 0.1761386, 0, 0.0627451, 1, 1,
0.3966585, -0.4999344, 1.957741, 0, 0.05882353, 1, 1,
0.4005368, -0.08443173, 1.544531, 0, 0.05098039, 1, 1,
0.4014113, 0.04903656, 1.242239, 0, 0.04705882, 1, 1,
0.4027015, -0.06101414, 0.2211924, 0, 0.03921569, 1, 1,
0.4042597, -0.7286092, 3.190541, 0, 0.03529412, 1, 1,
0.4059833, 0.1734959, 0.5325428, 0, 0.02745098, 1, 1,
0.406581, -0.8662971, 2.558213, 0, 0.02352941, 1, 1,
0.4081184, -0.8223839, 2.159586, 0, 0.01568628, 1, 1,
0.4084051, -0.281166, 2.814079, 0, 0.01176471, 1, 1,
0.4094422, 0.5971926, -1.573473, 0, 0.003921569, 1, 1,
0.4258827, -1.776598, 3.534741, 0.003921569, 0, 1, 1,
0.4263143, 0.1751316, 2.613907, 0.007843138, 0, 1, 1,
0.4309829, -1.05999, 3.299041, 0.01568628, 0, 1, 1,
0.4335223, 1.745619, -1.513577, 0.01960784, 0, 1, 1,
0.4342629, 1.320551, -1.46732, 0.02745098, 0, 1, 1,
0.4350451, -0.3710169, 2.017927, 0.03137255, 0, 1, 1,
0.4426022, 0.4988552, 2.338073, 0.03921569, 0, 1, 1,
0.4557333, 0.2330464, 0.2007056, 0.04313726, 0, 1, 1,
0.45633, -1.463924, 3.494715, 0.05098039, 0, 1, 1,
0.4577512, -0.2838185, 1.747039, 0.05490196, 0, 1, 1,
0.4577787, 1.187793, 1.176113, 0.0627451, 0, 1, 1,
0.4581609, -0.1724863, 2.692415, 0.06666667, 0, 1, 1,
0.459966, -0.05618896, 1.467965, 0.07450981, 0, 1, 1,
0.4602033, 0.1512012, 0.531052, 0.07843138, 0, 1, 1,
0.4602202, 0.4903482, 1.265969, 0.08627451, 0, 1, 1,
0.4604455, 1.232678, -0.416414, 0.09019608, 0, 1, 1,
0.4697073, 1.486859, 1.36021, 0.09803922, 0, 1, 1,
0.4707744, -3.333579, 3.884951, 0.1058824, 0, 1, 1,
0.4714498, -0.1443732, 1.363617, 0.1098039, 0, 1, 1,
0.4737287, -0.3477289, 1.330302, 0.1176471, 0, 1, 1,
0.4740736, 0.04759452, 2.130475, 0.1215686, 0, 1, 1,
0.4766289, -0.9046637, 3.15769, 0.1294118, 0, 1, 1,
0.4807559, 0.5000896, 1.56263, 0.1333333, 0, 1, 1,
0.4831615, -0.287868, 2.744684, 0.1411765, 0, 1, 1,
0.4841763, 0.1185497, -0.07194699, 0.145098, 0, 1, 1,
0.4864166, 1.23335, 0.6780013, 0.1529412, 0, 1, 1,
0.4867693, -0.1923421, 3.19113, 0.1568628, 0, 1, 1,
0.495868, 0.3330962, 1.926286, 0.1647059, 0, 1, 1,
0.4959035, 0.1414259, 0.6859327, 0.1686275, 0, 1, 1,
0.4988018, 0.2338331, 1.722008, 0.1764706, 0, 1, 1,
0.502143, 1.45498, -0.2520707, 0.1803922, 0, 1, 1,
0.5028114, -0.1177775, 0.2398374, 0.1882353, 0, 1, 1,
0.5079235, 1.964904, 0.2452245, 0.1921569, 0, 1, 1,
0.5082554, -0.749075, 4.98344, 0.2, 0, 1, 1,
0.5213143, -0.4134054, 1.212404, 0.2078431, 0, 1, 1,
0.5224371, -1.476618, 2.372384, 0.2117647, 0, 1, 1,
0.5268858, -0.5265913, 1.813995, 0.2196078, 0, 1, 1,
0.5335766, -0.5339806, 1.81583, 0.2235294, 0, 1, 1,
0.5339993, -1.0634, 2.614306, 0.2313726, 0, 1, 1,
0.5351419, 0.778137, 0.06864779, 0.2352941, 0, 1, 1,
0.5389772, -0.6378282, 2.336777, 0.2431373, 0, 1, 1,
0.5478205, -2.11455, 3.530199, 0.2470588, 0, 1, 1,
0.5531396, 0.2756376, 1.532583, 0.254902, 0, 1, 1,
0.5533972, -0.8263041, 5.309339, 0.2588235, 0, 1, 1,
0.5552149, -0.2086225, 1.586779, 0.2666667, 0, 1, 1,
0.5637144, 0.5296958, -0.4923514, 0.2705882, 0, 1, 1,
0.5652379, -1.822789, 3.006645, 0.2784314, 0, 1, 1,
0.5714599, 0.7040669, -0.7301683, 0.282353, 0, 1, 1,
0.5731093, -0.1946856, -0.09281761, 0.2901961, 0, 1, 1,
0.5740294, 0.7612516, 1.597101, 0.2941177, 0, 1, 1,
0.5747567, 0.2014055, 1.382808, 0.3019608, 0, 1, 1,
0.5768226, 0.6596824, 1.603549, 0.3098039, 0, 1, 1,
0.5773032, 2.284642, -0.1548548, 0.3137255, 0, 1, 1,
0.5777561, 0.2583318, 1.456449, 0.3215686, 0, 1, 1,
0.5799378, 1.019543, 1.605698, 0.3254902, 0, 1, 1,
0.5831634, -1.002349, 1.369788, 0.3333333, 0, 1, 1,
0.588527, 0.9865648, -0.2414244, 0.3372549, 0, 1, 1,
0.5888352, 0.8735772, 1.241248, 0.345098, 0, 1, 1,
0.5991374, 0.3389692, 1.699715, 0.3490196, 0, 1, 1,
0.6064714, 0.2782658, -0.2244309, 0.3568628, 0, 1, 1,
0.613268, -0.2625723, 1.894892, 0.3607843, 0, 1, 1,
0.6136112, 0.821482, -0.01373262, 0.3686275, 0, 1, 1,
0.6149696, -1.725091, 2.808429, 0.372549, 0, 1, 1,
0.6354329, -2.03892, 3.212994, 0.3803922, 0, 1, 1,
0.6399425, -0.639837, 2.009396, 0.3843137, 0, 1, 1,
0.640798, -0.4220458, 2.524245, 0.3921569, 0, 1, 1,
0.6439306, -0.1133242, 2.569755, 0.3960784, 0, 1, 1,
0.6496913, -0.8226961, 0.3499117, 0.4039216, 0, 1, 1,
0.6543186, -1.16033, 0.9476833, 0.4117647, 0, 1, 1,
0.6569629, 0.5514693, 1.103913, 0.4156863, 0, 1, 1,
0.6570863, 0.535088, -0.2028171, 0.4235294, 0, 1, 1,
0.666732, 0.8997979, 1.872433, 0.427451, 0, 1, 1,
0.666884, 0.2803048, 1.900415, 0.4352941, 0, 1, 1,
0.6693442, 0.05780344, 0.176263, 0.4392157, 0, 1, 1,
0.669523, 1.056918, 0.3547995, 0.4470588, 0, 1, 1,
0.6695259, -0.9484283, 3.158537, 0.4509804, 0, 1, 1,
0.6730236, 1.115334, 0.08259477, 0.4588235, 0, 1, 1,
0.6890602, -0.1872028, 0.4820522, 0.4627451, 0, 1, 1,
0.6900571, 0.513191, -0.264592, 0.4705882, 0, 1, 1,
0.6968151, -0.1505044, 2.126885, 0.4745098, 0, 1, 1,
0.6987963, -0.5839235, 3.273954, 0.4823529, 0, 1, 1,
0.6991204, 0.334332, 1.796797, 0.4862745, 0, 1, 1,
0.7041382, -0.836773, 1.949559, 0.4941176, 0, 1, 1,
0.7133209, -1.863611, 0.7763113, 0.5019608, 0, 1, 1,
0.7146588, 0.7437845, 0.9096369, 0.5058824, 0, 1, 1,
0.7151874, 1.915823, 1.396305, 0.5137255, 0, 1, 1,
0.7178944, 0.4530336, 0.7485905, 0.5176471, 0, 1, 1,
0.7181458, 0.02909017, 1.378419, 0.5254902, 0, 1, 1,
0.7296581, -0.3729523, 2.545697, 0.5294118, 0, 1, 1,
0.7312158, -1.824044, 2.439308, 0.5372549, 0, 1, 1,
0.7352417, -0.8779775, 2.143868, 0.5411765, 0, 1, 1,
0.7357922, -0.8969482, 3.450196, 0.5490196, 0, 1, 1,
0.7482895, 1.334227, 1.389613, 0.5529412, 0, 1, 1,
0.7491072, -0.9212282, 3.076886, 0.5607843, 0, 1, 1,
0.7493261, -0.8276981, 3.22185, 0.5647059, 0, 1, 1,
0.7507507, 0.8821105, 0.5472463, 0.572549, 0, 1, 1,
0.7524105, -1.358355, 2.241507, 0.5764706, 0, 1, 1,
0.7530278, 1.325446, 0.2197254, 0.5843138, 0, 1, 1,
0.7545724, -0.6722599, 1.588121, 0.5882353, 0, 1, 1,
0.7550581, -0.7044309, 2.856875, 0.5960785, 0, 1, 1,
0.7585322, 1.010016, 0.2727144, 0.6039216, 0, 1, 1,
0.7614219, -0.6420424, 3.265558, 0.6078432, 0, 1, 1,
0.7628047, 0.4618846, -0.3480826, 0.6156863, 0, 1, 1,
0.7679418, 0.2538095, 2.363624, 0.6196079, 0, 1, 1,
0.7686723, 0.8500365, 0.9790455, 0.627451, 0, 1, 1,
0.7689466, -1.936983, 0.8571704, 0.6313726, 0, 1, 1,
0.772281, -0.108756, 1.689888, 0.6392157, 0, 1, 1,
0.7732368, -0.436848, 1.305379, 0.6431373, 0, 1, 1,
0.7742638, 1.015249, 1.667325, 0.6509804, 0, 1, 1,
0.7755303, 0.7935637, 1.391421, 0.654902, 0, 1, 1,
0.7769156, -1.079124, 2.707638, 0.6627451, 0, 1, 1,
0.781664, 0.1491847, 2.173539, 0.6666667, 0, 1, 1,
0.7929104, -0.4552716, 1.242857, 0.6745098, 0, 1, 1,
0.7949706, 1.181678, 0.5097529, 0.6784314, 0, 1, 1,
0.7965187, 1.437287, 0.2367886, 0.6862745, 0, 1, 1,
0.8002799, -0.2357991, 1.615383, 0.6901961, 0, 1, 1,
0.8029034, 0.2420249, 1.752777, 0.6980392, 0, 1, 1,
0.8070174, 0.8417667, 1.012452, 0.7058824, 0, 1, 1,
0.8074759, 1.119828, -0.008413101, 0.7098039, 0, 1, 1,
0.8196828, -0.4956954, 1.506354, 0.7176471, 0, 1, 1,
0.8197211, 0.104403, 1.912446, 0.7215686, 0, 1, 1,
0.8198993, 0.6336567, 2.167523, 0.7294118, 0, 1, 1,
0.8245403, -0.3769273, 1.370045, 0.7333333, 0, 1, 1,
0.8265507, -0.9411647, 3.030132, 0.7411765, 0, 1, 1,
0.8291829, 0.6577501, 1.177802, 0.7450981, 0, 1, 1,
0.8294566, -1.737199, 3.325813, 0.7529412, 0, 1, 1,
0.8359115, 0.4958097, 0.9214993, 0.7568628, 0, 1, 1,
0.8496065, -1.579446, 1.967288, 0.7647059, 0, 1, 1,
0.8526207, -0.5605113, 1.974203, 0.7686275, 0, 1, 1,
0.8527618, 0.08025753, 1.716546, 0.7764706, 0, 1, 1,
0.8577387, 1.007969, 2.230931, 0.7803922, 0, 1, 1,
0.8586834, 0.826359, 1.284648, 0.7882353, 0, 1, 1,
0.860091, -0.1116076, 1.389443, 0.7921569, 0, 1, 1,
0.8747483, 0.07476701, 1.204393, 0.8, 0, 1, 1,
0.8811853, -1.583877, 3.091227, 0.8078431, 0, 1, 1,
0.8831114, 2.338747, -0.531237, 0.8117647, 0, 1, 1,
0.8875445, -1.193694, 1.596626, 0.8196079, 0, 1, 1,
0.888274, 0.05768733, 1.132701, 0.8235294, 0, 1, 1,
0.8890421, 2.129257, -1.755807, 0.8313726, 0, 1, 1,
0.8898485, -0.6048496, 1.67982, 0.8352941, 0, 1, 1,
0.893811, -0.2482439, -0.3898631, 0.8431373, 0, 1, 1,
0.9104734, 0.6999314, -0.3988044, 0.8470588, 0, 1, 1,
0.9195614, 0.7323622, 1.424798, 0.854902, 0, 1, 1,
0.928777, 0.2825262, 2.970869, 0.8588235, 0, 1, 1,
0.9349796, -0.7255135, 3.373493, 0.8666667, 0, 1, 1,
0.9360209, -0.8526632, 1.206325, 0.8705882, 0, 1, 1,
0.9382308, -1.378522, 2.991846, 0.8784314, 0, 1, 1,
0.9396511, 0.3143726, 1.15851, 0.8823529, 0, 1, 1,
0.9493114, 0.3735199, -0.7942362, 0.8901961, 0, 1, 1,
0.9548635, 0.48605, -0.5469661, 0.8941177, 0, 1, 1,
0.9554157, 0.3534171, 1.533543, 0.9019608, 0, 1, 1,
0.9565815, -0.139656, 3.704959, 0.9098039, 0, 1, 1,
0.9573506, 0.9427087, 0.6382057, 0.9137255, 0, 1, 1,
0.9574884, -0.6651941, 1.811467, 0.9215686, 0, 1, 1,
0.961364, -0.5736864, 2.164365, 0.9254902, 0, 1, 1,
0.9643998, -0.5547546, 3.182679, 0.9333333, 0, 1, 1,
0.9705259, -0.04935175, 3.353818, 0.9372549, 0, 1, 1,
0.9709556, 0.09655105, 1.869261, 0.945098, 0, 1, 1,
0.9741111, 1.124647, 1.609321, 0.9490196, 0, 1, 1,
0.9789168, -1.15981, 1.243687, 0.9568627, 0, 1, 1,
0.9850282, 0.57223, 1.409883, 0.9607843, 0, 1, 1,
0.9900032, -1.035416, 1.583222, 0.9686275, 0, 1, 1,
0.9994146, -0.9133642, 4.548839, 0.972549, 0, 1, 1,
1.00372, -2.136219, 1.809562, 0.9803922, 0, 1, 1,
1.011457, 1.475045, 0.7136492, 0.9843137, 0, 1, 1,
1.014336, -1.230333, 2.571706, 0.9921569, 0, 1, 1,
1.016723, 0.8699453, 0.2215459, 0.9960784, 0, 1, 1,
1.019835, -0.3123686, 1.832078, 1, 0, 0.9960784, 1,
1.022639, 0.1002845, 1.294768, 1, 0, 0.9882353, 1,
1.02525, -1.130213, 4.131009, 1, 0, 0.9843137, 1,
1.028365, 1.181672, 0.4375735, 1, 0, 0.9764706, 1,
1.029731, -0.6806874, 0.3666613, 1, 0, 0.972549, 1,
1.033056, -0.8425954, 3.936082, 1, 0, 0.9647059, 1,
1.034424, -0.08209376, 0.7923794, 1, 0, 0.9607843, 1,
1.036983, -0.1063746, 1.926614, 1, 0, 0.9529412, 1,
1.040779, 1.561068, -1.052285, 1, 0, 0.9490196, 1,
1.043197, 0.7000825, 1.271652, 1, 0, 0.9411765, 1,
1.043218, 1.593687, 3.069257, 1, 0, 0.9372549, 1,
1.044295, 0.3694338, 2.840235, 1, 0, 0.9294118, 1,
1.044714, -2.069632, 2.483651, 1, 0, 0.9254902, 1,
1.044786, -0.661177, 2.670383, 1, 0, 0.9176471, 1,
1.045596, -0.1700142, 0.1427362, 1, 0, 0.9137255, 1,
1.048774, -0.02305948, 2.518052, 1, 0, 0.9058824, 1,
1.054039, 0.1601006, 1.967146, 1, 0, 0.9019608, 1,
1.062724, 1.073801, 0.8241661, 1, 0, 0.8941177, 1,
1.074153, 0.3460442, 1.759079, 1, 0, 0.8862745, 1,
1.080986, -0.731648, 2.743867, 1, 0, 0.8823529, 1,
1.085258, 0.4119443, 0.1778392, 1, 0, 0.8745098, 1,
1.088457, -1.567064, 2.31559, 1, 0, 0.8705882, 1,
1.089236, -0.8682066, 1.963187, 1, 0, 0.8627451, 1,
1.09581, -0.9510235, 0.3425051, 1, 0, 0.8588235, 1,
1.097547, 0.2484079, -0.2550146, 1, 0, 0.8509804, 1,
1.09981, 0.5545694, 2.422699, 1, 0, 0.8470588, 1,
1.104334, -0.08756398, 4.236713, 1, 0, 0.8392157, 1,
1.104552, 0.554305, 1.779523, 1, 0, 0.8352941, 1,
1.107977, 1.807541, 0.6936675, 1, 0, 0.827451, 1,
1.112453, -0.1363382, -1.007252, 1, 0, 0.8235294, 1,
1.112554, 0.85913, 0.86707, 1, 0, 0.8156863, 1,
1.113217, -1.750742, 1.739768, 1, 0, 0.8117647, 1,
1.11382, 0.9345783, 1.107166, 1, 0, 0.8039216, 1,
1.11448, -0.24538, 0.9023676, 1, 0, 0.7960784, 1,
1.118724, -0.5805733, 3.552212, 1, 0, 0.7921569, 1,
1.120518, -0.114487, 2.393805, 1, 0, 0.7843137, 1,
1.122152, -2.789152, 2.285441, 1, 0, 0.7803922, 1,
1.122497, -1.857639, 1.850774, 1, 0, 0.772549, 1,
1.134021, 0.1055661, 2.60509, 1, 0, 0.7686275, 1,
1.137353, -1.487711, 2.37578, 1, 0, 0.7607843, 1,
1.149743, -0.4258761, 0.8564324, 1, 0, 0.7568628, 1,
1.15129, -0.5375984, 2.683623, 1, 0, 0.7490196, 1,
1.152567, 0.2639948, 1.379621, 1, 0, 0.7450981, 1,
1.154023, 0.5660634, 0.2446473, 1, 0, 0.7372549, 1,
1.155753, -1.581023, 3.450854, 1, 0, 0.7333333, 1,
1.155991, -0.5567119, 2.027017, 1, 0, 0.7254902, 1,
1.161922, -0.4905373, 1.599633, 1, 0, 0.7215686, 1,
1.165618, 0.6086456, 0.9662839, 1, 0, 0.7137255, 1,
1.190284, -1.359578, 2.65175, 1, 0, 0.7098039, 1,
1.190506, -1.43951, 3.128625, 1, 0, 0.7019608, 1,
1.193221, 1.395707, -0.200512, 1, 0, 0.6941177, 1,
1.205705, -0.5804447, 1.530177, 1, 0, 0.6901961, 1,
1.208426, -0.7293119, 2.286728, 1, 0, 0.682353, 1,
1.210732, -0.9161445, 1.597785, 1, 0, 0.6784314, 1,
1.216779, 2.071083, 0.811754, 1, 0, 0.6705883, 1,
1.226121, -0.7983907, 1.451073, 1, 0, 0.6666667, 1,
1.226505, 0.1942378, 1.630484, 1, 0, 0.6588235, 1,
1.229565, -0.5862788, 2.995237, 1, 0, 0.654902, 1,
1.230503, 0.0219105, 0.7940385, 1, 0, 0.6470588, 1,
1.244507, -0.2389853, 2.739711, 1, 0, 0.6431373, 1,
1.248523, -0.8076278, 2.830388, 1, 0, 0.6352941, 1,
1.254278, 0.8450293, 2.384814, 1, 0, 0.6313726, 1,
1.259488, -1.376227, 1.852942, 1, 0, 0.6235294, 1,
1.262927, -0.2226819, 2.704721, 1, 0, 0.6196079, 1,
1.264663, -0.4564963, 3.063369, 1, 0, 0.6117647, 1,
1.266853, -0.8692552, 2.430303, 1, 0, 0.6078432, 1,
1.275287, -0.1376097, -0.03591237, 1, 0, 0.6, 1,
1.276256, 0.2654738, 2.946705, 1, 0, 0.5921569, 1,
1.294892, -0.6056188, 2.37597, 1, 0, 0.5882353, 1,
1.305083, -0.6561474, 1.375158, 1, 0, 0.5803922, 1,
1.307927, 0.5310914, 1.266911, 1, 0, 0.5764706, 1,
1.322583, 0.01113157, 3.292238, 1, 0, 0.5686275, 1,
1.334811, 1.465447, -0.5400835, 1, 0, 0.5647059, 1,
1.342153, -1.576737, 2.100167, 1, 0, 0.5568628, 1,
1.353406, -0.533015, 2.025028, 1, 0, 0.5529412, 1,
1.353759, 2.83281, 0.5746439, 1, 0, 0.5450981, 1,
1.360391, -0.6732995, 1.419803, 1, 0, 0.5411765, 1,
1.369117, -0.7436672, 3.366426, 1, 0, 0.5333334, 1,
1.378602, -1.957914, 3.878357, 1, 0, 0.5294118, 1,
1.380965, 2.154745, -0.1092165, 1, 0, 0.5215687, 1,
1.393254, -0.2523394, 1.635978, 1, 0, 0.5176471, 1,
1.394085, 0.4565126, 2.413672, 1, 0, 0.509804, 1,
1.416162, 0.9740342, -0.2114957, 1, 0, 0.5058824, 1,
1.437086, 0.3849156, 1.796678, 1, 0, 0.4980392, 1,
1.451987, 0.2901455, 0.1166269, 1, 0, 0.4901961, 1,
1.466032, -0.5546069, 0.9330208, 1, 0, 0.4862745, 1,
1.469467, 0.1942301, 0.8710855, 1, 0, 0.4784314, 1,
1.474253, -1.440106, 1.814561, 1, 0, 0.4745098, 1,
1.477541, 0.03768987, 1.546423, 1, 0, 0.4666667, 1,
1.488984, 0.4250119, 2.004434, 1, 0, 0.4627451, 1,
1.496257, -1.206938, 2.652725, 1, 0, 0.454902, 1,
1.499946, -0.8866563, 2.504111, 1, 0, 0.4509804, 1,
1.501723, -1.405318, 1.308898, 1, 0, 0.4431373, 1,
1.512349, 1.116252, -0.266385, 1, 0, 0.4392157, 1,
1.513158, 0.5490028, 0.9400206, 1, 0, 0.4313726, 1,
1.521217, -0.2635143, 2.730964, 1, 0, 0.427451, 1,
1.521399, 0.4009343, 0.5492586, 1, 0, 0.4196078, 1,
1.538529, -0.05929866, 3.015423, 1, 0, 0.4156863, 1,
1.546343, -0.9469752, 3.072918, 1, 0, 0.4078431, 1,
1.554229, -1.029504, 0.6082558, 1, 0, 0.4039216, 1,
1.562703, 2.197216, -0.5373734, 1, 0, 0.3960784, 1,
1.571212, 0.05721805, 2.248458, 1, 0, 0.3882353, 1,
1.590632, 1.116907, 1.087882, 1, 0, 0.3843137, 1,
1.610834, 0.3886732, -0.5730204, 1, 0, 0.3764706, 1,
1.616979, 1.18906, 1.789588, 1, 0, 0.372549, 1,
1.630859, 0.8535315, 0.8212422, 1, 0, 0.3647059, 1,
1.637753, -0.4052333, 1.723528, 1, 0, 0.3607843, 1,
1.639192, 0.5644038, 2.31747, 1, 0, 0.3529412, 1,
1.642377, -0.8022746, 0.2568015, 1, 0, 0.3490196, 1,
1.670047, -0.9392123, 2.700445, 1, 0, 0.3411765, 1,
1.670582, 0.4330401, 1.853256, 1, 0, 0.3372549, 1,
1.683128, 0.3349702, 2.954043, 1, 0, 0.3294118, 1,
1.695033, -0.4315177, 1.552457, 1, 0, 0.3254902, 1,
1.704763, -1.730754, 2.224768, 1, 0, 0.3176471, 1,
1.706293, 0.3670525, 1.820113, 1, 0, 0.3137255, 1,
1.722681, 0.8521116, 0.5534711, 1, 0, 0.3058824, 1,
1.722871, 0.3320578, 0.7691902, 1, 0, 0.2980392, 1,
1.734309, 0.5710106, 0.1720908, 1, 0, 0.2941177, 1,
1.746369, -0.7269652, 2.162849, 1, 0, 0.2862745, 1,
1.760441, 0.51884, 1.15728, 1, 0, 0.282353, 1,
1.773678, -0.01195408, 1.799733, 1, 0, 0.2745098, 1,
1.782255, -2.28957, 3.678392, 1, 0, 0.2705882, 1,
1.802188, -2.305387, 4.47466, 1, 0, 0.2627451, 1,
1.824837, -0.7368532, 2.391692, 1, 0, 0.2588235, 1,
1.826059, -0.06128699, 0.1620544, 1, 0, 0.2509804, 1,
1.833769, 0.3634475, 1.01795, 1, 0, 0.2470588, 1,
1.837633, -0.50178, 1.393941, 1, 0, 0.2392157, 1,
1.837709, -0.8428403, 2.322292, 1, 0, 0.2352941, 1,
1.854896, -0.1906542, 3.104323, 1, 0, 0.227451, 1,
1.863173, 1.085247, 0.646343, 1, 0, 0.2235294, 1,
1.882597, -0.01615431, 2.644678, 1, 0, 0.2156863, 1,
1.90402, -0.07264785, 1.226393, 1, 0, 0.2117647, 1,
1.910109, 1.459897, 0.7251002, 1, 0, 0.2039216, 1,
1.911753, 0.3397633, 2.908035, 1, 0, 0.1960784, 1,
1.928371, -1.069427, 0.2131694, 1, 0, 0.1921569, 1,
1.940926, -0.2679251, 1.574221, 1, 0, 0.1843137, 1,
1.959438, 1.023287, 2.831874, 1, 0, 0.1803922, 1,
1.961496, -0.4789928, 2.93758, 1, 0, 0.172549, 1,
1.972337, 0.9935943, 1.648221, 1, 0, 0.1686275, 1,
2.01737, -0.2049033, 2.285794, 1, 0, 0.1607843, 1,
2.028508, -1.503082, 2.940907, 1, 0, 0.1568628, 1,
2.033988, 1.50677, 1.158127, 1, 0, 0.1490196, 1,
2.052266, 1.277235, 1.802645, 1, 0, 0.145098, 1,
2.06698, 1.516895, 1.812095, 1, 0, 0.1372549, 1,
2.0831, 0.512895, 1.035828, 1, 0, 0.1333333, 1,
2.113128, -0.903668, 1.557838, 1, 0, 0.1254902, 1,
2.131188, -0.797761, 1.082699, 1, 0, 0.1215686, 1,
2.141569, 0.9914653, 1.737021, 1, 0, 0.1137255, 1,
2.185662, -1.690301, 2.383156, 1, 0, 0.1098039, 1,
2.222916, 3.43819, -0.07439564, 1, 0, 0.1019608, 1,
2.249939, -1.332478, 2.085664, 1, 0, 0.09411765, 1,
2.287155, -0.295791, 2.113034, 1, 0, 0.09019608, 1,
2.295438, -1.290389, 2.726155, 1, 0, 0.08235294, 1,
2.350255, -1.126197, -0.136936, 1, 0, 0.07843138, 1,
2.397107, 0.141907, 1.114599, 1, 0, 0.07058824, 1,
2.453071, -0.890259, 1.403855, 1, 0, 0.06666667, 1,
2.464849, -1.243455, 0.4962681, 1, 0, 0.05882353, 1,
2.475957, -0.4615434, 1.337738, 1, 0, 0.05490196, 1,
2.476821, -0.3852295, 1.546137, 1, 0, 0.04705882, 1,
2.507051, -1.898201, 2.459742, 1, 0, 0.04313726, 1,
2.543992, 1.724695, 0.7644016, 1, 0, 0.03529412, 1,
2.557505, -0.9284919, -0.4299107, 1, 0, 0.03137255, 1,
2.666953, -0.9431925, 0.9909464, 1, 0, 0.02352941, 1,
2.874619, 0.5124776, 0.1484402, 1, 0, 0.01960784, 1,
2.921386, -0.3074187, 1.329222, 1, 0, 0.01176471, 1,
2.963907, -0.2019363, 2.394155, 1, 0, 0.007843138, 1
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
-0.0933702, -4.481394, -7.45847, 0, -0.5, 0.5, 0.5,
-0.0933702, -4.481394, -7.45847, 1, -0.5, 0.5, 0.5,
-0.0933702, -4.481394, -7.45847, 1, 1.5, 0.5, 0.5,
-0.0933702, -4.481394, -7.45847, 0, 1.5, 0.5, 0.5
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
-4.187064, 0.05230546, -7.45847, 0, -0.5, 0.5, 0.5,
-4.187064, 0.05230546, -7.45847, 1, -0.5, 0.5, 0.5,
-4.187064, 0.05230546, -7.45847, 1, 1.5, 0.5, 0.5,
-4.187064, 0.05230546, -7.45847, 0, 1.5, 0.5, 0.5
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
-4.187064, -4.481394, -0.1493227, 0, -0.5, 0.5, 0.5,
-4.187064, -4.481394, -0.1493227, 1, -0.5, 0.5, 0.5,
-4.187064, -4.481394, -0.1493227, 1, 1.5, 0.5, 0.5,
-4.187064, -4.481394, -0.1493227, 0, 1.5, 0.5, 0.5
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
-3, -3.435156, -5.771744,
2, -3.435156, -5.771744,
-3, -3.435156, -5.771744,
-3, -3.609529, -6.052865,
-2, -3.435156, -5.771744,
-2, -3.609529, -6.052865,
-1, -3.435156, -5.771744,
-1, -3.609529, -6.052865,
0, -3.435156, -5.771744,
0, -3.609529, -6.052865,
1, -3.435156, -5.771744,
1, -3.609529, -6.052865,
2, -3.435156, -5.771744,
2, -3.609529, -6.052865
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
-3, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
-3, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
-3, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
-3, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5,
-2, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
-2, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
-2, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
-2, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5,
-1, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
-1, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
-1, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
-1, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5,
0, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
0, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
0, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
0, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5,
1, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
1, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
1, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
1, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5,
2, -3.958275, -6.615107, 0, -0.5, 0.5, 0.5,
2, -3.958275, -6.615107, 1, -0.5, 0.5, 0.5,
2, -3.958275, -6.615107, 1, 1.5, 0.5, 0.5,
2, -3.958275, -6.615107, 0, 1.5, 0.5, 0.5
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
-3.242365, -3, -5.771744,
-3.242365, 3, -5.771744,
-3.242365, -3, -5.771744,
-3.399815, -3, -6.052865,
-3.242365, -2, -5.771744,
-3.399815, -2, -6.052865,
-3.242365, -1, -5.771744,
-3.399815, -1, -6.052865,
-3.242365, 0, -5.771744,
-3.399815, 0, -6.052865,
-3.242365, 1, -5.771744,
-3.399815, 1, -6.052865,
-3.242365, 2, -5.771744,
-3.399815, 2, -6.052865,
-3.242365, 3, -5.771744,
-3.399815, 3, -6.052865
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
-3.714715, -3, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, -3, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, -3, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, -3, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, -2, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, -2, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, -2, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, -2, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, -1, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, -1, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, -1, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, -1, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, 0, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, 0, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, 0, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, 0, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, 1, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, 1, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, 1, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, 1, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, 2, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, 2, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, 2, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, 2, -6.615107, 0, 1.5, 0.5, 0.5,
-3.714715, 3, -6.615107, 0, -0.5, 0.5, 0.5,
-3.714715, 3, -6.615107, 1, -0.5, 0.5, 0.5,
-3.714715, 3, -6.615107, 1, 1.5, 0.5, 0.5,
-3.714715, 3, -6.615107, 0, 1.5, 0.5, 0.5
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
-3.242365, -3.435156, -4,
-3.242365, -3.435156, 4,
-3.242365, -3.435156, -4,
-3.399815, -3.609529, -4,
-3.242365, -3.435156, -2,
-3.399815, -3.609529, -2,
-3.242365, -3.435156, 0,
-3.399815, -3.609529, 0,
-3.242365, -3.435156, 2,
-3.399815, -3.609529, 2,
-3.242365, -3.435156, 4,
-3.399815, -3.609529, 4
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
-3.714715, -3.958275, -4, 0, -0.5, 0.5, 0.5,
-3.714715, -3.958275, -4, 1, -0.5, 0.5, 0.5,
-3.714715, -3.958275, -4, 1, 1.5, 0.5, 0.5,
-3.714715, -3.958275, -4, 0, 1.5, 0.5, 0.5,
-3.714715, -3.958275, -2, 0, -0.5, 0.5, 0.5,
-3.714715, -3.958275, -2, 1, -0.5, 0.5, 0.5,
-3.714715, -3.958275, -2, 1, 1.5, 0.5, 0.5,
-3.714715, -3.958275, -2, 0, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 0, 0, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 0, 1, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 0, 1, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 0, 0, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 2, 0, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 2, 1, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 2, 1, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 2, 0, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 4, 0, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 4, 1, -0.5, 0.5, 0.5,
-3.714715, -3.958275, 4, 1, 1.5, 0.5, 0.5,
-3.714715, -3.958275, 4, 0, 1.5, 0.5, 0.5
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
-3.242365, -3.435156, -5.771744,
-3.242365, 3.539767, -5.771744,
-3.242365, -3.435156, 5.473098,
-3.242365, 3.539767, 5.473098,
-3.242365, -3.435156, -5.771744,
-3.242365, -3.435156, 5.473098,
-3.242365, 3.539767, -5.771744,
-3.242365, 3.539767, 5.473098,
-3.242365, -3.435156, -5.771744,
3.055625, -3.435156, -5.771744,
-3.242365, -3.435156, 5.473098,
3.055625, -3.435156, 5.473098,
-3.242365, 3.539767, -5.771744,
3.055625, 3.539767, -5.771744,
-3.242365, 3.539767, 5.473098,
3.055625, 3.539767, 5.473098,
3.055625, -3.435156, -5.771744,
3.055625, 3.539767, -5.771744,
3.055625, -3.435156, 5.473098,
3.055625, 3.539767, 5.473098,
3.055625, -3.435156, -5.771744,
3.055625, -3.435156, 5.473098,
3.055625, 3.539767, -5.771744,
3.055625, 3.539767, 5.473098
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
var radius = 7.825334;
var distance = 34.8158;
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
mvMatrix.translate( 0.0933702, -0.05230546, 0.1493227 );
mvMatrix.scale( 1.343429, 1.213046, 0.7524254 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8158);
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
2-Imidazolidinethion<-read.table("2-Imidazolidinethion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-Imidazolidinethion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Imidazolidinethion' not found
```

```r
y<-2-Imidazolidinethion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Imidazolidinethion' not found
```

```r
z<-2-Imidazolidinethion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Imidazolidinethion' not found
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
-3.150647, -0.1151147, -1.000321, 0, 0, 1, 1, 1,
-2.955012, -0.749953, -0.8073575, 1, 0, 0, 1, 1,
-2.639684, 0.07446584, -1.498741, 1, 0, 0, 1, 1,
-2.612378, 1.52971, -1.977839, 1, 0, 0, 1, 1,
-2.56373, -0.5263846, -1.878642, 1, 0, 0, 1, 1,
-2.504011, -0.461953, -0.4090377, 1, 0, 0, 1, 1,
-2.487601, -1.763311, -2.764908, 0, 0, 0, 1, 1,
-2.475683, 0.8248864, -2.481616, 0, 0, 0, 1, 1,
-2.432127, 1.17187, -1.650733, 0, 0, 0, 1, 1,
-2.243758, 0.02570349, -2.421975, 0, 0, 0, 1, 1,
-2.160058, -2.554299, -4.736856, 0, 0, 0, 1, 1,
-2.154869, -0.7377671, -1.797727, 0, 0, 0, 1, 1,
-2.135111, -1.218399, -2.003302, 0, 0, 0, 1, 1,
-2.12367, -0.190196, -1.509645, 1, 1, 1, 1, 1,
-2.117245, -0.6405929, -2.187802, 1, 1, 1, 1, 1,
-2.086747, 0.4473644, -1.55444, 1, 1, 1, 1, 1,
-2.072665, 0.7921816, -2.040837, 1, 1, 1, 1, 1,
-2.047273, -1.778249, -1.877074, 1, 1, 1, 1, 1,
-2.040046, 0.4113796, -0.3167251, 1, 1, 1, 1, 1,
-2.021946, 0.7123863, -1.990289, 1, 1, 1, 1, 1,
-2.008893, -1.128328, -2.504596, 1, 1, 1, 1, 1,
-1.99398, 1.494803, -1.62184, 1, 1, 1, 1, 1,
-1.991671, 1.674325, -1.40054, 1, 1, 1, 1, 1,
-1.983539, -0.9340855, -3.92906, 1, 1, 1, 1, 1,
-1.983177, -2.177845, -1.675916, 1, 1, 1, 1, 1,
-1.97507, 1.011252, -1.122316, 1, 1, 1, 1, 1,
-1.96298, -2.098789, -4.035719, 1, 1, 1, 1, 1,
-1.937684, -1.258386, -0.696909, 1, 1, 1, 1, 1,
-1.931021, -0.6569761, -0.987875, 0, 0, 1, 1, 1,
-1.923309, 0.1416393, -1.564536, 1, 0, 0, 1, 1,
-1.912514, 0.3593838, -3.618431, 1, 0, 0, 1, 1,
-1.888941, -0.7916293, -2.887743, 1, 0, 0, 1, 1,
-1.855441, 0.8064678, -0.9788045, 1, 0, 0, 1, 1,
-1.839878, 0.6766655, -0.8551397, 1, 0, 0, 1, 1,
-1.837762, 0.7783616, -2.583045, 0, 0, 0, 1, 1,
-1.823892, -0.1745579, -1.082039, 0, 0, 0, 1, 1,
-1.798135, -2.149512, -3.72568, 0, 0, 0, 1, 1,
-1.758388, 0.03134994, -3.188452, 0, 0, 0, 1, 1,
-1.749849, -1.173911, -2.150414, 0, 0, 0, 1, 1,
-1.745349, -0.5324665, -1.50736, 0, 0, 0, 1, 1,
-1.739698, -1.549276, -3.12004, 0, 0, 0, 1, 1,
-1.733729, 0.1744166, -3.013978, 1, 1, 1, 1, 1,
-1.725953, -0.0471111, -1.112817, 1, 1, 1, 1, 1,
-1.725122, -0.4303516, -2.497932, 1, 1, 1, 1, 1,
-1.706732, -0.7831553, -2.615418, 1, 1, 1, 1, 1,
-1.701942, -0.6338183, -3.421425, 1, 1, 1, 1, 1,
-1.696342, -1.433376, -0.5704023, 1, 1, 1, 1, 1,
-1.677723, -0.5653545, -0.9654004, 1, 1, 1, 1, 1,
-1.674744, 0.7594488, -0.9801956, 1, 1, 1, 1, 1,
-1.670207, -0.2320216, -2.782075, 1, 1, 1, 1, 1,
-1.661882, -1.180316, -1.436345, 1, 1, 1, 1, 1,
-1.637484, -0.6773625, -1.452632, 1, 1, 1, 1, 1,
-1.626929, 1.105094, -1.525675, 1, 1, 1, 1, 1,
-1.624873, 0.1906862, -1.21101, 1, 1, 1, 1, 1,
-1.619983, -0.3889029, -3.652402, 1, 1, 1, 1, 1,
-1.616274, 1.610672, -0.7146264, 1, 1, 1, 1, 1,
-1.608541, 0.0949912, -2.272684, 0, 0, 1, 1, 1,
-1.562218, -0.1684231, -3.041856, 1, 0, 0, 1, 1,
-1.549933, -0.008043617, -1.143442, 1, 0, 0, 1, 1,
-1.546644, -0.148267, -2.230824, 1, 0, 0, 1, 1,
-1.542752, -0.8424947, -2.496302, 1, 0, 0, 1, 1,
-1.533735, 2.131283, -1.500172, 1, 0, 0, 1, 1,
-1.530934, -0.4323468, -2.197819, 0, 0, 0, 1, 1,
-1.504969, 0.6962729, -1.454163, 0, 0, 0, 1, 1,
-1.503991, 0.08130158, -1.783958, 0, 0, 0, 1, 1,
-1.502108, -0.3566119, -1.115422, 0, 0, 0, 1, 1,
-1.48913, -1.552199, -2.644052, 0, 0, 0, 1, 1,
-1.486968, -0.3702915, -1.89964, 0, 0, 0, 1, 1,
-1.471024, 0.4919298, -1.81236, 0, 0, 0, 1, 1,
-1.470485, -1.30822, -3.187364, 1, 1, 1, 1, 1,
-1.465711, 1.900046, 0.9033013, 1, 1, 1, 1, 1,
-1.465137, -0.1278245, -2.375461, 1, 1, 1, 1, 1,
-1.454913, 0.2676432, -1.432354, 1, 1, 1, 1, 1,
-1.451028, -0.9698725, -0.2934009, 1, 1, 1, 1, 1,
-1.447989, 0.2988983, -2.272726, 1, 1, 1, 1, 1,
-1.439972, 1.769797, -1.646153, 1, 1, 1, 1, 1,
-1.43333, -0.3747925, -2.532488, 1, 1, 1, 1, 1,
-1.430602, -1.575618, -2.215864, 1, 1, 1, 1, 1,
-1.425297, 0.8532944, -0.9294237, 1, 1, 1, 1, 1,
-1.422948, -1.443766, -3.857703, 1, 1, 1, 1, 1,
-1.422536, -1.360228, -2.7062, 1, 1, 1, 1, 1,
-1.410357, 0.2240867, -0.4767102, 1, 1, 1, 1, 1,
-1.40801, 2.54881, -0.4752026, 1, 1, 1, 1, 1,
-1.406966, 0.7710176, -1.188295, 1, 1, 1, 1, 1,
-1.384004, -0.3795487, -1.755344, 0, 0, 1, 1, 1,
-1.370059, -0.3794233, -3.466383, 1, 0, 0, 1, 1,
-1.365147, 1.319231, -1.243116, 1, 0, 0, 1, 1,
-1.354623, 1.057817, 0.761225, 1, 0, 0, 1, 1,
-1.349543, 1.306806, -0.564483, 1, 0, 0, 1, 1,
-1.346758, -0.4610733, -2.304156, 1, 0, 0, 1, 1,
-1.341174, -1.25273, -2.319141, 0, 0, 0, 1, 1,
-1.339561, -0.3333458, -1.386408, 0, 0, 0, 1, 1,
-1.333497, -0.009537796, -3.767836, 0, 0, 0, 1, 1,
-1.331029, 0.4893089, 0.3209896, 0, 0, 0, 1, 1,
-1.329345, 1.266185, -0.7069728, 0, 0, 0, 1, 1,
-1.316673, -1.811075, -0.8367812, 0, 0, 0, 1, 1,
-1.303444, 0.2783423, -1.225982, 0, 0, 0, 1, 1,
-1.272012, -0.5965083, -1.857154, 1, 1, 1, 1, 1,
-1.268673, -0.6157043, -1.48953, 1, 1, 1, 1, 1,
-1.243888, -0.2712878, -1.866781, 1, 1, 1, 1, 1,
-1.234169, 0.5715664, -0.4195828, 1, 1, 1, 1, 1,
-1.220643, -1.55675, -3.919765, 1, 1, 1, 1, 1,
-1.214168, -0.06698637, -1.517512, 1, 1, 1, 1, 1,
-1.202211, 1.014163, -1.296301, 1, 1, 1, 1, 1,
-1.195241, 0.1359288, -0.7852733, 1, 1, 1, 1, 1,
-1.192712, 0.7416203, -2.033436, 1, 1, 1, 1, 1,
-1.191468, -0.0681945, -0.7771892, 1, 1, 1, 1, 1,
-1.186781, 1.120257, 0.2598944, 1, 1, 1, 1, 1,
-1.182592, -0.6566551, -3.02042, 1, 1, 1, 1, 1,
-1.182284, 0.01715091, -2.037047, 1, 1, 1, 1, 1,
-1.172029, -0.4823014, -1.268719, 1, 1, 1, 1, 1,
-1.17087, -2.447229, -1.548322, 1, 1, 1, 1, 1,
-1.163969, 0.2830065, -0.1093467, 0, 0, 1, 1, 1,
-1.154789, -0.7108561, -2.205952, 1, 0, 0, 1, 1,
-1.150664, 1.246689, -1.652607, 1, 0, 0, 1, 1,
-1.149531, 1.750243, -1.021052, 1, 0, 0, 1, 1,
-1.143616, 0.4661607, -0.192772, 1, 0, 0, 1, 1,
-1.130409, -0.8001871, -3.210174, 1, 0, 0, 1, 1,
-1.128134, 0.6369007, -1.205379, 0, 0, 0, 1, 1,
-1.127626, 2.470916, -0.7467953, 0, 0, 0, 1, 1,
-1.123341, -0.3600543, -2.348511, 0, 0, 0, 1, 1,
-1.121793, -1.793227, -2.757172, 0, 0, 0, 1, 1,
-1.120342, 1.190964, -1.575521, 0, 0, 0, 1, 1,
-1.117808, 0.331095, 0.6411167, 0, 0, 0, 1, 1,
-1.11689, 0.3112291, 0.05920204, 0, 0, 0, 1, 1,
-1.116797, -1.460145, -2.583644, 1, 1, 1, 1, 1,
-1.10866, 0.5244448, -0.7813241, 1, 1, 1, 1, 1,
-1.108295, 1.322798, 0.5594807, 1, 1, 1, 1, 1,
-1.10817, -0.2394012, -0.2738873, 1, 1, 1, 1, 1,
-1.103817, -0.7973844, -2.062906, 1, 1, 1, 1, 1,
-1.100411, 0.5926821, 0.2494095, 1, 1, 1, 1, 1,
-1.093903, -0.2667218, -3.104883, 1, 1, 1, 1, 1,
-1.078625, -0.5916998, -1.861437, 1, 1, 1, 1, 1,
-1.077384, 0.8487313, -0.3003374, 1, 1, 1, 1, 1,
-1.069899, 0.6424965, -0.9169718, 1, 1, 1, 1, 1,
-1.065831, -1.884779, -3.19955, 1, 1, 1, 1, 1,
-1.064243, -0.7104912, -3.52304, 1, 1, 1, 1, 1,
-1.062594, -0.4875124, -0.6031392, 1, 1, 1, 1, 1,
-1.062113, -0.3616954, -1.948714, 1, 1, 1, 1, 1,
-1.049094, 1.135622, -1.178806, 1, 1, 1, 1, 1,
-1.047366, 1.233969, -1.245666, 0, 0, 1, 1, 1,
-1.044211, -0.1234093, -0.6652946, 1, 0, 0, 1, 1,
-1.040145, -1.476654, -1.478495, 1, 0, 0, 1, 1,
-1.032746, 1.186191, 0.6806647, 1, 0, 0, 1, 1,
-1.019739, -0.8275114, -2.447677, 1, 0, 0, 1, 1,
-1.016852, -0.5990081, -2.785298, 1, 0, 0, 1, 1,
-1.016753, 0.1796516, -3.246897, 0, 0, 0, 1, 1,
-1.015607, -0.0003979451, -2.003814, 0, 0, 0, 1, 1,
-1.006983, -0.1012451, -1.421964, 0, 0, 0, 1, 1,
-1.001796, -1.36039, -3.545369, 0, 0, 0, 1, 1,
-0.9887888, 1.202031, -1.646586, 0, 0, 0, 1, 1,
-0.9868973, -0.5549493, -0.8034992, 0, 0, 0, 1, 1,
-0.9849913, -1.323821, -1.503327, 0, 0, 0, 1, 1,
-0.9831782, 1.463132, -2.06977, 1, 1, 1, 1, 1,
-0.9798118, 0.1121216, 0.006025287, 1, 1, 1, 1, 1,
-0.9772578, 0.8658568, 0.7078122, 1, 1, 1, 1, 1,
-0.9727845, 0.2036049, -1.230361, 1, 1, 1, 1, 1,
-0.9711321, 0.5351227, 0.293683, 1, 1, 1, 1, 1,
-0.9672171, 0.6949037, -1.06387, 1, 1, 1, 1, 1,
-0.9648092, 0.1160538, -2.478037, 1, 1, 1, 1, 1,
-0.9645969, -1.312692, -3.016714, 1, 1, 1, 1, 1,
-0.9614428, -0.1367798, -2.281943, 1, 1, 1, 1, 1,
-0.9569666, 1.410681, -1.188667, 1, 1, 1, 1, 1,
-0.9427854, 1.446681, -0.2842101, 1, 1, 1, 1, 1,
-0.9418141, 0.6667156, -1.927808, 1, 1, 1, 1, 1,
-0.932969, -1.046691, -1.141651, 1, 1, 1, 1, 1,
-0.9323089, 0.354099, -1.372161, 1, 1, 1, 1, 1,
-0.9248883, 0.4833606, 0.2740535, 1, 1, 1, 1, 1,
-0.9234869, 0.2853656, -2.524947, 0, 0, 1, 1, 1,
-0.9222887, 0.4483082, -1.830308, 1, 0, 0, 1, 1,
-0.9138028, -0.7532335, -2.365828, 1, 0, 0, 1, 1,
-0.9123607, -1.265093, -3.177905, 1, 0, 0, 1, 1,
-0.9088233, 0.2952598, -1.188156, 1, 0, 0, 1, 1,
-0.8999703, 1.129118, -0.6527719, 1, 0, 0, 1, 1,
-0.8990929, -0.3665818, -0.5970556, 0, 0, 0, 1, 1,
-0.8973293, -1.508285, -2.116704, 0, 0, 0, 1, 1,
-0.8912885, -0.08445217, -0.0227728, 0, 0, 0, 1, 1,
-0.8900032, -0.2357896, -2.127549, 0, 0, 0, 1, 1,
-0.8860947, -1.225314, -2.955159, 0, 0, 0, 1, 1,
-0.8744664, 0.1340118, -1.975663, 0, 0, 0, 1, 1,
-0.8737336, 0.4856415, -1.617468, 0, 0, 0, 1, 1,
-0.8660853, -0.7100214, -2.3033, 1, 1, 1, 1, 1,
-0.8607873, 0.2605393, -0.7822478, 1, 1, 1, 1, 1,
-0.8603137, -1.958254, -1.768764, 1, 1, 1, 1, 1,
-0.8595428, 1.185213, -0.1119865, 1, 1, 1, 1, 1,
-0.8580238, 0.729747, -2.143711, 1, 1, 1, 1, 1,
-0.8510242, -1.058674, -3.242872, 1, 1, 1, 1, 1,
-0.8503078, 1.325058, 0.5272855, 1, 1, 1, 1, 1,
-0.8495458, -0.8781586, -1.525982, 1, 1, 1, 1, 1,
-0.8480817, -0.3438157, -2.50549, 1, 1, 1, 1, 1,
-0.8448968, 0.4949075, -0.1751366, 1, 1, 1, 1, 1,
-0.8419923, -1.240295, -2.324839, 1, 1, 1, 1, 1,
-0.8378429, -0.3440129, -0.2585368, 1, 1, 1, 1, 1,
-0.8319184, 0.5218658, -1.852156, 1, 1, 1, 1, 1,
-0.8271462, 1.042405, -0.5527766, 1, 1, 1, 1, 1,
-0.8250873, -2.261074, -3.457624, 1, 1, 1, 1, 1,
-0.8217941, -0.758234, -2.001689, 0, 0, 1, 1, 1,
-0.8210431, -0.1676468, -1.021395, 1, 0, 0, 1, 1,
-0.8197585, -0.2149919, -2.333792, 1, 0, 0, 1, 1,
-0.8187696, -0.4768311, -2.021192, 1, 0, 0, 1, 1,
-0.8184135, -0.7943286, -0.8882399, 1, 0, 0, 1, 1,
-0.8180257, -0.3643226, -2.312319, 1, 0, 0, 1, 1,
-0.8180253, -0.01335261, -1.219087, 0, 0, 0, 1, 1,
-0.8156601, 0.2431206, -0.7005571, 0, 0, 0, 1, 1,
-0.8150853, -0.3629122, -1.370901, 0, 0, 0, 1, 1,
-0.8037869, 0.3432672, -0.188201, 0, 0, 0, 1, 1,
-0.802506, -0.2017141, -2.369627, 0, 0, 0, 1, 1,
-0.8003899, 0.4098509, -0.9995441, 0, 0, 0, 1, 1,
-0.7996523, -0.8405076, -3.484261, 0, 0, 0, 1, 1,
-0.7977183, -0.8910434, -1.979143, 1, 1, 1, 1, 1,
-0.7936075, 0.3852699, -1.048423, 1, 1, 1, 1, 1,
-0.7919727, 2.0867, 0.5321481, 1, 1, 1, 1, 1,
-0.7908313, 0.4964973, -0.09845566, 1, 1, 1, 1, 1,
-0.7880176, -1.176589, -0.3130641, 1, 1, 1, 1, 1,
-0.7858921, 0.5219108, 0.2026639, 1, 1, 1, 1, 1,
-0.7838652, 0.701541, -1.272984, 1, 1, 1, 1, 1,
-0.7837359, -0.6661418, -1.785963, 1, 1, 1, 1, 1,
-0.7796034, 0.1852155, -0.8013497, 1, 1, 1, 1, 1,
-0.775772, 0.7693649, -1.019355, 1, 1, 1, 1, 1,
-0.7719522, 1.566113, -1.011565, 1, 1, 1, 1, 1,
-0.7707107, 0.7978647, -1.504415, 1, 1, 1, 1, 1,
-0.7679575, 0.7676435, -1.979571, 1, 1, 1, 1, 1,
-0.76639, 0.7277257, -0.876467, 1, 1, 1, 1, 1,
-0.7661434, -2.470293, -3.22391, 1, 1, 1, 1, 1,
-0.7618676, 1.966079, -1.651503, 0, 0, 1, 1, 1,
-0.7582979, -0.8838902, -4.58994, 1, 0, 0, 1, 1,
-0.7516063, -0.3664314, -1.046958, 1, 0, 0, 1, 1,
-0.7506037, 0.5885788, -1.182711, 1, 0, 0, 1, 1,
-0.749459, -1.79301, -2.452893, 1, 0, 0, 1, 1,
-0.7488414, -0.1012836, -1.888359, 1, 0, 0, 1, 1,
-0.7474924, 0.5011143, -0.2123448, 0, 0, 0, 1, 1,
-0.7444695, -1.14373, -2.998699, 0, 0, 0, 1, 1,
-0.7359882, 1.095825, -1.183007, 0, 0, 0, 1, 1,
-0.7359278, -1.206222, -0.7286656, 0, 0, 0, 1, 1,
-0.7344823, 0.7964103, -1.431867, 0, 0, 0, 1, 1,
-0.7337534, 1.487626, -0.2827921, 0, 0, 0, 1, 1,
-0.7308095, 0.1180438, -1.537228, 0, 0, 0, 1, 1,
-0.7291033, -0.216514, -4.093877, 1, 1, 1, 1, 1,
-0.7270103, -0.2726989, -1.647888, 1, 1, 1, 1, 1,
-0.7213556, 0.09595234, -2.164169, 1, 1, 1, 1, 1,
-0.7204614, 2.003534, -0.7726372, 1, 1, 1, 1, 1,
-0.7191536, 0.3069508, -1.84634, 1, 1, 1, 1, 1,
-0.7162436, -0.1399986, -0.6193533, 1, 1, 1, 1, 1,
-0.7161745, 0.2354919, 0.1202591, 1, 1, 1, 1, 1,
-0.7160227, -1.082616, -1.221305, 1, 1, 1, 1, 1,
-0.7159876, -0.7665469, -2.823096, 1, 1, 1, 1, 1,
-0.7121654, 0.5425342, -0.4267078, 1, 1, 1, 1, 1,
-0.7022339, 0.4545178, -1.767579, 1, 1, 1, 1, 1,
-0.7007577, 1.483765, -1.815607, 1, 1, 1, 1, 1,
-0.6931859, -0.09274424, -2.973193, 1, 1, 1, 1, 1,
-0.6832966, -1.589926, -3.707254, 1, 1, 1, 1, 1,
-0.6816332, -1.277649, -2.650598, 1, 1, 1, 1, 1,
-0.6812314, 1.171436, -0.7426982, 0, 0, 1, 1, 1,
-0.6802844, -1.556181, -3.81292, 1, 0, 0, 1, 1,
-0.6758687, -0.05451794, -2.361754, 1, 0, 0, 1, 1,
-0.674135, -0.7143322, -2.017145, 1, 0, 0, 1, 1,
-0.6727606, -0.604214, -2.386273, 1, 0, 0, 1, 1,
-0.6719002, 0.8511604, 1.052901, 1, 0, 0, 1, 1,
-0.670086, 0.09540603, -0.198979, 0, 0, 0, 1, 1,
-0.668261, -0.02521145, -2.89312, 0, 0, 0, 1, 1,
-0.6638545, -1.995564, -2.479431, 0, 0, 0, 1, 1,
-0.6617175, -1.082458, -2.213232, 0, 0, 0, 1, 1,
-0.6591384, 0.2746499, -1.835456, 0, 0, 0, 1, 1,
-0.6557922, 0.256894, -0.2386795, 0, 0, 0, 1, 1,
-0.6449869, -0.3573556, -4.022614, 0, 0, 0, 1, 1,
-0.6429503, 0.6307095, -2.185707, 1, 1, 1, 1, 1,
-0.6415567, -0.1316472, -0.9714832, 1, 1, 1, 1, 1,
-0.6373374, 0.07751054, -2.408379, 1, 1, 1, 1, 1,
-0.6345952, 2.05915, 0.3208781, 1, 1, 1, 1, 1,
-0.63318, -0.07849319, -2.956527, 1, 1, 1, 1, 1,
-0.6314871, -1.578722, -3.89909, 1, 1, 1, 1, 1,
-0.6294588, -0.8950781, -2.489045, 1, 1, 1, 1, 1,
-0.6266221, 1.897884, -0.4814939, 1, 1, 1, 1, 1,
-0.6264309, -0.8779476, -1.125084, 1, 1, 1, 1, 1,
-0.6255317, -0.5987812, -3.383336, 1, 1, 1, 1, 1,
-0.6247547, -0.7614415, -2.971927, 1, 1, 1, 1, 1,
-0.6245893, -0.6806791, -1.136486, 1, 1, 1, 1, 1,
-0.6219541, -0.03131033, -0.3624327, 1, 1, 1, 1, 1,
-0.6158196, 0.2924972, -1.127713, 1, 1, 1, 1, 1,
-0.6147335, 0.06670091, -0.6910194, 1, 1, 1, 1, 1,
-0.6140908, 1.115543, -2.196712, 0, 0, 1, 1, 1,
-0.6131859, 1.046173, -1.395445, 1, 0, 0, 1, 1,
-0.6122469, -1.434111, -3.575417, 1, 0, 0, 1, 1,
-0.61001, 0.6379766, 1.25772, 1, 0, 0, 1, 1,
-0.6047203, 0.5576084, -1.166586, 1, 0, 0, 1, 1,
-0.6028249, 1.193278, 0.04233797, 1, 0, 0, 1, 1,
-0.5984876, 1.43794, -2.187326, 0, 0, 0, 1, 1,
-0.5960078, -0.692478, -3.17412, 0, 0, 0, 1, 1,
-0.5938298, -1.517283, 0.01601593, 0, 0, 0, 1, 1,
-0.5875452, 0.186526, -1.906952, 0, 0, 0, 1, 1,
-0.5839348, -0.1797196, -1.045717, 0, 0, 0, 1, 1,
-0.5829781, -0.3792225, -0.7534423, 0, 0, 0, 1, 1,
-0.578678, -0.5200286, -3.561083, 0, 0, 0, 1, 1,
-0.575475, -1.984575, -2.208772, 1, 1, 1, 1, 1,
-0.5738633, 0.4501951, -1.312848, 1, 1, 1, 1, 1,
-0.5667756, 0.8844736, -1.586467, 1, 1, 1, 1, 1,
-0.5647123, 0.4006597, -2.320974, 1, 1, 1, 1, 1,
-0.5605544, 0.337863, -2.725614, 1, 1, 1, 1, 1,
-0.556485, 0.08614054, -1.504588, 1, 1, 1, 1, 1,
-0.5554318, 0.1839623, -2.46567, 1, 1, 1, 1, 1,
-0.5507978, 0.3363251, -0.7934808, 1, 1, 1, 1, 1,
-0.5430177, 0.9906753, -0.966888, 1, 1, 1, 1, 1,
-0.5363061, 0.5699133, -2.131389, 1, 1, 1, 1, 1,
-0.5315946, 0.1023307, -0.9750108, 1, 1, 1, 1, 1,
-0.5282084, -0.7886268, -2.174788, 1, 1, 1, 1, 1,
-0.5275666, 0.6445051, 0.5571514, 1, 1, 1, 1, 1,
-0.5264251, 0.2540197, -1.32563, 1, 1, 1, 1, 1,
-0.5249267, -0.4889316, -3.637088, 1, 1, 1, 1, 1,
-0.5240283, -1.166185, -2.958484, 0, 0, 1, 1, 1,
-0.5218728, 1.269194, -0.5865719, 1, 0, 0, 1, 1,
-0.5178128, -1.223947, -5.607984, 1, 0, 0, 1, 1,
-0.5136294, 1.285939, -0.594437, 1, 0, 0, 1, 1,
-0.5127854, 0.5271469, -1.157328, 1, 0, 0, 1, 1,
-0.5089546, -0.1249793, -5.296612, 1, 0, 0, 1, 1,
-0.5013285, 0.666553, -0.4332008, 0, 0, 0, 1, 1,
-0.4959057, 1.366247, -1.890617, 0, 0, 0, 1, 1,
-0.4957587, 1.323062, -0.0145554, 0, 0, 0, 1, 1,
-0.4876719, -1.083843, -1.860054, 0, 0, 0, 1, 1,
-0.4865897, 2.277734, 0.8579272, 0, 0, 0, 1, 1,
-0.485935, 0.613894, -0.000117456, 0, 0, 0, 1, 1,
-0.4846483, -0.2381556, -2.104543, 0, 0, 0, 1, 1,
-0.4797555, -0.8940929, -1.914101, 1, 1, 1, 1, 1,
-0.4778984, -0.4074371, -1.980709, 1, 1, 1, 1, 1,
-0.4740582, 2.320302, -1.804756, 1, 1, 1, 1, 1,
-0.4716184, -0.1283316, -2.325036, 1, 1, 1, 1, 1,
-0.4696141, 0.04206207, -0.2759736, 1, 1, 1, 1, 1,
-0.468774, 2.171292, 0.4518092, 1, 1, 1, 1, 1,
-0.4673781, -0.5740674, -3.093595, 1, 1, 1, 1, 1,
-0.4670585, -0.05238966, -2.507226, 1, 1, 1, 1, 1,
-0.4606245, 0.2159999, -1.048921, 1, 1, 1, 1, 1,
-0.457946, -2.61454, -2.591363, 1, 1, 1, 1, 1,
-0.455872, -0.6201629, -2.837212, 1, 1, 1, 1, 1,
-0.4547091, 0.5546024, 0.3069109, 1, 1, 1, 1, 1,
-0.4534929, 0.6556244, -0.9927721, 1, 1, 1, 1, 1,
-0.4532024, -0.1502586, -2.166865, 1, 1, 1, 1, 1,
-0.4498353, 0.4855755, -0.450781, 1, 1, 1, 1, 1,
-0.4464009, 0.6055306, -0.2560547, 0, 0, 1, 1, 1,
-0.4359863, 0.5855573, -0.5431556, 1, 0, 0, 1, 1,
-0.4344693, 0.8915014, 0.923094, 1, 0, 0, 1, 1,
-0.4307846, 2.30213, -1.074591, 1, 0, 0, 1, 1,
-0.4288644, 1.758591, 0.004807786, 1, 0, 0, 1, 1,
-0.4286465, 0.944935, -0.5715804, 1, 0, 0, 1, 1,
-0.4282733, 0.4056535, -0.9014376, 0, 0, 0, 1, 1,
-0.4270909, 0.09274339, -2.001669, 0, 0, 0, 1, 1,
-0.4183884, -0.3761677, -2.30715, 0, 0, 0, 1, 1,
-0.4176185, 1.094608, -0.5951345, 0, 0, 0, 1, 1,
-0.4087103, -0.4834083, -4.214836, 0, 0, 0, 1, 1,
-0.4084419, -0.8330372, -3.271895, 0, 0, 0, 1, 1,
-0.4078183, -1.712382, -2.049805, 0, 0, 0, 1, 1,
-0.405541, -1.930398, -2.712675, 1, 1, 1, 1, 1,
-0.3981737, -0.3613427, -2.241113, 1, 1, 1, 1, 1,
-0.3964394, 1.572906, -0.05285005, 1, 1, 1, 1, 1,
-0.3956518, -0.4574093, -1.935912, 1, 1, 1, 1, 1,
-0.393685, 1.509859, -0.1204047, 1, 1, 1, 1, 1,
-0.3931984, 0.5072324, -1.404916, 1, 1, 1, 1, 1,
-0.3897755, 1.009349, -0.322885, 1, 1, 1, 1, 1,
-0.389653, -1.072877, -3.253788, 1, 1, 1, 1, 1,
-0.3804861, -1.658063, -1.967333, 1, 1, 1, 1, 1,
-0.3790258, 0.2368562, 1.964262, 1, 1, 1, 1, 1,
-0.3734418, -1.160651, -2.134847, 1, 1, 1, 1, 1,
-0.3723224, 2.077901, 0.3881356, 1, 1, 1, 1, 1,
-0.3721212, 0.1300464, -4.231072, 1, 1, 1, 1, 1,
-0.3603134, 2.094863, -1.255863, 1, 1, 1, 1, 1,
-0.35807, 2.490698, 0.02641677, 1, 1, 1, 1, 1,
-0.3522426, -1.069976, -3.639966, 0, 0, 1, 1, 1,
-0.3502245, -1.048772, -4.284505, 1, 0, 0, 1, 1,
-0.3471552, -0.5116794, -0.3209772, 1, 0, 0, 1, 1,
-0.345859, 0.6532699, 0.3277841, 1, 0, 0, 1, 1,
-0.3434913, 0.6720264, -1.66496, 1, 0, 0, 1, 1,
-0.3424184, 0.2667302, -0.7714478, 1, 0, 0, 1, 1,
-0.3401681, -2.079238, -3.47933, 0, 0, 0, 1, 1,
-0.3399289, -0.9131193, -3.203578, 0, 0, 0, 1, 1,
-0.3387497, 1.040141, 0.4682065, 0, 0, 0, 1, 1,
-0.3332309, 0.5888295, 0.9217511, 0, 0, 0, 1, 1,
-0.3322292, 1.276721, -1.356036, 0, 0, 0, 1, 1,
-0.330751, -1.777741, -1.34286, 0, 0, 0, 1, 1,
-0.3269444, -0.9899525, -3.751641, 0, 0, 0, 1, 1,
-0.3253378, -0.1666055, -1.924856, 1, 1, 1, 1, 1,
-0.3232338, 0.3018878, -2.226953, 1, 1, 1, 1, 1,
-0.3216605, 1.343014, 0.0769252, 1, 1, 1, 1, 1,
-0.321568, -1.576453, -1.623929, 1, 1, 1, 1, 1,
-0.318186, -1.44851, -2.083311, 1, 1, 1, 1, 1,
-0.3140747, 0.4667411, -1.236211, 1, 1, 1, 1, 1,
-0.3090462, -0.8880414, -2.751018, 1, 1, 1, 1, 1,
-0.308735, 0.8734452, 1.708771, 1, 1, 1, 1, 1,
-0.3015888, -0.8736896, -3.905725, 1, 1, 1, 1, 1,
-0.299797, 0.1430704, -1.322501, 1, 1, 1, 1, 1,
-0.2994025, 0.2588271, -0.4217566, 1, 1, 1, 1, 1,
-0.2960543, -0.1062987, -0.1370225, 1, 1, 1, 1, 1,
-0.2935765, 0.6015199, 0.6182956, 1, 1, 1, 1, 1,
-0.2922952, 1.151689, -0.8427013, 1, 1, 1, 1, 1,
-0.292217, -1.417205, -2.987127, 1, 1, 1, 1, 1,
-0.2858714, -0.8359535, -3.361541, 0, 0, 1, 1, 1,
-0.2813766, -0.7697057, -3.767001, 1, 0, 0, 1, 1,
-0.2745996, 0.5642704, 1.417994, 1, 0, 0, 1, 1,
-0.2732433, 0.502896, -1.315917, 1, 0, 0, 1, 1,
-0.2720559, -0.5815526, -2.417274, 1, 0, 0, 1, 1,
-0.2689368, 0.1498068, -0.8410073, 1, 0, 0, 1, 1,
-0.2644235, -0.2067779, -1.329833, 0, 0, 0, 1, 1,
-0.261187, -0.2059217, -1.869737, 0, 0, 0, 1, 1,
-0.2596577, 0.2161193, -1.319208, 0, 0, 0, 1, 1,
-0.2572312, 1.965979, -2.97004, 0, 0, 0, 1, 1,
-0.2538636, -0.42931, -2.90167, 0, 0, 0, 1, 1,
-0.2501979, 0.5490631, -0.7284896, 0, 0, 0, 1, 1,
-0.2497122, -0.3078325, -2.757268, 0, 0, 0, 1, 1,
-0.2496257, -1.076355, -3.342824, 1, 1, 1, 1, 1,
-0.2485261, -0.3682169, -4.285192, 1, 1, 1, 1, 1,
-0.2460886, -0.1852926, -2.092315, 1, 1, 1, 1, 1,
-0.2459989, -0.8935573, -3.32176, 1, 1, 1, 1, 1,
-0.24544, -0.04159564, -1.692035, 1, 1, 1, 1, 1,
-0.2424233, 0.1094034, 0.9692965, 1, 1, 1, 1, 1,
-0.2419402, 0.933833, -0.7247414, 1, 1, 1, 1, 1,
-0.2376247, 1.224283, -0.1513828, 1, 1, 1, 1, 1,
-0.2357196, -0.4204827, -3.430023, 1, 1, 1, 1, 1,
-0.234919, -0.006267715, -0.8676307, 1, 1, 1, 1, 1,
-0.2340323, -1.013364, -3.03769, 1, 1, 1, 1, 1,
-0.2300793, 0.5124606, -0.3907103, 1, 1, 1, 1, 1,
-0.228822, 0.04664897, -2.96931, 1, 1, 1, 1, 1,
-0.2271299, -0.5937898, -4.059302, 1, 1, 1, 1, 1,
-0.2169669, 1.603513, -0.5304173, 1, 1, 1, 1, 1,
-0.2146359, 0.5694765, -1.073535, 0, 0, 1, 1, 1,
-0.2135122, 0.2607479, -0.6081744, 1, 0, 0, 1, 1,
-0.2071828, -0.5472447, -4.368707, 1, 0, 0, 1, 1,
-0.2055932, -0.7990191, -4.179718, 1, 0, 0, 1, 1,
-0.2028137, -0.627641, -3.510368, 1, 0, 0, 1, 1,
-0.1973491, 1.023612, -0.06062546, 1, 0, 0, 1, 1,
-0.1967984, 0.3260995, -0.5558355, 0, 0, 0, 1, 1,
-0.1959499, 0.03689222, -0.5255422, 0, 0, 0, 1, 1,
-0.1918404, 0.3637942, -0.2403335, 0, 0, 0, 1, 1,
-0.1871249, -0.4481446, -3.94812, 0, 0, 0, 1, 1,
-0.1863847, -0.2211292, -2.069968, 0, 0, 0, 1, 1,
-0.1843278, 0.3703927, 0.1978022, 0, 0, 0, 1, 1,
-0.1750362, 0.3934367, -0.7054754, 0, 0, 0, 1, 1,
-0.1747844, 0.4494861, -0.6039195, 1, 1, 1, 1, 1,
-0.1718926, -1.001185, -1.694012, 1, 1, 1, 1, 1,
-0.1668356, 1.170554, -0.3206548, 1, 1, 1, 1, 1,
-0.1659235, -0.7545333, -1.829063, 1, 1, 1, 1, 1,
-0.162662, -0.2093555, -2.347451, 1, 1, 1, 1, 1,
-0.1623384, -0.4511489, -1.079122, 1, 1, 1, 1, 1,
-0.1609369, -0.2398074, 0.1113404, 1, 1, 1, 1, 1,
-0.15962, 1.133288, -0.8667884, 1, 1, 1, 1, 1,
-0.1593764, -0.304203, -2.494383, 1, 1, 1, 1, 1,
-0.1562072, -0.3632843, -4.25403, 1, 1, 1, 1, 1,
-0.1533389, -0.4312539, -0.8969018, 1, 1, 1, 1, 1,
-0.1499755, -0.07504354, -2.573692, 1, 1, 1, 1, 1,
-0.148615, -0.2231523, -2.502231, 1, 1, 1, 1, 1,
-0.1479909, 1.663517, 0.5170055, 1, 1, 1, 1, 1,
-0.1477634, 0.4310354, -0.112737, 1, 1, 1, 1, 1,
-0.1468085, -0.1952295, -2.980097, 0, 0, 1, 1, 1,
-0.1442162, 0.4762107, -1.466472, 1, 0, 0, 1, 1,
-0.1311529, 0.2416571, -0.1531612, 1, 0, 0, 1, 1,
-0.1274796, 0.6057487, -1.373861, 1, 0, 0, 1, 1,
-0.1274788, -1.554172, -4.042068, 1, 0, 0, 1, 1,
-0.1264704, 0.5226457, -0.7140749, 1, 0, 0, 1, 1,
-0.1227342, -0.3198271, -2.419894, 0, 0, 0, 1, 1,
-0.1209379, -1.511817, -3.134055, 0, 0, 0, 1, 1,
-0.119062, -1.646541, -2.351789, 0, 0, 0, 1, 1,
-0.118334, 0.7374135, -0.3915189, 0, 0, 0, 1, 1,
-0.1151738, 0.9005293, 0.9194468, 0, 0, 0, 1, 1,
-0.1143915, 1.09933, 0.2221907, 0, 0, 0, 1, 1,
-0.1134754, 1.354525, -0.04137644, 0, 0, 0, 1, 1,
-0.110833, 1.136615, -0.50122, 1, 1, 1, 1, 1,
-0.1086238, 0.1173875, -1.058647, 1, 1, 1, 1, 1,
-0.1071603, 0.4901874, -0.4464704, 1, 1, 1, 1, 1,
-0.105727, -1.206699, -2.543577, 1, 1, 1, 1, 1,
-0.1032743, 1.019995, -1.518134, 1, 1, 1, 1, 1,
-0.1006836, -1.006982, -2.657446, 1, 1, 1, 1, 1,
-0.09540571, 0.3402825, -0.7968444, 1, 1, 1, 1, 1,
-0.09182543, -0.2452029, -2.699148, 1, 1, 1, 1, 1,
-0.08916193, 0.7069582, -0.516421, 1, 1, 1, 1, 1,
-0.08449578, 0.5239061, 0.8038429, 1, 1, 1, 1, 1,
-0.07794663, -0.9700379, -4.81406, 1, 1, 1, 1, 1,
-0.07117897, 0.1241027, -1.141434, 1, 1, 1, 1, 1,
-0.07114612, 0.5014538, -0.8189521, 1, 1, 1, 1, 1,
-0.06395561, 0.8449388, -0.8110015, 1, 1, 1, 1, 1,
-0.06233766, -0.2481739, -1.918408, 1, 1, 1, 1, 1,
-0.0619567, -0.4446179, -3.444891, 0, 0, 1, 1, 1,
-0.06114395, -1.101817, -4.60058, 1, 0, 0, 1, 1,
-0.06035344, 0.5294599, -0.7732909, 1, 0, 0, 1, 1,
-0.05996686, 0.1619584, 0.3051464, 1, 0, 0, 1, 1,
-0.05954969, -0.6135988, -2.762038, 1, 0, 0, 1, 1,
-0.05727967, 1.836694, -0.1401028, 1, 0, 0, 1, 1,
-0.05247862, -0.8652555, -1.974131, 0, 0, 0, 1, 1,
-0.04846486, 0.9335142, -0.7908582, 0, 0, 0, 1, 1,
-0.04618173, -0.2626716, -3.729315, 0, 0, 0, 1, 1,
-0.04545299, -0.6439487, -2.065545, 0, 0, 0, 1, 1,
-0.04443062, -0.9339566, -3.534093, 0, 0, 0, 1, 1,
-0.04407848, 0.2593842, -1.340528, 0, 0, 0, 1, 1,
-0.04379361, -0.1412302, -2.60206, 0, 0, 0, 1, 1,
-0.03210506, 0.1123328, -1.03282, 1, 1, 1, 1, 1,
-0.02855461, 0.3885752, 0.9519774, 1, 1, 1, 1, 1,
-0.02347833, -0.5289682, -5.1158, 1, 1, 1, 1, 1,
-0.01919133, 0.4322584, -0.07704586, 1, 1, 1, 1, 1,
-0.01530103, -1.246493, -4.086837, 1, 1, 1, 1, 1,
-0.01508682, -1.025539, -3.465237, 1, 1, 1, 1, 1,
-0.01334779, -1.329957, -2.964954, 1, 1, 1, 1, 1,
-0.009846476, 0.4779415, 1.754807, 1, 1, 1, 1, 1,
-0.008526137, -0.7270556, -3.227491, 1, 1, 1, 1, 1,
-0.002644917, -0.08687454, -1.848281, 1, 1, 1, 1, 1,
-0.002382975, -0.5647039, -3.608118, 1, 1, 1, 1, 1,
-0.002360252, -0.4982401, -3.146212, 1, 1, 1, 1, 1,
0.001161708, 0.5988463, 1.507315, 1, 1, 1, 1, 1,
0.008982867, -0.4371157, 3.088287, 1, 1, 1, 1, 1,
0.0140977, 1.22221, 0.7361944, 1, 1, 1, 1, 1,
0.01534108, 1.15696, -0.9499189, 0, 0, 1, 1, 1,
0.01675896, 1.455407, 1.494128, 1, 0, 0, 1, 1,
0.02055669, -0.8154741, 3.002792, 1, 0, 0, 1, 1,
0.02428207, 0.7128639, -1.166601, 1, 0, 0, 1, 1,
0.02517917, -0.2099768, 3.566249, 1, 0, 0, 1, 1,
0.02712015, 0.2623804, -0.2041496, 1, 0, 0, 1, 1,
0.02926759, 0.9837934, 0.287758, 0, 0, 0, 1, 1,
0.03005012, 0.5565014, 1.755105, 0, 0, 0, 1, 1,
0.03063341, -0.2212286, 2.436617, 0, 0, 0, 1, 1,
0.03392395, -0.4866894, 5.095456, 0, 0, 0, 1, 1,
0.034778, -1.046564, 4.319067, 0, 0, 0, 1, 1,
0.03477944, -1.823636, 3.855052, 0, 0, 0, 1, 1,
0.03745208, -0.2349568, 3.990653, 0, 0, 0, 1, 1,
0.03910181, 0.2021715, 1.032853, 1, 1, 1, 1, 1,
0.04100292, -1.92806, 5.011188, 1, 1, 1, 1, 1,
0.04143681, -0.6753238, 2.589349, 1, 1, 1, 1, 1,
0.04861259, 1.104769, -1.431795, 1, 1, 1, 1, 1,
0.05399035, 1.172598, 0.6960971, 1, 1, 1, 1, 1,
0.0547453, 1.179018, -0.005190591, 1, 1, 1, 1, 1,
0.05639241, 0.3867468, -0.9955374, 1, 1, 1, 1, 1,
0.05660616, 1.777839, 0.9968668, 1, 1, 1, 1, 1,
0.0569075, 0.4073234, -0.1060831, 1, 1, 1, 1, 1,
0.0576691, -0.2169737, 3.124696, 1, 1, 1, 1, 1,
0.05905062, 0.6966341, 0.2460692, 1, 1, 1, 1, 1,
0.06157945, 1.009544, 0.8733457, 1, 1, 1, 1, 1,
0.06446093, 0.2595873, -0.4472469, 1, 1, 1, 1, 1,
0.06841075, 0.7435029, 1.715521, 1, 1, 1, 1, 1,
0.06847259, -1.205257, 1.60398, 1, 1, 1, 1, 1,
0.07300574, -0.09147194, 3.630021, 0, 0, 1, 1, 1,
0.0732231, -1.020804, 2.234097, 1, 0, 0, 1, 1,
0.07355135, -0.1230269, 2.089371, 1, 0, 0, 1, 1,
0.0816067, 0.164393, 1.153879, 1, 0, 0, 1, 1,
0.08809359, 1.28211, -1.027447, 1, 0, 0, 1, 1,
0.09091741, 1.884318, -0.41079, 1, 0, 0, 1, 1,
0.0924118, -0.3332292, 1.712523, 0, 0, 0, 1, 1,
0.09677961, -0.641605, 3.230688, 0, 0, 0, 1, 1,
0.09809937, 1.739848, 0.5493056, 0, 0, 0, 1, 1,
0.1002092, -1.744799, 1.471798, 0, 0, 0, 1, 1,
0.1034363, -1.766558, 3.280209, 0, 0, 0, 1, 1,
0.105285, -1.513862, 2.092292, 0, 0, 0, 1, 1,
0.1115849, 0.9627687, 0.07044594, 0, 0, 0, 1, 1,
0.1136099, -0.2827734, 3.563952, 1, 1, 1, 1, 1,
0.1178714, 0.6356391, 0.6899825, 1, 1, 1, 1, 1,
0.1183957, -1.023654, 2.578007, 1, 1, 1, 1, 1,
0.1188219, -2.394177, 3.030612, 1, 1, 1, 1, 1,
0.1224956, 1.081525, 2.283845, 1, 1, 1, 1, 1,
0.1270221, 0.2338115, -1.316921, 1, 1, 1, 1, 1,
0.1292115, 0.08603653, 1.718678, 1, 1, 1, 1, 1,
0.1323541, 0.2347274, -1.06365, 1, 1, 1, 1, 1,
0.1355646, -0.9280114, 2.447171, 1, 1, 1, 1, 1,
0.1389915, -0.4101822, 3.592383, 1, 1, 1, 1, 1,
0.1396894, -0.3980671, 2.314524, 1, 1, 1, 1, 1,
0.1412442, 0.7656987, 0.3124088, 1, 1, 1, 1, 1,
0.1462161, -0.2348641, 1.71596, 1, 1, 1, 1, 1,
0.146685, -0.9640202, 2.795447, 1, 1, 1, 1, 1,
0.1483395, -0.7642069, 3.456357, 1, 1, 1, 1, 1,
0.1490192, 0.3892149, -0.6432245, 0, 0, 1, 1, 1,
0.1493591, 1.49751, -0.2370265, 1, 0, 0, 1, 1,
0.1503038, 0.5181971, -0.527611, 1, 0, 0, 1, 1,
0.1503079, -0.523558, 3.893051, 1, 0, 0, 1, 1,
0.1503213, -0.2355741, 2.398813, 1, 0, 0, 1, 1,
0.154458, 0.3068517, 1.101023, 1, 0, 0, 1, 1,
0.1549787, 0.6432714, 0.8776856, 0, 0, 0, 1, 1,
0.1649439, -0.2814255, 3.970512, 0, 0, 0, 1, 1,
0.1709922, -0.7957093, 2.68235, 0, 0, 0, 1, 1,
0.1733225, 1.042486, -2.112166, 0, 0, 0, 1, 1,
0.1749368, -0.5015181, 4.872533, 0, 0, 0, 1, 1,
0.176262, -0.8834043, 2.821551, 0, 0, 0, 1, 1,
0.1782307, -0.6687284, 2.848308, 0, 0, 0, 1, 1,
0.1805709, -0.7211772, 3.879141, 1, 1, 1, 1, 1,
0.1813154, -0.299227, 3.219052, 1, 1, 1, 1, 1,
0.1888401, 1.35142, 1.342224, 1, 1, 1, 1, 1,
0.1896843, -1.307776, 2.616431, 1, 1, 1, 1, 1,
0.1901885, 0.6581611, 0.6072432, 1, 1, 1, 1, 1,
0.1926944, -1.197579, 4.676074, 1, 1, 1, 1, 1,
0.199585, 0.2927841, 1.277102, 1, 1, 1, 1, 1,
0.2009765, 0.3844565, -0.02916063, 1, 1, 1, 1, 1,
0.2029257, 1.295667, -0.4269411, 1, 1, 1, 1, 1,
0.2043122, 0.3567756, 1.659606, 1, 1, 1, 1, 1,
0.2055776, -0.6814308, 2.189125, 1, 1, 1, 1, 1,
0.2078236, 0.8708262, 0.210815, 1, 1, 1, 1, 1,
0.2081129, 1.490647, -0.06493887, 1, 1, 1, 1, 1,
0.208719, -1.209089, 2.221079, 1, 1, 1, 1, 1,
0.2121359, -0.1851721, 3.922733, 1, 1, 1, 1, 1,
0.214531, -1.48271, 4.885495, 0, 0, 1, 1, 1,
0.2151184, -0.08032674, 2.911613, 1, 0, 0, 1, 1,
0.218447, -0.1619477, 3.025503, 1, 0, 0, 1, 1,
0.2221436, 0.1573457, 0.6915733, 1, 0, 0, 1, 1,
0.2224557, -0.03466405, 3.699069, 1, 0, 0, 1, 1,
0.2301065, -0.8901587, 3.105196, 1, 0, 0, 1, 1,
0.2368927, 0.3703086, 0.002290689, 0, 0, 0, 1, 1,
0.2419635, 1.525358, -0.8587124, 0, 0, 0, 1, 1,
0.2433628, 0.09740346, 1.590318, 0, 0, 0, 1, 1,
0.2459398, -2.348252, 3.458023, 0, 0, 0, 1, 1,
0.2545266, 0.6213917, 2.479156, 0, 0, 0, 1, 1,
0.256686, -0.5797382, 2.843081, 0, 0, 0, 1, 1,
0.25907, 1.051609, -0.691736, 0, 0, 0, 1, 1,
0.2606502, 0.174771, 1.851547, 1, 1, 1, 1, 1,
0.2643945, -0.5242778, 2.033363, 1, 1, 1, 1, 1,
0.2646201, -0.4819573, 1.063336, 1, 1, 1, 1, 1,
0.2665119, 0.3095691, 1.134484, 1, 1, 1, 1, 1,
0.2717986, 0.2130695, 1.063308, 1, 1, 1, 1, 1,
0.2732889, 0.2087051, 1.529948, 1, 1, 1, 1, 1,
0.2753851, 0.01597211, 1.132693, 1, 1, 1, 1, 1,
0.2771419, -2.23575, 4.268253, 1, 1, 1, 1, 1,
0.2776327, -0.5543518, 1.720275, 1, 1, 1, 1, 1,
0.2794913, -2.808656, 1.263169, 1, 1, 1, 1, 1,
0.2804406, -0.06545365, 0.9262134, 1, 1, 1, 1, 1,
0.2809661, 0.06271718, 1.402476, 1, 1, 1, 1, 1,
0.28294, -0.5481321, 2.008252, 1, 1, 1, 1, 1,
0.2838834, 1.02956, 0.3178433, 1, 1, 1, 1, 1,
0.2883703, 1.843008, -0.7926909, 1, 1, 1, 1, 1,
0.2896109, 0.1281117, 2.026674, 0, 0, 1, 1, 1,
0.2916511, -0.7248948, 3.784706, 1, 0, 0, 1, 1,
0.2933713, 0.8270561, 0.01390983, 1, 0, 0, 1, 1,
0.2998642, -0.5197496, 2.520019, 1, 0, 0, 1, 1,
0.3067895, -0.2925069, 3.667733, 1, 0, 0, 1, 1,
0.3085935, -0.4132566, 2.749811, 1, 0, 0, 1, 1,
0.3118151, 1.113405, 0.1527609, 0, 0, 0, 1, 1,
0.3120949, -0.1131691, 2.075807, 0, 0, 0, 1, 1,
0.3131116, 0.5529631, 0.6123939, 0, 0, 0, 1, 1,
0.3143988, -0.6927847, 3.566059, 0, 0, 0, 1, 1,
0.321813, 1.068896, 0.1123314, 0, 0, 0, 1, 1,
0.3271587, 1.155843, -0.4225578, 0, 0, 0, 1, 1,
0.3362113, 0.9565304, 1.427638, 0, 0, 0, 1, 1,
0.3376503, 0.1621744, 2.10353, 1, 1, 1, 1, 1,
0.3393887, -0.2796304, 1.985933, 1, 1, 1, 1, 1,
0.3394868, -0.1379891, 0.4445114, 1, 1, 1, 1, 1,
0.340033, -0.2052657, 2.392515, 1, 1, 1, 1, 1,
0.3414693, 0.7348699, 0.710423, 1, 1, 1, 1, 1,
0.3425348, 1.444841, 0.6759787, 1, 1, 1, 1, 1,
0.3426568, 2.381485, 0.3821561, 1, 1, 1, 1, 1,
0.3461917, 0.4270369, -0.181913, 1, 1, 1, 1, 1,
0.3462484, -0.6550535, 4.545256, 1, 1, 1, 1, 1,
0.3484395, 1.439665, 0.5507921, 1, 1, 1, 1, 1,
0.3539338, -1.164429, 4.004617, 1, 1, 1, 1, 1,
0.3596514, 1.200115, 0.8085202, 1, 1, 1, 1, 1,
0.3605098, -1.242669, 2.291134, 1, 1, 1, 1, 1,
0.3650069, 1.060024, 1.257913, 1, 1, 1, 1, 1,
0.36767, -0.581028, 2.648332, 1, 1, 1, 1, 1,
0.3679004, -0.4941552, 1.959136, 0, 0, 1, 1, 1,
0.3702627, -1.524977, 2.576315, 1, 0, 0, 1, 1,
0.3722242, -0.1053278, 3.996699, 1, 0, 0, 1, 1,
0.3742196, -1.787118, 1.209006, 1, 0, 0, 1, 1,
0.3742414, -0.2309711, 1.578872, 1, 0, 0, 1, 1,
0.377564, -1.603467, 4.209261, 1, 0, 0, 1, 1,
0.3778849, 0.9265365, -0.07323046, 0, 0, 0, 1, 1,
0.3814973, -0.6069008, 1.74673, 0, 0, 0, 1, 1,
0.3819184, -0.8302843, 3.274907, 0, 0, 0, 1, 1,
0.3866971, 1.92667, -2.162472, 0, 0, 0, 1, 1,
0.3905471, -0.918115, 2.279859, 0, 0, 0, 1, 1,
0.3939806, -0.6866501, 1.950424, 0, 0, 0, 1, 1,
0.3949684, 0.5788714, 0.1761386, 0, 0, 0, 1, 1,
0.3966585, -0.4999344, 1.957741, 1, 1, 1, 1, 1,
0.4005368, -0.08443173, 1.544531, 1, 1, 1, 1, 1,
0.4014113, 0.04903656, 1.242239, 1, 1, 1, 1, 1,
0.4027015, -0.06101414, 0.2211924, 1, 1, 1, 1, 1,
0.4042597, -0.7286092, 3.190541, 1, 1, 1, 1, 1,
0.4059833, 0.1734959, 0.5325428, 1, 1, 1, 1, 1,
0.406581, -0.8662971, 2.558213, 1, 1, 1, 1, 1,
0.4081184, -0.8223839, 2.159586, 1, 1, 1, 1, 1,
0.4084051, -0.281166, 2.814079, 1, 1, 1, 1, 1,
0.4094422, 0.5971926, -1.573473, 1, 1, 1, 1, 1,
0.4258827, -1.776598, 3.534741, 1, 1, 1, 1, 1,
0.4263143, 0.1751316, 2.613907, 1, 1, 1, 1, 1,
0.4309829, -1.05999, 3.299041, 1, 1, 1, 1, 1,
0.4335223, 1.745619, -1.513577, 1, 1, 1, 1, 1,
0.4342629, 1.320551, -1.46732, 1, 1, 1, 1, 1,
0.4350451, -0.3710169, 2.017927, 0, 0, 1, 1, 1,
0.4426022, 0.4988552, 2.338073, 1, 0, 0, 1, 1,
0.4557333, 0.2330464, 0.2007056, 1, 0, 0, 1, 1,
0.45633, -1.463924, 3.494715, 1, 0, 0, 1, 1,
0.4577512, -0.2838185, 1.747039, 1, 0, 0, 1, 1,
0.4577787, 1.187793, 1.176113, 1, 0, 0, 1, 1,
0.4581609, -0.1724863, 2.692415, 0, 0, 0, 1, 1,
0.459966, -0.05618896, 1.467965, 0, 0, 0, 1, 1,
0.4602033, 0.1512012, 0.531052, 0, 0, 0, 1, 1,
0.4602202, 0.4903482, 1.265969, 0, 0, 0, 1, 1,
0.4604455, 1.232678, -0.416414, 0, 0, 0, 1, 1,
0.4697073, 1.486859, 1.36021, 0, 0, 0, 1, 1,
0.4707744, -3.333579, 3.884951, 0, 0, 0, 1, 1,
0.4714498, -0.1443732, 1.363617, 1, 1, 1, 1, 1,
0.4737287, -0.3477289, 1.330302, 1, 1, 1, 1, 1,
0.4740736, 0.04759452, 2.130475, 1, 1, 1, 1, 1,
0.4766289, -0.9046637, 3.15769, 1, 1, 1, 1, 1,
0.4807559, 0.5000896, 1.56263, 1, 1, 1, 1, 1,
0.4831615, -0.287868, 2.744684, 1, 1, 1, 1, 1,
0.4841763, 0.1185497, -0.07194699, 1, 1, 1, 1, 1,
0.4864166, 1.23335, 0.6780013, 1, 1, 1, 1, 1,
0.4867693, -0.1923421, 3.19113, 1, 1, 1, 1, 1,
0.495868, 0.3330962, 1.926286, 1, 1, 1, 1, 1,
0.4959035, 0.1414259, 0.6859327, 1, 1, 1, 1, 1,
0.4988018, 0.2338331, 1.722008, 1, 1, 1, 1, 1,
0.502143, 1.45498, -0.2520707, 1, 1, 1, 1, 1,
0.5028114, -0.1177775, 0.2398374, 1, 1, 1, 1, 1,
0.5079235, 1.964904, 0.2452245, 1, 1, 1, 1, 1,
0.5082554, -0.749075, 4.98344, 0, 0, 1, 1, 1,
0.5213143, -0.4134054, 1.212404, 1, 0, 0, 1, 1,
0.5224371, -1.476618, 2.372384, 1, 0, 0, 1, 1,
0.5268858, -0.5265913, 1.813995, 1, 0, 0, 1, 1,
0.5335766, -0.5339806, 1.81583, 1, 0, 0, 1, 1,
0.5339993, -1.0634, 2.614306, 1, 0, 0, 1, 1,
0.5351419, 0.778137, 0.06864779, 0, 0, 0, 1, 1,
0.5389772, -0.6378282, 2.336777, 0, 0, 0, 1, 1,
0.5478205, -2.11455, 3.530199, 0, 0, 0, 1, 1,
0.5531396, 0.2756376, 1.532583, 0, 0, 0, 1, 1,
0.5533972, -0.8263041, 5.309339, 0, 0, 0, 1, 1,
0.5552149, -0.2086225, 1.586779, 0, 0, 0, 1, 1,
0.5637144, 0.5296958, -0.4923514, 0, 0, 0, 1, 1,
0.5652379, -1.822789, 3.006645, 1, 1, 1, 1, 1,
0.5714599, 0.7040669, -0.7301683, 1, 1, 1, 1, 1,
0.5731093, -0.1946856, -0.09281761, 1, 1, 1, 1, 1,
0.5740294, 0.7612516, 1.597101, 1, 1, 1, 1, 1,
0.5747567, 0.2014055, 1.382808, 1, 1, 1, 1, 1,
0.5768226, 0.6596824, 1.603549, 1, 1, 1, 1, 1,
0.5773032, 2.284642, -0.1548548, 1, 1, 1, 1, 1,
0.5777561, 0.2583318, 1.456449, 1, 1, 1, 1, 1,
0.5799378, 1.019543, 1.605698, 1, 1, 1, 1, 1,
0.5831634, -1.002349, 1.369788, 1, 1, 1, 1, 1,
0.588527, 0.9865648, -0.2414244, 1, 1, 1, 1, 1,
0.5888352, 0.8735772, 1.241248, 1, 1, 1, 1, 1,
0.5991374, 0.3389692, 1.699715, 1, 1, 1, 1, 1,
0.6064714, 0.2782658, -0.2244309, 1, 1, 1, 1, 1,
0.613268, -0.2625723, 1.894892, 1, 1, 1, 1, 1,
0.6136112, 0.821482, -0.01373262, 0, 0, 1, 1, 1,
0.6149696, -1.725091, 2.808429, 1, 0, 0, 1, 1,
0.6354329, -2.03892, 3.212994, 1, 0, 0, 1, 1,
0.6399425, -0.639837, 2.009396, 1, 0, 0, 1, 1,
0.640798, -0.4220458, 2.524245, 1, 0, 0, 1, 1,
0.6439306, -0.1133242, 2.569755, 1, 0, 0, 1, 1,
0.6496913, -0.8226961, 0.3499117, 0, 0, 0, 1, 1,
0.6543186, -1.16033, 0.9476833, 0, 0, 0, 1, 1,
0.6569629, 0.5514693, 1.103913, 0, 0, 0, 1, 1,
0.6570863, 0.535088, -0.2028171, 0, 0, 0, 1, 1,
0.666732, 0.8997979, 1.872433, 0, 0, 0, 1, 1,
0.666884, 0.2803048, 1.900415, 0, 0, 0, 1, 1,
0.6693442, 0.05780344, 0.176263, 0, 0, 0, 1, 1,
0.669523, 1.056918, 0.3547995, 1, 1, 1, 1, 1,
0.6695259, -0.9484283, 3.158537, 1, 1, 1, 1, 1,
0.6730236, 1.115334, 0.08259477, 1, 1, 1, 1, 1,
0.6890602, -0.1872028, 0.4820522, 1, 1, 1, 1, 1,
0.6900571, 0.513191, -0.264592, 1, 1, 1, 1, 1,
0.6968151, -0.1505044, 2.126885, 1, 1, 1, 1, 1,
0.6987963, -0.5839235, 3.273954, 1, 1, 1, 1, 1,
0.6991204, 0.334332, 1.796797, 1, 1, 1, 1, 1,
0.7041382, -0.836773, 1.949559, 1, 1, 1, 1, 1,
0.7133209, -1.863611, 0.7763113, 1, 1, 1, 1, 1,
0.7146588, 0.7437845, 0.9096369, 1, 1, 1, 1, 1,
0.7151874, 1.915823, 1.396305, 1, 1, 1, 1, 1,
0.7178944, 0.4530336, 0.7485905, 1, 1, 1, 1, 1,
0.7181458, 0.02909017, 1.378419, 1, 1, 1, 1, 1,
0.7296581, -0.3729523, 2.545697, 1, 1, 1, 1, 1,
0.7312158, -1.824044, 2.439308, 0, 0, 1, 1, 1,
0.7352417, -0.8779775, 2.143868, 1, 0, 0, 1, 1,
0.7357922, -0.8969482, 3.450196, 1, 0, 0, 1, 1,
0.7482895, 1.334227, 1.389613, 1, 0, 0, 1, 1,
0.7491072, -0.9212282, 3.076886, 1, 0, 0, 1, 1,
0.7493261, -0.8276981, 3.22185, 1, 0, 0, 1, 1,
0.7507507, 0.8821105, 0.5472463, 0, 0, 0, 1, 1,
0.7524105, -1.358355, 2.241507, 0, 0, 0, 1, 1,
0.7530278, 1.325446, 0.2197254, 0, 0, 0, 1, 1,
0.7545724, -0.6722599, 1.588121, 0, 0, 0, 1, 1,
0.7550581, -0.7044309, 2.856875, 0, 0, 0, 1, 1,
0.7585322, 1.010016, 0.2727144, 0, 0, 0, 1, 1,
0.7614219, -0.6420424, 3.265558, 0, 0, 0, 1, 1,
0.7628047, 0.4618846, -0.3480826, 1, 1, 1, 1, 1,
0.7679418, 0.2538095, 2.363624, 1, 1, 1, 1, 1,
0.7686723, 0.8500365, 0.9790455, 1, 1, 1, 1, 1,
0.7689466, -1.936983, 0.8571704, 1, 1, 1, 1, 1,
0.772281, -0.108756, 1.689888, 1, 1, 1, 1, 1,
0.7732368, -0.436848, 1.305379, 1, 1, 1, 1, 1,
0.7742638, 1.015249, 1.667325, 1, 1, 1, 1, 1,
0.7755303, 0.7935637, 1.391421, 1, 1, 1, 1, 1,
0.7769156, -1.079124, 2.707638, 1, 1, 1, 1, 1,
0.781664, 0.1491847, 2.173539, 1, 1, 1, 1, 1,
0.7929104, -0.4552716, 1.242857, 1, 1, 1, 1, 1,
0.7949706, 1.181678, 0.5097529, 1, 1, 1, 1, 1,
0.7965187, 1.437287, 0.2367886, 1, 1, 1, 1, 1,
0.8002799, -0.2357991, 1.615383, 1, 1, 1, 1, 1,
0.8029034, 0.2420249, 1.752777, 1, 1, 1, 1, 1,
0.8070174, 0.8417667, 1.012452, 0, 0, 1, 1, 1,
0.8074759, 1.119828, -0.008413101, 1, 0, 0, 1, 1,
0.8196828, -0.4956954, 1.506354, 1, 0, 0, 1, 1,
0.8197211, 0.104403, 1.912446, 1, 0, 0, 1, 1,
0.8198993, 0.6336567, 2.167523, 1, 0, 0, 1, 1,
0.8245403, -0.3769273, 1.370045, 1, 0, 0, 1, 1,
0.8265507, -0.9411647, 3.030132, 0, 0, 0, 1, 1,
0.8291829, 0.6577501, 1.177802, 0, 0, 0, 1, 1,
0.8294566, -1.737199, 3.325813, 0, 0, 0, 1, 1,
0.8359115, 0.4958097, 0.9214993, 0, 0, 0, 1, 1,
0.8496065, -1.579446, 1.967288, 0, 0, 0, 1, 1,
0.8526207, -0.5605113, 1.974203, 0, 0, 0, 1, 1,
0.8527618, 0.08025753, 1.716546, 0, 0, 0, 1, 1,
0.8577387, 1.007969, 2.230931, 1, 1, 1, 1, 1,
0.8586834, 0.826359, 1.284648, 1, 1, 1, 1, 1,
0.860091, -0.1116076, 1.389443, 1, 1, 1, 1, 1,
0.8747483, 0.07476701, 1.204393, 1, 1, 1, 1, 1,
0.8811853, -1.583877, 3.091227, 1, 1, 1, 1, 1,
0.8831114, 2.338747, -0.531237, 1, 1, 1, 1, 1,
0.8875445, -1.193694, 1.596626, 1, 1, 1, 1, 1,
0.888274, 0.05768733, 1.132701, 1, 1, 1, 1, 1,
0.8890421, 2.129257, -1.755807, 1, 1, 1, 1, 1,
0.8898485, -0.6048496, 1.67982, 1, 1, 1, 1, 1,
0.893811, -0.2482439, -0.3898631, 1, 1, 1, 1, 1,
0.9104734, 0.6999314, -0.3988044, 1, 1, 1, 1, 1,
0.9195614, 0.7323622, 1.424798, 1, 1, 1, 1, 1,
0.928777, 0.2825262, 2.970869, 1, 1, 1, 1, 1,
0.9349796, -0.7255135, 3.373493, 1, 1, 1, 1, 1,
0.9360209, -0.8526632, 1.206325, 0, 0, 1, 1, 1,
0.9382308, -1.378522, 2.991846, 1, 0, 0, 1, 1,
0.9396511, 0.3143726, 1.15851, 1, 0, 0, 1, 1,
0.9493114, 0.3735199, -0.7942362, 1, 0, 0, 1, 1,
0.9548635, 0.48605, -0.5469661, 1, 0, 0, 1, 1,
0.9554157, 0.3534171, 1.533543, 1, 0, 0, 1, 1,
0.9565815, -0.139656, 3.704959, 0, 0, 0, 1, 1,
0.9573506, 0.9427087, 0.6382057, 0, 0, 0, 1, 1,
0.9574884, -0.6651941, 1.811467, 0, 0, 0, 1, 1,
0.961364, -0.5736864, 2.164365, 0, 0, 0, 1, 1,
0.9643998, -0.5547546, 3.182679, 0, 0, 0, 1, 1,
0.9705259, -0.04935175, 3.353818, 0, 0, 0, 1, 1,
0.9709556, 0.09655105, 1.869261, 0, 0, 0, 1, 1,
0.9741111, 1.124647, 1.609321, 1, 1, 1, 1, 1,
0.9789168, -1.15981, 1.243687, 1, 1, 1, 1, 1,
0.9850282, 0.57223, 1.409883, 1, 1, 1, 1, 1,
0.9900032, -1.035416, 1.583222, 1, 1, 1, 1, 1,
0.9994146, -0.9133642, 4.548839, 1, 1, 1, 1, 1,
1.00372, -2.136219, 1.809562, 1, 1, 1, 1, 1,
1.011457, 1.475045, 0.7136492, 1, 1, 1, 1, 1,
1.014336, -1.230333, 2.571706, 1, 1, 1, 1, 1,
1.016723, 0.8699453, 0.2215459, 1, 1, 1, 1, 1,
1.019835, -0.3123686, 1.832078, 1, 1, 1, 1, 1,
1.022639, 0.1002845, 1.294768, 1, 1, 1, 1, 1,
1.02525, -1.130213, 4.131009, 1, 1, 1, 1, 1,
1.028365, 1.181672, 0.4375735, 1, 1, 1, 1, 1,
1.029731, -0.6806874, 0.3666613, 1, 1, 1, 1, 1,
1.033056, -0.8425954, 3.936082, 1, 1, 1, 1, 1,
1.034424, -0.08209376, 0.7923794, 0, 0, 1, 1, 1,
1.036983, -0.1063746, 1.926614, 1, 0, 0, 1, 1,
1.040779, 1.561068, -1.052285, 1, 0, 0, 1, 1,
1.043197, 0.7000825, 1.271652, 1, 0, 0, 1, 1,
1.043218, 1.593687, 3.069257, 1, 0, 0, 1, 1,
1.044295, 0.3694338, 2.840235, 1, 0, 0, 1, 1,
1.044714, -2.069632, 2.483651, 0, 0, 0, 1, 1,
1.044786, -0.661177, 2.670383, 0, 0, 0, 1, 1,
1.045596, -0.1700142, 0.1427362, 0, 0, 0, 1, 1,
1.048774, -0.02305948, 2.518052, 0, 0, 0, 1, 1,
1.054039, 0.1601006, 1.967146, 0, 0, 0, 1, 1,
1.062724, 1.073801, 0.8241661, 0, 0, 0, 1, 1,
1.074153, 0.3460442, 1.759079, 0, 0, 0, 1, 1,
1.080986, -0.731648, 2.743867, 1, 1, 1, 1, 1,
1.085258, 0.4119443, 0.1778392, 1, 1, 1, 1, 1,
1.088457, -1.567064, 2.31559, 1, 1, 1, 1, 1,
1.089236, -0.8682066, 1.963187, 1, 1, 1, 1, 1,
1.09581, -0.9510235, 0.3425051, 1, 1, 1, 1, 1,
1.097547, 0.2484079, -0.2550146, 1, 1, 1, 1, 1,
1.09981, 0.5545694, 2.422699, 1, 1, 1, 1, 1,
1.104334, -0.08756398, 4.236713, 1, 1, 1, 1, 1,
1.104552, 0.554305, 1.779523, 1, 1, 1, 1, 1,
1.107977, 1.807541, 0.6936675, 1, 1, 1, 1, 1,
1.112453, -0.1363382, -1.007252, 1, 1, 1, 1, 1,
1.112554, 0.85913, 0.86707, 1, 1, 1, 1, 1,
1.113217, -1.750742, 1.739768, 1, 1, 1, 1, 1,
1.11382, 0.9345783, 1.107166, 1, 1, 1, 1, 1,
1.11448, -0.24538, 0.9023676, 1, 1, 1, 1, 1,
1.118724, -0.5805733, 3.552212, 0, 0, 1, 1, 1,
1.120518, -0.114487, 2.393805, 1, 0, 0, 1, 1,
1.122152, -2.789152, 2.285441, 1, 0, 0, 1, 1,
1.122497, -1.857639, 1.850774, 1, 0, 0, 1, 1,
1.134021, 0.1055661, 2.60509, 1, 0, 0, 1, 1,
1.137353, -1.487711, 2.37578, 1, 0, 0, 1, 1,
1.149743, -0.4258761, 0.8564324, 0, 0, 0, 1, 1,
1.15129, -0.5375984, 2.683623, 0, 0, 0, 1, 1,
1.152567, 0.2639948, 1.379621, 0, 0, 0, 1, 1,
1.154023, 0.5660634, 0.2446473, 0, 0, 0, 1, 1,
1.155753, -1.581023, 3.450854, 0, 0, 0, 1, 1,
1.155991, -0.5567119, 2.027017, 0, 0, 0, 1, 1,
1.161922, -0.4905373, 1.599633, 0, 0, 0, 1, 1,
1.165618, 0.6086456, 0.9662839, 1, 1, 1, 1, 1,
1.190284, -1.359578, 2.65175, 1, 1, 1, 1, 1,
1.190506, -1.43951, 3.128625, 1, 1, 1, 1, 1,
1.193221, 1.395707, -0.200512, 1, 1, 1, 1, 1,
1.205705, -0.5804447, 1.530177, 1, 1, 1, 1, 1,
1.208426, -0.7293119, 2.286728, 1, 1, 1, 1, 1,
1.210732, -0.9161445, 1.597785, 1, 1, 1, 1, 1,
1.216779, 2.071083, 0.811754, 1, 1, 1, 1, 1,
1.226121, -0.7983907, 1.451073, 1, 1, 1, 1, 1,
1.226505, 0.1942378, 1.630484, 1, 1, 1, 1, 1,
1.229565, -0.5862788, 2.995237, 1, 1, 1, 1, 1,
1.230503, 0.0219105, 0.7940385, 1, 1, 1, 1, 1,
1.244507, -0.2389853, 2.739711, 1, 1, 1, 1, 1,
1.248523, -0.8076278, 2.830388, 1, 1, 1, 1, 1,
1.254278, 0.8450293, 2.384814, 1, 1, 1, 1, 1,
1.259488, -1.376227, 1.852942, 0, 0, 1, 1, 1,
1.262927, -0.2226819, 2.704721, 1, 0, 0, 1, 1,
1.264663, -0.4564963, 3.063369, 1, 0, 0, 1, 1,
1.266853, -0.8692552, 2.430303, 1, 0, 0, 1, 1,
1.275287, -0.1376097, -0.03591237, 1, 0, 0, 1, 1,
1.276256, 0.2654738, 2.946705, 1, 0, 0, 1, 1,
1.294892, -0.6056188, 2.37597, 0, 0, 0, 1, 1,
1.305083, -0.6561474, 1.375158, 0, 0, 0, 1, 1,
1.307927, 0.5310914, 1.266911, 0, 0, 0, 1, 1,
1.322583, 0.01113157, 3.292238, 0, 0, 0, 1, 1,
1.334811, 1.465447, -0.5400835, 0, 0, 0, 1, 1,
1.342153, -1.576737, 2.100167, 0, 0, 0, 1, 1,
1.353406, -0.533015, 2.025028, 0, 0, 0, 1, 1,
1.353759, 2.83281, 0.5746439, 1, 1, 1, 1, 1,
1.360391, -0.6732995, 1.419803, 1, 1, 1, 1, 1,
1.369117, -0.7436672, 3.366426, 1, 1, 1, 1, 1,
1.378602, -1.957914, 3.878357, 1, 1, 1, 1, 1,
1.380965, 2.154745, -0.1092165, 1, 1, 1, 1, 1,
1.393254, -0.2523394, 1.635978, 1, 1, 1, 1, 1,
1.394085, 0.4565126, 2.413672, 1, 1, 1, 1, 1,
1.416162, 0.9740342, -0.2114957, 1, 1, 1, 1, 1,
1.437086, 0.3849156, 1.796678, 1, 1, 1, 1, 1,
1.451987, 0.2901455, 0.1166269, 1, 1, 1, 1, 1,
1.466032, -0.5546069, 0.9330208, 1, 1, 1, 1, 1,
1.469467, 0.1942301, 0.8710855, 1, 1, 1, 1, 1,
1.474253, -1.440106, 1.814561, 1, 1, 1, 1, 1,
1.477541, 0.03768987, 1.546423, 1, 1, 1, 1, 1,
1.488984, 0.4250119, 2.004434, 1, 1, 1, 1, 1,
1.496257, -1.206938, 2.652725, 0, 0, 1, 1, 1,
1.499946, -0.8866563, 2.504111, 1, 0, 0, 1, 1,
1.501723, -1.405318, 1.308898, 1, 0, 0, 1, 1,
1.512349, 1.116252, -0.266385, 1, 0, 0, 1, 1,
1.513158, 0.5490028, 0.9400206, 1, 0, 0, 1, 1,
1.521217, -0.2635143, 2.730964, 1, 0, 0, 1, 1,
1.521399, 0.4009343, 0.5492586, 0, 0, 0, 1, 1,
1.538529, -0.05929866, 3.015423, 0, 0, 0, 1, 1,
1.546343, -0.9469752, 3.072918, 0, 0, 0, 1, 1,
1.554229, -1.029504, 0.6082558, 0, 0, 0, 1, 1,
1.562703, 2.197216, -0.5373734, 0, 0, 0, 1, 1,
1.571212, 0.05721805, 2.248458, 0, 0, 0, 1, 1,
1.590632, 1.116907, 1.087882, 0, 0, 0, 1, 1,
1.610834, 0.3886732, -0.5730204, 1, 1, 1, 1, 1,
1.616979, 1.18906, 1.789588, 1, 1, 1, 1, 1,
1.630859, 0.8535315, 0.8212422, 1, 1, 1, 1, 1,
1.637753, -0.4052333, 1.723528, 1, 1, 1, 1, 1,
1.639192, 0.5644038, 2.31747, 1, 1, 1, 1, 1,
1.642377, -0.8022746, 0.2568015, 1, 1, 1, 1, 1,
1.670047, -0.9392123, 2.700445, 1, 1, 1, 1, 1,
1.670582, 0.4330401, 1.853256, 1, 1, 1, 1, 1,
1.683128, 0.3349702, 2.954043, 1, 1, 1, 1, 1,
1.695033, -0.4315177, 1.552457, 1, 1, 1, 1, 1,
1.704763, -1.730754, 2.224768, 1, 1, 1, 1, 1,
1.706293, 0.3670525, 1.820113, 1, 1, 1, 1, 1,
1.722681, 0.8521116, 0.5534711, 1, 1, 1, 1, 1,
1.722871, 0.3320578, 0.7691902, 1, 1, 1, 1, 1,
1.734309, 0.5710106, 0.1720908, 1, 1, 1, 1, 1,
1.746369, -0.7269652, 2.162849, 0, 0, 1, 1, 1,
1.760441, 0.51884, 1.15728, 1, 0, 0, 1, 1,
1.773678, -0.01195408, 1.799733, 1, 0, 0, 1, 1,
1.782255, -2.28957, 3.678392, 1, 0, 0, 1, 1,
1.802188, -2.305387, 4.47466, 1, 0, 0, 1, 1,
1.824837, -0.7368532, 2.391692, 1, 0, 0, 1, 1,
1.826059, -0.06128699, 0.1620544, 0, 0, 0, 1, 1,
1.833769, 0.3634475, 1.01795, 0, 0, 0, 1, 1,
1.837633, -0.50178, 1.393941, 0, 0, 0, 1, 1,
1.837709, -0.8428403, 2.322292, 0, 0, 0, 1, 1,
1.854896, -0.1906542, 3.104323, 0, 0, 0, 1, 1,
1.863173, 1.085247, 0.646343, 0, 0, 0, 1, 1,
1.882597, -0.01615431, 2.644678, 0, 0, 0, 1, 1,
1.90402, -0.07264785, 1.226393, 1, 1, 1, 1, 1,
1.910109, 1.459897, 0.7251002, 1, 1, 1, 1, 1,
1.911753, 0.3397633, 2.908035, 1, 1, 1, 1, 1,
1.928371, -1.069427, 0.2131694, 1, 1, 1, 1, 1,
1.940926, -0.2679251, 1.574221, 1, 1, 1, 1, 1,
1.959438, 1.023287, 2.831874, 1, 1, 1, 1, 1,
1.961496, -0.4789928, 2.93758, 1, 1, 1, 1, 1,
1.972337, 0.9935943, 1.648221, 1, 1, 1, 1, 1,
2.01737, -0.2049033, 2.285794, 1, 1, 1, 1, 1,
2.028508, -1.503082, 2.940907, 1, 1, 1, 1, 1,
2.033988, 1.50677, 1.158127, 1, 1, 1, 1, 1,
2.052266, 1.277235, 1.802645, 1, 1, 1, 1, 1,
2.06698, 1.516895, 1.812095, 1, 1, 1, 1, 1,
2.0831, 0.512895, 1.035828, 1, 1, 1, 1, 1,
2.113128, -0.903668, 1.557838, 1, 1, 1, 1, 1,
2.131188, -0.797761, 1.082699, 0, 0, 1, 1, 1,
2.141569, 0.9914653, 1.737021, 1, 0, 0, 1, 1,
2.185662, -1.690301, 2.383156, 1, 0, 0, 1, 1,
2.222916, 3.43819, -0.07439564, 1, 0, 0, 1, 1,
2.249939, -1.332478, 2.085664, 1, 0, 0, 1, 1,
2.287155, -0.295791, 2.113034, 1, 0, 0, 1, 1,
2.295438, -1.290389, 2.726155, 0, 0, 0, 1, 1,
2.350255, -1.126197, -0.136936, 0, 0, 0, 1, 1,
2.397107, 0.141907, 1.114599, 0, 0, 0, 1, 1,
2.453071, -0.890259, 1.403855, 0, 0, 0, 1, 1,
2.464849, -1.243455, 0.4962681, 0, 0, 0, 1, 1,
2.475957, -0.4615434, 1.337738, 0, 0, 0, 1, 1,
2.476821, -0.3852295, 1.546137, 0, 0, 0, 1, 1,
2.507051, -1.898201, 2.459742, 1, 1, 1, 1, 1,
2.543992, 1.724695, 0.7644016, 1, 1, 1, 1, 1,
2.557505, -0.9284919, -0.4299107, 1, 1, 1, 1, 1,
2.666953, -0.9431925, 0.9909464, 1, 1, 1, 1, 1,
2.874619, 0.5124776, 0.1484402, 1, 1, 1, 1, 1,
2.921386, -0.3074187, 1.329222, 1, 1, 1, 1, 1,
2.963907, -0.2019363, 2.394155, 1, 1, 1, 1, 1
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
var radius = 9.678237;
var distance = 33.99439;
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
mvMatrix.translate( 0.0933702, -0.0523057, 0.1493227 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.99439);
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
