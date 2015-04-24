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
-3.231548, -0.6026396, -3.144452, 1, 0, 0, 1,
-2.970355, -1.226007, -2.360301, 1, 0.007843138, 0, 1,
-2.787984, 0.3363381, -2.30617, 1, 0.01176471, 0, 1,
-2.694048, 2.123973, -1.942133, 1, 0.01960784, 0, 1,
-2.652152, 0.06425018, -1.9297, 1, 0.02352941, 0, 1,
-2.628887, 0.9944635, -3.556506, 1, 0.03137255, 0, 1,
-2.60292, 0.5310377, -2.147693, 1, 0.03529412, 0, 1,
-2.544509, 1.138523, -0.3188844, 1, 0.04313726, 0, 1,
-2.398374, -1.315632, -1.414845, 1, 0.04705882, 0, 1,
-2.393623, -0.217224, -1.808856, 1, 0.05490196, 0, 1,
-2.327749, 0.06904897, -1.842551, 1, 0.05882353, 0, 1,
-2.285608, 0.6071432, -3.070808, 1, 0.06666667, 0, 1,
-2.259972, 1.305428, -1.788192, 1, 0.07058824, 0, 1,
-2.242154, 0.8445612, -2.216353, 1, 0.07843138, 0, 1,
-2.209361, 0.3482482, -0.9055804, 1, 0.08235294, 0, 1,
-2.197182, -0.2160873, -2.105608, 1, 0.09019608, 0, 1,
-2.192602, 0.4589605, -2.552917, 1, 0.09411765, 0, 1,
-2.154023, -0.1671516, -1.240976, 1, 0.1019608, 0, 1,
-2.144891, -0.3200726, -3.553271, 1, 0.1098039, 0, 1,
-2.126262, -1.129319, -2.467041, 1, 0.1137255, 0, 1,
-2.114207, -0.2039879, -0.1767188, 1, 0.1215686, 0, 1,
-2.094475, -0.01687494, 0.2488355, 1, 0.1254902, 0, 1,
-2.076672, -1.054402, -1.78787, 1, 0.1333333, 0, 1,
-2.027483, -0.06146495, -0.6928071, 1, 0.1372549, 0, 1,
-2.020112, -0.7608014, -1.509628, 1, 0.145098, 0, 1,
-2.000383, 0.01319845, -1.424212, 1, 0.1490196, 0, 1,
-1.994823, 0.4031923, -0.9092036, 1, 0.1568628, 0, 1,
-1.978781, 0.06509692, -3.397047, 1, 0.1607843, 0, 1,
-1.957305, 0.1980583, -2.833926, 1, 0.1686275, 0, 1,
-1.951756, 0.7443656, -2.001949, 1, 0.172549, 0, 1,
-1.925586, -2.59663, -4.028586, 1, 0.1803922, 0, 1,
-1.92488, -0.8661905, 0.3181762, 1, 0.1843137, 0, 1,
-1.914578, -0.8062097, -1.356158, 1, 0.1921569, 0, 1,
-1.881892, 1.245778, 0.609926, 1, 0.1960784, 0, 1,
-1.878206, 1.324964, -1.38365, 1, 0.2039216, 0, 1,
-1.871893, -0.05969847, -1.790298, 1, 0.2117647, 0, 1,
-1.867048, 0.4659424, -1.556064, 1, 0.2156863, 0, 1,
-1.866598, 0.6587051, 0.09051546, 1, 0.2235294, 0, 1,
-1.835407, 0.4693808, -2.219905, 1, 0.227451, 0, 1,
-1.834663, 0.3585666, -2.18249, 1, 0.2352941, 0, 1,
-1.816369, -1.197665, 0.3890656, 1, 0.2392157, 0, 1,
-1.804131, 0.9243258, -0.9647415, 1, 0.2470588, 0, 1,
-1.80311, 1.785973, -0.6005787, 1, 0.2509804, 0, 1,
-1.789839, -0.4491523, -1.44967, 1, 0.2588235, 0, 1,
-1.775855, -0.3359353, -1.708874, 1, 0.2627451, 0, 1,
-1.769443, 0.1174341, -0.7457828, 1, 0.2705882, 0, 1,
-1.765105, -1.189445, -2.231798, 1, 0.2745098, 0, 1,
-1.743404, 0.3182888, -2.817043, 1, 0.282353, 0, 1,
-1.728739, 0.03850231, -0.5231915, 1, 0.2862745, 0, 1,
-1.725766, 0.7225641, -2.54803, 1, 0.2941177, 0, 1,
-1.714532, 0.6941021, -1.500513, 1, 0.3019608, 0, 1,
-1.702591, -0.7063801, -2.264633, 1, 0.3058824, 0, 1,
-1.690762, -1.269703, -0.478641, 1, 0.3137255, 0, 1,
-1.689525, -0.658133, -1.474005, 1, 0.3176471, 0, 1,
-1.674521, 0.4169478, -1.220785, 1, 0.3254902, 0, 1,
-1.659359, -0.7930102, -1.661283, 1, 0.3294118, 0, 1,
-1.6523, -0.5813326, 0.2822395, 1, 0.3372549, 0, 1,
-1.640947, -0.4336983, -1.262078, 1, 0.3411765, 0, 1,
-1.633651, 0.08498063, -0.3463667, 1, 0.3490196, 0, 1,
-1.599922, 2.357953, -1.321826, 1, 0.3529412, 0, 1,
-1.586383, 1.27675, -0.3018326, 1, 0.3607843, 0, 1,
-1.574745, -1.632977, -1.648122, 1, 0.3647059, 0, 1,
-1.565431, 0.4392065, -0.8988978, 1, 0.372549, 0, 1,
-1.563981, -0.702831, -1.5064, 1, 0.3764706, 0, 1,
-1.562001, 0.07841079, -1.025055, 1, 0.3843137, 0, 1,
-1.559108, 0.7034478, -2.186158, 1, 0.3882353, 0, 1,
-1.543764, -1.388526, -3.058391, 1, 0.3960784, 0, 1,
-1.54324, -0.7996869, -2.896906, 1, 0.4039216, 0, 1,
-1.538193, -0.4824362, -0.9710786, 1, 0.4078431, 0, 1,
-1.537918, -1.112001, -1.727165, 1, 0.4156863, 0, 1,
-1.531033, -0.6203142, -2.204229, 1, 0.4196078, 0, 1,
-1.501094, 0.5627568, -1.612047, 1, 0.427451, 0, 1,
-1.497203, -1.154449, -2.929095, 1, 0.4313726, 0, 1,
-1.496298, 0.5338495, -2.648867, 1, 0.4392157, 0, 1,
-1.4863, 1.214433, -0.1150427, 1, 0.4431373, 0, 1,
-1.476146, -0.4364594, -2.583791, 1, 0.4509804, 0, 1,
-1.471604, 0.1933004, -2.506104, 1, 0.454902, 0, 1,
-1.471079, 0.4208903, -1.647702, 1, 0.4627451, 0, 1,
-1.467864, -0.226615, -2.170386, 1, 0.4666667, 0, 1,
-1.448011, 0.07430876, -0.1747145, 1, 0.4745098, 0, 1,
-1.443721, 0.6996535, -0.9369764, 1, 0.4784314, 0, 1,
-1.438197, -1.116473, -3.543535, 1, 0.4862745, 0, 1,
-1.433741, -0.5989155, -2.300075, 1, 0.4901961, 0, 1,
-1.422326, -0.6254622, -2.413505, 1, 0.4980392, 0, 1,
-1.415523, 0.02897334, -1.762641, 1, 0.5058824, 0, 1,
-1.408236, -1.033855, -0.4579765, 1, 0.509804, 0, 1,
-1.402382, -0.3437884, -1.513948, 1, 0.5176471, 0, 1,
-1.400997, 0.4563479, -0.5414954, 1, 0.5215687, 0, 1,
-1.399215, 0.4282834, -1.914741, 1, 0.5294118, 0, 1,
-1.399195, 0.6130927, 0.1027386, 1, 0.5333334, 0, 1,
-1.38193, 0.5422835, -1.945879, 1, 0.5411765, 0, 1,
-1.374811, -0.7826433, -1.906549, 1, 0.5450981, 0, 1,
-1.369411, -0.1795786, -0.2483138, 1, 0.5529412, 0, 1,
-1.364899, 0.4753581, -1.153032, 1, 0.5568628, 0, 1,
-1.354662, -0.4361206, -3.851906, 1, 0.5647059, 0, 1,
-1.354562, 0.367084, -0.3321022, 1, 0.5686275, 0, 1,
-1.323867, 0.111024, -1.715937, 1, 0.5764706, 0, 1,
-1.321973, -0.1603236, -1.497178, 1, 0.5803922, 0, 1,
-1.320344, -1.574055, -2.309081, 1, 0.5882353, 0, 1,
-1.319443, -0.3067145, -1.138865, 1, 0.5921569, 0, 1,
-1.301495, 0.01981631, -3.188012, 1, 0.6, 0, 1,
-1.300828, -0.5983506, -1.386307, 1, 0.6078432, 0, 1,
-1.288468, 0.64556, -1.132882, 1, 0.6117647, 0, 1,
-1.287772, 0.4106333, 0.9447469, 1, 0.6196079, 0, 1,
-1.286927, 0.2482059, -2.362881, 1, 0.6235294, 0, 1,
-1.28687, -0.6091284, -2.904849, 1, 0.6313726, 0, 1,
-1.284751, -2.275221, -0.733282, 1, 0.6352941, 0, 1,
-1.272848, -0.09470452, -0.1976271, 1, 0.6431373, 0, 1,
-1.271486, 0.9832667, 0.03076554, 1, 0.6470588, 0, 1,
-1.269067, 0.3323164, -1.05854, 1, 0.654902, 0, 1,
-1.25873, -2.130332, -3.432857, 1, 0.6588235, 0, 1,
-1.246432, 2.04459, -0.8648056, 1, 0.6666667, 0, 1,
-1.244158, 1.019435, -0.5465575, 1, 0.6705883, 0, 1,
-1.242051, 0.2467057, 0.3074935, 1, 0.6784314, 0, 1,
-1.236339, 1.051182, -0.3014152, 1, 0.682353, 0, 1,
-1.213572, 0.337743, -1.917609, 1, 0.6901961, 0, 1,
-1.206823, -1.428157, -3.583991, 1, 0.6941177, 0, 1,
-1.20389, -0.7135435, -1.04913, 1, 0.7019608, 0, 1,
-1.203696, 0.0117976, -0.8192241, 1, 0.7098039, 0, 1,
-1.202783, -0.1549775, -1.618164, 1, 0.7137255, 0, 1,
-1.201759, 0.09991255, -1.03502, 1, 0.7215686, 0, 1,
-1.182004, -1.552213, -1.799332, 1, 0.7254902, 0, 1,
-1.179828, -1.571148, -2.437101, 1, 0.7333333, 0, 1,
-1.173166, -0.0471832, -0.7356548, 1, 0.7372549, 0, 1,
-1.169608, 0.01793254, -0.554853, 1, 0.7450981, 0, 1,
-1.165225, 1.604802, -1.310923, 1, 0.7490196, 0, 1,
-1.163964, 0.8941852, -0.814788, 1, 0.7568628, 0, 1,
-1.159967, -0.3885074, -2.519104, 1, 0.7607843, 0, 1,
-1.152619, -0.6947066, 0.322084, 1, 0.7686275, 0, 1,
-1.152112, 1.228956, -2.61364, 1, 0.772549, 0, 1,
-1.150996, 2.583579, 0.3044144, 1, 0.7803922, 0, 1,
-1.142583, 0.2779742, -1.974893, 1, 0.7843137, 0, 1,
-1.1422, 0.03818588, 0.3583553, 1, 0.7921569, 0, 1,
-1.141463, -1.144981, -2.82987, 1, 0.7960784, 0, 1,
-1.136381, 0.05431791, -0.7252063, 1, 0.8039216, 0, 1,
-1.132941, -0.6736462, -3.739671, 1, 0.8117647, 0, 1,
-1.130169, -1.974745, -2.839244, 1, 0.8156863, 0, 1,
-1.123551, 0.1157358, -1.992266, 1, 0.8235294, 0, 1,
-1.121121, 1.503126, 0.3653562, 1, 0.827451, 0, 1,
-1.117716, -0.477352, -3.963504, 1, 0.8352941, 0, 1,
-1.114309, 1.441548, -0.07872366, 1, 0.8392157, 0, 1,
-1.113959, -0.8918611, -0.5322083, 1, 0.8470588, 0, 1,
-1.112531, 0.7110069, -0.7101506, 1, 0.8509804, 0, 1,
-1.109602, -0.7006301, -2.137872, 1, 0.8588235, 0, 1,
-1.109468, 1.256069, 0.9483184, 1, 0.8627451, 0, 1,
-1.108406, -0.5249568, -0.2591034, 1, 0.8705882, 0, 1,
-1.105903, -1.834567, -1.968395, 1, 0.8745098, 0, 1,
-1.10148, -0.6529114, -0.4674103, 1, 0.8823529, 0, 1,
-1.099516, 1.904978, 1.382728, 1, 0.8862745, 0, 1,
-1.090255, -0.9284829, -1.826047, 1, 0.8941177, 0, 1,
-1.076274, -0.3081305, -1.449654, 1, 0.8980392, 0, 1,
-1.075924, -2.318692, -0.6508449, 1, 0.9058824, 0, 1,
-1.075156, -0.1680985, -1.713799, 1, 0.9137255, 0, 1,
-1.074331, 0.2241699, -0.147689, 1, 0.9176471, 0, 1,
-1.069533, -0.8567131, -1.511798, 1, 0.9254902, 0, 1,
-1.063552, -0.6312079, -2.89027, 1, 0.9294118, 0, 1,
-1.061787, 0.3529672, -2.628658, 1, 0.9372549, 0, 1,
-1.061733, 0.3983703, -1.696347, 1, 0.9411765, 0, 1,
-1.0604, 0.6708012, -1.078385, 1, 0.9490196, 0, 1,
-1.056854, 2.262279, 0.5786073, 1, 0.9529412, 0, 1,
-1.054895, 1.800723, 0.9336363, 1, 0.9607843, 0, 1,
-1.051369, -0.354746, -3.847276, 1, 0.9647059, 0, 1,
-1.042216, 0.4576299, -2.377332, 1, 0.972549, 0, 1,
-1.039542, 0.1333298, -1.178277, 1, 0.9764706, 0, 1,
-1.03758, -1.622166, -2.730194, 1, 0.9843137, 0, 1,
-1.03437, 0.6419851, -1.235958, 1, 0.9882353, 0, 1,
-1.02859, -2.382135, -2.303422, 1, 0.9960784, 0, 1,
-1.01637, 0.02606647, -2.19699, 0.9960784, 1, 0, 1,
-1.015643, 0.577989, -0.8820594, 0.9921569, 1, 0, 1,
-1.009884, 0.09564928, -0.6872745, 0.9843137, 1, 0, 1,
-1.009238, 1.108832, -1.903409, 0.9803922, 1, 0, 1,
-1.003414, -0.08698043, -1.020525, 0.972549, 1, 0, 1,
-1.002001, -2.346738, -2.283134, 0.9686275, 1, 0, 1,
-0.9937009, -0.3812703, -2.187987, 0.9607843, 1, 0, 1,
-0.9935908, 2.036392, -0.4785461, 0.9568627, 1, 0, 1,
-0.9795794, -0.05566135, -0.2663483, 0.9490196, 1, 0, 1,
-0.9774847, 1.467184, 0.9073901, 0.945098, 1, 0, 1,
-0.9761745, -0.3596368, -1.739169, 0.9372549, 1, 0, 1,
-0.9650323, -0.9503179, -1.993988, 0.9333333, 1, 0, 1,
-0.9646389, -0.6738725, -3.608353, 0.9254902, 1, 0, 1,
-0.9625857, 1.953415, -2.240364, 0.9215686, 1, 0, 1,
-0.9612663, 1.301353, -1.54943, 0.9137255, 1, 0, 1,
-0.9584148, -0.9658905, -4.257033, 0.9098039, 1, 0, 1,
-0.9576162, 0.03664428, -1.911523, 0.9019608, 1, 0, 1,
-0.9558945, -0.3660828, -1.894855, 0.8941177, 1, 0, 1,
-0.9513545, 0.4911271, -1.55942, 0.8901961, 1, 0, 1,
-0.9497781, -0.6197008, -0.9008473, 0.8823529, 1, 0, 1,
-0.9476677, 1.188134, -2.40096, 0.8784314, 1, 0, 1,
-0.944878, -0.6594704, -1.833093, 0.8705882, 1, 0, 1,
-0.9392482, 1.206901, 1.267018, 0.8666667, 1, 0, 1,
-0.9349321, 0.8587874, -1.405827, 0.8588235, 1, 0, 1,
-0.9295638, -0.03920546, -2.945359, 0.854902, 1, 0, 1,
-0.9284359, -1.106714, -2.781134, 0.8470588, 1, 0, 1,
-0.9268059, 0.3191563, -1.29003, 0.8431373, 1, 0, 1,
-0.9250699, 0.1006612, -0.04206115, 0.8352941, 1, 0, 1,
-0.9233308, -0.6135461, -2.463336, 0.8313726, 1, 0, 1,
-0.9229549, 1.696158, -1.063349, 0.8235294, 1, 0, 1,
-0.9204679, 1.725373, -0.8777844, 0.8196079, 1, 0, 1,
-0.9192332, -1.137482, -3.8887, 0.8117647, 1, 0, 1,
-0.9155906, -0.7828434, 0.3855129, 0.8078431, 1, 0, 1,
-0.9057978, 2.460528, 0.714142, 0.8, 1, 0, 1,
-0.900986, -0.1190393, -1.032723, 0.7921569, 1, 0, 1,
-0.900236, -0.1327807, -1.506039, 0.7882353, 1, 0, 1,
-0.8989172, -1.878973, -3.722374, 0.7803922, 1, 0, 1,
-0.8940821, -1.68829, -2.031389, 0.7764706, 1, 0, 1,
-0.8796926, 0.3400679, -0.1760538, 0.7686275, 1, 0, 1,
-0.8761142, -0.8213342, -3.460273, 0.7647059, 1, 0, 1,
-0.8750474, -0.8494735, -3.0636, 0.7568628, 1, 0, 1,
-0.8735964, -0.4365344, -0.3495898, 0.7529412, 1, 0, 1,
-0.8721126, -0.2713611, 0.03118657, 0.7450981, 1, 0, 1,
-0.8716194, 1.35451, 0.3992734, 0.7411765, 1, 0, 1,
-0.8689481, 0.09456293, -2.046846, 0.7333333, 1, 0, 1,
-0.8662968, -0.6343111, -1.364934, 0.7294118, 1, 0, 1,
-0.8597325, -0.7890618, -1.899548, 0.7215686, 1, 0, 1,
-0.8546826, -1.77946, -2.39896, 0.7176471, 1, 0, 1,
-0.8538864, -0.4139224, -3.878402, 0.7098039, 1, 0, 1,
-0.8532216, -0.8417027, -1.928585, 0.7058824, 1, 0, 1,
-0.8504145, -1.327539, -3.527569, 0.6980392, 1, 0, 1,
-0.8422732, -0.04180966, -2.375321, 0.6901961, 1, 0, 1,
-0.8370044, 0.351277, -1.447865, 0.6862745, 1, 0, 1,
-0.82915, -0.04124325, -1.555711, 0.6784314, 1, 0, 1,
-0.8281555, -0.364938, -1.902711, 0.6745098, 1, 0, 1,
-0.8280482, -0.9599774, -4.250907, 0.6666667, 1, 0, 1,
-0.8268389, 0.1846048, -1.838484, 0.6627451, 1, 0, 1,
-0.8203878, 0.1641948, -1.525742, 0.654902, 1, 0, 1,
-0.8090619, 0.4458273, -1.432617, 0.6509804, 1, 0, 1,
-0.8075774, -0.6242207, -2.438418, 0.6431373, 1, 0, 1,
-0.8024047, -2.392937, -2.626057, 0.6392157, 1, 0, 1,
-0.8019943, -0.4624406, -2.84506, 0.6313726, 1, 0, 1,
-0.7961638, 2.230053, 0.9520438, 0.627451, 1, 0, 1,
-0.7949818, 1.549562, -0.4971678, 0.6196079, 1, 0, 1,
-0.7946913, -0.01280412, -1.442821, 0.6156863, 1, 0, 1,
-0.7940919, -0.4846943, -2.25032, 0.6078432, 1, 0, 1,
-0.7923681, -2.912771, -1.418285, 0.6039216, 1, 0, 1,
-0.7922421, -1.469551, -1.399246, 0.5960785, 1, 0, 1,
-0.788087, 0.3982556, -0.7375494, 0.5882353, 1, 0, 1,
-0.7876437, -0.2355448, -1.295245, 0.5843138, 1, 0, 1,
-0.7830687, -1.208143, -3.128429, 0.5764706, 1, 0, 1,
-0.7671742, -0.4368519, -1.645245, 0.572549, 1, 0, 1,
-0.7639977, -0.006885327, -3.537798, 0.5647059, 1, 0, 1,
-0.7546458, 0.1044814, -1.466844, 0.5607843, 1, 0, 1,
-0.7538744, 0.7875633, -1.387034, 0.5529412, 1, 0, 1,
-0.7472548, 0.7444548, -1.478024, 0.5490196, 1, 0, 1,
-0.7467726, -1.619343, -1.750162, 0.5411765, 1, 0, 1,
-0.7463696, -1.062975, -4.849023, 0.5372549, 1, 0, 1,
-0.7445413, -0.2385747, -1.093563, 0.5294118, 1, 0, 1,
-0.7405607, 0.1305035, -1.790638, 0.5254902, 1, 0, 1,
-0.7356853, -0.08391627, -1.13593, 0.5176471, 1, 0, 1,
-0.7279715, -0.3275344, -3.142883, 0.5137255, 1, 0, 1,
-0.7199463, -1.579416, -3.91503, 0.5058824, 1, 0, 1,
-0.7110071, 0.7682661, -0.3008881, 0.5019608, 1, 0, 1,
-0.7099206, -0.4823707, -3.063936, 0.4941176, 1, 0, 1,
-0.7084864, 0.849876, -1.627603, 0.4862745, 1, 0, 1,
-0.7072944, -1.062254, -4.739837, 0.4823529, 1, 0, 1,
-0.7011049, 0.7335792, -2.135795, 0.4745098, 1, 0, 1,
-0.7010623, 0.7259851, -1.219134, 0.4705882, 1, 0, 1,
-0.6979985, 0.3958224, -0.2904699, 0.4627451, 1, 0, 1,
-0.6964289, 0.232888, -0.9889327, 0.4588235, 1, 0, 1,
-0.6946, -0.9786579, -0.7771147, 0.4509804, 1, 0, 1,
-0.6945267, -0.02770725, 0.8528241, 0.4470588, 1, 0, 1,
-0.6902058, 0.6420949, -1.413458, 0.4392157, 1, 0, 1,
-0.6827967, 0.9771008, -2.340325, 0.4352941, 1, 0, 1,
-0.6818421, 1.376262, -1.292015, 0.427451, 1, 0, 1,
-0.6814413, -1.006253, -1.922955, 0.4235294, 1, 0, 1,
-0.6803234, -1.246276, -2.469944, 0.4156863, 1, 0, 1,
-0.6783315, -0.8114722, -2.877655, 0.4117647, 1, 0, 1,
-0.6770672, 1.752815, 0.5713338, 0.4039216, 1, 0, 1,
-0.6767818, 2.48554, -1.471413, 0.3960784, 1, 0, 1,
-0.6731685, -0.2031996, -0.9679337, 0.3921569, 1, 0, 1,
-0.6696773, -0.8795358, -3.042273, 0.3843137, 1, 0, 1,
-0.6684065, -2.384843, -2.390425, 0.3803922, 1, 0, 1,
-0.6622812, 0.4233224, -0.9731652, 0.372549, 1, 0, 1,
-0.6579339, 0.04581208, 0.71797, 0.3686275, 1, 0, 1,
-0.6564283, -0.8849889, -4.013947, 0.3607843, 1, 0, 1,
-0.6549466, 1.527997, 0.3251005, 0.3568628, 1, 0, 1,
-0.6531257, 0.3581037, -1.350793, 0.3490196, 1, 0, 1,
-0.6474183, 0.5573483, -0.02427032, 0.345098, 1, 0, 1,
-0.628004, -1.917817, -3.94323, 0.3372549, 1, 0, 1,
-0.6231341, 0.2588246, 0.1041984, 0.3333333, 1, 0, 1,
-0.6220661, -0.7730395, -0.9213989, 0.3254902, 1, 0, 1,
-0.6198689, -1.073066, -1.047549, 0.3215686, 1, 0, 1,
-0.6134521, 0.4602434, -1.030153, 0.3137255, 1, 0, 1,
-0.6094878, 0.2225194, -1.532333, 0.3098039, 1, 0, 1,
-0.6043289, -0.9670408, -3.778219, 0.3019608, 1, 0, 1,
-0.6040821, -0.5252976, -2.278953, 0.2941177, 1, 0, 1,
-0.6006335, 0.9243959, -2.242, 0.2901961, 1, 0, 1,
-0.5988725, 1.839314, -0.5502746, 0.282353, 1, 0, 1,
-0.5885023, 0.8114257, -0.539592, 0.2784314, 1, 0, 1,
-0.586347, 0.8950161, -0.860585, 0.2705882, 1, 0, 1,
-0.5830517, 1.537832, -1.62333, 0.2666667, 1, 0, 1,
-0.582336, -0.8982995, -2.149031, 0.2588235, 1, 0, 1,
-0.5814657, 0.5842731, -1.301898, 0.254902, 1, 0, 1,
-0.5796157, -2.482243, -2.90833, 0.2470588, 1, 0, 1,
-0.5795155, 0.1096496, -0.3383198, 0.2431373, 1, 0, 1,
-0.5787158, -0.1716208, -2.98834, 0.2352941, 1, 0, 1,
-0.5786145, -0.2185747, -2.941336, 0.2313726, 1, 0, 1,
-0.576472, 0.8650857, 0.3278472, 0.2235294, 1, 0, 1,
-0.5761674, -1.72762, -3.127624, 0.2196078, 1, 0, 1,
-0.5760936, 0.6487955, 0.6407993, 0.2117647, 1, 0, 1,
-0.5754629, -0.9618521, -2.064723, 0.2078431, 1, 0, 1,
-0.5716217, 1.856135, 0.3609749, 0.2, 1, 0, 1,
-0.5712876, -1.868768, -3.813699, 0.1921569, 1, 0, 1,
-0.570719, -0.2727762, -1.669543, 0.1882353, 1, 0, 1,
-0.5695654, -1.409201, -3.594049, 0.1803922, 1, 0, 1,
-0.568767, -2.033725, -2.461771, 0.1764706, 1, 0, 1,
-0.5645461, -0.06814621, -1.890453, 0.1686275, 1, 0, 1,
-0.5570469, -0.04409873, -2.041424, 0.1647059, 1, 0, 1,
-0.5563377, 0.04371694, -0.4104084, 0.1568628, 1, 0, 1,
-0.5540809, -0.6966318, -3.449563, 0.1529412, 1, 0, 1,
-0.5530969, -0.651053, -1.905179, 0.145098, 1, 0, 1,
-0.5518584, -0.5718045, -1.198029, 0.1411765, 1, 0, 1,
-0.5498489, 1.508095, -1.337489, 0.1333333, 1, 0, 1,
-0.54847, 1.032841, 0.3851015, 0.1294118, 1, 0, 1,
-0.5475239, -0.6053649, -1.079115, 0.1215686, 1, 0, 1,
-0.5458863, -0.8376639, -2.134875, 0.1176471, 1, 0, 1,
-0.5410368, -2.437437, -2.369919, 0.1098039, 1, 0, 1,
-0.5402423, 1.588037, -1.192355, 0.1058824, 1, 0, 1,
-0.5392427, 1.579617, -0.01519541, 0.09803922, 1, 0, 1,
-0.5363968, -0.5099836, -2.453127, 0.09019608, 1, 0, 1,
-0.535189, -0.03058006, -1.646936, 0.08627451, 1, 0, 1,
-0.5335932, 0.01541099, -0.526419, 0.07843138, 1, 0, 1,
-0.5323691, -0.385925, -0.3725797, 0.07450981, 1, 0, 1,
-0.525947, -1.167792, -1.706211, 0.06666667, 1, 0, 1,
-0.5224683, -0.2391236, -2.402421, 0.0627451, 1, 0, 1,
-0.5220393, -0.2428663, -0.8424464, 0.05490196, 1, 0, 1,
-0.5180208, 0.1182143, -2.385345, 0.05098039, 1, 0, 1,
-0.5168804, -1.629608, -3.027046, 0.04313726, 1, 0, 1,
-0.5142073, -1.547782, -2.211827, 0.03921569, 1, 0, 1,
-0.5066188, 0.7540144, -1.916519, 0.03137255, 1, 0, 1,
-0.5052257, -1.790657, -1.544485, 0.02745098, 1, 0, 1,
-0.5009875, 1.144912, 0.618799, 0.01960784, 1, 0, 1,
-0.49922, 0.2023576, -2.311354, 0.01568628, 1, 0, 1,
-0.497909, 1.488162, 0.1856287, 0.007843138, 1, 0, 1,
-0.4965853, -0.2987728, -1.9052, 0.003921569, 1, 0, 1,
-0.4899233, 0.7526619, -0.987929, 0, 1, 0.003921569, 1,
-0.4867287, -0.7976651, -2.5323, 0, 1, 0.01176471, 1,
-0.4804524, 0.005443723, -0.4088987, 0, 1, 0.01568628, 1,
-0.4736012, -0.9733784, -1.528812, 0, 1, 0.02352941, 1,
-0.4706635, -0.753242, -1.387621, 0, 1, 0.02745098, 1,
-0.4672264, 0.593914, -0.2475026, 0, 1, 0.03529412, 1,
-0.4665242, -0.8404021, -2.726382, 0, 1, 0.03921569, 1,
-0.4657084, 0.4692802, -0.8940846, 0, 1, 0.04705882, 1,
-0.4655337, -0.5840572, -1.323717, 0, 1, 0.05098039, 1,
-0.4624551, 0.0726457, -1.525703, 0, 1, 0.05882353, 1,
-0.4608884, -1.61223, -2.933707, 0, 1, 0.0627451, 1,
-0.4603929, -1.600103, -2.540904, 0, 1, 0.07058824, 1,
-0.4599939, -0.4709592, -1.870272, 0, 1, 0.07450981, 1,
-0.4575312, 2.444437, 0.01698113, 0, 1, 0.08235294, 1,
-0.4541823, 1.200619, -1.061713, 0, 1, 0.08627451, 1,
-0.4536491, 0.130744, -0.2867668, 0, 1, 0.09411765, 1,
-0.4511224, 1.204292, -0.6559489, 0, 1, 0.1019608, 1,
-0.450025, 2.328602, 0.08359776, 0, 1, 0.1058824, 1,
-0.4496861, 0.4907238, -0.4490572, 0, 1, 0.1137255, 1,
-0.4423949, 1.01427, -2.037659, 0, 1, 0.1176471, 1,
-0.4410488, 1.780393, 0.6089133, 0, 1, 0.1254902, 1,
-0.4410038, -2.251027, -3.058509, 0, 1, 0.1294118, 1,
-0.4405334, 0.7882581, -0.9803436, 0, 1, 0.1372549, 1,
-0.4356247, -0.4526373, -3.481355, 0, 1, 0.1411765, 1,
-0.4346274, -1.042309, -2.593502, 0, 1, 0.1490196, 1,
-0.4318427, -0.1191297, -1.047136, 0, 1, 0.1529412, 1,
-0.4302879, 1.866348, 2.075266, 0, 1, 0.1607843, 1,
-0.4301066, 0.6442135, 1.567304, 0, 1, 0.1647059, 1,
-0.4297359, -1.46443, -2.383596, 0, 1, 0.172549, 1,
-0.4287749, 0.4493696, -0.5695732, 0, 1, 0.1764706, 1,
-0.4276027, 1.303815, -1.64677, 0, 1, 0.1843137, 1,
-0.4252408, -1.988, -1.432318, 0, 1, 0.1882353, 1,
-0.4231997, 0.7570968, -1.138637, 0, 1, 0.1960784, 1,
-0.415964, 0.3019813, -1.098739, 0, 1, 0.2039216, 1,
-0.4149624, -0.5402554, -1.681292, 0, 1, 0.2078431, 1,
-0.4115407, 0.5812759, -0.68687, 0, 1, 0.2156863, 1,
-0.4071683, -2.161752, -4.546093, 0, 1, 0.2196078, 1,
-0.4064865, -0.8817992, -3.728733, 0, 1, 0.227451, 1,
-0.404231, -1.543662, -3.487473, 0, 1, 0.2313726, 1,
-0.4026068, -1.476172, -1.724015, 0, 1, 0.2392157, 1,
-0.3987554, 0.8042568, -1.360289, 0, 1, 0.2431373, 1,
-0.3965114, 0.3963339, -0.3515191, 0, 1, 0.2509804, 1,
-0.3951679, -0.6935337, -2.154284, 0, 1, 0.254902, 1,
-0.3932959, 1.493351, -0.3370241, 0, 1, 0.2627451, 1,
-0.386761, -0.8029238, -3.437306, 0, 1, 0.2666667, 1,
-0.3860251, -0.6442125, 0.1100041, 0, 1, 0.2745098, 1,
-0.3854766, -0.1056203, -1.81418, 0, 1, 0.2784314, 1,
-0.3820519, -0.8480729, -2.09144, 0, 1, 0.2862745, 1,
-0.3794546, 0.0501542, -0.6167254, 0, 1, 0.2901961, 1,
-0.3768602, -1.709368, -4.229887, 0, 1, 0.2980392, 1,
-0.3717924, -1.080332, -1.139563, 0, 1, 0.3058824, 1,
-0.3703536, 0.9970149, -0.7287081, 0, 1, 0.3098039, 1,
-0.3699489, -0.732296, -2.364937, 0, 1, 0.3176471, 1,
-0.3683031, -0.2143739, -0.8836226, 0, 1, 0.3215686, 1,
-0.3672867, 0.03745052, -2.156407, 0, 1, 0.3294118, 1,
-0.3651597, -0.01447174, -2.216023, 0, 1, 0.3333333, 1,
-0.3602777, 0.7707433, -0.1995641, 0, 1, 0.3411765, 1,
-0.3595387, -0.1757713, -0.09055587, 0, 1, 0.345098, 1,
-0.357729, -0.4993181, -2.007921, 0, 1, 0.3529412, 1,
-0.3572903, 0.2032333, -0.644696, 0, 1, 0.3568628, 1,
-0.3543231, 0.2131082, 0.8404105, 0, 1, 0.3647059, 1,
-0.3514255, 1.04315, 0.2740501, 0, 1, 0.3686275, 1,
-0.3429432, -0.5465283, -0.425889, 0, 1, 0.3764706, 1,
-0.3401209, -0.8843546, -1.88905, 0, 1, 0.3803922, 1,
-0.3378578, 1.255277, -0.5819266, 0, 1, 0.3882353, 1,
-0.3337841, 0.8903, 0.4551346, 0, 1, 0.3921569, 1,
-0.3290085, -2.208946, -3.034526, 0, 1, 0.4, 1,
-0.326954, 0.7273651, 1.503636, 0, 1, 0.4078431, 1,
-0.3242371, -0.4419201, -3.45156, 0, 1, 0.4117647, 1,
-0.3211505, -0.6737967, -1.647813, 0, 1, 0.4196078, 1,
-0.3204553, -1.004153, -2.818346, 0, 1, 0.4235294, 1,
-0.3199736, 0.9668586, 0.9651836, 0, 1, 0.4313726, 1,
-0.3178617, 0.4070116, 1.184204, 0, 1, 0.4352941, 1,
-0.3094054, 0.37712, -2.554434, 0, 1, 0.4431373, 1,
-0.3022771, -0.8392129, 0.2854225, 0, 1, 0.4470588, 1,
-0.2991683, 0.08299354, -1.173985, 0, 1, 0.454902, 1,
-0.2966371, 0.4933855, -2.500667, 0, 1, 0.4588235, 1,
-0.2921272, 0.2116711, 0.0952287, 0, 1, 0.4666667, 1,
-0.290922, -0.1416716, -3.382898, 0, 1, 0.4705882, 1,
-0.2909148, 0.1606029, -1.733651, 0, 1, 0.4784314, 1,
-0.2906622, -1.474225, -1.429864, 0, 1, 0.4823529, 1,
-0.2891279, 0.7225942, -1.946689, 0, 1, 0.4901961, 1,
-0.2874088, 1.669825, -0.09390684, 0, 1, 0.4941176, 1,
-0.2853156, 1.387281, -0.207078, 0, 1, 0.5019608, 1,
-0.284371, 0.09743732, -2.271257, 0, 1, 0.509804, 1,
-0.2842283, 0.6209253, -2.484321, 0, 1, 0.5137255, 1,
-0.2837057, -0.8096783, -3.956293, 0, 1, 0.5215687, 1,
-0.2819706, 0.4702004, -1.563887, 0, 1, 0.5254902, 1,
-0.2796645, 0.6027346, -0.8881015, 0, 1, 0.5333334, 1,
-0.2793812, 0.4601444, -0.05847413, 0, 1, 0.5372549, 1,
-0.2769506, -0.4562064, -2.387048, 0, 1, 0.5450981, 1,
-0.2733408, -0.3763346, -2.744678, 0, 1, 0.5490196, 1,
-0.2701513, -0.5009041, -4.22721, 0, 1, 0.5568628, 1,
-0.2669414, 0.8288799, -0.1084322, 0, 1, 0.5607843, 1,
-0.2667346, -0.2217537, -1.942347, 0, 1, 0.5686275, 1,
-0.2658585, -1.038841, -4.090075, 0, 1, 0.572549, 1,
-0.2644707, -0.1384815, -1.87436, 0, 1, 0.5803922, 1,
-0.264284, -1.36969, -1.652154, 0, 1, 0.5843138, 1,
-0.2620466, 1.476978, -0.5943273, 0, 1, 0.5921569, 1,
-0.2603751, 0.8711663, 0.1491999, 0, 1, 0.5960785, 1,
-0.2601697, -1.462673, -2.304715, 0, 1, 0.6039216, 1,
-0.2589249, 1.229493, -1.335566, 0, 1, 0.6117647, 1,
-0.2537283, -1.163701, -3.87936, 0, 1, 0.6156863, 1,
-0.2526289, -0.3620909, -1.309648, 0, 1, 0.6235294, 1,
-0.250815, -0.33905, -1.431744, 0, 1, 0.627451, 1,
-0.240114, 1.109397, -1.146879, 0, 1, 0.6352941, 1,
-0.2367164, 0.2768985, -1.905805, 0, 1, 0.6392157, 1,
-0.2341119, -0.3651081, -3.615854, 0, 1, 0.6470588, 1,
-0.2325238, 0.624983, -0.4525574, 0, 1, 0.6509804, 1,
-0.2300539, -1.684635, -3.371498, 0, 1, 0.6588235, 1,
-0.2272249, -1.486428, -2.158998, 0, 1, 0.6627451, 1,
-0.2227162, 0.09968361, -1.729578, 0, 1, 0.6705883, 1,
-0.2206243, -0.1530654, -0.0003893412, 0, 1, 0.6745098, 1,
-0.2171018, -0.1223598, -1.512257, 0, 1, 0.682353, 1,
-0.2146655, -0.2522374, -3.626301, 0, 1, 0.6862745, 1,
-0.2071158, 1.615891, -0.3077989, 0, 1, 0.6941177, 1,
-0.2041037, 0.2076953, -1.120703, 0, 1, 0.7019608, 1,
-0.2022001, 1.151925, -0.2951992, 0, 1, 0.7058824, 1,
-0.2015754, 1.622132, 0.6108471, 0, 1, 0.7137255, 1,
-0.1979659, 0.3066597, -0.3240629, 0, 1, 0.7176471, 1,
-0.1973147, 1.55794, -0.8479903, 0, 1, 0.7254902, 1,
-0.1955181, -0.7926072, -2.742915, 0, 1, 0.7294118, 1,
-0.1926216, -2.268829, -3.22822, 0, 1, 0.7372549, 1,
-0.1916134, -1.01045, -3.22775, 0, 1, 0.7411765, 1,
-0.1909492, -1.515401, -2.393031, 0, 1, 0.7490196, 1,
-0.1828675, 0.05844043, -1.105023, 0, 1, 0.7529412, 1,
-0.1766838, 0.6612256, 0.8423211, 0, 1, 0.7607843, 1,
-0.1757141, -0.580834, -3.044136, 0, 1, 0.7647059, 1,
-0.1736433, -0.09350799, -2.137545, 0, 1, 0.772549, 1,
-0.172767, 0.4566762, 0.7611355, 0, 1, 0.7764706, 1,
-0.1699548, -0.7232643, -3.49606, 0, 1, 0.7843137, 1,
-0.1680018, -1.998072, -3.97434, 0, 1, 0.7882353, 1,
-0.1635446, 0.1211897, -0.7483998, 0, 1, 0.7960784, 1,
-0.1628619, -0.6510618, -3.636024, 0, 1, 0.8039216, 1,
-0.1614197, -1.470245, -4.474089, 0, 1, 0.8078431, 1,
-0.1613977, 1.429159, 1.644139, 0, 1, 0.8156863, 1,
-0.1603847, 1.800923, -1.169877, 0, 1, 0.8196079, 1,
-0.1578704, 1.3875, -0.651177, 0, 1, 0.827451, 1,
-0.155775, 0.2897129, 0.08349205, 0, 1, 0.8313726, 1,
-0.1542459, 0.1278508, -1.091633, 0, 1, 0.8392157, 1,
-0.1512769, -1.306702, -4.768283, 0, 1, 0.8431373, 1,
-0.1374009, 0.5928099, -0.6921976, 0, 1, 0.8509804, 1,
-0.1320665, -0.5072312, -2.275134, 0, 1, 0.854902, 1,
-0.1297129, -0.3829686, -2.141819, 0, 1, 0.8627451, 1,
-0.128448, -1.044359, -2.306363, 0, 1, 0.8666667, 1,
-0.1257865, -0.3452605, -1.695098, 0, 1, 0.8745098, 1,
-0.121861, -0.5173117, -2.393823, 0, 1, 0.8784314, 1,
-0.1216019, 0.6132939, -1.687694, 0, 1, 0.8862745, 1,
-0.1115751, 0.7192539, 0.1055939, 0, 1, 0.8901961, 1,
-0.1088935, 0.3040329, -1.395362, 0, 1, 0.8980392, 1,
-0.1047512, -0.1023939, -1.011256, 0, 1, 0.9058824, 1,
-0.09488697, 1.513314, 0.2952983, 0, 1, 0.9098039, 1,
-0.090413, 0.1444205, -1.432554, 0, 1, 0.9176471, 1,
-0.08810209, 0.06353907, 0.4363458, 0, 1, 0.9215686, 1,
-0.08805344, 0.3404645, 0.1382299, 0, 1, 0.9294118, 1,
-0.08786129, -0.5508797, -4.655581, 0, 1, 0.9333333, 1,
-0.08211199, -3.261071, -2.751957, 0, 1, 0.9411765, 1,
-0.07752685, -0.549266, -2.727111, 0, 1, 0.945098, 1,
-0.07432437, -1.163327, -4.494538, 0, 1, 0.9529412, 1,
-0.06832159, -0.3713106, -3.88473, 0, 1, 0.9568627, 1,
-0.06244529, -0.275502, -2.031422, 0, 1, 0.9647059, 1,
-0.06144244, -0.9444487, -2.943842, 0, 1, 0.9686275, 1,
-0.06034249, -0.9057068, -3.546344, 0, 1, 0.9764706, 1,
-0.05202596, 0.3623868, -0.4572996, 0, 1, 0.9803922, 1,
-0.04979349, 0.3241551, 0.8434307, 0, 1, 0.9882353, 1,
-0.04908742, 1.280419, -1.428828, 0, 1, 0.9921569, 1,
-0.04701632, 1.521237, 0.5845702, 0, 1, 1, 1,
-0.04363401, -1.536121, -2.953932, 0, 0.9921569, 1, 1,
-0.04055623, 2.252451, 0.03244174, 0, 0.9882353, 1, 1,
-0.03549309, 0.4590144, -0.08970082, 0, 0.9803922, 1, 1,
-0.03404409, -0.1445471, -1.143455, 0, 0.9764706, 1, 1,
-0.03264436, -0.2889034, -1.913672, 0, 0.9686275, 1, 1,
-0.03166686, 1.131869, 0.5801772, 0, 0.9647059, 1, 1,
-0.03039375, -0.1880516, -2.566015, 0, 0.9568627, 1, 1,
-0.02307026, -0.9713047, -1.829297, 0, 0.9529412, 1, 1,
-0.02241899, 0.09541799, -0.7856658, 0, 0.945098, 1, 1,
-0.01935336, -0.550465, -3.17225, 0, 0.9411765, 1, 1,
-0.01679771, 0.9720706, -0.21281, 0, 0.9333333, 1, 1,
-0.009937211, -0.6128317, -1.51573, 0, 0.9294118, 1, 1,
-0.008547019, 0.8323051, 0.9130679, 0, 0.9215686, 1, 1,
0.008099856, -0.5386797, 2.320013, 0, 0.9176471, 1, 1,
0.01115056, -0.2228326, 3.46367, 0, 0.9098039, 1, 1,
0.01126926, 0.106758, -0.3312657, 0, 0.9058824, 1, 1,
0.0115683, -3.380239, 0.681068, 0, 0.8980392, 1, 1,
0.01355938, -0.4215035, 2.57022, 0, 0.8901961, 1, 1,
0.01379728, 1.07916, 0.4293322, 0, 0.8862745, 1, 1,
0.01732776, 1.48983, -0.4234289, 0, 0.8784314, 1, 1,
0.03039633, -2.243488, 3.138791, 0, 0.8745098, 1, 1,
0.03835513, -0.5817264, 4.398847, 0, 0.8666667, 1, 1,
0.0396566, -0.1365253, 3.375114, 0, 0.8627451, 1, 1,
0.03997159, 1.022224, 1.293778, 0, 0.854902, 1, 1,
0.04069793, 0.3402957, -0.1328273, 0, 0.8509804, 1, 1,
0.04158203, 0.3021998, -0.3003224, 0, 0.8431373, 1, 1,
0.04266188, 0.4394493, -0.7252728, 0, 0.8392157, 1, 1,
0.04312301, -0.8054094, 1.663616, 0, 0.8313726, 1, 1,
0.04945541, 0.9066628, -0.7205437, 0, 0.827451, 1, 1,
0.05079133, -0.1339588, 3.545549, 0, 0.8196079, 1, 1,
0.05100482, -1.708872, 3.190332, 0, 0.8156863, 1, 1,
0.05651397, -0.2431495, 2.047493, 0, 0.8078431, 1, 1,
0.06356692, 0.5880203, 0.03420337, 0, 0.8039216, 1, 1,
0.06440333, 0.1659691, 0.1439956, 0, 0.7960784, 1, 1,
0.06447696, 0.6949599, 1.081641, 0, 0.7882353, 1, 1,
0.06993731, -0.5450036, 3.645435, 0, 0.7843137, 1, 1,
0.07117905, -1.194314, 2.992468, 0, 0.7764706, 1, 1,
0.07168678, -1.490926, 2.995892, 0, 0.772549, 1, 1,
0.07423669, 0.7983644, -0.2265502, 0, 0.7647059, 1, 1,
0.07612571, 1.433544, 0.4584074, 0, 0.7607843, 1, 1,
0.07867337, -0.5298868, 5.34786, 0, 0.7529412, 1, 1,
0.08144903, -0.5669385, 2.684715, 0, 0.7490196, 1, 1,
0.08424661, 1.596939, -1.233361, 0, 0.7411765, 1, 1,
0.08580451, -0.1936865, 3.598806, 0, 0.7372549, 1, 1,
0.08611905, -0.3890029, 3.472208, 0, 0.7294118, 1, 1,
0.08615547, 0.5458509, -2.328035, 0, 0.7254902, 1, 1,
0.08788688, -0.9170818, 2.158879, 0, 0.7176471, 1, 1,
0.08806966, 1.299029, -0.4365553, 0, 0.7137255, 1, 1,
0.08893169, -1.230188, 1.781723, 0, 0.7058824, 1, 1,
0.08931874, 1.626364, -0.379362, 0, 0.6980392, 1, 1,
0.08943791, 1.912947, -1.214571, 0, 0.6941177, 1, 1,
0.09277653, 0.8576663, -1.130753, 0, 0.6862745, 1, 1,
0.09700244, -1.788693, 1.832877, 0, 0.682353, 1, 1,
0.09941718, -0.2340873, 2.944575, 0, 0.6745098, 1, 1,
0.1005869, -0.4600893, 3.446018, 0, 0.6705883, 1, 1,
0.1007203, 1.39645, -0.9581853, 0, 0.6627451, 1, 1,
0.1054576, 0.3701358, 0.3812569, 0, 0.6588235, 1, 1,
0.1070954, 0.01225997, 0.5293753, 0, 0.6509804, 1, 1,
0.1085578, 0.2265322, -0.1604142, 0, 0.6470588, 1, 1,
0.1093494, 0.9361181, 1.159787, 0, 0.6392157, 1, 1,
0.1153807, -1.717064, 2.595268, 0, 0.6352941, 1, 1,
0.1166895, -0.2895615, 3.196774, 0, 0.627451, 1, 1,
0.1173888, -1.397543, 2.265825, 0, 0.6235294, 1, 1,
0.1225379, -1.116923, 2.922265, 0, 0.6156863, 1, 1,
0.1243904, 0.1554149, 0.4042576, 0, 0.6117647, 1, 1,
0.1266135, 0.1055745, 0.1920669, 0, 0.6039216, 1, 1,
0.1286636, -0.1094505, 2.060321, 0, 0.5960785, 1, 1,
0.1301126, 0.4590349, 1.963184, 0, 0.5921569, 1, 1,
0.1351907, -0.5683947, 4.150875, 0, 0.5843138, 1, 1,
0.1378962, 0.9412035, -0.5751469, 0, 0.5803922, 1, 1,
0.1386802, 0.002975183, 2.22554, 0, 0.572549, 1, 1,
0.1393336, 0.997229, -1.065657, 0, 0.5686275, 1, 1,
0.1416805, -1.345456, 4.543346, 0, 0.5607843, 1, 1,
0.1433004, -0.3253708, 2.767265, 0, 0.5568628, 1, 1,
0.1438005, -1.424058, 4.211335, 0, 0.5490196, 1, 1,
0.1446862, -1.3238, 4.172373, 0, 0.5450981, 1, 1,
0.1454612, -0.315533, 3.874944, 0, 0.5372549, 1, 1,
0.1536421, 0.9418196, 2.105871, 0, 0.5333334, 1, 1,
0.1540163, -2.190528, 4.090758, 0, 0.5254902, 1, 1,
0.1540723, 2.868409, 0.3077441, 0, 0.5215687, 1, 1,
0.1596286, -0.8827955, 2.866377, 0, 0.5137255, 1, 1,
0.164849, -0.1912263, 2.067569, 0, 0.509804, 1, 1,
0.1670339, 0.4369041, 1.156867, 0, 0.5019608, 1, 1,
0.1676169, -1.090943, 2.63741, 0, 0.4941176, 1, 1,
0.1712867, 0.3118679, 1.184606, 0, 0.4901961, 1, 1,
0.1713781, 0.9677714, -1.232649, 0, 0.4823529, 1, 1,
0.176358, 0.08785447, 3.088958, 0, 0.4784314, 1, 1,
0.1772615, 0.00206254, 2.244541, 0, 0.4705882, 1, 1,
0.1828302, -0.1200234, 2.263779, 0, 0.4666667, 1, 1,
0.1859821, -0.7407891, 0.4959425, 0, 0.4588235, 1, 1,
0.1914782, -0.2700999, 2.883119, 0, 0.454902, 1, 1,
0.1919675, -1.720858, 2.277323, 0, 0.4470588, 1, 1,
0.1935293, 0.1171202, 0.6064287, 0, 0.4431373, 1, 1,
0.2046238, -3.221074, 3.663018, 0, 0.4352941, 1, 1,
0.207429, 0.1509598, -0.3468605, 0, 0.4313726, 1, 1,
0.2076015, -0.4040164, 4.32231, 0, 0.4235294, 1, 1,
0.2080188, -1.112611, 5.292882, 0, 0.4196078, 1, 1,
0.2107093, 1.111325, 0.6912653, 0, 0.4117647, 1, 1,
0.2115096, 1.051112, 1.2794, 0, 0.4078431, 1, 1,
0.2127785, -1.104533, 3.926156, 0, 0.4, 1, 1,
0.2178183, 0.5364496, 0.05286997, 0, 0.3921569, 1, 1,
0.2189062, -1.234468, 2.769153, 0, 0.3882353, 1, 1,
0.2201408, 0.7570114, 1.450379, 0, 0.3803922, 1, 1,
0.2225494, 0.03382141, 2.28507, 0, 0.3764706, 1, 1,
0.2253872, -0.5013487, 1.958878, 0, 0.3686275, 1, 1,
0.2304361, 0.09634895, 0.786116, 0, 0.3647059, 1, 1,
0.2318922, 0.7975734, 0.4817572, 0, 0.3568628, 1, 1,
0.233566, 0.1702522, 0.9582915, 0, 0.3529412, 1, 1,
0.2335974, 0.6549796, 0.5119956, 0, 0.345098, 1, 1,
0.2384881, -0.07844447, 1.614366, 0, 0.3411765, 1, 1,
0.2402667, -0.5739635, 3.442201, 0, 0.3333333, 1, 1,
0.2404762, -0.1597962, 2.8268, 0, 0.3294118, 1, 1,
0.2420355, -1.20391, 2.706915, 0, 0.3215686, 1, 1,
0.2449676, 0.7728815, -0.9182637, 0, 0.3176471, 1, 1,
0.2468233, 0.5458576, 0.3641907, 0, 0.3098039, 1, 1,
0.247209, -1.832124, 2.701459, 0, 0.3058824, 1, 1,
0.2473629, 2.25655, -0.2076758, 0, 0.2980392, 1, 1,
0.2526858, -1.206923, 1.310223, 0, 0.2901961, 1, 1,
0.2535238, 1.155944, 1.175198, 0, 0.2862745, 1, 1,
0.2544732, -1.416208, 3.537906, 0, 0.2784314, 1, 1,
0.2560684, 2.631147, 0.6060209, 0, 0.2745098, 1, 1,
0.2561814, -1.123618, 4.400904, 0, 0.2666667, 1, 1,
0.2563052, -1.836255, 2.908171, 0, 0.2627451, 1, 1,
0.257371, 0.6222614, 1.181969, 0, 0.254902, 1, 1,
0.267788, -0.09167259, 2.61825, 0, 0.2509804, 1, 1,
0.2683584, 0.1038376, 1.488122, 0, 0.2431373, 1, 1,
0.2707108, -0.7050247, 1.952109, 0, 0.2392157, 1, 1,
0.2708725, 1.318269, -0.1657429, 0, 0.2313726, 1, 1,
0.2726205, 0.1954412, 0.09949021, 0, 0.227451, 1, 1,
0.2770975, 0.4721141, 2.260997, 0, 0.2196078, 1, 1,
0.2862381, -0.7044578, 0.8818493, 0, 0.2156863, 1, 1,
0.2870197, -1.028544, 3.055152, 0, 0.2078431, 1, 1,
0.2895297, -0.6422102, 4.022882, 0, 0.2039216, 1, 1,
0.2895845, -0.2901567, 2.439235, 0, 0.1960784, 1, 1,
0.292875, 1.020053, 0.6874396, 0, 0.1882353, 1, 1,
0.2940432, 0.4034368, 0.4119827, 0, 0.1843137, 1, 1,
0.2963584, 0.3679672, 1.34793, 0, 0.1764706, 1, 1,
0.2997698, -1.169865, 4.295352, 0, 0.172549, 1, 1,
0.3006499, -0.5547082, 4.217448, 0, 0.1647059, 1, 1,
0.3046544, -1.140244, 2.498914, 0, 0.1607843, 1, 1,
0.3050606, 0.7335558, 0.7402733, 0, 0.1529412, 1, 1,
0.3070561, -1.028417, 2.163228, 0, 0.1490196, 1, 1,
0.3132486, -0.4460815, 1.466143, 0, 0.1411765, 1, 1,
0.3147815, 1.894088, 0.4633544, 0, 0.1372549, 1, 1,
0.3167785, -0.4083622, 2.550946, 0, 0.1294118, 1, 1,
0.3203096, -0.6385356, 2.065267, 0, 0.1254902, 1, 1,
0.3225614, 1.508671, -0.8252987, 0, 0.1176471, 1, 1,
0.3247046, 0.2307208, -1.174065, 0, 0.1137255, 1, 1,
0.3263768, -1.620829, 2.810841, 0, 0.1058824, 1, 1,
0.3295202, -0.6785263, 2.30391, 0, 0.09803922, 1, 1,
0.3335012, -1.665024, 3.113992, 0, 0.09411765, 1, 1,
0.3353037, -2.611258, 3.229673, 0, 0.08627451, 1, 1,
0.3395336, -1.307967, 4.050652, 0, 0.08235294, 1, 1,
0.3478308, -0.09310699, 1.598349, 0, 0.07450981, 1, 1,
0.3483161, -1.225004, 3.612233, 0, 0.07058824, 1, 1,
0.3533392, -0.99954, 3.256347, 0, 0.0627451, 1, 1,
0.3537129, -1.16125, 3.96803, 0, 0.05882353, 1, 1,
0.3591526, -1.271205, 4.085291, 0, 0.05098039, 1, 1,
0.3643006, -1.354782, 2.568075, 0, 0.04705882, 1, 1,
0.3712339, 0.9663025, 1.535817, 0, 0.03921569, 1, 1,
0.3739913, -0.04239248, 2.8081, 0, 0.03529412, 1, 1,
0.377092, 0.6063049, 1.302455, 0, 0.02745098, 1, 1,
0.3793699, 0.9595588, -1.467518, 0, 0.02352941, 1, 1,
0.3909338, -0.2216277, 0.8987645, 0, 0.01568628, 1, 1,
0.397527, 1.295411, 1.153687, 0, 0.01176471, 1, 1,
0.4031326, 0.5402212, 0.8630348, 0, 0.003921569, 1, 1,
0.4086024, -0.6867014, 2.980216, 0.003921569, 0, 1, 1,
0.4093431, 0.213011, 1.520923, 0.007843138, 0, 1, 1,
0.4110285, 0.4148395, 1.483162, 0.01568628, 0, 1, 1,
0.4131747, 0.9309363, 2.167944, 0.01960784, 0, 1, 1,
0.4154906, 1.223247, -0.801824, 0.02745098, 0, 1, 1,
0.4218802, -0.8714818, 1.993553, 0.03137255, 0, 1, 1,
0.4242412, 0.05900992, 0.3499538, 0.03921569, 0, 1, 1,
0.4298036, 0.137925, 3.632335, 0.04313726, 0, 1, 1,
0.4339269, 0.605357, -0.4892948, 0.05098039, 0, 1, 1,
0.4341307, -0.5592122, 1.743723, 0.05490196, 0, 1, 1,
0.439378, -0.2252944, 3.885598, 0.0627451, 0, 1, 1,
0.4402508, 0.6185984, 0.4317059, 0.06666667, 0, 1, 1,
0.4422489, 1.151811, -0.6724188, 0.07450981, 0, 1, 1,
0.4442031, 1.240692, -0.1569135, 0.07843138, 0, 1, 1,
0.4472339, -0.2304084, 0.4929696, 0.08627451, 0, 1, 1,
0.4479465, 1.570483, 0.1575, 0.09019608, 0, 1, 1,
0.4509734, 0.09909, 1.084418, 0.09803922, 0, 1, 1,
0.4550744, -0.6861691, 3.358827, 0.1058824, 0, 1, 1,
0.4550828, 0.1639716, 2.902996, 0.1098039, 0, 1, 1,
0.4592003, -0.9357541, 3.380442, 0.1176471, 0, 1, 1,
0.4595987, 0.5941772, 0.01390962, 0.1215686, 0, 1, 1,
0.4611461, 0.1956369, 1.721308, 0.1294118, 0, 1, 1,
0.461941, 0.5173533, 0.9155487, 0.1333333, 0, 1, 1,
0.4620925, -0.5315433, 3.405978, 0.1411765, 0, 1, 1,
0.4654484, -0.6182712, 1.486623, 0.145098, 0, 1, 1,
0.4671522, 2.103703, 0.7107943, 0.1529412, 0, 1, 1,
0.4681211, -0.5625651, 2.681647, 0.1568628, 0, 1, 1,
0.4699979, 1.970697, -0.909096, 0.1647059, 0, 1, 1,
0.4772873, 0.3809725, 0.1581208, 0.1686275, 0, 1, 1,
0.4779991, -0.5352484, 3.648147, 0.1764706, 0, 1, 1,
0.4789777, 1.524541, 1.532164, 0.1803922, 0, 1, 1,
0.484933, -2.19237, 2.808306, 0.1882353, 0, 1, 1,
0.487155, -0.05613979, 1.923019, 0.1921569, 0, 1, 1,
0.4885983, 1.776142, 2.462295, 0.2, 0, 1, 1,
0.489652, -1.27462, 3.976212, 0.2078431, 0, 1, 1,
0.4946265, -1.526807, 2.047157, 0.2117647, 0, 1, 1,
0.4952955, 0.757143, 0.2521078, 0.2196078, 0, 1, 1,
0.498751, 0.2267949, 2.352595, 0.2235294, 0, 1, 1,
0.4994561, 1.555456, -0.1523987, 0.2313726, 0, 1, 1,
0.4999077, -0.3731503, 3.358909, 0.2352941, 0, 1, 1,
0.5012245, 0.2793125, 0.4513756, 0.2431373, 0, 1, 1,
0.504033, -0.1423847, 1.941419, 0.2470588, 0, 1, 1,
0.5101392, 0.6191071, 0.03372664, 0.254902, 0, 1, 1,
0.5106193, 0.5835832, 0.06268521, 0.2588235, 0, 1, 1,
0.515798, -0.5938041, 1.621413, 0.2666667, 0, 1, 1,
0.516889, 0.01926365, 1.697819, 0.2705882, 0, 1, 1,
0.5170525, 0.5318728, 0.5411396, 0.2784314, 0, 1, 1,
0.5186102, 0.9586122, 0.2603883, 0.282353, 0, 1, 1,
0.5213775, -0.8303178, 1.615857, 0.2901961, 0, 1, 1,
0.5220186, -0.9197896, 1.138391, 0.2941177, 0, 1, 1,
0.52311, -1.257671, 2.56467, 0.3019608, 0, 1, 1,
0.5243891, 0.7481706, 0.05589008, 0.3098039, 0, 1, 1,
0.5288752, 0.1209834, 1.204116, 0.3137255, 0, 1, 1,
0.5309805, -0.6331358, 2.989808, 0.3215686, 0, 1, 1,
0.5344925, -0.5342951, 3.685257, 0.3254902, 0, 1, 1,
0.5382739, 0.5323322, 1.100473, 0.3333333, 0, 1, 1,
0.5405063, -1.691515, 1.510234, 0.3372549, 0, 1, 1,
0.5423037, 0.3262368, -0.5713693, 0.345098, 0, 1, 1,
0.5485367, 0.4403552, 1.621855, 0.3490196, 0, 1, 1,
0.5489977, 1.224896, 0.02709898, 0.3568628, 0, 1, 1,
0.5516347, -0.1576448, 1.201656, 0.3607843, 0, 1, 1,
0.5548403, 1.252931, -0.4215948, 0.3686275, 0, 1, 1,
0.5569248, 1.031558, 1.397867, 0.372549, 0, 1, 1,
0.5573068, 0.8211325, -1.002852, 0.3803922, 0, 1, 1,
0.5582981, 0.2310182, 1.135872, 0.3843137, 0, 1, 1,
0.5605707, -1.613062, 4.135983, 0.3921569, 0, 1, 1,
0.5667976, 0.4765751, 1.757558, 0.3960784, 0, 1, 1,
0.5673255, -0.358851, 2.224367, 0.4039216, 0, 1, 1,
0.5696266, 1.733106, 0.8728733, 0.4117647, 0, 1, 1,
0.5761894, 0.9054493, 0.07000744, 0.4156863, 0, 1, 1,
0.5772225, 1.17003, 0.1451136, 0.4235294, 0, 1, 1,
0.5828705, 1.16657, 0.2375732, 0.427451, 0, 1, 1,
0.5832193, 0.6923889, 2.34227, 0.4352941, 0, 1, 1,
0.5914099, -0.6185283, 1.561489, 0.4392157, 0, 1, 1,
0.6004032, 0.3898818, 2.102511, 0.4470588, 0, 1, 1,
0.6024125, 1.013425, 0.2858151, 0.4509804, 0, 1, 1,
0.6052361, 0.5146337, 1.563221, 0.4588235, 0, 1, 1,
0.6089382, -0.2295513, 0.840782, 0.4627451, 0, 1, 1,
0.6093835, 0.4212555, -0.3304692, 0.4705882, 0, 1, 1,
0.6112302, -0.4322083, 2.166306, 0.4745098, 0, 1, 1,
0.6128551, 1.772023, 1.289638, 0.4823529, 0, 1, 1,
0.6142712, -0.3177202, 1.699623, 0.4862745, 0, 1, 1,
0.6164722, 0.3581056, 2.875939, 0.4941176, 0, 1, 1,
0.6173576, 1.396179, -0.0547402, 0.5019608, 0, 1, 1,
0.6177452, -0.633562, 2.25429, 0.5058824, 0, 1, 1,
0.6192427, -0.8012553, 1.565204, 0.5137255, 0, 1, 1,
0.6195533, 0.1458629, 0.8766323, 0.5176471, 0, 1, 1,
0.6210578, -1.858855, 1.522194, 0.5254902, 0, 1, 1,
0.6305356, -0.5498352, 2.932017, 0.5294118, 0, 1, 1,
0.6343868, -1.741314, 2.203276, 0.5372549, 0, 1, 1,
0.6383551, -0.3011602, 1.72367, 0.5411765, 0, 1, 1,
0.6390827, -0.4181543, 2.707243, 0.5490196, 0, 1, 1,
0.6396493, 0.3156013, 0.184094, 0.5529412, 0, 1, 1,
0.6444449, 0.140533, 1.303829, 0.5607843, 0, 1, 1,
0.6444566, -0.05911407, 0.06838307, 0.5647059, 0, 1, 1,
0.6500505, 1.212083, 1.124969, 0.572549, 0, 1, 1,
0.6534891, -0.2567063, 0.9870023, 0.5764706, 0, 1, 1,
0.6581182, 0.8000312, -0.2103093, 0.5843138, 0, 1, 1,
0.6703441, -0.6513419, 3.172128, 0.5882353, 0, 1, 1,
0.6727914, -0.8967127, 2.296066, 0.5960785, 0, 1, 1,
0.6728333, -0.04484037, 1.646266, 0.6039216, 0, 1, 1,
0.6779705, -1.809156, 2.706244, 0.6078432, 0, 1, 1,
0.6824816, -1.635231, 1.0716, 0.6156863, 0, 1, 1,
0.6855726, -0.3437207, 2.436729, 0.6196079, 0, 1, 1,
0.692419, 1.020701, 0.6448266, 0.627451, 0, 1, 1,
0.6926101, 0.2176029, 0.6493196, 0.6313726, 0, 1, 1,
0.6980742, 0.3943664, 0.9248853, 0.6392157, 0, 1, 1,
0.7021883, -1.109925, 1.315878, 0.6431373, 0, 1, 1,
0.7065731, -1.104414, 2.629131, 0.6509804, 0, 1, 1,
0.7122024, 0.1560078, 0.7031927, 0.654902, 0, 1, 1,
0.7143927, -0.4786545, 4.127069, 0.6627451, 0, 1, 1,
0.7221919, 1.115261, 1.754733, 0.6666667, 0, 1, 1,
0.7224686, 0.2334074, 1.959171, 0.6745098, 0, 1, 1,
0.7289826, -1.941785, 1.327449, 0.6784314, 0, 1, 1,
0.732976, -1.243547, 2.519403, 0.6862745, 0, 1, 1,
0.7362602, 0.5949138, 2.075598, 0.6901961, 0, 1, 1,
0.7365776, -0.1829155, 2.084647, 0.6980392, 0, 1, 1,
0.7405413, -0.7116547, 2.317689, 0.7058824, 0, 1, 1,
0.74957, 0.7401412, 1.250744, 0.7098039, 0, 1, 1,
0.7522704, -2.624124, 2.024487, 0.7176471, 0, 1, 1,
0.7587393, 0.9979666, -0.545335, 0.7215686, 0, 1, 1,
0.7598099, -0.1750191, 1.471971, 0.7294118, 0, 1, 1,
0.7604921, -0.5880773, 2.484173, 0.7333333, 0, 1, 1,
0.761497, 1.144803, -0.6136993, 0.7411765, 0, 1, 1,
0.7673684, -0.2692709, 3.184754, 0.7450981, 0, 1, 1,
0.77292, 0.1536597, 2.007827, 0.7529412, 0, 1, 1,
0.7731695, -0.4876015, 2.196571, 0.7568628, 0, 1, 1,
0.7735615, -1.818082, 3.68452, 0.7647059, 0, 1, 1,
0.7810588, 0.7533334, 1.805293, 0.7686275, 0, 1, 1,
0.7961025, -1.549752, 1.2978, 0.7764706, 0, 1, 1,
0.8004438, 0.0315631, 0.7119872, 0.7803922, 0, 1, 1,
0.8083043, -1.670331, 2.798952, 0.7882353, 0, 1, 1,
0.8098965, 1.123491, 0.5928845, 0.7921569, 0, 1, 1,
0.8110514, 0.01454952, 2.036937, 0.8, 0, 1, 1,
0.8126702, -1.441778, 4.207129, 0.8078431, 0, 1, 1,
0.8160104, 0.7557569, -0.580462, 0.8117647, 0, 1, 1,
0.8170972, 1.333926, -0.7613896, 0.8196079, 0, 1, 1,
0.8196356, 0.6861362, 2.693327, 0.8235294, 0, 1, 1,
0.8379187, 0.5644509, 2.872943, 0.8313726, 0, 1, 1,
0.8406436, 0.4149616, 1.331919, 0.8352941, 0, 1, 1,
0.8487946, -0.09066038, 1.733238, 0.8431373, 0, 1, 1,
0.8511663, -0.1631799, 0.0624968, 0.8470588, 0, 1, 1,
0.8524992, -0.7412704, 2.398928, 0.854902, 0, 1, 1,
0.8552904, -0.173345, 2.640544, 0.8588235, 0, 1, 1,
0.8637357, -1.372636, 2.050571, 0.8666667, 0, 1, 1,
0.8667819, 0.7915868, 2.099841, 0.8705882, 0, 1, 1,
0.8690501, 0.3287077, 1.310029, 0.8784314, 0, 1, 1,
0.8693091, 1.208337, 0.5738674, 0.8823529, 0, 1, 1,
0.8734819, 0.7027689, 0.6695227, 0.8901961, 0, 1, 1,
0.8746493, 1.193675, 1.244386, 0.8941177, 0, 1, 1,
0.8767329, -0.0856305, 1.338963, 0.9019608, 0, 1, 1,
0.8923877, 1.395728, 1.023032, 0.9098039, 0, 1, 1,
0.8950608, -0.5803103, 2.270466, 0.9137255, 0, 1, 1,
0.8991661, 0.3145337, 0.4598867, 0.9215686, 0, 1, 1,
0.9067659, 0.9328182, 0.8104858, 0.9254902, 0, 1, 1,
0.9068294, -2.475191, 3.434461, 0.9333333, 0, 1, 1,
0.9104571, -0.3107667, 1.971877, 0.9372549, 0, 1, 1,
0.919306, -1.965064, 2.348758, 0.945098, 0, 1, 1,
0.9223889, -0.3617341, 1.648616, 0.9490196, 0, 1, 1,
0.9260419, -0.4931956, 2.198968, 0.9568627, 0, 1, 1,
0.9261262, 1.631166, 2.39579, 0.9607843, 0, 1, 1,
0.9318048, 2.712699, -1.318718, 0.9686275, 0, 1, 1,
0.9329665, -1.96698, 3.03348, 0.972549, 0, 1, 1,
0.9331971, 1.646108, 1.460586, 0.9803922, 0, 1, 1,
0.9343917, -0.1631153, 1.219025, 0.9843137, 0, 1, 1,
0.9414472, -0.759809, 0.2031505, 0.9921569, 0, 1, 1,
0.9436814, -0.6865734, 3.458556, 0.9960784, 0, 1, 1,
0.9484603, -0.7557173, 3.177356, 1, 0, 0.9960784, 1,
0.9582922, -0.6434984, 2.176875, 1, 0, 0.9882353, 1,
0.9800283, 0.6887707, 0.3675784, 1, 0, 0.9843137, 1,
0.9845806, -0.6720626, 3.629012, 1, 0, 0.9764706, 1,
0.9858826, -0.8425346, 1.5856, 1, 0, 0.972549, 1,
0.9872941, -0.9085675, 2.864628, 1, 0, 0.9647059, 1,
0.9926839, 0.04033222, 0.5584683, 1, 0, 0.9607843, 1,
0.9938487, -1.117645, 1.56661, 1, 0, 0.9529412, 1,
0.9979671, 0.8762835, 1.245804, 1, 0, 0.9490196, 1,
1.008028, 0.2944271, 1.81984, 1, 0, 0.9411765, 1,
1.02265, 0.7147764, 1.110301, 1, 0, 0.9372549, 1,
1.023325, -0.3260115, 2.563265, 1, 0, 0.9294118, 1,
1.024076, -0.6843861, 2.883605, 1, 0, 0.9254902, 1,
1.026661, 2.954508, 2.883494, 1, 0, 0.9176471, 1,
1.028663, 0.4138162, -0.2405331, 1, 0, 0.9137255, 1,
1.032324, 0.08934276, 1.567086, 1, 0, 0.9058824, 1,
1.032739, -1.73572, 3.184027, 1, 0, 0.9019608, 1,
1.03819, -0.6444937, 2.131308, 1, 0, 0.8941177, 1,
1.041511, -0.899641, 3.760027, 1, 0, 0.8862745, 1,
1.043329, -1.492977, 2.235985, 1, 0, 0.8823529, 1,
1.044774, -1.077193, 3.11274, 1, 0, 0.8745098, 1,
1.051768, 1.256066, -0.5754188, 1, 0, 0.8705882, 1,
1.056081, -0.2332295, 2.82527, 1, 0, 0.8627451, 1,
1.062119, 0.1518869, 1.10515, 1, 0, 0.8588235, 1,
1.064424, -0.3847122, 0.5689465, 1, 0, 0.8509804, 1,
1.067249, 0.1661575, 0.6786413, 1, 0, 0.8470588, 1,
1.067621, 0.6194851, -0.3144118, 1, 0, 0.8392157, 1,
1.069674, 0.2661383, 0.8626969, 1, 0, 0.8352941, 1,
1.071114, -0.6247271, 1.934319, 1, 0, 0.827451, 1,
1.074805, 0.5363535, 1.891898, 1, 0, 0.8235294, 1,
1.079982, 1.600891, 1.408618, 1, 0, 0.8156863, 1,
1.080683, -0.8850231, 1.522796, 1, 0, 0.8117647, 1,
1.096612, 0.7189068, 2.451451, 1, 0, 0.8039216, 1,
1.103262, -0.1356095, 2.421591, 1, 0, 0.7960784, 1,
1.105976, 0.8197983, 0.3775335, 1, 0, 0.7921569, 1,
1.105996, -1.656371, 2.170988, 1, 0, 0.7843137, 1,
1.108698, 1.218688, -1.304625, 1, 0, 0.7803922, 1,
1.113945, -0.2154421, 2.128579, 1, 0, 0.772549, 1,
1.114527, -1.831649, 3.732433, 1, 0, 0.7686275, 1,
1.120972, 0.8307986, 0.9991515, 1, 0, 0.7607843, 1,
1.134764, 2.182102, -0.2176166, 1, 0, 0.7568628, 1,
1.145313, 0.6523135, 1.187249, 1, 0, 0.7490196, 1,
1.149204, -1.59186, 2.414855, 1, 0, 0.7450981, 1,
1.149937, 0.1429822, 1.099962, 1, 0, 0.7372549, 1,
1.155006, -0.2007951, 0.720723, 1, 0, 0.7333333, 1,
1.158813, 0.3523, 4.118911, 1, 0, 0.7254902, 1,
1.166943, -0.2140876, 0.649116, 1, 0, 0.7215686, 1,
1.174791, 0.08460557, 3.193232, 1, 0, 0.7137255, 1,
1.178157, 0.9444411, 0.4333944, 1, 0, 0.7098039, 1,
1.185863, -2.138408, 2.28233, 1, 0, 0.7019608, 1,
1.191072, -0.9217781, 2.743858, 1, 0, 0.6941177, 1,
1.195751, 0.9875665, 0.4488456, 1, 0, 0.6901961, 1,
1.200172, 1.089714, 0.2775194, 1, 0, 0.682353, 1,
1.20198, 0.6636807, -0.1221652, 1, 0, 0.6784314, 1,
1.207382, -1.032575, 3.340552, 1, 0, 0.6705883, 1,
1.210548, -1.922023, 3.174227, 1, 0, 0.6666667, 1,
1.213651, -0.5737517, 1.463009, 1, 0, 0.6588235, 1,
1.21511, -0.6496257, 0.3054828, 1, 0, 0.654902, 1,
1.219147, -0.8168104, -0.0401109, 1, 0, 0.6470588, 1,
1.219924, 0.3456629, 0.9366317, 1, 0, 0.6431373, 1,
1.223258, -0.6997182, 2.501952, 1, 0, 0.6352941, 1,
1.224137, 0.6734346, 0.8613449, 1, 0, 0.6313726, 1,
1.227555, -0.5649102, 1.855497, 1, 0, 0.6235294, 1,
1.229012, -0.2963901, 2.252448, 1, 0, 0.6196079, 1,
1.236892, -0.1367317, 1.014093, 1, 0, 0.6117647, 1,
1.246847, 0.3866655, 1.620767, 1, 0, 0.6078432, 1,
1.247092, 1.061461, 0.6867976, 1, 0, 0.6, 1,
1.263108, 0.8523083, -0.8555157, 1, 0, 0.5921569, 1,
1.267857, -0.2802512, 2.28819, 1, 0, 0.5882353, 1,
1.276723, 0.4173236, 1.166523, 1, 0, 0.5803922, 1,
1.277955, 0.1371522, 2.441836, 1, 0, 0.5764706, 1,
1.283886, -1.903411, 4.358144, 1, 0, 0.5686275, 1,
1.293115, 1.002253, 3.545659, 1, 0, 0.5647059, 1,
1.304018, 0.05298312, 1.583959, 1, 0, 0.5568628, 1,
1.305587, 1.561384, -0.1118742, 1, 0, 0.5529412, 1,
1.321197, -0.5251849, 1.433354, 1, 0, 0.5450981, 1,
1.322329, -0.4883568, 1.994007, 1, 0, 0.5411765, 1,
1.322996, 0.5587061, 0.1962435, 1, 0, 0.5333334, 1,
1.324719, -0.3087607, 0.8773291, 1, 0, 0.5294118, 1,
1.334319, -0.6158401, 3.072733, 1, 0, 0.5215687, 1,
1.336986, 0.09548473, 2.543333, 1, 0, 0.5176471, 1,
1.339417, -0.4225084, 3.516518, 1, 0, 0.509804, 1,
1.358453, 0.5968081, 2.996274, 1, 0, 0.5058824, 1,
1.359452, -0.4487113, 1.068849, 1, 0, 0.4980392, 1,
1.36383, 0.5048148, 0.5480262, 1, 0, 0.4901961, 1,
1.364095, 0.3472441, 2.601976, 1, 0, 0.4862745, 1,
1.366071, 0.07136367, 0.08047803, 1, 0, 0.4784314, 1,
1.367633, -0.831593, 1.17478, 1, 0, 0.4745098, 1,
1.370625, 1.235708, 1.904838, 1, 0, 0.4666667, 1,
1.372369, 1.815666, 1.277844, 1, 0, 0.4627451, 1,
1.374491, -1.57525, 1.930441, 1, 0, 0.454902, 1,
1.396467, 0.0449989, 2.326156, 1, 0, 0.4509804, 1,
1.397134, -0.0848555, 2.465118, 1, 0, 0.4431373, 1,
1.400581, -0.9024733, 1.558684, 1, 0, 0.4392157, 1,
1.407135, 0.6979526, -0.780603, 1, 0, 0.4313726, 1,
1.418415, -0.6666075, 0.6289884, 1, 0, 0.427451, 1,
1.426856, 0.7842073, 1.760785, 1, 0, 0.4196078, 1,
1.44216, -0.1472751, 1.592035, 1, 0, 0.4156863, 1,
1.443194, -0.8809708, -0.5258093, 1, 0, 0.4078431, 1,
1.452035, -1.026794, 3.469311, 1, 0, 0.4039216, 1,
1.453254, -0.8984184, 2.24896, 1, 0, 0.3960784, 1,
1.456698, -1.457565, 3.202248, 1, 0, 0.3882353, 1,
1.457402, -0.08825387, 1.029644, 1, 0, 0.3843137, 1,
1.465501, -0.195938, -0.04063186, 1, 0, 0.3764706, 1,
1.471679, 1.683632, 1.784225, 1, 0, 0.372549, 1,
1.48155, 0.2802337, 0.2523471, 1, 0, 0.3647059, 1,
1.493011, -1.021406, 2.845018, 1, 0, 0.3607843, 1,
1.510323, 0.2459075, 1.46363, 1, 0, 0.3529412, 1,
1.533376, -0.7761506, 3.502646, 1, 0, 0.3490196, 1,
1.536446, 1.809119, 2.406602, 1, 0, 0.3411765, 1,
1.539794, -0.03557737, 0.5652613, 1, 0, 0.3372549, 1,
1.540056, 0.2882617, -0.4222958, 1, 0, 0.3294118, 1,
1.557284, -0.7081228, 2.169718, 1, 0, 0.3254902, 1,
1.559147, -0.5498158, 1.373548, 1, 0, 0.3176471, 1,
1.561344, 0.4430034, 2.076202, 1, 0, 0.3137255, 1,
1.571277, -0.4757404, 1.871937, 1, 0, 0.3058824, 1,
1.572057, 0.1337748, 1.172428, 1, 0, 0.2980392, 1,
1.574561, -1.024921, 1.329195, 1, 0, 0.2941177, 1,
1.578348, 0.08363388, 1.870412, 1, 0, 0.2862745, 1,
1.578352, 0.07655135, 2.199697, 1, 0, 0.282353, 1,
1.5845, -0.5490441, 1.908391, 1, 0, 0.2745098, 1,
1.617016, -0.1418938, 2.228485, 1, 0, 0.2705882, 1,
1.622482, 0.9566917, 0.1032023, 1, 0, 0.2627451, 1,
1.644175, 0.8617882, 1.58215, 1, 0, 0.2588235, 1,
1.660034, -0.1841587, 2.005063, 1, 0, 0.2509804, 1,
1.664472, -0.1343839, 2.690729, 1, 0, 0.2470588, 1,
1.672604, -0.0903919, 1.955294, 1, 0, 0.2392157, 1,
1.676518, 1.488785, 0.8989802, 1, 0, 0.2352941, 1,
1.688363, 0.9038907, 0.3472066, 1, 0, 0.227451, 1,
1.689999, 1.421602, -0.2249122, 1, 0, 0.2235294, 1,
1.693359, -0.4837821, 2.969511, 1, 0, 0.2156863, 1,
1.709928, -0.1582632, 0.9798236, 1, 0, 0.2117647, 1,
1.709944, 0.1952948, 1.2618, 1, 0, 0.2039216, 1,
1.719459, 0.3615348, 0.1785516, 1, 0, 0.1960784, 1,
1.73603, -1.470952, 1.891361, 1, 0, 0.1921569, 1,
1.737385, 0.6105525, 2.845699, 1, 0, 0.1843137, 1,
1.742003, 1.686024, -0.3973321, 1, 0, 0.1803922, 1,
1.791945, 0.2095999, 1.994295, 1, 0, 0.172549, 1,
1.801603, 0.1716741, -0.5115228, 1, 0, 0.1686275, 1,
1.804708, 0.196297, 1.663244, 1, 0, 0.1607843, 1,
1.818026, -0.5550396, 2.55619, 1, 0, 0.1568628, 1,
1.832132, -0.3935423, 1.943723, 1, 0, 0.1490196, 1,
1.837542, -1.579735, 2.280786, 1, 0, 0.145098, 1,
1.858327, 0.1446985, 0.8899252, 1, 0, 0.1372549, 1,
1.897105, 0.4518857, 1.745329, 1, 0, 0.1333333, 1,
1.907013, -0.9453161, 1.902661, 1, 0, 0.1254902, 1,
1.913896, -2.539166, 2.055052, 1, 0, 0.1215686, 1,
1.939015, -0.3859688, 2.368475, 1, 0, 0.1137255, 1,
1.939358, -0.1647766, 1.454761, 1, 0, 0.1098039, 1,
1.959848, 0.6961412, 2.231144, 1, 0, 0.1019608, 1,
1.968472, 1.207269, 0.4386829, 1, 0, 0.09411765, 1,
2.014034, -1.506173, 1.420246, 1, 0, 0.09019608, 1,
2.160829, -1.439683, 3.391637, 1, 0, 0.08235294, 1,
2.164398, 0.2684139, 0.7674552, 1, 0, 0.07843138, 1,
2.283973, 0.09049588, 2.05577, 1, 0, 0.07058824, 1,
2.287039, 1.707522, 0.5066418, 1, 0, 0.06666667, 1,
2.292804, -0.8584924, 2.021714, 1, 0, 0.05882353, 1,
2.356877, 0.4737976, 0.6086888, 1, 0, 0.05490196, 1,
2.419161, 0.7817829, 0.2708676, 1, 0, 0.04705882, 1,
2.437594, -0.4857705, 1.073586, 1, 0, 0.04313726, 1,
2.530358, -0.8333781, 3.370398, 1, 0, 0.03529412, 1,
2.592732, 0.3070909, 1.827247, 1, 0, 0.03137255, 1,
2.733592, -1.054354, 0.2764214, 1, 0, 0.02352941, 1,
2.967651, 1.006383, 1.452015, 1, 0, 0.01960784, 1,
3.126647, 0.8665224, 0.6222588, 1, 0, 0.01176471, 1,
3.272428, 0.2767387, 2.318798, 1, 0, 0.007843138, 1
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
0.02044034, -4.453979, -6.577395, 0, -0.5, 0.5, 0.5,
0.02044034, -4.453979, -6.577395, 1, -0.5, 0.5, 0.5,
0.02044034, -4.453979, -6.577395, 1, 1.5, 0.5, 0.5,
0.02044034, -4.453979, -6.577395, 0, 1.5, 0.5, 0.5
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
-4.333972, -0.2128655, -6.577395, 0, -0.5, 0.5, 0.5,
-4.333972, -0.2128655, -6.577395, 1, -0.5, 0.5, 0.5,
-4.333972, -0.2128655, -6.577395, 1, 1.5, 0.5, 0.5,
-4.333972, -0.2128655, -6.577395, 0, 1.5, 0.5, 0.5
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
-4.333972, -4.453979, 0.2494183, 0, -0.5, 0.5, 0.5,
-4.333972, -4.453979, 0.2494183, 1, -0.5, 0.5, 0.5,
-4.333972, -4.453979, 0.2494183, 1, 1.5, 0.5, 0.5,
-4.333972, -4.453979, 0.2494183, 0, 1.5, 0.5, 0.5
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
-3, -3.47526, -5.001976,
3, -3.47526, -5.001976,
-3, -3.47526, -5.001976,
-3, -3.63838, -5.264546,
-2, -3.47526, -5.001976,
-2, -3.63838, -5.264546,
-1, -3.47526, -5.001976,
-1, -3.63838, -5.264546,
0, -3.47526, -5.001976,
0, -3.63838, -5.264546,
1, -3.47526, -5.001976,
1, -3.63838, -5.264546,
2, -3.47526, -5.001976,
2, -3.63838, -5.264546,
3, -3.47526, -5.001976,
3, -3.63838, -5.264546
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
-3, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
-3, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
-3, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
-3, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
-2, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
-2, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
-2, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
-2, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
-1, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
-1, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
-1, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
-1, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
0, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
0, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
0, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
0, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
1, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
1, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
1, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
1, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
2, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
2, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
2, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
2, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5,
3, -3.964619, -5.789686, 0, -0.5, 0.5, 0.5,
3, -3.964619, -5.789686, 1, -0.5, 0.5, 0.5,
3, -3.964619, -5.789686, 1, 1.5, 0.5, 0.5,
3, -3.964619, -5.789686, 0, 1.5, 0.5, 0.5
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
-3.329107, -3, -5.001976,
-3.329107, 2, -5.001976,
-3.329107, -3, -5.001976,
-3.496585, -3, -5.264546,
-3.329107, -2, -5.001976,
-3.496585, -2, -5.264546,
-3.329107, -1, -5.001976,
-3.496585, -1, -5.264546,
-3.329107, 0, -5.001976,
-3.496585, 0, -5.264546,
-3.329107, 1, -5.001976,
-3.496585, 1, -5.264546,
-3.329107, 2, -5.001976,
-3.496585, 2, -5.264546
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
-3.831539, -3, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, -3, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, -3, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, -3, -5.789686, 0, 1.5, 0.5, 0.5,
-3.831539, -2, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, -2, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, -2, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, -2, -5.789686, 0, 1.5, 0.5, 0.5,
-3.831539, -1, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, -1, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, -1, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, -1, -5.789686, 0, 1.5, 0.5, 0.5,
-3.831539, 0, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, 0, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, 0, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, 0, -5.789686, 0, 1.5, 0.5, 0.5,
-3.831539, 1, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, 1, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, 1, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, 1, -5.789686, 0, 1.5, 0.5, 0.5,
-3.831539, 2, -5.789686, 0, -0.5, 0.5, 0.5,
-3.831539, 2, -5.789686, 1, -0.5, 0.5, 0.5,
-3.831539, 2, -5.789686, 1, 1.5, 0.5, 0.5,
-3.831539, 2, -5.789686, 0, 1.5, 0.5, 0.5
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
-3.329107, -3.47526, -4,
-3.329107, -3.47526, 4,
-3.329107, -3.47526, -4,
-3.496585, -3.63838, -4,
-3.329107, -3.47526, -2,
-3.496585, -3.63838, -2,
-3.329107, -3.47526, 0,
-3.496585, -3.63838, 0,
-3.329107, -3.47526, 2,
-3.496585, -3.63838, 2,
-3.329107, -3.47526, 4,
-3.496585, -3.63838, 4
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
-3.831539, -3.964619, -4, 0, -0.5, 0.5, 0.5,
-3.831539, -3.964619, -4, 1, -0.5, 0.5, 0.5,
-3.831539, -3.964619, -4, 1, 1.5, 0.5, 0.5,
-3.831539, -3.964619, -4, 0, 1.5, 0.5, 0.5,
-3.831539, -3.964619, -2, 0, -0.5, 0.5, 0.5,
-3.831539, -3.964619, -2, 1, -0.5, 0.5, 0.5,
-3.831539, -3.964619, -2, 1, 1.5, 0.5, 0.5,
-3.831539, -3.964619, -2, 0, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 0, 0, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 0, 1, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 0, 1, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 0, 0, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 2, 0, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 2, 1, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 2, 1, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 2, 0, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 4, 0, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 4, 1, -0.5, 0.5, 0.5,
-3.831539, -3.964619, 4, 1, 1.5, 0.5, 0.5,
-3.831539, -3.964619, 4, 0, 1.5, 0.5, 0.5
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
-3.329107, -3.47526, -5.001976,
-3.329107, 3.049529, -5.001976,
-3.329107, -3.47526, 5.500813,
-3.329107, 3.049529, 5.500813,
-3.329107, -3.47526, -5.001976,
-3.329107, -3.47526, 5.500813,
-3.329107, 3.049529, -5.001976,
-3.329107, 3.049529, 5.500813,
-3.329107, -3.47526, -5.001976,
3.369988, -3.47526, -5.001976,
-3.329107, -3.47526, 5.500813,
3.369988, -3.47526, 5.500813,
-3.329107, 3.049529, -5.001976,
3.369988, 3.049529, -5.001976,
-3.329107, 3.049529, 5.500813,
3.369988, 3.049529, 5.500813,
3.369988, -3.47526, -5.001976,
3.369988, 3.049529, -5.001976,
3.369988, -3.47526, 5.500813,
3.369988, 3.049529, 5.500813,
3.369988, -3.47526, -5.001976,
3.369988, -3.47526, 5.500813,
3.369988, 3.049529, -5.001976,
3.369988, 3.049529, 5.500813
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
var radius = 7.509205;
var distance = 33.4093;
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
mvMatrix.translate( -0.02044034, 0.2128655, -0.2494183 );
mvMatrix.scale( 1.21197, 1.244347, 0.7730422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.4093);
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
2-Imidazolidinethion<-read.table("2-Imidazolidinethion.xyz", skip=1)
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
-3.231548, -0.6026396, -3.144452, 0, 0, 1, 1, 1,
-2.970355, -1.226007, -2.360301, 1, 0, 0, 1, 1,
-2.787984, 0.3363381, -2.30617, 1, 0, 0, 1, 1,
-2.694048, 2.123973, -1.942133, 1, 0, 0, 1, 1,
-2.652152, 0.06425018, -1.9297, 1, 0, 0, 1, 1,
-2.628887, 0.9944635, -3.556506, 1, 0, 0, 1, 1,
-2.60292, 0.5310377, -2.147693, 0, 0, 0, 1, 1,
-2.544509, 1.138523, -0.3188844, 0, 0, 0, 1, 1,
-2.398374, -1.315632, -1.414845, 0, 0, 0, 1, 1,
-2.393623, -0.217224, -1.808856, 0, 0, 0, 1, 1,
-2.327749, 0.06904897, -1.842551, 0, 0, 0, 1, 1,
-2.285608, 0.6071432, -3.070808, 0, 0, 0, 1, 1,
-2.259972, 1.305428, -1.788192, 0, 0, 0, 1, 1,
-2.242154, 0.8445612, -2.216353, 1, 1, 1, 1, 1,
-2.209361, 0.3482482, -0.9055804, 1, 1, 1, 1, 1,
-2.197182, -0.2160873, -2.105608, 1, 1, 1, 1, 1,
-2.192602, 0.4589605, -2.552917, 1, 1, 1, 1, 1,
-2.154023, -0.1671516, -1.240976, 1, 1, 1, 1, 1,
-2.144891, -0.3200726, -3.553271, 1, 1, 1, 1, 1,
-2.126262, -1.129319, -2.467041, 1, 1, 1, 1, 1,
-2.114207, -0.2039879, -0.1767188, 1, 1, 1, 1, 1,
-2.094475, -0.01687494, 0.2488355, 1, 1, 1, 1, 1,
-2.076672, -1.054402, -1.78787, 1, 1, 1, 1, 1,
-2.027483, -0.06146495, -0.6928071, 1, 1, 1, 1, 1,
-2.020112, -0.7608014, -1.509628, 1, 1, 1, 1, 1,
-2.000383, 0.01319845, -1.424212, 1, 1, 1, 1, 1,
-1.994823, 0.4031923, -0.9092036, 1, 1, 1, 1, 1,
-1.978781, 0.06509692, -3.397047, 1, 1, 1, 1, 1,
-1.957305, 0.1980583, -2.833926, 0, 0, 1, 1, 1,
-1.951756, 0.7443656, -2.001949, 1, 0, 0, 1, 1,
-1.925586, -2.59663, -4.028586, 1, 0, 0, 1, 1,
-1.92488, -0.8661905, 0.3181762, 1, 0, 0, 1, 1,
-1.914578, -0.8062097, -1.356158, 1, 0, 0, 1, 1,
-1.881892, 1.245778, 0.609926, 1, 0, 0, 1, 1,
-1.878206, 1.324964, -1.38365, 0, 0, 0, 1, 1,
-1.871893, -0.05969847, -1.790298, 0, 0, 0, 1, 1,
-1.867048, 0.4659424, -1.556064, 0, 0, 0, 1, 1,
-1.866598, 0.6587051, 0.09051546, 0, 0, 0, 1, 1,
-1.835407, 0.4693808, -2.219905, 0, 0, 0, 1, 1,
-1.834663, 0.3585666, -2.18249, 0, 0, 0, 1, 1,
-1.816369, -1.197665, 0.3890656, 0, 0, 0, 1, 1,
-1.804131, 0.9243258, -0.9647415, 1, 1, 1, 1, 1,
-1.80311, 1.785973, -0.6005787, 1, 1, 1, 1, 1,
-1.789839, -0.4491523, -1.44967, 1, 1, 1, 1, 1,
-1.775855, -0.3359353, -1.708874, 1, 1, 1, 1, 1,
-1.769443, 0.1174341, -0.7457828, 1, 1, 1, 1, 1,
-1.765105, -1.189445, -2.231798, 1, 1, 1, 1, 1,
-1.743404, 0.3182888, -2.817043, 1, 1, 1, 1, 1,
-1.728739, 0.03850231, -0.5231915, 1, 1, 1, 1, 1,
-1.725766, 0.7225641, -2.54803, 1, 1, 1, 1, 1,
-1.714532, 0.6941021, -1.500513, 1, 1, 1, 1, 1,
-1.702591, -0.7063801, -2.264633, 1, 1, 1, 1, 1,
-1.690762, -1.269703, -0.478641, 1, 1, 1, 1, 1,
-1.689525, -0.658133, -1.474005, 1, 1, 1, 1, 1,
-1.674521, 0.4169478, -1.220785, 1, 1, 1, 1, 1,
-1.659359, -0.7930102, -1.661283, 1, 1, 1, 1, 1,
-1.6523, -0.5813326, 0.2822395, 0, 0, 1, 1, 1,
-1.640947, -0.4336983, -1.262078, 1, 0, 0, 1, 1,
-1.633651, 0.08498063, -0.3463667, 1, 0, 0, 1, 1,
-1.599922, 2.357953, -1.321826, 1, 0, 0, 1, 1,
-1.586383, 1.27675, -0.3018326, 1, 0, 0, 1, 1,
-1.574745, -1.632977, -1.648122, 1, 0, 0, 1, 1,
-1.565431, 0.4392065, -0.8988978, 0, 0, 0, 1, 1,
-1.563981, -0.702831, -1.5064, 0, 0, 0, 1, 1,
-1.562001, 0.07841079, -1.025055, 0, 0, 0, 1, 1,
-1.559108, 0.7034478, -2.186158, 0, 0, 0, 1, 1,
-1.543764, -1.388526, -3.058391, 0, 0, 0, 1, 1,
-1.54324, -0.7996869, -2.896906, 0, 0, 0, 1, 1,
-1.538193, -0.4824362, -0.9710786, 0, 0, 0, 1, 1,
-1.537918, -1.112001, -1.727165, 1, 1, 1, 1, 1,
-1.531033, -0.6203142, -2.204229, 1, 1, 1, 1, 1,
-1.501094, 0.5627568, -1.612047, 1, 1, 1, 1, 1,
-1.497203, -1.154449, -2.929095, 1, 1, 1, 1, 1,
-1.496298, 0.5338495, -2.648867, 1, 1, 1, 1, 1,
-1.4863, 1.214433, -0.1150427, 1, 1, 1, 1, 1,
-1.476146, -0.4364594, -2.583791, 1, 1, 1, 1, 1,
-1.471604, 0.1933004, -2.506104, 1, 1, 1, 1, 1,
-1.471079, 0.4208903, -1.647702, 1, 1, 1, 1, 1,
-1.467864, -0.226615, -2.170386, 1, 1, 1, 1, 1,
-1.448011, 0.07430876, -0.1747145, 1, 1, 1, 1, 1,
-1.443721, 0.6996535, -0.9369764, 1, 1, 1, 1, 1,
-1.438197, -1.116473, -3.543535, 1, 1, 1, 1, 1,
-1.433741, -0.5989155, -2.300075, 1, 1, 1, 1, 1,
-1.422326, -0.6254622, -2.413505, 1, 1, 1, 1, 1,
-1.415523, 0.02897334, -1.762641, 0, 0, 1, 1, 1,
-1.408236, -1.033855, -0.4579765, 1, 0, 0, 1, 1,
-1.402382, -0.3437884, -1.513948, 1, 0, 0, 1, 1,
-1.400997, 0.4563479, -0.5414954, 1, 0, 0, 1, 1,
-1.399215, 0.4282834, -1.914741, 1, 0, 0, 1, 1,
-1.399195, 0.6130927, 0.1027386, 1, 0, 0, 1, 1,
-1.38193, 0.5422835, -1.945879, 0, 0, 0, 1, 1,
-1.374811, -0.7826433, -1.906549, 0, 0, 0, 1, 1,
-1.369411, -0.1795786, -0.2483138, 0, 0, 0, 1, 1,
-1.364899, 0.4753581, -1.153032, 0, 0, 0, 1, 1,
-1.354662, -0.4361206, -3.851906, 0, 0, 0, 1, 1,
-1.354562, 0.367084, -0.3321022, 0, 0, 0, 1, 1,
-1.323867, 0.111024, -1.715937, 0, 0, 0, 1, 1,
-1.321973, -0.1603236, -1.497178, 1, 1, 1, 1, 1,
-1.320344, -1.574055, -2.309081, 1, 1, 1, 1, 1,
-1.319443, -0.3067145, -1.138865, 1, 1, 1, 1, 1,
-1.301495, 0.01981631, -3.188012, 1, 1, 1, 1, 1,
-1.300828, -0.5983506, -1.386307, 1, 1, 1, 1, 1,
-1.288468, 0.64556, -1.132882, 1, 1, 1, 1, 1,
-1.287772, 0.4106333, 0.9447469, 1, 1, 1, 1, 1,
-1.286927, 0.2482059, -2.362881, 1, 1, 1, 1, 1,
-1.28687, -0.6091284, -2.904849, 1, 1, 1, 1, 1,
-1.284751, -2.275221, -0.733282, 1, 1, 1, 1, 1,
-1.272848, -0.09470452, -0.1976271, 1, 1, 1, 1, 1,
-1.271486, 0.9832667, 0.03076554, 1, 1, 1, 1, 1,
-1.269067, 0.3323164, -1.05854, 1, 1, 1, 1, 1,
-1.25873, -2.130332, -3.432857, 1, 1, 1, 1, 1,
-1.246432, 2.04459, -0.8648056, 1, 1, 1, 1, 1,
-1.244158, 1.019435, -0.5465575, 0, 0, 1, 1, 1,
-1.242051, 0.2467057, 0.3074935, 1, 0, 0, 1, 1,
-1.236339, 1.051182, -0.3014152, 1, 0, 0, 1, 1,
-1.213572, 0.337743, -1.917609, 1, 0, 0, 1, 1,
-1.206823, -1.428157, -3.583991, 1, 0, 0, 1, 1,
-1.20389, -0.7135435, -1.04913, 1, 0, 0, 1, 1,
-1.203696, 0.0117976, -0.8192241, 0, 0, 0, 1, 1,
-1.202783, -0.1549775, -1.618164, 0, 0, 0, 1, 1,
-1.201759, 0.09991255, -1.03502, 0, 0, 0, 1, 1,
-1.182004, -1.552213, -1.799332, 0, 0, 0, 1, 1,
-1.179828, -1.571148, -2.437101, 0, 0, 0, 1, 1,
-1.173166, -0.0471832, -0.7356548, 0, 0, 0, 1, 1,
-1.169608, 0.01793254, -0.554853, 0, 0, 0, 1, 1,
-1.165225, 1.604802, -1.310923, 1, 1, 1, 1, 1,
-1.163964, 0.8941852, -0.814788, 1, 1, 1, 1, 1,
-1.159967, -0.3885074, -2.519104, 1, 1, 1, 1, 1,
-1.152619, -0.6947066, 0.322084, 1, 1, 1, 1, 1,
-1.152112, 1.228956, -2.61364, 1, 1, 1, 1, 1,
-1.150996, 2.583579, 0.3044144, 1, 1, 1, 1, 1,
-1.142583, 0.2779742, -1.974893, 1, 1, 1, 1, 1,
-1.1422, 0.03818588, 0.3583553, 1, 1, 1, 1, 1,
-1.141463, -1.144981, -2.82987, 1, 1, 1, 1, 1,
-1.136381, 0.05431791, -0.7252063, 1, 1, 1, 1, 1,
-1.132941, -0.6736462, -3.739671, 1, 1, 1, 1, 1,
-1.130169, -1.974745, -2.839244, 1, 1, 1, 1, 1,
-1.123551, 0.1157358, -1.992266, 1, 1, 1, 1, 1,
-1.121121, 1.503126, 0.3653562, 1, 1, 1, 1, 1,
-1.117716, -0.477352, -3.963504, 1, 1, 1, 1, 1,
-1.114309, 1.441548, -0.07872366, 0, 0, 1, 1, 1,
-1.113959, -0.8918611, -0.5322083, 1, 0, 0, 1, 1,
-1.112531, 0.7110069, -0.7101506, 1, 0, 0, 1, 1,
-1.109602, -0.7006301, -2.137872, 1, 0, 0, 1, 1,
-1.109468, 1.256069, 0.9483184, 1, 0, 0, 1, 1,
-1.108406, -0.5249568, -0.2591034, 1, 0, 0, 1, 1,
-1.105903, -1.834567, -1.968395, 0, 0, 0, 1, 1,
-1.10148, -0.6529114, -0.4674103, 0, 0, 0, 1, 1,
-1.099516, 1.904978, 1.382728, 0, 0, 0, 1, 1,
-1.090255, -0.9284829, -1.826047, 0, 0, 0, 1, 1,
-1.076274, -0.3081305, -1.449654, 0, 0, 0, 1, 1,
-1.075924, -2.318692, -0.6508449, 0, 0, 0, 1, 1,
-1.075156, -0.1680985, -1.713799, 0, 0, 0, 1, 1,
-1.074331, 0.2241699, -0.147689, 1, 1, 1, 1, 1,
-1.069533, -0.8567131, -1.511798, 1, 1, 1, 1, 1,
-1.063552, -0.6312079, -2.89027, 1, 1, 1, 1, 1,
-1.061787, 0.3529672, -2.628658, 1, 1, 1, 1, 1,
-1.061733, 0.3983703, -1.696347, 1, 1, 1, 1, 1,
-1.0604, 0.6708012, -1.078385, 1, 1, 1, 1, 1,
-1.056854, 2.262279, 0.5786073, 1, 1, 1, 1, 1,
-1.054895, 1.800723, 0.9336363, 1, 1, 1, 1, 1,
-1.051369, -0.354746, -3.847276, 1, 1, 1, 1, 1,
-1.042216, 0.4576299, -2.377332, 1, 1, 1, 1, 1,
-1.039542, 0.1333298, -1.178277, 1, 1, 1, 1, 1,
-1.03758, -1.622166, -2.730194, 1, 1, 1, 1, 1,
-1.03437, 0.6419851, -1.235958, 1, 1, 1, 1, 1,
-1.02859, -2.382135, -2.303422, 1, 1, 1, 1, 1,
-1.01637, 0.02606647, -2.19699, 1, 1, 1, 1, 1,
-1.015643, 0.577989, -0.8820594, 0, 0, 1, 1, 1,
-1.009884, 0.09564928, -0.6872745, 1, 0, 0, 1, 1,
-1.009238, 1.108832, -1.903409, 1, 0, 0, 1, 1,
-1.003414, -0.08698043, -1.020525, 1, 0, 0, 1, 1,
-1.002001, -2.346738, -2.283134, 1, 0, 0, 1, 1,
-0.9937009, -0.3812703, -2.187987, 1, 0, 0, 1, 1,
-0.9935908, 2.036392, -0.4785461, 0, 0, 0, 1, 1,
-0.9795794, -0.05566135, -0.2663483, 0, 0, 0, 1, 1,
-0.9774847, 1.467184, 0.9073901, 0, 0, 0, 1, 1,
-0.9761745, -0.3596368, -1.739169, 0, 0, 0, 1, 1,
-0.9650323, -0.9503179, -1.993988, 0, 0, 0, 1, 1,
-0.9646389, -0.6738725, -3.608353, 0, 0, 0, 1, 1,
-0.9625857, 1.953415, -2.240364, 0, 0, 0, 1, 1,
-0.9612663, 1.301353, -1.54943, 1, 1, 1, 1, 1,
-0.9584148, -0.9658905, -4.257033, 1, 1, 1, 1, 1,
-0.9576162, 0.03664428, -1.911523, 1, 1, 1, 1, 1,
-0.9558945, -0.3660828, -1.894855, 1, 1, 1, 1, 1,
-0.9513545, 0.4911271, -1.55942, 1, 1, 1, 1, 1,
-0.9497781, -0.6197008, -0.9008473, 1, 1, 1, 1, 1,
-0.9476677, 1.188134, -2.40096, 1, 1, 1, 1, 1,
-0.944878, -0.6594704, -1.833093, 1, 1, 1, 1, 1,
-0.9392482, 1.206901, 1.267018, 1, 1, 1, 1, 1,
-0.9349321, 0.8587874, -1.405827, 1, 1, 1, 1, 1,
-0.9295638, -0.03920546, -2.945359, 1, 1, 1, 1, 1,
-0.9284359, -1.106714, -2.781134, 1, 1, 1, 1, 1,
-0.9268059, 0.3191563, -1.29003, 1, 1, 1, 1, 1,
-0.9250699, 0.1006612, -0.04206115, 1, 1, 1, 1, 1,
-0.9233308, -0.6135461, -2.463336, 1, 1, 1, 1, 1,
-0.9229549, 1.696158, -1.063349, 0, 0, 1, 1, 1,
-0.9204679, 1.725373, -0.8777844, 1, 0, 0, 1, 1,
-0.9192332, -1.137482, -3.8887, 1, 0, 0, 1, 1,
-0.9155906, -0.7828434, 0.3855129, 1, 0, 0, 1, 1,
-0.9057978, 2.460528, 0.714142, 1, 0, 0, 1, 1,
-0.900986, -0.1190393, -1.032723, 1, 0, 0, 1, 1,
-0.900236, -0.1327807, -1.506039, 0, 0, 0, 1, 1,
-0.8989172, -1.878973, -3.722374, 0, 0, 0, 1, 1,
-0.8940821, -1.68829, -2.031389, 0, 0, 0, 1, 1,
-0.8796926, 0.3400679, -0.1760538, 0, 0, 0, 1, 1,
-0.8761142, -0.8213342, -3.460273, 0, 0, 0, 1, 1,
-0.8750474, -0.8494735, -3.0636, 0, 0, 0, 1, 1,
-0.8735964, -0.4365344, -0.3495898, 0, 0, 0, 1, 1,
-0.8721126, -0.2713611, 0.03118657, 1, 1, 1, 1, 1,
-0.8716194, 1.35451, 0.3992734, 1, 1, 1, 1, 1,
-0.8689481, 0.09456293, -2.046846, 1, 1, 1, 1, 1,
-0.8662968, -0.6343111, -1.364934, 1, 1, 1, 1, 1,
-0.8597325, -0.7890618, -1.899548, 1, 1, 1, 1, 1,
-0.8546826, -1.77946, -2.39896, 1, 1, 1, 1, 1,
-0.8538864, -0.4139224, -3.878402, 1, 1, 1, 1, 1,
-0.8532216, -0.8417027, -1.928585, 1, 1, 1, 1, 1,
-0.8504145, -1.327539, -3.527569, 1, 1, 1, 1, 1,
-0.8422732, -0.04180966, -2.375321, 1, 1, 1, 1, 1,
-0.8370044, 0.351277, -1.447865, 1, 1, 1, 1, 1,
-0.82915, -0.04124325, -1.555711, 1, 1, 1, 1, 1,
-0.8281555, -0.364938, -1.902711, 1, 1, 1, 1, 1,
-0.8280482, -0.9599774, -4.250907, 1, 1, 1, 1, 1,
-0.8268389, 0.1846048, -1.838484, 1, 1, 1, 1, 1,
-0.8203878, 0.1641948, -1.525742, 0, 0, 1, 1, 1,
-0.8090619, 0.4458273, -1.432617, 1, 0, 0, 1, 1,
-0.8075774, -0.6242207, -2.438418, 1, 0, 0, 1, 1,
-0.8024047, -2.392937, -2.626057, 1, 0, 0, 1, 1,
-0.8019943, -0.4624406, -2.84506, 1, 0, 0, 1, 1,
-0.7961638, 2.230053, 0.9520438, 1, 0, 0, 1, 1,
-0.7949818, 1.549562, -0.4971678, 0, 0, 0, 1, 1,
-0.7946913, -0.01280412, -1.442821, 0, 0, 0, 1, 1,
-0.7940919, -0.4846943, -2.25032, 0, 0, 0, 1, 1,
-0.7923681, -2.912771, -1.418285, 0, 0, 0, 1, 1,
-0.7922421, -1.469551, -1.399246, 0, 0, 0, 1, 1,
-0.788087, 0.3982556, -0.7375494, 0, 0, 0, 1, 1,
-0.7876437, -0.2355448, -1.295245, 0, 0, 0, 1, 1,
-0.7830687, -1.208143, -3.128429, 1, 1, 1, 1, 1,
-0.7671742, -0.4368519, -1.645245, 1, 1, 1, 1, 1,
-0.7639977, -0.006885327, -3.537798, 1, 1, 1, 1, 1,
-0.7546458, 0.1044814, -1.466844, 1, 1, 1, 1, 1,
-0.7538744, 0.7875633, -1.387034, 1, 1, 1, 1, 1,
-0.7472548, 0.7444548, -1.478024, 1, 1, 1, 1, 1,
-0.7467726, -1.619343, -1.750162, 1, 1, 1, 1, 1,
-0.7463696, -1.062975, -4.849023, 1, 1, 1, 1, 1,
-0.7445413, -0.2385747, -1.093563, 1, 1, 1, 1, 1,
-0.7405607, 0.1305035, -1.790638, 1, 1, 1, 1, 1,
-0.7356853, -0.08391627, -1.13593, 1, 1, 1, 1, 1,
-0.7279715, -0.3275344, -3.142883, 1, 1, 1, 1, 1,
-0.7199463, -1.579416, -3.91503, 1, 1, 1, 1, 1,
-0.7110071, 0.7682661, -0.3008881, 1, 1, 1, 1, 1,
-0.7099206, -0.4823707, -3.063936, 1, 1, 1, 1, 1,
-0.7084864, 0.849876, -1.627603, 0, 0, 1, 1, 1,
-0.7072944, -1.062254, -4.739837, 1, 0, 0, 1, 1,
-0.7011049, 0.7335792, -2.135795, 1, 0, 0, 1, 1,
-0.7010623, 0.7259851, -1.219134, 1, 0, 0, 1, 1,
-0.6979985, 0.3958224, -0.2904699, 1, 0, 0, 1, 1,
-0.6964289, 0.232888, -0.9889327, 1, 0, 0, 1, 1,
-0.6946, -0.9786579, -0.7771147, 0, 0, 0, 1, 1,
-0.6945267, -0.02770725, 0.8528241, 0, 0, 0, 1, 1,
-0.6902058, 0.6420949, -1.413458, 0, 0, 0, 1, 1,
-0.6827967, 0.9771008, -2.340325, 0, 0, 0, 1, 1,
-0.6818421, 1.376262, -1.292015, 0, 0, 0, 1, 1,
-0.6814413, -1.006253, -1.922955, 0, 0, 0, 1, 1,
-0.6803234, -1.246276, -2.469944, 0, 0, 0, 1, 1,
-0.6783315, -0.8114722, -2.877655, 1, 1, 1, 1, 1,
-0.6770672, 1.752815, 0.5713338, 1, 1, 1, 1, 1,
-0.6767818, 2.48554, -1.471413, 1, 1, 1, 1, 1,
-0.6731685, -0.2031996, -0.9679337, 1, 1, 1, 1, 1,
-0.6696773, -0.8795358, -3.042273, 1, 1, 1, 1, 1,
-0.6684065, -2.384843, -2.390425, 1, 1, 1, 1, 1,
-0.6622812, 0.4233224, -0.9731652, 1, 1, 1, 1, 1,
-0.6579339, 0.04581208, 0.71797, 1, 1, 1, 1, 1,
-0.6564283, -0.8849889, -4.013947, 1, 1, 1, 1, 1,
-0.6549466, 1.527997, 0.3251005, 1, 1, 1, 1, 1,
-0.6531257, 0.3581037, -1.350793, 1, 1, 1, 1, 1,
-0.6474183, 0.5573483, -0.02427032, 1, 1, 1, 1, 1,
-0.628004, -1.917817, -3.94323, 1, 1, 1, 1, 1,
-0.6231341, 0.2588246, 0.1041984, 1, 1, 1, 1, 1,
-0.6220661, -0.7730395, -0.9213989, 1, 1, 1, 1, 1,
-0.6198689, -1.073066, -1.047549, 0, 0, 1, 1, 1,
-0.6134521, 0.4602434, -1.030153, 1, 0, 0, 1, 1,
-0.6094878, 0.2225194, -1.532333, 1, 0, 0, 1, 1,
-0.6043289, -0.9670408, -3.778219, 1, 0, 0, 1, 1,
-0.6040821, -0.5252976, -2.278953, 1, 0, 0, 1, 1,
-0.6006335, 0.9243959, -2.242, 1, 0, 0, 1, 1,
-0.5988725, 1.839314, -0.5502746, 0, 0, 0, 1, 1,
-0.5885023, 0.8114257, -0.539592, 0, 0, 0, 1, 1,
-0.586347, 0.8950161, -0.860585, 0, 0, 0, 1, 1,
-0.5830517, 1.537832, -1.62333, 0, 0, 0, 1, 1,
-0.582336, -0.8982995, -2.149031, 0, 0, 0, 1, 1,
-0.5814657, 0.5842731, -1.301898, 0, 0, 0, 1, 1,
-0.5796157, -2.482243, -2.90833, 0, 0, 0, 1, 1,
-0.5795155, 0.1096496, -0.3383198, 1, 1, 1, 1, 1,
-0.5787158, -0.1716208, -2.98834, 1, 1, 1, 1, 1,
-0.5786145, -0.2185747, -2.941336, 1, 1, 1, 1, 1,
-0.576472, 0.8650857, 0.3278472, 1, 1, 1, 1, 1,
-0.5761674, -1.72762, -3.127624, 1, 1, 1, 1, 1,
-0.5760936, 0.6487955, 0.6407993, 1, 1, 1, 1, 1,
-0.5754629, -0.9618521, -2.064723, 1, 1, 1, 1, 1,
-0.5716217, 1.856135, 0.3609749, 1, 1, 1, 1, 1,
-0.5712876, -1.868768, -3.813699, 1, 1, 1, 1, 1,
-0.570719, -0.2727762, -1.669543, 1, 1, 1, 1, 1,
-0.5695654, -1.409201, -3.594049, 1, 1, 1, 1, 1,
-0.568767, -2.033725, -2.461771, 1, 1, 1, 1, 1,
-0.5645461, -0.06814621, -1.890453, 1, 1, 1, 1, 1,
-0.5570469, -0.04409873, -2.041424, 1, 1, 1, 1, 1,
-0.5563377, 0.04371694, -0.4104084, 1, 1, 1, 1, 1,
-0.5540809, -0.6966318, -3.449563, 0, 0, 1, 1, 1,
-0.5530969, -0.651053, -1.905179, 1, 0, 0, 1, 1,
-0.5518584, -0.5718045, -1.198029, 1, 0, 0, 1, 1,
-0.5498489, 1.508095, -1.337489, 1, 0, 0, 1, 1,
-0.54847, 1.032841, 0.3851015, 1, 0, 0, 1, 1,
-0.5475239, -0.6053649, -1.079115, 1, 0, 0, 1, 1,
-0.5458863, -0.8376639, -2.134875, 0, 0, 0, 1, 1,
-0.5410368, -2.437437, -2.369919, 0, 0, 0, 1, 1,
-0.5402423, 1.588037, -1.192355, 0, 0, 0, 1, 1,
-0.5392427, 1.579617, -0.01519541, 0, 0, 0, 1, 1,
-0.5363968, -0.5099836, -2.453127, 0, 0, 0, 1, 1,
-0.535189, -0.03058006, -1.646936, 0, 0, 0, 1, 1,
-0.5335932, 0.01541099, -0.526419, 0, 0, 0, 1, 1,
-0.5323691, -0.385925, -0.3725797, 1, 1, 1, 1, 1,
-0.525947, -1.167792, -1.706211, 1, 1, 1, 1, 1,
-0.5224683, -0.2391236, -2.402421, 1, 1, 1, 1, 1,
-0.5220393, -0.2428663, -0.8424464, 1, 1, 1, 1, 1,
-0.5180208, 0.1182143, -2.385345, 1, 1, 1, 1, 1,
-0.5168804, -1.629608, -3.027046, 1, 1, 1, 1, 1,
-0.5142073, -1.547782, -2.211827, 1, 1, 1, 1, 1,
-0.5066188, 0.7540144, -1.916519, 1, 1, 1, 1, 1,
-0.5052257, -1.790657, -1.544485, 1, 1, 1, 1, 1,
-0.5009875, 1.144912, 0.618799, 1, 1, 1, 1, 1,
-0.49922, 0.2023576, -2.311354, 1, 1, 1, 1, 1,
-0.497909, 1.488162, 0.1856287, 1, 1, 1, 1, 1,
-0.4965853, -0.2987728, -1.9052, 1, 1, 1, 1, 1,
-0.4899233, 0.7526619, -0.987929, 1, 1, 1, 1, 1,
-0.4867287, -0.7976651, -2.5323, 1, 1, 1, 1, 1,
-0.4804524, 0.005443723, -0.4088987, 0, 0, 1, 1, 1,
-0.4736012, -0.9733784, -1.528812, 1, 0, 0, 1, 1,
-0.4706635, -0.753242, -1.387621, 1, 0, 0, 1, 1,
-0.4672264, 0.593914, -0.2475026, 1, 0, 0, 1, 1,
-0.4665242, -0.8404021, -2.726382, 1, 0, 0, 1, 1,
-0.4657084, 0.4692802, -0.8940846, 1, 0, 0, 1, 1,
-0.4655337, -0.5840572, -1.323717, 0, 0, 0, 1, 1,
-0.4624551, 0.0726457, -1.525703, 0, 0, 0, 1, 1,
-0.4608884, -1.61223, -2.933707, 0, 0, 0, 1, 1,
-0.4603929, -1.600103, -2.540904, 0, 0, 0, 1, 1,
-0.4599939, -0.4709592, -1.870272, 0, 0, 0, 1, 1,
-0.4575312, 2.444437, 0.01698113, 0, 0, 0, 1, 1,
-0.4541823, 1.200619, -1.061713, 0, 0, 0, 1, 1,
-0.4536491, 0.130744, -0.2867668, 1, 1, 1, 1, 1,
-0.4511224, 1.204292, -0.6559489, 1, 1, 1, 1, 1,
-0.450025, 2.328602, 0.08359776, 1, 1, 1, 1, 1,
-0.4496861, 0.4907238, -0.4490572, 1, 1, 1, 1, 1,
-0.4423949, 1.01427, -2.037659, 1, 1, 1, 1, 1,
-0.4410488, 1.780393, 0.6089133, 1, 1, 1, 1, 1,
-0.4410038, -2.251027, -3.058509, 1, 1, 1, 1, 1,
-0.4405334, 0.7882581, -0.9803436, 1, 1, 1, 1, 1,
-0.4356247, -0.4526373, -3.481355, 1, 1, 1, 1, 1,
-0.4346274, -1.042309, -2.593502, 1, 1, 1, 1, 1,
-0.4318427, -0.1191297, -1.047136, 1, 1, 1, 1, 1,
-0.4302879, 1.866348, 2.075266, 1, 1, 1, 1, 1,
-0.4301066, 0.6442135, 1.567304, 1, 1, 1, 1, 1,
-0.4297359, -1.46443, -2.383596, 1, 1, 1, 1, 1,
-0.4287749, 0.4493696, -0.5695732, 1, 1, 1, 1, 1,
-0.4276027, 1.303815, -1.64677, 0, 0, 1, 1, 1,
-0.4252408, -1.988, -1.432318, 1, 0, 0, 1, 1,
-0.4231997, 0.7570968, -1.138637, 1, 0, 0, 1, 1,
-0.415964, 0.3019813, -1.098739, 1, 0, 0, 1, 1,
-0.4149624, -0.5402554, -1.681292, 1, 0, 0, 1, 1,
-0.4115407, 0.5812759, -0.68687, 1, 0, 0, 1, 1,
-0.4071683, -2.161752, -4.546093, 0, 0, 0, 1, 1,
-0.4064865, -0.8817992, -3.728733, 0, 0, 0, 1, 1,
-0.404231, -1.543662, -3.487473, 0, 0, 0, 1, 1,
-0.4026068, -1.476172, -1.724015, 0, 0, 0, 1, 1,
-0.3987554, 0.8042568, -1.360289, 0, 0, 0, 1, 1,
-0.3965114, 0.3963339, -0.3515191, 0, 0, 0, 1, 1,
-0.3951679, -0.6935337, -2.154284, 0, 0, 0, 1, 1,
-0.3932959, 1.493351, -0.3370241, 1, 1, 1, 1, 1,
-0.386761, -0.8029238, -3.437306, 1, 1, 1, 1, 1,
-0.3860251, -0.6442125, 0.1100041, 1, 1, 1, 1, 1,
-0.3854766, -0.1056203, -1.81418, 1, 1, 1, 1, 1,
-0.3820519, -0.8480729, -2.09144, 1, 1, 1, 1, 1,
-0.3794546, 0.0501542, -0.6167254, 1, 1, 1, 1, 1,
-0.3768602, -1.709368, -4.229887, 1, 1, 1, 1, 1,
-0.3717924, -1.080332, -1.139563, 1, 1, 1, 1, 1,
-0.3703536, 0.9970149, -0.7287081, 1, 1, 1, 1, 1,
-0.3699489, -0.732296, -2.364937, 1, 1, 1, 1, 1,
-0.3683031, -0.2143739, -0.8836226, 1, 1, 1, 1, 1,
-0.3672867, 0.03745052, -2.156407, 1, 1, 1, 1, 1,
-0.3651597, -0.01447174, -2.216023, 1, 1, 1, 1, 1,
-0.3602777, 0.7707433, -0.1995641, 1, 1, 1, 1, 1,
-0.3595387, -0.1757713, -0.09055587, 1, 1, 1, 1, 1,
-0.357729, -0.4993181, -2.007921, 0, 0, 1, 1, 1,
-0.3572903, 0.2032333, -0.644696, 1, 0, 0, 1, 1,
-0.3543231, 0.2131082, 0.8404105, 1, 0, 0, 1, 1,
-0.3514255, 1.04315, 0.2740501, 1, 0, 0, 1, 1,
-0.3429432, -0.5465283, -0.425889, 1, 0, 0, 1, 1,
-0.3401209, -0.8843546, -1.88905, 1, 0, 0, 1, 1,
-0.3378578, 1.255277, -0.5819266, 0, 0, 0, 1, 1,
-0.3337841, 0.8903, 0.4551346, 0, 0, 0, 1, 1,
-0.3290085, -2.208946, -3.034526, 0, 0, 0, 1, 1,
-0.326954, 0.7273651, 1.503636, 0, 0, 0, 1, 1,
-0.3242371, -0.4419201, -3.45156, 0, 0, 0, 1, 1,
-0.3211505, -0.6737967, -1.647813, 0, 0, 0, 1, 1,
-0.3204553, -1.004153, -2.818346, 0, 0, 0, 1, 1,
-0.3199736, 0.9668586, 0.9651836, 1, 1, 1, 1, 1,
-0.3178617, 0.4070116, 1.184204, 1, 1, 1, 1, 1,
-0.3094054, 0.37712, -2.554434, 1, 1, 1, 1, 1,
-0.3022771, -0.8392129, 0.2854225, 1, 1, 1, 1, 1,
-0.2991683, 0.08299354, -1.173985, 1, 1, 1, 1, 1,
-0.2966371, 0.4933855, -2.500667, 1, 1, 1, 1, 1,
-0.2921272, 0.2116711, 0.0952287, 1, 1, 1, 1, 1,
-0.290922, -0.1416716, -3.382898, 1, 1, 1, 1, 1,
-0.2909148, 0.1606029, -1.733651, 1, 1, 1, 1, 1,
-0.2906622, -1.474225, -1.429864, 1, 1, 1, 1, 1,
-0.2891279, 0.7225942, -1.946689, 1, 1, 1, 1, 1,
-0.2874088, 1.669825, -0.09390684, 1, 1, 1, 1, 1,
-0.2853156, 1.387281, -0.207078, 1, 1, 1, 1, 1,
-0.284371, 0.09743732, -2.271257, 1, 1, 1, 1, 1,
-0.2842283, 0.6209253, -2.484321, 1, 1, 1, 1, 1,
-0.2837057, -0.8096783, -3.956293, 0, 0, 1, 1, 1,
-0.2819706, 0.4702004, -1.563887, 1, 0, 0, 1, 1,
-0.2796645, 0.6027346, -0.8881015, 1, 0, 0, 1, 1,
-0.2793812, 0.4601444, -0.05847413, 1, 0, 0, 1, 1,
-0.2769506, -0.4562064, -2.387048, 1, 0, 0, 1, 1,
-0.2733408, -0.3763346, -2.744678, 1, 0, 0, 1, 1,
-0.2701513, -0.5009041, -4.22721, 0, 0, 0, 1, 1,
-0.2669414, 0.8288799, -0.1084322, 0, 0, 0, 1, 1,
-0.2667346, -0.2217537, -1.942347, 0, 0, 0, 1, 1,
-0.2658585, -1.038841, -4.090075, 0, 0, 0, 1, 1,
-0.2644707, -0.1384815, -1.87436, 0, 0, 0, 1, 1,
-0.264284, -1.36969, -1.652154, 0, 0, 0, 1, 1,
-0.2620466, 1.476978, -0.5943273, 0, 0, 0, 1, 1,
-0.2603751, 0.8711663, 0.1491999, 1, 1, 1, 1, 1,
-0.2601697, -1.462673, -2.304715, 1, 1, 1, 1, 1,
-0.2589249, 1.229493, -1.335566, 1, 1, 1, 1, 1,
-0.2537283, -1.163701, -3.87936, 1, 1, 1, 1, 1,
-0.2526289, -0.3620909, -1.309648, 1, 1, 1, 1, 1,
-0.250815, -0.33905, -1.431744, 1, 1, 1, 1, 1,
-0.240114, 1.109397, -1.146879, 1, 1, 1, 1, 1,
-0.2367164, 0.2768985, -1.905805, 1, 1, 1, 1, 1,
-0.2341119, -0.3651081, -3.615854, 1, 1, 1, 1, 1,
-0.2325238, 0.624983, -0.4525574, 1, 1, 1, 1, 1,
-0.2300539, -1.684635, -3.371498, 1, 1, 1, 1, 1,
-0.2272249, -1.486428, -2.158998, 1, 1, 1, 1, 1,
-0.2227162, 0.09968361, -1.729578, 1, 1, 1, 1, 1,
-0.2206243, -0.1530654, -0.0003893412, 1, 1, 1, 1, 1,
-0.2171018, -0.1223598, -1.512257, 1, 1, 1, 1, 1,
-0.2146655, -0.2522374, -3.626301, 0, 0, 1, 1, 1,
-0.2071158, 1.615891, -0.3077989, 1, 0, 0, 1, 1,
-0.2041037, 0.2076953, -1.120703, 1, 0, 0, 1, 1,
-0.2022001, 1.151925, -0.2951992, 1, 0, 0, 1, 1,
-0.2015754, 1.622132, 0.6108471, 1, 0, 0, 1, 1,
-0.1979659, 0.3066597, -0.3240629, 1, 0, 0, 1, 1,
-0.1973147, 1.55794, -0.8479903, 0, 0, 0, 1, 1,
-0.1955181, -0.7926072, -2.742915, 0, 0, 0, 1, 1,
-0.1926216, -2.268829, -3.22822, 0, 0, 0, 1, 1,
-0.1916134, -1.01045, -3.22775, 0, 0, 0, 1, 1,
-0.1909492, -1.515401, -2.393031, 0, 0, 0, 1, 1,
-0.1828675, 0.05844043, -1.105023, 0, 0, 0, 1, 1,
-0.1766838, 0.6612256, 0.8423211, 0, 0, 0, 1, 1,
-0.1757141, -0.580834, -3.044136, 1, 1, 1, 1, 1,
-0.1736433, -0.09350799, -2.137545, 1, 1, 1, 1, 1,
-0.172767, 0.4566762, 0.7611355, 1, 1, 1, 1, 1,
-0.1699548, -0.7232643, -3.49606, 1, 1, 1, 1, 1,
-0.1680018, -1.998072, -3.97434, 1, 1, 1, 1, 1,
-0.1635446, 0.1211897, -0.7483998, 1, 1, 1, 1, 1,
-0.1628619, -0.6510618, -3.636024, 1, 1, 1, 1, 1,
-0.1614197, -1.470245, -4.474089, 1, 1, 1, 1, 1,
-0.1613977, 1.429159, 1.644139, 1, 1, 1, 1, 1,
-0.1603847, 1.800923, -1.169877, 1, 1, 1, 1, 1,
-0.1578704, 1.3875, -0.651177, 1, 1, 1, 1, 1,
-0.155775, 0.2897129, 0.08349205, 1, 1, 1, 1, 1,
-0.1542459, 0.1278508, -1.091633, 1, 1, 1, 1, 1,
-0.1512769, -1.306702, -4.768283, 1, 1, 1, 1, 1,
-0.1374009, 0.5928099, -0.6921976, 1, 1, 1, 1, 1,
-0.1320665, -0.5072312, -2.275134, 0, 0, 1, 1, 1,
-0.1297129, -0.3829686, -2.141819, 1, 0, 0, 1, 1,
-0.128448, -1.044359, -2.306363, 1, 0, 0, 1, 1,
-0.1257865, -0.3452605, -1.695098, 1, 0, 0, 1, 1,
-0.121861, -0.5173117, -2.393823, 1, 0, 0, 1, 1,
-0.1216019, 0.6132939, -1.687694, 1, 0, 0, 1, 1,
-0.1115751, 0.7192539, 0.1055939, 0, 0, 0, 1, 1,
-0.1088935, 0.3040329, -1.395362, 0, 0, 0, 1, 1,
-0.1047512, -0.1023939, -1.011256, 0, 0, 0, 1, 1,
-0.09488697, 1.513314, 0.2952983, 0, 0, 0, 1, 1,
-0.090413, 0.1444205, -1.432554, 0, 0, 0, 1, 1,
-0.08810209, 0.06353907, 0.4363458, 0, 0, 0, 1, 1,
-0.08805344, 0.3404645, 0.1382299, 0, 0, 0, 1, 1,
-0.08786129, -0.5508797, -4.655581, 1, 1, 1, 1, 1,
-0.08211199, -3.261071, -2.751957, 1, 1, 1, 1, 1,
-0.07752685, -0.549266, -2.727111, 1, 1, 1, 1, 1,
-0.07432437, -1.163327, -4.494538, 1, 1, 1, 1, 1,
-0.06832159, -0.3713106, -3.88473, 1, 1, 1, 1, 1,
-0.06244529, -0.275502, -2.031422, 1, 1, 1, 1, 1,
-0.06144244, -0.9444487, -2.943842, 1, 1, 1, 1, 1,
-0.06034249, -0.9057068, -3.546344, 1, 1, 1, 1, 1,
-0.05202596, 0.3623868, -0.4572996, 1, 1, 1, 1, 1,
-0.04979349, 0.3241551, 0.8434307, 1, 1, 1, 1, 1,
-0.04908742, 1.280419, -1.428828, 1, 1, 1, 1, 1,
-0.04701632, 1.521237, 0.5845702, 1, 1, 1, 1, 1,
-0.04363401, -1.536121, -2.953932, 1, 1, 1, 1, 1,
-0.04055623, 2.252451, 0.03244174, 1, 1, 1, 1, 1,
-0.03549309, 0.4590144, -0.08970082, 1, 1, 1, 1, 1,
-0.03404409, -0.1445471, -1.143455, 0, 0, 1, 1, 1,
-0.03264436, -0.2889034, -1.913672, 1, 0, 0, 1, 1,
-0.03166686, 1.131869, 0.5801772, 1, 0, 0, 1, 1,
-0.03039375, -0.1880516, -2.566015, 1, 0, 0, 1, 1,
-0.02307026, -0.9713047, -1.829297, 1, 0, 0, 1, 1,
-0.02241899, 0.09541799, -0.7856658, 1, 0, 0, 1, 1,
-0.01935336, -0.550465, -3.17225, 0, 0, 0, 1, 1,
-0.01679771, 0.9720706, -0.21281, 0, 0, 0, 1, 1,
-0.009937211, -0.6128317, -1.51573, 0, 0, 0, 1, 1,
-0.008547019, 0.8323051, 0.9130679, 0, 0, 0, 1, 1,
0.008099856, -0.5386797, 2.320013, 0, 0, 0, 1, 1,
0.01115056, -0.2228326, 3.46367, 0, 0, 0, 1, 1,
0.01126926, 0.106758, -0.3312657, 0, 0, 0, 1, 1,
0.0115683, -3.380239, 0.681068, 1, 1, 1, 1, 1,
0.01355938, -0.4215035, 2.57022, 1, 1, 1, 1, 1,
0.01379728, 1.07916, 0.4293322, 1, 1, 1, 1, 1,
0.01732776, 1.48983, -0.4234289, 1, 1, 1, 1, 1,
0.03039633, -2.243488, 3.138791, 1, 1, 1, 1, 1,
0.03835513, -0.5817264, 4.398847, 1, 1, 1, 1, 1,
0.0396566, -0.1365253, 3.375114, 1, 1, 1, 1, 1,
0.03997159, 1.022224, 1.293778, 1, 1, 1, 1, 1,
0.04069793, 0.3402957, -0.1328273, 1, 1, 1, 1, 1,
0.04158203, 0.3021998, -0.3003224, 1, 1, 1, 1, 1,
0.04266188, 0.4394493, -0.7252728, 1, 1, 1, 1, 1,
0.04312301, -0.8054094, 1.663616, 1, 1, 1, 1, 1,
0.04945541, 0.9066628, -0.7205437, 1, 1, 1, 1, 1,
0.05079133, -0.1339588, 3.545549, 1, 1, 1, 1, 1,
0.05100482, -1.708872, 3.190332, 1, 1, 1, 1, 1,
0.05651397, -0.2431495, 2.047493, 0, 0, 1, 1, 1,
0.06356692, 0.5880203, 0.03420337, 1, 0, 0, 1, 1,
0.06440333, 0.1659691, 0.1439956, 1, 0, 0, 1, 1,
0.06447696, 0.6949599, 1.081641, 1, 0, 0, 1, 1,
0.06993731, -0.5450036, 3.645435, 1, 0, 0, 1, 1,
0.07117905, -1.194314, 2.992468, 1, 0, 0, 1, 1,
0.07168678, -1.490926, 2.995892, 0, 0, 0, 1, 1,
0.07423669, 0.7983644, -0.2265502, 0, 0, 0, 1, 1,
0.07612571, 1.433544, 0.4584074, 0, 0, 0, 1, 1,
0.07867337, -0.5298868, 5.34786, 0, 0, 0, 1, 1,
0.08144903, -0.5669385, 2.684715, 0, 0, 0, 1, 1,
0.08424661, 1.596939, -1.233361, 0, 0, 0, 1, 1,
0.08580451, -0.1936865, 3.598806, 0, 0, 0, 1, 1,
0.08611905, -0.3890029, 3.472208, 1, 1, 1, 1, 1,
0.08615547, 0.5458509, -2.328035, 1, 1, 1, 1, 1,
0.08788688, -0.9170818, 2.158879, 1, 1, 1, 1, 1,
0.08806966, 1.299029, -0.4365553, 1, 1, 1, 1, 1,
0.08893169, -1.230188, 1.781723, 1, 1, 1, 1, 1,
0.08931874, 1.626364, -0.379362, 1, 1, 1, 1, 1,
0.08943791, 1.912947, -1.214571, 1, 1, 1, 1, 1,
0.09277653, 0.8576663, -1.130753, 1, 1, 1, 1, 1,
0.09700244, -1.788693, 1.832877, 1, 1, 1, 1, 1,
0.09941718, -0.2340873, 2.944575, 1, 1, 1, 1, 1,
0.1005869, -0.4600893, 3.446018, 1, 1, 1, 1, 1,
0.1007203, 1.39645, -0.9581853, 1, 1, 1, 1, 1,
0.1054576, 0.3701358, 0.3812569, 1, 1, 1, 1, 1,
0.1070954, 0.01225997, 0.5293753, 1, 1, 1, 1, 1,
0.1085578, 0.2265322, -0.1604142, 1, 1, 1, 1, 1,
0.1093494, 0.9361181, 1.159787, 0, 0, 1, 1, 1,
0.1153807, -1.717064, 2.595268, 1, 0, 0, 1, 1,
0.1166895, -0.2895615, 3.196774, 1, 0, 0, 1, 1,
0.1173888, -1.397543, 2.265825, 1, 0, 0, 1, 1,
0.1225379, -1.116923, 2.922265, 1, 0, 0, 1, 1,
0.1243904, 0.1554149, 0.4042576, 1, 0, 0, 1, 1,
0.1266135, 0.1055745, 0.1920669, 0, 0, 0, 1, 1,
0.1286636, -0.1094505, 2.060321, 0, 0, 0, 1, 1,
0.1301126, 0.4590349, 1.963184, 0, 0, 0, 1, 1,
0.1351907, -0.5683947, 4.150875, 0, 0, 0, 1, 1,
0.1378962, 0.9412035, -0.5751469, 0, 0, 0, 1, 1,
0.1386802, 0.002975183, 2.22554, 0, 0, 0, 1, 1,
0.1393336, 0.997229, -1.065657, 0, 0, 0, 1, 1,
0.1416805, -1.345456, 4.543346, 1, 1, 1, 1, 1,
0.1433004, -0.3253708, 2.767265, 1, 1, 1, 1, 1,
0.1438005, -1.424058, 4.211335, 1, 1, 1, 1, 1,
0.1446862, -1.3238, 4.172373, 1, 1, 1, 1, 1,
0.1454612, -0.315533, 3.874944, 1, 1, 1, 1, 1,
0.1536421, 0.9418196, 2.105871, 1, 1, 1, 1, 1,
0.1540163, -2.190528, 4.090758, 1, 1, 1, 1, 1,
0.1540723, 2.868409, 0.3077441, 1, 1, 1, 1, 1,
0.1596286, -0.8827955, 2.866377, 1, 1, 1, 1, 1,
0.164849, -0.1912263, 2.067569, 1, 1, 1, 1, 1,
0.1670339, 0.4369041, 1.156867, 1, 1, 1, 1, 1,
0.1676169, -1.090943, 2.63741, 1, 1, 1, 1, 1,
0.1712867, 0.3118679, 1.184606, 1, 1, 1, 1, 1,
0.1713781, 0.9677714, -1.232649, 1, 1, 1, 1, 1,
0.176358, 0.08785447, 3.088958, 1, 1, 1, 1, 1,
0.1772615, 0.00206254, 2.244541, 0, 0, 1, 1, 1,
0.1828302, -0.1200234, 2.263779, 1, 0, 0, 1, 1,
0.1859821, -0.7407891, 0.4959425, 1, 0, 0, 1, 1,
0.1914782, -0.2700999, 2.883119, 1, 0, 0, 1, 1,
0.1919675, -1.720858, 2.277323, 1, 0, 0, 1, 1,
0.1935293, 0.1171202, 0.6064287, 1, 0, 0, 1, 1,
0.2046238, -3.221074, 3.663018, 0, 0, 0, 1, 1,
0.207429, 0.1509598, -0.3468605, 0, 0, 0, 1, 1,
0.2076015, -0.4040164, 4.32231, 0, 0, 0, 1, 1,
0.2080188, -1.112611, 5.292882, 0, 0, 0, 1, 1,
0.2107093, 1.111325, 0.6912653, 0, 0, 0, 1, 1,
0.2115096, 1.051112, 1.2794, 0, 0, 0, 1, 1,
0.2127785, -1.104533, 3.926156, 0, 0, 0, 1, 1,
0.2178183, 0.5364496, 0.05286997, 1, 1, 1, 1, 1,
0.2189062, -1.234468, 2.769153, 1, 1, 1, 1, 1,
0.2201408, 0.7570114, 1.450379, 1, 1, 1, 1, 1,
0.2225494, 0.03382141, 2.28507, 1, 1, 1, 1, 1,
0.2253872, -0.5013487, 1.958878, 1, 1, 1, 1, 1,
0.2304361, 0.09634895, 0.786116, 1, 1, 1, 1, 1,
0.2318922, 0.7975734, 0.4817572, 1, 1, 1, 1, 1,
0.233566, 0.1702522, 0.9582915, 1, 1, 1, 1, 1,
0.2335974, 0.6549796, 0.5119956, 1, 1, 1, 1, 1,
0.2384881, -0.07844447, 1.614366, 1, 1, 1, 1, 1,
0.2402667, -0.5739635, 3.442201, 1, 1, 1, 1, 1,
0.2404762, -0.1597962, 2.8268, 1, 1, 1, 1, 1,
0.2420355, -1.20391, 2.706915, 1, 1, 1, 1, 1,
0.2449676, 0.7728815, -0.9182637, 1, 1, 1, 1, 1,
0.2468233, 0.5458576, 0.3641907, 1, 1, 1, 1, 1,
0.247209, -1.832124, 2.701459, 0, 0, 1, 1, 1,
0.2473629, 2.25655, -0.2076758, 1, 0, 0, 1, 1,
0.2526858, -1.206923, 1.310223, 1, 0, 0, 1, 1,
0.2535238, 1.155944, 1.175198, 1, 0, 0, 1, 1,
0.2544732, -1.416208, 3.537906, 1, 0, 0, 1, 1,
0.2560684, 2.631147, 0.6060209, 1, 0, 0, 1, 1,
0.2561814, -1.123618, 4.400904, 0, 0, 0, 1, 1,
0.2563052, -1.836255, 2.908171, 0, 0, 0, 1, 1,
0.257371, 0.6222614, 1.181969, 0, 0, 0, 1, 1,
0.267788, -0.09167259, 2.61825, 0, 0, 0, 1, 1,
0.2683584, 0.1038376, 1.488122, 0, 0, 0, 1, 1,
0.2707108, -0.7050247, 1.952109, 0, 0, 0, 1, 1,
0.2708725, 1.318269, -0.1657429, 0, 0, 0, 1, 1,
0.2726205, 0.1954412, 0.09949021, 1, 1, 1, 1, 1,
0.2770975, 0.4721141, 2.260997, 1, 1, 1, 1, 1,
0.2862381, -0.7044578, 0.8818493, 1, 1, 1, 1, 1,
0.2870197, -1.028544, 3.055152, 1, 1, 1, 1, 1,
0.2895297, -0.6422102, 4.022882, 1, 1, 1, 1, 1,
0.2895845, -0.2901567, 2.439235, 1, 1, 1, 1, 1,
0.292875, 1.020053, 0.6874396, 1, 1, 1, 1, 1,
0.2940432, 0.4034368, 0.4119827, 1, 1, 1, 1, 1,
0.2963584, 0.3679672, 1.34793, 1, 1, 1, 1, 1,
0.2997698, -1.169865, 4.295352, 1, 1, 1, 1, 1,
0.3006499, -0.5547082, 4.217448, 1, 1, 1, 1, 1,
0.3046544, -1.140244, 2.498914, 1, 1, 1, 1, 1,
0.3050606, 0.7335558, 0.7402733, 1, 1, 1, 1, 1,
0.3070561, -1.028417, 2.163228, 1, 1, 1, 1, 1,
0.3132486, -0.4460815, 1.466143, 1, 1, 1, 1, 1,
0.3147815, 1.894088, 0.4633544, 0, 0, 1, 1, 1,
0.3167785, -0.4083622, 2.550946, 1, 0, 0, 1, 1,
0.3203096, -0.6385356, 2.065267, 1, 0, 0, 1, 1,
0.3225614, 1.508671, -0.8252987, 1, 0, 0, 1, 1,
0.3247046, 0.2307208, -1.174065, 1, 0, 0, 1, 1,
0.3263768, -1.620829, 2.810841, 1, 0, 0, 1, 1,
0.3295202, -0.6785263, 2.30391, 0, 0, 0, 1, 1,
0.3335012, -1.665024, 3.113992, 0, 0, 0, 1, 1,
0.3353037, -2.611258, 3.229673, 0, 0, 0, 1, 1,
0.3395336, -1.307967, 4.050652, 0, 0, 0, 1, 1,
0.3478308, -0.09310699, 1.598349, 0, 0, 0, 1, 1,
0.3483161, -1.225004, 3.612233, 0, 0, 0, 1, 1,
0.3533392, -0.99954, 3.256347, 0, 0, 0, 1, 1,
0.3537129, -1.16125, 3.96803, 1, 1, 1, 1, 1,
0.3591526, -1.271205, 4.085291, 1, 1, 1, 1, 1,
0.3643006, -1.354782, 2.568075, 1, 1, 1, 1, 1,
0.3712339, 0.9663025, 1.535817, 1, 1, 1, 1, 1,
0.3739913, -0.04239248, 2.8081, 1, 1, 1, 1, 1,
0.377092, 0.6063049, 1.302455, 1, 1, 1, 1, 1,
0.3793699, 0.9595588, -1.467518, 1, 1, 1, 1, 1,
0.3909338, -0.2216277, 0.8987645, 1, 1, 1, 1, 1,
0.397527, 1.295411, 1.153687, 1, 1, 1, 1, 1,
0.4031326, 0.5402212, 0.8630348, 1, 1, 1, 1, 1,
0.4086024, -0.6867014, 2.980216, 1, 1, 1, 1, 1,
0.4093431, 0.213011, 1.520923, 1, 1, 1, 1, 1,
0.4110285, 0.4148395, 1.483162, 1, 1, 1, 1, 1,
0.4131747, 0.9309363, 2.167944, 1, 1, 1, 1, 1,
0.4154906, 1.223247, -0.801824, 1, 1, 1, 1, 1,
0.4218802, -0.8714818, 1.993553, 0, 0, 1, 1, 1,
0.4242412, 0.05900992, 0.3499538, 1, 0, 0, 1, 1,
0.4298036, 0.137925, 3.632335, 1, 0, 0, 1, 1,
0.4339269, 0.605357, -0.4892948, 1, 0, 0, 1, 1,
0.4341307, -0.5592122, 1.743723, 1, 0, 0, 1, 1,
0.439378, -0.2252944, 3.885598, 1, 0, 0, 1, 1,
0.4402508, 0.6185984, 0.4317059, 0, 0, 0, 1, 1,
0.4422489, 1.151811, -0.6724188, 0, 0, 0, 1, 1,
0.4442031, 1.240692, -0.1569135, 0, 0, 0, 1, 1,
0.4472339, -0.2304084, 0.4929696, 0, 0, 0, 1, 1,
0.4479465, 1.570483, 0.1575, 0, 0, 0, 1, 1,
0.4509734, 0.09909, 1.084418, 0, 0, 0, 1, 1,
0.4550744, -0.6861691, 3.358827, 0, 0, 0, 1, 1,
0.4550828, 0.1639716, 2.902996, 1, 1, 1, 1, 1,
0.4592003, -0.9357541, 3.380442, 1, 1, 1, 1, 1,
0.4595987, 0.5941772, 0.01390962, 1, 1, 1, 1, 1,
0.4611461, 0.1956369, 1.721308, 1, 1, 1, 1, 1,
0.461941, 0.5173533, 0.9155487, 1, 1, 1, 1, 1,
0.4620925, -0.5315433, 3.405978, 1, 1, 1, 1, 1,
0.4654484, -0.6182712, 1.486623, 1, 1, 1, 1, 1,
0.4671522, 2.103703, 0.7107943, 1, 1, 1, 1, 1,
0.4681211, -0.5625651, 2.681647, 1, 1, 1, 1, 1,
0.4699979, 1.970697, -0.909096, 1, 1, 1, 1, 1,
0.4772873, 0.3809725, 0.1581208, 1, 1, 1, 1, 1,
0.4779991, -0.5352484, 3.648147, 1, 1, 1, 1, 1,
0.4789777, 1.524541, 1.532164, 1, 1, 1, 1, 1,
0.484933, -2.19237, 2.808306, 1, 1, 1, 1, 1,
0.487155, -0.05613979, 1.923019, 1, 1, 1, 1, 1,
0.4885983, 1.776142, 2.462295, 0, 0, 1, 1, 1,
0.489652, -1.27462, 3.976212, 1, 0, 0, 1, 1,
0.4946265, -1.526807, 2.047157, 1, 0, 0, 1, 1,
0.4952955, 0.757143, 0.2521078, 1, 0, 0, 1, 1,
0.498751, 0.2267949, 2.352595, 1, 0, 0, 1, 1,
0.4994561, 1.555456, -0.1523987, 1, 0, 0, 1, 1,
0.4999077, -0.3731503, 3.358909, 0, 0, 0, 1, 1,
0.5012245, 0.2793125, 0.4513756, 0, 0, 0, 1, 1,
0.504033, -0.1423847, 1.941419, 0, 0, 0, 1, 1,
0.5101392, 0.6191071, 0.03372664, 0, 0, 0, 1, 1,
0.5106193, 0.5835832, 0.06268521, 0, 0, 0, 1, 1,
0.515798, -0.5938041, 1.621413, 0, 0, 0, 1, 1,
0.516889, 0.01926365, 1.697819, 0, 0, 0, 1, 1,
0.5170525, 0.5318728, 0.5411396, 1, 1, 1, 1, 1,
0.5186102, 0.9586122, 0.2603883, 1, 1, 1, 1, 1,
0.5213775, -0.8303178, 1.615857, 1, 1, 1, 1, 1,
0.5220186, -0.9197896, 1.138391, 1, 1, 1, 1, 1,
0.52311, -1.257671, 2.56467, 1, 1, 1, 1, 1,
0.5243891, 0.7481706, 0.05589008, 1, 1, 1, 1, 1,
0.5288752, 0.1209834, 1.204116, 1, 1, 1, 1, 1,
0.5309805, -0.6331358, 2.989808, 1, 1, 1, 1, 1,
0.5344925, -0.5342951, 3.685257, 1, 1, 1, 1, 1,
0.5382739, 0.5323322, 1.100473, 1, 1, 1, 1, 1,
0.5405063, -1.691515, 1.510234, 1, 1, 1, 1, 1,
0.5423037, 0.3262368, -0.5713693, 1, 1, 1, 1, 1,
0.5485367, 0.4403552, 1.621855, 1, 1, 1, 1, 1,
0.5489977, 1.224896, 0.02709898, 1, 1, 1, 1, 1,
0.5516347, -0.1576448, 1.201656, 1, 1, 1, 1, 1,
0.5548403, 1.252931, -0.4215948, 0, 0, 1, 1, 1,
0.5569248, 1.031558, 1.397867, 1, 0, 0, 1, 1,
0.5573068, 0.8211325, -1.002852, 1, 0, 0, 1, 1,
0.5582981, 0.2310182, 1.135872, 1, 0, 0, 1, 1,
0.5605707, -1.613062, 4.135983, 1, 0, 0, 1, 1,
0.5667976, 0.4765751, 1.757558, 1, 0, 0, 1, 1,
0.5673255, -0.358851, 2.224367, 0, 0, 0, 1, 1,
0.5696266, 1.733106, 0.8728733, 0, 0, 0, 1, 1,
0.5761894, 0.9054493, 0.07000744, 0, 0, 0, 1, 1,
0.5772225, 1.17003, 0.1451136, 0, 0, 0, 1, 1,
0.5828705, 1.16657, 0.2375732, 0, 0, 0, 1, 1,
0.5832193, 0.6923889, 2.34227, 0, 0, 0, 1, 1,
0.5914099, -0.6185283, 1.561489, 0, 0, 0, 1, 1,
0.6004032, 0.3898818, 2.102511, 1, 1, 1, 1, 1,
0.6024125, 1.013425, 0.2858151, 1, 1, 1, 1, 1,
0.6052361, 0.5146337, 1.563221, 1, 1, 1, 1, 1,
0.6089382, -0.2295513, 0.840782, 1, 1, 1, 1, 1,
0.6093835, 0.4212555, -0.3304692, 1, 1, 1, 1, 1,
0.6112302, -0.4322083, 2.166306, 1, 1, 1, 1, 1,
0.6128551, 1.772023, 1.289638, 1, 1, 1, 1, 1,
0.6142712, -0.3177202, 1.699623, 1, 1, 1, 1, 1,
0.6164722, 0.3581056, 2.875939, 1, 1, 1, 1, 1,
0.6173576, 1.396179, -0.0547402, 1, 1, 1, 1, 1,
0.6177452, -0.633562, 2.25429, 1, 1, 1, 1, 1,
0.6192427, -0.8012553, 1.565204, 1, 1, 1, 1, 1,
0.6195533, 0.1458629, 0.8766323, 1, 1, 1, 1, 1,
0.6210578, -1.858855, 1.522194, 1, 1, 1, 1, 1,
0.6305356, -0.5498352, 2.932017, 1, 1, 1, 1, 1,
0.6343868, -1.741314, 2.203276, 0, 0, 1, 1, 1,
0.6383551, -0.3011602, 1.72367, 1, 0, 0, 1, 1,
0.6390827, -0.4181543, 2.707243, 1, 0, 0, 1, 1,
0.6396493, 0.3156013, 0.184094, 1, 0, 0, 1, 1,
0.6444449, 0.140533, 1.303829, 1, 0, 0, 1, 1,
0.6444566, -0.05911407, 0.06838307, 1, 0, 0, 1, 1,
0.6500505, 1.212083, 1.124969, 0, 0, 0, 1, 1,
0.6534891, -0.2567063, 0.9870023, 0, 0, 0, 1, 1,
0.6581182, 0.8000312, -0.2103093, 0, 0, 0, 1, 1,
0.6703441, -0.6513419, 3.172128, 0, 0, 0, 1, 1,
0.6727914, -0.8967127, 2.296066, 0, 0, 0, 1, 1,
0.6728333, -0.04484037, 1.646266, 0, 0, 0, 1, 1,
0.6779705, -1.809156, 2.706244, 0, 0, 0, 1, 1,
0.6824816, -1.635231, 1.0716, 1, 1, 1, 1, 1,
0.6855726, -0.3437207, 2.436729, 1, 1, 1, 1, 1,
0.692419, 1.020701, 0.6448266, 1, 1, 1, 1, 1,
0.6926101, 0.2176029, 0.6493196, 1, 1, 1, 1, 1,
0.6980742, 0.3943664, 0.9248853, 1, 1, 1, 1, 1,
0.7021883, -1.109925, 1.315878, 1, 1, 1, 1, 1,
0.7065731, -1.104414, 2.629131, 1, 1, 1, 1, 1,
0.7122024, 0.1560078, 0.7031927, 1, 1, 1, 1, 1,
0.7143927, -0.4786545, 4.127069, 1, 1, 1, 1, 1,
0.7221919, 1.115261, 1.754733, 1, 1, 1, 1, 1,
0.7224686, 0.2334074, 1.959171, 1, 1, 1, 1, 1,
0.7289826, -1.941785, 1.327449, 1, 1, 1, 1, 1,
0.732976, -1.243547, 2.519403, 1, 1, 1, 1, 1,
0.7362602, 0.5949138, 2.075598, 1, 1, 1, 1, 1,
0.7365776, -0.1829155, 2.084647, 1, 1, 1, 1, 1,
0.7405413, -0.7116547, 2.317689, 0, 0, 1, 1, 1,
0.74957, 0.7401412, 1.250744, 1, 0, 0, 1, 1,
0.7522704, -2.624124, 2.024487, 1, 0, 0, 1, 1,
0.7587393, 0.9979666, -0.545335, 1, 0, 0, 1, 1,
0.7598099, -0.1750191, 1.471971, 1, 0, 0, 1, 1,
0.7604921, -0.5880773, 2.484173, 1, 0, 0, 1, 1,
0.761497, 1.144803, -0.6136993, 0, 0, 0, 1, 1,
0.7673684, -0.2692709, 3.184754, 0, 0, 0, 1, 1,
0.77292, 0.1536597, 2.007827, 0, 0, 0, 1, 1,
0.7731695, -0.4876015, 2.196571, 0, 0, 0, 1, 1,
0.7735615, -1.818082, 3.68452, 0, 0, 0, 1, 1,
0.7810588, 0.7533334, 1.805293, 0, 0, 0, 1, 1,
0.7961025, -1.549752, 1.2978, 0, 0, 0, 1, 1,
0.8004438, 0.0315631, 0.7119872, 1, 1, 1, 1, 1,
0.8083043, -1.670331, 2.798952, 1, 1, 1, 1, 1,
0.8098965, 1.123491, 0.5928845, 1, 1, 1, 1, 1,
0.8110514, 0.01454952, 2.036937, 1, 1, 1, 1, 1,
0.8126702, -1.441778, 4.207129, 1, 1, 1, 1, 1,
0.8160104, 0.7557569, -0.580462, 1, 1, 1, 1, 1,
0.8170972, 1.333926, -0.7613896, 1, 1, 1, 1, 1,
0.8196356, 0.6861362, 2.693327, 1, 1, 1, 1, 1,
0.8379187, 0.5644509, 2.872943, 1, 1, 1, 1, 1,
0.8406436, 0.4149616, 1.331919, 1, 1, 1, 1, 1,
0.8487946, -0.09066038, 1.733238, 1, 1, 1, 1, 1,
0.8511663, -0.1631799, 0.0624968, 1, 1, 1, 1, 1,
0.8524992, -0.7412704, 2.398928, 1, 1, 1, 1, 1,
0.8552904, -0.173345, 2.640544, 1, 1, 1, 1, 1,
0.8637357, -1.372636, 2.050571, 1, 1, 1, 1, 1,
0.8667819, 0.7915868, 2.099841, 0, 0, 1, 1, 1,
0.8690501, 0.3287077, 1.310029, 1, 0, 0, 1, 1,
0.8693091, 1.208337, 0.5738674, 1, 0, 0, 1, 1,
0.8734819, 0.7027689, 0.6695227, 1, 0, 0, 1, 1,
0.8746493, 1.193675, 1.244386, 1, 0, 0, 1, 1,
0.8767329, -0.0856305, 1.338963, 1, 0, 0, 1, 1,
0.8923877, 1.395728, 1.023032, 0, 0, 0, 1, 1,
0.8950608, -0.5803103, 2.270466, 0, 0, 0, 1, 1,
0.8991661, 0.3145337, 0.4598867, 0, 0, 0, 1, 1,
0.9067659, 0.9328182, 0.8104858, 0, 0, 0, 1, 1,
0.9068294, -2.475191, 3.434461, 0, 0, 0, 1, 1,
0.9104571, -0.3107667, 1.971877, 0, 0, 0, 1, 1,
0.919306, -1.965064, 2.348758, 0, 0, 0, 1, 1,
0.9223889, -0.3617341, 1.648616, 1, 1, 1, 1, 1,
0.9260419, -0.4931956, 2.198968, 1, 1, 1, 1, 1,
0.9261262, 1.631166, 2.39579, 1, 1, 1, 1, 1,
0.9318048, 2.712699, -1.318718, 1, 1, 1, 1, 1,
0.9329665, -1.96698, 3.03348, 1, 1, 1, 1, 1,
0.9331971, 1.646108, 1.460586, 1, 1, 1, 1, 1,
0.9343917, -0.1631153, 1.219025, 1, 1, 1, 1, 1,
0.9414472, -0.759809, 0.2031505, 1, 1, 1, 1, 1,
0.9436814, -0.6865734, 3.458556, 1, 1, 1, 1, 1,
0.9484603, -0.7557173, 3.177356, 1, 1, 1, 1, 1,
0.9582922, -0.6434984, 2.176875, 1, 1, 1, 1, 1,
0.9800283, 0.6887707, 0.3675784, 1, 1, 1, 1, 1,
0.9845806, -0.6720626, 3.629012, 1, 1, 1, 1, 1,
0.9858826, -0.8425346, 1.5856, 1, 1, 1, 1, 1,
0.9872941, -0.9085675, 2.864628, 1, 1, 1, 1, 1,
0.9926839, 0.04033222, 0.5584683, 0, 0, 1, 1, 1,
0.9938487, -1.117645, 1.56661, 1, 0, 0, 1, 1,
0.9979671, 0.8762835, 1.245804, 1, 0, 0, 1, 1,
1.008028, 0.2944271, 1.81984, 1, 0, 0, 1, 1,
1.02265, 0.7147764, 1.110301, 1, 0, 0, 1, 1,
1.023325, -0.3260115, 2.563265, 1, 0, 0, 1, 1,
1.024076, -0.6843861, 2.883605, 0, 0, 0, 1, 1,
1.026661, 2.954508, 2.883494, 0, 0, 0, 1, 1,
1.028663, 0.4138162, -0.2405331, 0, 0, 0, 1, 1,
1.032324, 0.08934276, 1.567086, 0, 0, 0, 1, 1,
1.032739, -1.73572, 3.184027, 0, 0, 0, 1, 1,
1.03819, -0.6444937, 2.131308, 0, 0, 0, 1, 1,
1.041511, -0.899641, 3.760027, 0, 0, 0, 1, 1,
1.043329, -1.492977, 2.235985, 1, 1, 1, 1, 1,
1.044774, -1.077193, 3.11274, 1, 1, 1, 1, 1,
1.051768, 1.256066, -0.5754188, 1, 1, 1, 1, 1,
1.056081, -0.2332295, 2.82527, 1, 1, 1, 1, 1,
1.062119, 0.1518869, 1.10515, 1, 1, 1, 1, 1,
1.064424, -0.3847122, 0.5689465, 1, 1, 1, 1, 1,
1.067249, 0.1661575, 0.6786413, 1, 1, 1, 1, 1,
1.067621, 0.6194851, -0.3144118, 1, 1, 1, 1, 1,
1.069674, 0.2661383, 0.8626969, 1, 1, 1, 1, 1,
1.071114, -0.6247271, 1.934319, 1, 1, 1, 1, 1,
1.074805, 0.5363535, 1.891898, 1, 1, 1, 1, 1,
1.079982, 1.600891, 1.408618, 1, 1, 1, 1, 1,
1.080683, -0.8850231, 1.522796, 1, 1, 1, 1, 1,
1.096612, 0.7189068, 2.451451, 1, 1, 1, 1, 1,
1.103262, -0.1356095, 2.421591, 1, 1, 1, 1, 1,
1.105976, 0.8197983, 0.3775335, 0, 0, 1, 1, 1,
1.105996, -1.656371, 2.170988, 1, 0, 0, 1, 1,
1.108698, 1.218688, -1.304625, 1, 0, 0, 1, 1,
1.113945, -0.2154421, 2.128579, 1, 0, 0, 1, 1,
1.114527, -1.831649, 3.732433, 1, 0, 0, 1, 1,
1.120972, 0.8307986, 0.9991515, 1, 0, 0, 1, 1,
1.134764, 2.182102, -0.2176166, 0, 0, 0, 1, 1,
1.145313, 0.6523135, 1.187249, 0, 0, 0, 1, 1,
1.149204, -1.59186, 2.414855, 0, 0, 0, 1, 1,
1.149937, 0.1429822, 1.099962, 0, 0, 0, 1, 1,
1.155006, -0.2007951, 0.720723, 0, 0, 0, 1, 1,
1.158813, 0.3523, 4.118911, 0, 0, 0, 1, 1,
1.166943, -0.2140876, 0.649116, 0, 0, 0, 1, 1,
1.174791, 0.08460557, 3.193232, 1, 1, 1, 1, 1,
1.178157, 0.9444411, 0.4333944, 1, 1, 1, 1, 1,
1.185863, -2.138408, 2.28233, 1, 1, 1, 1, 1,
1.191072, -0.9217781, 2.743858, 1, 1, 1, 1, 1,
1.195751, 0.9875665, 0.4488456, 1, 1, 1, 1, 1,
1.200172, 1.089714, 0.2775194, 1, 1, 1, 1, 1,
1.20198, 0.6636807, -0.1221652, 1, 1, 1, 1, 1,
1.207382, -1.032575, 3.340552, 1, 1, 1, 1, 1,
1.210548, -1.922023, 3.174227, 1, 1, 1, 1, 1,
1.213651, -0.5737517, 1.463009, 1, 1, 1, 1, 1,
1.21511, -0.6496257, 0.3054828, 1, 1, 1, 1, 1,
1.219147, -0.8168104, -0.0401109, 1, 1, 1, 1, 1,
1.219924, 0.3456629, 0.9366317, 1, 1, 1, 1, 1,
1.223258, -0.6997182, 2.501952, 1, 1, 1, 1, 1,
1.224137, 0.6734346, 0.8613449, 1, 1, 1, 1, 1,
1.227555, -0.5649102, 1.855497, 0, 0, 1, 1, 1,
1.229012, -0.2963901, 2.252448, 1, 0, 0, 1, 1,
1.236892, -0.1367317, 1.014093, 1, 0, 0, 1, 1,
1.246847, 0.3866655, 1.620767, 1, 0, 0, 1, 1,
1.247092, 1.061461, 0.6867976, 1, 0, 0, 1, 1,
1.263108, 0.8523083, -0.8555157, 1, 0, 0, 1, 1,
1.267857, -0.2802512, 2.28819, 0, 0, 0, 1, 1,
1.276723, 0.4173236, 1.166523, 0, 0, 0, 1, 1,
1.277955, 0.1371522, 2.441836, 0, 0, 0, 1, 1,
1.283886, -1.903411, 4.358144, 0, 0, 0, 1, 1,
1.293115, 1.002253, 3.545659, 0, 0, 0, 1, 1,
1.304018, 0.05298312, 1.583959, 0, 0, 0, 1, 1,
1.305587, 1.561384, -0.1118742, 0, 0, 0, 1, 1,
1.321197, -0.5251849, 1.433354, 1, 1, 1, 1, 1,
1.322329, -0.4883568, 1.994007, 1, 1, 1, 1, 1,
1.322996, 0.5587061, 0.1962435, 1, 1, 1, 1, 1,
1.324719, -0.3087607, 0.8773291, 1, 1, 1, 1, 1,
1.334319, -0.6158401, 3.072733, 1, 1, 1, 1, 1,
1.336986, 0.09548473, 2.543333, 1, 1, 1, 1, 1,
1.339417, -0.4225084, 3.516518, 1, 1, 1, 1, 1,
1.358453, 0.5968081, 2.996274, 1, 1, 1, 1, 1,
1.359452, -0.4487113, 1.068849, 1, 1, 1, 1, 1,
1.36383, 0.5048148, 0.5480262, 1, 1, 1, 1, 1,
1.364095, 0.3472441, 2.601976, 1, 1, 1, 1, 1,
1.366071, 0.07136367, 0.08047803, 1, 1, 1, 1, 1,
1.367633, -0.831593, 1.17478, 1, 1, 1, 1, 1,
1.370625, 1.235708, 1.904838, 1, 1, 1, 1, 1,
1.372369, 1.815666, 1.277844, 1, 1, 1, 1, 1,
1.374491, -1.57525, 1.930441, 0, 0, 1, 1, 1,
1.396467, 0.0449989, 2.326156, 1, 0, 0, 1, 1,
1.397134, -0.0848555, 2.465118, 1, 0, 0, 1, 1,
1.400581, -0.9024733, 1.558684, 1, 0, 0, 1, 1,
1.407135, 0.6979526, -0.780603, 1, 0, 0, 1, 1,
1.418415, -0.6666075, 0.6289884, 1, 0, 0, 1, 1,
1.426856, 0.7842073, 1.760785, 0, 0, 0, 1, 1,
1.44216, -0.1472751, 1.592035, 0, 0, 0, 1, 1,
1.443194, -0.8809708, -0.5258093, 0, 0, 0, 1, 1,
1.452035, -1.026794, 3.469311, 0, 0, 0, 1, 1,
1.453254, -0.8984184, 2.24896, 0, 0, 0, 1, 1,
1.456698, -1.457565, 3.202248, 0, 0, 0, 1, 1,
1.457402, -0.08825387, 1.029644, 0, 0, 0, 1, 1,
1.465501, -0.195938, -0.04063186, 1, 1, 1, 1, 1,
1.471679, 1.683632, 1.784225, 1, 1, 1, 1, 1,
1.48155, 0.2802337, 0.2523471, 1, 1, 1, 1, 1,
1.493011, -1.021406, 2.845018, 1, 1, 1, 1, 1,
1.510323, 0.2459075, 1.46363, 1, 1, 1, 1, 1,
1.533376, -0.7761506, 3.502646, 1, 1, 1, 1, 1,
1.536446, 1.809119, 2.406602, 1, 1, 1, 1, 1,
1.539794, -0.03557737, 0.5652613, 1, 1, 1, 1, 1,
1.540056, 0.2882617, -0.4222958, 1, 1, 1, 1, 1,
1.557284, -0.7081228, 2.169718, 1, 1, 1, 1, 1,
1.559147, -0.5498158, 1.373548, 1, 1, 1, 1, 1,
1.561344, 0.4430034, 2.076202, 1, 1, 1, 1, 1,
1.571277, -0.4757404, 1.871937, 1, 1, 1, 1, 1,
1.572057, 0.1337748, 1.172428, 1, 1, 1, 1, 1,
1.574561, -1.024921, 1.329195, 1, 1, 1, 1, 1,
1.578348, 0.08363388, 1.870412, 0, 0, 1, 1, 1,
1.578352, 0.07655135, 2.199697, 1, 0, 0, 1, 1,
1.5845, -0.5490441, 1.908391, 1, 0, 0, 1, 1,
1.617016, -0.1418938, 2.228485, 1, 0, 0, 1, 1,
1.622482, 0.9566917, 0.1032023, 1, 0, 0, 1, 1,
1.644175, 0.8617882, 1.58215, 1, 0, 0, 1, 1,
1.660034, -0.1841587, 2.005063, 0, 0, 0, 1, 1,
1.664472, -0.1343839, 2.690729, 0, 0, 0, 1, 1,
1.672604, -0.0903919, 1.955294, 0, 0, 0, 1, 1,
1.676518, 1.488785, 0.8989802, 0, 0, 0, 1, 1,
1.688363, 0.9038907, 0.3472066, 0, 0, 0, 1, 1,
1.689999, 1.421602, -0.2249122, 0, 0, 0, 1, 1,
1.693359, -0.4837821, 2.969511, 0, 0, 0, 1, 1,
1.709928, -0.1582632, 0.9798236, 1, 1, 1, 1, 1,
1.709944, 0.1952948, 1.2618, 1, 1, 1, 1, 1,
1.719459, 0.3615348, 0.1785516, 1, 1, 1, 1, 1,
1.73603, -1.470952, 1.891361, 1, 1, 1, 1, 1,
1.737385, 0.6105525, 2.845699, 1, 1, 1, 1, 1,
1.742003, 1.686024, -0.3973321, 1, 1, 1, 1, 1,
1.791945, 0.2095999, 1.994295, 1, 1, 1, 1, 1,
1.801603, 0.1716741, -0.5115228, 1, 1, 1, 1, 1,
1.804708, 0.196297, 1.663244, 1, 1, 1, 1, 1,
1.818026, -0.5550396, 2.55619, 1, 1, 1, 1, 1,
1.832132, -0.3935423, 1.943723, 1, 1, 1, 1, 1,
1.837542, -1.579735, 2.280786, 1, 1, 1, 1, 1,
1.858327, 0.1446985, 0.8899252, 1, 1, 1, 1, 1,
1.897105, 0.4518857, 1.745329, 1, 1, 1, 1, 1,
1.907013, -0.9453161, 1.902661, 1, 1, 1, 1, 1,
1.913896, -2.539166, 2.055052, 0, 0, 1, 1, 1,
1.939015, -0.3859688, 2.368475, 1, 0, 0, 1, 1,
1.939358, -0.1647766, 1.454761, 1, 0, 0, 1, 1,
1.959848, 0.6961412, 2.231144, 1, 0, 0, 1, 1,
1.968472, 1.207269, 0.4386829, 1, 0, 0, 1, 1,
2.014034, -1.506173, 1.420246, 1, 0, 0, 1, 1,
2.160829, -1.439683, 3.391637, 0, 0, 0, 1, 1,
2.164398, 0.2684139, 0.7674552, 0, 0, 0, 1, 1,
2.283973, 0.09049588, 2.05577, 0, 0, 0, 1, 1,
2.287039, 1.707522, 0.5066418, 0, 0, 0, 1, 1,
2.292804, -0.8584924, 2.021714, 0, 0, 0, 1, 1,
2.356877, 0.4737976, 0.6086888, 0, 0, 0, 1, 1,
2.419161, 0.7817829, 0.2708676, 0, 0, 0, 1, 1,
2.437594, -0.4857705, 1.073586, 1, 1, 1, 1, 1,
2.530358, -0.8333781, 3.370398, 1, 1, 1, 1, 1,
2.592732, 0.3070909, 1.827247, 1, 1, 1, 1, 1,
2.733592, -1.054354, 0.2764214, 1, 1, 1, 1, 1,
2.967651, 1.006383, 1.452015, 1, 1, 1, 1, 1,
3.126647, 0.8665224, 0.6222588, 1, 1, 1, 1, 1,
3.272428, 0.2767387, 2.318798, 1, 1, 1, 1, 1
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
var radius = 9.375033;
var distance = 32.92941;
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
mvMatrix.translate( -0.02044058, 0.2128655, -0.2494183 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92941);
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