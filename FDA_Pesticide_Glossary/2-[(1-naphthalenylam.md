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
-2.954057, -0.1863775, -2.845696, 1, 0, 0, 1,
-2.827112, 0.8535139, -1.83744, 1, 0.007843138, 0, 1,
-2.72478, -1.324797, -2.865605, 1, 0.01176471, 0, 1,
-2.613725, 0.2719714, -2.155016, 1, 0.01960784, 0, 1,
-2.540013, 2.219302, -0.3247361, 1, 0.02352941, 0, 1,
-2.520706, -0.4580262, -1.036819, 1, 0.03137255, 0, 1,
-2.498798, -0.2022423, -2.425544, 1, 0.03529412, 0, 1,
-2.488868, -0.3362889, -1.240244, 1, 0.04313726, 0, 1,
-2.485731, -0.3974588, -2.555157, 1, 0.04705882, 0, 1,
-2.407713, -1.488866, -0.6509374, 1, 0.05490196, 0, 1,
-2.301146, -0.3701544, -0.3688399, 1, 0.05882353, 0, 1,
-2.287577, -0.3733549, -3.429812, 1, 0.06666667, 0, 1,
-2.255427, 0.3598921, -2.301311, 1, 0.07058824, 0, 1,
-2.161653, 0.5788332, -1.343985, 1, 0.07843138, 0, 1,
-2.071709, 1.907776, -1.945276, 1, 0.08235294, 0, 1,
-2.04757, 0.05372194, -1.285606, 1, 0.09019608, 0, 1,
-2.026597, 0.2737099, -1.757909, 1, 0.09411765, 0, 1,
-1.946503, -0.3164633, -3.265387, 1, 0.1019608, 0, 1,
-1.888775, 1.189346, -2.579039, 1, 0.1098039, 0, 1,
-1.880857, -0.06004551, -0.2530946, 1, 0.1137255, 0, 1,
-1.85295, 1.461997, -0.3570781, 1, 0.1215686, 0, 1,
-1.841731, -1.007948, -0.5303974, 1, 0.1254902, 0, 1,
-1.816183, 0.6201184, -1.134612, 1, 0.1333333, 0, 1,
-1.796221, -0.7771155, 0.2998626, 1, 0.1372549, 0, 1,
-1.788992, -0.9975759, -3.329152, 1, 0.145098, 0, 1,
-1.769282, -0.7609037, -1.77707, 1, 0.1490196, 0, 1,
-1.76284, 0.3685346, -0.5120258, 1, 0.1568628, 0, 1,
-1.759625, -1.185219, -2.899815, 1, 0.1607843, 0, 1,
-1.754978, -0.5051305, -3.226065, 1, 0.1686275, 0, 1,
-1.743743, 1.190439, -0.7402228, 1, 0.172549, 0, 1,
-1.741397, 0.2580875, 0.1758973, 1, 0.1803922, 0, 1,
-1.738371, -0.2090876, -0.4966457, 1, 0.1843137, 0, 1,
-1.735035, -0.4495163, -1.655817, 1, 0.1921569, 0, 1,
-1.726124, 1.206448, -1.434844, 1, 0.1960784, 0, 1,
-1.667689, 0.2528706, -3.086917, 1, 0.2039216, 0, 1,
-1.667027, -0.3736859, -1.625873, 1, 0.2117647, 0, 1,
-1.660784, 1.606077, -2.332189, 1, 0.2156863, 0, 1,
-1.624328, -0.979636, -1.235102, 1, 0.2235294, 0, 1,
-1.618471, 0.8079869, -0.715483, 1, 0.227451, 0, 1,
-1.605352, -0.7703354, -1.440708, 1, 0.2352941, 0, 1,
-1.581481, -0.8584872, -3.093137, 1, 0.2392157, 0, 1,
-1.57764, 0.636946, -0.3009244, 1, 0.2470588, 0, 1,
-1.559043, 0.1387217, -2.366321, 1, 0.2509804, 0, 1,
-1.557837, 0.08863697, -0.3291796, 1, 0.2588235, 0, 1,
-1.533611, -2.369444, -3.852996, 1, 0.2627451, 0, 1,
-1.529217, -0.08314736, -1.622295, 1, 0.2705882, 0, 1,
-1.526809, -0.2820933, -1.790793, 1, 0.2745098, 0, 1,
-1.521515, 0.3428319, -3.542807, 1, 0.282353, 0, 1,
-1.521077, -0.4554743, -2.438141, 1, 0.2862745, 0, 1,
-1.519583, -0.5502078, -2.446406, 1, 0.2941177, 0, 1,
-1.506797, -0.6148442, -2.177328, 1, 0.3019608, 0, 1,
-1.504671, -0.7755595, -3.255772, 1, 0.3058824, 0, 1,
-1.49453, -0.07551884, -3.025845, 1, 0.3137255, 0, 1,
-1.485076, 1.13835, -1.310945, 1, 0.3176471, 0, 1,
-1.476795, 1.605606, -1.376657, 1, 0.3254902, 0, 1,
-1.476196, 0.3248162, -1.869072, 1, 0.3294118, 0, 1,
-1.466388, -0.740289, -3.556912, 1, 0.3372549, 0, 1,
-1.463169, 1.308189, -0.1171935, 1, 0.3411765, 0, 1,
-1.463108, 1.354739, -0.5280997, 1, 0.3490196, 0, 1,
-1.462433, 1.13711, -1.926622, 1, 0.3529412, 0, 1,
-1.460108, -0.9971075, -0.7933469, 1, 0.3607843, 0, 1,
-1.453854, 1.639128, -1.308728, 1, 0.3647059, 0, 1,
-1.450654, -1.71374, -1.888598, 1, 0.372549, 0, 1,
-1.447592, -0.7664573, -2.00558, 1, 0.3764706, 0, 1,
-1.428955, 1.455, 1.536335, 1, 0.3843137, 0, 1,
-1.426198, 1.111654, -1.254457, 1, 0.3882353, 0, 1,
-1.423575, 0.01906789, -2.396827, 1, 0.3960784, 0, 1,
-1.412118, 0.1631461, -0.3877246, 1, 0.4039216, 0, 1,
-1.402066, -0.4249679, -0.1216908, 1, 0.4078431, 0, 1,
-1.401832, -1.4099, -2.127153, 1, 0.4156863, 0, 1,
-1.396153, 0.64827, -1.716127, 1, 0.4196078, 0, 1,
-1.395457, 2.121468, 0.09721696, 1, 0.427451, 0, 1,
-1.38374, 1.351861, -0.748415, 1, 0.4313726, 0, 1,
-1.378016, -0.9058953, -2.269657, 1, 0.4392157, 0, 1,
-1.366104, 1.166447, -0.03148372, 1, 0.4431373, 0, 1,
-1.365235, 0.3300405, -2.806336, 1, 0.4509804, 0, 1,
-1.346904, 0.4982193, -0.06595208, 1, 0.454902, 0, 1,
-1.331308, 0.8850839, -1.658928, 1, 0.4627451, 0, 1,
-1.305951, 0.936515, -1.797613, 1, 0.4666667, 0, 1,
-1.304569, 0.6730414, 0.5383878, 1, 0.4745098, 0, 1,
-1.303589, 0.9300186, -1.027083, 1, 0.4784314, 0, 1,
-1.288792, -1.263361, -2.986736, 1, 0.4862745, 0, 1,
-1.284047, -0.08536536, -0.895961, 1, 0.4901961, 0, 1,
-1.271388, 0.612335, -2.353322, 1, 0.4980392, 0, 1,
-1.267687, 2.109945, 1.216443, 1, 0.5058824, 0, 1,
-1.267523, 1.007192, -0.5496316, 1, 0.509804, 0, 1,
-1.265087, 0.4818503, -1.911379, 1, 0.5176471, 0, 1,
-1.26092, -0.7999306, -1.077856, 1, 0.5215687, 0, 1,
-1.260777, -0.527952, -2.228074, 1, 0.5294118, 0, 1,
-1.260267, 0.3934293, -1.03307, 1, 0.5333334, 0, 1,
-1.259773, 1.326806, -1.488688, 1, 0.5411765, 0, 1,
-1.25757, -0.2939246, -1.595133, 1, 0.5450981, 0, 1,
-1.255288, 0.1164513, -0.848977, 1, 0.5529412, 0, 1,
-1.244595, 0.7941827, -2.268163, 1, 0.5568628, 0, 1,
-1.236454, 0.8642006, -2.198006, 1, 0.5647059, 0, 1,
-1.235127, 0.6379717, -1.475139, 1, 0.5686275, 0, 1,
-1.23239, 1.869076, -1.799543, 1, 0.5764706, 0, 1,
-1.228856, -0.6244761, -2.247297, 1, 0.5803922, 0, 1,
-1.225338, 0.4559617, -0.1368179, 1, 0.5882353, 0, 1,
-1.220003, -0.2711523, -3.165855, 1, 0.5921569, 0, 1,
-1.214557, -0.3248399, -2.922111, 1, 0.6, 0, 1,
-1.213362, -1.172147, -3.283553, 1, 0.6078432, 0, 1,
-1.208477, -0.7942054, -3.337192, 1, 0.6117647, 0, 1,
-1.208341, -0.7742586, -1.851886, 1, 0.6196079, 0, 1,
-1.20165, 0.2351162, 1.125516, 1, 0.6235294, 0, 1,
-1.190173, 3.03834, -0.1424528, 1, 0.6313726, 0, 1,
-1.188064, 0.1345744, -1.105792, 1, 0.6352941, 0, 1,
-1.180663, 0.6391483, -1.561374, 1, 0.6431373, 0, 1,
-1.180578, -0.5750608, -2.395593, 1, 0.6470588, 0, 1,
-1.177463, 0.4287423, -1.705908, 1, 0.654902, 0, 1,
-1.163057, -0.6190491, -2.144241, 1, 0.6588235, 0, 1,
-1.156557, 0.5564587, -2.048931, 1, 0.6666667, 0, 1,
-1.150633, 0.8381863, -0.03707444, 1, 0.6705883, 0, 1,
-1.137751, -0.1871647, -2.108374, 1, 0.6784314, 0, 1,
-1.129511, 0.480346, -2.685466, 1, 0.682353, 0, 1,
-1.124813, -0.4127086, -1.352842, 1, 0.6901961, 0, 1,
-1.111439, -1.096115, -4.279049, 1, 0.6941177, 0, 1,
-1.109392, -0.5588178, -0.5394844, 1, 0.7019608, 0, 1,
-1.098909, 0.2915365, -0.5838007, 1, 0.7098039, 0, 1,
-1.095247, 1.177257, -2.313819, 1, 0.7137255, 0, 1,
-1.091742, -0.4302543, -1.270699, 1, 0.7215686, 0, 1,
-1.088122, 1.780474, -1.963636, 1, 0.7254902, 0, 1,
-1.085922, 1.142967, -1.453363, 1, 0.7333333, 0, 1,
-1.076325, -0.9108555, 0.9300486, 1, 0.7372549, 0, 1,
-1.072206, -0.5502633, -0.6039611, 1, 0.7450981, 0, 1,
-1.062097, 1.055115, 1.191779, 1, 0.7490196, 0, 1,
-1.061016, -1.247209, -3.169716, 1, 0.7568628, 0, 1,
-1.051652, 0.2047925, -1.130282, 1, 0.7607843, 0, 1,
-1.050511, -1.431454, -0.7503476, 1, 0.7686275, 0, 1,
-1.04868, -0.02132596, -1.21583, 1, 0.772549, 0, 1,
-1.037226, 0.7167388, -0.2731722, 1, 0.7803922, 0, 1,
-1.025084, -0.8740227, -2.328487, 1, 0.7843137, 0, 1,
-1.018714, -1.00501, -2.886606, 1, 0.7921569, 0, 1,
-1.017465, -0.01144227, -2.641768, 1, 0.7960784, 0, 1,
-1.016014, 0.2875168, -1.047638, 1, 0.8039216, 0, 1,
-1.01285, -0.6803149, -3.602352, 1, 0.8117647, 0, 1,
-1.009843, -0.6117694, -3.434012, 1, 0.8156863, 0, 1,
-1.000845, -0.7874001, -2.998694, 1, 0.8235294, 0, 1,
-1.000101, 0.1440056, -2.314991, 1, 0.827451, 0, 1,
-0.9865061, -0.8035343, -2.870172, 1, 0.8352941, 0, 1,
-0.9845964, 0.6506637, -1.998573, 1, 0.8392157, 0, 1,
-0.976635, 2.595368, -1.949359, 1, 0.8470588, 0, 1,
-0.9698916, -0.4906601, -2.349255, 1, 0.8509804, 0, 1,
-0.9687096, -0.2166741, -1.144123, 1, 0.8588235, 0, 1,
-0.9653333, 1.145814, -1.416163, 1, 0.8627451, 0, 1,
-0.9648579, 0.4246401, -1.141693, 1, 0.8705882, 0, 1,
-0.9635215, 0.4881094, -1.97408, 1, 0.8745098, 0, 1,
-0.9577168, -0.18204, 0.08489031, 1, 0.8823529, 0, 1,
-0.9576536, 1.045859, -1.092494, 1, 0.8862745, 0, 1,
-0.9521426, -0.003712277, -1.955571, 1, 0.8941177, 0, 1,
-0.951919, -1.424573, -2.080205, 1, 0.8980392, 0, 1,
-0.9479406, -1.285815, -2.622855, 1, 0.9058824, 0, 1,
-0.9370592, 1.121003, -0.5424255, 1, 0.9137255, 0, 1,
-0.9360974, -1.411845, -2.723344, 1, 0.9176471, 0, 1,
-0.9354953, 0.4989091, -0.4127218, 1, 0.9254902, 0, 1,
-0.9244771, 0.1065588, -1.638208, 1, 0.9294118, 0, 1,
-0.9193164, 0.3786778, -3.02472, 1, 0.9372549, 0, 1,
-0.913307, -0.07621418, 0.3446117, 1, 0.9411765, 0, 1,
-0.9132182, 1.04111, -0.2496677, 1, 0.9490196, 0, 1,
-0.9128537, -0.364053, -1.887001, 1, 0.9529412, 0, 1,
-0.8994612, -0.2164477, -2.273995, 1, 0.9607843, 0, 1,
-0.8977737, -0.1981035, -1.225126, 1, 0.9647059, 0, 1,
-0.8957641, 1.730963, -1.201422, 1, 0.972549, 0, 1,
-0.887372, 1.22626, -1.483999, 1, 0.9764706, 0, 1,
-0.8844023, -1.592417, -3.505034, 1, 0.9843137, 0, 1,
-0.8835575, -0.3315024, -1.605876, 1, 0.9882353, 0, 1,
-0.8792114, 0.9844295, -0.9487984, 1, 0.9960784, 0, 1,
-0.8768624, -0.1836306, -3.428731, 0.9960784, 1, 0, 1,
-0.8766481, 0.6441777, -1.813589, 0.9921569, 1, 0, 1,
-0.870814, 1.8676, 0.4633755, 0.9843137, 1, 0, 1,
-0.8647462, 0.3033506, -0.8697094, 0.9803922, 1, 0, 1,
-0.8636636, -0.9701811, -2.010798, 0.972549, 1, 0, 1,
-0.8631678, -0.04778261, -1.680193, 0.9686275, 1, 0, 1,
-0.8580059, 0.1702055, -1.688146, 0.9607843, 1, 0, 1,
-0.8520477, 0.2244645, -0.7472304, 0.9568627, 1, 0, 1,
-0.8506283, -0.921627, -2.394754, 0.9490196, 1, 0, 1,
-0.8502685, 0.6172971, -0.03995158, 0.945098, 1, 0, 1,
-0.8457752, -0.6401109, -1.683738, 0.9372549, 1, 0, 1,
-0.8454016, 0.09490807, -2.295141, 0.9333333, 1, 0, 1,
-0.8420396, -1.203886, -1.039505, 0.9254902, 1, 0, 1,
-0.8381208, 0.3983701, -0.8161188, 0.9215686, 1, 0, 1,
-0.8379191, 0.1388553, -1.578065, 0.9137255, 1, 0, 1,
-0.8334605, 0.8337581, 0.5273419, 0.9098039, 1, 0, 1,
-0.8281153, -1.017513, -1.838997, 0.9019608, 1, 0, 1,
-0.8174592, 0.4469138, -1.906038, 0.8941177, 1, 0, 1,
-0.8103529, 0.3785644, -0.1666139, 0.8901961, 1, 0, 1,
-0.8079612, -1.318733, -2.930433, 0.8823529, 1, 0, 1,
-0.8048961, -0.1288022, -1.653612, 0.8784314, 1, 0, 1,
-0.8017405, -0.3064076, -2.580223, 0.8705882, 1, 0, 1,
-0.8009168, 0.8414379, -0.5870414, 0.8666667, 1, 0, 1,
-0.7973025, 1.025948, -1.934844, 0.8588235, 1, 0, 1,
-0.796468, 0.2592854, -1.543147, 0.854902, 1, 0, 1,
-0.7955865, 0.1976141, -1.620359, 0.8470588, 1, 0, 1,
-0.7951059, 1.185881, 0.3965955, 0.8431373, 1, 0, 1,
-0.7909894, -0.73646, -1.66048, 0.8352941, 1, 0, 1,
-0.7848237, -0.1399933, -3.304885, 0.8313726, 1, 0, 1,
-0.7825012, 0.2757036, -0.3944283, 0.8235294, 1, 0, 1,
-0.7750473, -0.01399989, -2.045833, 0.8196079, 1, 0, 1,
-0.7743605, -0.8675051, -3.364002, 0.8117647, 1, 0, 1,
-0.7705601, -0.4893295, -1.12251, 0.8078431, 1, 0, 1,
-0.753351, 1.320477, -0.9979462, 0.8, 1, 0, 1,
-0.7533165, -0.2283352, -3.743921, 0.7921569, 1, 0, 1,
-0.7488155, -0.1737529, -1.928545, 0.7882353, 1, 0, 1,
-0.7470789, -2.40446, -4.862769, 0.7803922, 1, 0, 1,
-0.7410461, -0.8695047, -1.232624, 0.7764706, 1, 0, 1,
-0.7390739, -1.895551, -3.120916, 0.7686275, 1, 0, 1,
-0.7347273, 0.07050893, -2.108849, 0.7647059, 1, 0, 1,
-0.7342146, 1.985711, 0.2763789, 0.7568628, 1, 0, 1,
-0.7339523, 1.033865, -2.745315, 0.7529412, 1, 0, 1,
-0.7294098, 0.7670051, -1.66887, 0.7450981, 1, 0, 1,
-0.7276295, 1.378381, -0.1154322, 0.7411765, 1, 0, 1,
-0.7244867, -0.8398222, -4.238945, 0.7333333, 1, 0, 1,
-0.7206419, 1.23559, -2.312023, 0.7294118, 1, 0, 1,
-0.7116482, -0.4633629, -1.816691, 0.7215686, 1, 0, 1,
-0.7016789, 1.135695, -1.718118, 0.7176471, 1, 0, 1,
-0.6869649, 1.044893, -0.8145425, 0.7098039, 1, 0, 1,
-0.6867605, 0.7595258, -0.8354509, 0.7058824, 1, 0, 1,
-0.6856904, -0.5844612, -2.93367, 0.6980392, 1, 0, 1,
-0.6793034, -0.609998, -1.946688, 0.6901961, 1, 0, 1,
-0.6734778, 0.9143333, 0.05472513, 0.6862745, 1, 0, 1,
-0.6720768, 0.2512249, -0.2052631, 0.6784314, 1, 0, 1,
-0.6719057, 0.5801398, -0.02247759, 0.6745098, 1, 0, 1,
-0.6706234, -0.3719631, -2.341375, 0.6666667, 1, 0, 1,
-0.6700781, 1.593299, 1.079761, 0.6627451, 1, 0, 1,
-0.6684906, -2.127175, -2.769208, 0.654902, 1, 0, 1,
-0.6649803, -0.4132167, -1.519958, 0.6509804, 1, 0, 1,
-0.6630915, -0.2465086, -0.906224, 0.6431373, 1, 0, 1,
-0.662093, -0.6252823, -1.159078, 0.6392157, 1, 0, 1,
-0.6612917, 1.240015, 0.2757885, 0.6313726, 1, 0, 1,
-0.6597476, 0.6595693, -0.2085423, 0.627451, 1, 0, 1,
-0.6577554, 0.1903323, -0.6874946, 0.6196079, 1, 0, 1,
-0.6543841, 1.283304, -0.4122434, 0.6156863, 1, 0, 1,
-0.6502905, 0.9755053, 0.4733029, 0.6078432, 1, 0, 1,
-0.6497833, -0.3705086, -1.803324, 0.6039216, 1, 0, 1,
-0.6465259, -0.2302032, -3.265547, 0.5960785, 1, 0, 1,
-0.6439146, -1.079155, -2.798991, 0.5882353, 1, 0, 1,
-0.6424863, 0.4892037, -1.01387, 0.5843138, 1, 0, 1,
-0.6418123, 0.3196306, -0.5022215, 0.5764706, 1, 0, 1,
-0.6405362, 0.790625, -0.7384065, 0.572549, 1, 0, 1,
-0.6395047, 0.004977226, -1.343026, 0.5647059, 1, 0, 1,
-0.6386037, 1.216412, -2.498933, 0.5607843, 1, 0, 1,
-0.6381358, -0.2304242, -3.076206, 0.5529412, 1, 0, 1,
-0.6372999, -0.4151551, -2.791754, 0.5490196, 1, 0, 1,
-0.6345464, 0.2102175, -1.166512, 0.5411765, 1, 0, 1,
-0.6335621, 0.1258921, -1.794944, 0.5372549, 1, 0, 1,
-0.6331677, 1.215901, -0.8620759, 0.5294118, 1, 0, 1,
-0.630187, 0.9482031, -1.084083, 0.5254902, 1, 0, 1,
-0.629838, -0.3081373, -2.16361, 0.5176471, 1, 0, 1,
-0.6285477, 0.08246917, -1.004684, 0.5137255, 1, 0, 1,
-0.6242579, 0.8361337, -0.7037683, 0.5058824, 1, 0, 1,
-0.6231396, 1.510863, 0.9163073, 0.5019608, 1, 0, 1,
-0.6173127, 0.8426864, 0.3616457, 0.4941176, 1, 0, 1,
-0.6145226, 0.2018669, -0.550142, 0.4862745, 1, 0, 1,
-0.6120218, 1.375248, 0.3759446, 0.4823529, 1, 0, 1,
-0.6060625, 0.3221882, -2.723898, 0.4745098, 1, 0, 1,
-0.6029867, -0.5938617, -1.008418, 0.4705882, 1, 0, 1,
-0.5939466, -1.581853, -0.6725762, 0.4627451, 1, 0, 1,
-0.5934895, -1.61141, -4.451082, 0.4588235, 1, 0, 1,
-0.5923813, -1.570915, -3.578237, 0.4509804, 1, 0, 1,
-0.5890771, 0.08465101, -1.80288, 0.4470588, 1, 0, 1,
-0.5884618, 0.6557105, -1.667925, 0.4392157, 1, 0, 1,
-0.5874475, -0.5621889, -2.857404, 0.4352941, 1, 0, 1,
-0.5854737, 0.03700311, -0.6050248, 0.427451, 1, 0, 1,
-0.5792317, -2.659594, -3.803795, 0.4235294, 1, 0, 1,
-0.578008, 0.08728161, -1.033429, 0.4156863, 1, 0, 1,
-0.5769461, -0.7182556, -3.02052, 0.4117647, 1, 0, 1,
-0.5763059, 0.121268, -0.08362877, 0.4039216, 1, 0, 1,
-0.5751541, 0.07337498, -1.67627, 0.3960784, 1, 0, 1,
-0.5703738, 0.4515517, 1.293753, 0.3921569, 1, 0, 1,
-0.5681528, 1.08794, 0.09302256, 0.3843137, 1, 0, 1,
-0.5599176, 0.3548088, -0.8566598, 0.3803922, 1, 0, 1,
-0.5590978, 0.9855524, 0.1224086, 0.372549, 1, 0, 1,
-0.5578683, 0.3910042, -2.218316, 0.3686275, 1, 0, 1,
-0.552415, -2.740115, -2.848847, 0.3607843, 1, 0, 1,
-0.551994, 1.982337, -0.5603063, 0.3568628, 1, 0, 1,
-0.5517524, -0.3456728, -1.905046, 0.3490196, 1, 0, 1,
-0.5405478, 0.3926121, -0.6677403, 0.345098, 1, 0, 1,
-0.5401116, 1.380582, -0.04229344, 0.3372549, 1, 0, 1,
-0.5352333, 0.1724869, -0.7275281, 0.3333333, 1, 0, 1,
-0.5264531, -0.9510116, -2.79958, 0.3254902, 1, 0, 1,
-0.5264183, -0.9157329, -3.933174, 0.3215686, 1, 0, 1,
-0.525185, -0.3794641, -2.270544, 0.3137255, 1, 0, 1,
-0.5243167, 0.1878811, -0.774637, 0.3098039, 1, 0, 1,
-0.522134, -0.9146728, -2.960138, 0.3019608, 1, 0, 1,
-0.5211642, -0.6380897, -2.391798, 0.2941177, 1, 0, 1,
-0.5209859, -0.01640177, -0.8273649, 0.2901961, 1, 0, 1,
-0.5206722, -0.09280432, -1.295226, 0.282353, 1, 0, 1,
-0.5134305, 2.013444, -0.6252984, 0.2784314, 1, 0, 1,
-0.5127472, -0.1716479, -3.076946, 0.2705882, 1, 0, 1,
-0.5124653, -1.26139, -1.204771, 0.2666667, 1, 0, 1,
-0.5104433, 0.5734278, -1.565638, 0.2588235, 1, 0, 1,
-0.5065277, -0.08319498, -2.840948, 0.254902, 1, 0, 1,
-0.5044186, -0.002962663, -1.84886, 0.2470588, 1, 0, 1,
-0.5016778, -0.7123656, -3.846425, 0.2431373, 1, 0, 1,
-0.5008868, 0.03328218, -1.343823, 0.2352941, 1, 0, 1,
-0.5006891, -0.3825652, -2.541709, 0.2313726, 1, 0, 1,
-0.500529, -0.6085505, -1.30591, 0.2235294, 1, 0, 1,
-0.4968396, -0.8925903, -3.515386, 0.2196078, 1, 0, 1,
-0.492016, -0.3673119, -0.5499358, 0.2117647, 1, 0, 1,
-0.4918509, 1.155548, -0.7169504, 0.2078431, 1, 0, 1,
-0.4899989, 0.5543417, -1.469395, 0.2, 1, 0, 1,
-0.4894086, 0.4339673, -1.093721, 0.1921569, 1, 0, 1,
-0.4854896, -0.1755166, -2.703812, 0.1882353, 1, 0, 1,
-0.4837171, -0.2410633, -1.228552, 0.1803922, 1, 0, 1,
-0.4834771, -0.4339167, -2.172897, 0.1764706, 1, 0, 1,
-0.4833716, 1.788674, -1.977247, 0.1686275, 1, 0, 1,
-0.4789594, -0.07285994, -2.539098, 0.1647059, 1, 0, 1,
-0.4737015, -0.2286241, -1.325963, 0.1568628, 1, 0, 1,
-0.4703537, 0.367307, 0.2481131, 0.1529412, 1, 0, 1,
-0.4687972, -1.604203, -2.559909, 0.145098, 1, 0, 1,
-0.4643451, -0.2426094, -3.813015, 0.1411765, 1, 0, 1,
-0.460909, -0.8533759, -3.552665, 0.1333333, 1, 0, 1,
-0.4597988, 1.31999, 0.7763041, 0.1294118, 1, 0, 1,
-0.4575387, 1.151068, -0.0156822, 0.1215686, 1, 0, 1,
-0.4563779, -1.956553, -3.883813, 0.1176471, 1, 0, 1,
-0.4548388, 1.363925, -1.151211, 0.1098039, 1, 0, 1,
-0.4506766, 0.7768793, -1.622347, 0.1058824, 1, 0, 1,
-0.4467421, -0.8298435, -1.928318, 0.09803922, 1, 0, 1,
-0.4463596, -0.4136955, -3.618404, 0.09019608, 1, 0, 1,
-0.4425333, 0.0171093, -0.5350989, 0.08627451, 1, 0, 1,
-0.4364171, -0.145912, -1.481437, 0.07843138, 1, 0, 1,
-0.4358868, -1.5203, -1.608779, 0.07450981, 1, 0, 1,
-0.4355839, 1.333825, -2.573496, 0.06666667, 1, 0, 1,
-0.4325629, -1.018328, -2.253832, 0.0627451, 1, 0, 1,
-0.423374, 1.215544, 1.627417, 0.05490196, 1, 0, 1,
-0.4210669, 0.5970392, -1.669676, 0.05098039, 1, 0, 1,
-0.4148093, 0.7603485, 0.0276585, 0.04313726, 1, 0, 1,
-0.4118901, 0.08856589, -1.133137, 0.03921569, 1, 0, 1,
-0.4080978, -0.07708909, -0.3973418, 0.03137255, 1, 0, 1,
-0.4044451, -1.706668, -4.939175, 0.02745098, 1, 0, 1,
-0.4026468, -0.1991773, -1.998224, 0.01960784, 1, 0, 1,
-0.4014325, 0.3762872, 0.02025529, 0.01568628, 1, 0, 1,
-0.4001278, -1.087168, -3.842328, 0.007843138, 1, 0, 1,
-0.3977296, 0.9971223, 0.5396545, 0.003921569, 1, 0, 1,
-0.3976078, -1.931224, -3.181705, 0, 1, 0.003921569, 1,
-0.3968134, -0.1797337, -3.272462, 0, 1, 0.01176471, 1,
-0.3921004, -1.422695, -4.333034, 0, 1, 0.01568628, 1,
-0.3869886, 0.7507298, -0.9755099, 0, 1, 0.02352941, 1,
-0.3861171, 1.102327, -0.2385495, 0, 1, 0.02745098, 1,
-0.3845732, 1.030655, -0.8822255, 0, 1, 0.03529412, 1,
-0.3833468, -0.6623293, -1.327578, 0, 1, 0.03921569, 1,
-0.3821981, 0.2009995, -1.798263, 0, 1, 0.04705882, 1,
-0.3762244, 0.187728, -1.229659, 0, 1, 0.05098039, 1,
-0.3751909, 0.5874919, -0.2957949, 0, 1, 0.05882353, 1,
-0.3745879, 1.221737, -0.05062352, 0, 1, 0.0627451, 1,
-0.3730265, 0.361796, -2.743296, 0, 1, 0.07058824, 1,
-0.3723538, -2.844634, -2.619637, 0, 1, 0.07450981, 1,
-0.3719016, -0.3248383, -2.729451, 0, 1, 0.08235294, 1,
-0.3701646, -0.3429175, -2.512489, 0, 1, 0.08627451, 1,
-0.3650278, 0.02498711, -1.948423, 0, 1, 0.09411765, 1,
-0.3572612, 0.1141841, -1.63794, 0, 1, 0.1019608, 1,
-0.3542214, 0.5255774, 0.2214504, 0, 1, 0.1058824, 1,
-0.3522325, -0.2753493, -4.494344, 0, 1, 0.1137255, 1,
-0.3492677, -0.9765095, -5.569955, 0, 1, 0.1176471, 1,
-0.3477607, -0.5199153, -2.31915, 0, 1, 0.1254902, 1,
-0.3461542, -0.9929331, -4.786515, 0, 1, 0.1294118, 1,
-0.3445376, -1.178679, -2.062889, 0, 1, 0.1372549, 1,
-0.3442608, -0.4594254, -3.81671, 0, 1, 0.1411765, 1,
-0.3433799, 0.8522774, 0.05181843, 0, 1, 0.1490196, 1,
-0.3422836, -0.1150185, -2.758399, 0, 1, 0.1529412, 1,
-0.3411802, -1.351881, -3.480922, 0, 1, 0.1607843, 1,
-0.3408417, 0.3145339, -1.027635, 0, 1, 0.1647059, 1,
-0.3378212, 0.9860142, -0.04144581, 0, 1, 0.172549, 1,
-0.3348982, -2.007236, -4.049984, 0, 1, 0.1764706, 1,
-0.3315147, -0.509352, -2.17936, 0, 1, 0.1843137, 1,
-0.328284, 1.26674, -1.500567, 0, 1, 0.1882353, 1,
-0.3277441, -0.2826993, -2.886094, 0, 1, 0.1960784, 1,
-0.3251281, 0.3415644, -0.1620103, 0, 1, 0.2039216, 1,
-0.320171, 1.402501, 0.5029287, 0, 1, 0.2078431, 1,
-0.3179369, 0.3516622, 0.1106703, 0, 1, 0.2156863, 1,
-0.3147493, 0.5104964, -0.2013126, 0, 1, 0.2196078, 1,
-0.3080204, -1.695938, -3.472688, 0, 1, 0.227451, 1,
-0.3078613, -1.295277, -4.110705, 0, 1, 0.2313726, 1,
-0.306071, 0.6329508, -2.136483, 0, 1, 0.2392157, 1,
-0.3060433, -0.7565102, -3.094917, 0, 1, 0.2431373, 1,
-0.3054377, -0.9100467, -3.690125, 0, 1, 0.2509804, 1,
-0.3039624, 1.444436, -0.6889411, 0, 1, 0.254902, 1,
-0.3039553, 1.964385, 0.3625424, 0, 1, 0.2627451, 1,
-0.30033, -0.662874, -2.666629, 0, 1, 0.2666667, 1,
-0.2997802, -0.3672464, -1.128499, 0, 1, 0.2745098, 1,
-0.299468, -0.6984711, -3.707779, 0, 1, 0.2784314, 1,
-0.2990049, 1.406559, -0.9351237, 0, 1, 0.2862745, 1,
-0.2927422, -0.1924157, -1.567545, 0, 1, 0.2901961, 1,
-0.292317, -0.04140331, -1.284271, 0, 1, 0.2980392, 1,
-0.2919145, -2.18687, -2.775771, 0, 1, 0.3058824, 1,
-0.2859402, -0.2329258, -1.321332, 0, 1, 0.3098039, 1,
-0.2846221, 0.1024311, -1.117738, 0, 1, 0.3176471, 1,
-0.2842469, 2.840909, 1.170714, 0, 1, 0.3215686, 1,
-0.2795669, 0.9341918, -0.8391255, 0, 1, 0.3294118, 1,
-0.275758, 0.6474341, 0.3454641, 0, 1, 0.3333333, 1,
-0.2723638, -1.104749, -2.080206, 0, 1, 0.3411765, 1,
-0.2668938, -0.8823077, -4.174794, 0, 1, 0.345098, 1,
-0.2638093, 0.2758128, 0.1352867, 0, 1, 0.3529412, 1,
-0.2617477, 0.6141537, -0.6571024, 0, 1, 0.3568628, 1,
-0.2614996, -0.5531574, -3.978574, 0, 1, 0.3647059, 1,
-0.2606942, 1.782715, 0.3596586, 0, 1, 0.3686275, 1,
-0.2595363, 1.377323, -0.4736685, 0, 1, 0.3764706, 1,
-0.259415, 0.8447511, 0.01538987, 0, 1, 0.3803922, 1,
-0.2565079, 0.8243045, -0.3332434, 0, 1, 0.3882353, 1,
-0.2557588, -1.876967, -2.327202, 0, 1, 0.3921569, 1,
-0.2542153, 0.3851939, 0.2901375, 0, 1, 0.4, 1,
-0.2536085, -0.9613663, -3.691694, 0, 1, 0.4078431, 1,
-0.2489138, 0.8222346, 1.157745, 0, 1, 0.4117647, 1,
-0.2466684, 1.683164, 0.002285291, 0, 1, 0.4196078, 1,
-0.2462573, -0.9580178, -2.299565, 0, 1, 0.4235294, 1,
-0.2459425, -1.047894, -2.080891, 0, 1, 0.4313726, 1,
-0.2402252, 1.05074, -1.09619, 0, 1, 0.4352941, 1,
-0.2344744, -1.044308, -0.906042, 0, 1, 0.4431373, 1,
-0.2326964, 0.5685576, -1.488147, 0, 1, 0.4470588, 1,
-0.2318348, -0.3474483, -4.447422, 0, 1, 0.454902, 1,
-0.2312172, -0.1942706, -1.966669, 0, 1, 0.4588235, 1,
-0.2269182, -0.7335103, -3.357443, 0, 1, 0.4666667, 1,
-0.2256131, -0.8648642, -1.56594, 0, 1, 0.4705882, 1,
-0.2234782, 0.7560729, -0.5469436, 0, 1, 0.4784314, 1,
-0.220755, -1.136902, -3.553797, 0, 1, 0.4823529, 1,
-0.2197011, -0.4864495, -4.542807, 0, 1, 0.4901961, 1,
-0.2169294, 0.4808756, 0.2075446, 0, 1, 0.4941176, 1,
-0.2163376, 2.145954, -1.131331, 0, 1, 0.5019608, 1,
-0.2113408, 0.4630121, -0.2824926, 0, 1, 0.509804, 1,
-0.2061531, 0.5410452, -2.231207, 0, 1, 0.5137255, 1,
-0.2030727, 1.75991, -2.330268, 0, 1, 0.5215687, 1,
-0.1968357, 0.2746792, 0.8484915, 0, 1, 0.5254902, 1,
-0.1941584, 1.902202, 0.6870754, 0, 1, 0.5333334, 1,
-0.1930473, 0.8479544, -0.9742427, 0, 1, 0.5372549, 1,
-0.1926423, -1.31424, -4.386339, 0, 1, 0.5450981, 1,
-0.1901986, -1.704336, -1.801288, 0, 1, 0.5490196, 1,
-0.1821179, 0.7102259, -0.2433628, 0, 1, 0.5568628, 1,
-0.179242, 1.631346, -0.8209676, 0, 1, 0.5607843, 1,
-0.1787232, 1.833378, 1.083161, 0, 1, 0.5686275, 1,
-0.1777775, 2.299841, 1.210176, 0, 1, 0.572549, 1,
-0.1739216, -0.6691726, -3.211463, 0, 1, 0.5803922, 1,
-0.1720863, -0.106294, -2.592509, 0, 1, 0.5843138, 1,
-0.1609049, 0.5962443, 0.5352803, 0, 1, 0.5921569, 1,
-0.1601658, 0.4850205, 0.972931, 0, 1, 0.5960785, 1,
-0.1589661, -0.6039998, -3.088785, 0, 1, 0.6039216, 1,
-0.1587173, 1.707247, 1.48929, 0, 1, 0.6117647, 1,
-0.1578104, 0.4188781, -0.9882901, 0, 1, 0.6156863, 1,
-0.1567809, -0.2258095, -2.76844, 0, 1, 0.6235294, 1,
-0.1566984, 0.3313764, 0.2355728, 0, 1, 0.627451, 1,
-0.1495422, -0.5235042, -2.631625, 0, 1, 0.6352941, 1,
-0.149273, -0.05592391, -2.586965, 0, 1, 0.6392157, 1,
-0.149094, -0.4848129, -4.181594, 0, 1, 0.6470588, 1,
-0.147517, -1.673336, -1.951178, 0, 1, 0.6509804, 1,
-0.1459497, 0.1677396, -0.3417705, 0, 1, 0.6588235, 1,
-0.1456905, 1.412955, 0.5936974, 0, 1, 0.6627451, 1,
-0.1410666, -2.194758, -1.767021, 0, 1, 0.6705883, 1,
-0.1408755, -0.02759805, -0.3766838, 0, 1, 0.6745098, 1,
-0.1371793, 0.6785303, 0.8288651, 0, 1, 0.682353, 1,
-0.1364487, 0.1400324, -1.098107, 0, 1, 0.6862745, 1,
-0.1351915, -0.1057035, -1.545158, 0, 1, 0.6941177, 1,
-0.1342878, -2.161831, -4.205787, 0, 1, 0.7019608, 1,
-0.1283512, 0.6205974, -0.8702788, 0, 1, 0.7058824, 1,
-0.1277738, 1.410246, -1.44347, 0, 1, 0.7137255, 1,
-0.1212348, 0.2878284, -1.071565, 0, 1, 0.7176471, 1,
-0.1195639, 1.326231, 0.1846933, 0, 1, 0.7254902, 1,
-0.116831, 0.7607456, -0.7279384, 0, 1, 0.7294118, 1,
-0.1156699, -0.3650569, -1.9347, 0, 1, 0.7372549, 1,
-0.1129712, -0.7741258, -1.44714, 0, 1, 0.7411765, 1,
-0.1109015, 1.019638, -0.7796236, 0, 1, 0.7490196, 1,
-0.1106568, -0.08552626, -1.477699, 0, 1, 0.7529412, 1,
-0.1062734, -0.1069888, -2.028954, 0, 1, 0.7607843, 1,
-0.1038508, -0.00639194, 0.07157973, 0, 1, 0.7647059, 1,
-0.1018133, -1.208863, -2.70731, 0, 1, 0.772549, 1,
-0.1017406, -0.5161137, -1.786091, 0, 1, 0.7764706, 1,
-0.09994274, 1.097007, 1.198002, 0, 1, 0.7843137, 1,
-0.09981797, 1.099476, -0.3925517, 0, 1, 0.7882353, 1,
-0.09461701, -0.5154948, -3.135181, 0, 1, 0.7960784, 1,
-0.09050898, 0.5350677, -0.4809791, 0, 1, 0.8039216, 1,
-0.08939999, -2.325702, -3.330791, 0, 1, 0.8078431, 1,
-0.08339011, -0.4054728, -2.785851, 0, 1, 0.8156863, 1,
-0.08334699, -1.615405, -2.159646, 0, 1, 0.8196079, 1,
-0.0827658, 1.380364, 1.451714, 0, 1, 0.827451, 1,
-0.0818806, -0.9564365, -1.35327, 0, 1, 0.8313726, 1,
-0.07598899, 0.3400356, -0.5609737, 0, 1, 0.8392157, 1,
-0.07215445, 0.4239025, 0.9632303, 0, 1, 0.8431373, 1,
-0.07008497, 2.455752, -0.8266422, 0, 1, 0.8509804, 1,
-0.06947597, -0.2445894, -2.421049, 0, 1, 0.854902, 1,
-0.06828809, 0.08565059, 1.471523, 0, 1, 0.8627451, 1,
-0.06772243, 0.6287364, -0.3150667, 0, 1, 0.8666667, 1,
-0.06692094, -0.02574494, -2.700068, 0, 1, 0.8745098, 1,
-0.06018018, 1.246732, -1.081778, 0, 1, 0.8784314, 1,
-0.05972002, -0.01112556, 0.7275529, 0, 1, 0.8862745, 1,
-0.05952238, 0.1205733, -0.3368594, 0, 1, 0.8901961, 1,
-0.05847602, -0.773675, -1.276103, 0, 1, 0.8980392, 1,
-0.05600481, 0.4865449, -0.9775041, 0, 1, 0.9058824, 1,
-0.05541844, 0.6121893, 1.434297, 0, 1, 0.9098039, 1,
-0.05163754, 1.197022, -0.3144114, 0, 1, 0.9176471, 1,
-0.04793669, 1.714106, -1.216169, 0, 1, 0.9215686, 1,
-0.04509119, -1.171144, -2.498762, 0, 1, 0.9294118, 1,
-0.03882373, -0.486, -2.055649, 0, 1, 0.9333333, 1,
-0.0370539, 0.4573053, -0.5536058, 0, 1, 0.9411765, 1,
-0.03582858, 0.7739928, -0.798587, 0, 1, 0.945098, 1,
-0.0336317, -1.429533, -2.30135, 0, 1, 0.9529412, 1,
-0.03271851, 0.1733022, 1.157839, 0, 1, 0.9568627, 1,
-0.03267187, -1.839554, -4.244842, 0, 1, 0.9647059, 1,
-0.02916515, 0.8855143, -0.1359865, 0, 1, 0.9686275, 1,
-0.02829422, 0.6278653, 0.2973085, 0, 1, 0.9764706, 1,
-0.02621058, -0.7057538, -2.668695, 0, 1, 0.9803922, 1,
-0.02502765, 0.9736072, -1.151358, 0, 1, 0.9882353, 1,
-0.02496071, -0.1023098, -2.923174, 0, 1, 0.9921569, 1,
-0.02366978, -0.1076396, -3.924924, 0, 1, 1, 1,
-0.02231505, 0.2353409, 1.047191, 0, 0.9921569, 1, 1,
-0.02077259, -0.687342, -4.563905, 0, 0.9882353, 1, 1,
-0.01906968, 1.111928, -0.4232661, 0, 0.9803922, 1, 1,
-0.0170018, -1.387874, -3.169141, 0, 0.9764706, 1, 1,
-0.01632642, -0.6574894, -2.441601, 0, 0.9686275, 1, 1,
-0.01361311, 0.2050724, -0.04404229, 0, 0.9647059, 1, 1,
-0.01276998, -1.036661, -3.54879, 0, 0.9568627, 1, 1,
-0.01230724, 1.70204, -0.5289693, 0, 0.9529412, 1, 1,
-0.009237457, -0.03349287, -1.27888, 0, 0.945098, 1, 1,
-0.008958391, 0.8406048, -1.529555, 0, 0.9411765, 1, 1,
-0.004127869, 0.1442981, 0.1595819, 0, 0.9333333, 1, 1,
-0.003107284, -0.6318174, -2.371108, 0, 0.9294118, 1, 1,
-0.002617625, 0.7867267, -1.343988, 0, 0.9215686, 1, 1,
0.003355495, -0.5597272, 2.97436, 0, 0.9176471, 1, 1,
0.003425777, 0.6655822, -0.0824159, 0, 0.9098039, 1, 1,
0.003426449, 0.5194109, 0.8006028, 0, 0.9058824, 1, 1,
0.003864368, -0.435278, 3.273379, 0, 0.8980392, 1, 1,
0.01018179, -0.238134, 1.998542, 0, 0.8901961, 1, 1,
0.01100097, -0.5184122, 2.995564, 0, 0.8862745, 1, 1,
0.01797455, -2.703492, 1.940748, 0, 0.8784314, 1, 1,
0.02003423, 1.01617, 1.383587, 0, 0.8745098, 1, 1,
0.02059712, -0.2447721, 0.9837134, 0, 0.8666667, 1, 1,
0.02240266, -1.500501, 3.571804, 0, 0.8627451, 1, 1,
0.02720735, 0.09051705, -0.3348857, 0, 0.854902, 1, 1,
0.03182095, -0.7066665, 2.593429, 0, 0.8509804, 1, 1,
0.0365503, 0.08705782, -0.07789905, 0, 0.8431373, 1, 1,
0.03856237, 0.2245371, 1.132876, 0, 0.8392157, 1, 1,
0.04283348, -1.126538, 4.249049, 0, 0.8313726, 1, 1,
0.04324226, 0.429491, 2.03001, 0, 0.827451, 1, 1,
0.0433883, -0.4607144, 2.902455, 0, 0.8196079, 1, 1,
0.04355407, -1.038738, 3.24427, 0, 0.8156863, 1, 1,
0.05280856, -1.667756, 2.67177, 0, 0.8078431, 1, 1,
0.05372043, -0.5907522, 5.190331, 0, 0.8039216, 1, 1,
0.05500382, -1.248441, 4.436564, 0, 0.7960784, 1, 1,
0.05719901, 0.4062279, 0.259407, 0, 0.7882353, 1, 1,
0.05861335, 1.037003, 1.657259, 0, 0.7843137, 1, 1,
0.06294511, -0.3061912, 0.7206746, 0, 0.7764706, 1, 1,
0.064393, -0.06231447, 2.040002, 0, 0.772549, 1, 1,
0.065241, -0.3614673, 3.108101, 0, 0.7647059, 1, 1,
0.07249457, -1.643191, 3.105864, 0, 0.7607843, 1, 1,
0.07270695, -0.6873693, 2.634331, 0, 0.7529412, 1, 1,
0.07546302, -0.62862, 3.910583, 0, 0.7490196, 1, 1,
0.07999091, -1.025804, 2.396486, 0, 0.7411765, 1, 1,
0.08032637, -0.6825728, 2.275393, 0, 0.7372549, 1, 1,
0.08148098, -2.331917, 2.444743, 0, 0.7294118, 1, 1,
0.08248296, 0.7903578, -0.4020534, 0, 0.7254902, 1, 1,
0.08453206, 0.8271254, 0.5983041, 0, 0.7176471, 1, 1,
0.08537932, -0.1362146, 2.440787, 0, 0.7137255, 1, 1,
0.08606281, 0.4539801, 0.2508152, 0, 0.7058824, 1, 1,
0.08641431, 1.224793, -1.217975, 0, 0.6980392, 1, 1,
0.08762978, -0.1106934, 3.298622, 0, 0.6941177, 1, 1,
0.09226817, -0.07987288, 1.014517, 0, 0.6862745, 1, 1,
0.09496169, -0.6986788, 4.014123, 0, 0.682353, 1, 1,
0.09497643, 0.5539351, -0.7880262, 0, 0.6745098, 1, 1,
0.1014584, -1.178139, 2.462968, 0, 0.6705883, 1, 1,
0.1029544, 0.7901549, -0.7408224, 0, 0.6627451, 1, 1,
0.1043489, 0.1721539, 0.5559642, 0, 0.6588235, 1, 1,
0.1110688, 1.61364, 0.0370449, 0, 0.6509804, 1, 1,
0.1120638, 0.5622258, -0.2678879, 0, 0.6470588, 1, 1,
0.1152068, -0.4773771, 3.003466, 0, 0.6392157, 1, 1,
0.1237058, -0.509066, 3.983887, 0, 0.6352941, 1, 1,
0.1261143, -1.510748, 3.764868, 0, 0.627451, 1, 1,
0.1291286, 0.505268, -0.5188013, 0, 0.6235294, 1, 1,
0.1294328, -0.9836021, 2.258615, 0, 0.6156863, 1, 1,
0.1342287, -1.714212, 1.199742, 0, 0.6117647, 1, 1,
0.1356255, -1.234292, 2.642724, 0, 0.6039216, 1, 1,
0.1371825, -1.419966, 2.762262, 0, 0.5960785, 1, 1,
0.1373872, -0.6693091, 1.100261, 0, 0.5921569, 1, 1,
0.1424824, -0.4253701, 3.10818, 0, 0.5843138, 1, 1,
0.1450824, -0.1533899, 3.444304, 0, 0.5803922, 1, 1,
0.1484292, 0.9442033, 0.1446844, 0, 0.572549, 1, 1,
0.1498148, -0.1573986, 3.086582, 0, 0.5686275, 1, 1,
0.1536999, 1.436189, 0.1473561, 0, 0.5607843, 1, 1,
0.1545539, 1.130192, 0.07949271, 0, 0.5568628, 1, 1,
0.1546258, -0.0870189, 2.269653, 0, 0.5490196, 1, 1,
0.1561161, 0.09730598, 0.1219712, 0, 0.5450981, 1, 1,
0.1591852, -0.3969632, 1.29898, 0, 0.5372549, 1, 1,
0.1614442, -1.758161, 4.122878, 0, 0.5333334, 1, 1,
0.1666098, -0.3809911, 3.053917, 0, 0.5254902, 1, 1,
0.1676169, 0.9248194, -0.7700472, 0, 0.5215687, 1, 1,
0.1693124, 1.012046, 0.2102281, 0, 0.5137255, 1, 1,
0.1772865, -0.08941033, 3.838495, 0, 0.509804, 1, 1,
0.1812933, 1.321981, 1.414734, 0, 0.5019608, 1, 1,
0.1822865, 1.239742, -0.7895049, 0, 0.4941176, 1, 1,
0.1848389, -2.245865, 1.680597, 0, 0.4901961, 1, 1,
0.1850681, 0.5829335, -2.115355, 0, 0.4823529, 1, 1,
0.1908196, -0.9005337, 2.378622, 0, 0.4784314, 1, 1,
0.1917703, 0.5311007, 1.256859, 0, 0.4705882, 1, 1,
0.1925696, 0.1371365, 1.28169, 0, 0.4666667, 1, 1,
0.2058615, 0.4627312, 3.23546, 0, 0.4588235, 1, 1,
0.2088738, 0.5071691, 0.8685038, 0, 0.454902, 1, 1,
0.2140174, -1.27066, 3.648293, 0, 0.4470588, 1, 1,
0.2150934, 0.9286785, -2.087184, 0, 0.4431373, 1, 1,
0.2163211, 0.626147, -0.3467603, 0, 0.4352941, 1, 1,
0.2248235, -0.3511684, 2.8177, 0, 0.4313726, 1, 1,
0.228923, -0.2345628, 3.558859, 0, 0.4235294, 1, 1,
0.230949, 1.526282, -0.6333882, 0, 0.4196078, 1, 1,
0.232955, -0.9638435, 2.109595, 0, 0.4117647, 1, 1,
0.2392359, 0.830995, 0.770842, 0, 0.4078431, 1, 1,
0.2402776, 1.912985, -2.36744, 0, 0.4, 1, 1,
0.2402997, 1.07469, 2.456779, 0, 0.3921569, 1, 1,
0.2424765, -0.09666811, 1.547666, 0, 0.3882353, 1, 1,
0.2446307, 0.6408103, -0.1529567, 0, 0.3803922, 1, 1,
0.2455665, 1.16041, -0.7415992, 0, 0.3764706, 1, 1,
0.2488655, -1.936351, 1.581307, 0, 0.3686275, 1, 1,
0.25443, 1.68001, 2.025699, 0, 0.3647059, 1, 1,
0.2555392, -1.75174, 4.578211, 0, 0.3568628, 1, 1,
0.2596505, -1.386503, 2.670995, 0, 0.3529412, 1, 1,
0.2657024, 0.9785955, -0.02746707, 0, 0.345098, 1, 1,
0.2662542, -1.692335, 1.357297, 0, 0.3411765, 1, 1,
0.2676084, 0.6758168, 0.6624578, 0, 0.3333333, 1, 1,
0.2874055, -2.286747, 3.698497, 0, 0.3294118, 1, 1,
0.2882279, 1.60968, -0.6203993, 0, 0.3215686, 1, 1,
0.2889773, -0.21574, 2.595525, 0, 0.3176471, 1, 1,
0.2897699, -0.0212094, 1.249787, 0, 0.3098039, 1, 1,
0.2927552, 1.539416, 0.6873779, 0, 0.3058824, 1, 1,
0.2941253, 1.974767, 0.4560033, 0, 0.2980392, 1, 1,
0.2965403, 0.8150346, 0.438585, 0, 0.2901961, 1, 1,
0.2970964, 0.6550357, 0.4589447, 0, 0.2862745, 1, 1,
0.3002534, 1.004902, -0.9348663, 0, 0.2784314, 1, 1,
0.3005277, -2.066609, 2.498671, 0, 0.2745098, 1, 1,
0.3031188, -1.424803, 2.732603, 0, 0.2666667, 1, 1,
0.3045922, -0.6441347, 2.015606, 0, 0.2627451, 1, 1,
0.3066125, 0.8698906, 0.1968142, 0, 0.254902, 1, 1,
0.3087471, -0.1867616, 2.154094, 0, 0.2509804, 1, 1,
0.3153622, -2.250601, 3.39723, 0, 0.2431373, 1, 1,
0.3196002, 1.005204, 0.1363096, 0, 0.2392157, 1, 1,
0.32193, -0.05473529, 2.136549, 0, 0.2313726, 1, 1,
0.3251697, 1.986181, -1.028635, 0, 0.227451, 1, 1,
0.3268088, -1.856369, 2.665443, 0, 0.2196078, 1, 1,
0.3337887, 0.516259, -0.7830111, 0, 0.2156863, 1, 1,
0.3350483, 3.456991, 1.336629, 0, 0.2078431, 1, 1,
0.3406267, -1.7793, 2.996566, 0, 0.2039216, 1, 1,
0.3428254, -0.7924753, 1.807644, 0, 0.1960784, 1, 1,
0.3450398, -2.039594, 3.964163, 0, 0.1882353, 1, 1,
0.3459766, 0.09844919, 0.9554427, 0, 0.1843137, 1, 1,
0.3463272, -1.356559, 3.841774, 0, 0.1764706, 1, 1,
0.3467087, 1.814513, -0.02395629, 0, 0.172549, 1, 1,
0.35, 0.5680282, -0.1678945, 0, 0.1647059, 1, 1,
0.3561712, 1.407767, 0.3715433, 0, 0.1607843, 1, 1,
0.360329, -0.5281572, 2.067278, 0, 0.1529412, 1, 1,
0.3606074, -0.1053357, 2.266559, 0, 0.1490196, 1, 1,
0.3631492, -1.270637, 1.599573, 0, 0.1411765, 1, 1,
0.363742, 0.4827061, -0.0369157, 0, 0.1372549, 1, 1,
0.3684737, 1.119849, -0.5846873, 0, 0.1294118, 1, 1,
0.3703888, 0.9593402, 0.6037797, 0, 0.1254902, 1, 1,
0.3765821, -0.5878352, 2.418694, 0, 0.1176471, 1, 1,
0.377357, -0.4416624, 3.181192, 0, 0.1137255, 1, 1,
0.3789128, -0.9706289, 3.198831, 0, 0.1058824, 1, 1,
0.3804234, 0.09203478, 2.416412, 0, 0.09803922, 1, 1,
0.381317, 1.446363, 0.8111868, 0, 0.09411765, 1, 1,
0.383004, -0.0310506, 0.2722819, 0, 0.08627451, 1, 1,
0.3851851, -0.5313736, 3.385453, 0, 0.08235294, 1, 1,
0.3896851, 0.4919053, -0.3601277, 0, 0.07450981, 1, 1,
0.3927091, -0.5837003, 1.01563, 0, 0.07058824, 1, 1,
0.3966952, -0.2086679, 0.4258575, 0, 0.0627451, 1, 1,
0.3969008, 0.50983, 0.1813115, 0, 0.05882353, 1, 1,
0.3982905, -0.5690393, 2.851743, 0, 0.05098039, 1, 1,
0.3983625, -0.6702025, 0.8320609, 0, 0.04705882, 1, 1,
0.3984465, -0.07474821, 1.317351, 0, 0.03921569, 1, 1,
0.4020204, -0.7645791, 2.098392, 0, 0.03529412, 1, 1,
0.4075069, 0.5361987, 1.585711, 0, 0.02745098, 1, 1,
0.4077185, 0.009073736, 0.8616296, 0, 0.02352941, 1, 1,
0.4090981, 0.6747829, 1.951427, 0, 0.01568628, 1, 1,
0.4100011, -1.033497, 1.874085, 0, 0.01176471, 1, 1,
0.4134559, -0.5201004, 2.981101, 0, 0.003921569, 1, 1,
0.4156002, -0.4573942, 3.494993, 0.003921569, 0, 1, 1,
0.4161179, 0.4190224, -0.3144157, 0.007843138, 0, 1, 1,
0.4190477, 0.6610563, 0.1819519, 0.01568628, 0, 1, 1,
0.4233304, 0.7747683, 1.529322, 0.01960784, 0, 1, 1,
0.4241042, 0.42024, -0.8381447, 0.02745098, 0, 1, 1,
0.4243693, 0.375299, 1.72453, 0.03137255, 0, 1, 1,
0.4298528, 1.369701, -0.6652032, 0.03921569, 0, 1, 1,
0.4352056, 0.2101501, 0.5173146, 0.04313726, 0, 1, 1,
0.4366046, -0.3000875, 1.023616, 0.05098039, 0, 1, 1,
0.4391257, 1.507914, 1.695709, 0.05490196, 0, 1, 1,
0.441341, 0.02555301, 2.848387, 0.0627451, 0, 1, 1,
0.4430396, 0.5466332, -0.00467807, 0.06666667, 0, 1, 1,
0.4470119, 0.1253954, 2.291893, 0.07450981, 0, 1, 1,
0.4502703, 0.2818594, 1.378484, 0.07843138, 0, 1, 1,
0.4505897, -0.7644901, 3.636904, 0.08627451, 0, 1, 1,
0.4507155, 0.22972, 2.058285, 0.09019608, 0, 1, 1,
0.4543014, 0.4678459, 1.086874, 0.09803922, 0, 1, 1,
0.4675335, -0.01591364, 1.388124, 0.1058824, 0, 1, 1,
0.4728616, -0.6379191, 2.674138, 0.1098039, 0, 1, 1,
0.475069, 0.6248439, 0.9065461, 0.1176471, 0, 1, 1,
0.4752458, -1.819321, 3.883322, 0.1215686, 0, 1, 1,
0.4947854, 0.1571012, 0.9961303, 0.1294118, 0, 1, 1,
0.5007184, 0.5261523, 1.540606, 0.1333333, 0, 1, 1,
0.5017783, -0.7211639, 3.537858, 0.1411765, 0, 1, 1,
0.502874, 0.7778743, 0.5890667, 0.145098, 0, 1, 1,
0.509364, 1.364981, -0.3877249, 0.1529412, 0, 1, 1,
0.5121565, -1.641117, 2.33216, 0.1568628, 0, 1, 1,
0.512307, -0.4186931, 1.05076, 0.1647059, 0, 1, 1,
0.5142597, 0.09923848, 2.313825, 0.1686275, 0, 1, 1,
0.5200123, -0.3227744, 2.369351, 0.1764706, 0, 1, 1,
0.5215169, 2.035886, 1.814104, 0.1803922, 0, 1, 1,
0.5247099, 1.01074, -0.9809254, 0.1882353, 0, 1, 1,
0.5250336, 1.85534, -0.3355825, 0.1921569, 0, 1, 1,
0.5252997, -1.511974, 2.977914, 0.2, 0, 1, 1,
0.5306592, 1.725665, 0.1384687, 0.2078431, 0, 1, 1,
0.531597, 1.641023, 0.778887, 0.2117647, 0, 1, 1,
0.5341055, -0.505653, 2.239467, 0.2196078, 0, 1, 1,
0.536553, 2.850766, 1.023581, 0.2235294, 0, 1, 1,
0.5370755, 0.7854025, -0.4499113, 0.2313726, 0, 1, 1,
0.5382851, -0.5346859, 1.352428, 0.2352941, 0, 1, 1,
0.5536587, 0.7713542, -1.981725, 0.2431373, 0, 1, 1,
0.5538118, 1.206781e-05, 1.565245, 0.2470588, 0, 1, 1,
0.5550872, 1.913493, 1.911573, 0.254902, 0, 1, 1,
0.5552331, 1.274689, 0.1352669, 0.2588235, 0, 1, 1,
0.5563586, 0.688046, 1.092831, 0.2666667, 0, 1, 1,
0.5581518, -0.7696009, 2.170296, 0.2705882, 0, 1, 1,
0.5624565, -0.8765051, 1.575768, 0.2784314, 0, 1, 1,
0.5659587, -0.05364622, 0.2691739, 0.282353, 0, 1, 1,
0.5713448, 1.360474, -2.110823, 0.2901961, 0, 1, 1,
0.5906778, 1.139833, 0.1464247, 0.2941177, 0, 1, 1,
0.5910934, 0.669076, 0.7058142, 0.3019608, 0, 1, 1,
0.5913871, 1.184252, 0.1612147, 0.3098039, 0, 1, 1,
0.5960423, -1.146995, 1.389598, 0.3137255, 0, 1, 1,
0.5991265, -1.105166, 3.021669, 0.3215686, 0, 1, 1,
0.6017115, 0.0001798626, 2.573946, 0.3254902, 0, 1, 1,
0.6019236, -1.135457, 3.579896, 0.3333333, 0, 1, 1,
0.607044, -0.614312, 1.867024, 0.3372549, 0, 1, 1,
0.6074193, 1.45786, -0.5997081, 0.345098, 0, 1, 1,
0.6081704, 0.1308218, 0.589303, 0.3490196, 0, 1, 1,
0.6108211, -1.61001, 1.99841, 0.3568628, 0, 1, 1,
0.6120441, 0.9861456, -0.1143696, 0.3607843, 0, 1, 1,
0.6142835, 0.1123889, 1.953995, 0.3686275, 0, 1, 1,
0.6158369, 1.417387, 0.627176, 0.372549, 0, 1, 1,
0.6230357, 1.352591, 1.052714, 0.3803922, 0, 1, 1,
0.6235899, -0.8405184, 2.479114, 0.3843137, 0, 1, 1,
0.6332953, 0.3272006, 1.392925, 0.3921569, 0, 1, 1,
0.6342372, 0.3254227, 2.4829, 0.3960784, 0, 1, 1,
0.6377247, 0.1620891, 1.344578, 0.4039216, 0, 1, 1,
0.6395038, 0.5056158, 1.53298, 0.4117647, 0, 1, 1,
0.6408448, -0.2805613, 3.337298, 0.4156863, 0, 1, 1,
0.6425474, 1.595163, 1.503736, 0.4235294, 0, 1, 1,
0.6459184, 0.6386963, 1.677719, 0.427451, 0, 1, 1,
0.6470191, -1.168652, 2.106106, 0.4352941, 0, 1, 1,
0.6472575, 0.9560062, 0.5253457, 0.4392157, 0, 1, 1,
0.6483524, 1.25094, 1.554712, 0.4470588, 0, 1, 1,
0.6516473, -0.2150785, 1.747858, 0.4509804, 0, 1, 1,
0.654335, 0.6182076, 0.927404, 0.4588235, 0, 1, 1,
0.6562777, -0.1917775, 2.284734, 0.4627451, 0, 1, 1,
0.6586266, -0.1823215, 2.711606, 0.4705882, 0, 1, 1,
0.6587749, -0.01814189, 3.39425, 0.4745098, 0, 1, 1,
0.658781, -0.673977, 0.5409344, 0.4823529, 0, 1, 1,
0.6673985, 1.014709, 0.8666342, 0.4862745, 0, 1, 1,
0.6685033, 1.386147, -0.1587487, 0.4941176, 0, 1, 1,
0.6711733, 0.02291976, 2.845267, 0.5019608, 0, 1, 1,
0.6779226, 0.3187689, 0.1699125, 0.5058824, 0, 1, 1,
0.6782852, 0.289119, -0.04780245, 0.5137255, 0, 1, 1,
0.6800284, -0.304591, 3.29139, 0.5176471, 0, 1, 1,
0.6806351, 0.2681873, 0.5671703, 0.5254902, 0, 1, 1,
0.6809884, 1.24288, -0.6109129, 0.5294118, 0, 1, 1,
0.6813, -0.2100962, 1.457034, 0.5372549, 0, 1, 1,
0.6816829, -0.1053731, 1.894882, 0.5411765, 0, 1, 1,
0.6876704, 2.251841, -0.4675307, 0.5490196, 0, 1, 1,
0.6881741, 0.05146681, 0.5750443, 0.5529412, 0, 1, 1,
0.7209657, 0.04060059, 0.7811577, 0.5607843, 0, 1, 1,
0.7221978, -2.350973, 4.02379, 0.5647059, 0, 1, 1,
0.7256818, 0.3848209, 1.337044, 0.572549, 0, 1, 1,
0.7273104, -1.015221, 3.612658, 0.5764706, 0, 1, 1,
0.7325897, -0.2710098, 2.16322, 0.5843138, 0, 1, 1,
0.7326083, 0.02685173, 1.530307, 0.5882353, 0, 1, 1,
0.7356011, 0.9288853, 1.273618, 0.5960785, 0, 1, 1,
0.7380201, -1.138206, 2.72321, 0.6039216, 0, 1, 1,
0.7406556, -0.7769531, 0.9910489, 0.6078432, 0, 1, 1,
0.7543052, 0.07676709, 2.294123, 0.6156863, 0, 1, 1,
0.7576073, 2.119352, -0.58148, 0.6196079, 0, 1, 1,
0.7620953, -0.1221148, 1.788561, 0.627451, 0, 1, 1,
0.7713549, -0.4184097, 0.06583296, 0.6313726, 0, 1, 1,
0.7726852, 1.742682, 0.6710185, 0.6392157, 0, 1, 1,
0.7734503, -0.8520636, 3.185893, 0.6431373, 0, 1, 1,
0.7761066, -1.061374, 3.665777, 0.6509804, 0, 1, 1,
0.7784408, -0.7792241, 1.741251, 0.654902, 0, 1, 1,
0.7801663, -0.2753993, 1.796204, 0.6627451, 0, 1, 1,
0.785036, 1.655062, 1.156203, 0.6666667, 0, 1, 1,
0.7858701, 0.8146031, 0.9318999, 0.6745098, 0, 1, 1,
0.7929977, 0.2212902, 2.0345, 0.6784314, 0, 1, 1,
0.7933081, 0.9866051, 0.4450396, 0.6862745, 0, 1, 1,
0.7958023, 0.6292932, -0.3040601, 0.6901961, 0, 1, 1,
0.8004205, -0.8927184, 3.293336, 0.6980392, 0, 1, 1,
0.8039505, 0.2038611, 1.79788, 0.7058824, 0, 1, 1,
0.8067726, -0.02228072, 0.2264739, 0.7098039, 0, 1, 1,
0.8179226, -0.9771488, 1.6828, 0.7176471, 0, 1, 1,
0.8227338, 0.8846229, -0.4352507, 0.7215686, 0, 1, 1,
0.8229397, 1.366632, -0.3409499, 0.7294118, 0, 1, 1,
0.8233832, -0.7415543, 2.774357, 0.7333333, 0, 1, 1,
0.8284115, 0.178636, 1.859614, 0.7411765, 0, 1, 1,
0.8309574, -0.3410846, 2.638912, 0.7450981, 0, 1, 1,
0.8322771, 0.666047, 3.053329, 0.7529412, 0, 1, 1,
0.8353996, -1.470088, 3.300664, 0.7568628, 0, 1, 1,
0.8372982, 0.03251721, 2.083932, 0.7647059, 0, 1, 1,
0.8390176, -0.7998191, 1.319314, 0.7686275, 0, 1, 1,
0.8446064, 0.3273027, 0.3211033, 0.7764706, 0, 1, 1,
0.8458541, -0.273799, 2.111278, 0.7803922, 0, 1, 1,
0.8559028, -0.8756386, 1.091256, 0.7882353, 0, 1, 1,
0.85919, 1.113338, -0.142491, 0.7921569, 0, 1, 1,
0.8597399, -0.7664524, 2.566792, 0.8, 0, 1, 1,
0.8615831, -0.4737676, 2.758663, 0.8078431, 0, 1, 1,
0.8622937, 1.445078, -0.7868629, 0.8117647, 0, 1, 1,
0.866964, 0.9826186, 0.7708181, 0.8196079, 0, 1, 1,
0.8680549, 0.1237618, 1.49482, 0.8235294, 0, 1, 1,
0.8724813, -0.1787927, 2.320136, 0.8313726, 0, 1, 1,
0.8734505, 0.8160161, -0.5402521, 0.8352941, 0, 1, 1,
0.8735123, -1.379986, 1.676231, 0.8431373, 0, 1, 1,
0.8777103, -0.6345052, 4.679965, 0.8470588, 0, 1, 1,
0.8862635, -0.1138426, 2.916922, 0.854902, 0, 1, 1,
0.8891061, -0.5550149, 4.026965, 0.8588235, 0, 1, 1,
0.8903118, 2.35161, 0.3722619, 0.8666667, 0, 1, 1,
0.8906655, 2.693321, -1.251137, 0.8705882, 0, 1, 1,
0.8928223, 0.2508195, 0.815821, 0.8784314, 0, 1, 1,
0.8962296, 2.512352, 0.6955019, 0.8823529, 0, 1, 1,
0.8983988, -0.4328127, 1.760187, 0.8901961, 0, 1, 1,
0.8989684, -0.5418109, 3.572692, 0.8941177, 0, 1, 1,
0.9036637, -1.21649, 2.305058, 0.9019608, 0, 1, 1,
0.9060211, 1.266672, 1.7535, 0.9098039, 0, 1, 1,
0.9153739, -0.6433758, 2.557804, 0.9137255, 0, 1, 1,
0.9218432, -0.8169323, 2.246927, 0.9215686, 0, 1, 1,
0.9287249, 0.1555723, 3.189091, 0.9254902, 0, 1, 1,
0.930722, -0.1147581, 1.111814, 0.9333333, 0, 1, 1,
0.9372796, 0.3334117, 0.7280413, 0.9372549, 0, 1, 1,
0.942214, 0.5112286, 0.1837574, 0.945098, 0, 1, 1,
0.9431392, 0.6052388, -0.0004362635, 0.9490196, 0, 1, 1,
0.9490527, 0.7692216, -0.3622269, 0.9568627, 0, 1, 1,
0.9506885, 1.956631, 1.068811, 0.9607843, 0, 1, 1,
0.9519672, -0.4071633, 2.028753, 0.9686275, 0, 1, 1,
0.9556072, -0.5595587, 1.68214, 0.972549, 0, 1, 1,
0.9571161, -0.09089042, 2.641415, 0.9803922, 0, 1, 1,
0.9656411, 0.5476949, 0.255952, 0.9843137, 0, 1, 1,
0.9665812, 0.2850569, 0.2895868, 0.9921569, 0, 1, 1,
0.9687987, -0.1176078, 2.677206, 0.9960784, 0, 1, 1,
0.9729125, 0.05951162, 1.083813, 1, 0, 0.9960784, 1,
0.9764454, -1.572562, 1.049796, 1, 0, 0.9882353, 1,
0.9777991, 0.4703705, 2.547446, 1, 0, 0.9843137, 1,
0.9780626, 1.233307, 0.4754799, 1, 0, 0.9764706, 1,
0.9839816, 0.9749422, 2.200597, 1, 0, 0.972549, 1,
0.9899049, 0.5545167, 0.2087992, 1, 0, 0.9647059, 1,
0.9977649, 0.8396947, 1.332002, 1, 0, 0.9607843, 1,
1.001481, 0.3298537, 1.05416, 1, 0, 0.9529412, 1,
1.00404, -0.4393122, 2.170329, 1, 0, 0.9490196, 1,
1.004777, -0.3878074, 1.521958, 1, 0, 0.9411765, 1,
1.005604, 0.3259599, 1.414388, 1, 0, 0.9372549, 1,
1.010267, 1.509221, 1.730368, 1, 0, 0.9294118, 1,
1.012381, 0.6111424, 1.940093, 1, 0, 0.9254902, 1,
1.015777, 1.130877, 2.909328, 1, 0, 0.9176471, 1,
1.024658, 0.3967016, 0.7313016, 1, 0, 0.9137255, 1,
1.027164, -0.04913284, 0.4705407, 1, 0, 0.9058824, 1,
1.033203, 0.2152614, 2.121428, 1, 0, 0.9019608, 1,
1.040532, 0.8336846, 0.9604087, 1, 0, 0.8941177, 1,
1.043213, -0.4609833, 2.717292, 1, 0, 0.8862745, 1,
1.045379, -1.464337, 1.014419, 1, 0, 0.8823529, 1,
1.046207, -1.079163, 1.85216, 1, 0, 0.8745098, 1,
1.047351, 0.3297895, 1.492121, 1, 0, 0.8705882, 1,
1.06141, 1.278278, 0.819456, 1, 0, 0.8627451, 1,
1.061713, -0.8483492, 1.863717, 1, 0, 0.8588235, 1,
1.066849, 1.240568, 1.310862, 1, 0, 0.8509804, 1,
1.071204, -2.080261, 3.704895, 1, 0, 0.8470588, 1,
1.075902, 1.095826, 1.37633, 1, 0, 0.8392157, 1,
1.077312, -0.890925, 2.639478, 1, 0, 0.8352941, 1,
1.078029, 0.3684323, 2.542453, 1, 0, 0.827451, 1,
1.083744, -0.4858233, 4.539503, 1, 0, 0.8235294, 1,
1.088137, 0.6759374, 1.406022, 1, 0, 0.8156863, 1,
1.094398, 0.8588166, 1.103168, 1, 0, 0.8117647, 1,
1.099125, 0.9838873, 0.780265, 1, 0, 0.8039216, 1,
1.11564, -1.202525, 4.509939, 1, 0, 0.7960784, 1,
1.117628, -0.05989116, 3.233054, 1, 0, 0.7921569, 1,
1.117707, 1.390562, 2.010254, 1, 0, 0.7843137, 1,
1.121979, 1.821775, 0.3059902, 1, 0, 0.7803922, 1,
1.129135, -0.03689955, 0.0951189, 1, 0, 0.772549, 1,
1.138559, -1.233484, 1.098357, 1, 0, 0.7686275, 1,
1.144765, -0.7846897, 1.759237, 1, 0, 0.7607843, 1,
1.154103, 0.5166061, 1.655651, 1, 0, 0.7568628, 1,
1.159198, 0.7643718, 2.092123, 1, 0, 0.7490196, 1,
1.163601, -0.2910065, 1.690673, 1, 0, 0.7450981, 1,
1.166963, -0.8234711, 2.313394, 1, 0, 0.7372549, 1,
1.182784, -0.8313698, 1.788128, 1, 0, 0.7333333, 1,
1.189462, 0.75087, -1.271328, 1, 0, 0.7254902, 1,
1.19472, -0.461545, 0.6419026, 1, 0, 0.7215686, 1,
1.210612, -0.02343513, 1.698564, 1, 0, 0.7137255, 1,
1.228333, 0.4737342, 0.7415382, 1, 0, 0.7098039, 1,
1.22927, -2.171019, 2.770086, 1, 0, 0.7019608, 1,
1.233323, -0.6049125, -0.4035119, 1, 0, 0.6941177, 1,
1.240621, 1.483703, 2.380789, 1, 0, 0.6901961, 1,
1.247106, 2.120064, -1.083249, 1, 0, 0.682353, 1,
1.247214, 1.472729, -0.7654347, 1, 0, 0.6784314, 1,
1.24763, -0.8738424, 2.771892, 1, 0, 0.6705883, 1,
1.258405, 0.9955003, 1.935126, 1, 0, 0.6666667, 1,
1.272114, 1.416816, -0.32229, 1, 0, 0.6588235, 1,
1.280817, -0.1584581, 2.168961, 1, 0, 0.654902, 1,
1.296962, 0.795396, 1.351599, 1, 0, 0.6470588, 1,
1.29936, -1.232635, 3.683649, 1, 0, 0.6431373, 1,
1.304401, 1.389429, 2.278244, 1, 0, 0.6352941, 1,
1.307235, -0.6249368, 2.824513, 1, 0, 0.6313726, 1,
1.312914, 0.9141284, 1.207196, 1, 0, 0.6235294, 1,
1.319671, -0.2384378, 2.558653, 1, 0, 0.6196079, 1,
1.324866, -0.4891534, 4.57515, 1, 0, 0.6117647, 1,
1.333873, 1.780247, -0.1681331, 1, 0, 0.6078432, 1,
1.337987, -0.3079076, 2.693846, 1, 0, 0.6, 1,
1.346394, -0.6586888, 0.8399078, 1, 0, 0.5921569, 1,
1.347523, 0.09374475, 0.5592056, 1, 0, 0.5882353, 1,
1.347717, 0.3281543, -0.04798131, 1, 0, 0.5803922, 1,
1.357497, -1.318001, 1.358131, 1, 0, 0.5764706, 1,
1.362957, 1.103742, 2.805732, 1, 0, 0.5686275, 1,
1.364031, 0.6349524, 1.081204, 1, 0, 0.5647059, 1,
1.364634, -1.019161, 4.031322, 1, 0, 0.5568628, 1,
1.366012, -0.121092, 0.8432043, 1, 0, 0.5529412, 1,
1.366578, -1.27709, 3.105594, 1, 0, 0.5450981, 1,
1.380004, -0.09215841, 3.046268, 1, 0, 0.5411765, 1,
1.395591, -0.3830934, 1.768943, 1, 0, 0.5333334, 1,
1.401098, 1.331683, 2.214107, 1, 0, 0.5294118, 1,
1.405364, 0.3142236, 2.02353, 1, 0, 0.5215687, 1,
1.405828, 0.6189518, 2.085886, 1, 0, 0.5176471, 1,
1.413195, -0.7757849, 3.323538, 1, 0, 0.509804, 1,
1.415258, 0.06524363, 1.896399, 1, 0, 0.5058824, 1,
1.417976, -1.457049, 2.570776, 1, 0, 0.4980392, 1,
1.427673, -1.945057, 1.093322, 1, 0, 0.4901961, 1,
1.44428, -1.372154, 1.636231, 1, 0, 0.4862745, 1,
1.455973, -1.020128, 3.240114, 1, 0, 0.4784314, 1,
1.463821, -0.1104162, 0.7468919, 1, 0, 0.4745098, 1,
1.465774, -0.8050593, 1.228414, 1, 0, 0.4666667, 1,
1.466421, 0.3387637, 3.463325, 1, 0, 0.4627451, 1,
1.472949, -1.222892, 1.822634, 1, 0, 0.454902, 1,
1.475971, -0.1636614, 2.040279, 1, 0, 0.4509804, 1,
1.476862, 0.2656597, 0.3600581, 1, 0, 0.4431373, 1,
1.478766, -0.3556239, 2.590058, 1, 0, 0.4392157, 1,
1.491753, -1.038653, 2.712554, 1, 0, 0.4313726, 1,
1.495967, 2.010715, 1.710107, 1, 0, 0.427451, 1,
1.498366, -2.087927, 1.825787, 1, 0, 0.4196078, 1,
1.508549, 0.1105094, -0.5927832, 1, 0, 0.4156863, 1,
1.514679, 1.082501, 1.348464, 1, 0, 0.4078431, 1,
1.519209, 0.3027087, 1.399832, 1, 0, 0.4039216, 1,
1.534059, -0.5650408, 2.928695, 1, 0, 0.3960784, 1,
1.534487, -1.527573, 2.560581, 1, 0, 0.3882353, 1,
1.559781, -0.2179567, 1.904169, 1, 0, 0.3843137, 1,
1.561194, 2.422338, 0.483143, 1, 0, 0.3764706, 1,
1.562493, -0.2860244, 0.7588708, 1, 0, 0.372549, 1,
1.565219, 0.4923275, 2.081589, 1, 0, 0.3647059, 1,
1.56566, 1.046871, 1.288725, 1, 0, 0.3607843, 1,
1.574411, 0.3493994, 2.390293, 1, 0, 0.3529412, 1,
1.600863, -1.511661, 2.111202, 1, 0, 0.3490196, 1,
1.612103, -2.533523, 3.164493, 1, 0, 0.3411765, 1,
1.613726, -0.4728656, 2.241416, 1, 0, 0.3372549, 1,
1.618847, 0.3522976, 0.791365, 1, 0, 0.3294118, 1,
1.635352, -0.09743148, 1.686043, 1, 0, 0.3254902, 1,
1.636155, -0.04796762, 2.455024, 1, 0, 0.3176471, 1,
1.643819, -2.009767, 3.537685, 1, 0, 0.3137255, 1,
1.647926, 0.09790231, 0.9689587, 1, 0, 0.3058824, 1,
1.651357, 0.1475637, 1.091416, 1, 0, 0.2980392, 1,
1.661124, 0.1867308, -0.7096809, 1, 0, 0.2941177, 1,
1.661751, 1.487039, 1.690616, 1, 0, 0.2862745, 1,
1.662323, 0.3034216, 2.398704, 1, 0, 0.282353, 1,
1.662628, 0.805425, 1.004794, 1, 0, 0.2745098, 1,
1.663746, 1.03155, -0.9946862, 1, 0, 0.2705882, 1,
1.665997, -0.7841836, 1.798599, 1, 0, 0.2627451, 1,
1.669803, -0.7599818, 2.936337, 1, 0, 0.2588235, 1,
1.670442, 0.4860552, 1.310894, 1, 0, 0.2509804, 1,
1.676794, 0.2948548, 2.134061, 1, 0, 0.2470588, 1,
1.686228, -1.607164, 3.205207, 1, 0, 0.2392157, 1,
1.695803, -0.9070248, 2.60235, 1, 0, 0.2352941, 1,
1.718621, -1.762258, 2.29827, 1, 0, 0.227451, 1,
1.725823, 0.5356458, 2.379233, 1, 0, 0.2235294, 1,
1.755057, -0.3366414, 1.498265, 1, 0, 0.2156863, 1,
1.775131, -0.9485013, 1.478949, 1, 0, 0.2117647, 1,
1.775567, 1.246538, 0.1982415, 1, 0, 0.2039216, 1,
1.776066, -2.519232, 2.756797, 1, 0, 0.1960784, 1,
1.778291, 1.479161, 1.663345, 1, 0, 0.1921569, 1,
1.791502, -1.554836, 3.147054, 1, 0, 0.1843137, 1,
1.803037, -1.522277, 4.451364, 1, 0, 0.1803922, 1,
1.807367, -0.2781433, 2.810478, 1, 0, 0.172549, 1,
1.826024, -1.032592, 3.569009, 1, 0, 0.1686275, 1,
1.845325, 0.5896546, 1.034945, 1, 0, 0.1607843, 1,
1.86754, -0.1806596, 2.397823, 1, 0, 0.1568628, 1,
1.867883, 0.2775659, 0.698382, 1, 0, 0.1490196, 1,
1.880332, -0.4681108, 1.331833, 1, 0, 0.145098, 1,
1.907589, -0.2296028, 2.242232, 1, 0, 0.1372549, 1,
1.918339, -0.6046161, 2.461749, 1, 0, 0.1333333, 1,
1.927409, 2.37026, 3.235328, 1, 0, 0.1254902, 1,
1.961812, -0.9139673, 2.430655, 1, 0, 0.1215686, 1,
1.962193, 0.8047956, 0.7703834, 1, 0, 0.1137255, 1,
1.970971, -0.8492102, 3.184159, 1, 0, 0.1098039, 1,
1.976584, 1.011405, 2.260924, 1, 0, 0.1019608, 1,
1.97796, -0.1935626, 1.672406, 1, 0, 0.09411765, 1,
1.987713, -0.4090041, 0.6424004, 1, 0, 0.09019608, 1,
1.999066, 0.06542111, 0.8796484, 1, 0, 0.08235294, 1,
2.037698, 0.939228, 1.252771, 1, 0, 0.07843138, 1,
2.056, -2.588884, 5.017151, 1, 0, 0.07058824, 1,
2.063562, -0.4651884, 0.7122262, 1, 0, 0.06666667, 1,
2.079321, 0.0427186, 0.4682836, 1, 0, 0.05882353, 1,
2.081994, 1.504863, -0.2501914, 1, 0, 0.05490196, 1,
2.119889, -1.794219, 3.43833, 1, 0, 0.04705882, 1,
2.18928, -1.344553, 2.770627, 1, 0, 0.04313726, 1,
2.323973, 1.085215, 0.4299162, 1, 0, 0.03529412, 1,
2.439923, 0.2278628, 0.6008745, 1, 0, 0.03137255, 1,
2.471425, -0.5114633, 2.628021, 1, 0, 0.02352941, 1,
2.839102, 1.483756, 0.3035723, 1, 0, 0.01960784, 1,
3.029422, 0.3020979, -0.02111691, 1, 0, 0.01176471, 1,
3.346375, -0.5802357, 2.908278, 1, 0, 0.007843138, 1
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
0.1961594, -3.91276, -7.393824, 0, -0.5, 0.5, 0.5,
0.1961594, -3.91276, -7.393824, 1, -0.5, 0.5, 0.5,
0.1961594, -3.91276, -7.393824, 1, 1.5, 0.5, 0.5,
0.1961594, -3.91276, -7.393824, 0, 1.5, 0.5, 0.5
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
-4.02198, 0.3061783, -7.393824, 0, -0.5, 0.5, 0.5,
-4.02198, 0.3061783, -7.393824, 1, -0.5, 0.5, 0.5,
-4.02198, 0.3061783, -7.393824, 1, 1.5, 0.5, 0.5,
-4.02198, 0.3061783, -7.393824, 0, 1.5, 0.5, 0.5
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
-4.02198, -3.91276, -0.1898117, 0, -0.5, 0.5, 0.5,
-4.02198, -3.91276, -0.1898117, 1, -0.5, 0.5, 0.5,
-4.02198, -3.91276, -0.1898117, 1, 1.5, 0.5, 0.5,
-4.02198, -3.91276, -0.1898117, 0, 1.5, 0.5, 0.5
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
-2, -2.939159, -5.731359,
3, -2.939159, -5.731359,
-2, -2.939159, -5.731359,
-2, -3.101425, -6.008437,
-1, -2.939159, -5.731359,
-1, -3.101425, -6.008437,
0, -2.939159, -5.731359,
0, -3.101425, -6.008437,
1, -2.939159, -5.731359,
1, -3.101425, -6.008437,
2, -2.939159, -5.731359,
2, -3.101425, -6.008437,
3, -2.939159, -5.731359,
3, -3.101425, -6.008437
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
-2, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
-2, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
-2, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
-2, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5,
-1, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
-1, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
-1, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
-1, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5,
0, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
0, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
0, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
0, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5,
1, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
1, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
1, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
1, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5,
2, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
2, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
2, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
2, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5,
3, -3.425959, -6.562591, 0, -0.5, 0.5, 0.5,
3, -3.425959, -6.562591, 1, -0.5, 0.5, 0.5,
3, -3.425959, -6.562591, 1, 1.5, 0.5, 0.5,
3, -3.425959, -6.562591, 0, 1.5, 0.5, 0.5
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
-3.048563, -2, -5.731359,
-3.048563, 3, -5.731359,
-3.048563, -2, -5.731359,
-3.210799, -2, -6.008437,
-3.048563, -1, -5.731359,
-3.210799, -1, -6.008437,
-3.048563, 0, -5.731359,
-3.210799, 0, -6.008437,
-3.048563, 1, -5.731359,
-3.210799, 1, -6.008437,
-3.048563, 2, -5.731359,
-3.210799, 2, -6.008437,
-3.048563, 3, -5.731359,
-3.210799, 3, -6.008437
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
-3.535271, -2, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, -2, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, -2, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, -2, -6.562591, 0, 1.5, 0.5, 0.5,
-3.535271, -1, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, -1, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, -1, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, -1, -6.562591, 0, 1.5, 0.5, 0.5,
-3.535271, 0, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, 0, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, 0, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, 0, -6.562591, 0, 1.5, 0.5, 0.5,
-3.535271, 1, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, 1, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, 1, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, 1, -6.562591, 0, 1.5, 0.5, 0.5,
-3.535271, 2, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, 2, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, 2, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, 2, -6.562591, 0, 1.5, 0.5, 0.5,
-3.535271, 3, -6.562591, 0, -0.5, 0.5, 0.5,
-3.535271, 3, -6.562591, 1, -0.5, 0.5, 0.5,
-3.535271, 3, -6.562591, 1, 1.5, 0.5, 0.5,
-3.535271, 3, -6.562591, 0, 1.5, 0.5, 0.5
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
-3.048563, -2.939159, -4,
-3.048563, -2.939159, 4,
-3.048563, -2.939159, -4,
-3.210799, -3.101425, -4,
-3.048563, -2.939159, -2,
-3.210799, -3.101425, -2,
-3.048563, -2.939159, 0,
-3.210799, -3.101425, 0,
-3.048563, -2.939159, 2,
-3.210799, -3.101425, 2,
-3.048563, -2.939159, 4,
-3.210799, -3.101425, 4
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
-3.535271, -3.425959, -4, 0, -0.5, 0.5, 0.5,
-3.535271, -3.425959, -4, 1, -0.5, 0.5, 0.5,
-3.535271, -3.425959, -4, 1, 1.5, 0.5, 0.5,
-3.535271, -3.425959, -4, 0, 1.5, 0.5, 0.5,
-3.535271, -3.425959, -2, 0, -0.5, 0.5, 0.5,
-3.535271, -3.425959, -2, 1, -0.5, 0.5, 0.5,
-3.535271, -3.425959, -2, 1, 1.5, 0.5, 0.5,
-3.535271, -3.425959, -2, 0, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 0, 0, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 0, 1, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 0, 1, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 0, 0, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 2, 0, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 2, 1, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 2, 1, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 2, 0, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 4, 0, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 4, 1, -0.5, 0.5, 0.5,
-3.535271, -3.425959, 4, 1, 1.5, 0.5, 0.5,
-3.535271, -3.425959, 4, 0, 1.5, 0.5, 0.5
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
-3.048563, -2.939159, -5.731359,
-3.048563, 3.551515, -5.731359,
-3.048563, -2.939159, 5.351736,
-3.048563, 3.551515, 5.351736,
-3.048563, -2.939159, -5.731359,
-3.048563, -2.939159, 5.351736,
-3.048563, 3.551515, -5.731359,
-3.048563, 3.551515, 5.351736,
-3.048563, -2.939159, -5.731359,
3.440882, -2.939159, -5.731359,
-3.048563, -2.939159, 5.351736,
3.440882, -2.939159, 5.351736,
-3.048563, 3.551515, -5.731359,
3.440882, 3.551515, -5.731359,
-3.048563, 3.551515, 5.351736,
3.440882, 3.551515, 5.351736,
3.440882, -2.939159, -5.731359,
3.440882, 3.551515, -5.731359,
3.440882, -2.939159, 5.351736,
3.440882, 3.551515, 5.351736,
3.440882, -2.939159, -5.731359,
3.440882, -2.939159, 5.351736,
3.440882, 3.551515, -5.731359,
3.440882, 3.551515, 5.351736
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
var radius = 7.684066;
var distance = 34.18728;
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
mvMatrix.translate( -0.1961594, -0.3061783, 0.1898117 );
mvMatrix.scale( 1.280258, 1.280015, 0.7496248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18728);
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


