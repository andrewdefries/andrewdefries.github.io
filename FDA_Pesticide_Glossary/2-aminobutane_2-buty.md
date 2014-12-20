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
-3.047205, -0.2489445, -1.707442, 1, 0, 0, 1,
-2.896733, -0.697649, -2.287362, 1, 0.007843138, 0, 1,
-2.850481, -1.141754, -0.9643646, 1, 0.01176471, 0, 1,
-2.704546, 0.3555473, -1.45133, 1, 0.01960784, 0, 1,
-2.580842, -1.086045, -2.656274, 1, 0.02352941, 0, 1,
-2.566966, 0.1511386, -1.251038, 1, 0.03137255, 0, 1,
-2.531333, 1.050711, -0.3312468, 1, 0.03529412, 0, 1,
-2.523784, -0.7860057, -2.644705, 1, 0.04313726, 0, 1,
-2.508687, -0.9151447, -2.304357, 1, 0.04705882, 0, 1,
-2.392555, -1.036918, 0.02384814, 1, 0.05490196, 0, 1,
-2.379079, -0.130765, -1.247222, 1, 0.05882353, 0, 1,
-2.368239, 1.121268, -0.5772692, 1, 0.06666667, 0, 1,
-2.320129, 0.5742894, -3.888166, 1, 0.07058824, 0, 1,
-2.233989, -2.095049, -2.149262, 1, 0.07843138, 0, 1,
-2.233524, -0.8403526, -2.759981, 1, 0.08235294, 0, 1,
-2.230234, 0.790348, -1.949191, 1, 0.09019608, 0, 1,
-2.210863, -1.197055, -2.132943, 1, 0.09411765, 0, 1,
-2.19755, 0.8280771, -0.6663389, 1, 0.1019608, 0, 1,
-2.175341, -2.155527, -1.934725, 1, 0.1098039, 0, 1,
-2.153189, -0.2405172, -2.109773, 1, 0.1137255, 0, 1,
-2.104265, -0.06573859, -1.098613, 1, 0.1215686, 0, 1,
-2.052574, 0.8970019, -1.170963, 1, 0.1254902, 0, 1,
-2.033629, 0.31825, -1.79874, 1, 0.1333333, 0, 1,
-1.994187, -1.162006, -0.9317956, 1, 0.1372549, 0, 1,
-1.990093, 1.420855, -0.8511419, 1, 0.145098, 0, 1,
-1.985972, -0.5194216, -2.273952, 1, 0.1490196, 0, 1,
-1.951552, -1.93777, -3.68749, 1, 0.1568628, 0, 1,
-1.943311, -0.308575, -1.900086, 1, 0.1607843, 0, 1,
-1.920675, 0.6437706, -1.93142, 1, 0.1686275, 0, 1,
-1.886818, 0.3288958, -1.299175, 1, 0.172549, 0, 1,
-1.884816, -0.5923507, -1.832018, 1, 0.1803922, 0, 1,
-1.87934, -0.538131, -0.3318674, 1, 0.1843137, 0, 1,
-1.878256, 1.139429, -0.1197114, 1, 0.1921569, 0, 1,
-1.876935, -0.2749214, -2.1196, 1, 0.1960784, 0, 1,
-1.873406, 1.136161, -1.207296, 1, 0.2039216, 0, 1,
-1.865851, -0.8371777, -3.74656, 1, 0.2117647, 0, 1,
-1.86436, -0.6057365, -1.561876, 1, 0.2156863, 0, 1,
-1.862689, 0.4875931, -2.224421, 1, 0.2235294, 0, 1,
-1.847587, -0.6354696, -2.902547, 1, 0.227451, 0, 1,
-1.83037, -0.5939961, -1.451198, 1, 0.2352941, 0, 1,
-1.798227, 0.4745831, 0.1196299, 1, 0.2392157, 0, 1,
-1.7954, -0.589788, -1.939972, 1, 0.2470588, 0, 1,
-1.791049, 0.1285763, -1.223406, 1, 0.2509804, 0, 1,
-1.790276, 0.2348154, 0.9949765, 1, 0.2588235, 0, 1,
-1.765145, -0.001627629, -2.494837, 1, 0.2627451, 0, 1,
-1.751131, 0.7598385, -0.4822611, 1, 0.2705882, 0, 1,
-1.740523, -0.9127265, -1.241043, 1, 0.2745098, 0, 1,
-1.736852, 0.07900006, -2.216971, 1, 0.282353, 0, 1,
-1.736658, -0.01219692, -3.002854, 1, 0.2862745, 0, 1,
-1.712226, -0.1364527, -1.62909, 1, 0.2941177, 0, 1,
-1.697667, -0.5232776, -0.526143, 1, 0.3019608, 0, 1,
-1.696552, 0.5320993, 0.1309514, 1, 0.3058824, 0, 1,
-1.684809, -1.198744, -0.7708372, 1, 0.3137255, 0, 1,
-1.675632, -0.2367437, -1.59478, 1, 0.3176471, 0, 1,
-1.661783, -0.3900229, -0.7934672, 1, 0.3254902, 0, 1,
-1.642069, 0.4313054, -1.604066, 1, 0.3294118, 0, 1,
-1.637044, 0.4500227, -1.82585, 1, 0.3372549, 0, 1,
-1.606732, -0.8180603, -2.391688, 1, 0.3411765, 0, 1,
-1.602611, 0.31321, -3.439463, 1, 0.3490196, 0, 1,
-1.601934, -0.7482858, -2.079555, 1, 0.3529412, 0, 1,
-1.569122, 1.06156, -1.860302, 1, 0.3607843, 0, 1,
-1.538271, -0.1396477, -2.558992, 1, 0.3647059, 0, 1,
-1.533066, 0.4051795, -2.215266, 1, 0.372549, 0, 1,
-1.520352, -1.630252, -2.131985, 1, 0.3764706, 0, 1,
-1.502231, 0.7670611, -2.546603, 1, 0.3843137, 0, 1,
-1.499974, -0.01143617, -2.037624, 1, 0.3882353, 0, 1,
-1.497889, -1.694019, -4.005195, 1, 0.3960784, 0, 1,
-1.479493, 0.1299965, 0.4351354, 1, 0.4039216, 0, 1,
-1.47903, -0.9619687, -3.305552, 1, 0.4078431, 0, 1,
-1.476656, 0.9232346, -0.5085534, 1, 0.4156863, 0, 1,
-1.475994, -0.2547703, -1.036765, 1, 0.4196078, 0, 1,
-1.474953, 0.1784427, -2.607562, 1, 0.427451, 0, 1,
-1.472217, -0.8712752, -0.9998626, 1, 0.4313726, 0, 1,
-1.469254, -0.8933955, -1.338444, 1, 0.4392157, 0, 1,
-1.465711, -1.36062, -1.979499, 1, 0.4431373, 0, 1,
-1.455323, 1.691977, -1.864163, 1, 0.4509804, 0, 1,
-1.445328, -0.6551154, -1.969381, 1, 0.454902, 0, 1,
-1.445109, -1.86511, -1.940445, 1, 0.4627451, 0, 1,
-1.436554, -1.654867, -2.325376, 1, 0.4666667, 0, 1,
-1.434556, -1.451526, -4.641279, 1, 0.4745098, 0, 1,
-1.430393, 0.7369458, -1.246505, 1, 0.4784314, 0, 1,
-1.427192, 1.316449, -2.3908, 1, 0.4862745, 0, 1,
-1.423708, 0.8139808, -2.295336, 1, 0.4901961, 0, 1,
-1.421315, -0.185322, -2.324689, 1, 0.4980392, 0, 1,
-1.419282, -0.03319452, -2.09428, 1, 0.5058824, 0, 1,
-1.418314, -0.1713153, 0.01842691, 1, 0.509804, 0, 1,
-1.407434, 0.2726203, -2.5433, 1, 0.5176471, 0, 1,
-1.390071, 1.976434, -1.815646, 1, 0.5215687, 0, 1,
-1.382043, 0.5607203, -2.786605, 1, 0.5294118, 0, 1,
-1.378852, 0.2047114, 0.06157672, 1, 0.5333334, 0, 1,
-1.37831, 2.144396, -0.5861225, 1, 0.5411765, 0, 1,
-1.370231, -0.6693465, -1.200824, 1, 0.5450981, 0, 1,
-1.36277, 0.3698395, -0.08672634, 1, 0.5529412, 0, 1,
-1.347988, 1.851625, -0.4239398, 1, 0.5568628, 0, 1,
-1.341865, -0.4437228, -2.348866, 1, 0.5647059, 0, 1,
-1.331509, -1.430905, -3.228998, 1, 0.5686275, 0, 1,
-1.331427, -1.28991, -2.043792, 1, 0.5764706, 0, 1,
-1.329777, 0.7782636, -1.120495, 1, 0.5803922, 0, 1,
-1.324111, 2.272345, 0.300083, 1, 0.5882353, 0, 1,
-1.306185, 1.025531, -1.106225, 1, 0.5921569, 0, 1,
-1.304555, -0.4496001, -1.902063, 1, 0.6, 0, 1,
-1.303982, -0.4472571, -2.116569, 1, 0.6078432, 0, 1,
-1.300061, -2.157158, -3.222721, 1, 0.6117647, 0, 1,
-1.296711, -0.04374857, 0.5430239, 1, 0.6196079, 0, 1,
-1.288857, -0.8252109, -1.568493, 1, 0.6235294, 0, 1,
-1.285218, 0.158271, -1.020851, 1, 0.6313726, 0, 1,
-1.271523, -1.252796, -1.967976, 1, 0.6352941, 0, 1,
-1.270744, 0.09829346, -1.157231, 1, 0.6431373, 0, 1,
-1.269767, 0.3093784, -1.329491, 1, 0.6470588, 0, 1,
-1.267503, -0.4841363, -3.182305, 1, 0.654902, 0, 1,
-1.252563, -0.248711, -2.299942, 1, 0.6588235, 0, 1,
-1.251228, 1.804969, -0.3762195, 1, 0.6666667, 0, 1,
-1.247514, 0.09907322, -0.6905093, 1, 0.6705883, 0, 1,
-1.246791, -0.7321654, -1.070053, 1, 0.6784314, 0, 1,
-1.240493, 1.067328, -2.019794, 1, 0.682353, 0, 1,
-1.231301, -0.3244303, -1.783133, 1, 0.6901961, 0, 1,
-1.224663, -0.7298501, -2.343581, 1, 0.6941177, 0, 1,
-1.223857, 0.5860045, -0.2076019, 1, 0.7019608, 0, 1,
-1.222439, 1.39483, -1.987601, 1, 0.7098039, 0, 1,
-1.211725, -0.06798015, -0.9337969, 1, 0.7137255, 0, 1,
-1.208152, -0.1239134, -1.650655, 1, 0.7215686, 0, 1,
-1.204542, 0.7237492, -2.045082, 1, 0.7254902, 0, 1,
-1.192873, 1.655069, 1.583715, 1, 0.7333333, 0, 1,
-1.192175, 0.05088859, -2.55568, 1, 0.7372549, 0, 1,
-1.186098, 0.5755095, -1.209167, 1, 0.7450981, 0, 1,
-1.174426, 0.3212622, -0.2590789, 1, 0.7490196, 0, 1,
-1.158576, 0.4781945, -0.9526225, 1, 0.7568628, 0, 1,
-1.150968, 0.9849709, 0.1360146, 1, 0.7607843, 0, 1,
-1.149323, 0.5236725, -2.681187, 1, 0.7686275, 0, 1,
-1.148562, 1.532248, -0.6799862, 1, 0.772549, 0, 1,
-1.145944, -0.2617368, -2.387789, 1, 0.7803922, 0, 1,
-1.145826, 1.746306, -1.372865, 1, 0.7843137, 0, 1,
-1.141871, 1.346963, 1.116321, 1, 0.7921569, 0, 1,
-1.138537, -0.881479, -0.4926695, 1, 0.7960784, 0, 1,
-1.131725, 0.8230826, -0.7994413, 1, 0.8039216, 0, 1,
-1.12885, 0.1212498, -1.895266, 1, 0.8117647, 0, 1,
-1.128826, -0.04182541, -1.892319, 1, 0.8156863, 0, 1,
-1.126533, -1.034457, -3.490507, 1, 0.8235294, 0, 1,
-1.125181, 0.8071435, -2.168965, 1, 0.827451, 0, 1,
-1.124215, -0.7030174, -2.132589, 1, 0.8352941, 0, 1,
-1.12338, 0.1281697, -2.546125, 1, 0.8392157, 0, 1,
-1.123255, 0.5069876, -0.6322058, 1, 0.8470588, 0, 1,
-1.110232, 0.03705294, -1.411372, 1, 0.8509804, 0, 1,
-1.101192, 1.399859, -0.7721654, 1, 0.8588235, 0, 1,
-1.097455, -0.05764188, -0.2634746, 1, 0.8627451, 0, 1,
-1.093154, -1.002999, -3.136506, 1, 0.8705882, 0, 1,
-1.089462, 0.2155085, -0.6045868, 1, 0.8745098, 0, 1,
-1.076116, -0.6638014, -1.817458, 1, 0.8823529, 0, 1,
-1.075109, -0.4174127, -0.806913, 1, 0.8862745, 0, 1,
-1.07505, 0.1902691, -1.770464, 1, 0.8941177, 0, 1,
-1.074717, 0.9045172, -0.2246662, 1, 0.8980392, 0, 1,
-1.070068, -1.159214, -1.981164, 1, 0.9058824, 0, 1,
-1.0695, 0.8672537, 0.04991831, 1, 0.9137255, 0, 1,
-1.067807, -0.2585553, -1.358735, 1, 0.9176471, 0, 1,
-1.063619, -1.08503, -2.357539, 1, 0.9254902, 0, 1,
-1.06127, 1.217205, -0.4266736, 1, 0.9294118, 0, 1,
-1.059731, -1.855831, -2.221821, 1, 0.9372549, 0, 1,
-1.059703, 0.07404382, -0.2301548, 1, 0.9411765, 0, 1,
-1.059642, 2.057307, -1.81677, 1, 0.9490196, 0, 1,
-1.058295, -0.9240544, -1.295903, 1, 0.9529412, 0, 1,
-1.058278, 1.883142, -0.5442066, 1, 0.9607843, 0, 1,
-1.058084, -0.6494648, -1.791357, 1, 0.9647059, 0, 1,
-1.032393, 0.1473016, -2.10736, 1, 0.972549, 0, 1,
-1.031087, 1.027117, 0.3991614, 1, 0.9764706, 0, 1,
-1.025724, 2.061198, -0.9583812, 1, 0.9843137, 0, 1,
-1.011885, -4.449799, -2.910487, 1, 0.9882353, 0, 1,
-1.010003, 0.5014606, -1.416291, 1, 0.9960784, 0, 1,
-1.005008, 1.258146, -1.651025, 0.9960784, 1, 0, 1,
-0.9987358, -1.439402, -0.6007363, 0.9921569, 1, 0, 1,
-0.9867383, -0.6700444, -2.167161, 0.9843137, 1, 0, 1,
-0.9721211, 0.8030463, -1.086943, 0.9803922, 1, 0, 1,
-0.9693435, -0.3773925, -2.781104, 0.972549, 1, 0, 1,
-0.9693088, -0.532149, -2.478105, 0.9686275, 1, 0, 1,
-0.9691216, -0.320665, -0.2219895, 0.9607843, 1, 0, 1,
-0.9687101, -0.5283284, -3.114827, 0.9568627, 1, 0, 1,
-0.9664915, -1.27113, -2.09123, 0.9490196, 1, 0, 1,
-0.9652027, -0.1435726, -0.8714483, 0.945098, 1, 0, 1,
-0.9637359, -1.156557, -1.991349, 0.9372549, 1, 0, 1,
-0.9578223, -0.3756252, -1.116693, 0.9333333, 1, 0, 1,
-0.944328, -0.6359276, -3.581426, 0.9254902, 1, 0, 1,
-0.9431316, -2.743049, -3.525007, 0.9215686, 1, 0, 1,
-0.9425506, 0.4472326, -0.5065815, 0.9137255, 1, 0, 1,
-0.9410583, 2.322089, -1.800614, 0.9098039, 1, 0, 1,
-0.9367266, 0.635829, -2.290736, 0.9019608, 1, 0, 1,
-0.9345941, -0.1627223, -2.066339, 0.8941177, 1, 0, 1,
-0.9331913, -0.1101802, -1.125631, 0.8901961, 1, 0, 1,
-0.9151195, 0.01929712, -3.151524, 0.8823529, 1, 0, 1,
-0.9094574, -0.579433, -2.037848, 0.8784314, 1, 0, 1,
-0.9042004, 2.906198, -0.2061057, 0.8705882, 1, 0, 1,
-0.9011682, -0.9657553, -2.912618, 0.8666667, 1, 0, 1,
-0.8977986, -0.4322031, -2.261292, 0.8588235, 1, 0, 1,
-0.8950855, 0.1562826, -0.7672396, 0.854902, 1, 0, 1,
-0.8943379, 0.2271179, -1.207939, 0.8470588, 1, 0, 1,
-0.8923772, -0.8703243, -3.816455, 0.8431373, 1, 0, 1,
-0.8889862, 1.171871, -2.517051, 0.8352941, 1, 0, 1,
-0.8795879, -0.4322186, -2.036002, 0.8313726, 1, 0, 1,
-0.8752062, -0.5227569, -2.293627, 0.8235294, 1, 0, 1,
-0.8667507, -2.319146, -1.841825, 0.8196079, 1, 0, 1,
-0.8660712, -1.329431, -2.811576, 0.8117647, 1, 0, 1,
-0.860986, 1.247743, -1.01186, 0.8078431, 1, 0, 1,
-0.8422984, 1.393912, 0.05627646, 0.8, 1, 0, 1,
-0.8395408, 0.6093065, -0.4382365, 0.7921569, 1, 0, 1,
-0.8356711, 2.132642, -1.668572, 0.7882353, 1, 0, 1,
-0.8348007, -1.659958, -3.427889, 0.7803922, 1, 0, 1,
-0.8258125, 0.6181816, -0.9595696, 0.7764706, 1, 0, 1,
-0.8256921, 2.252781, 0.2507716, 0.7686275, 1, 0, 1,
-0.8221315, -1.519514, -2.083231, 0.7647059, 1, 0, 1,
-0.8206725, 0.6483826, -0.9028628, 0.7568628, 1, 0, 1,
-0.820212, -1.02216, -1.492906, 0.7529412, 1, 0, 1,
-0.8195551, 0.4553896, 0.7737816, 0.7450981, 1, 0, 1,
-0.8063478, -1.234654, -3.336044, 0.7411765, 1, 0, 1,
-0.8028238, 1.502084, -2.772915, 0.7333333, 1, 0, 1,
-0.802588, -0.4889742, -0.9106433, 0.7294118, 1, 0, 1,
-0.8005388, -0.8137825, -2.629825, 0.7215686, 1, 0, 1,
-0.7999628, 0.8555315, -1.483129, 0.7176471, 1, 0, 1,
-0.7886485, -1.257492, -4.212947, 0.7098039, 1, 0, 1,
-0.7861249, -0.6832119, -2.725675, 0.7058824, 1, 0, 1,
-0.781166, -1.32872, -4.18076, 0.6980392, 1, 0, 1,
-0.7810078, 0.2555436, -2.307329, 0.6901961, 1, 0, 1,
-0.7807872, -0.6469241, -2.12314, 0.6862745, 1, 0, 1,
-0.7714022, -0.05594207, -1.882995, 0.6784314, 1, 0, 1,
-0.7707554, 0.2752919, -1.079798, 0.6745098, 1, 0, 1,
-0.7679997, -0.7912139, -2.962156, 0.6666667, 1, 0, 1,
-0.7653911, -0.5652026, -3.658062, 0.6627451, 1, 0, 1,
-0.763918, 0.3954123, -1.026768, 0.654902, 1, 0, 1,
-0.7623055, 1.496343, 0.008545788, 0.6509804, 1, 0, 1,
-0.7612593, 0.8421515, -3.156279, 0.6431373, 1, 0, 1,
-0.7590279, -0.3420879, -2.013676, 0.6392157, 1, 0, 1,
-0.7535046, 0.5619873, 0.5291009, 0.6313726, 1, 0, 1,
-0.7505177, 0.3423268, -1.313117, 0.627451, 1, 0, 1,
-0.7501612, 1.945906, -1.611233, 0.6196079, 1, 0, 1,
-0.7446123, 1.992873, 2.20532, 0.6156863, 1, 0, 1,
-0.7387966, -0.07217645, 0.3283, 0.6078432, 1, 0, 1,
-0.7356269, -0.9071279, -2.366637, 0.6039216, 1, 0, 1,
-0.7283321, -1.281669, -2.939154, 0.5960785, 1, 0, 1,
-0.7270952, -0.5900914, -0.8267649, 0.5882353, 1, 0, 1,
-0.7210707, 0.187943, -0.2812784, 0.5843138, 1, 0, 1,
-0.7163273, -0.1677755, -2.328056, 0.5764706, 1, 0, 1,
-0.7155129, -1.264066, -1.332122, 0.572549, 1, 0, 1,
-0.7146753, -0.3881062, -2.546869, 0.5647059, 1, 0, 1,
-0.6988927, -0.09770014, -2.629698, 0.5607843, 1, 0, 1,
-0.6981646, -0.1321543, -1.248754, 0.5529412, 1, 0, 1,
-0.6947724, -1.869599, -2.258479, 0.5490196, 1, 0, 1,
-0.6947486, -0.7922217, -3.655463, 0.5411765, 1, 0, 1,
-0.6932015, 0.7089081, -0.8980202, 0.5372549, 1, 0, 1,
-0.6916546, -0.07456724, -3.117698, 0.5294118, 1, 0, 1,
-0.6905906, -0.5818991, -1.210409, 0.5254902, 1, 0, 1,
-0.6888767, -1.520944, -2.460989, 0.5176471, 1, 0, 1,
-0.6823552, -0.4021394, -2.750892, 0.5137255, 1, 0, 1,
-0.6819838, 0.3970999, 0.8188966, 0.5058824, 1, 0, 1,
-0.667559, 1.516729, -1.155041, 0.5019608, 1, 0, 1,
-0.661847, -0.3708609, -0.9923848, 0.4941176, 1, 0, 1,
-0.6603738, -1.094599, -2.975595, 0.4862745, 1, 0, 1,
-0.658714, -1.163538, -1.05288, 0.4823529, 1, 0, 1,
-0.6546092, 1.895129, -1.394327, 0.4745098, 1, 0, 1,
-0.650601, 0.4372381, -2.684351, 0.4705882, 1, 0, 1,
-0.6503873, -0.2827742, -0.6755922, 0.4627451, 1, 0, 1,
-0.6497681, -0.3320883, -3.378175, 0.4588235, 1, 0, 1,
-0.6466486, -0.1618854, -1.545416, 0.4509804, 1, 0, 1,
-0.6464694, 1.978566, -0.2640527, 0.4470588, 1, 0, 1,
-0.6461682, 1.383332, -0.5902437, 0.4392157, 1, 0, 1,
-0.6448426, 2.282948, 0.513199, 0.4352941, 1, 0, 1,
-0.6447029, 0.8543446, 0.1607486, 0.427451, 1, 0, 1,
-0.6437263, 0.04055673, -1.790072, 0.4235294, 1, 0, 1,
-0.6405161, -2.021271, -3.417029, 0.4156863, 1, 0, 1,
-0.6380926, 0.5977612, -0.1659985, 0.4117647, 1, 0, 1,
-0.6370873, -1.125632, -2.605656, 0.4039216, 1, 0, 1,
-0.6306955, -1.047457, -2.991144, 0.3960784, 1, 0, 1,
-0.6306795, 1.024231, -0.9463311, 0.3921569, 1, 0, 1,
-0.6304983, 0.494079, 0.00568096, 0.3843137, 1, 0, 1,
-0.6228408, 0.4054087, -0.1035284, 0.3803922, 1, 0, 1,
-0.6141851, -0.9292947, -2.658562, 0.372549, 1, 0, 1,
-0.614076, -0.182183, -2.436618, 0.3686275, 1, 0, 1,
-0.611567, 0.5462852, -0.7183378, 0.3607843, 1, 0, 1,
-0.6114463, 0.4321581, -2.177781, 0.3568628, 1, 0, 1,
-0.6070641, 1.767554, -1.099884, 0.3490196, 1, 0, 1,
-0.604435, -0.04769743, -1.32434, 0.345098, 1, 0, 1,
-0.602618, 1.018123, -1.147038, 0.3372549, 1, 0, 1,
-0.602532, 0.7250081, 1.519831, 0.3333333, 1, 0, 1,
-0.5980298, -1.41145, -3.845984, 0.3254902, 1, 0, 1,
-0.5884455, 0.8426794, -0.6525484, 0.3215686, 1, 0, 1,
-0.5853437, 0.03549546, -2.332032, 0.3137255, 1, 0, 1,
-0.5818295, 0.02167987, -3.705773, 0.3098039, 1, 0, 1,
-0.5780042, 0.402739, -0.9471967, 0.3019608, 1, 0, 1,
-0.5734338, 1.537005, -0.8617857, 0.2941177, 1, 0, 1,
-0.5705603, 0.09000508, -3.752366, 0.2901961, 1, 0, 1,
-0.5693895, -1.701787, -3.653297, 0.282353, 1, 0, 1,
-0.5659409, -1.748154, -2.670413, 0.2784314, 1, 0, 1,
-0.5656689, 0.425914, -0.6808193, 0.2705882, 1, 0, 1,
-0.5645505, 0.09960595, -0.6532308, 0.2666667, 1, 0, 1,
-0.5613959, 0.1464417, 0.0482781, 0.2588235, 1, 0, 1,
-0.5598374, 0.4411845, -0.6620157, 0.254902, 1, 0, 1,
-0.5579886, 0.1619407, -1.368948, 0.2470588, 1, 0, 1,
-0.5546381, 0.5083506, -1.163732, 0.2431373, 1, 0, 1,
-0.5490696, 1.379515, -0.03397958, 0.2352941, 1, 0, 1,
-0.548287, -0.09472613, -3.823715, 0.2313726, 1, 0, 1,
-0.53617, 0.6379671, -0.4968068, 0.2235294, 1, 0, 1,
-0.5351396, 1.367005, -2.331916, 0.2196078, 1, 0, 1,
-0.5331354, -1.194004, -3.625892, 0.2117647, 1, 0, 1,
-0.529985, 0.7508481, -1.789775, 0.2078431, 1, 0, 1,
-0.5273129, 0.207771, -0.5714688, 0.2, 1, 0, 1,
-0.5261205, 0.9245331, -0.1734114, 0.1921569, 1, 0, 1,
-0.5236484, -0.1685325, -4.065717, 0.1882353, 1, 0, 1,
-0.5232341, -0.6529436, -0.2669387, 0.1803922, 1, 0, 1,
-0.5203092, 0.9492224, -1.230717, 0.1764706, 1, 0, 1,
-0.5186702, -1.303378, -2.865083, 0.1686275, 1, 0, 1,
-0.5173128, -2.406298, -1.276836, 0.1647059, 1, 0, 1,
-0.5168331, 0.5145316, -2.064077, 0.1568628, 1, 0, 1,
-0.5163716, 0.7794065, 0.8404837, 0.1529412, 1, 0, 1,
-0.5139067, -0.4125237, -2.870219, 0.145098, 1, 0, 1,
-0.5108676, 0.6649836, 0.9939533, 0.1411765, 1, 0, 1,
-0.5103197, 0.2108326, -0.45424, 0.1333333, 1, 0, 1,
-0.5054499, 0.460942, 0.7922019, 0.1294118, 1, 0, 1,
-0.5050504, -1.108076, -4.038247, 0.1215686, 1, 0, 1,
-0.5025696, 1.713198, 0.623131, 0.1176471, 1, 0, 1,
-0.501547, 1.401937, -1.840492, 0.1098039, 1, 0, 1,
-0.4982412, -0.5020783, -4.04945, 0.1058824, 1, 0, 1,
-0.4952731, 0.4502731, -0.5764377, 0.09803922, 1, 0, 1,
-0.4919806, 1.338927, -1.30256, 0.09019608, 1, 0, 1,
-0.4870203, 0.3707168, -1.244696, 0.08627451, 1, 0, 1,
-0.4849003, 0.5520272, -1.051211, 0.07843138, 1, 0, 1,
-0.4820549, 1.344185, 0.566767, 0.07450981, 1, 0, 1,
-0.4790817, 1.222786, -2.827573, 0.06666667, 1, 0, 1,
-0.4786404, -1.55382, -2.103332, 0.0627451, 1, 0, 1,
-0.4750824, -0.4875278, -2.608818, 0.05490196, 1, 0, 1,
-0.4739959, 0.5751204, -2.674502, 0.05098039, 1, 0, 1,
-0.4706285, 0.127341, -2.858051, 0.04313726, 1, 0, 1,
-0.4636918, 0.7346554, -0.951605, 0.03921569, 1, 0, 1,
-0.4613917, -0.3156382, -2.887119, 0.03137255, 1, 0, 1,
-0.4611601, 0.8379831, -2.478198, 0.02745098, 1, 0, 1,
-0.4572895, -0.932214, -2.456398, 0.01960784, 1, 0, 1,
-0.4569722, -0.528957, -3.035577, 0.01568628, 1, 0, 1,
-0.4522426, 0.6877518, -1.725548, 0.007843138, 1, 0, 1,
-0.4520936, 0.8706304, -1.625905, 0.003921569, 1, 0, 1,
-0.4513606, -0.5059567, -3.480996, 0, 1, 0.003921569, 1,
-0.4505545, -0.2746801, -2.190195, 0, 1, 0.01176471, 1,
-0.4503764, 0.9210579, -1.499983, 0, 1, 0.01568628, 1,
-0.4406899, -0.1484791, -1.028828, 0, 1, 0.02352941, 1,
-0.4363008, -0.9843147, -3.596694, 0, 1, 0.02745098, 1,
-0.4331238, 0.9703482, 0.1908527, 0, 1, 0.03529412, 1,
-0.4320964, -1.674748, -2.476946, 0, 1, 0.03921569, 1,
-0.4309794, -0.3454416, -2.921204, 0, 1, 0.04705882, 1,
-0.4263585, 0.9033177, -0.1200329, 0, 1, 0.05098039, 1,
-0.4219775, 0.8873929, 0.5711188, 0, 1, 0.05882353, 1,
-0.4218507, 0.01519619, -3.292222, 0, 1, 0.0627451, 1,
-0.4214037, -0.1080306, 0.6667064, 0, 1, 0.07058824, 1,
-0.4211481, -0.4267131, -2.584172, 0, 1, 0.07450981, 1,
-0.4162543, 0.1942336, -0.4028605, 0, 1, 0.08235294, 1,
-0.4135626, 0.1960336, -2.093763, 0, 1, 0.08627451, 1,
-0.4126128, -0.5089685, 0.03088735, 0, 1, 0.09411765, 1,
-0.4066292, 0.699223, -0.7178628, 0, 1, 0.1019608, 1,
-0.4007345, 1.571881, 0.1576296, 0, 1, 0.1058824, 1,
-0.3975419, -1.109573, -2.658178, 0, 1, 0.1137255, 1,
-0.3968308, 0.9150041, -0.2644566, 0, 1, 0.1176471, 1,
-0.3899954, -1.105011, -2.123072, 0, 1, 0.1254902, 1,
-0.3848043, 0.4412097, 0.1020281, 0, 1, 0.1294118, 1,
-0.3843223, 1.542213, 1.525452, 0, 1, 0.1372549, 1,
-0.3837428, 0.5336724, -0.1002266, 0, 1, 0.1411765, 1,
-0.3823816, -0.5973961, -0.8053354, 0, 1, 0.1490196, 1,
-0.3788408, -1.343476, -3.011455, 0, 1, 0.1529412, 1,
-0.3737709, 1.144465, -2.099788, 0, 1, 0.1607843, 1,
-0.3704797, 0.3987358, -0.3755673, 0, 1, 0.1647059, 1,
-0.3690617, -0.8665187, -2.951914, 0, 1, 0.172549, 1,
-0.3630882, -0.411526, -2.983021, 0, 1, 0.1764706, 1,
-0.3617269, 0.3767089, -1.089284, 0, 1, 0.1843137, 1,
-0.3610704, 1.239833, 3.425863, 0, 1, 0.1882353, 1,
-0.3607261, 0.7327834, -0.2391741, 0, 1, 0.1960784, 1,
-0.3570956, -0.7767014, -3.854809, 0, 1, 0.2039216, 1,
-0.3561467, -0.2098414, -2.554285, 0, 1, 0.2078431, 1,
-0.3506403, 0.2228274, -2.012704, 0, 1, 0.2156863, 1,
-0.35021, -0.07768302, -0.4985141, 0, 1, 0.2196078, 1,
-0.3496706, -2.290346, -3.174741, 0, 1, 0.227451, 1,
-0.3496528, -0.3654669, -3.494756, 0, 1, 0.2313726, 1,
-0.3473521, -0.3938352, -1.807123, 0, 1, 0.2392157, 1,
-0.3466579, 0.4118677, -0.6150787, 0, 1, 0.2431373, 1,
-0.3418365, 0.6668152, -0.06474714, 0, 1, 0.2509804, 1,
-0.340777, -0.9589122, -2.306503, 0, 1, 0.254902, 1,
-0.3393101, 1.163906, -0.7393043, 0, 1, 0.2627451, 1,
-0.3375824, -0.174313, -1.797875, 0, 1, 0.2666667, 1,
-0.3366905, 0.2671239, -2.380255, 0, 1, 0.2745098, 1,
-0.3346388, -0.3075187, -2.150523, 0, 1, 0.2784314, 1,
-0.3336122, -0.3611381, -4.069031, 0, 1, 0.2862745, 1,
-0.3325307, -1.223424, -2.105131, 0, 1, 0.2901961, 1,
-0.3255996, -0.1089111, -1.338427, 0, 1, 0.2980392, 1,
-0.3170192, 1.007456, -0.9977805, 0, 1, 0.3058824, 1,
-0.3157084, -0.9216831, -2.899922, 0, 1, 0.3098039, 1,
-0.3117003, -1.149467, -4.416294, 0, 1, 0.3176471, 1,
-0.311299, 1.983747, -0.7122886, 0, 1, 0.3215686, 1,
-0.3097315, 0.3092952, -0.1642377, 0, 1, 0.3294118, 1,
-0.3094804, -0.0691745, -2.681785, 0, 1, 0.3333333, 1,
-0.3086026, 0.002245788, -0.7100726, 0, 1, 0.3411765, 1,
-0.3070923, 0.618723, -0.5942638, 0, 1, 0.345098, 1,
-0.3038846, 0.6246052, 0.1542131, 0, 1, 0.3529412, 1,
-0.3031467, 0.1038814, -2.434337, 0, 1, 0.3568628, 1,
-0.2973019, -0.4086578, -0.7680526, 0, 1, 0.3647059, 1,
-0.2884571, -1.101633, -2.144913, 0, 1, 0.3686275, 1,
-0.2863108, -0.4408162, -3.167445, 0, 1, 0.3764706, 1,
-0.2860565, -1.162964, -2.663702, 0, 1, 0.3803922, 1,
-0.2853224, 0.05438045, -1.273115, 0, 1, 0.3882353, 1,
-0.2794287, -0.05556336, -1.255712, 0, 1, 0.3921569, 1,
-0.2757484, 0.1902026, -2.387012, 0, 1, 0.4, 1,
-0.2745222, -0.04858292, -1.079246, 0, 1, 0.4078431, 1,
-0.2716091, 0.1746283, -0.3052568, 0, 1, 0.4117647, 1,
-0.2660207, 0.5260938, 0.2280353, 0, 1, 0.4196078, 1,
-0.2640382, -0.4938078, -2.807644, 0, 1, 0.4235294, 1,
-0.2637644, -1.397912, -3.378551, 0, 1, 0.4313726, 1,
-0.2622321, 2.146636, 0.07123709, 0, 1, 0.4352941, 1,
-0.2615245, -2.207684, -3.151687, 0, 1, 0.4431373, 1,
-0.2614697, -0.16784, -2.420176, 0, 1, 0.4470588, 1,
-0.2577582, -1.342814, -2.351918, 0, 1, 0.454902, 1,
-0.256765, 0.2004922, -1.773927, 0, 1, 0.4588235, 1,
-0.254967, 1.592126, -1.143327, 0, 1, 0.4666667, 1,
-0.254886, 1.656635, 0.02851464, 0, 1, 0.4705882, 1,
-0.2511115, -0.7019798, -2.8929, 0, 1, 0.4784314, 1,
-0.2476738, 1.028929, -0.6709912, 0, 1, 0.4823529, 1,
-0.2469558, 1.886896, -1.591788, 0, 1, 0.4901961, 1,
-0.245068, -0.5986921, -0.7802389, 0, 1, 0.4941176, 1,
-0.2429141, -0.1778242, -2.103282, 0, 1, 0.5019608, 1,
-0.2417168, 0.9474709, 1.620744, 0, 1, 0.509804, 1,
-0.2408547, -1.612468, -3.870736, 0, 1, 0.5137255, 1,
-0.240689, -0.4213758, -1.643955, 0, 1, 0.5215687, 1,
-0.238608, 0.08181908, -1.380392, 0, 1, 0.5254902, 1,
-0.2371832, 0.8908347, 0.05609631, 0, 1, 0.5333334, 1,
-0.2367423, -0.7284424, -2.323088, 0, 1, 0.5372549, 1,
-0.235885, -1.561835, -3.065353, 0, 1, 0.5450981, 1,
-0.2316896, -1.295633, -1.653322, 0, 1, 0.5490196, 1,
-0.2307779, -0.3530623, -2.408922, 0, 1, 0.5568628, 1,
-0.2260034, 0.40036, -0.7240348, 0, 1, 0.5607843, 1,
-0.2254193, 0.8425227, -1.928615, 0, 1, 0.5686275, 1,
-0.2252201, 1.608367, 0.7389723, 0, 1, 0.572549, 1,
-0.2243288, 0.89624, -0.1502443, 0, 1, 0.5803922, 1,
-0.2190655, 1.223719, 0.2954396, 0, 1, 0.5843138, 1,
-0.2112815, 0.7281194, -3.083017, 0, 1, 0.5921569, 1,
-0.2078912, 0.2891623, -0.7819059, 0, 1, 0.5960785, 1,
-0.2062781, -0.8305155, -2.789722, 0, 1, 0.6039216, 1,
-0.1996534, -0.2131814, -2.700956, 0, 1, 0.6117647, 1,
-0.1971295, 0.7465717, -0.6211402, 0, 1, 0.6156863, 1,
-0.1971271, 0.6386513, -0.8474929, 0, 1, 0.6235294, 1,
-0.1952647, -0.259202, -4.627656, 0, 1, 0.627451, 1,
-0.1941224, 0.2807299, -0.8512432, 0, 1, 0.6352941, 1,
-0.1908621, 0.6148388, -0.5215864, 0, 1, 0.6392157, 1,
-0.18897, -0.1175661, -1.871338, 0, 1, 0.6470588, 1,
-0.1870457, -0.09053575, -1.359588, 0, 1, 0.6509804, 1,
-0.183065, 0.6710336, 0.09375894, 0, 1, 0.6588235, 1,
-0.1824665, -0.2383925, -3.25484, 0, 1, 0.6627451, 1,
-0.1813749, 0.5138719, 2.478726, 0, 1, 0.6705883, 1,
-0.1781992, 0.2017602, -0.9137523, 0, 1, 0.6745098, 1,
-0.176766, 1.391614, -1.140734, 0, 1, 0.682353, 1,
-0.1762912, 0.7312719, -1.081877, 0, 1, 0.6862745, 1,
-0.1749303, 0.06394727, -1.059299, 0, 1, 0.6941177, 1,
-0.1715977, 1.456585, -1.746272, 0, 1, 0.7019608, 1,
-0.1714402, -0.5958448, -2.773061, 0, 1, 0.7058824, 1,
-0.1609567, -0.582303, -1.383198, 0, 1, 0.7137255, 1,
-0.1516175, 0.3224624, 0.07222611, 0, 1, 0.7176471, 1,
-0.1505991, -1.034165, -2.707677, 0, 1, 0.7254902, 1,
-0.1500176, 0.7345212, 0.6542125, 0, 1, 0.7294118, 1,
-0.1465844, 0.009958949, -1.508727, 0, 1, 0.7372549, 1,
-0.1463404, -0.9647317, -3.709512, 0, 1, 0.7411765, 1,
-0.1386233, 0.3241253, -0.1160923, 0, 1, 0.7490196, 1,
-0.1357713, 0.7052311, -1.26146, 0, 1, 0.7529412, 1,
-0.133697, 0.01049339, -0.1344192, 0, 1, 0.7607843, 1,
-0.131702, -0.4745606, -2.358009, 0, 1, 0.7647059, 1,
-0.1295016, 0.3417463, 0.3896313, 0, 1, 0.772549, 1,
-0.1220494, 0.9668334, -0.8030472, 0, 1, 0.7764706, 1,
-0.1185686, -0.2299872, -3.180576, 0, 1, 0.7843137, 1,
-0.1166295, -0.9540338, -3.971837, 0, 1, 0.7882353, 1,
-0.1107056, 0.02345094, -2.075893, 0, 1, 0.7960784, 1,
-0.1085414, 0.2618431, -0.5693832, 0, 1, 0.8039216, 1,
-0.1046919, -0.6209822, -4.188526, 0, 1, 0.8078431, 1,
-0.1028219, -0.5669248, -2.730818, 0, 1, 0.8156863, 1,
-0.1025143, -0.4578276, -3.396427, 0, 1, 0.8196079, 1,
-0.09891901, -1.338288, -2.022129, 0, 1, 0.827451, 1,
-0.09566081, 0.08173049, -0.6467532, 0, 1, 0.8313726, 1,
-0.09398996, 0.6878942, 1.98341, 0, 1, 0.8392157, 1,
-0.0938524, -0.482959, -4.386611, 0, 1, 0.8431373, 1,
-0.08803511, 0.8307471, 0.7809699, 0, 1, 0.8509804, 1,
-0.0865714, -0.2721144, -3.412104, 0, 1, 0.854902, 1,
-0.08634691, -0.2465379, -2.479574, 0, 1, 0.8627451, 1,
-0.08470275, 1.925175, -2.217538, 0, 1, 0.8666667, 1,
-0.0792618, 0.1348254, 0.3303625, 0, 1, 0.8745098, 1,
-0.07857158, -0.8152315, -3.182723, 0, 1, 0.8784314, 1,
-0.07540798, -0.2631671, -2.88267, 0, 1, 0.8862745, 1,
-0.07317655, 1.352434, -1.259313, 0, 1, 0.8901961, 1,
-0.06683142, 0.4537181, 0.9738152, 0, 1, 0.8980392, 1,
-0.06662282, 0.9154044, -0.5581645, 0, 1, 0.9058824, 1,
-0.06435532, 0.5068535, -0.3310777, 0, 1, 0.9098039, 1,
-0.0633812, 1.233933, -1.424867, 0, 1, 0.9176471, 1,
-0.06314489, -1.567678, -2.256651, 0, 1, 0.9215686, 1,
-0.06090815, -2.279379, -1.328644, 0, 1, 0.9294118, 1,
-0.05839947, -0.5844196, -2.599567, 0, 1, 0.9333333, 1,
-0.0568256, 0.2986049, -1.542282, 0, 1, 0.9411765, 1,
-0.05396944, 1.334374, -0.09581129, 0, 1, 0.945098, 1,
-0.05055078, -0.9636246, -3.941923, 0, 1, 0.9529412, 1,
-0.04381072, -0.7397383, -3.90567, 0, 1, 0.9568627, 1,
-0.04143414, -0.03751336, -3.715103, 0, 1, 0.9647059, 1,
-0.03636303, -0.02919427, -1.75032, 0, 1, 0.9686275, 1,
-0.03379548, 0.4305286, 0.1451262, 0, 1, 0.9764706, 1,
-0.03124021, -0.5434207, -3.210027, 0, 1, 0.9803922, 1,
-0.02884473, -0.8949001, -3.530816, 0, 1, 0.9882353, 1,
-0.02874465, -1.326543, -2.011087, 0, 1, 0.9921569, 1,
-0.02585253, -0.3669302, -4.455396, 0, 1, 1, 1,
-0.02117217, 1.848312, 0.8183185, 0, 0.9921569, 1, 1,
-0.02079426, 0.7477599, -0.8127246, 0, 0.9882353, 1, 1,
-0.01656532, 1.411174, 1.119052, 0, 0.9803922, 1, 1,
-0.01266627, 0.2895879, 1.332839, 0, 0.9764706, 1, 1,
-0.008476974, 0.3889705, -0.2978313, 0, 0.9686275, 1, 1,
-0.005100344, -1.256433, -3.279765, 0, 0.9647059, 1, 1,
-0.003149595, 0.7785723, 0.3712979, 0, 0.9568627, 1, 1,
0.001968799, 0.3183784, -0.3711376, 0, 0.9529412, 1, 1,
0.003531985, -0.2621864, 1.218896, 0, 0.945098, 1, 1,
0.005462791, 0.7359141, -1.838987, 0, 0.9411765, 1, 1,
0.008954167, -2.933701, 2.513497, 0, 0.9333333, 1, 1,
0.01400739, -0.4264498, 0.83601, 0, 0.9294118, 1, 1,
0.01458559, -1.552635, 5.212861, 0, 0.9215686, 1, 1,
0.01594557, -0.6061799, 4.632054, 0, 0.9176471, 1, 1,
0.02108297, 0.9062474, -1.040019, 0, 0.9098039, 1, 1,
0.02323823, -0.3075619, 2.25957, 0, 0.9058824, 1, 1,
0.02557789, 0.1057686, 0.7569573, 0, 0.8980392, 1, 1,
0.02732164, 1.331655, 0.4505413, 0, 0.8901961, 1, 1,
0.02871118, -0.2816242, 3.498876, 0, 0.8862745, 1, 1,
0.03409952, -0.7435314, 4.651081, 0, 0.8784314, 1, 1,
0.03614775, 0.3798725, -0.6176614, 0, 0.8745098, 1, 1,
0.03912306, -1.369603, 5.078165, 0, 0.8666667, 1, 1,
0.04411233, 0.4743007, -0.6981365, 0, 0.8627451, 1, 1,
0.05082451, -0.1703114, 2.983516, 0, 0.854902, 1, 1,
0.0541257, 1.474302, 0.9379342, 0, 0.8509804, 1, 1,
0.05762835, -0.9071401, 2.764464, 0, 0.8431373, 1, 1,
0.06038469, -1.625423, 3.850042, 0, 0.8392157, 1, 1,
0.06057846, -0.1035942, 2.065356, 0, 0.8313726, 1, 1,
0.06384701, -1.607819, 2.483541, 0, 0.827451, 1, 1,
0.06727605, 2.10572, -0.5068314, 0, 0.8196079, 1, 1,
0.06761689, 0.4544971, -1.371011, 0, 0.8156863, 1, 1,
0.0699511, -1.79147, 3.976841, 0, 0.8078431, 1, 1,
0.07439131, 3.073546, -0.02805573, 0, 0.8039216, 1, 1,
0.0748613, -0.2310924, 1.72456, 0, 0.7960784, 1, 1,
0.07522726, 0.0392086, 0.7445567, 0, 0.7882353, 1, 1,
0.07779834, 1.45301, 1.466047, 0, 0.7843137, 1, 1,
0.07991145, -0.4625359, 1.917171, 0, 0.7764706, 1, 1,
0.08287383, -0.1345626, 3.370295, 0, 0.772549, 1, 1,
0.09193899, 0.01133826, 0.362897, 0, 0.7647059, 1, 1,
0.09324997, 0.9127203, 0.8665355, 0, 0.7607843, 1, 1,
0.09437636, -0.4085869, 2.446984, 0, 0.7529412, 1, 1,
0.09574987, 0.1157541, 0.2623788, 0, 0.7490196, 1, 1,
0.09865466, -0.8905959, 3.480698, 0, 0.7411765, 1, 1,
0.1001855, 0.6957249, 0.8631842, 0, 0.7372549, 1, 1,
0.1128025, 0.3410946, 1.823988, 0, 0.7294118, 1, 1,
0.1136369, 0.6830949, 0.6195043, 0, 0.7254902, 1, 1,
0.1146813, 2.15525, -1.744189, 0, 0.7176471, 1, 1,
0.1229402, -0.6610142, 1.296271, 0, 0.7137255, 1, 1,
0.1252686, 1.085726, 1.252309, 0, 0.7058824, 1, 1,
0.1258896, 0.468855, -0.3353308, 0, 0.6980392, 1, 1,
0.1278458, -0.2215486, 1.722282, 0, 0.6941177, 1, 1,
0.1324727, 0.1044112, 0.6784239, 0, 0.6862745, 1, 1,
0.1325238, 0.284771, 0.8430815, 0, 0.682353, 1, 1,
0.1393918, -0.1321387, 2.811494, 0, 0.6745098, 1, 1,
0.1439563, 0.2111201, 0.2111446, 0, 0.6705883, 1, 1,
0.1466858, -0.8013412, 3.547663, 0, 0.6627451, 1, 1,
0.1487726, 1.640937, -0.774106, 0, 0.6588235, 1, 1,
0.1511587, -0.2383328, 2.370086, 0, 0.6509804, 1, 1,
0.153297, 0.1885645, 1.968847, 0, 0.6470588, 1, 1,
0.1540584, -1.229497, 2.593992, 0, 0.6392157, 1, 1,
0.1551992, 0.2365268, 3.037505, 0, 0.6352941, 1, 1,
0.1557605, 0.4901733, 0.2322401, 0, 0.627451, 1, 1,
0.1594943, -0.2417935, 2.922799, 0, 0.6235294, 1, 1,
0.1615097, -0.5005069, 0.1423821, 0, 0.6156863, 1, 1,
0.1631575, -1.134131, 3.698689, 0, 0.6117647, 1, 1,
0.1654994, 2.075018, -0.3518515, 0, 0.6039216, 1, 1,
0.1661782, -0.1327899, 1.048555, 0, 0.5960785, 1, 1,
0.1718562, -0.1472436, 2.917258, 0, 0.5921569, 1, 1,
0.1740236, 0.4658679, -1.206867, 0, 0.5843138, 1, 1,
0.1751258, 0.159911, -0.2551843, 0, 0.5803922, 1, 1,
0.1760454, -0.5621626, 2.226809, 0, 0.572549, 1, 1,
0.1767691, 0.6108852, -0.2098784, 0, 0.5686275, 1, 1,
0.1811915, 0.9464427, 0.7323758, 0, 0.5607843, 1, 1,
0.1822807, 1.200181, 1.240287, 0, 0.5568628, 1, 1,
0.1877379, 0.7533943, 0.1385894, 0, 0.5490196, 1, 1,
0.1881379, -0.403251, 1.322463, 0, 0.5450981, 1, 1,
0.1903377, 0.8234405, 1.967663, 0, 0.5372549, 1, 1,
0.1917743, -0.5189326, 3.064882, 0, 0.5333334, 1, 1,
0.1974123, 0.1540382, 1.060268, 0, 0.5254902, 1, 1,
0.1994274, -0.4924268, 2.289987, 0, 0.5215687, 1, 1,
0.2031161, 1.4257, 0.152279, 0, 0.5137255, 1, 1,
0.2072297, -1.33029, 2.49139, 0, 0.509804, 1, 1,
0.2090759, 0.3868154, -1.312841, 0, 0.5019608, 1, 1,
0.2156956, 0.2530796, 0.568874, 0, 0.4941176, 1, 1,
0.2187012, 2.138265, 0.1906562, 0, 0.4901961, 1, 1,
0.2240331, 0.229025, 0.825488, 0, 0.4823529, 1, 1,
0.2242116, -0.1299332, 0.53253, 0, 0.4784314, 1, 1,
0.2265838, 1.669811, 0.4689974, 0, 0.4705882, 1, 1,
0.2332183, -0.7501784, 4.767348, 0, 0.4666667, 1, 1,
0.2383428, -0.535499, 2.1385, 0, 0.4588235, 1, 1,
0.2385057, -0.3359375, 1.78648, 0, 0.454902, 1, 1,
0.2394076, -1.421659, 2.506489, 0, 0.4470588, 1, 1,
0.2405569, 2.295772, -1.462162, 0, 0.4431373, 1, 1,
0.246412, 1.491925, 0.2909288, 0, 0.4352941, 1, 1,
0.2486569, 0.7306448, 0.01074001, 0, 0.4313726, 1, 1,
0.2492786, -1.555608, 3.965955, 0, 0.4235294, 1, 1,
0.2530375, 0.4669316, 0.7764083, 0, 0.4196078, 1, 1,
0.2552386, -0.197036, 3.344592, 0, 0.4117647, 1, 1,
0.2620079, -1.712689, 5.003417, 0, 0.4078431, 1, 1,
0.2640725, 1.203418, 0.4056945, 0, 0.4, 1, 1,
0.2662284, -0.3598392, 2.279296, 0, 0.3921569, 1, 1,
0.2698194, -0.9976572, 2.300466, 0, 0.3882353, 1, 1,
0.2718062, 1.07298, 1.901249, 0, 0.3803922, 1, 1,
0.2728243, 0.6682091, -0.2195557, 0, 0.3764706, 1, 1,
0.2767847, 1.085666, -0.7357042, 0, 0.3686275, 1, 1,
0.2773755, -1.070399, 4.145862, 0, 0.3647059, 1, 1,
0.278877, -0.5117948, 1.767869, 0, 0.3568628, 1, 1,
0.2805904, -0.8398586, 2.790105, 0, 0.3529412, 1, 1,
0.2842442, 1.27962, 0.3778886, 0, 0.345098, 1, 1,
0.2862389, -0.9123857, 2.722843, 0, 0.3411765, 1, 1,
0.2896542, 0.1934002, 0.7618296, 0, 0.3333333, 1, 1,
0.2911672, 0.5572461, 1.421043, 0, 0.3294118, 1, 1,
0.2937487, 0.7447986, -1.139076, 0, 0.3215686, 1, 1,
0.2982867, -0.2294554, 1.473649, 0, 0.3176471, 1, 1,
0.2998993, 0.1352186, 0.9616496, 0, 0.3098039, 1, 1,
0.3044543, 1.377085, -0.2657121, 0, 0.3058824, 1, 1,
0.3065913, 1.493591, 0.02138343, 0, 0.2980392, 1, 1,
0.3076654, 0.1512266, 0.6770059, 0, 0.2901961, 1, 1,
0.3078819, 0.3105953, -0.8158691, 0, 0.2862745, 1, 1,
0.3083782, -0.4078352, 1.503796, 0, 0.2784314, 1, 1,
0.3103701, 1.164166, 1.158347, 0, 0.2745098, 1, 1,
0.3126096, 1.031179, -0.3016969, 0, 0.2666667, 1, 1,
0.3133049, 0.1842025, 0.9909124, 0, 0.2627451, 1, 1,
0.3158627, -2.844913, 5.019721, 0, 0.254902, 1, 1,
0.3161078, -0.3637091, 1.59328, 0, 0.2509804, 1, 1,
0.3194687, 0.005643802, 2.212378, 0, 0.2431373, 1, 1,
0.3203662, 0.1511854, 0.7584037, 0, 0.2392157, 1, 1,
0.3210094, 0.2791455, -1.102525, 0, 0.2313726, 1, 1,
0.3212845, -0.8920776, 1.413328, 0, 0.227451, 1, 1,
0.3214419, 0.3869354, 0.5935162, 0, 0.2196078, 1, 1,
0.3308269, 0.537837, 1.928687, 0, 0.2156863, 1, 1,
0.3343453, 2.118031, -0.6938478, 0, 0.2078431, 1, 1,
0.3345001, 0.3618469, 1.267185, 0, 0.2039216, 1, 1,
0.3394189, -0.6531603, 2.120384, 0, 0.1960784, 1, 1,
0.3428271, -0.2032062, 0.721505, 0, 0.1882353, 1, 1,
0.3446072, -0.4335536, 2.613925, 0, 0.1843137, 1, 1,
0.3459365, -1.466058, 2.961822, 0, 0.1764706, 1, 1,
0.3463863, -0.6246867, 3.969194, 0, 0.172549, 1, 1,
0.3497625, 0.1384354, 2.441224, 0, 0.1647059, 1, 1,
0.3517865, -1.631417, 1.554584, 0, 0.1607843, 1, 1,
0.3536031, 0.4658344, -1.073758, 0, 0.1529412, 1, 1,
0.3572473, -0.3186016, 2.788428, 0, 0.1490196, 1, 1,
0.359193, 0.6543707, -0.2821649, 0, 0.1411765, 1, 1,
0.3599799, -0.3406, 2.38262, 0, 0.1372549, 1, 1,
0.361583, -1.309857, 3.814973, 0, 0.1294118, 1, 1,
0.3633427, -0.6985918, 1.905503, 0, 0.1254902, 1, 1,
0.3666625, 0.4011507, 3.439261, 0, 0.1176471, 1, 1,
0.377808, -0.4031328, 1.432169, 0, 0.1137255, 1, 1,
0.3780183, -0.8896514, 3.203038, 0, 0.1058824, 1, 1,
0.3816378, -2.196656, 3.007001, 0, 0.09803922, 1, 1,
0.387897, 0.310593, 0.2255576, 0, 0.09411765, 1, 1,
0.391013, -1.386293, 3.570354, 0, 0.08627451, 1, 1,
0.3910416, -1.208101, 2.62156, 0, 0.08235294, 1, 1,
0.3933443, 0.06926061, 1.147688, 0, 0.07450981, 1, 1,
0.3945774, -0.2878805, 0.7970773, 0, 0.07058824, 1, 1,
0.3958063, -1.606118, 2.546282, 0, 0.0627451, 1, 1,
0.3978245, 0.8206357, -0.289992, 0, 0.05882353, 1, 1,
0.4004129, 0.5782934, 0.2845545, 0, 0.05098039, 1, 1,
0.4005073, -0.7378125, 2.88711, 0, 0.04705882, 1, 1,
0.4078374, 1.179408, 0.9280834, 0, 0.03921569, 1, 1,
0.410211, -1.820785, 2.802596, 0, 0.03529412, 1, 1,
0.4107059, 0.4954914, -0.6496269, 0, 0.02745098, 1, 1,
0.411155, -0.4139584, 3.767729, 0, 0.02352941, 1, 1,
0.4124222, 0.2884695, 1.123734, 0, 0.01568628, 1, 1,
0.4236369, 1.385144, 1.862585, 0, 0.01176471, 1, 1,
0.427483, -0.03513637, 2.002604, 0, 0.003921569, 1, 1,
0.4356928, -0.3855906, 2.952264, 0.003921569, 0, 1, 1,
0.4357441, -0.8701786, 3.297313, 0.007843138, 0, 1, 1,
0.4405748, -0.8411366, 3.346396, 0.01568628, 0, 1, 1,
0.4449214, 0.9212223, 0.7172101, 0.01960784, 0, 1, 1,
0.4521286, 1.022478, -0.5232097, 0.02745098, 0, 1, 1,
0.455156, -1.36408, 4.401709, 0.03137255, 0, 1, 1,
0.4556406, -1.041916, 3.024784, 0.03921569, 0, 1, 1,
0.4579652, 0.489061, 1.810509, 0.04313726, 0, 1, 1,
0.4581008, -0.192133, 1.859567, 0.05098039, 0, 1, 1,
0.4584311, 0.7640812, -0.3692848, 0.05490196, 0, 1, 1,
0.4725626, 1.659372, -0.04154968, 0.0627451, 0, 1, 1,
0.4845806, -1.055542, 2.32194, 0.06666667, 0, 1, 1,
0.4903797, 1.637751, -0.002331214, 0.07450981, 0, 1, 1,
0.49202, -0.7186272, 1.611911, 0.07843138, 0, 1, 1,
0.4993489, -1.61629, 1.449462, 0.08627451, 0, 1, 1,
0.5016761, -1.028834, 2.446192, 0.09019608, 0, 1, 1,
0.5027553, 0.886507, 2.347014, 0.09803922, 0, 1, 1,
0.5049208, 0.3504154, -0.5738476, 0.1058824, 0, 1, 1,
0.5053769, -0.5121242, 1.398086, 0.1098039, 0, 1, 1,
0.5059878, 1.141349, 2.86316, 0.1176471, 0, 1, 1,
0.5065098, 0.7159137, 0.5208552, 0.1215686, 0, 1, 1,
0.512657, 0.9122742, 0.02309476, 0.1294118, 0, 1, 1,
0.512998, -0.02904251, 2.25122, 0.1333333, 0, 1, 1,
0.5177131, -0.6525478, 2.317912, 0.1411765, 0, 1, 1,
0.5189823, 0.5531315, 0.6601121, 0.145098, 0, 1, 1,
0.5227324, -1.100659, 2.303715, 0.1529412, 0, 1, 1,
0.5242275, 1.139161, 0.5218408, 0.1568628, 0, 1, 1,
0.5253643, -0.01153293, 0.8031859, 0.1647059, 0, 1, 1,
0.5314757, -1.64629, 4.664191, 0.1686275, 0, 1, 1,
0.5351186, -0.3542166, 0.7082484, 0.1764706, 0, 1, 1,
0.5375811, -0.8258171, 2.375591, 0.1803922, 0, 1, 1,
0.5382533, -0.9892523, 2.258238, 0.1882353, 0, 1, 1,
0.5409187, 0.1321178, 0.7149129, 0.1921569, 0, 1, 1,
0.5430009, 0.6864061, 0.4262003, 0.2, 0, 1, 1,
0.5440516, 0.3116331, 0.355677, 0.2078431, 0, 1, 1,
0.5448031, 0.3301857, -0.6939256, 0.2117647, 0, 1, 1,
0.545442, 1.094152, -0.3869754, 0.2196078, 0, 1, 1,
0.552682, 1.132756, 0.1651708, 0.2235294, 0, 1, 1,
0.5529919, -1.261546, 2.854614, 0.2313726, 0, 1, 1,
0.5553062, 1.674744, -0.143252, 0.2352941, 0, 1, 1,
0.5582845, -0.3487395, 1.803509, 0.2431373, 0, 1, 1,
0.5624953, 1.467841, 1.93987, 0.2470588, 0, 1, 1,
0.5643942, -1.079243, 2.85362, 0.254902, 0, 1, 1,
0.5670432, -0.1028169, 2.07464, 0.2588235, 0, 1, 1,
0.5689417, -0.1378908, 2.196368, 0.2666667, 0, 1, 1,
0.5692136, -1.960099, 3.495793, 0.2705882, 0, 1, 1,
0.5706212, 0.06141577, 1.107138, 0.2784314, 0, 1, 1,
0.5708631, 0.5172333, 0.6920478, 0.282353, 0, 1, 1,
0.5759429, -0.32108, 2.747872, 0.2901961, 0, 1, 1,
0.5803766, -1.236751, 1.725208, 0.2941177, 0, 1, 1,
0.5815914, -0.1476036, 2.507177, 0.3019608, 0, 1, 1,
0.5854724, -0.8507913, 3.080634, 0.3098039, 0, 1, 1,
0.5907509, -0.52188, 1.767695, 0.3137255, 0, 1, 1,
0.59284, -1.860747, 3.709951, 0.3215686, 0, 1, 1,
0.5941871, -1.191971, 3.106951, 0.3254902, 0, 1, 1,
0.6007012, -1.537408, 2.017035, 0.3333333, 0, 1, 1,
0.6031114, 1.526374, 1.410191, 0.3372549, 0, 1, 1,
0.6112212, 0.08310368, 3.212158, 0.345098, 0, 1, 1,
0.611965, -0.7588041, 2.99011, 0.3490196, 0, 1, 1,
0.6153324, 1.26149, 1.313844, 0.3568628, 0, 1, 1,
0.6169958, -1.847971, 2.690376, 0.3607843, 0, 1, 1,
0.617116, 0.02668098, 1.410438, 0.3686275, 0, 1, 1,
0.6175859, 1.013553, 0.08371685, 0.372549, 0, 1, 1,
0.618816, 0.4995911, 2.348038, 0.3803922, 0, 1, 1,
0.6214741, 0.3810525, 0.4264543, 0.3843137, 0, 1, 1,
0.6265131, 0.6789052, -0.2391758, 0.3921569, 0, 1, 1,
0.6317384, 0.1454103, 1.819375, 0.3960784, 0, 1, 1,
0.6344687, 0.1662422, 0.9217786, 0.4039216, 0, 1, 1,
0.6369971, 0.8964582, 0.3126077, 0.4117647, 0, 1, 1,
0.6395144, 0.5866511, 2.188607, 0.4156863, 0, 1, 1,
0.6404389, -1.386824, 2.845565, 0.4235294, 0, 1, 1,
0.6480621, 0.9961502, 1.165339, 0.427451, 0, 1, 1,
0.6514423, 0.6469656, -1.50636, 0.4352941, 0, 1, 1,
0.6567191, -0.5978327, 1.974945, 0.4392157, 0, 1, 1,
0.6608, -0.4510676, 0.5677279, 0.4470588, 0, 1, 1,
0.663548, 0.7037408, 0.45384, 0.4509804, 0, 1, 1,
0.6659127, -0.9153357, 2.909556, 0.4588235, 0, 1, 1,
0.6673106, 0.05465569, 0.9098718, 0.4627451, 0, 1, 1,
0.6684926, -0.331135, 3.117061, 0.4705882, 0, 1, 1,
0.6737887, -1.220989, 1.718695, 0.4745098, 0, 1, 1,
0.6740196, -0.2631358, 1.649775, 0.4823529, 0, 1, 1,
0.6742835, 0.2308673, -0.4404714, 0.4862745, 0, 1, 1,
0.6746696, -0.009131058, -0.007381401, 0.4941176, 0, 1, 1,
0.6777482, -0.4385786, 2.478253, 0.5019608, 0, 1, 1,
0.6791527, 0.06587973, 1.165638, 0.5058824, 0, 1, 1,
0.6795104, -3.038641, 3.737863, 0.5137255, 0, 1, 1,
0.6815914, 0.398315, 0.0369527, 0.5176471, 0, 1, 1,
0.6845837, 0.09948273, 0.1495038, 0.5254902, 0, 1, 1,
0.6934001, 0.2422244, 1.933083, 0.5294118, 0, 1, 1,
0.6935196, -0.4340439, 1.407135, 0.5372549, 0, 1, 1,
0.6943988, 0.1275869, 1.076507, 0.5411765, 0, 1, 1,
0.696063, 0.9663164, 0.7806491, 0.5490196, 0, 1, 1,
0.7021286, -0.281913, 3.62146, 0.5529412, 0, 1, 1,
0.7092406, -1.453527, 2.515996, 0.5607843, 0, 1, 1,
0.7105564, -0.06988081, 2.571457, 0.5647059, 0, 1, 1,
0.7127828, -1.062828, 5.583196, 0.572549, 0, 1, 1,
0.7131676, -1.28877, 4.392693, 0.5764706, 0, 1, 1,
0.7144814, 0.04720273, 1.817158, 0.5843138, 0, 1, 1,
0.7148586, -0.4678332, 2.930931, 0.5882353, 0, 1, 1,
0.720648, 0.7768857, 2.580006, 0.5960785, 0, 1, 1,
0.7209218, -1.410082, 2.494233, 0.6039216, 0, 1, 1,
0.7273011, 0.4702344, 1.781904, 0.6078432, 0, 1, 1,
0.7291456, -0.1252335, 3.144207, 0.6156863, 0, 1, 1,
0.736455, 0.2328022, 0.01918227, 0.6196079, 0, 1, 1,
0.7370683, 0.9066746, 0.5202906, 0.627451, 0, 1, 1,
0.7470935, -0.337128, 1.444657, 0.6313726, 0, 1, 1,
0.7471691, 0.8070327, 0.9242392, 0.6392157, 0, 1, 1,
0.7487654, -1.496192, 3.152187, 0.6431373, 0, 1, 1,
0.7491353, -0.6820031, 3.215313, 0.6509804, 0, 1, 1,
0.7529306, -0.1056227, 2.072883, 0.654902, 0, 1, 1,
0.7532438, 1.090607, -0.8363804, 0.6627451, 0, 1, 1,
0.7628716, -1.313269, 0.7602371, 0.6666667, 0, 1, 1,
0.7664762, 0.301019, 0.6904054, 0.6745098, 0, 1, 1,
0.7667196, 2.084531, -0.1666128, 0.6784314, 0, 1, 1,
0.7685953, -0.3413927, 1.54574, 0.6862745, 0, 1, 1,
0.7726471, 0.4092364, -0.01859622, 0.6901961, 0, 1, 1,
0.7731238, 1.069541, -0.7756495, 0.6980392, 0, 1, 1,
0.7756569, 0.8505427, -1.613069, 0.7058824, 0, 1, 1,
0.7756899, 0.964915, -0.1904379, 0.7098039, 0, 1, 1,
0.778773, -0.5652911, 1.797408, 0.7176471, 0, 1, 1,
0.7791579, 0.4141978, 0.291505, 0.7215686, 0, 1, 1,
0.7815333, 1.461075, 1.859204, 0.7294118, 0, 1, 1,
0.7825837, -0.7798225, 1.911273, 0.7333333, 0, 1, 1,
0.784304, 0.5148372, 0.5621434, 0.7411765, 0, 1, 1,
0.785446, -0.7471247, 0.9572706, 0.7450981, 0, 1, 1,
0.7863865, -0.623556, 1.402513, 0.7529412, 0, 1, 1,
0.7892579, 0.707938, 2.231813, 0.7568628, 0, 1, 1,
0.8005043, -0.07979173, 0.4475853, 0.7647059, 0, 1, 1,
0.803265, -2.160494, 1.235352, 0.7686275, 0, 1, 1,
0.8089514, 0.3288251, 1.38874, 0.7764706, 0, 1, 1,
0.811587, 0.004919731, 1.314864, 0.7803922, 0, 1, 1,
0.8135756, 0.06397357, 4.764151, 0.7882353, 0, 1, 1,
0.8245848, -1.340071, 1.763646, 0.7921569, 0, 1, 1,
0.8259696, 0.3453136, 2.473802, 0.8, 0, 1, 1,
0.8283952, -1.142312, 1.823332, 0.8078431, 0, 1, 1,
0.8346782, 0.2065641, 0.2078484, 0.8117647, 0, 1, 1,
0.8452486, -2.394518, 2.877004, 0.8196079, 0, 1, 1,
0.8542156, -0.07829732, 2.571033, 0.8235294, 0, 1, 1,
0.8581781, -0.9457638, 2.629743, 0.8313726, 0, 1, 1,
0.8607061, -0.3602313, 1.250481, 0.8352941, 0, 1, 1,
0.8633398, -0.5920073, 2.612631, 0.8431373, 0, 1, 1,
0.8651139, -0.3242837, 1.516766, 0.8470588, 0, 1, 1,
0.8671704, -0.5714377, 2.817368, 0.854902, 0, 1, 1,
0.8695372, 0.04193058, 1.731966, 0.8588235, 0, 1, 1,
0.8733119, -0.5063203, 1.241798, 0.8666667, 0, 1, 1,
0.8743986, -2.905376, 2.198975, 0.8705882, 0, 1, 1,
0.8800584, -1.346335, 1.007477, 0.8784314, 0, 1, 1,
0.8864371, 0.3370757, 0.4868546, 0.8823529, 0, 1, 1,
0.8869582, 1.386508, 2.971113, 0.8901961, 0, 1, 1,
0.8875136, 1.368878, 0.770394, 0.8941177, 0, 1, 1,
0.8939524, 0.873242, 0.4765978, 0.9019608, 0, 1, 1,
0.9013929, 1.085513, 0.9635599, 0.9098039, 0, 1, 1,
0.9104803, -0.2106225, 0.8234554, 0.9137255, 0, 1, 1,
0.9124817, 0.3244227, 0.9180446, 0.9215686, 0, 1, 1,
0.9140118, 1.646074, 1.820848, 0.9254902, 0, 1, 1,
0.9187402, -0.170185, 1.576332, 0.9333333, 0, 1, 1,
0.9212972, -1.01861, 1.137745, 0.9372549, 0, 1, 1,
0.922917, -1.693601, 3.267841, 0.945098, 0, 1, 1,
0.9409009, -1.006142, 2.155272, 0.9490196, 0, 1, 1,
0.9426412, -0.7444769, 3.505589, 0.9568627, 0, 1, 1,
0.947907, 0.9018258, 0.6887059, 0.9607843, 0, 1, 1,
0.9482879, -0.713944, 2.686402, 0.9686275, 0, 1, 1,
0.9485932, 0.7159848, 2.050148, 0.972549, 0, 1, 1,
0.9493579, -1.424556, 2.316853, 0.9803922, 0, 1, 1,
0.9509303, -0.4909287, 0.01184125, 0.9843137, 0, 1, 1,
0.9604415, 1.193577, 1.570801, 0.9921569, 0, 1, 1,
0.9668316, -0.2605938, 2.275942, 0.9960784, 0, 1, 1,
0.9706305, -1.479614, 1.901287, 1, 0, 0.9960784, 1,
0.9770962, 0.857089, -1.323695, 1, 0, 0.9882353, 1,
0.9850963, -0.5520583, 2.289221, 1, 0, 0.9843137, 1,
0.9876095, 0.7324247, 0.9349507, 1, 0, 0.9764706, 1,
0.9904144, -1.494626, 2.439411, 1, 0, 0.972549, 1,
0.9976265, 0.6050714, 2.687629, 1, 0, 0.9647059, 1,
0.9985633, 1.274564, 0.920784, 1, 0, 0.9607843, 1,
1.00182, -0.6250728, 1.831838, 1, 0, 0.9529412, 1,
1.004467, 0.6804359, 2.006996, 1, 0, 0.9490196, 1,
1.004616, -1.271203, 6.158188, 1, 0, 0.9411765, 1,
1.010565, -1.009113, 1.898587, 1, 0, 0.9372549, 1,
1.010579, -0.5653656, 3.387532, 1, 0, 0.9294118, 1,
1.015809, -0.7589413, 3.866315, 1, 0, 0.9254902, 1,
1.033483, 0.1002899, 1.007373, 1, 0, 0.9176471, 1,
1.040961, -0.2323393, 1.75311, 1, 0, 0.9137255, 1,
1.041801, 0.7067955, -0.1027964, 1, 0, 0.9058824, 1,
1.043172, 0.9016552, 1.65748, 1, 0, 0.9019608, 1,
1.044598, 1.49407, 1.584193, 1, 0, 0.8941177, 1,
1.053518, -0.04292389, 1.154281, 1, 0, 0.8862745, 1,
1.067582, -1.676763, 1.646877, 1, 0, 0.8823529, 1,
1.07825, 1.572166, -0.5206472, 1, 0, 0.8745098, 1,
1.078448, 2.023166, 0.8211324, 1, 0, 0.8705882, 1,
1.078952, 0.3891876, 0.1892874, 1, 0, 0.8627451, 1,
1.079176, 0.5434051, 1.785229, 1, 0, 0.8588235, 1,
1.080926, -0.467894, 0.4760729, 1, 0, 0.8509804, 1,
1.082483, 0.4292818, 1.34357, 1, 0, 0.8470588, 1,
1.084455, 0.7275737, 1.419306, 1, 0, 0.8392157, 1,
1.091375, -1.840414, 3.688874, 1, 0, 0.8352941, 1,
1.102391, -0.2040855, 0.8497078, 1, 0, 0.827451, 1,
1.102929, 0.3680928, 1.639511, 1, 0, 0.8235294, 1,
1.105142, 0.538986, 2.100395, 1, 0, 0.8156863, 1,
1.106627, -1.048386, 4.430189, 1, 0, 0.8117647, 1,
1.10862, -1.220938, 1.996685, 1, 0, 0.8039216, 1,
1.115564, 0.5937591, 0.2490127, 1, 0, 0.7960784, 1,
1.120591, -0.8895487, 3.961041, 1, 0, 0.7921569, 1,
1.121192, 1.23821, 1.005577, 1, 0, 0.7843137, 1,
1.124626, 0.8896534, 3.214146, 1, 0, 0.7803922, 1,
1.131536, 0.8883054, 0.8988435, 1, 0, 0.772549, 1,
1.132502, -0.2780931, 1.276494, 1, 0, 0.7686275, 1,
1.150349, 0.9055922, 0.6803442, 1, 0, 0.7607843, 1,
1.155392, -0.698409, 1.45587, 1, 0, 0.7568628, 1,
1.175535, 0.8022128, 2.066879, 1, 0, 0.7490196, 1,
1.187983, 0.9395297, 2.0309, 1, 0, 0.7450981, 1,
1.190017, 0.8862471, 0.2640913, 1, 0, 0.7372549, 1,
1.202813, -1.28653, 1.459181, 1, 0, 0.7333333, 1,
1.206609, 0.2286441, -0.7081873, 1, 0, 0.7254902, 1,
1.21787, -0.5702797, 2.323722, 1, 0, 0.7215686, 1,
1.218134, -1.126932, 2.198061, 1, 0, 0.7137255, 1,
1.220562, 1.504712, 2.03481, 1, 0, 0.7098039, 1,
1.231864, 0.5468811, 0.6450764, 1, 0, 0.7019608, 1,
1.233994, 1.217523, 0.7334601, 1, 0, 0.6941177, 1,
1.250874, -1.476714, 1.725824, 1, 0, 0.6901961, 1,
1.251516, 1.065948, 2.462101, 1, 0, 0.682353, 1,
1.262285, 0.3343686, 2.176332, 1, 0, 0.6784314, 1,
1.277333, 1.494832, 3.377271, 1, 0, 0.6705883, 1,
1.283354, -1.179603, 1.823236, 1, 0, 0.6666667, 1,
1.286572, -0.916038, 0.2107798, 1, 0, 0.6588235, 1,
1.28829, -0.735427, 1.054179, 1, 0, 0.654902, 1,
1.291988, -1.083654, 2.880597, 1, 0, 0.6470588, 1,
1.303775, -0.2949547, 1.97569, 1, 0, 0.6431373, 1,
1.305448, 0.4627836, -0.3149212, 1, 0, 0.6352941, 1,
1.308088, 0.3718033, 1.605791, 1, 0, 0.6313726, 1,
1.314263, -0.2084439, 0.630805, 1, 0, 0.6235294, 1,
1.316487, 0.374113, 2.372722, 1, 0, 0.6196079, 1,
1.328702, -1.298597, 1.297092, 1, 0, 0.6117647, 1,
1.336704, -0.1601839, 1.013783, 1, 0, 0.6078432, 1,
1.341719, 0.01174819, 1.79857, 1, 0, 0.6, 1,
1.342169, 1.493955, 0.6884047, 1, 0, 0.5921569, 1,
1.348303, -0.6886187, 1.60752, 1, 0, 0.5882353, 1,
1.353075, -0.2042676, 1.314147, 1, 0, 0.5803922, 1,
1.356805, 0.02278299, 1.890364, 1, 0, 0.5764706, 1,
1.369301, -1.387176, 2.430261, 1, 0, 0.5686275, 1,
1.382594, -0.1619056, 0.8140341, 1, 0, 0.5647059, 1,
1.382832, 0.07577801, -0.3902906, 1, 0, 0.5568628, 1,
1.388013, 0.4677882, -1.091925, 1, 0, 0.5529412, 1,
1.39196, 1.743936, -1.181109, 1, 0, 0.5450981, 1,
1.398397, 1.323322, -0.7413829, 1, 0, 0.5411765, 1,
1.400388, 0.09298828, 2.790538, 1, 0, 0.5333334, 1,
1.404073, -1.726815, 1.576101, 1, 0, 0.5294118, 1,
1.409673, -0.9009325, 1.319681, 1, 0, 0.5215687, 1,
1.418822, -0.6283839, 0.7265087, 1, 0, 0.5176471, 1,
1.430225, -1.205862, 2.511029, 1, 0, 0.509804, 1,
1.433651, 0.3856862, 2.097201, 1, 0, 0.5058824, 1,
1.434697, 0.8102032, -0.6394556, 1, 0, 0.4980392, 1,
1.438524, -1.100921, 2.203328, 1, 0, 0.4901961, 1,
1.455454, 1.197537, 0.4363367, 1, 0, 0.4862745, 1,
1.476037, -1.794137, 2.062682, 1, 0, 0.4784314, 1,
1.480692, 0.6006033, 1.980949, 1, 0, 0.4745098, 1,
1.482383, -0.6265253, 0.06239417, 1, 0, 0.4666667, 1,
1.487398, -1.615465, 1.526014, 1, 0, 0.4627451, 1,
1.495732, -0.1806701, 0.9873903, 1, 0, 0.454902, 1,
1.50108, -1.335498, 2.18334, 1, 0, 0.4509804, 1,
1.504259, 0.7377115, -0.4910955, 1, 0, 0.4431373, 1,
1.508691, -1.197918, 3.237499, 1, 0, 0.4392157, 1,
1.513128, -0.02972935, 3.290262, 1, 0, 0.4313726, 1,
1.513758, 0.267863, 1.018852, 1, 0, 0.427451, 1,
1.513844, 0.7111648, 1.046422, 1, 0, 0.4196078, 1,
1.525652, 0.2394659, 1.597006, 1, 0, 0.4156863, 1,
1.531106, -0.5145957, 1.686406, 1, 0, 0.4078431, 1,
1.532319, 0.2163355, 0.2708521, 1, 0, 0.4039216, 1,
1.536065, 0.2824309, 0.7953507, 1, 0, 0.3960784, 1,
1.542394, 0.9805958, 1.22428, 1, 0, 0.3882353, 1,
1.54787, 0.8603821, 0.7672246, 1, 0, 0.3843137, 1,
1.550914, 0.03030162, 1.537071, 1, 0, 0.3764706, 1,
1.553786, 0.3030916, 0.09859, 1, 0, 0.372549, 1,
1.557179, 0.8442284, 1.586078, 1, 0, 0.3647059, 1,
1.583747, 0.8082888, 1.477946, 1, 0, 0.3607843, 1,
1.592376, 0.06461918, 1.466446, 1, 0, 0.3529412, 1,
1.622953, 0.1875154, -0.1438643, 1, 0, 0.3490196, 1,
1.625244, -0.5184183, 0.8821599, 1, 0, 0.3411765, 1,
1.628083, -1.950217, 3.044727, 1, 0, 0.3372549, 1,
1.643831, -1.47006, 3.157225, 1, 0, 0.3294118, 1,
1.647605, 0.4066732, 0.9916625, 1, 0, 0.3254902, 1,
1.654454, -1.035297, 2.909185, 1, 0, 0.3176471, 1,
1.65837, -0.7205683, 2.598103, 1, 0, 0.3137255, 1,
1.665255, -0.3752677, 1.404285, 1, 0, 0.3058824, 1,
1.671502, -0.220858, 5.385165, 1, 0, 0.2980392, 1,
1.672696, 0.5093616, 1.394166, 1, 0, 0.2941177, 1,
1.701822, -1.167119, 1.651335, 1, 0, 0.2862745, 1,
1.716983, -1.038593, 1.496746, 1, 0, 0.282353, 1,
1.723039, 0.8433713, -0.1114359, 1, 0, 0.2745098, 1,
1.751283, 0.6943839, 0.8289006, 1, 0, 0.2705882, 1,
1.756891, 1.124166, 0.6783831, 1, 0, 0.2627451, 1,
1.768339, -0.3261908, 1.651805, 1, 0, 0.2588235, 1,
1.793036, 0.5813964, 1.243291, 1, 0, 0.2509804, 1,
1.814325, -1.18646, 2.579536, 1, 0, 0.2470588, 1,
1.823124, 0.4556222, -0.4549588, 1, 0, 0.2392157, 1,
1.829888, 2.05634, 1.594319, 1, 0, 0.2352941, 1,
1.838534, -2.218759, 4.05764, 1, 0, 0.227451, 1,
1.852365, 0.6516505, 0.4327315, 1, 0, 0.2235294, 1,
1.864642, 0.5892131, 1.126206, 1, 0, 0.2156863, 1,
1.892195, 0.7891223, 0.3980187, 1, 0, 0.2117647, 1,
1.931858, 0.4122802, 2.098018, 1, 0, 0.2039216, 1,
1.933643, -0.7824568, 1.338397, 1, 0, 0.1960784, 1,
1.93463, -0.6152563, 3.142879, 1, 0, 0.1921569, 1,
1.937034, -0.234264, 2.168791, 1, 0, 0.1843137, 1,
1.938336, 0.7823645, -0.9800927, 1, 0, 0.1803922, 1,
1.952657, 0.4614559, 0.8871108, 1, 0, 0.172549, 1,
1.963658, -1.074177, 1.020375, 1, 0, 0.1686275, 1,
1.983377, 0.630872, 1.146057, 1, 0, 0.1607843, 1,
1.988217, 0.9016597, 0.5941911, 1, 0, 0.1568628, 1,
1.98963, 1.185026, 3.329237, 1, 0, 0.1490196, 1,
1.991169, -0.03460035, 2.196698, 1, 0, 0.145098, 1,
2.048666, -0.2261079, 0.6058919, 1, 0, 0.1372549, 1,
2.05861, -0.6406962, 0.9994678, 1, 0, 0.1333333, 1,
2.074917, 0.7302348, -0.5767592, 1, 0, 0.1254902, 1,
2.100651, 1.300386, 2.13353, 1, 0, 0.1215686, 1,
2.117167, -0.7192774, 2.12571, 1, 0, 0.1137255, 1,
2.121641, 2.578457, 0.7747745, 1, 0, 0.1098039, 1,
2.133035, 1.16257, 0.2148071, 1, 0, 0.1019608, 1,
2.136437, -0.3574646, 0.339583, 1, 0, 0.09411765, 1,
2.235048, 1.216881, 0.3357468, 1, 0, 0.09019608, 1,
2.331128, -2.181428, 0.1796913, 1, 0, 0.08235294, 1,
2.441188, 0.6859907, 0.9789795, 1, 0, 0.07843138, 1,
2.489368, -0.6192233, 1.630244, 1, 0, 0.07058824, 1,
2.519866, -0.2388494, 1.239535, 1, 0, 0.06666667, 1,
2.551009, -0.6793231, 2.63501, 1, 0, 0.05882353, 1,
2.795748, 2.081062, 1.214012, 1, 0, 0.05490196, 1,
2.812422, 0.2422245, 1.181334, 1, 0, 0.04705882, 1,
2.835687, 0.3343286, -0.09479491, 1, 0, 0.04313726, 1,
2.859308, 1.48698, 1.384554, 1, 0, 0.03529412, 1,
2.869268, 0.268976, 1.794411, 1, 0, 0.03137255, 1,
2.920532, 2.066007, -0.7256869, 1, 0, 0.02352941, 1,
2.921109, 1.312571, 4.307663, 1, 0, 0.01960784, 1,
3.260161, 0.2570687, 2.338766, 1, 0, 0.01176471, 1,
3.333488, 1.127933, 1.935194, 1, 0, 0.007843138, 1
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
0.1431413, -5.725006, -6.471788, 0, -0.5, 0.5, 0.5,
0.1431413, -5.725006, -6.471788, 1, -0.5, 0.5, 0.5,
0.1431413, -5.725006, -6.471788, 1, 1.5, 0.5, 0.5,
0.1431413, -5.725006, -6.471788, 0, 1.5, 0.5, 0.5
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
-4.128732, -0.6881261, -6.471788, 0, -0.5, 0.5, 0.5,
-4.128732, -0.6881261, -6.471788, 1, -0.5, 0.5, 0.5,
-4.128732, -0.6881261, -6.471788, 1, 1.5, 0.5, 0.5,
-4.128732, -0.6881261, -6.471788, 0, 1.5, 0.5, 0.5
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
-4.128732, -5.725006, 0.7584546, 0, -0.5, 0.5, 0.5,
-4.128732, -5.725006, 0.7584546, 1, -0.5, 0.5, 0.5,
-4.128732, -5.725006, 0.7584546, 1, 1.5, 0.5, 0.5,
-4.128732, -5.725006, 0.7584546, 0, 1.5, 0.5, 0.5
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
-3, -4.562649, -4.803271,
3, -4.562649, -4.803271,
-3, -4.562649, -4.803271,
-3, -4.756375, -5.081357,
-2, -4.562649, -4.803271,
-2, -4.756375, -5.081357,
-1, -4.562649, -4.803271,
-1, -4.756375, -5.081357,
0, -4.562649, -4.803271,
0, -4.756375, -5.081357,
1, -4.562649, -4.803271,
1, -4.756375, -5.081357,
2, -4.562649, -4.803271,
2, -4.756375, -5.081357,
3, -4.562649, -4.803271,
3, -4.756375, -5.081357
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
-3, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
-3, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
-3, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
-3, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
-2, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
-2, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
-2, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
-2, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
-1, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
-1, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
-1, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
-1, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
0, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
0, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
0, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
0, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
1, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
1, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
1, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
1, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
2, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
2, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
2, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
2, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5,
3, -5.143827, -5.637529, 0, -0.5, 0.5, 0.5,
3, -5.143827, -5.637529, 1, -0.5, 0.5, 0.5,
3, -5.143827, -5.637529, 1, 1.5, 0.5, 0.5,
3, -5.143827, -5.637529, 0, 1.5, 0.5, 0.5
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
-3.142915, -4, -4.803271,
-3.142915, 2, -4.803271,
-3.142915, -4, -4.803271,
-3.307218, -4, -5.081357,
-3.142915, -2, -4.803271,
-3.307218, -2, -5.081357,
-3.142915, 0, -4.803271,
-3.307218, 0, -5.081357,
-3.142915, 2, -4.803271,
-3.307218, 2, -5.081357
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
"-4",
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
-3.635824, -4, -5.637529, 0, -0.5, 0.5, 0.5,
-3.635824, -4, -5.637529, 1, -0.5, 0.5, 0.5,
-3.635824, -4, -5.637529, 1, 1.5, 0.5, 0.5,
-3.635824, -4, -5.637529, 0, 1.5, 0.5, 0.5,
-3.635824, -2, -5.637529, 0, -0.5, 0.5, 0.5,
-3.635824, -2, -5.637529, 1, -0.5, 0.5, 0.5,
-3.635824, -2, -5.637529, 1, 1.5, 0.5, 0.5,
-3.635824, -2, -5.637529, 0, 1.5, 0.5, 0.5,
-3.635824, 0, -5.637529, 0, -0.5, 0.5, 0.5,
-3.635824, 0, -5.637529, 1, -0.5, 0.5, 0.5,
-3.635824, 0, -5.637529, 1, 1.5, 0.5, 0.5,
-3.635824, 0, -5.637529, 0, 1.5, 0.5, 0.5,
-3.635824, 2, -5.637529, 0, -0.5, 0.5, 0.5,
-3.635824, 2, -5.637529, 1, -0.5, 0.5, 0.5,
-3.635824, 2, -5.637529, 1, 1.5, 0.5, 0.5,
-3.635824, 2, -5.637529, 0, 1.5, 0.5, 0.5
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
-3.142915, -4.562649, -4,
-3.142915, -4.562649, 6,
-3.142915, -4.562649, -4,
-3.307218, -4.756375, -4,
-3.142915, -4.562649, -2,
-3.307218, -4.756375, -2,
-3.142915, -4.562649, 0,
-3.307218, -4.756375, 0,
-3.142915, -4.562649, 2,
-3.307218, -4.756375, 2,
-3.142915, -4.562649, 4,
-3.307218, -4.756375, 4,
-3.142915, -4.562649, 6,
-3.307218, -4.756375, 6
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
-3.635824, -5.143827, -4, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, -4, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, -4, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, -4, 0, 1.5, 0.5, 0.5,
-3.635824, -5.143827, -2, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, -2, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, -2, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, -2, 0, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 0, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 0, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 0, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 0, 0, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 2, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 2, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 2, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 2, 0, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 4, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 4, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 4, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 4, 0, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 6, 0, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 6, 1, -0.5, 0.5, 0.5,
-3.635824, -5.143827, 6, 1, 1.5, 0.5, 0.5,
-3.635824, -5.143827, 6, 0, 1.5, 0.5, 0.5
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
-3.142915, -4.562649, -4.803271,
-3.142915, 3.186397, -4.803271,
-3.142915, -4.562649, 6.32018,
-3.142915, 3.186397, 6.32018,
-3.142915, -4.562649, -4.803271,
-3.142915, -4.562649, 6.32018,
-3.142915, 3.186397, -4.803271,
-3.142915, 3.186397, 6.32018,
-3.142915, -4.562649, -4.803271,
3.429198, -4.562649, -4.803271,
-3.142915, -4.562649, 6.32018,
3.429198, -4.562649, 6.32018,
-3.142915, 3.186397, -4.803271,
3.429198, 3.186397, -4.803271,
-3.142915, 3.186397, 6.32018,
3.429198, 3.186397, 6.32018,
3.429198, -4.562649, -4.803271,
3.429198, 3.186397, -4.803271,
3.429198, -4.562649, 6.32018,
3.429198, 3.186397, 6.32018,
3.429198, -4.562649, -4.803271,
3.429198, -4.562649, 6.32018,
3.429198, 3.186397, -4.803271,
3.429198, 3.186397, 6.32018
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
var radius = 8.044724;
var distance = 35.79189;
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
mvMatrix.translate( -0.1431413, 0.6881261, -0.7584546 );
mvMatrix.scale( 1.323488, 1.122476, 0.7819618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.79189);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
2-aminobutane_2-buty<-read.table("2-aminobutane_2-buty.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-aminobutane_2-buty$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminobutane_2' not found
```

```r
y<-2-aminobutane_2-buty$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminobutane_2' not found
```

```r
z<-2-aminobutane_2-buty$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminobutane_2' not found
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
-3.047205, -0.2489445, -1.707442, 0, 0, 1, 1, 1,
-2.896733, -0.697649, -2.287362, 1, 0, 0, 1, 1,
-2.850481, -1.141754, -0.9643646, 1, 0, 0, 1, 1,
-2.704546, 0.3555473, -1.45133, 1, 0, 0, 1, 1,
-2.580842, -1.086045, -2.656274, 1, 0, 0, 1, 1,
-2.566966, 0.1511386, -1.251038, 1, 0, 0, 1, 1,
-2.531333, 1.050711, -0.3312468, 0, 0, 0, 1, 1,
-2.523784, -0.7860057, -2.644705, 0, 0, 0, 1, 1,
-2.508687, -0.9151447, -2.304357, 0, 0, 0, 1, 1,
-2.392555, -1.036918, 0.02384814, 0, 0, 0, 1, 1,
-2.379079, -0.130765, -1.247222, 0, 0, 0, 1, 1,
-2.368239, 1.121268, -0.5772692, 0, 0, 0, 1, 1,
-2.320129, 0.5742894, -3.888166, 0, 0, 0, 1, 1,
-2.233989, -2.095049, -2.149262, 1, 1, 1, 1, 1,
-2.233524, -0.8403526, -2.759981, 1, 1, 1, 1, 1,
-2.230234, 0.790348, -1.949191, 1, 1, 1, 1, 1,
-2.210863, -1.197055, -2.132943, 1, 1, 1, 1, 1,
-2.19755, 0.8280771, -0.6663389, 1, 1, 1, 1, 1,
-2.175341, -2.155527, -1.934725, 1, 1, 1, 1, 1,
-2.153189, -0.2405172, -2.109773, 1, 1, 1, 1, 1,
-2.104265, -0.06573859, -1.098613, 1, 1, 1, 1, 1,
-2.052574, 0.8970019, -1.170963, 1, 1, 1, 1, 1,
-2.033629, 0.31825, -1.79874, 1, 1, 1, 1, 1,
-1.994187, -1.162006, -0.9317956, 1, 1, 1, 1, 1,
-1.990093, 1.420855, -0.8511419, 1, 1, 1, 1, 1,
-1.985972, -0.5194216, -2.273952, 1, 1, 1, 1, 1,
-1.951552, -1.93777, -3.68749, 1, 1, 1, 1, 1,
-1.943311, -0.308575, -1.900086, 1, 1, 1, 1, 1,
-1.920675, 0.6437706, -1.93142, 0, 0, 1, 1, 1,
-1.886818, 0.3288958, -1.299175, 1, 0, 0, 1, 1,
-1.884816, -0.5923507, -1.832018, 1, 0, 0, 1, 1,
-1.87934, -0.538131, -0.3318674, 1, 0, 0, 1, 1,
-1.878256, 1.139429, -0.1197114, 1, 0, 0, 1, 1,
-1.876935, -0.2749214, -2.1196, 1, 0, 0, 1, 1,
-1.873406, 1.136161, -1.207296, 0, 0, 0, 1, 1,
-1.865851, -0.8371777, -3.74656, 0, 0, 0, 1, 1,
-1.86436, -0.6057365, -1.561876, 0, 0, 0, 1, 1,
-1.862689, 0.4875931, -2.224421, 0, 0, 0, 1, 1,
-1.847587, -0.6354696, -2.902547, 0, 0, 0, 1, 1,
-1.83037, -0.5939961, -1.451198, 0, 0, 0, 1, 1,
-1.798227, 0.4745831, 0.1196299, 0, 0, 0, 1, 1,
-1.7954, -0.589788, -1.939972, 1, 1, 1, 1, 1,
-1.791049, 0.1285763, -1.223406, 1, 1, 1, 1, 1,
-1.790276, 0.2348154, 0.9949765, 1, 1, 1, 1, 1,
-1.765145, -0.001627629, -2.494837, 1, 1, 1, 1, 1,
-1.751131, 0.7598385, -0.4822611, 1, 1, 1, 1, 1,
-1.740523, -0.9127265, -1.241043, 1, 1, 1, 1, 1,
-1.736852, 0.07900006, -2.216971, 1, 1, 1, 1, 1,
-1.736658, -0.01219692, -3.002854, 1, 1, 1, 1, 1,
-1.712226, -0.1364527, -1.62909, 1, 1, 1, 1, 1,
-1.697667, -0.5232776, -0.526143, 1, 1, 1, 1, 1,
-1.696552, 0.5320993, 0.1309514, 1, 1, 1, 1, 1,
-1.684809, -1.198744, -0.7708372, 1, 1, 1, 1, 1,
-1.675632, -0.2367437, -1.59478, 1, 1, 1, 1, 1,
-1.661783, -0.3900229, -0.7934672, 1, 1, 1, 1, 1,
-1.642069, 0.4313054, -1.604066, 1, 1, 1, 1, 1,
-1.637044, 0.4500227, -1.82585, 0, 0, 1, 1, 1,
-1.606732, -0.8180603, -2.391688, 1, 0, 0, 1, 1,
-1.602611, 0.31321, -3.439463, 1, 0, 0, 1, 1,
-1.601934, -0.7482858, -2.079555, 1, 0, 0, 1, 1,
-1.569122, 1.06156, -1.860302, 1, 0, 0, 1, 1,
-1.538271, -0.1396477, -2.558992, 1, 0, 0, 1, 1,
-1.533066, 0.4051795, -2.215266, 0, 0, 0, 1, 1,
-1.520352, -1.630252, -2.131985, 0, 0, 0, 1, 1,
-1.502231, 0.7670611, -2.546603, 0, 0, 0, 1, 1,
-1.499974, -0.01143617, -2.037624, 0, 0, 0, 1, 1,
-1.497889, -1.694019, -4.005195, 0, 0, 0, 1, 1,
-1.479493, 0.1299965, 0.4351354, 0, 0, 0, 1, 1,
-1.47903, -0.9619687, -3.305552, 0, 0, 0, 1, 1,
-1.476656, 0.9232346, -0.5085534, 1, 1, 1, 1, 1,
-1.475994, -0.2547703, -1.036765, 1, 1, 1, 1, 1,
-1.474953, 0.1784427, -2.607562, 1, 1, 1, 1, 1,
-1.472217, -0.8712752, -0.9998626, 1, 1, 1, 1, 1,
-1.469254, -0.8933955, -1.338444, 1, 1, 1, 1, 1,
-1.465711, -1.36062, -1.979499, 1, 1, 1, 1, 1,
-1.455323, 1.691977, -1.864163, 1, 1, 1, 1, 1,
-1.445328, -0.6551154, -1.969381, 1, 1, 1, 1, 1,
-1.445109, -1.86511, -1.940445, 1, 1, 1, 1, 1,
-1.436554, -1.654867, -2.325376, 1, 1, 1, 1, 1,
-1.434556, -1.451526, -4.641279, 1, 1, 1, 1, 1,
-1.430393, 0.7369458, -1.246505, 1, 1, 1, 1, 1,
-1.427192, 1.316449, -2.3908, 1, 1, 1, 1, 1,
-1.423708, 0.8139808, -2.295336, 1, 1, 1, 1, 1,
-1.421315, -0.185322, -2.324689, 1, 1, 1, 1, 1,
-1.419282, -0.03319452, -2.09428, 0, 0, 1, 1, 1,
-1.418314, -0.1713153, 0.01842691, 1, 0, 0, 1, 1,
-1.407434, 0.2726203, -2.5433, 1, 0, 0, 1, 1,
-1.390071, 1.976434, -1.815646, 1, 0, 0, 1, 1,
-1.382043, 0.5607203, -2.786605, 1, 0, 0, 1, 1,
-1.378852, 0.2047114, 0.06157672, 1, 0, 0, 1, 1,
-1.37831, 2.144396, -0.5861225, 0, 0, 0, 1, 1,
-1.370231, -0.6693465, -1.200824, 0, 0, 0, 1, 1,
-1.36277, 0.3698395, -0.08672634, 0, 0, 0, 1, 1,
-1.347988, 1.851625, -0.4239398, 0, 0, 0, 1, 1,
-1.341865, -0.4437228, -2.348866, 0, 0, 0, 1, 1,
-1.331509, -1.430905, -3.228998, 0, 0, 0, 1, 1,
-1.331427, -1.28991, -2.043792, 0, 0, 0, 1, 1,
-1.329777, 0.7782636, -1.120495, 1, 1, 1, 1, 1,
-1.324111, 2.272345, 0.300083, 1, 1, 1, 1, 1,
-1.306185, 1.025531, -1.106225, 1, 1, 1, 1, 1,
-1.304555, -0.4496001, -1.902063, 1, 1, 1, 1, 1,
-1.303982, -0.4472571, -2.116569, 1, 1, 1, 1, 1,
-1.300061, -2.157158, -3.222721, 1, 1, 1, 1, 1,
-1.296711, -0.04374857, 0.5430239, 1, 1, 1, 1, 1,
-1.288857, -0.8252109, -1.568493, 1, 1, 1, 1, 1,
-1.285218, 0.158271, -1.020851, 1, 1, 1, 1, 1,
-1.271523, -1.252796, -1.967976, 1, 1, 1, 1, 1,
-1.270744, 0.09829346, -1.157231, 1, 1, 1, 1, 1,
-1.269767, 0.3093784, -1.329491, 1, 1, 1, 1, 1,
-1.267503, -0.4841363, -3.182305, 1, 1, 1, 1, 1,
-1.252563, -0.248711, -2.299942, 1, 1, 1, 1, 1,
-1.251228, 1.804969, -0.3762195, 1, 1, 1, 1, 1,
-1.247514, 0.09907322, -0.6905093, 0, 0, 1, 1, 1,
-1.246791, -0.7321654, -1.070053, 1, 0, 0, 1, 1,
-1.240493, 1.067328, -2.019794, 1, 0, 0, 1, 1,
-1.231301, -0.3244303, -1.783133, 1, 0, 0, 1, 1,
-1.224663, -0.7298501, -2.343581, 1, 0, 0, 1, 1,
-1.223857, 0.5860045, -0.2076019, 1, 0, 0, 1, 1,
-1.222439, 1.39483, -1.987601, 0, 0, 0, 1, 1,
-1.211725, -0.06798015, -0.9337969, 0, 0, 0, 1, 1,
-1.208152, -0.1239134, -1.650655, 0, 0, 0, 1, 1,
-1.204542, 0.7237492, -2.045082, 0, 0, 0, 1, 1,
-1.192873, 1.655069, 1.583715, 0, 0, 0, 1, 1,
-1.192175, 0.05088859, -2.55568, 0, 0, 0, 1, 1,
-1.186098, 0.5755095, -1.209167, 0, 0, 0, 1, 1,
-1.174426, 0.3212622, -0.2590789, 1, 1, 1, 1, 1,
-1.158576, 0.4781945, -0.9526225, 1, 1, 1, 1, 1,
-1.150968, 0.9849709, 0.1360146, 1, 1, 1, 1, 1,
-1.149323, 0.5236725, -2.681187, 1, 1, 1, 1, 1,
-1.148562, 1.532248, -0.6799862, 1, 1, 1, 1, 1,
-1.145944, -0.2617368, -2.387789, 1, 1, 1, 1, 1,
-1.145826, 1.746306, -1.372865, 1, 1, 1, 1, 1,
-1.141871, 1.346963, 1.116321, 1, 1, 1, 1, 1,
-1.138537, -0.881479, -0.4926695, 1, 1, 1, 1, 1,
-1.131725, 0.8230826, -0.7994413, 1, 1, 1, 1, 1,
-1.12885, 0.1212498, -1.895266, 1, 1, 1, 1, 1,
-1.128826, -0.04182541, -1.892319, 1, 1, 1, 1, 1,
-1.126533, -1.034457, -3.490507, 1, 1, 1, 1, 1,
-1.125181, 0.8071435, -2.168965, 1, 1, 1, 1, 1,
-1.124215, -0.7030174, -2.132589, 1, 1, 1, 1, 1,
-1.12338, 0.1281697, -2.546125, 0, 0, 1, 1, 1,
-1.123255, 0.5069876, -0.6322058, 1, 0, 0, 1, 1,
-1.110232, 0.03705294, -1.411372, 1, 0, 0, 1, 1,
-1.101192, 1.399859, -0.7721654, 1, 0, 0, 1, 1,
-1.097455, -0.05764188, -0.2634746, 1, 0, 0, 1, 1,
-1.093154, -1.002999, -3.136506, 1, 0, 0, 1, 1,
-1.089462, 0.2155085, -0.6045868, 0, 0, 0, 1, 1,
-1.076116, -0.6638014, -1.817458, 0, 0, 0, 1, 1,
-1.075109, -0.4174127, -0.806913, 0, 0, 0, 1, 1,
-1.07505, 0.1902691, -1.770464, 0, 0, 0, 1, 1,
-1.074717, 0.9045172, -0.2246662, 0, 0, 0, 1, 1,
-1.070068, -1.159214, -1.981164, 0, 0, 0, 1, 1,
-1.0695, 0.8672537, 0.04991831, 0, 0, 0, 1, 1,
-1.067807, -0.2585553, -1.358735, 1, 1, 1, 1, 1,
-1.063619, -1.08503, -2.357539, 1, 1, 1, 1, 1,
-1.06127, 1.217205, -0.4266736, 1, 1, 1, 1, 1,
-1.059731, -1.855831, -2.221821, 1, 1, 1, 1, 1,
-1.059703, 0.07404382, -0.2301548, 1, 1, 1, 1, 1,
-1.059642, 2.057307, -1.81677, 1, 1, 1, 1, 1,
-1.058295, -0.9240544, -1.295903, 1, 1, 1, 1, 1,
-1.058278, 1.883142, -0.5442066, 1, 1, 1, 1, 1,
-1.058084, -0.6494648, -1.791357, 1, 1, 1, 1, 1,
-1.032393, 0.1473016, -2.10736, 1, 1, 1, 1, 1,
-1.031087, 1.027117, 0.3991614, 1, 1, 1, 1, 1,
-1.025724, 2.061198, -0.9583812, 1, 1, 1, 1, 1,
-1.011885, -4.449799, -2.910487, 1, 1, 1, 1, 1,
-1.010003, 0.5014606, -1.416291, 1, 1, 1, 1, 1,
-1.005008, 1.258146, -1.651025, 1, 1, 1, 1, 1,
-0.9987358, -1.439402, -0.6007363, 0, 0, 1, 1, 1,
-0.9867383, -0.6700444, -2.167161, 1, 0, 0, 1, 1,
-0.9721211, 0.8030463, -1.086943, 1, 0, 0, 1, 1,
-0.9693435, -0.3773925, -2.781104, 1, 0, 0, 1, 1,
-0.9693088, -0.532149, -2.478105, 1, 0, 0, 1, 1,
-0.9691216, -0.320665, -0.2219895, 1, 0, 0, 1, 1,
-0.9687101, -0.5283284, -3.114827, 0, 0, 0, 1, 1,
-0.9664915, -1.27113, -2.09123, 0, 0, 0, 1, 1,
-0.9652027, -0.1435726, -0.8714483, 0, 0, 0, 1, 1,
-0.9637359, -1.156557, -1.991349, 0, 0, 0, 1, 1,
-0.9578223, -0.3756252, -1.116693, 0, 0, 0, 1, 1,
-0.944328, -0.6359276, -3.581426, 0, 0, 0, 1, 1,
-0.9431316, -2.743049, -3.525007, 0, 0, 0, 1, 1,
-0.9425506, 0.4472326, -0.5065815, 1, 1, 1, 1, 1,
-0.9410583, 2.322089, -1.800614, 1, 1, 1, 1, 1,
-0.9367266, 0.635829, -2.290736, 1, 1, 1, 1, 1,
-0.9345941, -0.1627223, -2.066339, 1, 1, 1, 1, 1,
-0.9331913, -0.1101802, -1.125631, 1, 1, 1, 1, 1,
-0.9151195, 0.01929712, -3.151524, 1, 1, 1, 1, 1,
-0.9094574, -0.579433, -2.037848, 1, 1, 1, 1, 1,
-0.9042004, 2.906198, -0.2061057, 1, 1, 1, 1, 1,
-0.9011682, -0.9657553, -2.912618, 1, 1, 1, 1, 1,
-0.8977986, -0.4322031, -2.261292, 1, 1, 1, 1, 1,
-0.8950855, 0.1562826, -0.7672396, 1, 1, 1, 1, 1,
-0.8943379, 0.2271179, -1.207939, 1, 1, 1, 1, 1,
-0.8923772, -0.8703243, -3.816455, 1, 1, 1, 1, 1,
-0.8889862, 1.171871, -2.517051, 1, 1, 1, 1, 1,
-0.8795879, -0.4322186, -2.036002, 1, 1, 1, 1, 1,
-0.8752062, -0.5227569, -2.293627, 0, 0, 1, 1, 1,
-0.8667507, -2.319146, -1.841825, 1, 0, 0, 1, 1,
-0.8660712, -1.329431, -2.811576, 1, 0, 0, 1, 1,
-0.860986, 1.247743, -1.01186, 1, 0, 0, 1, 1,
-0.8422984, 1.393912, 0.05627646, 1, 0, 0, 1, 1,
-0.8395408, 0.6093065, -0.4382365, 1, 0, 0, 1, 1,
-0.8356711, 2.132642, -1.668572, 0, 0, 0, 1, 1,
-0.8348007, -1.659958, -3.427889, 0, 0, 0, 1, 1,
-0.8258125, 0.6181816, -0.9595696, 0, 0, 0, 1, 1,
-0.8256921, 2.252781, 0.2507716, 0, 0, 0, 1, 1,
-0.8221315, -1.519514, -2.083231, 0, 0, 0, 1, 1,
-0.8206725, 0.6483826, -0.9028628, 0, 0, 0, 1, 1,
-0.820212, -1.02216, -1.492906, 0, 0, 0, 1, 1,
-0.8195551, 0.4553896, 0.7737816, 1, 1, 1, 1, 1,
-0.8063478, -1.234654, -3.336044, 1, 1, 1, 1, 1,
-0.8028238, 1.502084, -2.772915, 1, 1, 1, 1, 1,
-0.802588, -0.4889742, -0.9106433, 1, 1, 1, 1, 1,
-0.8005388, -0.8137825, -2.629825, 1, 1, 1, 1, 1,
-0.7999628, 0.8555315, -1.483129, 1, 1, 1, 1, 1,
-0.7886485, -1.257492, -4.212947, 1, 1, 1, 1, 1,
-0.7861249, -0.6832119, -2.725675, 1, 1, 1, 1, 1,
-0.781166, -1.32872, -4.18076, 1, 1, 1, 1, 1,
-0.7810078, 0.2555436, -2.307329, 1, 1, 1, 1, 1,
-0.7807872, -0.6469241, -2.12314, 1, 1, 1, 1, 1,
-0.7714022, -0.05594207, -1.882995, 1, 1, 1, 1, 1,
-0.7707554, 0.2752919, -1.079798, 1, 1, 1, 1, 1,
-0.7679997, -0.7912139, -2.962156, 1, 1, 1, 1, 1,
-0.7653911, -0.5652026, -3.658062, 1, 1, 1, 1, 1,
-0.763918, 0.3954123, -1.026768, 0, 0, 1, 1, 1,
-0.7623055, 1.496343, 0.008545788, 1, 0, 0, 1, 1,
-0.7612593, 0.8421515, -3.156279, 1, 0, 0, 1, 1,
-0.7590279, -0.3420879, -2.013676, 1, 0, 0, 1, 1,
-0.7535046, 0.5619873, 0.5291009, 1, 0, 0, 1, 1,
-0.7505177, 0.3423268, -1.313117, 1, 0, 0, 1, 1,
-0.7501612, 1.945906, -1.611233, 0, 0, 0, 1, 1,
-0.7446123, 1.992873, 2.20532, 0, 0, 0, 1, 1,
-0.7387966, -0.07217645, 0.3283, 0, 0, 0, 1, 1,
-0.7356269, -0.9071279, -2.366637, 0, 0, 0, 1, 1,
-0.7283321, -1.281669, -2.939154, 0, 0, 0, 1, 1,
-0.7270952, -0.5900914, -0.8267649, 0, 0, 0, 1, 1,
-0.7210707, 0.187943, -0.2812784, 0, 0, 0, 1, 1,
-0.7163273, -0.1677755, -2.328056, 1, 1, 1, 1, 1,
-0.7155129, -1.264066, -1.332122, 1, 1, 1, 1, 1,
-0.7146753, -0.3881062, -2.546869, 1, 1, 1, 1, 1,
-0.6988927, -0.09770014, -2.629698, 1, 1, 1, 1, 1,
-0.6981646, -0.1321543, -1.248754, 1, 1, 1, 1, 1,
-0.6947724, -1.869599, -2.258479, 1, 1, 1, 1, 1,
-0.6947486, -0.7922217, -3.655463, 1, 1, 1, 1, 1,
-0.6932015, 0.7089081, -0.8980202, 1, 1, 1, 1, 1,
-0.6916546, -0.07456724, -3.117698, 1, 1, 1, 1, 1,
-0.6905906, -0.5818991, -1.210409, 1, 1, 1, 1, 1,
-0.6888767, -1.520944, -2.460989, 1, 1, 1, 1, 1,
-0.6823552, -0.4021394, -2.750892, 1, 1, 1, 1, 1,
-0.6819838, 0.3970999, 0.8188966, 1, 1, 1, 1, 1,
-0.667559, 1.516729, -1.155041, 1, 1, 1, 1, 1,
-0.661847, -0.3708609, -0.9923848, 1, 1, 1, 1, 1,
-0.6603738, -1.094599, -2.975595, 0, 0, 1, 1, 1,
-0.658714, -1.163538, -1.05288, 1, 0, 0, 1, 1,
-0.6546092, 1.895129, -1.394327, 1, 0, 0, 1, 1,
-0.650601, 0.4372381, -2.684351, 1, 0, 0, 1, 1,
-0.6503873, -0.2827742, -0.6755922, 1, 0, 0, 1, 1,
-0.6497681, -0.3320883, -3.378175, 1, 0, 0, 1, 1,
-0.6466486, -0.1618854, -1.545416, 0, 0, 0, 1, 1,
-0.6464694, 1.978566, -0.2640527, 0, 0, 0, 1, 1,
-0.6461682, 1.383332, -0.5902437, 0, 0, 0, 1, 1,
-0.6448426, 2.282948, 0.513199, 0, 0, 0, 1, 1,
-0.6447029, 0.8543446, 0.1607486, 0, 0, 0, 1, 1,
-0.6437263, 0.04055673, -1.790072, 0, 0, 0, 1, 1,
-0.6405161, -2.021271, -3.417029, 0, 0, 0, 1, 1,
-0.6380926, 0.5977612, -0.1659985, 1, 1, 1, 1, 1,
-0.6370873, -1.125632, -2.605656, 1, 1, 1, 1, 1,
-0.6306955, -1.047457, -2.991144, 1, 1, 1, 1, 1,
-0.6306795, 1.024231, -0.9463311, 1, 1, 1, 1, 1,
-0.6304983, 0.494079, 0.00568096, 1, 1, 1, 1, 1,
-0.6228408, 0.4054087, -0.1035284, 1, 1, 1, 1, 1,
-0.6141851, -0.9292947, -2.658562, 1, 1, 1, 1, 1,
-0.614076, -0.182183, -2.436618, 1, 1, 1, 1, 1,
-0.611567, 0.5462852, -0.7183378, 1, 1, 1, 1, 1,
-0.6114463, 0.4321581, -2.177781, 1, 1, 1, 1, 1,
-0.6070641, 1.767554, -1.099884, 1, 1, 1, 1, 1,
-0.604435, -0.04769743, -1.32434, 1, 1, 1, 1, 1,
-0.602618, 1.018123, -1.147038, 1, 1, 1, 1, 1,
-0.602532, 0.7250081, 1.519831, 1, 1, 1, 1, 1,
-0.5980298, -1.41145, -3.845984, 1, 1, 1, 1, 1,
-0.5884455, 0.8426794, -0.6525484, 0, 0, 1, 1, 1,
-0.5853437, 0.03549546, -2.332032, 1, 0, 0, 1, 1,
-0.5818295, 0.02167987, -3.705773, 1, 0, 0, 1, 1,
-0.5780042, 0.402739, -0.9471967, 1, 0, 0, 1, 1,
-0.5734338, 1.537005, -0.8617857, 1, 0, 0, 1, 1,
-0.5705603, 0.09000508, -3.752366, 1, 0, 0, 1, 1,
-0.5693895, -1.701787, -3.653297, 0, 0, 0, 1, 1,
-0.5659409, -1.748154, -2.670413, 0, 0, 0, 1, 1,
-0.5656689, 0.425914, -0.6808193, 0, 0, 0, 1, 1,
-0.5645505, 0.09960595, -0.6532308, 0, 0, 0, 1, 1,
-0.5613959, 0.1464417, 0.0482781, 0, 0, 0, 1, 1,
-0.5598374, 0.4411845, -0.6620157, 0, 0, 0, 1, 1,
-0.5579886, 0.1619407, -1.368948, 0, 0, 0, 1, 1,
-0.5546381, 0.5083506, -1.163732, 1, 1, 1, 1, 1,
-0.5490696, 1.379515, -0.03397958, 1, 1, 1, 1, 1,
-0.548287, -0.09472613, -3.823715, 1, 1, 1, 1, 1,
-0.53617, 0.6379671, -0.4968068, 1, 1, 1, 1, 1,
-0.5351396, 1.367005, -2.331916, 1, 1, 1, 1, 1,
-0.5331354, -1.194004, -3.625892, 1, 1, 1, 1, 1,
-0.529985, 0.7508481, -1.789775, 1, 1, 1, 1, 1,
-0.5273129, 0.207771, -0.5714688, 1, 1, 1, 1, 1,
-0.5261205, 0.9245331, -0.1734114, 1, 1, 1, 1, 1,
-0.5236484, -0.1685325, -4.065717, 1, 1, 1, 1, 1,
-0.5232341, -0.6529436, -0.2669387, 1, 1, 1, 1, 1,
-0.5203092, 0.9492224, -1.230717, 1, 1, 1, 1, 1,
-0.5186702, -1.303378, -2.865083, 1, 1, 1, 1, 1,
-0.5173128, -2.406298, -1.276836, 1, 1, 1, 1, 1,
-0.5168331, 0.5145316, -2.064077, 1, 1, 1, 1, 1,
-0.5163716, 0.7794065, 0.8404837, 0, 0, 1, 1, 1,
-0.5139067, -0.4125237, -2.870219, 1, 0, 0, 1, 1,
-0.5108676, 0.6649836, 0.9939533, 1, 0, 0, 1, 1,
-0.5103197, 0.2108326, -0.45424, 1, 0, 0, 1, 1,
-0.5054499, 0.460942, 0.7922019, 1, 0, 0, 1, 1,
-0.5050504, -1.108076, -4.038247, 1, 0, 0, 1, 1,
-0.5025696, 1.713198, 0.623131, 0, 0, 0, 1, 1,
-0.501547, 1.401937, -1.840492, 0, 0, 0, 1, 1,
-0.4982412, -0.5020783, -4.04945, 0, 0, 0, 1, 1,
-0.4952731, 0.4502731, -0.5764377, 0, 0, 0, 1, 1,
-0.4919806, 1.338927, -1.30256, 0, 0, 0, 1, 1,
-0.4870203, 0.3707168, -1.244696, 0, 0, 0, 1, 1,
-0.4849003, 0.5520272, -1.051211, 0, 0, 0, 1, 1,
-0.4820549, 1.344185, 0.566767, 1, 1, 1, 1, 1,
-0.4790817, 1.222786, -2.827573, 1, 1, 1, 1, 1,
-0.4786404, -1.55382, -2.103332, 1, 1, 1, 1, 1,
-0.4750824, -0.4875278, -2.608818, 1, 1, 1, 1, 1,
-0.4739959, 0.5751204, -2.674502, 1, 1, 1, 1, 1,
-0.4706285, 0.127341, -2.858051, 1, 1, 1, 1, 1,
-0.4636918, 0.7346554, -0.951605, 1, 1, 1, 1, 1,
-0.4613917, -0.3156382, -2.887119, 1, 1, 1, 1, 1,
-0.4611601, 0.8379831, -2.478198, 1, 1, 1, 1, 1,
-0.4572895, -0.932214, -2.456398, 1, 1, 1, 1, 1,
-0.4569722, -0.528957, -3.035577, 1, 1, 1, 1, 1,
-0.4522426, 0.6877518, -1.725548, 1, 1, 1, 1, 1,
-0.4520936, 0.8706304, -1.625905, 1, 1, 1, 1, 1,
-0.4513606, -0.5059567, -3.480996, 1, 1, 1, 1, 1,
-0.4505545, -0.2746801, -2.190195, 1, 1, 1, 1, 1,
-0.4503764, 0.9210579, -1.499983, 0, 0, 1, 1, 1,
-0.4406899, -0.1484791, -1.028828, 1, 0, 0, 1, 1,
-0.4363008, -0.9843147, -3.596694, 1, 0, 0, 1, 1,
-0.4331238, 0.9703482, 0.1908527, 1, 0, 0, 1, 1,
-0.4320964, -1.674748, -2.476946, 1, 0, 0, 1, 1,
-0.4309794, -0.3454416, -2.921204, 1, 0, 0, 1, 1,
-0.4263585, 0.9033177, -0.1200329, 0, 0, 0, 1, 1,
-0.4219775, 0.8873929, 0.5711188, 0, 0, 0, 1, 1,
-0.4218507, 0.01519619, -3.292222, 0, 0, 0, 1, 1,
-0.4214037, -0.1080306, 0.6667064, 0, 0, 0, 1, 1,
-0.4211481, -0.4267131, -2.584172, 0, 0, 0, 1, 1,
-0.4162543, 0.1942336, -0.4028605, 0, 0, 0, 1, 1,
-0.4135626, 0.1960336, -2.093763, 0, 0, 0, 1, 1,
-0.4126128, -0.5089685, 0.03088735, 1, 1, 1, 1, 1,
-0.4066292, 0.699223, -0.7178628, 1, 1, 1, 1, 1,
-0.4007345, 1.571881, 0.1576296, 1, 1, 1, 1, 1,
-0.3975419, -1.109573, -2.658178, 1, 1, 1, 1, 1,
-0.3968308, 0.9150041, -0.2644566, 1, 1, 1, 1, 1,
-0.3899954, -1.105011, -2.123072, 1, 1, 1, 1, 1,
-0.3848043, 0.4412097, 0.1020281, 1, 1, 1, 1, 1,
-0.3843223, 1.542213, 1.525452, 1, 1, 1, 1, 1,
-0.3837428, 0.5336724, -0.1002266, 1, 1, 1, 1, 1,
-0.3823816, -0.5973961, -0.8053354, 1, 1, 1, 1, 1,
-0.3788408, -1.343476, -3.011455, 1, 1, 1, 1, 1,
-0.3737709, 1.144465, -2.099788, 1, 1, 1, 1, 1,
-0.3704797, 0.3987358, -0.3755673, 1, 1, 1, 1, 1,
-0.3690617, -0.8665187, -2.951914, 1, 1, 1, 1, 1,
-0.3630882, -0.411526, -2.983021, 1, 1, 1, 1, 1,
-0.3617269, 0.3767089, -1.089284, 0, 0, 1, 1, 1,
-0.3610704, 1.239833, 3.425863, 1, 0, 0, 1, 1,
-0.3607261, 0.7327834, -0.2391741, 1, 0, 0, 1, 1,
-0.3570956, -0.7767014, -3.854809, 1, 0, 0, 1, 1,
-0.3561467, -0.2098414, -2.554285, 1, 0, 0, 1, 1,
-0.3506403, 0.2228274, -2.012704, 1, 0, 0, 1, 1,
-0.35021, -0.07768302, -0.4985141, 0, 0, 0, 1, 1,
-0.3496706, -2.290346, -3.174741, 0, 0, 0, 1, 1,
-0.3496528, -0.3654669, -3.494756, 0, 0, 0, 1, 1,
-0.3473521, -0.3938352, -1.807123, 0, 0, 0, 1, 1,
-0.3466579, 0.4118677, -0.6150787, 0, 0, 0, 1, 1,
-0.3418365, 0.6668152, -0.06474714, 0, 0, 0, 1, 1,
-0.340777, -0.9589122, -2.306503, 0, 0, 0, 1, 1,
-0.3393101, 1.163906, -0.7393043, 1, 1, 1, 1, 1,
-0.3375824, -0.174313, -1.797875, 1, 1, 1, 1, 1,
-0.3366905, 0.2671239, -2.380255, 1, 1, 1, 1, 1,
-0.3346388, -0.3075187, -2.150523, 1, 1, 1, 1, 1,
-0.3336122, -0.3611381, -4.069031, 1, 1, 1, 1, 1,
-0.3325307, -1.223424, -2.105131, 1, 1, 1, 1, 1,
-0.3255996, -0.1089111, -1.338427, 1, 1, 1, 1, 1,
-0.3170192, 1.007456, -0.9977805, 1, 1, 1, 1, 1,
-0.3157084, -0.9216831, -2.899922, 1, 1, 1, 1, 1,
-0.3117003, -1.149467, -4.416294, 1, 1, 1, 1, 1,
-0.311299, 1.983747, -0.7122886, 1, 1, 1, 1, 1,
-0.3097315, 0.3092952, -0.1642377, 1, 1, 1, 1, 1,
-0.3094804, -0.0691745, -2.681785, 1, 1, 1, 1, 1,
-0.3086026, 0.002245788, -0.7100726, 1, 1, 1, 1, 1,
-0.3070923, 0.618723, -0.5942638, 1, 1, 1, 1, 1,
-0.3038846, 0.6246052, 0.1542131, 0, 0, 1, 1, 1,
-0.3031467, 0.1038814, -2.434337, 1, 0, 0, 1, 1,
-0.2973019, -0.4086578, -0.7680526, 1, 0, 0, 1, 1,
-0.2884571, -1.101633, -2.144913, 1, 0, 0, 1, 1,
-0.2863108, -0.4408162, -3.167445, 1, 0, 0, 1, 1,
-0.2860565, -1.162964, -2.663702, 1, 0, 0, 1, 1,
-0.2853224, 0.05438045, -1.273115, 0, 0, 0, 1, 1,
-0.2794287, -0.05556336, -1.255712, 0, 0, 0, 1, 1,
-0.2757484, 0.1902026, -2.387012, 0, 0, 0, 1, 1,
-0.2745222, -0.04858292, -1.079246, 0, 0, 0, 1, 1,
-0.2716091, 0.1746283, -0.3052568, 0, 0, 0, 1, 1,
-0.2660207, 0.5260938, 0.2280353, 0, 0, 0, 1, 1,
-0.2640382, -0.4938078, -2.807644, 0, 0, 0, 1, 1,
-0.2637644, -1.397912, -3.378551, 1, 1, 1, 1, 1,
-0.2622321, 2.146636, 0.07123709, 1, 1, 1, 1, 1,
-0.2615245, -2.207684, -3.151687, 1, 1, 1, 1, 1,
-0.2614697, -0.16784, -2.420176, 1, 1, 1, 1, 1,
-0.2577582, -1.342814, -2.351918, 1, 1, 1, 1, 1,
-0.256765, 0.2004922, -1.773927, 1, 1, 1, 1, 1,
-0.254967, 1.592126, -1.143327, 1, 1, 1, 1, 1,
-0.254886, 1.656635, 0.02851464, 1, 1, 1, 1, 1,
-0.2511115, -0.7019798, -2.8929, 1, 1, 1, 1, 1,
-0.2476738, 1.028929, -0.6709912, 1, 1, 1, 1, 1,
-0.2469558, 1.886896, -1.591788, 1, 1, 1, 1, 1,
-0.245068, -0.5986921, -0.7802389, 1, 1, 1, 1, 1,
-0.2429141, -0.1778242, -2.103282, 1, 1, 1, 1, 1,
-0.2417168, 0.9474709, 1.620744, 1, 1, 1, 1, 1,
-0.2408547, -1.612468, -3.870736, 1, 1, 1, 1, 1,
-0.240689, -0.4213758, -1.643955, 0, 0, 1, 1, 1,
-0.238608, 0.08181908, -1.380392, 1, 0, 0, 1, 1,
-0.2371832, 0.8908347, 0.05609631, 1, 0, 0, 1, 1,
-0.2367423, -0.7284424, -2.323088, 1, 0, 0, 1, 1,
-0.235885, -1.561835, -3.065353, 1, 0, 0, 1, 1,
-0.2316896, -1.295633, -1.653322, 1, 0, 0, 1, 1,
-0.2307779, -0.3530623, -2.408922, 0, 0, 0, 1, 1,
-0.2260034, 0.40036, -0.7240348, 0, 0, 0, 1, 1,
-0.2254193, 0.8425227, -1.928615, 0, 0, 0, 1, 1,
-0.2252201, 1.608367, 0.7389723, 0, 0, 0, 1, 1,
-0.2243288, 0.89624, -0.1502443, 0, 0, 0, 1, 1,
-0.2190655, 1.223719, 0.2954396, 0, 0, 0, 1, 1,
-0.2112815, 0.7281194, -3.083017, 0, 0, 0, 1, 1,
-0.2078912, 0.2891623, -0.7819059, 1, 1, 1, 1, 1,
-0.2062781, -0.8305155, -2.789722, 1, 1, 1, 1, 1,
-0.1996534, -0.2131814, -2.700956, 1, 1, 1, 1, 1,
-0.1971295, 0.7465717, -0.6211402, 1, 1, 1, 1, 1,
-0.1971271, 0.6386513, -0.8474929, 1, 1, 1, 1, 1,
-0.1952647, -0.259202, -4.627656, 1, 1, 1, 1, 1,
-0.1941224, 0.2807299, -0.8512432, 1, 1, 1, 1, 1,
-0.1908621, 0.6148388, -0.5215864, 1, 1, 1, 1, 1,
-0.18897, -0.1175661, -1.871338, 1, 1, 1, 1, 1,
-0.1870457, -0.09053575, -1.359588, 1, 1, 1, 1, 1,
-0.183065, 0.6710336, 0.09375894, 1, 1, 1, 1, 1,
-0.1824665, -0.2383925, -3.25484, 1, 1, 1, 1, 1,
-0.1813749, 0.5138719, 2.478726, 1, 1, 1, 1, 1,
-0.1781992, 0.2017602, -0.9137523, 1, 1, 1, 1, 1,
-0.176766, 1.391614, -1.140734, 1, 1, 1, 1, 1,
-0.1762912, 0.7312719, -1.081877, 0, 0, 1, 1, 1,
-0.1749303, 0.06394727, -1.059299, 1, 0, 0, 1, 1,
-0.1715977, 1.456585, -1.746272, 1, 0, 0, 1, 1,
-0.1714402, -0.5958448, -2.773061, 1, 0, 0, 1, 1,
-0.1609567, -0.582303, -1.383198, 1, 0, 0, 1, 1,
-0.1516175, 0.3224624, 0.07222611, 1, 0, 0, 1, 1,
-0.1505991, -1.034165, -2.707677, 0, 0, 0, 1, 1,
-0.1500176, 0.7345212, 0.6542125, 0, 0, 0, 1, 1,
-0.1465844, 0.009958949, -1.508727, 0, 0, 0, 1, 1,
-0.1463404, -0.9647317, -3.709512, 0, 0, 0, 1, 1,
-0.1386233, 0.3241253, -0.1160923, 0, 0, 0, 1, 1,
-0.1357713, 0.7052311, -1.26146, 0, 0, 0, 1, 1,
-0.133697, 0.01049339, -0.1344192, 0, 0, 0, 1, 1,
-0.131702, -0.4745606, -2.358009, 1, 1, 1, 1, 1,
-0.1295016, 0.3417463, 0.3896313, 1, 1, 1, 1, 1,
-0.1220494, 0.9668334, -0.8030472, 1, 1, 1, 1, 1,
-0.1185686, -0.2299872, -3.180576, 1, 1, 1, 1, 1,
-0.1166295, -0.9540338, -3.971837, 1, 1, 1, 1, 1,
-0.1107056, 0.02345094, -2.075893, 1, 1, 1, 1, 1,
-0.1085414, 0.2618431, -0.5693832, 1, 1, 1, 1, 1,
-0.1046919, -0.6209822, -4.188526, 1, 1, 1, 1, 1,
-0.1028219, -0.5669248, -2.730818, 1, 1, 1, 1, 1,
-0.1025143, -0.4578276, -3.396427, 1, 1, 1, 1, 1,
-0.09891901, -1.338288, -2.022129, 1, 1, 1, 1, 1,
-0.09566081, 0.08173049, -0.6467532, 1, 1, 1, 1, 1,
-0.09398996, 0.6878942, 1.98341, 1, 1, 1, 1, 1,
-0.0938524, -0.482959, -4.386611, 1, 1, 1, 1, 1,
-0.08803511, 0.8307471, 0.7809699, 1, 1, 1, 1, 1,
-0.0865714, -0.2721144, -3.412104, 0, 0, 1, 1, 1,
-0.08634691, -0.2465379, -2.479574, 1, 0, 0, 1, 1,
-0.08470275, 1.925175, -2.217538, 1, 0, 0, 1, 1,
-0.0792618, 0.1348254, 0.3303625, 1, 0, 0, 1, 1,
-0.07857158, -0.8152315, -3.182723, 1, 0, 0, 1, 1,
-0.07540798, -0.2631671, -2.88267, 1, 0, 0, 1, 1,
-0.07317655, 1.352434, -1.259313, 0, 0, 0, 1, 1,
-0.06683142, 0.4537181, 0.9738152, 0, 0, 0, 1, 1,
-0.06662282, 0.9154044, -0.5581645, 0, 0, 0, 1, 1,
-0.06435532, 0.5068535, -0.3310777, 0, 0, 0, 1, 1,
-0.0633812, 1.233933, -1.424867, 0, 0, 0, 1, 1,
-0.06314489, -1.567678, -2.256651, 0, 0, 0, 1, 1,
-0.06090815, -2.279379, -1.328644, 0, 0, 0, 1, 1,
-0.05839947, -0.5844196, -2.599567, 1, 1, 1, 1, 1,
-0.0568256, 0.2986049, -1.542282, 1, 1, 1, 1, 1,
-0.05396944, 1.334374, -0.09581129, 1, 1, 1, 1, 1,
-0.05055078, -0.9636246, -3.941923, 1, 1, 1, 1, 1,
-0.04381072, -0.7397383, -3.90567, 1, 1, 1, 1, 1,
-0.04143414, -0.03751336, -3.715103, 1, 1, 1, 1, 1,
-0.03636303, -0.02919427, -1.75032, 1, 1, 1, 1, 1,
-0.03379548, 0.4305286, 0.1451262, 1, 1, 1, 1, 1,
-0.03124021, -0.5434207, -3.210027, 1, 1, 1, 1, 1,
-0.02884473, -0.8949001, -3.530816, 1, 1, 1, 1, 1,
-0.02874465, -1.326543, -2.011087, 1, 1, 1, 1, 1,
-0.02585253, -0.3669302, -4.455396, 1, 1, 1, 1, 1,
-0.02117217, 1.848312, 0.8183185, 1, 1, 1, 1, 1,
-0.02079426, 0.7477599, -0.8127246, 1, 1, 1, 1, 1,
-0.01656532, 1.411174, 1.119052, 1, 1, 1, 1, 1,
-0.01266627, 0.2895879, 1.332839, 0, 0, 1, 1, 1,
-0.008476974, 0.3889705, -0.2978313, 1, 0, 0, 1, 1,
-0.005100344, -1.256433, -3.279765, 1, 0, 0, 1, 1,
-0.003149595, 0.7785723, 0.3712979, 1, 0, 0, 1, 1,
0.001968799, 0.3183784, -0.3711376, 1, 0, 0, 1, 1,
0.003531985, -0.2621864, 1.218896, 1, 0, 0, 1, 1,
0.005462791, 0.7359141, -1.838987, 0, 0, 0, 1, 1,
0.008954167, -2.933701, 2.513497, 0, 0, 0, 1, 1,
0.01400739, -0.4264498, 0.83601, 0, 0, 0, 1, 1,
0.01458559, -1.552635, 5.212861, 0, 0, 0, 1, 1,
0.01594557, -0.6061799, 4.632054, 0, 0, 0, 1, 1,
0.02108297, 0.9062474, -1.040019, 0, 0, 0, 1, 1,
0.02323823, -0.3075619, 2.25957, 0, 0, 0, 1, 1,
0.02557789, 0.1057686, 0.7569573, 1, 1, 1, 1, 1,
0.02732164, 1.331655, 0.4505413, 1, 1, 1, 1, 1,
0.02871118, -0.2816242, 3.498876, 1, 1, 1, 1, 1,
0.03409952, -0.7435314, 4.651081, 1, 1, 1, 1, 1,
0.03614775, 0.3798725, -0.6176614, 1, 1, 1, 1, 1,
0.03912306, -1.369603, 5.078165, 1, 1, 1, 1, 1,
0.04411233, 0.4743007, -0.6981365, 1, 1, 1, 1, 1,
0.05082451, -0.1703114, 2.983516, 1, 1, 1, 1, 1,
0.0541257, 1.474302, 0.9379342, 1, 1, 1, 1, 1,
0.05762835, -0.9071401, 2.764464, 1, 1, 1, 1, 1,
0.06038469, -1.625423, 3.850042, 1, 1, 1, 1, 1,
0.06057846, -0.1035942, 2.065356, 1, 1, 1, 1, 1,
0.06384701, -1.607819, 2.483541, 1, 1, 1, 1, 1,
0.06727605, 2.10572, -0.5068314, 1, 1, 1, 1, 1,
0.06761689, 0.4544971, -1.371011, 1, 1, 1, 1, 1,
0.0699511, -1.79147, 3.976841, 0, 0, 1, 1, 1,
0.07439131, 3.073546, -0.02805573, 1, 0, 0, 1, 1,
0.0748613, -0.2310924, 1.72456, 1, 0, 0, 1, 1,
0.07522726, 0.0392086, 0.7445567, 1, 0, 0, 1, 1,
0.07779834, 1.45301, 1.466047, 1, 0, 0, 1, 1,
0.07991145, -0.4625359, 1.917171, 1, 0, 0, 1, 1,
0.08287383, -0.1345626, 3.370295, 0, 0, 0, 1, 1,
0.09193899, 0.01133826, 0.362897, 0, 0, 0, 1, 1,
0.09324997, 0.9127203, 0.8665355, 0, 0, 0, 1, 1,
0.09437636, -0.4085869, 2.446984, 0, 0, 0, 1, 1,
0.09574987, 0.1157541, 0.2623788, 0, 0, 0, 1, 1,
0.09865466, -0.8905959, 3.480698, 0, 0, 0, 1, 1,
0.1001855, 0.6957249, 0.8631842, 0, 0, 0, 1, 1,
0.1128025, 0.3410946, 1.823988, 1, 1, 1, 1, 1,
0.1136369, 0.6830949, 0.6195043, 1, 1, 1, 1, 1,
0.1146813, 2.15525, -1.744189, 1, 1, 1, 1, 1,
0.1229402, -0.6610142, 1.296271, 1, 1, 1, 1, 1,
0.1252686, 1.085726, 1.252309, 1, 1, 1, 1, 1,
0.1258896, 0.468855, -0.3353308, 1, 1, 1, 1, 1,
0.1278458, -0.2215486, 1.722282, 1, 1, 1, 1, 1,
0.1324727, 0.1044112, 0.6784239, 1, 1, 1, 1, 1,
0.1325238, 0.284771, 0.8430815, 1, 1, 1, 1, 1,
0.1393918, -0.1321387, 2.811494, 1, 1, 1, 1, 1,
0.1439563, 0.2111201, 0.2111446, 1, 1, 1, 1, 1,
0.1466858, -0.8013412, 3.547663, 1, 1, 1, 1, 1,
0.1487726, 1.640937, -0.774106, 1, 1, 1, 1, 1,
0.1511587, -0.2383328, 2.370086, 1, 1, 1, 1, 1,
0.153297, 0.1885645, 1.968847, 1, 1, 1, 1, 1,
0.1540584, -1.229497, 2.593992, 0, 0, 1, 1, 1,
0.1551992, 0.2365268, 3.037505, 1, 0, 0, 1, 1,
0.1557605, 0.4901733, 0.2322401, 1, 0, 0, 1, 1,
0.1594943, -0.2417935, 2.922799, 1, 0, 0, 1, 1,
0.1615097, -0.5005069, 0.1423821, 1, 0, 0, 1, 1,
0.1631575, -1.134131, 3.698689, 1, 0, 0, 1, 1,
0.1654994, 2.075018, -0.3518515, 0, 0, 0, 1, 1,
0.1661782, -0.1327899, 1.048555, 0, 0, 0, 1, 1,
0.1718562, -0.1472436, 2.917258, 0, 0, 0, 1, 1,
0.1740236, 0.4658679, -1.206867, 0, 0, 0, 1, 1,
0.1751258, 0.159911, -0.2551843, 0, 0, 0, 1, 1,
0.1760454, -0.5621626, 2.226809, 0, 0, 0, 1, 1,
0.1767691, 0.6108852, -0.2098784, 0, 0, 0, 1, 1,
0.1811915, 0.9464427, 0.7323758, 1, 1, 1, 1, 1,
0.1822807, 1.200181, 1.240287, 1, 1, 1, 1, 1,
0.1877379, 0.7533943, 0.1385894, 1, 1, 1, 1, 1,
0.1881379, -0.403251, 1.322463, 1, 1, 1, 1, 1,
0.1903377, 0.8234405, 1.967663, 1, 1, 1, 1, 1,
0.1917743, -0.5189326, 3.064882, 1, 1, 1, 1, 1,
0.1974123, 0.1540382, 1.060268, 1, 1, 1, 1, 1,
0.1994274, -0.4924268, 2.289987, 1, 1, 1, 1, 1,
0.2031161, 1.4257, 0.152279, 1, 1, 1, 1, 1,
0.2072297, -1.33029, 2.49139, 1, 1, 1, 1, 1,
0.2090759, 0.3868154, -1.312841, 1, 1, 1, 1, 1,
0.2156956, 0.2530796, 0.568874, 1, 1, 1, 1, 1,
0.2187012, 2.138265, 0.1906562, 1, 1, 1, 1, 1,
0.2240331, 0.229025, 0.825488, 1, 1, 1, 1, 1,
0.2242116, -0.1299332, 0.53253, 1, 1, 1, 1, 1,
0.2265838, 1.669811, 0.4689974, 0, 0, 1, 1, 1,
0.2332183, -0.7501784, 4.767348, 1, 0, 0, 1, 1,
0.2383428, -0.535499, 2.1385, 1, 0, 0, 1, 1,
0.2385057, -0.3359375, 1.78648, 1, 0, 0, 1, 1,
0.2394076, -1.421659, 2.506489, 1, 0, 0, 1, 1,
0.2405569, 2.295772, -1.462162, 1, 0, 0, 1, 1,
0.246412, 1.491925, 0.2909288, 0, 0, 0, 1, 1,
0.2486569, 0.7306448, 0.01074001, 0, 0, 0, 1, 1,
0.2492786, -1.555608, 3.965955, 0, 0, 0, 1, 1,
0.2530375, 0.4669316, 0.7764083, 0, 0, 0, 1, 1,
0.2552386, -0.197036, 3.344592, 0, 0, 0, 1, 1,
0.2620079, -1.712689, 5.003417, 0, 0, 0, 1, 1,
0.2640725, 1.203418, 0.4056945, 0, 0, 0, 1, 1,
0.2662284, -0.3598392, 2.279296, 1, 1, 1, 1, 1,
0.2698194, -0.9976572, 2.300466, 1, 1, 1, 1, 1,
0.2718062, 1.07298, 1.901249, 1, 1, 1, 1, 1,
0.2728243, 0.6682091, -0.2195557, 1, 1, 1, 1, 1,
0.2767847, 1.085666, -0.7357042, 1, 1, 1, 1, 1,
0.2773755, -1.070399, 4.145862, 1, 1, 1, 1, 1,
0.278877, -0.5117948, 1.767869, 1, 1, 1, 1, 1,
0.2805904, -0.8398586, 2.790105, 1, 1, 1, 1, 1,
0.2842442, 1.27962, 0.3778886, 1, 1, 1, 1, 1,
0.2862389, -0.9123857, 2.722843, 1, 1, 1, 1, 1,
0.2896542, 0.1934002, 0.7618296, 1, 1, 1, 1, 1,
0.2911672, 0.5572461, 1.421043, 1, 1, 1, 1, 1,
0.2937487, 0.7447986, -1.139076, 1, 1, 1, 1, 1,
0.2982867, -0.2294554, 1.473649, 1, 1, 1, 1, 1,
0.2998993, 0.1352186, 0.9616496, 1, 1, 1, 1, 1,
0.3044543, 1.377085, -0.2657121, 0, 0, 1, 1, 1,
0.3065913, 1.493591, 0.02138343, 1, 0, 0, 1, 1,
0.3076654, 0.1512266, 0.6770059, 1, 0, 0, 1, 1,
0.3078819, 0.3105953, -0.8158691, 1, 0, 0, 1, 1,
0.3083782, -0.4078352, 1.503796, 1, 0, 0, 1, 1,
0.3103701, 1.164166, 1.158347, 1, 0, 0, 1, 1,
0.3126096, 1.031179, -0.3016969, 0, 0, 0, 1, 1,
0.3133049, 0.1842025, 0.9909124, 0, 0, 0, 1, 1,
0.3158627, -2.844913, 5.019721, 0, 0, 0, 1, 1,
0.3161078, -0.3637091, 1.59328, 0, 0, 0, 1, 1,
0.3194687, 0.005643802, 2.212378, 0, 0, 0, 1, 1,
0.3203662, 0.1511854, 0.7584037, 0, 0, 0, 1, 1,
0.3210094, 0.2791455, -1.102525, 0, 0, 0, 1, 1,
0.3212845, -0.8920776, 1.413328, 1, 1, 1, 1, 1,
0.3214419, 0.3869354, 0.5935162, 1, 1, 1, 1, 1,
0.3308269, 0.537837, 1.928687, 1, 1, 1, 1, 1,
0.3343453, 2.118031, -0.6938478, 1, 1, 1, 1, 1,
0.3345001, 0.3618469, 1.267185, 1, 1, 1, 1, 1,
0.3394189, -0.6531603, 2.120384, 1, 1, 1, 1, 1,
0.3428271, -0.2032062, 0.721505, 1, 1, 1, 1, 1,
0.3446072, -0.4335536, 2.613925, 1, 1, 1, 1, 1,
0.3459365, -1.466058, 2.961822, 1, 1, 1, 1, 1,
0.3463863, -0.6246867, 3.969194, 1, 1, 1, 1, 1,
0.3497625, 0.1384354, 2.441224, 1, 1, 1, 1, 1,
0.3517865, -1.631417, 1.554584, 1, 1, 1, 1, 1,
0.3536031, 0.4658344, -1.073758, 1, 1, 1, 1, 1,
0.3572473, -0.3186016, 2.788428, 1, 1, 1, 1, 1,
0.359193, 0.6543707, -0.2821649, 1, 1, 1, 1, 1,
0.3599799, -0.3406, 2.38262, 0, 0, 1, 1, 1,
0.361583, -1.309857, 3.814973, 1, 0, 0, 1, 1,
0.3633427, -0.6985918, 1.905503, 1, 0, 0, 1, 1,
0.3666625, 0.4011507, 3.439261, 1, 0, 0, 1, 1,
0.377808, -0.4031328, 1.432169, 1, 0, 0, 1, 1,
0.3780183, -0.8896514, 3.203038, 1, 0, 0, 1, 1,
0.3816378, -2.196656, 3.007001, 0, 0, 0, 1, 1,
0.387897, 0.310593, 0.2255576, 0, 0, 0, 1, 1,
0.391013, -1.386293, 3.570354, 0, 0, 0, 1, 1,
0.3910416, -1.208101, 2.62156, 0, 0, 0, 1, 1,
0.3933443, 0.06926061, 1.147688, 0, 0, 0, 1, 1,
0.3945774, -0.2878805, 0.7970773, 0, 0, 0, 1, 1,
0.3958063, -1.606118, 2.546282, 0, 0, 0, 1, 1,
0.3978245, 0.8206357, -0.289992, 1, 1, 1, 1, 1,
0.4004129, 0.5782934, 0.2845545, 1, 1, 1, 1, 1,
0.4005073, -0.7378125, 2.88711, 1, 1, 1, 1, 1,
0.4078374, 1.179408, 0.9280834, 1, 1, 1, 1, 1,
0.410211, -1.820785, 2.802596, 1, 1, 1, 1, 1,
0.4107059, 0.4954914, -0.6496269, 1, 1, 1, 1, 1,
0.411155, -0.4139584, 3.767729, 1, 1, 1, 1, 1,
0.4124222, 0.2884695, 1.123734, 1, 1, 1, 1, 1,
0.4236369, 1.385144, 1.862585, 1, 1, 1, 1, 1,
0.427483, -0.03513637, 2.002604, 1, 1, 1, 1, 1,
0.4356928, -0.3855906, 2.952264, 1, 1, 1, 1, 1,
0.4357441, -0.8701786, 3.297313, 1, 1, 1, 1, 1,
0.4405748, -0.8411366, 3.346396, 1, 1, 1, 1, 1,
0.4449214, 0.9212223, 0.7172101, 1, 1, 1, 1, 1,
0.4521286, 1.022478, -0.5232097, 1, 1, 1, 1, 1,
0.455156, -1.36408, 4.401709, 0, 0, 1, 1, 1,
0.4556406, -1.041916, 3.024784, 1, 0, 0, 1, 1,
0.4579652, 0.489061, 1.810509, 1, 0, 0, 1, 1,
0.4581008, -0.192133, 1.859567, 1, 0, 0, 1, 1,
0.4584311, 0.7640812, -0.3692848, 1, 0, 0, 1, 1,
0.4725626, 1.659372, -0.04154968, 1, 0, 0, 1, 1,
0.4845806, -1.055542, 2.32194, 0, 0, 0, 1, 1,
0.4903797, 1.637751, -0.002331214, 0, 0, 0, 1, 1,
0.49202, -0.7186272, 1.611911, 0, 0, 0, 1, 1,
0.4993489, -1.61629, 1.449462, 0, 0, 0, 1, 1,
0.5016761, -1.028834, 2.446192, 0, 0, 0, 1, 1,
0.5027553, 0.886507, 2.347014, 0, 0, 0, 1, 1,
0.5049208, 0.3504154, -0.5738476, 0, 0, 0, 1, 1,
0.5053769, -0.5121242, 1.398086, 1, 1, 1, 1, 1,
0.5059878, 1.141349, 2.86316, 1, 1, 1, 1, 1,
0.5065098, 0.7159137, 0.5208552, 1, 1, 1, 1, 1,
0.512657, 0.9122742, 0.02309476, 1, 1, 1, 1, 1,
0.512998, -0.02904251, 2.25122, 1, 1, 1, 1, 1,
0.5177131, -0.6525478, 2.317912, 1, 1, 1, 1, 1,
0.5189823, 0.5531315, 0.6601121, 1, 1, 1, 1, 1,
0.5227324, -1.100659, 2.303715, 1, 1, 1, 1, 1,
0.5242275, 1.139161, 0.5218408, 1, 1, 1, 1, 1,
0.5253643, -0.01153293, 0.8031859, 1, 1, 1, 1, 1,
0.5314757, -1.64629, 4.664191, 1, 1, 1, 1, 1,
0.5351186, -0.3542166, 0.7082484, 1, 1, 1, 1, 1,
0.5375811, -0.8258171, 2.375591, 1, 1, 1, 1, 1,
0.5382533, -0.9892523, 2.258238, 1, 1, 1, 1, 1,
0.5409187, 0.1321178, 0.7149129, 1, 1, 1, 1, 1,
0.5430009, 0.6864061, 0.4262003, 0, 0, 1, 1, 1,
0.5440516, 0.3116331, 0.355677, 1, 0, 0, 1, 1,
0.5448031, 0.3301857, -0.6939256, 1, 0, 0, 1, 1,
0.545442, 1.094152, -0.3869754, 1, 0, 0, 1, 1,
0.552682, 1.132756, 0.1651708, 1, 0, 0, 1, 1,
0.5529919, -1.261546, 2.854614, 1, 0, 0, 1, 1,
0.5553062, 1.674744, -0.143252, 0, 0, 0, 1, 1,
0.5582845, -0.3487395, 1.803509, 0, 0, 0, 1, 1,
0.5624953, 1.467841, 1.93987, 0, 0, 0, 1, 1,
0.5643942, -1.079243, 2.85362, 0, 0, 0, 1, 1,
0.5670432, -0.1028169, 2.07464, 0, 0, 0, 1, 1,
0.5689417, -0.1378908, 2.196368, 0, 0, 0, 1, 1,
0.5692136, -1.960099, 3.495793, 0, 0, 0, 1, 1,
0.5706212, 0.06141577, 1.107138, 1, 1, 1, 1, 1,
0.5708631, 0.5172333, 0.6920478, 1, 1, 1, 1, 1,
0.5759429, -0.32108, 2.747872, 1, 1, 1, 1, 1,
0.5803766, -1.236751, 1.725208, 1, 1, 1, 1, 1,
0.5815914, -0.1476036, 2.507177, 1, 1, 1, 1, 1,
0.5854724, -0.8507913, 3.080634, 1, 1, 1, 1, 1,
0.5907509, -0.52188, 1.767695, 1, 1, 1, 1, 1,
0.59284, -1.860747, 3.709951, 1, 1, 1, 1, 1,
0.5941871, -1.191971, 3.106951, 1, 1, 1, 1, 1,
0.6007012, -1.537408, 2.017035, 1, 1, 1, 1, 1,
0.6031114, 1.526374, 1.410191, 1, 1, 1, 1, 1,
0.6112212, 0.08310368, 3.212158, 1, 1, 1, 1, 1,
0.611965, -0.7588041, 2.99011, 1, 1, 1, 1, 1,
0.6153324, 1.26149, 1.313844, 1, 1, 1, 1, 1,
0.6169958, -1.847971, 2.690376, 1, 1, 1, 1, 1,
0.617116, 0.02668098, 1.410438, 0, 0, 1, 1, 1,
0.6175859, 1.013553, 0.08371685, 1, 0, 0, 1, 1,
0.618816, 0.4995911, 2.348038, 1, 0, 0, 1, 1,
0.6214741, 0.3810525, 0.4264543, 1, 0, 0, 1, 1,
0.6265131, 0.6789052, -0.2391758, 1, 0, 0, 1, 1,
0.6317384, 0.1454103, 1.819375, 1, 0, 0, 1, 1,
0.6344687, 0.1662422, 0.9217786, 0, 0, 0, 1, 1,
0.6369971, 0.8964582, 0.3126077, 0, 0, 0, 1, 1,
0.6395144, 0.5866511, 2.188607, 0, 0, 0, 1, 1,
0.6404389, -1.386824, 2.845565, 0, 0, 0, 1, 1,
0.6480621, 0.9961502, 1.165339, 0, 0, 0, 1, 1,
0.6514423, 0.6469656, -1.50636, 0, 0, 0, 1, 1,
0.6567191, -0.5978327, 1.974945, 0, 0, 0, 1, 1,
0.6608, -0.4510676, 0.5677279, 1, 1, 1, 1, 1,
0.663548, 0.7037408, 0.45384, 1, 1, 1, 1, 1,
0.6659127, -0.9153357, 2.909556, 1, 1, 1, 1, 1,
0.6673106, 0.05465569, 0.9098718, 1, 1, 1, 1, 1,
0.6684926, -0.331135, 3.117061, 1, 1, 1, 1, 1,
0.6737887, -1.220989, 1.718695, 1, 1, 1, 1, 1,
0.6740196, -0.2631358, 1.649775, 1, 1, 1, 1, 1,
0.6742835, 0.2308673, -0.4404714, 1, 1, 1, 1, 1,
0.6746696, -0.009131058, -0.007381401, 1, 1, 1, 1, 1,
0.6777482, -0.4385786, 2.478253, 1, 1, 1, 1, 1,
0.6791527, 0.06587973, 1.165638, 1, 1, 1, 1, 1,
0.6795104, -3.038641, 3.737863, 1, 1, 1, 1, 1,
0.6815914, 0.398315, 0.0369527, 1, 1, 1, 1, 1,
0.6845837, 0.09948273, 0.1495038, 1, 1, 1, 1, 1,
0.6934001, 0.2422244, 1.933083, 1, 1, 1, 1, 1,
0.6935196, -0.4340439, 1.407135, 0, 0, 1, 1, 1,
0.6943988, 0.1275869, 1.076507, 1, 0, 0, 1, 1,
0.696063, 0.9663164, 0.7806491, 1, 0, 0, 1, 1,
0.7021286, -0.281913, 3.62146, 1, 0, 0, 1, 1,
0.7092406, -1.453527, 2.515996, 1, 0, 0, 1, 1,
0.7105564, -0.06988081, 2.571457, 1, 0, 0, 1, 1,
0.7127828, -1.062828, 5.583196, 0, 0, 0, 1, 1,
0.7131676, -1.28877, 4.392693, 0, 0, 0, 1, 1,
0.7144814, 0.04720273, 1.817158, 0, 0, 0, 1, 1,
0.7148586, -0.4678332, 2.930931, 0, 0, 0, 1, 1,
0.720648, 0.7768857, 2.580006, 0, 0, 0, 1, 1,
0.7209218, -1.410082, 2.494233, 0, 0, 0, 1, 1,
0.7273011, 0.4702344, 1.781904, 0, 0, 0, 1, 1,
0.7291456, -0.1252335, 3.144207, 1, 1, 1, 1, 1,
0.736455, 0.2328022, 0.01918227, 1, 1, 1, 1, 1,
0.7370683, 0.9066746, 0.5202906, 1, 1, 1, 1, 1,
0.7470935, -0.337128, 1.444657, 1, 1, 1, 1, 1,
0.7471691, 0.8070327, 0.9242392, 1, 1, 1, 1, 1,
0.7487654, -1.496192, 3.152187, 1, 1, 1, 1, 1,
0.7491353, -0.6820031, 3.215313, 1, 1, 1, 1, 1,
0.7529306, -0.1056227, 2.072883, 1, 1, 1, 1, 1,
0.7532438, 1.090607, -0.8363804, 1, 1, 1, 1, 1,
0.7628716, -1.313269, 0.7602371, 1, 1, 1, 1, 1,
0.7664762, 0.301019, 0.6904054, 1, 1, 1, 1, 1,
0.7667196, 2.084531, -0.1666128, 1, 1, 1, 1, 1,
0.7685953, -0.3413927, 1.54574, 1, 1, 1, 1, 1,
0.7726471, 0.4092364, -0.01859622, 1, 1, 1, 1, 1,
0.7731238, 1.069541, -0.7756495, 1, 1, 1, 1, 1,
0.7756569, 0.8505427, -1.613069, 0, 0, 1, 1, 1,
0.7756899, 0.964915, -0.1904379, 1, 0, 0, 1, 1,
0.778773, -0.5652911, 1.797408, 1, 0, 0, 1, 1,
0.7791579, 0.4141978, 0.291505, 1, 0, 0, 1, 1,
0.7815333, 1.461075, 1.859204, 1, 0, 0, 1, 1,
0.7825837, -0.7798225, 1.911273, 1, 0, 0, 1, 1,
0.784304, 0.5148372, 0.5621434, 0, 0, 0, 1, 1,
0.785446, -0.7471247, 0.9572706, 0, 0, 0, 1, 1,
0.7863865, -0.623556, 1.402513, 0, 0, 0, 1, 1,
0.7892579, 0.707938, 2.231813, 0, 0, 0, 1, 1,
0.8005043, -0.07979173, 0.4475853, 0, 0, 0, 1, 1,
0.803265, -2.160494, 1.235352, 0, 0, 0, 1, 1,
0.8089514, 0.3288251, 1.38874, 0, 0, 0, 1, 1,
0.811587, 0.004919731, 1.314864, 1, 1, 1, 1, 1,
0.8135756, 0.06397357, 4.764151, 1, 1, 1, 1, 1,
0.8245848, -1.340071, 1.763646, 1, 1, 1, 1, 1,
0.8259696, 0.3453136, 2.473802, 1, 1, 1, 1, 1,
0.8283952, -1.142312, 1.823332, 1, 1, 1, 1, 1,
0.8346782, 0.2065641, 0.2078484, 1, 1, 1, 1, 1,
0.8452486, -2.394518, 2.877004, 1, 1, 1, 1, 1,
0.8542156, -0.07829732, 2.571033, 1, 1, 1, 1, 1,
0.8581781, -0.9457638, 2.629743, 1, 1, 1, 1, 1,
0.8607061, -0.3602313, 1.250481, 1, 1, 1, 1, 1,
0.8633398, -0.5920073, 2.612631, 1, 1, 1, 1, 1,
0.8651139, -0.3242837, 1.516766, 1, 1, 1, 1, 1,
0.8671704, -0.5714377, 2.817368, 1, 1, 1, 1, 1,
0.8695372, 0.04193058, 1.731966, 1, 1, 1, 1, 1,
0.8733119, -0.5063203, 1.241798, 1, 1, 1, 1, 1,
0.8743986, -2.905376, 2.198975, 0, 0, 1, 1, 1,
0.8800584, -1.346335, 1.007477, 1, 0, 0, 1, 1,
0.8864371, 0.3370757, 0.4868546, 1, 0, 0, 1, 1,
0.8869582, 1.386508, 2.971113, 1, 0, 0, 1, 1,
0.8875136, 1.368878, 0.770394, 1, 0, 0, 1, 1,
0.8939524, 0.873242, 0.4765978, 1, 0, 0, 1, 1,
0.9013929, 1.085513, 0.9635599, 0, 0, 0, 1, 1,
0.9104803, -0.2106225, 0.8234554, 0, 0, 0, 1, 1,
0.9124817, 0.3244227, 0.9180446, 0, 0, 0, 1, 1,
0.9140118, 1.646074, 1.820848, 0, 0, 0, 1, 1,
0.9187402, -0.170185, 1.576332, 0, 0, 0, 1, 1,
0.9212972, -1.01861, 1.137745, 0, 0, 0, 1, 1,
0.922917, -1.693601, 3.267841, 0, 0, 0, 1, 1,
0.9409009, -1.006142, 2.155272, 1, 1, 1, 1, 1,
0.9426412, -0.7444769, 3.505589, 1, 1, 1, 1, 1,
0.947907, 0.9018258, 0.6887059, 1, 1, 1, 1, 1,
0.9482879, -0.713944, 2.686402, 1, 1, 1, 1, 1,
0.9485932, 0.7159848, 2.050148, 1, 1, 1, 1, 1,
0.9493579, -1.424556, 2.316853, 1, 1, 1, 1, 1,
0.9509303, -0.4909287, 0.01184125, 1, 1, 1, 1, 1,
0.9604415, 1.193577, 1.570801, 1, 1, 1, 1, 1,
0.9668316, -0.2605938, 2.275942, 1, 1, 1, 1, 1,
0.9706305, -1.479614, 1.901287, 1, 1, 1, 1, 1,
0.9770962, 0.857089, -1.323695, 1, 1, 1, 1, 1,
0.9850963, -0.5520583, 2.289221, 1, 1, 1, 1, 1,
0.9876095, 0.7324247, 0.9349507, 1, 1, 1, 1, 1,
0.9904144, -1.494626, 2.439411, 1, 1, 1, 1, 1,
0.9976265, 0.6050714, 2.687629, 1, 1, 1, 1, 1,
0.9985633, 1.274564, 0.920784, 0, 0, 1, 1, 1,
1.00182, -0.6250728, 1.831838, 1, 0, 0, 1, 1,
1.004467, 0.6804359, 2.006996, 1, 0, 0, 1, 1,
1.004616, -1.271203, 6.158188, 1, 0, 0, 1, 1,
1.010565, -1.009113, 1.898587, 1, 0, 0, 1, 1,
1.010579, -0.5653656, 3.387532, 1, 0, 0, 1, 1,
1.015809, -0.7589413, 3.866315, 0, 0, 0, 1, 1,
1.033483, 0.1002899, 1.007373, 0, 0, 0, 1, 1,
1.040961, -0.2323393, 1.75311, 0, 0, 0, 1, 1,
1.041801, 0.7067955, -0.1027964, 0, 0, 0, 1, 1,
1.043172, 0.9016552, 1.65748, 0, 0, 0, 1, 1,
1.044598, 1.49407, 1.584193, 0, 0, 0, 1, 1,
1.053518, -0.04292389, 1.154281, 0, 0, 0, 1, 1,
1.067582, -1.676763, 1.646877, 1, 1, 1, 1, 1,
1.07825, 1.572166, -0.5206472, 1, 1, 1, 1, 1,
1.078448, 2.023166, 0.8211324, 1, 1, 1, 1, 1,
1.078952, 0.3891876, 0.1892874, 1, 1, 1, 1, 1,
1.079176, 0.5434051, 1.785229, 1, 1, 1, 1, 1,
1.080926, -0.467894, 0.4760729, 1, 1, 1, 1, 1,
1.082483, 0.4292818, 1.34357, 1, 1, 1, 1, 1,
1.084455, 0.7275737, 1.419306, 1, 1, 1, 1, 1,
1.091375, -1.840414, 3.688874, 1, 1, 1, 1, 1,
1.102391, -0.2040855, 0.8497078, 1, 1, 1, 1, 1,
1.102929, 0.3680928, 1.639511, 1, 1, 1, 1, 1,
1.105142, 0.538986, 2.100395, 1, 1, 1, 1, 1,
1.106627, -1.048386, 4.430189, 1, 1, 1, 1, 1,
1.10862, -1.220938, 1.996685, 1, 1, 1, 1, 1,
1.115564, 0.5937591, 0.2490127, 1, 1, 1, 1, 1,
1.120591, -0.8895487, 3.961041, 0, 0, 1, 1, 1,
1.121192, 1.23821, 1.005577, 1, 0, 0, 1, 1,
1.124626, 0.8896534, 3.214146, 1, 0, 0, 1, 1,
1.131536, 0.8883054, 0.8988435, 1, 0, 0, 1, 1,
1.132502, -0.2780931, 1.276494, 1, 0, 0, 1, 1,
1.150349, 0.9055922, 0.6803442, 1, 0, 0, 1, 1,
1.155392, -0.698409, 1.45587, 0, 0, 0, 1, 1,
1.175535, 0.8022128, 2.066879, 0, 0, 0, 1, 1,
1.187983, 0.9395297, 2.0309, 0, 0, 0, 1, 1,
1.190017, 0.8862471, 0.2640913, 0, 0, 0, 1, 1,
1.202813, -1.28653, 1.459181, 0, 0, 0, 1, 1,
1.206609, 0.2286441, -0.7081873, 0, 0, 0, 1, 1,
1.21787, -0.5702797, 2.323722, 0, 0, 0, 1, 1,
1.218134, -1.126932, 2.198061, 1, 1, 1, 1, 1,
1.220562, 1.504712, 2.03481, 1, 1, 1, 1, 1,
1.231864, 0.5468811, 0.6450764, 1, 1, 1, 1, 1,
1.233994, 1.217523, 0.7334601, 1, 1, 1, 1, 1,
1.250874, -1.476714, 1.725824, 1, 1, 1, 1, 1,
1.251516, 1.065948, 2.462101, 1, 1, 1, 1, 1,
1.262285, 0.3343686, 2.176332, 1, 1, 1, 1, 1,
1.277333, 1.494832, 3.377271, 1, 1, 1, 1, 1,
1.283354, -1.179603, 1.823236, 1, 1, 1, 1, 1,
1.286572, -0.916038, 0.2107798, 1, 1, 1, 1, 1,
1.28829, -0.735427, 1.054179, 1, 1, 1, 1, 1,
1.291988, -1.083654, 2.880597, 1, 1, 1, 1, 1,
1.303775, -0.2949547, 1.97569, 1, 1, 1, 1, 1,
1.305448, 0.4627836, -0.3149212, 1, 1, 1, 1, 1,
1.308088, 0.3718033, 1.605791, 1, 1, 1, 1, 1,
1.314263, -0.2084439, 0.630805, 0, 0, 1, 1, 1,
1.316487, 0.374113, 2.372722, 1, 0, 0, 1, 1,
1.328702, -1.298597, 1.297092, 1, 0, 0, 1, 1,
1.336704, -0.1601839, 1.013783, 1, 0, 0, 1, 1,
1.341719, 0.01174819, 1.79857, 1, 0, 0, 1, 1,
1.342169, 1.493955, 0.6884047, 1, 0, 0, 1, 1,
1.348303, -0.6886187, 1.60752, 0, 0, 0, 1, 1,
1.353075, -0.2042676, 1.314147, 0, 0, 0, 1, 1,
1.356805, 0.02278299, 1.890364, 0, 0, 0, 1, 1,
1.369301, -1.387176, 2.430261, 0, 0, 0, 1, 1,
1.382594, -0.1619056, 0.8140341, 0, 0, 0, 1, 1,
1.382832, 0.07577801, -0.3902906, 0, 0, 0, 1, 1,
1.388013, 0.4677882, -1.091925, 0, 0, 0, 1, 1,
1.39196, 1.743936, -1.181109, 1, 1, 1, 1, 1,
1.398397, 1.323322, -0.7413829, 1, 1, 1, 1, 1,
1.400388, 0.09298828, 2.790538, 1, 1, 1, 1, 1,
1.404073, -1.726815, 1.576101, 1, 1, 1, 1, 1,
1.409673, -0.9009325, 1.319681, 1, 1, 1, 1, 1,
1.418822, -0.6283839, 0.7265087, 1, 1, 1, 1, 1,
1.430225, -1.205862, 2.511029, 1, 1, 1, 1, 1,
1.433651, 0.3856862, 2.097201, 1, 1, 1, 1, 1,
1.434697, 0.8102032, -0.6394556, 1, 1, 1, 1, 1,
1.438524, -1.100921, 2.203328, 1, 1, 1, 1, 1,
1.455454, 1.197537, 0.4363367, 1, 1, 1, 1, 1,
1.476037, -1.794137, 2.062682, 1, 1, 1, 1, 1,
1.480692, 0.6006033, 1.980949, 1, 1, 1, 1, 1,
1.482383, -0.6265253, 0.06239417, 1, 1, 1, 1, 1,
1.487398, -1.615465, 1.526014, 1, 1, 1, 1, 1,
1.495732, -0.1806701, 0.9873903, 0, 0, 1, 1, 1,
1.50108, -1.335498, 2.18334, 1, 0, 0, 1, 1,
1.504259, 0.7377115, -0.4910955, 1, 0, 0, 1, 1,
1.508691, -1.197918, 3.237499, 1, 0, 0, 1, 1,
1.513128, -0.02972935, 3.290262, 1, 0, 0, 1, 1,
1.513758, 0.267863, 1.018852, 1, 0, 0, 1, 1,
1.513844, 0.7111648, 1.046422, 0, 0, 0, 1, 1,
1.525652, 0.2394659, 1.597006, 0, 0, 0, 1, 1,
1.531106, -0.5145957, 1.686406, 0, 0, 0, 1, 1,
1.532319, 0.2163355, 0.2708521, 0, 0, 0, 1, 1,
1.536065, 0.2824309, 0.7953507, 0, 0, 0, 1, 1,
1.542394, 0.9805958, 1.22428, 0, 0, 0, 1, 1,
1.54787, 0.8603821, 0.7672246, 0, 0, 0, 1, 1,
1.550914, 0.03030162, 1.537071, 1, 1, 1, 1, 1,
1.553786, 0.3030916, 0.09859, 1, 1, 1, 1, 1,
1.557179, 0.8442284, 1.586078, 1, 1, 1, 1, 1,
1.583747, 0.8082888, 1.477946, 1, 1, 1, 1, 1,
1.592376, 0.06461918, 1.466446, 1, 1, 1, 1, 1,
1.622953, 0.1875154, -0.1438643, 1, 1, 1, 1, 1,
1.625244, -0.5184183, 0.8821599, 1, 1, 1, 1, 1,
1.628083, -1.950217, 3.044727, 1, 1, 1, 1, 1,
1.643831, -1.47006, 3.157225, 1, 1, 1, 1, 1,
1.647605, 0.4066732, 0.9916625, 1, 1, 1, 1, 1,
1.654454, -1.035297, 2.909185, 1, 1, 1, 1, 1,
1.65837, -0.7205683, 2.598103, 1, 1, 1, 1, 1,
1.665255, -0.3752677, 1.404285, 1, 1, 1, 1, 1,
1.671502, -0.220858, 5.385165, 1, 1, 1, 1, 1,
1.672696, 0.5093616, 1.394166, 1, 1, 1, 1, 1,
1.701822, -1.167119, 1.651335, 0, 0, 1, 1, 1,
1.716983, -1.038593, 1.496746, 1, 0, 0, 1, 1,
1.723039, 0.8433713, -0.1114359, 1, 0, 0, 1, 1,
1.751283, 0.6943839, 0.8289006, 1, 0, 0, 1, 1,
1.756891, 1.124166, 0.6783831, 1, 0, 0, 1, 1,
1.768339, -0.3261908, 1.651805, 1, 0, 0, 1, 1,
1.793036, 0.5813964, 1.243291, 0, 0, 0, 1, 1,
1.814325, -1.18646, 2.579536, 0, 0, 0, 1, 1,
1.823124, 0.4556222, -0.4549588, 0, 0, 0, 1, 1,
1.829888, 2.05634, 1.594319, 0, 0, 0, 1, 1,
1.838534, -2.218759, 4.05764, 0, 0, 0, 1, 1,
1.852365, 0.6516505, 0.4327315, 0, 0, 0, 1, 1,
1.864642, 0.5892131, 1.126206, 0, 0, 0, 1, 1,
1.892195, 0.7891223, 0.3980187, 1, 1, 1, 1, 1,
1.931858, 0.4122802, 2.098018, 1, 1, 1, 1, 1,
1.933643, -0.7824568, 1.338397, 1, 1, 1, 1, 1,
1.93463, -0.6152563, 3.142879, 1, 1, 1, 1, 1,
1.937034, -0.234264, 2.168791, 1, 1, 1, 1, 1,
1.938336, 0.7823645, -0.9800927, 1, 1, 1, 1, 1,
1.952657, 0.4614559, 0.8871108, 1, 1, 1, 1, 1,
1.963658, -1.074177, 1.020375, 1, 1, 1, 1, 1,
1.983377, 0.630872, 1.146057, 1, 1, 1, 1, 1,
1.988217, 0.9016597, 0.5941911, 1, 1, 1, 1, 1,
1.98963, 1.185026, 3.329237, 1, 1, 1, 1, 1,
1.991169, -0.03460035, 2.196698, 1, 1, 1, 1, 1,
2.048666, -0.2261079, 0.6058919, 1, 1, 1, 1, 1,
2.05861, -0.6406962, 0.9994678, 1, 1, 1, 1, 1,
2.074917, 0.7302348, -0.5767592, 1, 1, 1, 1, 1,
2.100651, 1.300386, 2.13353, 0, 0, 1, 1, 1,
2.117167, -0.7192774, 2.12571, 1, 0, 0, 1, 1,
2.121641, 2.578457, 0.7747745, 1, 0, 0, 1, 1,
2.133035, 1.16257, 0.2148071, 1, 0, 0, 1, 1,
2.136437, -0.3574646, 0.339583, 1, 0, 0, 1, 1,
2.235048, 1.216881, 0.3357468, 1, 0, 0, 1, 1,
2.331128, -2.181428, 0.1796913, 0, 0, 0, 1, 1,
2.441188, 0.6859907, 0.9789795, 0, 0, 0, 1, 1,
2.489368, -0.6192233, 1.630244, 0, 0, 0, 1, 1,
2.519866, -0.2388494, 1.239535, 0, 0, 0, 1, 1,
2.551009, -0.6793231, 2.63501, 0, 0, 0, 1, 1,
2.795748, 2.081062, 1.214012, 0, 0, 0, 1, 1,
2.812422, 0.2422245, 1.181334, 0, 0, 0, 1, 1,
2.835687, 0.3343286, -0.09479491, 1, 1, 1, 1, 1,
2.859308, 1.48698, 1.384554, 1, 1, 1, 1, 1,
2.869268, 0.268976, 1.794411, 1, 1, 1, 1, 1,
2.920532, 2.066007, -0.7256869, 1, 1, 1, 1, 1,
2.921109, 1.312571, 4.307663, 1, 1, 1, 1, 1,
3.260161, 0.2570687, 2.338766, 1, 1, 1, 1, 1,
3.333488, 1.127933, 1.935194, 1, 1, 1, 1, 1
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
var radius = 9.91155;
var distance = 34.8139;
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
mvMatrix.translate( -0.1431413, 0.6881261, -0.7584546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8139);
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
