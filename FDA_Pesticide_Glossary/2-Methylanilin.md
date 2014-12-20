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
-3.078255, -0.4220372, -2.726173, 1, 0, 0, 1,
-2.997077, -0.6302797, -2.226111, 1, 0.007843138, 0, 1,
-2.683406, 1.339374, -1.17057, 1, 0.01176471, 0, 1,
-2.614667, 0.2738554, -2.46254, 1, 0.01960784, 0, 1,
-2.518734, -0.7286981, -1.651537, 1, 0.02352941, 0, 1,
-2.427141, -0.01968728, 0.818531, 1, 0.03137255, 0, 1,
-2.425651, -0.6027143, -1.048727, 1, 0.03529412, 0, 1,
-2.400921, 0.1728556, -1.749356, 1, 0.04313726, 0, 1,
-2.232733, -0.5244187, -2.671331, 1, 0.04705882, 0, 1,
-2.217272, -0.01154234, -2.713432, 1, 0.05490196, 0, 1,
-2.19716, -1.409411, -2.080175, 1, 0.05882353, 0, 1,
-2.185357, 0.9317687, -0.7331833, 1, 0.06666667, 0, 1,
-2.166401, 0.384624, -0.7124487, 1, 0.07058824, 0, 1,
-2.136392, 2.771304, -0.2976109, 1, 0.07843138, 0, 1,
-2.126964, 1.310292, -1.637495, 1, 0.08235294, 0, 1,
-2.095358, 1.181017, -0.5564681, 1, 0.09019608, 0, 1,
-2.090185, 0.5894664, -2.591789, 1, 0.09411765, 0, 1,
-2.080178, 0.4807109, -0.9693007, 1, 0.1019608, 0, 1,
-2.071689, 1.854492, -2.627563, 1, 0.1098039, 0, 1,
-2.045942, -1.272622, -1.980228, 1, 0.1137255, 0, 1,
-2.021641, -0.117494, -1.020395, 1, 0.1215686, 0, 1,
-2.007315, 0.3729056, -1.855444, 1, 0.1254902, 0, 1,
-2.000952, -1.784484, -2.073232, 1, 0.1333333, 0, 1,
-1.988024, 0.4629025, -1.529312, 1, 0.1372549, 0, 1,
-1.981254, -0.098682, 0.1871545, 1, 0.145098, 0, 1,
-1.943795, 0.3300293, -1.372223, 1, 0.1490196, 0, 1,
-1.939762, -0.9594213, -2.423248, 1, 0.1568628, 0, 1,
-1.9392, -0.4375767, -3.084876, 1, 0.1607843, 0, 1,
-1.910888, -1.552439, -1.875062, 1, 0.1686275, 0, 1,
-1.909049, 1.370628, -1.17893, 1, 0.172549, 0, 1,
-1.887125, -0.5917078, -1.599157, 1, 0.1803922, 0, 1,
-1.869553, 2.075765, -2.030022, 1, 0.1843137, 0, 1,
-1.8613, -0.4409083, 0.5194381, 1, 0.1921569, 0, 1,
-1.856328, -0.8736193, -2.995437, 1, 0.1960784, 0, 1,
-1.832583, -0.2785169, -2.128008, 1, 0.2039216, 0, 1,
-1.8155, 0.2691335, -1.441361, 1, 0.2117647, 0, 1,
-1.804174, -2.059458, -3.43015, 1, 0.2156863, 0, 1,
-1.787694, -0.6778377, -0.9130995, 1, 0.2235294, 0, 1,
-1.785338, -0.8067063, -1.067659, 1, 0.227451, 0, 1,
-1.782694, -0.6644664, -1.719808, 1, 0.2352941, 0, 1,
-1.782054, 0.7157671, -1.159997, 1, 0.2392157, 0, 1,
-1.750045, 1.566411, 0.5551416, 1, 0.2470588, 0, 1,
-1.742449, -3.501119, -2.502442, 1, 0.2509804, 0, 1,
-1.73268, 0.6537031, -1.586985, 1, 0.2588235, 0, 1,
-1.727564, -0.04720837, -1.20541, 1, 0.2627451, 0, 1,
-1.715505, -0.3216644, -0.6500276, 1, 0.2705882, 0, 1,
-1.693736, -0.5630259, -2.507526, 1, 0.2745098, 0, 1,
-1.688797, 0.6049989, -0.5920808, 1, 0.282353, 0, 1,
-1.680767, -0.3086263, -3.486894, 1, 0.2862745, 0, 1,
-1.680253, -0.7500055, -3.626354, 1, 0.2941177, 0, 1,
-1.678501, 1.100697, -1.475921, 1, 0.3019608, 0, 1,
-1.666011, 1.147053, -1.60439, 1, 0.3058824, 0, 1,
-1.636167, -0.9106256, -2.146531, 1, 0.3137255, 0, 1,
-1.627101, 0.1548702, -0.7221853, 1, 0.3176471, 0, 1,
-1.596472, -0.1246013, -0.9733856, 1, 0.3254902, 0, 1,
-1.594031, -1.120609, -1.215538, 1, 0.3294118, 0, 1,
-1.585467, 0.9379148, -0.0228923, 1, 0.3372549, 0, 1,
-1.559237, 1.434825, -0.9989581, 1, 0.3411765, 0, 1,
-1.542614, 1.246261, 0.2451961, 1, 0.3490196, 0, 1,
-1.541335, -0.4921892, -1.193496, 1, 0.3529412, 0, 1,
-1.529404, -1.208264, -3.943404, 1, 0.3607843, 0, 1,
-1.528286, 1.564214, -2.386519, 1, 0.3647059, 0, 1,
-1.508486, 1.333895, -0.8248091, 1, 0.372549, 0, 1,
-1.508387, 0.2384155, -2.770518, 1, 0.3764706, 0, 1,
-1.508016, 0.5212187, -0.393003, 1, 0.3843137, 0, 1,
-1.499692, -0.01092482, -1.920828, 1, 0.3882353, 0, 1,
-1.497211, -0.966581, -3.716772, 1, 0.3960784, 0, 1,
-1.496981, 0.1590948, -1.658484, 1, 0.4039216, 0, 1,
-1.486569, -0.3905493, -2.308526, 1, 0.4078431, 0, 1,
-1.452421, -0.3720815, -1.29045, 1, 0.4156863, 0, 1,
-1.431425, -0.7177787, -2.30253, 1, 0.4196078, 0, 1,
-1.422314, 0.8319904, -0.7965423, 1, 0.427451, 0, 1,
-1.406724, 1.139806, -0.4265433, 1, 0.4313726, 0, 1,
-1.405566, -0.1602913, -1.464496, 1, 0.4392157, 0, 1,
-1.404481, -0.9185096, -1.251648, 1, 0.4431373, 0, 1,
-1.401775, -1.268788, -1.739991, 1, 0.4509804, 0, 1,
-1.398505, -1.09503, -2.768423, 1, 0.454902, 0, 1,
-1.397785, 0.7925618, 0.1053285, 1, 0.4627451, 0, 1,
-1.38047, -0.5860127, -1.815808, 1, 0.4666667, 0, 1,
-1.365014, -1.076009, -0.7083234, 1, 0.4745098, 0, 1,
-1.356722, -0.04898702, -1.334144, 1, 0.4784314, 0, 1,
-1.353842, 3.428226, -1.973901, 1, 0.4862745, 0, 1,
-1.34963, -2.109372, -4.121048, 1, 0.4901961, 0, 1,
-1.348694, 1.115729, -1.872513, 1, 0.4980392, 0, 1,
-1.335361, 0.2841117, 0.8908277, 1, 0.5058824, 0, 1,
-1.321839, -1.167358, -1.493992, 1, 0.509804, 0, 1,
-1.300485, 0.1357022, -2.20288, 1, 0.5176471, 0, 1,
-1.294738, -2.503443, -3.167627, 1, 0.5215687, 0, 1,
-1.292295, 1.231725, 0.2723939, 1, 0.5294118, 0, 1,
-1.284932, 0.6209157, -0.3830815, 1, 0.5333334, 0, 1,
-1.277184, -0.1787877, -2.786123, 1, 0.5411765, 0, 1,
-1.272532, 1.147066, 1.160821, 1, 0.5450981, 0, 1,
-1.270865, -0.4509937, -1.779588, 1, 0.5529412, 0, 1,
-1.257719, 0.7167226, -1.721874, 1, 0.5568628, 0, 1,
-1.245838, -1.470765, -4.549088, 1, 0.5647059, 0, 1,
-1.2413, -0.5634636, -0.9415195, 1, 0.5686275, 0, 1,
-1.233864, 0.9174781, -1.1495, 1, 0.5764706, 0, 1,
-1.225589, -2.438641, -2.178891, 1, 0.5803922, 0, 1,
-1.223246, -0.5637113, -3.229638, 1, 0.5882353, 0, 1,
-1.222982, 0.03954818, -1.669102, 1, 0.5921569, 0, 1,
-1.212737, 0.1640021, -1.983047, 1, 0.6, 0, 1,
-1.212317, 0.5742921, -3.278823, 1, 0.6078432, 0, 1,
-1.199405, -2.059713, -1.664933, 1, 0.6117647, 0, 1,
-1.1796, 0.2439708, -1.923856, 1, 0.6196079, 0, 1,
-1.177214, -1.42433, -1.635929, 1, 0.6235294, 0, 1,
-1.174264, 1.487654, -1.049193, 1, 0.6313726, 0, 1,
-1.165645, -0.5034476, -0.9613421, 1, 0.6352941, 0, 1,
-1.160348, -0.923021, -2.48548, 1, 0.6431373, 0, 1,
-1.156651, 0.209434, -1.040716, 1, 0.6470588, 0, 1,
-1.154803, -0.3157732, -1.444615, 1, 0.654902, 0, 1,
-1.141011, -1.067713, -2.876449, 1, 0.6588235, 0, 1,
-1.140152, 0.2963142, 0.2754652, 1, 0.6666667, 0, 1,
-1.137662, 0.7502598, -0.2577552, 1, 0.6705883, 0, 1,
-1.136385, -0.005192532, -1.593833, 1, 0.6784314, 0, 1,
-1.132468, 1.292707, 0.592868, 1, 0.682353, 0, 1,
-1.12842, 0.4248313, 0.1729684, 1, 0.6901961, 0, 1,
-1.121855, 1.643245, -0.1800455, 1, 0.6941177, 0, 1,
-1.121559, -1.192246, -2.79, 1, 0.7019608, 0, 1,
-1.120375, 1.548908, -0.9891998, 1, 0.7098039, 0, 1,
-1.120133, -0.2041923, -1.876912, 1, 0.7137255, 0, 1,
-1.114445, -0.1267013, -0.2454879, 1, 0.7215686, 0, 1,
-1.101334, 0.8430158, -0.9969088, 1, 0.7254902, 0, 1,
-1.098701, -0.8798352, -1.542352, 1, 0.7333333, 0, 1,
-1.090504, 1.004633, -0.7906025, 1, 0.7372549, 0, 1,
-1.088987, -0.6179249, -2.10066, 1, 0.7450981, 0, 1,
-1.088158, 0.4544545, -0.5899203, 1, 0.7490196, 0, 1,
-1.087759, 0.5874745, -0.6851286, 1, 0.7568628, 0, 1,
-1.069946, -0.07276586, -1.195099, 1, 0.7607843, 0, 1,
-1.068704, 0.2065329, -2.850153, 1, 0.7686275, 0, 1,
-1.063039, 1.266285, -0.200996, 1, 0.772549, 0, 1,
-1.060863, 0.340306, -2.158377, 1, 0.7803922, 0, 1,
-1.058263, -0.07121076, -3.44198, 1, 0.7843137, 0, 1,
-1.056348, -1.818778, -2.518723, 1, 0.7921569, 0, 1,
-1.050736, -0.8288033, -2.609952, 1, 0.7960784, 0, 1,
-1.050516, 1.677413, 1.397004, 1, 0.8039216, 0, 1,
-1.049341, 0.5816823, -1.074884, 1, 0.8117647, 0, 1,
-1.035068, -0.8064274, -0.5818011, 1, 0.8156863, 0, 1,
-1.034892, -0.3514356, -2.650694, 1, 0.8235294, 0, 1,
-1.033165, 0.7799257, -0.7295531, 1, 0.827451, 0, 1,
-1.025847, 0.2211901, -0.8244009, 1, 0.8352941, 0, 1,
-1.020335, 2.014239, -1.907118, 1, 0.8392157, 0, 1,
-1.019799, 0.2142961, -1.611054, 1, 0.8470588, 0, 1,
-1.012206, -0.6586017, -1.636312, 1, 0.8509804, 0, 1,
-1.007295, -0.5564502, -3.201252, 1, 0.8588235, 0, 1,
-1.007034, -0.01821683, -2.045851, 1, 0.8627451, 0, 1,
-0.999, 1.081087, -0.580897, 1, 0.8705882, 0, 1,
-0.982634, 0.3647761, -0.4026251, 1, 0.8745098, 0, 1,
-0.9799937, 2.429281, -0.08102192, 1, 0.8823529, 0, 1,
-0.9760002, 0.06265017, -1.847545, 1, 0.8862745, 0, 1,
-0.9722781, -0.2634561, -1.7717, 1, 0.8941177, 0, 1,
-0.9703613, 0.07387924, -1.194904, 1, 0.8980392, 0, 1,
-0.9689289, 0.237702, -1.311023, 1, 0.9058824, 0, 1,
-0.9658774, 0.5003468, 0.91049, 1, 0.9137255, 0, 1,
-0.9605407, 0.3204747, 1.575804, 1, 0.9176471, 0, 1,
-0.9582785, 1.25389, -0.4316738, 1, 0.9254902, 0, 1,
-0.9574238, -1.393289, -3.737643, 1, 0.9294118, 0, 1,
-0.945811, 0.08735231, -1.899397, 1, 0.9372549, 0, 1,
-0.9384901, 0.5325255, -1.004615, 1, 0.9411765, 0, 1,
-0.9306749, -0.4312183, -3.356248, 1, 0.9490196, 0, 1,
-0.9286987, 1.317067, -1.842729, 1, 0.9529412, 0, 1,
-0.9248585, -0.9860283, -1.432514, 1, 0.9607843, 0, 1,
-0.924676, 0.5180259, -2.096224, 1, 0.9647059, 0, 1,
-0.9202779, -0.1605801, -2.242247, 1, 0.972549, 0, 1,
-0.9166986, 0.8903525, 0.06825264, 1, 0.9764706, 0, 1,
-0.9145128, -0.5940771, -2.630467, 1, 0.9843137, 0, 1,
-0.9124128, -0.7620907, -2.692841, 1, 0.9882353, 0, 1,
-0.9121422, -0.6422207, -5.064453, 1, 0.9960784, 0, 1,
-0.908956, -1.086924, -1.355733, 0.9960784, 1, 0, 1,
-0.908502, -0.5364398, -0.9439299, 0.9921569, 1, 0, 1,
-0.9053325, 0.6179391, -0.5593161, 0.9843137, 1, 0, 1,
-0.9023477, 0.2706626, -1.115457, 0.9803922, 1, 0, 1,
-0.9013681, 0.2175235, -1.999919, 0.972549, 1, 0, 1,
-0.8892739, -0.4195137, -0.9022529, 0.9686275, 1, 0, 1,
-0.8784619, -0.3026668, -2.51162, 0.9607843, 1, 0, 1,
-0.8783703, 1.251966, -3.277638, 0.9568627, 1, 0, 1,
-0.8747267, -0.09544971, -1.526541, 0.9490196, 1, 0, 1,
-0.8727981, -0.6917376, -1.739694, 0.945098, 1, 0, 1,
-0.87091, -0.776248, -4.671718, 0.9372549, 1, 0, 1,
-0.8606367, 2.189827, 0.785589, 0.9333333, 1, 0, 1,
-0.8573682, -1.425236, -2.131818, 0.9254902, 1, 0, 1,
-0.8563681, 0.7416754, -2.304228, 0.9215686, 1, 0, 1,
-0.8507066, -0.1661112, -1.330362, 0.9137255, 1, 0, 1,
-0.8468243, 1.565081, -1.67501, 0.9098039, 1, 0, 1,
-0.8467242, -0.5086331, -2.290188, 0.9019608, 1, 0, 1,
-0.8422043, 1.000572, -1.033085, 0.8941177, 1, 0, 1,
-0.8375935, -0.1101371, -1.851732, 0.8901961, 1, 0, 1,
-0.837567, -0.4550341, -1.538337, 0.8823529, 1, 0, 1,
-0.8353756, -0.4284463, -0.7138594, 0.8784314, 1, 0, 1,
-0.8346145, -0.2570834, -3.8588, 0.8705882, 1, 0, 1,
-0.8344104, 0.5330072, -0.4303491, 0.8666667, 1, 0, 1,
-0.8297206, 0.5317577, -0.4038474, 0.8588235, 1, 0, 1,
-0.8292527, 0.01947194, 0.5999021, 0.854902, 1, 0, 1,
-0.8227806, 0.4015482, 0.1223024, 0.8470588, 1, 0, 1,
-0.8208525, 2.059316, 0.8550773, 0.8431373, 1, 0, 1,
-0.8198935, -0.07674567, -2.24245, 0.8352941, 1, 0, 1,
-0.8197041, 0.6443978, -0.04313932, 0.8313726, 1, 0, 1,
-0.808616, 0.2673784, 0.3100954, 0.8235294, 1, 0, 1,
-0.8070062, -0.1782452, -2.001572, 0.8196079, 1, 0, 1,
-0.8064888, -2.766012, -1.106993, 0.8117647, 1, 0, 1,
-0.8038567, -1.036934, -2.252052, 0.8078431, 1, 0, 1,
-0.8006899, -0.3212011, -1.898806, 0.8, 1, 0, 1,
-0.7960584, 0.9234465, -1.497912, 0.7921569, 1, 0, 1,
-0.7902814, 0.4760617, -1.523214, 0.7882353, 1, 0, 1,
-0.7864349, -1.187962, -2.650367, 0.7803922, 1, 0, 1,
-0.7861875, 0.3087729, -1.736605, 0.7764706, 1, 0, 1,
-0.7856404, 0.356539, -0.05776647, 0.7686275, 1, 0, 1,
-0.7841302, 0.04137278, -1.679787, 0.7647059, 1, 0, 1,
-0.7768186, -1.726893, -1.644188, 0.7568628, 1, 0, 1,
-0.773948, -0.05684186, -3.547175, 0.7529412, 1, 0, 1,
-0.7721823, 0.2761801, 0.01509468, 0.7450981, 1, 0, 1,
-0.7654089, -0.06766092, -3.130902, 0.7411765, 1, 0, 1,
-0.756919, -1.482166, -2.919179, 0.7333333, 1, 0, 1,
-0.7557796, 0.2787833, -0.9851273, 0.7294118, 1, 0, 1,
-0.7512797, 1.370728, -1.281209, 0.7215686, 1, 0, 1,
-0.7480944, 1.046481, -0.888951, 0.7176471, 1, 0, 1,
-0.7476649, -0.531184, -3.632828, 0.7098039, 1, 0, 1,
-0.7447519, -1.57279, -1.864126, 0.7058824, 1, 0, 1,
-0.7394261, -0.6147792, -3.464421, 0.6980392, 1, 0, 1,
-0.7387504, -0.5104624, -3.589467, 0.6901961, 1, 0, 1,
-0.7254679, 3.13849, -0.5849808, 0.6862745, 1, 0, 1,
-0.7143933, -1.085661, -3.620589, 0.6784314, 1, 0, 1,
-0.7131208, 1.162391, 0.2546955, 0.6745098, 1, 0, 1,
-0.7128667, 0.3402793, -0.9984201, 0.6666667, 1, 0, 1,
-0.7095171, 1.23021, -0.2905606, 0.6627451, 1, 0, 1,
-0.709141, 0.07421768, -3.135806, 0.654902, 1, 0, 1,
-0.706742, -1.580526, -1.235845, 0.6509804, 1, 0, 1,
-0.7054575, 0.1426997, -0.6909794, 0.6431373, 1, 0, 1,
-0.6859188, 2.609305, -1.78041, 0.6392157, 1, 0, 1,
-0.6823847, -0.5083709, -4.305166, 0.6313726, 1, 0, 1,
-0.6820474, 0.4265754, -1.409806, 0.627451, 1, 0, 1,
-0.6804654, 1.427192, 0.2777548, 0.6196079, 1, 0, 1,
-0.6801934, -1.078126, -5.071042, 0.6156863, 1, 0, 1,
-0.6769876, -0.3798829, -1.836602, 0.6078432, 1, 0, 1,
-0.6767529, 0.423559, -2.217644, 0.6039216, 1, 0, 1,
-0.6713946, -0.01576265, -0.005915362, 0.5960785, 1, 0, 1,
-0.666393, -0.763959, -2.2446, 0.5882353, 1, 0, 1,
-0.6632395, -2.646306, -1.498966, 0.5843138, 1, 0, 1,
-0.6596258, 0.7678148, 0.1768998, 0.5764706, 1, 0, 1,
-0.6569456, -0.4499529, -1.780293, 0.572549, 1, 0, 1,
-0.6526159, -2.357271, -3.262979, 0.5647059, 1, 0, 1,
-0.6489677, 1.905717, -1.090667, 0.5607843, 1, 0, 1,
-0.6448405, 1.946857, -0.9517855, 0.5529412, 1, 0, 1,
-0.6424359, 1.367828, -0.6834603, 0.5490196, 1, 0, 1,
-0.6409626, -0.8356335, -5.015411, 0.5411765, 1, 0, 1,
-0.6391975, 0.009079724, 0.2243564, 0.5372549, 1, 0, 1,
-0.6379321, 1.04822, -0.7137441, 0.5294118, 1, 0, 1,
-0.6246039, 0.2715361, -1.012178, 0.5254902, 1, 0, 1,
-0.6240532, 0.05589217, -2.569293, 0.5176471, 1, 0, 1,
-0.6189714, -1.7371, -3.76083, 0.5137255, 1, 0, 1,
-0.6187906, 0.7629517, -2.628945, 0.5058824, 1, 0, 1,
-0.6185482, 1.278367, -0.5828922, 0.5019608, 1, 0, 1,
-0.6185188, 0.5448964, -0.3390968, 0.4941176, 1, 0, 1,
-0.615927, -1.000548, -2.847413, 0.4862745, 1, 0, 1,
-0.6124079, -0.2762505, -2.201572, 0.4823529, 1, 0, 1,
-0.6105791, -1.459007, -1.84883, 0.4745098, 1, 0, 1,
-0.6092626, -0.1276327, -2.817056, 0.4705882, 1, 0, 1,
-0.6051106, -0.7739443, -2.371898, 0.4627451, 1, 0, 1,
-0.6040305, -1.657484, -3.079187, 0.4588235, 1, 0, 1,
-0.6040116, 1.453618, -0.1936029, 0.4509804, 1, 0, 1,
-0.5947961, -1.668664, -4.095525, 0.4470588, 1, 0, 1,
-0.5898036, 0.3325011, -1.001519, 0.4392157, 1, 0, 1,
-0.5835683, 0.2644127, -0.3622524, 0.4352941, 1, 0, 1,
-0.5834207, -0.3969888, -3.000786, 0.427451, 1, 0, 1,
-0.5779703, -0.2785692, -1.095377, 0.4235294, 1, 0, 1,
-0.5730312, -0.1148904, -2.69134, 0.4156863, 1, 0, 1,
-0.5714836, 2.717186, -2.000096, 0.4117647, 1, 0, 1,
-0.5707433, -0.08225296, -2.583784, 0.4039216, 1, 0, 1,
-0.5700157, -0.372981, 0.1600897, 0.3960784, 1, 0, 1,
-0.5678311, 0.4451365, -1.742346, 0.3921569, 1, 0, 1,
-0.5630922, -1.125876, -2.937267, 0.3843137, 1, 0, 1,
-0.5614754, 0.3760663, 0.1190678, 0.3803922, 1, 0, 1,
-0.5610638, 0.5889971, -0.05675948, 0.372549, 1, 0, 1,
-0.5599111, 0.7430813, -0.7900827, 0.3686275, 1, 0, 1,
-0.559308, 1.616722, -0.1147598, 0.3607843, 1, 0, 1,
-0.5588284, -0.8084847, -2.860996, 0.3568628, 1, 0, 1,
-0.5587214, -1.052857, -2.171932, 0.3490196, 1, 0, 1,
-0.5532766, 1.139334, -0.8882259, 0.345098, 1, 0, 1,
-0.5531781, -0.5355247, -0.7817298, 0.3372549, 1, 0, 1,
-0.5515162, 0.5331997, -1.851765, 0.3333333, 1, 0, 1,
-0.5492302, -0.3106045, -2.101879, 0.3254902, 1, 0, 1,
-0.5423841, 1.180674, -0.6866346, 0.3215686, 1, 0, 1,
-0.5405794, -0.2083743, -0.7958183, 0.3137255, 1, 0, 1,
-0.531496, -0.8859584, -3.373893, 0.3098039, 1, 0, 1,
-0.5310453, -1.610276, -3.506648, 0.3019608, 1, 0, 1,
-0.5286825, -0.9585306, -3.148938, 0.2941177, 1, 0, 1,
-0.5253864, 0.779986, -1.230948, 0.2901961, 1, 0, 1,
-0.5197356, -0.494011, -2.759353, 0.282353, 1, 0, 1,
-0.5148667, 0.5874116, 0.7725195, 0.2784314, 1, 0, 1,
-0.5106071, -1.479588, -4.601294, 0.2705882, 1, 0, 1,
-0.5054511, 1.162141, -1.78741, 0.2666667, 1, 0, 1,
-0.5050776, -0.09530439, -0.7259066, 0.2588235, 1, 0, 1,
-0.500531, -1.434857, -4.87291, 0.254902, 1, 0, 1,
-0.4864612, 0.1672688, -0.8543983, 0.2470588, 1, 0, 1,
-0.4816447, 0.2677877, -0.2664936, 0.2431373, 1, 0, 1,
-0.4803818, -1.408859, -3.717165, 0.2352941, 1, 0, 1,
-0.4796703, -0.3337022, -2.95256, 0.2313726, 1, 0, 1,
-0.4781424, 1.104952, -0.2600655, 0.2235294, 1, 0, 1,
-0.4772957, 0.4488035, -0.1346307, 0.2196078, 1, 0, 1,
-0.4761594, -0.8033521, -1.293316, 0.2117647, 1, 0, 1,
-0.4743103, -0.3884282, -2.234442, 0.2078431, 1, 0, 1,
-0.4739721, -1.259203, -3.984754, 0.2, 1, 0, 1,
-0.4724561, 0.4910065, -1.974167, 0.1921569, 1, 0, 1,
-0.4717529, 0.470985, -1.921252, 0.1882353, 1, 0, 1,
-0.4683436, 0.7565658, 0.3389179, 0.1803922, 1, 0, 1,
-0.4680823, 0.3070693, -2.312347, 0.1764706, 1, 0, 1,
-0.4594675, -0.3368554, -1.65171, 0.1686275, 1, 0, 1,
-0.4588802, -1.199586, -4.793094, 0.1647059, 1, 0, 1,
-0.4579004, 1.035623, 0.6562445, 0.1568628, 1, 0, 1,
-0.4571826, -0.8923994, -2.270212, 0.1529412, 1, 0, 1,
-0.4562235, 0.9555744, -0.06100725, 0.145098, 1, 0, 1,
-0.4541422, 1.394631, 0.6927894, 0.1411765, 1, 0, 1,
-0.450013, 0.1567816, -1.49005, 0.1333333, 1, 0, 1,
-0.4459981, -0.08803559, -2.429404, 0.1294118, 1, 0, 1,
-0.4457247, -0.2351399, -2.273233, 0.1215686, 1, 0, 1,
-0.4427983, 0.01455098, -0.7637353, 0.1176471, 1, 0, 1,
-0.439167, -1.418507, -3.075357, 0.1098039, 1, 0, 1,
-0.4384021, -0.2453953, -1.594859, 0.1058824, 1, 0, 1,
-0.4360195, 1.856389, 1.326217, 0.09803922, 1, 0, 1,
-0.4280811, 0.1850923, -1.331135, 0.09019608, 1, 0, 1,
-0.425862, -0.4169858, -4.04202, 0.08627451, 1, 0, 1,
-0.4247885, -0.2901145, -2.488555, 0.07843138, 1, 0, 1,
-0.4246881, 0.2164902, -1.193351, 0.07450981, 1, 0, 1,
-0.4134996, -1.084222, -3.94448, 0.06666667, 1, 0, 1,
-0.4112531, -1.390973, -2.26937, 0.0627451, 1, 0, 1,
-0.4069082, 0.3814636, -0.5787584, 0.05490196, 1, 0, 1,
-0.4064262, 2.515112, 0.2020741, 0.05098039, 1, 0, 1,
-0.4050555, 1.703283, 0.4268698, 0.04313726, 1, 0, 1,
-0.4033649, 1.100943, -0.1650205, 0.03921569, 1, 0, 1,
-0.4030531, 1.523279, 1.284361, 0.03137255, 1, 0, 1,
-0.4002266, 0.9069192, 0.166619, 0.02745098, 1, 0, 1,
-0.3997477, 0.1572919, -0.3100255, 0.01960784, 1, 0, 1,
-0.3966521, -0.4717761, -0.5263197, 0.01568628, 1, 0, 1,
-0.3939548, -0.08862359, -2.988675, 0.007843138, 1, 0, 1,
-0.3903323, 0.8170215, 0.03560586, 0.003921569, 1, 0, 1,
-0.3843373, 2.898002, -1.576094, 0, 1, 0.003921569, 1,
-0.3819284, -0.4465625, -3.706241, 0, 1, 0.01176471, 1,
-0.3782085, 1.773919, -0.8135254, 0, 1, 0.01568628, 1,
-0.3666803, -0.1481381, -1.362013, 0, 1, 0.02352941, 1,
-0.366328, 0.8179133, 0.1242746, 0, 1, 0.02745098, 1,
-0.3643812, -0.1984503, -0.8475971, 0, 1, 0.03529412, 1,
-0.3641015, 1.677609, -0.1101706, 0, 1, 0.03921569, 1,
-0.3636963, 1.334553, -0.3977823, 0, 1, 0.04705882, 1,
-0.3599938, 0.01784841, -1.899301, 0, 1, 0.05098039, 1,
-0.3524761, 1.216162, -0.8622045, 0, 1, 0.05882353, 1,
-0.350483, 1.517286, -1.293902, 0, 1, 0.0627451, 1,
-0.3498808, -2.07918, -2.379965, 0, 1, 0.07058824, 1,
-0.3496151, -0.2239504, -2.033121, 0, 1, 0.07450981, 1,
-0.3493487, -2.256842, -3.813479, 0, 1, 0.08235294, 1,
-0.3492479, -0.2115841, -2.677839, 0, 1, 0.08627451, 1,
-0.3486514, -1.522681, -4.042404, 0, 1, 0.09411765, 1,
-0.3469108, -1.294751, -2.852288, 0, 1, 0.1019608, 1,
-0.3465707, 1.05686, -1.789486, 0, 1, 0.1058824, 1,
-0.3464867, 0.5484769, -1.597335, 0, 1, 0.1137255, 1,
-0.3428521, -0.1913793, -3.008738, 0, 1, 0.1176471, 1,
-0.3363446, -1.089389, -2.865331, 0, 1, 0.1254902, 1,
-0.3269641, -0.4735012, -2.295496, 0, 1, 0.1294118, 1,
-0.3255124, 0.9174542, -0.2173496, 0, 1, 0.1372549, 1,
-0.3178753, -0.7037391, -1.807055, 0, 1, 0.1411765, 1,
-0.3167984, -0.2646001, -2.4235, 0, 1, 0.1490196, 1,
-0.311055, -0.3151357, -1.795451, 0, 1, 0.1529412, 1,
-0.3061229, 0.3017933, -1.888784, 0, 1, 0.1607843, 1,
-0.3053154, 1.033045, -1.156913, 0, 1, 0.1647059, 1,
-0.3002141, -0.1868466, -1.475687, 0, 1, 0.172549, 1,
-0.300145, -1.063336, -2.386665, 0, 1, 0.1764706, 1,
-0.2990708, 0.93568, -0.4258287, 0, 1, 0.1843137, 1,
-0.2977989, -0.3298513, -5.022645, 0, 1, 0.1882353, 1,
-0.2967686, -0.3974007, -2.148974, 0, 1, 0.1960784, 1,
-0.2936643, -1.440572, -3.913276, 0, 1, 0.2039216, 1,
-0.2839123, 1.041772, -0.5974835, 0, 1, 0.2078431, 1,
-0.2833945, 1.187459, 1.735231, 0, 1, 0.2156863, 1,
-0.2820536, -0.3416966, -5.10648, 0, 1, 0.2196078, 1,
-0.2816367, 0.308261, -1.403389, 0, 1, 0.227451, 1,
-0.2812602, 2.016174, -0.7199036, 0, 1, 0.2313726, 1,
-0.2795692, -0.1538886, -2.327411, 0, 1, 0.2392157, 1,
-0.2735456, 0.2031496, 0.005557046, 0, 1, 0.2431373, 1,
-0.2722764, -2.749961, -3.883384, 0, 1, 0.2509804, 1,
-0.2684015, -0.5248182, -4.564743, 0, 1, 0.254902, 1,
-0.2678753, -1.195108, -3.495125, 0, 1, 0.2627451, 1,
-0.2658353, 1.751021, 0.2056322, 0, 1, 0.2666667, 1,
-0.2653341, 1.039156, -1.171909, 0, 1, 0.2745098, 1,
-0.2629329, 0.04881176, -2.414501, 0, 1, 0.2784314, 1,
-0.2612694, 0.05800141, -2.284889, 0, 1, 0.2862745, 1,
-0.2599481, -1.213062, -2.2485, 0, 1, 0.2901961, 1,
-0.2549453, 0.7301995, 0.01795404, 0, 1, 0.2980392, 1,
-0.2526528, -1.34508, -3.184716, 0, 1, 0.3058824, 1,
-0.2525835, -1.850379, -2.381989, 0, 1, 0.3098039, 1,
-0.2522582, -1.109912, -3.172995, 0, 1, 0.3176471, 1,
-0.2460937, -0.8484177, -4.059412, 0, 1, 0.3215686, 1,
-0.2427014, -3.758865, -3.016424, 0, 1, 0.3294118, 1,
-0.2402983, 0.6763927, -0.4289316, 0, 1, 0.3333333, 1,
-0.2337749, 0.001323594, -2.193198, 0, 1, 0.3411765, 1,
-0.2289374, -0.9196059, -2.00976, 0, 1, 0.345098, 1,
-0.2278584, -1.21733, -3.279172, 0, 1, 0.3529412, 1,
-0.2194876, -0.0164907, 0.3170039, 0, 1, 0.3568628, 1,
-0.2173417, 0.07541767, 0.1621429, 0, 1, 0.3647059, 1,
-0.2129582, -0.9161774, -1.586417, 0, 1, 0.3686275, 1,
-0.2124354, 0.7640476, -1.348753, 0, 1, 0.3764706, 1,
-0.210067, -0.2772206, -2.023121, 0, 1, 0.3803922, 1,
-0.206825, -0.4198703, -3.680037, 0, 1, 0.3882353, 1,
-0.2059692, -0.2611893, -1.714432, 0, 1, 0.3921569, 1,
-0.2054701, 0.6951937, 0.6878048, 0, 1, 0.4, 1,
-0.204227, 0.3757253, -0.4967688, 0, 1, 0.4078431, 1,
-0.2007009, 0.0004388345, -0.7447567, 0, 1, 0.4117647, 1,
-0.1997435, 0.5138516, -1.705719, 0, 1, 0.4196078, 1,
-0.1952875, -1.2372, -3.104424, 0, 1, 0.4235294, 1,
-0.1934958, 2.016698, 0.502934, 0, 1, 0.4313726, 1,
-0.192473, -1.242532, -1.372821, 0, 1, 0.4352941, 1,
-0.1902357, -0.9001391, -3.777416, 0, 1, 0.4431373, 1,
-0.1869689, -0.4259762, -2.889493, 0, 1, 0.4470588, 1,
-0.1818292, 0.3313076, -1.851722, 0, 1, 0.454902, 1,
-0.1743987, -0.3531157, -4.396039, 0, 1, 0.4588235, 1,
-0.1721585, -1.309371, -3.77388, 0, 1, 0.4666667, 1,
-0.1693715, -0.5546887, -2.993015, 0, 1, 0.4705882, 1,
-0.1677762, 0.153943, -2.633409, 0, 1, 0.4784314, 1,
-0.1655324, -0.4739575, -2.919484, 0, 1, 0.4823529, 1,
-0.1629612, 0.289073, -2.022229, 0, 1, 0.4901961, 1,
-0.1625443, 0.0702989, -1.313578, 0, 1, 0.4941176, 1,
-0.1524073, 0.9614565, 1.089501, 0, 1, 0.5019608, 1,
-0.1348912, -0.02066337, -2.760251, 0, 1, 0.509804, 1,
-0.1298147, -0.2264101, -1.991577, 0, 1, 0.5137255, 1,
-0.1268889, -2.698324, -2.049612, 0, 1, 0.5215687, 1,
-0.1265761, 0.05892209, -0.6380963, 0, 1, 0.5254902, 1,
-0.1208469, -1.208402, -3.288056, 0, 1, 0.5333334, 1,
-0.1193878, 0.4801624, -0.5429435, 0, 1, 0.5372549, 1,
-0.1185893, -1.6518, -1.988972, 0, 1, 0.5450981, 1,
-0.1167099, 1.444241, -0.5110236, 0, 1, 0.5490196, 1,
-0.1139603, -0.01857715, -1.253549, 0, 1, 0.5568628, 1,
-0.1117816, -0.9702935, -2.668789, 0, 1, 0.5607843, 1,
-0.1101103, 0.1980593, -1.52124, 0, 1, 0.5686275, 1,
-0.1065312, 0.5177017, 1.478952, 0, 1, 0.572549, 1,
-0.1060741, 1.847396, -1.073647, 0, 1, 0.5803922, 1,
-0.1021241, 0.06517048, 0.1445044, 0, 1, 0.5843138, 1,
-0.1000658, 1.247189, 1.638618, 0, 1, 0.5921569, 1,
-0.09981102, 0.1989823, 0.3767242, 0, 1, 0.5960785, 1,
-0.09750953, 0.2158888, 0.3746932, 0, 1, 0.6039216, 1,
-0.0946508, -0.7540361, -1.878345, 0, 1, 0.6117647, 1,
-0.09448709, -1.10416, -3.964067, 0, 1, 0.6156863, 1,
-0.094464, -0.500689, -3.116492, 0, 1, 0.6235294, 1,
-0.08894906, 0.2883476, -1.137687, 0, 1, 0.627451, 1,
-0.08870383, 0.154041, -1.383536, 0, 1, 0.6352941, 1,
-0.074533, 0.4066013, 0.6147142, 0, 1, 0.6392157, 1,
-0.07175685, -0.3864259, -3.443032, 0, 1, 0.6470588, 1,
-0.06770253, -2.67004, -4.695045, 0, 1, 0.6509804, 1,
-0.0660245, 0.7745117, -0.2071283, 0, 1, 0.6588235, 1,
-0.06557474, 0.09144513, -0.07322983, 0, 1, 0.6627451, 1,
-0.06549945, 1.398183, -1.81554, 0, 1, 0.6705883, 1,
-0.06492208, 1.872195, 3.479799, 0, 1, 0.6745098, 1,
-0.06470796, -0.0331294, -1.494272, 0, 1, 0.682353, 1,
-0.06450748, 0.5477441, 0.3077328, 0, 1, 0.6862745, 1,
-0.06419758, -1.143237, -1.062575, 0, 1, 0.6941177, 1,
-0.0630836, 0.448358, -0.6284844, 0, 1, 0.7019608, 1,
-0.05890669, 0.5694591, -1.713862, 0, 1, 0.7058824, 1,
-0.05861178, -1.324799, -3.326284, 0, 1, 0.7137255, 1,
-0.05744748, 1.64458, 0.5154045, 0, 1, 0.7176471, 1,
-0.05534779, -0.1767922, -3.665832, 0, 1, 0.7254902, 1,
-0.05509729, 0.4428148, 0.5519162, 0, 1, 0.7294118, 1,
-0.05474063, 0.3967984, -0.226498, 0, 1, 0.7372549, 1,
-0.05397676, -0.4265317, -2.314241, 0, 1, 0.7411765, 1,
-0.05310859, -0.3570106, -4.128816, 0, 1, 0.7490196, 1,
-0.04983803, 1.416743, -0.2665244, 0, 1, 0.7529412, 1,
-0.04432503, 0.6868389, -2.359096, 0, 1, 0.7607843, 1,
-0.04315097, 1.029818, -0.2800248, 0, 1, 0.7647059, 1,
-0.038589, -0.2933999, -3.520507, 0, 1, 0.772549, 1,
-0.0377365, -0.6034032, -4.300642, 0, 1, 0.7764706, 1,
-0.03699651, -2.248052, -4.072304, 0, 1, 0.7843137, 1,
-0.03349095, -2.029832, -1.73539, 0, 1, 0.7882353, 1,
-0.02818354, -0.08106294, -1.85764, 0, 1, 0.7960784, 1,
-0.0242008, -0.4183802, -4.213374, 0, 1, 0.8039216, 1,
-0.0227004, -1.196585, -3.955708, 0, 1, 0.8078431, 1,
-0.01962121, 0.3141959, 1.726496, 0, 1, 0.8156863, 1,
-0.01886605, -0.561904, -3.56829, 0, 1, 0.8196079, 1,
-0.01788628, 0.3680003, 1.900116, 0, 1, 0.827451, 1,
-0.0123774, -1.501544, -4.970133, 0, 1, 0.8313726, 1,
-0.009294349, -0.07332145, -2.597628, 0, 1, 0.8392157, 1,
-0.00044075, -1.797853, -2.76602, 0, 1, 0.8431373, 1,
0.002911961, -0.2879694, 4.100622, 0, 1, 0.8509804, 1,
0.008102566, 0.2474944, -0.5210152, 0, 1, 0.854902, 1,
0.01685808, -1.192637, 3.625555, 0, 1, 0.8627451, 1,
0.01765251, -1.459973, 2.419893, 0, 1, 0.8666667, 1,
0.02203272, 0.9056764, -0.4969515, 0, 1, 0.8745098, 1,
0.02555584, -0.6197589, 3.626086, 0, 1, 0.8784314, 1,
0.02852782, -0.6529953, 3.948899, 0, 1, 0.8862745, 1,
0.02900212, -2.835662, 2.983165, 0, 1, 0.8901961, 1,
0.03012513, 0.181187, -2.196205, 0, 1, 0.8980392, 1,
0.03629576, 1.315421, 1.779203, 0, 1, 0.9058824, 1,
0.03633623, -0.007592383, 0.7942641, 0, 1, 0.9098039, 1,
0.04347491, 0.4875828, 0.7678367, 0, 1, 0.9176471, 1,
0.04437825, -0.1835517, 3.085151, 0, 1, 0.9215686, 1,
0.04622077, -0.2923591, 2.924657, 0, 1, 0.9294118, 1,
0.04654565, -0.4331393, 2.045375, 0, 1, 0.9333333, 1,
0.0490366, -1.722782, 2.678266, 0, 1, 0.9411765, 1,
0.05235068, 1.761151, -0.5555549, 0, 1, 0.945098, 1,
0.05401913, 0.9842349, -0.3218793, 0, 1, 0.9529412, 1,
0.05512174, 0.6139009, 0.7502329, 0, 1, 0.9568627, 1,
0.05916106, 1.676906, -0.8200476, 0, 1, 0.9647059, 1,
0.06029185, -0.1385654, 3.623983, 0, 1, 0.9686275, 1,
0.06081059, 0.7985235, 0.2059608, 0, 1, 0.9764706, 1,
0.06383264, 0.9456687, 1.566251, 0, 1, 0.9803922, 1,
0.07084309, 0.5388667, 0.1855783, 0, 1, 0.9882353, 1,
0.07386785, -0.0380112, 3.92682, 0, 1, 0.9921569, 1,
0.07541174, 0.02394574, 2.208255, 0, 1, 1, 1,
0.07547697, 0.4680865, 1.073173, 0, 0.9921569, 1, 1,
0.07750815, -0.2574607, 2.888865, 0, 0.9882353, 1, 1,
0.07889846, -1.584944, 1.960884, 0, 0.9803922, 1, 1,
0.08116647, 0.6411917, 0.3085076, 0, 0.9764706, 1, 1,
0.0857263, -0.6148277, 1.806755, 0, 0.9686275, 1, 1,
0.08612701, 0.08264338, -0.7658094, 0, 0.9647059, 1, 1,
0.08778939, 0.1895783, 1.239661, 0, 0.9568627, 1, 1,
0.0879164, -0.05570194, 1.994091, 0, 0.9529412, 1, 1,
0.08843854, -0.457532, 3.368064, 0, 0.945098, 1, 1,
0.08855571, 0.6925763, 1.41534, 0, 0.9411765, 1, 1,
0.08938456, -0.3506603, 2.341876, 0, 0.9333333, 1, 1,
0.09096309, -0.4695492, 3.372773, 0, 0.9294118, 1, 1,
0.09142267, -0.3644438, 2.583229, 0, 0.9215686, 1, 1,
0.09142838, 0.1059444, -0.007129279, 0, 0.9176471, 1, 1,
0.09156603, -0.6121411, 3.249712, 0, 0.9098039, 1, 1,
0.09212362, -0.09461805, 1.169106, 0, 0.9058824, 1, 1,
0.09397868, 1.102053, 0.02098433, 0, 0.8980392, 1, 1,
0.09630875, 0.07012131, -0.08927704, 0, 0.8901961, 1, 1,
0.1028824, 0.5547226, 0.4825053, 0, 0.8862745, 1, 1,
0.1042635, -0.7672629, 2.887831, 0, 0.8784314, 1, 1,
0.1098472, -1.360956, 1.638601, 0, 0.8745098, 1, 1,
0.1128229, 0.08488753, 0.2390088, 0, 0.8666667, 1, 1,
0.1140766, -0.4913779, 3.538815, 0, 0.8627451, 1, 1,
0.118917, 0.02377724, 1.951364, 0, 0.854902, 1, 1,
0.1207212, 0.2240678, -0.3399945, 0, 0.8509804, 1, 1,
0.1286021, -0.8887912, 3.362864, 0, 0.8431373, 1, 1,
0.1287722, -0.3256944, 2.029551, 0, 0.8392157, 1, 1,
0.1310929, 0.3339606, 0.3000786, 0, 0.8313726, 1, 1,
0.1327075, -0.2591838, 2.288337, 0, 0.827451, 1, 1,
0.1372291, 1.078356, 0.1216904, 0, 0.8196079, 1, 1,
0.1374288, -0.8218185, 3.485792, 0, 0.8156863, 1, 1,
0.1376939, -0.09175134, 1.675091, 0, 0.8078431, 1, 1,
0.1386925, -1.75677, 3.979765, 0, 0.8039216, 1, 1,
0.1478548, 1.264351, 0.897241, 0, 0.7960784, 1, 1,
0.1489012, 1.692639, -0.03502247, 0, 0.7882353, 1, 1,
0.1498915, 0.2483118, 0.2343815, 0, 0.7843137, 1, 1,
0.1520426, -1.870145, 2.855634, 0, 0.7764706, 1, 1,
0.15294, -0.3947721, 2.139632, 0, 0.772549, 1, 1,
0.1537033, -0.869047, 2.484986, 0, 0.7647059, 1, 1,
0.1599358, -1.105855, 2.511782, 0, 0.7607843, 1, 1,
0.1602118, 0.3839965, 0.8962008, 0, 0.7529412, 1, 1,
0.1607728, -0.1313361, 2.333828, 0, 0.7490196, 1, 1,
0.1652968, -1.459373, 4.293783, 0, 0.7411765, 1, 1,
0.1655619, -0.4472783, 3.120917, 0, 0.7372549, 1, 1,
0.1678449, -0.4726457, 1.853891, 0, 0.7294118, 1, 1,
0.1684374, 1.102664, 0.01507095, 0, 0.7254902, 1, 1,
0.1717595, -0.3227752, 2.787661, 0, 0.7176471, 1, 1,
0.1781671, -0.2527726, 1.500239, 0, 0.7137255, 1, 1,
0.1801524, 1.725453, 2.28556, 0, 0.7058824, 1, 1,
0.1848586, -0.02937562, 1.89916, 0, 0.6980392, 1, 1,
0.1892379, -1.367017, 2.795893, 0, 0.6941177, 1, 1,
0.1893085, 1.046952, -1.269896, 0, 0.6862745, 1, 1,
0.1904366, -0.8523834, 2.51252, 0, 0.682353, 1, 1,
0.190769, 0.6671648, 0.31265, 0, 0.6745098, 1, 1,
0.1913943, -0.599484, 1.919176, 0, 0.6705883, 1, 1,
0.1918774, -1.871569, 4.319683, 0, 0.6627451, 1, 1,
0.1939398, -0.390507, 1.300834, 0, 0.6588235, 1, 1,
0.1953983, 0.9033333, 1.828418, 0, 0.6509804, 1, 1,
0.2002794, 1.150809, 0.7644932, 0, 0.6470588, 1, 1,
0.200645, 0.6302372, -0.9973696, 0, 0.6392157, 1, 1,
0.2013366, 0.9098254, 0.009273518, 0, 0.6352941, 1, 1,
0.2029431, 0.3060279, 1.333565, 0, 0.627451, 1, 1,
0.2075234, 1.031801, 1.759004, 0, 0.6235294, 1, 1,
0.209458, -1.541263, 2.760867, 0, 0.6156863, 1, 1,
0.2094993, 0.2641128, 1.191525, 0, 0.6117647, 1, 1,
0.2106557, -0.2313785, 2.679147, 0, 0.6039216, 1, 1,
0.2108896, -0.5249487, 4.159863, 0, 0.5960785, 1, 1,
0.2133385, -0.6229498, 2.373707, 0, 0.5921569, 1, 1,
0.2182302, -0.6819941, 1.890903, 0, 0.5843138, 1, 1,
0.219339, 1.449364, -0.3607288, 0, 0.5803922, 1, 1,
0.2206024, -0.277308, 3.887465, 0, 0.572549, 1, 1,
0.2315393, -1.365803, 4.34259, 0, 0.5686275, 1, 1,
0.2350287, 1.483896, -0.6150035, 0, 0.5607843, 1, 1,
0.2368844, 0.2703354, 2.106901, 0, 0.5568628, 1, 1,
0.2455895, 0.2450667, 0.2054283, 0, 0.5490196, 1, 1,
0.2456127, -1.05515, 2.342347, 0, 0.5450981, 1, 1,
0.2472248, -1.092179, 3.484072, 0, 0.5372549, 1, 1,
0.2499675, -0.1512164, 2.022052, 0, 0.5333334, 1, 1,
0.2508273, 0.3527703, 0.1287112, 0, 0.5254902, 1, 1,
0.257666, -0.6294286, 3.943201, 0, 0.5215687, 1, 1,
0.2581848, -1.865764, 2.425204, 0, 0.5137255, 1, 1,
0.2610677, 0.6007659, 1.87472, 0, 0.509804, 1, 1,
0.2629358, 1.702344, -0.7088774, 0, 0.5019608, 1, 1,
0.2639797, -0.009945479, 0.8822172, 0, 0.4941176, 1, 1,
0.2654725, 0.3104967, 0.9078351, 0, 0.4901961, 1, 1,
0.2658454, 2.515996, 1.09966, 0, 0.4823529, 1, 1,
0.2723337, 0.2889707, 1.052356, 0, 0.4784314, 1, 1,
0.2725708, 0.2113912, 0.8399365, 0, 0.4705882, 1, 1,
0.2748834, -0.3866594, 4.333055, 0, 0.4666667, 1, 1,
0.2751129, 1.347679, 0.136185, 0, 0.4588235, 1, 1,
0.2784544, -1.296572, 3.68033, 0, 0.454902, 1, 1,
0.2842339, -0.8546279, 2.392677, 0, 0.4470588, 1, 1,
0.2858138, -1.931419, 4.222924, 0, 0.4431373, 1, 1,
0.2897577, 0.373907, 1.154455, 0, 0.4352941, 1, 1,
0.2908301, -1.019117, 2.326646, 0, 0.4313726, 1, 1,
0.2911834, -0.06319844, 1.300839, 0, 0.4235294, 1, 1,
0.2932485, -0.7746043, 4.51445, 0, 0.4196078, 1, 1,
0.2947937, -1.443781, 3.54108, 0, 0.4117647, 1, 1,
0.2988379, 0.596957, -0.2383684, 0, 0.4078431, 1, 1,
0.2990341, 0.7349984, -1.119991, 0, 0.4, 1, 1,
0.3016744, -1.001471, 2.712319, 0, 0.3921569, 1, 1,
0.3054751, 0.4974545, 1.942119, 0, 0.3882353, 1, 1,
0.3081368, 1.776991, 0.03883488, 0, 0.3803922, 1, 1,
0.3113915, 0.2117843, 1.070927, 0, 0.3764706, 1, 1,
0.3114245, -0.7668692, 2.183652, 0, 0.3686275, 1, 1,
0.3116769, -0.9350681, 3.47609, 0, 0.3647059, 1, 1,
0.313221, -0.1757542, 0.7556449, 0, 0.3568628, 1, 1,
0.3141795, -0.8517226, 3.293967, 0, 0.3529412, 1, 1,
0.3182573, 2.038778, -0.1257683, 0, 0.345098, 1, 1,
0.3208462, 0.320896, 0.7007356, 0, 0.3411765, 1, 1,
0.3216213, -0.2563489, 1.928834, 0, 0.3333333, 1, 1,
0.3237126, 0.3772494, 1.3442, 0, 0.3294118, 1, 1,
0.3263697, -1.192068, 3.915399, 0, 0.3215686, 1, 1,
0.3332097, 0.5534671, 0.4917343, 0, 0.3176471, 1, 1,
0.3336419, 0.2594135, 1.299329, 0, 0.3098039, 1, 1,
0.3358211, -0.7150635, 2.18545, 0, 0.3058824, 1, 1,
0.3372548, -1.014618, 4.336364, 0, 0.2980392, 1, 1,
0.3396138, -0.1081449, 2.04592, 0, 0.2901961, 1, 1,
0.3452334, -0.006698059, 0.9556031, 0, 0.2862745, 1, 1,
0.3456185, -0.1478321, 2.329225, 0, 0.2784314, 1, 1,
0.3469825, 0.4887332, 0.1234412, 0, 0.2745098, 1, 1,
0.3482327, 1.197123, 0.4557258, 0, 0.2666667, 1, 1,
0.3504455, 0.8867735, 0.105617, 0, 0.2627451, 1, 1,
0.3513493, -0.01124336, 1.607394, 0, 0.254902, 1, 1,
0.3532623, 0.07108825, 1.606475, 0, 0.2509804, 1, 1,
0.3537453, -0.6513774, 2.257268, 0, 0.2431373, 1, 1,
0.357701, -0.4938846, 3.136479, 0, 0.2392157, 1, 1,
0.3596665, -0.39732, 3.806705, 0, 0.2313726, 1, 1,
0.3636178, -0.3973271, 2.592082, 0, 0.227451, 1, 1,
0.3636181, -0.7045618, 2.743608, 0, 0.2196078, 1, 1,
0.3651243, -0.2203465, 2.135893, 0, 0.2156863, 1, 1,
0.3661561, -1.638516, 3.465542, 0, 0.2078431, 1, 1,
0.3676374, -0.02537925, 2.798359, 0, 0.2039216, 1, 1,
0.3699663, 0.2623832, 2.215341, 0, 0.1960784, 1, 1,
0.3709684, 1.370206, -0.6131334, 0, 0.1882353, 1, 1,
0.3773341, -1.098646, 1.889043, 0, 0.1843137, 1, 1,
0.3784336, -1.135176, 2.765549, 0, 0.1764706, 1, 1,
0.3820113, 0.2592716, 2.872761, 0, 0.172549, 1, 1,
0.3889264, -0.163807, 2.660677, 0, 0.1647059, 1, 1,
0.3914239, 0.6950345, 1.326507, 0, 0.1607843, 1, 1,
0.3948672, -0.3984696, 0.433333, 0, 0.1529412, 1, 1,
0.3952841, -0.1587376, 2.071618, 0, 0.1490196, 1, 1,
0.3953437, -0.5668898, 1.636616, 0, 0.1411765, 1, 1,
0.3961598, 1.483273, -0.4057321, 0, 0.1372549, 1, 1,
0.4004895, -0.5191101, 3.236293, 0, 0.1294118, 1, 1,
0.4019333, -1.467012, 3.555488, 0, 0.1254902, 1, 1,
0.4072003, -0.4796876, 1.411088, 0, 0.1176471, 1, 1,
0.4094401, 0.6250441, 1.947537, 0, 0.1137255, 1, 1,
0.4099473, -0.3698582, 2.107832, 0, 0.1058824, 1, 1,
0.4112216, 0.1001559, 1.016198, 0, 0.09803922, 1, 1,
0.4168357, 0.1436027, 1.724095, 0, 0.09411765, 1, 1,
0.4190713, 0.1584383, 1.430558, 0, 0.08627451, 1, 1,
0.4273763, 0.9527916, -0.09552189, 0, 0.08235294, 1, 1,
0.4274246, 0.3363111, 1.821165, 0, 0.07450981, 1, 1,
0.4289417, -0.2828229, 1.89732, 0, 0.07058824, 1, 1,
0.4316781, -0.6303519, 3.010713, 0, 0.0627451, 1, 1,
0.4364767, 0.2595955, 1.974594, 0, 0.05882353, 1, 1,
0.4423739, 1.347113, 1.339672, 0, 0.05098039, 1, 1,
0.4462908, -2.20823, 2.785906, 0, 0.04705882, 1, 1,
0.4465002, 1.969763, -0.8401551, 0, 0.03921569, 1, 1,
0.4539219, -0.2068267, 1.448169, 0, 0.03529412, 1, 1,
0.4561107, 1.070896, -1.095922, 0, 0.02745098, 1, 1,
0.456587, 0.6276828, -0.375784, 0, 0.02352941, 1, 1,
0.4595576, 1.39704, 1.479235, 0, 0.01568628, 1, 1,
0.4650554, 0.5499391, 0.5443226, 0, 0.01176471, 1, 1,
0.469823, -0.3242013, 2.451791, 0, 0.003921569, 1, 1,
0.4712459, 1.564151, 0.5975354, 0.003921569, 0, 1, 1,
0.4737634, -0.3581016, 1.770176, 0.007843138, 0, 1, 1,
0.4738733, -0.07690722, 1.358855, 0.01568628, 0, 1, 1,
0.4755389, 0.6126232, -1.73832, 0.01960784, 0, 1, 1,
0.4789947, -1.665838, 1.11734, 0.02745098, 0, 1, 1,
0.481451, 0.5170721, 0.05187533, 0.03137255, 0, 1, 1,
0.4835855, 1.109148, 1.734174, 0.03921569, 0, 1, 1,
0.4848526, 1.390157, -1.731486, 0.04313726, 0, 1, 1,
0.4920836, 2.470421, 1.083563, 0.05098039, 0, 1, 1,
0.4943485, 1.912774, 1.993749, 0.05490196, 0, 1, 1,
0.501801, -0.1996785, 1.383226, 0.0627451, 0, 1, 1,
0.5024378, 0.6669822, -0.4383404, 0.06666667, 0, 1, 1,
0.5033674, -0.9911492, 3.099, 0.07450981, 0, 1, 1,
0.5044191, 0.5321958, -0.1116049, 0.07843138, 0, 1, 1,
0.5057633, 0.4528806, -0.5291454, 0.08627451, 0, 1, 1,
0.5096982, -0.3414636, 1.994111, 0.09019608, 0, 1, 1,
0.5120303, 0.5854357, 1.37174, 0.09803922, 0, 1, 1,
0.5127084, 0.5352263, 0.2934222, 0.1058824, 0, 1, 1,
0.517898, -0.1628322, 2.527173, 0.1098039, 0, 1, 1,
0.5233028, 0.838683, 0.1344492, 0.1176471, 0, 1, 1,
0.5257257, -0.632144, 2.430563, 0.1215686, 0, 1, 1,
0.5375587, -0.02152301, 2.808363, 0.1294118, 0, 1, 1,
0.5392457, 0.5349354, 2.040483, 0.1333333, 0, 1, 1,
0.541779, -0.2361828, 1.324803, 0.1411765, 0, 1, 1,
0.5428309, -0.5565897, 2.314344, 0.145098, 0, 1, 1,
0.5429765, -1.388041, 3.719849, 0.1529412, 0, 1, 1,
0.5434021, 1.638265, -0.1498595, 0.1568628, 0, 1, 1,
0.5434361, 0.7768451, -0.1024204, 0.1647059, 0, 1, 1,
0.5464731, 0.849814, 0.8605543, 0.1686275, 0, 1, 1,
0.5467437, -1.556941, 2.659692, 0.1764706, 0, 1, 1,
0.551395, 1.544811, -2.221013, 0.1803922, 0, 1, 1,
0.5514984, -0.2009509, 1.648225, 0.1882353, 0, 1, 1,
0.5578535, 0.8746454, 0.7317916, 0.1921569, 0, 1, 1,
0.5619338, 0.5543327, -0.416238, 0.2, 0, 1, 1,
0.5689653, 0.06158904, -0.3017404, 0.2078431, 0, 1, 1,
0.5697098, 0.01976154, 2.286974, 0.2117647, 0, 1, 1,
0.569793, 0.6543378, -0.5118113, 0.2196078, 0, 1, 1,
0.5702693, 1.051777, -1.149209, 0.2235294, 0, 1, 1,
0.5733388, -0.6293088, 2.876528, 0.2313726, 0, 1, 1,
0.575548, 1.391068, -0.5906073, 0.2352941, 0, 1, 1,
0.5824139, 1.055273, 1.459566, 0.2431373, 0, 1, 1,
0.5851631, -0.2852238, 3.893666, 0.2470588, 0, 1, 1,
0.5879006, -1.641198, 3.916121, 0.254902, 0, 1, 1,
0.5917482, 0.8026742, 0.6063373, 0.2588235, 0, 1, 1,
0.5938883, -0.9892771, 3.407256, 0.2666667, 0, 1, 1,
0.5978436, -0.4981624, 3.67647, 0.2705882, 0, 1, 1,
0.6009944, 0.2403611, 1.536474, 0.2784314, 0, 1, 1,
0.6023551, -0.7541261, 3.001399, 0.282353, 0, 1, 1,
0.6032571, -0.08915246, 2.299228, 0.2901961, 0, 1, 1,
0.6089004, -0.1391037, 1.629506, 0.2941177, 0, 1, 1,
0.609054, -0.8096704, 2.555378, 0.3019608, 0, 1, 1,
0.6116889, -0.7102141, 1.877356, 0.3098039, 0, 1, 1,
0.6143116, 1.246968, -0.1530027, 0.3137255, 0, 1, 1,
0.6165219, 0.7309985, -0.4133948, 0.3215686, 0, 1, 1,
0.6171495, -0.1434992, 0.8136993, 0.3254902, 0, 1, 1,
0.6175143, 1.090545, 1.84913, 0.3333333, 0, 1, 1,
0.6274366, 0.9467002, 1.097862, 0.3372549, 0, 1, 1,
0.6354159, -0.6656094, 1.91006, 0.345098, 0, 1, 1,
0.637495, 1.023146, 1.281455, 0.3490196, 0, 1, 1,
0.6383814, -0.1569303, 1.604258, 0.3568628, 0, 1, 1,
0.6417553, 0.03782383, 1.243688, 0.3607843, 0, 1, 1,
0.643042, 0.1905974, 0.8076836, 0.3686275, 0, 1, 1,
0.6437767, -0.7597827, 3.932464, 0.372549, 0, 1, 1,
0.647304, 1.357685, 0.8044294, 0.3803922, 0, 1, 1,
0.6490576, -0.7905052, 1.957542, 0.3843137, 0, 1, 1,
0.649904, 0.4788193, 1.06324, 0.3921569, 0, 1, 1,
0.6515629, 0.2394195, 1.93847, 0.3960784, 0, 1, 1,
0.6536986, 1.071576, 1.707537, 0.4039216, 0, 1, 1,
0.6561413, 0.2822924, 0.8650287, 0.4117647, 0, 1, 1,
0.662257, 0.357598, 0.7256344, 0.4156863, 0, 1, 1,
0.6651224, -1.465303, 3.715339, 0.4235294, 0, 1, 1,
0.6678433, 0.01236134, 2.599248, 0.427451, 0, 1, 1,
0.6754618, 0.5840483, 1.637276, 0.4352941, 0, 1, 1,
0.6822234, 0.2901675, 0.1019439, 0.4392157, 0, 1, 1,
0.6839069, 1.019603, 1.867855, 0.4470588, 0, 1, 1,
0.6841258, -0.6131092, 1.916362, 0.4509804, 0, 1, 1,
0.6851501, 0.3181515, 2.157847, 0.4588235, 0, 1, 1,
0.6871489, 0.4035893, 2.416801, 0.4627451, 0, 1, 1,
0.6935601, 0.1858541, 2.877863, 0.4705882, 0, 1, 1,
0.6986392, 0.3068581, 2.064308, 0.4745098, 0, 1, 1,
0.7025645, -0.128559, 0.8038516, 0.4823529, 0, 1, 1,
0.7029821, -1.187913, 3.535471, 0.4862745, 0, 1, 1,
0.7036264, -0.7235757, 1.529433, 0.4941176, 0, 1, 1,
0.7071499, -1.793707, 2.894597, 0.5019608, 0, 1, 1,
0.7073852, 0.5071967, -0.5646425, 0.5058824, 0, 1, 1,
0.7094762, 0.8263918, -0.09125456, 0.5137255, 0, 1, 1,
0.7095781, 1.103674, 0.4141006, 0.5176471, 0, 1, 1,
0.7173339, 1.477258, -0.4732187, 0.5254902, 0, 1, 1,
0.7176197, 1.16882, 0.7205793, 0.5294118, 0, 1, 1,
0.7185057, -1.133877, 2.209652, 0.5372549, 0, 1, 1,
0.7191957, 0.3147194, 0.04969739, 0.5411765, 0, 1, 1,
0.7239133, 1.29367, -0.02969471, 0.5490196, 0, 1, 1,
0.7252886, 0.137673, 0.635466, 0.5529412, 0, 1, 1,
0.7261082, 1.138111, -0.444612, 0.5607843, 0, 1, 1,
0.7264721, -0.1181654, 1.223849, 0.5647059, 0, 1, 1,
0.7349513, -0.3160018, 0.2482884, 0.572549, 0, 1, 1,
0.7365826, 1.129575, 1.79945, 0.5764706, 0, 1, 1,
0.7418923, 1.840362, 0.37615, 0.5843138, 0, 1, 1,
0.742129, 1.831997, 1.868808, 0.5882353, 0, 1, 1,
0.7435235, 2.04125, 0.1102976, 0.5960785, 0, 1, 1,
0.7448934, -0.6415481, 3.485946, 0.6039216, 0, 1, 1,
0.7529629, 1.192396, 0.4268256, 0.6078432, 0, 1, 1,
0.7551156, 0.02076144, 2.13273, 0.6156863, 0, 1, 1,
0.7581463, -1.065639, 2.13893, 0.6196079, 0, 1, 1,
0.7591673, 0.1322084, 0.8695564, 0.627451, 0, 1, 1,
0.7633746, 0.8797835, 1.034135, 0.6313726, 0, 1, 1,
0.7654223, 1.778128, 1.441697, 0.6392157, 0, 1, 1,
0.7657067, 0.6064441, 0.5604342, 0.6431373, 0, 1, 1,
0.7661667, -0.1003843, 0.781943, 0.6509804, 0, 1, 1,
0.7668852, -0.4556181, 2.522272, 0.654902, 0, 1, 1,
0.7702971, -1.60237, 2.008448, 0.6627451, 0, 1, 1,
0.77188, -1.779265, 1.848363, 0.6666667, 0, 1, 1,
0.7846153, 1.092921, 0.7112539, 0.6745098, 0, 1, 1,
0.7853935, 0.8641486, -1.759657, 0.6784314, 0, 1, 1,
0.792518, 1.213976, 2.350137, 0.6862745, 0, 1, 1,
0.7945474, -0.6881493, 1.038675, 0.6901961, 0, 1, 1,
0.7957128, 1.950198, -0.3540705, 0.6980392, 0, 1, 1,
0.7985463, -2.306864, 0.7939106, 0.7058824, 0, 1, 1,
0.7989689, 1.419508, -0.1714079, 0.7098039, 0, 1, 1,
0.8029353, -0.736146, 2.341546, 0.7176471, 0, 1, 1,
0.8123891, 0.9056667, 1.584561, 0.7215686, 0, 1, 1,
0.8145494, 1.244471, 1.247547, 0.7294118, 0, 1, 1,
0.8156978, -2.027581, 2.322011, 0.7333333, 0, 1, 1,
0.8159873, 1.429041, 1.21317, 0.7411765, 0, 1, 1,
0.8213876, 0.4996586, 1.362968, 0.7450981, 0, 1, 1,
0.8224822, 0.5933732, 0.4894839, 0.7529412, 0, 1, 1,
0.8253844, -1.958908, 2.739902, 0.7568628, 0, 1, 1,
0.8284427, 0.5005586, 2.994338, 0.7647059, 0, 1, 1,
0.8297578, 0.9246499, 0.5250618, 0.7686275, 0, 1, 1,
0.8367691, -0.5309442, 3.84611, 0.7764706, 0, 1, 1,
0.8368041, -0.03101384, 2.063813, 0.7803922, 0, 1, 1,
0.8445773, 0.4183411, 1.685167, 0.7882353, 0, 1, 1,
0.8458939, -1.023317, 3.239468, 0.7921569, 0, 1, 1,
0.850017, -0.7831697, 3.276202, 0.8, 0, 1, 1,
0.8533354, 0.9054437, 1.383845, 0.8078431, 0, 1, 1,
0.855225, 1.323949, 0.2811701, 0.8117647, 0, 1, 1,
0.8552424, 0.1809375, 0.267469, 0.8196079, 0, 1, 1,
0.8564475, -0.9277447, 2.432253, 0.8235294, 0, 1, 1,
0.857163, -0.1797433, 2.233169, 0.8313726, 0, 1, 1,
0.858771, 0.1197074, 0.7206895, 0.8352941, 0, 1, 1,
0.8605011, 0.1717791, 2.340792, 0.8431373, 0, 1, 1,
0.8624853, 0.520773, -0.4338205, 0.8470588, 0, 1, 1,
0.8650485, 1.403813, -1.386334, 0.854902, 0, 1, 1,
0.868622, -2.218907, 3.986329, 0.8588235, 0, 1, 1,
0.8711683, -0.9792518, 1.517603, 0.8666667, 0, 1, 1,
0.8756982, -0.6397092, 0.8173084, 0.8705882, 0, 1, 1,
0.8772261, 0.4362454, -0.06720381, 0.8784314, 0, 1, 1,
0.8822244, -2.219686, 3.352908, 0.8823529, 0, 1, 1,
0.8822837, 0.1412573, 0.9083719, 0.8901961, 0, 1, 1,
0.8897905, 0.6044836, 1.968183, 0.8941177, 0, 1, 1,
0.8898388, 1.428144, 0.6823606, 0.9019608, 0, 1, 1,
0.8959217, -1.046802, 1.705559, 0.9098039, 0, 1, 1,
0.8972436, 1.402977, -1.007509, 0.9137255, 0, 1, 1,
0.898994, 1.070875, -1.325664, 0.9215686, 0, 1, 1,
0.9018038, -0.2425987, 2.56008, 0.9254902, 0, 1, 1,
0.9018341, 0.1149612, 1.145347, 0.9333333, 0, 1, 1,
0.9080542, -0.6029856, 2.197288, 0.9372549, 0, 1, 1,
0.9083243, 0.08752758, 1.08986, 0.945098, 0, 1, 1,
0.9089297, -1.474262, 3.357753, 0.9490196, 0, 1, 1,
0.9112933, -2.7076, 2.535393, 0.9568627, 0, 1, 1,
0.9146572, 0.1657619, 1.648604, 0.9607843, 0, 1, 1,
0.915728, 1.799661, 0.4034148, 0.9686275, 0, 1, 1,
0.9188687, -0.1636726, 2.106864, 0.972549, 0, 1, 1,
0.9189668, -0.3530287, 2.183856, 0.9803922, 0, 1, 1,
0.9229049, -1.584473, 2.727197, 0.9843137, 0, 1, 1,
0.9258546, -0.8350936, 3.812982, 0.9921569, 0, 1, 1,
0.9262375, -1.140858, 4.113779, 0.9960784, 0, 1, 1,
0.9301466, 2.469752, 0.5104112, 1, 0, 0.9960784, 1,
0.9316705, -0.452291, 3.250993, 1, 0, 0.9882353, 1,
0.9397717, -1.253657, 3.363189, 1, 0, 0.9843137, 1,
0.9402605, -0.8239435, 2.106771, 1, 0, 0.9764706, 1,
0.9407603, 0.7052046, 1.565876, 1, 0, 0.972549, 1,
0.9427752, 0.7942622, 2.396662, 1, 0, 0.9647059, 1,
0.9446355, 0.6179594, 3.568428, 1, 0, 0.9607843, 1,
0.9490672, 0.01113346, 2.256096, 1, 0, 0.9529412, 1,
0.9512337, -0.6612651, 3.121859, 1, 0, 0.9490196, 1,
0.9573181, -0.2766397, 3.470259, 1, 0, 0.9411765, 1,
0.9593694, 0.8319946, 1.632541, 1, 0, 0.9372549, 1,
0.9599088, -0.1374891, 2.671005, 1, 0, 0.9294118, 1,
0.9611515, -1.136762, 2.91979, 1, 0, 0.9254902, 1,
0.9633981, 0.8357574, 1.836754, 1, 0, 0.9176471, 1,
0.9739606, 0.3733211, 1.710781, 1, 0, 0.9137255, 1,
0.9837365, -0.8595123, 1.788375, 1, 0, 0.9058824, 1,
0.9860843, 0.98698, 1.22312, 1, 0, 0.9019608, 1,
0.9872454, -0.02467724, 1.021509, 1, 0, 0.8941177, 1,
0.9878592, 0.1130397, 0.3769052, 1, 0, 0.8862745, 1,
0.992467, -0.1944477, 3.670007, 1, 0, 0.8823529, 1,
0.9944471, -0.07234583, 2.730083, 1, 0, 0.8745098, 1,
1.00677, 1.142305, 1.931978, 1, 0, 0.8705882, 1,
1.016925, 1.422677, 1.898428, 1, 0, 0.8627451, 1,
1.035988, 0.8645674, 2.421628, 1, 0, 0.8588235, 1,
1.038411, -0.3693783, 2.446229, 1, 0, 0.8509804, 1,
1.051703, 0.5297681, 0.9875721, 1, 0, 0.8470588, 1,
1.052218, 1.252844, -1.245045, 1, 0, 0.8392157, 1,
1.06048, -0.7689115, 2.070947, 1, 0, 0.8352941, 1,
1.074105, -2.44255, 4.02829, 1, 0, 0.827451, 1,
1.089828, 2.558623, 2.527538, 1, 0, 0.8235294, 1,
1.092577, -1.241941, 2.832899, 1, 0, 0.8156863, 1,
1.097456, -0.2133922, 2.876738, 1, 0, 0.8117647, 1,
1.101102, -0.6162016, 1.388695, 1, 0, 0.8039216, 1,
1.10438, 1.323008, 1.759145, 1, 0, 0.7960784, 1,
1.107415, 0.5777506, 0.2586886, 1, 0, 0.7921569, 1,
1.109224, 1.230293, 2.124661, 1, 0, 0.7843137, 1,
1.109439, 1.408672, 0.4609328, 1, 0, 0.7803922, 1,
1.110849, -0.8548381, 1.887855, 1, 0, 0.772549, 1,
1.123887, 1.432897, 2.256689, 1, 0, 0.7686275, 1,
1.125978, 0.6915442, 0.8170921, 1, 0, 0.7607843, 1,
1.138292, 1.177579, 0.3899227, 1, 0, 0.7568628, 1,
1.138548, 2.215031, 2.010274, 1, 0, 0.7490196, 1,
1.140559, 0.02534044, 2.484212, 1, 0, 0.7450981, 1,
1.141929, -0.2447305, 2.015668, 1, 0, 0.7372549, 1,
1.14212, -2.452343, 3.124905, 1, 0, 0.7333333, 1,
1.147881, -0.3775782, -0.1530289, 1, 0, 0.7254902, 1,
1.148793, -0.7105789, 1.418207, 1, 0, 0.7215686, 1,
1.164277, 0.657326, 1.676689, 1, 0, 0.7137255, 1,
1.16433, 0.5687105, 1.966236, 1, 0, 0.7098039, 1,
1.168982, 1.124688, 0.5717964, 1, 0, 0.7019608, 1,
1.169584, 1.083198, 0.1433634, 1, 0, 0.6941177, 1,
1.190104, -0.8847659, 3.825803, 1, 0, 0.6901961, 1,
1.197077, -1.204763, 2.819766, 1, 0, 0.682353, 1,
1.199028, -1.15452, 1.303152, 1, 0, 0.6784314, 1,
1.202936, 1.597974, 1.263198, 1, 0, 0.6705883, 1,
1.217027, -0.5627207, 1.558338, 1, 0, 0.6666667, 1,
1.218035, 0.3806629, 2.082032, 1, 0, 0.6588235, 1,
1.218101, 0.2240351, 2.061753, 1, 0, 0.654902, 1,
1.22067, 1.270366, 1.53999, 1, 0, 0.6470588, 1,
1.226511, 1.060221, 2.110779, 1, 0, 0.6431373, 1,
1.230346, -0.7663974, 1.906063, 1, 0, 0.6352941, 1,
1.230785, -1.90546, 2.799206, 1, 0, 0.6313726, 1,
1.242273, -1.763276, 2.748663, 1, 0, 0.6235294, 1,
1.242278, -0.9975868, 1.447335, 1, 0, 0.6196079, 1,
1.249841, -0.7390069, 3.643544, 1, 0, 0.6117647, 1,
1.263657, 0.5874956, 0.4514259, 1, 0, 0.6078432, 1,
1.275318, 1.289159, 1.219738, 1, 0, 0.6, 1,
1.28329, 0.6429664, 1.434142, 1, 0, 0.5921569, 1,
1.302271, -0.9902599, 1.892072, 1, 0, 0.5882353, 1,
1.314487, 0.6131659, 2.851498, 1, 0, 0.5803922, 1,
1.325816, 0.8021597, -1.063389, 1, 0, 0.5764706, 1,
1.328535, -1.130506, 2.010572, 1, 0, 0.5686275, 1,
1.332814, 1.277761, 0.5971153, 1, 0, 0.5647059, 1,
1.338952, -0.03169602, 1.751478, 1, 0, 0.5568628, 1,
1.33908, 0.5664976, -0.3116905, 1, 0, 0.5529412, 1,
1.340469, -2.053643, 1.960839, 1, 0, 0.5450981, 1,
1.345108, -0.2275019, 1.181117, 1, 0, 0.5411765, 1,
1.34745, -1.18253, 4.026044, 1, 0, 0.5333334, 1,
1.348099, -1.631683, 1.640414, 1, 0, 0.5294118, 1,
1.349133, -1.796051, 0.9177962, 1, 0, 0.5215687, 1,
1.358872, 0.3779547, 0.7504595, 1, 0, 0.5176471, 1,
1.360334, 0.3235743, 2.312855, 1, 0, 0.509804, 1,
1.362329, 0.2259137, 2.804084, 1, 0, 0.5058824, 1,
1.373131, -1.533111, 1.419984, 1, 0, 0.4980392, 1,
1.374266, 0.04440597, 1.8734, 1, 0, 0.4901961, 1,
1.374297, 1.572939, -0.4296898, 1, 0, 0.4862745, 1,
1.385436, 0.339041, 0.04274361, 1, 0, 0.4784314, 1,
1.388007, -1.296358, 0.688908, 1, 0, 0.4745098, 1,
1.391984, -1.27184, 1.248921, 1, 0, 0.4666667, 1,
1.395338, -0.8326576, 2.567981, 1, 0, 0.4627451, 1,
1.396149, -0.1736577, 0.8753747, 1, 0, 0.454902, 1,
1.399775, -0.9577162, 1.394306, 1, 0, 0.4509804, 1,
1.407046, 1.808583, -1.829437, 1, 0, 0.4431373, 1,
1.414253, 1.826365, 0.1947513, 1, 0, 0.4392157, 1,
1.428637, 1.114731, 1.574478, 1, 0, 0.4313726, 1,
1.439091, 0.1250489, 0.3575813, 1, 0, 0.427451, 1,
1.444004, 0.481641, 3.450575, 1, 0, 0.4196078, 1,
1.448773, 0.334761, 0.2152844, 1, 0, 0.4156863, 1,
1.458643, -0.4575461, 1.957901, 1, 0, 0.4078431, 1,
1.461082, -0.6202775, 3.000936, 1, 0, 0.4039216, 1,
1.478209, -1.252016, 2.447767, 1, 0, 0.3960784, 1,
1.482699, 2.017825, 0.9772353, 1, 0, 0.3882353, 1,
1.492838, -1.059694, 2.734768, 1, 0, 0.3843137, 1,
1.507561, 1.903323, 1.164078, 1, 0, 0.3764706, 1,
1.524388, -0.5755247, 1.706082, 1, 0, 0.372549, 1,
1.556956, -0.6343668, 2.642615, 1, 0, 0.3647059, 1,
1.57012, -0.1656468, 1.846812, 1, 0, 0.3607843, 1,
1.582514, -0.123594, 2.047963, 1, 0, 0.3529412, 1,
1.595556, -0.5280252, 4.05269, 1, 0, 0.3490196, 1,
1.600454, -1.000733, 3.513688, 1, 0, 0.3411765, 1,
1.621878, -1.062207, 2.223419, 1, 0, 0.3372549, 1,
1.627136, 2.243339, -0.1156973, 1, 0, 0.3294118, 1,
1.628808, -0.6216235, 1.687883, 1, 0, 0.3254902, 1,
1.631231, 0.4186631, 1.223663, 1, 0, 0.3176471, 1,
1.631433, 0.2867806, 1.054792, 1, 0, 0.3137255, 1,
1.635981, 0.7319555, 1.150185, 1, 0, 0.3058824, 1,
1.638756, 0.7804548, 0.5021028, 1, 0, 0.2980392, 1,
1.642752, 0.3909298, 1.309395, 1, 0, 0.2941177, 1,
1.648178, -0.2145665, 2.745509, 1, 0, 0.2862745, 1,
1.653413, 0.07041711, 0.706615, 1, 0, 0.282353, 1,
1.654501, 0.7415099, 1.312743, 1, 0, 0.2745098, 1,
1.661623, 0.1348804, 0.4170323, 1, 0, 0.2705882, 1,
1.668212, -1.418526, 2.700583, 1, 0, 0.2627451, 1,
1.683721, -0.772128, 1.252497, 1, 0, 0.2588235, 1,
1.705973, 0.8938395, 0.2661695, 1, 0, 0.2509804, 1,
1.711872, 0.2871306, 0.109033, 1, 0, 0.2470588, 1,
1.714097, 2.838108, -0.5541648, 1, 0, 0.2392157, 1,
1.723092, 1.771142, -1.681845, 1, 0, 0.2352941, 1,
1.742914, 1.455738, 0.9146279, 1, 0, 0.227451, 1,
1.745044, 1.446548, 1.224689, 1, 0, 0.2235294, 1,
1.791874, -0.09342912, 1.681599, 1, 0, 0.2156863, 1,
1.822322, 1.323003, 1.964909, 1, 0, 0.2117647, 1,
1.833159, 1.116673, 0.4420524, 1, 0, 0.2039216, 1,
1.838032, 1.316983, 0.04899541, 1, 0, 0.1960784, 1,
1.839292, -0.6725342, 1.969244, 1, 0, 0.1921569, 1,
1.867316, 1.387216, 1.407954, 1, 0, 0.1843137, 1,
1.869127, -2.454431, 3.611872, 1, 0, 0.1803922, 1,
1.876906, 0.4539556, 1.434229, 1, 0, 0.172549, 1,
1.891486, -0.6582818, 1.733371, 1, 0, 0.1686275, 1,
1.904228, 2.214906, 1.732026, 1, 0, 0.1607843, 1,
1.916611, 0.2221785, 2.195283, 1, 0, 0.1568628, 1,
1.95233, -1.318565, 2.281817, 1, 0, 0.1490196, 1,
1.977898, 1.67035, -0.03024775, 1, 0, 0.145098, 1,
2.019852, -1.41138, 2.31599, 1, 0, 0.1372549, 1,
2.050943, 0.6245891, 0.9533668, 1, 0, 0.1333333, 1,
2.053306, 1.105835, 0.3133319, 1, 0, 0.1254902, 1,
2.083702, -0.6821661, 1.758564, 1, 0, 0.1215686, 1,
2.134073, 1.464826, 1.006111, 1, 0, 0.1137255, 1,
2.220116, -1.823893, 2.967072, 1, 0, 0.1098039, 1,
2.234389, -2.953293, 2.130326, 1, 0, 0.1019608, 1,
2.276368, 1.394156, 1.317106, 1, 0, 0.09411765, 1,
2.284416, -0.2300535, 3.463389, 1, 0, 0.09019608, 1,
2.298787, -0.5071222, -0.763077, 1, 0, 0.08235294, 1,
2.328752, 2.216741, -0.3307635, 1, 0, 0.07843138, 1,
2.370097, 1.860837, 1.84523, 1, 0, 0.07058824, 1,
2.370509, 1.070633, 1.841125, 1, 0, 0.06666667, 1,
2.47635, 1.511147, 0.2369958, 1, 0, 0.05882353, 1,
2.547389, 2.014978, -0.00351888, 1, 0, 0.05490196, 1,
2.607944, 1.637319, 0.8572206, 1, 0, 0.04705882, 1,
2.666167, 2.150618, 2.433804, 1, 0, 0.04313726, 1,
2.702969, -2.818308, 3.128452, 1, 0, 0.03529412, 1,
2.810673, -0.2576238, 0.4956802, 1, 0, 0.03137255, 1,
3.070879, 1.018134, 0.9501427, 1, 0, 0.02352941, 1,
3.132379, -0.2431022, 2.971095, 1, 0, 0.01960784, 1,
3.217267, -1.713282, 1.712716, 1, 0, 0.01176471, 1,
3.246132, -0.4245132, -0.2556836, 1, 0, 0.007843138, 1
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
0.08393848, -4.977077, -6.737227, 0, -0.5, 0.5, 0.5,
0.08393848, -4.977077, -6.737227, 1, -0.5, 0.5, 0.5,
0.08393848, -4.977077, -6.737227, 1, 1.5, 0.5, 0.5,
0.08393848, -4.977077, -6.737227, 0, 1.5, 0.5, 0.5
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
-4.150239, -0.1653199, -6.737227, 0, -0.5, 0.5, 0.5,
-4.150239, -0.1653199, -6.737227, 1, -0.5, 0.5, 0.5,
-4.150239, -0.1653199, -6.737227, 1, 1.5, 0.5, 0.5,
-4.150239, -0.1653199, -6.737227, 0, 1.5, 0.5, 0.5
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
-4.150239, -4.977077, -0.296015, 0, -0.5, 0.5, 0.5,
-4.150239, -4.977077, -0.296015, 1, -0.5, 0.5, 0.5,
-4.150239, -4.977077, -0.296015, 1, 1.5, 0.5, 0.5,
-4.150239, -4.977077, -0.296015, 0, 1.5, 0.5, 0.5
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
-3, -3.866672, -5.250793,
3, -3.866672, -5.250793,
-3, -3.866672, -5.250793,
-3, -4.051739, -5.498532,
-2, -3.866672, -5.250793,
-2, -4.051739, -5.498532,
-1, -3.866672, -5.250793,
-1, -4.051739, -5.498532,
0, -3.866672, -5.250793,
0, -4.051739, -5.498532,
1, -3.866672, -5.250793,
1, -4.051739, -5.498532,
2, -3.866672, -5.250793,
2, -4.051739, -5.498532,
3, -3.866672, -5.250793,
3, -4.051739, -5.498532
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
-3, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
-3, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
-3, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
-3, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
-2, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
-2, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
-2, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
-2, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
-1, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
-1, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
-1, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
-1, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
0, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
0, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
0, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
0, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
1, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
1, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
1, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
1, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
2, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
2, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
2, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
2, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5,
3, -4.421875, -5.99401, 0, -0.5, 0.5, 0.5,
3, -4.421875, -5.99401, 1, -0.5, 0.5, 0.5,
3, -4.421875, -5.99401, 1, 1.5, 0.5, 0.5,
3, -4.421875, -5.99401, 0, 1.5, 0.5, 0.5
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
-3.173121, -2, -5.250793,
-3.173121, 2, -5.250793,
-3.173121, -2, -5.250793,
-3.335974, -2, -5.498532,
-3.173121, 0, -5.250793,
-3.335974, 0, -5.498532,
-3.173121, 2, -5.250793,
-3.335974, 2, -5.498532
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
-3.66168, -2, -5.99401, 0, -0.5, 0.5, 0.5,
-3.66168, -2, -5.99401, 1, -0.5, 0.5, 0.5,
-3.66168, -2, -5.99401, 1, 1.5, 0.5, 0.5,
-3.66168, -2, -5.99401, 0, 1.5, 0.5, 0.5,
-3.66168, 0, -5.99401, 0, -0.5, 0.5, 0.5,
-3.66168, 0, -5.99401, 1, -0.5, 0.5, 0.5,
-3.66168, 0, -5.99401, 1, 1.5, 0.5, 0.5,
-3.66168, 0, -5.99401, 0, 1.5, 0.5, 0.5,
-3.66168, 2, -5.99401, 0, -0.5, 0.5, 0.5,
-3.66168, 2, -5.99401, 1, -0.5, 0.5, 0.5,
-3.66168, 2, -5.99401, 1, 1.5, 0.5, 0.5,
-3.66168, 2, -5.99401, 0, 1.5, 0.5, 0.5
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
-3.173121, -3.866672, -4,
-3.173121, -3.866672, 4,
-3.173121, -3.866672, -4,
-3.335974, -4.051739, -4,
-3.173121, -3.866672, -2,
-3.335974, -4.051739, -2,
-3.173121, -3.866672, 0,
-3.335974, -4.051739, 0,
-3.173121, -3.866672, 2,
-3.335974, -4.051739, 2,
-3.173121, -3.866672, 4,
-3.335974, -4.051739, 4
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
-3.66168, -4.421875, -4, 0, -0.5, 0.5, 0.5,
-3.66168, -4.421875, -4, 1, -0.5, 0.5, 0.5,
-3.66168, -4.421875, -4, 1, 1.5, 0.5, 0.5,
-3.66168, -4.421875, -4, 0, 1.5, 0.5, 0.5,
-3.66168, -4.421875, -2, 0, -0.5, 0.5, 0.5,
-3.66168, -4.421875, -2, 1, -0.5, 0.5, 0.5,
-3.66168, -4.421875, -2, 1, 1.5, 0.5, 0.5,
-3.66168, -4.421875, -2, 0, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 0, 0, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 0, 1, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 0, 1, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 0, 0, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 2, 0, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 2, 1, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 2, 1, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 2, 0, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 4, 0, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 4, 1, -0.5, 0.5, 0.5,
-3.66168, -4.421875, 4, 1, 1.5, 0.5, 0.5,
-3.66168, -4.421875, 4, 0, 1.5, 0.5, 0.5
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
-3.173121, -3.866672, -5.250793,
-3.173121, 3.536032, -5.250793,
-3.173121, -3.866672, 4.658763,
-3.173121, 3.536032, 4.658763,
-3.173121, -3.866672, -5.250793,
-3.173121, -3.866672, 4.658763,
-3.173121, 3.536032, -5.250793,
-3.173121, 3.536032, 4.658763,
-3.173121, -3.866672, -5.250793,
3.340998, -3.866672, -5.250793,
-3.173121, -3.866672, 4.658763,
3.340998, -3.866672, 4.658763,
-3.173121, 3.536032, -5.250793,
3.340998, 3.536032, -5.250793,
-3.173121, 3.536032, 4.658763,
3.340998, 3.536032, 4.658763,
3.340998, -3.866672, -5.250793,
3.340998, 3.536032, -5.250793,
3.340998, -3.866672, 4.658763,
3.340998, 3.536032, 4.658763,
3.340998, -3.866672, -5.250793,
3.340998, -3.866672, 4.658763,
3.340998, 3.536032, -5.250793,
3.340998, 3.536032, 4.658763
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
var radius = 7.464909;
var distance = 33.21222;
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
mvMatrix.translate( -0.08393848, 0.1653199, 0.296015 );
mvMatrix.scale( 1.239033, 1.090305, 0.814487 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21222);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
2-Methylanilin<-read.table("2-Methylanilin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-Methylanilin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
```

```r
y<-2-Methylanilin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
```

```r
z<-2-Methylanilin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
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
-3.078255, -0.4220372, -2.726173, 0, 0, 1, 1, 1,
-2.997077, -0.6302797, -2.226111, 1, 0, 0, 1, 1,
-2.683406, 1.339374, -1.17057, 1, 0, 0, 1, 1,
-2.614667, 0.2738554, -2.46254, 1, 0, 0, 1, 1,
-2.518734, -0.7286981, -1.651537, 1, 0, 0, 1, 1,
-2.427141, -0.01968728, 0.818531, 1, 0, 0, 1, 1,
-2.425651, -0.6027143, -1.048727, 0, 0, 0, 1, 1,
-2.400921, 0.1728556, -1.749356, 0, 0, 0, 1, 1,
-2.232733, -0.5244187, -2.671331, 0, 0, 0, 1, 1,
-2.217272, -0.01154234, -2.713432, 0, 0, 0, 1, 1,
-2.19716, -1.409411, -2.080175, 0, 0, 0, 1, 1,
-2.185357, 0.9317687, -0.7331833, 0, 0, 0, 1, 1,
-2.166401, 0.384624, -0.7124487, 0, 0, 0, 1, 1,
-2.136392, 2.771304, -0.2976109, 1, 1, 1, 1, 1,
-2.126964, 1.310292, -1.637495, 1, 1, 1, 1, 1,
-2.095358, 1.181017, -0.5564681, 1, 1, 1, 1, 1,
-2.090185, 0.5894664, -2.591789, 1, 1, 1, 1, 1,
-2.080178, 0.4807109, -0.9693007, 1, 1, 1, 1, 1,
-2.071689, 1.854492, -2.627563, 1, 1, 1, 1, 1,
-2.045942, -1.272622, -1.980228, 1, 1, 1, 1, 1,
-2.021641, -0.117494, -1.020395, 1, 1, 1, 1, 1,
-2.007315, 0.3729056, -1.855444, 1, 1, 1, 1, 1,
-2.000952, -1.784484, -2.073232, 1, 1, 1, 1, 1,
-1.988024, 0.4629025, -1.529312, 1, 1, 1, 1, 1,
-1.981254, -0.098682, 0.1871545, 1, 1, 1, 1, 1,
-1.943795, 0.3300293, -1.372223, 1, 1, 1, 1, 1,
-1.939762, -0.9594213, -2.423248, 1, 1, 1, 1, 1,
-1.9392, -0.4375767, -3.084876, 1, 1, 1, 1, 1,
-1.910888, -1.552439, -1.875062, 0, 0, 1, 1, 1,
-1.909049, 1.370628, -1.17893, 1, 0, 0, 1, 1,
-1.887125, -0.5917078, -1.599157, 1, 0, 0, 1, 1,
-1.869553, 2.075765, -2.030022, 1, 0, 0, 1, 1,
-1.8613, -0.4409083, 0.5194381, 1, 0, 0, 1, 1,
-1.856328, -0.8736193, -2.995437, 1, 0, 0, 1, 1,
-1.832583, -0.2785169, -2.128008, 0, 0, 0, 1, 1,
-1.8155, 0.2691335, -1.441361, 0, 0, 0, 1, 1,
-1.804174, -2.059458, -3.43015, 0, 0, 0, 1, 1,
-1.787694, -0.6778377, -0.9130995, 0, 0, 0, 1, 1,
-1.785338, -0.8067063, -1.067659, 0, 0, 0, 1, 1,
-1.782694, -0.6644664, -1.719808, 0, 0, 0, 1, 1,
-1.782054, 0.7157671, -1.159997, 0, 0, 0, 1, 1,
-1.750045, 1.566411, 0.5551416, 1, 1, 1, 1, 1,
-1.742449, -3.501119, -2.502442, 1, 1, 1, 1, 1,
-1.73268, 0.6537031, -1.586985, 1, 1, 1, 1, 1,
-1.727564, -0.04720837, -1.20541, 1, 1, 1, 1, 1,
-1.715505, -0.3216644, -0.6500276, 1, 1, 1, 1, 1,
-1.693736, -0.5630259, -2.507526, 1, 1, 1, 1, 1,
-1.688797, 0.6049989, -0.5920808, 1, 1, 1, 1, 1,
-1.680767, -0.3086263, -3.486894, 1, 1, 1, 1, 1,
-1.680253, -0.7500055, -3.626354, 1, 1, 1, 1, 1,
-1.678501, 1.100697, -1.475921, 1, 1, 1, 1, 1,
-1.666011, 1.147053, -1.60439, 1, 1, 1, 1, 1,
-1.636167, -0.9106256, -2.146531, 1, 1, 1, 1, 1,
-1.627101, 0.1548702, -0.7221853, 1, 1, 1, 1, 1,
-1.596472, -0.1246013, -0.9733856, 1, 1, 1, 1, 1,
-1.594031, -1.120609, -1.215538, 1, 1, 1, 1, 1,
-1.585467, 0.9379148, -0.0228923, 0, 0, 1, 1, 1,
-1.559237, 1.434825, -0.9989581, 1, 0, 0, 1, 1,
-1.542614, 1.246261, 0.2451961, 1, 0, 0, 1, 1,
-1.541335, -0.4921892, -1.193496, 1, 0, 0, 1, 1,
-1.529404, -1.208264, -3.943404, 1, 0, 0, 1, 1,
-1.528286, 1.564214, -2.386519, 1, 0, 0, 1, 1,
-1.508486, 1.333895, -0.8248091, 0, 0, 0, 1, 1,
-1.508387, 0.2384155, -2.770518, 0, 0, 0, 1, 1,
-1.508016, 0.5212187, -0.393003, 0, 0, 0, 1, 1,
-1.499692, -0.01092482, -1.920828, 0, 0, 0, 1, 1,
-1.497211, -0.966581, -3.716772, 0, 0, 0, 1, 1,
-1.496981, 0.1590948, -1.658484, 0, 0, 0, 1, 1,
-1.486569, -0.3905493, -2.308526, 0, 0, 0, 1, 1,
-1.452421, -0.3720815, -1.29045, 1, 1, 1, 1, 1,
-1.431425, -0.7177787, -2.30253, 1, 1, 1, 1, 1,
-1.422314, 0.8319904, -0.7965423, 1, 1, 1, 1, 1,
-1.406724, 1.139806, -0.4265433, 1, 1, 1, 1, 1,
-1.405566, -0.1602913, -1.464496, 1, 1, 1, 1, 1,
-1.404481, -0.9185096, -1.251648, 1, 1, 1, 1, 1,
-1.401775, -1.268788, -1.739991, 1, 1, 1, 1, 1,
-1.398505, -1.09503, -2.768423, 1, 1, 1, 1, 1,
-1.397785, 0.7925618, 0.1053285, 1, 1, 1, 1, 1,
-1.38047, -0.5860127, -1.815808, 1, 1, 1, 1, 1,
-1.365014, -1.076009, -0.7083234, 1, 1, 1, 1, 1,
-1.356722, -0.04898702, -1.334144, 1, 1, 1, 1, 1,
-1.353842, 3.428226, -1.973901, 1, 1, 1, 1, 1,
-1.34963, -2.109372, -4.121048, 1, 1, 1, 1, 1,
-1.348694, 1.115729, -1.872513, 1, 1, 1, 1, 1,
-1.335361, 0.2841117, 0.8908277, 0, 0, 1, 1, 1,
-1.321839, -1.167358, -1.493992, 1, 0, 0, 1, 1,
-1.300485, 0.1357022, -2.20288, 1, 0, 0, 1, 1,
-1.294738, -2.503443, -3.167627, 1, 0, 0, 1, 1,
-1.292295, 1.231725, 0.2723939, 1, 0, 0, 1, 1,
-1.284932, 0.6209157, -0.3830815, 1, 0, 0, 1, 1,
-1.277184, -0.1787877, -2.786123, 0, 0, 0, 1, 1,
-1.272532, 1.147066, 1.160821, 0, 0, 0, 1, 1,
-1.270865, -0.4509937, -1.779588, 0, 0, 0, 1, 1,
-1.257719, 0.7167226, -1.721874, 0, 0, 0, 1, 1,
-1.245838, -1.470765, -4.549088, 0, 0, 0, 1, 1,
-1.2413, -0.5634636, -0.9415195, 0, 0, 0, 1, 1,
-1.233864, 0.9174781, -1.1495, 0, 0, 0, 1, 1,
-1.225589, -2.438641, -2.178891, 1, 1, 1, 1, 1,
-1.223246, -0.5637113, -3.229638, 1, 1, 1, 1, 1,
-1.222982, 0.03954818, -1.669102, 1, 1, 1, 1, 1,
-1.212737, 0.1640021, -1.983047, 1, 1, 1, 1, 1,
-1.212317, 0.5742921, -3.278823, 1, 1, 1, 1, 1,
-1.199405, -2.059713, -1.664933, 1, 1, 1, 1, 1,
-1.1796, 0.2439708, -1.923856, 1, 1, 1, 1, 1,
-1.177214, -1.42433, -1.635929, 1, 1, 1, 1, 1,
-1.174264, 1.487654, -1.049193, 1, 1, 1, 1, 1,
-1.165645, -0.5034476, -0.9613421, 1, 1, 1, 1, 1,
-1.160348, -0.923021, -2.48548, 1, 1, 1, 1, 1,
-1.156651, 0.209434, -1.040716, 1, 1, 1, 1, 1,
-1.154803, -0.3157732, -1.444615, 1, 1, 1, 1, 1,
-1.141011, -1.067713, -2.876449, 1, 1, 1, 1, 1,
-1.140152, 0.2963142, 0.2754652, 1, 1, 1, 1, 1,
-1.137662, 0.7502598, -0.2577552, 0, 0, 1, 1, 1,
-1.136385, -0.005192532, -1.593833, 1, 0, 0, 1, 1,
-1.132468, 1.292707, 0.592868, 1, 0, 0, 1, 1,
-1.12842, 0.4248313, 0.1729684, 1, 0, 0, 1, 1,
-1.121855, 1.643245, -0.1800455, 1, 0, 0, 1, 1,
-1.121559, -1.192246, -2.79, 1, 0, 0, 1, 1,
-1.120375, 1.548908, -0.9891998, 0, 0, 0, 1, 1,
-1.120133, -0.2041923, -1.876912, 0, 0, 0, 1, 1,
-1.114445, -0.1267013, -0.2454879, 0, 0, 0, 1, 1,
-1.101334, 0.8430158, -0.9969088, 0, 0, 0, 1, 1,
-1.098701, -0.8798352, -1.542352, 0, 0, 0, 1, 1,
-1.090504, 1.004633, -0.7906025, 0, 0, 0, 1, 1,
-1.088987, -0.6179249, -2.10066, 0, 0, 0, 1, 1,
-1.088158, 0.4544545, -0.5899203, 1, 1, 1, 1, 1,
-1.087759, 0.5874745, -0.6851286, 1, 1, 1, 1, 1,
-1.069946, -0.07276586, -1.195099, 1, 1, 1, 1, 1,
-1.068704, 0.2065329, -2.850153, 1, 1, 1, 1, 1,
-1.063039, 1.266285, -0.200996, 1, 1, 1, 1, 1,
-1.060863, 0.340306, -2.158377, 1, 1, 1, 1, 1,
-1.058263, -0.07121076, -3.44198, 1, 1, 1, 1, 1,
-1.056348, -1.818778, -2.518723, 1, 1, 1, 1, 1,
-1.050736, -0.8288033, -2.609952, 1, 1, 1, 1, 1,
-1.050516, 1.677413, 1.397004, 1, 1, 1, 1, 1,
-1.049341, 0.5816823, -1.074884, 1, 1, 1, 1, 1,
-1.035068, -0.8064274, -0.5818011, 1, 1, 1, 1, 1,
-1.034892, -0.3514356, -2.650694, 1, 1, 1, 1, 1,
-1.033165, 0.7799257, -0.7295531, 1, 1, 1, 1, 1,
-1.025847, 0.2211901, -0.8244009, 1, 1, 1, 1, 1,
-1.020335, 2.014239, -1.907118, 0, 0, 1, 1, 1,
-1.019799, 0.2142961, -1.611054, 1, 0, 0, 1, 1,
-1.012206, -0.6586017, -1.636312, 1, 0, 0, 1, 1,
-1.007295, -0.5564502, -3.201252, 1, 0, 0, 1, 1,
-1.007034, -0.01821683, -2.045851, 1, 0, 0, 1, 1,
-0.999, 1.081087, -0.580897, 1, 0, 0, 1, 1,
-0.982634, 0.3647761, -0.4026251, 0, 0, 0, 1, 1,
-0.9799937, 2.429281, -0.08102192, 0, 0, 0, 1, 1,
-0.9760002, 0.06265017, -1.847545, 0, 0, 0, 1, 1,
-0.9722781, -0.2634561, -1.7717, 0, 0, 0, 1, 1,
-0.9703613, 0.07387924, -1.194904, 0, 0, 0, 1, 1,
-0.9689289, 0.237702, -1.311023, 0, 0, 0, 1, 1,
-0.9658774, 0.5003468, 0.91049, 0, 0, 0, 1, 1,
-0.9605407, 0.3204747, 1.575804, 1, 1, 1, 1, 1,
-0.9582785, 1.25389, -0.4316738, 1, 1, 1, 1, 1,
-0.9574238, -1.393289, -3.737643, 1, 1, 1, 1, 1,
-0.945811, 0.08735231, -1.899397, 1, 1, 1, 1, 1,
-0.9384901, 0.5325255, -1.004615, 1, 1, 1, 1, 1,
-0.9306749, -0.4312183, -3.356248, 1, 1, 1, 1, 1,
-0.9286987, 1.317067, -1.842729, 1, 1, 1, 1, 1,
-0.9248585, -0.9860283, -1.432514, 1, 1, 1, 1, 1,
-0.924676, 0.5180259, -2.096224, 1, 1, 1, 1, 1,
-0.9202779, -0.1605801, -2.242247, 1, 1, 1, 1, 1,
-0.9166986, 0.8903525, 0.06825264, 1, 1, 1, 1, 1,
-0.9145128, -0.5940771, -2.630467, 1, 1, 1, 1, 1,
-0.9124128, -0.7620907, -2.692841, 1, 1, 1, 1, 1,
-0.9121422, -0.6422207, -5.064453, 1, 1, 1, 1, 1,
-0.908956, -1.086924, -1.355733, 1, 1, 1, 1, 1,
-0.908502, -0.5364398, -0.9439299, 0, 0, 1, 1, 1,
-0.9053325, 0.6179391, -0.5593161, 1, 0, 0, 1, 1,
-0.9023477, 0.2706626, -1.115457, 1, 0, 0, 1, 1,
-0.9013681, 0.2175235, -1.999919, 1, 0, 0, 1, 1,
-0.8892739, -0.4195137, -0.9022529, 1, 0, 0, 1, 1,
-0.8784619, -0.3026668, -2.51162, 1, 0, 0, 1, 1,
-0.8783703, 1.251966, -3.277638, 0, 0, 0, 1, 1,
-0.8747267, -0.09544971, -1.526541, 0, 0, 0, 1, 1,
-0.8727981, -0.6917376, -1.739694, 0, 0, 0, 1, 1,
-0.87091, -0.776248, -4.671718, 0, 0, 0, 1, 1,
-0.8606367, 2.189827, 0.785589, 0, 0, 0, 1, 1,
-0.8573682, -1.425236, -2.131818, 0, 0, 0, 1, 1,
-0.8563681, 0.7416754, -2.304228, 0, 0, 0, 1, 1,
-0.8507066, -0.1661112, -1.330362, 1, 1, 1, 1, 1,
-0.8468243, 1.565081, -1.67501, 1, 1, 1, 1, 1,
-0.8467242, -0.5086331, -2.290188, 1, 1, 1, 1, 1,
-0.8422043, 1.000572, -1.033085, 1, 1, 1, 1, 1,
-0.8375935, -0.1101371, -1.851732, 1, 1, 1, 1, 1,
-0.837567, -0.4550341, -1.538337, 1, 1, 1, 1, 1,
-0.8353756, -0.4284463, -0.7138594, 1, 1, 1, 1, 1,
-0.8346145, -0.2570834, -3.8588, 1, 1, 1, 1, 1,
-0.8344104, 0.5330072, -0.4303491, 1, 1, 1, 1, 1,
-0.8297206, 0.5317577, -0.4038474, 1, 1, 1, 1, 1,
-0.8292527, 0.01947194, 0.5999021, 1, 1, 1, 1, 1,
-0.8227806, 0.4015482, 0.1223024, 1, 1, 1, 1, 1,
-0.8208525, 2.059316, 0.8550773, 1, 1, 1, 1, 1,
-0.8198935, -0.07674567, -2.24245, 1, 1, 1, 1, 1,
-0.8197041, 0.6443978, -0.04313932, 1, 1, 1, 1, 1,
-0.808616, 0.2673784, 0.3100954, 0, 0, 1, 1, 1,
-0.8070062, -0.1782452, -2.001572, 1, 0, 0, 1, 1,
-0.8064888, -2.766012, -1.106993, 1, 0, 0, 1, 1,
-0.8038567, -1.036934, -2.252052, 1, 0, 0, 1, 1,
-0.8006899, -0.3212011, -1.898806, 1, 0, 0, 1, 1,
-0.7960584, 0.9234465, -1.497912, 1, 0, 0, 1, 1,
-0.7902814, 0.4760617, -1.523214, 0, 0, 0, 1, 1,
-0.7864349, -1.187962, -2.650367, 0, 0, 0, 1, 1,
-0.7861875, 0.3087729, -1.736605, 0, 0, 0, 1, 1,
-0.7856404, 0.356539, -0.05776647, 0, 0, 0, 1, 1,
-0.7841302, 0.04137278, -1.679787, 0, 0, 0, 1, 1,
-0.7768186, -1.726893, -1.644188, 0, 0, 0, 1, 1,
-0.773948, -0.05684186, -3.547175, 0, 0, 0, 1, 1,
-0.7721823, 0.2761801, 0.01509468, 1, 1, 1, 1, 1,
-0.7654089, -0.06766092, -3.130902, 1, 1, 1, 1, 1,
-0.756919, -1.482166, -2.919179, 1, 1, 1, 1, 1,
-0.7557796, 0.2787833, -0.9851273, 1, 1, 1, 1, 1,
-0.7512797, 1.370728, -1.281209, 1, 1, 1, 1, 1,
-0.7480944, 1.046481, -0.888951, 1, 1, 1, 1, 1,
-0.7476649, -0.531184, -3.632828, 1, 1, 1, 1, 1,
-0.7447519, -1.57279, -1.864126, 1, 1, 1, 1, 1,
-0.7394261, -0.6147792, -3.464421, 1, 1, 1, 1, 1,
-0.7387504, -0.5104624, -3.589467, 1, 1, 1, 1, 1,
-0.7254679, 3.13849, -0.5849808, 1, 1, 1, 1, 1,
-0.7143933, -1.085661, -3.620589, 1, 1, 1, 1, 1,
-0.7131208, 1.162391, 0.2546955, 1, 1, 1, 1, 1,
-0.7128667, 0.3402793, -0.9984201, 1, 1, 1, 1, 1,
-0.7095171, 1.23021, -0.2905606, 1, 1, 1, 1, 1,
-0.709141, 0.07421768, -3.135806, 0, 0, 1, 1, 1,
-0.706742, -1.580526, -1.235845, 1, 0, 0, 1, 1,
-0.7054575, 0.1426997, -0.6909794, 1, 0, 0, 1, 1,
-0.6859188, 2.609305, -1.78041, 1, 0, 0, 1, 1,
-0.6823847, -0.5083709, -4.305166, 1, 0, 0, 1, 1,
-0.6820474, 0.4265754, -1.409806, 1, 0, 0, 1, 1,
-0.6804654, 1.427192, 0.2777548, 0, 0, 0, 1, 1,
-0.6801934, -1.078126, -5.071042, 0, 0, 0, 1, 1,
-0.6769876, -0.3798829, -1.836602, 0, 0, 0, 1, 1,
-0.6767529, 0.423559, -2.217644, 0, 0, 0, 1, 1,
-0.6713946, -0.01576265, -0.005915362, 0, 0, 0, 1, 1,
-0.666393, -0.763959, -2.2446, 0, 0, 0, 1, 1,
-0.6632395, -2.646306, -1.498966, 0, 0, 0, 1, 1,
-0.6596258, 0.7678148, 0.1768998, 1, 1, 1, 1, 1,
-0.6569456, -0.4499529, -1.780293, 1, 1, 1, 1, 1,
-0.6526159, -2.357271, -3.262979, 1, 1, 1, 1, 1,
-0.6489677, 1.905717, -1.090667, 1, 1, 1, 1, 1,
-0.6448405, 1.946857, -0.9517855, 1, 1, 1, 1, 1,
-0.6424359, 1.367828, -0.6834603, 1, 1, 1, 1, 1,
-0.6409626, -0.8356335, -5.015411, 1, 1, 1, 1, 1,
-0.6391975, 0.009079724, 0.2243564, 1, 1, 1, 1, 1,
-0.6379321, 1.04822, -0.7137441, 1, 1, 1, 1, 1,
-0.6246039, 0.2715361, -1.012178, 1, 1, 1, 1, 1,
-0.6240532, 0.05589217, -2.569293, 1, 1, 1, 1, 1,
-0.6189714, -1.7371, -3.76083, 1, 1, 1, 1, 1,
-0.6187906, 0.7629517, -2.628945, 1, 1, 1, 1, 1,
-0.6185482, 1.278367, -0.5828922, 1, 1, 1, 1, 1,
-0.6185188, 0.5448964, -0.3390968, 1, 1, 1, 1, 1,
-0.615927, -1.000548, -2.847413, 0, 0, 1, 1, 1,
-0.6124079, -0.2762505, -2.201572, 1, 0, 0, 1, 1,
-0.6105791, -1.459007, -1.84883, 1, 0, 0, 1, 1,
-0.6092626, -0.1276327, -2.817056, 1, 0, 0, 1, 1,
-0.6051106, -0.7739443, -2.371898, 1, 0, 0, 1, 1,
-0.6040305, -1.657484, -3.079187, 1, 0, 0, 1, 1,
-0.6040116, 1.453618, -0.1936029, 0, 0, 0, 1, 1,
-0.5947961, -1.668664, -4.095525, 0, 0, 0, 1, 1,
-0.5898036, 0.3325011, -1.001519, 0, 0, 0, 1, 1,
-0.5835683, 0.2644127, -0.3622524, 0, 0, 0, 1, 1,
-0.5834207, -0.3969888, -3.000786, 0, 0, 0, 1, 1,
-0.5779703, -0.2785692, -1.095377, 0, 0, 0, 1, 1,
-0.5730312, -0.1148904, -2.69134, 0, 0, 0, 1, 1,
-0.5714836, 2.717186, -2.000096, 1, 1, 1, 1, 1,
-0.5707433, -0.08225296, -2.583784, 1, 1, 1, 1, 1,
-0.5700157, -0.372981, 0.1600897, 1, 1, 1, 1, 1,
-0.5678311, 0.4451365, -1.742346, 1, 1, 1, 1, 1,
-0.5630922, -1.125876, -2.937267, 1, 1, 1, 1, 1,
-0.5614754, 0.3760663, 0.1190678, 1, 1, 1, 1, 1,
-0.5610638, 0.5889971, -0.05675948, 1, 1, 1, 1, 1,
-0.5599111, 0.7430813, -0.7900827, 1, 1, 1, 1, 1,
-0.559308, 1.616722, -0.1147598, 1, 1, 1, 1, 1,
-0.5588284, -0.8084847, -2.860996, 1, 1, 1, 1, 1,
-0.5587214, -1.052857, -2.171932, 1, 1, 1, 1, 1,
-0.5532766, 1.139334, -0.8882259, 1, 1, 1, 1, 1,
-0.5531781, -0.5355247, -0.7817298, 1, 1, 1, 1, 1,
-0.5515162, 0.5331997, -1.851765, 1, 1, 1, 1, 1,
-0.5492302, -0.3106045, -2.101879, 1, 1, 1, 1, 1,
-0.5423841, 1.180674, -0.6866346, 0, 0, 1, 1, 1,
-0.5405794, -0.2083743, -0.7958183, 1, 0, 0, 1, 1,
-0.531496, -0.8859584, -3.373893, 1, 0, 0, 1, 1,
-0.5310453, -1.610276, -3.506648, 1, 0, 0, 1, 1,
-0.5286825, -0.9585306, -3.148938, 1, 0, 0, 1, 1,
-0.5253864, 0.779986, -1.230948, 1, 0, 0, 1, 1,
-0.5197356, -0.494011, -2.759353, 0, 0, 0, 1, 1,
-0.5148667, 0.5874116, 0.7725195, 0, 0, 0, 1, 1,
-0.5106071, -1.479588, -4.601294, 0, 0, 0, 1, 1,
-0.5054511, 1.162141, -1.78741, 0, 0, 0, 1, 1,
-0.5050776, -0.09530439, -0.7259066, 0, 0, 0, 1, 1,
-0.500531, -1.434857, -4.87291, 0, 0, 0, 1, 1,
-0.4864612, 0.1672688, -0.8543983, 0, 0, 0, 1, 1,
-0.4816447, 0.2677877, -0.2664936, 1, 1, 1, 1, 1,
-0.4803818, -1.408859, -3.717165, 1, 1, 1, 1, 1,
-0.4796703, -0.3337022, -2.95256, 1, 1, 1, 1, 1,
-0.4781424, 1.104952, -0.2600655, 1, 1, 1, 1, 1,
-0.4772957, 0.4488035, -0.1346307, 1, 1, 1, 1, 1,
-0.4761594, -0.8033521, -1.293316, 1, 1, 1, 1, 1,
-0.4743103, -0.3884282, -2.234442, 1, 1, 1, 1, 1,
-0.4739721, -1.259203, -3.984754, 1, 1, 1, 1, 1,
-0.4724561, 0.4910065, -1.974167, 1, 1, 1, 1, 1,
-0.4717529, 0.470985, -1.921252, 1, 1, 1, 1, 1,
-0.4683436, 0.7565658, 0.3389179, 1, 1, 1, 1, 1,
-0.4680823, 0.3070693, -2.312347, 1, 1, 1, 1, 1,
-0.4594675, -0.3368554, -1.65171, 1, 1, 1, 1, 1,
-0.4588802, -1.199586, -4.793094, 1, 1, 1, 1, 1,
-0.4579004, 1.035623, 0.6562445, 1, 1, 1, 1, 1,
-0.4571826, -0.8923994, -2.270212, 0, 0, 1, 1, 1,
-0.4562235, 0.9555744, -0.06100725, 1, 0, 0, 1, 1,
-0.4541422, 1.394631, 0.6927894, 1, 0, 0, 1, 1,
-0.450013, 0.1567816, -1.49005, 1, 0, 0, 1, 1,
-0.4459981, -0.08803559, -2.429404, 1, 0, 0, 1, 1,
-0.4457247, -0.2351399, -2.273233, 1, 0, 0, 1, 1,
-0.4427983, 0.01455098, -0.7637353, 0, 0, 0, 1, 1,
-0.439167, -1.418507, -3.075357, 0, 0, 0, 1, 1,
-0.4384021, -0.2453953, -1.594859, 0, 0, 0, 1, 1,
-0.4360195, 1.856389, 1.326217, 0, 0, 0, 1, 1,
-0.4280811, 0.1850923, -1.331135, 0, 0, 0, 1, 1,
-0.425862, -0.4169858, -4.04202, 0, 0, 0, 1, 1,
-0.4247885, -0.2901145, -2.488555, 0, 0, 0, 1, 1,
-0.4246881, 0.2164902, -1.193351, 1, 1, 1, 1, 1,
-0.4134996, -1.084222, -3.94448, 1, 1, 1, 1, 1,
-0.4112531, -1.390973, -2.26937, 1, 1, 1, 1, 1,
-0.4069082, 0.3814636, -0.5787584, 1, 1, 1, 1, 1,
-0.4064262, 2.515112, 0.2020741, 1, 1, 1, 1, 1,
-0.4050555, 1.703283, 0.4268698, 1, 1, 1, 1, 1,
-0.4033649, 1.100943, -0.1650205, 1, 1, 1, 1, 1,
-0.4030531, 1.523279, 1.284361, 1, 1, 1, 1, 1,
-0.4002266, 0.9069192, 0.166619, 1, 1, 1, 1, 1,
-0.3997477, 0.1572919, -0.3100255, 1, 1, 1, 1, 1,
-0.3966521, -0.4717761, -0.5263197, 1, 1, 1, 1, 1,
-0.3939548, -0.08862359, -2.988675, 1, 1, 1, 1, 1,
-0.3903323, 0.8170215, 0.03560586, 1, 1, 1, 1, 1,
-0.3843373, 2.898002, -1.576094, 1, 1, 1, 1, 1,
-0.3819284, -0.4465625, -3.706241, 1, 1, 1, 1, 1,
-0.3782085, 1.773919, -0.8135254, 0, 0, 1, 1, 1,
-0.3666803, -0.1481381, -1.362013, 1, 0, 0, 1, 1,
-0.366328, 0.8179133, 0.1242746, 1, 0, 0, 1, 1,
-0.3643812, -0.1984503, -0.8475971, 1, 0, 0, 1, 1,
-0.3641015, 1.677609, -0.1101706, 1, 0, 0, 1, 1,
-0.3636963, 1.334553, -0.3977823, 1, 0, 0, 1, 1,
-0.3599938, 0.01784841, -1.899301, 0, 0, 0, 1, 1,
-0.3524761, 1.216162, -0.8622045, 0, 0, 0, 1, 1,
-0.350483, 1.517286, -1.293902, 0, 0, 0, 1, 1,
-0.3498808, -2.07918, -2.379965, 0, 0, 0, 1, 1,
-0.3496151, -0.2239504, -2.033121, 0, 0, 0, 1, 1,
-0.3493487, -2.256842, -3.813479, 0, 0, 0, 1, 1,
-0.3492479, -0.2115841, -2.677839, 0, 0, 0, 1, 1,
-0.3486514, -1.522681, -4.042404, 1, 1, 1, 1, 1,
-0.3469108, -1.294751, -2.852288, 1, 1, 1, 1, 1,
-0.3465707, 1.05686, -1.789486, 1, 1, 1, 1, 1,
-0.3464867, 0.5484769, -1.597335, 1, 1, 1, 1, 1,
-0.3428521, -0.1913793, -3.008738, 1, 1, 1, 1, 1,
-0.3363446, -1.089389, -2.865331, 1, 1, 1, 1, 1,
-0.3269641, -0.4735012, -2.295496, 1, 1, 1, 1, 1,
-0.3255124, 0.9174542, -0.2173496, 1, 1, 1, 1, 1,
-0.3178753, -0.7037391, -1.807055, 1, 1, 1, 1, 1,
-0.3167984, -0.2646001, -2.4235, 1, 1, 1, 1, 1,
-0.311055, -0.3151357, -1.795451, 1, 1, 1, 1, 1,
-0.3061229, 0.3017933, -1.888784, 1, 1, 1, 1, 1,
-0.3053154, 1.033045, -1.156913, 1, 1, 1, 1, 1,
-0.3002141, -0.1868466, -1.475687, 1, 1, 1, 1, 1,
-0.300145, -1.063336, -2.386665, 1, 1, 1, 1, 1,
-0.2990708, 0.93568, -0.4258287, 0, 0, 1, 1, 1,
-0.2977989, -0.3298513, -5.022645, 1, 0, 0, 1, 1,
-0.2967686, -0.3974007, -2.148974, 1, 0, 0, 1, 1,
-0.2936643, -1.440572, -3.913276, 1, 0, 0, 1, 1,
-0.2839123, 1.041772, -0.5974835, 1, 0, 0, 1, 1,
-0.2833945, 1.187459, 1.735231, 1, 0, 0, 1, 1,
-0.2820536, -0.3416966, -5.10648, 0, 0, 0, 1, 1,
-0.2816367, 0.308261, -1.403389, 0, 0, 0, 1, 1,
-0.2812602, 2.016174, -0.7199036, 0, 0, 0, 1, 1,
-0.2795692, -0.1538886, -2.327411, 0, 0, 0, 1, 1,
-0.2735456, 0.2031496, 0.005557046, 0, 0, 0, 1, 1,
-0.2722764, -2.749961, -3.883384, 0, 0, 0, 1, 1,
-0.2684015, -0.5248182, -4.564743, 0, 0, 0, 1, 1,
-0.2678753, -1.195108, -3.495125, 1, 1, 1, 1, 1,
-0.2658353, 1.751021, 0.2056322, 1, 1, 1, 1, 1,
-0.2653341, 1.039156, -1.171909, 1, 1, 1, 1, 1,
-0.2629329, 0.04881176, -2.414501, 1, 1, 1, 1, 1,
-0.2612694, 0.05800141, -2.284889, 1, 1, 1, 1, 1,
-0.2599481, -1.213062, -2.2485, 1, 1, 1, 1, 1,
-0.2549453, 0.7301995, 0.01795404, 1, 1, 1, 1, 1,
-0.2526528, -1.34508, -3.184716, 1, 1, 1, 1, 1,
-0.2525835, -1.850379, -2.381989, 1, 1, 1, 1, 1,
-0.2522582, -1.109912, -3.172995, 1, 1, 1, 1, 1,
-0.2460937, -0.8484177, -4.059412, 1, 1, 1, 1, 1,
-0.2427014, -3.758865, -3.016424, 1, 1, 1, 1, 1,
-0.2402983, 0.6763927, -0.4289316, 1, 1, 1, 1, 1,
-0.2337749, 0.001323594, -2.193198, 1, 1, 1, 1, 1,
-0.2289374, -0.9196059, -2.00976, 1, 1, 1, 1, 1,
-0.2278584, -1.21733, -3.279172, 0, 0, 1, 1, 1,
-0.2194876, -0.0164907, 0.3170039, 1, 0, 0, 1, 1,
-0.2173417, 0.07541767, 0.1621429, 1, 0, 0, 1, 1,
-0.2129582, -0.9161774, -1.586417, 1, 0, 0, 1, 1,
-0.2124354, 0.7640476, -1.348753, 1, 0, 0, 1, 1,
-0.210067, -0.2772206, -2.023121, 1, 0, 0, 1, 1,
-0.206825, -0.4198703, -3.680037, 0, 0, 0, 1, 1,
-0.2059692, -0.2611893, -1.714432, 0, 0, 0, 1, 1,
-0.2054701, 0.6951937, 0.6878048, 0, 0, 0, 1, 1,
-0.204227, 0.3757253, -0.4967688, 0, 0, 0, 1, 1,
-0.2007009, 0.0004388345, -0.7447567, 0, 0, 0, 1, 1,
-0.1997435, 0.5138516, -1.705719, 0, 0, 0, 1, 1,
-0.1952875, -1.2372, -3.104424, 0, 0, 0, 1, 1,
-0.1934958, 2.016698, 0.502934, 1, 1, 1, 1, 1,
-0.192473, -1.242532, -1.372821, 1, 1, 1, 1, 1,
-0.1902357, -0.9001391, -3.777416, 1, 1, 1, 1, 1,
-0.1869689, -0.4259762, -2.889493, 1, 1, 1, 1, 1,
-0.1818292, 0.3313076, -1.851722, 1, 1, 1, 1, 1,
-0.1743987, -0.3531157, -4.396039, 1, 1, 1, 1, 1,
-0.1721585, -1.309371, -3.77388, 1, 1, 1, 1, 1,
-0.1693715, -0.5546887, -2.993015, 1, 1, 1, 1, 1,
-0.1677762, 0.153943, -2.633409, 1, 1, 1, 1, 1,
-0.1655324, -0.4739575, -2.919484, 1, 1, 1, 1, 1,
-0.1629612, 0.289073, -2.022229, 1, 1, 1, 1, 1,
-0.1625443, 0.0702989, -1.313578, 1, 1, 1, 1, 1,
-0.1524073, 0.9614565, 1.089501, 1, 1, 1, 1, 1,
-0.1348912, -0.02066337, -2.760251, 1, 1, 1, 1, 1,
-0.1298147, -0.2264101, -1.991577, 1, 1, 1, 1, 1,
-0.1268889, -2.698324, -2.049612, 0, 0, 1, 1, 1,
-0.1265761, 0.05892209, -0.6380963, 1, 0, 0, 1, 1,
-0.1208469, -1.208402, -3.288056, 1, 0, 0, 1, 1,
-0.1193878, 0.4801624, -0.5429435, 1, 0, 0, 1, 1,
-0.1185893, -1.6518, -1.988972, 1, 0, 0, 1, 1,
-0.1167099, 1.444241, -0.5110236, 1, 0, 0, 1, 1,
-0.1139603, -0.01857715, -1.253549, 0, 0, 0, 1, 1,
-0.1117816, -0.9702935, -2.668789, 0, 0, 0, 1, 1,
-0.1101103, 0.1980593, -1.52124, 0, 0, 0, 1, 1,
-0.1065312, 0.5177017, 1.478952, 0, 0, 0, 1, 1,
-0.1060741, 1.847396, -1.073647, 0, 0, 0, 1, 1,
-0.1021241, 0.06517048, 0.1445044, 0, 0, 0, 1, 1,
-0.1000658, 1.247189, 1.638618, 0, 0, 0, 1, 1,
-0.09981102, 0.1989823, 0.3767242, 1, 1, 1, 1, 1,
-0.09750953, 0.2158888, 0.3746932, 1, 1, 1, 1, 1,
-0.0946508, -0.7540361, -1.878345, 1, 1, 1, 1, 1,
-0.09448709, -1.10416, -3.964067, 1, 1, 1, 1, 1,
-0.094464, -0.500689, -3.116492, 1, 1, 1, 1, 1,
-0.08894906, 0.2883476, -1.137687, 1, 1, 1, 1, 1,
-0.08870383, 0.154041, -1.383536, 1, 1, 1, 1, 1,
-0.074533, 0.4066013, 0.6147142, 1, 1, 1, 1, 1,
-0.07175685, -0.3864259, -3.443032, 1, 1, 1, 1, 1,
-0.06770253, -2.67004, -4.695045, 1, 1, 1, 1, 1,
-0.0660245, 0.7745117, -0.2071283, 1, 1, 1, 1, 1,
-0.06557474, 0.09144513, -0.07322983, 1, 1, 1, 1, 1,
-0.06549945, 1.398183, -1.81554, 1, 1, 1, 1, 1,
-0.06492208, 1.872195, 3.479799, 1, 1, 1, 1, 1,
-0.06470796, -0.0331294, -1.494272, 1, 1, 1, 1, 1,
-0.06450748, 0.5477441, 0.3077328, 0, 0, 1, 1, 1,
-0.06419758, -1.143237, -1.062575, 1, 0, 0, 1, 1,
-0.0630836, 0.448358, -0.6284844, 1, 0, 0, 1, 1,
-0.05890669, 0.5694591, -1.713862, 1, 0, 0, 1, 1,
-0.05861178, -1.324799, -3.326284, 1, 0, 0, 1, 1,
-0.05744748, 1.64458, 0.5154045, 1, 0, 0, 1, 1,
-0.05534779, -0.1767922, -3.665832, 0, 0, 0, 1, 1,
-0.05509729, 0.4428148, 0.5519162, 0, 0, 0, 1, 1,
-0.05474063, 0.3967984, -0.226498, 0, 0, 0, 1, 1,
-0.05397676, -0.4265317, -2.314241, 0, 0, 0, 1, 1,
-0.05310859, -0.3570106, -4.128816, 0, 0, 0, 1, 1,
-0.04983803, 1.416743, -0.2665244, 0, 0, 0, 1, 1,
-0.04432503, 0.6868389, -2.359096, 0, 0, 0, 1, 1,
-0.04315097, 1.029818, -0.2800248, 1, 1, 1, 1, 1,
-0.038589, -0.2933999, -3.520507, 1, 1, 1, 1, 1,
-0.0377365, -0.6034032, -4.300642, 1, 1, 1, 1, 1,
-0.03699651, -2.248052, -4.072304, 1, 1, 1, 1, 1,
-0.03349095, -2.029832, -1.73539, 1, 1, 1, 1, 1,
-0.02818354, -0.08106294, -1.85764, 1, 1, 1, 1, 1,
-0.0242008, -0.4183802, -4.213374, 1, 1, 1, 1, 1,
-0.0227004, -1.196585, -3.955708, 1, 1, 1, 1, 1,
-0.01962121, 0.3141959, 1.726496, 1, 1, 1, 1, 1,
-0.01886605, -0.561904, -3.56829, 1, 1, 1, 1, 1,
-0.01788628, 0.3680003, 1.900116, 1, 1, 1, 1, 1,
-0.0123774, -1.501544, -4.970133, 1, 1, 1, 1, 1,
-0.009294349, -0.07332145, -2.597628, 1, 1, 1, 1, 1,
-0.00044075, -1.797853, -2.76602, 1, 1, 1, 1, 1,
0.002911961, -0.2879694, 4.100622, 1, 1, 1, 1, 1,
0.008102566, 0.2474944, -0.5210152, 0, 0, 1, 1, 1,
0.01685808, -1.192637, 3.625555, 1, 0, 0, 1, 1,
0.01765251, -1.459973, 2.419893, 1, 0, 0, 1, 1,
0.02203272, 0.9056764, -0.4969515, 1, 0, 0, 1, 1,
0.02555584, -0.6197589, 3.626086, 1, 0, 0, 1, 1,
0.02852782, -0.6529953, 3.948899, 1, 0, 0, 1, 1,
0.02900212, -2.835662, 2.983165, 0, 0, 0, 1, 1,
0.03012513, 0.181187, -2.196205, 0, 0, 0, 1, 1,
0.03629576, 1.315421, 1.779203, 0, 0, 0, 1, 1,
0.03633623, -0.007592383, 0.7942641, 0, 0, 0, 1, 1,
0.04347491, 0.4875828, 0.7678367, 0, 0, 0, 1, 1,
0.04437825, -0.1835517, 3.085151, 0, 0, 0, 1, 1,
0.04622077, -0.2923591, 2.924657, 0, 0, 0, 1, 1,
0.04654565, -0.4331393, 2.045375, 1, 1, 1, 1, 1,
0.0490366, -1.722782, 2.678266, 1, 1, 1, 1, 1,
0.05235068, 1.761151, -0.5555549, 1, 1, 1, 1, 1,
0.05401913, 0.9842349, -0.3218793, 1, 1, 1, 1, 1,
0.05512174, 0.6139009, 0.7502329, 1, 1, 1, 1, 1,
0.05916106, 1.676906, -0.8200476, 1, 1, 1, 1, 1,
0.06029185, -0.1385654, 3.623983, 1, 1, 1, 1, 1,
0.06081059, 0.7985235, 0.2059608, 1, 1, 1, 1, 1,
0.06383264, 0.9456687, 1.566251, 1, 1, 1, 1, 1,
0.07084309, 0.5388667, 0.1855783, 1, 1, 1, 1, 1,
0.07386785, -0.0380112, 3.92682, 1, 1, 1, 1, 1,
0.07541174, 0.02394574, 2.208255, 1, 1, 1, 1, 1,
0.07547697, 0.4680865, 1.073173, 1, 1, 1, 1, 1,
0.07750815, -0.2574607, 2.888865, 1, 1, 1, 1, 1,
0.07889846, -1.584944, 1.960884, 1, 1, 1, 1, 1,
0.08116647, 0.6411917, 0.3085076, 0, 0, 1, 1, 1,
0.0857263, -0.6148277, 1.806755, 1, 0, 0, 1, 1,
0.08612701, 0.08264338, -0.7658094, 1, 0, 0, 1, 1,
0.08778939, 0.1895783, 1.239661, 1, 0, 0, 1, 1,
0.0879164, -0.05570194, 1.994091, 1, 0, 0, 1, 1,
0.08843854, -0.457532, 3.368064, 1, 0, 0, 1, 1,
0.08855571, 0.6925763, 1.41534, 0, 0, 0, 1, 1,
0.08938456, -0.3506603, 2.341876, 0, 0, 0, 1, 1,
0.09096309, -0.4695492, 3.372773, 0, 0, 0, 1, 1,
0.09142267, -0.3644438, 2.583229, 0, 0, 0, 1, 1,
0.09142838, 0.1059444, -0.007129279, 0, 0, 0, 1, 1,
0.09156603, -0.6121411, 3.249712, 0, 0, 0, 1, 1,
0.09212362, -0.09461805, 1.169106, 0, 0, 0, 1, 1,
0.09397868, 1.102053, 0.02098433, 1, 1, 1, 1, 1,
0.09630875, 0.07012131, -0.08927704, 1, 1, 1, 1, 1,
0.1028824, 0.5547226, 0.4825053, 1, 1, 1, 1, 1,
0.1042635, -0.7672629, 2.887831, 1, 1, 1, 1, 1,
0.1098472, -1.360956, 1.638601, 1, 1, 1, 1, 1,
0.1128229, 0.08488753, 0.2390088, 1, 1, 1, 1, 1,
0.1140766, -0.4913779, 3.538815, 1, 1, 1, 1, 1,
0.118917, 0.02377724, 1.951364, 1, 1, 1, 1, 1,
0.1207212, 0.2240678, -0.3399945, 1, 1, 1, 1, 1,
0.1286021, -0.8887912, 3.362864, 1, 1, 1, 1, 1,
0.1287722, -0.3256944, 2.029551, 1, 1, 1, 1, 1,
0.1310929, 0.3339606, 0.3000786, 1, 1, 1, 1, 1,
0.1327075, -0.2591838, 2.288337, 1, 1, 1, 1, 1,
0.1372291, 1.078356, 0.1216904, 1, 1, 1, 1, 1,
0.1374288, -0.8218185, 3.485792, 1, 1, 1, 1, 1,
0.1376939, -0.09175134, 1.675091, 0, 0, 1, 1, 1,
0.1386925, -1.75677, 3.979765, 1, 0, 0, 1, 1,
0.1478548, 1.264351, 0.897241, 1, 0, 0, 1, 1,
0.1489012, 1.692639, -0.03502247, 1, 0, 0, 1, 1,
0.1498915, 0.2483118, 0.2343815, 1, 0, 0, 1, 1,
0.1520426, -1.870145, 2.855634, 1, 0, 0, 1, 1,
0.15294, -0.3947721, 2.139632, 0, 0, 0, 1, 1,
0.1537033, -0.869047, 2.484986, 0, 0, 0, 1, 1,
0.1599358, -1.105855, 2.511782, 0, 0, 0, 1, 1,
0.1602118, 0.3839965, 0.8962008, 0, 0, 0, 1, 1,
0.1607728, -0.1313361, 2.333828, 0, 0, 0, 1, 1,
0.1652968, -1.459373, 4.293783, 0, 0, 0, 1, 1,
0.1655619, -0.4472783, 3.120917, 0, 0, 0, 1, 1,
0.1678449, -0.4726457, 1.853891, 1, 1, 1, 1, 1,
0.1684374, 1.102664, 0.01507095, 1, 1, 1, 1, 1,
0.1717595, -0.3227752, 2.787661, 1, 1, 1, 1, 1,
0.1781671, -0.2527726, 1.500239, 1, 1, 1, 1, 1,
0.1801524, 1.725453, 2.28556, 1, 1, 1, 1, 1,
0.1848586, -0.02937562, 1.89916, 1, 1, 1, 1, 1,
0.1892379, -1.367017, 2.795893, 1, 1, 1, 1, 1,
0.1893085, 1.046952, -1.269896, 1, 1, 1, 1, 1,
0.1904366, -0.8523834, 2.51252, 1, 1, 1, 1, 1,
0.190769, 0.6671648, 0.31265, 1, 1, 1, 1, 1,
0.1913943, -0.599484, 1.919176, 1, 1, 1, 1, 1,
0.1918774, -1.871569, 4.319683, 1, 1, 1, 1, 1,
0.1939398, -0.390507, 1.300834, 1, 1, 1, 1, 1,
0.1953983, 0.9033333, 1.828418, 1, 1, 1, 1, 1,
0.2002794, 1.150809, 0.7644932, 1, 1, 1, 1, 1,
0.200645, 0.6302372, -0.9973696, 0, 0, 1, 1, 1,
0.2013366, 0.9098254, 0.009273518, 1, 0, 0, 1, 1,
0.2029431, 0.3060279, 1.333565, 1, 0, 0, 1, 1,
0.2075234, 1.031801, 1.759004, 1, 0, 0, 1, 1,
0.209458, -1.541263, 2.760867, 1, 0, 0, 1, 1,
0.2094993, 0.2641128, 1.191525, 1, 0, 0, 1, 1,
0.2106557, -0.2313785, 2.679147, 0, 0, 0, 1, 1,
0.2108896, -0.5249487, 4.159863, 0, 0, 0, 1, 1,
0.2133385, -0.6229498, 2.373707, 0, 0, 0, 1, 1,
0.2182302, -0.6819941, 1.890903, 0, 0, 0, 1, 1,
0.219339, 1.449364, -0.3607288, 0, 0, 0, 1, 1,
0.2206024, -0.277308, 3.887465, 0, 0, 0, 1, 1,
0.2315393, -1.365803, 4.34259, 0, 0, 0, 1, 1,
0.2350287, 1.483896, -0.6150035, 1, 1, 1, 1, 1,
0.2368844, 0.2703354, 2.106901, 1, 1, 1, 1, 1,
0.2455895, 0.2450667, 0.2054283, 1, 1, 1, 1, 1,
0.2456127, -1.05515, 2.342347, 1, 1, 1, 1, 1,
0.2472248, -1.092179, 3.484072, 1, 1, 1, 1, 1,
0.2499675, -0.1512164, 2.022052, 1, 1, 1, 1, 1,
0.2508273, 0.3527703, 0.1287112, 1, 1, 1, 1, 1,
0.257666, -0.6294286, 3.943201, 1, 1, 1, 1, 1,
0.2581848, -1.865764, 2.425204, 1, 1, 1, 1, 1,
0.2610677, 0.6007659, 1.87472, 1, 1, 1, 1, 1,
0.2629358, 1.702344, -0.7088774, 1, 1, 1, 1, 1,
0.2639797, -0.009945479, 0.8822172, 1, 1, 1, 1, 1,
0.2654725, 0.3104967, 0.9078351, 1, 1, 1, 1, 1,
0.2658454, 2.515996, 1.09966, 1, 1, 1, 1, 1,
0.2723337, 0.2889707, 1.052356, 1, 1, 1, 1, 1,
0.2725708, 0.2113912, 0.8399365, 0, 0, 1, 1, 1,
0.2748834, -0.3866594, 4.333055, 1, 0, 0, 1, 1,
0.2751129, 1.347679, 0.136185, 1, 0, 0, 1, 1,
0.2784544, -1.296572, 3.68033, 1, 0, 0, 1, 1,
0.2842339, -0.8546279, 2.392677, 1, 0, 0, 1, 1,
0.2858138, -1.931419, 4.222924, 1, 0, 0, 1, 1,
0.2897577, 0.373907, 1.154455, 0, 0, 0, 1, 1,
0.2908301, -1.019117, 2.326646, 0, 0, 0, 1, 1,
0.2911834, -0.06319844, 1.300839, 0, 0, 0, 1, 1,
0.2932485, -0.7746043, 4.51445, 0, 0, 0, 1, 1,
0.2947937, -1.443781, 3.54108, 0, 0, 0, 1, 1,
0.2988379, 0.596957, -0.2383684, 0, 0, 0, 1, 1,
0.2990341, 0.7349984, -1.119991, 0, 0, 0, 1, 1,
0.3016744, -1.001471, 2.712319, 1, 1, 1, 1, 1,
0.3054751, 0.4974545, 1.942119, 1, 1, 1, 1, 1,
0.3081368, 1.776991, 0.03883488, 1, 1, 1, 1, 1,
0.3113915, 0.2117843, 1.070927, 1, 1, 1, 1, 1,
0.3114245, -0.7668692, 2.183652, 1, 1, 1, 1, 1,
0.3116769, -0.9350681, 3.47609, 1, 1, 1, 1, 1,
0.313221, -0.1757542, 0.7556449, 1, 1, 1, 1, 1,
0.3141795, -0.8517226, 3.293967, 1, 1, 1, 1, 1,
0.3182573, 2.038778, -0.1257683, 1, 1, 1, 1, 1,
0.3208462, 0.320896, 0.7007356, 1, 1, 1, 1, 1,
0.3216213, -0.2563489, 1.928834, 1, 1, 1, 1, 1,
0.3237126, 0.3772494, 1.3442, 1, 1, 1, 1, 1,
0.3263697, -1.192068, 3.915399, 1, 1, 1, 1, 1,
0.3332097, 0.5534671, 0.4917343, 1, 1, 1, 1, 1,
0.3336419, 0.2594135, 1.299329, 1, 1, 1, 1, 1,
0.3358211, -0.7150635, 2.18545, 0, 0, 1, 1, 1,
0.3372548, -1.014618, 4.336364, 1, 0, 0, 1, 1,
0.3396138, -0.1081449, 2.04592, 1, 0, 0, 1, 1,
0.3452334, -0.006698059, 0.9556031, 1, 0, 0, 1, 1,
0.3456185, -0.1478321, 2.329225, 1, 0, 0, 1, 1,
0.3469825, 0.4887332, 0.1234412, 1, 0, 0, 1, 1,
0.3482327, 1.197123, 0.4557258, 0, 0, 0, 1, 1,
0.3504455, 0.8867735, 0.105617, 0, 0, 0, 1, 1,
0.3513493, -0.01124336, 1.607394, 0, 0, 0, 1, 1,
0.3532623, 0.07108825, 1.606475, 0, 0, 0, 1, 1,
0.3537453, -0.6513774, 2.257268, 0, 0, 0, 1, 1,
0.357701, -0.4938846, 3.136479, 0, 0, 0, 1, 1,
0.3596665, -0.39732, 3.806705, 0, 0, 0, 1, 1,
0.3636178, -0.3973271, 2.592082, 1, 1, 1, 1, 1,
0.3636181, -0.7045618, 2.743608, 1, 1, 1, 1, 1,
0.3651243, -0.2203465, 2.135893, 1, 1, 1, 1, 1,
0.3661561, -1.638516, 3.465542, 1, 1, 1, 1, 1,
0.3676374, -0.02537925, 2.798359, 1, 1, 1, 1, 1,
0.3699663, 0.2623832, 2.215341, 1, 1, 1, 1, 1,
0.3709684, 1.370206, -0.6131334, 1, 1, 1, 1, 1,
0.3773341, -1.098646, 1.889043, 1, 1, 1, 1, 1,
0.3784336, -1.135176, 2.765549, 1, 1, 1, 1, 1,
0.3820113, 0.2592716, 2.872761, 1, 1, 1, 1, 1,
0.3889264, -0.163807, 2.660677, 1, 1, 1, 1, 1,
0.3914239, 0.6950345, 1.326507, 1, 1, 1, 1, 1,
0.3948672, -0.3984696, 0.433333, 1, 1, 1, 1, 1,
0.3952841, -0.1587376, 2.071618, 1, 1, 1, 1, 1,
0.3953437, -0.5668898, 1.636616, 1, 1, 1, 1, 1,
0.3961598, 1.483273, -0.4057321, 0, 0, 1, 1, 1,
0.4004895, -0.5191101, 3.236293, 1, 0, 0, 1, 1,
0.4019333, -1.467012, 3.555488, 1, 0, 0, 1, 1,
0.4072003, -0.4796876, 1.411088, 1, 0, 0, 1, 1,
0.4094401, 0.6250441, 1.947537, 1, 0, 0, 1, 1,
0.4099473, -0.3698582, 2.107832, 1, 0, 0, 1, 1,
0.4112216, 0.1001559, 1.016198, 0, 0, 0, 1, 1,
0.4168357, 0.1436027, 1.724095, 0, 0, 0, 1, 1,
0.4190713, 0.1584383, 1.430558, 0, 0, 0, 1, 1,
0.4273763, 0.9527916, -0.09552189, 0, 0, 0, 1, 1,
0.4274246, 0.3363111, 1.821165, 0, 0, 0, 1, 1,
0.4289417, -0.2828229, 1.89732, 0, 0, 0, 1, 1,
0.4316781, -0.6303519, 3.010713, 0, 0, 0, 1, 1,
0.4364767, 0.2595955, 1.974594, 1, 1, 1, 1, 1,
0.4423739, 1.347113, 1.339672, 1, 1, 1, 1, 1,
0.4462908, -2.20823, 2.785906, 1, 1, 1, 1, 1,
0.4465002, 1.969763, -0.8401551, 1, 1, 1, 1, 1,
0.4539219, -0.2068267, 1.448169, 1, 1, 1, 1, 1,
0.4561107, 1.070896, -1.095922, 1, 1, 1, 1, 1,
0.456587, 0.6276828, -0.375784, 1, 1, 1, 1, 1,
0.4595576, 1.39704, 1.479235, 1, 1, 1, 1, 1,
0.4650554, 0.5499391, 0.5443226, 1, 1, 1, 1, 1,
0.469823, -0.3242013, 2.451791, 1, 1, 1, 1, 1,
0.4712459, 1.564151, 0.5975354, 1, 1, 1, 1, 1,
0.4737634, -0.3581016, 1.770176, 1, 1, 1, 1, 1,
0.4738733, -0.07690722, 1.358855, 1, 1, 1, 1, 1,
0.4755389, 0.6126232, -1.73832, 1, 1, 1, 1, 1,
0.4789947, -1.665838, 1.11734, 1, 1, 1, 1, 1,
0.481451, 0.5170721, 0.05187533, 0, 0, 1, 1, 1,
0.4835855, 1.109148, 1.734174, 1, 0, 0, 1, 1,
0.4848526, 1.390157, -1.731486, 1, 0, 0, 1, 1,
0.4920836, 2.470421, 1.083563, 1, 0, 0, 1, 1,
0.4943485, 1.912774, 1.993749, 1, 0, 0, 1, 1,
0.501801, -0.1996785, 1.383226, 1, 0, 0, 1, 1,
0.5024378, 0.6669822, -0.4383404, 0, 0, 0, 1, 1,
0.5033674, -0.9911492, 3.099, 0, 0, 0, 1, 1,
0.5044191, 0.5321958, -0.1116049, 0, 0, 0, 1, 1,
0.5057633, 0.4528806, -0.5291454, 0, 0, 0, 1, 1,
0.5096982, -0.3414636, 1.994111, 0, 0, 0, 1, 1,
0.5120303, 0.5854357, 1.37174, 0, 0, 0, 1, 1,
0.5127084, 0.5352263, 0.2934222, 0, 0, 0, 1, 1,
0.517898, -0.1628322, 2.527173, 1, 1, 1, 1, 1,
0.5233028, 0.838683, 0.1344492, 1, 1, 1, 1, 1,
0.5257257, -0.632144, 2.430563, 1, 1, 1, 1, 1,
0.5375587, -0.02152301, 2.808363, 1, 1, 1, 1, 1,
0.5392457, 0.5349354, 2.040483, 1, 1, 1, 1, 1,
0.541779, -0.2361828, 1.324803, 1, 1, 1, 1, 1,
0.5428309, -0.5565897, 2.314344, 1, 1, 1, 1, 1,
0.5429765, -1.388041, 3.719849, 1, 1, 1, 1, 1,
0.5434021, 1.638265, -0.1498595, 1, 1, 1, 1, 1,
0.5434361, 0.7768451, -0.1024204, 1, 1, 1, 1, 1,
0.5464731, 0.849814, 0.8605543, 1, 1, 1, 1, 1,
0.5467437, -1.556941, 2.659692, 1, 1, 1, 1, 1,
0.551395, 1.544811, -2.221013, 1, 1, 1, 1, 1,
0.5514984, -0.2009509, 1.648225, 1, 1, 1, 1, 1,
0.5578535, 0.8746454, 0.7317916, 1, 1, 1, 1, 1,
0.5619338, 0.5543327, -0.416238, 0, 0, 1, 1, 1,
0.5689653, 0.06158904, -0.3017404, 1, 0, 0, 1, 1,
0.5697098, 0.01976154, 2.286974, 1, 0, 0, 1, 1,
0.569793, 0.6543378, -0.5118113, 1, 0, 0, 1, 1,
0.5702693, 1.051777, -1.149209, 1, 0, 0, 1, 1,
0.5733388, -0.6293088, 2.876528, 1, 0, 0, 1, 1,
0.575548, 1.391068, -0.5906073, 0, 0, 0, 1, 1,
0.5824139, 1.055273, 1.459566, 0, 0, 0, 1, 1,
0.5851631, -0.2852238, 3.893666, 0, 0, 0, 1, 1,
0.5879006, -1.641198, 3.916121, 0, 0, 0, 1, 1,
0.5917482, 0.8026742, 0.6063373, 0, 0, 0, 1, 1,
0.5938883, -0.9892771, 3.407256, 0, 0, 0, 1, 1,
0.5978436, -0.4981624, 3.67647, 0, 0, 0, 1, 1,
0.6009944, 0.2403611, 1.536474, 1, 1, 1, 1, 1,
0.6023551, -0.7541261, 3.001399, 1, 1, 1, 1, 1,
0.6032571, -0.08915246, 2.299228, 1, 1, 1, 1, 1,
0.6089004, -0.1391037, 1.629506, 1, 1, 1, 1, 1,
0.609054, -0.8096704, 2.555378, 1, 1, 1, 1, 1,
0.6116889, -0.7102141, 1.877356, 1, 1, 1, 1, 1,
0.6143116, 1.246968, -0.1530027, 1, 1, 1, 1, 1,
0.6165219, 0.7309985, -0.4133948, 1, 1, 1, 1, 1,
0.6171495, -0.1434992, 0.8136993, 1, 1, 1, 1, 1,
0.6175143, 1.090545, 1.84913, 1, 1, 1, 1, 1,
0.6274366, 0.9467002, 1.097862, 1, 1, 1, 1, 1,
0.6354159, -0.6656094, 1.91006, 1, 1, 1, 1, 1,
0.637495, 1.023146, 1.281455, 1, 1, 1, 1, 1,
0.6383814, -0.1569303, 1.604258, 1, 1, 1, 1, 1,
0.6417553, 0.03782383, 1.243688, 1, 1, 1, 1, 1,
0.643042, 0.1905974, 0.8076836, 0, 0, 1, 1, 1,
0.6437767, -0.7597827, 3.932464, 1, 0, 0, 1, 1,
0.647304, 1.357685, 0.8044294, 1, 0, 0, 1, 1,
0.6490576, -0.7905052, 1.957542, 1, 0, 0, 1, 1,
0.649904, 0.4788193, 1.06324, 1, 0, 0, 1, 1,
0.6515629, 0.2394195, 1.93847, 1, 0, 0, 1, 1,
0.6536986, 1.071576, 1.707537, 0, 0, 0, 1, 1,
0.6561413, 0.2822924, 0.8650287, 0, 0, 0, 1, 1,
0.662257, 0.357598, 0.7256344, 0, 0, 0, 1, 1,
0.6651224, -1.465303, 3.715339, 0, 0, 0, 1, 1,
0.6678433, 0.01236134, 2.599248, 0, 0, 0, 1, 1,
0.6754618, 0.5840483, 1.637276, 0, 0, 0, 1, 1,
0.6822234, 0.2901675, 0.1019439, 0, 0, 0, 1, 1,
0.6839069, 1.019603, 1.867855, 1, 1, 1, 1, 1,
0.6841258, -0.6131092, 1.916362, 1, 1, 1, 1, 1,
0.6851501, 0.3181515, 2.157847, 1, 1, 1, 1, 1,
0.6871489, 0.4035893, 2.416801, 1, 1, 1, 1, 1,
0.6935601, 0.1858541, 2.877863, 1, 1, 1, 1, 1,
0.6986392, 0.3068581, 2.064308, 1, 1, 1, 1, 1,
0.7025645, -0.128559, 0.8038516, 1, 1, 1, 1, 1,
0.7029821, -1.187913, 3.535471, 1, 1, 1, 1, 1,
0.7036264, -0.7235757, 1.529433, 1, 1, 1, 1, 1,
0.7071499, -1.793707, 2.894597, 1, 1, 1, 1, 1,
0.7073852, 0.5071967, -0.5646425, 1, 1, 1, 1, 1,
0.7094762, 0.8263918, -0.09125456, 1, 1, 1, 1, 1,
0.7095781, 1.103674, 0.4141006, 1, 1, 1, 1, 1,
0.7173339, 1.477258, -0.4732187, 1, 1, 1, 1, 1,
0.7176197, 1.16882, 0.7205793, 1, 1, 1, 1, 1,
0.7185057, -1.133877, 2.209652, 0, 0, 1, 1, 1,
0.7191957, 0.3147194, 0.04969739, 1, 0, 0, 1, 1,
0.7239133, 1.29367, -0.02969471, 1, 0, 0, 1, 1,
0.7252886, 0.137673, 0.635466, 1, 0, 0, 1, 1,
0.7261082, 1.138111, -0.444612, 1, 0, 0, 1, 1,
0.7264721, -0.1181654, 1.223849, 1, 0, 0, 1, 1,
0.7349513, -0.3160018, 0.2482884, 0, 0, 0, 1, 1,
0.7365826, 1.129575, 1.79945, 0, 0, 0, 1, 1,
0.7418923, 1.840362, 0.37615, 0, 0, 0, 1, 1,
0.742129, 1.831997, 1.868808, 0, 0, 0, 1, 1,
0.7435235, 2.04125, 0.1102976, 0, 0, 0, 1, 1,
0.7448934, -0.6415481, 3.485946, 0, 0, 0, 1, 1,
0.7529629, 1.192396, 0.4268256, 0, 0, 0, 1, 1,
0.7551156, 0.02076144, 2.13273, 1, 1, 1, 1, 1,
0.7581463, -1.065639, 2.13893, 1, 1, 1, 1, 1,
0.7591673, 0.1322084, 0.8695564, 1, 1, 1, 1, 1,
0.7633746, 0.8797835, 1.034135, 1, 1, 1, 1, 1,
0.7654223, 1.778128, 1.441697, 1, 1, 1, 1, 1,
0.7657067, 0.6064441, 0.5604342, 1, 1, 1, 1, 1,
0.7661667, -0.1003843, 0.781943, 1, 1, 1, 1, 1,
0.7668852, -0.4556181, 2.522272, 1, 1, 1, 1, 1,
0.7702971, -1.60237, 2.008448, 1, 1, 1, 1, 1,
0.77188, -1.779265, 1.848363, 1, 1, 1, 1, 1,
0.7846153, 1.092921, 0.7112539, 1, 1, 1, 1, 1,
0.7853935, 0.8641486, -1.759657, 1, 1, 1, 1, 1,
0.792518, 1.213976, 2.350137, 1, 1, 1, 1, 1,
0.7945474, -0.6881493, 1.038675, 1, 1, 1, 1, 1,
0.7957128, 1.950198, -0.3540705, 1, 1, 1, 1, 1,
0.7985463, -2.306864, 0.7939106, 0, 0, 1, 1, 1,
0.7989689, 1.419508, -0.1714079, 1, 0, 0, 1, 1,
0.8029353, -0.736146, 2.341546, 1, 0, 0, 1, 1,
0.8123891, 0.9056667, 1.584561, 1, 0, 0, 1, 1,
0.8145494, 1.244471, 1.247547, 1, 0, 0, 1, 1,
0.8156978, -2.027581, 2.322011, 1, 0, 0, 1, 1,
0.8159873, 1.429041, 1.21317, 0, 0, 0, 1, 1,
0.8213876, 0.4996586, 1.362968, 0, 0, 0, 1, 1,
0.8224822, 0.5933732, 0.4894839, 0, 0, 0, 1, 1,
0.8253844, -1.958908, 2.739902, 0, 0, 0, 1, 1,
0.8284427, 0.5005586, 2.994338, 0, 0, 0, 1, 1,
0.8297578, 0.9246499, 0.5250618, 0, 0, 0, 1, 1,
0.8367691, -0.5309442, 3.84611, 0, 0, 0, 1, 1,
0.8368041, -0.03101384, 2.063813, 1, 1, 1, 1, 1,
0.8445773, 0.4183411, 1.685167, 1, 1, 1, 1, 1,
0.8458939, -1.023317, 3.239468, 1, 1, 1, 1, 1,
0.850017, -0.7831697, 3.276202, 1, 1, 1, 1, 1,
0.8533354, 0.9054437, 1.383845, 1, 1, 1, 1, 1,
0.855225, 1.323949, 0.2811701, 1, 1, 1, 1, 1,
0.8552424, 0.1809375, 0.267469, 1, 1, 1, 1, 1,
0.8564475, -0.9277447, 2.432253, 1, 1, 1, 1, 1,
0.857163, -0.1797433, 2.233169, 1, 1, 1, 1, 1,
0.858771, 0.1197074, 0.7206895, 1, 1, 1, 1, 1,
0.8605011, 0.1717791, 2.340792, 1, 1, 1, 1, 1,
0.8624853, 0.520773, -0.4338205, 1, 1, 1, 1, 1,
0.8650485, 1.403813, -1.386334, 1, 1, 1, 1, 1,
0.868622, -2.218907, 3.986329, 1, 1, 1, 1, 1,
0.8711683, -0.9792518, 1.517603, 1, 1, 1, 1, 1,
0.8756982, -0.6397092, 0.8173084, 0, 0, 1, 1, 1,
0.8772261, 0.4362454, -0.06720381, 1, 0, 0, 1, 1,
0.8822244, -2.219686, 3.352908, 1, 0, 0, 1, 1,
0.8822837, 0.1412573, 0.9083719, 1, 0, 0, 1, 1,
0.8897905, 0.6044836, 1.968183, 1, 0, 0, 1, 1,
0.8898388, 1.428144, 0.6823606, 1, 0, 0, 1, 1,
0.8959217, -1.046802, 1.705559, 0, 0, 0, 1, 1,
0.8972436, 1.402977, -1.007509, 0, 0, 0, 1, 1,
0.898994, 1.070875, -1.325664, 0, 0, 0, 1, 1,
0.9018038, -0.2425987, 2.56008, 0, 0, 0, 1, 1,
0.9018341, 0.1149612, 1.145347, 0, 0, 0, 1, 1,
0.9080542, -0.6029856, 2.197288, 0, 0, 0, 1, 1,
0.9083243, 0.08752758, 1.08986, 0, 0, 0, 1, 1,
0.9089297, -1.474262, 3.357753, 1, 1, 1, 1, 1,
0.9112933, -2.7076, 2.535393, 1, 1, 1, 1, 1,
0.9146572, 0.1657619, 1.648604, 1, 1, 1, 1, 1,
0.915728, 1.799661, 0.4034148, 1, 1, 1, 1, 1,
0.9188687, -0.1636726, 2.106864, 1, 1, 1, 1, 1,
0.9189668, -0.3530287, 2.183856, 1, 1, 1, 1, 1,
0.9229049, -1.584473, 2.727197, 1, 1, 1, 1, 1,
0.9258546, -0.8350936, 3.812982, 1, 1, 1, 1, 1,
0.9262375, -1.140858, 4.113779, 1, 1, 1, 1, 1,
0.9301466, 2.469752, 0.5104112, 1, 1, 1, 1, 1,
0.9316705, -0.452291, 3.250993, 1, 1, 1, 1, 1,
0.9397717, -1.253657, 3.363189, 1, 1, 1, 1, 1,
0.9402605, -0.8239435, 2.106771, 1, 1, 1, 1, 1,
0.9407603, 0.7052046, 1.565876, 1, 1, 1, 1, 1,
0.9427752, 0.7942622, 2.396662, 1, 1, 1, 1, 1,
0.9446355, 0.6179594, 3.568428, 0, 0, 1, 1, 1,
0.9490672, 0.01113346, 2.256096, 1, 0, 0, 1, 1,
0.9512337, -0.6612651, 3.121859, 1, 0, 0, 1, 1,
0.9573181, -0.2766397, 3.470259, 1, 0, 0, 1, 1,
0.9593694, 0.8319946, 1.632541, 1, 0, 0, 1, 1,
0.9599088, -0.1374891, 2.671005, 1, 0, 0, 1, 1,
0.9611515, -1.136762, 2.91979, 0, 0, 0, 1, 1,
0.9633981, 0.8357574, 1.836754, 0, 0, 0, 1, 1,
0.9739606, 0.3733211, 1.710781, 0, 0, 0, 1, 1,
0.9837365, -0.8595123, 1.788375, 0, 0, 0, 1, 1,
0.9860843, 0.98698, 1.22312, 0, 0, 0, 1, 1,
0.9872454, -0.02467724, 1.021509, 0, 0, 0, 1, 1,
0.9878592, 0.1130397, 0.3769052, 0, 0, 0, 1, 1,
0.992467, -0.1944477, 3.670007, 1, 1, 1, 1, 1,
0.9944471, -0.07234583, 2.730083, 1, 1, 1, 1, 1,
1.00677, 1.142305, 1.931978, 1, 1, 1, 1, 1,
1.016925, 1.422677, 1.898428, 1, 1, 1, 1, 1,
1.035988, 0.8645674, 2.421628, 1, 1, 1, 1, 1,
1.038411, -0.3693783, 2.446229, 1, 1, 1, 1, 1,
1.051703, 0.5297681, 0.9875721, 1, 1, 1, 1, 1,
1.052218, 1.252844, -1.245045, 1, 1, 1, 1, 1,
1.06048, -0.7689115, 2.070947, 1, 1, 1, 1, 1,
1.074105, -2.44255, 4.02829, 1, 1, 1, 1, 1,
1.089828, 2.558623, 2.527538, 1, 1, 1, 1, 1,
1.092577, -1.241941, 2.832899, 1, 1, 1, 1, 1,
1.097456, -0.2133922, 2.876738, 1, 1, 1, 1, 1,
1.101102, -0.6162016, 1.388695, 1, 1, 1, 1, 1,
1.10438, 1.323008, 1.759145, 1, 1, 1, 1, 1,
1.107415, 0.5777506, 0.2586886, 0, 0, 1, 1, 1,
1.109224, 1.230293, 2.124661, 1, 0, 0, 1, 1,
1.109439, 1.408672, 0.4609328, 1, 0, 0, 1, 1,
1.110849, -0.8548381, 1.887855, 1, 0, 0, 1, 1,
1.123887, 1.432897, 2.256689, 1, 0, 0, 1, 1,
1.125978, 0.6915442, 0.8170921, 1, 0, 0, 1, 1,
1.138292, 1.177579, 0.3899227, 0, 0, 0, 1, 1,
1.138548, 2.215031, 2.010274, 0, 0, 0, 1, 1,
1.140559, 0.02534044, 2.484212, 0, 0, 0, 1, 1,
1.141929, -0.2447305, 2.015668, 0, 0, 0, 1, 1,
1.14212, -2.452343, 3.124905, 0, 0, 0, 1, 1,
1.147881, -0.3775782, -0.1530289, 0, 0, 0, 1, 1,
1.148793, -0.7105789, 1.418207, 0, 0, 0, 1, 1,
1.164277, 0.657326, 1.676689, 1, 1, 1, 1, 1,
1.16433, 0.5687105, 1.966236, 1, 1, 1, 1, 1,
1.168982, 1.124688, 0.5717964, 1, 1, 1, 1, 1,
1.169584, 1.083198, 0.1433634, 1, 1, 1, 1, 1,
1.190104, -0.8847659, 3.825803, 1, 1, 1, 1, 1,
1.197077, -1.204763, 2.819766, 1, 1, 1, 1, 1,
1.199028, -1.15452, 1.303152, 1, 1, 1, 1, 1,
1.202936, 1.597974, 1.263198, 1, 1, 1, 1, 1,
1.217027, -0.5627207, 1.558338, 1, 1, 1, 1, 1,
1.218035, 0.3806629, 2.082032, 1, 1, 1, 1, 1,
1.218101, 0.2240351, 2.061753, 1, 1, 1, 1, 1,
1.22067, 1.270366, 1.53999, 1, 1, 1, 1, 1,
1.226511, 1.060221, 2.110779, 1, 1, 1, 1, 1,
1.230346, -0.7663974, 1.906063, 1, 1, 1, 1, 1,
1.230785, -1.90546, 2.799206, 1, 1, 1, 1, 1,
1.242273, -1.763276, 2.748663, 0, 0, 1, 1, 1,
1.242278, -0.9975868, 1.447335, 1, 0, 0, 1, 1,
1.249841, -0.7390069, 3.643544, 1, 0, 0, 1, 1,
1.263657, 0.5874956, 0.4514259, 1, 0, 0, 1, 1,
1.275318, 1.289159, 1.219738, 1, 0, 0, 1, 1,
1.28329, 0.6429664, 1.434142, 1, 0, 0, 1, 1,
1.302271, -0.9902599, 1.892072, 0, 0, 0, 1, 1,
1.314487, 0.6131659, 2.851498, 0, 0, 0, 1, 1,
1.325816, 0.8021597, -1.063389, 0, 0, 0, 1, 1,
1.328535, -1.130506, 2.010572, 0, 0, 0, 1, 1,
1.332814, 1.277761, 0.5971153, 0, 0, 0, 1, 1,
1.338952, -0.03169602, 1.751478, 0, 0, 0, 1, 1,
1.33908, 0.5664976, -0.3116905, 0, 0, 0, 1, 1,
1.340469, -2.053643, 1.960839, 1, 1, 1, 1, 1,
1.345108, -0.2275019, 1.181117, 1, 1, 1, 1, 1,
1.34745, -1.18253, 4.026044, 1, 1, 1, 1, 1,
1.348099, -1.631683, 1.640414, 1, 1, 1, 1, 1,
1.349133, -1.796051, 0.9177962, 1, 1, 1, 1, 1,
1.358872, 0.3779547, 0.7504595, 1, 1, 1, 1, 1,
1.360334, 0.3235743, 2.312855, 1, 1, 1, 1, 1,
1.362329, 0.2259137, 2.804084, 1, 1, 1, 1, 1,
1.373131, -1.533111, 1.419984, 1, 1, 1, 1, 1,
1.374266, 0.04440597, 1.8734, 1, 1, 1, 1, 1,
1.374297, 1.572939, -0.4296898, 1, 1, 1, 1, 1,
1.385436, 0.339041, 0.04274361, 1, 1, 1, 1, 1,
1.388007, -1.296358, 0.688908, 1, 1, 1, 1, 1,
1.391984, -1.27184, 1.248921, 1, 1, 1, 1, 1,
1.395338, -0.8326576, 2.567981, 1, 1, 1, 1, 1,
1.396149, -0.1736577, 0.8753747, 0, 0, 1, 1, 1,
1.399775, -0.9577162, 1.394306, 1, 0, 0, 1, 1,
1.407046, 1.808583, -1.829437, 1, 0, 0, 1, 1,
1.414253, 1.826365, 0.1947513, 1, 0, 0, 1, 1,
1.428637, 1.114731, 1.574478, 1, 0, 0, 1, 1,
1.439091, 0.1250489, 0.3575813, 1, 0, 0, 1, 1,
1.444004, 0.481641, 3.450575, 0, 0, 0, 1, 1,
1.448773, 0.334761, 0.2152844, 0, 0, 0, 1, 1,
1.458643, -0.4575461, 1.957901, 0, 0, 0, 1, 1,
1.461082, -0.6202775, 3.000936, 0, 0, 0, 1, 1,
1.478209, -1.252016, 2.447767, 0, 0, 0, 1, 1,
1.482699, 2.017825, 0.9772353, 0, 0, 0, 1, 1,
1.492838, -1.059694, 2.734768, 0, 0, 0, 1, 1,
1.507561, 1.903323, 1.164078, 1, 1, 1, 1, 1,
1.524388, -0.5755247, 1.706082, 1, 1, 1, 1, 1,
1.556956, -0.6343668, 2.642615, 1, 1, 1, 1, 1,
1.57012, -0.1656468, 1.846812, 1, 1, 1, 1, 1,
1.582514, -0.123594, 2.047963, 1, 1, 1, 1, 1,
1.595556, -0.5280252, 4.05269, 1, 1, 1, 1, 1,
1.600454, -1.000733, 3.513688, 1, 1, 1, 1, 1,
1.621878, -1.062207, 2.223419, 1, 1, 1, 1, 1,
1.627136, 2.243339, -0.1156973, 1, 1, 1, 1, 1,
1.628808, -0.6216235, 1.687883, 1, 1, 1, 1, 1,
1.631231, 0.4186631, 1.223663, 1, 1, 1, 1, 1,
1.631433, 0.2867806, 1.054792, 1, 1, 1, 1, 1,
1.635981, 0.7319555, 1.150185, 1, 1, 1, 1, 1,
1.638756, 0.7804548, 0.5021028, 1, 1, 1, 1, 1,
1.642752, 0.3909298, 1.309395, 1, 1, 1, 1, 1,
1.648178, -0.2145665, 2.745509, 0, 0, 1, 1, 1,
1.653413, 0.07041711, 0.706615, 1, 0, 0, 1, 1,
1.654501, 0.7415099, 1.312743, 1, 0, 0, 1, 1,
1.661623, 0.1348804, 0.4170323, 1, 0, 0, 1, 1,
1.668212, -1.418526, 2.700583, 1, 0, 0, 1, 1,
1.683721, -0.772128, 1.252497, 1, 0, 0, 1, 1,
1.705973, 0.8938395, 0.2661695, 0, 0, 0, 1, 1,
1.711872, 0.2871306, 0.109033, 0, 0, 0, 1, 1,
1.714097, 2.838108, -0.5541648, 0, 0, 0, 1, 1,
1.723092, 1.771142, -1.681845, 0, 0, 0, 1, 1,
1.742914, 1.455738, 0.9146279, 0, 0, 0, 1, 1,
1.745044, 1.446548, 1.224689, 0, 0, 0, 1, 1,
1.791874, -0.09342912, 1.681599, 0, 0, 0, 1, 1,
1.822322, 1.323003, 1.964909, 1, 1, 1, 1, 1,
1.833159, 1.116673, 0.4420524, 1, 1, 1, 1, 1,
1.838032, 1.316983, 0.04899541, 1, 1, 1, 1, 1,
1.839292, -0.6725342, 1.969244, 1, 1, 1, 1, 1,
1.867316, 1.387216, 1.407954, 1, 1, 1, 1, 1,
1.869127, -2.454431, 3.611872, 1, 1, 1, 1, 1,
1.876906, 0.4539556, 1.434229, 1, 1, 1, 1, 1,
1.891486, -0.6582818, 1.733371, 1, 1, 1, 1, 1,
1.904228, 2.214906, 1.732026, 1, 1, 1, 1, 1,
1.916611, 0.2221785, 2.195283, 1, 1, 1, 1, 1,
1.95233, -1.318565, 2.281817, 1, 1, 1, 1, 1,
1.977898, 1.67035, -0.03024775, 1, 1, 1, 1, 1,
2.019852, -1.41138, 2.31599, 1, 1, 1, 1, 1,
2.050943, 0.6245891, 0.9533668, 1, 1, 1, 1, 1,
2.053306, 1.105835, 0.3133319, 1, 1, 1, 1, 1,
2.083702, -0.6821661, 1.758564, 0, 0, 1, 1, 1,
2.134073, 1.464826, 1.006111, 1, 0, 0, 1, 1,
2.220116, -1.823893, 2.967072, 1, 0, 0, 1, 1,
2.234389, -2.953293, 2.130326, 1, 0, 0, 1, 1,
2.276368, 1.394156, 1.317106, 1, 0, 0, 1, 1,
2.284416, -0.2300535, 3.463389, 1, 0, 0, 1, 1,
2.298787, -0.5071222, -0.763077, 0, 0, 0, 1, 1,
2.328752, 2.216741, -0.3307635, 0, 0, 0, 1, 1,
2.370097, 1.860837, 1.84523, 0, 0, 0, 1, 1,
2.370509, 1.070633, 1.841125, 0, 0, 0, 1, 1,
2.47635, 1.511147, 0.2369958, 0, 0, 0, 1, 1,
2.547389, 2.014978, -0.00351888, 0, 0, 0, 1, 1,
2.607944, 1.637319, 0.8572206, 0, 0, 0, 1, 1,
2.666167, 2.150618, 2.433804, 1, 1, 1, 1, 1,
2.702969, -2.818308, 3.128452, 1, 1, 1, 1, 1,
2.810673, -0.2576238, 0.4956802, 1, 1, 1, 1, 1,
3.070879, 1.018134, 0.9501427, 1, 1, 1, 1, 1,
3.132379, -0.2431022, 2.971095, 1, 1, 1, 1, 1,
3.217267, -1.713282, 1.712716, 1, 1, 1, 1, 1,
3.246132, -0.4245132, -0.2556836, 1, 1, 1, 1, 1
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
var radius = 9.345859;
var distance = 32.82693;
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
mvMatrix.translate( -0.08393836, 0.1653199, 0.296015 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.82693);
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
