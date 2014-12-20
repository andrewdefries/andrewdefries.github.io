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
-3.120061, -1.323585, -1.867733, 1, 0, 0, 1,
-2.783445, 0.3940307, 0.3957014, 1, 0.007843138, 0, 1,
-2.778476, 0.2491256, -1.641271, 1, 0.01176471, 0, 1,
-2.574358, -1.265296, -1.659121, 1, 0.01960784, 0, 1,
-2.534013, 0.4011893, -3.887702, 1, 0.02352941, 0, 1,
-2.442046, -0.7102988, -3.779952, 1, 0.03137255, 0, 1,
-2.441126, 0.2720745, -0.4404182, 1, 0.03529412, 0, 1,
-2.434028, -1.595208, -1.075974, 1, 0.04313726, 0, 1,
-2.423584, 0.5925409, -1.086084, 1, 0.04705882, 0, 1,
-2.420999, -1.31094, -2.267298, 1, 0.05490196, 0, 1,
-2.368226, -1.567502, -2.586355, 1, 0.05882353, 0, 1,
-2.363709, -0.6883847, -1.577443, 1, 0.06666667, 0, 1,
-2.36235, 1.324346, -0.4659061, 1, 0.07058824, 0, 1,
-2.346693, 1.092857, 0.4571951, 1, 0.07843138, 0, 1,
-2.322335, -0.4224662, -1.518278, 1, 0.08235294, 0, 1,
-2.245711, 0.1474408, -0.5199567, 1, 0.09019608, 0, 1,
-2.24502, -0.8229032, -0.633206, 1, 0.09411765, 0, 1,
-2.214791, -0.8633595, -1.4503, 1, 0.1019608, 0, 1,
-2.210858, -1.179085, -2.575473, 1, 0.1098039, 0, 1,
-2.182701, 0.3501748, -1.276074, 1, 0.1137255, 0, 1,
-2.120581, -0.7463903, -1.597285, 1, 0.1215686, 0, 1,
-2.084042, 0.3220952, -1.101204, 1, 0.1254902, 0, 1,
-2.072183, -1.272075, -2.052575, 1, 0.1333333, 0, 1,
-2.03348, -0.583881, -1.117125, 1, 0.1372549, 0, 1,
-2.016802, 0.08601279, -0.7015838, 1, 0.145098, 0, 1,
-2.011857, 0.6551819, -0.1612024, 1, 0.1490196, 0, 1,
-1.992266, 0.2849479, -2.433165, 1, 0.1568628, 0, 1,
-1.976644, -0.9485092, -0.1077042, 1, 0.1607843, 0, 1,
-1.952422, -0.6982811, -2.074113, 1, 0.1686275, 0, 1,
-1.933438, -0.6423975, -1.926248, 1, 0.172549, 0, 1,
-1.902966, 1.013523, 0.1081512, 1, 0.1803922, 0, 1,
-1.872159, -1.28253, -3.327625, 1, 0.1843137, 0, 1,
-1.862164, -0.3705938, -1.683166, 1, 0.1921569, 0, 1,
-1.848608, 0.4895419, -1.754167, 1, 0.1960784, 0, 1,
-1.831705, -1.000203, -2.484148, 1, 0.2039216, 0, 1,
-1.805005, -0.1225928, -2.499403, 1, 0.2117647, 0, 1,
-1.798163, 0.5171487, -2.449147, 1, 0.2156863, 0, 1,
-1.791331, -0.6188455, -0.5731503, 1, 0.2235294, 0, 1,
-1.785292, -0.1076284, -1.736582, 1, 0.227451, 0, 1,
-1.779434, -0.9240285, -1.270865, 1, 0.2352941, 0, 1,
-1.77058, -0.662445, -3.523341, 1, 0.2392157, 0, 1,
-1.76935, 1.013319, -1.084722, 1, 0.2470588, 0, 1,
-1.733184, -0.7018397, -3.889355, 1, 0.2509804, 0, 1,
-1.727502, -0.249553, -1.102737, 1, 0.2588235, 0, 1,
-1.700567, 1.221098, -0.04694117, 1, 0.2627451, 0, 1,
-1.692624, -1.114869, -0.628012, 1, 0.2705882, 0, 1,
-1.692334, 0.06675319, -3.116194, 1, 0.2745098, 0, 1,
-1.682812, -0.07470565, -0.8030638, 1, 0.282353, 0, 1,
-1.655485, 0.7987327, 0.4110682, 1, 0.2862745, 0, 1,
-1.641155, -0.4364137, -1.7313, 1, 0.2941177, 0, 1,
-1.639333, 1.342341, -0.7667368, 1, 0.3019608, 0, 1,
-1.633636, -0.114723, -0.9156135, 1, 0.3058824, 0, 1,
-1.633019, 0.01491002, -1.24558, 1, 0.3137255, 0, 1,
-1.625906, -0.05218664, -2.232743, 1, 0.3176471, 0, 1,
-1.591562, 0.8969529, -1.31779, 1, 0.3254902, 0, 1,
-1.587369, 0.4428948, -1.792742, 1, 0.3294118, 0, 1,
-1.578805, -0.6961064, -3.065938, 1, 0.3372549, 0, 1,
-1.568557, -0.004179855, -1.464822, 1, 0.3411765, 0, 1,
-1.568547, 1.77891, -0.7641262, 1, 0.3490196, 0, 1,
-1.565833, -0.4885165, -0.2758085, 1, 0.3529412, 0, 1,
-1.56066, -0.2206511, -1.644556, 1, 0.3607843, 0, 1,
-1.550139, -1.565622, -1.036107, 1, 0.3647059, 0, 1,
-1.54437, -0.3810327, -1.692405, 1, 0.372549, 0, 1,
-1.542688, -0.05794069, -0.3946007, 1, 0.3764706, 0, 1,
-1.539011, -0.02734082, -1.091284, 1, 0.3843137, 0, 1,
-1.538013, -0.6797231, -1.823877, 1, 0.3882353, 0, 1,
-1.509409, 1.885092, -0.9840491, 1, 0.3960784, 0, 1,
-1.508292, 1.07923, 0.09079823, 1, 0.4039216, 0, 1,
-1.492994, -1.136733, -2.12134, 1, 0.4078431, 0, 1,
-1.491813, -1.294586, -1.35753, 1, 0.4156863, 0, 1,
-1.488483, 0.4173668, -1.506275, 1, 0.4196078, 0, 1,
-1.452798, 1.158475, -0.2439497, 1, 0.427451, 0, 1,
-1.43678, 1.137958, -0.9878302, 1, 0.4313726, 0, 1,
-1.435042, 1.82913, -0.8244025, 1, 0.4392157, 0, 1,
-1.426243, -0.4567012, -4.896632, 1, 0.4431373, 0, 1,
-1.422267, 1.5766, -0.4674845, 1, 0.4509804, 0, 1,
-1.421369, -1.550995, -1.789541, 1, 0.454902, 0, 1,
-1.414728, -0.9486718, -1.77611, 1, 0.4627451, 0, 1,
-1.387435, -1.1489, -2.541672, 1, 0.4666667, 0, 1,
-1.386638, -1.126385, -1.089621, 1, 0.4745098, 0, 1,
-1.38424, 1.533325, -0.748651, 1, 0.4784314, 0, 1,
-1.383684, -0.3204439, -0.007641804, 1, 0.4862745, 0, 1,
-1.382126, -0.77908, -1.152337, 1, 0.4901961, 0, 1,
-1.378797, -0.07726107, -0.7926444, 1, 0.4980392, 0, 1,
-1.37819, 0.88378, -2.291706, 1, 0.5058824, 0, 1,
-1.344032, 1.691132, -0.3924262, 1, 0.509804, 0, 1,
-1.33948, -0.5214693, -2.173985, 1, 0.5176471, 0, 1,
-1.338574, 0.3860521, -2.368809, 1, 0.5215687, 0, 1,
-1.324955, -0.06552538, -0.5448946, 1, 0.5294118, 0, 1,
-1.324537, -0.8815669, -0.9667101, 1, 0.5333334, 0, 1,
-1.316739, 0.03420208, -3.228183, 1, 0.5411765, 0, 1,
-1.315396, 0.7224708, -0.5081058, 1, 0.5450981, 0, 1,
-1.307304, 1.504615, -2.457505, 1, 0.5529412, 0, 1,
-1.303318, 0.3532383, -2.966527, 1, 0.5568628, 0, 1,
-1.292896, -0.5377935, -2.372189, 1, 0.5647059, 0, 1,
-1.288379, -2.936739, -3.301409, 1, 0.5686275, 0, 1,
-1.284891, -1.136139, -2.088491, 1, 0.5764706, 0, 1,
-1.273125, 0.9314385, -1.315656, 1, 0.5803922, 0, 1,
-1.269882, -0.882763, -2.632147, 1, 0.5882353, 0, 1,
-1.269432, 1.552683, -0.7327819, 1, 0.5921569, 0, 1,
-1.266833, -0.7238848, -2.979338, 1, 0.6, 0, 1,
-1.265383, -0.08505654, -1.743004, 1, 0.6078432, 0, 1,
-1.252706, -0.3297613, -1.122614, 1, 0.6117647, 0, 1,
-1.25141, -0.6504791, -0.8883619, 1, 0.6196079, 0, 1,
-1.250516, -0.7099546, -1.533697, 1, 0.6235294, 0, 1,
-1.250109, -0.1356654, -1.261957, 1, 0.6313726, 0, 1,
-1.245138, -1.131774, -0.5702494, 1, 0.6352941, 0, 1,
-1.236116, 0.1955941, -0.4964625, 1, 0.6431373, 0, 1,
-1.230906, 0.5395499, 0.9010804, 1, 0.6470588, 0, 1,
-1.230305, -0.4577188, -2.567795, 1, 0.654902, 0, 1,
-1.229373, -1.429432, -1.930659, 1, 0.6588235, 0, 1,
-1.224892, 0.7646338, -0.0975828, 1, 0.6666667, 0, 1,
-1.224256, -0.7320558, -2.194185, 1, 0.6705883, 0, 1,
-1.22294, 0.257646, 0.5144766, 1, 0.6784314, 0, 1,
-1.217044, -0.1803353, -2.459032, 1, 0.682353, 0, 1,
-1.215347, -0.1562589, -1.447202, 1, 0.6901961, 0, 1,
-1.199866, 1.758898, 0.9941209, 1, 0.6941177, 0, 1,
-1.194593, 0.1241045, -1.271873, 1, 0.7019608, 0, 1,
-1.189354, -0.1274654, -0.3810678, 1, 0.7098039, 0, 1,
-1.186016, 0.5752958, -1.321676, 1, 0.7137255, 0, 1,
-1.179435, -0.8984944, -2.410329, 1, 0.7215686, 0, 1,
-1.178809, 0.2752244, -1.352726, 1, 0.7254902, 0, 1,
-1.175221, -0.2744535, -2.025586, 1, 0.7333333, 0, 1,
-1.171829, 0.8119264, -1.285501, 1, 0.7372549, 0, 1,
-1.161215, 1.638758, -0.8316305, 1, 0.7450981, 0, 1,
-1.158524, 0.05253306, -1.82329, 1, 0.7490196, 0, 1,
-1.155564, -0.1904355, -0.9528435, 1, 0.7568628, 0, 1,
-1.144289, 0.4205501, 0.2809883, 1, 0.7607843, 0, 1,
-1.143504, -0.7255795, -2.892068, 1, 0.7686275, 0, 1,
-1.143065, 0.7569225, -1.892343, 1, 0.772549, 0, 1,
-1.142303, 0.009182375, -4.140602, 1, 0.7803922, 0, 1,
-1.141355, -1.126036, -1.239091, 1, 0.7843137, 0, 1,
-1.1382, 1.458745, 1.768483, 1, 0.7921569, 0, 1,
-1.133501, 2.580955, 1.056462, 1, 0.7960784, 0, 1,
-1.13294, 2.588257, -2.324561, 1, 0.8039216, 0, 1,
-1.126826, -1.381906, -2.549247, 1, 0.8117647, 0, 1,
-1.12676, 0.1779215, -1.149658, 1, 0.8156863, 0, 1,
-1.123258, 0.9724026, -2.970479, 1, 0.8235294, 0, 1,
-1.119583, -0.6086828, -1.459644, 1, 0.827451, 0, 1,
-1.111316, 0.4314485, -1.413244, 1, 0.8352941, 0, 1,
-1.111311, -1.391695, -1.780543, 1, 0.8392157, 0, 1,
-1.10808, -0.2584674, -1.679111, 1, 0.8470588, 0, 1,
-1.101155, 1.649448, 0.8797606, 1, 0.8509804, 0, 1,
-1.094686, -1.003908, -3.582802, 1, 0.8588235, 0, 1,
-1.093585, 0.1553302, -2.517672, 1, 0.8627451, 0, 1,
-1.089664, -0.2716785, -1.001958, 1, 0.8705882, 0, 1,
-1.076488, 1.743601, -0.3167953, 1, 0.8745098, 0, 1,
-1.071822, -1.046834, -1.674683, 1, 0.8823529, 0, 1,
-1.071178, 0.5080653, -1.045777, 1, 0.8862745, 0, 1,
-1.067518, 0.03820315, -2.243435, 1, 0.8941177, 0, 1,
-1.065076, -0.5344059, -0.7869615, 1, 0.8980392, 0, 1,
-1.06211, -1.187476, -3.30063, 1, 0.9058824, 0, 1,
-1.05941, -1.232752, -2.650041, 1, 0.9137255, 0, 1,
-1.049258, -1.211816, -2.035113, 1, 0.9176471, 0, 1,
-1.043407, -0.6905863, -2.244809, 1, 0.9254902, 0, 1,
-1.04231, -0.5129483, -0.6689916, 1, 0.9294118, 0, 1,
-1.034134, -0.7228561, -0.8222196, 1, 0.9372549, 0, 1,
-1.033039, -0.6678976, -2.937614, 1, 0.9411765, 0, 1,
-1.031171, -0.1325479, -3.266847, 1, 0.9490196, 0, 1,
-1.031003, -0.6777359, -1.682485, 1, 0.9529412, 0, 1,
-1.023983, 0.2395603, -1.221657, 1, 0.9607843, 0, 1,
-1.015492, 0.4195922, -0.1430191, 1, 0.9647059, 0, 1,
-1.007342, 0.2927409, -1.90604, 1, 0.972549, 0, 1,
-1.00513, 0.0310294, -0.2591136, 1, 0.9764706, 0, 1,
-1.005015, 1.516555, 0.8874144, 1, 0.9843137, 0, 1,
-1.001407, 2.836871, 1.968077, 1, 0.9882353, 0, 1,
-0.9996322, -0.3558946, -2.614569, 1, 0.9960784, 0, 1,
-0.9985961, 1.17094, 0.7077082, 0.9960784, 1, 0, 1,
-0.9973286, -2.362197, -4.030646, 0.9921569, 1, 0, 1,
-0.996666, 0.3720809, -2.136899, 0.9843137, 1, 0, 1,
-0.9944314, 0.7311938, -1.557678, 0.9803922, 1, 0, 1,
-0.9932956, 1.258201, -2.132735, 0.972549, 1, 0, 1,
-0.9890546, -1.596511, -1.97808, 0.9686275, 1, 0, 1,
-0.9839332, -0.2141538, -0.6090893, 0.9607843, 1, 0, 1,
-0.9760382, 0.05750933, -1.335281, 0.9568627, 1, 0, 1,
-0.9743271, 0.4321797, -0.5734036, 0.9490196, 1, 0, 1,
-0.9633253, -0.5453497, -2.455919, 0.945098, 1, 0, 1,
-0.9623294, -0.4555115, -2.17516, 0.9372549, 1, 0, 1,
-0.9601152, 0.5139986, -1.581704, 0.9333333, 1, 0, 1,
-0.9597336, -0.7560195, -2.009789, 0.9254902, 1, 0, 1,
-0.9559415, 0.5182886, -2.166088, 0.9215686, 1, 0, 1,
-0.9528889, 1.408784, 0.8748956, 0.9137255, 1, 0, 1,
-0.9528486, 0.5658298, -0.7956765, 0.9098039, 1, 0, 1,
-0.9511811, -1.824797, -0.66032, 0.9019608, 1, 0, 1,
-0.9468917, -1.177611, -3.915145, 0.8941177, 1, 0, 1,
-0.9457917, -0.4016218, -2.686085, 0.8901961, 1, 0, 1,
-0.9440165, -1.039242, -3.35306, 0.8823529, 1, 0, 1,
-0.9390391, 0.4805817, 0.2909453, 0.8784314, 1, 0, 1,
-0.9389917, 1.164064, 1.128563, 0.8705882, 1, 0, 1,
-0.9064349, -0.6170903, -2.631932, 0.8666667, 1, 0, 1,
-0.9064071, 0.01199423, -3.120633, 0.8588235, 1, 0, 1,
-0.9012824, 0.3707034, -1.618285, 0.854902, 1, 0, 1,
-0.8901886, 0.3695789, -1.437049, 0.8470588, 1, 0, 1,
-0.888005, -0.06878309, -2.186588, 0.8431373, 1, 0, 1,
-0.8849339, 2.560863, -0.4007804, 0.8352941, 1, 0, 1,
-0.8773829, 1.549852, -1.092407, 0.8313726, 1, 0, 1,
-0.8731395, -0.3354349, -0.9526659, 0.8235294, 1, 0, 1,
-0.859755, 0.4876925, -1.322054, 0.8196079, 1, 0, 1,
-0.8595528, -1.250197, -2.823341, 0.8117647, 1, 0, 1,
-0.8588347, 0.1710403, -0.7354347, 0.8078431, 1, 0, 1,
-0.8556748, 0.7557507, -0.8579581, 0.8, 1, 0, 1,
-0.8519494, -1.270483, -2.277921, 0.7921569, 1, 0, 1,
-0.8503585, -0.3329104, -3.394352, 0.7882353, 1, 0, 1,
-0.8493879, -0.2284933, -1.678964, 0.7803922, 1, 0, 1,
-0.8448242, 0.09258986, 0.08573531, 0.7764706, 1, 0, 1,
-0.8403937, -0.2357005, -2.908157, 0.7686275, 1, 0, 1,
-0.8382543, -1.010089, -1.725785, 0.7647059, 1, 0, 1,
-0.833662, -0.432243, -3.501705, 0.7568628, 1, 0, 1,
-0.8325246, 0.2946312, -0.3593675, 0.7529412, 1, 0, 1,
-0.8325221, -1.03353, -2.817933, 0.7450981, 1, 0, 1,
-0.8321166, 1.11239, 0.7914355, 0.7411765, 1, 0, 1,
-0.8296665, 1.262452, -1.119704, 0.7333333, 1, 0, 1,
-0.8259386, -1.499965, -2.798318, 0.7294118, 1, 0, 1,
-0.8257537, -0.9040573, -3.330852, 0.7215686, 1, 0, 1,
-0.8256603, 0.7419336, -1.371951, 0.7176471, 1, 0, 1,
-0.8230165, 0.352068, -0.3174977, 0.7098039, 1, 0, 1,
-0.8225398, -0.3685418, 0.3402722, 0.7058824, 1, 0, 1,
-0.8149372, -0.8772515, -2.42247, 0.6980392, 1, 0, 1,
-0.8137239, -1.291173, -2.408804, 0.6901961, 1, 0, 1,
-0.8071437, -1.320979, -2.086619, 0.6862745, 1, 0, 1,
-0.7989869, -0.04335893, -2.556618, 0.6784314, 1, 0, 1,
-0.7915115, -1.530233, -3.076092, 0.6745098, 1, 0, 1,
-0.789008, -1.323132, -3.373155, 0.6666667, 1, 0, 1,
-0.7870514, -0.6049649, -2.695308, 0.6627451, 1, 0, 1,
-0.7854336, 0.1440689, -1.634241, 0.654902, 1, 0, 1,
-0.7831914, -0.3357589, -2.0345, 0.6509804, 1, 0, 1,
-0.7710337, 0.8046436, -1.557224, 0.6431373, 1, 0, 1,
-0.7681236, -0.6649163, -3.410468, 0.6392157, 1, 0, 1,
-0.7664288, -1.260615, -1.641936, 0.6313726, 1, 0, 1,
-0.7635462, -0.8455058, -3.534961, 0.627451, 1, 0, 1,
-0.7615129, 0.6999316, -0.6771935, 0.6196079, 1, 0, 1,
-0.7610782, 0.5669449, -0.8501976, 0.6156863, 1, 0, 1,
-0.7608379, -1.483491, -2.654993, 0.6078432, 1, 0, 1,
-0.7540144, 1.056489, -2.26565, 0.6039216, 1, 0, 1,
-0.7520443, -0.4188415, -2.67063, 0.5960785, 1, 0, 1,
-0.7497714, -1.524415, -1.17829, 0.5882353, 1, 0, 1,
-0.7479232, -0.5213736, -0.9851789, 0.5843138, 1, 0, 1,
-0.7414035, 0.2137779, -2.325752, 0.5764706, 1, 0, 1,
-0.7395691, -1.718892, -3.170175, 0.572549, 1, 0, 1,
-0.7377153, -0.1466903, -1.174823, 0.5647059, 1, 0, 1,
-0.7360786, -0.3037926, -0.4985226, 0.5607843, 1, 0, 1,
-0.7321422, 1.288834, -0.00962575, 0.5529412, 1, 0, 1,
-0.7245503, -1.008417, -3.17845, 0.5490196, 1, 0, 1,
-0.7244858, 1.107323, -0.1708581, 0.5411765, 1, 0, 1,
-0.7243389, 0.2875749, -0.6542022, 0.5372549, 1, 0, 1,
-0.7182575, 0.3249981, 0.7146407, 0.5294118, 1, 0, 1,
-0.716834, 0.7986112, -2.726946, 0.5254902, 1, 0, 1,
-0.7167768, 1.892663, -0.4264916, 0.5176471, 1, 0, 1,
-0.7122056, -0.9610575, -3.170902, 0.5137255, 1, 0, 1,
-0.7068309, -0.8337178, -3.794591, 0.5058824, 1, 0, 1,
-0.7058814, 0.9821836, -0.521852, 0.5019608, 1, 0, 1,
-0.7026115, -0.1444349, -0.4387276, 0.4941176, 1, 0, 1,
-0.7014484, 1.481626, 0.163181, 0.4862745, 1, 0, 1,
-0.7013388, 1.423096, -0.7694582, 0.4823529, 1, 0, 1,
-0.6980626, -0.2842743, -0.9227268, 0.4745098, 1, 0, 1,
-0.6963021, 1.189273, 0.5288355, 0.4705882, 1, 0, 1,
-0.6933338, -0.3471486, -2.346899, 0.4627451, 1, 0, 1,
-0.6903654, -1.799959, -1.768399, 0.4588235, 1, 0, 1,
-0.6864539, 0.02561874, -0.2947592, 0.4509804, 1, 0, 1,
-0.6861178, 3.74829, -0.1874137, 0.4470588, 1, 0, 1,
-0.6857921, -0.9705147, -1.799489, 0.4392157, 1, 0, 1,
-0.6824451, 0.7741445, -1.042862, 0.4352941, 1, 0, 1,
-0.6814374, -0.4136847, -3.388682, 0.427451, 1, 0, 1,
-0.669496, -1.022939, -0.7562371, 0.4235294, 1, 0, 1,
-0.6669986, -0.5825679, -1.567617, 0.4156863, 1, 0, 1,
-0.6659749, 0.3613507, -1.144188, 0.4117647, 1, 0, 1,
-0.6615993, -1.063964, -1.652714, 0.4039216, 1, 0, 1,
-0.6601675, 0.03223792, -2.218923, 0.3960784, 1, 0, 1,
-0.652833, -0.8919945, -1.998001, 0.3921569, 1, 0, 1,
-0.6491454, -0.3535155, -0.8676308, 0.3843137, 1, 0, 1,
-0.6475724, 0.07258365, -1.332492, 0.3803922, 1, 0, 1,
-0.6452056, -0.8416515, -4.493868, 0.372549, 1, 0, 1,
-0.6449714, -0.9106488, -0.06099798, 0.3686275, 1, 0, 1,
-0.6406348, -1.382713, -2.791223, 0.3607843, 1, 0, 1,
-0.6363353, 0.6411294, -0.02923628, 0.3568628, 1, 0, 1,
-0.631968, -0.3818361, -2.118809, 0.3490196, 1, 0, 1,
-0.6292405, -0.6574764, -0.5835181, 0.345098, 1, 0, 1,
-0.6277429, -0.660148, -1.849374, 0.3372549, 1, 0, 1,
-0.624627, -0.3784369, -2.821805, 0.3333333, 1, 0, 1,
-0.6211281, 0.5092489, -0.3810154, 0.3254902, 1, 0, 1,
-0.6197906, -0.886691, -1.464566, 0.3215686, 1, 0, 1,
-0.6197011, -0.04031337, -2.465042, 0.3137255, 1, 0, 1,
-0.6112157, 1.297593, 2.323416, 0.3098039, 1, 0, 1,
-0.6058225, 0.1314797, -2.560853, 0.3019608, 1, 0, 1,
-0.6038421, 0.3979619, -1.23289, 0.2941177, 1, 0, 1,
-0.6036696, 1.344581, 1.050629, 0.2901961, 1, 0, 1,
-0.6035951, -1.214471, -2.883956, 0.282353, 1, 0, 1,
-0.6027198, -1.395964, -2.789647, 0.2784314, 1, 0, 1,
-0.6025276, -0.424309, -1.328162, 0.2705882, 1, 0, 1,
-0.5881581, -0.5873712, -2.920093, 0.2666667, 1, 0, 1,
-0.5869619, 1.128295, -1.094322, 0.2588235, 1, 0, 1,
-0.5829674, 0.05206971, -3.13245, 0.254902, 1, 0, 1,
-0.5826366, 1.224523, 1.162246, 0.2470588, 1, 0, 1,
-0.5821111, -0.1128761, 0.4827174, 0.2431373, 1, 0, 1,
-0.5808833, -0.9547219, -3.263322, 0.2352941, 1, 0, 1,
-0.5796611, -0.3367666, -2.048825, 0.2313726, 1, 0, 1,
-0.5775214, -1.712647, -2.81561, 0.2235294, 1, 0, 1,
-0.5758284, -1.090593, -2.126941, 0.2196078, 1, 0, 1,
-0.5748202, 0.4015134, 1.154664, 0.2117647, 1, 0, 1,
-0.5740405, 0.364027, -0.8944235, 0.2078431, 1, 0, 1,
-0.5726817, 0.07030009, -0.8396955, 0.2, 1, 0, 1,
-0.5676069, 0.106646, -2.518825, 0.1921569, 1, 0, 1,
-0.5670774, -0.5050959, -2.537085, 0.1882353, 1, 0, 1,
-0.5610609, 0.6610669, -0.270597, 0.1803922, 1, 0, 1,
-0.5597112, 1.514932, 1.463427, 0.1764706, 1, 0, 1,
-0.5531808, -0.5066761, -0.2251536, 0.1686275, 1, 0, 1,
-0.5526339, 0.1899282, -0.07915786, 0.1647059, 1, 0, 1,
-0.5518509, 1.226609, 0.1770077, 0.1568628, 1, 0, 1,
-0.5501674, 1.376049, 0.1692223, 0.1529412, 1, 0, 1,
-0.5498925, 0.6112809, 1.175174, 0.145098, 1, 0, 1,
-0.5493549, 1.044374, -0.7691907, 0.1411765, 1, 0, 1,
-0.5459707, 0.2145759, -2.41943, 0.1333333, 1, 0, 1,
-0.5397815, -1.058167, -3.701468, 0.1294118, 1, 0, 1,
-0.5351911, -0.8437437, -1.241413, 0.1215686, 1, 0, 1,
-0.5348661, 0.2542187, 0.1320916, 0.1176471, 1, 0, 1,
-0.5347687, 1.487466, -0.8699878, 0.1098039, 1, 0, 1,
-0.525467, 0.7204953, -1.365289, 0.1058824, 1, 0, 1,
-0.5203424, 0.2663857, 1.940621, 0.09803922, 1, 0, 1,
-0.5191817, -0.8022563, 0.2811327, 0.09019608, 1, 0, 1,
-0.5184286, -0.01472567, -0.7673878, 0.08627451, 1, 0, 1,
-0.5149612, -0.09042272, -3.220029, 0.07843138, 1, 0, 1,
-0.5094578, -0.2802317, -3.838183, 0.07450981, 1, 0, 1,
-0.5091168, 2.40705, 0.3771032, 0.06666667, 1, 0, 1,
-0.5075972, 0.6022455, -2.390983, 0.0627451, 1, 0, 1,
-0.507001, -1.532762, -2.992448, 0.05490196, 1, 0, 1,
-0.506634, -0.3161486, -2.644272, 0.05098039, 1, 0, 1,
-0.5036581, -0.3597026, -1.547061, 0.04313726, 1, 0, 1,
-0.4992607, -0.6284956, -1.895095, 0.03921569, 1, 0, 1,
-0.4916913, 0.6434069, -1.87166, 0.03137255, 1, 0, 1,
-0.4851173, 0.3281507, -0.5632964, 0.02745098, 1, 0, 1,
-0.4837136, -1.060046, -3.61429, 0.01960784, 1, 0, 1,
-0.4814375, -0.09469524, -1.369002, 0.01568628, 1, 0, 1,
-0.4810435, -1.815704, -4.810428, 0.007843138, 1, 0, 1,
-0.4806184, -0.5919698, -2.569814, 0.003921569, 1, 0, 1,
-0.4805107, 1.542351, 1.319705, 0, 1, 0.003921569, 1,
-0.480031, -0.3589904, -2.070183, 0, 1, 0.01176471, 1,
-0.478479, 0.1967488, -0.7677486, 0, 1, 0.01568628, 1,
-0.4753948, -0.52375, -0.4169453, 0, 1, 0.02352941, 1,
-0.4652036, 1.507988, 0.6737525, 0, 1, 0.02745098, 1,
-0.4636871, -0.379585, -0.9718869, 0, 1, 0.03529412, 1,
-0.4591712, -0.3269601, -3.802701, 0, 1, 0.03921569, 1,
-0.4586408, 1.209867, -1.274222, 0, 1, 0.04705882, 1,
-0.4572675, 1.455682, 0.5164047, 0, 1, 0.05098039, 1,
-0.4567957, -1.337446, -2.760721, 0, 1, 0.05882353, 1,
-0.4557403, -0.7167752, -2.821124, 0, 1, 0.0627451, 1,
-0.4541976, -0.7650355, -2.184263, 0, 1, 0.07058824, 1,
-0.4431275, -3.355086, -1.938406, 0, 1, 0.07450981, 1,
-0.4429063, 0.5453001, -0.231593, 0, 1, 0.08235294, 1,
-0.4384072, -0.3541182, -1.629778, 0, 1, 0.08627451, 1,
-0.4301896, 0.5367605, 0.6070515, 0, 1, 0.09411765, 1,
-0.4280382, 1.535958, -1.389634, 0, 1, 0.1019608, 1,
-0.4241842, -0.7327375, -1.053932, 0, 1, 0.1058824, 1,
-0.4198651, 0.1773111, -1.747951, 0, 1, 0.1137255, 1,
-0.4192872, 0.7730815, -0.3249325, 0, 1, 0.1176471, 1,
-0.4144955, 0.2785513, -1.394541, 0, 1, 0.1254902, 1,
-0.4085982, 0.8504071, -0.5097266, 0, 1, 0.1294118, 1,
-0.4082114, 0.3008191, -1.751396, 0, 1, 0.1372549, 1,
-0.4065864, -0.0298787, -1.701657, 0, 1, 0.1411765, 1,
-0.4058746, -0.002644549, -2.059382, 0, 1, 0.1490196, 1,
-0.404381, 1.067408, -0.09703917, 0, 1, 0.1529412, 1,
-0.4034972, -0.1803484, -0.223368, 0, 1, 0.1607843, 1,
-0.4028055, -1.361719, -3.715143, 0, 1, 0.1647059, 1,
-0.4022911, 1.839758, -1.353948, 0, 1, 0.172549, 1,
-0.3944485, 1.425247, -0.5790783, 0, 1, 0.1764706, 1,
-0.3927152, 0.6399426, -1.706268, 0, 1, 0.1843137, 1,
-0.3867105, 0.1984636, -1.445298, 0, 1, 0.1882353, 1,
-0.3857529, -0.2263164, -2.9446, 0, 1, 0.1960784, 1,
-0.3797903, 0.7649632, -0.7678691, 0, 1, 0.2039216, 1,
-0.3790548, -0.5282651, -3.102091, 0, 1, 0.2078431, 1,
-0.3788344, 1.944949, -0.9094024, 0, 1, 0.2156863, 1,
-0.3723171, 0.9912418, 0.2098107, 0, 1, 0.2196078, 1,
-0.3715778, 0.2135917, -1.260471, 0, 1, 0.227451, 1,
-0.3693827, -0.253532, -2.304187, 0, 1, 0.2313726, 1,
-0.3690738, -0.6019121, -2.235334, 0, 1, 0.2392157, 1,
-0.3659098, -0.9131407, -2.84562, 0, 1, 0.2431373, 1,
-0.3613349, -0.8201582, -3.383273, 0, 1, 0.2509804, 1,
-0.360344, 0.6622913, 0.1196375, 0, 1, 0.254902, 1,
-0.3545341, 0.9487156, 0.2796534, 0, 1, 0.2627451, 1,
-0.3395503, 1.657011, -1.379766, 0, 1, 0.2666667, 1,
-0.3384106, 0.9874386, -0.8820529, 0, 1, 0.2745098, 1,
-0.3371575, 0.1689179, -1.310664, 0, 1, 0.2784314, 1,
-0.331542, -0.6406352, -1.64018, 0, 1, 0.2862745, 1,
-0.328054, 3.123338, -1.075819, 0, 1, 0.2901961, 1,
-0.3202583, -1.903854, -1.100571, 0, 1, 0.2980392, 1,
-0.3179104, -0.7892731, -2.186397, 0, 1, 0.3058824, 1,
-0.3170283, -0.03231985, -0.627107, 0, 1, 0.3098039, 1,
-0.3080509, 0.3209401, 1.332105, 0, 1, 0.3176471, 1,
-0.3077338, 0.529764, -0.7876187, 0, 1, 0.3215686, 1,
-0.3051477, -0.3912417, -0.6028289, 0, 1, 0.3294118, 1,
-0.301696, -0.4124427, -1.73446, 0, 1, 0.3333333, 1,
-0.2994869, -0.1618647, -2.463843, 0, 1, 0.3411765, 1,
-0.2994853, 0.5101776, 0.5107769, 0, 1, 0.345098, 1,
-0.2989759, -0.9211777, -3.125711, 0, 1, 0.3529412, 1,
-0.2963353, 0.7741929, -0.8114836, 0, 1, 0.3568628, 1,
-0.2928451, -0.2718674, -2.253834, 0, 1, 0.3647059, 1,
-0.2920015, -1.055217, -3.096626, 0, 1, 0.3686275, 1,
-0.2918509, -0.4220573, -3.495765, 0, 1, 0.3764706, 1,
-0.2778079, -0.5096207, -2.950685, 0, 1, 0.3803922, 1,
-0.2759072, -0.2943853, -2.956377, 0, 1, 0.3882353, 1,
-0.2750578, 0.251548, -1.760432, 0, 1, 0.3921569, 1,
-0.2735893, 0.2526926, -0.3162644, 0, 1, 0.4, 1,
-0.2701597, -0.2161219, -1.903486, 0, 1, 0.4078431, 1,
-0.2636056, 1.587548, -0.743286, 0, 1, 0.4117647, 1,
-0.2624929, 0.6606413, -0.4993341, 0, 1, 0.4196078, 1,
-0.2603321, 0.6278424, 0.1593007, 0, 1, 0.4235294, 1,
-0.2507605, 0.4296652, -1.05433, 0, 1, 0.4313726, 1,
-0.2501732, -0.5382445, -2.802067, 0, 1, 0.4352941, 1,
-0.2464973, 0.5070701, 0.3843535, 0, 1, 0.4431373, 1,
-0.2462032, 0.3089552, -0.2038655, 0, 1, 0.4470588, 1,
-0.2461192, 0.7109842, -0.8828437, 0, 1, 0.454902, 1,
-0.2459803, 0.06015204, 0.4052427, 0, 1, 0.4588235, 1,
-0.2444673, -0.3177556, -0.8592242, 0, 1, 0.4666667, 1,
-0.2443004, -0.7789841, -4.124357, 0, 1, 0.4705882, 1,
-0.2442343, -0.9934054, -1.596529, 0, 1, 0.4784314, 1,
-0.2437104, 0.7253907, -2.2525, 0, 1, 0.4823529, 1,
-0.2404616, 1.222203, 0.8484272, 0, 1, 0.4901961, 1,
-0.2403943, 1.859769, -0.4715104, 0, 1, 0.4941176, 1,
-0.2385224, 1.045496, -1.371212, 0, 1, 0.5019608, 1,
-0.2367277, 0.9947809, 1.738998, 0, 1, 0.509804, 1,
-0.2365283, -0.3252506, -1.489854, 0, 1, 0.5137255, 1,
-0.2332141, 1.613554, 0.9904631, 0, 1, 0.5215687, 1,
-0.2320398, -0.128778, -2.633293, 0, 1, 0.5254902, 1,
-0.2219157, -0.6381222, -1.61026, 0, 1, 0.5333334, 1,
-0.2130495, -0.1044764, -2.479709, 0, 1, 0.5372549, 1,
-0.2095355, -0.8551078, -1.484899, 0, 1, 0.5450981, 1,
-0.2028191, -0.0480766, -2.632597, 0, 1, 0.5490196, 1,
-0.2013495, -1.376741, -1.024324, 0, 1, 0.5568628, 1,
-0.2013298, -0.2849519, -4.390733, 0, 1, 0.5607843, 1,
-0.2006286, -0.2167432, -3.296023, 0, 1, 0.5686275, 1,
-0.1992437, 0.9526554, 2.26493, 0, 1, 0.572549, 1,
-0.194661, 1.629025, -0.7822747, 0, 1, 0.5803922, 1,
-0.1932875, 0.02094471, -1.649682, 0, 1, 0.5843138, 1,
-0.193253, -0.7273868, -0.584792, 0, 1, 0.5921569, 1,
-0.1902084, -0.1971055, -2.881026, 0, 1, 0.5960785, 1,
-0.1887026, 1.121707, -0.7783717, 0, 1, 0.6039216, 1,
-0.1859031, 1.292818, -2.072183, 0, 1, 0.6117647, 1,
-0.1845853, 0.6782238, -2.100003, 0, 1, 0.6156863, 1,
-0.1835544, 0.6747212, -0.4774209, 0, 1, 0.6235294, 1,
-0.1823418, -0.7118132, -4.285222, 0, 1, 0.627451, 1,
-0.1807106, -0.8200595, -1.14961, 0, 1, 0.6352941, 1,
-0.1798526, -0.4285771, -2.511811, 0, 1, 0.6392157, 1,
-0.1794042, -1.984141, -3.423373, 0, 1, 0.6470588, 1,
-0.17643, 0.6172796, -1.218626, 0, 1, 0.6509804, 1,
-0.1702835, 0.442594, -0.3367976, 0, 1, 0.6588235, 1,
-0.1688943, -1.997139, -3.567082, 0, 1, 0.6627451, 1,
-0.1631062, 0.2513243, -0.7092673, 0, 1, 0.6705883, 1,
-0.1626863, -0.3134756, -2.153791, 0, 1, 0.6745098, 1,
-0.1622297, 0.1327956, -1.709036, 0, 1, 0.682353, 1,
-0.1519486, -0.1036224, -4.246037, 0, 1, 0.6862745, 1,
-0.1495578, 1.975474, 0.4837297, 0, 1, 0.6941177, 1,
-0.1463466, -0.894528, -3.195549, 0, 1, 0.7019608, 1,
-0.1425649, 0.2233587, -0.9171098, 0, 1, 0.7058824, 1,
-0.1421397, 0.3387808, 1.305728, 0, 1, 0.7137255, 1,
-0.1377042, -0.5337231, -3.064933, 0, 1, 0.7176471, 1,
-0.1365017, 0.235137, -1.772437, 0, 1, 0.7254902, 1,
-0.1361134, -1.878273, -1.330571, 0, 1, 0.7294118, 1,
-0.1348805, -1.830641, -3.438828, 0, 1, 0.7372549, 1,
-0.1320728, -1.681446, -3.554124, 0, 1, 0.7411765, 1,
-0.1277424, 0.02009406, -2.878031, 0, 1, 0.7490196, 1,
-0.1265056, -0.8902534, -2.842414, 0, 1, 0.7529412, 1,
-0.1238807, 1.037138, -1.099562, 0, 1, 0.7607843, 1,
-0.1135367, 2.544775, -1.046312, 0, 1, 0.7647059, 1,
-0.1072807, 1.344051, 2.136109, 0, 1, 0.772549, 1,
-0.1066234, 1.938704, 0.6175614, 0, 1, 0.7764706, 1,
-0.1022947, 0.1881533, -1.494408, 0, 1, 0.7843137, 1,
-0.1015203, -0.9664512, -2.839186, 0, 1, 0.7882353, 1,
-0.100262, -1.602003, -3.774506, 0, 1, 0.7960784, 1,
-0.09881066, -0.1139011, -3.285102, 0, 1, 0.8039216, 1,
-0.08988366, 2.065652, -0.5757141, 0, 1, 0.8078431, 1,
-0.08906122, 0.3322333, -0.9052609, 0, 1, 0.8156863, 1,
-0.08840225, 0.1807649, -1.059681, 0, 1, 0.8196079, 1,
-0.08628505, 0.7714064, 0.8809593, 0, 1, 0.827451, 1,
-0.08471076, 0.377746, 0.5982462, 0, 1, 0.8313726, 1,
-0.08324996, -0.1598667, -4.500672, 0, 1, 0.8392157, 1,
-0.08210564, -0.980895, -1.811698, 0, 1, 0.8431373, 1,
-0.08008465, -0.3467899, -4.381919, 0, 1, 0.8509804, 1,
-0.0675798, -0.415919, -2.121731, 0, 1, 0.854902, 1,
-0.0668818, 0.9870834, 0.7401139, 0, 1, 0.8627451, 1,
-0.06424082, 0.7583067, -0.8568811, 0, 1, 0.8666667, 1,
-0.06144781, -1.484941, -3.276503, 0, 1, 0.8745098, 1,
-0.06048979, -0.1156285, -4.126595, 0, 1, 0.8784314, 1,
-0.05541627, -1.091241, -2.333992, 0, 1, 0.8862745, 1,
-0.05495623, -0.5947946, -1.670035, 0, 1, 0.8901961, 1,
-0.05450197, -0.13058, -4.488188, 0, 1, 0.8980392, 1,
-0.05183008, 0.445076, -1.144726, 0, 1, 0.9058824, 1,
-0.04520874, 1.031445, -0.2086464, 0, 1, 0.9098039, 1,
-0.04345522, -2.338919, -3.549486, 0, 1, 0.9176471, 1,
-0.04086683, 1.389234, -1.655626, 0, 1, 0.9215686, 1,
-0.03913537, -0.1839559, -2.890929, 0, 1, 0.9294118, 1,
-0.03881937, -0.05240988, -1.379827, 0, 1, 0.9333333, 1,
-0.03704133, 0.1540772, 0.4356011, 0, 1, 0.9411765, 1,
-0.03681527, -0.3318997, -3.176533, 0, 1, 0.945098, 1,
-0.03580892, -0.2574792, -4.735843, 0, 1, 0.9529412, 1,
-0.03523277, -1.248305, -1.255214, 0, 1, 0.9568627, 1,
-0.03356982, -0.9246821, -2.598202, 0, 1, 0.9647059, 1,
-0.03259185, -1.522937, -2.821415, 0, 1, 0.9686275, 1,
-0.03161064, -1.505014, -3.52623, 0, 1, 0.9764706, 1,
-0.0298472, -0.08434554, -2.135901, 0, 1, 0.9803922, 1,
-0.02777393, 0.9847007, -1.306362, 0, 1, 0.9882353, 1,
-0.02776071, 0.4732182, 0.1076704, 0, 1, 0.9921569, 1,
-0.02662722, 0.01834757, -1.665025, 0, 1, 1, 1,
-0.02481395, -0.2384673, -4.030227, 0, 0.9921569, 1, 1,
-0.01241207, -0.7370645, -2.486597, 0, 0.9882353, 1, 1,
-0.00653152, 1.596191, -0.9584923, 0, 0.9803922, 1, 1,
-0.006169978, 1.058044, -0.474001, 0, 0.9764706, 1, 1,
-0.004289182, -1.178489, -4.318028, 0, 0.9686275, 1, 1,
-0.003268647, -1.669357, -1.129527, 0, 0.9647059, 1, 1,
-0.000109835, 1.032927, 1.294684, 0, 0.9568627, 1, 1,
0.0007531134, 0.5470741, -0.6427598, 0, 0.9529412, 1, 1,
0.001424644, 0.3395957, -1.191408, 0, 0.945098, 1, 1,
0.00260949, 2.31649, 0.2412599, 0, 0.9411765, 1, 1,
0.00590765, 0.854779, -2.450478, 0, 0.9333333, 1, 1,
0.006136751, -0.5700712, 4.28232, 0, 0.9294118, 1, 1,
0.006196583, -0.1816401, 3.842388, 0, 0.9215686, 1, 1,
0.00854782, -0.7953114, 3.868639, 0, 0.9176471, 1, 1,
0.010927, 1.130226, -0.05950677, 0, 0.9098039, 1, 1,
0.01619892, -1.084777, 3.986305, 0, 0.9058824, 1, 1,
0.02149404, -0.3558803, 3.565197, 0, 0.8980392, 1, 1,
0.02209417, 0.6503402, -0.8850572, 0, 0.8901961, 1, 1,
0.02330535, 0.06252797, -0.0181403, 0, 0.8862745, 1, 1,
0.02374342, -0.7869705, 2.769334, 0, 0.8784314, 1, 1,
0.02631581, 0.2519517, 0.566268, 0, 0.8745098, 1, 1,
0.02639307, 0.08397689, -0.06019779, 0, 0.8666667, 1, 1,
0.03031365, -0.4007483, 4.289584, 0, 0.8627451, 1, 1,
0.03093418, 0.845147, -0.2623626, 0, 0.854902, 1, 1,
0.0314368, -0.07916558, 3.656462, 0, 0.8509804, 1, 1,
0.03173803, -0.7666994, 3.128055, 0, 0.8431373, 1, 1,
0.03609585, -0.5104722, 2.151417, 0, 0.8392157, 1, 1,
0.03610557, -1.510926, 1.549997, 0, 0.8313726, 1, 1,
0.04169378, -2.870447, 4.550834, 0, 0.827451, 1, 1,
0.04717596, -0.524985, 3.355598, 0, 0.8196079, 1, 1,
0.04850592, -0.5487573, 1.687741, 0, 0.8156863, 1, 1,
0.0488422, -1.203182, 3.631326, 0, 0.8078431, 1, 1,
0.05049039, -1.591882, 3.177161, 0, 0.8039216, 1, 1,
0.05274865, -0.07187709, 1.577194, 0, 0.7960784, 1, 1,
0.05598491, -0.4852036, 3.421486, 0, 0.7882353, 1, 1,
0.05733295, -0.4434704, 3.915564, 0, 0.7843137, 1, 1,
0.05815695, -0.05263435, 1.497703, 0, 0.7764706, 1, 1,
0.06656068, -1.138728, 1.918097, 0, 0.772549, 1, 1,
0.06845952, -1.090849, 2.763957, 0, 0.7647059, 1, 1,
0.07428372, -0.628527, 1.624491, 0, 0.7607843, 1, 1,
0.077654, -2.052984, 4.154302, 0, 0.7529412, 1, 1,
0.07884049, -0.030629, 4.005228, 0, 0.7490196, 1, 1,
0.08058856, -0.06100245, 0.89547, 0, 0.7411765, 1, 1,
0.08790547, -0.01342964, 3.101147, 0, 0.7372549, 1, 1,
0.09238996, -0.7735978, 1.463303, 0, 0.7294118, 1, 1,
0.09409289, -0.8900074, 3.788163, 0, 0.7254902, 1, 1,
0.09472799, -0.9879757, 0.990424, 0, 0.7176471, 1, 1,
0.09792291, -0.08425827, 1.233678, 0, 0.7137255, 1, 1,
0.1055291, 0.06759501, 3.025533, 0, 0.7058824, 1, 1,
0.1062985, 0.04567442, 0.6572756, 0, 0.6980392, 1, 1,
0.1158484, -1.376828, 3.515795, 0, 0.6941177, 1, 1,
0.1185351, -2.180599, 2.711868, 0, 0.6862745, 1, 1,
0.1295817, -1.056011, 4.308201, 0, 0.682353, 1, 1,
0.1316685, 1.054114, -1.175705, 0, 0.6745098, 1, 1,
0.1404352, -0.06421357, 1.715864, 0, 0.6705883, 1, 1,
0.140551, 0.8402665, 0.9813237, 0, 0.6627451, 1, 1,
0.1436543, -0.2327714, 3.539585, 0, 0.6588235, 1, 1,
0.1530539, 0.4316853, 0.1378261, 0, 0.6509804, 1, 1,
0.1551484, 0.9304338, 0.2198415, 0, 0.6470588, 1, 1,
0.1598987, 0.3369127, -0.8558111, 0, 0.6392157, 1, 1,
0.1604652, 0.02186018, 2.320991, 0, 0.6352941, 1, 1,
0.1660102, 0.7146048, -0.5112059, 0, 0.627451, 1, 1,
0.1675189, 1.287877, 1.157682, 0, 0.6235294, 1, 1,
0.1677745, -1.535616, 2.853261, 0, 0.6156863, 1, 1,
0.1702271, -1.113174, 2.311741, 0, 0.6117647, 1, 1,
0.1721705, 0.824944, -2.321226, 0, 0.6039216, 1, 1,
0.1728662, -2.306587, 4.397567, 0, 0.5960785, 1, 1,
0.1743621, -1.729022, 1.563677, 0, 0.5921569, 1, 1,
0.1755414, 0.1128726, -0.03788601, 0, 0.5843138, 1, 1,
0.1765723, -0.2943225, 1.767304, 0, 0.5803922, 1, 1,
0.176881, -0.9169829, 4.226717, 0, 0.572549, 1, 1,
0.177428, -2.340154, 3.196166, 0, 0.5686275, 1, 1,
0.1777844, 1.216126, -0.8440897, 0, 0.5607843, 1, 1,
0.1778396, 1.529087, 0.03560428, 0, 0.5568628, 1, 1,
0.1833899, 0.7176139, -0.4200051, 0, 0.5490196, 1, 1,
0.1840864, -1.919665, 2.864194, 0, 0.5450981, 1, 1,
0.1874167, -1.333674, 2.355414, 0, 0.5372549, 1, 1,
0.1882527, 0.003540551, 1.380967, 0, 0.5333334, 1, 1,
0.1889835, -1.387875, 2.125709, 0, 0.5254902, 1, 1,
0.1912502, 0.4813149, -1.713378, 0, 0.5215687, 1, 1,
0.1964395, 0.7392467, 0.8373832, 0, 0.5137255, 1, 1,
0.2015159, 0.7964255, -0.0404806, 0, 0.509804, 1, 1,
0.2060831, 0.02715441, 2.628071, 0, 0.5019608, 1, 1,
0.2085293, -0.5966023, 3.53284, 0, 0.4941176, 1, 1,
0.2100628, 0.7125362, 2.742225, 0, 0.4901961, 1, 1,
0.2103199, -0.04145804, -1.326418, 0, 0.4823529, 1, 1,
0.2122617, -0.5028789, 3.134945, 0, 0.4784314, 1, 1,
0.2177677, -0.923535, 2.739043, 0, 0.4705882, 1, 1,
0.2207732, 0.06476506, 1.608975, 0, 0.4666667, 1, 1,
0.2221751, 1.510958, -0.3434227, 0, 0.4588235, 1, 1,
0.2279497, -1.10902, 4.263062, 0, 0.454902, 1, 1,
0.230531, 0.5216873, 0.4037807, 0, 0.4470588, 1, 1,
0.2308971, 1.152505, -0.5116314, 0, 0.4431373, 1, 1,
0.2349878, -1.519319, 4.022318, 0, 0.4352941, 1, 1,
0.2354423, 1.163782, 0.584424, 0, 0.4313726, 1, 1,
0.2379367, 0.02116978, 3.280196, 0, 0.4235294, 1, 1,
0.243461, -1.822437, 4.410245, 0, 0.4196078, 1, 1,
0.2473539, 3.006665, 0.4701625, 0, 0.4117647, 1, 1,
0.2479169, -0.8524882, 0.8407369, 0, 0.4078431, 1, 1,
0.2502896, -0.7449115, 3.49687, 0, 0.4, 1, 1,
0.2519456, -2.007865, 2.978386, 0, 0.3921569, 1, 1,
0.2541366, 0.8920802, 2.209627, 0, 0.3882353, 1, 1,
0.2541988, -2.084347, 2.595388, 0, 0.3803922, 1, 1,
0.2610423, 0.4164797, 0.7057775, 0, 0.3764706, 1, 1,
0.2615119, -0.7197276, 3.601422, 0, 0.3686275, 1, 1,
0.2658488, 0.663125, 0.8707755, 0, 0.3647059, 1, 1,
0.2715822, 0.4661113, 1.829503, 0, 0.3568628, 1, 1,
0.2740504, -0.9687433, 4.011598, 0, 0.3529412, 1, 1,
0.2751583, 0.09377744, 2.635501, 0, 0.345098, 1, 1,
0.2848036, 1.8835, -1.180251, 0, 0.3411765, 1, 1,
0.2855105, 0.05010559, 1.945631, 0, 0.3333333, 1, 1,
0.2874294, 0.5650162, 0.3264329, 0, 0.3294118, 1, 1,
0.2879043, -1.357571, 3.812127, 0, 0.3215686, 1, 1,
0.2884889, -0.5802257, 3.196269, 0, 0.3176471, 1, 1,
0.289335, -1.583174, 1.195143, 0, 0.3098039, 1, 1,
0.289913, 0.2516169, -0.2883863, 0, 0.3058824, 1, 1,
0.2956903, -1.270457, 3.239926, 0, 0.2980392, 1, 1,
0.2980037, -2.008027, 3.931433, 0, 0.2901961, 1, 1,
0.2999519, -0.5390219, 3.909893, 0, 0.2862745, 1, 1,
0.3001511, -0.1563243, 0.4320835, 0, 0.2784314, 1, 1,
0.3006493, 0.3499541, -0.315188, 0, 0.2745098, 1, 1,
0.3077902, -2.159727, 2.888318, 0, 0.2666667, 1, 1,
0.3086299, -0.1076441, 1.139497, 0, 0.2627451, 1, 1,
0.3104244, 0.4425684, 0.8232867, 0, 0.254902, 1, 1,
0.3109848, -1.382928, 2.728585, 0, 0.2509804, 1, 1,
0.3170015, -0.6115142, 2.889874, 0, 0.2431373, 1, 1,
0.318984, 0.1712016, -0.6448569, 0, 0.2392157, 1, 1,
0.3197803, 0.1853354, 0.6483754, 0, 0.2313726, 1, 1,
0.3218872, 0.2539076, 0.2085001, 0, 0.227451, 1, 1,
0.3308754, 0.2011278, 1.378341, 0, 0.2196078, 1, 1,
0.3349661, -0.2185351, 0.8282427, 0, 0.2156863, 1, 1,
0.3351569, -0.2722456, 0.4086308, 0, 0.2078431, 1, 1,
0.3382183, 0.96676, 1.983774, 0, 0.2039216, 1, 1,
0.3404114, 1.196145, -0.4267625, 0, 0.1960784, 1, 1,
0.3411797, -2.15057, 3.367475, 0, 0.1882353, 1, 1,
0.3416797, 0.1325489, 2.379922, 0, 0.1843137, 1, 1,
0.3422234, 0.597359, 1.366406, 0, 0.1764706, 1, 1,
0.3432599, 1.389013, -0.3533578, 0, 0.172549, 1, 1,
0.3439446, 0.00944059, 1.39542, 0, 0.1647059, 1, 1,
0.3454023, -0.3282402, 2.778824, 0, 0.1607843, 1, 1,
0.3459408, -1.569958, 3.227791, 0, 0.1529412, 1, 1,
0.3469144, 0.8134546, -0.3011012, 0, 0.1490196, 1, 1,
0.3469791, -0.4323882, 3.839276, 0, 0.1411765, 1, 1,
0.3507226, 1.921073, 1.705861, 0, 0.1372549, 1, 1,
0.3508631, -3.031384, 2.255498, 0, 0.1294118, 1, 1,
0.3541248, 1.036496, -0.5384456, 0, 0.1254902, 1, 1,
0.3545724, -1.189155, 3.215779, 0, 0.1176471, 1, 1,
0.3591799, -0.3546847, 2.806239, 0, 0.1137255, 1, 1,
0.3629791, 0.1008658, 2.091313, 0, 0.1058824, 1, 1,
0.3686494, 0.3867497, 0.9422482, 0, 0.09803922, 1, 1,
0.3687201, -0.05801252, -0.3290041, 0, 0.09411765, 1, 1,
0.3697212, -1.034387, 3.273093, 0, 0.08627451, 1, 1,
0.3746879, -1.449189, 1.950608, 0, 0.08235294, 1, 1,
0.386, 0.6853045, -2.107389, 0, 0.07450981, 1, 1,
0.3884213, 0.1181033, 2.262671, 0, 0.07058824, 1, 1,
0.3905555, -0.08879473, 3.091857, 0, 0.0627451, 1, 1,
0.3971694, -0.7333958, 1.131788, 0, 0.05882353, 1, 1,
0.3992183, -1.452473, 3.141765, 0, 0.05098039, 1, 1,
0.4036483, 0.8095289, 2.928204, 0, 0.04705882, 1, 1,
0.405757, -1.227897, 4.036349, 0, 0.03921569, 1, 1,
0.4060856, -0.7301302, 3.310803, 0, 0.03529412, 1, 1,
0.4107332, 1.278177, 1.656291, 0, 0.02745098, 1, 1,
0.4115968, -0.4854843, 4.277963, 0, 0.02352941, 1, 1,
0.41256, -0.4580573, 2.316942, 0, 0.01568628, 1, 1,
0.414794, -0.6828695, 1.86954, 0, 0.01176471, 1, 1,
0.4154088, 0.1694415, 1.718234, 0, 0.003921569, 1, 1,
0.4178842, -2.009724, 3.911369, 0.003921569, 0, 1, 1,
0.4247637, 0.3338204, 0.527898, 0.007843138, 0, 1, 1,
0.4249011, -0.02691465, 1.25588, 0.01568628, 0, 1, 1,
0.4256237, -0.02004578, 0.1757256, 0.01960784, 0, 1, 1,
0.4401425, 0.8069172, 1.119733, 0.02745098, 0, 1, 1,
0.4421898, -1.849013, 2.334446, 0.03137255, 0, 1, 1,
0.4438141, -0.8065903, 3.605859, 0.03921569, 0, 1, 1,
0.4456291, -0.2209484, 1.112788, 0.04313726, 0, 1, 1,
0.447008, -0.6779401, 2.912246, 0.05098039, 0, 1, 1,
0.4476884, 1.096037, 1.310592, 0.05490196, 0, 1, 1,
0.4487939, -0.962884, 3.190639, 0.0627451, 0, 1, 1,
0.4524505, -0.1039605, 0.8830159, 0.06666667, 0, 1, 1,
0.4537756, -2.410486, 5.430832, 0.07450981, 0, 1, 1,
0.4573252, -1.445942, 1.298292, 0.07843138, 0, 1, 1,
0.4589902, 0.839943, 1.598058, 0.08627451, 0, 1, 1,
0.4691306, 0.1741771, 1.676024, 0.09019608, 0, 1, 1,
0.4700629, 0.9857504, 0.4259914, 0.09803922, 0, 1, 1,
0.4708569, 0.1801102, 1.234058, 0.1058824, 0, 1, 1,
0.4715077, -0.3171763, 2.526877, 0.1098039, 0, 1, 1,
0.4741112, -0.2334673, 3.055915, 0.1176471, 0, 1, 1,
0.4750427, -0.01988549, 0.1775972, 0.1215686, 0, 1, 1,
0.4755375, 1.164544, 0.02505318, 0.1294118, 0, 1, 1,
0.4775403, 0.1853755, -0.08837526, 0.1333333, 0, 1, 1,
0.4862906, 0.3858356, 0.7885563, 0.1411765, 0, 1, 1,
0.490404, -1.741615, 2.023375, 0.145098, 0, 1, 1,
0.4992059, 0.3217611, 1.10891, 0.1529412, 0, 1, 1,
0.5010973, 0.07046838, 0.9350203, 0.1568628, 0, 1, 1,
0.5011738, -1.442958, 3.001626, 0.1647059, 0, 1, 1,
0.5037464, 0.6282845, 1.055573, 0.1686275, 0, 1, 1,
0.5048836, -1.064154, 3.81951, 0.1764706, 0, 1, 1,
0.5066955, 1.988874, 1.373002, 0.1803922, 0, 1, 1,
0.5068822, 0.2086386, 1.461615, 0.1882353, 0, 1, 1,
0.5079239, -0.4206659, 2.859929, 0.1921569, 0, 1, 1,
0.5103909, -0.1006662, 2.525745, 0.2, 0, 1, 1,
0.5104481, -2.090633, 1.892895, 0.2078431, 0, 1, 1,
0.5153056, 0.3947135, 1.697794, 0.2117647, 0, 1, 1,
0.5153546, 0.3251361, 1.509728, 0.2196078, 0, 1, 1,
0.516726, 0.8573073, -0.407829, 0.2235294, 0, 1, 1,
0.5173859, 1.712007, 0.4288035, 0.2313726, 0, 1, 1,
0.5223212, -0.324416, 3.089267, 0.2352941, 0, 1, 1,
0.525435, -1.043919, 2.635104, 0.2431373, 0, 1, 1,
0.5266644, 0.1571956, -0.181319, 0.2470588, 0, 1, 1,
0.527207, 0.5973451, 0.7586528, 0.254902, 0, 1, 1,
0.5273045, 0.3758699, 1.038129, 0.2588235, 0, 1, 1,
0.5302727, -0.9483851, 2.686413, 0.2666667, 0, 1, 1,
0.5314142, -0.777938, 2.269271, 0.2705882, 0, 1, 1,
0.5318514, -0.9292793, 2.351207, 0.2784314, 0, 1, 1,
0.5455455, 0.01539127, 1.997883, 0.282353, 0, 1, 1,
0.5458847, -0.8659124, 2.053415, 0.2901961, 0, 1, 1,
0.5471545, -1.642843, 1.790088, 0.2941177, 0, 1, 1,
0.5497142, 0.02299072, 2.111354, 0.3019608, 0, 1, 1,
0.550175, 0.3143551, 0.7813591, 0.3098039, 0, 1, 1,
0.5514612, 0.8865505, -1.09929, 0.3137255, 0, 1, 1,
0.5528286, 0.6770094, 2.735212, 0.3215686, 0, 1, 1,
0.5603797, -1.109242, 4.051475, 0.3254902, 0, 1, 1,
0.5605615, 0.04672898, 2.090713, 0.3333333, 0, 1, 1,
0.5612755, -0.2907367, 1.764613, 0.3372549, 0, 1, 1,
0.5619968, -0.2371895, 3.053766, 0.345098, 0, 1, 1,
0.5630286, 0.41912, 0.7192021, 0.3490196, 0, 1, 1,
0.5663835, 0.7266265, 1.956594, 0.3568628, 0, 1, 1,
0.5704839, 0.9265962, -0.5512336, 0.3607843, 0, 1, 1,
0.5732377, 0.6780518, 0.4112149, 0.3686275, 0, 1, 1,
0.5741343, -1.957773, 3.492351, 0.372549, 0, 1, 1,
0.5750792, 0.3314708, -0.03691737, 0.3803922, 0, 1, 1,
0.5751768, 0.5935835, 1.435551, 0.3843137, 0, 1, 1,
0.5780115, 0.2563698, 1.323443, 0.3921569, 0, 1, 1,
0.5825821, -1.478148, 0.2722602, 0.3960784, 0, 1, 1,
0.5902199, -0.8293125, 2.133324, 0.4039216, 0, 1, 1,
0.5915127, -0.8987474, 3.027644, 0.4117647, 0, 1, 1,
0.6014032, 0.6253598, -0.9582588, 0.4156863, 0, 1, 1,
0.6035136, -0.009705653, 2.479992, 0.4235294, 0, 1, 1,
0.6042028, -1.471246, 2.320753, 0.427451, 0, 1, 1,
0.6090251, 0.4934261, 2.073129, 0.4352941, 0, 1, 1,
0.6110269, 1.12482, 3.018482, 0.4392157, 0, 1, 1,
0.6127454, 0.1555063, 1.389308, 0.4470588, 0, 1, 1,
0.6127998, 0.988271, 1.310134, 0.4509804, 0, 1, 1,
0.6197332, 0.9668308, 0.1986853, 0.4588235, 0, 1, 1,
0.6220517, -0.4250794, 2.961485, 0.4627451, 0, 1, 1,
0.6300951, 0.4558549, 1.118794, 0.4705882, 0, 1, 1,
0.6357576, -1.756497, 3.126366, 0.4745098, 0, 1, 1,
0.6386862, -0.7843222, 2.379968, 0.4823529, 0, 1, 1,
0.6402153, 0.1383679, 1.883712, 0.4862745, 0, 1, 1,
0.6409353, -0.1692683, 1.79113, 0.4941176, 0, 1, 1,
0.6419036, 0.3407073, 1.071739, 0.5019608, 0, 1, 1,
0.6421191, 0.4352997, 0.3095937, 0.5058824, 0, 1, 1,
0.643306, 0.307891, 0.6082761, 0.5137255, 0, 1, 1,
0.6442534, -1.883319, 3.22131, 0.5176471, 0, 1, 1,
0.6490174, -1.10836, 3.189495, 0.5254902, 0, 1, 1,
0.6514376, -0.9018262, 3.235519, 0.5294118, 0, 1, 1,
0.6619775, 0.3150195, -0.3266236, 0.5372549, 0, 1, 1,
0.6627176, 0.8956251, 0.7833241, 0.5411765, 0, 1, 1,
0.6656772, 0.009544869, 0.3140876, 0.5490196, 0, 1, 1,
0.6660168, -1.007267, 1.742277, 0.5529412, 0, 1, 1,
0.6725054, -0.5942694, 0.5287101, 0.5607843, 0, 1, 1,
0.67678, -0.3784141, 0.6230229, 0.5647059, 0, 1, 1,
0.6899138, 1.358696, 1.905305, 0.572549, 0, 1, 1,
0.6914113, 0.7590569, 0.002489338, 0.5764706, 0, 1, 1,
0.6928358, -2.38644, 2.201065, 0.5843138, 0, 1, 1,
0.6967028, 0.1473268, 1.974325, 0.5882353, 0, 1, 1,
0.698134, 1.135505, 1.288491, 0.5960785, 0, 1, 1,
0.70187, 2.737857, 0.3536112, 0.6039216, 0, 1, 1,
0.7035006, 0.4525232, 1.466334, 0.6078432, 0, 1, 1,
0.704343, 0.5984966, 1.835808, 0.6156863, 0, 1, 1,
0.7043684, 1.31988, 1.063302, 0.6196079, 0, 1, 1,
0.7081607, 0.7311069, 0.590481, 0.627451, 0, 1, 1,
0.7132213, 1.390881, 2.456236, 0.6313726, 0, 1, 1,
0.7145917, -0.8906785, 1.199405, 0.6392157, 0, 1, 1,
0.7167749, -2.12592, 2.726126, 0.6431373, 0, 1, 1,
0.7178639, 2.651218, 2.214923, 0.6509804, 0, 1, 1,
0.7181752, -0.2521699, 1.864168, 0.654902, 0, 1, 1,
0.7213356, 1.287985, 0.02514098, 0.6627451, 0, 1, 1,
0.7255878, -0.2447633, 2.305353, 0.6666667, 0, 1, 1,
0.7352151, 2.24562, -0.3897087, 0.6745098, 0, 1, 1,
0.7389504, 0.3717562, 0.7767364, 0.6784314, 0, 1, 1,
0.7415296, -0.01003842, 0.8993603, 0.6862745, 0, 1, 1,
0.7419975, -0.5807914, 3.608684, 0.6901961, 0, 1, 1,
0.7475504, 0.6077589, 0.09498677, 0.6980392, 0, 1, 1,
0.754376, -0.4865758, 1.742157, 0.7058824, 0, 1, 1,
0.7623056, 0.9237907, -1.841779, 0.7098039, 0, 1, 1,
0.7639287, 0.1233706, 1.656208, 0.7176471, 0, 1, 1,
0.7642677, 1.922715, 0.8498654, 0.7215686, 0, 1, 1,
0.778076, 0.4192519, -0.2459653, 0.7294118, 0, 1, 1,
0.7801912, 0.0935046, 1.592772, 0.7333333, 0, 1, 1,
0.7852926, -0.6039678, 1.746969, 0.7411765, 0, 1, 1,
0.7875385, 0.4351, 1.495445, 0.7450981, 0, 1, 1,
0.8045229, 0.3322256, 1.105916, 0.7529412, 0, 1, 1,
0.8062493, 0.6347922, 0.2861717, 0.7568628, 0, 1, 1,
0.8252136, 0.8212816, 0.7488811, 0.7647059, 0, 1, 1,
0.8347387, 2.281553, 0.4745664, 0.7686275, 0, 1, 1,
0.8350634, -0.2738584, 0.9942482, 0.7764706, 0, 1, 1,
0.8396343, 0.7260879, 0.5444508, 0.7803922, 0, 1, 1,
0.8519938, -1.704176, 2.805711, 0.7882353, 0, 1, 1,
0.8533885, -0.2739376, 1.744924, 0.7921569, 0, 1, 1,
0.8555924, 2.195105, 1.721644, 0.8, 0, 1, 1,
0.8561144, 0.04634027, -0.961719, 0.8078431, 0, 1, 1,
0.8568552, 0.003714319, 2.705311, 0.8117647, 0, 1, 1,
0.8597202, -1.455742, 2.755157, 0.8196079, 0, 1, 1,
0.8605292, 0.7078094, 0.4204295, 0.8235294, 0, 1, 1,
0.8634059, 0.7990449, -0.2979161, 0.8313726, 0, 1, 1,
0.864387, 1.472885, 1.225551, 0.8352941, 0, 1, 1,
0.8646331, -0.5209457, 3.800419, 0.8431373, 0, 1, 1,
0.8680221, 0.6228873, 2.256132, 0.8470588, 0, 1, 1,
0.871648, 0.15021, 1.90881, 0.854902, 0, 1, 1,
0.8732095, -0.6248137, 0.2646028, 0.8588235, 0, 1, 1,
0.8754112, -1.824626, 2.214032, 0.8666667, 0, 1, 1,
0.8807828, 0.7088644, -0.2477413, 0.8705882, 0, 1, 1,
0.880899, 1.039403, 0.7561145, 0.8784314, 0, 1, 1,
0.88806, -0.8569732, 2.083433, 0.8823529, 0, 1, 1,
0.8937631, -0.5873022, 2.612788, 0.8901961, 0, 1, 1,
0.8965625, 1.142919, 0.04448286, 0.8941177, 0, 1, 1,
0.9027785, -0.9301223, 2.699535, 0.9019608, 0, 1, 1,
0.910683, -0.2560451, 1.085592, 0.9098039, 0, 1, 1,
0.9128209, 0.6127608, 0.7350904, 0.9137255, 0, 1, 1,
0.9147874, 0.6082142, 0.4554934, 0.9215686, 0, 1, 1,
0.9152359, -1.412253, 3.311665, 0.9254902, 0, 1, 1,
0.9201525, 2.38332, 0.8922055, 0.9333333, 0, 1, 1,
0.9209829, 0.0197506, 2.236033, 0.9372549, 0, 1, 1,
0.924917, 1.726024, 0.2521034, 0.945098, 0, 1, 1,
0.9256852, 0.1733892, 2.843246, 0.9490196, 0, 1, 1,
0.9276804, -0.0009630339, 2.278261, 0.9568627, 0, 1, 1,
0.9291068, 0.2996499, 0.8000289, 0.9607843, 0, 1, 1,
0.9300866, 0.507003, 1.739255, 0.9686275, 0, 1, 1,
0.9414111, -1.103672, 2.682866, 0.972549, 0, 1, 1,
0.9424809, -0.3448698, 2.246704, 0.9803922, 0, 1, 1,
0.951483, 0.7473388, 1.088657, 0.9843137, 0, 1, 1,
0.9537134, -0.2086138, 2.543913, 0.9921569, 0, 1, 1,
0.9539266, -1.016018, 1.577856, 0.9960784, 0, 1, 1,
0.9571807, -1.729907, 3.35638, 1, 0, 0.9960784, 1,
0.9641839, 0.320282, 2.365503, 1, 0, 0.9882353, 1,
0.9645674, -1.131724, 2.28809, 1, 0, 0.9843137, 1,
0.9647467, 0.3959628, 1.69218, 1, 0, 0.9764706, 1,
0.9649421, -1.128802, 1.290489, 1, 0, 0.972549, 1,
0.9664757, -1.653757, 1.878271, 1, 0, 0.9647059, 1,
0.969062, -1.167379, 1.628341, 1, 0, 0.9607843, 1,
0.9728674, -0.9057587, 0.0830484, 1, 0, 0.9529412, 1,
0.9736294, -2.055022, 4.015553, 1, 0, 0.9490196, 1,
0.9773686, 0.06789242, 1.452244, 1, 0, 0.9411765, 1,
0.9777688, -0.8443683, 3.039858, 1, 0, 0.9372549, 1,
0.9784348, 0.0415553, 1.841731, 1, 0, 0.9294118, 1,
0.9862442, -0.7448668, 4.564739, 1, 0, 0.9254902, 1,
0.9864074, -0.4894845, 2.676687, 1, 0, 0.9176471, 1,
0.9884624, 1.666172, 0.03971505, 1, 0, 0.9137255, 1,
0.9922079, 0.7468782, 2.458776, 1, 0, 0.9058824, 1,
0.9923863, 0.5818093, 2.523065, 1, 0, 0.9019608, 1,
1.008985, -1.058182, 3.43662, 1, 0, 0.8941177, 1,
1.009946, -1.391387, 2.218561, 1, 0, 0.8862745, 1,
1.010811, 0.4276365, 1.063614, 1, 0, 0.8823529, 1,
1.011422, 0.8954629, 1.030103, 1, 0, 0.8745098, 1,
1.01531, -1.118565, 1.776013, 1, 0, 0.8705882, 1,
1.02558, -0.4684533, 2.11147, 1, 0, 0.8627451, 1,
1.027246, 1.278244, 1.586121, 1, 0, 0.8588235, 1,
1.028436, -0.08577358, 1.859469, 1, 0, 0.8509804, 1,
1.028697, -0.5224435, 4.003092, 1, 0, 0.8470588, 1,
1.031779, -0.8299485, 2.035125, 1, 0, 0.8392157, 1,
1.041372, 0.2588264, 1.851022, 1, 0, 0.8352941, 1,
1.048617, -0.4429597, 2.074517, 1, 0, 0.827451, 1,
1.04998, 1.154128, 0.9068522, 1, 0, 0.8235294, 1,
1.050663, -1.655713, 3.016413, 1, 0, 0.8156863, 1,
1.063437, -0.0150345, 0.7273381, 1, 0, 0.8117647, 1,
1.072539, -1.130315, 2.638428, 1, 0, 0.8039216, 1,
1.078887, -0.03338344, 2.048155, 1, 0, 0.7960784, 1,
1.079944, -1.18783, 3.625142, 1, 0, 0.7921569, 1,
1.081072, 0.6836358, 1.083278, 1, 0, 0.7843137, 1,
1.104898, -1.069364, 2.900689, 1, 0, 0.7803922, 1,
1.105087, -0.6705988, 2.567555, 1, 0, 0.772549, 1,
1.106505, -0.0462687, 3.640355, 1, 0, 0.7686275, 1,
1.10819, 0.8367546, 0.6450347, 1, 0, 0.7607843, 1,
1.110013, 0.2796926, 2.56299, 1, 0, 0.7568628, 1,
1.126313, 0.7487887, 0.5052007, 1, 0, 0.7490196, 1,
1.138446, 0.06639045, 1.650017, 1, 0, 0.7450981, 1,
1.139187, 0.7578086, 0.3718061, 1, 0, 0.7372549, 1,
1.141639, -1.373853, 2.262466, 1, 0, 0.7333333, 1,
1.142142, 0.8565203, 1.074047, 1, 0, 0.7254902, 1,
1.152553, -0.3400264, 1.763717, 1, 0, 0.7215686, 1,
1.156315, -0.7300082, 1.714776, 1, 0, 0.7137255, 1,
1.16421, 0.9667283, -1.582366, 1, 0, 0.7098039, 1,
1.164448, 0.3006323, -0.9042982, 1, 0, 0.7019608, 1,
1.165736, -1.530426, 2.496866, 1, 0, 0.6941177, 1,
1.169683, 0.9366862, 0.6628686, 1, 0, 0.6901961, 1,
1.172754, 0.9931427, 2.840249, 1, 0, 0.682353, 1,
1.195783, -0.357559, 2.864312, 1, 0, 0.6784314, 1,
1.203991, 0.4312275, 2.028925, 1, 0, 0.6705883, 1,
1.212332, 0.7300408, 0.2574198, 1, 0, 0.6666667, 1,
1.218709, 0.3538318, 1.782939, 1, 0, 0.6588235, 1,
1.224064, 0.7805355, 0.3708813, 1, 0, 0.654902, 1,
1.230191, -1.165027, 1.101989, 1, 0, 0.6470588, 1,
1.230639, 0.3210614, 2.881749, 1, 0, 0.6431373, 1,
1.233329, -0.601929, 2.245997, 1, 0, 0.6352941, 1,
1.233524, -0.8737996, 2.130516, 1, 0, 0.6313726, 1,
1.234369, -1.784387, 2.996344, 1, 0, 0.6235294, 1,
1.235374, 1.05038, 1.458986, 1, 0, 0.6196079, 1,
1.237908, 0.9916597, 2.308325, 1, 0, 0.6117647, 1,
1.241915, 1.188908, 1.030021, 1, 0, 0.6078432, 1,
1.244249, -1.26978, 4.095247, 1, 0, 0.6, 1,
1.244582, -0.9626318, 4.027604, 1, 0, 0.5921569, 1,
1.273052, -0.5824359, 1.596779, 1, 0, 0.5882353, 1,
1.276859, 1.799573, -1.868158, 1, 0, 0.5803922, 1,
1.277571, -0.3505593, 1.005188, 1, 0, 0.5764706, 1,
1.282358, 0.9616609, 1.897336, 1, 0, 0.5686275, 1,
1.291817, 1.160401, 1.466611, 1, 0, 0.5647059, 1,
1.295239, 0.7428175, 1.526119, 1, 0, 0.5568628, 1,
1.300219, 0.05635818, 0.245986, 1, 0, 0.5529412, 1,
1.300677, 1.123003, 1.407356, 1, 0, 0.5450981, 1,
1.306536, -0.06233058, 3.067981, 1, 0, 0.5411765, 1,
1.307092, 0.7828335, -0.4783629, 1, 0, 0.5333334, 1,
1.308762, 0.8406908, 0.6033255, 1, 0, 0.5294118, 1,
1.321157, -0.09549598, 1.415774, 1, 0, 0.5215687, 1,
1.331405, 0.6569305, 1.380099, 1, 0, 0.5176471, 1,
1.332524, -0.4960906, 1.685038, 1, 0, 0.509804, 1,
1.334895, 0.2310646, 0.8849881, 1, 0, 0.5058824, 1,
1.346136, 1.251691, 1.227465, 1, 0, 0.4980392, 1,
1.352004, 0.4244053, 1.513403, 1, 0, 0.4901961, 1,
1.35601, -0.5524297, 2.764589, 1, 0, 0.4862745, 1,
1.36016, 0.5553771, 0.5280678, 1, 0, 0.4784314, 1,
1.363755, -1.310395, 1.413836, 1, 0, 0.4745098, 1,
1.373646, 0.5950229, 0.82049, 1, 0, 0.4666667, 1,
1.378623, 0.2186079, -0.00312408, 1, 0, 0.4627451, 1,
1.380091, 0.6323373, 0.5145525, 1, 0, 0.454902, 1,
1.397857, 1.273553, 1.444801, 1, 0, 0.4509804, 1,
1.40264, 0.1583258, 1.388771, 1, 0, 0.4431373, 1,
1.404754, 1.117497, 0.7319754, 1, 0, 0.4392157, 1,
1.411307, 0.8632233, 1.734379, 1, 0, 0.4313726, 1,
1.440307, -0.68111, 2.479815, 1, 0, 0.427451, 1,
1.474803, 2.158283, 0.1201193, 1, 0, 0.4196078, 1,
1.489221, 0.4885513, 1.393708, 1, 0, 0.4156863, 1,
1.499069, -0.8591247, 2.439735, 1, 0, 0.4078431, 1,
1.499148, 1.676665, 1.950372, 1, 0, 0.4039216, 1,
1.502538, -1.449762, 3.427014, 1, 0, 0.3960784, 1,
1.513164, 0.4440939, 1.22203, 1, 0, 0.3882353, 1,
1.525631, 1.579311, 1.749098, 1, 0, 0.3843137, 1,
1.531961, 0.9021977, 0.7322389, 1, 0, 0.3764706, 1,
1.535797, -1.538205, 1.393579, 1, 0, 0.372549, 1,
1.541578, 1.546458, 2.497742, 1, 0, 0.3647059, 1,
1.542917, 1.327448, -0.4897778, 1, 0, 0.3607843, 1,
1.552399, 0.7061006, 1.360741, 1, 0, 0.3529412, 1,
1.553288, 1.543553, 1.528826, 1, 0, 0.3490196, 1,
1.567468, -0.7867302, 3.436141, 1, 0, 0.3411765, 1,
1.581672, -1.529302, 2.375538, 1, 0, 0.3372549, 1,
1.586033, -0.2793456, 2.083363, 1, 0, 0.3294118, 1,
1.587945, -2.470859, 3.299398, 1, 0, 0.3254902, 1,
1.603567, 0.1753779, 1.167309, 1, 0, 0.3176471, 1,
1.615961, 0.7774042, 0.7686585, 1, 0, 0.3137255, 1,
1.621143, 0.8613362, 0.7020071, 1, 0, 0.3058824, 1,
1.650079, 0.2367757, 3.095829, 1, 0, 0.2980392, 1,
1.653334, -1.614803, 1.322358, 1, 0, 0.2941177, 1,
1.66677, -1.578598, 2.024679, 1, 0, 0.2862745, 1,
1.676351, -1.312106, 2.020958, 1, 0, 0.282353, 1,
1.686863, -0.2807044, 2.86977, 1, 0, 0.2745098, 1,
1.717967, 1.143185, 1.842248, 1, 0, 0.2705882, 1,
1.726717, -0.02496673, 1.229638, 1, 0, 0.2627451, 1,
1.738283, -0.7441391, 1.664434, 1, 0, 0.2588235, 1,
1.74037, 1.985454, 0.6637738, 1, 0, 0.2509804, 1,
1.755558, 1.277101, 1.905678, 1, 0, 0.2470588, 1,
1.766672, 0.2907436, 2.408158, 1, 0, 0.2392157, 1,
1.768307, -1.745799, 3.007718, 1, 0, 0.2352941, 1,
1.783747, -0.1371355, 3.094134, 1, 0, 0.227451, 1,
1.791883, -0.03209617, 2.139793, 1, 0, 0.2235294, 1,
1.794367, -0.6919479, 1.821753, 1, 0, 0.2156863, 1,
1.810735, 0.7120733, 1.215935, 1, 0, 0.2117647, 1,
1.814929, -0.3553854, 0.6116726, 1, 0, 0.2039216, 1,
1.824953, 0.1435712, 1.797907, 1, 0, 0.1960784, 1,
1.826077, 1.765829, 0.4600189, 1, 0, 0.1921569, 1,
1.843379, 0.0286312, 2.112167, 1, 0, 0.1843137, 1,
1.916379, -0.7002038, 1.024709, 1, 0, 0.1803922, 1,
1.954041, 0.1168727, 0.7138337, 1, 0, 0.172549, 1,
1.963568, -0.1844213, 1.333935, 1, 0, 0.1686275, 1,
1.973437, 0.05872594, 2.908486, 1, 0, 0.1607843, 1,
1.981683, 1.484553, 2.299318, 1, 0, 0.1568628, 1,
1.998292, 1.124498, 0.7297043, 1, 0, 0.1490196, 1,
2.034144, 0.1908616, 2.823126, 1, 0, 0.145098, 1,
2.037809, -0.09066103, 1.020452, 1, 0, 0.1372549, 1,
2.053725, 1.642986, 1.953919, 1, 0, 0.1333333, 1,
2.060052, -2.103434, 2.778065, 1, 0, 0.1254902, 1,
2.073095, 0.5145115, 1.978534, 1, 0, 0.1215686, 1,
2.099593, 0.6643153, 1.393302, 1, 0, 0.1137255, 1,
2.114854, -0.004909725, -0.2926743, 1, 0, 0.1098039, 1,
2.136741, -0.7316796, 2.126824, 1, 0, 0.1019608, 1,
2.162682, -0.16095, 1.554482, 1, 0, 0.09411765, 1,
2.164254, -0.2199171, 1.085774, 1, 0, 0.09019608, 1,
2.191682, -0.2469816, 3.40278, 1, 0, 0.08235294, 1,
2.19639, 0.6093838, 1.367034, 1, 0, 0.07843138, 1,
2.203707, 1.25032, -0.8713076, 1, 0, 0.07058824, 1,
2.214401, 0.2386929, 0.8911355, 1, 0, 0.06666667, 1,
2.235798, -0.8743858, 1.93283, 1, 0, 0.05882353, 1,
2.240779, 0.225098, 1.044026, 1, 0, 0.05490196, 1,
2.298523, -0.736823, 2.633307, 1, 0, 0.04705882, 1,
2.363575, 0.6394719, 1.208894, 1, 0, 0.04313726, 1,
2.51059, -0.5464431, 0.7032004, 1, 0, 0.03529412, 1,
2.511843, 0.8612089, 1.085913, 1, 0, 0.03137255, 1,
2.516588, 0.009230846, 1.917345, 1, 0, 0.02352941, 1,
2.646011, 1.923367, 1.006038, 1, 0, 0.01960784, 1,
3.023353, 0.3818433, 1.034949, 1, 0, 0.01176471, 1,
3.198963, 1.166098, 0.9171737, 1, 0, 0.007843138, 1
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
0.03945065, -4.559109, -6.647137, 0, -0.5, 0.5, 0.5,
0.03945065, -4.559109, -6.647137, 1, -0.5, 0.5, 0.5,
0.03945065, -4.559109, -6.647137, 1, 1.5, 0.5, 0.5,
0.03945065, -4.559109, -6.647137, 0, 1.5, 0.5, 0.5
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
-4.191136, 0.1966017, -6.647137, 0, -0.5, 0.5, 0.5,
-4.191136, 0.1966017, -6.647137, 1, -0.5, 0.5, 0.5,
-4.191136, 0.1966017, -6.647137, 1, 1.5, 0.5, 0.5,
-4.191136, 0.1966017, -6.647137, 0, 1.5, 0.5, 0.5
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
-4.191136, -4.559109, 0.2671003, 0, -0.5, 0.5, 0.5,
-4.191136, -4.559109, 0.2671003, 1, -0.5, 0.5, 0.5,
-4.191136, -4.559109, 0.2671003, 1, 1.5, 0.5, 0.5,
-4.191136, -4.559109, 0.2671003, 0, 1.5, 0.5, 0.5
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
-3, -3.461637, -5.051544,
3, -3.461637, -5.051544,
-3, -3.461637, -5.051544,
-3, -3.644549, -5.317476,
-2, -3.461637, -5.051544,
-2, -3.644549, -5.317476,
-1, -3.461637, -5.051544,
-1, -3.644549, -5.317476,
0, -3.461637, -5.051544,
0, -3.644549, -5.317476,
1, -3.461637, -5.051544,
1, -3.644549, -5.317476,
2, -3.461637, -5.051544,
2, -3.644549, -5.317476,
3, -3.461637, -5.051544,
3, -3.644549, -5.317476
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
-3, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
-3, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
-3, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
-3, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
-2, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
-2, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
-2, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
-2, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
-1, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
-1, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
-1, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
-1, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
0, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
0, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
0, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
0, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
1, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
1, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
1, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
1, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
2, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
2, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
2, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
2, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5,
3, -4.010373, -5.84934, 0, -0.5, 0.5, 0.5,
3, -4.010373, -5.84934, 1, -0.5, 0.5, 0.5,
3, -4.010373, -5.84934, 1, 1.5, 0.5, 0.5,
3, -4.010373, -5.84934, 0, 1.5, 0.5, 0.5
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
-3.214847, -2, -5.051544,
-3.214847, 2, -5.051544,
-3.214847, -2, -5.051544,
-3.377562, -2, -5.317476,
-3.214847, 0, -5.051544,
-3.377562, 0, -5.317476,
-3.214847, 2, -5.051544,
-3.377562, 2, -5.317476
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
-3.702991, -2, -5.84934, 0, -0.5, 0.5, 0.5,
-3.702991, -2, -5.84934, 1, -0.5, 0.5, 0.5,
-3.702991, -2, -5.84934, 1, 1.5, 0.5, 0.5,
-3.702991, -2, -5.84934, 0, 1.5, 0.5, 0.5,
-3.702991, 0, -5.84934, 0, -0.5, 0.5, 0.5,
-3.702991, 0, -5.84934, 1, -0.5, 0.5, 0.5,
-3.702991, 0, -5.84934, 1, 1.5, 0.5, 0.5,
-3.702991, 0, -5.84934, 0, 1.5, 0.5, 0.5,
-3.702991, 2, -5.84934, 0, -0.5, 0.5, 0.5,
-3.702991, 2, -5.84934, 1, -0.5, 0.5, 0.5,
-3.702991, 2, -5.84934, 1, 1.5, 0.5, 0.5,
-3.702991, 2, -5.84934, 0, 1.5, 0.5, 0.5
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
-3.214847, -3.461637, -4,
-3.214847, -3.461637, 4,
-3.214847, -3.461637, -4,
-3.377562, -3.644549, -4,
-3.214847, -3.461637, -2,
-3.377562, -3.644549, -2,
-3.214847, -3.461637, 0,
-3.377562, -3.644549, 0,
-3.214847, -3.461637, 2,
-3.377562, -3.644549, 2,
-3.214847, -3.461637, 4,
-3.377562, -3.644549, 4
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
-3.702991, -4.010373, -4, 0, -0.5, 0.5, 0.5,
-3.702991, -4.010373, -4, 1, -0.5, 0.5, 0.5,
-3.702991, -4.010373, -4, 1, 1.5, 0.5, 0.5,
-3.702991, -4.010373, -4, 0, 1.5, 0.5, 0.5,
-3.702991, -4.010373, -2, 0, -0.5, 0.5, 0.5,
-3.702991, -4.010373, -2, 1, -0.5, 0.5, 0.5,
-3.702991, -4.010373, -2, 1, 1.5, 0.5, 0.5,
-3.702991, -4.010373, -2, 0, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 0, 0, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 0, 1, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 0, 1, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 0, 0, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 2, 0, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 2, 1, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 2, 1, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 2, 0, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 4, 0, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 4, 1, -0.5, 0.5, 0.5,
-3.702991, -4.010373, 4, 1, 1.5, 0.5, 0.5,
-3.702991, -4.010373, 4, 0, 1.5, 0.5, 0.5
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
-3.214847, -3.461637, -5.051544,
-3.214847, 3.854841, -5.051544,
-3.214847, -3.461637, 5.585744,
-3.214847, 3.854841, 5.585744,
-3.214847, -3.461637, -5.051544,
-3.214847, -3.461637, 5.585744,
-3.214847, 3.854841, -5.051544,
-3.214847, 3.854841, 5.585744,
-3.214847, -3.461637, -5.051544,
3.293748, -3.461637, -5.051544,
-3.214847, -3.461637, 5.585744,
3.293748, -3.461637, 5.585744,
-3.214847, 3.854841, -5.051544,
3.293748, 3.854841, -5.051544,
-3.214847, 3.854841, 5.585744,
3.293748, 3.854841, 5.585744,
3.293748, -3.461637, -5.051544,
3.293748, 3.854841, -5.051544,
3.293748, -3.461637, 5.585744,
3.293748, 3.854841, 5.585744,
3.293748, -3.461637, -5.051544,
3.293748, -3.461637, 5.585744,
3.293748, 3.854841, -5.051544,
3.293748, 3.854841, 5.585744
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
var radius = 7.72049;
var distance = 34.34933;
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
mvMatrix.translate( -0.03945065, -0.1966017, -0.2671003 );
mvMatrix.scale( 1.282542, 1.140924, 0.7847438 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.34933);
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
2-aminobutane_2-buty<-read.table("2-aminobutane_2-buty.xyz", skip=1)
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
-3.120061, -1.323585, -1.867733, 0, 0, 1, 1, 1,
-2.783445, 0.3940307, 0.3957014, 1, 0, 0, 1, 1,
-2.778476, 0.2491256, -1.641271, 1, 0, 0, 1, 1,
-2.574358, -1.265296, -1.659121, 1, 0, 0, 1, 1,
-2.534013, 0.4011893, -3.887702, 1, 0, 0, 1, 1,
-2.442046, -0.7102988, -3.779952, 1, 0, 0, 1, 1,
-2.441126, 0.2720745, -0.4404182, 0, 0, 0, 1, 1,
-2.434028, -1.595208, -1.075974, 0, 0, 0, 1, 1,
-2.423584, 0.5925409, -1.086084, 0, 0, 0, 1, 1,
-2.420999, -1.31094, -2.267298, 0, 0, 0, 1, 1,
-2.368226, -1.567502, -2.586355, 0, 0, 0, 1, 1,
-2.363709, -0.6883847, -1.577443, 0, 0, 0, 1, 1,
-2.36235, 1.324346, -0.4659061, 0, 0, 0, 1, 1,
-2.346693, 1.092857, 0.4571951, 1, 1, 1, 1, 1,
-2.322335, -0.4224662, -1.518278, 1, 1, 1, 1, 1,
-2.245711, 0.1474408, -0.5199567, 1, 1, 1, 1, 1,
-2.24502, -0.8229032, -0.633206, 1, 1, 1, 1, 1,
-2.214791, -0.8633595, -1.4503, 1, 1, 1, 1, 1,
-2.210858, -1.179085, -2.575473, 1, 1, 1, 1, 1,
-2.182701, 0.3501748, -1.276074, 1, 1, 1, 1, 1,
-2.120581, -0.7463903, -1.597285, 1, 1, 1, 1, 1,
-2.084042, 0.3220952, -1.101204, 1, 1, 1, 1, 1,
-2.072183, -1.272075, -2.052575, 1, 1, 1, 1, 1,
-2.03348, -0.583881, -1.117125, 1, 1, 1, 1, 1,
-2.016802, 0.08601279, -0.7015838, 1, 1, 1, 1, 1,
-2.011857, 0.6551819, -0.1612024, 1, 1, 1, 1, 1,
-1.992266, 0.2849479, -2.433165, 1, 1, 1, 1, 1,
-1.976644, -0.9485092, -0.1077042, 1, 1, 1, 1, 1,
-1.952422, -0.6982811, -2.074113, 0, 0, 1, 1, 1,
-1.933438, -0.6423975, -1.926248, 1, 0, 0, 1, 1,
-1.902966, 1.013523, 0.1081512, 1, 0, 0, 1, 1,
-1.872159, -1.28253, -3.327625, 1, 0, 0, 1, 1,
-1.862164, -0.3705938, -1.683166, 1, 0, 0, 1, 1,
-1.848608, 0.4895419, -1.754167, 1, 0, 0, 1, 1,
-1.831705, -1.000203, -2.484148, 0, 0, 0, 1, 1,
-1.805005, -0.1225928, -2.499403, 0, 0, 0, 1, 1,
-1.798163, 0.5171487, -2.449147, 0, 0, 0, 1, 1,
-1.791331, -0.6188455, -0.5731503, 0, 0, 0, 1, 1,
-1.785292, -0.1076284, -1.736582, 0, 0, 0, 1, 1,
-1.779434, -0.9240285, -1.270865, 0, 0, 0, 1, 1,
-1.77058, -0.662445, -3.523341, 0, 0, 0, 1, 1,
-1.76935, 1.013319, -1.084722, 1, 1, 1, 1, 1,
-1.733184, -0.7018397, -3.889355, 1, 1, 1, 1, 1,
-1.727502, -0.249553, -1.102737, 1, 1, 1, 1, 1,
-1.700567, 1.221098, -0.04694117, 1, 1, 1, 1, 1,
-1.692624, -1.114869, -0.628012, 1, 1, 1, 1, 1,
-1.692334, 0.06675319, -3.116194, 1, 1, 1, 1, 1,
-1.682812, -0.07470565, -0.8030638, 1, 1, 1, 1, 1,
-1.655485, 0.7987327, 0.4110682, 1, 1, 1, 1, 1,
-1.641155, -0.4364137, -1.7313, 1, 1, 1, 1, 1,
-1.639333, 1.342341, -0.7667368, 1, 1, 1, 1, 1,
-1.633636, -0.114723, -0.9156135, 1, 1, 1, 1, 1,
-1.633019, 0.01491002, -1.24558, 1, 1, 1, 1, 1,
-1.625906, -0.05218664, -2.232743, 1, 1, 1, 1, 1,
-1.591562, 0.8969529, -1.31779, 1, 1, 1, 1, 1,
-1.587369, 0.4428948, -1.792742, 1, 1, 1, 1, 1,
-1.578805, -0.6961064, -3.065938, 0, 0, 1, 1, 1,
-1.568557, -0.004179855, -1.464822, 1, 0, 0, 1, 1,
-1.568547, 1.77891, -0.7641262, 1, 0, 0, 1, 1,
-1.565833, -0.4885165, -0.2758085, 1, 0, 0, 1, 1,
-1.56066, -0.2206511, -1.644556, 1, 0, 0, 1, 1,
-1.550139, -1.565622, -1.036107, 1, 0, 0, 1, 1,
-1.54437, -0.3810327, -1.692405, 0, 0, 0, 1, 1,
-1.542688, -0.05794069, -0.3946007, 0, 0, 0, 1, 1,
-1.539011, -0.02734082, -1.091284, 0, 0, 0, 1, 1,
-1.538013, -0.6797231, -1.823877, 0, 0, 0, 1, 1,
-1.509409, 1.885092, -0.9840491, 0, 0, 0, 1, 1,
-1.508292, 1.07923, 0.09079823, 0, 0, 0, 1, 1,
-1.492994, -1.136733, -2.12134, 0, 0, 0, 1, 1,
-1.491813, -1.294586, -1.35753, 1, 1, 1, 1, 1,
-1.488483, 0.4173668, -1.506275, 1, 1, 1, 1, 1,
-1.452798, 1.158475, -0.2439497, 1, 1, 1, 1, 1,
-1.43678, 1.137958, -0.9878302, 1, 1, 1, 1, 1,
-1.435042, 1.82913, -0.8244025, 1, 1, 1, 1, 1,
-1.426243, -0.4567012, -4.896632, 1, 1, 1, 1, 1,
-1.422267, 1.5766, -0.4674845, 1, 1, 1, 1, 1,
-1.421369, -1.550995, -1.789541, 1, 1, 1, 1, 1,
-1.414728, -0.9486718, -1.77611, 1, 1, 1, 1, 1,
-1.387435, -1.1489, -2.541672, 1, 1, 1, 1, 1,
-1.386638, -1.126385, -1.089621, 1, 1, 1, 1, 1,
-1.38424, 1.533325, -0.748651, 1, 1, 1, 1, 1,
-1.383684, -0.3204439, -0.007641804, 1, 1, 1, 1, 1,
-1.382126, -0.77908, -1.152337, 1, 1, 1, 1, 1,
-1.378797, -0.07726107, -0.7926444, 1, 1, 1, 1, 1,
-1.37819, 0.88378, -2.291706, 0, 0, 1, 1, 1,
-1.344032, 1.691132, -0.3924262, 1, 0, 0, 1, 1,
-1.33948, -0.5214693, -2.173985, 1, 0, 0, 1, 1,
-1.338574, 0.3860521, -2.368809, 1, 0, 0, 1, 1,
-1.324955, -0.06552538, -0.5448946, 1, 0, 0, 1, 1,
-1.324537, -0.8815669, -0.9667101, 1, 0, 0, 1, 1,
-1.316739, 0.03420208, -3.228183, 0, 0, 0, 1, 1,
-1.315396, 0.7224708, -0.5081058, 0, 0, 0, 1, 1,
-1.307304, 1.504615, -2.457505, 0, 0, 0, 1, 1,
-1.303318, 0.3532383, -2.966527, 0, 0, 0, 1, 1,
-1.292896, -0.5377935, -2.372189, 0, 0, 0, 1, 1,
-1.288379, -2.936739, -3.301409, 0, 0, 0, 1, 1,
-1.284891, -1.136139, -2.088491, 0, 0, 0, 1, 1,
-1.273125, 0.9314385, -1.315656, 1, 1, 1, 1, 1,
-1.269882, -0.882763, -2.632147, 1, 1, 1, 1, 1,
-1.269432, 1.552683, -0.7327819, 1, 1, 1, 1, 1,
-1.266833, -0.7238848, -2.979338, 1, 1, 1, 1, 1,
-1.265383, -0.08505654, -1.743004, 1, 1, 1, 1, 1,
-1.252706, -0.3297613, -1.122614, 1, 1, 1, 1, 1,
-1.25141, -0.6504791, -0.8883619, 1, 1, 1, 1, 1,
-1.250516, -0.7099546, -1.533697, 1, 1, 1, 1, 1,
-1.250109, -0.1356654, -1.261957, 1, 1, 1, 1, 1,
-1.245138, -1.131774, -0.5702494, 1, 1, 1, 1, 1,
-1.236116, 0.1955941, -0.4964625, 1, 1, 1, 1, 1,
-1.230906, 0.5395499, 0.9010804, 1, 1, 1, 1, 1,
-1.230305, -0.4577188, -2.567795, 1, 1, 1, 1, 1,
-1.229373, -1.429432, -1.930659, 1, 1, 1, 1, 1,
-1.224892, 0.7646338, -0.0975828, 1, 1, 1, 1, 1,
-1.224256, -0.7320558, -2.194185, 0, 0, 1, 1, 1,
-1.22294, 0.257646, 0.5144766, 1, 0, 0, 1, 1,
-1.217044, -0.1803353, -2.459032, 1, 0, 0, 1, 1,
-1.215347, -0.1562589, -1.447202, 1, 0, 0, 1, 1,
-1.199866, 1.758898, 0.9941209, 1, 0, 0, 1, 1,
-1.194593, 0.1241045, -1.271873, 1, 0, 0, 1, 1,
-1.189354, -0.1274654, -0.3810678, 0, 0, 0, 1, 1,
-1.186016, 0.5752958, -1.321676, 0, 0, 0, 1, 1,
-1.179435, -0.8984944, -2.410329, 0, 0, 0, 1, 1,
-1.178809, 0.2752244, -1.352726, 0, 0, 0, 1, 1,
-1.175221, -0.2744535, -2.025586, 0, 0, 0, 1, 1,
-1.171829, 0.8119264, -1.285501, 0, 0, 0, 1, 1,
-1.161215, 1.638758, -0.8316305, 0, 0, 0, 1, 1,
-1.158524, 0.05253306, -1.82329, 1, 1, 1, 1, 1,
-1.155564, -0.1904355, -0.9528435, 1, 1, 1, 1, 1,
-1.144289, 0.4205501, 0.2809883, 1, 1, 1, 1, 1,
-1.143504, -0.7255795, -2.892068, 1, 1, 1, 1, 1,
-1.143065, 0.7569225, -1.892343, 1, 1, 1, 1, 1,
-1.142303, 0.009182375, -4.140602, 1, 1, 1, 1, 1,
-1.141355, -1.126036, -1.239091, 1, 1, 1, 1, 1,
-1.1382, 1.458745, 1.768483, 1, 1, 1, 1, 1,
-1.133501, 2.580955, 1.056462, 1, 1, 1, 1, 1,
-1.13294, 2.588257, -2.324561, 1, 1, 1, 1, 1,
-1.126826, -1.381906, -2.549247, 1, 1, 1, 1, 1,
-1.12676, 0.1779215, -1.149658, 1, 1, 1, 1, 1,
-1.123258, 0.9724026, -2.970479, 1, 1, 1, 1, 1,
-1.119583, -0.6086828, -1.459644, 1, 1, 1, 1, 1,
-1.111316, 0.4314485, -1.413244, 1, 1, 1, 1, 1,
-1.111311, -1.391695, -1.780543, 0, 0, 1, 1, 1,
-1.10808, -0.2584674, -1.679111, 1, 0, 0, 1, 1,
-1.101155, 1.649448, 0.8797606, 1, 0, 0, 1, 1,
-1.094686, -1.003908, -3.582802, 1, 0, 0, 1, 1,
-1.093585, 0.1553302, -2.517672, 1, 0, 0, 1, 1,
-1.089664, -0.2716785, -1.001958, 1, 0, 0, 1, 1,
-1.076488, 1.743601, -0.3167953, 0, 0, 0, 1, 1,
-1.071822, -1.046834, -1.674683, 0, 0, 0, 1, 1,
-1.071178, 0.5080653, -1.045777, 0, 0, 0, 1, 1,
-1.067518, 0.03820315, -2.243435, 0, 0, 0, 1, 1,
-1.065076, -0.5344059, -0.7869615, 0, 0, 0, 1, 1,
-1.06211, -1.187476, -3.30063, 0, 0, 0, 1, 1,
-1.05941, -1.232752, -2.650041, 0, 0, 0, 1, 1,
-1.049258, -1.211816, -2.035113, 1, 1, 1, 1, 1,
-1.043407, -0.6905863, -2.244809, 1, 1, 1, 1, 1,
-1.04231, -0.5129483, -0.6689916, 1, 1, 1, 1, 1,
-1.034134, -0.7228561, -0.8222196, 1, 1, 1, 1, 1,
-1.033039, -0.6678976, -2.937614, 1, 1, 1, 1, 1,
-1.031171, -0.1325479, -3.266847, 1, 1, 1, 1, 1,
-1.031003, -0.6777359, -1.682485, 1, 1, 1, 1, 1,
-1.023983, 0.2395603, -1.221657, 1, 1, 1, 1, 1,
-1.015492, 0.4195922, -0.1430191, 1, 1, 1, 1, 1,
-1.007342, 0.2927409, -1.90604, 1, 1, 1, 1, 1,
-1.00513, 0.0310294, -0.2591136, 1, 1, 1, 1, 1,
-1.005015, 1.516555, 0.8874144, 1, 1, 1, 1, 1,
-1.001407, 2.836871, 1.968077, 1, 1, 1, 1, 1,
-0.9996322, -0.3558946, -2.614569, 1, 1, 1, 1, 1,
-0.9985961, 1.17094, 0.7077082, 1, 1, 1, 1, 1,
-0.9973286, -2.362197, -4.030646, 0, 0, 1, 1, 1,
-0.996666, 0.3720809, -2.136899, 1, 0, 0, 1, 1,
-0.9944314, 0.7311938, -1.557678, 1, 0, 0, 1, 1,
-0.9932956, 1.258201, -2.132735, 1, 0, 0, 1, 1,
-0.9890546, -1.596511, -1.97808, 1, 0, 0, 1, 1,
-0.9839332, -0.2141538, -0.6090893, 1, 0, 0, 1, 1,
-0.9760382, 0.05750933, -1.335281, 0, 0, 0, 1, 1,
-0.9743271, 0.4321797, -0.5734036, 0, 0, 0, 1, 1,
-0.9633253, -0.5453497, -2.455919, 0, 0, 0, 1, 1,
-0.9623294, -0.4555115, -2.17516, 0, 0, 0, 1, 1,
-0.9601152, 0.5139986, -1.581704, 0, 0, 0, 1, 1,
-0.9597336, -0.7560195, -2.009789, 0, 0, 0, 1, 1,
-0.9559415, 0.5182886, -2.166088, 0, 0, 0, 1, 1,
-0.9528889, 1.408784, 0.8748956, 1, 1, 1, 1, 1,
-0.9528486, 0.5658298, -0.7956765, 1, 1, 1, 1, 1,
-0.9511811, -1.824797, -0.66032, 1, 1, 1, 1, 1,
-0.9468917, -1.177611, -3.915145, 1, 1, 1, 1, 1,
-0.9457917, -0.4016218, -2.686085, 1, 1, 1, 1, 1,
-0.9440165, -1.039242, -3.35306, 1, 1, 1, 1, 1,
-0.9390391, 0.4805817, 0.2909453, 1, 1, 1, 1, 1,
-0.9389917, 1.164064, 1.128563, 1, 1, 1, 1, 1,
-0.9064349, -0.6170903, -2.631932, 1, 1, 1, 1, 1,
-0.9064071, 0.01199423, -3.120633, 1, 1, 1, 1, 1,
-0.9012824, 0.3707034, -1.618285, 1, 1, 1, 1, 1,
-0.8901886, 0.3695789, -1.437049, 1, 1, 1, 1, 1,
-0.888005, -0.06878309, -2.186588, 1, 1, 1, 1, 1,
-0.8849339, 2.560863, -0.4007804, 1, 1, 1, 1, 1,
-0.8773829, 1.549852, -1.092407, 1, 1, 1, 1, 1,
-0.8731395, -0.3354349, -0.9526659, 0, 0, 1, 1, 1,
-0.859755, 0.4876925, -1.322054, 1, 0, 0, 1, 1,
-0.8595528, -1.250197, -2.823341, 1, 0, 0, 1, 1,
-0.8588347, 0.1710403, -0.7354347, 1, 0, 0, 1, 1,
-0.8556748, 0.7557507, -0.8579581, 1, 0, 0, 1, 1,
-0.8519494, -1.270483, -2.277921, 1, 0, 0, 1, 1,
-0.8503585, -0.3329104, -3.394352, 0, 0, 0, 1, 1,
-0.8493879, -0.2284933, -1.678964, 0, 0, 0, 1, 1,
-0.8448242, 0.09258986, 0.08573531, 0, 0, 0, 1, 1,
-0.8403937, -0.2357005, -2.908157, 0, 0, 0, 1, 1,
-0.8382543, -1.010089, -1.725785, 0, 0, 0, 1, 1,
-0.833662, -0.432243, -3.501705, 0, 0, 0, 1, 1,
-0.8325246, 0.2946312, -0.3593675, 0, 0, 0, 1, 1,
-0.8325221, -1.03353, -2.817933, 1, 1, 1, 1, 1,
-0.8321166, 1.11239, 0.7914355, 1, 1, 1, 1, 1,
-0.8296665, 1.262452, -1.119704, 1, 1, 1, 1, 1,
-0.8259386, -1.499965, -2.798318, 1, 1, 1, 1, 1,
-0.8257537, -0.9040573, -3.330852, 1, 1, 1, 1, 1,
-0.8256603, 0.7419336, -1.371951, 1, 1, 1, 1, 1,
-0.8230165, 0.352068, -0.3174977, 1, 1, 1, 1, 1,
-0.8225398, -0.3685418, 0.3402722, 1, 1, 1, 1, 1,
-0.8149372, -0.8772515, -2.42247, 1, 1, 1, 1, 1,
-0.8137239, -1.291173, -2.408804, 1, 1, 1, 1, 1,
-0.8071437, -1.320979, -2.086619, 1, 1, 1, 1, 1,
-0.7989869, -0.04335893, -2.556618, 1, 1, 1, 1, 1,
-0.7915115, -1.530233, -3.076092, 1, 1, 1, 1, 1,
-0.789008, -1.323132, -3.373155, 1, 1, 1, 1, 1,
-0.7870514, -0.6049649, -2.695308, 1, 1, 1, 1, 1,
-0.7854336, 0.1440689, -1.634241, 0, 0, 1, 1, 1,
-0.7831914, -0.3357589, -2.0345, 1, 0, 0, 1, 1,
-0.7710337, 0.8046436, -1.557224, 1, 0, 0, 1, 1,
-0.7681236, -0.6649163, -3.410468, 1, 0, 0, 1, 1,
-0.7664288, -1.260615, -1.641936, 1, 0, 0, 1, 1,
-0.7635462, -0.8455058, -3.534961, 1, 0, 0, 1, 1,
-0.7615129, 0.6999316, -0.6771935, 0, 0, 0, 1, 1,
-0.7610782, 0.5669449, -0.8501976, 0, 0, 0, 1, 1,
-0.7608379, -1.483491, -2.654993, 0, 0, 0, 1, 1,
-0.7540144, 1.056489, -2.26565, 0, 0, 0, 1, 1,
-0.7520443, -0.4188415, -2.67063, 0, 0, 0, 1, 1,
-0.7497714, -1.524415, -1.17829, 0, 0, 0, 1, 1,
-0.7479232, -0.5213736, -0.9851789, 0, 0, 0, 1, 1,
-0.7414035, 0.2137779, -2.325752, 1, 1, 1, 1, 1,
-0.7395691, -1.718892, -3.170175, 1, 1, 1, 1, 1,
-0.7377153, -0.1466903, -1.174823, 1, 1, 1, 1, 1,
-0.7360786, -0.3037926, -0.4985226, 1, 1, 1, 1, 1,
-0.7321422, 1.288834, -0.00962575, 1, 1, 1, 1, 1,
-0.7245503, -1.008417, -3.17845, 1, 1, 1, 1, 1,
-0.7244858, 1.107323, -0.1708581, 1, 1, 1, 1, 1,
-0.7243389, 0.2875749, -0.6542022, 1, 1, 1, 1, 1,
-0.7182575, 0.3249981, 0.7146407, 1, 1, 1, 1, 1,
-0.716834, 0.7986112, -2.726946, 1, 1, 1, 1, 1,
-0.7167768, 1.892663, -0.4264916, 1, 1, 1, 1, 1,
-0.7122056, -0.9610575, -3.170902, 1, 1, 1, 1, 1,
-0.7068309, -0.8337178, -3.794591, 1, 1, 1, 1, 1,
-0.7058814, 0.9821836, -0.521852, 1, 1, 1, 1, 1,
-0.7026115, -0.1444349, -0.4387276, 1, 1, 1, 1, 1,
-0.7014484, 1.481626, 0.163181, 0, 0, 1, 1, 1,
-0.7013388, 1.423096, -0.7694582, 1, 0, 0, 1, 1,
-0.6980626, -0.2842743, -0.9227268, 1, 0, 0, 1, 1,
-0.6963021, 1.189273, 0.5288355, 1, 0, 0, 1, 1,
-0.6933338, -0.3471486, -2.346899, 1, 0, 0, 1, 1,
-0.6903654, -1.799959, -1.768399, 1, 0, 0, 1, 1,
-0.6864539, 0.02561874, -0.2947592, 0, 0, 0, 1, 1,
-0.6861178, 3.74829, -0.1874137, 0, 0, 0, 1, 1,
-0.6857921, -0.9705147, -1.799489, 0, 0, 0, 1, 1,
-0.6824451, 0.7741445, -1.042862, 0, 0, 0, 1, 1,
-0.6814374, -0.4136847, -3.388682, 0, 0, 0, 1, 1,
-0.669496, -1.022939, -0.7562371, 0, 0, 0, 1, 1,
-0.6669986, -0.5825679, -1.567617, 0, 0, 0, 1, 1,
-0.6659749, 0.3613507, -1.144188, 1, 1, 1, 1, 1,
-0.6615993, -1.063964, -1.652714, 1, 1, 1, 1, 1,
-0.6601675, 0.03223792, -2.218923, 1, 1, 1, 1, 1,
-0.652833, -0.8919945, -1.998001, 1, 1, 1, 1, 1,
-0.6491454, -0.3535155, -0.8676308, 1, 1, 1, 1, 1,
-0.6475724, 0.07258365, -1.332492, 1, 1, 1, 1, 1,
-0.6452056, -0.8416515, -4.493868, 1, 1, 1, 1, 1,
-0.6449714, -0.9106488, -0.06099798, 1, 1, 1, 1, 1,
-0.6406348, -1.382713, -2.791223, 1, 1, 1, 1, 1,
-0.6363353, 0.6411294, -0.02923628, 1, 1, 1, 1, 1,
-0.631968, -0.3818361, -2.118809, 1, 1, 1, 1, 1,
-0.6292405, -0.6574764, -0.5835181, 1, 1, 1, 1, 1,
-0.6277429, -0.660148, -1.849374, 1, 1, 1, 1, 1,
-0.624627, -0.3784369, -2.821805, 1, 1, 1, 1, 1,
-0.6211281, 0.5092489, -0.3810154, 1, 1, 1, 1, 1,
-0.6197906, -0.886691, -1.464566, 0, 0, 1, 1, 1,
-0.6197011, -0.04031337, -2.465042, 1, 0, 0, 1, 1,
-0.6112157, 1.297593, 2.323416, 1, 0, 0, 1, 1,
-0.6058225, 0.1314797, -2.560853, 1, 0, 0, 1, 1,
-0.6038421, 0.3979619, -1.23289, 1, 0, 0, 1, 1,
-0.6036696, 1.344581, 1.050629, 1, 0, 0, 1, 1,
-0.6035951, -1.214471, -2.883956, 0, 0, 0, 1, 1,
-0.6027198, -1.395964, -2.789647, 0, 0, 0, 1, 1,
-0.6025276, -0.424309, -1.328162, 0, 0, 0, 1, 1,
-0.5881581, -0.5873712, -2.920093, 0, 0, 0, 1, 1,
-0.5869619, 1.128295, -1.094322, 0, 0, 0, 1, 1,
-0.5829674, 0.05206971, -3.13245, 0, 0, 0, 1, 1,
-0.5826366, 1.224523, 1.162246, 0, 0, 0, 1, 1,
-0.5821111, -0.1128761, 0.4827174, 1, 1, 1, 1, 1,
-0.5808833, -0.9547219, -3.263322, 1, 1, 1, 1, 1,
-0.5796611, -0.3367666, -2.048825, 1, 1, 1, 1, 1,
-0.5775214, -1.712647, -2.81561, 1, 1, 1, 1, 1,
-0.5758284, -1.090593, -2.126941, 1, 1, 1, 1, 1,
-0.5748202, 0.4015134, 1.154664, 1, 1, 1, 1, 1,
-0.5740405, 0.364027, -0.8944235, 1, 1, 1, 1, 1,
-0.5726817, 0.07030009, -0.8396955, 1, 1, 1, 1, 1,
-0.5676069, 0.106646, -2.518825, 1, 1, 1, 1, 1,
-0.5670774, -0.5050959, -2.537085, 1, 1, 1, 1, 1,
-0.5610609, 0.6610669, -0.270597, 1, 1, 1, 1, 1,
-0.5597112, 1.514932, 1.463427, 1, 1, 1, 1, 1,
-0.5531808, -0.5066761, -0.2251536, 1, 1, 1, 1, 1,
-0.5526339, 0.1899282, -0.07915786, 1, 1, 1, 1, 1,
-0.5518509, 1.226609, 0.1770077, 1, 1, 1, 1, 1,
-0.5501674, 1.376049, 0.1692223, 0, 0, 1, 1, 1,
-0.5498925, 0.6112809, 1.175174, 1, 0, 0, 1, 1,
-0.5493549, 1.044374, -0.7691907, 1, 0, 0, 1, 1,
-0.5459707, 0.2145759, -2.41943, 1, 0, 0, 1, 1,
-0.5397815, -1.058167, -3.701468, 1, 0, 0, 1, 1,
-0.5351911, -0.8437437, -1.241413, 1, 0, 0, 1, 1,
-0.5348661, 0.2542187, 0.1320916, 0, 0, 0, 1, 1,
-0.5347687, 1.487466, -0.8699878, 0, 0, 0, 1, 1,
-0.525467, 0.7204953, -1.365289, 0, 0, 0, 1, 1,
-0.5203424, 0.2663857, 1.940621, 0, 0, 0, 1, 1,
-0.5191817, -0.8022563, 0.2811327, 0, 0, 0, 1, 1,
-0.5184286, -0.01472567, -0.7673878, 0, 0, 0, 1, 1,
-0.5149612, -0.09042272, -3.220029, 0, 0, 0, 1, 1,
-0.5094578, -0.2802317, -3.838183, 1, 1, 1, 1, 1,
-0.5091168, 2.40705, 0.3771032, 1, 1, 1, 1, 1,
-0.5075972, 0.6022455, -2.390983, 1, 1, 1, 1, 1,
-0.507001, -1.532762, -2.992448, 1, 1, 1, 1, 1,
-0.506634, -0.3161486, -2.644272, 1, 1, 1, 1, 1,
-0.5036581, -0.3597026, -1.547061, 1, 1, 1, 1, 1,
-0.4992607, -0.6284956, -1.895095, 1, 1, 1, 1, 1,
-0.4916913, 0.6434069, -1.87166, 1, 1, 1, 1, 1,
-0.4851173, 0.3281507, -0.5632964, 1, 1, 1, 1, 1,
-0.4837136, -1.060046, -3.61429, 1, 1, 1, 1, 1,
-0.4814375, -0.09469524, -1.369002, 1, 1, 1, 1, 1,
-0.4810435, -1.815704, -4.810428, 1, 1, 1, 1, 1,
-0.4806184, -0.5919698, -2.569814, 1, 1, 1, 1, 1,
-0.4805107, 1.542351, 1.319705, 1, 1, 1, 1, 1,
-0.480031, -0.3589904, -2.070183, 1, 1, 1, 1, 1,
-0.478479, 0.1967488, -0.7677486, 0, 0, 1, 1, 1,
-0.4753948, -0.52375, -0.4169453, 1, 0, 0, 1, 1,
-0.4652036, 1.507988, 0.6737525, 1, 0, 0, 1, 1,
-0.4636871, -0.379585, -0.9718869, 1, 0, 0, 1, 1,
-0.4591712, -0.3269601, -3.802701, 1, 0, 0, 1, 1,
-0.4586408, 1.209867, -1.274222, 1, 0, 0, 1, 1,
-0.4572675, 1.455682, 0.5164047, 0, 0, 0, 1, 1,
-0.4567957, -1.337446, -2.760721, 0, 0, 0, 1, 1,
-0.4557403, -0.7167752, -2.821124, 0, 0, 0, 1, 1,
-0.4541976, -0.7650355, -2.184263, 0, 0, 0, 1, 1,
-0.4431275, -3.355086, -1.938406, 0, 0, 0, 1, 1,
-0.4429063, 0.5453001, -0.231593, 0, 0, 0, 1, 1,
-0.4384072, -0.3541182, -1.629778, 0, 0, 0, 1, 1,
-0.4301896, 0.5367605, 0.6070515, 1, 1, 1, 1, 1,
-0.4280382, 1.535958, -1.389634, 1, 1, 1, 1, 1,
-0.4241842, -0.7327375, -1.053932, 1, 1, 1, 1, 1,
-0.4198651, 0.1773111, -1.747951, 1, 1, 1, 1, 1,
-0.4192872, 0.7730815, -0.3249325, 1, 1, 1, 1, 1,
-0.4144955, 0.2785513, -1.394541, 1, 1, 1, 1, 1,
-0.4085982, 0.8504071, -0.5097266, 1, 1, 1, 1, 1,
-0.4082114, 0.3008191, -1.751396, 1, 1, 1, 1, 1,
-0.4065864, -0.0298787, -1.701657, 1, 1, 1, 1, 1,
-0.4058746, -0.002644549, -2.059382, 1, 1, 1, 1, 1,
-0.404381, 1.067408, -0.09703917, 1, 1, 1, 1, 1,
-0.4034972, -0.1803484, -0.223368, 1, 1, 1, 1, 1,
-0.4028055, -1.361719, -3.715143, 1, 1, 1, 1, 1,
-0.4022911, 1.839758, -1.353948, 1, 1, 1, 1, 1,
-0.3944485, 1.425247, -0.5790783, 1, 1, 1, 1, 1,
-0.3927152, 0.6399426, -1.706268, 0, 0, 1, 1, 1,
-0.3867105, 0.1984636, -1.445298, 1, 0, 0, 1, 1,
-0.3857529, -0.2263164, -2.9446, 1, 0, 0, 1, 1,
-0.3797903, 0.7649632, -0.7678691, 1, 0, 0, 1, 1,
-0.3790548, -0.5282651, -3.102091, 1, 0, 0, 1, 1,
-0.3788344, 1.944949, -0.9094024, 1, 0, 0, 1, 1,
-0.3723171, 0.9912418, 0.2098107, 0, 0, 0, 1, 1,
-0.3715778, 0.2135917, -1.260471, 0, 0, 0, 1, 1,
-0.3693827, -0.253532, -2.304187, 0, 0, 0, 1, 1,
-0.3690738, -0.6019121, -2.235334, 0, 0, 0, 1, 1,
-0.3659098, -0.9131407, -2.84562, 0, 0, 0, 1, 1,
-0.3613349, -0.8201582, -3.383273, 0, 0, 0, 1, 1,
-0.360344, 0.6622913, 0.1196375, 0, 0, 0, 1, 1,
-0.3545341, 0.9487156, 0.2796534, 1, 1, 1, 1, 1,
-0.3395503, 1.657011, -1.379766, 1, 1, 1, 1, 1,
-0.3384106, 0.9874386, -0.8820529, 1, 1, 1, 1, 1,
-0.3371575, 0.1689179, -1.310664, 1, 1, 1, 1, 1,
-0.331542, -0.6406352, -1.64018, 1, 1, 1, 1, 1,
-0.328054, 3.123338, -1.075819, 1, 1, 1, 1, 1,
-0.3202583, -1.903854, -1.100571, 1, 1, 1, 1, 1,
-0.3179104, -0.7892731, -2.186397, 1, 1, 1, 1, 1,
-0.3170283, -0.03231985, -0.627107, 1, 1, 1, 1, 1,
-0.3080509, 0.3209401, 1.332105, 1, 1, 1, 1, 1,
-0.3077338, 0.529764, -0.7876187, 1, 1, 1, 1, 1,
-0.3051477, -0.3912417, -0.6028289, 1, 1, 1, 1, 1,
-0.301696, -0.4124427, -1.73446, 1, 1, 1, 1, 1,
-0.2994869, -0.1618647, -2.463843, 1, 1, 1, 1, 1,
-0.2994853, 0.5101776, 0.5107769, 1, 1, 1, 1, 1,
-0.2989759, -0.9211777, -3.125711, 0, 0, 1, 1, 1,
-0.2963353, 0.7741929, -0.8114836, 1, 0, 0, 1, 1,
-0.2928451, -0.2718674, -2.253834, 1, 0, 0, 1, 1,
-0.2920015, -1.055217, -3.096626, 1, 0, 0, 1, 1,
-0.2918509, -0.4220573, -3.495765, 1, 0, 0, 1, 1,
-0.2778079, -0.5096207, -2.950685, 1, 0, 0, 1, 1,
-0.2759072, -0.2943853, -2.956377, 0, 0, 0, 1, 1,
-0.2750578, 0.251548, -1.760432, 0, 0, 0, 1, 1,
-0.2735893, 0.2526926, -0.3162644, 0, 0, 0, 1, 1,
-0.2701597, -0.2161219, -1.903486, 0, 0, 0, 1, 1,
-0.2636056, 1.587548, -0.743286, 0, 0, 0, 1, 1,
-0.2624929, 0.6606413, -0.4993341, 0, 0, 0, 1, 1,
-0.2603321, 0.6278424, 0.1593007, 0, 0, 0, 1, 1,
-0.2507605, 0.4296652, -1.05433, 1, 1, 1, 1, 1,
-0.2501732, -0.5382445, -2.802067, 1, 1, 1, 1, 1,
-0.2464973, 0.5070701, 0.3843535, 1, 1, 1, 1, 1,
-0.2462032, 0.3089552, -0.2038655, 1, 1, 1, 1, 1,
-0.2461192, 0.7109842, -0.8828437, 1, 1, 1, 1, 1,
-0.2459803, 0.06015204, 0.4052427, 1, 1, 1, 1, 1,
-0.2444673, -0.3177556, -0.8592242, 1, 1, 1, 1, 1,
-0.2443004, -0.7789841, -4.124357, 1, 1, 1, 1, 1,
-0.2442343, -0.9934054, -1.596529, 1, 1, 1, 1, 1,
-0.2437104, 0.7253907, -2.2525, 1, 1, 1, 1, 1,
-0.2404616, 1.222203, 0.8484272, 1, 1, 1, 1, 1,
-0.2403943, 1.859769, -0.4715104, 1, 1, 1, 1, 1,
-0.2385224, 1.045496, -1.371212, 1, 1, 1, 1, 1,
-0.2367277, 0.9947809, 1.738998, 1, 1, 1, 1, 1,
-0.2365283, -0.3252506, -1.489854, 1, 1, 1, 1, 1,
-0.2332141, 1.613554, 0.9904631, 0, 0, 1, 1, 1,
-0.2320398, -0.128778, -2.633293, 1, 0, 0, 1, 1,
-0.2219157, -0.6381222, -1.61026, 1, 0, 0, 1, 1,
-0.2130495, -0.1044764, -2.479709, 1, 0, 0, 1, 1,
-0.2095355, -0.8551078, -1.484899, 1, 0, 0, 1, 1,
-0.2028191, -0.0480766, -2.632597, 1, 0, 0, 1, 1,
-0.2013495, -1.376741, -1.024324, 0, 0, 0, 1, 1,
-0.2013298, -0.2849519, -4.390733, 0, 0, 0, 1, 1,
-0.2006286, -0.2167432, -3.296023, 0, 0, 0, 1, 1,
-0.1992437, 0.9526554, 2.26493, 0, 0, 0, 1, 1,
-0.194661, 1.629025, -0.7822747, 0, 0, 0, 1, 1,
-0.1932875, 0.02094471, -1.649682, 0, 0, 0, 1, 1,
-0.193253, -0.7273868, -0.584792, 0, 0, 0, 1, 1,
-0.1902084, -0.1971055, -2.881026, 1, 1, 1, 1, 1,
-0.1887026, 1.121707, -0.7783717, 1, 1, 1, 1, 1,
-0.1859031, 1.292818, -2.072183, 1, 1, 1, 1, 1,
-0.1845853, 0.6782238, -2.100003, 1, 1, 1, 1, 1,
-0.1835544, 0.6747212, -0.4774209, 1, 1, 1, 1, 1,
-0.1823418, -0.7118132, -4.285222, 1, 1, 1, 1, 1,
-0.1807106, -0.8200595, -1.14961, 1, 1, 1, 1, 1,
-0.1798526, -0.4285771, -2.511811, 1, 1, 1, 1, 1,
-0.1794042, -1.984141, -3.423373, 1, 1, 1, 1, 1,
-0.17643, 0.6172796, -1.218626, 1, 1, 1, 1, 1,
-0.1702835, 0.442594, -0.3367976, 1, 1, 1, 1, 1,
-0.1688943, -1.997139, -3.567082, 1, 1, 1, 1, 1,
-0.1631062, 0.2513243, -0.7092673, 1, 1, 1, 1, 1,
-0.1626863, -0.3134756, -2.153791, 1, 1, 1, 1, 1,
-0.1622297, 0.1327956, -1.709036, 1, 1, 1, 1, 1,
-0.1519486, -0.1036224, -4.246037, 0, 0, 1, 1, 1,
-0.1495578, 1.975474, 0.4837297, 1, 0, 0, 1, 1,
-0.1463466, -0.894528, -3.195549, 1, 0, 0, 1, 1,
-0.1425649, 0.2233587, -0.9171098, 1, 0, 0, 1, 1,
-0.1421397, 0.3387808, 1.305728, 1, 0, 0, 1, 1,
-0.1377042, -0.5337231, -3.064933, 1, 0, 0, 1, 1,
-0.1365017, 0.235137, -1.772437, 0, 0, 0, 1, 1,
-0.1361134, -1.878273, -1.330571, 0, 0, 0, 1, 1,
-0.1348805, -1.830641, -3.438828, 0, 0, 0, 1, 1,
-0.1320728, -1.681446, -3.554124, 0, 0, 0, 1, 1,
-0.1277424, 0.02009406, -2.878031, 0, 0, 0, 1, 1,
-0.1265056, -0.8902534, -2.842414, 0, 0, 0, 1, 1,
-0.1238807, 1.037138, -1.099562, 0, 0, 0, 1, 1,
-0.1135367, 2.544775, -1.046312, 1, 1, 1, 1, 1,
-0.1072807, 1.344051, 2.136109, 1, 1, 1, 1, 1,
-0.1066234, 1.938704, 0.6175614, 1, 1, 1, 1, 1,
-0.1022947, 0.1881533, -1.494408, 1, 1, 1, 1, 1,
-0.1015203, -0.9664512, -2.839186, 1, 1, 1, 1, 1,
-0.100262, -1.602003, -3.774506, 1, 1, 1, 1, 1,
-0.09881066, -0.1139011, -3.285102, 1, 1, 1, 1, 1,
-0.08988366, 2.065652, -0.5757141, 1, 1, 1, 1, 1,
-0.08906122, 0.3322333, -0.9052609, 1, 1, 1, 1, 1,
-0.08840225, 0.1807649, -1.059681, 1, 1, 1, 1, 1,
-0.08628505, 0.7714064, 0.8809593, 1, 1, 1, 1, 1,
-0.08471076, 0.377746, 0.5982462, 1, 1, 1, 1, 1,
-0.08324996, -0.1598667, -4.500672, 1, 1, 1, 1, 1,
-0.08210564, -0.980895, -1.811698, 1, 1, 1, 1, 1,
-0.08008465, -0.3467899, -4.381919, 1, 1, 1, 1, 1,
-0.0675798, -0.415919, -2.121731, 0, 0, 1, 1, 1,
-0.0668818, 0.9870834, 0.7401139, 1, 0, 0, 1, 1,
-0.06424082, 0.7583067, -0.8568811, 1, 0, 0, 1, 1,
-0.06144781, -1.484941, -3.276503, 1, 0, 0, 1, 1,
-0.06048979, -0.1156285, -4.126595, 1, 0, 0, 1, 1,
-0.05541627, -1.091241, -2.333992, 1, 0, 0, 1, 1,
-0.05495623, -0.5947946, -1.670035, 0, 0, 0, 1, 1,
-0.05450197, -0.13058, -4.488188, 0, 0, 0, 1, 1,
-0.05183008, 0.445076, -1.144726, 0, 0, 0, 1, 1,
-0.04520874, 1.031445, -0.2086464, 0, 0, 0, 1, 1,
-0.04345522, -2.338919, -3.549486, 0, 0, 0, 1, 1,
-0.04086683, 1.389234, -1.655626, 0, 0, 0, 1, 1,
-0.03913537, -0.1839559, -2.890929, 0, 0, 0, 1, 1,
-0.03881937, -0.05240988, -1.379827, 1, 1, 1, 1, 1,
-0.03704133, 0.1540772, 0.4356011, 1, 1, 1, 1, 1,
-0.03681527, -0.3318997, -3.176533, 1, 1, 1, 1, 1,
-0.03580892, -0.2574792, -4.735843, 1, 1, 1, 1, 1,
-0.03523277, -1.248305, -1.255214, 1, 1, 1, 1, 1,
-0.03356982, -0.9246821, -2.598202, 1, 1, 1, 1, 1,
-0.03259185, -1.522937, -2.821415, 1, 1, 1, 1, 1,
-0.03161064, -1.505014, -3.52623, 1, 1, 1, 1, 1,
-0.0298472, -0.08434554, -2.135901, 1, 1, 1, 1, 1,
-0.02777393, 0.9847007, -1.306362, 1, 1, 1, 1, 1,
-0.02776071, 0.4732182, 0.1076704, 1, 1, 1, 1, 1,
-0.02662722, 0.01834757, -1.665025, 1, 1, 1, 1, 1,
-0.02481395, -0.2384673, -4.030227, 1, 1, 1, 1, 1,
-0.01241207, -0.7370645, -2.486597, 1, 1, 1, 1, 1,
-0.00653152, 1.596191, -0.9584923, 1, 1, 1, 1, 1,
-0.006169978, 1.058044, -0.474001, 0, 0, 1, 1, 1,
-0.004289182, -1.178489, -4.318028, 1, 0, 0, 1, 1,
-0.003268647, -1.669357, -1.129527, 1, 0, 0, 1, 1,
-0.000109835, 1.032927, 1.294684, 1, 0, 0, 1, 1,
0.0007531134, 0.5470741, -0.6427598, 1, 0, 0, 1, 1,
0.001424644, 0.3395957, -1.191408, 1, 0, 0, 1, 1,
0.00260949, 2.31649, 0.2412599, 0, 0, 0, 1, 1,
0.00590765, 0.854779, -2.450478, 0, 0, 0, 1, 1,
0.006136751, -0.5700712, 4.28232, 0, 0, 0, 1, 1,
0.006196583, -0.1816401, 3.842388, 0, 0, 0, 1, 1,
0.00854782, -0.7953114, 3.868639, 0, 0, 0, 1, 1,
0.010927, 1.130226, -0.05950677, 0, 0, 0, 1, 1,
0.01619892, -1.084777, 3.986305, 0, 0, 0, 1, 1,
0.02149404, -0.3558803, 3.565197, 1, 1, 1, 1, 1,
0.02209417, 0.6503402, -0.8850572, 1, 1, 1, 1, 1,
0.02330535, 0.06252797, -0.0181403, 1, 1, 1, 1, 1,
0.02374342, -0.7869705, 2.769334, 1, 1, 1, 1, 1,
0.02631581, 0.2519517, 0.566268, 1, 1, 1, 1, 1,
0.02639307, 0.08397689, -0.06019779, 1, 1, 1, 1, 1,
0.03031365, -0.4007483, 4.289584, 1, 1, 1, 1, 1,
0.03093418, 0.845147, -0.2623626, 1, 1, 1, 1, 1,
0.0314368, -0.07916558, 3.656462, 1, 1, 1, 1, 1,
0.03173803, -0.7666994, 3.128055, 1, 1, 1, 1, 1,
0.03609585, -0.5104722, 2.151417, 1, 1, 1, 1, 1,
0.03610557, -1.510926, 1.549997, 1, 1, 1, 1, 1,
0.04169378, -2.870447, 4.550834, 1, 1, 1, 1, 1,
0.04717596, -0.524985, 3.355598, 1, 1, 1, 1, 1,
0.04850592, -0.5487573, 1.687741, 1, 1, 1, 1, 1,
0.0488422, -1.203182, 3.631326, 0, 0, 1, 1, 1,
0.05049039, -1.591882, 3.177161, 1, 0, 0, 1, 1,
0.05274865, -0.07187709, 1.577194, 1, 0, 0, 1, 1,
0.05598491, -0.4852036, 3.421486, 1, 0, 0, 1, 1,
0.05733295, -0.4434704, 3.915564, 1, 0, 0, 1, 1,
0.05815695, -0.05263435, 1.497703, 1, 0, 0, 1, 1,
0.06656068, -1.138728, 1.918097, 0, 0, 0, 1, 1,
0.06845952, -1.090849, 2.763957, 0, 0, 0, 1, 1,
0.07428372, -0.628527, 1.624491, 0, 0, 0, 1, 1,
0.077654, -2.052984, 4.154302, 0, 0, 0, 1, 1,
0.07884049, -0.030629, 4.005228, 0, 0, 0, 1, 1,
0.08058856, -0.06100245, 0.89547, 0, 0, 0, 1, 1,
0.08790547, -0.01342964, 3.101147, 0, 0, 0, 1, 1,
0.09238996, -0.7735978, 1.463303, 1, 1, 1, 1, 1,
0.09409289, -0.8900074, 3.788163, 1, 1, 1, 1, 1,
0.09472799, -0.9879757, 0.990424, 1, 1, 1, 1, 1,
0.09792291, -0.08425827, 1.233678, 1, 1, 1, 1, 1,
0.1055291, 0.06759501, 3.025533, 1, 1, 1, 1, 1,
0.1062985, 0.04567442, 0.6572756, 1, 1, 1, 1, 1,
0.1158484, -1.376828, 3.515795, 1, 1, 1, 1, 1,
0.1185351, -2.180599, 2.711868, 1, 1, 1, 1, 1,
0.1295817, -1.056011, 4.308201, 1, 1, 1, 1, 1,
0.1316685, 1.054114, -1.175705, 1, 1, 1, 1, 1,
0.1404352, -0.06421357, 1.715864, 1, 1, 1, 1, 1,
0.140551, 0.8402665, 0.9813237, 1, 1, 1, 1, 1,
0.1436543, -0.2327714, 3.539585, 1, 1, 1, 1, 1,
0.1530539, 0.4316853, 0.1378261, 1, 1, 1, 1, 1,
0.1551484, 0.9304338, 0.2198415, 1, 1, 1, 1, 1,
0.1598987, 0.3369127, -0.8558111, 0, 0, 1, 1, 1,
0.1604652, 0.02186018, 2.320991, 1, 0, 0, 1, 1,
0.1660102, 0.7146048, -0.5112059, 1, 0, 0, 1, 1,
0.1675189, 1.287877, 1.157682, 1, 0, 0, 1, 1,
0.1677745, -1.535616, 2.853261, 1, 0, 0, 1, 1,
0.1702271, -1.113174, 2.311741, 1, 0, 0, 1, 1,
0.1721705, 0.824944, -2.321226, 0, 0, 0, 1, 1,
0.1728662, -2.306587, 4.397567, 0, 0, 0, 1, 1,
0.1743621, -1.729022, 1.563677, 0, 0, 0, 1, 1,
0.1755414, 0.1128726, -0.03788601, 0, 0, 0, 1, 1,
0.1765723, -0.2943225, 1.767304, 0, 0, 0, 1, 1,
0.176881, -0.9169829, 4.226717, 0, 0, 0, 1, 1,
0.177428, -2.340154, 3.196166, 0, 0, 0, 1, 1,
0.1777844, 1.216126, -0.8440897, 1, 1, 1, 1, 1,
0.1778396, 1.529087, 0.03560428, 1, 1, 1, 1, 1,
0.1833899, 0.7176139, -0.4200051, 1, 1, 1, 1, 1,
0.1840864, -1.919665, 2.864194, 1, 1, 1, 1, 1,
0.1874167, -1.333674, 2.355414, 1, 1, 1, 1, 1,
0.1882527, 0.003540551, 1.380967, 1, 1, 1, 1, 1,
0.1889835, -1.387875, 2.125709, 1, 1, 1, 1, 1,
0.1912502, 0.4813149, -1.713378, 1, 1, 1, 1, 1,
0.1964395, 0.7392467, 0.8373832, 1, 1, 1, 1, 1,
0.2015159, 0.7964255, -0.0404806, 1, 1, 1, 1, 1,
0.2060831, 0.02715441, 2.628071, 1, 1, 1, 1, 1,
0.2085293, -0.5966023, 3.53284, 1, 1, 1, 1, 1,
0.2100628, 0.7125362, 2.742225, 1, 1, 1, 1, 1,
0.2103199, -0.04145804, -1.326418, 1, 1, 1, 1, 1,
0.2122617, -0.5028789, 3.134945, 1, 1, 1, 1, 1,
0.2177677, -0.923535, 2.739043, 0, 0, 1, 1, 1,
0.2207732, 0.06476506, 1.608975, 1, 0, 0, 1, 1,
0.2221751, 1.510958, -0.3434227, 1, 0, 0, 1, 1,
0.2279497, -1.10902, 4.263062, 1, 0, 0, 1, 1,
0.230531, 0.5216873, 0.4037807, 1, 0, 0, 1, 1,
0.2308971, 1.152505, -0.5116314, 1, 0, 0, 1, 1,
0.2349878, -1.519319, 4.022318, 0, 0, 0, 1, 1,
0.2354423, 1.163782, 0.584424, 0, 0, 0, 1, 1,
0.2379367, 0.02116978, 3.280196, 0, 0, 0, 1, 1,
0.243461, -1.822437, 4.410245, 0, 0, 0, 1, 1,
0.2473539, 3.006665, 0.4701625, 0, 0, 0, 1, 1,
0.2479169, -0.8524882, 0.8407369, 0, 0, 0, 1, 1,
0.2502896, -0.7449115, 3.49687, 0, 0, 0, 1, 1,
0.2519456, -2.007865, 2.978386, 1, 1, 1, 1, 1,
0.2541366, 0.8920802, 2.209627, 1, 1, 1, 1, 1,
0.2541988, -2.084347, 2.595388, 1, 1, 1, 1, 1,
0.2610423, 0.4164797, 0.7057775, 1, 1, 1, 1, 1,
0.2615119, -0.7197276, 3.601422, 1, 1, 1, 1, 1,
0.2658488, 0.663125, 0.8707755, 1, 1, 1, 1, 1,
0.2715822, 0.4661113, 1.829503, 1, 1, 1, 1, 1,
0.2740504, -0.9687433, 4.011598, 1, 1, 1, 1, 1,
0.2751583, 0.09377744, 2.635501, 1, 1, 1, 1, 1,
0.2848036, 1.8835, -1.180251, 1, 1, 1, 1, 1,
0.2855105, 0.05010559, 1.945631, 1, 1, 1, 1, 1,
0.2874294, 0.5650162, 0.3264329, 1, 1, 1, 1, 1,
0.2879043, -1.357571, 3.812127, 1, 1, 1, 1, 1,
0.2884889, -0.5802257, 3.196269, 1, 1, 1, 1, 1,
0.289335, -1.583174, 1.195143, 1, 1, 1, 1, 1,
0.289913, 0.2516169, -0.2883863, 0, 0, 1, 1, 1,
0.2956903, -1.270457, 3.239926, 1, 0, 0, 1, 1,
0.2980037, -2.008027, 3.931433, 1, 0, 0, 1, 1,
0.2999519, -0.5390219, 3.909893, 1, 0, 0, 1, 1,
0.3001511, -0.1563243, 0.4320835, 1, 0, 0, 1, 1,
0.3006493, 0.3499541, -0.315188, 1, 0, 0, 1, 1,
0.3077902, -2.159727, 2.888318, 0, 0, 0, 1, 1,
0.3086299, -0.1076441, 1.139497, 0, 0, 0, 1, 1,
0.3104244, 0.4425684, 0.8232867, 0, 0, 0, 1, 1,
0.3109848, -1.382928, 2.728585, 0, 0, 0, 1, 1,
0.3170015, -0.6115142, 2.889874, 0, 0, 0, 1, 1,
0.318984, 0.1712016, -0.6448569, 0, 0, 0, 1, 1,
0.3197803, 0.1853354, 0.6483754, 0, 0, 0, 1, 1,
0.3218872, 0.2539076, 0.2085001, 1, 1, 1, 1, 1,
0.3308754, 0.2011278, 1.378341, 1, 1, 1, 1, 1,
0.3349661, -0.2185351, 0.8282427, 1, 1, 1, 1, 1,
0.3351569, -0.2722456, 0.4086308, 1, 1, 1, 1, 1,
0.3382183, 0.96676, 1.983774, 1, 1, 1, 1, 1,
0.3404114, 1.196145, -0.4267625, 1, 1, 1, 1, 1,
0.3411797, -2.15057, 3.367475, 1, 1, 1, 1, 1,
0.3416797, 0.1325489, 2.379922, 1, 1, 1, 1, 1,
0.3422234, 0.597359, 1.366406, 1, 1, 1, 1, 1,
0.3432599, 1.389013, -0.3533578, 1, 1, 1, 1, 1,
0.3439446, 0.00944059, 1.39542, 1, 1, 1, 1, 1,
0.3454023, -0.3282402, 2.778824, 1, 1, 1, 1, 1,
0.3459408, -1.569958, 3.227791, 1, 1, 1, 1, 1,
0.3469144, 0.8134546, -0.3011012, 1, 1, 1, 1, 1,
0.3469791, -0.4323882, 3.839276, 1, 1, 1, 1, 1,
0.3507226, 1.921073, 1.705861, 0, 0, 1, 1, 1,
0.3508631, -3.031384, 2.255498, 1, 0, 0, 1, 1,
0.3541248, 1.036496, -0.5384456, 1, 0, 0, 1, 1,
0.3545724, -1.189155, 3.215779, 1, 0, 0, 1, 1,
0.3591799, -0.3546847, 2.806239, 1, 0, 0, 1, 1,
0.3629791, 0.1008658, 2.091313, 1, 0, 0, 1, 1,
0.3686494, 0.3867497, 0.9422482, 0, 0, 0, 1, 1,
0.3687201, -0.05801252, -0.3290041, 0, 0, 0, 1, 1,
0.3697212, -1.034387, 3.273093, 0, 0, 0, 1, 1,
0.3746879, -1.449189, 1.950608, 0, 0, 0, 1, 1,
0.386, 0.6853045, -2.107389, 0, 0, 0, 1, 1,
0.3884213, 0.1181033, 2.262671, 0, 0, 0, 1, 1,
0.3905555, -0.08879473, 3.091857, 0, 0, 0, 1, 1,
0.3971694, -0.7333958, 1.131788, 1, 1, 1, 1, 1,
0.3992183, -1.452473, 3.141765, 1, 1, 1, 1, 1,
0.4036483, 0.8095289, 2.928204, 1, 1, 1, 1, 1,
0.405757, -1.227897, 4.036349, 1, 1, 1, 1, 1,
0.4060856, -0.7301302, 3.310803, 1, 1, 1, 1, 1,
0.4107332, 1.278177, 1.656291, 1, 1, 1, 1, 1,
0.4115968, -0.4854843, 4.277963, 1, 1, 1, 1, 1,
0.41256, -0.4580573, 2.316942, 1, 1, 1, 1, 1,
0.414794, -0.6828695, 1.86954, 1, 1, 1, 1, 1,
0.4154088, 0.1694415, 1.718234, 1, 1, 1, 1, 1,
0.4178842, -2.009724, 3.911369, 1, 1, 1, 1, 1,
0.4247637, 0.3338204, 0.527898, 1, 1, 1, 1, 1,
0.4249011, -0.02691465, 1.25588, 1, 1, 1, 1, 1,
0.4256237, -0.02004578, 0.1757256, 1, 1, 1, 1, 1,
0.4401425, 0.8069172, 1.119733, 1, 1, 1, 1, 1,
0.4421898, -1.849013, 2.334446, 0, 0, 1, 1, 1,
0.4438141, -0.8065903, 3.605859, 1, 0, 0, 1, 1,
0.4456291, -0.2209484, 1.112788, 1, 0, 0, 1, 1,
0.447008, -0.6779401, 2.912246, 1, 0, 0, 1, 1,
0.4476884, 1.096037, 1.310592, 1, 0, 0, 1, 1,
0.4487939, -0.962884, 3.190639, 1, 0, 0, 1, 1,
0.4524505, -0.1039605, 0.8830159, 0, 0, 0, 1, 1,
0.4537756, -2.410486, 5.430832, 0, 0, 0, 1, 1,
0.4573252, -1.445942, 1.298292, 0, 0, 0, 1, 1,
0.4589902, 0.839943, 1.598058, 0, 0, 0, 1, 1,
0.4691306, 0.1741771, 1.676024, 0, 0, 0, 1, 1,
0.4700629, 0.9857504, 0.4259914, 0, 0, 0, 1, 1,
0.4708569, 0.1801102, 1.234058, 0, 0, 0, 1, 1,
0.4715077, -0.3171763, 2.526877, 1, 1, 1, 1, 1,
0.4741112, -0.2334673, 3.055915, 1, 1, 1, 1, 1,
0.4750427, -0.01988549, 0.1775972, 1, 1, 1, 1, 1,
0.4755375, 1.164544, 0.02505318, 1, 1, 1, 1, 1,
0.4775403, 0.1853755, -0.08837526, 1, 1, 1, 1, 1,
0.4862906, 0.3858356, 0.7885563, 1, 1, 1, 1, 1,
0.490404, -1.741615, 2.023375, 1, 1, 1, 1, 1,
0.4992059, 0.3217611, 1.10891, 1, 1, 1, 1, 1,
0.5010973, 0.07046838, 0.9350203, 1, 1, 1, 1, 1,
0.5011738, -1.442958, 3.001626, 1, 1, 1, 1, 1,
0.5037464, 0.6282845, 1.055573, 1, 1, 1, 1, 1,
0.5048836, -1.064154, 3.81951, 1, 1, 1, 1, 1,
0.5066955, 1.988874, 1.373002, 1, 1, 1, 1, 1,
0.5068822, 0.2086386, 1.461615, 1, 1, 1, 1, 1,
0.5079239, -0.4206659, 2.859929, 1, 1, 1, 1, 1,
0.5103909, -0.1006662, 2.525745, 0, 0, 1, 1, 1,
0.5104481, -2.090633, 1.892895, 1, 0, 0, 1, 1,
0.5153056, 0.3947135, 1.697794, 1, 0, 0, 1, 1,
0.5153546, 0.3251361, 1.509728, 1, 0, 0, 1, 1,
0.516726, 0.8573073, -0.407829, 1, 0, 0, 1, 1,
0.5173859, 1.712007, 0.4288035, 1, 0, 0, 1, 1,
0.5223212, -0.324416, 3.089267, 0, 0, 0, 1, 1,
0.525435, -1.043919, 2.635104, 0, 0, 0, 1, 1,
0.5266644, 0.1571956, -0.181319, 0, 0, 0, 1, 1,
0.527207, 0.5973451, 0.7586528, 0, 0, 0, 1, 1,
0.5273045, 0.3758699, 1.038129, 0, 0, 0, 1, 1,
0.5302727, -0.9483851, 2.686413, 0, 0, 0, 1, 1,
0.5314142, -0.777938, 2.269271, 0, 0, 0, 1, 1,
0.5318514, -0.9292793, 2.351207, 1, 1, 1, 1, 1,
0.5455455, 0.01539127, 1.997883, 1, 1, 1, 1, 1,
0.5458847, -0.8659124, 2.053415, 1, 1, 1, 1, 1,
0.5471545, -1.642843, 1.790088, 1, 1, 1, 1, 1,
0.5497142, 0.02299072, 2.111354, 1, 1, 1, 1, 1,
0.550175, 0.3143551, 0.7813591, 1, 1, 1, 1, 1,
0.5514612, 0.8865505, -1.09929, 1, 1, 1, 1, 1,
0.5528286, 0.6770094, 2.735212, 1, 1, 1, 1, 1,
0.5603797, -1.109242, 4.051475, 1, 1, 1, 1, 1,
0.5605615, 0.04672898, 2.090713, 1, 1, 1, 1, 1,
0.5612755, -0.2907367, 1.764613, 1, 1, 1, 1, 1,
0.5619968, -0.2371895, 3.053766, 1, 1, 1, 1, 1,
0.5630286, 0.41912, 0.7192021, 1, 1, 1, 1, 1,
0.5663835, 0.7266265, 1.956594, 1, 1, 1, 1, 1,
0.5704839, 0.9265962, -0.5512336, 1, 1, 1, 1, 1,
0.5732377, 0.6780518, 0.4112149, 0, 0, 1, 1, 1,
0.5741343, -1.957773, 3.492351, 1, 0, 0, 1, 1,
0.5750792, 0.3314708, -0.03691737, 1, 0, 0, 1, 1,
0.5751768, 0.5935835, 1.435551, 1, 0, 0, 1, 1,
0.5780115, 0.2563698, 1.323443, 1, 0, 0, 1, 1,
0.5825821, -1.478148, 0.2722602, 1, 0, 0, 1, 1,
0.5902199, -0.8293125, 2.133324, 0, 0, 0, 1, 1,
0.5915127, -0.8987474, 3.027644, 0, 0, 0, 1, 1,
0.6014032, 0.6253598, -0.9582588, 0, 0, 0, 1, 1,
0.6035136, -0.009705653, 2.479992, 0, 0, 0, 1, 1,
0.6042028, -1.471246, 2.320753, 0, 0, 0, 1, 1,
0.6090251, 0.4934261, 2.073129, 0, 0, 0, 1, 1,
0.6110269, 1.12482, 3.018482, 0, 0, 0, 1, 1,
0.6127454, 0.1555063, 1.389308, 1, 1, 1, 1, 1,
0.6127998, 0.988271, 1.310134, 1, 1, 1, 1, 1,
0.6197332, 0.9668308, 0.1986853, 1, 1, 1, 1, 1,
0.6220517, -0.4250794, 2.961485, 1, 1, 1, 1, 1,
0.6300951, 0.4558549, 1.118794, 1, 1, 1, 1, 1,
0.6357576, -1.756497, 3.126366, 1, 1, 1, 1, 1,
0.6386862, -0.7843222, 2.379968, 1, 1, 1, 1, 1,
0.6402153, 0.1383679, 1.883712, 1, 1, 1, 1, 1,
0.6409353, -0.1692683, 1.79113, 1, 1, 1, 1, 1,
0.6419036, 0.3407073, 1.071739, 1, 1, 1, 1, 1,
0.6421191, 0.4352997, 0.3095937, 1, 1, 1, 1, 1,
0.643306, 0.307891, 0.6082761, 1, 1, 1, 1, 1,
0.6442534, -1.883319, 3.22131, 1, 1, 1, 1, 1,
0.6490174, -1.10836, 3.189495, 1, 1, 1, 1, 1,
0.6514376, -0.9018262, 3.235519, 1, 1, 1, 1, 1,
0.6619775, 0.3150195, -0.3266236, 0, 0, 1, 1, 1,
0.6627176, 0.8956251, 0.7833241, 1, 0, 0, 1, 1,
0.6656772, 0.009544869, 0.3140876, 1, 0, 0, 1, 1,
0.6660168, -1.007267, 1.742277, 1, 0, 0, 1, 1,
0.6725054, -0.5942694, 0.5287101, 1, 0, 0, 1, 1,
0.67678, -0.3784141, 0.6230229, 1, 0, 0, 1, 1,
0.6899138, 1.358696, 1.905305, 0, 0, 0, 1, 1,
0.6914113, 0.7590569, 0.002489338, 0, 0, 0, 1, 1,
0.6928358, -2.38644, 2.201065, 0, 0, 0, 1, 1,
0.6967028, 0.1473268, 1.974325, 0, 0, 0, 1, 1,
0.698134, 1.135505, 1.288491, 0, 0, 0, 1, 1,
0.70187, 2.737857, 0.3536112, 0, 0, 0, 1, 1,
0.7035006, 0.4525232, 1.466334, 0, 0, 0, 1, 1,
0.704343, 0.5984966, 1.835808, 1, 1, 1, 1, 1,
0.7043684, 1.31988, 1.063302, 1, 1, 1, 1, 1,
0.7081607, 0.7311069, 0.590481, 1, 1, 1, 1, 1,
0.7132213, 1.390881, 2.456236, 1, 1, 1, 1, 1,
0.7145917, -0.8906785, 1.199405, 1, 1, 1, 1, 1,
0.7167749, -2.12592, 2.726126, 1, 1, 1, 1, 1,
0.7178639, 2.651218, 2.214923, 1, 1, 1, 1, 1,
0.7181752, -0.2521699, 1.864168, 1, 1, 1, 1, 1,
0.7213356, 1.287985, 0.02514098, 1, 1, 1, 1, 1,
0.7255878, -0.2447633, 2.305353, 1, 1, 1, 1, 1,
0.7352151, 2.24562, -0.3897087, 1, 1, 1, 1, 1,
0.7389504, 0.3717562, 0.7767364, 1, 1, 1, 1, 1,
0.7415296, -0.01003842, 0.8993603, 1, 1, 1, 1, 1,
0.7419975, -0.5807914, 3.608684, 1, 1, 1, 1, 1,
0.7475504, 0.6077589, 0.09498677, 1, 1, 1, 1, 1,
0.754376, -0.4865758, 1.742157, 0, 0, 1, 1, 1,
0.7623056, 0.9237907, -1.841779, 1, 0, 0, 1, 1,
0.7639287, 0.1233706, 1.656208, 1, 0, 0, 1, 1,
0.7642677, 1.922715, 0.8498654, 1, 0, 0, 1, 1,
0.778076, 0.4192519, -0.2459653, 1, 0, 0, 1, 1,
0.7801912, 0.0935046, 1.592772, 1, 0, 0, 1, 1,
0.7852926, -0.6039678, 1.746969, 0, 0, 0, 1, 1,
0.7875385, 0.4351, 1.495445, 0, 0, 0, 1, 1,
0.8045229, 0.3322256, 1.105916, 0, 0, 0, 1, 1,
0.8062493, 0.6347922, 0.2861717, 0, 0, 0, 1, 1,
0.8252136, 0.8212816, 0.7488811, 0, 0, 0, 1, 1,
0.8347387, 2.281553, 0.4745664, 0, 0, 0, 1, 1,
0.8350634, -0.2738584, 0.9942482, 0, 0, 0, 1, 1,
0.8396343, 0.7260879, 0.5444508, 1, 1, 1, 1, 1,
0.8519938, -1.704176, 2.805711, 1, 1, 1, 1, 1,
0.8533885, -0.2739376, 1.744924, 1, 1, 1, 1, 1,
0.8555924, 2.195105, 1.721644, 1, 1, 1, 1, 1,
0.8561144, 0.04634027, -0.961719, 1, 1, 1, 1, 1,
0.8568552, 0.003714319, 2.705311, 1, 1, 1, 1, 1,
0.8597202, -1.455742, 2.755157, 1, 1, 1, 1, 1,
0.8605292, 0.7078094, 0.4204295, 1, 1, 1, 1, 1,
0.8634059, 0.7990449, -0.2979161, 1, 1, 1, 1, 1,
0.864387, 1.472885, 1.225551, 1, 1, 1, 1, 1,
0.8646331, -0.5209457, 3.800419, 1, 1, 1, 1, 1,
0.8680221, 0.6228873, 2.256132, 1, 1, 1, 1, 1,
0.871648, 0.15021, 1.90881, 1, 1, 1, 1, 1,
0.8732095, -0.6248137, 0.2646028, 1, 1, 1, 1, 1,
0.8754112, -1.824626, 2.214032, 1, 1, 1, 1, 1,
0.8807828, 0.7088644, -0.2477413, 0, 0, 1, 1, 1,
0.880899, 1.039403, 0.7561145, 1, 0, 0, 1, 1,
0.88806, -0.8569732, 2.083433, 1, 0, 0, 1, 1,
0.8937631, -0.5873022, 2.612788, 1, 0, 0, 1, 1,
0.8965625, 1.142919, 0.04448286, 1, 0, 0, 1, 1,
0.9027785, -0.9301223, 2.699535, 1, 0, 0, 1, 1,
0.910683, -0.2560451, 1.085592, 0, 0, 0, 1, 1,
0.9128209, 0.6127608, 0.7350904, 0, 0, 0, 1, 1,
0.9147874, 0.6082142, 0.4554934, 0, 0, 0, 1, 1,
0.9152359, -1.412253, 3.311665, 0, 0, 0, 1, 1,
0.9201525, 2.38332, 0.8922055, 0, 0, 0, 1, 1,
0.9209829, 0.0197506, 2.236033, 0, 0, 0, 1, 1,
0.924917, 1.726024, 0.2521034, 0, 0, 0, 1, 1,
0.9256852, 0.1733892, 2.843246, 1, 1, 1, 1, 1,
0.9276804, -0.0009630339, 2.278261, 1, 1, 1, 1, 1,
0.9291068, 0.2996499, 0.8000289, 1, 1, 1, 1, 1,
0.9300866, 0.507003, 1.739255, 1, 1, 1, 1, 1,
0.9414111, -1.103672, 2.682866, 1, 1, 1, 1, 1,
0.9424809, -0.3448698, 2.246704, 1, 1, 1, 1, 1,
0.951483, 0.7473388, 1.088657, 1, 1, 1, 1, 1,
0.9537134, -0.2086138, 2.543913, 1, 1, 1, 1, 1,
0.9539266, -1.016018, 1.577856, 1, 1, 1, 1, 1,
0.9571807, -1.729907, 3.35638, 1, 1, 1, 1, 1,
0.9641839, 0.320282, 2.365503, 1, 1, 1, 1, 1,
0.9645674, -1.131724, 2.28809, 1, 1, 1, 1, 1,
0.9647467, 0.3959628, 1.69218, 1, 1, 1, 1, 1,
0.9649421, -1.128802, 1.290489, 1, 1, 1, 1, 1,
0.9664757, -1.653757, 1.878271, 1, 1, 1, 1, 1,
0.969062, -1.167379, 1.628341, 0, 0, 1, 1, 1,
0.9728674, -0.9057587, 0.0830484, 1, 0, 0, 1, 1,
0.9736294, -2.055022, 4.015553, 1, 0, 0, 1, 1,
0.9773686, 0.06789242, 1.452244, 1, 0, 0, 1, 1,
0.9777688, -0.8443683, 3.039858, 1, 0, 0, 1, 1,
0.9784348, 0.0415553, 1.841731, 1, 0, 0, 1, 1,
0.9862442, -0.7448668, 4.564739, 0, 0, 0, 1, 1,
0.9864074, -0.4894845, 2.676687, 0, 0, 0, 1, 1,
0.9884624, 1.666172, 0.03971505, 0, 0, 0, 1, 1,
0.9922079, 0.7468782, 2.458776, 0, 0, 0, 1, 1,
0.9923863, 0.5818093, 2.523065, 0, 0, 0, 1, 1,
1.008985, -1.058182, 3.43662, 0, 0, 0, 1, 1,
1.009946, -1.391387, 2.218561, 0, 0, 0, 1, 1,
1.010811, 0.4276365, 1.063614, 1, 1, 1, 1, 1,
1.011422, 0.8954629, 1.030103, 1, 1, 1, 1, 1,
1.01531, -1.118565, 1.776013, 1, 1, 1, 1, 1,
1.02558, -0.4684533, 2.11147, 1, 1, 1, 1, 1,
1.027246, 1.278244, 1.586121, 1, 1, 1, 1, 1,
1.028436, -0.08577358, 1.859469, 1, 1, 1, 1, 1,
1.028697, -0.5224435, 4.003092, 1, 1, 1, 1, 1,
1.031779, -0.8299485, 2.035125, 1, 1, 1, 1, 1,
1.041372, 0.2588264, 1.851022, 1, 1, 1, 1, 1,
1.048617, -0.4429597, 2.074517, 1, 1, 1, 1, 1,
1.04998, 1.154128, 0.9068522, 1, 1, 1, 1, 1,
1.050663, -1.655713, 3.016413, 1, 1, 1, 1, 1,
1.063437, -0.0150345, 0.7273381, 1, 1, 1, 1, 1,
1.072539, -1.130315, 2.638428, 1, 1, 1, 1, 1,
1.078887, -0.03338344, 2.048155, 1, 1, 1, 1, 1,
1.079944, -1.18783, 3.625142, 0, 0, 1, 1, 1,
1.081072, 0.6836358, 1.083278, 1, 0, 0, 1, 1,
1.104898, -1.069364, 2.900689, 1, 0, 0, 1, 1,
1.105087, -0.6705988, 2.567555, 1, 0, 0, 1, 1,
1.106505, -0.0462687, 3.640355, 1, 0, 0, 1, 1,
1.10819, 0.8367546, 0.6450347, 1, 0, 0, 1, 1,
1.110013, 0.2796926, 2.56299, 0, 0, 0, 1, 1,
1.126313, 0.7487887, 0.5052007, 0, 0, 0, 1, 1,
1.138446, 0.06639045, 1.650017, 0, 0, 0, 1, 1,
1.139187, 0.7578086, 0.3718061, 0, 0, 0, 1, 1,
1.141639, -1.373853, 2.262466, 0, 0, 0, 1, 1,
1.142142, 0.8565203, 1.074047, 0, 0, 0, 1, 1,
1.152553, -0.3400264, 1.763717, 0, 0, 0, 1, 1,
1.156315, -0.7300082, 1.714776, 1, 1, 1, 1, 1,
1.16421, 0.9667283, -1.582366, 1, 1, 1, 1, 1,
1.164448, 0.3006323, -0.9042982, 1, 1, 1, 1, 1,
1.165736, -1.530426, 2.496866, 1, 1, 1, 1, 1,
1.169683, 0.9366862, 0.6628686, 1, 1, 1, 1, 1,
1.172754, 0.9931427, 2.840249, 1, 1, 1, 1, 1,
1.195783, -0.357559, 2.864312, 1, 1, 1, 1, 1,
1.203991, 0.4312275, 2.028925, 1, 1, 1, 1, 1,
1.212332, 0.7300408, 0.2574198, 1, 1, 1, 1, 1,
1.218709, 0.3538318, 1.782939, 1, 1, 1, 1, 1,
1.224064, 0.7805355, 0.3708813, 1, 1, 1, 1, 1,
1.230191, -1.165027, 1.101989, 1, 1, 1, 1, 1,
1.230639, 0.3210614, 2.881749, 1, 1, 1, 1, 1,
1.233329, -0.601929, 2.245997, 1, 1, 1, 1, 1,
1.233524, -0.8737996, 2.130516, 1, 1, 1, 1, 1,
1.234369, -1.784387, 2.996344, 0, 0, 1, 1, 1,
1.235374, 1.05038, 1.458986, 1, 0, 0, 1, 1,
1.237908, 0.9916597, 2.308325, 1, 0, 0, 1, 1,
1.241915, 1.188908, 1.030021, 1, 0, 0, 1, 1,
1.244249, -1.26978, 4.095247, 1, 0, 0, 1, 1,
1.244582, -0.9626318, 4.027604, 1, 0, 0, 1, 1,
1.273052, -0.5824359, 1.596779, 0, 0, 0, 1, 1,
1.276859, 1.799573, -1.868158, 0, 0, 0, 1, 1,
1.277571, -0.3505593, 1.005188, 0, 0, 0, 1, 1,
1.282358, 0.9616609, 1.897336, 0, 0, 0, 1, 1,
1.291817, 1.160401, 1.466611, 0, 0, 0, 1, 1,
1.295239, 0.7428175, 1.526119, 0, 0, 0, 1, 1,
1.300219, 0.05635818, 0.245986, 0, 0, 0, 1, 1,
1.300677, 1.123003, 1.407356, 1, 1, 1, 1, 1,
1.306536, -0.06233058, 3.067981, 1, 1, 1, 1, 1,
1.307092, 0.7828335, -0.4783629, 1, 1, 1, 1, 1,
1.308762, 0.8406908, 0.6033255, 1, 1, 1, 1, 1,
1.321157, -0.09549598, 1.415774, 1, 1, 1, 1, 1,
1.331405, 0.6569305, 1.380099, 1, 1, 1, 1, 1,
1.332524, -0.4960906, 1.685038, 1, 1, 1, 1, 1,
1.334895, 0.2310646, 0.8849881, 1, 1, 1, 1, 1,
1.346136, 1.251691, 1.227465, 1, 1, 1, 1, 1,
1.352004, 0.4244053, 1.513403, 1, 1, 1, 1, 1,
1.35601, -0.5524297, 2.764589, 1, 1, 1, 1, 1,
1.36016, 0.5553771, 0.5280678, 1, 1, 1, 1, 1,
1.363755, -1.310395, 1.413836, 1, 1, 1, 1, 1,
1.373646, 0.5950229, 0.82049, 1, 1, 1, 1, 1,
1.378623, 0.2186079, -0.00312408, 1, 1, 1, 1, 1,
1.380091, 0.6323373, 0.5145525, 0, 0, 1, 1, 1,
1.397857, 1.273553, 1.444801, 1, 0, 0, 1, 1,
1.40264, 0.1583258, 1.388771, 1, 0, 0, 1, 1,
1.404754, 1.117497, 0.7319754, 1, 0, 0, 1, 1,
1.411307, 0.8632233, 1.734379, 1, 0, 0, 1, 1,
1.440307, -0.68111, 2.479815, 1, 0, 0, 1, 1,
1.474803, 2.158283, 0.1201193, 0, 0, 0, 1, 1,
1.489221, 0.4885513, 1.393708, 0, 0, 0, 1, 1,
1.499069, -0.8591247, 2.439735, 0, 0, 0, 1, 1,
1.499148, 1.676665, 1.950372, 0, 0, 0, 1, 1,
1.502538, -1.449762, 3.427014, 0, 0, 0, 1, 1,
1.513164, 0.4440939, 1.22203, 0, 0, 0, 1, 1,
1.525631, 1.579311, 1.749098, 0, 0, 0, 1, 1,
1.531961, 0.9021977, 0.7322389, 1, 1, 1, 1, 1,
1.535797, -1.538205, 1.393579, 1, 1, 1, 1, 1,
1.541578, 1.546458, 2.497742, 1, 1, 1, 1, 1,
1.542917, 1.327448, -0.4897778, 1, 1, 1, 1, 1,
1.552399, 0.7061006, 1.360741, 1, 1, 1, 1, 1,
1.553288, 1.543553, 1.528826, 1, 1, 1, 1, 1,
1.567468, -0.7867302, 3.436141, 1, 1, 1, 1, 1,
1.581672, -1.529302, 2.375538, 1, 1, 1, 1, 1,
1.586033, -0.2793456, 2.083363, 1, 1, 1, 1, 1,
1.587945, -2.470859, 3.299398, 1, 1, 1, 1, 1,
1.603567, 0.1753779, 1.167309, 1, 1, 1, 1, 1,
1.615961, 0.7774042, 0.7686585, 1, 1, 1, 1, 1,
1.621143, 0.8613362, 0.7020071, 1, 1, 1, 1, 1,
1.650079, 0.2367757, 3.095829, 1, 1, 1, 1, 1,
1.653334, -1.614803, 1.322358, 1, 1, 1, 1, 1,
1.66677, -1.578598, 2.024679, 0, 0, 1, 1, 1,
1.676351, -1.312106, 2.020958, 1, 0, 0, 1, 1,
1.686863, -0.2807044, 2.86977, 1, 0, 0, 1, 1,
1.717967, 1.143185, 1.842248, 1, 0, 0, 1, 1,
1.726717, -0.02496673, 1.229638, 1, 0, 0, 1, 1,
1.738283, -0.7441391, 1.664434, 1, 0, 0, 1, 1,
1.74037, 1.985454, 0.6637738, 0, 0, 0, 1, 1,
1.755558, 1.277101, 1.905678, 0, 0, 0, 1, 1,
1.766672, 0.2907436, 2.408158, 0, 0, 0, 1, 1,
1.768307, -1.745799, 3.007718, 0, 0, 0, 1, 1,
1.783747, -0.1371355, 3.094134, 0, 0, 0, 1, 1,
1.791883, -0.03209617, 2.139793, 0, 0, 0, 1, 1,
1.794367, -0.6919479, 1.821753, 0, 0, 0, 1, 1,
1.810735, 0.7120733, 1.215935, 1, 1, 1, 1, 1,
1.814929, -0.3553854, 0.6116726, 1, 1, 1, 1, 1,
1.824953, 0.1435712, 1.797907, 1, 1, 1, 1, 1,
1.826077, 1.765829, 0.4600189, 1, 1, 1, 1, 1,
1.843379, 0.0286312, 2.112167, 1, 1, 1, 1, 1,
1.916379, -0.7002038, 1.024709, 1, 1, 1, 1, 1,
1.954041, 0.1168727, 0.7138337, 1, 1, 1, 1, 1,
1.963568, -0.1844213, 1.333935, 1, 1, 1, 1, 1,
1.973437, 0.05872594, 2.908486, 1, 1, 1, 1, 1,
1.981683, 1.484553, 2.299318, 1, 1, 1, 1, 1,
1.998292, 1.124498, 0.7297043, 1, 1, 1, 1, 1,
2.034144, 0.1908616, 2.823126, 1, 1, 1, 1, 1,
2.037809, -0.09066103, 1.020452, 1, 1, 1, 1, 1,
2.053725, 1.642986, 1.953919, 1, 1, 1, 1, 1,
2.060052, -2.103434, 2.778065, 1, 1, 1, 1, 1,
2.073095, 0.5145115, 1.978534, 0, 0, 1, 1, 1,
2.099593, 0.6643153, 1.393302, 1, 0, 0, 1, 1,
2.114854, -0.004909725, -0.2926743, 1, 0, 0, 1, 1,
2.136741, -0.7316796, 2.126824, 1, 0, 0, 1, 1,
2.162682, -0.16095, 1.554482, 1, 0, 0, 1, 1,
2.164254, -0.2199171, 1.085774, 1, 0, 0, 1, 1,
2.191682, -0.2469816, 3.40278, 0, 0, 0, 1, 1,
2.19639, 0.6093838, 1.367034, 0, 0, 0, 1, 1,
2.203707, 1.25032, -0.8713076, 0, 0, 0, 1, 1,
2.214401, 0.2386929, 0.8911355, 0, 0, 0, 1, 1,
2.235798, -0.8743858, 1.93283, 0, 0, 0, 1, 1,
2.240779, 0.225098, 1.044026, 0, 0, 0, 1, 1,
2.298523, -0.736823, 2.633307, 0, 0, 0, 1, 1,
2.363575, 0.6394719, 1.208894, 1, 1, 1, 1, 1,
2.51059, -0.5464431, 0.7032004, 1, 1, 1, 1, 1,
2.511843, 0.8612089, 1.085913, 1, 1, 1, 1, 1,
2.516588, 0.009230846, 1.917345, 1, 1, 1, 1, 1,
2.646011, 1.923367, 1.006038, 1, 1, 1, 1, 1,
3.023353, 0.3818433, 1.034949, 1, 1, 1, 1, 1,
3.198963, 1.166098, 0.9171737, 1, 1, 1, 1, 1
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
var radius = 9.590272;
var distance = 33.68542;
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
mvMatrix.translate( -0.03945065, -0.1966019, -0.2671003 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68542);
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
