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
-3.515421, -0.7366735, -0.4586445, 1, 0, 0, 1,
-3.43604, -0.04047599, 0.6883397, 1, 0.007843138, 0, 1,
-3.308578, -0.906257, -1.021458, 1, 0.01176471, 0, 1,
-2.864053, -0.1123441, -1.936075, 1, 0.01960784, 0, 1,
-2.855687, 0.1468744, -0.4449486, 1, 0.02352941, 0, 1,
-2.853829, 0.7799931, -1.404608, 1, 0.03137255, 0, 1,
-2.825425, -0.4410525, -0.4216797, 1, 0.03529412, 0, 1,
-2.527413, 0.06980179, -1.934981, 1, 0.04313726, 0, 1,
-2.490325, -1.307035, -2.122687, 1, 0.04705882, 0, 1,
-2.33447, -1.645265, -1.125707, 1, 0.05490196, 0, 1,
-2.290989, 0.7940333, -1.446321, 1, 0.05882353, 0, 1,
-2.274933, -1.209798, -1.465157, 1, 0.06666667, 0, 1,
-2.178955, 0.4925594, -3.515149, 1, 0.07058824, 0, 1,
-2.164521, 0.4677306, -1.655851, 1, 0.07843138, 0, 1,
-2.140327, 0.7397079, -1.383488, 1, 0.08235294, 0, 1,
-2.091209, 1.482853, -2.685937, 1, 0.09019608, 0, 1,
-2.054097, 0.4115022, 0.1859002, 1, 0.09411765, 0, 1,
-2.01726, -0.0875102, -2.228135, 1, 0.1019608, 0, 1,
-2.009488, -0.3404167, -0.1630841, 1, 0.1098039, 0, 1,
-2.00872, -1.843171, -2.032795, 1, 0.1137255, 0, 1,
-1.998939, 2.073491, -1.121146, 1, 0.1215686, 0, 1,
-1.977512, 0.1004239, -1.491345, 1, 0.1254902, 0, 1,
-1.976496, 0.00869968, 1.046331, 1, 0.1333333, 0, 1,
-1.967063, -2.120365, -3.995935, 1, 0.1372549, 0, 1,
-1.966094, -1.508479, -3.008383, 1, 0.145098, 0, 1,
-1.954424, 0.3900273, -2.484458, 1, 0.1490196, 0, 1,
-1.927539, -1.676208, -2.56233, 1, 0.1568628, 0, 1,
-1.921912, 1.512318, -0.9751163, 1, 0.1607843, 0, 1,
-1.869263, -0.4670498, -1.722511, 1, 0.1686275, 0, 1,
-1.86368, 0.4323545, -1.261424, 1, 0.172549, 0, 1,
-1.838337, 0.2085839, -2.192966, 1, 0.1803922, 0, 1,
-1.831758, -0.828095, 0.7707251, 1, 0.1843137, 0, 1,
-1.800631, 0.8621079, -0.6950556, 1, 0.1921569, 0, 1,
-1.796756, -1.360741, -2.42425, 1, 0.1960784, 0, 1,
-1.789348, 0.916487, -1.864709, 1, 0.2039216, 0, 1,
-1.777484, -0.4567803, -2.6542, 1, 0.2117647, 0, 1,
-1.775423, 0.3497854, -0.799201, 1, 0.2156863, 0, 1,
-1.774527, -0.7004399, -0.9762212, 1, 0.2235294, 0, 1,
-1.763693, -0.897341, -2.776106, 1, 0.227451, 0, 1,
-1.748952, 0.4512973, -1.823269, 1, 0.2352941, 0, 1,
-1.743634, 0.09544614, -1.010469, 1, 0.2392157, 0, 1,
-1.738384, 1.239952, -0.9445436, 1, 0.2470588, 0, 1,
-1.700697, -0.6220847, -1.83108, 1, 0.2509804, 0, 1,
-1.689777, 0.527832, -1.575789, 1, 0.2588235, 0, 1,
-1.686895, -0.4150441, -1.723094, 1, 0.2627451, 0, 1,
-1.683121, 0.1136197, -2.913733, 1, 0.2705882, 0, 1,
-1.678018, -0.8297766, 0.06470373, 1, 0.2745098, 0, 1,
-1.664255, 1.588558, 1.073337, 1, 0.282353, 0, 1,
-1.659854, 0.8131142, -1.960471, 1, 0.2862745, 0, 1,
-1.656529, 1.719649, -1.717175, 1, 0.2941177, 0, 1,
-1.654496, -0.230178, -0.5845866, 1, 0.3019608, 0, 1,
-1.647967, 0.895063, 0.4554762, 1, 0.3058824, 0, 1,
-1.644464, -0.4765916, -3.027847, 1, 0.3137255, 0, 1,
-1.643941, -0.1794574, -1.66723, 1, 0.3176471, 0, 1,
-1.639238, -1.30792, -2.079218, 1, 0.3254902, 0, 1,
-1.634383, 0.2818139, -1.480359, 1, 0.3294118, 0, 1,
-1.615622, 0.910162, -0.8155466, 1, 0.3372549, 0, 1,
-1.573294, 1.122034, -0.44239, 1, 0.3411765, 0, 1,
-1.57105, -0.7397138, -3.083801, 1, 0.3490196, 0, 1,
-1.530074, 0.5281017, -0.6710783, 1, 0.3529412, 0, 1,
-1.528832, 0.6051136, -0.8453075, 1, 0.3607843, 0, 1,
-1.525223, 1.688481, -1.181641, 1, 0.3647059, 0, 1,
-1.511934, 1.45465, -0.2127375, 1, 0.372549, 0, 1,
-1.498207, -0.5060497, -2.157935, 1, 0.3764706, 0, 1,
-1.49665, -1.368105, -4.413827, 1, 0.3843137, 0, 1,
-1.470102, 2.139215, 0.03132709, 1, 0.3882353, 0, 1,
-1.463332, -0.3625201, -2.306237, 1, 0.3960784, 0, 1,
-1.462549, -0.280602, -0.8131084, 1, 0.4039216, 0, 1,
-1.455302, 0.687385, -0.8164893, 1, 0.4078431, 0, 1,
-1.450706, 0.5880493, -1.217795, 1, 0.4156863, 0, 1,
-1.448747, 1.457682, 0.6120756, 1, 0.4196078, 0, 1,
-1.448735, -0.3335041, -3.649169, 1, 0.427451, 0, 1,
-1.438642, -0.8188562, -2.65304, 1, 0.4313726, 0, 1,
-1.425997, 0.6680623, -1.075044, 1, 0.4392157, 0, 1,
-1.423339, -0.4515876, -1.289213, 1, 0.4431373, 0, 1,
-1.420005, 0.123457, -2.895316, 1, 0.4509804, 0, 1,
-1.416135, 0.1517863, -0.8791916, 1, 0.454902, 0, 1,
-1.410238, -0.9393894, -1.120095, 1, 0.4627451, 0, 1,
-1.397924, -0.9500293, -0.1399164, 1, 0.4666667, 0, 1,
-1.393702, -1.471249, -0.9536751, 1, 0.4745098, 0, 1,
-1.385431, 0.179002, -1.80848, 1, 0.4784314, 0, 1,
-1.382821, -0.04357324, -2.308838, 1, 0.4862745, 0, 1,
-1.3538, 1.523224, -0.8363602, 1, 0.4901961, 0, 1,
-1.349038, 0.9294729, -1.325052, 1, 0.4980392, 0, 1,
-1.348491, 0.02350798, -1.577109, 1, 0.5058824, 0, 1,
-1.346711, -0.7054338, -1.569512, 1, 0.509804, 0, 1,
-1.340696, -0.6044265, -2.603013, 1, 0.5176471, 0, 1,
-1.340238, -0.160543, -0.9900565, 1, 0.5215687, 0, 1,
-1.320039, -0.05915704, -1.144272, 1, 0.5294118, 0, 1,
-1.319334, 1.843316, -1.586671, 1, 0.5333334, 0, 1,
-1.318441, 0.3174725, -1.733775, 1, 0.5411765, 0, 1,
-1.314415, 0.8098323, -0.4029957, 1, 0.5450981, 0, 1,
-1.302511, 0.922282, -0.3110331, 1, 0.5529412, 0, 1,
-1.302087, 0.6384616, -2.670788, 1, 0.5568628, 0, 1,
-1.288254, -1.274208, -0.9482456, 1, 0.5647059, 0, 1,
-1.288195, -0.2529852, -2.502954, 1, 0.5686275, 0, 1,
-1.272613, 0.1717462, -0.8561267, 1, 0.5764706, 0, 1,
-1.272155, -0.8177697, -1.171262, 1, 0.5803922, 0, 1,
-1.263485, 3.038663, -1.219977, 1, 0.5882353, 0, 1,
-1.262697, 1.162198, 0.405453, 1, 0.5921569, 0, 1,
-1.262226, 0.8297814, -0.821816, 1, 0.6, 0, 1,
-1.262167, -1.651867, -2.489059, 1, 0.6078432, 0, 1,
-1.24725, 0.3625393, -1.03731, 1, 0.6117647, 0, 1,
-1.236195, -0.9440602, -3.257821, 1, 0.6196079, 0, 1,
-1.225594, -0.2461522, -0.8566375, 1, 0.6235294, 0, 1,
-1.221422, 0.6177762, -0.7667247, 1, 0.6313726, 0, 1,
-1.220117, 0.4802368, -4.024513, 1, 0.6352941, 0, 1,
-1.219187, -0.02680127, -1.273992, 1, 0.6431373, 0, 1,
-1.210772, -0.4379823, -1.969084, 1, 0.6470588, 0, 1,
-1.205102, -0.138807, -2.640233, 1, 0.654902, 0, 1,
-1.197645, -1.028355, -3.206569, 1, 0.6588235, 0, 1,
-1.19144, 1.778674, -0.6213837, 1, 0.6666667, 0, 1,
-1.189666, -0.856079, -1.022341, 1, 0.6705883, 0, 1,
-1.185446, 0.7380551, -0.7514701, 1, 0.6784314, 0, 1,
-1.18125, -0.5304859, -1.926711, 1, 0.682353, 0, 1,
-1.177592, -0.5142764, -1.656418, 1, 0.6901961, 0, 1,
-1.174609, -0.5714381, 0.03478572, 1, 0.6941177, 0, 1,
-1.17387, -0.3255076, -2.322037, 1, 0.7019608, 0, 1,
-1.173067, -0.3565466, -0.6633362, 1, 0.7098039, 0, 1,
-1.160827, 0.3367009, -2.77514, 1, 0.7137255, 0, 1,
-1.157626, 1.286113, -0.06353531, 1, 0.7215686, 0, 1,
-1.150949, 0.8561066, -1.389882, 1, 0.7254902, 0, 1,
-1.147577, 0.4061444, -1.874493, 1, 0.7333333, 0, 1,
-1.147281, 1.15342, -1.073936, 1, 0.7372549, 0, 1,
-1.134661, 0.3144605, -1.520939, 1, 0.7450981, 0, 1,
-1.129948, -0.3087396, -2.659877, 1, 0.7490196, 0, 1,
-1.127209, -0.8168745, -3.264205, 1, 0.7568628, 0, 1,
-1.120387, 1.317181, -2.31831, 1, 0.7607843, 0, 1,
-1.119673, -0.9720187, -5.891675, 1, 0.7686275, 0, 1,
-1.115652, 1.48919, -1.42804, 1, 0.772549, 0, 1,
-1.098784, 0.9606117, -0.5509612, 1, 0.7803922, 0, 1,
-1.085087, -1.157283, -3.133816, 1, 0.7843137, 0, 1,
-1.084694, -0.9103686, -2.718668, 1, 0.7921569, 0, 1,
-1.074203, 1.106164, -1.012404, 1, 0.7960784, 0, 1,
-1.070892, 0.04913254, -0.4534107, 1, 0.8039216, 0, 1,
-1.065792, -0.1977037, -0.3322208, 1, 0.8117647, 0, 1,
-1.062476, 1.530946, 1.071052, 1, 0.8156863, 0, 1,
-1.061883, 0.7081534, -1.875528, 1, 0.8235294, 0, 1,
-1.059656, 0.3930395, -2.668292, 1, 0.827451, 0, 1,
-1.058004, -0.05883354, -2.791567, 1, 0.8352941, 0, 1,
-1.056453, 0.8174859, -0.7882691, 1, 0.8392157, 0, 1,
-1.048168, 1.065569, -0.8597052, 1, 0.8470588, 0, 1,
-1.041704, -0.1610177, -2.12512, 1, 0.8509804, 0, 1,
-1.037161, -1.548281, -1.831181, 1, 0.8588235, 0, 1,
-1.030939, 0.3899774, -2.045817, 1, 0.8627451, 0, 1,
-1.029954, 2.061883, -2.232067, 1, 0.8705882, 0, 1,
-1.027002, 0.9990809, -1.56594, 1, 0.8745098, 0, 1,
-1.02249, -1.295864, -2.538436, 1, 0.8823529, 0, 1,
-1.018598, -0.4216949, -2.740293, 1, 0.8862745, 0, 1,
-1.017205, -1.628384, -2.524971, 1, 0.8941177, 0, 1,
-1.014366, -0.601312, -2.02145, 1, 0.8980392, 0, 1,
-1.011801, -0.4047629, -1.542512, 1, 0.9058824, 0, 1,
-1.011061, -0.5524106, -0.624007, 1, 0.9137255, 0, 1,
-1.007911, -1.196126, -1.358498, 1, 0.9176471, 0, 1,
-1.006401, -0.5454858, -1.377103, 1, 0.9254902, 0, 1,
-1.006176, 0.33404, -0.05564858, 1, 0.9294118, 0, 1,
-1.003856, -0.222712, -2.141619, 1, 0.9372549, 0, 1,
-1.003225, -0.9189987, -3.996657, 1, 0.9411765, 0, 1,
-0.9989169, 1.89406, -1.904917, 1, 0.9490196, 0, 1,
-0.9969754, 1.210476, 2.707216, 1, 0.9529412, 0, 1,
-0.989794, -0.6085318, -0.6410619, 1, 0.9607843, 0, 1,
-0.9851268, 0.9465216, -0.2735203, 1, 0.9647059, 0, 1,
-0.982489, 0.7371289, -0.7610531, 1, 0.972549, 0, 1,
-0.9823479, 0.2967374, 0.232503, 1, 0.9764706, 0, 1,
-0.9823287, -1.19579, -2.333148, 1, 0.9843137, 0, 1,
-0.9783128, -1.493544, -1.912461, 1, 0.9882353, 0, 1,
-0.9726303, -1.361098, -1.058275, 1, 0.9960784, 0, 1,
-0.9708319, -0.03450273, -1.081355, 0.9960784, 1, 0, 1,
-0.9688926, 0.4975534, -0.1124071, 0.9921569, 1, 0, 1,
-0.9624401, 0.5415718, -2.239258, 0.9843137, 1, 0, 1,
-0.9565499, -1.935631, -2.34671, 0.9803922, 1, 0, 1,
-0.9553949, -0.8066145, -1.314606, 0.972549, 1, 0, 1,
-0.9537901, 0.4566562, -3.805501, 0.9686275, 1, 0, 1,
-0.9535139, 0.6221337, -1.244423, 0.9607843, 1, 0, 1,
-0.9416881, -0.9161395, -2.786326, 0.9568627, 1, 0, 1,
-0.9411163, 0.2897297, -3.080153, 0.9490196, 1, 0, 1,
-0.9394528, -0.6930832, -2.900543, 0.945098, 1, 0, 1,
-0.9383802, -2.031578, -3.095045, 0.9372549, 1, 0, 1,
-0.9383242, 0.6660705, 0.2639376, 0.9333333, 1, 0, 1,
-0.9364538, -0.7812071, -3.033102, 0.9254902, 1, 0, 1,
-0.9342341, 0.6855702, -2.115305, 0.9215686, 1, 0, 1,
-0.9334969, -0.1470859, -0.4515955, 0.9137255, 1, 0, 1,
-0.9327567, 0.06697211, -1.62632, 0.9098039, 1, 0, 1,
-0.9314114, -1.382169, -1.312631, 0.9019608, 1, 0, 1,
-0.9300591, -1.138146, -3.039592, 0.8941177, 1, 0, 1,
-0.9264044, -0.4498961, -2.421065, 0.8901961, 1, 0, 1,
-0.9212948, -0.5450199, -2.663429, 0.8823529, 1, 0, 1,
-0.9210743, 0.2215958, -1.620866, 0.8784314, 1, 0, 1,
-0.9191464, 1.223539, -0.8473299, 0.8705882, 1, 0, 1,
-0.9064549, 0.7810767, -1.787948, 0.8666667, 1, 0, 1,
-0.9043871, -0.3224868, -0.3390383, 0.8588235, 1, 0, 1,
-0.901859, 0.6128461, 0.1632886, 0.854902, 1, 0, 1,
-0.8895247, -2.119984, -1.626156, 0.8470588, 1, 0, 1,
-0.8841883, -1.271802, -1.416716, 0.8431373, 1, 0, 1,
-0.8809585, 1.713067, -1.132734, 0.8352941, 1, 0, 1,
-0.8798888, 0.7587445, -1.102465, 0.8313726, 1, 0, 1,
-0.8773429, -1.880447, -3.228984, 0.8235294, 1, 0, 1,
-0.875147, -0.06857772, -0.4112781, 0.8196079, 1, 0, 1,
-0.8704906, 1.629701, -0.6163124, 0.8117647, 1, 0, 1,
-0.8645391, -0.9941171, -1.733102, 0.8078431, 1, 0, 1,
-0.8485324, 0.195303, -1.695686, 0.8, 1, 0, 1,
-0.8442469, 1.429599, 0.208341, 0.7921569, 1, 0, 1,
-0.8392201, -0.9232237, -4.850137, 0.7882353, 1, 0, 1,
-0.8380004, 0.577696, 0.2359859, 0.7803922, 1, 0, 1,
-0.8372446, 0.1670316, -1.075973, 0.7764706, 1, 0, 1,
-0.8368379, -0.2014567, -2.562019, 0.7686275, 1, 0, 1,
-0.8333272, 0.3255446, -2.630302, 0.7647059, 1, 0, 1,
-0.8217621, -0.9219896, -2.593672, 0.7568628, 1, 0, 1,
-0.8195939, -0.7214879, -4.407603, 0.7529412, 1, 0, 1,
-0.805182, 0.6497204, -0.9518735, 0.7450981, 1, 0, 1,
-0.8047737, -0.9788374, -1.471534, 0.7411765, 1, 0, 1,
-0.7951605, 1.32507, -0.4911553, 0.7333333, 1, 0, 1,
-0.7945724, 0.4404671, -0.07977, 0.7294118, 1, 0, 1,
-0.7911243, -1.683223, -3.035031, 0.7215686, 1, 0, 1,
-0.7904605, 0.6064444, -1.336779, 0.7176471, 1, 0, 1,
-0.7903429, -0.4481847, -1.438623, 0.7098039, 1, 0, 1,
-0.7893227, 0.3894765, -0.5468842, 0.7058824, 1, 0, 1,
-0.788294, -1.884079, -1.632067, 0.6980392, 1, 0, 1,
-0.7877004, -0.1942125, -3.430902, 0.6901961, 1, 0, 1,
-0.779201, -1.944277, -1.759177, 0.6862745, 1, 0, 1,
-0.7714607, 0.7897919, -0.6005856, 0.6784314, 1, 0, 1,
-0.7711506, 0.3067327, -2.376165, 0.6745098, 1, 0, 1,
-0.7639711, 0.07115728, 1.823342, 0.6666667, 1, 0, 1,
-0.7589, 0.541881, -1.482582, 0.6627451, 1, 0, 1,
-0.7582932, -1.569606, -1.450331, 0.654902, 1, 0, 1,
-0.7531736, 0.5369929, -2.068169, 0.6509804, 1, 0, 1,
-0.7531551, 0.5049595, -1.219615, 0.6431373, 1, 0, 1,
-0.7524793, 2.004128, -1.249879, 0.6392157, 1, 0, 1,
-0.7523744, 0.05732449, 0.5380881, 0.6313726, 1, 0, 1,
-0.7503238, -0.8755698, -2.472508, 0.627451, 1, 0, 1,
-0.743167, 0.1530001, -1.621038, 0.6196079, 1, 0, 1,
-0.7409735, -0.1643564, -2.590598, 0.6156863, 1, 0, 1,
-0.7302066, -0.9675409, -2.019176, 0.6078432, 1, 0, 1,
-0.7264432, 1.850748, -0.9443897, 0.6039216, 1, 0, 1,
-0.716722, -0.6100127, -2.681562, 0.5960785, 1, 0, 1,
-0.7147427, -1.273587, -3.104177, 0.5882353, 1, 0, 1,
-0.7135162, -0.8493592, -3.123508, 0.5843138, 1, 0, 1,
-0.7093378, 0.6337841, -0.4723313, 0.5764706, 1, 0, 1,
-0.708558, 0.9014154, -1.384582, 0.572549, 1, 0, 1,
-0.7064719, 0.2452474, -3.084199, 0.5647059, 1, 0, 1,
-0.7034475, 0.466969, -0.9597478, 0.5607843, 1, 0, 1,
-0.6973714, -0.4141104, -3.478411, 0.5529412, 1, 0, 1,
-0.696932, -0.8013841, -3.797786, 0.5490196, 1, 0, 1,
-0.6950978, 1.189913, -3.227737, 0.5411765, 1, 0, 1,
-0.694001, -0.884955, -2.658567, 0.5372549, 1, 0, 1,
-0.6933873, 0.4600477, -2.385611, 0.5294118, 1, 0, 1,
-0.6926958, 0.5050763, -1.118401, 0.5254902, 1, 0, 1,
-0.689148, 0.1738847, -1.733146, 0.5176471, 1, 0, 1,
-0.688409, 0.6825339, -1.569703, 0.5137255, 1, 0, 1,
-0.6868106, 1.38602, -0.8427374, 0.5058824, 1, 0, 1,
-0.6695976, 0.6966813, 0.03776127, 0.5019608, 1, 0, 1,
-0.6687223, -0.7658342, -3.204704, 0.4941176, 1, 0, 1,
-0.6680884, 0.3742224, -1.887075, 0.4862745, 1, 0, 1,
-0.6664293, 1.485518, 0.8726751, 0.4823529, 1, 0, 1,
-0.6581666, 1.131402, -0.5541001, 0.4745098, 1, 0, 1,
-0.6570406, 0.6832323, -1.040526, 0.4705882, 1, 0, 1,
-0.6508442, 0.3698672, -0.9016274, 0.4627451, 1, 0, 1,
-0.6483644, 1.727827, -0.4509392, 0.4588235, 1, 0, 1,
-0.6449841, -0.1302098, -1.894042, 0.4509804, 1, 0, 1,
-0.6445635, -1.499017, -2.325983, 0.4470588, 1, 0, 1,
-0.6351065, -0.2060422, -2.242977, 0.4392157, 1, 0, 1,
-0.6334556, 0.6698689, -2.250869, 0.4352941, 1, 0, 1,
-0.631043, -0.2084479, -1.978222, 0.427451, 1, 0, 1,
-0.6306913, 0.8121139, -0.6972614, 0.4235294, 1, 0, 1,
-0.6304274, 0.2716084, -2.17921, 0.4156863, 1, 0, 1,
-0.6285653, 0.2722669, -0.9911484, 0.4117647, 1, 0, 1,
-0.6269089, -0.1859449, 0.09454346, 0.4039216, 1, 0, 1,
-0.6231812, -1.386461, -2.101783, 0.3960784, 1, 0, 1,
-0.6202382, -0.1042945, -2.603683, 0.3921569, 1, 0, 1,
-0.6200729, -0.2981348, -2.449179, 0.3843137, 1, 0, 1,
-0.6150092, -0.6345991, -3.958992, 0.3803922, 1, 0, 1,
-0.6119212, -0.1689734, -3.4921, 0.372549, 1, 0, 1,
-0.6062375, 0.6930339, -1.61096, 0.3686275, 1, 0, 1,
-0.6052468, -0.03176959, -0.749344, 0.3607843, 1, 0, 1,
-0.6033746, 0.5039826, -2.361723, 0.3568628, 1, 0, 1,
-0.6031385, 1.267691, -0.1107578, 0.3490196, 1, 0, 1,
-0.6012576, 0.608543, -1.345758, 0.345098, 1, 0, 1,
-0.599639, 0.239559, -0.6492841, 0.3372549, 1, 0, 1,
-0.5978984, -1.111905, -1.835449, 0.3333333, 1, 0, 1,
-0.5973005, 1.700623, -1.567292, 0.3254902, 1, 0, 1,
-0.5962751, 0.3227322, -0.6034443, 0.3215686, 1, 0, 1,
-0.5915015, -1.116715, -4.840692, 0.3137255, 1, 0, 1,
-0.589698, 0.463831, 0.5270595, 0.3098039, 1, 0, 1,
-0.5880524, 0.8886865, -0.2276414, 0.3019608, 1, 0, 1,
-0.5836809, 0.1915045, 0.3834976, 0.2941177, 1, 0, 1,
-0.5835216, 0.8137744, 0.03321631, 0.2901961, 1, 0, 1,
-0.5727915, 0.5139155, -2.761238, 0.282353, 1, 0, 1,
-0.5606163, -0.6208425, -2.451381, 0.2784314, 1, 0, 1,
-0.5600615, -0.4922446, -2.922413, 0.2705882, 1, 0, 1,
-0.5584977, -0.9820753, -2.05992, 0.2666667, 1, 0, 1,
-0.5583073, -0.6269811, -2.155205, 0.2588235, 1, 0, 1,
-0.556841, -0.1400133, -1.425598, 0.254902, 1, 0, 1,
-0.5485941, -1.096273, -1.87741, 0.2470588, 1, 0, 1,
-0.5433912, -0.4792537, -1.154205, 0.2431373, 1, 0, 1,
-0.5426958, 2.41735, 0.7464218, 0.2352941, 1, 0, 1,
-0.5416865, -0.6122056, -2.633756, 0.2313726, 1, 0, 1,
-0.5393884, 0.9556201, -1.100931, 0.2235294, 1, 0, 1,
-0.5323135, -0.08835337, -2.533527, 0.2196078, 1, 0, 1,
-0.5299782, -0.5529734, -2.406275, 0.2117647, 1, 0, 1,
-0.5277851, -1.159264, -4.406737, 0.2078431, 1, 0, 1,
-0.5232381, 0.3203165, -1.576002, 0.2, 1, 0, 1,
-0.5224092, 1.638805, 0.2691376, 0.1921569, 1, 0, 1,
-0.5209675, -0.5589754, -1.326153, 0.1882353, 1, 0, 1,
-0.5193848, 0.7647744, -2.168088, 0.1803922, 1, 0, 1,
-0.5167115, -0.7195586, -3.326332, 0.1764706, 1, 0, 1,
-0.5120677, 0.1973968, -0.4408946, 0.1686275, 1, 0, 1,
-0.5056964, 1.059354, -0.3780464, 0.1647059, 1, 0, 1,
-0.505645, 0.7076046, -1.521116, 0.1568628, 1, 0, 1,
-0.5012662, -0.4384339, -2.463514, 0.1529412, 1, 0, 1,
-0.500869, 0.2609141, -2.294876, 0.145098, 1, 0, 1,
-0.4985597, -0.3191744, -2.527586, 0.1411765, 1, 0, 1,
-0.4978125, -0.1587075, -1.052474, 0.1333333, 1, 0, 1,
-0.4977232, 1.115184, -0.4467402, 0.1294118, 1, 0, 1,
-0.4953442, -0.82221, -2.589534, 0.1215686, 1, 0, 1,
-0.4949028, -0.2110725, -1.56668, 0.1176471, 1, 0, 1,
-0.488889, -0.7843581, -3.303101, 0.1098039, 1, 0, 1,
-0.4830305, -1.44385, -1.468191, 0.1058824, 1, 0, 1,
-0.4791921, 0.7080668, 0.1379299, 0.09803922, 1, 0, 1,
-0.4779739, 1.556352, 0.1103359, 0.09019608, 1, 0, 1,
-0.4703198, 0.2665215, -0.8993961, 0.08627451, 1, 0, 1,
-0.4672571, 1.057682, -1.525285, 0.07843138, 1, 0, 1,
-0.4595441, -0.6314443, -2.459448, 0.07450981, 1, 0, 1,
-0.4583832, 1.490501, -0.9655112, 0.06666667, 1, 0, 1,
-0.4579469, -1.360151, -1.989883, 0.0627451, 1, 0, 1,
-0.4548097, -0.7356464, -2.974678, 0.05490196, 1, 0, 1,
-0.4534106, 1.65609, 2.04742, 0.05098039, 1, 0, 1,
-0.4458979, -1.635762, -3.124737, 0.04313726, 1, 0, 1,
-0.4392351, 2.171804, 1.121295, 0.03921569, 1, 0, 1,
-0.4336963, -0.6182914, -2.595934, 0.03137255, 1, 0, 1,
-0.431105, 0.7064999, 0.334806, 0.02745098, 1, 0, 1,
-0.4300264, 0.5926831, -1.090304, 0.01960784, 1, 0, 1,
-0.4298039, -0.2323332, -2.315802, 0.01568628, 1, 0, 1,
-0.42978, 0.3216823, -1.094781, 0.007843138, 1, 0, 1,
-0.4226581, -0.6704802, -3.717129, 0.003921569, 1, 0, 1,
-0.4226052, 0.2402156, -1.975468, 0, 1, 0.003921569, 1,
-0.4202313, 0.3096577, -0.7312971, 0, 1, 0.01176471, 1,
-0.4178732, -0.2749954, -4.030761, 0, 1, 0.01568628, 1,
-0.4145282, -0.1353013, -0.4659554, 0, 1, 0.02352941, 1,
-0.4101455, 0.2125286, 0.5638156, 0, 1, 0.02745098, 1,
-0.4087126, -0.174189, -2.436207, 0, 1, 0.03529412, 1,
-0.4053866, 0.875753, -1.693959, 0, 1, 0.03921569, 1,
-0.4040602, 0.9587528, -0.3940443, 0, 1, 0.04705882, 1,
-0.3997448, -0.5845803, -1.403754, 0, 1, 0.05098039, 1,
-0.3972247, -0.6623303, -2.403553, 0, 1, 0.05882353, 1,
-0.3969291, -0.6758956, -4.357373, 0, 1, 0.0627451, 1,
-0.3953129, 1.055643, -1.34164, 0, 1, 0.07058824, 1,
-0.3949923, 0.8358114, -0.4593846, 0, 1, 0.07450981, 1,
-0.392418, -1.223892, -2.348648, 0, 1, 0.08235294, 1,
-0.3922546, -1.314703, -2.272736, 0, 1, 0.08627451, 1,
-0.3891732, 0.07330529, -0.9648751, 0, 1, 0.09411765, 1,
-0.3815254, -0.05320558, -1.095465, 0, 1, 0.1019608, 1,
-0.3802851, -1.737013, -3.75578, 0, 1, 0.1058824, 1,
-0.379088, -1.68399, -1.275578, 0, 1, 0.1137255, 1,
-0.3734178, -0.6544011, -2.135785, 0, 1, 0.1176471, 1,
-0.3708763, -1.53348, -4.956941, 0, 1, 0.1254902, 1,
-0.3706365, 0.727167, -1.846552, 0, 1, 0.1294118, 1,
-0.3683016, 1.351234, -0.6434365, 0, 1, 0.1372549, 1,
-0.3658237, 1.811793, 0.6189409, 0, 1, 0.1411765, 1,
-0.3657903, -0.5275588, -2.150387, 0, 1, 0.1490196, 1,
-0.3579575, -0.007994703, -0.09679925, 0, 1, 0.1529412, 1,
-0.3542993, 0.6159754, -0.2257103, 0, 1, 0.1607843, 1,
-0.3539442, -0.001554286, -3.306295, 0, 1, 0.1647059, 1,
-0.3535723, 0.06483668, -1.907386, 0, 1, 0.172549, 1,
-0.3532774, 0.7756516, -2.432389, 0, 1, 0.1764706, 1,
-0.3525495, -0.0577427, -2.931175, 0, 1, 0.1843137, 1,
-0.3486651, -0.5394794, -1.998234, 0, 1, 0.1882353, 1,
-0.3468204, 0.3943507, -1.475976, 0, 1, 0.1960784, 1,
-0.3460042, 1.534215, -1.14907, 0, 1, 0.2039216, 1,
-0.334794, 0.6357907, -1.602974, 0, 1, 0.2078431, 1,
-0.3289042, 0.3030442, -0.7461755, 0, 1, 0.2156863, 1,
-0.3247299, -0.9448132, -1.303566, 0, 1, 0.2196078, 1,
-0.3239051, 0.2178401, 0.09791283, 0, 1, 0.227451, 1,
-0.3220651, 0.6733958, -0.8589934, 0, 1, 0.2313726, 1,
-0.3169384, 0.3617336, 0.1364099, 0, 1, 0.2392157, 1,
-0.3166763, -0.3693741, -3.561474, 0, 1, 0.2431373, 1,
-0.3150347, 0.5251486, -1.979166, 0, 1, 0.2509804, 1,
-0.3123894, 0.1546112, -3.782984, 0, 1, 0.254902, 1,
-0.3117851, -0.6650834, -1.612061, 0, 1, 0.2627451, 1,
-0.3107151, -0.7383627, -3.246943, 0, 1, 0.2666667, 1,
-0.3093765, 1.006991, 1.123088, 0, 1, 0.2745098, 1,
-0.308682, -0.1528459, -2.60949, 0, 1, 0.2784314, 1,
-0.3055257, -0.4964362, -3.305907, 0, 1, 0.2862745, 1,
-0.294177, 1.920521, -0.5995433, 0, 1, 0.2901961, 1,
-0.2915738, -0.4714568, -0.2287995, 0, 1, 0.2980392, 1,
-0.2911706, -0.2382434, -2.212706, 0, 1, 0.3058824, 1,
-0.2895985, 0.3718016, 0.7753493, 0, 1, 0.3098039, 1,
-0.2861155, -0.3207527, -2.498761, 0, 1, 0.3176471, 1,
-0.2854534, 0.06813782, -1.966055, 0, 1, 0.3215686, 1,
-0.2853647, 0.6036766, -1.094596, 0, 1, 0.3294118, 1,
-0.2852976, 1.650933, 0.8833835, 0, 1, 0.3333333, 1,
-0.2838714, -0.583962, -0.9389457, 0, 1, 0.3411765, 1,
-0.2804197, 0.36362, 0.06921817, 0, 1, 0.345098, 1,
-0.2759379, 0.8679741, 0.3216205, 0, 1, 0.3529412, 1,
-0.2732244, 0.6838494, -0.508038, 0, 1, 0.3568628, 1,
-0.2686755, -0.6979448, -1.952807, 0, 1, 0.3647059, 1,
-0.2655234, 0.09792917, -0.2238487, 0, 1, 0.3686275, 1,
-0.264635, 0.9340207, -0.166488, 0, 1, 0.3764706, 1,
-0.2610954, -0.3500103, -0.7380531, 0, 1, 0.3803922, 1,
-0.2562299, 1.547067, -0.7763795, 0, 1, 0.3882353, 1,
-0.2553366, -0.8821326, -3.340584, 0, 1, 0.3921569, 1,
-0.2522395, 0.3560508, -2.849789, 0, 1, 0.4, 1,
-0.2491139, 0.1075405, -1.530445, 0, 1, 0.4078431, 1,
-0.242782, -0.3062509, -2.87972, 0, 1, 0.4117647, 1,
-0.2379673, 0.167329, -0.04356834, 0, 1, 0.4196078, 1,
-0.2369918, 2.011135, 0.9300884, 0, 1, 0.4235294, 1,
-0.2309145, -0.2980221, -1.137376, 0, 1, 0.4313726, 1,
-0.2303011, -0.5673794, -2.672174, 0, 1, 0.4352941, 1,
-0.2276506, -1.154409, -2.949231, 0, 1, 0.4431373, 1,
-0.2270635, 0.06881093, -1.654794, 0, 1, 0.4470588, 1,
-0.2251544, 0.3110075, -0.831187, 0, 1, 0.454902, 1,
-0.2245842, -1.547841, -2.763605, 0, 1, 0.4588235, 1,
-0.2191004, -0.5601814, -3.203114, 0, 1, 0.4666667, 1,
-0.2145724, -0.2618342, -3.569102, 0, 1, 0.4705882, 1,
-0.2136406, -0.1041581, -4.051155, 0, 1, 0.4784314, 1,
-0.2127036, -0.03309973, -0.6111544, 0, 1, 0.4823529, 1,
-0.2126906, 0.8476179, -0.1937927, 0, 1, 0.4901961, 1,
-0.2108441, 0.8931294, 0.251048, 0, 1, 0.4941176, 1,
-0.1977661, 0.3263531, -1.799712, 0, 1, 0.5019608, 1,
-0.1942762, 1.165303, 1.392295, 0, 1, 0.509804, 1,
-0.1915281, 2.426233, 0.1498389, 0, 1, 0.5137255, 1,
-0.1861278, 0.009280852, -0.8413554, 0, 1, 0.5215687, 1,
-0.1855759, -0.709097, -2.852312, 0, 1, 0.5254902, 1,
-0.1825738, -0.6099695, -3.459197, 0, 1, 0.5333334, 1,
-0.1816732, 0.4932341, 0.02370124, 0, 1, 0.5372549, 1,
-0.1815352, -1.160441, -3.982042, 0, 1, 0.5450981, 1,
-0.1808549, -0.04148882, -2.494984, 0, 1, 0.5490196, 1,
-0.1807759, -1.730993, -2.216696, 0, 1, 0.5568628, 1,
-0.1780511, 1.183116, 0.4874112, 0, 1, 0.5607843, 1,
-0.1768699, -0.1676092, -1.83901, 0, 1, 0.5686275, 1,
-0.1700985, -0.7329479, -2.83629, 0, 1, 0.572549, 1,
-0.1700612, 0.1880638, -1.03448, 0, 1, 0.5803922, 1,
-0.1684191, -1.279892, -4.399584, 0, 1, 0.5843138, 1,
-0.1626854, 0.7309512, -0.1715499, 0, 1, 0.5921569, 1,
-0.1601199, -0.4157254, -4.420429, 0, 1, 0.5960785, 1,
-0.1594582, -0.6882134, -1.3363, 0, 1, 0.6039216, 1,
-0.1585671, -2.429341, -3.305977, 0, 1, 0.6117647, 1,
-0.1548813, 0.1820656, 0.3008796, 0, 1, 0.6156863, 1,
-0.142501, -0.5132532, -1.688604, 0, 1, 0.6235294, 1,
-0.1418874, 0.997529, -1.472645, 0, 1, 0.627451, 1,
-0.1407302, 1.110688, -0.2806631, 0, 1, 0.6352941, 1,
-0.1378804, -0.5952193, -1.562524, 0, 1, 0.6392157, 1,
-0.1310611, 0.3888646, 0.6529439, 0, 1, 0.6470588, 1,
-0.1276382, -0.9410381, -1.260467, 0, 1, 0.6509804, 1,
-0.122426, 0.4739752, 0.1364411, 0, 1, 0.6588235, 1,
-0.1219434, -1.185118, -2.726312, 0, 1, 0.6627451, 1,
-0.1197754, -0.1639564, -2.200285, 0, 1, 0.6705883, 1,
-0.117102, 0.762291, -1.217328, 0, 1, 0.6745098, 1,
-0.1153005, 0.7786554, 0.04061096, 0, 1, 0.682353, 1,
-0.1113757, -1.603053, -3.054718, 0, 1, 0.6862745, 1,
-0.1094934, 0.6882265, 0.731854, 0, 1, 0.6941177, 1,
-0.1075933, 0.2420818, -0.2540375, 0, 1, 0.7019608, 1,
-0.1048871, -1.126823, -1.996426, 0, 1, 0.7058824, 1,
-0.1044108, 0.7731059, -1.453448, 0, 1, 0.7137255, 1,
-0.104127, 0.1926997, -0.6217399, 0, 1, 0.7176471, 1,
-0.09978805, -0.5879878, -1.861245, 0, 1, 0.7254902, 1,
-0.09828952, 0.7044334, 0.5035684, 0, 1, 0.7294118, 1,
-0.09622104, 0.4883827, -0.8799122, 0, 1, 0.7372549, 1,
-0.09347416, -1.14881, -2.663601, 0, 1, 0.7411765, 1,
-0.09280267, 0.5609731, 0.606171, 0, 1, 0.7490196, 1,
-0.09237724, 1.500695, 0.07188727, 0, 1, 0.7529412, 1,
-0.09237637, 0.9003584, 0.290535, 0, 1, 0.7607843, 1,
-0.09065089, -0.3408214, -2.777881, 0, 1, 0.7647059, 1,
-0.08746411, -1.12415, -4.20792, 0, 1, 0.772549, 1,
-0.08699111, -0.594407, -2.354171, 0, 1, 0.7764706, 1,
-0.08086904, 0.1085618, -1.157561, 0, 1, 0.7843137, 1,
-0.08069998, 0.01513867, -3.122921, 0, 1, 0.7882353, 1,
-0.07989097, 1.077365, -0.4016452, 0, 1, 0.7960784, 1,
-0.07858455, -0.6615047, -3.448176, 0, 1, 0.8039216, 1,
-0.07839359, 0.1520923, -0.1497521, 0, 1, 0.8078431, 1,
-0.07812946, 2.021679, -0.2203892, 0, 1, 0.8156863, 1,
-0.07518132, 0.9901733, 1.13497, 0, 1, 0.8196079, 1,
-0.07053878, -0.9266945, -2.313231, 0, 1, 0.827451, 1,
-0.07011628, 0.9259037, 1.729432, 0, 1, 0.8313726, 1,
-0.06500962, -0.7656552, -2.821322, 0, 1, 0.8392157, 1,
-0.06275493, -0.1798131, -2.360564, 0, 1, 0.8431373, 1,
-0.06230734, -0.3238762, -3.454431, 0, 1, 0.8509804, 1,
-0.05977476, 0.7440561, -0.571233, 0, 1, 0.854902, 1,
-0.05862685, 1.456715, 0.03129255, 0, 1, 0.8627451, 1,
-0.04908972, 0.1721842, -0.9704487, 0, 1, 0.8666667, 1,
-0.04878232, 0.972374, -1.497586, 0, 1, 0.8745098, 1,
-0.04088839, 0.4281385, 1.2567, 0, 1, 0.8784314, 1,
-0.04081018, 0.6856663, 1.222914, 0, 1, 0.8862745, 1,
-0.04051569, -1.400178, -3.366359, 0, 1, 0.8901961, 1,
-0.03311518, 0.7638467, 0.4504003, 0, 1, 0.8980392, 1,
-0.02537979, -1.603489, -2.323163, 0, 1, 0.9058824, 1,
-0.02338775, -0.3821808, -3.040703, 0, 1, 0.9098039, 1,
-0.01857031, -1.418346, -1.907305, 0, 1, 0.9176471, 1,
-0.01572949, 1.528671, 0.7855405, 0, 1, 0.9215686, 1,
-0.01254538, 0.8805131, 1.525878, 0, 1, 0.9294118, 1,
-0.01248454, -1.623894, -1.901079, 0, 1, 0.9333333, 1,
-0.006593021, -0.6930067, -2.007631, 0, 1, 0.9411765, 1,
-0.006586873, 0.02141124, 1.24304, 0, 1, 0.945098, 1,
-0.005415841, -0.1968426, -2.686218, 0, 1, 0.9529412, 1,
0.0004397398, 2.023003, 0.02663115, 0, 1, 0.9568627, 1,
0.00274743, 0.8088942, -0.9132776, 0, 1, 0.9647059, 1,
0.004661349, -0.2356535, 1.405496, 0, 1, 0.9686275, 1,
0.004918867, 0.8197016, -0.8968543, 0, 1, 0.9764706, 1,
0.006952544, 2.735173, 0.6529121, 0, 1, 0.9803922, 1,
0.007187133, -1.375602, 4.130338, 0, 1, 0.9882353, 1,
0.007660715, -0.07027745, 3.407813, 0, 1, 0.9921569, 1,
0.01173614, 0.4932702, 0.2437851, 0, 1, 1, 1,
0.02295014, 0.24435, 1.599807, 0, 0.9921569, 1, 1,
0.02673872, -1.544181, 2.035424, 0, 0.9882353, 1, 1,
0.02745988, -0.3427509, 3.503799, 0, 0.9803922, 1, 1,
0.02828752, -2.036716, 2.913112, 0, 0.9764706, 1, 1,
0.02930737, -1.775231, 3.781558, 0, 0.9686275, 1, 1,
0.03070422, -1.468076, 3.380415, 0, 0.9647059, 1, 1,
0.03578749, 1.778093, 0.2109876, 0, 0.9568627, 1, 1,
0.03740615, 1.28457, -1.302016, 0, 0.9529412, 1, 1,
0.04263648, 0.7358271, -1.931878, 0, 0.945098, 1, 1,
0.04272378, -0.04802702, 1.469546, 0, 0.9411765, 1, 1,
0.04721953, 1.287634, 0.7434037, 0, 0.9333333, 1, 1,
0.05198419, -0.8420162, 3.547781, 0, 0.9294118, 1, 1,
0.05264803, -1.257409, 3.239327, 0, 0.9215686, 1, 1,
0.05567975, 0.6151415, 1.067336, 0, 0.9176471, 1, 1,
0.05649279, 1.822357, -1.11436, 0, 0.9098039, 1, 1,
0.05747458, -0.4215054, 3.105723, 0, 0.9058824, 1, 1,
0.05870023, -0.5662487, 4.208026, 0, 0.8980392, 1, 1,
0.06606931, 0.03140677, 0.8805616, 0, 0.8901961, 1, 1,
0.06694539, 0.1543235, 0.6517206, 0, 0.8862745, 1, 1,
0.06696962, 1.018941, 0.1412584, 0, 0.8784314, 1, 1,
0.06915589, 0.7447492, -1.420956, 0, 0.8745098, 1, 1,
0.07483196, -0.4667096, 2.833463, 0, 0.8666667, 1, 1,
0.07796122, -1.149192, 2.671168, 0, 0.8627451, 1, 1,
0.07987949, -0.2568347, 1.245635, 0, 0.854902, 1, 1,
0.08052732, 2.079955, -0.3055033, 0, 0.8509804, 1, 1,
0.08152141, -0.4240601, 5.140552, 0, 0.8431373, 1, 1,
0.08180542, -1.459498, 1.479665, 0, 0.8392157, 1, 1,
0.08247334, 1.811905, 1.827763, 0, 0.8313726, 1, 1,
0.08522227, 0.9405355, 1.156463, 0, 0.827451, 1, 1,
0.08699749, -2.056319, 0.8722907, 0, 0.8196079, 1, 1,
0.08807583, -1.487668, 1.546208, 0, 0.8156863, 1, 1,
0.08872755, -0.3033547, 2.504691, 0, 0.8078431, 1, 1,
0.08907477, 0.2659507, -0.5027945, 0, 0.8039216, 1, 1,
0.09026673, -0.9502769, 2.20709, 0, 0.7960784, 1, 1,
0.09301542, -1.310967, 4.236127, 0, 0.7882353, 1, 1,
0.09359716, -0.03629517, 1.877737, 0, 0.7843137, 1, 1,
0.09851579, -0.7077922, 1.642046, 0, 0.7764706, 1, 1,
0.1017389, 1.734673, -0.7199563, 0, 0.772549, 1, 1,
0.1032285, 2.027084, -0.07279047, 0, 0.7647059, 1, 1,
0.1054233, 0.3437189, 1.243988, 0, 0.7607843, 1, 1,
0.1054707, 1.844759, -0.2364892, 0, 0.7529412, 1, 1,
0.1069594, -0.5642263, 2.129649, 0, 0.7490196, 1, 1,
0.1069839, -0.6881973, 4.997748, 0, 0.7411765, 1, 1,
0.1074949, 1.302735, 0.965205, 0, 0.7372549, 1, 1,
0.1087423, -0.1872766, 1.538931, 0, 0.7294118, 1, 1,
0.1101424, -1.373327, 4.167513, 0, 0.7254902, 1, 1,
0.1135304, -0.1640092, 3.589981, 0, 0.7176471, 1, 1,
0.1144164, 1.23807, -0.2747946, 0, 0.7137255, 1, 1,
0.1186139, 0.5779433, 0.1803719, 0, 0.7058824, 1, 1,
0.1197622, -0.7895621, 2.305393, 0, 0.6980392, 1, 1,
0.1206229, 0.4130073, 0.6074769, 0, 0.6941177, 1, 1,
0.1220351, 0.7133991, -0.245554, 0, 0.6862745, 1, 1,
0.1228327, -0.7472318, 2.853836, 0, 0.682353, 1, 1,
0.1283937, 0.236853, 2.057195, 0, 0.6745098, 1, 1,
0.1322356, 0.7024803, -0.2184498, 0, 0.6705883, 1, 1,
0.133817, -1.586628, 1.856124, 0, 0.6627451, 1, 1,
0.1393834, -2.780895, 2.929934, 0, 0.6588235, 1, 1,
0.1486287, 0.7362902, -0.3162238, 0, 0.6509804, 1, 1,
0.150927, -0.4818213, 2.154834, 0, 0.6470588, 1, 1,
0.1515978, -0.3381124, 2.915296, 0, 0.6392157, 1, 1,
0.1521671, -1.358445, 3.610587, 0, 0.6352941, 1, 1,
0.1530536, -1.275943, 3.834485, 0, 0.627451, 1, 1,
0.1573289, 0.6343664, -1.677382, 0, 0.6235294, 1, 1,
0.1584278, 1.007477, -0.1285264, 0, 0.6156863, 1, 1,
0.1601546, 1.633337, -0.9740014, 0, 0.6117647, 1, 1,
0.1615888, -0.3829309, 2.91462, 0, 0.6039216, 1, 1,
0.1644408, -0.2850716, 3.817101, 0, 0.5960785, 1, 1,
0.1681082, 0.5623572, 1.040306, 0, 0.5921569, 1, 1,
0.1684072, -0.1508007, 2.405296, 0, 0.5843138, 1, 1,
0.1750586, -0.5479088, 3.351954, 0, 0.5803922, 1, 1,
0.1823363, -1.41168, 3.314687, 0, 0.572549, 1, 1,
0.1867358, 0.8774338, 0.6057398, 0, 0.5686275, 1, 1,
0.1923445, 1.079684, 0.648018, 0, 0.5607843, 1, 1,
0.1957921, -2.010232, 1.969762, 0, 0.5568628, 1, 1,
0.1959305, -1.090306, 4.684075, 0, 0.5490196, 1, 1,
0.1973368, 0.3569032, -1.186487, 0, 0.5450981, 1, 1,
0.1984057, 1.061985, 0.4720863, 0, 0.5372549, 1, 1,
0.200777, 0.154028, 0.4867823, 0, 0.5333334, 1, 1,
0.2024417, 0.4572971, 1.661935, 0, 0.5254902, 1, 1,
0.2040755, -1.288479, 0.9891085, 0, 0.5215687, 1, 1,
0.2080984, -1.054209, 4.363235, 0, 0.5137255, 1, 1,
0.2116282, 0.2234736, 2.504548, 0, 0.509804, 1, 1,
0.2134862, 0.6014888, 1.248782, 0, 0.5019608, 1, 1,
0.2154725, 0.3036273, 0.6972235, 0, 0.4941176, 1, 1,
0.2165988, 1.893188, 1.788324, 0, 0.4901961, 1, 1,
0.2188063, -0.5855184, 1.990027, 0, 0.4823529, 1, 1,
0.2277648, -0.4626533, 3.801427, 0, 0.4784314, 1, 1,
0.2303566, 0.9870734, -0.1804385, 0, 0.4705882, 1, 1,
0.2325484, -0.4948262, 3.053882, 0, 0.4666667, 1, 1,
0.234037, 1.287769, 0.02337717, 0, 0.4588235, 1, 1,
0.2461526, 1.805481, -0.8533676, 0, 0.454902, 1, 1,
0.2469442, 0.2562304, 0.02600773, 0, 0.4470588, 1, 1,
0.2489763, -0.5572936, 0.6002879, 0, 0.4431373, 1, 1,
0.2504371, -0.2714705, 2.518573, 0, 0.4352941, 1, 1,
0.2515632, 0.2059683, 0.411678, 0, 0.4313726, 1, 1,
0.2530831, -2.04588, 2.872617, 0, 0.4235294, 1, 1,
0.255139, -0.03485009, 2.666716, 0, 0.4196078, 1, 1,
0.2609191, 0.7793124, 0.1889682, 0, 0.4117647, 1, 1,
0.2615383, -0.2044858, 1.550954, 0, 0.4078431, 1, 1,
0.2616458, -0.8436601, 3.881046, 0, 0.4, 1, 1,
0.2645103, 1.411922, -0.3226121, 0, 0.3921569, 1, 1,
0.2662757, 0.7290419, 1.331633, 0, 0.3882353, 1, 1,
0.2703333, 0.8605165, 0.02722622, 0, 0.3803922, 1, 1,
0.2706652, -1.964348, 2.503749, 0, 0.3764706, 1, 1,
0.2707877, 0.6691961, 1.205945, 0, 0.3686275, 1, 1,
0.2739828, 0.92728, 0.2327954, 0, 0.3647059, 1, 1,
0.2766598, -0.8816643, 2.764883, 0, 0.3568628, 1, 1,
0.2780213, 1.241969, -0.5955315, 0, 0.3529412, 1, 1,
0.2780258, 2.108737, -0.6990438, 0, 0.345098, 1, 1,
0.2787235, 0.5278999, -0.4455719, 0, 0.3411765, 1, 1,
0.2806771, 1.007756, -0.6930524, 0, 0.3333333, 1, 1,
0.2821721, -1.885005, 4.334934, 0, 0.3294118, 1, 1,
0.2831625, 0.7670446, 0.4083007, 0, 0.3215686, 1, 1,
0.2838807, 0.9148775, 0.4036427, 0, 0.3176471, 1, 1,
0.2900891, -0.4600083, 3.936027, 0, 0.3098039, 1, 1,
0.2916273, 0.1800948, 0.9277896, 0, 0.3058824, 1, 1,
0.3010138, 1.114634, 0.2630028, 0, 0.2980392, 1, 1,
0.3055979, 0.4486473, 1.507538, 0, 0.2901961, 1, 1,
0.306222, 0.475112, 2.199324, 0, 0.2862745, 1, 1,
0.3098673, -1.280485, 2.848738, 0, 0.2784314, 1, 1,
0.3146969, -0.7991195, 3.974945, 0, 0.2745098, 1, 1,
0.3183315, 0.9327477, -0.7983518, 0, 0.2666667, 1, 1,
0.3186278, 0.3335208, 0.7981079, 0, 0.2627451, 1, 1,
0.3277363, -0.8605344, 4.083557, 0, 0.254902, 1, 1,
0.3295037, 0.408186, 0.2004679, 0, 0.2509804, 1, 1,
0.3347718, -2.02215, 2.313059, 0, 0.2431373, 1, 1,
0.3458105, -0.7661319, 1.738921, 0, 0.2392157, 1, 1,
0.3469607, -0.7827231, 2.761823, 0, 0.2313726, 1, 1,
0.3473426, 0.9368262, 0.333259, 0, 0.227451, 1, 1,
0.3475766, -1.378278, 2.669034, 0, 0.2196078, 1, 1,
0.3510712, 2.243755, 0.6623502, 0, 0.2156863, 1, 1,
0.3546775, 0.04087497, 0.9388028, 0, 0.2078431, 1, 1,
0.354742, 0.9176926, -0.2408277, 0, 0.2039216, 1, 1,
0.356303, -0.5702646, 1.895589, 0, 0.1960784, 1, 1,
0.362701, 0.9158778, 2.247621, 0, 0.1882353, 1, 1,
0.3648488, 0.2196241, 0.8251855, 0, 0.1843137, 1, 1,
0.3687998, 0.7075298, 1.585164, 0, 0.1764706, 1, 1,
0.372593, -0.3000789, 2.823153, 0, 0.172549, 1, 1,
0.373793, 0.3857934, 0.4823326, 0, 0.1647059, 1, 1,
0.3750689, -0.8049268, 2.414562, 0, 0.1607843, 1, 1,
0.3753474, -0.4487112, 0.509636, 0, 0.1529412, 1, 1,
0.3776594, -0.2208871, 3.77541, 0, 0.1490196, 1, 1,
0.3789822, 0.238509, 2.310669, 0, 0.1411765, 1, 1,
0.3796387, 0.6312227, 1.063738, 0, 0.1372549, 1, 1,
0.3819977, -0.1185921, 0.4656007, 0, 0.1294118, 1, 1,
0.3840787, 0.8155035, 0.3446875, 0, 0.1254902, 1, 1,
0.3850337, 0.529006, 1.454924, 0, 0.1176471, 1, 1,
0.3868835, -0.4105306, 3.062952, 0, 0.1137255, 1, 1,
0.3882822, -0.1244677, 2.358759, 0, 0.1058824, 1, 1,
0.3910061, -1.215807, 3.072269, 0, 0.09803922, 1, 1,
0.3920867, 0.293825, 0.8872896, 0, 0.09411765, 1, 1,
0.3930994, -0.3156207, 1.578948, 0, 0.08627451, 1, 1,
0.3962295, 0.3469175, 1.913759, 0, 0.08235294, 1, 1,
0.3974745, 1.167424, 1.456572, 0, 0.07450981, 1, 1,
0.3983701, -0.3646916, 2.057905, 0, 0.07058824, 1, 1,
0.3984075, 0.589059, 0.8853299, 0, 0.0627451, 1, 1,
0.4111132, -0.1565907, 1.24062, 0, 0.05882353, 1, 1,
0.4140262, -1.72702, 4.179855, 0, 0.05098039, 1, 1,
0.4158458, -0.749759, 1.386219, 0, 0.04705882, 1, 1,
0.4178318, 0.4095714, 2.399491, 0, 0.03921569, 1, 1,
0.4233437, -0.6240115, 2.672911, 0, 0.03529412, 1, 1,
0.4281671, -0.2959626, 2.971096, 0, 0.02745098, 1, 1,
0.4282491, -0.4779466, 1.792899, 0, 0.02352941, 1, 1,
0.431073, -1.35858, 2.584862, 0, 0.01568628, 1, 1,
0.4382344, -0.4004147, 2.20814, 0, 0.01176471, 1, 1,
0.4414309, -0.9250257, 1.550681, 0, 0.003921569, 1, 1,
0.4463985, -1.372888, 2.817832, 0.003921569, 0, 1, 1,
0.446446, -0.2934105, 3.919791, 0.007843138, 0, 1, 1,
0.4465212, 2.513155, 0.4077127, 0.01568628, 0, 1, 1,
0.4475065, -0.4946896, 2.658707, 0.01960784, 0, 1, 1,
0.4530208, -0.08322863, 1.683747, 0.02745098, 0, 1, 1,
0.4540273, 1.152194, -0.6202862, 0.03137255, 0, 1, 1,
0.4550035, -0.8038752, 3.663764, 0.03921569, 0, 1, 1,
0.4575999, 0.5809043, 1.566816, 0.04313726, 0, 1, 1,
0.458012, -0.8701634, 1.3033, 0.05098039, 0, 1, 1,
0.4591142, -1.361742, 1.047092, 0.05490196, 0, 1, 1,
0.4601056, -0.8215473, 3.889376, 0.0627451, 0, 1, 1,
0.4638764, -0.4624979, 1.978857, 0.06666667, 0, 1, 1,
0.4638974, -0.3968211, 0.2885598, 0.07450981, 0, 1, 1,
0.4774888, -1.823655, 3.954508, 0.07843138, 0, 1, 1,
0.4782867, 1.119121, 0.1472218, 0.08627451, 0, 1, 1,
0.4796856, 0.5616944, -0.7789828, 0.09019608, 0, 1, 1,
0.4845809, 0.7112413, 0.8990709, 0.09803922, 0, 1, 1,
0.4852281, 0.452828, 0.6896012, 0.1058824, 0, 1, 1,
0.488265, -0.4467451, 2.462158, 0.1098039, 0, 1, 1,
0.489933, 0.1416845, -0.1885761, 0.1176471, 0, 1, 1,
0.4976325, -0.2349695, 1.554515, 0.1215686, 0, 1, 1,
0.4984708, -0.6310228, 1.85953, 0.1294118, 0, 1, 1,
0.498555, -0.8201016, 2.838934, 0.1333333, 0, 1, 1,
0.5019504, -0.7322717, 3.522637, 0.1411765, 0, 1, 1,
0.5121032, -0.6554109, 2.894116, 0.145098, 0, 1, 1,
0.5125034, 0.3438581, 1.493981, 0.1529412, 0, 1, 1,
0.5159817, 0.4559515, -1.079694, 0.1568628, 0, 1, 1,
0.5189677, 2.792203, 1.153895, 0.1647059, 0, 1, 1,
0.5204986, 0.1867674, 0.4825744, 0.1686275, 0, 1, 1,
0.5222408, 0.2331969, -0.7557351, 0.1764706, 0, 1, 1,
0.5246498, 0.3672891, 0.570893, 0.1803922, 0, 1, 1,
0.5251223, -0.8314671, 2.938807, 0.1882353, 0, 1, 1,
0.5339504, 0.8502935, 1.103816, 0.1921569, 0, 1, 1,
0.5344973, -0.6687753, 3.108829, 0.2, 0, 1, 1,
0.5426419, -0.5546522, 2.457673, 0.2078431, 0, 1, 1,
0.5445947, -0.165001, 1.617292, 0.2117647, 0, 1, 1,
0.5448747, -0.09038665, 1.636921, 0.2196078, 0, 1, 1,
0.5456675, -1.534302, 3.44292, 0.2235294, 0, 1, 1,
0.5500622, 1.788198, 1.630049, 0.2313726, 0, 1, 1,
0.5510874, -0.5308254, 3.008743, 0.2352941, 0, 1, 1,
0.5514873, 0.3951211, 1.951448, 0.2431373, 0, 1, 1,
0.5569239, 0.4294284, 1.564442, 0.2470588, 0, 1, 1,
0.5590372, -0.6152469, 2.806135, 0.254902, 0, 1, 1,
0.5662212, 0.4674936, 0.4349876, 0.2588235, 0, 1, 1,
0.5694784, -0.1361789, 0.7910342, 0.2666667, 0, 1, 1,
0.5716762, -1.580244, 2.751724, 0.2705882, 0, 1, 1,
0.5730307, 1.591528, -1.191117, 0.2784314, 0, 1, 1,
0.5757596, -1.222544, 3.380337, 0.282353, 0, 1, 1,
0.5759651, -2.300649, 0.648204, 0.2901961, 0, 1, 1,
0.57719, 0.9809176, -0.6630943, 0.2941177, 0, 1, 1,
0.5839685, 0.6531535, 1.57954, 0.3019608, 0, 1, 1,
0.5929877, 1.215762, -0.2016212, 0.3098039, 0, 1, 1,
0.5967274, 1.802989, 0.8000874, 0.3137255, 0, 1, 1,
0.6010841, -1.641259, 2.180012, 0.3215686, 0, 1, 1,
0.6019271, -0.7421703, 1.846973, 0.3254902, 0, 1, 1,
0.6023028, 0.4705727, 2.910021, 0.3333333, 0, 1, 1,
0.6148145, 0.5988619, 2.05476, 0.3372549, 0, 1, 1,
0.6166441, -0.4556087, 2.671339, 0.345098, 0, 1, 1,
0.6192474, 0.6032646, -0.1019748, 0.3490196, 0, 1, 1,
0.6242654, -0.7365181, 1.144808, 0.3568628, 0, 1, 1,
0.6305907, -0.3348297, 2.331035, 0.3607843, 0, 1, 1,
0.6311883, 1.285629, 1.896183, 0.3686275, 0, 1, 1,
0.6383179, -0.4324303, 0.9921778, 0.372549, 0, 1, 1,
0.6396357, -1.335703, 2.85571, 0.3803922, 0, 1, 1,
0.6410798, -0.02405697, 1.789385, 0.3843137, 0, 1, 1,
0.6456259, 0.1339204, 0.1939151, 0.3921569, 0, 1, 1,
0.6464865, -1.112, 3.015659, 0.3960784, 0, 1, 1,
0.6474519, -1.243384, 0.8001527, 0.4039216, 0, 1, 1,
0.6513171, -0.2820639, 1.325241, 0.4117647, 0, 1, 1,
0.6547942, -0.5676308, 2.849398, 0.4156863, 0, 1, 1,
0.6605496, 0.1235733, 2.833005, 0.4235294, 0, 1, 1,
0.6607322, -1.390381, 2.992005, 0.427451, 0, 1, 1,
0.6676131, 1.140803, 0.01747353, 0.4352941, 0, 1, 1,
0.6704245, -0.3759704, 2.57061, 0.4392157, 0, 1, 1,
0.670912, 1.179608, 0.6235247, 0.4470588, 0, 1, 1,
0.6717117, -1.112062, 1.934749, 0.4509804, 0, 1, 1,
0.6726342, 2.276224, -0.4490759, 0.4588235, 0, 1, 1,
0.6732686, 0.1998582, 2.154455, 0.4627451, 0, 1, 1,
0.6752195, 0.3052922, 2.067964, 0.4705882, 0, 1, 1,
0.6773091, -0.02270593, 2.089864, 0.4745098, 0, 1, 1,
0.6780591, -1.044175, 3.835883, 0.4823529, 0, 1, 1,
0.6784347, 0.1900113, 1.466924, 0.4862745, 0, 1, 1,
0.6791973, 0.9538978, -0.839594, 0.4941176, 0, 1, 1,
0.6847725, -0.4481729, 2.35957, 0.5019608, 0, 1, 1,
0.6853006, 1.726095, 0.09777389, 0.5058824, 0, 1, 1,
0.6854368, -1.289065, 3.661242, 0.5137255, 0, 1, 1,
0.6855889, -1.383082, 3.477353, 0.5176471, 0, 1, 1,
0.6862878, -0.2169057, 2.083858, 0.5254902, 0, 1, 1,
0.6922281, -0.298235, 1.607607, 0.5294118, 0, 1, 1,
0.6935334, 1.586096, -0.3068627, 0.5372549, 0, 1, 1,
0.6953537, -0.5973164, 3.253473, 0.5411765, 0, 1, 1,
0.6960033, -0.08754703, 0.8813125, 0.5490196, 0, 1, 1,
0.6989174, -0.4181558, 2.586647, 0.5529412, 0, 1, 1,
0.7085487, 0.3909849, 1.343705, 0.5607843, 0, 1, 1,
0.7095296, -1.429745, 1.57364, 0.5647059, 0, 1, 1,
0.7115493, -1.367843, 3.529075, 0.572549, 0, 1, 1,
0.7174811, -0.08105778, 2.968307, 0.5764706, 0, 1, 1,
0.719842, 0.004205432, 0.7137174, 0.5843138, 0, 1, 1,
0.7332052, 0.5078428, 2.635906, 0.5882353, 0, 1, 1,
0.7380463, -0.1819921, 2.417424, 0.5960785, 0, 1, 1,
0.7403826, -0.9691427, 2.417821, 0.6039216, 0, 1, 1,
0.7442064, -0.2058037, 1.98086, 0.6078432, 0, 1, 1,
0.7450767, 0.2947118, 0.6072721, 0.6156863, 0, 1, 1,
0.747063, -1.59028, 3.315369, 0.6196079, 0, 1, 1,
0.7545147, -0.4240612, 0.6513655, 0.627451, 0, 1, 1,
0.7564964, 0.3919276, 0.7727639, 0.6313726, 0, 1, 1,
0.7578219, 0.1857947, 0.110334, 0.6392157, 0, 1, 1,
0.7585419, -0.6698821, 2.432671, 0.6431373, 0, 1, 1,
0.7784728, -1.417282, 3.889995, 0.6509804, 0, 1, 1,
0.7788746, -0.4572077, 1.570639, 0.654902, 0, 1, 1,
0.7877802, 0.2076021, -0.04018643, 0.6627451, 0, 1, 1,
0.7891528, 1.168281, -0.02851084, 0.6666667, 0, 1, 1,
0.7926079, -0.1836113, 3.557067, 0.6745098, 0, 1, 1,
0.800827, -1.398755, 1.943974, 0.6784314, 0, 1, 1,
0.8016191, 1.057343, 0.02879982, 0.6862745, 0, 1, 1,
0.8110591, 2.225166, -0.4048364, 0.6901961, 0, 1, 1,
0.8278657, -0.2425272, 2.35728, 0.6980392, 0, 1, 1,
0.832271, 1.578699, 0.8846678, 0.7058824, 0, 1, 1,
0.8350753, 1.206776, -1.269574, 0.7098039, 0, 1, 1,
0.8368478, -0.07014552, 2.16028, 0.7176471, 0, 1, 1,
0.8534474, -1.462432, 2.521497, 0.7215686, 0, 1, 1,
0.8559114, -0.2141922, 2.08917, 0.7294118, 0, 1, 1,
0.8574911, -0.5975748, 3.285264, 0.7333333, 0, 1, 1,
0.8601256, -0.5939515, 1.55191, 0.7411765, 0, 1, 1,
0.8637828, -0.958546, 2.848452, 0.7450981, 0, 1, 1,
0.865429, -1.435114, 1.991614, 0.7529412, 0, 1, 1,
0.8717043, -1.315914, 3.161026, 0.7568628, 0, 1, 1,
0.8737603, 0.5214911, 1.430503, 0.7647059, 0, 1, 1,
0.8830451, -0.4866582, 3.165889, 0.7686275, 0, 1, 1,
0.8875479, -0.2728201, 2.004642, 0.7764706, 0, 1, 1,
0.8901477, 0.1084451, 1.612388, 0.7803922, 0, 1, 1,
0.8914983, 0.5121167, 2.756162, 0.7882353, 0, 1, 1,
0.8953091, -0.1679386, 3.042392, 0.7921569, 0, 1, 1,
0.9012892, 2.540966, -0.7426804, 0.8, 0, 1, 1,
0.9018773, 1.964456, 0.0281942, 0.8078431, 0, 1, 1,
0.9022569, -1.651128, 2.983548, 0.8117647, 0, 1, 1,
0.9159645, -0.4926612, 3.578075, 0.8196079, 0, 1, 1,
0.9179009, -0.09598711, 0.669688, 0.8235294, 0, 1, 1,
0.9179724, 1.573686, -0.6153053, 0.8313726, 0, 1, 1,
0.9186383, -0.2841712, 1.717476, 0.8352941, 0, 1, 1,
0.9189957, 0.4678191, 0.4518096, 0.8431373, 0, 1, 1,
0.920948, -0.9212782, 3.556369, 0.8470588, 0, 1, 1,
0.9245791, -2.012297, 2.357101, 0.854902, 0, 1, 1,
0.9324006, 0.127837, 0.5945851, 0.8588235, 0, 1, 1,
0.9420562, 0.4650358, 1.331223, 0.8666667, 0, 1, 1,
0.9476412, 2.272594, 1.170118, 0.8705882, 0, 1, 1,
0.9507084, -0.7565496, 0.9603483, 0.8784314, 0, 1, 1,
0.9518437, -1.434895, 3.748356, 0.8823529, 0, 1, 1,
0.9553227, 0.04843371, 1.000125, 0.8901961, 0, 1, 1,
0.9568183, 0.3371107, 0.5987946, 0.8941177, 0, 1, 1,
0.962795, -1.500961, 2.939017, 0.9019608, 0, 1, 1,
0.9654683, 0.02454919, 1.781335, 0.9098039, 0, 1, 1,
0.9659321, -0.3871161, 1.070524, 0.9137255, 0, 1, 1,
0.9668461, 0.5965307, 0.03806014, 0.9215686, 0, 1, 1,
0.9710461, -0.6425117, 1.876279, 0.9254902, 0, 1, 1,
0.9714422, -1.032781, 2.736822, 0.9333333, 0, 1, 1,
0.9746855, -1.937758, 1.500168, 0.9372549, 0, 1, 1,
0.9770312, 0.4559378, 0.4868251, 0.945098, 0, 1, 1,
0.9796478, 0.5867772, 0.3245974, 0.9490196, 0, 1, 1,
0.9800549, -1.02143, 1.506215, 0.9568627, 0, 1, 1,
0.9811871, 0.1837023, 1.131436, 0.9607843, 0, 1, 1,
0.9826871, -0.27364, 2.163853, 0.9686275, 0, 1, 1,
0.9843089, -0.6918041, 2.85647, 0.972549, 0, 1, 1,
0.9857474, 0.9808349, 0.07790973, 0.9803922, 0, 1, 1,
0.9867075, 2.435104, 0.7254193, 0.9843137, 0, 1, 1,
0.9904972, 0.0391737, 2.385155, 0.9921569, 0, 1, 1,
0.9928393, 0.205086, 3.268472, 0.9960784, 0, 1, 1,
0.9940053, -0.1914911, 0.331326, 1, 0, 0.9960784, 1,
0.9941083, 0.5721925, 1.276864, 1, 0, 0.9882353, 1,
1.013698, -0.4470307, 0.7270259, 1, 0, 0.9843137, 1,
1.016754, -3.105838, 3.374213, 1, 0, 0.9764706, 1,
1.020338, -1.608886, 2.048908, 1, 0, 0.972549, 1,
1.027303, -0.4369605, 2.3191, 1, 0, 0.9647059, 1,
1.029016, 1.222508, 0.7166815, 1, 0, 0.9607843, 1,
1.031355, 0.1093371, 0.7325528, 1, 0, 0.9529412, 1,
1.03324, 0.4487062, 0.3610176, 1, 0, 0.9490196, 1,
1.041726, -0.3642594, 1.589291, 1, 0, 0.9411765, 1,
1.051201, -1.332183, 1.916677, 1, 0, 0.9372549, 1,
1.053746, 1.420542, 0.5533873, 1, 0, 0.9294118, 1,
1.06426, -0.2825949, 1.531902, 1, 0, 0.9254902, 1,
1.065143, 0.624618, 1.941972, 1, 0, 0.9176471, 1,
1.075377, 1.342856, -0.1466191, 1, 0, 0.9137255, 1,
1.075768, 0.2763782, 0.5234103, 1, 0, 0.9058824, 1,
1.078634, 0.6465647, -0.7247263, 1, 0, 0.9019608, 1,
1.079318, -1.200499, 3.057529, 1, 0, 0.8941177, 1,
1.082173, 2.042878, 1.015965, 1, 0, 0.8862745, 1,
1.091274, 1.977423, -0.4299237, 1, 0, 0.8823529, 1,
1.097648, -0.2214846, 2.511463, 1, 0, 0.8745098, 1,
1.101251, -1.037177, 2.47198, 1, 0, 0.8705882, 1,
1.114035, -1.559701, 4.232717, 1, 0, 0.8627451, 1,
1.117194, -1.28717, 2.078882, 1, 0, 0.8588235, 1,
1.123336, -0.5890074, 4.330152, 1, 0, 0.8509804, 1,
1.129609, -0.9220338, 1.744248, 1, 0, 0.8470588, 1,
1.130584, -1.817807, 0.868243, 1, 0, 0.8392157, 1,
1.136915, 0.6220735, 0.1003887, 1, 0, 0.8352941, 1,
1.151369, -0.9047903, 1.138607, 1, 0, 0.827451, 1,
1.151575, -1.600015, 2.931703, 1, 0, 0.8235294, 1,
1.153713, 0.5043735, 1.251174, 1, 0, 0.8156863, 1,
1.163881, 0.01537943, 2.173863, 1, 0, 0.8117647, 1,
1.166305, -0.9025161, 1.879227, 1, 0, 0.8039216, 1,
1.168725, 0.155917, 0.590284, 1, 0, 0.7960784, 1,
1.175609, 1.193161, 1.789166, 1, 0, 0.7921569, 1,
1.175635, -1.411485, 2.553397, 1, 0, 0.7843137, 1,
1.185531, 0.0105078, 0.93331, 1, 0, 0.7803922, 1,
1.186385, -1.05843, 2.724546, 1, 0, 0.772549, 1,
1.188216, -1.208037, 3.829582, 1, 0, 0.7686275, 1,
1.191709, -0.07831209, 1.995301, 1, 0, 0.7607843, 1,
1.198298, -1.547709, 3.713817, 1, 0, 0.7568628, 1,
1.202538, -2.27658, 1.945305, 1, 0, 0.7490196, 1,
1.204642, -0.6745864, 2.217813, 1, 0, 0.7450981, 1,
1.207258, 0.8101745, 1.342341, 1, 0, 0.7372549, 1,
1.212396, 0.2050049, 3.24076, 1, 0, 0.7333333, 1,
1.221599, 0.4753701, 0.02097121, 1, 0, 0.7254902, 1,
1.222472, -2.148473, 2.172149, 1, 0, 0.7215686, 1,
1.223956, -2.847921, 3.453173, 1, 0, 0.7137255, 1,
1.226392, -1.131183, 3.169951, 1, 0, 0.7098039, 1,
1.241943, -0.7647855, 2.125111, 1, 0, 0.7019608, 1,
1.250242, 2.736482, 1.817321, 1, 0, 0.6941177, 1,
1.252008, -0.8545158, 1.009805, 1, 0, 0.6901961, 1,
1.25288, -0.415893, 1.624684, 1, 0, 0.682353, 1,
1.254144, 1.53306, 1.780188, 1, 0, 0.6784314, 1,
1.256628, 0.02614878, 1.493055, 1, 0, 0.6705883, 1,
1.257099, 0.3800442, 0.2042557, 1, 0, 0.6666667, 1,
1.258478, 2.556936, -0.9585721, 1, 0, 0.6588235, 1,
1.26657, 1.354217, 1.768714, 1, 0, 0.654902, 1,
1.268904, 1.320036, 1.360293, 1, 0, 0.6470588, 1,
1.269517, 1.061106, 0.6525232, 1, 0, 0.6431373, 1,
1.272351, 1.798015, -0.4871572, 1, 0, 0.6352941, 1,
1.279183, 0.7513788, -0.2106696, 1, 0, 0.6313726, 1,
1.284614, -1.452734, 1.994687, 1, 0, 0.6235294, 1,
1.291807, 1.036947, 2.100359, 1, 0, 0.6196079, 1,
1.296077, -0.960062, 2.610278, 1, 0, 0.6117647, 1,
1.300266, 0.6904034, -1.015664, 1, 0, 0.6078432, 1,
1.307757, 0.7852623, 2.427393, 1, 0, 0.6, 1,
1.30858, 0.3776096, 1.237492, 1, 0, 0.5921569, 1,
1.313722, 0.08630713, 2.262073, 1, 0, 0.5882353, 1,
1.318124, 0.9122483, 0.8864394, 1, 0, 0.5803922, 1,
1.31925, -0.2082504, 3.045317, 1, 0, 0.5764706, 1,
1.319916, 1.489234, 1.301028, 1, 0, 0.5686275, 1,
1.32417, -0.003620029, 1.902591, 1, 0, 0.5647059, 1,
1.326094, -0.3095117, 2.193656, 1, 0, 0.5568628, 1,
1.329304, -1.015403, 2.07253, 1, 0, 0.5529412, 1,
1.336842, 0.9192637, 2.845517, 1, 0, 0.5450981, 1,
1.345299, -1.704968, 3.151726, 1, 0, 0.5411765, 1,
1.348427, 0.6481773, 0.4613586, 1, 0, 0.5333334, 1,
1.360495, 1.207936, -0.0008319109, 1, 0, 0.5294118, 1,
1.366171, 0.1907167, 0.8674562, 1, 0, 0.5215687, 1,
1.366277, -0.3954665, 1.376708, 1, 0, 0.5176471, 1,
1.366539, 1.904295, 0.5738716, 1, 0, 0.509804, 1,
1.371895, -1.191804, 3.291566, 1, 0, 0.5058824, 1,
1.37976, -0.9456591, 1.005987, 1, 0, 0.4980392, 1,
1.381989, 0.4933057, 1.457632, 1, 0, 0.4901961, 1,
1.389901, 1.077895, -0.03199513, 1, 0, 0.4862745, 1,
1.390528, -1.542439, 1.80082, 1, 0, 0.4784314, 1,
1.398839, -0.5407489, 0.791589, 1, 0, 0.4745098, 1,
1.398933, -0.407818, 0.9509646, 1, 0, 0.4666667, 1,
1.400953, -0.5818173, 2.372016, 1, 0, 0.4627451, 1,
1.404782, 0.2055369, 1.016356, 1, 0, 0.454902, 1,
1.40561, -2.754148, 2.686834, 1, 0, 0.4509804, 1,
1.410197, -0.7740703, 2.9568, 1, 0, 0.4431373, 1,
1.410272, 0.2937645, 0.4240744, 1, 0, 0.4392157, 1,
1.43565, -0.7612749, 0.785234, 1, 0, 0.4313726, 1,
1.441788, -2.453976, 3.38725, 1, 0, 0.427451, 1,
1.443974, -1.722701, 3.979859, 1, 0, 0.4196078, 1,
1.46088, 0.1002832, 1.716101, 1, 0, 0.4156863, 1,
1.468732, -0.176174, 2.183148, 1, 0, 0.4078431, 1,
1.48722, 1.335384, 2.526499, 1, 0, 0.4039216, 1,
1.502992, 0.7588587, -0.0736127, 1, 0, 0.3960784, 1,
1.508526, 0.23337, 1.499326, 1, 0, 0.3882353, 1,
1.519514, 0.5503643, 2.473419, 1, 0, 0.3843137, 1,
1.525687, -0.5153152, 2.88282, 1, 0, 0.3764706, 1,
1.533611, 0.4309134, 0.6535572, 1, 0, 0.372549, 1,
1.555615, -0.3358502, 1.275133, 1, 0, 0.3647059, 1,
1.575184, 0.6491433, 0.6540751, 1, 0, 0.3607843, 1,
1.576744, -0.692426, 2.79099, 1, 0, 0.3529412, 1,
1.581513, 1.274336, 2.03521, 1, 0, 0.3490196, 1,
1.589538, 0.05572799, 2.785985, 1, 0, 0.3411765, 1,
1.591225, -1.649198, 4.00574, 1, 0, 0.3372549, 1,
1.593565, -1.615027, 2.424591, 1, 0, 0.3294118, 1,
1.594218, -1.519332, 2.40724, 1, 0, 0.3254902, 1,
1.595381, 0.3356105, 2.129352, 1, 0, 0.3176471, 1,
1.625107, -3.127648, 2.433513, 1, 0, 0.3137255, 1,
1.63169, 0.424798, 1.41451, 1, 0, 0.3058824, 1,
1.65968, -1.143646, 3.334948, 1, 0, 0.2980392, 1,
1.663343, -0.4342496, 2.62252, 1, 0, 0.2941177, 1,
1.668029, -2.490507, 3.418775, 1, 0, 0.2862745, 1,
1.675627, 1.31046, 1.198113, 1, 0, 0.282353, 1,
1.677069, -0.6092938, 2.051876, 1, 0, 0.2745098, 1,
1.677458, -0.6305516, 1.536996, 1, 0, 0.2705882, 1,
1.691956, -1.483492, 2.073501, 1, 0, 0.2627451, 1,
1.692421, 0.01964046, 0.06158266, 1, 0, 0.2588235, 1,
1.694083, -1.396227, 2.920181, 1, 0, 0.2509804, 1,
1.697819, 0.7541121, 1.284086, 1, 0, 0.2470588, 1,
1.70218, 0.2569353, 0.3552497, 1, 0, 0.2392157, 1,
1.728062, 1.579789, -0.871609, 1, 0, 0.2352941, 1,
1.741047, -0.4177786, 1.426276, 1, 0, 0.227451, 1,
1.762774, -1.03619, 3.001751, 1, 0, 0.2235294, 1,
1.764591, -1.524619, 2.912292, 1, 0, 0.2156863, 1,
1.789814, -0.8024185, 2.371268, 1, 0, 0.2117647, 1,
1.838162, -0.2163264, 0.7940806, 1, 0, 0.2039216, 1,
1.843843, -0.2639914, 4.059371, 1, 0, 0.1960784, 1,
1.851272, -0.6589335, 2.481542, 1, 0, 0.1921569, 1,
1.85183, 0.8527834, 0.8230621, 1, 0, 0.1843137, 1,
1.868887, -2.487837, 1.314102, 1, 0, 0.1803922, 1,
1.875679, 0.4343064, 3.377857, 1, 0, 0.172549, 1,
1.876113, 0.3654084, 2.603162, 1, 0, 0.1686275, 1,
1.883943, -0.1518134, 2.369263, 1, 0, 0.1607843, 1,
1.889778, -2.39939, 1.451796, 1, 0, 0.1568628, 1,
1.894155, 0.5212916, 1.30877, 1, 0, 0.1490196, 1,
1.903912, 0.5037873, -0.1101685, 1, 0, 0.145098, 1,
1.907645, 0.06116953, 1.766841, 1, 0, 0.1372549, 1,
1.932969, 0.3730752, 1.166447, 1, 0, 0.1333333, 1,
1.958697, 0.3169171, 2.002253, 1, 0, 0.1254902, 1,
1.984781, 0.4356019, 0.5092753, 1, 0, 0.1215686, 1,
2.003756, -2.077382, 3.314305, 1, 0, 0.1137255, 1,
2.052779, 1.16338, 0.1493158, 1, 0, 0.1098039, 1,
2.065757, 0.7913618, -0.831586, 1, 0, 0.1019608, 1,
2.089622, -0.9381037, 2.460964, 1, 0, 0.09411765, 1,
2.091001, 0.2491355, 0.8573443, 1, 0, 0.09019608, 1,
2.105101, 0.209625, 1.34614, 1, 0, 0.08235294, 1,
2.166812, 0.01220021, 1.208567, 1, 0, 0.07843138, 1,
2.232729, -0.7170497, 3.506015, 1, 0, 0.07058824, 1,
2.39037, -0.6867407, 0.6938209, 1, 0, 0.06666667, 1,
2.409273, -0.2469123, 1.558831, 1, 0, 0.05882353, 1,
2.447618, -0.8782977, 0.2965035, 1, 0, 0.05490196, 1,
2.450127, -0.9086291, 2.253525, 1, 0, 0.04705882, 1,
2.674545, -0.5994207, 4.290713, 1, 0, 0.04313726, 1,
2.71326, 0.004324161, 2.693663, 1, 0, 0.03529412, 1,
2.717101, 0.0223503, 2.306185, 1, 0, 0.03137255, 1,
2.86835, 0.9492685, 1.547313, 1, 0, 0.02352941, 1,
2.879315, -0.01466279, 1.242502, 1, 0, 0.01960784, 1,
2.946997, -0.7653718, 0.5898348, 1, 0, 0.01176471, 1,
3.177141, 0.7552702, 1.042187, 1, 0, 0.007843138, 1
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
-0.1691401, -4.172837, -7.761638, 0, -0.5, 0.5, 0.5,
-0.1691401, -4.172837, -7.761638, 1, -0.5, 0.5, 0.5,
-0.1691401, -4.172837, -7.761638, 1, 1.5, 0.5, 0.5,
-0.1691401, -4.172837, -7.761638, 0, 1.5, 0.5, 0.5
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
-4.64981, -0.04449224, -7.761638, 0, -0.5, 0.5, 0.5,
-4.64981, -0.04449224, -7.761638, 1, -0.5, 0.5, 0.5,
-4.64981, -0.04449224, -7.761638, 1, 1.5, 0.5, 0.5,
-4.64981, -0.04449224, -7.761638, 0, 1.5, 0.5, 0.5
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
-4.64981, -4.172837, -0.375562, 0, -0.5, 0.5, 0.5,
-4.64981, -4.172837, -0.375562, 1, -0.5, 0.5, 0.5,
-4.64981, -4.172837, -0.375562, 1, 1.5, 0.5, 0.5,
-4.64981, -4.172837, -0.375562, 0, 1.5, 0.5, 0.5
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
-3, -3.220142, -6.057159,
3, -3.220142, -6.057159,
-3, -3.220142, -6.057159,
-3, -3.378925, -6.341238,
-2, -3.220142, -6.057159,
-2, -3.378925, -6.341238,
-1, -3.220142, -6.057159,
-1, -3.378925, -6.341238,
0, -3.220142, -6.057159,
0, -3.378925, -6.341238,
1, -3.220142, -6.057159,
1, -3.378925, -6.341238,
2, -3.220142, -6.057159,
2, -3.378925, -6.341238,
3, -3.220142, -6.057159,
3, -3.378925, -6.341238
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
-3, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
-3, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
-3, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
-3, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
-2, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
-2, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
-2, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
-2, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
-1, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
-1, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
-1, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
-1, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
0, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
0, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
0, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
0, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
1, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
1, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
1, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
1, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
2, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
2, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
2, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
2, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5,
3, -3.69649, -6.909399, 0, -0.5, 0.5, 0.5,
3, -3.69649, -6.909399, 1, -0.5, 0.5, 0.5,
3, -3.69649, -6.909399, 1, 1.5, 0.5, 0.5,
3, -3.69649, -6.909399, 0, 1.5, 0.5, 0.5
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
-3.615809, -3, -6.057159,
-3.615809, 3, -6.057159,
-3.615809, -3, -6.057159,
-3.788143, -3, -6.341238,
-3.615809, -2, -6.057159,
-3.788143, -2, -6.341238,
-3.615809, -1, -6.057159,
-3.788143, -1, -6.341238,
-3.615809, 0, -6.057159,
-3.788143, 0, -6.341238,
-3.615809, 1, -6.057159,
-3.788143, 1, -6.341238,
-3.615809, 2, -6.057159,
-3.788143, 2, -6.341238,
-3.615809, 3, -6.057159,
-3.788143, 3, -6.341238
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
-4.13281, -3, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, -3, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, -3, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, -3, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, -2, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, -2, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, -2, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, -2, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, -1, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, -1, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, -1, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, -1, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, 0, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, 0, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, 0, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, 0, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, 1, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, 1, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, 1, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, 1, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, 2, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, 2, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, 2, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, 2, -6.909399, 0, 1.5, 0.5, 0.5,
-4.13281, 3, -6.909399, 0, -0.5, 0.5, 0.5,
-4.13281, 3, -6.909399, 1, -0.5, 0.5, 0.5,
-4.13281, 3, -6.909399, 1, 1.5, 0.5, 0.5,
-4.13281, 3, -6.909399, 0, 1.5, 0.5, 0.5
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
-3.615809, -3.220142, -4,
-3.615809, -3.220142, 4,
-3.615809, -3.220142, -4,
-3.788143, -3.378925, -4,
-3.615809, -3.220142, -2,
-3.788143, -3.378925, -2,
-3.615809, -3.220142, 0,
-3.788143, -3.378925, 0,
-3.615809, -3.220142, 2,
-3.788143, -3.378925, 2,
-3.615809, -3.220142, 4,
-3.788143, -3.378925, 4
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
-4.13281, -3.69649, -4, 0, -0.5, 0.5, 0.5,
-4.13281, -3.69649, -4, 1, -0.5, 0.5, 0.5,
-4.13281, -3.69649, -4, 1, 1.5, 0.5, 0.5,
-4.13281, -3.69649, -4, 0, 1.5, 0.5, 0.5,
-4.13281, -3.69649, -2, 0, -0.5, 0.5, 0.5,
-4.13281, -3.69649, -2, 1, -0.5, 0.5, 0.5,
-4.13281, -3.69649, -2, 1, 1.5, 0.5, 0.5,
-4.13281, -3.69649, -2, 0, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 0, 0, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 0, 1, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 0, 1, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 0, 0, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 2, 0, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 2, 1, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 2, 1, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 2, 0, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 4, 0, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 4, 1, -0.5, 0.5, 0.5,
-4.13281, -3.69649, 4, 1, 1.5, 0.5, 0.5,
-4.13281, -3.69649, 4, 0, 1.5, 0.5, 0.5
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
-3.615809, -3.220142, -6.057159,
-3.615809, 3.131158, -6.057159,
-3.615809, -3.220142, 5.306035,
-3.615809, 3.131158, 5.306035,
-3.615809, -3.220142, -6.057159,
-3.615809, -3.220142, 5.306035,
-3.615809, 3.131158, -6.057159,
-3.615809, 3.131158, 5.306035,
-3.615809, -3.220142, -6.057159,
3.277529, -3.220142, -6.057159,
-3.615809, -3.220142, 5.306035,
3.277529, -3.220142, 5.306035,
-3.615809, 3.131158, -6.057159,
3.277529, 3.131158, -6.057159,
-3.615809, 3.131158, 5.306035,
3.277529, 3.131158, 5.306035,
3.277529, -3.220142, -6.057159,
3.277529, 3.131158, -6.057159,
3.277529, -3.220142, 5.306035,
3.277529, 3.131158, 5.306035,
3.277529, -3.220142, -6.057159,
3.277529, -3.220142, 5.306035,
3.277529, 3.131158, -6.057159,
3.277529, 3.131158, 5.306035
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
var radius = 7.86565;
var distance = 34.99516;
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
mvMatrix.translate( 0.1691401, 0.04449224, 0.375562 );
mvMatrix.scale( 1.233727, 1.339016, 0.7484247 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99516);
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


