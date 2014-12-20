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
-3.354883, -0.1287201, -1.204368, 1, 0, 0, 1,
-3.139579, 0.3565098, -1.070211, 1, 0.007843138, 0, 1,
-3.113185, 0.644569, -1.293652, 1, 0.01176471, 0, 1,
-2.560333, -0.9826623, -0.3724901, 1, 0.01960784, 0, 1,
-2.559712, -0.7598014, -3.311183, 1, 0.02352941, 0, 1,
-2.555539, 1.122825, -0.7093946, 1, 0.03137255, 0, 1,
-2.383938, -1.026806, -3.207261, 1, 0.03529412, 0, 1,
-2.262551, -0.2514643, -1.436404, 1, 0.04313726, 0, 1,
-2.24881, 1.362824, -0.6385267, 1, 0.04705882, 0, 1,
-2.247814, 1.242821, 0.3032019, 1, 0.05490196, 0, 1,
-2.202707, 0.425192, -0.9526425, 1, 0.05882353, 0, 1,
-2.197436, 0.08377329, -0.976525, 1, 0.06666667, 0, 1,
-2.167942, -2.703065, -2.766298, 1, 0.07058824, 0, 1,
-2.155264, 0.1077449, -5.278246, 1, 0.07843138, 0, 1,
-2.151181, 0.08371576, -2.745633, 1, 0.08235294, 0, 1,
-2.151026, 0.801625, -0.7889839, 1, 0.09019608, 0, 1,
-2.136814, -0.9047241, -3.522386, 1, 0.09411765, 0, 1,
-2.126849, 1.220895, -1.431036, 1, 0.1019608, 0, 1,
-2.099091, -0.6847477, -1.346724, 1, 0.1098039, 0, 1,
-2.074534, -1.142241, -1.334478, 1, 0.1137255, 0, 1,
-2.044675, 1.112346, -1.313275, 1, 0.1215686, 0, 1,
-2.007353, -1.120674, -1.738879, 1, 0.1254902, 0, 1,
-1.994065, 0.8652337, -1.736888, 1, 0.1333333, 0, 1,
-1.974156, -0.3283351, -3.452897, 1, 0.1372549, 0, 1,
-1.971395, 0.6807773, -0.7019355, 1, 0.145098, 0, 1,
-1.948322, -1.273923, -4.129048, 1, 0.1490196, 0, 1,
-1.945, -0.1472955, -2.491405, 1, 0.1568628, 0, 1,
-1.933884, 0.07117665, -2.400131, 1, 0.1607843, 0, 1,
-1.899938, 0.5432916, -0.6207564, 1, 0.1686275, 0, 1,
-1.882149, 0.5122706, -0.7343595, 1, 0.172549, 0, 1,
-1.881653, -1.265567, -4.193173, 1, 0.1803922, 0, 1,
-1.877113, -0.03563385, -1.109973, 1, 0.1843137, 0, 1,
-1.873159, -0.5418586, -2.164696, 1, 0.1921569, 0, 1,
-1.86747, 0.05337834, -1.710828, 1, 0.1960784, 0, 1,
-1.819435, 0.2894421, -2.396373, 1, 0.2039216, 0, 1,
-1.805376, 0.4381431, 0.9600938, 1, 0.2117647, 0, 1,
-1.775171, -0.4803963, -1.680679, 1, 0.2156863, 0, 1,
-1.728986, -2.064371, -1.866019, 1, 0.2235294, 0, 1,
-1.715464, 0.3290116, -1.793501, 1, 0.227451, 0, 1,
-1.703357, -0.07050651, -1.555449, 1, 0.2352941, 0, 1,
-1.694169, -0.1172093, -1.180534, 1, 0.2392157, 0, 1,
-1.675334, 0.1143537, -2.558441, 1, 0.2470588, 0, 1,
-1.67436, -0.5169829, -1.074533, 1, 0.2509804, 0, 1,
-1.670188, -0.3019996, -2.37025, 1, 0.2588235, 0, 1,
-1.668324, -0.2974074, -1.206439, 1, 0.2627451, 0, 1,
-1.668223, -0.9122783, -0.7741623, 1, 0.2705882, 0, 1,
-1.658803, -0.7148702, -0.9615467, 1, 0.2745098, 0, 1,
-1.642501, -1.080246, -0.245505, 1, 0.282353, 0, 1,
-1.640389, 0.8313977, -1.007535, 1, 0.2862745, 0, 1,
-1.628417, -0.6497798, -2.842644, 1, 0.2941177, 0, 1,
-1.618204, 1.148988, -1.303836, 1, 0.3019608, 0, 1,
-1.593039, 0.3219421, -1.073571, 1, 0.3058824, 0, 1,
-1.556673, 0.4699346, -1.016933, 1, 0.3137255, 0, 1,
-1.548298, 0.5134329, -2.062379, 1, 0.3176471, 0, 1,
-1.526643, -0.3779523, -2.663048, 1, 0.3254902, 0, 1,
-1.51094, 0.7157791, -0.2491363, 1, 0.3294118, 0, 1,
-1.507616, -0.326518, -1.160529, 1, 0.3372549, 0, 1,
-1.50507, 0.2670893, 0.06254046, 1, 0.3411765, 0, 1,
-1.480784, 0.2202564, -0.3076349, 1, 0.3490196, 0, 1,
-1.465189, -0.2324809, -0.9416608, 1, 0.3529412, 0, 1,
-1.452787, 0.00107391, -2.132733, 1, 0.3607843, 0, 1,
-1.452306, -0.6598319, -0.4306732, 1, 0.3647059, 0, 1,
-1.44137, -0.5431402, -2.198216, 1, 0.372549, 0, 1,
-1.438308, -0.6317314, -1.808227, 1, 0.3764706, 0, 1,
-1.430891, -1.939648, -1.492632, 1, 0.3843137, 0, 1,
-1.429375, 0.009823393, -1.901204, 1, 0.3882353, 0, 1,
-1.425451, -1.355702, -1.55789, 1, 0.3960784, 0, 1,
-1.421981, 0.0867358, -0.4340079, 1, 0.4039216, 0, 1,
-1.40814, 0.2430584, -1.848365, 1, 0.4078431, 0, 1,
-1.405106, 0.2461992, -1.959306, 1, 0.4156863, 0, 1,
-1.389193, -1.068318, -1.577432, 1, 0.4196078, 0, 1,
-1.387065, -1.302386, -1.223913, 1, 0.427451, 0, 1,
-1.383216, 1.344907, -1.355391, 1, 0.4313726, 0, 1,
-1.382844, -0.1008029, -2.727047, 1, 0.4392157, 0, 1,
-1.376015, -0.07929041, -0.6499134, 1, 0.4431373, 0, 1,
-1.359031, 2.25757, 0.003933829, 1, 0.4509804, 0, 1,
-1.351352, -1.211537, -1.661385, 1, 0.454902, 0, 1,
-1.340819, 0.6549274, -1.072921, 1, 0.4627451, 0, 1,
-1.339143, 0.2365818, -1.439237, 1, 0.4666667, 0, 1,
-1.338095, 0.4402532, -1.601435, 1, 0.4745098, 0, 1,
-1.334408, -0.5136741, -1.816182, 1, 0.4784314, 0, 1,
-1.324797, -1.634023, -4.2367, 1, 0.4862745, 0, 1,
-1.323229, -0.5809519, -1.231143, 1, 0.4901961, 0, 1,
-1.321396, -0.4125393, -4.19283, 1, 0.4980392, 0, 1,
-1.31819, -0.9107237, -4.633945, 1, 0.5058824, 0, 1,
-1.312835, -0.9600983, -3.048618, 1, 0.509804, 0, 1,
-1.31044, 0.5878219, -2.47603, 1, 0.5176471, 0, 1,
-1.299615, -0.1843801, -1.798926, 1, 0.5215687, 0, 1,
-1.298562, -1.36428, -2.585996, 1, 0.5294118, 0, 1,
-1.297851, -1.20525, -2.510627, 1, 0.5333334, 0, 1,
-1.288216, -2.169322, -2.395659, 1, 0.5411765, 0, 1,
-1.277135, 0.01842298, -0.7556505, 1, 0.5450981, 0, 1,
-1.26716, -1.243401, -3.014571, 1, 0.5529412, 0, 1,
-1.257547, -0.05163359, -3.437346, 1, 0.5568628, 0, 1,
-1.256178, -0.6326381, -0.9571306, 1, 0.5647059, 0, 1,
-1.25491, 0.4114849, -2.681189, 1, 0.5686275, 0, 1,
-1.246451, -1.435116, -2.754112, 1, 0.5764706, 0, 1,
-1.236165, -0.77408, -1.090149, 1, 0.5803922, 0, 1,
-1.234852, 0.111556, -1.102239, 1, 0.5882353, 0, 1,
-1.230964, -0.8482473, 0.01856416, 1, 0.5921569, 0, 1,
-1.197431, -0.8734421, -1.914939, 1, 0.6, 0, 1,
-1.194747, -2.197925, -2.454345, 1, 0.6078432, 0, 1,
-1.19473, 0.8113465, -0.9218022, 1, 0.6117647, 0, 1,
-1.193083, -0.64929, -3.372702, 1, 0.6196079, 0, 1,
-1.187323, 0.1038153, -2.614843, 1, 0.6235294, 0, 1,
-1.18501, -0.3889757, -2.152129, 1, 0.6313726, 0, 1,
-1.18107, 0.6420437, 0.4169552, 1, 0.6352941, 0, 1,
-1.177101, 0.3856991, -1.708719, 1, 0.6431373, 0, 1,
-1.173727, -1.567616, -3.58955, 1, 0.6470588, 0, 1,
-1.167053, -1.338476, -0.8221998, 1, 0.654902, 0, 1,
-1.162653, 0.1266384, -1.148998, 1, 0.6588235, 0, 1,
-1.161498, -0.05203464, -2.571904, 1, 0.6666667, 0, 1,
-1.157524, 0.6576476, -1.367289, 1, 0.6705883, 0, 1,
-1.151709, 0.7917892, -2.635192, 1, 0.6784314, 0, 1,
-1.14564, -0.0554902, -1.753904, 1, 0.682353, 0, 1,
-1.140064, -0.2604635, -2.206296, 1, 0.6901961, 0, 1,
-1.130402, 1.526714, -0.7917227, 1, 0.6941177, 0, 1,
-1.106114, -0.1570605, -0.535032, 1, 0.7019608, 0, 1,
-1.10296, -1.691915, -2.782238, 1, 0.7098039, 0, 1,
-1.102325, -0.6824069, -2.701109, 1, 0.7137255, 0, 1,
-1.09921, -1.52015, -2.884303, 1, 0.7215686, 0, 1,
-1.098722, 0.2434131, -0.976974, 1, 0.7254902, 0, 1,
-1.094783, -0.3017044, -2.049346, 1, 0.7333333, 0, 1,
-1.093654, -0.9065908, -0.8048199, 1, 0.7372549, 0, 1,
-1.087379, -0.3023624, -1.453721, 1, 0.7450981, 0, 1,
-1.082419, 0.3108394, -1.659028, 1, 0.7490196, 0, 1,
-1.081281, -0.5880852, -4.011922, 1, 0.7568628, 0, 1,
-1.073507, 0.2626655, -1.026649, 1, 0.7607843, 0, 1,
-1.071847, -0.4864502, -1.19322, 1, 0.7686275, 0, 1,
-1.067284, -1.008778, -2.340435, 1, 0.772549, 0, 1,
-1.063792, 0.02338766, 0.0264363, 1, 0.7803922, 0, 1,
-1.056237, 0.7127366, -1.906527, 1, 0.7843137, 0, 1,
-1.055202, 1.732059, -0.1736696, 1, 0.7921569, 0, 1,
-1.053588, 0.5159418, -1.652299, 1, 0.7960784, 0, 1,
-1.053501, -0.4480266, -2.688746, 1, 0.8039216, 0, 1,
-1.051396, -2.680602, -5.55802, 1, 0.8117647, 0, 1,
-1.045498, 1.813505, 0.6745993, 1, 0.8156863, 0, 1,
-1.044408, 0.3531455, -1.417644, 1, 0.8235294, 0, 1,
-1.041852, 0.480738, -2.275094, 1, 0.827451, 0, 1,
-1.034933, 1.009341, -1.678529, 1, 0.8352941, 0, 1,
-1.034127, 0.7353213, -0.57098, 1, 0.8392157, 0, 1,
-1.029639, -0.9876948, -2.198309, 1, 0.8470588, 0, 1,
-1.023029, 0.2535571, -3.764316, 1, 0.8509804, 0, 1,
-1.017209, 0.5075022, -0.4974344, 1, 0.8588235, 0, 1,
-1.012841, 0.4578244, -0.4095266, 1, 0.8627451, 0, 1,
-1.012827, -0.857711, -2.329556, 1, 0.8705882, 0, 1,
-1.011632, 3.442687, -2.817982, 1, 0.8745098, 0, 1,
-1.009411, -0.399575, -0.8446041, 1, 0.8823529, 0, 1,
-1.008819, 1.221228, 0.3309587, 1, 0.8862745, 0, 1,
-1.007014, 1.491654, -0.1035279, 1, 0.8941177, 0, 1,
-1.00582, 1.449528, -0.7415816, 1, 0.8980392, 0, 1,
-1.00166, 0.791617, -0.9338165, 1, 0.9058824, 0, 1,
-1.001451, -2.23386, -2.171883, 1, 0.9137255, 0, 1,
-0.9985104, 1.479206, -2.833872, 1, 0.9176471, 0, 1,
-0.9903123, -1.649456, -4.643213, 1, 0.9254902, 0, 1,
-0.9823608, 0.01889258, -1.939045, 1, 0.9294118, 0, 1,
-0.9800013, -0.4743772, -1.018792, 1, 0.9372549, 0, 1,
-0.9786396, -1.400227, -2.222216, 1, 0.9411765, 0, 1,
-0.9774012, -1.975379, -3.678515, 1, 0.9490196, 0, 1,
-0.9773912, 0.4649343, -0.265674, 1, 0.9529412, 0, 1,
-0.9757275, -0.2291011, -1.15611, 1, 0.9607843, 0, 1,
-0.9694178, 0.8204904, -0.7834143, 1, 0.9647059, 0, 1,
-0.9625239, -0.8512889, -2.648258, 1, 0.972549, 0, 1,
-0.961524, -1.565869, -3.76935, 1, 0.9764706, 0, 1,
-0.9535705, -0.3026747, -1.15161, 1, 0.9843137, 0, 1,
-0.9500649, 0.07413913, -3.27406, 1, 0.9882353, 0, 1,
-0.9481212, 0.1062817, -2.16675, 1, 0.9960784, 0, 1,
-0.9471927, -0.2207215, -2.572781, 0.9960784, 1, 0, 1,
-0.9424411, 2.80724, 0.4085681, 0.9921569, 1, 0, 1,
-0.9313488, -0.7237599, -1.459402, 0.9843137, 1, 0, 1,
-0.9169391, -1.672698, -2.570848, 0.9803922, 1, 0, 1,
-0.9071594, 0.6268297, -1.318358, 0.972549, 1, 0, 1,
-0.8986885, -0.7902097, -3.47776, 0.9686275, 1, 0, 1,
-0.8916467, 0.4696189, -3.77525, 0.9607843, 1, 0, 1,
-0.8875264, 1.573366, -0.5508802, 0.9568627, 1, 0, 1,
-0.8835495, 1.62661, -1.062211, 0.9490196, 1, 0, 1,
-0.86947, 1.492607, -0.2547127, 0.945098, 1, 0, 1,
-0.8665825, 0.5892693, -1.190554, 0.9372549, 1, 0, 1,
-0.8644092, 1.142606, -1.590335, 0.9333333, 1, 0, 1,
-0.8598605, 0.9783475, -0.8915029, 0.9254902, 1, 0, 1,
-0.8507285, 2.429334, -0.5312013, 0.9215686, 1, 0, 1,
-0.8480135, -0.3773948, -1.910972, 0.9137255, 1, 0, 1,
-0.8455067, 1.801833, 1.421439, 0.9098039, 1, 0, 1,
-0.8330749, -0.03231254, -3.664711, 0.9019608, 1, 0, 1,
-0.8311687, 0.2051216, -2.142977, 0.8941177, 1, 0, 1,
-0.8308447, 0.566179, -1.976425, 0.8901961, 1, 0, 1,
-0.8303162, -0.2816779, -1.935145, 0.8823529, 1, 0, 1,
-0.8283814, 0.5217111, -2.102654, 0.8784314, 1, 0, 1,
-0.8264645, 1.365832, -0.5117939, 0.8705882, 1, 0, 1,
-0.8220205, -0.8221633, -0.6935034, 0.8666667, 1, 0, 1,
-0.8179901, -0.6446387, -2.196837, 0.8588235, 1, 0, 1,
-0.8146296, 0.431197, -1.508261, 0.854902, 1, 0, 1,
-0.8139579, 0.662517, -0.4558271, 0.8470588, 1, 0, 1,
-0.8138154, -2.729894, -2.949543, 0.8431373, 1, 0, 1,
-0.8108164, 2.389544, -1.382735, 0.8352941, 1, 0, 1,
-0.8070688, -1.239664, -3.135684, 0.8313726, 1, 0, 1,
-0.802786, 0.7181687, -0.2592339, 0.8235294, 1, 0, 1,
-0.8003317, -0.227182, -1.898695, 0.8196079, 1, 0, 1,
-0.79997, -0.6341949, -1.869784, 0.8117647, 1, 0, 1,
-0.7855844, 1.213093, -0.5396844, 0.8078431, 1, 0, 1,
-0.7774509, 0.03728895, -0.1593155, 0.8, 1, 0, 1,
-0.7774047, -0.399992, -0.5948468, 0.7921569, 1, 0, 1,
-0.7733939, 0.495064, -1.067191, 0.7882353, 1, 0, 1,
-0.7677291, -0.01752414, -0.7540244, 0.7803922, 1, 0, 1,
-0.7659194, -0.7198088, -1.665964, 0.7764706, 1, 0, 1,
-0.7631804, 1.078496, -1.759537, 0.7686275, 1, 0, 1,
-0.7605407, -1.94232, -1.666938, 0.7647059, 1, 0, 1,
-0.755451, -0.3760616, -4.734917, 0.7568628, 1, 0, 1,
-0.7546156, -1.394385, -5.835667, 0.7529412, 1, 0, 1,
-0.7535202, 0.589926, -3.003019, 0.7450981, 1, 0, 1,
-0.7517157, -0.2766226, -2.303173, 0.7411765, 1, 0, 1,
-0.7488101, 2.465201, 0.4621592, 0.7333333, 1, 0, 1,
-0.7486996, 1.668427, 1.27963, 0.7294118, 1, 0, 1,
-0.7458135, -0.2787761, -0.4648798, 0.7215686, 1, 0, 1,
-0.7434579, -1.660714, -4.263146, 0.7176471, 1, 0, 1,
-0.7433398, 0.6088618, -1.600669, 0.7098039, 1, 0, 1,
-0.7409369, 0.8507802, 0.06624743, 0.7058824, 1, 0, 1,
-0.7402333, -1.244899, -2.787183, 0.6980392, 1, 0, 1,
-0.7402271, 1.106753, -0.9050983, 0.6901961, 1, 0, 1,
-0.7365881, -0.01935533, -1.418533, 0.6862745, 1, 0, 1,
-0.7271424, -0.4610071, -2.823341, 0.6784314, 1, 0, 1,
-0.7268538, -1.673821, -1.705945, 0.6745098, 1, 0, 1,
-0.713074, -0.3220253, -2.954341, 0.6666667, 1, 0, 1,
-0.7101089, 1.002265, 0.3035325, 0.6627451, 1, 0, 1,
-0.6992821, -0.802939, -2.022929, 0.654902, 1, 0, 1,
-0.696048, 0.01685084, -1.644042, 0.6509804, 1, 0, 1,
-0.6958909, 1.358186, -1.719115, 0.6431373, 1, 0, 1,
-0.6953876, -0.9494202, -1.137888, 0.6392157, 1, 0, 1,
-0.6939437, -0.001761369, -1.513131, 0.6313726, 1, 0, 1,
-0.6897273, -0.0847736, -0.9051321, 0.627451, 1, 0, 1,
-0.688438, 0.4714699, 0.3687123, 0.6196079, 1, 0, 1,
-0.6876937, 0.08886833, 0.1705172, 0.6156863, 1, 0, 1,
-0.6848081, 1.300061, -1.141932, 0.6078432, 1, 0, 1,
-0.674301, 0.2371319, -0.6192306, 0.6039216, 1, 0, 1,
-0.6740995, -0.8510966, -2.263153, 0.5960785, 1, 0, 1,
-0.6707388, -0.9881173, -3.069517, 0.5882353, 1, 0, 1,
-0.667183, 0.7143757, -0.6152266, 0.5843138, 1, 0, 1,
-0.6652162, 1.638641, -0.8555654, 0.5764706, 1, 0, 1,
-0.6611716, -2.214777, -4.735243, 0.572549, 1, 0, 1,
-0.6605139, 1.608029, 0.5327855, 0.5647059, 1, 0, 1,
-0.6562835, -1.280617, -2.51068, 0.5607843, 1, 0, 1,
-0.6561476, -0.7381356, -1.519245, 0.5529412, 1, 0, 1,
-0.6504118, -0.446725, -4.267248, 0.5490196, 1, 0, 1,
-0.6481595, 0.5660195, -1.332348, 0.5411765, 1, 0, 1,
-0.6473726, 1.541598, -0.6566263, 0.5372549, 1, 0, 1,
-0.646896, 0.2925206, -0.9095446, 0.5294118, 1, 0, 1,
-0.6442493, -0.2641542, -1.422733, 0.5254902, 1, 0, 1,
-0.6428975, 0.5429084, -1.104954, 0.5176471, 1, 0, 1,
-0.6405039, -0.2202512, -3.400387, 0.5137255, 1, 0, 1,
-0.6404956, -0.317566, -0.8776317, 0.5058824, 1, 0, 1,
-0.6384865, -1.310687, -1.936928, 0.5019608, 1, 0, 1,
-0.6366593, -0.9183369, -1.795092, 0.4941176, 1, 0, 1,
-0.6360542, 0.5206529, -0.6547518, 0.4862745, 1, 0, 1,
-0.6350053, -0.6087407, -2.680931, 0.4823529, 1, 0, 1,
-0.6348046, 1.328368, 0.5552242, 0.4745098, 1, 0, 1,
-0.6222223, 0.731205, 1.121444, 0.4705882, 1, 0, 1,
-0.6217232, 0.4551202, -1.660586, 0.4627451, 1, 0, 1,
-0.6179818, 0.631671, -2.45602, 0.4588235, 1, 0, 1,
-0.6159971, 0.8671752, 0.6226383, 0.4509804, 1, 0, 1,
-0.6141341, -1.694148, -1.851712, 0.4470588, 1, 0, 1,
-0.6138391, 0.6452569, 0.3791175, 0.4392157, 1, 0, 1,
-0.6101271, -1.067287, -2.22826, 0.4352941, 1, 0, 1,
-0.6078703, 0.2989059, -2.016932, 0.427451, 1, 0, 1,
-0.603712, -1.719401, -2.489951, 0.4235294, 1, 0, 1,
-0.6012468, -1.024305, -3.665133, 0.4156863, 1, 0, 1,
-0.6006159, 1.651687, 0.3162431, 0.4117647, 1, 0, 1,
-0.5998338, 2.120966, -0.7225605, 0.4039216, 1, 0, 1,
-0.5982404, 0.02971923, 1.539654, 0.3960784, 1, 0, 1,
-0.5928171, 1.03093, 0.8800136, 0.3921569, 1, 0, 1,
-0.5924992, -1.253549, -3.263673, 0.3843137, 1, 0, 1,
-0.5899712, -0.4589022, -2.001346, 0.3803922, 1, 0, 1,
-0.5883737, -0.9943741, -4.059063, 0.372549, 1, 0, 1,
-0.5784448, -0.8980907, -1.827939, 0.3686275, 1, 0, 1,
-0.5742094, -1.209508, -2.985344, 0.3607843, 1, 0, 1,
-0.5727367, 1.99351, -0.5440373, 0.3568628, 1, 0, 1,
-0.5639886, -1.530551, -2.161832, 0.3490196, 1, 0, 1,
-0.553762, -0.2687045, -3.053189, 0.345098, 1, 0, 1,
-0.5524332, -0.3696803, -2.859093, 0.3372549, 1, 0, 1,
-0.5519465, 0.6402191, -2.100639, 0.3333333, 1, 0, 1,
-0.5498784, -0.2135539, -1.867196, 0.3254902, 1, 0, 1,
-0.5486026, -2.702585, -2.37225, 0.3215686, 1, 0, 1,
-0.5471747, 0.1356434, -1.208386, 0.3137255, 1, 0, 1,
-0.5454631, -0.4341665, -1.079583, 0.3098039, 1, 0, 1,
-0.5422941, 0.5971983, -1.397546, 0.3019608, 1, 0, 1,
-0.5403215, -1.408445, -3.350805, 0.2941177, 1, 0, 1,
-0.5390365, 0.758732, -1.668707, 0.2901961, 1, 0, 1,
-0.5362408, -0.4521029, -3.207132, 0.282353, 1, 0, 1,
-0.5356302, -1.404458, -3.404003, 0.2784314, 1, 0, 1,
-0.5346361, 0.7044394, -1.191826, 0.2705882, 1, 0, 1,
-0.5284981, -0.4788273, -1.358505, 0.2666667, 1, 0, 1,
-0.5283397, 0.6704198, -0.6895244, 0.2588235, 1, 0, 1,
-0.5263618, 2.053337, 0.1417352, 0.254902, 1, 0, 1,
-0.5257779, -0.9996106, -2.649384, 0.2470588, 1, 0, 1,
-0.5230903, 1.049689, -1.141072, 0.2431373, 1, 0, 1,
-0.5217055, -0.2597829, -2.484713, 0.2352941, 1, 0, 1,
-0.5210627, -0.3494409, -1.029122, 0.2313726, 1, 0, 1,
-0.520174, -1.559581, -2.55416, 0.2235294, 1, 0, 1,
-0.5201474, -0.3160681, -1.697783, 0.2196078, 1, 0, 1,
-0.5200484, 1.389331, -0.4981149, 0.2117647, 1, 0, 1,
-0.5198313, -0.5332718, -3.286309, 0.2078431, 1, 0, 1,
-0.5196533, -0.9012839, -3.486769, 0.2, 1, 0, 1,
-0.5173308, -0.3827035, -1.513835, 0.1921569, 1, 0, 1,
-0.5132725, -0.2279563, -1.881778, 0.1882353, 1, 0, 1,
-0.5122113, 0.3861049, -1.556006, 0.1803922, 1, 0, 1,
-0.5099986, 1.998328, -0.01507123, 0.1764706, 1, 0, 1,
-0.5098845, -1.609809, -3.178551, 0.1686275, 1, 0, 1,
-0.5064042, 0.01003999, -2.040445, 0.1647059, 1, 0, 1,
-0.5051131, 0.0836276, 0.3142711, 0.1568628, 1, 0, 1,
-0.5028433, 0.4304028, -1.699218, 0.1529412, 1, 0, 1,
-0.49934, -1.955222, -1.581681, 0.145098, 1, 0, 1,
-0.4977191, 0.4252252, -1.907209, 0.1411765, 1, 0, 1,
-0.4954703, 1.546154, 1.673754, 0.1333333, 1, 0, 1,
-0.485884, -0.4521569, -2.920063, 0.1294118, 1, 0, 1,
-0.4851361, -1.138542, -3.751147, 0.1215686, 1, 0, 1,
-0.4829302, -2.463075, -3.581835, 0.1176471, 1, 0, 1,
-0.4644399, 1.462856, 0.7368627, 0.1098039, 1, 0, 1,
-0.4641061, -0.2284509, -3.385259, 0.1058824, 1, 0, 1,
-0.4624416, 1.423537, 0.2881727, 0.09803922, 1, 0, 1,
-0.4604939, 1.226674, -0.8900359, 0.09019608, 1, 0, 1,
-0.459738, -1.411423, -4.865886, 0.08627451, 1, 0, 1,
-0.4585475, -1.686813, -2.387513, 0.07843138, 1, 0, 1,
-0.4565176, 0.3975077, -0.9683128, 0.07450981, 1, 0, 1,
-0.4559689, 0.03895983, -0.9520898, 0.06666667, 1, 0, 1,
-0.4542036, -1.739199, -2.180171, 0.0627451, 1, 0, 1,
-0.4499608, 1.327616, -0.311964, 0.05490196, 1, 0, 1,
-0.4424647, -0.3385477, -0.5418205, 0.05098039, 1, 0, 1,
-0.4411802, -0.7722044, -3.775171, 0.04313726, 1, 0, 1,
-0.4406795, -0.5188711, -2.93359, 0.03921569, 1, 0, 1,
-0.4312738, 1.095332, -1.342477, 0.03137255, 1, 0, 1,
-0.42938, 1.283355, 0.5475712, 0.02745098, 1, 0, 1,
-0.4280236, -1.09336, -1.725665, 0.01960784, 1, 0, 1,
-0.4260031, -0.618988, -1.992796, 0.01568628, 1, 0, 1,
-0.4244123, 0.1993681, 1.032879, 0.007843138, 1, 0, 1,
-0.4175751, 0.8252088, -1.769073, 0.003921569, 1, 0, 1,
-0.4128766, 0.00772107, -1.270278, 0, 1, 0.003921569, 1,
-0.3895093, -0.5638115, -3.435352, 0, 1, 0.01176471, 1,
-0.3843144, 0.3630788, 0.5734904, 0, 1, 0.01568628, 1,
-0.3831931, -2.713735, -3.706993, 0, 1, 0.02352941, 1,
-0.3830893, -0.9156808, -6.045836, 0, 1, 0.02745098, 1,
-0.3825356, -0.9987656, -2.988594, 0, 1, 0.03529412, 1,
-0.3783008, -0.8754497, -2.91836, 0, 1, 0.03921569, 1,
-0.3772788, 1.367409, -0.1728369, 0, 1, 0.04705882, 1,
-0.3699246, 0.4151921, -0.4912876, 0, 1, 0.05098039, 1,
-0.3681575, -0.03080436, -0.8802698, 0, 1, 0.05882353, 1,
-0.3645769, 0.4810759, -0.6529239, 0, 1, 0.0627451, 1,
-0.3617012, 0.4400506, 0.563749, 0, 1, 0.07058824, 1,
-0.3612827, 0.0004034218, -0.5271969, 0, 1, 0.07450981, 1,
-0.3541975, -0.4867526, -1.192883, 0, 1, 0.08235294, 1,
-0.3486035, -0.2556678, -2.020168, 0, 1, 0.08627451, 1,
-0.347661, 0.8385164, 0.4490263, 0, 1, 0.09411765, 1,
-0.3472922, -0.545031, -1.199406, 0, 1, 0.1019608, 1,
-0.3426096, 2.362031, 1.07318, 0, 1, 0.1058824, 1,
-0.3410503, 0.08550567, -2.002553, 0, 1, 0.1137255, 1,
-0.3386785, -0.2324835, -2.342137, 0, 1, 0.1176471, 1,
-0.3381392, -0.7618454, -3.145629, 0, 1, 0.1254902, 1,
-0.3343293, -0.6092562, -2.861499, 0, 1, 0.1294118, 1,
-0.3310604, -0.8222345, -2.532858, 0, 1, 0.1372549, 1,
-0.3279429, -1.068764, -3.505537, 0, 1, 0.1411765, 1,
-0.3267744, -0.4984858, -3.492148, 0, 1, 0.1490196, 1,
-0.3256411, -0.651218, -1.140389, 0, 1, 0.1529412, 1,
-0.3100301, 0.3117067, 0.8866012, 0, 1, 0.1607843, 1,
-0.3033141, -0.4581306, -2.984474, 0, 1, 0.1647059, 1,
-0.2977377, -0.8510499, -1.370108, 0, 1, 0.172549, 1,
-0.2954133, 0.8582042, -0.6785117, 0, 1, 0.1764706, 1,
-0.291558, 1.355486, -1.604739, 0, 1, 0.1843137, 1,
-0.2909464, -0.5116561, -4.152209, 0, 1, 0.1882353, 1,
-0.2885341, -0.0376621, -1.345213, 0, 1, 0.1960784, 1,
-0.287015, 1.120869, -0.4315848, 0, 1, 0.2039216, 1,
-0.2859557, -0.02099193, -3.855465, 0, 1, 0.2078431, 1,
-0.284836, 1.354114, 0.3556906, 0, 1, 0.2156863, 1,
-0.2840884, 0.1439922, -2.094606, 0, 1, 0.2196078, 1,
-0.2834916, -0.05604185, 0.0002676172, 0, 1, 0.227451, 1,
-0.2821506, 0.08496747, -0.1872053, 0, 1, 0.2313726, 1,
-0.2768728, 0.2643644, -0.2100336, 0, 1, 0.2392157, 1,
-0.2748342, -1.633594, -3.577667, 0, 1, 0.2431373, 1,
-0.2704103, -0.7698975, -2.412077, 0, 1, 0.2509804, 1,
-0.2700604, 2.64603, -0.5481454, 0, 1, 0.254902, 1,
-0.259305, -1.288173, -3.126587, 0, 1, 0.2627451, 1,
-0.2572604, 0.4471181, -2.277374, 0, 1, 0.2666667, 1,
-0.2518936, -1.366629, -2.752066, 0, 1, 0.2745098, 1,
-0.251719, 0.00626572, -2.625506, 0, 1, 0.2784314, 1,
-0.250611, 0.5620854, -0.7558703, 0, 1, 0.2862745, 1,
-0.2495626, -0.1239516, -2.440026, 0, 1, 0.2901961, 1,
-0.2492752, 0.1262158, -1.06581, 0, 1, 0.2980392, 1,
-0.2480311, -0.06510612, -2.070705, 0, 1, 0.3058824, 1,
-0.2423868, 0.6531737, 0.2036741, 0, 1, 0.3098039, 1,
-0.2417244, 0.6847105, -0.03864046, 0, 1, 0.3176471, 1,
-0.2395103, 0.5418413, -1.689845, 0, 1, 0.3215686, 1,
-0.2366111, 1.697953, -1.556673, 0, 1, 0.3294118, 1,
-0.2363312, 1.026118, 1.994574, 0, 1, 0.3333333, 1,
-0.2323624, 0.6831797, -0.4211275, 0, 1, 0.3411765, 1,
-0.2303498, -1.100816, -1.311623, 0, 1, 0.345098, 1,
-0.225104, -1.620148, -2.772912, 0, 1, 0.3529412, 1,
-0.2201075, -1.165161, -3.089026, 0, 1, 0.3568628, 1,
-0.2189473, 0.3141679, -0.7041159, 0, 1, 0.3647059, 1,
-0.218086, -0.2679031, -1.522388, 0, 1, 0.3686275, 1,
-0.2120562, -0.6213392, -3.021741, 0, 1, 0.3764706, 1,
-0.209691, -0.007978406, -2.599631, 0, 1, 0.3803922, 1,
-0.2084444, -1.285265, -3.698573, 0, 1, 0.3882353, 1,
-0.2084045, -1.474263, -2.233761, 0, 1, 0.3921569, 1,
-0.2055879, 0.06582156, -2.378332, 0, 1, 0.4, 1,
-0.201204, 2.256188, -1.106788, 0, 1, 0.4078431, 1,
-0.1998881, -0.4961011, -2.672511, 0, 1, 0.4117647, 1,
-0.194768, -0.3639541, -0.979964, 0, 1, 0.4196078, 1,
-0.1942668, 0.8942036, -1.839794, 0, 1, 0.4235294, 1,
-0.1933908, 0.9626586, -0.6339124, 0, 1, 0.4313726, 1,
-0.1895156, 0.4187492, 0.5414513, 0, 1, 0.4352941, 1,
-0.1888577, 0.04850448, -1.508984, 0, 1, 0.4431373, 1,
-0.1874679, -1.952786, -3.040622, 0, 1, 0.4470588, 1,
-0.185935, 0.6987382, -0.3482927, 0, 1, 0.454902, 1,
-0.1838915, 1.234518, 0.2252012, 0, 1, 0.4588235, 1,
-0.1831819, -1.222655, -2.700942, 0, 1, 0.4666667, 1,
-0.1801621, -0.7808343, -3.175893, 0, 1, 0.4705882, 1,
-0.1791989, 0.005498287, -1.634443, 0, 1, 0.4784314, 1,
-0.17663, -1.443613, -3.130903, 0, 1, 0.4823529, 1,
-0.1744301, 0.3268376, -0.2612835, 0, 1, 0.4901961, 1,
-0.1647911, -1.183317, -3.678708, 0, 1, 0.4941176, 1,
-0.1646469, 0.09987292, 0.181724, 0, 1, 0.5019608, 1,
-0.1646382, 0.9042785, -0.5199524, 0, 1, 0.509804, 1,
-0.16095, 0.1276191, -1.294212, 0, 1, 0.5137255, 1,
-0.1547651, 0.8517605, -0.353852, 0, 1, 0.5215687, 1,
-0.1509505, 0.6297791, -0.08306217, 0, 1, 0.5254902, 1,
-0.1506286, 1.149138, -1.315891, 0, 1, 0.5333334, 1,
-0.1469423, -1.200526, -3.218426, 0, 1, 0.5372549, 1,
-0.1468834, 2.041027, 1.23283, 0, 1, 0.5450981, 1,
-0.1447022, 1.003841, -0.2726306, 0, 1, 0.5490196, 1,
-0.1427371, 0.02761455, -1.842721, 0, 1, 0.5568628, 1,
-0.1418242, -1.214387, -3.678972, 0, 1, 0.5607843, 1,
-0.1404224, -0.5693134, -4.010228, 0, 1, 0.5686275, 1,
-0.1355798, -1.240089, -4.099736, 0, 1, 0.572549, 1,
-0.1300177, 0.7586464, 0.2718304, 0, 1, 0.5803922, 1,
-0.1265365, -0.6335377, -5.216868, 0, 1, 0.5843138, 1,
-0.1210912, 1.616048, -1.228788, 0, 1, 0.5921569, 1,
-0.1192604, -0.851735, -3.447791, 0, 1, 0.5960785, 1,
-0.1180659, 1.586411, 0.3812909, 0, 1, 0.6039216, 1,
-0.1155742, 1.678896, -1.278952, 0, 1, 0.6117647, 1,
-0.1147027, 1.193111, -0.7418992, 0, 1, 0.6156863, 1,
-0.1130307, -2.545865, -2.975965, 0, 1, 0.6235294, 1,
-0.1104814, -0.2802891, -3.116676, 0, 1, 0.627451, 1,
-0.1095979, -1.047443, -3.692602, 0, 1, 0.6352941, 1,
-0.1066835, 0.7196583, -1.18741, 0, 1, 0.6392157, 1,
-0.104994, 0.09251471, -1.19564, 0, 1, 0.6470588, 1,
-0.1049402, -0.9289967, -3.742263, 0, 1, 0.6509804, 1,
-0.1049179, -1.378544, -0.8864032, 0, 1, 0.6588235, 1,
-0.0999616, 0.7733335, -1.565526, 0, 1, 0.6627451, 1,
-0.09958486, 1.219554, 0.01066716, 0, 1, 0.6705883, 1,
-0.09759209, -1.524714, -2.595225, 0, 1, 0.6745098, 1,
-0.09361468, 1.782226, -0.5901945, 0, 1, 0.682353, 1,
-0.08904546, 0.2294141, 1.068003, 0, 1, 0.6862745, 1,
-0.08482835, 0.366383, 0.9713698, 0, 1, 0.6941177, 1,
-0.08302946, 0.9394791, -0.5128258, 0, 1, 0.7019608, 1,
-0.07875011, 2.378258, -0.2128173, 0, 1, 0.7058824, 1,
-0.07714463, -1.813749, -3.676597, 0, 1, 0.7137255, 1,
-0.0762035, -0.05358221, -2.322378, 0, 1, 0.7176471, 1,
-0.07418533, 1.567949, 0.4808375, 0, 1, 0.7254902, 1,
-0.06011882, 0.6364132, -0.1556859, 0, 1, 0.7294118, 1,
-0.05873012, -0.8319927, -3.56109, 0, 1, 0.7372549, 1,
-0.05521214, 0.9242136, 3.479657, 0, 1, 0.7411765, 1,
-0.0499296, -0.1722532, -3.158528, 0, 1, 0.7490196, 1,
-0.04256351, -0.8114835, -3.081065, 0, 1, 0.7529412, 1,
-0.04236988, 0.7171288, 0.1678504, 0, 1, 0.7607843, 1,
-0.03920362, 0.4812664, 0.3160648, 0, 1, 0.7647059, 1,
-0.03718746, -0.5752429, -3.753497, 0, 1, 0.772549, 1,
-0.0369628, -1.568542, -4.912896, 0, 1, 0.7764706, 1,
-0.03526816, 0.8094612, 1.096024, 0, 1, 0.7843137, 1,
-0.03471307, -0.9750838, -4.254445, 0, 1, 0.7882353, 1,
-0.03079676, 1.262485, 0.5190107, 0, 1, 0.7960784, 1,
-0.03036329, -0.7167256, -2.845232, 0, 1, 0.8039216, 1,
-0.02993458, 0.1053457, -1.047775, 0, 1, 0.8078431, 1,
-0.02955927, 0.2710387, 0.3195922, 0, 1, 0.8156863, 1,
-0.0278734, 0.193729, 0.04283936, 0, 1, 0.8196079, 1,
-0.02585634, 0.3216848, -2.093617, 0, 1, 0.827451, 1,
-0.02476446, 1.548185, 0.725244, 0, 1, 0.8313726, 1,
-0.01858798, 1.149322, -0.2482933, 0, 1, 0.8392157, 1,
-0.01164632, -0.3424376, -1.205968, 0, 1, 0.8431373, 1,
-0.0111829, 0.8606045, -0.7036158, 0, 1, 0.8509804, 1,
-0.006965017, 1.318006, 1.864203, 0, 1, 0.854902, 1,
-0.005886433, 0.212372, 0.9403889, 0, 1, 0.8627451, 1,
0.001018752, 1.950221, -0.1791254, 0, 1, 0.8666667, 1,
0.002495751, -0.6791827, 2.767466, 0, 1, 0.8745098, 1,
0.003788708, -0.2429535, 3.730604, 0, 1, 0.8784314, 1,
0.004141088, -0.3394767, 3.706729, 0, 1, 0.8862745, 1,
0.01107531, -0.4909871, 2.173384, 0, 1, 0.8901961, 1,
0.01207236, 0.1379462, -1.716227, 0, 1, 0.8980392, 1,
0.01395884, 0.2296289, -0.1420285, 0, 1, 0.9058824, 1,
0.01564325, 0.5479043, 0.267695, 0, 1, 0.9098039, 1,
0.01651114, -2.664536, 2.619536, 0, 1, 0.9176471, 1,
0.01830963, -0.5670708, 2.864953, 0, 1, 0.9215686, 1,
0.0194178, 0.1595326, 1.042818, 0, 1, 0.9294118, 1,
0.02271667, 2.273152, 0.8231797, 0, 1, 0.9333333, 1,
0.02808903, -1.884698, 1.976578, 0, 1, 0.9411765, 1,
0.03141448, 0.237763, 0.2697702, 0, 1, 0.945098, 1,
0.03325374, -2.015596, 4.48523, 0, 1, 0.9529412, 1,
0.03844962, 0.5772011, -0.4941408, 0, 1, 0.9568627, 1,
0.04123567, 1.197984, -1.33602, 0, 1, 0.9647059, 1,
0.0428577, 1.338096, -0.3552105, 0, 1, 0.9686275, 1,
0.04689457, -1.531884, 3.100691, 0, 1, 0.9764706, 1,
0.0484311, -0.3014256, 4.816789, 0, 1, 0.9803922, 1,
0.05072665, 0.2874572, 0.5930666, 0, 1, 0.9882353, 1,
0.05502689, 0.3358572, 0.6797232, 0, 1, 0.9921569, 1,
0.05544637, -0.5790086, 2.724906, 0, 1, 1, 1,
0.05767487, -1.25871, 2.492468, 0, 0.9921569, 1, 1,
0.06747007, -0.9386626, 3.322432, 0, 0.9882353, 1, 1,
0.06792834, 1.447827, 1.875123, 0, 0.9803922, 1, 1,
0.07110063, -1.474957, 3.135958, 0, 0.9764706, 1, 1,
0.07160889, 1.423068, 0.7200546, 0, 0.9686275, 1, 1,
0.07407612, 1.26324, -0.7677544, 0, 0.9647059, 1, 1,
0.07469156, -0.509686, 1.107365, 0, 0.9568627, 1, 1,
0.07701124, -0.9255772, 4.058337, 0, 0.9529412, 1, 1,
0.07726684, 0.3404827, -0.8919002, 0, 0.945098, 1, 1,
0.08026652, -0.5233796, 1.293494, 0, 0.9411765, 1, 1,
0.08389089, 1.134751, 0.5437362, 0, 0.9333333, 1, 1,
0.08980315, -1.390166, 3.824436, 0, 0.9294118, 1, 1,
0.09178231, -0.3000335, 3.202305, 0, 0.9215686, 1, 1,
0.09487695, -1.017696, 4.30059, 0, 0.9176471, 1, 1,
0.09547108, -0.8692566, 2.718672, 0, 0.9098039, 1, 1,
0.09865852, -0.268893, 2.648284, 0, 0.9058824, 1, 1,
0.09915294, -0.3037466, 1.664506, 0, 0.8980392, 1, 1,
0.103653, -0.9129716, 0.8148884, 0, 0.8901961, 1, 1,
0.1037407, -0.2386754, 1.813203, 0, 0.8862745, 1, 1,
0.1039827, 0.8636557, -0.4100876, 0, 0.8784314, 1, 1,
0.1124518, 0.1893057, 1.603062, 0, 0.8745098, 1, 1,
0.1140785, 1.293794, 0.6746948, 0, 0.8666667, 1, 1,
0.1157915, -0.6109194, 2.486172, 0, 0.8627451, 1, 1,
0.1163417, -1.358793, 2.984829, 0, 0.854902, 1, 1,
0.1205542, 1.896959, 0.6041819, 0, 0.8509804, 1, 1,
0.1217201, -0.7231219, 4.44894, 0, 0.8431373, 1, 1,
0.1231809, 0.0319823, 0.9145215, 0, 0.8392157, 1, 1,
0.1289922, -2.173141, 2.917464, 0, 0.8313726, 1, 1,
0.1296368, -1.208184, 2.975157, 0, 0.827451, 1, 1,
0.1312612, -0.1029604, 3.391218, 0, 0.8196079, 1, 1,
0.1362362, -0.4761837, 3.355346, 0, 0.8156863, 1, 1,
0.1450009, 1.609979, -1.303241, 0, 0.8078431, 1, 1,
0.1451948, -1.571165, 4.237965, 0, 0.8039216, 1, 1,
0.15145, -0.1010079, 1.53741, 0, 0.7960784, 1, 1,
0.1524467, -1.116453, 3.786703, 0, 0.7882353, 1, 1,
0.1563848, 1.389943, -0.3024297, 0, 0.7843137, 1, 1,
0.1586014, -0.2906664, 2.395081, 0, 0.7764706, 1, 1,
0.1599819, 1.607798, 0.0600572, 0, 0.772549, 1, 1,
0.1621088, -1.379344, 0.6098408, 0, 0.7647059, 1, 1,
0.1630008, -0.3206753, 3.793703, 0, 0.7607843, 1, 1,
0.1635344, -0.5817259, 3.649019, 0, 0.7529412, 1, 1,
0.1646517, 0.01611414, 2.16966, 0, 0.7490196, 1, 1,
0.1654277, -0.02646414, -0.3594432, 0, 0.7411765, 1, 1,
0.1663116, 0.5838339, 1.656179, 0, 0.7372549, 1, 1,
0.1690712, -0.2697841, 3.467521, 0, 0.7294118, 1, 1,
0.1711389, 2.100836, 1.544287, 0, 0.7254902, 1, 1,
0.1750824, -0.9206994, 1.836391, 0, 0.7176471, 1, 1,
0.1757543, 0.5967196, -1.610344, 0, 0.7137255, 1, 1,
0.1758911, -1.135573, 1.642845, 0, 0.7058824, 1, 1,
0.179953, 0.3836706, -0.06096374, 0, 0.6980392, 1, 1,
0.1800834, 1.156531, 0.3706539, 0, 0.6941177, 1, 1,
0.1848602, 0.9711235, 0.05083835, 0, 0.6862745, 1, 1,
0.1862464, -0.2771988, 2.78431, 0, 0.682353, 1, 1,
0.1896117, -0.004899011, 1.77186, 0, 0.6745098, 1, 1,
0.1918953, -0.03130287, 2.916186, 0, 0.6705883, 1, 1,
0.1930318, 0.7489163, 0.5172989, 0, 0.6627451, 1, 1,
0.1996406, -1.742485, 2.07865, 0, 0.6588235, 1, 1,
0.2041218, -2.15038, 2.885083, 0, 0.6509804, 1, 1,
0.2051589, 0.1062361, 0.162194, 0, 0.6470588, 1, 1,
0.2052359, 1.349189, 0.7319179, 0, 0.6392157, 1, 1,
0.2058937, 0.6928362, -0.3768754, 0, 0.6352941, 1, 1,
0.2070336, -1.534892, 2.601375, 0, 0.627451, 1, 1,
0.2166308, -0.1880278, 1.377234, 0, 0.6235294, 1, 1,
0.2290834, 0.192235, -0.4354891, 0, 0.6156863, 1, 1,
0.2300648, -0.4965169, 2.980259, 0, 0.6117647, 1, 1,
0.2322158, -0.2428556, 1.866427, 0, 0.6039216, 1, 1,
0.232954, -0.8167845, 2.345962, 0, 0.5960785, 1, 1,
0.2332993, -0.06087952, 1.239059, 0, 0.5921569, 1, 1,
0.2333065, -1.376688, 3.885444, 0, 0.5843138, 1, 1,
0.2352061, -1.652787, 1.454631, 0, 0.5803922, 1, 1,
0.2364732, -0.6273125, 3.493052, 0, 0.572549, 1, 1,
0.2380134, 0.1690609, 1.452102, 0, 0.5686275, 1, 1,
0.2382129, 0.9299805, -0.2553137, 0, 0.5607843, 1, 1,
0.2383892, 0.09740321, -0.1269074, 0, 0.5568628, 1, 1,
0.2402536, -0.714312, 1.983785, 0, 0.5490196, 1, 1,
0.2408473, 0.8141355, -1.408437, 0, 0.5450981, 1, 1,
0.2424081, 2.099103, -0.442246, 0, 0.5372549, 1, 1,
0.2428314, -0.5566549, 3.073985, 0, 0.5333334, 1, 1,
0.2430951, -0.6093541, 1.456944, 0, 0.5254902, 1, 1,
0.2446942, -0.2153522, 1.672804, 0, 0.5215687, 1, 1,
0.245989, 0.2378878, 1.702647, 0, 0.5137255, 1, 1,
0.2471803, 0.6085735, 0.4476243, 0, 0.509804, 1, 1,
0.2478553, -0.4308062, 2.305623, 0, 0.5019608, 1, 1,
0.250236, -0.04280558, 0.05370833, 0, 0.4941176, 1, 1,
0.251507, -2.22673, 3.364318, 0, 0.4901961, 1, 1,
0.2525818, 0.7720385, 2.210693, 0, 0.4823529, 1, 1,
0.2552297, 1.38241, 1.473364, 0, 0.4784314, 1, 1,
0.2673399, -0.3354181, 2.468817, 0, 0.4705882, 1, 1,
0.270412, 1.442039, 1.246339, 0, 0.4666667, 1, 1,
0.2729132, 0.7107938, -0.2970354, 0, 0.4588235, 1, 1,
0.2732588, -0.439781, 1.267791, 0, 0.454902, 1, 1,
0.2740321, 0.6610113, -0.4146529, 0, 0.4470588, 1, 1,
0.2750553, -0.4360655, 0.6091273, 0, 0.4431373, 1, 1,
0.2813812, 1.461491, 0.4144229, 0, 0.4352941, 1, 1,
0.2845758, 1.150823, -1.487995, 0, 0.4313726, 1, 1,
0.2886232, -2.111567, 3.041076, 0, 0.4235294, 1, 1,
0.2887609, 0.8964842, 0.688821, 0, 0.4196078, 1, 1,
0.2891076, 1.248084, 3.291382, 0, 0.4117647, 1, 1,
0.2911349, -0.4525689, 1.644213, 0, 0.4078431, 1, 1,
0.2916056, 0.001115646, -0.03938868, 0, 0.4, 1, 1,
0.2935137, -0.4303041, 2.544204, 0, 0.3921569, 1, 1,
0.2948279, -0.4062299, 2.274833, 0, 0.3882353, 1, 1,
0.2954973, -0.07324007, 1.571498, 0, 0.3803922, 1, 1,
0.2968996, -0.5349969, 3.10062, 0, 0.3764706, 1, 1,
0.2978145, -0.05594833, 1.192316, 0, 0.3686275, 1, 1,
0.2986698, 0.3997231, 1.908201, 0, 0.3647059, 1, 1,
0.3035155, 0.08861262, 0.5435299, 0, 0.3568628, 1, 1,
0.3054708, 1.593178, -0.2342646, 0, 0.3529412, 1, 1,
0.3162183, -1.236862, 3.340802, 0, 0.345098, 1, 1,
0.317975, 0.1054209, 0.5783905, 0, 0.3411765, 1, 1,
0.3194843, -0.1322741, 2.107907, 0, 0.3333333, 1, 1,
0.3202558, -1.328795, 2.928619, 0, 0.3294118, 1, 1,
0.3203393, 0.7612747, 1.197788, 0, 0.3215686, 1, 1,
0.3211312, -0.1553078, 2.769506, 0, 0.3176471, 1, 1,
0.3218282, 1.108709, 1.716795, 0, 0.3098039, 1, 1,
0.3218825, 1.335333, -0.03244087, 0, 0.3058824, 1, 1,
0.3219865, 0.08688096, 1.91516, 0, 0.2980392, 1, 1,
0.3300574, -1.403975, 1.724025, 0, 0.2901961, 1, 1,
0.3301782, -0.3057577, 1.054443, 0, 0.2862745, 1, 1,
0.3391345, -0.243325, 2.316826, 0, 0.2784314, 1, 1,
0.3393106, -0.9175271, 0.9626195, 0, 0.2745098, 1, 1,
0.3401009, 0.3566728, 0.77821, 0, 0.2666667, 1, 1,
0.3415048, 1.418624, 0.6461766, 0, 0.2627451, 1, 1,
0.3504271, 0.5960198, 0.6098762, 0, 0.254902, 1, 1,
0.3507906, -0.6739441, 3.768929, 0, 0.2509804, 1, 1,
0.3508158, 0.05037982, 1.74254, 0, 0.2431373, 1, 1,
0.354616, -0.04296681, 1.140504, 0, 0.2392157, 1, 1,
0.3604135, -0.05853784, 2.167886, 0, 0.2313726, 1, 1,
0.3612493, -0.1856555, -0.4796399, 0, 0.227451, 1, 1,
0.3637673, 0.5945294, -0.9818316, 0, 0.2196078, 1, 1,
0.3652725, -1.525039, 3.127731, 0, 0.2156863, 1, 1,
0.3664256, -1.3242, 1.424178, 0, 0.2078431, 1, 1,
0.3668775, 0.04949177, 0.6295457, 0, 0.2039216, 1, 1,
0.3720725, 0.1207882, 0.1089463, 0, 0.1960784, 1, 1,
0.3753764, 0.840645, 0.4103822, 0, 0.1882353, 1, 1,
0.378693, -0.409338, 2.678736, 0, 0.1843137, 1, 1,
0.3790146, 0.4398676, 0.3634205, 0, 0.1764706, 1, 1,
0.3887161, 0.2322793, -1.932228, 0, 0.172549, 1, 1,
0.3894156, 0.5954694, -0.6617848, 0, 0.1647059, 1, 1,
0.3928804, -0.07342619, 1.666176, 0, 0.1607843, 1, 1,
0.3929732, 0.4187216, 1.621374, 0, 0.1529412, 1, 1,
0.3938601, 1.169311, -2.061871, 0, 0.1490196, 1, 1,
0.3954853, -0.01200414, 1.539503, 0, 0.1411765, 1, 1,
0.4038986, -0.5906292, 1.139685, 0, 0.1372549, 1, 1,
0.4043184, 1.68763, 0.5393381, 0, 0.1294118, 1, 1,
0.4088274, 0.3057315, 0.1872022, 0, 0.1254902, 1, 1,
0.4113081, 1.025003, -0.5789121, 0, 0.1176471, 1, 1,
0.4114884, 0.6972964, -0.5573953, 0, 0.1137255, 1, 1,
0.4119545, 0.8046292, 1.63388, 0, 0.1058824, 1, 1,
0.4145853, 0.7712353, 1.956561, 0, 0.09803922, 1, 1,
0.4236635, -1.339098, 1.577341, 0, 0.09411765, 1, 1,
0.4263135, 1.246114, -1.188347, 0, 0.08627451, 1, 1,
0.4301864, 0.9157683, -0.5360157, 0, 0.08235294, 1, 1,
0.430921, -0.5277409, 2.711245, 0, 0.07450981, 1, 1,
0.4388257, -0.8987994, 4.153904, 0, 0.07058824, 1, 1,
0.4409853, -1.234693, 2.964565, 0, 0.0627451, 1, 1,
0.4458117, 1.232574, 0.4585701, 0, 0.05882353, 1, 1,
0.4502372, 0.4403281, 0.3062117, 0, 0.05098039, 1, 1,
0.455456, -1.340283, 1.388117, 0, 0.04705882, 1, 1,
0.4561848, 0.4600573, 2.548938, 0, 0.03921569, 1, 1,
0.4586179, 0.6389048, 0.8088302, 0, 0.03529412, 1, 1,
0.4589678, -1.055188, 5.471961, 0, 0.02745098, 1, 1,
0.462994, -0.2992007, 3.375467, 0, 0.02352941, 1, 1,
0.4635714, -2.433879, 3.71798, 0, 0.01568628, 1, 1,
0.4650495, 0.1194848, 1.706611, 0, 0.01176471, 1, 1,
0.4678027, -0.6806915, 1.866066, 0, 0.003921569, 1, 1,
0.4685119, -1.359493, 2.701576, 0.003921569, 0, 1, 1,
0.4697671, 0.4499035, 1.087749, 0.007843138, 0, 1, 1,
0.4720044, 0.6423542, 0.1845365, 0.01568628, 0, 1, 1,
0.4721472, 1.884077, 0.5590435, 0.01960784, 0, 1, 1,
0.4767832, -1.739352, 3.770893, 0.02745098, 0, 1, 1,
0.4774603, 0.3216424, 1.962688, 0.03137255, 0, 1, 1,
0.479419, 0.4297808, 1.178672, 0.03921569, 0, 1, 1,
0.4858598, 1.546112, 0.140397, 0.04313726, 0, 1, 1,
0.4897873, 1.015625, 0.9752016, 0.05098039, 0, 1, 1,
0.4908091, 0.371118, -0.3117608, 0.05490196, 0, 1, 1,
0.4961779, 1.394407, 3.013707, 0.0627451, 0, 1, 1,
0.5009751, 0.3322566, 0.6350449, 0.06666667, 0, 1, 1,
0.5064288, 0.2203631, 1.075924, 0.07450981, 0, 1, 1,
0.5066853, -1.093813, 2.852091, 0.07843138, 0, 1, 1,
0.5096065, 2.967771, 2.678645, 0.08627451, 0, 1, 1,
0.5106393, -0.6502063, 3.219637, 0.09019608, 0, 1, 1,
0.5134971, -0.09773199, 2.337558, 0.09803922, 0, 1, 1,
0.5145762, 0.08075099, 1.417332, 0.1058824, 0, 1, 1,
0.5145909, 1.053703, -0.3133911, 0.1098039, 0, 1, 1,
0.5177867, -0.2850042, 4.073539, 0.1176471, 0, 1, 1,
0.5182105, -0.6464902, 2.537657, 0.1215686, 0, 1, 1,
0.5204551, -3.570148, 2.120785, 0.1294118, 0, 1, 1,
0.5218068, 0.9687064, 0.4212661, 0.1333333, 0, 1, 1,
0.5240878, 0.7357004, 1.156204, 0.1411765, 0, 1, 1,
0.5272192, -0.645408, 4.759774, 0.145098, 0, 1, 1,
0.5275586, 0.6881233, 1.777416, 0.1529412, 0, 1, 1,
0.5317148, 0.6690256, 0.6349835, 0.1568628, 0, 1, 1,
0.5353888, 0.09750065, 2.033641, 0.1647059, 0, 1, 1,
0.5361258, -0.4835513, 0.04995004, 0.1686275, 0, 1, 1,
0.5378127, -1.31494, 1.119872, 0.1764706, 0, 1, 1,
0.5388981, -0.4172918, 2.622135, 0.1803922, 0, 1, 1,
0.5444253, -0.9916338, 4.127726, 0.1882353, 0, 1, 1,
0.5466429, -0.3778962, 2.795991, 0.1921569, 0, 1, 1,
0.5536219, -1.193794, 1.757641, 0.2, 0, 1, 1,
0.5553299, -0.4581845, 3.141963, 0.2078431, 0, 1, 1,
0.5591983, 0.5462231, -1.855222, 0.2117647, 0, 1, 1,
0.5602358, -0.8380424, 3.322376, 0.2196078, 0, 1, 1,
0.5622318, 0.9901818, -0.1976426, 0.2235294, 0, 1, 1,
0.5630502, 0.240766, 1.629513, 0.2313726, 0, 1, 1,
0.5666841, -0.06005898, 1.222975, 0.2352941, 0, 1, 1,
0.5674772, 0.4196061, 1.331964, 0.2431373, 0, 1, 1,
0.5678749, 0.4752454, -0.5097421, 0.2470588, 0, 1, 1,
0.5691274, -0.6948164, 2.598933, 0.254902, 0, 1, 1,
0.5734255, -1.589947, 1.501901, 0.2588235, 0, 1, 1,
0.5881481, -0.05142629, 1.087479, 0.2666667, 0, 1, 1,
0.5931236, 1.078903, 0.7542904, 0.2705882, 0, 1, 1,
0.5935167, -1.422253, 1.956436, 0.2784314, 0, 1, 1,
0.593525, 0.1783294, 1.611879, 0.282353, 0, 1, 1,
0.5980715, 0.7066324, 1.44276, 0.2901961, 0, 1, 1,
0.5991156, 1.178024, 0.9477927, 0.2941177, 0, 1, 1,
0.6035819, 0.9290396, 0.6292306, 0.3019608, 0, 1, 1,
0.6039714, -1.479842, 2.29142, 0.3098039, 0, 1, 1,
0.6043346, -0.07880307, 1.369004, 0.3137255, 0, 1, 1,
0.6101801, 0.4061661, 0.8646916, 0.3215686, 0, 1, 1,
0.6158831, -0.5314463, 2.336695, 0.3254902, 0, 1, 1,
0.6180582, -1.12939, 2.725248, 0.3333333, 0, 1, 1,
0.6234169, -0.1185843, 1.993867, 0.3372549, 0, 1, 1,
0.6249453, -0.2022623, 2.191442, 0.345098, 0, 1, 1,
0.6268426, 1.69237, 1.445567, 0.3490196, 0, 1, 1,
0.633141, -0.6661435, 2.653356, 0.3568628, 0, 1, 1,
0.6344157, 0.9755134, 1.481751, 0.3607843, 0, 1, 1,
0.6351173, 0.01917997, 0.4200126, 0.3686275, 0, 1, 1,
0.637032, -1.215083, 3.647401, 0.372549, 0, 1, 1,
0.6493372, 0.1654344, 1.912409, 0.3803922, 0, 1, 1,
0.6496533, 0.6802062, -0.1224658, 0.3843137, 0, 1, 1,
0.6515128, 0.9808245, 1.177234, 0.3921569, 0, 1, 1,
0.6584061, -2.186023, 3.666944, 0.3960784, 0, 1, 1,
0.6617639, 0.2268189, 0.8310952, 0.4039216, 0, 1, 1,
0.6627797, -0.4841841, 2.173367, 0.4117647, 0, 1, 1,
0.6662312, 0.3548754, 2.011646, 0.4156863, 0, 1, 1,
0.6694119, -0.08049581, 1.235128, 0.4235294, 0, 1, 1,
0.6712588, -0.4790784, 2.599606, 0.427451, 0, 1, 1,
0.6722441, -0.2884061, 1.056506, 0.4352941, 0, 1, 1,
0.6729617, 0.3209769, 2.236872, 0.4392157, 0, 1, 1,
0.6740607, -1.692269, 2.356112, 0.4470588, 0, 1, 1,
0.6746494, 0.1359739, 2.726557, 0.4509804, 0, 1, 1,
0.6773836, -1.062903, 3.519057, 0.4588235, 0, 1, 1,
0.6805624, 1.080612, 1.546414, 0.4627451, 0, 1, 1,
0.6827003, -0.1146377, 0.2449892, 0.4705882, 0, 1, 1,
0.7031404, 1.251666, -0.4074079, 0.4745098, 0, 1, 1,
0.7172846, -0.08739988, 2.528695, 0.4823529, 0, 1, 1,
0.7194466, -0.4630179, 1.79615, 0.4862745, 0, 1, 1,
0.7211642, 1.113246, 0.1452993, 0.4941176, 0, 1, 1,
0.7226331, -1.628402, 3.085663, 0.5019608, 0, 1, 1,
0.7272647, -0.1922816, 2.378538, 0.5058824, 0, 1, 1,
0.7364696, 0.04116387, 1.723112, 0.5137255, 0, 1, 1,
0.7375824, -1.575684, 2.610952, 0.5176471, 0, 1, 1,
0.7386718, -0.5695291, 1.774951, 0.5254902, 0, 1, 1,
0.739004, 0.2656039, 0.9466769, 0.5294118, 0, 1, 1,
0.7447488, 0.9514568, 0.5781507, 0.5372549, 0, 1, 1,
0.7459745, -0.8408332, 1.535576, 0.5411765, 0, 1, 1,
0.7491291, 1.933237, 0.7750095, 0.5490196, 0, 1, 1,
0.7494367, 0.3534308, 2.67017, 0.5529412, 0, 1, 1,
0.7599946, -1.079916, 1.351065, 0.5607843, 0, 1, 1,
0.7671314, -0.5533121, 3.214818, 0.5647059, 0, 1, 1,
0.7747344, 0.2374638, -0.8725886, 0.572549, 0, 1, 1,
0.7777976, 0.8611504, 0.6304364, 0.5764706, 0, 1, 1,
0.7840593, -1.241296, 2.088009, 0.5843138, 0, 1, 1,
0.788102, 0.3045439, 1.437939, 0.5882353, 0, 1, 1,
0.7898567, -0.6407374, 3.779804, 0.5960785, 0, 1, 1,
0.797986, 0.7346788, 2.093702, 0.6039216, 0, 1, 1,
0.801859, -0.4589793, 1.889637, 0.6078432, 0, 1, 1,
0.8046957, 1.178822, 0.4340705, 0.6156863, 0, 1, 1,
0.8091591, 1.83917, 0.4239986, 0.6196079, 0, 1, 1,
0.8150269, 0.4732212, 0.8498099, 0.627451, 0, 1, 1,
0.8164094, -0.1414995, 2.07056, 0.6313726, 0, 1, 1,
0.8171772, 0.4905684, 3.675899, 0.6392157, 0, 1, 1,
0.8218683, -0.7295892, 2.113679, 0.6431373, 0, 1, 1,
0.8277955, -1.508606, 2.466545, 0.6509804, 0, 1, 1,
0.8317476, -2.142902, 3.151014, 0.654902, 0, 1, 1,
0.8418396, 0.1179415, 0.5831901, 0.6627451, 0, 1, 1,
0.8422694, 0.7129111, 2.620074, 0.6666667, 0, 1, 1,
0.8499382, 0.2514217, 0.8235456, 0.6745098, 0, 1, 1,
0.8508234, 0.08069311, 2.862848, 0.6784314, 0, 1, 1,
0.8526769, -1.278224, 3.109092, 0.6862745, 0, 1, 1,
0.855282, -0.4580221, 3.004781, 0.6901961, 0, 1, 1,
0.8569689, 0.5275114, 0.3319692, 0.6980392, 0, 1, 1,
0.8632805, -1.510936, 2.584124, 0.7058824, 0, 1, 1,
0.8710358, -0.8854379, 2.477262, 0.7098039, 0, 1, 1,
0.8745611, -0.2708934, 3.7564, 0.7176471, 0, 1, 1,
0.8785342, 0.06641407, 2.81966, 0.7215686, 0, 1, 1,
0.8798991, 0.2165099, 0.1028782, 0.7294118, 0, 1, 1,
0.8824204, 1.160474, 0.9469743, 0.7333333, 0, 1, 1,
0.8837531, 0.2288549, 1.607831, 0.7411765, 0, 1, 1,
0.8905051, -1.032752, 2.021808, 0.7450981, 0, 1, 1,
0.8907114, 1.137921, 1.88935, 0.7529412, 0, 1, 1,
0.892127, -0.2388807, 1.194183, 0.7568628, 0, 1, 1,
0.8937001, -0.1520651, 1.683165, 0.7647059, 0, 1, 1,
0.8944614, -0.4960646, 2.623141, 0.7686275, 0, 1, 1,
0.8952846, -1.232596, 1.753252, 0.7764706, 0, 1, 1,
0.8964115, 0.5475659, 0.476099, 0.7803922, 0, 1, 1,
0.8973244, -1.556655, 3.0554, 0.7882353, 0, 1, 1,
0.8981981, 0.2666784, 2.781183, 0.7921569, 0, 1, 1,
0.9052907, 0.2145814, 2.31543, 0.8, 0, 1, 1,
0.9081945, -1.138666, 3.438285, 0.8078431, 0, 1, 1,
0.910477, 0.103321, 0.6335036, 0.8117647, 0, 1, 1,
0.9134272, -2.113877, 1.697251, 0.8196079, 0, 1, 1,
0.9140793, 0.7209138, 0.1143871, 0.8235294, 0, 1, 1,
0.9146525, -2.131429, 3.001438, 0.8313726, 0, 1, 1,
0.916812, -0.4615316, 2.57739, 0.8352941, 0, 1, 1,
0.9265775, 0.1291803, 2.104157, 0.8431373, 0, 1, 1,
0.9267758, -1.922939, 2.796807, 0.8470588, 0, 1, 1,
0.9311373, -0.5843722, 1.736016, 0.854902, 0, 1, 1,
0.9320805, -1.025411, 1.223773, 0.8588235, 0, 1, 1,
0.9338101, 0.8387643, 0.8505807, 0.8666667, 0, 1, 1,
0.9403892, 1.043157, 1.5707, 0.8705882, 0, 1, 1,
0.9449878, 0.8865924, -0.787019, 0.8784314, 0, 1, 1,
0.9473972, -0.01367133, 0.5752198, 0.8823529, 0, 1, 1,
0.9503348, 0.3368293, 2.816176, 0.8901961, 0, 1, 1,
0.9602146, 0.627667, 2.936676, 0.8941177, 0, 1, 1,
0.9613518, -0.1156885, 2.107745, 0.9019608, 0, 1, 1,
0.9641005, -1.783239, 3.425887, 0.9098039, 0, 1, 1,
0.9646705, 0.3164984, -0.06858894, 0.9137255, 0, 1, 1,
0.965755, -0.4099111, -0.4310892, 0.9215686, 0, 1, 1,
0.9676556, 0.4708815, 1.678943, 0.9254902, 0, 1, 1,
0.9698028, -0.3022492, 1.242851, 0.9333333, 0, 1, 1,
0.9701531, -1.115739, 1.002404, 0.9372549, 0, 1, 1,
0.9702998, -1.391016, 1.68417, 0.945098, 0, 1, 1,
0.9710517, 1.423789, 0.6519142, 0.9490196, 0, 1, 1,
0.9740429, 0.07437935, 2.86165, 0.9568627, 0, 1, 1,
0.9743869, 1.312297, 1.273775, 0.9607843, 0, 1, 1,
0.9771288, 0.6055737, 2.72664, 0.9686275, 0, 1, 1,
0.9821151, -0.3294203, 1.260494, 0.972549, 0, 1, 1,
0.987422, -1.027228, 3.880154, 0.9803922, 0, 1, 1,
1.003107, -0.6211337, 2.735713, 0.9843137, 0, 1, 1,
1.006407, -1.328581, 0.9059719, 0.9921569, 0, 1, 1,
1.016747, -0.01797721, 1.50835, 0.9960784, 0, 1, 1,
1.019944, -0.9096147, 0.7956876, 1, 0, 0.9960784, 1,
1.022419, 1.879271, 2.23973, 1, 0, 0.9882353, 1,
1.022605, 1.365005, 1.392074, 1, 0, 0.9843137, 1,
1.031059, 0.9762206, -0.08980766, 1, 0, 0.9764706, 1,
1.042932, -2.338892, 3.092186, 1, 0, 0.972549, 1,
1.044841, 0.6111572, 0.2638932, 1, 0, 0.9647059, 1,
1.050508, 0.6001487, 0.5979607, 1, 0, 0.9607843, 1,
1.052083, 1.113427, 1.821052, 1, 0, 0.9529412, 1,
1.053592, 0.5525047, 1.082531, 1, 0, 0.9490196, 1,
1.059972, -0.5752903, 3.160053, 1, 0, 0.9411765, 1,
1.060811, 1.547929, -0.683908, 1, 0, 0.9372549, 1,
1.068312, 0.1835572, 2.94071, 1, 0, 0.9294118, 1,
1.082372, -0.7522797, 0.5045705, 1, 0, 0.9254902, 1,
1.0848, -1.842109, 1.379827, 1, 0, 0.9176471, 1,
1.093866, 0.5675394, 1.647831, 1, 0, 0.9137255, 1,
1.094833, 0.5370046, 0.7507542, 1, 0, 0.9058824, 1,
1.098729, 1.099256, -0.1473541, 1, 0, 0.9019608, 1,
1.099555, -0.5943837, 1.982878, 1, 0, 0.8941177, 1,
1.106275, -0.3339761, 2.636517, 1, 0, 0.8862745, 1,
1.110054, -0.5839371, 1.246519, 1, 0, 0.8823529, 1,
1.120827, -0.6751795, 1.753347, 1, 0, 0.8745098, 1,
1.121318, -0.4207903, 2.309535, 1, 0, 0.8705882, 1,
1.125996, 0.6030549, 2.278276, 1, 0, 0.8627451, 1,
1.128055, -0.278114, 1.172557, 1, 0, 0.8588235, 1,
1.129997, 0.04640219, -1.042221, 1, 0, 0.8509804, 1,
1.135781, -0.09476893, -1.227084, 1, 0, 0.8470588, 1,
1.139383, -0.8587511, 0.4158995, 1, 0, 0.8392157, 1,
1.14022, 0.4536254, 0.7650427, 1, 0, 0.8352941, 1,
1.148309, 1.964032, -0.8892568, 1, 0, 0.827451, 1,
1.152529, -0.3743449, 2.641614, 1, 0, 0.8235294, 1,
1.154264, -0.9902378, 2.786427, 1, 0, 0.8156863, 1,
1.156597, -0.446397, 0.8038645, 1, 0, 0.8117647, 1,
1.164291, -1.117058, 1.296836, 1, 0, 0.8039216, 1,
1.169387, -0.7426602, 2.008485, 1, 0, 0.7960784, 1,
1.170243, 0.6445087, 3.882177, 1, 0, 0.7921569, 1,
1.186509, -0.9689664, 2.710328, 1, 0, 0.7843137, 1,
1.186909, 1.220078, 0.3945895, 1, 0, 0.7803922, 1,
1.189767, -0.06454711, 2.116019, 1, 0, 0.772549, 1,
1.200319, -1.19324, 1.720797, 1, 0, 0.7686275, 1,
1.207233, -0.5365964, 3.766609, 1, 0, 0.7607843, 1,
1.213811, 1.04947, -2.207748, 1, 0, 0.7568628, 1,
1.21514, 0.3541141, -0.5506334, 1, 0, 0.7490196, 1,
1.220797, -0.4472456, 2.33443, 1, 0, 0.7450981, 1,
1.227659, 0.6239835, 1.461565, 1, 0, 0.7372549, 1,
1.233944, 0.6322691, -0.2121332, 1, 0, 0.7333333, 1,
1.236484, 1.048227, 0.9498031, 1, 0, 0.7254902, 1,
1.237441, 0.1578072, 1.59071, 1, 0, 0.7215686, 1,
1.240677, 0.1969361, 1.818797, 1, 0, 0.7137255, 1,
1.255106, 0.332897, 1.200691, 1, 0, 0.7098039, 1,
1.261841, 1.019364, 1.842015, 1, 0, 0.7019608, 1,
1.278204, -1.632568, 1.260469, 1, 0, 0.6941177, 1,
1.280833, 0.9737363, 1.230829, 1, 0, 0.6901961, 1,
1.281391, 0.2322281, 0.3476134, 1, 0, 0.682353, 1,
1.285594, 1.633313, 0.09085009, 1, 0, 0.6784314, 1,
1.288512, -0.4908591, 2.342864, 1, 0, 0.6705883, 1,
1.289481, -0.5243233, 2.240512, 1, 0, 0.6666667, 1,
1.29721, -0.3799386, 1.388303, 1, 0, 0.6588235, 1,
1.299959, -0.6934362, 2.367325, 1, 0, 0.654902, 1,
1.3068, 0.7372844, 0.02157106, 1, 0, 0.6470588, 1,
1.308612, -2.174249, 2.434187, 1, 0, 0.6431373, 1,
1.309963, -0.1716635, 3.15783, 1, 0, 0.6352941, 1,
1.311808, 0.5856367, 2.305983, 1, 0, 0.6313726, 1,
1.320516, 1.05746, -0.9711913, 1, 0, 0.6235294, 1,
1.320573, 0.1236052, 2.268445, 1, 0, 0.6196079, 1,
1.331969, 0.1089279, 3.827856, 1, 0, 0.6117647, 1,
1.334647, -2.223825, 2.741118, 1, 0, 0.6078432, 1,
1.335566, -0.7044612, 2.384377, 1, 0, 0.6, 1,
1.339913, -0.6739038, 2.818183, 1, 0, 0.5921569, 1,
1.340047, -1.586473, -0.1464132, 1, 0, 0.5882353, 1,
1.347235, 0.6213199, 1.170433, 1, 0, 0.5803922, 1,
1.349185, -1.609903, 0.7442618, 1, 0, 0.5764706, 1,
1.349675, -0.9857904, 2.116493, 1, 0, 0.5686275, 1,
1.35098, -1.811322, 3.590893, 1, 0, 0.5647059, 1,
1.353027, 0.3834645, 1.688515, 1, 0, 0.5568628, 1,
1.362809, 2.38728, -0.6222168, 1, 0, 0.5529412, 1,
1.372152, 0.4494471, 1.433779, 1, 0, 0.5450981, 1,
1.372688, -1.240401, 4.34336, 1, 0, 0.5411765, 1,
1.379487, -1.085592, 2.145023, 1, 0, 0.5333334, 1,
1.381878, -0.949366, 1.528419, 1, 0, 0.5294118, 1,
1.392516, 1.499599, -1.171944, 1, 0, 0.5215687, 1,
1.393767, -0.1643353, 2.981736, 1, 0, 0.5176471, 1,
1.39858, -0.9121825, 3.072891, 1, 0, 0.509804, 1,
1.409158, 1.16035, 2.088576, 1, 0, 0.5058824, 1,
1.409623, -0.5103327, 3.651317, 1, 0, 0.4980392, 1,
1.411004, -1.338591, 2.93431, 1, 0, 0.4901961, 1,
1.413411, 0.8278939, 0.2224238, 1, 0, 0.4862745, 1,
1.41609, -0.4338223, 2.268069, 1, 0, 0.4784314, 1,
1.424783, 0.184038, 1.223718, 1, 0, 0.4745098, 1,
1.429126, -0.997285, 1.657812, 1, 0, 0.4666667, 1,
1.43119, -0.8723024, 3.51631, 1, 0, 0.4627451, 1,
1.4357, 0.9410219, 1.053044, 1, 0, 0.454902, 1,
1.446033, 0.1519073, 1.319944, 1, 0, 0.4509804, 1,
1.458041, 0.6110565, 2.057881, 1, 0, 0.4431373, 1,
1.460568, 2.091765, -1.01711, 1, 0, 0.4392157, 1,
1.483824, -1.337868, 1.740865, 1, 0, 0.4313726, 1,
1.485255, 1.002806, 0.4158774, 1, 0, 0.427451, 1,
1.499956, -0.5172731, 3.959489, 1, 0, 0.4196078, 1,
1.502429, 0.7692702, 1.103657, 1, 0, 0.4156863, 1,
1.521131, -0.6575391, 3.796066, 1, 0, 0.4078431, 1,
1.524247, -0.1980355, 0.4744304, 1, 0, 0.4039216, 1,
1.5399, -1.427728, 2.719937, 1, 0, 0.3960784, 1,
1.543426, 1.073833, 1.242656, 1, 0, 0.3882353, 1,
1.545051, -0.818782, 2.088635, 1, 0, 0.3843137, 1,
1.551198, -1.588392, 2.419865, 1, 0, 0.3764706, 1,
1.558447, 0.2699301, 2.427785, 1, 0, 0.372549, 1,
1.57235, 0.2617107, 0.08859979, 1, 0, 0.3647059, 1,
1.591457, -0.2875288, 0.5493804, 1, 0, 0.3607843, 1,
1.602535, -0.8263188, 1.048313, 1, 0, 0.3529412, 1,
1.614668, -0.3141081, 0.3798247, 1, 0, 0.3490196, 1,
1.637208, 0.9418595, 1.356017, 1, 0, 0.3411765, 1,
1.644342, -0.7341845, 2.991888, 1, 0, 0.3372549, 1,
1.651184, -0.2635283, 1.133882, 1, 0, 0.3294118, 1,
1.660547, 0.2743156, 1.048434, 1, 0, 0.3254902, 1,
1.661069, 0.02893549, 0.9482812, 1, 0, 0.3176471, 1,
1.672896, 2.075254, 2.204983, 1, 0, 0.3137255, 1,
1.699386, 0.09554408, -0.7445952, 1, 0, 0.3058824, 1,
1.700794, 0.8335842, 2.422226, 1, 0, 0.2980392, 1,
1.704726, 0.9229081, 1.085984, 1, 0, 0.2941177, 1,
1.730288, 0.2728758, 1.285365, 1, 0, 0.2862745, 1,
1.74299, 0.3995143, 2.321316, 1, 0, 0.282353, 1,
1.752971, 0.636957, 0.6938953, 1, 0, 0.2745098, 1,
1.760069, 1.080215, 0.0515826, 1, 0, 0.2705882, 1,
1.763118, 0.7790161, 2.060264, 1, 0, 0.2627451, 1,
1.763148, -1.183331, 2.13408, 1, 0, 0.2588235, 1,
1.770781, 0.7647555, 2.582407, 1, 0, 0.2509804, 1,
1.771803, -0.7545339, 1.545048, 1, 0, 0.2470588, 1,
1.777891, -0.8906412, 0.8594173, 1, 0, 0.2392157, 1,
1.778606, -0.4855545, 2.623959, 1, 0, 0.2352941, 1,
1.784244, 0.1441816, 1.004059, 1, 0, 0.227451, 1,
1.799195, -0.5780894, 1.126993, 1, 0, 0.2235294, 1,
1.823605, 0.9408465, 2.491121, 1, 0, 0.2156863, 1,
1.849525, -0.9405696, 2.029383, 1, 0, 0.2117647, 1,
1.863419, 0.09880697, 4.969619, 1, 0, 0.2039216, 1,
1.86435, -1.008242, 0.8034574, 1, 0, 0.1960784, 1,
1.865669, 0.008526117, 1.114702, 1, 0, 0.1921569, 1,
1.873829, 2.26186, -0.384439, 1, 0, 0.1843137, 1,
1.879535, -1.659033, 3.094887, 1, 0, 0.1803922, 1,
1.892999, -1.065889, 0.4586569, 1, 0, 0.172549, 1,
1.98217, 1.727603, 1.014758, 1, 0, 0.1686275, 1,
1.983332, -2.416354, 1.45863, 1, 0, 0.1607843, 1,
1.983894, -0.8250791, 2.545794, 1, 0, 0.1568628, 1,
1.986805, 1.171303, 1.36968, 1, 0, 0.1490196, 1,
2.000297, 0.2595162, 0.437099, 1, 0, 0.145098, 1,
2.019206, 0.6322083, 0.437629, 1, 0, 0.1372549, 1,
2.020956, -0.8616877, 2.582488, 1, 0, 0.1333333, 1,
2.069118, 0.4891803, 1.524028, 1, 0, 0.1254902, 1,
2.073929, -1.139438, 0.9098501, 1, 0, 0.1215686, 1,
2.100951, -1.136202, 2.028908, 1, 0, 0.1137255, 1,
2.11364, -0.6659284, 1.783353, 1, 0, 0.1098039, 1,
2.121354, -0.6764251, 1.386369, 1, 0, 0.1019608, 1,
2.124954, 0.5989026, 1.484407, 1, 0, 0.09411765, 1,
2.149695, -1.375919, 3.089574, 1, 0, 0.09019608, 1,
2.212174, 0.5773718, 2.47072, 1, 0, 0.08235294, 1,
2.215753, 2.022582, -0.5759117, 1, 0, 0.07843138, 1,
2.247657, 0.1065092, 0.007632982, 1, 0, 0.07058824, 1,
2.278913, -1.16516, -0.2033582, 1, 0, 0.06666667, 1,
2.308176, -0.8044018, 1.994714, 1, 0, 0.05882353, 1,
2.404187, -0.8123, 2.420244, 1, 0, 0.05490196, 1,
2.414065, -0.102975, 1.41002, 1, 0, 0.04705882, 1,
2.501221, -0.3865928, 1.656627, 1, 0, 0.04313726, 1,
2.570023, -0.8905739, 1.417114, 1, 0, 0.03529412, 1,
2.653514, -0.8575643, 1.877126, 1, 0, 0.03137255, 1,
2.653929, 0.009782672, 1.056368, 1, 0, 0.02352941, 1,
2.818566, -1.073375, 2.387187, 1, 0, 0.01960784, 1,
2.932288, -2.318087, 1.899184, 1, 0, 0.01176471, 1,
3.010108, -0.7060261, 1.723876, 1, 0, 0.007843138, 1
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
-0.1723871, -4.758824, -7.998103, 0, -0.5, 0.5, 0.5,
-0.1723871, -4.758824, -7.998103, 1, -0.5, 0.5, 0.5,
-0.1723871, -4.758824, -7.998103, 1, 1.5, 0.5, 0.5,
-0.1723871, -4.758824, -7.998103, 0, 1.5, 0.5, 0.5
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
-4.433749, -0.06373072, -7.998103, 0, -0.5, 0.5, 0.5,
-4.433749, -0.06373072, -7.998103, 1, -0.5, 0.5, 0.5,
-4.433749, -0.06373072, -7.998103, 1, 1.5, 0.5, 0.5,
-4.433749, -0.06373072, -7.998103, 0, 1.5, 0.5, 0.5
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
-4.433749, -4.758824, -0.286938, 0, -0.5, 0.5, 0.5,
-4.433749, -4.758824, -0.286938, 1, -0.5, 0.5, 0.5,
-4.433749, -4.758824, -0.286938, 1, 1.5, 0.5, 0.5,
-4.433749, -4.758824, -0.286938, 0, 1.5, 0.5, 0.5
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
-3, -3.675341, -6.218604,
3, -3.675341, -6.218604,
-3, -3.675341, -6.218604,
-3, -3.855922, -6.515187,
-2, -3.675341, -6.218604,
-2, -3.855922, -6.515187,
-1, -3.675341, -6.218604,
-1, -3.855922, -6.515187,
0, -3.675341, -6.218604,
0, -3.855922, -6.515187,
1, -3.675341, -6.218604,
1, -3.855922, -6.515187,
2, -3.675341, -6.218604,
2, -3.855922, -6.515187,
3, -3.675341, -6.218604,
3, -3.855922, -6.515187
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
-3, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
-3, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
-3, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
-3, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
-2, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
-2, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
-2, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
-2, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
-1, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
-1, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
-1, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
-1, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
0, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
0, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
0, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
0, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
1, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
1, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
1, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
1, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
2, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
2, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
2, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
2, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5,
3, -4.217083, -7.108353, 0, -0.5, 0.5, 0.5,
3, -4.217083, -7.108353, 1, -0.5, 0.5, 0.5,
3, -4.217083, -7.108353, 1, 1.5, 0.5, 0.5,
3, -4.217083, -7.108353, 0, 1.5, 0.5, 0.5
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
-3.450358, -2, -6.218604,
-3.450358, 2, -6.218604,
-3.450358, -2, -6.218604,
-3.614256, -2, -6.515187,
-3.450358, 0, -6.218604,
-3.614256, 0, -6.515187,
-3.450358, 2, -6.218604,
-3.614256, 2, -6.515187
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
-3.942053, -2, -7.108353, 0, -0.5, 0.5, 0.5,
-3.942053, -2, -7.108353, 1, -0.5, 0.5, 0.5,
-3.942053, -2, -7.108353, 1, 1.5, 0.5, 0.5,
-3.942053, -2, -7.108353, 0, 1.5, 0.5, 0.5,
-3.942053, 0, -7.108353, 0, -0.5, 0.5, 0.5,
-3.942053, 0, -7.108353, 1, -0.5, 0.5, 0.5,
-3.942053, 0, -7.108353, 1, 1.5, 0.5, 0.5,
-3.942053, 0, -7.108353, 0, 1.5, 0.5, 0.5,
-3.942053, 2, -7.108353, 0, -0.5, 0.5, 0.5,
-3.942053, 2, -7.108353, 1, -0.5, 0.5, 0.5,
-3.942053, 2, -7.108353, 1, 1.5, 0.5, 0.5,
-3.942053, 2, -7.108353, 0, 1.5, 0.5, 0.5
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
-3.450358, -3.675341, -6,
-3.450358, -3.675341, 4,
-3.450358, -3.675341, -6,
-3.614256, -3.855922, -6,
-3.450358, -3.675341, -4,
-3.614256, -3.855922, -4,
-3.450358, -3.675341, -2,
-3.614256, -3.855922, -2,
-3.450358, -3.675341, 0,
-3.614256, -3.855922, 0,
-3.450358, -3.675341, 2,
-3.614256, -3.855922, 2,
-3.450358, -3.675341, 4,
-3.614256, -3.855922, 4
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
-3.942053, -4.217083, -6, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -6, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -6, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, -6, 0, 1.5, 0.5, 0.5,
-3.942053, -4.217083, -4, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -4, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -4, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, -4, 0, 1.5, 0.5, 0.5,
-3.942053, -4.217083, -2, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -2, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, -2, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, -2, 0, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 0, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 0, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 0, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 0, 0, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 2, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 2, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 2, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 2, 0, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 4, 0, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 4, 1, -0.5, 0.5, 0.5,
-3.942053, -4.217083, 4, 1, 1.5, 0.5, 0.5,
-3.942053, -4.217083, 4, 0, 1.5, 0.5, 0.5
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
-3.450358, -3.675341, -6.218604,
-3.450358, 3.547879, -6.218604,
-3.450358, -3.675341, 5.644728,
-3.450358, 3.547879, 5.644728,
-3.450358, -3.675341, -6.218604,
-3.450358, -3.675341, 5.644728,
-3.450358, 3.547879, -6.218604,
-3.450358, 3.547879, 5.644728,
-3.450358, -3.675341, -6.218604,
3.105583, -3.675341, -6.218604,
-3.450358, -3.675341, 5.644728,
3.105583, -3.675341, 5.644728,
-3.450358, 3.547879, -6.218604,
3.105583, 3.547879, -6.218604,
-3.450358, 3.547879, 5.644728,
3.105583, 3.547879, 5.644728,
3.105583, -3.675341, -6.218604,
3.105583, 3.547879, -6.218604,
3.105583, -3.675341, 5.644728,
3.105583, 3.547879, 5.644728,
3.105583, -3.675341, -6.218604,
3.105583, -3.675341, 5.644728,
3.105583, 3.547879, -6.218604,
3.105583, 3.547879, 5.644728
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
var radius = 8.201321;
var distance = 36.48861;
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
mvMatrix.translate( 0.1723871, 0.06373072, 0.286938 );
mvMatrix.scale( 1.352579, 1.227628, 0.7474654 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.48861);
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
## Error in read.table("2-aminobutane_2-buty.xyz"): no lines available in input
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
-3.354883, -0.1287201, -1.204368, 0, 0, 1, 1, 1,
-3.139579, 0.3565098, -1.070211, 1, 0, 0, 1, 1,
-3.113185, 0.644569, -1.293652, 1, 0, 0, 1, 1,
-2.560333, -0.9826623, -0.3724901, 1, 0, 0, 1, 1,
-2.559712, -0.7598014, -3.311183, 1, 0, 0, 1, 1,
-2.555539, 1.122825, -0.7093946, 1, 0, 0, 1, 1,
-2.383938, -1.026806, -3.207261, 0, 0, 0, 1, 1,
-2.262551, -0.2514643, -1.436404, 0, 0, 0, 1, 1,
-2.24881, 1.362824, -0.6385267, 0, 0, 0, 1, 1,
-2.247814, 1.242821, 0.3032019, 0, 0, 0, 1, 1,
-2.202707, 0.425192, -0.9526425, 0, 0, 0, 1, 1,
-2.197436, 0.08377329, -0.976525, 0, 0, 0, 1, 1,
-2.167942, -2.703065, -2.766298, 0, 0, 0, 1, 1,
-2.155264, 0.1077449, -5.278246, 1, 1, 1, 1, 1,
-2.151181, 0.08371576, -2.745633, 1, 1, 1, 1, 1,
-2.151026, 0.801625, -0.7889839, 1, 1, 1, 1, 1,
-2.136814, -0.9047241, -3.522386, 1, 1, 1, 1, 1,
-2.126849, 1.220895, -1.431036, 1, 1, 1, 1, 1,
-2.099091, -0.6847477, -1.346724, 1, 1, 1, 1, 1,
-2.074534, -1.142241, -1.334478, 1, 1, 1, 1, 1,
-2.044675, 1.112346, -1.313275, 1, 1, 1, 1, 1,
-2.007353, -1.120674, -1.738879, 1, 1, 1, 1, 1,
-1.994065, 0.8652337, -1.736888, 1, 1, 1, 1, 1,
-1.974156, -0.3283351, -3.452897, 1, 1, 1, 1, 1,
-1.971395, 0.6807773, -0.7019355, 1, 1, 1, 1, 1,
-1.948322, -1.273923, -4.129048, 1, 1, 1, 1, 1,
-1.945, -0.1472955, -2.491405, 1, 1, 1, 1, 1,
-1.933884, 0.07117665, -2.400131, 1, 1, 1, 1, 1,
-1.899938, 0.5432916, -0.6207564, 0, 0, 1, 1, 1,
-1.882149, 0.5122706, -0.7343595, 1, 0, 0, 1, 1,
-1.881653, -1.265567, -4.193173, 1, 0, 0, 1, 1,
-1.877113, -0.03563385, -1.109973, 1, 0, 0, 1, 1,
-1.873159, -0.5418586, -2.164696, 1, 0, 0, 1, 1,
-1.86747, 0.05337834, -1.710828, 1, 0, 0, 1, 1,
-1.819435, 0.2894421, -2.396373, 0, 0, 0, 1, 1,
-1.805376, 0.4381431, 0.9600938, 0, 0, 0, 1, 1,
-1.775171, -0.4803963, -1.680679, 0, 0, 0, 1, 1,
-1.728986, -2.064371, -1.866019, 0, 0, 0, 1, 1,
-1.715464, 0.3290116, -1.793501, 0, 0, 0, 1, 1,
-1.703357, -0.07050651, -1.555449, 0, 0, 0, 1, 1,
-1.694169, -0.1172093, -1.180534, 0, 0, 0, 1, 1,
-1.675334, 0.1143537, -2.558441, 1, 1, 1, 1, 1,
-1.67436, -0.5169829, -1.074533, 1, 1, 1, 1, 1,
-1.670188, -0.3019996, -2.37025, 1, 1, 1, 1, 1,
-1.668324, -0.2974074, -1.206439, 1, 1, 1, 1, 1,
-1.668223, -0.9122783, -0.7741623, 1, 1, 1, 1, 1,
-1.658803, -0.7148702, -0.9615467, 1, 1, 1, 1, 1,
-1.642501, -1.080246, -0.245505, 1, 1, 1, 1, 1,
-1.640389, 0.8313977, -1.007535, 1, 1, 1, 1, 1,
-1.628417, -0.6497798, -2.842644, 1, 1, 1, 1, 1,
-1.618204, 1.148988, -1.303836, 1, 1, 1, 1, 1,
-1.593039, 0.3219421, -1.073571, 1, 1, 1, 1, 1,
-1.556673, 0.4699346, -1.016933, 1, 1, 1, 1, 1,
-1.548298, 0.5134329, -2.062379, 1, 1, 1, 1, 1,
-1.526643, -0.3779523, -2.663048, 1, 1, 1, 1, 1,
-1.51094, 0.7157791, -0.2491363, 1, 1, 1, 1, 1,
-1.507616, -0.326518, -1.160529, 0, 0, 1, 1, 1,
-1.50507, 0.2670893, 0.06254046, 1, 0, 0, 1, 1,
-1.480784, 0.2202564, -0.3076349, 1, 0, 0, 1, 1,
-1.465189, -0.2324809, -0.9416608, 1, 0, 0, 1, 1,
-1.452787, 0.00107391, -2.132733, 1, 0, 0, 1, 1,
-1.452306, -0.6598319, -0.4306732, 1, 0, 0, 1, 1,
-1.44137, -0.5431402, -2.198216, 0, 0, 0, 1, 1,
-1.438308, -0.6317314, -1.808227, 0, 0, 0, 1, 1,
-1.430891, -1.939648, -1.492632, 0, 0, 0, 1, 1,
-1.429375, 0.009823393, -1.901204, 0, 0, 0, 1, 1,
-1.425451, -1.355702, -1.55789, 0, 0, 0, 1, 1,
-1.421981, 0.0867358, -0.4340079, 0, 0, 0, 1, 1,
-1.40814, 0.2430584, -1.848365, 0, 0, 0, 1, 1,
-1.405106, 0.2461992, -1.959306, 1, 1, 1, 1, 1,
-1.389193, -1.068318, -1.577432, 1, 1, 1, 1, 1,
-1.387065, -1.302386, -1.223913, 1, 1, 1, 1, 1,
-1.383216, 1.344907, -1.355391, 1, 1, 1, 1, 1,
-1.382844, -0.1008029, -2.727047, 1, 1, 1, 1, 1,
-1.376015, -0.07929041, -0.6499134, 1, 1, 1, 1, 1,
-1.359031, 2.25757, 0.003933829, 1, 1, 1, 1, 1,
-1.351352, -1.211537, -1.661385, 1, 1, 1, 1, 1,
-1.340819, 0.6549274, -1.072921, 1, 1, 1, 1, 1,
-1.339143, 0.2365818, -1.439237, 1, 1, 1, 1, 1,
-1.338095, 0.4402532, -1.601435, 1, 1, 1, 1, 1,
-1.334408, -0.5136741, -1.816182, 1, 1, 1, 1, 1,
-1.324797, -1.634023, -4.2367, 1, 1, 1, 1, 1,
-1.323229, -0.5809519, -1.231143, 1, 1, 1, 1, 1,
-1.321396, -0.4125393, -4.19283, 1, 1, 1, 1, 1,
-1.31819, -0.9107237, -4.633945, 0, 0, 1, 1, 1,
-1.312835, -0.9600983, -3.048618, 1, 0, 0, 1, 1,
-1.31044, 0.5878219, -2.47603, 1, 0, 0, 1, 1,
-1.299615, -0.1843801, -1.798926, 1, 0, 0, 1, 1,
-1.298562, -1.36428, -2.585996, 1, 0, 0, 1, 1,
-1.297851, -1.20525, -2.510627, 1, 0, 0, 1, 1,
-1.288216, -2.169322, -2.395659, 0, 0, 0, 1, 1,
-1.277135, 0.01842298, -0.7556505, 0, 0, 0, 1, 1,
-1.26716, -1.243401, -3.014571, 0, 0, 0, 1, 1,
-1.257547, -0.05163359, -3.437346, 0, 0, 0, 1, 1,
-1.256178, -0.6326381, -0.9571306, 0, 0, 0, 1, 1,
-1.25491, 0.4114849, -2.681189, 0, 0, 0, 1, 1,
-1.246451, -1.435116, -2.754112, 0, 0, 0, 1, 1,
-1.236165, -0.77408, -1.090149, 1, 1, 1, 1, 1,
-1.234852, 0.111556, -1.102239, 1, 1, 1, 1, 1,
-1.230964, -0.8482473, 0.01856416, 1, 1, 1, 1, 1,
-1.197431, -0.8734421, -1.914939, 1, 1, 1, 1, 1,
-1.194747, -2.197925, -2.454345, 1, 1, 1, 1, 1,
-1.19473, 0.8113465, -0.9218022, 1, 1, 1, 1, 1,
-1.193083, -0.64929, -3.372702, 1, 1, 1, 1, 1,
-1.187323, 0.1038153, -2.614843, 1, 1, 1, 1, 1,
-1.18501, -0.3889757, -2.152129, 1, 1, 1, 1, 1,
-1.18107, 0.6420437, 0.4169552, 1, 1, 1, 1, 1,
-1.177101, 0.3856991, -1.708719, 1, 1, 1, 1, 1,
-1.173727, -1.567616, -3.58955, 1, 1, 1, 1, 1,
-1.167053, -1.338476, -0.8221998, 1, 1, 1, 1, 1,
-1.162653, 0.1266384, -1.148998, 1, 1, 1, 1, 1,
-1.161498, -0.05203464, -2.571904, 1, 1, 1, 1, 1,
-1.157524, 0.6576476, -1.367289, 0, 0, 1, 1, 1,
-1.151709, 0.7917892, -2.635192, 1, 0, 0, 1, 1,
-1.14564, -0.0554902, -1.753904, 1, 0, 0, 1, 1,
-1.140064, -0.2604635, -2.206296, 1, 0, 0, 1, 1,
-1.130402, 1.526714, -0.7917227, 1, 0, 0, 1, 1,
-1.106114, -0.1570605, -0.535032, 1, 0, 0, 1, 1,
-1.10296, -1.691915, -2.782238, 0, 0, 0, 1, 1,
-1.102325, -0.6824069, -2.701109, 0, 0, 0, 1, 1,
-1.09921, -1.52015, -2.884303, 0, 0, 0, 1, 1,
-1.098722, 0.2434131, -0.976974, 0, 0, 0, 1, 1,
-1.094783, -0.3017044, -2.049346, 0, 0, 0, 1, 1,
-1.093654, -0.9065908, -0.8048199, 0, 0, 0, 1, 1,
-1.087379, -0.3023624, -1.453721, 0, 0, 0, 1, 1,
-1.082419, 0.3108394, -1.659028, 1, 1, 1, 1, 1,
-1.081281, -0.5880852, -4.011922, 1, 1, 1, 1, 1,
-1.073507, 0.2626655, -1.026649, 1, 1, 1, 1, 1,
-1.071847, -0.4864502, -1.19322, 1, 1, 1, 1, 1,
-1.067284, -1.008778, -2.340435, 1, 1, 1, 1, 1,
-1.063792, 0.02338766, 0.0264363, 1, 1, 1, 1, 1,
-1.056237, 0.7127366, -1.906527, 1, 1, 1, 1, 1,
-1.055202, 1.732059, -0.1736696, 1, 1, 1, 1, 1,
-1.053588, 0.5159418, -1.652299, 1, 1, 1, 1, 1,
-1.053501, -0.4480266, -2.688746, 1, 1, 1, 1, 1,
-1.051396, -2.680602, -5.55802, 1, 1, 1, 1, 1,
-1.045498, 1.813505, 0.6745993, 1, 1, 1, 1, 1,
-1.044408, 0.3531455, -1.417644, 1, 1, 1, 1, 1,
-1.041852, 0.480738, -2.275094, 1, 1, 1, 1, 1,
-1.034933, 1.009341, -1.678529, 1, 1, 1, 1, 1,
-1.034127, 0.7353213, -0.57098, 0, 0, 1, 1, 1,
-1.029639, -0.9876948, -2.198309, 1, 0, 0, 1, 1,
-1.023029, 0.2535571, -3.764316, 1, 0, 0, 1, 1,
-1.017209, 0.5075022, -0.4974344, 1, 0, 0, 1, 1,
-1.012841, 0.4578244, -0.4095266, 1, 0, 0, 1, 1,
-1.012827, -0.857711, -2.329556, 1, 0, 0, 1, 1,
-1.011632, 3.442687, -2.817982, 0, 0, 0, 1, 1,
-1.009411, -0.399575, -0.8446041, 0, 0, 0, 1, 1,
-1.008819, 1.221228, 0.3309587, 0, 0, 0, 1, 1,
-1.007014, 1.491654, -0.1035279, 0, 0, 0, 1, 1,
-1.00582, 1.449528, -0.7415816, 0, 0, 0, 1, 1,
-1.00166, 0.791617, -0.9338165, 0, 0, 0, 1, 1,
-1.001451, -2.23386, -2.171883, 0, 0, 0, 1, 1,
-0.9985104, 1.479206, -2.833872, 1, 1, 1, 1, 1,
-0.9903123, -1.649456, -4.643213, 1, 1, 1, 1, 1,
-0.9823608, 0.01889258, -1.939045, 1, 1, 1, 1, 1,
-0.9800013, -0.4743772, -1.018792, 1, 1, 1, 1, 1,
-0.9786396, -1.400227, -2.222216, 1, 1, 1, 1, 1,
-0.9774012, -1.975379, -3.678515, 1, 1, 1, 1, 1,
-0.9773912, 0.4649343, -0.265674, 1, 1, 1, 1, 1,
-0.9757275, -0.2291011, -1.15611, 1, 1, 1, 1, 1,
-0.9694178, 0.8204904, -0.7834143, 1, 1, 1, 1, 1,
-0.9625239, -0.8512889, -2.648258, 1, 1, 1, 1, 1,
-0.961524, -1.565869, -3.76935, 1, 1, 1, 1, 1,
-0.9535705, -0.3026747, -1.15161, 1, 1, 1, 1, 1,
-0.9500649, 0.07413913, -3.27406, 1, 1, 1, 1, 1,
-0.9481212, 0.1062817, -2.16675, 1, 1, 1, 1, 1,
-0.9471927, -0.2207215, -2.572781, 1, 1, 1, 1, 1,
-0.9424411, 2.80724, 0.4085681, 0, 0, 1, 1, 1,
-0.9313488, -0.7237599, -1.459402, 1, 0, 0, 1, 1,
-0.9169391, -1.672698, -2.570848, 1, 0, 0, 1, 1,
-0.9071594, 0.6268297, -1.318358, 1, 0, 0, 1, 1,
-0.8986885, -0.7902097, -3.47776, 1, 0, 0, 1, 1,
-0.8916467, 0.4696189, -3.77525, 1, 0, 0, 1, 1,
-0.8875264, 1.573366, -0.5508802, 0, 0, 0, 1, 1,
-0.8835495, 1.62661, -1.062211, 0, 0, 0, 1, 1,
-0.86947, 1.492607, -0.2547127, 0, 0, 0, 1, 1,
-0.8665825, 0.5892693, -1.190554, 0, 0, 0, 1, 1,
-0.8644092, 1.142606, -1.590335, 0, 0, 0, 1, 1,
-0.8598605, 0.9783475, -0.8915029, 0, 0, 0, 1, 1,
-0.8507285, 2.429334, -0.5312013, 0, 0, 0, 1, 1,
-0.8480135, -0.3773948, -1.910972, 1, 1, 1, 1, 1,
-0.8455067, 1.801833, 1.421439, 1, 1, 1, 1, 1,
-0.8330749, -0.03231254, -3.664711, 1, 1, 1, 1, 1,
-0.8311687, 0.2051216, -2.142977, 1, 1, 1, 1, 1,
-0.8308447, 0.566179, -1.976425, 1, 1, 1, 1, 1,
-0.8303162, -0.2816779, -1.935145, 1, 1, 1, 1, 1,
-0.8283814, 0.5217111, -2.102654, 1, 1, 1, 1, 1,
-0.8264645, 1.365832, -0.5117939, 1, 1, 1, 1, 1,
-0.8220205, -0.8221633, -0.6935034, 1, 1, 1, 1, 1,
-0.8179901, -0.6446387, -2.196837, 1, 1, 1, 1, 1,
-0.8146296, 0.431197, -1.508261, 1, 1, 1, 1, 1,
-0.8139579, 0.662517, -0.4558271, 1, 1, 1, 1, 1,
-0.8138154, -2.729894, -2.949543, 1, 1, 1, 1, 1,
-0.8108164, 2.389544, -1.382735, 1, 1, 1, 1, 1,
-0.8070688, -1.239664, -3.135684, 1, 1, 1, 1, 1,
-0.802786, 0.7181687, -0.2592339, 0, 0, 1, 1, 1,
-0.8003317, -0.227182, -1.898695, 1, 0, 0, 1, 1,
-0.79997, -0.6341949, -1.869784, 1, 0, 0, 1, 1,
-0.7855844, 1.213093, -0.5396844, 1, 0, 0, 1, 1,
-0.7774509, 0.03728895, -0.1593155, 1, 0, 0, 1, 1,
-0.7774047, -0.399992, -0.5948468, 1, 0, 0, 1, 1,
-0.7733939, 0.495064, -1.067191, 0, 0, 0, 1, 1,
-0.7677291, -0.01752414, -0.7540244, 0, 0, 0, 1, 1,
-0.7659194, -0.7198088, -1.665964, 0, 0, 0, 1, 1,
-0.7631804, 1.078496, -1.759537, 0, 0, 0, 1, 1,
-0.7605407, -1.94232, -1.666938, 0, 0, 0, 1, 1,
-0.755451, -0.3760616, -4.734917, 0, 0, 0, 1, 1,
-0.7546156, -1.394385, -5.835667, 0, 0, 0, 1, 1,
-0.7535202, 0.589926, -3.003019, 1, 1, 1, 1, 1,
-0.7517157, -0.2766226, -2.303173, 1, 1, 1, 1, 1,
-0.7488101, 2.465201, 0.4621592, 1, 1, 1, 1, 1,
-0.7486996, 1.668427, 1.27963, 1, 1, 1, 1, 1,
-0.7458135, -0.2787761, -0.4648798, 1, 1, 1, 1, 1,
-0.7434579, -1.660714, -4.263146, 1, 1, 1, 1, 1,
-0.7433398, 0.6088618, -1.600669, 1, 1, 1, 1, 1,
-0.7409369, 0.8507802, 0.06624743, 1, 1, 1, 1, 1,
-0.7402333, -1.244899, -2.787183, 1, 1, 1, 1, 1,
-0.7402271, 1.106753, -0.9050983, 1, 1, 1, 1, 1,
-0.7365881, -0.01935533, -1.418533, 1, 1, 1, 1, 1,
-0.7271424, -0.4610071, -2.823341, 1, 1, 1, 1, 1,
-0.7268538, -1.673821, -1.705945, 1, 1, 1, 1, 1,
-0.713074, -0.3220253, -2.954341, 1, 1, 1, 1, 1,
-0.7101089, 1.002265, 0.3035325, 1, 1, 1, 1, 1,
-0.6992821, -0.802939, -2.022929, 0, 0, 1, 1, 1,
-0.696048, 0.01685084, -1.644042, 1, 0, 0, 1, 1,
-0.6958909, 1.358186, -1.719115, 1, 0, 0, 1, 1,
-0.6953876, -0.9494202, -1.137888, 1, 0, 0, 1, 1,
-0.6939437, -0.001761369, -1.513131, 1, 0, 0, 1, 1,
-0.6897273, -0.0847736, -0.9051321, 1, 0, 0, 1, 1,
-0.688438, 0.4714699, 0.3687123, 0, 0, 0, 1, 1,
-0.6876937, 0.08886833, 0.1705172, 0, 0, 0, 1, 1,
-0.6848081, 1.300061, -1.141932, 0, 0, 0, 1, 1,
-0.674301, 0.2371319, -0.6192306, 0, 0, 0, 1, 1,
-0.6740995, -0.8510966, -2.263153, 0, 0, 0, 1, 1,
-0.6707388, -0.9881173, -3.069517, 0, 0, 0, 1, 1,
-0.667183, 0.7143757, -0.6152266, 0, 0, 0, 1, 1,
-0.6652162, 1.638641, -0.8555654, 1, 1, 1, 1, 1,
-0.6611716, -2.214777, -4.735243, 1, 1, 1, 1, 1,
-0.6605139, 1.608029, 0.5327855, 1, 1, 1, 1, 1,
-0.6562835, -1.280617, -2.51068, 1, 1, 1, 1, 1,
-0.6561476, -0.7381356, -1.519245, 1, 1, 1, 1, 1,
-0.6504118, -0.446725, -4.267248, 1, 1, 1, 1, 1,
-0.6481595, 0.5660195, -1.332348, 1, 1, 1, 1, 1,
-0.6473726, 1.541598, -0.6566263, 1, 1, 1, 1, 1,
-0.646896, 0.2925206, -0.9095446, 1, 1, 1, 1, 1,
-0.6442493, -0.2641542, -1.422733, 1, 1, 1, 1, 1,
-0.6428975, 0.5429084, -1.104954, 1, 1, 1, 1, 1,
-0.6405039, -0.2202512, -3.400387, 1, 1, 1, 1, 1,
-0.6404956, -0.317566, -0.8776317, 1, 1, 1, 1, 1,
-0.6384865, -1.310687, -1.936928, 1, 1, 1, 1, 1,
-0.6366593, -0.9183369, -1.795092, 1, 1, 1, 1, 1,
-0.6360542, 0.5206529, -0.6547518, 0, 0, 1, 1, 1,
-0.6350053, -0.6087407, -2.680931, 1, 0, 0, 1, 1,
-0.6348046, 1.328368, 0.5552242, 1, 0, 0, 1, 1,
-0.6222223, 0.731205, 1.121444, 1, 0, 0, 1, 1,
-0.6217232, 0.4551202, -1.660586, 1, 0, 0, 1, 1,
-0.6179818, 0.631671, -2.45602, 1, 0, 0, 1, 1,
-0.6159971, 0.8671752, 0.6226383, 0, 0, 0, 1, 1,
-0.6141341, -1.694148, -1.851712, 0, 0, 0, 1, 1,
-0.6138391, 0.6452569, 0.3791175, 0, 0, 0, 1, 1,
-0.6101271, -1.067287, -2.22826, 0, 0, 0, 1, 1,
-0.6078703, 0.2989059, -2.016932, 0, 0, 0, 1, 1,
-0.603712, -1.719401, -2.489951, 0, 0, 0, 1, 1,
-0.6012468, -1.024305, -3.665133, 0, 0, 0, 1, 1,
-0.6006159, 1.651687, 0.3162431, 1, 1, 1, 1, 1,
-0.5998338, 2.120966, -0.7225605, 1, 1, 1, 1, 1,
-0.5982404, 0.02971923, 1.539654, 1, 1, 1, 1, 1,
-0.5928171, 1.03093, 0.8800136, 1, 1, 1, 1, 1,
-0.5924992, -1.253549, -3.263673, 1, 1, 1, 1, 1,
-0.5899712, -0.4589022, -2.001346, 1, 1, 1, 1, 1,
-0.5883737, -0.9943741, -4.059063, 1, 1, 1, 1, 1,
-0.5784448, -0.8980907, -1.827939, 1, 1, 1, 1, 1,
-0.5742094, -1.209508, -2.985344, 1, 1, 1, 1, 1,
-0.5727367, 1.99351, -0.5440373, 1, 1, 1, 1, 1,
-0.5639886, -1.530551, -2.161832, 1, 1, 1, 1, 1,
-0.553762, -0.2687045, -3.053189, 1, 1, 1, 1, 1,
-0.5524332, -0.3696803, -2.859093, 1, 1, 1, 1, 1,
-0.5519465, 0.6402191, -2.100639, 1, 1, 1, 1, 1,
-0.5498784, -0.2135539, -1.867196, 1, 1, 1, 1, 1,
-0.5486026, -2.702585, -2.37225, 0, 0, 1, 1, 1,
-0.5471747, 0.1356434, -1.208386, 1, 0, 0, 1, 1,
-0.5454631, -0.4341665, -1.079583, 1, 0, 0, 1, 1,
-0.5422941, 0.5971983, -1.397546, 1, 0, 0, 1, 1,
-0.5403215, -1.408445, -3.350805, 1, 0, 0, 1, 1,
-0.5390365, 0.758732, -1.668707, 1, 0, 0, 1, 1,
-0.5362408, -0.4521029, -3.207132, 0, 0, 0, 1, 1,
-0.5356302, -1.404458, -3.404003, 0, 0, 0, 1, 1,
-0.5346361, 0.7044394, -1.191826, 0, 0, 0, 1, 1,
-0.5284981, -0.4788273, -1.358505, 0, 0, 0, 1, 1,
-0.5283397, 0.6704198, -0.6895244, 0, 0, 0, 1, 1,
-0.5263618, 2.053337, 0.1417352, 0, 0, 0, 1, 1,
-0.5257779, -0.9996106, -2.649384, 0, 0, 0, 1, 1,
-0.5230903, 1.049689, -1.141072, 1, 1, 1, 1, 1,
-0.5217055, -0.2597829, -2.484713, 1, 1, 1, 1, 1,
-0.5210627, -0.3494409, -1.029122, 1, 1, 1, 1, 1,
-0.520174, -1.559581, -2.55416, 1, 1, 1, 1, 1,
-0.5201474, -0.3160681, -1.697783, 1, 1, 1, 1, 1,
-0.5200484, 1.389331, -0.4981149, 1, 1, 1, 1, 1,
-0.5198313, -0.5332718, -3.286309, 1, 1, 1, 1, 1,
-0.5196533, -0.9012839, -3.486769, 1, 1, 1, 1, 1,
-0.5173308, -0.3827035, -1.513835, 1, 1, 1, 1, 1,
-0.5132725, -0.2279563, -1.881778, 1, 1, 1, 1, 1,
-0.5122113, 0.3861049, -1.556006, 1, 1, 1, 1, 1,
-0.5099986, 1.998328, -0.01507123, 1, 1, 1, 1, 1,
-0.5098845, -1.609809, -3.178551, 1, 1, 1, 1, 1,
-0.5064042, 0.01003999, -2.040445, 1, 1, 1, 1, 1,
-0.5051131, 0.0836276, 0.3142711, 1, 1, 1, 1, 1,
-0.5028433, 0.4304028, -1.699218, 0, 0, 1, 1, 1,
-0.49934, -1.955222, -1.581681, 1, 0, 0, 1, 1,
-0.4977191, 0.4252252, -1.907209, 1, 0, 0, 1, 1,
-0.4954703, 1.546154, 1.673754, 1, 0, 0, 1, 1,
-0.485884, -0.4521569, -2.920063, 1, 0, 0, 1, 1,
-0.4851361, -1.138542, -3.751147, 1, 0, 0, 1, 1,
-0.4829302, -2.463075, -3.581835, 0, 0, 0, 1, 1,
-0.4644399, 1.462856, 0.7368627, 0, 0, 0, 1, 1,
-0.4641061, -0.2284509, -3.385259, 0, 0, 0, 1, 1,
-0.4624416, 1.423537, 0.2881727, 0, 0, 0, 1, 1,
-0.4604939, 1.226674, -0.8900359, 0, 0, 0, 1, 1,
-0.459738, -1.411423, -4.865886, 0, 0, 0, 1, 1,
-0.4585475, -1.686813, -2.387513, 0, 0, 0, 1, 1,
-0.4565176, 0.3975077, -0.9683128, 1, 1, 1, 1, 1,
-0.4559689, 0.03895983, -0.9520898, 1, 1, 1, 1, 1,
-0.4542036, -1.739199, -2.180171, 1, 1, 1, 1, 1,
-0.4499608, 1.327616, -0.311964, 1, 1, 1, 1, 1,
-0.4424647, -0.3385477, -0.5418205, 1, 1, 1, 1, 1,
-0.4411802, -0.7722044, -3.775171, 1, 1, 1, 1, 1,
-0.4406795, -0.5188711, -2.93359, 1, 1, 1, 1, 1,
-0.4312738, 1.095332, -1.342477, 1, 1, 1, 1, 1,
-0.42938, 1.283355, 0.5475712, 1, 1, 1, 1, 1,
-0.4280236, -1.09336, -1.725665, 1, 1, 1, 1, 1,
-0.4260031, -0.618988, -1.992796, 1, 1, 1, 1, 1,
-0.4244123, 0.1993681, 1.032879, 1, 1, 1, 1, 1,
-0.4175751, 0.8252088, -1.769073, 1, 1, 1, 1, 1,
-0.4128766, 0.00772107, -1.270278, 1, 1, 1, 1, 1,
-0.3895093, -0.5638115, -3.435352, 1, 1, 1, 1, 1,
-0.3843144, 0.3630788, 0.5734904, 0, 0, 1, 1, 1,
-0.3831931, -2.713735, -3.706993, 1, 0, 0, 1, 1,
-0.3830893, -0.9156808, -6.045836, 1, 0, 0, 1, 1,
-0.3825356, -0.9987656, -2.988594, 1, 0, 0, 1, 1,
-0.3783008, -0.8754497, -2.91836, 1, 0, 0, 1, 1,
-0.3772788, 1.367409, -0.1728369, 1, 0, 0, 1, 1,
-0.3699246, 0.4151921, -0.4912876, 0, 0, 0, 1, 1,
-0.3681575, -0.03080436, -0.8802698, 0, 0, 0, 1, 1,
-0.3645769, 0.4810759, -0.6529239, 0, 0, 0, 1, 1,
-0.3617012, 0.4400506, 0.563749, 0, 0, 0, 1, 1,
-0.3612827, 0.0004034218, -0.5271969, 0, 0, 0, 1, 1,
-0.3541975, -0.4867526, -1.192883, 0, 0, 0, 1, 1,
-0.3486035, -0.2556678, -2.020168, 0, 0, 0, 1, 1,
-0.347661, 0.8385164, 0.4490263, 1, 1, 1, 1, 1,
-0.3472922, -0.545031, -1.199406, 1, 1, 1, 1, 1,
-0.3426096, 2.362031, 1.07318, 1, 1, 1, 1, 1,
-0.3410503, 0.08550567, -2.002553, 1, 1, 1, 1, 1,
-0.3386785, -0.2324835, -2.342137, 1, 1, 1, 1, 1,
-0.3381392, -0.7618454, -3.145629, 1, 1, 1, 1, 1,
-0.3343293, -0.6092562, -2.861499, 1, 1, 1, 1, 1,
-0.3310604, -0.8222345, -2.532858, 1, 1, 1, 1, 1,
-0.3279429, -1.068764, -3.505537, 1, 1, 1, 1, 1,
-0.3267744, -0.4984858, -3.492148, 1, 1, 1, 1, 1,
-0.3256411, -0.651218, -1.140389, 1, 1, 1, 1, 1,
-0.3100301, 0.3117067, 0.8866012, 1, 1, 1, 1, 1,
-0.3033141, -0.4581306, -2.984474, 1, 1, 1, 1, 1,
-0.2977377, -0.8510499, -1.370108, 1, 1, 1, 1, 1,
-0.2954133, 0.8582042, -0.6785117, 1, 1, 1, 1, 1,
-0.291558, 1.355486, -1.604739, 0, 0, 1, 1, 1,
-0.2909464, -0.5116561, -4.152209, 1, 0, 0, 1, 1,
-0.2885341, -0.0376621, -1.345213, 1, 0, 0, 1, 1,
-0.287015, 1.120869, -0.4315848, 1, 0, 0, 1, 1,
-0.2859557, -0.02099193, -3.855465, 1, 0, 0, 1, 1,
-0.284836, 1.354114, 0.3556906, 1, 0, 0, 1, 1,
-0.2840884, 0.1439922, -2.094606, 0, 0, 0, 1, 1,
-0.2834916, -0.05604185, 0.0002676172, 0, 0, 0, 1, 1,
-0.2821506, 0.08496747, -0.1872053, 0, 0, 0, 1, 1,
-0.2768728, 0.2643644, -0.2100336, 0, 0, 0, 1, 1,
-0.2748342, -1.633594, -3.577667, 0, 0, 0, 1, 1,
-0.2704103, -0.7698975, -2.412077, 0, 0, 0, 1, 1,
-0.2700604, 2.64603, -0.5481454, 0, 0, 0, 1, 1,
-0.259305, -1.288173, -3.126587, 1, 1, 1, 1, 1,
-0.2572604, 0.4471181, -2.277374, 1, 1, 1, 1, 1,
-0.2518936, -1.366629, -2.752066, 1, 1, 1, 1, 1,
-0.251719, 0.00626572, -2.625506, 1, 1, 1, 1, 1,
-0.250611, 0.5620854, -0.7558703, 1, 1, 1, 1, 1,
-0.2495626, -0.1239516, -2.440026, 1, 1, 1, 1, 1,
-0.2492752, 0.1262158, -1.06581, 1, 1, 1, 1, 1,
-0.2480311, -0.06510612, -2.070705, 1, 1, 1, 1, 1,
-0.2423868, 0.6531737, 0.2036741, 1, 1, 1, 1, 1,
-0.2417244, 0.6847105, -0.03864046, 1, 1, 1, 1, 1,
-0.2395103, 0.5418413, -1.689845, 1, 1, 1, 1, 1,
-0.2366111, 1.697953, -1.556673, 1, 1, 1, 1, 1,
-0.2363312, 1.026118, 1.994574, 1, 1, 1, 1, 1,
-0.2323624, 0.6831797, -0.4211275, 1, 1, 1, 1, 1,
-0.2303498, -1.100816, -1.311623, 1, 1, 1, 1, 1,
-0.225104, -1.620148, -2.772912, 0, 0, 1, 1, 1,
-0.2201075, -1.165161, -3.089026, 1, 0, 0, 1, 1,
-0.2189473, 0.3141679, -0.7041159, 1, 0, 0, 1, 1,
-0.218086, -0.2679031, -1.522388, 1, 0, 0, 1, 1,
-0.2120562, -0.6213392, -3.021741, 1, 0, 0, 1, 1,
-0.209691, -0.007978406, -2.599631, 1, 0, 0, 1, 1,
-0.2084444, -1.285265, -3.698573, 0, 0, 0, 1, 1,
-0.2084045, -1.474263, -2.233761, 0, 0, 0, 1, 1,
-0.2055879, 0.06582156, -2.378332, 0, 0, 0, 1, 1,
-0.201204, 2.256188, -1.106788, 0, 0, 0, 1, 1,
-0.1998881, -0.4961011, -2.672511, 0, 0, 0, 1, 1,
-0.194768, -0.3639541, -0.979964, 0, 0, 0, 1, 1,
-0.1942668, 0.8942036, -1.839794, 0, 0, 0, 1, 1,
-0.1933908, 0.9626586, -0.6339124, 1, 1, 1, 1, 1,
-0.1895156, 0.4187492, 0.5414513, 1, 1, 1, 1, 1,
-0.1888577, 0.04850448, -1.508984, 1, 1, 1, 1, 1,
-0.1874679, -1.952786, -3.040622, 1, 1, 1, 1, 1,
-0.185935, 0.6987382, -0.3482927, 1, 1, 1, 1, 1,
-0.1838915, 1.234518, 0.2252012, 1, 1, 1, 1, 1,
-0.1831819, -1.222655, -2.700942, 1, 1, 1, 1, 1,
-0.1801621, -0.7808343, -3.175893, 1, 1, 1, 1, 1,
-0.1791989, 0.005498287, -1.634443, 1, 1, 1, 1, 1,
-0.17663, -1.443613, -3.130903, 1, 1, 1, 1, 1,
-0.1744301, 0.3268376, -0.2612835, 1, 1, 1, 1, 1,
-0.1647911, -1.183317, -3.678708, 1, 1, 1, 1, 1,
-0.1646469, 0.09987292, 0.181724, 1, 1, 1, 1, 1,
-0.1646382, 0.9042785, -0.5199524, 1, 1, 1, 1, 1,
-0.16095, 0.1276191, -1.294212, 1, 1, 1, 1, 1,
-0.1547651, 0.8517605, -0.353852, 0, 0, 1, 1, 1,
-0.1509505, 0.6297791, -0.08306217, 1, 0, 0, 1, 1,
-0.1506286, 1.149138, -1.315891, 1, 0, 0, 1, 1,
-0.1469423, -1.200526, -3.218426, 1, 0, 0, 1, 1,
-0.1468834, 2.041027, 1.23283, 1, 0, 0, 1, 1,
-0.1447022, 1.003841, -0.2726306, 1, 0, 0, 1, 1,
-0.1427371, 0.02761455, -1.842721, 0, 0, 0, 1, 1,
-0.1418242, -1.214387, -3.678972, 0, 0, 0, 1, 1,
-0.1404224, -0.5693134, -4.010228, 0, 0, 0, 1, 1,
-0.1355798, -1.240089, -4.099736, 0, 0, 0, 1, 1,
-0.1300177, 0.7586464, 0.2718304, 0, 0, 0, 1, 1,
-0.1265365, -0.6335377, -5.216868, 0, 0, 0, 1, 1,
-0.1210912, 1.616048, -1.228788, 0, 0, 0, 1, 1,
-0.1192604, -0.851735, -3.447791, 1, 1, 1, 1, 1,
-0.1180659, 1.586411, 0.3812909, 1, 1, 1, 1, 1,
-0.1155742, 1.678896, -1.278952, 1, 1, 1, 1, 1,
-0.1147027, 1.193111, -0.7418992, 1, 1, 1, 1, 1,
-0.1130307, -2.545865, -2.975965, 1, 1, 1, 1, 1,
-0.1104814, -0.2802891, -3.116676, 1, 1, 1, 1, 1,
-0.1095979, -1.047443, -3.692602, 1, 1, 1, 1, 1,
-0.1066835, 0.7196583, -1.18741, 1, 1, 1, 1, 1,
-0.104994, 0.09251471, -1.19564, 1, 1, 1, 1, 1,
-0.1049402, -0.9289967, -3.742263, 1, 1, 1, 1, 1,
-0.1049179, -1.378544, -0.8864032, 1, 1, 1, 1, 1,
-0.0999616, 0.7733335, -1.565526, 1, 1, 1, 1, 1,
-0.09958486, 1.219554, 0.01066716, 1, 1, 1, 1, 1,
-0.09759209, -1.524714, -2.595225, 1, 1, 1, 1, 1,
-0.09361468, 1.782226, -0.5901945, 1, 1, 1, 1, 1,
-0.08904546, 0.2294141, 1.068003, 0, 0, 1, 1, 1,
-0.08482835, 0.366383, 0.9713698, 1, 0, 0, 1, 1,
-0.08302946, 0.9394791, -0.5128258, 1, 0, 0, 1, 1,
-0.07875011, 2.378258, -0.2128173, 1, 0, 0, 1, 1,
-0.07714463, -1.813749, -3.676597, 1, 0, 0, 1, 1,
-0.0762035, -0.05358221, -2.322378, 1, 0, 0, 1, 1,
-0.07418533, 1.567949, 0.4808375, 0, 0, 0, 1, 1,
-0.06011882, 0.6364132, -0.1556859, 0, 0, 0, 1, 1,
-0.05873012, -0.8319927, -3.56109, 0, 0, 0, 1, 1,
-0.05521214, 0.9242136, 3.479657, 0, 0, 0, 1, 1,
-0.0499296, -0.1722532, -3.158528, 0, 0, 0, 1, 1,
-0.04256351, -0.8114835, -3.081065, 0, 0, 0, 1, 1,
-0.04236988, 0.7171288, 0.1678504, 0, 0, 0, 1, 1,
-0.03920362, 0.4812664, 0.3160648, 1, 1, 1, 1, 1,
-0.03718746, -0.5752429, -3.753497, 1, 1, 1, 1, 1,
-0.0369628, -1.568542, -4.912896, 1, 1, 1, 1, 1,
-0.03526816, 0.8094612, 1.096024, 1, 1, 1, 1, 1,
-0.03471307, -0.9750838, -4.254445, 1, 1, 1, 1, 1,
-0.03079676, 1.262485, 0.5190107, 1, 1, 1, 1, 1,
-0.03036329, -0.7167256, -2.845232, 1, 1, 1, 1, 1,
-0.02993458, 0.1053457, -1.047775, 1, 1, 1, 1, 1,
-0.02955927, 0.2710387, 0.3195922, 1, 1, 1, 1, 1,
-0.0278734, 0.193729, 0.04283936, 1, 1, 1, 1, 1,
-0.02585634, 0.3216848, -2.093617, 1, 1, 1, 1, 1,
-0.02476446, 1.548185, 0.725244, 1, 1, 1, 1, 1,
-0.01858798, 1.149322, -0.2482933, 1, 1, 1, 1, 1,
-0.01164632, -0.3424376, -1.205968, 1, 1, 1, 1, 1,
-0.0111829, 0.8606045, -0.7036158, 1, 1, 1, 1, 1,
-0.006965017, 1.318006, 1.864203, 0, 0, 1, 1, 1,
-0.005886433, 0.212372, 0.9403889, 1, 0, 0, 1, 1,
0.001018752, 1.950221, -0.1791254, 1, 0, 0, 1, 1,
0.002495751, -0.6791827, 2.767466, 1, 0, 0, 1, 1,
0.003788708, -0.2429535, 3.730604, 1, 0, 0, 1, 1,
0.004141088, -0.3394767, 3.706729, 1, 0, 0, 1, 1,
0.01107531, -0.4909871, 2.173384, 0, 0, 0, 1, 1,
0.01207236, 0.1379462, -1.716227, 0, 0, 0, 1, 1,
0.01395884, 0.2296289, -0.1420285, 0, 0, 0, 1, 1,
0.01564325, 0.5479043, 0.267695, 0, 0, 0, 1, 1,
0.01651114, -2.664536, 2.619536, 0, 0, 0, 1, 1,
0.01830963, -0.5670708, 2.864953, 0, 0, 0, 1, 1,
0.0194178, 0.1595326, 1.042818, 0, 0, 0, 1, 1,
0.02271667, 2.273152, 0.8231797, 1, 1, 1, 1, 1,
0.02808903, -1.884698, 1.976578, 1, 1, 1, 1, 1,
0.03141448, 0.237763, 0.2697702, 1, 1, 1, 1, 1,
0.03325374, -2.015596, 4.48523, 1, 1, 1, 1, 1,
0.03844962, 0.5772011, -0.4941408, 1, 1, 1, 1, 1,
0.04123567, 1.197984, -1.33602, 1, 1, 1, 1, 1,
0.0428577, 1.338096, -0.3552105, 1, 1, 1, 1, 1,
0.04689457, -1.531884, 3.100691, 1, 1, 1, 1, 1,
0.0484311, -0.3014256, 4.816789, 1, 1, 1, 1, 1,
0.05072665, 0.2874572, 0.5930666, 1, 1, 1, 1, 1,
0.05502689, 0.3358572, 0.6797232, 1, 1, 1, 1, 1,
0.05544637, -0.5790086, 2.724906, 1, 1, 1, 1, 1,
0.05767487, -1.25871, 2.492468, 1, 1, 1, 1, 1,
0.06747007, -0.9386626, 3.322432, 1, 1, 1, 1, 1,
0.06792834, 1.447827, 1.875123, 1, 1, 1, 1, 1,
0.07110063, -1.474957, 3.135958, 0, 0, 1, 1, 1,
0.07160889, 1.423068, 0.7200546, 1, 0, 0, 1, 1,
0.07407612, 1.26324, -0.7677544, 1, 0, 0, 1, 1,
0.07469156, -0.509686, 1.107365, 1, 0, 0, 1, 1,
0.07701124, -0.9255772, 4.058337, 1, 0, 0, 1, 1,
0.07726684, 0.3404827, -0.8919002, 1, 0, 0, 1, 1,
0.08026652, -0.5233796, 1.293494, 0, 0, 0, 1, 1,
0.08389089, 1.134751, 0.5437362, 0, 0, 0, 1, 1,
0.08980315, -1.390166, 3.824436, 0, 0, 0, 1, 1,
0.09178231, -0.3000335, 3.202305, 0, 0, 0, 1, 1,
0.09487695, -1.017696, 4.30059, 0, 0, 0, 1, 1,
0.09547108, -0.8692566, 2.718672, 0, 0, 0, 1, 1,
0.09865852, -0.268893, 2.648284, 0, 0, 0, 1, 1,
0.09915294, -0.3037466, 1.664506, 1, 1, 1, 1, 1,
0.103653, -0.9129716, 0.8148884, 1, 1, 1, 1, 1,
0.1037407, -0.2386754, 1.813203, 1, 1, 1, 1, 1,
0.1039827, 0.8636557, -0.4100876, 1, 1, 1, 1, 1,
0.1124518, 0.1893057, 1.603062, 1, 1, 1, 1, 1,
0.1140785, 1.293794, 0.6746948, 1, 1, 1, 1, 1,
0.1157915, -0.6109194, 2.486172, 1, 1, 1, 1, 1,
0.1163417, -1.358793, 2.984829, 1, 1, 1, 1, 1,
0.1205542, 1.896959, 0.6041819, 1, 1, 1, 1, 1,
0.1217201, -0.7231219, 4.44894, 1, 1, 1, 1, 1,
0.1231809, 0.0319823, 0.9145215, 1, 1, 1, 1, 1,
0.1289922, -2.173141, 2.917464, 1, 1, 1, 1, 1,
0.1296368, -1.208184, 2.975157, 1, 1, 1, 1, 1,
0.1312612, -0.1029604, 3.391218, 1, 1, 1, 1, 1,
0.1362362, -0.4761837, 3.355346, 1, 1, 1, 1, 1,
0.1450009, 1.609979, -1.303241, 0, 0, 1, 1, 1,
0.1451948, -1.571165, 4.237965, 1, 0, 0, 1, 1,
0.15145, -0.1010079, 1.53741, 1, 0, 0, 1, 1,
0.1524467, -1.116453, 3.786703, 1, 0, 0, 1, 1,
0.1563848, 1.389943, -0.3024297, 1, 0, 0, 1, 1,
0.1586014, -0.2906664, 2.395081, 1, 0, 0, 1, 1,
0.1599819, 1.607798, 0.0600572, 0, 0, 0, 1, 1,
0.1621088, -1.379344, 0.6098408, 0, 0, 0, 1, 1,
0.1630008, -0.3206753, 3.793703, 0, 0, 0, 1, 1,
0.1635344, -0.5817259, 3.649019, 0, 0, 0, 1, 1,
0.1646517, 0.01611414, 2.16966, 0, 0, 0, 1, 1,
0.1654277, -0.02646414, -0.3594432, 0, 0, 0, 1, 1,
0.1663116, 0.5838339, 1.656179, 0, 0, 0, 1, 1,
0.1690712, -0.2697841, 3.467521, 1, 1, 1, 1, 1,
0.1711389, 2.100836, 1.544287, 1, 1, 1, 1, 1,
0.1750824, -0.9206994, 1.836391, 1, 1, 1, 1, 1,
0.1757543, 0.5967196, -1.610344, 1, 1, 1, 1, 1,
0.1758911, -1.135573, 1.642845, 1, 1, 1, 1, 1,
0.179953, 0.3836706, -0.06096374, 1, 1, 1, 1, 1,
0.1800834, 1.156531, 0.3706539, 1, 1, 1, 1, 1,
0.1848602, 0.9711235, 0.05083835, 1, 1, 1, 1, 1,
0.1862464, -0.2771988, 2.78431, 1, 1, 1, 1, 1,
0.1896117, -0.004899011, 1.77186, 1, 1, 1, 1, 1,
0.1918953, -0.03130287, 2.916186, 1, 1, 1, 1, 1,
0.1930318, 0.7489163, 0.5172989, 1, 1, 1, 1, 1,
0.1996406, -1.742485, 2.07865, 1, 1, 1, 1, 1,
0.2041218, -2.15038, 2.885083, 1, 1, 1, 1, 1,
0.2051589, 0.1062361, 0.162194, 1, 1, 1, 1, 1,
0.2052359, 1.349189, 0.7319179, 0, 0, 1, 1, 1,
0.2058937, 0.6928362, -0.3768754, 1, 0, 0, 1, 1,
0.2070336, -1.534892, 2.601375, 1, 0, 0, 1, 1,
0.2166308, -0.1880278, 1.377234, 1, 0, 0, 1, 1,
0.2290834, 0.192235, -0.4354891, 1, 0, 0, 1, 1,
0.2300648, -0.4965169, 2.980259, 1, 0, 0, 1, 1,
0.2322158, -0.2428556, 1.866427, 0, 0, 0, 1, 1,
0.232954, -0.8167845, 2.345962, 0, 0, 0, 1, 1,
0.2332993, -0.06087952, 1.239059, 0, 0, 0, 1, 1,
0.2333065, -1.376688, 3.885444, 0, 0, 0, 1, 1,
0.2352061, -1.652787, 1.454631, 0, 0, 0, 1, 1,
0.2364732, -0.6273125, 3.493052, 0, 0, 0, 1, 1,
0.2380134, 0.1690609, 1.452102, 0, 0, 0, 1, 1,
0.2382129, 0.9299805, -0.2553137, 1, 1, 1, 1, 1,
0.2383892, 0.09740321, -0.1269074, 1, 1, 1, 1, 1,
0.2402536, -0.714312, 1.983785, 1, 1, 1, 1, 1,
0.2408473, 0.8141355, -1.408437, 1, 1, 1, 1, 1,
0.2424081, 2.099103, -0.442246, 1, 1, 1, 1, 1,
0.2428314, -0.5566549, 3.073985, 1, 1, 1, 1, 1,
0.2430951, -0.6093541, 1.456944, 1, 1, 1, 1, 1,
0.2446942, -0.2153522, 1.672804, 1, 1, 1, 1, 1,
0.245989, 0.2378878, 1.702647, 1, 1, 1, 1, 1,
0.2471803, 0.6085735, 0.4476243, 1, 1, 1, 1, 1,
0.2478553, -0.4308062, 2.305623, 1, 1, 1, 1, 1,
0.250236, -0.04280558, 0.05370833, 1, 1, 1, 1, 1,
0.251507, -2.22673, 3.364318, 1, 1, 1, 1, 1,
0.2525818, 0.7720385, 2.210693, 1, 1, 1, 1, 1,
0.2552297, 1.38241, 1.473364, 1, 1, 1, 1, 1,
0.2673399, -0.3354181, 2.468817, 0, 0, 1, 1, 1,
0.270412, 1.442039, 1.246339, 1, 0, 0, 1, 1,
0.2729132, 0.7107938, -0.2970354, 1, 0, 0, 1, 1,
0.2732588, -0.439781, 1.267791, 1, 0, 0, 1, 1,
0.2740321, 0.6610113, -0.4146529, 1, 0, 0, 1, 1,
0.2750553, -0.4360655, 0.6091273, 1, 0, 0, 1, 1,
0.2813812, 1.461491, 0.4144229, 0, 0, 0, 1, 1,
0.2845758, 1.150823, -1.487995, 0, 0, 0, 1, 1,
0.2886232, -2.111567, 3.041076, 0, 0, 0, 1, 1,
0.2887609, 0.8964842, 0.688821, 0, 0, 0, 1, 1,
0.2891076, 1.248084, 3.291382, 0, 0, 0, 1, 1,
0.2911349, -0.4525689, 1.644213, 0, 0, 0, 1, 1,
0.2916056, 0.001115646, -0.03938868, 0, 0, 0, 1, 1,
0.2935137, -0.4303041, 2.544204, 1, 1, 1, 1, 1,
0.2948279, -0.4062299, 2.274833, 1, 1, 1, 1, 1,
0.2954973, -0.07324007, 1.571498, 1, 1, 1, 1, 1,
0.2968996, -0.5349969, 3.10062, 1, 1, 1, 1, 1,
0.2978145, -0.05594833, 1.192316, 1, 1, 1, 1, 1,
0.2986698, 0.3997231, 1.908201, 1, 1, 1, 1, 1,
0.3035155, 0.08861262, 0.5435299, 1, 1, 1, 1, 1,
0.3054708, 1.593178, -0.2342646, 1, 1, 1, 1, 1,
0.3162183, -1.236862, 3.340802, 1, 1, 1, 1, 1,
0.317975, 0.1054209, 0.5783905, 1, 1, 1, 1, 1,
0.3194843, -0.1322741, 2.107907, 1, 1, 1, 1, 1,
0.3202558, -1.328795, 2.928619, 1, 1, 1, 1, 1,
0.3203393, 0.7612747, 1.197788, 1, 1, 1, 1, 1,
0.3211312, -0.1553078, 2.769506, 1, 1, 1, 1, 1,
0.3218282, 1.108709, 1.716795, 1, 1, 1, 1, 1,
0.3218825, 1.335333, -0.03244087, 0, 0, 1, 1, 1,
0.3219865, 0.08688096, 1.91516, 1, 0, 0, 1, 1,
0.3300574, -1.403975, 1.724025, 1, 0, 0, 1, 1,
0.3301782, -0.3057577, 1.054443, 1, 0, 0, 1, 1,
0.3391345, -0.243325, 2.316826, 1, 0, 0, 1, 1,
0.3393106, -0.9175271, 0.9626195, 1, 0, 0, 1, 1,
0.3401009, 0.3566728, 0.77821, 0, 0, 0, 1, 1,
0.3415048, 1.418624, 0.6461766, 0, 0, 0, 1, 1,
0.3504271, 0.5960198, 0.6098762, 0, 0, 0, 1, 1,
0.3507906, -0.6739441, 3.768929, 0, 0, 0, 1, 1,
0.3508158, 0.05037982, 1.74254, 0, 0, 0, 1, 1,
0.354616, -0.04296681, 1.140504, 0, 0, 0, 1, 1,
0.3604135, -0.05853784, 2.167886, 0, 0, 0, 1, 1,
0.3612493, -0.1856555, -0.4796399, 1, 1, 1, 1, 1,
0.3637673, 0.5945294, -0.9818316, 1, 1, 1, 1, 1,
0.3652725, -1.525039, 3.127731, 1, 1, 1, 1, 1,
0.3664256, -1.3242, 1.424178, 1, 1, 1, 1, 1,
0.3668775, 0.04949177, 0.6295457, 1, 1, 1, 1, 1,
0.3720725, 0.1207882, 0.1089463, 1, 1, 1, 1, 1,
0.3753764, 0.840645, 0.4103822, 1, 1, 1, 1, 1,
0.378693, -0.409338, 2.678736, 1, 1, 1, 1, 1,
0.3790146, 0.4398676, 0.3634205, 1, 1, 1, 1, 1,
0.3887161, 0.2322793, -1.932228, 1, 1, 1, 1, 1,
0.3894156, 0.5954694, -0.6617848, 1, 1, 1, 1, 1,
0.3928804, -0.07342619, 1.666176, 1, 1, 1, 1, 1,
0.3929732, 0.4187216, 1.621374, 1, 1, 1, 1, 1,
0.3938601, 1.169311, -2.061871, 1, 1, 1, 1, 1,
0.3954853, -0.01200414, 1.539503, 1, 1, 1, 1, 1,
0.4038986, -0.5906292, 1.139685, 0, 0, 1, 1, 1,
0.4043184, 1.68763, 0.5393381, 1, 0, 0, 1, 1,
0.4088274, 0.3057315, 0.1872022, 1, 0, 0, 1, 1,
0.4113081, 1.025003, -0.5789121, 1, 0, 0, 1, 1,
0.4114884, 0.6972964, -0.5573953, 1, 0, 0, 1, 1,
0.4119545, 0.8046292, 1.63388, 1, 0, 0, 1, 1,
0.4145853, 0.7712353, 1.956561, 0, 0, 0, 1, 1,
0.4236635, -1.339098, 1.577341, 0, 0, 0, 1, 1,
0.4263135, 1.246114, -1.188347, 0, 0, 0, 1, 1,
0.4301864, 0.9157683, -0.5360157, 0, 0, 0, 1, 1,
0.430921, -0.5277409, 2.711245, 0, 0, 0, 1, 1,
0.4388257, -0.8987994, 4.153904, 0, 0, 0, 1, 1,
0.4409853, -1.234693, 2.964565, 0, 0, 0, 1, 1,
0.4458117, 1.232574, 0.4585701, 1, 1, 1, 1, 1,
0.4502372, 0.4403281, 0.3062117, 1, 1, 1, 1, 1,
0.455456, -1.340283, 1.388117, 1, 1, 1, 1, 1,
0.4561848, 0.4600573, 2.548938, 1, 1, 1, 1, 1,
0.4586179, 0.6389048, 0.8088302, 1, 1, 1, 1, 1,
0.4589678, -1.055188, 5.471961, 1, 1, 1, 1, 1,
0.462994, -0.2992007, 3.375467, 1, 1, 1, 1, 1,
0.4635714, -2.433879, 3.71798, 1, 1, 1, 1, 1,
0.4650495, 0.1194848, 1.706611, 1, 1, 1, 1, 1,
0.4678027, -0.6806915, 1.866066, 1, 1, 1, 1, 1,
0.4685119, -1.359493, 2.701576, 1, 1, 1, 1, 1,
0.4697671, 0.4499035, 1.087749, 1, 1, 1, 1, 1,
0.4720044, 0.6423542, 0.1845365, 1, 1, 1, 1, 1,
0.4721472, 1.884077, 0.5590435, 1, 1, 1, 1, 1,
0.4767832, -1.739352, 3.770893, 1, 1, 1, 1, 1,
0.4774603, 0.3216424, 1.962688, 0, 0, 1, 1, 1,
0.479419, 0.4297808, 1.178672, 1, 0, 0, 1, 1,
0.4858598, 1.546112, 0.140397, 1, 0, 0, 1, 1,
0.4897873, 1.015625, 0.9752016, 1, 0, 0, 1, 1,
0.4908091, 0.371118, -0.3117608, 1, 0, 0, 1, 1,
0.4961779, 1.394407, 3.013707, 1, 0, 0, 1, 1,
0.5009751, 0.3322566, 0.6350449, 0, 0, 0, 1, 1,
0.5064288, 0.2203631, 1.075924, 0, 0, 0, 1, 1,
0.5066853, -1.093813, 2.852091, 0, 0, 0, 1, 1,
0.5096065, 2.967771, 2.678645, 0, 0, 0, 1, 1,
0.5106393, -0.6502063, 3.219637, 0, 0, 0, 1, 1,
0.5134971, -0.09773199, 2.337558, 0, 0, 0, 1, 1,
0.5145762, 0.08075099, 1.417332, 0, 0, 0, 1, 1,
0.5145909, 1.053703, -0.3133911, 1, 1, 1, 1, 1,
0.5177867, -0.2850042, 4.073539, 1, 1, 1, 1, 1,
0.5182105, -0.6464902, 2.537657, 1, 1, 1, 1, 1,
0.5204551, -3.570148, 2.120785, 1, 1, 1, 1, 1,
0.5218068, 0.9687064, 0.4212661, 1, 1, 1, 1, 1,
0.5240878, 0.7357004, 1.156204, 1, 1, 1, 1, 1,
0.5272192, -0.645408, 4.759774, 1, 1, 1, 1, 1,
0.5275586, 0.6881233, 1.777416, 1, 1, 1, 1, 1,
0.5317148, 0.6690256, 0.6349835, 1, 1, 1, 1, 1,
0.5353888, 0.09750065, 2.033641, 1, 1, 1, 1, 1,
0.5361258, -0.4835513, 0.04995004, 1, 1, 1, 1, 1,
0.5378127, -1.31494, 1.119872, 1, 1, 1, 1, 1,
0.5388981, -0.4172918, 2.622135, 1, 1, 1, 1, 1,
0.5444253, -0.9916338, 4.127726, 1, 1, 1, 1, 1,
0.5466429, -0.3778962, 2.795991, 1, 1, 1, 1, 1,
0.5536219, -1.193794, 1.757641, 0, 0, 1, 1, 1,
0.5553299, -0.4581845, 3.141963, 1, 0, 0, 1, 1,
0.5591983, 0.5462231, -1.855222, 1, 0, 0, 1, 1,
0.5602358, -0.8380424, 3.322376, 1, 0, 0, 1, 1,
0.5622318, 0.9901818, -0.1976426, 1, 0, 0, 1, 1,
0.5630502, 0.240766, 1.629513, 1, 0, 0, 1, 1,
0.5666841, -0.06005898, 1.222975, 0, 0, 0, 1, 1,
0.5674772, 0.4196061, 1.331964, 0, 0, 0, 1, 1,
0.5678749, 0.4752454, -0.5097421, 0, 0, 0, 1, 1,
0.5691274, -0.6948164, 2.598933, 0, 0, 0, 1, 1,
0.5734255, -1.589947, 1.501901, 0, 0, 0, 1, 1,
0.5881481, -0.05142629, 1.087479, 0, 0, 0, 1, 1,
0.5931236, 1.078903, 0.7542904, 0, 0, 0, 1, 1,
0.5935167, -1.422253, 1.956436, 1, 1, 1, 1, 1,
0.593525, 0.1783294, 1.611879, 1, 1, 1, 1, 1,
0.5980715, 0.7066324, 1.44276, 1, 1, 1, 1, 1,
0.5991156, 1.178024, 0.9477927, 1, 1, 1, 1, 1,
0.6035819, 0.9290396, 0.6292306, 1, 1, 1, 1, 1,
0.6039714, -1.479842, 2.29142, 1, 1, 1, 1, 1,
0.6043346, -0.07880307, 1.369004, 1, 1, 1, 1, 1,
0.6101801, 0.4061661, 0.8646916, 1, 1, 1, 1, 1,
0.6158831, -0.5314463, 2.336695, 1, 1, 1, 1, 1,
0.6180582, -1.12939, 2.725248, 1, 1, 1, 1, 1,
0.6234169, -0.1185843, 1.993867, 1, 1, 1, 1, 1,
0.6249453, -0.2022623, 2.191442, 1, 1, 1, 1, 1,
0.6268426, 1.69237, 1.445567, 1, 1, 1, 1, 1,
0.633141, -0.6661435, 2.653356, 1, 1, 1, 1, 1,
0.6344157, 0.9755134, 1.481751, 1, 1, 1, 1, 1,
0.6351173, 0.01917997, 0.4200126, 0, 0, 1, 1, 1,
0.637032, -1.215083, 3.647401, 1, 0, 0, 1, 1,
0.6493372, 0.1654344, 1.912409, 1, 0, 0, 1, 1,
0.6496533, 0.6802062, -0.1224658, 1, 0, 0, 1, 1,
0.6515128, 0.9808245, 1.177234, 1, 0, 0, 1, 1,
0.6584061, -2.186023, 3.666944, 1, 0, 0, 1, 1,
0.6617639, 0.2268189, 0.8310952, 0, 0, 0, 1, 1,
0.6627797, -0.4841841, 2.173367, 0, 0, 0, 1, 1,
0.6662312, 0.3548754, 2.011646, 0, 0, 0, 1, 1,
0.6694119, -0.08049581, 1.235128, 0, 0, 0, 1, 1,
0.6712588, -0.4790784, 2.599606, 0, 0, 0, 1, 1,
0.6722441, -0.2884061, 1.056506, 0, 0, 0, 1, 1,
0.6729617, 0.3209769, 2.236872, 0, 0, 0, 1, 1,
0.6740607, -1.692269, 2.356112, 1, 1, 1, 1, 1,
0.6746494, 0.1359739, 2.726557, 1, 1, 1, 1, 1,
0.6773836, -1.062903, 3.519057, 1, 1, 1, 1, 1,
0.6805624, 1.080612, 1.546414, 1, 1, 1, 1, 1,
0.6827003, -0.1146377, 0.2449892, 1, 1, 1, 1, 1,
0.7031404, 1.251666, -0.4074079, 1, 1, 1, 1, 1,
0.7172846, -0.08739988, 2.528695, 1, 1, 1, 1, 1,
0.7194466, -0.4630179, 1.79615, 1, 1, 1, 1, 1,
0.7211642, 1.113246, 0.1452993, 1, 1, 1, 1, 1,
0.7226331, -1.628402, 3.085663, 1, 1, 1, 1, 1,
0.7272647, -0.1922816, 2.378538, 1, 1, 1, 1, 1,
0.7364696, 0.04116387, 1.723112, 1, 1, 1, 1, 1,
0.7375824, -1.575684, 2.610952, 1, 1, 1, 1, 1,
0.7386718, -0.5695291, 1.774951, 1, 1, 1, 1, 1,
0.739004, 0.2656039, 0.9466769, 1, 1, 1, 1, 1,
0.7447488, 0.9514568, 0.5781507, 0, 0, 1, 1, 1,
0.7459745, -0.8408332, 1.535576, 1, 0, 0, 1, 1,
0.7491291, 1.933237, 0.7750095, 1, 0, 0, 1, 1,
0.7494367, 0.3534308, 2.67017, 1, 0, 0, 1, 1,
0.7599946, -1.079916, 1.351065, 1, 0, 0, 1, 1,
0.7671314, -0.5533121, 3.214818, 1, 0, 0, 1, 1,
0.7747344, 0.2374638, -0.8725886, 0, 0, 0, 1, 1,
0.7777976, 0.8611504, 0.6304364, 0, 0, 0, 1, 1,
0.7840593, -1.241296, 2.088009, 0, 0, 0, 1, 1,
0.788102, 0.3045439, 1.437939, 0, 0, 0, 1, 1,
0.7898567, -0.6407374, 3.779804, 0, 0, 0, 1, 1,
0.797986, 0.7346788, 2.093702, 0, 0, 0, 1, 1,
0.801859, -0.4589793, 1.889637, 0, 0, 0, 1, 1,
0.8046957, 1.178822, 0.4340705, 1, 1, 1, 1, 1,
0.8091591, 1.83917, 0.4239986, 1, 1, 1, 1, 1,
0.8150269, 0.4732212, 0.8498099, 1, 1, 1, 1, 1,
0.8164094, -0.1414995, 2.07056, 1, 1, 1, 1, 1,
0.8171772, 0.4905684, 3.675899, 1, 1, 1, 1, 1,
0.8218683, -0.7295892, 2.113679, 1, 1, 1, 1, 1,
0.8277955, -1.508606, 2.466545, 1, 1, 1, 1, 1,
0.8317476, -2.142902, 3.151014, 1, 1, 1, 1, 1,
0.8418396, 0.1179415, 0.5831901, 1, 1, 1, 1, 1,
0.8422694, 0.7129111, 2.620074, 1, 1, 1, 1, 1,
0.8499382, 0.2514217, 0.8235456, 1, 1, 1, 1, 1,
0.8508234, 0.08069311, 2.862848, 1, 1, 1, 1, 1,
0.8526769, -1.278224, 3.109092, 1, 1, 1, 1, 1,
0.855282, -0.4580221, 3.004781, 1, 1, 1, 1, 1,
0.8569689, 0.5275114, 0.3319692, 1, 1, 1, 1, 1,
0.8632805, -1.510936, 2.584124, 0, 0, 1, 1, 1,
0.8710358, -0.8854379, 2.477262, 1, 0, 0, 1, 1,
0.8745611, -0.2708934, 3.7564, 1, 0, 0, 1, 1,
0.8785342, 0.06641407, 2.81966, 1, 0, 0, 1, 1,
0.8798991, 0.2165099, 0.1028782, 1, 0, 0, 1, 1,
0.8824204, 1.160474, 0.9469743, 1, 0, 0, 1, 1,
0.8837531, 0.2288549, 1.607831, 0, 0, 0, 1, 1,
0.8905051, -1.032752, 2.021808, 0, 0, 0, 1, 1,
0.8907114, 1.137921, 1.88935, 0, 0, 0, 1, 1,
0.892127, -0.2388807, 1.194183, 0, 0, 0, 1, 1,
0.8937001, -0.1520651, 1.683165, 0, 0, 0, 1, 1,
0.8944614, -0.4960646, 2.623141, 0, 0, 0, 1, 1,
0.8952846, -1.232596, 1.753252, 0, 0, 0, 1, 1,
0.8964115, 0.5475659, 0.476099, 1, 1, 1, 1, 1,
0.8973244, -1.556655, 3.0554, 1, 1, 1, 1, 1,
0.8981981, 0.2666784, 2.781183, 1, 1, 1, 1, 1,
0.9052907, 0.2145814, 2.31543, 1, 1, 1, 1, 1,
0.9081945, -1.138666, 3.438285, 1, 1, 1, 1, 1,
0.910477, 0.103321, 0.6335036, 1, 1, 1, 1, 1,
0.9134272, -2.113877, 1.697251, 1, 1, 1, 1, 1,
0.9140793, 0.7209138, 0.1143871, 1, 1, 1, 1, 1,
0.9146525, -2.131429, 3.001438, 1, 1, 1, 1, 1,
0.916812, -0.4615316, 2.57739, 1, 1, 1, 1, 1,
0.9265775, 0.1291803, 2.104157, 1, 1, 1, 1, 1,
0.9267758, -1.922939, 2.796807, 1, 1, 1, 1, 1,
0.9311373, -0.5843722, 1.736016, 1, 1, 1, 1, 1,
0.9320805, -1.025411, 1.223773, 1, 1, 1, 1, 1,
0.9338101, 0.8387643, 0.8505807, 1, 1, 1, 1, 1,
0.9403892, 1.043157, 1.5707, 0, 0, 1, 1, 1,
0.9449878, 0.8865924, -0.787019, 1, 0, 0, 1, 1,
0.9473972, -0.01367133, 0.5752198, 1, 0, 0, 1, 1,
0.9503348, 0.3368293, 2.816176, 1, 0, 0, 1, 1,
0.9602146, 0.627667, 2.936676, 1, 0, 0, 1, 1,
0.9613518, -0.1156885, 2.107745, 1, 0, 0, 1, 1,
0.9641005, -1.783239, 3.425887, 0, 0, 0, 1, 1,
0.9646705, 0.3164984, -0.06858894, 0, 0, 0, 1, 1,
0.965755, -0.4099111, -0.4310892, 0, 0, 0, 1, 1,
0.9676556, 0.4708815, 1.678943, 0, 0, 0, 1, 1,
0.9698028, -0.3022492, 1.242851, 0, 0, 0, 1, 1,
0.9701531, -1.115739, 1.002404, 0, 0, 0, 1, 1,
0.9702998, -1.391016, 1.68417, 0, 0, 0, 1, 1,
0.9710517, 1.423789, 0.6519142, 1, 1, 1, 1, 1,
0.9740429, 0.07437935, 2.86165, 1, 1, 1, 1, 1,
0.9743869, 1.312297, 1.273775, 1, 1, 1, 1, 1,
0.9771288, 0.6055737, 2.72664, 1, 1, 1, 1, 1,
0.9821151, -0.3294203, 1.260494, 1, 1, 1, 1, 1,
0.987422, -1.027228, 3.880154, 1, 1, 1, 1, 1,
1.003107, -0.6211337, 2.735713, 1, 1, 1, 1, 1,
1.006407, -1.328581, 0.9059719, 1, 1, 1, 1, 1,
1.016747, -0.01797721, 1.50835, 1, 1, 1, 1, 1,
1.019944, -0.9096147, 0.7956876, 1, 1, 1, 1, 1,
1.022419, 1.879271, 2.23973, 1, 1, 1, 1, 1,
1.022605, 1.365005, 1.392074, 1, 1, 1, 1, 1,
1.031059, 0.9762206, -0.08980766, 1, 1, 1, 1, 1,
1.042932, -2.338892, 3.092186, 1, 1, 1, 1, 1,
1.044841, 0.6111572, 0.2638932, 1, 1, 1, 1, 1,
1.050508, 0.6001487, 0.5979607, 0, 0, 1, 1, 1,
1.052083, 1.113427, 1.821052, 1, 0, 0, 1, 1,
1.053592, 0.5525047, 1.082531, 1, 0, 0, 1, 1,
1.059972, -0.5752903, 3.160053, 1, 0, 0, 1, 1,
1.060811, 1.547929, -0.683908, 1, 0, 0, 1, 1,
1.068312, 0.1835572, 2.94071, 1, 0, 0, 1, 1,
1.082372, -0.7522797, 0.5045705, 0, 0, 0, 1, 1,
1.0848, -1.842109, 1.379827, 0, 0, 0, 1, 1,
1.093866, 0.5675394, 1.647831, 0, 0, 0, 1, 1,
1.094833, 0.5370046, 0.7507542, 0, 0, 0, 1, 1,
1.098729, 1.099256, -0.1473541, 0, 0, 0, 1, 1,
1.099555, -0.5943837, 1.982878, 0, 0, 0, 1, 1,
1.106275, -0.3339761, 2.636517, 0, 0, 0, 1, 1,
1.110054, -0.5839371, 1.246519, 1, 1, 1, 1, 1,
1.120827, -0.6751795, 1.753347, 1, 1, 1, 1, 1,
1.121318, -0.4207903, 2.309535, 1, 1, 1, 1, 1,
1.125996, 0.6030549, 2.278276, 1, 1, 1, 1, 1,
1.128055, -0.278114, 1.172557, 1, 1, 1, 1, 1,
1.129997, 0.04640219, -1.042221, 1, 1, 1, 1, 1,
1.135781, -0.09476893, -1.227084, 1, 1, 1, 1, 1,
1.139383, -0.8587511, 0.4158995, 1, 1, 1, 1, 1,
1.14022, 0.4536254, 0.7650427, 1, 1, 1, 1, 1,
1.148309, 1.964032, -0.8892568, 1, 1, 1, 1, 1,
1.152529, -0.3743449, 2.641614, 1, 1, 1, 1, 1,
1.154264, -0.9902378, 2.786427, 1, 1, 1, 1, 1,
1.156597, -0.446397, 0.8038645, 1, 1, 1, 1, 1,
1.164291, -1.117058, 1.296836, 1, 1, 1, 1, 1,
1.169387, -0.7426602, 2.008485, 1, 1, 1, 1, 1,
1.170243, 0.6445087, 3.882177, 0, 0, 1, 1, 1,
1.186509, -0.9689664, 2.710328, 1, 0, 0, 1, 1,
1.186909, 1.220078, 0.3945895, 1, 0, 0, 1, 1,
1.189767, -0.06454711, 2.116019, 1, 0, 0, 1, 1,
1.200319, -1.19324, 1.720797, 1, 0, 0, 1, 1,
1.207233, -0.5365964, 3.766609, 1, 0, 0, 1, 1,
1.213811, 1.04947, -2.207748, 0, 0, 0, 1, 1,
1.21514, 0.3541141, -0.5506334, 0, 0, 0, 1, 1,
1.220797, -0.4472456, 2.33443, 0, 0, 0, 1, 1,
1.227659, 0.6239835, 1.461565, 0, 0, 0, 1, 1,
1.233944, 0.6322691, -0.2121332, 0, 0, 0, 1, 1,
1.236484, 1.048227, 0.9498031, 0, 0, 0, 1, 1,
1.237441, 0.1578072, 1.59071, 0, 0, 0, 1, 1,
1.240677, 0.1969361, 1.818797, 1, 1, 1, 1, 1,
1.255106, 0.332897, 1.200691, 1, 1, 1, 1, 1,
1.261841, 1.019364, 1.842015, 1, 1, 1, 1, 1,
1.278204, -1.632568, 1.260469, 1, 1, 1, 1, 1,
1.280833, 0.9737363, 1.230829, 1, 1, 1, 1, 1,
1.281391, 0.2322281, 0.3476134, 1, 1, 1, 1, 1,
1.285594, 1.633313, 0.09085009, 1, 1, 1, 1, 1,
1.288512, -0.4908591, 2.342864, 1, 1, 1, 1, 1,
1.289481, -0.5243233, 2.240512, 1, 1, 1, 1, 1,
1.29721, -0.3799386, 1.388303, 1, 1, 1, 1, 1,
1.299959, -0.6934362, 2.367325, 1, 1, 1, 1, 1,
1.3068, 0.7372844, 0.02157106, 1, 1, 1, 1, 1,
1.308612, -2.174249, 2.434187, 1, 1, 1, 1, 1,
1.309963, -0.1716635, 3.15783, 1, 1, 1, 1, 1,
1.311808, 0.5856367, 2.305983, 1, 1, 1, 1, 1,
1.320516, 1.05746, -0.9711913, 0, 0, 1, 1, 1,
1.320573, 0.1236052, 2.268445, 1, 0, 0, 1, 1,
1.331969, 0.1089279, 3.827856, 1, 0, 0, 1, 1,
1.334647, -2.223825, 2.741118, 1, 0, 0, 1, 1,
1.335566, -0.7044612, 2.384377, 1, 0, 0, 1, 1,
1.339913, -0.6739038, 2.818183, 1, 0, 0, 1, 1,
1.340047, -1.586473, -0.1464132, 0, 0, 0, 1, 1,
1.347235, 0.6213199, 1.170433, 0, 0, 0, 1, 1,
1.349185, -1.609903, 0.7442618, 0, 0, 0, 1, 1,
1.349675, -0.9857904, 2.116493, 0, 0, 0, 1, 1,
1.35098, -1.811322, 3.590893, 0, 0, 0, 1, 1,
1.353027, 0.3834645, 1.688515, 0, 0, 0, 1, 1,
1.362809, 2.38728, -0.6222168, 0, 0, 0, 1, 1,
1.372152, 0.4494471, 1.433779, 1, 1, 1, 1, 1,
1.372688, -1.240401, 4.34336, 1, 1, 1, 1, 1,
1.379487, -1.085592, 2.145023, 1, 1, 1, 1, 1,
1.381878, -0.949366, 1.528419, 1, 1, 1, 1, 1,
1.392516, 1.499599, -1.171944, 1, 1, 1, 1, 1,
1.393767, -0.1643353, 2.981736, 1, 1, 1, 1, 1,
1.39858, -0.9121825, 3.072891, 1, 1, 1, 1, 1,
1.409158, 1.16035, 2.088576, 1, 1, 1, 1, 1,
1.409623, -0.5103327, 3.651317, 1, 1, 1, 1, 1,
1.411004, -1.338591, 2.93431, 1, 1, 1, 1, 1,
1.413411, 0.8278939, 0.2224238, 1, 1, 1, 1, 1,
1.41609, -0.4338223, 2.268069, 1, 1, 1, 1, 1,
1.424783, 0.184038, 1.223718, 1, 1, 1, 1, 1,
1.429126, -0.997285, 1.657812, 1, 1, 1, 1, 1,
1.43119, -0.8723024, 3.51631, 1, 1, 1, 1, 1,
1.4357, 0.9410219, 1.053044, 0, 0, 1, 1, 1,
1.446033, 0.1519073, 1.319944, 1, 0, 0, 1, 1,
1.458041, 0.6110565, 2.057881, 1, 0, 0, 1, 1,
1.460568, 2.091765, -1.01711, 1, 0, 0, 1, 1,
1.483824, -1.337868, 1.740865, 1, 0, 0, 1, 1,
1.485255, 1.002806, 0.4158774, 1, 0, 0, 1, 1,
1.499956, -0.5172731, 3.959489, 0, 0, 0, 1, 1,
1.502429, 0.7692702, 1.103657, 0, 0, 0, 1, 1,
1.521131, -0.6575391, 3.796066, 0, 0, 0, 1, 1,
1.524247, -0.1980355, 0.4744304, 0, 0, 0, 1, 1,
1.5399, -1.427728, 2.719937, 0, 0, 0, 1, 1,
1.543426, 1.073833, 1.242656, 0, 0, 0, 1, 1,
1.545051, -0.818782, 2.088635, 0, 0, 0, 1, 1,
1.551198, -1.588392, 2.419865, 1, 1, 1, 1, 1,
1.558447, 0.2699301, 2.427785, 1, 1, 1, 1, 1,
1.57235, 0.2617107, 0.08859979, 1, 1, 1, 1, 1,
1.591457, -0.2875288, 0.5493804, 1, 1, 1, 1, 1,
1.602535, -0.8263188, 1.048313, 1, 1, 1, 1, 1,
1.614668, -0.3141081, 0.3798247, 1, 1, 1, 1, 1,
1.637208, 0.9418595, 1.356017, 1, 1, 1, 1, 1,
1.644342, -0.7341845, 2.991888, 1, 1, 1, 1, 1,
1.651184, -0.2635283, 1.133882, 1, 1, 1, 1, 1,
1.660547, 0.2743156, 1.048434, 1, 1, 1, 1, 1,
1.661069, 0.02893549, 0.9482812, 1, 1, 1, 1, 1,
1.672896, 2.075254, 2.204983, 1, 1, 1, 1, 1,
1.699386, 0.09554408, -0.7445952, 1, 1, 1, 1, 1,
1.700794, 0.8335842, 2.422226, 1, 1, 1, 1, 1,
1.704726, 0.9229081, 1.085984, 1, 1, 1, 1, 1,
1.730288, 0.2728758, 1.285365, 0, 0, 1, 1, 1,
1.74299, 0.3995143, 2.321316, 1, 0, 0, 1, 1,
1.752971, 0.636957, 0.6938953, 1, 0, 0, 1, 1,
1.760069, 1.080215, 0.0515826, 1, 0, 0, 1, 1,
1.763118, 0.7790161, 2.060264, 1, 0, 0, 1, 1,
1.763148, -1.183331, 2.13408, 1, 0, 0, 1, 1,
1.770781, 0.7647555, 2.582407, 0, 0, 0, 1, 1,
1.771803, -0.7545339, 1.545048, 0, 0, 0, 1, 1,
1.777891, -0.8906412, 0.8594173, 0, 0, 0, 1, 1,
1.778606, -0.4855545, 2.623959, 0, 0, 0, 1, 1,
1.784244, 0.1441816, 1.004059, 0, 0, 0, 1, 1,
1.799195, -0.5780894, 1.126993, 0, 0, 0, 1, 1,
1.823605, 0.9408465, 2.491121, 0, 0, 0, 1, 1,
1.849525, -0.9405696, 2.029383, 1, 1, 1, 1, 1,
1.863419, 0.09880697, 4.969619, 1, 1, 1, 1, 1,
1.86435, -1.008242, 0.8034574, 1, 1, 1, 1, 1,
1.865669, 0.008526117, 1.114702, 1, 1, 1, 1, 1,
1.873829, 2.26186, -0.384439, 1, 1, 1, 1, 1,
1.879535, -1.659033, 3.094887, 1, 1, 1, 1, 1,
1.892999, -1.065889, 0.4586569, 1, 1, 1, 1, 1,
1.98217, 1.727603, 1.014758, 1, 1, 1, 1, 1,
1.983332, -2.416354, 1.45863, 1, 1, 1, 1, 1,
1.983894, -0.8250791, 2.545794, 1, 1, 1, 1, 1,
1.986805, 1.171303, 1.36968, 1, 1, 1, 1, 1,
2.000297, 0.2595162, 0.437099, 1, 1, 1, 1, 1,
2.019206, 0.6322083, 0.437629, 1, 1, 1, 1, 1,
2.020956, -0.8616877, 2.582488, 1, 1, 1, 1, 1,
2.069118, 0.4891803, 1.524028, 1, 1, 1, 1, 1,
2.073929, -1.139438, 0.9098501, 0, 0, 1, 1, 1,
2.100951, -1.136202, 2.028908, 1, 0, 0, 1, 1,
2.11364, -0.6659284, 1.783353, 1, 0, 0, 1, 1,
2.121354, -0.6764251, 1.386369, 1, 0, 0, 1, 1,
2.124954, 0.5989026, 1.484407, 1, 0, 0, 1, 1,
2.149695, -1.375919, 3.089574, 1, 0, 0, 1, 1,
2.212174, 0.5773718, 2.47072, 0, 0, 0, 1, 1,
2.215753, 2.022582, -0.5759117, 0, 0, 0, 1, 1,
2.247657, 0.1065092, 0.007632982, 0, 0, 0, 1, 1,
2.278913, -1.16516, -0.2033582, 0, 0, 0, 1, 1,
2.308176, -0.8044018, 1.994714, 0, 0, 0, 1, 1,
2.404187, -0.8123, 2.420244, 0, 0, 0, 1, 1,
2.414065, -0.102975, 1.41002, 0, 0, 0, 1, 1,
2.501221, -0.3865928, 1.656627, 1, 1, 1, 1, 1,
2.570023, -0.8905739, 1.417114, 1, 1, 1, 1, 1,
2.653514, -0.8575643, 1.877126, 1, 1, 1, 1, 1,
2.653929, 0.009782672, 1.056368, 1, 1, 1, 1, 1,
2.818566, -1.073375, 2.387187, 1, 1, 1, 1, 1,
2.932288, -2.318087, 1.899184, 1, 1, 1, 1, 1,
3.010108, -0.7060261, 1.723876, 1, 1, 1, 1, 1
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
var radius = 10.05064;
var distance = 35.30245;
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
mvMatrix.translate( 0.1723871, 0.06373072, 0.286938 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.30245);
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
