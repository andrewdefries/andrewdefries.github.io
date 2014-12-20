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
-2.922657, 0.04206399, -0.9912919, 1, 0, 0, 1,
-2.79454, 0.09367356, -2.518951, 1, 0.007843138, 0, 1,
-2.652307, 0.7711634, -1.800637, 1, 0.01176471, 0, 1,
-2.47111, 0.001876976, -2.118281, 1, 0.01960784, 0, 1,
-2.456044, -1.44262, -3.25176, 1, 0.02352941, 0, 1,
-2.421435, 0.05325566, -2.234184, 1, 0.03137255, 0, 1,
-2.407865, -0.191533, -0.193336, 1, 0.03529412, 0, 1,
-2.383631, 1.6905, -1.51254, 1, 0.04313726, 0, 1,
-2.382824, -0.5117519, -2.898088, 1, 0.04705882, 0, 1,
-2.368914, 0.619924, -2.365683, 1, 0.05490196, 0, 1,
-2.335063, 0.2130445, -1.700779, 1, 0.05882353, 0, 1,
-2.331069, 0.9984069, -1.773283, 1, 0.06666667, 0, 1,
-2.285616, 0.7738738, -0.08651888, 1, 0.07058824, 0, 1,
-2.279649, 1.033344, -1.28855, 1, 0.07843138, 0, 1,
-2.205975, -0.3205929, -0.5335269, 1, 0.08235294, 0, 1,
-2.185281, -0.02447076, -1.988896, 1, 0.09019608, 0, 1,
-2.153503, -0.6463022, 0.3266576, 1, 0.09411765, 0, 1,
-2.136662, -0.2016454, -1.366447, 1, 0.1019608, 0, 1,
-2.12462, -0.3397325, -2.369336, 1, 0.1098039, 0, 1,
-2.113271, 1.408766, -0.337991, 1, 0.1137255, 0, 1,
-2.110721, -0.8266349, -1.704658, 1, 0.1215686, 0, 1,
-2.096703, -1.878781, -3.12488, 1, 0.1254902, 0, 1,
-2.094897, -0.007591501, -1.51513, 1, 0.1333333, 0, 1,
-2.083029, 0.9468771, -1.77991, 1, 0.1372549, 0, 1,
-2.047246, -2.964011, -2.097765, 1, 0.145098, 0, 1,
-2.025048, 0.4360462, 1.012196, 1, 0.1490196, 0, 1,
-2.020701, 0.8120835, -2.773767, 1, 0.1568628, 0, 1,
-2.00676, -0.2805482, -0.1331861, 1, 0.1607843, 0, 1,
-1.996047, -0.437676, -0.2683505, 1, 0.1686275, 0, 1,
-1.974104, 1.117413, -1.973646, 1, 0.172549, 0, 1,
-1.96464, 1.452486, -0.3107058, 1, 0.1803922, 0, 1,
-1.963558, 0.2700417, -1.982473, 1, 0.1843137, 0, 1,
-1.937224, -0.1200895, -2.811011, 1, 0.1921569, 0, 1,
-1.929454, -0.5247485, -2.25029, 1, 0.1960784, 0, 1,
-1.919758, -1.349947, -0.9826238, 1, 0.2039216, 0, 1,
-1.911223, -0.3610259, -1.944416, 1, 0.2117647, 0, 1,
-1.906207, -0.8037763, -0.1024372, 1, 0.2156863, 0, 1,
-1.900619, -1.018028, -0.9567489, 1, 0.2235294, 0, 1,
-1.898261, -0.948163, -1.72723, 1, 0.227451, 0, 1,
-1.895429, -0.2579293, -2.167231, 1, 0.2352941, 0, 1,
-1.879146, 1.33532, -0.6120208, 1, 0.2392157, 0, 1,
-1.861788, -2.517924, -2.506487, 1, 0.2470588, 0, 1,
-1.860226, -1.350652, -1.560182, 1, 0.2509804, 0, 1,
-1.855371, 1.693007, 0.3777879, 1, 0.2588235, 0, 1,
-1.851317, 1.377144, -1.022352, 1, 0.2627451, 0, 1,
-1.826818, 0.190021, -1.107891, 1, 0.2705882, 0, 1,
-1.822265, -0.8655739, -0.5392111, 1, 0.2745098, 0, 1,
-1.814511, -0.2652436, 0.06250004, 1, 0.282353, 0, 1,
-1.805733, -0.4839844, -1.805165, 1, 0.2862745, 0, 1,
-1.800434, 1.459228, -1.447811, 1, 0.2941177, 0, 1,
-1.782435, 0.5639319, -0.9363512, 1, 0.3019608, 0, 1,
-1.775981, 0.4536004, -2.055135, 1, 0.3058824, 0, 1,
-1.775225, -0.9129674, -1.202673, 1, 0.3137255, 0, 1,
-1.770903, -0.03058909, -2.47433, 1, 0.3176471, 0, 1,
-1.769494, -0.09890019, -0.6778747, 1, 0.3254902, 0, 1,
-1.742084, 0.5751277, -1.824152, 1, 0.3294118, 0, 1,
-1.741137, -0.3317685, -0.2219018, 1, 0.3372549, 0, 1,
-1.734276, -0.3539179, -1.370488, 1, 0.3411765, 0, 1,
-1.709892, 1.322668, -1.946235, 1, 0.3490196, 0, 1,
-1.707754, -0.8091508, -4.662333, 1, 0.3529412, 0, 1,
-1.680188, 1.066065, -1.980449, 1, 0.3607843, 0, 1,
-1.678512, 0.589981, -0.5053883, 1, 0.3647059, 0, 1,
-1.67143, -1.156091, -2.096529, 1, 0.372549, 0, 1,
-1.667132, -0.2844839, -0.8169347, 1, 0.3764706, 0, 1,
-1.666809, -0.3321127, -2.241697, 1, 0.3843137, 0, 1,
-1.665165, 0.6549193, -2.233936, 1, 0.3882353, 0, 1,
-1.660097, 0.492887, -1.617866, 1, 0.3960784, 0, 1,
-1.639312, 1.157632, -1.454682, 1, 0.4039216, 0, 1,
-1.63431, -0.06921653, -1.335852, 1, 0.4078431, 0, 1,
-1.632824, -0.1607308, -4.035041, 1, 0.4156863, 0, 1,
-1.63137, 0.04042353, -2.607814, 1, 0.4196078, 0, 1,
-1.614768, -0.535403, -1.372365, 1, 0.427451, 0, 1,
-1.614195, 0.5151658, -1.902663, 1, 0.4313726, 0, 1,
-1.613674, -0.7655155, -0.09825558, 1, 0.4392157, 0, 1,
-1.611828, -0.2120533, -2.464208, 1, 0.4431373, 0, 1,
-1.606924, 0.5132899, -2.951468, 1, 0.4509804, 0, 1,
-1.602192, -1.545751, -0.0557826, 1, 0.454902, 0, 1,
-1.57904, 0.5119597, -0.894805, 1, 0.4627451, 0, 1,
-1.57488, -0.1901468, -2.235272, 1, 0.4666667, 0, 1,
-1.561158, -0.2805596, -1.658066, 1, 0.4745098, 0, 1,
-1.552727, -1.269961, -3.548741, 1, 0.4784314, 0, 1,
-1.551371, 0.927698, -2.113927, 1, 0.4862745, 0, 1,
-1.539582, -0.5435697, -0.659476, 1, 0.4901961, 0, 1,
-1.514974, -0.07035693, -2.360016, 1, 0.4980392, 0, 1,
-1.512923, -0.2773215, -2.389982, 1, 0.5058824, 0, 1,
-1.509088, 0.5528464, 0.4502276, 1, 0.509804, 0, 1,
-1.496316, 0.9319179, -3.060486, 1, 0.5176471, 0, 1,
-1.494743, -1.555575, -3.556813, 1, 0.5215687, 0, 1,
-1.492361, -0.1248903, -0.6133046, 1, 0.5294118, 0, 1,
-1.486596, 0.09447706, -1.208138, 1, 0.5333334, 0, 1,
-1.482803, 0.8602242, -1.019403, 1, 0.5411765, 0, 1,
-1.480084, 0.3738234, -1.414702, 1, 0.5450981, 0, 1,
-1.465437, 2.045756, -0.2444633, 1, 0.5529412, 0, 1,
-1.464888, -0.08679238, -2.246851, 1, 0.5568628, 0, 1,
-1.459592, 0.06777193, -0.7525489, 1, 0.5647059, 0, 1,
-1.459466, -1.308307, -3.363205, 1, 0.5686275, 0, 1,
-1.456785, -2.16016, -2.95681, 1, 0.5764706, 0, 1,
-1.44751, -0.4503808, -2.917452, 1, 0.5803922, 0, 1,
-1.4409, 0.1645995, -2.242561, 1, 0.5882353, 0, 1,
-1.436106, -1.394677, -3.37476, 1, 0.5921569, 0, 1,
-1.429152, 0.3038936, -1.318984, 1, 0.6, 0, 1,
-1.427646, -0.5291283, -0.8367812, 1, 0.6078432, 0, 1,
-1.422769, 0.9433405, -0.9449433, 1, 0.6117647, 0, 1,
-1.422423, -0.673251, -2.87835, 1, 0.6196079, 0, 1,
-1.419758, -0.183826, -2.194507, 1, 0.6235294, 0, 1,
-1.419022, -0.1444065, -2.164815, 1, 0.6313726, 0, 1,
-1.413203, 0.555871, -1.065669, 1, 0.6352941, 0, 1,
-1.397431, -0.4634651, -2.936445, 1, 0.6431373, 0, 1,
-1.39677, 0.1554116, -0.9449203, 1, 0.6470588, 0, 1,
-1.390597, -1.409026, -0.9175425, 1, 0.654902, 0, 1,
-1.381717, 0.07558166, -1.420623, 1, 0.6588235, 0, 1,
-1.379921, -2.249095, -3.999988, 1, 0.6666667, 0, 1,
-1.354663, -0.03472946, -1.189429, 1, 0.6705883, 0, 1,
-1.350888, -1.615701, -1.478537, 1, 0.6784314, 0, 1,
-1.346634, -1.052594, -2.013557, 1, 0.682353, 0, 1,
-1.33891, 0.2406581, -0.4395359, 1, 0.6901961, 0, 1,
-1.337515, 0.3895074, -1.900724, 1, 0.6941177, 0, 1,
-1.332821, 1.654675, -1.439753, 1, 0.7019608, 0, 1,
-1.32819, -0.9341976, -3.144811, 1, 0.7098039, 0, 1,
-1.327559, -1.610884, -1.732255, 1, 0.7137255, 0, 1,
-1.327291, -0.3474301, -0.8816388, 1, 0.7215686, 0, 1,
-1.324741, -0.7703828, -2.438106, 1, 0.7254902, 0, 1,
-1.323377, 0.8419172, -2.676686, 1, 0.7333333, 0, 1,
-1.315238, -0.1104006, -2.189415, 1, 0.7372549, 0, 1,
-1.314959, 0.374567, -2.106133, 1, 0.7450981, 0, 1,
-1.301818, 1.294641, -0.932324, 1, 0.7490196, 0, 1,
-1.299999, -0.6488017, -1.776308, 1, 0.7568628, 0, 1,
-1.292662, -0.1654286, -3.051174, 1, 0.7607843, 0, 1,
-1.273449, -1.811492, -3.430968, 1, 0.7686275, 0, 1,
-1.272759, 1.893579, 0.9185244, 1, 0.772549, 0, 1,
-1.26613, 0.2686519, -1.727774, 1, 0.7803922, 0, 1,
-1.26459, 1.405067, -0.9695336, 1, 0.7843137, 0, 1,
-1.258612, 0.4050037, -3.516881, 1, 0.7921569, 0, 1,
-1.25013, 1.285425, -1.109103, 1, 0.7960784, 0, 1,
-1.244693, 2.034899, 0.505522, 1, 0.8039216, 0, 1,
-1.237232, -0.0009346379, 0.09470232, 1, 0.8117647, 0, 1,
-1.231569, 1.410785, -2.057974, 1, 0.8156863, 0, 1,
-1.220151, 0.418629, -1.788766, 1, 0.8235294, 0, 1,
-1.205571, -0.09359132, 0.01009969, 1, 0.827451, 0, 1,
-1.202633, 0.3585849, -0.4189226, 1, 0.8352941, 0, 1,
-1.197455, -0.1295648, 0.755554, 1, 0.8392157, 0, 1,
-1.196822, -0.3683467, -0.357018, 1, 0.8470588, 0, 1,
-1.196784, -0.8050561, -1.460489, 1, 0.8509804, 0, 1,
-1.186169, 0.4993578, -1.471064, 1, 0.8588235, 0, 1,
-1.182797, -1.064612, -1.360709, 1, 0.8627451, 0, 1,
-1.171554, -2.562703, -1.920512, 1, 0.8705882, 0, 1,
-1.171461, 1.391392, 0.28357, 1, 0.8745098, 0, 1,
-1.165718, -0.5666625, -2.000098, 1, 0.8823529, 0, 1,
-1.162308, 1.246877, -1.469608, 1, 0.8862745, 0, 1,
-1.152136, 0.4437657, -1.912433, 1, 0.8941177, 0, 1,
-1.150407, 0.8087012, -0.7679467, 1, 0.8980392, 0, 1,
-1.138817, 1.927742, -1.444197, 1, 0.9058824, 0, 1,
-1.126623, 0.7313401, -1.265356, 1, 0.9137255, 0, 1,
-1.121534, -0.7722627, -0.1071773, 1, 0.9176471, 0, 1,
-1.117408, -1.478143, -1.974165, 1, 0.9254902, 0, 1,
-1.109703, 1.01421, -0.8873699, 1, 0.9294118, 0, 1,
-1.10564, -0.4894914, -2.615701, 1, 0.9372549, 0, 1,
-1.091548, 0.2874462, -0.5194982, 1, 0.9411765, 0, 1,
-1.087216, 0.1544867, -0.5191634, 1, 0.9490196, 0, 1,
-1.079426, 0.5048995, -1.413274, 1, 0.9529412, 0, 1,
-1.073101, 0.4529664, -2.947602, 1, 0.9607843, 0, 1,
-1.061182, -0.7009585, -2.379266, 1, 0.9647059, 0, 1,
-1.058491, 1.373836, -1.316576, 1, 0.972549, 0, 1,
-1.046148, 1.949173, -0.1305056, 1, 0.9764706, 0, 1,
-1.045496, -1.796565, -2.052886, 1, 0.9843137, 0, 1,
-1.032903, 1.713403, 0.8914546, 1, 0.9882353, 0, 1,
-1.031784, 1.226526, -1.459879, 1, 0.9960784, 0, 1,
-1.031411, 0.09488967, -1.493502, 0.9960784, 1, 0, 1,
-1.025746, -0.6726425, -1.13377, 0.9921569, 1, 0, 1,
-1.021447, 0.3291636, -2.652486, 0.9843137, 1, 0, 1,
-1.019711, 0.9362361, -0.07007448, 0.9803922, 1, 0, 1,
-1.011787, -0.9108213, -2.609108, 0.972549, 1, 0, 1,
-1.010929, 0.08151682, -1.989977, 0.9686275, 1, 0, 1,
-1.010256, 0.3237641, 0.08878964, 0.9607843, 1, 0, 1,
-1.010131, 0.1837154, -2.452349, 0.9568627, 1, 0, 1,
-0.9801796, -1.164538, -2.447817, 0.9490196, 1, 0, 1,
-0.97912, -0.6289588, -2.649847, 0.945098, 1, 0, 1,
-0.9773546, 0.301099, 0.4917005, 0.9372549, 1, 0, 1,
-0.9752591, -0.1847547, -1.386235, 0.9333333, 1, 0, 1,
-0.9709749, 0.007804375, -1.081757, 0.9254902, 1, 0, 1,
-0.9687499, -0.01274724, -2.158881, 0.9215686, 1, 0, 1,
-0.965205, 0.1769056, -0.2837547, 0.9137255, 1, 0, 1,
-0.9627731, 0.5341272, -3.230286, 0.9098039, 1, 0, 1,
-0.9513951, -1.381613, -2.283154, 0.9019608, 1, 0, 1,
-0.9460279, 1.630437, 0.14354, 0.8941177, 1, 0, 1,
-0.9419477, -2.226285, -3.652037, 0.8901961, 1, 0, 1,
-0.9408534, -1.31447, -1.20156, 0.8823529, 1, 0, 1,
-0.9401419, -0.1258074, 0.08554672, 0.8784314, 1, 0, 1,
-0.9372048, -0.2371045, -1.242182, 0.8705882, 1, 0, 1,
-0.9321945, -0.1181832, -0.5426331, 0.8666667, 1, 0, 1,
-0.930543, 0.2912665, -0.3874918, 0.8588235, 1, 0, 1,
-0.92736, -0.3797661, -3.317708, 0.854902, 1, 0, 1,
-0.9174815, -0.8917776, -1.175654, 0.8470588, 1, 0, 1,
-0.9160811, 0.3648279, -1.877009, 0.8431373, 1, 0, 1,
-0.9119903, 0.8035966, -0.8963791, 0.8352941, 1, 0, 1,
-0.9119012, -0.1106407, -2.262927, 0.8313726, 1, 0, 1,
-0.9096099, -0.675658, -3.13855, 0.8235294, 1, 0, 1,
-0.9093724, 2.083402, 0.5089452, 0.8196079, 1, 0, 1,
-0.9092575, -0.6741861, -2.36263, 0.8117647, 1, 0, 1,
-0.9044796, -0.1006963, -1.725032, 0.8078431, 1, 0, 1,
-0.9008619, 0.8358021, -1.95972, 0.8, 1, 0, 1,
-0.8919895, -1.592093, -3.172145, 0.7921569, 1, 0, 1,
-0.8874822, -0.3193351, -2.306596, 0.7882353, 1, 0, 1,
-0.8868781, 1.139733, 0.553142, 0.7803922, 1, 0, 1,
-0.8868147, -1.141018, -1.444699, 0.7764706, 1, 0, 1,
-0.881355, 2.563616, -1.15004, 0.7686275, 1, 0, 1,
-0.8768638, -0.5864401, -5.238183, 0.7647059, 1, 0, 1,
-0.8737113, 0.08202016, -2.887255, 0.7568628, 1, 0, 1,
-0.8730163, -0.7549779, -2.938249, 0.7529412, 1, 0, 1,
-0.8727172, -0.5308628, -1.163201, 0.7450981, 1, 0, 1,
-0.8712274, 0.9949132, -0.06960505, 0.7411765, 1, 0, 1,
-0.8687134, 0.5879566, -1.490259, 0.7333333, 1, 0, 1,
-0.8672223, -0.01698318, -2.222843, 0.7294118, 1, 0, 1,
-0.8669312, -1.27458, -2.088025, 0.7215686, 1, 0, 1,
-0.8652612, 0.5655708, 0.3058277, 0.7176471, 1, 0, 1,
-0.8614929, 0.7502093, -1.787571, 0.7098039, 1, 0, 1,
-0.8609178, 0.3838637, -0.4361131, 0.7058824, 1, 0, 1,
-0.858473, 0.7964588, -3.259333, 0.6980392, 1, 0, 1,
-0.8532228, -0.2887346, -3.860099, 0.6901961, 1, 0, 1,
-0.8470471, -1.492065, -2.495757, 0.6862745, 1, 0, 1,
-0.8324305, 0.2729943, 0.2426176, 0.6784314, 1, 0, 1,
-0.8295067, 0.370906, -0.6240293, 0.6745098, 1, 0, 1,
-0.8261693, 0.7862749, 0.206544, 0.6666667, 1, 0, 1,
-0.8227512, 0.3538021, -1.895576, 0.6627451, 1, 0, 1,
-0.8225786, 0.4875548, -2.066865, 0.654902, 1, 0, 1,
-0.8173026, 0.944302, -1.988827, 0.6509804, 1, 0, 1,
-0.8137006, -1.135018, -3.692642, 0.6431373, 1, 0, 1,
-0.8008235, -0.2080169, -3.533272, 0.6392157, 1, 0, 1,
-0.7964514, -1.342548, -1.935068, 0.6313726, 1, 0, 1,
-0.7848411, -1.381837, -3.244062, 0.627451, 1, 0, 1,
-0.7825587, -0.6810929, -2.375142, 0.6196079, 1, 0, 1,
-0.7695668, 1.880897, -0.8395104, 0.6156863, 1, 0, 1,
-0.7666118, -0.6947599, -1.677516, 0.6078432, 1, 0, 1,
-0.7513593, 1.512686, -0.7865908, 0.6039216, 1, 0, 1,
-0.7512093, 0.6147373, -1.059304, 0.5960785, 1, 0, 1,
-0.748971, 0.7890898, -1.282409, 0.5882353, 1, 0, 1,
-0.7412285, 1.775228, -0.6690609, 0.5843138, 1, 0, 1,
-0.7409744, -1.137092, -2.540745, 0.5764706, 1, 0, 1,
-0.7351516, 0.8283248, -0.3100306, 0.572549, 1, 0, 1,
-0.7316747, -0.5331319, -2.855486, 0.5647059, 1, 0, 1,
-0.7293532, 0.9651958, -1.109294, 0.5607843, 1, 0, 1,
-0.7186233, -0.5387104, -2.43857, 0.5529412, 1, 0, 1,
-0.714434, 1.044482, 0.163539, 0.5490196, 1, 0, 1,
-0.7138337, -0.3257109, -2.574258, 0.5411765, 1, 0, 1,
-0.7134435, -0.39035, -2.467848, 0.5372549, 1, 0, 1,
-0.7098015, 1.184643, -0.9341923, 0.5294118, 1, 0, 1,
-0.706355, 0.4523771, -2.692619, 0.5254902, 1, 0, 1,
-0.7040113, -0.4034638, -1.965628, 0.5176471, 1, 0, 1,
-0.7034398, 1.085047, -1.702312, 0.5137255, 1, 0, 1,
-0.7009521, 2.468864, 0.05886753, 0.5058824, 1, 0, 1,
-0.6994544, -0.8608044, -1.570851, 0.5019608, 1, 0, 1,
-0.6986379, -1.3323, -2.152889, 0.4941176, 1, 0, 1,
-0.6817049, 0.9691455, 0.7662757, 0.4862745, 1, 0, 1,
-0.681626, 0.718033, -0.4301692, 0.4823529, 1, 0, 1,
-0.6815203, -0.8436104, -2.055116, 0.4745098, 1, 0, 1,
-0.68081, -0.2390521, -0.7710523, 0.4705882, 1, 0, 1,
-0.6807252, -2.149481, -1.486616, 0.4627451, 1, 0, 1,
-0.6757063, -0.1661626, -1.73208, 0.4588235, 1, 0, 1,
-0.6715494, 1.050803, -0.4678526, 0.4509804, 1, 0, 1,
-0.6698189, -0.9053272, -2.248304, 0.4470588, 1, 0, 1,
-0.6665652, 0.6550554, -0.8438451, 0.4392157, 1, 0, 1,
-0.6633477, 0.7873461, 0.6297703, 0.4352941, 1, 0, 1,
-0.657446, 0.7983705, -0.363633, 0.427451, 1, 0, 1,
-0.6565188, 1.448469, -0.151719, 0.4235294, 1, 0, 1,
-0.6493585, 0.02407151, -1.960899, 0.4156863, 1, 0, 1,
-0.6433226, 0.4056321, -0.6787223, 0.4117647, 1, 0, 1,
-0.6374971, 0.6540332, -1.405987, 0.4039216, 1, 0, 1,
-0.6335014, -0.969936, -0.5506253, 0.3960784, 1, 0, 1,
-0.6326528, 0.7207001, -0.6633834, 0.3921569, 1, 0, 1,
-0.6303149, -0.4543806, -2.876277, 0.3843137, 1, 0, 1,
-0.6276768, 0.6664255, -1.339949, 0.3803922, 1, 0, 1,
-0.6248769, 0.496478, -1.402821, 0.372549, 1, 0, 1,
-0.6218807, 0.5852447, -3.439166, 0.3686275, 1, 0, 1,
-0.621532, -0.5577743, -3.441502, 0.3607843, 1, 0, 1,
-0.6210645, 0.3073356, -1.965961, 0.3568628, 1, 0, 1,
-0.6203649, 0.1663896, -2.085785, 0.3490196, 1, 0, 1,
-0.6190567, -1.35912, -2.50007, 0.345098, 1, 0, 1,
-0.6115422, 0.01855531, -2.149688, 0.3372549, 1, 0, 1,
-0.6040267, -0.283506, -2.555801, 0.3333333, 1, 0, 1,
-0.6025586, -0.648528, -1.653865, 0.3254902, 1, 0, 1,
-0.6021968, -0.5238731, -1.78864, 0.3215686, 1, 0, 1,
-0.5949299, -0.3855276, -2.480293, 0.3137255, 1, 0, 1,
-0.5929706, 0.6863611, -1.007711, 0.3098039, 1, 0, 1,
-0.5884312, 0.1127005, -0.7776668, 0.3019608, 1, 0, 1,
-0.5879, -2.136071, -2.92357, 0.2941177, 1, 0, 1,
-0.5849227, -0.5090067, -2.8155, 0.2901961, 1, 0, 1,
-0.5838164, 1.12894, 0.2627869, 0.282353, 1, 0, 1,
-0.5832022, 1.514612, -0.9465799, 0.2784314, 1, 0, 1,
-0.5775118, 1.049353, -0.6150943, 0.2705882, 1, 0, 1,
-0.5737815, -0.4315612, -3.384382, 0.2666667, 1, 0, 1,
-0.5716506, 0.06356454, -0.4712934, 0.2588235, 1, 0, 1,
-0.570716, 0.8101432, -0.3612031, 0.254902, 1, 0, 1,
-0.5678234, -0.719548, -2.361569, 0.2470588, 1, 0, 1,
-0.5640915, 0.3998657, -0.5305315, 0.2431373, 1, 0, 1,
-0.5610263, -0.136046, -1.615108, 0.2352941, 1, 0, 1,
-0.5610055, -0.596813, -0.7138968, 0.2313726, 1, 0, 1,
-0.5598758, 1.517038, -1.181228, 0.2235294, 1, 0, 1,
-0.5583228, -0.23905, -2.056755, 0.2196078, 1, 0, 1,
-0.5569553, -2.164325, -4.037268, 0.2117647, 1, 0, 1,
-0.5496494, 0.6281987, 0.2920232, 0.2078431, 1, 0, 1,
-0.5488749, -2.290272, -2.442785, 0.2, 1, 0, 1,
-0.5435809, 0.4115957, -0.3878664, 0.1921569, 1, 0, 1,
-0.5427381, -1.570947, -2.707518, 0.1882353, 1, 0, 1,
-0.5308015, -1.12436, -1.660127, 0.1803922, 1, 0, 1,
-0.5302236, -0.9681718, -2.028244, 0.1764706, 1, 0, 1,
-0.52749, 1.926457, -0.769537, 0.1686275, 1, 0, 1,
-0.5273623, 2.72434, 0.5282751, 0.1647059, 1, 0, 1,
-0.5266482, 2.746073, -0.1478917, 0.1568628, 1, 0, 1,
-0.524774, -0.2429266, -2.827332, 0.1529412, 1, 0, 1,
-0.5232897, 0.7340297, -1.028106, 0.145098, 1, 0, 1,
-0.5217845, 0.3416261, -0.04630748, 0.1411765, 1, 0, 1,
-0.5200735, 0.2203532, -1.674977, 0.1333333, 1, 0, 1,
-0.5190151, -0.3689387, -3.088895, 0.1294118, 1, 0, 1,
-0.5184921, 0.3781583, -1.127396, 0.1215686, 1, 0, 1,
-0.5139536, -1.517941, -4.472332, 0.1176471, 1, 0, 1,
-0.50837, 0.654655, -0.3437108, 0.1098039, 1, 0, 1,
-0.5010703, 0.151183, 0.6902122, 0.1058824, 1, 0, 1,
-0.4993769, 1.142953, 0.4949552, 0.09803922, 1, 0, 1,
-0.4978037, 0.7477192, -0.379412, 0.09019608, 1, 0, 1,
-0.4956039, -0.4551749, -3.255886, 0.08627451, 1, 0, 1,
-0.4928204, -0.1425413, -1.108268, 0.07843138, 1, 0, 1,
-0.4915067, 0.4350856, -0.5226219, 0.07450981, 1, 0, 1,
-0.490198, -0.2914763, -2.636124, 0.06666667, 1, 0, 1,
-0.4880445, 0.858041, -0.6671559, 0.0627451, 1, 0, 1,
-0.4839157, -0.1265653, -2.03165, 0.05490196, 1, 0, 1,
-0.479351, 0.6387053, -0.8485926, 0.05098039, 1, 0, 1,
-0.4709529, 0.04518609, -2.01075, 0.04313726, 1, 0, 1,
-0.4693069, 0.648812, 0.4794804, 0.03921569, 1, 0, 1,
-0.4683037, 0.1613036, -1.517449, 0.03137255, 1, 0, 1,
-0.4625858, 0.8002348, -0.7043391, 0.02745098, 1, 0, 1,
-0.4602618, 0.9728026, -0.56522, 0.01960784, 1, 0, 1,
-0.4579767, -0.5289509, -2.805896, 0.01568628, 1, 0, 1,
-0.4574382, 1.79282, -0.9677747, 0.007843138, 1, 0, 1,
-0.4560793, -0.06222836, -1.313516, 0.003921569, 1, 0, 1,
-0.4511236, -2.897992, -3.154054, 0, 1, 0.003921569, 1,
-0.44902, 0.2695132, -1.428839, 0, 1, 0.01176471, 1,
-0.4385537, 0.7116933, -0.3555343, 0, 1, 0.01568628, 1,
-0.4352505, -0.565552, 0.3658996, 0, 1, 0.02352941, 1,
-0.4335217, -0.487856, -1.955485, 0, 1, 0.02745098, 1,
-0.4299406, 1.413267, 1.012886, 0, 1, 0.03529412, 1,
-0.4257991, -0.1485859, -0.7815443, 0, 1, 0.03921569, 1,
-0.4250349, -0.3019121, -2.192951, 0, 1, 0.04705882, 1,
-0.4211138, -0.1227382, -1.707228, 0, 1, 0.05098039, 1,
-0.4161001, -0.4053019, -1.450933, 0, 1, 0.05882353, 1,
-0.4047546, 2.04065, -0.4162112, 0, 1, 0.0627451, 1,
-0.4031945, -0.5337145, -2.305018, 0, 1, 0.07058824, 1,
-0.4020135, 0.2490721, -1.527734, 0, 1, 0.07450981, 1,
-0.4012037, 0.2840761, -0.9112915, 0, 1, 0.08235294, 1,
-0.3996802, 0.2766983, 0.8401939, 0, 1, 0.08627451, 1,
-0.398035, -1.601681, -2.254473, 0, 1, 0.09411765, 1,
-0.3979706, 1.444057, -1.371809, 0, 1, 0.1019608, 1,
-0.3959424, 1.83727, 1.25198, 0, 1, 0.1058824, 1,
-0.3887787, -0.8403745, -3.43743, 0, 1, 0.1137255, 1,
-0.3876831, 1.154653, 0.09517987, 0, 1, 0.1176471, 1,
-0.3876214, 0.6867694, -1.310421, 0, 1, 0.1254902, 1,
-0.3835516, -0.0293803, -3.604699, 0, 1, 0.1294118, 1,
-0.3834058, -0.8770921, -2.601619, 0, 1, 0.1372549, 1,
-0.3820421, 1.076779, -0.6052122, 0, 1, 0.1411765, 1,
-0.381938, -1.564549, -1.772128, 0, 1, 0.1490196, 1,
-0.3787994, 0.726805, -1.793865, 0, 1, 0.1529412, 1,
-0.3785205, -1.482149, -4.605536, 0, 1, 0.1607843, 1,
-0.3767641, 0.6752818, 0.3252253, 0, 1, 0.1647059, 1,
-0.3759316, -0.6752771, -4.418948, 0, 1, 0.172549, 1,
-0.3742045, -0.8989738, -1.492719, 0, 1, 0.1764706, 1,
-0.3699238, 1.27706, -1.561976, 0, 1, 0.1843137, 1,
-0.3665032, 2.463606, -0.2252305, 0, 1, 0.1882353, 1,
-0.3626313, 0.7488694, 0.693123, 0, 1, 0.1960784, 1,
-0.3609206, 0.4318707, -1.774776, 0, 1, 0.2039216, 1,
-0.3604254, -0.2267936, -1.11984, 0, 1, 0.2078431, 1,
-0.3587658, 0.1027995, 0.1127521, 0, 1, 0.2156863, 1,
-0.3555345, -1.521053, -1.440609, 0, 1, 0.2196078, 1,
-0.3549873, -2.465766, -4.089736, 0, 1, 0.227451, 1,
-0.3539459, -0.4506025, -1.31507, 0, 1, 0.2313726, 1,
-0.3505784, -0.8647377, -1.690744, 0, 1, 0.2392157, 1,
-0.3502807, 0.7043105, -1.373839, 0, 1, 0.2431373, 1,
-0.3467263, 1.492179, 0.3354867, 0, 1, 0.2509804, 1,
-0.3466675, 0.0135212, -1.96301, 0, 1, 0.254902, 1,
-0.3438511, -0.8223717, -3.137139, 0, 1, 0.2627451, 1,
-0.3432051, -0.05076891, -1.497063, 0, 1, 0.2666667, 1,
-0.33973, -1.259772, -2.598098, 0, 1, 0.2745098, 1,
-0.3374021, 0.6268661, -0.2404616, 0, 1, 0.2784314, 1,
-0.3358024, -0.2501742, -3.11842, 0, 1, 0.2862745, 1,
-0.3315895, -0.3314514, -1.951051, 0, 1, 0.2901961, 1,
-0.3310028, -0.2554451, -2.504751, 0, 1, 0.2980392, 1,
-0.3253754, 0.7808397, 0.8964236, 0, 1, 0.3058824, 1,
-0.3205914, 1.334133, -0.2954534, 0, 1, 0.3098039, 1,
-0.3179336, -0.85396, -1.70258, 0, 1, 0.3176471, 1,
-0.3170299, 1.800375, 0.11528, 0, 1, 0.3215686, 1,
-0.3139504, 0.5165762, 0.1920989, 0, 1, 0.3294118, 1,
-0.3121219, -0.7042643, -3.357433, 0, 1, 0.3333333, 1,
-0.3052517, -0.818826, -3.075898, 0, 1, 0.3411765, 1,
-0.3047592, -1.22697, -2.482194, 0, 1, 0.345098, 1,
-0.3026946, 0.9619192, -0.3198505, 0, 1, 0.3529412, 1,
-0.3019199, 0.3523538, -1.475312, 0, 1, 0.3568628, 1,
-0.2981762, -0.6504164, -2.072119, 0, 1, 0.3647059, 1,
-0.2870698, 0.6314166, 0.1419428, 0, 1, 0.3686275, 1,
-0.2835728, 0.2648006, -0.9262791, 0, 1, 0.3764706, 1,
-0.2812794, 0.4313106, -1.193087, 0, 1, 0.3803922, 1,
-0.2799646, -1.093184, -2.281531, 0, 1, 0.3882353, 1,
-0.2781529, 0.8366271, 0.06402499, 0, 1, 0.3921569, 1,
-0.2741714, 0.6591429, 0.8804417, 0, 1, 0.4, 1,
-0.2732469, -0.07547699, -2.125301, 0, 1, 0.4078431, 1,
-0.2721742, 1.13881, 0.4085272, 0, 1, 0.4117647, 1,
-0.2709727, -0.9971721, -0.3812149, 0, 1, 0.4196078, 1,
-0.2702317, 0.07114408, -2.341816, 0, 1, 0.4235294, 1,
-0.2689179, 0.5025337, 0.4824797, 0, 1, 0.4313726, 1,
-0.268526, -1.074266, -4.010296, 0, 1, 0.4352941, 1,
-0.2669271, 0.5106559, 0.08708533, 0, 1, 0.4431373, 1,
-0.2622808, -0.75914, -3.144848, 0, 1, 0.4470588, 1,
-0.2617844, 0.4386167, 0.5665396, 0, 1, 0.454902, 1,
-0.259551, 0.4060646, -0.7498382, 0, 1, 0.4588235, 1,
-0.2593514, 0.3919674, -0.2226344, 0, 1, 0.4666667, 1,
-0.2589826, -0.7360157, -2.502838, 0, 1, 0.4705882, 1,
-0.2579743, -0.4880145, -2.919922, 0, 1, 0.4784314, 1,
-0.256844, 0.4787965, 0.1211896, 0, 1, 0.4823529, 1,
-0.253275, -1.197393, -4.971407, 0, 1, 0.4901961, 1,
-0.2530861, -0.09636433, -1.984949, 0, 1, 0.4941176, 1,
-0.2525946, 0.277157, 0.02007144, 0, 1, 0.5019608, 1,
-0.2496307, 1.587554, 0.01618243, 0, 1, 0.509804, 1,
-0.2471028, 0.6310592, -0.6666771, 0, 1, 0.5137255, 1,
-0.2469831, -2.046963, -2.999179, 0, 1, 0.5215687, 1,
-0.242596, -0.04295646, -1.391489, 0, 1, 0.5254902, 1,
-0.2424081, -0.8262032, -2.855087, 0, 1, 0.5333334, 1,
-0.2422678, 1.241677, -0.7356883, 0, 1, 0.5372549, 1,
-0.2422538, -0.1806501, -3.005112, 0, 1, 0.5450981, 1,
-0.2417912, 0.9881694, 1.750834, 0, 1, 0.5490196, 1,
-0.2412296, 0.651976, -0.6648117, 0, 1, 0.5568628, 1,
-0.2383342, 1.169129, 1.487214, 0, 1, 0.5607843, 1,
-0.2344075, -0.05371756, -0.4963524, 0, 1, 0.5686275, 1,
-0.2277627, 0.9093889, 1.784698, 0, 1, 0.572549, 1,
-0.2267259, 1.633143, 0.06822533, 0, 1, 0.5803922, 1,
-0.2258766, 1.333129, -0.06611407, 0, 1, 0.5843138, 1,
-0.223529, -0.5994265, -3.845879, 0, 1, 0.5921569, 1,
-0.2185687, 0.5984912, -0.2783712, 0, 1, 0.5960785, 1,
-0.2181263, 0.827767, -0.7728869, 0, 1, 0.6039216, 1,
-0.2158311, -0.1170885, -1.309286, 0, 1, 0.6117647, 1,
-0.2147336, -0.4850823, -0.98122, 0, 1, 0.6156863, 1,
-0.2081467, -2.86679, -4.564406, 0, 1, 0.6235294, 1,
-0.2079891, 0.2836871, 0.3229693, 0, 1, 0.627451, 1,
-0.2055417, 0.2972809, -1.521979, 0, 1, 0.6352941, 1,
-0.203677, 0.0848444, -0.1065214, 0, 1, 0.6392157, 1,
-0.2028379, -0.4592162, -2.494714, 0, 1, 0.6470588, 1,
-0.1957034, -1.029025, -3.093037, 0, 1, 0.6509804, 1,
-0.1850652, 0.5114198, 0.03404004, 0, 1, 0.6588235, 1,
-0.1824727, -1.075336, -2.453652, 0, 1, 0.6627451, 1,
-0.182359, 0.5032647, -0.1816927, 0, 1, 0.6705883, 1,
-0.1773872, 0.2491227, -2.354583, 0, 1, 0.6745098, 1,
-0.1756831, -0.8241833, -2.05804, 0, 1, 0.682353, 1,
-0.1694856, -1.818467, -2.505518, 0, 1, 0.6862745, 1,
-0.1691435, -1.82162, -4.696455, 0, 1, 0.6941177, 1,
-0.1591815, -0.6412618, -3.478213, 0, 1, 0.7019608, 1,
-0.1585632, -0.6528881, -2.290978, 0, 1, 0.7058824, 1,
-0.1570609, -1.579649, -2.513894, 0, 1, 0.7137255, 1,
-0.156862, 0.006889061, -1.152479, 0, 1, 0.7176471, 1,
-0.1564629, 0.09716494, 0.5717588, 0, 1, 0.7254902, 1,
-0.1561818, 0.5128912, 1.04929, 0, 1, 0.7294118, 1,
-0.1540593, 0.5678523, -0.3737678, 0, 1, 0.7372549, 1,
-0.1510176, 1.594421, -0.3314446, 0, 1, 0.7411765, 1,
-0.1480102, 0.9546278, -1.794392, 0, 1, 0.7490196, 1,
-0.1475668, -0.3068368, -2.901382, 0, 1, 0.7529412, 1,
-0.1455387, 2.364692, -0.07983059, 0, 1, 0.7607843, 1,
-0.1418896, 2.178647, 1.370561, 0, 1, 0.7647059, 1,
-0.1417643, -1.05306, -1.559953, 0, 1, 0.772549, 1,
-0.1355221, -0.4750216, -2.873784, 0, 1, 0.7764706, 1,
-0.1253849, 0.243504, -1.397726, 0, 1, 0.7843137, 1,
-0.1224813, 0.5958257, -2.760002, 0, 1, 0.7882353, 1,
-0.1219743, -0.3786252, -2.391443, 0, 1, 0.7960784, 1,
-0.1196018, 1.612926, -0.1334398, 0, 1, 0.8039216, 1,
-0.1159897, -0.8314635, -4.430432, 0, 1, 0.8078431, 1,
-0.1069049, 0.1435004, -0.1971216, 0, 1, 0.8156863, 1,
-0.1045225, -1.187191, -2.838038, 0, 1, 0.8196079, 1,
-0.1002835, 0.8864874, 1.15201, 0, 1, 0.827451, 1,
-0.1001953, 0.4449458, -0.3065652, 0, 1, 0.8313726, 1,
-0.0968539, -1.494146, -2.859548, 0, 1, 0.8392157, 1,
-0.09600981, 2.672472, 1.021891, 0, 1, 0.8431373, 1,
-0.09492302, -0.8166692, -1.948412, 0, 1, 0.8509804, 1,
-0.09393707, -0.4798543, -2.482679, 0, 1, 0.854902, 1,
-0.09057601, -0.2707861, -3.300522, 0, 1, 0.8627451, 1,
-0.09035674, -1.194685, -3.721992, 0, 1, 0.8666667, 1,
-0.08981477, 0.8678132, 0.9847972, 0, 1, 0.8745098, 1,
-0.08880317, -2.278591, -3.564968, 0, 1, 0.8784314, 1,
-0.08638619, 0.1874553, 0.9103445, 0, 1, 0.8862745, 1,
-0.08191258, -0.2574222, -1.934916, 0, 1, 0.8901961, 1,
-0.07943729, 0.4964924, 0.5073781, 0, 1, 0.8980392, 1,
-0.07615202, -0.3218195, -1.530799, 0, 1, 0.9058824, 1,
-0.07354477, -2.100009, -3.482756, 0, 1, 0.9098039, 1,
-0.07222377, 0.6814547, 1.76314, 0, 1, 0.9176471, 1,
-0.07217667, -0.2973611, -2.663572, 0, 1, 0.9215686, 1,
-0.06465627, -0.1420552, -2.682927, 0, 1, 0.9294118, 1,
-0.06127621, 1.830241, -0.523499, 0, 1, 0.9333333, 1,
-0.06047237, -0.4708498, -2.78103, 0, 1, 0.9411765, 1,
-0.05719772, -1.107473, -2.424177, 0, 1, 0.945098, 1,
-0.05430251, -0.1477303, -1.794723, 0, 1, 0.9529412, 1,
-0.05391295, 1.036701, -0.1272201, 0, 1, 0.9568627, 1,
-0.05344801, -0.9982746, -4.890651, 0, 1, 0.9647059, 1,
-0.05297812, 0.006329712, -0.7675588, 0, 1, 0.9686275, 1,
-0.05292044, 0.1285562, 1.068089, 0, 1, 0.9764706, 1,
-0.04376675, -0.6935925, -2.936753, 0, 1, 0.9803922, 1,
-0.04031331, -1.676752, -1.873765, 0, 1, 0.9882353, 1,
-0.03924056, -0.4885694, -2.34615, 0, 1, 0.9921569, 1,
-0.03906199, -0.3392211, -5.037207, 0, 1, 1, 1,
-0.03905141, 0.6557189, 0.5232637, 0, 0.9921569, 1, 1,
-0.03903465, 0.1700795, -1.256616, 0, 0.9882353, 1, 1,
-0.03456566, 0.039843, -0.764863, 0, 0.9803922, 1, 1,
-0.03267008, 0.2437995, 2.219217, 0, 0.9764706, 1, 1,
-0.03264641, -0.2509857, -1.672256, 0, 0.9686275, 1, 1,
-0.02728916, -0.8479039, -3.044936, 0, 0.9647059, 1, 1,
-0.0255592, -0.2014336, -3.09972, 0, 0.9568627, 1, 1,
-0.02184853, 0.6283063, -0.2466515, 0, 0.9529412, 1, 1,
-0.01787874, 0.8564401, -0.2574959, 0, 0.945098, 1, 1,
-0.01752022, 0.5013177, 0.4850304, 0, 0.9411765, 1, 1,
-0.0171539, -1.4096, -2.847325, 0, 0.9333333, 1, 1,
-0.01176462, -1.203654, -1.682831, 0, 0.9294118, 1, 1,
-0.009652921, -0.2823934, -2.737519, 0, 0.9215686, 1, 1,
-0.009313366, 0.6978991, -1.207367, 0, 0.9176471, 1, 1,
-0.004465311, -1.065083, -2.515603, 0, 0.9098039, 1, 1,
0.001001796, -0.01183035, 2.578, 0, 0.9058824, 1, 1,
0.006467076, -0.2323513, 1.938199, 0, 0.8980392, 1, 1,
0.01176904, 0.3369913, -0.6482624, 0, 0.8901961, 1, 1,
0.01282796, 0.6958523, 0.4169699, 0, 0.8862745, 1, 1,
0.01485405, 1.347049, -1.087476, 0, 0.8784314, 1, 1,
0.01581253, -0.7983472, 3.716931, 0, 0.8745098, 1, 1,
0.01593603, 0.1693646, 0.6167127, 0, 0.8666667, 1, 1,
0.01730013, -0.3918831, 4.080658, 0, 0.8627451, 1, 1,
0.02064265, 0.1665964, 0.4302638, 0, 0.854902, 1, 1,
0.0220252, -0.3286387, 3.739984, 0, 0.8509804, 1, 1,
0.02234303, -2.411151, 3.572139, 0, 0.8431373, 1, 1,
0.02973771, 2.015899, 0.5439747, 0, 0.8392157, 1, 1,
0.02982444, 1.329335, -0.2606114, 0, 0.8313726, 1, 1,
0.03502111, -1.792326, 4.038137, 0, 0.827451, 1, 1,
0.04185447, -0.3227664, 2.442812, 0, 0.8196079, 1, 1,
0.04510418, 0.4674788, 0.8856127, 0, 0.8156863, 1, 1,
0.04638101, 1.084898, 1.250536, 0, 0.8078431, 1, 1,
0.05313255, 1.539143, -1.399795, 0, 0.8039216, 1, 1,
0.0544994, 0.6813378, -0.8219758, 0, 0.7960784, 1, 1,
0.05761789, 1.002348, 0.7355331, 0, 0.7882353, 1, 1,
0.05976123, -0.4925804, 2.45915, 0, 0.7843137, 1, 1,
0.06049611, 1.556077, 0.6412644, 0, 0.7764706, 1, 1,
0.06194436, 0.3897521, -2.023178, 0, 0.772549, 1, 1,
0.06201473, 0.3649963, 1.419206, 0, 0.7647059, 1, 1,
0.06386432, 0.1573097, -0.3506442, 0, 0.7607843, 1, 1,
0.06458816, -1.744865, 3.551435, 0, 0.7529412, 1, 1,
0.06472367, 0.01935622, 0.8758847, 0, 0.7490196, 1, 1,
0.06479356, 2.914694, -0.0206626, 0, 0.7411765, 1, 1,
0.06581125, -1.611855, 2.398293, 0, 0.7372549, 1, 1,
0.06862117, -1.84258, 3.312205, 0, 0.7294118, 1, 1,
0.07534812, -0.7003512, 1.927828, 0, 0.7254902, 1, 1,
0.07702432, -0.1033439, -0.2991846, 0, 0.7176471, 1, 1,
0.08096877, -0.8877978, 3.828966, 0, 0.7137255, 1, 1,
0.08269547, -0.1927028, 3.473816, 0, 0.7058824, 1, 1,
0.08355245, 0.3348941, 0.4621942, 0, 0.6980392, 1, 1,
0.08432405, -0.09676511, 2.54549, 0, 0.6941177, 1, 1,
0.08456293, -0.5649199, 2.938929, 0, 0.6862745, 1, 1,
0.08460895, -0.2628507, 2.397384, 0, 0.682353, 1, 1,
0.08617744, 1.457908, -0.6438079, 0, 0.6745098, 1, 1,
0.08758311, 1.187677, 0.3116817, 0, 0.6705883, 1, 1,
0.09304504, 0.4071723, 0.4572307, 0, 0.6627451, 1, 1,
0.09624853, -2.529067, 0.8853034, 0, 0.6588235, 1, 1,
0.09647009, -0.4323127, 3.067706, 0, 0.6509804, 1, 1,
0.09776071, -1.40296, 2.834731, 0, 0.6470588, 1, 1,
0.09846515, 1.181711, 1.921943, 0, 0.6392157, 1, 1,
0.09875082, -0.7467472, 2.905525, 0, 0.6352941, 1, 1,
0.1018914, -1.190405, 2.407717, 0, 0.627451, 1, 1,
0.1033358, -0.04475734, 2.764889, 0, 0.6235294, 1, 1,
0.1078107, 2.482511, -0.1555735, 0, 0.6156863, 1, 1,
0.1090399, 0.3060244, 2.102678, 0, 0.6117647, 1, 1,
0.1126566, -0.3649466, 2.876597, 0, 0.6039216, 1, 1,
0.1168211, -0.6378962, 2.030062, 0, 0.5960785, 1, 1,
0.1191978, 0.6003978, 1.159172, 0, 0.5921569, 1, 1,
0.1196618, 0.798225, -1.239793, 0, 0.5843138, 1, 1,
0.1218643, 0.4823452, 0.9960108, 0, 0.5803922, 1, 1,
0.1223976, -0.3931768, 1.955826, 0, 0.572549, 1, 1,
0.1224058, -1.288554, 3.639757, 0, 0.5686275, 1, 1,
0.1234287, -2.127815, 2.287407, 0, 0.5607843, 1, 1,
0.1263935, -0.9093478, 4.582668, 0, 0.5568628, 1, 1,
0.1264589, 1.124533, -1.399524, 0, 0.5490196, 1, 1,
0.1288825, -1.946182, 2.150547, 0, 0.5450981, 1, 1,
0.1336189, -0.5082144, 3.933602, 0, 0.5372549, 1, 1,
0.1392719, 0.4105717, -0.5016955, 0, 0.5333334, 1, 1,
0.1445225, -0.2329977, 1.763339, 0, 0.5254902, 1, 1,
0.1457533, -0.3258388, 2.073311, 0, 0.5215687, 1, 1,
0.1468542, -0.7118805, 1.441158, 0, 0.5137255, 1, 1,
0.147161, 0.7862421, 0.178043, 0, 0.509804, 1, 1,
0.1471729, 0.5495985, -1.384154, 0, 0.5019608, 1, 1,
0.1485023, -1.604379, 3.704797, 0, 0.4941176, 1, 1,
0.1527003, 0.2936477, 1.20981, 0, 0.4901961, 1, 1,
0.1554897, -0.354002, 2.738024, 0, 0.4823529, 1, 1,
0.1565795, -0.01701352, 2.252091, 0, 0.4784314, 1, 1,
0.1569677, 0.9581953, -0.8637707, 0, 0.4705882, 1, 1,
0.1587417, 0.2763912, 0.7465989, 0, 0.4666667, 1, 1,
0.1599364, -1.756892, 2.071732, 0, 0.4588235, 1, 1,
0.1624666, 0.3826909, 0.5492967, 0, 0.454902, 1, 1,
0.1657575, 2.253344, -0.7469412, 0, 0.4470588, 1, 1,
0.1705513, 1.431555, 0.6279747, 0, 0.4431373, 1, 1,
0.1722655, 0.5990391, 1.127216, 0, 0.4352941, 1, 1,
0.1734816, 0.9192715, -0.3435418, 0, 0.4313726, 1, 1,
0.1745286, 0.9251447, -0.9385103, 0, 0.4235294, 1, 1,
0.1753839, -0.06824346, 0.7686595, 0, 0.4196078, 1, 1,
0.1767117, -0.3335651, 1.763617, 0, 0.4117647, 1, 1,
0.1767629, -0.2981747, 1.82821, 0, 0.4078431, 1, 1,
0.1771818, -0.8891328, 2.10466, 0, 0.4, 1, 1,
0.1783523, -0.4278299, 1.568337, 0, 0.3921569, 1, 1,
0.1794722, -1.040985, 3.18058, 0, 0.3882353, 1, 1,
0.1797032, -0.6756658, 2.948562, 0, 0.3803922, 1, 1,
0.181927, 1.034215, -0.3927426, 0, 0.3764706, 1, 1,
0.1833284, 1.624599, -0.2083035, 0, 0.3686275, 1, 1,
0.189042, 1.391658, 1.445553, 0, 0.3647059, 1, 1,
0.1897415, 0.2724003, -0.115775, 0, 0.3568628, 1, 1,
0.1925657, -0.1604433, 4.320066, 0, 0.3529412, 1, 1,
0.2030175, -1.038366, 3.754433, 0, 0.345098, 1, 1,
0.2164539, 1.676462, 1.369784, 0, 0.3411765, 1, 1,
0.2174846, 0.9316143, 0.1781177, 0, 0.3333333, 1, 1,
0.2252256, 0.128349, 2.674256, 0, 0.3294118, 1, 1,
0.228558, 1.045721, 0.9619783, 0, 0.3215686, 1, 1,
0.2339738, -0.3186876, 1.257868, 0, 0.3176471, 1, 1,
0.2344903, -1.323851, 2.750319, 0, 0.3098039, 1, 1,
0.2442917, 0.5747768, -2.793618, 0, 0.3058824, 1, 1,
0.2452665, -0.4267232, 2.193834, 0, 0.2980392, 1, 1,
0.2522614, 0.777457, 0.3693682, 0, 0.2901961, 1, 1,
0.2534299, 0.8725261, 0.7186775, 0, 0.2862745, 1, 1,
0.2646211, -0.4609984, 4.687802, 0, 0.2784314, 1, 1,
0.2672809, -0.4562956, 2.703864, 0, 0.2745098, 1, 1,
0.2674876, 0.6557554, -0.3368176, 0, 0.2666667, 1, 1,
0.2735868, -1.359343, 3.064724, 0, 0.2627451, 1, 1,
0.2740618, -0.6826597, 2.499364, 0, 0.254902, 1, 1,
0.2835042, 1.726846, -0.2123623, 0, 0.2509804, 1, 1,
0.2878353, -0.3987682, 3.737282, 0, 0.2431373, 1, 1,
0.2932771, 0.8896636, 0.9787042, 0, 0.2392157, 1, 1,
0.2944722, -2.72864, 4.175915, 0, 0.2313726, 1, 1,
0.2968436, -0.1151397, 2.631426, 0, 0.227451, 1, 1,
0.2979849, 0.05897969, 1.772261, 0, 0.2196078, 1, 1,
0.2997859, -0.3476118, 2.072463, 0, 0.2156863, 1, 1,
0.301127, 0.8844626, 0.1849575, 0, 0.2078431, 1, 1,
0.3011987, 0.09754431, 0.9443477, 0, 0.2039216, 1, 1,
0.3017052, -0.5218661, 1.813844, 0, 0.1960784, 1, 1,
0.3024501, 0.6791857, 1.503402, 0, 0.1882353, 1, 1,
0.3055377, -1.536458, 3.715779, 0, 0.1843137, 1, 1,
0.3069274, -0.2848923, 1.906045, 0, 0.1764706, 1, 1,
0.3099234, -0.5855595, 2.227781, 0, 0.172549, 1, 1,
0.3123032, -1.036148, 3.593857, 0, 0.1647059, 1, 1,
0.3150432, -1.593595, 3.421156, 0, 0.1607843, 1, 1,
0.3153148, -1.54811, 3.109662, 0, 0.1529412, 1, 1,
0.3176398, 1.120565, -0.3522103, 0, 0.1490196, 1, 1,
0.3184243, -0.656433, 3.290323, 0, 0.1411765, 1, 1,
0.3187228, 0.2382965, 1.500692, 0, 0.1372549, 1, 1,
0.3188217, -1.023569, 3.192652, 0, 0.1294118, 1, 1,
0.3277695, -0.8119486, 3.173964, 0, 0.1254902, 1, 1,
0.3291465, -0.9162884, 3.237003, 0, 0.1176471, 1, 1,
0.3310223, 0.7432436, 1.040271, 0, 0.1137255, 1, 1,
0.3319697, 2.153726, -0.1392973, 0, 0.1058824, 1, 1,
0.3342247, -3.348579, 3.926961, 0, 0.09803922, 1, 1,
0.3353728, -0.2268302, 1.429085, 0, 0.09411765, 1, 1,
0.3376559, -0.1785093, 2.054229, 0, 0.08627451, 1, 1,
0.3399926, -0.114783, 3.628524, 0, 0.08235294, 1, 1,
0.3412301, 0.1362802, 0.1825264, 0, 0.07450981, 1, 1,
0.3484431, -1.230484, 3.787189, 0, 0.07058824, 1, 1,
0.3517847, 1.426775, -0.621474, 0, 0.0627451, 1, 1,
0.3602707, -0.2101167, 1.194223, 0, 0.05882353, 1, 1,
0.3631789, -0.4965057, 2.089831, 0, 0.05098039, 1, 1,
0.3637491, -0.4131059, 1.814882, 0, 0.04705882, 1, 1,
0.3668704, -1.068578, 3.181109, 0, 0.03921569, 1, 1,
0.3688676, -0.6871627, 2.088234, 0, 0.03529412, 1, 1,
0.3782321, -0.8245745, 1.905714, 0, 0.02745098, 1, 1,
0.3811157, 1.365778, 1.831885, 0, 0.02352941, 1, 1,
0.3849101, 0.01742992, 0.6434065, 0, 0.01568628, 1, 1,
0.387562, 0.2213984, 2.002882, 0, 0.01176471, 1, 1,
0.3878339, 1.385054, 2.394677, 0, 0.003921569, 1, 1,
0.3899322, 0.2348572, -0.596687, 0.003921569, 0, 1, 1,
0.3915874, -0.6100599, 3.345582, 0.007843138, 0, 1, 1,
0.3986549, 0.8967657, -0.2426555, 0.01568628, 0, 1, 1,
0.4012772, 0.4027272, 0.6690581, 0.01960784, 0, 1, 1,
0.4053996, -0.6582817, 4.252114, 0.02745098, 0, 1, 1,
0.4083984, -0.4465231, 3.237174, 0.03137255, 0, 1, 1,
0.4100625, -0.2596382, 2.882036, 0.03921569, 0, 1, 1,
0.4149903, 3.057586, -1.129897, 0.04313726, 0, 1, 1,
0.4197342, 0.9195177, -1.637257, 0.05098039, 0, 1, 1,
0.4202122, -0.9840215, 2.811243, 0.05490196, 0, 1, 1,
0.4207196, -1.140279, 1.974927, 0.0627451, 0, 1, 1,
0.423553, 1.366278, 0.3156003, 0.06666667, 0, 1, 1,
0.4257526, -0.2535936, 2.2104, 0.07450981, 0, 1, 1,
0.4274318, -0.2451592, 1.774226, 0.07843138, 0, 1, 1,
0.4293172, -0.7213404, 3.74742, 0.08627451, 0, 1, 1,
0.4318261, -1.294221, 2.716209, 0.09019608, 0, 1, 1,
0.4362044, -1.077043, 2.277003, 0.09803922, 0, 1, 1,
0.4405645, -0.03294494, 2.086813, 0.1058824, 0, 1, 1,
0.4432034, -0.3001492, 1.888117, 0.1098039, 0, 1, 1,
0.4446094, 1.244485, 0.8058776, 0.1176471, 0, 1, 1,
0.4453492, 0.6112339, 1.284042, 0.1215686, 0, 1, 1,
0.4534733, -1.010973, 2.410872, 0.1294118, 0, 1, 1,
0.4544328, 1.226114, 1.015156, 0.1333333, 0, 1, 1,
0.4568232, 0.161823, 0.9554257, 0.1411765, 0, 1, 1,
0.4584662, -0.9941906, 2.341463, 0.145098, 0, 1, 1,
0.4591, 1.24642, 0.8729807, 0.1529412, 0, 1, 1,
0.4642713, -0.513945, 2.371285, 0.1568628, 0, 1, 1,
0.4656052, -0.6907146, 1.195993, 0.1647059, 0, 1, 1,
0.466345, 1.121154, 0.5989015, 0.1686275, 0, 1, 1,
0.4680151, 0.2692156, 2.567609, 0.1764706, 0, 1, 1,
0.4691058, 0.100918, 0.6849726, 0.1803922, 0, 1, 1,
0.4700073, -1.039644, 2.821157, 0.1882353, 0, 1, 1,
0.4736881, 0.4150643, 1.219766, 0.1921569, 0, 1, 1,
0.474921, -0.9069492, 3.502519, 0.2, 0, 1, 1,
0.477074, -0.5916647, 3.238518, 0.2078431, 0, 1, 1,
0.4833315, -0.7008375, 3.129534, 0.2117647, 0, 1, 1,
0.4917148, 1.018079, 1.836261, 0.2196078, 0, 1, 1,
0.4988777, 1.757158, -0.5003803, 0.2235294, 0, 1, 1,
0.4997576, -0.0211813, 0.4120139, 0.2313726, 0, 1, 1,
0.501218, 2.083306, -1.624626, 0.2352941, 0, 1, 1,
0.5027834, 1.319262, 0.1990757, 0.2431373, 0, 1, 1,
0.5044162, -0.2179559, 3.965576, 0.2470588, 0, 1, 1,
0.5047709, -0.3325212, 2.658995, 0.254902, 0, 1, 1,
0.5117527, -0.5330937, 2.387469, 0.2588235, 0, 1, 1,
0.5129938, 1.071701, -0.2226974, 0.2666667, 0, 1, 1,
0.5160944, -0.3097894, 1.918734, 0.2705882, 0, 1, 1,
0.5167038, -0.5853938, 2.877868, 0.2784314, 0, 1, 1,
0.5178328, -1.150504, 1.62201, 0.282353, 0, 1, 1,
0.5195099, 0.3701531, 0.890448, 0.2901961, 0, 1, 1,
0.5198291, 1.561998, -0.07565378, 0.2941177, 0, 1, 1,
0.5271002, -1.121793, 2.303293, 0.3019608, 0, 1, 1,
0.5330717, 0.02672482, 0.4763046, 0.3098039, 0, 1, 1,
0.5358164, 0.1882941, 2.104836, 0.3137255, 0, 1, 1,
0.5424815, 1.036228, 0.1720418, 0.3215686, 0, 1, 1,
0.5449323, 1.769376, 0.4185586, 0.3254902, 0, 1, 1,
0.5453163, -1.021773, 1.677404, 0.3333333, 0, 1, 1,
0.545598, 0.2430877, 1.995226, 0.3372549, 0, 1, 1,
0.5476322, -0.4901926, 1.438626, 0.345098, 0, 1, 1,
0.5502148, -1.06831, 3.418481, 0.3490196, 0, 1, 1,
0.5520943, -0.6662455, 3.034624, 0.3568628, 0, 1, 1,
0.5522599, -0.7262888, 2.634825, 0.3607843, 0, 1, 1,
0.5522798, 0.346562, 2.052351, 0.3686275, 0, 1, 1,
0.5532541, -1.590927, 2.403286, 0.372549, 0, 1, 1,
0.5563076, -0.1540597, -0.1479576, 0.3803922, 0, 1, 1,
0.5613939, -0.8467223, 3.492553, 0.3843137, 0, 1, 1,
0.5628804, 0.3734872, 1.763878, 0.3921569, 0, 1, 1,
0.5640602, 1.422967, 1.636158, 0.3960784, 0, 1, 1,
0.5685427, 0.7875001, -0.5192859, 0.4039216, 0, 1, 1,
0.5688712, 0.6812002, 0.326217, 0.4117647, 0, 1, 1,
0.5708919, -1.054997, 2.657797, 0.4156863, 0, 1, 1,
0.5709799, -0.9364135, 2.512222, 0.4235294, 0, 1, 1,
0.5759911, -1.335245, 2.921356, 0.427451, 0, 1, 1,
0.5763596, 0.6795309, 3.083776, 0.4352941, 0, 1, 1,
0.5790223, 1.016294, 1.005795, 0.4392157, 0, 1, 1,
0.5832045, 0.09118252, -0.4943541, 0.4470588, 0, 1, 1,
0.5940109, 0.2613797, 0.7623716, 0.4509804, 0, 1, 1,
0.5942032, 1.016294, 3.044661, 0.4588235, 0, 1, 1,
0.5982659, 0.05990635, 0.4344053, 0.4627451, 0, 1, 1,
0.6040109, -1.580702, 1.853073, 0.4705882, 0, 1, 1,
0.6071674, 0.1448107, 1.483613, 0.4745098, 0, 1, 1,
0.6082085, -0.4536792, 2.983844, 0.4823529, 0, 1, 1,
0.6101042, 1.133812, -0.3263056, 0.4862745, 0, 1, 1,
0.6108721, 0.2053282, 2.041615, 0.4941176, 0, 1, 1,
0.6112829, 0.4925926, 0.6954988, 0.5019608, 0, 1, 1,
0.6197591, 0.9203549, 0.1016144, 0.5058824, 0, 1, 1,
0.6255689, 0.4299133, 0.7166483, 0.5137255, 0, 1, 1,
0.6347705, -0.5279582, 2.606235, 0.5176471, 0, 1, 1,
0.6392565, -0.04440887, 1.947501, 0.5254902, 0, 1, 1,
0.640721, -1.299557, 4.029514, 0.5294118, 0, 1, 1,
0.6434181, 1.364589, -0.2738436, 0.5372549, 0, 1, 1,
0.6455396, -0.03776588, 1.935426, 0.5411765, 0, 1, 1,
0.6464822, 0.360565, 2.331199, 0.5490196, 0, 1, 1,
0.6481793, -1.194725, 2.942149, 0.5529412, 0, 1, 1,
0.6502897, 0.6785138, 2.173953, 0.5607843, 0, 1, 1,
0.6509317, 0.1133219, 2.2086, 0.5647059, 0, 1, 1,
0.6531426, 0.7631171, 0.6558874, 0.572549, 0, 1, 1,
0.6570066, 0.6230118, 0.2242102, 0.5764706, 0, 1, 1,
0.6635852, -0.2669784, 0.4308825, 0.5843138, 0, 1, 1,
0.6646705, -0.7671193, 0.3397922, 0.5882353, 0, 1, 1,
0.6665632, 0.1886361, 1.927026, 0.5960785, 0, 1, 1,
0.6724518, 1.141988, 0.2294238, 0.6039216, 0, 1, 1,
0.6724606, -0.4123196, 1.478192, 0.6078432, 0, 1, 1,
0.6744793, -1.602661, 3.36172, 0.6156863, 0, 1, 1,
0.6871651, -1.366415, 3.222052, 0.6196079, 0, 1, 1,
0.6896142, 0.3049922, 1.983279, 0.627451, 0, 1, 1,
0.6899539, 0.5078418, 0.7523233, 0.6313726, 0, 1, 1,
0.689974, -1.689494, 2.943391, 0.6392157, 0, 1, 1,
0.6914917, 0.6125523, 0.7078139, 0.6431373, 0, 1, 1,
0.7009888, -1.359526, 3.946626, 0.6509804, 0, 1, 1,
0.7060462, -1.213512, 2.246915, 0.654902, 0, 1, 1,
0.7079723, -0.8170648, 2.149294, 0.6627451, 0, 1, 1,
0.7136715, -1.758474, 4.67471, 0.6666667, 0, 1, 1,
0.7217995, 0.7362909, -1.199582, 0.6745098, 0, 1, 1,
0.7275646, 0.04632515, 1.319952, 0.6784314, 0, 1, 1,
0.7312298, 0.09683633, 0.5030797, 0.6862745, 0, 1, 1,
0.7316978, -0.5793099, 3.249562, 0.6901961, 0, 1, 1,
0.7345848, -0.4453416, 1.59297, 0.6980392, 0, 1, 1,
0.7349063, 2.352417, -0.5003796, 0.7058824, 0, 1, 1,
0.73632, 0.9928389, -0.5926416, 0.7098039, 0, 1, 1,
0.7378975, -0.8567957, 1.761317, 0.7176471, 0, 1, 1,
0.7385337, 1.650675, 0.5940737, 0.7215686, 0, 1, 1,
0.7404518, 0.7842339, -0.0598814, 0.7294118, 0, 1, 1,
0.7434002, 1.617618, 0.1666101, 0.7333333, 0, 1, 1,
0.7474579, -0.795386, 3.601681, 0.7411765, 0, 1, 1,
0.7516166, 0.3450423, 0.6555742, 0.7450981, 0, 1, 1,
0.7539073, 0.5279936, 3.25955, 0.7529412, 0, 1, 1,
0.7539682, -1.032825, 0.753728, 0.7568628, 0, 1, 1,
0.7550864, 0.4726754, 2.70703, 0.7647059, 0, 1, 1,
0.7552378, 0.02235948, 0.7248454, 0.7686275, 0, 1, 1,
0.758283, 0.9491526, -0.2809508, 0.7764706, 0, 1, 1,
0.7630974, -0.720816, 2.653038, 0.7803922, 0, 1, 1,
0.7664655, -0.8010937, 1.811768, 0.7882353, 0, 1, 1,
0.7683582, -1.515131, 2.265438, 0.7921569, 0, 1, 1,
0.768967, -0.5915809, 0.1495597, 0.8, 0, 1, 1,
0.7711588, 1.55012, 1.06828, 0.8078431, 0, 1, 1,
0.7712783, -1.671103, 4.07505, 0.8117647, 0, 1, 1,
0.7751558, -0.5609484, 2.88783, 0.8196079, 0, 1, 1,
0.7780058, 0.3644302, 2.067019, 0.8235294, 0, 1, 1,
0.7802309, -0.6544855, 0.2849372, 0.8313726, 0, 1, 1,
0.7922307, 0.1667035, 2.732505, 0.8352941, 0, 1, 1,
0.7938015, 0.2183711, 0.7146742, 0.8431373, 0, 1, 1,
0.798909, 0.007847115, 2.016728, 0.8470588, 0, 1, 1,
0.8093011, 0.2657746, 1.457444, 0.854902, 0, 1, 1,
0.8094231, -0.2488261, 2.067444, 0.8588235, 0, 1, 1,
0.8137463, -0.3450558, 1.456946, 0.8666667, 0, 1, 1,
0.8154992, -0.6674025, 1.271865, 0.8705882, 0, 1, 1,
0.8169019, -1.719459, 3.152172, 0.8784314, 0, 1, 1,
0.8198788, 0.2065239, 1.831532, 0.8823529, 0, 1, 1,
0.8217469, -0.4217289, 2.034259, 0.8901961, 0, 1, 1,
0.8252023, -1.129282, 1.290059, 0.8941177, 0, 1, 1,
0.8298601, 0.3104177, 2.131982, 0.9019608, 0, 1, 1,
0.8390999, -1.086519, 2.926666, 0.9098039, 0, 1, 1,
0.8463658, -1.103873, 2.807472, 0.9137255, 0, 1, 1,
0.8477234, -1.374524, 4.259173, 0.9215686, 0, 1, 1,
0.8489417, -1.316398, 2.927045, 0.9254902, 0, 1, 1,
0.8519586, -1.408579, 2.905458, 0.9333333, 0, 1, 1,
0.8550605, -0.4729253, 2.7741, 0.9372549, 0, 1, 1,
0.8569325, -0.6251718, 3.459492, 0.945098, 0, 1, 1,
0.8571014, 0.203006, 1.680576, 0.9490196, 0, 1, 1,
0.8620393, -1.054071, 2.74096, 0.9568627, 0, 1, 1,
0.8654157, -0.595193, 1.540216, 0.9607843, 0, 1, 1,
0.8703068, 0.5539035, 0.3258536, 0.9686275, 0, 1, 1,
0.8712217, 0.8075027, 2.345197, 0.972549, 0, 1, 1,
0.8712382, -0.1412774, 2.048992, 0.9803922, 0, 1, 1,
0.8746958, 1.782339, -0.831193, 0.9843137, 0, 1, 1,
0.8757887, -0.2479236, 0.9807628, 0.9921569, 0, 1, 1,
0.8802933, -0.827715, 2.188851, 0.9960784, 0, 1, 1,
0.8963031, 0.4796914, 1.120902, 1, 0, 0.9960784, 1,
0.9161952, -0.63918, 2.347797, 1, 0, 0.9882353, 1,
0.9311242, 0.7119583, 1.009187, 1, 0, 0.9843137, 1,
0.9343543, -0.5942084, 2.61131, 1, 0, 0.9764706, 1,
0.9375507, -0.4177731, 0.4418442, 1, 0, 0.972549, 1,
0.9460296, 0.6161756, -0.04832062, 1, 0, 0.9647059, 1,
0.9462757, 0.0459605, 0.5031868, 1, 0, 0.9607843, 1,
0.952899, 0.2397221, 1.946456, 1, 0, 0.9529412, 1,
0.9530816, 0.9802934, 1.438024, 1, 0, 0.9490196, 1,
0.9567451, -0.3623711, 2.197927, 1, 0, 0.9411765, 1,
0.9575583, -0.09666101, 2.93573, 1, 0, 0.9372549, 1,
0.9757739, 0.3202243, 1.404772, 1, 0, 0.9294118, 1,
0.9814059, 0.9750184, 4.594433, 1, 0, 0.9254902, 1,
0.9821112, 1.617918, 2.071673, 1, 0, 0.9176471, 1,
0.9845214, -0.8924389, 1.418361, 1, 0, 0.9137255, 1,
0.9933209, 0.6563188, -1.032143, 1, 0, 0.9058824, 1,
0.9942086, -1.357757, 2.765984, 1, 0, 0.9019608, 1,
0.9962303, 0.5494069, 2.592559, 1, 0, 0.8941177, 1,
0.9981695, 1.644712, 0.09692004, 1, 0, 0.8862745, 1,
1.003943, 1.402733, 0.2264439, 1, 0, 0.8823529, 1,
1.01221, 0.4403097, 1.352598, 1, 0, 0.8745098, 1,
1.013465, 0.1786619, -0.4094606, 1, 0, 0.8705882, 1,
1.016102, 1.909824, 1.249634, 1, 0, 0.8627451, 1,
1.016334, 0.1156424, 1.587008, 1, 0, 0.8588235, 1,
1.017071, 0.4734783, 1.853137, 1, 0, 0.8509804, 1,
1.020687, -0.6626071, 3.062261, 1, 0, 0.8470588, 1,
1.025559, 1.123118, 0.01634923, 1, 0, 0.8392157, 1,
1.031696, 1.164112, 1.856315, 1, 0, 0.8352941, 1,
1.043263, -0.09261551, -0.04634658, 1, 0, 0.827451, 1,
1.045944, 1.33055, -1.850517, 1, 0, 0.8235294, 1,
1.048162, -0.6634537, 2.262482, 1, 0, 0.8156863, 1,
1.050102, -0.5985959, 1.722977, 1, 0, 0.8117647, 1,
1.051507, 0.4845996, 2.266766, 1, 0, 0.8039216, 1,
1.054517, 2.456048, 0.01589571, 1, 0, 0.7960784, 1,
1.073896, 0.5955338, 0.2382291, 1, 0, 0.7921569, 1,
1.082177, -1.550881, 2.189888, 1, 0, 0.7843137, 1,
1.084541, -0.6293729, 0.3717895, 1, 0, 0.7803922, 1,
1.084737, -0.1382236, 1.543987, 1, 0, 0.772549, 1,
1.088912, -0.8732461, 1.899527, 1, 0, 0.7686275, 1,
1.1001, -0.4059277, 2.939205, 1, 0, 0.7607843, 1,
1.107287, 1.617144, -0.8071864, 1, 0, 0.7568628, 1,
1.109555, 1.195526, 2.131325, 1, 0, 0.7490196, 1,
1.116292, -0.7139041, 1.006023, 1, 0, 0.7450981, 1,
1.121275, 0.55047, 1.112327, 1, 0, 0.7372549, 1,
1.130332, 0.6409056, 0.07688824, 1, 0, 0.7333333, 1,
1.13926, -0.4893762, 2.046086, 1, 0, 0.7254902, 1,
1.140896, -0.2128157, 1.922037, 1, 0, 0.7215686, 1,
1.156851, -1.358122, 3.357053, 1, 0, 0.7137255, 1,
1.157351, -0.07103172, 2.868677, 1, 0, 0.7098039, 1,
1.160369, -0.7127851, 1.484992, 1, 0, 0.7019608, 1,
1.162896, 0.4933416, 2.400701, 1, 0, 0.6941177, 1,
1.175007, -0.2981965, 2.414346, 1, 0, 0.6901961, 1,
1.179089, -0.3040726, 1.691893, 1, 0, 0.682353, 1,
1.191844, -1.293079, 1.640962, 1, 0, 0.6784314, 1,
1.197642, 1.766852, 0.7321476, 1, 0, 0.6705883, 1,
1.203676, -1.500775, 3.827918, 1, 0, 0.6666667, 1,
1.209077, 0.6670035, 0.3771836, 1, 0, 0.6588235, 1,
1.219717, -1.517659, 1.8414, 1, 0, 0.654902, 1,
1.222409, -0.4327111, 3.219673, 1, 0, 0.6470588, 1,
1.223478, -0.9194791, 1.508736, 1, 0, 0.6431373, 1,
1.225263, 0.2386832, 0.743472, 1, 0, 0.6352941, 1,
1.225439, 0.9054773, -0.8541253, 1, 0, 0.6313726, 1,
1.235261, -0.2567777, 1.592316, 1, 0, 0.6235294, 1,
1.238863, -1.690963, 2.480879, 1, 0, 0.6196079, 1,
1.250409, 1.84153, 1.7727, 1, 0, 0.6117647, 1,
1.254857, -0.9914857, 3.096607, 1, 0, 0.6078432, 1,
1.256384, -2.176499, 2.940501, 1, 0, 0.6, 1,
1.257449, 0.5572868, 1.44097, 1, 0, 0.5921569, 1,
1.26213, -0.1476002, 1.73707, 1, 0, 0.5882353, 1,
1.271005, -1.925876, 2.269486, 1, 0, 0.5803922, 1,
1.271863, -1.406543, 4.530502, 1, 0, 0.5764706, 1,
1.272415, -0.8090106, 3.140146, 1, 0, 0.5686275, 1,
1.280332, -0.9155967, 1.892905, 1, 0, 0.5647059, 1,
1.282255, 0.3431308, 1.223238, 1, 0, 0.5568628, 1,
1.301163, 0.7441067, 1.088554, 1, 0, 0.5529412, 1,
1.321524, -0.1232623, 1.995238, 1, 0, 0.5450981, 1,
1.323705, 0.4900091, 0.3261302, 1, 0, 0.5411765, 1,
1.330718, 0.5263489, 0.5103267, 1, 0, 0.5333334, 1,
1.33128, 0.2457248, -0.4731298, 1, 0, 0.5294118, 1,
1.334192, -0.7221605, 2.665567, 1, 0, 0.5215687, 1,
1.335817, -0.7749072, 1.342704, 1, 0, 0.5176471, 1,
1.336387, -0.3200371, 1.788189, 1, 0, 0.509804, 1,
1.349467, 0.5507417, 1.273338, 1, 0, 0.5058824, 1,
1.355515, 0.341074, 1.778721, 1, 0, 0.4980392, 1,
1.375502, 0.4621471, 1.885428, 1, 0, 0.4901961, 1,
1.376807, 2.324568, 1.194971, 1, 0, 0.4862745, 1,
1.398205, 0.2828839, 1.75208, 1, 0, 0.4784314, 1,
1.400799, -0.02191011, 3.434656, 1, 0, 0.4745098, 1,
1.409012, 0.841969, 0.9696523, 1, 0, 0.4666667, 1,
1.413219, 0.9386578, 2.828066, 1, 0, 0.4627451, 1,
1.414263, 0.2556345, 2.322944, 1, 0, 0.454902, 1,
1.441771, -1.173211, 2.452496, 1, 0, 0.4509804, 1,
1.448475, -0.9157161, 2.714845, 1, 0, 0.4431373, 1,
1.462138, 0.4539265, 1.63045, 1, 0, 0.4392157, 1,
1.477794, 0.558537, 1.278112, 1, 0, 0.4313726, 1,
1.479246, -0.4431201, 0.213879, 1, 0, 0.427451, 1,
1.479749, -0.005839584, 2.595935, 1, 0, 0.4196078, 1,
1.481969, 0.9736838, 0.3489429, 1, 0, 0.4156863, 1,
1.482014, -2.164706, 2.943333, 1, 0, 0.4078431, 1,
1.482369, 0.9088913, 0.9991524, 1, 0, 0.4039216, 1,
1.482611, 0.4105086, 0.8614268, 1, 0, 0.3960784, 1,
1.494993, 1.382351, 1.603336, 1, 0, 0.3882353, 1,
1.50343, -0.4461373, 1.190494, 1, 0, 0.3843137, 1,
1.510149, 0.4668939, 0.4052177, 1, 0, 0.3764706, 1,
1.519417, 0.8283333, 0.8752034, 1, 0, 0.372549, 1,
1.547174, 0.7414882, 2.055384, 1, 0, 0.3647059, 1,
1.550941, 0.8518828, 1.699984, 1, 0, 0.3607843, 1,
1.57135, 0.3373137, 1.57941, 1, 0, 0.3529412, 1,
1.583183, -0.7336115, 1.806543, 1, 0, 0.3490196, 1,
1.585957, -0.09162825, 2.379611, 1, 0, 0.3411765, 1,
1.587306, -0.05694886, 2.561261, 1, 0, 0.3372549, 1,
1.588874, -0.1482213, 3.5825, 1, 0, 0.3294118, 1,
1.593179, -0.7387545, 0.4189973, 1, 0, 0.3254902, 1,
1.60393, -0.5788983, 2.443796, 1, 0, 0.3176471, 1,
1.624479, -0.5246019, 2.706805, 1, 0, 0.3137255, 1,
1.641019, 0.8095723, 1.880374, 1, 0, 0.3058824, 1,
1.652064, -0.5103521, 3.791295, 1, 0, 0.2980392, 1,
1.661499, 1.170092, 0.5747384, 1, 0, 0.2941177, 1,
1.670713, -0.7442815, 3.489684, 1, 0, 0.2862745, 1,
1.67525, 1.092194, 0.4111441, 1, 0, 0.282353, 1,
1.686977, -1.027805, 1.029688, 1, 0, 0.2745098, 1,
1.698436, -0.8391583, 1.316096, 1, 0, 0.2705882, 1,
1.716923, 0.4828223, 0.3531563, 1, 0, 0.2627451, 1,
1.717901, 2.089799, 1.172447, 1, 0, 0.2588235, 1,
1.723947, -0.5107582, 1.752933, 1, 0, 0.2509804, 1,
1.740091, -1.271043, 1.715731, 1, 0, 0.2470588, 1,
1.76138, 0.9707706, 2.290416, 1, 0, 0.2392157, 1,
1.761624, 0.6707411, 1.754335, 1, 0, 0.2352941, 1,
1.761633, 0.219118, 1.373655, 1, 0, 0.227451, 1,
1.77005, 0.1829659, 2.002394, 1, 0, 0.2235294, 1,
1.770137, 2.437998, -0.6065344, 1, 0, 0.2156863, 1,
1.770218, -0.7768196, 3.278935, 1, 0, 0.2117647, 1,
1.777788, 1.440505, 0.2124623, 1, 0, 0.2039216, 1,
1.785421, -0.8472428, 0.8463509, 1, 0, 0.1960784, 1,
1.806113, 0.7466044, 0.3975964, 1, 0, 0.1921569, 1,
1.809138, 1.348936, 0.08369625, 1, 0, 0.1843137, 1,
1.815215, -0.4604359, 0.6374383, 1, 0, 0.1803922, 1,
1.827341, -1.321145, 2.508117, 1, 0, 0.172549, 1,
1.830073, -1.152815, 1.827528, 1, 0, 0.1686275, 1,
1.850464, -1.132255, 3.372814, 1, 0, 0.1607843, 1,
1.936517, -1.403487, 4.378356, 1, 0, 0.1568628, 1,
1.948784, -0.9031485, 0.9920788, 1, 0, 0.1490196, 1,
1.969677, -0.2037481, 2.451494, 1, 0, 0.145098, 1,
1.971661, 0.1904093, 0.1276912, 1, 0, 0.1372549, 1,
1.971855, 0.9084275, 0.7371796, 1, 0, 0.1333333, 1,
2.005891, -0.4102359, 0.2331652, 1, 0, 0.1254902, 1,
2.020059, 0.4572363, 1.731274, 1, 0, 0.1215686, 1,
2.031371, -0.03923009, 1.682373, 1, 0, 0.1137255, 1,
2.071217, -0.3431541, 0.9867918, 1, 0, 0.1098039, 1,
2.102113, 0.9138438, 0.7340546, 1, 0, 0.1019608, 1,
2.155734, 1.464068, -0.4866001, 1, 0, 0.09411765, 1,
2.2216, 0.4726892, 1.377703, 1, 0, 0.09019608, 1,
2.224775, -0.1403596, 1.118814, 1, 0, 0.08235294, 1,
2.246492, 1.775663, 1.807876, 1, 0, 0.07843138, 1,
2.26878, -1.260407, 1.934476, 1, 0, 0.07058824, 1,
2.275021, 0.8139706, 0.7718183, 1, 0, 0.06666667, 1,
2.294077, -1.357133, 1.501007, 1, 0, 0.05882353, 1,
2.421961, 0.1220096, 0.8200411, 1, 0, 0.05490196, 1,
2.42941, -0.1761055, 3.618374, 1, 0, 0.04705882, 1,
2.498146, 0.3025852, 2.213059, 1, 0, 0.04313726, 1,
2.536318, 0.04000491, 2.534615, 1, 0, 0.03529412, 1,
2.758331, 0.5482284, 1.049024, 1, 0, 0.03137255, 1,
2.773719, 0.5414587, 0.1554984, 1, 0, 0.02352941, 1,
2.852952, -1.061078, 1.126292, 1, 0, 0.01960784, 1,
2.889636, 0.7472172, 0.0869581, 1, 0, 0.01176471, 1,
2.954357, -2.122645, 0.9574831, 1, 0, 0.007843138, 1
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
0.01585007, -4.434424, -6.920637, 0, -0.5, 0.5, 0.5,
0.01585007, -4.434424, -6.920637, 1, -0.5, 0.5, 0.5,
0.01585007, -4.434424, -6.920637, 1, 1.5, 0.5, 0.5,
0.01585007, -4.434424, -6.920637, 0, 1.5, 0.5, 0.5
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
-3.918811, -0.1454964, -6.920637, 0, -0.5, 0.5, 0.5,
-3.918811, -0.1454964, -6.920637, 1, -0.5, 0.5, 0.5,
-3.918811, -0.1454964, -6.920637, 1, 1.5, 0.5, 0.5,
-3.918811, -0.1454964, -6.920637, 0, 1.5, 0.5, 0.5
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
-3.918811, -4.434424, -0.2751904, 0, -0.5, 0.5, 0.5,
-3.918811, -4.434424, -0.2751904, 1, -0.5, 0.5, 0.5,
-3.918811, -4.434424, -0.2751904, 1, 1.5, 0.5, 0.5,
-3.918811, -4.434424, -0.2751904, 0, 1.5, 0.5, 0.5
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
-2, -3.444671, -5.387072,
2, -3.444671, -5.387072,
-2, -3.444671, -5.387072,
-2, -3.60963, -5.642666,
-1, -3.444671, -5.387072,
-1, -3.60963, -5.642666,
0, -3.444671, -5.387072,
0, -3.60963, -5.642666,
1, -3.444671, -5.387072,
1, -3.60963, -5.642666,
2, -3.444671, -5.387072,
2, -3.60963, -5.642666
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
-2, -3.939548, -6.153854, 0, -0.5, 0.5, 0.5,
-2, -3.939548, -6.153854, 1, -0.5, 0.5, 0.5,
-2, -3.939548, -6.153854, 1, 1.5, 0.5, 0.5,
-2, -3.939548, -6.153854, 0, 1.5, 0.5, 0.5,
-1, -3.939548, -6.153854, 0, -0.5, 0.5, 0.5,
-1, -3.939548, -6.153854, 1, -0.5, 0.5, 0.5,
-1, -3.939548, -6.153854, 1, 1.5, 0.5, 0.5,
-1, -3.939548, -6.153854, 0, 1.5, 0.5, 0.5,
0, -3.939548, -6.153854, 0, -0.5, 0.5, 0.5,
0, -3.939548, -6.153854, 1, -0.5, 0.5, 0.5,
0, -3.939548, -6.153854, 1, 1.5, 0.5, 0.5,
0, -3.939548, -6.153854, 0, 1.5, 0.5, 0.5,
1, -3.939548, -6.153854, 0, -0.5, 0.5, 0.5,
1, -3.939548, -6.153854, 1, -0.5, 0.5, 0.5,
1, -3.939548, -6.153854, 1, 1.5, 0.5, 0.5,
1, -3.939548, -6.153854, 0, 1.5, 0.5, 0.5,
2, -3.939548, -6.153854, 0, -0.5, 0.5, 0.5,
2, -3.939548, -6.153854, 1, -0.5, 0.5, 0.5,
2, -3.939548, -6.153854, 1, 1.5, 0.5, 0.5,
2, -3.939548, -6.153854, 0, 1.5, 0.5, 0.5
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
-3.010813, -3, -5.387072,
-3.010813, 3, -5.387072,
-3.010813, -3, -5.387072,
-3.162146, -3, -5.642666,
-3.010813, -2, -5.387072,
-3.162146, -2, -5.642666,
-3.010813, -1, -5.387072,
-3.162146, -1, -5.642666,
-3.010813, 0, -5.387072,
-3.162146, 0, -5.642666,
-3.010813, 1, -5.387072,
-3.162146, 1, -5.642666,
-3.010813, 2, -5.387072,
-3.162146, 2, -5.642666,
-3.010813, 3, -5.387072,
-3.162146, 3, -5.642666
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
-3.464812, -3, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, -3, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, -3, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, -3, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, -2, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, -2, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, -2, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, -2, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, -1, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, -1, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, -1, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, -1, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, 0, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, 0, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, 0, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, 0, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, 1, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, 1, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, 1, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, 1, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, 2, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, 2, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, 2, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, 2, -6.153854, 0, 1.5, 0.5, 0.5,
-3.464812, 3, -6.153854, 0, -0.5, 0.5, 0.5,
-3.464812, 3, -6.153854, 1, -0.5, 0.5, 0.5,
-3.464812, 3, -6.153854, 1, 1.5, 0.5, 0.5,
-3.464812, 3, -6.153854, 0, 1.5, 0.5, 0.5
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
-3.010813, -3.444671, -4,
-3.010813, -3.444671, 4,
-3.010813, -3.444671, -4,
-3.162146, -3.60963, -4,
-3.010813, -3.444671, -2,
-3.162146, -3.60963, -2,
-3.010813, -3.444671, 0,
-3.162146, -3.60963, 0,
-3.010813, -3.444671, 2,
-3.162146, -3.60963, 2,
-3.010813, -3.444671, 4,
-3.162146, -3.60963, 4
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
-3.464812, -3.939548, -4, 0, -0.5, 0.5, 0.5,
-3.464812, -3.939548, -4, 1, -0.5, 0.5, 0.5,
-3.464812, -3.939548, -4, 1, 1.5, 0.5, 0.5,
-3.464812, -3.939548, -4, 0, 1.5, 0.5, 0.5,
-3.464812, -3.939548, -2, 0, -0.5, 0.5, 0.5,
-3.464812, -3.939548, -2, 1, -0.5, 0.5, 0.5,
-3.464812, -3.939548, -2, 1, 1.5, 0.5, 0.5,
-3.464812, -3.939548, -2, 0, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 0, 0, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 0, 1, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 0, 1, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 0, 0, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 2, 0, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 2, 1, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 2, 1, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 2, 0, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 4, 0, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 4, 1, -0.5, 0.5, 0.5,
-3.464812, -3.939548, 4, 1, 1.5, 0.5, 0.5,
-3.464812, -3.939548, 4, 0, 1.5, 0.5, 0.5
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
-3.010813, -3.444671, -5.387072,
-3.010813, 3.153679, -5.387072,
-3.010813, -3.444671, 4.836691,
-3.010813, 3.153679, 4.836691,
-3.010813, -3.444671, -5.387072,
-3.010813, -3.444671, 4.836691,
-3.010813, 3.153679, -5.387072,
-3.010813, 3.153679, 4.836691,
-3.010813, -3.444671, -5.387072,
3.042513, -3.444671, -5.387072,
-3.010813, -3.444671, 4.836691,
3.042513, -3.444671, 4.836691,
-3.010813, 3.153679, -5.387072,
3.042513, 3.153679, -5.387072,
-3.010813, 3.153679, 4.836691,
3.042513, 3.153679, 4.836691,
3.042513, -3.444671, -5.387072,
3.042513, 3.153679, -5.387072,
3.042513, -3.444671, 4.836691,
3.042513, 3.153679, 4.836691,
3.042513, -3.444671, -5.387072,
3.042513, -3.444671, 4.836691,
3.042513, 3.153679, -5.387072,
3.042513, 3.153679, 4.836691
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
var radius = 7.257154;
var distance = 32.2879;
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
mvMatrix.translate( -0.01585007, 0.1454964, 0.2751904 );
mvMatrix.scale( 1.296242, 1.189173, 0.7674842 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.2879);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
2-aminobenzimidazole<-read.table("2-aminobenzimidazole.xyz")
```

```
## Error in read.table("2-aminobenzimidazole.xyz"): no lines available in input
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
-2.922657, 0.04206399, -0.9912919, 0, 0, 1, 1, 1,
-2.79454, 0.09367356, -2.518951, 1, 0, 0, 1, 1,
-2.652307, 0.7711634, -1.800637, 1, 0, 0, 1, 1,
-2.47111, 0.001876976, -2.118281, 1, 0, 0, 1, 1,
-2.456044, -1.44262, -3.25176, 1, 0, 0, 1, 1,
-2.421435, 0.05325566, -2.234184, 1, 0, 0, 1, 1,
-2.407865, -0.191533, -0.193336, 0, 0, 0, 1, 1,
-2.383631, 1.6905, -1.51254, 0, 0, 0, 1, 1,
-2.382824, -0.5117519, -2.898088, 0, 0, 0, 1, 1,
-2.368914, 0.619924, -2.365683, 0, 0, 0, 1, 1,
-2.335063, 0.2130445, -1.700779, 0, 0, 0, 1, 1,
-2.331069, 0.9984069, -1.773283, 0, 0, 0, 1, 1,
-2.285616, 0.7738738, -0.08651888, 0, 0, 0, 1, 1,
-2.279649, 1.033344, -1.28855, 1, 1, 1, 1, 1,
-2.205975, -0.3205929, -0.5335269, 1, 1, 1, 1, 1,
-2.185281, -0.02447076, -1.988896, 1, 1, 1, 1, 1,
-2.153503, -0.6463022, 0.3266576, 1, 1, 1, 1, 1,
-2.136662, -0.2016454, -1.366447, 1, 1, 1, 1, 1,
-2.12462, -0.3397325, -2.369336, 1, 1, 1, 1, 1,
-2.113271, 1.408766, -0.337991, 1, 1, 1, 1, 1,
-2.110721, -0.8266349, -1.704658, 1, 1, 1, 1, 1,
-2.096703, -1.878781, -3.12488, 1, 1, 1, 1, 1,
-2.094897, -0.007591501, -1.51513, 1, 1, 1, 1, 1,
-2.083029, 0.9468771, -1.77991, 1, 1, 1, 1, 1,
-2.047246, -2.964011, -2.097765, 1, 1, 1, 1, 1,
-2.025048, 0.4360462, 1.012196, 1, 1, 1, 1, 1,
-2.020701, 0.8120835, -2.773767, 1, 1, 1, 1, 1,
-2.00676, -0.2805482, -0.1331861, 1, 1, 1, 1, 1,
-1.996047, -0.437676, -0.2683505, 0, 0, 1, 1, 1,
-1.974104, 1.117413, -1.973646, 1, 0, 0, 1, 1,
-1.96464, 1.452486, -0.3107058, 1, 0, 0, 1, 1,
-1.963558, 0.2700417, -1.982473, 1, 0, 0, 1, 1,
-1.937224, -0.1200895, -2.811011, 1, 0, 0, 1, 1,
-1.929454, -0.5247485, -2.25029, 1, 0, 0, 1, 1,
-1.919758, -1.349947, -0.9826238, 0, 0, 0, 1, 1,
-1.911223, -0.3610259, -1.944416, 0, 0, 0, 1, 1,
-1.906207, -0.8037763, -0.1024372, 0, 0, 0, 1, 1,
-1.900619, -1.018028, -0.9567489, 0, 0, 0, 1, 1,
-1.898261, -0.948163, -1.72723, 0, 0, 0, 1, 1,
-1.895429, -0.2579293, -2.167231, 0, 0, 0, 1, 1,
-1.879146, 1.33532, -0.6120208, 0, 0, 0, 1, 1,
-1.861788, -2.517924, -2.506487, 1, 1, 1, 1, 1,
-1.860226, -1.350652, -1.560182, 1, 1, 1, 1, 1,
-1.855371, 1.693007, 0.3777879, 1, 1, 1, 1, 1,
-1.851317, 1.377144, -1.022352, 1, 1, 1, 1, 1,
-1.826818, 0.190021, -1.107891, 1, 1, 1, 1, 1,
-1.822265, -0.8655739, -0.5392111, 1, 1, 1, 1, 1,
-1.814511, -0.2652436, 0.06250004, 1, 1, 1, 1, 1,
-1.805733, -0.4839844, -1.805165, 1, 1, 1, 1, 1,
-1.800434, 1.459228, -1.447811, 1, 1, 1, 1, 1,
-1.782435, 0.5639319, -0.9363512, 1, 1, 1, 1, 1,
-1.775981, 0.4536004, -2.055135, 1, 1, 1, 1, 1,
-1.775225, -0.9129674, -1.202673, 1, 1, 1, 1, 1,
-1.770903, -0.03058909, -2.47433, 1, 1, 1, 1, 1,
-1.769494, -0.09890019, -0.6778747, 1, 1, 1, 1, 1,
-1.742084, 0.5751277, -1.824152, 1, 1, 1, 1, 1,
-1.741137, -0.3317685, -0.2219018, 0, 0, 1, 1, 1,
-1.734276, -0.3539179, -1.370488, 1, 0, 0, 1, 1,
-1.709892, 1.322668, -1.946235, 1, 0, 0, 1, 1,
-1.707754, -0.8091508, -4.662333, 1, 0, 0, 1, 1,
-1.680188, 1.066065, -1.980449, 1, 0, 0, 1, 1,
-1.678512, 0.589981, -0.5053883, 1, 0, 0, 1, 1,
-1.67143, -1.156091, -2.096529, 0, 0, 0, 1, 1,
-1.667132, -0.2844839, -0.8169347, 0, 0, 0, 1, 1,
-1.666809, -0.3321127, -2.241697, 0, 0, 0, 1, 1,
-1.665165, 0.6549193, -2.233936, 0, 0, 0, 1, 1,
-1.660097, 0.492887, -1.617866, 0, 0, 0, 1, 1,
-1.639312, 1.157632, -1.454682, 0, 0, 0, 1, 1,
-1.63431, -0.06921653, -1.335852, 0, 0, 0, 1, 1,
-1.632824, -0.1607308, -4.035041, 1, 1, 1, 1, 1,
-1.63137, 0.04042353, -2.607814, 1, 1, 1, 1, 1,
-1.614768, -0.535403, -1.372365, 1, 1, 1, 1, 1,
-1.614195, 0.5151658, -1.902663, 1, 1, 1, 1, 1,
-1.613674, -0.7655155, -0.09825558, 1, 1, 1, 1, 1,
-1.611828, -0.2120533, -2.464208, 1, 1, 1, 1, 1,
-1.606924, 0.5132899, -2.951468, 1, 1, 1, 1, 1,
-1.602192, -1.545751, -0.0557826, 1, 1, 1, 1, 1,
-1.57904, 0.5119597, -0.894805, 1, 1, 1, 1, 1,
-1.57488, -0.1901468, -2.235272, 1, 1, 1, 1, 1,
-1.561158, -0.2805596, -1.658066, 1, 1, 1, 1, 1,
-1.552727, -1.269961, -3.548741, 1, 1, 1, 1, 1,
-1.551371, 0.927698, -2.113927, 1, 1, 1, 1, 1,
-1.539582, -0.5435697, -0.659476, 1, 1, 1, 1, 1,
-1.514974, -0.07035693, -2.360016, 1, 1, 1, 1, 1,
-1.512923, -0.2773215, -2.389982, 0, 0, 1, 1, 1,
-1.509088, 0.5528464, 0.4502276, 1, 0, 0, 1, 1,
-1.496316, 0.9319179, -3.060486, 1, 0, 0, 1, 1,
-1.494743, -1.555575, -3.556813, 1, 0, 0, 1, 1,
-1.492361, -0.1248903, -0.6133046, 1, 0, 0, 1, 1,
-1.486596, 0.09447706, -1.208138, 1, 0, 0, 1, 1,
-1.482803, 0.8602242, -1.019403, 0, 0, 0, 1, 1,
-1.480084, 0.3738234, -1.414702, 0, 0, 0, 1, 1,
-1.465437, 2.045756, -0.2444633, 0, 0, 0, 1, 1,
-1.464888, -0.08679238, -2.246851, 0, 0, 0, 1, 1,
-1.459592, 0.06777193, -0.7525489, 0, 0, 0, 1, 1,
-1.459466, -1.308307, -3.363205, 0, 0, 0, 1, 1,
-1.456785, -2.16016, -2.95681, 0, 0, 0, 1, 1,
-1.44751, -0.4503808, -2.917452, 1, 1, 1, 1, 1,
-1.4409, 0.1645995, -2.242561, 1, 1, 1, 1, 1,
-1.436106, -1.394677, -3.37476, 1, 1, 1, 1, 1,
-1.429152, 0.3038936, -1.318984, 1, 1, 1, 1, 1,
-1.427646, -0.5291283, -0.8367812, 1, 1, 1, 1, 1,
-1.422769, 0.9433405, -0.9449433, 1, 1, 1, 1, 1,
-1.422423, -0.673251, -2.87835, 1, 1, 1, 1, 1,
-1.419758, -0.183826, -2.194507, 1, 1, 1, 1, 1,
-1.419022, -0.1444065, -2.164815, 1, 1, 1, 1, 1,
-1.413203, 0.555871, -1.065669, 1, 1, 1, 1, 1,
-1.397431, -0.4634651, -2.936445, 1, 1, 1, 1, 1,
-1.39677, 0.1554116, -0.9449203, 1, 1, 1, 1, 1,
-1.390597, -1.409026, -0.9175425, 1, 1, 1, 1, 1,
-1.381717, 0.07558166, -1.420623, 1, 1, 1, 1, 1,
-1.379921, -2.249095, -3.999988, 1, 1, 1, 1, 1,
-1.354663, -0.03472946, -1.189429, 0, 0, 1, 1, 1,
-1.350888, -1.615701, -1.478537, 1, 0, 0, 1, 1,
-1.346634, -1.052594, -2.013557, 1, 0, 0, 1, 1,
-1.33891, 0.2406581, -0.4395359, 1, 0, 0, 1, 1,
-1.337515, 0.3895074, -1.900724, 1, 0, 0, 1, 1,
-1.332821, 1.654675, -1.439753, 1, 0, 0, 1, 1,
-1.32819, -0.9341976, -3.144811, 0, 0, 0, 1, 1,
-1.327559, -1.610884, -1.732255, 0, 0, 0, 1, 1,
-1.327291, -0.3474301, -0.8816388, 0, 0, 0, 1, 1,
-1.324741, -0.7703828, -2.438106, 0, 0, 0, 1, 1,
-1.323377, 0.8419172, -2.676686, 0, 0, 0, 1, 1,
-1.315238, -0.1104006, -2.189415, 0, 0, 0, 1, 1,
-1.314959, 0.374567, -2.106133, 0, 0, 0, 1, 1,
-1.301818, 1.294641, -0.932324, 1, 1, 1, 1, 1,
-1.299999, -0.6488017, -1.776308, 1, 1, 1, 1, 1,
-1.292662, -0.1654286, -3.051174, 1, 1, 1, 1, 1,
-1.273449, -1.811492, -3.430968, 1, 1, 1, 1, 1,
-1.272759, 1.893579, 0.9185244, 1, 1, 1, 1, 1,
-1.26613, 0.2686519, -1.727774, 1, 1, 1, 1, 1,
-1.26459, 1.405067, -0.9695336, 1, 1, 1, 1, 1,
-1.258612, 0.4050037, -3.516881, 1, 1, 1, 1, 1,
-1.25013, 1.285425, -1.109103, 1, 1, 1, 1, 1,
-1.244693, 2.034899, 0.505522, 1, 1, 1, 1, 1,
-1.237232, -0.0009346379, 0.09470232, 1, 1, 1, 1, 1,
-1.231569, 1.410785, -2.057974, 1, 1, 1, 1, 1,
-1.220151, 0.418629, -1.788766, 1, 1, 1, 1, 1,
-1.205571, -0.09359132, 0.01009969, 1, 1, 1, 1, 1,
-1.202633, 0.3585849, -0.4189226, 1, 1, 1, 1, 1,
-1.197455, -0.1295648, 0.755554, 0, 0, 1, 1, 1,
-1.196822, -0.3683467, -0.357018, 1, 0, 0, 1, 1,
-1.196784, -0.8050561, -1.460489, 1, 0, 0, 1, 1,
-1.186169, 0.4993578, -1.471064, 1, 0, 0, 1, 1,
-1.182797, -1.064612, -1.360709, 1, 0, 0, 1, 1,
-1.171554, -2.562703, -1.920512, 1, 0, 0, 1, 1,
-1.171461, 1.391392, 0.28357, 0, 0, 0, 1, 1,
-1.165718, -0.5666625, -2.000098, 0, 0, 0, 1, 1,
-1.162308, 1.246877, -1.469608, 0, 0, 0, 1, 1,
-1.152136, 0.4437657, -1.912433, 0, 0, 0, 1, 1,
-1.150407, 0.8087012, -0.7679467, 0, 0, 0, 1, 1,
-1.138817, 1.927742, -1.444197, 0, 0, 0, 1, 1,
-1.126623, 0.7313401, -1.265356, 0, 0, 0, 1, 1,
-1.121534, -0.7722627, -0.1071773, 1, 1, 1, 1, 1,
-1.117408, -1.478143, -1.974165, 1, 1, 1, 1, 1,
-1.109703, 1.01421, -0.8873699, 1, 1, 1, 1, 1,
-1.10564, -0.4894914, -2.615701, 1, 1, 1, 1, 1,
-1.091548, 0.2874462, -0.5194982, 1, 1, 1, 1, 1,
-1.087216, 0.1544867, -0.5191634, 1, 1, 1, 1, 1,
-1.079426, 0.5048995, -1.413274, 1, 1, 1, 1, 1,
-1.073101, 0.4529664, -2.947602, 1, 1, 1, 1, 1,
-1.061182, -0.7009585, -2.379266, 1, 1, 1, 1, 1,
-1.058491, 1.373836, -1.316576, 1, 1, 1, 1, 1,
-1.046148, 1.949173, -0.1305056, 1, 1, 1, 1, 1,
-1.045496, -1.796565, -2.052886, 1, 1, 1, 1, 1,
-1.032903, 1.713403, 0.8914546, 1, 1, 1, 1, 1,
-1.031784, 1.226526, -1.459879, 1, 1, 1, 1, 1,
-1.031411, 0.09488967, -1.493502, 1, 1, 1, 1, 1,
-1.025746, -0.6726425, -1.13377, 0, 0, 1, 1, 1,
-1.021447, 0.3291636, -2.652486, 1, 0, 0, 1, 1,
-1.019711, 0.9362361, -0.07007448, 1, 0, 0, 1, 1,
-1.011787, -0.9108213, -2.609108, 1, 0, 0, 1, 1,
-1.010929, 0.08151682, -1.989977, 1, 0, 0, 1, 1,
-1.010256, 0.3237641, 0.08878964, 1, 0, 0, 1, 1,
-1.010131, 0.1837154, -2.452349, 0, 0, 0, 1, 1,
-0.9801796, -1.164538, -2.447817, 0, 0, 0, 1, 1,
-0.97912, -0.6289588, -2.649847, 0, 0, 0, 1, 1,
-0.9773546, 0.301099, 0.4917005, 0, 0, 0, 1, 1,
-0.9752591, -0.1847547, -1.386235, 0, 0, 0, 1, 1,
-0.9709749, 0.007804375, -1.081757, 0, 0, 0, 1, 1,
-0.9687499, -0.01274724, -2.158881, 0, 0, 0, 1, 1,
-0.965205, 0.1769056, -0.2837547, 1, 1, 1, 1, 1,
-0.9627731, 0.5341272, -3.230286, 1, 1, 1, 1, 1,
-0.9513951, -1.381613, -2.283154, 1, 1, 1, 1, 1,
-0.9460279, 1.630437, 0.14354, 1, 1, 1, 1, 1,
-0.9419477, -2.226285, -3.652037, 1, 1, 1, 1, 1,
-0.9408534, -1.31447, -1.20156, 1, 1, 1, 1, 1,
-0.9401419, -0.1258074, 0.08554672, 1, 1, 1, 1, 1,
-0.9372048, -0.2371045, -1.242182, 1, 1, 1, 1, 1,
-0.9321945, -0.1181832, -0.5426331, 1, 1, 1, 1, 1,
-0.930543, 0.2912665, -0.3874918, 1, 1, 1, 1, 1,
-0.92736, -0.3797661, -3.317708, 1, 1, 1, 1, 1,
-0.9174815, -0.8917776, -1.175654, 1, 1, 1, 1, 1,
-0.9160811, 0.3648279, -1.877009, 1, 1, 1, 1, 1,
-0.9119903, 0.8035966, -0.8963791, 1, 1, 1, 1, 1,
-0.9119012, -0.1106407, -2.262927, 1, 1, 1, 1, 1,
-0.9096099, -0.675658, -3.13855, 0, 0, 1, 1, 1,
-0.9093724, 2.083402, 0.5089452, 1, 0, 0, 1, 1,
-0.9092575, -0.6741861, -2.36263, 1, 0, 0, 1, 1,
-0.9044796, -0.1006963, -1.725032, 1, 0, 0, 1, 1,
-0.9008619, 0.8358021, -1.95972, 1, 0, 0, 1, 1,
-0.8919895, -1.592093, -3.172145, 1, 0, 0, 1, 1,
-0.8874822, -0.3193351, -2.306596, 0, 0, 0, 1, 1,
-0.8868781, 1.139733, 0.553142, 0, 0, 0, 1, 1,
-0.8868147, -1.141018, -1.444699, 0, 0, 0, 1, 1,
-0.881355, 2.563616, -1.15004, 0, 0, 0, 1, 1,
-0.8768638, -0.5864401, -5.238183, 0, 0, 0, 1, 1,
-0.8737113, 0.08202016, -2.887255, 0, 0, 0, 1, 1,
-0.8730163, -0.7549779, -2.938249, 0, 0, 0, 1, 1,
-0.8727172, -0.5308628, -1.163201, 1, 1, 1, 1, 1,
-0.8712274, 0.9949132, -0.06960505, 1, 1, 1, 1, 1,
-0.8687134, 0.5879566, -1.490259, 1, 1, 1, 1, 1,
-0.8672223, -0.01698318, -2.222843, 1, 1, 1, 1, 1,
-0.8669312, -1.27458, -2.088025, 1, 1, 1, 1, 1,
-0.8652612, 0.5655708, 0.3058277, 1, 1, 1, 1, 1,
-0.8614929, 0.7502093, -1.787571, 1, 1, 1, 1, 1,
-0.8609178, 0.3838637, -0.4361131, 1, 1, 1, 1, 1,
-0.858473, 0.7964588, -3.259333, 1, 1, 1, 1, 1,
-0.8532228, -0.2887346, -3.860099, 1, 1, 1, 1, 1,
-0.8470471, -1.492065, -2.495757, 1, 1, 1, 1, 1,
-0.8324305, 0.2729943, 0.2426176, 1, 1, 1, 1, 1,
-0.8295067, 0.370906, -0.6240293, 1, 1, 1, 1, 1,
-0.8261693, 0.7862749, 0.206544, 1, 1, 1, 1, 1,
-0.8227512, 0.3538021, -1.895576, 1, 1, 1, 1, 1,
-0.8225786, 0.4875548, -2.066865, 0, 0, 1, 1, 1,
-0.8173026, 0.944302, -1.988827, 1, 0, 0, 1, 1,
-0.8137006, -1.135018, -3.692642, 1, 0, 0, 1, 1,
-0.8008235, -0.2080169, -3.533272, 1, 0, 0, 1, 1,
-0.7964514, -1.342548, -1.935068, 1, 0, 0, 1, 1,
-0.7848411, -1.381837, -3.244062, 1, 0, 0, 1, 1,
-0.7825587, -0.6810929, -2.375142, 0, 0, 0, 1, 1,
-0.7695668, 1.880897, -0.8395104, 0, 0, 0, 1, 1,
-0.7666118, -0.6947599, -1.677516, 0, 0, 0, 1, 1,
-0.7513593, 1.512686, -0.7865908, 0, 0, 0, 1, 1,
-0.7512093, 0.6147373, -1.059304, 0, 0, 0, 1, 1,
-0.748971, 0.7890898, -1.282409, 0, 0, 0, 1, 1,
-0.7412285, 1.775228, -0.6690609, 0, 0, 0, 1, 1,
-0.7409744, -1.137092, -2.540745, 1, 1, 1, 1, 1,
-0.7351516, 0.8283248, -0.3100306, 1, 1, 1, 1, 1,
-0.7316747, -0.5331319, -2.855486, 1, 1, 1, 1, 1,
-0.7293532, 0.9651958, -1.109294, 1, 1, 1, 1, 1,
-0.7186233, -0.5387104, -2.43857, 1, 1, 1, 1, 1,
-0.714434, 1.044482, 0.163539, 1, 1, 1, 1, 1,
-0.7138337, -0.3257109, -2.574258, 1, 1, 1, 1, 1,
-0.7134435, -0.39035, -2.467848, 1, 1, 1, 1, 1,
-0.7098015, 1.184643, -0.9341923, 1, 1, 1, 1, 1,
-0.706355, 0.4523771, -2.692619, 1, 1, 1, 1, 1,
-0.7040113, -0.4034638, -1.965628, 1, 1, 1, 1, 1,
-0.7034398, 1.085047, -1.702312, 1, 1, 1, 1, 1,
-0.7009521, 2.468864, 0.05886753, 1, 1, 1, 1, 1,
-0.6994544, -0.8608044, -1.570851, 1, 1, 1, 1, 1,
-0.6986379, -1.3323, -2.152889, 1, 1, 1, 1, 1,
-0.6817049, 0.9691455, 0.7662757, 0, 0, 1, 1, 1,
-0.681626, 0.718033, -0.4301692, 1, 0, 0, 1, 1,
-0.6815203, -0.8436104, -2.055116, 1, 0, 0, 1, 1,
-0.68081, -0.2390521, -0.7710523, 1, 0, 0, 1, 1,
-0.6807252, -2.149481, -1.486616, 1, 0, 0, 1, 1,
-0.6757063, -0.1661626, -1.73208, 1, 0, 0, 1, 1,
-0.6715494, 1.050803, -0.4678526, 0, 0, 0, 1, 1,
-0.6698189, -0.9053272, -2.248304, 0, 0, 0, 1, 1,
-0.6665652, 0.6550554, -0.8438451, 0, 0, 0, 1, 1,
-0.6633477, 0.7873461, 0.6297703, 0, 0, 0, 1, 1,
-0.657446, 0.7983705, -0.363633, 0, 0, 0, 1, 1,
-0.6565188, 1.448469, -0.151719, 0, 0, 0, 1, 1,
-0.6493585, 0.02407151, -1.960899, 0, 0, 0, 1, 1,
-0.6433226, 0.4056321, -0.6787223, 1, 1, 1, 1, 1,
-0.6374971, 0.6540332, -1.405987, 1, 1, 1, 1, 1,
-0.6335014, -0.969936, -0.5506253, 1, 1, 1, 1, 1,
-0.6326528, 0.7207001, -0.6633834, 1, 1, 1, 1, 1,
-0.6303149, -0.4543806, -2.876277, 1, 1, 1, 1, 1,
-0.6276768, 0.6664255, -1.339949, 1, 1, 1, 1, 1,
-0.6248769, 0.496478, -1.402821, 1, 1, 1, 1, 1,
-0.6218807, 0.5852447, -3.439166, 1, 1, 1, 1, 1,
-0.621532, -0.5577743, -3.441502, 1, 1, 1, 1, 1,
-0.6210645, 0.3073356, -1.965961, 1, 1, 1, 1, 1,
-0.6203649, 0.1663896, -2.085785, 1, 1, 1, 1, 1,
-0.6190567, -1.35912, -2.50007, 1, 1, 1, 1, 1,
-0.6115422, 0.01855531, -2.149688, 1, 1, 1, 1, 1,
-0.6040267, -0.283506, -2.555801, 1, 1, 1, 1, 1,
-0.6025586, -0.648528, -1.653865, 1, 1, 1, 1, 1,
-0.6021968, -0.5238731, -1.78864, 0, 0, 1, 1, 1,
-0.5949299, -0.3855276, -2.480293, 1, 0, 0, 1, 1,
-0.5929706, 0.6863611, -1.007711, 1, 0, 0, 1, 1,
-0.5884312, 0.1127005, -0.7776668, 1, 0, 0, 1, 1,
-0.5879, -2.136071, -2.92357, 1, 0, 0, 1, 1,
-0.5849227, -0.5090067, -2.8155, 1, 0, 0, 1, 1,
-0.5838164, 1.12894, 0.2627869, 0, 0, 0, 1, 1,
-0.5832022, 1.514612, -0.9465799, 0, 0, 0, 1, 1,
-0.5775118, 1.049353, -0.6150943, 0, 0, 0, 1, 1,
-0.5737815, -0.4315612, -3.384382, 0, 0, 0, 1, 1,
-0.5716506, 0.06356454, -0.4712934, 0, 0, 0, 1, 1,
-0.570716, 0.8101432, -0.3612031, 0, 0, 0, 1, 1,
-0.5678234, -0.719548, -2.361569, 0, 0, 0, 1, 1,
-0.5640915, 0.3998657, -0.5305315, 1, 1, 1, 1, 1,
-0.5610263, -0.136046, -1.615108, 1, 1, 1, 1, 1,
-0.5610055, -0.596813, -0.7138968, 1, 1, 1, 1, 1,
-0.5598758, 1.517038, -1.181228, 1, 1, 1, 1, 1,
-0.5583228, -0.23905, -2.056755, 1, 1, 1, 1, 1,
-0.5569553, -2.164325, -4.037268, 1, 1, 1, 1, 1,
-0.5496494, 0.6281987, 0.2920232, 1, 1, 1, 1, 1,
-0.5488749, -2.290272, -2.442785, 1, 1, 1, 1, 1,
-0.5435809, 0.4115957, -0.3878664, 1, 1, 1, 1, 1,
-0.5427381, -1.570947, -2.707518, 1, 1, 1, 1, 1,
-0.5308015, -1.12436, -1.660127, 1, 1, 1, 1, 1,
-0.5302236, -0.9681718, -2.028244, 1, 1, 1, 1, 1,
-0.52749, 1.926457, -0.769537, 1, 1, 1, 1, 1,
-0.5273623, 2.72434, 0.5282751, 1, 1, 1, 1, 1,
-0.5266482, 2.746073, -0.1478917, 1, 1, 1, 1, 1,
-0.524774, -0.2429266, -2.827332, 0, 0, 1, 1, 1,
-0.5232897, 0.7340297, -1.028106, 1, 0, 0, 1, 1,
-0.5217845, 0.3416261, -0.04630748, 1, 0, 0, 1, 1,
-0.5200735, 0.2203532, -1.674977, 1, 0, 0, 1, 1,
-0.5190151, -0.3689387, -3.088895, 1, 0, 0, 1, 1,
-0.5184921, 0.3781583, -1.127396, 1, 0, 0, 1, 1,
-0.5139536, -1.517941, -4.472332, 0, 0, 0, 1, 1,
-0.50837, 0.654655, -0.3437108, 0, 0, 0, 1, 1,
-0.5010703, 0.151183, 0.6902122, 0, 0, 0, 1, 1,
-0.4993769, 1.142953, 0.4949552, 0, 0, 0, 1, 1,
-0.4978037, 0.7477192, -0.379412, 0, 0, 0, 1, 1,
-0.4956039, -0.4551749, -3.255886, 0, 0, 0, 1, 1,
-0.4928204, -0.1425413, -1.108268, 0, 0, 0, 1, 1,
-0.4915067, 0.4350856, -0.5226219, 1, 1, 1, 1, 1,
-0.490198, -0.2914763, -2.636124, 1, 1, 1, 1, 1,
-0.4880445, 0.858041, -0.6671559, 1, 1, 1, 1, 1,
-0.4839157, -0.1265653, -2.03165, 1, 1, 1, 1, 1,
-0.479351, 0.6387053, -0.8485926, 1, 1, 1, 1, 1,
-0.4709529, 0.04518609, -2.01075, 1, 1, 1, 1, 1,
-0.4693069, 0.648812, 0.4794804, 1, 1, 1, 1, 1,
-0.4683037, 0.1613036, -1.517449, 1, 1, 1, 1, 1,
-0.4625858, 0.8002348, -0.7043391, 1, 1, 1, 1, 1,
-0.4602618, 0.9728026, -0.56522, 1, 1, 1, 1, 1,
-0.4579767, -0.5289509, -2.805896, 1, 1, 1, 1, 1,
-0.4574382, 1.79282, -0.9677747, 1, 1, 1, 1, 1,
-0.4560793, -0.06222836, -1.313516, 1, 1, 1, 1, 1,
-0.4511236, -2.897992, -3.154054, 1, 1, 1, 1, 1,
-0.44902, 0.2695132, -1.428839, 1, 1, 1, 1, 1,
-0.4385537, 0.7116933, -0.3555343, 0, 0, 1, 1, 1,
-0.4352505, -0.565552, 0.3658996, 1, 0, 0, 1, 1,
-0.4335217, -0.487856, -1.955485, 1, 0, 0, 1, 1,
-0.4299406, 1.413267, 1.012886, 1, 0, 0, 1, 1,
-0.4257991, -0.1485859, -0.7815443, 1, 0, 0, 1, 1,
-0.4250349, -0.3019121, -2.192951, 1, 0, 0, 1, 1,
-0.4211138, -0.1227382, -1.707228, 0, 0, 0, 1, 1,
-0.4161001, -0.4053019, -1.450933, 0, 0, 0, 1, 1,
-0.4047546, 2.04065, -0.4162112, 0, 0, 0, 1, 1,
-0.4031945, -0.5337145, -2.305018, 0, 0, 0, 1, 1,
-0.4020135, 0.2490721, -1.527734, 0, 0, 0, 1, 1,
-0.4012037, 0.2840761, -0.9112915, 0, 0, 0, 1, 1,
-0.3996802, 0.2766983, 0.8401939, 0, 0, 0, 1, 1,
-0.398035, -1.601681, -2.254473, 1, 1, 1, 1, 1,
-0.3979706, 1.444057, -1.371809, 1, 1, 1, 1, 1,
-0.3959424, 1.83727, 1.25198, 1, 1, 1, 1, 1,
-0.3887787, -0.8403745, -3.43743, 1, 1, 1, 1, 1,
-0.3876831, 1.154653, 0.09517987, 1, 1, 1, 1, 1,
-0.3876214, 0.6867694, -1.310421, 1, 1, 1, 1, 1,
-0.3835516, -0.0293803, -3.604699, 1, 1, 1, 1, 1,
-0.3834058, -0.8770921, -2.601619, 1, 1, 1, 1, 1,
-0.3820421, 1.076779, -0.6052122, 1, 1, 1, 1, 1,
-0.381938, -1.564549, -1.772128, 1, 1, 1, 1, 1,
-0.3787994, 0.726805, -1.793865, 1, 1, 1, 1, 1,
-0.3785205, -1.482149, -4.605536, 1, 1, 1, 1, 1,
-0.3767641, 0.6752818, 0.3252253, 1, 1, 1, 1, 1,
-0.3759316, -0.6752771, -4.418948, 1, 1, 1, 1, 1,
-0.3742045, -0.8989738, -1.492719, 1, 1, 1, 1, 1,
-0.3699238, 1.27706, -1.561976, 0, 0, 1, 1, 1,
-0.3665032, 2.463606, -0.2252305, 1, 0, 0, 1, 1,
-0.3626313, 0.7488694, 0.693123, 1, 0, 0, 1, 1,
-0.3609206, 0.4318707, -1.774776, 1, 0, 0, 1, 1,
-0.3604254, -0.2267936, -1.11984, 1, 0, 0, 1, 1,
-0.3587658, 0.1027995, 0.1127521, 1, 0, 0, 1, 1,
-0.3555345, -1.521053, -1.440609, 0, 0, 0, 1, 1,
-0.3549873, -2.465766, -4.089736, 0, 0, 0, 1, 1,
-0.3539459, -0.4506025, -1.31507, 0, 0, 0, 1, 1,
-0.3505784, -0.8647377, -1.690744, 0, 0, 0, 1, 1,
-0.3502807, 0.7043105, -1.373839, 0, 0, 0, 1, 1,
-0.3467263, 1.492179, 0.3354867, 0, 0, 0, 1, 1,
-0.3466675, 0.0135212, -1.96301, 0, 0, 0, 1, 1,
-0.3438511, -0.8223717, -3.137139, 1, 1, 1, 1, 1,
-0.3432051, -0.05076891, -1.497063, 1, 1, 1, 1, 1,
-0.33973, -1.259772, -2.598098, 1, 1, 1, 1, 1,
-0.3374021, 0.6268661, -0.2404616, 1, 1, 1, 1, 1,
-0.3358024, -0.2501742, -3.11842, 1, 1, 1, 1, 1,
-0.3315895, -0.3314514, -1.951051, 1, 1, 1, 1, 1,
-0.3310028, -0.2554451, -2.504751, 1, 1, 1, 1, 1,
-0.3253754, 0.7808397, 0.8964236, 1, 1, 1, 1, 1,
-0.3205914, 1.334133, -0.2954534, 1, 1, 1, 1, 1,
-0.3179336, -0.85396, -1.70258, 1, 1, 1, 1, 1,
-0.3170299, 1.800375, 0.11528, 1, 1, 1, 1, 1,
-0.3139504, 0.5165762, 0.1920989, 1, 1, 1, 1, 1,
-0.3121219, -0.7042643, -3.357433, 1, 1, 1, 1, 1,
-0.3052517, -0.818826, -3.075898, 1, 1, 1, 1, 1,
-0.3047592, -1.22697, -2.482194, 1, 1, 1, 1, 1,
-0.3026946, 0.9619192, -0.3198505, 0, 0, 1, 1, 1,
-0.3019199, 0.3523538, -1.475312, 1, 0, 0, 1, 1,
-0.2981762, -0.6504164, -2.072119, 1, 0, 0, 1, 1,
-0.2870698, 0.6314166, 0.1419428, 1, 0, 0, 1, 1,
-0.2835728, 0.2648006, -0.9262791, 1, 0, 0, 1, 1,
-0.2812794, 0.4313106, -1.193087, 1, 0, 0, 1, 1,
-0.2799646, -1.093184, -2.281531, 0, 0, 0, 1, 1,
-0.2781529, 0.8366271, 0.06402499, 0, 0, 0, 1, 1,
-0.2741714, 0.6591429, 0.8804417, 0, 0, 0, 1, 1,
-0.2732469, -0.07547699, -2.125301, 0, 0, 0, 1, 1,
-0.2721742, 1.13881, 0.4085272, 0, 0, 0, 1, 1,
-0.2709727, -0.9971721, -0.3812149, 0, 0, 0, 1, 1,
-0.2702317, 0.07114408, -2.341816, 0, 0, 0, 1, 1,
-0.2689179, 0.5025337, 0.4824797, 1, 1, 1, 1, 1,
-0.268526, -1.074266, -4.010296, 1, 1, 1, 1, 1,
-0.2669271, 0.5106559, 0.08708533, 1, 1, 1, 1, 1,
-0.2622808, -0.75914, -3.144848, 1, 1, 1, 1, 1,
-0.2617844, 0.4386167, 0.5665396, 1, 1, 1, 1, 1,
-0.259551, 0.4060646, -0.7498382, 1, 1, 1, 1, 1,
-0.2593514, 0.3919674, -0.2226344, 1, 1, 1, 1, 1,
-0.2589826, -0.7360157, -2.502838, 1, 1, 1, 1, 1,
-0.2579743, -0.4880145, -2.919922, 1, 1, 1, 1, 1,
-0.256844, 0.4787965, 0.1211896, 1, 1, 1, 1, 1,
-0.253275, -1.197393, -4.971407, 1, 1, 1, 1, 1,
-0.2530861, -0.09636433, -1.984949, 1, 1, 1, 1, 1,
-0.2525946, 0.277157, 0.02007144, 1, 1, 1, 1, 1,
-0.2496307, 1.587554, 0.01618243, 1, 1, 1, 1, 1,
-0.2471028, 0.6310592, -0.6666771, 1, 1, 1, 1, 1,
-0.2469831, -2.046963, -2.999179, 0, 0, 1, 1, 1,
-0.242596, -0.04295646, -1.391489, 1, 0, 0, 1, 1,
-0.2424081, -0.8262032, -2.855087, 1, 0, 0, 1, 1,
-0.2422678, 1.241677, -0.7356883, 1, 0, 0, 1, 1,
-0.2422538, -0.1806501, -3.005112, 1, 0, 0, 1, 1,
-0.2417912, 0.9881694, 1.750834, 1, 0, 0, 1, 1,
-0.2412296, 0.651976, -0.6648117, 0, 0, 0, 1, 1,
-0.2383342, 1.169129, 1.487214, 0, 0, 0, 1, 1,
-0.2344075, -0.05371756, -0.4963524, 0, 0, 0, 1, 1,
-0.2277627, 0.9093889, 1.784698, 0, 0, 0, 1, 1,
-0.2267259, 1.633143, 0.06822533, 0, 0, 0, 1, 1,
-0.2258766, 1.333129, -0.06611407, 0, 0, 0, 1, 1,
-0.223529, -0.5994265, -3.845879, 0, 0, 0, 1, 1,
-0.2185687, 0.5984912, -0.2783712, 1, 1, 1, 1, 1,
-0.2181263, 0.827767, -0.7728869, 1, 1, 1, 1, 1,
-0.2158311, -0.1170885, -1.309286, 1, 1, 1, 1, 1,
-0.2147336, -0.4850823, -0.98122, 1, 1, 1, 1, 1,
-0.2081467, -2.86679, -4.564406, 1, 1, 1, 1, 1,
-0.2079891, 0.2836871, 0.3229693, 1, 1, 1, 1, 1,
-0.2055417, 0.2972809, -1.521979, 1, 1, 1, 1, 1,
-0.203677, 0.0848444, -0.1065214, 1, 1, 1, 1, 1,
-0.2028379, -0.4592162, -2.494714, 1, 1, 1, 1, 1,
-0.1957034, -1.029025, -3.093037, 1, 1, 1, 1, 1,
-0.1850652, 0.5114198, 0.03404004, 1, 1, 1, 1, 1,
-0.1824727, -1.075336, -2.453652, 1, 1, 1, 1, 1,
-0.182359, 0.5032647, -0.1816927, 1, 1, 1, 1, 1,
-0.1773872, 0.2491227, -2.354583, 1, 1, 1, 1, 1,
-0.1756831, -0.8241833, -2.05804, 1, 1, 1, 1, 1,
-0.1694856, -1.818467, -2.505518, 0, 0, 1, 1, 1,
-0.1691435, -1.82162, -4.696455, 1, 0, 0, 1, 1,
-0.1591815, -0.6412618, -3.478213, 1, 0, 0, 1, 1,
-0.1585632, -0.6528881, -2.290978, 1, 0, 0, 1, 1,
-0.1570609, -1.579649, -2.513894, 1, 0, 0, 1, 1,
-0.156862, 0.006889061, -1.152479, 1, 0, 0, 1, 1,
-0.1564629, 0.09716494, 0.5717588, 0, 0, 0, 1, 1,
-0.1561818, 0.5128912, 1.04929, 0, 0, 0, 1, 1,
-0.1540593, 0.5678523, -0.3737678, 0, 0, 0, 1, 1,
-0.1510176, 1.594421, -0.3314446, 0, 0, 0, 1, 1,
-0.1480102, 0.9546278, -1.794392, 0, 0, 0, 1, 1,
-0.1475668, -0.3068368, -2.901382, 0, 0, 0, 1, 1,
-0.1455387, 2.364692, -0.07983059, 0, 0, 0, 1, 1,
-0.1418896, 2.178647, 1.370561, 1, 1, 1, 1, 1,
-0.1417643, -1.05306, -1.559953, 1, 1, 1, 1, 1,
-0.1355221, -0.4750216, -2.873784, 1, 1, 1, 1, 1,
-0.1253849, 0.243504, -1.397726, 1, 1, 1, 1, 1,
-0.1224813, 0.5958257, -2.760002, 1, 1, 1, 1, 1,
-0.1219743, -0.3786252, -2.391443, 1, 1, 1, 1, 1,
-0.1196018, 1.612926, -0.1334398, 1, 1, 1, 1, 1,
-0.1159897, -0.8314635, -4.430432, 1, 1, 1, 1, 1,
-0.1069049, 0.1435004, -0.1971216, 1, 1, 1, 1, 1,
-0.1045225, -1.187191, -2.838038, 1, 1, 1, 1, 1,
-0.1002835, 0.8864874, 1.15201, 1, 1, 1, 1, 1,
-0.1001953, 0.4449458, -0.3065652, 1, 1, 1, 1, 1,
-0.0968539, -1.494146, -2.859548, 1, 1, 1, 1, 1,
-0.09600981, 2.672472, 1.021891, 1, 1, 1, 1, 1,
-0.09492302, -0.8166692, -1.948412, 1, 1, 1, 1, 1,
-0.09393707, -0.4798543, -2.482679, 0, 0, 1, 1, 1,
-0.09057601, -0.2707861, -3.300522, 1, 0, 0, 1, 1,
-0.09035674, -1.194685, -3.721992, 1, 0, 0, 1, 1,
-0.08981477, 0.8678132, 0.9847972, 1, 0, 0, 1, 1,
-0.08880317, -2.278591, -3.564968, 1, 0, 0, 1, 1,
-0.08638619, 0.1874553, 0.9103445, 1, 0, 0, 1, 1,
-0.08191258, -0.2574222, -1.934916, 0, 0, 0, 1, 1,
-0.07943729, 0.4964924, 0.5073781, 0, 0, 0, 1, 1,
-0.07615202, -0.3218195, -1.530799, 0, 0, 0, 1, 1,
-0.07354477, -2.100009, -3.482756, 0, 0, 0, 1, 1,
-0.07222377, 0.6814547, 1.76314, 0, 0, 0, 1, 1,
-0.07217667, -0.2973611, -2.663572, 0, 0, 0, 1, 1,
-0.06465627, -0.1420552, -2.682927, 0, 0, 0, 1, 1,
-0.06127621, 1.830241, -0.523499, 1, 1, 1, 1, 1,
-0.06047237, -0.4708498, -2.78103, 1, 1, 1, 1, 1,
-0.05719772, -1.107473, -2.424177, 1, 1, 1, 1, 1,
-0.05430251, -0.1477303, -1.794723, 1, 1, 1, 1, 1,
-0.05391295, 1.036701, -0.1272201, 1, 1, 1, 1, 1,
-0.05344801, -0.9982746, -4.890651, 1, 1, 1, 1, 1,
-0.05297812, 0.006329712, -0.7675588, 1, 1, 1, 1, 1,
-0.05292044, 0.1285562, 1.068089, 1, 1, 1, 1, 1,
-0.04376675, -0.6935925, -2.936753, 1, 1, 1, 1, 1,
-0.04031331, -1.676752, -1.873765, 1, 1, 1, 1, 1,
-0.03924056, -0.4885694, -2.34615, 1, 1, 1, 1, 1,
-0.03906199, -0.3392211, -5.037207, 1, 1, 1, 1, 1,
-0.03905141, 0.6557189, 0.5232637, 1, 1, 1, 1, 1,
-0.03903465, 0.1700795, -1.256616, 1, 1, 1, 1, 1,
-0.03456566, 0.039843, -0.764863, 1, 1, 1, 1, 1,
-0.03267008, 0.2437995, 2.219217, 0, 0, 1, 1, 1,
-0.03264641, -0.2509857, -1.672256, 1, 0, 0, 1, 1,
-0.02728916, -0.8479039, -3.044936, 1, 0, 0, 1, 1,
-0.0255592, -0.2014336, -3.09972, 1, 0, 0, 1, 1,
-0.02184853, 0.6283063, -0.2466515, 1, 0, 0, 1, 1,
-0.01787874, 0.8564401, -0.2574959, 1, 0, 0, 1, 1,
-0.01752022, 0.5013177, 0.4850304, 0, 0, 0, 1, 1,
-0.0171539, -1.4096, -2.847325, 0, 0, 0, 1, 1,
-0.01176462, -1.203654, -1.682831, 0, 0, 0, 1, 1,
-0.009652921, -0.2823934, -2.737519, 0, 0, 0, 1, 1,
-0.009313366, 0.6978991, -1.207367, 0, 0, 0, 1, 1,
-0.004465311, -1.065083, -2.515603, 0, 0, 0, 1, 1,
0.001001796, -0.01183035, 2.578, 0, 0, 0, 1, 1,
0.006467076, -0.2323513, 1.938199, 1, 1, 1, 1, 1,
0.01176904, 0.3369913, -0.6482624, 1, 1, 1, 1, 1,
0.01282796, 0.6958523, 0.4169699, 1, 1, 1, 1, 1,
0.01485405, 1.347049, -1.087476, 1, 1, 1, 1, 1,
0.01581253, -0.7983472, 3.716931, 1, 1, 1, 1, 1,
0.01593603, 0.1693646, 0.6167127, 1, 1, 1, 1, 1,
0.01730013, -0.3918831, 4.080658, 1, 1, 1, 1, 1,
0.02064265, 0.1665964, 0.4302638, 1, 1, 1, 1, 1,
0.0220252, -0.3286387, 3.739984, 1, 1, 1, 1, 1,
0.02234303, -2.411151, 3.572139, 1, 1, 1, 1, 1,
0.02973771, 2.015899, 0.5439747, 1, 1, 1, 1, 1,
0.02982444, 1.329335, -0.2606114, 1, 1, 1, 1, 1,
0.03502111, -1.792326, 4.038137, 1, 1, 1, 1, 1,
0.04185447, -0.3227664, 2.442812, 1, 1, 1, 1, 1,
0.04510418, 0.4674788, 0.8856127, 1, 1, 1, 1, 1,
0.04638101, 1.084898, 1.250536, 0, 0, 1, 1, 1,
0.05313255, 1.539143, -1.399795, 1, 0, 0, 1, 1,
0.0544994, 0.6813378, -0.8219758, 1, 0, 0, 1, 1,
0.05761789, 1.002348, 0.7355331, 1, 0, 0, 1, 1,
0.05976123, -0.4925804, 2.45915, 1, 0, 0, 1, 1,
0.06049611, 1.556077, 0.6412644, 1, 0, 0, 1, 1,
0.06194436, 0.3897521, -2.023178, 0, 0, 0, 1, 1,
0.06201473, 0.3649963, 1.419206, 0, 0, 0, 1, 1,
0.06386432, 0.1573097, -0.3506442, 0, 0, 0, 1, 1,
0.06458816, -1.744865, 3.551435, 0, 0, 0, 1, 1,
0.06472367, 0.01935622, 0.8758847, 0, 0, 0, 1, 1,
0.06479356, 2.914694, -0.0206626, 0, 0, 0, 1, 1,
0.06581125, -1.611855, 2.398293, 0, 0, 0, 1, 1,
0.06862117, -1.84258, 3.312205, 1, 1, 1, 1, 1,
0.07534812, -0.7003512, 1.927828, 1, 1, 1, 1, 1,
0.07702432, -0.1033439, -0.2991846, 1, 1, 1, 1, 1,
0.08096877, -0.8877978, 3.828966, 1, 1, 1, 1, 1,
0.08269547, -0.1927028, 3.473816, 1, 1, 1, 1, 1,
0.08355245, 0.3348941, 0.4621942, 1, 1, 1, 1, 1,
0.08432405, -0.09676511, 2.54549, 1, 1, 1, 1, 1,
0.08456293, -0.5649199, 2.938929, 1, 1, 1, 1, 1,
0.08460895, -0.2628507, 2.397384, 1, 1, 1, 1, 1,
0.08617744, 1.457908, -0.6438079, 1, 1, 1, 1, 1,
0.08758311, 1.187677, 0.3116817, 1, 1, 1, 1, 1,
0.09304504, 0.4071723, 0.4572307, 1, 1, 1, 1, 1,
0.09624853, -2.529067, 0.8853034, 1, 1, 1, 1, 1,
0.09647009, -0.4323127, 3.067706, 1, 1, 1, 1, 1,
0.09776071, -1.40296, 2.834731, 1, 1, 1, 1, 1,
0.09846515, 1.181711, 1.921943, 0, 0, 1, 1, 1,
0.09875082, -0.7467472, 2.905525, 1, 0, 0, 1, 1,
0.1018914, -1.190405, 2.407717, 1, 0, 0, 1, 1,
0.1033358, -0.04475734, 2.764889, 1, 0, 0, 1, 1,
0.1078107, 2.482511, -0.1555735, 1, 0, 0, 1, 1,
0.1090399, 0.3060244, 2.102678, 1, 0, 0, 1, 1,
0.1126566, -0.3649466, 2.876597, 0, 0, 0, 1, 1,
0.1168211, -0.6378962, 2.030062, 0, 0, 0, 1, 1,
0.1191978, 0.6003978, 1.159172, 0, 0, 0, 1, 1,
0.1196618, 0.798225, -1.239793, 0, 0, 0, 1, 1,
0.1218643, 0.4823452, 0.9960108, 0, 0, 0, 1, 1,
0.1223976, -0.3931768, 1.955826, 0, 0, 0, 1, 1,
0.1224058, -1.288554, 3.639757, 0, 0, 0, 1, 1,
0.1234287, -2.127815, 2.287407, 1, 1, 1, 1, 1,
0.1263935, -0.9093478, 4.582668, 1, 1, 1, 1, 1,
0.1264589, 1.124533, -1.399524, 1, 1, 1, 1, 1,
0.1288825, -1.946182, 2.150547, 1, 1, 1, 1, 1,
0.1336189, -0.5082144, 3.933602, 1, 1, 1, 1, 1,
0.1392719, 0.4105717, -0.5016955, 1, 1, 1, 1, 1,
0.1445225, -0.2329977, 1.763339, 1, 1, 1, 1, 1,
0.1457533, -0.3258388, 2.073311, 1, 1, 1, 1, 1,
0.1468542, -0.7118805, 1.441158, 1, 1, 1, 1, 1,
0.147161, 0.7862421, 0.178043, 1, 1, 1, 1, 1,
0.1471729, 0.5495985, -1.384154, 1, 1, 1, 1, 1,
0.1485023, -1.604379, 3.704797, 1, 1, 1, 1, 1,
0.1527003, 0.2936477, 1.20981, 1, 1, 1, 1, 1,
0.1554897, -0.354002, 2.738024, 1, 1, 1, 1, 1,
0.1565795, -0.01701352, 2.252091, 1, 1, 1, 1, 1,
0.1569677, 0.9581953, -0.8637707, 0, 0, 1, 1, 1,
0.1587417, 0.2763912, 0.7465989, 1, 0, 0, 1, 1,
0.1599364, -1.756892, 2.071732, 1, 0, 0, 1, 1,
0.1624666, 0.3826909, 0.5492967, 1, 0, 0, 1, 1,
0.1657575, 2.253344, -0.7469412, 1, 0, 0, 1, 1,
0.1705513, 1.431555, 0.6279747, 1, 0, 0, 1, 1,
0.1722655, 0.5990391, 1.127216, 0, 0, 0, 1, 1,
0.1734816, 0.9192715, -0.3435418, 0, 0, 0, 1, 1,
0.1745286, 0.9251447, -0.9385103, 0, 0, 0, 1, 1,
0.1753839, -0.06824346, 0.7686595, 0, 0, 0, 1, 1,
0.1767117, -0.3335651, 1.763617, 0, 0, 0, 1, 1,
0.1767629, -0.2981747, 1.82821, 0, 0, 0, 1, 1,
0.1771818, -0.8891328, 2.10466, 0, 0, 0, 1, 1,
0.1783523, -0.4278299, 1.568337, 1, 1, 1, 1, 1,
0.1794722, -1.040985, 3.18058, 1, 1, 1, 1, 1,
0.1797032, -0.6756658, 2.948562, 1, 1, 1, 1, 1,
0.181927, 1.034215, -0.3927426, 1, 1, 1, 1, 1,
0.1833284, 1.624599, -0.2083035, 1, 1, 1, 1, 1,
0.189042, 1.391658, 1.445553, 1, 1, 1, 1, 1,
0.1897415, 0.2724003, -0.115775, 1, 1, 1, 1, 1,
0.1925657, -0.1604433, 4.320066, 1, 1, 1, 1, 1,
0.2030175, -1.038366, 3.754433, 1, 1, 1, 1, 1,
0.2164539, 1.676462, 1.369784, 1, 1, 1, 1, 1,
0.2174846, 0.9316143, 0.1781177, 1, 1, 1, 1, 1,
0.2252256, 0.128349, 2.674256, 1, 1, 1, 1, 1,
0.228558, 1.045721, 0.9619783, 1, 1, 1, 1, 1,
0.2339738, -0.3186876, 1.257868, 1, 1, 1, 1, 1,
0.2344903, -1.323851, 2.750319, 1, 1, 1, 1, 1,
0.2442917, 0.5747768, -2.793618, 0, 0, 1, 1, 1,
0.2452665, -0.4267232, 2.193834, 1, 0, 0, 1, 1,
0.2522614, 0.777457, 0.3693682, 1, 0, 0, 1, 1,
0.2534299, 0.8725261, 0.7186775, 1, 0, 0, 1, 1,
0.2646211, -0.4609984, 4.687802, 1, 0, 0, 1, 1,
0.2672809, -0.4562956, 2.703864, 1, 0, 0, 1, 1,
0.2674876, 0.6557554, -0.3368176, 0, 0, 0, 1, 1,
0.2735868, -1.359343, 3.064724, 0, 0, 0, 1, 1,
0.2740618, -0.6826597, 2.499364, 0, 0, 0, 1, 1,
0.2835042, 1.726846, -0.2123623, 0, 0, 0, 1, 1,
0.2878353, -0.3987682, 3.737282, 0, 0, 0, 1, 1,
0.2932771, 0.8896636, 0.9787042, 0, 0, 0, 1, 1,
0.2944722, -2.72864, 4.175915, 0, 0, 0, 1, 1,
0.2968436, -0.1151397, 2.631426, 1, 1, 1, 1, 1,
0.2979849, 0.05897969, 1.772261, 1, 1, 1, 1, 1,
0.2997859, -0.3476118, 2.072463, 1, 1, 1, 1, 1,
0.301127, 0.8844626, 0.1849575, 1, 1, 1, 1, 1,
0.3011987, 0.09754431, 0.9443477, 1, 1, 1, 1, 1,
0.3017052, -0.5218661, 1.813844, 1, 1, 1, 1, 1,
0.3024501, 0.6791857, 1.503402, 1, 1, 1, 1, 1,
0.3055377, -1.536458, 3.715779, 1, 1, 1, 1, 1,
0.3069274, -0.2848923, 1.906045, 1, 1, 1, 1, 1,
0.3099234, -0.5855595, 2.227781, 1, 1, 1, 1, 1,
0.3123032, -1.036148, 3.593857, 1, 1, 1, 1, 1,
0.3150432, -1.593595, 3.421156, 1, 1, 1, 1, 1,
0.3153148, -1.54811, 3.109662, 1, 1, 1, 1, 1,
0.3176398, 1.120565, -0.3522103, 1, 1, 1, 1, 1,
0.3184243, -0.656433, 3.290323, 1, 1, 1, 1, 1,
0.3187228, 0.2382965, 1.500692, 0, 0, 1, 1, 1,
0.3188217, -1.023569, 3.192652, 1, 0, 0, 1, 1,
0.3277695, -0.8119486, 3.173964, 1, 0, 0, 1, 1,
0.3291465, -0.9162884, 3.237003, 1, 0, 0, 1, 1,
0.3310223, 0.7432436, 1.040271, 1, 0, 0, 1, 1,
0.3319697, 2.153726, -0.1392973, 1, 0, 0, 1, 1,
0.3342247, -3.348579, 3.926961, 0, 0, 0, 1, 1,
0.3353728, -0.2268302, 1.429085, 0, 0, 0, 1, 1,
0.3376559, -0.1785093, 2.054229, 0, 0, 0, 1, 1,
0.3399926, -0.114783, 3.628524, 0, 0, 0, 1, 1,
0.3412301, 0.1362802, 0.1825264, 0, 0, 0, 1, 1,
0.3484431, -1.230484, 3.787189, 0, 0, 0, 1, 1,
0.3517847, 1.426775, -0.621474, 0, 0, 0, 1, 1,
0.3602707, -0.2101167, 1.194223, 1, 1, 1, 1, 1,
0.3631789, -0.4965057, 2.089831, 1, 1, 1, 1, 1,
0.3637491, -0.4131059, 1.814882, 1, 1, 1, 1, 1,
0.3668704, -1.068578, 3.181109, 1, 1, 1, 1, 1,
0.3688676, -0.6871627, 2.088234, 1, 1, 1, 1, 1,
0.3782321, -0.8245745, 1.905714, 1, 1, 1, 1, 1,
0.3811157, 1.365778, 1.831885, 1, 1, 1, 1, 1,
0.3849101, 0.01742992, 0.6434065, 1, 1, 1, 1, 1,
0.387562, 0.2213984, 2.002882, 1, 1, 1, 1, 1,
0.3878339, 1.385054, 2.394677, 1, 1, 1, 1, 1,
0.3899322, 0.2348572, -0.596687, 1, 1, 1, 1, 1,
0.3915874, -0.6100599, 3.345582, 1, 1, 1, 1, 1,
0.3986549, 0.8967657, -0.2426555, 1, 1, 1, 1, 1,
0.4012772, 0.4027272, 0.6690581, 1, 1, 1, 1, 1,
0.4053996, -0.6582817, 4.252114, 1, 1, 1, 1, 1,
0.4083984, -0.4465231, 3.237174, 0, 0, 1, 1, 1,
0.4100625, -0.2596382, 2.882036, 1, 0, 0, 1, 1,
0.4149903, 3.057586, -1.129897, 1, 0, 0, 1, 1,
0.4197342, 0.9195177, -1.637257, 1, 0, 0, 1, 1,
0.4202122, -0.9840215, 2.811243, 1, 0, 0, 1, 1,
0.4207196, -1.140279, 1.974927, 1, 0, 0, 1, 1,
0.423553, 1.366278, 0.3156003, 0, 0, 0, 1, 1,
0.4257526, -0.2535936, 2.2104, 0, 0, 0, 1, 1,
0.4274318, -0.2451592, 1.774226, 0, 0, 0, 1, 1,
0.4293172, -0.7213404, 3.74742, 0, 0, 0, 1, 1,
0.4318261, -1.294221, 2.716209, 0, 0, 0, 1, 1,
0.4362044, -1.077043, 2.277003, 0, 0, 0, 1, 1,
0.4405645, -0.03294494, 2.086813, 0, 0, 0, 1, 1,
0.4432034, -0.3001492, 1.888117, 1, 1, 1, 1, 1,
0.4446094, 1.244485, 0.8058776, 1, 1, 1, 1, 1,
0.4453492, 0.6112339, 1.284042, 1, 1, 1, 1, 1,
0.4534733, -1.010973, 2.410872, 1, 1, 1, 1, 1,
0.4544328, 1.226114, 1.015156, 1, 1, 1, 1, 1,
0.4568232, 0.161823, 0.9554257, 1, 1, 1, 1, 1,
0.4584662, -0.9941906, 2.341463, 1, 1, 1, 1, 1,
0.4591, 1.24642, 0.8729807, 1, 1, 1, 1, 1,
0.4642713, -0.513945, 2.371285, 1, 1, 1, 1, 1,
0.4656052, -0.6907146, 1.195993, 1, 1, 1, 1, 1,
0.466345, 1.121154, 0.5989015, 1, 1, 1, 1, 1,
0.4680151, 0.2692156, 2.567609, 1, 1, 1, 1, 1,
0.4691058, 0.100918, 0.6849726, 1, 1, 1, 1, 1,
0.4700073, -1.039644, 2.821157, 1, 1, 1, 1, 1,
0.4736881, 0.4150643, 1.219766, 1, 1, 1, 1, 1,
0.474921, -0.9069492, 3.502519, 0, 0, 1, 1, 1,
0.477074, -0.5916647, 3.238518, 1, 0, 0, 1, 1,
0.4833315, -0.7008375, 3.129534, 1, 0, 0, 1, 1,
0.4917148, 1.018079, 1.836261, 1, 0, 0, 1, 1,
0.4988777, 1.757158, -0.5003803, 1, 0, 0, 1, 1,
0.4997576, -0.0211813, 0.4120139, 1, 0, 0, 1, 1,
0.501218, 2.083306, -1.624626, 0, 0, 0, 1, 1,
0.5027834, 1.319262, 0.1990757, 0, 0, 0, 1, 1,
0.5044162, -0.2179559, 3.965576, 0, 0, 0, 1, 1,
0.5047709, -0.3325212, 2.658995, 0, 0, 0, 1, 1,
0.5117527, -0.5330937, 2.387469, 0, 0, 0, 1, 1,
0.5129938, 1.071701, -0.2226974, 0, 0, 0, 1, 1,
0.5160944, -0.3097894, 1.918734, 0, 0, 0, 1, 1,
0.5167038, -0.5853938, 2.877868, 1, 1, 1, 1, 1,
0.5178328, -1.150504, 1.62201, 1, 1, 1, 1, 1,
0.5195099, 0.3701531, 0.890448, 1, 1, 1, 1, 1,
0.5198291, 1.561998, -0.07565378, 1, 1, 1, 1, 1,
0.5271002, -1.121793, 2.303293, 1, 1, 1, 1, 1,
0.5330717, 0.02672482, 0.4763046, 1, 1, 1, 1, 1,
0.5358164, 0.1882941, 2.104836, 1, 1, 1, 1, 1,
0.5424815, 1.036228, 0.1720418, 1, 1, 1, 1, 1,
0.5449323, 1.769376, 0.4185586, 1, 1, 1, 1, 1,
0.5453163, -1.021773, 1.677404, 1, 1, 1, 1, 1,
0.545598, 0.2430877, 1.995226, 1, 1, 1, 1, 1,
0.5476322, -0.4901926, 1.438626, 1, 1, 1, 1, 1,
0.5502148, -1.06831, 3.418481, 1, 1, 1, 1, 1,
0.5520943, -0.6662455, 3.034624, 1, 1, 1, 1, 1,
0.5522599, -0.7262888, 2.634825, 1, 1, 1, 1, 1,
0.5522798, 0.346562, 2.052351, 0, 0, 1, 1, 1,
0.5532541, -1.590927, 2.403286, 1, 0, 0, 1, 1,
0.5563076, -0.1540597, -0.1479576, 1, 0, 0, 1, 1,
0.5613939, -0.8467223, 3.492553, 1, 0, 0, 1, 1,
0.5628804, 0.3734872, 1.763878, 1, 0, 0, 1, 1,
0.5640602, 1.422967, 1.636158, 1, 0, 0, 1, 1,
0.5685427, 0.7875001, -0.5192859, 0, 0, 0, 1, 1,
0.5688712, 0.6812002, 0.326217, 0, 0, 0, 1, 1,
0.5708919, -1.054997, 2.657797, 0, 0, 0, 1, 1,
0.5709799, -0.9364135, 2.512222, 0, 0, 0, 1, 1,
0.5759911, -1.335245, 2.921356, 0, 0, 0, 1, 1,
0.5763596, 0.6795309, 3.083776, 0, 0, 0, 1, 1,
0.5790223, 1.016294, 1.005795, 0, 0, 0, 1, 1,
0.5832045, 0.09118252, -0.4943541, 1, 1, 1, 1, 1,
0.5940109, 0.2613797, 0.7623716, 1, 1, 1, 1, 1,
0.5942032, 1.016294, 3.044661, 1, 1, 1, 1, 1,
0.5982659, 0.05990635, 0.4344053, 1, 1, 1, 1, 1,
0.6040109, -1.580702, 1.853073, 1, 1, 1, 1, 1,
0.6071674, 0.1448107, 1.483613, 1, 1, 1, 1, 1,
0.6082085, -0.4536792, 2.983844, 1, 1, 1, 1, 1,
0.6101042, 1.133812, -0.3263056, 1, 1, 1, 1, 1,
0.6108721, 0.2053282, 2.041615, 1, 1, 1, 1, 1,
0.6112829, 0.4925926, 0.6954988, 1, 1, 1, 1, 1,
0.6197591, 0.9203549, 0.1016144, 1, 1, 1, 1, 1,
0.6255689, 0.4299133, 0.7166483, 1, 1, 1, 1, 1,
0.6347705, -0.5279582, 2.606235, 1, 1, 1, 1, 1,
0.6392565, -0.04440887, 1.947501, 1, 1, 1, 1, 1,
0.640721, -1.299557, 4.029514, 1, 1, 1, 1, 1,
0.6434181, 1.364589, -0.2738436, 0, 0, 1, 1, 1,
0.6455396, -0.03776588, 1.935426, 1, 0, 0, 1, 1,
0.6464822, 0.360565, 2.331199, 1, 0, 0, 1, 1,
0.6481793, -1.194725, 2.942149, 1, 0, 0, 1, 1,
0.6502897, 0.6785138, 2.173953, 1, 0, 0, 1, 1,
0.6509317, 0.1133219, 2.2086, 1, 0, 0, 1, 1,
0.6531426, 0.7631171, 0.6558874, 0, 0, 0, 1, 1,
0.6570066, 0.6230118, 0.2242102, 0, 0, 0, 1, 1,
0.6635852, -0.2669784, 0.4308825, 0, 0, 0, 1, 1,
0.6646705, -0.7671193, 0.3397922, 0, 0, 0, 1, 1,
0.6665632, 0.1886361, 1.927026, 0, 0, 0, 1, 1,
0.6724518, 1.141988, 0.2294238, 0, 0, 0, 1, 1,
0.6724606, -0.4123196, 1.478192, 0, 0, 0, 1, 1,
0.6744793, -1.602661, 3.36172, 1, 1, 1, 1, 1,
0.6871651, -1.366415, 3.222052, 1, 1, 1, 1, 1,
0.6896142, 0.3049922, 1.983279, 1, 1, 1, 1, 1,
0.6899539, 0.5078418, 0.7523233, 1, 1, 1, 1, 1,
0.689974, -1.689494, 2.943391, 1, 1, 1, 1, 1,
0.6914917, 0.6125523, 0.7078139, 1, 1, 1, 1, 1,
0.7009888, -1.359526, 3.946626, 1, 1, 1, 1, 1,
0.7060462, -1.213512, 2.246915, 1, 1, 1, 1, 1,
0.7079723, -0.8170648, 2.149294, 1, 1, 1, 1, 1,
0.7136715, -1.758474, 4.67471, 1, 1, 1, 1, 1,
0.7217995, 0.7362909, -1.199582, 1, 1, 1, 1, 1,
0.7275646, 0.04632515, 1.319952, 1, 1, 1, 1, 1,
0.7312298, 0.09683633, 0.5030797, 1, 1, 1, 1, 1,
0.7316978, -0.5793099, 3.249562, 1, 1, 1, 1, 1,
0.7345848, -0.4453416, 1.59297, 1, 1, 1, 1, 1,
0.7349063, 2.352417, -0.5003796, 0, 0, 1, 1, 1,
0.73632, 0.9928389, -0.5926416, 1, 0, 0, 1, 1,
0.7378975, -0.8567957, 1.761317, 1, 0, 0, 1, 1,
0.7385337, 1.650675, 0.5940737, 1, 0, 0, 1, 1,
0.7404518, 0.7842339, -0.0598814, 1, 0, 0, 1, 1,
0.7434002, 1.617618, 0.1666101, 1, 0, 0, 1, 1,
0.7474579, -0.795386, 3.601681, 0, 0, 0, 1, 1,
0.7516166, 0.3450423, 0.6555742, 0, 0, 0, 1, 1,
0.7539073, 0.5279936, 3.25955, 0, 0, 0, 1, 1,
0.7539682, -1.032825, 0.753728, 0, 0, 0, 1, 1,
0.7550864, 0.4726754, 2.70703, 0, 0, 0, 1, 1,
0.7552378, 0.02235948, 0.7248454, 0, 0, 0, 1, 1,
0.758283, 0.9491526, -0.2809508, 0, 0, 0, 1, 1,
0.7630974, -0.720816, 2.653038, 1, 1, 1, 1, 1,
0.7664655, -0.8010937, 1.811768, 1, 1, 1, 1, 1,
0.7683582, -1.515131, 2.265438, 1, 1, 1, 1, 1,
0.768967, -0.5915809, 0.1495597, 1, 1, 1, 1, 1,
0.7711588, 1.55012, 1.06828, 1, 1, 1, 1, 1,
0.7712783, -1.671103, 4.07505, 1, 1, 1, 1, 1,
0.7751558, -0.5609484, 2.88783, 1, 1, 1, 1, 1,
0.7780058, 0.3644302, 2.067019, 1, 1, 1, 1, 1,
0.7802309, -0.6544855, 0.2849372, 1, 1, 1, 1, 1,
0.7922307, 0.1667035, 2.732505, 1, 1, 1, 1, 1,
0.7938015, 0.2183711, 0.7146742, 1, 1, 1, 1, 1,
0.798909, 0.007847115, 2.016728, 1, 1, 1, 1, 1,
0.8093011, 0.2657746, 1.457444, 1, 1, 1, 1, 1,
0.8094231, -0.2488261, 2.067444, 1, 1, 1, 1, 1,
0.8137463, -0.3450558, 1.456946, 1, 1, 1, 1, 1,
0.8154992, -0.6674025, 1.271865, 0, 0, 1, 1, 1,
0.8169019, -1.719459, 3.152172, 1, 0, 0, 1, 1,
0.8198788, 0.2065239, 1.831532, 1, 0, 0, 1, 1,
0.8217469, -0.4217289, 2.034259, 1, 0, 0, 1, 1,
0.8252023, -1.129282, 1.290059, 1, 0, 0, 1, 1,
0.8298601, 0.3104177, 2.131982, 1, 0, 0, 1, 1,
0.8390999, -1.086519, 2.926666, 0, 0, 0, 1, 1,
0.8463658, -1.103873, 2.807472, 0, 0, 0, 1, 1,
0.8477234, -1.374524, 4.259173, 0, 0, 0, 1, 1,
0.8489417, -1.316398, 2.927045, 0, 0, 0, 1, 1,
0.8519586, -1.408579, 2.905458, 0, 0, 0, 1, 1,
0.8550605, -0.4729253, 2.7741, 0, 0, 0, 1, 1,
0.8569325, -0.6251718, 3.459492, 0, 0, 0, 1, 1,
0.8571014, 0.203006, 1.680576, 1, 1, 1, 1, 1,
0.8620393, -1.054071, 2.74096, 1, 1, 1, 1, 1,
0.8654157, -0.595193, 1.540216, 1, 1, 1, 1, 1,
0.8703068, 0.5539035, 0.3258536, 1, 1, 1, 1, 1,
0.8712217, 0.8075027, 2.345197, 1, 1, 1, 1, 1,
0.8712382, -0.1412774, 2.048992, 1, 1, 1, 1, 1,
0.8746958, 1.782339, -0.831193, 1, 1, 1, 1, 1,
0.8757887, -0.2479236, 0.9807628, 1, 1, 1, 1, 1,
0.8802933, -0.827715, 2.188851, 1, 1, 1, 1, 1,
0.8963031, 0.4796914, 1.120902, 1, 1, 1, 1, 1,
0.9161952, -0.63918, 2.347797, 1, 1, 1, 1, 1,
0.9311242, 0.7119583, 1.009187, 1, 1, 1, 1, 1,
0.9343543, -0.5942084, 2.61131, 1, 1, 1, 1, 1,
0.9375507, -0.4177731, 0.4418442, 1, 1, 1, 1, 1,
0.9460296, 0.6161756, -0.04832062, 1, 1, 1, 1, 1,
0.9462757, 0.0459605, 0.5031868, 0, 0, 1, 1, 1,
0.952899, 0.2397221, 1.946456, 1, 0, 0, 1, 1,
0.9530816, 0.9802934, 1.438024, 1, 0, 0, 1, 1,
0.9567451, -0.3623711, 2.197927, 1, 0, 0, 1, 1,
0.9575583, -0.09666101, 2.93573, 1, 0, 0, 1, 1,
0.9757739, 0.3202243, 1.404772, 1, 0, 0, 1, 1,
0.9814059, 0.9750184, 4.594433, 0, 0, 0, 1, 1,
0.9821112, 1.617918, 2.071673, 0, 0, 0, 1, 1,
0.9845214, -0.8924389, 1.418361, 0, 0, 0, 1, 1,
0.9933209, 0.6563188, -1.032143, 0, 0, 0, 1, 1,
0.9942086, -1.357757, 2.765984, 0, 0, 0, 1, 1,
0.9962303, 0.5494069, 2.592559, 0, 0, 0, 1, 1,
0.9981695, 1.644712, 0.09692004, 0, 0, 0, 1, 1,
1.003943, 1.402733, 0.2264439, 1, 1, 1, 1, 1,
1.01221, 0.4403097, 1.352598, 1, 1, 1, 1, 1,
1.013465, 0.1786619, -0.4094606, 1, 1, 1, 1, 1,
1.016102, 1.909824, 1.249634, 1, 1, 1, 1, 1,
1.016334, 0.1156424, 1.587008, 1, 1, 1, 1, 1,
1.017071, 0.4734783, 1.853137, 1, 1, 1, 1, 1,
1.020687, -0.6626071, 3.062261, 1, 1, 1, 1, 1,
1.025559, 1.123118, 0.01634923, 1, 1, 1, 1, 1,
1.031696, 1.164112, 1.856315, 1, 1, 1, 1, 1,
1.043263, -0.09261551, -0.04634658, 1, 1, 1, 1, 1,
1.045944, 1.33055, -1.850517, 1, 1, 1, 1, 1,
1.048162, -0.6634537, 2.262482, 1, 1, 1, 1, 1,
1.050102, -0.5985959, 1.722977, 1, 1, 1, 1, 1,
1.051507, 0.4845996, 2.266766, 1, 1, 1, 1, 1,
1.054517, 2.456048, 0.01589571, 1, 1, 1, 1, 1,
1.073896, 0.5955338, 0.2382291, 0, 0, 1, 1, 1,
1.082177, -1.550881, 2.189888, 1, 0, 0, 1, 1,
1.084541, -0.6293729, 0.3717895, 1, 0, 0, 1, 1,
1.084737, -0.1382236, 1.543987, 1, 0, 0, 1, 1,
1.088912, -0.8732461, 1.899527, 1, 0, 0, 1, 1,
1.1001, -0.4059277, 2.939205, 1, 0, 0, 1, 1,
1.107287, 1.617144, -0.8071864, 0, 0, 0, 1, 1,
1.109555, 1.195526, 2.131325, 0, 0, 0, 1, 1,
1.116292, -0.7139041, 1.006023, 0, 0, 0, 1, 1,
1.121275, 0.55047, 1.112327, 0, 0, 0, 1, 1,
1.130332, 0.6409056, 0.07688824, 0, 0, 0, 1, 1,
1.13926, -0.4893762, 2.046086, 0, 0, 0, 1, 1,
1.140896, -0.2128157, 1.922037, 0, 0, 0, 1, 1,
1.156851, -1.358122, 3.357053, 1, 1, 1, 1, 1,
1.157351, -0.07103172, 2.868677, 1, 1, 1, 1, 1,
1.160369, -0.7127851, 1.484992, 1, 1, 1, 1, 1,
1.162896, 0.4933416, 2.400701, 1, 1, 1, 1, 1,
1.175007, -0.2981965, 2.414346, 1, 1, 1, 1, 1,
1.179089, -0.3040726, 1.691893, 1, 1, 1, 1, 1,
1.191844, -1.293079, 1.640962, 1, 1, 1, 1, 1,
1.197642, 1.766852, 0.7321476, 1, 1, 1, 1, 1,
1.203676, -1.500775, 3.827918, 1, 1, 1, 1, 1,
1.209077, 0.6670035, 0.3771836, 1, 1, 1, 1, 1,
1.219717, -1.517659, 1.8414, 1, 1, 1, 1, 1,
1.222409, -0.4327111, 3.219673, 1, 1, 1, 1, 1,
1.223478, -0.9194791, 1.508736, 1, 1, 1, 1, 1,
1.225263, 0.2386832, 0.743472, 1, 1, 1, 1, 1,
1.225439, 0.9054773, -0.8541253, 1, 1, 1, 1, 1,
1.235261, -0.2567777, 1.592316, 0, 0, 1, 1, 1,
1.238863, -1.690963, 2.480879, 1, 0, 0, 1, 1,
1.250409, 1.84153, 1.7727, 1, 0, 0, 1, 1,
1.254857, -0.9914857, 3.096607, 1, 0, 0, 1, 1,
1.256384, -2.176499, 2.940501, 1, 0, 0, 1, 1,
1.257449, 0.5572868, 1.44097, 1, 0, 0, 1, 1,
1.26213, -0.1476002, 1.73707, 0, 0, 0, 1, 1,
1.271005, -1.925876, 2.269486, 0, 0, 0, 1, 1,
1.271863, -1.406543, 4.530502, 0, 0, 0, 1, 1,
1.272415, -0.8090106, 3.140146, 0, 0, 0, 1, 1,
1.280332, -0.9155967, 1.892905, 0, 0, 0, 1, 1,
1.282255, 0.3431308, 1.223238, 0, 0, 0, 1, 1,
1.301163, 0.7441067, 1.088554, 0, 0, 0, 1, 1,
1.321524, -0.1232623, 1.995238, 1, 1, 1, 1, 1,
1.323705, 0.4900091, 0.3261302, 1, 1, 1, 1, 1,
1.330718, 0.5263489, 0.5103267, 1, 1, 1, 1, 1,
1.33128, 0.2457248, -0.4731298, 1, 1, 1, 1, 1,
1.334192, -0.7221605, 2.665567, 1, 1, 1, 1, 1,
1.335817, -0.7749072, 1.342704, 1, 1, 1, 1, 1,
1.336387, -0.3200371, 1.788189, 1, 1, 1, 1, 1,
1.349467, 0.5507417, 1.273338, 1, 1, 1, 1, 1,
1.355515, 0.341074, 1.778721, 1, 1, 1, 1, 1,
1.375502, 0.4621471, 1.885428, 1, 1, 1, 1, 1,
1.376807, 2.324568, 1.194971, 1, 1, 1, 1, 1,
1.398205, 0.2828839, 1.75208, 1, 1, 1, 1, 1,
1.400799, -0.02191011, 3.434656, 1, 1, 1, 1, 1,
1.409012, 0.841969, 0.9696523, 1, 1, 1, 1, 1,
1.413219, 0.9386578, 2.828066, 1, 1, 1, 1, 1,
1.414263, 0.2556345, 2.322944, 0, 0, 1, 1, 1,
1.441771, -1.173211, 2.452496, 1, 0, 0, 1, 1,
1.448475, -0.9157161, 2.714845, 1, 0, 0, 1, 1,
1.462138, 0.4539265, 1.63045, 1, 0, 0, 1, 1,
1.477794, 0.558537, 1.278112, 1, 0, 0, 1, 1,
1.479246, -0.4431201, 0.213879, 1, 0, 0, 1, 1,
1.479749, -0.005839584, 2.595935, 0, 0, 0, 1, 1,
1.481969, 0.9736838, 0.3489429, 0, 0, 0, 1, 1,
1.482014, -2.164706, 2.943333, 0, 0, 0, 1, 1,
1.482369, 0.9088913, 0.9991524, 0, 0, 0, 1, 1,
1.482611, 0.4105086, 0.8614268, 0, 0, 0, 1, 1,
1.494993, 1.382351, 1.603336, 0, 0, 0, 1, 1,
1.50343, -0.4461373, 1.190494, 0, 0, 0, 1, 1,
1.510149, 0.4668939, 0.4052177, 1, 1, 1, 1, 1,
1.519417, 0.8283333, 0.8752034, 1, 1, 1, 1, 1,
1.547174, 0.7414882, 2.055384, 1, 1, 1, 1, 1,
1.550941, 0.8518828, 1.699984, 1, 1, 1, 1, 1,
1.57135, 0.3373137, 1.57941, 1, 1, 1, 1, 1,
1.583183, -0.7336115, 1.806543, 1, 1, 1, 1, 1,
1.585957, -0.09162825, 2.379611, 1, 1, 1, 1, 1,
1.587306, -0.05694886, 2.561261, 1, 1, 1, 1, 1,
1.588874, -0.1482213, 3.5825, 1, 1, 1, 1, 1,
1.593179, -0.7387545, 0.4189973, 1, 1, 1, 1, 1,
1.60393, -0.5788983, 2.443796, 1, 1, 1, 1, 1,
1.624479, -0.5246019, 2.706805, 1, 1, 1, 1, 1,
1.641019, 0.8095723, 1.880374, 1, 1, 1, 1, 1,
1.652064, -0.5103521, 3.791295, 1, 1, 1, 1, 1,
1.661499, 1.170092, 0.5747384, 1, 1, 1, 1, 1,
1.670713, -0.7442815, 3.489684, 0, 0, 1, 1, 1,
1.67525, 1.092194, 0.4111441, 1, 0, 0, 1, 1,
1.686977, -1.027805, 1.029688, 1, 0, 0, 1, 1,
1.698436, -0.8391583, 1.316096, 1, 0, 0, 1, 1,
1.716923, 0.4828223, 0.3531563, 1, 0, 0, 1, 1,
1.717901, 2.089799, 1.172447, 1, 0, 0, 1, 1,
1.723947, -0.5107582, 1.752933, 0, 0, 0, 1, 1,
1.740091, -1.271043, 1.715731, 0, 0, 0, 1, 1,
1.76138, 0.9707706, 2.290416, 0, 0, 0, 1, 1,
1.761624, 0.6707411, 1.754335, 0, 0, 0, 1, 1,
1.761633, 0.219118, 1.373655, 0, 0, 0, 1, 1,
1.77005, 0.1829659, 2.002394, 0, 0, 0, 1, 1,
1.770137, 2.437998, -0.6065344, 0, 0, 0, 1, 1,
1.770218, -0.7768196, 3.278935, 1, 1, 1, 1, 1,
1.777788, 1.440505, 0.2124623, 1, 1, 1, 1, 1,
1.785421, -0.8472428, 0.8463509, 1, 1, 1, 1, 1,
1.806113, 0.7466044, 0.3975964, 1, 1, 1, 1, 1,
1.809138, 1.348936, 0.08369625, 1, 1, 1, 1, 1,
1.815215, -0.4604359, 0.6374383, 1, 1, 1, 1, 1,
1.827341, -1.321145, 2.508117, 1, 1, 1, 1, 1,
1.830073, -1.152815, 1.827528, 1, 1, 1, 1, 1,
1.850464, -1.132255, 3.372814, 1, 1, 1, 1, 1,
1.936517, -1.403487, 4.378356, 1, 1, 1, 1, 1,
1.948784, -0.9031485, 0.9920788, 1, 1, 1, 1, 1,
1.969677, -0.2037481, 2.451494, 1, 1, 1, 1, 1,
1.971661, 0.1904093, 0.1276912, 1, 1, 1, 1, 1,
1.971855, 0.9084275, 0.7371796, 1, 1, 1, 1, 1,
2.005891, -0.4102359, 0.2331652, 1, 1, 1, 1, 1,
2.020059, 0.4572363, 1.731274, 0, 0, 1, 1, 1,
2.031371, -0.03923009, 1.682373, 1, 0, 0, 1, 1,
2.071217, -0.3431541, 0.9867918, 1, 0, 0, 1, 1,
2.102113, 0.9138438, 0.7340546, 1, 0, 0, 1, 1,
2.155734, 1.464068, -0.4866001, 1, 0, 0, 1, 1,
2.2216, 0.4726892, 1.377703, 1, 0, 0, 1, 1,
2.224775, -0.1403596, 1.118814, 0, 0, 0, 1, 1,
2.246492, 1.775663, 1.807876, 0, 0, 0, 1, 1,
2.26878, -1.260407, 1.934476, 0, 0, 0, 1, 1,
2.275021, 0.8139706, 0.7718183, 0, 0, 0, 1, 1,
2.294077, -1.357133, 1.501007, 0, 0, 0, 1, 1,
2.421961, 0.1220096, 0.8200411, 0, 0, 0, 1, 1,
2.42941, -0.1761055, 3.618374, 0, 0, 0, 1, 1,
2.498146, 0.3025852, 2.213059, 1, 1, 1, 1, 1,
2.536318, 0.04000491, 2.534615, 1, 1, 1, 1, 1,
2.758331, 0.5482284, 1.049024, 1, 1, 1, 1, 1,
2.773719, 0.5414587, 0.1554984, 1, 1, 1, 1, 1,
2.852952, -1.061078, 1.126292, 1, 1, 1, 1, 1,
2.889636, 0.7472172, 0.0869581, 1, 1, 1, 1, 1,
2.954357, -2.122645, 0.9574831, 1, 1, 1, 1, 1
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
var radius = 9.119724;
var distance = 32.03264;
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
mvMatrix.translate( -0.01585007, 0.1454964, 0.2751904 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.03264);
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
