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
-3.410017, -0.7822647, -0.9654229, 1, 0, 0, 1,
-3.120674, -0.06989612, -3.958868, 1, 0.007843138, 0, 1,
-2.661346, -0.09549311, -0.3162767, 1, 0.01176471, 0, 1,
-2.651608, 1.543836, -0.3414035, 1, 0.01960784, 0, 1,
-2.44331, -1.548591, -2.017214, 1, 0.02352941, 0, 1,
-2.356688, -0.9889389, -2.158207, 1, 0.03137255, 0, 1,
-2.340106, -1.084219, -3.434621, 1, 0.03529412, 0, 1,
-2.284872, 1.42583, -0.2881586, 1, 0.04313726, 0, 1,
-2.260648, 1.825748, -1.229667, 1, 0.04705882, 0, 1,
-2.236076, -0.4954683, -1.877158, 1, 0.05490196, 0, 1,
-2.189639, 0.4211834, -1.547564, 1, 0.05882353, 0, 1,
-2.159803, 1.326164, -1.166465, 1, 0.06666667, 0, 1,
-2.155837, 0.7832696, -0.3323012, 1, 0.07058824, 0, 1,
-2.118603, 1.157623, -0.657519, 1, 0.07843138, 0, 1,
-2.098249, 0.1586918, -1.880728, 1, 0.08235294, 0, 1,
-2.09408, 0.3937987, -0.4829856, 1, 0.09019608, 0, 1,
-2.083553, 0.8438019, -0.5416458, 1, 0.09411765, 0, 1,
-2.052914, -0.9543192, -2.77015, 1, 0.1019608, 0, 1,
-2.048268, -0.3516878, -1.455694, 1, 0.1098039, 0, 1,
-2.021738, 0.05375183, -1.867622, 1, 0.1137255, 0, 1,
-1.985158, 0.4320474, -2.474477, 1, 0.1215686, 0, 1,
-1.984719, 0.6975652, -2.313592, 1, 0.1254902, 0, 1,
-1.977223, 1.348582, 0.03882483, 1, 0.1333333, 0, 1,
-1.942405, 0.3317115, -1.692982, 1, 0.1372549, 0, 1,
-1.937516, -0.5999883, -2.693552, 1, 0.145098, 0, 1,
-1.935309, 0.891702, -1.15782, 1, 0.1490196, 0, 1,
-1.927149, -0.4292113, -1.711909, 1, 0.1568628, 0, 1,
-1.925882, -0.9694677, -1.577122, 1, 0.1607843, 0, 1,
-1.901979, 0.02212319, -1.829588, 1, 0.1686275, 0, 1,
-1.897695, -1.218087, -2.010627, 1, 0.172549, 0, 1,
-1.885249, -1.108668, -2.228907, 1, 0.1803922, 0, 1,
-1.879632, -0.7099636, -1.801095, 1, 0.1843137, 0, 1,
-1.874211, -0.003915325, -1.792521, 1, 0.1921569, 0, 1,
-1.873184, -1.039564, -2.368263, 1, 0.1960784, 0, 1,
-1.872716, 0.4419623, -1.766711, 1, 0.2039216, 0, 1,
-1.859113, 0.9707222, -0.5172979, 1, 0.2117647, 0, 1,
-1.839772, 0.1948185, 0.3938889, 1, 0.2156863, 0, 1,
-1.834052, -0.5304347, -1.453828, 1, 0.2235294, 0, 1,
-1.830954, -0.4132253, -2.369495, 1, 0.227451, 0, 1,
-1.811636, -0.6331746, -2.703669, 1, 0.2352941, 0, 1,
-1.804473, 0.2484159, -1.421316, 1, 0.2392157, 0, 1,
-1.75919, -0.3872632, -1.723735, 1, 0.2470588, 0, 1,
-1.74666, 0.6371851, -1.728257, 1, 0.2509804, 0, 1,
-1.735473, 0.3137093, -2.117599, 1, 0.2588235, 0, 1,
-1.730758, 0.5305646, -1.67239, 1, 0.2627451, 0, 1,
-1.718256, -0.6813542, -2.263218, 1, 0.2705882, 0, 1,
-1.700554, -2.294167, -3.441206, 1, 0.2745098, 0, 1,
-1.667209, -1.040728, -2.131392, 1, 0.282353, 0, 1,
-1.656157, 0.6271757, -0.9263265, 1, 0.2862745, 0, 1,
-1.652561, -1.128016, -0.9253756, 1, 0.2941177, 0, 1,
-1.649885, -0.01598072, -3.414515, 1, 0.3019608, 0, 1,
-1.640437, -0.09095409, -0.4081182, 1, 0.3058824, 0, 1,
-1.639375, 0.2149843, -0.5137407, 1, 0.3137255, 0, 1,
-1.601977, -0.02006575, -2.313215, 1, 0.3176471, 0, 1,
-1.601359, 0.3274819, -4.705614, 1, 0.3254902, 0, 1,
-1.594312, -0.776673, -3.332828, 1, 0.3294118, 0, 1,
-1.591965, -0.8659503, -2.20502, 1, 0.3372549, 0, 1,
-1.581834, -0.5780405, -3.368251, 1, 0.3411765, 0, 1,
-1.56113, 0.2717867, -1.369527, 1, 0.3490196, 0, 1,
-1.560743, -1.20553, -1.255224, 1, 0.3529412, 0, 1,
-1.554513, 0.7723664, -1.041181, 1, 0.3607843, 0, 1,
-1.549772, -0.277035, -2.474772, 1, 0.3647059, 0, 1,
-1.537255, -0.5740161, -0.5603148, 1, 0.372549, 0, 1,
-1.536605, -0.8204694, -2.837044, 1, 0.3764706, 0, 1,
-1.528064, -0.7114484, -3.603689, 1, 0.3843137, 0, 1,
-1.524448, 0.03809643, -1.138136, 1, 0.3882353, 0, 1,
-1.515713, 0.2183665, -1.7078, 1, 0.3960784, 0, 1,
-1.515045, -0.6415015, -1.972604, 1, 0.4039216, 0, 1,
-1.507823, -0.3401906, -1.986999, 1, 0.4078431, 0, 1,
-1.49939, -0.1795194, -1.139157, 1, 0.4156863, 0, 1,
-1.494972, -0.1357133, 0.2034665, 1, 0.4196078, 0, 1,
-1.491105, 0.5591968, -2.4151, 1, 0.427451, 0, 1,
-1.490062, 1.921369, -0.1204749, 1, 0.4313726, 0, 1,
-1.458376, 1.171082, -1.470042, 1, 0.4392157, 0, 1,
-1.443117, -0.08458251, -0.467976, 1, 0.4431373, 0, 1,
-1.436552, 0.4320509, -1.356273, 1, 0.4509804, 0, 1,
-1.434294, 0.19561, -0.4030497, 1, 0.454902, 0, 1,
-1.426939, 1.11943, -1.347843, 1, 0.4627451, 0, 1,
-1.426571, 0.5460175, 0.3800999, 1, 0.4666667, 0, 1,
-1.412132, -0.8828823, -1.04167, 1, 0.4745098, 0, 1,
-1.385302, -1.833927, -3.024053, 1, 0.4784314, 0, 1,
-1.379078, -0.4622694, -2.5688, 1, 0.4862745, 0, 1,
-1.372304, 2.180412, -0.3699645, 1, 0.4901961, 0, 1,
-1.347981, -1.481456, -0.9026781, 1, 0.4980392, 0, 1,
-1.341249, 0.6310076, -2.049559, 1, 0.5058824, 0, 1,
-1.340212, 1.554716, 1.271514, 1, 0.509804, 0, 1,
-1.337698, -2.28615, -1.749151, 1, 0.5176471, 0, 1,
-1.336744, 0.3392478, -0.9089831, 1, 0.5215687, 0, 1,
-1.332637, -0.4150632, -2.457709, 1, 0.5294118, 0, 1,
-1.330289, 0.6359341, -2.275177, 1, 0.5333334, 0, 1,
-1.319849, 2.118108, -3.626568, 1, 0.5411765, 0, 1,
-1.319481, 0.4391381, -1.376784, 1, 0.5450981, 0, 1,
-1.310731, -0.04814273, -2.255144, 1, 0.5529412, 0, 1,
-1.306766, 2.338321, -0.553614, 1, 0.5568628, 0, 1,
-1.305941, 1.802161, -0.3036308, 1, 0.5647059, 0, 1,
-1.305885, -0.4246583, -2.709711, 1, 0.5686275, 0, 1,
-1.293698, 0.6921946, -2.946276, 1, 0.5764706, 0, 1,
-1.293438, 1.144861, 0.09834541, 1, 0.5803922, 0, 1,
-1.28573, -0.8916675, -1.519373, 1, 0.5882353, 0, 1,
-1.283836, -0.6318187, -1.508652, 1, 0.5921569, 0, 1,
-1.283588, 1.516628, -2.8776, 1, 0.6, 0, 1,
-1.27982, 0.3466333, -0.5402665, 1, 0.6078432, 0, 1,
-1.276924, -2.454253, -3.032833, 1, 0.6117647, 0, 1,
-1.26418, 1.481073, -1.773967, 1, 0.6196079, 0, 1,
-1.253625, -1.315682, -1.241327, 1, 0.6235294, 0, 1,
-1.241176, 0.1162071, -0.9316702, 1, 0.6313726, 0, 1,
-1.240391, -0.422982, -2.218478, 1, 0.6352941, 0, 1,
-1.236332, 1.913115, -0.08256165, 1, 0.6431373, 0, 1,
-1.232542, -0.1525661, -1.947625, 1, 0.6470588, 0, 1,
-1.22835, 0.6596298, -1.219798, 1, 0.654902, 0, 1,
-1.223215, -0.6915432, -2.589943, 1, 0.6588235, 0, 1,
-1.220403, 0.5300934, -1.582078, 1, 0.6666667, 0, 1,
-1.218655, 0.3191079, -1.602887, 1, 0.6705883, 0, 1,
-1.202734, -1.984171, -3.455472, 1, 0.6784314, 0, 1,
-1.193506, 0.6459861, -0.9015141, 1, 0.682353, 0, 1,
-1.188404, 0.2713721, -2.121911, 1, 0.6901961, 0, 1,
-1.178581, 0.5791777, -1.90603, 1, 0.6941177, 0, 1,
-1.177767, -1.392428, -2.499871, 1, 0.7019608, 0, 1,
-1.176008, -0.6875616, -2.069889, 1, 0.7098039, 0, 1,
-1.173792, 0.9565892, -2.124517, 1, 0.7137255, 0, 1,
-1.172614, -0.5037981, -2.332723, 1, 0.7215686, 0, 1,
-1.170989, 0.7842771, -0.3444655, 1, 0.7254902, 0, 1,
-1.165361, 0.3984018, -0.4368586, 1, 0.7333333, 0, 1,
-1.163631, -0.6687536, -2.61646, 1, 0.7372549, 0, 1,
-1.160785, -0.5314201, -1.463922, 1, 0.7450981, 0, 1,
-1.16021, 0.1250332, -2.269829, 1, 0.7490196, 0, 1,
-1.15569, -1.534171, -3.364918, 1, 0.7568628, 0, 1,
-1.153358, 0.7406967, 0.3922262, 1, 0.7607843, 0, 1,
-1.153334, -0.5565113, -3.539688, 1, 0.7686275, 0, 1,
-1.150824, -0.3555769, -1.887998, 1, 0.772549, 0, 1,
-1.149945, -0.6271573, -4.192288, 1, 0.7803922, 0, 1,
-1.135561, -0.3403967, -0.9990481, 1, 0.7843137, 0, 1,
-1.134729, 0.8786079, -0.3597463, 1, 0.7921569, 0, 1,
-1.134621, -1.374271, -1.422084, 1, 0.7960784, 0, 1,
-1.132171, 0.5953478, -2.551964, 1, 0.8039216, 0, 1,
-1.114546, -0.8236668, -2.394525, 1, 0.8117647, 0, 1,
-1.109882, 0.01756953, 0.4836254, 1, 0.8156863, 0, 1,
-1.107022, 0.8784098, -0.213148, 1, 0.8235294, 0, 1,
-1.105141, -1.924141, -2.853628, 1, 0.827451, 0, 1,
-1.104133, 0.710703, -0.6097862, 1, 0.8352941, 0, 1,
-1.094771, -1.385561, -2.428491, 1, 0.8392157, 0, 1,
-1.094053, -0.4567542, -0.8551061, 1, 0.8470588, 0, 1,
-1.092631, 1.366522, -0.1384232, 1, 0.8509804, 0, 1,
-1.090518, 0.2206568, -0.06460512, 1, 0.8588235, 0, 1,
-1.089442, 0.3955058, -1.222246, 1, 0.8627451, 0, 1,
-1.087003, 1.779431, -2.116012, 1, 0.8705882, 0, 1,
-1.085719, -0.4748968, -1.23129, 1, 0.8745098, 0, 1,
-1.084519, 0.002642985, -1.767035, 1, 0.8823529, 0, 1,
-1.083096, 0.5809897, -1.522127, 1, 0.8862745, 0, 1,
-1.081216, -0.4654577, -0.7286019, 1, 0.8941177, 0, 1,
-1.080308, 0.04726633, -0.8309684, 1, 0.8980392, 0, 1,
-1.074848, -0.1140249, -0.4029844, 1, 0.9058824, 0, 1,
-1.073658, 0.9375378, -3.068786, 1, 0.9137255, 0, 1,
-1.070658, -0.3647391, -2.330445, 1, 0.9176471, 0, 1,
-1.070306, -1.098618, -3.046215, 1, 0.9254902, 0, 1,
-1.063441, 0.1618242, -2.518534, 1, 0.9294118, 0, 1,
-1.061808, -0.6168405, -1.69059, 1, 0.9372549, 0, 1,
-1.052549, 2.221036, -1.500098, 1, 0.9411765, 0, 1,
-1.050747, -0.9615395, -3.021147, 1, 0.9490196, 0, 1,
-1.049319, -0.6443405, -1.356145, 1, 0.9529412, 0, 1,
-1.042826, -1.450668, -1.435353, 1, 0.9607843, 0, 1,
-1.034693, -0.4448843, -2.957712, 1, 0.9647059, 0, 1,
-1.031152, -0.6484811, -3.29756, 1, 0.972549, 0, 1,
-1.026555, -0.2110105, -1.365951, 1, 0.9764706, 0, 1,
-1.00182, -0.0360093, -1.133035, 1, 0.9843137, 0, 1,
-0.9993575, 0.1407395, -0.8536631, 1, 0.9882353, 0, 1,
-0.9990206, -0.3747266, -1.810968, 1, 0.9960784, 0, 1,
-0.9985343, 0.4203126, -0.8954537, 0.9960784, 1, 0, 1,
-0.9964665, -1.601144, -2.049262, 0.9921569, 1, 0, 1,
-0.9952413, 0.9511299, -0.5796167, 0.9843137, 1, 0, 1,
-0.9942634, 1.004211, -2.622926, 0.9803922, 1, 0, 1,
-0.9901469, -0.7409695, -3.41341, 0.972549, 1, 0, 1,
-0.9847769, -0.1591989, -1.222487, 0.9686275, 1, 0, 1,
-0.9818917, 0.8124143, -1.573218, 0.9607843, 1, 0, 1,
-0.9787363, -1.464026, -2.468265, 0.9568627, 1, 0, 1,
-0.9785482, -1.479798, -1.318067, 0.9490196, 1, 0, 1,
-0.9758514, 1.23675, -0.3379158, 0.945098, 1, 0, 1,
-0.9757428, -0.09035733, 0.3468975, 0.9372549, 1, 0, 1,
-0.9745289, 0.6656877, -1.478254, 0.9333333, 1, 0, 1,
-0.9712777, 0.0620232, -1.418361, 0.9254902, 1, 0, 1,
-0.9705405, -0.3468297, -2.180351, 0.9215686, 1, 0, 1,
-0.96302, 0.3030762, 0.3078615, 0.9137255, 1, 0, 1,
-0.9588657, 0.3217867, -1.495066, 0.9098039, 1, 0, 1,
-0.9579251, 0.6108828, -0.9464931, 0.9019608, 1, 0, 1,
-0.9575576, -1.253657, -4.098361, 0.8941177, 1, 0, 1,
-0.9574502, 0.5265869, -2.663596, 0.8901961, 1, 0, 1,
-0.9524276, 0.5872843, -1.727272, 0.8823529, 1, 0, 1,
-0.9434379, 1.139215, 0.5052004, 0.8784314, 1, 0, 1,
-0.9434255, 0.1131233, -3.090974, 0.8705882, 1, 0, 1,
-0.9408248, 1.675914, -0.3016679, 0.8666667, 1, 0, 1,
-0.9354607, 0.6321687, -1.63984, 0.8588235, 1, 0, 1,
-0.9338537, 0.2639787, -2.599291, 0.854902, 1, 0, 1,
-0.9284497, 0.4716994, -0.7056045, 0.8470588, 1, 0, 1,
-0.9101364, 1.996962, 0.03007656, 0.8431373, 1, 0, 1,
-0.9013457, 0.04954768, -0.9954212, 0.8352941, 1, 0, 1,
-0.8909553, -0.1607095, -1.864056, 0.8313726, 1, 0, 1,
-0.8894337, -0.4754813, -1.650856, 0.8235294, 1, 0, 1,
-0.8881502, -0.1829848, -0.2831536, 0.8196079, 1, 0, 1,
-0.8866038, 0.09341519, -2.117574, 0.8117647, 1, 0, 1,
-0.8855167, 1.138942, 0.5940366, 0.8078431, 1, 0, 1,
-0.880485, -1.059206, -2.8066, 0.8, 1, 0, 1,
-0.8752089, 0.9763975, -2.226207, 0.7921569, 1, 0, 1,
-0.8725958, -0.7750373, -3.313497, 0.7882353, 1, 0, 1,
-0.8711417, 0.3356913, -1.206624, 0.7803922, 1, 0, 1,
-0.8683333, -1.215681, -3.186218, 0.7764706, 1, 0, 1,
-0.8619424, -0.1488642, -1.21925, 0.7686275, 1, 0, 1,
-0.8472863, 2.167376, 0.04730604, 0.7647059, 1, 0, 1,
-0.8459177, -0.9574168, -4.408693, 0.7568628, 1, 0, 1,
-0.8453497, -0.2471765, 0.676629, 0.7529412, 1, 0, 1,
-0.8379487, 0.6464299, -2.392952, 0.7450981, 1, 0, 1,
-0.837171, 0.1847575, -3.05445, 0.7411765, 1, 0, 1,
-0.8244267, 0.8032762, -1.257601, 0.7333333, 1, 0, 1,
-0.8242807, -0.4541718, -2.321679, 0.7294118, 1, 0, 1,
-0.8158587, 0.113979, -0.063074, 0.7215686, 1, 0, 1,
-0.8138981, -0.2085531, -2.126629, 0.7176471, 1, 0, 1,
-0.8133647, 0.882224, -0.5227988, 0.7098039, 1, 0, 1,
-0.8119729, -0.06834384, -2.702832, 0.7058824, 1, 0, 1,
-0.7954527, -0.7520743, -0.5139756, 0.6980392, 1, 0, 1,
-0.7945867, 0.4697564, -1.691703, 0.6901961, 1, 0, 1,
-0.7919364, -2.686378, -3.879722, 0.6862745, 1, 0, 1,
-0.7914764, 1.170989, -1.240098, 0.6784314, 1, 0, 1,
-0.7828721, -0.0592582, -2.948858, 0.6745098, 1, 0, 1,
-0.778556, -0.820385, -4.707993, 0.6666667, 1, 0, 1,
-0.7785065, 1.178497, 0.7282787, 0.6627451, 1, 0, 1,
-0.7696272, 0.6144697, 0.59148, 0.654902, 1, 0, 1,
-0.7651895, -0.4456009, -1.896594, 0.6509804, 1, 0, 1,
-0.7648268, 0.334686, -1.839384, 0.6431373, 1, 0, 1,
-0.7645189, 0.3291866, -1.515392, 0.6392157, 1, 0, 1,
-0.7491488, -0.5015409, -1.989544, 0.6313726, 1, 0, 1,
-0.7433084, 1.538368, -0.142956, 0.627451, 1, 0, 1,
-0.7432355, 0.3864427, -0.7907643, 0.6196079, 1, 0, 1,
-0.742244, -0.7484948, -3.133694, 0.6156863, 1, 0, 1,
-0.7407764, -0.2437882, -1.525773, 0.6078432, 1, 0, 1,
-0.7404169, -0.7011235, -1.924648, 0.6039216, 1, 0, 1,
-0.7399056, -1.006393, -1.515575, 0.5960785, 1, 0, 1,
-0.7373794, -0.4942575, -2.791949, 0.5882353, 1, 0, 1,
-0.7320562, -0.6866821, -3.525353, 0.5843138, 1, 0, 1,
-0.731425, -0.1479027, -1.846162, 0.5764706, 1, 0, 1,
-0.7303857, -0.3181608, -0.9061387, 0.572549, 1, 0, 1,
-0.730297, -0.1585685, -1.994757, 0.5647059, 1, 0, 1,
-0.7283464, -1.749752, -1.178505, 0.5607843, 1, 0, 1,
-0.7278422, -0.7851007, -2.37347, 0.5529412, 1, 0, 1,
-0.7267848, 1.577362, -0.1898379, 0.5490196, 1, 0, 1,
-0.7265345, -0.2375394, -2.089059, 0.5411765, 1, 0, 1,
-0.7255006, 1.72772, 0.09300155, 0.5372549, 1, 0, 1,
-0.7238744, 1.665337, -1.623189, 0.5294118, 1, 0, 1,
-0.7233542, 0.1516119, -3.399264, 0.5254902, 1, 0, 1,
-0.721595, 0.6301601, -2.910141, 0.5176471, 1, 0, 1,
-0.7209449, 0.7870925, -0.03468899, 0.5137255, 1, 0, 1,
-0.7194355, 0.0419895, -0.1946153, 0.5058824, 1, 0, 1,
-0.7174816, -0.5073006, -1.580121, 0.5019608, 1, 0, 1,
-0.7155048, -1.530793, -2.981138, 0.4941176, 1, 0, 1,
-0.7146816, -1.770021, -1.648359, 0.4862745, 1, 0, 1,
-0.7134168, 0.6561778, -0.5403634, 0.4823529, 1, 0, 1,
-0.7118806, -0.4622289, -2.136455, 0.4745098, 1, 0, 1,
-0.7109914, 0.8132172, -0.6967881, 0.4705882, 1, 0, 1,
-0.710022, -0.4267123, -1.536122, 0.4627451, 1, 0, 1,
-0.7020637, -0.6050421, -1.947232, 0.4588235, 1, 0, 1,
-0.7012811, 0.3394597, -1.706948, 0.4509804, 1, 0, 1,
-0.6972086, -1.31878, -3.404344, 0.4470588, 1, 0, 1,
-0.6850075, 1.068247, -1.098271, 0.4392157, 1, 0, 1,
-0.6847898, 0.2857647, -1.689219, 0.4352941, 1, 0, 1,
-0.6830161, 0.06040867, -0.6895553, 0.427451, 1, 0, 1,
-0.6812627, 0.5547649, -1.997365, 0.4235294, 1, 0, 1,
-0.6803444, 3.588452, 0.2716019, 0.4156863, 1, 0, 1,
-0.6790105, 1.196512, 0.3067659, 0.4117647, 1, 0, 1,
-0.6707053, 1.319674, 0.6913536, 0.4039216, 1, 0, 1,
-0.6699286, -0.2306878, -1.758408, 0.3960784, 1, 0, 1,
-0.6693746, -0.4227085, -3.186503, 0.3921569, 1, 0, 1,
-0.667941, 0.395469, -0.8788465, 0.3843137, 1, 0, 1,
-0.6648108, -1.217785, -1.79829, 0.3803922, 1, 0, 1,
-0.6614681, 1.77672, -1.375011, 0.372549, 1, 0, 1,
-0.6524878, 0.5377622, -1.796671, 0.3686275, 1, 0, 1,
-0.6506925, 0.6822017, -0.8820617, 0.3607843, 1, 0, 1,
-0.6487734, -0.9753594, -3.695827, 0.3568628, 1, 0, 1,
-0.6445862, 0.1835576, -1.12502, 0.3490196, 1, 0, 1,
-0.6429039, 0.02323129, 1.479126, 0.345098, 1, 0, 1,
-0.6414267, 1.014174, 1.000756, 0.3372549, 1, 0, 1,
-0.6404265, -0.1997818, -2.559797, 0.3333333, 1, 0, 1,
-0.6404168, 0.2856622, -1.207069, 0.3254902, 1, 0, 1,
-0.6402295, 0.4409487, -1.43224, 0.3215686, 1, 0, 1,
-0.6390988, -1.08792, -2.846668, 0.3137255, 1, 0, 1,
-0.6380182, 1.00088, 0.0005570529, 0.3098039, 1, 0, 1,
-0.63586, -0.5668916, -2.133795, 0.3019608, 1, 0, 1,
-0.6293091, -2.385939, -2.750936, 0.2941177, 1, 0, 1,
-0.6232952, -0.6716642, -1.965742, 0.2901961, 1, 0, 1,
-0.6190928, 1.530097, -1.351444, 0.282353, 1, 0, 1,
-0.6114716, -0.4328496, -0.4726192, 0.2784314, 1, 0, 1,
-0.608816, -1.610645, -4.450364, 0.2705882, 1, 0, 1,
-0.6072857, -0.2062187, -4.090009, 0.2666667, 1, 0, 1,
-0.6057173, 1.105209, -0.03289583, 0.2588235, 1, 0, 1,
-0.6034486, -1.331117, -1.185636, 0.254902, 1, 0, 1,
-0.6006978, -0.3198232, -3.154028, 0.2470588, 1, 0, 1,
-0.5991961, -0.06915915, -0.604525, 0.2431373, 1, 0, 1,
-0.5961003, -0.4200669, -2.805691, 0.2352941, 1, 0, 1,
-0.5914068, -1.439277, -1.798919, 0.2313726, 1, 0, 1,
-0.5906072, -0.6830462, -1.861673, 0.2235294, 1, 0, 1,
-0.5904214, 0.06400999, -2.357545, 0.2196078, 1, 0, 1,
-0.5900556, -0.3174905, -2.208159, 0.2117647, 1, 0, 1,
-0.5896985, 0.8833522, -0.6617588, 0.2078431, 1, 0, 1,
-0.5849975, -0.431004, -1.940736, 0.2, 1, 0, 1,
-0.5800608, 0.3396674, -1.420778, 0.1921569, 1, 0, 1,
-0.5767535, -1.227293, -2.289165, 0.1882353, 1, 0, 1,
-0.5581858, 0.4740111, -2.062533, 0.1803922, 1, 0, 1,
-0.5575302, 0.8487048, 1.875649, 0.1764706, 1, 0, 1,
-0.5562176, 1.335024, 1.040347, 0.1686275, 1, 0, 1,
-0.5560614, -1.086234, -2.623877, 0.1647059, 1, 0, 1,
-0.5449688, 0.7704373, -1.060889, 0.1568628, 1, 0, 1,
-0.5399623, 0.477036, -1.62745, 0.1529412, 1, 0, 1,
-0.5366961, -0.7959551, -3.027931, 0.145098, 1, 0, 1,
-0.5339276, 0.8504391, -1.027636, 0.1411765, 1, 0, 1,
-0.5326471, -0.01426942, -1.105369, 0.1333333, 1, 0, 1,
-0.5320204, -0.5428051, -2.642316, 0.1294118, 1, 0, 1,
-0.5315909, -0.2955866, -0.5996667, 0.1215686, 1, 0, 1,
-0.5313649, 0.4865223, -0.6456519, 0.1176471, 1, 0, 1,
-0.5260813, -1.024533, -3.379895, 0.1098039, 1, 0, 1,
-0.5252288, 2.280267, -0.4052537, 0.1058824, 1, 0, 1,
-0.5226166, -1.397562, -1.666, 0.09803922, 1, 0, 1,
-0.519535, 1.015544, -0.6620895, 0.09019608, 1, 0, 1,
-0.5187971, 1.547976, -1.176264, 0.08627451, 1, 0, 1,
-0.5177297, -1.911543, -3.986025, 0.07843138, 1, 0, 1,
-0.5163106, -0.7872759, -3.483058, 0.07450981, 1, 0, 1,
-0.5152692, -0.7029253, -2.277481, 0.06666667, 1, 0, 1,
-0.5065857, -0.3645438, -2.68047, 0.0627451, 1, 0, 1,
-0.5047954, 2.807883, -0.7954174, 0.05490196, 1, 0, 1,
-0.4959565, -0.7129198, -2.889785, 0.05098039, 1, 0, 1,
-0.4957898, -1.590541, -3.137849, 0.04313726, 1, 0, 1,
-0.4949253, 1.433053, -1.120959, 0.03921569, 1, 0, 1,
-0.4892976, -0.3732173, -0.9684671, 0.03137255, 1, 0, 1,
-0.4877296, 0.2436522, 0.07914235, 0.02745098, 1, 0, 1,
-0.4810083, -0.1057086, -1.341483, 0.01960784, 1, 0, 1,
-0.4809342, 0.8847138, 0.3688647, 0.01568628, 1, 0, 1,
-0.4780245, 0.7543576, -0.593771, 0.007843138, 1, 0, 1,
-0.4735925, -0.5934616, -3.330855, 0.003921569, 1, 0, 1,
-0.4732388, -1.165873, -2.552345, 0, 1, 0.003921569, 1,
-0.4716402, 0.8561329, -1.626214, 0, 1, 0.01176471, 1,
-0.4685286, 0.159891, -0.8494492, 0, 1, 0.01568628, 1,
-0.4662514, 0.4529245, -0.1721781, 0, 1, 0.02352941, 1,
-0.4649842, 0.8510499, -0.1286143, 0, 1, 0.02745098, 1,
-0.464302, 1.26107, -2.38169, 0, 1, 0.03529412, 1,
-0.4636452, -0.6157534, -3.170975, 0, 1, 0.03921569, 1,
-0.4627417, 0.7945278, -0.5915115, 0, 1, 0.04705882, 1,
-0.4620174, 0.8864675, -0.5483977, 0, 1, 0.05098039, 1,
-0.461997, -1.637446, -2.582586, 0, 1, 0.05882353, 1,
-0.4561627, -0.4078906, -0.8300372, 0, 1, 0.0627451, 1,
-0.4503305, 0.7911125, -0.2463396, 0, 1, 0.07058824, 1,
-0.4404472, 0.1782021, -0.6791543, 0, 1, 0.07450981, 1,
-0.4404084, -0.6747639, -4.670488, 0, 1, 0.08235294, 1,
-0.4386372, -0.5316975, -1.439712, 0, 1, 0.08627451, 1,
-0.4349352, -0.5886453, -2.921865, 0, 1, 0.09411765, 1,
-0.4260842, -0.4704083, -2.962316, 0, 1, 0.1019608, 1,
-0.4257894, -0.4589033, -2.252316, 0, 1, 0.1058824, 1,
-0.4211647, 0.988601, 0.8780828, 0, 1, 0.1137255, 1,
-0.4192569, -0.3920018, -1.776554, 0, 1, 0.1176471, 1,
-0.415957, 1.910596, 1.02521, 0, 1, 0.1254902, 1,
-0.4151236, -2.176908, -3.90485, 0, 1, 0.1294118, 1,
-0.4141786, -0.5399326, -2.082506, 0, 1, 0.1372549, 1,
-0.408341, 1.114979, -0.5935389, 0, 1, 0.1411765, 1,
-0.4072298, 0.07636268, -0.6129737, 0, 1, 0.1490196, 1,
-0.4050334, 0.6797298, -0.9588062, 0, 1, 0.1529412, 1,
-0.4032987, -0.539889, -1.879577, 0, 1, 0.1607843, 1,
-0.4020907, 0.7394264, 0.311658, 0, 1, 0.1647059, 1,
-0.3990981, 0.7269043, -0.746886, 0, 1, 0.172549, 1,
-0.3990549, 1.764304, 1.37078, 0, 1, 0.1764706, 1,
-0.3961782, -0.5790923, -2.991423, 0, 1, 0.1843137, 1,
-0.3914395, 1.005985, -0.5267881, 0, 1, 0.1882353, 1,
-0.3866804, -0.5396994, -1.551012, 0, 1, 0.1960784, 1,
-0.3763208, -0.2169881, -3.1163, 0, 1, 0.2039216, 1,
-0.3746949, 1.208313, -0.5430002, 0, 1, 0.2078431, 1,
-0.3742353, 0.6981292, -0.3785858, 0, 1, 0.2156863, 1,
-0.3712153, 0.02458755, -1.494689, 0, 1, 0.2196078, 1,
-0.3628397, 0.9654075, -0.6408274, 0, 1, 0.227451, 1,
-0.3590894, -2.881181, -0.7242943, 0, 1, 0.2313726, 1,
-0.3590285, 0.09619468, -0.6163878, 0, 1, 0.2392157, 1,
-0.3573641, 0.5342713, -1.706229, 0, 1, 0.2431373, 1,
-0.3554026, 0.5262619, -0.5607127, 0, 1, 0.2509804, 1,
-0.3528206, 1.143483, -1.51096, 0, 1, 0.254902, 1,
-0.3510486, 0.3522545, -1.228444, 0, 1, 0.2627451, 1,
-0.350868, 0.9409819, -0.8888431, 0, 1, 0.2666667, 1,
-0.3493589, -2.16372, -3.967617, 0, 1, 0.2745098, 1,
-0.3458181, -0.181516, -2.229591, 0, 1, 0.2784314, 1,
-0.3378769, 0.8216889, 0.098983, 0, 1, 0.2862745, 1,
-0.3321245, -0.7809777, -2.494027, 0, 1, 0.2901961, 1,
-0.3309966, 0.2372365, -1.827208, 0, 1, 0.2980392, 1,
-0.3306619, -0.3066609, -3.913674, 0, 1, 0.3058824, 1,
-0.3284972, -0.2315346, -1.214994, 0, 1, 0.3098039, 1,
-0.3282979, -0.3435341, -2.240549, 0, 1, 0.3176471, 1,
-0.3282278, 1.977815, 0.06173833, 0, 1, 0.3215686, 1,
-0.3241073, -0.07763101, -1.707906, 0, 1, 0.3294118, 1,
-0.322038, -0.2465866, -0.8875406, 0, 1, 0.3333333, 1,
-0.3201745, 0.2748993, -0.9181263, 0, 1, 0.3411765, 1,
-0.3148374, 0.8631966, 1.079228, 0, 1, 0.345098, 1,
-0.3141942, -0.4154589, -2.867414, 0, 1, 0.3529412, 1,
-0.3061464, -1.924099, -3.545137, 0, 1, 0.3568628, 1,
-0.3055775, -0.01148865, -3.252428, 0, 1, 0.3647059, 1,
-0.3010025, 1.025748, 1.875297, 0, 1, 0.3686275, 1,
-0.2963608, 0.2431312, -2.1941, 0, 1, 0.3764706, 1,
-0.2910184, 2.088478, -1.092252, 0, 1, 0.3803922, 1,
-0.2900103, 1.86438, -0.9234532, 0, 1, 0.3882353, 1,
-0.2804409, -1.616036, -2.789762, 0, 1, 0.3921569, 1,
-0.273717, -1.02225, -3.83483, 0, 1, 0.4, 1,
-0.2699514, 0.1520183, -1.637484, 0, 1, 0.4078431, 1,
-0.2681653, 0.2597385, -1.209611, 0, 1, 0.4117647, 1,
-0.2680558, 0.3770415, -1.058315, 0, 1, 0.4196078, 1,
-0.2651434, 0.02179215, -1.437685, 0, 1, 0.4235294, 1,
-0.2651413, 0.7772151, 0.1228727, 0, 1, 0.4313726, 1,
-0.2627743, -0.1184688, -1.738693, 0, 1, 0.4352941, 1,
-0.2624613, 1.047033, 1.416068, 0, 1, 0.4431373, 1,
-0.2608062, -0.7118796, -3.086659, 0, 1, 0.4470588, 1,
-0.2540274, 0.8572586, 0.1828, 0, 1, 0.454902, 1,
-0.2528001, 0.7442393, -0.182497, 0, 1, 0.4588235, 1,
-0.2523464, -0.1457067, -2.447873, 0, 1, 0.4666667, 1,
-0.2508639, 1.074435, 0.7197405, 0, 1, 0.4705882, 1,
-0.2487739, 0.9370331, 0.1003006, 0, 1, 0.4784314, 1,
-0.2396538, -0.8353298, -2.946752, 0, 1, 0.4823529, 1,
-0.2396228, -0.9527273, -2.635814, 0, 1, 0.4901961, 1,
-0.2368068, -1.893961, -2.337851, 0, 1, 0.4941176, 1,
-0.2363948, -0.3970585, -4.198184, 0, 1, 0.5019608, 1,
-0.2358364, -0.6268702, -4.612298, 0, 1, 0.509804, 1,
-0.2353009, 1.594773, 0.3177319, 0, 1, 0.5137255, 1,
-0.2305651, 0.9233389, 1.110278, 0, 1, 0.5215687, 1,
-0.22966, -0.2555889, -1.503576, 0, 1, 0.5254902, 1,
-0.229458, 0.3826717, -0.3126348, 0, 1, 0.5333334, 1,
-0.2255528, -2.201999, -3.318289, 0, 1, 0.5372549, 1,
-0.2252233, -1.050569, -2.656101, 0, 1, 0.5450981, 1,
-0.224477, -0.533066, -3.691048, 0, 1, 0.5490196, 1,
-0.2177747, 0.4551288, -1.124807, 0, 1, 0.5568628, 1,
-0.2175637, 1.249005, 0.6945509, 0, 1, 0.5607843, 1,
-0.2168971, 0.5621743, -0.1074767, 0, 1, 0.5686275, 1,
-0.2133624, 0.4146637, -2.038947, 0, 1, 0.572549, 1,
-0.212634, 0.006977272, -2.04705, 0, 1, 0.5803922, 1,
-0.2063033, 0.06923667, -1.060704, 0, 1, 0.5843138, 1,
-0.2062801, -0.1825847, -0.2191738, 0, 1, 0.5921569, 1,
-0.2049347, -0.7303966, -2.047803, 0, 1, 0.5960785, 1,
-0.1954915, 1.679537, 0.4318315, 0, 1, 0.6039216, 1,
-0.1933289, 1.26084, -0.04980849, 0, 1, 0.6117647, 1,
-0.1931931, -0.6433077, -4.330472, 0, 1, 0.6156863, 1,
-0.187818, -1.128508, -5.086448, 0, 1, 0.6235294, 1,
-0.1866603, 0.920208, -0.1713556, 0, 1, 0.627451, 1,
-0.1828244, 0.4993399, 0.07312412, 0, 1, 0.6352941, 1,
-0.182799, -1.062931, -2.744702, 0, 1, 0.6392157, 1,
-0.1813733, 0.4586163, -0.4779561, 0, 1, 0.6470588, 1,
-0.1812049, 0.1632181, -0.8693699, 0, 1, 0.6509804, 1,
-0.1791018, -0.01851048, -0.7554786, 0, 1, 0.6588235, 1,
-0.1750028, -1.133834, -1.481409, 0, 1, 0.6627451, 1,
-0.174177, -0.8784101, -2.127365, 0, 1, 0.6705883, 1,
-0.1717443, 0.5062633, 0.4402671, 0, 1, 0.6745098, 1,
-0.1598422, -0.2573358, -3.533231, 0, 1, 0.682353, 1,
-0.1557212, -2.012446, -2.517642, 0, 1, 0.6862745, 1,
-0.1540058, 0.1929655, -0.9393461, 0, 1, 0.6941177, 1,
-0.1502692, 0.4327756, 0.3723555, 0, 1, 0.7019608, 1,
-0.1449111, -2.193165, -3.814807, 0, 1, 0.7058824, 1,
-0.1436311, -0.1777636, -4.406606, 0, 1, 0.7137255, 1,
-0.139337, -0.2186746, -3.57396, 0, 1, 0.7176471, 1,
-0.1370417, 0.2172102, 0.6775937, 0, 1, 0.7254902, 1,
-0.1346803, -1.254073, -3.906849, 0, 1, 0.7294118, 1,
-0.1344654, 2.358767, 0.008458397, 0, 1, 0.7372549, 1,
-0.1282819, 0.99446, 0.8753015, 0, 1, 0.7411765, 1,
-0.1196394, 1.67452, -0.9665084, 0, 1, 0.7490196, 1,
-0.1193644, -0.3159432, -1.102561, 0, 1, 0.7529412, 1,
-0.113785, 0.4175299, 0.6667955, 0, 1, 0.7607843, 1,
-0.1085558, 1.25638, 1.183867, 0, 1, 0.7647059, 1,
-0.1037927, -1.039378, -3.108777, 0, 1, 0.772549, 1,
-0.1032278, 0.03831263, 0.09122148, 0, 1, 0.7764706, 1,
-0.09891737, -1.006816, -3.819853, 0, 1, 0.7843137, 1,
-0.09544574, -0.01758517, -2.553055, 0, 1, 0.7882353, 1,
-0.08568341, 0.6126196, -3.199067, 0, 1, 0.7960784, 1,
-0.08506513, 0.250432, -0.348571, 0, 1, 0.8039216, 1,
-0.08194505, 0.6224077, 0.728789, 0, 1, 0.8078431, 1,
-0.07978222, 1.806051, 0.2454026, 0, 1, 0.8156863, 1,
-0.07949939, 0.273743, -0.6336872, 0, 1, 0.8196079, 1,
-0.07912726, 0.1267755, -0.5563526, 0, 1, 0.827451, 1,
-0.07889895, -0.2854292, -2.834294, 0, 1, 0.8313726, 1,
-0.07634594, 0.127571, -0.248982, 0, 1, 0.8392157, 1,
-0.07631099, 0.1423378, 1.192526, 0, 1, 0.8431373, 1,
-0.06654155, -0.1116206, -1.243637, 0, 1, 0.8509804, 1,
-0.06271728, 0.4154058, 0.6364033, 0, 1, 0.854902, 1,
-0.05579073, 0.7814224, -1.491985, 0, 1, 0.8627451, 1,
-0.05405276, -0.5391509, -3.835736, 0, 1, 0.8666667, 1,
-0.05251378, 1.095335, -0.7147594, 0, 1, 0.8745098, 1,
-0.05169402, -1.286625, -4.495146, 0, 1, 0.8784314, 1,
-0.05056591, 0.2322156, 0.6661974, 0, 1, 0.8862745, 1,
-0.04967317, 1.85795, 0.06681614, 0, 1, 0.8901961, 1,
-0.04790749, -0.1049231, -2.862524, 0, 1, 0.8980392, 1,
-0.04736937, -0.966004, -2.533605, 0, 1, 0.9058824, 1,
-0.04694821, -0.2524777, -1.31815, 0, 1, 0.9098039, 1,
-0.04567905, -1.176077, -3.947321, 0, 1, 0.9176471, 1,
-0.04409838, -1.528551, -1.715058, 0, 1, 0.9215686, 1,
-0.0403756, -0.1846568, -5.075334, 0, 1, 0.9294118, 1,
-0.03730216, -0.6374725, -2.102684, 0, 1, 0.9333333, 1,
-0.02877217, 0.1366373, -1.291473, 0, 1, 0.9411765, 1,
-0.0279745, -0.2569239, -4.357684, 0, 1, 0.945098, 1,
-0.02757321, -0.296886, -2.419291, 0, 1, 0.9529412, 1,
-0.02715142, -0.2172153, -3.407293, 0, 1, 0.9568627, 1,
-0.02494776, -0.639343, -2.234182, 0, 1, 0.9647059, 1,
-0.0225649, -0.6632056, -1.642571, 0, 1, 0.9686275, 1,
-0.01883899, 0.7131779, -0.3650806, 0, 1, 0.9764706, 1,
-0.01527719, 1.101024, -2.63221, 0, 1, 0.9803922, 1,
-0.01361156, -0.7616612, -4.419928, 0, 1, 0.9882353, 1,
-0.00361993, -0.549929, -3.530843, 0, 1, 0.9921569, 1,
0.000483147, 0.3327579, 0.4958445, 0, 1, 1, 1,
0.001220813, -1.127355, 0.6945305, 0, 0.9921569, 1, 1,
0.001761215, 1.180218, 0.05089037, 0, 0.9882353, 1, 1,
0.003456315, 0.007418326, 0.9860704, 0, 0.9803922, 1, 1,
0.003959326, -0.9976817, 3.228029, 0, 0.9764706, 1, 1,
0.006427639, 0.5241057, -0.4269117, 0, 0.9686275, 1, 1,
0.0104819, -1.818506, 2.739037, 0, 0.9647059, 1, 1,
0.01203396, 1.09694, 1.290954, 0, 0.9568627, 1, 1,
0.01357922, 0.1270658, -1.43206, 0, 0.9529412, 1, 1,
0.0186597, 0.03526765, 0.8589446, 0, 0.945098, 1, 1,
0.01916162, -0.639715, 3.610719, 0, 0.9411765, 1, 1,
0.01938458, -1.220817, 1.424913, 0, 0.9333333, 1, 1,
0.02603487, 0.3058435, -1.879705, 0, 0.9294118, 1, 1,
0.02711242, -0.7667472, 2.921591, 0, 0.9215686, 1, 1,
0.02890306, 0.3425949, -0.8727204, 0, 0.9176471, 1, 1,
0.03006404, 0.1600741, 0.6852431, 0, 0.9098039, 1, 1,
0.03096345, 0.2556287, -0.6472583, 0, 0.9058824, 1, 1,
0.03832095, 0.4980507, 0.976863, 0, 0.8980392, 1, 1,
0.04043758, -0.7621107, 2.721301, 0, 0.8901961, 1, 1,
0.04294117, -0.8445123, 2.134992, 0, 0.8862745, 1, 1,
0.04619062, -1.756242, 4.099159, 0, 0.8784314, 1, 1,
0.04848501, -0.4316379, 2.417253, 0, 0.8745098, 1, 1,
0.05364459, -1.418438, 2.868865, 0, 0.8666667, 1, 1,
0.05501685, 0.3529553, -0.2744545, 0, 0.8627451, 1, 1,
0.0557549, -0.07081795, 2.735311, 0, 0.854902, 1, 1,
0.05742246, 1.66245, 0.3496087, 0, 0.8509804, 1, 1,
0.05836501, -0.2539399, 4.549469, 0, 0.8431373, 1, 1,
0.06496707, -1.750678, 4.038748, 0, 0.8392157, 1, 1,
0.06596936, -0.6374829, 4.275472, 0, 0.8313726, 1, 1,
0.06903835, -1.452643, 3.840349, 0, 0.827451, 1, 1,
0.06904175, 0.2872918, 0.6631328, 0, 0.8196079, 1, 1,
0.07094637, 0.5764873, 0.1802614, 0, 0.8156863, 1, 1,
0.07306021, -1.343421, 3.996477, 0, 0.8078431, 1, 1,
0.0734427, -0.3811713, 2.603312, 0, 0.8039216, 1, 1,
0.07548715, -0.6483265, 3.465136, 0, 0.7960784, 1, 1,
0.07603841, -1.960429, 2.571326, 0, 0.7882353, 1, 1,
0.07735945, -1.307886, 1.130522, 0, 0.7843137, 1, 1,
0.08109399, -0.5812781, 3.477265, 0, 0.7764706, 1, 1,
0.08160008, -2.417369, 3.399594, 0, 0.772549, 1, 1,
0.08433343, -1.09899, 3.565728, 0, 0.7647059, 1, 1,
0.08588509, -2.360675, 2.439823, 0, 0.7607843, 1, 1,
0.08693671, -0.9868286, 3.409722, 0, 0.7529412, 1, 1,
0.08919854, 0.3263986, -0.5522496, 0, 0.7490196, 1, 1,
0.09345139, 1.486344, 0.9775182, 0, 0.7411765, 1, 1,
0.09483758, 1.195177, -0.08871889, 0, 0.7372549, 1, 1,
0.0957116, 0.181435, 0.03293108, 0, 0.7294118, 1, 1,
0.09710539, -0.3551666, 0.7919176, 0, 0.7254902, 1, 1,
0.09772503, 0.405549, 0.02444992, 0, 0.7176471, 1, 1,
0.09881739, 0.5045643, 1.119531, 0, 0.7137255, 1, 1,
0.1043756, -0.2036207, 4.485918, 0, 0.7058824, 1, 1,
0.121244, -0.1646941, 1.515771, 0, 0.6980392, 1, 1,
0.1220947, -0.9851093, 4.976886, 0, 0.6941177, 1, 1,
0.1254896, -0.1078791, 1.770231, 0, 0.6862745, 1, 1,
0.1261222, 1.844352, -0.05975411, 0, 0.682353, 1, 1,
0.1312642, -0.2723024, 3.90367, 0, 0.6745098, 1, 1,
0.1369973, -1.609629, 2.916137, 0, 0.6705883, 1, 1,
0.1383551, 0.3881799, 1.246515, 0, 0.6627451, 1, 1,
0.1415668, -0.4558711, 2.300872, 0, 0.6588235, 1, 1,
0.1449991, 0.09311465, -0.3812161, 0, 0.6509804, 1, 1,
0.1554689, 1.852118, 0.850921, 0, 0.6470588, 1, 1,
0.1638155, -0.3939337, 4.073457, 0, 0.6392157, 1, 1,
0.167398, -1.187782, 2.506122, 0, 0.6352941, 1, 1,
0.1763163, 1.35833, -0.459804, 0, 0.627451, 1, 1,
0.1779957, -0.8430039, 1.984105, 0, 0.6235294, 1, 1,
0.182097, 0.7672264, 1.324333, 0, 0.6156863, 1, 1,
0.1882241, 0.4778804, 1.510998, 0, 0.6117647, 1, 1,
0.1892828, -1.638511, 3.270086, 0, 0.6039216, 1, 1,
0.1905367, 0.4131636, 2.084218, 0, 0.5960785, 1, 1,
0.1910585, -0.5374126, 3.183616, 0, 0.5921569, 1, 1,
0.1924352, 0.7948447, -0.2383973, 0, 0.5843138, 1, 1,
0.1932573, 0.5757992, 0.574276, 0, 0.5803922, 1, 1,
0.1955023, -0.7979167, 4.125381, 0, 0.572549, 1, 1,
0.1960107, 0.6789003, -0.4218919, 0, 0.5686275, 1, 1,
0.1973078, 1.202448, 0.5879263, 0, 0.5607843, 1, 1,
0.1975893, 0.6343544, 0.7909073, 0, 0.5568628, 1, 1,
0.1982529, -2.017586, 4.035075, 0, 0.5490196, 1, 1,
0.1998011, 1.334103, -0.5372776, 0, 0.5450981, 1, 1,
0.210054, 0.6911521, 1.110922, 0, 0.5372549, 1, 1,
0.2109557, 0.7692795, -0.6622449, 0, 0.5333334, 1, 1,
0.2151229, 0.254408, 1.17332, 0, 0.5254902, 1, 1,
0.2193936, -0.3514297, 1.420028, 0, 0.5215687, 1, 1,
0.2208752, -0.08955429, 1.192856, 0, 0.5137255, 1, 1,
0.2209101, 0.4171182, -0.2242173, 0, 0.509804, 1, 1,
0.2257848, 1.553963, -0.5185058, 0, 0.5019608, 1, 1,
0.2379119, -0.5544723, 0.7090759, 0, 0.4941176, 1, 1,
0.238511, 0.5978747, 0.5529907, 0, 0.4901961, 1, 1,
0.2402252, -1.789428, 2.500861, 0, 0.4823529, 1, 1,
0.2413188, -0.4691701, 3.20357, 0, 0.4784314, 1, 1,
0.2511329, -0.6650146, 3.116077, 0, 0.4705882, 1, 1,
0.2512604, -0.1599574, 2.657654, 0, 0.4666667, 1, 1,
0.2578655, 0.4500692, -0.3309811, 0, 0.4588235, 1, 1,
0.2629076, -0.08587195, 3.228349, 0, 0.454902, 1, 1,
0.2655551, 1.36891, 0.638892, 0, 0.4470588, 1, 1,
0.2655889, -0.1989683, 3.331304, 0, 0.4431373, 1, 1,
0.2674906, 1.745497, 2.149268, 0, 0.4352941, 1, 1,
0.2688994, 1.880632, -0.5497373, 0, 0.4313726, 1, 1,
0.2713982, 1.060513, -2.803526, 0, 0.4235294, 1, 1,
0.274444, 0.4003763, 0.5267935, 0, 0.4196078, 1, 1,
0.2747345, 1.230681, -0.6575928, 0, 0.4117647, 1, 1,
0.2755401, 1.74225, 0.1948583, 0, 0.4078431, 1, 1,
0.2766982, 1.496096, -0.7991077, 0, 0.4, 1, 1,
0.2767383, 0.1843569, 1.582222, 0, 0.3921569, 1, 1,
0.2771036, 0.3920552, 0.665321, 0, 0.3882353, 1, 1,
0.2780088, 0.3117934, 0.7996069, 0, 0.3803922, 1, 1,
0.2832383, 1.618077, -0.06372136, 0, 0.3764706, 1, 1,
0.2886013, 0.8043467, -0.2220832, 0, 0.3686275, 1, 1,
0.2910196, 1.217136, 2.654542, 0, 0.3647059, 1, 1,
0.2963067, -0.3124352, 2.108082, 0, 0.3568628, 1, 1,
0.2963082, 0.0007695903, 0.5560208, 0, 0.3529412, 1, 1,
0.29786, -1.222849, 2.693686, 0, 0.345098, 1, 1,
0.2991602, 0.2835123, 1.017377, 0, 0.3411765, 1, 1,
0.3029138, -0.594129, 2.55616, 0, 0.3333333, 1, 1,
0.3038463, 0.5886182, 1.059211, 0, 0.3294118, 1, 1,
0.3113161, -1.454644, 3.068985, 0, 0.3215686, 1, 1,
0.3118687, -0.5784877, 2.220563, 0, 0.3176471, 1, 1,
0.3153261, -1.862092, 2.596875, 0, 0.3098039, 1, 1,
0.3172239, -0.02552045, 1.686316, 0, 0.3058824, 1, 1,
0.3183114, -0.9585333, 3.605255, 0, 0.2980392, 1, 1,
0.3218961, 0.4240893, 1.946169, 0, 0.2901961, 1, 1,
0.3225029, -1.66391, 1.905915, 0, 0.2862745, 1, 1,
0.325473, 0.4798804, -0.1580084, 0, 0.2784314, 1, 1,
0.3267528, -0.8540359, 2.633676, 0, 0.2745098, 1, 1,
0.3434982, -0.1000084, 2.721751, 0, 0.2666667, 1, 1,
0.3449937, 0.9521601, -0.5597901, 0, 0.2627451, 1, 1,
0.3482017, -2.690974, 3.998356, 0, 0.254902, 1, 1,
0.3543977, -1.268543, 2.672742, 0, 0.2509804, 1, 1,
0.3556011, 0.3639253, 2.147966, 0, 0.2431373, 1, 1,
0.356355, -1.825691, 3.843359, 0, 0.2392157, 1, 1,
0.3594966, 0.9694059, 1.070852, 0, 0.2313726, 1, 1,
0.3602076, 0.5274058, 1.135685, 0, 0.227451, 1, 1,
0.3630196, 0.1535303, 2.653021, 0, 0.2196078, 1, 1,
0.3647223, -0.8113121, 1.946475, 0, 0.2156863, 1, 1,
0.3649833, -1.159758, 1.158024, 0, 0.2078431, 1, 1,
0.3698919, -0.1708629, 1.040153, 0, 0.2039216, 1, 1,
0.3715087, 0.06432158, 2.265077, 0, 0.1960784, 1, 1,
0.3734215, 0.6259621, -1.738848, 0, 0.1882353, 1, 1,
0.3795104, 0.7670196, 0.5029528, 0, 0.1843137, 1, 1,
0.3854126, -0.2732705, 1.249271, 0, 0.1764706, 1, 1,
0.3893334, 0.1993865, 2.168959, 0, 0.172549, 1, 1,
0.3905575, 0.8179526, -0.4102468, 0, 0.1647059, 1, 1,
0.3907922, -3.050968, 3.88151, 0, 0.1607843, 1, 1,
0.3962871, -0.9335436, 1.714544, 0, 0.1529412, 1, 1,
0.3975166, 0.887226, -0.1365446, 0, 0.1490196, 1, 1,
0.399429, -1.403433, 2.950366, 0, 0.1411765, 1, 1,
0.3997688, 0.565382, 0.8083544, 0, 0.1372549, 1, 1,
0.3999397, 0.6309867, 1.028744, 0, 0.1294118, 1, 1,
0.4005365, -0.4046721, 1.421881, 0, 0.1254902, 1, 1,
0.4022301, -0.6926938, 3.049746, 0, 0.1176471, 1, 1,
0.4069535, -2.540094, 2.086955, 0, 0.1137255, 1, 1,
0.4080032, -1.000674, 3.971575, 0, 0.1058824, 1, 1,
0.4085135, -0.09945214, 2.175803, 0, 0.09803922, 1, 1,
0.4094722, -1.101792, 1.073777, 0, 0.09411765, 1, 1,
0.4235251, -1.123386, 3.177627, 0, 0.08627451, 1, 1,
0.4277521, 0.3181321, 1.477726, 0, 0.08235294, 1, 1,
0.4279852, -2.064166, 2.919412, 0, 0.07450981, 1, 1,
0.4302589, 1.788593, -1.735947, 0, 0.07058824, 1, 1,
0.4313765, 0.3316222, -0.4677849, 0, 0.0627451, 1, 1,
0.4320638, 0.5504538, 0.8143814, 0, 0.05882353, 1, 1,
0.4358832, -1.062853, 3.01616, 0, 0.05098039, 1, 1,
0.4406201, 0.4774995, 1.074438, 0, 0.04705882, 1, 1,
0.4434051, 0.09931812, 2.054606, 0, 0.03921569, 1, 1,
0.4444035, -0.003208244, 1.484173, 0, 0.03529412, 1, 1,
0.4456892, -1.809071, 2.723935, 0, 0.02745098, 1, 1,
0.4457867, 0.6176166, 1.502976, 0, 0.02352941, 1, 1,
0.4459846, -0.1518425, 1.452132, 0, 0.01568628, 1, 1,
0.4471202, 1.059148, -0.8196091, 0, 0.01176471, 1, 1,
0.4493247, -1.523381, 3.844772, 0, 0.003921569, 1, 1,
0.450601, -0.4179192, 3.441901, 0.003921569, 0, 1, 1,
0.4528317, 1.151735, -1.084847, 0.007843138, 0, 1, 1,
0.4528743, 0.09690274, 3.548095, 0.01568628, 0, 1, 1,
0.454185, -0.5193444, 0.7138184, 0.01960784, 0, 1, 1,
0.4545237, 0.7464734, 0.02639407, 0.02745098, 0, 1, 1,
0.4552566, -0.1972282, 0.8022818, 0.03137255, 0, 1, 1,
0.4645242, 1.462531, 1.917535, 0.03921569, 0, 1, 1,
0.4658724, -0.780112, 1.971152, 0.04313726, 0, 1, 1,
0.4704451, -1.384618, 3.207634, 0.05098039, 0, 1, 1,
0.4732749, 1.966878, 0.6456329, 0.05490196, 0, 1, 1,
0.4756192, -1.507729, 1.832419, 0.0627451, 0, 1, 1,
0.4779829, 0.09132413, 1.136432, 0.06666667, 0, 1, 1,
0.4782659, 0.6157378, 0.2203301, 0.07450981, 0, 1, 1,
0.4787703, 1.290195, 3.695214, 0.07843138, 0, 1, 1,
0.4881446, -1.991993, 3.16735, 0.08627451, 0, 1, 1,
0.49091, -0.167292, 2.714167, 0.09019608, 0, 1, 1,
0.4943872, 0.9537495, 1.023042, 0.09803922, 0, 1, 1,
0.4955481, -0.9463996, 3.069166, 0.1058824, 0, 1, 1,
0.5002015, 0.4863054, 1.522251, 0.1098039, 0, 1, 1,
0.5076315, 0.9446303, -0.4233952, 0.1176471, 0, 1, 1,
0.5089048, 0.2878579, 2.911449, 0.1215686, 0, 1, 1,
0.5133871, 0.8041654, -1.717712, 0.1294118, 0, 1, 1,
0.5136803, 0.4657198, 2.226578, 0.1333333, 0, 1, 1,
0.5138394, -1.042883, 4.038068, 0.1411765, 0, 1, 1,
0.5169229, 2.020038, -2.357087, 0.145098, 0, 1, 1,
0.5202055, -2.905288, 3.272534, 0.1529412, 0, 1, 1,
0.5207779, 0.04987237, 0.9477928, 0.1568628, 0, 1, 1,
0.5260271, 0.7957966, 0.4029812, 0.1647059, 0, 1, 1,
0.5332786, -0.7711132, 3.182465, 0.1686275, 0, 1, 1,
0.5347353, 0.5314456, 1.057818, 0.1764706, 0, 1, 1,
0.5362933, -1.446476, 3.343898, 0.1803922, 0, 1, 1,
0.5377761, 1.143052, -0.4858595, 0.1882353, 0, 1, 1,
0.5461705, -0.8836803, 2.154601, 0.1921569, 0, 1, 1,
0.5477833, -1.251687, 2.952581, 0.2, 0, 1, 1,
0.54905, 0.2868189, 0.8947152, 0.2078431, 0, 1, 1,
0.5524349, -0.3555464, 2.045415, 0.2117647, 0, 1, 1,
0.5563055, -0.9476882, 3.061055, 0.2196078, 0, 1, 1,
0.5594202, 0.3847362, 1.102368, 0.2235294, 0, 1, 1,
0.5624805, 0.3197122, -0.5223415, 0.2313726, 0, 1, 1,
0.5658494, -0.7710235, 2.887379, 0.2352941, 0, 1, 1,
0.5699946, 0.1166555, 1.167215, 0.2431373, 0, 1, 1,
0.5702792, -0.2232568, 2.091038, 0.2470588, 0, 1, 1,
0.5712449, 0.2811897, 2.749, 0.254902, 0, 1, 1,
0.5718309, 0.4417066, 1.357705, 0.2588235, 0, 1, 1,
0.5720681, -1.010972, 3.697262, 0.2666667, 0, 1, 1,
0.5756635, -1.484156, 5.26861, 0.2705882, 0, 1, 1,
0.5779052, -1.419811, 3.004935, 0.2784314, 0, 1, 1,
0.5785388, 0.6624539, 0.1874728, 0.282353, 0, 1, 1,
0.5811907, 0.1830086, 1.952726, 0.2901961, 0, 1, 1,
0.5863291, 0.3301224, 1.622094, 0.2941177, 0, 1, 1,
0.5869514, 0.550966, 1.842206, 0.3019608, 0, 1, 1,
0.5896617, 0.6348615, -0.5087186, 0.3098039, 0, 1, 1,
0.5951421, 0.5218132, -0.5156783, 0.3137255, 0, 1, 1,
0.6023028, -0.7975345, 3.769622, 0.3215686, 0, 1, 1,
0.6100243, 1.252847, 0.4750462, 0.3254902, 0, 1, 1,
0.6105438, -0.4262467, 1.482668, 0.3333333, 0, 1, 1,
0.6144781, -0.2434055, 2.610646, 0.3372549, 0, 1, 1,
0.6301668, 0.1019875, 1.581356, 0.345098, 0, 1, 1,
0.6318439, 0.5450769, 0.9714976, 0.3490196, 0, 1, 1,
0.6355427, -0.5737725, 3.960194, 0.3568628, 0, 1, 1,
0.6389729, 0.8800956, -0.2407985, 0.3607843, 0, 1, 1,
0.6437616, -0.3758345, 1.119109, 0.3686275, 0, 1, 1,
0.6527808, -0.2101157, 2.508272, 0.372549, 0, 1, 1,
0.6587589, 0.5443233, -0.6677697, 0.3803922, 0, 1, 1,
0.6776313, 0.3186047, 0.6706882, 0.3843137, 0, 1, 1,
0.6788127, 0.7783395, 1.394739, 0.3921569, 0, 1, 1,
0.683203, -0.3519028, 2.420613, 0.3960784, 0, 1, 1,
0.6891881, -1.291019, 2.33768, 0.4039216, 0, 1, 1,
0.692987, 1.19585, 0.5092987, 0.4117647, 0, 1, 1,
0.6935959, -0.06093866, 1.660294, 0.4156863, 0, 1, 1,
0.6945099, 0.7524006, 0.9179147, 0.4235294, 0, 1, 1,
0.696602, 1.09792, -0.1345103, 0.427451, 0, 1, 1,
0.7004557, 1.433493, 1.211777, 0.4352941, 0, 1, 1,
0.7014873, 0.9784304, 0.1709814, 0.4392157, 0, 1, 1,
0.7015567, -0.9804636, 2.526826, 0.4470588, 0, 1, 1,
0.7048674, -1.054789e-05, 2.293067, 0.4509804, 0, 1, 1,
0.7070686, -1.363041, 4.390833, 0.4588235, 0, 1, 1,
0.7071021, -0.8660546, 3.556801, 0.4627451, 0, 1, 1,
0.7085796, 1.099823, 0.8563487, 0.4705882, 0, 1, 1,
0.7215539, -0.1331581, 1.873814, 0.4745098, 0, 1, 1,
0.7243522, -1.228443, 1.104185, 0.4823529, 0, 1, 1,
0.7252066, 0.03399739, 0.6701794, 0.4862745, 0, 1, 1,
0.7269131, 0.8005088, 2.218049, 0.4941176, 0, 1, 1,
0.7287901, -2.2329, 2.923643, 0.5019608, 0, 1, 1,
0.7317854, 1.010594, 0.5462819, 0.5058824, 0, 1, 1,
0.7383485, 0.2126978, 1.898197, 0.5137255, 0, 1, 1,
0.7419093, -0.7353783, 2.320856, 0.5176471, 0, 1, 1,
0.7443246, -0.2964581, 3.248589, 0.5254902, 0, 1, 1,
0.7458142, -0.1262362, 2.080506, 0.5294118, 0, 1, 1,
0.7458431, 1.005234, 0.2638884, 0.5372549, 0, 1, 1,
0.7494878, -1.134322, 2.001497, 0.5411765, 0, 1, 1,
0.7498454, 1.319097, 0.7946777, 0.5490196, 0, 1, 1,
0.7559054, 0.6978942, 1.478479, 0.5529412, 0, 1, 1,
0.7573473, -1.151245, 2.634039, 0.5607843, 0, 1, 1,
0.7583615, 0.3421367, 1.229281, 0.5647059, 0, 1, 1,
0.7590555, 1.513424, -1.177777, 0.572549, 0, 1, 1,
0.7624112, 0.3136863, 0.4412429, 0.5764706, 0, 1, 1,
0.7725857, -0.274264, 0.9887107, 0.5843138, 0, 1, 1,
0.7735595, -0.667159, 2.29129, 0.5882353, 0, 1, 1,
0.7761533, -0.9551643, 3.075911, 0.5960785, 0, 1, 1,
0.7804512, -1.140625, 1.74944, 0.6039216, 0, 1, 1,
0.7828622, 0.2335697, 2.256701, 0.6078432, 0, 1, 1,
0.7858048, 2.386816, 0.4165936, 0.6156863, 0, 1, 1,
0.7871037, -0.01363839, 0.6087005, 0.6196079, 0, 1, 1,
0.793971, 0.3950325, 0.9525681, 0.627451, 0, 1, 1,
0.7960422, 0.4868663, 0.9301072, 0.6313726, 0, 1, 1,
0.7962602, -0.4235281, 1.781178, 0.6392157, 0, 1, 1,
0.7966359, -0.1349448, 2.954207, 0.6431373, 0, 1, 1,
0.7981472, 2.615248, -1.461067, 0.6509804, 0, 1, 1,
0.8060071, 0.9924101, -1.30255, 0.654902, 0, 1, 1,
0.8091259, -0.4648391, 2.706207, 0.6627451, 0, 1, 1,
0.8109407, -0.1010632, 2.177032, 0.6666667, 0, 1, 1,
0.81137, 1.284761, 0.5631094, 0.6745098, 0, 1, 1,
0.81472, -0.4923432, 1.876091, 0.6784314, 0, 1, 1,
0.8188302, -0.2371675, 2.842724, 0.6862745, 0, 1, 1,
0.8246516, 0.4524015, 0.8799242, 0.6901961, 0, 1, 1,
0.8252964, 2.245601, 0.1963377, 0.6980392, 0, 1, 1,
0.8327065, 0.4543783, 0.7309273, 0.7058824, 0, 1, 1,
0.8328688, 0.4462112, 0.7184524, 0.7098039, 0, 1, 1,
0.8351645, 1.010685, 2.874442, 0.7176471, 0, 1, 1,
0.8355628, 2.058425, 0.09112438, 0.7215686, 0, 1, 1,
0.8358603, -1.798362, 1.888116, 0.7294118, 0, 1, 1,
0.8383488, -0.7563241, 0.3095331, 0.7333333, 0, 1, 1,
0.839937, 2.18874, 0.5361615, 0.7411765, 0, 1, 1,
0.8404294, -1.161059, 2.876805, 0.7450981, 0, 1, 1,
0.8526334, -0.6132048, 2.740999, 0.7529412, 0, 1, 1,
0.8531227, -1.214705, 3.32419, 0.7568628, 0, 1, 1,
0.8591481, 0.7059597, 1.398816, 0.7647059, 0, 1, 1,
0.8635672, -0.6440064, 2.120162, 0.7686275, 0, 1, 1,
0.8664987, -1.310912, 2.631921, 0.7764706, 0, 1, 1,
0.8679168, -1.788858, 2.842897, 0.7803922, 0, 1, 1,
0.8751938, -0.2903841, 0.8051592, 0.7882353, 0, 1, 1,
0.8753483, -0.6239668, 1.618651, 0.7921569, 0, 1, 1,
0.8925706, -0.2290798, 2.738737, 0.8, 0, 1, 1,
0.8997683, 1.239321, 2.769036, 0.8078431, 0, 1, 1,
0.9005737, 0.7048648, 2.528798, 0.8117647, 0, 1, 1,
0.9031107, -0.7788678, 3.29451, 0.8196079, 0, 1, 1,
0.9038402, 1.360693, 0.2007885, 0.8235294, 0, 1, 1,
0.9039733, 0.08296507, 0.8137958, 0.8313726, 0, 1, 1,
0.9060047, 0.5473726, 1.431223, 0.8352941, 0, 1, 1,
0.9131582, -1.719427, 3.271463, 0.8431373, 0, 1, 1,
0.9207913, -0.4826194, 2.08622, 0.8470588, 0, 1, 1,
0.9226277, -0.06136049, 2.559434, 0.854902, 0, 1, 1,
0.9285859, 0.7111878, 0.722182, 0.8588235, 0, 1, 1,
0.9363129, 1.587736, 0.02204535, 0.8666667, 0, 1, 1,
0.936649, 0.9270846, 2.01182, 0.8705882, 0, 1, 1,
0.9511084, 0.1638779, 2.951861, 0.8784314, 0, 1, 1,
0.9527637, 1.085869, -0.3216755, 0.8823529, 0, 1, 1,
0.9530382, 0.1502682, 0.5622885, 0.8901961, 0, 1, 1,
0.9540532, 0.3301199, 1.509275, 0.8941177, 0, 1, 1,
0.9542091, 1.514407, 0.229552, 0.9019608, 0, 1, 1,
0.9604629, -0.2197627, 0.3795311, 0.9098039, 0, 1, 1,
0.9642113, 0.7267071, -0.4084047, 0.9137255, 0, 1, 1,
0.9668248, -0.5527772, 4.05275, 0.9215686, 0, 1, 1,
0.9676582, -1.246444, 1.898892, 0.9254902, 0, 1, 1,
0.9688117, 0.2519203, 0.3110177, 0.9333333, 0, 1, 1,
0.9724023, 0.4207271, 0.9602654, 0.9372549, 0, 1, 1,
0.9783329, -1.045493, 2.84226, 0.945098, 0, 1, 1,
0.9814503, -0.9012657, 2.159769, 0.9490196, 0, 1, 1,
0.9820726, 1.287336, -1.339622, 0.9568627, 0, 1, 1,
0.9822419, -0.6462946, 0.4007711, 0.9607843, 0, 1, 1,
0.9873782, 0.6631198, 1.98499, 0.9686275, 0, 1, 1,
0.989693, -0.1477423, 1.569199, 0.972549, 0, 1, 1,
1.001769, 1.333668, 1.920056, 0.9803922, 0, 1, 1,
1.008525, 1.072968, 0.4605046, 0.9843137, 0, 1, 1,
1.01759, 0.1104233, 1.5739, 0.9921569, 0, 1, 1,
1.020712, 0.4229651, 2.063498, 0.9960784, 0, 1, 1,
1.022084, 1.573095, -0.9625956, 1, 0, 0.9960784, 1,
1.022235, 0.1255299, 1.829007, 1, 0, 0.9882353, 1,
1.029433, -2.069825, 3.326567, 1, 0, 0.9843137, 1,
1.02959, 0.3951014, 0.08364572, 1, 0, 0.9764706, 1,
1.032184, 0.2342897, 0.9362311, 1, 0, 0.972549, 1,
1.034042, -0.01083742, 3.072533, 1, 0, 0.9647059, 1,
1.043588, -0.2561549, 1.901297, 1, 0, 0.9607843, 1,
1.049707, 1.092749, 1.36201, 1, 0, 0.9529412, 1,
1.057421, 1.044042, 0.7039173, 1, 0, 0.9490196, 1,
1.065788, 0.0001292568, 0.9423894, 1, 0, 0.9411765, 1,
1.06861, 0.9235964, 2.118272, 1, 0, 0.9372549, 1,
1.073397, -0.9285319, 1.645496, 1, 0, 0.9294118, 1,
1.080443, -0.8495343, 1.860262, 1, 0, 0.9254902, 1,
1.082468, -0.4021876, 1.868348, 1, 0, 0.9176471, 1,
1.088185, -2.923805, 1.919067, 1, 0, 0.9137255, 1,
1.094974, 0.1642328, 0.9526723, 1, 0, 0.9058824, 1,
1.096307, 1.63494, 0.4253513, 1, 0, 0.9019608, 1,
1.102103, -1.448058, 0.3101538, 1, 0, 0.8941177, 1,
1.111354, -0.3478841, 2.275645, 1, 0, 0.8862745, 1,
1.117564, 0.3957102, 2.445981, 1, 0, 0.8823529, 1,
1.11934, 0.8519261, 2.384424, 1, 0, 0.8745098, 1,
1.120959, 1.905169, -0.03945439, 1, 0, 0.8705882, 1,
1.122393, -1.18486, 2.835419, 1, 0, 0.8627451, 1,
1.122731, 1.161686, 2.125847, 1, 0, 0.8588235, 1,
1.127165, -0.8142136, 2.297008, 1, 0, 0.8509804, 1,
1.129051, -1.734911, 2.455194, 1, 0, 0.8470588, 1,
1.133465, 0.9097106, 0.04139556, 1, 0, 0.8392157, 1,
1.135134, 0.3895568, 0.1554891, 1, 0, 0.8352941, 1,
1.135636, 0.4766866, 2.236157, 1, 0, 0.827451, 1,
1.136614, -0.2901674, 2.494709, 1, 0, 0.8235294, 1,
1.143292, 0.2015124, 1.891534, 1, 0, 0.8156863, 1,
1.144646, 0.3694282, 0.2549021, 1, 0, 0.8117647, 1,
1.14604, 1.118252, -0.3381514, 1, 0, 0.8039216, 1,
1.147419, -1.766986, 2.597272, 1, 0, 0.7960784, 1,
1.152438, 0.196809, 3.165526, 1, 0, 0.7921569, 1,
1.153547, 1.393536, 0.305005, 1, 0, 0.7843137, 1,
1.193585, -0.5458036, 1.990244, 1, 0, 0.7803922, 1,
1.19524, -0.1625696, 2.348991, 1, 0, 0.772549, 1,
1.196686, 0.4765933, 2.353806, 1, 0, 0.7686275, 1,
1.196722, 0.4816267, 3.002578, 1, 0, 0.7607843, 1,
1.196811, -0.5136862, 2.318823, 1, 0, 0.7568628, 1,
1.210651, -0.2136943, 2.618713, 1, 0, 0.7490196, 1,
1.232344, 1.123168, -0.5680971, 1, 0, 0.7450981, 1,
1.241139, 0.3479792, 1.540047, 1, 0, 0.7372549, 1,
1.244814, 0.9474152, 0.6186526, 1, 0, 0.7333333, 1,
1.245795, 0.6174006, 0.3043082, 1, 0, 0.7254902, 1,
1.261455, 0.09258913, 2.734278, 1, 0, 0.7215686, 1,
1.263565, 0.4958386, 1.977422, 1, 0, 0.7137255, 1,
1.270484, 0.3903041, -0.5138742, 1, 0, 0.7098039, 1,
1.274639, -1.811569, 4.223224, 1, 0, 0.7019608, 1,
1.274845, -0.6243621, 1.332066, 1, 0, 0.6941177, 1,
1.279028, 0.001052314, 2.024607, 1, 0, 0.6901961, 1,
1.283015, 0.1807168, -0.09612507, 1, 0, 0.682353, 1,
1.285559, 0.9688454, 2.538199, 1, 0, 0.6784314, 1,
1.289892, 0.3159416, 1.235497, 1, 0, 0.6705883, 1,
1.291228, 0.8147005, 2.436104, 1, 0, 0.6666667, 1,
1.291453, 0.7214748, 1.252344, 1, 0, 0.6588235, 1,
1.297969, -1.353433, 1.978336, 1, 0, 0.654902, 1,
1.305419, 1.024945, 1.366735, 1, 0, 0.6470588, 1,
1.314031, -1.071785, 2.853972, 1, 0, 0.6431373, 1,
1.323737, -0.05632677, 1.914912, 1, 0, 0.6352941, 1,
1.330769, -0.02496947, 1.798342, 1, 0, 0.6313726, 1,
1.334693, 0.004620064, -0.1017132, 1, 0, 0.6235294, 1,
1.336339, -0.381436, 1.277255, 1, 0, 0.6196079, 1,
1.341206, 1.104852, 2.486371, 1, 0, 0.6117647, 1,
1.346013, -0.4610024, 0.1797666, 1, 0, 0.6078432, 1,
1.350616, 0.2681855, 1.632477, 1, 0, 0.6, 1,
1.355797, 0.9319214, -1.045865, 1, 0, 0.5921569, 1,
1.356611, -1.55207, 2.420102, 1, 0, 0.5882353, 1,
1.359411, 1.846619, 0.266816, 1, 0, 0.5803922, 1,
1.360132, 0.3922555, 0.9058028, 1, 0, 0.5764706, 1,
1.364553, 0.6980309, -0.4674318, 1, 0, 0.5686275, 1,
1.365659, -1.848228, 2.355118, 1, 0, 0.5647059, 1,
1.373575, 1.227445, 2.424242, 1, 0, 0.5568628, 1,
1.378471, -1.215348, 1.87082, 1, 0, 0.5529412, 1,
1.3788, -0.9758973, 1.75853, 1, 0, 0.5450981, 1,
1.383972, -0.08359621, 1.496733, 1, 0, 0.5411765, 1,
1.396533, -0.9836814, 2.287181, 1, 0, 0.5333334, 1,
1.404531, -0.3500028, 0.6925117, 1, 0, 0.5294118, 1,
1.406331, -0.9346565, 1.43264, 1, 0, 0.5215687, 1,
1.407203, 0.8966941, 0.5258649, 1, 0, 0.5176471, 1,
1.420864, -0.8281862, 2.30114, 1, 0, 0.509804, 1,
1.421417, 2.61968, 0.6204149, 1, 0, 0.5058824, 1,
1.424109, -1.413707, 2.716365, 1, 0, 0.4980392, 1,
1.432435, 0.4760124, 0.9740094, 1, 0, 0.4901961, 1,
1.433002, 0.7471926, -1.119628, 1, 0, 0.4862745, 1,
1.437027, 0.2464163, 1.882666, 1, 0, 0.4784314, 1,
1.440744, 1.157201, 0.8723366, 1, 0, 0.4745098, 1,
1.449126, -0.3976808, 3.426804, 1, 0, 0.4666667, 1,
1.45284, -1.425841, 2.255944, 1, 0, 0.4627451, 1,
1.460576, -1.968098, 2.64446, 1, 0, 0.454902, 1,
1.465549, -0.7168795, 3.127228, 1, 0, 0.4509804, 1,
1.466364, -0.01238623, 4.082601, 1, 0, 0.4431373, 1,
1.466653, 0.5872405, -0.04948821, 1, 0, 0.4392157, 1,
1.467395, -0.7442175, 2.638576, 1, 0, 0.4313726, 1,
1.476466, 1.073307, 0.1453117, 1, 0, 0.427451, 1,
1.480394, -0.6081353, 2.50597, 1, 0, 0.4196078, 1,
1.497656, 0.2418218, 0.8264273, 1, 0, 0.4156863, 1,
1.497789, 1.602419, -0.6048445, 1, 0, 0.4078431, 1,
1.499339, -0.07546628, 1.033376, 1, 0, 0.4039216, 1,
1.504741, 1.358651, 0.2064854, 1, 0, 0.3960784, 1,
1.507612, 0.9732149, 0.2076578, 1, 0, 0.3882353, 1,
1.516431, -0.9957512, 2.309711, 1, 0, 0.3843137, 1,
1.527467, -0.03580806, 2.594119, 1, 0, 0.3764706, 1,
1.527657, 1.189571, 0.9201856, 1, 0, 0.372549, 1,
1.529775, -0.9350413, 2.130528, 1, 0, 0.3647059, 1,
1.555704, 1.238991, -0.9475246, 1, 0, 0.3607843, 1,
1.562193, -0.3613333, 1.753487, 1, 0, 0.3529412, 1,
1.565944, 0.5208257, 1.650066, 1, 0, 0.3490196, 1,
1.567099, -0.8680045, 1.653421, 1, 0, 0.3411765, 1,
1.59048, 0.7820297, 1.009746, 1, 0, 0.3372549, 1,
1.590791, 0.4618585, 1.248983, 1, 0, 0.3294118, 1,
1.599785, -0.4385709, 0.4057017, 1, 0, 0.3254902, 1,
1.603046, -0.6549442, 3.172534, 1, 0, 0.3176471, 1,
1.607446, -1.202374, 2.532389, 1, 0, 0.3137255, 1,
1.613508, 1.110491, 0.6549467, 1, 0, 0.3058824, 1,
1.623605, 1.272167, 0.07758899, 1, 0, 0.2980392, 1,
1.626521, 0.6308913, 2.086414, 1, 0, 0.2941177, 1,
1.645878, 0.2508349, 0.4116295, 1, 0, 0.2862745, 1,
1.647006, 0.9122575, 1.04886, 1, 0, 0.282353, 1,
1.653919, -0.7847682, 3.210505, 1, 0, 0.2745098, 1,
1.660812, -0.1765529, -0.5741664, 1, 0, 0.2705882, 1,
1.666085, -1.918499, 1.826555, 1, 0, 0.2627451, 1,
1.673898, -1.005653, 1.19078, 1, 0, 0.2588235, 1,
1.675407, -0.4368735, 1.016653, 1, 0, 0.2509804, 1,
1.679777, -1.909175, 1.652785, 1, 0, 0.2470588, 1,
1.690224, 1.46235, 1.739136, 1, 0, 0.2392157, 1,
1.690263, 0.3179763, 2.840327, 1, 0, 0.2352941, 1,
1.690797, -1.207473, 0.5810729, 1, 0, 0.227451, 1,
1.698246, -0.04018544, 0.3966476, 1, 0, 0.2235294, 1,
1.706084, -0.5071307, 1.511658, 1, 0, 0.2156863, 1,
1.714635, -0.3322611, 2.384314, 1, 0, 0.2117647, 1,
1.719057, 0.532297, 0.7450475, 1, 0, 0.2039216, 1,
1.734241, -1.197582, 3.135814, 1, 0, 0.1960784, 1,
1.73566, 0.9026446, 1.062476, 1, 0, 0.1921569, 1,
1.799324, -1.491418, 3.520598, 1, 0, 0.1843137, 1,
1.808971, -1.772551, 4.001157, 1, 0, 0.1803922, 1,
1.832855, 0.7898188, 0.9163408, 1, 0, 0.172549, 1,
1.837328, 0.4253616, 3.231801, 1, 0, 0.1686275, 1,
1.854271, -0.6266872, 1.974855, 1, 0, 0.1607843, 1,
1.869453, 0.2049566, 1.257013, 1, 0, 0.1568628, 1,
1.871715, 0.6756842, 1.971898, 1, 0, 0.1490196, 1,
1.902784, 0.9915101, 0.2270828, 1, 0, 0.145098, 1,
1.91868, 1.219355, -0.6909738, 1, 0, 0.1372549, 1,
1.933688, 1.054653, 1.089449, 1, 0, 0.1333333, 1,
1.948413, 1.562995, 4.21073, 1, 0, 0.1254902, 1,
1.951972, -0.7421099, 1.210048, 1, 0, 0.1215686, 1,
1.954923, -0.1100852, 1.433268, 1, 0, 0.1137255, 1,
1.975221, -0.1410783, 1.598644, 1, 0, 0.1098039, 1,
1.97752, 1.716434, 0.7361786, 1, 0, 0.1019608, 1,
2.023995, -0.7631406, 1.84329, 1, 0, 0.09411765, 1,
2.033361, 1.978943, 1.942113, 1, 0, 0.09019608, 1,
2.06366, -0.1491241, 1.79221, 1, 0, 0.08235294, 1,
2.069347, 0.3227017, 0.8232043, 1, 0, 0.07843138, 1,
2.074463, 0.3592465, 2.192382, 1, 0, 0.07058824, 1,
2.088907, 0.9062803, 1.921867, 1, 0, 0.06666667, 1,
2.136261, 0.0750796, 2.319483, 1, 0, 0.05882353, 1,
2.169209, 1.309812, 1.297631, 1, 0, 0.05490196, 1,
2.307657, 0.6113074, 1.020166, 1, 0, 0.04705882, 1,
2.351247, 0.7942805, 0.2690829, 1, 0, 0.04313726, 1,
2.381287, -2.230823, 1.243956, 1, 0, 0.03529412, 1,
2.387091, -0.672644, 1.864028, 1, 0, 0.03137255, 1,
2.437683, 0.1468969, 2.73236, 1, 0, 0.02352941, 1,
2.452142, 1.264082, 0.8826642, 1, 0, 0.01960784, 1,
2.521772, -1.049381, -0.007665841, 1, 0, 0.01176471, 1,
2.620694, 0.6313246, 0.4361698, 1, 0, 0.007843138, 1
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
-0.3946615, -4.176349, -6.84163, 0, -0.5, 0.5, 0.5,
-0.3946615, -4.176349, -6.84163, 1, -0.5, 0.5, 0.5,
-0.3946615, -4.176349, -6.84163, 1, 1.5, 0.5, 0.5,
-0.3946615, -4.176349, -6.84163, 0, 1.5, 0.5, 0.5
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
-4.432222, 0.2687422, -6.84163, 0, -0.5, 0.5, 0.5,
-4.432222, 0.2687422, -6.84163, 1, -0.5, 0.5, 0.5,
-4.432222, 0.2687422, -6.84163, 1, 1.5, 0.5, 0.5,
-4.432222, 0.2687422, -6.84163, 0, 1.5, 0.5, 0.5
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
-4.432222, -4.176349, 0.09108114, 0, -0.5, 0.5, 0.5,
-4.432222, -4.176349, 0.09108114, 1, -0.5, 0.5, 0.5,
-4.432222, -4.176349, 0.09108114, 1, 1.5, 0.5, 0.5,
-4.432222, -4.176349, 0.09108114, 0, 1.5, 0.5, 0.5
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
-3, -3.150559, -5.241774,
2, -3.150559, -5.241774,
-3, -3.150559, -5.241774,
-3, -3.321524, -5.508416,
-2, -3.150559, -5.241774,
-2, -3.321524, -5.508416,
-1, -3.150559, -5.241774,
-1, -3.321524, -5.508416,
0, -3.150559, -5.241774,
0, -3.321524, -5.508416,
1, -3.150559, -5.241774,
1, -3.321524, -5.508416,
2, -3.150559, -5.241774,
2, -3.321524, -5.508416
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
-3, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
-3, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
-3, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
-3, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5,
-2, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
-2, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
-2, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
-2, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5,
-1, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
-1, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
-1, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
-1, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5,
0, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
0, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
0, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
0, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5,
1, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
1, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
1, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
1, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5,
2, -3.663454, -6.041702, 0, -0.5, 0.5, 0.5,
2, -3.663454, -6.041702, 1, -0.5, 0.5, 0.5,
2, -3.663454, -6.041702, 1, 1.5, 0.5, 0.5,
2, -3.663454, -6.041702, 0, 1.5, 0.5, 0.5
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
-3.500478, -3, -5.241774,
-3.500478, 3, -5.241774,
-3.500478, -3, -5.241774,
-3.655768, -3, -5.508416,
-3.500478, -2, -5.241774,
-3.655768, -2, -5.508416,
-3.500478, -1, -5.241774,
-3.655768, -1, -5.508416,
-3.500478, 0, -5.241774,
-3.655768, 0, -5.508416,
-3.500478, 1, -5.241774,
-3.655768, 1, -5.508416,
-3.500478, 2, -5.241774,
-3.655768, 2, -5.508416,
-3.500478, 3, -5.241774,
-3.655768, 3, -5.508416
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
-3.96635, -3, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, -3, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, -3, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, -3, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, -2, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, -2, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, -2, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, -2, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, -1, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, -1, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, -1, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, -1, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, 0, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, 0, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, 0, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, 0, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, 1, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, 1, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, 1, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, 1, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, 2, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, 2, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, 2, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, 2, -6.041702, 0, 1.5, 0.5, 0.5,
-3.96635, 3, -6.041702, 0, -0.5, 0.5, 0.5,
-3.96635, 3, -6.041702, 1, -0.5, 0.5, 0.5,
-3.96635, 3, -6.041702, 1, 1.5, 0.5, 0.5,
-3.96635, 3, -6.041702, 0, 1.5, 0.5, 0.5
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
-3.500478, -3.150559, -4,
-3.500478, -3.150559, 4,
-3.500478, -3.150559, -4,
-3.655768, -3.321524, -4,
-3.500478, -3.150559, -2,
-3.655768, -3.321524, -2,
-3.500478, -3.150559, 0,
-3.655768, -3.321524, 0,
-3.500478, -3.150559, 2,
-3.655768, -3.321524, 2,
-3.500478, -3.150559, 4,
-3.655768, -3.321524, 4
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
-3.96635, -3.663454, -4, 0, -0.5, 0.5, 0.5,
-3.96635, -3.663454, -4, 1, -0.5, 0.5, 0.5,
-3.96635, -3.663454, -4, 1, 1.5, 0.5, 0.5,
-3.96635, -3.663454, -4, 0, 1.5, 0.5, 0.5,
-3.96635, -3.663454, -2, 0, -0.5, 0.5, 0.5,
-3.96635, -3.663454, -2, 1, -0.5, 0.5, 0.5,
-3.96635, -3.663454, -2, 1, 1.5, 0.5, 0.5,
-3.96635, -3.663454, -2, 0, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 0, 0, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 0, 1, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 0, 1, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 0, 0, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 2, 0, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 2, 1, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 2, 1, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 2, 0, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 4, 0, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 4, 1, -0.5, 0.5, 0.5,
-3.96635, -3.663454, 4, 1, 1.5, 0.5, 0.5,
-3.96635, -3.663454, 4, 0, 1.5, 0.5, 0.5
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
-3.500478, -3.150559, -5.241774,
-3.500478, 3.688043, -5.241774,
-3.500478, -3.150559, 5.423936,
-3.500478, 3.688043, 5.423936,
-3.500478, -3.150559, -5.241774,
-3.500478, -3.150559, 5.423936,
-3.500478, 3.688043, -5.241774,
-3.500478, 3.688043, 5.423936,
-3.500478, -3.150559, -5.241774,
2.711155, -3.150559, -5.241774,
-3.500478, -3.150559, 5.423936,
2.711155, -3.150559, 5.423936,
-3.500478, 3.688043, -5.241774,
2.711155, 3.688043, -5.241774,
-3.500478, 3.688043, 5.423936,
2.711155, 3.688043, 5.423936,
2.711155, -3.150559, -5.241774,
2.711155, 3.688043, -5.241774,
2.711155, -3.150559, 5.423936,
2.711155, 3.688043, 5.423936,
2.711155, -3.150559, -5.241774,
2.711155, -3.150559, 5.423936,
2.711155, 3.688043, -5.241774,
2.711155, 3.688043, 5.423936
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
var radius = 7.534771;
var distance = 33.52305;
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
mvMatrix.translate( 0.3946615, -0.2687422, -0.09108114 );
mvMatrix.scale( 1.31153, 1.191288, 0.7638256 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52305);
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


