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
-2.910427, -0.2736187, -3.036007, 1, 0, 0, 1,
-2.89772, -0.1422324, -2.010121, 1, 0.007843138, 0, 1,
-2.674725, -0.7094185, -1.43061, 1, 0.01176471, 0, 1,
-2.555435, -0.7212812, -1.018041, 1, 0.01960784, 0, 1,
-2.513869, -1.970834, -2.468498, 1, 0.02352941, 0, 1,
-2.490496, 0.6502222, -1.466453, 1, 0.03137255, 0, 1,
-2.38377, -1.360337, -3.077103, 1, 0.03529412, 0, 1,
-2.327975, 0.8559568, -0.2686787, 1, 0.04313726, 0, 1,
-2.280914, -1.06653, -0.660198, 1, 0.04705882, 0, 1,
-2.273218, -1.040119, -2.539304, 1, 0.05490196, 0, 1,
-2.271358, 0.08633267, -2.390578, 1, 0.05882353, 0, 1,
-2.22963, 0.02147808, -0.616641, 1, 0.06666667, 0, 1,
-2.227543, -0.5340366, -2.926112, 1, 0.07058824, 0, 1,
-2.216941, 0.3830409, -2.183883, 1, 0.07843138, 0, 1,
-2.121113, -2.291399, -2.867292, 1, 0.08235294, 0, 1,
-2.111217, 1.099063, -1.103617, 1, 0.09019608, 0, 1,
-2.08908, -1.029532, -2.222626, 1, 0.09411765, 0, 1,
-2.070143, -1.131054, -1.943414, 1, 0.1019608, 0, 1,
-2.054074, 1.187692, -1.682449, 1, 0.1098039, 0, 1,
-2.034456, 0.7281343, -3.605417, 1, 0.1137255, 0, 1,
-1.993898, 0.2853658, -2.687754, 1, 0.1215686, 0, 1,
-1.97481, -0.1644216, -3.392859, 1, 0.1254902, 0, 1,
-1.956203, -0.48111, -2.239773, 1, 0.1333333, 0, 1,
-1.952602, 0.2245966, 0.07398972, 1, 0.1372549, 0, 1,
-1.934597, -0.3056132, -2.335999, 1, 0.145098, 0, 1,
-1.93161, -0.9774462, -2.144313, 1, 0.1490196, 0, 1,
-1.892309, 2.274381, 0.5441082, 1, 0.1568628, 0, 1,
-1.891445, -0.254093, -3.140287, 1, 0.1607843, 0, 1,
-1.888678, -0.4923646, -1.972794, 1, 0.1686275, 0, 1,
-1.839188, 1.480362, -0.6280009, 1, 0.172549, 0, 1,
-1.834261, 0.6695693, -0.6708406, 1, 0.1803922, 0, 1,
-1.830008, -0.5700907, -3.502243, 1, 0.1843137, 0, 1,
-1.826807, -0.9178593, -1.847102, 1, 0.1921569, 0, 1,
-1.820607, 0.09322771, -1.426637, 1, 0.1960784, 0, 1,
-1.813876, 0.4161315, -0.6778441, 1, 0.2039216, 0, 1,
-1.811559, 0.5671146, -2.359459, 1, 0.2117647, 0, 1,
-1.802508, 2.21617, 1.081669, 1, 0.2156863, 0, 1,
-1.799311, 0.2247531, -3.092422, 1, 0.2235294, 0, 1,
-1.792806, -0.8740507, -2.392279, 1, 0.227451, 0, 1,
-1.773498, -0.5820186, -3.659221, 1, 0.2352941, 0, 1,
-1.762704, 0.3790168, -2.88214, 1, 0.2392157, 0, 1,
-1.760239, 1.471808, -1.187953, 1, 0.2470588, 0, 1,
-1.750642, -0.2346487, -3.92447, 1, 0.2509804, 0, 1,
-1.746584, -1.250324, -1.689588, 1, 0.2588235, 0, 1,
-1.744112, -1.219427, -0.7769346, 1, 0.2627451, 0, 1,
-1.737443, -1.220221, -3.37625, 1, 0.2705882, 0, 1,
-1.706103, 1.167634, -2.904437, 1, 0.2745098, 0, 1,
-1.705894, -1.173331, -0.9126093, 1, 0.282353, 0, 1,
-1.69524, 0.2846532, -0.411435, 1, 0.2862745, 0, 1,
-1.694536, -2.279475, -2.607694, 1, 0.2941177, 0, 1,
-1.690016, 0.2772844, 0.1916739, 1, 0.3019608, 0, 1,
-1.673928, 0.8733327, -2.068479, 1, 0.3058824, 0, 1,
-1.673105, -2.40151, -1.79273, 1, 0.3137255, 0, 1,
-1.666269, 0.4313267, -0.7462637, 1, 0.3176471, 0, 1,
-1.664573, -0.3711624, -2.892726, 1, 0.3254902, 0, 1,
-1.639325, 0.1449224, -2.617684, 1, 0.3294118, 0, 1,
-1.639132, 0.01073393, -1.482963, 1, 0.3372549, 0, 1,
-1.625392, -1.197642, -3.401437, 1, 0.3411765, 0, 1,
-1.612196, -1.062433, -1.886186, 1, 0.3490196, 0, 1,
-1.612185, 0.5855978, -2.334805, 1, 0.3529412, 0, 1,
-1.596653, -1.409489, -3.708701, 1, 0.3607843, 0, 1,
-1.577316, -2.427451, -0.2428485, 1, 0.3647059, 0, 1,
-1.576542, -0.6796579, -3.944735, 1, 0.372549, 0, 1,
-1.571987, 0.5560157, -1.886476, 1, 0.3764706, 0, 1,
-1.564023, 0.8085693, -0.4426233, 1, 0.3843137, 0, 1,
-1.561444, -0.7862819, -1.734138, 1, 0.3882353, 0, 1,
-1.544359, 0.2941568, -0.76618, 1, 0.3960784, 0, 1,
-1.537008, -0.008524915, -1.655396, 1, 0.4039216, 0, 1,
-1.523819, -0.595384, -1.586165, 1, 0.4078431, 0, 1,
-1.520489, -0.1257389, -3.348408, 1, 0.4156863, 0, 1,
-1.519653, 1.627746, -0.7090907, 1, 0.4196078, 0, 1,
-1.51125, 0.09951538, -2.418216, 1, 0.427451, 0, 1,
-1.493043, 1.745332, -0.4190462, 1, 0.4313726, 0, 1,
-1.48441, 0.0856983, -1.940227, 1, 0.4392157, 0, 1,
-1.466069, -0.2768205, -0.9272417, 1, 0.4431373, 0, 1,
-1.45806, -0.5270232, -0.898367, 1, 0.4509804, 0, 1,
-1.453191, 1.08535, -1.774265, 1, 0.454902, 0, 1,
-1.448813, 1.914332, 0.5703275, 1, 0.4627451, 0, 1,
-1.446395, -0.8121244, -1.29021, 1, 0.4666667, 0, 1,
-1.443453, 1.811459, -1.002176, 1, 0.4745098, 0, 1,
-1.442311, -0.08733274, -1.07418, 1, 0.4784314, 0, 1,
-1.433658, -1.345584, -2.843724, 1, 0.4862745, 0, 1,
-1.42753, 0.7262313, -1.687691, 1, 0.4901961, 0, 1,
-1.42371, 0.563488, -0.8791064, 1, 0.4980392, 0, 1,
-1.421927, 0.02130421, -0.494708, 1, 0.5058824, 0, 1,
-1.420801, 0.03642773, -2.182462, 1, 0.509804, 0, 1,
-1.416568, -0.3950059, -0.9918341, 1, 0.5176471, 0, 1,
-1.403242, 1.118012, -1.558177, 1, 0.5215687, 0, 1,
-1.400704, -0.2941986, -1.284229, 1, 0.5294118, 0, 1,
-1.387604, -0.5968482, -2.248791, 1, 0.5333334, 0, 1,
-1.384041, 0.05607883, -3.097601, 1, 0.5411765, 0, 1,
-1.383916, 1.26253, -0.7051454, 1, 0.5450981, 0, 1,
-1.366013, 0.2361599, -2.409854, 1, 0.5529412, 0, 1,
-1.362014, -0.2883975, -1.128087, 1, 0.5568628, 0, 1,
-1.351684, -0.3944584, -0.225295, 1, 0.5647059, 0, 1,
-1.350202, 1.195436, -1.725796, 1, 0.5686275, 0, 1,
-1.342179, 0.2962268, -0.895138, 1, 0.5764706, 0, 1,
-1.334598, 1.022301, -2.332605, 1, 0.5803922, 0, 1,
-1.332101, -0.6339462, -1.525206, 1, 0.5882353, 0, 1,
-1.33197, -0.2299195, -1.1765, 1, 0.5921569, 0, 1,
-1.33175, 0.3322114, -0.6473472, 1, 0.6, 0, 1,
-1.329339, -0.3002613, -1.517362, 1, 0.6078432, 0, 1,
-1.323083, 0.3601526, -2.731596, 1, 0.6117647, 0, 1,
-1.317922, 1.179869, -1.050633, 1, 0.6196079, 0, 1,
-1.311713, -2.165469, -3.031202, 1, 0.6235294, 0, 1,
-1.284957, -1.438939, -0.2606905, 1, 0.6313726, 0, 1,
-1.284515, 0.02665116, 0.1145294, 1, 0.6352941, 0, 1,
-1.283772, -0.5134244, -0.3070555, 1, 0.6431373, 0, 1,
-1.282131, 0.2846792, -1.588091, 1, 0.6470588, 0, 1,
-1.280572, -0.7753437, -2.754852, 1, 0.654902, 0, 1,
-1.270034, 0.3856739, -2.135327, 1, 0.6588235, 0, 1,
-1.265548, 0.8985617, -1.061154, 1, 0.6666667, 0, 1,
-1.248596, 0.3278959, -1.136267, 1, 0.6705883, 0, 1,
-1.240328, -0.03133886, 0.266842, 1, 0.6784314, 0, 1,
-1.23356, 1.195716, -1.95176, 1, 0.682353, 0, 1,
-1.229841, -1.806845, -5.302445, 1, 0.6901961, 0, 1,
-1.227159, -0.2731908, -1.078835, 1, 0.6941177, 0, 1,
-1.225816, -1.298838, -3.156229, 1, 0.7019608, 0, 1,
-1.225323, 0.5108634, 0.9651841, 1, 0.7098039, 0, 1,
-1.220844, 1.100207, -2.725739, 1, 0.7137255, 0, 1,
-1.220098, 0.2957613, -1.300895, 1, 0.7215686, 0, 1,
-1.218956, -0.1209557, -2.38514, 1, 0.7254902, 0, 1,
-1.214638, 0.01502352, -2.248363, 1, 0.7333333, 0, 1,
-1.206227, -0.08971144, -1.796855, 1, 0.7372549, 0, 1,
-1.192402, -0.04117998, -0.2037319, 1, 0.7450981, 0, 1,
-1.178738, 2.139004, 0.3050806, 1, 0.7490196, 0, 1,
-1.178593, -0.1619236, -2.199598, 1, 0.7568628, 0, 1,
-1.177159, -0.5712217, -0.5117795, 1, 0.7607843, 0, 1,
-1.174781, -0.3862164, -1.507092, 1, 0.7686275, 0, 1,
-1.171731, 0.1052492, 0.3029914, 1, 0.772549, 0, 1,
-1.171563, -2.788109, -3.435274, 1, 0.7803922, 0, 1,
-1.169959, -1.901231, -2.440461, 1, 0.7843137, 0, 1,
-1.163464, -0.8571827, -3.671343, 1, 0.7921569, 0, 1,
-1.157672, 1.109252, -1.325516, 1, 0.7960784, 0, 1,
-1.155915, 0.9052004, -0.7726017, 1, 0.8039216, 0, 1,
-1.152343, -1.859341, -2.767322, 1, 0.8117647, 0, 1,
-1.152301, -0.06021345, -1.978201, 1, 0.8156863, 0, 1,
-1.144267, 0.2616296, -0.1483217, 1, 0.8235294, 0, 1,
-1.139019, -2.008748, -1.003886, 1, 0.827451, 0, 1,
-1.118967, -1.724674, -1.697813, 1, 0.8352941, 0, 1,
-1.114022, -1.652888, -3.774939, 1, 0.8392157, 0, 1,
-1.111525, -0.2991033, -2.588499, 1, 0.8470588, 0, 1,
-1.106258, 0.1255709, -1.039476, 1, 0.8509804, 0, 1,
-1.104422, -0.2983034, -1.001636, 1, 0.8588235, 0, 1,
-1.097386, -0.1680487, -3.678541, 1, 0.8627451, 0, 1,
-1.092344, -0.2544393, -1.96244, 1, 0.8705882, 0, 1,
-1.090666, 1.222524, -0.3276982, 1, 0.8745098, 0, 1,
-1.082944, -0.1381854, -3.356851, 1, 0.8823529, 0, 1,
-1.081234, -2.00916, -3.04129, 1, 0.8862745, 0, 1,
-1.077013, -1.57961, -4.415051, 1, 0.8941177, 0, 1,
-1.06746, -1.223548, -2.015133, 1, 0.8980392, 0, 1,
-1.065932, -0.7196884, -1.613214, 1, 0.9058824, 0, 1,
-1.058102, 0.7744879, 0.05773527, 1, 0.9137255, 0, 1,
-1.058071, -0.7412634, -1.957016, 1, 0.9176471, 0, 1,
-1.048216, -0.9169984, -2.397188, 1, 0.9254902, 0, 1,
-1.045157, -0.6265708, -1.549846, 1, 0.9294118, 0, 1,
-1.043431, -1.144051, -4.784577, 1, 0.9372549, 0, 1,
-1.04012, 0.6386208, -0.3832578, 1, 0.9411765, 0, 1,
-1.035723, -1.411279, -2.635252, 1, 0.9490196, 0, 1,
-1.027699, -0.3459241, -0.8300781, 1, 0.9529412, 0, 1,
-1.022896, -1.34234, -2.601773, 1, 0.9607843, 0, 1,
-1.020569, 0.6350371, -0.5560148, 1, 0.9647059, 0, 1,
-1.018856, -0.01278824, -1.368478, 1, 0.972549, 0, 1,
-1.015063, 0.8518981, -1.187539, 1, 0.9764706, 0, 1,
-1.003243, 0.2933763, 1.19582, 1, 0.9843137, 0, 1,
-1.000219, 0.238548, -3.211504, 1, 0.9882353, 0, 1,
-0.9992542, -0.1065708, -1.995851, 1, 0.9960784, 0, 1,
-0.9950465, 1.575226, -0.5927565, 0.9960784, 1, 0, 1,
-0.9746879, 1.144129, -1.45663, 0.9921569, 1, 0, 1,
-0.968565, 0.2340555, -0.9542212, 0.9843137, 1, 0, 1,
-0.9672142, -0.814921, -2.449326, 0.9803922, 1, 0, 1,
-0.9602283, -0.178023, -1.268414, 0.972549, 1, 0, 1,
-0.9601529, -0.9733165, -2.087805, 0.9686275, 1, 0, 1,
-0.9580508, -0.04230024, -0.7217066, 0.9607843, 1, 0, 1,
-0.9553636, 0.8775783, -0.4070158, 0.9568627, 1, 0, 1,
-0.9487487, 0.1114408, -0.9659729, 0.9490196, 1, 0, 1,
-0.9403607, -1.730811, -2.945591, 0.945098, 1, 0, 1,
-0.9337388, 1.993477, -0.2815925, 0.9372549, 1, 0, 1,
-0.9246429, -1.499488, -2.171077, 0.9333333, 1, 0, 1,
-0.9246327, -0.2342561, -2.617543, 0.9254902, 1, 0, 1,
-0.9182875, -0.4666512, -2.257301, 0.9215686, 1, 0, 1,
-0.9167716, 0.9175594, -2.654777, 0.9137255, 1, 0, 1,
-0.9161765, 0.4619975, -0.7027014, 0.9098039, 1, 0, 1,
-0.9148853, 0.05944107, -1.969265, 0.9019608, 1, 0, 1,
-0.9146821, 1.247063, -0.859942, 0.8941177, 1, 0, 1,
-0.9146777, 1.51573, -0.7011848, 0.8901961, 1, 0, 1,
-0.9145778, 0.4421701, -0.6007539, 0.8823529, 1, 0, 1,
-0.9135412, 2.047957, -0.09856071, 0.8784314, 1, 0, 1,
-0.9069859, 1.075509, 0.9220954, 0.8705882, 1, 0, 1,
-0.9053963, 0.242067, 1.207689, 0.8666667, 1, 0, 1,
-0.9009266, 1.304717, 1.094584, 0.8588235, 1, 0, 1,
-0.8961335, -0.7889714, -2.759862, 0.854902, 1, 0, 1,
-0.8948448, -0.8057622, -1.807966, 0.8470588, 1, 0, 1,
-0.8935189, -1.246309, -2.169167, 0.8431373, 1, 0, 1,
-0.8856185, 0.101471, -1.434277, 0.8352941, 1, 0, 1,
-0.8821921, -0.1894779, -1.615414, 0.8313726, 1, 0, 1,
-0.8783587, 1.267908, 1.494598, 0.8235294, 1, 0, 1,
-0.8769216, -0.4184918, -0.3550758, 0.8196079, 1, 0, 1,
-0.8737696, -0.2899898, -2.725338, 0.8117647, 1, 0, 1,
-0.8699697, -0.7410072, -2.708094, 0.8078431, 1, 0, 1,
-0.8678085, -0.6030349, -2.186291, 0.8, 1, 0, 1,
-0.8646072, -1.076583, -2.309842, 0.7921569, 1, 0, 1,
-0.8580101, -0.4822697, -3.333182, 0.7882353, 1, 0, 1,
-0.8527259, 1.201, -1.082278, 0.7803922, 1, 0, 1,
-0.8513639, 1.003388, -0.404395, 0.7764706, 1, 0, 1,
-0.849767, 1.735805, -0.1578801, 0.7686275, 1, 0, 1,
-0.8491056, 0.6892947, -1.481748, 0.7647059, 1, 0, 1,
-0.8460985, 0.8594629, -1.704423, 0.7568628, 1, 0, 1,
-0.8403206, -0.05803788, -1.589037, 0.7529412, 1, 0, 1,
-0.839999, -0.8290781, -3.217883, 0.7450981, 1, 0, 1,
-0.8370683, 1.383818, -1.490696, 0.7411765, 1, 0, 1,
-0.8358126, -1.121566, -2.562419, 0.7333333, 1, 0, 1,
-0.8329264, 2.430078, -0.5950088, 0.7294118, 1, 0, 1,
-0.8261311, -0.1536685, -2.480238, 0.7215686, 1, 0, 1,
-0.8249564, -1.360438, -4.300791, 0.7176471, 1, 0, 1,
-0.8221778, -0.7607823, -3.110682, 0.7098039, 1, 0, 1,
-0.8148838, 1.030439, -0.2562193, 0.7058824, 1, 0, 1,
-0.813929, 0.4606473, 0.5644538, 0.6980392, 1, 0, 1,
-0.8138596, 0.1744446, -2.115034, 0.6901961, 1, 0, 1,
-0.8122132, -0.6675108, -1.37668, 0.6862745, 1, 0, 1,
-0.8119335, 0.2974019, -1.047717, 0.6784314, 1, 0, 1,
-0.8064729, -1.119738, -1.352972, 0.6745098, 1, 0, 1,
-0.8051989, 0.0383036, -0.7136029, 0.6666667, 1, 0, 1,
-0.804249, 2.259829, -0.09075727, 0.6627451, 1, 0, 1,
-0.8029442, 1.17664, -1.123393, 0.654902, 1, 0, 1,
-0.7975343, -1.020454, -2.457145, 0.6509804, 1, 0, 1,
-0.794815, 0.2208363, -0.3006881, 0.6431373, 1, 0, 1,
-0.7902535, 1.979254, 2.524124, 0.6392157, 1, 0, 1,
-0.7883964, 0.3818535, 0.2696065, 0.6313726, 1, 0, 1,
-0.7822171, -1.826558, -3.072227, 0.627451, 1, 0, 1,
-0.7775182, 1.216814, -0.585384, 0.6196079, 1, 0, 1,
-0.7729089, -1.625232, -1.106765, 0.6156863, 1, 0, 1,
-0.769318, -0.09484558, -1.974094, 0.6078432, 1, 0, 1,
-0.7663909, 0.5782576, 0.5438178, 0.6039216, 1, 0, 1,
-0.7647771, 0.4093443, -0.05221853, 0.5960785, 1, 0, 1,
-0.7632208, 0.8498788, -1.61952, 0.5882353, 1, 0, 1,
-0.7631786, -0.9367548, -1.986822, 0.5843138, 1, 0, 1,
-0.7610568, -0.2360811, -2.046054, 0.5764706, 1, 0, 1,
-0.7575791, -0.4199214, -1.580528, 0.572549, 1, 0, 1,
-0.7440856, 0.7213946, -1.928693, 0.5647059, 1, 0, 1,
-0.7408102, 0.2475071, -1.228528, 0.5607843, 1, 0, 1,
-0.7367636, -0.2147068, -2.690131, 0.5529412, 1, 0, 1,
-0.7277801, 0.09822877, 0.1905328, 0.5490196, 1, 0, 1,
-0.727235, -0.1204322, -1.424289, 0.5411765, 1, 0, 1,
-0.72576, 0.6896854, -1.16037, 0.5372549, 1, 0, 1,
-0.7247201, 0.3086928, -1.470045, 0.5294118, 1, 0, 1,
-0.7228949, 0.54579, -1.351655, 0.5254902, 1, 0, 1,
-0.7079501, -0.2083348, -0.8801984, 0.5176471, 1, 0, 1,
-0.7066942, 1.375906, 1.072973, 0.5137255, 1, 0, 1,
-0.7049605, -1.417711, -2.142966, 0.5058824, 1, 0, 1,
-0.7012273, 1.955257, -1.847003, 0.5019608, 1, 0, 1,
-0.7000323, -1.906492, -3.366617, 0.4941176, 1, 0, 1,
-0.6933278, -0.315369, -1.237481, 0.4862745, 1, 0, 1,
-0.6930823, 0.1088504, -2.050233, 0.4823529, 1, 0, 1,
-0.6898892, -0.4560667, -1.803638, 0.4745098, 1, 0, 1,
-0.6897308, -0.1544212, -2.923541, 0.4705882, 1, 0, 1,
-0.6876217, 1.007784, -0.6831967, 0.4627451, 1, 0, 1,
-0.6863887, -0.06766623, -1.806662, 0.4588235, 1, 0, 1,
-0.6862394, 1.395475, -0.07452262, 0.4509804, 1, 0, 1,
-0.6844149, -0.06191707, -3.11648, 0.4470588, 1, 0, 1,
-0.6839389, 0.3249877, -0.6290554, 0.4392157, 1, 0, 1,
-0.6838099, 0.03803791, -2.57421, 0.4352941, 1, 0, 1,
-0.6818594, 0.2207474, -1.591694, 0.427451, 1, 0, 1,
-0.6780232, 0.3671226, -1.171226, 0.4235294, 1, 0, 1,
-0.6755033, -1.711802, -2.78617, 0.4156863, 1, 0, 1,
-0.6745372, 1.613508, -1.484718, 0.4117647, 1, 0, 1,
-0.6718297, 0.8424383, -1.221766, 0.4039216, 1, 0, 1,
-0.6709353, 1.12646, -0.7597327, 0.3960784, 1, 0, 1,
-0.665922, -0.5740758, -1.656428, 0.3921569, 1, 0, 1,
-0.6629392, -1.921022, -2.884144, 0.3843137, 1, 0, 1,
-0.6621253, -0.2395852, -2.847752, 0.3803922, 1, 0, 1,
-0.6576864, -0.922778, -2.704607, 0.372549, 1, 0, 1,
-0.6567431, -1.060416, -3.625932, 0.3686275, 1, 0, 1,
-0.6542434, 0.844995, -0.490997, 0.3607843, 1, 0, 1,
-0.6481719, 0.4900485, -2.343314, 0.3568628, 1, 0, 1,
-0.6476923, -2.352485, -3.69256, 0.3490196, 1, 0, 1,
-0.6450594, 1.120598, -0.7389323, 0.345098, 1, 0, 1,
-0.6318229, 2.709717, 0.5221468, 0.3372549, 1, 0, 1,
-0.62386, -1.003868, -0.5178051, 0.3333333, 1, 0, 1,
-0.6238048, 2.888229, -0.6366983, 0.3254902, 1, 0, 1,
-0.61831, -0.3261296, -2.238495, 0.3215686, 1, 0, 1,
-0.6170338, -0.5357718, -1.094791, 0.3137255, 1, 0, 1,
-0.6162655, 0.3409061, 0.2672584, 0.3098039, 1, 0, 1,
-0.6073589, 0.9865856, -0.3084998, 0.3019608, 1, 0, 1,
-0.6034303, -0.7466597, -1.903681, 0.2941177, 1, 0, 1,
-0.60273, -0.9511215, -1.777942, 0.2901961, 1, 0, 1,
-0.6018402, -0.6421389, -3.221443, 0.282353, 1, 0, 1,
-0.6005923, 0.5454533, -0.1604879, 0.2784314, 1, 0, 1,
-0.5988942, -1.113726, -2.782416, 0.2705882, 1, 0, 1,
-0.5960487, 0.7666796, -0.9362044, 0.2666667, 1, 0, 1,
-0.5946047, 1.776798, -0.07948871, 0.2588235, 1, 0, 1,
-0.5871285, -0.5905885, -1.689538, 0.254902, 1, 0, 1,
-0.5856955, 0.7034572, -1.623905, 0.2470588, 1, 0, 1,
-0.5840648, -0.7224535, -3.144529, 0.2431373, 1, 0, 1,
-0.5755467, -3.684683, -2.2295, 0.2352941, 1, 0, 1,
-0.5706763, 0.5464587, -2.99301, 0.2313726, 1, 0, 1,
-0.5706212, -0.6767938, -3.399235, 0.2235294, 1, 0, 1,
-0.5657998, -0.6731768, -3.111169, 0.2196078, 1, 0, 1,
-0.5638736, 0.8524816, -0.8843851, 0.2117647, 1, 0, 1,
-0.5608764, -1.515089, -3.44315, 0.2078431, 1, 0, 1,
-0.5577487, -0.4244205, -0.4082838, 0.2, 1, 0, 1,
-0.5542315, -0.658059, -1.317434, 0.1921569, 1, 0, 1,
-0.5514526, -1.566335, -3.76334, 0.1882353, 1, 0, 1,
-0.546075, -0.3737225, -2.644619, 0.1803922, 1, 0, 1,
-0.5451254, -0.6749811, -2.984207, 0.1764706, 1, 0, 1,
-0.5435159, 1.17475, -0.499127, 0.1686275, 1, 0, 1,
-0.541056, -0.9580188, -3.375488, 0.1647059, 1, 0, 1,
-0.5403004, -0.07909226, -2.572712, 0.1568628, 1, 0, 1,
-0.5378873, -1.535617, -2.442688, 0.1529412, 1, 0, 1,
-0.5336578, -0.8021308, -3.911191, 0.145098, 1, 0, 1,
-0.5308372, -2.026574, -3.852102, 0.1411765, 1, 0, 1,
-0.5293339, 0.6087285, 0.635873, 0.1333333, 1, 0, 1,
-0.5287083, 2.15357, -0.3117298, 0.1294118, 1, 0, 1,
-0.5257329, -1.218493, -2.411062, 0.1215686, 1, 0, 1,
-0.5254008, -1.279806, -0.7356911, 0.1176471, 1, 0, 1,
-0.5224184, 0.4239119, -1.652449, 0.1098039, 1, 0, 1,
-0.5194609, 0.3872028, -2.330978, 0.1058824, 1, 0, 1,
-0.5188908, 0.1431862, 0.4773364, 0.09803922, 1, 0, 1,
-0.5168696, -0.5365753, -1.464939, 0.09019608, 1, 0, 1,
-0.5108442, 0.429883, 0.1407663, 0.08627451, 1, 0, 1,
-0.5105363, 0.6400915, -1.73534, 0.07843138, 1, 0, 1,
-0.5088271, -1.548036, -1.588966, 0.07450981, 1, 0, 1,
-0.5083616, -0.2882665, -2.296668, 0.06666667, 1, 0, 1,
-0.493778, 0.6226836, -0.6256021, 0.0627451, 1, 0, 1,
-0.4935351, -1.107061, -1.492417, 0.05490196, 1, 0, 1,
-0.4877251, -0.2782871, -0.7671447, 0.05098039, 1, 0, 1,
-0.4834626, 0.03313705, -2.323, 0.04313726, 1, 0, 1,
-0.4722824, -0.7512416, -1.49838, 0.03921569, 1, 0, 1,
-0.4720764, 0.1440474, -1.913392, 0.03137255, 1, 0, 1,
-0.4709302, 1.303625, 2.426577, 0.02745098, 1, 0, 1,
-0.4705968, 1.155413, -2.076972, 0.01960784, 1, 0, 1,
-0.4686691, -1.601106, -2.698632, 0.01568628, 1, 0, 1,
-0.4686503, 0.08385311, -1.449118, 0.007843138, 1, 0, 1,
-0.4674612, 2.41265, -2.001693, 0.003921569, 1, 0, 1,
-0.4661469, 1.176148, -0.6907704, 0, 1, 0.003921569, 1,
-0.4657152, 1.107944, -0.3108041, 0, 1, 0.01176471, 1,
-0.4634948, 1.424734, 1.818268, 0, 1, 0.01568628, 1,
-0.4621243, 0.6638287, 0.07382168, 0, 1, 0.02352941, 1,
-0.4591461, 0.5098293, 0.05564704, 0, 1, 0.02745098, 1,
-0.4589115, -0.4445218, -2.536752, 0, 1, 0.03529412, 1,
-0.4536622, 0.6908725, 0.489798, 0, 1, 0.03921569, 1,
-0.4529276, -0.5266829, -4.013598, 0, 1, 0.04705882, 1,
-0.452401, 0.2032316, -3.309658, 0, 1, 0.05098039, 1,
-0.4496569, 0.3825056, -1.732565, 0, 1, 0.05882353, 1,
-0.4453157, 0.2540993, -2.068987, 0, 1, 0.0627451, 1,
-0.4391518, 0.03133633, -1.157781, 0, 1, 0.07058824, 1,
-0.4371957, -1.217932, -3.40516, 0, 1, 0.07450981, 1,
-0.4350057, 0.9092906, -0.1702265, 0, 1, 0.08235294, 1,
-0.426938, 0.157143, -1.394138, 0, 1, 0.08627451, 1,
-0.4213813, -0.8158727, -4.308495, 0, 1, 0.09411765, 1,
-0.4183379, 0.0182659, -0.3243887, 0, 1, 0.1019608, 1,
-0.4177373, 0.5365207, 0.277827, 0, 1, 0.1058824, 1,
-0.4176556, -0.5888346, -1.393099, 0, 1, 0.1137255, 1,
-0.4171878, 0.7779391, -1.707892, 0, 1, 0.1176471, 1,
-0.4165978, 1.266472, -1.131375, 0, 1, 0.1254902, 1,
-0.4161648, 0.3889776, -0.2246892, 0, 1, 0.1294118, 1,
-0.4102, -0.3734693, -2.945392, 0, 1, 0.1372549, 1,
-0.4095616, -1.339092, -3.9911, 0, 1, 0.1411765, 1,
-0.4071428, -1.118098, -4.311704, 0, 1, 0.1490196, 1,
-0.4063926, -1.57142, -3.214425, 0, 1, 0.1529412, 1,
-0.4014886, 0.006503933, -0.711171, 0, 1, 0.1607843, 1,
-0.4011279, -1.243051, -3.402716, 0, 1, 0.1647059, 1,
-0.3988868, -1.227154, -4.424181, 0, 1, 0.172549, 1,
-0.3904148, 1.640379, -1.623533, 0, 1, 0.1764706, 1,
-0.388844, -0.5703813, -3.284297, 0, 1, 0.1843137, 1,
-0.3869705, -0.423506, -1.494404, 0, 1, 0.1882353, 1,
-0.385954, 0.1042894, 0.2855132, 0, 1, 0.1960784, 1,
-0.3843254, -0.303853, -2.763777, 0, 1, 0.2039216, 1,
-0.3838732, -1.080843, -2.414427, 0, 1, 0.2078431, 1,
-0.3810975, 0.7330943, -1.535144, 0, 1, 0.2156863, 1,
-0.3809455, -0.4466793, -2.741532, 0, 1, 0.2196078, 1,
-0.3779209, 0.6530074, 0.4752792, 0, 1, 0.227451, 1,
-0.3736615, -0.668415, -3.144919, 0, 1, 0.2313726, 1,
-0.3697929, -0.2297626, -2.235366, 0, 1, 0.2392157, 1,
-0.3645528, 0.7657167, 0.4948611, 0, 1, 0.2431373, 1,
-0.3588983, 1.026517, 0.4124411, 0, 1, 0.2509804, 1,
-0.3575513, -0.2556545, -3.378382, 0, 1, 0.254902, 1,
-0.3532288, 0.1765558, -0.5963323, 0, 1, 0.2627451, 1,
-0.347402, 0.845694, -1.062922, 0, 1, 0.2666667, 1,
-0.345084, 0.7104405, 0.01425783, 0, 1, 0.2745098, 1,
-0.3443486, -0.7559329, -1.745429, 0, 1, 0.2784314, 1,
-0.3422781, -1.570883, -1.743504, 0, 1, 0.2862745, 1,
-0.3415312, -0.3710306, -0.892253, 0, 1, 0.2901961, 1,
-0.3339722, -0.8481606, -1.835166, 0, 1, 0.2980392, 1,
-0.3322561, -0.4689998, -0.8412745, 0, 1, 0.3058824, 1,
-0.3294374, 0.8833893, 1.076096, 0, 1, 0.3098039, 1,
-0.3258026, 1.932351, 0.7949588, 0, 1, 0.3176471, 1,
-0.3184633, 0.1205854, 1.368882, 0, 1, 0.3215686, 1,
-0.317334, -0.3979627, -3.730744, 0, 1, 0.3294118, 1,
-0.3129512, 1.285129, -1.667067, 0, 1, 0.3333333, 1,
-0.3125807, 0.2164053, 1.587098, 0, 1, 0.3411765, 1,
-0.3089624, -1.439739, -3.847061, 0, 1, 0.345098, 1,
-0.3067804, -1.697918, -5.05332, 0, 1, 0.3529412, 1,
-0.3067359, -0.6458732, -2.614452, 0, 1, 0.3568628, 1,
-0.3059785, -0.619791, -1.98407, 0, 1, 0.3647059, 1,
-0.3038268, 0.7578403, 0.9912633, 0, 1, 0.3686275, 1,
-0.2984385, 1.716944, 0.9715546, 0, 1, 0.3764706, 1,
-0.2963258, 0.2536522, -1.17101, 0, 1, 0.3803922, 1,
-0.2955174, -1.373845, -4.023024, 0, 1, 0.3882353, 1,
-0.2895822, -1.436056, -3.698584, 0, 1, 0.3921569, 1,
-0.2829023, 0.08396062, 0.3507997, 0, 1, 0.4, 1,
-0.2810496, 0.5440535, 0.830612, 0, 1, 0.4078431, 1,
-0.2774062, -0.1225566, 0.1716423, 0, 1, 0.4117647, 1,
-0.2750185, 0.3400396, -1.627701, 0, 1, 0.4196078, 1,
-0.2735319, 1.751036, 0.8508459, 0, 1, 0.4235294, 1,
-0.2718104, 0.424141, -1.202682, 0, 1, 0.4313726, 1,
-0.2655746, -1.070627, -1.496474, 0, 1, 0.4352941, 1,
-0.2620632, -2.28087, -3.383124, 0, 1, 0.4431373, 1,
-0.2614114, 0.08592218, -1.817541, 0, 1, 0.4470588, 1,
-0.2586319, 0.681918, -1.361004, 0, 1, 0.454902, 1,
-0.2580041, -2.399544, -1.764817, 0, 1, 0.4588235, 1,
-0.2566186, 1.497118, 0.3717563, 0, 1, 0.4666667, 1,
-0.2548138, 1.400586, 1.505157, 0, 1, 0.4705882, 1,
-0.2461322, 0.654156, 0.846435, 0, 1, 0.4784314, 1,
-0.2438727, 0.6119637, 0.3867234, 0, 1, 0.4823529, 1,
-0.2434858, -1.693583, -3.751517, 0, 1, 0.4901961, 1,
-0.2426755, -1.088914, -1.131485, 0, 1, 0.4941176, 1,
-0.239592, -0.6648883, -1.784269, 0, 1, 0.5019608, 1,
-0.2346719, -0.05110859, 1.050152, 0, 1, 0.509804, 1,
-0.2340564, 0.1251112, -0.9134018, 0, 1, 0.5137255, 1,
-0.2317545, -0.816395, -2.806219, 0, 1, 0.5215687, 1,
-0.2286821, -0.1017697, -2.083035, 0, 1, 0.5254902, 1,
-0.2266364, 0.7143861, 0.8450072, 0, 1, 0.5333334, 1,
-0.2253862, -0.0522063, -0.84852, 0, 1, 0.5372549, 1,
-0.2211405, -0.9229588, -2.769213, 0, 1, 0.5450981, 1,
-0.2140862, -1.086474, -2.168104, 0, 1, 0.5490196, 1,
-0.2132388, -0.9862238, -3.45888, 0, 1, 0.5568628, 1,
-0.2121845, 0.2083551, -0.5215187, 0, 1, 0.5607843, 1,
-0.211979, -0.5185546, -1.054416, 0, 1, 0.5686275, 1,
-0.2112234, 1.114222, 0.6090069, 0, 1, 0.572549, 1,
-0.2046629, 1.076292, -0.9248492, 0, 1, 0.5803922, 1,
-0.203436, 0.679413, -1.486948, 0, 1, 0.5843138, 1,
-0.202048, 0.8164233, -0.02991911, 0, 1, 0.5921569, 1,
-0.1974491, -0.4946343, -2.709665, 0, 1, 0.5960785, 1,
-0.1955767, 2.30642, 0.4479176, 0, 1, 0.6039216, 1,
-0.1933462, -0.3084995, -2.249106, 0, 1, 0.6117647, 1,
-0.1922258, 1.669993, -0.9271906, 0, 1, 0.6156863, 1,
-0.191547, -0.6127508, -3.01474, 0, 1, 0.6235294, 1,
-0.1899717, 0.3777981, -0.4849716, 0, 1, 0.627451, 1,
-0.1899335, -0.9653884, -3.942481, 0, 1, 0.6352941, 1,
-0.1891766, -0.5432174, -3.435558, 0, 1, 0.6392157, 1,
-0.1886133, -0.4470824, -3.183792, 0, 1, 0.6470588, 1,
-0.1881093, 0.7287796, 0.9998336, 0, 1, 0.6509804, 1,
-0.184383, -0.135658, -1.316834, 0, 1, 0.6588235, 1,
-0.1836654, 1.247536, 1.164039, 0, 1, 0.6627451, 1,
-0.1818998, -0.9837743, -1.975761, 0, 1, 0.6705883, 1,
-0.1782143, -0.4223005, -1.384908, 0, 1, 0.6745098, 1,
-0.1738006, 0.4394125, -0.07914339, 0, 1, 0.682353, 1,
-0.1729276, 0.1206549, 0.7795311, 0, 1, 0.6862745, 1,
-0.1729145, 0.557173, -0.6032779, 0, 1, 0.6941177, 1,
-0.1679786, 1.447222, 1.476512, 0, 1, 0.7019608, 1,
-0.1669914, 0.3550762, -0.274677, 0, 1, 0.7058824, 1,
-0.1613201, 1.288368, -1.782044, 0, 1, 0.7137255, 1,
-0.1611629, -1.571358, -1.835876, 0, 1, 0.7176471, 1,
-0.1603621, -1.04781, -3.160607, 0, 1, 0.7254902, 1,
-0.149667, 0.2197314, 0.3288713, 0, 1, 0.7294118, 1,
-0.1455368, 1.004988, 0.8045598, 0, 1, 0.7372549, 1,
-0.1432565, 1.074023, -1.213725, 0, 1, 0.7411765, 1,
-0.1424108, -0.7154434, -3.551634, 0, 1, 0.7490196, 1,
-0.1416917, 1.440418, -0.03725488, 0, 1, 0.7529412, 1,
-0.1407529, -0.3851942, -3.480458, 0, 1, 0.7607843, 1,
-0.1370884, 0.4257568, -0.8103908, 0, 1, 0.7647059, 1,
-0.1332395, -0.4211496, -1.711424, 0, 1, 0.772549, 1,
-0.1320959, 1.356183, -0.4961629, 0, 1, 0.7764706, 1,
-0.1319116, 0.673988, -0.5421118, 0, 1, 0.7843137, 1,
-0.1314834, 1.050894, -0.6813955, 0, 1, 0.7882353, 1,
-0.1301183, -0.4359988, -1.832461, 0, 1, 0.7960784, 1,
-0.1278737, -1.819214, -2.228078, 0, 1, 0.8039216, 1,
-0.1276222, -1.176917, -3.194111, 0, 1, 0.8078431, 1,
-0.1273383, 0.2694461, -0.8497227, 0, 1, 0.8156863, 1,
-0.1265453, -0.6386657, -2.234698, 0, 1, 0.8196079, 1,
-0.1222587, 0.5749609, -3.272221, 0, 1, 0.827451, 1,
-0.1218836, -1.344073, -2.816499, 0, 1, 0.8313726, 1,
-0.1214666, -1.05378, -2.922108, 0, 1, 0.8392157, 1,
-0.1188813, 1.353983, 0.6376686, 0, 1, 0.8431373, 1,
-0.1184221, -0.2740355, -3.520286, 0, 1, 0.8509804, 1,
-0.1171825, 0.431931, -1.101398, 0, 1, 0.854902, 1,
-0.1143348, -0.5593606, -2.322151, 0, 1, 0.8627451, 1,
-0.1132056, 0.9136652, -0.4970941, 0, 1, 0.8666667, 1,
-0.1115803, -1.003634, -3.744105, 0, 1, 0.8745098, 1,
-0.1057602, 0.8297873, -0.3653701, 0, 1, 0.8784314, 1,
-0.1034397, -1.946155, -3.102491, 0, 1, 0.8862745, 1,
-0.1028454, -0.8777956, -1.662634, 0, 1, 0.8901961, 1,
-0.1014193, 0.4759569, 1.341206, 0, 1, 0.8980392, 1,
-0.1013273, -0.6596715, -3.468394, 0, 1, 0.9058824, 1,
-0.09993405, -1.247917, -3.023572, 0, 1, 0.9098039, 1,
-0.09831876, 0.6546156, -0.1241274, 0, 1, 0.9176471, 1,
-0.08748928, 2.159049, -0.6509099, 0, 1, 0.9215686, 1,
-0.08319976, 0.7400109, -0.9390568, 0, 1, 0.9294118, 1,
-0.08287036, -0.8103426, -2.637598, 0, 1, 0.9333333, 1,
-0.07954007, -0.8298159, -4.161743, 0, 1, 0.9411765, 1,
-0.07675853, 0.9951204, -1.73655, 0, 1, 0.945098, 1,
-0.07096227, 0.306996, -1.29452, 0, 1, 0.9529412, 1,
-0.06980379, -0.09292894, -2.578637, 0, 1, 0.9568627, 1,
-0.06868728, 2.354597, 0.6494048, 0, 1, 0.9647059, 1,
-0.06805249, -1.070408, -3.550383, 0, 1, 0.9686275, 1,
-0.06362583, 0.4146533, 1.621352, 0, 1, 0.9764706, 1,
-0.06317516, -0.5744044, -3.317936, 0, 1, 0.9803922, 1,
-0.05739864, -0.3766154, -2.082312, 0, 1, 0.9882353, 1,
-0.05362388, 1.64933, 2.19073, 0, 1, 0.9921569, 1,
-0.05125974, -0.4820496, -3.04865, 0, 1, 1, 1,
-0.05060338, 1.631834, -0.3863254, 0, 0.9921569, 1, 1,
-0.04774356, -1.378583, -1.911469, 0, 0.9882353, 1, 1,
-0.04743795, 0.7846855, -0.3939245, 0, 0.9803922, 1, 1,
-0.04736954, -0.836822, -4.032162, 0, 0.9764706, 1, 1,
-0.0416704, -0.9686457, -3.32611, 0, 0.9686275, 1, 1,
-0.04046228, -0.8440552, -4.127962, 0, 0.9647059, 1, 1,
-0.03922807, -0.005847326, -2.247626, 0, 0.9568627, 1, 1,
-0.03850241, -1.524266, -3.244032, 0, 0.9529412, 1, 1,
-0.03819289, -0.06057428, -3.072538, 0, 0.945098, 1, 1,
-0.03472508, -0.4871356, -4.504251, 0, 0.9411765, 1, 1,
-0.0252003, -1.674966, -4.677447, 0, 0.9333333, 1, 1,
-0.02205092, 0.1790588, 0.2536815, 0, 0.9294118, 1, 1,
-0.02189302, 1.792484, 1.818573, 0, 0.9215686, 1, 1,
-0.01429356, 0.2492369, 2.17679, 0, 0.9176471, 1, 1,
-0.01387407, -1.06502, -2.549906, 0, 0.9098039, 1, 1,
-0.01337324, -2.21073, -3.065673, 0, 0.9058824, 1, 1,
-0.01221141, 1.568736, -0.4601974, 0, 0.8980392, 1, 1,
-0.01165178, 0.6432327, -0.9332116, 0, 0.8901961, 1, 1,
-0.01146449, 0.05117543, 1.375366, 0, 0.8862745, 1, 1,
-0.009634724, 0.4858108, -1.727602, 0, 0.8784314, 1, 1,
-0.008690321, -1.863909, -4.794204, 0, 0.8745098, 1, 1,
-0.007888354, -0.9675481, -1.909782, 0, 0.8666667, 1, 1,
-0.006889948, -0.3076009, -2.525841, 0, 0.8627451, 1, 1,
-0.005296439, -0.1074593, -2.049262, 0, 0.854902, 1, 1,
0.001382857, 0.05287249, 0.1552017, 0, 0.8509804, 1, 1,
0.001560222, -0.4601701, 3.327063, 0, 0.8431373, 1, 1,
0.001812054, -0.08848604, 4.303832, 0, 0.8392157, 1, 1,
0.005363069, -0.7751638, 2.734011, 0, 0.8313726, 1, 1,
0.01238785, -1.176914, 2.250027, 0, 0.827451, 1, 1,
0.01988484, 0.2699825, -0.2644541, 0, 0.8196079, 1, 1,
0.01989121, -0.7829241, 2.873784, 0, 0.8156863, 1, 1,
0.02298182, 2.117524, 0.4612055, 0, 0.8078431, 1, 1,
0.02714276, 0.1257144, 0.7478686, 0, 0.8039216, 1, 1,
0.03565901, -0.4192386, 3.1003, 0, 0.7960784, 1, 1,
0.03603744, -0.11492, 2.746746, 0, 0.7882353, 1, 1,
0.0360517, -2.078249, 3.248951, 0, 0.7843137, 1, 1,
0.03743106, -0.5335823, 2.537853, 0, 0.7764706, 1, 1,
0.03908478, 2.15761, 1.360898, 0, 0.772549, 1, 1,
0.04586228, 0.9635563, -0.7547002, 0, 0.7647059, 1, 1,
0.04724303, 1.240617, 1.10055, 0, 0.7607843, 1, 1,
0.04980288, 0.7987235, -0.1697934, 0, 0.7529412, 1, 1,
0.05071698, -0.756507, 3.060381, 0, 0.7490196, 1, 1,
0.05597975, -1.519976, 2.398395, 0, 0.7411765, 1, 1,
0.05880778, -0.9292505, 1.194743, 0, 0.7372549, 1, 1,
0.05903212, -0.7632865, 4.115287, 0, 0.7294118, 1, 1,
0.05976751, -0.9528639, 2.542421, 0, 0.7254902, 1, 1,
0.05988909, -1.806743, 4.218374, 0, 0.7176471, 1, 1,
0.06237547, 0.0170581, 0.3791195, 0, 0.7137255, 1, 1,
0.06443006, -1.195659, 3.050797, 0, 0.7058824, 1, 1,
0.06581324, 0.5578831, 0.7798318, 0, 0.6980392, 1, 1,
0.06693882, 1.890666, -0.9901078, 0, 0.6941177, 1, 1,
0.06724164, 0.4076829, 0.4421966, 0, 0.6862745, 1, 1,
0.07215022, -0.2492937, 2.248092, 0, 0.682353, 1, 1,
0.07364275, -0.3726064, 1.506065, 0, 0.6745098, 1, 1,
0.07424027, 0.8430477, 0.8161262, 0, 0.6705883, 1, 1,
0.07542463, 1.064462, -0.183841, 0, 0.6627451, 1, 1,
0.07799672, 0.3960725, 0.02550933, 0, 0.6588235, 1, 1,
0.07804652, 0.02945475, 0.7348925, 0, 0.6509804, 1, 1,
0.08191235, 0.4057544, -0.7105882, 0, 0.6470588, 1, 1,
0.08302914, -2.026197, 2.648494, 0, 0.6392157, 1, 1,
0.08766331, -0.6377214, 5.231984, 0, 0.6352941, 1, 1,
0.08935358, -0.03496964, 4.412279, 0, 0.627451, 1, 1,
0.08948815, 0.3010083, 1.075534, 0, 0.6235294, 1, 1,
0.089505, -0.6983126, 2.817122, 0, 0.6156863, 1, 1,
0.08961215, 0.5495248, -1.045277, 0, 0.6117647, 1, 1,
0.09237264, -1.398187, 2.935136, 0, 0.6039216, 1, 1,
0.09527949, 0.0927403, -0.225058, 0, 0.5960785, 1, 1,
0.09736785, -1.156252, 4.412729, 0, 0.5921569, 1, 1,
0.1016296, -0.1312188, 4.432907, 0, 0.5843138, 1, 1,
0.1025932, -0.6136647, 2.820571, 0, 0.5803922, 1, 1,
0.1032952, 0.1107886, -0.1680358, 0, 0.572549, 1, 1,
0.1038386, 0.9440105, -0.7355253, 0, 0.5686275, 1, 1,
0.1040959, 0.6850468, -0.07799707, 0, 0.5607843, 1, 1,
0.1049958, 0.1281803, 0.1176496, 0, 0.5568628, 1, 1,
0.1084336, -0.6148301, 1.601088, 0, 0.5490196, 1, 1,
0.1086693, -0.9219967, 2.475717, 0, 0.5450981, 1, 1,
0.1124618, -0.2620079, 1.832297, 0, 0.5372549, 1, 1,
0.1133814, 0.5069869, 0.1049109, 0, 0.5333334, 1, 1,
0.1153025, -1.008814, 2.959719, 0, 0.5254902, 1, 1,
0.1153071, 0.1405995, 0.2586344, 0, 0.5215687, 1, 1,
0.1177443, 0.007895543, 2.000046, 0, 0.5137255, 1, 1,
0.1192575, -1.643469, 2.98857, 0, 0.509804, 1, 1,
0.1264402, 1.348776, -0.188443, 0, 0.5019608, 1, 1,
0.1293353, -0.3954976, 4.610704, 0, 0.4941176, 1, 1,
0.1314884, -0.3628326, 1.678744, 0, 0.4901961, 1, 1,
0.1401366, 0.9880002, 0.8978623, 0, 0.4823529, 1, 1,
0.1419265, -0.2228374, 1.567189, 0, 0.4784314, 1, 1,
0.1432919, -0.669035, 2.685226, 0, 0.4705882, 1, 1,
0.1447591, 0.02007667, -0.2656613, 0, 0.4666667, 1, 1,
0.1467839, 1.788288, -0.3393069, 0, 0.4588235, 1, 1,
0.1485644, 1.099597, 1.41625, 0, 0.454902, 1, 1,
0.149102, 0.4667816, -0.7954257, 0, 0.4470588, 1, 1,
0.1520905, 2.229684, 0.01492721, 0, 0.4431373, 1, 1,
0.1527958, 0.1608006, 0.5941051, 0, 0.4352941, 1, 1,
0.1534396, -0.3510753, 2.093465, 0, 0.4313726, 1, 1,
0.1559548, 0.9028181, -0.9211844, 0, 0.4235294, 1, 1,
0.1576623, -0.7080537, 3.742733, 0, 0.4196078, 1, 1,
0.1605459, -0.1267294, 0.8897762, 0, 0.4117647, 1, 1,
0.1607625, 0.7651086, -0.8972083, 0, 0.4078431, 1, 1,
0.1633764, -0.4941373, 3.355698, 0, 0.4, 1, 1,
0.163843, -0.7980408, 1.877725, 0, 0.3921569, 1, 1,
0.164494, -0.187024, 1.553591, 0, 0.3882353, 1, 1,
0.1665995, 0.03576272, 1.461941, 0, 0.3803922, 1, 1,
0.1678716, 1.912109, 3.119365, 0, 0.3764706, 1, 1,
0.1681789, -0.4871044, 3.212555, 0, 0.3686275, 1, 1,
0.1682831, -1.780875, 3.762042, 0, 0.3647059, 1, 1,
0.1691993, 0.05264209, 0.1728163, 0, 0.3568628, 1, 1,
0.1695772, -1.265741, 4.236067, 0, 0.3529412, 1, 1,
0.1714559, 0.407819, 0.7429871, 0, 0.345098, 1, 1,
0.1726447, -0.001615839, 1.839709, 0, 0.3411765, 1, 1,
0.1731185, 0.2743336, -1.960534, 0, 0.3333333, 1, 1,
0.1759033, -0.7956594, 3.999048, 0, 0.3294118, 1, 1,
0.1802729, 0.3474154, 1.979243, 0, 0.3215686, 1, 1,
0.1812577, 2.092441, -0.1487144, 0, 0.3176471, 1, 1,
0.1819438, -0.5287517, 1.617362, 0, 0.3098039, 1, 1,
0.183245, 0.344196, -0.9482781, 0, 0.3058824, 1, 1,
0.1855306, -0.5742514, 3.719453, 0, 0.2980392, 1, 1,
0.1945199, -0.5659659, 1.315215, 0, 0.2901961, 1, 1,
0.196982, -0.8057249, 3.606411, 0, 0.2862745, 1, 1,
0.1987559, -0.5619065, 2.849053, 0, 0.2784314, 1, 1,
0.2021666, 1.390732, 0.8158941, 0, 0.2745098, 1, 1,
0.2078488, 0.8445841, -1.340521, 0, 0.2666667, 1, 1,
0.2092039, 1.295201, 1.950607, 0, 0.2627451, 1, 1,
0.213968, -0.4626272, 0.7575688, 0, 0.254902, 1, 1,
0.2146012, -0.1762833, 0.1679005, 0, 0.2509804, 1, 1,
0.2193827, 0.06292876, 2.452663, 0, 0.2431373, 1, 1,
0.2211518, 1.248532, 0.6884034, 0, 0.2392157, 1, 1,
0.2220174, -0.2177285, 1.815985, 0, 0.2313726, 1, 1,
0.2243353, 0.1325055, 2.209844, 0, 0.227451, 1, 1,
0.2280769, 0.3822649, -0.3515166, 0, 0.2196078, 1, 1,
0.2356827, 1.266205, 0.5993201, 0, 0.2156863, 1, 1,
0.2386611, 0.388, 1.634227, 0, 0.2078431, 1, 1,
0.241585, 0.3524292, 2.135875, 0, 0.2039216, 1, 1,
0.2432934, -1.55122, 3.391475, 0, 0.1960784, 1, 1,
0.2457583, -1.344928, 3.677649, 0, 0.1882353, 1, 1,
0.2460739, -1.011236, 1.956353, 0, 0.1843137, 1, 1,
0.2470977, 1.382394, -0.1649978, 0, 0.1764706, 1, 1,
0.2524134, 0.2538998, 1.42932, 0, 0.172549, 1, 1,
0.2528425, -0.0351025, 0.6745564, 0, 0.1647059, 1, 1,
0.2592054, 0.3127448, -0.1252378, 0, 0.1607843, 1, 1,
0.261374, 0.7775258, 0.6022136, 0, 0.1529412, 1, 1,
0.2635898, -0.3931415, 2.242179, 0, 0.1490196, 1, 1,
0.2649983, -1.280834, 1.657871, 0, 0.1411765, 1, 1,
0.2653223, -0.2995473, 3.102045, 0, 0.1372549, 1, 1,
0.2676307, 0.3745091, -0.1953725, 0, 0.1294118, 1, 1,
0.2702502, -0.3640547, 0.9988641, 0, 0.1254902, 1, 1,
0.270523, -0.7083982, 4.73874, 0, 0.1176471, 1, 1,
0.2814654, 0.07148509, 0.9821325, 0, 0.1137255, 1, 1,
0.282079, 2.032095, 0.2018816, 0, 0.1058824, 1, 1,
0.2821981, 0.2719965, -1.144634, 0, 0.09803922, 1, 1,
0.285069, 1.21495, 0.4336232, 0, 0.09411765, 1, 1,
0.2923299, 0.3410992, 0.8519733, 0, 0.08627451, 1, 1,
0.298077, 1.372918, 1.449076, 0, 0.08235294, 1, 1,
0.3029947, 1.057, -0.2467711, 0, 0.07450981, 1, 1,
0.3070886, -0.8085394, 2.389783, 0, 0.07058824, 1, 1,
0.3073888, -0.4039644, 4.3476, 0, 0.0627451, 1, 1,
0.3074499, 1.462362, 1.613957, 0, 0.05882353, 1, 1,
0.3102746, 0.8357934, 1.153097, 0, 0.05098039, 1, 1,
0.3126142, -1.570122, 1.466776, 0, 0.04705882, 1, 1,
0.315199, -0.03460172, 1.273305, 0, 0.03921569, 1, 1,
0.3180009, 0.661621, 2.49781, 0, 0.03529412, 1, 1,
0.3188043, -0.7695048, 3.332951, 0, 0.02745098, 1, 1,
0.3220269, -0.1371711, 0.9162723, 0, 0.02352941, 1, 1,
0.3241256, -1.62269, 1.473607, 0, 0.01568628, 1, 1,
0.3246314, 0.9812779, 0.5673124, 0, 0.01176471, 1, 1,
0.327448, 0.4027328, 0.929333, 0, 0.003921569, 1, 1,
0.3308336, 0.114111, 0.7803229, 0.003921569, 0, 1, 1,
0.3329467, 1.032748, 0.4272754, 0.007843138, 0, 1, 1,
0.3346725, 1.390658, 0.2455635, 0.01568628, 0, 1, 1,
0.3384843, -0.02447791, 2.840858, 0.01960784, 0, 1, 1,
0.3432881, -0.3338755, 1.756051, 0.02745098, 0, 1, 1,
0.3464665, -1.467305, 1.678612, 0.03137255, 0, 1, 1,
0.3519873, 0.7758214, 2.409387, 0.03921569, 0, 1, 1,
0.3562516, -0.7637665, 3.214184, 0.04313726, 0, 1, 1,
0.3579625, 1.176703, -0.616047, 0.05098039, 0, 1, 1,
0.3586358, -0.3789894, 3.080682, 0.05490196, 0, 1, 1,
0.3596609, -2.262179, 3.446496, 0.0627451, 0, 1, 1,
0.3632618, 0.1701971, 0.8403937, 0.06666667, 0, 1, 1,
0.3657638, -0.9641116, 3.012683, 0.07450981, 0, 1, 1,
0.3686158, -0.6891224, 1.69452, 0.07843138, 0, 1, 1,
0.3694312, 1.479465, -0.2387977, 0.08627451, 0, 1, 1,
0.3703435, -2.14188, 2.88176, 0.09019608, 0, 1, 1,
0.3709878, -0.0924228, 1.204956, 0.09803922, 0, 1, 1,
0.3722054, 0.6473237, 0.4779766, 0.1058824, 0, 1, 1,
0.3759369, -0.6989696, 2.568609, 0.1098039, 0, 1, 1,
0.3794988, -0.3386897, 1.866419, 0.1176471, 0, 1, 1,
0.3807111, 1.222391, 0.4147342, 0.1215686, 0, 1, 1,
0.3814253, 0.167934, 1.342321, 0.1294118, 0, 1, 1,
0.3873447, 1.054071, 1.092231, 0.1333333, 0, 1, 1,
0.3877798, -0.2004649, 3.262518, 0.1411765, 0, 1, 1,
0.3904543, 1.292399, 2.217683, 0.145098, 0, 1, 1,
0.3939468, 0.778854, 1.889801, 0.1529412, 0, 1, 1,
0.3978663, -0.8059663, 4.194779, 0.1568628, 0, 1, 1,
0.4001481, 0.672587, 0.1444337, 0.1647059, 0, 1, 1,
0.4006231, -0.603147, 2.971264, 0.1686275, 0, 1, 1,
0.403455, 1.712106, 0.03755658, 0.1764706, 0, 1, 1,
0.4079348, -0.4191754, 0.3324713, 0.1803922, 0, 1, 1,
0.4135512, -0.2977577, 1.698713, 0.1882353, 0, 1, 1,
0.4157413, -1.525395, 3.76323, 0.1921569, 0, 1, 1,
0.4167924, -0.7862379, 3.595433, 0.2, 0, 1, 1,
0.4171535, 0.1186945, 1.991821, 0.2078431, 0, 1, 1,
0.4198277, -0.3304193, 2.292437, 0.2117647, 0, 1, 1,
0.42103, 1.256679, -1.090687, 0.2196078, 0, 1, 1,
0.4233753, 1.081519, -0.09538829, 0.2235294, 0, 1, 1,
0.4242669, 0.8867303, -0.7042189, 0.2313726, 0, 1, 1,
0.4255773, -0.2114645, 1.57829, 0.2352941, 0, 1, 1,
0.4266959, -0.2471561, 3.252327, 0.2431373, 0, 1, 1,
0.4280959, 2.143758, 0.6742871, 0.2470588, 0, 1, 1,
0.430396, 0.1262373, 3.616539, 0.254902, 0, 1, 1,
0.4396086, -1.083713, 2.837045, 0.2588235, 0, 1, 1,
0.441302, 0.9650933, 0.7504613, 0.2666667, 0, 1, 1,
0.4461064, 0.146629, -0.3959486, 0.2705882, 0, 1, 1,
0.4461976, -1.508811, 2.049217, 0.2784314, 0, 1, 1,
0.4487557, -0.631625, 1.5735, 0.282353, 0, 1, 1,
0.4541949, 0.6384973, 0.1011343, 0.2901961, 0, 1, 1,
0.4554128, -0.2772328, 1.3444, 0.2941177, 0, 1, 1,
0.4597898, -0.807851, 2.401634, 0.3019608, 0, 1, 1,
0.4643881, 0.3712486, -0.03524866, 0.3098039, 0, 1, 1,
0.4734038, 0.6253946, 0.5727294, 0.3137255, 0, 1, 1,
0.4746592, 0.2581244, 1.808394, 0.3215686, 0, 1, 1,
0.4747351, 0.04994837, 0.9575073, 0.3254902, 0, 1, 1,
0.4802283, 0.486569, 1.620405, 0.3333333, 0, 1, 1,
0.4838657, 0.2594874, 1.062591, 0.3372549, 0, 1, 1,
0.4882155, 0.0187433, 0.9484539, 0.345098, 0, 1, 1,
0.4884157, -0.5706324, 2.210129, 0.3490196, 0, 1, 1,
0.4889734, 1.437793, 0.7996466, 0.3568628, 0, 1, 1,
0.4893228, 0.09452189, 0.9559333, 0.3607843, 0, 1, 1,
0.490172, -0.8219544, 1.576641, 0.3686275, 0, 1, 1,
0.491155, -0.08403553, 3.26107, 0.372549, 0, 1, 1,
0.4917297, 0.182676, 0.9864451, 0.3803922, 0, 1, 1,
0.4921993, -0.5496849, 3.224713, 0.3843137, 0, 1, 1,
0.4937924, -1.435564, 3.276463, 0.3921569, 0, 1, 1,
0.496164, -0.6961499, 1.018697, 0.3960784, 0, 1, 1,
0.497097, -0.3365051, 2.152209, 0.4039216, 0, 1, 1,
0.5095051, -0.7445136, 2.753529, 0.4117647, 0, 1, 1,
0.5150668, 1.429029, -0.6644353, 0.4156863, 0, 1, 1,
0.5163271, 0.7851749, 1.164636, 0.4235294, 0, 1, 1,
0.5197163, -2.596939, 5.52592, 0.427451, 0, 1, 1,
0.526392, -0.1236262, 0.5995128, 0.4352941, 0, 1, 1,
0.538189, -0.2509831, 1.496206, 0.4392157, 0, 1, 1,
0.5397168, -0.4632798, 4.209509, 0.4470588, 0, 1, 1,
0.5448972, -0.6159912, 2.10588, 0.4509804, 0, 1, 1,
0.5450019, 1.438496, 0.4807143, 0.4588235, 0, 1, 1,
0.5460356, 1.736882, -0.02592514, 0.4627451, 0, 1, 1,
0.5463195, -0.483314, 2.399482, 0.4705882, 0, 1, 1,
0.5481198, -0.7443544, 1.319235, 0.4745098, 0, 1, 1,
0.5503995, -1.570359, 2.271314, 0.4823529, 0, 1, 1,
0.5584333, -0.7670814, 4.318257, 0.4862745, 0, 1, 1,
0.5603887, -0.1344836, 1.92042, 0.4941176, 0, 1, 1,
0.5629895, -1.125593, 2.24887, 0.5019608, 0, 1, 1,
0.5664811, 1.817032, -0.8343523, 0.5058824, 0, 1, 1,
0.5744998, -0.5464119, 3.587973, 0.5137255, 0, 1, 1,
0.5763974, -0.1019668, 2.110973, 0.5176471, 0, 1, 1,
0.5779539, -2.343674, 4.940003, 0.5254902, 0, 1, 1,
0.5794719, -0.3952106, 3.385087, 0.5294118, 0, 1, 1,
0.5866797, -0.5015051, 1.463161, 0.5372549, 0, 1, 1,
0.587111, 0.2097835, 0.7522439, 0.5411765, 0, 1, 1,
0.5891903, -0.1436008, -0.08583202, 0.5490196, 0, 1, 1,
0.5900724, -0.426317, 1.78553, 0.5529412, 0, 1, 1,
0.5902271, 0.08361057, 1.644225, 0.5607843, 0, 1, 1,
0.5921899, -1.199307, 2.112187, 0.5647059, 0, 1, 1,
0.592868, -0.06497438, 1.945495, 0.572549, 0, 1, 1,
0.5993927, 0.8221769, 1.326438, 0.5764706, 0, 1, 1,
0.6025977, 0.9890058, 0.5663821, 0.5843138, 0, 1, 1,
0.6029211, -1.605306, 3.943118, 0.5882353, 0, 1, 1,
0.6072685, 0.4599849, 0.8243034, 0.5960785, 0, 1, 1,
0.613889, -0.5428641, 3.208746, 0.6039216, 0, 1, 1,
0.6168373, -0.4867704, 2.092921, 0.6078432, 0, 1, 1,
0.6214911, 0.09026287, 1.689762, 0.6156863, 0, 1, 1,
0.6215305, -0.9884044, 2.153896, 0.6196079, 0, 1, 1,
0.6215832, -2.109425, 2.264648, 0.627451, 0, 1, 1,
0.6220697, 0.6794565, 1.829221, 0.6313726, 0, 1, 1,
0.6226479, -1.856306, 3.286435, 0.6392157, 0, 1, 1,
0.6256384, -0.03980665, 0.3259908, 0.6431373, 0, 1, 1,
0.6274569, -0.08223518, 1.64968, 0.6509804, 0, 1, 1,
0.6308746, 0.1160715, 1.412124, 0.654902, 0, 1, 1,
0.6343436, 0.1994894, 2.556314, 0.6627451, 0, 1, 1,
0.6346027, 0.2898037, -0.08357564, 0.6666667, 0, 1, 1,
0.6383898, -1.407145, 3.632781, 0.6745098, 0, 1, 1,
0.6396425, 0.005676255, 2.91217, 0.6784314, 0, 1, 1,
0.6518325, -1.501053, 3.025165, 0.6862745, 0, 1, 1,
0.6527948, -0.7544327, 1.974336, 0.6901961, 0, 1, 1,
0.6545688, 0.2504464, 2.015362, 0.6980392, 0, 1, 1,
0.6584007, 0.3258405, 0.8549624, 0.7058824, 0, 1, 1,
0.6644371, -1.693704, 1.704371, 0.7098039, 0, 1, 1,
0.6671855, 0.9902253, 2.291717, 0.7176471, 0, 1, 1,
0.6683091, 1.050115, 0.1895732, 0.7215686, 0, 1, 1,
0.6685754, -0.5638253, 1.752652, 0.7294118, 0, 1, 1,
0.6698, -0.338258, 1.314604, 0.7333333, 0, 1, 1,
0.6711778, -0.8652932, 2.886226, 0.7411765, 0, 1, 1,
0.6726784, -0.5950444, 1.507723, 0.7450981, 0, 1, 1,
0.675705, 0.949453, 0.9978099, 0.7529412, 0, 1, 1,
0.6822458, -0.02576463, 1.844537, 0.7568628, 0, 1, 1,
0.6871405, 1.636249, 0.7113143, 0.7647059, 0, 1, 1,
0.6883823, 1.095918, -0.6757368, 0.7686275, 0, 1, 1,
0.6902796, 0.07210813, 2.480252, 0.7764706, 0, 1, 1,
0.6903861, 0.2644007, 3.264401, 0.7803922, 0, 1, 1,
0.7000571, 2.504422, 0.1298784, 0.7882353, 0, 1, 1,
0.7020839, -1.565823, 3.288351, 0.7921569, 0, 1, 1,
0.7165168, 0.8332093, 1.627707, 0.8, 0, 1, 1,
0.720293, 1.367228, 2.052438, 0.8078431, 0, 1, 1,
0.7207552, 2.091358, 0.9762286, 0.8117647, 0, 1, 1,
0.733474, 0.1783915, 0.3633776, 0.8196079, 0, 1, 1,
0.7364565, 0.02865063, 2.369264, 0.8235294, 0, 1, 1,
0.7402607, 0.7350574, -0.02505345, 0.8313726, 0, 1, 1,
0.7448469, -0.2852235, 3.059535, 0.8352941, 0, 1, 1,
0.7522151, 0.3837946, 1.024107, 0.8431373, 0, 1, 1,
0.7526253, 1.363982, -0.822697, 0.8470588, 0, 1, 1,
0.7605643, -1.086422, 2.199538, 0.854902, 0, 1, 1,
0.7634956, -1.16072, 3.50089, 0.8588235, 0, 1, 1,
0.7646122, -0.1916665, 1.341941, 0.8666667, 0, 1, 1,
0.7646449, 0.3760644, -0.6231405, 0.8705882, 0, 1, 1,
0.7670472, 0.6189893, 0.9927288, 0.8784314, 0, 1, 1,
0.7695346, 1.454058, 0.4638884, 0.8823529, 0, 1, 1,
0.772667, -0.1531584, 0.8960202, 0.8901961, 0, 1, 1,
0.7798183, -0.7171284, 3.2271, 0.8941177, 0, 1, 1,
0.7886396, 0.8001294, 1.009056, 0.9019608, 0, 1, 1,
0.7930185, 0.1585026, -0.01982227, 0.9098039, 0, 1, 1,
0.7969137, 0.7663019, 1.98226, 0.9137255, 0, 1, 1,
0.8045585, 0.690502, 1.08184, 0.9215686, 0, 1, 1,
0.8057418, 0.08407408, 1.646884, 0.9254902, 0, 1, 1,
0.8136162, -0.6836907, 1.986106, 0.9333333, 0, 1, 1,
0.8140131, -1.488651, 2.900097, 0.9372549, 0, 1, 1,
0.8177388, -0.07122584, 3.114746, 0.945098, 0, 1, 1,
0.8189542, -0.2153452, 2.56966, 0.9490196, 0, 1, 1,
0.8195266, 2.402623, 1.516739, 0.9568627, 0, 1, 1,
0.8217317, 0.2892038, 1.75085, 0.9607843, 0, 1, 1,
0.8240498, 1.264131, -0.5467322, 0.9686275, 0, 1, 1,
0.8310014, -0.3779426, -0.07456811, 0.972549, 0, 1, 1,
0.8460026, -1.238744, 1.699536, 0.9803922, 0, 1, 1,
0.8482471, 0.93093, 1.892376, 0.9843137, 0, 1, 1,
0.8556167, 1.674869, 0.5100804, 0.9921569, 0, 1, 1,
0.8602662, 0.2627297, 0.6562488, 0.9960784, 0, 1, 1,
0.8635908, 0.4572424, 1.90137, 1, 0, 0.9960784, 1,
0.8686795, -0.2017875, 2.027185, 1, 0, 0.9882353, 1,
0.8767838, 0.1901495, 0.3074557, 1, 0, 0.9843137, 1,
0.8770671, -1.03597, 2.658996, 1, 0, 0.9764706, 1,
0.8782642, 0.4705754, 2.056835, 1, 0, 0.972549, 1,
0.8799273, -1.195016, 2.246716, 1, 0, 0.9647059, 1,
0.8870471, -1.173665, 2.308228, 1, 0, 0.9607843, 1,
0.8882583, 0.3771774, -1.462854, 1, 0, 0.9529412, 1,
0.8918588, 0.8296251, 2.653335, 1, 0, 0.9490196, 1,
0.8995413, 0.7901644, 0.9960288, 1, 0, 0.9411765, 1,
0.9098485, 1.797681, 1.316408, 1, 0, 0.9372549, 1,
0.9150332, -0.4922973, 0.851972, 1, 0, 0.9294118, 1,
0.9164628, 0.6353678, 1.129628, 1, 0, 0.9254902, 1,
0.9173081, -0.7005577, 2.284896, 1, 0, 0.9176471, 1,
0.9180446, -0.860797, 1.817256, 1, 0, 0.9137255, 1,
0.9245178, -0.1579703, 4.159983, 1, 0, 0.9058824, 1,
0.9266593, -1.022913, 2.470615, 1, 0, 0.9019608, 1,
0.9335271, 0.8225167, 0.6667311, 1, 0, 0.8941177, 1,
0.9485157, -0.04553111, 0.9717714, 1, 0, 0.8862745, 1,
0.9514295, -0.3533955, 3.794879, 1, 0, 0.8823529, 1,
0.9619592, -0.1162357, 3.000792, 1, 0, 0.8745098, 1,
0.9667523, -0.4722975, 4.393872, 1, 0, 0.8705882, 1,
0.9674168, 0.4005564, 0.9988443, 1, 0, 0.8627451, 1,
0.9686717, -1.393489, 4.118865, 1, 0, 0.8588235, 1,
0.9712509, 0.7241306, 1.005505, 1, 0, 0.8509804, 1,
0.9724596, -0.3024907, 0.4650913, 1, 0, 0.8470588, 1,
0.9771036, 0.282018, 1.258205, 1, 0, 0.8392157, 1,
0.9818951, 0.1522802, 1.391944, 1, 0, 0.8352941, 1,
0.9940335, -1.219476, 2.206206, 1, 0, 0.827451, 1,
0.9977327, 0.1049142, 1.396467, 1, 0, 0.8235294, 1,
1.000908, -0.3679965, 2.569694, 1, 0, 0.8156863, 1,
1.005177, 1.010268, -0.8034719, 1, 0, 0.8117647, 1,
1.015114, 0.06272853, 3.50296, 1, 0, 0.8039216, 1,
1.025764, -0.1192252, 3.079201, 1, 0, 0.7960784, 1,
1.026842, -1.66614, 1.135325, 1, 0, 0.7921569, 1,
1.029995, 0.2180089, 0.3670187, 1, 0, 0.7843137, 1,
1.033384, -1.546705, 2.887784, 1, 0, 0.7803922, 1,
1.047771, 1.66333, -0.9872555, 1, 0, 0.772549, 1,
1.048364, -0.586387, 2.910802, 1, 0, 0.7686275, 1,
1.063568, 0.2884106, 1.136598, 1, 0, 0.7607843, 1,
1.065353, -0.8257156, 1.164666, 1, 0, 0.7568628, 1,
1.065632, 0.1642826, 1.290407, 1, 0, 0.7490196, 1,
1.075978, 0.3708479, 2.383594, 1, 0, 0.7450981, 1,
1.078409, 1.882065, -0.6132165, 1, 0, 0.7372549, 1,
1.078995, 1.097427, 1.739189, 1, 0, 0.7333333, 1,
1.08486, -0.2649854, 3.026941, 1, 0, 0.7254902, 1,
1.095873, -0.542345, 3.226188, 1, 0, 0.7215686, 1,
1.097233, -0.9294662, 2.97046, 1, 0, 0.7137255, 1,
1.1078, 1.349963, 0.07730991, 1, 0, 0.7098039, 1,
1.113962, -1.109872, 1.514376, 1, 0, 0.7019608, 1,
1.122096, 0.3202373, 1.751889, 1, 0, 0.6941177, 1,
1.123556, 0.280332, 1.237141, 1, 0, 0.6901961, 1,
1.124284, 0.5668241, 1.122704, 1, 0, 0.682353, 1,
1.137437, 0.8045781, -0.4424733, 1, 0, 0.6784314, 1,
1.138649, 0.9794251, 1.09751, 1, 0, 0.6705883, 1,
1.145224, -0.2743308, 2.352826, 1, 0, 0.6666667, 1,
1.149182, 1.235414, 0.2263094, 1, 0, 0.6588235, 1,
1.151548, -0.7449337, 2.890419, 1, 0, 0.654902, 1,
1.15349, -0.4478384, 1.929649, 1, 0, 0.6470588, 1,
1.153843, 1.295545, -1.632911, 1, 0, 0.6431373, 1,
1.155583, -0.6749917, 2.443795, 1, 0, 0.6352941, 1,
1.158004, 0.1909559, 1.768919, 1, 0, 0.6313726, 1,
1.160704, -1.528802, 0.1291518, 1, 0, 0.6235294, 1,
1.165097, -0.5622417, 3.185704, 1, 0, 0.6196079, 1,
1.166889, 0.07882269, 2.32554, 1, 0, 0.6117647, 1,
1.176373, 0.9254683, 0.7222347, 1, 0, 0.6078432, 1,
1.184755, 0.518419, 0.9557461, 1, 0, 0.6, 1,
1.186319, 0.6367925, 0.5455542, 1, 0, 0.5921569, 1,
1.192664, 0.2403969, 2.143759, 1, 0, 0.5882353, 1,
1.203504, 0.7360178, 0.537129, 1, 0, 0.5803922, 1,
1.215693, -1.502188, 1.670792, 1, 0, 0.5764706, 1,
1.237644, 0.4809876, 1.903193, 1, 0, 0.5686275, 1,
1.243364, 1.845877, 1.83372, 1, 0, 0.5647059, 1,
1.245256, 3.113502, 0.9057172, 1, 0, 0.5568628, 1,
1.245268, -1.330794, 0.8730143, 1, 0, 0.5529412, 1,
1.255797, 1.358379, 1.986633, 1, 0, 0.5450981, 1,
1.263385, 1.683262, 1.46184, 1, 0, 0.5411765, 1,
1.268397, -0.1685975, 1.519361, 1, 0, 0.5333334, 1,
1.269497, -0.2435662, 2.418281, 1, 0, 0.5294118, 1,
1.272431, 0.8706033, 2.027299, 1, 0, 0.5215687, 1,
1.272608, 0.2058852, 1.204851, 1, 0, 0.5176471, 1,
1.29035, -0.4478364, 2.597376, 1, 0, 0.509804, 1,
1.295627, 0.7183824, -1.180238, 1, 0, 0.5058824, 1,
1.302253, -0.4026624, 1.863144, 1, 0, 0.4980392, 1,
1.313835, -0.5615416, 4.444542, 1, 0, 0.4901961, 1,
1.31518, 1.300828, 1.468948, 1, 0, 0.4862745, 1,
1.324147, 0.4487956, 2.135967, 1, 0, 0.4784314, 1,
1.334382, -0.8215443, 0.6557778, 1, 0, 0.4745098, 1,
1.335296, 0.6817502, -0.4062045, 1, 0, 0.4666667, 1,
1.336952, 0.2471971, 2.388859, 1, 0, 0.4627451, 1,
1.337186, -1.34473, 2.192384, 1, 0, 0.454902, 1,
1.33752, 1.87436, 1.069302, 1, 0, 0.4509804, 1,
1.351625, -1.332234, 1.882234, 1, 0, 0.4431373, 1,
1.357864, 0.2374104, 0.5220478, 1, 0, 0.4392157, 1,
1.386211, -0.8206416, 2.32811, 1, 0, 0.4313726, 1,
1.400863, -0.06479645, 1.869013, 1, 0, 0.427451, 1,
1.419215, 1.051975, 1.148318, 1, 0, 0.4196078, 1,
1.420263, 0.4759234, 1.389604, 1, 0, 0.4156863, 1,
1.425446, 0.5684386, 0.4804891, 1, 0, 0.4078431, 1,
1.427636, -0.09412811, 1.206857, 1, 0, 0.4039216, 1,
1.429727, -0.8085069, 2.180961, 1, 0, 0.3960784, 1,
1.437087, -0.4800653, 2.975677, 1, 0, 0.3882353, 1,
1.455568, 0.2496484, 1.499136, 1, 0, 0.3843137, 1,
1.475079, -0.7233692, 1.900157, 1, 0, 0.3764706, 1,
1.475478, 0.3730527, 0.3847113, 1, 0, 0.372549, 1,
1.477377, 0.06417494, 1.807981, 1, 0, 0.3647059, 1,
1.482828, -1.857983, 2.138178, 1, 0, 0.3607843, 1,
1.491892, -0.3225498, 1.478992, 1, 0, 0.3529412, 1,
1.493721, -0.1237229, 0.9268852, 1, 0, 0.3490196, 1,
1.50089, 1.015, -0.3477532, 1, 0, 0.3411765, 1,
1.502159, 1.135848, 2.051299, 1, 0, 0.3372549, 1,
1.507241, 0.08722813, -0.1776606, 1, 0, 0.3294118, 1,
1.511712, -0.5203034, 2.244809, 1, 0, 0.3254902, 1,
1.516245, 0.3521225, 2.287975, 1, 0, 0.3176471, 1,
1.519646, 0.6136383, 0.7984005, 1, 0, 0.3137255, 1,
1.534101, -1.74242, 3.900236, 1, 0, 0.3058824, 1,
1.534711, 1.113444, 1.224055, 1, 0, 0.2980392, 1,
1.562243, 0.4128002, 2.337317, 1, 0, 0.2941177, 1,
1.564834, -1.809146, 3.544929, 1, 0, 0.2862745, 1,
1.569673, 0.4782948, 1.932022, 1, 0, 0.282353, 1,
1.569744, 0.3088604, 2.401727, 1, 0, 0.2745098, 1,
1.571326, -1.694586, 2.682625, 1, 0, 0.2705882, 1,
1.587464, 1.185609, 1.100335, 1, 0, 0.2627451, 1,
1.590661, 0.04619465, 1.231854, 1, 0, 0.2588235, 1,
1.596339, 1.755929, 1.033674, 1, 0, 0.2509804, 1,
1.596642, 0.1939596, 1.070621, 1, 0, 0.2470588, 1,
1.597485, 1.506604, 0.06135596, 1, 0, 0.2392157, 1,
1.638124, 0.04444458, 1.742519, 1, 0, 0.2352941, 1,
1.639769, -0.7558236, 3.46727, 1, 0, 0.227451, 1,
1.640817, -0.8447254, 1.722508, 1, 0, 0.2235294, 1,
1.641955, 0.2753387, 0.5468838, 1, 0, 0.2156863, 1,
1.654205, 0.1920251, 1.661357, 1, 0, 0.2117647, 1,
1.677588, 0.8168911, 0.6314731, 1, 0, 0.2039216, 1,
1.677589, -0.5736019, 1.80525, 1, 0, 0.1960784, 1,
1.681271, -1.978775, 3.844601, 1, 0, 0.1921569, 1,
1.712944, -0.5911505, 2.319179, 1, 0, 0.1843137, 1,
1.718047, -1.370108, 4.255037, 1, 0, 0.1803922, 1,
1.719588, -0.1757922, 1.409735, 1, 0, 0.172549, 1,
1.723264, 2.204383, -0.03539635, 1, 0, 0.1686275, 1,
1.729364, 0.7359075, 1.537496, 1, 0, 0.1607843, 1,
1.747454, 0.02346741, 0.9959257, 1, 0, 0.1568628, 1,
1.760068, -0.02485365, 0.9636521, 1, 0, 0.1490196, 1,
1.766286, -0.6361968, 0.6659557, 1, 0, 0.145098, 1,
1.77601, -1.64883, 0.6274335, 1, 0, 0.1372549, 1,
1.780565, 0.7304351, 1.792566, 1, 0, 0.1333333, 1,
1.79605, -2.852106, 4.547771, 1, 0, 0.1254902, 1,
1.847979, -2.900692, 3.360636, 1, 0, 0.1215686, 1,
1.862521, -0.8601888, 2.635475, 1, 0, 0.1137255, 1,
1.881948, -0.2777462, 0.8581576, 1, 0, 0.1098039, 1,
1.913504, 0.4417289, 0.8267997, 1, 0, 0.1019608, 1,
1.991089, 1.083207, 2.20018, 1, 0, 0.09411765, 1,
1.992396, 1.724469, 1.490766, 1, 0, 0.09019608, 1,
2.027599, 0.8867788, 0.5591099, 1, 0, 0.08235294, 1,
2.092323, -0.7175738, 2.036907, 1, 0, 0.07843138, 1,
2.098187, -1.568273, 0.09770878, 1, 0, 0.07058824, 1,
2.121244, 0.9944828, 0.9201939, 1, 0, 0.06666667, 1,
2.123848, 0.1075484, 1.68161, 1, 0, 0.05882353, 1,
2.160931, 0.04654732, 2.861532, 1, 0, 0.05490196, 1,
2.161811, 0.10688, 1.231832, 1, 0, 0.04705882, 1,
2.227518, 0.4202701, 2.066958, 1, 0, 0.04313726, 1,
2.333875, 0.06152309, 0.6976689, 1, 0, 0.03529412, 1,
2.480267, 0.2073666, 1.792728, 1, 0, 0.03137255, 1,
2.592613, 0.2625131, 2.094598, 1, 0, 0.02352941, 1,
3.072091, -3.054905, 1.476866, 1, 0, 0.01960784, 1,
3.586387, 0.8416809, 1.305926, 1, 0, 0.01176471, 1,
4.008732, 1.091801, 2.627828, 1, 0, 0.007843138, 1
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
0.5491523, -4.836976, -7.137853, 0, -0.5, 0.5, 0.5,
0.5491523, -4.836976, -7.137853, 1, -0.5, 0.5, 0.5,
0.5491523, -4.836976, -7.137853, 1, 1.5, 0.5, 0.5,
0.5491523, -4.836976, -7.137853, 0, 1.5, 0.5, 0.5
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
-4.083225, -0.2855908, -7.137853, 0, -0.5, 0.5, 0.5,
-4.083225, -0.2855908, -7.137853, 1, -0.5, 0.5, 0.5,
-4.083225, -0.2855908, -7.137853, 1, 1.5, 0.5, 0.5,
-4.083225, -0.2855908, -7.137853, 0, 1.5, 0.5, 0.5
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
-4.083225, -4.836976, 0.1117375, 0, -0.5, 0.5, 0.5,
-4.083225, -4.836976, 0.1117375, 1, -0.5, 0.5, 0.5,
-4.083225, -4.836976, 0.1117375, 1, 1.5, 0.5, 0.5,
-4.083225, -4.836976, 0.1117375, 0, 1.5, 0.5, 0.5
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
-2, -3.786656, -5.46487,
4, -3.786656, -5.46487,
-2, -3.786656, -5.46487,
-2, -3.961709, -5.743701,
-1, -3.786656, -5.46487,
-1, -3.961709, -5.743701,
0, -3.786656, -5.46487,
0, -3.961709, -5.743701,
1, -3.786656, -5.46487,
1, -3.961709, -5.743701,
2, -3.786656, -5.46487,
2, -3.961709, -5.743701,
3, -3.786656, -5.46487,
3, -3.961709, -5.743701,
4, -3.786656, -5.46487,
4, -3.961709, -5.743701
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
"3",
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
-2, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
-2, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
-2, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
-2, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
-1, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
-1, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
-1, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
-1, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
0, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
0, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
0, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
0, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
1, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
1, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
1, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
1, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
2, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
2, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
2, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
2, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
3, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
3, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
3, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
3, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5,
4, -4.311816, -6.301362, 0, -0.5, 0.5, 0.5,
4, -4.311816, -6.301362, 1, -0.5, 0.5, 0.5,
4, -4.311816, -6.301362, 1, 1.5, 0.5, 0.5,
4, -4.311816, -6.301362, 0, 1.5, 0.5, 0.5
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
-3.014215, -3, -5.46487,
-3.014215, 3, -5.46487,
-3.014215, -3, -5.46487,
-3.192383, -3, -5.743701,
-3.014215, -2, -5.46487,
-3.192383, -2, -5.743701,
-3.014215, -1, -5.46487,
-3.192383, -1, -5.743701,
-3.014215, 0, -5.46487,
-3.192383, 0, -5.743701,
-3.014215, 1, -5.46487,
-3.192383, 1, -5.743701,
-3.014215, 2, -5.46487,
-3.192383, 2, -5.743701,
-3.014215, 3, -5.46487,
-3.192383, 3, -5.743701
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
-3.54872, -3, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, -3, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, -3, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, -3, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, -2, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, -2, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, -2, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, -2, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, -1, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, -1, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, -1, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, -1, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, 0, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, 0, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, 0, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, 0, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, 1, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, 1, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, 1, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, 1, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, 2, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, 2, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, 2, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, 2, -6.301362, 0, 1.5, 0.5, 0.5,
-3.54872, 3, -6.301362, 0, -0.5, 0.5, 0.5,
-3.54872, 3, -6.301362, 1, -0.5, 0.5, 0.5,
-3.54872, 3, -6.301362, 1, 1.5, 0.5, 0.5,
-3.54872, 3, -6.301362, 0, 1.5, 0.5, 0.5
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
-3.014215, -3.786656, -4,
-3.014215, -3.786656, 4,
-3.014215, -3.786656, -4,
-3.192383, -3.961709, -4,
-3.014215, -3.786656, -2,
-3.192383, -3.961709, -2,
-3.014215, -3.786656, 0,
-3.192383, -3.961709, 0,
-3.014215, -3.786656, 2,
-3.192383, -3.961709, 2,
-3.014215, -3.786656, 4,
-3.192383, -3.961709, 4
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
-3.54872, -4.311816, -4, 0, -0.5, 0.5, 0.5,
-3.54872, -4.311816, -4, 1, -0.5, 0.5, 0.5,
-3.54872, -4.311816, -4, 1, 1.5, 0.5, 0.5,
-3.54872, -4.311816, -4, 0, 1.5, 0.5, 0.5,
-3.54872, -4.311816, -2, 0, -0.5, 0.5, 0.5,
-3.54872, -4.311816, -2, 1, -0.5, 0.5, 0.5,
-3.54872, -4.311816, -2, 1, 1.5, 0.5, 0.5,
-3.54872, -4.311816, -2, 0, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 0, 0, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 0, 1, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 0, 1, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 0, 0, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 2, 0, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 2, 1, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 2, 1, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 2, 0, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 4, 0, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 4, 1, -0.5, 0.5, 0.5,
-3.54872, -4.311816, 4, 1, 1.5, 0.5, 0.5,
-3.54872, -4.311816, 4, 0, 1.5, 0.5, 0.5
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
-3.014215, -3.786656, -5.46487,
-3.014215, 3.215474, -5.46487,
-3.014215, -3.786656, 5.688345,
-3.014215, 3.215474, 5.688345,
-3.014215, -3.786656, -5.46487,
-3.014215, -3.786656, 5.688345,
-3.014215, 3.215474, -5.46487,
-3.014215, 3.215474, 5.688345,
-3.014215, -3.786656, -5.46487,
4.112519, -3.786656, -5.46487,
-3.014215, -3.786656, 5.688345,
4.112519, -3.786656, 5.688345,
-3.014215, 3.215474, -5.46487,
4.112519, 3.215474, -5.46487,
-3.014215, 3.215474, 5.688345,
4.112519, 3.215474, 5.688345,
4.112519, -3.786656, -5.46487,
4.112519, 3.215474, -5.46487,
4.112519, -3.786656, 5.688345,
4.112519, 3.215474, 5.688345,
4.112519, -3.786656, -5.46487,
4.112519, -3.786656, 5.688345,
4.112519, 3.215474, -5.46487,
4.112519, 3.215474, 5.688345
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
var radius = 7.995713;
var distance = 35.57383;
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
mvMatrix.translate( -0.5491523, 0.2855908, -0.1117375 );
mvMatrix.scale( 1.213055, 1.234642, 0.7751237 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.57383);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
2-butoxy-1-methyleth<-read.table("2-butoxy-1-methyleth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.910427, -0.2736187, -3.036007, 0, 0, 1, 1, 1,
-2.89772, -0.1422324, -2.010121, 1, 0, 0, 1, 1,
-2.674725, -0.7094185, -1.43061, 1, 0, 0, 1, 1,
-2.555435, -0.7212812, -1.018041, 1, 0, 0, 1, 1,
-2.513869, -1.970834, -2.468498, 1, 0, 0, 1, 1,
-2.490496, 0.6502222, -1.466453, 1, 0, 0, 1, 1,
-2.38377, -1.360337, -3.077103, 0, 0, 0, 1, 1,
-2.327975, 0.8559568, -0.2686787, 0, 0, 0, 1, 1,
-2.280914, -1.06653, -0.660198, 0, 0, 0, 1, 1,
-2.273218, -1.040119, -2.539304, 0, 0, 0, 1, 1,
-2.271358, 0.08633267, -2.390578, 0, 0, 0, 1, 1,
-2.22963, 0.02147808, -0.616641, 0, 0, 0, 1, 1,
-2.227543, -0.5340366, -2.926112, 0, 0, 0, 1, 1,
-2.216941, 0.3830409, -2.183883, 1, 1, 1, 1, 1,
-2.121113, -2.291399, -2.867292, 1, 1, 1, 1, 1,
-2.111217, 1.099063, -1.103617, 1, 1, 1, 1, 1,
-2.08908, -1.029532, -2.222626, 1, 1, 1, 1, 1,
-2.070143, -1.131054, -1.943414, 1, 1, 1, 1, 1,
-2.054074, 1.187692, -1.682449, 1, 1, 1, 1, 1,
-2.034456, 0.7281343, -3.605417, 1, 1, 1, 1, 1,
-1.993898, 0.2853658, -2.687754, 1, 1, 1, 1, 1,
-1.97481, -0.1644216, -3.392859, 1, 1, 1, 1, 1,
-1.956203, -0.48111, -2.239773, 1, 1, 1, 1, 1,
-1.952602, 0.2245966, 0.07398972, 1, 1, 1, 1, 1,
-1.934597, -0.3056132, -2.335999, 1, 1, 1, 1, 1,
-1.93161, -0.9774462, -2.144313, 1, 1, 1, 1, 1,
-1.892309, 2.274381, 0.5441082, 1, 1, 1, 1, 1,
-1.891445, -0.254093, -3.140287, 1, 1, 1, 1, 1,
-1.888678, -0.4923646, -1.972794, 0, 0, 1, 1, 1,
-1.839188, 1.480362, -0.6280009, 1, 0, 0, 1, 1,
-1.834261, 0.6695693, -0.6708406, 1, 0, 0, 1, 1,
-1.830008, -0.5700907, -3.502243, 1, 0, 0, 1, 1,
-1.826807, -0.9178593, -1.847102, 1, 0, 0, 1, 1,
-1.820607, 0.09322771, -1.426637, 1, 0, 0, 1, 1,
-1.813876, 0.4161315, -0.6778441, 0, 0, 0, 1, 1,
-1.811559, 0.5671146, -2.359459, 0, 0, 0, 1, 1,
-1.802508, 2.21617, 1.081669, 0, 0, 0, 1, 1,
-1.799311, 0.2247531, -3.092422, 0, 0, 0, 1, 1,
-1.792806, -0.8740507, -2.392279, 0, 0, 0, 1, 1,
-1.773498, -0.5820186, -3.659221, 0, 0, 0, 1, 1,
-1.762704, 0.3790168, -2.88214, 0, 0, 0, 1, 1,
-1.760239, 1.471808, -1.187953, 1, 1, 1, 1, 1,
-1.750642, -0.2346487, -3.92447, 1, 1, 1, 1, 1,
-1.746584, -1.250324, -1.689588, 1, 1, 1, 1, 1,
-1.744112, -1.219427, -0.7769346, 1, 1, 1, 1, 1,
-1.737443, -1.220221, -3.37625, 1, 1, 1, 1, 1,
-1.706103, 1.167634, -2.904437, 1, 1, 1, 1, 1,
-1.705894, -1.173331, -0.9126093, 1, 1, 1, 1, 1,
-1.69524, 0.2846532, -0.411435, 1, 1, 1, 1, 1,
-1.694536, -2.279475, -2.607694, 1, 1, 1, 1, 1,
-1.690016, 0.2772844, 0.1916739, 1, 1, 1, 1, 1,
-1.673928, 0.8733327, -2.068479, 1, 1, 1, 1, 1,
-1.673105, -2.40151, -1.79273, 1, 1, 1, 1, 1,
-1.666269, 0.4313267, -0.7462637, 1, 1, 1, 1, 1,
-1.664573, -0.3711624, -2.892726, 1, 1, 1, 1, 1,
-1.639325, 0.1449224, -2.617684, 1, 1, 1, 1, 1,
-1.639132, 0.01073393, -1.482963, 0, 0, 1, 1, 1,
-1.625392, -1.197642, -3.401437, 1, 0, 0, 1, 1,
-1.612196, -1.062433, -1.886186, 1, 0, 0, 1, 1,
-1.612185, 0.5855978, -2.334805, 1, 0, 0, 1, 1,
-1.596653, -1.409489, -3.708701, 1, 0, 0, 1, 1,
-1.577316, -2.427451, -0.2428485, 1, 0, 0, 1, 1,
-1.576542, -0.6796579, -3.944735, 0, 0, 0, 1, 1,
-1.571987, 0.5560157, -1.886476, 0, 0, 0, 1, 1,
-1.564023, 0.8085693, -0.4426233, 0, 0, 0, 1, 1,
-1.561444, -0.7862819, -1.734138, 0, 0, 0, 1, 1,
-1.544359, 0.2941568, -0.76618, 0, 0, 0, 1, 1,
-1.537008, -0.008524915, -1.655396, 0, 0, 0, 1, 1,
-1.523819, -0.595384, -1.586165, 0, 0, 0, 1, 1,
-1.520489, -0.1257389, -3.348408, 1, 1, 1, 1, 1,
-1.519653, 1.627746, -0.7090907, 1, 1, 1, 1, 1,
-1.51125, 0.09951538, -2.418216, 1, 1, 1, 1, 1,
-1.493043, 1.745332, -0.4190462, 1, 1, 1, 1, 1,
-1.48441, 0.0856983, -1.940227, 1, 1, 1, 1, 1,
-1.466069, -0.2768205, -0.9272417, 1, 1, 1, 1, 1,
-1.45806, -0.5270232, -0.898367, 1, 1, 1, 1, 1,
-1.453191, 1.08535, -1.774265, 1, 1, 1, 1, 1,
-1.448813, 1.914332, 0.5703275, 1, 1, 1, 1, 1,
-1.446395, -0.8121244, -1.29021, 1, 1, 1, 1, 1,
-1.443453, 1.811459, -1.002176, 1, 1, 1, 1, 1,
-1.442311, -0.08733274, -1.07418, 1, 1, 1, 1, 1,
-1.433658, -1.345584, -2.843724, 1, 1, 1, 1, 1,
-1.42753, 0.7262313, -1.687691, 1, 1, 1, 1, 1,
-1.42371, 0.563488, -0.8791064, 1, 1, 1, 1, 1,
-1.421927, 0.02130421, -0.494708, 0, 0, 1, 1, 1,
-1.420801, 0.03642773, -2.182462, 1, 0, 0, 1, 1,
-1.416568, -0.3950059, -0.9918341, 1, 0, 0, 1, 1,
-1.403242, 1.118012, -1.558177, 1, 0, 0, 1, 1,
-1.400704, -0.2941986, -1.284229, 1, 0, 0, 1, 1,
-1.387604, -0.5968482, -2.248791, 1, 0, 0, 1, 1,
-1.384041, 0.05607883, -3.097601, 0, 0, 0, 1, 1,
-1.383916, 1.26253, -0.7051454, 0, 0, 0, 1, 1,
-1.366013, 0.2361599, -2.409854, 0, 0, 0, 1, 1,
-1.362014, -0.2883975, -1.128087, 0, 0, 0, 1, 1,
-1.351684, -0.3944584, -0.225295, 0, 0, 0, 1, 1,
-1.350202, 1.195436, -1.725796, 0, 0, 0, 1, 1,
-1.342179, 0.2962268, -0.895138, 0, 0, 0, 1, 1,
-1.334598, 1.022301, -2.332605, 1, 1, 1, 1, 1,
-1.332101, -0.6339462, -1.525206, 1, 1, 1, 1, 1,
-1.33197, -0.2299195, -1.1765, 1, 1, 1, 1, 1,
-1.33175, 0.3322114, -0.6473472, 1, 1, 1, 1, 1,
-1.329339, -0.3002613, -1.517362, 1, 1, 1, 1, 1,
-1.323083, 0.3601526, -2.731596, 1, 1, 1, 1, 1,
-1.317922, 1.179869, -1.050633, 1, 1, 1, 1, 1,
-1.311713, -2.165469, -3.031202, 1, 1, 1, 1, 1,
-1.284957, -1.438939, -0.2606905, 1, 1, 1, 1, 1,
-1.284515, 0.02665116, 0.1145294, 1, 1, 1, 1, 1,
-1.283772, -0.5134244, -0.3070555, 1, 1, 1, 1, 1,
-1.282131, 0.2846792, -1.588091, 1, 1, 1, 1, 1,
-1.280572, -0.7753437, -2.754852, 1, 1, 1, 1, 1,
-1.270034, 0.3856739, -2.135327, 1, 1, 1, 1, 1,
-1.265548, 0.8985617, -1.061154, 1, 1, 1, 1, 1,
-1.248596, 0.3278959, -1.136267, 0, 0, 1, 1, 1,
-1.240328, -0.03133886, 0.266842, 1, 0, 0, 1, 1,
-1.23356, 1.195716, -1.95176, 1, 0, 0, 1, 1,
-1.229841, -1.806845, -5.302445, 1, 0, 0, 1, 1,
-1.227159, -0.2731908, -1.078835, 1, 0, 0, 1, 1,
-1.225816, -1.298838, -3.156229, 1, 0, 0, 1, 1,
-1.225323, 0.5108634, 0.9651841, 0, 0, 0, 1, 1,
-1.220844, 1.100207, -2.725739, 0, 0, 0, 1, 1,
-1.220098, 0.2957613, -1.300895, 0, 0, 0, 1, 1,
-1.218956, -0.1209557, -2.38514, 0, 0, 0, 1, 1,
-1.214638, 0.01502352, -2.248363, 0, 0, 0, 1, 1,
-1.206227, -0.08971144, -1.796855, 0, 0, 0, 1, 1,
-1.192402, -0.04117998, -0.2037319, 0, 0, 0, 1, 1,
-1.178738, 2.139004, 0.3050806, 1, 1, 1, 1, 1,
-1.178593, -0.1619236, -2.199598, 1, 1, 1, 1, 1,
-1.177159, -0.5712217, -0.5117795, 1, 1, 1, 1, 1,
-1.174781, -0.3862164, -1.507092, 1, 1, 1, 1, 1,
-1.171731, 0.1052492, 0.3029914, 1, 1, 1, 1, 1,
-1.171563, -2.788109, -3.435274, 1, 1, 1, 1, 1,
-1.169959, -1.901231, -2.440461, 1, 1, 1, 1, 1,
-1.163464, -0.8571827, -3.671343, 1, 1, 1, 1, 1,
-1.157672, 1.109252, -1.325516, 1, 1, 1, 1, 1,
-1.155915, 0.9052004, -0.7726017, 1, 1, 1, 1, 1,
-1.152343, -1.859341, -2.767322, 1, 1, 1, 1, 1,
-1.152301, -0.06021345, -1.978201, 1, 1, 1, 1, 1,
-1.144267, 0.2616296, -0.1483217, 1, 1, 1, 1, 1,
-1.139019, -2.008748, -1.003886, 1, 1, 1, 1, 1,
-1.118967, -1.724674, -1.697813, 1, 1, 1, 1, 1,
-1.114022, -1.652888, -3.774939, 0, 0, 1, 1, 1,
-1.111525, -0.2991033, -2.588499, 1, 0, 0, 1, 1,
-1.106258, 0.1255709, -1.039476, 1, 0, 0, 1, 1,
-1.104422, -0.2983034, -1.001636, 1, 0, 0, 1, 1,
-1.097386, -0.1680487, -3.678541, 1, 0, 0, 1, 1,
-1.092344, -0.2544393, -1.96244, 1, 0, 0, 1, 1,
-1.090666, 1.222524, -0.3276982, 0, 0, 0, 1, 1,
-1.082944, -0.1381854, -3.356851, 0, 0, 0, 1, 1,
-1.081234, -2.00916, -3.04129, 0, 0, 0, 1, 1,
-1.077013, -1.57961, -4.415051, 0, 0, 0, 1, 1,
-1.06746, -1.223548, -2.015133, 0, 0, 0, 1, 1,
-1.065932, -0.7196884, -1.613214, 0, 0, 0, 1, 1,
-1.058102, 0.7744879, 0.05773527, 0, 0, 0, 1, 1,
-1.058071, -0.7412634, -1.957016, 1, 1, 1, 1, 1,
-1.048216, -0.9169984, -2.397188, 1, 1, 1, 1, 1,
-1.045157, -0.6265708, -1.549846, 1, 1, 1, 1, 1,
-1.043431, -1.144051, -4.784577, 1, 1, 1, 1, 1,
-1.04012, 0.6386208, -0.3832578, 1, 1, 1, 1, 1,
-1.035723, -1.411279, -2.635252, 1, 1, 1, 1, 1,
-1.027699, -0.3459241, -0.8300781, 1, 1, 1, 1, 1,
-1.022896, -1.34234, -2.601773, 1, 1, 1, 1, 1,
-1.020569, 0.6350371, -0.5560148, 1, 1, 1, 1, 1,
-1.018856, -0.01278824, -1.368478, 1, 1, 1, 1, 1,
-1.015063, 0.8518981, -1.187539, 1, 1, 1, 1, 1,
-1.003243, 0.2933763, 1.19582, 1, 1, 1, 1, 1,
-1.000219, 0.238548, -3.211504, 1, 1, 1, 1, 1,
-0.9992542, -0.1065708, -1.995851, 1, 1, 1, 1, 1,
-0.9950465, 1.575226, -0.5927565, 1, 1, 1, 1, 1,
-0.9746879, 1.144129, -1.45663, 0, 0, 1, 1, 1,
-0.968565, 0.2340555, -0.9542212, 1, 0, 0, 1, 1,
-0.9672142, -0.814921, -2.449326, 1, 0, 0, 1, 1,
-0.9602283, -0.178023, -1.268414, 1, 0, 0, 1, 1,
-0.9601529, -0.9733165, -2.087805, 1, 0, 0, 1, 1,
-0.9580508, -0.04230024, -0.7217066, 1, 0, 0, 1, 1,
-0.9553636, 0.8775783, -0.4070158, 0, 0, 0, 1, 1,
-0.9487487, 0.1114408, -0.9659729, 0, 0, 0, 1, 1,
-0.9403607, -1.730811, -2.945591, 0, 0, 0, 1, 1,
-0.9337388, 1.993477, -0.2815925, 0, 0, 0, 1, 1,
-0.9246429, -1.499488, -2.171077, 0, 0, 0, 1, 1,
-0.9246327, -0.2342561, -2.617543, 0, 0, 0, 1, 1,
-0.9182875, -0.4666512, -2.257301, 0, 0, 0, 1, 1,
-0.9167716, 0.9175594, -2.654777, 1, 1, 1, 1, 1,
-0.9161765, 0.4619975, -0.7027014, 1, 1, 1, 1, 1,
-0.9148853, 0.05944107, -1.969265, 1, 1, 1, 1, 1,
-0.9146821, 1.247063, -0.859942, 1, 1, 1, 1, 1,
-0.9146777, 1.51573, -0.7011848, 1, 1, 1, 1, 1,
-0.9145778, 0.4421701, -0.6007539, 1, 1, 1, 1, 1,
-0.9135412, 2.047957, -0.09856071, 1, 1, 1, 1, 1,
-0.9069859, 1.075509, 0.9220954, 1, 1, 1, 1, 1,
-0.9053963, 0.242067, 1.207689, 1, 1, 1, 1, 1,
-0.9009266, 1.304717, 1.094584, 1, 1, 1, 1, 1,
-0.8961335, -0.7889714, -2.759862, 1, 1, 1, 1, 1,
-0.8948448, -0.8057622, -1.807966, 1, 1, 1, 1, 1,
-0.8935189, -1.246309, -2.169167, 1, 1, 1, 1, 1,
-0.8856185, 0.101471, -1.434277, 1, 1, 1, 1, 1,
-0.8821921, -0.1894779, -1.615414, 1, 1, 1, 1, 1,
-0.8783587, 1.267908, 1.494598, 0, 0, 1, 1, 1,
-0.8769216, -0.4184918, -0.3550758, 1, 0, 0, 1, 1,
-0.8737696, -0.2899898, -2.725338, 1, 0, 0, 1, 1,
-0.8699697, -0.7410072, -2.708094, 1, 0, 0, 1, 1,
-0.8678085, -0.6030349, -2.186291, 1, 0, 0, 1, 1,
-0.8646072, -1.076583, -2.309842, 1, 0, 0, 1, 1,
-0.8580101, -0.4822697, -3.333182, 0, 0, 0, 1, 1,
-0.8527259, 1.201, -1.082278, 0, 0, 0, 1, 1,
-0.8513639, 1.003388, -0.404395, 0, 0, 0, 1, 1,
-0.849767, 1.735805, -0.1578801, 0, 0, 0, 1, 1,
-0.8491056, 0.6892947, -1.481748, 0, 0, 0, 1, 1,
-0.8460985, 0.8594629, -1.704423, 0, 0, 0, 1, 1,
-0.8403206, -0.05803788, -1.589037, 0, 0, 0, 1, 1,
-0.839999, -0.8290781, -3.217883, 1, 1, 1, 1, 1,
-0.8370683, 1.383818, -1.490696, 1, 1, 1, 1, 1,
-0.8358126, -1.121566, -2.562419, 1, 1, 1, 1, 1,
-0.8329264, 2.430078, -0.5950088, 1, 1, 1, 1, 1,
-0.8261311, -0.1536685, -2.480238, 1, 1, 1, 1, 1,
-0.8249564, -1.360438, -4.300791, 1, 1, 1, 1, 1,
-0.8221778, -0.7607823, -3.110682, 1, 1, 1, 1, 1,
-0.8148838, 1.030439, -0.2562193, 1, 1, 1, 1, 1,
-0.813929, 0.4606473, 0.5644538, 1, 1, 1, 1, 1,
-0.8138596, 0.1744446, -2.115034, 1, 1, 1, 1, 1,
-0.8122132, -0.6675108, -1.37668, 1, 1, 1, 1, 1,
-0.8119335, 0.2974019, -1.047717, 1, 1, 1, 1, 1,
-0.8064729, -1.119738, -1.352972, 1, 1, 1, 1, 1,
-0.8051989, 0.0383036, -0.7136029, 1, 1, 1, 1, 1,
-0.804249, 2.259829, -0.09075727, 1, 1, 1, 1, 1,
-0.8029442, 1.17664, -1.123393, 0, 0, 1, 1, 1,
-0.7975343, -1.020454, -2.457145, 1, 0, 0, 1, 1,
-0.794815, 0.2208363, -0.3006881, 1, 0, 0, 1, 1,
-0.7902535, 1.979254, 2.524124, 1, 0, 0, 1, 1,
-0.7883964, 0.3818535, 0.2696065, 1, 0, 0, 1, 1,
-0.7822171, -1.826558, -3.072227, 1, 0, 0, 1, 1,
-0.7775182, 1.216814, -0.585384, 0, 0, 0, 1, 1,
-0.7729089, -1.625232, -1.106765, 0, 0, 0, 1, 1,
-0.769318, -0.09484558, -1.974094, 0, 0, 0, 1, 1,
-0.7663909, 0.5782576, 0.5438178, 0, 0, 0, 1, 1,
-0.7647771, 0.4093443, -0.05221853, 0, 0, 0, 1, 1,
-0.7632208, 0.8498788, -1.61952, 0, 0, 0, 1, 1,
-0.7631786, -0.9367548, -1.986822, 0, 0, 0, 1, 1,
-0.7610568, -0.2360811, -2.046054, 1, 1, 1, 1, 1,
-0.7575791, -0.4199214, -1.580528, 1, 1, 1, 1, 1,
-0.7440856, 0.7213946, -1.928693, 1, 1, 1, 1, 1,
-0.7408102, 0.2475071, -1.228528, 1, 1, 1, 1, 1,
-0.7367636, -0.2147068, -2.690131, 1, 1, 1, 1, 1,
-0.7277801, 0.09822877, 0.1905328, 1, 1, 1, 1, 1,
-0.727235, -0.1204322, -1.424289, 1, 1, 1, 1, 1,
-0.72576, 0.6896854, -1.16037, 1, 1, 1, 1, 1,
-0.7247201, 0.3086928, -1.470045, 1, 1, 1, 1, 1,
-0.7228949, 0.54579, -1.351655, 1, 1, 1, 1, 1,
-0.7079501, -0.2083348, -0.8801984, 1, 1, 1, 1, 1,
-0.7066942, 1.375906, 1.072973, 1, 1, 1, 1, 1,
-0.7049605, -1.417711, -2.142966, 1, 1, 1, 1, 1,
-0.7012273, 1.955257, -1.847003, 1, 1, 1, 1, 1,
-0.7000323, -1.906492, -3.366617, 1, 1, 1, 1, 1,
-0.6933278, -0.315369, -1.237481, 0, 0, 1, 1, 1,
-0.6930823, 0.1088504, -2.050233, 1, 0, 0, 1, 1,
-0.6898892, -0.4560667, -1.803638, 1, 0, 0, 1, 1,
-0.6897308, -0.1544212, -2.923541, 1, 0, 0, 1, 1,
-0.6876217, 1.007784, -0.6831967, 1, 0, 0, 1, 1,
-0.6863887, -0.06766623, -1.806662, 1, 0, 0, 1, 1,
-0.6862394, 1.395475, -0.07452262, 0, 0, 0, 1, 1,
-0.6844149, -0.06191707, -3.11648, 0, 0, 0, 1, 1,
-0.6839389, 0.3249877, -0.6290554, 0, 0, 0, 1, 1,
-0.6838099, 0.03803791, -2.57421, 0, 0, 0, 1, 1,
-0.6818594, 0.2207474, -1.591694, 0, 0, 0, 1, 1,
-0.6780232, 0.3671226, -1.171226, 0, 0, 0, 1, 1,
-0.6755033, -1.711802, -2.78617, 0, 0, 0, 1, 1,
-0.6745372, 1.613508, -1.484718, 1, 1, 1, 1, 1,
-0.6718297, 0.8424383, -1.221766, 1, 1, 1, 1, 1,
-0.6709353, 1.12646, -0.7597327, 1, 1, 1, 1, 1,
-0.665922, -0.5740758, -1.656428, 1, 1, 1, 1, 1,
-0.6629392, -1.921022, -2.884144, 1, 1, 1, 1, 1,
-0.6621253, -0.2395852, -2.847752, 1, 1, 1, 1, 1,
-0.6576864, -0.922778, -2.704607, 1, 1, 1, 1, 1,
-0.6567431, -1.060416, -3.625932, 1, 1, 1, 1, 1,
-0.6542434, 0.844995, -0.490997, 1, 1, 1, 1, 1,
-0.6481719, 0.4900485, -2.343314, 1, 1, 1, 1, 1,
-0.6476923, -2.352485, -3.69256, 1, 1, 1, 1, 1,
-0.6450594, 1.120598, -0.7389323, 1, 1, 1, 1, 1,
-0.6318229, 2.709717, 0.5221468, 1, 1, 1, 1, 1,
-0.62386, -1.003868, -0.5178051, 1, 1, 1, 1, 1,
-0.6238048, 2.888229, -0.6366983, 1, 1, 1, 1, 1,
-0.61831, -0.3261296, -2.238495, 0, 0, 1, 1, 1,
-0.6170338, -0.5357718, -1.094791, 1, 0, 0, 1, 1,
-0.6162655, 0.3409061, 0.2672584, 1, 0, 0, 1, 1,
-0.6073589, 0.9865856, -0.3084998, 1, 0, 0, 1, 1,
-0.6034303, -0.7466597, -1.903681, 1, 0, 0, 1, 1,
-0.60273, -0.9511215, -1.777942, 1, 0, 0, 1, 1,
-0.6018402, -0.6421389, -3.221443, 0, 0, 0, 1, 1,
-0.6005923, 0.5454533, -0.1604879, 0, 0, 0, 1, 1,
-0.5988942, -1.113726, -2.782416, 0, 0, 0, 1, 1,
-0.5960487, 0.7666796, -0.9362044, 0, 0, 0, 1, 1,
-0.5946047, 1.776798, -0.07948871, 0, 0, 0, 1, 1,
-0.5871285, -0.5905885, -1.689538, 0, 0, 0, 1, 1,
-0.5856955, 0.7034572, -1.623905, 0, 0, 0, 1, 1,
-0.5840648, -0.7224535, -3.144529, 1, 1, 1, 1, 1,
-0.5755467, -3.684683, -2.2295, 1, 1, 1, 1, 1,
-0.5706763, 0.5464587, -2.99301, 1, 1, 1, 1, 1,
-0.5706212, -0.6767938, -3.399235, 1, 1, 1, 1, 1,
-0.5657998, -0.6731768, -3.111169, 1, 1, 1, 1, 1,
-0.5638736, 0.8524816, -0.8843851, 1, 1, 1, 1, 1,
-0.5608764, -1.515089, -3.44315, 1, 1, 1, 1, 1,
-0.5577487, -0.4244205, -0.4082838, 1, 1, 1, 1, 1,
-0.5542315, -0.658059, -1.317434, 1, 1, 1, 1, 1,
-0.5514526, -1.566335, -3.76334, 1, 1, 1, 1, 1,
-0.546075, -0.3737225, -2.644619, 1, 1, 1, 1, 1,
-0.5451254, -0.6749811, -2.984207, 1, 1, 1, 1, 1,
-0.5435159, 1.17475, -0.499127, 1, 1, 1, 1, 1,
-0.541056, -0.9580188, -3.375488, 1, 1, 1, 1, 1,
-0.5403004, -0.07909226, -2.572712, 1, 1, 1, 1, 1,
-0.5378873, -1.535617, -2.442688, 0, 0, 1, 1, 1,
-0.5336578, -0.8021308, -3.911191, 1, 0, 0, 1, 1,
-0.5308372, -2.026574, -3.852102, 1, 0, 0, 1, 1,
-0.5293339, 0.6087285, 0.635873, 1, 0, 0, 1, 1,
-0.5287083, 2.15357, -0.3117298, 1, 0, 0, 1, 1,
-0.5257329, -1.218493, -2.411062, 1, 0, 0, 1, 1,
-0.5254008, -1.279806, -0.7356911, 0, 0, 0, 1, 1,
-0.5224184, 0.4239119, -1.652449, 0, 0, 0, 1, 1,
-0.5194609, 0.3872028, -2.330978, 0, 0, 0, 1, 1,
-0.5188908, 0.1431862, 0.4773364, 0, 0, 0, 1, 1,
-0.5168696, -0.5365753, -1.464939, 0, 0, 0, 1, 1,
-0.5108442, 0.429883, 0.1407663, 0, 0, 0, 1, 1,
-0.5105363, 0.6400915, -1.73534, 0, 0, 0, 1, 1,
-0.5088271, -1.548036, -1.588966, 1, 1, 1, 1, 1,
-0.5083616, -0.2882665, -2.296668, 1, 1, 1, 1, 1,
-0.493778, 0.6226836, -0.6256021, 1, 1, 1, 1, 1,
-0.4935351, -1.107061, -1.492417, 1, 1, 1, 1, 1,
-0.4877251, -0.2782871, -0.7671447, 1, 1, 1, 1, 1,
-0.4834626, 0.03313705, -2.323, 1, 1, 1, 1, 1,
-0.4722824, -0.7512416, -1.49838, 1, 1, 1, 1, 1,
-0.4720764, 0.1440474, -1.913392, 1, 1, 1, 1, 1,
-0.4709302, 1.303625, 2.426577, 1, 1, 1, 1, 1,
-0.4705968, 1.155413, -2.076972, 1, 1, 1, 1, 1,
-0.4686691, -1.601106, -2.698632, 1, 1, 1, 1, 1,
-0.4686503, 0.08385311, -1.449118, 1, 1, 1, 1, 1,
-0.4674612, 2.41265, -2.001693, 1, 1, 1, 1, 1,
-0.4661469, 1.176148, -0.6907704, 1, 1, 1, 1, 1,
-0.4657152, 1.107944, -0.3108041, 1, 1, 1, 1, 1,
-0.4634948, 1.424734, 1.818268, 0, 0, 1, 1, 1,
-0.4621243, 0.6638287, 0.07382168, 1, 0, 0, 1, 1,
-0.4591461, 0.5098293, 0.05564704, 1, 0, 0, 1, 1,
-0.4589115, -0.4445218, -2.536752, 1, 0, 0, 1, 1,
-0.4536622, 0.6908725, 0.489798, 1, 0, 0, 1, 1,
-0.4529276, -0.5266829, -4.013598, 1, 0, 0, 1, 1,
-0.452401, 0.2032316, -3.309658, 0, 0, 0, 1, 1,
-0.4496569, 0.3825056, -1.732565, 0, 0, 0, 1, 1,
-0.4453157, 0.2540993, -2.068987, 0, 0, 0, 1, 1,
-0.4391518, 0.03133633, -1.157781, 0, 0, 0, 1, 1,
-0.4371957, -1.217932, -3.40516, 0, 0, 0, 1, 1,
-0.4350057, 0.9092906, -0.1702265, 0, 0, 0, 1, 1,
-0.426938, 0.157143, -1.394138, 0, 0, 0, 1, 1,
-0.4213813, -0.8158727, -4.308495, 1, 1, 1, 1, 1,
-0.4183379, 0.0182659, -0.3243887, 1, 1, 1, 1, 1,
-0.4177373, 0.5365207, 0.277827, 1, 1, 1, 1, 1,
-0.4176556, -0.5888346, -1.393099, 1, 1, 1, 1, 1,
-0.4171878, 0.7779391, -1.707892, 1, 1, 1, 1, 1,
-0.4165978, 1.266472, -1.131375, 1, 1, 1, 1, 1,
-0.4161648, 0.3889776, -0.2246892, 1, 1, 1, 1, 1,
-0.4102, -0.3734693, -2.945392, 1, 1, 1, 1, 1,
-0.4095616, -1.339092, -3.9911, 1, 1, 1, 1, 1,
-0.4071428, -1.118098, -4.311704, 1, 1, 1, 1, 1,
-0.4063926, -1.57142, -3.214425, 1, 1, 1, 1, 1,
-0.4014886, 0.006503933, -0.711171, 1, 1, 1, 1, 1,
-0.4011279, -1.243051, -3.402716, 1, 1, 1, 1, 1,
-0.3988868, -1.227154, -4.424181, 1, 1, 1, 1, 1,
-0.3904148, 1.640379, -1.623533, 1, 1, 1, 1, 1,
-0.388844, -0.5703813, -3.284297, 0, 0, 1, 1, 1,
-0.3869705, -0.423506, -1.494404, 1, 0, 0, 1, 1,
-0.385954, 0.1042894, 0.2855132, 1, 0, 0, 1, 1,
-0.3843254, -0.303853, -2.763777, 1, 0, 0, 1, 1,
-0.3838732, -1.080843, -2.414427, 1, 0, 0, 1, 1,
-0.3810975, 0.7330943, -1.535144, 1, 0, 0, 1, 1,
-0.3809455, -0.4466793, -2.741532, 0, 0, 0, 1, 1,
-0.3779209, 0.6530074, 0.4752792, 0, 0, 0, 1, 1,
-0.3736615, -0.668415, -3.144919, 0, 0, 0, 1, 1,
-0.3697929, -0.2297626, -2.235366, 0, 0, 0, 1, 1,
-0.3645528, 0.7657167, 0.4948611, 0, 0, 0, 1, 1,
-0.3588983, 1.026517, 0.4124411, 0, 0, 0, 1, 1,
-0.3575513, -0.2556545, -3.378382, 0, 0, 0, 1, 1,
-0.3532288, 0.1765558, -0.5963323, 1, 1, 1, 1, 1,
-0.347402, 0.845694, -1.062922, 1, 1, 1, 1, 1,
-0.345084, 0.7104405, 0.01425783, 1, 1, 1, 1, 1,
-0.3443486, -0.7559329, -1.745429, 1, 1, 1, 1, 1,
-0.3422781, -1.570883, -1.743504, 1, 1, 1, 1, 1,
-0.3415312, -0.3710306, -0.892253, 1, 1, 1, 1, 1,
-0.3339722, -0.8481606, -1.835166, 1, 1, 1, 1, 1,
-0.3322561, -0.4689998, -0.8412745, 1, 1, 1, 1, 1,
-0.3294374, 0.8833893, 1.076096, 1, 1, 1, 1, 1,
-0.3258026, 1.932351, 0.7949588, 1, 1, 1, 1, 1,
-0.3184633, 0.1205854, 1.368882, 1, 1, 1, 1, 1,
-0.317334, -0.3979627, -3.730744, 1, 1, 1, 1, 1,
-0.3129512, 1.285129, -1.667067, 1, 1, 1, 1, 1,
-0.3125807, 0.2164053, 1.587098, 1, 1, 1, 1, 1,
-0.3089624, -1.439739, -3.847061, 1, 1, 1, 1, 1,
-0.3067804, -1.697918, -5.05332, 0, 0, 1, 1, 1,
-0.3067359, -0.6458732, -2.614452, 1, 0, 0, 1, 1,
-0.3059785, -0.619791, -1.98407, 1, 0, 0, 1, 1,
-0.3038268, 0.7578403, 0.9912633, 1, 0, 0, 1, 1,
-0.2984385, 1.716944, 0.9715546, 1, 0, 0, 1, 1,
-0.2963258, 0.2536522, -1.17101, 1, 0, 0, 1, 1,
-0.2955174, -1.373845, -4.023024, 0, 0, 0, 1, 1,
-0.2895822, -1.436056, -3.698584, 0, 0, 0, 1, 1,
-0.2829023, 0.08396062, 0.3507997, 0, 0, 0, 1, 1,
-0.2810496, 0.5440535, 0.830612, 0, 0, 0, 1, 1,
-0.2774062, -0.1225566, 0.1716423, 0, 0, 0, 1, 1,
-0.2750185, 0.3400396, -1.627701, 0, 0, 0, 1, 1,
-0.2735319, 1.751036, 0.8508459, 0, 0, 0, 1, 1,
-0.2718104, 0.424141, -1.202682, 1, 1, 1, 1, 1,
-0.2655746, -1.070627, -1.496474, 1, 1, 1, 1, 1,
-0.2620632, -2.28087, -3.383124, 1, 1, 1, 1, 1,
-0.2614114, 0.08592218, -1.817541, 1, 1, 1, 1, 1,
-0.2586319, 0.681918, -1.361004, 1, 1, 1, 1, 1,
-0.2580041, -2.399544, -1.764817, 1, 1, 1, 1, 1,
-0.2566186, 1.497118, 0.3717563, 1, 1, 1, 1, 1,
-0.2548138, 1.400586, 1.505157, 1, 1, 1, 1, 1,
-0.2461322, 0.654156, 0.846435, 1, 1, 1, 1, 1,
-0.2438727, 0.6119637, 0.3867234, 1, 1, 1, 1, 1,
-0.2434858, -1.693583, -3.751517, 1, 1, 1, 1, 1,
-0.2426755, -1.088914, -1.131485, 1, 1, 1, 1, 1,
-0.239592, -0.6648883, -1.784269, 1, 1, 1, 1, 1,
-0.2346719, -0.05110859, 1.050152, 1, 1, 1, 1, 1,
-0.2340564, 0.1251112, -0.9134018, 1, 1, 1, 1, 1,
-0.2317545, -0.816395, -2.806219, 0, 0, 1, 1, 1,
-0.2286821, -0.1017697, -2.083035, 1, 0, 0, 1, 1,
-0.2266364, 0.7143861, 0.8450072, 1, 0, 0, 1, 1,
-0.2253862, -0.0522063, -0.84852, 1, 0, 0, 1, 1,
-0.2211405, -0.9229588, -2.769213, 1, 0, 0, 1, 1,
-0.2140862, -1.086474, -2.168104, 1, 0, 0, 1, 1,
-0.2132388, -0.9862238, -3.45888, 0, 0, 0, 1, 1,
-0.2121845, 0.2083551, -0.5215187, 0, 0, 0, 1, 1,
-0.211979, -0.5185546, -1.054416, 0, 0, 0, 1, 1,
-0.2112234, 1.114222, 0.6090069, 0, 0, 0, 1, 1,
-0.2046629, 1.076292, -0.9248492, 0, 0, 0, 1, 1,
-0.203436, 0.679413, -1.486948, 0, 0, 0, 1, 1,
-0.202048, 0.8164233, -0.02991911, 0, 0, 0, 1, 1,
-0.1974491, -0.4946343, -2.709665, 1, 1, 1, 1, 1,
-0.1955767, 2.30642, 0.4479176, 1, 1, 1, 1, 1,
-0.1933462, -0.3084995, -2.249106, 1, 1, 1, 1, 1,
-0.1922258, 1.669993, -0.9271906, 1, 1, 1, 1, 1,
-0.191547, -0.6127508, -3.01474, 1, 1, 1, 1, 1,
-0.1899717, 0.3777981, -0.4849716, 1, 1, 1, 1, 1,
-0.1899335, -0.9653884, -3.942481, 1, 1, 1, 1, 1,
-0.1891766, -0.5432174, -3.435558, 1, 1, 1, 1, 1,
-0.1886133, -0.4470824, -3.183792, 1, 1, 1, 1, 1,
-0.1881093, 0.7287796, 0.9998336, 1, 1, 1, 1, 1,
-0.184383, -0.135658, -1.316834, 1, 1, 1, 1, 1,
-0.1836654, 1.247536, 1.164039, 1, 1, 1, 1, 1,
-0.1818998, -0.9837743, -1.975761, 1, 1, 1, 1, 1,
-0.1782143, -0.4223005, -1.384908, 1, 1, 1, 1, 1,
-0.1738006, 0.4394125, -0.07914339, 1, 1, 1, 1, 1,
-0.1729276, 0.1206549, 0.7795311, 0, 0, 1, 1, 1,
-0.1729145, 0.557173, -0.6032779, 1, 0, 0, 1, 1,
-0.1679786, 1.447222, 1.476512, 1, 0, 0, 1, 1,
-0.1669914, 0.3550762, -0.274677, 1, 0, 0, 1, 1,
-0.1613201, 1.288368, -1.782044, 1, 0, 0, 1, 1,
-0.1611629, -1.571358, -1.835876, 1, 0, 0, 1, 1,
-0.1603621, -1.04781, -3.160607, 0, 0, 0, 1, 1,
-0.149667, 0.2197314, 0.3288713, 0, 0, 0, 1, 1,
-0.1455368, 1.004988, 0.8045598, 0, 0, 0, 1, 1,
-0.1432565, 1.074023, -1.213725, 0, 0, 0, 1, 1,
-0.1424108, -0.7154434, -3.551634, 0, 0, 0, 1, 1,
-0.1416917, 1.440418, -0.03725488, 0, 0, 0, 1, 1,
-0.1407529, -0.3851942, -3.480458, 0, 0, 0, 1, 1,
-0.1370884, 0.4257568, -0.8103908, 1, 1, 1, 1, 1,
-0.1332395, -0.4211496, -1.711424, 1, 1, 1, 1, 1,
-0.1320959, 1.356183, -0.4961629, 1, 1, 1, 1, 1,
-0.1319116, 0.673988, -0.5421118, 1, 1, 1, 1, 1,
-0.1314834, 1.050894, -0.6813955, 1, 1, 1, 1, 1,
-0.1301183, -0.4359988, -1.832461, 1, 1, 1, 1, 1,
-0.1278737, -1.819214, -2.228078, 1, 1, 1, 1, 1,
-0.1276222, -1.176917, -3.194111, 1, 1, 1, 1, 1,
-0.1273383, 0.2694461, -0.8497227, 1, 1, 1, 1, 1,
-0.1265453, -0.6386657, -2.234698, 1, 1, 1, 1, 1,
-0.1222587, 0.5749609, -3.272221, 1, 1, 1, 1, 1,
-0.1218836, -1.344073, -2.816499, 1, 1, 1, 1, 1,
-0.1214666, -1.05378, -2.922108, 1, 1, 1, 1, 1,
-0.1188813, 1.353983, 0.6376686, 1, 1, 1, 1, 1,
-0.1184221, -0.2740355, -3.520286, 1, 1, 1, 1, 1,
-0.1171825, 0.431931, -1.101398, 0, 0, 1, 1, 1,
-0.1143348, -0.5593606, -2.322151, 1, 0, 0, 1, 1,
-0.1132056, 0.9136652, -0.4970941, 1, 0, 0, 1, 1,
-0.1115803, -1.003634, -3.744105, 1, 0, 0, 1, 1,
-0.1057602, 0.8297873, -0.3653701, 1, 0, 0, 1, 1,
-0.1034397, -1.946155, -3.102491, 1, 0, 0, 1, 1,
-0.1028454, -0.8777956, -1.662634, 0, 0, 0, 1, 1,
-0.1014193, 0.4759569, 1.341206, 0, 0, 0, 1, 1,
-0.1013273, -0.6596715, -3.468394, 0, 0, 0, 1, 1,
-0.09993405, -1.247917, -3.023572, 0, 0, 0, 1, 1,
-0.09831876, 0.6546156, -0.1241274, 0, 0, 0, 1, 1,
-0.08748928, 2.159049, -0.6509099, 0, 0, 0, 1, 1,
-0.08319976, 0.7400109, -0.9390568, 0, 0, 0, 1, 1,
-0.08287036, -0.8103426, -2.637598, 1, 1, 1, 1, 1,
-0.07954007, -0.8298159, -4.161743, 1, 1, 1, 1, 1,
-0.07675853, 0.9951204, -1.73655, 1, 1, 1, 1, 1,
-0.07096227, 0.306996, -1.29452, 1, 1, 1, 1, 1,
-0.06980379, -0.09292894, -2.578637, 1, 1, 1, 1, 1,
-0.06868728, 2.354597, 0.6494048, 1, 1, 1, 1, 1,
-0.06805249, -1.070408, -3.550383, 1, 1, 1, 1, 1,
-0.06362583, 0.4146533, 1.621352, 1, 1, 1, 1, 1,
-0.06317516, -0.5744044, -3.317936, 1, 1, 1, 1, 1,
-0.05739864, -0.3766154, -2.082312, 1, 1, 1, 1, 1,
-0.05362388, 1.64933, 2.19073, 1, 1, 1, 1, 1,
-0.05125974, -0.4820496, -3.04865, 1, 1, 1, 1, 1,
-0.05060338, 1.631834, -0.3863254, 1, 1, 1, 1, 1,
-0.04774356, -1.378583, -1.911469, 1, 1, 1, 1, 1,
-0.04743795, 0.7846855, -0.3939245, 1, 1, 1, 1, 1,
-0.04736954, -0.836822, -4.032162, 0, 0, 1, 1, 1,
-0.0416704, -0.9686457, -3.32611, 1, 0, 0, 1, 1,
-0.04046228, -0.8440552, -4.127962, 1, 0, 0, 1, 1,
-0.03922807, -0.005847326, -2.247626, 1, 0, 0, 1, 1,
-0.03850241, -1.524266, -3.244032, 1, 0, 0, 1, 1,
-0.03819289, -0.06057428, -3.072538, 1, 0, 0, 1, 1,
-0.03472508, -0.4871356, -4.504251, 0, 0, 0, 1, 1,
-0.0252003, -1.674966, -4.677447, 0, 0, 0, 1, 1,
-0.02205092, 0.1790588, 0.2536815, 0, 0, 0, 1, 1,
-0.02189302, 1.792484, 1.818573, 0, 0, 0, 1, 1,
-0.01429356, 0.2492369, 2.17679, 0, 0, 0, 1, 1,
-0.01387407, -1.06502, -2.549906, 0, 0, 0, 1, 1,
-0.01337324, -2.21073, -3.065673, 0, 0, 0, 1, 1,
-0.01221141, 1.568736, -0.4601974, 1, 1, 1, 1, 1,
-0.01165178, 0.6432327, -0.9332116, 1, 1, 1, 1, 1,
-0.01146449, 0.05117543, 1.375366, 1, 1, 1, 1, 1,
-0.009634724, 0.4858108, -1.727602, 1, 1, 1, 1, 1,
-0.008690321, -1.863909, -4.794204, 1, 1, 1, 1, 1,
-0.007888354, -0.9675481, -1.909782, 1, 1, 1, 1, 1,
-0.006889948, -0.3076009, -2.525841, 1, 1, 1, 1, 1,
-0.005296439, -0.1074593, -2.049262, 1, 1, 1, 1, 1,
0.001382857, 0.05287249, 0.1552017, 1, 1, 1, 1, 1,
0.001560222, -0.4601701, 3.327063, 1, 1, 1, 1, 1,
0.001812054, -0.08848604, 4.303832, 1, 1, 1, 1, 1,
0.005363069, -0.7751638, 2.734011, 1, 1, 1, 1, 1,
0.01238785, -1.176914, 2.250027, 1, 1, 1, 1, 1,
0.01988484, 0.2699825, -0.2644541, 1, 1, 1, 1, 1,
0.01989121, -0.7829241, 2.873784, 1, 1, 1, 1, 1,
0.02298182, 2.117524, 0.4612055, 0, 0, 1, 1, 1,
0.02714276, 0.1257144, 0.7478686, 1, 0, 0, 1, 1,
0.03565901, -0.4192386, 3.1003, 1, 0, 0, 1, 1,
0.03603744, -0.11492, 2.746746, 1, 0, 0, 1, 1,
0.0360517, -2.078249, 3.248951, 1, 0, 0, 1, 1,
0.03743106, -0.5335823, 2.537853, 1, 0, 0, 1, 1,
0.03908478, 2.15761, 1.360898, 0, 0, 0, 1, 1,
0.04586228, 0.9635563, -0.7547002, 0, 0, 0, 1, 1,
0.04724303, 1.240617, 1.10055, 0, 0, 0, 1, 1,
0.04980288, 0.7987235, -0.1697934, 0, 0, 0, 1, 1,
0.05071698, -0.756507, 3.060381, 0, 0, 0, 1, 1,
0.05597975, -1.519976, 2.398395, 0, 0, 0, 1, 1,
0.05880778, -0.9292505, 1.194743, 0, 0, 0, 1, 1,
0.05903212, -0.7632865, 4.115287, 1, 1, 1, 1, 1,
0.05976751, -0.9528639, 2.542421, 1, 1, 1, 1, 1,
0.05988909, -1.806743, 4.218374, 1, 1, 1, 1, 1,
0.06237547, 0.0170581, 0.3791195, 1, 1, 1, 1, 1,
0.06443006, -1.195659, 3.050797, 1, 1, 1, 1, 1,
0.06581324, 0.5578831, 0.7798318, 1, 1, 1, 1, 1,
0.06693882, 1.890666, -0.9901078, 1, 1, 1, 1, 1,
0.06724164, 0.4076829, 0.4421966, 1, 1, 1, 1, 1,
0.07215022, -0.2492937, 2.248092, 1, 1, 1, 1, 1,
0.07364275, -0.3726064, 1.506065, 1, 1, 1, 1, 1,
0.07424027, 0.8430477, 0.8161262, 1, 1, 1, 1, 1,
0.07542463, 1.064462, -0.183841, 1, 1, 1, 1, 1,
0.07799672, 0.3960725, 0.02550933, 1, 1, 1, 1, 1,
0.07804652, 0.02945475, 0.7348925, 1, 1, 1, 1, 1,
0.08191235, 0.4057544, -0.7105882, 1, 1, 1, 1, 1,
0.08302914, -2.026197, 2.648494, 0, 0, 1, 1, 1,
0.08766331, -0.6377214, 5.231984, 1, 0, 0, 1, 1,
0.08935358, -0.03496964, 4.412279, 1, 0, 0, 1, 1,
0.08948815, 0.3010083, 1.075534, 1, 0, 0, 1, 1,
0.089505, -0.6983126, 2.817122, 1, 0, 0, 1, 1,
0.08961215, 0.5495248, -1.045277, 1, 0, 0, 1, 1,
0.09237264, -1.398187, 2.935136, 0, 0, 0, 1, 1,
0.09527949, 0.0927403, -0.225058, 0, 0, 0, 1, 1,
0.09736785, -1.156252, 4.412729, 0, 0, 0, 1, 1,
0.1016296, -0.1312188, 4.432907, 0, 0, 0, 1, 1,
0.1025932, -0.6136647, 2.820571, 0, 0, 0, 1, 1,
0.1032952, 0.1107886, -0.1680358, 0, 0, 0, 1, 1,
0.1038386, 0.9440105, -0.7355253, 0, 0, 0, 1, 1,
0.1040959, 0.6850468, -0.07799707, 1, 1, 1, 1, 1,
0.1049958, 0.1281803, 0.1176496, 1, 1, 1, 1, 1,
0.1084336, -0.6148301, 1.601088, 1, 1, 1, 1, 1,
0.1086693, -0.9219967, 2.475717, 1, 1, 1, 1, 1,
0.1124618, -0.2620079, 1.832297, 1, 1, 1, 1, 1,
0.1133814, 0.5069869, 0.1049109, 1, 1, 1, 1, 1,
0.1153025, -1.008814, 2.959719, 1, 1, 1, 1, 1,
0.1153071, 0.1405995, 0.2586344, 1, 1, 1, 1, 1,
0.1177443, 0.007895543, 2.000046, 1, 1, 1, 1, 1,
0.1192575, -1.643469, 2.98857, 1, 1, 1, 1, 1,
0.1264402, 1.348776, -0.188443, 1, 1, 1, 1, 1,
0.1293353, -0.3954976, 4.610704, 1, 1, 1, 1, 1,
0.1314884, -0.3628326, 1.678744, 1, 1, 1, 1, 1,
0.1401366, 0.9880002, 0.8978623, 1, 1, 1, 1, 1,
0.1419265, -0.2228374, 1.567189, 1, 1, 1, 1, 1,
0.1432919, -0.669035, 2.685226, 0, 0, 1, 1, 1,
0.1447591, 0.02007667, -0.2656613, 1, 0, 0, 1, 1,
0.1467839, 1.788288, -0.3393069, 1, 0, 0, 1, 1,
0.1485644, 1.099597, 1.41625, 1, 0, 0, 1, 1,
0.149102, 0.4667816, -0.7954257, 1, 0, 0, 1, 1,
0.1520905, 2.229684, 0.01492721, 1, 0, 0, 1, 1,
0.1527958, 0.1608006, 0.5941051, 0, 0, 0, 1, 1,
0.1534396, -0.3510753, 2.093465, 0, 0, 0, 1, 1,
0.1559548, 0.9028181, -0.9211844, 0, 0, 0, 1, 1,
0.1576623, -0.7080537, 3.742733, 0, 0, 0, 1, 1,
0.1605459, -0.1267294, 0.8897762, 0, 0, 0, 1, 1,
0.1607625, 0.7651086, -0.8972083, 0, 0, 0, 1, 1,
0.1633764, -0.4941373, 3.355698, 0, 0, 0, 1, 1,
0.163843, -0.7980408, 1.877725, 1, 1, 1, 1, 1,
0.164494, -0.187024, 1.553591, 1, 1, 1, 1, 1,
0.1665995, 0.03576272, 1.461941, 1, 1, 1, 1, 1,
0.1678716, 1.912109, 3.119365, 1, 1, 1, 1, 1,
0.1681789, -0.4871044, 3.212555, 1, 1, 1, 1, 1,
0.1682831, -1.780875, 3.762042, 1, 1, 1, 1, 1,
0.1691993, 0.05264209, 0.1728163, 1, 1, 1, 1, 1,
0.1695772, -1.265741, 4.236067, 1, 1, 1, 1, 1,
0.1714559, 0.407819, 0.7429871, 1, 1, 1, 1, 1,
0.1726447, -0.001615839, 1.839709, 1, 1, 1, 1, 1,
0.1731185, 0.2743336, -1.960534, 1, 1, 1, 1, 1,
0.1759033, -0.7956594, 3.999048, 1, 1, 1, 1, 1,
0.1802729, 0.3474154, 1.979243, 1, 1, 1, 1, 1,
0.1812577, 2.092441, -0.1487144, 1, 1, 1, 1, 1,
0.1819438, -0.5287517, 1.617362, 1, 1, 1, 1, 1,
0.183245, 0.344196, -0.9482781, 0, 0, 1, 1, 1,
0.1855306, -0.5742514, 3.719453, 1, 0, 0, 1, 1,
0.1945199, -0.5659659, 1.315215, 1, 0, 0, 1, 1,
0.196982, -0.8057249, 3.606411, 1, 0, 0, 1, 1,
0.1987559, -0.5619065, 2.849053, 1, 0, 0, 1, 1,
0.2021666, 1.390732, 0.8158941, 1, 0, 0, 1, 1,
0.2078488, 0.8445841, -1.340521, 0, 0, 0, 1, 1,
0.2092039, 1.295201, 1.950607, 0, 0, 0, 1, 1,
0.213968, -0.4626272, 0.7575688, 0, 0, 0, 1, 1,
0.2146012, -0.1762833, 0.1679005, 0, 0, 0, 1, 1,
0.2193827, 0.06292876, 2.452663, 0, 0, 0, 1, 1,
0.2211518, 1.248532, 0.6884034, 0, 0, 0, 1, 1,
0.2220174, -0.2177285, 1.815985, 0, 0, 0, 1, 1,
0.2243353, 0.1325055, 2.209844, 1, 1, 1, 1, 1,
0.2280769, 0.3822649, -0.3515166, 1, 1, 1, 1, 1,
0.2356827, 1.266205, 0.5993201, 1, 1, 1, 1, 1,
0.2386611, 0.388, 1.634227, 1, 1, 1, 1, 1,
0.241585, 0.3524292, 2.135875, 1, 1, 1, 1, 1,
0.2432934, -1.55122, 3.391475, 1, 1, 1, 1, 1,
0.2457583, -1.344928, 3.677649, 1, 1, 1, 1, 1,
0.2460739, -1.011236, 1.956353, 1, 1, 1, 1, 1,
0.2470977, 1.382394, -0.1649978, 1, 1, 1, 1, 1,
0.2524134, 0.2538998, 1.42932, 1, 1, 1, 1, 1,
0.2528425, -0.0351025, 0.6745564, 1, 1, 1, 1, 1,
0.2592054, 0.3127448, -0.1252378, 1, 1, 1, 1, 1,
0.261374, 0.7775258, 0.6022136, 1, 1, 1, 1, 1,
0.2635898, -0.3931415, 2.242179, 1, 1, 1, 1, 1,
0.2649983, -1.280834, 1.657871, 1, 1, 1, 1, 1,
0.2653223, -0.2995473, 3.102045, 0, 0, 1, 1, 1,
0.2676307, 0.3745091, -0.1953725, 1, 0, 0, 1, 1,
0.2702502, -0.3640547, 0.9988641, 1, 0, 0, 1, 1,
0.270523, -0.7083982, 4.73874, 1, 0, 0, 1, 1,
0.2814654, 0.07148509, 0.9821325, 1, 0, 0, 1, 1,
0.282079, 2.032095, 0.2018816, 1, 0, 0, 1, 1,
0.2821981, 0.2719965, -1.144634, 0, 0, 0, 1, 1,
0.285069, 1.21495, 0.4336232, 0, 0, 0, 1, 1,
0.2923299, 0.3410992, 0.8519733, 0, 0, 0, 1, 1,
0.298077, 1.372918, 1.449076, 0, 0, 0, 1, 1,
0.3029947, 1.057, -0.2467711, 0, 0, 0, 1, 1,
0.3070886, -0.8085394, 2.389783, 0, 0, 0, 1, 1,
0.3073888, -0.4039644, 4.3476, 0, 0, 0, 1, 1,
0.3074499, 1.462362, 1.613957, 1, 1, 1, 1, 1,
0.3102746, 0.8357934, 1.153097, 1, 1, 1, 1, 1,
0.3126142, -1.570122, 1.466776, 1, 1, 1, 1, 1,
0.315199, -0.03460172, 1.273305, 1, 1, 1, 1, 1,
0.3180009, 0.661621, 2.49781, 1, 1, 1, 1, 1,
0.3188043, -0.7695048, 3.332951, 1, 1, 1, 1, 1,
0.3220269, -0.1371711, 0.9162723, 1, 1, 1, 1, 1,
0.3241256, -1.62269, 1.473607, 1, 1, 1, 1, 1,
0.3246314, 0.9812779, 0.5673124, 1, 1, 1, 1, 1,
0.327448, 0.4027328, 0.929333, 1, 1, 1, 1, 1,
0.3308336, 0.114111, 0.7803229, 1, 1, 1, 1, 1,
0.3329467, 1.032748, 0.4272754, 1, 1, 1, 1, 1,
0.3346725, 1.390658, 0.2455635, 1, 1, 1, 1, 1,
0.3384843, -0.02447791, 2.840858, 1, 1, 1, 1, 1,
0.3432881, -0.3338755, 1.756051, 1, 1, 1, 1, 1,
0.3464665, -1.467305, 1.678612, 0, 0, 1, 1, 1,
0.3519873, 0.7758214, 2.409387, 1, 0, 0, 1, 1,
0.3562516, -0.7637665, 3.214184, 1, 0, 0, 1, 1,
0.3579625, 1.176703, -0.616047, 1, 0, 0, 1, 1,
0.3586358, -0.3789894, 3.080682, 1, 0, 0, 1, 1,
0.3596609, -2.262179, 3.446496, 1, 0, 0, 1, 1,
0.3632618, 0.1701971, 0.8403937, 0, 0, 0, 1, 1,
0.3657638, -0.9641116, 3.012683, 0, 0, 0, 1, 1,
0.3686158, -0.6891224, 1.69452, 0, 0, 0, 1, 1,
0.3694312, 1.479465, -0.2387977, 0, 0, 0, 1, 1,
0.3703435, -2.14188, 2.88176, 0, 0, 0, 1, 1,
0.3709878, -0.0924228, 1.204956, 0, 0, 0, 1, 1,
0.3722054, 0.6473237, 0.4779766, 0, 0, 0, 1, 1,
0.3759369, -0.6989696, 2.568609, 1, 1, 1, 1, 1,
0.3794988, -0.3386897, 1.866419, 1, 1, 1, 1, 1,
0.3807111, 1.222391, 0.4147342, 1, 1, 1, 1, 1,
0.3814253, 0.167934, 1.342321, 1, 1, 1, 1, 1,
0.3873447, 1.054071, 1.092231, 1, 1, 1, 1, 1,
0.3877798, -0.2004649, 3.262518, 1, 1, 1, 1, 1,
0.3904543, 1.292399, 2.217683, 1, 1, 1, 1, 1,
0.3939468, 0.778854, 1.889801, 1, 1, 1, 1, 1,
0.3978663, -0.8059663, 4.194779, 1, 1, 1, 1, 1,
0.4001481, 0.672587, 0.1444337, 1, 1, 1, 1, 1,
0.4006231, -0.603147, 2.971264, 1, 1, 1, 1, 1,
0.403455, 1.712106, 0.03755658, 1, 1, 1, 1, 1,
0.4079348, -0.4191754, 0.3324713, 1, 1, 1, 1, 1,
0.4135512, -0.2977577, 1.698713, 1, 1, 1, 1, 1,
0.4157413, -1.525395, 3.76323, 1, 1, 1, 1, 1,
0.4167924, -0.7862379, 3.595433, 0, 0, 1, 1, 1,
0.4171535, 0.1186945, 1.991821, 1, 0, 0, 1, 1,
0.4198277, -0.3304193, 2.292437, 1, 0, 0, 1, 1,
0.42103, 1.256679, -1.090687, 1, 0, 0, 1, 1,
0.4233753, 1.081519, -0.09538829, 1, 0, 0, 1, 1,
0.4242669, 0.8867303, -0.7042189, 1, 0, 0, 1, 1,
0.4255773, -0.2114645, 1.57829, 0, 0, 0, 1, 1,
0.4266959, -0.2471561, 3.252327, 0, 0, 0, 1, 1,
0.4280959, 2.143758, 0.6742871, 0, 0, 0, 1, 1,
0.430396, 0.1262373, 3.616539, 0, 0, 0, 1, 1,
0.4396086, -1.083713, 2.837045, 0, 0, 0, 1, 1,
0.441302, 0.9650933, 0.7504613, 0, 0, 0, 1, 1,
0.4461064, 0.146629, -0.3959486, 0, 0, 0, 1, 1,
0.4461976, -1.508811, 2.049217, 1, 1, 1, 1, 1,
0.4487557, -0.631625, 1.5735, 1, 1, 1, 1, 1,
0.4541949, 0.6384973, 0.1011343, 1, 1, 1, 1, 1,
0.4554128, -0.2772328, 1.3444, 1, 1, 1, 1, 1,
0.4597898, -0.807851, 2.401634, 1, 1, 1, 1, 1,
0.4643881, 0.3712486, -0.03524866, 1, 1, 1, 1, 1,
0.4734038, 0.6253946, 0.5727294, 1, 1, 1, 1, 1,
0.4746592, 0.2581244, 1.808394, 1, 1, 1, 1, 1,
0.4747351, 0.04994837, 0.9575073, 1, 1, 1, 1, 1,
0.4802283, 0.486569, 1.620405, 1, 1, 1, 1, 1,
0.4838657, 0.2594874, 1.062591, 1, 1, 1, 1, 1,
0.4882155, 0.0187433, 0.9484539, 1, 1, 1, 1, 1,
0.4884157, -0.5706324, 2.210129, 1, 1, 1, 1, 1,
0.4889734, 1.437793, 0.7996466, 1, 1, 1, 1, 1,
0.4893228, 0.09452189, 0.9559333, 1, 1, 1, 1, 1,
0.490172, -0.8219544, 1.576641, 0, 0, 1, 1, 1,
0.491155, -0.08403553, 3.26107, 1, 0, 0, 1, 1,
0.4917297, 0.182676, 0.9864451, 1, 0, 0, 1, 1,
0.4921993, -0.5496849, 3.224713, 1, 0, 0, 1, 1,
0.4937924, -1.435564, 3.276463, 1, 0, 0, 1, 1,
0.496164, -0.6961499, 1.018697, 1, 0, 0, 1, 1,
0.497097, -0.3365051, 2.152209, 0, 0, 0, 1, 1,
0.5095051, -0.7445136, 2.753529, 0, 0, 0, 1, 1,
0.5150668, 1.429029, -0.6644353, 0, 0, 0, 1, 1,
0.5163271, 0.7851749, 1.164636, 0, 0, 0, 1, 1,
0.5197163, -2.596939, 5.52592, 0, 0, 0, 1, 1,
0.526392, -0.1236262, 0.5995128, 0, 0, 0, 1, 1,
0.538189, -0.2509831, 1.496206, 0, 0, 0, 1, 1,
0.5397168, -0.4632798, 4.209509, 1, 1, 1, 1, 1,
0.5448972, -0.6159912, 2.10588, 1, 1, 1, 1, 1,
0.5450019, 1.438496, 0.4807143, 1, 1, 1, 1, 1,
0.5460356, 1.736882, -0.02592514, 1, 1, 1, 1, 1,
0.5463195, -0.483314, 2.399482, 1, 1, 1, 1, 1,
0.5481198, -0.7443544, 1.319235, 1, 1, 1, 1, 1,
0.5503995, -1.570359, 2.271314, 1, 1, 1, 1, 1,
0.5584333, -0.7670814, 4.318257, 1, 1, 1, 1, 1,
0.5603887, -0.1344836, 1.92042, 1, 1, 1, 1, 1,
0.5629895, -1.125593, 2.24887, 1, 1, 1, 1, 1,
0.5664811, 1.817032, -0.8343523, 1, 1, 1, 1, 1,
0.5744998, -0.5464119, 3.587973, 1, 1, 1, 1, 1,
0.5763974, -0.1019668, 2.110973, 1, 1, 1, 1, 1,
0.5779539, -2.343674, 4.940003, 1, 1, 1, 1, 1,
0.5794719, -0.3952106, 3.385087, 1, 1, 1, 1, 1,
0.5866797, -0.5015051, 1.463161, 0, 0, 1, 1, 1,
0.587111, 0.2097835, 0.7522439, 1, 0, 0, 1, 1,
0.5891903, -0.1436008, -0.08583202, 1, 0, 0, 1, 1,
0.5900724, -0.426317, 1.78553, 1, 0, 0, 1, 1,
0.5902271, 0.08361057, 1.644225, 1, 0, 0, 1, 1,
0.5921899, -1.199307, 2.112187, 1, 0, 0, 1, 1,
0.592868, -0.06497438, 1.945495, 0, 0, 0, 1, 1,
0.5993927, 0.8221769, 1.326438, 0, 0, 0, 1, 1,
0.6025977, 0.9890058, 0.5663821, 0, 0, 0, 1, 1,
0.6029211, -1.605306, 3.943118, 0, 0, 0, 1, 1,
0.6072685, 0.4599849, 0.8243034, 0, 0, 0, 1, 1,
0.613889, -0.5428641, 3.208746, 0, 0, 0, 1, 1,
0.6168373, -0.4867704, 2.092921, 0, 0, 0, 1, 1,
0.6214911, 0.09026287, 1.689762, 1, 1, 1, 1, 1,
0.6215305, -0.9884044, 2.153896, 1, 1, 1, 1, 1,
0.6215832, -2.109425, 2.264648, 1, 1, 1, 1, 1,
0.6220697, 0.6794565, 1.829221, 1, 1, 1, 1, 1,
0.6226479, -1.856306, 3.286435, 1, 1, 1, 1, 1,
0.6256384, -0.03980665, 0.3259908, 1, 1, 1, 1, 1,
0.6274569, -0.08223518, 1.64968, 1, 1, 1, 1, 1,
0.6308746, 0.1160715, 1.412124, 1, 1, 1, 1, 1,
0.6343436, 0.1994894, 2.556314, 1, 1, 1, 1, 1,
0.6346027, 0.2898037, -0.08357564, 1, 1, 1, 1, 1,
0.6383898, -1.407145, 3.632781, 1, 1, 1, 1, 1,
0.6396425, 0.005676255, 2.91217, 1, 1, 1, 1, 1,
0.6518325, -1.501053, 3.025165, 1, 1, 1, 1, 1,
0.6527948, -0.7544327, 1.974336, 1, 1, 1, 1, 1,
0.6545688, 0.2504464, 2.015362, 1, 1, 1, 1, 1,
0.6584007, 0.3258405, 0.8549624, 0, 0, 1, 1, 1,
0.6644371, -1.693704, 1.704371, 1, 0, 0, 1, 1,
0.6671855, 0.9902253, 2.291717, 1, 0, 0, 1, 1,
0.6683091, 1.050115, 0.1895732, 1, 0, 0, 1, 1,
0.6685754, -0.5638253, 1.752652, 1, 0, 0, 1, 1,
0.6698, -0.338258, 1.314604, 1, 0, 0, 1, 1,
0.6711778, -0.8652932, 2.886226, 0, 0, 0, 1, 1,
0.6726784, -0.5950444, 1.507723, 0, 0, 0, 1, 1,
0.675705, 0.949453, 0.9978099, 0, 0, 0, 1, 1,
0.6822458, -0.02576463, 1.844537, 0, 0, 0, 1, 1,
0.6871405, 1.636249, 0.7113143, 0, 0, 0, 1, 1,
0.6883823, 1.095918, -0.6757368, 0, 0, 0, 1, 1,
0.6902796, 0.07210813, 2.480252, 0, 0, 0, 1, 1,
0.6903861, 0.2644007, 3.264401, 1, 1, 1, 1, 1,
0.7000571, 2.504422, 0.1298784, 1, 1, 1, 1, 1,
0.7020839, -1.565823, 3.288351, 1, 1, 1, 1, 1,
0.7165168, 0.8332093, 1.627707, 1, 1, 1, 1, 1,
0.720293, 1.367228, 2.052438, 1, 1, 1, 1, 1,
0.7207552, 2.091358, 0.9762286, 1, 1, 1, 1, 1,
0.733474, 0.1783915, 0.3633776, 1, 1, 1, 1, 1,
0.7364565, 0.02865063, 2.369264, 1, 1, 1, 1, 1,
0.7402607, 0.7350574, -0.02505345, 1, 1, 1, 1, 1,
0.7448469, -0.2852235, 3.059535, 1, 1, 1, 1, 1,
0.7522151, 0.3837946, 1.024107, 1, 1, 1, 1, 1,
0.7526253, 1.363982, -0.822697, 1, 1, 1, 1, 1,
0.7605643, -1.086422, 2.199538, 1, 1, 1, 1, 1,
0.7634956, -1.16072, 3.50089, 1, 1, 1, 1, 1,
0.7646122, -0.1916665, 1.341941, 1, 1, 1, 1, 1,
0.7646449, 0.3760644, -0.6231405, 0, 0, 1, 1, 1,
0.7670472, 0.6189893, 0.9927288, 1, 0, 0, 1, 1,
0.7695346, 1.454058, 0.4638884, 1, 0, 0, 1, 1,
0.772667, -0.1531584, 0.8960202, 1, 0, 0, 1, 1,
0.7798183, -0.7171284, 3.2271, 1, 0, 0, 1, 1,
0.7886396, 0.8001294, 1.009056, 1, 0, 0, 1, 1,
0.7930185, 0.1585026, -0.01982227, 0, 0, 0, 1, 1,
0.7969137, 0.7663019, 1.98226, 0, 0, 0, 1, 1,
0.8045585, 0.690502, 1.08184, 0, 0, 0, 1, 1,
0.8057418, 0.08407408, 1.646884, 0, 0, 0, 1, 1,
0.8136162, -0.6836907, 1.986106, 0, 0, 0, 1, 1,
0.8140131, -1.488651, 2.900097, 0, 0, 0, 1, 1,
0.8177388, -0.07122584, 3.114746, 0, 0, 0, 1, 1,
0.8189542, -0.2153452, 2.56966, 1, 1, 1, 1, 1,
0.8195266, 2.402623, 1.516739, 1, 1, 1, 1, 1,
0.8217317, 0.2892038, 1.75085, 1, 1, 1, 1, 1,
0.8240498, 1.264131, -0.5467322, 1, 1, 1, 1, 1,
0.8310014, -0.3779426, -0.07456811, 1, 1, 1, 1, 1,
0.8460026, -1.238744, 1.699536, 1, 1, 1, 1, 1,
0.8482471, 0.93093, 1.892376, 1, 1, 1, 1, 1,
0.8556167, 1.674869, 0.5100804, 1, 1, 1, 1, 1,
0.8602662, 0.2627297, 0.6562488, 1, 1, 1, 1, 1,
0.8635908, 0.4572424, 1.90137, 1, 1, 1, 1, 1,
0.8686795, -0.2017875, 2.027185, 1, 1, 1, 1, 1,
0.8767838, 0.1901495, 0.3074557, 1, 1, 1, 1, 1,
0.8770671, -1.03597, 2.658996, 1, 1, 1, 1, 1,
0.8782642, 0.4705754, 2.056835, 1, 1, 1, 1, 1,
0.8799273, -1.195016, 2.246716, 1, 1, 1, 1, 1,
0.8870471, -1.173665, 2.308228, 0, 0, 1, 1, 1,
0.8882583, 0.3771774, -1.462854, 1, 0, 0, 1, 1,
0.8918588, 0.8296251, 2.653335, 1, 0, 0, 1, 1,
0.8995413, 0.7901644, 0.9960288, 1, 0, 0, 1, 1,
0.9098485, 1.797681, 1.316408, 1, 0, 0, 1, 1,
0.9150332, -0.4922973, 0.851972, 1, 0, 0, 1, 1,
0.9164628, 0.6353678, 1.129628, 0, 0, 0, 1, 1,
0.9173081, -0.7005577, 2.284896, 0, 0, 0, 1, 1,
0.9180446, -0.860797, 1.817256, 0, 0, 0, 1, 1,
0.9245178, -0.1579703, 4.159983, 0, 0, 0, 1, 1,
0.9266593, -1.022913, 2.470615, 0, 0, 0, 1, 1,
0.9335271, 0.8225167, 0.6667311, 0, 0, 0, 1, 1,
0.9485157, -0.04553111, 0.9717714, 0, 0, 0, 1, 1,
0.9514295, -0.3533955, 3.794879, 1, 1, 1, 1, 1,
0.9619592, -0.1162357, 3.000792, 1, 1, 1, 1, 1,
0.9667523, -0.4722975, 4.393872, 1, 1, 1, 1, 1,
0.9674168, 0.4005564, 0.9988443, 1, 1, 1, 1, 1,
0.9686717, -1.393489, 4.118865, 1, 1, 1, 1, 1,
0.9712509, 0.7241306, 1.005505, 1, 1, 1, 1, 1,
0.9724596, -0.3024907, 0.4650913, 1, 1, 1, 1, 1,
0.9771036, 0.282018, 1.258205, 1, 1, 1, 1, 1,
0.9818951, 0.1522802, 1.391944, 1, 1, 1, 1, 1,
0.9940335, -1.219476, 2.206206, 1, 1, 1, 1, 1,
0.9977327, 0.1049142, 1.396467, 1, 1, 1, 1, 1,
1.000908, -0.3679965, 2.569694, 1, 1, 1, 1, 1,
1.005177, 1.010268, -0.8034719, 1, 1, 1, 1, 1,
1.015114, 0.06272853, 3.50296, 1, 1, 1, 1, 1,
1.025764, -0.1192252, 3.079201, 1, 1, 1, 1, 1,
1.026842, -1.66614, 1.135325, 0, 0, 1, 1, 1,
1.029995, 0.2180089, 0.3670187, 1, 0, 0, 1, 1,
1.033384, -1.546705, 2.887784, 1, 0, 0, 1, 1,
1.047771, 1.66333, -0.9872555, 1, 0, 0, 1, 1,
1.048364, -0.586387, 2.910802, 1, 0, 0, 1, 1,
1.063568, 0.2884106, 1.136598, 1, 0, 0, 1, 1,
1.065353, -0.8257156, 1.164666, 0, 0, 0, 1, 1,
1.065632, 0.1642826, 1.290407, 0, 0, 0, 1, 1,
1.075978, 0.3708479, 2.383594, 0, 0, 0, 1, 1,
1.078409, 1.882065, -0.6132165, 0, 0, 0, 1, 1,
1.078995, 1.097427, 1.739189, 0, 0, 0, 1, 1,
1.08486, -0.2649854, 3.026941, 0, 0, 0, 1, 1,
1.095873, -0.542345, 3.226188, 0, 0, 0, 1, 1,
1.097233, -0.9294662, 2.97046, 1, 1, 1, 1, 1,
1.1078, 1.349963, 0.07730991, 1, 1, 1, 1, 1,
1.113962, -1.109872, 1.514376, 1, 1, 1, 1, 1,
1.122096, 0.3202373, 1.751889, 1, 1, 1, 1, 1,
1.123556, 0.280332, 1.237141, 1, 1, 1, 1, 1,
1.124284, 0.5668241, 1.122704, 1, 1, 1, 1, 1,
1.137437, 0.8045781, -0.4424733, 1, 1, 1, 1, 1,
1.138649, 0.9794251, 1.09751, 1, 1, 1, 1, 1,
1.145224, -0.2743308, 2.352826, 1, 1, 1, 1, 1,
1.149182, 1.235414, 0.2263094, 1, 1, 1, 1, 1,
1.151548, -0.7449337, 2.890419, 1, 1, 1, 1, 1,
1.15349, -0.4478384, 1.929649, 1, 1, 1, 1, 1,
1.153843, 1.295545, -1.632911, 1, 1, 1, 1, 1,
1.155583, -0.6749917, 2.443795, 1, 1, 1, 1, 1,
1.158004, 0.1909559, 1.768919, 1, 1, 1, 1, 1,
1.160704, -1.528802, 0.1291518, 0, 0, 1, 1, 1,
1.165097, -0.5622417, 3.185704, 1, 0, 0, 1, 1,
1.166889, 0.07882269, 2.32554, 1, 0, 0, 1, 1,
1.176373, 0.9254683, 0.7222347, 1, 0, 0, 1, 1,
1.184755, 0.518419, 0.9557461, 1, 0, 0, 1, 1,
1.186319, 0.6367925, 0.5455542, 1, 0, 0, 1, 1,
1.192664, 0.2403969, 2.143759, 0, 0, 0, 1, 1,
1.203504, 0.7360178, 0.537129, 0, 0, 0, 1, 1,
1.215693, -1.502188, 1.670792, 0, 0, 0, 1, 1,
1.237644, 0.4809876, 1.903193, 0, 0, 0, 1, 1,
1.243364, 1.845877, 1.83372, 0, 0, 0, 1, 1,
1.245256, 3.113502, 0.9057172, 0, 0, 0, 1, 1,
1.245268, -1.330794, 0.8730143, 0, 0, 0, 1, 1,
1.255797, 1.358379, 1.986633, 1, 1, 1, 1, 1,
1.263385, 1.683262, 1.46184, 1, 1, 1, 1, 1,
1.268397, -0.1685975, 1.519361, 1, 1, 1, 1, 1,
1.269497, -0.2435662, 2.418281, 1, 1, 1, 1, 1,
1.272431, 0.8706033, 2.027299, 1, 1, 1, 1, 1,
1.272608, 0.2058852, 1.204851, 1, 1, 1, 1, 1,
1.29035, -0.4478364, 2.597376, 1, 1, 1, 1, 1,
1.295627, 0.7183824, -1.180238, 1, 1, 1, 1, 1,
1.302253, -0.4026624, 1.863144, 1, 1, 1, 1, 1,
1.313835, -0.5615416, 4.444542, 1, 1, 1, 1, 1,
1.31518, 1.300828, 1.468948, 1, 1, 1, 1, 1,
1.324147, 0.4487956, 2.135967, 1, 1, 1, 1, 1,
1.334382, -0.8215443, 0.6557778, 1, 1, 1, 1, 1,
1.335296, 0.6817502, -0.4062045, 1, 1, 1, 1, 1,
1.336952, 0.2471971, 2.388859, 1, 1, 1, 1, 1,
1.337186, -1.34473, 2.192384, 0, 0, 1, 1, 1,
1.33752, 1.87436, 1.069302, 1, 0, 0, 1, 1,
1.351625, -1.332234, 1.882234, 1, 0, 0, 1, 1,
1.357864, 0.2374104, 0.5220478, 1, 0, 0, 1, 1,
1.386211, -0.8206416, 2.32811, 1, 0, 0, 1, 1,
1.400863, -0.06479645, 1.869013, 1, 0, 0, 1, 1,
1.419215, 1.051975, 1.148318, 0, 0, 0, 1, 1,
1.420263, 0.4759234, 1.389604, 0, 0, 0, 1, 1,
1.425446, 0.5684386, 0.4804891, 0, 0, 0, 1, 1,
1.427636, -0.09412811, 1.206857, 0, 0, 0, 1, 1,
1.429727, -0.8085069, 2.180961, 0, 0, 0, 1, 1,
1.437087, -0.4800653, 2.975677, 0, 0, 0, 1, 1,
1.455568, 0.2496484, 1.499136, 0, 0, 0, 1, 1,
1.475079, -0.7233692, 1.900157, 1, 1, 1, 1, 1,
1.475478, 0.3730527, 0.3847113, 1, 1, 1, 1, 1,
1.477377, 0.06417494, 1.807981, 1, 1, 1, 1, 1,
1.482828, -1.857983, 2.138178, 1, 1, 1, 1, 1,
1.491892, -0.3225498, 1.478992, 1, 1, 1, 1, 1,
1.493721, -0.1237229, 0.9268852, 1, 1, 1, 1, 1,
1.50089, 1.015, -0.3477532, 1, 1, 1, 1, 1,
1.502159, 1.135848, 2.051299, 1, 1, 1, 1, 1,
1.507241, 0.08722813, -0.1776606, 1, 1, 1, 1, 1,
1.511712, -0.5203034, 2.244809, 1, 1, 1, 1, 1,
1.516245, 0.3521225, 2.287975, 1, 1, 1, 1, 1,
1.519646, 0.6136383, 0.7984005, 1, 1, 1, 1, 1,
1.534101, -1.74242, 3.900236, 1, 1, 1, 1, 1,
1.534711, 1.113444, 1.224055, 1, 1, 1, 1, 1,
1.562243, 0.4128002, 2.337317, 1, 1, 1, 1, 1,
1.564834, -1.809146, 3.544929, 0, 0, 1, 1, 1,
1.569673, 0.4782948, 1.932022, 1, 0, 0, 1, 1,
1.569744, 0.3088604, 2.401727, 1, 0, 0, 1, 1,
1.571326, -1.694586, 2.682625, 1, 0, 0, 1, 1,
1.587464, 1.185609, 1.100335, 1, 0, 0, 1, 1,
1.590661, 0.04619465, 1.231854, 1, 0, 0, 1, 1,
1.596339, 1.755929, 1.033674, 0, 0, 0, 1, 1,
1.596642, 0.1939596, 1.070621, 0, 0, 0, 1, 1,
1.597485, 1.506604, 0.06135596, 0, 0, 0, 1, 1,
1.638124, 0.04444458, 1.742519, 0, 0, 0, 1, 1,
1.639769, -0.7558236, 3.46727, 0, 0, 0, 1, 1,
1.640817, -0.8447254, 1.722508, 0, 0, 0, 1, 1,
1.641955, 0.2753387, 0.5468838, 0, 0, 0, 1, 1,
1.654205, 0.1920251, 1.661357, 1, 1, 1, 1, 1,
1.677588, 0.8168911, 0.6314731, 1, 1, 1, 1, 1,
1.677589, -0.5736019, 1.80525, 1, 1, 1, 1, 1,
1.681271, -1.978775, 3.844601, 1, 1, 1, 1, 1,
1.712944, -0.5911505, 2.319179, 1, 1, 1, 1, 1,
1.718047, -1.370108, 4.255037, 1, 1, 1, 1, 1,
1.719588, -0.1757922, 1.409735, 1, 1, 1, 1, 1,
1.723264, 2.204383, -0.03539635, 1, 1, 1, 1, 1,
1.729364, 0.7359075, 1.537496, 1, 1, 1, 1, 1,
1.747454, 0.02346741, 0.9959257, 1, 1, 1, 1, 1,
1.760068, -0.02485365, 0.9636521, 1, 1, 1, 1, 1,
1.766286, -0.6361968, 0.6659557, 1, 1, 1, 1, 1,
1.77601, -1.64883, 0.6274335, 1, 1, 1, 1, 1,
1.780565, 0.7304351, 1.792566, 1, 1, 1, 1, 1,
1.79605, -2.852106, 4.547771, 1, 1, 1, 1, 1,
1.847979, -2.900692, 3.360636, 0, 0, 1, 1, 1,
1.862521, -0.8601888, 2.635475, 1, 0, 0, 1, 1,
1.881948, -0.2777462, 0.8581576, 1, 0, 0, 1, 1,
1.913504, 0.4417289, 0.8267997, 1, 0, 0, 1, 1,
1.991089, 1.083207, 2.20018, 1, 0, 0, 1, 1,
1.992396, 1.724469, 1.490766, 1, 0, 0, 1, 1,
2.027599, 0.8867788, 0.5591099, 0, 0, 0, 1, 1,
2.092323, -0.7175738, 2.036907, 0, 0, 0, 1, 1,
2.098187, -1.568273, 0.09770878, 0, 0, 0, 1, 1,
2.121244, 0.9944828, 0.9201939, 0, 0, 0, 1, 1,
2.123848, 0.1075484, 1.68161, 0, 0, 0, 1, 1,
2.160931, 0.04654732, 2.861532, 0, 0, 0, 1, 1,
2.161811, 0.10688, 1.231832, 0, 0, 0, 1, 1,
2.227518, 0.4202701, 2.066958, 1, 1, 1, 1, 1,
2.333875, 0.06152309, 0.6976689, 1, 1, 1, 1, 1,
2.480267, 0.2073666, 1.792728, 1, 1, 1, 1, 1,
2.592613, 0.2625131, 2.094598, 1, 1, 1, 1, 1,
3.072091, -3.054905, 1.476866, 1, 1, 1, 1, 1,
3.586387, 0.8416809, 1.305926, 1, 1, 1, 1, 1,
4.008732, 1.091801, 2.627828, 1, 1, 1, 1, 1
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
var radius = 9.862136;
var distance = 34.64034;
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
mvMatrix.translate( -0.5491523, 0.2855906, -0.1117375 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64034);
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
