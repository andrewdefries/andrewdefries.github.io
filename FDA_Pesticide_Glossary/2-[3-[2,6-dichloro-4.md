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
-2.966812, 0.4731236, -0.4031344, 1, 0, 0, 1,
-2.961487, 0.7176916, -1.020141, 1, 0.007843138, 0, 1,
-2.745529, -0.6316474, -3.66709, 1, 0.01176471, 0, 1,
-2.688755, 0.8470258, -1.123393, 1, 0.01960784, 0, 1,
-2.681173, 1.074102, -2.168504, 1, 0.02352941, 0, 1,
-2.658339, 0.5198072, -0.812569, 1, 0.03137255, 0, 1,
-2.655302, 2.394173, -0.4360231, 1, 0.03529412, 0, 1,
-2.605587, -0.4139871, -1.478719, 1, 0.04313726, 0, 1,
-2.600807, -1.767224, -2.339505, 1, 0.04705882, 0, 1,
-2.583661, -1.271276, -2.576869, 1, 0.05490196, 0, 1,
-2.345637, -0.08525233, -2.483216, 1, 0.05882353, 0, 1,
-2.31027, -1.072495, -1.088161, 1, 0.06666667, 0, 1,
-2.256369, 1.622945, 0.005727255, 1, 0.07058824, 0, 1,
-2.255924, -0.8713769, -2.246707, 1, 0.07843138, 0, 1,
-2.234613, 2.312489, -1.481466, 1, 0.08235294, 0, 1,
-2.222243, -0.3360633, -1.329142, 1, 0.09019608, 0, 1,
-2.18092, 0.5937946, -2.142398, 1, 0.09411765, 0, 1,
-2.179983, -0.6589974, -2.039563, 1, 0.1019608, 0, 1,
-2.138712, 0.6588942, -2.494519, 1, 0.1098039, 0, 1,
-2.113843, -0.2794148, -2.024966, 1, 0.1137255, 0, 1,
-2.097869, -2.271896, -1.981932, 1, 0.1215686, 0, 1,
-2.08238, 0.9729645, -0.3092162, 1, 0.1254902, 0, 1,
-1.99408, -0.9831123, -1.169839, 1, 0.1333333, 0, 1,
-1.972937, -0.6760507, -2.068104, 1, 0.1372549, 0, 1,
-1.966668, 0.62981, -2.375584, 1, 0.145098, 0, 1,
-1.957126, -1.097969, -2.613835, 1, 0.1490196, 0, 1,
-1.955366, 0.6645566, -0.8315159, 1, 0.1568628, 0, 1,
-1.919642, 0.001712534, -1.111782, 1, 0.1607843, 0, 1,
-1.917038, -1.248121, -2.914489, 1, 0.1686275, 0, 1,
-1.899938, 2.110928, 0.5745431, 1, 0.172549, 0, 1,
-1.893973, 0.01123274, -3.315501, 1, 0.1803922, 0, 1,
-1.854881, 0.07797156, -1.084781, 1, 0.1843137, 0, 1,
-1.838539, -0.1259115, -2.824505, 1, 0.1921569, 0, 1,
-1.83674, -0.3087741, 0.05793742, 1, 0.1960784, 0, 1,
-1.82174, -0.3039287, -0.723969, 1, 0.2039216, 0, 1,
-1.805493, -0.2792642, -2.604503, 1, 0.2117647, 0, 1,
-1.80126, -0.3131441, -1.16322, 1, 0.2156863, 0, 1,
-1.788784, -1.724875, -5.115364, 1, 0.2235294, 0, 1,
-1.785001, -0.995548, -2.01306, 1, 0.227451, 0, 1,
-1.773723, -0.542311, -2.409696, 1, 0.2352941, 0, 1,
-1.772587, -0.8629971, -1.283565, 1, 0.2392157, 0, 1,
-1.765334, 1.723045, -0.480726, 1, 0.2470588, 0, 1,
-1.739362, 0.2027889, -1.236167, 1, 0.2509804, 0, 1,
-1.735, -1.240711, 0.3330826, 1, 0.2588235, 0, 1,
-1.722341, -0.4022173, -1.547472, 1, 0.2627451, 0, 1,
-1.71168, 1.757763, -0.04463786, 1, 0.2705882, 0, 1,
-1.689588, 0.7515451, 0.5408436, 1, 0.2745098, 0, 1,
-1.668736, -0.02895293, -0.7569281, 1, 0.282353, 0, 1,
-1.645455, -0.8084708, -2.422311, 1, 0.2862745, 0, 1,
-1.625278, 0.1972427, -1.841616, 1, 0.2941177, 0, 1,
-1.619152, 0.9664714, -1.338193, 1, 0.3019608, 0, 1,
-1.597306, 0.5282797, -2.021355, 1, 0.3058824, 0, 1,
-1.583385, -0.08289243, -0.5563326, 1, 0.3137255, 0, 1,
-1.5662, 0.001290769, 0.2445687, 1, 0.3176471, 0, 1,
-1.566028, -0.2617289, -0.5915657, 1, 0.3254902, 0, 1,
-1.560188, -0.2663734, -0.6500371, 1, 0.3294118, 0, 1,
-1.557101, -0.4604369, -2.24994, 1, 0.3372549, 0, 1,
-1.552273, 0.3573965, -1.481566, 1, 0.3411765, 0, 1,
-1.551855, -0.5271589, -2.854881, 1, 0.3490196, 0, 1,
-1.520128, -0.5143898, -2.556599, 1, 0.3529412, 0, 1,
-1.517669, 0.7585662, -0.9357499, 1, 0.3607843, 0, 1,
-1.511746, 0.6209062, -0.95314, 1, 0.3647059, 0, 1,
-1.49621, -0.100842, -2.508602, 1, 0.372549, 0, 1,
-1.495809, -0.04982987, -2.026712, 1, 0.3764706, 0, 1,
-1.493844, 1.459381, -0.6318927, 1, 0.3843137, 0, 1,
-1.491395, -0.733268, -2.270726, 1, 0.3882353, 0, 1,
-1.487164, 0.6489062, -1.411885, 1, 0.3960784, 0, 1,
-1.485479, 0.02697214, -2.071934, 1, 0.4039216, 0, 1,
-1.482359, 0.2559617, -3.037603, 1, 0.4078431, 0, 1,
-1.479522, -0.4503742, -2.606956, 1, 0.4156863, 0, 1,
-1.475545, -1.274743, -1.130837, 1, 0.4196078, 0, 1,
-1.467801, -1.006478, -3.986612, 1, 0.427451, 0, 1,
-1.466105, 1.35986, -0.7999355, 1, 0.4313726, 0, 1,
-1.458686, -1.370108, -2.882973, 1, 0.4392157, 0, 1,
-1.458074, -0.1169402, -0.6848614, 1, 0.4431373, 0, 1,
-1.448221, 0.1162941, -2.526658, 1, 0.4509804, 0, 1,
-1.441383, 1.111994, -2.161907, 1, 0.454902, 0, 1,
-1.414709, 1.305542, -0.9737369, 1, 0.4627451, 0, 1,
-1.410927, -0.5376322, -1.758208, 1, 0.4666667, 0, 1,
-1.406358, 1.399735, -0.6774846, 1, 0.4745098, 0, 1,
-1.405279, -0.1099663, -1.790399, 1, 0.4784314, 0, 1,
-1.405023, 1.587566, -0.2855188, 1, 0.4862745, 0, 1,
-1.400756, -1.421004, -0.7850634, 1, 0.4901961, 0, 1,
-1.400273, 0.5685539, -2.340157, 1, 0.4980392, 0, 1,
-1.395431, 0.741201, -0.4652839, 1, 0.5058824, 0, 1,
-1.39094, 0.2115691, -3.296227, 1, 0.509804, 0, 1,
-1.387812, -0.836214, -1.862696, 1, 0.5176471, 0, 1,
-1.38028, -2.316541, -2.073632, 1, 0.5215687, 0, 1,
-1.365988, -0.9737225, -2.24619, 1, 0.5294118, 0, 1,
-1.363018, -1.029529, -2.479962, 1, 0.5333334, 0, 1,
-1.33766, -0.5637724, -1.286626, 1, 0.5411765, 0, 1,
-1.335523, 0.3035802, -0.6167291, 1, 0.5450981, 0, 1,
-1.325883, -0.3055297, -3.803988, 1, 0.5529412, 0, 1,
-1.319446, -0.1515033, -2.603533, 1, 0.5568628, 0, 1,
-1.317492, -0.5963008, -1.792173, 1, 0.5647059, 0, 1,
-1.316926, -0.4438019, -0.4315237, 1, 0.5686275, 0, 1,
-1.299479, 1.125624, -0.7753403, 1, 0.5764706, 0, 1,
-1.298686, -1.172846, -2.781374, 1, 0.5803922, 0, 1,
-1.288373, -0.122664, -0.5118454, 1, 0.5882353, 0, 1,
-1.288357, -0.08721634, -2.315924, 1, 0.5921569, 0, 1,
-1.284894, 1.512465, -0.5285404, 1, 0.6, 0, 1,
-1.284834, -0.06357427, -1.844508, 1, 0.6078432, 0, 1,
-1.278154, 1.675218, -1.851454, 1, 0.6117647, 0, 1,
-1.27541, 0.3814276, -1.439597, 1, 0.6196079, 0, 1,
-1.275362, -0.6600688, -2.774814, 1, 0.6235294, 0, 1,
-1.274435, 1.219775, -1.416886, 1, 0.6313726, 0, 1,
-1.274144, 0.2827972, -1.437595, 1, 0.6352941, 0, 1,
-1.268565, 1.391537, -0.6416017, 1, 0.6431373, 0, 1,
-1.26766, 1.505456, -1.01094, 1, 0.6470588, 0, 1,
-1.263505, -1.345447, -1.884445, 1, 0.654902, 0, 1,
-1.26152, -2.027465, -2.288806, 1, 0.6588235, 0, 1,
-1.254012, 0.5405735, -1.290475, 1, 0.6666667, 0, 1,
-1.242857, 0.9454129, -1.440292, 1, 0.6705883, 0, 1,
-1.234803, -0.9491963, -1.305335, 1, 0.6784314, 0, 1,
-1.231979, -0.4390517, -2.416715, 1, 0.682353, 0, 1,
-1.231372, -0.08010199, -2.133727, 1, 0.6901961, 0, 1,
-1.225498, 0.3087388, -1.403068, 1, 0.6941177, 0, 1,
-1.22481, 1.06898, -0.5159541, 1, 0.7019608, 0, 1,
-1.223085, 0.2028584, -1.001569, 1, 0.7098039, 0, 1,
-1.222265, 0.2210746, -2.219256, 1, 0.7137255, 0, 1,
-1.218886, -0.9407784, -2.334604, 1, 0.7215686, 0, 1,
-1.215374, 0.7913855, -0.4595823, 1, 0.7254902, 0, 1,
-1.214202, -0.02015145, -1.65694, 1, 0.7333333, 0, 1,
-1.211258, 1.417963, -0.9727061, 1, 0.7372549, 0, 1,
-1.209227, 0.0660819, -1.657915, 1, 0.7450981, 0, 1,
-1.203523, 0.7371054, -1.564808, 1, 0.7490196, 0, 1,
-1.202219, 0.2387652, -2.06435, 1, 0.7568628, 0, 1,
-1.183987, 0.4535466, -0.4290978, 1, 0.7607843, 0, 1,
-1.176212, 1.279615, -1.24099, 1, 0.7686275, 0, 1,
-1.163753, 0.5400862, -2.39026, 1, 0.772549, 0, 1,
-1.154339, -0.4565567, -3.425393, 1, 0.7803922, 0, 1,
-1.140371, -0.479023, -3.037794, 1, 0.7843137, 0, 1,
-1.134863, 0.903056, -2.440194, 1, 0.7921569, 0, 1,
-1.128553, -0.02923496, 0.370461, 1, 0.7960784, 0, 1,
-1.126268, -0.5182875, -1.878962, 1, 0.8039216, 0, 1,
-1.123246, 0.05874873, 0.03192488, 1, 0.8117647, 0, 1,
-1.114836, -0.2185388, -1.3971, 1, 0.8156863, 0, 1,
-1.108605, 1.144695, -0.2151038, 1, 0.8235294, 0, 1,
-1.098122, -0.246535, -1.839131, 1, 0.827451, 0, 1,
-1.090317, -1.308213, -0.4119781, 1, 0.8352941, 0, 1,
-1.089398, 0.3371473, -2.878303, 1, 0.8392157, 0, 1,
-1.086294, -0.5613824, -3.00982, 1, 0.8470588, 0, 1,
-1.086172, -1.077275, -2.665105, 1, 0.8509804, 0, 1,
-1.06949, 0.579735, -0.4309894, 1, 0.8588235, 0, 1,
-1.068465, 0.8874807, -1.307036, 1, 0.8627451, 0, 1,
-1.063625, 0.02515448, -1.290141, 1, 0.8705882, 0, 1,
-1.052258, -0.9686408, -1.672832, 1, 0.8745098, 0, 1,
-1.039629, -0.01117345, -2.686255, 1, 0.8823529, 0, 1,
-1.039462, -0.3198268, -1.640034, 1, 0.8862745, 0, 1,
-1.035651, -1.165236, -2.322138, 1, 0.8941177, 0, 1,
-1.03531, -0.5138856, -2.857649, 1, 0.8980392, 0, 1,
-1.034404, -0.5028457, -0.7900134, 1, 0.9058824, 0, 1,
-1.033707, 3.323798, 1.412293, 1, 0.9137255, 0, 1,
-1.033211, -0.9432383, -2.584393, 1, 0.9176471, 0, 1,
-1.03121, 1.14086, -1.109175, 1, 0.9254902, 0, 1,
-1.025151, -2.369296, -1.955941, 1, 0.9294118, 0, 1,
-1.014517, -1.958743, -3.75926, 1, 0.9372549, 0, 1,
-1.011711, -1.827928, -1.913179, 1, 0.9411765, 0, 1,
-1.010796, -1.281242, -3.380543, 1, 0.9490196, 0, 1,
-1.00234, 0.7982245, -0.9007867, 1, 0.9529412, 0, 1,
-0.9912583, 0.1466403, -1.456416, 1, 0.9607843, 0, 1,
-0.9880643, -0.0570592, -0.640811, 1, 0.9647059, 0, 1,
-0.9876512, -0.720541, 0.10983, 1, 0.972549, 0, 1,
-0.9661099, 0.1814514, -1.633569, 1, 0.9764706, 0, 1,
-0.9644784, -0.2044584, -2.071232, 1, 0.9843137, 0, 1,
-0.9641418, 1.252412, 1.56261, 1, 0.9882353, 0, 1,
-0.9640803, -0.1678077, -2.156184, 1, 0.9960784, 0, 1,
-0.9615135, -0.07597033, -1.10038, 0.9960784, 1, 0, 1,
-0.9531172, 0.3118158, 0.6788524, 0.9921569, 1, 0, 1,
-0.9510179, -0.8481351, -0.8202377, 0.9843137, 1, 0, 1,
-0.9493198, 0.4866492, -0.9687375, 0.9803922, 1, 0, 1,
-0.9455401, -1.349337, -2.182367, 0.972549, 1, 0, 1,
-0.9427946, -0.03194623, -4.329583, 0.9686275, 1, 0, 1,
-0.9415198, -0.5265243, -3.007242, 0.9607843, 1, 0, 1,
-0.9380151, -0.45251, -3.046785, 0.9568627, 1, 0, 1,
-0.9300191, 0.01517385, -0.6581564, 0.9490196, 1, 0, 1,
-0.9268954, 0.7031741, -0.837886, 0.945098, 1, 0, 1,
-0.9254384, 0.7240671, -2.226529, 0.9372549, 1, 0, 1,
-0.9244938, 0.970181, 1.918194, 0.9333333, 1, 0, 1,
-0.9222668, 0.1397615, -0.5432042, 0.9254902, 1, 0, 1,
-0.9211036, -0.7370767, -3.543698, 0.9215686, 1, 0, 1,
-0.9177473, -1.611407, -1.562099, 0.9137255, 1, 0, 1,
-0.9129446, -0.3328024, -1.044711, 0.9098039, 1, 0, 1,
-0.9108505, -2.409093, -3.115615, 0.9019608, 1, 0, 1,
-0.9067506, 1.001848, -0.6202053, 0.8941177, 1, 0, 1,
-0.905103, -0.5218503, -2.14394, 0.8901961, 1, 0, 1,
-0.8987567, -0.6155453, -1.997899, 0.8823529, 1, 0, 1,
-0.8977828, 0.3120898, -1.200647, 0.8784314, 1, 0, 1,
-0.8953114, -1.124481, -0.9650908, 0.8705882, 1, 0, 1,
-0.8930039, -1.132838, -3.496878, 0.8666667, 1, 0, 1,
-0.8927632, 0.9405244, -1.755682, 0.8588235, 1, 0, 1,
-0.8891453, -0.134453, -1.439541, 0.854902, 1, 0, 1,
-0.887733, 0.04116315, -4.348433, 0.8470588, 1, 0, 1,
-0.8859211, 0.4235214, -0.96185, 0.8431373, 1, 0, 1,
-0.8795817, -0.6041311, -1.849603, 0.8352941, 1, 0, 1,
-0.8784155, -1.170616, -2.438108, 0.8313726, 1, 0, 1,
-0.8758746, -2.314096, -2.970789, 0.8235294, 1, 0, 1,
-0.8623518, -2.03611, -4.604298, 0.8196079, 1, 0, 1,
-0.8554075, -0.3372676, -1.567141, 0.8117647, 1, 0, 1,
-0.8521135, -1.252612, -2.094763, 0.8078431, 1, 0, 1,
-0.8469012, 1.109896, -0.4534537, 0.8, 1, 0, 1,
-0.8410668, 0.6219424, -1.822972, 0.7921569, 1, 0, 1,
-0.8389851, 0.4528947, -2.749851, 0.7882353, 1, 0, 1,
-0.8367515, -0.1026949, -3.911111, 0.7803922, 1, 0, 1,
-0.8335779, 1.449169, 0.8391716, 0.7764706, 1, 0, 1,
-0.8293018, 0.7016487, -1.795761, 0.7686275, 1, 0, 1,
-0.8253649, -1.150046, -3.845875, 0.7647059, 1, 0, 1,
-0.824812, -0.03526178, -1.288672, 0.7568628, 1, 0, 1,
-0.8227234, 0.5925436, -1.56322, 0.7529412, 1, 0, 1,
-0.8190355, 0.2275225, -0.4630318, 0.7450981, 1, 0, 1,
-0.8178692, -0.01371884, -1.642276, 0.7411765, 1, 0, 1,
-0.8169789, -0.08505368, -3.022267, 0.7333333, 1, 0, 1,
-0.8104082, 0.02027108, -1.577171, 0.7294118, 1, 0, 1,
-0.8022212, -0.2719126, -0.5466595, 0.7215686, 1, 0, 1,
-0.7934725, -0.5319771, -1.592664, 0.7176471, 1, 0, 1,
-0.7907552, 0.06635499, -1.23466, 0.7098039, 1, 0, 1,
-0.7890856, -0.4371795, -1.181602, 0.7058824, 1, 0, 1,
-0.7844149, -0.1789801, -2.380424, 0.6980392, 1, 0, 1,
-0.779658, -1.428749, -2.601816, 0.6901961, 1, 0, 1,
-0.7745842, -1.491433, -3.004445, 0.6862745, 1, 0, 1,
-0.7670566, -0.2961629, -3.138986, 0.6784314, 1, 0, 1,
-0.760707, -1.363949, -1.753913, 0.6745098, 1, 0, 1,
-0.7555121, -0.8597832, -2.444011, 0.6666667, 1, 0, 1,
-0.754895, -0.8757772, 0.2188095, 0.6627451, 1, 0, 1,
-0.7542059, 0.4527061, -2.571671, 0.654902, 1, 0, 1,
-0.7492841, 0.7944713, 0.3694742, 0.6509804, 1, 0, 1,
-0.7492287, -2.63801, -3.691312, 0.6431373, 1, 0, 1,
-0.7455302, -0.1963323, -2.169594, 0.6392157, 1, 0, 1,
-0.7449532, -1.701932, -2.967106, 0.6313726, 1, 0, 1,
-0.7365143, 1.060454, -0.05359663, 0.627451, 1, 0, 1,
-0.7352692, 1.099285, 0.2811322, 0.6196079, 1, 0, 1,
-0.733611, -1.02386, -1.520131, 0.6156863, 1, 0, 1,
-0.7333165, 1.417153, -0.5708799, 0.6078432, 1, 0, 1,
-0.729757, 0.7966924, -0.9817165, 0.6039216, 1, 0, 1,
-0.7259889, -2.038436, -2.172531, 0.5960785, 1, 0, 1,
-0.7246296, 0.4346627, -0.9861138, 0.5882353, 1, 0, 1,
-0.7234352, -0.1556713, -2.726056, 0.5843138, 1, 0, 1,
-0.7208017, 0.6585656, -0.7969856, 0.5764706, 1, 0, 1,
-0.7198192, -0.008230099, -2.159918, 0.572549, 1, 0, 1,
-0.7181007, 0.5249857, -2.07089, 0.5647059, 1, 0, 1,
-0.7179996, 1.040292, -1.014717, 0.5607843, 1, 0, 1,
-0.7174914, -0.09519676, -1.512708, 0.5529412, 1, 0, 1,
-0.7144773, -0.005002401, -1.330455, 0.5490196, 1, 0, 1,
-0.7136046, 0.5970968, -2.33983, 0.5411765, 1, 0, 1,
-0.7131174, -0.1276591, 1.209066, 0.5372549, 1, 0, 1,
-0.7130418, 0.1877197, -0.3337266, 0.5294118, 1, 0, 1,
-0.7128317, 1.300115, -0.2549805, 0.5254902, 1, 0, 1,
-0.7119793, 1.673332, 1.176713, 0.5176471, 1, 0, 1,
-0.7106963, 0.4902869, -0.4730642, 0.5137255, 1, 0, 1,
-0.7094939, -0.1577586, -2.508536, 0.5058824, 1, 0, 1,
-0.7086451, 0.2454824, -2.188217, 0.5019608, 1, 0, 1,
-0.6904364, 1.733363, 1.30812, 0.4941176, 1, 0, 1,
-0.687932, 1.31466, -1.328285, 0.4862745, 1, 0, 1,
-0.6788778, -0.4900131, -3.435419, 0.4823529, 1, 0, 1,
-0.6787088, 2.80201, -1.217617, 0.4745098, 1, 0, 1,
-0.6784075, 0.6613668, -3.05041, 0.4705882, 1, 0, 1,
-0.6777158, 1.498995, 0.1670072, 0.4627451, 1, 0, 1,
-0.6761455, 0.6031598, -1.423437, 0.4588235, 1, 0, 1,
-0.6711352, -1.055186, -4.371395, 0.4509804, 1, 0, 1,
-0.6647606, 0.03335259, -0.8411127, 0.4470588, 1, 0, 1,
-0.6569538, -0.2612875, -3.438101, 0.4392157, 1, 0, 1,
-0.652499, 0.9511223, -2.091126, 0.4352941, 1, 0, 1,
-0.6506909, 0.8092407, -1.194967, 0.427451, 1, 0, 1,
-0.648711, 0.08481339, -2.582058, 0.4235294, 1, 0, 1,
-0.6472899, -0.9460548, -2.98038, 0.4156863, 1, 0, 1,
-0.6453044, 2.475373, 0.004484857, 0.4117647, 1, 0, 1,
-0.6440057, -0.1922744, -2.518466, 0.4039216, 1, 0, 1,
-0.6384042, -0.4329563, -2.828321, 0.3960784, 1, 0, 1,
-0.6300645, -0.9774222, -3.213684, 0.3921569, 1, 0, 1,
-0.6270855, -0.5319973, -2.274581, 0.3843137, 1, 0, 1,
-0.6268392, -0.2763253, -3.228982, 0.3803922, 1, 0, 1,
-0.626263, -1.182964, -2.698247, 0.372549, 1, 0, 1,
-0.6255661, 0.05671527, -1.726515, 0.3686275, 1, 0, 1,
-0.6242611, 0.4155869, -2.168286, 0.3607843, 1, 0, 1,
-0.6237516, -0.4721346, -1.44117, 0.3568628, 1, 0, 1,
-0.6233459, 0.4473574, -3.448703, 0.3490196, 1, 0, 1,
-0.6199065, 1.272751, 0.05271768, 0.345098, 1, 0, 1,
-0.6197342, -1.783597, -2.642359, 0.3372549, 1, 0, 1,
-0.6182055, -0.2654329, -3.937357, 0.3333333, 1, 0, 1,
-0.6179783, 0.6876734, -1.414454, 0.3254902, 1, 0, 1,
-0.6107819, -0.4463867, -2.604766, 0.3215686, 1, 0, 1,
-0.6071371, 2.560754, -0.8730068, 0.3137255, 1, 0, 1,
-0.606602, 0.1120022, -2.657967, 0.3098039, 1, 0, 1,
-0.6057239, 2.384276, -0.2527087, 0.3019608, 1, 0, 1,
-0.6021802, -0.689503, -1.318642, 0.2941177, 1, 0, 1,
-0.5919483, 2.136703, 0.3946294, 0.2901961, 1, 0, 1,
-0.5914149, 0.3120514, -0.7489046, 0.282353, 1, 0, 1,
-0.5880017, 0.1568009, -1.949206, 0.2784314, 1, 0, 1,
-0.5782223, -0.9442776, -1.186921, 0.2705882, 1, 0, 1,
-0.5711367, 0.9732107, -1.213299, 0.2666667, 1, 0, 1,
-0.5710353, 0.3060447, -0.9155352, 0.2588235, 1, 0, 1,
-0.5678356, 1.385235, -0.3408565, 0.254902, 1, 0, 1,
-0.5677048, -0.991504, -2.542852, 0.2470588, 1, 0, 1,
-0.5650424, -0.334038, -1.915221, 0.2431373, 1, 0, 1,
-0.563548, 0.1300176, -2.606119, 0.2352941, 1, 0, 1,
-0.5592172, 0.3884009, -1.60646, 0.2313726, 1, 0, 1,
-0.5572518, 0.182125, -2.41204, 0.2235294, 1, 0, 1,
-0.5568252, -0.7415797, -2.730591, 0.2196078, 1, 0, 1,
-0.5474731, 0.3810982, 0.5792663, 0.2117647, 1, 0, 1,
-0.54632, -0.8089676, -0.6708674, 0.2078431, 1, 0, 1,
-0.5461764, 1.550105, 1.366117, 0.2, 1, 0, 1,
-0.5458932, 1.358546, 0.2040587, 0.1921569, 1, 0, 1,
-0.5342075, 1.362501, 0.3086286, 0.1882353, 1, 0, 1,
-0.5339643, -1.478515, -1.772877, 0.1803922, 1, 0, 1,
-0.5263993, -0.3704271, -1.36271, 0.1764706, 1, 0, 1,
-0.5235791, -0.9714789, -2.802325, 0.1686275, 1, 0, 1,
-0.5217098, -1.73556, -3.166795, 0.1647059, 1, 0, 1,
-0.5209616, 0.9120275, -1.372973, 0.1568628, 1, 0, 1,
-0.5208947, 2.345819, -0.3758972, 0.1529412, 1, 0, 1,
-0.5199517, 0.2414369, -2.376419, 0.145098, 1, 0, 1,
-0.5183406, 0.5294522, -0.2945493, 0.1411765, 1, 0, 1,
-0.5034331, -0.7862212, -3.178777, 0.1333333, 1, 0, 1,
-0.5027002, -0.6876971, -2.737914, 0.1294118, 1, 0, 1,
-0.5007911, 0.7635236, 0.1123662, 0.1215686, 1, 0, 1,
-0.4979005, -1.765916, -4.075562, 0.1176471, 1, 0, 1,
-0.4908363, 0.4530459, -1.305246, 0.1098039, 1, 0, 1,
-0.4871966, -0.4713642, -0.8482039, 0.1058824, 1, 0, 1,
-0.4762241, 0.1282893, -1.543372, 0.09803922, 1, 0, 1,
-0.4708967, 0.08094594, -1.574438, 0.09019608, 1, 0, 1,
-0.4701401, -0.08987803, -2.941275, 0.08627451, 1, 0, 1,
-0.4696995, -0.6784963, -1.913586, 0.07843138, 1, 0, 1,
-0.4611349, 0.9351716, 0.3323054, 0.07450981, 1, 0, 1,
-0.4610794, 0.1819747, -1.966473, 0.06666667, 1, 0, 1,
-0.4513006, -0.3721705, -0.3107164, 0.0627451, 1, 0, 1,
-0.4505304, 0.7016059, -1.218352, 0.05490196, 1, 0, 1,
-0.4480447, -0.4725116, -1.725233, 0.05098039, 1, 0, 1,
-0.4445214, -0.4840545, -3.037893, 0.04313726, 1, 0, 1,
-0.4414299, -0.3569114, -2.855976, 0.03921569, 1, 0, 1,
-0.4411578, -0.8081545, -1.732182, 0.03137255, 1, 0, 1,
-0.431995, 2.366338, -0.9937472, 0.02745098, 1, 0, 1,
-0.4241629, -0.9685531, -4.580439, 0.01960784, 1, 0, 1,
-0.4238206, -1.417818, -2.979288, 0.01568628, 1, 0, 1,
-0.4181307, 0.8646283, -0.5877349, 0.007843138, 1, 0, 1,
-0.4105853, -0.7261785, -2.823437, 0.003921569, 1, 0, 1,
-0.4104962, -0.794996, -1.712538, 0, 1, 0.003921569, 1,
-0.4095353, -0.4687878, -3.031753, 0, 1, 0.01176471, 1,
-0.4072745, -0.6747515, -3.545359, 0, 1, 0.01568628, 1,
-0.4070796, -1.460099, -4.061054, 0, 1, 0.02352941, 1,
-0.4032899, -0.2767695, -1.908754, 0, 1, 0.02745098, 1,
-0.399221, 0.821928, 0.1816759, 0, 1, 0.03529412, 1,
-0.3971264, -1.366405, -2.464783, 0, 1, 0.03921569, 1,
-0.3948532, 1.08732, -0.947565, 0, 1, 0.04705882, 1,
-0.3943714, 0.2380798, -1.972372, 0, 1, 0.05098039, 1,
-0.3899049, 0.9178572, 1.058763, 0, 1, 0.05882353, 1,
-0.3837983, -1.565306, -2.702343, 0, 1, 0.0627451, 1,
-0.3837295, -1.444523, -2.378547, 0, 1, 0.07058824, 1,
-0.3760801, 0.159067, -1.398714, 0, 1, 0.07450981, 1,
-0.3748536, 0.02395048, 0.05333411, 0, 1, 0.08235294, 1,
-0.3657678, 0.7590874, -0.4916402, 0, 1, 0.08627451, 1,
-0.3639902, 0.06959026, -2.139104, 0, 1, 0.09411765, 1,
-0.3631373, -0.9930343, -1.403681, 0, 1, 0.1019608, 1,
-0.362394, 1.714204, -0.3219076, 0, 1, 0.1058824, 1,
-0.3610596, 2.113154, 0.1777332, 0, 1, 0.1137255, 1,
-0.3600048, 0.2091538, -0.5585748, 0, 1, 0.1176471, 1,
-0.3552896, 0.7711188, -0.6491204, 0, 1, 0.1254902, 1,
-0.3527126, -0.9029288, -1.309559, 0, 1, 0.1294118, 1,
-0.35132, -0.1127557, -3.324226, 0, 1, 0.1372549, 1,
-0.3506782, 0.4301782, 1.798825, 0, 1, 0.1411765, 1,
-0.3463669, 1.526087, -1.435387, 0, 1, 0.1490196, 1,
-0.3417461, -1.195637, -2.103225, 0, 1, 0.1529412, 1,
-0.3398597, -0.3382231, -1.585004, 0, 1, 0.1607843, 1,
-0.3369626, -0.9989943, -3.036296, 0, 1, 0.1647059, 1,
-0.3339697, 1.309497, 0.2951004, 0, 1, 0.172549, 1,
-0.3337151, 1.86482, 1.178042, 0, 1, 0.1764706, 1,
-0.3325438, -0.8030224, -2.359966, 0, 1, 0.1843137, 1,
-0.3319314, -0.9419859, -2.612881, 0, 1, 0.1882353, 1,
-0.328328, -0.3865818, -2.962198, 0, 1, 0.1960784, 1,
-0.3280962, 1.680117, 0.648134, 0, 1, 0.2039216, 1,
-0.3237839, -0.1394989, -2.638197, 0, 1, 0.2078431, 1,
-0.3234029, 1.701477, -1.923998, 0, 1, 0.2156863, 1,
-0.3190186, 0.8646849, 0.6601221, 0, 1, 0.2196078, 1,
-0.3180476, -0.1144949, -1.976711, 0, 1, 0.227451, 1,
-0.3178839, -0.5904534, -5.244998, 0, 1, 0.2313726, 1,
-0.3175567, -0.7534413, -2.636741, 0, 1, 0.2392157, 1,
-0.3172802, -1.002233, -1.462772, 0, 1, 0.2431373, 1,
-0.3168248, 1.07678, -0.9000647, 0, 1, 0.2509804, 1,
-0.314985, 0.3136771, -0.08818344, 0, 1, 0.254902, 1,
-0.3141389, -1.951988, -2.805862, 0, 1, 0.2627451, 1,
-0.3130722, 0.08820618, -0.4068637, 0, 1, 0.2666667, 1,
-0.3121411, 0.697171, 0.9246151, 0, 1, 0.2745098, 1,
-0.3116753, -0.9640787, -2.194417, 0, 1, 0.2784314, 1,
-0.3082784, 1.279352, 0.4052717, 0, 1, 0.2862745, 1,
-0.3068509, -0.3617875, -2.984898, 0, 1, 0.2901961, 1,
-0.3049768, -0.8694414, -4.198249, 0, 1, 0.2980392, 1,
-0.3045478, -1.375196, -2.998397, 0, 1, 0.3058824, 1,
-0.3012153, 0.5418504, -1.901889, 0, 1, 0.3098039, 1,
-0.2987301, -1.120425, -3.556745, 0, 1, 0.3176471, 1,
-0.2969699, -0.4248136, -2.771251, 0, 1, 0.3215686, 1,
-0.2966854, 1.02479, -0.64652, 0, 1, 0.3294118, 1,
-0.292902, -0.3952394, -2.048769, 0, 1, 0.3333333, 1,
-0.2918912, -1.072727, -3.102181, 0, 1, 0.3411765, 1,
-0.2895789, 0.2831594, -0.8014904, 0, 1, 0.345098, 1,
-0.2864987, -0.2006859, -0.9249336, 0, 1, 0.3529412, 1,
-0.2827726, 0.8071101, 2.290518, 0, 1, 0.3568628, 1,
-0.280325, -0.3318105, -3.093411, 0, 1, 0.3647059, 1,
-0.2771189, 0.5047035, -0.6504851, 0, 1, 0.3686275, 1,
-0.2761039, -0.2861763, -3.370063, 0, 1, 0.3764706, 1,
-0.2702537, -1.75518, -3.072405, 0, 1, 0.3803922, 1,
-0.2676479, -0.3013577, -1.311103, 0, 1, 0.3882353, 1,
-0.2591122, -0.6364474, -3.44829, 0, 1, 0.3921569, 1,
-0.2587095, -0.9637188, -3.761809, 0, 1, 0.4, 1,
-0.2565234, -1.480462, -4.366627, 0, 1, 0.4078431, 1,
-0.2523524, 1.076059, 0.8735225, 0, 1, 0.4117647, 1,
-0.2452617, -0.9629781, -3.884969, 0, 1, 0.4196078, 1,
-0.243878, 0.5556179, -0.6697833, 0, 1, 0.4235294, 1,
-0.2398472, 1.215791, 0.6988369, 0, 1, 0.4313726, 1,
-0.2356041, -1.447128, -3.614259, 0, 1, 0.4352941, 1,
-0.2346311, 0.6529411, -0.8712084, 0, 1, 0.4431373, 1,
-0.2287019, -1.170771, -4.308701, 0, 1, 0.4470588, 1,
-0.2267374, 0.3484921, -0.3571965, 0, 1, 0.454902, 1,
-0.2246741, 0.2845945, -1.91968, 0, 1, 0.4588235, 1,
-0.2156664, 1.854988, -0.5180687, 0, 1, 0.4666667, 1,
-0.2141649, -0.04542783, -2.244598, 0, 1, 0.4705882, 1,
-0.2138796, -1.221491, -1.916747, 0, 1, 0.4784314, 1,
-0.2110025, -0.7113454, -2.607393, 0, 1, 0.4823529, 1,
-0.2093182, 0.8245578, -0.07846831, 0, 1, 0.4901961, 1,
-0.2074448, -0.3492674, -3.067827, 0, 1, 0.4941176, 1,
-0.2049695, -0.8737386, -1.456164, 0, 1, 0.5019608, 1,
-0.2046413, 1.166675, 1.527536, 0, 1, 0.509804, 1,
-0.2017849, 0.0315565, -2.226905, 0, 1, 0.5137255, 1,
-0.2006807, -0.7254227, -2.470375, 0, 1, 0.5215687, 1,
-0.2000925, 0.5836965, -0.6974986, 0, 1, 0.5254902, 1,
-0.1994531, -1.162351, -3.009043, 0, 1, 0.5333334, 1,
-0.1986602, 1.721052, 0.03165713, 0, 1, 0.5372549, 1,
-0.1967671, -0.3712972, -2.335047, 0, 1, 0.5450981, 1,
-0.193896, 1.816375, 0.03996179, 0, 1, 0.5490196, 1,
-0.1908476, 0.03311474, -0.8929465, 0, 1, 0.5568628, 1,
-0.1895574, 1.284442, -0.6866338, 0, 1, 0.5607843, 1,
-0.1869385, 0.05689029, -1.201194, 0, 1, 0.5686275, 1,
-0.1865735, -1.039358, -1.756796, 0, 1, 0.572549, 1,
-0.1852108, 1.782114, 0.05731656, 0, 1, 0.5803922, 1,
-0.1840756, -0.2036872, -1.17834, 0, 1, 0.5843138, 1,
-0.1799666, 1.679307, -0.6200473, 0, 1, 0.5921569, 1,
-0.1789258, 0.06457188, -1.478001, 0, 1, 0.5960785, 1,
-0.1785356, -0.4878839, -4.198619, 0, 1, 0.6039216, 1,
-0.1781617, -2.20504, -3.929994, 0, 1, 0.6117647, 1,
-0.1772898, -1.679391, -3.805622, 0, 1, 0.6156863, 1,
-0.1759719, 1.534125, 0.735231, 0, 1, 0.6235294, 1,
-0.1758236, 0.538413, 1.292689, 0, 1, 0.627451, 1,
-0.1737637, 0.02318619, -1.212391, 0, 1, 0.6352941, 1,
-0.1687398, 0.007308084, -1.353091, 0, 1, 0.6392157, 1,
-0.1681332, -0.6818087, -1.309288, 0, 1, 0.6470588, 1,
-0.1672493, -1.413881, -2.502074, 0, 1, 0.6509804, 1,
-0.1668141, 0.6747093, 0.3713104, 0, 1, 0.6588235, 1,
-0.1605217, 0.1107923, -2.479297, 0, 1, 0.6627451, 1,
-0.1551387, 0.9874345, 0.1568529, 0, 1, 0.6705883, 1,
-0.1543458, 1.501409, 0.9155294, 0, 1, 0.6745098, 1,
-0.1532876, 1.175861, 0.5873157, 0, 1, 0.682353, 1,
-0.1529699, -0.4505728, -1.23349, 0, 1, 0.6862745, 1,
-0.1528448, 1.143237, 2.056905, 0, 1, 0.6941177, 1,
-0.1433098, -0.9960281, -2.676824, 0, 1, 0.7019608, 1,
-0.1426914, -1.143165, -0.4662049, 0, 1, 0.7058824, 1,
-0.1415097, -1.112965, -4.101625, 0, 1, 0.7137255, 1,
-0.1394274, 0.03040279, -1.115587, 0, 1, 0.7176471, 1,
-0.1363667, 0.05017428, 0.3115672, 0, 1, 0.7254902, 1,
-0.1337737, -2.105676, -4.810536, 0, 1, 0.7294118, 1,
-0.131747, 0.05187935, -1.542976, 0, 1, 0.7372549, 1,
-0.1311247, -0.1443387, -2.480915, 0, 1, 0.7411765, 1,
-0.1310901, 2.007935, -0.4418788, 0, 1, 0.7490196, 1,
-0.1304067, -0.1545251, -1.977571, 0, 1, 0.7529412, 1,
-0.1270114, 1.576822, -2.458042, 0, 1, 0.7607843, 1,
-0.126393, 2.154236, 1.532886, 0, 1, 0.7647059, 1,
-0.1253233, 0.9644837, -1.990099, 0, 1, 0.772549, 1,
-0.1252532, 1.30382, -2.210599, 0, 1, 0.7764706, 1,
-0.1245233, 0.2271885, -1.299469, 0, 1, 0.7843137, 1,
-0.1236817, -0.7876635, -3.572441, 0, 1, 0.7882353, 1,
-0.1236441, 1.204504, -0.148883, 0, 1, 0.7960784, 1,
-0.1236374, -1.182447, -1.757354, 0, 1, 0.8039216, 1,
-0.1212991, -1.443758, -2.272667, 0, 1, 0.8078431, 1,
-0.1200521, 1.156806, 1.085938, 0, 1, 0.8156863, 1,
-0.1194624, 1.305804, -1.502651, 0, 1, 0.8196079, 1,
-0.1169532, -0.6649112, -4.6936, 0, 1, 0.827451, 1,
-0.1159882, 0.6192713, -0.3214993, 0, 1, 0.8313726, 1,
-0.1153788, -0.3765059, -1.010923, 0, 1, 0.8392157, 1,
-0.1109263, -1.398114, -1.370666, 0, 1, 0.8431373, 1,
-0.1027232, -0.8220467, -2.089495, 0, 1, 0.8509804, 1,
-0.1013223, 0.8056687, -1.667657, 0, 1, 0.854902, 1,
-0.100805, 2.596534, -0.7474908, 0, 1, 0.8627451, 1,
-0.09886297, -2.83203, -3.172224, 0, 1, 0.8666667, 1,
-0.0962303, 0.3241831, -0.6838542, 0, 1, 0.8745098, 1,
-0.08995783, -1.235784, -2.330547, 0, 1, 0.8784314, 1,
-0.08791086, -1.922348, -1.811898, 0, 1, 0.8862745, 1,
-0.08692995, -1.656712, -3.087314, 0, 1, 0.8901961, 1,
-0.08609267, 0.1816976, -0.05095637, 0, 1, 0.8980392, 1,
-0.08120098, 1.15404, 0.6057236, 0, 1, 0.9058824, 1,
-0.07396246, 0.7625298, 0.3288971, 0, 1, 0.9098039, 1,
-0.07207677, 2.227393, 0.04994872, 0, 1, 0.9176471, 1,
-0.07179675, -0.1901867, -3.08667, 0, 1, 0.9215686, 1,
-0.06876473, 0.04486809, -0.7139513, 0, 1, 0.9294118, 1,
-0.06480628, -0.3179839, -3.296983, 0, 1, 0.9333333, 1,
-0.06253575, -1.214443, -2.638657, 0, 1, 0.9411765, 1,
-0.05726144, -0.1807869, -4.40051, 0, 1, 0.945098, 1,
-0.04872885, 0.1469281, 0.1755344, 0, 1, 0.9529412, 1,
-0.04625539, -0.7563307, -3.362162, 0, 1, 0.9568627, 1,
-0.04399977, -0.5760956, -3.292403, 0, 1, 0.9647059, 1,
-0.04185836, 0.04818185, 0.3184048, 0, 1, 0.9686275, 1,
-0.03701043, 0.9731495, 0.8268387, 0, 1, 0.9764706, 1,
-0.03647376, 1.040886, -0.1655423, 0, 1, 0.9803922, 1,
-0.03564801, -0.9530126, -2.632715, 0, 1, 0.9882353, 1,
-0.0336726, -0.06730086, -1.539347, 0, 1, 0.9921569, 1,
-0.03280983, 0.4288307, -0.6445773, 0, 1, 1, 1,
-0.03202438, -1.497328, -4.130696, 0, 0.9921569, 1, 1,
-0.0317322, -0.8929311, -3.00319, 0, 0.9882353, 1, 1,
-0.03148664, -0.1118906, -2.13044, 0, 0.9803922, 1, 1,
-0.03097115, 0.5608312, -0.1307356, 0, 0.9764706, 1, 1,
-0.02758577, 0.4885718, 1.146224, 0, 0.9686275, 1, 1,
-0.0265664, -0.4399766, -3.749307, 0, 0.9647059, 1, 1,
-0.02578748, 1.258073, 0.494261, 0, 0.9568627, 1, 1,
-0.02454527, -0.2016413, -3.999591, 0, 0.9529412, 1, 1,
-0.0235127, -2.505667, -1.619798, 0, 0.945098, 1, 1,
-0.02101835, -0.9842318, -4.245173, 0, 0.9411765, 1, 1,
-0.02007868, -1.894447, -3.050063, 0, 0.9333333, 1, 1,
-0.01610482, -0.4882213, -2.879547, 0, 0.9294118, 1, 1,
-0.01445324, 0.2724226, 0.6363258, 0, 0.9215686, 1, 1,
-0.01241834, -0.7707315, -2.522829, 0, 0.9176471, 1, 1,
-0.008612025, 0.5464876, 0.04181297, 0, 0.9098039, 1, 1,
-0.007012165, 0.3953714, -2.024295, 0, 0.9058824, 1, 1,
-0.006923229, -0.2633754, -2.989752, 0, 0.8980392, 1, 1,
-0.002919031, -0.244449, -5.496345, 0, 0.8901961, 1, 1,
-0.002189724, 0.5173688, 0.5600045, 0, 0.8862745, 1, 1,
0.0006853072, -0.4440061, 5.382257, 0, 0.8784314, 1, 1,
0.0009891266, -0.2183096, 3.420656, 0, 0.8745098, 1, 1,
0.001468077, -1.065668, 3.881937, 0, 0.8666667, 1, 1,
0.002579469, 0.7182255, -1.364381, 0, 0.8627451, 1, 1,
0.005830481, 0.2463813, 0.01000738, 0, 0.854902, 1, 1,
0.01300678, -0.7554562, 4.931499, 0, 0.8509804, 1, 1,
0.01471111, -0.3935886, 3.696902, 0, 0.8431373, 1, 1,
0.01551874, -0.9480549, 2.91479, 0, 0.8392157, 1, 1,
0.01555017, 0.4437358, -0.2756427, 0, 0.8313726, 1, 1,
0.01557077, 1.392177, 1.259719, 0, 0.827451, 1, 1,
0.01705807, 1.817235, 0.3013891, 0, 0.8196079, 1, 1,
0.01755325, 2.790396, 0.2738968, 0, 0.8156863, 1, 1,
0.01909166, 0.7913589, 0.5762279, 0, 0.8078431, 1, 1,
0.02524929, 0.514695, -1.648188, 0, 0.8039216, 1, 1,
0.02881226, -0.1215161, 3.53532, 0, 0.7960784, 1, 1,
0.02971123, -0.6539251, 2.873497, 0, 0.7882353, 1, 1,
0.03218658, 1.861069, 0.9607258, 0, 0.7843137, 1, 1,
0.03567466, 2.21154, -3.257115, 0, 0.7764706, 1, 1,
0.03601974, -1.245014, 3.878472, 0, 0.772549, 1, 1,
0.04111966, 0.9938096, 0.4042627, 0, 0.7647059, 1, 1,
0.04432949, 1.895612, 0.1654813, 0, 0.7607843, 1, 1,
0.04694377, 1.510635, 0.8122802, 0, 0.7529412, 1, 1,
0.04929235, -0.8286988, 2.794098, 0, 0.7490196, 1, 1,
0.05607036, 1.660612, 1.579627, 0, 0.7411765, 1, 1,
0.05946631, -1.086876, 2.894072, 0, 0.7372549, 1, 1,
0.06323827, -0.6647398, 3.793995, 0, 0.7294118, 1, 1,
0.06836983, 0.2766625, 2.021457, 0, 0.7254902, 1, 1,
0.07607479, -0.8529429, 2.677157, 0, 0.7176471, 1, 1,
0.07811695, -0.0002398089, 0.7056732, 0, 0.7137255, 1, 1,
0.07834463, -1.167587, 4.491761, 0, 0.7058824, 1, 1,
0.08431479, 0.05969169, -0.21345, 0, 0.6980392, 1, 1,
0.08501903, 0.9473737, -1.446397, 0, 0.6941177, 1, 1,
0.08864573, 0.874813, -0.6557153, 0, 0.6862745, 1, 1,
0.08988915, -0.4057642, 2.506572, 0, 0.682353, 1, 1,
0.09112503, 0.8338093, -1.133662, 0, 0.6745098, 1, 1,
0.09550331, -0.2633254, 2.750071, 0, 0.6705883, 1, 1,
0.09699022, 0.5478778, 0.2418215, 0, 0.6627451, 1, 1,
0.1104722, 0.4791496, -0.3360706, 0, 0.6588235, 1, 1,
0.1123621, -0.4647145, 3.710024, 0, 0.6509804, 1, 1,
0.1160562, -0.6048495, 2.759779, 0, 0.6470588, 1, 1,
0.11626, -0.1575117, 2.071816, 0, 0.6392157, 1, 1,
0.1179256, -1.880703, 3.349302, 0, 0.6352941, 1, 1,
0.1231576, 0.2948343, -0.5303994, 0, 0.627451, 1, 1,
0.1241398, 0.7178822, 0.5535457, 0, 0.6235294, 1, 1,
0.1259731, 0.5826257, -0.8239795, 0, 0.6156863, 1, 1,
0.1281042, -1.555043, 3.537873, 0, 0.6117647, 1, 1,
0.1293783, 0.7355054, 0.9200959, 0, 0.6039216, 1, 1,
0.1333109, -0.336712, 4.570234, 0, 0.5960785, 1, 1,
0.1342672, -0.6499717, 3.818302, 0, 0.5921569, 1, 1,
0.1358988, -0.1397656, 2.201391, 0, 0.5843138, 1, 1,
0.1372534, 2.229296, 0.7742234, 0, 0.5803922, 1, 1,
0.1381408, -0.4412295, 2.851505, 0, 0.572549, 1, 1,
0.1381498, -0.6268811, 1.940897, 0, 0.5686275, 1, 1,
0.1387552, -0.4910701, 3.135599, 0, 0.5607843, 1, 1,
0.1400697, 1.770639, -0.3251302, 0, 0.5568628, 1, 1,
0.1478408, -0.2545735, 1.868065, 0, 0.5490196, 1, 1,
0.1489728, 1.038169, -1.150322, 0, 0.5450981, 1, 1,
0.1510297, -2.527011, 3.642322, 0, 0.5372549, 1, 1,
0.152426, -0.2602024, 2.743556, 0, 0.5333334, 1, 1,
0.1539177, -1.108847, 3.32761, 0, 0.5254902, 1, 1,
0.1540781, -2.408845, 4.08463, 0, 0.5215687, 1, 1,
0.1543849, -0.36593, 1.697243, 0, 0.5137255, 1, 1,
0.1577543, 0.07857195, 1.252634, 0, 0.509804, 1, 1,
0.1585995, 0.1748652, 1.895526, 0, 0.5019608, 1, 1,
0.1629265, 0.1915693, 1.293493, 0, 0.4941176, 1, 1,
0.1640074, -1.789263, 3.505655, 0, 0.4901961, 1, 1,
0.1693002, -2.865257, 3.210691, 0, 0.4823529, 1, 1,
0.1722749, 0.6709148, 1.282868, 0, 0.4784314, 1, 1,
0.1734789, 1.448362, -0.07865506, 0, 0.4705882, 1, 1,
0.174019, 1.014658, -0.1668959, 0, 0.4666667, 1, 1,
0.1766723, 1.411078, -0.07027011, 0, 0.4588235, 1, 1,
0.1788347, -0.09100913, 2.193933, 0, 0.454902, 1, 1,
0.182055, -1.709941, 2.972917, 0, 0.4470588, 1, 1,
0.1829772, 0.2355012, 1.100358, 0, 0.4431373, 1, 1,
0.1861393, 0.103429, 0.4505838, 0, 0.4352941, 1, 1,
0.1888879, -0.730624, 4.243809, 0, 0.4313726, 1, 1,
0.1903135, -0.5206195, 2.912748, 0, 0.4235294, 1, 1,
0.1940043, 1.014556, -0.08187462, 0, 0.4196078, 1, 1,
0.1965051, -2.272582, 4.235933, 0, 0.4117647, 1, 1,
0.1970969, 0.02544514, 1.529308, 0, 0.4078431, 1, 1,
0.2040897, 0.9132826, -1.003153, 0, 0.4, 1, 1,
0.2142013, 0.07980745, 1.717382, 0, 0.3921569, 1, 1,
0.2156316, -0.3869619, 3.391268, 0, 0.3882353, 1, 1,
0.2228868, 0.7467273, -1.229514, 0, 0.3803922, 1, 1,
0.2231161, 0.7764546, -0.9151207, 0, 0.3764706, 1, 1,
0.2267872, -0.3207878, 4.02194, 0, 0.3686275, 1, 1,
0.2272724, 1.417043, 0.6953849, 0, 0.3647059, 1, 1,
0.2321123, -1.604632, 2.024982, 0, 0.3568628, 1, 1,
0.2344145, 0.648459, 0.06525244, 0, 0.3529412, 1, 1,
0.2387937, 1.57706, -0.5485744, 0, 0.345098, 1, 1,
0.2427, -0.08722571, 2.156357, 0, 0.3411765, 1, 1,
0.243997, 0.04071938, 2.402071, 0, 0.3333333, 1, 1,
0.2568307, 1.357948, -0.2635861, 0, 0.3294118, 1, 1,
0.2569838, 1.455452, -0.05830685, 0, 0.3215686, 1, 1,
0.2600487, -2.609714, 2.520293, 0, 0.3176471, 1, 1,
0.2624077, -0.5796565, 2.915668, 0, 0.3098039, 1, 1,
0.2631677, 0.2525737, 0.3009081, 0, 0.3058824, 1, 1,
0.2653475, -0.3231543, 4.025327, 0, 0.2980392, 1, 1,
0.2721738, 1.734147, -0.7690141, 0, 0.2901961, 1, 1,
0.2726623, 1.837136, 1.828291, 0, 0.2862745, 1, 1,
0.2737868, 0.7323064, -0.5086564, 0, 0.2784314, 1, 1,
0.2794121, 0.09854934, 0.521538, 0, 0.2745098, 1, 1,
0.2862879, 1.495764, 1.314633, 0, 0.2666667, 1, 1,
0.2895831, -0.1143597, 2.461155, 0, 0.2627451, 1, 1,
0.289953, 1.809065, 0.07049601, 0, 0.254902, 1, 1,
0.2962937, 1.384692, 0.02007665, 0, 0.2509804, 1, 1,
0.3020144, 0.5362487, -1.211184, 0, 0.2431373, 1, 1,
0.3068162, 0.6443585, 1.240554, 0, 0.2392157, 1, 1,
0.3107781, -2.067474, 2.302519, 0, 0.2313726, 1, 1,
0.3160228, -0.3381853, 0.6739796, 0, 0.227451, 1, 1,
0.3180935, 0.9746985, -1.446234, 0, 0.2196078, 1, 1,
0.3329388, -1.2834, 3.792088, 0, 0.2156863, 1, 1,
0.3331972, 1.480942, -0.8011658, 0, 0.2078431, 1, 1,
0.3348577, 0.7760392, 1.971511, 0, 0.2039216, 1, 1,
0.3361116, -0.1915867, 1.500706, 0, 0.1960784, 1, 1,
0.3415236, 0.2470322, 1.128832, 0, 0.1882353, 1, 1,
0.3457464, -1.307909, 3.01509, 0, 0.1843137, 1, 1,
0.3478292, 0.24934, 2.408513, 0, 0.1764706, 1, 1,
0.3482107, 0.0913052, 1.473287, 0, 0.172549, 1, 1,
0.3498461, -1.65065, 3.99509, 0, 0.1647059, 1, 1,
0.3527708, -0.3897409, 3.004474, 0, 0.1607843, 1, 1,
0.3532406, -0.4137461, -0.4466937, 0, 0.1529412, 1, 1,
0.354827, 0.9197695, 0.7926176, 0, 0.1490196, 1, 1,
0.3565724, -0.3310945, 3.76821, 0, 0.1411765, 1, 1,
0.3638831, 0.5650656, 0.7659578, 0, 0.1372549, 1, 1,
0.3649701, 0.6554327, 1.610805, 0, 0.1294118, 1, 1,
0.3704526, -0.3764355, 2.601097, 0, 0.1254902, 1, 1,
0.3711615, -0.4637107, 2.187093, 0, 0.1176471, 1, 1,
0.3715305, -0.6677487, 3.247863, 0, 0.1137255, 1, 1,
0.3945908, -0.5625997, 1.512463, 0, 0.1058824, 1, 1,
0.4002501, -0.325829, 1.159258, 0, 0.09803922, 1, 1,
0.4004708, 0.3429906, 0.73072, 0, 0.09411765, 1, 1,
0.4038406, -1.037412, 3.262096, 0, 0.08627451, 1, 1,
0.4041349, 1.15539, 0.9327194, 0, 0.08235294, 1, 1,
0.4045331, -0.4985081, 1.262777, 0, 0.07450981, 1, 1,
0.4082721, -0.3507073, 3.330688, 0, 0.07058824, 1, 1,
0.4145659, -1.05772, 4.141038, 0, 0.0627451, 1, 1,
0.4151667, 0.925393, 2.367632, 0, 0.05882353, 1, 1,
0.4185716, 1.545205, 0.4500068, 0, 0.05098039, 1, 1,
0.421291, 1.643377, 0.4259992, 0, 0.04705882, 1, 1,
0.4257896, -0.2390292, 2.133062, 0, 0.03921569, 1, 1,
0.4448726, -0.1251524, 2.305998, 0, 0.03529412, 1, 1,
0.4460118, 0.8794373, 0.04765986, 0, 0.02745098, 1, 1,
0.4484581, -0.5364766, 2.166271, 0, 0.02352941, 1, 1,
0.4485402, -0.4915004, 1.796526, 0, 0.01568628, 1, 1,
0.4512382, -1.861579, 1.573383, 0, 0.01176471, 1, 1,
0.4525153, 0.08860398, 3.609704, 0, 0.003921569, 1, 1,
0.4546738, 0.0647034, 1.180462, 0.003921569, 0, 1, 1,
0.4581165, 0.03917852, 2.057121, 0.007843138, 0, 1, 1,
0.4588981, 1.693648, 0.3550809, 0.01568628, 0, 1, 1,
0.459912, 0.6864483, 2.335231, 0.01960784, 0, 1, 1,
0.4612269, 0.6667256, 1.819276, 0.02745098, 0, 1, 1,
0.4615988, -0.2627009, 1.648351, 0.03137255, 0, 1, 1,
0.4617338, -0.08817422, -0.1185433, 0.03921569, 0, 1, 1,
0.4617649, -1.437169, 2.696751, 0.04313726, 0, 1, 1,
0.4664555, -0.3918566, 0.3582273, 0.05098039, 0, 1, 1,
0.4687618, -1.121877, 0.6779468, 0.05490196, 0, 1, 1,
0.472654, 0.5343821, 1.164166, 0.0627451, 0, 1, 1,
0.4750253, -0.02048922, 0.5720691, 0.06666667, 0, 1, 1,
0.4819707, -1.337622, 1.540593, 0.07450981, 0, 1, 1,
0.4852342, 1.692477, -0.4708803, 0.07843138, 0, 1, 1,
0.4853957, -0.5941225, 1.248482, 0.08627451, 0, 1, 1,
0.4870698, 0.1002713, 1.057623, 0.09019608, 0, 1, 1,
0.4871541, -1.812907, 3.139894, 0.09803922, 0, 1, 1,
0.488197, -0.5093173, 2.907626, 0.1058824, 0, 1, 1,
0.4944742, -0.948961, 1.081717, 0.1098039, 0, 1, 1,
0.496426, -1.333591, 1.996739, 0.1176471, 0, 1, 1,
0.497373, -0.1955925, 3.27646, 0.1215686, 0, 1, 1,
0.5002855, 0.5228034, 0.4617999, 0.1294118, 0, 1, 1,
0.5075046, 0.164297, 1.403702, 0.1333333, 0, 1, 1,
0.5106267, -0.5155237, 3.018534, 0.1411765, 0, 1, 1,
0.5145113, -0.9166326, 2.421372, 0.145098, 0, 1, 1,
0.5212227, 0.5295516, 1.325344, 0.1529412, 0, 1, 1,
0.5217472, 1.000465, 1.981095, 0.1568628, 0, 1, 1,
0.5239727, -0.6040024, 2.015179, 0.1647059, 0, 1, 1,
0.5252931, 3.149514, -2.670887, 0.1686275, 0, 1, 1,
0.527338, 0.8568625, -0.9955051, 0.1764706, 0, 1, 1,
0.5288352, -0.1962115, 2.953109, 0.1803922, 0, 1, 1,
0.5333875, 0.3774115, -0.2366492, 0.1882353, 0, 1, 1,
0.5344285, -0.741573, 1.557604, 0.1921569, 0, 1, 1,
0.5404032, 0.0806214, 1.342363, 0.2, 0, 1, 1,
0.540813, -0.2464505, 3.511965, 0.2078431, 0, 1, 1,
0.5445362, -0.4636004, 2.888034, 0.2117647, 0, 1, 1,
0.5502415, 0.5888847, 1.060453, 0.2196078, 0, 1, 1,
0.5506592, 0.3267768, 1.885798, 0.2235294, 0, 1, 1,
0.5555227, 1.604285, 1.355984, 0.2313726, 0, 1, 1,
0.5558619, 0.2741597, 2.530678, 0.2352941, 0, 1, 1,
0.5561523, -0.8420563, 1.198957, 0.2431373, 0, 1, 1,
0.558083, 0.3653225, 0.9567494, 0.2470588, 0, 1, 1,
0.5631393, 1.035651, -0.5165284, 0.254902, 0, 1, 1,
0.5701194, 0.973039, 1.28189, 0.2588235, 0, 1, 1,
0.5790455, 1.707911, -0.9691384, 0.2666667, 0, 1, 1,
0.5804456, -0.001360235, 4.098768, 0.2705882, 0, 1, 1,
0.5873255, -0.4879071, 2.024115, 0.2784314, 0, 1, 1,
0.5971483, 0.4446965, 2.199948, 0.282353, 0, 1, 1,
0.597928, -0.3083008, 0.7982116, 0.2901961, 0, 1, 1,
0.5979947, -0.7119382, 1.014569, 0.2941177, 0, 1, 1,
0.5989228, -0.2146212, 0.6978835, 0.3019608, 0, 1, 1,
0.599218, 1.34852, -0.5664805, 0.3098039, 0, 1, 1,
0.6118728, 0.865544, 0.1627182, 0.3137255, 0, 1, 1,
0.6159215, -0.0698102, 2.112628, 0.3215686, 0, 1, 1,
0.6215754, -1.390026, 1.368333, 0.3254902, 0, 1, 1,
0.6241139, -0.1757273, 2.563959, 0.3333333, 0, 1, 1,
0.6242152, 0.1098103, 0.4201228, 0.3372549, 0, 1, 1,
0.6242495, -1.705047, 2.140722, 0.345098, 0, 1, 1,
0.6273641, 1.863715, -0.5014896, 0.3490196, 0, 1, 1,
0.6285334, -0.1336224, 1.94827, 0.3568628, 0, 1, 1,
0.6317195, 1.090079, 0.9502965, 0.3607843, 0, 1, 1,
0.635053, 2.416968, 0.3883331, 0.3686275, 0, 1, 1,
0.6494991, -0.1902349, 1.899737, 0.372549, 0, 1, 1,
0.6562265, -0.1542482, 1.296572, 0.3803922, 0, 1, 1,
0.6669996, -0.8553783, 2.835668, 0.3843137, 0, 1, 1,
0.6734834, 0.5872366, 0.05362883, 0.3921569, 0, 1, 1,
0.6741323, -0.01549847, -0.5847077, 0.3960784, 0, 1, 1,
0.6763045, -0.7474212, 2.048367, 0.4039216, 0, 1, 1,
0.6763786, 0.5775021, 0.2626364, 0.4117647, 0, 1, 1,
0.6767322, -1.249571, 1.924438, 0.4156863, 0, 1, 1,
0.6781554, 1.086119, 0.3399944, 0.4235294, 0, 1, 1,
0.6801248, 1.246029, 1.507285, 0.427451, 0, 1, 1,
0.6819247, -1.248893, 4.27509, 0.4352941, 0, 1, 1,
0.691848, -1.130769, 4.270081, 0.4392157, 0, 1, 1,
0.6938323, 1.028838, 2.09191, 0.4470588, 0, 1, 1,
0.7032484, 0.3539986, 1.739542, 0.4509804, 0, 1, 1,
0.7051352, -0.3930615, 3.559254, 0.4588235, 0, 1, 1,
0.707083, -0.2886032, 2.041468, 0.4627451, 0, 1, 1,
0.7071778, -0.7306599, 1.462093, 0.4705882, 0, 1, 1,
0.7086245, 0.139922, 3.417555, 0.4745098, 0, 1, 1,
0.714065, 1.296612, 0.8858457, 0.4823529, 0, 1, 1,
0.7150922, -1.089618, 2.224781, 0.4862745, 0, 1, 1,
0.7193295, 0.5125861, -1.130781, 0.4941176, 0, 1, 1,
0.7216121, 0.3677046, 1.646322, 0.5019608, 0, 1, 1,
0.7226815, -0.2416602, 2.758431, 0.5058824, 0, 1, 1,
0.7305295, -1.016217, 1.802154, 0.5137255, 0, 1, 1,
0.7399501, -1.909863, 3.298127, 0.5176471, 0, 1, 1,
0.7408373, -0.1241791, 1.415466, 0.5254902, 0, 1, 1,
0.743586, -0.5876755, 3.530102, 0.5294118, 0, 1, 1,
0.7464319, -0.2151884, 2.677049, 0.5372549, 0, 1, 1,
0.7488182, 0.8198425, 0.6705835, 0.5411765, 0, 1, 1,
0.7520739, -2.014515, 1.195471, 0.5490196, 0, 1, 1,
0.7542573, -0.3300974, 1.102752, 0.5529412, 0, 1, 1,
0.7547354, -0.05238486, 0.7239442, 0.5607843, 0, 1, 1,
0.7554426, 1.739436, 0.680679, 0.5647059, 0, 1, 1,
0.7562421, 1.661665, 1.863236, 0.572549, 0, 1, 1,
0.7593167, -0.2532987, 1.986754, 0.5764706, 0, 1, 1,
0.7686157, 0.7950448, 1.034953, 0.5843138, 0, 1, 1,
0.7701716, 1.119679, 2.38369, 0.5882353, 0, 1, 1,
0.7752571, 2.478977, -1.135797, 0.5960785, 0, 1, 1,
0.7906542, -0.4274165, 2.030806, 0.6039216, 0, 1, 1,
0.7908102, 0.5138199, 1.74377, 0.6078432, 0, 1, 1,
0.794921, 0.06309778, 1.125579, 0.6156863, 0, 1, 1,
0.7963299, -2.704725, 3.646112, 0.6196079, 0, 1, 1,
0.7979286, 0.3248737, 2.798304, 0.627451, 0, 1, 1,
0.8009104, 0.8848088, 1.416865, 0.6313726, 0, 1, 1,
0.8024184, -0.8786408, 2.017282, 0.6392157, 0, 1, 1,
0.8053139, 2.102153, -0.1059288, 0.6431373, 0, 1, 1,
0.8056986, 0.2832471, -0.05753268, 0.6509804, 0, 1, 1,
0.8092565, 0.5684392, 1.784382, 0.654902, 0, 1, 1,
0.8133938, 1.186491, 0.3096898, 0.6627451, 0, 1, 1,
0.8140423, 1.220061, 1.86753, 0.6666667, 0, 1, 1,
0.8251659, 0.1646677, 1.673105, 0.6745098, 0, 1, 1,
0.8277612, -0.9920956, 2.036851, 0.6784314, 0, 1, 1,
0.8284565, 0.3812962, 0.8635967, 0.6862745, 0, 1, 1,
0.8290753, -0.4314115, 0.5375768, 0.6901961, 0, 1, 1,
0.8314694, 0.2096366, 0.7198139, 0.6980392, 0, 1, 1,
0.8379943, 0.4436379, 1.363182, 0.7058824, 0, 1, 1,
0.8391281, -0.1763616, 3.221931, 0.7098039, 0, 1, 1,
0.8439086, -1.992213, 1.896005, 0.7176471, 0, 1, 1,
0.8447655, -0.4698334, 3.022671, 0.7215686, 0, 1, 1,
0.8451414, -0.5454617, 1.335765, 0.7294118, 0, 1, 1,
0.8622354, 1.17705, 2.456923, 0.7333333, 0, 1, 1,
0.8684189, -0.2557506, 2.00291, 0.7411765, 0, 1, 1,
0.8705359, 0.05623067, 2.70333, 0.7450981, 0, 1, 1,
0.8766463, -0.6930284, 1.457666, 0.7529412, 0, 1, 1,
0.8782036, -0.1270419, 1.045299, 0.7568628, 0, 1, 1,
0.8804359, -0.6610515, 1.098448, 0.7647059, 0, 1, 1,
0.8833041, -0.09360566, 0.3959813, 0.7686275, 0, 1, 1,
0.8847866, -0.0901045, 2.043751, 0.7764706, 0, 1, 1,
0.8958454, 0.5734488, 2.221435, 0.7803922, 0, 1, 1,
0.9043473, -2.23715, 5.160439, 0.7882353, 0, 1, 1,
0.9103885, 0.1346652, 1.252082, 0.7921569, 0, 1, 1,
0.9139215, -0.005981384, 1.325684, 0.8, 0, 1, 1,
0.9156638, -0.8174603, 1.834581, 0.8078431, 0, 1, 1,
0.9244348, 0.1448435, -0.933863, 0.8117647, 0, 1, 1,
0.9265828, 0.6176588, -1.760191, 0.8196079, 0, 1, 1,
0.9311038, 0.1378344, 1.460883, 0.8235294, 0, 1, 1,
0.9328396, -2.157365, 2.308067, 0.8313726, 0, 1, 1,
0.9336717, -0.8239212, 2.23468, 0.8352941, 0, 1, 1,
0.9343933, -0.7840515, 2.088016, 0.8431373, 0, 1, 1,
0.9448586, 2.576396, 0.6788375, 0.8470588, 0, 1, 1,
0.9460515, 1.066916, 1.825641, 0.854902, 0, 1, 1,
0.9461209, -1.199682, 2.171639, 0.8588235, 0, 1, 1,
0.9496737, 1.757262, 0.9235049, 0.8666667, 0, 1, 1,
0.9507079, -0.6508627, 2.481295, 0.8705882, 0, 1, 1,
0.963922, 0.5608144, 1.510073, 0.8784314, 0, 1, 1,
0.9649985, -0.9910731, 4.318582, 0.8823529, 0, 1, 1,
0.9664332, 0.3839788, -0.4619616, 0.8901961, 0, 1, 1,
0.9671009, 0.8512992, 0.9280769, 0.8941177, 0, 1, 1,
0.9685124, -0.3227434, 3.075998, 0.9019608, 0, 1, 1,
0.9687901, 0.01907961, 1.761677, 0.9098039, 0, 1, 1,
0.9690133, 0.2528235, 1.052758, 0.9137255, 0, 1, 1,
0.9700463, 0.9371821, -0.2427956, 0.9215686, 0, 1, 1,
0.9734793, 0.751536, -1.089747, 0.9254902, 0, 1, 1,
0.9833457, 0.2816148, 1.999307, 0.9333333, 0, 1, 1,
0.9843603, -1.06754, 3.253783, 0.9372549, 0, 1, 1,
0.993499, 0.107613, 2.515102, 0.945098, 0, 1, 1,
0.9940636, -0.918955, 3.602654, 0.9490196, 0, 1, 1,
0.9962478, 0.02361479, 1.191573, 0.9568627, 0, 1, 1,
0.9983492, -0.1329517, 1.844743, 0.9607843, 0, 1, 1,
1.005421, -1.391902, 2.292793, 0.9686275, 0, 1, 1,
1.007579, 0.2591631, 2.095731, 0.972549, 0, 1, 1,
1.018768, 0.8653941, 0.6942189, 0.9803922, 0, 1, 1,
1.018872, 0.3645987, 2.602732, 0.9843137, 0, 1, 1,
1.022546, -0.01215202, 1.488068, 0.9921569, 0, 1, 1,
1.026155, 0.2181661, 1.85141, 0.9960784, 0, 1, 1,
1.029825, 1.212649, 0.8725331, 1, 0, 0.9960784, 1,
1.033911, 0.3133848, 0.5027757, 1, 0, 0.9882353, 1,
1.037912, 0.03735971, 1.802148, 1, 0, 0.9843137, 1,
1.038139, -1.269356, 2.884096, 1, 0, 0.9764706, 1,
1.043367, -0.08659341, 3.241846, 1, 0, 0.972549, 1,
1.057673, 0.5020111, 1.546144, 1, 0, 0.9647059, 1,
1.057699, 0.2715143, -0.4584512, 1, 0, 0.9607843, 1,
1.059159, -0.567762, 1.393916, 1, 0, 0.9529412, 1,
1.059861, -0.8835437, 0.5167973, 1, 0, 0.9490196, 1,
1.061814, 0.9879685, 0.05395424, 1, 0, 0.9411765, 1,
1.062108, 0.9083825, -0.2469427, 1, 0, 0.9372549, 1,
1.065694, -0.2353617, 1.327657, 1, 0, 0.9294118, 1,
1.070333, 1.55786, -0.3791963, 1, 0, 0.9254902, 1,
1.07443, 1.206994, 0.9115165, 1, 0, 0.9176471, 1,
1.085859, 1.193562, 1.267271, 1, 0, 0.9137255, 1,
1.087224, 0.8006098, 0.4683243, 1, 0, 0.9058824, 1,
1.092254, 0.2011117, 2.302062, 1, 0, 0.9019608, 1,
1.092387, 1.255033, 0.7384092, 1, 0, 0.8941177, 1,
1.101235, 1.098982, -1.038945, 1, 0, 0.8862745, 1,
1.102145, -0.4195101, 1.868142, 1, 0, 0.8823529, 1,
1.10351, -0.1109961, 1.394631, 1, 0, 0.8745098, 1,
1.106146, -2.333371, 3.980678, 1, 0, 0.8705882, 1,
1.1158, 0.2026031, 0.7532114, 1, 0, 0.8627451, 1,
1.116978, -1.902854, 4.512032, 1, 0, 0.8588235, 1,
1.117274, -1.396433, 2.511024, 1, 0, 0.8509804, 1,
1.118228, 0.04218077, 2.245486, 1, 0, 0.8470588, 1,
1.120366, -0.209662, 1.352404, 1, 0, 0.8392157, 1,
1.125517, -1.567326, 3.453974, 1, 0, 0.8352941, 1,
1.140436, 2.054826, 1.242745, 1, 0, 0.827451, 1,
1.141756, -0.1647273, 1.351627, 1, 0, 0.8235294, 1,
1.146461, -1.209231, 1.55011, 1, 0, 0.8156863, 1,
1.149572, 0.6541988, 0.7909916, 1, 0, 0.8117647, 1,
1.155109, -0.7012331, 3.735269, 1, 0, 0.8039216, 1,
1.156152, -0.2585736, -0.1068905, 1, 0, 0.7960784, 1,
1.158169, -0.3605506, 1.785962, 1, 0, 0.7921569, 1,
1.164936, -0.4649312, 2.777428, 1, 0, 0.7843137, 1,
1.167225, -0.1505849, 1.775571, 1, 0, 0.7803922, 1,
1.16894, -0.7764434, 3.136043, 1, 0, 0.772549, 1,
1.17531, 0.8448663, 1.62396, 1, 0, 0.7686275, 1,
1.190169, 0.2873336, 1.749454, 1, 0, 0.7607843, 1,
1.194301, -1.731514, 3.177079, 1, 0, 0.7568628, 1,
1.200304, -0.3235753, 1.412556, 1, 0, 0.7490196, 1,
1.202524, 0.5107601, 0.5786055, 1, 0, 0.7450981, 1,
1.207608, -1.20278, 2.4896, 1, 0, 0.7372549, 1,
1.219633, 0.5490316, -0.1515369, 1, 0, 0.7333333, 1,
1.224596, -0.7009995, 2.025995, 1, 0, 0.7254902, 1,
1.22847, 1.279932, -0.575489, 1, 0, 0.7215686, 1,
1.236757, 1.326934, 1.492916, 1, 0, 0.7137255, 1,
1.238557, 0.8341674, -0.2880767, 1, 0, 0.7098039, 1,
1.246499, 0.3070993, 3.353812, 1, 0, 0.7019608, 1,
1.249332, -0.3897215, 1.38654, 1, 0, 0.6941177, 1,
1.262973, 0.2255006, 1.709151, 1, 0, 0.6901961, 1,
1.271504, 0.9133465, -0.2011923, 1, 0, 0.682353, 1,
1.286923, -0.1860314, 0.7729448, 1, 0, 0.6784314, 1,
1.298798, 0.2057053, 1.277636, 1, 0, 0.6705883, 1,
1.302846, 2.781915, 0.7143633, 1, 0, 0.6666667, 1,
1.307222, 0.1591191, 2.68991, 1, 0, 0.6588235, 1,
1.311582, -0.8850851, 0.08480836, 1, 0, 0.654902, 1,
1.320439, -0.07085551, 1.209132, 1, 0, 0.6470588, 1,
1.320881, 1.378514, 0.8023166, 1, 0, 0.6431373, 1,
1.322121, 0.2091141, -0.1456499, 1, 0, 0.6352941, 1,
1.331067, -0.5534384, 1.301589, 1, 0, 0.6313726, 1,
1.338433, -1.641297, 3.289301, 1, 0, 0.6235294, 1,
1.343105, 0.9251896, 1.567105, 1, 0, 0.6196079, 1,
1.343649, -0.5656164, 0.9780085, 1, 0, 0.6117647, 1,
1.344182, 0.221195, 0.8312789, 1, 0, 0.6078432, 1,
1.344522, -0.03462653, -0.1092981, 1, 0, 0.6, 1,
1.358044, 1.209194, 1.700686, 1, 0, 0.5921569, 1,
1.366472, 0.9223118, 0.5963745, 1, 0, 0.5882353, 1,
1.386295, -0.8683441, 0.4595881, 1, 0, 0.5803922, 1,
1.386978, -1.254889, 3.961602, 1, 0, 0.5764706, 1,
1.389776, -1.931747, 3.697204, 1, 0, 0.5686275, 1,
1.391298, 1.090996, 0.7984718, 1, 0, 0.5647059, 1,
1.402427, -0.005519387, 0.6128166, 1, 0, 0.5568628, 1,
1.412688, -0.1208585, 2.978752, 1, 0, 0.5529412, 1,
1.416374, 0.5325803, 0.5331532, 1, 0, 0.5450981, 1,
1.425254, -2.14902, 3.162709, 1, 0, 0.5411765, 1,
1.427949, 0.1789287, 2.374649, 1, 0, 0.5333334, 1,
1.432925, 0.9783404, 1.011869, 1, 0, 0.5294118, 1,
1.444063, 0.5684423, 0.380031, 1, 0, 0.5215687, 1,
1.447905, 0.9647855, 1.621692, 1, 0, 0.5176471, 1,
1.452516, 0.4080719, 1.379812, 1, 0, 0.509804, 1,
1.464888, 0.9828938, 2.609072, 1, 0, 0.5058824, 1,
1.465114, -0.01729134, 1.080944, 1, 0, 0.4980392, 1,
1.470346, -0.9346078, 3.1276, 1, 0, 0.4901961, 1,
1.488218, 1.9609, -0.5814397, 1, 0, 0.4862745, 1,
1.488639, -0.3071734, 1.278452, 1, 0, 0.4784314, 1,
1.499917, 0.3160017, 0.9182769, 1, 0, 0.4745098, 1,
1.501963, -0.3944909, 2.097318, 1, 0, 0.4666667, 1,
1.511825, 0.7489215, -0.05834221, 1, 0, 0.4627451, 1,
1.515146, 1.208412, 1.868217, 1, 0, 0.454902, 1,
1.51833, -0.6486719, 2.834515, 1, 0, 0.4509804, 1,
1.523563, -0.5687389, 1.67915, 1, 0, 0.4431373, 1,
1.530262, -0.6419889, 0.981304, 1, 0, 0.4392157, 1,
1.53754, 2.15119, 0.7005392, 1, 0, 0.4313726, 1,
1.539595, 1.231149, 0.4060566, 1, 0, 0.427451, 1,
1.544695, -0.7121311, 2.042541, 1, 0, 0.4196078, 1,
1.549413, -0.1081399, 3.285377, 1, 0, 0.4156863, 1,
1.550632, 1.40826, 0.9488492, 1, 0, 0.4078431, 1,
1.559194, -1.482698, 3.417127, 1, 0, 0.4039216, 1,
1.569539, -0.8750395, 2.178119, 1, 0, 0.3960784, 1,
1.575398, 0.3182473, 1.207224, 1, 0, 0.3882353, 1,
1.595755, 1.138948, 0.8388683, 1, 0, 0.3843137, 1,
1.601414, 0.208986, 1.224834, 1, 0, 0.3764706, 1,
1.608821, -2.728294, 3.222994, 1, 0, 0.372549, 1,
1.627696, 0.7265273, 0.16023, 1, 0, 0.3647059, 1,
1.629877, 1.274095, 0.5626039, 1, 0, 0.3607843, 1,
1.631111, -0.5340061, 1.438318, 1, 0, 0.3529412, 1,
1.648318, -1.802939, 3.981071, 1, 0, 0.3490196, 1,
1.65129, -0.9069134, 3.897485, 1, 0, 0.3411765, 1,
1.651851, 0.6317093, 1.780538, 1, 0, 0.3372549, 1,
1.657884, 1.971166, 1.633894, 1, 0, 0.3294118, 1,
1.660747, -0.3147146, 1.981244, 1, 0, 0.3254902, 1,
1.666366, 0.8361959, 0.5558209, 1, 0, 0.3176471, 1,
1.692906, -0.737736, 2.711866, 1, 0, 0.3137255, 1,
1.720089, 0.7177548, 2.403741, 1, 0, 0.3058824, 1,
1.727247, -1.170583, 2.671016, 1, 0, 0.2980392, 1,
1.728877, -0.0114612, 1.016566, 1, 0, 0.2941177, 1,
1.736227, -0.003786816, 2.182765, 1, 0, 0.2862745, 1,
1.742376, -2.565003, 1.518377, 1, 0, 0.282353, 1,
1.75613, 0.1054221, -0.03273296, 1, 0, 0.2745098, 1,
1.762246, -0.6761605, 1.481801, 1, 0, 0.2705882, 1,
1.768782, -1.146223, 2.343035, 1, 0, 0.2627451, 1,
1.770814, 0.2930331, 1.078448, 1, 0, 0.2588235, 1,
1.774075, -0.4278528, 0.3868788, 1, 0, 0.2509804, 1,
1.795868, 0.08825544, -0.5485315, 1, 0, 0.2470588, 1,
1.838953, -1.324437, 1.357616, 1, 0, 0.2392157, 1,
1.839621, -0.6609915, 2.235931, 1, 0, 0.2352941, 1,
1.841869, -1.373285, 0.04559951, 1, 0, 0.227451, 1,
1.85473, 0.007659961, -0.0849871, 1, 0, 0.2235294, 1,
1.864858, 1.919095, -0.6536323, 1, 0, 0.2156863, 1,
1.870409, 0.443186, 1.747765, 1, 0, 0.2117647, 1,
1.88694, -1.22048, 1.226646, 1, 0, 0.2039216, 1,
1.907113, -0.7232687, 0.5428766, 1, 0, 0.1960784, 1,
1.92443, -2.522212, 3.260478, 1, 0, 0.1921569, 1,
1.924837, 0.1546909, 1.597001, 1, 0, 0.1843137, 1,
1.928755, 0.9431115, 1.248907, 1, 0, 0.1803922, 1,
1.949876, -1.662783, 2.89868, 1, 0, 0.172549, 1,
1.973933, 0.4511219, 2.493297, 1, 0, 0.1686275, 1,
1.97766, -0.7642533, 2.438777, 1, 0, 0.1607843, 1,
1.99465, -0.5269298, 2.569353, 1, 0, 0.1568628, 1,
1.996344, -0.7262098, 2.80031, 1, 0, 0.1490196, 1,
2.037387, -1.008847, 0.08149714, 1, 0, 0.145098, 1,
2.039676, -0.9677077, 2.0673, 1, 0, 0.1372549, 1,
2.04824, 0.1032682, 2.197329, 1, 0, 0.1333333, 1,
2.050772, -0.005009121, 0.6234945, 1, 0, 0.1254902, 1,
2.055403, 0.4752624, 1.394117, 1, 0, 0.1215686, 1,
2.071218, 0.7329065, 1.865455, 1, 0, 0.1137255, 1,
2.079095, 2.611674, -0.9204934, 1, 0, 0.1098039, 1,
2.114903, 1.941378, 1.657764, 1, 0, 0.1019608, 1,
2.121977, 0.7307525, 1.779969, 1, 0, 0.09411765, 1,
2.202906, -0.4897849, 1.877163, 1, 0, 0.09019608, 1,
2.241832, -1.133029, 2.735603, 1, 0, 0.08235294, 1,
2.252171, -0.3867799, 1.496237, 1, 0, 0.07843138, 1,
2.285535, -0.4469949, 3.647739, 1, 0, 0.07058824, 1,
2.31838, 1.378279, 1.181014, 1, 0, 0.06666667, 1,
2.370939, -0.5344474, 3.017302, 1, 0, 0.05882353, 1,
2.399816, 0.678008, 0.009633801, 1, 0, 0.05490196, 1,
2.629043, -0.3270467, 1.288649, 1, 0, 0.04705882, 1,
2.640634, 0.3030574, -1.037795, 1, 0, 0.04313726, 1,
2.690637, 0.1904991, 2.23864, 1, 0, 0.03529412, 1,
2.708982, 0.3293423, 0.01550613, 1, 0, 0.03137255, 1,
2.737766, 0.9023765, 2.190469, 1, 0, 0.02352941, 1,
2.769199, -1.422242, 0.4506072, 1, 0, 0.01960784, 1,
2.949323, 0.3025049, 0.5397825, 1, 0, 0.01176471, 1,
3.039497, 0.5124099, 2.377977, 1, 0, 0.007843138, 1
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
0.03634238, -3.914301, -7.340268, 0, -0.5, 0.5, 0.5,
0.03634238, -3.914301, -7.340268, 1, -0.5, 0.5, 0.5,
0.03634238, -3.914301, -7.340268, 1, 1.5, 0.5, 0.5,
0.03634238, -3.914301, -7.340268, 0, 1.5, 0.5, 0.5
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
-3.984881, 0.2292708, -7.340268, 0, -0.5, 0.5, 0.5,
-3.984881, 0.2292708, -7.340268, 1, -0.5, 0.5, 0.5,
-3.984881, 0.2292708, -7.340268, 1, 1.5, 0.5, 0.5,
-3.984881, 0.2292708, -7.340268, 0, 1.5, 0.5, 0.5
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
-3.984881, -3.914301, -0.05704427, 0, -0.5, 0.5, 0.5,
-3.984881, -3.914301, -0.05704427, 1, -0.5, 0.5, 0.5,
-3.984881, -3.914301, -0.05704427, 1, 1.5, 0.5, 0.5,
-3.984881, -3.914301, -0.05704427, 0, 1.5, 0.5, 0.5
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
-2, -2.958092, -5.659524,
3, -2.958092, -5.659524,
-2, -2.958092, -5.659524,
-2, -3.11746, -5.939648,
-1, -2.958092, -5.659524,
-1, -3.11746, -5.939648,
0, -2.958092, -5.659524,
0, -3.11746, -5.939648,
1, -2.958092, -5.659524,
1, -3.11746, -5.939648,
2, -2.958092, -5.659524,
2, -3.11746, -5.939648,
3, -2.958092, -5.659524,
3, -3.11746, -5.939648
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
-2, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
-2, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
-2, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
-2, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5,
-1, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
-1, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
-1, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
-1, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5,
0, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
0, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
0, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
0, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5,
1, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
1, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
1, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
1, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5,
2, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
2, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
2, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
2, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5,
3, -3.436197, -6.499896, 0, -0.5, 0.5, 0.5,
3, -3.436197, -6.499896, 1, -0.5, 0.5, 0.5,
3, -3.436197, -6.499896, 1, 1.5, 0.5, 0.5,
3, -3.436197, -6.499896, 0, 1.5, 0.5, 0.5
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
-3.056906, -2, -5.659524,
-3.056906, 3, -5.659524,
-3.056906, -2, -5.659524,
-3.211569, -2, -5.939648,
-3.056906, -1, -5.659524,
-3.211569, -1, -5.939648,
-3.056906, 0, -5.659524,
-3.211569, 0, -5.939648,
-3.056906, 1, -5.659524,
-3.211569, 1, -5.939648,
-3.056906, 2, -5.659524,
-3.211569, 2, -5.939648,
-3.056906, 3, -5.659524,
-3.211569, 3, -5.939648
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
-3.520894, -2, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, -2, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, -2, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, -2, -6.499896, 0, 1.5, 0.5, 0.5,
-3.520894, -1, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, -1, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, -1, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, -1, -6.499896, 0, 1.5, 0.5, 0.5,
-3.520894, 0, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, 0, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, 0, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, 0, -6.499896, 0, 1.5, 0.5, 0.5,
-3.520894, 1, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, 1, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, 1, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, 1, -6.499896, 0, 1.5, 0.5, 0.5,
-3.520894, 2, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, 2, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, 2, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, 2, -6.499896, 0, 1.5, 0.5, 0.5,
-3.520894, 3, -6.499896, 0, -0.5, 0.5, 0.5,
-3.520894, 3, -6.499896, 1, -0.5, 0.5, 0.5,
-3.520894, 3, -6.499896, 1, 1.5, 0.5, 0.5,
-3.520894, 3, -6.499896, 0, 1.5, 0.5, 0.5
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
-3.056906, -2.958092, -4,
-3.056906, -2.958092, 4,
-3.056906, -2.958092, -4,
-3.211569, -3.11746, -4,
-3.056906, -2.958092, -2,
-3.211569, -3.11746, -2,
-3.056906, -2.958092, 0,
-3.211569, -3.11746, 0,
-3.056906, -2.958092, 2,
-3.211569, -3.11746, 2,
-3.056906, -2.958092, 4,
-3.211569, -3.11746, 4
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
-3.520894, -3.436197, -4, 0, -0.5, 0.5, 0.5,
-3.520894, -3.436197, -4, 1, -0.5, 0.5, 0.5,
-3.520894, -3.436197, -4, 1, 1.5, 0.5, 0.5,
-3.520894, -3.436197, -4, 0, 1.5, 0.5, 0.5,
-3.520894, -3.436197, -2, 0, -0.5, 0.5, 0.5,
-3.520894, -3.436197, -2, 1, -0.5, 0.5, 0.5,
-3.520894, -3.436197, -2, 1, 1.5, 0.5, 0.5,
-3.520894, -3.436197, -2, 0, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 0, 0, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 0, 1, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 0, 1, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 0, 0, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 2, 0, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 2, 1, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 2, 1, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 2, 0, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 4, 0, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 4, 1, -0.5, 0.5, 0.5,
-3.520894, -3.436197, 4, 1, 1.5, 0.5, 0.5,
-3.520894, -3.436197, 4, 0, 1.5, 0.5, 0.5
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
-3.056906, -2.958092, -5.659524,
-3.056906, 3.416634, -5.659524,
-3.056906, -2.958092, 5.545435,
-3.056906, 3.416634, 5.545435,
-3.056906, -2.958092, -5.659524,
-3.056906, -2.958092, 5.545435,
-3.056906, 3.416634, -5.659524,
-3.056906, 3.416634, 5.545435,
-3.056906, -2.958092, -5.659524,
3.129591, -2.958092, -5.659524,
-3.056906, -2.958092, 5.545435,
3.129591, -2.958092, 5.545435,
-3.056906, 3.416634, -5.659524,
3.129591, 3.416634, -5.659524,
-3.056906, 3.416634, 5.545435,
3.129591, 3.416634, 5.545435,
3.129591, -2.958092, -5.659524,
3.129591, 3.416634, -5.659524,
3.129591, -2.958092, 5.545435,
3.129591, 3.416634, 5.545435,
3.129591, -2.958092, -5.659524,
3.129591, -2.958092, 5.545435,
3.129591, 3.416634, -5.659524,
3.129591, 3.416634, 5.545435
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
var radius = 7.635381;
var distance = 33.97067;
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
mvMatrix.translate( -0.03634238, -0.2292708, 0.05704427 );
mvMatrix.scale( 1.334442, 1.29504, 0.7367741 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97067);
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


