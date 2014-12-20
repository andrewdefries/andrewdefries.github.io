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
-3.37673, -0.1839844, -1.932601, 1, 0, 0, 1,
-3.17967, 0.3133518, -1.183035, 1, 0.007843138, 0, 1,
-3.013709, -0.7689986, -1.635702, 1, 0.01176471, 0, 1,
-2.938827, 2.550087, -0.8677378, 1, 0.01960784, 0, 1,
-2.879524, -1.073204, -2.523144, 1, 0.02352941, 0, 1,
-2.765603, 1.890944, -1.324375, 1, 0.03137255, 0, 1,
-2.71214, -1.242447, -1.727485, 1, 0.03529412, 0, 1,
-2.634426, 2.192618, -0.8590676, 1, 0.04313726, 0, 1,
-2.604719, -0.285089, -1.550049, 1, 0.04705882, 0, 1,
-2.483909, -0.2749921, -1.571846, 1, 0.05490196, 0, 1,
-2.404037, -0.04846301, -1.711018, 1, 0.05882353, 0, 1,
-2.39731, 1.549374, -2.00159, 1, 0.06666667, 0, 1,
-2.387264, -0.2332518, -2.645495, 1, 0.07058824, 0, 1,
-2.269906, 0.9812393, 0.04703843, 1, 0.07843138, 0, 1,
-2.259656, -0.1490834, -1.493176, 1, 0.08235294, 0, 1,
-2.247352, -1.02025, -2.226929, 1, 0.09019608, 0, 1,
-2.229301, 1.890291, -0.4925986, 1, 0.09411765, 0, 1,
-2.209225, 0.9500939, -0.1513116, 1, 0.1019608, 0, 1,
-2.164696, 2.456331, -0.3041402, 1, 0.1098039, 0, 1,
-2.127368, -0.215636, -2.140839, 1, 0.1137255, 0, 1,
-2.117841, -0.1917838, -0.8714669, 1, 0.1215686, 0, 1,
-2.068328, 0.4175203, -2.201331, 1, 0.1254902, 0, 1,
-2.061116, -0.07811363, -2.853733, 1, 0.1333333, 0, 1,
-2.048184, 0.4320068, -2.168224, 1, 0.1372549, 0, 1,
-2.016837, 0.3189071, 0.03907656, 1, 0.145098, 0, 1,
-2.004189, -0.2281655, 0.03052175, 1, 0.1490196, 0, 1,
-1.998214, 1.289475, 0.1397599, 1, 0.1568628, 0, 1,
-1.989065, -0.8710671, -2.049873, 1, 0.1607843, 0, 1,
-1.987164, -0.2444024, -0.9834324, 1, 0.1686275, 0, 1,
-1.974969, -0.6197364, -0.5710963, 1, 0.172549, 0, 1,
-1.973093, 1.435415, -2.295558, 1, 0.1803922, 0, 1,
-1.955719, 0.9660219, -1.853727, 1, 0.1843137, 0, 1,
-1.926504, -1.814994, -3.912248, 1, 0.1921569, 0, 1,
-1.905567, -0.2024073, -2.830886, 1, 0.1960784, 0, 1,
-1.892983, -1.398345, -0.5803037, 1, 0.2039216, 0, 1,
-1.849444, 0.0674197, -2.247121, 1, 0.2117647, 0, 1,
-1.847029, -1.733118, -1.343729, 1, 0.2156863, 0, 1,
-1.806652, -1.764334, -1.828182, 1, 0.2235294, 0, 1,
-1.802081, 0.742105, -0.6359364, 1, 0.227451, 0, 1,
-1.795995, -0.9503575, -2.439562, 1, 0.2352941, 0, 1,
-1.789494, 1.927218, -1.439546, 1, 0.2392157, 0, 1,
-1.782487, 0.4180878, -1.052404, 1, 0.2470588, 0, 1,
-1.746914, 0.4880596, -1.210331, 1, 0.2509804, 0, 1,
-1.746693, 1.658544, 1.151039, 1, 0.2588235, 0, 1,
-1.73967, -0.4902545, -0.60948, 1, 0.2627451, 0, 1,
-1.73731, 0.9675687, 1.024521, 1, 0.2705882, 0, 1,
-1.730206, -0.1903931, -2.294242, 1, 0.2745098, 0, 1,
-1.718951, 0.383239, -0.8481907, 1, 0.282353, 0, 1,
-1.71748, -2.012081, -2.659455, 1, 0.2862745, 0, 1,
-1.714486, 0.3946017, -1.869924, 1, 0.2941177, 0, 1,
-1.708336, -1.711728, -0.7915496, 1, 0.3019608, 0, 1,
-1.701306, 0.2489797, -1.130168, 1, 0.3058824, 0, 1,
-1.697591, -0.7917282, -3.774737, 1, 0.3137255, 0, 1,
-1.691033, -0.9524847, -2.874161, 1, 0.3176471, 0, 1,
-1.689135, -2.266428, -2.586254, 1, 0.3254902, 0, 1,
-1.663311, 0.7659738, 1.152259, 1, 0.3294118, 0, 1,
-1.658376, 1.725475, 1.854695, 1, 0.3372549, 0, 1,
-1.657156, -0.9235069, -1.052896, 1, 0.3411765, 0, 1,
-1.652711, 0.114701, -2.212297, 1, 0.3490196, 0, 1,
-1.641671, -1.648545, -3.595684, 1, 0.3529412, 0, 1,
-1.641313, -0.04158238, -1.533613, 1, 0.3607843, 0, 1,
-1.634879, 0.6801275, -1.021626, 1, 0.3647059, 0, 1,
-1.632218, -0.1892497, -2.949975, 1, 0.372549, 0, 1,
-1.630332, -1.175864, -3.072015, 1, 0.3764706, 0, 1,
-1.625108, 0.5710431, -1.809806, 1, 0.3843137, 0, 1,
-1.622687, 2.311064, -0.4550771, 1, 0.3882353, 0, 1,
-1.620649, 1.395277, -1.590566, 1, 0.3960784, 0, 1,
-1.612506, -0.2715561, -0.01413654, 1, 0.4039216, 0, 1,
-1.608648, -1.230083, -2.364786, 1, 0.4078431, 0, 1,
-1.607202, -0.2161234, -1.610144, 1, 0.4156863, 0, 1,
-1.602556, 0.07990149, -1.648558, 1, 0.4196078, 0, 1,
-1.600961, -0.1812269, -1.697783, 1, 0.427451, 0, 1,
-1.598769, -0.1379763, -2.535645, 1, 0.4313726, 0, 1,
-1.596823, -1.219876, -2.493889, 1, 0.4392157, 0, 1,
-1.591154, 0.111129, -0.6453202, 1, 0.4431373, 0, 1,
-1.591138, 0.6132704, -2.102946, 1, 0.4509804, 0, 1,
-1.586617, 0.403093, -2.336733, 1, 0.454902, 0, 1,
-1.573472, -0.2143268, -0.4159946, 1, 0.4627451, 0, 1,
-1.567989, 0.5198414, -0.09923273, 1, 0.4666667, 0, 1,
-1.553414, 0.6089308, 0.01030816, 1, 0.4745098, 0, 1,
-1.552019, 0.6027356, -0.3999666, 1, 0.4784314, 0, 1,
-1.543485, -0.4381864, -0.8723363, 1, 0.4862745, 0, 1,
-1.532931, 0.3621398, -0.813997, 1, 0.4901961, 0, 1,
-1.530827, -1.730943, -4.589502, 1, 0.4980392, 0, 1,
-1.509027, -2.849647, -1.113037, 1, 0.5058824, 0, 1,
-1.500559, 0.3611376, -2.654845, 1, 0.509804, 0, 1,
-1.49998, 1.23755, -0.7128808, 1, 0.5176471, 0, 1,
-1.498562, 0.02749838, -3.04487, 1, 0.5215687, 0, 1,
-1.489401, 0.2583317, 0.5226521, 1, 0.5294118, 0, 1,
-1.486348, -0.2869533, -2.504535, 1, 0.5333334, 0, 1,
-1.483044, 2.178465, 0.1788979, 1, 0.5411765, 0, 1,
-1.481282, 2.389115, -0.5677707, 1, 0.5450981, 0, 1,
-1.478697, -0.9790652, -1.502163, 1, 0.5529412, 0, 1,
-1.476679, -0.7613089, -2.28447, 1, 0.5568628, 0, 1,
-1.47177, -0.590233, -1.560898, 1, 0.5647059, 0, 1,
-1.456096, 0.5784344, -0.6067938, 1, 0.5686275, 0, 1,
-1.45161, 0.1780551, -0.6997141, 1, 0.5764706, 0, 1,
-1.451036, -0.07799108, -2.527085, 1, 0.5803922, 0, 1,
-1.435962, -0.8898449, -3.17154, 1, 0.5882353, 0, 1,
-1.420511, -0.5961404, -2.001784, 1, 0.5921569, 0, 1,
-1.416311, 0.1040739, 0.7442275, 1, 0.6, 0, 1,
-1.406151, -2.026065, -2.13558, 1, 0.6078432, 0, 1,
-1.397505, -0.8386251, -2.191084, 1, 0.6117647, 0, 1,
-1.395608, -1.659223, -2.285452, 1, 0.6196079, 0, 1,
-1.393653, -0.9851849, -2.704773, 1, 0.6235294, 0, 1,
-1.375466, 0.1052565, 0.1387594, 1, 0.6313726, 0, 1,
-1.369855, -0.8005646, -2.684078, 1, 0.6352941, 0, 1,
-1.369608, 1.183544, -0.1628778, 1, 0.6431373, 0, 1,
-1.345759, 2.050217, -1.365783, 1, 0.6470588, 0, 1,
-1.344375, 0.5570403, -0.7910285, 1, 0.654902, 0, 1,
-1.336286, 1.485692, -2.201133, 1, 0.6588235, 0, 1,
-1.336182, -0.4095491, -1.968781, 1, 0.6666667, 0, 1,
-1.334106, -0.5011827, -3.747609, 1, 0.6705883, 0, 1,
-1.333654, 0.7968887, -0.8208179, 1, 0.6784314, 0, 1,
-1.331002, 0.5001531, -0.3557092, 1, 0.682353, 0, 1,
-1.328413, -0.8152966, -1.280754, 1, 0.6901961, 0, 1,
-1.3103, -1.451207, -2.608988, 1, 0.6941177, 0, 1,
-1.292918, -1.22523, -2.409567, 1, 0.7019608, 0, 1,
-1.278999, 1.086918, -1.452636, 1, 0.7098039, 0, 1,
-1.272631, 1.984821, -0.9385939, 1, 0.7137255, 0, 1,
-1.268162, -1.188023, -0.6704129, 1, 0.7215686, 0, 1,
-1.257485, -0.132463, -1.738252, 1, 0.7254902, 0, 1,
-1.242889, -1.270674, -4.065986, 1, 0.7333333, 0, 1,
-1.232769, -0.4852328, -0.7424353, 1, 0.7372549, 0, 1,
-1.222904, 1.302266, -0.4121478, 1, 0.7450981, 0, 1,
-1.217803, -0.6527441, -3.638378, 1, 0.7490196, 0, 1,
-1.206237, 1.68488, 0.1918795, 1, 0.7568628, 0, 1,
-1.19269, 0.5654898, -2.495436, 1, 0.7607843, 0, 1,
-1.188805, -0.2496772, -3.359181, 1, 0.7686275, 0, 1,
-1.185861, 0.3239575, -1.130616, 1, 0.772549, 0, 1,
-1.182295, -0.7597412, -1.243476, 1, 0.7803922, 0, 1,
-1.172682, -1.089984, -2.446458, 1, 0.7843137, 0, 1,
-1.152323, -0.4815274, -2.823351, 1, 0.7921569, 0, 1,
-1.143579, 0.08247446, -2.376242, 1, 0.7960784, 0, 1,
-1.142769, 0.7866573, -3.252652, 1, 0.8039216, 0, 1,
-1.142617, -2.565068, -2.887463, 1, 0.8117647, 0, 1,
-1.135949, -0.8440894, -0.6047076, 1, 0.8156863, 0, 1,
-1.135089, -0.05786552, -2.354997, 1, 0.8235294, 0, 1,
-1.130606, -0.6028982, -1.825507, 1, 0.827451, 0, 1,
-1.125794, 1.767439, 1.110722, 1, 0.8352941, 0, 1,
-1.12487, 1.3491, -1.06051, 1, 0.8392157, 0, 1,
-1.118711, 0.2026612, -1.725907, 1, 0.8470588, 0, 1,
-1.117543, -0.01223249, -1.810014, 1, 0.8509804, 0, 1,
-1.099419, 1.383771, -1.076128, 1, 0.8588235, 0, 1,
-1.084981, 1.504924, 0.560261, 1, 0.8627451, 0, 1,
-1.080898, 0.6432587, -2.639023, 1, 0.8705882, 0, 1,
-1.078317, 0.05185586, -3.028346, 1, 0.8745098, 0, 1,
-1.06981, 1.02137, -0.7502527, 1, 0.8823529, 0, 1,
-1.05862, 0.4365278, -2.139159, 1, 0.8862745, 0, 1,
-1.051651, -0.285662, -2.459776, 1, 0.8941177, 0, 1,
-1.047603, 1.22541, -0.5142661, 1, 0.8980392, 0, 1,
-1.041579, -0.1813972, -2.182601, 1, 0.9058824, 0, 1,
-1.041384, -0.7770418, -3.041136, 1, 0.9137255, 0, 1,
-1.037787, 2.2718, 0.4479809, 1, 0.9176471, 0, 1,
-1.030857, -0.4437143, -2.242847, 1, 0.9254902, 0, 1,
-1.027756, 1.185005, -2.365919, 1, 0.9294118, 0, 1,
-1.027747, 0.1961336, -2.196076, 1, 0.9372549, 0, 1,
-1.025667, 1.559873, -2.060618, 1, 0.9411765, 0, 1,
-1.02207, 0.5999146, -1.055301, 1, 0.9490196, 0, 1,
-1.018527, 1.517501, -0.4282658, 1, 0.9529412, 0, 1,
-1.015483, 1.289585, -0.8809881, 1, 0.9607843, 0, 1,
-1.012787, 0.550485, -0.1116447, 1, 0.9647059, 0, 1,
-1.011233, -1.312763, -3.298309, 1, 0.972549, 0, 1,
-1.011184, 0.3246844, -0.975915, 1, 0.9764706, 0, 1,
-1.010315, -0.02308426, -0.8944727, 1, 0.9843137, 0, 1,
-1.009783, -0.1573841, 0.1792416, 1, 0.9882353, 0, 1,
-1.005291, -0.7005759, -2.152105, 1, 0.9960784, 0, 1,
-1.000531, -1.23192, -2.956509, 0.9960784, 1, 0, 1,
-0.9884799, 1.778584, -2.53036, 0.9921569, 1, 0, 1,
-0.983635, 1.005962, -0.9261435, 0.9843137, 1, 0, 1,
-0.9688303, 0.8083637, -2.146122, 0.9803922, 1, 0, 1,
-0.9660481, -0.9469979, -1.340901, 0.972549, 1, 0, 1,
-0.9628859, 1.108964, -0.4889692, 0.9686275, 1, 0, 1,
-0.9521886, 0.3930614, -1.124518, 0.9607843, 1, 0, 1,
-0.9484807, 1.795689, -0.9663544, 0.9568627, 1, 0, 1,
-0.9480526, -0.8685044, -2.624295, 0.9490196, 1, 0, 1,
-0.9471024, -1.182918, -2.756162, 0.945098, 1, 0, 1,
-0.9462704, 1.104362, -0.900858, 0.9372549, 1, 0, 1,
-0.9454947, -0.3365659, -3.56162, 0.9333333, 1, 0, 1,
-0.9438412, 0.8426942, -0.8157179, 0.9254902, 1, 0, 1,
-0.9410751, -1.735276, -2.746512, 0.9215686, 1, 0, 1,
-0.9349245, -1.662161, -3.700646, 0.9137255, 1, 0, 1,
-0.9310344, 0.1202127, -0.9679439, 0.9098039, 1, 0, 1,
-0.9296971, -1.303766, -2.229282, 0.9019608, 1, 0, 1,
-0.9259644, 0.2314009, -1.479854, 0.8941177, 1, 0, 1,
-0.9221536, -1.367852, -2.318826, 0.8901961, 1, 0, 1,
-0.9194791, -0.2386206, -0.8299983, 0.8823529, 1, 0, 1,
-0.9193211, 1.118706, 0.7116463, 0.8784314, 1, 0, 1,
-0.9173855, -0.9185419, -1.55517, 0.8705882, 1, 0, 1,
-0.9102936, -0.8073501, -3.481899, 0.8666667, 1, 0, 1,
-0.9072418, 0.4496582, -1.264367, 0.8588235, 1, 0, 1,
-0.8992494, 0.8559585, -0.568274, 0.854902, 1, 0, 1,
-0.8985798, -0.3208917, -1.75603, 0.8470588, 1, 0, 1,
-0.881084, -0.05165982, -1.482592, 0.8431373, 1, 0, 1,
-0.8710914, -1.355496, -2.425334, 0.8352941, 1, 0, 1,
-0.8596244, 0.5202652, -2.760453, 0.8313726, 1, 0, 1,
-0.8543653, -2.270262, -4.172282, 0.8235294, 1, 0, 1,
-0.8356299, 0.4754449, -2.297621, 0.8196079, 1, 0, 1,
-0.8349744, 1.526782, -0.4370532, 0.8117647, 1, 0, 1,
-0.8205156, -2.009001, -2.361714, 0.8078431, 1, 0, 1,
-0.8157429, -0.7076674, -2.472898, 0.8, 1, 0, 1,
-0.8152149, 0.9056693, 0.3368022, 0.7921569, 1, 0, 1,
-0.8131651, 0.9141981, -0.617526, 0.7882353, 1, 0, 1,
-0.808453, 0.6438401, -1.810584, 0.7803922, 1, 0, 1,
-0.8059271, 0.6512735, -1.481173, 0.7764706, 1, 0, 1,
-0.8027732, 1.097832, -1.820375, 0.7686275, 1, 0, 1,
-0.8025341, 0.5732797, -1.328109, 0.7647059, 1, 0, 1,
-0.7983696, -0.5054057, -1.239706, 0.7568628, 1, 0, 1,
-0.7939239, -2.376685, -2.201409, 0.7529412, 1, 0, 1,
-0.7925915, 0.8493996, -1.822834, 0.7450981, 1, 0, 1,
-0.7872775, -0.4235519, -2.050072, 0.7411765, 1, 0, 1,
-0.7865005, 1.320491, -1.78984, 0.7333333, 1, 0, 1,
-0.7862158, -1.568705, -0.5537656, 0.7294118, 1, 0, 1,
-0.7822475, 0.3193556, -1.251859, 0.7215686, 1, 0, 1,
-0.7795621, 1.003886, -1.902743, 0.7176471, 1, 0, 1,
-0.7751097, 0.6994698, -0.6634748, 0.7098039, 1, 0, 1,
-0.7705657, 0.1399675, -1.843051, 0.7058824, 1, 0, 1,
-0.7628155, -0.5144488, -1.260234, 0.6980392, 1, 0, 1,
-0.7575061, -0.8664066, -2.224109, 0.6901961, 1, 0, 1,
-0.754872, 0.1635963, -0.8163177, 0.6862745, 1, 0, 1,
-0.7482689, 1.170962, -1.75141, 0.6784314, 1, 0, 1,
-0.7468503, 0.4535623, -2.112388, 0.6745098, 1, 0, 1,
-0.7449573, -0.01335077, -2.540982, 0.6666667, 1, 0, 1,
-0.7419878, 0.3933852, -0.4807118, 0.6627451, 1, 0, 1,
-0.7409283, -1.259292, -1.149777, 0.654902, 1, 0, 1,
-0.7347467, 1.871559, -0.2492312, 0.6509804, 1, 0, 1,
-0.7341016, 0.08968634, -1.167322, 0.6431373, 1, 0, 1,
-0.7316259, -1.413435, -2.662685, 0.6392157, 1, 0, 1,
-0.7265766, -0.880447, -4.021288, 0.6313726, 1, 0, 1,
-0.7245244, 0.6391857, -1.575152, 0.627451, 1, 0, 1,
-0.7244893, -2.07548, -0.8907552, 0.6196079, 1, 0, 1,
-0.7168831, 1.60592, 1.49571, 0.6156863, 1, 0, 1,
-0.7166743, 0.4261056, -0.7778134, 0.6078432, 1, 0, 1,
-0.7116896, -1.491183, -1.77576, 0.6039216, 1, 0, 1,
-0.7098397, 0.9183158, -1.515227, 0.5960785, 1, 0, 1,
-0.7096815, -1.177118, -1.633007, 0.5882353, 1, 0, 1,
-0.7091034, 0.07257301, -2.029999, 0.5843138, 1, 0, 1,
-0.7047291, 0.9789832, -1.358908, 0.5764706, 1, 0, 1,
-0.7034349, -0.6039847, -2.164528, 0.572549, 1, 0, 1,
-0.7024968, -0.7034755, -3.288245, 0.5647059, 1, 0, 1,
-0.699407, 0.6896131, -0.5038542, 0.5607843, 1, 0, 1,
-0.6970716, -1.044615, -2.53806, 0.5529412, 1, 0, 1,
-0.6961394, -0.2867058, -1.99248, 0.5490196, 1, 0, 1,
-0.6954437, -0.3256222, -2.182092, 0.5411765, 1, 0, 1,
-0.6944039, 1.011224, -1.164541, 0.5372549, 1, 0, 1,
-0.6940609, -0.7644442, -1.66973, 0.5294118, 1, 0, 1,
-0.6920929, -1.472002, -2.484905, 0.5254902, 1, 0, 1,
-0.6893985, -0.4222383, -1.23577, 0.5176471, 1, 0, 1,
-0.6892606, -0.6701525, -3.788108, 0.5137255, 1, 0, 1,
-0.6846003, -0.258232, -2.209668, 0.5058824, 1, 0, 1,
-0.6829351, 1.866128, 0.6060616, 0.5019608, 1, 0, 1,
-0.6762827, 1.923236, 0.7572317, 0.4941176, 1, 0, 1,
-0.6762289, 0.2108281, 0.08993205, 0.4862745, 1, 0, 1,
-0.675664, -0.4046367, -2.200848, 0.4823529, 1, 0, 1,
-0.6721153, -0.4808697, -3.354274, 0.4745098, 1, 0, 1,
-0.6699281, 0.7615684, -1.447168, 0.4705882, 1, 0, 1,
-0.6686822, 1.66043, -1.340387, 0.4627451, 1, 0, 1,
-0.664408, 0.7070673, -1.75989, 0.4588235, 1, 0, 1,
-0.6642733, 1.951702, -0.146193, 0.4509804, 1, 0, 1,
-0.6615694, -0.440207, -1.456741, 0.4470588, 1, 0, 1,
-0.6613244, 0.7781596, -1.558387, 0.4392157, 1, 0, 1,
-0.6605648, 0.2583863, 0.004862775, 0.4352941, 1, 0, 1,
-0.65728, 0.5063366, -0.7472872, 0.427451, 1, 0, 1,
-0.6524153, 0.5420732, -0.7929257, 0.4235294, 1, 0, 1,
-0.6466836, 1.355258, -0.8701313, 0.4156863, 1, 0, 1,
-0.6448133, -0.7489989, -3.09121, 0.4117647, 1, 0, 1,
-0.6448087, 0.7656884, 0.06284077, 0.4039216, 1, 0, 1,
-0.6418748, -0.3397941, -2.042968, 0.3960784, 1, 0, 1,
-0.6386288, -1.268256, -1.990345, 0.3921569, 1, 0, 1,
-0.6382692, 1.285753, 0.16954, 0.3843137, 1, 0, 1,
-0.6381052, 0.0896873, -1.743051, 0.3803922, 1, 0, 1,
-0.6374243, -0.1483907, -0.753339, 0.372549, 1, 0, 1,
-0.6349914, -0.6058863, -1.725834, 0.3686275, 1, 0, 1,
-0.6304588, 1.114466, -1.847037, 0.3607843, 1, 0, 1,
-0.6272376, 0.6345801, 0.570492, 0.3568628, 1, 0, 1,
-0.6271994, -1.496496, -2.66553, 0.3490196, 1, 0, 1,
-0.6245917, -0.6224266, -3.129017, 0.345098, 1, 0, 1,
-0.6241165, -0.2891475, -0.5076314, 0.3372549, 1, 0, 1,
-0.6219005, 0.9723607, -0.04948316, 0.3333333, 1, 0, 1,
-0.6173107, 0.3546944, 0.2202927, 0.3254902, 1, 0, 1,
-0.6117628, -1.522633, -4.123382, 0.3215686, 1, 0, 1,
-0.6087314, -1.34442, -4.235631, 0.3137255, 1, 0, 1,
-0.6032197, -0.4977665, -3.36531, 0.3098039, 1, 0, 1,
-0.6014885, -0.6305588, -2.34084, 0.3019608, 1, 0, 1,
-0.6007477, -1.022289, -1.311643, 0.2941177, 1, 0, 1,
-0.5985249, 1.625882, -0.1351863, 0.2901961, 1, 0, 1,
-0.5954426, -0.314197, -1.848585, 0.282353, 1, 0, 1,
-0.594788, -0.7291314, -2.80219, 0.2784314, 1, 0, 1,
-0.5925853, 0.2892921, -1.857442, 0.2705882, 1, 0, 1,
-0.5924478, -1.677037, -2.599783, 0.2666667, 1, 0, 1,
-0.5922134, 1.327024, -1.682518, 0.2588235, 1, 0, 1,
-0.5855504, 1.307927, -1.802359, 0.254902, 1, 0, 1,
-0.5838967, -0.342141, -2.512441, 0.2470588, 1, 0, 1,
-0.5811802, -0.3246002, -0.8004928, 0.2431373, 1, 0, 1,
-0.5769846, 1.61973, -1.324876, 0.2352941, 1, 0, 1,
-0.5755957, -0.9645377, -3.599087, 0.2313726, 1, 0, 1,
-0.5686531, -0.1728141, 2.689961, 0.2235294, 1, 0, 1,
-0.5664707, -2.1755, -2.069836, 0.2196078, 1, 0, 1,
-0.5644758, -0.9611256, -1.332305, 0.2117647, 1, 0, 1,
-0.5635283, 0.05956861, -3.455734, 0.2078431, 1, 0, 1,
-0.5616643, -0.7393358, -0.6133552, 0.2, 1, 0, 1,
-0.5542021, 0.8282491, -1.213695, 0.1921569, 1, 0, 1,
-0.5516769, -0.2380066, -0.4538911, 0.1882353, 1, 0, 1,
-0.5471381, -0.1933467, -5.255938, 0.1803922, 1, 0, 1,
-0.5441498, 0.6415488, -0.6403821, 0.1764706, 1, 0, 1,
-0.5424713, -1.331495, -3.506963, 0.1686275, 1, 0, 1,
-0.5410141, -0.1151603, -1.205373, 0.1647059, 1, 0, 1,
-0.540134, -1.211365, -3.328778, 0.1568628, 1, 0, 1,
-0.5334171, -0.01067448, -1.034607, 0.1529412, 1, 0, 1,
-0.5331282, -0.847743, -3.541353, 0.145098, 1, 0, 1,
-0.5316665, 0.5766194, -0.3976808, 0.1411765, 1, 0, 1,
-0.5297313, 0.400579, -1.03162, 0.1333333, 1, 0, 1,
-0.5289184, -0.3188546, -1.124853, 0.1294118, 1, 0, 1,
-0.5247345, 0.9971406, -1.135798, 0.1215686, 1, 0, 1,
-0.5245058, -2.612958, -2.92726, 0.1176471, 1, 0, 1,
-0.5240306, -0.9851192, -2.653984, 0.1098039, 1, 0, 1,
-0.5227978, 1.328615, 1.690085, 0.1058824, 1, 0, 1,
-0.5226939, 0.4665817, -1.39714, 0.09803922, 1, 0, 1,
-0.5220729, -2.793588, -3.245242, 0.09019608, 1, 0, 1,
-0.5220478, 0.4451705, -1.702965, 0.08627451, 1, 0, 1,
-0.5175878, -1.103832, -2.647413, 0.07843138, 1, 0, 1,
-0.5168543, -1.242362, -4.610042, 0.07450981, 1, 0, 1,
-0.5146517, 0.1096419, -2.042326, 0.06666667, 1, 0, 1,
-0.5141609, -0.2910274, -3.04188, 0.0627451, 1, 0, 1,
-0.5141224, 0.02950614, -1.172887, 0.05490196, 1, 0, 1,
-0.5134147, 0.4479162, -0.4654584, 0.05098039, 1, 0, 1,
-0.5077118, -1.375698, -2.339964, 0.04313726, 1, 0, 1,
-0.5059612, 0.5397263, 0.4304279, 0.03921569, 1, 0, 1,
-0.5055757, -0.124933, -2.496017, 0.03137255, 1, 0, 1,
-0.5028992, 1.208143, 0.1649863, 0.02745098, 1, 0, 1,
-0.5025092, -0.6032125, -0.04307161, 0.01960784, 1, 0, 1,
-0.499117, -1.718308, -2.785975, 0.01568628, 1, 0, 1,
-0.4982255, -0.1288346, -2.567385, 0.007843138, 1, 0, 1,
-0.4948205, -0.5162103, -4.333241, 0.003921569, 1, 0, 1,
-0.4930714, -0.2287806, -1.543995, 0, 1, 0.003921569, 1,
-0.4882617, 0.1752095, -0.7478589, 0, 1, 0.01176471, 1,
-0.4707648, -1.260175, -3.42555, 0, 1, 0.01568628, 1,
-0.4698431, -1.369, -1.185894, 0, 1, 0.02352941, 1,
-0.468359, -1.87776, -2.08844, 0, 1, 0.02745098, 1,
-0.4673649, 0.4552439, -1.061342, 0, 1, 0.03529412, 1,
-0.46435, 1.082168, -0.2385866, 0, 1, 0.03921569, 1,
-0.4635661, -0.102777, -2.373206, 0, 1, 0.04705882, 1,
-0.4623269, 0.01623456, -0.5553169, 0, 1, 0.05098039, 1,
-0.4621703, -0.3060625, -1.444384, 0, 1, 0.05882353, 1,
-0.4586851, 1.969555, 1.046329, 0, 1, 0.0627451, 1,
-0.4580013, -0.0310721, -1.016922, 0, 1, 0.07058824, 1,
-0.4563079, -0.08677815, -2.504942, 0, 1, 0.07450981, 1,
-0.4542953, -1.430686, -2.275181, 0, 1, 0.08235294, 1,
-0.4514553, -0.7610924, -1.712453, 0, 1, 0.08627451, 1,
-0.4504856, 0.8218202, -0.225247, 0, 1, 0.09411765, 1,
-0.4500597, 0.4752631, -1.015524, 0, 1, 0.1019608, 1,
-0.4492085, 0.4188054, -0.2349494, 0, 1, 0.1058824, 1,
-0.4491867, 0.01362023, -2.091542, 0, 1, 0.1137255, 1,
-0.4471582, 1.601556, -1.662433, 0, 1, 0.1176471, 1,
-0.4421934, -0.6137478, -3.045684, 0, 1, 0.1254902, 1,
-0.4383354, 1.474381, 0.5764636, 0, 1, 0.1294118, 1,
-0.4372288, 0.2064114, -0.6767847, 0, 1, 0.1372549, 1,
-0.4363424, 2.8167, 0.404588, 0, 1, 0.1411765, 1,
-0.4320617, -1.818389, -3.125107, 0, 1, 0.1490196, 1,
-0.431179, 2.136826, -1.580791, 0, 1, 0.1529412, 1,
-0.4306683, -0.9863697, -3.143895, 0, 1, 0.1607843, 1,
-0.429066, -0.2669113, -3.689285, 0, 1, 0.1647059, 1,
-0.4218285, 1.033754, -0.6408738, 0, 1, 0.172549, 1,
-0.4187567, -0.3780226, -2.1394, 0, 1, 0.1764706, 1,
-0.4141814, -2.105019, -3.316905, 0, 1, 0.1843137, 1,
-0.4126385, -1.081214, -3.238014, 0, 1, 0.1882353, 1,
-0.4035231, 1.657507, -0.03214974, 0, 1, 0.1960784, 1,
-0.4018966, 0.4923903, -0.5918027, 0, 1, 0.2039216, 1,
-0.3987318, 0.5022017, 0.2838545, 0, 1, 0.2078431, 1,
-0.392868, 0.102341, -1.848747, 0, 1, 0.2156863, 1,
-0.3917544, -1.692632, -0.9633515, 0, 1, 0.2196078, 1,
-0.380677, 1.188513, -0.8525429, 0, 1, 0.227451, 1,
-0.3801035, -0.5433345, -2.010827, 0, 1, 0.2313726, 1,
-0.379028, -1.368475, -1.228145, 0, 1, 0.2392157, 1,
-0.3763749, -0.162206, -2.950849, 0, 1, 0.2431373, 1,
-0.3756321, 0.7512887, -0.143623, 0, 1, 0.2509804, 1,
-0.3737602, -0.5235046, -1.587488, 0, 1, 0.254902, 1,
-0.3713388, -0.04544938, -2.066109, 0, 1, 0.2627451, 1,
-0.3684491, -0.2372289, -1.675021, 0, 1, 0.2666667, 1,
-0.3666645, -1.378826, -3.14428, 0, 1, 0.2745098, 1,
-0.3634667, 0.5447181, -0.04209611, 0, 1, 0.2784314, 1,
-0.3607489, -0.777244, -3.853666, 0, 1, 0.2862745, 1,
-0.3553461, 1.139052, 0.8049657, 0, 1, 0.2901961, 1,
-0.3499225, -1.316995, -2.698903, 0, 1, 0.2980392, 1,
-0.3449626, -0.254515, -4.923915, 0, 1, 0.3058824, 1,
-0.3444107, 0.8152411, 1.044248, 0, 1, 0.3098039, 1,
-0.3389066, -0.1104796, -2.02028, 0, 1, 0.3176471, 1,
-0.3373421, -0.4711838, -1.759161, 0, 1, 0.3215686, 1,
-0.3311817, -0.08654275, -2.841161, 0, 1, 0.3294118, 1,
-0.3305237, -0.7074471, -1.863885, 0, 1, 0.3333333, 1,
-0.3279038, -0.1335423, -2.106265, 0, 1, 0.3411765, 1,
-0.3268758, 1.203432, -1.596149, 0, 1, 0.345098, 1,
-0.3264531, -0.1806918, -0.9860322, 0, 1, 0.3529412, 1,
-0.3232736, -0.7104908, -1.465248, 0, 1, 0.3568628, 1,
-0.311839, 0.01832716, 1.499106, 0, 1, 0.3647059, 1,
-0.3073004, -0.6293092, -3.009171, 0, 1, 0.3686275, 1,
-0.3064481, 0.5234856, 0.100051, 0, 1, 0.3764706, 1,
-0.3046121, -0.8987765, -2.464668, 0, 1, 0.3803922, 1,
-0.3037081, 0.09266984, -2.195081, 0, 1, 0.3882353, 1,
-0.3024466, -0.859775, -2.650838, 0, 1, 0.3921569, 1,
-0.3019973, 1.357659, -0.2517641, 0, 1, 0.4, 1,
-0.2983955, -0.8991342, -3.626533, 0, 1, 0.4078431, 1,
-0.2976191, 0.5900595, 0.1647414, 0, 1, 0.4117647, 1,
-0.2960042, -0.4787232, -1.677226, 0, 1, 0.4196078, 1,
-0.2939891, 1.293933, -0.651758, 0, 1, 0.4235294, 1,
-0.2886805, -0.03489949, -2.518026, 0, 1, 0.4313726, 1,
-0.2886007, 0.008812632, -2.09237, 0, 1, 0.4352941, 1,
-0.2879131, 0.5093451, -1.835711, 0, 1, 0.4431373, 1,
-0.283835, 0.7264861, -0.4733529, 0, 1, 0.4470588, 1,
-0.2802907, 0.712398, -0.575519, 0, 1, 0.454902, 1,
-0.2763139, 0.01695624, 0.672024, 0, 1, 0.4588235, 1,
-0.2686826, -0.7030119, -1.776626, 0, 1, 0.4666667, 1,
-0.2682634, 1.06586, 0.5194503, 0, 1, 0.4705882, 1,
-0.265683, -1.334655, -3.664583, 0, 1, 0.4784314, 1,
-0.2599615, 0.06566322, -1.027719, 0, 1, 0.4823529, 1,
-0.2574444, -0.4040425, -1.792322, 0, 1, 0.4901961, 1,
-0.2571169, 0.5743185, -0.4982768, 0, 1, 0.4941176, 1,
-0.2557569, -0.03003051, -1.241516, 0, 1, 0.5019608, 1,
-0.2552791, -0.5063668, -0.5790112, 0, 1, 0.509804, 1,
-0.2508097, -0.2945328, -1.590177, 0, 1, 0.5137255, 1,
-0.2493692, -1.732211, -3.587514, 0, 1, 0.5215687, 1,
-0.2447146, 0.4297026, 0.1830794, 0, 1, 0.5254902, 1,
-0.2436333, -0.6007756, -1.642404, 0, 1, 0.5333334, 1,
-0.2414955, -0.3723247, -2.410466, 0, 1, 0.5372549, 1,
-0.2386567, 0.8121201, 0.6148132, 0, 1, 0.5450981, 1,
-0.2383714, 1.634492, 0.5815183, 0, 1, 0.5490196, 1,
-0.2377987, -0.4560188, -2.929198, 0, 1, 0.5568628, 1,
-0.2376084, 1.78673, 0.07081918, 0, 1, 0.5607843, 1,
-0.2373207, -1.355252, -3.650986, 0, 1, 0.5686275, 1,
-0.2288058, 0.4480548, -0.6370111, 0, 1, 0.572549, 1,
-0.214976, 1.010767, -1.570829, 0, 1, 0.5803922, 1,
-0.2142084, 0.1692956, -1.861984, 0, 1, 0.5843138, 1,
-0.2131156, 1.193388, -0.4315435, 0, 1, 0.5921569, 1,
-0.2128735, 1.087177, 0.3746436, 0, 1, 0.5960785, 1,
-0.2123585, -0.4307152, -2.074002, 0, 1, 0.6039216, 1,
-0.2118105, 0.1877034, -0.974174, 0, 1, 0.6117647, 1,
-0.2100865, -1.074296, -3.217616, 0, 1, 0.6156863, 1,
-0.2075563, 1.899993, 1.735394, 0, 1, 0.6235294, 1,
-0.2018583, 0.5931923, -0.9967113, 0, 1, 0.627451, 1,
-0.2014021, 1.05263, 0.6848542, 0, 1, 0.6352941, 1,
-0.2012498, -1.823954, -2.892197, 0, 1, 0.6392157, 1,
-0.2007231, -0.268449, -4.836314, 0, 1, 0.6470588, 1,
-0.1901824, 1.662925, -1.496722, 0, 1, 0.6509804, 1,
-0.1878007, -1.909967, -2.670442, 0, 1, 0.6588235, 1,
-0.1873506, -1.106189, -1.727415, 0, 1, 0.6627451, 1,
-0.184158, 1.266874, -0.2804078, 0, 1, 0.6705883, 1,
-0.1794817, -1.138073, -2.922986, 0, 1, 0.6745098, 1,
-0.1776836, -1.029274, -3.023179, 0, 1, 0.682353, 1,
-0.177172, -0.8130242, -2.346688, 0, 1, 0.6862745, 1,
-0.1770035, 0.3550797, -0.6799151, 0, 1, 0.6941177, 1,
-0.175305, 0.7283067, -0.557788, 0, 1, 0.7019608, 1,
-0.1679366, 0.906579, 0.297396, 0, 1, 0.7058824, 1,
-0.1632299, -2.09536, -2.625139, 0, 1, 0.7137255, 1,
-0.1600147, -0.3735003, -3.01784, 0, 1, 0.7176471, 1,
-0.1597882, 0.8002853, 0.7630946, 0, 1, 0.7254902, 1,
-0.15932, -0.2259339, -3.815826, 0, 1, 0.7294118, 1,
-0.158052, 0.8809419, -1.529285, 0, 1, 0.7372549, 1,
-0.1567191, -0.6311054, -2.65595, 0, 1, 0.7411765, 1,
-0.1491163, -2.188661, -2.619306, 0, 1, 0.7490196, 1,
-0.1476754, -0.6070144, -1.692011, 0, 1, 0.7529412, 1,
-0.1439223, -0.9109589, -2.25551, 0, 1, 0.7607843, 1,
-0.1411667, -0.5524089, -3.316147, 0, 1, 0.7647059, 1,
-0.1393881, 0.1245001, 1.026616, 0, 1, 0.772549, 1,
-0.1393687, 1.448051, 0.4581285, 0, 1, 0.7764706, 1,
-0.1336512, -2.559935, -1.87971, 0, 1, 0.7843137, 1,
-0.1321535, -0.1397631, -2.146923, 0, 1, 0.7882353, 1,
-0.1307161, -0.03011245, -2.393703, 0, 1, 0.7960784, 1,
-0.1235131, 0.6635929, -2.872295, 0, 1, 0.8039216, 1,
-0.1193186, -0.784605, -3.611443, 0, 1, 0.8078431, 1,
-0.1192104, -0.8005669, -3.525718, 0, 1, 0.8156863, 1,
-0.1187697, 0.2245986, 0.3880019, 0, 1, 0.8196079, 1,
-0.1185945, -0.129244, -2.688306, 0, 1, 0.827451, 1,
-0.1088778, -1.016166, -4.119182, 0, 1, 0.8313726, 1,
-0.1038592, -0.6041284, -2.93342, 0, 1, 0.8392157, 1,
-0.09665554, -0.328103, -3.460068, 0, 1, 0.8431373, 1,
-0.08861268, 0.5138812, -0.9625874, 0, 1, 0.8509804, 1,
-0.08789815, 0.5914127, 1.221191, 0, 1, 0.854902, 1,
-0.07837788, 1.118626, -1.034203, 0, 1, 0.8627451, 1,
-0.0747826, -0.5181813, -3.348479, 0, 1, 0.8666667, 1,
-0.07451956, 0.8558704, -1.382422, 0, 1, 0.8745098, 1,
-0.07154703, -0.7764016, -3.054832, 0, 1, 0.8784314, 1,
-0.06842716, 1.232046, 1.56731, 0, 1, 0.8862745, 1,
-0.06546122, 1.072282, 1.48199, 0, 1, 0.8901961, 1,
-0.06325137, -0.0388242, -1.541206, 0, 1, 0.8980392, 1,
-0.062613, -0.4481321, -3.207324, 0, 1, 0.9058824, 1,
-0.05947566, -2.338586, -4.805792, 0, 1, 0.9098039, 1,
-0.05547566, -0.1353157, -3.447907, 0, 1, 0.9176471, 1,
-0.05504366, 0.2684934, 0.8476746, 0, 1, 0.9215686, 1,
-0.05291004, -1.253267, -4.395797, 0, 1, 0.9294118, 1,
-0.05199387, -1.710429, -3.093398, 0, 1, 0.9333333, 1,
-0.05164072, 0.9955547, 0.6075282, 0, 1, 0.9411765, 1,
-0.04989249, -1.067517, -1.733298, 0, 1, 0.945098, 1,
-0.04534195, -1.500594, -4.072394, 0, 1, 0.9529412, 1,
-0.04436915, 1.039596, -1.033277, 0, 1, 0.9568627, 1,
-0.04434261, -0.6568247, -3.981178, 0, 1, 0.9647059, 1,
-0.04399311, -0.3990912, -2.81806, 0, 1, 0.9686275, 1,
-0.03583394, -1.30417, -2.735666, 0, 1, 0.9764706, 1,
-0.0334675, -0.4961204, -2.311403, 0, 1, 0.9803922, 1,
-0.02827355, -1.001916, -1.781905, 0, 1, 0.9882353, 1,
-0.02825564, 0.7775853, 1.67291, 0, 1, 0.9921569, 1,
-0.02639445, 0.9008146, -0.4126961, 0, 1, 1, 1,
-0.0255172, 1.328983, -0.9897049, 0, 0.9921569, 1, 1,
-0.0224703, -0.5028211, -4.109862, 0, 0.9882353, 1, 1,
-0.02239338, 0.8360736, 1.553113, 0, 0.9803922, 1, 1,
-0.02172435, 0.2683974, 0.515415, 0, 0.9764706, 1, 1,
-0.01999653, -1.026734, -2.769722, 0, 0.9686275, 1, 1,
-0.01730723, 0.9253343, 0.8000802, 0, 0.9647059, 1, 1,
-0.01657025, -0.7581615, -4.669993, 0, 0.9568627, 1, 1,
-0.0159463, -1.024587, -4.320187, 0, 0.9529412, 1, 1,
-0.01447896, 0.238336, 0.3164302, 0, 0.945098, 1, 1,
-0.01268391, -0.8157389, -3.42567, 0, 0.9411765, 1, 1,
-0.009344744, 0.6089146, 0.06867423, 0, 0.9333333, 1, 1,
-0.007703982, 0.2883143, -0.003601615, 0, 0.9294118, 1, 1,
0.0007791849, 0.6902678, -0.4523036, 0, 0.9215686, 1, 1,
0.00177848, -0.4431263, 4.86061, 0, 0.9176471, 1, 1,
0.002884586, -1.135472, 1.151148, 0, 0.9098039, 1, 1,
0.003259512, -0.1483028, 6.334806, 0, 0.9058824, 1, 1,
0.005157507, 0.2582843, -1.019992, 0, 0.8980392, 1, 1,
0.01057079, -1.063405, 3.596119, 0, 0.8901961, 1, 1,
0.01502557, 0.1321828, -0.8408136, 0, 0.8862745, 1, 1,
0.02179815, -1.500874, 3.59647, 0, 0.8784314, 1, 1,
0.02795288, -2.166594, 3.471519, 0, 0.8745098, 1, 1,
0.02884918, 0.4948175, -1.846404, 0, 0.8666667, 1, 1,
0.03245756, -0.3224095, 4.192982, 0, 0.8627451, 1, 1,
0.03506259, 1.143335, -0.3304699, 0, 0.854902, 1, 1,
0.03925871, 1.278962, -0.1917218, 0, 0.8509804, 1, 1,
0.04435905, -0.5575061, 1.315147, 0, 0.8431373, 1, 1,
0.04449752, -0.1504368, 2.547468, 0, 0.8392157, 1, 1,
0.04779899, -0.1180798, 2.882446, 0, 0.8313726, 1, 1,
0.04874063, 0.1146178, 0.9447737, 0, 0.827451, 1, 1,
0.05012121, -0.3454868, 2.684696, 0, 0.8196079, 1, 1,
0.05257253, -0.4556157, 2.167942, 0, 0.8156863, 1, 1,
0.05387205, 0.281346, 0.674565, 0, 0.8078431, 1, 1,
0.05475235, -1.094727, 2.761547, 0, 0.8039216, 1, 1,
0.05796974, 0.0188828, -0.7304274, 0, 0.7960784, 1, 1,
0.0586646, 0.7561411, -1.093889, 0, 0.7882353, 1, 1,
0.06375837, -0.3926245, 2.871585, 0, 0.7843137, 1, 1,
0.07377335, -0.8418351, 1.987236, 0, 0.7764706, 1, 1,
0.07395662, 0.5543189, -0.03459617, 0, 0.772549, 1, 1,
0.07443082, 0.8025628, 0.3134665, 0, 0.7647059, 1, 1,
0.07577678, 1.095801, 0.3748637, 0, 0.7607843, 1, 1,
0.07593235, 0.693114, -0.2382527, 0, 0.7529412, 1, 1,
0.08046061, -1.657075, 3.345443, 0, 0.7490196, 1, 1,
0.0806501, 1.196895, 0.2070712, 0, 0.7411765, 1, 1,
0.08125149, 0.7143207, 0.08063832, 0, 0.7372549, 1, 1,
0.08560129, 1.24607, 1.183462, 0, 0.7294118, 1, 1,
0.09470261, -0.2069011, 2.945972, 0, 0.7254902, 1, 1,
0.09537091, 2.269637, 0.3855586, 0, 0.7176471, 1, 1,
0.09620239, -1.363439, 4.358347, 0, 0.7137255, 1, 1,
0.09993026, 1.01274, -0.8268536, 0, 0.7058824, 1, 1,
0.1016957, -0.7623119, 0.2922369, 0, 0.6980392, 1, 1,
0.1090391, -0.6242477, 2.870169, 0, 0.6941177, 1, 1,
0.1095914, 2.134283, 1.425751, 0, 0.6862745, 1, 1,
0.1113937, 0.07736917, 1.819106, 0, 0.682353, 1, 1,
0.1130553, 0.4561804, 0.9928092, 0, 0.6745098, 1, 1,
0.1153488, 0.5148137, -0.7315823, 0, 0.6705883, 1, 1,
0.116406, 0.06848855, 1.393595, 0, 0.6627451, 1, 1,
0.1170719, 1.252132, 0.8002338, 0, 0.6588235, 1, 1,
0.1195002, 0.07516632, 0.5854747, 0, 0.6509804, 1, 1,
0.1217297, -0.8779483, 3.668836, 0, 0.6470588, 1, 1,
0.1243417, -0.1134721, -0.7423849, 0, 0.6392157, 1, 1,
0.1244198, 0.8336612, 1.907423, 0, 0.6352941, 1, 1,
0.1244418, 0.1386594, 1.013809, 0, 0.627451, 1, 1,
0.1322493, 0.1860077, 0.471608, 0, 0.6235294, 1, 1,
0.1335455, -1.135412, 2.29478, 0, 0.6156863, 1, 1,
0.1343571, 0.2663838, -0.5759011, 0, 0.6117647, 1, 1,
0.1394251, -0.9953818, 2.763441, 0, 0.6039216, 1, 1,
0.1450498, -0.6814396, 2.409576, 0, 0.5960785, 1, 1,
0.1459879, -0.7518755, 1.747555, 0, 0.5921569, 1, 1,
0.1463374, -0.5852666, 2.622169, 0, 0.5843138, 1, 1,
0.1519881, 0.5784413, 0.8298383, 0, 0.5803922, 1, 1,
0.1526967, -0.3404056, 2.635344, 0, 0.572549, 1, 1,
0.1600896, -1.133058, 1.912224, 0, 0.5686275, 1, 1,
0.1610532, -0.3780939, 4.410997, 0, 0.5607843, 1, 1,
0.1616034, 1.00656, 0.01910799, 0, 0.5568628, 1, 1,
0.1649681, -0.9708483, 1.501551, 0, 0.5490196, 1, 1,
0.1650648, -0.06858695, 0.8017601, 0, 0.5450981, 1, 1,
0.1671895, -0.1807597, 3.748533, 0, 0.5372549, 1, 1,
0.167738, -0.646199, 2.943077, 0, 0.5333334, 1, 1,
0.1701946, 0.7513081, 3.727093, 0, 0.5254902, 1, 1,
0.1703823, -0.04692624, 2.183562, 0, 0.5215687, 1, 1,
0.1713248, 0.9877042, 0.9179816, 0, 0.5137255, 1, 1,
0.1716868, 0.03762729, 0.2030396, 0, 0.509804, 1, 1,
0.1745328, 1.339547, -1.283898, 0, 0.5019608, 1, 1,
0.1773421, -1.55207, 2.410939, 0, 0.4941176, 1, 1,
0.1813615, -0.2344974, 1.66072, 0, 0.4901961, 1, 1,
0.182668, -0.2065706, 2.929098, 0, 0.4823529, 1, 1,
0.190952, -0.153804, 1.784783, 0, 0.4784314, 1, 1,
0.1943559, -0.005826123, 1.07599, 0, 0.4705882, 1, 1,
0.1979192, -0.1702756, 1.65994, 0, 0.4666667, 1, 1,
0.2009435, 0.6113118, 0.8034326, 0, 0.4588235, 1, 1,
0.2013977, 1.050793, 0.5105767, 0, 0.454902, 1, 1,
0.2046454, 0.715589, -0.6189609, 0, 0.4470588, 1, 1,
0.2058896, -1.590918, 2.543409, 0, 0.4431373, 1, 1,
0.2088394, 2.208646, 0.8721319, 0, 0.4352941, 1, 1,
0.2121259, 0.816475, -1.221923, 0, 0.4313726, 1, 1,
0.2207165, -1.380011, 3.487322, 0, 0.4235294, 1, 1,
0.2214273, -0.748753, 2.022493, 0, 0.4196078, 1, 1,
0.2238432, 0.1362875, 2.442508, 0, 0.4117647, 1, 1,
0.2258066, 0.7426827, -1.077871, 0, 0.4078431, 1, 1,
0.2326791, -0.1763808, 1.299961, 0, 0.4, 1, 1,
0.235043, -1.531822, 3.39813, 0, 0.3921569, 1, 1,
0.2364648, 0.154258, 0.2015947, 0, 0.3882353, 1, 1,
0.2366606, -1.487334, 2.886745, 0, 0.3803922, 1, 1,
0.2381135, -0.1037643, 2.207536, 0, 0.3764706, 1, 1,
0.2403654, 0.06385498, 0.499947, 0, 0.3686275, 1, 1,
0.2420272, -0.6845921, 3.790049, 0, 0.3647059, 1, 1,
0.2426328, 0.1442651, -0.1663742, 0, 0.3568628, 1, 1,
0.2464992, -1.244405, 4.525284, 0, 0.3529412, 1, 1,
0.2530541, -1.334372, 3.724373, 0, 0.345098, 1, 1,
0.2543221, 0.4940033, 1.618627, 0, 0.3411765, 1, 1,
0.2554905, -0.1716489, 0.9063069, 0, 0.3333333, 1, 1,
0.2556223, 0.5670179, -1.832172, 0, 0.3294118, 1, 1,
0.2566878, -1.267084, 2.574658, 0, 0.3215686, 1, 1,
0.2588793, 0.6693465, 0.1685234, 0, 0.3176471, 1, 1,
0.2611655, -0.1081965, 2.758674, 0, 0.3098039, 1, 1,
0.262007, 0.8760145, 0.3633015, 0, 0.3058824, 1, 1,
0.262215, -0.4620048, 2.315601, 0, 0.2980392, 1, 1,
0.2624022, 0.05623087, 1.682171, 0, 0.2901961, 1, 1,
0.2642897, 0.2255271, 0.7105664, 0, 0.2862745, 1, 1,
0.2651261, 1.151582, 0.8095736, 0, 0.2784314, 1, 1,
0.2651696, -0.1645518, 1.878659, 0, 0.2745098, 1, 1,
0.2683991, 0.482385, -0.6752354, 0, 0.2666667, 1, 1,
0.2712139, -0.4448841, 2.314494, 0, 0.2627451, 1, 1,
0.2712702, -0.4707648, 2.622666, 0, 0.254902, 1, 1,
0.272191, -0.1581963, 3.375876, 0, 0.2509804, 1, 1,
0.2753436, -0.6222997, 3.661252, 0, 0.2431373, 1, 1,
0.2763335, 0.5238969, -0.08476459, 0, 0.2392157, 1, 1,
0.2764324, -0.4894533, 2.525187, 0, 0.2313726, 1, 1,
0.2787871, -1.13827, 2.241434, 0, 0.227451, 1, 1,
0.2815113, -0.628174, 1.637772, 0, 0.2196078, 1, 1,
0.2854389, 0.1839616, 1.133032, 0, 0.2156863, 1, 1,
0.287562, -0.4450101, 2.085166, 0, 0.2078431, 1, 1,
0.2914341, -0.06077367, 1.50882, 0, 0.2039216, 1, 1,
0.2945716, 0.532347, 0.2955043, 0, 0.1960784, 1, 1,
0.2948498, -0.3688923, 0.7055722, 0, 0.1882353, 1, 1,
0.2969789, -1.032477, 4.09181, 0, 0.1843137, 1, 1,
0.2979337, -1.703916, 2.483169, 0, 0.1764706, 1, 1,
0.2981554, 1.878369, 0.9783977, 0, 0.172549, 1, 1,
0.3001541, -1.594738, 4.978361, 0, 0.1647059, 1, 1,
0.3058682, -0.282299, 2.993416, 0, 0.1607843, 1, 1,
0.3060167, 0.2796806, 2.08427, 0, 0.1529412, 1, 1,
0.3061005, -1.135943, 3.774574, 0, 0.1490196, 1, 1,
0.3125332, 0.982749, 1.535321, 0, 0.1411765, 1, 1,
0.3128471, -0.6853859, 1.342665, 0, 0.1372549, 1, 1,
0.3155931, 0.7165883, 2.019357, 0, 0.1294118, 1, 1,
0.3161414, -0.3382961, 2.379493, 0, 0.1254902, 1, 1,
0.3176576, 0.384262, -0.8546534, 0, 0.1176471, 1, 1,
0.3201595, 0.6132306, 1.83128, 0, 0.1137255, 1, 1,
0.3213267, -1.351416, 1.780288, 0, 0.1058824, 1, 1,
0.3229713, -1.215985, 2.073285, 0, 0.09803922, 1, 1,
0.3295541, 0.1073979, 1.255673, 0, 0.09411765, 1, 1,
0.330638, 0.3354483, 1.967018, 0, 0.08627451, 1, 1,
0.331927, 2.177468, -0.9252891, 0, 0.08235294, 1, 1,
0.3337249, -1.735444, 2.000608, 0, 0.07450981, 1, 1,
0.3398706, 0.1338757, 3.475585, 0, 0.07058824, 1, 1,
0.3424982, 0.4310755, 0.9261898, 0, 0.0627451, 1, 1,
0.3462699, 0.6774127, -0.09269345, 0, 0.05882353, 1, 1,
0.3469179, -1.847435, 4.915441, 0, 0.05098039, 1, 1,
0.3513696, -0.08252155, 3.067122, 0, 0.04705882, 1, 1,
0.3531283, -1.503696, 4.150535, 0, 0.03921569, 1, 1,
0.3547868, 0.1931617, -0.1625957, 0, 0.03529412, 1, 1,
0.3559962, 0.8938441, -0.3554834, 0, 0.02745098, 1, 1,
0.3563271, -0.5957019, 4.12715, 0, 0.02352941, 1, 1,
0.3582902, -0.3931829, 2.078426, 0, 0.01568628, 1, 1,
0.3585953, -0.1995711, 1.678279, 0, 0.01176471, 1, 1,
0.3603653, -0.001298825, -0.04274424, 0, 0.003921569, 1, 1,
0.360763, 1.462318, 0.8459586, 0.003921569, 0, 1, 1,
0.361641, -0.6165938, 3.163624, 0.007843138, 0, 1, 1,
0.3677534, -0.2817781, 3.254005, 0.01568628, 0, 1, 1,
0.3677728, -0.4121236, 1.372639, 0.01960784, 0, 1, 1,
0.3696783, 0.9391878, 1.47937, 0.02745098, 0, 1, 1,
0.3700145, -0.9039907, 3.454354, 0.03137255, 0, 1, 1,
0.375015, -0.587812, 2.927773, 0.03921569, 0, 1, 1,
0.3817665, 1.159436, -0.1840835, 0.04313726, 0, 1, 1,
0.3827225, 0.3742433, 0.07477468, 0.05098039, 0, 1, 1,
0.3834896, -1.231931, 1.612846, 0.05490196, 0, 1, 1,
0.385673, -0.1522701, 1.599991, 0.0627451, 0, 1, 1,
0.3935933, -1.009213, 3.617641, 0.06666667, 0, 1, 1,
0.4022212, 1.725996, -2.119808, 0.07450981, 0, 1, 1,
0.4024381, 0.241147, 1.776842, 0.07843138, 0, 1, 1,
0.4052222, -1.425822, 4.294677, 0.08627451, 0, 1, 1,
0.4054962, 0.1557953, 1.888906, 0.09019608, 0, 1, 1,
0.4107673, -0.4752907, 1.551965, 0.09803922, 0, 1, 1,
0.4113244, 0.3288857, 2.724232, 0.1058824, 0, 1, 1,
0.4129732, 1.426035, 1.244637, 0.1098039, 0, 1, 1,
0.41447, 1.27139, 1.763079, 0.1176471, 0, 1, 1,
0.4165624, 1.745602, 0.7062999, 0.1215686, 0, 1, 1,
0.4224963, 0.70534, -0.9543076, 0.1294118, 0, 1, 1,
0.4240867, -2.094465, 2.945466, 0.1333333, 0, 1, 1,
0.426838, 0.5164124, 0.6289591, 0.1411765, 0, 1, 1,
0.4323355, 0.4412945, 0.3591897, 0.145098, 0, 1, 1,
0.4331393, 0.6532855, 0.7824813, 0.1529412, 0, 1, 1,
0.4391212, -0.3234564, 3.074947, 0.1568628, 0, 1, 1,
0.4392766, -0.1606049, 0.9996284, 0.1647059, 0, 1, 1,
0.4410157, -0.2833338, 2.473533, 0.1686275, 0, 1, 1,
0.4421253, 0.2106623, 1.460279, 0.1764706, 0, 1, 1,
0.4424226, -2.530017, 1.02435, 0.1803922, 0, 1, 1,
0.446683, -0.6226124, 3.719424, 0.1882353, 0, 1, 1,
0.4492465, -0.2886885, 2.427961, 0.1921569, 0, 1, 1,
0.452168, 2.517776, -1.20388, 0.2, 0, 1, 1,
0.4531859, -0.1354621, 1.035453, 0.2078431, 0, 1, 1,
0.4537166, 0.3626635, 1.057623, 0.2117647, 0, 1, 1,
0.4555621, -0.8910276, 2.641615, 0.2196078, 0, 1, 1,
0.4619925, -1.459763, 1.811068, 0.2235294, 0, 1, 1,
0.4682164, -0.8680243, 2.279252, 0.2313726, 0, 1, 1,
0.4723265, -0.1948393, 1.96193, 0.2352941, 0, 1, 1,
0.4759144, -0.02050555, 1.654908, 0.2431373, 0, 1, 1,
0.4859376, -0.0975902, 3.824281, 0.2470588, 0, 1, 1,
0.4973803, -0.01072985, 1.155695, 0.254902, 0, 1, 1,
0.5018706, 0.570231, 2.26161, 0.2588235, 0, 1, 1,
0.5062243, 0.9496979, -0.4351359, 0.2666667, 0, 1, 1,
0.511588, 0.9006025, 0.6079659, 0.2705882, 0, 1, 1,
0.5124691, -0.9651408, 3.972304, 0.2784314, 0, 1, 1,
0.516301, -0.4656926, -0.9393966, 0.282353, 0, 1, 1,
0.5211893, 0.2110575, 4.021946, 0.2901961, 0, 1, 1,
0.5221443, 0.4417962, 1.759485, 0.2941177, 0, 1, 1,
0.5276183, 0.6567424, 0.7172665, 0.3019608, 0, 1, 1,
0.5291938, 1.156196, 0.2650322, 0.3098039, 0, 1, 1,
0.532572, 0.7514547, 2.374696, 0.3137255, 0, 1, 1,
0.5331037, -1.313236, 0.5868102, 0.3215686, 0, 1, 1,
0.5341846, -0.5396814, 3.395915, 0.3254902, 0, 1, 1,
0.5446151, 0.1584582, 1.392141, 0.3333333, 0, 1, 1,
0.5494717, -0.7438879, 2.342865, 0.3372549, 0, 1, 1,
0.5515337, -0.2770942, 0.6527514, 0.345098, 0, 1, 1,
0.5550941, 1.216458, -0.1038068, 0.3490196, 0, 1, 1,
0.5570518, 0.8776383, -0.3537302, 0.3568628, 0, 1, 1,
0.5591819, 0.5417803, 1.653475, 0.3607843, 0, 1, 1,
0.5659092, 1.047337, 2.027095, 0.3686275, 0, 1, 1,
0.5722932, 0.2854785, 0.9837363, 0.372549, 0, 1, 1,
0.5808523, -1.264558, 1.611575, 0.3803922, 0, 1, 1,
0.5810398, -0.8501893, 3.385185, 0.3843137, 0, 1, 1,
0.5895119, 0.08797517, 1.015874, 0.3921569, 0, 1, 1,
0.5930201, -0.3410648, 0.2506059, 0.3960784, 0, 1, 1,
0.6004416, -0.9161556, 4.053899, 0.4039216, 0, 1, 1,
0.6059004, -1.234795, 3.393193, 0.4117647, 0, 1, 1,
0.6081784, -0.9434001, 2.744305, 0.4156863, 0, 1, 1,
0.6093976, -0.5293846, 2.703138, 0.4235294, 0, 1, 1,
0.6097929, -1.222317, 2.91397, 0.427451, 0, 1, 1,
0.6116923, 0.1350508, 1.681272, 0.4352941, 0, 1, 1,
0.6141846, 0.8161999, 1.238674, 0.4392157, 0, 1, 1,
0.6187772, -0.4289264, 1.886558, 0.4470588, 0, 1, 1,
0.6188847, 0.2070411, 0.328356, 0.4509804, 0, 1, 1,
0.6196544, 1.683287, -1.395057, 0.4588235, 0, 1, 1,
0.6262679, 0.1168529, -0.04008125, 0.4627451, 0, 1, 1,
0.628079, -0.3849435, 3.459375, 0.4705882, 0, 1, 1,
0.6283281, 0.9762431, 0.1510507, 0.4745098, 0, 1, 1,
0.6361314, 0.8969918, 1.507491, 0.4823529, 0, 1, 1,
0.6363026, 0.1657056, 1.14263, 0.4862745, 0, 1, 1,
0.6398325, 0.2769084, -0.2282702, 0.4941176, 0, 1, 1,
0.6424695, -0.4101799, 2.682062, 0.5019608, 0, 1, 1,
0.6446953, 0.978065, 0.04968022, 0.5058824, 0, 1, 1,
0.6480729, 0.660751, 2.186254, 0.5137255, 0, 1, 1,
0.6494439, 1.380675, 0.02470945, 0.5176471, 0, 1, 1,
0.6607389, 0.4503228, 0.3055072, 0.5254902, 0, 1, 1,
0.6612844, 0.9637917, 1.166626, 0.5294118, 0, 1, 1,
0.6617599, 0.2029178, 2.568679, 0.5372549, 0, 1, 1,
0.6663326, -0.09470384, 2.457191, 0.5411765, 0, 1, 1,
0.6673576, 0.8007591, 0.7038243, 0.5490196, 0, 1, 1,
0.6695901, -0.5228941, 0.519204, 0.5529412, 0, 1, 1,
0.6721748, -0.6194027, 1.792548, 0.5607843, 0, 1, 1,
0.6737148, -0.91366, -0.2241601, 0.5647059, 0, 1, 1,
0.6780764, 0.2619155, 1.112868, 0.572549, 0, 1, 1,
0.6825446, 0.5238169, 0.970232, 0.5764706, 0, 1, 1,
0.6901664, -0.2289318, 1.824206, 0.5843138, 0, 1, 1,
0.6992292, 0.8737383, 1.910401, 0.5882353, 0, 1, 1,
0.7014539, -3.328846, 3.858837, 0.5960785, 0, 1, 1,
0.7031757, 0.07108456, 2.214, 0.6039216, 0, 1, 1,
0.7073703, 1.048119, 0.6493605, 0.6078432, 0, 1, 1,
0.7103576, -0.3799328, 2.806767, 0.6156863, 0, 1, 1,
0.7104254, 0.8265498, 0.9125536, 0.6196079, 0, 1, 1,
0.7213832, -0.6120468, 2.016181, 0.627451, 0, 1, 1,
0.7228228, 0.9679855, 0.08456756, 0.6313726, 0, 1, 1,
0.7239204, -1.149184, 2.538733, 0.6392157, 0, 1, 1,
0.7253773, -0.5210946, 2.578146, 0.6431373, 0, 1, 1,
0.7275615, 0.468931, 1.200015, 0.6509804, 0, 1, 1,
0.7280385, 0.6722981, -0.2285869, 0.654902, 0, 1, 1,
0.7330825, 0.150942, 0.7376856, 0.6627451, 0, 1, 1,
0.7359831, 0.3824109, 1.775316, 0.6666667, 0, 1, 1,
0.7414306, -0.3289213, 1.92013, 0.6745098, 0, 1, 1,
0.7455344, 1.148614, -1.608532, 0.6784314, 0, 1, 1,
0.7456763, 1.013941, -0.4894187, 0.6862745, 0, 1, 1,
0.7467697, -1.701647, 4.481731, 0.6901961, 0, 1, 1,
0.7471859, -1.817861, 1.107596, 0.6980392, 0, 1, 1,
0.750765, 0.7239826, -0.9168554, 0.7058824, 0, 1, 1,
0.7544908, -1.356069, 3.562221, 0.7098039, 0, 1, 1,
0.7586984, -0.8995746, 1.41761, 0.7176471, 0, 1, 1,
0.7603976, -1.039084, 1.632238, 0.7215686, 0, 1, 1,
0.7621489, 1.280347, 2.25418, 0.7294118, 0, 1, 1,
0.7633418, 0.02935395, -0.6981194, 0.7333333, 0, 1, 1,
0.763717, 0.4485597, 0.9242781, 0.7411765, 0, 1, 1,
0.767843, 0.239908, 2.561141, 0.7450981, 0, 1, 1,
0.7684658, -0.6596944, 0.9660882, 0.7529412, 0, 1, 1,
0.7694366, 1.596053, 1.52719, 0.7568628, 0, 1, 1,
0.772989, -0.6886213, 3.686305, 0.7647059, 0, 1, 1,
0.7759832, 0.579932, 2.531273, 0.7686275, 0, 1, 1,
0.7833152, -1.423962, 0.6029522, 0.7764706, 0, 1, 1,
0.7847158, 1.316467, 0.5036265, 0.7803922, 0, 1, 1,
0.785708, 0.08784663, 0.5293267, 0.7882353, 0, 1, 1,
0.7857271, 1.362016, -0.3257082, 0.7921569, 0, 1, 1,
0.7893609, 0.1490557, -0.06804422, 0.8, 0, 1, 1,
0.7894506, 0.8280801, 0.4846675, 0.8078431, 0, 1, 1,
0.7979642, -0.162446, 1.526889, 0.8117647, 0, 1, 1,
0.8015379, 0.7801852, 1.090819, 0.8196079, 0, 1, 1,
0.8058725, 0.6131586, 1.520588, 0.8235294, 0, 1, 1,
0.8080005, -0.01456846, 2.030239, 0.8313726, 0, 1, 1,
0.8109912, 0.5910771, 0.6862898, 0.8352941, 0, 1, 1,
0.8272374, -1.911668, 2.435648, 0.8431373, 0, 1, 1,
0.827364, -0.1072967, 1.32836, 0.8470588, 0, 1, 1,
0.8290353, -0.2748959, 0.1197728, 0.854902, 0, 1, 1,
0.8316941, -1.407909, 3.264189, 0.8588235, 0, 1, 1,
0.8343902, -0.2562801, 2.396734, 0.8666667, 0, 1, 1,
0.8392258, 0.3295791, 1.524041, 0.8705882, 0, 1, 1,
0.8403667, -0.3641744, 3.433108, 0.8784314, 0, 1, 1,
0.8409768, 0.4967217, 0.9109302, 0.8823529, 0, 1, 1,
0.8411319, 0.213215, 1.93125, 0.8901961, 0, 1, 1,
0.8429356, 0.5556597, 0.9009778, 0.8941177, 0, 1, 1,
0.8460948, 0.8123556, 1.509774, 0.9019608, 0, 1, 1,
0.8528547, 0.8747057, 0.7634563, 0.9098039, 0, 1, 1,
0.8669046, 1.020126, 1.29689, 0.9137255, 0, 1, 1,
0.8725988, -0.6449535, 1.014895, 0.9215686, 0, 1, 1,
0.8733571, -0.3932483, 3.102121, 0.9254902, 0, 1, 1,
0.8733773, -0.2405016, 1.000026, 0.9333333, 0, 1, 1,
0.8811113, 0.5988465, 0.05592622, 0.9372549, 0, 1, 1,
0.8984327, -1.115097, 2.022756, 0.945098, 0, 1, 1,
0.8985667, -0.8956381, 0.8426266, 0.9490196, 0, 1, 1,
0.8990898, 0.5331728, 1.628769, 0.9568627, 0, 1, 1,
0.912664, -0.8015237, 1.432516, 0.9607843, 0, 1, 1,
0.9143463, -1.822621, 1.21849, 0.9686275, 0, 1, 1,
0.9200897, 1.500844, 0.5647411, 0.972549, 0, 1, 1,
0.9221109, -0.2323469, 0.8241029, 0.9803922, 0, 1, 1,
0.9467681, -0.2274121, 3.133205, 0.9843137, 0, 1, 1,
0.9484917, -1.648921, 1.797466, 0.9921569, 0, 1, 1,
0.949737, 0.2591777, -0.342431, 0.9960784, 0, 1, 1,
0.9498785, -1.417676, 4.370697, 1, 0, 0.9960784, 1,
0.9546184, 0.3378365, 0.8675483, 1, 0, 0.9882353, 1,
0.9570822, 0.9751553, 2.187785, 1, 0, 0.9843137, 1,
0.9585674, 0.8497528, 2.670509, 1, 0, 0.9764706, 1,
0.9614506, -0.1365064, 2.311876, 1, 0, 0.972549, 1,
0.9623569, -0.7336358, 1.704553, 1, 0, 0.9647059, 1,
0.9672052, -0.6030678, 1.493503, 1, 0, 0.9607843, 1,
0.9696046, -0.7190122, 2.920237, 1, 0, 0.9529412, 1,
0.9712462, 0.3122186, 0.3180164, 1, 0, 0.9490196, 1,
0.9762964, 0.6471678, 1.445019, 1, 0, 0.9411765, 1,
0.9769804, -1.364802, 2.526515, 1, 0, 0.9372549, 1,
0.9781396, -0.06277144, 0.3246913, 1, 0, 0.9294118, 1,
0.9839379, 0.5128404, 0.8614953, 1, 0, 0.9254902, 1,
0.983979, -1.109422, 2.936368, 1, 0, 0.9176471, 1,
0.9854212, -0.4477252, 0.8110759, 1, 0, 0.9137255, 1,
0.9862747, 0.6187668, 1.788505, 1, 0, 0.9058824, 1,
0.9879754, 0.333192, 0.9177611, 1, 0, 0.9019608, 1,
0.9915884, 0.0849816, 2.8855, 1, 0, 0.8941177, 1,
1.00181, 0.04163613, 0.9025776, 1, 0, 0.8862745, 1,
1.007395, 0.3285987, 1.695597, 1, 0, 0.8823529, 1,
1.009442, -1.369426, 4.282166, 1, 0, 0.8745098, 1,
1.010379, 1.455994, 2.198147, 1, 0, 0.8705882, 1,
1.014306, -1.454216, 2.601723, 1, 0, 0.8627451, 1,
1.015423, -1.188198, 0.7613178, 1, 0, 0.8588235, 1,
1.01627, 1.558604, -0.09038013, 1, 0, 0.8509804, 1,
1.016322, -1.061965, 3.472407, 1, 0, 0.8470588, 1,
1.018551, -0.7003712, 0.7852913, 1, 0, 0.8392157, 1,
1.024705, -0.3267697, 4.11011, 1, 0, 0.8352941, 1,
1.031345, -2.093887, 2.330736, 1, 0, 0.827451, 1,
1.035131, 1.656414, -0.6240141, 1, 0, 0.8235294, 1,
1.03982, -1.488742, 3.236724, 1, 0, 0.8156863, 1,
1.054545, -1.222116, 2.729028, 1, 0, 0.8117647, 1,
1.058896, 1.135029, -0.08517949, 1, 0, 0.8039216, 1,
1.065575, 0.8270086, 1.312783, 1, 0, 0.7960784, 1,
1.06606, -0.8468463, 3.146109, 1, 0, 0.7921569, 1,
1.078451, -1.62833, 1.40031, 1, 0, 0.7843137, 1,
1.080079, -1.002807, 2.553119, 1, 0, 0.7803922, 1,
1.1005, 1.480219, 1.06752, 1, 0, 0.772549, 1,
1.106582, 0.4105215, 0.4111696, 1, 0, 0.7686275, 1,
1.107075, 0.3194554, 1.214319, 1, 0, 0.7607843, 1,
1.110089, 0.3717688, 2.656484, 1, 0, 0.7568628, 1,
1.11048, -0.08214985, 2.031771, 1, 0, 0.7490196, 1,
1.114597, 1.981456, -1.666064, 1, 0, 0.7450981, 1,
1.116345, -0.7544119, 1.616745, 1, 0, 0.7372549, 1,
1.121944, -0.3423041, 2.003361, 1, 0, 0.7333333, 1,
1.122737, 0.6372241, 1.313971, 1, 0, 0.7254902, 1,
1.127534, -0.7282436, 0.9173532, 1, 0, 0.7215686, 1,
1.128994, 1.166898, 0.5879489, 1, 0, 0.7137255, 1,
1.134565, 0.1706728, 0.5934782, 1, 0, 0.7098039, 1,
1.138875, -1.224685, 2.9789, 1, 0, 0.7019608, 1,
1.144133, 0.6459337, 0.04911702, 1, 0, 0.6941177, 1,
1.145598, -1.090024, 2.296946, 1, 0, 0.6901961, 1,
1.146102, -1.686827, 2.317327, 1, 0, 0.682353, 1,
1.149302, -2.433665, 2.935719, 1, 0, 0.6784314, 1,
1.154234, -1.197872, 2.969118, 1, 0, 0.6705883, 1,
1.156905, -0.1966773, 3.349898, 1, 0, 0.6666667, 1,
1.157935, 0.1580496, 1.207885, 1, 0, 0.6588235, 1,
1.169979, -0.3462278, 1.466397, 1, 0, 0.654902, 1,
1.19191, -0.275126, 4.286828, 1, 0, 0.6470588, 1,
1.194881, 0.9566694, -0.6632921, 1, 0, 0.6431373, 1,
1.210979, -0.1779319, 0.5984876, 1, 0, 0.6352941, 1,
1.215086, -0.2210477, 0.5526744, 1, 0, 0.6313726, 1,
1.216873, 0.2358134, 0.3857829, 1, 0, 0.6235294, 1,
1.229494, -1.147256, 2.545908, 1, 0, 0.6196079, 1,
1.240801, -0.07283736, 1.57118, 1, 0, 0.6117647, 1,
1.251653, -0.07367401, 3.015408, 1, 0, 0.6078432, 1,
1.270407, 0.5305225, -0.8607785, 1, 0, 0.6, 1,
1.275823, -0.4655451, 1.890765, 1, 0, 0.5921569, 1,
1.288192, 0.8356985, 2.049332, 1, 0, 0.5882353, 1,
1.295543, 1.305304, 1.219002, 1, 0, 0.5803922, 1,
1.299688, -1.008576, 0.6040523, 1, 0, 0.5764706, 1,
1.30538, -1.146355, 2.387403, 1, 0, 0.5686275, 1,
1.322875, 0.1281954, 2.148259, 1, 0, 0.5647059, 1,
1.329958, -0.3332974, 2.436972, 1, 0, 0.5568628, 1,
1.331139, -0.1087123, 3.982816, 1, 0, 0.5529412, 1,
1.333078, -1.227035, 1.910565, 1, 0, 0.5450981, 1,
1.333803, -0.1521335, 2.509999, 1, 0, 0.5411765, 1,
1.342106, 0.05012157, 0.5789508, 1, 0, 0.5333334, 1,
1.351807, -0.1733851, 0.8015273, 1, 0, 0.5294118, 1,
1.357716, 0.9437808, -0.7724089, 1, 0, 0.5215687, 1,
1.374953, 0.4169798, 1.572652, 1, 0, 0.5176471, 1,
1.379662, -0.3298436, 0.6554467, 1, 0, 0.509804, 1,
1.392488, 0.2941451, 1.964513, 1, 0, 0.5058824, 1,
1.395082, 1.28973, 0.3025377, 1, 0, 0.4980392, 1,
1.396491, -1.214912, 1.478896, 1, 0, 0.4901961, 1,
1.407171, 1.427884, 0.7845288, 1, 0, 0.4862745, 1,
1.407633, 1.376402, 1.018559, 1, 0, 0.4784314, 1,
1.408709, -0.02504034, 2.801142, 1, 0, 0.4745098, 1,
1.414349, -0.2973725, 3.48202, 1, 0, 0.4666667, 1,
1.416013, -0.1225368, 2.67547, 1, 0, 0.4627451, 1,
1.417346, 1.688745, 1.427811, 1, 0, 0.454902, 1,
1.420952, 2.223165, 2.408079, 1, 0, 0.4509804, 1,
1.429241, -0.547038, 0.8939901, 1, 0, 0.4431373, 1,
1.433522, 1.129861, -0.7534997, 1, 0, 0.4392157, 1,
1.444561, -0.6380806, 2.523676, 1, 0, 0.4313726, 1,
1.445802, -1.41098, 2.260122, 1, 0, 0.427451, 1,
1.447014, 1.051424, 1.970202, 1, 0, 0.4196078, 1,
1.451747, 1.064181, -0.3527552, 1, 0, 0.4156863, 1,
1.455129, 1.410339, -0.8334956, 1, 0, 0.4078431, 1,
1.463825, 2.267855, 0.3989317, 1, 0, 0.4039216, 1,
1.465717, -1.642813, 4.080996, 1, 0, 0.3960784, 1,
1.467981, -1.168231, 1.192611, 1, 0, 0.3882353, 1,
1.469414, -0.7402659, 2.769102, 1, 0, 0.3843137, 1,
1.477514, 0.5645596, 1.656083, 1, 0, 0.3764706, 1,
1.4796, 1.89529, 0.8471805, 1, 0, 0.372549, 1,
1.481871, -0.9738821, 3.298278, 1, 0, 0.3647059, 1,
1.486203, 0.2932545, 1.005504, 1, 0, 0.3607843, 1,
1.492825, 1.027294, 1.043965, 1, 0, 0.3529412, 1,
1.49728, 0.3661384, 1.755236, 1, 0, 0.3490196, 1,
1.5011, -2.209873, 2.179035, 1, 0, 0.3411765, 1,
1.53132, 0.5615261, 1.633225, 1, 0, 0.3372549, 1,
1.531337, -0.55073, 2.515396, 1, 0, 0.3294118, 1,
1.532112, -0.2852874, 1.034008, 1, 0, 0.3254902, 1,
1.541189, -1.75203, 1.467485, 1, 0, 0.3176471, 1,
1.552331, -0.5051598, 3.084282, 1, 0, 0.3137255, 1,
1.552793, -0.260408, 0.2117573, 1, 0, 0.3058824, 1,
1.557162, 1.568953, 0.03677963, 1, 0, 0.2980392, 1,
1.562304, -0.3587363, 1.821813, 1, 0, 0.2941177, 1,
1.5666, 0.5424293, 1.857401, 1, 0, 0.2862745, 1,
1.567142, -1.96652, 3.273662, 1, 0, 0.282353, 1,
1.578163, -2.159649, 2.95623, 1, 0, 0.2745098, 1,
1.578195, 0.6581641, 2.3884, 1, 0, 0.2705882, 1,
1.602113, 0.9754639, 1.415283, 1, 0, 0.2627451, 1,
1.634265, 0.4171731, 2.057393, 1, 0, 0.2588235, 1,
1.639206, -0.1740738, 0.8020761, 1, 0, 0.2509804, 1,
1.648021, -0.6767042, 1.545972, 1, 0, 0.2470588, 1,
1.681558, 0.775472, 1.72469, 1, 0, 0.2392157, 1,
1.71788, 0.4453999, 1.261091, 1, 0, 0.2352941, 1,
1.71814, -2.014546, 2.376862, 1, 0, 0.227451, 1,
1.742604, 0.9304626, -0.1442006, 1, 0, 0.2235294, 1,
1.785538, -0.6370905, 1.209584, 1, 0, 0.2156863, 1,
1.819834, 0.2422047, 1.41349, 1, 0, 0.2117647, 1,
1.821042, 1.13299, 0.1452111, 1, 0, 0.2039216, 1,
1.840627, -0.1156922, 2.450724, 1, 0, 0.1960784, 1,
1.846114, 0.4494846, 0.9105021, 1, 0, 0.1921569, 1,
1.861114, -0.7997681, 0.1310366, 1, 0, 0.1843137, 1,
1.884923, -1.137746, 2.295244, 1, 0, 0.1803922, 1,
1.893485, -2.095083, 2.079911, 1, 0, 0.172549, 1,
1.895362, 1.134254, 0.07926522, 1, 0, 0.1686275, 1,
1.971563, 1.892253, 0.3902476, 1, 0, 0.1607843, 1,
1.999797, -1.727743, 2.62927, 1, 0, 0.1568628, 1,
2.01238, 0.5201253, 0.8900052, 1, 0, 0.1490196, 1,
2.018738, 0.7263173, 2.987875, 1, 0, 0.145098, 1,
2.03997, -0.08894771, 2.856272, 1, 0, 0.1372549, 1,
2.068585, 1.467206, 1.602845, 1, 0, 0.1333333, 1,
2.079579, 0.963482, 0.7612122, 1, 0, 0.1254902, 1,
2.129182, 1.328132, 0.6905797, 1, 0, 0.1215686, 1,
2.153064, 1.290176, 1.031316, 1, 0, 0.1137255, 1,
2.171034, -0.4099657, 2.436936, 1, 0, 0.1098039, 1,
2.182068, -0.9744198, 2.961095, 1, 0, 0.1019608, 1,
2.259484, 1.524631, 2.550333, 1, 0, 0.09411765, 1,
2.419958, -0.4042687, 1.645595, 1, 0, 0.09019608, 1,
2.508276, -0.7816274, 0.6464131, 1, 0, 0.08235294, 1,
2.536158, -0.790134, 0.1708258, 1, 0, 0.07843138, 1,
2.593811, -0.3756225, 1.144049, 1, 0, 0.07058824, 1,
2.600766, 0.6596301, 1.185428, 1, 0, 0.06666667, 1,
2.6277, -0.06954609, 1.70749, 1, 0, 0.05882353, 1,
2.768749, -0.541809, 1.86885, 1, 0, 0.05490196, 1,
2.782027, 0.04045096, 1.853937, 1, 0, 0.04705882, 1,
2.874082, -0.3690976, 1.385843, 1, 0, 0.04313726, 1,
2.888868, 0.2015086, 1.011845, 1, 0, 0.03529412, 1,
2.929265, 0.8174844, 1.285457, 1, 0, 0.03137255, 1,
2.971328, 1.413086, -0.8595533, 1, 0, 0.02352941, 1,
2.976612, 0.8342921, 2.183751, 1, 0, 0.01960784, 1,
3.028886, 0.7440286, 1.513064, 1, 0, 0.01176471, 1,
3.24109, 0.155175, 2.238606, 1, 0, 0.007843138, 1
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
-0.06781971, -4.370516, -7.220569, 0, -0.5, 0.5, 0.5,
-0.06781971, -4.370516, -7.220569, 1, -0.5, 0.5, 0.5,
-0.06781971, -4.370516, -7.220569, 1, 1.5, 0.5, 0.5,
-0.06781971, -4.370516, -7.220569, 0, 1.5, 0.5, 0.5
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
-4.49845, -0.2560729, -7.220569, 0, -0.5, 0.5, 0.5,
-4.49845, -0.2560729, -7.220569, 1, -0.5, 0.5, 0.5,
-4.49845, -0.2560729, -7.220569, 1, 1.5, 0.5, 0.5,
-4.49845, -0.2560729, -7.220569, 0, 1.5, 0.5, 0.5
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
-4.49845, -4.370516, 0.539434, 0, -0.5, 0.5, 0.5,
-4.49845, -4.370516, 0.539434, 1, -0.5, 0.5, 0.5,
-4.49845, -4.370516, 0.539434, 1, 1.5, 0.5, 0.5,
-4.49845, -4.370516, 0.539434, 0, 1.5, 0.5, 0.5
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
-3, -3.421029, -5.429799,
3, -3.421029, -5.429799,
-3, -3.421029, -5.429799,
-3, -3.579277, -5.728261,
-2, -3.421029, -5.429799,
-2, -3.579277, -5.728261,
-1, -3.421029, -5.429799,
-1, -3.579277, -5.728261,
0, -3.421029, -5.429799,
0, -3.579277, -5.728261,
1, -3.421029, -5.429799,
1, -3.579277, -5.728261,
2, -3.421029, -5.429799,
2, -3.579277, -5.728261,
3, -3.421029, -5.429799,
3, -3.579277, -5.728261
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
-3, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
-3, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
-3, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
-3, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
-2, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
-2, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
-2, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
-2, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
-1, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
-1, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
-1, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
-1, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
0, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
0, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
0, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
0, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
1, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
1, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
1, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
1, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
2, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
2, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
2, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
2, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5,
3, -3.895772, -6.325184, 0, -0.5, 0.5, 0.5,
3, -3.895772, -6.325184, 1, -0.5, 0.5, 0.5,
3, -3.895772, -6.325184, 1, 1.5, 0.5, 0.5,
3, -3.895772, -6.325184, 0, 1.5, 0.5, 0.5
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
-3.475997, -3, -5.429799,
-3.475997, 2, -5.429799,
-3.475997, -3, -5.429799,
-3.646406, -3, -5.728261,
-3.475997, -2, -5.429799,
-3.646406, -2, -5.728261,
-3.475997, -1, -5.429799,
-3.646406, -1, -5.728261,
-3.475997, 0, -5.429799,
-3.646406, 0, -5.728261,
-3.475997, 1, -5.429799,
-3.646406, 1, -5.728261,
-3.475997, 2, -5.429799,
-3.646406, 2, -5.728261
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
-3.987224, -3, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, -3, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, -3, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, -3, -6.325184, 0, 1.5, 0.5, 0.5,
-3.987224, -2, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, -2, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, -2, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, -2, -6.325184, 0, 1.5, 0.5, 0.5,
-3.987224, -1, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, -1, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, -1, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, -1, -6.325184, 0, 1.5, 0.5, 0.5,
-3.987224, 0, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, 0, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, 0, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, 0, -6.325184, 0, 1.5, 0.5, 0.5,
-3.987224, 1, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, 1, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, 1, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, 1, -6.325184, 0, 1.5, 0.5, 0.5,
-3.987224, 2, -6.325184, 0, -0.5, 0.5, 0.5,
-3.987224, 2, -6.325184, 1, -0.5, 0.5, 0.5,
-3.987224, 2, -6.325184, 1, 1.5, 0.5, 0.5,
-3.987224, 2, -6.325184, 0, 1.5, 0.5, 0.5
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
-3.475997, -3.421029, -4,
-3.475997, -3.421029, 6,
-3.475997, -3.421029, -4,
-3.646406, -3.579277, -4,
-3.475997, -3.421029, -2,
-3.646406, -3.579277, -2,
-3.475997, -3.421029, 0,
-3.646406, -3.579277, 0,
-3.475997, -3.421029, 2,
-3.646406, -3.579277, 2,
-3.475997, -3.421029, 4,
-3.646406, -3.579277, 4,
-3.475997, -3.421029, 6,
-3.646406, -3.579277, 6
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
-3.987224, -3.895772, -4, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, -4, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, -4, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, -4, 0, 1.5, 0.5, 0.5,
-3.987224, -3.895772, -2, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, -2, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, -2, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, -2, 0, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 0, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 0, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 0, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 0, 0, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 2, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 2, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 2, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 2, 0, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 4, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 4, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 4, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 4, 0, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 6, 0, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 6, 1, -0.5, 0.5, 0.5,
-3.987224, -3.895772, 6, 1, 1.5, 0.5, 0.5,
-3.987224, -3.895772, 6, 0, 1.5, 0.5, 0.5
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
-3.475997, -3.421029, -5.429799,
-3.475997, 2.908883, -5.429799,
-3.475997, -3.421029, 6.508667,
-3.475997, 2.908883, 6.508667,
-3.475997, -3.421029, -5.429799,
-3.475997, -3.421029, 6.508667,
-3.475997, 2.908883, -5.429799,
-3.475997, 2.908883, 6.508667,
-3.475997, -3.421029, -5.429799,
3.340358, -3.421029, -5.429799,
-3.475997, -3.421029, 6.508667,
3.340358, -3.421029, 6.508667,
-3.475997, 2.908883, -5.429799,
3.340358, 2.908883, -5.429799,
-3.475997, 2.908883, 6.508667,
3.340358, 2.908883, 6.508667,
3.340358, -3.421029, -5.429799,
3.340358, 2.908883, -5.429799,
3.340358, -3.421029, 6.508667,
3.340358, 2.908883, 6.508667,
3.340358, -3.421029, -5.429799,
3.340358, -3.421029, 6.508667,
3.340358, 2.908883, -5.429799,
3.340358, 2.908883, 6.508667
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
var radius = 8.081606;
var distance = 35.95598;
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
mvMatrix.translate( 0.06781971, 0.2560729, -0.539434 );
mvMatrix.scale( 1.281916, 1.380428, 0.7319191 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95598);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
2-aminobenzimidazole<-read.table("2-aminobenzimidazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-aminobenzimidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminobenzimidazole' not found
```

```r
y<-2-aminobenzimidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminobenzimidazole' not found
```

```r
z<-2-aminobenzimidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminobenzimidazole' not found
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
-3.37673, -0.1839844, -1.932601, 0, 0, 1, 1, 1,
-3.17967, 0.3133518, -1.183035, 1, 0, 0, 1, 1,
-3.013709, -0.7689986, -1.635702, 1, 0, 0, 1, 1,
-2.938827, 2.550087, -0.8677378, 1, 0, 0, 1, 1,
-2.879524, -1.073204, -2.523144, 1, 0, 0, 1, 1,
-2.765603, 1.890944, -1.324375, 1, 0, 0, 1, 1,
-2.71214, -1.242447, -1.727485, 0, 0, 0, 1, 1,
-2.634426, 2.192618, -0.8590676, 0, 0, 0, 1, 1,
-2.604719, -0.285089, -1.550049, 0, 0, 0, 1, 1,
-2.483909, -0.2749921, -1.571846, 0, 0, 0, 1, 1,
-2.404037, -0.04846301, -1.711018, 0, 0, 0, 1, 1,
-2.39731, 1.549374, -2.00159, 0, 0, 0, 1, 1,
-2.387264, -0.2332518, -2.645495, 0, 0, 0, 1, 1,
-2.269906, 0.9812393, 0.04703843, 1, 1, 1, 1, 1,
-2.259656, -0.1490834, -1.493176, 1, 1, 1, 1, 1,
-2.247352, -1.02025, -2.226929, 1, 1, 1, 1, 1,
-2.229301, 1.890291, -0.4925986, 1, 1, 1, 1, 1,
-2.209225, 0.9500939, -0.1513116, 1, 1, 1, 1, 1,
-2.164696, 2.456331, -0.3041402, 1, 1, 1, 1, 1,
-2.127368, -0.215636, -2.140839, 1, 1, 1, 1, 1,
-2.117841, -0.1917838, -0.8714669, 1, 1, 1, 1, 1,
-2.068328, 0.4175203, -2.201331, 1, 1, 1, 1, 1,
-2.061116, -0.07811363, -2.853733, 1, 1, 1, 1, 1,
-2.048184, 0.4320068, -2.168224, 1, 1, 1, 1, 1,
-2.016837, 0.3189071, 0.03907656, 1, 1, 1, 1, 1,
-2.004189, -0.2281655, 0.03052175, 1, 1, 1, 1, 1,
-1.998214, 1.289475, 0.1397599, 1, 1, 1, 1, 1,
-1.989065, -0.8710671, -2.049873, 1, 1, 1, 1, 1,
-1.987164, -0.2444024, -0.9834324, 0, 0, 1, 1, 1,
-1.974969, -0.6197364, -0.5710963, 1, 0, 0, 1, 1,
-1.973093, 1.435415, -2.295558, 1, 0, 0, 1, 1,
-1.955719, 0.9660219, -1.853727, 1, 0, 0, 1, 1,
-1.926504, -1.814994, -3.912248, 1, 0, 0, 1, 1,
-1.905567, -0.2024073, -2.830886, 1, 0, 0, 1, 1,
-1.892983, -1.398345, -0.5803037, 0, 0, 0, 1, 1,
-1.849444, 0.0674197, -2.247121, 0, 0, 0, 1, 1,
-1.847029, -1.733118, -1.343729, 0, 0, 0, 1, 1,
-1.806652, -1.764334, -1.828182, 0, 0, 0, 1, 1,
-1.802081, 0.742105, -0.6359364, 0, 0, 0, 1, 1,
-1.795995, -0.9503575, -2.439562, 0, 0, 0, 1, 1,
-1.789494, 1.927218, -1.439546, 0, 0, 0, 1, 1,
-1.782487, 0.4180878, -1.052404, 1, 1, 1, 1, 1,
-1.746914, 0.4880596, -1.210331, 1, 1, 1, 1, 1,
-1.746693, 1.658544, 1.151039, 1, 1, 1, 1, 1,
-1.73967, -0.4902545, -0.60948, 1, 1, 1, 1, 1,
-1.73731, 0.9675687, 1.024521, 1, 1, 1, 1, 1,
-1.730206, -0.1903931, -2.294242, 1, 1, 1, 1, 1,
-1.718951, 0.383239, -0.8481907, 1, 1, 1, 1, 1,
-1.71748, -2.012081, -2.659455, 1, 1, 1, 1, 1,
-1.714486, 0.3946017, -1.869924, 1, 1, 1, 1, 1,
-1.708336, -1.711728, -0.7915496, 1, 1, 1, 1, 1,
-1.701306, 0.2489797, -1.130168, 1, 1, 1, 1, 1,
-1.697591, -0.7917282, -3.774737, 1, 1, 1, 1, 1,
-1.691033, -0.9524847, -2.874161, 1, 1, 1, 1, 1,
-1.689135, -2.266428, -2.586254, 1, 1, 1, 1, 1,
-1.663311, 0.7659738, 1.152259, 1, 1, 1, 1, 1,
-1.658376, 1.725475, 1.854695, 0, 0, 1, 1, 1,
-1.657156, -0.9235069, -1.052896, 1, 0, 0, 1, 1,
-1.652711, 0.114701, -2.212297, 1, 0, 0, 1, 1,
-1.641671, -1.648545, -3.595684, 1, 0, 0, 1, 1,
-1.641313, -0.04158238, -1.533613, 1, 0, 0, 1, 1,
-1.634879, 0.6801275, -1.021626, 1, 0, 0, 1, 1,
-1.632218, -0.1892497, -2.949975, 0, 0, 0, 1, 1,
-1.630332, -1.175864, -3.072015, 0, 0, 0, 1, 1,
-1.625108, 0.5710431, -1.809806, 0, 0, 0, 1, 1,
-1.622687, 2.311064, -0.4550771, 0, 0, 0, 1, 1,
-1.620649, 1.395277, -1.590566, 0, 0, 0, 1, 1,
-1.612506, -0.2715561, -0.01413654, 0, 0, 0, 1, 1,
-1.608648, -1.230083, -2.364786, 0, 0, 0, 1, 1,
-1.607202, -0.2161234, -1.610144, 1, 1, 1, 1, 1,
-1.602556, 0.07990149, -1.648558, 1, 1, 1, 1, 1,
-1.600961, -0.1812269, -1.697783, 1, 1, 1, 1, 1,
-1.598769, -0.1379763, -2.535645, 1, 1, 1, 1, 1,
-1.596823, -1.219876, -2.493889, 1, 1, 1, 1, 1,
-1.591154, 0.111129, -0.6453202, 1, 1, 1, 1, 1,
-1.591138, 0.6132704, -2.102946, 1, 1, 1, 1, 1,
-1.586617, 0.403093, -2.336733, 1, 1, 1, 1, 1,
-1.573472, -0.2143268, -0.4159946, 1, 1, 1, 1, 1,
-1.567989, 0.5198414, -0.09923273, 1, 1, 1, 1, 1,
-1.553414, 0.6089308, 0.01030816, 1, 1, 1, 1, 1,
-1.552019, 0.6027356, -0.3999666, 1, 1, 1, 1, 1,
-1.543485, -0.4381864, -0.8723363, 1, 1, 1, 1, 1,
-1.532931, 0.3621398, -0.813997, 1, 1, 1, 1, 1,
-1.530827, -1.730943, -4.589502, 1, 1, 1, 1, 1,
-1.509027, -2.849647, -1.113037, 0, 0, 1, 1, 1,
-1.500559, 0.3611376, -2.654845, 1, 0, 0, 1, 1,
-1.49998, 1.23755, -0.7128808, 1, 0, 0, 1, 1,
-1.498562, 0.02749838, -3.04487, 1, 0, 0, 1, 1,
-1.489401, 0.2583317, 0.5226521, 1, 0, 0, 1, 1,
-1.486348, -0.2869533, -2.504535, 1, 0, 0, 1, 1,
-1.483044, 2.178465, 0.1788979, 0, 0, 0, 1, 1,
-1.481282, 2.389115, -0.5677707, 0, 0, 0, 1, 1,
-1.478697, -0.9790652, -1.502163, 0, 0, 0, 1, 1,
-1.476679, -0.7613089, -2.28447, 0, 0, 0, 1, 1,
-1.47177, -0.590233, -1.560898, 0, 0, 0, 1, 1,
-1.456096, 0.5784344, -0.6067938, 0, 0, 0, 1, 1,
-1.45161, 0.1780551, -0.6997141, 0, 0, 0, 1, 1,
-1.451036, -0.07799108, -2.527085, 1, 1, 1, 1, 1,
-1.435962, -0.8898449, -3.17154, 1, 1, 1, 1, 1,
-1.420511, -0.5961404, -2.001784, 1, 1, 1, 1, 1,
-1.416311, 0.1040739, 0.7442275, 1, 1, 1, 1, 1,
-1.406151, -2.026065, -2.13558, 1, 1, 1, 1, 1,
-1.397505, -0.8386251, -2.191084, 1, 1, 1, 1, 1,
-1.395608, -1.659223, -2.285452, 1, 1, 1, 1, 1,
-1.393653, -0.9851849, -2.704773, 1, 1, 1, 1, 1,
-1.375466, 0.1052565, 0.1387594, 1, 1, 1, 1, 1,
-1.369855, -0.8005646, -2.684078, 1, 1, 1, 1, 1,
-1.369608, 1.183544, -0.1628778, 1, 1, 1, 1, 1,
-1.345759, 2.050217, -1.365783, 1, 1, 1, 1, 1,
-1.344375, 0.5570403, -0.7910285, 1, 1, 1, 1, 1,
-1.336286, 1.485692, -2.201133, 1, 1, 1, 1, 1,
-1.336182, -0.4095491, -1.968781, 1, 1, 1, 1, 1,
-1.334106, -0.5011827, -3.747609, 0, 0, 1, 1, 1,
-1.333654, 0.7968887, -0.8208179, 1, 0, 0, 1, 1,
-1.331002, 0.5001531, -0.3557092, 1, 0, 0, 1, 1,
-1.328413, -0.8152966, -1.280754, 1, 0, 0, 1, 1,
-1.3103, -1.451207, -2.608988, 1, 0, 0, 1, 1,
-1.292918, -1.22523, -2.409567, 1, 0, 0, 1, 1,
-1.278999, 1.086918, -1.452636, 0, 0, 0, 1, 1,
-1.272631, 1.984821, -0.9385939, 0, 0, 0, 1, 1,
-1.268162, -1.188023, -0.6704129, 0, 0, 0, 1, 1,
-1.257485, -0.132463, -1.738252, 0, 0, 0, 1, 1,
-1.242889, -1.270674, -4.065986, 0, 0, 0, 1, 1,
-1.232769, -0.4852328, -0.7424353, 0, 0, 0, 1, 1,
-1.222904, 1.302266, -0.4121478, 0, 0, 0, 1, 1,
-1.217803, -0.6527441, -3.638378, 1, 1, 1, 1, 1,
-1.206237, 1.68488, 0.1918795, 1, 1, 1, 1, 1,
-1.19269, 0.5654898, -2.495436, 1, 1, 1, 1, 1,
-1.188805, -0.2496772, -3.359181, 1, 1, 1, 1, 1,
-1.185861, 0.3239575, -1.130616, 1, 1, 1, 1, 1,
-1.182295, -0.7597412, -1.243476, 1, 1, 1, 1, 1,
-1.172682, -1.089984, -2.446458, 1, 1, 1, 1, 1,
-1.152323, -0.4815274, -2.823351, 1, 1, 1, 1, 1,
-1.143579, 0.08247446, -2.376242, 1, 1, 1, 1, 1,
-1.142769, 0.7866573, -3.252652, 1, 1, 1, 1, 1,
-1.142617, -2.565068, -2.887463, 1, 1, 1, 1, 1,
-1.135949, -0.8440894, -0.6047076, 1, 1, 1, 1, 1,
-1.135089, -0.05786552, -2.354997, 1, 1, 1, 1, 1,
-1.130606, -0.6028982, -1.825507, 1, 1, 1, 1, 1,
-1.125794, 1.767439, 1.110722, 1, 1, 1, 1, 1,
-1.12487, 1.3491, -1.06051, 0, 0, 1, 1, 1,
-1.118711, 0.2026612, -1.725907, 1, 0, 0, 1, 1,
-1.117543, -0.01223249, -1.810014, 1, 0, 0, 1, 1,
-1.099419, 1.383771, -1.076128, 1, 0, 0, 1, 1,
-1.084981, 1.504924, 0.560261, 1, 0, 0, 1, 1,
-1.080898, 0.6432587, -2.639023, 1, 0, 0, 1, 1,
-1.078317, 0.05185586, -3.028346, 0, 0, 0, 1, 1,
-1.06981, 1.02137, -0.7502527, 0, 0, 0, 1, 1,
-1.05862, 0.4365278, -2.139159, 0, 0, 0, 1, 1,
-1.051651, -0.285662, -2.459776, 0, 0, 0, 1, 1,
-1.047603, 1.22541, -0.5142661, 0, 0, 0, 1, 1,
-1.041579, -0.1813972, -2.182601, 0, 0, 0, 1, 1,
-1.041384, -0.7770418, -3.041136, 0, 0, 0, 1, 1,
-1.037787, 2.2718, 0.4479809, 1, 1, 1, 1, 1,
-1.030857, -0.4437143, -2.242847, 1, 1, 1, 1, 1,
-1.027756, 1.185005, -2.365919, 1, 1, 1, 1, 1,
-1.027747, 0.1961336, -2.196076, 1, 1, 1, 1, 1,
-1.025667, 1.559873, -2.060618, 1, 1, 1, 1, 1,
-1.02207, 0.5999146, -1.055301, 1, 1, 1, 1, 1,
-1.018527, 1.517501, -0.4282658, 1, 1, 1, 1, 1,
-1.015483, 1.289585, -0.8809881, 1, 1, 1, 1, 1,
-1.012787, 0.550485, -0.1116447, 1, 1, 1, 1, 1,
-1.011233, -1.312763, -3.298309, 1, 1, 1, 1, 1,
-1.011184, 0.3246844, -0.975915, 1, 1, 1, 1, 1,
-1.010315, -0.02308426, -0.8944727, 1, 1, 1, 1, 1,
-1.009783, -0.1573841, 0.1792416, 1, 1, 1, 1, 1,
-1.005291, -0.7005759, -2.152105, 1, 1, 1, 1, 1,
-1.000531, -1.23192, -2.956509, 1, 1, 1, 1, 1,
-0.9884799, 1.778584, -2.53036, 0, 0, 1, 1, 1,
-0.983635, 1.005962, -0.9261435, 1, 0, 0, 1, 1,
-0.9688303, 0.8083637, -2.146122, 1, 0, 0, 1, 1,
-0.9660481, -0.9469979, -1.340901, 1, 0, 0, 1, 1,
-0.9628859, 1.108964, -0.4889692, 1, 0, 0, 1, 1,
-0.9521886, 0.3930614, -1.124518, 1, 0, 0, 1, 1,
-0.9484807, 1.795689, -0.9663544, 0, 0, 0, 1, 1,
-0.9480526, -0.8685044, -2.624295, 0, 0, 0, 1, 1,
-0.9471024, -1.182918, -2.756162, 0, 0, 0, 1, 1,
-0.9462704, 1.104362, -0.900858, 0, 0, 0, 1, 1,
-0.9454947, -0.3365659, -3.56162, 0, 0, 0, 1, 1,
-0.9438412, 0.8426942, -0.8157179, 0, 0, 0, 1, 1,
-0.9410751, -1.735276, -2.746512, 0, 0, 0, 1, 1,
-0.9349245, -1.662161, -3.700646, 1, 1, 1, 1, 1,
-0.9310344, 0.1202127, -0.9679439, 1, 1, 1, 1, 1,
-0.9296971, -1.303766, -2.229282, 1, 1, 1, 1, 1,
-0.9259644, 0.2314009, -1.479854, 1, 1, 1, 1, 1,
-0.9221536, -1.367852, -2.318826, 1, 1, 1, 1, 1,
-0.9194791, -0.2386206, -0.8299983, 1, 1, 1, 1, 1,
-0.9193211, 1.118706, 0.7116463, 1, 1, 1, 1, 1,
-0.9173855, -0.9185419, -1.55517, 1, 1, 1, 1, 1,
-0.9102936, -0.8073501, -3.481899, 1, 1, 1, 1, 1,
-0.9072418, 0.4496582, -1.264367, 1, 1, 1, 1, 1,
-0.8992494, 0.8559585, -0.568274, 1, 1, 1, 1, 1,
-0.8985798, -0.3208917, -1.75603, 1, 1, 1, 1, 1,
-0.881084, -0.05165982, -1.482592, 1, 1, 1, 1, 1,
-0.8710914, -1.355496, -2.425334, 1, 1, 1, 1, 1,
-0.8596244, 0.5202652, -2.760453, 1, 1, 1, 1, 1,
-0.8543653, -2.270262, -4.172282, 0, 0, 1, 1, 1,
-0.8356299, 0.4754449, -2.297621, 1, 0, 0, 1, 1,
-0.8349744, 1.526782, -0.4370532, 1, 0, 0, 1, 1,
-0.8205156, -2.009001, -2.361714, 1, 0, 0, 1, 1,
-0.8157429, -0.7076674, -2.472898, 1, 0, 0, 1, 1,
-0.8152149, 0.9056693, 0.3368022, 1, 0, 0, 1, 1,
-0.8131651, 0.9141981, -0.617526, 0, 0, 0, 1, 1,
-0.808453, 0.6438401, -1.810584, 0, 0, 0, 1, 1,
-0.8059271, 0.6512735, -1.481173, 0, 0, 0, 1, 1,
-0.8027732, 1.097832, -1.820375, 0, 0, 0, 1, 1,
-0.8025341, 0.5732797, -1.328109, 0, 0, 0, 1, 1,
-0.7983696, -0.5054057, -1.239706, 0, 0, 0, 1, 1,
-0.7939239, -2.376685, -2.201409, 0, 0, 0, 1, 1,
-0.7925915, 0.8493996, -1.822834, 1, 1, 1, 1, 1,
-0.7872775, -0.4235519, -2.050072, 1, 1, 1, 1, 1,
-0.7865005, 1.320491, -1.78984, 1, 1, 1, 1, 1,
-0.7862158, -1.568705, -0.5537656, 1, 1, 1, 1, 1,
-0.7822475, 0.3193556, -1.251859, 1, 1, 1, 1, 1,
-0.7795621, 1.003886, -1.902743, 1, 1, 1, 1, 1,
-0.7751097, 0.6994698, -0.6634748, 1, 1, 1, 1, 1,
-0.7705657, 0.1399675, -1.843051, 1, 1, 1, 1, 1,
-0.7628155, -0.5144488, -1.260234, 1, 1, 1, 1, 1,
-0.7575061, -0.8664066, -2.224109, 1, 1, 1, 1, 1,
-0.754872, 0.1635963, -0.8163177, 1, 1, 1, 1, 1,
-0.7482689, 1.170962, -1.75141, 1, 1, 1, 1, 1,
-0.7468503, 0.4535623, -2.112388, 1, 1, 1, 1, 1,
-0.7449573, -0.01335077, -2.540982, 1, 1, 1, 1, 1,
-0.7419878, 0.3933852, -0.4807118, 1, 1, 1, 1, 1,
-0.7409283, -1.259292, -1.149777, 0, 0, 1, 1, 1,
-0.7347467, 1.871559, -0.2492312, 1, 0, 0, 1, 1,
-0.7341016, 0.08968634, -1.167322, 1, 0, 0, 1, 1,
-0.7316259, -1.413435, -2.662685, 1, 0, 0, 1, 1,
-0.7265766, -0.880447, -4.021288, 1, 0, 0, 1, 1,
-0.7245244, 0.6391857, -1.575152, 1, 0, 0, 1, 1,
-0.7244893, -2.07548, -0.8907552, 0, 0, 0, 1, 1,
-0.7168831, 1.60592, 1.49571, 0, 0, 0, 1, 1,
-0.7166743, 0.4261056, -0.7778134, 0, 0, 0, 1, 1,
-0.7116896, -1.491183, -1.77576, 0, 0, 0, 1, 1,
-0.7098397, 0.9183158, -1.515227, 0, 0, 0, 1, 1,
-0.7096815, -1.177118, -1.633007, 0, 0, 0, 1, 1,
-0.7091034, 0.07257301, -2.029999, 0, 0, 0, 1, 1,
-0.7047291, 0.9789832, -1.358908, 1, 1, 1, 1, 1,
-0.7034349, -0.6039847, -2.164528, 1, 1, 1, 1, 1,
-0.7024968, -0.7034755, -3.288245, 1, 1, 1, 1, 1,
-0.699407, 0.6896131, -0.5038542, 1, 1, 1, 1, 1,
-0.6970716, -1.044615, -2.53806, 1, 1, 1, 1, 1,
-0.6961394, -0.2867058, -1.99248, 1, 1, 1, 1, 1,
-0.6954437, -0.3256222, -2.182092, 1, 1, 1, 1, 1,
-0.6944039, 1.011224, -1.164541, 1, 1, 1, 1, 1,
-0.6940609, -0.7644442, -1.66973, 1, 1, 1, 1, 1,
-0.6920929, -1.472002, -2.484905, 1, 1, 1, 1, 1,
-0.6893985, -0.4222383, -1.23577, 1, 1, 1, 1, 1,
-0.6892606, -0.6701525, -3.788108, 1, 1, 1, 1, 1,
-0.6846003, -0.258232, -2.209668, 1, 1, 1, 1, 1,
-0.6829351, 1.866128, 0.6060616, 1, 1, 1, 1, 1,
-0.6762827, 1.923236, 0.7572317, 1, 1, 1, 1, 1,
-0.6762289, 0.2108281, 0.08993205, 0, 0, 1, 1, 1,
-0.675664, -0.4046367, -2.200848, 1, 0, 0, 1, 1,
-0.6721153, -0.4808697, -3.354274, 1, 0, 0, 1, 1,
-0.6699281, 0.7615684, -1.447168, 1, 0, 0, 1, 1,
-0.6686822, 1.66043, -1.340387, 1, 0, 0, 1, 1,
-0.664408, 0.7070673, -1.75989, 1, 0, 0, 1, 1,
-0.6642733, 1.951702, -0.146193, 0, 0, 0, 1, 1,
-0.6615694, -0.440207, -1.456741, 0, 0, 0, 1, 1,
-0.6613244, 0.7781596, -1.558387, 0, 0, 0, 1, 1,
-0.6605648, 0.2583863, 0.004862775, 0, 0, 0, 1, 1,
-0.65728, 0.5063366, -0.7472872, 0, 0, 0, 1, 1,
-0.6524153, 0.5420732, -0.7929257, 0, 0, 0, 1, 1,
-0.6466836, 1.355258, -0.8701313, 0, 0, 0, 1, 1,
-0.6448133, -0.7489989, -3.09121, 1, 1, 1, 1, 1,
-0.6448087, 0.7656884, 0.06284077, 1, 1, 1, 1, 1,
-0.6418748, -0.3397941, -2.042968, 1, 1, 1, 1, 1,
-0.6386288, -1.268256, -1.990345, 1, 1, 1, 1, 1,
-0.6382692, 1.285753, 0.16954, 1, 1, 1, 1, 1,
-0.6381052, 0.0896873, -1.743051, 1, 1, 1, 1, 1,
-0.6374243, -0.1483907, -0.753339, 1, 1, 1, 1, 1,
-0.6349914, -0.6058863, -1.725834, 1, 1, 1, 1, 1,
-0.6304588, 1.114466, -1.847037, 1, 1, 1, 1, 1,
-0.6272376, 0.6345801, 0.570492, 1, 1, 1, 1, 1,
-0.6271994, -1.496496, -2.66553, 1, 1, 1, 1, 1,
-0.6245917, -0.6224266, -3.129017, 1, 1, 1, 1, 1,
-0.6241165, -0.2891475, -0.5076314, 1, 1, 1, 1, 1,
-0.6219005, 0.9723607, -0.04948316, 1, 1, 1, 1, 1,
-0.6173107, 0.3546944, 0.2202927, 1, 1, 1, 1, 1,
-0.6117628, -1.522633, -4.123382, 0, 0, 1, 1, 1,
-0.6087314, -1.34442, -4.235631, 1, 0, 0, 1, 1,
-0.6032197, -0.4977665, -3.36531, 1, 0, 0, 1, 1,
-0.6014885, -0.6305588, -2.34084, 1, 0, 0, 1, 1,
-0.6007477, -1.022289, -1.311643, 1, 0, 0, 1, 1,
-0.5985249, 1.625882, -0.1351863, 1, 0, 0, 1, 1,
-0.5954426, -0.314197, -1.848585, 0, 0, 0, 1, 1,
-0.594788, -0.7291314, -2.80219, 0, 0, 0, 1, 1,
-0.5925853, 0.2892921, -1.857442, 0, 0, 0, 1, 1,
-0.5924478, -1.677037, -2.599783, 0, 0, 0, 1, 1,
-0.5922134, 1.327024, -1.682518, 0, 0, 0, 1, 1,
-0.5855504, 1.307927, -1.802359, 0, 0, 0, 1, 1,
-0.5838967, -0.342141, -2.512441, 0, 0, 0, 1, 1,
-0.5811802, -0.3246002, -0.8004928, 1, 1, 1, 1, 1,
-0.5769846, 1.61973, -1.324876, 1, 1, 1, 1, 1,
-0.5755957, -0.9645377, -3.599087, 1, 1, 1, 1, 1,
-0.5686531, -0.1728141, 2.689961, 1, 1, 1, 1, 1,
-0.5664707, -2.1755, -2.069836, 1, 1, 1, 1, 1,
-0.5644758, -0.9611256, -1.332305, 1, 1, 1, 1, 1,
-0.5635283, 0.05956861, -3.455734, 1, 1, 1, 1, 1,
-0.5616643, -0.7393358, -0.6133552, 1, 1, 1, 1, 1,
-0.5542021, 0.8282491, -1.213695, 1, 1, 1, 1, 1,
-0.5516769, -0.2380066, -0.4538911, 1, 1, 1, 1, 1,
-0.5471381, -0.1933467, -5.255938, 1, 1, 1, 1, 1,
-0.5441498, 0.6415488, -0.6403821, 1, 1, 1, 1, 1,
-0.5424713, -1.331495, -3.506963, 1, 1, 1, 1, 1,
-0.5410141, -0.1151603, -1.205373, 1, 1, 1, 1, 1,
-0.540134, -1.211365, -3.328778, 1, 1, 1, 1, 1,
-0.5334171, -0.01067448, -1.034607, 0, 0, 1, 1, 1,
-0.5331282, -0.847743, -3.541353, 1, 0, 0, 1, 1,
-0.5316665, 0.5766194, -0.3976808, 1, 0, 0, 1, 1,
-0.5297313, 0.400579, -1.03162, 1, 0, 0, 1, 1,
-0.5289184, -0.3188546, -1.124853, 1, 0, 0, 1, 1,
-0.5247345, 0.9971406, -1.135798, 1, 0, 0, 1, 1,
-0.5245058, -2.612958, -2.92726, 0, 0, 0, 1, 1,
-0.5240306, -0.9851192, -2.653984, 0, 0, 0, 1, 1,
-0.5227978, 1.328615, 1.690085, 0, 0, 0, 1, 1,
-0.5226939, 0.4665817, -1.39714, 0, 0, 0, 1, 1,
-0.5220729, -2.793588, -3.245242, 0, 0, 0, 1, 1,
-0.5220478, 0.4451705, -1.702965, 0, 0, 0, 1, 1,
-0.5175878, -1.103832, -2.647413, 0, 0, 0, 1, 1,
-0.5168543, -1.242362, -4.610042, 1, 1, 1, 1, 1,
-0.5146517, 0.1096419, -2.042326, 1, 1, 1, 1, 1,
-0.5141609, -0.2910274, -3.04188, 1, 1, 1, 1, 1,
-0.5141224, 0.02950614, -1.172887, 1, 1, 1, 1, 1,
-0.5134147, 0.4479162, -0.4654584, 1, 1, 1, 1, 1,
-0.5077118, -1.375698, -2.339964, 1, 1, 1, 1, 1,
-0.5059612, 0.5397263, 0.4304279, 1, 1, 1, 1, 1,
-0.5055757, -0.124933, -2.496017, 1, 1, 1, 1, 1,
-0.5028992, 1.208143, 0.1649863, 1, 1, 1, 1, 1,
-0.5025092, -0.6032125, -0.04307161, 1, 1, 1, 1, 1,
-0.499117, -1.718308, -2.785975, 1, 1, 1, 1, 1,
-0.4982255, -0.1288346, -2.567385, 1, 1, 1, 1, 1,
-0.4948205, -0.5162103, -4.333241, 1, 1, 1, 1, 1,
-0.4930714, -0.2287806, -1.543995, 1, 1, 1, 1, 1,
-0.4882617, 0.1752095, -0.7478589, 1, 1, 1, 1, 1,
-0.4707648, -1.260175, -3.42555, 0, 0, 1, 1, 1,
-0.4698431, -1.369, -1.185894, 1, 0, 0, 1, 1,
-0.468359, -1.87776, -2.08844, 1, 0, 0, 1, 1,
-0.4673649, 0.4552439, -1.061342, 1, 0, 0, 1, 1,
-0.46435, 1.082168, -0.2385866, 1, 0, 0, 1, 1,
-0.4635661, -0.102777, -2.373206, 1, 0, 0, 1, 1,
-0.4623269, 0.01623456, -0.5553169, 0, 0, 0, 1, 1,
-0.4621703, -0.3060625, -1.444384, 0, 0, 0, 1, 1,
-0.4586851, 1.969555, 1.046329, 0, 0, 0, 1, 1,
-0.4580013, -0.0310721, -1.016922, 0, 0, 0, 1, 1,
-0.4563079, -0.08677815, -2.504942, 0, 0, 0, 1, 1,
-0.4542953, -1.430686, -2.275181, 0, 0, 0, 1, 1,
-0.4514553, -0.7610924, -1.712453, 0, 0, 0, 1, 1,
-0.4504856, 0.8218202, -0.225247, 1, 1, 1, 1, 1,
-0.4500597, 0.4752631, -1.015524, 1, 1, 1, 1, 1,
-0.4492085, 0.4188054, -0.2349494, 1, 1, 1, 1, 1,
-0.4491867, 0.01362023, -2.091542, 1, 1, 1, 1, 1,
-0.4471582, 1.601556, -1.662433, 1, 1, 1, 1, 1,
-0.4421934, -0.6137478, -3.045684, 1, 1, 1, 1, 1,
-0.4383354, 1.474381, 0.5764636, 1, 1, 1, 1, 1,
-0.4372288, 0.2064114, -0.6767847, 1, 1, 1, 1, 1,
-0.4363424, 2.8167, 0.404588, 1, 1, 1, 1, 1,
-0.4320617, -1.818389, -3.125107, 1, 1, 1, 1, 1,
-0.431179, 2.136826, -1.580791, 1, 1, 1, 1, 1,
-0.4306683, -0.9863697, -3.143895, 1, 1, 1, 1, 1,
-0.429066, -0.2669113, -3.689285, 1, 1, 1, 1, 1,
-0.4218285, 1.033754, -0.6408738, 1, 1, 1, 1, 1,
-0.4187567, -0.3780226, -2.1394, 1, 1, 1, 1, 1,
-0.4141814, -2.105019, -3.316905, 0, 0, 1, 1, 1,
-0.4126385, -1.081214, -3.238014, 1, 0, 0, 1, 1,
-0.4035231, 1.657507, -0.03214974, 1, 0, 0, 1, 1,
-0.4018966, 0.4923903, -0.5918027, 1, 0, 0, 1, 1,
-0.3987318, 0.5022017, 0.2838545, 1, 0, 0, 1, 1,
-0.392868, 0.102341, -1.848747, 1, 0, 0, 1, 1,
-0.3917544, -1.692632, -0.9633515, 0, 0, 0, 1, 1,
-0.380677, 1.188513, -0.8525429, 0, 0, 0, 1, 1,
-0.3801035, -0.5433345, -2.010827, 0, 0, 0, 1, 1,
-0.379028, -1.368475, -1.228145, 0, 0, 0, 1, 1,
-0.3763749, -0.162206, -2.950849, 0, 0, 0, 1, 1,
-0.3756321, 0.7512887, -0.143623, 0, 0, 0, 1, 1,
-0.3737602, -0.5235046, -1.587488, 0, 0, 0, 1, 1,
-0.3713388, -0.04544938, -2.066109, 1, 1, 1, 1, 1,
-0.3684491, -0.2372289, -1.675021, 1, 1, 1, 1, 1,
-0.3666645, -1.378826, -3.14428, 1, 1, 1, 1, 1,
-0.3634667, 0.5447181, -0.04209611, 1, 1, 1, 1, 1,
-0.3607489, -0.777244, -3.853666, 1, 1, 1, 1, 1,
-0.3553461, 1.139052, 0.8049657, 1, 1, 1, 1, 1,
-0.3499225, -1.316995, -2.698903, 1, 1, 1, 1, 1,
-0.3449626, -0.254515, -4.923915, 1, 1, 1, 1, 1,
-0.3444107, 0.8152411, 1.044248, 1, 1, 1, 1, 1,
-0.3389066, -0.1104796, -2.02028, 1, 1, 1, 1, 1,
-0.3373421, -0.4711838, -1.759161, 1, 1, 1, 1, 1,
-0.3311817, -0.08654275, -2.841161, 1, 1, 1, 1, 1,
-0.3305237, -0.7074471, -1.863885, 1, 1, 1, 1, 1,
-0.3279038, -0.1335423, -2.106265, 1, 1, 1, 1, 1,
-0.3268758, 1.203432, -1.596149, 1, 1, 1, 1, 1,
-0.3264531, -0.1806918, -0.9860322, 0, 0, 1, 1, 1,
-0.3232736, -0.7104908, -1.465248, 1, 0, 0, 1, 1,
-0.311839, 0.01832716, 1.499106, 1, 0, 0, 1, 1,
-0.3073004, -0.6293092, -3.009171, 1, 0, 0, 1, 1,
-0.3064481, 0.5234856, 0.100051, 1, 0, 0, 1, 1,
-0.3046121, -0.8987765, -2.464668, 1, 0, 0, 1, 1,
-0.3037081, 0.09266984, -2.195081, 0, 0, 0, 1, 1,
-0.3024466, -0.859775, -2.650838, 0, 0, 0, 1, 1,
-0.3019973, 1.357659, -0.2517641, 0, 0, 0, 1, 1,
-0.2983955, -0.8991342, -3.626533, 0, 0, 0, 1, 1,
-0.2976191, 0.5900595, 0.1647414, 0, 0, 0, 1, 1,
-0.2960042, -0.4787232, -1.677226, 0, 0, 0, 1, 1,
-0.2939891, 1.293933, -0.651758, 0, 0, 0, 1, 1,
-0.2886805, -0.03489949, -2.518026, 1, 1, 1, 1, 1,
-0.2886007, 0.008812632, -2.09237, 1, 1, 1, 1, 1,
-0.2879131, 0.5093451, -1.835711, 1, 1, 1, 1, 1,
-0.283835, 0.7264861, -0.4733529, 1, 1, 1, 1, 1,
-0.2802907, 0.712398, -0.575519, 1, 1, 1, 1, 1,
-0.2763139, 0.01695624, 0.672024, 1, 1, 1, 1, 1,
-0.2686826, -0.7030119, -1.776626, 1, 1, 1, 1, 1,
-0.2682634, 1.06586, 0.5194503, 1, 1, 1, 1, 1,
-0.265683, -1.334655, -3.664583, 1, 1, 1, 1, 1,
-0.2599615, 0.06566322, -1.027719, 1, 1, 1, 1, 1,
-0.2574444, -0.4040425, -1.792322, 1, 1, 1, 1, 1,
-0.2571169, 0.5743185, -0.4982768, 1, 1, 1, 1, 1,
-0.2557569, -0.03003051, -1.241516, 1, 1, 1, 1, 1,
-0.2552791, -0.5063668, -0.5790112, 1, 1, 1, 1, 1,
-0.2508097, -0.2945328, -1.590177, 1, 1, 1, 1, 1,
-0.2493692, -1.732211, -3.587514, 0, 0, 1, 1, 1,
-0.2447146, 0.4297026, 0.1830794, 1, 0, 0, 1, 1,
-0.2436333, -0.6007756, -1.642404, 1, 0, 0, 1, 1,
-0.2414955, -0.3723247, -2.410466, 1, 0, 0, 1, 1,
-0.2386567, 0.8121201, 0.6148132, 1, 0, 0, 1, 1,
-0.2383714, 1.634492, 0.5815183, 1, 0, 0, 1, 1,
-0.2377987, -0.4560188, -2.929198, 0, 0, 0, 1, 1,
-0.2376084, 1.78673, 0.07081918, 0, 0, 0, 1, 1,
-0.2373207, -1.355252, -3.650986, 0, 0, 0, 1, 1,
-0.2288058, 0.4480548, -0.6370111, 0, 0, 0, 1, 1,
-0.214976, 1.010767, -1.570829, 0, 0, 0, 1, 1,
-0.2142084, 0.1692956, -1.861984, 0, 0, 0, 1, 1,
-0.2131156, 1.193388, -0.4315435, 0, 0, 0, 1, 1,
-0.2128735, 1.087177, 0.3746436, 1, 1, 1, 1, 1,
-0.2123585, -0.4307152, -2.074002, 1, 1, 1, 1, 1,
-0.2118105, 0.1877034, -0.974174, 1, 1, 1, 1, 1,
-0.2100865, -1.074296, -3.217616, 1, 1, 1, 1, 1,
-0.2075563, 1.899993, 1.735394, 1, 1, 1, 1, 1,
-0.2018583, 0.5931923, -0.9967113, 1, 1, 1, 1, 1,
-0.2014021, 1.05263, 0.6848542, 1, 1, 1, 1, 1,
-0.2012498, -1.823954, -2.892197, 1, 1, 1, 1, 1,
-0.2007231, -0.268449, -4.836314, 1, 1, 1, 1, 1,
-0.1901824, 1.662925, -1.496722, 1, 1, 1, 1, 1,
-0.1878007, -1.909967, -2.670442, 1, 1, 1, 1, 1,
-0.1873506, -1.106189, -1.727415, 1, 1, 1, 1, 1,
-0.184158, 1.266874, -0.2804078, 1, 1, 1, 1, 1,
-0.1794817, -1.138073, -2.922986, 1, 1, 1, 1, 1,
-0.1776836, -1.029274, -3.023179, 1, 1, 1, 1, 1,
-0.177172, -0.8130242, -2.346688, 0, 0, 1, 1, 1,
-0.1770035, 0.3550797, -0.6799151, 1, 0, 0, 1, 1,
-0.175305, 0.7283067, -0.557788, 1, 0, 0, 1, 1,
-0.1679366, 0.906579, 0.297396, 1, 0, 0, 1, 1,
-0.1632299, -2.09536, -2.625139, 1, 0, 0, 1, 1,
-0.1600147, -0.3735003, -3.01784, 1, 0, 0, 1, 1,
-0.1597882, 0.8002853, 0.7630946, 0, 0, 0, 1, 1,
-0.15932, -0.2259339, -3.815826, 0, 0, 0, 1, 1,
-0.158052, 0.8809419, -1.529285, 0, 0, 0, 1, 1,
-0.1567191, -0.6311054, -2.65595, 0, 0, 0, 1, 1,
-0.1491163, -2.188661, -2.619306, 0, 0, 0, 1, 1,
-0.1476754, -0.6070144, -1.692011, 0, 0, 0, 1, 1,
-0.1439223, -0.9109589, -2.25551, 0, 0, 0, 1, 1,
-0.1411667, -0.5524089, -3.316147, 1, 1, 1, 1, 1,
-0.1393881, 0.1245001, 1.026616, 1, 1, 1, 1, 1,
-0.1393687, 1.448051, 0.4581285, 1, 1, 1, 1, 1,
-0.1336512, -2.559935, -1.87971, 1, 1, 1, 1, 1,
-0.1321535, -0.1397631, -2.146923, 1, 1, 1, 1, 1,
-0.1307161, -0.03011245, -2.393703, 1, 1, 1, 1, 1,
-0.1235131, 0.6635929, -2.872295, 1, 1, 1, 1, 1,
-0.1193186, -0.784605, -3.611443, 1, 1, 1, 1, 1,
-0.1192104, -0.8005669, -3.525718, 1, 1, 1, 1, 1,
-0.1187697, 0.2245986, 0.3880019, 1, 1, 1, 1, 1,
-0.1185945, -0.129244, -2.688306, 1, 1, 1, 1, 1,
-0.1088778, -1.016166, -4.119182, 1, 1, 1, 1, 1,
-0.1038592, -0.6041284, -2.93342, 1, 1, 1, 1, 1,
-0.09665554, -0.328103, -3.460068, 1, 1, 1, 1, 1,
-0.08861268, 0.5138812, -0.9625874, 1, 1, 1, 1, 1,
-0.08789815, 0.5914127, 1.221191, 0, 0, 1, 1, 1,
-0.07837788, 1.118626, -1.034203, 1, 0, 0, 1, 1,
-0.0747826, -0.5181813, -3.348479, 1, 0, 0, 1, 1,
-0.07451956, 0.8558704, -1.382422, 1, 0, 0, 1, 1,
-0.07154703, -0.7764016, -3.054832, 1, 0, 0, 1, 1,
-0.06842716, 1.232046, 1.56731, 1, 0, 0, 1, 1,
-0.06546122, 1.072282, 1.48199, 0, 0, 0, 1, 1,
-0.06325137, -0.0388242, -1.541206, 0, 0, 0, 1, 1,
-0.062613, -0.4481321, -3.207324, 0, 0, 0, 1, 1,
-0.05947566, -2.338586, -4.805792, 0, 0, 0, 1, 1,
-0.05547566, -0.1353157, -3.447907, 0, 0, 0, 1, 1,
-0.05504366, 0.2684934, 0.8476746, 0, 0, 0, 1, 1,
-0.05291004, -1.253267, -4.395797, 0, 0, 0, 1, 1,
-0.05199387, -1.710429, -3.093398, 1, 1, 1, 1, 1,
-0.05164072, 0.9955547, 0.6075282, 1, 1, 1, 1, 1,
-0.04989249, -1.067517, -1.733298, 1, 1, 1, 1, 1,
-0.04534195, -1.500594, -4.072394, 1, 1, 1, 1, 1,
-0.04436915, 1.039596, -1.033277, 1, 1, 1, 1, 1,
-0.04434261, -0.6568247, -3.981178, 1, 1, 1, 1, 1,
-0.04399311, -0.3990912, -2.81806, 1, 1, 1, 1, 1,
-0.03583394, -1.30417, -2.735666, 1, 1, 1, 1, 1,
-0.0334675, -0.4961204, -2.311403, 1, 1, 1, 1, 1,
-0.02827355, -1.001916, -1.781905, 1, 1, 1, 1, 1,
-0.02825564, 0.7775853, 1.67291, 1, 1, 1, 1, 1,
-0.02639445, 0.9008146, -0.4126961, 1, 1, 1, 1, 1,
-0.0255172, 1.328983, -0.9897049, 1, 1, 1, 1, 1,
-0.0224703, -0.5028211, -4.109862, 1, 1, 1, 1, 1,
-0.02239338, 0.8360736, 1.553113, 1, 1, 1, 1, 1,
-0.02172435, 0.2683974, 0.515415, 0, 0, 1, 1, 1,
-0.01999653, -1.026734, -2.769722, 1, 0, 0, 1, 1,
-0.01730723, 0.9253343, 0.8000802, 1, 0, 0, 1, 1,
-0.01657025, -0.7581615, -4.669993, 1, 0, 0, 1, 1,
-0.0159463, -1.024587, -4.320187, 1, 0, 0, 1, 1,
-0.01447896, 0.238336, 0.3164302, 1, 0, 0, 1, 1,
-0.01268391, -0.8157389, -3.42567, 0, 0, 0, 1, 1,
-0.009344744, 0.6089146, 0.06867423, 0, 0, 0, 1, 1,
-0.007703982, 0.2883143, -0.003601615, 0, 0, 0, 1, 1,
0.0007791849, 0.6902678, -0.4523036, 0, 0, 0, 1, 1,
0.00177848, -0.4431263, 4.86061, 0, 0, 0, 1, 1,
0.002884586, -1.135472, 1.151148, 0, 0, 0, 1, 1,
0.003259512, -0.1483028, 6.334806, 0, 0, 0, 1, 1,
0.005157507, 0.2582843, -1.019992, 1, 1, 1, 1, 1,
0.01057079, -1.063405, 3.596119, 1, 1, 1, 1, 1,
0.01502557, 0.1321828, -0.8408136, 1, 1, 1, 1, 1,
0.02179815, -1.500874, 3.59647, 1, 1, 1, 1, 1,
0.02795288, -2.166594, 3.471519, 1, 1, 1, 1, 1,
0.02884918, 0.4948175, -1.846404, 1, 1, 1, 1, 1,
0.03245756, -0.3224095, 4.192982, 1, 1, 1, 1, 1,
0.03506259, 1.143335, -0.3304699, 1, 1, 1, 1, 1,
0.03925871, 1.278962, -0.1917218, 1, 1, 1, 1, 1,
0.04435905, -0.5575061, 1.315147, 1, 1, 1, 1, 1,
0.04449752, -0.1504368, 2.547468, 1, 1, 1, 1, 1,
0.04779899, -0.1180798, 2.882446, 1, 1, 1, 1, 1,
0.04874063, 0.1146178, 0.9447737, 1, 1, 1, 1, 1,
0.05012121, -0.3454868, 2.684696, 1, 1, 1, 1, 1,
0.05257253, -0.4556157, 2.167942, 1, 1, 1, 1, 1,
0.05387205, 0.281346, 0.674565, 0, 0, 1, 1, 1,
0.05475235, -1.094727, 2.761547, 1, 0, 0, 1, 1,
0.05796974, 0.0188828, -0.7304274, 1, 0, 0, 1, 1,
0.0586646, 0.7561411, -1.093889, 1, 0, 0, 1, 1,
0.06375837, -0.3926245, 2.871585, 1, 0, 0, 1, 1,
0.07377335, -0.8418351, 1.987236, 1, 0, 0, 1, 1,
0.07395662, 0.5543189, -0.03459617, 0, 0, 0, 1, 1,
0.07443082, 0.8025628, 0.3134665, 0, 0, 0, 1, 1,
0.07577678, 1.095801, 0.3748637, 0, 0, 0, 1, 1,
0.07593235, 0.693114, -0.2382527, 0, 0, 0, 1, 1,
0.08046061, -1.657075, 3.345443, 0, 0, 0, 1, 1,
0.0806501, 1.196895, 0.2070712, 0, 0, 0, 1, 1,
0.08125149, 0.7143207, 0.08063832, 0, 0, 0, 1, 1,
0.08560129, 1.24607, 1.183462, 1, 1, 1, 1, 1,
0.09470261, -0.2069011, 2.945972, 1, 1, 1, 1, 1,
0.09537091, 2.269637, 0.3855586, 1, 1, 1, 1, 1,
0.09620239, -1.363439, 4.358347, 1, 1, 1, 1, 1,
0.09993026, 1.01274, -0.8268536, 1, 1, 1, 1, 1,
0.1016957, -0.7623119, 0.2922369, 1, 1, 1, 1, 1,
0.1090391, -0.6242477, 2.870169, 1, 1, 1, 1, 1,
0.1095914, 2.134283, 1.425751, 1, 1, 1, 1, 1,
0.1113937, 0.07736917, 1.819106, 1, 1, 1, 1, 1,
0.1130553, 0.4561804, 0.9928092, 1, 1, 1, 1, 1,
0.1153488, 0.5148137, -0.7315823, 1, 1, 1, 1, 1,
0.116406, 0.06848855, 1.393595, 1, 1, 1, 1, 1,
0.1170719, 1.252132, 0.8002338, 1, 1, 1, 1, 1,
0.1195002, 0.07516632, 0.5854747, 1, 1, 1, 1, 1,
0.1217297, -0.8779483, 3.668836, 1, 1, 1, 1, 1,
0.1243417, -0.1134721, -0.7423849, 0, 0, 1, 1, 1,
0.1244198, 0.8336612, 1.907423, 1, 0, 0, 1, 1,
0.1244418, 0.1386594, 1.013809, 1, 0, 0, 1, 1,
0.1322493, 0.1860077, 0.471608, 1, 0, 0, 1, 1,
0.1335455, -1.135412, 2.29478, 1, 0, 0, 1, 1,
0.1343571, 0.2663838, -0.5759011, 1, 0, 0, 1, 1,
0.1394251, -0.9953818, 2.763441, 0, 0, 0, 1, 1,
0.1450498, -0.6814396, 2.409576, 0, 0, 0, 1, 1,
0.1459879, -0.7518755, 1.747555, 0, 0, 0, 1, 1,
0.1463374, -0.5852666, 2.622169, 0, 0, 0, 1, 1,
0.1519881, 0.5784413, 0.8298383, 0, 0, 0, 1, 1,
0.1526967, -0.3404056, 2.635344, 0, 0, 0, 1, 1,
0.1600896, -1.133058, 1.912224, 0, 0, 0, 1, 1,
0.1610532, -0.3780939, 4.410997, 1, 1, 1, 1, 1,
0.1616034, 1.00656, 0.01910799, 1, 1, 1, 1, 1,
0.1649681, -0.9708483, 1.501551, 1, 1, 1, 1, 1,
0.1650648, -0.06858695, 0.8017601, 1, 1, 1, 1, 1,
0.1671895, -0.1807597, 3.748533, 1, 1, 1, 1, 1,
0.167738, -0.646199, 2.943077, 1, 1, 1, 1, 1,
0.1701946, 0.7513081, 3.727093, 1, 1, 1, 1, 1,
0.1703823, -0.04692624, 2.183562, 1, 1, 1, 1, 1,
0.1713248, 0.9877042, 0.9179816, 1, 1, 1, 1, 1,
0.1716868, 0.03762729, 0.2030396, 1, 1, 1, 1, 1,
0.1745328, 1.339547, -1.283898, 1, 1, 1, 1, 1,
0.1773421, -1.55207, 2.410939, 1, 1, 1, 1, 1,
0.1813615, -0.2344974, 1.66072, 1, 1, 1, 1, 1,
0.182668, -0.2065706, 2.929098, 1, 1, 1, 1, 1,
0.190952, -0.153804, 1.784783, 1, 1, 1, 1, 1,
0.1943559, -0.005826123, 1.07599, 0, 0, 1, 1, 1,
0.1979192, -0.1702756, 1.65994, 1, 0, 0, 1, 1,
0.2009435, 0.6113118, 0.8034326, 1, 0, 0, 1, 1,
0.2013977, 1.050793, 0.5105767, 1, 0, 0, 1, 1,
0.2046454, 0.715589, -0.6189609, 1, 0, 0, 1, 1,
0.2058896, -1.590918, 2.543409, 1, 0, 0, 1, 1,
0.2088394, 2.208646, 0.8721319, 0, 0, 0, 1, 1,
0.2121259, 0.816475, -1.221923, 0, 0, 0, 1, 1,
0.2207165, -1.380011, 3.487322, 0, 0, 0, 1, 1,
0.2214273, -0.748753, 2.022493, 0, 0, 0, 1, 1,
0.2238432, 0.1362875, 2.442508, 0, 0, 0, 1, 1,
0.2258066, 0.7426827, -1.077871, 0, 0, 0, 1, 1,
0.2326791, -0.1763808, 1.299961, 0, 0, 0, 1, 1,
0.235043, -1.531822, 3.39813, 1, 1, 1, 1, 1,
0.2364648, 0.154258, 0.2015947, 1, 1, 1, 1, 1,
0.2366606, -1.487334, 2.886745, 1, 1, 1, 1, 1,
0.2381135, -0.1037643, 2.207536, 1, 1, 1, 1, 1,
0.2403654, 0.06385498, 0.499947, 1, 1, 1, 1, 1,
0.2420272, -0.6845921, 3.790049, 1, 1, 1, 1, 1,
0.2426328, 0.1442651, -0.1663742, 1, 1, 1, 1, 1,
0.2464992, -1.244405, 4.525284, 1, 1, 1, 1, 1,
0.2530541, -1.334372, 3.724373, 1, 1, 1, 1, 1,
0.2543221, 0.4940033, 1.618627, 1, 1, 1, 1, 1,
0.2554905, -0.1716489, 0.9063069, 1, 1, 1, 1, 1,
0.2556223, 0.5670179, -1.832172, 1, 1, 1, 1, 1,
0.2566878, -1.267084, 2.574658, 1, 1, 1, 1, 1,
0.2588793, 0.6693465, 0.1685234, 1, 1, 1, 1, 1,
0.2611655, -0.1081965, 2.758674, 1, 1, 1, 1, 1,
0.262007, 0.8760145, 0.3633015, 0, 0, 1, 1, 1,
0.262215, -0.4620048, 2.315601, 1, 0, 0, 1, 1,
0.2624022, 0.05623087, 1.682171, 1, 0, 0, 1, 1,
0.2642897, 0.2255271, 0.7105664, 1, 0, 0, 1, 1,
0.2651261, 1.151582, 0.8095736, 1, 0, 0, 1, 1,
0.2651696, -0.1645518, 1.878659, 1, 0, 0, 1, 1,
0.2683991, 0.482385, -0.6752354, 0, 0, 0, 1, 1,
0.2712139, -0.4448841, 2.314494, 0, 0, 0, 1, 1,
0.2712702, -0.4707648, 2.622666, 0, 0, 0, 1, 1,
0.272191, -0.1581963, 3.375876, 0, 0, 0, 1, 1,
0.2753436, -0.6222997, 3.661252, 0, 0, 0, 1, 1,
0.2763335, 0.5238969, -0.08476459, 0, 0, 0, 1, 1,
0.2764324, -0.4894533, 2.525187, 0, 0, 0, 1, 1,
0.2787871, -1.13827, 2.241434, 1, 1, 1, 1, 1,
0.2815113, -0.628174, 1.637772, 1, 1, 1, 1, 1,
0.2854389, 0.1839616, 1.133032, 1, 1, 1, 1, 1,
0.287562, -0.4450101, 2.085166, 1, 1, 1, 1, 1,
0.2914341, -0.06077367, 1.50882, 1, 1, 1, 1, 1,
0.2945716, 0.532347, 0.2955043, 1, 1, 1, 1, 1,
0.2948498, -0.3688923, 0.7055722, 1, 1, 1, 1, 1,
0.2969789, -1.032477, 4.09181, 1, 1, 1, 1, 1,
0.2979337, -1.703916, 2.483169, 1, 1, 1, 1, 1,
0.2981554, 1.878369, 0.9783977, 1, 1, 1, 1, 1,
0.3001541, -1.594738, 4.978361, 1, 1, 1, 1, 1,
0.3058682, -0.282299, 2.993416, 1, 1, 1, 1, 1,
0.3060167, 0.2796806, 2.08427, 1, 1, 1, 1, 1,
0.3061005, -1.135943, 3.774574, 1, 1, 1, 1, 1,
0.3125332, 0.982749, 1.535321, 1, 1, 1, 1, 1,
0.3128471, -0.6853859, 1.342665, 0, 0, 1, 1, 1,
0.3155931, 0.7165883, 2.019357, 1, 0, 0, 1, 1,
0.3161414, -0.3382961, 2.379493, 1, 0, 0, 1, 1,
0.3176576, 0.384262, -0.8546534, 1, 0, 0, 1, 1,
0.3201595, 0.6132306, 1.83128, 1, 0, 0, 1, 1,
0.3213267, -1.351416, 1.780288, 1, 0, 0, 1, 1,
0.3229713, -1.215985, 2.073285, 0, 0, 0, 1, 1,
0.3295541, 0.1073979, 1.255673, 0, 0, 0, 1, 1,
0.330638, 0.3354483, 1.967018, 0, 0, 0, 1, 1,
0.331927, 2.177468, -0.9252891, 0, 0, 0, 1, 1,
0.3337249, -1.735444, 2.000608, 0, 0, 0, 1, 1,
0.3398706, 0.1338757, 3.475585, 0, 0, 0, 1, 1,
0.3424982, 0.4310755, 0.9261898, 0, 0, 0, 1, 1,
0.3462699, 0.6774127, -0.09269345, 1, 1, 1, 1, 1,
0.3469179, -1.847435, 4.915441, 1, 1, 1, 1, 1,
0.3513696, -0.08252155, 3.067122, 1, 1, 1, 1, 1,
0.3531283, -1.503696, 4.150535, 1, 1, 1, 1, 1,
0.3547868, 0.1931617, -0.1625957, 1, 1, 1, 1, 1,
0.3559962, 0.8938441, -0.3554834, 1, 1, 1, 1, 1,
0.3563271, -0.5957019, 4.12715, 1, 1, 1, 1, 1,
0.3582902, -0.3931829, 2.078426, 1, 1, 1, 1, 1,
0.3585953, -0.1995711, 1.678279, 1, 1, 1, 1, 1,
0.3603653, -0.001298825, -0.04274424, 1, 1, 1, 1, 1,
0.360763, 1.462318, 0.8459586, 1, 1, 1, 1, 1,
0.361641, -0.6165938, 3.163624, 1, 1, 1, 1, 1,
0.3677534, -0.2817781, 3.254005, 1, 1, 1, 1, 1,
0.3677728, -0.4121236, 1.372639, 1, 1, 1, 1, 1,
0.3696783, 0.9391878, 1.47937, 1, 1, 1, 1, 1,
0.3700145, -0.9039907, 3.454354, 0, 0, 1, 1, 1,
0.375015, -0.587812, 2.927773, 1, 0, 0, 1, 1,
0.3817665, 1.159436, -0.1840835, 1, 0, 0, 1, 1,
0.3827225, 0.3742433, 0.07477468, 1, 0, 0, 1, 1,
0.3834896, -1.231931, 1.612846, 1, 0, 0, 1, 1,
0.385673, -0.1522701, 1.599991, 1, 0, 0, 1, 1,
0.3935933, -1.009213, 3.617641, 0, 0, 0, 1, 1,
0.4022212, 1.725996, -2.119808, 0, 0, 0, 1, 1,
0.4024381, 0.241147, 1.776842, 0, 0, 0, 1, 1,
0.4052222, -1.425822, 4.294677, 0, 0, 0, 1, 1,
0.4054962, 0.1557953, 1.888906, 0, 0, 0, 1, 1,
0.4107673, -0.4752907, 1.551965, 0, 0, 0, 1, 1,
0.4113244, 0.3288857, 2.724232, 0, 0, 0, 1, 1,
0.4129732, 1.426035, 1.244637, 1, 1, 1, 1, 1,
0.41447, 1.27139, 1.763079, 1, 1, 1, 1, 1,
0.4165624, 1.745602, 0.7062999, 1, 1, 1, 1, 1,
0.4224963, 0.70534, -0.9543076, 1, 1, 1, 1, 1,
0.4240867, -2.094465, 2.945466, 1, 1, 1, 1, 1,
0.426838, 0.5164124, 0.6289591, 1, 1, 1, 1, 1,
0.4323355, 0.4412945, 0.3591897, 1, 1, 1, 1, 1,
0.4331393, 0.6532855, 0.7824813, 1, 1, 1, 1, 1,
0.4391212, -0.3234564, 3.074947, 1, 1, 1, 1, 1,
0.4392766, -0.1606049, 0.9996284, 1, 1, 1, 1, 1,
0.4410157, -0.2833338, 2.473533, 1, 1, 1, 1, 1,
0.4421253, 0.2106623, 1.460279, 1, 1, 1, 1, 1,
0.4424226, -2.530017, 1.02435, 1, 1, 1, 1, 1,
0.446683, -0.6226124, 3.719424, 1, 1, 1, 1, 1,
0.4492465, -0.2886885, 2.427961, 1, 1, 1, 1, 1,
0.452168, 2.517776, -1.20388, 0, 0, 1, 1, 1,
0.4531859, -0.1354621, 1.035453, 1, 0, 0, 1, 1,
0.4537166, 0.3626635, 1.057623, 1, 0, 0, 1, 1,
0.4555621, -0.8910276, 2.641615, 1, 0, 0, 1, 1,
0.4619925, -1.459763, 1.811068, 1, 0, 0, 1, 1,
0.4682164, -0.8680243, 2.279252, 1, 0, 0, 1, 1,
0.4723265, -0.1948393, 1.96193, 0, 0, 0, 1, 1,
0.4759144, -0.02050555, 1.654908, 0, 0, 0, 1, 1,
0.4859376, -0.0975902, 3.824281, 0, 0, 0, 1, 1,
0.4973803, -0.01072985, 1.155695, 0, 0, 0, 1, 1,
0.5018706, 0.570231, 2.26161, 0, 0, 0, 1, 1,
0.5062243, 0.9496979, -0.4351359, 0, 0, 0, 1, 1,
0.511588, 0.9006025, 0.6079659, 0, 0, 0, 1, 1,
0.5124691, -0.9651408, 3.972304, 1, 1, 1, 1, 1,
0.516301, -0.4656926, -0.9393966, 1, 1, 1, 1, 1,
0.5211893, 0.2110575, 4.021946, 1, 1, 1, 1, 1,
0.5221443, 0.4417962, 1.759485, 1, 1, 1, 1, 1,
0.5276183, 0.6567424, 0.7172665, 1, 1, 1, 1, 1,
0.5291938, 1.156196, 0.2650322, 1, 1, 1, 1, 1,
0.532572, 0.7514547, 2.374696, 1, 1, 1, 1, 1,
0.5331037, -1.313236, 0.5868102, 1, 1, 1, 1, 1,
0.5341846, -0.5396814, 3.395915, 1, 1, 1, 1, 1,
0.5446151, 0.1584582, 1.392141, 1, 1, 1, 1, 1,
0.5494717, -0.7438879, 2.342865, 1, 1, 1, 1, 1,
0.5515337, -0.2770942, 0.6527514, 1, 1, 1, 1, 1,
0.5550941, 1.216458, -0.1038068, 1, 1, 1, 1, 1,
0.5570518, 0.8776383, -0.3537302, 1, 1, 1, 1, 1,
0.5591819, 0.5417803, 1.653475, 1, 1, 1, 1, 1,
0.5659092, 1.047337, 2.027095, 0, 0, 1, 1, 1,
0.5722932, 0.2854785, 0.9837363, 1, 0, 0, 1, 1,
0.5808523, -1.264558, 1.611575, 1, 0, 0, 1, 1,
0.5810398, -0.8501893, 3.385185, 1, 0, 0, 1, 1,
0.5895119, 0.08797517, 1.015874, 1, 0, 0, 1, 1,
0.5930201, -0.3410648, 0.2506059, 1, 0, 0, 1, 1,
0.6004416, -0.9161556, 4.053899, 0, 0, 0, 1, 1,
0.6059004, -1.234795, 3.393193, 0, 0, 0, 1, 1,
0.6081784, -0.9434001, 2.744305, 0, 0, 0, 1, 1,
0.6093976, -0.5293846, 2.703138, 0, 0, 0, 1, 1,
0.6097929, -1.222317, 2.91397, 0, 0, 0, 1, 1,
0.6116923, 0.1350508, 1.681272, 0, 0, 0, 1, 1,
0.6141846, 0.8161999, 1.238674, 0, 0, 0, 1, 1,
0.6187772, -0.4289264, 1.886558, 1, 1, 1, 1, 1,
0.6188847, 0.2070411, 0.328356, 1, 1, 1, 1, 1,
0.6196544, 1.683287, -1.395057, 1, 1, 1, 1, 1,
0.6262679, 0.1168529, -0.04008125, 1, 1, 1, 1, 1,
0.628079, -0.3849435, 3.459375, 1, 1, 1, 1, 1,
0.6283281, 0.9762431, 0.1510507, 1, 1, 1, 1, 1,
0.6361314, 0.8969918, 1.507491, 1, 1, 1, 1, 1,
0.6363026, 0.1657056, 1.14263, 1, 1, 1, 1, 1,
0.6398325, 0.2769084, -0.2282702, 1, 1, 1, 1, 1,
0.6424695, -0.4101799, 2.682062, 1, 1, 1, 1, 1,
0.6446953, 0.978065, 0.04968022, 1, 1, 1, 1, 1,
0.6480729, 0.660751, 2.186254, 1, 1, 1, 1, 1,
0.6494439, 1.380675, 0.02470945, 1, 1, 1, 1, 1,
0.6607389, 0.4503228, 0.3055072, 1, 1, 1, 1, 1,
0.6612844, 0.9637917, 1.166626, 1, 1, 1, 1, 1,
0.6617599, 0.2029178, 2.568679, 0, 0, 1, 1, 1,
0.6663326, -0.09470384, 2.457191, 1, 0, 0, 1, 1,
0.6673576, 0.8007591, 0.7038243, 1, 0, 0, 1, 1,
0.6695901, -0.5228941, 0.519204, 1, 0, 0, 1, 1,
0.6721748, -0.6194027, 1.792548, 1, 0, 0, 1, 1,
0.6737148, -0.91366, -0.2241601, 1, 0, 0, 1, 1,
0.6780764, 0.2619155, 1.112868, 0, 0, 0, 1, 1,
0.6825446, 0.5238169, 0.970232, 0, 0, 0, 1, 1,
0.6901664, -0.2289318, 1.824206, 0, 0, 0, 1, 1,
0.6992292, 0.8737383, 1.910401, 0, 0, 0, 1, 1,
0.7014539, -3.328846, 3.858837, 0, 0, 0, 1, 1,
0.7031757, 0.07108456, 2.214, 0, 0, 0, 1, 1,
0.7073703, 1.048119, 0.6493605, 0, 0, 0, 1, 1,
0.7103576, -0.3799328, 2.806767, 1, 1, 1, 1, 1,
0.7104254, 0.8265498, 0.9125536, 1, 1, 1, 1, 1,
0.7213832, -0.6120468, 2.016181, 1, 1, 1, 1, 1,
0.7228228, 0.9679855, 0.08456756, 1, 1, 1, 1, 1,
0.7239204, -1.149184, 2.538733, 1, 1, 1, 1, 1,
0.7253773, -0.5210946, 2.578146, 1, 1, 1, 1, 1,
0.7275615, 0.468931, 1.200015, 1, 1, 1, 1, 1,
0.7280385, 0.6722981, -0.2285869, 1, 1, 1, 1, 1,
0.7330825, 0.150942, 0.7376856, 1, 1, 1, 1, 1,
0.7359831, 0.3824109, 1.775316, 1, 1, 1, 1, 1,
0.7414306, -0.3289213, 1.92013, 1, 1, 1, 1, 1,
0.7455344, 1.148614, -1.608532, 1, 1, 1, 1, 1,
0.7456763, 1.013941, -0.4894187, 1, 1, 1, 1, 1,
0.7467697, -1.701647, 4.481731, 1, 1, 1, 1, 1,
0.7471859, -1.817861, 1.107596, 1, 1, 1, 1, 1,
0.750765, 0.7239826, -0.9168554, 0, 0, 1, 1, 1,
0.7544908, -1.356069, 3.562221, 1, 0, 0, 1, 1,
0.7586984, -0.8995746, 1.41761, 1, 0, 0, 1, 1,
0.7603976, -1.039084, 1.632238, 1, 0, 0, 1, 1,
0.7621489, 1.280347, 2.25418, 1, 0, 0, 1, 1,
0.7633418, 0.02935395, -0.6981194, 1, 0, 0, 1, 1,
0.763717, 0.4485597, 0.9242781, 0, 0, 0, 1, 1,
0.767843, 0.239908, 2.561141, 0, 0, 0, 1, 1,
0.7684658, -0.6596944, 0.9660882, 0, 0, 0, 1, 1,
0.7694366, 1.596053, 1.52719, 0, 0, 0, 1, 1,
0.772989, -0.6886213, 3.686305, 0, 0, 0, 1, 1,
0.7759832, 0.579932, 2.531273, 0, 0, 0, 1, 1,
0.7833152, -1.423962, 0.6029522, 0, 0, 0, 1, 1,
0.7847158, 1.316467, 0.5036265, 1, 1, 1, 1, 1,
0.785708, 0.08784663, 0.5293267, 1, 1, 1, 1, 1,
0.7857271, 1.362016, -0.3257082, 1, 1, 1, 1, 1,
0.7893609, 0.1490557, -0.06804422, 1, 1, 1, 1, 1,
0.7894506, 0.8280801, 0.4846675, 1, 1, 1, 1, 1,
0.7979642, -0.162446, 1.526889, 1, 1, 1, 1, 1,
0.8015379, 0.7801852, 1.090819, 1, 1, 1, 1, 1,
0.8058725, 0.6131586, 1.520588, 1, 1, 1, 1, 1,
0.8080005, -0.01456846, 2.030239, 1, 1, 1, 1, 1,
0.8109912, 0.5910771, 0.6862898, 1, 1, 1, 1, 1,
0.8272374, -1.911668, 2.435648, 1, 1, 1, 1, 1,
0.827364, -0.1072967, 1.32836, 1, 1, 1, 1, 1,
0.8290353, -0.2748959, 0.1197728, 1, 1, 1, 1, 1,
0.8316941, -1.407909, 3.264189, 1, 1, 1, 1, 1,
0.8343902, -0.2562801, 2.396734, 1, 1, 1, 1, 1,
0.8392258, 0.3295791, 1.524041, 0, 0, 1, 1, 1,
0.8403667, -0.3641744, 3.433108, 1, 0, 0, 1, 1,
0.8409768, 0.4967217, 0.9109302, 1, 0, 0, 1, 1,
0.8411319, 0.213215, 1.93125, 1, 0, 0, 1, 1,
0.8429356, 0.5556597, 0.9009778, 1, 0, 0, 1, 1,
0.8460948, 0.8123556, 1.509774, 1, 0, 0, 1, 1,
0.8528547, 0.8747057, 0.7634563, 0, 0, 0, 1, 1,
0.8669046, 1.020126, 1.29689, 0, 0, 0, 1, 1,
0.8725988, -0.6449535, 1.014895, 0, 0, 0, 1, 1,
0.8733571, -0.3932483, 3.102121, 0, 0, 0, 1, 1,
0.8733773, -0.2405016, 1.000026, 0, 0, 0, 1, 1,
0.8811113, 0.5988465, 0.05592622, 0, 0, 0, 1, 1,
0.8984327, -1.115097, 2.022756, 0, 0, 0, 1, 1,
0.8985667, -0.8956381, 0.8426266, 1, 1, 1, 1, 1,
0.8990898, 0.5331728, 1.628769, 1, 1, 1, 1, 1,
0.912664, -0.8015237, 1.432516, 1, 1, 1, 1, 1,
0.9143463, -1.822621, 1.21849, 1, 1, 1, 1, 1,
0.9200897, 1.500844, 0.5647411, 1, 1, 1, 1, 1,
0.9221109, -0.2323469, 0.8241029, 1, 1, 1, 1, 1,
0.9467681, -0.2274121, 3.133205, 1, 1, 1, 1, 1,
0.9484917, -1.648921, 1.797466, 1, 1, 1, 1, 1,
0.949737, 0.2591777, -0.342431, 1, 1, 1, 1, 1,
0.9498785, -1.417676, 4.370697, 1, 1, 1, 1, 1,
0.9546184, 0.3378365, 0.8675483, 1, 1, 1, 1, 1,
0.9570822, 0.9751553, 2.187785, 1, 1, 1, 1, 1,
0.9585674, 0.8497528, 2.670509, 1, 1, 1, 1, 1,
0.9614506, -0.1365064, 2.311876, 1, 1, 1, 1, 1,
0.9623569, -0.7336358, 1.704553, 1, 1, 1, 1, 1,
0.9672052, -0.6030678, 1.493503, 0, 0, 1, 1, 1,
0.9696046, -0.7190122, 2.920237, 1, 0, 0, 1, 1,
0.9712462, 0.3122186, 0.3180164, 1, 0, 0, 1, 1,
0.9762964, 0.6471678, 1.445019, 1, 0, 0, 1, 1,
0.9769804, -1.364802, 2.526515, 1, 0, 0, 1, 1,
0.9781396, -0.06277144, 0.3246913, 1, 0, 0, 1, 1,
0.9839379, 0.5128404, 0.8614953, 0, 0, 0, 1, 1,
0.983979, -1.109422, 2.936368, 0, 0, 0, 1, 1,
0.9854212, -0.4477252, 0.8110759, 0, 0, 0, 1, 1,
0.9862747, 0.6187668, 1.788505, 0, 0, 0, 1, 1,
0.9879754, 0.333192, 0.9177611, 0, 0, 0, 1, 1,
0.9915884, 0.0849816, 2.8855, 0, 0, 0, 1, 1,
1.00181, 0.04163613, 0.9025776, 0, 0, 0, 1, 1,
1.007395, 0.3285987, 1.695597, 1, 1, 1, 1, 1,
1.009442, -1.369426, 4.282166, 1, 1, 1, 1, 1,
1.010379, 1.455994, 2.198147, 1, 1, 1, 1, 1,
1.014306, -1.454216, 2.601723, 1, 1, 1, 1, 1,
1.015423, -1.188198, 0.7613178, 1, 1, 1, 1, 1,
1.01627, 1.558604, -0.09038013, 1, 1, 1, 1, 1,
1.016322, -1.061965, 3.472407, 1, 1, 1, 1, 1,
1.018551, -0.7003712, 0.7852913, 1, 1, 1, 1, 1,
1.024705, -0.3267697, 4.11011, 1, 1, 1, 1, 1,
1.031345, -2.093887, 2.330736, 1, 1, 1, 1, 1,
1.035131, 1.656414, -0.6240141, 1, 1, 1, 1, 1,
1.03982, -1.488742, 3.236724, 1, 1, 1, 1, 1,
1.054545, -1.222116, 2.729028, 1, 1, 1, 1, 1,
1.058896, 1.135029, -0.08517949, 1, 1, 1, 1, 1,
1.065575, 0.8270086, 1.312783, 1, 1, 1, 1, 1,
1.06606, -0.8468463, 3.146109, 0, 0, 1, 1, 1,
1.078451, -1.62833, 1.40031, 1, 0, 0, 1, 1,
1.080079, -1.002807, 2.553119, 1, 0, 0, 1, 1,
1.1005, 1.480219, 1.06752, 1, 0, 0, 1, 1,
1.106582, 0.4105215, 0.4111696, 1, 0, 0, 1, 1,
1.107075, 0.3194554, 1.214319, 1, 0, 0, 1, 1,
1.110089, 0.3717688, 2.656484, 0, 0, 0, 1, 1,
1.11048, -0.08214985, 2.031771, 0, 0, 0, 1, 1,
1.114597, 1.981456, -1.666064, 0, 0, 0, 1, 1,
1.116345, -0.7544119, 1.616745, 0, 0, 0, 1, 1,
1.121944, -0.3423041, 2.003361, 0, 0, 0, 1, 1,
1.122737, 0.6372241, 1.313971, 0, 0, 0, 1, 1,
1.127534, -0.7282436, 0.9173532, 0, 0, 0, 1, 1,
1.128994, 1.166898, 0.5879489, 1, 1, 1, 1, 1,
1.134565, 0.1706728, 0.5934782, 1, 1, 1, 1, 1,
1.138875, -1.224685, 2.9789, 1, 1, 1, 1, 1,
1.144133, 0.6459337, 0.04911702, 1, 1, 1, 1, 1,
1.145598, -1.090024, 2.296946, 1, 1, 1, 1, 1,
1.146102, -1.686827, 2.317327, 1, 1, 1, 1, 1,
1.149302, -2.433665, 2.935719, 1, 1, 1, 1, 1,
1.154234, -1.197872, 2.969118, 1, 1, 1, 1, 1,
1.156905, -0.1966773, 3.349898, 1, 1, 1, 1, 1,
1.157935, 0.1580496, 1.207885, 1, 1, 1, 1, 1,
1.169979, -0.3462278, 1.466397, 1, 1, 1, 1, 1,
1.19191, -0.275126, 4.286828, 1, 1, 1, 1, 1,
1.194881, 0.9566694, -0.6632921, 1, 1, 1, 1, 1,
1.210979, -0.1779319, 0.5984876, 1, 1, 1, 1, 1,
1.215086, -0.2210477, 0.5526744, 1, 1, 1, 1, 1,
1.216873, 0.2358134, 0.3857829, 0, 0, 1, 1, 1,
1.229494, -1.147256, 2.545908, 1, 0, 0, 1, 1,
1.240801, -0.07283736, 1.57118, 1, 0, 0, 1, 1,
1.251653, -0.07367401, 3.015408, 1, 0, 0, 1, 1,
1.270407, 0.5305225, -0.8607785, 1, 0, 0, 1, 1,
1.275823, -0.4655451, 1.890765, 1, 0, 0, 1, 1,
1.288192, 0.8356985, 2.049332, 0, 0, 0, 1, 1,
1.295543, 1.305304, 1.219002, 0, 0, 0, 1, 1,
1.299688, -1.008576, 0.6040523, 0, 0, 0, 1, 1,
1.30538, -1.146355, 2.387403, 0, 0, 0, 1, 1,
1.322875, 0.1281954, 2.148259, 0, 0, 0, 1, 1,
1.329958, -0.3332974, 2.436972, 0, 0, 0, 1, 1,
1.331139, -0.1087123, 3.982816, 0, 0, 0, 1, 1,
1.333078, -1.227035, 1.910565, 1, 1, 1, 1, 1,
1.333803, -0.1521335, 2.509999, 1, 1, 1, 1, 1,
1.342106, 0.05012157, 0.5789508, 1, 1, 1, 1, 1,
1.351807, -0.1733851, 0.8015273, 1, 1, 1, 1, 1,
1.357716, 0.9437808, -0.7724089, 1, 1, 1, 1, 1,
1.374953, 0.4169798, 1.572652, 1, 1, 1, 1, 1,
1.379662, -0.3298436, 0.6554467, 1, 1, 1, 1, 1,
1.392488, 0.2941451, 1.964513, 1, 1, 1, 1, 1,
1.395082, 1.28973, 0.3025377, 1, 1, 1, 1, 1,
1.396491, -1.214912, 1.478896, 1, 1, 1, 1, 1,
1.407171, 1.427884, 0.7845288, 1, 1, 1, 1, 1,
1.407633, 1.376402, 1.018559, 1, 1, 1, 1, 1,
1.408709, -0.02504034, 2.801142, 1, 1, 1, 1, 1,
1.414349, -0.2973725, 3.48202, 1, 1, 1, 1, 1,
1.416013, -0.1225368, 2.67547, 1, 1, 1, 1, 1,
1.417346, 1.688745, 1.427811, 0, 0, 1, 1, 1,
1.420952, 2.223165, 2.408079, 1, 0, 0, 1, 1,
1.429241, -0.547038, 0.8939901, 1, 0, 0, 1, 1,
1.433522, 1.129861, -0.7534997, 1, 0, 0, 1, 1,
1.444561, -0.6380806, 2.523676, 1, 0, 0, 1, 1,
1.445802, -1.41098, 2.260122, 1, 0, 0, 1, 1,
1.447014, 1.051424, 1.970202, 0, 0, 0, 1, 1,
1.451747, 1.064181, -0.3527552, 0, 0, 0, 1, 1,
1.455129, 1.410339, -0.8334956, 0, 0, 0, 1, 1,
1.463825, 2.267855, 0.3989317, 0, 0, 0, 1, 1,
1.465717, -1.642813, 4.080996, 0, 0, 0, 1, 1,
1.467981, -1.168231, 1.192611, 0, 0, 0, 1, 1,
1.469414, -0.7402659, 2.769102, 0, 0, 0, 1, 1,
1.477514, 0.5645596, 1.656083, 1, 1, 1, 1, 1,
1.4796, 1.89529, 0.8471805, 1, 1, 1, 1, 1,
1.481871, -0.9738821, 3.298278, 1, 1, 1, 1, 1,
1.486203, 0.2932545, 1.005504, 1, 1, 1, 1, 1,
1.492825, 1.027294, 1.043965, 1, 1, 1, 1, 1,
1.49728, 0.3661384, 1.755236, 1, 1, 1, 1, 1,
1.5011, -2.209873, 2.179035, 1, 1, 1, 1, 1,
1.53132, 0.5615261, 1.633225, 1, 1, 1, 1, 1,
1.531337, -0.55073, 2.515396, 1, 1, 1, 1, 1,
1.532112, -0.2852874, 1.034008, 1, 1, 1, 1, 1,
1.541189, -1.75203, 1.467485, 1, 1, 1, 1, 1,
1.552331, -0.5051598, 3.084282, 1, 1, 1, 1, 1,
1.552793, -0.260408, 0.2117573, 1, 1, 1, 1, 1,
1.557162, 1.568953, 0.03677963, 1, 1, 1, 1, 1,
1.562304, -0.3587363, 1.821813, 1, 1, 1, 1, 1,
1.5666, 0.5424293, 1.857401, 0, 0, 1, 1, 1,
1.567142, -1.96652, 3.273662, 1, 0, 0, 1, 1,
1.578163, -2.159649, 2.95623, 1, 0, 0, 1, 1,
1.578195, 0.6581641, 2.3884, 1, 0, 0, 1, 1,
1.602113, 0.9754639, 1.415283, 1, 0, 0, 1, 1,
1.634265, 0.4171731, 2.057393, 1, 0, 0, 1, 1,
1.639206, -0.1740738, 0.8020761, 0, 0, 0, 1, 1,
1.648021, -0.6767042, 1.545972, 0, 0, 0, 1, 1,
1.681558, 0.775472, 1.72469, 0, 0, 0, 1, 1,
1.71788, 0.4453999, 1.261091, 0, 0, 0, 1, 1,
1.71814, -2.014546, 2.376862, 0, 0, 0, 1, 1,
1.742604, 0.9304626, -0.1442006, 0, 0, 0, 1, 1,
1.785538, -0.6370905, 1.209584, 0, 0, 0, 1, 1,
1.819834, 0.2422047, 1.41349, 1, 1, 1, 1, 1,
1.821042, 1.13299, 0.1452111, 1, 1, 1, 1, 1,
1.840627, -0.1156922, 2.450724, 1, 1, 1, 1, 1,
1.846114, 0.4494846, 0.9105021, 1, 1, 1, 1, 1,
1.861114, -0.7997681, 0.1310366, 1, 1, 1, 1, 1,
1.884923, -1.137746, 2.295244, 1, 1, 1, 1, 1,
1.893485, -2.095083, 2.079911, 1, 1, 1, 1, 1,
1.895362, 1.134254, 0.07926522, 1, 1, 1, 1, 1,
1.971563, 1.892253, 0.3902476, 1, 1, 1, 1, 1,
1.999797, -1.727743, 2.62927, 1, 1, 1, 1, 1,
2.01238, 0.5201253, 0.8900052, 1, 1, 1, 1, 1,
2.018738, 0.7263173, 2.987875, 1, 1, 1, 1, 1,
2.03997, -0.08894771, 2.856272, 1, 1, 1, 1, 1,
2.068585, 1.467206, 1.602845, 1, 1, 1, 1, 1,
2.079579, 0.963482, 0.7612122, 1, 1, 1, 1, 1,
2.129182, 1.328132, 0.6905797, 0, 0, 1, 1, 1,
2.153064, 1.290176, 1.031316, 1, 0, 0, 1, 1,
2.171034, -0.4099657, 2.436936, 1, 0, 0, 1, 1,
2.182068, -0.9744198, 2.961095, 1, 0, 0, 1, 1,
2.259484, 1.524631, 2.550333, 1, 0, 0, 1, 1,
2.419958, -0.4042687, 1.645595, 1, 0, 0, 1, 1,
2.508276, -0.7816274, 0.6464131, 0, 0, 0, 1, 1,
2.536158, -0.790134, 0.1708258, 0, 0, 0, 1, 1,
2.593811, -0.3756225, 1.144049, 0, 0, 0, 1, 1,
2.600766, 0.6596301, 1.185428, 0, 0, 0, 1, 1,
2.6277, -0.06954609, 1.70749, 0, 0, 0, 1, 1,
2.768749, -0.541809, 1.86885, 0, 0, 0, 1, 1,
2.782027, 0.04045096, 1.853937, 0, 0, 0, 1, 1,
2.874082, -0.3690976, 1.385843, 1, 1, 1, 1, 1,
2.888868, 0.2015086, 1.011845, 1, 1, 1, 1, 1,
2.929265, 0.8174844, 1.285457, 1, 1, 1, 1, 1,
2.971328, 1.413086, -0.8595533, 1, 1, 1, 1, 1,
2.976612, 0.8342921, 2.183751, 1, 1, 1, 1, 1,
3.028886, 0.7440286, 1.513064, 1, 1, 1, 1, 1,
3.24109, 0.155175, 2.238606, 1, 1, 1, 1, 1
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
var radius = 9.920223;
var distance = 34.84436;
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
mvMatrix.translate( 0.06781983, 0.256073, -0.539434 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.84436);
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
