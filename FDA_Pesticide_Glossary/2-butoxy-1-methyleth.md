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
-3.314385, -0.01880758, -1.226016, 1, 0, 0, 1,
-3.220792, -0.4055465, -1.47794, 1, 0.007843138, 0, 1,
-3.119651, -0.8263667, -3.180586, 1, 0.01176471, 0, 1,
-3.039161, -0.5356289, -1.018968, 1, 0.01960784, 0, 1,
-2.909197, 0.6468642, -3.685635, 1, 0.02352941, 0, 1,
-2.893506, 1.023736, 0.0208953, 1, 0.03137255, 0, 1,
-2.738156, 2.058635, -0.1517608, 1, 0.03529412, 0, 1,
-2.737896, 0.3063308, -4.124909, 1, 0.04313726, 0, 1,
-2.614338, 1.095697, -0.1586912, 1, 0.04705882, 0, 1,
-2.497093, -1.486019, -1.731869, 1, 0.05490196, 0, 1,
-2.395205, -0.1339999, -2.752141, 1, 0.05882353, 0, 1,
-2.358908, -0.7226642, -1.006505, 1, 0.06666667, 0, 1,
-2.247686, 0.3985681, -2.724727, 1, 0.07058824, 0, 1,
-2.209016, 0.6366838, -1.923547, 1, 0.07843138, 0, 1,
-2.178896, -1.104757, -3.348292, 1, 0.08235294, 0, 1,
-2.158792, 0.26178, -2.77828, 1, 0.09019608, 0, 1,
-2.13439, 1.39243, -0.4510723, 1, 0.09411765, 0, 1,
-2.133415, 3.511, -1.065966, 1, 0.1019608, 0, 1,
-2.12485, 0.0758276, 0.9022956, 1, 0.1098039, 0, 1,
-2.108951, -1.854604, -2.469337, 1, 0.1137255, 0, 1,
-2.075854, 0.1916336, -1.003923, 1, 0.1215686, 0, 1,
-2.04996, 0.003640899, -0.6690836, 1, 0.1254902, 0, 1,
-2.045823, 1.193802, -0.9036445, 1, 0.1333333, 0, 1,
-2.041296, 0.7337712, -1.392658, 1, 0.1372549, 0, 1,
-2.015129, -0.05005631, -0.8953952, 1, 0.145098, 0, 1,
-2.010873, -1.058866, -3.069027, 1, 0.1490196, 0, 1,
-1.924871, 0.04251242, -2.183891, 1, 0.1568628, 0, 1,
-1.894324, 0.8335463, -1.452226, 1, 0.1607843, 0, 1,
-1.861068, -0.03704094, -3.374589, 1, 0.1686275, 0, 1,
-1.849774, -1.176085, -2.714978, 1, 0.172549, 0, 1,
-1.846792, -0.2675671, -1.903873, 1, 0.1803922, 0, 1,
-1.842205, -1.407353, -1.42645, 1, 0.1843137, 0, 1,
-1.841231, 0.8617516, -0.4624026, 1, 0.1921569, 0, 1,
-1.83156, -1.359184, -0.9857164, 1, 0.1960784, 0, 1,
-1.817899, -0.3399465, -3.183772, 1, 0.2039216, 0, 1,
-1.804705, -1.180744, -3.25977, 1, 0.2117647, 0, 1,
-1.7976, 0.3904849, -0.3828263, 1, 0.2156863, 0, 1,
-1.790749, -0.4596009, -2.223565, 1, 0.2235294, 0, 1,
-1.784827, 0.0774426, -3.087399, 1, 0.227451, 0, 1,
-1.782838, -0.3893285, -0.7483124, 1, 0.2352941, 0, 1,
-1.760811, 0.5493966, -0.246242, 1, 0.2392157, 0, 1,
-1.750432, -0.2523183, -1.089736, 1, 0.2470588, 0, 1,
-1.740881, 0.03108417, -2.970177, 1, 0.2509804, 0, 1,
-1.736919, -0.2024441, -1.80471, 1, 0.2588235, 0, 1,
-1.729962, -0.9278105, -0.7185478, 1, 0.2627451, 0, 1,
-1.728466, -1.197294, -1.462831, 1, 0.2705882, 0, 1,
-1.713606, -0.3119921, -1.054879, 1, 0.2745098, 0, 1,
-1.710465, -0.1274478, -1.714503, 1, 0.282353, 0, 1,
-1.702479, -1.208118, -0.9663851, 1, 0.2862745, 0, 1,
-1.697771, 0.05528846, -2.77848, 1, 0.2941177, 0, 1,
-1.689034, -0.01224829, -1.797557, 1, 0.3019608, 0, 1,
-1.686678, -0.04026903, -1.501751, 1, 0.3058824, 0, 1,
-1.684062, 0.1654143, -2.704174, 1, 0.3137255, 0, 1,
-1.675852, 0.00103179, -2.378076, 1, 0.3176471, 0, 1,
-1.667858, 0.5702156, 0.06749475, 1, 0.3254902, 0, 1,
-1.666596, -0.7983872, -1.546727, 1, 0.3294118, 0, 1,
-1.665506, -0.2470239, -4.095398, 1, 0.3372549, 0, 1,
-1.664729, 0.3577107, -2.367285, 1, 0.3411765, 0, 1,
-1.655948, -0.02896412, -1.329962, 1, 0.3490196, 0, 1,
-1.602784, -1.06386, -2.265821, 1, 0.3529412, 0, 1,
-1.582285, -0.5339911, -1.822222, 1, 0.3607843, 0, 1,
-1.579788, -1.012377, -2.567379, 1, 0.3647059, 0, 1,
-1.566254, 0.4404298, -2.007936, 1, 0.372549, 0, 1,
-1.565584, -1.079399, -0.7189455, 1, 0.3764706, 0, 1,
-1.544921, -2.444371, -0.3201812, 1, 0.3843137, 0, 1,
-1.540657, 1.444071, 0.220704, 1, 0.3882353, 0, 1,
-1.509293, -1.91761, -2.970492, 1, 0.3960784, 0, 1,
-1.490682, -1.178607, -1.771876, 1, 0.4039216, 0, 1,
-1.475096, 1.016691, -1.357907, 1, 0.4078431, 0, 1,
-1.473993, -0.9109346, -2.421913, 1, 0.4156863, 0, 1,
-1.460584, -0.4833115, -2.02375, 1, 0.4196078, 0, 1,
-1.457456, 1.449185, 0.2256134, 1, 0.427451, 0, 1,
-1.450101, -0.5295843, -1.298244, 1, 0.4313726, 0, 1,
-1.423824, -0.9132826, -2.739843, 1, 0.4392157, 0, 1,
-1.421854, 0.771198, 0.03630386, 1, 0.4431373, 0, 1,
-1.414642, 0.2927363, -2.834757, 1, 0.4509804, 0, 1,
-1.414308, 2.162307, -0.2596032, 1, 0.454902, 0, 1,
-1.409331, -1.240286, -2.793317, 1, 0.4627451, 0, 1,
-1.404595, -0.9709536, -1.078867, 1, 0.4666667, 0, 1,
-1.391762, 1.360606, 0.06232176, 1, 0.4745098, 0, 1,
-1.387837, 0.6520408, -1.428078, 1, 0.4784314, 0, 1,
-1.383826, 0.2533083, -1.520029, 1, 0.4862745, 0, 1,
-1.372302, 1.203482, 0.9161059, 1, 0.4901961, 0, 1,
-1.369595, 0.8218201, -2.07033, 1, 0.4980392, 0, 1,
-1.367182, 0.2736088, -1.831745, 1, 0.5058824, 0, 1,
-1.365007, 0.4585139, -1.897254, 1, 0.509804, 0, 1,
-1.352773, -1.447727, -1.846154, 1, 0.5176471, 0, 1,
-1.352733, -0.06725007, -2.006114, 1, 0.5215687, 0, 1,
-1.35125, -1.020393, -3.189869, 1, 0.5294118, 0, 1,
-1.34868, 1.428543, -1.251427, 1, 0.5333334, 0, 1,
-1.344816, -0.2811005, -1.931395, 1, 0.5411765, 0, 1,
-1.343705, -1.339648, -2.079754, 1, 0.5450981, 0, 1,
-1.343292, 0.4909141, -1.109821, 1, 0.5529412, 0, 1,
-1.342099, -0.6405492, -1.269219, 1, 0.5568628, 0, 1,
-1.339834, -0.3473807, -2.883206, 1, 0.5647059, 0, 1,
-1.332006, -0.4931413, -2.04063, 1, 0.5686275, 0, 1,
-1.326186, 0.6103116, 0.4542489, 1, 0.5764706, 0, 1,
-1.325175, 1.129906, -0.07477764, 1, 0.5803922, 0, 1,
-1.315457, -1.539857, -3.399291, 1, 0.5882353, 0, 1,
-1.31441, -0.7325319, -1.513007, 1, 0.5921569, 0, 1,
-1.313987, -1.348482, -2.049057, 1, 0.6, 0, 1,
-1.309712, 0.3922919, 0.2623543, 1, 0.6078432, 0, 1,
-1.305595, -0.1991482, 0.06992593, 1, 0.6117647, 0, 1,
-1.301787, 2.270827, -0.1785008, 1, 0.6196079, 0, 1,
-1.301072, -0.5453078, -0.9392345, 1, 0.6235294, 0, 1,
-1.295418, 0.6562353, -0.7840202, 1, 0.6313726, 0, 1,
-1.294533, -2.476125, -3.148322, 1, 0.6352941, 0, 1,
-1.287955, -0.003091126, -1.903008, 1, 0.6431373, 0, 1,
-1.285109, 0.1220307, -1.927161, 1, 0.6470588, 0, 1,
-1.284285, -0.7525679, -0.9617293, 1, 0.654902, 0, 1,
-1.284073, 1.25222, -1.859232, 1, 0.6588235, 0, 1,
-1.277463, -1.4765, -3.369635, 1, 0.6666667, 0, 1,
-1.273299, -1.058814, -1.608233, 1, 0.6705883, 0, 1,
-1.264904, -0.8779086, -2.724431, 1, 0.6784314, 0, 1,
-1.25732, 2.052588, -0.3822982, 1, 0.682353, 0, 1,
-1.254581, 0.8689183, -1.060948, 1, 0.6901961, 0, 1,
-1.249038, -0.7632141, -3.391298, 1, 0.6941177, 0, 1,
-1.24406, -0.4385787, -1.979944, 1, 0.7019608, 0, 1,
-1.22505, -0.4558742, -1.297302, 1, 0.7098039, 0, 1,
-1.220882, -0.1187332, -2.249809, 1, 0.7137255, 0, 1,
-1.219368, 0.6931022, -0.923417, 1, 0.7215686, 0, 1,
-1.215739, -0.5273417, -0.357945, 1, 0.7254902, 0, 1,
-1.203873, -1.685827, -3.006676, 1, 0.7333333, 0, 1,
-1.202096, -0.5079736, -3.246888, 1, 0.7372549, 0, 1,
-1.195834, 1.123483, 0.2313889, 1, 0.7450981, 0, 1,
-1.188586, -0.691227, -1.749639, 1, 0.7490196, 0, 1,
-1.188584, -0.3945128, -2.105292, 1, 0.7568628, 0, 1,
-1.187442, -1.021699, -2.969457, 1, 0.7607843, 0, 1,
-1.185649, -0.3102771, -0.6657111, 1, 0.7686275, 0, 1,
-1.180692, 0.02739847, 0.4239606, 1, 0.772549, 0, 1,
-1.178886, 1.706778, 0.03824209, 1, 0.7803922, 0, 1,
-1.175778, -0.2530552, -2.900824, 1, 0.7843137, 0, 1,
-1.171995, 0.4949578, -1.065818, 1, 0.7921569, 0, 1,
-1.169268, -1.514066, -0.6921211, 1, 0.7960784, 0, 1,
-1.152305, 0.4047115, -1.823633, 1, 0.8039216, 0, 1,
-1.131079, -0.557386, -3.05295, 1, 0.8117647, 0, 1,
-1.12878, -2.070097, -3.553554, 1, 0.8156863, 0, 1,
-1.124933, 0.7731362, -0.0849335, 1, 0.8235294, 0, 1,
-1.11378, -0.322819, -0.8243834, 1, 0.827451, 0, 1,
-1.112047, 0.6063238, -1.773797, 1, 0.8352941, 0, 1,
-1.109058, -0.4326318, -1.112647, 1, 0.8392157, 0, 1,
-1.105855, -1.747478, -1.901146, 1, 0.8470588, 0, 1,
-1.105559, 1.88301, -0.1954177, 1, 0.8509804, 0, 1,
-1.097942, 1.073854, -0.9692478, 1, 0.8588235, 0, 1,
-1.090022, -0.9046524, -1.944141, 1, 0.8627451, 0, 1,
-1.087896, 0.8994791, -1.46267, 1, 0.8705882, 0, 1,
-1.082159, -1.3198, -3.028306, 1, 0.8745098, 0, 1,
-1.066965, 0.1418848, -0.8854657, 1, 0.8823529, 0, 1,
-1.066407, 0.06557402, -2.141724, 1, 0.8862745, 0, 1,
-1.065854, 1.758199, -1.260632, 1, 0.8941177, 0, 1,
-1.065469, -1.253433, -1.038738, 1, 0.8980392, 0, 1,
-1.058794, 0.1057848, -1.62077, 1, 0.9058824, 0, 1,
-1.058529, 0.2347612, -1.515707, 1, 0.9137255, 0, 1,
-1.055345, -0.2392701, -1.578236, 1, 0.9176471, 0, 1,
-1.055199, -0.818287, -0.5033056, 1, 0.9254902, 0, 1,
-1.052964, 0.2683303, 0.1478707, 1, 0.9294118, 0, 1,
-1.042759, 0.006240687, -2.410599, 1, 0.9372549, 0, 1,
-1.036191, -0.1369677, -3.021546, 1, 0.9411765, 0, 1,
-1.034531, -1.174854, -2.5811, 1, 0.9490196, 0, 1,
-1.029278, 1.031749, -1.600029, 1, 0.9529412, 0, 1,
-1.015665, -0.4853577, -3.984112, 1, 0.9607843, 0, 1,
-1.014711, -0.9997069, -3.687271, 1, 0.9647059, 0, 1,
-1.013031, -0.6966761, -2.301627, 1, 0.972549, 0, 1,
-1.012526, 0.6832833, -0.203252, 1, 0.9764706, 0, 1,
-1.008452, -0.08969145, -1.639076, 1, 0.9843137, 0, 1,
-1.008041, 0.3247078, -1.534672, 1, 0.9882353, 0, 1,
-1.006249, -0.8663493, -2.147948, 1, 0.9960784, 0, 1,
-1.003191, 0.3589374, -1.01683, 0.9960784, 1, 0, 1,
-1.001132, 0.5379, -1.257667, 0.9921569, 1, 0, 1,
-0.9958385, -1.125997, -2.215459, 0.9843137, 1, 0, 1,
-0.9954752, -0.1823296, -1.748464, 0.9803922, 1, 0, 1,
-0.9908121, 0.7192324, -0.74249, 0.972549, 1, 0, 1,
-0.9852165, 0.743414, 0.8314657, 0.9686275, 1, 0, 1,
-0.9798711, 1.37501, -0.327363, 0.9607843, 1, 0, 1,
-0.9747713, -1.009055, -1.938237, 0.9568627, 1, 0, 1,
-0.9701324, -1.815561, -1.433005, 0.9490196, 1, 0, 1,
-0.96674, 0.2348266, -0.8636593, 0.945098, 1, 0, 1,
-0.9589739, -1.483353, -2.180315, 0.9372549, 1, 0, 1,
-0.9587286, 0.03781913, -2.436357, 0.9333333, 1, 0, 1,
-0.9564753, 0.9787691, 1.173422, 0.9254902, 1, 0, 1,
-0.9487066, 1.078105, -1.744399, 0.9215686, 1, 0, 1,
-0.945084, -0.1373719, -1.397591, 0.9137255, 1, 0, 1,
-0.9401271, -2.009626, -1.781957, 0.9098039, 1, 0, 1,
-0.9387453, -0.3286107, -1.676873, 0.9019608, 1, 0, 1,
-0.936453, 0.4227058, -0.6131247, 0.8941177, 1, 0, 1,
-0.9357323, -0.489667, -1.398696, 0.8901961, 1, 0, 1,
-0.9259023, -0.3622709, -3.109702, 0.8823529, 1, 0, 1,
-0.9255331, -0.01192486, -2.343978, 0.8784314, 1, 0, 1,
-0.9251254, 1.014737, -1.0738, 0.8705882, 1, 0, 1,
-0.9180055, 0.3418332, -1.992522, 0.8666667, 1, 0, 1,
-0.9171024, -1.191291, -2.178523, 0.8588235, 1, 0, 1,
-0.9090608, -0.7044849, -3.375239, 0.854902, 1, 0, 1,
-0.9060703, 0.9603099, -2.848251, 0.8470588, 1, 0, 1,
-0.8997731, 0.3106516, -0.7814462, 0.8431373, 1, 0, 1,
-0.8909, -0.6983422, -1.619676, 0.8352941, 1, 0, 1,
-0.8779513, 0.6594128, 0.09879632, 0.8313726, 1, 0, 1,
-0.8771056, -0.4265768, -1.0269, 0.8235294, 1, 0, 1,
-0.8764925, -0.8571064, -2.273954, 0.8196079, 1, 0, 1,
-0.8748371, 0.809078, 0.1537714, 0.8117647, 1, 0, 1,
-0.8675196, 0.3214012, -0.8943322, 0.8078431, 1, 0, 1,
-0.8587361, 0.5709484, -3.015123, 0.8, 1, 0, 1,
-0.8526219, -0.4002504, -1.816846, 0.7921569, 1, 0, 1,
-0.8494228, 0.7179451, 0.7897854, 0.7882353, 1, 0, 1,
-0.846514, 0.6604828, -1.503286, 0.7803922, 1, 0, 1,
-0.8464115, -0.8217996, -3.714903, 0.7764706, 1, 0, 1,
-0.8462201, -0.4088881, -1.385597, 0.7686275, 1, 0, 1,
-0.844431, -1.157525, -0.9510182, 0.7647059, 1, 0, 1,
-0.8385548, -0.6180662, -2.903375, 0.7568628, 1, 0, 1,
-0.8365519, 1.666819, -0.09181808, 0.7529412, 1, 0, 1,
-0.8353409, -0.8517696, -1.918617, 0.7450981, 1, 0, 1,
-0.8305519, -0.2881986, -0.3022951, 0.7411765, 1, 0, 1,
-0.8174112, -1.311339, -2.7761, 0.7333333, 1, 0, 1,
-0.8122233, -1.021091, -2.671104, 0.7294118, 1, 0, 1,
-0.8107361, 1.012755, -1.68911, 0.7215686, 1, 0, 1,
-0.7981188, -0.1862052, -0.7160682, 0.7176471, 1, 0, 1,
-0.7969775, 0.7066017, -1.480261, 0.7098039, 1, 0, 1,
-0.7905388, -2.080068, -3.875373, 0.7058824, 1, 0, 1,
-0.7879398, 1.716114, 0.0105775, 0.6980392, 1, 0, 1,
-0.7872523, -0.161079, -1.019195, 0.6901961, 1, 0, 1,
-0.7803599, -3.017179, -1.740813, 0.6862745, 1, 0, 1,
-0.7759953, -0.4057752, -3.183626, 0.6784314, 1, 0, 1,
-0.7732192, 0.8460979, -0.2434253, 0.6745098, 1, 0, 1,
-0.7714676, -0.166216, -2.353712, 0.6666667, 1, 0, 1,
-0.7652287, 1.168429, -0.371194, 0.6627451, 1, 0, 1,
-0.7643429, -0.03187571, -1.61536, 0.654902, 1, 0, 1,
-0.7558708, -0.1157349, -2.467507, 0.6509804, 1, 0, 1,
-0.7553962, -0.2985319, -1.036727, 0.6431373, 1, 0, 1,
-0.7451987, 0.07446773, -1.219781, 0.6392157, 1, 0, 1,
-0.7418936, 0.1714231, -0.9772875, 0.6313726, 1, 0, 1,
-0.7388909, 1.509119, -1.001859, 0.627451, 1, 0, 1,
-0.7376311, -0.9458501, -3.446684, 0.6196079, 1, 0, 1,
-0.7348377, 0.5954595, -1.8542, 0.6156863, 1, 0, 1,
-0.732756, -0.4266675, -2.883973, 0.6078432, 1, 0, 1,
-0.7278946, -0.5364609, -2.310549, 0.6039216, 1, 0, 1,
-0.72721, 0.4503612, -1.537083, 0.5960785, 1, 0, 1,
-0.7260778, -0.714956, -2.878862, 0.5882353, 1, 0, 1,
-0.725973, -0.5240216, -2.204408, 0.5843138, 1, 0, 1,
-0.7233375, -0.0271235, -1.605574, 0.5764706, 1, 0, 1,
-0.7228221, 0.4884666, -2.128463, 0.572549, 1, 0, 1,
-0.7186293, -0.8974947, -1.079693, 0.5647059, 1, 0, 1,
-0.7145928, -0.1890736, -1.833948, 0.5607843, 1, 0, 1,
-0.7107921, 0.5881391, -2.32211, 0.5529412, 1, 0, 1,
-0.7046641, -0.3851456, -3.017571, 0.5490196, 1, 0, 1,
-0.7020676, 0.3452835, 0.02971345, 0.5411765, 1, 0, 1,
-0.6942338, -2.272813, -2.701137, 0.5372549, 1, 0, 1,
-0.6902559, -1.317218, -4.521883, 0.5294118, 1, 0, 1,
-0.6874472, -0.255171, -1.85279, 0.5254902, 1, 0, 1,
-0.6802317, -0.2764217, -0.994752, 0.5176471, 1, 0, 1,
-0.6758952, 1.537559, 0.7351223, 0.5137255, 1, 0, 1,
-0.6682092, -0.1076195, -1.811978, 0.5058824, 1, 0, 1,
-0.667304, -0.5288188, -1.41356, 0.5019608, 1, 0, 1,
-0.6627514, -0.3860718, -0.6300953, 0.4941176, 1, 0, 1,
-0.662038, 0.6462963, -0.5303395, 0.4862745, 1, 0, 1,
-0.6571801, 0.0597068, 0.3344862, 0.4823529, 1, 0, 1,
-0.6564854, 0.9521296, -1.359178, 0.4745098, 1, 0, 1,
-0.6540139, 1.835729, -0.08629963, 0.4705882, 1, 0, 1,
-0.6500909, -1.513419, -2.773919, 0.4627451, 1, 0, 1,
-0.6497256, -2.185981, -2.976378, 0.4588235, 1, 0, 1,
-0.6493182, 0.6879868, -2.742757, 0.4509804, 1, 0, 1,
-0.6476433, 1.322642, 0.643195, 0.4470588, 1, 0, 1,
-0.6471106, 0.8873652, -1.583653, 0.4392157, 1, 0, 1,
-0.6461363, -0.8400452, -2.330273, 0.4352941, 1, 0, 1,
-0.6399255, -0.02775992, -3.380347, 0.427451, 1, 0, 1,
-0.6388359, 0.512055, 0.5293108, 0.4235294, 1, 0, 1,
-0.6374216, 0.4729331, -1.336219, 0.4156863, 1, 0, 1,
-0.6262346, -0.1723427, -0.3221694, 0.4117647, 1, 0, 1,
-0.6241161, -0.4991498, -2.764322, 0.4039216, 1, 0, 1,
-0.623962, -1.208493, -1.438076, 0.3960784, 1, 0, 1,
-0.6185908, 0.8365513, -0.2592662, 0.3921569, 1, 0, 1,
-0.6161339, 0.8162823, 1.374016, 0.3843137, 1, 0, 1,
-0.6152609, -1.459959, -3.065952, 0.3803922, 1, 0, 1,
-0.6147829, -1.80384, -4.446508, 0.372549, 1, 0, 1,
-0.6080578, 1.494056, -2.199395, 0.3686275, 1, 0, 1,
-0.6064434, 0.2974295, -2.4425, 0.3607843, 1, 0, 1,
-0.6023872, 0.7785659, 0.4560909, 0.3568628, 1, 0, 1,
-0.6014979, 0.2500189, 0.1555936, 0.3490196, 1, 0, 1,
-0.6004133, -0.6403668, -0.8721999, 0.345098, 1, 0, 1,
-0.5977222, 0.5541154, -0.8237344, 0.3372549, 1, 0, 1,
-0.5914057, 0.6689677, 0.02330679, 0.3333333, 1, 0, 1,
-0.5782052, -1.217711, -1.596382, 0.3254902, 1, 0, 1,
-0.5743391, 0.7636206, 0.06217252, 0.3215686, 1, 0, 1,
-0.5735577, 0.9705891, 0.05440738, 0.3137255, 1, 0, 1,
-0.568628, 0.4780568, -0.4775962, 0.3098039, 1, 0, 1,
-0.5635147, -0.7908455, -4.343582, 0.3019608, 1, 0, 1,
-0.5634181, -1.228983, -2.687458, 0.2941177, 1, 0, 1,
-0.5587407, -1.202002, -4.099072, 0.2901961, 1, 0, 1,
-0.5557154, -1.644214, -2.879713, 0.282353, 1, 0, 1,
-0.5552312, 0.6854136, -1.260025, 0.2784314, 1, 0, 1,
-0.5551978, -0.1842763, -2.265654, 0.2705882, 1, 0, 1,
-0.5530975, 1.636387, -0.6514183, 0.2666667, 1, 0, 1,
-0.5527538, 0.8943055, 0.4350892, 0.2588235, 1, 0, 1,
-0.5517999, -1.022448, -3.454189, 0.254902, 1, 0, 1,
-0.5497811, -0.2525555, -0.3494567, 0.2470588, 1, 0, 1,
-0.5493137, -1.492983, -0.8804647, 0.2431373, 1, 0, 1,
-0.5491084, -0.5912562, -1.114071, 0.2352941, 1, 0, 1,
-0.5487377, 0.03223818, -1.630881, 0.2313726, 1, 0, 1,
-0.5461307, 1.15471, -0.8070734, 0.2235294, 1, 0, 1,
-0.5264569, -0.05103029, -2.789111, 0.2196078, 1, 0, 1,
-0.5243531, 0.4985132, -1.348495, 0.2117647, 1, 0, 1,
-0.5200395, -0.114447, 0.06654243, 0.2078431, 1, 0, 1,
-0.5150576, 0.4353842, 1.62929, 0.2, 1, 0, 1,
-0.5140933, 0.7171808, -0.3204734, 0.1921569, 1, 0, 1,
-0.5075038, 1.122144, -0.9340429, 0.1882353, 1, 0, 1,
-0.5070812, 1.35037, -0.5724553, 0.1803922, 1, 0, 1,
-0.506865, -1.454279, -1.457569, 0.1764706, 1, 0, 1,
-0.5047758, 0.4084908, -0.1548331, 0.1686275, 1, 0, 1,
-0.4990686, 0.4111266, -1.194163, 0.1647059, 1, 0, 1,
-0.4987708, -0.7089533, -2.032484, 0.1568628, 1, 0, 1,
-0.4984398, 1.749959, -1.675748, 0.1529412, 1, 0, 1,
-0.493788, -0.1171641, -1.837303, 0.145098, 1, 0, 1,
-0.4822648, -0.008997278, -2.37465, 0.1411765, 1, 0, 1,
-0.4811657, 0.3332268, -1.563806, 0.1333333, 1, 0, 1,
-0.4793411, -0.552577, -1.221017, 0.1294118, 1, 0, 1,
-0.4784001, 0.5015041, -0.9545884, 0.1215686, 1, 0, 1,
-0.4768423, 0.4192125, -2.280303, 0.1176471, 1, 0, 1,
-0.4753346, 1.181934, 1.90274, 0.1098039, 1, 0, 1,
-0.4714476, -0.5091994, -1.697163, 0.1058824, 1, 0, 1,
-0.4700693, 0.4718344, 0.5695993, 0.09803922, 1, 0, 1,
-0.4654343, -0.1750046, -1.323063, 0.09019608, 1, 0, 1,
-0.463564, -0.5545782, -2.190788, 0.08627451, 1, 0, 1,
-0.4532454, -0.7639783, -2.806561, 0.07843138, 1, 0, 1,
-0.4517903, 0.8599679, -0.7027788, 0.07450981, 1, 0, 1,
-0.4502996, 0.7163768, -0.3601028, 0.06666667, 1, 0, 1,
-0.4483849, 3.152452, 1.164837, 0.0627451, 1, 0, 1,
-0.448263, -2.653752, -2.481501, 0.05490196, 1, 0, 1,
-0.4457363, -0.3088094, -1.131693, 0.05098039, 1, 0, 1,
-0.4447343, 1.186057, -0.6443039, 0.04313726, 1, 0, 1,
-0.4446449, 0.5348026, -0.9358697, 0.03921569, 1, 0, 1,
-0.4400009, -0.3620411, -2.568621, 0.03137255, 1, 0, 1,
-0.4398456, 0.3084744, -2.195923, 0.02745098, 1, 0, 1,
-0.4371839, 0.9189041, 0.3843317, 0.01960784, 1, 0, 1,
-0.4365028, 0.4811559, -1.604635, 0.01568628, 1, 0, 1,
-0.4364283, 1.368229, 0.3350776, 0.007843138, 1, 0, 1,
-0.4358393, 1.19755, -1.528576, 0.003921569, 1, 0, 1,
-0.4349406, 1.698156, -0.568063, 0, 1, 0.003921569, 1,
-0.4336078, -0.2438526, -1.652669, 0, 1, 0.01176471, 1,
-0.4331331, 0.1758916, 0.0624912, 0, 1, 0.01568628, 1,
-0.42689, 0.9691676, -0.3033839, 0, 1, 0.02352941, 1,
-0.4242154, 0.1699315, -0.6030567, 0, 1, 0.02745098, 1,
-0.4209897, -0.2171493, -2.355316, 0, 1, 0.03529412, 1,
-0.4203229, 1.371178, -0.2137867, 0, 1, 0.03921569, 1,
-0.4181999, -0.3908045, -3.667701, 0, 1, 0.04705882, 1,
-0.4163193, 0.1119002, -1.301864, 0, 1, 0.05098039, 1,
-0.4141122, 1.748738, -2.050445, 0, 1, 0.05882353, 1,
-0.4077328, -1.467078, -2.865565, 0, 1, 0.0627451, 1,
-0.407223, -2.080689, -2.564738, 0, 1, 0.07058824, 1,
-0.4048373, 1.655236, -2.019585, 0, 1, 0.07450981, 1,
-0.4030964, -1.80019, -2.573665, 0, 1, 0.08235294, 1,
-0.3965003, -0.6526166, -3.110117, 0, 1, 0.08627451, 1,
-0.3938618, -0.9659864, -2.293282, 0, 1, 0.09411765, 1,
-0.3930422, -0.1769409, -2.500544, 0, 1, 0.1019608, 1,
-0.3831913, 1.272742, 2.270997, 0, 1, 0.1058824, 1,
-0.3816609, -0.07854764, -3.616182, 0, 1, 0.1137255, 1,
-0.3772372, -1.537855, -2.872001, 0, 1, 0.1176471, 1,
-0.376653, 1.001618, -1.206707, 0, 1, 0.1254902, 1,
-0.3728375, 0.9712967, 0.5922543, 0, 1, 0.1294118, 1,
-0.372774, 0.4500751, -0.5082555, 0, 1, 0.1372549, 1,
-0.3718302, 3.262005, -0.2218034, 0, 1, 0.1411765, 1,
-0.3700166, 0.1807885, -2.004629, 0, 1, 0.1490196, 1,
-0.3693004, 0.4660295, -1.271028, 0, 1, 0.1529412, 1,
-0.3672036, -1.173467, -4.069334, 0, 1, 0.1607843, 1,
-0.3662133, 0.2825751, 0.2201023, 0, 1, 0.1647059, 1,
-0.3604506, -0.3345976, 0.4967903, 0, 1, 0.172549, 1,
-0.3594514, 0.2061926, -1.734661, 0, 1, 0.1764706, 1,
-0.3582464, 0.9693894, -1.730732, 0, 1, 0.1843137, 1,
-0.3561529, 0.6839806, 0.1748248, 0, 1, 0.1882353, 1,
-0.3559404, -0.4331932, -5.895062, 0, 1, 0.1960784, 1,
-0.3533674, 1.129707, 0.1264553, 0, 1, 0.2039216, 1,
-0.3519662, -0.8117825, -1.859142, 0, 1, 0.2078431, 1,
-0.3497939, -1.811943, -3.322091, 0, 1, 0.2156863, 1,
-0.3443744, -0.9110835, -2.233044, 0, 1, 0.2196078, 1,
-0.3342107, 0.9428778, -1.101241, 0, 1, 0.227451, 1,
-0.3290849, 0.3618264, 1.288582, 0, 1, 0.2313726, 1,
-0.3263561, 0.9474804, -0.5448619, 0, 1, 0.2392157, 1,
-0.3244225, -0.594063, -1.621497, 0, 1, 0.2431373, 1,
-0.3207576, -0.5201792, -1.865329, 0, 1, 0.2509804, 1,
-0.3169992, 0.382606, -0.8311806, 0, 1, 0.254902, 1,
-0.3122938, -0.7502363, -2.464414, 0, 1, 0.2627451, 1,
-0.3118176, -0.2099489, -2.270447, 0, 1, 0.2666667, 1,
-0.3105941, 0.7876291, -0.300809, 0, 1, 0.2745098, 1,
-0.3101291, -0.3394192, -2.881505, 0, 1, 0.2784314, 1,
-0.3002248, -0.5257437, -3.966723, 0, 1, 0.2862745, 1,
-0.3000034, 0.05348276, -0.269818, 0, 1, 0.2901961, 1,
-0.2943687, -0.5100611, -3.41045, 0, 1, 0.2980392, 1,
-0.2939483, -0.8976572, -3.243287, 0, 1, 0.3058824, 1,
-0.2922664, -0.02832151, -1.089322, 0, 1, 0.3098039, 1,
-0.2869737, -0.6929011, -4.258353, 0, 1, 0.3176471, 1,
-0.2770169, 0.9795405, -0.2944688, 0, 1, 0.3215686, 1,
-0.2767124, 0.2366269, -1.54801, 0, 1, 0.3294118, 1,
-0.2763043, 0.263792, -0.9365908, 0, 1, 0.3333333, 1,
-0.272263, -0.9089815, -4.146772, 0, 1, 0.3411765, 1,
-0.2701468, 0.03155077, -2.861002, 0, 1, 0.345098, 1,
-0.2685535, 0.6750044, -0.02910082, 0, 1, 0.3529412, 1,
-0.2677182, 0.9794163, 0.4763082, 0, 1, 0.3568628, 1,
-0.2661873, 0.1854272, -0.2634751, 0, 1, 0.3647059, 1,
-0.2631307, -0.7007395, -2.389275, 0, 1, 0.3686275, 1,
-0.26052, -1.402395, -0.7995694, 0, 1, 0.3764706, 1,
-0.2588034, 0.0009807067, -0.3194127, 0, 1, 0.3803922, 1,
-0.2587966, 1.888803, 0.3229377, 0, 1, 0.3882353, 1,
-0.2571577, -0.1357357, -1.774376, 0, 1, 0.3921569, 1,
-0.2547048, -0.5685361, -2.507041, 0, 1, 0.4, 1,
-0.2536772, -1.651205, -4.432154, 0, 1, 0.4078431, 1,
-0.2535171, -0.5658846, -1.527805, 0, 1, 0.4117647, 1,
-0.251093, 2.824895, 0.3533904, 0, 1, 0.4196078, 1,
-0.2494195, -0.8811915, -3.545705, 0, 1, 0.4235294, 1,
-0.2484243, 1.200218, -1.397629, 0, 1, 0.4313726, 1,
-0.2397312, 0.3902062, -0.1818849, 0, 1, 0.4352941, 1,
-0.2392607, -0.7219311, -0.9356443, 0, 1, 0.4431373, 1,
-0.2390111, 0.01332586, -2.037497, 0, 1, 0.4470588, 1,
-0.2344274, 0.1445039, -1.866697, 0, 1, 0.454902, 1,
-0.2322526, -0.8118604, -1.763207, 0, 1, 0.4588235, 1,
-0.2291032, 0.7079121, -1.003853, 0, 1, 0.4666667, 1,
-0.227675, 1.971462, -0.9915075, 0, 1, 0.4705882, 1,
-0.2271377, 0.7530763, -1.386088, 0, 1, 0.4784314, 1,
-0.2253082, -0.8799078, -4.965471, 0, 1, 0.4823529, 1,
-0.2252637, 0.2797356, 0.6470119, 0, 1, 0.4901961, 1,
-0.2242671, 0.8555079, -0.3472539, 0, 1, 0.4941176, 1,
-0.2233015, 0.854195, -0.6841882, 0, 1, 0.5019608, 1,
-0.2194572, -0.6896431, -4.468388, 0, 1, 0.509804, 1,
-0.2142431, 1.209056, -0.3016724, 0, 1, 0.5137255, 1,
-0.2122999, 0.5396968, 0.5514075, 0, 1, 0.5215687, 1,
-0.2070614, -1.613348, -2.64703, 0, 1, 0.5254902, 1,
-0.2067229, 0.05139773, -2.696125, 0, 1, 0.5333334, 1,
-0.2053917, 1.130373, -0.4278094, 0, 1, 0.5372549, 1,
-0.2049116, 0.2165208, -0.07691034, 0, 1, 0.5450981, 1,
-0.2025057, -0.2287629, -1.714329, 0, 1, 0.5490196, 1,
-0.2010583, 1.216704, 0.5323507, 0, 1, 0.5568628, 1,
-0.1978967, -1.670735, -2.590281, 0, 1, 0.5607843, 1,
-0.1969912, -1.291976, -2.778954, 0, 1, 0.5686275, 1,
-0.1967376, 0.6851347, -0.7618908, 0, 1, 0.572549, 1,
-0.195879, -0.3391805, -3.498344, 0, 1, 0.5803922, 1,
-0.1951664, 0.2967645, -1.21003, 0, 1, 0.5843138, 1,
-0.1940148, 0.2662742, 1.268958, 0, 1, 0.5921569, 1,
-0.1858359, -1.158304, -3.290709, 0, 1, 0.5960785, 1,
-0.1853368, -1.462295, -5.061348, 0, 1, 0.6039216, 1,
-0.1842738, 0.278533, -2.646614, 0, 1, 0.6117647, 1,
-0.1822324, 1.980099, -0.547354, 0, 1, 0.6156863, 1,
-0.1784797, -1.058967, -2.374171, 0, 1, 0.6235294, 1,
-0.1771336, 0.2319401, -0.1499696, 0, 1, 0.627451, 1,
-0.1738272, 1.131668, -0.1971998, 0, 1, 0.6352941, 1,
-0.1686638, 0.2445686, -0.3324952, 0, 1, 0.6392157, 1,
-0.1680586, 1.801405, -1.744155, 0, 1, 0.6470588, 1,
-0.1668636, -0.02794708, -2.09838, 0, 1, 0.6509804, 1,
-0.1663547, 0.3865437, -1.167806, 0, 1, 0.6588235, 1,
-0.166013, -0.5809698, -4.557012, 0, 1, 0.6627451, 1,
-0.1640966, -0.7112953, -2.102484, 0, 1, 0.6705883, 1,
-0.1610769, 0.7157403, 0.210094, 0, 1, 0.6745098, 1,
-0.1607249, 0.7123609, -0.3844251, 0, 1, 0.682353, 1,
-0.1591443, -0.9061795, -1.946425, 0, 1, 0.6862745, 1,
-0.155243, 0.3202118, 1.120749, 0, 1, 0.6941177, 1,
-0.1532669, -2.125278, -3.043438, 0, 1, 0.7019608, 1,
-0.1517895, -1.942191, -2.75837, 0, 1, 0.7058824, 1,
-0.1511622, 0.2695209, -0.5050285, 0, 1, 0.7137255, 1,
-0.1491376, 0.980086, 1.568599, 0, 1, 0.7176471, 1,
-0.1448015, -0.04628325, -2.938699, 0, 1, 0.7254902, 1,
-0.1399452, 0.3454361, 1.004156, 0, 1, 0.7294118, 1,
-0.1392318, -0.8896158, -3.306458, 0, 1, 0.7372549, 1,
-0.1372789, 0.4293754, -0.1994848, 0, 1, 0.7411765, 1,
-0.1356694, -0.3690625, -2.601588, 0, 1, 0.7490196, 1,
-0.1351922, -2.048654, -3.70992, 0, 1, 0.7529412, 1,
-0.1280614, 1.904082, 0.03359534, 0, 1, 0.7607843, 1,
-0.125429, 0.2494217, -0.1106462, 0, 1, 0.7647059, 1,
-0.1219965, 0.862043, -0.1060251, 0, 1, 0.772549, 1,
-0.1130421, -1.200806, -1.504294, 0, 1, 0.7764706, 1,
-0.1106707, 0.6219195, 1.185459, 0, 1, 0.7843137, 1,
-0.1071974, -2.040698, -4.01383, 0, 1, 0.7882353, 1,
-0.1069806, -0.6960326, -4.171419, 0, 1, 0.7960784, 1,
-0.1025291, 1.119076, 1.716561, 0, 1, 0.8039216, 1,
-0.1018785, 0.5050787, -1.084935, 0, 1, 0.8078431, 1,
-0.1013583, -0.3918483, -1.805455, 0, 1, 0.8156863, 1,
-0.09715471, -2.478719, -2.037695, 0, 1, 0.8196079, 1,
-0.09591103, 2.229458, -0.2985664, 0, 1, 0.827451, 1,
-0.09429003, -0.380025, -1.164617, 0, 1, 0.8313726, 1,
-0.0907118, -0.04243642, -2.093389, 0, 1, 0.8392157, 1,
-0.08875755, -0.8902459, -1.066136, 0, 1, 0.8431373, 1,
-0.08871458, -0.1721464, -2.396815, 0, 1, 0.8509804, 1,
-0.08704336, -0.7359119, -3.13159, 0, 1, 0.854902, 1,
-0.08308229, 1.331297, 1.329741, 0, 1, 0.8627451, 1,
-0.0773833, 1.495359, 0.2181446, 0, 1, 0.8666667, 1,
-0.07384465, -0.2536227, -4.089434, 0, 1, 0.8745098, 1,
-0.07350495, -0.07868104, -1.063197, 0, 1, 0.8784314, 1,
-0.07152525, 0.6201035, 0.2017325, 0, 1, 0.8862745, 1,
-0.06213231, -0.5263774, -2.191013, 0, 1, 0.8901961, 1,
-0.06210622, 0.2545254, -1.104134, 0, 1, 0.8980392, 1,
-0.06179747, 0.6432443, -1.74436, 0, 1, 0.9058824, 1,
-0.05991587, 0.2020814, -0.02737962, 0, 1, 0.9098039, 1,
-0.05484986, 1.822519, 0.7319707, 0, 1, 0.9176471, 1,
-0.05057407, 1.470156, 0.5646271, 0, 1, 0.9215686, 1,
-0.04114192, 0.7747406, 2.079719, 0, 1, 0.9294118, 1,
-0.03721592, -0.6691208, -3.783054, 0, 1, 0.9333333, 1,
-0.03510902, 0.8838093, -0.3262619, 0, 1, 0.9411765, 1,
-0.03216804, -0.2647284, -2.646655, 0, 1, 0.945098, 1,
-0.03063019, -0.6147966, -2.600822, 0, 1, 0.9529412, 1,
-0.02799911, -0.7166968, -4.581076, 0, 1, 0.9568627, 1,
-0.02274207, 0.6809545, 0.1399563, 0, 1, 0.9647059, 1,
-0.02074652, 0.3766324, 1.236282, 0, 1, 0.9686275, 1,
-0.01888402, -1.237509, -2.396945, 0, 1, 0.9764706, 1,
-0.01755551, 1.557287, -0.1766872, 0, 1, 0.9803922, 1,
-0.01513389, 0.03055121, -0.1433801, 0, 1, 0.9882353, 1,
-0.01221538, 0.3434601, -1.678193, 0, 1, 0.9921569, 1,
-0.009941266, 0.1616679, -0.3114871, 0, 1, 1, 1,
-0.009750778, -1.177642, -3.034533, 0, 0.9921569, 1, 1,
-0.007714356, 0.9875102, 1.155676, 0, 0.9882353, 1, 1,
-0.003199561, 0.2766053, -0.842432, 0, 0.9803922, 1, 1,
-0.002475872, 0.6345165, -1.599608, 0, 0.9764706, 1, 1,
0.01671484, -1.472822, 3.02588, 0, 0.9686275, 1, 1,
0.01750013, 1.19309, 0.2319662, 0, 0.9647059, 1, 1,
0.01765089, 0.3945888, 0.3561956, 0, 0.9568627, 1, 1,
0.01854567, -1.402766, 3.648514, 0, 0.9529412, 1, 1,
0.01919778, 0.2872607, 0.4145472, 0, 0.945098, 1, 1,
0.02454012, 0.9919335, -0.6275395, 0, 0.9411765, 1, 1,
0.03614661, -0.1645771, 2.342517, 0, 0.9333333, 1, 1,
0.04052501, 0.214173, -0.6233297, 0, 0.9294118, 1, 1,
0.04096668, -1.695038, 3.692043, 0, 0.9215686, 1, 1,
0.04237289, 0.5009975, -1.462086, 0, 0.9176471, 1, 1,
0.04440217, -0.5408006, 0.8736882, 0, 0.9098039, 1, 1,
0.04642405, 0.08459578, -0.08633979, 0, 0.9058824, 1, 1,
0.05012643, -0.9531686, 4.768851, 0, 0.8980392, 1, 1,
0.05153169, 0.4538291, 0.01322722, 0, 0.8901961, 1, 1,
0.05389606, -0.3994538, 2.977777, 0, 0.8862745, 1, 1,
0.05411663, 1.725731, 0.5132962, 0, 0.8784314, 1, 1,
0.05822828, 0.1947208, 0.1407197, 0, 0.8745098, 1, 1,
0.06200185, -0.3831469, 1.860285, 0, 0.8666667, 1, 1,
0.06373849, -1.343517, 3.571219, 0, 0.8627451, 1, 1,
0.06754731, -0.8716636, 1.74956, 0, 0.854902, 1, 1,
0.07055797, 0.3990095, -0.1190018, 0, 0.8509804, 1, 1,
0.07081819, 0.3154062, 0.732629, 0, 0.8431373, 1, 1,
0.07121313, 1.150624, 0.1364125, 0, 0.8392157, 1, 1,
0.07277443, -0.8663931, 1.042131, 0, 0.8313726, 1, 1,
0.07524084, -0.1973124, 2.32892, 0, 0.827451, 1, 1,
0.08355923, -0.836968, 3.538566, 0, 0.8196079, 1, 1,
0.08570202, -0.5168598, 2.305978, 0, 0.8156863, 1, 1,
0.09195355, -0.01716344, 1.717625, 0, 0.8078431, 1, 1,
0.09208433, -1.112265, 5.020481, 0, 0.8039216, 1, 1,
0.09347386, -0.1079933, 3.446925, 0, 0.7960784, 1, 1,
0.0955589, -0.05202228, 0.01447521, 0, 0.7882353, 1, 1,
0.09939107, -0.09450155, 2.267526, 0, 0.7843137, 1, 1,
0.1001373, -1.383644, 1.42568, 0, 0.7764706, 1, 1,
0.1004324, -1.245218, 2.592876, 0, 0.772549, 1, 1,
0.1004867, 2.44316, 1.678868, 0, 0.7647059, 1, 1,
0.1021863, 1.322724, -0.8287126, 0, 0.7607843, 1, 1,
0.1034506, -0.1334835, 3.655344, 0, 0.7529412, 1, 1,
0.1070519, -2.047962, 3.247756, 0, 0.7490196, 1, 1,
0.107848, 0.22292, 1.49372, 0, 0.7411765, 1, 1,
0.110589, 0.8618144, -0.532169, 0, 0.7372549, 1, 1,
0.1130048, -1.540019, 4.079216, 0, 0.7294118, 1, 1,
0.1158041, 0.6274062, -0.3809604, 0, 0.7254902, 1, 1,
0.1166222, -0.1675204, 0.522734, 0, 0.7176471, 1, 1,
0.1168521, 0.8395615, 0.719867, 0, 0.7137255, 1, 1,
0.1206664, -0.05452945, 2.075566, 0, 0.7058824, 1, 1,
0.1230506, 0.2252982, 0.1421424, 0, 0.6980392, 1, 1,
0.1275459, -0.5919146, 3.950647, 0, 0.6941177, 1, 1,
0.1296996, 0.3976744, -0.1855955, 0, 0.6862745, 1, 1,
0.1360702, -0.5657919, 1.910547, 0, 0.682353, 1, 1,
0.1363387, -0.07458156, 2.687464, 0, 0.6745098, 1, 1,
0.1384161, -0.02608155, 0.9278687, 0, 0.6705883, 1, 1,
0.1402738, -0.7404843, 4.144773, 0, 0.6627451, 1, 1,
0.1439617, -0.4321324, 1.498003, 0, 0.6588235, 1, 1,
0.1443868, 0.4808588, 1.078968, 0, 0.6509804, 1, 1,
0.146632, -0.851896, 4.981759, 0, 0.6470588, 1, 1,
0.1480482, -0.09901465, 2.085466, 0, 0.6392157, 1, 1,
0.149866, -0.0299559, 0.06075645, 0, 0.6352941, 1, 1,
0.1503069, -0.01843289, 1.002174, 0, 0.627451, 1, 1,
0.151354, -2.63046, 3.845735, 0, 0.6235294, 1, 1,
0.1526427, -0.3826167, 1.197655, 0, 0.6156863, 1, 1,
0.1528369, -1.732531, 3.056925, 0, 0.6117647, 1, 1,
0.1560358, -1.5365, 3.478945, 0, 0.6039216, 1, 1,
0.1579849, 0.302461, 0.4019903, 0, 0.5960785, 1, 1,
0.1597644, 0.5084357, -0.2781502, 0, 0.5921569, 1, 1,
0.1630145, -0.7137224, 2.785563, 0, 0.5843138, 1, 1,
0.1701725, 1.350611, 0.875761, 0, 0.5803922, 1, 1,
0.1707493, -0.672536, 3.106555, 0, 0.572549, 1, 1,
0.1723592, 0.3541832, -0.4154874, 0, 0.5686275, 1, 1,
0.1738051, -1.358688, 2.737673, 0, 0.5607843, 1, 1,
0.183691, -0.738056, 2.411322, 0, 0.5568628, 1, 1,
0.1904983, -0.38474, 2.450396, 0, 0.5490196, 1, 1,
0.1913937, 0.8772655, 0.1477339, 0, 0.5450981, 1, 1,
0.1916039, -1.458471, 2.230536, 0, 0.5372549, 1, 1,
0.1920656, -0.9790154, 3.975702, 0, 0.5333334, 1, 1,
0.1933272, 1.961194, 0.6878384, 0, 0.5254902, 1, 1,
0.1950425, -0.8526751, 3.447983, 0, 0.5215687, 1, 1,
0.1981963, -0.6111111, 2.949501, 0, 0.5137255, 1, 1,
0.1988486, -0.01995535, 1.89993, 0, 0.509804, 1, 1,
0.1997575, -1.267369, 3.804124, 0, 0.5019608, 1, 1,
0.2001932, -0.4856725, 2.90387, 0, 0.4941176, 1, 1,
0.2005067, -0.09011775, 1.558252, 0, 0.4901961, 1, 1,
0.2053804, 1.441319, -0.2770418, 0, 0.4823529, 1, 1,
0.2054205, -0.5705802, 1.359478, 0, 0.4784314, 1, 1,
0.2080372, -0.3221235, 3.133018, 0, 0.4705882, 1, 1,
0.2099144, 0.5858359, 1.488817, 0, 0.4666667, 1, 1,
0.2111266, 0.28325, 0.1822181, 0, 0.4588235, 1, 1,
0.2126716, -0.4895751, 3.047621, 0, 0.454902, 1, 1,
0.2133091, -0.2831384, 3.166844, 0, 0.4470588, 1, 1,
0.2151461, 0.3932848, 0.7539122, 0, 0.4431373, 1, 1,
0.2168086, 0.5143545, 0.9438211, 0, 0.4352941, 1, 1,
0.2172771, 1.132246, -1.025562, 0, 0.4313726, 1, 1,
0.2228964, 0.2593921, 2.212149, 0, 0.4235294, 1, 1,
0.2241659, -1.380572, 5.243821, 0, 0.4196078, 1, 1,
0.2252969, -1.289102, 2.549501, 0, 0.4117647, 1, 1,
0.2253991, -0.6833389, 4.208017, 0, 0.4078431, 1, 1,
0.226801, 1.358687, 0.4991413, 0, 0.4, 1, 1,
0.2275837, 0.3476509, -2.140947, 0, 0.3921569, 1, 1,
0.2293541, -1.033126, 1.470294, 0, 0.3882353, 1, 1,
0.2297669, -0.9419882, 2.09835, 0, 0.3803922, 1, 1,
0.2314424, -1.152507, 1.755469, 0, 0.3764706, 1, 1,
0.2362583, -1.179702, 4.765989, 0, 0.3686275, 1, 1,
0.2376215, -0.9986858, 3.470798, 0, 0.3647059, 1, 1,
0.24506, -0.3011765, 3.967915, 0, 0.3568628, 1, 1,
0.2510049, -0.6469453, 3.488081, 0, 0.3529412, 1, 1,
0.2512357, 0.8040404, 0.1588719, 0, 0.345098, 1, 1,
0.2580778, -0.3467442, 2.018821, 0, 0.3411765, 1, 1,
0.2615561, -0.8980351, 2.604845, 0, 0.3333333, 1, 1,
0.2620953, 1.294581, 1.514473, 0, 0.3294118, 1, 1,
0.2658806, -0.6715839, 1.709417, 0, 0.3215686, 1, 1,
0.2671311, 1.199792, -0.7734728, 0, 0.3176471, 1, 1,
0.2709198, -0.05435287, 1.485593, 0, 0.3098039, 1, 1,
0.272873, 0.1036969, 0.8754933, 0, 0.3058824, 1, 1,
0.2758657, -0.04404572, 2.889809, 0, 0.2980392, 1, 1,
0.2761084, 1.035887, -0.8701553, 0, 0.2901961, 1, 1,
0.2781878, -0.6728655, 3.314404, 0, 0.2862745, 1, 1,
0.2790633, 1.078346, 1.25309, 0, 0.2784314, 1, 1,
0.2806813, 0.5766374, 0.4443015, 0, 0.2745098, 1, 1,
0.282089, -0.2569951, 3.934343, 0, 0.2666667, 1, 1,
0.2830932, 0.5169749, -0.1067604, 0, 0.2627451, 1, 1,
0.283827, 0.5793407, 1.562325, 0, 0.254902, 1, 1,
0.2870813, 0.1512711, 2.055381, 0, 0.2509804, 1, 1,
0.2875805, 0.3658311, 0.7642878, 0, 0.2431373, 1, 1,
0.2901695, -1.521684, 3.418579, 0, 0.2392157, 1, 1,
0.2923909, 0.446669, -0.3013389, 0, 0.2313726, 1, 1,
0.2971227, 1.0401, 1.050146, 0, 0.227451, 1, 1,
0.299031, -0.5864843, 1.377529, 0, 0.2196078, 1, 1,
0.2995867, 0.4974773, -1.229485, 0, 0.2156863, 1, 1,
0.3030496, 0.5781048, 1.059388, 0, 0.2078431, 1, 1,
0.306777, 0.8870421, -0.09699421, 0, 0.2039216, 1, 1,
0.3083221, -0.1218677, 2.030661, 0, 0.1960784, 1, 1,
0.3196926, -0.00773366, 1.891522, 0, 0.1882353, 1, 1,
0.3199659, -0.02801358, 1.391665, 0, 0.1843137, 1, 1,
0.3256369, -2.616584, 1.804454, 0, 0.1764706, 1, 1,
0.3267578, -0.03249785, 1.854555, 0, 0.172549, 1, 1,
0.330079, -0.4062165, 1.482767, 0, 0.1647059, 1, 1,
0.335506, 0.9592327, 0.8473668, 0, 0.1607843, 1, 1,
0.3363701, 0.349969, 2.049756, 0, 0.1529412, 1, 1,
0.3364498, 0.8196691, -0.1177701, 0, 0.1490196, 1, 1,
0.3381469, -0.5108674, 4.5864, 0, 0.1411765, 1, 1,
0.3411912, 1.597574, 1.774285, 0, 0.1372549, 1, 1,
0.3427618, 0.802554, 1.388302, 0, 0.1294118, 1, 1,
0.3455829, 1.009594, 1.621574, 0, 0.1254902, 1, 1,
0.3460066, 0.9976619, -0.2919381, 0, 0.1176471, 1, 1,
0.3463966, 0.05175411, 0.2064922, 0, 0.1137255, 1, 1,
0.3476681, 0.7614958, 0.4381228, 0, 0.1058824, 1, 1,
0.35065, -0.6737186, 2.279418, 0, 0.09803922, 1, 1,
0.3535603, 0.4525727, 1.583892, 0, 0.09411765, 1, 1,
0.3541774, 1.592586, 0.3926328, 0, 0.08627451, 1, 1,
0.3542344, 0.7220671, 0.4459754, 0, 0.08235294, 1, 1,
0.3564197, -0.7317499, 3.189467, 0, 0.07450981, 1, 1,
0.3567661, 0.1821205, 0.9644452, 0, 0.07058824, 1, 1,
0.3609264, -1.218435, 1.618161, 0, 0.0627451, 1, 1,
0.3618848, 0.3522967, 1.94692, 0, 0.05882353, 1, 1,
0.3626516, -1.155298, 4.067377, 0, 0.05098039, 1, 1,
0.3657486, -0.221483, 2.279486, 0, 0.04705882, 1, 1,
0.3666134, 0.0175632, -0.04161558, 0, 0.03921569, 1, 1,
0.368515, -0.8193662, 1.98165, 0, 0.03529412, 1, 1,
0.3691027, 0.5550721, -0.07984016, 0, 0.02745098, 1, 1,
0.3809977, 0.814917, 0.8383798, 0, 0.02352941, 1, 1,
0.3870489, 0.5239418, 0.7992224, 0, 0.01568628, 1, 1,
0.387218, 0.04718077, 1.90336, 0, 0.01176471, 1, 1,
0.3873232, 1.316102, -0.8154767, 0, 0.003921569, 1, 1,
0.3932274, -1.392937, 2.095447, 0.003921569, 0, 1, 1,
0.3959741, -0.7017481, 3.540608, 0.007843138, 0, 1, 1,
0.3996895, 1.06624, 1.67842, 0.01568628, 0, 1, 1,
0.4044966, 0.4575981, 0.3663411, 0.01960784, 0, 1, 1,
0.4065024, 0.8944179, 0.8726288, 0.02745098, 0, 1, 1,
0.4068562, -1.242038, 4.425021, 0.03137255, 0, 1, 1,
0.409365, -0.1092081, 1.608411, 0.03921569, 0, 1, 1,
0.409505, 1.047935, -0.5351211, 0.04313726, 0, 1, 1,
0.4113617, -1.281947, 1.618732, 0.05098039, 0, 1, 1,
0.4115629, -0.2024523, 1.688663, 0.05490196, 0, 1, 1,
0.411801, 0.9988576, 1.077326, 0.0627451, 0, 1, 1,
0.4168122, -0.437485, 3.496628, 0.06666667, 0, 1, 1,
0.4203735, -0.4318192, 0.9061899, 0.07450981, 0, 1, 1,
0.4214598, 0.06939082, 1.027978, 0.07843138, 0, 1, 1,
0.4226341, -1.152836, 4.229545, 0.08627451, 0, 1, 1,
0.4235367, 0.4033915, 1.741467, 0.09019608, 0, 1, 1,
0.4250928, 0.1110957, 0.9011379, 0.09803922, 0, 1, 1,
0.4251065, 0.06051007, 0.1276943, 0.1058824, 0, 1, 1,
0.4320715, 0.01143906, 3.482347, 0.1098039, 0, 1, 1,
0.4346848, -0.7938741, 2.709711, 0.1176471, 0, 1, 1,
0.4348349, -0.5003186, 2.975528, 0.1215686, 0, 1, 1,
0.4348604, 1.193879, 1.593432, 0.1294118, 0, 1, 1,
0.4435699, 1.082129, 1.377121, 0.1333333, 0, 1, 1,
0.4531181, 1.612966, -0.6164563, 0.1411765, 0, 1, 1,
0.4555602, -0.420952, 2.255126, 0.145098, 0, 1, 1,
0.4559143, -0.2465747, 1.994359, 0.1529412, 0, 1, 1,
0.4593373, 0.5445945, 2.340734, 0.1568628, 0, 1, 1,
0.4739823, -0.4226696, 2.923676, 0.1647059, 0, 1, 1,
0.4807081, 1.162147, -0.4414486, 0.1686275, 0, 1, 1,
0.4814661, -0.7760723, 1.574822, 0.1764706, 0, 1, 1,
0.4859713, 0.2487096, 2.004298, 0.1803922, 0, 1, 1,
0.4874467, -0.5255903, 2.211484, 0.1882353, 0, 1, 1,
0.4879525, 0.1780695, 1.599105, 0.1921569, 0, 1, 1,
0.4908741, 1.191481, 1.112115, 0.2, 0, 1, 1,
0.4918505, 0.9317771, -2.060718, 0.2078431, 0, 1, 1,
0.4974005, 1.06174, 1.327046, 0.2117647, 0, 1, 1,
0.4983162, -0.1831942, 0.8877929, 0.2196078, 0, 1, 1,
0.5007557, -0.2340511, 2.471664, 0.2235294, 0, 1, 1,
0.504629, -2.086907, 2.425104, 0.2313726, 0, 1, 1,
0.5087752, -0.0907959, 0.5976733, 0.2352941, 0, 1, 1,
0.5097263, -2.111874, 1.535293, 0.2431373, 0, 1, 1,
0.5097672, 0.6118826, 1.14817, 0.2470588, 0, 1, 1,
0.5101822, -0.2643814, 3.459538, 0.254902, 0, 1, 1,
0.5125858, -1.405418, 3.742744, 0.2588235, 0, 1, 1,
0.5139427, 2.039469, 3.137546, 0.2666667, 0, 1, 1,
0.5166335, 0.1959155, 1.379874, 0.2705882, 0, 1, 1,
0.5181864, -1.740219, 1.705803, 0.2784314, 0, 1, 1,
0.5190676, -0.4197254, 1.373089, 0.282353, 0, 1, 1,
0.520497, 1.304952, 1.516771, 0.2901961, 0, 1, 1,
0.5211058, 1.308143, 0.654622, 0.2941177, 0, 1, 1,
0.5250071, 0.1537591, 0.3941459, 0.3019608, 0, 1, 1,
0.5264878, -0.00860474, 1.545255, 0.3098039, 0, 1, 1,
0.5322678, -0.2687041, 2.302783, 0.3137255, 0, 1, 1,
0.5340405, -0.1481462, 0.2404436, 0.3215686, 0, 1, 1,
0.5389848, -0.6738758, 1.542334, 0.3254902, 0, 1, 1,
0.541169, 0.2382508, 2.336201, 0.3333333, 0, 1, 1,
0.5472617, -0.7624585, 3.819648, 0.3372549, 0, 1, 1,
0.5584537, 0.6053517, -1.206526, 0.345098, 0, 1, 1,
0.5614117, 0.8984259, -0.734456, 0.3490196, 0, 1, 1,
0.5643835, 0.3530485, 0.5219954, 0.3568628, 0, 1, 1,
0.5711923, 1.294665, 1.200768, 0.3607843, 0, 1, 1,
0.5766004, -1.632233, 1.133742, 0.3686275, 0, 1, 1,
0.5868617, 0.4965288, 1.71062, 0.372549, 0, 1, 1,
0.5969077, -2.48312, 2.170288, 0.3803922, 0, 1, 1,
0.5987479, 0.1938367, 1.171503, 0.3843137, 0, 1, 1,
0.6035565, -0.6628059, 5.004205, 0.3921569, 0, 1, 1,
0.6197451, 1.682093, -0.4457309, 0.3960784, 0, 1, 1,
0.6232996, 0.0762058, 0.6901602, 0.4039216, 0, 1, 1,
0.6251658, 0.2993366, 1.104557, 0.4117647, 0, 1, 1,
0.6262136, -1.253283, 2.284363, 0.4156863, 0, 1, 1,
0.6322032, 0.08709075, 2.991011, 0.4235294, 0, 1, 1,
0.6436677, -0.4055037, 3.164334, 0.427451, 0, 1, 1,
0.645359, -0.2929642, 0.9634325, 0.4352941, 0, 1, 1,
0.6475565, 1.482478, -1.072006, 0.4392157, 0, 1, 1,
0.6529652, -1.847217, 3.233986, 0.4470588, 0, 1, 1,
0.6539382, 0.01958054, 0.05468149, 0.4509804, 0, 1, 1,
0.6544859, 0.1182318, 2.315692, 0.4588235, 0, 1, 1,
0.6551087, 0.9132677, -0.8427467, 0.4627451, 0, 1, 1,
0.6593339, 0.3981987, 0.903105, 0.4705882, 0, 1, 1,
0.6721916, 0.9353263, 1.445999, 0.4745098, 0, 1, 1,
0.6773316, 2.118276, 1.091561, 0.4823529, 0, 1, 1,
0.6798279, 0.3927445, -0.2617261, 0.4862745, 0, 1, 1,
0.683063, 0.2181322, 1.678171, 0.4941176, 0, 1, 1,
0.6845034, -0.1641516, 2.095295, 0.5019608, 0, 1, 1,
0.6926913, -0.5887603, 3.145818, 0.5058824, 0, 1, 1,
0.6975533, 2.493077, 0.8168861, 0.5137255, 0, 1, 1,
0.7029024, 0.4945799, 1.395634, 0.5176471, 0, 1, 1,
0.7075982, -0.1631247, 0.8860419, 0.5254902, 0, 1, 1,
0.7122577, 1.21721, 0.1565997, 0.5294118, 0, 1, 1,
0.7132608, -0.02859329, 1.746548, 0.5372549, 0, 1, 1,
0.7162597, -0.8924884, 3.474584, 0.5411765, 0, 1, 1,
0.7228879, -0.2899135, 0.5159681, 0.5490196, 0, 1, 1,
0.7259143, -0.622885, 3.796996, 0.5529412, 0, 1, 1,
0.7346195, -2.263311, 3.263226, 0.5607843, 0, 1, 1,
0.7356698, -0.7192787, 1.981404, 0.5647059, 0, 1, 1,
0.7373942, -2.598679, 3.332694, 0.572549, 0, 1, 1,
0.7376673, 1.277239, 2.415373, 0.5764706, 0, 1, 1,
0.7631736, -1.903268, 2.06084, 0.5843138, 0, 1, 1,
0.768091, -0.800854, 2.9804, 0.5882353, 0, 1, 1,
0.7685262, 1.247564, -0.1733212, 0.5960785, 0, 1, 1,
0.7702613, -1.165941, 3.765806, 0.6039216, 0, 1, 1,
0.7740441, -0.6932529, 1.039102, 0.6078432, 0, 1, 1,
0.7760762, 0.1681556, 0.06246575, 0.6156863, 0, 1, 1,
0.7762698, -0.07292865, 1.979623, 0.6196079, 0, 1, 1,
0.7839404, 0.06282143, 1.028088, 0.627451, 0, 1, 1,
0.7843665, -0.4983881, -0.0692483, 0.6313726, 0, 1, 1,
0.7888607, 0.7572014, 0.4861885, 0.6392157, 0, 1, 1,
0.7938282, 1.04853, 0.2525321, 0.6431373, 0, 1, 1,
0.798719, 0.1368513, 0.6627743, 0.6509804, 0, 1, 1,
0.7997171, 0.715281, 0.9694927, 0.654902, 0, 1, 1,
0.801065, 1.486592, -0.3363654, 0.6627451, 0, 1, 1,
0.8012298, 2.487622, -0.1110541, 0.6666667, 0, 1, 1,
0.8021339, 0.1005711, 0.2876469, 0.6745098, 0, 1, 1,
0.8038009, -1.117003, 3.527015, 0.6784314, 0, 1, 1,
0.805567, -1.720524, 3.617296, 0.6862745, 0, 1, 1,
0.8088275, 0.2147073, 2.809447, 0.6901961, 0, 1, 1,
0.8118867, -1.415432, 2.607272, 0.6980392, 0, 1, 1,
0.8135412, 0.3030042, 2.706915, 0.7058824, 0, 1, 1,
0.8151778, -0.03233335, -0.07958595, 0.7098039, 0, 1, 1,
0.8185136, 0.2355368, 1.683922, 0.7176471, 0, 1, 1,
0.8188631, -1.725439, 3.497894, 0.7215686, 0, 1, 1,
0.8293653, 1.294109, -0.2888187, 0.7294118, 0, 1, 1,
0.8320987, -1.134094, 2.174194, 0.7333333, 0, 1, 1,
0.8368213, -1.359827, 0.5410118, 0.7411765, 0, 1, 1,
0.8391606, -0.1833053, 2.668228, 0.7450981, 0, 1, 1,
0.8424221, 2.430885, 0.8567671, 0.7529412, 0, 1, 1,
0.8478302, -1.951377, 1.30624, 0.7568628, 0, 1, 1,
0.8495016, 1.086571, 0.1751595, 0.7647059, 0, 1, 1,
0.8510376, 0.02631597, 2.129016, 0.7686275, 0, 1, 1,
0.8524243, 0.2891665, 3.718073, 0.7764706, 0, 1, 1,
0.8535618, 1.084583, 1.281347, 0.7803922, 0, 1, 1,
0.8556559, -0.7520454, 3.093337, 0.7882353, 0, 1, 1,
0.8561445, 0.2392811, 1.780317, 0.7921569, 0, 1, 1,
0.8596756, -0.5943992, 1.250972, 0.8, 0, 1, 1,
0.8605095, 0.707346, -1.21951, 0.8078431, 0, 1, 1,
0.8638039, 0.7690919, -1.103189, 0.8117647, 0, 1, 1,
0.8654491, -0.8908398, 1.705689, 0.8196079, 0, 1, 1,
0.8686246, 0.4601696, -0.05050874, 0.8235294, 0, 1, 1,
0.8722851, -0.09482888, 1.395643, 0.8313726, 0, 1, 1,
0.8763264, -1.836991, 4.774461, 0.8352941, 0, 1, 1,
0.8772746, 0.4018137, 0.2363321, 0.8431373, 0, 1, 1,
0.8902103, 0.2446522, 1.03147, 0.8470588, 0, 1, 1,
0.894308, -1.155392, 2.057569, 0.854902, 0, 1, 1,
0.8970656, -0.5088911, 2.418913, 0.8588235, 0, 1, 1,
0.8975481, 0.1938235, 1.384145, 0.8666667, 0, 1, 1,
0.9004569, 0.7760425, -0.8745079, 0.8705882, 0, 1, 1,
0.9275646, -2.092839, 4.038169, 0.8784314, 0, 1, 1,
0.9277258, -0.4619485, 1.388258, 0.8823529, 0, 1, 1,
0.9288365, 0.07079203, 0.8139506, 0.8901961, 0, 1, 1,
0.9289728, -1.344257, 1.705948, 0.8941177, 0, 1, 1,
0.9313332, 0.9357522, 0.4708206, 0.9019608, 0, 1, 1,
0.9374594, 0.3947353, 0.6499819, 0.9098039, 0, 1, 1,
0.9383566, -2.398263, 2.679291, 0.9137255, 0, 1, 1,
0.9413642, 0.5095196, 1.263493, 0.9215686, 0, 1, 1,
0.9416342, -0.01859422, 1.520312, 0.9254902, 0, 1, 1,
0.9442079, -0.3843165, 0.802766, 0.9333333, 0, 1, 1,
0.9545097, 0.9892753, 1.086349, 0.9372549, 0, 1, 1,
0.9564886, -0.5693132, 1.687089, 0.945098, 0, 1, 1,
0.9567657, -0.6908554, 3.741108, 0.9490196, 0, 1, 1,
0.9573479, -1.187488, 3.054732, 0.9568627, 0, 1, 1,
0.9576589, -0.5614417, 1.480501, 0.9607843, 0, 1, 1,
0.9605308, -1.583725, 2.005978, 0.9686275, 0, 1, 1,
0.9615701, -1.28912, 4.49361, 0.972549, 0, 1, 1,
0.9624023, -1.101181, 3.666625, 0.9803922, 0, 1, 1,
0.9658437, 0.1337705, 1.402546, 0.9843137, 0, 1, 1,
0.9712368, -0.6042485, 0.9918417, 0.9921569, 0, 1, 1,
0.9779171, 0.1895421, 0.949538, 0.9960784, 0, 1, 1,
0.9815425, 0.4294146, 1.332787, 1, 0, 0.9960784, 1,
0.9818086, 0.1515428, 1.315481, 1, 0, 0.9882353, 1,
0.9830164, -0.9456866, 3.674098, 1, 0, 0.9843137, 1,
0.9841423, 0.1123331, 1.078396, 1, 0, 0.9764706, 1,
0.9953049, 0.311262, -0.9506673, 1, 0, 0.972549, 1,
0.9985645, 1.474244, -0.6696658, 1, 0, 0.9647059, 1,
1.008612, 0.4073038, 0.8784237, 1, 0, 0.9607843, 1,
1.014516, 0.6756445, 1.890636, 1, 0, 0.9529412, 1,
1.015461, 1.816357, -0.305961, 1, 0, 0.9490196, 1,
1.016118, -1.172086, 2.182373, 1, 0, 0.9411765, 1,
1.022688, 0.8124005, -0.2348457, 1, 0, 0.9372549, 1,
1.029126, -1.311079, 4.417822, 1, 0, 0.9294118, 1,
1.029487, 0.5036139, 3.05793, 1, 0, 0.9254902, 1,
1.033966, 1.059265, 0.3712206, 1, 0, 0.9176471, 1,
1.034226, 1.409165, 2.219262, 1, 0, 0.9137255, 1,
1.040867, -0.05870295, 1.378737, 1, 0, 0.9058824, 1,
1.054073, 0.8193651, 0.4812221, 1, 0, 0.9019608, 1,
1.092038, -0.2488446, 0.289167, 1, 0, 0.8941177, 1,
1.096793, -1.14083, 3.476388, 1, 0, 0.8862745, 1,
1.10343, 0.7366968, 2.7764, 1, 0, 0.8823529, 1,
1.106305, -1.200764, 1.746469, 1, 0, 0.8745098, 1,
1.106915, -2.037905, 1.988966, 1, 0, 0.8705882, 1,
1.108854, -1.066134, 2.360955, 1, 0, 0.8627451, 1,
1.110251, 0.03450869, 0.09626989, 1, 0, 0.8588235, 1,
1.111997, 0.5151243, 1.644937, 1, 0, 0.8509804, 1,
1.12104, -1.068169, 1.648902, 1, 0, 0.8470588, 1,
1.122873, 0.2629732, 0.2659196, 1, 0, 0.8392157, 1,
1.126046, 0.09181564, 1.670264, 1, 0, 0.8352941, 1,
1.126472, -0.4751117, 1.743378, 1, 0, 0.827451, 1,
1.128829, -1.546829, 0.3242635, 1, 0, 0.8235294, 1,
1.131457, 2.221485, 1.120422, 1, 0, 0.8156863, 1,
1.134165, 1.421744, -0.5085854, 1, 0, 0.8117647, 1,
1.137954, -1.631308, 3.427429, 1, 0, 0.8039216, 1,
1.145265, 0.964337, 1.384593, 1, 0, 0.7960784, 1,
1.147283, 0.9879081, 2.084937, 1, 0, 0.7921569, 1,
1.148272, -0.251517, 2.360156, 1, 0, 0.7843137, 1,
1.148774, -0.5112711, 2.271025, 1, 0, 0.7803922, 1,
1.152958, 0.04523142, 2.199848, 1, 0, 0.772549, 1,
1.154572, 1.237383, 0.8354195, 1, 0, 0.7686275, 1,
1.156214, 1.005326, 1.493431, 1, 0, 0.7607843, 1,
1.159989, -1.250382, 2.561805, 1, 0, 0.7568628, 1,
1.160421, 2.06725, -0.6406263, 1, 0, 0.7490196, 1,
1.164769, 0.8221424, 3.229296, 1, 0, 0.7450981, 1,
1.169258, 1.093471, 2.577662, 1, 0, 0.7372549, 1,
1.169613, -1.573739, 3.480808, 1, 0, 0.7333333, 1,
1.169677, 1.053383, 3.0924, 1, 0, 0.7254902, 1,
1.174714, 0.7554441, 0.5158005, 1, 0, 0.7215686, 1,
1.184151, -0.007247584, 1.701229, 1, 0, 0.7137255, 1,
1.193506, 1.20214, 2.351397, 1, 0, 0.7098039, 1,
1.198793, -0.9975502, 0.6462697, 1, 0, 0.7019608, 1,
1.199493, 1.150075, 0.6947855, 1, 0, 0.6941177, 1,
1.205464, -0.6352273, 1.225383, 1, 0, 0.6901961, 1,
1.210587, 0.264323, -1.439932, 1, 0, 0.682353, 1,
1.210816, 0.8922589, 2.802805, 1, 0, 0.6784314, 1,
1.211176, -0.9849852, 1.345637, 1, 0, 0.6705883, 1,
1.213123, -1.781953, 2.836345, 1, 0, 0.6666667, 1,
1.213427, 0.5337386, 1.030871, 1, 0, 0.6588235, 1,
1.217416, 1.182732, 0.6750603, 1, 0, 0.654902, 1,
1.218337, 1.113222, 1.222436, 1, 0, 0.6470588, 1,
1.219752, 1.928074, 1.558877, 1, 0, 0.6431373, 1,
1.220038, -0.1978613, 1.093034, 1, 0, 0.6352941, 1,
1.22056, 0.5945681, -1.050941, 1, 0, 0.6313726, 1,
1.22084, -1.162582, 4.15523, 1, 0, 0.6235294, 1,
1.234865, 1.102205, 1.119186, 1, 0, 0.6196079, 1,
1.243758, -0.591279, 2.862616, 1, 0, 0.6117647, 1,
1.253276, 2.143093, 1.378268, 1, 0, 0.6078432, 1,
1.253825, -2.175574, 2.054791, 1, 0, 0.6, 1,
1.256382, -1.040206, 4.677778, 1, 0, 0.5921569, 1,
1.261562, 1.023519, -0.8811266, 1, 0, 0.5882353, 1,
1.263086, 0.7200775, 1.290478, 1, 0, 0.5803922, 1,
1.271803, 0.1740991, 0.4754634, 1, 0, 0.5764706, 1,
1.277786, -0.6797115, 1.325557, 1, 0, 0.5686275, 1,
1.293899, -0.4244576, 1.441027, 1, 0, 0.5647059, 1,
1.297763, -2.075554, 2.929841, 1, 0, 0.5568628, 1,
1.298765, 1.942417, -0.5993409, 1, 0, 0.5529412, 1,
1.302805, -2.75176, 1.634245, 1, 0, 0.5450981, 1,
1.32748, -0.8027784, 0.9026531, 1, 0, 0.5411765, 1,
1.335802, 1.203348, 0.330602, 1, 0, 0.5333334, 1,
1.337735, -0.3886389, 2.605328, 1, 0, 0.5294118, 1,
1.346701, 0.4642446, -1.271351, 1, 0, 0.5215687, 1,
1.361831, 1.424985, 0.2251423, 1, 0, 0.5176471, 1,
1.367373, 0.945213, 1.357171, 1, 0, 0.509804, 1,
1.39416, 0.5983987, 2.19058, 1, 0, 0.5058824, 1,
1.403965, -0.1583897, 1.051756, 1, 0, 0.4980392, 1,
1.404144, 0.9344066, 1.775221, 1, 0, 0.4901961, 1,
1.412167, 0.0160365, 1.576294, 1, 0, 0.4862745, 1,
1.420196, -0.8114755, 2.32003, 1, 0, 0.4784314, 1,
1.431197, -1.06444, 1.087116, 1, 0, 0.4745098, 1,
1.435612, -1.554455, 3.834556, 1, 0, 0.4666667, 1,
1.449664, 0.986564, 1.952957, 1, 0, 0.4627451, 1,
1.451068, 0.4215292, 0.4331165, 1, 0, 0.454902, 1,
1.462668, -0.8247249, 2.227292, 1, 0, 0.4509804, 1,
1.464012, -1.59309, 3.019421, 1, 0, 0.4431373, 1,
1.490975, -0.0547987, 3.132869, 1, 0, 0.4392157, 1,
1.514178, -1.001803, 1.055829, 1, 0, 0.4313726, 1,
1.51776, -1.056921, 2.219817, 1, 0, 0.427451, 1,
1.525455, 0.1090641, 0.6782503, 1, 0, 0.4196078, 1,
1.534766, -1.193723, 2.756845, 1, 0, 0.4156863, 1,
1.539673, 1.566824, 1.680623, 1, 0, 0.4078431, 1,
1.547684, -0.8176975, 2.815096, 1, 0, 0.4039216, 1,
1.553834, -0.1409962, 1.977942, 1, 0, 0.3960784, 1,
1.558374, -0.03657035, 3.123327, 1, 0, 0.3882353, 1,
1.564861, 0.2004081, 0.7240052, 1, 0, 0.3843137, 1,
1.577201, 0.01120014, 2.61912, 1, 0, 0.3764706, 1,
1.584841, -1.963871, 2.304704, 1, 0, 0.372549, 1,
1.593229, 1.320395, 0.8848894, 1, 0, 0.3647059, 1,
1.598597, -0.7064444, 2.719817, 1, 0, 0.3607843, 1,
1.598964, -0.4230349, 2.403897, 1, 0, 0.3529412, 1,
1.613858, 0.05690242, 3.211403, 1, 0, 0.3490196, 1,
1.627114, 1.823768, 0.8445689, 1, 0, 0.3411765, 1,
1.644486, -0.0908834, 2.138954, 1, 0, 0.3372549, 1,
1.652983, -0.6526362, 2.890301, 1, 0, 0.3294118, 1,
1.671953, -0.9734849, 1.58216, 1, 0, 0.3254902, 1,
1.688876, 0.1025632, 0.8288363, 1, 0, 0.3176471, 1,
1.699957, -0.4329996, 3.109886, 1, 0, 0.3137255, 1,
1.700379, -0.7898986, 0.7275807, 1, 0, 0.3058824, 1,
1.703207, 0.3554235, 2.160845, 1, 0, 0.2980392, 1,
1.711315, 1.752838, 1.481441, 1, 0, 0.2941177, 1,
1.747265, 0.364655, 0.9795422, 1, 0, 0.2862745, 1,
1.754954, -0.2917622, 1.586671, 1, 0, 0.282353, 1,
1.759196, 0.9508836, 0.842609, 1, 0, 0.2745098, 1,
1.775236, -0.1297252, 0.6308877, 1, 0, 0.2705882, 1,
1.77615, 0.6392248, 0.8922358, 1, 0, 0.2627451, 1,
1.781125, 1.305521, -0.05422664, 1, 0, 0.2588235, 1,
1.794568, 0.2090691, 0.9352885, 1, 0, 0.2509804, 1,
1.803518, -0.08334193, 3.115133, 1, 0, 0.2470588, 1,
1.81679, 1.682426, 2.507542, 1, 0, 0.2392157, 1,
1.831613, 1.528906, 1.39981, 1, 0, 0.2352941, 1,
1.837021, -1.266574, 2.50696, 1, 0, 0.227451, 1,
1.837067, -0.8279849, 1.570265, 1, 0, 0.2235294, 1,
1.869837, 0.682022, 0.2821777, 1, 0, 0.2156863, 1,
1.877401, 0.280389, 1.187119, 1, 0, 0.2117647, 1,
1.888141, -0.04514242, 1.83358, 1, 0, 0.2039216, 1,
1.892882, 0.5575199, 0.3269989, 1, 0, 0.1960784, 1,
1.900396, 2.638404, 0.9666744, 1, 0, 0.1921569, 1,
1.901618, 0.6728263, 1.624438, 1, 0, 0.1843137, 1,
1.908421, 1.864053, 1.04304, 1, 0, 0.1803922, 1,
1.919667, -1.576601, 3.431361, 1, 0, 0.172549, 1,
1.950552, -0.8847495, 1.024384, 1, 0, 0.1686275, 1,
1.964009, 0.7332755, -0.142588, 1, 0, 0.1607843, 1,
1.966296, -0.161615, 0.6039183, 1, 0, 0.1568628, 1,
1.984856, -0.6200668, 2.00279, 1, 0, 0.1490196, 1,
2.020173, -0.7161043, 2.172545, 1, 0, 0.145098, 1,
2.045638, -1.660311, 1.997103, 1, 0, 0.1372549, 1,
2.084916, 0.7247828, 0.9333383, 1, 0, 0.1333333, 1,
2.093279, 0.622877, 2.723937, 1, 0, 0.1254902, 1,
2.095875, -2.470693, 2.941833, 1, 0, 0.1215686, 1,
2.159743, 1.755497, 1.033489, 1, 0, 0.1137255, 1,
2.162786, 0.2386108, 1.205967, 1, 0, 0.1098039, 1,
2.222396, 0.3216469, 0.5160659, 1, 0, 0.1019608, 1,
2.226564, 0.736635, 2.578807, 1, 0, 0.09411765, 1,
2.387256, 0.2534172, 0.8688354, 1, 0, 0.09019608, 1,
2.387665, -0.9767035, 2.03777, 1, 0, 0.08235294, 1,
2.438568, -1.272898, 3.809201, 1, 0, 0.07843138, 1,
2.466188, 0.6821835, 0.4265795, 1, 0, 0.07058824, 1,
2.476492, -1.127973, 0.4843469, 1, 0, 0.06666667, 1,
2.521873, -0.4806236, 1.67127, 1, 0, 0.05882353, 1,
2.533015, -0.4115848, 1.466993, 1, 0, 0.05490196, 1,
2.58132, -0.3732694, 2.224472, 1, 0, 0.04705882, 1,
2.649259, -0.21504, 1.116807, 1, 0, 0.04313726, 1,
2.680669, 0.2781015, 2.936497, 1, 0, 0.03529412, 1,
2.68851, 1.148918, 1.639762, 1, 0, 0.03137255, 1,
2.696115, -0.03663874, 0.6429521, 1, 0, 0.02352941, 1,
2.79639, -1.122501, 3.351481, 1, 0, 0.01960784, 1,
2.837731, -1.14256, 2.936915, 1, 0, 0.01176471, 1,
2.985589, -1.736104, 0.6164858, 1, 0, 0.007843138, 1
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
-0.1643983, -4.123706, -7.783103, 0, -0.5, 0.5, 0.5,
-0.1643983, -4.123706, -7.783103, 1, -0.5, 0.5, 0.5,
-0.1643983, -4.123706, -7.783103, 1, 1.5, 0.5, 0.5,
-0.1643983, -4.123706, -7.783103, 0, 1.5, 0.5, 0.5
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
-4.382231, 0.2469101, -7.783103, 0, -0.5, 0.5, 0.5,
-4.382231, 0.2469101, -7.783103, 1, -0.5, 0.5, 0.5,
-4.382231, 0.2469101, -7.783103, 1, 1.5, 0.5, 0.5,
-4.382231, 0.2469101, -7.783103, 0, 1.5, 0.5, 0.5
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
-4.382231, -4.123706, -0.3256207, 0, -0.5, 0.5, 0.5,
-4.382231, -4.123706, -0.3256207, 1, -0.5, 0.5, 0.5,
-4.382231, -4.123706, -0.3256207, 1, 1.5, 0.5, 0.5,
-4.382231, -4.123706, -0.3256207, 0, 1.5, 0.5, 0.5
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
-3, -3.115102, -6.062145,
2, -3.115102, -6.062145,
-3, -3.115102, -6.062145,
-3, -3.283203, -6.348971,
-2, -3.115102, -6.062145,
-2, -3.283203, -6.348971,
-1, -3.115102, -6.062145,
-1, -3.283203, -6.348971,
0, -3.115102, -6.062145,
0, -3.283203, -6.348971,
1, -3.115102, -6.062145,
1, -3.283203, -6.348971,
2, -3.115102, -6.062145,
2, -3.283203, -6.348971
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
-3, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
-3, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
-3, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
-3, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5,
-2, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
-2, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
-2, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
-2, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5,
-1, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
-1, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
-1, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
-1, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5,
0, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
0, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
0, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
0, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5,
1, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
1, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
1, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
1, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5,
2, -3.619404, -6.922624, 0, -0.5, 0.5, 0.5,
2, -3.619404, -6.922624, 1, -0.5, 0.5, 0.5,
2, -3.619404, -6.922624, 1, 1.5, 0.5, 0.5,
2, -3.619404, -6.922624, 0, 1.5, 0.5, 0.5
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
-3.408885, -3, -6.062145,
-3.408885, 3, -6.062145,
-3.408885, -3, -6.062145,
-3.571109, -3, -6.348971,
-3.408885, -2, -6.062145,
-3.571109, -2, -6.348971,
-3.408885, -1, -6.062145,
-3.571109, -1, -6.348971,
-3.408885, 0, -6.062145,
-3.571109, 0, -6.348971,
-3.408885, 1, -6.062145,
-3.571109, 1, -6.348971,
-3.408885, 2, -6.062145,
-3.571109, 2, -6.348971,
-3.408885, 3, -6.062145,
-3.571109, 3, -6.348971
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
-3.895558, -3, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, -3, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, -3, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, -3, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, -2, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, -2, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, -2, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, -2, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, -1, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, -1, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, -1, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, -1, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, 0, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, 0, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, 0, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, 0, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, 1, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, 1, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, 1, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, 1, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, 2, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, 2, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, 2, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, 2, -6.922624, 0, 1.5, 0.5, 0.5,
-3.895558, 3, -6.922624, 0, -0.5, 0.5, 0.5,
-3.895558, 3, -6.922624, 1, -0.5, 0.5, 0.5,
-3.895558, 3, -6.922624, 1, 1.5, 0.5, 0.5,
-3.895558, 3, -6.922624, 0, 1.5, 0.5, 0.5
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
-3.408885, -3.115102, -4,
-3.408885, -3.115102, 4,
-3.408885, -3.115102, -4,
-3.571109, -3.283203, -4,
-3.408885, -3.115102, -2,
-3.571109, -3.283203, -2,
-3.408885, -3.115102, 0,
-3.571109, -3.283203, 0,
-3.408885, -3.115102, 2,
-3.571109, -3.283203, 2,
-3.408885, -3.115102, 4,
-3.571109, -3.283203, 4
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
-3.895558, -3.619404, -4, 0, -0.5, 0.5, 0.5,
-3.895558, -3.619404, -4, 1, -0.5, 0.5, 0.5,
-3.895558, -3.619404, -4, 1, 1.5, 0.5, 0.5,
-3.895558, -3.619404, -4, 0, 1.5, 0.5, 0.5,
-3.895558, -3.619404, -2, 0, -0.5, 0.5, 0.5,
-3.895558, -3.619404, -2, 1, -0.5, 0.5, 0.5,
-3.895558, -3.619404, -2, 1, 1.5, 0.5, 0.5,
-3.895558, -3.619404, -2, 0, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 0, 0, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 0, 1, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 0, 1, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 0, 0, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 2, 0, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 2, 1, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 2, 1, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 2, 0, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 4, 0, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 4, 1, -0.5, 0.5, 0.5,
-3.895558, -3.619404, 4, 1, 1.5, 0.5, 0.5,
-3.895558, -3.619404, 4, 0, 1.5, 0.5, 0.5
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
-3.408885, -3.115102, -6.062145,
-3.408885, 3.608922, -6.062145,
-3.408885, -3.115102, 5.410904,
-3.408885, 3.608922, 5.410904,
-3.408885, -3.115102, -6.062145,
-3.408885, -3.115102, 5.410904,
-3.408885, 3.608922, -6.062145,
-3.408885, 3.608922, 5.410904,
-3.408885, -3.115102, -6.062145,
3.080088, -3.115102, -6.062145,
-3.408885, -3.115102, 5.410904,
3.080088, -3.115102, 5.410904,
-3.408885, 3.608922, -6.062145,
3.080088, 3.608922, -6.062145,
-3.408885, 3.608922, 5.410904,
3.080088, 3.608922, 5.410904,
3.080088, -3.115102, -6.062145,
3.080088, 3.608922, -6.062145,
3.080088, -3.115102, 5.410904,
3.080088, 3.608922, 5.410904,
3.080088, -3.115102, -6.062145,
3.080088, -3.115102, 5.410904,
3.080088, 3.608922, -6.062145,
3.080088, 3.608922, 5.410904
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
var radius = 7.901291;
var distance = 35.15374;
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
mvMatrix.translate( 0.1643983, -0.2469101, 0.3256207 );
mvMatrix.scale( 1.316546, 1.270523, 0.7446173 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.15374);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
2-butoxy-1-methyleth<-read.table("2-butoxy-1-methyleth.xyz")
```

```
## Error in read.table("2-butoxy-1-methyleth.xyz"): no lines available in input
```

```r
x<-2-butoxy-1-methyleth$V2
```

```
## Error in eval(expr, envir, enclos): object 'butoxy' not found
```

```r
y<-2-butoxy-1-methyleth$V3
```

```
## Error in eval(expr, envir, enclos): object 'butoxy' not found
```

```r
z<-2-butoxy-1-methyleth$V4
```

```
## Error in eval(expr, envir, enclos): object 'butoxy' not found
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
-3.314385, -0.01880758, -1.226016, 0, 0, 1, 1, 1,
-3.220792, -0.4055465, -1.47794, 1, 0, 0, 1, 1,
-3.119651, -0.8263667, -3.180586, 1, 0, 0, 1, 1,
-3.039161, -0.5356289, -1.018968, 1, 0, 0, 1, 1,
-2.909197, 0.6468642, -3.685635, 1, 0, 0, 1, 1,
-2.893506, 1.023736, 0.0208953, 1, 0, 0, 1, 1,
-2.738156, 2.058635, -0.1517608, 0, 0, 0, 1, 1,
-2.737896, 0.3063308, -4.124909, 0, 0, 0, 1, 1,
-2.614338, 1.095697, -0.1586912, 0, 0, 0, 1, 1,
-2.497093, -1.486019, -1.731869, 0, 0, 0, 1, 1,
-2.395205, -0.1339999, -2.752141, 0, 0, 0, 1, 1,
-2.358908, -0.7226642, -1.006505, 0, 0, 0, 1, 1,
-2.247686, 0.3985681, -2.724727, 0, 0, 0, 1, 1,
-2.209016, 0.6366838, -1.923547, 1, 1, 1, 1, 1,
-2.178896, -1.104757, -3.348292, 1, 1, 1, 1, 1,
-2.158792, 0.26178, -2.77828, 1, 1, 1, 1, 1,
-2.13439, 1.39243, -0.4510723, 1, 1, 1, 1, 1,
-2.133415, 3.511, -1.065966, 1, 1, 1, 1, 1,
-2.12485, 0.0758276, 0.9022956, 1, 1, 1, 1, 1,
-2.108951, -1.854604, -2.469337, 1, 1, 1, 1, 1,
-2.075854, 0.1916336, -1.003923, 1, 1, 1, 1, 1,
-2.04996, 0.003640899, -0.6690836, 1, 1, 1, 1, 1,
-2.045823, 1.193802, -0.9036445, 1, 1, 1, 1, 1,
-2.041296, 0.7337712, -1.392658, 1, 1, 1, 1, 1,
-2.015129, -0.05005631, -0.8953952, 1, 1, 1, 1, 1,
-2.010873, -1.058866, -3.069027, 1, 1, 1, 1, 1,
-1.924871, 0.04251242, -2.183891, 1, 1, 1, 1, 1,
-1.894324, 0.8335463, -1.452226, 1, 1, 1, 1, 1,
-1.861068, -0.03704094, -3.374589, 0, 0, 1, 1, 1,
-1.849774, -1.176085, -2.714978, 1, 0, 0, 1, 1,
-1.846792, -0.2675671, -1.903873, 1, 0, 0, 1, 1,
-1.842205, -1.407353, -1.42645, 1, 0, 0, 1, 1,
-1.841231, 0.8617516, -0.4624026, 1, 0, 0, 1, 1,
-1.83156, -1.359184, -0.9857164, 1, 0, 0, 1, 1,
-1.817899, -0.3399465, -3.183772, 0, 0, 0, 1, 1,
-1.804705, -1.180744, -3.25977, 0, 0, 0, 1, 1,
-1.7976, 0.3904849, -0.3828263, 0, 0, 0, 1, 1,
-1.790749, -0.4596009, -2.223565, 0, 0, 0, 1, 1,
-1.784827, 0.0774426, -3.087399, 0, 0, 0, 1, 1,
-1.782838, -0.3893285, -0.7483124, 0, 0, 0, 1, 1,
-1.760811, 0.5493966, -0.246242, 0, 0, 0, 1, 1,
-1.750432, -0.2523183, -1.089736, 1, 1, 1, 1, 1,
-1.740881, 0.03108417, -2.970177, 1, 1, 1, 1, 1,
-1.736919, -0.2024441, -1.80471, 1, 1, 1, 1, 1,
-1.729962, -0.9278105, -0.7185478, 1, 1, 1, 1, 1,
-1.728466, -1.197294, -1.462831, 1, 1, 1, 1, 1,
-1.713606, -0.3119921, -1.054879, 1, 1, 1, 1, 1,
-1.710465, -0.1274478, -1.714503, 1, 1, 1, 1, 1,
-1.702479, -1.208118, -0.9663851, 1, 1, 1, 1, 1,
-1.697771, 0.05528846, -2.77848, 1, 1, 1, 1, 1,
-1.689034, -0.01224829, -1.797557, 1, 1, 1, 1, 1,
-1.686678, -0.04026903, -1.501751, 1, 1, 1, 1, 1,
-1.684062, 0.1654143, -2.704174, 1, 1, 1, 1, 1,
-1.675852, 0.00103179, -2.378076, 1, 1, 1, 1, 1,
-1.667858, 0.5702156, 0.06749475, 1, 1, 1, 1, 1,
-1.666596, -0.7983872, -1.546727, 1, 1, 1, 1, 1,
-1.665506, -0.2470239, -4.095398, 0, 0, 1, 1, 1,
-1.664729, 0.3577107, -2.367285, 1, 0, 0, 1, 1,
-1.655948, -0.02896412, -1.329962, 1, 0, 0, 1, 1,
-1.602784, -1.06386, -2.265821, 1, 0, 0, 1, 1,
-1.582285, -0.5339911, -1.822222, 1, 0, 0, 1, 1,
-1.579788, -1.012377, -2.567379, 1, 0, 0, 1, 1,
-1.566254, 0.4404298, -2.007936, 0, 0, 0, 1, 1,
-1.565584, -1.079399, -0.7189455, 0, 0, 0, 1, 1,
-1.544921, -2.444371, -0.3201812, 0, 0, 0, 1, 1,
-1.540657, 1.444071, 0.220704, 0, 0, 0, 1, 1,
-1.509293, -1.91761, -2.970492, 0, 0, 0, 1, 1,
-1.490682, -1.178607, -1.771876, 0, 0, 0, 1, 1,
-1.475096, 1.016691, -1.357907, 0, 0, 0, 1, 1,
-1.473993, -0.9109346, -2.421913, 1, 1, 1, 1, 1,
-1.460584, -0.4833115, -2.02375, 1, 1, 1, 1, 1,
-1.457456, 1.449185, 0.2256134, 1, 1, 1, 1, 1,
-1.450101, -0.5295843, -1.298244, 1, 1, 1, 1, 1,
-1.423824, -0.9132826, -2.739843, 1, 1, 1, 1, 1,
-1.421854, 0.771198, 0.03630386, 1, 1, 1, 1, 1,
-1.414642, 0.2927363, -2.834757, 1, 1, 1, 1, 1,
-1.414308, 2.162307, -0.2596032, 1, 1, 1, 1, 1,
-1.409331, -1.240286, -2.793317, 1, 1, 1, 1, 1,
-1.404595, -0.9709536, -1.078867, 1, 1, 1, 1, 1,
-1.391762, 1.360606, 0.06232176, 1, 1, 1, 1, 1,
-1.387837, 0.6520408, -1.428078, 1, 1, 1, 1, 1,
-1.383826, 0.2533083, -1.520029, 1, 1, 1, 1, 1,
-1.372302, 1.203482, 0.9161059, 1, 1, 1, 1, 1,
-1.369595, 0.8218201, -2.07033, 1, 1, 1, 1, 1,
-1.367182, 0.2736088, -1.831745, 0, 0, 1, 1, 1,
-1.365007, 0.4585139, -1.897254, 1, 0, 0, 1, 1,
-1.352773, -1.447727, -1.846154, 1, 0, 0, 1, 1,
-1.352733, -0.06725007, -2.006114, 1, 0, 0, 1, 1,
-1.35125, -1.020393, -3.189869, 1, 0, 0, 1, 1,
-1.34868, 1.428543, -1.251427, 1, 0, 0, 1, 1,
-1.344816, -0.2811005, -1.931395, 0, 0, 0, 1, 1,
-1.343705, -1.339648, -2.079754, 0, 0, 0, 1, 1,
-1.343292, 0.4909141, -1.109821, 0, 0, 0, 1, 1,
-1.342099, -0.6405492, -1.269219, 0, 0, 0, 1, 1,
-1.339834, -0.3473807, -2.883206, 0, 0, 0, 1, 1,
-1.332006, -0.4931413, -2.04063, 0, 0, 0, 1, 1,
-1.326186, 0.6103116, 0.4542489, 0, 0, 0, 1, 1,
-1.325175, 1.129906, -0.07477764, 1, 1, 1, 1, 1,
-1.315457, -1.539857, -3.399291, 1, 1, 1, 1, 1,
-1.31441, -0.7325319, -1.513007, 1, 1, 1, 1, 1,
-1.313987, -1.348482, -2.049057, 1, 1, 1, 1, 1,
-1.309712, 0.3922919, 0.2623543, 1, 1, 1, 1, 1,
-1.305595, -0.1991482, 0.06992593, 1, 1, 1, 1, 1,
-1.301787, 2.270827, -0.1785008, 1, 1, 1, 1, 1,
-1.301072, -0.5453078, -0.9392345, 1, 1, 1, 1, 1,
-1.295418, 0.6562353, -0.7840202, 1, 1, 1, 1, 1,
-1.294533, -2.476125, -3.148322, 1, 1, 1, 1, 1,
-1.287955, -0.003091126, -1.903008, 1, 1, 1, 1, 1,
-1.285109, 0.1220307, -1.927161, 1, 1, 1, 1, 1,
-1.284285, -0.7525679, -0.9617293, 1, 1, 1, 1, 1,
-1.284073, 1.25222, -1.859232, 1, 1, 1, 1, 1,
-1.277463, -1.4765, -3.369635, 1, 1, 1, 1, 1,
-1.273299, -1.058814, -1.608233, 0, 0, 1, 1, 1,
-1.264904, -0.8779086, -2.724431, 1, 0, 0, 1, 1,
-1.25732, 2.052588, -0.3822982, 1, 0, 0, 1, 1,
-1.254581, 0.8689183, -1.060948, 1, 0, 0, 1, 1,
-1.249038, -0.7632141, -3.391298, 1, 0, 0, 1, 1,
-1.24406, -0.4385787, -1.979944, 1, 0, 0, 1, 1,
-1.22505, -0.4558742, -1.297302, 0, 0, 0, 1, 1,
-1.220882, -0.1187332, -2.249809, 0, 0, 0, 1, 1,
-1.219368, 0.6931022, -0.923417, 0, 0, 0, 1, 1,
-1.215739, -0.5273417, -0.357945, 0, 0, 0, 1, 1,
-1.203873, -1.685827, -3.006676, 0, 0, 0, 1, 1,
-1.202096, -0.5079736, -3.246888, 0, 0, 0, 1, 1,
-1.195834, 1.123483, 0.2313889, 0, 0, 0, 1, 1,
-1.188586, -0.691227, -1.749639, 1, 1, 1, 1, 1,
-1.188584, -0.3945128, -2.105292, 1, 1, 1, 1, 1,
-1.187442, -1.021699, -2.969457, 1, 1, 1, 1, 1,
-1.185649, -0.3102771, -0.6657111, 1, 1, 1, 1, 1,
-1.180692, 0.02739847, 0.4239606, 1, 1, 1, 1, 1,
-1.178886, 1.706778, 0.03824209, 1, 1, 1, 1, 1,
-1.175778, -0.2530552, -2.900824, 1, 1, 1, 1, 1,
-1.171995, 0.4949578, -1.065818, 1, 1, 1, 1, 1,
-1.169268, -1.514066, -0.6921211, 1, 1, 1, 1, 1,
-1.152305, 0.4047115, -1.823633, 1, 1, 1, 1, 1,
-1.131079, -0.557386, -3.05295, 1, 1, 1, 1, 1,
-1.12878, -2.070097, -3.553554, 1, 1, 1, 1, 1,
-1.124933, 0.7731362, -0.0849335, 1, 1, 1, 1, 1,
-1.11378, -0.322819, -0.8243834, 1, 1, 1, 1, 1,
-1.112047, 0.6063238, -1.773797, 1, 1, 1, 1, 1,
-1.109058, -0.4326318, -1.112647, 0, 0, 1, 1, 1,
-1.105855, -1.747478, -1.901146, 1, 0, 0, 1, 1,
-1.105559, 1.88301, -0.1954177, 1, 0, 0, 1, 1,
-1.097942, 1.073854, -0.9692478, 1, 0, 0, 1, 1,
-1.090022, -0.9046524, -1.944141, 1, 0, 0, 1, 1,
-1.087896, 0.8994791, -1.46267, 1, 0, 0, 1, 1,
-1.082159, -1.3198, -3.028306, 0, 0, 0, 1, 1,
-1.066965, 0.1418848, -0.8854657, 0, 0, 0, 1, 1,
-1.066407, 0.06557402, -2.141724, 0, 0, 0, 1, 1,
-1.065854, 1.758199, -1.260632, 0, 0, 0, 1, 1,
-1.065469, -1.253433, -1.038738, 0, 0, 0, 1, 1,
-1.058794, 0.1057848, -1.62077, 0, 0, 0, 1, 1,
-1.058529, 0.2347612, -1.515707, 0, 0, 0, 1, 1,
-1.055345, -0.2392701, -1.578236, 1, 1, 1, 1, 1,
-1.055199, -0.818287, -0.5033056, 1, 1, 1, 1, 1,
-1.052964, 0.2683303, 0.1478707, 1, 1, 1, 1, 1,
-1.042759, 0.006240687, -2.410599, 1, 1, 1, 1, 1,
-1.036191, -0.1369677, -3.021546, 1, 1, 1, 1, 1,
-1.034531, -1.174854, -2.5811, 1, 1, 1, 1, 1,
-1.029278, 1.031749, -1.600029, 1, 1, 1, 1, 1,
-1.015665, -0.4853577, -3.984112, 1, 1, 1, 1, 1,
-1.014711, -0.9997069, -3.687271, 1, 1, 1, 1, 1,
-1.013031, -0.6966761, -2.301627, 1, 1, 1, 1, 1,
-1.012526, 0.6832833, -0.203252, 1, 1, 1, 1, 1,
-1.008452, -0.08969145, -1.639076, 1, 1, 1, 1, 1,
-1.008041, 0.3247078, -1.534672, 1, 1, 1, 1, 1,
-1.006249, -0.8663493, -2.147948, 1, 1, 1, 1, 1,
-1.003191, 0.3589374, -1.01683, 1, 1, 1, 1, 1,
-1.001132, 0.5379, -1.257667, 0, 0, 1, 1, 1,
-0.9958385, -1.125997, -2.215459, 1, 0, 0, 1, 1,
-0.9954752, -0.1823296, -1.748464, 1, 0, 0, 1, 1,
-0.9908121, 0.7192324, -0.74249, 1, 0, 0, 1, 1,
-0.9852165, 0.743414, 0.8314657, 1, 0, 0, 1, 1,
-0.9798711, 1.37501, -0.327363, 1, 0, 0, 1, 1,
-0.9747713, -1.009055, -1.938237, 0, 0, 0, 1, 1,
-0.9701324, -1.815561, -1.433005, 0, 0, 0, 1, 1,
-0.96674, 0.2348266, -0.8636593, 0, 0, 0, 1, 1,
-0.9589739, -1.483353, -2.180315, 0, 0, 0, 1, 1,
-0.9587286, 0.03781913, -2.436357, 0, 0, 0, 1, 1,
-0.9564753, 0.9787691, 1.173422, 0, 0, 0, 1, 1,
-0.9487066, 1.078105, -1.744399, 0, 0, 0, 1, 1,
-0.945084, -0.1373719, -1.397591, 1, 1, 1, 1, 1,
-0.9401271, -2.009626, -1.781957, 1, 1, 1, 1, 1,
-0.9387453, -0.3286107, -1.676873, 1, 1, 1, 1, 1,
-0.936453, 0.4227058, -0.6131247, 1, 1, 1, 1, 1,
-0.9357323, -0.489667, -1.398696, 1, 1, 1, 1, 1,
-0.9259023, -0.3622709, -3.109702, 1, 1, 1, 1, 1,
-0.9255331, -0.01192486, -2.343978, 1, 1, 1, 1, 1,
-0.9251254, 1.014737, -1.0738, 1, 1, 1, 1, 1,
-0.9180055, 0.3418332, -1.992522, 1, 1, 1, 1, 1,
-0.9171024, -1.191291, -2.178523, 1, 1, 1, 1, 1,
-0.9090608, -0.7044849, -3.375239, 1, 1, 1, 1, 1,
-0.9060703, 0.9603099, -2.848251, 1, 1, 1, 1, 1,
-0.8997731, 0.3106516, -0.7814462, 1, 1, 1, 1, 1,
-0.8909, -0.6983422, -1.619676, 1, 1, 1, 1, 1,
-0.8779513, 0.6594128, 0.09879632, 1, 1, 1, 1, 1,
-0.8771056, -0.4265768, -1.0269, 0, 0, 1, 1, 1,
-0.8764925, -0.8571064, -2.273954, 1, 0, 0, 1, 1,
-0.8748371, 0.809078, 0.1537714, 1, 0, 0, 1, 1,
-0.8675196, 0.3214012, -0.8943322, 1, 0, 0, 1, 1,
-0.8587361, 0.5709484, -3.015123, 1, 0, 0, 1, 1,
-0.8526219, -0.4002504, -1.816846, 1, 0, 0, 1, 1,
-0.8494228, 0.7179451, 0.7897854, 0, 0, 0, 1, 1,
-0.846514, 0.6604828, -1.503286, 0, 0, 0, 1, 1,
-0.8464115, -0.8217996, -3.714903, 0, 0, 0, 1, 1,
-0.8462201, -0.4088881, -1.385597, 0, 0, 0, 1, 1,
-0.844431, -1.157525, -0.9510182, 0, 0, 0, 1, 1,
-0.8385548, -0.6180662, -2.903375, 0, 0, 0, 1, 1,
-0.8365519, 1.666819, -0.09181808, 0, 0, 0, 1, 1,
-0.8353409, -0.8517696, -1.918617, 1, 1, 1, 1, 1,
-0.8305519, -0.2881986, -0.3022951, 1, 1, 1, 1, 1,
-0.8174112, -1.311339, -2.7761, 1, 1, 1, 1, 1,
-0.8122233, -1.021091, -2.671104, 1, 1, 1, 1, 1,
-0.8107361, 1.012755, -1.68911, 1, 1, 1, 1, 1,
-0.7981188, -0.1862052, -0.7160682, 1, 1, 1, 1, 1,
-0.7969775, 0.7066017, -1.480261, 1, 1, 1, 1, 1,
-0.7905388, -2.080068, -3.875373, 1, 1, 1, 1, 1,
-0.7879398, 1.716114, 0.0105775, 1, 1, 1, 1, 1,
-0.7872523, -0.161079, -1.019195, 1, 1, 1, 1, 1,
-0.7803599, -3.017179, -1.740813, 1, 1, 1, 1, 1,
-0.7759953, -0.4057752, -3.183626, 1, 1, 1, 1, 1,
-0.7732192, 0.8460979, -0.2434253, 1, 1, 1, 1, 1,
-0.7714676, -0.166216, -2.353712, 1, 1, 1, 1, 1,
-0.7652287, 1.168429, -0.371194, 1, 1, 1, 1, 1,
-0.7643429, -0.03187571, -1.61536, 0, 0, 1, 1, 1,
-0.7558708, -0.1157349, -2.467507, 1, 0, 0, 1, 1,
-0.7553962, -0.2985319, -1.036727, 1, 0, 0, 1, 1,
-0.7451987, 0.07446773, -1.219781, 1, 0, 0, 1, 1,
-0.7418936, 0.1714231, -0.9772875, 1, 0, 0, 1, 1,
-0.7388909, 1.509119, -1.001859, 1, 0, 0, 1, 1,
-0.7376311, -0.9458501, -3.446684, 0, 0, 0, 1, 1,
-0.7348377, 0.5954595, -1.8542, 0, 0, 0, 1, 1,
-0.732756, -0.4266675, -2.883973, 0, 0, 0, 1, 1,
-0.7278946, -0.5364609, -2.310549, 0, 0, 0, 1, 1,
-0.72721, 0.4503612, -1.537083, 0, 0, 0, 1, 1,
-0.7260778, -0.714956, -2.878862, 0, 0, 0, 1, 1,
-0.725973, -0.5240216, -2.204408, 0, 0, 0, 1, 1,
-0.7233375, -0.0271235, -1.605574, 1, 1, 1, 1, 1,
-0.7228221, 0.4884666, -2.128463, 1, 1, 1, 1, 1,
-0.7186293, -0.8974947, -1.079693, 1, 1, 1, 1, 1,
-0.7145928, -0.1890736, -1.833948, 1, 1, 1, 1, 1,
-0.7107921, 0.5881391, -2.32211, 1, 1, 1, 1, 1,
-0.7046641, -0.3851456, -3.017571, 1, 1, 1, 1, 1,
-0.7020676, 0.3452835, 0.02971345, 1, 1, 1, 1, 1,
-0.6942338, -2.272813, -2.701137, 1, 1, 1, 1, 1,
-0.6902559, -1.317218, -4.521883, 1, 1, 1, 1, 1,
-0.6874472, -0.255171, -1.85279, 1, 1, 1, 1, 1,
-0.6802317, -0.2764217, -0.994752, 1, 1, 1, 1, 1,
-0.6758952, 1.537559, 0.7351223, 1, 1, 1, 1, 1,
-0.6682092, -0.1076195, -1.811978, 1, 1, 1, 1, 1,
-0.667304, -0.5288188, -1.41356, 1, 1, 1, 1, 1,
-0.6627514, -0.3860718, -0.6300953, 1, 1, 1, 1, 1,
-0.662038, 0.6462963, -0.5303395, 0, 0, 1, 1, 1,
-0.6571801, 0.0597068, 0.3344862, 1, 0, 0, 1, 1,
-0.6564854, 0.9521296, -1.359178, 1, 0, 0, 1, 1,
-0.6540139, 1.835729, -0.08629963, 1, 0, 0, 1, 1,
-0.6500909, -1.513419, -2.773919, 1, 0, 0, 1, 1,
-0.6497256, -2.185981, -2.976378, 1, 0, 0, 1, 1,
-0.6493182, 0.6879868, -2.742757, 0, 0, 0, 1, 1,
-0.6476433, 1.322642, 0.643195, 0, 0, 0, 1, 1,
-0.6471106, 0.8873652, -1.583653, 0, 0, 0, 1, 1,
-0.6461363, -0.8400452, -2.330273, 0, 0, 0, 1, 1,
-0.6399255, -0.02775992, -3.380347, 0, 0, 0, 1, 1,
-0.6388359, 0.512055, 0.5293108, 0, 0, 0, 1, 1,
-0.6374216, 0.4729331, -1.336219, 0, 0, 0, 1, 1,
-0.6262346, -0.1723427, -0.3221694, 1, 1, 1, 1, 1,
-0.6241161, -0.4991498, -2.764322, 1, 1, 1, 1, 1,
-0.623962, -1.208493, -1.438076, 1, 1, 1, 1, 1,
-0.6185908, 0.8365513, -0.2592662, 1, 1, 1, 1, 1,
-0.6161339, 0.8162823, 1.374016, 1, 1, 1, 1, 1,
-0.6152609, -1.459959, -3.065952, 1, 1, 1, 1, 1,
-0.6147829, -1.80384, -4.446508, 1, 1, 1, 1, 1,
-0.6080578, 1.494056, -2.199395, 1, 1, 1, 1, 1,
-0.6064434, 0.2974295, -2.4425, 1, 1, 1, 1, 1,
-0.6023872, 0.7785659, 0.4560909, 1, 1, 1, 1, 1,
-0.6014979, 0.2500189, 0.1555936, 1, 1, 1, 1, 1,
-0.6004133, -0.6403668, -0.8721999, 1, 1, 1, 1, 1,
-0.5977222, 0.5541154, -0.8237344, 1, 1, 1, 1, 1,
-0.5914057, 0.6689677, 0.02330679, 1, 1, 1, 1, 1,
-0.5782052, -1.217711, -1.596382, 1, 1, 1, 1, 1,
-0.5743391, 0.7636206, 0.06217252, 0, 0, 1, 1, 1,
-0.5735577, 0.9705891, 0.05440738, 1, 0, 0, 1, 1,
-0.568628, 0.4780568, -0.4775962, 1, 0, 0, 1, 1,
-0.5635147, -0.7908455, -4.343582, 1, 0, 0, 1, 1,
-0.5634181, -1.228983, -2.687458, 1, 0, 0, 1, 1,
-0.5587407, -1.202002, -4.099072, 1, 0, 0, 1, 1,
-0.5557154, -1.644214, -2.879713, 0, 0, 0, 1, 1,
-0.5552312, 0.6854136, -1.260025, 0, 0, 0, 1, 1,
-0.5551978, -0.1842763, -2.265654, 0, 0, 0, 1, 1,
-0.5530975, 1.636387, -0.6514183, 0, 0, 0, 1, 1,
-0.5527538, 0.8943055, 0.4350892, 0, 0, 0, 1, 1,
-0.5517999, -1.022448, -3.454189, 0, 0, 0, 1, 1,
-0.5497811, -0.2525555, -0.3494567, 0, 0, 0, 1, 1,
-0.5493137, -1.492983, -0.8804647, 1, 1, 1, 1, 1,
-0.5491084, -0.5912562, -1.114071, 1, 1, 1, 1, 1,
-0.5487377, 0.03223818, -1.630881, 1, 1, 1, 1, 1,
-0.5461307, 1.15471, -0.8070734, 1, 1, 1, 1, 1,
-0.5264569, -0.05103029, -2.789111, 1, 1, 1, 1, 1,
-0.5243531, 0.4985132, -1.348495, 1, 1, 1, 1, 1,
-0.5200395, -0.114447, 0.06654243, 1, 1, 1, 1, 1,
-0.5150576, 0.4353842, 1.62929, 1, 1, 1, 1, 1,
-0.5140933, 0.7171808, -0.3204734, 1, 1, 1, 1, 1,
-0.5075038, 1.122144, -0.9340429, 1, 1, 1, 1, 1,
-0.5070812, 1.35037, -0.5724553, 1, 1, 1, 1, 1,
-0.506865, -1.454279, -1.457569, 1, 1, 1, 1, 1,
-0.5047758, 0.4084908, -0.1548331, 1, 1, 1, 1, 1,
-0.4990686, 0.4111266, -1.194163, 1, 1, 1, 1, 1,
-0.4987708, -0.7089533, -2.032484, 1, 1, 1, 1, 1,
-0.4984398, 1.749959, -1.675748, 0, 0, 1, 1, 1,
-0.493788, -0.1171641, -1.837303, 1, 0, 0, 1, 1,
-0.4822648, -0.008997278, -2.37465, 1, 0, 0, 1, 1,
-0.4811657, 0.3332268, -1.563806, 1, 0, 0, 1, 1,
-0.4793411, -0.552577, -1.221017, 1, 0, 0, 1, 1,
-0.4784001, 0.5015041, -0.9545884, 1, 0, 0, 1, 1,
-0.4768423, 0.4192125, -2.280303, 0, 0, 0, 1, 1,
-0.4753346, 1.181934, 1.90274, 0, 0, 0, 1, 1,
-0.4714476, -0.5091994, -1.697163, 0, 0, 0, 1, 1,
-0.4700693, 0.4718344, 0.5695993, 0, 0, 0, 1, 1,
-0.4654343, -0.1750046, -1.323063, 0, 0, 0, 1, 1,
-0.463564, -0.5545782, -2.190788, 0, 0, 0, 1, 1,
-0.4532454, -0.7639783, -2.806561, 0, 0, 0, 1, 1,
-0.4517903, 0.8599679, -0.7027788, 1, 1, 1, 1, 1,
-0.4502996, 0.7163768, -0.3601028, 1, 1, 1, 1, 1,
-0.4483849, 3.152452, 1.164837, 1, 1, 1, 1, 1,
-0.448263, -2.653752, -2.481501, 1, 1, 1, 1, 1,
-0.4457363, -0.3088094, -1.131693, 1, 1, 1, 1, 1,
-0.4447343, 1.186057, -0.6443039, 1, 1, 1, 1, 1,
-0.4446449, 0.5348026, -0.9358697, 1, 1, 1, 1, 1,
-0.4400009, -0.3620411, -2.568621, 1, 1, 1, 1, 1,
-0.4398456, 0.3084744, -2.195923, 1, 1, 1, 1, 1,
-0.4371839, 0.9189041, 0.3843317, 1, 1, 1, 1, 1,
-0.4365028, 0.4811559, -1.604635, 1, 1, 1, 1, 1,
-0.4364283, 1.368229, 0.3350776, 1, 1, 1, 1, 1,
-0.4358393, 1.19755, -1.528576, 1, 1, 1, 1, 1,
-0.4349406, 1.698156, -0.568063, 1, 1, 1, 1, 1,
-0.4336078, -0.2438526, -1.652669, 1, 1, 1, 1, 1,
-0.4331331, 0.1758916, 0.0624912, 0, 0, 1, 1, 1,
-0.42689, 0.9691676, -0.3033839, 1, 0, 0, 1, 1,
-0.4242154, 0.1699315, -0.6030567, 1, 0, 0, 1, 1,
-0.4209897, -0.2171493, -2.355316, 1, 0, 0, 1, 1,
-0.4203229, 1.371178, -0.2137867, 1, 0, 0, 1, 1,
-0.4181999, -0.3908045, -3.667701, 1, 0, 0, 1, 1,
-0.4163193, 0.1119002, -1.301864, 0, 0, 0, 1, 1,
-0.4141122, 1.748738, -2.050445, 0, 0, 0, 1, 1,
-0.4077328, -1.467078, -2.865565, 0, 0, 0, 1, 1,
-0.407223, -2.080689, -2.564738, 0, 0, 0, 1, 1,
-0.4048373, 1.655236, -2.019585, 0, 0, 0, 1, 1,
-0.4030964, -1.80019, -2.573665, 0, 0, 0, 1, 1,
-0.3965003, -0.6526166, -3.110117, 0, 0, 0, 1, 1,
-0.3938618, -0.9659864, -2.293282, 1, 1, 1, 1, 1,
-0.3930422, -0.1769409, -2.500544, 1, 1, 1, 1, 1,
-0.3831913, 1.272742, 2.270997, 1, 1, 1, 1, 1,
-0.3816609, -0.07854764, -3.616182, 1, 1, 1, 1, 1,
-0.3772372, -1.537855, -2.872001, 1, 1, 1, 1, 1,
-0.376653, 1.001618, -1.206707, 1, 1, 1, 1, 1,
-0.3728375, 0.9712967, 0.5922543, 1, 1, 1, 1, 1,
-0.372774, 0.4500751, -0.5082555, 1, 1, 1, 1, 1,
-0.3718302, 3.262005, -0.2218034, 1, 1, 1, 1, 1,
-0.3700166, 0.1807885, -2.004629, 1, 1, 1, 1, 1,
-0.3693004, 0.4660295, -1.271028, 1, 1, 1, 1, 1,
-0.3672036, -1.173467, -4.069334, 1, 1, 1, 1, 1,
-0.3662133, 0.2825751, 0.2201023, 1, 1, 1, 1, 1,
-0.3604506, -0.3345976, 0.4967903, 1, 1, 1, 1, 1,
-0.3594514, 0.2061926, -1.734661, 1, 1, 1, 1, 1,
-0.3582464, 0.9693894, -1.730732, 0, 0, 1, 1, 1,
-0.3561529, 0.6839806, 0.1748248, 1, 0, 0, 1, 1,
-0.3559404, -0.4331932, -5.895062, 1, 0, 0, 1, 1,
-0.3533674, 1.129707, 0.1264553, 1, 0, 0, 1, 1,
-0.3519662, -0.8117825, -1.859142, 1, 0, 0, 1, 1,
-0.3497939, -1.811943, -3.322091, 1, 0, 0, 1, 1,
-0.3443744, -0.9110835, -2.233044, 0, 0, 0, 1, 1,
-0.3342107, 0.9428778, -1.101241, 0, 0, 0, 1, 1,
-0.3290849, 0.3618264, 1.288582, 0, 0, 0, 1, 1,
-0.3263561, 0.9474804, -0.5448619, 0, 0, 0, 1, 1,
-0.3244225, -0.594063, -1.621497, 0, 0, 0, 1, 1,
-0.3207576, -0.5201792, -1.865329, 0, 0, 0, 1, 1,
-0.3169992, 0.382606, -0.8311806, 0, 0, 0, 1, 1,
-0.3122938, -0.7502363, -2.464414, 1, 1, 1, 1, 1,
-0.3118176, -0.2099489, -2.270447, 1, 1, 1, 1, 1,
-0.3105941, 0.7876291, -0.300809, 1, 1, 1, 1, 1,
-0.3101291, -0.3394192, -2.881505, 1, 1, 1, 1, 1,
-0.3002248, -0.5257437, -3.966723, 1, 1, 1, 1, 1,
-0.3000034, 0.05348276, -0.269818, 1, 1, 1, 1, 1,
-0.2943687, -0.5100611, -3.41045, 1, 1, 1, 1, 1,
-0.2939483, -0.8976572, -3.243287, 1, 1, 1, 1, 1,
-0.2922664, -0.02832151, -1.089322, 1, 1, 1, 1, 1,
-0.2869737, -0.6929011, -4.258353, 1, 1, 1, 1, 1,
-0.2770169, 0.9795405, -0.2944688, 1, 1, 1, 1, 1,
-0.2767124, 0.2366269, -1.54801, 1, 1, 1, 1, 1,
-0.2763043, 0.263792, -0.9365908, 1, 1, 1, 1, 1,
-0.272263, -0.9089815, -4.146772, 1, 1, 1, 1, 1,
-0.2701468, 0.03155077, -2.861002, 1, 1, 1, 1, 1,
-0.2685535, 0.6750044, -0.02910082, 0, 0, 1, 1, 1,
-0.2677182, 0.9794163, 0.4763082, 1, 0, 0, 1, 1,
-0.2661873, 0.1854272, -0.2634751, 1, 0, 0, 1, 1,
-0.2631307, -0.7007395, -2.389275, 1, 0, 0, 1, 1,
-0.26052, -1.402395, -0.7995694, 1, 0, 0, 1, 1,
-0.2588034, 0.0009807067, -0.3194127, 1, 0, 0, 1, 1,
-0.2587966, 1.888803, 0.3229377, 0, 0, 0, 1, 1,
-0.2571577, -0.1357357, -1.774376, 0, 0, 0, 1, 1,
-0.2547048, -0.5685361, -2.507041, 0, 0, 0, 1, 1,
-0.2536772, -1.651205, -4.432154, 0, 0, 0, 1, 1,
-0.2535171, -0.5658846, -1.527805, 0, 0, 0, 1, 1,
-0.251093, 2.824895, 0.3533904, 0, 0, 0, 1, 1,
-0.2494195, -0.8811915, -3.545705, 0, 0, 0, 1, 1,
-0.2484243, 1.200218, -1.397629, 1, 1, 1, 1, 1,
-0.2397312, 0.3902062, -0.1818849, 1, 1, 1, 1, 1,
-0.2392607, -0.7219311, -0.9356443, 1, 1, 1, 1, 1,
-0.2390111, 0.01332586, -2.037497, 1, 1, 1, 1, 1,
-0.2344274, 0.1445039, -1.866697, 1, 1, 1, 1, 1,
-0.2322526, -0.8118604, -1.763207, 1, 1, 1, 1, 1,
-0.2291032, 0.7079121, -1.003853, 1, 1, 1, 1, 1,
-0.227675, 1.971462, -0.9915075, 1, 1, 1, 1, 1,
-0.2271377, 0.7530763, -1.386088, 1, 1, 1, 1, 1,
-0.2253082, -0.8799078, -4.965471, 1, 1, 1, 1, 1,
-0.2252637, 0.2797356, 0.6470119, 1, 1, 1, 1, 1,
-0.2242671, 0.8555079, -0.3472539, 1, 1, 1, 1, 1,
-0.2233015, 0.854195, -0.6841882, 1, 1, 1, 1, 1,
-0.2194572, -0.6896431, -4.468388, 1, 1, 1, 1, 1,
-0.2142431, 1.209056, -0.3016724, 1, 1, 1, 1, 1,
-0.2122999, 0.5396968, 0.5514075, 0, 0, 1, 1, 1,
-0.2070614, -1.613348, -2.64703, 1, 0, 0, 1, 1,
-0.2067229, 0.05139773, -2.696125, 1, 0, 0, 1, 1,
-0.2053917, 1.130373, -0.4278094, 1, 0, 0, 1, 1,
-0.2049116, 0.2165208, -0.07691034, 1, 0, 0, 1, 1,
-0.2025057, -0.2287629, -1.714329, 1, 0, 0, 1, 1,
-0.2010583, 1.216704, 0.5323507, 0, 0, 0, 1, 1,
-0.1978967, -1.670735, -2.590281, 0, 0, 0, 1, 1,
-0.1969912, -1.291976, -2.778954, 0, 0, 0, 1, 1,
-0.1967376, 0.6851347, -0.7618908, 0, 0, 0, 1, 1,
-0.195879, -0.3391805, -3.498344, 0, 0, 0, 1, 1,
-0.1951664, 0.2967645, -1.21003, 0, 0, 0, 1, 1,
-0.1940148, 0.2662742, 1.268958, 0, 0, 0, 1, 1,
-0.1858359, -1.158304, -3.290709, 1, 1, 1, 1, 1,
-0.1853368, -1.462295, -5.061348, 1, 1, 1, 1, 1,
-0.1842738, 0.278533, -2.646614, 1, 1, 1, 1, 1,
-0.1822324, 1.980099, -0.547354, 1, 1, 1, 1, 1,
-0.1784797, -1.058967, -2.374171, 1, 1, 1, 1, 1,
-0.1771336, 0.2319401, -0.1499696, 1, 1, 1, 1, 1,
-0.1738272, 1.131668, -0.1971998, 1, 1, 1, 1, 1,
-0.1686638, 0.2445686, -0.3324952, 1, 1, 1, 1, 1,
-0.1680586, 1.801405, -1.744155, 1, 1, 1, 1, 1,
-0.1668636, -0.02794708, -2.09838, 1, 1, 1, 1, 1,
-0.1663547, 0.3865437, -1.167806, 1, 1, 1, 1, 1,
-0.166013, -0.5809698, -4.557012, 1, 1, 1, 1, 1,
-0.1640966, -0.7112953, -2.102484, 1, 1, 1, 1, 1,
-0.1610769, 0.7157403, 0.210094, 1, 1, 1, 1, 1,
-0.1607249, 0.7123609, -0.3844251, 1, 1, 1, 1, 1,
-0.1591443, -0.9061795, -1.946425, 0, 0, 1, 1, 1,
-0.155243, 0.3202118, 1.120749, 1, 0, 0, 1, 1,
-0.1532669, -2.125278, -3.043438, 1, 0, 0, 1, 1,
-0.1517895, -1.942191, -2.75837, 1, 0, 0, 1, 1,
-0.1511622, 0.2695209, -0.5050285, 1, 0, 0, 1, 1,
-0.1491376, 0.980086, 1.568599, 1, 0, 0, 1, 1,
-0.1448015, -0.04628325, -2.938699, 0, 0, 0, 1, 1,
-0.1399452, 0.3454361, 1.004156, 0, 0, 0, 1, 1,
-0.1392318, -0.8896158, -3.306458, 0, 0, 0, 1, 1,
-0.1372789, 0.4293754, -0.1994848, 0, 0, 0, 1, 1,
-0.1356694, -0.3690625, -2.601588, 0, 0, 0, 1, 1,
-0.1351922, -2.048654, -3.70992, 0, 0, 0, 1, 1,
-0.1280614, 1.904082, 0.03359534, 0, 0, 0, 1, 1,
-0.125429, 0.2494217, -0.1106462, 1, 1, 1, 1, 1,
-0.1219965, 0.862043, -0.1060251, 1, 1, 1, 1, 1,
-0.1130421, -1.200806, -1.504294, 1, 1, 1, 1, 1,
-0.1106707, 0.6219195, 1.185459, 1, 1, 1, 1, 1,
-0.1071974, -2.040698, -4.01383, 1, 1, 1, 1, 1,
-0.1069806, -0.6960326, -4.171419, 1, 1, 1, 1, 1,
-0.1025291, 1.119076, 1.716561, 1, 1, 1, 1, 1,
-0.1018785, 0.5050787, -1.084935, 1, 1, 1, 1, 1,
-0.1013583, -0.3918483, -1.805455, 1, 1, 1, 1, 1,
-0.09715471, -2.478719, -2.037695, 1, 1, 1, 1, 1,
-0.09591103, 2.229458, -0.2985664, 1, 1, 1, 1, 1,
-0.09429003, -0.380025, -1.164617, 1, 1, 1, 1, 1,
-0.0907118, -0.04243642, -2.093389, 1, 1, 1, 1, 1,
-0.08875755, -0.8902459, -1.066136, 1, 1, 1, 1, 1,
-0.08871458, -0.1721464, -2.396815, 1, 1, 1, 1, 1,
-0.08704336, -0.7359119, -3.13159, 0, 0, 1, 1, 1,
-0.08308229, 1.331297, 1.329741, 1, 0, 0, 1, 1,
-0.0773833, 1.495359, 0.2181446, 1, 0, 0, 1, 1,
-0.07384465, -0.2536227, -4.089434, 1, 0, 0, 1, 1,
-0.07350495, -0.07868104, -1.063197, 1, 0, 0, 1, 1,
-0.07152525, 0.6201035, 0.2017325, 1, 0, 0, 1, 1,
-0.06213231, -0.5263774, -2.191013, 0, 0, 0, 1, 1,
-0.06210622, 0.2545254, -1.104134, 0, 0, 0, 1, 1,
-0.06179747, 0.6432443, -1.74436, 0, 0, 0, 1, 1,
-0.05991587, 0.2020814, -0.02737962, 0, 0, 0, 1, 1,
-0.05484986, 1.822519, 0.7319707, 0, 0, 0, 1, 1,
-0.05057407, 1.470156, 0.5646271, 0, 0, 0, 1, 1,
-0.04114192, 0.7747406, 2.079719, 0, 0, 0, 1, 1,
-0.03721592, -0.6691208, -3.783054, 1, 1, 1, 1, 1,
-0.03510902, 0.8838093, -0.3262619, 1, 1, 1, 1, 1,
-0.03216804, -0.2647284, -2.646655, 1, 1, 1, 1, 1,
-0.03063019, -0.6147966, -2.600822, 1, 1, 1, 1, 1,
-0.02799911, -0.7166968, -4.581076, 1, 1, 1, 1, 1,
-0.02274207, 0.6809545, 0.1399563, 1, 1, 1, 1, 1,
-0.02074652, 0.3766324, 1.236282, 1, 1, 1, 1, 1,
-0.01888402, -1.237509, -2.396945, 1, 1, 1, 1, 1,
-0.01755551, 1.557287, -0.1766872, 1, 1, 1, 1, 1,
-0.01513389, 0.03055121, -0.1433801, 1, 1, 1, 1, 1,
-0.01221538, 0.3434601, -1.678193, 1, 1, 1, 1, 1,
-0.009941266, 0.1616679, -0.3114871, 1, 1, 1, 1, 1,
-0.009750778, -1.177642, -3.034533, 1, 1, 1, 1, 1,
-0.007714356, 0.9875102, 1.155676, 1, 1, 1, 1, 1,
-0.003199561, 0.2766053, -0.842432, 1, 1, 1, 1, 1,
-0.002475872, 0.6345165, -1.599608, 0, 0, 1, 1, 1,
0.01671484, -1.472822, 3.02588, 1, 0, 0, 1, 1,
0.01750013, 1.19309, 0.2319662, 1, 0, 0, 1, 1,
0.01765089, 0.3945888, 0.3561956, 1, 0, 0, 1, 1,
0.01854567, -1.402766, 3.648514, 1, 0, 0, 1, 1,
0.01919778, 0.2872607, 0.4145472, 1, 0, 0, 1, 1,
0.02454012, 0.9919335, -0.6275395, 0, 0, 0, 1, 1,
0.03614661, -0.1645771, 2.342517, 0, 0, 0, 1, 1,
0.04052501, 0.214173, -0.6233297, 0, 0, 0, 1, 1,
0.04096668, -1.695038, 3.692043, 0, 0, 0, 1, 1,
0.04237289, 0.5009975, -1.462086, 0, 0, 0, 1, 1,
0.04440217, -0.5408006, 0.8736882, 0, 0, 0, 1, 1,
0.04642405, 0.08459578, -0.08633979, 0, 0, 0, 1, 1,
0.05012643, -0.9531686, 4.768851, 1, 1, 1, 1, 1,
0.05153169, 0.4538291, 0.01322722, 1, 1, 1, 1, 1,
0.05389606, -0.3994538, 2.977777, 1, 1, 1, 1, 1,
0.05411663, 1.725731, 0.5132962, 1, 1, 1, 1, 1,
0.05822828, 0.1947208, 0.1407197, 1, 1, 1, 1, 1,
0.06200185, -0.3831469, 1.860285, 1, 1, 1, 1, 1,
0.06373849, -1.343517, 3.571219, 1, 1, 1, 1, 1,
0.06754731, -0.8716636, 1.74956, 1, 1, 1, 1, 1,
0.07055797, 0.3990095, -0.1190018, 1, 1, 1, 1, 1,
0.07081819, 0.3154062, 0.732629, 1, 1, 1, 1, 1,
0.07121313, 1.150624, 0.1364125, 1, 1, 1, 1, 1,
0.07277443, -0.8663931, 1.042131, 1, 1, 1, 1, 1,
0.07524084, -0.1973124, 2.32892, 1, 1, 1, 1, 1,
0.08355923, -0.836968, 3.538566, 1, 1, 1, 1, 1,
0.08570202, -0.5168598, 2.305978, 1, 1, 1, 1, 1,
0.09195355, -0.01716344, 1.717625, 0, 0, 1, 1, 1,
0.09208433, -1.112265, 5.020481, 1, 0, 0, 1, 1,
0.09347386, -0.1079933, 3.446925, 1, 0, 0, 1, 1,
0.0955589, -0.05202228, 0.01447521, 1, 0, 0, 1, 1,
0.09939107, -0.09450155, 2.267526, 1, 0, 0, 1, 1,
0.1001373, -1.383644, 1.42568, 1, 0, 0, 1, 1,
0.1004324, -1.245218, 2.592876, 0, 0, 0, 1, 1,
0.1004867, 2.44316, 1.678868, 0, 0, 0, 1, 1,
0.1021863, 1.322724, -0.8287126, 0, 0, 0, 1, 1,
0.1034506, -0.1334835, 3.655344, 0, 0, 0, 1, 1,
0.1070519, -2.047962, 3.247756, 0, 0, 0, 1, 1,
0.107848, 0.22292, 1.49372, 0, 0, 0, 1, 1,
0.110589, 0.8618144, -0.532169, 0, 0, 0, 1, 1,
0.1130048, -1.540019, 4.079216, 1, 1, 1, 1, 1,
0.1158041, 0.6274062, -0.3809604, 1, 1, 1, 1, 1,
0.1166222, -0.1675204, 0.522734, 1, 1, 1, 1, 1,
0.1168521, 0.8395615, 0.719867, 1, 1, 1, 1, 1,
0.1206664, -0.05452945, 2.075566, 1, 1, 1, 1, 1,
0.1230506, 0.2252982, 0.1421424, 1, 1, 1, 1, 1,
0.1275459, -0.5919146, 3.950647, 1, 1, 1, 1, 1,
0.1296996, 0.3976744, -0.1855955, 1, 1, 1, 1, 1,
0.1360702, -0.5657919, 1.910547, 1, 1, 1, 1, 1,
0.1363387, -0.07458156, 2.687464, 1, 1, 1, 1, 1,
0.1384161, -0.02608155, 0.9278687, 1, 1, 1, 1, 1,
0.1402738, -0.7404843, 4.144773, 1, 1, 1, 1, 1,
0.1439617, -0.4321324, 1.498003, 1, 1, 1, 1, 1,
0.1443868, 0.4808588, 1.078968, 1, 1, 1, 1, 1,
0.146632, -0.851896, 4.981759, 1, 1, 1, 1, 1,
0.1480482, -0.09901465, 2.085466, 0, 0, 1, 1, 1,
0.149866, -0.0299559, 0.06075645, 1, 0, 0, 1, 1,
0.1503069, -0.01843289, 1.002174, 1, 0, 0, 1, 1,
0.151354, -2.63046, 3.845735, 1, 0, 0, 1, 1,
0.1526427, -0.3826167, 1.197655, 1, 0, 0, 1, 1,
0.1528369, -1.732531, 3.056925, 1, 0, 0, 1, 1,
0.1560358, -1.5365, 3.478945, 0, 0, 0, 1, 1,
0.1579849, 0.302461, 0.4019903, 0, 0, 0, 1, 1,
0.1597644, 0.5084357, -0.2781502, 0, 0, 0, 1, 1,
0.1630145, -0.7137224, 2.785563, 0, 0, 0, 1, 1,
0.1701725, 1.350611, 0.875761, 0, 0, 0, 1, 1,
0.1707493, -0.672536, 3.106555, 0, 0, 0, 1, 1,
0.1723592, 0.3541832, -0.4154874, 0, 0, 0, 1, 1,
0.1738051, -1.358688, 2.737673, 1, 1, 1, 1, 1,
0.183691, -0.738056, 2.411322, 1, 1, 1, 1, 1,
0.1904983, -0.38474, 2.450396, 1, 1, 1, 1, 1,
0.1913937, 0.8772655, 0.1477339, 1, 1, 1, 1, 1,
0.1916039, -1.458471, 2.230536, 1, 1, 1, 1, 1,
0.1920656, -0.9790154, 3.975702, 1, 1, 1, 1, 1,
0.1933272, 1.961194, 0.6878384, 1, 1, 1, 1, 1,
0.1950425, -0.8526751, 3.447983, 1, 1, 1, 1, 1,
0.1981963, -0.6111111, 2.949501, 1, 1, 1, 1, 1,
0.1988486, -0.01995535, 1.89993, 1, 1, 1, 1, 1,
0.1997575, -1.267369, 3.804124, 1, 1, 1, 1, 1,
0.2001932, -0.4856725, 2.90387, 1, 1, 1, 1, 1,
0.2005067, -0.09011775, 1.558252, 1, 1, 1, 1, 1,
0.2053804, 1.441319, -0.2770418, 1, 1, 1, 1, 1,
0.2054205, -0.5705802, 1.359478, 1, 1, 1, 1, 1,
0.2080372, -0.3221235, 3.133018, 0, 0, 1, 1, 1,
0.2099144, 0.5858359, 1.488817, 1, 0, 0, 1, 1,
0.2111266, 0.28325, 0.1822181, 1, 0, 0, 1, 1,
0.2126716, -0.4895751, 3.047621, 1, 0, 0, 1, 1,
0.2133091, -0.2831384, 3.166844, 1, 0, 0, 1, 1,
0.2151461, 0.3932848, 0.7539122, 1, 0, 0, 1, 1,
0.2168086, 0.5143545, 0.9438211, 0, 0, 0, 1, 1,
0.2172771, 1.132246, -1.025562, 0, 0, 0, 1, 1,
0.2228964, 0.2593921, 2.212149, 0, 0, 0, 1, 1,
0.2241659, -1.380572, 5.243821, 0, 0, 0, 1, 1,
0.2252969, -1.289102, 2.549501, 0, 0, 0, 1, 1,
0.2253991, -0.6833389, 4.208017, 0, 0, 0, 1, 1,
0.226801, 1.358687, 0.4991413, 0, 0, 0, 1, 1,
0.2275837, 0.3476509, -2.140947, 1, 1, 1, 1, 1,
0.2293541, -1.033126, 1.470294, 1, 1, 1, 1, 1,
0.2297669, -0.9419882, 2.09835, 1, 1, 1, 1, 1,
0.2314424, -1.152507, 1.755469, 1, 1, 1, 1, 1,
0.2362583, -1.179702, 4.765989, 1, 1, 1, 1, 1,
0.2376215, -0.9986858, 3.470798, 1, 1, 1, 1, 1,
0.24506, -0.3011765, 3.967915, 1, 1, 1, 1, 1,
0.2510049, -0.6469453, 3.488081, 1, 1, 1, 1, 1,
0.2512357, 0.8040404, 0.1588719, 1, 1, 1, 1, 1,
0.2580778, -0.3467442, 2.018821, 1, 1, 1, 1, 1,
0.2615561, -0.8980351, 2.604845, 1, 1, 1, 1, 1,
0.2620953, 1.294581, 1.514473, 1, 1, 1, 1, 1,
0.2658806, -0.6715839, 1.709417, 1, 1, 1, 1, 1,
0.2671311, 1.199792, -0.7734728, 1, 1, 1, 1, 1,
0.2709198, -0.05435287, 1.485593, 1, 1, 1, 1, 1,
0.272873, 0.1036969, 0.8754933, 0, 0, 1, 1, 1,
0.2758657, -0.04404572, 2.889809, 1, 0, 0, 1, 1,
0.2761084, 1.035887, -0.8701553, 1, 0, 0, 1, 1,
0.2781878, -0.6728655, 3.314404, 1, 0, 0, 1, 1,
0.2790633, 1.078346, 1.25309, 1, 0, 0, 1, 1,
0.2806813, 0.5766374, 0.4443015, 1, 0, 0, 1, 1,
0.282089, -0.2569951, 3.934343, 0, 0, 0, 1, 1,
0.2830932, 0.5169749, -0.1067604, 0, 0, 0, 1, 1,
0.283827, 0.5793407, 1.562325, 0, 0, 0, 1, 1,
0.2870813, 0.1512711, 2.055381, 0, 0, 0, 1, 1,
0.2875805, 0.3658311, 0.7642878, 0, 0, 0, 1, 1,
0.2901695, -1.521684, 3.418579, 0, 0, 0, 1, 1,
0.2923909, 0.446669, -0.3013389, 0, 0, 0, 1, 1,
0.2971227, 1.0401, 1.050146, 1, 1, 1, 1, 1,
0.299031, -0.5864843, 1.377529, 1, 1, 1, 1, 1,
0.2995867, 0.4974773, -1.229485, 1, 1, 1, 1, 1,
0.3030496, 0.5781048, 1.059388, 1, 1, 1, 1, 1,
0.306777, 0.8870421, -0.09699421, 1, 1, 1, 1, 1,
0.3083221, -0.1218677, 2.030661, 1, 1, 1, 1, 1,
0.3196926, -0.00773366, 1.891522, 1, 1, 1, 1, 1,
0.3199659, -0.02801358, 1.391665, 1, 1, 1, 1, 1,
0.3256369, -2.616584, 1.804454, 1, 1, 1, 1, 1,
0.3267578, -0.03249785, 1.854555, 1, 1, 1, 1, 1,
0.330079, -0.4062165, 1.482767, 1, 1, 1, 1, 1,
0.335506, 0.9592327, 0.8473668, 1, 1, 1, 1, 1,
0.3363701, 0.349969, 2.049756, 1, 1, 1, 1, 1,
0.3364498, 0.8196691, -0.1177701, 1, 1, 1, 1, 1,
0.3381469, -0.5108674, 4.5864, 1, 1, 1, 1, 1,
0.3411912, 1.597574, 1.774285, 0, 0, 1, 1, 1,
0.3427618, 0.802554, 1.388302, 1, 0, 0, 1, 1,
0.3455829, 1.009594, 1.621574, 1, 0, 0, 1, 1,
0.3460066, 0.9976619, -0.2919381, 1, 0, 0, 1, 1,
0.3463966, 0.05175411, 0.2064922, 1, 0, 0, 1, 1,
0.3476681, 0.7614958, 0.4381228, 1, 0, 0, 1, 1,
0.35065, -0.6737186, 2.279418, 0, 0, 0, 1, 1,
0.3535603, 0.4525727, 1.583892, 0, 0, 0, 1, 1,
0.3541774, 1.592586, 0.3926328, 0, 0, 0, 1, 1,
0.3542344, 0.7220671, 0.4459754, 0, 0, 0, 1, 1,
0.3564197, -0.7317499, 3.189467, 0, 0, 0, 1, 1,
0.3567661, 0.1821205, 0.9644452, 0, 0, 0, 1, 1,
0.3609264, -1.218435, 1.618161, 0, 0, 0, 1, 1,
0.3618848, 0.3522967, 1.94692, 1, 1, 1, 1, 1,
0.3626516, -1.155298, 4.067377, 1, 1, 1, 1, 1,
0.3657486, -0.221483, 2.279486, 1, 1, 1, 1, 1,
0.3666134, 0.0175632, -0.04161558, 1, 1, 1, 1, 1,
0.368515, -0.8193662, 1.98165, 1, 1, 1, 1, 1,
0.3691027, 0.5550721, -0.07984016, 1, 1, 1, 1, 1,
0.3809977, 0.814917, 0.8383798, 1, 1, 1, 1, 1,
0.3870489, 0.5239418, 0.7992224, 1, 1, 1, 1, 1,
0.387218, 0.04718077, 1.90336, 1, 1, 1, 1, 1,
0.3873232, 1.316102, -0.8154767, 1, 1, 1, 1, 1,
0.3932274, -1.392937, 2.095447, 1, 1, 1, 1, 1,
0.3959741, -0.7017481, 3.540608, 1, 1, 1, 1, 1,
0.3996895, 1.06624, 1.67842, 1, 1, 1, 1, 1,
0.4044966, 0.4575981, 0.3663411, 1, 1, 1, 1, 1,
0.4065024, 0.8944179, 0.8726288, 1, 1, 1, 1, 1,
0.4068562, -1.242038, 4.425021, 0, 0, 1, 1, 1,
0.409365, -0.1092081, 1.608411, 1, 0, 0, 1, 1,
0.409505, 1.047935, -0.5351211, 1, 0, 0, 1, 1,
0.4113617, -1.281947, 1.618732, 1, 0, 0, 1, 1,
0.4115629, -0.2024523, 1.688663, 1, 0, 0, 1, 1,
0.411801, 0.9988576, 1.077326, 1, 0, 0, 1, 1,
0.4168122, -0.437485, 3.496628, 0, 0, 0, 1, 1,
0.4203735, -0.4318192, 0.9061899, 0, 0, 0, 1, 1,
0.4214598, 0.06939082, 1.027978, 0, 0, 0, 1, 1,
0.4226341, -1.152836, 4.229545, 0, 0, 0, 1, 1,
0.4235367, 0.4033915, 1.741467, 0, 0, 0, 1, 1,
0.4250928, 0.1110957, 0.9011379, 0, 0, 0, 1, 1,
0.4251065, 0.06051007, 0.1276943, 0, 0, 0, 1, 1,
0.4320715, 0.01143906, 3.482347, 1, 1, 1, 1, 1,
0.4346848, -0.7938741, 2.709711, 1, 1, 1, 1, 1,
0.4348349, -0.5003186, 2.975528, 1, 1, 1, 1, 1,
0.4348604, 1.193879, 1.593432, 1, 1, 1, 1, 1,
0.4435699, 1.082129, 1.377121, 1, 1, 1, 1, 1,
0.4531181, 1.612966, -0.6164563, 1, 1, 1, 1, 1,
0.4555602, -0.420952, 2.255126, 1, 1, 1, 1, 1,
0.4559143, -0.2465747, 1.994359, 1, 1, 1, 1, 1,
0.4593373, 0.5445945, 2.340734, 1, 1, 1, 1, 1,
0.4739823, -0.4226696, 2.923676, 1, 1, 1, 1, 1,
0.4807081, 1.162147, -0.4414486, 1, 1, 1, 1, 1,
0.4814661, -0.7760723, 1.574822, 1, 1, 1, 1, 1,
0.4859713, 0.2487096, 2.004298, 1, 1, 1, 1, 1,
0.4874467, -0.5255903, 2.211484, 1, 1, 1, 1, 1,
0.4879525, 0.1780695, 1.599105, 1, 1, 1, 1, 1,
0.4908741, 1.191481, 1.112115, 0, 0, 1, 1, 1,
0.4918505, 0.9317771, -2.060718, 1, 0, 0, 1, 1,
0.4974005, 1.06174, 1.327046, 1, 0, 0, 1, 1,
0.4983162, -0.1831942, 0.8877929, 1, 0, 0, 1, 1,
0.5007557, -0.2340511, 2.471664, 1, 0, 0, 1, 1,
0.504629, -2.086907, 2.425104, 1, 0, 0, 1, 1,
0.5087752, -0.0907959, 0.5976733, 0, 0, 0, 1, 1,
0.5097263, -2.111874, 1.535293, 0, 0, 0, 1, 1,
0.5097672, 0.6118826, 1.14817, 0, 0, 0, 1, 1,
0.5101822, -0.2643814, 3.459538, 0, 0, 0, 1, 1,
0.5125858, -1.405418, 3.742744, 0, 0, 0, 1, 1,
0.5139427, 2.039469, 3.137546, 0, 0, 0, 1, 1,
0.5166335, 0.1959155, 1.379874, 0, 0, 0, 1, 1,
0.5181864, -1.740219, 1.705803, 1, 1, 1, 1, 1,
0.5190676, -0.4197254, 1.373089, 1, 1, 1, 1, 1,
0.520497, 1.304952, 1.516771, 1, 1, 1, 1, 1,
0.5211058, 1.308143, 0.654622, 1, 1, 1, 1, 1,
0.5250071, 0.1537591, 0.3941459, 1, 1, 1, 1, 1,
0.5264878, -0.00860474, 1.545255, 1, 1, 1, 1, 1,
0.5322678, -0.2687041, 2.302783, 1, 1, 1, 1, 1,
0.5340405, -0.1481462, 0.2404436, 1, 1, 1, 1, 1,
0.5389848, -0.6738758, 1.542334, 1, 1, 1, 1, 1,
0.541169, 0.2382508, 2.336201, 1, 1, 1, 1, 1,
0.5472617, -0.7624585, 3.819648, 1, 1, 1, 1, 1,
0.5584537, 0.6053517, -1.206526, 1, 1, 1, 1, 1,
0.5614117, 0.8984259, -0.734456, 1, 1, 1, 1, 1,
0.5643835, 0.3530485, 0.5219954, 1, 1, 1, 1, 1,
0.5711923, 1.294665, 1.200768, 1, 1, 1, 1, 1,
0.5766004, -1.632233, 1.133742, 0, 0, 1, 1, 1,
0.5868617, 0.4965288, 1.71062, 1, 0, 0, 1, 1,
0.5969077, -2.48312, 2.170288, 1, 0, 0, 1, 1,
0.5987479, 0.1938367, 1.171503, 1, 0, 0, 1, 1,
0.6035565, -0.6628059, 5.004205, 1, 0, 0, 1, 1,
0.6197451, 1.682093, -0.4457309, 1, 0, 0, 1, 1,
0.6232996, 0.0762058, 0.6901602, 0, 0, 0, 1, 1,
0.6251658, 0.2993366, 1.104557, 0, 0, 0, 1, 1,
0.6262136, -1.253283, 2.284363, 0, 0, 0, 1, 1,
0.6322032, 0.08709075, 2.991011, 0, 0, 0, 1, 1,
0.6436677, -0.4055037, 3.164334, 0, 0, 0, 1, 1,
0.645359, -0.2929642, 0.9634325, 0, 0, 0, 1, 1,
0.6475565, 1.482478, -1.072006, 0, 0, 0, 1, 1,
0.6529652, -1.847217, 3.233986, 1, 1, 1, 1, 1,
0.6539382, 0.01958054, 0.05468149, 1, 1, 1, 1, 1,
0.6544859, 0.1182318, 2.315692, 1, 1, 1, 1, 1,
0.6551087, 0.9132677, -0.8427467, 1, 1, 1, 1, 1,
0.6593339, 0.3981987, 0.903105, 1, 1, 1, 1, 1,
0.6721916, 0.9353263, 1.445999, 1, 1, 1, 1, 1,
0.6773316, 2.118276, 1.091561, 1, 1, 1, 1, 1,
0.6798279, 0.3927445, -0.2617261, 1, 1, 1, 1, 1,
0.683063, 0.2181322, 1.678171, 1, 1, 1, 1, 1,
0.6845034, -0.1641516, 2.095295, 1, 1, 1, 1, 1,
0.6926913, -0.5887603, 3.145818, 1, 1, 1, 1, 1,
0.6975533, 2.493077, 0.8168861, 1, 1, 1, 1, 1,
0.7029024, 0.4945799, 1.395634, 1, 1, 1, 1, 1,
0.7075982, -0.1631247, 0.8860419, 1, 1, 1, 1, 1,
0.7122577, 1.21721, 0.1565997, 1, 1, 1, 1, 1,
0.7132608, -0.02859329, 1.746548, 0, 0, 1, 1, 1,
0.7162597, -0.8924884, 3.474584, 1, 0, 0, 1, 1,
0.7228879, -0.2899135, 0.5159681, 1, 0, 0, 1, 1,
0.7259143, -0.622885, 3.796996, 1, 0, 0, 1, 1,
0.7346195, -2.263311, 3.263226, 1, 0, 0, 1, 1,
0.7356698, -0.7192787, 1.981404, 1, 0, 0, 1, 1,
0.7373942, -2.598679, 3.332694, 0, 0, 0, 1, 1,
0.7376673, 1.277239, 2.415373, 0, 0, 0, 1, 1,
0.7631736, -1.903268, 2.06084, 0, 0, 0, 1, 1,
0.768091, -0.800854, 2.9804, 0, 0, 0, 1, 1,
0.7685262, 1.247564, -0.1733212, 0, 0, 0, 1, 1,
0.7702613, -1.165941, 3.765806, 0, 0, 0, 1, 1,
0.7740441, -0.6932529, 1.039102, 0, 0, 0, 1, 1,
0.7760762, 0.1681556, 0.06246575, 1, 1, 1, 1, 1,
0.7762698, -0.07292865, 1.979623, 1, 1, 1, 1, 1,
0.7839404, 0.06282143, 1.028088, 1, 1, 1, 1, 1,
0.7843665, -0.4983881, -0.0692483, 1, 1, 1, 1, 1,
0.7888607, 0.7572014, 0.4861885, 1, 1, 1, 1, 1,
0.7938282, 1.04853, 0.2525321, 1, 1, 1, 1, 1,
0.798719, 0.1368513, 0.6627743, 1, 1, 1, 1, 1,
0.7997171, 0.715281, 0.9694927, 1, 1, 1, 1, 1,
0.801065, 1.486592, -0.3363654, 1, 1, 1, 1, 1,
0.8012298, 2.487622, -0.1110541, 1, 1, 1, 1, 1,
0.8021339, 0.1005711, 0.2876469, 1, 1, 1, 1, 1,
0.8038009, -1.117003, 3.527015, 1, 1, 1, 1, 1,
0.805567, -1.720524, 3.617296, 1, 1, 1, 1, 1,
0.8088275, 0.2147073, 2.809447, 1, 1, 1, 1, 1,
0.8118867, -1.415432, 2.607272, 1, 1, 1, 1, 1,
0.8135412, 0.3030042, 2.706915, 0, 0, 1, 1, 1,
0.8151778, -0.03233335, -0.07958595, 1, 0, 0, 1, 1,
0.8185136, 0.2355368, 1.683922, 1, 0, 0, 1, 1,
0.8188631, -1.725439, 3.497894, 1, 0, 0, 1, 1,
0.8293653, 1.294109, -0.2888187, 1, 0, 0, 1, 1,
0.8320987, -1.134094, 2.174194, 1, 0, 0, 1, 1,
0.8368213, -1.359827, 0.5410118, 0, 0, 0, 1, 1,
0.8391606, -0.1833053, 2.668228, 0, 0, 0, 1, 1,
0.8424221, 2.430885, 0.8567671, 0, 0, 0, 1, 1,
0.8478302, -1.951377, 1.30624, 0, 0, 0, 1, 1,
0.8495016, 1.086571, 0.1751595, 0, 0, 0, 1, 1,
0.8510376, 0.02631597, 2.129016, 0, 0, 0, 1, 1,
0.8524243, 0.2891665, 3.718073, 0, 0, 0, 1, 1,
0.8535618, 1.084583, 1.281347, 1, 1, 1, 1, 1,
0.8556559, -0.7520454, 3.093337, 1, 1, 1, 1, 1,
0.8561445, 0.2392811, 1.780317, 1, 1, 1, 1, 1,
0.8596756, -0.5943992, 1.250972, 1, 1, 1, 1, 1,
0.8605095, 0.707346, -1.21951, 1, 1, 1, 1, 1,
0.8638039, 0.7690919, -1.103189, 1, 1, 1, 1, 1,
0.8654491, -0.8908398, 1.705689, 1, 1, 1, 1, 1,
0.8686246, 0.4601696, -0.05050874, 1, 1, 1, 1, 1,
0.8722851, -0.09482888, 1.395643, 1, 1, 1, 1, 1,
0.8763264, -1.836991, 4.774461, 1, 1, 1, 1, 1,
0.8772746, 0.4018137, 0.2363321, 1, 1, 1, 1, 1,
0.8902103, 0.2446522, 1.03147, 1, 1, 1, 1, 1,
0.894308, -1.155392, 2.057569, 1, 1, 1, 1, 1,
0.8970656, -0.5088911, 2.418913, 1, 1, 1, 1, 1,
0.8975481, 0.1938235, 1.384145, 1, 1, 1, 1, 1,
0.9004569, 0.7760425, -0.8745079, 0, 0, 1, 1, 1,
0.9275646, -2.092839, 4.038169, 1, 0, 0, 1, 1,
0.9277258, -0.4619485, 1.388258, 1, 0, 0, 1, 1,
0.9288365, 0.07079203, 0.8139506, 1, 0, 0, 1, 1,
0.9289728, -1.344257, 1.705948, 1, 0, 0, 1, 1,
0.9313332, 0.9357522, 0.4708206, 1, 0, 0, 1, 1,
0.9374594, 0.3947353, 0.6499819, 0, 0, 0, 1, 1,
0.9383566, -2.398263, 2.679291, 0, 0, 0, 1, 1,
0.9413642, 0.5095196, 1.263493, 0, 0, 0, 1, 1,
0.9416342, -0.01859422, 1.520312, 0, 0, 0, 1, 1,
0.9442079, -0.3843165, 0.802766, 0, 0, 0, 1, 1,
0.9545097, 0.9892753, 1.086349, 0, 0, 0, 1, 1,
0.9564886, -0.5693132, 1.687089, 0, 0, 0, 1, 1,
0.9567657, -0.6908554, 3.741108, 1, 1, 1, 1, 1,
0.9573479, -1.187488, 3.054732, 1, 1, 1, 1, 1,
0.9576589, -0.5614417, 1.480501, 1, 1, 1, 1, 1,
0.9605308, -1.583725, 2.005978, 1, 1, 1, 1, 1,
0.9615701, -1.28912, 4.49361, 1, 1, 1, 1, 1,
0.9624023, -1.101181, 3.666625, 1, 1, 1, 1, 1,
0.9658437, 0.1337705, 1.402546, 1, 1, 1, 1, 1,
0.9712368, -0.6042485, 0.9918417, 1, 1, 1, 1, 1,
0.9779171, 0.1895421, 0.949538, 1, 1, 1, 1, 1,
0.9815425, 0.4294146, 1.332787, 1, 1, 1, 1, 1,
0.9818086, 0.1515428, 1.315481, 1, 1, 1, 1, 1,
0.9830164, -0.9456866, 3.674098, 1, 1, 1, 1, 1,
0.9841423, 0.1123331, 1.078396, 1, 1, 1, 1, 1,
0.9953049, 0.311262, -0.9506673, 1, 1, 1, 1, 1,
0.9985645, 1.474244, -0.6696658, 1, 1, 1, 1, 1,
1.008612, 0.4073038, 0.8784237, 0, 0, 1, 1, 1,
1.014516, 0.6756445, 1.890636, 1, 0, 0, 1, 1,
1.015461, 1.816357, -0.305961, 1, 0, 0, 1, 1,
1.016118, -1.172086, 2.182373, 1, 0, 0, 1, 1,
1.022688, 0.8124005, -0.2348457, 1, 0, 0, 1, 1,
1.029126, -1.311079, 4.417822, 1, 0, 0, 1, 1,
1.029487, 0.5036139, 3.05793, 0, 0, 0, 1, 1,
1.033966, 1.059265, 0.3712206, 0, 0, 0, 1, 1,
1.034226, 1.409165, 2.219262, 0, 0, 0, 1, 1,
1.040867, -0.05870295, 1.378737, 0, 0, 0, 1, 1,
1.054073, 0.8193651, 0.4812221, 0, 0, 0, 1, 1,
1.092038, -0.2488446, 0.289167, 0, 0, 0, 1, 1,
1.096793, -1.14083, 3.476388, 0, 0, 0, 1, 1,
1.10343, 0.7366968, 2.7764, 1, 1, 1, 1, 1,
1.106305, -1.200764, 1.746469, 1, 1, 1, 1, 1,
1.106915, -2.037905, 1.988966, 1, 1, 1, 1, 1,
1.108854, -1.066134, 2.360955, 1, 1, 1, 1, 1,
1.110251, 0.03450869, 0.09626989, 1, 1, 1, 1, 1,
1.111997, 0.5151243, 1.644937, 1, 1, 1, 1, 1,
1.12104, -1.068169, 1.648902, 1, 1, 1, 1, 1,
1.122873, 0.2629732, 0.2659196, 1, 1, 1, 1, 1,
1.126046, 0.09181564, 1.670264, 1, 1, 1, 1, 1,
1.126472, -0.4751117, 1.743378, 1, 1, 1, 1, 1,
1.128829, -1.546829, 0.3242635, 1, 1, 1, 1, 1,
1.131457, 2.221485, 1.120422, 1, 1, 1, 1, 1,
1.134165, 1.421744, -0.5085854, 1, 1, 1, 1, 1,
1.137954, -1.631308, 3.427429, 1, 1, 1, 1, 1,
1.145265, 0.964337, 1.384593, 1, 1, 1, 1, 1,
1.147283, 0.9879081, 2.084937, 0, 0, 1, 1, 1,
1.148272, -0.251517, 2.360156, 1, 0, 0, 1, 1,
1.148774, -0.5112711, 2.271025, 1, 0, 0, 1, 1,
1.152958, 0.04523142, 2.199848, 1, 0, 0, 1, 1,
1.154572, 1.237383, 0.8354195, 1, 0, 0, 1, 1,
1.156214, 1.005326, 1.493431, 1, 0, 0, 1, 1,
1.159989, -1.250382, 2.561805, 0, 0, 0, 1, 1,
1.160421, 2.06725, -0.6406263, 0, 0, 0, 1, 1,
1.164769, 0.8221424, 3.229296, 0, 0, 0, 1, 1,
1.169258, 1.093471, 2.577662, 0, 0, 0, 1, 1,
1.169613, -1.573739, 3.480808, 0, 0, 0, 1, 1,
1.169677, 1.053383, 3.0924, 0, 0, 0, 1, 1,
1.174714, 0.7554441, 0.5158005, 0, 0, 0, 1, 1,
1.184151, -0.007247584, 1.701229, 1, 1, 1, 1, 1,
1.193506, 1.20214, 2.351397, 1, 1, 1, 1, 1,
1.198793, -0.9975502, 0.6462697, 1, 1, 1, 1, 1,
1.199493, 1.150075, 0.6947855, 1, 1, 1, 1, 1,
1.205464, -0.6352273, 1.225383, 1, 1, 1, 1, 1,
1.210587, 0.264323, -1.439932, 1, 1, 1, 1, 1,
1.210816, 0.8922589, 2.802805, 1, 1, 1, 1, 1,
1.211176, -0.9849852, 1.345637, 1, 1, 1, 1, 1,
1.213123, -1.781953, 2.836345, 1, 1, 1, 1, 1,
1.213427, 0.5337386, 1.030871, 1, 1, 1, 1, 1,
1.217416, 1.182732, 0.6750603, 1, 1, 1, 1, 1,
1.218337, 1.113222, 1.222436, 1, 1, 1, 1, 1,
1.219752, 1.928074, 1.558877, 1, 1, 1, 1, 1,
1.220038, -0.1978613, 1.093034, 1, 1, 1, 1, 1,
1.22056, 0.5945681, -1.050941, 1, 1, 1, 1, 1,
1.22084, -1.162582, 4.15523, 0, 0, 1, 1, 1,
1.234865, 1.102205, 1.119186, 1, 0, 0, 1, 1,
1.243758, -0.591279, 2.862616, 1, 0, 0, 1, 1,
1.253276, 2.143093, 1.378268, 1, 0, 0, 1, 1,
1.253825, -2.175574, 2.054791, 1, 0, 0, 1, 1,
1.256382, -1.040206, 4.677778, 1, 0, 0, 1, 1,
1.261562, 1.023519, -0.8811266, 0, 0, 0, 1, 1,
1.263086, 0.7200775, 1.290478, 0, 0, 0, 1, 1,
1.271803, 0.1740991, 0.4754634, 0, 0, 0, 1, 1,
1.277786, -0.6797115, 1.325557, 0, 0, 0, 1, 1,
1.293899, -0.4244576, 1.441027, 0, 0, 0, 1, 1,
1.297763, -2.075554, 2.929841, 0, 0, 0, 1, 1,
1.298765, 1.942417, -0.5993409, 0, 0, 0, 1, 1,
1.302805, -2.75176, 1.634245, 1, 1, 1, 1, 1,
1.32748, -0.8027784, 0.9026531, 1, 1, 1, 1, 1,
1.335802, 1.203348, 0.330602, 1, 1, 1, 1, 1,
1.337735, -0.3886389, 2.605328, 1, 1, 1, 1, 1,
1.346701, 0.4642446, -1.271351, 1, 1, 1, 1, 1,
1.361831, 1.424985, 0.2251423, 1, 1, 1, 1, 1,
1.367373, 0.945213, 1.357171, 1, 1, 1, 1, 1,
1.39416, 0.5983987, 2.19058, 1, 1, 1, 1, 1,
1.403965, -0.1583897, 1.051756, 1, 1, 1, 1, 1,
1.404144, 0.9344066, 1.775221, 1, 1, 1, 1, 1,
1.412167, 0.0160365, 1.576294, 1, 1, 1, 1, 1,
1.420196, -0.8114755, 2.32003, 1, 1, 1, 1, 1,
1.431197, -1.06444, 1.087116, 1, 1, 1, 1, 1,
1.435612, -1.554455, 3.834556, 1, 1, 1, 1, 1,
1.449664, 0.986564, 1.952957, 1, 1, 1, 1, 1,
1.451068, 0.4215292, 0.4331165, 0, 0, 1, 1, 1,
1.462668, -0.8247249, 2.227292, 1, 0, 0, 1, 1,
1.464012, -1.59309, 3.019421, 1, 0, 0, 1, 1,
1.490975, -0.0547987, 3.132869, 1, 0, 0, 1, 1,
1.514178, -1.001803, 1.055829, 1, 0, 0, 1, 1,
1.51776, -1.056921, 2.219817, 1, 0, 0, 1, 1,
1.525455, 0.1090641, 0.6782503, 0, 0, 0, 1, 1,
1.534766, -1.193723, 2.756845, 0, 0, 0, 1, 1,
1.539673, 1.566824, 1.680623, 0, 0, 0, 1, 1,
1.547684, -0.8176975, 2.815096, 0, 0, 0, 1, 1,
1.553834, -0.1409962, 1.977942, 0, 0, 0, 1, 1,
1.558374, -0.03657035, 3.123327, 0, 0, 0, 1, 1,
1.564861, 0.2004081, 0.7240052, 0, 0, 0, 1, 1,
1.577201, 0.01120014, 2.61912, 1, 1, 1, 1, 1,
1.584841, -1.963871, 2.304704, 1, 1, 1, 1, 1,
1.593229, 1.320395, 0.8848894, 1, 1, 1, 1, 1,
1.598597, -0.7064444, 2.719817, 1, 1, 1, 1, 1,
1.598964, -0.4230349, 2.403897, 1, 1, 1, 1, 1,
1.613858, 0.05690242, 3.211403, 1, 1, 1, 1, 1,
1.627114, 1.823768, 0.8445689, 1, 1, 1, 1, 1,
1.644486, -0.0908834, 2.138954, 1, 1, 1, 1, 1,
1.652983, -0.6526362, 2.890301, 1, 1, 1, 1, 1,
1.671953, -0.9734849, 1.58216, 1, 1, 1, 1, 1,
1.688876, 0.1025632, 0.8288363, 1, 1, 1, 1, 1,
1.699957, -0.4329996, 3.109886, 1, 1, 1, 1, 1,
1.700379, -0.7898986, 0.7275807, 1, 1, 1, 1, 1,
1.703207, 0.3554235, 2.160845, 1, 1, 1, 1, 1,
1.711315, 1.752838, 1.481441, 1, 1, 1, 1, 1,
1.747265, 0.364655, 0.9795422, 0, 0, 1, 1, 1,
1.754954, -0.2917622, 1.586671, 1, 0, 0, 1, 1,
1.759196, 0.9508836, 0.842609, 1, 0, 0, 1, 1,
1.775236, -0.1297252, 0.6308877, 1, 0, 0, 1, 1,
1.77615, 0.6392248, 0.8922358, 1, 0, 0, 1, 1,
1.781125, 1.305521, -0.05422664, 1, 0, 0, 1, 1,
1.794568, 0.2090691, 0.9352885, 0, 0, 0, 1, 1,
1.803518, -0.08334193, 3.115133, 0, 0, 0, 1, 1,
1.81679, 1.682426, 2.507542, 0, 0, 0, 1, 1,
1.831613, 1.528906, 1.39981, 0, 0, 0, 1, 1,
1.837021, -1.266574, 2.50696, 0, 0, 0, 1, 1,
1.837067, -0.8279849, 1.570265, 0, 0, 0, 1, 1,
1.869837, 0.682022, 0.2821777, 0, 0, 0, 1, 1,
1.877401, 0.280389, 1.187119, 1, 1, 1, 1, 1,
1.888141, -0.04514242, 1.83358, 1, 1, 1, 1, 1,
1.892882, 0.5575199, 0.3269989, 1, 1, 1, 1, 1,
1.900396, 2.638404, 0.9666744, 1, 1, 1, 1, 1,
1.901618, 0.6728263, 1.624438, 1, 1, 1, 1, 1,
1.908421, 1.864053, 1.04304, 1, 1, 1, 1, 1,
1.919667, -1.576601, 3.431361, 1, 1, 1, 1, 1,
1.950552, -0.8847495, 1.024384, 1, 1, 1, 1, 1,
1.964009, 0.7332755, -0.142588, 1, 1, 1, 1, 1,
1.966296, -0.161615, 0.6039183, 1, 1, 1, 1, 1,
1.984856, -0.6200668, 2.00279, 1, 1, 1, 1, 1,
2.020173, -0.7161043, 2.172545, 1, 1, 1, 1, 1,
2.045638, -1.660311, 1.997103, 1, 1, 1, 1, 1,
2.084916, 0.7247828, 0.9333383, 1, 1, 1, 1, 1,
2.093279, 0.622877, 2.723937, 1, 1, 1, 1, 1,
2.095875, -2.470693, 2.941833, 0, 0, 1, 1, 1,
2.159743, 1.755497, 1.033489, 1, 0, 0, 1, 1,
2.162786, 0.2386108, 1.205967, 1, 0, 0, 1, 1,
2.222396, 0.3216469, 0.5160659, 1, 0, 0, 1, 1,
2.226564, 0.736635, 2.578807, 1, 0, 0, 1, 1,
2.387256, 0.2534172, 0.8688354, 1, 0, 0, 1, 1,
2.387665, -0.9767035, 2.03777, 0, 0, 0, 1, 1,
2.438568, -1.272898, 3.809201, 0, 0, 0, 1, 1,
2.466188, 0.6821835, 0.4265795, 0, 0, 0, 1, 1,
2.476492, -1.127973, 0.4843469, 0, 0, 0, 1, 1,
2.521873, -0.4806236, 1.67127, 0, 0, 0, 1, 1,
2.533015, -0.4115848, 1.466993, 0, 0, 0, 1, 1,
2.58132, -0.3732694, 2.224472, 0, 0, 0, 1, 1,
2.649259, -0.21504, 1.116807, 1, 1, 1, 1, 1,
2.680669, 0.2781015, 2.936497, 1, 1, 1, 1, 1,
2.68851, 1.148918, 1.639762, 1, 1, 1, 1, 1,
2.696115, -0.03663874, 0.6429521, 1, 1, 1, 1, 1,
2.79639, -1.122501, 3.351481, 1, 1, 1, 1, 1,
2.837731, -1.14256, 2.936915, 1, 1, 1, 1, 1,
2.985589, -1.736104, 0.6164858, 1, 1, 1, 1, 1
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
var radius = 9.749898;
var distance = 34.2461;
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
mvMatrix.translate( 0.1643983, -0.2469101, 0.3256207 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2461);
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
