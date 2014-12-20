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
-3.208535, -0.7720238, -2.306616, 1, 0, 0, 1,
-2.855358, -2.384657, -0.456214, 1, 0.007843138, 0, 1,
-2.770729, -1.552413, -2.421698, 1, 0.01176471, 0, 1,
-2.679702, -0.01951428, -1.462709, 1, 0.01960784, 0, 1,
-2.385812, 0.6755297, -1.308348, 1, 0.02352941, 0, 1,
-2.323358, 1.298036, 0.7473183, 1, 0.03137255, 0, 1,
-2.307059, 0.3539159, -1.709812, 1, 0.03529412, 0, 1,
-2.304803, -0.296924, -1.3986, 1, 0.04313726, 0, 1,
-2.166828, -1.254686, -1.749378, 1, 0.04705882, 0, 1,
-2.130706, 0.7028979, -1.248711, 1, 0.05490196, 0, 1,
-2.099926, 1.457606, -3.501898, 1, 0.05882353, 0, 1,
-2.075542, 0.9724356, -0.5040879, 1, 0.06666667, 0, 1,
-2.068134, 0.6585447, 0.5583438, 1, 0.07058824, 0, 1,
-2.04752, -0.8968459, -3.086888, 1, 0.07843138, 0, 1,
-2.040577, -1.162734, -3.002959, 1, 0.08235294, 0, 1,
-2.038035, 0.4638351, -1.779645, 1, 0.09019608, 0, 1,
-2.03796, -0.6960686, -1.669531, 1, 0.09411765, 0, 1,
-2.031891, 0.5415715, -1.626193, 1, 0.1019608, 0, 1,
-2.024325, 0.1275305, -0.4183316, 1, 0.1098039, 0, 1,
-1.99844, 0.6850406, -1.021535, 1, 0.1137255, 0, 1,
-1.989667, -0.8380221, -4.292218, 1, 0.1215686, 0, 1,
-1.963966, -0.7294528, -4.170342, 1, 0.1254902, 0, 1,
-1.961064, 0.2095341, -1.781052, 1, 0.1333333, 0, 1,
-1.948997, -1.806067, -1.780828, 1, 0.1372549, 0, 1,
-1.934063, -0.3913026, -2.058208, 1, 0.145098, 0, 1,
-1.919153, -0.1087281, -1.67052, 1, 0.1490196, 0, 1,
-1.916755, 1.851633, -0.7218944, 1, 0.1568628, 0, 1,
-1.916576, 1.786271, -2.285589, 1, 0.1607843, 0, 1,
-1.916531, 1.295732, 0.4433057, 1, 0.1686275, 0, 1,
-1.847059, -0.3221413, -1.736413, 1, 0.172549, 0, 1,
-1.832901, -1.971756, -2.602089, 1, 0.1803922, 0, 1,
-1.830045, -0.6062384, -2.903299, 1, 0.1843137, 0, 1,
-1.826914, -0.2496586, -1.620019, 1, 0.1921569, 0, 1,
-1.780764, 2.138119, -0.4290298, 1, 0.1960784, 0, 1,
-1.776523, -0.3082782, -2.141556, 1, 0.2039216, 0, 1,
-1.769703, -0.4059386, -2.275536, 1, 0.2117647, 0, 1,
-1.76546, 1.801824, -0.08015142, 1, 0.2156863, 0, 1,
-1.757864, 0.5190793, -2.561244, 1, 0.2235294, 0, 1,
-1.741407, -0.418741, -2.498099, 1, 0.227451, 0, 1,
-1.740042, -0.5993241, -1.420677, 1, 0.2352941, 0, 1,
-1.690456, -0.7438008, -1.723014, 1, 0.2392157, 0, 1,
-1.687566, 0.2864428, -2.904686, 1, 0.2470588, 0, 1,
-1.687559, -0.440607, -2.254083, 1, 0.2509804, 0, 1,
-1.684698, -0.5892521, -1.838342, 1, 0.2588235, 0, 1,
-1.675589, 0.02857318, 0.1885322, 1, 0.2627451, 0, 1,
-1.64516, -0.256909, -0.5672265, 1, 0.2705882, 0, 1,
-1.638694, -0.1474057, -0.5784265, 1, 0.2745098, 0, 1,
-1.630633, 0.7696568, -0.8200774, 1, 0.282353, 0, 1,
-1.628978, 0.1835481, -1.409783, 1, 0.2862745, 0, 1,
-1.625818, 0.42399, -0.6908433, 1, 0.2941177, 0, 1,
-1.610791, 0.1519593, -0.3870761, 1, 0.3019608, 0, 1,
-1.606639, -0.1929008, 0.3289917, 1, 0.3058824, 0, 1,
-1.586127, 0.3690919, -1.19847, 1, 0.3137255, 0, 1,
-1.55548, 0.2779518, -0.7269487, 1, 0.3176471, 0, 1,
-1.555447, -1.401054, -4.294325, 1, 0.3254902, 0, 1,
-1.555381, -0.6241446, -2.992963, 1, 0.3294118, 0, 1,
-1.537953, 0.5603119, 0.01134068, 1, 0.3372549, 0, 1,
-1.532206, -0.9355687, -3.109231, 1, 0.3411765, 0, 1,
-1.508148, -1.051986, -1.705549, 1, 0.3490196, 0, 1,
-1.492789, 0.1496228, -0.9118714, 1, 0.3529412, 0, 1,
-1.487999, -1.272938, -4.956608, 1, 0.3607843, 0, 1,
-1.481508, 0.08184887, 1.727776, 1, 0.3647059, 0, 1,
-1.47997, -1.066162, -0.7209023, 1, 0.372549, 0, 1,
-1.475153, 0.1711591, -1.645438, 1, 0.3764706, 0, 1,
-1.465746, 0.3545358, -0.5560415, 1, 0.3843137, 0, 1,
-1.458835, -0.06848723, -2.984801, 1, 0.3882353, 0, 1,
-1.457387, -1.470096, -0.5777952, 1, 0.3960784, 0, 1,
-1.453591, -0.539338, -0.885991, 1, 0.4039216, 0, 1,
-1.448833, 0.2794437, -1.536707, 1, 0.4078431, 0, 1,
-1.447, 0.7424749, -0.3985691, 1, 0.4156863, 0, 1,
-1.434576, 0.1829475, -0.9382098, 1, 0.4196078, 0, 1,
-1.419325, 0.4168502, -1.191786, 1, 0.427451, 0, 1,
-1.4168, -0.4896969, -2.320651, 1, 0.4313726, 0, 1,
-1.415277, 0.04705112, -2.449279, 1, 0.4392157, 0, 1,
-1.386312, -0.5425225, -1.597693, 1, 0.4431373, 0, 1,
-1.383914, -0.05800324, -2.091854, 1, 0.4509804, 0, 1,
-1.380982, -1.259721, -3.36905, 1, 0.454902, 0, 1,
-1.375813, 0.05432823, -0.5950134, 1, 0.4627451, 0, 1,
-1.375364, -0.5792142, -1.525819, 1, 0.4666667, 0, 1,
-1.374828, -0.9896414, -1.702324, 1, 0.4745098, 0, 1,
-1.359592, 0.7268035, -1.579603, 1, 0.4784314, 0, 1,
-1.359366, -1.443616, -2.762209, 1, 0.4862745, 0, 1,
-1.356471, -0.1604412, -2.300543, 1, 0.4901961, 0, 1,
-1.350996, -1.333117, -3.424394, 1, 0.4980392, 0, 1,
-1.343842, -1.281351, -2.873778, 1, 0.5058824, 0, 1,
-1.335944, -0.2712762, -1.345175, 1, 0.509804, 0, 1,
-1.326249, -0.4318647, -2.017168, 1, 0.5176471, 0, 1,
-1.324121, 0.8709519, 0.2198235, 1, 0.5215687, 0, 1,
-1.317121, 1.136967, -1.851396, 1, 0.5294118, 0, 1,
-1.314006, -0.7984797, -3.479501, 1, 0.5333334, 0, 1,
-1.29938, -0.7729758, -3.157985, 1, 0.5411765, 0, 1,
-1.298617, -0.5059229, -2.458673, 1, 0.5450981, 0, 1,
-1.288347, -0.385203, -2.819066, 1, 0.5529412, 0, 1,
-1.284913, -0.6917331, -2.429394, 1, 0.5568628, 0, 1,
-1.282142, 0.7820409, -0.8310987, 1, 0.5647059, 0, 1,
-1.278061, 0.3574602, -0.7870131, 1, 0.5686275, 0, 1,
-1.263477, 0.6438884, -0.04063486, 1, 0.5764706, 0, 1,
-1.261961, -0.07416691, -2.711431, 1, 0.5803922, 0, 1,
-1.259905, 0.7002366, -0.6875281, 1, 0.5882353, 0, 1,
-1.24889, -0.8103045, -3.98538, 1, 0.5921569, 0, 1,
-1.24535, -0.9341688, -2.300812, 1, 0.6, 0, 1,
-1.240101, 0.3207301, -1.351254, 1, 0.6078432, 0, 1,
-1.237993, 2.64201, -1.68669, 1, 0.6117647, 0, 1,
-1.237695, 0.03837854, -2.479131, 1, 0.6196079, 0, 1,
-1.237397, -0.08707944, -1.707286, 1, 0.6235294, 0, 1,
-1.228849, -1.399224, -3.668956, 1, 0.6313726, 0, 1,
-1.22163, 1.285502, -1.991457, 1, 0.6352941, 0, 1,
-1.208137, -1.699243, -3.783938, 1, 0.6431373, 0, 1,
-1.197889, -1.053158, -1.741459, 1, 0.6470588, 0, 1,
-1.197809, 1.189268, 0.1038045, 1, 0.654902, 0, 1,
-1.197171, -0.4734973, 0.1079577, 1, 0.6588235, 0, 1,
-1.196512, 0.1455306, -1.636832, 1, 0.6666667, 0, 1,
-1.187051, 1.731968, -0.1038439, 1, 0.6705883, 0, 1,
-1.185813, -0.5799553, -0.2403275, 1, 0.6784314, 0, 1,
-1.182385, 1.565768, -0.4411829, 1, 0.682353, 0, 1,
-1.16554, 0.9208351, 0.2878445, 1, 0.6901961, 0, 1,
-1.165378, 2.128141, -0.2707151, 1, 0.6941177, 0, 1,
-1.153147, 1.147256, -2.489245, 1, 0.7019608, 0, 1,
-1.148953, -2.216674, -4.260739, 1, 0.7098039, 0, 1,
-1.148875, 1.138401, 0.6537686, 1, 0.7137255, 0, 1,
-1.148216, 0.09507875, -2.379891, 1, 0.7215686, 0, 1,
-1.139876, 0.1280611, -3.091348, 1, 0.7254902, 0, 1,
-1.134167, -0.2390574, -2.054958, 1, 0.7333333, 0, 1,
-1.133624, 0.5593273, 0.1343957, 1, 0.7372549, 0, 1,
-1.126695, 0.1615919, -0.7342613, 1, 0.7450981, 0, 1,
-1.126121, -0.2307086, -0.03566447, 1, 0.7490196, 0, 1,
-1.124387, 1.244913, -0.6823686, 1, 0.7568628, 0, 1,
-1.123611, -0.2980615, -2.390488, 1, 0.7607843, 0, 1,
-1.122107, 0.5695679, -1.405228, 1, 0.7686275, 0, 1,
-1.119495, -0.1904869, -2.0151, 1, 0.772549, 0, 1,
-1.115313, -0.003535911, -2.345454, 1, 0.7803922, 0, 1,
-1.102584, 0.4487568, -0.4556433, 1, 0.7843137, 0, 1,
-1.099554, -0.9912337, -3.523713, 1, 0.7921569, 0, 1,
-1.096775, 0.7162265, -0.1712458, 1, 0.7960784, 0, 1,
-1.088069, -1.573618, -2.946024, 1, 0.8039216, 0, 1,
-1.082685, -1.603559, -2.887926, 1, 0.8117647, 0, 1,
-1.070294, -0.5439172, -1.082198, 1, 0.8156863, 0, 1,
-1.070053, -1.043759, -2.04639, 1, 0.8235294, 0, 1,
-1.069632, -0.1096799, -1.047967, 1, 0.827451, 0, 1,
-1.067004, -0.9250811, -0.8021494, 1, 0.8352941, 0, 1,
-1.064052, 1.956367, 0.1099144, 1, 0.8392157, 0, 1,
-1.059526, -0.5449159, -2.964862, 1, 0.8470588, 0, 1,
-1.057424, 0.7050159, -1.490537, 1, 0.8509804, 0, 1,
-1.056198, 0.7460588, -1.488419, 1, 0.8588235, 0, 1,
-1.055808, -0.9638033, -2.342146, 1, 0.8627451, 0, 1,
-1.054431, -1.153324, -2.924087, 1, 0.8705882, 0, 1,
-1.037912, 0.621342, -1.6675, 1, 0.8745098, 0, 1,
-1.023478, -0.5199457, -3.142597, 1, 0.8823529, 0, 1,
-1.016258, -0.08921228, -3.042169, 1, 0.8862745, 0, 1,
-1.00996, -2.050781, -4.10995, 1, 0.8941177, 0, 1,
-0.9791133, 0.02482295, -2.230364, 1, 0.8980392, 0, 1,
-0.9784937, 0.5623785, -1.048763, 1, 0.9058824, 0, 1,
-0.9771935, 0.3194888, -2.291384, 1, 0.9137255, 0, 1,
-0.9676399, -0.001630991, -0.9610864, 1, 0.9176471, 0, 1,
-0.9615447, 0.6122301, -1.098146, 1, 0.9254902, 0, 1,
-0.9555323, 0.318767, -1.903686, 1, 0.9294118, 0, 1,
-0.9456641, -0.5770019, 0.04252196, 1, 0.9372549, 0, 1,
-0.9450417, 0.3421876, -0.8872102, 1, 0.9411765, 0, 1,
-0.9437821, 0.6602899, -1.401112, 1, 0.9490196, 0, 1,
-0.9304183, 1.007949, -1.110562, 1, 0.9529412, 0, 1,
-0.9281783, -0.1266349, -2.681991, 1, 0.9607843, 0, 1,
-0.9209984, 0.01677635, -3.129056, 1, 0.9647059, 0, 1,
-0.9036687, 0.4719424, -1.777349, 1, 0.972549, 0, 1,
-0.9020138, -0.3727201, -1.992414, 1, 0.9764706, 0, 1,
-0.901827, 0.09859372, -2.595904, 1, 0.9843137, 0, 1,
-0.8891806, -0.8102915, -3.271872, 1, 0.9882353, 0, 1,
-0.885223, 2.000248, 0.1993501, 1, 0.9960784, 0, 1,
-0.8851433, 0.06114145, -2.570796, 0.9960784, 1, 0, 1,
-0.8806621, 0.6203566, -0.5686277, 0.9921569, 1, 0, 1,
-0.879886, -2.18694, -3.733149, 0.9843137, 1, 0, 1,
-0.8746091, 0.612265, -1.755693, 0.9803922, 1, 0, 1,
-0.8702475, -0.4437034, -3.843371, 0.972549, 1, 0, 1,
-0.8693953, 0.5149679, -1.655479, 0.9686275, 1, 0, 1,
-0.8641636, -0.7034586, -2.264019, 0.9607843, 1, 0, 1,
-0.8583941, 0.1836026, -1.158061, 0.9568627, 1, 0, 1,
-0.8546265, -0.5999852, -0.4571286, 0.9490196, 1, 0, 1,
-0.851733, 0.6044027, -0.9406477, 0.945098, 1, 0, 1,
-0.8485137, -0.1349076, -2.312277, 0.9372549, 1, 0, 1,
-0.8421776, 0.04850118, -1.643532, 0.9333333, 1, 0, 1,
-0.8371385, 1.157726, -0.4462965, 0.9254902, 1, 0, 1,
-0.8269039, -2.779355, -1.816068, 0.9215686, 1, 0, 1,
-0.8242902, -0.1147608, -1.685466, 0.9137255, 1, 0, 1,
-0.8240791, -0.7218676, -0.6702996, 0.9098039, 1, 0, 1,
-0.8184178, 0.2986542, -1.38866, 0.9019608, 1, 0, 1,
-0.8174272, -0.6587423, -4.113575, 0.8941177, 1, 0, 1,
-0.8131322, -0.4693305, -3.343551, 0.8901961, 1, 0, 1,
-0.8082118, 0.5600268, -0.961711, 0.8823529, 1, 0, 1,
-0.8074439, 0.768718, -1.311813, 0.8784314, 1, 0, 1,
-0.8071126, 0.5677385, 0.4998591, 0.8705882, 1, 0, 1,
-0.8002529, 1.660025, -1.758653, 0.8666667, 1, 0, 1,
-0.7981694, 0.4973751, 0.4831697, 0.8588235, 1, 0, 1,
-0.79699, 0.08170592, -1.753793, 0.854902, 1, 0, 1,
-0.7921191, -0.8565266, -1.583531, 0.8470588, 1, 0, 1,
-0.7875315, 0.4531352, -1.840418, 0.8431373, 1, 0, 1,
-0.7784461, -0.2495828, -2.60018, 0.8352941, 1, 0, 1,
-0.7767559, -0.4487242, -2.045434, 0.8313726, 1, 0, 1,
-0.7756538, -2.791203, -3.288169, 0.8235294, 1, 0, 1,
-0.7745162, 0.3861768, -0.3033921, 0.8196079, 1, 0, 1,
-0.7701222, -0.9036075, -1.124082, 0.8117647, 1, 0, 1,
-0.7679604, -1.126493, -1.362248, 0.8078431, 1, 0, 1,
-0.7676235, -0.09997708, -1.587288, 0.8, 1, 0, 1,
-0.7644859, -0.275295, -0.9756998, 0.7921569, 1, 0, 1,
-0.7559788, -1.888355, -1.326432, 0.7882353, 1, 0, 1,
-0.755087, 1.126109, 0.037757, 0.7803922, 1, 0, 1,
-0.7502222, 0.4823589, -2.194473, 0.7764706, 1, 0, 1,
-0.7419465, 0.8935164, -1.721865, 0.7686275, 1, 0, 1,
-0.7407435, -2.021134, -2.352573, 0.7647059, 1, 0, 1,
-0.737369, -0.8572707, -4.168092, 0.7568628, 1, 0, 1,
-0.733388, -1.981738, -0.7102265, 0.7529412, 1, 0, 1,
-0.7267914, 1.399294, 0.1745809, 0.7450981, 1, 0, 1,
-0.7267324, -0.6756594, -2.840393, 0.7411765, 1, 0, 1,
-0.7247473, -0.8340539, -1.365095, 0.7333333, 1, 0, 1,
-0.7116875, -1.999783, -2.573402, 0.7294118, 1, 0, 1,
-0.7095229, -1.656775, -2.398241, 0.7215686, 1, 0, 1,
-0.7095175, -1.946904, -1.870291, 0.7176471, 1, 0, 1,
-0.7070079, -0.1421186, -2.338655, 0.7098039, 1, 0, 1,
-0.7047508, -2.392819, -1.752212, 0.7058824, 1, 0, 1,
-0.7016667, -0.6684788, -0.9614054, 0.6980392, 1, 0, 1,
-0.6966496, -1.159934, -3.429779, 0.6901961, 1, 0, 1,
-0.6959347, 0.9767672, -1.064987, 0.6862745, 1, 0, 1,
-0.6957777, -1.136588, -2.659233, 0.6784314, 1, 0, 1,
-0.6957589, 0.1234351, -1.977867, 0.6745098, 1, 0, 1,
-0.6940662, -2.294302, -3.129976, 0.6666667, 1, 0, 1,
-0.6924885, -1.460397, -2.237004, 0.6627451, 1, 0, 1,
-0.6866267, 0.4146384, -1.415992, 0.654902, 1, 0, 1,
-0.686058, -1.810947, -4.134319, 0.6509804, 1, 0, 1,
-0.6849211, -0.9385106, -0.09612877, 0.6431373, 1, 0, 1,
-0.6821951, 1.370861, -0.3516479, 0.6392157, 1, 0, 1,
-0.6780839, -0.7265403, -3.31801, 0.6313726, 1, 0, 1,
-0.6705115, -0.6332893, -2.76754, 0.627451, 1, 0, 1,
-0.6682, 0.4498918, -1.221005, 0.6196079, 1, 0, 1,
-0.6681669, -1.459139, -3.910057, 0.6156863, 1, 0, 1,
-0.6628718, -0.6117293, -2.013767, 0.6078432, 1, 0, 1,
-0.6606672, 0.5227523, -0.5025213, 0.6039216, 1, 0, 1,
-0.6445436, -0.1881143, -1.655035, 0.5960785, 1, 0, 1,
-0.6430104, 1.07723, -2.244987, 0.5882353, 1, 0, 1,
-0.6426556, -1.571598, -2.408351, 0.5843138, 1, 0, 1,
-0.6400908, 0.1001974, -4.147723, 0.5764706, 1, 0, 1,
-0.6301897, 1.255279, -2.532946, 0.572549, 1, 0, 1,
-0.6301671, -1.800458, -2.577223, 0.5647059, 1, 0, 1,
-0.6282508, 0.3343449, -2.193747, 0.5607843, 1, 0, 1,
-0.6240667, 0.1191328, -1.393905, 0.5529412, 1, 0, 1,
-0.6226988, -0.0911541, -3.450781, 0.5490196, 1, 0, 1,
-0.6186982, 0.1685034, -0.7451956, 0.5411765, 1, 0, 1,
-0.618114, -1.465571, -2.219184, 0.5372549, 1, 0, 1,
-0.6178083, -1.478179, -1.594696, 0.5294118, 1, 0, 1,
-0.6162306, -0.1981306, -1.483151, 0.5254902, 1, 0, 1,
-0.6058419, -0.02930615, -1.038399, 0.5176471, 1, 0, 1,
-0.5995145, -0.7411667, -0.9734043, 0.5137255, 1, 0, 1,
-0.5948468, 0.3509674, -1.053529, 0.5058824, 1, 0, 1,
-0.5885795, -0.1395479, -2.690562, 0.5019608, 1, 0, 1,
-0.5875211, -1.85791, -2.52727, 0.4941176, 1, 0, 1,
-0.5799916, 0.8307974, 0.5035769, 0.4862745, 1, 0, 1,
-0.5762613, 0.05080672, -1.096503, 0.4823529, 1, 0, 1,
-0.5714381, 0.6454833, -0.5034113, 0.4745098, 1, 0, 1,
-0.5711173, -0.1297075, -1.965363, 0.4705882, 1, 0, 1,
-0.5710341, -0.1603541, -2.773997, 0.4627451, 1, 0, 1,
-0.5709849, -0.549027, -2.307381, 0.4588235, 1, 0, 1,
-0.5700345, -0.535627, -2.139946, 0.4509804, 1, 0, 1,
-0.5692543, -0.3375281, -1.641389, 0.4470588, 1, 0, 1,
-0.5674924, -0.8949376, -1.772372, 0.4392157, 1, 0, 1,
-0.5658839, -0.5648823, -3.460076, 0.4352941, 1, 0, 1,
-0.5624243, -2.198477, -3.545444, 0.427451, 1, 0, 1,
-0.5600339, 0.5310797, -0.5950756, 0.4235294, 1, 0, 1,
-0.5538717, -0.739364, -2.392373, 0.4156863, 1, 0, 1,
-0.5493975, -0.324282, -2.716347, 0.4117647, 1, 0, 1,
-0.5442254, -0.2626774, -2.83949, 0.4039216, 1, 0, 1,
-0.5442096, 0.3006164, -1.102471, 0.3960784, 1, 0, 1,
-0.5430577, 1.460386, -0.8898413, 0.3921569, 1, 0, 1,
-0.5414236, 0.01592007, -1.527532, 0.3843137, 1, 0, 1,
-0.5360309, 0.209166, 0.5434887, 0.3803922, 1, 0, 1,
-0.5356694, -1.720808, -2.530087, 0.372549, 1, 0, 1,
-0.5332694, 0.1108306, -1.398939, 0.3686275, 1, 0, 1,
-0.5330269, 0.6965073, -0.1398199, 0.3607843, 1, 0, 1,
-0.5328388, 0.5756378, -1.502547, 0.3568628, 1, 0, 1,
-0.5278735, -1.098544, -3.084767, 0.3490196, 1, 0, 1,
-0.5263501, -2.485605, -2.706036, 0.345098, 1, 0, 1,
-0.5208057, 0.6330744, -0.1162982, 0.3372549, 1, 0, 1,
-0.51823, -0.1052373, -2.165789, 0.3333333, 1, 0, 1,
-0.5157778, -0.5566921, -1.909176, 0.3254902, 1, 0, 1,
-0.513063, 0.1565082, 0.4719651, 0.3215686, 1, 0, 1,
-0.511395, 0.8220357, -0.9717126, 0.3137255, 1, 0, 1,
-0.5087329, -0.4182625, -1.688007, 0.3098039, 1, 0, 1,
-0.5068639, 0.2314409, -0.4209522, 0.3019608, 1, 0, 1,
-0.5060706, -0.5092691, -3.249487, 0.2941177, 1, 0, 1,
-0.5028607, -0.6144391, -1.065452, 0.2901961, 1, 0, 1,
-0.4977707, -0.6800816, -3.048843, 0.282353, 1, 0, 1,
-0.4973496, 1.612294, -0.9484543, 0.2784314, 1, 0, 1,
-0.4972974, -1.123804, -1.091983, 0.2705882, 1, 0, 1,
-0.4944316, 1.086277, 0.2158792, 0.2666667, 1, 0, 1,
-0.4927819, -0.8595899, -1.510985, 0.2588235, 1, 0, 1,
-0.4924236, 1.998916, 0.4258775, 0.254902, 1, 0, 1,
-0.4867889, 0.9143608, 0.9829077, 0.2470588, 1, 0, 1,
-0.4841245, 1.144636, -0.3131662, 0.2431373, 1, 0, 1,
-0.4836499, 0.5033337, -1.939081, 0.2352941, 1, 0, 1,
-0.4835061, -1.047501, -2.403083, 0.2313726, 1, 0, 1,
-0.4793844, 1.09875, -0.9713725, 0.2235294, 1, 0, 1,
-0.4790765, 0.8631644, 0.1732207, 0.2196078, 1, 0, 1,
-0.4741607, 0.3688139, -1.23325, 0.2117647, 1, 0, 1,
-0.4729881, 0.3567678, -2.339961, 0.2078431, 1, 0, 1,
-0.4676722, 0.8225718, 0.7572533, 0.2, 1, 0, 1,
-0.466306, 1.517044, 1.203775, 0.1921569, 1, 0, 1,
-0.4624662, 0.4626777, -0.04712987, 0.1882353, 1, 0, 1,
-0.4621639, 0.915926, -1.205478, 0.1803922, 1, 0, 1,
-0.4593474, -0.6131414, -3.241194, 0.1764706, 1, 0, 1,
-0.4582553, 1.11271, -1.82106, 0.1686275, 1, 0, 1,
-0.4564798, 1.035215, -0.7864954, 0.1647059, 1, 0, 1,
-0.4564622, -0.3051173, -1.133418, 0.1568628, 1, 0, 1,
-0.4563812, -2.301865, -3.117328, 0.1529412, 1, 0, 1,
-0.4561546, -0.2306747, -2.788776, 0.145098, 1, 0, 1,
-0.4549043, -0.9311184, -3.39294, 0.1411765, 1, 0, 1,
-0.45049, -0.5088114, -2.320532, 0.1333333, 1, 0, 1,
-0.4499275, 0.778949, 0.5408759, 0.1294118, 1, 0, 1,
-0.4481453, 0.5170857, -0.09506146, 0.1215686, 1, 0, 1,
-0.4457504, -0.4647627, -1.035871, 0.1176471, 1, 0, 1,
-0.4451244, 0.09637389, -1.066054, 0.1098039, 1, 0, 1,
-0.4426574, 0.7833349, -0.9448576, 0.1058824, 1, 0, 1,
-0.4399864, -0.2501704, -3.78452, 0.09803922, 1, 0, 1,
-0.439152, 0.01003347, -1.853175, 0.09019608, 1, 0, 1,
-0.4340017, 0.8894464, -0.8648601, 0.08627451, 1, 0, 1,
-0.4335135, -0.8098256, -2.429986, 0.07843138, 1, 0, 1,
-0.4276073, 1.14355, -1.843935, 0.07450981, 1, 0, 1,
-0.4229899, 0.3021068, -1.39581, 0.06666667, 1, 0, 1,
-0.4221239, -1.376818, -1.910627, 0.0627451, 1, 0, 1,
-0.4171062, -0.99031, -3.434569, 0.05490196, 1, 0, 1,
-0.416431, -1.907084, -2.459961, 0.05098039, 1, 0, 1,
-0.4139219, 1.218073, -0.7106678, 0.04313726, 1, 0, 1,
-0.4134788, 0.9515157, -1.258698, 0.03921569, 1, 0, 1,
-0.4114253, -1.191317, -2.521845, 0.03137255, 1, 0, 1,
-0.4089338, -0.09113171, -3.217869, 0.02745098, 1, 0, 1,
-0.4066644, 0.773336, 0.02696848, 0.01960784, 1, 0, 1,
-0.4007365, -0.8657309, -3.964226, 0.01568628, 1, 0, 1,
-0.4001639, -0.02999585, -2.364351, 0.007843138, 1, 0, 1,
-0.3941947, -0.2802473, -2.464042, 0.003921569, 1, 0, 1,
-0.3901684, -0.5700293, -2.528833, 0, 1, 0.003921569, 1,
-0.3895653, 1.09363, -1.244291, 0, 1, 0.01176471, 1,
-0.3885505, -2.533368, -1.917192, 0, 1, 0.01568628, 1,
-0.3882713, -0.4685391, -3.111477, 0, 1, 0.02352941, 1,
-0.3875086, 0.1071085, -1.14419, 0, 1, 0.02745098, 1,
-0.3853502, 1.398832, -0.05260222, 0, 1, 0.03529412, 1,
-0.3841052, 0.1131297, -1.125282, 0, 1, 0.03921569, 1,
-0.3837616, -0.3125035, -2.642878, 0, 1, 0.04705882, 1,
-0.3822269, 0.01292127, -1.794037, 0, 1, 0.05098039, 1,
-0.3810547, -0.2118098, 0.1937256, 0, 1, 0.05882353, 1,
-0.3755626, 0.00759465, -0.4671007, 0, 1, 0.0627451, 1,
-0.3752811, -0.8078543, -1.80017, 0, 1, 0.07058824, 1,
-0.3701607, -0.8189909, -2.919453, 0, 1, 0.07450981, 1,
-0.3670609, -0.9961505, -2.268317, 0, 1, 0.08235294, 1,
-0.3651471, 0.1802006, -0.9947472, 0, 1, 0.08627451, 1,
-0.3651436, -0.3619499, -3.913153, 0, 1, 0.09411765, 1,
-0.3622148, 0.110986, 0.1364489, 0, 1, 0.1019608, 1,
-0.3619964, -0.6407517, -1.437959, 0, 1, 0.1058824, 1,
-0.3610598, -1.496858, -2.318157, 0, 1, 0.1137255, 1,
-0.3590211, -0.5293727, -2.333311, 0, 1, 0.1176471, 1,
-0.3579926, -0.9900224, -2.356907, 0, 1, 0.1254902, 1,
-0.3529085, -0.4431962, -1.321479, 0, 1, 0.1294118, 1,
-0.3498664, 0.2212466, 0.4805273, 0, 1, 0.1372549, 1,
-0.3379712, 0.3531507, 1.459293, 0, 1, 0.1411765, 1,
-0.3356608, -0.3971156, -2.65192, 0, 1, 0.1490196, 1,
-0.3354438, -1.329927, -4.456866, 0, 1, 0.1529412, 1,
-0.3341527, 1.88391, -1.332569, 0, 1, 0.1607843, 1,
-0.3315446, -2.404783, -3.113869, 0, 1, 0.1647059, 1,
-0.3313178, -0.01336379, -1.634963, 0, 1, 0.172549, 1,
-0.3300436, 0.1747225, -2.318041, 0, 1, 0.1764706, 1,
-0.3298814, -0.04018838, -1.137781, 0, 1, 0.1843137, 1,
-0.3223452, 0.43842, -0.4786029, 0, 1, 0.1882353, 1,
-0.3222543, 0.9387186, -0.6667524, 0, 1, 0.1960784, 1,
-0.321641, 0.3284776, -0.2593313, 0, 1, 0.2039216, 1,
-0.3156506, -0.2118186, -2.762169, 0, 1, 0.2078431, 1,
-0.3144182, 0.9804904, 2.228766, 0, 1, 0.2156863, 1,
-0.3132707, -2.097836, -1.902014, 0, 1, 0.2196078, 1,
-0.3109027, 0.670014, -0.256498, 0, 1, 0.227451, 1,
-0.3106509, -0.4977283, -1.91773, 0, 1, 0.2313726, 1,
-0.3088953, 0.4129339, -0.2195393, 0, 1, 0.2392157, 1,
-0.2984996, 1.135616, -1.720831, 0, 1, 0.2431373, 1,
-0.2976566, -0.4144191, -3.088877, 0, 1, 0.2509804, 1,
-0.2972864, -0.01328596, -1.847852, 0, 1, 0.254902, 1,
-0.2967915, -0.8765444, -3.298676, 0, 1, 0.2627451, 1,
-0.294052, 1.041721, 0.275104, 0, 1, 0.2666667, 1,
-0.2940021, -0.4630042, -1.438017, 0, 1, 0.2745098, 1,
-0.2938573, -1.650456, -2.621717, 0, 1, 0.2784314, 1,
-0.293532, -0.9642318, -0.3026493, 0, 1, 0.2862745, 1,
-0.2886061, 0.4401444, -0.5163466, 0, 1, 0.2901961, 1,
-0.2854989, 0.1621379, -2.277575, 0, 1, 0.2980392, 1,
-0.2833311, -0.9542669, -1.477335, 0, 1, 0.3058824, 1,
-0.2832498, -1.486162, -4.687401, 0, 1, 0.3098039, 1,
-0.2826757, -1.468162, -1.965739, 0, 1, 0.3176471, 1,
-0.2817235, 1.352262, -3.085055, 0, 1, 0.3215686, 1,
-0.2757281, -0.8373505, -0.8983073, 0, 1, 0.3294118, 1,
-0.2715929, -0.8214981, -2.604941, 0, 1, 0.3333333, 1,
-0.2706385, -0.752243, -2.259521, 0, 1, 0.3411765, 1,
-0.2690162, 1.126691, -0.9553906, 0, 1, 0.345098, 1,
-0.2624601, 0.7126912, 0.2161478, 0, 1, 0.3529412, 1,
-0.2622636, -0.8772234, -2.844308, 0, 1, 0.3568628, 1,
-0.261625, -0.7076313, -1.70852, 0, 1, 0.3647059, 1,
-0.2607809, -0.6126153, -2.553706, 0, 1, 0.3686275, 1,
-0.2545283, -1.05222, -4.270108, 0, 1, 0.3764706, 1,
-0.2526636, -1.51462, -1.640429, 0, 1, 0.3803922, 1,
-0.2489494, -0.7947716, -2.706333, 0, 1, 0.3882353, 1,
-0.2424433, -0.8508194, -2.22797, 0, 1, 0.3921569, 1,
-0.240659, -1.604981, -2.278565, 0, 1, 0.4, 1,
-0.2339657, 0.3955097, 0.2210487, 0, 1, 0.4078431, 1,
-0.2271162, 0.5061039, -1.372872, 0, 1, 0.4117647, 1,
-0.2234016, -1.796529, -3.688492, 0, 1, 0.4196078, 1,
-0.220405, -0.102841, -1.333134, 0, 1, 0.4235294, 1,
-0.2193638, 0.9771842, 1.260971, 0, 1, 0.4313726, 1,
-0.2185924, 1.049168, 0.3467419, 0, 1, 0.4352941, 1,
-0.2127124, 1.382604, -1.283761, 0, 1, 0.4431373, 1,
-0.2078049, 0.3597335, 0.3021801, 0, 1, 0.4470588, 1,
-0.2052618, 0.7470407, -1.227697, 0, 1, 0.454902, 1,
-0.203155, -1.357321, -2.181015, 0, 1, 0.4588235, 1,
-0.1987001, -1.432319, -3.10377, 0, 1, 0.4666667, 1,
-0.1967069, 1.470044, 0.1222317, 0, 1, 0.4705882, 1,
-0.1872074, -0.2643268, -2.390227, 0, 1, 0.4784314, 1,
-0.1828162, 0.8309563, -1.313589, 0, 1, 0.4823529, 1,
-0.1786914, -0.1376592, -2.93844, 0, 1, 0.4901961, 1,
-0.1785464, -0.6867077, -1.307593, 0, 1, 0.4941176, 1,
-0.1780114, 0.04581981, -2.857697, 0, 1, 0.5019608, 1,
-0.1728468, 0.9609595, 1.635569, 0, 1, 0.509804, 1,
-0.1622995, -0.2787057, -2.845925, 0, 1, 0.5137255, 1,
-0.16174, 0.4201628, -0.2762316, 0, 1, 0.5215687, 1,
-0.1616975, 0.05914087, -1.272761, 0, 1, 0.5254902, 1,
-0.1577863, 0.03861314, -1.882059, 0, 1, 0.5333334, 1,
-0.1565548, -0.6108427, -2.506588, 0, 1, 0.5372549, 1,
-0.1558559, -1.111308, -1.015827, 0, 1, 0.5450981, 1,
-0.1543078, 0.3912101, -0.5170869, 0, 1, 0.5490196, 1,
-0.1503269, -2.50321, -0.819312, 0, 1, 0.5568628, 1,
-0.1458018, -1.291174, -3.371303, 0, 1, 0.5607843, 1,
-0.1447486, -1.70832, -3.728597, 0, 1, 0.5686275, 1,
-0.1296479, 0.9745533, -0.8418141, 0, 1, 0.572549, 1,
-0.1217916, -0.3616481, -1.595453, 0, 1, 0.5803922, 1,
-0.1201206, -1.045101, -3.803653, 0, 1, 0.5843138, 1,
-0.1186666, -0.8072077, -2.474817, 0, 1, 0.5921569, 1,
-0.1178029, 0.4706076, -0.2863137, 0, 1, 0.5960785, 1,
-0.1157712, 1.726161, 0.3440196, 0, 1, 0.6039216, 1,
-0.1136884, -0.5922926, -4.564826, 0, 1, 0.6117647, 1,
-0.1104776, -1.225957, -3.792084, 0, 1, 0.6156863, 1,
-0.1076139, 0.5109854, -0.2713858, 0, 1, 0.6235294, 1,
-0.1071466, 0.7520241, 1.602093, 0, 1, 0.627451, 1,
-0.10642, -0.8920372, -3.554668, 0, 1, 0.6352941, 1,
-0.09995998, -1.099607, -3.02998, 0, 1, 0.6392157, 1,
-0.09214064, 0.6076485, 1.115077, 0, 1, 0.6470588, 1,
-0.08959303, -1.867663, -2.948346, 0, 1, 0.6509804, 1,
-0.08398286, 0.3144355, 0.6050197, 0, 1, 0.6588235, 1,
-0.08294743, 1.566464, -0.71165, 0, 1, 0.6627451, 1,
-0.07887635, -0.3782032, -3.664618, 0, 1, 0.6705883, 1,
-0.07837771, 0.2306971, -0.2055891, 0, 1, 0.6745098, 1,
-0.07786112, -0.6948103, -2.282049, 0, 1, 0.682353, 1,
-0.07699201, -0.9568157, -4.707224, 0, 1, 0.6862745, 1,
-0.0763741, -2.193957, -4.814108, 0, 1, 0.6941177, 1,
-0.07590585, -1.081348, -1.912645, 0, 1, 0.7019608, 1,
-0.07521708, 0.2054753, -0.4592075, 0, 1, 0.7058824, 1,
-0.07055563, -0.1438662, -3.14012, 0, 1, 0.7137255, 1,
-0.06588513, -0.7276574, -4.257007, 0, 1, 0.7176471, 1,
-0.06310637, 0.2200357, 0.4753692, 0, 1, 0.7254902, 1,
-0.0613391, -2.591682, -3.880957, 0, 1, 0.7294118, 1,
-0.05940604, -1.30864, -2.149585, 0, 1, 0.7372549, 1,
-0.05917547, 1.186509, -0.8025932, 0, 1, 0.7411765, 1,
-0.05768847, -0.7279793, -3.303444, 0, 1, 0.7490196, 1,
-0.05172279, -1.013336, -3.865533, 0, 1, 0.7529412, 1,
-0.04976592, 0.4535289, -0.1032204, 0, 1, 0.7607843, 1,
-0.04954713, -1.542964, -2.96222, 0, 1, 0.7647059, 1,
-0.04753514, 0.07805403, -1.550552, 0, 1, 0.772549, 1,
-0.04567913, 0.1858732, 0.7202344, 0, 1, 0.7764706, 1,
-0.04415271, -0.6451169, -2.641821, 0, 1, 0.7843137, 1,
-0.04233135, 0.7076743, 1.706805, 0, 1, 0.7882353, 1,
-0.03527756, -2.329933, -4.22151, 0, 1, 0.7960784, 1,
-0.03060221, 1.557055, 0.2377561, 0, 1, 0.8039216, 1,
-0.02523527, -2.236136, -3.240628, 0, 1, 0.8078431, 1,
-0.02198688, 0.2805136, 1.142638, 0, 1, 0.8156863, 1,
-0.02164316, 0.4495501, -0.2992726, 0, 1, 0.8196079, 1,
-0.02100151, 1.864737, 1.393895, 0, 1, 0.827451, 1,
-0.01967762, 1.421519, -1.014891, 0, 1, 0.8313726, 1,
-0.01135021, 0.4931194, 0.6845861, 0, 1, 0.8392157, 1,
-0.008060074, 0.2660136, 1.017854, 0, 1, 0.8431373, 1,
-0.007687307, 0.9132855, 1.125447, 0, 1, 0.8509804, 1,
-0.004773865, -1.319873, -4.826604, 0, 1, 0.854902, 1,
-0.003231644, -0.2925906, -1.278682, 0, 1, 0.8627451, 1,
-0.00014062, -0.2616268, -3.294735, 0, 1, 0.8666667, 1,
0.0004075514, 1.164997, -1.702885, 0, 1, 0.8745098, 1,
0.001992432, 0.8928934, -1.051803, 0, 1, 0.8784314, 1,
0.003740515, 0.972452, -2.474029, 0, 1, 0.8862745, 1,
0.01283459, 0.6952085, -0.1242311, 0, 1, 0.8901961, 1,
0.01607822, 0.5168326, 0.8158895, 0, 1, 0.8980392, 1,
0.01623978, 0.5666733, 0.6616895, 0, 1, 0.9058824, 1,
0.01944546, -0.01470581, 3.037536, 0, 1, 0.9098039, 1,
0.02291104, -1.142573, 3.218542, 0, 1, 0.9176471, 1,
0.02311258, -0.8565756, 3.507673, 0, 1, 0.9215686, 1,
0.02385456, 0.9412947, -0.4550907, 0, 1, 0.9294118, 1,
0.02391027, -0.7569433, 4.154085, 0, 1, 0.9333333, 1,
0.02457839, -0.8675866, 3.689936, 0, 1, 0.9411765, 1,
0.02560643, -1.10078, 3.00567, 0, 1, 0.945098, 1,
0.02677268, 0.4060545, -0.07989489, 0, 1, 0.9529412, 1,
0.02721382, -0.0763258, 3.169506, 0, 1, 0.9568627, 1,
0.03607115, -0.04721469, 1.835023, 0, 1, 0.9647059, 1,
0.03647369, -0.303023, 3.236814, 0, 1, 0.9686275, 1,
0.03703722, 0.7803923, -0.6859234, 0, 1, 0.9764706, 1,
0.03881502, 0.8453968, -1.38302, 0, 1, 0.9803922, 1,
0.03884913, 0.5658937, -0.0339482, 0, 1, 0.9882353, 1,
0.04148453, -2.03215, 2.839444, 0, 1, 0.9921569, 1,
0.04374433, -0.03915313, 2.344992, 0, 1, 1, 1,
0.04853094, 0.7086011, -0.36149, 0, 0.9921569, 1, 1,
0.05425721, -0.8003346, 4.28425, 0, 0.9882353, 1, 1,
0.05965284, -0.1182131, 4.456236, 0, 0.9803922, 1, 1,
0.06012868, 1.884122, -1.235204, 0, 0.9764706, 1, 1,
0.06168643, -0.3497957, 3.237428, 0, 0.9686275, 1, 1,
0.06211282, -0.4510036, 4.18654, 0, 0.9647059, 1, 1,
0.06884155, -0.7750006, 2.83455, 0, 0.9568627, 1, 1,
0.06931715, -0.02367179, 0.9790193, 0, 0.9529412, 1, 1,
0.07117555, 0.09584987, 0.7934631, 0, 0.945098, 1, 1,
0.07250187, -2.094923, 4.802655, 0, 0.9411765, 1, 1,
0.07257644, 1.798208, 1.76623, 0, 0.9333333, 1, 1,
0.07280838, -1.379309, 3.972479, 0, 0.9294118, 1, 1,
0.07650615, 0.9704207, -0.6948947, 0, 0.9215686, 1, 1,
0.07822071, 0.5965604, 0.9446731, 0, 0.9176471, 1, 1,
0.08491613, -0.2642673, 2.73774, 0, 0.9098039, 1, 1,
0.08941536, 1.703574, -0.118352, 0, 0.9058824, 1, 1,
0.09058487, 0.4769394, -1.06547, 0, 0.8980392, 1, 1,
0.09397541, -0.8751304, 3.601381, 0, 0.8901961, 1, 1,
0.09520771, -1.258176, 2.484324, 0, 0.8862745, 1, 1,
0.09608276, -0.8080547, 3.522167, 0, 0.8784314, 1, 1,
0.1034133, 0.353744, 2.600911, 0, 0.8745098, 1, 1,
0.1044462, -0.5811855, 4.661318, 0, 0.8666667, 1, 1,
0.1051338, -0.4667005, 1.512958, 0, 0.8627451, 1, 1,
0.1076308, -1.953203, 2.371178, 0, 0.854902, 1, 1,
0.1101314, -0.1057642, 4.392619, 0, 0.8509804, 1, 1,
0.1134002, -0.8274554, 2.620454, 0, 0.8431373, 1, 1,
0.1135674, 0.8369612, 0.487434, 0, 0.8392157, 1, 1,
0.1156705, -0.3640755, 1.379168, 0, 0.8313726, 1, 1,
0.1157058, 0.4407994, -0.5014793, 0, 0.827451, 1, 1,
0.1189215, 1.007914, 0.07505289, 0, 0.8196079, 1, 1,
0.1213304, -0.369295, 2.370509, 0, 0.8156863, 1, 1,
0.1220347, 0.4679613, 1.167865, 0, 0.8078431, 1, 1,
0.1253149, 1.612947, -0.808797, 0, 0.8039216, 1, 1,
0.1257359, 0.02740891, 1.819807, 0, 0.7960784, 1, 1,
0.125811, -0.334854, 2.958091, 0, 0.7882353, 1, 1,
0.131778, 1.150189, 0.3739822, 0, 0.7843137, 1, 1,
0.1328492, 0.2577519, 0.9015089, 0, 0.7764706, 1, 1,
0.1335818, -1.184425, 3.457453, 0, 0.772549, 1, 1,
0.1365506, 0.224491, -0.1856702, 0, 0.7647059, 1, 1,
0.1378177, -1.097411, 4.169433, 0, 0.7607843, 1, 1,
0.1411042, 1.413448, 0.6586354, 0, 0.7529412, 1, 1,
0.1430125, 0.444283, 0.976654, 0, 0.7490196, 1, 1,
0.1445175, 0.00127228, 1.80133, 0, 0.7411765, 1, 1,
0.1470945, -0.8823903, 2.545261, 0, 0.7372549, 1, 1,
0.1485104, 1.483423, -0.0711108, 0, 0.7294118, 1, 1,
0.1491937, -1.535923, 2.928055, 0, 0.7254902, 1, 1,
0.1500692, -0.6011741, 2.773624, 0, 0.7176471, 1, 1,
0.15049, 0.04163863, 3.054199, 0, 0.7137255, 1, 1,
0.1520277, 1.926439, 0.0646755, 0, 0.7058824, 1, 1,
0.158631, -1.029926, 2.95391, 0, 0.6980392, 1, 1,
0.1636429, 1.152271, -0.3374802, 0, 0.6941177, 1, 1,
0.1643412, -0.3842733, 1.924675, 0, 0.6862745, 1, 1,
0.1649063, 0.3762072, -0.7184359, 0, 0.682353, 1, 1,
0.1690261, 1.586994, 0.1250149, 0, 0.6745098, 1, 1,
0.1709864, 0.2490352, 0.5237331, 0, 0.6705883, 1, 1,
0.1732965, 0.4761313, -0.06635848, 0, 0.6627451, 1, 1,
0.1745504, 0.2960164, 0.3882723, 0, 0.6588235, 1, 1,
0.1747571, 1.980152, -0.08257736, 0, 0.6509804, 1, 1,
0.1793683, 0.3058334, 2.991471, 0, 0.6470588, 1, 1,
0.1807022, 2.196377, 0.3522823, 0, 0.6392157, 1, 1,
0.1825904, 0.683161, 1.054181, 0, 0.6352941, 1, 1,
0.1828988, -2.026402, 3.609623, 0, 0.627451, 1, 1,
0.184582, 0.2512924, 2.911424, 0, 0.6235294, 1, 1,
0.1888857, -0.8265418, 3.077165, 0, 0.6156863, 1, 1,
0.1900436, 0.3107265, 0.5751871, 0, 0.6117647, 1, 1,
0.190175, -0.6529225, 2.007062, 0, 0.6039216, 1, 1,
0.1902926, 1.07844, 0.224408, 0, 0.5960785, 1, 1,
0.1904387, 0.7747145, 1.071593, 0, 0.5921569, 1, 1,
0.1938187, -0.2758197, 2.881573, 0, 0.5843138, 1, 1,
0.1943662, 0.2461823, 0.9141777, 0, 0.5803922, 1, 1,
0.1950091, -0.7741606, 2.110291, 0, 0.572549, 1, 1,
0.1969625, -0.9029936, 2.063349, 0, 0.5686275, 1, 1,
0.1997657, 0.3027382, 0.1464371, 0, 0.5607843, 1, 1,
0.2017488, -0.3750236, 3.048278, 0, 0.5568628, 1, 1,
0.2022667, -1.572658, 4.07907, 0, 0.5490196, 1, 1,
0.2045518, -0.1308296, 2.349434, 0, 0.5450981, 1, 1,
0.2069021, 0.4080846, 1.45086, 0, 0.5372549, 1, 1,
0.2075692, -0.719568, 2.24461, 0, 0.5333334, 1, 1,
0.2109983, -0.2625896, 1.813766, 0, 0.5254902, 1, 1,
0.2161668, 0.1120541, 0.11745, 0, 0.5215687, 1, 1,
0.2184998, 0.2405687, 1.873267, 0, 0.5137255, 1, 1,
0.2214851, 0.04803462, -0.7688625, 0, 0.509804, 1, 1,
0.2231254, 0.7192639, 0.1089202, 0, 0.5019608, 1, 1,
0.2239616, 0.7086331, 1.35064, 0, 0.4941176, 1, 1,
0.2257885, -0.5096203, 2.1335, 0, 0.4901961, 1, 1,
0.2258724, 1.080364, 1.511264, 0, 0.4823529, 1, 1,
0.2259393, -1.606302, 2.905792, 0, 0.4784314, 1, 1,
0.2322907, 0.7400271, -1.055076, 0, 0.4705882, 1, 1,
0.2329855, 2.138691, 1.653824, 0, 0.4666667, 1, 1,
0.2342255, -0.1359248, 1.862724, 0, 0.4588235, 1, 1,
0.2353423, -1.207728, 2.320789, 0, 0.454902, 1, 1,
0.2354519, 0.3101795, 0.1329323, 0, 0.4470588, 1, 1,
0.2410105, -0.109681, 2.591583, 0, 0.4431373, 1, 1,
0.2444641, -0.2601632, 2.123945, 0, 0.4352941, 1, 1,
0.2488176, 0.6080405, 0.7711196, 0, 0.4313726, 1, 1,
0.2522539, -0.4236786, 3.692221, 0, 0.4235294, 1, 1,
0.252313, -0.4623641, 2.51103, 0, 0.4196078, 1, 1,
0.253198, 0.6219672, 1.301918, 0, 0.4117647, 1, 1,
0.2543172, -0.5375023, 3.060745, 0, 0.4078431, 1, 1,
0.2561586, -0.6297275, 4.852283, 0, 0.4, 1, 1,
0.2633221, -0.905384, 2.368387, 0, 0.3921569, 1, 1,
0.2636549, 1.621865, -0.5393095, 0, 0.3882353, 1, 1,
0.2657702, 0.5324132, 1.136665, 0, 0.3803922, 1, 1,
0.2662708, -0.06589884, 0.1960068, 0, 0.3764706, 1, 1,
0.2697473, 1.8196, -0.06932343, 0, 0.3686275, 1, 1,
0.2706396, -0.3949965, 0.9978305, 0, 0.3647059, 1, 1,
0.273067, -0.5469936, 2.368642, 0, 0.3568628, 1, 1,
0.2731564, -0.6005064, 1.429315, 0, 0.3529412, 1, 1,
0.2763689, 0.798717, 1.392098, 0, 0.345098, 1, 1,
0.2779253, -0.4979908, 4.418079, 0, 0.3411765, 1, 1,
0.2814828, 0.8706633, -0.142167, 0, 0.3333333, 1, 1,
0.2820755, 1.100261, 0.2804706, 0, 0.3294118, 1, 1,
0.2845974, -0.8520446, 2.417355, 0, 0.3215686, 1, 1,
0.2876389, 0.03754317, 0.2123773, 0, 0.3176471, 1, 1,
0.292148, -0.7946856, 3.359887, 0, 0.3098039, 1, 1,
0.2970603, 1.50981, 2.776862, 0, 0.3058824, 1, 1,
0.2972721, -0.1136026, 2.767149, 0, 0.2980392, 1, 1,
0.2989497, -0.5626605, 3.237188, 0, 0.2901961, 1, 1,
0.2997571, -0.3924842, 2.450312, 0, 0.2862745, 1, 1,
0.3031963, 1.962084, -0.3780615, 0, 0.2784314, 1, 1,
0.3060009, -0.05816273, 1.171412, 0, 0.2745098, 1, 1,
0.3068802, 0.6202175, 1.143326, 0, 0.2666667, 1, 1,
0.3143414, -0.8249525, 4.384348, 0, 0.2627451, 1, 1,
0.3167391, -1.285978, 1.573655, 0, 0.254902, 1, 1,
0.3182544, 0.7648772, 0.2453814, 0, 0.2509804, 1, 1,
0.3215754, 0.3045665, -0.06906933, 0, 0.2431373, 1, 1,
0.3232262, -0.9615135, 2.987692, 0, 0.2392157, 1, 1,
0.3244903, 0.1697266, -0.9665968, 0, 0.2313726, 1, 1,
0.3253426, -2.326357, 3.597991, 0, 0.227451, 1, 1,
0.327572, 0.6302974, 0.828917, 0, 0.2196078, 1, 1,
0.3281729, -0.6272377, 2.646107, 0, 0.2156863, 1, 1,
0.3318239, -0.5614617, 1.551506, 0, 0.2078431, 1, 1,
0.333227, 0.8225538, 0.5885291, 0, 0.2039216, 1, 1,
0.3381074, -2.056639, 2.289251, 0, 0.1960784, 1, 1,
0.3449734, 0.4501497, 0.204942, 0, 0.1882353, 1, 1,
0.3487645, -1.047782, 3.81885, 0, 0.1843137, 1, 1,
0.3545432, -0.7497253, 4.14053, 0, 0.1764706, 1, 1,
0.3545461, 0.26696, 0.8458855, 0, 0.172549, 1, 1,
0.3565827, -0.7026252, 2.474134, 0, 0.1647059, 1, 1,
0.3582138, -1.0638, 2.101689, 0, 0.1607843, 1, 1,
0.3584778, -0.1404458, 0.4456485, 0, 0.1529412, 1, 1,
0.3585947, -0.1117592, 0.2078391, 0, 0.1490196, 1, 1,
0.3592803, -0.9076987, 2.807839, 0, 0.1411765, 1, 1,
0.3629947, -0.3163818, 2.890926, 0, 0.1372549, 1, 1,
0.3636826, -0.3397048, 4.56878, 0, 0.1294118, 1, 1,
0.3644143, -1.057514, 3.384568, 0, 0.1254902, 1, 1,
0.3672011, -0.8856688, 1.79376, 0, 0.1176471, 1, 1,
0.3685483, -1.772417, 1.665658, 0, 0.1137255, 1, 1,
0.3712845, 1.126513, -0.4262162, 0, 0.1058824, 1, 1,
0.3726025, -0.3401858, 3.332142, 0, 0.09803922, 1, 1,
0.3762334, 1.29575, 0.04691995, 0, 0.09411765, 1, 1,
0.3765457, 0.01577339, 0.3726245, 0, 0.08627451, 1, 1,
0.377558, -0.3427724, 3.016123, 0, 0.08235294, 1, 1,
0.3782376, -0.6010919, 1.245992, 0, 0.07450981, 1, 1,
0.3786421, -1.044042, 2.742661, 0, 0.07058824, 1, 1,
0.3797588, 0.2628269, 1.609833, 0, 0.0627451, 1, 1,
0.3830378, 0.5675145, -0.6001316, 0, 0.05882353, 1, 1,
0.3855413, -0.2675073, 2.584114, 0, 0.05098039, 1, 1,
0.3887517, -0.5562653, 3.265894, 0, 0.04705882, 1, 1,
0.3888849, -1.754742, 3.428756, 0, 0.03921569, 1, 1,
0.3939579, 0.4545857, 2.668447, 0, 0.03529412, 1, 1,
0.3943391, -0.2343823, 2.662144, 0, 0.02745098, 1, 1,
0.4095015, -1.420958, 3.274233, 0, 0.02352941, 1, 1,
0.4132652, 0.7905908, 0.6390401, 0, 0.01568628, 1, 1,
0.4156133, -0.4436561, 4.335932, 0, 0.01176471, 1, 1,
0.4157414, 0.8718125, 3.110852, 0, 0.003921569, 1, 1,
0.4191022, 1.0131, 0.3744822, 0.003921569, 0, 1, 1,
0.4202873, -0.07687779, 0.359271, 0.007843138, 0, 1, 1,
0.4232253, 0.4700488, 0.543557, 0.01568628, 0, 1, 1,
0.4238429, 0.4432735, 1.471417, 0.01960784, 0, 1, 1,
0.4262995, 1.631634, -0.02439845, 0.02745098, 0, 1, 1,
0.4264563, 0.3167523, 1.497156, 0.03137255, 0, 1, 1,
0.4289813, -0.8572368, 3.401325, 0.03921569, 0, 1, 1,
0.4298716, -0.7870721, 0.8093544, 0.04313726, 0, 1, 1,
0.4321602, 0.8480878, -0.2935993, 0.05098039, 0, 1, 1,
0.4332311, -0.5532157, 1.630909, 0.05490196, 0, 1, 1,
0.4514023, -0.9456416, 2.53278, 0.0627451, 0, 1, 1,
0.4545018, -2.106596, 2.912674, 0.06666667, 0, 1, 1,
0.4550774, -0.09401067, 1.459495, 0.07450981, 0, 1, 1,
0.4554753, 0.2713319, 1.121423, 0.07843138, 0, 1, 1,
0.4555978, -0.2129377, 1.450351, 0.08627451, 0, 1, 1,
0.46333, -2.404335, 2.555571, 0.09019608, 0, 1, 1,
0.4684978, 1.328186, 0.4940615, 0.09803922, 0, 1, 1,
0.4701049, -0.508114, 2.878207, 0.1058824, 0, 1, 1,
0.4746952, -1.61678, 0.9151447, 0.1098039, 0, 1, 1,
0.4764657, 0.2683865, 1.532115, 0.1176471, 0, 1, 1,
0.4875236, 0.8755372, -0.07152171, 0.1215686, 0, 1, 1,
0.4900284, -0.9484736, 1.999419, 0.1294118, 0, 1, 1,
0.4929881, -0.7239078, 4.373622, 0.1333333, 0, 1, 1,
0.5028443, 0.06706647, 1.329092, 0.1411765, 0, 1, 1,
0.5028837, 0.5873988, 0.1948642, 0.145098, 0, 1, 1,
0.5046641, -0.622589, 2.478187, 0.1529412, 0, 1, 1,
0.5070834, -0.3016572, 2.857227, 0.1568628, 0, 1, 1,
0.5084234, -0.2391934, 0.5149581, 0.1647059, 0, 1, 1,
0.5121539, -0.7022995, 1.696921, 0.1686275, 0, 1, 1,
0.5154279, -1.026532, 2.824813, 0.1764706, 0, 1, 1,
0.5174894, 0.3980091, 2.83386, 0.1803922, 0, 1, 1,
0.518985, -1.52926, 3.182299, 0.1882353, 0, 1, 1,
0.5191455, 2.043838, -2.165417, 0.1921569, 0, 1, 1,
0.5209759, 2.37044, 0.43765, 0.2, 0, 1, 1,
0.522163, -0.8148487, 4.675402, 0.2078431, 0, 1, 1,
0.5240585, 0.8087977, 0.3606886, 0.2117647, 0, 1, 1,
0.5307803, -0.5086795, 2.236452, 0.2196078, 0, 1, 1,
0.5330842, -0.165315, 1.363104, 0.2235294, 0, 1, 1,
0.538476, 0.4408039, 0.1666458, 0.2313726, 0, 1, 1,
0.5385666, 0.2035912, 2.893721, 0.2352941, 0, 1, 1,
0.5400388, -0.6209146, 2.347835, 0.2431373, 0, 1, 1,
0.5402153, -1.035571, 2.16364, 0.2470588, 0, 1, 1,
0.5424832, 0.5492046, 1.677679, 0.254902, 0, 1, 1,
0.5455962, -1.792871, 3.691719, 0.2588235, 0, 1, 1,
0.5495061, 1.103939, 0.6023165, 0.2666667, 0, 1, 1,
0.5550606, -1.536191, 3.815997, 0.2705882, 0, 1, 1,
0.5564672, -2.167987, 3.769516, 0.2784314, 0, 1, 1,
0.5575541, 1.746197, -0.00807769, 0.282353, 0, 1, 1,
0.5583374, -0.8775973, 3.697455, 0.2901961, 0, 1, 1,
0.5593437, 1.710518, -0.1907233, 0.2941177, 0, 1, 1,
0.5618303, 0.934499, 1.130557, 0.3019608, 0, 1, 1,
0.5626884, -1.51515, 1.557186, 0.3098039, 0, 1, 1,
0.5627922, 1.084407, 0.5579321, 0.3137255, 0, 1, 1,
0.5644104, -0.476847, 3.442179, 0.3215686, 0, 1, 1,
0.5656969, 0.6372471, 1.434661, 0.3254902, 0, 1, 1,
0.5706236, -0.6970471, 3.558743, 0.3333333, 0, 1, 1,
0.5712941, -2.747705, 4.266061, 0.3372549, 0, 1, 1,
0.5718299, 0.6912254, -0.8375303, 0.345098, 0, 1, 1,
0.572078, -0.1310701, 2.825666, 0.3490196, 0, 1, 1,
0.5733646, -1.365999, 2.392581, 0.3568628, 0, 1, 1,
0.5735555, 0.08287318, 1.003306, 0.3607843, 0, 1, 1,
0.5757245, 1.583175, -0.6748117, 0.3686275, 0, 1, 1,
0.5759931, 0.1908951, 2.087376, 0.372549, 0, 1, 1,
0.580841, 1.36636, 1.024956, 0.3803922, 0, 1, 1,
0.5813384, -1.040522, 2.060974, 0.3843137, 0, 1, 1,
0.5816047, -1.573847, 3.71154, 0.3921569, 0, 1, 1,
0.586233, 1.848248, 0.3922023, 0.3960784, 0, 1, 1,
0.5870866, -1.00202, 1.215405, 0.4039216, 0, 1, 1,
0.5892853, 0.6878679, 0.6988176, 0.4117647, 0, 1, 1,
0.5899696, 0.8535771, 1.171695, 0.4156863, 0, 1, 1,
0.5907797, 2.171168, 0.4815048, 0.4235294, 0, 1, 1,
0.5915642, -1.230368, 2.839405, 0.427451, 0, 1, 1,
0.5917275, 0.6601608, 0.3969913, 0.4352941, 0, 1, 1,
0.5946468, -0.885, 2.601684, 0.4392157, 0, 1, 1,
0.5980576, 1.060051, 0.7274747, 0.4470588, 0, 1, 1,
0.6016592, -0.5288017, 2.495049, 0.4509804, 0, 1, 1,
0.6042594, 0.7173484, -1.225269, 0.4588235, 0, 1, 1,
0.6073756, 0.7647926, 0.9647339, 0.4627451, 0, 1, 1,
0.6185542, 1.015696, 1.245748, 0.4705882, 0, 1, 1,
0.6191705, -0.01118306, 0.6742046, 0.4745098, 0, 1, 1,
0.6196435, -0.8029951, 4.047922, 0.4823529, 0, 1, 1,
0.6218168, 1.132085, -1.533321, 0.4862745, 0, 1, 1,
0.6259034, 0.8076303, 0.5641236, 0.4941176, 0, 1, 1,
0.626238, 1.183986, 1.272711, 0.5019608, 0, 1, 1,
0.6303554, 0.4792172, -0.6198208, 0.5058824, 0, 1, 1,
0.6455346, 1.48299, 0.0865833, 0.5137255, 0, 1, 1,
0.6480658, 0.4679129, 0.02085431, 0.5176471, 0, 1, 1,
0.6505346, 0.7813995, 3.894355, 0.5254902, 0, 1, 1,
0.6538336, -0.2986563, 1.410247, 0.5294118, 0, 1, 1,
0.6547907, -0.3829371, 2.074452, 0.5372549, 0, 1, 1,
0.6548316, -0.8882251, 3.77874, 0.5411765, 0, 1, 1,
0.6553742, 0.964783, 1.924704, 0.5490196, 0, 1, 1,
0.6560853, -0.2158899, 3.274692, 0.5529412, 0, 1, 1,
0.6564118, 0.02503504, 2.13333, 0.5607843, 0, 1, 1,
0.6585079, 0.9251813, 0.8790621, 0.5647059, 0, 1, 1,
0.6589663, -0.4155142, 2.24091, 0.572549, 0, 1, 1,
0.660297, -0.6175228, 0.01792077, 0.5764706, 0, 1, 1,
0.6625438, -0.2093256, 2.772975, 0.5843138, 0, 1, 1,
0.6638274, -0.04336573, 0.05373052, 0.5882353, 0, 1, 1,
0.6685049, -1.065145, 1.250198, 0.5960785, 0, 1, 1,
0.6698613, 0.07469951, 0.8005112, 0.6039216, 0, 1, 1,
0.6721175, 0.3054732, 2.132479, 0.6078432, 0, 1, 1,
0.6755008, 0.2967366, -0.1716659, 0.6156863, 0, 1, 1,
0.6764033, 0.1557551, 1.886287, 0.6196079, 0, 1, 1,
0.6796803, 0.478943, -0.1854485, 0.627451, 0, 1, 1,
0.6802812, 0.2184418, 1.52266, 0.6313726, 0, 1, 1,
0.681848, 0.07128502, 1.197171, 0.6392157, 0, 1, 1,
0.6832286, -0.3104142, 1.851437, 0.6431373, 0, 1, 1,
0.6895288, 0.6957724, 1.729944, 0.6509804, 0, 1, 1,
0.691583, -0.3845207, 1.317527, 0.654902, 0, 1, 1,
0.6926738, -0.5301262, 3.404656, 0.6627451, 0, 1, 1,
0.6994541, 1.605879, -0.888256, 0.6666667, 0, 1, 1,
0.7007929, 1.65866, 0.2843141, 0.6745098, 0, 1, 1,
0.702867, 0.03416111, 0.9401457, 0.6784314, 0, 1, 1,
0.7061447, -0.9474274, 3.556535, 0.6862745, 0, 1, 1,
0.7093194, -0.3431203, 3.112608, 0.6901961, 0, 1, 1,
0.7112698, 0.6939111, -0.1328707, 0.6980392, 0, 1, 1,
0.7118189, -1.556801, 3.102056, 0.7058824, 0, 1, 1,
0.7142164, 0.4639523, 1.649231, 0.7098039, 0, 1, 1,
0.7149448, 0.3860683, 1.256011, 0.7176471, 0, 1, 1,
0.7183868, -0.02289853, 1.100984, 0.7215686, 0, 1, 1,
0.7185524, 0.4234818, 2.045919, 0.7294118, 0, 1, 1,
0.7190453, 0.5411258, -0.758073, 0.7333333, 0, 1, 1,
0.7264462, -1.393016, 4.104178, 0.7411765, 0, 1, 1,
0.7278767, -1.674836, 3.392708, 0.7450981, 0, 1, 1,
0.7379999, 1.335083, 0.5362859, 0.7529412, 0, 1, 1,
0.7397277, 0.195288, 1.0271, 0.7568628, 0, 1, 1,
0.7428451, -0.8784622, 4.430837, 0.7647059, 0, 1, 1,
0.7429776, 1.261885, -0.2716019, 0.7686275, 0, 1, 1,
0.7462366, 0.0328324, 2.058533, 0.7764706, 0, 1, 1,
0.7509735, 1.134072, -0.146449, 0.7803922, 0, 1, 1,
0.7653773, 0.02642727, 1.89977, 0.7882353, 0, 1, 1,
0.7711135, -0.09756247, 0.847801, 0.7921569, 0, 1, 1,
0.7747805, -1.171537, 2.712906, 0.8, 0, 1, 1,
0.7882257, 0.3698849, 1.978539, 0.8078431, 0, 1, 1,
0.7886258, -1.336869, 3.896942, 0.8117647, 0, 1, 1,
0.7908539, 1.264515, -0.7172095, 0.8196079, 0, 1, 1,
0.7993436, -0.9192121, -0.07346731, 0.8235294, 0, 1, 1,
0.8078005, 0.8848878, 1.323368, 0.8313726, 0, 1, 1,
0.8101182, 1.553896, 1.260491, 0.8352941, 0, 1, 1,
0.8113968, 0.3889605, 1.601731, 0.8431373, 0, 1, 1,
0.8151352, -0.2531286, 1.769379, 0.8470588, 0, 1, 1,
0.8173513, -1.082189, 1.100105, 0.854902, 0, 1, 1,
0.8263557, 1.587145, -0.1553487, 0.8588235, 0, 1, 1,
0.8323966, -0.6827747, 1.11657, 0.8666667, 0, 1, 1,
0.8470235, -0.5163597, 1.324923, 0.8705882, 0, 1, 1,
0.8475094, 0.6853011, 1.166898, 0.8784314, 0, 1, 1,
0.8506096, 0.3269668, 0.5492755, 0.8823529, 0, 1, 1,
0.8516072, -0.4788101, 1.663617, 0.8901961, 0, 1, 1,
0.8632538, 1.467694, 1.482355, 0.8941177, 0, 1, 1,
0.8651877, 1.405693, -1.413321, 0.9019608, 0, 1, 1,
0.8668115, 0.6740527, 2.481026, 0.9098039, 0, 1, 1,
0.8718719, 0.3871666, 1.428409, 0.9137255, 0, 1, 1,
0.8769829, 0.03677965, 1.610034, 0.9215686, 0, 1, 1,
0.8776891, -0.03803545, 2.40061, 0.9254902, 0, 1, 1,
0.8798316, -0.3340285, 1.728216, 0.9333333, 0, 1, 1,
0.8798787, -1.072178, 1.388772, 0.9372549, 0, 1, 1,
0.8811921, 0.7452251, 0.2963368, 0.945098, 0, 1, 1,
0.8903058, 0.08619989, 2.199798, 0.9490196, 0, 1, 1,
0.8919572, 0.7397485, 0.2162597, 0.9568627, 0, 1, 1,
0.8937071, 0.9666134, 1.582397, 0.9607843, 0, 1, 1,
0.8958183, -0.3608896, 1.078785, 0.9686275, 0, 1, 1,
0.8989987, 0.35866, -0.02854462, 0.972549, 0, 1, 1,
0.9011719, -0.1844234, 1.132782, 0.9803922, 0, 1, 1,
0.9077712, 0.6672124, 0.8256924, 0.9843137, 0, 1, 1,
0.9093651, 0.9880527, 2.016665, 0.9921569, 0, 1, 1,
0.9181678, -1.554911, 4.006139, 0.9960784, 0, 1, 1,
0.9196135, -0.5980367, 2.239354, 1, 0, 0.9960784, 1,
0.9244521, -0.4972843, 2.546642, 1, 0, 0.9882353, 1,
0.9245089, 1.586359, 0.6633925, 1, 0, 0.9843137, 1,
0.9246799, -0.9127424, 3.736963, 1, 0, 0.9764706, 1,
0.9254696, 1.007237, 1.070232, 1, 0, 0.972549, 1,
0.9284247, -0.0985354, 0.9673818, 1, 0, 0.9647059, 1,
0.9298987, 0.724477, 0.4230188, 1, 0, 0.9607843, 1,
0.9331647, 0.1268742, 1.897887, 1, 0, 0.9529412, 1,
0.934041, 0.8268233, 0.6710113, 1, 0, 0.9490196, 1,
0.9402553, -0.5206503, 1.932368, 1, 0, 0.9411765, 1,
0.9411511, 0.05778876, 0.1789848, 1, 0, 0.9372549, 1,
0.9421008, -1.016657, 3.480457, 1, 0, 0.9294118, 1,
0.9435846, 0.6342975, 0.9653755, 1, 0, 0.9254902, 1,
0.9497868, 0.4881645, 1.325564, 1, 0, 0.9176471, 1,
0.9501736, 1.048625, 0.2222101, 1, 0, 0.9137255, 1,
0.9566598, -0.9493523, 4.096129, 1, 0, 0.9058824, 1,
0.9600716, 0.2167524, 2.501545, 1, 0, 0.9019608, 1,
0.9646029, 0.6751944, 1.455536, 1, 0, 0.8941177, 1,
0.9777153, 0.08098354, 1.553931, 1, 0, 0.8862745, 1,
0.9779524, 0.08305, 0.9587648, 1, 0, 0.8823529, 1,
0.9792481, -0.5865293, 1.300191, 1, 0, 0.8745098, 1,
0.9883443, -0.09515577, 1.526445, 1, 0, 0.8705882, 1,
0.9885659, 0.2626366, 1.229601, 1, 0, 0.8627451, 1,
0.9889566, 0.0785042, 2.819475, 1, 0, 0.8588235, 1,
0.9889805, -0.200962, 1.916291, 1, 0, 0.8509804, 1,
0.9910696, 0.638195, 1.985336, 1, 0, 0.8470588, 1,
0.992799, 0.9352263, 2.077889, 1, 0, 0.8392157, 1,
0.9931037, 1.444254, 0.6154199, 1, 0, 0.8352941, 1,
0.9951522, 1.602151, 0.06637435, 1, 0, 0.827451, 1,
1.003082, 0.1663484, 0.563233, 1, 0, 0.8235294, 1,
1.003954, -1.455981, 1.292951, 1, 0, 0.8156863, 1,
1.011603, -0.01344351, 3.045465, 1, 0, 0.8117647, 1,
1.014418, 1.419942, 2.650573, 1, 0, 0.8039216, 1,
1.014918, -0.03681399, 1.602475, 1, 0, 0.7960784, 1,
1.015944, -1.157294, 0.9355615, 1, 0, 0.7921569, 1,
1.017447, -1.671376, 4.25303, 1, 0, 0.7843137, 1,
1.019344, 0.9869162, 0.9480664, 1, 0, 0.7803922, 1,
1.019957, 1.823467, 0.8009639, 1, 0, 0.772549, 1,
1.02667, -0.4483775, 3.151365, 1, 0, 0.7686275, 1,
1.052854, 1.318598, -0.2026066, 1, 0, 0.7607843, 1,
1.070479, 0.7887212, 0.2248715, 1, 0, 0.7568628, 1,
1.079224, 1.680702, 0.757281, 1, 0, 0.7490196, 1,
1.088331, 2.021187, -0.08893474, 1, 0, 0.7450981, 1,
1.106978, -0.9742683, 1.64258, 1, 0, 0.7372549, 1,
1.112716, -0.6025862, 2.042607, 1, 0, 0.7333333, 1,
1.122136, -0.2324792, 1.110308, 1, 0, 0.7254902, 1,
1.123354, -1.102289, 2.871342, 1, 0, 0.7215686, 1,
1.125077, -0.02914026, 1.470986, 1, 0, 0.7137255, 1,
1.134562, 1.282798, -0.05363896, 1, 0, 0.7098039, 1,
1.145699, -0.1788837, 1.128995, 1, 0, 0.7019608, 1,
1.1474, 1.010296, 0.3838733, 1, 0, 0.6941177, 1,
1.152955, 0.05776238, 0.7740081, 1, 0, 0.6901961, 1,
1.15606, -1.893096, 1.423642, 1, 0, 0.682353, 1,
1.167701, 0.6682754, 1.113052, 1, 0, 0.6784314, 1,
1.169426, -0.5189583, 3.060473, 1, 0, 0.6705883, 1,
1.183168, -0.8047752, 0.8656809, 1, 0, 0.6666667, 1,
1.187021, 0.9589667, 0.5500964, 1, 0, 0.6588235, 1,
1.188517, -0.8695016, 1.133952, 1, 0, 0.654902, 1,
1.198562, -1.341119, 3.049299, 1, 0, 0.6470588, 1,
1.202924, -2.110773, 2.788704, 1, 0, 0.6431373, 1,
1.209463, -0.7993014, 2.821911, 1, 0, 0.6352941, 1,
1.211358, 1.873037, 0.3006435, 1, 0, 0.6313726, 1,
1.238046, 1.0143, 0.3649516, 1, 0, 0.6235294, 1,
1.243634, -0.4250386, 2.448242, 1, 0, 0.6196079, 1,
1.254014, -0.8877928, 3.078255, 1, 0, 0.6117647, 1,
1.257948, 0.5099845, 2.115689, 1, 0, 0.6078432, 1,
1.258179, 0.6149981, 2.493781, 1, 0, 0.6, 1,
1.261263, -0.00901181, 0.8224982, 1, 0, 0.5921569, 1,
1.264021, 0.05263894, 0.5270187, 1, 0, 0.5882353, 1,
1.278224, 0.6987829, 1.631493, 1, 0, 0.5803922, 1,
1.28434, 2.214568, -0.03600563, 1, 0, 0.5764706, 1,
1.29528, 0.3162579, 0.5477548, 1, 0, 0.5686275, 1,
1.306732, -0.3167417, 3.350101, 1, 0, 0.5647059, 1,
1.324406, -1.688383, 2.610588, 1, 0, 0.5568628, 1,
1.326276, 1.156339, 1.195479, 1, 0, 0.5529412, 1,
1.326495, -0.9171665, 3.063549, 1, 0, 0.5450981, 1,
1.333352, 0.09800681, 0.652785, 1, 0, 0.5411765, 1,
1.338041, 2.138157, 1.035896, 1, 0, 0.5333334, 1,
1.340631, -0.03549844, 1.327394, 1, 0, 0.5294118, 1,
1.349135, 0.4303808, 1.48102, 1, 0, 0.5215687, 1,
1.366577, 0.8101621, 3.019577, 1, 0, 0.5176471, 1,
1.378903, 1.955628, 0.006969584, 1, 0, 0.509804, 1,
1.383651, 0.1171425, 0.9790649, 1, 0, 0.5058824, 1,
1.384447, -0.1558717, 1.309656, 1, 0, 0.4980392, 1,
1.386684, -1.612379, 1.303516, 1, 0, 0.4901961, 1,
1.390499, 0.826762, 2.638161, 1, 0, 0.4862745, 1,
1.393372, 0.4475098, 0.3663265, 1, 0, 0.4784314, 1,
1.398591, 0.7741274, 1.992612, 1, 0, 0.4745098, 1,
1.414579, -1.13096, 2.448819, 1, 0, 0.4666667, 1,
1.423417, 1.5539, 0.6626387, 1, 0, 0.4627451, 1,
1.424052, -1.88869, 1.735701, 1, 0, 0.454902, 1,
1.429567, -0.5776448, 2.598114, 1, 0, 0.4509804, 1,
1.442658, -0.5572345, 2.195813, 1, 0, 0.4431373, 1,
1.457803, -0.3396641, 0.7685847, 1, 0, 0.4392157, 1,
1.476601, -0.3461699, 0.8913112, 1, 0, 0.4313726, 1,
1.478782, 0.9140558, 1.795574, 1, 0, 0.427451, 1,
1.483068, 1.834786, -1.480097, 1, 0, 0.4196078, 1,
1.483523, -0.2121192, 0.1124646, 1, 0, 0.4156863, 1,
1.485984, 0.02198494, 0.1328104, 1, 0, 0.4078431, 1,
1.498308, -2.63422, 3.231262, 1, 0, 0.4039216, 1,
1.51973, 0.7875196, 1.976612, 1, 0, 0.3960784, 1,
1.533183, -1.725857, 1.73909, 1, 0, 0.3882353, 1,
1.539386, -0.3209633, 3.106661, 1, 0, 0.3843137, 1,
1.553613, -1.254197, 1.801736, 1, 0, 0.3764706, 1,
1.568324, 0.2507831, 0.331879, 1, 0, 0.372549, 1,
1.573758, -1.877902, 1.969961, 1, 0, 0.3647059, 1,
1.602673, -1.436659, 1.568746, 1, 0, 0.3607843, 1,
1.61927, -1.554575, 2.747957, 1, 0, 0.3529412, 1,
1.619681, 0.7251347, 1.5441, 1, 0, 0.3490196, 1,
1.625427, -1.769046, 2.770321, 1, 0, 0.3411765, 1,
1.630752, 0.3431659, 2.829437, 1, 0, 0.3372549, 1,
1.639822, 0.7448319, -0.09220178, 1, 0, 0.3294118, 1,
1.642543, 0.8584904, 1.422529, 1, 0, 0.3254902, 1,
1.648044, 0.6092793, 1.77953, 1, 0, 0.3176471, 1,
1.668041, -0.4429713, 0.4075223, 1, 0, 0.3137255, 1,
1.677692, -0.3180033, 3.301201, 1, 0, 0.3058824, 1,
1.679166, -1.315821, 2.302745, 1, 0, 0.2980392, 1,
1.688745, 1.336431, 2.069464, 1, 0, 0.2941177, 1,
1.696785, -0.8017946, 2.205707, 1, 0, 0.2862745, 1,
1.701588, -0.9526308, 3.485733, 1, 0, 0.282353, 1,
1.712245, -0.9561733, 3.887724, 1, 0, 0.2745098, 1,
1.716575, -0.8759642, 1.289213, 1, 0, 0.2705882, 1,
1.729675, -0.1030272, 2.497881, 1, 0, 0.2627451, 1,
1.746125, 0.5641877, 1.95134, 1, 0, 0.2588235, 1,
1.746315, 0.2735821, 0.9791524, 1, 0, 0.2509804, 1,
1.817751, 0.3110853, 1.808893, 1, 0, 0.2470588, 1,
1.862514, 0.5116698, 1.861422, 1, 0, 0.2392157, 1,
1.880351, 1.197643, 0.5567807, 1, 0, 0.2352941, 1,
1.905304, 0.2661819, 1.990785, 1, 0, 0.227451, 1,
1.912731, -2.016316, 2.153338, 1, 0, 0.2235294, 1,
1.917368, 0.8372576, 1.940768, 1, 0, 0.2156863, 1,
1.932533, -0.8077375, 2.797266, 1, 0, 0.2117647, 1,
1.950578, 0.4715219, 2.412555, 1, 0, 0.2039216, 1,
1.952041, 2.039735, 0.9623683, 1, 0, 0.1960784, 1,
1.99924, 1.274721, 0.1734676, 1, 0, 0.1921569, 1,
2.003094, -0.3987174, 4.729588, 1, 0, 0.1843137, 1,
2.004627, -0.8716144, 1.891181, 1, 0, 0.1803922, 1,
2.017116, -1.595615, 1.583517, 1, 0, 0.172549, 1,
2.022795, -1.420896, 1.956174, 1, 0, 0.1686275, 1,
2.046665, -1.252276, 2.786562, 1, 0, 0.1607843, 1,
2.056977, -0.9467968, 0.7727369, 1, 0, 0.1568628, 1,
2.05911, -0.8172343, 2.189504, 1, 0, 0.1490196, 1,
2.064954, -0.334694, 1.211507, 1, 0, 0.145098, 1,
2.065489, 0.897036, 1.275428, 1, 0, 0.1372549, 1,
2.071216, 1.198536, 1.018462, 1, 0, 0.1333333, 1,
2.079517, 0.08905571, 1.937304, 1, 0, 0.1254902, 1,
2.087465, 0.3378984, 1.566713, 1, 0, 0.1215686, 1,
2.106932, -0.6281233, 1.475928, 1, 0, 0.1137255, 1,
2.113808, -1.151613, 1.290697, 1, 0, 0.1098039, 1,
2.156032, -0.4108895, 2.417163, 1, 0, 0.1019608, 1,
2.18218, -0.9673467, 1.592177, 1, 0, 0.09411765, 1,
2.224794, 1.98836, 0.2764195, 1, 0, 0.09019608, 1,
2.242183, -0.995845, 1.264441, 1, 0, 0.08235294, 1,
2.244354, 0.01207228, 2.162209, 1, 0, 0.07843138, 1,
2.269831, -0.5395337, -0.2918396, 1, 0, 0.07058824, 1,
2.36719, 0.2392124, 1.661249, 1, 0, 0.06666667, 1,
2.44144, 0.8419979, 2.034429, 1, 0, 0.05882353, 1,
2.453313, 2.454505, -0.1863423, 1, 0, 0.05490196, 1,
2.503541, 1.374331, 0.9375301, 1, 0, 0.04705882, 1,
2.717716, 0.6831036, 1.429063, 1, 0, 0.04313726, 1,
2.760608, 0.5620885, 1.028609, 1, 0, 0.03529412, 1,
2.813939, -0.4747325, 0.9125037, 1, 0, 0.03137255, 1,
2.898501, 0.120681, 1.716147, 1, 0, 0.02352941, 1,
3.080687, 0.6751253, 2.073172, 1, 0, 0.01960784, 1,
3.19702, -0.6454234, 2.33761, 1, 0, 0.01176471, 1,
3.464184, 1.354471, 0.1431656, 1, 0, 0.007843138, 1
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
0.1278248, -3.712133, -6.619215, 0, -0.5, 0.5, 0.5,
0.1278248, -3.712133, -6.619215, 1, -0.5, 0.5, 0.5,
0.1278248, -3.712133, -6.619215, 1, 1.5, 0.5, 0.5,
0.1278248, -3.712133, -6.619215, 0, 1.5, 0.5, 0.5
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
-4.339561, -0.07459664, -6.619215, 0, -0.5, 0.5, 0.5,
-4.339561, -0.07459664, -6.619215, 1, -0.5, 0.5, 0.5,
-4.339561, -0.07459664, -6.619215, 1, 1.5, 0.5, 0.5,
-4.339561, -0.07459664, -6.619215, 0, 1.5, 0.5, 0.5
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
-4.339561, -3.712133, -0.05216241, 0, -0.5, 0.5, 0.5,
-4.339561, -3.712133, -0.05216241, 1, -0.5, 0.5, 0.5,
-4.339561, -3.712133, -0.05216241, 1, 1.5, 0.5, 0.5,
-4.339561, -3.712133, -0.05216241, 0, 1.5, 0.5, 0.5
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
-3, -2.872701, -5.103741,
3, -2.872701, -5.103741,
-3, -2.872701, -5.103741,
-3, -3.012607, -5.35632,
-2, -2.872701, -5.103741,
-2, -3.012607, -5.35632,
-1, -2.872701, -5.103741,
-1, -3.012607, -5.35632,
0, -2.872701, -5.103741,
0, -3.012607, -5.35632,
1, -2.872701, -5.103741,
1, -3.012607, -5.35632,
2, -2.872701, -5.103741,
2, -3.012607, -5.35632,
3, -2.872701, -5.103741,
3, -3.012607, -5.35632
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
-3, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
-3, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
-3, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
-3, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
-2, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
-2, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
-2, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
-2, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
-1, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
-1, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
-1, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
-1, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
0, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
0, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
0, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
0, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
1, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
1, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
1, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
1, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
2, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
2, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
2, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
2, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5,
3, -3.292417, -5.861478, 0, -0.5, 0.5, 0.5,
3, -3.292417, -5.861478, 1, -0.5, 0.5, 0.5,
3, -3.292417, -5.861478, 1, 1.5, 0.5, 0.5,
3, -3.292417, -5.861478, 0, 1.5, 0.5, 0.5
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
-3.308625, -2, -5.103741,
-3.308625, 2, -5.103741,
-3.308625, -2, -5.103741,
-3.480448, -2, -5.35632,
-3.308625, -1, -5.103741,
-3.480448, -1, -5.35632,
-3.308625, 0, -5.103741,
-3.480448, 0, -5.35632,
-3.308625, 1, -5.103741,
-3.480448, 1, -5.35632,
-3.308625, 2, -5.103741,
-3.480448, 2, -5.35632
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
-3.824093, -2, -5.861478, 0, -0.5, 0.5, 0.5,
-3.824093, -2, -5.861478, 1, -0.5, 0.5, 0.5,
-3.824093, -2, -5.861478, 1, 1.5, 0.5, 0.5,
-3.824093, -2, -5.861478, 0, 1.5, 0.5, 0.5,
-3.824093, -1, -5.861478, 0, -0.5, 0.5, 0.5,
-3.824093, -1, -5.861478, 1, -0.5, 0.5, 0.5,
-3.824093, -1, -5.861478, 1, 1.5, 0.5, 0.5,
-3.824093, -1, -5.861478, 0, 1.5, 0.5, 0.5,
-3.824093, 0, -5.861478, 0, -0.5, 0.5, 0.5,
-3.824093, 0, -5.861478, 1, -0.5, 0.5, 0.5,
-3.824093, 0, -5.861478, 1, 1.5, 0.5, 0.5,
-3.824093, 0, -5.861478, 0, 1.5, 0.5, 0.5,
-3.824093, 1, -5.861478, 0, -0.5, 0.5, 0.5,
-3.824093, 1, -5.861478, 1, -0.5, 0.5, 0.5,
-3.824093, 1, -5.861478, 1, 1.5, 0.5, 0.5,
-3.824093, 1, -5.861478, 0, 1.5, 0.5, 0.5,
-3.824093, 2, -5.861478, 0, -0.5, 0.5, 0.5,
-3.824093, 2, -5.861478, 1, -0.5, 0.5, 0.5,
-3.824093, 2, -5.861478, 1, 1.5, 0.5, 0.5,
-3.824093, 2, -5.861478, 0, 1.5, 0.5, 0.5
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
-3.308625, -2.872701, -4,
-3.308625, -2.872701, 4,
-3.308625, -2.872701, -4,
-3.480448, -3.012607, -4,
-3.308625, -2.872701, -2,
-3.480448, -3.012607, -2,
-3.308625, -2.872701, 0,
-3.480448, -3.012607, 0,
-3.308625, -2.872701, 2,
-3.480448, -3.012607, 2,
-3.308625, -2.872701, 4,
-3.480448, -3.012607, 4
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
-3.824093, -3.292417, -4, 0, -0.5, 0.5, 0.5,
-3.824093, -3.292417, -4, 1, -0.5, 0.5, 0.5,
-3.824093, -3.292417, -4, 1, 1.5, 0.5, 0.5,
-3.824093, -3.292417, -4, 0, 1.5, 0.5, 0.5,
-3.824093, -3.292417, -2, 0, -0.5, 0.5, 0.5,
-3.824093, -3.292417, -2, 1, -0.5, 0.5, 0.5,
-3.824093, -3.292417, -2, 1, 1.5, 0.5, 0.5,
-3.824093, -3.292417, -2, 0, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 0, 0, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 0, 1, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 0, 1, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 0, 0, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 2, 0, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 2, 1, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 2, 1, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 2, 0, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 4, 0, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 4, 1, -0.5, 0.5, 0.5,
-3.824093, -3.292417, 4, 1, 1.5, 0.5, 0.5,
-3.824093, -3.292417, 4, 0, 1.5, 0.5, 0.5
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
-3.308625, -2.872701, -5.103741,
-3.308625, 2.723508, -5.103741,
-3.308625, -2.872701, 4.999416,
-3.308625, 2.723508, 4.999416,
-3.308625, -2.872701, -5.103741,
-3.308625, -2.872701, 4.999416,
-3.308625, 2.723508, -5.103741,
-3.308625, 2.723508, 4.999416,
-3.308625, -2.872701, -5.103741,
3.564275, -2.872701, -5.103741,
-3.308625, -2.872701, 4.999416,
3.564275, -2.872701, 4.999416,
-3.308625, 2.723508, -5.103741,
3.564275, 2.723508, -5.103741,
-3.308625, 2.723508, 4.999416,
3.564275, 2.723508, 4.999416,
3.564275, -2.872701, -5.103741,
3.564275, 2.723508, -5.103741,
3.564275, -2.872701, 4.999416,
3.564275, 2.723508, 4.999416,
3.564275, -2.872701, -5.103741,
3.564275, -2.872701, 4.999416,
3.564275, 2.723508, -5.103741,
3.564275, 2.723508, 4.999416
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
var radius = 7.17659;
var distance = 31.92946;
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
mvMatrix.translate( -0.1278248, 0.07459664, 0.05216241 );
mvMatrix.scale( 1.128995, 1.386558, 0.7680242 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.92946);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
2-Methoxy-5-nitrophe<-read.table("2-Methoxy-5-nitrophe.xyz", skip=1)
```

```
## Error in read.table("2-Methoxy-5-nitrophe.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-2-Methoxy-5-nitrophe$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methoxy' not found
```

```r
y<-2-Methoxy-5-nitrophe$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methoxy' not found
```

```r
z<-2-Methoxy-5-nitrophe$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methoxy' not found
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
-3.208535, -0.7720238, -2.306616, 0, 0, 1, 1, 1,
-2.855358, -2.384657, -0.456214, 1, 0, 0, 1, 1,
-2.770729, -1.552413, -2.421698, 1, 0, 0, 1, 1,
-2.679702, -0.01951428, -1.462709, 1, 0, 0, 1, 1,
-2.385812, 0.6755297, -1.308348, 1, 0, 0, 1, 1,
-2.323358, 1.298036, 0.7473183, 1, 0, 0, 1, 1,
-2.307059, 0.3539159, -1.709812, 0, 0, 0, 1, 1,
-2.304803, -0.296924, -1.3986, 0, 0, 0, 1, 1,
-2.166828, -1.254686, -1.749378, 0, 0, 0, 1, 1,
-2.130706, 0.7028979, -1.248711, 0, 0, 0, 1, 1,
-2.099926, 1.457606, -3.501898, 0, 0, 0, 1, 1,
-2.075542, 0.9724356, -0.5040879, 0, 0, 0, 1, 1,
-2.068134, 0.6585447, 0.5583438, 0, 0, 0, 1, 1,
-2.04752, -0.8968459, -3.086888, 1, 1, 1, 1, 1,
-2.040577, -1.162734, -3.002959, 1, 1, 1, 1, 1,
-2.038035, 0.4638351, -1.779645, 1, 1, 1, 1, 1,
-2.03796, -0.6960686, -1.669531, 1, 1, 1, 1, 1,
-2.031891, 0.5415715, -1.626193, 1, 1, 1, 1, 1,
-2.024325, 0.1275305, -0.4183316, 1, 1, 1, 1, 1,
-1.99844, 0.6850406, -1.021535, 1, 1, 1, 1, 1,
-1.989667, -0.8380221, -4.292218, 1, 1, 1, 1, 1,
-1.963966, -0.7294528, -4.170342, 1, 1, 1, 1, 1,
-1.961064, 0.2095341, -1.781052, 1, 1, 1, 1, 1,
-1.948997, -1.806067, -1.780828, 1, 1, 1, 1, 1,
-1.934063, -0.3913026, -2.058208, 1, 1, 1, 1, 1,
-1.919153, -0.1087281, -1.67052, 1, 1, 1, 1, 1,
-1.916755, 1.851633, -0.7218944, 1, 1, 1, 1, 1,
-1.916576, 1.786271, -2.285589, 1, 1, 1, 1, 1,
-1.916531, 1.295732, 0.4433057, 0, 0, 1, 1, 1,
-1.847059, -0.3221413, -1.736413, 1, 0, 0, 1, 1,
-1.832901, -1.971756, -2.602089, 1, 0, 0, 1, 1,
-1.830045, -0.6062384, -2.903299, 1, 0, 0, 1, 1,
-1.826914, -0.2496586, -1.620019, 1, 0, 0, 1, 1,
-1.780764, 2.138119, -0.4290298, 1, 0, 0, 1, 1,
-1.776523, -0.3082782, -2.141556, 0, 0, 0, 1, 1,
-1.769703, -0.4059386, -2.275536, 0, 0, 0, 1, 1,
-1.76546, 1.801824, -0.08015142, 0, 0, 0, 1, 1,
-1.757864, 0.5190793, -2.561244, 0, 0, 0, 1, 1,
-1.741407, -0.418741, -2.498099, 0, 0, 0, 1, 1,
-1.740042, -0.5993241, -1.420677, 0, 0, 0, 1, 1,
-1.690456, -0.7438008, -1.723014, 0, 0, 0, 1, 1,
-1.687566, 0.2864428, -2.904686, 1, 1, 1, 1, 1,
-1.687559, -0.440607, -2.254083, 1, 1, 1, 1, 1,
-1.684698, -0.5892521, -1.838342, 1, 1, 1, 1, 1,
-1.675589, 0.02857318, 0.1885322, 1, 1, 1, 1, 1,
-1.64516, -0.256909, -0.5672265, 1, 1, 1, 1, 1,
-1.638694, -0.1474057, -0.5784265, 1, 1, 1, 1, 1,
-1.630633, 0.7696568, -0.8200774, 1, 1, 1, 1, 1,
-1.628978, 0.1835481, -1.409783, 1, 1, 1, 1, 1,
-1.625818, 0.42399, -0.6908433, 1, 1, 1, 1, 1,
-1.610791, 0.1519593, -0.3870761, 1, 1, 1, 1, 1,
-1.606639, -0.1929008, 0.3289917, 1, 1, 1, 1, 1,
-1.586127, 0.3690919, -1.19847, 1, 1, 1, 1, 1,
-1.55548, 0.2779518, -0.7269487, 1, 1, 1, 1, 1,
-1.555447, -1.401054, -4.294325, 1, 1, 1, 1, 1,
-1.555381, -0.6241446, -2.992963, 1, 1, 1, 1, 1,
-1.537953, 0.5603119, 0.01134068, 0, 0, 1, 1, 1,
-1.532206, -0.9355687, -3.109231, 1, 0, 0, 1, 1,
-1.508148, -1.051986, -1.705549, 1, 0, 0, 1, 1,
-1.492789, 0.1496228, -0.9118714, 1, 0, 0, 1, 1,
-1.487999, -1.272938, -4.956608, 1, 0, 0, 1, 1,
-1.481508, 0.08184887, 1.727776, 1, 0, 0, 1, 1,
-1.47997, -1.066162, -0.7209023, 0, 0, 0, 1, 1,
-1.475153, 0.1711591, -1.645438, 0, 0, 0, 1, 1,
-1.465746, 0.3545358, -0.5560415, 0, 0, 0, 1, 1,
-1.458835, -0.06848723, -2.984801, 0, 0, 0, 1, 1,
-1.457387, -1.470096, -0.5777952, 0, 0, 0, 1, 1,
-1.453591, -0.539338, -0.885991, 0, 0, 0, 1, 1,
-1.448833, 0.2794437, -1.536707, 0, 0, 0, 1, 1,
-1.447, 0.7424749, -0.3985691, 1, 1, 1, 1, 1,
-1.434576, 0.1829475, -0.9382098, 1, 1, 1, 1, 1,
-1.419325, 0.4168502, -1.191786, 1, 1, 1, 1, 1,
-1.4168, -0.4896969, -2.320651, 1, 1, 1, 1, 1,
-1.415277, 0.04705112, -2.449279, 1, 1, 1, 1, 1,
-1.386312, -0.5425225, -1.597693, 1, 1, 1, 1, 1,
-1.383914, -0.05800324, -2.091854, 1, 1, 1, 1, 1,
-1.380982, -1.259721, -3.36905, 1, 1, 1, 1, 1,
-1.375813, 0.05432823, -0.5950134, 1, 1, 1, 1, 1,
-1.375364, -0.5792142, -1.525819, 1, 1, 1, 1, 1,
-1.374828, -0.9896414, -1.702324, 1, 1, 1, 1, 1,
-1.359592, 0.7268035, -1.579603, 1, 1, 1, 1, 1,
-1.359366, -1.443616, -2.762209, 1, 1, 1, 1, 1,
-1.356471, -0.1604412, -2.300543, 1, 1, 1, 1, 1,
-1.350996, -1.333117, -3.424394, 1, 1, 1, 1, 1,
-1.343842, -1.281351, -2.873778, 0, 0, 1, 1, 1,
-1.335944, -0.2712762, -1.345175, 1, 0, 0, 1, 1,
-1.326249, -0.4318647, -2.017168, 1, 0, 0, 1, 1,
-1.324121, 0.8709519, 0.2198235, 1, 0, 0, 1, 1,
-1.317121, 1.136967, -1.851396, 1, 0, 0, 1, 1,
-1.314006, -0.7984797, -3.479501, 1, 0, 0, 1, 1,
-1.29938, -0.7729758, -3.157985, 0, 0, 0, 1, 1,
-1.298617, -0.5059229, -2.458673, 0, 0, 0, 1, 1,
-1.288347, -0.385203, -2.819066, 0, 0, 0, 1, 1,
-1.284913, -0.6917331, -2.429394, 0, 0, 0, 1, 1,
-1.282142, 0.7820409, -0.8310987, 0, 0, 0, 1, 1,
-1.278061, 0.3574602, -0.7870131, 0, 0, 0, 1, 1,
-1.263477, 0.6438884, -0.04063486, 0, 0, 0, 1, 1,
-1.261961, -0.07416691, -2.711431, 1, 1, 1, 1, 1,
-1.259905, 0.7002366, -0.6875281, 1, 1, 1, 1, 1,
-1.24889, -0.8103045, -3.98538, 1, 1, 1, 1, 1,
-1.24535, -0.9341688, -2.300812, 1, 1, 1, 1, 1,
-1.240101, 0.3207301, -1.351254, 1, 1, 1, 1, 1,
-1.237993, 2.64201, -1.68669, 1, 1, 1, 1, 1,
-1.237695, 0.03837854, -2.479131, 1, 1, 1, 1, 1,
-1.237397, -0.08707944, -1.707286, 1, 1, 1, 1, 1,
-1.228849, -1.399224, -3.668956, 1, 1, 1, 1, 1,
-1.22163, 1.285502, -1.991457, 1, 1, 1, 1, 1,
-1.208137, -1.699243, -3.783938, 1, 1, 1, 1, 1,
-1.197889, -1.053158, -1.741459, 1, 1, 1, 1, 1,
-1.197809, 1.189268, 0.1038045, 1, 1, 1, 1, 1,
-1.197171, -0.4734973, 0.1079577, 1, 1, 1, 1, 1,
-1.196512, 0.1455306, -1.636832, 1, 1, 1, 1, 1,
-1.187051, 1.731968, -0.1038439, 0, 0, 1, 1, 1,
-1.185813, -0.5799553, -0.2403275, 1, 0, 0, 1, 1,
-1.182385, 1.565768, -0.4411829, 1, 0, 0, 1, 1,
-1.16554, 0.9208351, 0.2878445, 1, 0, 0, 1, 1,
-1.165378, 2.128141, -0.2707151, 1, 0, 0, 1, 1,
-1.153147, 1.147256, -2.489245, 1, 0, 0, 1, 1,
-1.148953, -2.216674, -4.260739, 0, 0, 0, 1, 1,
-1.148875, 1.138401, 0.6537686, 0, 0, 0, 1, 1,
-1.148216, 0.09507875, -2.379891, 0, 0, 0, 1, 1,
-1.139876, 0.1280611, -3.091348, 0, 0, 0, 1, 1,
-1.134167, -0.2390574, -2.054958, 0, 0, 0, 1, 1,
-1.133624, 0.5593273, 0.1343957, 0, 0, 0, 1, 1,
-1.126695, 0.1615919, -0.7342613, 0, 0, 0, 1, 1,
-1.126121, -0.2307086, -0.03566447, 1, 1, 1, 1, 1,
-1.124387, 1.244913, -0.6823686, 1, 1, 1, 1, 1,
-1.123611, -0.2980615, -2.390488, 1, 1, 1, 1, 1,
-1.122107, 0.5695679, -1.405228, 1, 1, 1, 1, 1,
-1.119495, -0.1904869, -2.0151, 1, 1, 1, 1, 1,
-1.115313, -0.003535911, -2.345454, 1, 1, 1, 1, 1,
-1.102584, 0.4487568, -0.4556433, 1, 1, 1, 1, 1,
-1.099554, -0.9912337, -3.523713, 1, 1, 1, 1, 1,
-1.096775, 0.7162265, -0.1712458, 1, 1, 1, 1, 1,
-1.088069, -1.573618, -2.946024, 1, 1, 1, 1, 1,
-1.082685, -1.603559, -2.887926, 1, 1, 1, 1, 1,
-1.070294, -0.5439172, -1.082198, 1, 1, 1, 1, 1,
-1.070053, -1.043759, -2.04639, 1, 1, 1, 1, 1,
-1.069632, -0.1096799, -1.047967, 1, 1, 1, 1, 1,
-1.067004, -0.9250811, -0.8021494, 1, 1, 1, 1, 1,
-1.064052, 1.956367, 0.1099144, 0, 0, 1, 1, 1,
-1.059526, -0.5449159, -2.964862, 1, 0, 0, 1, 1,
-1.057424, 0.7050159, -1.490537, 1, 0, 0, 1, 1,
-1.056198, 0.7460588, -1.488419, 1, 0, 0, 1, 1,
-1.055808, -0.9638033, -2.342146, 1, 0, 0, 1, 1,
-1.054431, -1.153324, -2.924087, 1, 0, 0, 1, 1,
-1.037912, 0.621342, -1.6675, 0, 0, 0, 1, 1,
-1.023478, -0.5199457, -3.142597, 0, 0, 0, 1, 1,
-1.016258, -0.08921228, -3.042169, 0, 0, 0, 1, 1,
-1.00996, -2.050781, -4.10995, 0, 0, 0, 1, 1,
-0.9791133, 0.02482295, -2.230364, 0, 0, 0, 1, 1,
-0.9784937, 0.5623785, -1.048763, 0, 0, 0, 1, 1,
-0.9771935, 0.3194888, -2.291384, 0, 0, 0, 1, 1,
-0.9676399, -0.001630991, -0.9610864, 1, 1, 1, 1, 1,
-0.9615447, 0.6122301, -1.098146, 1, 1, 1, 1, 1,
-0.9555323, 0.318767, -1.903686, 1, 1, 1, 1, 1,
-0.9456641, -0.5770019, 0.04252196, 1, 1, 1, 1, 1,
-0.9450417, 0.3421876, -0.8872102, 1, 1, 1, 1, 1,
-0.9437821, 0.6602899, -1.401112, 1, 1, 1, 1, 1,
-0.9304183, 1.007949, -1.110562, 1, 1, 1, 1, 1,
-0.9281783, -0.1266349, -2.681991, 1, 1, 1, 1, 1,
-0.9209984, 0.01677635, -3.129056, 1, 1, 1, 1, 1,
-0.9036687, 0.4719424, -1.777349, 1, 1, 1, 1, 1,
-0.9020138, -0.3727201, -1.992414, 1, 1, 1, 1, 1,
-0.901827, 0.09859372, -2.595904, 1, 1, 1, 1, 1,
-0.8891806, -0.8102915, -3.271872, 1, 1, 1, 1, 1,
-0.885223, 2.000248, 0.1993501, 1, 1, 1, 1, 1,
-0.8851433, 0.06114145, -2.570796, 1, 1, 1, 1, 1,
-0.8806621, 0.6203566, -0.5686277, 0, 0, 1, 1, 1,
-0.879886, -2.18694, -3.733149, 1, 0, 0, 1, 1,
-0.8746091, 0.612265, -1.755693, 1, 0, 0, 1, 1,
-0.8702475, -0.4437034, -3.843371, 1, 0, 0, 1, 1,
-0.8693953, 0.5149679, -1.655479, 1, 0, 0, 1, 1,
-0.8641636, -0.7034586, -2.264019, 1, 0, 0, 1, 1,
-0.8583941, 0.1836026, -1.158061, 0, 0, 0, 1, 1,
-0.8546265, -0.5999852, -0.4571286, 0, 0, 0, 1, 1,
-0.851733, 0.6044027, -0.9406477, 0, 0, 0, 1, 1,
-0.8485137, -0.1349076, -2.312277, 0, 0, 0, 1, 1,
-0.8421776, 0.04850118, -1.643532, 0, 0, 0, 1, 1,
-0.8371385, 1.157726, -0.4462965, 0, 0, 0, 1, 1,
-0.8269039, -2.779355, -1.816068, 0, 0, 0, 1, 1,
-0.8242902, -0.1147608, -1.685466, 1, 1, 1, 1, 1,
-0.8240791, -0.7218676, -0.6702996, 1, 1, 1, 1, 1,
-0.8184178, 0.2986542, -1.38866, 1, 1, 1, 1, 1,
-0.8174272, -0.6587423, -4.113575, 1, 1, 1, 1, 1,
-0.8131322, -0.4693305, -3.343551, 1, 1, 1, 1, 1,
-0.8082118, 0.5600268, -0.961711, 1, 1, 1, 1, 1,
-0.8074439, 0.768718, -1.311813, 1, 1, 1, 1, 1,
-0.8071126, 0.5677385, 0.4998591, 1, 1, 1, 1, 1,
-0.8002529, 1.660025, -1.758653, 1, 1, 1, 1, 1,
-0.7981694, 0.4973751, 0.4831697, 1, 1, 1, 1, 1,
-0.79699, 0.08170592, -1.753793, 1, 1, 1, 1, 1,
-0.7921191, -0.8565266, -1.583531, 1, 1, 1, 1, 1,
-0.7875315, 0.4531352, -1.840418, 1, 1, 1, 1, 1,
-0.7784461, -0.2495828, -2.60018, 1, 1, 1, 1, 1,
-0.7767559, -0.4487242, -2.045434, 1, 1, 1, 1, 1,
-0.7756538, -2.791203, -3.288169, 0, 0, 1, 1, 1,
-0.7745162, 0.3861768, -0.3033921, 1, 0, 0, 1, 1,
-0.7701222, -0.9036075, -1.124082, 1, 0, 0, 1, 1,
-0.7679604, -1.126493, -1.362248, 1, 0, 0, 1, 1,
-0.7676235, -0.09997708, -1.587288, 1, 0, 0, 1, 1,
-0.7644859, -0.275295, -0.9756998, 1, 0, 0, 1, 1,
-0.7559788, -1.888355, -1.326432, 0, 0, 0, 1, 1,
-0.755087, 1.126109, 0.037757, 0, 0, 0, 1, 1,
-0.7502222, 0.4823589, -2.194473, 0, 0, 0, 1, 1,
-0.7419465, 0.8935164, -1.721865, 0, 0, 0, 1, 1,
-0.7407435, -2.021134, -2.352573, 0, 0, 0, 1, 1,
-0.737369, -0.8572707, -4.168092, 0, 0, 0, 1, 1,
-0.733388, -1.981738, -0.7102265, 0, 0, 0, 1, 1,
-0.7267914, 1.399294, 0.1745809, 1, 1, 1, 1, 1,
-0.7267324, -0.6756594, -2.840393, 1, 1, 1, 1, 1,
-0.7247473, -0.8340539, -1.365095, 1, 1, 1, 1, 1,
-0.7116875, -1.999783, -2.573402, 1, 1, 1, 1, 1,
-0.7095229, -1.656775, -2.398241, 1, 1, 1, 1, 1,
-0.7095175, -1.946904, -1.870291, 1, 1, 1, 1, 1,
-0.7070079, -0.1421186, -2.338655, 1, 1, 1, 1, 1,
-0.7047508, -2.392819, -1.752212, 1, 1, 1, 1, 1,
-0.7016667, -0.6684788, -0.9614054, 1, 1, 1, 1, 1,
-0.6966496, -1.159934, -3.429779, 1, 1, 1, 1, 1,
-0.6959347, 0.9767672, -1.064987, 1, 1, 1, 1, 1,
-0.6957777, -1.136588, -2.659233, 1, 1, 1, 1, 1,
-0.6957589, 0.1234351, -1.977867, 1, 1, 1, 1, 1,
-0.6940662, -2.294302, -3.129976, 1, 1, 1, 1, 1,
-0.6924885, -1.460397, -2.237004, 1, 1, 1, 1, 1,
-0.6866267, 0.4146384, -1.415992, 0, 0, 1, 1, 1,
-0.686058, -1.810947, -4.134319, 1, 0, 0, 1, 1,
-0.6849211, -0.9385106, -0.09612877, 1, 0, 0, 1, 1,
-0.6821951, 1.370861, -0.3516479, 1, 0, 0, 1, 1,
-0.6780839, -0.7265403, -3.31801, 1, 0, 0, 1, 1,
-0.6705115, -0.6332893, -2.76754, 1, 0, 0, 1, 1,
-0.6682, 0.4498918, -1.221005, 0, 0, 0, 1, 1,
-0.6681669, -1.459139, -3.910057, 0, 0, 0, 1, 1,
-0.6628718, -0.6117293, -2.013767, 0, 0, 0, 1, 1,
-0.6606672, 0.5227523, -0.5025213, 0, 0, 0, 1, 1,
-0.6445436, -0.1881143, -1.655035, 0, 0, 0, 1, 1,
-0.6430104, 1.07723, -2.244987, 0, 0, 0, 1, 1,
-0.6426556, -1.571598, -2.408351, 0, 0, 0, 1, 1,
-0.6400908, 0.1001974, -4.147723, 1, 1, 1, 1, 1,
-0.6301897, 1.255279, -2.532946, 1, 1, 1, 1, 1,
-0.6301671, -1.800458, -2.577223, 1, 1, 1, 1, 1,
-0.6282508, 0.3343449, -2.193747, 1, 1, 1, 1, 1,
-0.6240667, 0.1191328, -1.393905, 1, 1, 1, 1, 1,
-0.6226988, -0.0911541, -3.450781, 1, 1, 1, 1, 1,
-0.6186982, 0.1685034, -0.7451956, 1, 1, 1, 1, 1,
-0.618114, -1.465571, -2.219184, 1, 1, 1, 1, 1,
-0.6178083, -1.478179, -1.594696, 1, 1, 1, 1, 1,
-0.6162306, -0.1981306, -1.483151, 1, 1, 1, 1, 1,
-0.6058419, -0.02930615, -1.038399, 1, 1, 1, 1, 1,
-0.5995145, -0.7411667, -0.9734043, 1, 1, 1, 1, 1,
-0.5948468, 0.3509674, -1.053529, 1, 1, 1, 1, 1,
-0.5885795, -0.1395479, -2.690562, 1, 1, 1, 1, 1,
-0.5875211, -1.85791, -2.52727, 1, 1, 1, 1, 1,
-0.5799916, 0.8307974, 0.5035769, 0, 0, 1, 1, 1,
-0.5762613, 0.05080672, -1.096503, 1, 0, 0, 1, 1,
-0.5714381, 0.6454833, -0.5034113, 1, 0, 0, 1, 1,
-0.5711173, -0.1297075, -1.965363, 1, 0, 0, 1, 1,
-0.5710341, -0.1603541, -2.773997, 1, 0, 0, 1, 1,
-0.5709849, -0.549027, -2.307381, 1, 0, 0, 1, 1,
-0.5700345, -0.535627, -2.139946, 0, 0, 0, 1, 1,
-0.5692543, -0.3375281, -1.641389, 0, 0, 0, 1, 1,
-0.5674924, -0.8949376, -1.772372, 0, 0, 0, 1, 1,
-0.5658839, -0.5648823, -3.460076, 0, 0, 0, 1, 1,
-0.5624243, -2.198477, -3.545444, 0, 0, 0, 1, 1,
-0.5600339, 0.5310797, -0.5950756, 0, 0, 0, 1, 1,
-0.5538717, -0.739364, -2.392373, 0, 0, 0, 1, 1,
-0.5493975, -0.324282, -2.716347, 1, 1, 1, 1, 1,
-0.5442254, -0.2626774, -2.83949, 1, 1, 1, 1, 1,
-0.5442096, 0.3006164, -1.102471, 1, 1, 1, 1, 1,
-0.5430577, 1.460386, -0.8898413, 1, 1, 1, 1, 1,
-0.5414236, 0.01592007, -1.527532, 1, 1, 1, 1, 1,
-0.5360309, 0.209166, 0.5434887, 1, 1, 1, 1, 1,
-0.5356694, -1.720808, -2.530087, 1, 1, 1, 1, 1,
-0.5332694, 0.1108306, -1.398939, 1, 1, 1, 1, 1,
-0.5330269, 0.6965073, -0.1398199, 1, 1, 1, 1, 1,
-0.5328388, 0.5756378, -1.502547, 1, 1, 1, 1, 1,
-0.5278735, -1.098544, -3.084767, 1, 1, 1, 1, 1,
-0.5263501, -2.485605, -2.706036, 1, 1, 1, 1, 1,
-0.5208057, 0.6330744, -0.1162982, 1, 1, 1, 1, 1,
-0.51823, -0.1052373, -2.165789, 1, 1, 1, 1, 1,
-0.5157778, -0.5566921, -1.909176, 1, 1, 1, 1, 1,
-0.513063, 0.1565082, 0.4719651, 0, 0, 1, 1, 1,
-0.511395, 0.8220357, -0.9717126, 1, 0, 0, 1, 1,
-0.5087329, -0.4182625, -1.688007, 1, 0, 0, 1, 1,
-0.5068639, 0.2314409, -0.4209522, 1, 0, 0, 1, 1,
-0.5060706, -0.5092691, -3.249487, 1, 0, 0, 1, 1,
-0.5028607, -0.6144391, -1.065452, 1, 0, 0, 1, 1,
-0.4977707, -0.6800816, -3.048843, 0, 0, 0, 1, 1,
-0.4973496, 1.612294, -0.9484543, 0, 0, 0, 1, 1,
-0.4972974, -1.123804, -1.091983, 0, 0, 0, 1, 1,
-0.4944316, 1.086277, 0.2158792, 0, 0, 0, 1, 1,
-0.4927819, -0.8595899, -1.510985, 0, 0, 0, 1, 1,
-0.4924236, 1.998916, 0.4258775, 0, 0, 0, 1, 1,
-0.4867889, 0.9143608, 0.9829077, 0, 0, 0, 1, 1,
-0.4841245, 1.144636, -0.3131662, 1, 1, 1, 1, 1,
-0.4836499, 0.5033337, -1.939081, 1, 1, 1, 1, 1,
-0.4835061, -1.047501, -2.403083, 1, 1, 1, 1, 1,
-0.4793844, 1.09875, -0.9713725, 1, 1, 1, 1, 1,
-0.4790765, 0.8631644, 0.1732207, 1, 1, 1, 1, 1,
-0.4741607, 0.3688139, -1.23325, 1, 1, 1, 1, 1,
-0.4729881, 0.3567678, -2.339961, 1, 1, 1, 1, 1,
-0.4676722, 0.8225718, 0.7572533, 1, 1, 1, 1, 1,
-0.466306, 1.517044, 1.203775, 1, 1, 1, 1, 1,
-0.4624662, 0.4626777, -0.04712987, 1, 1, 1, 1, 1,
-0.4621639, 0.915926, -1.205478, 1, 1, 1, 1, 1,
-0.4593474, -0.6131414, -3.241194, 1, 1, 1, 1, 1,
-0.4582553, 1.11271, -1.82106, 1, 1, 1, 1, 1,
-0.4564798, 1.035215, -0.7864954, 1, 1, 1, 1, 1,
-0.4564622, -0.3051173, -1.133418, 1, 1, 1, 1, 1,
-0.4563812, -2.301865, -3.117328, 0, 0, 1, 1, 1,
-0.4561546, -0.2306747, -2.788776, 1, 0, 0, 1, 1,
-0.4549043, -0.9311184, -3.39294, 1, 0, 0, 1, 1,
-0.45049, -0.5088114, -2.320532, 1, 0, 0, 1, 1,
-0.4499275, 0.778949, 0.5408759, 1, 0, 0, 1, 1,
-0.4481453, 0.5170857, -0.09506146, 1, 0, 0, 1, 1,
-0.4457504, -0.4647627, -1.035871, 0, 0, 0, 1, 1,
-0.4451244, 0.09637389, -1.066054, 0, 0, 0, 1, 1,
-0.4426574, 0.7833349, -0.9448576, 0, 0, 0, 1, 1,
-0.4399864, -0.2501704, -3.78452, 0, 0, 0, 1, 1,
-0.439152, 0.01003347, -1.853175, 0, 0, 0, 1, 1,
-0.4340017, 0.8894464, -0.8648601, 0, 0, 0, 1, 1,
-0.4335135, -0.8098256, -2.429986, 0, 0, 0, 1, 1,
-0.4276073, 1.14355, -1.843935, 1, 1, 1, 1, 1,
-0.4229899, 0.3021068, -1.39581, 1, 1, 1, 1, 1,
-0.4221239, -1.376818, -1.910627, 1, 1, 1, 1, 1,
-0.4171062, -0.99031, -3.434569, 1, 1, 1, 1, 1,
-0.416431, -1.907084, -2.459961, 1, 1, 1, 1, 1,
-0.4139219, 1.218073, -0.7106678, 1, 1, 1, 1, 1,
-0.4134788, 0.9515157, -1.258698, 1, 1, 1, 1, 1,
-0.4114253, -1.191317, -2.521845, 1, 1, 1, 1, 1,
-0.4089338, -0.09113171, -3.217869, 1, 1, 1, 1, 1,
-0.4066644, 0.773336, 0.02696848, 1, 1, 1, 1, 1,
-0.4007365, -0.8657309, -3.964226, 1, 1, 1, 1, 1,
-0.4001639, -0.02999585, -2.364351, 1, 1, 1, 1, 1,
-0.3941947, -0.2802473, -2.464042, 1, 1, 1, 1, 1,
-0.3901684, -0.5700293, -2.528833, 1, 1, 1, 1, 1,
-0.3895653, 1.09363, -1.244291, 1, 1, 1, 1, 1,
-0.3885505, -2.533368, -1.917192, 0, 0, 1, 1, 1,
-0.3882713, -0.4685391, -3.111477, 1, 0, 0, 1, 1,
-0.3875086, 0.1071085, -1.14419, 1, 0, 0, 1, 1,
-0.3853502, 1.398832, -0.05260222, 1, 0, 0, 1, 1,
-0.3841052, 0.1131297, -1.125282, 1, 0, 0, 1, 1,
-0.3837616, -0.3125035, -2.642878, 1, 0, 0, 1, 1,
-0.3822269, 0.01292127, -1.794037, 0, 0, 0, 1, 1,
-0.3810547, -0.2118098, 0.1937256, 0, 0, 0, 1, 1,
-0.3755626, 0.00759465, -0.4671007, 0, 0, 0, 1, 1,
-0.3752811, -0.8078543, -1.80017, 0, 0, 0, 1, 1,
-0.3701607, -0.8189909, -2.919453, 0, 0, 0, 1, 1,
-0.3670609, -0.9961505, -2.268317, 0, 0, 0, 1, 1,
-0.3651471, 0.1802006, -0.9947472, 0, 0, 0, 1, 1,
-0.3651436, -0.3619499, -3.913153, 1, 1, 1, 1, 1,
-0.3622148, 0.110986, 0.1364489, 1, 1, 1, 1, 1,
-0.3619964, -0.6407517, -1.437959, 1, 1, 1, 1, 1,
-0.3610598, -1.496858, -2.318157, 1, 1, 1, 1, 1,
-0.3590211, -0.5293727, -2.333311, 1, 1, 1, 1, 1,
-0.3579926, -0.9900224, -2.356907, 1, 1, 1, 1, 1,
-0.3529085, -0.4431962, -1.321479, 1, 1, 1, 1, 1,
-0.3498664, 0.2212466, 0.4805273, 1, 1, 1, 1, 1,
-0.3379712, 0.3531507, 1.459293, 1, 1, 1, 1, 1,
-0.3356608, -0.3971156, -2.65192, 1, 1, 1, 1, 1,
-0.3354438, -1.329927, -4.456866, 1, 1, 1, 1, 1,
-0.3341527, 1.88391, -1.332569, 1, 1, 1, 1, 1,
-0.3315446, -2.404783, -3.113869, 1, 1, 1, 1, 1,
-0.3313178, -0.01336379, -1.634963, 1, 1, 1, 1, 1,
-0.3300436, 0.1747225, -2.318041, 1, 1, 1, 1, 1,
-0.3298814, -0.04018838, -1.137781, 0, 0, 1, 1, 1,
-0.3223452, 0.43842, -0.4786029, 1, 0, 0, 1, 1,
-0.3222543, 0.9387186, -0.6667524, 1, 0, 0, 1, 1,
-0.321641, 0.3284776, -0.2593313, 1, 0, 0, 1, 1,
-0.3156506, -0.2118186, -2.762169, 1, 0, 0, 1, 1,
-0.3144182, 0.9804904, 2.228766, 1, 0, 0, 1, 1,
-0.3132707, -2.097836, -1.902014, 0, 0, 0, 1, 1,
-0.3109027, 0.670014, -0.256498, 0, 0, 0, 1, 1,
-0.3106509, -0.4977283, -1.91773, 0, 0, 0, 1, 1,
-0.3088953, 0.4129339, -0.2195393, 0, 0, 0, 1, 1,
-0.2984996, 1.135616, -1.720831, 0, 0, 0, 1, 1,
-0.2976566, -0.4144191, -3.088877, 0, 0, 0, 1, 1,
-0.2972864, -0.01328596, -1.847852, 0, 0, 0, 1, 1,
-0.2967915, -0.8765444, -3.298676, 1, 1, 1, 1, 1,
-0.294052, 1.041721, 0.275104, 1, 1, 1, 1, 1,
-0.2940021, -0.4630042, -1.438017, 1, 1, 1, 1, 1,
-0.2938573, -1.650456, -2.621717, 1, 1, 1, 1, 1,
-0.293532, -0.9642318, -0.3026493, 1, 1, 1, 1, 1,
-0.2886061, 0.4401444, -0.5163466, 1, 1, 1, 1, 1,
-0.2854989, 0.1621379, -2.277575, 1, 1, 1, 1, 1,
-0.2833311, -0.9542669, -1.477335, 1, 1, 1, 1, 1,
-0.2832498, -1.486162, -4.687401, 1, 1, 1, 1, 1,
-0.2826757, -1.468162, -1.965739, 1, 1, 1, 1, 1,
-0.2817235, 1.352262, -3.085055, 1, 1, 1, 1, 1,
-0.2757281, -0.8373505, -0.8983073, 1, 1, 1, 1, 1,
-0.2715929, -0.8214981, -2.604941, 1, 1, 1, 1, 1,
-0.2706385, -0.752243, -2.259521, 1, 1, 1, 1, 1,
-0.2690162, 1.126691, -0.9553906, 1, 1, 1, 1, 1,
-0.2624601, 0.7126912, 0.2161478, 0, 0, 1, 1, 1,
-0.2622636, -0.8772234, -2.844308, 1, 0, 0, 1, 1,
-0.261625, -0.7076313, -1.70852, 1, 0, 0, 1, 1,
-0.2607809, -0.6126153, -2.553706, 1, 0, 0, 1, 1,
-0.2545283, -1.05222, -4.270108, 1, 0, 0, 1, 1,
-0.2526636, -1.51462, -1.640429, 1, 0, 0, 1, 1,
-0.2489494, -0.7947716, -2.706333, 0, 0, 0, 1, 1,
-0.2424433, -0.8508194, -2.22797, 0, 0, 0, 1, 1,
-0.240659, -1.604981, -2.278565, 0, 0, 0, 1, 1,
-0.2339657, 0.3955097, 0.2210487, 0, 0, 0, 1, 1,
-0.2271162, 0.5061039, -1.372872, 0, 0, 0, 1, 1,
-0.2234016, -1.796529, -3.688492, 0, 0, 0, 1, 1,
-0.220405, -0.102841, -1.333134, 0, 0, 0, 1, 1,
-0.2193638, 0.9771842, 1.260971, 1, 1, 1, 1, 1,
-0.2185924, 1.049168, 0.3467419, 1, 1, 1, 1, 1,
-0.2127124, 1.382604, -1.283761, 1, 1, 1, 1, 1,
-0.2078049, 0.3597335, 0.3021801, 1, 1, 1, 1, 1,
-0.2052618, 0.7470407, -1.227697, 1, 1, 1, 1, 1,
-0.203155, -1.357321, -2.181015, 1, 1, 1, 1, 1,
-0.1987001, -1.432319, -3.10377, 1, 1, 1, 1, 1,
-0.1967069, 1.470044, 0.1222317, 1, 1, 1, 1, 1,
-0.1872074, -0.2643268, -2.390227, 1, 1, 1, 1, 1,
-0.1828162, 0.8309563, -1.313589, 1, 1, 1, 1, 1,
-0.1786914, -0.1376592, -2.93844, 1, 1, 1, 1, 1,
-0.1785464, -0.6867077, -1.307593, 1, 1, 1, 1, 1,
-0.1780114, 0.04581981, -2.857697, 1, 1, 1, 1, 1,
-0.1728468, 0.9609595, 1.635569, 1, 1, 1, 1, 1,
-0.1622995, -0.2787057, -2.845925, 1, 1, 1, 1, 1,
-0.16174, 0.4201628, -0.2762316, 0, 0, 1, 1, 1,
-0.1616975, 0.05914087, -1.272761, 1, 0, 0, 1, 1,
-0.1577863, 0.03861314, -1.882059, 1, 0, 0, 1, 1,
-0.1565548, -0.6108427, -2.506588, 1, 0, 0, 1, 1,
-0.1558559, -1.111308, -1.015827, 1, 0, 0, 1, 1,
-0.1543078, 0.3912101, -0.5170869, 1, 0, 0, 1, 1,
-0.1503269, -2.50321, -0.819312, 0, 0, 0, 1, 1,
-0.1458018, -1.291174, -3.371303, 0, 0, 0, 1, 1,
-0.1447486, -1.70832, -3.728597, 0, 0, 0, 1, 1,
-0.1296479, 0.9745533, -0.8418141, 0, 0, 0, 1, 1,
-0.1217916, -0.3616481, -1.595453, 0, 0, 0, 1, 1,
-0.1201206, -1.045101, -3.803653, 0, 0, 0, 1, 1,
-0.1186666, -0.8072077, -2.474817, 0, 0, 0, 1, 1,
-0.1178029, 0.4706076, -0.2863137, 1, 1, 1, 1, 1,
-0.1157712, 1.726161, 0.3440196, 1, 1, 1, 1, 1,
-0.1136884, -0.5922926, -4.564826, 1, 1, 1, 1, 1,
-0.1104776, -1.225957, -3.792084, 1, 1, 1, 1, 1,
-0.1076139, 0.5109854, -0.2713858, 1, 1, 1, 1, 1,
-0.1071466, 0.7520241, 1.602093, 1, 1, 1, 1, 1,
-0.10642, -0.8920372, -3.554668, 1, 1, 1, 1, 1,
-0.09995998, -1.099607, -3.02998, 1, 1, 1, 1, 1,
-0.09214064, 0.6076485, 1.115077, 1, 1, 1, 1, 1,
-0.08959303, -1.867663, -2.948346, 1, 1, 1, 1, 1,
-0.08398286, 0.3144355, 0.6050197, 1, 1, 1, 1, 1,
-0.08294743, 1.566464, -0.71165, 1, 1, 1, 1, 1,
-0.07887635, -0.3782032, -3.664618, 1, 1, 1, 1, 1,
-0.07837771, 0.2306971, -0.2055891, 1, 1, 1, 1, 1,
-0.07786112, -0.6948103, -2.282049, 1, 1, 1, 1, 1,
-0.07699201, -0.9568157, -4.707224, 0, 0, 1, 1, 1,
-0.0763741, -2.193957, -4.814108, 1, 0, 0, 1, 1,
-0.07590585, -1.081348, -1.912645, 1, 0, 0, 1, 1,
-0.07521708, 0.2054753, -0.4592075, 1, 0, 0, 1, 1,
-0.07055563, -0.1438662, -3.14012, 1, 0, 0, 1, 1,
-0.06588513, -0.7276574, -4.257007, 1, 0, 0, 1, 1,
-0.06310637, 0.2200357, 0.4753692, 0, 0, 0, 1, 1,
-0.0613391, -2.591682, -3.880957, 0, 0, 0, 1, 1,
-0.05940604, -1.30864, -2.149585, 0, 0, 0, 1, 1,
-0.05917547, 1.186509, -0.8025932, 0, 0, 0, 1, 1,
-0.05768847, -0.7279793, -3.303444, 0, 0, 0, 1, 1,
-0.05172279, -1.013336, -3.865533, 0, 0, 0, 1, 1,
-0.04976592, 0.4535289, -0.1032204, 0, 0, 0, 1, 1,
-0.04954713, -1.542964, -2.96222, 1, 1, 1, 1, 1,
-0.04753514, 0.07805403, -1.550552, 1, 1, 1, 1, 1,
-0.04567913, 0.1858732, 0.7202344, 1, 1, 1, 1, 1,
-0.04415271, -0.6451169, -2.641821, 1, 1, 1, 1, 1,
-0.04233135, 0.7076743, 1.706805, 1, 1, 1, 1, 1,
-0.03527756, -2.329933, -4.22151, 1, 1, 1, 1, 1,
-0.03060221, 1.557055, 0.2377561, 1, 1, 1, 1, 1,
-0.02523527, -2.236136, -3.240628, 1, 1, 1, 1, 1,
-0.02198688, 0.2805136, 1.142638, 1, 1, 1, 1, 1,
-0.02164316, 0.4495501, -0.2992726, 1, 1, 1, 1, 1,
-0.02100151, 1.864737, 1.393895, 1, 1, 1, 1, 1,
-0.01967762, 1.421519, -1.014891, 1, 1, 1, 1, 1,
-0.01135021, 0.4931194, 0.6845861, 1, 1, 1, 1, 1,
-0.008060074, 0.2660136, 1.017854, 1, 1, 1, 1, 1,
-0.007687307, 0.9132855, 1.125447, 1, 1, 1, 1, 1,
-0.004773865, -1.319873, -4.826604, 0, 0, 1, 1, 1,
-0.003231644, -0.2925906, -1.278682, 1, 0, 0, 1, 1,
-0.00014062, -0.2616268, -3.294735, 1, 0, 0, 1, 1,
0.0004075514, 1.164997, -1.702885, 1, 0, 0, 1, 1,
0.001992432, 0.8928934, -1.051803, 1, 0, 0, 1, 1,
0.003740515, 0.972452, -2.474029, 1, 0, 0, 1, 1,
0.01283459, 0.6952085, -0.1242311, 0, 0, 0, 1, 1,
0.01607822, 0.5168326, 0.8158895, 0, 0, 0, 1, 1,
0.01623978, 0.5666733, 0.6616895, 0, 0, 0, 1, 1,
0.01944546, -0.01470581, 3.037536, 0, 0, 0, 1, 1,
0.02291104, -1.142573, 3.218542, 0, 0, 0, 1, 1,
0.02311258, -0.8565756, 3.507673, 0, 0, 0, 1, 1,
0.02385456, 0.9412947, -0.4550907, 0, 0, 0, 1, 1,
0.02391027, -0.7569433, 4.154085, 1, 1, 1, 1, 1,
0.02457839, -0.8675866, 3.689936, 1, 1, 1, 1, 1,
0.02560643, -1.10078, 3.00567, 1, 1, 1, 1, 1,
0.02677268, 0.4060545, -0.07989489, 1, 1, 1, 1, 1,
0.02721382, -0.0763258, 3.169506, 1, 1, 1, 1, 1,
0.03607115, -0.04721469, 1.835023, 1, 1, 1, 1, 1,
0.03647369, -0.303023, 3.236814, 1, 1, 1, 1, 1,
0.03703722, 0.7803923, -0.6859234, 1, 1, 1, 1, 1,
0.03881502, 0.8453968, -1.38302, 1, 1, 1, 1, 1,
0.03884913, 0.5658937, -0.0339482, 1, 1, 1, 1, 1,
0.04148453, -2.03215, 2.839444, 1, 1, 1, 1, 1,
0.04374433, -0.03915313, 2.344992, 1, 1, 1, 1, 1,
0.04853094, 0.7086011, -0.36149, 1, 1, 1, 1, 1,
0.05425721, -0.8003346, 4.28425, 1, 1, 1, 1, 1,
0.05965284, -0.1182131, 4.456236, 1, 1, 1, 1, 1,
0.06012868, 1.884122, -1.235204, 0, 0, 1, 1, 1,
0.06168643, -0.3497957, 3.237428, 1, 0, 0, 1, 1,
0.06211282, -0.4510036, 4.18654, 1, 0, 0, 1, 1,
0.06884155, -0.7750006, 2.83455, 1, 0, 0, 1, 1,
0.06931715, -0.02367179, 0.9790193, 1, 0, 0, 1, 1,
0.07117555, 0.09584987, 0.7934631, 1, 0, 0, 1, 1,
0.07250187, -2.094923, 4.802655, 0, 0, 0, 1, 1,
0.07257644, 1.798208, 1.76623, 0, 0, 0, 1, 1,
0.07280838, -1.379309, 3.972479, 0, 0, 0, 1, 1,
0.07650615, 0.9704207, -0.6948947, 0, 0, 0, 1, 1,
0.07822071, 0.5965604, 0.9446731, 0, 0, 0, 1, 1,
0.08491613, -0.2642673, 2.73774, 0, 0, 0, 1, 1,
0.08941536, 1.703574, -0.118352, 0, 0, 0, 1, 1,
0.09058487, 0.4769394, -1.06547, 1, 1, 1, 1, 1,
0.09397541, -0.8751304, 3.601381, 1, 1, 1, 1, 1,
0.09520771, -1.258176, 2.484324, 1, 1, 1, 1, 1,
0.09608276, -0.8080547, 3.522167, 1, 1, 1, 1, 1,
0.1034133, 0.353744, 2.600911, 1, 1, 1, 1, 1,
0.1044462, -0.5811855, 4.661318, 1, 1, 1, 1, 1,
0.1051338, -0.4667005, 1.512958, 1, 1, 1, 1, 1,
0.1076308, -1.953203, 2.371178, 1, 1, 1, 1, 1,
0.1101314, -0.1057642, 4.392619, 1, 1, 1, 1, 1,
0.1134002, -0.8274554, 2.620454, 1, 1, 1, 1, 1,
0.1135674, 0.8369612, 0.487434, 1, 1, 1, 1, 1,
0.1156705, -0.3640755, 1.379168, 1, 1, 1, 1, 1,
0.1157058, 0.4407994, -0.5014793, 1, 1, 1, 1, 1,
0.1189215, 1.007914, 0.07505289, 1, 1, 1, 1, 1,
0.1213304, -0.369295, 2.370509, 1, 1, 1, 1, 1,
0.1220347, 0.4679613, 1.167865, 0, 0, 1, 1, 1,
0.1253149, 1.612947, -0.808797, 1, 0, 0, 1, 1,
0.1257359, 0.02740891, 1.819807, 1, 0, 0, 1, 1,
0.125811, -0.334854, 2.958091, 1, 0, 0, 1, 1,
0.131778, 1.150189, 0.3739822, 1, 0, 0, 1, 1,
0.1328492, 0.2577519, 0.9015089, 1, 0, 0, 1, 1,
0.1335818, -1.184425, 3.457453, 0, 0, 0, 1, 1,
0.1365506, 0.224491, -0.1856702, 0, 0, 0, 1, 1,
0.1378177, -1.097411, 4.169433, 0, 0, 0, 1, 1,
0.1411042, 1.413448, 0.6586354, 0, 0, 0, 1, 1,
0.1430125, 0.444283, 0.976654, 0, 0, 0, 1, 1,
0.1445175, 0.00127228, 1.80133, 0, 0, 0, 1, 1,
0.1470945, -0.8823903, 2.545261, 0, 0, 0, 1, 1,
0.1485104, 1.483423, -0.0711108, 1, 1, 1, 1, 1,
0.1491937, -1.535923, 2.928055, 1, 1, 1, 1, 1,
0.1500692, -0.6011741, 2.773624, 1, 1, 1, 1, 1,
0.15049, 0.04163863, 3.054199, 1, 1, 1, 1, 1,
0.1520277, 1.926439, 0.0646755, 1, 1, 1, 1, 1,
0.158631, -1.029926, 2.95391, 1, 1, 1, 1, 1,
0.1636429, 1.152271, -0.3374802, 1, 1, 1, 1, 1,
0.1643412, -0.3842733, 1.924675, 1, 1, 1, 1, 1,
0.1649063, 0.3762072, -0.7184359, 1, 1, 1, 1, 1,
0.1690261, 1.586994, 0.1250149, 1, 1, 1, 1, 1,
0.1709864, 0.2490352, 0.5237331, 1, 1, 1, 1, 1,
0.1732965, 0.4761313, -0.06635848, 1, 1, 1, 1, 1,
0.1745504, 0.2960164, 0.3882723, 1, 1, 1, 1, 1,
0.1747571, 1.980152, -0.08257736, 1, 1, 1, 1, 1,
0.1793683, 0.3058334, 2.991471, 1, 1, 1, 1, 1,
0.1807022, 2.196377, 0.3522823, 0, 0, 1, 1, 1,
0.1825904, 0.683161, 1.054181, 1, 0, 0, 1, 1,
0.1828988, -2.026402, 3.609623, 1, 0, 0, 1, 1,
0.184582, 0.2512924, 2.911424, 1, 0, 0, 1, 1,
0.1888857, -0.8265418, 3.077165, 1, 0, 0, 1, 1,
0.1900436, 0.3107265, 0.5751871, 1, 0, 0, 1, 1,
0.190175, -0.6529225, 2.007062, 0, 0, 0, 1, 1,
0.1902926, 1.07844, 0.224408, 0, 0, 0, 1, 1,
0.1904387, 0.7747145, 1.071593, 0, 0, 0, 1, 1,
0.1938187, -0.2758197, 2.881573, 0, 0, 0, 1, 1,
0.1943662, 0.2461823, 0.9141777, 0, 0, 0, 1, 1,
0.1950091, -0.7741606, 2.110291, 0, 0, 0, 1, 1,
0.1969625, -0.9029936, 2.063349, 0, 0, 0, 1, 1,
0.1997657, 0.3027382, 0.1464371, 1, 1, 1, 1, 1,
0.2017488, -0.3750236, 3.048278, 1, 1, 1, 1, 1,
0.2022667, -1.572658, 4.07907, 1, 1, 1, 1, 1,
0.2045518, -0.1308296, 2.349434, 1, 1, 1, 1, 1,
0.2069021, 0.4080846, 1.45086, 1, 1, 1, 1, 1,
0.2075692, -0.719568, 2.24461, 1, 1, 1, 1, 1,
0.2109983, -0.2625896, 1.813766, 1, 1, 1, 1, 1,
0.2161668, 0.1120541, 0.11745, 1, 1, 1, 1, 1,
0.2184998, 0.2405687, 1.873267, 1, 1, 1, 1, 1,
0.2214851, 0.04803462, -0.7688625, 1, 1, 1, 1, 1,
0.2231254, 0.7192639, 0.1089202, 1, 1, 1, 1, 1,
0.2239616, 0.7086331, 1.35064, 1, 1, 1, 1, 1,
0.2257885, -0.5096203, 2.1335, 1, 1, 1, 1, 1,
0.2258724, 1.080364, 1.511264, 1, 1, 1, 1, 1,
0.2259393, -1.606302, 2.905792, 1, 1, 1, 1, 1,
0.2322907, 0.7400271, -1.055076, 0, 0, 1, 1, 1,
0.2329855, 2.138691, 1.653824, 1, 0, 0, 1, 1,
0.2342255, -0.1359248, 1.862724, 1, 0, 0, 1, 1,
0.2353423, -1.207728, 2.320789, 1, 0, 0, 1, 1,
0.2354519, 0.3101795, 0.1329323, 1, 0, 0, 1, 1,
0.2410105, -0.109681, 2.591583, 1, 0, 0, 1, 1,
0.2444641, -0.2601632, 2.123945, 0, 0, 0, 1, 1,
0.2488176, 0.6080405, 0.7711196, 0, 0, 0, 1, 1,
0.2522539, -0.4236786, 3.692221, 0, 0, 0, 1, 1,
0.252313, -0.4623641, 2.51103, 0, 0, 0, 1, 1,
0.253198, 0.6219672, 1.301918, 0, 0, 0, 1, 1,
0.2543172, -0.5375023, 3.060745, 0, 0, 0, 1, 1,
0.2561586, -0.6297275, 4.852283, 0, 0, 0, 1, 1,
0.2633221, -0.905384, 2.368387, 1, 1, 1, 1, 1,
0.2636549, 1.621865, -0.5393095, 1, 1, 1, 1, 1,
0.2657702, 0.5324132, 1.136665, 1, 1, 1, 1, 1,
0.2662708, -0.06589884, 0.1960068, 1, 1, 1, 1, 1,
0.2697473, 1.8196, -0.06932343, 1, 1, 1, 1, 1,
0.2706396, -0.3949965, 0.9978305, 1, 1, 1, 1, 1,
0.273067, -0.5469936, 2.368642, 1, 1, 1, 1, 1,
0.2731564, -0.6005064, 1.429315, 1, 1, 1, 1, 1,
0.2763689, 0.798717, 1.392098, 1, 1, 1, 1, 1,
0.2779253, -0.4979908, 4.418079, 1, 1, 1, 1, 1,
0.2814828, 0.8706633, -0.142167, 1, 1, 1, 1, 1,
0.2820755, 1.100261, 0.2804706, 1, 1, 1, 1, 1,
0.2845974, -0.8520446, 2.417355, 1, 1, 1, 1, 1,
0.2876389, 0.03754317, 0.2123773, 1, 1, 1, 1, 1,
0.292148, -0.7946856, 3.359887, 1, 1, 1, 1, 1,
0.2970603, 1.50981, 2.776862, 0, 0, 1, 1, 1,
0.2972721, -0.1136026, 2.767149, 1, 0, 0, 1, 1,
0.2989497, -0.5626605, 3.237188, 1, 0, 0, 1, 1,
0.2997571, -0.3924842, 2.450312, 1, 0, 0, 1, 1,
0.3031963, 1.962084, -0.3780615, 1, 0, 0, 1, 1,
0.3060009, -0.05816273, 1.171412, 1, 0, 0, 1, 1,
0.3068802, 0.6202175, 1.143326, 0, 0, 0, 1, 1,
0.3143414, -0.8249525, 4.384348, 0, 0, 0, 1, 1,
0.3167391, -1.285978, 1.573655, 0, 0, 0, 1, 1,
0.3182544, 0.7648772, 0.2453814, 0, 0, 0, 1, 1,
0.3215754, 0.3045665, -0.06906933, 0, 0, 0, 1, 1,
0.3232262, -0.9615135, 2.987692, 0, 0, 0, 1, 1,
0.3244903, 0.1697266, -0.9665968, 0, 0, 0, 1, 1,
0.3253426, -2.326357, 3.597991, 1, 1, 1, 1, 1,
0.327572, 0.6302974, 0.828917, 1, 1, 1, 1, 1,
0.3281729, -0.6272377, 2.646107, 1, 1, 1, 1, 1,
0.3318239, -0.5614617, 1.551506, 1, 1, 1, 1, 1,
0.333227, 0.8225538, 0.5885291, 1, 1, 1, 1, 1,
0.3381074, -2.056639, 2.289251, 1, 1, 1, 1, 1,
0.3449734, 0.4501497, 0.204942, 1, 1, 1, 1, 1,
0.3487645, -1.047782, 3.81885, 1, 1, 1, 1, 1,
0.3545432, -0.7497253, 4.14053, 1, 1, 1, 1, 1,
0.3545461, 0.26696, 0.8458855, 1, 1, 1, 1, 1,
0.3565827, -0.7026252, 2.474134, 1, 1, 1, 1, 1,
0.3582138, -1.0638, 2.101689, 1, 1, 1, 1, 1,
0.3584778, -0.1404458, 0.4456485, 1, 1, 1, 1, 1,
0.3585947, -0.1117592, 0.2078391, 1, 1, 1, 1, 1,
0.3592803, -0.9076987, 2.807839, 1, 1, 1, 1, 1,
0.3629947, -0.3163818, 2.890926, 0, 0, 1, 1, 1,
0.3636826, -0.3397048, 4.56878, 1, 0, 0, 1, 1,
0.3644143, -1.057514, 3.384568, 1, 0, 0, 1, 1,
0.3672011, -0.8856688, 1.79376, 1, 0, 0, 1, 1,
0.3685483, -1.772417, 1.665658, 1, 0, 0, 1, 1,
0.3712845, 1.126513, -0.4262162, 1, 0, 0, 1, 1,
0.3726025, -0.3401858, 3.332142, 0, 0, 0, 1, 1,
0.3762334, 1.29575, 0.04691995, 0, 0, 0, 1, 1,
0.3765457, 0.01577339, 0.3726245, 0, 0, 0, 1, 1,
0.377558, -0.3427724, 3.016123, 0, 0, 0, 1, 1,
0.3782376, -0.6010919, 1.245992, 0, 0, 0, 1, 1,
0.3786421, -1.044042, 2.742661, 0, 0, 0, 1, 1,
0.3797588, 0.2628269, 1.609833, 0, 0, 0, 1, 1,
0.3830378, 0.5675145, -0.6001316, 1, 1, 1, 1, 1,
0.3855413, -0.2675073, 2.584114, 1, 1, 1, 1, 1,
0.3887517, -0.5562653, 3.265894, 1, 1, 1, 1, 1,
0.3888849, -1.754742, 3.428756, 1, 1, 1, 1, 1,
0.3939579, 0.4545857, 2.668447, 1, 1, 1, 1, 1,
0.3943391, -0.2343823, 2.662144, 1, 1, 1, 1, 1,
0.4095015, -1.420958, 3.274233, 1, 1, 1, 1, 1,
0.4132652, 0.7905908, 0.6390401, 1, 1, 1, 1, 1,
0.4156133, -0.4436561, 4.335932, 1, 1, 1, 1, 1,
0.4157414, 0.8718125, 3.110852, 1, 1, 1, 1, 1,
0.4191022, 1.0131, 0.3744822, 1, 1, 1, 1, 1,
0.4202873, -0.07687779, 0.359271, 1, 1, 1, 1, 1,
0.4232253, 0.4700488, 0.543557, 1, 1, 1, 1, 1,
0.4238429, 0.4432735, 1.471417, 1, 1, 1, 1, 1,
0.4262995, 1.631634, -0.02439845, 1, 1, 1, 1, 1,
0.4264563, 0.3167523, 1.497156, 0, 0, 1, 1, 1,
0.4289813, -0.8572368, 3.401325, 1, 0, 0, 1, 1,
0.4298716, -0.7870721, 0.8093544, 1, 0, 0, 1, 1,
0.4321602, 0.8480878, -0.2935993, 1, 0, 0, 1, 1,
0.4332311, -0.5532157, 1.630909, 1, 0, 0, 1, 1,
0.4514023, -0.9456416, 2.53278, 1, 0, 0, 1, 1,
0.4545018, -2.106596, 2.912674, 0, 0, 0, 1, 1,
0.4550774, -0.09401067, 1.459495, 0, 0, 0, 1, 1,
0.4554753, 0.2713319, 1.121423, 0, 0, 0, 1, 1,
0.4555978, -0.2129377, 1.450351, 0, 0, 0, 1, 1,
0.46333, -2.404335, 2.555571, 0, 0, 0, 1, 1,
0.4684978, 1.328186, 0.4940615, 0, 0, 0, 1, 1,
0.4701049, -0.508114, 2.878207, 0, 0, 0, 1, 1,
0.4746952, -1.61678, 0.9151447, 1, 1, 1, 1, 1,
0.4764657, 0.2683865, 1.532115, 1, 1, 1, 1, 1,
0.4875236, 0.8755372, -0.07152171, 1, 1, 1, 1, 1,
0.4900284, -0.9484736, 1.999419, 1, 1, 1, 1, 1,
0.4929881, -0.7239078, 4.373622, 1, 1, 1, 1, 1,
0.5028443, 0.06706647, 1.329092, 1, 1, 1, 1, 1,
0.5028837, 0.5873988, 0.1948642, 1, 1, 1, 1, 1,
0.5046641, -0.622589, 2.478187, 1, 1, 1, 1, 1,
0.5070834, -0.3016572, 2.857227, 1, 1, 1, 1, 1,
0.5084234, -0.2391934, 0.5149581, 1, 1, 1, 1, 1,
0.5121539, -0.7022995, 1.696921, 1, 1, 1, 1, 1,
0.5154279, -1.026532, 2.824813, 1, 1, 1, 1, 1,
0.5174894, 0.3980091, 2.83386, 1, 1, 1, 1, 1,
0.518985, -1.52926, 3.182299, 1, 1, 1, 1, 1,
0.5191455, 2.043838, -2.165417, 1, 1, 1, 1, 1,
0.5209759, 2.37044, 0.43765, 0, 0, 1, 1, 1,
0.522163, -0.8148487, 4.675402, 1, 0, 0, 1, 1,
0.5240585, 0.8087977, 0.3606886, 1, 0, 0, 1, 1,
0.5307803, -0.5086795, 2.236452, 1, 0, 0, 1, 1,
0.5330842, -0.165315, 1.363104, 1, 0, 0, 1, 1,
0.538476, 0.4408039, 0.1666458, 1, 0, 0, 1, 1,
0.5385666, 0.2035912, 2.893721, 0, 0, 0, 1, 1,
0.5400388, -0.6209146, 2.347835, 0, 0, 0, 1, 1,
0.5402153, -1.035571, 2.16364, 0, 0, 0, 1, 1,
0.5424832, 0.5492046, 1.677679, 0, 0, 0, 1, 1,
0.5455962, -1.792871, 3.691719, 0, 0, 0, 1, 1,
0.5495061, 1.103939, 0.6023165, 0, 0, 0, 1, 1,
0.5550606, -1.536191, 3.815997, 0, 0, 0, 1, 1,
0.5564672, -2.167987, 3.769516, 1, 1, 1, 1, 1,
0.5575541, 1.746197, -0.00807769, 1, 1, 1, 1, 1,
0.5583374, -0.8775973, 3.697455, 1, 1, 1, 1, 1,
0.5593437, 1.710518, -0.1907233, 1, 1, 1, 1, 1,
0.5618303, 0.934499, 1.130557, 1, 1, 1, 1, 1,
0.5626884, -1.51515, 1.557186, 1, 1, 1, 1, 1,
0.5627922, 1.084407, 0.5579321, 1, 1, 1, 1, 1,
0.5644104, -0.476847, 3.442179, 1, 1, 1, 1, 1,
0.5656969, 0.6372471, 1.434661, 1, 1, 1, 1, 1,
0.5706236, -0.6970471, 3.558743, 1, 1, 1, 1, 1,
0.5712941, -2.747705, 4.266061, 1, 1, 1, 1, 1,
0.5718299, 0.6912254, -0.8375303, 1, 1, 1, 1, 1,
0.572078, -0.1310701, 2.825666, 1, 1, 1, 1, 1,
0.5733646, -1.365999, 2.392581, 1, 1, 1, 1, 1,
0.5735555, 0.08287318, 1.003306, 1, 1, 1, 1, 1,
0.5757245, 1.583175, -0.6748117, 0, 0, 1, 1, 1,
0.5759931, 0.1908951, 2.087376, 1, 0, 0, 1, 1,
0.580841, 1.36636, 1.024956, 1, 0, 0, 1, 1,
0.5813384, -1.040522, 2.060974, 1, 0, 0, 1, 1,
0.5816047, -1.573847, 3.71154, 1, 0, 0, 1, 1,
0.586233, 1.848248, 0.3922023, 1, 0, 0, 1, 1,
0.5870866, -1.00202, 1.215405, 0, 0, 0, 1, 1,
0.5892853, 0.6878679, 0.6988176, 0, 0, 0, 1, 1,
0.5899696, 0.8535771, 1.171695, 0, 0, 0, 1, 1,
0.5907797, 2.171168, 0.4815048, 0, 0, 0, 1, 1,
0.5915642, -1.230368, 2.839405, 0, 0, 0, 1, 1,
0.5917275, 0.6601608, 0.3969913, 0, 0, 0, 1, 1,
0.5946468, -0.885, 2.601684, 0, 0, 0, 1, 1,
0.5980576, 1.060051, 0.7274747, 1, 1, 1, 1, 1,
0.6016592, -0.5288017, 2.495049, 1, 1, 1, 1, 1,
0.6042594, 0.7173484, -1.225269, 1, 1, 1, 1, 1,
0.6073756, 0.7647926, 0.9647339, 1, 1, 1, 1, 1,
0.6185542, 1.015696, 1.245748, 1, 1, 1, 1, 1,
0.6191705, -0.01118306, 0.6742046, 1, 1, 1, 1, 1,
0.6196435, -0.8029951, 4.047922, 1, 1, 1, 1, 1,
0.6218168, 1.132085, -1.533321, 1, 1, 1, 1, 1,
0.6259034, 0.8076303, 0.5641236, 1, 1, 1, 1, 1,
0.626238, 1.183986, 1.272711, 1, 1, 1, 1, 1,
0.6303554, 0.4792172, -0.6198208, 1, 1, 1, 1, 1,
0.6455346, 1.48299, 0.0865833, 1, 1, 1, 1, 1,
0.6480658, 0.4679129, 0.02085431, 1, 1, 1, 1, 1,
0.6505346, 0.7813995, 3.894355, 1, 1, 1, 1, 1,
0.6538336, -0.2986563, 1.410247, 1, 1, 1, 1, 1,
0.6547907, -0.3829371, 2.074452, 0, 0, 1, 1, 1,
0.6548316, -0.8882251, 3.77874, 1, 0, 0, 1, 1,
0.6553742, 0.964783, 1.924704, 1, 0, 0, 1, 1,
0.6560853, -0.2158899, 3.274692, 1, 0, 0, 1, 1,
0.6564118, 0.02503504, 2.13333, 1, 0, 0, 1, 1,
0.6585079, 0.9251813, 0.8790621, 1, 0, 0, 1, 1,
0.6589663, -0.4155142, 2.24091, 0, 0, 0, 1, 1,
0.660297, -0.6175228, 0.01792077, 0, 0, 0, 1, 1,
0.6625438, -0.2093256, 2.772975, 0, 0, 0, 1, 1,
0.6638274, -0.04336573, 0.05373052, 0, 0, 0, 1, 1,
0.6685049, -1.065145, 1.250198, 0, 0, 0, 1, 1,
0.6698613, 0.07469951, 0.8005112, 0, 0, 0, 1, 1,
0.6721175, 0.3054732, 2.132479, 0, 0, 0, 1, 1,
0.6755008, 0.2967366, -0.1716659, 1, 1, 1, 1, 1,
0.6764033, 0.1557551, 1.886287, 1, 1, 1, 1, 1,
0.6796803, 0.478943, -0.1854485, 1, 1, 1, 1, 1,
0.6802812, 0.2184418, 1.52266, 1, 1, 1, 1, 1,
0.681848, 0.07128502, 1.197171, 1, 1, 1, 1, 1,
0.6832286, -0.3104142, 1.851437, 1, 1, 1, 1, 1,
0.6895288, 0.6957724, 1.729944, 1, 1, 1, 1, 1,
0.691583, -0.3845207, 1.317527, 1, 1, 1, 1, 1,
0.6926738, -0.5301262, 3.404656, 1, 1, 1, 1, 1,
0.6994541, 1.605879, -0.888256, 1, 1, 1, 1, 1,
0.7007929, 1.65866, 0.2843141, 1, 1, 1, 1, 1,
0.702867, 0.03416111, 0.9401457, 1, 1, 1, 1, 1,
0.7061447, -0.9474274, 3.556535, 1, 1, 1, 1, 1,
0.7093194, -0.3431203, 3.112608, 1, 1, 1, 1, 1,
0.7112698, 0.6939111, -0.1328707, 1, 1, 1, 1, 1,
0.7118189, -1.556801, 3.102056, 0, 0, 1, 1, 1,
0.7142164, 0.4639523, 1.649231, 1, 0, 0, 1, 1,
0.7149448, 0.3860683, 1.256011, 1, 0, 0, 1, 1,
0.7183868, -0.02289853, 1.100984, 1, 0, 0, 1, 1,
0.7185524, 0.4234818, 2.045919, 1, 0, 0, 1, 1,
0.7190453, 0.5411258, -0.758073, 1, 0, 0, 1, 1,
0.7264462, -1.393016, 4.104178, 0, 0, 0, 1, 1,
0.7278767, -1.674836, 3.392708, 0, 0, 0, 1, 1,
0.7379999, 1.335083, 0.5362859, 0, 0, 0, 1, 1,
0.7397277, 0.195288, 1.0271, 0, 0, 0, 1, 1,
0.7428451, -0.8784622, 4.430837, 0, 0, 0, 1, 1,
0.7429776, 1.261885, -0.2716019, 0, 0, 0, 1, 1,
0.7462366, 0.0328324, 2.058533, 0, 0, 0, 1, 1,
0.7509735, 1.134072, -0.146449, 1, 1, 1, 1, 1,
0.7653773, 0.02642727, 1.89977, 1, 1, 1, 1, 1,
0.7711135, -0.09756247, 0.847801, 1, 1, 1, 1, 1,
0.7747805, -1.171537, 2.712906, 1, 1, 1, 1, 1,
0.7882257, 0.3698849, 1.978539, 1, 1, 1, 1, 1,
0.7886258, -1.336869, 3.896942, 1, 1, 1, 1, 1,
0.7908539, 1.264515, -0.7172095, 1, 1, 1, 1, 1,
0.7993436, -0.9192121, -0.07346731, 1, 1, 1, 1, 1,
0.8078005, 0.8848878, 1.323368, 1, 1, 1, 1, 1,
0.8101182, 1.553896, 1.260491, 1, 1, 1, 1, 1,
0.8113968, 0.3889605, 1.601731, 1, 1, 1, 1, 1,
0.8151352, -0.2531286, 1.769379, 1, 1, 1, 1, 1,
0.8173513, -1.082189, 1.100105, 1, 1, 1, 1, 1,
0.8263557, 1.587145, -0.1553487, 1, 1, 1, 1, 1,
0.8323966, -0.6827747, 1.11657, 1, 1, 1, 1, 1,
0.8470235, -0.5163597, 1.324923, 0, 0, 1, 1, 1,
0.8475094, 0.6853011, 1.166898, 1, 0, 0, 1, 1,
0.8506096, 0.3269668, 0.5492755, 1, 0, 0, 1, 1,
0.8516072, -0.4788101, 1.663617, 1, 0, 0, 1, 1,
0.8632538, 1.467694, 1.482355, 1, 0, 0, 1, 1,
0.8651877, 1.405693, -1.413321, 1, 0, 0, 1, 1,
0.8668115, 0.6740527, 2.481026, 0, 0, 0, 1, 1,
0.8718719, 0.3871666, 1.428409, 0, 0, 0, 1, 1,
0.8769829, 0.03677965, 1.610034, 0, 0, 0, 1, 1,
0.8776891, -0.03803545, 2.40061, 0, 0, 0, 1, 1,
0.8798316, -0.3340285, 1.728216, 0, 0, 0, 1, 1,
0.8798787, -1.072178, 1.388772, 0, 0, 0, 1, 1,
0.8811921, 0.7452251, 0.2963368, 0, 0, 0, 1, 1,
0.8903058, 0.08619989, 2.199798, 1, 1, 1, 1, 1,
0.8919572, 0.7397485, 0.2162597, 1, 1, 1, 1, 1,
0.8937071, 0.9666134, 1.582397, 1, 1, 1, 1, 1,
0.8958183, -0.3608896, 1.078785, 1, 1, 1, 1, 1,
0.8989987, 0.35866, -0.02854462, 1, 1, 1, 1, 1,
0.9011719, -0.1844234, 1.132782, 1, 1, 1, 1, 1,
0.9077712, 0.6672124, 0.8256924, 1, 1, 1, 1, 1,
0.9093651, 0.9880527, 2.016665, 1, 1, 1, 1, 1,
0.9181678, -1.554911, 4.006139, 1, 1, 1, 1, 1,
0.9196135, -0.5980367, 2.239354, 1, 1, 1, 1, 1,
0.9244521, -0.4972843, 2.546642, 1, 1, 1, 1, 1,
0.9245089, 1.586359, 0.6633925, 1, 1, 1, 1, 1,
0.9246799, -0.9127424, 3.736963, 1, 1, 1, 1, 1,
0.9254696, 1.007237, 1.070232, 1, 1, 1, 1, 1,
0.9284247, -0.0985354, 0.9673818, 1, 1, 1, 1, 1,
0.9298987, 0.724477, 0.4230188, 0, 0, 1, 1, 1,
0.9331647, 0.1268742, 1.897887, 1, 0, 0, 1, 1,
0.934041, 0.8268233, 0.6710113, 1, 0, 0, 1, 1,
0.9402553, -0.5206503, 1.932368, 1, 0, 0, 1, 1,
0.9411511, 0.05778876, 0.1789848, 1, 0, 0, 1, 1,
0.9421008, -1.016657, 3.480457, 1, 0, 0, 1, 1,
0.9435846, 0.6342975, 0.9653755, 0, 0, 0, 1, 1,
0.9497868, 0.4881645, 1.325564, 0, 0, 0, 1, 1,
0.9501736, 1.048625, 0.2222101, 0, 0, 0, 1, 1,
0.9566598, -0.9493523, 4.096129, 0, 0, 0, 1, 1,
0.9600716, 0.2167524, 2.501545, 0, 0, 0, 1, 1,
0.9646029, 0.6751944, 1.455536, 0, 0, 0, 1, 1,
0.9777153, 0.08098354, 1.553931, 0, 0, 0, 1, 1,
0.9779524, 0.08305, 0.9587648, 1, 1, 1, 1, 1,
0.9792481, -0.5865293, 1.300191, 1, 1, 1, 1, 1,
0.9883443, -0.09515577, 1.526445, 1, 1, 1, 1, 1,
0.9885659, 0.2626366, 1.229601, 1, 1, 1, 1, 1,
0.9889566, 0.0785042, 2.819475, 1, 1, 1, 1, 1,
0.9889805, -0.200962, 1.916291, 1, 1, 1, 1, 1,
0.9910696, 0.638195, 1.985336, 1, 1, 1, 1, 1,
0.992799, 0.9352263, 2.077889, 1, 1, 1, 1, 1,
0.9931037, 1.444254, 0.6154199, 1, 1, 1, 1, 1,
0.9951522, 1.602151, 0.06637435, 1, 1, 1, 1, 1,
1.003082, 0.1663484, 0.563233, 1, 1, 1, 1, 1,
1.003954, -1.455981, 1.292951, 1, 1, 1, 1, 1,
1.011603, -0.01344351, 3.045465, 1, 1, 1, 1, 1,
1.014418, 1.419942, 2.650573, 1, 1, 1, 1, 1,
1.014918, -0.03681399, 1.602475, 1, 1, 1, 1, 1,
1.015944, -1.157294, 0.9355615, 0, 0, 1, 1, 1,
1.017447, -1.671376, 4.25303, 1, 0, 0, 1, 1,
1.019344, 0.9869162, 0.9480664, 1, 0, 0, 1, 1,
1.019957, 1.823467, 0.8009639, 1, 0, 0, 1, 1,
1.02667, -0.4483775, 3.151365, 1, 0, 0, 1, 1,
1.052854, 1.318598, -0.2026066, 1, 0, 0, 1, 1,
1.070479, 0.7887212, 0.2248715, 0, 0, 0, 1, 1,
1.079224, 1.680702, 0.757281, 0, 0, 0, 1, 1,
1.088331, 2.021187, -0.08893474, 0, 0, 0, 1, 1,
1.106978, -0.9742683, 1.64258, 0, 0, 0, 1, 1,
1.112716, -0.6025862, 2.042607, 0, 0, 0, 1, 1,
1.122136, -0.2324792, 1.110308, 0, 0, 0, 1, 1,
1.123354, -1.102289, 2.871342, 0, 0, 0, 1, 1,
1.125077, -0.02914026, 1.470986, 1, 1, 1, 1, 1,
1.134562, 1.282798, -0.05363896, 1, 1, 1, 1, 1,
1.145699, -0.1788837, 1.128995, 1, 1, 1, 1, 1,
1.1474, 1.010296, 0.3838733, 1, 1, 1, 1, 1,
1.152955, 0.05776238, 0.7740081, 1, 1, 1, 1, 1,
1.15606, -1.893096, 1.423642, 1, 1, 1, 1, 1,
1.167701, 0.6682754, 1.113052, 1, 1, 1, 1, 1,
1.169426, -0.5189583, 3.060473, 1, 1, 1, 1, 1,
1.183168, -0.8047752, 0.8656809, 1, 1, 1, 1, 1,
1.187021, 0.9589667, 0.5500964, 1, 1, 1, 1, 1,
1.188517, -0.8695016, 1.133952, 1, 1, 1, 1, 1,
1.198562, -1.341119, 3.049299, 1, 1, 1, 1, 1,
1.202924, -2.110773, 2.788704, 1, 1, 1, 1, 1,
1.209463, -0.7993014, 2.821911, 1, 1, 1, 1, 1,
1.211358, 1.873037, 0.3006435, 1, 1, 1, 1, 1,
1.238046, 1.0143, 0.3649516, 0, 0, 1, 1, 1,
1.243634, -0.4250386, 2.448242, 1, 0, 0, 1, 1,
1.254014, -0.8877928, 3.078255, 1, 0, 0, 1, 1,
1.257948, 0.5099845, 2.115689, 1, 0, 0, 1, 1,
1.258179, 0.6149981, 2.493781, 1, 0, 0, 1, 1,
1.261263, -0.00901181, 0.8224982, 1, 0, 0, 1, 1,
1.264021, 0.05263894, 0.5270187, 0, 0, 0, 1, 1,
1.278224, 0.6987829, 1.631493, 0, 0, 0, 1, 1,
1.28434, 2.214568, -0.03600563, 0, 0, 0, 1, 1,
1.29528, 0.3162579, 0.5477548, 0, 0, 0, 1, 1,
1.306732, -0.3167417, 3.350101, 0, 0, 0, 1, 1,
1.324406, -1.688383, 2.610588, 0, 0, 0, 1, 1,
1.326276, 1.156339, 1.195479, 0, 0, 0, 1, 1,
1.326495, -0.9171665, 3.063549, 1, 1, 1, 1, 1,
1.333352, 0.09800681, 0.652785, 1, 1, 1, 1, 1,
1.338041, 2.138157, 1.035896, 1, 1, 1, 1, 1,
1.340631, -0.03549844, 1.327394, 1, 1, 1, 1, 1,
1.349135, 0.4303808, 1.48102, 1, 1, 1, 1, 1,
1.366577, 0.8101621, 3.019577, 1, 1, 1, 1, 1,
1.378903, 1.955628, 0.006969584, 1, 1, 1, 1, 1,
1.383651, 0.1171425, 0.9790649, 1, 1, 1, 1, 1,
1.384447, -0.1558717, 1.309656, 1, 1, 1, 1, 1,
1.386684, -1.612379, 1.303516, 1, 1, 1, 1, 1,
1.390499, 0.826762, 2.638161, 1, 1, 1, 1, 1,
1.393372, 0.4475098, 0.3663265, 1, 1, 1, 1, 1,
1.398591, 0.7741274, 1.992612, 1, 1, 1, 1, 1,
1.414579, -1.13096, 2.448819, 1, 1, 1, 1, 1,
1.423417, 1.5539, 0.6626387, 1, 1, 1, 1, 1,
1.424052, -1.88869, 1.735701, 0, 0, 1, 1, 1,
1.429567, -0.5776448, 2.598114, 1, 0, 0, 1, 1,
1.442658, -0.5572345, 2.195813, 1, 0, 0, 1, 1,
1.457803, -0.3396641, 0.7685847, 1, 0, 0, 1, 1,
1.476601, -0.3461699, 0.8913112, 1, 0, 0, 1, 1,
1.478782, 0.9140558, 1.795574, 1, 0, 0, 1, 1,
1.483068, 1.834786, -1.480097, 0, 0, 0, 1, 1,
1.483523, -0.2121192, 0.1124646, 0, 0, 0, 1, 1,
1.485984, 0.02198494, 0.1328104, 0, 0, 0, 1, 1,
1.498308, -2.63422, 3.231262, 0, 0, 0, 1, 1,
1.51973, 0.7875196, 1.976612, 0, 0, 0, 1, 1,
1.533183, -1.725857, 1.73909, 0, 0, 0, 1, 1,
1.539386, -0.3209633, 3.106661, 0, 0, 0, 1, 1,
1.553613, -1.254197, 1.801736, 1, 1, 1, 1, 1,
1.568324, 0.2507831, 0.331879, 1, 1, 1, 1, 1,
1.573758, -1.877902, 1.969961, 1, 1, 1, 1, 1,
1.602673, -1.436659, 1.568746, 1, 1, 1, 1, 1,
1.61927, -1.554575, 2.747957, 1, 1, 1, 1, 1,
1.619681, 0.7251347, 1.5441, 1, 1, 1, 1, 1,
1.625427, -1.769046, 2.770321, 1, 1, 1, 1, 1,
1.630752, 0.3431659, 2.829437, 1, 1, 1, 1, 1,
1.639822, 0.7448319, -0.09220178, 1, 1, 1, 1, 1,
1.642543, 0.8584904, 1.422529, 1, 1, 1, 1, 1,
1.648044, 0.6092793, 1.77953, 1, 1, 1, 1, 1,
1.668041, -0.4429713, 0.4075223, 1, 1, 1, 1, 1,
1.677692, -0.3180033, 3.301201, 1, 1, 1, 1, 1,
1.679166, -1.315821, 2.302745, 1, 1, 1, 1, 1,
1.688745, 1.336431, 2.069464, 1, 1, 1, 1, 1,
1.696785, -0.8017946, 2.205707, 0, 0, 1, 1, 1,
1.701588, -0.9526308, 3.485733, 1, 0, 0, 1, 1,
1.712245, -0.9561733, 3.887724, 1, 0, 0, 1, 1,
1.716575, -0.8759642, 1.289213, 1, 0, 0, 1, 1,
1.729675, -0.1030272, 2.497881, 1, 0, 0, 1, 1,
1.746125, 0.5641877, 1.95134, 1, 0, 0, 1, 1,
1.746315, 0.2735821, 0.9791524, 0, 0, 0, 1, 1,
1.817751, 0.3110853, 1.808893, 0, 0, 0, 1, 1,
1.862514, 0.5116698, 1.861422, 0, 0, 0, 1, 1,
1.880351, 1.197643, 0.5567807, 0, 0, 0, 1, 1,
1.905304, 0.2661819, 1.990785, 0, 0, 0, 1, 1,
1.912731, -2.016316, 2.153338, 0, 0, 0, 1, 1,
1.917368, 0.8372576, 1.940768, 0, 0, 0, 1, 1,
1.932533, -0.8077375, 2.797266, 1, 1, 1, 1, 1,
1.950578, 0.4715219, 2.412555, 1, 1, 1, 1, 1,
1.952041, 2.039735, 0.9623683, 1, 1, 1, 1, 1,
1.99924, 1.274721, 0.1734676, 1, 1, 1, 1, 1,
2.003094, -0.3987174, 4.729588, 1, 1, 1, 1, 1,
2.004627, -0.8716144, 1.891181, 1, 1, 1, 1, 1,
2.017116, -1.595615, 1.583517, 1, 1, 1, 1, 1,
2.022795, -1.420896, 1.956174, 1, 1, 1, 1, 1,
2.046665, -1.252276, 2.786562, 1, 1, 1, 1, 1,
2.056977, -0.9467968, 0.7727369, 1, 1, 1, 1, 1,
2.05911, -0.8172343, 2.189504, 1, 1, 1, 1, 1,
2.064954, -0.334694, 1.211507, 1, 1, 1, 1, 1,
2.065489, 0.897036, 1.275428, 1, 1, 1, 1, 1,
2.071216, 1.198536, 1.018462, 1, 1, 1, 1, 1,
2.079517, 0.08905571, 1.937304, 1, 1, 1, 1, 1,
2.087465, 0.3378984, 1.566713, 0, 0, 1, 1, 1,
2.106932, -0.6281233, 1.475928, 1, 0, 0, 1, 1,
2.113808, -1.151613, 1.290697, 1, 0, 0, 1, 1,
2.156032, -0.4108895, 2.417163, 1, 0, 0, 1, 1,
2.18218, -0.9673467, 1.592177, 1, 0, 0, 1, 1,
2.224794, 1.98836, 0.2764195, 1, 0, 0, 1, 1,
2.242183, -0.995845, 1.264441, 0, 0, 0, 1, 1,
2.244354, 0.01207228, 2.162209, 0, 0, 0, 1, 1,
2.269831, -0.5395337, -0.2918396, 0, 0, 0, 1, 1,
2.36719, 0.2392124, 1.661249, 0, 0, 0, 1, 1,
2.44144, 0.8419979, 2.034429, 0, 0, 0, 1, 1,
2.453313, 2.454505, -0.1863423, 0, 0, 0, 1, 1,
2.503541, 1.374331, 0.9375301, 0, 0, 0, 1, 1,
2.717716, 0.6831036, 1.429063, 1, 1, 1, 1, 1,
2.760608, 0.5620885, 1.028609, 1, 1, 1, 1, 1,
2.813939, -0.4747325, 0.9125037, 1, 1, 1, 1, 1,
2.898501, 0.120681, 1.716147, 1, 1, 1, 1, 1,
3.080687, 0.6751253, 2.073172, 1, 1, 1, 1, 1,
3.19702, -0.6454234, 2.33761, 1, 1, 1, 1, 1,
3.464184, 1.354471, 0.1431656, 1, 1, 1, 1, 1
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
var radius = 9.03606;
var distance = 31.73878;
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
mvMatrix.translate( -0.1278248, 0.07459664, 0.05216241 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.73878);
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
