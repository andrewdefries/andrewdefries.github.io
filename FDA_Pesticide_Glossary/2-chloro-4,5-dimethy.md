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
-3.627914, 0.2383584, -2.050391, 1, 0, 0, 1,
-3.038214, 1.484584, -1.601236, 1, 0.007843138, 0, 1,
-2.985872, 0.3448374, -1.381309, 1, 0.01176471, 0, 1,
-2.959692, -0.4639638, -0.2524283, 1, 0.01960784, 0, 1,
-2.839994, -1.26654, 0.1016592, 1, 0.02352941, 0, 1,
-2.752396, 0.3084594, -3.267579, 1, 0.03137255, 0, 1,
-2.714416, 1.327777, -0.6734939, 1, 0.03529412, 0, 1,
-2.694749, -0.3570439, -2.202244, 1, 0.04313726, 0, 1,
-2.528524, -1.551622, -2.004766, 1, 0.04705882, 0, 1,
-2.509593, 1.31507, -1.567547, 1, 0.05490196, 0, 1,
-2.425133, 1.108364, -1.596475, 1, 0.05882353, 0, 1,
-2.404578, -0.7816372, -4.609849, 1, 0.06666667, 0, 1,
-2.390237, -0.7749473, -2.944084, 1, 0.07058824, 0, 1,
-2.38572, 1.306786, 0.4691154, 1, 0.07843138, 0, 1,
-2.330102, 0.2704829, -0.97247, 1, 0.08235294, 0, 1,
-2.299537, 1.129712, 0.1797637, 1, 0.09019608, 0, 1,
-2.29459, -0.1301916, -0.7625336, 1, 0.09411765, 0, 1,
-2.291813, 1.312424, -1.568437, 1, 0.1019608, 0, 1,
-2.196484, -0.05924731, -3.010797, 1, 0.1098039, 0, 1,
-2.184485, 0.3731153, -0.896132, 1, 0.1137255, 0, 1,
-2.179878, 0.9211122, -2.101061, 1, 0.1215686, 0, 1,
-2.177158, -0.7403226, -1.247489, 1, 0.1254902, 0, 1,
-2.175979, 0.8938955, -2.637758, 1, 0.1333333, 0, 1,
-2.164986, 1.222532, -0.3594716, 1, 0.1372549, 0, 1,
-2.159028, 0.5879046, -1.382024, 1, 0.145098, 0, 1,
-2.027807, -0.1112977, -2.699518, 1, 0.1490196, 0, 1,
-2.021292, -0.7811762, -2.277246, 1, 0.1568628, 0, 1,
-2.019792, 0.8552719, -0.1850885, 1, 0.1607843, 0, 1,
-2.019265, 1.12636, -1.282773, 1, 0.1686275, 0, 1,
-2.009538, -0.3823031, -1.867944, 1, 0.172549, 0, 1,
-2.009228, 1.394816, -1.025722, 1, 0.1803922, 0, 1,
-2.004993, -0.2296109, -0.5105907, 1, 0.1843137, 0, 1,
-1.974376, -0.3114941, -0.7365578, 1, 0.1921569, 0, 1,
-1.940479, -0.990492, -3.170432, 1, 0.1960784, 0, 1,
-1.916893, 0.3715846, -1.163982, 1, 0.2039216, 0, 1,
-1.912837, 0.746448, -1.407592, 1, 0.2117647, 0, 1,
-1.910606, -1.17249, -1.182727, 1, 0.2156863, 0, 1,
-1.902078, 1.259475, -0.8585441, 1, 0.2235294, 0, 1,
-1.899599, 0.8937525, -3.372918, 1, 0.227451, 0, 1,
-1.893975, -0.7892917, -0.986027, 1, 0.2352941, 0, 1,
-1.85528, -0.2136437, -2.346082, 1, 0.2392157, 0, 1,
-1.851718, 0.2243509, -1.4335, 1, 0.2470588, 0, 1,
-1.843349, -0.7304641, -1.513991, 1, 0.2509804, 0, 1,
-1.837354, 1.025306, -1.147526, 1, 0.2588235, 0, 1,
-1.824407, 1.359933, -1.260344, 1, 0.2627451, 0, 1,
-1.808477, -1.952397, -0.7919779, 1, 0.2705882, 0, 1,
-1.806653, 0.9182379, -2.099401, 1, 0.2745098, 0, 1,
-1.770265, -0.2022392, -1.411413, 1, 0.282353, 0, 1,
-1.749963, -0.3961168, -2.807409, 1, 0.2862745, 0, 1,
-1.714825, 0.07280541, -0.7921224, 1, 0.2941177, 0, 1,
-1.71409, -0.4495369, -2.208295, 1, 0.3019608, 0, 1,
-1.707695, 1.599492, -0.9931292, 1, 0.3058824, 0, 1,
-1.694941, -0.2211472, -0.4804048, 1, 0.3137255, 0, 1,
-1.688207, 1.373, -0.5157666, 1, 0.3176471, 0, 1,
-1.671848, 0.9113548, -0.4180577, 1, 0.3254902, 0, 1,
-1.670268, 0.3157465, -1.376449, 1, 0.3294118, 0, 1,
-1.670059, -0.5701795, -2.124433, 1, 0.3372549, 0, 1,
-1.669427, 1.276058, 1.35233, 1, 0.3411765, 0, 1,
-1.665315, 1.877469, -0.2615075, 1, 0.3490196, 0, 1,
-1.662158, -0.7078281, -3.101937, 1, 0.3529412, 0, 1,
-1.65072, -1.144224, -2.803314, 1, 0.3607843, 0, 1,
-1.631692, -0.7060456, -2.207223, 1, 0.3647059, 0, 1,
-1.627131, -0.0921237, -2.173348, 1, 0.372549, 0, 1,
-1.626903, 1.759306, -2.207332, 1, 0.3764706, 0, 1,
-1.611498, 0.8436337, -0.5112081, 1, 0.3843137, 0, 1,
-1.611099, -1.46098, -2.884785, 1, 0.3882353, 0, 1,
-1.606098, 0.6723211, -0.6017574, 1, 0.3960784, 0, 1,
-1.60233, -1.5676, -1.133445, 1, 0.4039216, 0, 1,
-1.578276, -0.34347, -2.626923, 1, 0.4078431, 0, 1,
-1.561123, -0.7547713, -0.6100889, 1, 0.4156863, 0, 1,
-1.532982, -0.6984626, -1.035843, 1, 0.4196078, 0, 1,
-1.532071, -0.006559091, -2.080188, 1, 0.427451, 0, 1,
-1.527176, 0.6634495, 0.2942036, 1, 0.4313726, 0, 1,
-1.514569, -0.07891946, -2.308812, 1, 0.4392157, 0, 1,
-1.501716, 0.7829432, -0.4720987, 1, 0.4431373, 0, 1,
-1.501188, -1.449566, -3.292364, 1, 0.4509804, 0, 1,
-1.500434, -1.818269, -2.341288, 1, 0.454902, 0, 1,
-1.50001, -0.2041913, -1.702515, 1, 0.4627451, 0, 1,
-1.498657, -0.2031325, -2.096864, 1, 0.4666667, 0, 1,
-1.49846, -0.3894277, -1.422437, 1, 0.4745098, 0, 1,
-1.495835, 0.05720668, -1.686063, 1, 0.4784314, 0, 1,
-1.49253, -0.9825308, -2.942587, 1, 0.4862745, 0, 1,
-1.492526, -1.033789, -0.1731611, 1, 0.4901961, 0, 1,
-1.481155, 0.8048975, -0.8202883, 1, 0.4980392, 0, 1,
-1.476614, 1.351087, -1.645033, 1, 0.5058824, 0, 1,
-1.459593, -0.1416294, -0.4879657, 1, 0.509804, 0, 1,
-1.446258, -1.251415, -0.8632377, 1, 0.5176471, 0, 1,
-1.43418, -0.3115761, -2.910424, 1, 0.5215687, 0, 1,
-1.433752, -0.7641848, -1.329377, 1, 0.5294118, 0, 1,
-1.418403, -1.463324, -1.515256, 1, 0.5333334, 0, 1,
-1.403877, 0.2671745, -3.167475, 1, 0.5411765, 0, 1,
-1.393299, 2.097875, -0.09610993, 1, 0.5450981, 0, 1,
-1.39307, 1.991583, -0.8577191, 1, 0.5529412, 0, 1,
-1.386555, -1.20557, -0.5528443, 1, 0.5568628, 0, 1,
-1.382026, -0.09917949, -2.196765, 1, 0.5647059, 0, 1,
-1.357812, 1.284001, 0.3644048, 1, 0.5686275, 0, 1,
-1.350997, 1.031552, -1.263607, 1, 0.5764706, 0, 1,
-1.331561, -0.5288519, -1.681404, 1, 0.5803922, 0, 1,
-1.33134, -0.8995473, -2.559293, 1, 0.5882353, 0, 1,
-1.32673, 0.9651346, -2.190533, 1, 0.5921569, 0, 1,
-1.323693, 0.03190991, -3.075621, 1, 0.6, 0, 1,
-1.323034, 1.995877, -0.5949886, 1, 0.6078432, 0, 1,
-1.311586, -0.5225906, -2.005621, 1, 0.6117647, 0, 1,
-1.300675, 2.967314, -0.7795782, 1, 0.6196079, 0, 1,
-1.293254, -0.7659552, -1.355915, 1, 0.6235294, 0, 1,
-1.284354, -1.206375, -3.026504, 1, 0.6313726, 0, 1,
-1.283625, -0.8059662, -1.830492, 1, 0.6352941, 0, 1,
-1.279377, 0.1836273, -2.955986, 1, 0.6431373, 0, 1,
-1.272797, -0.3137148, -2.376566, 1, 0.6470588, 0, 1,
-1.272295, 0.04473309, 0.4674011, 1, 0.654902, 0, 1,
-1.260361, 1.243624, -0.4958546, 1, 0.6588235, 0, 1,
-1.256858, -1.445343, -2.955508, 1, 0.6666667, 0, 1,
-1.25186, 1.2696, 0.0673629, 1, 0.6705883, 0, 1,
-1.240418, -0.175549, 0.5836282, 1, 0.6784314, 0, 1,
-1.233668, -0.5561346, -1.55873, 1, 0.682353, 0, 1,
-1.219745, 0.01186824, -1.511267, 1, 0.6901961, 0, 1,
-1.219713, 1.139154, -0.06444759, 1, 0.6941177, 0, 1,
-1.208641, -0.1740285, -0.9783539, 1, 0.7019608, 0, 1,
-1.193805, 1.080837, 0.1126864, 1, 0.7098039, 0, 1,
-1.193452, -2.812504, -0.8429201, 1, 0.7137255, 0, 1,
-1.188092, 0.3228839, -1.443342, 1, 0.7215686, 0, 1,
-1.187359, -0.9163621, -1.999008, 1, 0.7254902, 0, 1,
-1.18692, 1.712684, -1.572756, 1, 0.7333333, 0, 1,
-1.185421, -0.03836788, -0.6437073, 1, 0.7372549, 0, 1,
-1.185041, 0.9642884, 0.1158581, 1, 0.7450981, 0, 1,
-1.184244, -0.9137935, -2.709018, 1, 0.7490196, 0, 1,
-1.181083, -0.1886468, -0.5821698, 1, 0.7568628, 0, 1,
-1.177869, 0.4347879, -0.4241992, 1, 0.7607843, 0, 1,
-1.1764, -0.3241659, -2.696098, 1, 0.7686275, 0, 1,
-1.157864, -0.9074554, -1.813072, 1, 0.772549, 0, 1,
-1.15339, -0.2031297, -0.561401, 1, 0.7803922, 0, 1,
-1.15157, -0.509403, -0.2889051, 1, 0.7843137, 0, 1,
-1.149233, -0.09551316, -1.062451, 1, 0.7921569, 0, 1,
-1.134468, 0.2720636, -1.474987, 1, 0.7960784, 0, 1,
-1.131155, -1.1514, -3.135249, 1, 0.8039216, 0, 1,
-1.130339, -0.7293046, -1.809028, 1, 0.8117647, 0, 1,
-1.120704, 0.02429042, -2.072839, 1, 0.8156863, 0, 1,
-1.120509, 1.208514, -2.745289, 1, 0.8235294, 0, 1,
-1.110223, 0.2037841, 0.236783, 1, 0.827451, 0, 1,
-1.107714, 0.1436815, -0.4148905, 1, 0.8352941, 0, 1,
-1.09679, 0.1589165, -1.524281, 1, 0.8392157, 0, 1,
-1.079918, 2.763587, -0.4336201, 1, 0.8470588, 0, 1,
-1.079843, 0.01976936, -1.933822, 1, 0.8509804, 0, 1,
-1.076954, 0.5407286, 1.100945, 1, 0.8588235, 0, 1,
-1.069113, -0.2842896, -2.516421, 1, 0.8627451, 0, 1,
-1.06044, 0.07618212, -3.364138, 1, 0.8705882, 0, 1,
-1.057554, -1.092491, -2.410733, 1, 0.8745098, 0, 1,
-1.055187, -2.70417, -1.260316, 1, 0.8823529, 0, 1,
-1.052916, 0.0823575, -0.2227285, 1, 0.8862745, 0, 1,
-1.049155, -0.08664415, -1.377676, 1, 0.8941177, 0, 1,
-1.044162, 0.7613952, -1.414061, 1, 0.8980392, 0, 1,
-1.040197, 1.364884, -1.052136, 1, 0.9058824, 0, 1,
-1.040126, -1.53045, -3.820569, 1, 0.9137255, 0, 1,
-1.040123, 0.4069064, -1.354361, 1, 0.9176471, 0, 1,
-1.037228, 0.1694261, -0.4477267, 1, 0.9254902, 0, 1,
-1.036097, 0.8071076, -0.6106337, 1, 0.9294118, 0, 1,
-1.033439, 0.1839926, 0.3262856, 1, 0.9372549, 0, 1,
-1.031484, -0.06382247, -1.023782, 1, 0.9411765, 0, 1,
-1.030976, 1.004034, -2.100022, 1, 0.9490196, 0, 1,
-1.020854, 0.7252945, -0.3005946, 1, 0.9529412, 0, 1,
-1.012503, -0.04659515, -2.080549, 1, 0.9607843, 0, 1,
-1.009859, 0.9367175, -0.8599542, 1, 0.9647059, 0, 1,
-1.003365, 0.2962411, -2.804171, 1, 0.972549, 0, 1,
-1.002763, 0.2415297, 0.421598, 1, 0.9764706, 0, 1,
-0.9946685, 1.077897, 0.4709088, 1, 0.9843137, 0, 1,
-0.9937969, -0.567351, -0.5408885, 1, 0.9882353, 0, 1,
-0.9926997, 0.105252, -1.873062, 1, 0.9960784, 0, 1,
-0.9920055, 0.5297442, 0.09595323, 0.9960784, 1, 0, 1,
-0.9916992, -0.7379007, -4.061733, 0.9921569, 1, 0, 1,
-0.985331, -1.129179, -2.566325, 0.9843137, 1, 0, 1,
-0.9845973, 0.5954332, -2.531603, 0.9803922, 1, 0, 1,
-0.9844504, 0.2490583, -2.625348, 0.972549, 1, 0, 1,
-0.9830387, -0.6460392, -1.868726, 0.9686275, 1, 0, 1,
-0.9805764, -0.1184679, -1.811941, 0.9607843, 1, 0, 1,
-0.9744638, 2.37784, -0.0872701, 0.9568627, 1, 0, 1,
-0.9637229, 1.294475, -0.5351807, 0.9490196, 1, 0, 1,
-0.962007, -0.6981519, -2.463111, 0.945098, 1, 0, 1,
-0.960335, 2.345159, 0.08863363, 0.9372549, 1, 0, 1,
-0.9602459, -0.1861492, -2.606066, 0.9333333, 1, 0, 1,
-0.9436936, -1.186829, -2.650774, 0.9254902, 1, 0, 1,
-0.9323184, -0.9437134, -3.615734, 0.9215686, 1, 0, 1,
-0.9316596, 0.9232696, -1.099436, 0.9137255, 1, 0, 1,
-0.9263899, 0.4210279, -1.107797, 0.9098039, 1, 0, 1,
-0.9245883, 0.2451096, 0.008202522, 0.9019608, 1, 0, 1,
-0.9119574, -1.167838, -2.263881, 0.8941177, 1, 0, 1,
-0.9069576, -0.4980018, -1.610139, 0.8901961, 1, 0, 1,
-0.9043026, -1.119209, -1.843581, 0.8823529, 1, 0, 1,
-0.9025938, -0.9503917, -1.309809, 0.8784314, 1, 0, 1,
-0.9025497, -0.6792869, -2.832413, 0.8705882, 1, 0, 1,
-0.9016391, 2.148446, -0.4929465, 0.8666667, 1, 0, 1,
-0.8958556, 1.223874, -3.859222, 0.8588235, 1, 0, 1,
-0.8931515, 1.598077, -2.199102, 0.854902, 1, 0, 1,
-0.8921728, 0.2268071, -3.132539, 0.8470588, 1, 0, 1,
-0.8910864, -0.8205462, -2.701708, 0.8431373, 1, 0, 1,
-0.8874462, 0.03302344, -1.707228, 0.8352941, 1, 0, 1,
-0.8774729, -0.2153319, -1.109203, 0.8313726, 1, 0, 1,
-0.8756024, -2.054578, -0.2781626, 0.8235294, 1, 0, 1,
-0.8748502, 0.03516342, -2.334125, 0.8196079, 1, 0, 1,
-0.857233, 0.2937753, -2.038748, 0.8117647, 1, 0, 1,
-0.8517699, 0.2098078, -0.8669208, 0.8078431, 1, 0, 1,
-0.8488519, 0.187156, -0.317669, 0.8, 1, 0, 1,
-0.8480049, 0.188135, -1.55143, 0.7921569, 1, 0, 1,
-0.8465167, 1.491408, -1.221249, 0.7882353, 1, 0, 1,
-0.8388525, 0.8444275, -0.4444465, 0.7803922, 1, 0, 1,
-0.8273052, 2.348251, 0.7806784, 0.7764706, 1, 0, 1,
-0.8230812, 1.380043, -0.07181226, 0.7686275, 1, 0, 1,
-0.8139029, -1.052076, -3.930687, 0.7647059, 1, 0, 1,
-0.8128861, -0.8468302, -4.75199, 0.7568628, 1, 0, 1,
-0.8123854, -1.041909, -3.275517, 0.7529412, 1, 0, 1,
-0.8114712, -0.1869539, -2.641671, 0.7450981, 1, 0, 1,
-0.8096281, 1.062057, -2.268501, 0.7411765, 1, 0, 1,
-0.7997413, -0.9516388, -2.377608, 0.7333333, 1, 0, 1,
-0.7987247, -0.3180197, -1.725929, 0.7294118, 1, 0, 1,
-0.7878299, 1.109731, -1.431365, 0.7215686, 1, 0, 1,
-0.7833136, 0.8100927, -1.094579, 0.7176471, 1, 0, 1,
-0.7820073, -0.1333218, -0.9942507, 0.7098039, 1, 0, 1,
-0.7813345, 0.3702559, -3.280363, 0.7058824, 1, 0, 1,
-0.7801345, 1.316482, 0.1910355, 0.6980392, 1, 0, 1,
-0.7796295, -1.318122, -1.229412, 0.6901961, 1, 0, 1,
-0.7761348, 1.31661, -1.10285, 0.6862745, 1, 0, 1,
-0.7733792, 1.622744, -1.222278, 0.6784314, 1, 0, 1,
-0.7730982, 0.9655376, -1.041245, 0.6745098, 1, 0, 1,
-0.7666894, 0.4374243, 1.556574, 0.6666667, 1, 0, 1,
-0.7637786, -0.3721643, -1.626394, 0.6627451, 1, 0, 1,
-0.7634748, 0.8478596, 0.4987579, 0.654902, 1, 0, 1,
-0.7625095, -1.170001, -2.109696, 0.6509804, 1, 0, 1,
-0.7615421, 0.2792309, -1.710971, 0.6431373, 1, 0, 1,
-0.7598314, -1.100135, -3.109974, 0.6392157, 1, 0, 1,
-0.7546312, -0.5867875, -3.711677, 0.6313726, 1, 0, 1,
-0.7531906, -2.017079, -1.47, 0.627451, 1, 0, 1,
-0.7508552, -1.805415, -1.517583, 0.6196079, 1, 0, 1,
-0.7466488, -0.162256, -2.024868, 0.6156863, 1, 0, 1,
-0.7461141, -1.308007, -3.027923, 0.6078432, 1, 0, 1,
-0.7358387, -0.0755339, -2.439732, 0.6039216, 1, 0, 1,
-0.7357494, 0.6982287, -0.1519088, 0.5960785, 1, 0, 1,
-0.7345664, -0.7109369, -4.174627, 0.5882353, 1, 0, 1,
-0.7184042, -0.6124864, -3.081876, 0.5843138, 1, 0, 1,
-0.7150006, 0.4384657, -0.7291932, 0.5764706, 1, 0, 1,
-0.7149983, 0.2029084, -1.988063, 0.572549, 1, 0, 1,
-0.7147832, 0.9032316, -0.9150309, 0.5647059, 1, 0, 1,
-0.7113175, -0.6646864, -0.653353, 0.5607843, 1, 0, 1,
-0.7069937, 1.025926, -0.0633347, 0.5529412, 1, 0, 1,
-0.7029783, -0.8126284, -2.167058, 0.5490196, 1, 0, 1,
-0.6895453, 0.8251038, 0.09268447, 0.5411765, 1, 0, 1,
-0.6894019, 0.4200299, -1.457416, 0.5372549, 1, 0, 1,
-0.6858305, -0.7515144, -2.460233, 0.5294118, 1, 0, 1,
-0.6834459, 0.3262748, -1.411099, 0.5254902, 1, 0, 1,
-0.6827943, 0.3987852, -1.577218, 0.5176471, 1, 0, 1,
-0.6824443, -0.9276189, -3.990585, 0.5137255, 1, 0, 1,
-0.6758835, 0.06534901, -1.309665, 0.5058824, 1, 0, 1,
-0.6737645, 0.8177633, -0.4206941, 0.5019608, 1, 0, 1,
-0.6729087, -0.09217671, 0.6718802, 0.4941176, 1, 0, 1,
-0.664774, -0.1175353, -1.550596, 0.4862745, 1, 0, 1,
-0.6636493, 0.01356522, -1.58707, 0.4823529, 1, 0, 1,
-0.6603348, 0.8396425, -0.712247, 0.4745098, 1, 0, 1,
-0.6597701, -0.8479387, -2.316408, 0.4705882, 1, 0, 1,
-0.6596136, 0.2237461, -2.016734, 0.4627451, 1, 0, 1,
-0.6566637, -1.607538, -3.892833, 0.4588235, 1, 0, 1,
-0.6493638, -0.2927055, -2.350897, 0.4509804, 1, 0, 1,
-0.6487755, -0.8883638, -1.872299, 0.4470588, 1, 0, 1,
-0.6485994, 1.215204, 0.9499615, 0.4392157, 1, 0, 1,
-0.6368402, 0.9926573, -2.281509, 0.4352941, 1, 0, 1,
-0.6361671, -0.04305021, -0.4020461, 0.427451, 1, 0, 1,
-0.6334969, -0.6332843, -1.49849, 0.4235294, 1, 0, 1,
-0.6313357, 0.5368304, -0.2433982, 0.4156863, 1, 0, 1,
-0.6311414, 1.408586, -0.5854287, 0.4117647, 1, 0, 1,
-0.6304187, 0.987789, -1.884461, 0.4039216, 1, 0, 1,
-0.6277351, -0.3765712, -4.121757, 0.3960784, 1, 0, 1,
-0.6254216, 0.7736065, -0.4949434, 0.3921569, 1, 0, 1,
-0.6253552, -1.905107, -2.365817, 0.3843137, 1, 0, 1,
-0.6220773, 2.150687, -0.6088705, 0.3803922, 1, 0, 1,
-0.6211651, -0.4156877, -3.162229, 0.372549, 1, 0, 1,
-0.6204339, -2.088311, -4.200094, 0.3686275, 1, 0, 1,
-0.6135584, -0.6164377, -2.210227, 0.3607843, 1, 0, 1,
-0.601725, 0.4598149, -1.444344, 0.3568628, 1, 0, 1,
-0.5975155, -1.055965, -1.889354, 0.3490196, 1, 0, 1,
-0.5944014, -0.7170954, -2.683621, 0.345098, 1, 0, 1,
-0.5938784, 0.6591244, -0.7707669, 0.3372549, 1, 0, 1,
-0.5921994, 0.1765271, -0.6428527, 0.3333333, 1, 0, 1,
-0.5903383, -0.8679875, -4.088933, 0.3254902, 1, 0, 1,
-0.5901343, -0.2257851, -1.309469, 0.3215686, 1, 0, 1,
-0.5893953, -1.245152, -2.095818, 0.3137255, 1, 0, 1,
-0.5876038, 1.488986, 2.028614, 0.3098039, 1, 0, 1,
-0.5850326, -1.099028, -1.577413, 0.3019608, 1, 0, 1,
-0.5826278, 0.6097981, -1.27204, 0.2941177, 1, 0, 1,
-0.5763361, -0.5207394, -0.8568572, 0.2901961, 1, 0, 1,
-0.573497, 0.3229801, -2.350063, 0.282353, 1, 0, 1,
-0.5680913, -1.998645, -2.357607, 0.2784314, 1, 0, 1,
-0.5627328, 0.6936818, 0.3052866, 0.2705882, 1, 0, 1,
-0.5596942, -1.544147, -1.653604, 0.2666667, 1, 0, 1,
-0.5544506, 0.1324846, -1.024489, 0.2588235, 1, 0, 1,
-0.5505094, 0.462936, 0.1464791, 0.254902, 1, 0, 1,
-0.5497288, -0.8870428, -2.630993, 0.2470588, 1, 0, 1,
-0.5496358, -0.2469947, -1.373502, 0.2431373, 1, 0, 1,
-0.5477767, -1.570464, -1.864404, 0.2352941, 1, 0, 1,
-0.544475, 0.7411208, 0.2881088, 0.2313726, 1, 0, 1,
-0.5420174, -0.9566696, -3.736235, 0.2235294, 1, 0, 1,
-0.5363598, 0.3902667, 0.271079, 0.2196078, 1, 0, 1,
-0.5307965, 1.374786, 1.697062, 0.2117647, 1, 0, 1,
-0.5260945, -0.5003553, -0.2385002, 0.2078431, 1, 0, 1,
-0.5154609, 0.8958178, -1.947866, 0.2, 1, 0, 1,
-0.5046459, 0.1929586, -0.9780288, 0.1921569, 1, 0, 1,
-0.5037966, -0.03001397, -0.159829, 0.1882353, 1, 0, 1,
-0.4990433, 0.9577483, -0.5485588, 0.1803922, 1, 0, 1,
-0.4984175, 0.1089597, -1.668499, 0.1764706, 1, 0, 1,
-0.4975567, -0.07709097, -0.3905404, 0.1686275, 1, 0, 1,
-0.4951057, -0.8469497, -1.509664, 0.1647059, 1, 0, 1,
-0.4925032, 0.52157, 0.07179917, 0.1568628, 1, 0, 1,
-0.4921647, 0.719852, -0.842239, 0.1529412, 1, 0, 1,
-0.4918425, -0.008380032, -1.136255, 0.145098, 1, 0, 1,
-0.4856459, 0.3528878, -1.428544, 0.1411765, 1, 0, 1,
-0.4833893, 1.864309, -2.11374, 0.1333333, 1, 0, 1,
-0.4828146, 0.0008038844, -0.6764982, 0.1294118, 1, 0, 1,
-0.4776887, -0.08773454, -2.852493, 0.1215686, 1, 0, 1,
-0.4714035, 0.4413992, -2.064299, 0.1176471, 1, 0, 1,
-0.4696489, 0.7466696, -0.6001931, 0.1098039, 1, 0, 1,
-0.4665466, 1.620834, -0.5123311, 0.1058824, 1, 0, 1,
-0.4652358, -0.3252502, -0.5751852, 0.09803922, 1, 0, 1,
-0.4611382, -0.2905401, -1.267247, 0.09019608, 1, 0, 1,
-0.4582448, 0.4670869, -1.723436, 0.08627451, 1, 0, 1,
-0.4576664, 1.48537, -0.6970302, 0.07843138, 1, 0, 1,
-0.4552755, -0.8497685, -2.536472, 0.07450981, 1, 0, 1,
-0.4541714, -0.4785798, -3.324327, 0.06666667, 1, 0, 1,
-0.4530518, -0.4100916, -1.653683, 0.0627451, 1, 0, 1,
-0.4492865, 1.364731, 0.6896434, 0.05490196, 1, 0, 1,
-0.4449951, 0.03777918, -0.1694984, 0.05098039, 1, 0, 1,
-0.4429785, 0.3792463, -0.3686279, 0.04313726, 1, 0, 1,
-0.4413095, 1.92786, 0.6257088, 0.03921569, 1, 0, 1,
-0.4368088, -1.657991, -2.516724, 0.03137255, 1, 0, 1,
-0.4364519, -2.691013, -3.564297, 0.02745098, 1, 0, 1,
-0.4347774, 0.1035968, -2.026896, 0.01960784, 1, 0, 1,
-0.4335238, -0.864427, -3.829506, 0.01568628, 1, 0, 1,
-0.4271409, -0.7668933, -2.481088, 0.007843138, 1, 0, 1,
-0.4218945, 0.7911794, 0.1765774, 0.003921569, 1, 0, 1,
-0.4189324, 0.5645673, 0.4353174, 0, 1, 0.003921569, 1,
-0.4186049, -0.002468224, -2.984437, 0, 1, 0.01176471, 1,
-0.4168712, 1.188399, -1.301653, 0, 1, 0.01568628, 1,
-0.4157335, 0.7271946, -1.732941, 0, 1, 0.02352941, 1,
-0.414936, -0.1905977, -1.530295, 0, 1, 0.02745098, 1,
-0.4147915, 0.4623399, -1.803205, 0, 1, 0.03529412, 1,
-0.4136351, -0.1254817, -2.865388, 0, 1, 0.03921569, 1,
-0.4120139, 0.7164689, -0.4190111, 0, 1, 0.04705882, 1,
-0.3993214, -1.097875, -2.885771, 0, 1, 0.05098039, 1,
-0.3976898, -1.126708, -3.082677, 0, 1, 0.05882353, 1,
-0.3965015, 0.1971467, -0.8218741, 0, 1, 0.0627451, 1,
-0.3964361, -0.7347082, -3.548099, 0, 1, 0.07058824, 1,
-0.3962745, -0.5816823, -2.920357, 0, 1, 0.07450981, 1,
-0.3954862, 0.6876629, -2.060041, 0, 1, 0.08235294, 1,
-0.3937891, 1.109521, -0.5905018, 0, 1, 0.08627451, 1,
-0.3914413, 0.7311151, -1.391428, 0, 1, 0.09411765, 1,
-0.3907301, 0.002253759, -1.713436, 0, 1, 0.1019608, 1,
-0.3863963, -1.060733, -0.7744423, 0, 1, 0.1058824, 1,
-0.3855969, -2.288129, -2.010425, 0, 1, 0.1137255, 1,
-0.3852384, 0.1155359, -2.060281, 0, 1, 0.1176471, 1,
-0.3773774, -1.589931, -3.338406, 0, 1, 0.1254902, 1,
-0.3772776, -1.406584, -2.540886, 0, 1, 0.1294118, 1,
-0.374889, 0.04079192, -1.095539, 0, 1, 0.1372549, 1,
-0.3730901, 0.6246843, -1.699788, 0, 1, 0.1411765, 1,
-0.371076, -0.4036713, -3.389418, 0, 1, 0.1490196, 1,
-0.3698531, 0.245322, -1.2802, 0, 1, 0.1529412, 1,
-0.3690142, -0.001547522, -1.079764, 0, 1, 0.1607843, 1,
-0.3676355, -0.1096706, -2.537227, 0, 1, 0.1647059, 1,
-0.3675801, 1.219427, -2.654165, 0, 1, 0.172549, 1,
-0.3619001, 0.1500425, -1.740475, 0, 1, 0.1764706, 1,
-0.3596239, 0.3664702, 0.3879213, 0, 1, 0.1843137, 1,
-0.3593496, -0.007093538, -2.283113, 0, 1, 0.1882353, 1,
-0.3588063, 1.212737, -0.1953769, 0, 1, 0.1960784, 1,
-0.3584508, 0.6478906, -0.0441783, 0, 1, 0.2039216, 1,
-0.3542925, 0.1781412, -0.7222938, 0, 1, 0.2078431, 1,
-0.3539414, 1.344281, -0.4542314, 0, 1, 0.2156863, 1,
-0.3528429, -0.6183683, -2.7401, 0, 1, 0.2196078, 1,
-0.3494948, -0.09104718, -3.145128, 0, 1, 0.227451, 1,
-0.3491415, 0.4385677, -0.8428944, 0, 1, 0.2313726, 1,
-0.3470348, 0.7268296, -0.9328926, 0, 1, 0.2392157, 1,
-0.3421769, -0.3681627, -1.824139, 0, 1, 0.2431373, 1,
-0.3419677, -0.1860811, -2.529263, 0, 1, 0.2509804, 1,
-0.3415773, -0.03680922, -2.475046, 0, 1, 0.254902, 1,
-0.3385508, 0.5499738, -1.318054, 0, 1, 0.2627451, 1,
-0.3380567, 0.2974924, -0.6880234, 0, 1, 0.2666667, 1,
-0.3335711, 1.250842, -0.348131, 0, 1, 0.2745098, 1,
-0.333266, 0.2636384, -1.848717, 0, 1, 0.2784314, 1,
-0.3295336, -1.334095, -0.9106458, 0, 1, 0.2862745, 1,
-0.3281001, -0.5612685, -2.171314, 0, 1, 0.2901961, 1,
-0.3268512, -1.121779, -3.26301, 0, 1, 0.2980392, 1,
-0.3229663, -0.2901356, -2.239315, 0, 1, 0.3058824, 1,
-0.3206781, -0.952139, -2.520634, 0, 1, 0.3098039, 1,
-0.3185203, 1.391391, -0.5232934, 0, 1, 0.3176471, 1,
-0.3165261, 0.2452534, -1.975292, 0, 1, 0.3215686, 1,
-0.3162342, -0.3360921, -0.1266682, 0, 1, 0.3294118, 1,
-0.3155598, -2.349021, -2.768952, 0, 1, 0.3333333, 1,
-0.3149455, 1.013126, 0.4083303, 0, 1, 0.3411765, 1,
-0.3142318, -0.2451124, -1.950414, 0, 1, 0.345098, 1,
-0.3103907, -0.05361705, -4.185613, 0, 1, 0.3529412, 1,
-0.3062809, 0.733834, 0.6646329, 0, 1, 0.3568628, 1,
-0.3036814, 0.4014557, -0.3421351, 0, 1, 0.3647059, 1,
-0.3011269, -0.5165873, -2.666978, 0, 1, 0.3686275, 1,
-0.2990715, 1.820981, 0.3164671, 0, 1, 0.3764706, 1,
-0.2982158, 2.002794, -0.7464126, 0, 1, 0.3803922, 1,
-0.2920363, -0.9026778, -1.74214, 0, 1, 0.3882353, 1,
-0.2912373, 0.670213, 0.5941278, 0, 1, 0.3921569, 1,
-0.2896655, -0.8223168, -2.213156, 0, 1, 0.4, 1,
-0.2896096, -0.3925333, -2.574498, 0, 1, 0.4078431, 1,
-0.2867432, -1.137109, -3.806002, 0, 1, 0.4117647, 1,
-0.2826483, 1.824037, -0.8067441, 0, 1, 0.4196078, 1,
-0.2822872, 0.2967456, 0.1628286, 0, 1, 0.4235294, 1,
-0.2790056, -0.09167354, -1.914972, 0, 1, 0.4313726, 1,
-0.2763501, -0.3159572, -3.824072, 0, 1, 0.4352941, 1,
-0.2698562, 0.4573932, -0.1833291, 0, 1, 0.4431373, 1,
-0.2677294, -2.082303, -3.131811, 0, 1, 0.4470588, 1,
-0.2632253, -0.1677764, -3.783752, 0, 1, 0.454902, 1,
-0.2628232, -0.8034925, -3.283834, 0, 1, 0.4588235, 1,
-0.2590853, 0.3307313, -1.434814, 0, 1, 0.4666667, 1,
-0.2587112, 1.93084, -1.360573, 0, 1, 0.4705882, 1,
-0.2548194, -0.9309117, -2.08742, 0, 1, 0.4784314, 1,
-0.2546582, 0.3231409, -1.932077, 0, 1, 0.4823529, 1,
-0.24776, 0.5383781, -1.005143, 0, 1, 0.4901961, 1,
-0.2401474, 0.3833815, -0.3865239, 0, 1, 0.4941176, 1,
-0.2399479, 0.06983095, -2.033054, 0, 1, 0.5019608, 1,
-0.2337037, 0.3363537, -0.5244868, 0, 1, 0.509804, 1,
-0.2300338, 0.2673399, 0.1156362, 0, 1, 0.5137255, 1,
-0.2168404, -0.6021253, -5.202738, 0, 1, 0.5215687, 1,
-0.2160873, -2.123287, -2.720036, 0, 1, 0.5254902, 1,
-0.2126743, -0.4512316, -2.027886, 0, 1, 0.5333334, 1,
-0.2125552, -0.5891152, -4.900537, 0, 1, 0.5372549, 1,
-0.2103568, 1.6418, 0.2287557, 0, 1, 0.5450981, 1,
-0.2068152, -0.2655283, -4.032097, 0, 1, 0.5490196, 1,
-0.2067052, 0.1132136, -2.154784, 0, 1, 0.5568628, 1,
-0.205496, -0.8698855, -4.071346, 0, 1, 0.5607843, 1,
-0.2034934, -0.5193625, -3.537897, 0, 1, 0.5686275, 1,
-0.2013969, 1.101918, 0.02004065, 0, 1, 0.572549, 1,
-0.200533, -1.625944, -4.503329, 0, 1, 0.5803922, 1,
-0.1964737, -0.6607586, -3.153175, 0, 1, 0.5843138, 1,
-0.1907284, -0.04867778, -2.691671, 0, 1, 0.5921569, 1,
-0.1855987, -0.3143021, -1.354567, 0, 1, 0.5960785, 1,
-0.1822336, -0.3155886, -2.319244, 0, 1, 0.6039216, 1,
-0.1729186, -0.7845138, -2.468866, 0, 1, 0.6117647, 1,
-0.1713091, -0.4122121, -3.131488, 0, 1, 0.6156863, 1,
-0.1679884, 1.990678, -0.9848465, 0, 1, 0.6235294, 1,
-0.1554749, -0.0897873, -3.658633, 0, 1, 0.627451, 1,
-0.1530344, 1.913975, 2.070673, 0, 1, 0.6352941, 1,
-0.1528303, 0.176782, -0.5075825, 0, 1, 0.6392157, 1,
-0.1520212, -0.1207463, -3.055487, 0, 1, 0.6470588, 1,
-0.1463039, 0.3924753, -0.1369042, 0, 1, 0.6509804, 1,
-0.1415961, -0.6137018, -4.135478, 0, 1, 0.6588235, 1,
-0.1390602, 0.06247312, 0.4390919, 0, 1, 0.6627451, 1,
-0.1351491, -0.3990116, -2.784392, 0, 1, 0.6705883, 1,
-0.1308987, -0.8738807, -2.817763, 0, 1, 0.6745098, 1,
-0.1247164, 0.3281766, 0.5527357, 0, 1, 0.682353, 1,
-0.1170208, -1.564554, -1.980773, 0, 1, 0.6862745, 1,
-0.1129739, 1.575672, -0.6749632, 0, 1, 0.6941177, 1,
-0.111733, 0.4788485, 0.02492693, 0, 1, 0.7019608, 1,
-0.1100153, -0.321755, -3.585188, 0, 1, 0.7058824, 1,
-0.1077155, -0.9230392, -3.239356, 0, 1, 0.7137255, 1,
-0.1068879, -0.4507355, -2.671223, 0, 1, 0.7176471, 1,
-0.1026245, 1.359452, -1.087005, 0, 1, 0.7254902, 1,
-0.1024849, -0.5227156, -0.8628963, 0, 1, 0.7294118, 1,
-0.1022335, 0.5833581, -1.604914, 0, 1, 0.7372549, 1,
-0.09890486, 0.4466472, -2.325822, 0, 1, 0.7411765, 1,
-0.09889022, 0.04311232, -2.659652, 0, 1, 0.7490196, 1,
-0.09335284, -0.129546, -2.978752, 0, 1, 0.7529412, 1,
-0.09286436, -0.4940065, -2.771825, 0, 1, 0.7607843, 1,
-0.09006323, 2.642576, -0.0005106309, 0, 1, 0.7647059, 1,
-0.08877625, 0.3442624, 0.219711, 0, 1, 0.772549, 1,
-0.0874908, 1.472915, -1.859439, 0, 1, 0.7764706, 1,
-0.08477195, 0.691313, -0.1406868, 0, 1, 0.7843137, 1,
-0.08316408, 0.9233608, 0.7257208, 0, 1, 0.7882353, 1,
-0.08171687, -1.145223, -3.250086, 0, 1, 0.7960784, 1,
-0.08069968, 0.9197387, -0.8863732, 0, 1, 0.8039216, 1,
-0.07985667, 0.9312394, -0.309239, 0, 1, 0.8078431, 1,
-0.07901074, 0.0225125, -2.669075, 0, 1, 0.8156863, 1,
-0.0788814, -1.568847, -3.768952, 0, 1, 0.8196079, 1,
-0.07686385, -0.6279862, -4.110365, 0, 1, 0.827451, 1,
-0.07504982, 0.7925711, 0.2852027, 0, 1, 0.8313726, 1,
-0.07203575, 0.5749893, -1.517451, 0, 1, 0.8392157, 1,
-0.07154216, 0.760481, -1.109272, 0, 1, 0.8431373, 1,
-0.07030065, -0.1729369, -4.111191, 0, 1, 0.8509804, 1,
-0.06899081, -0.1271881, -2.32101, 0, 1, 0.854902, 1,
-0.06793176, -0.1425002, -3.526177, 0, 1, 0.8627451, 1,
-0.06195869, 0.5018793, -1.163093, 0, 1, 0.8666667, 1,
-0.06184839, -0.2293873, -3.404428, 0, 1, 0.8745098, 1,
-0.06165159, -0.5767363, -2.835235, 0, 1, 0.8784314, 1,
-0.06036481, 2.448511, -0.4352367, 0, 1, 0.8862745, 1,
-0.05969368, 0.6990111, 0.8475338, 0, 1, 0.8901961, 1,
-0.05714828, -0.5608211, -4.256508, 0, 1, 0.8980392, 1,
-0.05395256, -0.2980876, -2.886436, 0, 1, 0.9058824, 1,
-0.05103144, 0.8271381, 1.106137, 0, 1, 0.9098039, 1,
-0.04826342, -0.4952013, -3.712451, 0, 1, 0.9176471, 1,
-0.04278799, -1.064179, -2.248727, 0, 1, 0.9215686, 1,
-0.04060171, 0.08319427, -0.5067866, 0, 1, 0.9294118, 1,
-0.03833069, -0.4317821, -0.3544818, 0, 1, 0.9333333, 1,
-0.03258555, 1.292519, -0.2585166, 0, 1, 0.9411765, 1,
-0.02580647, 0.2891986, -0.9588658, 0, 1, 0.945098, 1,
-0.02324132, 0.1841321, -1.254901, 0, 1, 0.9529412, 1,
-0.01780859, -0.3626834, -3.017487, 0, 1, 0.9568627, 1,
-0.01725158, -1.106387, -1.639659, 0, 1, 0.9647059, 1,
-0.0134592, 0.506362, 0.5956935, 0, 1, 0.9686275, 1,
-0.01265356, -0.5199072, -2.595377, 0, 1, 0.9764706, 1,
-0.01225858, -0.06936101, -4.061362, 0, 1, 0.9803922, 1,
-0.0121161, -0.8358525, -2.7945, 0, 1, 0.9882353, 1,
-0.01164087, 1.576832, 0.1207243, 0, 1, 0.9921569, 1,
-0.01056256, -1.502503, -3.329076, 0, 1, 1, 1,
-0.01031647, -0.7447093, -2.140095, 0, 0.9921569, 1, 1,
-0.004137096, 0.1730871, 0.333296, 0, 0.9882353, 1, 1,
-0.0006197562, 0.2771316, -1.939144, 0, 0.9803922, 1, 1,
0.004682557, 1.481824, -1.230519, 0, 0.9764706, 1, 1,
0.00477992, 0.4734942, 0.3690299, 0, 0.9686275, 1, 1,
0.005962541, 1.85105, 0.9433978, 0, 0.9647059, 1, 1,
0.007975395, -0.8880359, 3.940316, 0, 0.9568627, 1, 1,
0.009074155, -1.598369, 4.298224, 0, 0.9529412, 1, 1,
0.01002469, 0.1302447, -1.037812, 0, 0.945098, 1, 1,
0.01057367, 1.285048, -0.6261846, 0, 0.9411765, 1, 1,
0.01455946, 0.3483357, 0.3072974, 0, 0.9333333, 1, 1,
0.01476374, 1.86168, -1.517798, 0, 0.9294118, 1, 1,
0.01630083, 0.9020013, 0.5067956, 0, 0.9215686, 1, 1,
0.0166737, -1.233064, 2.059948, 0, 0.9176471, 1, 1,
0.01858652, -0.2376233, 3.755166, 0, 0.9098039, 1, 1,
0.01886347, 0.8507118, 1.32283, 0, 0.9058824, 1, 1,
0.02044625, 0.8295973, 0.6546152, 0, 0.8980392, 1, 1,
0.02052315, 0.4299474, -1.543799, 0, 0.8901961, 1, 1,
0.02241455, 1.918868, 0.5078914, 0, 0.8862745, 1, 1,
0.0232875, 1.786085, -0.8440048, 0, 0.8784314, 1, 1,
0.02609902, -0.4593517, 2.575618, 0, 0.8745098, 1, 1,
0.02944084, 0.1677046, -0.8663751, 0, 0.8666667, 1, 1,
0.02966111, 0.4374592, -1.14859, 0, 0.8627451, 1, 1,
0.03009512, -0.3495304, 0.6949648, 0, 0.854902, 1, 1,
0.03390117, -0.1196654, 2.570162, 0, 0.8509804, 1, 1,
0.03600496, -0.72894, 2.630964, 0, 0.8431373, 1, 1,
0.03869103, 0.4150321, -0.1866978, 0, 0.8392157, 1, 1,
0.04086667, -0.1017567, 2.795487, 0, 0.8313726, 1, 1,
0.04484406, -1.288014, 3.352462, 0, 0.827451, 1, 1,
0.0471845, 2.087386, 0.6267637, 0, 0.8196079, 1, 1,
0.050466, 1.522054, -1.741064, 0, 0.8156863, 1, 1,
0.05115026, -0.9721118, 3.881662, 0, 0.8078431, 1, 1,
0.05467211, -0.2666067, 2.304548, 0, 0.8039216, 1, 1,
0.05549818, -0.4725792, 4.510187, 0, 0.7960784, 1, 1,
0.05808846, -1.716297, 3.675632, 0, 0.7882353, 1, 1,
0.06208412, 0.9626324, 0.7748346, 0, 0.7843137, 1, 1,
0.0633926, -1.273751, 2.732941, 0, 0.7764706, 1, 1,
0.06822004, 0.2144008, 0.61317, 0, 0.772549, 1, 1,
0.07334827, -3.038256, 3.509889, 0, 0.7647059, 1, 1,
0.07598881, -1.257201, 1.354969, 0, 0.7607843, 1, 1,
0.0796776, -0.9418242, 3.068112, 0, 0.7529412, 1, 1,
0.08292226, 0.1787097, -1.537873, 0, 0.7490196, 1, 1,
0.08707075, -0.0253176, 2.096019, 0, 0.7411765, 1, 1,
0.09232973, -1.576418, 3.294027, 0, 0.7372549, 1, 1,
0.09284068, 0.9448292, 1.185285, 0, 0.7294118, 1, 1,
0.0939365, 0.7662894, -1.490766, 0, 0.7254902, 1, 1,
0.09711982, 0.6509542, 1.445176, 0, 0.7176471, 1, 1,
0.09824055, -0.07163529, 1.371896, 0, 0.7137255, 1, 1,
0.1086414, 1.074706, 0.7234839, 0, 0.7058824, 1, 1,
0.1105154, -1.013912, 3.10707, 0, 0.6980392, 1, 1,
0.1115, 0.8736151, 0.3776248, 0, 0.6941177, 1, 1,
0.1120106, -1.689247, 2.996726, 0, 0.6862745, 1, 1,
0.1131932, -1.664011, 2.324888, 0, 0.682353, 1, 1,
0.1147298, -0.1291074, 3.621656, 0, 0.6745098, 1, 1,
0.1159552, -1.309633, 1.2726, 0, 0.6705883, 1, 1,
0.1186642, 0.6686251, -0.4148084, 0, 0.6627451, 1, 1,
0.1202385, 0.3036697, -0.6563559, 0, 0.6588235, 1, 1,
0.1235902, -1.462174, 1.412004, 0, 0.6509804, 1, 1,
0.1252349, -0.1674253, 3.109924, 0, 0.6470588, 1, 1,
0.1261728, 1.010746, 0.2644199, 0, 0.6392157, 1, 1,
0.1274798, 0.3933197, 0.8610204, 0, 0.6352941, 1, 1,
0.1309895, -1.273365, 3.233446, 0, 0.627451, 1, 1,
0.1372943, 1.1566, 0.4890247, 0, 0.6235294, 1, 1,
0.1403147, 1.311462, 0.8216262, 0, 0.6156863, 1, 1,
0.1408885, 1.034645, 0.2446651, 0, 0.6117647, 1, 1,
0.1417544, 0.2875061, 0.1279382, 0, 0.6039216, 1, 1,
0.1446895, -1.010978, 2.824965, 0, 0.5960785, 1, 1,
0.1447119, 1.196992, 0.3366459, 0, 0.5921569, 1, 1,
0.1450914, 0.04245912, 1.540066, 0, 0.5843138, 1, 1,
0.1464451, -0.5479044, 1.171488, 0, 0.5803922, 1, 1,
0.1478133, 0.5106836, 0.162377, 0, 0.572549, 1, 1,
0.1503921, 0.2373823, 1.20823, 0, 0.5686275, 1, 1,
0.1522342, 1.246863, 0.2954852, 0, 0.5607843, 1, 1,
0.1527474, 0.0340929, 2.344616, 0, 0.5568628, 1, 1,
0.1558966, -1.249249, 2.008776, 0, 0.5490196, 1, 1,
0.1632364, -0.02847736, 2.269547, 0, 0.5450981, 1, 1,
0.1644664, -0.837982, 2.633872, 0, 0.5372549, 1, 1,
0.1665901, 1.261971, 0.569353, 0, 0.5333334, 1, 1,
0.1704342, 0.04542981, 1.170645, 0, 0.5254902, 1, 1,
0.1704947, 0.07930805, 0.474775, 0, 0.5215687, 1, 1,
0.170911, 0.7021285, 0.005343636, 0, 0.5137255, 1, 1,
0.1715921, -0.6657134, 4.43723, 0, 0.509804, 1, 1,
0.1756894, 0.3961956, 0.621669, 0, 0.5019608, 1, 1,
0.1761329, 0.2857059, 0.5350772, 0, 0.4941176, 1, 1,
0.181622, 0.2450611, -0.637795, 0, 0.4901961, 1, 1,
0.1888163, 0.1339709, 0.912761, 0, 0.4823529, 1, 1,
0.1894537, 3.135691, 0.2487689, 0, 0.4784314, 1, 1,
0.1918165, -0.6404288, 2.1034, 0, 0.4705882, 1, 1,
0.1943059, 0.174392, 0.5903406, 0, 0.4666667, 1, 1,
0.1943366, 1.978865, 0.9136929, 0, 0.4588235, 1, 1,
0.197843, 0.7597589, 0.1060899, 0, 0.454902, 1, 1,
0.1978455, -0.6660712, 2.539653, 0, 0.4470588, 1, 1,
0.2026519, 0.1226425, -0.08323898, 0, 0.4431373, 1, 1,
0.2039994, 1.022559, 1.003969, 0, 0.4352941, 1, 1,
0.2066294, 1.164788, -0.2735418, 0, 0.4313726, 1, 1,
0.2099093, 0.5721957, 2.327123, 0, 0.4235294, 1, 1,
0.210021, 0.49583, -1.076386, 0, 0.4196078, 1, 1,
0.2222124, 1.471174, 0.8596855, 0, 0.4117647, 1, 1,
0.2286081, -0.6781021, 1.816604, 0, 0.4078431, 1, 1,
0.2311591, -0.5813871, 1.941444, 0, 0.4, 1, 1,
0.2318722, -0.436883, 3.187911, 0, 0.3921569, 1, 1,
0.2353633, 1.294922, 2.272342, 0, 0.3882353, 1, 1,
0.2366685, 1.732263, -0.173109, 0, 0.3803922, 1, 1,
0.2392745, 3.285331, 0.519919, 0, 0.3764706, 1, 1,
0.2441451, 1.360912, -0.05891696, 0, 0.3686275, 1, 1,
0.2453646, -1.875037, 2.829259, 0, 0.3647059, 1, 1,
0.260646, 2.184767, -0.0458926, 0, 0.3568628, 1, 1,
0.2608178, 0.3611678, 0.05894171, 0, 0.3529412, 1, 1,
0.2658503, -1.006564, 2.423022, 0, 0.345098, 1, 1,
0.2692174, -1.974952, 3.331919, 0, 0.3411765, 1, 1,
0.2706463, 0.05373807, 3.297602, 0, 0.3333333, 1, 1,
0.2750348, 0.5559371, 0.6641473, 0, 0.3294118, 1, 1,
0.2821304, -2.17703, 1.882155, 0, 0.3215686, 1, 1,
0.2821306, 0.1040135, 2.594312, 0, 0.3176471, 1, 1,
0.2851965, -0.02083102, 2.46039, 0, 0.3098039, 1, 1,
0.2925068, -1.903544, 2.422135, 0, 0.3058824, 1, 1,
0.2949322, 1.253502, 0.6322325, 0, 0.2980392, 1, 1,
0.2952497, 0.4083158, -0.003327969, 0, 0.2901961, 1, 1,
0.2967376, 0.9386988, -1.120933, 0, 0.2862745, 1, 1,
0.3023195, -0.01402336, 1.839735, 0, 0.2784314, 1, 1,
0.3031987, 0.4734795, 2.155674, 0, 0.2745098, 1, 1,
0.3037792, -0.995566, 3.48063, 0, 0.2666667, 1, 1,
0.3089646, -0.7595276, 3.067607, 0, 0.2627451, 1, 1,
0.3131116, 0.08961011, 0.4985701, 0, 0.254902, 1, 1,
0.3156542, -0.5492982, 2.184197, 0, 0.2509804, 1, 1,
0.3161901, 0.6939846, 2.337139, 0, 0.2431373, 1, 1,
0.3196324, 0.5884338, -0.06015384, 0, 0.2392157, 1, 1,
0.3201855, -1.255333, 2.471846, 0, 0.2313726, 1, 1,
0.3208444, -0.8561685, 2.13286, 0, 0.227451, 1, 1,
0.3213555, 1.070064, 0.9568822, 0, 0.2196078, 1, 1,
0.3270964, 1.869601, -1.33893, 0, 0.2156863, 1, 1,
0.3285505, -0.9370973, 5.108146, 0, 0.2078431, 1, 1,
0.3290413, -0.650043, 1.741312, 0, 0.2039216, 1, 1,
0.329747, 1.897549, 0.289871, 0, 0.1960784, 1, 1,
0.3322028, -0.7114434, 1.931171, 0, 0.1882353, 1, 1,
0.3350722, -0.9773675, 2.853027, 0, 0.1843137, 1, 1,
0.3354667, 0.4616352, 0.5080472, 0, 0.1764706, 1, 1,
0.33753, 0.7574657, 0.6522717, 0, 0.172549, 1, 1,
0.3428229, -0.6361536, 1.701899, 0, 0.1647059, 1, 1,
0.3489151, -0.5565158, 2.25275, 0, 0.1607843, 1, 1,
0.3499057, -0.3607921, -0.2030236, 0, 0.1529412, 1, 1,
0.3503913, 0.1246314, 2.63448, 0, 0.1490196, 1, 1,
0.3528926, 0.587943, -0.976612, 0, 0.1411765, 1, 1,
0.3548081, -0.4766983, 2.877026, 0, 0.1372549, 1, 1,
0.3564936, 0.3621755, -0.4375575, 0, 0.1294118, 1, 1,
0.3607611, 0.9632399, 0.9950598, 0, 0.1254902, 1, 1,
0.3610781, -0.8518513, 4.153401, 0, 0.1176471, 1, 1,
0.3633624, 0.7407928, 2.563425, 0, 0.1137255, 1, 1,
0.3652499, 0.776889, -0.1150024, 0, 0.1058824, 1, 1,
0.3676583, 0.02971001, 2.365858, 0, 0.09803922, 1, 1,
0.3690335, -0.5528095, 2.376862, 0, 0.09411765, 1, 1,
0.3720076, 0.9692321, -0.6881359, 0, 0.08627451, 1, 1,
0.373275, -0.7166634, 2.164121, 0, 0.08235294, 1, 1,
0.3786501, 0.1650117, 1.99536, 0, 0.07450981, 1, 1,
0.3793968, -0.9272851, 3.335667, 0, 0.07058824, 1, 1,
0.3909783, 1.364729, 0.5235237, 0, 0.0627451, 1, 1,
0.392684, 0.5719321, 0.9703168, 0, 0.05882353, 1, 1,
0.3983893, 1.89215, -0.585825, 0, 0.05098039, 1, 1,
0.4055072, 0.5544723, 0.4157924, 0, 0.04705882, 1, 1,
0.4095569, 0.6341575, 1.712083, 0, 0.03921569, 1, 1,
0.4104137, 0.1432392, 2.989822, 0, 0.03529412, 1, 1,
0.4141852, -0.1956394, 1.693496, 0, 0.02745098, 1, 1,
0.4145201, -0.02134363, 1.048487, 0, 0.02352941, 1, 1,
0.4145759, -0.2728438, 2.646136, 0, 0.01568628, 1, 1,
0.4146735, -1.593743, 2.609162, 0, 0.01176471, 1, 1,
0.4146768, 0.5388805, 1.606168, 0, 0.003921569, 1, 1,
0.4180373, -0.6243125, 3.687993, 0.003921569, 0, 1, 1,
0.419694, -0.005532191, 2.153081, 0.007843138, 0, 1, 1,
0.4249444, -0.8920692, 2.980282, 0.01568628, 0, 1, 1,
0.4251669, 0.7349522, 0.1951092, 0.01960784, 0, 1, 1,
0.4290442, -0.7956455, 4.207254, 0.02745098, 0, 1, 1,
0.4318863, -0.1439711, 1.792115, 0.03137255, 0, 1, 1,
0.4322966, 0.3077912, 1.085823, 0.03921569, 0, 1, 1,
0.4336413, -1.720329, 2.982593, 0.04313726, 0, 1, 1,
0.4346737, 0.2385489, 2.024969, 0.05098039, 0, 1, 1,
0.4347244, 0.1281904, 1.133607, 0.05490196, 0, 1, 1,
0.4549372, 1.643163, 0.6121939, 0.0627451, 0, 1, 1,
0.455615, -1.375226, 2.261384, 0.06666667, 0, 1, 1,
0.4562035, 0.1038992, 1.508631, 0.07450981, 0, 1, 1,
0.456888, -1.662684, 3.090597, 0.07843138, 0, 1, 1,
0.4587543, 0.4617463, 0.4482455, 0.08627451, 0, 1, 1,
0.4603738, -0.550041, 3.889743, 0.09019608, 0, 1, 1,
0.4613133, -1.510954, 0.4840773, 0.09803922, 0, 1, 1,
0.4635571, 0.09512399, 2.483009, 0.1058824, 0, 1, 1,
0.4787327, -0.7578337, 1.960418, 0.1098039, 0, 1, 1,
0.4819368, -2.912277, 2.669051, 0.1176471, 0, 1, 1,
0.4846971, -0.5699753, 3.400692, 0.1215686, 0, 1, 1,
0.4850492, -1.897433, 1.893277, 0.1294118, 0, 1, 1,
0.4878444, -0.3576163, 2.026709, 0.1333333, 0, 1, 1,
0.4891953, 1.518162, -0.3131175, 0.1411765, 0, 1, 1,
0.4895701, -0.04275011, 2.331075, 0.145098, 0, 1, 1,
0.4904273, -1.022239, 1.827646, 0.1529412, 0, 1, 1,
0.4928603, 0.5133366, 1.531981, 0.1568628, 0, 1, 1,
0.4973202, -0.05767136, 1.287014, 0.1647059, 0, 1, 1,
0.502783, 1.12679, -0.6264845, 0.1686275, 0, 1, 1,
0.507642, -0.311139, 3.448971, 0.1764706, 0, 1, 1,
0.5113427, -0.1133866, 1.3544, 0.1803922, 0, 1, 1,
0.5128461, -0.5432233, 3.370347, 0.1882353, 0, 1, 1,
0.5160758, 0.2250764, 1.0662, 0.1921569, 0, 1, 1,
0.5191402, 0.7382002, 1.648319, 0.2, 0, 1, 1,
0.5239763, -0.05341445, -0.7831039, 0.2078431, 0, 1, 1,
0.5263594, 0.8749084, 0.2661456, 0.2117647, 0, 1, 1,
0.5285302, -0.814554, 3.5793, 0.2196078, 0, 1, 1,
0.5288258, -0.6728259, 3.362079, 0.2235294, 0, 1, 1,
0.5348696, -0.117028, 2.337994, 0.2313726, 0, 1, 1,
0.5367373, -0.961471, 2.498204, 0.2352941, 0, 1, 1,
0.5499701, -0.08613972, 1.524603, 0.2431373, 0, 1, 1,
0.5541215, 1.713551, 2.027156, 0.2470588, 0, 1, 1,
0.5546058, -1.467135, 4.604702, 0.254902, 0, 1, 1,
0.5553413, -1.009696, 2.506216, 0.2588235, 0, 1, 1,
0.5618426, 0.2018424, -0.2283179, 0.2666667, 0, 1, 1,
0.5641431, 0.5772321, 0.7135654, 0.2705882, 0, 1, 1,
0.5654752, 0.7690679, -1.783107, 0.2784314, 0, 1, 1,
0.5657087, 0.472757, 0.3058104, 0.282353, 0, 1, 1,
0.568135, -0.06350078, 2.295461, 0.2901961, 0, 1, 1,
0.5701434, 0.5231158, 2.489019, 0.2941177, 0, 1, 1,
0.5704058, 0.9364992, 1.528325, 0.3019608, 0, 1, 1,
0.5782757, 0.8926427, 0.4696338, 0.3098039, 0, 1, 1,
0.5830414, -0.8735089, 2.23809, 0.3137255, 0, 1, 1,
0.58499, -0.3968674, 2.04317, 0.3215686, 0, 1, 1,
0.5855532, -0.1216747, 2.175576, 0.3254902, 0, 1, 1,
0.5889187, -0.7258741, 3.290638, 0.3333333, 0, 1, 1,
0.5891964, -0.7652473, 4.191356, 0.3372549, 0, 1, 1,
0.5911955, -0.8401181, 3.474459, 0.345098, 0, 1, 1,
0.5917983, -0.3098261, 1.621739, 0.3490196, 0, 1, 1,
0.5954221, 1.181633, 0.4191613, 0.3568628, 0, 1, 1,
0.5963656, 1.211667, -0.282692, 0.3607843, 0, 1, 1,
0.5965691, 0.2923267, -0.2372018, 0.3686275, 0, 1, 1,
0.6075022, -0.2250218, 3.60478, 0.372549, 0, 1, 1,
0.608722, 0.08298542, 1.124413, 0.3803922, 0, 1, 1,
0.6087259, -2.001281, 3.201705, 0.3843137, 0, 1, 1,
0.6135818, -0.3458567, 2.631582, 0.3921569, 0, 1, 1,
0.6258286, 0.385005, 1.563516, 0.3960784, 0, 1, 1,
0.6294698, -0.621573, 2.718117, 0.4039216, 0, 1, 1,
0.6297527, -0.7005017, 3.132977, 0.4117647, 0, 1, 1,
0.6328942, 1.455391, 1.308142, 0.4156863, 0, 1, 1,
0.6342291, 1.334858, 0.02361721, 0.4235294, 0, 1, 1,
0.6344409, -0.4005501, 1.617537, 0.427451, 0, 1, 1,
0.6453255, 2.402761, -0.6524315, 0.4352941, 0, 1, 1,
0.6496695, 1.870854, 0.03507074, 0.4392157, 0, 1, 1,
0.6503845, 0.8850364, 0.7708629, 0.4470588, 0, 1, 1,
0.6564541, 0.08259064, 0.3696553, 0.4509804, 0, 1, 1,
0.656979, 0.7289292, 2.508686, 0.4588235, 0, 1, 1,
0.6583316, -0.749396, 1.228937, 0.4627451, 0, 1, 1,
0.6642715, 1.530779, -0.4202307, 0.4705882, 0, 1, 1,
0.6659749, 2.075892, -0.3274724, 0.4745098, 0, 1, 1,
0.667429, 2.536363, 0.6827349, 0.4823529, 0, 1, 1,
0.6678517, 0.1439363, 1.355378, 0.4862745, 0, 1, 1,
0.6683938, 0.7984963, 0.3573571, 0.4941176, 0, 1, 1,
0.6684592, 0.3437125, 0.6729968, 0.5019608, 0, 1, 1,
0.6734892, -0.2653959, 0.9654567, 0.5058824, 0, 1, 1,
0.6742615, 2.180709, 0.3824964, 0.5137255, 0, 1, 1,
0.6747911, 0.001283074, 3.083894, 0.5176471, 0, 1, 1,
0.6751687, -0.9681664, 2.748384, 0.5254902, 0, 1, 1,
0.6839245, -1.474957, 2.121764, 0.5294118, 0, 1, 1,
0.6864129, 0.4646718, -1.131008, 0.5372549, 0, 1, 1,
0.6866857, -0.03758223, 1.709447, 0.5411765, 0, 1, 1,
0.6936137, 0.3404945, -0.9196156, 0.5490196, 0, 1, 1,
0.6974885, -1.303691, 2.52044, 0.5529412, 0, 1, 1,
0.6976336, 0.02260396, 2.819712, 0.5607843, 0, 1, 1,
0.7025042, 0.8383053, 1.614051, 0.5647059, 0, 1, 1,
0.7040551, 0.4657818, 0.8504885, 0.572549, 0, 1, 1,
0.7061862, -0.0310195, 2.43038, 0.5764706, 0, 1, 1,
0.7072333, -1.31175, 1.835047, 0.5843138, 0, 1, 1,
0.7084185, -0.4522923, 3.650954, 0.5882353, 0, 1, 1,
0.7088724, 0.2268465, 1.721049, 0.5960785, 0, 1, 1,
0.7091233, -0.9180533, 1.890906, 0.6039216, 0, 1, 1,
0.7134101, -1.539505, 3.185976, 0.6078432, 0, 1, 1,
0.7137685, 0.1416772, 1.741928, 0.6156863, 0, 1, 1,
0.7145193, 0.5078211, 1.192042, 0.6196079, 0, 1, 1,
0.7170855, 0.455543, 1.2548, 0.627451, 0, 1, 1,
0.7187376, 0.1825808, 1.459936, 0.6313726, 0, 1, 1,
0.7218615, -0.228288, 3.048098, 0.6392157, 0, 1, 1,
0.7219045, -1.585782, 1.754729, 0.6431373, 0, 1, 1,
0.7265945, -0.549415, 2.714678, 0.6509804, 0, 1, 1,
0.7349741, 0.781453, -0.2369986, 0.654902, 0, 1, 1,
0.738165, 2.041224, 0.8177813, 0.6627451, 0, 1, 1,
0.7424858, 0.3509413, -0.3503683, 0.6666667, 0, 1, 1,
0.7519782, 2.402642, 2.245039, 0.6745098, 0, 1, 1,
0.7530055, -1.462669, 1.670381, 0.6784314, 0, 1, 1,
0.7537925, 0.5504049, 1.153424, 0.6862745, 0, 1, 1,
0.7553887, -1.057996, 3.333438, 0.6901961, 0, 1, 1,
0.7567219, 0.06670047, 1.509967, 0.6980392, 0, 1, 1,
0.7605652, 0.9870722, -2.142944, 0.7058824, 0, 1, 1,
0.7611722, -0.2684087, 2.738806, 0.7098039, 0, 1, 1,
0.7624053, -1.212093, 3.423592, 0.7176471, 0, 1, 1,
0.7656193, 1.120058, 1.082446, 0.7215686, 0, 1, 1,
0.7658365, -1.160888, 4.499177, 0.7294118, 0, 1, 1,
0.7691649, 0.4961942, 2.427221, 0.7333333, 0, 1, 1,
0.7707273, 1.619178, -0.3674386, 0.7411765, 0, 1, 1,
0.7726182, 1.021476, 1.417411, 0.7450981, 0, 1, 1,
0.7755771, 0.4157125, 1.344494, 0.7529412, 0, 1, 1,
0.7757987, 1.560925, 0.9831467, 0.7568628, 0, 1, 1,
0.7763847, -0.41162, 0.9936717, 0.7647059, 0, 1, 1,
0.7770612, -0.05693095, 1.053461, 0.7686275, 0, 1, 1,
0.7773239, 0.5510297, 1.611122, 0.7764706, 0, 1, 1,
0.7942765, 1.067081, 0.1314334, 0.7803922, 0, 1, 1,
0.8024592, 0.2380671, 3.212323, 0.7882353, 0, 1, 1,
0.8073006, -2.803529, 1.7046, 0.7921569, 0, 1, 1,
0.8128692, 0.7724022, 1.843707, 0.8, 0, 1, 1,
0.813096, -1.320586, 2.821184, 0.8078431, 0, 1, 1,
0.8186434, 0.0665694, 1.845376, 0.8117647, 0, 1, 1,
0.8193509, -0.2452337, 3.470838, 0.8196079, 0, 1, 1,
0.8204628, 1.336312, 0.2742389, 0.8235294, 0, 1, 1,
0.8210166, -0.8783269, 4.350343, 0.8313726, 0, 1, 1,
0.8243167, 0.773218, 1.78872, 0.8352941, 0, 1, 1,
0.8248727, -0.3394558, 2.444076, 0.8431373, 0, 1, 1,
0.8267767, -0.4949984, 2.012918, 0.8470588, 0, 1, 1,
0.8291192, 0.3001964, 1.038874, 0.854902, 0, 1, 1,
0.8317133, -1.056329, 3.330287, 0.8588235, 0, 1, 1,
0.8321509, -0.3930384, 3.854444, 0.8666667, 0, 1, 1,
0.8351384, 0.7906122, 0.4892787, 0.8705882, 0, 1, 1,
0.8447184, -0.868989, 1.165273, 0.8784314, 0, 1, 1,
0.8449053, 0.5467943, 1.190361, 0.8823529, 0, 1, 1,
0.84758, 0.3043871, 0.9298248, 0.8901961, 0, 1, 1,
0.8520334, 0.7123912, 1.492303, 0.8941177, 0, 1, 1,
0.8575331, 0.2599333, 2.396069, 0.9019608, 0, 1, 1,
0.8592671, -0.4122604, 2.06551, 0.9098039, 0, 1, 1,
0.8675568, -1.568188, 3.600328, 0.9137255, 0, 1, 1,
0.867698, 0.7121087, 2.040609, 0.9215686, 0, 1, 1,
0.8773615, -1.269283, 0.5844482, 0.9254902, 0, 1, 1,
0.8806167, -0.6455113, 3.573615, 0.9333333, 0, 1, 1,
0.8841287, 0.377556, 1.873321, 0.9372549, 0, 1, 1,
0.8874368, -0.2938956, 3.029851, 0.945098, 0, 1, 1,
0.8893719, -0.6930777, 4.107205, 0.9490196, 0, 1, 1,
0.8902969, 0.7573272, 0.464757, 0.9568627, 0, 1, 1,
0.8923075, 0.09094491, -0.6961428, 0.9607843, 0, 1, 1,
0.8933926, -1.654831, 3.133716, 0.9686275, 0, 1, 1,
0.9016995, 0.9568757, 0.9643301, 0.972549, 0, 1, 1,
0.9031756, -0.6750752, 3.184454, 0.9803922, 0, 1, 1,
0.9142981, 0.4866323, 3.157856, 0.9843137, 0, 1, 1,
0.9192286, -1.092517, 4.415118, 0.9921569, 0, 1, 1,
0.9203117, 1.00489, -1.032448, 0.9960784, 0, 1, 1,
0.9330968, -0.9845702, 3.18481, 1, 0, 0.9960784, 1,
0.9493745, 0.8162442, 1.190108, 1, 0, 0.9882353, 1,
0.9512113, -0.1896569, 1.533682, 1, 0, 0.9843137, 1,
0.9548915, 0.8773019, -0.5207625, 1, 0, 0.9764706, 1,
0.9633489, -0.7722402, 1.96978, 1, 0, 0.972549, 1,
0.9691661, 1.287116, 1.779005, 1, 0, 0.9647059, 1,
0.9829972, -0.9536921, 2.59534, 1, 0, 0.9607843, 1,
0.9959977, 0.0845289, 0.607013, 1, 0, 0.9529412, 1,
0.9972149, 1.381972, 0.9829425, 1, 0, 0.9490196, 1,
1.000549, -1.663791, 0.9426579, 1, 0, 0.9411765, 1,
1.001057, 0.1746716, 0.2511844, 1, 0, 0.9372549, 1,
1.001451, 1.594548, -0.093482, 1, 0, 0.9294118, 1,
1.001491, 0.1491013, 1.30247, 1, 0, 0.9254902, 1,
1.009005, -0.006294519, 3.002532, 1, 0, 0.9176471, 1,
1.010287, 0.8832946, -0.6982771, 1, 0, 0.9137255, 1,
1.014324, 0.909119, -1.426414, 1, 0, 0.9058824, 1,
1.016655, -1.494111, 3.152468, 1, 0, 0.9019608, 1,
1.018632, -1.314598, 3.445709, 1, 0, 0.8941177, 1,
1.023468, 1.068198, 0.3233111, 1, 0, 0.8862745, 1,
1.028722, -1.778605, 2.720195, 1, 0, 0.8823529, 1,
1.048553, -0.1448002, 1.124133, 1, 0, 0.8745098, 1,
1.070924, 0.5416105, -0.4796882, 1, 0, 0.8705882, 1,
1.070933, -0.9710273, 3.480003, 1, 0, 0.8627451, 1,
1.085755, 0.5707332, 0.8022587, 1, 0, 0.8588235, 1,
1.091244, -0.9427146, 2.712446, 1, 0, 0.8509804, 1,
1.091477, 0.3310568, -0.1744415, 1, 0, 0.8470588, 1,
1.091481, -1.352124, 1.805357, 1, 0, 0.8392157, 1,
1.095502, 1.919908, 1.085308, 1, 0, 0.8352941, 1,
1.103897, 0.1969963, 0.405334, 1, 0, 0.827451, 1,
1.110785, -0.110446, 2.084522, 1, 0, 0.8235294, 1,
1.121513, -1.536197, 0.6416143, 1, 0, 0.8156863, 1,
1.12382, -0.2751883, 1.583163, 1, 0, 0.8117647, 1,
1.124617, -0.6197493, 1.350866, 1, 0, 0.8039216, 1,
1.135036, -1.878733, 2.723595, 1, 0, 0.7960784, 1,
1.136197, -0.06772972, 0.2546193, 1, 0, 0.7921569, 1,
1.139599, -2.476651, 3.394208, 1, 0, 0.7843137, 1,
1.14124, 0.06664889, 2.240176, 1, 0, 0.7803922, 1,
1.144749, 0.9583721, 2.171373, 1, 0, 0.772549, 1,
1.145557, 0.3913387, 1.612402, 1, 0, 0.7686275, 1,
1.157869, 0.4837755, 0.5245427, 1, 0, 0.7607843, 1,
1.16144, 1.332728, 1.715494, 1, 0, 0.7568628, 1,
1.165118, -1.303493, 0.8626994, 1, 0, 0.7490196, 1,
1.166156, -0.6898102, 2.222457, 1, 0, 0.7450981, 1,
1.167069, -0.2510314, 1.069409, 1, 0, 0.7372549, 1,
1.168314, -0.5859002, 2.49673, 1, 0, 0.7333333, 1,
1.168677, 0.3901349, 1.598862, 1, 0, 0.7254902, 1,
1.180706, -0.9525959, 2.082621, 1, 0, 0.7215686, 1,
1.184362, 0.5583984, -0.5622154, 1, 0, 0.7137255, 1,
1.190161, -0.09541421, 1.890199, 1, 0, 0.7098039, 1,
1.195598, -0.3232251, 0.6677265, 1, 0, 0.7019608, 1,
1.209479, -1.064088, 2.603333, 1, 0, 0.6941177, 1,
1.216127, -0.4354457, 2.017064, 1, 0, 0.6901961, 1,
1.21904, 2.212624, -0.8819481, 1, 0, 0.682353, 1,
1.222502, 0.911254, 0.4949426, 1, 0, 0.6784314, 1,
1.223585, -1.416037, 4.912098, 1, 0, 0.6705883, 1,
1.237076, 2.171689, 1.465011, 1, 0, 0.6666667, 1,
1.243823, 0.6422673, 1.25558, 1, 0, 0.6588235, 1,
1.247627, 0.692497, -0.01528508, 1, 0, 0.654902, 1,
1.25089, -0.8636333, 2.04756, 1, 0, 0.6470588, 1,
1.251716, -0.7314485, 1.78583, 1, 0, 0.6431373, 1,
1.252099, 0.1202216, 2.628727, 1, 0, 0.6352941, 1,
1.257399, 0.4852588, -0.4990611, 1, 0, 0.6313726, 1,
1.258497, -3.012978, 1.42364, 1, 0, 0.6235294, 1,
1.269423, -1.076669, 3.921252, 1, 0, 0.6196079, 1,
1.270068, -0.8273679, 1.897252, 1, 0, 0.6117647, 1,
1.270823, 0.5042166, 0.8981803, 1, 0, 0.6078432, 1,
1.278765, 1.349116, 0.4651416, 1, 0, 0.6, 1,
1.279449, 0.3388392, 2.302937, 1, 0, 0.5921569, 1,
1.296698, 1.835998, -0.4855449, 1, 0, 0.5882353, 1,
1.298546, -0.5087581, 0.6345122, 1, 0, 0.5803922, 1,
1.311449, -1.125957, 1.918058, 1, 0, 0.5764706, 1,
1.312032, 0.112202, 0.7365448, 1, 0, 0.5686275, 1,
1.315409, 1.761242, 0.2420232, 1, 0, 0.5647059, 1,
1.317573, 0.1009777, 1.351164, 1, 0, 0.5568628, 1,
1.329795, 0.9972128, 0.5041897, 1, 0, 0.5529412, 1,
1.332979, 1.174847, 2.254651, 1, 0, 0.5450981, 1,
1.333642, 0.3283836, 0.3787304, 1, 0, 0.5411765, 1,
1.339484, 0.6436496, 0.8418378, 1, 0, 0.5333334, 1,
1.353338, 1.523571, 0.6681091, 1, 0, 0.5294118, 1,
1.368383, -0.3678672, 1.515805, 1, 0, 0.5215687, 1,
1.382019, 0.4179314, 1.876787, 1, 0, 0.5176471, 1,
1.386964, -1.655206, 2.329867, 1, 0, 0.509804, 1,
1.390163, 1.173275, 0.7215095, 1, 0, 0.5058824, 1,
1.392833, -1.487728, 2.752973, 1, 0, 0.4980392, 1,
1.394914, -0.9775058, 1.849752, 1, 0, 0.4901961, 1,
1.403919, 0.1582483, 2.593561, 1, 0, 0.4862745, 1,
1.404736, -1.207817, 3.505449, 1, 0, 0.4784314, 1,
1.405243, -0.3198908, 1.143516, 1, 0, 0.4745098, 1,
1.405645, 1.088401, 0.3318988, 1, 0, 0.4666667, 1,
1.406916, -0.2540729, 0.73638, 1, 0, 0.4627451, 1,
1.407199, -1.557562, 2.70773, 1, 0, 0.454902, 1,
1.408093, -2.234445, 1.077847, 1, 0, 0.4509804, 1,
1.410301, 0.1649075, 1.837298, 1, 0, 0.4431373, 1,
1.420943, -1.360297, 5.14327, 1, 0, 0.4392157, 1,
1.428035, 2.264161, 0.06444052, 1, 0, 0.4313726, 1,
1.430965, -1.220426, 2.194855, 1, 0, 0.427451, 1,
1.446349, -0.03781441, 0.5000333, 1, 0, 0.4196078, 1,
1.456881, -0.2547295, 0.1177721, 1, 0, 0.4156863, 1,
1.462907, 1.063595, 2.178509, 1, 0, 0.4078431, 1,
1.470019, -0.07359268, 3.290468, 1, 0, 0.4039216, 1,
1.478276, 0.4906971, 1.010117, 1, 0, 0.3960784, 1,
1.490116, -0.004043864, 1.849585, 1, 0, 0.3882353, 1,
1.500347, -0.61255, 3.39473, 1, 0, 0.3843137, 1,
1.513226, 1.322667, -1.300542, 1, 0, 0.3764706, 1,
1.523462, 1.161402, 1.305583, 1, 0, 0.372549, 1,
1.525439, 1.768262, 0.1690411, 1, 0, 0.3647059, 1,
1.54416, -1.932721, 1.14323, 1, 0, 0.3607843, 1,
1.546427, -0.8167228, 2.533736, 1, 0, 0.3529412, 1,
1.55963, 0.2421051, 1.851086, 1, 0, 0.3490196, 1,
1.563671, -0.3930996, 0.3780313, 1, 0, 0.3411765, 1,
1.568896, 0.4611807, 1.5264, 1, 0, 0.3372549, 1,
1.570716, 1.117234, 1.865131, 1, 0, 0.3294118, 1,
1.584967, 0.3455535, -0.4439401, 1, 0, 0.3254902, 1,
1.612756, 0.4854455, 0.06559066, 1, 0, 0.3176471, 1,
1.614106, -1.142041, 2.233968, 1, 0, 0.3137255, 1,
1.618029, 1.533366, 0.6076196, 1, 0, 0.3058824, 1,
1.627696, -0.07829205, 2.448263, 1, 0, 0.2980392, 1,
1.630356, -0.2275175, 3.147396, 1, 0, 0.2941177, 1,
1.634473, -0.4347162, 2.597735, 1, 0, 0.2862745, 1,
1.672277, 0.1329016, 2.386094, 1, 0, 0.282353, 1,
1.678293, -0.1522527, 1.557917, 1, 0, 0.2745098, 1,
1.692389, 0.6150324, 1.64565, 1, 0, 0.2705882, 1,
1.695362, -2.218068, 1.318649, 1, 0, 0.2627451, 1,
1.703232, 1.05598, -0.5024829, 1, 0, 0.2588235, 1,
1.703874, 0.08746239, 1.924251, 1, 0, 0.2509804, 1,
1.726589, -0.3428214, 0.9103699, 1, 0, 0.2470588, 1,
1.740186, 1.305027, 0.4872226, 1, 0, 0.2392157, 1,
1.742867, -0.296041, 1.742367, 1, 0, 0.2352941, 1,
1.782981, -0.1225891, -0.1564652, 1, 0, 0.227451, 1,
1.799043, -0.4752637, 3.542053, 1, 0, 0.2235294, 1,
1.806402, 0.3947468, 1.110298, 1, 0, 0.2156863, 1,
1.833344, 1.004425, 1.359916, 1, 0, 0.2117647, 1,
1.836127, 0.108958, 1.384952, 1, 0, 0.2039216, 1,
1.8378, -0.569845, 2.44249, 1, 0, 0.1960784, 1,
1.840101, 0.2880929, 2.904842, 1, 0, 0.1921569, 1,
1.850944, 1.530502, 2.086103, 1, 0, 0.1843137, 1,
1.852863, -0.09364314, 2.444384, 1, 0, 0.1803922, 1,
1.871025, -0.2660367, -0.2767527, 1, 0, 0.172549, 1,
1.893503, -2.28322, 2.609958, 1, 0, 0.1686275, 1,
1.897663, -0.05244505, 1.342262, 1, 0, 0.1607843, 1,
1.917023, 0.3418699, 1.11925, 1, 0, 0.1568628, 1,
1.932393, -0.01828392, 0.7192917, 1, 0, 0.1490196, 1,
1.939389, -1.247997, 1.487288, 1, 0, 0.145098, 1,
1.956733, -0.2580495, 2.407456, 1, 0, 0.1372549, 1,
1.994596, 0.2922352, 1.781071, 1, 0, 0.1333333, 1,
2.00383, 0.5316731, 2.758286, 1, 0, 0.1254902, 1,
2.004326, 0.2500931, 1.19496, 1, 0, 0.1215686, 1,
2.031667, 0.6009465, 1.409186, 1, 0, 0.1137255, 1,
2.056174, 1.104846, -0.1247411, 1, 0, 0.1098039, 1,
2.066808, 2.136693, -1.446716, 1, 0, 0.1019608, 1,
2.085658, 0.4891332, 2.022112, 1, 0, 0.09411765, 1,
2.098917, -0.9964935, 2.835967, 1, 0, 0.09019608, 1,
2.285408, -0.5364052, 0.6285028, 1, 0, 0.08235294, 1,
2.325114, -1.419118, 0.5885568, 1, 0, 0.07843138, 1,
2.371256, -0.5753292, 1.618247, 1, 0, 0.07058824, 1,
2.436523, -0.9135278, 1.306673, 1, 0, 0.06666667, 1,
2.451062, -0.7086498, 0.8302989, 1, 0, 0.05882353, 1,
2.453151, 2.134773, 3.171129, 1, 0, 0.05490196, 1,
2.617175, 0.2522086, 0.827672, 1, 0, 0.04705882, 1,
2.719959, 1.744311, 0.8947447, 1, 0, 0.04313726, 1,
2.906765, 2.003552, 1.989556, 1, 0, 0.03529412, 1,
2.917544, -0.5927207, 1.53523, 1, 0, 0.03137255, 1,
3.012267, 0.438462, 2.370097, 1, 0, 0.02352941, 1,
3.03021, -1.839834, 0.9424952, 1, 0, 0.01960784, 1,
3.057076, -0.04264598, 1.059015, 1, 0, 0.01176471, 1,
3.109694, 0.4669233, 2.673439, 1, 0, 0.007843138, 1
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
-0.25911, -4.110104, -6.956386, 0, -0.5, 0.5, 0.5,
-0.25911, -4.110104, -6.956386, 1, -0.5, 0.5, 0.5,
-0.25911, -4.110104, -6.956386, 1, 1.5, 0.5, 0.5,
-0.25911, -4.110104, -6.956386, 0, 1.5, 0.5, 0.5
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
-4.769938, 0.1235379, -6.956386, 0, -0.5, 0.5, 0.5,
-4.769938, 0.1235379, -6.956386, 1, -0.5, 0.5, 0.5,
-4.769938, 0.1235379, -6.956386, 1, 1.5, 0.5, 0.5,
-4.769938, 0.1235379, -6.956386, 0, 1.5, 0.5, 0.5
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
-4.769938, -4.110104, -0.02973413, 0, -0.5, 0.5, 0.5,
-4.769938, -4.110104, -0.02973413, 1, -0.5, 0.5, 0.5,
-4.769938, -4.110104, -0.02973413, 1, 1.5, 0.5, 0.5,
-4.769938, -4.110104, -0.02973413, 0, 1.5, 0.5, 0.5
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
-3, -3.13311, -5.357928,
3, -3.13311, -5.357928,
-3, -3.13311, -5.357928,
-3, -3.295942, -5.624338,
-2, -3.13311, -5.357928,
-2, -3.295942, -5.624338,
-1, -3.13311, -5.357928,
-1, -3.295942, -5.624338,
0, -3.13311, -5.357928,
0, -3.295942, -5.624338,
1, -3.13311, -5.357928,
1, -3.295942, -5.624338,
2, -3.13311, -5.357928,
2, -3.295942, -5.624338,
3, -3.13311, -5.357928,
3, -3.295942, -5.624338
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
-3, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
-3, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
-3, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
-3, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
-2, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
-2, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
-2, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
-2, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
-1, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
-1, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
-1, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
-1, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
0, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
0, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
0, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
0, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
1, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
1, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
1, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
1, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
2, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
2, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
2, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
2, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5,
3, -3.621607, -6.157157, 0, -0.5, 0.5, 0.5,
3, -3.621607, -6.157157, 1, -0.5, 0.5, 0.5,
3, -3.621607, -6.157157, 1, 1.5, 0.5, 0.5,
3, -3.621607, -6.157157, 0, 1.5, 0.5, 0.5
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
-3.728978, -3, -5.357928,
-3.728978, 3, -5.357928,
-3.728978, -3, -5.357928,
-3.902472, -3, -5.624338,
-3.728978, -2, -5.357928,
-3.902472, -2, -5.624338,
-3.728978, -1, -5.357928,
-3.902472, -1, -5.624338,
-3.728978, 0, -5.357928,
-3.902472, 0, -5.624338,
-3.728978, 1, -5.357928,
-3.902472, 1, -5.624338,
-3.728978, 2, -5.357928,
-3.902472, 2, -5.624338,
-3.728978, 3, -5.357928,
-3.902472, 3, -5.624338
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
-4.249458, -3, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, -3, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, -3, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, -3, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, -2, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, -2, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, -2, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, -2, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, -1, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, -1, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, -1, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, -1, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, 0, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, 0, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, 0, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, 0, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, 1, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, 1, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, 1, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, 1, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, 2, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, 2, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, 2, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, 2, -6.157157, 0, 1.5, 0.5, 0.5,
-4.249458, 3, -6.157157, 0, -0.5, 0.5, 0.5,
-4.249458, 3, -6.157157, 1, -0.5, 0.5, 0.5,
-4.249458, 3, -6.157157, 1, 1.5, 0.5, 0.5,
-4.249458, 3, -6.157157, 0, 1.5, 0.5, 0.5
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
-3.728978, -3.13311, -4,
-3.728978, -3.13311, 4,
-3.728978, -3.13311, -4,
-3.902472, -3.295942, -4,
-3.728978, -3.13311, -2,
-3.902472, -3.295942, -2,
-3.728978, -3.13311, 0,
-3.902472, -3.295942, 0,
-3.728978, -3.13311, 2,
-3.902472, -3.295942, 2,
-3.728978, -3.13311, 4,
-3.902472, -3.295942, 4
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
-4.249458, -3.621607, -4, 0, -0.5, 0.5, 0.5,
-4.249458, -3.621607, -4, 1, -0.5, 0.5, 0.5,
-4.249458, -3.621607, -4, 1, 1.5, 0.5, 0.5,
-4.249458, -3.621607, -4, 0, 1.5, 0.5, 0.5,
-4.249458, -3.621607, -2, 0, -0.5, 0.5, 0.5,
-4.249458, -3.621607, -2, 1, -0.5, 0.5, 0.5,
-4.249458, -3.621607, -2, 1, 1.5, 0.5, 0.5,
-4.249458, -3.621607, -2, 0, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 0, 0, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 0, 1, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 0, 1, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 0, 0, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 2, 0, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 2, 1, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 2, 1, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 2, 0, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 4, 0, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 4, 1, -0.5, 0.5, 0.5,
-4.249458, -3.621607, 4, 1, 1.5, 0.5, 0.5,
-4.249458, -3.621607, 4, 0, 1.5, 0.5, 0.5
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
-3.728978, -3.13311, -5.357928,
-3.728978, 3.380185, -5.357928,
-3.728978, -3.13311, 5.29846,
-3.728978, 3.380185, 5.29846,
-3.728978, -3.13311, -5.357928,
-3.728978, -3.13311, 5.29846,
-3.728978, 3.380185, -5.357928,
-3.728978, 3.380185, 5.29846,
-3.728978, -3.13311, -5.357928,
3.210758, -3.13311, -5.357928,
-3.728978, -3.13311, 5.29846,
3.210758, -3.13311, 5.29846,
-3.728978, 3.380185, -5.357928,
3.210758, 3.380185, -5.357928,
-3.728978, 3.380185, 5.29846,
3.210758, 3.380185, 5.29846,
3.210758, -3.13311, -5.357928,
3.210758, 3.380185, -5.357928,
3.210758, -3.13311, 5.29846,
3.210758, 3.380185, 5.29846,
3.210758, -3.13311, -5.357928,
3.210758, -3.13311, 5.29846,
3.210758, 3.380185, -5.357928,
3.210758, 3.380185, 5.29846
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
var radius = 7.629414;
var distance = 33.94412;
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
mvMatrix.translate( 0.25911, -0.1235379, 0.02973413 );
mvMatrix.scale( 1.188672, 1.266497, 0.7740964 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94412);
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


