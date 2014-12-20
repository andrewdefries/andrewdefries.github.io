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
-3.627836, -0.4656316, -1.554567, 1, 0, 0, 1,
-2.97428, -0.2695831, -2.584778, 1, 0.007843138, 0, 1,
-2.954663, 0.1009618, -1.633971, 1, 0.01176471, 0, 1,
-2.882067, 0.5577091, -1.965762, 1, 0.01960784, 0, 1,
-2.85667, 0.5799779, -0.4661898, 1, 0.02352941, 0, 1,
-2.85322, -0.2431674, -1.944686, 1, 0.03137255, 0, 1,
-2.844928, 0.278321, -1.799746, 1, 0.03529412, 0, 1,
-2.698212, -1.068699, -1.658693, 1, 0.04313726, 0, 1,
-2.669489, 1.582471, -0.2660197, 1, 0.04705882, 0, 1,
-2.595852, -0.4471159, -0.6442536, 1, 0.05490196, 0, 1,
-2.571824, -0.2619878, -2.437586, 1, 0.05882353, 0, 1,
-2.571003, -0.3715905, -1.784235, 1, 0.06666667, 0, 1,
-2.517332, -0.4455263, -4.221749, 1, 0.07058824, 0, 1,
-2.454134, 0.487231, -1.909758, 1, 0.07843138, 0, 1,
-2.372756, 0.6374317, -1.176834, 1, 0.08235294, 0, 1,
-2.34143, -0.6139967, -3.579189, 1, 0.09019608, 0, 1,
-2.309408, 0.3105728, -2.499396, 1, 0.09411765, 0, 1,
-2.263717, -1.36248, -1.536899, 1, 0.1019608, 0, 1,
-2.258778, 0.07708831, -2.304565, 1, 0.1098039, 0, 1,
-2.202544, 1.27248, 0.320201, 1, 0.1137255, 0, 1,
-2.122937, 0.44207, -1.466316, 1, 0.1215686, 0, 1,
-2.120924, 1.458411, -2.815398, 1, 0.1254902, 0, 1,
-2.120311, -0.9464749, -2.108771, 1, 0.1333333, 0, 1,
-2.101, -0.9325078, -3.358717, 1, 0.1372549, 0, 1,
-2.100788, -0.1206144, -1.057752, 1, 0.145098, 0, 1,
-2.093797, 0.935094, -0.2540984, 1, 0.1490196, 0, 1,
-2.085179, -2.202905, -1.839442, 1, 0.1568628, 0, 1,
-2.060001, 1.372499, -1.445493, 1, 0.1607843, 0, 1,
-2.051363, 0.6324996, -2.314079, 1, 0.1686275, 0, 1,
-2.00915, 2.223644, -1.80173, 1, 0.172549, 0, 1,
-1.974984, -0.1735702, -3.616595, 1, 0.1803922, 0, 1,
-1.929959, 0.6144755, -0.7486074, 1, 0.1843137, 0, 1,
-1.917727, -1.777586, -3.445934, 1, 0.1921569, 0, 1,
-1.917607, -1.785776, -1.215014, 1, 0.1960784, 0, 1,
-1.908359, 1.007947, -0.4912024, 1, 0.2039216, 0, 1,
-1.892343, 0.7115678, -1.827774, 1, 0.2117647, 0, 1,
-1.884892, 0.1481423, -1.621993, 1, 0.2156863, 0, 1,
-1.884873, -1.575714, -1.91041, 1, 0.2235294, 0, 1,
-1.868673, -0.1826343, -2.642139, 1, 0.227451, 0, 1,
-1.833401, 0.8570551, 0.8589917, 1, 0.2352941, 0, 1,
-1.812947, -0.0996043, -1.932733, 1, 0.2392157, 0, 1,
-1.805861, 0.3085105, 0.3989544, 1, 0.2470588, 0, 1,
-1.802061, 1.027402, -1.393626, 1, 0.2509804, 0, 1,
-1.79535, 1.814805, 0.8395789, 1, 0.2588235, 0, 1,
-1.794526, 2.072379, -1.731363, 1, 0.2627451, 0, 1,
-1.788576, 0.7505749, -2.193946, 1, 0.2705882, 0, 1,
-1.783786, -0.4747066, -3.200264, 1, 0.2745098, 0, 1,
-1.782273, 0.4811653, 0.4307244, 1, 0.282353, 0, 1,
-1.77263, 2.832421, -1.418099, 1, 0.2862745, 0, 1,
-1.770683, 0.411589, -1.261124, 1, 0.2941177, 0, 1,
-1.737783, 0.3797548, -3.028242, 1, 0.3019608, 0, 1,
-1.72498, -0.6762803, -0.1709736, 1, 0.3058824, 0, 1,
-1.691758, 1.173144, -0.003701176, 1, 0.3137255, 0, 1,
-1.69155, -0.4521833, -0.196844, 1, 0.3176471, 0, 1,
-1.663083, 0.5397123, -1.921744, 1, 0.3254902, 0, 1,
-1.64863, 2.956282, -0.1746127, 1, 0.3294118, 0, 1,
-1.646832, 0.9848913, -0.5152781, 1, 0.3372549, 0, 1,
-1.637573, -1.352531, -4.204287, 1, 0.3411765, 0, 1,
-1.62505, 0.4890778, -1.133189, 1, 0.3490196, 0, 1,
-1.622182, -2.090158, -2.810162, 1, 0.3529412, 0, 1,
-1.610372, -0.4574472, -0.5503035, 1, 0.3607843, 0, 1,
-1.595901, 2.011443, 0.3267156, 1, 0.3647059, 0, 1,
-1.581621, -0.9554893, -3.010615, 1, 0.372549, 0, 1,
-1.570202, -0.6708089, -2.588104, 1, 0.3764706, 0, 1,
-1.569181, -0.465544, -1.527369, 1, 0.3843137, 0, 1,
-1.567205, -0.8801199, -2.305026, 1, 0.3882353, 0, 1,
-1.555269, -0.7246413, -2.471996, 1, 0.3960784, 0, 1,
-1.540535, 0.7376756, -0.2676946, 1, 0.4039216, 0, 1,
-1.540408, -0.2996784, 0.03403425, 1, 0.4078431, 0, 1,
-1.524304, 1.555807, -1.282105, 1, 0.4156863, 0, 1,
-1.513094, 1.325043, 0.7779518, 1, 0.4196078, 0, 1,
-1.508931, -1.950995, -1.317503, 1, 0.427451, 0, 1,
-1.506798, 0.5156704, -1.772902, 1, 0.4313726, 0, 1,
-1.499311, 2.433401, -0.03505353, 1, 0.4392157, 0, 1,
-1.477997, -0.189273, -1.617658, 1, 0.4431373, 0, 1,
-1.476645, -0.2724627, -1.578991, 1, 0.4509804, 0, 1,
-1.47585, -0.7877888, -1.648153, 1, 0.454902, 0, 1,
-1.454332, 0.05693849, -1.196111, 1, 0.4627451, 0, 1,
-1.442426, 1.688631, -1.678248, 1, 0.4666667, 0, 1,
-1.441239, 0.7046799, -1.252692, 1, 0.4745098, 0, 1,
-1.433416, -1.213301, -2.713668, 1, 0.4784314, 0, 1,
-1.415415, 1.666443, -1.048867, 1, 0.4862745, 0, 1,
-1.405637, 0.5244736, -2.230443, 1, 0.4901961, 0, 1,
-1.397995, 0.9267345, -0.9067439, 1, 0.4980392, 0, 1,
-1.385869, -0.7376488, -4.68918, 1, 0.5058824, 0, 1,
-1.381633, -0.008094633, -0.9415867, 1, 0.509804, 0, 1,
-1.378341, -0.3130212, -3.101794, 1, 0.5176471, 0, 1,
-1.371542, 0.03937767, -1.736937, 1, 0.5215687, 0, 1,
-1.343665, 0.6124486, -0.8464002, 1, 0.5294118, 0, 1,
-1.342508, 0.6894906, -0.6385447, 1, 0.5333334, 0, 1,
-1.341996, -0.6371893, -1.82339, 1, 0.5411765, 0, 1,
-1.330223, -0.3738504, -2.296971, 1, 0.5450981, 0, 1,
-1.327229, -0.2562997, -1.050607, 1, 0.5529412, 0, 1,
-1.323208, 0.1864787, -1.552054, 1, 0.5568628, 0, 1,
-1.318712, -0.2895026, -1.332388, 1, 0.5647059, 0, 1,
-1.309567, -0.2199117, -3.06165, 1, 0.5686275, 0, 1,
-1.295316, -0.4559752, -2.374746, 1, 0.5764706, 0, 1,
-1.291451, -1.142901, -3.084546, 1, 0.5803922, 0, 1,
-1.290006, 0.6611019, -0.7461889, 1, 0.5882353, 0, 1,
-1.275109, 0.14291, -1.659851, 1, 0.5921569, 0, 1,
-1.260526, 0.8463374, -0.7786952, 1, 0.6, 0, 1,
-1.259472, -0.2247244, -1.244327, 1, 0.6078432, 0, 1,
-1.248932, -1.003392, -2.814035, 1, 0.6117647, 0, 1,
-1.24497, -0.3137831, -2.133047, 1, 0.6196079, 0, 1,
-1.242993, -0.7859561, -1.671433, 1, 0.6235294, 0, 1,
-1.238762, -0.1583181, -1.313303, 1, 0.6313726, 0, 1,
-1.225107, -0.5172062, -0.7057973, 1, 0.6352941, 0, 1,
-1.219478, -0.221136, -2.585259, 1, 0.6431373, 0, 1,
-1.219263, 1.822192, -0.2780948, 1, 0.6470588, 0, 1,
-1.216887, 1.364376, -1.736066, 1, 0.654902, 0, 1,
-1.211063, 0.2569027, -0.4080632, 1, 0.6588235, 0, 1,
-1.208467, -0.8642205, -1.896449, 1, 0.6666667, 0, 1,
-1.199698, -0.417205, -1.994949, 1, 0.6705883, 0, 1,
-1.196263, -1.226844, -2.454327, 1, 0.6784314, 0, 1,
-1.195434, -0.8581989, -3.711299, 1, 0.682353, 0, 1,
-1.193503, 0.1037273, -2.729543, 1, 0.6901961, 0, 1,
-1.188652, -0.4107709, -2.109797, 1, 0.6941177, 0, 1,
-1.187206, 1.112861, -1.797542, 1, 0.7019608, 0, 1,
-1.184179, -0.3896032, -0.4113957, 1, 0.7098039, 0, 1,
-1.176756, -2.549578, -0.9619918, 1, 0.7137255, 0, 1,
-1.172355, -0.809054, -1.867855, 1, 0.7215686, 0, 1,
-1.168232, 0.5188896, -1.971352, 1, 0.7254902, 0, 1,
-1.160962, 1.077045, -0.1527021, 1, 0.7333333, 0, 1,
-1.156443, 0.3118264, 0.0856973, 1, 0.7372549, 0, 1,
-1.152451, 1.058548, 0.9101041, 1, 0.7450981, 0, 1,
-1.149367, 0.4624221, -2.30724, 1, 0.7490196, 0, 1,
-1.136342, 0.4776013, -1.038766, 1, 0.7568628, 0, 1,
-1.122306, -0.9327556, -0.8327768, 1, 0.7607843, 0, 1,
-1.122005, -0.9145615, -1.730097, 1, 0.7686275, 0, 1,
-1.119463, 0.6070403, -1.394377, 1, 0.772549, 0, 1,
-1.118189, 1.191537, 1.000489, 1, 0.7803922, 0, 1,
-1.117437, -1.147659, -1.586346, 1, 0.7843137, 0, 1,
-1.106085, 0.8242382, -1.384309, 1, 0.7921569, 0, 1,
-1.105184, 0.01223359, -1.528689, 1, 0.7960784, 0, 1,
-1.093572, 1.349944, -1.206464, 1, 0.8039216, 0, 1,
-1.06794, 0.6108276, -1.969253, 1, 0.8117647, 0, 1,
-1.065053, -0.7833589, -2.164628, 1, 0.8156863, 0, 1,
-1.063088, -0.8208713, -4.014869, 1, 0.8235294, 0, 1,
-1.06207, -0.8231987, -2.004917, 1, 0.827451, 0, 1,
-1.053794, 0.2169971, -2.305773, 1, 0.8352941, 0, 1,
-1.052731, 1.000526, 1.446346, 1, 0.8392157, 0, 1,
-1.052428, -0.9482423, -2.775504, 1, 0.8470588, 0, 1,
-1.050234, -0.1754699, -1.89704, 1, 0.8509804, 0, 1,
-1.047159, 0.6707984, -0.2673277, 1, 0.8588235, 0, 1,
-1.046561, -0.2889733, 0.3557691, 1, 0.8627451, 0, 1,
-1.046389, 0.5749261, -2.81252, 1, 0.8705882, 0, 1,
-1.040092, 0.01861668, -4.531149, 1, 0.8745098, 0, 1,
-1.037817, 1.239928, -1.363938, 1, 0.8823529, 0, 1,
-1.032622, -0.01053932, -1.320482, 1, 0.8862745, 0, 1,
-1.023784, -1.259563, -3.015911, 1, 0.8941177, 0, 1,
-1.013585, 0.3243898, -1.103596, 1, 0.8980392, 0, 1,
-1.009143, -0.5721526, -0.5317067, 1, 0.9058824, 0, 1,
-0.9960209, -0.6534216, -1.357866, 1, 0.9137255, 0, 1,
-0.9937903, 1.142227, -0.04179389, 1, 0.9176471, 0, 1,
-0.9912478, 1.805494, -0.3151707, 1, 0.9254902, 0, 1,
-0.9870806, -2.248335, -2.570705, 1, 0.9294118, 0, 1,
-0.9833512, -1.04607, -2.632851, 1, 0.9372549, 0, 1,
-0.9822645, -0.2169581, -1.888431, 1, 0.9411765, 0, 1,
-0.9767388, 0.4859205, -2.003355, 1, 0.9490196, 0, 1,
-0.9764569, 0.2764809, -2.998366, 1, 0.9529412, 0, 1,
-0.9641809, 1.801784, 0.8463332, 1, 0.9607843, 0, 1,
-0.944154, 1.101197, -1.977714, 1, 0.9647059, 0, 1,
-0.9439874, -0.9307297, -1.966755, 1, 0.972549, 0, 1,
-0.9406558, -1.094682, -1.453215, 1, 0.9764706, 0, 1,
-0.9383087, -0.1657994, -1.867876, 1, 0.9843137, 0, 1,
-0.9376192, 1.956003, 1.415727, 1, 0.9882353, 0, 1,
-0.9264184, -0.476702, -2.244688, 1, 0.9960784, 0, 1,
-0.9151263, -1.38945, -2.005018, 0.9960784, 1, 0, 1,
-0.914903, 1.291882, 0.09121374, 0.9921569, 1, 0, 1,
-0.9100851, 1.004366, -0.1717035, 0.9843137, 1, 0, 1,
-0.9077735, 0.5461595, -0.117834, 0.9803922, 1, 0, 1,
-0.9038376, -0.9750497, -2.965219, 0.972549, 1, 0, 1,
-0.903583, 0.3482067, -1.081048, 0.9686275, 1, 0, 1,
-0.8996112, 1.477065, -0.8866397, 0.9607843, 1, 0, 1,
-0.897571, -0.9409995, -3.653747, 0.9568627, 1, 0, 1,
-0.8969206, -0.7462316, -0.5504799, 0.9490196, 1, 0, 1,
-0.8944068, 0.3092013, -2.652204, 0.945098, 1, 0, 1,
-0.8863829, -0.3053142, -3.084288, 0.9372549, 1, 0, 1,
-0.8842553, 0.11473, -0.7900452, 0.9333333, 1, 0, 1,
-0.8842129, 0.8225842, 0.2913883, 0.9254902, 1, 0, 1,
-0.8769554, -1.382263, -1.648384, 0.9215686, 1, 0, 1,
-0.8769284, 1.16254, -1.165918, 0.9137255, 1, 0, 1,
-0.8755528, -0.06169894, -2.023901, 0.9098039, 1, 0, 1,
-0.8611374, 1.934496, 0.5525247, 0.9019608, 1, 0, 1,
-0.8498711, 0.892886, -1.740558, 0.8941177, 1, 0, 1,
-0.8488821, -0.3782822, -1.459081, 0.8901961, 1, 0, 1,
-0.8485049, 1.356963, -0.6884357, 0.8823529, 1, 0, 1,
-0.846732, 0.358282, 1.293911, 0.8784314, 1, 0, 1,
-0.8455436, -0.1920206, -1.58212, 0.8705882, 1, 0, 1,
-0.8311901, -0.01141761, -2.830683, 0.8666667, 1, 0, 1,
-0.8309881, 0.4536502, -0.4132484, 0.8588235, 1, 0, 1,
-0.8287178, 0.4219098, -0.9234141, 0.854902, 1, 0, 1,
-0.8244554, 0.2614687, -2.068872, 0.8470588, 1, 0, 1,
-0.8223953, -0.2683889, -1.319947, 0.8431373, 1, 0, 1,
-0.8205165, -0.08046925, -1.825245, 0.8352941, 1, 0, 1,
-0.8195525, 0.6350881, -1.241613, 0.8313726, 1, 0, 1,
-0.8170803, 1.371423, 0.1496802, 0.8235294, 1, 0, 1,
-0.8147299, 0.487472, -1.11299, 0.8196079, 1, 0, 1,
-0.808484, -0.4014862, -3.003787, 0.8117647, 1, 0, 1,
-0.8050581, -2.085845, -3.631917, 0.8078431, 1, 0, 1,
-0.8001652, -1.174802, -2.890638, 0.8, 1, 0, 1,
-0.7984222, -0.2936392, -2.361517, 0.7921569, 1, 0, 1,
-0.7918138, -1.543852, -2.715396, 0.7882353, 1, 0, 1,
-0.788644, -0.2542229, -2.995396, 0.7803922, 1, 0, 1,
-0.7874997, -0.1506405, -1.058349, 0.7764706, 1, 0, 1,
-0.7793887, 0.1668631, -0.8353416, 0.7686275, 1, 0, 1,
-0.7784832, 1.260475, -0.8696494, 0.7647059, 1, 0, 1,
-0.7760538, 1.483125, -1.43054, 0.7568628, 1, 0, 1,
-0.7698362, 0.4278542, -1.462709, 0.7529412, 1, 0, 1,
-0.7685698, -0.8862354, -2.280934, 0.7450981, 1, 0, 1,
-0.7677522, -0.6213791, -2.6319, 0.7411765, 1, 0, 1,
-0.7650084, 0.2211571, -1.887891, 0.7333333, 1, 0, 1,
-0.7625231, 0.5461882, -0.8514158, 0.7294118, 1, 0, 1,
-0.7592575, -1.841633, -5.140003, 0.7215686, 1, 0, 1,
-0.7591076, 0.8110405, -0.01389329, 0.7176471, 1, 0, 1,
-0.7542605, -0.06510615, -1.121574, 0.7098039, 1, 0, 1,
-0.7460144, -0.02373586, -2.024944, 0.7058824, 1, 0, 1,
-0.7360297, -1.785411, -3.125566, 0.6980392, 1, 0, 1,
-0.7332552, -1.234174, -2.462568, 0.6901961, 1, 0, 1,
-0.7287259, 0.9367526, 0.7321782, 0.6862745, 1, 0, 1,
-0.7198952, 0.6558284, -1.286026, 0.6784314, 1, 0, 1,
-0.7140993, 0.6629242, 1.299526, 0.6745098, 1, 0, 1,
-0.7128659, 0.6157777, -1.166167, 0.6666667, 1, 0, 1,
-0.7087326, 1.934687, 1.864481, 0.6627451, 1, 0, 1,
-0.7015209, -0.6698549, -2.250828, 0.654902, 1, 0, 1,
-0.6999152, -2.041805, -2.955177, 0.6509804, 1, 0, 1,
-0.6956233, -0.6393123, -2.372354, 0.6431373, 1, 0, 1,
-0.6942835, 0.2532291, -0.08719087, 0.6392157, 1, 0, 1,
-0.6934357, 0.03473061, -0.5612973, 0.6313726, 1, 0, 1,
-0.6925391, -1.545751, -3.11893, 0.627451, 1, 0, 1,
-0.6875431, 0.6741926, -0.4063029, 0.6196079, 1, 0, 1,
-0.6870177, -0.7001898, -1.934844, 0.6156863, 1, 0, 1,
-0.6831449, -0.847273, -3.724358, 0.6078432, 1, 0, 1,
-0.6788008, 0.8940115, -1.445822, 0.6039216, 1, 0, 1,
-0.6676226, 0.4343159, -1.574014, 0.5960785, 1, 0, 1,
-0.6571102, -0.3571225, -2.782786, 0.5882353, 1, 0, 1,
-0.6537989, 0.1927091, -0.6952149, 0.5843138, 1, 0, 1,
-0.6511346, -0.8735082, -1.857258, 0.5764706, 1, 0, 1,
-0.6471398, 0.9247659, -1.397512, 0.572549, 1, 0, 1,
-0.6467478, -0.1702638, -1.410384, 0.5647059, 1, 0, 1,
-0.6438633, -0.7727296, -2.909129, 0.5607843, 1, 0, 1,
-0.6374243, -1.514901, -3.472845, 0.5529412, 1, 0, 1,
-0.635411, -0.4766945, -0.939074, 0.5490196, 1, 0, 1,
-0.6316158, -0.48039, -2.815557, 0.5411765, 1, 0, 1,
-0.622997, -0.5157511, -1.62462, 0.5372549, 1, 0, 1,
-0.6221112, 1.121936, 0.08077849, 0.5294118, 1, 0, 1,
-0.6180618, 1.043063, -1.110724, 0.5254902, 1, 0, 1,
-0.61602, 0.08192692, -0.8632857, 0.5176471, 1, 0, 1,
-0.6141386, -0.3657974, -1.985669, 0.5137255, 1, 0, 1,
-0.6137957, 0.09145752, 0.401536, 0.5058824, 1, 0, 1,
-0.611206, -0.8651559, -2.982368, 0.5019608, 1, 0, 1,
-0.6088988, 0.9419247, -0.4559384, 0.4941176, 1, 0, 1,
-0.6082245, -1.13461, -3.137129, 0.4862745, 1, 0, 1,
-0.6021168, 1.391846, -0.6158242, 0.4823529, 1, 0, 1,
-0.601833, 0.5680831, 0.9098907, 0.4745098, 1, 0, 1,
-0.5984089, -0.0008145886, -1.723601, 0.4705882, 1, 0, 1,
-0.5956357, -0.3192473, -2.80269, 0.4627451, 1, 0, 1,
-0.5953074, -0.3007023, -1.864399, 0.4588235, 1, 0, 1,
-0.5816436, -0.2610079, -2.101317, 0.4509804, 1, 0, 1,
-0.5743817, 0.1440224, 0.51429, 0.4470588, 1, 0, 1,
-0.5720565, -0.8721442, -2.401264, 0.4392157, 1, 0, 1,
-0.564504, 0.694115, 0.3405787, 0.4352941, 1, 0, 1,
-0.5635484, 0.692691, -1.226621, 0.427451, 1, 0, 1,
-0.5576769, 1.549565, 1.214356, 0.4235294, 1, 0, 1,
-0.5485011, 0.6067241, -0.08629264, 0.4156863, 1, 0, 1,
-0.5379477, -0.3801875, -2.602492, 0.4117647, 1, 0, 1,
-0.5372972, -0.8876125, -1.244955, 0.4039216, 1, 0, 1,
-0.5324992, 0.4344381, -1.958584, 0.3960784, 1, 0, 1,
-0.52458, -0.3452855, -3.602576, 0.3921569, 1, 0, 1,
-0.5242438, 0.05329345, -1.514849, 0.3843137, 1, 0, 1,
-0.5240387, 1.131459, -1.551973, 0.3803922, 1, 0, 1,
-0.5082969, 1.060384, -0.3429232, 0.372549, 1, 0, 1,
-0.5059453, 0.2186115, 0.3384458, 0.3686275, 1, 0, 1,
-0.503359, 0.8046954, -0.6057687, 0.3607843, 1, 0, 1,
-0.5015631, -2.36667, -2.496434, 0.3568628, 1, 0, 1,
-0.4961467, -1.747803, -3.286919, 0.3490196, 1, 0, 1,
-0.4931661, 2.244488, -0.7878416, 0.345098, 1, 0, 1,
-0.4870735, 0.2265596, -1.913983, 0.3372549, 1, 0, 1,
-0.4846734, 2.009426, -0.5050713, 0.3333333, 1, 0, 1,
-0.4829237, 1.330034, 1.16957, 0.3254902, 1, 0, 1,
-0.4796481, -1.020466, -2.416424, 0.3215686, 1, 0, 1,
-0.4786599, 0.4966637, -0.4861702, 0.3137255, 1, 0, 1,
-0.4774195, 0.6298587, 0.3654768, 0.3098039, 1, 0, 1,
-0.4769495, 0.4073781, -1.73772, 0.3019608, 1, 0, 1,
-0.4696227, 0.5431349, -2.136433, 0.2941177, 1, 0, 1,
-0.4623436, -0.07568948, -2.242846, 0.2901961, 1, 0, 1,
-0.4497339, -1.673652, -3.160383, 0.282353, 1, 0, 1,
-0.4484414, -1.000804, -3.907798, 0.2784314, 1, 0, 1,
-0.4473718, 0.7562503, 0.5194787, 0.2705882, 1, 0, 1,
-0.4457279, 1.277675, -0.9589255, 0.2666667, 1, 0, 1,
-0.4397778, -0.1772353, -3.157471, 0.2588235, 1, 0, 1,
-0.4375834, -0.05111238, -1.401471, 0.254902, 1, 0, 1,
-0.4373904, 0.3650018, -0.1950864, 0.2470588, 1, 0, 1,
-0.4309638, 0.5532089, 0.8624179, 0.2431373, 1, 0, 1,
-0.4298845, 0.5958219, 0.3510937, 0.2352941, 1, 0, 1,
-0.4289337, -1.58957, -2.493124, 0.2313726, 1, 0, 1,
-0.4123715, -0.6881747, -2.577358, 0.2235294, 1, 0, 1,
-0.4114907, 1.438139, -0.007112874, 0.2196078, 1, 0, 1,
-0.4024584, -0.1100928, -2.621471, 0.2117647, 1, 0, 1,
-0.4001803, -0.5994087, -1.483851, 0.2078431, 1, 0, 1,
-0.3919351, -0.1660609, -2.558017, 0.2, 1, 0, 1,
-0.3915668, -0.06303081, -1.845912, 0.1921569, 1, 0, 1,
-0.3898107, -1.171048, -4.357368, 0.1882353, 1, 0, 1,
-0.3848384, -0.2452835, -4.7278, 0.1803922, 1, 0, 1,
-0.3765961, -0.5573086, -2.894988, 0.1764706, 1, 0, 1,
-0.3749758, -0.2569761, -2.719216, 0.1686275, 1, 0, 1,
-0.3728635, 0.8747055, -1.549717, 0.1647059, 1, 0, 1,
-0.3721739, 2.213985, -2.624601, 0.1568628, 1, 0, 1,
-0.3710975, -0.1019245, -0.9138156, 0.1529412, 1, 0, 1,
-0.3678959, 2.378789, -1.081267, 0.145098, 1, 0, 1,
-0.3646524, -1.584864, -2.616227, 0.1411765, 1, 0, 1,
-0.3521828, -0.2039687, -0.6718398, 0.1333333, 1, 0, 1,
-0.3514599, -0.1900279, -3.095766, 0.1294118, 1, 0, 1,
-0.3475961, -1.50211, -3.264622, 0.1215686, 1, 0, 1,
-0.3453434, -0.893182, -1.86989, 0.1176471, 1, 0, 1,
-0.3420658, 1.089446, -0.4122218, 0.1098039, 1, 0, 1,
-0.3405584, 0.4350079, -0.7837645, 0.1058824, 1, 0, 1,
-0.336205, -0.3880015, -0.2541272, 0.09803922, 1, 0, 1,
-0.335023, -0.1257489, -0.2040814, 0.09019608, 1, 0, 1,
-0.326852, -0.7519847, -2.974992, 0.08627451, 1, 0, 1,
-0.3229036, -1.033764, -0.9555617, 0.07843138, 1, 0, 1,
-0.3189865, 0.645707, -0.00321472, 0.07450981, 1, 0, 1,
-0.3188076, 1.4799, 0.567926, 0.06666667, 1, 0, 1,
-0.3156895, 0.5360377, -0.9232324, 0.0627451, 1, 0, 1,
-0.3099567, -1.227162, -5.613665, 0.05490196, 1, 0, 1,
-0.3089624, -0.887797, -3.031525, 0.05098039, 1, 0, 1,
-0.3089059, -0.2115753, -1.141096, 0.04313726, 1, 0, 1,
-0.3089056, 0.8848333, -1.138901, 0.03921569, 1, 0, 1,
-0.3083344, 1.943574, -1.091892, 0.03137255, 1, 0, 1,
-0.3083235, 0.1447098, -0.1412703, 0.02745098, 1, 0, 1,
-0.3058115, -1.482999, -2.696554, 0.01960784, 1, 0, 1,
-0.3041456, -0.03728292, -2.154353, 0.01568628, 1, 0, 1,
-0.2973986, 0.2315909, -0.5862075, 0.007843138, 1, 0, 1,
-0.2864407, -0.5600916, -0.7828634, 0.003921569, 1, 0, 1,
-0.2851496, -0.3826503, -3.721432, 0, 1, 0.003921569, 1,
-0.2830447, -0.1327238, -2.375541, 0, 1, 0.01176471, 1,
-0.2815904, 0.4716341, -1.200304, 0, 1, 0.01568628, 1,
-0.2803454, -0.239155, -2.023145, 0, 1, 0.02352941, 1,
-0.2799317, 1.071759, 0.65187, 0, 1, 0.02745098, 1,
-0.2756457, -0.6284524, -0.6074883, 0, 1, 0.03529412, 1,
-0.2733569, 3.301854, -0.05864303, 0, 1, 0.03921569, 1,
-0.2713557, -0.4311325, -2.929545, 0, 1, 0.04705882, 1,
-0.2648272, -1.498334, -3.970921, 0, 1, 0.05098039, 1,
-0.2570799, -1.141533, -2.694871, 0, 1, 0.05882353, 1,
-0.2546448, -1.106874, -1.278396, 0, 1, 0.0627451, 1,
-0.249812, 0.9845299, -0.1536335, 0, 1, 0.07058824, 1,
-0.2475729, -1.818335, -2.090605, 0, 1, 0.07450981, 1,
-0.2465755, -1.292063, -3.81739, 0, 1, 0.08235294, 1,
-0.2465597, -0.4131309, -4.755549, 0, 1, 0.08627451, 1,
-0.2457422, -1.108854, -4.318271, 0, 1, 0.09411765, 1,
-0.2405303, -0.8067397, -2.67065, 0, 1, 0.1019608, 1,
-0.2339846, 0.1174474, 0.01815969, 0, 1, 0.1058824, 1,
-0.2316264, 0.4397821, -1.8986, 0, 1, 0.1137255, 1,
-0.2289677, -1.233974, -2.122156, 0, 1, 0.1176471, 1,
-0.2277224, 1.11787, 2.360727, 0, 1, 0.1254902, 1,
-0.2271751, 0.6056167, -0.0966249, 0, 1, 0.1294118, 1,
-0.2269059, 1.758779, 0.4157411, 0, 1, 0.1372549, 1,
-0.225252, -0.8252676, -2.553733, 0, 1, 0.1411765, 1,
-0.2251694, 0.240658, -2.474464, 0, 1, 0.1490196, 1,
-0.2248891, 0.1725272, 0.7370573, 0, 1, 0.1529412, 1,
-0.2242661, 1.168138, -1.794043, 0, 1, 0.1607843, 1,
-0.217483, -1.122686, -1.874517, 0, 1, 0.1647059, 1,
-0.2130115, -0.1805412, -1.999084, 0, 1, 0.172549, 1,
-0.2095883, 1.049732, 0.1257645, 0, 1, 0.1764706, 1,
-0.2069779, 0.3978593, -0.6991716, 0, 1, 0.1843137, 1,
-0.2068916, 0.1865328, 0.1944865, 0, 1, 0.1882353, 1,
-0.2049033, 1.353765, 0.779097, 0, 1, 0.1960784, 1,
-0.1994051, 1.20761, 0.8446473, 0, 1, 0.2039216, 1,
-0.1985895, 0.002292866, -2.40399, 0, 1, 0.2078431, 1,
-0.1939706, -0.3950948, -1.394113, 0, 1, 0.2156863, 1,
-0.1935269, -1.899834, -1.984827, 0, 1, 0.2196078, 1,
-0.1911445, -1.342421, -3.448276, 0, 1, 0.227451, 1,
-0.1899621, -1.290186, -4.8108, 0, 1, 0.2313726, 1,
-0.1899235, -1.06106, -4.590922, 0, 1, 0.2392157, 1,
-0.1864838, 2.324589, 1.129089, 0, 1, 0.2431373, 1,
-0.1799264, -0.6571162, -2.706117, 0, 1, 0.2509804, 1,
-0.1774783, 0.5393164, -0.6603922, 0, 1, 0.254902, 1,
-0.1724977, -0.3562129, -2.848725, 0, 1, 0.2627451, 1,
-0.1718556, 1.234535, 0.7120394, 0, 1, 0.2666667, 1,
-0.1709701, -0.8369248, -3.32834, 0, 1, 0.2745098, 1,
-0.1707136, -1.238331, -2.709057, 0, 1, 0.2784314, 1,
-0.1678615, -1.938262, -3.497272, 0, 1, 0.2862745, 1,
-0.1657173, -2.170275, -2.623864, 0, 1, 0.2901961, 1,
-0.1652828, 0.6122203, -1.146613, 0, 1, 0.2980392, 1,
-0.1630437, -0.03272239, -2.844564, 0, 1, 0.3058824, 1,
-0.16285, 0.7228306, 0.7973123, 0, 1, 0.3098039, 1,
-0.159705, -0.944063, -2.643297, 0, 1, 0.3176471, 1,
-0.1589703, 1.541701, 1.300419, 0, 1, 0.3215686, 1,
-0.1569583, -0.8112758, -2.27005, 0, 1, 0.3294118, 1,
-0.1551065, 1.365938, -1.230428, 0, 1, 0.3333333, 1,
-0.1543298, 0.7232888, 1.311618, 0, 1, 0.3411765, 1,
-0.1515439, -1.321181, -2.962376, 0, 1, 0.345098, 1,
-0.1496796, 0.1003584, -2.193386, 0, 1, 0.3529412, 1,
-0.1442742, -1.861367, -2.834162, 0, 1, 0.3568628, 1,
-0.1434349, -0.6298138, -3.438257, 0, 1, 0.3647059, 1,
-0.1423299, -1.785873, -2.764437, 0, 1, 0.3686275, 1,
-0.142308, 1.142286, -2.111054, 0, 1, 0.3764706, 1,
-0.1395227, 1.887284, -1.405852, 0, 1, 0.3803922, 1,
-0.1385219, 0.621645, 0.4172036, 0, 1, 0.3882353, 1,
-0.1377168, -0.01416786, -1.403377, 0, 1, 0.3921569, 1,
-0.1304036, -0.4604684, -3.674485, 0, 1, 0.4, 1,
-0.1289222, -1.34083, -3.631411, 0, 1, 0.4078431, 1,
-0.128778, -0.6252263, -3.738909, 0, 1, 0.4117647, 1,
-0.1275081, -2.617014, -4.421101, 0, 1, 0.4196078, 1,
-0.122865, -0.9560233, -6.043331, 0, 1, 0.4235294, 1,
-0.1218692, -0.8682041, -4.755888, 0, 1, 0.4313726, 1,
-0.1186154, -1.683867, -2.552872, 0, 1, 0.4352941, 1,
-0.1180467, -0.5908167, -3.69118, 0, 1, 0.4431373, 1,
-0.1172571, 0.7468786, -0.2299487, 0, 1, 0.4470588, 1,
-0.116186, 1.313765, -1.680209, 0, 1, 0.454902, 1,
-0.1147792, 0.2814499, 1.052568, 0, 1, 0.4588235, 1,
-0.1125068, -0.4870622, -2.450775, 0, 1, 0.4666667, 1,
-0.1113083, -0.0876696, -2.669665, 0, 1, 0.4705882, 1,
-0.107651, -1.142932, -2.522776, 0, 1, 0.4784314, 1,
-0.107121, -0.6388832, -2.852046, 0, 1, 0.4823529, 1,
-0.1060013, 1.148217, -2.343131, 0, 1, 0.4901961, 1,
-0.1047549, 1.424322, -1.134772, 0, 1, 0.4941176, 1,
-0.1001136, 1.171434, -1.057942, 0, 1, 0.5019608, 1,
-0.09931143, 0.6267395, -0.3334367, 0, 1, 0.509804, 1,
-0.09802158, 0.1407339, 0.4511715, 0, 1, 0.5137255, 1,
-0.09429223, 2.140028, 1.123766, 0, 1, 0.5215687, 1,
-0.09398907, 0.01056363, -2.548351, 0, 1, 0.5254902, 1,
-0.09187762, 0.4575808, 1.537031, 0, 1, 0.5333334, 1,
-0.0866377, 1.61195, 0.377298, 0, 1, 0.5372549, 1,
-0.0860442, -2.181799, -3.510097, 0, 1, 0.5450981, 1,
-0.08432607, 0.3046473, -0.3588644, 0, 1, 0.5490196, 1,
-0.08431134, 1.1014, 1.079705, 0, 1, 0.5568628, 1,
-0.07770667, -0.7087962, -3.455951, 0, 1, 0.5607843, 1,
-0.07478736, -1.319345, -1.358467, 0, 1, 0.5686275, 1,
-0.07273805, -0.1979679, -2.401329, 0, 1, 0.572549, 1,
-0.07096814, 1.272278, 0.03916386, 0, 1, 0.5803922, 1,
-0.07016314, -0.5010818, -2.403349, 0, 1, 0.5843138, 1,
-0.06429572, -1.280115, -3.659062, 0, 1, 0.5921569, 1,
-0.06416287, 0.8284944, -1.694648, 0, 1, 0.5960785, 1,
-0.061353, -0.1896787, -3.2013, 0, 1, 0.6039216, 1,
-0.06109544, 0.3951181, 0.6258057, 0, 1, 0.6117647, 1,
-0.06049111, -0.6465718, -4.412936, 0, 1, 0.6156863, 1,
-0.05495591, -0.5198518, -2.626049, 0, 1, 0.6235294, 1,
-0.05425571, 0.7985845, -0.3102873, 0, 1, 0.627451, 1,
-0.05204225, -1.134858, -3.939051, 0, 1, 0.6352941, 1,
-0.04868227, 1.508029, -0.0008653463, 0, 1, 0.6392157, 1,
-0.04761006, 0.8060946, -0.01908955, 0, 1, 0.6470588, 1,
-0.04689226, 1.026464, 0.9513147, 0, 1, 0.6509804, 1,
-0.04425551, -1.108682, -1.552434, 0, 1, 0.6588235, 1,
-0.043275, -2.270336, -1.985059, 0, 1, 0.6627451, 1,
-0.04214465, -0.2724733, -2.769181, 0, 1, 0.6705883, 1,
-0.04169768, -0.9940737, -2.68647, 0, 1, 0.6745098, 1,
-0.04027496, -1.135342, -1.595316, 0, 1, 0.682353, 1,
-0.03982907, 1.597402, 0.6349106, 0, 1, 0.6862745, 1,
-0.03634328, -1.887794, -4.989788, 0, 1, 0.6941177, 1,
-0.03534688, 0.2668952, 0.4245121, 0, 1, 0.7019608, 1,
-0.03518257, -0.2387155, -3.659187, 0, 1, 0.7058824, 1,
-0.03183015, -0.418783, -4.670181, 0, 1, 0.7137255, 1,
-0.03156943, 0.6169078, 0.1734035, 0, 1, 0.7176471, 1,
-0.03038427, -1.334099, -4.333354, 0, 1, 0.7254902, 1,
-0.02803314, 2.709486, -2.7741, 0, 1, 0.7294118, 1,
-0.02675363, -1.255627, -3.666565, 0, 1, 0.7372549, 1,
-0.02550616, -0.8068011, -4.31435, 0, 1, 0.7411765, 1,
-0.02506581, -0.1244114, -3.542257, 0, 1, 0.7490196, 1,
-0.0216103, 0.6675255, -0.3536462, 0, 1, 0.7529412, 1,
-0.02127417, -1.211304, -2.964288, 0, 1, 0.7607843, 1,
-0.02110151, -0.9494991, -3.06731, 0, 1, 0.7647059, 1,
-0.0151494, -0.1827744, -2.210556, 0, 1, 0.772549, 1,
-0.01502195, 0.3226067, -0.1981607, 0, 1, 0.7764706, 1,
-0.01462958, -0.04444337, -1.387328, 0, 1, 0.7843137, 1,
-0.0102537, 2.375893, 0.4215442, 0, 1, 0.7882353, 1,
-0.01017902, 1.59406, -0.6338249, 0, 1, 0.7960784, 1,
-0.007925838, -2.307854, -2.905035, 0, 1, 0.8039216, 1,
-0.005422404, 0.03853985, -0.02869457, 0, 1, 0.8078431, 1,
-0.005056353, 0.07032453, -0.8899731, 0, 1, 0.8156863, 1,
-0.005025418, -0.3319998, -2.167104, 0, 1, 0.8196079, 1,
-0.00254318, 0.2690515, -0.7176662, 0, 1, 0.827451, 1,
-0.001489478, -0.08553262, -2.184673, 0, 1, 0.8313726, 1,
0.005322856, -0.133962, 2.450005, 0, 1, 0.8392157, 1,
0.006467914, 0.5540926, 2.168425, 0, 1, 0.8431373, 1,
0.007646891, 0.8497105, 0.4102127, 0, 1, 0.8509804, 1,
0.008329881, 1.488153, 0.558319, 0, 1, 0.854902, 1,
0.009283741, 1.909265, -0.4458747, 0, 1, 0.8627451, 1,
0.0108477, -0.242744, 1.555528, 0, 1, 0.8666667, 1,
0.0133906, 0.2355127, 1.969967, 0, 1, 0.8745098, 1,
0.0139804, 1.847992, -0.7374854, 0, 1, 0.8784314, 1,
0.017223, -0.7216047, 3.0349, 0, 1, 0.8862745, 1,
0.02149448, 0.8148114, 1.07019, 0, 1, 0.8901961, 1,
0.02379243, 0.4381699, -0.5808436, 0, 1, 0.8980392, 1,
0.0241552, -0.5418356, 2.723517, 0, 1, 0.9058824, 1,
0.02793989, -0.3937062, 3.739974, 0, 1, 0.9098039, 1,
0.02952158, 0.0519743, 1.297682, 0, 1, 0.9176471, 1,
0.02972712, -0.763994, 2.967993, 0, 1, 0.9215686, 1,
0.02980881, -0.7518382, 1.530533, 0, 1, 0.9294118, 1,
0.03669199, 0.7535049, 0.4999474, 0, 1, 0.9333333, 1,
0.03723818, -0.6377247, 2.84684, 0, 1, 0.9411765, 1,
0.03865213, -0.1333863, 4.557568, 0, 1, 0.945098, 1,
0.04053904, -0.3231674, 4.921436, 0, 1, 0.9529412, 1,
0.0414828, -1.197643, 3.461216, 0, 1, 0.9568627, 1,
0.04223074, 1.330598, 0.9617344, 0, 1, 0.9647059, 1,
0.04590347, -1.089086, 3.785089, 0, 1, 0.9686275, 1,
0.04600991, 2.516876, -0.04911413, 0, 1, 0.9764706, 1,
0.04921542, -0.6113439, 2.55775, 0, 1, 0.9803922, 1,
0.04976271, -0.186545, 2.792912, 0, 1, 0.9882353, 1,
0.05100553, 1.814919, 1.028983, 0, 1, 0.9921569, 1,
0.05118931, 0.8496239, 0.5194159, 0, 1, 1, 1,
0.05667127, 0.6555648, 0.746471, 0, 0.9921569, 1, 1,
0.06207415, -1.879093, 3.486875, 0, 0.9882353, 1, 1,
0.06253665, 0.5035898, -0.5836046, 0, 0.9803922, 1, 1,
0.063475, 0.877451, 1.802849, 0, 0.9764706, 1, 1,
0.06363825, -1.118654, 2.907916, 0, 0.9686275, 1, 1,
0.06769421, 0.1870953, 0.0957304, 0, 0.9647059, 1, 1,
0.07361307, 0.1012565, 1.921136, 0, 0.9568627, 1, 1,
0.07371099, 0.4959146, -0.2790333, 0, 0.9529412, 1, 1,
0.07907144, -0.1757559, 3.552365, 0, 0.945098, 1, 1,
0.07981516, 0.6950353, -1.286854, 0, 0.9411765, 1, 1,
0.08183502, 0.4582149, -1.556138, 0, 0.9333333, 1, 1,
0.09168539, -1.299204, 3.66742, 0, 0.9294118, 1, 1,
0.0929468, -0.6597926, 3.091003, 0, 0.9215686, 1, 1,
0.09423083, -1.534251, 3.415785, 0, 0.9176471, 1, 1,
0.09983674, 0.7537277, 1.673429, 0, 0.9098039, 1, 1,
0.1005205, -0.1843696, 2.323856, 0, 0.9058824, 1, 1,
0.1013092, -1.098735, 2.758851, 0, 0.8980392, 1, 1,
0.1157107, 1.198163, 1.415876, 0, 0.8901961, 1, 1,
0.1192301, -0.125143, 1.576837, 0, 0.8862745, 1, 1,
0.1209445, -1.176918, 2.989283, 0, 0.8784314, 1, 1,
0.1216343, 0.2011466, 0.7501314, 0, 0.8745098, 1, 1,
0.1218466, -0.4226784, 1.232096, 0, 0.8666667, 1, 1,
0.1252474, -0.5227337, 3.114704, 0, 0.8627451, 1, 1,
0.1254455, 0.3477855, 1.574227, 0, 0.854902, 1, 1,
0.1329449, 1.571477, 0.7660498, 0, 0.8509804, 1, 1,
0.1339146, 1.370601, 0.09519836, 0, 0.8431373, 1, 1,
0.1370216, 0.747704, 1.214575, 0, 0.8392157, 1, 1,
0.1390506, -1.219343, 6.247146, 0, 0.8313726, 1, 1,
0.1404489, 1.204435, 0.01500091, 0, 0.827451, 1, 1,
0.1426599, 0.1750523, 1.547093, 0, 0.8196079, 1, 1,
0.1428457, 0.9257714, 0.01246952, 0, 0.8156863, 1, 1,
0.1439674, -0.6966521, 3.68356, 0, 0.8078431, 1, 1,
0.1504251, 1.74215, 1.899912, 0, 0.8039216, 1, 1,
0.1509825, -1.424063, 3.30808, 0, 0.7960784, 1, 1,
0.1518737, 0.06004391, 1.311994, 0, 0.7882353, 1, 1,
0.1520986, 0.3535794, 3.507066, 0, 0.7843137, 1, 1,
0.1522363, 1.608202, -1.127764, 0, 0.7764706, 1, 1,
0.1523864, 0.09281287, 2.167281, 0, 0.772549, 1, 1,
0.1551694, 2.944617, -1.580717, 0, 0.7647059, 1, 1,
0.1555994, 0.6128978, 0.2338167, 0, 0.7607843, 1, 1,
0.1563138, -0.9345608, 4.457536, 0, 0.7529412, 1, 1,
0.1577376, -0.1979537, 4.029527, 0, 0.7490196, 1, 1,
0.1589055, 0.009589048, 3.484214, 0, 0.7411765, 1, 1,
0.163638, 0.5420744, -1.430242, 0, 0.7372549, 1, 1,
0.1645082, -0.01186535, 1.164217, 0, 0.7294118, 1, 1,
0.1658214, -0.8230941, 2.254975, 0, 0.7254902, 1, 1,
0.1666095, 1.170224, 0.6220536, 0, 0.7176471, 1, 1,
0.168491, -1.295504, 3.286896, 0, 0.7137255, 1, 1,
0.1710743, -0.2485124, 2.55391, 0, 0.7058824, 1, 1,
0.1715872, 0.8434447, 1.57552, 0, 0.6980392, 1, 1,
0.1716702, 3.063383, -1.18479, 0, 0.6941177, 1, 1,
0.1746788, 0.4341914, -0.7118796, 0, 0.6862745, 1, 1,
0.1760674, 0.1417899, 0.6546387, 0, 0.682353, 1, 1,
0.1780122, 0.1837981, 1.732667, 0, 0.6745098, 1, 1,
0.1830945, -2.036964, 2.688731, 0, 0.6705883, 1, 1,
0.1854283, -1.81789, 4.508319, 0, 0.6627451, 1, 1,
0.1893371, -0.5064197, 2.533396, 0, 0.6588235, 1, 1,
0.1947571, 0.2943577, 0.4235652, 0, 0.6509804, 1, 1,
0.1971186, 2.677038, 0.8257329, 0, 0.6470588, 1, 1,
0.1976538, -2.519576, 3.562706, 0, 0.6392157, 1, 1,
0.1995709, -0.9951245, 1.988161, 0, 0.6352941, 1, 1,
0.2074296, 0.2457186, 1.776692, 0, 0.627451, 1, 1,
0.2081767, -0.2997151, 2.350595, 0, 0.6235294, 1, 1,
0.2102916, 0.0125231, 0.8308463, 0, 0.6156863, 1, 1,
0.2122444, -1.196031, 2.436305, 0, 0.6117647, 1, 1,
0.2125499, -1.840318, 3.787821, 0, 0.6039216, 1, 1,
0.2176338, -0.3136755, 3.68215, 0, 0.5960785, 1, 1,
0.2180871, -0.1142922, 3.720389, 0, 0.5921569, 1, 1,
0.2256535, -1.144665, 3.63417, 0, 0.5843138, 1, 1,
0.2334361, 0.578137, -1.844453, 0, 0.5803922, 1, 1,
0.233545, 0.5204505, 2.16505, 0, 0.572549, 1, 1,
0.2377077, -0.06203309, 1.969274, 0, 0.5686275, 1, 1,
0.2415859, 0.1320801, 1.61228, 0, 0.5607843, 1, 1,
0.2418136, -0.2984639, 1.456402, 0, 0.5568628, 1, 1,
0.2463221, 1.168366, -0.8948297, 0, 0.5490196, 1, 1,
0.2490379, 0.3824263, 0.2695887, 0, 0.5450981, 1, 1,
0.251037, -0.5759774, 0.5555544, 0, 0.5372549, 1, 1,
0.2514246, 0.1007062, 1.295574, 0, 0.5333334, 1, 1,
0.2526099, 0.5939735, -0.001585817, 0, 0.5254902, 1, 1,
0.2551614, 0.7877609, 0.7562978, 0, 0.5215687, 1, 1,
0.2558068, 0.5359396, -0.1957309, 0, 0.5137255, 1, 1,
0.2598312, -1.831908, 2.882244, 0, 0.509804, 1, 1,
0.2624664, 1.552541, 0.9219346, 0, 0.5019608, 1, 1,
0.273139, 0.8178113, -0.213929, 0, 0.4941176, 1, 1,
0.2732196, -2.694271, 4.10588, 0, 0.4901961, 1, 1,
0.275386, 0.02339153, 0.5755272, 0, 0.4823529, 1, 1,
0.2796667, -0.545873, 1.751805, 0, 0.4784314, 1, 1,
0.2809285, 0.6389145, 0.7417696, 0, 0.4705882, 1, 1,
0.289978, 0.5481258, 1.327891, 0, 0.4666667, 1, 1,
0.2911146, -0.7707462, 1.683509, 0, 0.4588235, 1, 1,
0.2950792, 0.3045472, 1.774753, 0, 0.454902, 1, 1,
0.2962371, -0.0584246, 3.560671, 0, 0.4470588, 1, 1,
0.3056949, -0.3694339, 2.993331, 0, 0.4431373, 1, 1,
0.3085155, -0.5008661, 1.655101, 0, 0.4352941, 1, 1,
0.3088233, 0.3753794, 0.943672, 0, 0.4313726, 1, 1,
0.3098371, -0.825898, 2.45311, 0, 0.4235294, 1, 1,
0.3107945, -0.1744173, 1.614764, 0, 0.4196078, 1, 1,
0.311663, 0.6690505, 1.097467, 0, 0.4117647, 1, 1,
0.3167095, 0.9929858, 1.127902, 0, 0.4078431, 1, 1,
0.3251208, -1.750093, 3.209236, 0, 0.4, 1, 1,
0.3256203, 0.961789, -1.07803, 0, 0.3921569, 1, 1,
0.3260783, 0.01838308, 2.492432, 0, 0.3882353, 1, 1,
0.3275998, 0.4771781, 1.391553, 0, 0.3803922, 1, 1,
0.3313039, 0.5065302, 0.1794287, 0, 0.3764706, 1, 1,
0.3323684, -0.3515257, 2.475085, 0, 0.3686275, 1, 1,
0.3335664, 0.3543103, 0.195123, 0, 0.3647059, 1, 1,
0.3336617, 1.462996, -1.718533, 0, 0.3568628, 1, 1,
0.3355491, 0.6254839, 0.5576856, 0, 0.3529412, 1, 1,
0.3372126, -0.1130637, 3.059033, 0, 0.345098, 1, 1,
0.3380231, -1.490743, 1.662189, 0, 0.3411765, 1, 1,
0.3431258, 0.4684024, -0.7717476, 0, 0.3333333, 1, 1,
0.3513024, 0.4745401, 0.3158526, 0, 0.3294118, 1, 1,
0.3591374, 0.02726687, 1.619776, 0, 0.3215686, 1, 1,
0.361173, -1.671063, 2.004488, 0, 0.3176471, 1, 1,
0.3655302, -0.993079, 1.85389, 0, 0.3098039, 1, 1,
0.3702486, -0.02381274, 3.101309, 0, 0.3058824, 1, 1,
0.3706856, 0.1576601, 1.049851, 0, 0.2980392, 1, 1,
0.3707003, 0.6452205, 0.5543545, 0, 0.2901961, 1, 1,
0.3723924, 1.807904, -0.3568211, 0, 0.2862745, 1, 1,
0.3744757, 0.9574707, 1.191978, 0, 0.2784314, 1, 1,
0.3767414, -1.025294, 2.125329, 0, 0.2745098, 1, 1,
0.3781041, -0.4777256, 1.712432, 0, 0.2666667, 1, 1,
0.380682, -1.440827, 3.826264, 0, 0.2627451, 1, 1,
0.3818398, -0.9472547, 4.877718, 0, 0.254902, 1, 1,
0.3829561, -0.8569489, 3.504694, 0, 0.2509804, 1, 1,
0.3845018, 1.556227, 0.7490329, 0, 0.2431373, 1, 1,
0.3850718, 0.4043891, -2.684458, 0, 0.2392157, 1, 1,
0.3874533, -1.503826, 5.175978, 0, 0.2313726, 1, 1,
0.3919786, -0.7695402, 3.717979, 0, 0.227451, 1, 1,
0.3931278, 0.4495945, -0.569994, 0, 0.2196078, 1, 1,
0.3966951, 0.872121, 0.08129561, 0, 0.2156863, 1, 1,
0.3973311, -0.991239, 0.8897776, 0, 0.2078431, 1, 1,
0.398145, 0.3130504, 2.023228, 0, 0.2039216, 1, 1,
0.4010697, 0.4951703, 1.256214, 0, 0.1960784, 1, 1,
0.412362, -3.302864, 3.304407, 0, 0.1882353, 1, 1,
0.4145951, 0.09030296, 0.9936073, 0, 0.1843137, 1, 1,
0.4210723, -2.559457, 4.016277, 0, 0.1764706, 1, 1,
0.4224875, 0.1052872, -0.5047299, 0, 0.172549, 1, 1,
0.4234853, -0.4763227, 3.100669, 0, 0.1647059, 1, 1,
0.4245867, -2.061295, 2.820854, 0, 0.1607843, 1, 1,
0.4356987, -0.7267528, 3.513978, 0, 0.1529412, 1, 1,
0.4390839, -0.09665912, 3.562084, 0, 0.1490196, 1, 1,
0.4394236, 1.544812, 0.3642315, 0, 0.1411765, 1, 1,
0.4453888, 0.8560119, -0.07247028, 0, 0.1372549, 1, 1,
0.4475717, -1.905332, 3.045159, 0, 0.1294118, 1, 1,
0.4529409, 0.009754553, 0.09427686, 0, 0.1254902, 1, 1,
0.455179, -0.7035078, 3.767811, 0, 0.1176471, 1, 1,
0.4559738, -2.123387, 2.765368, 0, 0.1137255, 1, 1,
0.4570968, -0.7885913, 3.041495, 0, 0.1058824, 1, 1,
0.4585275, -0.9522135, 2.404092, 0, 0.09803922, 1, 1,
0.4615561, -0.6526303, 3.15498, 0, 0.09411765, 1, 1,
0.46426, 0.6167302, 1.209168, 0, 0.08627451, 1, 1,
0.4671887, -1.514634, 3.802814, 0, 0.08235294, 1, 1,
0.4681728, 0.6413094, 1.373721, 0, 0.07450981, 1, 1,
0.4743227, 0.7675086, 0.5927397, 0, 0.07058824, 1, 1,
0.478956, 0.3036573, 0.6865237, 0, 0.0627451, 1, 1,
0.4808944, 0.8346439, 0.712783, 0, 0.05882353, 1, 1,
0.4843496, 1.439379, 1.659974, 0, 0.05098039, 1, 1,
0.4855672, 1.360322, 0.5459278, 0, 0.04705882, 1, 1,
0.4866077, -0.6823594, 1.844103, 0, 0.03921569, 1, 1,
0.4892153, 0.2590196, 0.659642, 0, 0.03529412, 1, 1,
0.4893663, -0.3025175, 0.4451814, 0, 0.02745098, 1, 1,
0.4903267, 2.598251, 0.4627441, 0, 0.02352941, 1, 1,
0.4931011, 0.5491429, 2.30978, 0, 0.01568628, 1, 1,
0.4945393, 1.369939, 0.4680125, 0, 0.01176471, 1, 1,
0.4982458, -0.1286688, 1.594945, 0, 0.003921569, 1, 1,
0.4992839, -0.9941391, 1.508989, 0.003921569, 0, 1, 1,
0.4995547, 0.6740352, -0.7865827, 0.007843138, 0, 1, 1,
0.5036061, 1.346135, 0.6577009, 0.01568628, 0, 1, 1,
0.505048, -0.270805, 3.140029, 0.01960784, 0, 1, 1,
0.5052768, -1.606754, 1.734507, 0.02745098, 0, 1, 1,
0.5087832, -2.565722, 4.178569, 0.03137255, 0, 1, 1,
0.5159518, 0.5849916, 1.44884, 0.03921569, 0, 1, 1,
0.5180797, -0.8484898, 1.0331, 0.04313726, 0, 1, 1,
0.5222228, -1.098211, 1.373189, 0.05098039, 0, 1, 1,
0.5258215, 0.03474546, 2.424664, 0.05490196, 0, 1, 1,
0.5304696, 0.3950948, 1.364718, 0.0627451, 0, 1, 1,
0.5330305, -0.7719889, 0.7809739, 0.06666667, 0, 1, 1,
0.533218, -3.13627, 1.800723, 0.07450981, 0, 1, 1,
0.5336521, -1.514507, 3.583243, 0.07843138, 0, 1, 1,
0.5403163, -0.5283538, 0.5275635, 0.08627451, 0, 1, 1,
0.5428966, 0.5515178, 1.344907, 0.09019608, 0, 1, 1,
0.5444606, -0.5456566, 3.624086, 0.09803922, 0, 1, 1,
0.5448421, 0.8772891, -0.08821296, 0.1058824, 0, 1, 1,
0.5489326, 1.575814, 0.4731734, 0.1098039, 0, 1, 1,
0.5513262, 1.841921, 1.973855, 0.1176471, 0, 1, 1,
0.5535358, -0.2435674, -0.1939518, 0.1215686, 0, 1, 1,
0.5578109, 0.4415755, 3.445297, 0.1294118, 0, 1, 1,
0.5636695, -1.926828, 1.793918, 0.1333333, 0, 1, 1,
0.5655613, 1.762263, 0.9087987, 0.1411765, 0, 1, 1,
0.5674895, -0.9795173, 4.082255, 0.145098, 0, 1, 1,
0.5676566, -0.2622286, 0.8408949, 0.1529412, 0, 1, 1,
0.5722126, -0.6312371, 3.890324, 0.1568628, 0, 1, 1,
0.5722365, 0.5810328, 0.9812137, 0.1647059, 0, 1, 1,
0.5826147, 0.9517497, 1.046818, 0.1686275, 0, 1, 1,
0.5854648, 0.1054869, 1.316971, 0.1764706, 0, 1, 1,
0.5861441, 0.8924016, 0.8187212, 0.1803922, 0, 1, 1,
0.591175, 1.124287, -0.1198862, 0.1882353, 0, 1, 1,
0.5941983, 0.2499035, 0.7486151, 0.1921569, 0, 1, 1,
0.5944507, -0.119455, 2.582307, 0.2, 0, 1, 1,
0.5944905, -0.0916678, 1.657146, 0.2078431, 0, 1, 1,
0.5951238, -1.224537, 4.306631, 0.2117647, 0, 1, 1,
0.6025003, -0.03494044, 1.041774, 0.2196078, 0, 1, 1,
0.6038008, -0.2598424, 2.035887, 0.2235294, 0, 1, 1,
0.6074706, -1.12873, 3.357137, 0.2313726, 0, 1, 1,
0.6078068, 0.9816415, 1.883005, 0.2352941, 0, 1, 1,
0.6100013, -0.1896288, 0.7936732, 0.2431373, 0, 1, 1,
0.6111925, 1.051862, -0.5067923, 0.2470588, 0, 1, 1,
0.6120858, 1.626266, 1.438258, 0.254902, 0, 1, 1,
0.6135263, -0.3672047, 2.624045, 0.2588235, 0, 1, 1,
0.6154801, 0.8129623, 0.1448456, 0.2666667, 0, 1, 1,
0.6158012, 1.227058, 0.6934982, 0.2705882, 0, 1, 1,
0.6169985, -1.10081, 3.654689, 0.2784314, 0, 1, 1,
0.6173711, 1.101177, 1.012548, 0.282353, 0, 1, 1,
0.6192307, -1.269836, 2.321002, 0.2901961, 0, 1, 1,
0.6223705, 0.1519915, 1.385989, 0.2941177, 0, 1, 1,
0.6227089, 1.318669, 0.3180399, 0.3019608, 0, 1, 1,
0.6231432, 0.04747848, 1.290876, 0.3098039, 0, 1, 1,
0.626923, 0.5091009, 0.02556915, 0.3137255, 0, 1, 1,
0.6369122, 0.05843719, 1.620645, 0.3215686, 0, 1, 1,
0.6413467, 0.006199142, 1.906392, 0.3254902, 0, 1, 1,
0.6418744, 0.1655094, 0.8272148, 0.3333333, 0, 1, 1,
0.646107, -0.1977059, 2.98927, 0.3372549, 0, 1, 1,
0.6504656, 0.4189478, 1.423467, 0.345098, 0, 1, 1,
0.6530334, 0.3936371, 1.643581, 0.3490196, 0, 1, 1,
0.6533117, 0.9704631, 2.204151, 0.3568628, 0, 1, 1,
0.6537974, 0.639624, 0.3255192, 0.3607843, 0, 1, 1,
0.6542557, 1.311564, -0.3981074, 0.3686275, 0, 1, 1,
0.6565933, -1.279695, 3.17021, 0.372549, 0, 1, 1,
0.6609077, 1.036425, -2.102172, 0.3803922, 0, 1, 1,
0.6638038, -1.71558, 3.645091, 0.3843137, 0, 1, 1,
0.6694251, 0.3606645, 1.330023, 0.3921569, 0, 1, 1,
0.6710269, -0.2550932, 1.385092, 0.3960784, 0, 1, 1,
0.6767613, 0.4452609, 1.474313, 0.4039216, 0, 1, 1,
0.6892018, 0.9567401, 2.666788, 0.4117647, 0, 1, 1,
0.6895467, 1.001429, 1.428376, 0.4156863, 0, 1, 1,
0.6915039, 1.161908, 0.4104561, 0.4235294, 0, 1, 1,
0.6920755, 0.6440423, 0.2512942, 0.427451, 0, 1, 1,
0.6936977, 2.541057, -0.6515706, 0.4352941, 0, 1, 1,
0.6954244, -0.9351227, 1.474832, 0.4392157, 0, 1, 1,
0.697962, 1.473009, 0.5347935, 0.4470588, 0, 1, 1,
0.7031901, -0.9645616, 2.369728, 0.4509804, 0, 1, 1,
0.7041432, -0.7605223, 0.1466836, 0.4588235, 0, 1, 1,
0.7115303, 1.742667, -0.9534171, 0.4627451, 0, 1, 1,
0.7120451, -0.4250808, 2.346284, 0.4705882, 0, 1, 1,
0.7136117, -1.785494, 2.028189, 0.4745098, 0, 1, 1,
0.7185788, 1.43401, 0.4114231, 0.4823529, 0, 1, 1,
0.7291546, 0.1167139, -0.6230002, 0.4862745, 0, 1, 1,
0.7304022, -0.4651028, 1.713171, 0.4941176, 0, 1, 1,
0.736127, -0.5908081, 1.58193, 0.5019608, 0, 1, 1,
0.7372722, 1.00063, 0.6613718, 0.5058824, 0, 1, 1,
0.7382011, 0.07703712, 0.05882895, 0.5137255, 0, 1, 1,
0.7435712, -1.585052, 3.214147, 0.5176471, 0, 1, 1,
0.7468514, -0.3019494, 2.464559, 0.5254902, 0, 1, 1,
0.7555361, -0.8330052, 1.239465, 0.5294118, 0, 1, 1,
0.7590172, 0.6156945, 2.384879, 0.5372549, 0, 1, 1,
0.765146, -2.763888, 2.387009, 0.5411765, 0, 1, 1,
0.7692943, 0.4138092, 1.413913, 0.5490196, 0, 1, 1,
0.7701672, 1.906911, -1.25836, 0.5529412, 0, 1, 1,
0.7819358, 0.2582219, 0.9141089, 0.5607843, 0, 1, 1,
0.7852547, 0.3964132, -0.4324377, 0.5647059, 0, 1, 1,
0.7940909, -0.4502207, 1.677035, 0.572549, 0, 1, 1,
0.7943799, -1.679438, 3.865427, 0.5764706, 0, 1, 1,
0.7983574, -0.3761995, 0.8889978, 0.5843138, 0, 1, 1,
0.8008339, 0.9349912, -0.007114522, 0.5882353, 0, 1, 1,
0.8108597, 1.516418, -0.2709469, 0.5960785, 0, 1, 1,
0.811282, -0.4540345, 1.418052, 0.6039216, 0, 1, 1,
0.8133925, -1.775337, 2.445252, 0.6078432, 0, 1, 1,
0.8146298, -0.4711089, 1.754938, 0.6156863, 0, 1, 1,
0.8147932, -1.518078, 3.074283, 0.6196079, 0, 1, 1,
0.8183967, 0.9577984, 0.7159979, 0.627451, 0, 1, 1,
0.8200353, -1.709374, 2.948854, 0.6313726, 0, 1, 1,
0.8235162, -0.01417204, 1.077389, 0.6392157, 0, 1, 1,
0.8259566, -0.4408517, 3.414762, 0.6431373, 0, 1, 1,
0.8277732, 0.8688029, -0.2155066, 0.6509804, 0, 1, 1,
0.8385019, -0.2748751, 0.5047302, 0.654902, 0, 1, 1,
0.8388444, -0.201178, 3.462683, 0.6627451, 0, 1, 1,
0.8457138, 0.2272493, 0.6354995, 0.6666667, 0, 1, 1,
0.8466559, 0.6518795, -0.02553892, 0.6745098, 0, 1, 1,
0.8479497, -1.013793, 4.338725, 0.6784314, 0, 1, 1,
0.8510115, -0.1219315, 1.831812, 0.6862745, 0, 1, 1,
0.8513647, 0.1166337, 0.9806638, 0.6901961, 0, 1, 1,
0.852395, -0.664288, 1.483284, 0.6980392, 0, 1, 1,
0.8619009, 0.3247952, 1.022319, 0.7058824, 0, 1, 1,
0.8637182, 0.3501393, 1.821831, 0.7098039, 0, 1, 1,
0.8728849, 1.451461, -0.0398987, 0.7176471, 0, 1, 1,
0.8734807, -1.64133, 1.523853, 0.7215686, 0, 1, 1,
0.874125, 1.542656, 1.644404, 0.7294118, 0, 1, 1,
0.8772372, 1.629903, -1.766722, 0.7333333, 0, 1, 1,
0.8792884, 1.839549, 1.237899, 0.7411765, 0, 1, 1,
0.8903744, 0.7497411, -0.07148623, 0.7450981, 0, 1, 1,
0.8954749, 0.009628147, 1.194834, 0.7529412, 0, 1, 1,
0.9066298, -0.593219, 1.954875, 0.7568628, 0, 1, 1,
0.9067648, -0.135819, 1.671333, 0.7647059, 0, 1, 1,
0.9071373, -0.5592062, 2.135698, 0.7686275, 0, 1, 1,
0.9085705, -0.317508, -0.7412949, 0.7764706, 0, 1, 1,
0.9126425, 1.047592, -0.590961, 0.7803922, 0, 1, 1,
0.91939, -1.576015, 3.209438, 0.7882353, 0, 1, 1,
0.9245701, 1.398171, 0.3807833, 0.7921569, 0, 1, 1,
0.9248495, -0.5233, 1.760687, 0.8, 0, 1, 1,
0.9275863, -1.200772, 2.39923, 0.8078431, 0, 1, 1,
0.9296028, -0.7272463, 1.130234, 0.8117647, 0, 1, 1,
0.9298145, -0.2234451, 0.4699004, 0.8196079, 0, 1, 1,
0.9351065, 1.532191, 1.821489, 0.8235294, 0, 1, 1,
0.9353915, 1.433912, 1.98978, 0.8313726, 0, 1, 1,
0.9355044, 0.4892291, 2.06833, 0.8352941, 0, 1, 1,
0.9356739, 1.969795, -0.7199699, 0.8431373, 0, 1, 1,
0.9364961, 0.9251616, 1.520347, 0.8470588, 0, 1, 1,
0.9438935, -0.9634814, 3.340369, 0.854902, 0, 1, 1,
0.9450911, 0.7439597, -0.164847, 0.8588235, 0, 1, 1,
0.9580753, -0.07899867, 0.1278742, 0.8666667, 0, 1, 1,
0.9636246, 3.104522, -0.5616475, 0.8705882, 0, 1, 1,
0.9640867, -0.6674871, 0.8813121, 0.8784314, 0, 1, 1,
0.968164, 0.5139294, 0.9290202, 0.8823529, 0, 1, 1,
0.9708384, -0.4355123, 1.434535, 0.8901961, 0, 1, 1,
0.9729864, -0.01417697, 0.4954705, 0.8941177, 0, 1, 1,
0.9738228, 1.341122, 2.634667, 0.9019608, 0, 1, 1,
0.9836913, 0.03461018, 0.2687156, 0.9098039, 0, 1, 1,
0.9850606, 1.393702, -0.005068276, 0.9137255, 0, 1, 1,
0.9857724, -1.193183, 4.384615, 0.9215686, 0, 1, 1,
0.9860553, -1.274629, 3.072176, 0.9254902, 0, 1, 1,
0.9909298, 0.5518395, 0.9255357, 0.9333333, 0, 1, 1,
0.9928178, 2.273809, 1.727042, 0.9372549, 0, 1, 1,
0.9966262, 2.432819, 3.111657, 0.945098, 0, 1, 1,
0.9966311, -2.660817, 2.640637, 0.9490196, 0, 1, 1,
1.007646, 1.017579, -0.1625214, 0.9568627, 0, 1, 1,
1.015843, 0.286016, 0.6233888, 0.9607843, 0, 1, 1,
1.019135, -0.3626224, 4.318504, 0.9686275, 0, 1, 1,
1.019695, 0.7593648, 0.7249846, 0.972549, 0, 1, 1,
1.030496, -1.689385, 2.199477, 0.9803922, 0, 1, 1,
1.031782, 1.107868, 2.60668, 0.9843137, 0, 1, 1,
1.032365, 0.7802466, 1.326475, 0.9921569, 0, 1, 1,
1.034055, 0.003323492, 2.636866, 0.9960784, 0, 1, 1,
1.03805, -0.183099, 3.490014, 1, 0, 0.9960784, 1,
1.041158, -0.1803463, 1.983024, 1, 0, 0.9882353, 1,
1.046714, 1.269918, 0.9166933, 1, 0, 0.9843137, 1,
1.051767, -0.09786952, 2.114928, 1, 0, 0.9764706, 1,
1.051858, 0.3698193, 2.124955, 1, 0, 0.972549, 1,
1.063788, -0.7001432, 1.394162, 1, 0, 0.9647059, 1,
1.063958, 1.713529, -1.557444, 1, 0, 0.9607843, 1,
1.065146, -0.1174919, 4.163621, 1, 0, 0.9529412, 1,
1.068056, 2.086524, 2.253983, 1, 0, 0.9490196, 1,
1.069131, 0.04971276, 1.607828, 1, 0, 0.9411765, 1,
1.070425, -0.2757752, 2.024756, 1, 0, 0.9372549, 1,
1.074975, 0.2042178, 1.586656, 1, 0, 0.9294118, 1,
1.07897, -1.045204, 1.734983, 1, 0, 0.9254902, 1,
1.086231, 1.778096, 0.8650988, 1, 0, 0.9176471, 1,
1.092089, 0.6221573, -0.0643664, 1, 0, 0.9137255, 1,
1.092145, -1.013798, 2.136254, 1, 0, 0.9058824, 1,
1.095996, -2.731171, 1.796817, 1, 0, 0.9019608, 1,
1.102416, 1.928636, 1.047989, 1, 0, 0.8941177, 1,
1.102732, -0.5302011, 0.4141515, 1, 0, 0.8862745, 1,
1.103122, 0.4808528, 0.8218225, 1, 0, 0.8823529, 1,
1.105422, 1.586682, 0.669745, 1, 0, 0.8745098, 1,
1.109631, 0.7172834, 2.357294, 1, 0, 0.8705882, 1,
1.123922, -0.1513196, 2.649672, 1, 0, 0.8627451, 1,
1.127826, 1.295676, -0.5718209, 1, 0, 0.8588235, 1,
1.138413, -1.295162, 3.914219, 1, 0, 0.8509804, 1,
1.139421, 0.9011957, 0.6394445, 1, 0, 0.8470588, 1,
1.145861, -0.4308007, 2.699101, 1, 0, 0.8392157, 1,
1.147208, -1.04114, 3.529533, 1, 0, 0.8352941, 1,
1.14962, 0.928459, 0.2450671, 1, 0, 0.827451, 1,
1.150799, 1.38021, 0.9253367, 1, 0, 0.8235294, 1,
1.156769, -0.5432978, 2.423817, 1, 0, 0.8156863, 1,
1.161866, -2.139218, 4.626898, 1, 0, 0.8117647, 1,
1.16433, 0.07362045, 1.590871, 1, 0, 0.8039216, 1,
1.172234, 0.8315001, 0.1299414, 1, 0, 0.7960784, 1,
1.180693, -0.8061982, 3.362112, 1, 0, 0.7921569, 1,
1.189921, -0.6660771, 3.543697, 1, 0, 0.7843137, 1,
1.198522, -0.1678917, 1.058781, 1, 0, 0.7803922, 1,
1.205568, 0.1075758, 1.963226, 1, 0, 0.772549, 1,
1.205673, 1.217083, 1.324406, 1, 0, 0.7686275, 1,
1.208443, -0.3331261, 1.759227, 1, 0, 0.7607843, 1,
1.211786, 0.6830207, 2.04843, 1, 0, 0.7568628, 1,
1.220595, -0.4803819, 2.273331, 1, 0, 0.7490196, 1,
1.22169, -0.01145885, 2.133852, 1, 0, 0.7450981, 1,
1.224679, 1.668143, 0.1971598, 1, 0, 0.7372549, 1,
1.228633, -0.8449535, 2.281664, 1, 0, 0.7333333, 1,
1.231163, -0.9489196, 0.5432789, 1, 0, 0.7254902, 1,
1.239299, 1.38428, 1.937135, 1, 0, 0.7215686, 1,
1.247271, -0.6905305, 1.881285, 1, 0, 0.7137255, 1,
1.247696, 1.30908, -0.3936819, 1, 0, 0.7098039, 1,
1.251731, 1.273393, 1.743851, 1, 0, 0.7019608, 1,
1.259137, 0.6219684, 1.784652, 1, 0, 0.6941177, 1,
1.263777, -0.3928896, 2.360935, 1, 0, 0.6901961, 1,
1.264697, -0.6007208, 1.99457, 1, 0, 0.682353, 1,
1.271753, 0.7887565, 1.582706, 1, 0, 0.6784314, 1,
1.291251, 0.4740993, 0.4288849, 1, 0, 0.6705883, 1,
1.296043, -1.31292, 4.267975, 1, 0, 0.6666667, 1,
1.306473, 0.856079, 0.2074776, 1, 0, 0.6588235, 1,
1.310792, -0.581594, 2.483931, 1, 0, 0.654902, 1,
1.314109, 2.282965, 0.6247361, 1, 0, 0.6470588, 1,
1.324, -0.291476, 1.177201, 1, 0, 0.6431373, 1,
1.331027, 0.1838053, 0.9767436, 1, 0, 0.6352941, 1,
1.337389, 0.3424983, 0.2968846, 1, 0, 0.6313726, 1,
1.342076, -0.6457378, 1.120914, 1, 0, 0.6235294, 1,
1.343448, -2.432061, 0.8818792, 1, 0, 0.6196079, 1,
1.351927, -1.533486, 2.209443, 1, 0, 0.6117647, 1,
1.352943, 0.5269214, 2.078795, 1, 0, 0.6078432, 1,
1.364356, -0.5864788, 1.583158, 1, 0, 0.6, 1,
1.372374, 1.785354, -0.3800039, 1, 0, 0.5921569, 1,
1.380828, 0.1725618, 0.1485242, 1, 0, 0.5882353, 1,
1.384429, -2.317463, 1.753402, 1, 0, 0.5803922, 1,
1.386874, -0.4502485, 2.052106, 1, 0, 0.5764706, 1,
1.396449, -0.9183133, 3.854081, 1, 0, 0.5686275, 1,
1.400068, 0.8896062, 0.5738671, 1, 0, 0.5647059, 1,
1.403404, -0.2269912, 1.891985, 1, 0, 0.5568628, 1,
1.41186, -0.5985127, 1.884806, 1, 0, 0.5529412, 1,
1.414733, 1.003358, 1.403833, 1, 0, 0.5450981, 1,
1.414736, 0.08185309, 1.544639, 1, 0, 0.5411765, 1,
1.423404, 0.3185588, 0.5726321, 1, 0, 0.5333334, 1,
1.424422, -0.6958122, 4.366271, 1, 0, 0.5294118, 1,
1.424828, -0.8078125, 2.046015, 1, 0, 0.5215687, 1,
1.42703, -2.439267, 1.313, 1, 0, 0.5176471, 1,
1.433586, 0.6061921, 0.07570239, 1, 0, 0.509804, 1,
1.438179, -0.2693435, 1.058189, 1, 0, 0.5058824, 1,
1.444358, 0.3313614, 1.131068, 1, 0, 0.4980392, 1,
1.45306, -0.6041027, 2.53315, 1, 0, 0.4901961, 1,
1.455346, 0.7915766, 2.132011, 1, 0, 0.4862745, 1,
1.464053, 0.2431962, 1.411867, 1, 0, 0.4784314, 1,
1.469578, -1.270779, 1.934388, 1, 0, 0.4745098, 1,
1.47221, 0.4370141, -0.3520372, 1, 0, 0.4666667, 1,
1.505073, -0.807647, 0.9517527, 1, 0, 0.4627451, 1,
1.509966, 1.63761, 1.339457, 1, 0, 0.454902, 1,
1.530875, -1.633182, 1.62273, 1, 0, 0.4509804, 1,
1.534264, 0.4503567, 3.145109, 1, 0, 0.4431373, 1,
1.537004, 0.3101431, 1.60292, 1, 0, 0.4392157, 1,
1.564492, 0.5486717, 1.334662, 1, 0, 0.4313726, 1,
1.579657, 0.9579319, 0.7002423, 1, 0, 0.427451, 1,
1.584092, 0.2322777, 1.46637, 1, 0, 0.4196078, 1,
1.589696, 0.5095001, 2.508801, 1, 0, 0.4156863, 1,
1.594078, -0.8673656, 2.458787, 1, 0, 0.4078431, 1,
1.594592, 1.136998, 0.6382705, 1, 0, 0.4039216, 1,
1.599765, 1.266597, -0.3163689, 1, 0, 0.3960784, 1,
1.611053, 0.2546233, 1.290114, 1, 0, 0.3882353, 1,
1.630292, 0.9233708, -0.3943436, 1, 0, 0.3843137, 1,
1.636711, 0.9749884, 1.546447, 1, 0, 0.3764706, 1,
1.643287, 1.310685, -0.6213989, 1, 0, 0.372549, 1,
1.649964, 0.06772795, 0.05042209, 1, 0, 0.3647059, 1,
1.65249, -0.3227956, 2.563914, 1, 0, 0.3607843, 1,
1.666268, 0.07708799, 2.192932, 1, 0, 0.3529412, 1,
1.688337, -1.396813, 2.015521, 1, 0, 0.3490196, 1,
1.703993, -0.5669332, 0.2539908, 1, 0, 0.3411765, 1,
1.705815, 1.563418, 1.795311, 1, 0, 0.3372549, 1,
1.714381, 0.9900743, 0.197955, 1, 0, 0.3294118, 1,
1.720832, 0.1813689, 2.818422, 1, 0, 0.3254902, 1,
1.721894, 0.1554113, 0.8735499, 1, 0, 0.3176471, 1,
1.733295, 0.314101, 1.041598, 1, 0, 0.3137255, 1,
1.759033, 0.5964578, 2.321647, 1, 0, 0.3058824, 1,
1.765566, 0.1702976, 2.546315, 1, 0, 0.2980392, 1,
1.783005, -0.9498068, 3.902171, 1, 0, 0.2941177, 1,
1.786815, -1.121614, 1.387205, 1, 0, 0.2862745, 1,
1.797375, 0.3089997, 1.679455, 1, 0, 0.282353, 1,
1.798519, 0.2272476, 2.552698, 1, 0, 0.2745098, 1,
1.804841, 1.872884, 0.7901657, 1, 0, 0.2705882, 1,
1.814802, -0.2020467, -0.05618443, 1, 0, 0.2627451, 1,
1.819763, 0.3173477, 1.373865, 1, 0, 0.2588235, 1,
1.833728, -0.8757844, 3.312433, 1, 0, 0.2509804, 1,
1.834216, 0.9483498, 2.736262, 1, 0, 0.2470588, 1,
1.848047, -1.155405, 0.8706828, 1, 0, 0.2392157, 1,
1.853043, 1.079877, 0.7850587, 1, 0, 0.2352941, 1,
1.87262, -0.6649181, 1.087941, 1, 0, 0.227451, 1,
1.88571, -0.2139241, 0.7711371, 1, 0, 0.2235294, 1,
1.889509, 1.073648, 0.749944, 1, 0, 0.2156863, 1,
1.890982, 1.12223, -0.02680941, 1, 0, 0.2117647, 1,
1.905805, -0.8787571, 4.058467, 1, 0, 0.2039216, 1,
1.926473, 0.8350103, 1.524969, 1, 0, 0.1960784, 1,
1.942109, -1.832368, 2.56474, 1, 0, 0.1921569, 1,
1.942218, 0.1221016, 1.694274, 1, 0, 0.1843137, 1,
1.957243, 0.04670484, 1.403068, 1, 0, 0.1803922, 1,
2.003655, 1.401285, 1.544978, 1, 0, 0.172549, 1,
2.019142, -1.729421, 2.154736, 1, 0, 0.1686275, 1,
2.040755, 1.392709, 0.7868853, 1, 0, 0.1607843, 1,
2.083073, 1.359586, 1.366171, 1, 0, 0.1568628, 1,
2.127419, -0.9705375, 2.540458, 1, 0, 0.1490196, 1,
2.131709, -1.240553, 0.2913365, 1, 0, 0.145098, 1,
2.137976, -1.791012, 1.878359, 1, 0, 0.1372549, 1,
2.154842, -0.8765496, 2.186611, 1, 0, 0.1333333, 1,
2.20302, 0.6561406, 2.486356, 1, 0, 0.1254902, 1,
2.212274, -0.9013193, 2.560273, 1, 0, 0.1215686, 1,
2.22044, 0.6335877, 1.736608, 1, 0, 0.1137255, 1,
2.232942, 0.7783101, 3.234026, 1, 0, 0.1098039, 1,
2.287761, -0.9162287, 2.884291, 1, 0, 0.1019608, 1,
2.322488, 0.9802963, 1.230226, 1, 0, 0.09411765, 1,
2.337155, -0.6611318, 0.2506159, 1, 0, 0.09019608, 1,
2.475531, 1.512223, 0.731709, 1, 0, 0.08235294, 1,
2.489831, -0.3771138, 2.461801, 1, 0, 0.07843138, 1,
2.562361, -0.2894039, 1.70094, 1, 0, 0.07058824, 1,
2.62545, 0.5631136, 1.136284, 1, 0, 0.06666667, 1,
2.631127, -1.448393, 0.8117983, 1, 0, 0.05882353, 1,
2.708987, -1.639028, 3.510248, 1, 0, 0.05490196, 1,
2.742167, 0.01562965, 0.6114146, 1, 0, 0.04705882, 1,
2.825881, 0.3609218, 0.4693224, 1, 0, 0.04313726, 1,
2.887884, -0.5618768, 0.2007862, 1, 0, 0.03529412, 1,
2.893041, -0.3159294, 3.984381, 1, 0, 0.03137255, 1,
2.980493, 0.82336, 0.5387427, 1, 0, 0.02352941, 1,
3.068186, 1.898769, 0.9573637, 1, 0, 0.01960784, 1,
3.224731, -0.362556, 1.47936, 1, 0, 0.01176471, 1,
4.017175, -0.7029057, 1.102175, 1, 0, 0.007843138, 1
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
0.1946695, -4.422364, -8.126566, 0, -0.5, 0.5, 0.5,
0.1946695, -4.422364, -8.126566, 1, -0.5, 0.5, 0.5,
0.1946695, -4.422364, -8.126566, 1, 1.5, 0.5, 0.5,
0.1946695, -4.422364, -8.126566, 0, 1.5, 0.5, 0.5
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
-4.923666, -0.0005048513, -8.126566, 0, -0.5, 0.5, 0.5,
-4.923666, -0.0005048513, -8.126566, 1, -0.5, 0.5, 0.5,
-4.923666, -0.0005048513, -8.126566, 1, 1.5, 0.5, 0.5,
-4.923666, -0.0005048513, -8.126566, 0, 1.5, 0.5, 0.5
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
-4.923666, -4.422364, 0.1019075, 0, -0.5, 0.5, 0.5,
-4.923666, -4.422364, 0.1019075, 1, -0.5, 0.5, 0.5,
-4.923666, -4.422364, 0.1019075, 1, 1.5, 0.5, 0.5,
-4.923666, -4.422364, 0.1019075, 0, 1.5, 0.5, 0.5
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
-2, -3.401935, -6.227688,
4, -3.401935, -6.227688,
-2, -3.401935, -6.227688,
-2, -3.572006, -6.544168,
0, -3.401935, -6.227688,
0, -3.572006, -6.544168,
2, -3.401935, -6.227688,
2, -3.572006, -6.544168,
4, -3.401935, -6.227688,
4, -3.572006, -6.544168
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
"2",
"4"
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
-2, -3.912149, -7.177127, 0, -0.5, 0.5, 0.5,
-2, -3.912149, -7.177127, 1, -0.5, 0.5, 0.5,
-2, -3.912149, -7.177127, 1, 1.5, 0.5, 0.5,
-2, -3.912149, -7.177127, 0, 1.5, 0.5, 0.5,
0, -3.912149, -7.177127, 0, -0.5, 0.5, 0.5,
0, -3.912149, -7.177127, 1, -0.5, 0.5, 0.5,
0, -3.912149, -7.177127, 1, 1.5, 0.5, 0.5,
0, -3.912149, -7.177127, 0, 1.5, 0.5, 0.5,
2, -3.912149, -7.177127, 0, -0.5, 0.5, 0.5,
2, -3.912149, -7.177127, 1, -0.5, 0.5, 0.5,
2, -3.912149, -7.177127, 1, 1.5, 0.5, 0.5,
2, -3.912149, -7.177127, 0, 1.5, 0.5, 0.5,
4, -3.912149, -7.177127, 0, -0.5, 0.5, 0.5,
4, -3.912149, -7.177127, 1, -0.5, 0.5, 0.5,
4, -3.912149, -7.177127, 1, 1.5, 0.5, 0.5,
4, -3.912149, -7.177127, 0, 1.5, 0.5, 0.5
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
-3.742512, -3, -6.227688,
-3.742512, 3, -6.227688,
-3.742512, -3, -6.227688,
-3.93937, -3, -6.544168,
-3.742512, -2, -6.227688,
-3.93937, -2, -6.544168,
-3.742512, -1, -6.227688,
-3.93937, -1, -6.544168,
-3.742512, 0, -6.227688,
-3.93937, 0, -6.544168,
-3.742512, 1, -6.227688,
-3.93937, 1, -6.544168,
-3.742512, 2, -6.227688,
-3.93937, 2, -6.544168,
-3.742512, 3, -6.227688,
-3.93937, 3, -6.544168
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
-4.333088, -3, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, -3, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, -3, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, -3, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, -2, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, -2, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, -2, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, -2, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, -1, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, -1, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, -1, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, -1, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, 0, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, 0, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, 0, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, 0, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, 1, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, 1, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, 1, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, 1, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, 2, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, 2, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, 2, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, 2, -7.177127, 0, 1.5, 0.5, 0.5,
-4.333088, 3, -7.177127, 0, -0.5, 0.5, 0.5,
-4.333088, 3, -7.177127, 1, -0.5, 0.5, 0.5,
-4.333088, 3, -7.177127, 1, 1.5, 0.5, 0.5,
-4.333088, 3, -7.177127, 0, 1.5, 0.5, 0.5
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
-3.742512, -3.401935, -6,
-3.742512, -3.401935, 6,
-3.742512, -3.401935, -6,
-3.93937, -3.572006, -6,
-3.742512, -3.401935, -4,
-3.93937, -3.572006, -4,
-3.742512, -3.401935, -2,
-3.93937, -3.572006, -2,
-3.742512, -3.401935, 0,
-3.93937, -3.572006, 0,
-3.742512, -3.401935, 2,
-3.93937, -3.572006, 2,
-3.742512, -3.401935, 4,
-3.93937, -3.572006, 4,
-3.742512, -3.401935, 6,
-3.93937, -3.572006, 6
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
"-6",
"-4",
"-2",
"0",
"2",
"4",
"6"
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
-4.333088, -3.912149, -6, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -6, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -6, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, -6, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, -4, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -4, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -4, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, -4, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, -2, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -2, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, -2, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, -2, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 0, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 0, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 0, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 0, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 2, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 2, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 2, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 2, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 4, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 4, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 4, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 4, 0, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 6, 0, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 6, 1, -0.5, 0.5, 0.5,
-4.333088, -3.912149, 6, 1, 1.5, 0.5, 0.5,
-4.333088, -3.912149, 6, 0, 1.5, 0.5, 0.5
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
-3.742512, -3.401935, -6.227688,
-3.742512, 3.400925, -6.227688,
-3.742512, -3.401935, 6.431503,
-3.742512, 3.400925, 6.431503,
-3.742512, -3.401935, -6.227688,
-3.742512, -3.401935, 6.431503,
-3.742512, 3.400925, -6.227688,
-3.742512, 3.400925, 6.431503,
-3.742512, -3.401935, -6.227688,
4.13185, -3.401935, -6.227688,
-3.742512, -3.401935, 6.431503,
4.13185, -3.401935, 6.431503,
-3.742512, 3.400925, -6.227688,
4.13185, 3.400925, -6.227688,
-3.742512, 3.400925, 6.431503,
4.13185, 3.400925, 6.431503,
4.13185, -3.401935, -6.227688,
4.13185, 3.400925, -6.227688,
4.13185, -3.401935, 6.431503,
4.13185, 3.400925, 6.431503,
4.13185, -3.401935, -6.227688,
4.13185, -3.401935, 6.431503,
4.13185, 3.400925, -6.227688,
4.13185, 3.400925, 6.431503
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
var radius = 8.750434;
var distance = 38.93167;
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
mvMatrix.translate( -0.1946695, 0.0005048513, -0.1019075 );
mvMatrix.scale( 1.201512, 1.390759, 0.7473733 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.93167);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


