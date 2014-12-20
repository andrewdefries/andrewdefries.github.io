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
-4.134985, -1.285106, -2.042659, 1, 0, 0, 1,
-3.899282, -0.0382955, -1.370588, 1, 0.007843138, 0, 1,
-3.072939, -0.4223027, -1.229537, 1, 0.01176471, 0, 1,
-2.646771, -0.5207412, -3.141746, 1, 0.01960784, 0, 1,
-2.481559, 2.202136, -1.662246, 1, 0.02352941, 0, 1,
-2.474881, 0.2187455, -1.075464, 1, 0.03137255, 0, 1,
-2.437309, 1.461427, 1.017731, 1, 0.03529412, 0, 1,
-2.386837, -1.952955, -3.087017, 1, 0.04313726, 0, 1,
-2.347879, -0.3543989, -0.7498798, 1, 0.04705882, 0, 1,
-2.340323, -0.4146442, 1.012924, 1, 0.05490196, 0, 1,
-2.28202, -0.4527518, -1.504301, 1, 0.05882353, 0, 1,
-2.271508, -0.3955291, -0.7385622, 1, 0.06666667, 0, 1,
-2.132531, -0.5959889, -2.869916, 1, 0.07058824, 0, 1,
-2.0927, -0.3110496, -1.429494, 1, 0.07843138, 0, 1,
-2.08584, 0.2414509, 0.331855, 1, 0.08235294, 0, 1,
-2.064543, 0.2359316, 0.7862415, 1, 0.09019608, 0, 1,
-2.064064, 1.682151, -0.8327774, 1, 0.09411765, 0, 1,
-2.053184, 1.036455, -0.7337261, 1, 0.1019608, 0, 1,
-2.040561, 0.3722321, -0.8867487, 1, 0.1098039, 0, 1,
-1.976453, 1.52533, 0.3168775, 1, 0.1137255, 0, 1,
-1.911994, 0.7356004, 0.5170113, 1, 0.1215686, 0, 1,
-1.909753, 0.4191689, -0.865446, 1, 0.1254902, 0, 1,
-1.889353, 2.932647, -0.7853541, 1, 0.1333333, 0, 1,
-1.885991, 0.2926814, -1.55542, 1, 0.1372549, 0, 1,
-1.866505, 0.1380928, -2.834351, 1, 0.145098, 0, 1,
-1.862726, -0.529016, -1.666861, 1, 0.1490196, 0, 1,
-1.855483, 0.3651135, -3.130823, 1, 0.1568628, 0, 1,
-1.841666, 0.2678839, -2.155757, 1, 0.1607843, 0, 1,
-1.826554, -0.1816694, -1.557751, 1, 0.1686275, 0, 1,
-1.821857, -0.602714, -3.655627, 1, 0.172549, 0, 1,
-1.811391, -0.6220728, -3.235157, 1, 0.1803922, 0, 1,
-1.757336, -0.930457, -0.2783291, 1, 0.1843137, 0, 1,
-1.754834, -1.081668, -3.247632, 1, 0.1921569, 0, 1,
-1.743626, -0.7488515, -0.9387679, 1, 0.1960784, 0, 1,
-1.742079, 0.414905, -0.467959, 1, 0.2039216, 0, 1,
-1.738742, 1.040933, -0.2748408, 1, 0.2117647, 0, 1,
-1.715316, 1.025383, -0.8973322, 1, 0.2156863, 0, 1,
-1.714524, 0.2697658, -2.833782, 1, 0.2235294, 0, 1,
-1.67555, -0.3830795, -3.569916, 1, 0.227451, 0, 1,
-1.673049, -0.8955199, -1.935729, 1, 0.2352941, 0, 1,
-1.647733, -1.120788, -2.494854, 1, 0.2392157, 0, 1,
-1.634982, 0.7188283, -1.87942, 1, 0.2470588, 0, 1,
-1.628081, -0.1717643, -1.695217, 1, 0.2509804, 0, 1,
-1.620827, -0.2714858, -1.857072, 1, 0.2588235, 0, 1,
-1.616445, -0.5836929, -1.201276, 1, 0.2627451, 0, 1,
-1.612158, -0.26898, -2.196478, 1, 0.2705882, 0, 1,
-1.602507, 1.294462, 0.7073023, 1, 0.2745098, 0, 1,
-1.594695, 0.25622, -1.248953, 1, 0.282353, 0, 1,
-1.580085, 0.1072854, -3.046162, 1, 0.2862745, 0, 1,
-1.579074, 1.57441, -0.4943484, 1, 0.2941177, 0, 1,
-1.564454, -1.23896, -1.446337, 1, 0.3019608, 0, 1,
-1.55452, 0.007644851, -2.566105, 1, 0.3058824, 0, 1,
-1.548193, -0.5058604, -2.330688, 1, 0.3137255, 0, 1,
-1.546694, 1.811484, -2.01469, 1, 0.3176471, 0, 1,
-1.525392, -1.521636, -2.729078, 1, 0.3254902, 0, 1,
-1.49211, -1.641914, -3.136274, 1, 0.3294118, 0, 1,
-1.474955, 1.826243, -1.160736, 1, 0.3372549, 0, 1,
-1.462785, -1.525903, -1.183505, 1, 0.3411765, 0, 1,
-1.459263, -0.4304658, -1.085961, 1, 0.3490196, 0, 1,
-1.453012, -1.033062, -0.2000653, 1, 0.3529412, 0, 1,
-1.449283, -1.150965, -2.337906, 1, 0.3607843, 0, 1,
-1.432433, -0.356398, -0.473847, 1, 0.3647059, 0, 1,
-1.42927, 0.2475659, -2.357702, 1, 0.372549, 0, 1,
-1.426345, -0.1668507, -0.6208337, 1, 0.3764706, 0, 1,
-1.419391, 0.3054283, -1.687068, 1, 0.3843137, 0, 1,
-1.415183, -0.7398985, -1.608204, 1, 0.3882353, 0, 1,
-1.405923, 0.9917423, 0.1938205, 1, 0.3960784, 0, 1,
-1.394684, 1.828171, -1.029967, 1, 0.4039216, 0, 1,
-1.394096, 0.2430415, -2.313895, 1, 0.4078431, 0, 1,
-1.370119, -1.571856, -1.136103, 1, 0.4156863, 0, 1,
-1.364197, 0.02928811, -2.430146, 1, 0.4196078, 0, 1,
-1.357672, -0.7216544, -3.555983, 1, 0.427451, 0, 1,
-1.357124, -0.748874, -1.800265, 1, 0.4313726, 0, 1,
-1.354374, 0.7457897, -2.298222, 1, 0.4392157, 0, 1,
-1.339127, -1.689083, -2.480732, 1, 0.4431373, 0, 1,
-1.336586, 0.2297456, -0.8256533, 1, 0.4509804, 0, 1,
-1.332466, -1.13866, -4.214264, 1, 0.454902, 0, 1,
-1.33219, 0.287228, -2.770247, 1, 0.4627451, 0, 1,
-1.328295, -0.6805484, -2.190422, 1, 0.4666667, 0, 1,
-1.325356, 0.9519939, -0.06749935, 1, 0.4745098, 0, 1,
-1.323603, 0.6752514, 0.3943737, 1, 0.4784314, 0, 1,
-1.320843, -0.9857976, -3.005768, 1, 0.4862745, 0, 1,
-1.320065, -1.025901, -2.609762, 1, 0.4901961, 0, 1,
-1.318573, 0.01747759, -1.82206, 1, 0.4980392, 0, 1,
-1.316718, 0.4208375, -0.9965559, 1, 0.5058824, 0, 1,
-1.313905, 2.181246, 0.4301405, 1, 0.509804, 0, 1,
-1.313268, 0.8870953, -1.392185, 1, 0.5176471, 0, 1,
-1.312267, -0.1221591, -0.5963632, 1, 0.5215687, 0, 1,
-1.310868, -0.6494759, -3.393043, 1, 0.5294118, 0, 1,
-1.305937, 0.8690182, 0.4649367, 1, 0.5333334, 0, 1,
-1.303627, -1.200788, -0.3369004, 1, 0.5411765, 0, 1,
-1.301451, -0.07616455, -2.809914, 1, 0.5450981, 0, 1,
-1.297996, -0.248663, -2.984651, 1, 0.5529412, 0, 1,
-1.294748, 0.3685923, -1.838443, 1, 0.5568628, 0, 1,
-1.292925, 0.330559, -2.762074, 1, 0.5647059, 0, 1,
-1.290086, -1.583134, -2.087647, 1, 0.5686275, 0, 1,
-1.285227, 0.5133618, -2.357238, 1, 0.5764706, 0, 1,
-1.27828, 0.3682979, 0.1285236, 1, 0.5803922, 0, 1,
-1.274489, -0.6419417, -3.156352, 1, 0.5882353, 0, 1,
-1.264521, -0.2160214, -1.9562, 1, 0.5921569, 0, 1,
-1.247346, 0.7134022, -0.3446312, 1, 0.6, 0, 1,
-1.244378, 0.4090557, -0.8479016, 1, 0.6078432, 0, 1,
-1.242549, 1.393284, 0.3658259, 1, 0.6117647, 0, 1,
-1.237132, 1.779591, -1.768207, 1, 0.6196079, 0, 1,
-1.229094, 0.9144331, -0.8118635, 1, 0.6235294, 0, 1,
-1.226665, 1.423346, -1.076833, 1, 0.6313726, 0, 1,
-1.225397, -1.308707, -1.619296, 1, 0.6352941, 0, 1,
-1.220778, -0.06704307, -0.9178784, 1, 0.6431373, 0, 1,
-1.216866, -0.04899596, -1.799181, 1, 0.6470588, 0, 1,
-1.211577, 0.636278, -0.4302636, 1, 0.654902, 0, 1,
-1.209178, 0.08503637, -1.220444, 1, 0.6588235, 0, 1,
-1.195006, -0.7622712, -1.933837, 1, 0.6666667, 0, 1,
-1.192988, 0.168149, -0.8161888, 1, 0.6705883, 0, 1,
-1.188166, -2.140566, -0.4783996, 1, 0.6784314, 0, 1,
-1.187106, -0.1904805, -1.27246, 1, 0.682353, 0, 1,
-1.185276, -0.7192231, -0.8185999, 1, 0.6901961, 0, 1,
-1.180149, 1.424283, -2.432445, 1, 0.6941177, 0, 1,
-1.179579, -0.2693012, 0.7048411, 1, 0.7019608, 0, 1,
-1.159319, 0.3297435, -2.385751, 1, 0.7098039, 0, 1,
-1.157835, -2.615936, -4.08209, 1, 0.7137255, 0, 1,
-1.150399, 0.213492, -2.420814, 1, 0.7215686, 0, 1,
-1.148351, 0.7854423, -0.6087665, 1, 0.7254902, 0, 1,
-1.143317, -0.1934759, -1.973678, 1, 0.7333333, 0, 1,
-1.140415, 0.2984437, -1.448293, 1, 0.7372549, 0, 1,
-1.136487, -0.03348952, -0.1764831, 1, 0.7450981, 0, 1,
-1.131378, 0.5518965, -1.600816, 1, 0.7490196, 0, 1,
-1.12867, 0.78849, 0.04125186, 1, 0.7568628, 0, 1,
-1.128639, -0.3298686, -3.050131, 1, 0.7607843, 0, 1,
-1.125992, -1.470689, -3.705235, 1, 0.7686275, 0, 1,
-1.119519, 1.869948, 0.4773191, 1, 0.772549, 0, 1,
-1.117689, -0.4501745, -2.042609, 1, 0.7803922, 0, 1,
-1.105613, 0.7027109, 1.635545, 1, 0.7843137, 0, 1,
-1.102883, -1.653091, -2.748736, 1, 0.7921569, 0, 1,
-1.100349, 0.9872558, -0.6962231, 1, 0.7960784, 0, 1,
-1.099815, -0.1733041, -2.465348, 1, 0.8039216, 0, 1,
-1.097486, 0.883412, -0.4969539, 1, 0.8117647, 0, 1,
-1.09314, 0.6030167, -1.361188, 1, 0.8156863, 0, 1,
-1.087876, 0.01498554, 0.01107875, 1, 0.8235294, 0, 1,
-1.075988, 0.380532, -1.723037, 1, 0.827451, 0, 1,
-1.072499, 1.187076, -0.8217183, 1, 0.8352941, 0, 1,
-1.072223, 1.477418, -1.320752, 1, 0.8392157, 0, 1,
-1.071125, -0.06806843, -0.6161024, 1, 0.8470588, 0, 1,
-1.070593, -1.182073, -1.589503, 1, 0.8509804, 0, 1,
-1.067306, 0.8643103, -2.187384, 1, 0.8588235, 0, 1,
-1.063349, 0.3885719, -0.2162512, 1, 0.8627451, 0, 1,
-1.061632, 0.1519587, -1.525927, 1, 0.8705882, 0, 1,
-1.059132, 2.474486, 0.1578164, 1, 0.8745098, 0, 1,
-1.056226, -0.08694351, -1.40477, 1, 0.8823529, 0, 1,
-1.046574, -0.769811, -2.533427, 1, 0.8862745, 0, 1,
-1.044305, 0.8361093, -2.105617, 1, 0.8941177, 0, 1,
-1.037019, -0.3683849, -2.131394, 1, 0.8980392, 0, 1,
-1.030128, -1.364153, -1.983472, 1, 0.9058824, 0, 1,
-1.02344, 0.758705, -1.736765, 1, 0.9137255, 0, 1,
-1.012433, 0.4286267, -1.520208, 1, 0.9176471, 0, 1,
-1.011728, -0.5899542, -1.993963, 1, 0.9254902, 0, 1,
-1.010292, 0.4679035, -0.8544796, 1, 0.9294118, 0, 1,
-1.00526, -3.394627, -1.580562, 1, 0.9372549, 0, 1,
-1.00209, -1.357126, -2.232174, 1, 0.9411765, 0, 1,
-0.9998977, 0.7787423, -1.132783, 1, 0.9490196, 0, 1,
-0.9831439, -0.7441529, -2.682775, 1, 0.9529412, 0, 1,
-0.9763775, 0.8947363, -1.751606, 1, 0.9607843, 0, 1,
-0.9703155, 0.6794619, -1.031389, 1, 0.9647059, 0, 1,
-0.9663439, -0.4877945, -3.227198, 1, 0.972549, 0, 1,
-0.9612135, 0.3574326, -2.159183, 1, 0.9764706, 0, 1,
-0.9567028, 0.4099846, -1.136526, 1, 0.9843137, 0, 1,
-0.9556791, 0.8514249, -2.33948, 1, 0.9882353, 0, 1,
-0.9548976, 0.3804859, -2.083342, 1, 0.9960784, 0, 1,
-0.9489394, -0.04123246, -1.371752, 0.9960784, 1, 0, 1,
-0.9462877, -0.3419241, -2.69537, 0.9921569, 1, 0, 1,
-0.939659, 0.5495071, -2.139017, 0.9843137, 1, 0, 1,
-0.9356076, 0.1397172, -2.123962, 0.9803922, 1, 0, 1,
-0.9296997, -1.084661, -2.512328, 0.972549, 1, 0, 1,
-0.9286977, -0.9478505, -2.492928, 0.9686275, 1, 0, 1,
-0.9249397, -0.1047069, -2.786672, 0.9607843, 1, 0, 1,
-0.917949, 0.03368499, -1.246341, 0.9568627, 1, 0, 1,
-0.9097714, 0.5445822, -1.738512, 0.9490196, 1, 0, 1,
-0.8926992, 1.319254, 0.4358552, 0.945098, 1, 0, 1,
-0.8840907, 0.1828288, -1.748856, 0.9372549, 1, 0, 1,
-0.8836222, -0.02403835, -1.524291, 0.9333333, 1, 0, 1,
-0.873935, -0.2148467, -2.80446, 0.9254902, 1, 0, 1,
-0.8731285, 0.3197892, -1.876781, 0.9215686, 1, 0, 1,
-0.8675779, -1.032639, -1.961418, 0.9137255, 1, 0, 1,
-0.8670478, -0.2070874, -2.712771, 0.9098039, 1, 0, 1,
-0.8658924, 2.494551, 0.9263533, 0.9019608, 1, 0, 1,
-0.8559701, -0.1539855, -1.689333, 0.8941177, 1, 0, 1,
-0.8558061, -0.01606275, -1.848269, 0.8901961, 1, 0, 1,
-0.8533029, -0.436337, -1.326909, 0.8823529, 1, 0, 1,
-0.8513026, -0.9303771, -2.313775, 0.8784314, 1, 0, 1,
-0.8473975, -0.4962602, -2.788039, 0.8705882, 1, 0, 1,
-0.8465115, -0.7084176, -1.482527, 0.8666667, 1, 0, 1,
-0.8408071, -0.4675619, -1.178806, 0.8588235, 1, 0, 1,
-0.8401743, -0.586311, 0.4279923, 0.854902, 1, 0, 1,
-0.8400823, -0.6265442, -1.752393, 0.8470588, 1, 0, 1,
-0.8392609, 0.9411261, -1.742611, 0.8431373, 1, 0, 1,
-0.8345683, 1.234504, -0.03296355, 0.8352941, 1, 0, 1,
-0.8253501, 0.1214156, -1.406528, 0.8313726, 1, 0, 1,
-0.8230743, -1.599927, -2.708149, 0.8235294, 1, 0, 1,
-0.8148399, 0.729356, -0.9579132, 0.8196079, 1, 0, 1,
-0.8138195, -0.5636203, -4.202058, 0.8117647, 1, 0, 1,
-0.810854, 1.058424, -0.5931265, 0.8078431, 1, 0, 1,
-0.8101286, 2.408106, 0.9821717, 0.8, 1, 0, 1,
-0.8089988, -0.5037599, -2.562717, 0.7921569, 1, 0, 1,
-0.8051453, 1.898177, -0.8505801, 0.7882353, 1, 0, 1,
-0.8044862, -0.6909581, -2.644624, 0.7803922, 1, 0, 1,
-0.7948543, -0.5927818, -2.261458, 0.7764706, 1, 0, 1,
-0.7910231, 0.6689699, -0.9975861, 0.7686275, 1, 0, 1,
-0.7887213, 0.3114142, -1.21473, 0.7647059, 1, 0, 1,
-0.7876204, 0.2797482, -2.370558, 0.7568628, 1, 0, 1,
-0.7873574, -0.8006852, -1.971063, 0.7529412, 1, 0, 1,
-0.7872037, -0.7494982, -3.122482, 0.7450981, 1, 0, 1,
-0.7824521, -0.9839066, -0.4903888, 0.7411765, 1, 0, 1,
-0.7725742, -0.3159063, -2.493348, 0.7333333, 1, 0, 1,
-0.7651203, -2.045117, -4.392519, 0.7294118, 1, 0, 1,
-0.7628468, 0.4341525, -2.295605, 0.7215686, 1, 0, 1,
-0.7627814, 0.819204, -1.398036, 0.7176471, 1, 0, 1,
-0.7626288, 0.912447, 1.448022, 0.7098039, 1, 0, 1,
-0.7596636, -0.7801946, -1.214401, 0.7058824, 1, 0, 1,
-0.7570105, -1.166492, -3.856791, 0.6980392, 1, 0, 1,
-0.7475287, 1.392873, 0.1156565, 0.6901961, 1, 0, 1,
-0.7454964, 1.888463, -0.9999247, 0.6862745, 1, 0, 1,
-0.7433223, -0.1523723, -3.516926, 0.6784314, 1, 0, 1,
-0.7389636, 0.9695449, -0.4171175, 0.6745098, 1, 0, 1,
-0.73628, 0.4281365, -1.758224, 0.6666667, 1, 0, 1,
-0.7290838, -0.9974984, -2.033174, 0.6627451, 1, 0, 1,
-0.7179395, 0.3161525, -2.03286, 0.654902, 1, 0, 1,
-0.7148207, -0.4578647, -2.76012, 0.6509804, 1, 0, 1,
-0.7133072, 1.403764, 0.7262822, 0.6431373, 1, 0, 1,
-0.7101152, -0.4377588, -2.994025, 0.6392157, 1, 0, 1,
-0.7091846, -0.5488167, -1.583208, 0.6313726, 1, 0, 1,
-0.7046513, -0.3436395, -2.962779, 0.627451, 1, 0, 1,
-0.7026567, -0.4825163, -1.361286, 0.6196079, 1, 0, 1,
-0.6994528, -0.9385152, -1.090685, 0.6156863, 1, 0, 1,
-0.6990863, 1.565666, 1.42811, 0.6078432, 1, 0, 1,
-0.6976062, 1.347735, -4.129044, 0.6039216, 1, 0, 1,
-0.6950318, 1.107859, -1.853926, 0.5960785, 1, 0, 1,
-0.6940413, 0.167452, -1.758169, 0.5882353, 1, 0, 1,
-0.6911423, 0.5147297, -1.94981, 0.5843138, 1, 0, 1,
-0.6907855, -1.193206, -2.058667, 0.5764706, 1, 0, 1,
-0.6837375, -1.052273, -1.393473, 0.572549, 1, 0, 1,
-0.6794966, -0.2618506, -2.480672, 0.5647059, 1, 0, 1,
-0.6756662, 0.03193913, -2.86289, 0.5607843, 1, 0, 1,
-0.6730127, 0.6975189, -1.228659, 0.5529412, 1, 0, 1,
-0.6710997, 0.0159832, -0.9610127, 0.5490196, 1, 0, 1,
-0.6703313, 0.399823, -0.2670029, 0.5411765, 1, 0, 1,
-0.6672543, -1.010637, -2.346779, 0.5372549, 1, 0, 1,
-0.6663821, 0.7820577, 0.06832941, 0.5294118, 1, 0, 1,
-0.6661587, 1.905128, 1.652456, 0.5254902, 1, 0, 1,
-0.6559227, -1.60649, -1.967867, 0.5176471, 1, 0, 1,
-0.6510777, 0.809909, -1.199599, 0.5137255, 1, 0, 1,
-0.6504404, 0.05625409, -3.076062, 0.5058824, 1, 0, 1,
-0.6461354, 0.8839473, 0.5626018, 0.5019608, 1, 0, 1,
-0.6406641, -0.1891167, -1.014321, 0.4941176, 1, 0, 1,
-0.6383144, -0.121172, -0.5468282, 0.4862745, 1, 0, 1,
-0.6361033, 0.01974916, -3.500185, 0.4823529, 1, 0, 1,
-0.6332912, -0.5093702, -1.734541, 0.4745098, 1, 0, 1,
-0.6306057, -1.809164, -1.67097, 0.4705882, 1, 0, 1,
-0.6291923, -1.830555, -3.921618, 0.4627451, 1, 0, 1,
-0.6204523, -1.335109, -2.960561, 0.4588235, 1, 0, 1,
-0.6154572, -1.732253, -2.759885, 0.4509804, 1, 0, 1,
-0.6070666, -0.465524, -0.7558804, 0.4470588, 1, 0, 1,
-0.6029444, 0.8266806, 1.120194, 0.4392157, 1, 0, 1,
-0.6002339, -0.9829851, -4.579295, 0.4352941, 1, 0, 1,
-0.5991672, -0.5038603, -1.847132, 0.427451, 1, 0, 1,
-0.586235, -1.710088, -0.9507324, 0.4235294, 1, 0, 1,
-0.5862116, 0.2025495, -2.462732, 0.4156863, 1, 0, 1,
-0.5756043, 1.104208, -0.6690931, 0.4117647, 1, 0, 1,
-0.5683269, 1.165796, 0.2958108, 0.4039216, 1, 0, 1,
-0.5678394, -0.256397, -3.836833, 0.3960784, 1, 0, 1,
-0.5677285, -2.905877, -3.625258, 0.3921569, 1, 0, 1,
-0.5657896, -1.480655, -3.590526, 0.3843137, 1, 0, 1,
-0.5597866, 0.9096557, -1.027262, 0.3803922, 1, 0, 1,
-0.5560811, 0.4030831, -2.371817, 0.372549, 1, 0, 1,
-0.5505507, -0.08316749, -1.859293, 0.3686275, 1, 0, 1,
-0.5503873, -0.3367921, -0.5485423, 0.3607843, 1, 0, 1,
-0.5498195, -0.5961472, -2.066961, 0.3568628, 1, 0, 1,
-0.5475693, -0.0004673883, -1.546218, 0.3490196, 1, 0, 1,
-0.5466634, 1.210292, -0.2737986, 0.345098, 1, 0, 1,
-0.5426803, 0.9778828, -0.3072827, 0.3372549, 1, 0, 1,
-0.5406728, -0.7350752, -1.879977, 0.3333333, 1, 0, 1,
-0.5390145, 0.7800034, -0.3941812, 0.3254902, 1, 0, 1,
-0.5389109, 0.6147794, -0.1442762, 0.3215686, 1, 0, 1,
-0.5388905, 1.016842, -0.04858015, 0.3137255, 1, 0, 1,
-0.5370804, -1.69234, -3.163848, 0.3098039, 1, 0, 1,
-0.5362423, 0.6097118, 0.4322821, 0.3019608, 1, 0, 1,
-0.5344185, 0.6406251, -1.250411, 0.2941177, 1, 0, 1,
-0.5342688, 1.004172, 0.3243838, 0.2901961, 1, 0, 1,
-0.532924, 0.3411464, -1.95858, 0.282353, 1, 0, 1,
-0.5322329, -0.776288, -2.387776, 0.2784314, 1, 0, 1,
-0.5271777, -0.5041105, -2.205426, 0.2705882, 1, 0, 1,
-0.5267501, -0.4086179, -0.9102224, 0.2666667, 1, 0, 1,
-0.5228529, 0.1779067, -0.1936716, 0.2588235, 1, 0, 1,
-0.5189288, 0.4346683, 0.3333898, 0.254902, 1, 0, 1,
-0.5124393, -0.5673427, -1.399988, 0.2470588, 1, 0, 1,
-0.5109361, -0.8112559, -1.838586, 0.2431373, 1, 0, 1,
-0.509748, -0.8534269, -3.239365, 0.2352941, 1, 0, 1,
-0.507534, -0.08321143, -1.435454, 0.2313726, 1, 0, 1,
-0.5063659, 0.3590446, -1.160953, 0.2235294, 1, 0, 1,
-0.5047716, -0.8807474, -3.473923, 0.2196078, 1, 0, 1,
-0.5015475, -0.558967, -2.291981, 0.2117647, 1, 0, 1,
-0.4999731, -1.866739, -3.766642, 0.2078431, 1, 0, 1,
-0.4984964, 0.1611971, -2.310092, 0.2, 1, 0, 1,
-0.4984804, -1.309908, -2.514198, 0.1921569, 1, 0, 1,
-0.494973, -1.278382, -3.141977, 0.1882353, 1, 0, 1,
-0.4928479, 1.441466, 0.6238241, 0.1803922, 1, 0, 1,
-0.4928111, 1.183627, -1.361343, 0.1764706, 1, 0, 1,
-0.4910614, -0.4351374, -1.025124, 0.1686275, 1, 0, 1,
-0.4909412, -1.716932, -1.822191, 0.1647059, 1, 0, 1,
-0.4883686, 0.9147301, -0.116921, 0.1568628, 1, 0, 1,
-0.4872275, -0.03526201, -2.563767, 0.1529412, 1, 0, 1,
-0.4863956, 0.7979911, -0.1495604, 0.145098, 1, 0, 1,
-0.4823525, -0.6882037, -4.269723, 0.1411765, 1, 0, 1,
-0.4697494, -0.6115974, -3.018983, 0.1333333, 1, 0, 1,
-0.4662134, -1.776241, -3.591864, 0.1294118, 1, 0, 1,
-0.4657266, -0.1987734, -2.306337, 0.1215686, 1, 0, 1,
-0.4596407, 1.172247, -1.086916, 0.1176471, 1, 0, 1,
-0.4586224, -1.070874, -1.624555, 0.1098039, 1, 0, 1,
-0.4544823, 0.8490446, -1.403639, 0.1058824, 1, 0, 1,
-0.4529488, -1.429054, -2.15781, 0.09803922, 1, 0, 1,
-0.4524176, -0.2506388, -1.700761, 0.09019608, 1, 0, 1,
-0.4510384, -0.6825963, -3.046477, 0.08627451, 1, 0, 1,
-0.4504244, 0.008580997, -0.435107, 0.07843138, 1, 0, 1,
-0.4501196, -0.3456314, -0.382028, 0.07450981, 1, 0, 1,
-0.4454033, -0.1808928, 0.2254986, 0.06666667, 1, 0, 1,
-0.4412669, 1.06533, -0.2963643, 0.0627451, 1, 0, 1,
-0.4379244, 1.153435, 4.006904, 0.05490196, 1, 0, 1,
-0.4354664, -0.06985182, -3.001129, 0.05098039, 1, 0, 1,
-0.4353552, -0.8777422, -4.571687, 0.04313726, 1, 0, 1,
-0.4351091, 1.505601, -0.7486623, 0.03921569, 1, 0, 1,
-0.4342297, 0.4142749, -1.545991, 0.03137255, 1, 0, 1,
-0.4307134, -0.4365095, -3.759942, 0.02745098, 1, 0, 1,
-0.4304177, -0.7621205, -2.778244, 0.01960784, 1, 0, 1,
-0.4288893, -0.6496221, -1.794719, 0.01568628, 1, 0, 1,
-0.4270348, -2.092054, -0.6223968, 0.007843138, 1, 0, 1,
-0.4223477, 1.408787, -1.758828, 0.003921569, 1, 0, 1,
-0.4213718, 1.111, 1.485376, 0, 1, 0.003921569, 1,
-0.4177808, -0.954401, -2.2255, 0, 1, 0.01176471, 1,
-0.4172605, 0.432771, -0.2526533, 0, 1, 0.01568628, 1,
-0.416809, 1.556429, -1.606187, 0, 1, 0.02352941, 1,
-0.4153479, 0.07728627, -1.70927, 0, 1, 0.02745098, 1,
-0.4121559, -0.2471712, -2.377057, 0, 1, 0.03529412, 1,
-0.4091748, -0.2079389, -2.522769, 0, 1, 0.03921569, 1,
-0.4089884, -1.378408, -3.862644, 0, 1, 0.04705882, 1,
-0.4079022, 0.9183589, 0.1089974, 0, 1, 0.05098039, 1,
-0.4058588, 0.2635318, 0.1413904, 0, 1, 0.05882353, 1,
-0.4015708, 0.4502027, -1.51325, 0, 1, 0.0627451, 1,
-0.3985963, 0.04129591, -0.6931017, 0, 1, 0.07058824, 1,
-0.3932931, -1.14372, -3.117512, 0, 1, 0.07450981, 1,
-0.3896175, 0.001749725, -3.237213, 0, 1, 0.08235294, 1,
-0.3885952, 0.7140562, -0.1562224, 0, 1, 0.08627451, 1,
-0.3767369, 1.142633, 1.320537, 0, 1, 0.09411765, 1,
-0.3767054, 0.06215538, -0.6675949, 0, 1, 0.1019608, 1,
-0.3709954, -1.711941, -2.582207, 0, 1, 0.1058824, 1,
-0.3693407, -0.2251395, -2.56212, 0, 1, 0.1137255, 1,
-0.3682572, -0.05247146, -3.357137, 0, 1, 0.1176471, 1,
-0.3659183, 0.4235578, -1.846246, 0, 1, 0.1254902, 1,
-0.3656926, 0.3036895, -1.358191, 0, 1, 0.1294118, 1,
-0.3634425, -0.3612775, -0.7371799, 0, 1, 0.1372549, 1,
-0.362738, 1.190055, -2.229072, 0, 1, 0.1411765, 1,
-0.3603575, -0.367768, -0.7043971, 0, 1, 0.1490196, 1,
-0.3564205, 0.2707159, -0.4959498, 0, 1, 0.1529412, 1,
-0.3554509, 1.815753, -1.351264, 0, 1, 0.1607843, 1,
-0.3552344, -0.9945169, -2.694981, 0, 1, 0.1647059, 1,
-0.3531604, 0.5297374, -0.9762372, 0, 1, 0.172549, 1,
-0.3513657, 1.516475, 1.369171, 0, 1, 0.1764706, 1,
-0.3494265, 0.7890788, -1.93079, 0, 1, 0.1843137, 1,
-0.3481113, -1.701123, -2.963362, 0, 1, 0.1882353, 1,
-0.3438962, 0.9212198, 1.033807, 0, 1, 0.1960784, 1,
-0.3421366, -0.9456048, -2.679188, 0, 1, 0.2039216, 1,
-0.3401767, 0.5273039, 1.200752, 0, 1, 0.2078431, 1,
-0.338941, -0.8802382, -2.929609, 0, 1, 0.2156863, 1,
-0.33736, -1.654158, -1.477589, 0, 1, 0.2196078, 1,
-0.3371913, -0.818916, -2.946861, 0, 1, 0.227451, 1,
-0.3336377, 1.187614, -0.1811685, 0, 1, 0.2313726, 1,
-0.3308629, 0.6881903, -0.4164262, 0, 1, 0.2392157, 1,
-0.3294435, 1.135286, 0.4114978, 0, 1, 0.2431373, 1,
-0.3259083, 0.3252212, 0.4653458, 0, 1, 0.2509804, 1,
-0.3257807, 0.3379412, -1.383054, 0, 1, 0.254902, 1,
-0.3241313, 0.8441122, 0.04523434, 0, 1, 0.2627451, 1,
-0.3199593, 0.100304, -2.067834, 0, 1, 0.2666667, 1,
-0.3193857, -0.2188007, -4.205135, 0, 1, 0.2745098, 1,
-0.316003, 0.7146677, 0.4540377, 0, 1, 0.2784314, 1,
-0.3117146, -0.7921093, -4.271188, 0, 1, 0.2862745, 1,
-0.3092707, 1.19887, -1.690695, 0, 1, 0.2901961, 1,
-0.309002, 0.8907013, -0.2554977, 0, 1, 0.2980392, 1,
-0.3089654, 2.013187, 0.07366653, 0, 1, 0.3058824, 1,
-0.3088188, -1.167827, -2.817218, 0, 1, 0.3098039, 1,
-0.307949, 1.001556, 0.5350274, 0, 1, 0.3176471, 1,
-0.305732, 0.7851111, -0.2331286, 0, 1, 0.3215686, 1,
-0.3049644, 0.7683788, 0.01274458, 0, 1, 0.3294118, 1,
-0.303805, -1.080611, -2.648823, 0, 1, 0.3333333, 1,
-0.3012711, -0.1706817, -1.691914, 0, 1, 0.3411765, 1,
-0.2970401, -0.1950426, -2.007792, 0, 1, 0.345098, 1,
-0.2963858, 0.5611718, -2.575721, 0, 1, 0.3529412, 1,
-0.294991, -1.310215, -2.187963, 0, 1, 0.3568628, 1,
-0.2917446, -0.2856901, -1.338222, 0, 1, 0.3647059, 1,
-0.290893, 0.8923987, -0.6865203, 0, 1, 0.3686275, 1,
-0.2882991, -0.1902089, -2.492828, 0, 1, 0.3764706, 1,
-0.2851616, 0.5579991, -0.3989435, 0, 1, 0.3803922, 1,
-0.2805498, -1.416484, -1.02656, 0, 1, 0.3882353, 1,
-0.276832, 1.065125, -1.349222, 0, 1, 0.3921569, 1,
-0.2731921, 0.06750595, -0.358206, 0, 1, 0.4, 1,
-0.2705371, -0.5004592, -2.82427, 0, 1, 0.4078431, 1,
-0.2636775, 0.3509727, 0.3614499, 0, 1, 0.4117647, 1,
-0.2628623, -0.9910999, -3.496479, 0, 1, 0.4196078, 1,
-0.2606476, -0.3359495, -1.866777, 0, 1, 0.4235294, 1,
-0.2578067, -0.5000557, -3.469018, 0, 1, 0.4313726, 1,
-0.2564823, -1.256745, -2.208398, 0, 1, 0.4352941, 1,
-0.2483976, -2.212931, -4.036723, 0, 1, 0.4431373, 1,
-0.2478122, 0.6078134, -0.5512912, 0, 1, 0.4470588, 1,
-0.246219, -0.7162529, -3.753311, 0, 1, 0.454902, 1,
-0.2444221, -0.2987584, -4.049708, 0, 1, 0.4588235, 1,
-0.2395058, 0.3969554, -0.09932698, 0, 1, 0.4666667, 1,
-0.2384112, 0.1710785, 0.6269214, 0, 1, 0.4705882, 1,
-0.2374166, 0.2198879, -0.7878062, 0, 1, 0.4784314, 1,
-0.2366508, 0.2457038, 0.3433232, 0, 1, 0.4823529, 1,
-0.2314924, -0.563716, -4.173451, 0, 1, 0.4901961, 1,
-0.2312018, 0.4845004, -0.9632478, 0, 1, 0.4941176, 1,
-0.2257118, 1.148579, 0.5369083, 0, 1, 0.5019608, 1,
-0.2250159, -0.3663301, -0.7087247, 0, 1, 0.509804, 1,
-0.224275, 0.2363814, -0.6834859, 0, 1, 0.5137255, 1,
-0.2220206, 0.7614917, 0.1664215, 0, 1, 0.5215687, 1,
-0.2216956, -0.4309174, -3.147671, 0, 1, 0.5254902, 1,
-0.2196033, -1.934608, -3.803102, 0, 1, 0.5333334, 1,
-0.2174392, 1.196846, 0.780727, 0, 1, 0.5372549, 1,
-0.2158448, -0.8785574, -3.835023, 0, 1, 0.5450981, 1,
-0.2148166, 0.8460126, 0.5362579, 0, 1, 0.5490196, 1,
-0.2146131, 0.579947, 0.004419494, 0, 1, 0.5568628, 1,
-0.2104063, -0.4839084, -3.608904, 0, 1, 0.5607843, 1,
-0.2102309, 1.223019, 0.0227591, 0, 1, 0.5686275, 1,
-0.2000058, 2.284408, -1.083529, 0, 1, 0.572549, 1,
-0.19981, -3.109637, -2.592419, 0, 1, 0.5803922, 1,
-0.1919196, 0.07469016, -0.2949691, 0, 1, 0.5843138, 1,
-0.1880251, -0.1958521, -2.955371, 0, 1, 0.5921569, 1,
-0.1866145, -0.03616095, -1.991403, 0, 1, 0.5960785, 1,
-0.1820643, 0.3764701, -3.194724, 0, 1, 0.6039216, 1,
-0.1805183, -1.60117, -4.714975, 0, 1, 0.6117647, 1,
-0.1798307, 0.9466263, -1.422068, 0, 1, 0.6156863, 1,
-0.1794742, -1.282646, -4.012165, 0, 1, 0.6235294, 1,
-0.1764797, 0.2199008, -0.707938, 0, 1, 0.627451, 1,
-0.1745787, 0.8057981, 0.9564178, 0, 1, 0.6352941, 1,
-0.1671922, 0.5050659, 0.2068923, 0, 1, 0.6392157, 1,
-0.1671515, -0.1300624, -2.485688, 0, 1, 0.6470588, 1,
-0.1601269, 0.0155315, -0.2768376, 0, 1, 0.6509804, 1,
-0.1587203, 0.1996601, -0.3071111, 0, 1, 0.6588235, 1,
-0.1501231, 0.6195451, 1.051388, 0, 1, 0.6627451, 1,
-0.1450473, -0.3120084, -2.478794, 0, 1, 0.6705883, 1,
-0.1419851, -0.09871066, -2.849885, 0, 1, 0.6745098, 1,
-0.1409733, -1.370662, -3.524208, 0, 1, 0.682353, 1,
-0.1399163, 1.688282, 0.2200825, 0, 1, 0.6862745, 1,
-0.1337898, -0.793951, -4.732137, 0, 1, 0.6941177, 1,
-0.133419, -2.34882, -1.354664, 0, 1, 0.7019608, 1,
-0.1296058, 1.072071, -2.401861, 0, 1, 0.7058824, 1,
-0.1286661, -1.848011, -2.35701, 0, 1, 0.7137255, 1,
-0.1285537, -1.471739, -1.59739, 0, 1, 0.7176471, 1,
-0.1265622, -0.02135062, -2.814761, 0, 1, 0.7254902, 1,
-0.1229315, -1.04702, -4.345383, 0, 1, 0.7294118, 1,
-0.1219754, -1.048856, -3.577095, 0, 1, 0.7372549, 1,
-0.1166856, -2.18204, -2.336445, 0, 1, 0.7411765, 1,
-0.114988, 0.5076919, -0.4628581, 0, 1, 0.7490196, 1,
-0.1132268, 0.9534087, -0.1677206, 0, 1, 0.7529412, 1,
-0.1131046, 1.716681, -1.27499, 0, 1, 0.7607843, 1,
-0.1125246, -1.056222, -4.331574, 0, 1, 0.7647059, 1,
-0.1113658, 0.8901138, -0.7982092, 0, 1, 0.772549, 1,
-0.1105838, -0.884845, -4.63698, 0, 1, 0.7764706, 1,
-0.1102929, -0.7182929, -2.578433, 0, 1, 0.7843137, 1,
-0.110183, 0.1811779, 1.026429, 0, 1, 0.7882353, 1,
-0.1044364, -0.4829822, -3.421836, 0, 1, 0.7960784, 1,
-0.1036016, -0.5070127, -1.831853, 0, 1, 0.8039216, 1,
-0.1021943, 2.10464, -2.037008, 0, 1, 0.8078431, 1,
-0.09887164, -1.023628, -2.503216, 0, 1, 0.8156863, 1,
-0.09666596, -0.6031792, -3.125835, 0, 1, 0.8196079, 1,
-0.09660645, -0.09216263, -2.181499, 0, 1, 0.827451, 1,
-0.09551965, -0.4269284, -0.3052221, 0, 1, 0.8313726, 1,
-0.08723835, 0.333873, 0.7732741, 0, 1, 0.8392157, 1,
-0.08640904, -0.04466631, -0.7976253, 0, 1, 0.8431373, 1,
-0.08265133, 1.118337, 0.1235524, 0, 1, 0.8509804, 1,
-0.07908055, -0.4991578, -3.397267, 0, 1, 0.854902, 1,
-0.07828394, -0.8815416, -1.912421, 0, 1, 0.8627451, 1,
-0.07635345, 1.392288, -0.8079371, 0, 1, 0.8666667, 1,
-0.07041761, -1.484151, -3.150093, 0, 1, 0.8745098, 1,
-0.06998096, 0.3318085, -0.4894153, 0, 1, 0.8784314, 1,
-0.06947775, 0.3438503, -1.349201, 0, 1, 0.8862745, 1,
-0.05622833, -1.215487, -4.604839, 0, 1, 0.8901961, 1,
-0.05416312, 1.552526, 1.080175, 0, 1, 0.8980392, 1,
-0.05254443, -0.6109594, -4.990384, 0, 1, 0.9058824, 1,
-0.05170279, -0.1340985, -1.884153, 0, 1, 0.9098039, 1,
-0.05043804, 1.176609, -0.4574043, 0, 1, 0.9176471, 1,
-0.05022633, -1.559887, -2.642582, 0, 1, 0.9215686, 1,
-0.04893095, 1.228808, 0.3348399, 0, 1, 0.9294118, 1,
-0.04425918, 0.2992499, -0.9760605, 0, 1, 0.9333333, 1,
-0.03084332, -0.8316124, -4.008772, 0, 1, 0.9411765, 1,
-0.03015316, -1.201847, -3.413658, 0, 1, 0.945098, 1,
-0.02564928, -0.8585321, -2.24532, 0, 1, 0.9529412, 1,
-0.01984907, -2.23644, -2.406552, 0, 1, 0.9568627, 1,
-0.01877273, -1.487086, -3.528344, 0, 1, 0.9647059, 1,
-0.01568206, 1.170918, -0.3830558, 0, 1, 0.9686275, 1,
-0.009076177, 0.05374147, 0.4519703, 0, 1, 0.9764706, 1,
-0.007845481, 0.0009729905, -3.291632, 0, 1, 0.9803922, 1,
-0.004366569, 1.22838, 0.08364809, 0, 1, 0.9882353, 1,
0.002369539, -0.5647224, 1.770555, 0, 1, 0.9921569, 1,
0.00432511, -1.605449, 5.32132, 0, 1, 1, 1,
0.005010742, 0.2466088, 0.09844333, 0, 0.9921569, 1, 1,
0.007890516, -1.25943, 2.593655, 0, 0.9882353, 1, 1,
0.009120181, -1.645022, 2.549418, 0, 0.9803922, 1, 1,
0.01094368, -1.530133, 2.528041, 0, 0.9764706, 1, 1,
0.01128722, 0.7736428, -0.7281854, 0, 0.9686275, 1, 1,
0.01401948, -0.1355718, 2.320348, 0, 0.9647059, 1, 1,
0.01432438, -0.429574, 4.872194, 0, 0.9568627, 1, 1,
0.01560418, -1.963524, 3.688608, 0, 0.9529412, 1, 1,
0.01641828, -1.001421, 3.18364, 0, 0.945098, 1, 1,
0.01692614, 0.4300977, -2.032518, 0, 0.9411765, 1, 1,
0.01918556, -0.5757543, 3.532555, 0, 0.9333333, 1, 1,
0.02011736, -0.3668758, 2.188889, 0, 0.9294118, 1, 1,
0.02071434, -0.1718693, 3.726562, 0, 0.9215686, 1, 1,
0.02143651, 0.6685354, -0.4380403, 0, 0.9176471, 1, 1,
0.02713374, 2.223195, 0.02187145, 0, 0.9098039, 1, 1,
0.02858971, -0.7881302, 4.805128, 0, 0.9058824, 1, 1,
0.03525138, -0.4409205, 2.722458, 0, 0.8980392, 1, 1,
0.03545227, 0.9225138, 0.778691, 0, 0.8901961, 1, 1,
0.03696436, 0.01752688, 2.532754, 0, 0.8862745, 1, 1,
0.04181316, 0.3282388, -0.7717364, 0, 0.8784314, 1, 1,
0.05017751, -1.213013, 1.84874, 0, 0.8745098, 1, 1,
0.05136731, -0.6559568, 2.125761, 0, 0.8666667, 1, 1,
0.05200395, -0.1040048, 4.851112, 0, 0.8627451, 1, 1,
0.05444386, 2.469966, 0.6163189, 0, 0.854902, 1, 1,
0.05644202, 0.2410933, 1.843412, 0, 0.8509804, 1, 1,
0.063022, 0.6395119, -1.286755, 0, 0.8431373, 1, 1,
0.06328952, 0.3297948, 1.066827, 0, 0.8392157, 1, 1,
0.06675562, -0.815995, 3.252337, 0, 0.8313726, 1, 1,
0.07044981, 0.2890975, 0.7389848, 0, 0.827451, 1, 1,
0.0718993, 0.2017493, 1.919401, 0, 0.8196079, 1, 1,
0.07719626, 1.649029, 0.06727839, 0, 0.8156863, 1, 1,
0.07814979, -0.8791041, 2.041224, 0, 0.8078431, 1, 1,
0.07837156, -0.7893426, 2.467528, 0, 0.8039216, 1, 1,
0.07846215, 2.019084, -0.7830076, 0, 0.7960784, 1, 1,
0.08132943, -2.111404, 1.271623, 0, 0.7882353, 1, 1,
0.08406616, -0.5374087, 2.359419, 0, 0.7843137, 1, 1,
0.08532546, -0.2903907, 1.68065, 0, 0.7764706, 1, 1,
0.08567294, -1.086763, 2.954133, 0, 0.772549, 1, 1,
0.09018884, -1.682869, 2.51043, 0, 0.7647059, 1, 1,
0.09220536, -0.4409253, 0.8205939, 0, 0.7607843, 1, 1,
0.09516608, 0.6374142, -0.2374318, 0, 0.7529412, 1, 1,
0.09697534, -1.2451, 2.29203, 0, 0.7490196, 1, 1,
0.09704298, -0.4094288, 2.940867, 0, 0.7411765, 1, 1,
0.09709609, 0.03326663, 0.4850755, 0, 0.7372549, 1, 1,
0.09988401, 0.3054636, 0.1827229, 0, 0.7294118, 1, 1,
0.1040843, 0.5925615, -0.1741397, 0, 0.7254902, 1, 1,
0.1054586, 0.5647284, 0.2624098, 0, 0.7176471, 1, 1,
0.1122803, 1.681891, 0.3682672, 0, 0.7137255, 1, 1,
0.1130745, 1.142664, -1.158747, 0, 0.7058824, 1, 1,
0.1161311, -0.3654848, 2.639751, 0, 0.6980392, 1, 1,
0.1177032, -0.7552543, 2.339971, 0, 0.6941177, 1, 1,
0.1190955, -1.529908, 1.732175, 0, 0.6862745, 1, 1,
0.1206105, 0.9759102, 0.4669181, 0, 0.682353, 1, 1,
0.1257916, -0.07774942, 2.488838, 0, 0.6745098, 1, 1,
0.1283287, -0.250685, 1.539433, 0, 0.6705883, 1, 1,
0.1290325, -0.8495512, 2.053996, 0, 0.6627451, 1, 1,
0.1305182, -0.591666, 3.51851, 0, 0.6588235, 1, 1,
0.1328717, 0.1041606, -0.7194656, 0, 0.6509804, 1, 1,
0.1348261, 0.955295, -1.845465, 0, 0.6470588, 1, 1,
0.1393569, 0.003839536, 1.508789, 0, 0.6392157, 1, 1,
0.1405248, 1.256233, -1.629045, 0, 0.6352941, 1, 1,
0.1405576, 0.4590916, 0.5442784, 0, 0.627451, 1, 1,
0.1426374, 0.5069491, -0.000772894, 0, 0.6235294, 1, 1,
0.1426583, 0.001987072, 2.811972, 0, 0.6156863, 1, 1,
0.1502273, 0.8929968, -1.502733, 0, 0.6117647, 1, 1,
0.1533605, -0.2761505, 3.441583, 0, 0.6039216, 1, 1,
0.1591926, 0.4713002, -0.3618767, 0, 0.5960785, 1, 1,
0.1593686, 1.588236, 0.5740949, 0, 0.5921569, 1, 1,
0.1602259, 2.016322, -0.8223457, 0, 0.5843138, 1, 1,
0.1618526, -1.751532, 3.915539, 0, 0.5803922, 1, 1,
0.1624265, -0.5221535, 1.32033, 0, 0.572549, 1, 1,
0.1633426, -1.118844, 3.947849, 0, 0.5686275, 1, 1,
0.1691037, 0.8566129, -0.6647959, 0, 0.5607843, 1, 1,
0.1701208, -0.30773, 1.634971, 0, 0.5568628, 1, 1,
0.1703037, -0.07022028, 1.482043, 0, 0.5490196, 1, 1,
0.1706425, -0.1296801, 3.851878, 0, 0.5450981, 1, 1,
0.1707666, 0.3132075, 0.07757611, 0, 0.5372549, 1, 1,
0.1743096, 0.3090928, -0.8905577, 0, 0.5333334, 1, 1,
0.1792602, 0.5457051, -0.6344689, 0, 0.5254902, 1, 1,
0.1827462, 0.5099052, 0.2522904, 0, 0.5215687, 1, 1,
0.184323, 0.8023785, 0.8356797, 0, 0.5137255, 1, 1,
0.1869894, -0.854859, 3.467072, 0, 0.509804, 1, 1,
0.1886959, -1.386925, 4.899035, 0, 0.5019608, 1, 1,
0.1947312, -2.10175, 3.258312, 0, 0.4941176, 1, 1,
0.1967263, -0.08477051, 1.795563, 0, 0.4901961, 1, 1,
0.1979443, -1.555216, 4.092351, 0, 0.4823529, 1, 1,
0.2072081, -1.578464, 2.780976, 0, 0.4784314, 1, 1,
0.2103581, -1.405583, 4.143281, 0, 0.4705882, 1, 1,
0.2105472, -0.5430065, 3.722481, 0, 0.4666667, 1, 1,
0.2118194, -0.09040637, 2.168324, 0, 0.4588235, 1, 1,
0.212462, -1.260767, 2.159465, 0, 0.454902, 1, 1,
0.2144494, 0.3270803, 0.5477456, 0, 0.4470588, 1, 1,
0.2145154, -0.5020435, 2.590183, 0, 0.4431373, 1, 1,
0.2170039, -1.752779, 3.884699, 0, 0.4352941, 1, 1,
0.2185575, -1.833773, 1.539064, 0, 0.4313726, 1, 1,
0.2208729, 0.08337123, 2.479947, 0, 0.4235294, 1, 1,
0.2240925, 1.654397, 0.2388271, 0, 0.4196078, 1, 1,
0.2243001, -0.7052281, 3.142159, 0, 0.4117647, 1, 1,
0.2255549, 1.5095, 0.7022992, 0, 0.4078431, 1, 1,
0.226561, -1.449863, 2.788527, 0, 0.4, 1, 1,
0.2308025, -0.1833407, 1.011527, 0, 0.3921569, 1, 1,
0.2310813, 0.2356786, -1.906135, 0, 0.3882353, 1, 1,
0.2341948, -0.6313596, 3.417215, 0, 0.3803922, 1, 1,
0.2382585, 0.432146, 0.3753485, 0, 0.3764706, 1, 1,
0.2434717, -0.9304086, 5.242331, 0, 0.3686275, 1, 1,
0.2492651, -1.688342, 3.557456, 0, 0.3647059, 1, 1,
0.2517422, 0.6188858, 0.2637457, 0, 0.3568628, 1, 1,
0.2528099, -0.02009566, 1.926576, 0, 0.3529412, 1, 1,
0.2536046, 2.732883, 0.3716639, 0, 0.345098, 1, 1,
0.2546994, 0.7818191, 1.304687, 0, 0.3411765, 1, 1,
0.2575404, 1.506961, -0.5152625, 0, 0.3333333, 1, 1,
0.2611429, 0.4063306, 0.6425681, 0, 0.3294118, 1, 1,
0.2611644, -2.656042, 2.395965, 0, 0.3215686, 1, 1,
0.262317, 0.8620546, -1.26403, 0, 0.3176471, 1, 1,
0.2651353, -0.2449969, 2.069811, 0, 0.3098039, 1, 1,
0.2678239, -0.7603178, 3.437332, 0, 0.3058824, 1, 1,
0.26785, 1.262011, -0.07573999, 0, 0.2980392, 1, 1,
0.2680975, -1.22585, 3.508668, 0, 0.2901961, 1, 1,
0.2692035, 0.2790479, 1.005106, 0, 0.2862745, 1, 1,
0.2698985, 1.173668, 0.727003, 0, 0.2784314, 1, 1,
0.2743717, 0.7104753, -0.5061482, 0, 0.2745098, 1, 1,
0.2784289, -1.277411, 2.066907, 0, 0.2666667, 1, 1,
0.2809392, -0.1901852, 0.2066448, 0, 0.2627451, 1, 1,
0.2852513, -0.818662, 4.298457, 0, 0.254902, 1, 1,
0.2870734, 1.083337, -0.7956321, 0, 0.2509804, 1, 1,
0.2887179, 0.8486471, 0.8001547, 0, 0.2431373, 1, 1,
0.2911865, 0.6290907, 0.7686318, 0, 0.2392157, 1, 1,
0.2936875, 0.6240052, 1.336229, 0, 0.2313726, 1, 1,
0.2965024, 0.09278947, 0.5505853, 0, 0.227451, 1, 1,
0.2968465, -0.01093343, 2.376656, 0, 0.2196078, 1, 1,
0.3057919, -0.8193742, 2.009176, 0, 0.2156863, 1, 1,
0.3138611, -1.096437, 3.343161, 0, 0.2078431, 1, 1,
0.3155054, -0.6709927, 3.724812, 0, 0.2039216, 1, 1,
0.3164537, 0.305846, 0.8603241, 0, 0.1960784, 1, 1,
0.3165976, 0.4666163, 1.72248, 0, 0.1882353, 1, 1,
0.3172983, 0.2337799, 1.252128, 0, 0.1843137, 1, 1,
0.3204659, -0.8912644, 4.337432, 0, 0.1764706, 1, 1,
0.3228965, 0.04448255, 0.2630349, 0, 0.172549, 1, 1,
0.3235527, 0.7999576, 0.4649948, 0, 0.1647059, 1, 1,
0.3269045, -0.9610301, 2.354917, 0, 0.1607843, 1, 1,
0.3319112, -1.201478, 3.515062, 0, 0.1529412, 1, 1,
0.3331504, 0.2929927, -0.2145546, 0, 0.1490196, 1, 1,
0.3360042, 0.2214158, 1.577796, 0, 0.1411765, 1, 1,
0.3360131, -0.8279966, 0.6454884, 0, 0.1372549, 1, 1,
0.3365469, -0.1100703, 1.959911, 0, 0.1294118, 1, 1,
0.3399121, -0.6605049, 2.441361, 0, 0.1254902, 1, 1,
0.3427805, -0.5642409, 3.163418, 0, 0.1176471, 1, 1,
0.3444843, -1.788572, 2.403437, 0, 0.1137255, 1, 1,
0.3485917, 1.641663, 0.5472277, 0, 0.1058824, 1, 1,
0.3491988, 0.8758786, 0.4715379, 0, 0.09803922, 1, 1,
0.351928, -0.9114257, 3.182685, 0, 0.09411765, 1, 1,
0.3528002, 2.231318, -0.4100787, 0, 0.08627451, 1, 1,
0.3593707, -0.31338, 1.15882, 0, 0.08235294, 1, 1,
0.360573, 0.5919015, -0.8575765, 0, 0.07450981, 1, 1,
0.3610598, 0.1620459, 1.899881, 0, 0.07058824, 1, 1,
0.3626353, -0.3931681, 1.134453, 0, 0.0627451, 1, 1,
0.3684441, 0.4892857, 2.324934, 0, 0.05882353, 1, 1,
0.3775921, 1.109731, -0.5526578, 0, 0.05098039, 1, 1,
0.3896834, 1.741137, 2.981487, 0, 0.04705882, 1, 1,
0.3954709, 0.2704981, -0.5145692, 0, 0.03921569, 1, 1,
0.3980376, -1.031818, 1.726053, 0, 0.03529412, 1, 1,
0.4001148, -1.748223, 3.028267, 0, 0.02745098, 1, 1,
0.4043027, -0.2584724, 1.399875, 0, 0.02352941, 1, 1,
0.4058803, 0.1326763, 0.4129203, 0, 0.01568628, 1, 1,
0.4114752, -1.388525, 4.092146, 0, 0.01176471, 1, 1,
0.4174699, 0.9500594, -0.2976577, 0, 0.003921569, 1, 1,
0.4208415, 0.3110403, 0.4312305, 0.003921569, 0, 1, 1,
0.4243419, 0.1228137, -0.3204315, 0.007843138, 0, 1, 1,
0.4252909, -1.245981, 2.926805, 0.01568628, 0, 1, 1,
0.426498, 0.2887273, 0.1961578, 0.01960784, 0, 1, 1,
0.4287197, 1.361611, -0.403616, 0.02745098, 0, 1, 1,
0.4303469, 0.4129698, 1.163759, 0.03137255, 0, 1, 1,
0.4313276, -0.3721806, 2.114362, 0.03921569, 0, 1, 1,
0.4352336, 1.183506, 0.7826086, 0.04313726, 0, 1, 1,
0.4429902, -0.4653328, 1.913015, 0.05098039, 0, 1, 1,
0.4431506, 0.8065787, 1.623879, 0.05490196, 0, 1, 1,
0.4459919, 3.049387, 0.04505145, 0.0627451, 0, 1, 1,
0.4478159, -0.6254459, 0.8846324, 0.06666667, 0, 1, 1,
0.4527766, -0.4817464, 3.289412, 0.07450981, 0, 1, 1,
0.4623074, 1.096961, 1.502463, 0.07843138, 0, 1, 1,
0.4688876, -0.8150361, 4.307268, 0.08627451, 0, 1, 1,
0.4693255, -0.6172112, 1.42458, 0.09019608, 0, 1, 1,
0.4710895, 0.5593557, 1.604062, 0.09803922, 0, 1, 1,
0.4729525, -0.8275902, 3.241884, 0.1058824, 0, 1, 1,
0.4753315, 1.715618, 1.552665, 0.1098039, 0, 1, 1,
0.4753766, 0.9013774, 2.21911, 0.1176471, 0, 1, 1,
0.4779693, 0.8120198, 0.4088968, 0.1215686, 0, 1, 1,
0.482383, -0.618261, 2.849446, 0.1294118, 0, 1, 1,
0.4829448, -0.02410588, 2.508289, 0.1333333, 0, 1, 1,
0.4834862, 0.8137543, 0.6027596, 0.1411765, 0, 1, 1,
0.4851238, -1.219641, 1.963728, 0.145098, 0, 1, 1,
0.4863291, 0.8418497, 0.6918758, 0.1529412, 0, 1, 1,
0.4870445, 0.7204847, 2.020152, 0.1568628, 0, 1, 1,
0.4881961, 1.578455, 0.4660839, 0.1647059, 0, 1, 1,
0.4888316, -0.1428642, 0.4391614, 0.1686275, 0, 1, 1,
0.4921449, -0.1673042, 1.363063, 0.1764706, 0, 1, 1,
0.4945252, -0.3535371, 0.5457844, 0.1803922, 0, 1, 1,
0.4953277, 0.2943451, -0.01196602, 0.1882353, 0, 1, 1,
0.4998479, 0.0733553, 1.085175, 0.1921569, 0, 1, 1,
0.5017276, -1.087294, 2.628086, 0.2, 0, 1, 1,
0.5029824, 0.434402, 0.3781662, 0.2078431, 0, 1, 1,
0.5035625, 0.8173687, 2.243428, 0.2117647, 0, 1, 1,
0.503924, -0.5602279, 2.286252, 0.2196078, 0, 1, 1,
0.5074009, 0.07416132, 1.603828, 0.2235294, 0, 1, 1,
0.5164682, -0.373433, 2.197562, 0.2313726, 0, 1, 1,
0.5190796, 1.053305, 0.09734221, 0.2352941, 0, 1, 1,
0.5206494, -1.176443, 3.545891, 0.2431373, 0, 1, 1,
0.5234979, -0.3073377, 1.199045, 0.2470588, 0, 1, 1,
0.5241765, -1.068777, 1.814718, 0.254902, 0, 1, 1,
0.527779, 0.06526078, 1.399487, 0.2588235, 0, 1, 1,
0.528061, 0.6021974, 0.6344731, 0.2666667, 0, 1, 1,
0.5370272, 0.2919759, 1.726328, 0.2705882, 0, 1, 1,
0.5391008, -0.1254915, 0.7757559, 0.2784314, 0, 1, 1,
0.5413873, 0.2374747, 2.810439, 0.282353, 0, 1, 1,
0.541702, 0.6554809, 1.444757, 0.2901961, 0, 1, 1,
0.5473588, -0.7365245, 2.447635, 0.2941177, 0, 1, 1,
0.5475557, 1.244939, -0.02256511, 0.3019608, 0, 1, 1,
0.554755, 0.8471989, -0.7769074, 0.3098039, 0, 1, 1,
0.5583352, 0.3304619, 0.9364886, 0.3137255, 0, 1, 1,
0.5584103, 1.170606, 0.3831621, 0.3215686, 0, 1, 1,
0.5592127, -0.4262479, 0.2460671, 0.3254902, 0, 1, 1,
0.5640166, 1.491201, 1.353001, 0.3333333, 0, 1, 1,
0.5753486, -0.5786461, 2.474581, 0.3372549, 0, 1, 1,
0.5811618, 0.7441283, 1.439144, 0.345098, 0, 1, 1,
0.5830685, -0.9848671, 1.837386, 0.3490196, 0, 1, 1,
0.5877148, -0.6624205, 2.093478, 0.3568628, 0, 1, 1,
0.588756, -1.212216, 3.463892, 0.3607843, 0, 1, 1,
0.5900581, 0.1395887, -0.7719758, 0.3686275, 0, 1, 1,
0.592579, 0.2494423, 0.6091123, 0.372549, 0, 1, 1,
0.5931812, -0.7169666, 3.075739, 0.3803922, 0, 1, 1,
0.5939929, -1.82132, 4.073462, 0.3843137, 0, 1, 1,
0.5965815, 0.2453924, 0.9486858, 0.3921569, 0, 1, 1,
0.5978487, 0.3309095, 1.691087, 0.3960784, 0, 1, 1,
0.6003969, 0.8816289, -1.221206, 0.4039216, 0, 1, 1,
0.6037168, -0.4631736, 3.416601, 0.4117647, 0, 1, 1,
0.6081824, -1.411514, 4.632693, 0.4156863, 0, 1, 1,
0.6093255, 0.1511804, 1.325483, 0.4235294, 0, 1, 1,
0.615069, -0.5477005, 0.2604039, 0.427451, 0, 1, 1,
0.6162296, -1.385167, 0.9801327, 0.4352941, 0, 1, 1,
0.6182752, 0.494561, 1.560714, 0.4392157, 0, 1, 1,
0.6204346, 0.0728678, 2.73059, 0.4470588, 0, 1, 1,
0.6272751, 0.7501688, 0.2535065, 0.4509804, 0, 1, 1,
0.6287882, -0.4347631, 3.371031, 0.4588235, 0, 1, 1,
0.6292602, -0.9925293, 3.656709, 0.4627451, 0, 1, 1,
0.6321994, 0.2845807, 1.447957, 0.4705882, 0, 1, 1,
0.6328216, 0.2557662, 1.399325, 0.4745098, 0, 1, 1,
0.6345124, 0.2105766, 3.05152, 0.4823529, 0, 1, 1,
0.6448554, -1.2218, 1.99127, 0.4862745, 0, 1, 1,
0.6478481, 0.566542, 0.8916345, 0.4941176, 0, 1, 1,
0.64854, 0.5462654, 2.278396, 0.5019608, 0, 1, 1,
0.649001, -0.003396449, -0.07477342, 0.5058824, 0, 1, 1,
0.6493487, 0.3316264, 0.92571, 0.5137255, 0, 1, 1,
0.6517058, 1.762973, -0.1522773, 0.5176471, 0, 1, 1,
0.6538348, 0.9856222, 0.7500493, 0.5254902, 0, 1, 1,
0.6541053, -0.5748436, 1.162428, 0.5294118, 0, 1, 1,
0.6550619, 0.7379968, -0.01482708, 0.5372549, 0, 1, 1,
0.6620293, 0.9865006, -0.7662923, 0.5411765, 0, 1, 1,
0.6652445, 1.002142, 0.02514958, 0.5490196, 0, 1, 1,
0.6659605, -0.1442594, 4.695697, 0.5529412, 0, 1, 1,
0.6666498, -0.01608582, 2.615681, 0.5607843, 0, 1, 1,
0.6667631, 0.770478, 0.315997, 0.5647059, 0, 1, 1,
0.6669188, 2.020873, -1.351478, 0.572549, 0, 1, 1,
0.6696182, -0.3602516, 0.2228932, 0.5764706, 0, 1, 1,
0.6856026, -0.4399957, 1.231765, 0.5843138, 0, 1, 1,
0.6879347, -0.4266573, 0.7659804, 0.5882353, 0, 1, 1,
0.6914042, 1.157714, 2.116838, 0.5960785, 0, 1, 1,
0.6933309, -1.129851, 2.272352, 0.6039216, 0, 1, 1,
0.6937302, -1.050896, 4.977548, 0.6078432, 0, 1, 1,
0.6946546, 1.121722, -0.7224671, 0.6156863, 0, 1, 1,
0.695296, 0.9206222, 0.8516327, 0.6196079, 0, 1, 1,
0.7031202, 1.100544, 0.4623022, 0.627451, 0, 1, 1,
0.7059656, 0.6646532, 1.349635, 0.6313726, 0, 1, 1,
0.7137823, 1.765956, -0.9257564, 0.6392157, 0, 1, 1,
0.7140658, 0.5040262, 1.528012, 0.6431373, 0, 1, 1,
0.7148324, -1.868322, 2.206348, 0.6509804, 0, 1, 1,
0.7151655, -0.827477, 1.587056, 0.654902, 0, 1, 1,
0.7165834, 0.8218265, 0.6051764, 0.6627451, 0, 1, 1,
0.7179451, 2.255591, 1.701502, 0.6666667, 0, 1, 1,
0.7262163, -0.4918614, 0.8477958, 0.6745098, 0, 1, 1,
0.727572, -1.041488, 1.923274, 0.6784314, 0, 1, 1,
0.7292092, -1.083592, 2.668728, 0.6862745, 0, 1, 1,
0.7377555, -0.2515093, 2.53109, 0.6901961, 0, 1, 1,
0.744136, 1.343755, 1.362141, 0.6980392, 0, 1, 1,
0.7647001, 0.3000769, 0.842786, 0.7058824, 0, 1, 1,
0.7653369, -0.1149373, 3.609254, 0.7098039, 0, 1, 1,
0.7723693, 1.800698, 1.028691, 0.7176471, 0, 1, 1,
0.7825693, 1.366902, -0.03679626, 0.7215686, 0, 1, 1,
0.7830263, 0.5897185, 1.561407, 0.7294118, 0, 1, 1,
0.7837932, 0.4785626, 2.415501, 0.7333333, 0, 1, 1,
0.7949541, 0.3470673, 2.098893, 0.7411765, 0, 1, 1,
0.7953754, -1.512136, 4.871307, 0.7450981, 0, 1, 1,
0.8058046, 0.5120201, 2.000977, 0.7529412, 0, 1, 1,
0.8072025, 2.029459, 0.5897367, 0.7568628, 0, 1, 1,
0.8280591, 0.4328697, 1.630217, 0.7647059, 0, 1, 1,
0.8344323, -0.3244603, 1.308652, 0.7686275, 0, 1, 1,
0.8381336, -1.20691, 2.388685, 0.7764706, 0, 1, 1,
0.8416822, 1.26179, 1.142764, 0.7803922, 0, 1, 1,
0.8443796, 1.436709, 0.4992492, 0.7882353, 0, 1, 1,
0.8488441, 0.9644943, 1.962722, 0.7921569, 0, 1, 1,
0.8505023, 1.147495, 1.447014, 0.8, 0, 1, 1,
0.8510717, -1.267157, 3.097683, 0.8078431, 0, 1, 1,
0.8589227, -0.5244816, 0.9202174, 0.8117647, 0, 1, 1,
0.8590143, -1.38899, 3.652532, 0.8196079, 0, 1, 1,
0.8631421, -2.359514, 3.08833, 0.8235294, 0, 1, 1,
0.8647161, 1.117803, 1.275935, 0.8313726, 0, 1, 1,
0.8667471, -0.9845061, 3.289808, 0.8352941, 0, 1, 1,
0.869374, 0.4172404, 0.7925205, 0.8431373, 0, 1, 1,
0.8708385, 1.118836, 0.9454305, 0.8470588, 0, 1, 1,
0.8726599, -0.9906364, 3.351415, 0.854902, 0, 1, 1,
0.8752182, -0.2894309, 2.240767, 0.8588235, 0, 1, 1,
0.8776317, 0.6239222, 1.417874, 0.8666667, 0, 1, 1,
0.8800014, 1.259618, 0.6177683, 0.8705882, 0, 1, 1,
0.8823799, -0.6918887, 3.694772, 0.8784314, 0, 1, 1,
0.8843754, 0.03504623, 0.7068234, 0.8823529, 0, 1, 1,
0.8887453, -2.774005, 1.78336, 0.8901961, 0, 1, 1,
0.8896304, 1.744524, 0.1859654, 0.8941177, 0, 1, 1,
0.8954332, 0.3752109, 1.5018, 0.9019608, 0, 1, 1,
0.8961977, 0.4002743, 0.7805688, 0.9098039, 0, 1, 1,
0.8998927, 0.4615433, -0.08356754, 0.9137255, 0, 1, 1,
0.9002139, -1.617034, 1.473657, 0.9215686, 0, 1, 1,
0.9002857, -1.897985, 3.4115, 0.9254902, 0, 1, 1,
0.9043079, 0.02040648, 2.309987, 0.9333333, 0, 1, 1,
0.9083105, -0.126386, 1.276852, 0.9372549, 0, 1, 1,
0.9085555, -0.4042114, 3.847636, 0.945098, 0, 1, 1,
0.908803, -1.131392, 3.558711, 0.9490196, 0, 1, 1,
0.9114736, 0.1047032, 1.759403, 0.9568627, 0, 1, 1,
0.9173841, -0.4792253, 3.645828, 0.9607843, 0, 1, 1,
0.9195392, 1.597071, -0.7409706, 0.9686275, 0, 1, 1,
0.9258195, -2.239292, 2.209832, 0.972549, 0, 1, 1,
0.9268555, -1.179921, 1.547541, 0.9803922, 0, 1, 1,
0.9308558, -1.251721, 1.872431, 0.9843137, 0, 1, 1,
0.9366581, 1.801586, 0.655686, 0.9921569, 0, 1, 1,
0.9377071, 1.122904, 0.449467, 0.9960784, 0, 1, 1,
0.9378748, -0.9118143, 3.243975, 1, 0, 0.9960784, 1,
0.94578, -0.1443653, 1.894161, 1, 0, 0.9882353, 1,
0.9470975, -0.2617583, -1.066284, 1, 0, 0.9843137, 1,
0.9535987, -0.865891, 1.283162, 1, 0, 0.9764706, 1,
0.9537441, 1.899931, 0.9438545, 1, 0, 0.972549, 1,
0.9575483, -0.7199861, 2.766824, 1, 0, 0.9647059, 1,
0.9601839, 0.3605879, 1.028667, 1, 0, 0.9607843, 1,
0.9694644, 0.593401, -1.511886, 1, 0, 0.9529412, 1,
0.9708723, 1.212208, 0.1809855, 1, 0, 0.9490196, 1,
0.9719278, -0.4811716, 2.063572, 1, 0, 0.9411765, 1,
0.9767811, 0.640677, 0.8926987, 1, 0, 0.9372549, 1,
0.9807488, -0.1220375, 1.267049, 1, 0, 0.9294118, 1,
0.987719, 0.7857968, 2.04139, 1, 0, 0.9254902, 1,
0.9887757, 0.5048141, 0.516751, 1, 0, 0.9176471, 1,
0.9936904, 0.4803592, 3.067535, 1, 0, 0.9137255, 1,
0.9983847, -0.2967517, 3.070552, 1, 0, 0.9058824, 1,
0.9990757, 0.1161267, 1.595477, 1, 0, 0.9019608, 1,
1.003374, 0.4252596, 1.005992, 1, 0, 0.8941177, 1,
1.005727, 0.7619593, 1.69602, 1, 0, 0.8862745, 1,
1.005925, -0.7706453, 2.44799, 1, 0, 0.8823529, 1,
1.012029, 1.462598, -0.7722414, 1, 0, 0.8745098, 1,
1.020778, 0.2304073, 0.4758257, 1, 0, 0.8705882, 1,
1.023761, -0.457738, 1.561539, 1, 0, 0.8627451, 1,
1.026857, -0.07838103, 0.06805994, 1, 0, 0.8588235, 1,
1.035921, -0.2774472, -0.1727098, 1, 0, 0.8509804, 1,
1.036893, -1.327378, 1.289323, 1, 0, 0.8470588, 1,
1.04153, -0.2467478, 1.176094, 1, 0, 0.8392157, 1,
1.049456, 0.3985504, 0.3558625, 1, 0, 0.8352941, 1,
1.051868, 0.333596, 2.739188, 1, 0, 0.827451, 1,
1.054307, 1.543256, 1.699256, 1, 0, 0.8235294, 1,
1.057628, -1.525332, 2.636327, 1, 0, 0.8156863, 1,
1.060733, 0.9590491, 0.06528335, 1, 0, 0.8117647, 1,
1.062445, 0.2660328, 2.114675, 1, 0, 0.8039216, 1,
1.069393, -0.07806265, 1.568019, 1, 0, 0.7960784, 1,
1.070982, -2.043672, 2.562793, 1, 0, 0.7921569, 1,
1.073746, -1.092427, 0.807386, 1, 0, 0.7843137, 1,
1.0923, 1.505919, -0.5628937, 1, 0, 0.7803922, 1,
1.092711, 0.855841, 1.947659, 1, 0, 0.772549, 1,
1.093321, -1.290262, 3.503515, 1, 0, 0.7686275, 1,
1.095257, 0.08070261, 0.1721522, 1, 0, 0.7607843, 1,
1.097108, -1.00037, 4.114398, 1, 0, 0.7568628, 1,
1.098515, -1.623622, 2.248632, 1, 0, 0.7490196, 1,
1.107736, -0.1107931, 1.632722, 1, 0, 0.7450981, 1,
1.120408, -0.1559112, 2.468011, 1, 0, 0.7372549, 1,
1.125106, 1.080942, 1.005391, 1, 0, 0.7333333, 1,
1.131822, -0.4595575, 0.9700224, 1, 0, 0.7254902, 1,
1.147928, -0.5482002, 3.298758, 1, 0, 0.7215686, 1,
1.158482, 1.238732, 1.215197, 1, 0, 0.7137255, 1,
1.164856, 1.03986, 0.9282327, 1, 0, 0.7098039, 1,
1.171277, -0.3122034, 1.732635, 1, 0, 0.7019608, 1,
1.177338, 0.794761, 1.519683, 1, 0, 0.6941177, 1,
1.186604, 0.6517109, -0.1337213, 1, 0, 0.6901961, 1,
1.187367, -0.1383244, 0.3914515, 1, 0, 0.682353, 1,
1.189979, 0.237078, 0.788681, 1, 0, 0.6784314, 1,
1.192304, 0.009113603, 2.552934, 1, 0, 0.6705883, 1,
1.20107, 0.4350217, -0.4122863, 1, 0, 0.6666667, 1,
1.205474, -0.9426447, 1.460369, 1, 0, 0.6588235, 1,
1.207391, 0.1965691, 0.007854629, 1, 0, 0.654902, 1,
1.215784, 0.4520007, 0.5047329, 1, 0, 0.6470588, 1,
1.217545, 0.6053929, 1.459911, 1, 0, 0.6431373, 1,
1.221184, 0.03201865, 1.025137, 1, 0, 0.6352941, 1,
1.22876, 1.3349, 1.555621, 1, 0, 0.6313726, 1,
1.230333, 0.04779803, 2.512669, 1, 0, 0.6235294, 1,
1.237902, 0.1636399, -0.1310196, 1, 0, 0.6196079, 1,
1.258371, -1.21353, 2.461058, 1, 0, 0.6117647, 1,
1.261909, 0.2888499, 0.07998736, 1, 0, 0.6078432, 1,
1.264352, -0.06305787, 2.083996, 1, 0, 0.6, 1,
1.271887, -0.1124572, 3.722558, 1, 0, 0.5921569, 1,
1.279546, 0.03226735, -0.4759669, 1, 0, 0.5882353, 1,
1.286978, 0.7475236, 1.317408, 1, 0, 0.5803922, 1,
1.289356, -0.3168741, 1.569262, 1, 0, 0.5764706, 1,
1.302212, 1.845061, 0.8153356, 1, 0, 0.5686275, 1,
1.307541, -0.6657662, 2.173354, 1, 0, 0.5647059, 1,
1.312388, 0.2791688, 1.55123, 1, 0, 0.5568628, 1,
1.324107, -0.8027399, 1.197012, 1, 0, 0.5529412, 1,
1.336095, 0.7409958, 2.521794, 1, 0, 0.5450981, 1,
1.343992, -0.5290369, 2.707937, 1, 0, 0.5411765, 1,
1.345172, 0.8185262, 0.5041906, 1, 0, 0.5333334, 1,
1.346919, 0.2806216, 2.592553, 1, 0, 0.5294118, 1,
1.351595, 0.6189967, 3.116984, 1, 0, 0.5215687, 1,
1.351974, -0.6404449, 2.412931, 1, 0, 0.5176471, 1,
1.354958, -1.724134, 2.749994, 1, 0, 0.509804, 1,
1.356047, -0.5592421, 1.231871, 1, 0, 0.5058824, 1,
1.35822, -0.4735098, 3.313578, 1, 0, 0.4980392, 1,
1.367188, -0.7223156, 1.530013, 1, 0, 0.4901961, 1,
1.368669, 0.2959927, 0.8533667, 1, 0, 0.4862745, 1,
1.377918, 0.5757557, 0.04888127, 1, 0, 0.4784314, 1,
1.38068, -0.2895292, 4.012863, 1, 0, 0.4745098, 1,
1.393616, -1.253166, 3.120842, 1, 0, 0.4666667, 1,
1.403252, -0.8599232, 2.46612, 1, 0, 0.4627451, 1,
1.407899, 0.07063901, 1.560999, 1, 0, 0.454902, 1,
1.417399, 0.2107542, 3.051851, 1, 0, 0.4509804, 1,
1.419241, 0.6665533, 1.73349, 1, 0, 0.4431373, 1,
1.420001, 0.5888525, -1.023184, 1, 0, 0.4392157, 1,
1.421422, -0.4143993, 1.212953, 1, 0, 0.4313726, 1,
1.441254, -1.569585, 2.45163, 1, 0, 0.427451, 1,
1.443137, -0.3150882, 2.347628, 1, 0, 0.4196078, 1,
1.449644, -0.2089166, 1.932646, 1, 0, 0.4156863, 1,
1.466731, -1.085309, 1.926509, 1, 0, 0.4078431, 1,
1.496403, 0.4116645, 0.9207628, 1, 0, 0.4039216, 1,
1.501997, 0.3912314, 0.8283892, 1, 0, 0.3960784, 1,
1.506946, 0.7039632, 1.527426, 1, 0, 0.3882353, 1,
1.507864, 0.635399, 1.453152, 1, 0, 0.3843137, 1,
1.509012, 0.4131887, 1.386088, 1, 0, 0.3764706, 1,
1.512685, 1.690274, 1.09456, 1, 0, 0.372549, 1,
1.512843, -0.8567469, 1.893365, 1, 0, 0.3647059, 1,
1.52631, 1.970806, 1.156477, 1, 0, 0.3607843, 1,
1.527571, 0.4931459, 1.216915, 1, 0, 0.3529412, 1,
1.552846, -0.4020692, 1.732418, 1, 0, 0.3490196, 1,
1.566581, -0.1266129, 1.202975, 1, 0, 0.3411765, 1,
1.577331, -0.944735, 1.419643, 1, 0, 0.3372549, 1,
1.57977, 0.9506145, 0.4173697, 1, 0, 0.3294118, 1,
1.587852, 0.6122504, -0.5985442, 1, 0, 0.3254902, 1,
1.602017, 0.03001904, 1.731003, 1, 0, 0.3176471, 1,
1.610956, 0.7787898, 0.6066127, 1, 0, 0.3137255, 1,
1.613517, 0.4318072, 0.7509025, 1, 0, 0.3058824, 1,
1.615079, 0.6569523, 2.895733, 1, 0, 0.2980392, 1,
1.631237, -1.422207, 2.194969, 1, 0, 0.2941177, 1,
1.66145, 0.1143391, 1.347017, 1, 0, 0.2862745, 1,
1.674039, -0.7717875, 2.364846, 1, 0, 0.282353, 1,
1.675939, -1.225457, 3.781272, 1, 0, 0.2745098, 1,
1.705338, 0.04048828, 1.007965, 1, 0, 0.2705882, 1,
1.706334, 0.8364209, -0.3129322, 1, 0, 0.2627451, 1,
1.748919, -0.7136687, 1.222455, 1, 0, 0.2588235, 1,
1.748947, -0.2631059, 3.657039, 1, 0, 0.2509804, 1,
1.758941, -1.270331, 0.5476468, 1, 0, 0.2470588, 1,
1.76766, -0.2441866, 1.212332, 1, 0, 0.2392157, 1,
1.779701, -0.2146444, 2.306422, 1, 0, 0.2352941, 1,
1.786809, 1.18442, 1.645812, 1, 0, 0.227451, 1,
1.796124, -0.6981363, 2.098564, 1, 0, 0.2235294, 1,
1.826984, -0.6463248, 0.2223929, 1, 0, 0.2156863, 1,
1.849663, -0.1346829, 2.227752, 1, 0, 0.2117647, 1,
1.880077, -0.5162119, 2.481471, 1, 0, 0.2039216, 1,
1.894615, 0.5331982, 2.517905, 1, 0, 0.1960784, 1,
1.920368, -1.013067, 2.434876, 1, 0, 0.1921569, 1,
1.933933, 2.809005, -1.054848, 1, 0, 0.1843137, 1,
1.936954, 1.480838, 0.4220535, 1, 0, 0.1803922, 1,
1.943186, -0.9228916, 1.92479, 1, 0, 0.172549, 1,
1.952016, 0.0757044, 1.160475, 1, 0, 0.1686275, 1,
1.967614, -0.3334256, 1.758252, 1, 0, 0.1607843, 1,
1.973887, 0.4509096, -1.144787, 1, 0, 0.1568628, 1,
1.976772, -0.7588616, 0.9546656, 1, 0, 0.1490196, 1,
1.980963, 0.6755603, 0.6106327, 1, 0, 0.145098, 1,
1.990231, 0.8341742, 1.211283, 1, 0, 0.1372549, 1,
1.998258, -0.06434427, 3.185424, 1, 0, 0.1333333, 1,
2.026784, 2.567539, 0.6595575, 1, 0, 0.1254902, 1,
2.032347, -1.715226, 1.039765, 1, 0, 0.1215686, 1,
2.049252, -0.8294395, 0.8801144, 1, 0, 0.1137255, 1,
2.074363, 0.6722145, -0.9479339, 1, 0, 0.1098039, 1,
2.092346, 0.630963, 1.131988, 1, 0, 0.1019608, 1,
2.128579, 0.2119386, 2.20175, 1, 0, 0.09411765, 1,
2.137279, 1.04129, 2.223507, 1, 0, 0.09019608, 1,
2.145521, 1.145327, 2.925026, 1, 0, 0.08235294, 1,
2.171985, -1.430919, 2.076393, 1, 0, 0.07843138, 1,
2.219419, 1.218166, 1.469577, 1, 0, 0.07058824, 1,
2.335324, -0.3132059, 2.158153, 1, 0, 0.06666667, 1,
2.373792, 2.831161, 1.007434, 1, 0, 0.05882353, 1,
2.376801, 0.2259404, 2.697325, 1, 0, 0.05490196, 1,
2.579424, 0.2060017, 1.066037, 1, 0, 0.04705882, 1,
2.654, 0.02240397, 1.205746, 1, 0, 0.04313726, 1,
2.666122, -0.4891863, 3.255508, 1, 0, 0.03529412, 1,
2.673107, 1.114195, 0.4677499, 1, 0, 0.03137255, 1,
2.722929, -0.6106858, 0.2800137, 1, 0, 0.02352941, 1,
2.873202, 0.3142931, 1.285786, 1, 0, 0.01960784, 1,
2.979788, -1.265578, 2.206725, 1, 0, 0.01176471, 1,
3.230683, 2.045441, 1.1767, 1, 0, 0.007843138, 1
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
-0.4521514, -4.486887, -6.738217, 0, -0.5, 0.5, 0.5,
-0.4521514, -4.486887, -6.738217, 1, -0.5, 0.5, 0.5,
-0.4521514, -4.486887, -6.738217, 1, 1.5, 0.5, 0.5,
-0.4521514, -4.486887, -6.738217, 0, 1.5, 0.5, 0.5
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
-5.383466, -0.1726197, -6.738217, 0, -0.5, 0.5, 0.5,
-5.383466, -0.1726197, -6.738217, 1, -0.5, 0.5, 0.5,
-5.383466, -0.1726197, -6.738217, 1, 1.5, 0.5, 0.5,
-5.383466, -0.1726197, -6.738217, 0, 1.5, 0.5, 0.5
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
-5.383466, -4.486887, 0.165468, 0, -0.5, 0.5, 0.5,
-5.383466, -4.486887, 0.165468, 1, -0.5, 0.5, 0.5,
-5.383466, -4.486887, 0.165468, 1, 1.5, 0.5, 0.5,
-5.383466, -4.486887, 0.165468, 0, 1.5, 0.5, 0.5
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
-4, -3.491287, -5.145059,
2, -3.491287, -5.145059,
-4, -3.491287, -5.145059,
-4, -3.65722, -5.410585,
-2, -3.491287, -5.145059,
-2, -3.65722, -5.410585,
0, -3.491287, -5.145059,
0, -3.65722, -5.410585,
2, -3.491287, -5.145059,
2, -3.65722, -5.410585
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
-4, -3.989087, -5.941638, 0, -0.5, 0.5, 0.5,
-4, -3.989087, -5.941638, 1, -0.5, 0.5, 0.5,
-4, -3.989087, -5.941638, 1, 1.5, 0.5, 0.5,
-4, -3.989087, -5.941638, 0, 1.5, 0.5, 0.5,
-2, -3.989087, -5.941638, 0, -0.5, 0.5, 0.5,
-2, -3.989087, -5.941638, 1, -0.5, 0.5, 0.5,
-2, -3.989087, -5.941638, 1, 1.5, 0.5, 0.5,
-2, -3.989087, -5.941638, 0, 1.5, 0.5, 0.5,
0, -3.989087, -5.941638, 0, -0.5, 0.5, 0.5,
0, -3.989087, -5.941638, 1, -0.5, 0.5, 0.5,
0, -3.989087, -5.941638, 1, 1.5, 0.5, 0.5,
0, -3.989087, -5.941638, 0, 1.5, 0.5, 0.5,
2, -3.989087, -5.941638, 0, -0.5, 0.5, 0.5,
2, -3.989087, -5.941638, 1, -0.5, 0.5, 0.5,
2, -3.989087, -5.941638, 1, 1.5, 0.5, 0.5,
2, -3.989087, -5.941638, 0, 1.5, 0.5, 0.5
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
-4.245471, -3, -5.145059,
-4.245471, 3, -5.145059,
-4.245471, -3, -5.145059,
-4.435136, -3, -5.410585,
-4.245471, -2, -5.145059,
-4.435136, -2, -5.410585,
-4.245471, -1, -5.145059,
-4.435136, -1, -5.410585,
-4.245471, 0, -5.145059,
-4.435136, 0, -5.410585,
-4.245471, 1, -5.145059,
-4.435136, 1, -5.410585,
-4.245471, 2, -5.145059,
-4.435136, 2, -5.410585,
-4.245471, 3, -5.145059,
-4.435136, 3, -5.410585
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
-4.814468, -3, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, -3, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, -3, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, -3, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, -2, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, -2, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, -2, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, -2, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, -1, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, -1, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, -1, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, -1, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, 0, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, 0, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, 0, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, 0, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, 1, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, 1, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, 1, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, 1, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, 2, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, 2, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, 2, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, 2, -5.941638, 0, 1.5, 0.5, 0.5,
-4.814468, 3, -5.941638, 0, -0.5, 0.5, 0.5,
-4.814468, 3, -5.941638, 1, -0.5, 0.5, 0.5,
-4.814468, 3, -5.941638, 1, 1.5, 0.5, 0.5,
-4.814468, 3, -5.941638, 0, 1.5, 0.5, 0.5
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
-4.245471, -3.491287, -4,
-4.245471, -3.491287, 4,
-4.245471, -3.491287, -4,
-4.435136, -3.65722, -4,
-4.245471, -3.491287, -2,
-4.435136, -3.65722, -2,
-4.245471, -3.491287, 0,
-4.435136, -3.65722, 0,
-4.245471, -3.491287, 2,
-4.435136, -3.65722, 2,
-4.245471, -3.491287, 4,
-4.435136, -3.65722, 4
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
-4.814468, -3.989087, -4, 0, -0.5, 0.5, 0.5,
-4.814468, -3.989087, -4, 1, -0.5, 0.5, 0.5,
-4.814468, -3.989087, -4, 1, 1.5, 0.5, 0.5,
-4.814468, -3.989087, -4, 0, 1.5, 0.5, 0.5,
-4.814468, -3.989087, -2, 0, -0.5, 0.5, 0.5,
-4.814468, -3.989087, -2, 1, -0.5, 0.5, 0.5,
-4.814468, -3.989087, -2, 1, 1.5, 0.5, 0.5,
-4.814468, -3.989087, -2, 0, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 0, 0, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 0, 1, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 0, 1, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 0, 0, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 2, 0, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 2, 1, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 2, 1, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 2, 0, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 4, 0, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 4, 1, -0.5, 0.5, 0.5,
-4.814468, -3.989087, 4, 1, 1.5, 0.5, 0.5,
-4.814468, -3.989087, 4, 0, 1.5, 0.5, 0.5
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
-4.245471, -3.491287, -5.145059,
-4.245471, 3.146048, -5.145059,
-4.245471, -3.491287, 5.475995,
-4.245471, 3.146048, 5.475995,
-4.245471, -3.491287, -5.145059,
-4.245471, -3.491287, 5.475995,
-4.245471, 3.146048, -5.145059,
-4.245471, 3.146048, 5.475995,
-4.245471, -3.491287, -5.145059,
3.341168, -3.491287, -5.145059,
-4.245471, -3.491287, 5.475995,
3.341168, -3.491287, 5.475995,
-4.245471, 3.146048, -5.145059,
3.341168, 3.146048, -5.145059,
-4.245471, 3.146048, 5.475995,
3.341168, 3.146048, 5.475995,
3.341168, -3.491287, -5.145059,
3.341168, 3.146048, -5.145059,
3.341168, -3.491287, 5.475995,
3.341168, 3.146048, 5.475995,
3.341168, -3.491287, -5.145059,
3.341168, -3.491287, 5.475995,
3.341168, 3.146048, -5.145059,
3.341168, 3.146048, 5.475995
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
var radius = 7.819089;
var distance = 34.78801;
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
mvMatrix.translate( 0.4521514, 0.1726197, -0.165468 );
mvMatrix.scale( 1.114348, 1.273727, 0.7959805 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.78801);
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
2-Methyl-4-chlorophe<-read.table("2-Methyl-4-chlorophe.xyz")
```

```
## Error in read.table("2-Methyl-4-chlorophe.xyz"): no lines available in input
```

```r
x<-2-Methyl-4-chlorophe$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl' not found
```

```r
y<-2-Methyl-4-chlorophe$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl' not found
```

```r
z<-2-Methyl-4-chlorophe$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl' not found
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
-4.134985, -1.285106, -2.042659, 0, 0, 1, 1, 1,
-3.899282, -0.0382955, -1.370588, 1, 0, 0, 1, 1,
-3.072939, -0.4223027, -1.229537, 1, 0, 0, 1, 1,
-2.646771, -0.5207412, -3.141746, 1, 0, 0, 1, 1,
-2.481559, 2.202136, -1.662246, 1, 0, 0, 1, 1,
-2.474881, 0.2187455, -1.075464, 1, 0, 0, 1, 1,
-2.437309, 1.461427, 1.017731, 0, 0, 0, 1, 1,
-2.386837, -1.952955, -3.087017, 0, 0, 0, 1, 1,
-2.347879, -0.3543989, -0.7498798, 0, 0, 0, 1, 1,
-2.340323, -0.4146442, 1.012924, 0, 0, 0, 1, 1,
-2.28202, -0.4527518, -1.504301, 0, 0, 0, 1, 1,
-2.271508, -0.3955291, -0.7385622, 0, 0, 0, 1, 1,
-2.132531, -0.5959889, -2.869916, 0, 0, 0, 1, 1,
-2.0927, -0.3110496, -1.429494, 1, 1, 1, 1, 1,
-2.08584, 0.2414509, 0.331855, 1, 1, 1, 1, 1,
-2.064543, 0.2359316, 0.7862415, 1, 1, 1, 1, 1,
-2.064064, 1.682151, -0.8327774, 1, 1, 1, 1, 1,
-2.053184, 1.036455, -0.7337261, 1, 1, 1, 1, 1,
-2.040561, 0.3722321, -0.8867487, 1, 1, 1, 1, 1,
-1.976453, 1.52533, 0.3168775, 1, 1, 1, 1, 1,
-1.911994, 0.7356004, 0.5170113, 1, 1, 1, 1, 1,
-1.909753, 0.4191689, -0.865446, 1, 1, 1, 1, 1,
-1.889353, 2.932647, -0.7853541, 1, 1, 1, 1, 1,
-1.885991, 0.2926814, -1.55542, 1, 1, 1, 1, 1,
-1.866505, 0.1380928, -2.834351, 1, 1, 1, 1, 1,
-1.862726, -0.529016, -1.666861, 1, 1, 1, 1, 1,
-1.855483, 0.3651135, -3.130823, 1, 1, 1, 1, 1,
-1.841666, 0.2678839, -2.155757, 1, 1, 1, 1, 1,
-1.826554, -0.1816694, -1.557751, 0, 0, 1, 1, 1,
-1.821857, -0.602714, -3.655627, 1, 0, 0, 1, 1,
-1.811391, -0.6220728, -3.235157, 1, 0, 0, 1, 1,
-1.757336, -0.930457, -0.2783291, 1, 0, 0, 1, 1,
-1.754834, -1.081668, -3.247632, 1, 0, 0, 1, 1,
-1.743626, -0.7488515, -0.9387679, 1, 0, 0, 1, 1,
-1.742079, 0.414905, -0.467959, 0, 0, 0, 1, 1,
-1.738742, 1.040933, -0.2748408, 0, 0, 0, 1, 1,
-1.715316, 1.025383, -0.8973322, 0, 0, 0, 1, 1,
-1.714524, 0.2697658, -2.833782, 0, 0, 0, 1, 1,
-1.67555, -0.3830795, -3.569916, 0, 0, 0, 1, 1,
-1.673049, -0.8955199, -1.935729, 0, 0, 0, 1, 1,
-1.647733, -1.120788, -2.494854, 0, 0, 0, 1, 1,
-1.634982, 0.7188283, -1.87942, 1, 1, 1, 1, 1,
-1.628081, -0.1717643, -1.695217, 1, 1, 1, 1, 1,
-1.620827, -0.2714858, -1.857072, 1, 1, 1, 1, 1,
-1.616445, -0.5836929, -1.201276, 1, 1, 1, 1, 1,
-1.612158, -0.26898, -2.196478, 1, 1, 1, 1, 1,
-1.602507, 1.294462, 0.7073023, 1, 1, 1, 1, 1,
-1.594695, 0.25622, -1.248953, 1, 1, 1, 1, 1,
-1.580085, 0.1072854, -3.046162, 1, 1, 1, 1, 1,
-1.579074, 1.57441, -0.4943484, 1, 1, 1, 1, 1,
-1.564454, -1.23896, -1.446337, 1, 1, 1, 1, 1,
-1.55452, 0.007644851, -2.566105, 1, 1, 1, 1, 1,
-1.548193, -0.5058604, -2.330688, 1, 1, 1, 1, 1,
-1.546694, 1.811484, -2.01469, 1, 1, 1, 1, 1,
-1.525392, -1.521636, -2.729078, 1, 1, 1, 1, 1,
-1.49211, -1.641914, -3.136274, 1, 1, 1, 1, 1,
-1.474955, 1.826243, -1.160736, 0, 0, 1, 1, 1,
-1.462785, -1.525903, -1.183505, 1, 0, 0, 1, 1,
-1.459263, -0.4304658, -1.085961, 1, 0, 0, 1, 1,
-1.453012, -1.033062, -0.2000653, 1, 0, 0, 1, 1,
-1.449283, -1.150965, -2.337906, 1, 0, 0, 1, 1,
-1.432433, -0.356398, -0.473847, 1, 0, 0, 1, 1,
-1.42927, 0.2475659, -2.357702, 0, 0, 0, 1, 1,
-1.426345, -0.1668507, -0.6208337, 0, 0, 0, 1, 1,
-1.419391, 0.3054283, -1.687068, 0, 0, 0, 1, 1,
-1.415183, -0.7398985, -1.608204, 0, 0, 0, 1, 1,
-1.405923, 0.9917423, 0.1938205, 0, 0, 0, 1, 1,
-1.394684, 1.828171, -1.029967, 0, 0, 0, 1, 1,
-1.394096, 0.2430415, -2.313895, 0, 0, 0, 1, 1,
-1.370119, -1.571856, -1.136103, 1, 1, 1, 1, 1,
-1.364197, 0.02928811, -2.430146, 1, 1, 1, 1, 1,
-1.357672, -0.7216544, -3.555983, 1, 1, 1, 1, 1,
-1.357124, -0.748874, -1.800265, 1, 1, 1, 1, 1,
-1.354374, 0.7457897, -2.298222, 1, 1, 1, 1, 1,
-1.339127, -1.689083, -2.480732, 1, 1, 1, 1, 1,
-1.336586, 0.2297456, -0.8256533, 1, 1, 1, 1, 1,
-1.332466, -1.13866, -4.214264, 1, 1, 1, 1, 1,
-1.33219, 0.287228, -2.770247, 1, 1, 1, 1, 1,
-1.328295, -0.6805484, -2.190422, 1, 1, 1, 1, 1,
-1.325356, 0.9519939, -0.06749935, 1, 1, 1, 1, 1,
-1.323603, 0.6752514, 0.3943737, 1, 1, 1, 1, 1,
-1.320843, -0.9857976, -3.005768, 1, 1, 1, 1, 1,
-1.320065, -1.025901, -2.609762, 1, 1, 1, 1, 1,
-1.318573, 0.01747759, -1.82206, 1, 1, 1, 1, 1,
-1.316718, 0.4208375, -0.9965559, 0, 0, 1, 1, 1,
-1.313905, 2.181246, 0.4301405, 1, 0, 0, 1, 1,
-1.313268, 0.8870953, -1.392185, 1, 0, 0, 1, 1,
-1.312267, -0.1221591, -0.5963632, 1, 0, 0, 1, 1,
-1.310868, -0.6494759, -3.393043, 1, 0, 0, 1, 1,
-1.305937, 0.8690182, 0.4649367, 1, 0, 0, 1, 1,
-1.303627, -1.200788, -0.3369004, 0, 0, 0, 1, 1,
-1.301451, -0.07616455, -2.809914, 0, 0, 0, 1, 1,
-1.297996, -0.248663, -2.984651, 0, 0, 0, 1, 1,
-1.294748, 0.3685923, -1.838443, 0, 0, 0, 1, 1,
-1.292925, 0.330559, -2.762074, 0, 0, 0, 1, 1,
-1.290086, -1.583134, -2.087647, 0, 0, 0, 1, 1,
-1.285227, 0.5133618, -2.357238, 0, 0, 0, 1, 1,
-1.27828, 0.3682979, 0.1285236, 1, 1, 1, 1, 1,
-1.274489, -0.6419417, -3.156352, 1, 1, 1, 1, 1,
-1.264521, -0.2160214, -1.9562, 1, 1, 1, 1, 1,
-1.247346, 0.7134022, -0.3446312, 1, 1, 1, 1, 1,
-1.244378, 0.4090557, -0.8479016, 1, 1, 1, 1, 1,
-1.242549, 1.393284, 0.3658259, 1, 1, 1, 1, 1,
-1.237132, 1.779591, -1.768207, 1, 1, 1, 1, 1,
-1.229094, 0.9144331, -0.8118635, 1, 1, 1, 1, 1,
-1.226665, 1.423346, -1.076833, 1, 1, 1, 1, 1,
-1.225397, -1.308707, -1.619296, 1, 1, 1, 1, 1,
-1.220778, -0.06704307, -0.9178784, 1, 1, 1, 1, 1,
-1.216866, -0.04899596, -1.799181, 1, 1, 1, 1, 1,
-1.211577, 0.636278, -0.4302636, 1, 1, 1, 1, 1,
-1.209178, 0.08503637, -1.220444, 1, 1, 1, 1, 1,
-1.195006, -0.7622712, -1.933837, 1, 1, 1, 1, 1,
-1.192988, 0.168149, -0.8161888, 0, 0, 1, 1, 1,
-1.188166, -2.140566, -0.4783996, 1, 0, 0, 1, 1,
-1.187106, -0.1904805, -1.27246, 1, 0, 0, 1, 1,
-1.185276, -0.7192231, -0.8185999, 1, 0, 0, 1, 1,
-1.180149, 1.424283, -2.432445, 1, 0, 0, 1, 1,
-1.179579, -0.2693012, 0.7048411, 1, 0, 0, 1, 1,
-1.159319, 0.3297435, -2.385751, 0, 0, 0, 1, 1,
-1.157835, -2.615936, -4.08209, 0, 0, 0, 1, 1,
-1.150399, 0.213492, -2.420814, 0, 0, 0, 1, 1,
-1.148351, 0.7854423, -0.6087665, 0, 0, 0, 1, 1,
-1.143317, -0.1934759, -1.973678, 0, 0, 0, 1, 1,
-1.140415, 0.2984437, -1.448293, 0, 0, 0, 1, 1,
-1.136487, -0.03348952, -0.1764831, 0, 0, 0, 1, 1,
-1.131378, 0.5518965, -1.600816, 1, 1, 1, 1, 1,
-1.12867, 0.78849, 0.04125186, 1, 1, 1, 1, 1,
-1.128639, -0.3298686, -3.050131, 1, 1, 1, 1, 1,
-1.125992, -1.470689, -3.705235, 1, 1, 1, 1, 1,
-1.119519, 1.869948, 0.4773191, 1, 1, 1, 1, 1,
-1.117689, -0.4501745, -2.042609, 1, 1, 1, 1, 1,
-1.105613, 0.7027109, 1.635545, 1, 1, 1, 1, 1,
-1.102883, -1.653091, -2.748736, 1, 1, 1, 1, 1,
-1.100349, 0.9872558, -0.6962231, 1, 1, 1, 1, 1,
-1.099815, -0.1733041, -2.465348, 1, 1, 1, 1, 1,
-1.097486, 0.883412, -0.4969539, 1, 1, 1, 1, 1,
-1.09314, 0.6030167, -1.361188, 1, 1, 1, 1, 1,
-1.087876, 0.01498554, 0.01107875, 1, 1, 1, 1, 1,
-1.075988, 0.380532, -1.723037, 1, 1, 1, 1, 1,
-1.072499, 1.187076, -0.8217183, 1, 1, 1, 1, 1,
-1.072223, 1.477418, -1.320752, 0, 0, 1, 1, 1,
-1.071125, -0.06806843, -0.6161024, 1, 0, 0, 1, 1,
-1.070593, -1.182073, -1.589503, 1, 0, 0, 1, 1,
-1.067306, 0.8643103, -2.187384, 1, 0, 0, 1, 1,
-1.063349, 0.3885719, -0.2162512, 1, 0, 0, 1, 1,
-1.061632, 0.1519587, -1.525927, 1, 0, 0, 1, 1,
-1.059132, 2.474486, 0.1578164, 0, 0, 0, 1, 1,
-1.056226, -0.08694351, -1.40477, 0, 0, 0, 1, 1,
-1.046574, -0.769811, -2.533427, 0, 0, 0, 1, 1,
-1.044305, 0.8361093, -2.105617, 0, 0, 0, 1, 1,
-1.037019, -0.3683849, -2.131394, 0, 0, 0, 1, 1,
-1.030128, -1.364153, -1.983472, 0, 0, 0, 1, 1,
-1.02344, 0.758705, -1.736765, 0, 0, 0, 1, 1,
-1.012433, 0.4286267, -1.520208, 1, 1, 1, 1, 1,
-1.011728, -0.5899542, -1.993963, 1, 1, 1, 1, 1,
-1.010292, 0.4679035, -0.8544796, 1, 1, 1, 1, 1,
-1.00526, -3.394627, -1.580562, 1, 1, 1, 1, 1,
-1.00209, -1.357126, -2.232174, 1, 1, 1, 1, 1,
-0.9998977, 0.7787423, -1.132783, 1, 1, 1, 1, 1,
-0.9831439, -0.7441529, -2.682775, 1, 1, 1, 1, 1,
-0.9763775, 0.8947363, -1.751606, 1, 1, 1, 1, 1,
-0.9703155, 0.6794619, -1.031389, 1, 1, 1, 1, 1,
-0.9663439, -0.4877945, -3.227198, 1, 1, 1, 1, 1,
-0.9612135, 0.3574326, -2.159183, 1, 1, 1, 1, 1,
-0.9567028, 0.4099846, -1.136526, 1, 1, 1, 1, 1,
-0.9556791, 0.8514249, -2.33948, 1, 1, 1, 1, 1,
-0.9548976, 0.3804859, -2.083342, 1, 1, 1, 1, 1,
-0.9489394, -0.04123246, -1.371752, 1, 1, 1, 1, 1,
-0.9462877, -0.3419241, -2.69537, 0, 0, 1, 1, 1,
-0.939659, 0.5495071, -2.139017, 1, 0, 0, 1, 1,
-0.9356076, 0.1397172, -2.123962, 1, 0, 0, 1, 1,
-0.9296997, -1.084661, -2.512328, 1, 0, 0, 1, 1,
-0.9286977, -0.9478505, -2.492928, 1, 0, 0, 1, 1,
-0.9249397, -0.1047069, -2.786672, 1, 0, 0, 1, 1,
-0.917949, 0.03368499, -1.246341, 0, 0, 0, 1, 1,
-0.9097714, 0.5445822, -1.738512, 0, 0, 0, 1, 1,
-0.8926992, 1.319254, 0.4358552, 0, 0, 0, 1, 1,
-0.8840907, 0.1828288, -1.748856, 0, 0, 0, 1, 1,
-0.8836222, -0.02403835, -1.524291, 0, 0, 0, 1, 1,
-0.873935, -0.2148467, -2.80446, 0, 0, 0, 1, 1,
-0.8731285, 0.3197892, -1.876781, 0, 0, 0, 1, 1,
-0.8675779, -1.032639, -1.961418, 1, 1, 1, 1, 1,
-0.8670478, -0.2070874, -2.712771, 1, 1, 1, 1, 1,
-0.8658924, 2.494551, 0.9263533, 1, 1, 1, 1, 1,
-0.8559701, -0.1539855, -1.689333, 1, 1, 1, 1, 1,
-0.8558061, -0.01606275, -1.848269, 1, 1, 1, 1, 1,
-0.8533029, -0.436337, -1.326909, 1, 1, 1, 1, 1,
-0.8513026, -0.9303771, -2.313775, 1, 1, 1, 1, 1,
-0.8473975, -0.4962602, -2.788039, 1, 1, 1, 1, 1,
-0.8465115, -0.7084176, -1.482527, 1, 1, 1, 1, 1,
-0.8408071, -0.4675619, -1.178806, 1, 1, 1, 1, 1,
-0.8401743, -0.586311, 0.4279923, 1, 1, 1, 1, 1,
-0.8400823, -0.6265442, -1.752393, 1, 1, 1, 1, 1,
-0.8392609, 0.9411261, -1.742611, 1, 1, 1, 1, 1,
-0.8345683, 1.234504, -0.03296355, 1, 1, 1, 1, 1,
-0.8253501, 0.1214156, -1.406528, 1, 1, 1, 1, 1,
-0.8230743, -1.599927, -2.708149, 0, 0, 1, 1, 1,
-0.8148399, 0.729356, -0.9579132, 1, 0, 0, 1, 1,
-0.8138195, -0.5636203, -4.202058, 1, 0, 0, 1, 1,
-0.810854, 1.058424, -0.5931265, 1, 0, 0, 1, 1,
-0.8101286, 2.408106, 0.9821717, 1, 0, 0, 1, 1,
-0.8089988, -0.5037599, -2.562717, 1, 0, 0, 1, 1,
-0.8051453, 1.898177, -0.8505801, 0, 0, 0, 1, 1,
-0.8044862, -0.6909581, -2.644624, 0, 0, 0, 1, 1,
-0.7948543, -0.5927818, -2.261458, 0, 0, 0, 1, 1,
-0.7910231, 0.6689699, -0.9975861, 0, 0, 0, 1, 1,
-0.7887213, 0.3114142, -1.21473, 0, 0, 0, 1, 1,
-0.7876204, 0.2797482, -2.370558, 0, 0, 0, 1, 1,
-0.7873574, -0.8006852, -1.971063, 0, 0, 0, 1, 1,
-0.7872037, -0.7494982, -3.122482, 1, 1, 1, 1, 1,
-0.7824521, -0.9839066, -0.4903888, 1, 1, 1, 1, 1,
-0.7725742, -0.3159063, -2.493348, 1, 1, 1, 1, 1,
-0.7651203, -2.045117, -4.392519, 1, 1, 1, 1, 1,
-0.7628468, 0.4341525, -2.295605, 1, 1, 1, 1, 1,
-0.7627814, 0.819204, -1.398036, 1, 1, 1, 1, 1,
-0.7626288, 0.912447, 1.448022, 1, 1, 1, 1, 1,
-0.7596636, -0.7801946, -1.214401, 1, 1, 1, 1, 1,
-0.7570105, -1.166492, -3.856791, 1, 1, 1, 1, 1,
-0.7475287, 1.392873, 0.1156565, 1, 1, 1, 1, 1,
-0.7454964, 1.888463, -0.9999247, 1, 1, 1, 1, 1,
-0.7433223, -0.1523723, -3.516926, 1, 1, 1, 1, 1,
-0.7389636, 0.9695449, -0.4171175, 1, 1, 1, 1, 1,
-0.73628, 0.4281365, -1.758224, 1, 1, 1, 1, 1,
-0.7290838, -0.9974984, -2.033174, 1, 1, 1, 1, 1,
-0.7179395, 0.3161525, -2.03286, 0, 0, 1, 1, 1,
-0.7148207, -0.4578647, -2.76012, 1, 0, 0, 1, 1,
-0.7133072, 1.403764, 0.7262822, 1, 0, 0, 1, 1,
-0.7101152, -0.4377588, -2.994025, 1, 0, 0, 1, 1,
-0.7091846, -0.5488167, -1.583208, 1, 0, 0, 1, 1,
-0.7046513, -0.3436395, -2.962779, 1, 0, 0, 1, 1,
-0.7026567, -0.4825163, -1.361286, 0, 0, 0, 1, 1,
-0.6994528, -0.9385152, -1.090685, 0, 0, 0, 1, 1,
-0.6990863, 1.565666, 1.42811, 0, 0, 0, 1, 1,
-0.6976062, 1.347735, -4.129044, 0, 0, 0, 1, 1,
-0.6950318, 1.107859, -1.853926, 0, 0, 0, 1, 1,
-0.6940413, 0.167452, -1.758169, 0, 0, 0, 1, 1,
-0.6911423, 0.5147297, -1.94981, 0, 0, 0, 1, 1,
-0.6907855, -1.193206, -2.058667, 1, 1, 1, 1, 1,
-0.6837375, -1.052273, -1.393473, 1, 1, 1, 1, 1,
-0.6794966, -0.2618506, -2.480672, 1, 1, 1, 1, 1,
-0.6756662, 0.03193913, -2.86289, 1, 1, 1, 1, 1,
-0.6730127, 0.6975189, -1.228659, 1, 1, 1, 1, 1,
-0.6710997, 0.0159832, -0.9610127, 1, 1, 1, 1, 1,
-0.6703313, 0.399823, -0.2670029, 1, 1, 1, 1, 1,
-0.6672543, -1.010637, -2.346779, 1, 1, 1, 1, 1,
-0.6663821, 0.7820577, 0.06832941, 1, 1, 1, 1, 1,
-0.6661587, 1.905128, 1.652456, 1, 1, 1, 1, 1,
-0.6559227, -1.60649, -1.967867, 1, 1, 1, 1, 1,
-0.6510777, 0.809909, -1.199599, 1, 1, 1, 1, 1,
-0.6504404, 0.05625409, -3.076062, 1, 1, 1, 1, 1,
-0.6461354, 0.8839473, 0.5626018, 1, 1, 1, 1, 1,
-0.6406641, -0.1891167, -1.014321, 1, 1, 1, 1, 1,
-0.6383144, -0.121172, -0.5468282, 0, 0, 1, 1, 1,
-0.6361033, 0.01974916, -3.500185, 1, 0, 0, 1, 1,
-0.6332912, -0.5093702, -1.734541, 1, 0, 0, 1, 1,
-0.6306057, -1.809164, -1.67097, 1, 0, 0, 1, 1,
-0.6291923, -1.830555, -3.921618, 1, 0, 0, 1, 1,
-0.6204523, -1.335109, -2.960561, 1, 0, 0, 1, 1,
-0.6154572, -1.732253, -2.759885, 0, 0, 0, 1, 1,
-0.6070666, -0.465524, -0.7558804, 0, 0, 0, 1, 1,
-0.6029444, 0.8266806, 1.120194, 0, 0, 0, 1, 1,
-0.6002339, -0.9829851, -4.579295, 0, 0, 0, 1, 1,
-0.5991672, -0.5038603, -1.847132, 0, 0, 0, 1, 1,
-0.586235, -1.710088, -0.9507324, 0, 0, 0, 1, 1,
-0.5862116, 0.2025495, -2.462732, 0, 0, 0, 1, 1,
-0.5756043, 1.104208, -0.6690931, 1, 1, 1, 1, 1,
-0.5683269, 1.165796, 0.2958108, 1, 1, 1, 1, 1,
-0.5678394, -0.256397, -3.836833, 1, 1, 1, 1, 1,
-0.5677285, -2.905877, -3.625258, 1, 1, 1, 1, 1,
-0.5657896, -1.480655, -3.590526, 1, 1, 1, 1, 1,
-0.5597866, 0.9096557, -1.027262, 1, 1, 1, 1, 1,
-0.5560811, 0.4030831, -2.371817, 1, 1, 1, 1, 1,
-0.5505507, -0.08316749, -1.859293, 1, 1, 1, 1, 1,
-0.5503873, -0.3367921, -0.5485423, 1, 1, 1, 1, 1,
-0.5498195, -0.5961472, -2.066961, 1, 1, 1, 1, 1,
-0.5475693, -0.0004673883, -1.546218, 1, 1, 1, 1, 1,
-0.5466634, 1.210292, -0.2737986, 1, 1, 1, 1, 1,
-0.5426803, 0.9778828, -0.3072827, 1, 1, 1, 1, 1,
-0.5406728, -0.7350752, -1.879977, 1, 1, 1, 1, 1,
-0.5390145, 0.7800034, -0.3941812, 1, 1, 1, 1, 1,
-0.5389109, 0.6147794, -0.1442762, 0, 0, 1, 1, 1,
-0.5388905, 1.016842, -0.04858015, 1, 0, 0, 1, 1,
-0.5370804, -1.69234, -3.163848, 1, 0, 0, 1, 1,
-0.5362423, 0.6097118, 0.4322821, 1, 0, 0, 1, 1,
-0.5344185, 0.6406251, -1.250411, 1, 0, 0, 1, 1,
-0.5342688, 1.004172, 0.3243838, 1, 0, 0, 1, 1,
-0.532924, 0.3411464, -1.95858, 0, 0, 0, 1, 1,
-0.5322329, -0.776288, -2.387776, 0, 0, 0, 1, 1,
-0.5271777, -0.5041105, -2.205426, 0, 0, 0, 1, 1,
-0.5267501, -0.4086179, -0.9102224, 0, 0, 0, 1, 1,
-0.5228529, 0.1779067, -0.1936716, 0, 0, 0, 1, 1,
-0.5189288, 0.4346683, 0.3333898, 0, 0, 0, 1, 1,
-0.5124393, -0.5673427, -1.399988, 0, 0, 0, 1, 1,
-0.5109361, -0.8112559, -1.838586, 1, 1, 1, 1, 1,
-0.509748, -0.8534269, -3.239365, 1, 1, 1, 1, 1,
-0.507534, -0.08321143, -1.435454, 1, 1, 1, 1, 1,
-0.5063659, 0.3590446, -1.160953, 1, 1, 1, 1, 1,
-0.5047716, -0.8807474, -3.473923, 1, 1, 1, 1, 1,
-0.5015475, -0.558967, -2.291981, 1, 1, 1, 1, 1,
-0.4999731, -1.866739, -3.766642, 1, 1, 1, 1, 1,
-0.4984964, 0.1611971, -2.310092, 1, 1, 1, 1, 1,
-0.4984804, -1.309908, -2.514198, 1, 1, 1, 1, 1,
-0.494973, -1.278382, -3.141977, 1, 1, 1, 1, 1,
-0.4928479, 1.441466, 0.6238241, 1, 1, 1, 1, 1,
-0.4928111, 1.183627, -1.361343, 1, 1, 1, 1, 1,
-0.4910614, -0.4351374, -1.025124, 1, 1, 1, 1, 1,
-0.4909412, -1.716932, -1.822191, 1, 1, 1, 1, 1,
-0.4883686, 0.9147301, -0.116921, 1, 1, 1, 1, 1,
-0.4872275, -0.03526201, -2.563767, 0, 0, 1, 1, 1,
-0.4863956, 0.7979911, -0.1495604, 1, 0, 0, 1, 1,
-0.4823525, -0.6882037, -4.269723, 1, 0, 0, 1, 1,
-0.4697494, -0.6115974, -3.018983, 1, 0, 0, 1, 1,
-0.4662134, -1.776241, -3.591864, 1, 0, 0, 1, 1,
-0.4657266, -0.1987734, -2.306337, 1, 0, 0, 1, 1,
-0.4596407, 1.172247, -1.086916, 0, 0, 0, 1, 1,
-0.4586224, -1.070874, -1.624555, 0, 0, 0, 1, 1,
-0.4544823, 0.8490446, -1.403639, 0, 0, 0, 1, 1,
-0.4529488, -1.429054, -2.15781, 0, 0, 0, 1, 1,
-0.4524176, -0.2506388, -1.700761, 0, 0, 0, 1, 1,
-0.4510384, -0.6825963, -3.046477, 0, 0, 0, 1, 1,
-0.4504244, 0.008580997, -0.435107, 0, 0, 0, 1, 1,
-0.4501196, -0.3456314, -0.382028, 1, 1, 1, 1, 1,
-0.4454033, -0.1808928, 0.2254986, 1, 1, 1, 1, 1,
-0.4412669, 1.06533, -0.2963643, 1, 1, 1, 1, 1,
-0.4379244, 1.153435, 4.006904, 1, 1, 1, 1, 1,
-0.4354664, -0.06985182, -3.001129, 1, 1, 1, 1, 1,
-0.4353552, -0.8777422, -4.571687, 1, 1, 1, 1, 1,
-0.4351091, 1.505601, -0.7486623, 1, 1, 1, 1, 1,
-0.4342297, 0.4142749, -1.545991, 1, 1, 1, 1, 1,
-0.4307134, -0.4365095, -3.759942, 1, 1, 1, 1, 1,
-0.4304177, -0.7621205, -2.778244, 1, 1, 1, 1, 1,
-0.4288893, -0.6496221, -1.794719, 1, 1, 1, 1, 1,
-0.4270348, -2.092054, -0.6223968, 1, 1, 1, 1, 1,
-0.4223477, 1.408787, -1.758828, 1, 1, 1, 1, 1,
-0.4213718, 1.111, 1.485376, 1, 1, 1, 1, 1,
-0.4177808, -0.954401, -2.2255, 1, 1, 1, 1, 1,
-0.4172605, 0.432771, -0.2526533, 0, 0, 1, 1, 1,
-0.416809, 1.556429, -1.606187, 1, 0, 0, 1, 1,
-0.4153479, 0.07728627, -1.70927, 1, 0, 0, 1, 1,
-0.4121559, -0.2471712, -2.377057, 1, 0, 0, 1, 1,
-0.4091748, -0.2079389, -2.522769, 1, 0, 0, 1, 1,
-0.4089884, -1.378408, -3.862644, 1, 0, 0, 1, 1,
-0.4079022, 0.9183589, 0.1089974, 0, 0, 0, 1, 1,
-0.4058588, 0.2635318, 0.1413904, 0, 0, 0, 1, 1,
-0.4015708, 0.4502027, -1.51325, 0, 0, 0, 1, 1,
-0.3985963, 0.04129591, -0.6931017, 0, 0, 0, 1, 1,
-0.3932931, -1.14372, -3.117512, 0, 0, 0, 1, 1,
-0.3896175, 0.001749725, -3.237213, 0, 0, 0, 1, 1,
-0.3885952, 0.7140562, -0.1562224, 0, 0, 0, 1, 1,
-0.3767369, 1.142633, 1.320537, 1, 1, 1, 1, 1,
-0.3767054, 0.06215538, -0.6675949, 1, 1, 1, 1, 1,
-0.3709954, -1.711941, -2.582207, 1, 1, 1, 1, 1,
-0.3693407, -0.2251395, -2.56212, 1, 1, 1, 1, 1,
-0.3682572, -0.05247146, -3.357137, 1, 1, 1, 1, 1,
-0.3659183, 0.4235578, -1.846246, 1, 1, 1, 1, 1,
-0.3656926, 0.3036895, -1.358191, 1, 1, 1, 1, 1,
-0.3634425, -0.3612775, -0.7371799, 1, 1, 1, 1, 1,
-0.362738, 1.190055, -2.229072, 1, 1, 1, 1, 1,
-0.3603575, -0.367768, -0.7043971, 1, 1, 1, 1, 1,
-0.3564205, 0.2707159, -0.4959498, 1, 1, 1, 1, 1,
-0.3554509, 1.815753, -1.351264, 1, 1, 1, 1, 1,
-0.3552344, -0.9945169, -2.694981, 1, 1, 1, 1, 1,
-0.3531604, 0.5297374, -0.9762372, 1, 1, 1, 1, 1,
-0.3513657, 1.516475, 1.369171, 1, 1, 1, 1, 1,
-0.3494265, 0.7890788, -1.93079, 0, 0, 1, 1, 1,
-0.3481113, -1.701123, -2.963362, 1, 0, 0, 1, 1,
-0.3438962, 0.9212198, 1.033807, 1, 0, 0, 1, 1,
-0.3421366, -0.9456048, -2.679188, 1, 0, 0, 1, 1,
-0.3401767, 0.5273039, 1.200752, 1, 0, 0, 1, 1,
-0.338941, -0.8802382, -2.929609, 1, 0, 0, 1, 1,
-0.33736, -1.654158, -1.477589, 0, 0, 0, 1, 1,
-0.3371913, -0.818916, -2.946861, 0, 0, 0, 1, 1,
-0.3336377, 1.187614, -0.1811685, 0, 0, 0, 1, 1,
-0.3308629, 0.6881903, -0.4164262, 0, 0, 0, 1, 1,
-0.3294435, 1.135286, 0.4114978, 0, 0, 0, 1, 1,
-0.3259083, 0.3252212, 0.4653458, 0, 0, 0, 1, 1,
-0.3257807, 0.3379412, -1.383054, 0, 0, 0, 1, 1,
-0.3241313, 0.8441122, 0.04523434, 1, 1, 1, 1, 1,
-0.3199593, 0.100304, -2.067834, 1, 1, 1, 1, 1,
-0.3193857, -0.2188007, -4.205135, 1, 1, 1, 1, 1,
-0.316003, 0.7146677, 0.4540377, 1, 1, 1, 1, 1,
-0.3117146, -0.7921093, -4.271188, 1, 1, 1, 1, 1,
-0.3092707, 1.19887, -1.690695, 1, 1, 1, 1, 1,
-0.309002, 0.8907013, -0.2554977, 1, 1, 1, 1, 1,
-0.3089654, 2.013187, 0.07366653, 1, 1, 1, 1, 1,
-0.3088188, -1.167827, -2.817218, 1, 1, 1, 1, 1,
-0.307949, 1.001556, 0.5350274, 1, 1, 1, 1, 1,
-0.305732, 0.7851111, -0.2331286, 1, 1, 1, 1, 1,
-0.3049644, 0.7683788, 0.01274458, 1, 1, 1, 1, 1,
-0.303805, -1.080611, -2.648823, 1, 1, 1, 1, 1,
-0.3012711, -0.1706817, -1.691914, 1, 1, 1, 1, 1,
-0.2970401, -0.1950426, -2.007792, 1, 1, 1, 1, 1,
-0.2963858, 0.5611718, -2.575721, 0, 0, 1, 1, 1,
-0.294991, -1.310215, -2.187963, 1, 0, 0, 1, 1,
-0.2917446, -0.2856901, -1.338222, 1, 0, 0, 1, 1,
-0.290893, 0.8923987, -0.6865203, 1, 0, 0, 1, 1,
-0.2882991, -0.1902089, -2.492828, 1, 0, 0, 1, 1,
-0.2851616, 0.5579991, -0.3989435, 1, 0, 0, 1, 1,
-0.2805498, -1.416484, -1.02656, 0, 0, 0, 1, 1,
-0.276832, 1.065125, -1.349222, 0, 0, 0, 1, 1,
-0.2731921, 0.06750595, -0.358206, 0, 0, 0, 1, 1,
-0.2705371, -0.5004592, -2.82427, 0, 0, 0, 1, 1,
-0.2636775, 0.3509727, 0.3614499, 0, 0, 0, 1, 1,
-0.2628623, -0.9910999, -3.496479, 0, 0, 0, 1, 1,
-0.2606476, -0.3359495, -1.866777, 0, 0, 0, 1, 1,
-0.2578067, -0.5000557, -3.469018, 1, 1, 1, 1, 1,
-0.2564823, -1.256745, -2.208398, 1, 1, 1, 1, 1,
-0.2483976, -2.212931, -4.036723, 1, 1, 1, 1, 1,
-0.2478122, 0.6078134, -0.5512912, 1, 1, 1, 1, 1,
-0.246219, -0.7162529, -3.753311, 1, 1, 1, 1, 1,
-0.2444221, -0.2987584, -4.049708, 1, 1, 1, 1, 1,
-0.2395058, 0.3969554, -0.09932698, 1, 1, 1, 1, 1,
-0.2384112, 0.1710785, 0.6269214, 1, 1, 1, 1, 1,
-0.2374166, 0.2198879, -0.7878062, 1, 1, 1, 1, 1,
-0.2366508, 0.2457038, 0.3433232, 1, 1, 1, 1, 1,
-0.2314924, -0.563716, -4.173451, 1, 1, 1, 1, 1,
-0.2312018, 0.4845004, -0.9632478, 1, 1, 1, 1, 1,
-0.2257118, 1.148579, 0.5369083, 1, 1, 1, 1, 1,
-0.2250159, -0.3663301, -0.7087247, 1, 1, 1, 1, 1,
-0.224275, 0.2363814, -0.6834859, 1, 1, 1, 1, 1,
-0.2220206, 0.7614917, 0.1664215, 0, 0, 1, 1, 1,
-0.2216956, -0.4309174, -3.147671, 1, 0, 0, 1, 1,
-0.2196033, -1.934608, -3.803102, 1, 0, 0, 1, 1,
-0.2174392, 1.196846, 0.780727, 1, 0, 0, 1, 1,
-0.2158448, -0.8785574, -3.835023, 1, 0, 0, 1, 1,
-0.2148166, 0.8460126, 0.5362579, 1, 0, 0, 1, 1,
-0.2146131, 0.579947, 0.004419494, 0, 0, 0, 1, 1,
-0.2104063, -0.4839084, -3.608904, 0, 0, 0, 1, 1,
-0.2102309, 1.223019, 0.0227591, 0, 0, 0, 1, 1,
-0.2000058, 2.284408, -1.083529, 0, 0, 0, 1, 1,
-0.19981, -3.109637, -2.592419, 0, 0, 0, 1, 1,
-0.1919196, 0.07469016, -0.2949691, 0, 0, 0, 1, 1,
-0.1880251, -0.1958521, -2.955371, 0, 0, 0, 1, 1,
-0.1866145, -0.03616095, -1.991403, 1, 1, 1, 1, 1,
-0.1820643, 0.3764701, -3.194724, 1, 1, 1, 1, 1,
-0.1805183, -1.60117, -4.714975, 1, 1, 1, 1, 1,
-0.1798307, 0.9466263, -1.422068, 1, 1, 1, 1, 1,
-0.1794742, -1.282646, -4.012165, 1, 1, 1, 1, 1,
-0.1764797, 0.2199008, -0.707938, 1, 1, 1, 1, 1,
-0.1745787, 0.8057981, 0.9564178, 1, 1, 1, 1, 1,
-0.1671922, 0.5050659, 0.2068923, 1, 1, 1, 1, 1,
-0.1671515, -0.1300624, -2.485688, 1, 1, 1, 1, 1,
-0.1601269, 0.0155315, -0.2768376, 1, 1, 1, 1, 1,
-0.1587203, 0.1996601, -0.3071111, 1, 1, 1, 1, 1,
-0.1501231, 0.6195451, 1.051388, 1, 1, 1, 1, 1,
-0.1450473, -0.3120084, -2.478794, 1, 1, 1, 1, 1,
-0.1419851, -0.09871066, -2.849885, 1, 1, 1, 1, 1,
-0.1409733, -1.370662, -3.524208, 1, 1, 1, 1, 1,
-0.1399163, 1.688282, 0.2200825, 0, 0, 1, 1, 1,
-0.1337898, -0.793951, -4.732137, 1, 0, 0, 1, 1,
-0.133419, -2.34882, -1.354664, 1, 0, 0, 1, 1,
-0.1296058, 1.072071, -2.401861, 1, 0, 0, 1, 1,
-0.1286661, -1.848011, -2.35701, 1, 0, 0, 1, 1,
-0.1285537, -1.471739, -1.59739, 1, 0, 0, 1, 1,
-0.1265622, -0.02135062, -2.814761, 0, 0, 0, 1, 1,
-0.1229315, -1.04702, -4.345383, 0, 0, 0, 1, 1,
-0.1219754, -1.048856, -3.577095, 0, 0, 0, 1, 1,
-0.1166856, -2.18204, -2.336445, 0, 0, 0, 1, 1,
-0.114988, 0.5076919, -0.4628581, 0, 0, 0, 1, 1,
-0.1132268, 0.9534087, -0.1677206, 0, 0, 0, 1, 1,
-0.1131046, 1.716681, -1.27499, 0, 0, 0, 1, 1,
-0.1125246, -1.056222, -4.331574, 1, 1, 1, 1, 1,
-0.1113658, 0.8901138, -0.7982092, 1, 1, 1, 1, 1,
-0.1105838, -0.884845, -4.63698, 1, 1, 1, 1, 1,
-0.1102929, -0.7182929, -2.578433, 1, 1, 1, 1, 1,
-0.110183, 0.1811779, 1.026429, 1, 1, 1, 1, 1,
-0.1044364, -0.4829822, -3.421836, 1, 1, 1, 1, 1,
-0.1036016, -0.5070127, -1.831853, 1, 1, 1, 1, 1,
-0.1021943, 2.10464, -2.037008, 1, 1, 1, 1, 1,
-0.09887164, -1.023628, -2.503216, 1, 1, 1, 1, 1,
-0.09666596, -0.6031792, -3.125835, 1, 1, 1, 1, 1,
-0.09660645, -0.09216263, -2.181499, 1, 1, 1, 1, 1,
-0.09551965, -0.4269284, -0.3052221, 1, 1, 1, 1, 1,
-0.08723835, 0.333873, 0.7732741, 1, 1, 1, 1, 1,
-0.08640904, -0.04466631, -0.7976253, 1, 1, 1, 1, 1,
-0.08265133, 1.118337, 0.1235524, 1, 1, 1, 1, 1,
-0.07908055, -0.4991578, -3.397267, 0, 0, 1, 1, 1,
-0.07828394, -0.8815416, -1.912421, 1, 0, 0, 1, 1,
-0.07635345, 1.392288, -0.8079371, 1, 0, 0, 1, 1,
-0.07041761, -1.484151, -3.150093, 1, 0, 0, 1, 1,
-0.06998096, 0.3318085, -0.4894153, 1, 0, 0, 1, 1,
-0.06947775, 0.3438503, -1.349201, 1, 0, 0, 1, 1,
-0.05622833, -1.215487, -4.604839, 0, 0, 0, 1, 1,
-0.05416312, 1.552526, 1.080175, 0, 0, 0, 1, 1,
-0.05254443, -0.6109594, -4.990384, 0, 0, 0, 1, 1,
-0.05170279, -0.1340985, -1.884153, 0, 0, 0, 1, 1,
-0.05043804, 1.176609, -0.4574043, 0, 0, 0, 1, 1,
-0.05022633, -1.559887, -2.642582, 0, 0, 0, 1, 1,
-0.04893095, 1.228808, 0.3348399, 0, 0, 0, 1, 1,
-0.04425918, 0.2992499, -0.9760605, 1, 1, 1, 1, 1,
-0.03084332, -0.8316124, -4.008772, 1, 1, 1, 1, 1,
-0.03015316, -1.201847, -3.413658, 1, 1, 1, 1, 1,
-0.02564928, -0.8585321, -2.24532, 1, 1, 1, 1, 1,
-0.01984907, -2.23644, -2.406552, 1, 1, 1, 1, 1,
-0.01877273, -1.487086, -3.528344, 1, 1, 1, 1, 1,
-0.01568206, 1.170918, -0.3830558, 1, 1, 1, 1, 1,
-0.009076177, 0.05374147, 0.4519703, 1, 1, 1, 1, 1,
-0.007845481, 0.0009729905, -3.291632, 1, 1, 1, 1, 1,
-0.004366569, 1.22838, 0.08364809, 1, 1, 1, 1, 1,
0.002369539, -0.5647224, 1.770555, 1, 1, 1, 1, 1,
0.00432511, -1.605449, 5.32132, 1, 1, 1, 1, 1,
0.005010742, 0.2466088, 0.09844333, 1, 1, 1, 1, 1,
0.007890516, -1.25943, 2.593655, 1, 1, 1, 1, 1,
0.009120181, -1.645022, 2.549418, 1, 1, 1, 1, 1,
0.01094368, -1.530133, 2.528041, 0, 0, 1, 1, 1,
0.01128722, 0.7736428, -0.7281854, 1, 0, 0, 1, 1,
0.01401948, -0.1355718, 2.320348, 1, 0, 0, 1, 1,
0.01432438, -0.429574, 4.872194, 1, 0, 0, 1, 1,
0.01560418, -1.963524, 3.688608, 1, 0, 0, 1, 1,
0.01641828, -1.001421, 3.18364, 1, 0, 0, 1, 1,
0.01692614, 0.4300977, -2.032518, 0, 0, 0, 1, 1,
0.01918556, -0.5757543, 3.532555, 0, 0, 0, 1, 1,
0.02011736, -0.3668758, 2.188889, 0, 0, 0, 1, 1,
0.02071434, -0.1718693, 3.726562, 0, 0, 0, 1, 1,
0.02143651, 0.6685354, -0.4380403, 0, 0, 0, 1, 1,
0.02713374, 2.223195, 0.02187145, 0, 0, 0, 1, 1,
0.02858971, -0.7881302, 4.805128, 0, 0, 0, 1, 1,
0.03525138, -0.4409205, 2.722458, 1, 1, 1, 1, 1,
0.03545227, 0.9225138, 0.778691, 1, 1, 1, 1, 1,
0.03696436, 0.01752688, 2.532754, 1, 1, 1, 1, 1,
0.04181316, 0.3282388, -0.7717364, 1, 1, 1, 1, 1,
0.05017751, -1.213013, 1.84874, 1, 1, 1, 1, 1,
0.05136731, -0.6559568, 2.125761, 1, 1, 1, 1, 1,
0.05200395, -0.1040048, 4.851112, 1, 1, 1, 1, 1,
0.05444386, 2.469966, 0.6163189, 1, 1, 1, 1, 1,
0.05644202, 0.2410933, 1.843412, 1, 1, 1, 1, 1,
0.063022, 0.6395119, -1.286755, 1, 1, 1, 1, 1,
0.06328952, 0.3297948, 1.066827, 1, 1, 1, 1, 1,
0.06675562, -0.815995, 3.252337, 1, 1, 1, 1, 1,
0.07044981, 0.2890975, 0.7389848, 1, 1, 1, 1, 1,
0.0718993, 0.2017493, 1.919401, 1, 1, 1, 1, 1,
0.07719626, 1.649029, 0.06727839, 1, 1, 1, 1, 1,
0.07814979, -0.8791041, 2.041224, 0, 0, 1, 1, 1,
0.07837156, -0.7893426, 2.467528, 1, 0, 0, 1, 1,
0.07846215, 2.019084, -0.7830076, 1, 0, 0, 1, 1,
0.08132943, -2.111404, 1.271623, 1, 0, 0, 1, 1,
0.08406616, -0.5374087, 2.359419, 1, 0, 0, 1, 1,
0.08532546, -0.2903907, 1.68065, 1, 0, 0, 1, 1,
0.08567294, -1.086763, 2.954133, 0, 0, 0, 1, 1,
0.09018884, -1.682869, 2.51043, 0, 0, 0, 1, 1,
0.09220536, -0.4409253, 0.8205939, 0, 0, 0, 1, 1,
0.09516608, 0.6374142, -0.2374318, 0, 0, 0, 1, 1,
0.09697534, -1.2451, 2.29203, 0, 0, 0, 1, 1,
0.09704298, -0.4094288, 2.940867, 0, 0, 0, 1, 1,
0.09709609, 0.03326663, 0.4850755, 0, 0, 0, 1, 1,
0.09988401, 0.3054636, 0.1827229, 1, 1, 1, 1, 1,
0.1040843, 0.5925615, -0.1741397, 1, 1, 1, 1, 1,
0.1054586, 0.5647284, 0.2624098, 1, 1, 1, 1, 1,
0.1122803, 1.681891, 0.3682672, 1, 1, 1, 1, 1,
0.1130745, 1.142664, -1.158747, 1, 1, 1, 1, 1,
0.1161311, -0.3654848, 2.639751, 1, 1, 1, 1, 1,
0.1177032, -0.7552543, 2.339971, 1, 1, 1, 1, 1,
0.1190955, -1.529908, 1.732175, 1, 1, 1, 1, 1,
0.1206105, 0.9759102, 0.4669181, 1, 1, 1, 1, 1,
0.1257916, -0.07774942, 2.488838, 1, 1, 1, 1, 1,
0.1283287, -0.250685, 1.539433, 1, 1, 1, 1, 1,
0.1290325, -0.8495512, 2.053996, 1, 1, 1, 1, 1,
0.1305182, -0.591666, 3.51851, 1, 1, 1, 1, 1,
0.1328717, 0.1041606, -0.7194656, 1, 1, 1, 1, 1,
0.1348261, 0.955295, -1.845465, 1, 1, 1, 1, 1,
0.1393569, 0.003839536, 1.508789, 0, 0, 1, 1, 1,
0.1405248, 1.256233, -1.629045, 1, 0, 0, 1, 1,
0.1405576, 0.4590916, 0.5442784, 1, 0, 0, 1, 1,
0.1426374, 0.5069491, -0.000772894, 1, 0, 0, 1, 1,
0.1426583, 0.001987072, 2.811972, 1, 0, 0, 1, 1,
0.1502273, 0.8929968, -1.502733, 1, 0, 0, 1, 1,
0.1533605, -0.2761505, 3.441583, 0, 0, 0, 1, 1,
0.1591926, 0.4713002, -0.3618767, 0, 0, 0, 1, 1,
0.1593686, 1.588236, 0.5740949, 0, 0, 0, 1, 1,
0.1602259, 2.016322, -0.8223457, 0, 0, 0, 1, 1,
0.1618526, -1.751532, 3.915539, 0, 0, 0, 1, 1,
0.1624265, -0.5221535, 1.32033, 0, 0, 0, 1, 1,
0.1633426, -1.118844, 3.947849, 0, 0, 0, 1, 1,
0.1691037, 0.8566129, -0.6647959, 1, 1, 1, 1, 1,
0.1701208, -0.30773, 1.634971, 1, 1, 1, 1, 1,
0.1703037, -0.07022028, 1.482043, 1, 1, 1, 1, 1,
0.1706425, -0.1296801, 3.851878, 1, 1, 1, 1, 1,
0.1707666, 0.3132075, 0.07757611, 1, 1, 1, 1, 1,
0.1743096, 0.3090928, -0.8905577, 1, 1, 1, 1, 1,
0.1792602, 0.5457051, -0.6344689, 1, 1, 1, 1, 1,
0.1827462, 0.5099052, 0.2522904, 1, 1, 1, 1, 1,
0.184323, 0.8023785, 0.8356797, 1, 1, 1, 1, 1,
0.1869894, -0.854859, 3.467072, 1, 1, 1, 1, 1,
0.1886959, -1.386925, 4.899035, 1, 1, 1, 1, 1,
0.1947312, -2.10175, 3.258312, 1, 1, 1, 1, 1,
0.1967263, -0.08477051, 1.795563, 1, 1, 1, 1, 1,
0.1979443, -1.555216, 4.092351, 1, 1, 1, 1, 1,
0.2072081, -1.578464, 2.780976, 1, 1, 1, 1, 1,
0.2103581, -1.405583, 4.143281, 0, 0, 1, 1, 1,
0.2105472, -0.5430065, 3.722481, 1, 0, 0, 1, 1,
0.2118194, -0.09040637, 2.168324, 1, 0, 0, 1, 1,
0.212462, -1.260767, 2.159465, 1, 0, 0, 1, 1,
0.2144494, 0.3270803, 0.5477456, 1, 0, 0, 1, 1,
0.2145154, -0.5020435, 2.590183, 1, 0, 0, 1, 1,
0.2170039, -1.752779, 3.884699, 0, 0, 0, 1, 1,
0.2185575, -1.833773, 1.539064, 0, 0, 0, 1, 1,
0.2208729, 0.08337123, 2.479947, 0, 0, 0, 1, 1,
0.2240925, 1.654397, 0.2388271, 0, 0, 0, 1, 1,
0.2243001, -0.7052281, 3.142159, 0, 0, 0, 1, 1,
0.2255549, 1.5095, 0.7022992, 0, 0, 0, 1, 1,
0.226561, -1.449863, 2.788527, 0, 0, 0, 1, 1,
0.2308025, -0.1833407, 1.011527, 1, 1, 1, 1, 1,
0.2310813, 0.2356786, -1.906135, 1, 1, 1, 1, 1,
0.2341948, -0.6313596, 3.417215, 1, 1, 1, 1, 1,
0.2382585, 0.432146, 0.3753485, 1, 1, 1, 1, 1,
0.2434717, -0.9304086, 5.242331, 1, 1, 1, 1, 1,
0.2492651, -1.688342, 3.557456, 1, 1, 1, 1, 1,
0.2517422, 0.6188858, 0.2637457, 1, 1, 1, 1, 1,
0.2528099, -0.02009566, 1.926576, 1, 1, 1, 1, 1,
0.2536046, 2.732883, 0.3716639, 1, 1, 1, 1, 1,
0.2546994, 0.7818191, 1.304687, 1, 1, 1, 1, 1,
0.2575404, 1.506961, -0.5152625, 1, 1, 1, 1, 1,
0.2611429, 0.4063306, 0.6425681, 1, 1, 1, 1, 1,
0.2611644, -2.656042, 2.395965, 1, 1, 1, 1, 1,
0.262317, 0.8620546, -1.26403, 1, 1, 1, 1, 1,
0.2651353, -0.2449969, 2.069811, 1, 1, 1, 1, 1,
0.2678239, -0.7603178, 3.437332, 0, 0, 1, 1, 1,
0.26785, 1.262011, -0.07573999, 1, 0, 0, 1, 1,
0.2680975, -1.22585, 3.508668, 1, 0, 0, 1, 1,
0.2692035, 0.2790479, 1.005106, 1, 0, 0, 1, 1,
0.2698985, 1.173668, 0.727003, 1, 0, 0, 1, 1,
0.2743717, 0.7104753, -0.5061482, 1, 0, 0, 1, 1,
0.2784289, -1.277411, 2.066907, 0, 0, 0, 1, 1,
0.2809392, -0.1901852, 0.2066448, 0, 0, 0, 1, 1,
0.2852513, -0.818662, 4.298457, 0, 0, 0, 1, 1,
0.2870734, 1.083337, -0.7956321, 0, 0, 0, 1, 1,
0.2887179, 0.8486471, 0.8001547, 0, 0, 0, 1, 1,
0.2911865, 0.6290907, 0.7686318, 0, 0, 0, 1, 1,
0.2936875, 0.6240052, 1.336229, 0, 0, 0, 1, 1,
0.2965024, 0.09278947, 0.5505853, 1, 1, 1, 1, 1,
0.2968465, -0.01093343, 2.376656, 1, 1, 1, 1, 1,
0.3057919, -0.8193742, 2.009176, 1, 1, 1, 1, 1,
0.3138611, -1.096437, 3.343161, 1, 1, 1, 1, 1,
0.3155054, -0.6709927, 3.724812, 1, 1, 1, 1, 1,
0.3164537, 0.305846, 0.8603241, 1, 1, 1, 1, 1,
0.3165976, 0.4666163, 1.72248, 1, 1, 1, 1, 1,
0.3172983, 0.2337799, 1.252128, 1, 1, 1, 1, 1,
0.3204659, -0.8912644, 4.337432, 1, 1, 1, 1, 1,
0.3228965, 0.04448255, 0.2630349, 1, 1, 1, 1, 1,
0.3235527, 0.7999576, 0.4649948, 1, 1, 1, 1, 1,
0.3269045, -0.9610301, 2.354917, 1, 1, 1, 1, 1,
0.3319112, -1.201478, 3.515062, 1, 1, 1, 1, 1,
0.3331504, 0.2929927, -0.2145546, 1, 1, 1, 1, 1,
0.3360042, 0.2214158, 1.577796, 1, 1, 1, 1, 1,
0.3360131, -0.8279966, 0.6454884, 0, 0, 1, 1, 1,
0.3365469, -0.1100703, 1.959911, 1, 0, 0, 1, 1,
0.3399121, -0.6605049, 2.441361, 1, 0, 0, 1, 1,
0.3427805, -0.5642409, 3.163418, 1, 0, 0, 1, 1,
0.3444843, -1.788572, 2.403437, 1, 0, 0, 1, 1,
0.3485917, 1.641663, 0.5472277, 1, 0, 0, 1, 1,
0.3491988, 0.8758786, 0.4715379, 0, 0, 0, 1, 1,
0.351928, -0.9114257, 3.182685, 0, 0, 0, 1, 1,
0.3528002, 2.231318, -0.4100787, 0, 0, 0, 1, 1,
0.3593707, -0.31338, 1.15882, 0, 0, 0, 1, 1,
0.360573, 0.5919015, -0.8575765, 0, 0, 0, 1, 1,
0.3610598, 0.1620459, 1.899881, 0, 0, 0, 1, 1,
0.3626353, -0.3931681, 1.134453, 0, 0, 0, 1, 1,
0.3684441, 0.4892857, 2.324934, 1, 1, 1, 1, 1,
0.3775921, 1.109731, -0.5526578, 1, 1, 1, 1, 1,
0.3896834, 1.741137, 2.981487, 1, 1, 1, 1, 1,
0.3954709, 0.2704981, -0.5145692, 1, 1, 1, 1, 1,
0.3980376, -1.031818, 1.726053, 1, 1, 1, 1, 1,
0.4001148, -1.748223, 3.028267, 1, 1, 1, 1, 1,
0.4043027, -0.2584724, 1.399875, 1, 1, 1, 1, 1,
0.4058803, 0.1326763, 0.4129203, 1, 1, 1, 1, 1,
0.4114752, -1.388525, 4.092146, 1, 1, 1, 1, 1,
0.4174699, 0.9500594, -0.2976577, 1, 1, 1, 1, 1,
0.4208415, 0.3110403, 0.4312305, 1, 1, 1, 1, 1,
0.4243419, 0.1228137, -0.3204315, 1, 1, 1, 1, 1,
0.4252909, -1.245981, 2.926805, 1, 1, 1, 1, 1,
0.426498, 0.2887273, 0.1961578, 1, 1, 1, 1, 1,
0.4287197, 1.361611, -0.403616, 1, 1, 1, 1, 1,
0.4303469, 0.4129698, 1.163759, 0, 0, 1, 1, 1,
0.4313276, -0.3721806, 2.114362, 1, 0, 0, 1, 1,
0.4352336, 1.183506, 0.7826086, 1, 0, 0, 1, 1,
0.4429902, -0.4653328, 1.913015, 1, 0, 0, 1, 1,
0.4431506, 0.8065787, 1.623879, 1, 0, 0, 1, 1,
0.4459919, 3.049387, 0.04505145, 1, 0, 0, 1, 1,
0.4478159, -0.6254459, 0.8846324, 0, 0, 0, 1, 1,
0.4527766, -0.4817464, 3.289412, 0, 0, 0, 1, 1,
0.4623074, 1.096961, 1.502463, 0, 0, 0, 1, 1,
0.4688876, -0.8150361, 4.307268, 0, 0, 0, 1, 1,
0.4693255, -0.6172112, 1.42458, 0, 0, 0, 1, 1,
0.4710895, 0.5593557, 1.604062, 0, 0, 0, 1, 1,
0.4729525, -0.8275902, 3.241884, 0, 0, 0, 1, 1,
0.4753315, 1.715618, 1.552665, 1, 1, 1, 1, 1,
0.4753766, 0.9013774, 2.21911, 1, 1, 1, 1, 1,
0.4779693, 0.8120198, 0.4088968, 1, 1, 1, 1, 1,
0.482383, -0.618261, 2.849446, 1, 1, 1, 1, 1,
0.4829448, -0.02410588, 2.508289, 1, 1, 1, 1, 1,
0.4834862, 0.8137543, 0.6027596, 1, 1, 1, 1, 1,
0.4851238, -1.219641, 1.963728, 1, 1, 1, 1, 1,
0.4863291, 0.8418497, 0.6918758, 1, 1, 1, 1, 1,
0.4870445, 0.7204847, 2.020152, 1, 1, 1, 1, 1,
0.4881961, 1.578455, 0.4660839, 1, 1, 1, 1, 1,
0.4888316, -0.1428642, 0.4391614, 1, 1, 1, 1, 1,
0.4921449, -0.1673042, 1.363063, 1, 1, 1, 1, 1,
0.4945252, -0.3535371, 0.5457844, 1, 1, 1, 1, 1,
0.4953277, 0.2943451, -0.01196602, 1, 1, 1, 1, 1,
0.4998479, 0.0733553, 1.085175, 1, 1, 1, 1, 1,
0.5017276, -1.087294, 2.628086, 0, 0, 1, 1, 1,
0.5029824, 0.434402, 0.3781662, 1, 0, 0, 1, 1,
0.5035625, 0.8173687, 2.243428, 1, 0, 0, 1, 1,
0.503924, -0.5602279, 2.286252, 1, 0, 0, 1, 1,
0.5074009, 0.07416132, 1.603828, 1, 0, 0, 1, 1,
0.5164682, -0.373433, 2.197562, 1, 0, 0, 1, 1,
0.5190796, 1.053305, 0.09734221, 0, 0, 0, 1, 1,
0.5206494, -1.176443, 3.545891, 0, 0, 0, 1, 1,
0.5234979, -0.3073377, 1.199045, 0, 0, 0, 1, 1,
0.5241765, -1.068777, 1.814718, 0, 0, 0, 1, 1,
0.527779, 0.06526078, 1.399487, 0, 0, 0, 1, 1,
0.528061, 0.6021974, 0.6344731, 0, 0, 0, 1, 1,
0.5370272, 0.2919759, 1.726328, 0, 0, 0, 1, 1,
0.5391008, -0.1254915, 0.7757559, 1, 1, 1, 1, 1,
0.5413873, 0.2374747, 2.810439, 1, 1, 1, 1, 1,
0.541702, 0.6554809, 1.444757, 1, 1, 1, 1, 1,
0.5473588, -0.7365245, 2.447635, 1, 1, 1, 1, 1,
0.5475557, 1.244939, -0.02256511, 1, 1, 1, 1, 1,
0.554755, 0.8471989, -0.7769074, 1, 1, 1, 1, 1,
0.5583352, 0.3304619, 0.9364886, 1, 1, 1, 1, 1,
0.5584103, 1.170606, 0.3831621, 1, 1, 1, 1, 1,
0.5592127, -0.4262479, 0.2460671, 1, 1, 1, 1, 1,
0.5640166, 1.491201, 1.353001, 1, 1, 1, 1, 1,
0.5753486, -0.5786461, 2.474581, 1, 1, 1, 1, 1,
0.5811618, 0.7441283, 1.439144, 1, 1, 1, 1, 1,
0.5830685, -0.9848671, 1.837386, 1, 1, 1, 1, 1,
0.5877148, -0.6624205, 2.093478, 1, 1, 1, 1, 1,
0.588756, -1.212216, 3.463892, 1, 1, 1, 1, 1,
0.5900581, 0.1395887, -0.7719758, 0, 0, 1, 1, 1,
0.592579, 0.2494423, 0.6091123, 1, 0, 0, 1, 1,
0.5931812, -0.7169666, 3.075739, 1, 0, 0, 1, 1,
0.5939929, -1.82132, 4.073462, 1, 0, 0, 1, 1,
0.5965815, 0.2453924, 0.9486858, 1, 0, 0, 1, 1,
0.5978487, 0.3309095, 1.691087, 1, 0, 0, 1, 1,
0.6003969, 0.8816289, -1.221206, 0, 0, 0, 1, 1,
0.6037168, -0.4631736, 3.416601, 0, 0, 0, 1, 1,
0.6081824, -1.411514, 4.632693, 0, 0, 0, 1, 1,
0.6093255, 0.1511804, 1.325483, 0, 0, 0, 1, 1,
0.615069, -0.5477005, 0.2604039, 0, 0, 0, 1, 1,
0.6162296, -1.385167, 0.9801327, 0, 0, 0, 1, 1,
0.6182752, 0.494561, 1.560714, 0, 0, 0, 1, 1,
0.6204346, 0.0728678, 2.73059, 1, 1, 1, 1, 1,
0.6272751, 0.7501688, 0.2535065, 1, 1, 1, 1, 1,
0.6287882, -0.4347631, 3.371031, 1, 1, 1, 1, 1,
0.6292602, -0.9925293, 3.656709, 1, 1, 1, 1, 1,
0.6321994, 0.2845807, 1.447957, 1, 1, 1, 1, 1,
0.6328216, 0.2557662, 1.399325, 1, 1, 1, 1, 1,
0.6345124, 0.2105766, 3.05152, 1, 1, 1, 1, 1,
0.6448554, -1.2218, 1.99127, 1, 1, 1, 1, 1,
0.6478481, 0.566542, 0.8916345, 1, 1, 1, 1, 1,
0.64854, 0.5462654, 2.278396, 1, 1, 1, 1, 1,
0.649001, -0.003396449, -0.07477342, 1, 1, 1, 1, 1,
0.6493487, 0.3316264, 0.92571, 1, 1, 1, 1, 1,
0.6517058, 1.762973, -0.1522773, 1, 1, 1, 1, 1,
0.6538348, 0.9856222, 0.7500493, 1, 1, 1, 1, 1,
0.6541053, -0.5748436, 1.162428, 1, 1, 1, 1, 1,
0.6550619, 0.7379968, -0.01482708, 0, 0, 1, 1, 1,
0.6620293, 0.9865006, -0.7662923, 1, 0, 0, 1, 1,
0.6652445, 1.002142, 0.02514958, 1, 0, 0, 1, 1,
0.6659605, -0.1442594, 4.695697, 1, 0, 0, 1, 1,
0.6666498, -0.01608582, 2.615681, 1, 0, 0, 1, 1,
0.6667631, 0.770478, 0.315997, 1, 0, 0, 1, 1,
0.6669188, 2.020873, -1.351478, 0, 0, 0, 1, 1,
0.6696182, -0.3602516, 0.2228932, 0, 0, 0, 1, 1,
0.6856026, -0.4399957, 1.231765, 0, 0, 0, 1, 1,
0.6879347, -0.4266573, 0.7659804, 0, 0, 0, 1, 1,
0.6914042, 1.157714, 2.116838, 0, 0, 0, 1, 1,
0.6933309, -1.129851, 2.272352, 0, 0, 0, 1, 1,
0.6937302, -1.050896, 4.977548, 0, 0, 0, 1, 1,
0.6946546, 1.121722, -0.7224671, 1, 1, 1, 1, 1,
0.695296, 0.9206222, 0.8516327, 1, 1, 1, 1, 1,
0.7031202, 1.100544, 0.4623022, 1, 1, 1, 1, 1,
0.7059656, 0.6646532, 1.349635, 1, 1, 1, 1, 1,
0.7137823, 1.765956, -0.9257564, 1, 1, 1, 1, 1,
0.7140658, 0.5040262, 1.528012, 1, 1, 1, 1, 1,
0.7148324, -1.868322, 2.206348, 1, 1, 1, 1, 1,
0.7151655, -0.827477, 1.587056, 1, 1, 1, 1, 1,
0.7165834, 0.8218265, 0.6051764, 1, 1, 1, 1, 1,
0.7179451, 2.255591, 1.701502, 1, 1, 1, 1, 1,
0.7262163, -0.4918614, 0.8477958, 1, 1, 1, 1, 1,
0.727572, -1.041488, 1.923274, 1, 1, 1, 1, 1,
0.7292092, -1.083592, 2.668728, 1, 1, 1, 1, 1,
0.7377555, -0.2515093, 2.53109, 1, 1, 1, 1, 1,
0.744136, 1.343755, 1.362141, 1, 1, 1, 1, 1,
0.7647001, 0.3000769, 0.842786, 0, 0, 1, 1, 1,
0.7653369, -0.1149373, 3.609254, 1, 0, 0, 1, 1,
0.7723693, 1.800698, 1.028691, 1, 0, 0, 1, 1,
0.7825693, 1.366902, -0.03679626, 1, 0, 0, 1, 1,
0.7830263, 0.5897185, 1.561407, 1, 0, 0, 1, 1,
0.7837932, 0.4785626, 2.415501, 1, 0, 0, 1, 1,
0.7949541, 0.3470673, 2.098893, 0, 0, 0, 1, 1,
0.7953754, -1.512136, 4.871307, 0, 0, 0, 1, 1,
0.8058046, 0.5120201, 2.000977, 0, 0, 0, 1, 1,
0.8072025, 2.029459, 0.5897367, 0, 0, 0, 1, 1,
0.8280591, 0.4328697, 1.630217, 0, 0, 0, 1, 1,
0.8344323, -0.3244603, 1.308652, 0, 0, 0, 1, 1,
0.8381336, -1.20691, 2.388685, 0, 0, 0, 1, 1,
0.8416822, 1.26179, 1.142764, 1, 1, 1, 1, 1,
0.8443796, 1.436709, 0.4992492, 1, 1, 1, 1, 1,
0.8488441, 0.9644943, 1.962722, 1, 1, 1, 1, 1,
0.8505023, 1.147495, 1.447014, 1, 1, 1, 1, 1,
0.8510717, -1.267157, 3.097683, 1, 1, 1, 1, 1,
0.8589227, -0.5244816, 0.9202174, 1, 1, 1, 1, 1,
0.8590143, -1.38899, 3.652532, 1, 1, 1, 1, 1,
0.8631421, -2.359514, 3.08833, 1, 1, 1, 1, 1,
0.8647161, 1.117803, 1.275935, 1, 1, 1, 1, 1,
0.8667471, -0.9845061, 3.289808, 1, 1, 1, 1, 1,
0.869374, 0.4172404, 0.7925205, 1, 1, 1, 1, 1,
0.8708385, 1.118836, 0.9454305, 1, 1, 1, 1, 1,
0.8726599, -0.9906364, 3.351415, 1, 1, 1, 1, 1,
0.8752182, -0.2894309, 2.240767, 1, 1, 1, 1, 1,
0.8776317, 0.6239222, 1.417874, 1, 1, 1, 1, 1,
0.8800014, 1.259618, 0.6177683, 0, 0, 1, 1, 1,
0.8823799, -0.6918887, 3.694772, 1, 0, 0, 1, 1,
0.8843754, 0.03504623, 0.7068234, 1, 0, 0, 1, 1,
0.8887453, -2.774005, 1.78336, 1, 0, 0, 1, 1,
0.8896304, 1.744524, 0.1859654, 1, 0, 0, 1, 1,
0.8954332, 0.3752109, 1.5018, 1, 0, 0, 1, 1,
0.8961977, 0.4002743, 0.7805688, 0, 0, 0, 1, 1,
0.8998927, 0.4615433, -0.08356754, 0, 0, 0, 1, 1,
0.9002139, -1.617034, 1.473657, 0, 0, 0, 1, 1,
0.9002857, -1.897985, 3.4115, 0, 0, 0, 1, 1,
0.9043079, 0.02040648, 2.309987, 0, 0, 0, 1, 1,
0.9083105, -0.126386, 1.276852, 0, 0, 0, 1, 1,
0.9085555, -0.4042114, 3.847636, 0, 0, 0, 1, 1,
0.908803, -1.131392, 3.558711, 1, 1, 1, 1, 1,
0.9114736, 0.1047032, 1.759403, 1, 1, 1, 1, 1,
0.9173841, -0.4792253, 3.645828, 1, 1, 1, 1, 1,
0.9195392, 1.597071, -0.7409706, 1, 1, 1, 1, 1,
0.9258195, -2.239292, 2.209832, 1, 1, 1, 1, 1,
0.9268555, -1.179921, 1.547541, 1, 1, 1, 1, 1,
0.9308558, -1.251721, 1.872431, 1, 1, 1, 1, 1,
0.9366581, 1.801586, 0.655686, 1, 1, 1, 1, 1,
0.9377071, 1.122904, 0.449467, 1, 1, 1, 1, 1,
0.9378748, -0.9118143, 3.243975, 1, 1, 1, 1, 1,
0.94578, -0.1443653, 1.894161, 1, 1, 1, 1, 1,
0.9470975, -0.2617583, -1.066284, 1, 1, 1, 1, 1,
0.9535987, -0.865891, 1.283162, 1, 1, 1, 1, 1,
0.9537441, 1.899931, 0.9438545, 1, 1, 1, 1, 1,
0.9575483, -0.7199861, 2.766824, 1, 1, 1, 1, 1,
0.9601839, 0.3605879, 1.028667, 0, 0, 1, 1, 1,
0.9694644, 0.593401, -1.511886, 1, 0, 0, 1, 1,
0.9708723, 1.212208, 0.1809855, 1, 0, 0, 1, 1,
0.9719278, -0.4811716, 2.063572, 1, 0, 0, 1, 1,
0.9767811, 0.640677, 0.8926987, 1, 0, 0, 1, 1,
0.9807488, -0.1220375, 1.267049, 1, 0, 0, 1, 1,
0.987719, 0.7857968, 2.04139, 0, 0, 0, 1, 1,
0.9887757, 0.5048141, 0.516751, 0, 0, 0, 1, 1,
0.9936904, 0.4803592, 3.067535, 0, 0, 0, 1, 1,
0.9983847, -0.2967517, 3.070552, 0, 0, 0, 1, 1,
0.9990757, 0.1161267, 1.595477, 0, 0, 0, 1, 1,
1.003374, 0.4252596, 1.005992, 0, 0, 0, 1, 1,
1.005727, 0.7619593, 1.69602, 0, 0, 0, 1, 1,
1.005925, -0.7706453, 2.44799, 1, 1, 1, 1, 1,
1.012029, 1.462598, -0.7722414, 1, 1, 1, 1, 1,
1.020778, 0.2304073, 0.4758257, 1, 1, 1, 1, 1,
1.023761, -0.457738, 1.561539, 1, 1, 1, 1, 1,
1.026857, -0.07838103, 0.06805994, 1, 1, 1, 1, 1,
1.035921, -0.2774472, -0.1727098, 1, 1, 1, 1, 1,
1.036893, -1.327378, 1.289323, 1, 1, 1, 1, 1,
1.04153, -0.2467478, 1.176094, 1, 1, 1, 1, 1,
1.049456, 0.3985504, 0.3558625, 1, 1, 1, 1, 1,
1.051868, 0.333596, 2.739188, 1, 1, 1, 1, 1,
1.054307, 1.543256, 1.699256, 1, 1, 1, 1, 1,
1.057628, -1.525332, 2.636327, 1, 1, 1, 1, 1,
1.060733, 0.9590491, 0.06528335, 1, 1, 1, 1, 1,
1.062445, 0.2660328, 2.114675, 1, 1, 1, 1, 1,
1.069393, -0.07806265, 1.568019, 1, 1, 1, 1, 1,
1.070982, -2.043672, 2.562793, 0, 0, 1, 1, 1,
1.073746, -1.092427, 0.807386, 1, 0, 0, 1, 1,
1.0923, 1.505919, -0.5628937, 1, 0, 0, 1, 1,
1.092711, 0.855841, 1.947659, 1, 0, 0, 1, 1,
1.093321, -1.290262, 3.503515, 1, 0, 0, 1, 1,
1.095257, 0.08070261, 0.1721522, 1, 0, 0, 1, 1,
1.097108, -1.00037, 4.114398, 0, 0, 0, 1, 1,
1.098515, -1.623622, 2.248632, 0, 0, 0, 1, 1,
1.107736, -0.1107931, 1.632722, 0, 0, 0, 1, 1,
1.120408, -0.1559112, 2.468011, 0, 0, 0, 1, 1,
1.125106, 1.080942, 1.005391, 0, 0, 0, 1, 1,
1.131822, -0.4595575, 0.9700224, 0, 0, 0, 1, 1,
1.147928, -0.5482002, 3.298758, 0, 0, 0, 1, 1,
1.158482, 1.238732, 1.215197, 1, 1, 1, 1, 1,
1.164856, 1.03986, 0.9282327, 1, 1, 1, 1, 1,
1.171277, -0.3122034, 1.732635, 1, 1, 1, 1, 1,
1.177338, 0.794761, 1.519683, 1, 1, 1, 1, 1,
1.186604, 0.6517109, -0.1337213, 1, 1, 1, 1, 1,
1.187367, -0.1383244, 0.3914515, 1, 1, 1, 1, 1,
1.189979, 0.237078, 0.788681, 1, 1, 1, 1, 1,
1.192304, 0.009113603, 2.552934, 1, 1, 1, 1, 1,
1.20107, 0.4350217, -0.4122863, 1, 1, 1, 1, 1,
1.205474, -0.9426447, 1.460369, 1, 1, 1, 1, 1,
1.207391, 0.1965691, 0.007854629, 1, 1, 1, 1, 1,
1.215784, 0.4520007, 0.5047329, 1, 1, 1, 1, 1,
1.217545, 0.6053929, 1.459911, 1, 1, 1, 1, 1,
1.221184, 0.03201865, 1.025137, 1, 1, 1, 1, 1,
1.22876, 1.3349, 1.555621, 1, 1, 1, 1, 1,
1.230333, 0.04779803, 2.512669, 0, 0, 1, 1, 1,
1.237902, 0.1636399, -0.1310196, 1, 0, 0, 1, 1,
1.258371, -1.21353, 2.461058, 1, 0, 0, 1, 1,
1.261909, 0.2888499, 0.07998736, 1, 0, 0, 1, 1,
1.264352, -0.06305787, 2.083996, 1, 0, 0, 1, 1,
1.271887, -0.1124572, 3.722558, 1, 0, 0, 1, 1,
1.279546, 0.03226735, -0.4759669, 0, 0, 0, 1, 1,
1.286978, 0.7475236, 1.317408, 0, 0, 0, 1, 1,
1.289356, -0.3168741, 1.569262, 0, 0, 0, 1, 1,
1.302212, 1.845061, 0.8153356, 0, 0, 0, 1, 1,
1.307541, -0.6657662, 2.173354, 0, 0, 0, 1, 1,
1.312388, 0.2791688, 1.55123, 0, 0, 0, 1, 1,
1.324107, -0.8027399, 1.197012, 0, 0, 0, 1, 1,
1.336095, 0.7409958, 2.521794, 1, 1, 1, 1, 1,
1.343992, -0.5290369, 2.707937, 1, 1, 1, 1, 1,
1.345172, 0.8185262, 0.5041906, 1, 1, 1, 1, 1,
1.346919, 0.2806216, 2.592553, 1, 1, 1, 1, 1,
1.351595, 0.6189967, 3.116984, 1, 1, 1, 1, 1,
1.351974, -0.6404449, 2.412931, 1, 1, 1, 1, 1,
1.354958, -1.724134, 2.749994, 1, 1, 1, 1, 1,
1.356047, -0.5592421, 1.231871, 1, 1, 1, 1, 1,
1.35822, -0.4735098, 3.313578, 1, 1, 1, 1, 1,
1.367188, -0.7223156, 1.530013, 1, 1, 1, 1, 1,
1.368669, 0.2959927, 0.8533667, 1, 1, 1, 1, 1,
1.377918, 0.5757557, 0.04888127, 1, 1, 1, 1, 1,
1.38068, -0.2895292, 4.012863, 1, 1, 1, 1, 1,
1.393616, -1.253166, 3.120842, 1, 1, 1, 1, 1,
1.403252, -0.8599232, 2.46612, 1, 1, 1, 1, 1,
1.407899, 0.07063901, 1.560999, 0, 0, 1, 1, 1,
1.417399, 0.2107542, 3.051851, 1, 0, 0, 1, 1,
1.419241, 0.6665533, 1.73349, 1, 0, 0, 1, 1,
1.420001, 0.5888525, -1.023184, 1, 0, 0, 1, 1,
1.421422, -0.4143993, 1.212953, 1, 0, 0, 1, 1,
1.441254, -1.569585, 2.45163, 1, 0, 0, 1, 1,
1.443137, -0.3150882, 2.347628, 0, 0, 0, 1, 1,
1.449644, -0.2089166, 1.932646, 0, 0, 0, 1, 1,
1.466731, -1.085309, 1.926509, 0, 0, 0, 1, 1,
1.496403, 0.4116645, 0.9207628, 0, 0, 0, 1, 1,
1.501997, 0.3912314, 0.8283892, 0, 0, 0, 1, 1,
1.506946, 0.7039632, 1.527426, 0, 0, 0, 1, 1,
1.507864, 0.635399, 1.453152, 0, 0, 0, 1, 1,
1.509012, 0.4131887, 1.386088, 1, 1, 1, 1, 1,
1.512685, 1.690274, 1.09456, 1, 1, 1, 1, 1,
1.512843, -0.8567469, 1.893365, 1, 1, 1, 1, 1,
1.52631, 1.970806, 1.156477, 1, 1, 1, 1, 1,
1.527571, 0.4931459, 1.216915, 1, 1, 1, 1, 1,
1.552846, -0.4020692, 1.732418, 1, 1, 1, 1, 1,
1.566581, -0.1266129, 1.202975, 1, 1, 1, 1, 1,
1.577331, -0.944735, 1.419643, 1, 1, 1, 1, 1,
1.57977, 0.9506145, 0.4173697, 1, 1, 1, 1, 1,
1.587852, 0.6122504, -0.5985442, 1, 1, 1, 1, 1,
1.602017, 0.03001904, 1.731003, 1, 1, 1, 1, 1,
1.610956, 0.7787898, 0.6066127, 1, 1, 1, 1, 1,
1.613517, 0.4318072, 0.7509025, 1, 1, 1, 1, 1,
1.615079, 0.6569523, 2.895733, 1, 1, 1, 1, 1,
1.631237, -1.422207, 2.194969, 1, 1, 1, 1, 1,
1.66145, 0.1143391, 1.347017, 0, 0, 1, 1, 1,
1.674039, -0.7717875, 2.364846, 1, 0, 0, 1, 1,
1.675939, -1.225457, 3.781272, 1, 0, 0, 1, 1,
1.705338, 0.04048828, 1.007965, 1, 0, 0, 1, 1,
1.706334, 0.8364209, -0.3129322, 1, 0, 0, 1, 1,
1.748919, -0.7136687, 1.222455, 1, 0, 0, 1, 1,
1.748947, -0.2631059, 3.657039, 0, 0, 0, 1, 1,
1.758941, -1.270331, 0.5476468, 0, 0, 0, 1, 1,
1.76766, -0.2441866, 1.212332, 0, 0, 0, 1, 1,
1.779701, -0.2146444, 2.306422, 0, 0, 0, 1, 1,
1.786809, 1.18442, 1.645812, 0, 0, 0, 1, 1,
1.796124, -0.6981363, 2.098564, 0, 0, 0, 1, 1,
1.826984, -0.6463248, 0.2223929, 0, 0, 0, 1, 1,
1.849663, -0.1346829, 2.227752, 1, 1, 1, 1, 1,
1.880077, -0.5162119, 2.481471, 1, 1, 1, 1, 1,
1.894615, 0.5331982, 2.517905, 1, 1, 1, 1, 1,
1.920368, -1.013067, 2.434876, 1, 1, 1, 1, 1,
1.933933, 2.809005, -1.054848, 1, 1, 1, 1, 1,
1.936954, 1.480838, 0.4220535, 1, 1, 1, 1, 1,
1.943186, -0.9228916, 1.92479, 1, 1, 1, 1, 1,
1.952016, 0.0757044, 1.160475, 1, 1, 1, 1, 1,
1.967614, -0.3334256, 1.758252, 1, 1, 1, 1, 1,
1.973887, 0.4509096, -1.144787, 1, 1, 1, 1, 1,
1.976772, -0.7588616, 0.9546656, 1, 1, 1, 1, 1,
1.980963, 0.6755603, 0.6106327, 1, 1, 1, 1, 1,
1.990231, 0.8341742, 1.211283, 1, 1, 1, 1, 1,
1.998258, -0.06434427, 3.185424, 1, 1, 1, 1, 1,
2.026784, 2.567539, 0.6595575, 1, 1, 1, 1, 1,
2.032347, -1.715226, 1.039765, 0, 0, 1, 1, 1,
2.049252, -0.8294395, 0.8801144, 1, 0, 0, 1, 1,
2.074363, 0.6722145, -0.9479339, 1, 0, 0, 1, 1,
2.092346, 0.630963, 1.131988, 1, 0, 0, 1, 1,
2.128579, 0.2119386, 2.20175, 1, 0, 0, 1, 1,
2.137279, 1.04129, 2.223507, 1, 0, 0, 1, 1,
2.145521, 1.145327, 2.925026, 0, 0, 0, 1, 1,
2.171985, -1.430919, 2.076393, 0, 0, 0, 1, 1,
2.219419, 1.218166, 1.469577, 0, 0, 0, 1, 1,
2.335324, -0.3132059, 2.158153, 0, 0, 0, 1, 1,
2.373792, 2.831161, 1.007434, 0, 0, 0, 1, 1,
2.376801, 0.2259404, 2.697325, 0, 0, 0, 1, 1,
2.579424, 0.2060017, 1.066037, 0, 0, 0, 1, 1,
2.654, 0.02240397, 1.205746, 1, 1, 1, 1, 1,
2.666122, -0.4891863, 3.255508, 1, 1, 1, 1, 1,
2.673107, 1.114195, 0.4677499, 1, 1, 1, 1, 1,
2.722929, -0.6106858, 0.2800137, 1, 1, 1, 1, 1,
2.873202, 0.3142931, 1.285786, 1, 1, 1, 1, 1,
2.979788, -1.265578, 2.206725, 1, 1, 1, 1, 1,
3.230683, 2.045441, 1.1767, 1, 1, 1, 1, 1
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
var radius = 9.69304;
var distance = 34.04639;
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
mvMatrix.translate( 0.4521515, 0.1726196, -0.165468 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04639);
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
