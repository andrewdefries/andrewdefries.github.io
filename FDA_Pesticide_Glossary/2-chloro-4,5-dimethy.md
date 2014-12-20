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
-3.053387, 1.666491, -2.40239, 1, 0, 0, 1,
-2.912519, 1.376274, -1.706577, 1, 0.007843138, 0, 1,
-2.877998, -0.8726364, -1.691011, 1, 0.01176471, 0, 1,
-2.761324, 0.4198203, -2.073712, 1, 0.01960784, 0, 1,
-2.758327, 0.2021493, -2.303216, 1, 0.02352941, 0, 1,
-2.704702, 0.1154865, 0.08986983, 1, 0.03137255, 0, 1,
-2.53275, 0.2237268, -1.480053, 1, 0.03529412, 0, 1,
-2.511753, -1.304824, -0.8608039, 1, 0.04313726, 0, 1,
-2.490429, 0.7848152, 0.6707265, 1, 0.04705882, 0, 1,
-2.457588, 0.296732, -1.453492, 1, 0.05490196, 0, 1,
-2.394889, 0.3812779, -2.18029, 1, 0.05882353, 0, 1,
-2.338335, 0.8701555, -1.934064, 1, 0.06666667, 0, 1,
-2.277437, 0.1596105, -3.077454, 1, 0.07058824, 0, 1,
-2.22974, 2.133608, 0.1583119, 1, 0.07843138, 0, 1,
-2.219499, 0.990383, -1.375427, 1, 0.08235294, 0, 1,
-2.146654, 0.4796409, -1.738946, 1, 0.09019608, 0, 1,
-2.136298, 0.3194204, -1.033799, 1, 0.09411765, 0, 1,
-2.107537, 0.8489213, 0.3083266, 1, 0.1019608, 0, 1,
-2.088887, 1.974301, -1.211727, 1, 0.1098039, 0, 1,
-2.068189, 1.031726, -1.029211, 1, 0.1137255, 0, 1,
-2.042981, -0.344297, -1.031033, 1, 0.1215686, 0, 1,
-2.018047, -0.02130208, -1.447683, 1, 0.1254902, 0, 1,
-2.013096, 0.8870374, 0.4141557, 1, 0.1333333, 0, 1,
-2.001924, 1.198212, -2.397355, 1, 0.1372549, 0, 1,
-1.987492, -1.57364, -3.01935, 1, 0.145098, 0, 1,
-1.947176, 0.5935627, -0.4808694, 1, 0.1490196, 0, 1,
-1.940919, -0.2870771, -3.449734, 1, 0.1568628, 0, 1,
-1.933176, -1.075854, -2.507994, 1, 0.1607843, 0, 1,
-1.927734, 0.2384455, -0.003251998, 1, 0.1686275, 0, 1,
-1.917508, 0.2063857, -0.1092153, 1, 0.172549, 0, 1,
-1.901911, -0.1124028, -1.069874, 1, 0.1803922, 0, 1,
-1.889982, -1.033812, -2.373076, 1, 0.1843137, 0, 1,
-1.87326, 0.1382877, -1.826858, 1, 0.1921569, 0, 1,
-1.846572, -0.3277639, -2.142956, 1, 0.1960784, 0, 1,
-1.839286, 0.430305, -3.555729, 1, 0.2039216, 0, 1,
-1.831461, -0.1490154, -2.113645, 1, 0.2117647, 0, 1,
-1.800424, 0.1458754, -0.3423291, 1, 0.2156863, 0, 1,
-1.793921, 1.982671, 0.5129945, 1, 0.2235294, 0, 1,
-1.782865, -1.237009, -2.67069, 1, 0.227451, 0, 1,
-1.769955, 0.4008685, -2.326298, 1, 0.2352941, 0, 1,
-1.769346, -0.4011662, -2.816434, 1, 0.2392157, 0, 1,
-1.765371, 0.5791487, -1.559758, 1, 0.2470588, 0, 1,
-1.754831, -1.230882, -2.060635, 1, 0.2509804, 0, 1,
-1.741695, 1.843875, -0.08307265, 1, 0.2588235, 0, 1,
-1.72784, -0.268531, -1.270705, 1, 0.2627451, 0, 1,
-1.727569, 0.1911808, -2.795084, 1, 0.2705882, 0, 1,
-1.726887, -2.244303, -1.938261, 1, 0.2745098, 0, 1,
-1.717825, 0.5623223, -0.7279626, 1, 0.282353, 0, 1,
-1.715711, -0.635645, -0.9919572, 1, 0.2862745, 0, 1,
-1.68925, 0.2543386, -1.453251, 1, 0.2941177, 0, 1,
-1.68826, -0.1591508, -1.964698, 1, 0.3019608, 0, 1,
-1.664651, 0.6843914, -2.643974, 1, 0.3058824, 0, 1,
-1.657174, 1.032153, -2.291581, 1, 0.3137255, 0, 1,
-1.643733, 0.6310221, -0.4512975, 1, 0.3176471, 0, 1,
-1.64186, 0.9599113, -0.242543, 1, 0.3254902, 0, 1,
-1.637322, 0.5388105, -1.727307, 1, 0.3294118, 0, 1,
-1.632438, -2.20996, -3.375709, 1, 0.3372549, 0, 1,
-1.626549, 0.5629997, 1.276473, 1, 0.3411765, 0, 1,
-1.61816, 0.8072332, 1.115172, 1, 0.3490196, 0, 1,
-1.616771, -1.593352, -4.474225, 1, 0.3529412, 0, 1,
-1.615571, 1.293167, -3.427345, 1, 0.3607843, 0, 1,
-1.575665, 0.1004841, -0.7956471, 1, 0.3647059, 0, 1,
-1.566885, 0.468263, 0.6265336, 1, 0.372549, 0, 1,
-1.551096, -0.9854472, -1.313054, 1, 0.3764706, 0, 1,
-1.545895, 0.196862, -2.240323, 1, 0.3843137, 0, 1,
-1.508349, -2.606966, -2.477024, 1, 0.3882353, 0, 1,
-1.505954, -1.504261, -3.524378, 1, 0.3960784, 0, 1,
-1.489604, -0.1462824, -1.406908, 1, 0.4039216, 0, 1,
-1.486472, -0.7119172, -3.074371, 1, 0.4078431, 0, 1,
-1.484396, 0.9030584, -2.127104, 1, 0.4156863, 0, 1,
-1.473921, 0.1605087, -2.297744, 1, 0.4196078, 0, 1,
-1.468936, -1.373797, -1.842929, 1, 0.427451, 0, 1,
-1.463411, 0.01513967, -1.056106, 1, 0.4313726, 0, 1,
-1.451805, 2.21536, -0.5962812, 1, 0.4392157, 0, 1,
-1.421329, 0.2231392, -2.042137, 1, 0.4431373, 0, 1,
-1.419528, 2.268416, 0.8153026, 1, 0.4509804, 0, 1,
-1.409963, -0.3350208, -1.779519, 1, 0.454902, 0, 1,
-1.395761, 0.2884654, -1.279123, 1, 0.4627451, 0, 1,
-1.390057, 0.07064352, -0.6570252, 1, 0.4666667, 0, 1,
-1.380357, -0.1217735, -1.068615, 1, 0.4745098, 0, 1,
-1.38, -2.209647, -2.625647, 1, 0.4784314, 0, 1,
-1.364264, -1.324423, -2.054072, 1, 0.4862745, 0, 1,
-1.364025, 1.455763, 0.1072466, 1, 0.4901961, 0, 1,
-1.363724, -2.244254, -1.218168, 1, 0.4980392, 0, 1,
-1.359192, -0.5973336, -0.8737764, 1, 0.5058824, 0, 1,
-1.357625, -1.621685, -1.068191, 1, 0.509804, 0, 1,
-1.350733, -1.166007, -2.717509, 1, 0.5176471, 0, 1,
-1.34436, -1.496888, -2.609191, 1, 0.5215687, 0, 1,
-1.344019, 2.056425, 0.2395953, 1, 0.5294118, 0, 1,
-1.343848, -0.1671344, -0.7477295, 1, 0.5333334, 0, 1,
-1.334818, -0.1511411, -0.9895947, 1, 0.5411765, 0, 1,
-1.329113, -1.457702, -3.091723, 1, 0.5450981, 0, 1,
-1.326016, -0.2371499, -1.43752, 1, 0.5529412, 0, 1,
-1.311822, 0.1633657, -1.940869, 1, 0.5568628, 0, 1,
-1.311778, -1.169973, -1.732761, 1, 0.5647059, 0, 1,
-1.293701, -2.087564, -3.426427, 1, 0.5686275, 0, 1,
-1.293114, 0.6348922, -0.2149548, 1, 0.5764706, 0, 1,
-1.263105, 0.3576477, -2.014569, 1, 0.5803922, 0, 1,
-1.262957, 0.7028953, -1.846263, 1, 0.5882353, 0, 1,
-1.246947, 2.055586, 0.2139741, 1, 0.5921569, 0, 1,
-1.245054, -0.02820563, -2.541685, 1, 0.6, 0, 1,
-1.241381, 0.2644138, -3.129313, 1, 0.6078432, 0, 1,
-1.238241, -1.989085, -2.932666, 1, 0.6117647, 0, 1,
-1.219884, 0.8343904, -0.8603616, 1, 0.6196079, 0, 1,
-1.21974, 1.701942, 0.5648453, 1, 0.6235294, 0, 1,
-1.215746, 1.085108, -2.058901, 1, 0.6313726, 0, 1,
-1.215116, 0.7577254, -0.4305913, 1, 0.6352941, 0, 1,
-1.196856, -0.07834081, -2.688254, 1, 0.6431373, 0, 1,
-1.194998, 0.8011458, -1.850856, 1, 0.6470588, 0, 1,
-1.187209, -0.2486542, -1.643637, 1, 0.654902, 0, 1,
-1.185632, -0.4550264, -2.257006, 1, 0.6588235, 0, 1,
-1.183682, -0.39172, -0.8836449, 1, 0.6666667, 0, 1,
-1.182247, 0.3379298, -0.6003169, 1, 0.6705883, 0, 1,
-1.174334, -0.07550932, -2.69343, 1, 0.6784314, 0, 1,
-1.161761, -0.499189, 0.320475, 1, 0.682353, 0, 1,
-1.160547, 0.6871575, -2.138833, 1, 0.6901961, 0, 1,
-1.157484, -0.6043115, -1.340112, 1, 0.6941177, 0, 1,
-1.15616, 0.595076, -2.898098, 1, 0.7019608, 0, 1,
-1.154886, -0.6827245, -2.628091, 1, 0.7098039, 0, 1,
-1.154848, -0.2342649, -3.165379, 1, 0.7137255, 0, 1,
-1.154052, -1.123137, -2.831924, 1, 0.7215686, 0, 1,
-1.152083, -0.8562381, -2.325852, 1, 0.7254902, 0, 1,
-1.151978, -0.4702535, -0.007083327, 1, 0.7333333, 0, 1,
-1.143251, -0.09516119, -3.546184, 1, 0.7372549, 0, 1,
-1.140305, 0.89566, -0.6078944, 1, 0.7450981, 0, 1,
-1.129752, -0.2128956, 0.2059535, 1, 0.7490196, 0, 1,
-1.118855, 2.220544, -1.393564, 1, 0.7568628, 0, 1,
-1.111884, 0.420807, -1.763333, 1, 0.7607843, 0, 1,
-1.107431, -1.369817, -1.71132, 1, 0.7686275, 0, 1,
-1.105555, 0.420368, -0.2039726, 1, 0.772549, 0, 1,
-1.103723, -0.09346538, -2.037092, 1, 0.7803922, 0, 1,
-1.100905, -0.7199122, -2.684165, 1, 0.7843137, 0, 1,
-1.098941, 1.144933, 1.007365, 1, 0.7921569, 0, 1,
-1.098637, 0.2241045, -1.246844, 1, 0.7960784, 0, 1,
-1.096419, -1.264372, -3.621166, 1, 0.8039216, 0, 1,
-1.091929, -1.281805, -0.7987703, 1, 0.8117647, 0, 1,
-1.089686, -2.784476, -3.650808, 1, 0.8156863, 0, 1,
-1.078811, -1.311577, -1.819115, 1, 0.8235294, 0, 1,
-1.07548, 0.5895579, -2.703304, 1, 0.827451, 0, 1,
-1.071308, -0.05997485, -1.926903, 1, 0.8352941, 0, 1,
-1.067119, 1.440752, -0.1441059, 1, 0.8392157, 0, 1,
-1.064794, -0.7818041, -3.140471, 1, 0.8470588, 0, 1,
-1.063775, 0.3202253, -1.020986, 1, 0.8509804, 0, 1,
-1.060914, 0.4078798, -2.123356, 1, 0.8588235, 0, 1,
-1.045898, -0.05301914, -3.589772, 1, 0.8627451, 0, 1,
-1.028155, -2.15719, -2.102403, 1, 0.8705882, 0, 1,
-1.009569, 0.1861822, -1.776436, 1, 0.8745098, 0, 1,
-0.9909621, 1.071812, 0.2378793, 1, 0.8823529, 0, 1,
-0.9849905, 0.07873444, -1.389063, 1, 0.8862745, 0, 1,
-0.9813149, 1.784607, 0.5104614, 1, 0.8941177, 0, 1,
-0.9781492, -0.6789458, -2.928262, 1, 0.8980392, 0, 1,
-0.9773242, 0.2337783, 0.09104602, 1, 0.9058824, 0, 1,
-0.9751834, 0.3851087, -2.02585, 1, 0.9137255, 0, 1,
-0.9723285, -0.5793902, -2.170131, 1, 0.9176471, 0, 1,
-0.9626056, -0.9030746, -1.332621, 1, 0.9254902, 0, 1,
-0.9619007, 0.1447977, -1.490528, 1, 0.9294118, 0, 1,
-0.9552078, -0.02179112, -2.476737, 1, 0.9372549, 0, 1,
-0.9504269, -0.6840863, -0.2300169, 1, 0.9411765, 0, 1,
-0.941572, 0.8997196, 0.09086858, 1, 0.9490196, 0, 1,
-0.9370108, -1.636625, -1.742015, 1, 0.9529412, 0, 1,
-0.9364138, -0.1567792, -0.2315375, 1, 0.9607843, 0, 1,
-0.9326937, 0.9604923, -2.407784, 1, 0.9647059, 0, 1,
-0.9302094, -2.048438, -2.970491, 1, 0.972549, 0, 1,
-0.9294273, -1.276771, -2.44956, 1, 0.9764706, 0, 1,
-0.9250099, -1.516121, -2.427746, 1, 0.9843137, 0, 1,
-0.9236836, -0.1855087, -1.061275, 1, 0.9882353, 0, 1,
-0.9236403, 0.861141, 0.2572646, 1, 0.9960784, 0, 1,
-0.9226715, 1.842126, -1.497241, 0.9960784, 1, 0, 1,
-0.9200803, 1.659889, -1.963298, 0.9921569, 1, 0, 1,
-0.91889, 1.077895, -1.623886, 0.9843137, 1, 0, 1,
-0.9156911, -0.455189, -2.922533, 0.9803922, 1, 0, 1,
-0.9147838, -1.099896, -1.89905, 0.972549, 1, 0, 1,
-0.9147812, -0.009392887, -2.054952, 0.9686275, 1, 0, 1,
-0.9005722, -0.05220642, 0.1707719, 0.9607843, 1, 0, 1,
-0.9000006, 0.3092291, -0.5425199, 0.9568627, 1, 0, 1,
-0.8982407, 0.7094133, -1.535609, 0.9490196, 1, 0, 1,
-0.8935204, 1.101898, -1.767136, 0.945098, 1, 0, 1,
-0.8915321, -0.5330065, -1.265277, 0.9372549, 1, 0, 1,
-0.8890781, 0.2353445, -1.214088, 0.9333333, 1, 0, 1,
-0.8837076, 0.1793674, 1.00433, 0.9254902, 1, 0, 1,
-0.876384, 0.2568005, -1.317742, 0.9215686, 1, 0, 1,
-0.8728465, -0.5426708, -3.046944, 0.9137255, 1, 0, 1,
-0.8697801, 0.6627885, -0.1360408, 0.9098039, 1, 0, 1,
-0.8668466, 0.5336763, -1.147667, 0.9019608, 1, 0, 1,
-0.8651151, 1.666826, -0.1679751, 0.8941177, 1, 0, 1,
-0.8587923, -1.399669, -3.895398, 0.8901961, 1, 0, 1,
-0.8563461, 0.06502056, -2.162974, 0.8823529, 1, 0, 1,
-0.8542724, -1.1037, -3.788488, 0.8784314, 1, 0, 1,
-0.8460484, 0.8318151, -0.2873029, 0.8705882, 1, 0, 1,
-0.8449399, -0.3231886, -2.893684, 0.8666667, 1, 0, 1,
-0.844641, 0.1327023, -1.671927, 0.8588235, 1, 0, 1,
-0.8426356, 0.9271392, -1.2613, 0.854902, 1, 0, 1,
-0.8419698, -0.853775, -3.322636, 0.8470588, 1, 0, 1,
-0.8393327, 1.201941, 0.1063862, 0.8431373, 1, 0, 1,
-0.8367864, 1.132752, -1.693228, 0.8352941, 1, 0, 1,
-0.8340843, -0.5855122, -3.452808, 0.8313726, 1, 0, 1,
-0.8283485, -0.6258106, -3.243236, 0.8235294, 1, 0, 1,
-0.8256776, 1.22546, -1.81843, 0.8196079, 1, 0, 1,
-0.8242537, -1.697762, -3.242575, 0.8117647, 1, 0, 1,
-0.8227234, -1.189696, -2.439106, 0.8078431, 1, 0, 1,
-0.8224527, -0.9972835, -2.549666, 0.8, 1, 0, 1,
-0.8206114, -0.8251702, -2.138625, 0.7921569, 1, 0, 1,
-0.8199744, 0.2364678, -1.554216, 0.7882353, 1, 0, 1,
-0.8148555, -0.6843576, -2.648374, 0.7803922, 1, 0, 1,
-0.8142365, 0.4503603, -0.2125612, 0.7764706, 1, 0, 1,
-0.8134285, -0.4585409, -2.369458, 0.7686275, 1, 0, 1,
-0.81086, 1.166112, -0.4193963, 0.7647059, 1, 0, 1,
-0.809652, 0.8429277, -0.3365088, 0.7568628, 1, 0, 1,
-0.8058672, -0.07004089, -1.369525, 0.7529412, 1, 0, 1,
-0.8048567, 0.4825567, -1.864416, 0.7450981, 1, 0, 1,
-0.7972105, -0.4019682, -2.76284, 0.7411765, 1, 0, 1,
-0.7912694, 0.4269263, -4.281925, 0.7333333, 1, 0, 1,
-0.7876077, -0.02212518, -1.589473, 0.7294118, 1, 0, 1,
-0.7848844, -1.14878, -2.184556, 0.7215686, 1, 0, 1,
-0.7731478, -0.8457149, -2.057975, 0.7176471, 1, 0, 1,
-0.7684548, 1.730731, -0.6442478, 0.7098039, 1, 0, 1,
-0.7614673, 0.4158805, -0.2946883, 0.7058824, 1, 0, 1,
-0.759973, -2.091078, -1.58249, 0.6980392, 1, 0, 1,
-0.7599071, -0.7426054, -0.8091317, 0.6901961, 1, 0, 1,
-0.7552124, -1.435307, -2.643774, 0.6862745, 1, 0, 1,
-0.7537732, 1.644477, -1.239964, 0.6784314, 1, 0, 1,
-0.7505364, -1.854473, -2.120018, 0.6745098, 1, 0, 1,
-0.7479217, 0.3348989, 0.1417313, 0.6666667, 1, 0, 1,
-0.7473304, -0.9114184, -1.543728, 0.6627451, 1, 0, 1,
-0.7307594, 0.7049749, -0.9874257, 0.654902, 1, 0, 1,
-0.7290258, 1.476911, 0.6596219, 0.6509804, 1, 0, 1,
-0.7283557, 0.2737928, -2.510994, 0.6431373, 1, 0, 1,
-0.726642, 0.3741635, -1.214218, 0.6392157, 1, 0, 1,
-0.7230445, 0.5586652, -0.6221563, 0.6313726, 1, 0, 1,
-0.7208078, 1.806316, 0.2629053, 0.627451, 1, 0, 1,
-0.7132115, 0.4315861, 0.3376047, 0.6196079, 1, 0, 1,
-0.7129647, -1.592095, -4.784953, 0.6156863, 1, 0, 1,
-0.7106269, 0.231146, -0.9464779, 0.6078432, 1, 0, 1,
-0.7080272, 1.990009, 0.6159765, 0.6039216, 1, 0, 1,
-0.7065422, -0.4632, -1.735595, 0.5960785, 1, 0, 1,
-0.7040486, 1.196757, -0.2388178, 0.5882353, 1, 0, 1,
-0.6906308, -0.3053957, -1.137232, 0.5843138, 1, 0, 1,
-0.6840574, -1.092725, -4.492225, 0.5764706, 1, 0, 1,
-0.681311, -1.006145, -2.192294, 0.572549, 1, 0, 1,
-0.6812932, 0.3560002, -0.5943386, 0.5647059, 1, 0, 1,
-0.6787202, 0.2090236, -1.691564, 0.5607843, 1, 0, 1,
-0.6697931, -0.8210198, 0.05971016, 0.5529412, 1, 0, 1,
-0.66646, -1.222313, -1.616215, 0.5490196, 1, 0, 1,
-0.6618316, 0.8684971, -0.2332483, 0.5411765, 1, 0, 1,
-0.6562549, -0.9853948, -3.455902, 0.5372549, 1, 0, 1,
-0.6497375, 0.460868, -1.959011, 0.5294118, 1, 0, 1,
-0.6460089, -0.4658158, -2.270016, 0.5254902, 1, 0, 1,
-0.6443076, 2.441381, -1.336957, 0.5176471, 1, 0, 1,
-0.642364, -0.726549, -1.604839, 0.5137255, 1, 0, 1,
-0.6387612, 1.752276, -1.420769, 0.5058824, 1, 0, 1,
-0.6319183, -0.5909708, -3.287223, 0.5019608, 1, 0, 1,
-0.6315755, -2.088385, -2.18046, 0.4941176, 1, 0, 1,
-0.6312072, 0.7053971, -1.914882, 0.4862745, 1, 0, 1,
-0.6302426, 0.6944767, -0.7982869, 0.4823529, 1, 0, 1,
-0.628651, -0.1906411, -1.441622, 0.4745098, 1, 0, 1,
-0.6255265, 0.0304142, -2.952839, 0.4705882, 1, 0, 1,
-0.6240146, -0.8404466, -1.218451, 0.4627451, 1, 0, 1,
-0.6230317, -1.673221, -3.926585, 0.4588235, 1, 0, 1,
-0.6202759, -0.06100547, -0.375747, 0.4509804, 1, 0, 1,
-0.6182662, 1.809478, -1.581144, 0.4470588, 1, 0, 1,
-0.6089859, 1.685228, -0.2482114, 0.4392157, 1, 0, 1,
-0.6076755, 0.3280577, -1.968625, 0.4352941, 1, 0, 1,
-0.5996425, 0.3729784, -0.8759719, 0.427451, 1, 0, 1,
-0.5994357, -2.665194, -3.360417, 0.4235294, 1, 0, 1,
-0.5991011, 0.7040231, -1.605865, 0.4156863, 1, 0, 1,
-0.5967337, -0.7308097, -2.133011, 0.4117647, 1, 0, 1,
-0.5878494, -0.6342248, -1.694845, 0.4039216, 1, 0, 1,
-0.5868437, 0.1639802, -0.6367348, 0.3960784, 1, 0, 1,
-0.5867179, -0.2996102, -1.860414, 0.3921569, 1, 0, 1,
-0.580895, 0.7747424, -2.610279, 0.3843137, 1, 0, 1,
-0.5799429, -0.3087896, -1.801881, 0.3803922, 1, 0, 1,
-0.5799251, 1.606092, 0.7099233, 0.372549, 1, 0, 1,
-0.5726804, -0.896194, -2.187691, 0.3686275, 1, 0, 1,
-0.5709574, -0.2859753, -2.56269, 0.3607843, 1, 0, 1,
-0.5709348, -0.1171889, 0.03240285, 0.3568628, 1, 0, 1,
-0.5696538, 0.1984108, -1.061924, 0.3490196, 1, 0, 1,
-0.5653042, -1.787675, -4.496878, 0.345098, 1, 0, 1,
-0.5638109, -1.775214, -2.719622, 0.3372549, 1, 0, 1,
-0.5637754, 1.469543, -0.3039108, 0.3333333, 1, 0, 1,
-0.5560402, 0.670673, -0.1591841, 0.3254902, 1, 0, 1,
-0.5545099, -1.573738, -2.502021, 0.3215686, 1, 0, 1,
-0.5533474, 0.09699127, -2.238073, 0.3137255, 1, 0, 1,
-0.5530667, 1.774838, -0.8873461, 0.3098039, 1, 0, 1,
-0.5498431, 0.610079, -0.5939907, 0.3019608, 1, 0, 1,
-0.5482512, 0.6548404, -2.078426, 0.2941177, 1, 0, 1,
-0.545005, 0.6767214, -0.7695919, 0.2901961, 1, 0, 1,
-0.5421595, -0.03777333, -4.537027, 0.282353, 1, 0, 1,
-0.5331382, 0.8471195, 0.5901364, 0.2784314, 1, 0, 1,
-0.5322044, -0.5238317, -1.471845, 0.2705882, 1, 0, 1,
-0.5312364, 1.118051, -2.721197, 0.2666667, 1, 0, 1,
-0.530668, 1.099853, -0.4472696, 0.2588235, 1, 0, 1,
-0.5302853, -0.6994018, -3.788924, 0.254902, 1, 0, 1,
-0.5298182, 0.9399482, -1.345449, 0.2470588, 1, 0, 1,
-0.5208796, -1.150251, -1.784116, 0.2431373, 1, 0, 1,
-0.5195512, 0.1112877, -1.195383, 0.2352941, 1, 0, 1,
-0.5157318, 1.348884, -1.096108, 0.2313726, 1, 0, 1,
-0.5131962, -1.060281, -3.730122, 0.2235294, 1, 0, 1,
-0.5127841, 0.5663322, 0.04016025, 0.2196078, 1, 0, 1,
-0.5123034, -0.4071701, -0.3546431, 0.2117647, 1, 0, 1,
-0.5118038, 0.7804119, -1.336218, 0.2078431, 1, 0, 1,
-0.5114955, -0.03683648, -0.9420117, 0.2, 1, 0, 1,
-0.5090217, 1.532252, -0.6668541, 0.1921569, 1, 0, 1,
-0.5086104, 0.2650211, -1.839243, 0.1882353, 1, 0, 1,
-0.5084379, 0.03592981, -1.107034, 0.1803922, 1, 0, 1,
-0.506946, -0.7543605, -2.028006, 0.1764706, 1, 0, 1,
-0.5035422, -0.119382, -3.539661, 0.1686275, 1, 0, 1,
-0.5023558, 0.3341305, -0.09560356, 0.1647059, 1, 0, 1,
-0.5023027, -1.383436, -2.162454, 0.1568628, 1, 0, 1,
-0.5002993, -2.085189, -4.31538, 0.1529412, 1, 0, 1,
-0.5002254, 2.347359, -0.5099883, 0.145098, 1, 0, 1,
-0.4996822, 1.389289, 2.424655, 0.1411765, 1, 0, 1,
-0.4969699, 1.244379, -1.519824, 0.1333333, 1, 0, 1,
-0.4957253, 2.135366, -1.216169, 0.1294118, 1, 0, 1,
-0.4942895, -1.840909, -1.249439, 0.1215686, 1, 0, 1,
-0.4822931, -1.521224, -3.675794, 0.1176471, 1, 0, 1,
-0.4810807, -2.199448, -2.613508, 0.1098039, 1, 0, 1,
-0.4761885, -0.1947506, -0.9812138, 0.1058824, 1, 0, 1,
-0.4759444, 0.4033758, -0.930688, 0.09803922, 1, 0, 1,
-0.4749757, -0.3793023, -2.462582, 0.09019608, 1, 0, 1,
-0.4744624, -0.8570534, -2.523951, 0.08627451, 1, 0, 1,
-0.4661699, 0.6349697, 0.5006517, 0.07843138, 1, 0, 1,
-0.4658377, 0.9422442, -0.7246122, 0.07450981, 1, 0, 1,
-0.4649902, 0.3113462, 0.03265422, 0.06666667, 1, 0, 1,
-0.4617504, 1.033468, -1.523992, 0.0627451, 1, 0, 1,
-0.4590852, -1.284872, -1.457234, 0.05490196, 1, 0, 1,
-0.4583206, 0.7962683, 0.4191012, 0.05098039, 1, 0, 1,
-0.4570273, -0.5314746, -2.119432, 0.04313726, 1, 0, 1,
-0.4529825, -0.4644179, -1.735087, 0.03921569, 1, 0, 1,
-0.4528784, -1.135303, -3.290688, 0.03137255, 1, 0, 1,
-0.4500058, 0.904572, -2.119175, 0.02745098, 1, 0, 1,
-0.4439602, 0.5986407, 0.2225657, 0.01960784, 1, 0, 1,
-0.4327144, 0.9509681, 0.2978584, 0.01568628, 1, 0, 1,
-0.4278606, 1.684257, -0.123985, 0.007843138, 1, 0, 1,
-0.4198878, 0.9817251, -0.2210274, 0.003921569, 1, 0, 1,
-0.4175238, 0.3851657, -1.567645, 0, 1, 0.003921569, 1,
-0.4065584, 1.26217, 0.09045722, 0, 1, 0.01176471, 1,
-0.4000545, -0.8083926, -2.039181, 0, 1, 0.01568628, 1,
-0.39887, -0.08373366, -2.648489, 0, 1, 0.02352941, 1,
-0.3984188, 0.05644245, -0.6158204, 0, 1, 0.02745098, 1,
-0.3952904, -0.6315137, -2.465707, 0, 1, 0.03529412, 1,
-0.3937322, 0.7582624, 0.8473779, 0, 1, 0.03921569, 1,
-0.3861809, -0.5498312, -3.883295, 0, 1, 0.04705882, 1,
-0.3846431, 1.058899, -0.6697758, 0, 1, 0.05098039, 1,
-0.3799061, -1.325061, -4.103008, 0, 1, 0.05882353, 1,
-0.3796966, 0.2037263, -2.978691, 0, 1, 0.0627451, 1,
-0.377604, -1.74641, -3.147988, 0, 1, 0.07058824, 1,
-0.3754436, 0.7516644, 1.712649, 0, 1, 0.07450981, 1,
-0.3692188, 1.115256, -0.2196493, 0, 1, 0.08235294, 1,
-0.3688388, -0.6633364, -3.870436, 0, 1, 0.08627451, 1,
-0.3632618, 0.6560612, -0.09146647, 0, 1, 0.09411765, 1,
-0.3629498, -0.2738879, -1.758774, 0, 1, 0.1019608, 1,
-0.360433, 0.3463678, -1.452766, 0, 1, 0.1058824, 1,
-0.3589157, -2.080385, -2.961106, 0, 1, 0.1137255, 1,
-0.358713, -2.524311, -4.111676, 0, 1, 0.1176471, 1,
-0.3525462, -0.9652912, -2.790338, 0, 1, 0.1254902, 1,
-0.352338, -1.015066, -3.464009, 0, 1, 0.1294118, 1,
-0.3498958, 0.7397825, -0.2522246, 0, 1, 0.1372549, 1,
-0.3472254, -0.101448, -2.107807, 0, 1, 0.1411765, 1,
-0.3465867, 0.03462413, -1.685179, 0, 1, 0.1490196, 1,
-0.3456317, -0.1238062, -1.985676, 0, 1, 0.1529412, 1,
-0.3452395, 0.8458803, -0.4703715, 0, 1, 0.1607843, 1,
-0.3441846, -0.6660427, -2.255712, 0, 1, 0.1647059, 1,
-0.3414019, -0.269284, -1.466217, 0, 1, 0.172549, 1,
-0.3404938, 0.6601146, -0.2703415, 0, 1, 0.1764706, 1,
-0.3387366, 0.3520457, -2.058698, 0, 1, 0.1843137, 1,
-0.3385649, 0.3514431, -0.3949656, 0, 1, 0.1882353, 1,
-0.3337776, 0.9942291, -0.5800813, 0, 1, 0.1960784, 1,
-0.3330624, -0.09526566, -0.1992538, 0, 1, 0.2039216, 1,
-0.3308138, -0.01611556, -1.718313, 0, 1, 0.2078431, 1,
-0.3277335, 1.382114, 0.1634894, 0, 1, 0.2156863, 1,
-0.3254474, -0.3332748, -3.125773, 0, 1, 0.2196078, 1,
-0.320747, 0.4230244, -1.914927, 0, 1, 0.227451, 1,
-0.3195951, -0.2223152, -0.597867, 0, 1, 0.2313726, 1,
-0.3129362, -0.7481003, -3.73818, 0, 1, 0.2392157, 1,
-0.3103765, 0.7352034, -2.249921, 0, 1, 0.2431373, 1,
-0.3090594, -1.153677, -4.288314, 0, 1, 0.2509804, 1,
-0.3087372, 1.80366, -0.07478714, 0, 1, 0.254902, 1,
-0.3070117, 1.528859, -1.735884, 0, 1, 0.2627451, 1,
-0.3054345, 0.0704205, -1.343047, 0, 1, 0.2666667, 1,
-0.3033911, -0.03393321, -3.737055, 0, 1, 0.2745098, 1,
-0.3011316, -1.18817, -3.809798, 0, 1, 0.2784314, 1,
-0.295358, 0.2692072, -1.018956, 0, 1, 0.2862745, 1,
-0.2952337, -0.4466552, -3.088437, 0, 1, 0.2901961, 1,
-0.2928977, 0.9429139, -1.048611, 0, 1, 0.2980392, 1,
-0.2898008, 0.1989617, -1.411264, 0, 1, 0.3058824, 1,
-0.2838242, -0.3678219, -2.096433, 0, 1, 0.3098039, 1,
-0.2765231, 1.16385, -0.2185188, 0, 1, 0.3176471, 1,
-0.2737748, 0.5595955, -1.045693, 0, 1, 0.3215686, 1,
-0.2736164, 1.658516, 0.589018, 0, 1, 0.3294118, 1,
-0.2722751, -0.2790346, -1.14884, 0, 1, 0.3333333, 1,
-0.2721607, 1.916371, -0.7333415, 0, 1, 0.3411765, 1,
-0.270878, -0.4460472, -0.3887188, 0, 1, 0.345098, 1,
-0.2692933, 1.23579, 1.440434, 0, 1, 0.3529412, 1,
-0.265343, -0.8822307, -1.039604, 0, 1, 0.3568628, 1,
-0.2607708, -0.4789931, -2.30722, 0, 1, 0.3647059, 1,
-0.2597079, 0.6406554, 0.4584351, 0, 1, 0.3686275, 1,
-0.2523316, 0.6804891, 0.6286237, 0, 1, 0.3764706, 1,
-0.2521426, -1.570762, -2.780833, 0, 1, 0.3803922, 1,
-0.245682, 0.5969563, -1.555653, 0, 1, 0.3882353, 1,
-0.2411026, 0.655763, 0.4268255, 0, 1, 0.3921569, 1,
-0.2402307, -0.8274932, -1.408325, 0, 1, 0.4, 1,
-0.2351242, 0.9908206, 0.3853133, 0, 1, 0.4078431, 1,
-0.2317765, 0.08177621, 0.03068253, 0, 1, 0.4117647, 1,
-0.2315191, -1.796869, -2.103505, 0, 1, 0.4196078, 1,
-0.2309128, 1.662566, 0.7115015, 0, 1, 0.4235294, 1,
-0.2307268, -1.093495, -2.919071, 0, 1, 0.4313726, 1,
-0.2295003, -1.208996, -3.509388, 0, 1, 0.4352941, 1,
-0.226677, 0.1509923, -1.09798, 0, 1, 0.4431373, 1,
-0.2221787, -1.136405, -3.657208, 0, 1, 0.4470588, 1,
-0.2215055, 1.116059, 0.2371763, 0, 1, 0.454902, 1,
-0.2199368, -0.995879, -3.049044, 0, 1, 0.4588235, 1,
-0.2175155, 0.4745601, -0.5476618, 0, 1, 0.4666667, 1,
-0.2174752, 0.1003686, 0.8847243, 0, 1, 0.4705882, 1,
-0.2168644, 1.350227, -0.9286932, 0, 1, 0.4784314, 1,
-0.2113724, 1.300263, -0.1958478, 0, 1, 0.4823529, 1,
-0.2101181, 0.01008058, -0.9293211, 0, 1, 0.4901961, 1,
-0.2097062, -2.235672, -2.833137, 0, 1, 0.4941176, 1,
-0.2096343, -1.292841, -4.418236, 0, 1, 0.5019608, 1,
-0.2095117, -1.522314, -4.209272, 0, 1, 0.509804, 1,
-0.2071615, 0.6678202, 1.625709, 0, 1, 0.5137255, 1,
-0.204164, -1.153296, -2.646804, 0, 1, 0.5215687, 1,
-0.2021098, -0.06230965, -2.610966, 0, 1, 0.5254902, 1,
-0.1918681, -0.1785341, -3.226875, 0, 1, 0.5333334, 1,
-0.1893501, -0.3168386, -2.678132, 0, 1, 0.5372549, 1,
-0.1868154, -0.8172492, -4.300339, 0, 1, 0.5450981, 1,
-0.1832336, -0.606441, -3.375515, 0, 1, 0.5490196, 1,
-0.1788028, -0.2860688, -2.531863, 0, 1, 0.5568628, 1,
-0.1779019, -0.3037612, -3.276464, 0, 1, 0.5607843, 1,
-0.1770704, -1.952245, -3.225515, 0, 1, 0.5686275, 1,
-0.1758851, -0.6627733, -1.133023, 0, 1, 0.572549, 1,
-0.175084, 0.4550745, 0.232471, 0, 1, 0.5803922, 1,
-0.1737343, -0.9692418, -3.637013, 0, 1, 0.5843138, 1,
-0.1736615, -0.2143121, -1.047379, 0, 1, 0.5921569, 1,
-0.1716216, 0.2705166, -0.9025271, 0, 1, 0.5960785, 1,
-0.1713222, -0.5951663, -1.593616, 0, 1, 0.6039216, 1,
-0.1710919, -0.1376698, -1.647821, 0, 1, 0.6117647, 1,
-0.1682646, 0.6115082, 1.309275, 0, 1, 0.6156863, 1,
-0.1624821, 0.007179054, -0.4423804, 0, 1, 0.6235294, 1,
-0.1614484, 0.7062843, -1.419431, 0, 1, 0.627451, 1,
-0.1559474, 0.6985322, -1.685669, 0, 1, 0.6352941, 1,
-0.1504507, -1.599174, -4.236014, 0, 1, 0.6392157, 1,
-0.1495311, -0.6780996, 1.330265, 0, 1, 0.6470588, 1,
-0.1343594, -1.344551, -2.952086, 0, 1, 0.6509804, 1,
-0.1337266, 2.13163, 0.4533404, 0, 1, 0.6588235, 1,
-0.1300316, -0.2034271, -3.138341, 0, 1, 0.6627451, 1,
-0.129339, -0.6952758, -2.448954, 0, 1, 0.6705883, 1,
-0.1282901, -0.497943, -3.107561, 0, 1, 0.6745098, 1,
-0.1238893, 0.203095, -2.430565, 0, 1, 0.682353, 1,
-0.1233632, 0.4189855, -0.3199796, 0, 1, 0.6862745, 1,
-0.1200732, 0.0517717, -1.309367, 0, 1, 0.6941177, 1,
-0.1184847, -0.1363191, -1.805979, 0, 1, 0.7019608, 1,
-0.1156176, -0.05636525, -2.63603, 0, 1, 0.7058824, 1,
-0.1152547, 1.525189, -0.7071251, 0, 1, 0.7137255, 1,
-0.1145067, -0.953774, -1.484023, 0, 1, 0.7176471, 1,
-0.1144331, 1.219185, -1.518051, 0, 1, 0.7254902, 1,
-0.1109166, -0.8131098, -2.807503, 0, 1, 0.7294118, 1,
-0.11044, 0.3744975, 0.08115193, 0, 1, 0.7372549, 1,
-0.1073657, 0.4052167, -1.288298, 0, 1, 0.7411765, 1,
-0.1069, -0.2271299, -2.641053, 0, 1, 0.7490196, 1,
-0.104494, -0.1262235, -2.875085, 0, 1, 0.7529412, 1,
-0.09312771, -0.126148, -1.423689, 0, 1, 0.7607843, 1,
-0.09264523, 0.7567457, 1.266092, 0, 1, 0.7647059, 1,
-0.08590847, 0.8602516, -0.8295896, 0, 1, 0.772549, 1,
-0.08579375, -0.9609039, -4.026281, 0, 1, 0.7764706, 1,
-0.08516127, 1.130819, -1.008277, 0, 1, 0.7843137, 1,
-0.07855525, 0.6811445, -0.3087628, 0, 1, 0.7882353, 1,
-0.07834753, -1.694184, -2.836795, 0, 1, 0.7960784, 1,
-0.0753582, -0.6934103, -3.969726, 0, 1, 0.8039216, 1,
-0.07362963, -0.4440097, -2.51404, 0, 1, 0.8078431, 1,
-0.07165062, 0.9210773, 0.2264309, 0, 1, 0.8156863, 1,
-0.06641018, 0.875681, -0.1126278, 0, 1, 0.8196079, 1,
-0.0628698, 0.5424425, 1.369908, 0, 1, 0.827451, 1,
-0.06188359, -0.6137036, -3.753147, 0, 1, 0.8313726, 1,
-0.06064237, -0.01541831, -3.974197, 0, 1, 0.8392157, 1,
-0.05986673, -0.7407728, -4.026864, 0, 1, 0.8431373, 1,
-0.05956092, -0.3182248, -2.627125, 0, 1, 0.8509804, 1,
-0.05509129, -0.4323361, -2.97671, 0, 1, 0.854902, 1,
-0.05188046, -1.757457, -2.941999, 0, 1, 0.8627451, 1,
-0.04710326, 0.9809575, 0.2601715, 0, 1, 0.8666667, 1,
-0.04644329, 1.232562, 1.522437, 0, 1, 0.8745098, 1,
-0.04279578, 0.7557655, 0.7193089, 0, 1, 0.8784314, 1,
-0.04207271, -1.035457, -3.369956, 0, 1, 0.8862745, 1,
-0.04055273, 0.7612501, -0.8591697, 0, 1, 0.8901961, 1,
-0.03633279, 0.6779246, -0.3537137, 0, 1, 0.8980392, 1,
-0.0358398, -0.4894822, -2.94297, 0, 1, 0.9058824, 1,
-0.0324631, 1.278312, 1.50743, 0, 1, 0.9098039, 1,
-0.02971994, 2.165112, -0.644788, 0, 1, 0.9176471, 1,
-0.02717399, -0.02924326, -1.554634, 0, 1, 0.9215686, 1,
-0.02201213, -0.2510211, -2.909986, 0, 1, 0.9294118, 1,
-0.01924544, -0.04812922, -2.224243, 0, 1, 0.9333333, 1,
-0.01296039, -1.175737, -3.453, 0, 1, 0.9411765, 1,
-0.01294161, -0.4820513, -3.511562, 0, 1, 0.945098, 1,
-0.009634933, -0.2647159, -2.547407, 0, 1, 0.9529412, 1,
-0.009232109, 1.056389, 1.425163, 0, 1, 0.9568627, 1,
-0.007793772, 1.028342, -0.006149099, 0, 1, 0.9647059, 1,
-0.007536528, 0.7746822, 0.5044494, 0, 1, 0.9686275, 1,
-0.005718699, -0.3285989, -3.236827, 0, 1, 0.9764706, 1,
-0.005069709, 0.4572225, -0.5851381, 0, 1, 0.9803922, 1,
0.001571781, -0.5498911, 4.365138, 0, 1, 0.9882353, 1,
0.003902078, -0.2855509, 3.388416, 0, 1, 0.9921569, 1,
0.004693414, -0.3620237, 3.861937, 0, 1, 1, 1,
0.00518724, -1.644138, 2.036987, 0, 0.9921569, 1, 1,
0.005280489, 1.412963, 0.1229361, 0, 0.9882353, 1, 1,
0.005530226, 0.07843888, 0.680432, 0, 0.9803922, 1, 1,
0.00607941, -0.006442789, 2.83009, 0, 0.9764706, 1, 1,
0.0108117, -1.163746, 3.314854, 0, 0.9686275, 1, 1,
0.01724596, -2.048782, 3.265039, 0, 0.9647059, 1, 1,
0.02150549, -2.739877, 3.564477, 0, 0.9568627, 1, 1,
0.02192867, -0.6457124, 2.481476, 0, 0.9529412, 1, 1,
0.02356563, 1.358982, -1.499786, 0, 0.945098, 1, 1,
0.02609056, 0.08026686, 1.051009, 0, 0.9411765, 1, 1,
0.03182771, -0.3451414, 4.454838, 0, 0.9333333, 1, 1,
0.0343544, -0.5512697, 3.45943, 0, 0.9294118, 1, 1,
0.03720429, 1.01031, 1.873059, 0, 0.9215686, 1, 1,
0.03917698, 1.661999, -0.349787, 0, 0.9176471, 1, 1,
0.04297661, 0.5812089, 0.5007206, 0, 0.9098039, 1, 1,
0.04637755, 0.08361798, 0.1262378, 0, 0.9058824, 1, 1,
0.04748896, -0.1682738, 2.730174, 0, 0.8980392, 1, 1,
0.0510549, 0.2086805, 0.6092936, 0, 0.8901961, 1, 1,
0.05176853, -0.8670701, 1.985882, 0, 0.8862745, 1, 1,
0.05201976, -0.5213898, 3.931648, 0, 0.8784314, 1, 1,
0.05432378, -0.1672025, 2.382102, 0, 0.8745098, 1, 1,
0.05592497, -0.4577281, 2.692868, 0, 0.8666667, 1, 1,
0.06157967, 0.6049388, -0.2757337, 0, 0.8627451, 1, 1,
0.06381363, -0.402106, 4.488657, 0, 0.854902, 1, 1,
0.06470264, 0.360829, -0.9142021, 0, 0.8509804, 1, 1,
0.06487919, 0.5797707, -0.104883, 0, 0.8431373, 1, 1,
0.06680799, 0.2244408, -1.013049, 0, 0.8392157, 1, 1,
0.0700343, 0.5377537, 0.2579938, 0, 0.8313726, 1, 1,
0.07023995, 0.8252065, -0.8022077, 0, 0.827451, 1, 1,
0.07185631, 0.4084859, -0.9562155, 0, 0.8196079, 1, 1,
0.07371241, -0.8620496, 4.176247, 0, 0.8156863, 1, 1,
0.07540353, -0.9597105, 2.4566, 0, 0.8078431, 1, 1,
0.07619742, 0.7079364, -1.054428, 0, 0.8039216, 1, 1,
0.08117743, -0.2207845, 0.8613786, 0, 0.7960784, 1, 1,
0.08325726, -2.240288, 2.485781, 0, 0.7882353, 1, 1,
0.08453132, -1.085097, 1.92567, 0, 0.7843137, 1, 1,
0.0891455, -0.7110404, 3.929021, 0, 0.7764706, 1, 1,
0.08987022, 1.131493, -0.6458478, 0, 0.772549, 1, 1,
0.09072877, 0.561698, 0.6997523, 0, 0.7647059, 1, 1,
0.09108632, -0.8423458, 2.026746, 0, 0.7607843, 1, 1,
0.0922904, 0.8590262, 1.126395, 0, 0.7529412, 1, 1,
0.09241006, 0.7941301, -1.128585, 0, 0.7490196, 1, 1,
0.09332522, -0.2398268, 5.552797, 0, 0.7411765, 1, 1,
0.1004171, -0.7412363, 3.064549, 0, 0.7372549, 1, 1,
0.1008417, -1.859102, 3.002472, 0, 0.7294118, 1, 1,
0.1085501, 1.405141, 1.062175, 0, 0.7254902, 1, 1,
0.1104298, -0.6069939, 2.046975, 0, 0.7176471, 1, 1,
0.1110148, 1.045289, 0.1961198, 0, 0.7137255, 1, 1,
0.1111414, -1.748103, 2.757331, 0, 0.7058824, 1, 1,
0.1128018, -0.8912342, 2.82104, 0, 0.6980392, 1, 1,
0.1158592, 0.5033161, -0.3928358, 0, 0.6941177, 1, 1,
0.119468, 0.09462154, 1.918002, 0, 0.6862745, 1, 1,
0.120081, -2.201378, 4.149839, 0, 0.682353, 1, 1,
0.1209183, -1.214751, 3.259264, 0, 0.6745098, 1, 1,
0.1288863, 0.4329767, -0.2761645, 0, 0.6705883, 1, 1,
0.1304695, 0.2563323, 1.030541, 0, 0.6627451, 1, 1,
0.1330487, -0.3619463, 3.533945, 0, 0.6588235, 1, 1,
0.1379563, -1.600078, 4.473783, 0, 0.6509804, 1, 1,
0.1383777, 0.089297, 0.7081901, 0, 0.6470588, 1, 1,
0.1402552, -0.3481045, 3.371728, 0, 0.6392157, 1, 1,
0.141939, 1.364976, -0.5981752, 0, 0.6352941, 1, 1,
0.1476801, 1.246024, 0.3108221, 0, 0.627451, 1, 1,
0.1477026, 1.189542, 0.1740739, 0, 0.6235294, 1, 1,
0.1516774, 1.051951, 0.3704635, 0, 0.6156863, 1, 1,
0.1529607, 0.4661121, 1.97697, 0, 0.6117647, 1, 1,
0.1542314, 1.216581, 1.433222, 0, 0.6039216, 1, 1,
0.1547396, -1.067887, 3.925636, 0, 0.5960785, 1, 1,
0.1561567, 0.02162559, 1.286694, 0, 0.5921569, 1, 1,
0.157181, -0.187145, 2.480103, 0, 0.5843138, 1, 1,
0.1602414, -0.5217845, 3.683783, 0, 0.5803922, 1, 1,
0.1627359, 0.2636648, 1.70907, 0, 0.572549, 1, 1,
0.1648856, 0.3598732, 1.61088, 0, 0.5686275, 1, 1,
0.1651887, 0.1271644, 3.371066, 0, 0.5607843, 1, 1,
0.1661336, 1.056191, 1.429161, 0, 0.5568628, 1, 1,
0.1673239, -1.01667, 2.670135, 0, 0.5490196, 1, 1,
0.167837, -0.9382597, 2.702239, 0, 0.5450981, 1, 1,
0.1693082, -1.709499, 0.09281337, 0, 0.5372549, 1, 1,
0.1712685, 1.094159, 0.2322693, 0, 0.5333334, 1, 1,
0.1737997, -0.7527635, 3.408118, 0, 0.5254902, 1, 1,
0.1763502, -0.3357929, 3.077173, 0, 0.5215687, 1, 1,
0.1771616, 0.08847247, 0.5597833, 0, 0.5137255, 1, 1,
0.1802488, -0.005589461, 4.095112, 0, 0.509804, 1, 1,
0.1802713, -0.948799, 2.81065, 0, 0.5019608, 1, 1,
0.1839323, 0.6226711, 2.0208, 0, 0.4941176, 1, 1,
0.1940995, -1.142777, 2.650367, 0, 0.4901961, 1, 1,
0.1966557, 3.007845, 0.0163096, 0, 0.4823529, 1, 1,
0.1973782, -1.669222, 2.986207, 0, 0.4784314, 1, 1,
0.1992986, -0.6059183, 2.798839, 0, 0.4705882, 1, 1,
0.2055985, 0.5137195, 1.669826, 0, 0.4666667, 1, 1,
0.2057739, -0.3965129, 2.319834, 0, 0.4588235, 1, 1,
0.2063983, 1.242307, 0.2360781, 0, 0.454902, 1, 1,
0.2103156, 2.163829, -0.4953387, 0, 0.4470588, 1, 1,
0.2164903, -0.006579423, 1.066695, 0, 0.4431373, 1, 1,
0.2167387, 0.6361898, -2.014915, 0, 0.4352941, 1, 1,
0.219338, 0.7128201, 0.6801776, 0, 0.4313726, 1, 1,
0.2268078, 0.4383762, 1.407542, 0, 0.4235294, 1, 1,
0.2310571, -0.996122, 3.882953, 0, 0.4196078, 1, 1,
0.231237, -0.7173969, 3.310067, 0, 0.4117647, 1, 1,
0.2360928, 1.15498, 1.088576, 0, 0.4078431, 1, 1,
0.2366464, 0.3191682, -0.03925701, 0, 0.4, 1, 1,
0.2389695, 0.9444084, 0.1894279, 0, 0.3921569, 1, 1,
0.2412062, 1.626, 0.3773174, 0, 0.3882353, 1, 1,
0.2426199, 0.5409999, 0.8628281, 0, 0.3803922, 1, 1,
0.2429092, 0.352167, 0.0171919, 0, 0.3764706, 1, 1,
0.246257, 0.7396975, -1.625387, 0, 0.3686275, 1, 1,
0.2498729, 0.3123172, -0.2192338, 0, 0.3647059, 1, 1,
0.2501445, -1.698117, 3.389018, 0, 0.3568628, 1, 1,
0.2564152, -0.322652, 1.794021, 0, 0.3529412, 1, 1,
0.2625546, 0.6794015, 1.193193, 0, 0.345098, 1, 1,
0.2630971, -1.030073, 1.546564, 0, 0.3411765, 1, 1,
0.2640716, 0.3804272, 0.5743947, 0, 0.3333333, 1, 1,
0.2665363, 0.06976347, 2.173429, 0, 0.3294118, 1, 1,
0.2713982, 1.441254, -0.5766196, 0, 0.3215686, 1, 1,
0.2720624, -0.8257644, 2.81135, 0, 0.3176471, 1, 1,
0.2747073, -0.9581834, 4.884975, 0, 0.3098039, 1, 1,
0.2748799, 0.1476999, 1.052538, 0, 0.3058824, 1, 1,
0.2767698, 0.6455435, -0.7266083, 0, 0.2980392, 1, 1,
0.2778659, -0.1671885, 1.562412, 0, 0.2901961, 1, 1,
0.2793646, 0.04179551, 0.8676645, 0, 0.2862745, 1, 1,
0.2830391, 0.3902082, 0.09526718, 0, 0.2784314, 1, 1,
0.2838462, -0.7509565, 2.882476, 0, 0.2745098, 1, 1,
0.2852924, 0.08753194, 1.053395, 0, 0.2666667, 1, 1,
0.2853269, -0.4408159, 0.3678544, 0, 0.2627451, 1, 1,
0.2861692, -1.106089, 1.197623, 0, 0.254902, 1, 1,
0.2863577, -0.4694559, 0.7489035, 0, 0.2509804, 1, 1,
0.286503, 0.009451502, 2.21913, 0, 0.2431373, 1, 1,
0.2889099, -0.6130937, 3.632012, 0, 0.2392157, 1, 1,
0.2889101, -0.6267292, 1.829004, 0, 0.2313726, 1, 1,
0.2898368, 0.2102049, 1.472629, 0, 0.227451, 1, 1,
0.2916441, 0.5895181, 0.337889, 0, 0.2196078, 1, 1,
0.2930498, 0.7587988, -0.2265835, 0, 0.2156863, 1, 1,
0.2942419, -0.4155667, 2.509376, 0, 0.2078431, 1, 1,
0.2944465, 1.539878, 2.851517, 0, 0.2039216, 1, 1,
0.2947744, 0.1710095, 0.838551, 0, 0.1960784, 1, 1,
0.2982858, 0.8956455, 0.07273489, 0, 0.1882353, 1, 1,
0.2995706, 0.5828568, 0.3898709, 0, 0.1843137, 1, 1,
0.3029526, -0.3719669, 3.619865, 0, 0.1764706, 1, 1,
0.303202, 1.148859, 1.168145, 0, 0.172549, 1, 1,
0.3118889, -1.052222, 2.259376, 0, 0.1647059, 1, 1,
0.312608, -0.2571064, 2.735334, 0, 0.1607843, 1, 1,
0.3142166, -0.3671245, 3.010268, 0, 0.1529412, 1, 1,
0.3162291, 0.3069535, 1.110943, 0, 0.1490196, 1, 1,
0.318141, -0.08131383, 1.984865, 0, 0.1411765, 1, 1,
0.3186247, -0.3089185, 2.4351, 0, 0.1372549, 1, 1,
0.3188434, 1.532293, -0.9541727, 0, 0.1294118, 1, 1,
0.3194444, 1.603992, -0.09577386, 0, 0.1254902, 1, 1,
0.3284436, -1.638302, 1.162314, 0, 0.1176471, 1, 1,
0.3297812, -1.076677, 4.123664, 0, 0.1137255, 1, 1,
0.3308462, -0.3568801, 3.492255, 0, 0.1058824, 1, 1,
0.3322854, 0.1282227, 0.005528484, 0, 0.09803922, 1, 1,
0.3399794, 0.06830324, 2.639766, 0, 0.09411765, 1, 1,
0.3410279, -2.36651, 3.612185, 0, 0.08627451, 1, 1,
0.3432761, 0.1668171, 1.963761, 0, 0.08235294, 1, 1,
0.3434472, 0.9283956, 0.284937, 0, 0.07450981, 1, 1,
0.3447442, -1.967241, 4.053161, 0, 0.07058824, 1, 1,
0.3461292, 0.8069662, -0.3043354, 0, 0.0627451, 1, 1,
0.3462199, 0.1653039, 0.9786166, 0, 0.05882353, 1, 1,
0.3475723, 0.111554, 1.304857, 0, 0.05098039, 1, 1,
0.3479556, -0.6755875, 5.595161, 0, 0.04705882, 1, 1,
0.3480992, 0.9244963, 0.8667347, 0, 0.03921569, 1, 1,
0.3495209, 0.8788959, 1.229626, 0, 0.03529412, 1, 1,
0.3512889, -1.135972, 3.74858, 0, 0.02745098, 1, 1,
0.3583177, -0.164294, 0.7681486, 0, 0.02352941, 1, 1,
0.3584141, -0.3268383, 2.794414, 0, 0.01568628, 1, 1,
0.3605945, 0.8454514, 1.176628, 0, 0.01176471, 1, 1,
0.3612789, -1.147392, 2.530626, 0, 0.003921569, 1, 1,
0.3613475, 1.105753, 0.5356138, 0.003921569, 0, 1, 1,
0.3638564, 0.06990252, 0.2132293, 0.007843138, 0, 1, 1,
0.3640649, 1.969916, 0.6384829, 0.01568628, 0, 1, 1,
0.3683701, 1.362789, 1.726636, 0.01960784, 0, 1, 1,
0.3692701, -0.6527039, 4.691789, 0.02745098, 0, 1, 1,
0.3704453, 0.477427, 0.02296265, 0.03137255, 0, 1, 1,
0.3704537, 0.02977647, 0.5527942, 0.03921569, 0, 1, 1,
0.3719848, 0.3649219, 1.570285, 0.04313726, 0, 1, 1,
0.3730533, 2.032162, 0.7538524, 0.05098039, 0, 1, 1,
0.3732408, 0.06461187, 1.602907, 0.05490196, 0, 1, 1,
0.3751825, 0.616318, 0.7923681, 0.0627451, 0, 1, 1,
0.3832614, 0.1654825, 1.014537, 0.06666667, 0, 1, 1,
0.3848619, -1.447006, 2.909318, 0.07450981, 0, 1, 1,
0.3937676, -0.3191763, 3.13358, 0.07843138, 0, 1, 1,
0.3998415, 1.405501, -0.06213265, 0.08627451, 0, 1, 1,
0.3998906, -1.579482, 2.806914, 0.09019608, 0, 1, 1,
0.4034927, -0.7203223, 0.7587469, 0.09803922, 0, 1, 1,
0.4036359, -1.731412, 2.472299, 0.1058824, 0, 1, 1,
0.4037946, -0.97844, 2.929211, 0.1098039, 0, 1, 1,
0.4097775, 0.9139931, 1.190515, 0.1176471, 0, 1, 1,
0.4103085, 0.4123816, 2.217028, 0.1215686, 0, 1, 1,
0.4116378, 1.728552, -0.06794857, 0.1294118, 0, 1, 1,
0.4172427, -0.2988195, 1.264347, 0.1333333, 0, 1, 1,
0.4177155, 0.5024468, 0.3874839, 0.1411765, 0, 1, 1,
0.4217341, -1.266897, 3.176805, 0.145098, 0, 1, 1,
0.423801, 0.01264982, 3.945934, 0.1529412, 0, 1, 1,
0.4241961, 0.4967528, 1.231595, 0.1568628, 0, 1, 1,
0.4273574, 0.4367858, 0.004451026, 0.1647059, 0, 1, 1,
0.4286683, 0.2104428, 0.680331, 0.1686275, 0, 1, 1,
0.432016, 0.2028859, 1.751083, 0.1764706, 0, 1, 1,
0.4332975, -0.4364908, 3.042466, 0.1803922, 0, 1, 1,
0.4333081, 1.545009, -0.7590935, 0.1882353, 0, 1, 1,
0.4334909, -0.7796037, 1.87709, 0.1921569, 0, 1, 1,
0.4337991, -0.7321057, 1.692743, 0.2, 0, 1, 1,
0.437729, 1.260233, 0.6925284, 0.2078431, 0, 1, 1,
0.44212, -0.2006177, 1.357162, 0.2117647, 0, 1, 1,
0.4429464, 1.919598, 0.1562107, 0.2196078, 0, 1, 1,
0.4455867, -1.230544, 2.998046, 0.2235294, 0, 1, 1,
0.4481208, 0.6478834, 1.298528, 0.2313726, 0, 1, 1,
0.4484167, -0.2236728, 1.937456, 0.2352941, 0, 1, 1,
0.4532968, 1.11524, 0.6832787, 0.2431373, 0, 1, 1,
0.4616731, -0.06066632, 2.961204, 0.2470588, 0, 1, 1,
0.4643434, 1.208306, -0.5408157, 0.254902, 0, 1, 1,
0.4644885, -0.5522469, 2.851835, 0.2588235, 0, 1, 1,
0.4669196, -0.6636485, 0.4066446, 0.2666667, 0, 1, 1,
0.467307, 0.4028919, 0.5042219, 0.2705882, 0, 1, 1,
0.4683236, 1.741996, 1.921438, 0.2784314, 0, 1, 1,
0.470344, 1.367478, -0.7067821, 0.282353, 0, 1, 1,
0.4719253, -2.02825, 3.570894, 0.2901961, 0, 1, 1,
0.4731189, -0.02080857, 0.1300363, 0.2941177, 0, 1, 1,
0.4765352, -0.1266639, 1.989648, 0.3019608, 0, 1, 1,
0.4806035, -0.2920595, 3.309713, 0.3098039, 0, 1, 1,
0.4841004, -0.2460676, 2.803221, 0.3137255, 0, 1, 1,
0.4997586, -1.942284, 0.489594, 0.3215686, 0, 1, 1,
0.5026812, -1.267731, 1.532313, 0.3254902, 0, 1, 1,
0.5048234, 0.2522193, 1.062935, 0.3333333, 0, 1, 1,
0.5054497, -0.475978, 2.448213, 0.3372549, 0, 1, 1,
0.5087066, -1.161, 3.312979, 0.345098, 0, 1, 1,
0.512966, 0.3673418, 0.8561369, 0.3490196, 0, 1, 1,
0.515222, 1.027093, -0.3303855, 0.3568628, 0, 1, 1,
0.5167847, -0.8481762, 1.583305, 0.3607843, 0, 1, 1,
0.5177063, 0.2235488, 2.110331, 0.3686275, 0, 1, 1,
0.5189508, 0.9025236, -0.07854433, 0.372549, 0, 1, 1,
0.5210334, -1.117344, 3.907407, 0.3803922, 0, 1, 1,
0.521708, -1.273155, 2.472435, 0.3843137, 0, 1, 1,
0.5261513, -0.09162891, 2.658603, 0.3921569, 0, 1, 1,
0.5281673, -0.343697, 2.620189, 0.3960784, 0, 1, 1,
0.5300878, 0.7345132, -0.1923655, 0.4039216, 0, 1, 1,
0.5312266, 0.4167193, -0.5910606, 0.4117647, 0, 1, 1,
0.5341386, 0.6959575, 1.372268, 0.4156863, 0, 1, 1,
0.5353009, 0.5948348, 0.9536958, 0.4235294, 0, 1, 1,
0.5360314, -0.4070732, 1.025941, 0.427451, 0, 1, 1,
0.5368618, -2.03595, 2.07283, 0.4352941, 0, 1, 1,
0.54277, 0.5859301, 0.6994262, 0.4392157, 0, 1, 1,
0.5450696, 1.940289, 0.2623834, 0.4470588, 0, 1, 1,
0.5450939, -0.9802673, 3.259074, 0.4509804, 0, 1, 1,
0.5487724, 0.6333075, -0.2068581, 0.4588235, 0, 1, 1,
0.5547098, 1.69139, 1.960404, 0.4627451, 0, 1, 1,
0.5568414, -0.2223988, 0.20319, 0.4705882, 0, 1, 1,
0.5594543, -0.6504642, 1.585025, 0.4745098, 0, 1, 1,
0.5631796, 0.204989, 0.9783396, 0.4823529, 0, 1, 1,
0.5632089, 1.741764, 0.3656691, 0.4862745, 0, 1, 1,
0.5682831, 0.8298458, 2.951588, 0.4941176, 0, 1, 1,
0.57234, 0.8023043, 0.2067886, 0.5019608, 0, 1, 1,
0.576316, -1.695769, 2.072222, 0.5058824, 0, 1, 1,
0.5778573, -0.4369489, 0.5392552, 0.5137255, 0, 1, 1,
0.5832278, 0.4949478, 1.847832, 0.5176471, 0, 1, 1,
0.5851918, -0.8684564, 1.337709, 0.5254902, 0, 1, 1,
0.5868771, 0.3407945, 1.858719, 0.5294118, 0, 1, 1,
0.5870653, 0.2323855, 0.5068436, 0.5372549, 0, 1, 1,
0.5893807, -1.328629, 4.166324, 0.5411765, 0, 1, 1,
0.6006517, 1.22343, -1.055504, 0.5490196, 0, 1, 1,
0.6052142, -2.336538, 3.570162, 0.5529412, 0, 1, 1,
0.6083288, -0.617899, 3.291989, 0.5607843, 0, 1, 1,
0.6086551, -0.9156066, 3.559458, 0.5647059, 0, 1, 1,
0.6158466, 0.2085906, 0.6633976, 0.572549, 0, 1, 1,
0.617455, 1.119059, 0.1706566, 0.5764706, 0, 1, 1,
0.6183851, 0.2880067, 1.534968, 0.5843138, 0, 1, 1,
0.6202765, -0.6849387, 3.003657, 0.5882353, 0, 1, 1,
0.623147, 1.712715, 1.518405, 0.5960785, 0, 1, 1,
0.6276896, -0.1426518, 2.272304, 0.6039216, 0, 1, 1,
0.6324849, -0.8939353, 3.045049, 0.6078432, 0, 1, 1,
0.6446009, 0.6435035, 1.262884, 0.6156863, 0, 1, 1,
0.6449509, -0.38097, 1.399391, 0.6196079, 0, 1, 1,
0.6457011, 1.505021, 0.7866235, 0.627451, 0, 1, 1,
0.64638, -0.7772402, 3.341462, 0.6313726, 0, 1, 1,
0.6726298, -0.448651, 1.04858, 0.6392157, 0, 1, 1,
0.6754777, -0.4437989, 2.290438, 0.6431373, 0, 1, 1,
0.6757749, 2.294309, 0.4046206, 0.6509804, 0, 1, 1,
0.678858, 1.636914, 1.172355, 0.654902, 0, 1, 1,
0.6804789, -2.009377, 2.158085, 0.6627451, 0, 1, 1,
0.6833482, -0.7614166, 2.440159, 0.6666667, 0, 1, 1,
0.6838292, -1.160712, 2.152205, 0.6745098, 0, 1, 1,
0.689255, -1.515949, 3.342151, 0.6784314, 0, 1, 1,
0.6936762, 1.140528, -0.6253377, 0.6862745, 0, 1, 1,
0.6937869, -0.1326803, 1.272162, 0.6901961, 0, 1, 1,
0.6977227, -0.1774631, 2.992393, 0.6980392, 0, 1, 1,
0.6991099, -0.373711, 2.508585, 0.7058824, 0, 1, 1,
0.701799, -0.4397735, 4.032918, 0.7098039, 0, 1, 1,
0.7021688, 0.9959428, -0.6331895, 0.7176471, 0, 1, 1,
0.7076657, 0.1228043, 1.21435, 0.7215686, 0, 1, 1,
0.7139819, -0.03010311, 2.974053, 0.7294118, 0, 1, 1,
0.7142455, -2.453407, 3.565004, 0.7333333, 0, 1, 1,
0.7155811, 2.905283, 0.1281767, 0.7411765, 0, 1, 1,
0.7203448, 0.3791206, 0.1485063, 0.7450981, 0, 1, 1,
0.7205198, -0.06071636, 2.872033, 0.7529412, 0, 1, 1,
0.7249615, 1.846557, -0.4616173, 0.7568628, 0, 1, 1,
0.7393028, 0.0897828, 1.267064, 0.7647059, 0, 1, 1,
0.7398526, -1.676611, 1.936055, 0.7686275, 0, 1, 1,
0.7652066, 0.5880633, 1.848614, 0.7764706, 0, 1, 1,
0.7677826, 0.8417091, -0.4882758, 0.7803922, 0, 1, 1,
0.7773584, 0.1458495, 1.819319, 0.7882353, 0, 1, 1,
0.780799, 1.360119, 1.300085, 0.7921569, 0, 1, 1,
0.7833085, -3.061395, 3.791905, 0.8, 0, 1, 1,
0.7843247, 1.191559, 0.9039073, 0.8078431, 0, 1, 1,
0.7986449, 0.1376936, 2.397873, 0.8117647, 0, 1, 1,
0.7994322, 1.414494, 0.8129718, 0.8196079, 0, 1, 1,
0.806575, 0.3113734, 0.427919, 0.8235294, 0, 1, 1,
0.8078939, -1.200769, 3.649298, 0.8313726, 0, 1, 1,
0.8085756, -0.4011273, 0.04872471, 0.8352941, 0, 1, 1,
0.8131188, -1.08192, 0.536129, 0.8431373, 0, 1, 1,
0.8172574, 0.7399794, -0.1649084, 0.8470588, 0, 1, 1,
0.8174539, 0.4493283, 2.493838, 0.854902, 0, 1, 1,
0.8240501, -0.7051519, 1.714722, 0.8588235, 0, 1, 1,
0.8254807, 0.2912114, 2.857988, 0.8666667, 0, 1, 1,
0.8263807, -0.2148145, 1.546106, 0.8705882, 0, 1, 1,
0.8272418, -0.1439273, 2.877406, 0.8784314, 0, 1, 1,
0.8285787, 1.297795, 1.545813, 0.8823529, 0, 1, 1,
0.8318068, 0.3108042, 1.192964, 0.8901961, 0, 1, 1,
0.8354144, 0.4312108, 0.1536389, 0.8941177, 0, 1, 1,
0.8357873, -0.192788, 1.65438, 0.9019608, 0, 1, 1,
0.839429, 0.4360391, -0.4101854, 0.9098039, 0, 1, 1,
0.8425229, -0.8320695, 1.039517, 0.9137255, 0, 1, 1,
0.8510501, -1.326859, 1.455397, 0.9215686, 0, 1, 1,
0.8514309, 0.5915456, 1.527833, 0.9254902, 0, 1, 1,
0.8514428, 1.050402, 0.1512918, 0.9333333, 0, 1, 1,
0.8532115, 0.2336067, -0.498395, 0.9372549, 0, 1, 1,
0.8535063, 0.4532622, 1.10179, 0.945098, 0, 1, 1,
0.8546498, -0.7915061, 2.778288, 0.9490196, 0, 1, 1,
0.8566983, 0.5423399, 1.324865, 0.9568627, 0, 1, 1,
0.8591872, 0.001927152, 1.42308, 0.9607843, 0, 1, 1,
0.8655721, 0.1491701, 1.018618, 0.9686275, 0, 1, 1,
0.8658198, 3.219694, -0.6716758, 0.972549, 0, 1, 1,
0.8661887, -1.200266, 2.26929, 0.9803922, 0, 1, 1,
0.8759043, -1.167116, 2.701769, 0.9843137, 0, 1, 1,
0.8798165, -0.7647762, 1.198713, 0.9921569, 0, 1, 1,
0.8816117, -0.641168, 0.6277129, 0.9960784, 0, 1, 1,
0.8929994, 0.8140664, 1.465193, 1, 0, 0.9960784, 1,
0.8940493, -0.3431951, 2.683014, 1, 0, 0.9882353, 1,
0.8993789, -1.795968, 3.501827, 1, 0, 0.9843137, 1,
0.9004489, -2.121788, 4.864276, 1, 0, 0.9764706, 1,
0.9064952, -0.6011655, 0.8011625, 1, 0, 0.972549, 1,
0.908096, 0.6872495, 0.2826531, 1, 0, 0.9647059, 1,
0.9138695, -0.5697216, 0.7075278, 1, 0, 0.9607843, 1,
0.9155983, -0.2965252, 2.649571, 1, 0, 0.9529412, 1,
0.9168272, 0.7922246, 1.575368, 1, 0, 0.9490196, 1,
0.9223142, 1.131458, 1.214531, 1, 0, 0.9411765, 1,
0.9294694, -0.03340839, 0.5516743, 1, 0, 0.9372549, 1,
0.9333435, -0.175136, 1.341077, 1, 0, 0.9294118, 1,
0.942442, -1.411779, 3.653053, 1, 0, 0.9254902, 1,
0.9547089, 1.093629, 1.202853, 1, 0, 0.9176471, 1,
0.9671311, -0.7783511, 3.202282, 1, 0, 0.9137255, 1,
0.9692867, -0.2387957, 2.652573, 1, 0, 0.9058824, 1,
0.9707087, 0.09453633, 1.264769, 1, 0, 0.9019608, 1,
0.9753847, -0.2254981, 1.106772, 1, 0, 0.8941177, 1,
0.9890887, 1.033586, 1.319273, 1, 0, 0.8862745, 1,
0.9963264, -0.7570513, 0.9787827, 1, 0, 0.8823529, 1,
1.005878, -2.00697, 2.298645, 1, 0, 0.8745098, 1,
1.008477, 1.277996, 0.2953666, 1, 0, 0.8705882, 1,
1.010925, -1.826535, 3.887631, 1, 0, 0.8627451, 1,
1.012026, 0.6432747, -0.7096347, 1, 0, 0.8588235, 1,
1.027933, 0.1680506, 0.7615827, 1, 0, 0.8509804, 1,
1.033585, 0.2036384, 0.3501152, 1, 0, 0.8470588, 1,
1.0358, -1.644969, 3.185154, 1, 0, 0.8392157, 1,
1.038667, 0.04392752, 2.434835, 1, 0, 0.8352941, 1,
1.047651, 0.1726055, 0.3219208, 1, 0, 0.827451, 1,
1.05022, -0.2635486, 2.201067, 1, 0, 0.8235294, 1,
1.053308, 0.1729557, -1.44217, 1, 0, 0.8156863, 1,
1.053452, 1.744582, 1.292821, 1, 0, 0.8117647, 1,
1.054486, -0.7707853, 3.726719, 1, 0, 0.8039216, 1,
1.055261, -0.4686405, 2.237584, 1, 0, 0.7960784, 1,
1.060748, 0.3286203, 3.008225, 1, 0, 0.7921569, 1,
1.069349, 0.2649198, 0.2972662, 1, 0, 0.7843137, 1,
1.069628, -0.9394111, 1.808912, 1, 0, 0.7803922, 1,
1.071786, -1.359164, 3.230695, 1, 0, 0.772549, 1,
1.073507, -0.5470089, 2.208542, 1, 0, 0.7686275, 1,
1.075609, 0.923904, 0.1292367, 1, 0, 0.7607843, 1,
1.076244, -1.413686, 1.297377, 1, 0, 0.7568628, 1,
1.083713, 0.01248221, 2.159647, 1, 0, 0.7490196, 1,
1.084722, 0.4533393, 0.8963714, 1, 0, 0.7450981, 1,
1.089758, -0.4585388, 1.40352, 1, 0, 0.7372549, 1,
1.089804, -0.3939483, -0.6643584, 1, 0, 0.7333333, 1,
1.091789, -0.8208404, 1.829691, 1, 0, 0.7254902, 1,
1.093103, 0.4825715, -0.8358992, 1, 0, 0.7215686, 1,
1.102828, 1.778555, 0.191864, 1, 0, 0.7137255, 1,
1.103376, -0.07887175, 3.094532, 1, 0, 0.7098039, 1,
1.112522, -0.5111063, 3.413809, 1, 0, 0.7019608, 1,
1.125793, 0.9991537, 0.06956751, 1, 0, 0.6941177, 1,
1.142083, -0.0632413, 0.776659, 1, 0, 0.6901961, 1,
1.142259, 0.5104454, 0.00582549, 1, 0, 0.682353, 1,
1.16408, 0.4842373, 0.7637561, 1, 0, 0.6784314, 1,
1.170272, 1.233271, 0.6935561, 1, 0, 0.6705883, 1,
1.171617, -1.411049, 2.303705, 1, 0, 0.6666667, 1,
1.171687, -1.012312, 2.353021, 1, 0, 0.6588235, 1,
1.173081, -0.08461709, 2.814814, 1, 0, 0.654902, 1,
1.175764, 0.06393532, 0.7800639, 1, 0, 0.6470588, 1,
1.178492, 1.051683, 0.8097463, 1, 0, 0.6431373, 1,
1.190284, 0.7970033, 0.9812812, 1, 0, 0.6352941, 1,
1.195438, -1.924042, 3.016269, 1, 0, 0.6313726, 1,
1.215001, -0.7368353, 3.532313, 1, 0, 0.6235294, 1,
1.23416, 0.03423911, 1.616432, 1, 0, 0.6196079, 1,
1.244471, 0.1547266, 1.846574, 1, 0, 0.6117647, 1,
1.245888, -0.9825175, 1.972964, 1, 0, 0.6078432, 1,
1.247887, -0.1458532, 1.567206, 1, 0, 0.6, 1,
1.249029, -0.4299983, 2.900622, 1, 0, 0.5921569, 1,
1.250526, 1.439741, 1.769433, 1, 0, 0.5882353, 1,
1.262938, 0.0463092, 0.9706684, 1, 0, 0.5803922, 1,
1.269209, -1.42884, 3.270358, 1, 0, 0.5764706, 1,
1.292579, -1.377863, 3.18686, 1, 0, 0.5686275, 1,
1.300724, -1.282684, 0.9431443, 1, 0, 0.5647059, 1,
1.304767, 0.5331926, 0.6175214, 1, 0, 0.5568628, 1,
1.314096, -0.2202922, 1.5331, 1, 0, 0.5529412, 1,
1.314364, 0.08260044, 1.84901, 1, 0, 0.5450981, 1,
1.320474, -0.6227072, 3.438576, 1, 0, 0.5411765, 1,
1.332371, -1.071176, 1.413794, 1, 0, 0.5333334, 1,
1.333867, -0.9827739, 1.409611, 1, 0, 0.5294118, 1,
1.337443, -1.537927, 3.095724, 1, 0, 0.5215687, 1,
1.33914, 0.191903, 1.109284, 1, 0, 0.5176471, 1,
1.347587, -0.3969641, 1.724145, 1, 0, 0.509804, 1,
1.360391, -0.6252244, 0.8592351, 1, 0, 0.5058824, 1,
1.372577, -1.098124, 1.933066, 1, 0, 0.4980392, 1,
1.390432, 1.313554, 2.141212, 1, 0, 0.4901961, 1,
1.39098, -2.66342, 4.775608, 1, 0, 0.4862745, 1,
1.396986, -0.6318578, 1.045842, 1, 0, 0.4784314, 1,
1.400684, -0.3241715, 2.147609, 1, 0, 0.4745098, 1,
1.401111, 0.8979113, 1.701069, 1, 0, 0.4666667, 1,
1.405554, -0.612559, 2.647163, 1, 0, 0.4627451, 1,
1.407525, -0.6058875, 0.6988743, 1, 0, 0.454902, 1,
1.40879, -0.9976568, 2.717096, 1, 0, 0.4509804, 1,
1.412801, 0.4126807, 1.17006, 1, 0, 0.4431373, 1,
1.413988, -0.3907647, 1.743802, 1, 0, 0.4392157, 1,
1.42574, -0.05493473, 2.71665, 1, 0, 0.4313726, 1,
1.426167, -0.2872688, 3.229361, 1, 0, 0.427451, 1,
1.434439, -0.9804553, 3.236008, 1, 0, 0.4196078, 1,
1.448248, -2.540461, 4.61721, 1, 0, 0.4156863, 1,
1.451245, -0.6249081, 3.337503, 1, 0, 0.4078431, 1,
1.461432, 0.3687836, 0.3664548, 1, 0, 0.4039216, 1,
1.4815, 0.7436591, 1.000389, 1, 0, 0.3960784, 1,
1.497795, -0.06388447, 1.146025, 1, 0, 0.3882353, 1,
1.508103, -1.066701, 2.657345, 1, 0, 0.3843137, 1,
1.517777, -0.4167205, 2.107401, 1, 0, 0.3764706, 1,
1.522779, -0.3669945, 0.4409172, 1, 0, 0.372549, 1,
1.531913, 0.7342803, 0.8038864, 1, 0, 0.3647059, 1,
1.536765, 2.148591, 0.5631674, 1, 0, 0.3607843, 1,
1.542746, 0.1563984, -0.03771973, 1, 0, 0.3529412, 1,
1.54403, 1.836911, 1.917866, 1, 0, 0.3490196, 1,
1.55241, -0.2474243, 0.9062452, 1, 0, 0.3411765, 1,
1.56478, -1.210741, 0.2637807, 1, 0, 0.3372549, 1,
1.59014, -1.640044, 1.619697, 1, 0, 0.3294118, 1,
1.597643, -0.6689342, 3.861423, 1, 0, 0.3254902, 1,
1.608897, 1.088132, 1.482129, 1, 0, 0.3176471, 1,
1.614443, -0.07919487, 4.000176, 1, 0, 0.3137255, 1,
1.614626, 0.1569795, 2.141497, 1, 0, 0.3058824, 1,
1.637641, -0.3463887, 2.041167, 1, 0, 0.2980392, 1,
1.637671, 0.1380784, 2.400307, 1, 0, 0.2941177, 1,
1.649028, 0.7307245, 0.4720576, 1, 0, 0.2862745, 1,
1.651096, -0.4801465, 0.7781888, 1, 0, 0.282353, 1,
1.652997, -0.6057116, 1.787161, 1, 0, 0.2745098, 1,
1.655341, -0.5853376, 2.155049, 1, 0, 0.2705882, 1,
1.657316, 1.364775, 0.3067387, 1, 0, 0.2627451, 1,
1.665541, 3.154972, 1.92783, 1, 0, 0.2588235, 1,
1.671597, 1.361012, 0.8555697, 1, 0, 0.2509804, 1,
1.688513, 0.9638842, 1.428715, 1, 0, 0.2470588, 1,
1.691987, 0.3457255, 2.468231, 1, 0, 0.2392157, 1,
1.693524, -0.8125629, 1.553907, 1, 0, 0.2352941, 1,
1.69395, -1.567011, 2.153998, 1, 0, 0.227451, 1,
1.694256, -0.2668379, 2.604533, 1, 0, 0.2235294, 1,
1.695981, 1.187693, -0.2009803, 1, 0, 0.2156863, 1,
1.712286, 1.289887, 0.886685, 1, 0, 0.2117647, 1,
1.715149, -0.4846798, 1.03637, 1, 0, 0.2039216, 1,
1.715958, -1.019678, 3.690749, 1, 0, 0.1960784, 1,
1.718112, 0.1244141, 2.916895, 1, 0, 0.1921569, 1,
1.722015, 0.1000124, -0.3545684, 1, 0, 0.1843137, 1,
1.752436, 0.7810006, 0.8892654, 1, 0, 0.1803922, 1,
1.777509, 0.05157021, -0.3320183, 1, 0, 0.172549, 1,
1.797849, -1.861204, 2.009, 1, 0, 0.1686275, 1,
1.801961, 0.348489, 1.016896, 1, 0, 0.1607843, 1,
1.817291, 0.7158183, 1.814004, 1, 0, 0.1568628, 1,
1.824167, 1.691727, 0.4465968, 1, 0, 0.1490196, 1,
1.82893, -0.3201308, 3.374764, 1, 0, 0.145098, 1,
1.832625, 3.039112, 1.494179, 1, 0, 0.1372549, 1,
1.85692, -0.2309735, 0.8775393, 1, 0, 0.1333333, 1,
1.924604, -0.7263172, 2.313764, 1, 0, 0.1254902, 1,
1.935689, -0.3862787, 2.214591, 1, 0, 0.1215686, 1,
1.970496, -0.4707421, 2.299704, 1, 0, 0.1137255, 1,
1.981682, 1.033588, 1.170689, 1, 0, 0.1098039, 1,
1.982512, -2.434299, 3.110162, 1, 0, 0.1019608, 1,
1.985617, -1.734613, 1.908379, 1, 0, 0.09411765, 1,
2.013413, 0.7455959, 0.4778978, 1, 0, 0.09019608, 1,
2.046182, 1.506217, 2.54513, 1, 0, 0.08235294, 1,
2.060276, 0.3892571, 1.355701, 1, 0, 0.07843138, 1,
2.200889, -0.3250675, 2.01077, 1, 0, 0.07058824, 1,
2.228918, -0.2038585, 1.965201, 1, 0, 0.06666667, 1,
2.229635, -0.04526123, 0.606773, 1, 0, 0.05882353, 1,
2.265918, 0.4127969, 1.02397, 1, 0, 0.05490196, 1,
2.301309, -1.501554, 3.037694, 1, 0, 0.04705882, 1,
2.346192, 1.487369, 1.587278, 1, 0, 0.04313726, 1,
2.444268, 0.8075073, 0.8411385, 1, 0, 0.03529412, 1,
2.460018, -1.868442, 2.721761, 1, 0, 0.03137255, 1,
2.50822, -1.908782, 2.83982, 1, 0, 0.02352941, 1,
2.510505, -0.2666043, 3.711089, 1, 0, 0.01960784, 1,
2.51383, -0.2581523, 2.943123, 1, 0, 0.01176471, 1,
3.033311, -0.6605592, 1.380309, 1, 0, 0.007843138, 1
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
-0.01003838, -4.12604, -6.544383, 0, -0.5, 0.5, 0.5,
-0.01003838, -4.12604, -6.544383, 1, -0.5, 0.5, 0.5,
-0.01003838, -4.12604, -6.544383, 1, 1.5, 0.5, 0.5,
-0.01003838, -4.12604, -6.544383, 0, 1.5, 0.5, 0.5
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
-4.085083, 0.0791496, -6.544383, 0, -0.5, 0.5, 0.5,
-4.085083, 0.0791496, -6.544383, 1, -0.5, 0.5, 0.5,
-4.085083, 0.0791496, -6.544383, 1, 1.5, 0.5, 0.5,
-4.085083, 0.0791496, -6.544383, 0, 1.5, 0.5, 0.5
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
-4.085083, -4.12604, 0.4051039, 0, -0.5, 0.5, 0.5,
-4.085083, -4.12604, 0.4051039, 1, -0.5, 0.5, 0.5,
-4.085083, -4.12604, 0.4051039, 1, 1.5, 0.5, 0.5,
-4.085083, -4.12604, 0.4051039, 0, 1.5, 0.5, 0.5
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
-3, -3.155611, -4.940655,
3, -3.155611, -4.940655,
-3, -3.155611, -4.940655,
-3, -3.317349, -5.207943,
-2, -3.155611, -4.940655,
-2, -3.317349, -5.207943,
-1, -3.155611, -4.940655,
-1, -3.317349, -5.207943,
0, -3.155611, -4.940655,
0, -3.317349, -5.207943,
1, -3.155611, -4.940655,
1, -3.317349, -5.207943,
2, -3.155611, -4.940655,
2, -3.317349, -5.207943,
3, -3.155611, -4.940655,
3, -3.317349, -5.207943
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
-3, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
-3, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
-3, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
-3, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
-2, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
-2, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
-2, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
-2, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
-1, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
-1, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
-1, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
-1, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
0, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
0, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
0, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
0, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
1, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
1, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
1, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
1, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
2, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
2, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
2, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
2, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5,
3, -3.640826, -5.742518, 0, -0.5, 0.5, 0.5,
3, -3.640826, -5.742518, 1, -0.5, 0.5, 0.5,
3, -3.640826, -5.742518, 1, 1.5, 0.5, 0.5,
3, -3.640826, -5.742518, 0, 1.5, 0.5, 0.5
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
-3.144688, -3, -4.940655,
-3.144688, 3, -4.940655,
-3.144688, -3, -4.940655,
-3.30142, -3, -5.207943,
-3.144688, -2, -4.940655,
-3.30142, -2, -5.207943,
-3.144688, -1, -4.940655,
-3.30142, -1, -5.207943,
-3.144688, 0, -4.940655,
-3.30142, 0, -5.207943,
-3.144688, 1, -4.940655,
-3.30142, 1, -5.207943,
-3.144688, 2, -4.940655,
-3.30142, 2, -5.207943,
-3.144688, 3, -4.940655,
-3.30142, 3, -5.207943
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
-3.614885, -3, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, -3, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, -3, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, -3, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, -2, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, -2, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, -2, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, -2, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, -1, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, -1, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, -1, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, -1, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, 0, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, 0, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, 0, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, 0, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, 1, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, 1, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, 1, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, 1, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, 2, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, 2, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, 2, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, 2, -5.742518, 0, 1.5, 0.5, 0.5,
-3.614885, 3, -5.742518, 0, -0.5, 0.5, 0.5,
-3.614885, 3, -5.742518, 1, -0.5, 0.5, 0.5,
-3.614885, 3, -5.742518, 1, 1.5, 0.5, 0.5,
-3.614885, 3, -5.742518, 0, 1.5, 0.5, 0.5
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
-3.144688, -3.155611, -4,
-3.144688, -3.155611, 4,
-3.144688, -3.155611, -4,
-3.30142, -3.317349, -4,
-3.144688, -3.155611, -2,
-3.30142, -3.317349, -2,
-3.144688, -3.155611, 0,
-3.30142, -3.317349, 0,
-3.144688, -3.155611, 2,
-3.30142, -3.317349, 2,
-3.144688, -3.155611, 4,
-3.30142, -3.317349, 4
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
-3.614885, -3.640826, -4, 0, -0.5, 0.5, 0.5,
-3.614885, -3.640826, -4, 1, -0.5, 0.5, 0.5,
-3.614885, -3.640826, -4, 1, 1.5, 0.5, 0.5,
-3.614885, -3.640826, -4, 0, 1.5, 0.5, 0.5,
-3.614885, -3.640826, -2, 0, -0.5, 0.5, 0.5,
-3.614885, -3.640826, -2, 1, -0.5, 0.5, 0.5,
-3.614885, -3.640826, -2, 1, 1.5, 0.5, 0.5,
-3.614885, -3.640826, -2, 0, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 0, 0, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 0, 1, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 0, 1, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 0, 0, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 2, 0, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 2, 1, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 2, 1, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 2, 0, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 4, 0, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 4, 1, -0.5, 0.5, 0.5,
-3.614885, -3.640826, 4, 1, 1.5, 0.5, 0.5,
-3.614885, -3.640826, 4, 0, 1.5, 0.5, 0.5
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
-3.144688, -3.155611, -4.940655,
-3.144688, 3.31391, -4.940655,
-3.144688, -3.155611, 5.750863,
-3.144688, 3.31391, 5.750863,
-3.144688, -3.155611, -4.940655,
-3.144688, -3.155611, 5.750863,
-3.144688, 3.31391, -4.940655,
-3.144688, 3.31391, 5.750863,
-3.144688, -3.155611, -4.940655,
3.124611, -3.155611, -4.940655,
-3.144688, -3.155611, 5.750863,
3.124611, -3.155611, 5.750863,
-3.144688, 3.31391, -4.940655,
3.124611, 3.31391, -4.940655,
-3.144688, 3.31391, 5.750863,
3.124611, 3.31391, 5.750863,
3.124611, -3.155611, -4.940655,
3.124611, 3.31391, -4.940655,
3.124611, -3.155611, 5.750863,
3.124611, 3.31391, 5.750863,
3.124611, -3.155611, -4.940655,
3.124611, -3.155611, 5.750863,
3.124611, 3.31391, -4.940655,
3.124611, 3.31391, 5.750863
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
var radius = 7.465564;
var distance = 33.21514;
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
mvMatrix.translate( 0.01003838, -0.0791496, -0.4051039 );
mvMatrix.scale( 1.287531, 1.247683, 0.7549829 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21514);
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


