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
-3.238263, -1.05642, -3.38623, 1, 0, 0, 1,
-3.036973, 1.158695, -1.771167, 1, 0.007843138, 0, 1,
-2.824126, -1.059432, -0.8402207, 1, 0.01176471, 0, 1,
-2.786955, -2.816577, -1.86395, 1, 0.01960784, 0, 1,
-2.689298, -0.2359544, -1.553197, 1, 0.02352941, 0, 1,
-2.608076, 1.220271, -1.00835, 1, 0.03137255, 0, 1,
-2.480766, -0.3471595, -1.739896, 1, 0.03529412, 0, 1,
-2.474702, 0.6528659, -1.970384, 1, 0.04313726, 0, 1,
-2.474375, -0.5562489, -1.686721, 1, 0.04705882, 0, 1,
-2.420549, 0.3890469, -0.699869, 1, 0.05490196, 0, 1,
-2.417763, -1.664966, -3.330258, 1, 0.05882353, 0, 1,
-2.323576, -1.097756, -1.534812, 1, 0.06666667, 0, 1,
-2.234266, 0.5619161, -3.183053, 1, 0.07058824, 0, 1,
-2.212196, 0.9652072, 0.5077986, 1, 0.07843138, 0, 1,
-2.186151, 0.1877357, -1.640048, 1, 0.08235294, 0, 1,
-2.182425, 1.483629, -0.3340665, 1, 0.09019608, 0, 1,
-2.178326, 0.6604749, -0.7464491, 1, 0.09411765, 0, 1,
-2.122305, -0.403717, -2.344618, 1, 0.1019608, 0, 1,
-2.107709, -0.2293894, 0.09272524, 1, 0.1098039, 0, 1,
-2.074172, 0.4818391, -1.372337, 1, 0.1137255, 0, 1,
-2.066782, 1.643704, 0.2248437, 1, 0.1215686, 0, 1,
-2.050193, -2.220745, -3.451184, 1, 0.1254902, 0, 1,
-2.041952, -2.181015, -1.949636, 1, 0.1333333, 0, 1,
-2.016212, 0.01352497, -1.912394, 1, 0.1372549, 0, 1,
-2.00541, 2.026907, -0.342165, 1, 0.145098, 0, 1,
-1.979084, -0.9819106, -1.896999, 1, 0.1490196, 0, 1,
-1.966002, -0.4359319, -2.766024, 1, 0.1568628, 0, 1,
-1.959453, -1.712779, -2.028437, 1, 0.1607843, 0, 1,
-1.945322, 0.02431688, -1.551144, 1, 0.1686275, 0, 1,
-1.943175, 1.075857, 0.0577898, 1, 0.172549, 0, 1,
-1.930908, -0.4384236, -2.042145, 1, 0.1803922, 0, 1,
-1.92566, 0.7795085, -2.651885, 1, 0.1843137, 0, 1,
-1.910722, -2.475645, -1.766895, 1, 0.1921569, 0, 1,
-1.908485, -0.4737209, -1.325825, 1, 0.1960784, 0, 1,
-1.888992, 1.002276, -1.509771, 1, 0.2039216, 0, 1,
-1.879426, 1.390305, -0.3140638, 1, 0.2117647, 0, 1,
-1.87833, 0.002589542, -2.560834, 1, 0.2156863, 0, 1,
-1.877061, -0.9867635, -2.827812, 1, 0.2235294, 0, 1,
-1.875356, -1.064321, -1.99219, 1, 0.227451, 0, 1,
-1.869167, 0.1074068, -2.638191, 1, 0.2352941, 0, 1,
-1.865613, 0.02233326, -1.112219, 1, 0.2392157, 0, 1,
-1.849638, 0.9120368, -1.145649, 1, 0.2470588, 0, 1,
-1.84668, -0.08549857, -0.8596686, 1, 0.2509804, 0, 1,
-1.846317, -0.3944328, -3.141389, 1, 0.2588235, 0, 1,
-1.830265, -0.9950884, -3.245377, 1, 0.2627451, 0, 1,
-1.818355, -1.382574, -3.901411, 1, 0.2705882, 0, 1,
-1.807225, -0.5089874, -4.292489, 1, 0.2745098, 0, 1,
-1.7981, 1.078031, -2.323768, 1, 0.282353, 0, 1,
-1.783776, -1.210578, -2.573186, 1, 0.2862745, 0, 1,
-1.78067, 0.5082055, -0.3180777, 1, 0.2941177, 0, 1,
-1.776403, -0.7840849, -2.543803, 1, 0.3019608, 0, 1,
-1.77213, 0.1752989, -2.824348, 1, 0.3058824, 0, 1,
-1.725545, 0.287812, -2.527864, 1, 0.3137255, 0, 1,
-1.712243, -0.08709345, -1.087006, 1, 0.3176471, 0, 1,
-1.705622, 0.1936262, -1.498321, 1, 0.3254902, 0, 1,
-1.694994, -0.8672457, -1.623967, 1, 0.3294118, 0, 1,
-1.692323, 0.5240152, -0.9745604, 1, 0.3372549, 0, 1,
-1.687834, -0.4274135, -1.782411, 1, 0.3411765, 0, 1,
-1.683417, 0.3043304, -0.6434491, 1, 0.3490196, 0, 1,
-1.671798, 0.05072176, -2.200963, 1, 0.3529412, 0, 1,
-1.656681, -0.357524, -0.4259161, 1, 0.3607843, 0, 1,
-1.648477, 0.1124573, -1.966406, 1, 0.3647059, 0, 1,
-1.647287, -0.3699339, -2.032166, 1, 0.372549, 0, 1,
-1.645432, -0.2847138, -2.786359, 1, 0.3764706, 0, 1,
-1.64154, -0.2875807, -2.383113, 1, 0.3843137, 0, 1,
-1.640729, -0.8236209, -1.877904, 1, 0.3882353, 0, 1,
-1.632219, 1.666771, 0.07451952, 1, 0.3960784, 0, 1,
-1.610623, -1.956467, -4.102775, 1, 0.4039216, 0, 1,
-1.604726, -2.045584, -1.351502, 1, 0.4078431, 0, 1,
-1.597668, 0.8083537, -0.7978364, 1, 0.4156863, 0, 1,
-1.592394, 0.7708477, -0.03169672, 1, 0.4196078, 0, 1,
-1.590524, -0.5436329, -2.062944, 1, 0.427451, 0, 1,
-1.588208, 0.1113143, -0.2205657, 1, 0.4313726, 0, 1,
-1.58777, -0.8406366, -1.955263, 1, 0.4392157, 0, 1,
-1.576035, -0.3812646, -0.6654544, 1, 0.4431373, 0, 1,
-1.569762, -1.063433, -0.1750432, 1, 0.4509804, 0, 1,
-1.561183, -0.7093645, -1.528007, 1, 0.454902, 0, 1,
-1.559976, 1.712123, -1.691687, 1, 0.4627451, 0, 1,
-1.549582, -0.3566089, -3.247025, 1, 0.4666667, 0, 1,
-1.535586, -0.06492966, -1.945549, 1, 0.4745098, 0, 1,
-1.51638, 0.3082055, -2.582424, 1, 0.4784314, 0, 1,
-1.515843, -0.1256908, -2.483065, 1, 0.4862745, 0, 1,
-1.513852, 2.088744, -0.9991421, 1, 0.4901961, 0, 1,
-1.513498, 0.0682419, -1.670217, 1, 0.4980392, 0, 1,
-1.507547, 0.3939651, -1.086951, 1, 0.5058824, 0, 1,
-1.507031, -1.656092, -3.565268, 1, 0.509804, 0, 1,
-1.495334, 0.4890284, -1.768504, 1, 0.5176471, 0, 1,
-1.490687, -0.1273846, -0.8636214, 1, 0.5215687, 0, 1,
-1.48854, 0.6328375, -0.7721416, 1, 0.5294118, 0, 1,
-1.477476, -0.8599386, -2.816228, 1, 0.5333334, 0, 1,
-1.472917, -0.6528729, -2.851222, 1, 0.5411765, 0, 1,
-1.47127, 0.6554048, -0.144711, 1, 0.5450981, 0, 1,
-1.466617, 0.4792448, -1.16216, 1, 0.5529412, 0, 1,
-1.462069, -1.835374, -1.803046, 1, 0.5568628, 0, 1,
-1.45864, -0.2916365, -2.440969, 1, 0.5647059, 0, 1,
-1.453759, -0.6512337, -1.95618, 1, 0.5686275, 0, 1,
-1.439542, 0.5983221, -0.9660257, 1, 0.5764706, 0, 1,
-1.432972, -0.7040958, -3.957265, 1, 0.5803922, 0, 1,
-1.407089, 0.123148, -2.517098, 1, 0.5882353, 0, 1,
-1.402946, 0.5303854, -4.173083, 1, 0.5921569, 0, 1,
-1.400434, -0.3324583, -2.733276, 1, 0.6, 0, 1,
-1.399559, 0.02991103, -1.421069, 1, 0.6078432, 0, 1,
-1.396429, -0.1833145, -1.248325, 1, 0.6117647, 0, 1,
-1.387809, 0.3709562, -2.817456, 1, 0.6196079, 0, 1,
-1.371325, -0.24243, -2.000037, 1, 0.6235294, 0, 1,
-1.370862, -0.1520527, -0.6832814, 1, 0.6313726, 0, 1,
-1.370103, 0.8073574, -1.651368, 1, 0.6352941, 0, 1,
-1.370089, 0.3579533, -0.7361456, 1, 0.6431373, 0, 1,
-1.369792, 0.03500377, -1.728791, 1, 0.6470588, 0, 1,
-1.367676, 1.588432, -0.944886, 1, 0.654902, 0, 1,
-1.355023, 1.660127, -1.201019, 1, 0.6588235, 0, 1,
-1.351311, -0.6515049, -3.613108, 1, 0.6666667, 0, 1,
-1.347739, -0.9950005, -2.577948, 1, 0.6705883, 0, 1,
-1.343536, 0.4244473, -1.81707, 1, 0.6784314, 0, 1,
-1.337813, -1.166822, -0.5425702, 1, 0.682353, 0, 1,
-1.330934, 1.077906, -1.016719, 1, 0.6901961, 0, 1,
-1.31672, -1.526437, -1.808089, 1, 0.6941177, 0, 1,
-1.315439, 0.6955495, -2.02257, 1, 0.7019608, 0, 1,
-1.304776, 0.4882505, -2.114855, 1, 0.7098039, 0, 1,
-1.30072, -0.5425069, 0.3852311, 1, 0.7137255, 0, 1,
-1.293018, 0.01787046, -1.94498, 1, 0.7215686, 0, 1,
-1.292434, 0.7637972, -0.1856005, 1, 0.7254902, 0, 1,
-1.291998, 1.340381, -0.3797237, 1, 0.7333333, 0, 1,
-1.281729, 0.4119046, 1.209843, 1, 0.7372549, 0, 1,
-1.268199, 1.424606, -0.6136335, 1, 0.7450981, 0, 1,
-1.267044, -1.139182, -2.80962, 1, 0.7490196, 0, 1,
-1.262698, 0.7513369, -0.4329844, 1, 0.7568628, 0, 1,
-1.253779, -1.54977, 0.9794623, 1, 0.7607843, 0, 1,
-1.253518, 1.67195, -1.421316, 1, 0.7686275, 0, 1,
-1.252463, 0.6159865, -0.6851385, 1, 0.772549, 0, 1,
-1.251158, -0.149378, -2.16755, 1, 0.7803922, 0, 1,
-1.244517, -0.4579767, -0.966053, 1, 0.7843137, 0, 1,
-1.243909, 0.9542595, -1.293633, 1, 0.7921569, 0, 1,
-1.23957, -0.3157427, -0.7010641, 1, 0.7960784, 0, 1,
-1.220773, -0.5622883, -4.641938, 1, 0.8039216, 0, 1,
-1.219213, 0.1319828, -3.427218, 1, 0.8117647, 0, 1,
-1.217199, -0.3711878, 0.1762351, 1, 0.8156863, 0, 1,
-1.214941, -1.30255, -3.911173, 1, 0.8235294, 0, 1,
-1.209478, -0.3173231, -2.616929, 1, 0.827451, 0, 1,
-1.202105, -0.002394646, -0.7712268, 1, 0.8352941, 0, 1,
-1.193703, 0.9649819, -1.787485, 1, 0.8392157, 0, 1,
-1.191316, -0.57789, -1.742236, 1, 0.8470588, 0, 1,
-1.188992, 2.638067, -1.404786, 1, 0.8509804, 0, 1,
-1.18487, -0.5608922, -1.20167, 1, 0.8588235, 0, 1,
-1.182737, 0.721195, -1.597287, 1, 0.8627451, 0, 1,
-1.181096, -1.67822, -2.618623, 1, 0.8705882, 0, 1,
-1.166417, -0.2986319, -1.91228, 1, 0.8745098, 0, 1,
-1.159982, -1.561808, -2.549626, 1, 0.8823529, 0, 1,
-1.159275, -0.0778297, -0.5689081, 1, 0.8862745, 0, 1,
-1.155195, -0.2108309, -1.398819, 1, 0.8941177, 0, 1,
-1.150914, 0.01189098, -1.518747, 1, 0.8980392, 0, 1,
-1.150646, 0.2913393, -2.024663, 1, 0.9058824, 0, 1,
-1.143077, 1.327816, 0.2927556, 1, 0.9137255, 0, 1,
-1.141933, -0.2317082, -3.111588, 1, 0.9176471, 0, 1,
-1.133449, 0.5462546, 0.1123412, 1, 0.9254902, 0, 1,
-1.131821, 0.7984177, -3.247319, 1, 0.9294118, 0, 1,
-1.129741, -0.6203696, -1.603905, 1, 0.9372549, 0, 1,
-1.129403, 0.787183, -1.7659, 1, 0.9411765, 0, 1,
-1.128524, 2.291398, 0.5472261, 1, 0.9490196, 0, 1,
-1.126878, 1.961029, -0.3779964, 1, 0.9529412, 0, 1,
-1.125014, -1.452559, -1.358616, 1, 0.9607843, 0, 1,
-1.108269, -0.5728856, -3.542506, 1, 0.9647059, 0, 1,
-1.093094, 1.828781, 0.1409898, 1, 0.972549, 0, 1,
-1.091753, 1.583046, -1.004408, 1, 0.9764706, 0, 1,
-1.08318, -0.579694, -1.166496, 1, 0.9843137, 0, 1,
-1.078092, 1.270756, -0.5923798, 1, 0.9882353, 0, 1,
-1.072888, -0.2933166, -2.355745, 1, 0.9960784, 0, 1,
-1.070848, 0.09894832, -3.294846, 0.9960784, 1, 0, 1,
-1.07002, -1.336238, -2.38063, 0.9921569, 1, 0, 1,
-1.069442, -0.3520524, -1.421166, 0.9843137, 1, 0, 1,
-1.065927, 0.4636055, -0.6992726, 0.9803922, 1, 0, 1,
-1.06173, 0.6947222, 0.05397005, 0.972549, 1, 0, 1,
-1.057372, -1.337714, -3.646294, 0.9686275, 1, 0, 1,
-1.051232, -0.3038063, -2.520242, 0.9607843, 1, 0, 1,
-1.04623, -0.04447478, -0.8074027, 0.9568627, 1, 0, 1,
-1.044355, -1.156518, -2.334625, 0.9490196, 1, 0, 1,
-1.031757, -0.2994542, -1.53376, 0.945098, 1, 0, 1,
-1.027552, 0.1105246, -1.912165, 0.9372549, 1, 0, 1,
-1.021963, -0.3166676, -2.655405, 0.9333333, 1, 0, 1,
-1.020256, -0.4872462, -0.8318939, 0.9254902, 1, 0, 1,
-1.012331, -1.395634, -2.956496, 0.9215686, 1, 0, 1,
-1.010591, 0.2412198, -2.98707, 0.9137255, 1, 0, 1,
-1.002561, 0.744055, -1.76601, 0.9098039, 1, 0, 1,
-1.000515, 0.6836401, -3.389709, 0.9019608, 1, 0, 1,
-0.9943848, 0.6029058, 0.7927812, 0.8941177, 1, 0, 1,
-0.9867046, 0.3607009, -0.5228837, 0.8901961, 1, 0, 1,
-0.9834538, 0.0772833, -2.129808, 0.8823529, 1, 0, 1,
-0.9810472, -0.3027947, -1.208512, 0.8784314, 1, 0, 1,
-0.9768452, 1.033967, -2.002372, 0.8705882, 1, 0, 1,
-0.9766756, 0.1612293, -2.436275, 0.8666667, 1, 0, 1,
-0.9731808, 1.840176, -0.4755233, 0.8588235, 1, 0, 1,
-0.9729909, -0.813551, -1.770869, 0.854902, 1, 0, 1,
-0.9716803, -1.559545, -3.954735, 0.8470588, 1, 0, 1,
-0.9706442, 0.1720609, -1.327615, 0.8431373, 1, 0, 1,
-0.9659829, 1.078926, -0.2532814, 0.8352941, 1, 0, 1,
-0.9581262, -0.7354569, -2.767835, 0.8313726, 1, 0, 1,
-0.9503839, -0.0500024, -2.338508, 0.8235294, 1, 0, 1,
-0.9481602, 0.1657003, -1.128958, 0.8196079, 1, 0, 1,
-0.9471784, 0.04189731, -0.8363618, 0.8117647, 1, 0, 1,
-0.9460648, 0.7099867, 0.4202315, 0.8078431, 1, 0, 1,
-0.9393199, 1.825075, -0.4013206, 0.8, 1, 0, 1,
-0.9377027, -1.475593, -3.239716, 0.7921569, 1, 0, 1,
-0.9368403, -2.040627, -3.340158, 0.7882353, 1, 0, 1,
-0.934489, -1.19197, -3.117441, 0.7803922, 1, 0, 1,
-0.9322549, 2.055021, 1.348553, 0.7764706, 1, 0, 1,
-0.9322348, -0.4677291, -2.65696, 0.7686275, 1, 0, 1,
-0.9295257, -0.7850605, -1.624962, 0.7647059, 1, 0, 1,
-0.9256366, 0.213261, -1.206264, 0.7568628, 1, 0, 1,
-0.9206659, -0.523452, -1.632805, 0.7529412, 1, 0, 1,
-0.9135184, 0.3132713, -0.3441621, 0.7450981, 1, 0, 1,
-0.9059979, -1.299769, -1.348076, 0.7411765, 1, 0, 1,
-0.9055295, 0.3426554, -1.771034, 0.7333333, 1, 0, 1,
-0.9033599, -0.2078797, -1.412546, 0.7294118, 1, 0, 1,
-0.9019806, 0.01073988, 0.2924763, 0.7215686, 1, 0, 1,
-0.8915733, 1.643315, 0.5070443, 0.7176471, 1, 0, 1,
-0.8913031, -0.1822677, -0.6592029, 0.7098039, 1, 0, 1,
-0.886539, -0.352431, -3.661528, 0.7058824, 1, 0, 1,
-0.8857497, -0.5793428, -2.174175, 0.6980392, 1, 0, 1,
-0.8855603, -0.09273054, -1.031782, 0.6901961, 1, 0, 1,
-0.8839949, 2.507594, -0.4548065, 0.6862745, 1, 0, 1,
-0.8722997, -0.1850851, -0.7843807, 0.6784314, 1, 0, 1,
-0.868551, -0.4208057, -2.572369, 0.6745098, 1, 0, 1,
-0.8618809, 0.9085287, 0.6108096, 0.6666667, 1, 0, 1,
-0.8550956, -0.8159662, -2.222606, 0.6627451, 1, 0, 1,
-0.8549368, 1.185181, 0.01879333, 0.654902, 1, 0, 1,
-0.8488627, -1.241078, -2.317485, 0.6509804, 1, 0, 1,
-0.8435248, 0.2402648, -2.695735, 0.6431373, 1, 0, 1,
-0.8394493, 0.3496714, -1.040808, 0.6392157, 1, 0, 1,
-0.8355933, 0.5348782, -1.027211, 0.6313726, 1, 0, 1,
-0.8318319, -1.578074, -3.348475, 0.627451, 1, 0, 1,
-0.8298021, 0.2928627, -0.428281, 0.6196079, 1, 0, 1,
-0.8231633, -0.1625073, -2.776429, 0.6156863, 1, 0, 1,
-0.8113666, -1.148553, -3.947045, 0.6078432, 1, 0, 1,
-0.7992026, 0.8102759, 0.6972588, 0.6039216, 1, 0, 1,
-0.7885964, 2.68422, 0.7426246, 0.5960785, 1, 0, 1,
-0.787253, -0.9101655, -3.414291, 0.5882353, 1, 0, 1,
-0.7680005, -1.280729, -2.06357, 0.5843138, 1, 0, 1,
-0.7652122, 0.2051932, -1.124798, 0.5764706, 1, 0, 1,
-0.7635859, -0.2330605, -1.309361, 0.572549, 1, 0, 1,
-0.7615157, 0.02904547, -2.003774, 0.5647059, 1, 0, 1,
-0.7612542, 0.2168951, -2.076215, 0.5607843, 1, 0, 1,
-0.7600616, 0.05268098, -1.301679, 0.5529412, 1, 0, 1,
-0.7572346, 0.7378755, 0.5495986, 0.5490196, 1, 0, 1,
-0.7516152, -0.8352534, -2.965191, 0.5411765, 1, 0, 1,
-0.7484822, -1.577754, -2.914369, 0.5372549, 1, 0, 1,
-0.7468925, 1.965532, 0.4250544, 0.5294118, 1, 0, 1,
-0.7411139, -0.05636605, -1.624135, 0.5254902, 1, 0, 1,
-0.7350215, -0.2924125, -1.699861, 0.5176471, 1, 0, 1,
-0.7321566, -1.195761, -2.69275, 0.5137255, 1, 0, 1,
-0.7290286, 0.9556034, -1.626223, 0.5058824, 1, 0, 1,
-0.7255676, -0.1118326, -0.3652645, 0.5019608, 1, 0, 1,
-0.725216, 0.6005929, -1.318725, 0.4941176, 1, 0, 1,
-0.7244892, -0.1577719, -1.617313, 0.4862745, 1, 0, 1,
-0.7236785, 0.5541272, -1.561743, 0.4823529, 1, 0, 1,
-0.7176027, 1.557681, -0.7356652, 0.4745098, 1, 0, 1,
-0.7157915, 0.6258978, -1.797588, 0.4705882, 1, 0, 1,
-0.7156163, 0.5632259, -1.340967, 0.4627451, 1, 0, 1,
-0.7069002, -0.370789, -0.5908065, 0.4588235, 1, 0, 1,
-0.7037827, 2.701464, -0.4597465, 0.4509804, 1, 0, 1,
-0.6992688, 1.063074, -0.4302331, 0.4470588, 1, 0, 1,
-0.6966164, -0.1273235, -1.469463, 0.4392157, 1, 0, 1,
-0.6960772, -2.125328, -3.662434, 0.4352941, 1, 0, 1,
-0.6959591, 0.3307927, -0.5731176, 0.427451, 1, 0, 1,
-0.6922762, 0.3922739, -2.772486, 0.4235294, 1, 0, 1,
-0.6910704, -0.1284428, -2.832622, 0.4156863, 1, 0, 1,
-0.6884938, 0.4636249, -1.699527, 0.4117647, 1, 0, 1,
-0.68581, -0.4461592, -2.324402, 0.4039216, 1, 0, 1,
-0.6827721, -1.076911, -3.019694, 0.3960784, 1, 0, 1,
-0.6816603, 0.1712966, -0.6232597, 0.3921569, 1, 0, 1,
-0.6804658, -0.6822295, -2.796593, 0.3843137, 1, 0, 1,
-0.677794, -0.656899, -1.952938, 0.3803922, 1, 0, 1,
-0.6747038, -1.482718, -1.919758, 0.372549, 1, 0, 1,
-0.6737725, -0.9688362, -1.875997, 0.3686275, 1, 0, 1,
-0.6733303, -1.484328, -1.308501, 0.3607843, 1, 0, 1,
-0.6663139, 1.452405, -0.1748589, 0.3568628, 1, 0, 1,
-0.6643051, 2.328518, -0.3758993, 0.3490196, 1, 0, 1,
-0.6623512, 1.733967, 1.29353, 0.345098, 1, 0, 1,
-0.6605819, 1.781068, 0.3851089, 0.3372549, 1, 0, 1,
-0.653767, -0.01912359, -1.361822, 0.3333333, 1, 0, 1,
-0.6531683, -0.02824595, -1.551651, 0.3254902, 1, 0, 1,
-0.6458527, 0.3533035, -0.255971, 0.3215686, 1, 0, 1,
-0.6435578, 0.8516483, -0.03277505, 0.3137255, 1, 0, 1,
-0.6405943, 0.04981599, -1.950422, 0.3098039, 1, 0, 1,
-0.6335079, 0.6250272, -0.7600582, 0.3019608, 1, 0, 1,
-0.6326445, -1.879088, -3.358905, 0.2941177, 1, 0, 1,
-0.6309577, -0.3015298, -3.076437, 0.2901961, 1, 0, 1,
-0.6272094, 1.072987, 0.1444211, 0.282353, 1, 0, 1,
-0.6253937, -1.545717, -3.970753, 0.2784314, 1, 0, 1,
-0.6242903, 0.8162514, -1.867326, 0.2705882, 1, 0, 1,
-0.6235079, -1.162068, -3.093997, 0.2666667, 1, 0, 1,
-0.6220171, -1.230425, -1.645012, 0.2588235, 1, 0, 1,
-0.6209207, 0.2733042, -1.532022, 0.254902, 1, 0, 1,
-0.6200324, -0.4667636, -1.964452, 0.2470588, 1, 0, 1,
-0.6174521, -1.436786, -4.129344, 0.2431373, 1, 0, 1,
-0.6167052, 1.0938, -0.6357769, 0.2352941, 1, 0, 1,
-0.6161854, 0.8170621, -1.964059, 0.2313726, 1, 0, 1,
-0.6134356, 0.6142243, -0.06065414, 0.2235294, 1, 0, 1,
-0.6117141, -1.606631, -3.127603, 0.2196078, 1, 0, 1,
-0.6104088, -1.21078, -4.42498, 0.2117647, 1, 0, 1,
-0.6094466, 1.038822, 1.988114, 0.2078431, 1, 0, 1,
-0.605359, 0.1440671, -1.524467, 0.2, 1, 0, 1,
-0.6024276, 0.001455089, -1.529353, 0.1921569, 1, 0, 1,
-0.5993665, -0.9246374, -2.916699, 0.1882353, 1, 0, 1,
-0.597755, -0.8142951, -2.895655, 0.1803922, 1, 0, 1,
-0.5960212, -0.8173991, -1.802369, 0.1764706, 1, 0, 1,
-0.5852477, 0.6730646, -1.837082, 0.1686275, 1, 0, 1,
-0.5849773, 0.4071558, -1.257752, 0.1647059, 1, 0, 1,
-0.5788689, 0.3131204, 0.2342336, 0.1568628, 1, 0, 1,
-0.5769269, -0.1848834, -1.872569, 0.1529412, 1, 0, 1,
-0.5759243, -0.1715655, -0.8104212, 0.145098, 1, 0, 1,
-0.5755849, 1.594953, -1.03307, 0.1411765, 1, 0, 1,
-0.5754708, -0.2018586, -2.819835, 0.1333333, 1, 0, 1,
-0.5713024, -0.8753754, -2.225146, 0.1294118, 1, 0, 1,
-0.5709778, -0.08068605, -0.576916, 0.1215686, 1, 0, 1,
-0.5696468, -0.6738853, -1.589284, 0.1176471, 1, 0, 1,
-0.5692632, -0.8022149, -4.16784, 0.1098039, 1, 0, 1,
-0.566739, -1.505685, -3.257321, 0.1058824, 1, 0, 1,
-0.565093, -0.8337135, -3.047196, 0.09803922, 1, 0, 1,
-0.564241, -0.3970725, -3.044498, 0.09019608, 1, 0, 1,
-0.5579469, 1.675177, -1.226372, 0.08627451, 1, 0, 1,
-0.552718, -0.1460997, -2.928067, 0.07843138, 1, 0, 1,
-0.5510417, 0.188622, -0.6250968, 0.07450981, 1, 0, 1,
-0.5415641, -0.5640925, -2.308207, 0.06666667, 1, 0, 1,
-0.5406523, 1.026167, -0.9257649, 0.0627451, 1, 0, 1,
-0.5365936, -0.7086627, -2.86364, 0.05490196, 1, 0, 1,
-0.5333741, -0.4869253, -1.60981, 0.05098039, 1, 0, 1,
-0.5280918, -0.4218826, -1.268471, 0.04313726, 1, 0, 1,
-0.5248934, -1.317253, -1.429233, 0.03921569, 1, 0, 1,
-0.5186784, 1.536457, -0.3856863, 0.03137255, 1, 0, 1,
-0.5180768, 0.1550389, -0.3430431, 0.02745098, 1, 0, 1,
-0.5156578, 0.06762493, -2.256329, 0.01960784, 1, 0, 1,
-0.5137672, 0.09677896, -1.128652, 0.01568628, 1, 0, 1,
-0.5115438, 0.2381233, -1.594371, 0.007843138, 1, 0, 1,
-0.5103267, -1.13995, -3.267157, 0.003921569, 1, 0, 1,
-0.510286, -0.102581, -2.139637, 0, 1, 0.003921569, 1,
-0.5090604, 1.342467, 0.3038425, 0, 1, 0.01176471, 1,
-0.5062845, 0.1496683, -1.950249, 0, 1, 0.01568628, 1,
-0.5040144, 0.725996, 1.833426, 0, 1, 0.02352941, 1,
-0.5022591, 0.3649614, -0.3946141, 0, 1, 0.02745098, 1,
-0.5017806, 1.284521, -0.2104505, 0, 1, 0.03529412, 1,
-0.5005223, -0.227432, -0.8371221, 0, 1, 0.03921569, 1,
-0.4967465, -0.7245971, -0.5322794, 0, 1, 0.04705882, 1,
-0.4887411, 0.1568636, -2.152817, 0, 1, 0.05098039, 1,
-0.4876541, -0.3231551, -0.5771657, 0, 1, 0.05882353, 1,
-0.4874865, -1.446487, -2.801711, 0, 1, 0.0627451, 1,
-0.4854842, -0.8061461, -3.204411, 0, 1, 0.07058824, 1,
-0.4774642, -0.7134427, -2.228526, 0, 1, 0.07450981, 1,
-0.475038, 0.2926224, -0.4029409, 0, 1, 0.08235294, 1,
-0.4730456, 0.2499732, -0.6673283, 0, 1, 0.08627451, 1,
-0.4693533, 2.85381, -0.04897277, 0, 1, 0.09411765, 1,
-0.4679539, 0.3834863, 0.6935764, 0, 1, 0.1019608, 1,
-0.4654163, 0.2317891, -1.237997, 0, 1, 0.1058824, 1,
-0.4638648, -0.4526938, -0.3873477, 0, 1, 0.1137255, 1,
-0.462254, 0.05184002, -1.611623, 0, 1, 0.1176471, 1,
-0.4538905, 0.9643834, -1.570623, 0, 1, 0.1254902, 1,
-0.452336, -0.456678, -0.5643001, 0, 1, 0.1294118, 1,
-0.4440153, 0.1334542, -0.03111758, 0, 1, 0.1372549, 1,
-0.4364778, 0.3137474, -2.378694, 0, 1, 0.1411765, 1,
-0.434794, -1.987992, -3.611748, 0, 1, 0.1490196, 1,
-0.4345392, -0.3616316, -3.128529, 0, 1, 0.1529412, 1,
-0.4324749, -1.684824, -3.506829, 0, 1, 0.1607843, 1,
-0.4288935, -0.3822786, -1.257688, 0, 1, 0.1647059, 1,
-0.4282346, -1.032261, -2.20021, 0, 1, 0.172549, 1,
-0.4260924, -0.5071091, -2.646881, 0, 1, 0.1764706, 1,
-0.4252927, 0.433525, -2.278049, 0, 1, 0.1843137, 1,
-0.4238996, 0.477237, -2.831942, 0, 1, 0.1882353, 1,
-0.4169169, -0.5734235, -3.026695, 0, 1, 0.1960784, 1,
-0.4152364, 0.9741752, 1.515584, 0, 1, 0.2039216, 1,
-0.4139518, -0.08529044, -3.278502, 0, 1, 0.2078431, 1,
-0.4138096, -2.174962, -3.313947, 0, 1, 0.2156863, 1,
-0.4117029, 1.121306, 1.233648, 0, 1, 0.2196078, 1,
-0.4021916, 0.3656451, -0.1977675, 0, 1, 0.227451, 1,
-0.3922547, -0.1538243, -3.647118, 0, 1, 0.2313726, 1,
-0.3908411, 0.4148515, -2.417331, 0, 1, 0.2392157, 1,
-0.3903211, 0.3069738, -1.825065, 0, 1, 0.2431373, 1,
-0.3868204, 1.393153, -1.710544, 0, 1, 0.2509804, 1,
-0.3865293, -0.7244587, -4.219508, 0, 1, 0.254902, 1,
-0.3839614, -0.7397103, -2.652363, 0, 1, 0.2627451, 1,
-0.3808265, -0.4499774, -2.221941, 0, 1, 0.2666667, 1,
-0.3796451, -1.32177, -4.170648, 0, 1, 0.2745098, 1,
-0.3771932, -1.835066, -3.427567, 0, 1, 0.2784314, 1,
-0.3766111, 1.675046, 0.4411522, 0, 1, 0.2862745, 1,
-0.3761143, -0.8692473, -4.020101, 0, 1, 0.2901961, 1,
-0.3705274, -0.311344, -1.719504, 0, 1, 0.2980392, 1,
-0.3682153, -0.6113911, -3.407924, 0, 1, 0.3058824, 1,
-0.3661936, 1.086357, 1.054405, 0, 1, 0.3098039, 1,
-0.3588095, 1.018821, 1.053222, 0, 1, 0.3176471, 1,
-0.3582368, -0.9073527, -0.8917927, 0, 1, 0.3215686, 1,
-0.3579449, 0.2148572, -3.279477, 0, 1, 0.3294118, 1,
-0.3521521, -0.3176172, -2.728383, 0, 1, 0.3333333, 1,
-0.3476506, -0.277472, -2.509161, 0, 1, 0.3411765, 1,
-0.3396063, 1.058193, -0.706284, 0, 1, 0.345098, 1,
-0.3391825, -0.2846668, -4.090922, 0, 1, 0.3529412, 1,
-0.3336251, -0.3958459, -2.658248, 0, 1, 0.3568628, 1,
-0.3324758, 0.1271199, 0.5160912, 0, 1, 0.3647059, 1,
-0.3320246, 0.3957673, -0.7979458, 0, 1, 0.3686275, 1,
-0.3297653, 0.5541473, -1.492296, 0, 1, 0.3764706, 1,
-0.3263668, 0.6015654, -1.390082, 0, 1, 0.3803922, 1,
-0.3262605, -0.3853643, -2.486966, 0, 1, 0.3882353, 1,
-0.3248134, 0.2878201, 0.1728918, 0, 1, 0.3921569, 1,
-0.3242607, -0.9039989, -4.04452, 0, 1, 0.4, 1,
-0.3237188, -0.1907182, -2.215295, 0, 1, 0.4078431, 1,
-0.3193488, 0.4926887, 0.2902042, 0, 1, 0.4117647, 1,
-0.3187959, 0.7605823, 1.370012, 0, 1, 0.4196078, 1,
-0.3181098, 1.239883, -0.4157339, 0, 1, 0.4235294, 1,
-0.3178042, 0.3036926, -0.4001051, 0, 1, 0.4313726, 1,
-0.3125288, 1.53181, 0.06377689, 0, 1, 0.4352941, 1,
-0.3051958, 0.8408054, -1.697529, 0, 1, 0.4431373, 1,
-0.2983014, 1.914393, -0.7488315, 0, 1, 0.4470588, 1,
-0.2971219, 0.607461, -0.5833112, 0, 1, 0.454902, 1,
-0.2953211, -0.3314665, -2.523434, 0, 1, 0.4588235, 1,
-0.2953095, 0.6907815, 0.2232677, 0, 1, 0.4666667, 1,
-0.2933162, -1.734513, -1.870367, 0, 1, 0.4705882, 1,
-0.2900888, 0.5643784, 0.04472695, 0, 1, 0.4784314, 1,
-0.2900451, 0.5597712, -1.356146, 0, 1, 0.4823529, 1,
-0.2876811, 1.798328, 1.012742, 0, 1, 0.4901961, 1,
-0.2865387, -0.2307098, -2.205081, 0, 1, 0.4941176, 1,
-0.285843, 0.2340779, -1.852007, 0, 1, 0.5019608, 1,
-0.2847999, 1.07776, 1.364756, 0, 1, 0.509804, 1,
-0.2836222, 0.2485486, -0.6267861, 0, 1, 0.5137255, 1,
-0.2832752, 0.443681, -1.702311, 0, 1, 0.5215687, 1,
-0.2832462, 0.2875587, -0.4249451, 0, 1, 0.5254902, 1,
-0.2828592, 1.014794, 2.622536, 0, 1, 0.5333334, 1,
-0.2824147, -0.2956812, -3.638823, 0, 1, 0.5372549, 1,
-0.2787443, 1.516947, 0.4975058, 0, 1, 0.5450981, 1,
-0.2782909, -0.4669766, -3.877493, 0, 1, 0.5490196, 1,
-0.2761928, 0.2272518, -0.3093844, 0, 1, 0.5568628, 1,
-0.2758433, -0.1879008, -3.692073, 0, 1, 0.5607843, 1,
-0.2748106, -0.3870864, -2.240293, 0, 1, 0.5686275, 1,
-0.2621778, -0.3623816, -3.824651, 0, 1, 0.572549, 1,
-0.2588253, 0.242127, -1.588768, 0, 1, 0.5803922, 1,
-0.2580525, 0.3925953, -0.7867633, 0, 1, 0.5843138, 1,
-0.2547669, -0.1901719, -1.969633, 0, 1, 0.5921569, 1,
-0.2513418, 0.04313635, -2.574614, 0, 1, 0.5960785, 1,
-0.2503256, 0.3907782, -0.9373494, 0, 1, 0.6039216, 1,
-0.2502045, 0.407696, -1.571472, 0, 1, 0.6117647, 1,
-0.2470644, 0.7953486, -0.6583931, 0, 1, 0.6156863, 1,
-0.2465812, -1.893581, -4.73337, 0, 1, 0.6235294, 1,
-0.2421801, 1.047884, -0.7890372, 0, 1, 0.627451, 1,
-0.2392803, -1.422676, -1.915407, 0, 1, 0.6352941, 1,
-0.2388019, -0.5026284, -1.316111, 0, 1, 0.6392157, 1,
-0.2378717, -0.7598603, -3.626878, 0, 1, 0.6470588, 1,
-0.2346821, 0.3456559, -0.493183, 0, 1, 0.6509804, 1,
-0.2261366, 0.2185373, -0.3807102, 0, 1, 0.6588235, 1,
-0.2260255, -0.2048563, -1.568072, 0, 1, 0.6627451, 1,
-0.2225814, 0.6184431, -1.486238, 0, 1, 0.6705883, 1,
-0.2207534, -0.8858493, -3.064998, 0, 1, 0.6745098, 1,
-0.2179665, 1.176537, 0.2957481, 0, 1, 0.682353, 1,
-0.2164162, 2.074608, -1.067141, 0, 1, 0.6862745, 1,
-0.2147067, 0.7657675, -0.06543735, 0, 1, 0.6941177, 1,
-0.2096867, 0.3865038, 1.231458, 0, 1, 0.7019608, 1,
-0.2071421, 2.223681, -0.3674445, 0, 1, 0.7058824, 1,
-0.2061656, -0.04210791, -1.926315, 0, 1, 0.7137255, 1,
-0.2042128, -0.04502772, -1.86416, 0, 1, 0.7176471, 1,
-0.2039712, 0.5358991, -0.2379541, 0, 1, 0.7254902, 1,
-0.2002001, 0.706718, -0.3896741, 0, 1, 0.7294118, 1,
-0.1995347, -4.125635, -2.385506, 0, 1, 0.7372549, 1,
-0.1913397, -1.401339, -2.766932, 0, 1, 0.7411765, 1,
-0.1769986, 0.3451549, -0.4437531, 0, 1, 0.7490196, 1,
-0.1754101, 0.6321675, -1.259551, 0, 1, 0.7529412, 1,
-0.1674196, 0.6412485, -0.8076798, 0, 1, 0.7607843, 1,
-0.1646454, 0.606479, -0.007068712, 0, 1, 0.7647059, 1,
-0.1523716, -1.029425, -0.6489145, 0, 1, 0.772549, 1,
-0.1504918, -0.6693116, -2.585252, 0, 1, 0.7764706, 1,
-0.147385, 1.460498, -0.8401865, 0, 1, 0.7843137, 1,
-0.1444158, -0.7712264, -1.626588, 0, 1, 0.7882353, 1,
-0.1439296, 0.6881061, -0.7526092, 0, 1, 0.7960784, 1,
-0.1432686, 0.5102195, 0.5403832, 0, 1, 0.8039216, 1,
-0.1414159, -1.335138, -2.485958, 0, 1, 0.8078431, 1,
-0.1356664, 0.02743024, -0.7266179, 0, 1, 0.8156863, 1,
-0.1340443, 0.428547, 1.46239, 0, 1, 0.8196079, 1,
-0.1335836, 1.929397, 1.165533, 0, 1, 0.827451, 1,
-0.1244223, -0.1143101, -2.887546, 0, 1, 0.8313726, 1,
-0.123102, 0.9891759, -0.8457815, 0, 1, 0.8392157, 1,
-0.1226403, -1.8074, -3.537629, 0, 1, 0.8431373, 1,
-0.1196287, 0.15567, -1.825005, 0, 1, 0.8509804, 1,
-0.1180297, -0.1325161, -2.517009, 0, 1, 0.854902, 1,
-0.1160929, 1.977292, 0.3099272, 0, 1, 0.8627451, 1,
-0.1149483, 0.7151572, -1.655303, 0, 1, 0.8666667, 1,
-0.1142977, 0.2723623, -0.3139732, 0, 1, 0.8745098, 1,
-0.1128396, -0.2080622, -3.12262, 0, 1, 0.8784314, 1,
-0.1096336, -0.5961719, -2.284987, 0, 1, 0.8862745, 1,
-0.1093271, 0.4390887, -0.3687121, 0, 1, 0.8901961, 1,
-0.1084976, -0.0986608, -1.820529, 0, 1, 0.8980392, 1,
-0.1071184, 1.663215, -0.327287, 0, 1, 0.9058824, 1,
-0.103536, -0.456217, -2.496386, 0, 1, 0.9098039, 1,
-0.100303, 0.4101402, -1.024742, 0, 1, 0.9176471, 1,
-0.09020026, 0.6342288, -0.236137, 0, 1, 0.9215686, 1,
-0.08687812, -0.5923377, -3.061478, 0, 1, 0.9294118, 1,
-0.0868248, 0.5055587, -1.22504, 0, 1, 0.9333333, 1,
-0.08620403, -0.2208677, -2.4252, 0, 1, 0.9411765, 1,
-0.08557151, 0.2683947, -1.780875, 0, 1, 0.945098, 1,
-0.0824357, -0.3089001, -3.723944, 0, 1, 0.9529412, 1,
-0.08059183, 0.2196406, -1.529236, 0, 1, 0.9568627, 1,
-0.07442909, 0.2850463, 0.1232961, 0, 1, 0.9647059, 1,
-0.0646205, -0.132233, -4.092473, 0, 1, 0.9686275, 1,
-0.06320937, 0.5124248, 0.6359949, 0, 1, 0.9764706, 1,
-0.06239646, -0.1610001, -2.016558, 0, 1, 0.9803922, 1,
-0.06124739, 0.883628, -0.03884118, 0, 1, 0.9882353, 1,
-0.06112903, -0.788378, -4.599433, 0, 1, 0.9921569, 1,
-0.06000561, 0.2468069, -1.550309, 0, 1, 1, 1,
-0.05838628, -0.1943039, -4.969915, 0, 0.9921569, 1, 1,
-0.05263214, -0.4399937, -3.214289, 0, 0.9882353, 1, 1,
-0.05173687, 1.645196, 0.181559, 0, 0.9803922, 1, 1,
-0.04986309, 0.8066795, 1.299191, 0, 0.9764706, 1, 1,
-0.04671718, -0.4017252, -3.884756, 0, 0.9686275, 1, 1,
-0.04597175, -1.16841, -2.378042, 0, 0.9647059, 1, 1,
-0.04156803, -0.5029473, -1.144158, 0, 0.9568627, 1, 1,
-0.04147626, -0.4258746, -4.028595, 0, 0.9529412, 1, 1,
-0.04066039, -1.512893, -3.439086, 0, 0.945098, 1, 1,
-0.04007985, -1.38922, -4.007702, 0, 0.9411765, 1, 1,
-0.03903576, 1.042335, 1.297108, 0, 0.9333333, 1, 1,
-0.03880933, -0.02140049, -1.27081, 0, 0.9294118, 1, 1,
-0.0386547, 1.546984, 1.466715, 0, 0.9215686, 1, 1,
-0.03571022, -0.1292302, -1.564134, 0, 0.9176471, 1, 1,
-0.03216778, 0.3309561, -0.1858662, 0, 0.9098039, 1, 1,
-0.03193503, -0.552591, -5.063834, 0, 0.9058824, 1, 1,
-0.02905838, 0.08443171, 0.7103531, 0, 0.8980392, 1, 1,
-0.02892339, 0.749249, -0.2957669, 0, 0.8901961, 1, 1,
-0.02805102, 0.01107769, -1.425088, 0, 0.8862745, 1, 1,
-0.0229728, 0.01697491, -1.935313, 0, 0.8784314, 1, 1,
-0.01927937, 0.1718425, -1.872285, 0, 0.8745098, 1, 1,
-0.01774121, 1.701293, -1.66501, 0, 0.8666667, 1, 1,
-0.01301764, -1.075235, -2.792454, 0, 0.8627451, 1, 1,
-0.01082292, 1.17818, 0.4369698, 0, 0.854902, 1, 1,
-0.01010196, -1.047663, -4.223117, 0, 0.8509804, 1, 1,
-0.008193421, -1.329229, -4.396312, 0, 0.8431373, 1, 1,
-0.001155911, 0.3483627, 0.1420958, 0, 0.8392157, 1, 1,
0.0002680293, 0.6505283, 0.9983662, 0, 0.8313726, 1, 1,
0.003095393, 0.2900763, -0.388881, 0, 0.827451, 1, 1,
0.003288337, -0.04244475, 3.029532, 0, 0.8196079, 1, 1,
0.004581449, 1.130382, 0.5610232, 0, 0.8156863, 1, 1,
0.004924116, -0.5029088, 3.18159, 0, 0.8078431, 1, 1,
0.0104732, -0.533201, 4.099288, 0, 0.8039216, 1, 1,
0.01250468, 2.134268, 0.5744435, 0, 0.7960784, 1, 1,
0.0144415, -0.4839876, 4.014535, 0, 0.7882353, 1, 1,
0.0178596, 0.03420753, 1.136267, 0, 0.7843137, 1, 1,
0.02357964, 0.3825176, -0.8491482, 0, 0.7764706, 1, 1,
0.02664093, 0.6167098, 0.01220492, 0, 0.772549, 1, 1,
0.0269456, -0.1406109, 2.916744, 0, 0.7647059, 1, 1,
0.03076656, 0.4324454, -1.740082, 0, 0.7607843, 1, 1,
0.03726448, -0.6744961, 2.344533, 0, 0.7529412, 1, 1,
0.03916039, -0.3815962, 2.20117, 0, 0.7490196, 1, 1,
0.03976154, 1.023362, 1.159445, 0, 0.7411765, 1, 1,
0.0438981, -0.4206051, 1.675907, 0, 0.7372549, 1, 1,
0.04431535, 0.6904474, -0.683293, 0, 0.7294118, 1, 1,
0.04487751, -0.004199756, 1.168085, 0, 0.7254902, 1, 1,
0.05566175, 0.623952, 0.9775155, 0, 0.7176471, 1, 1,
0.05741097, -0.236059, 2.414207, 0, 0.7137255, 1, 1,
0.06004338, -1.050169, 2.58277, 0, 0.7058824, 1, 1,
0.0648104, -1.335714, 2.384669, 0, 0.6980392, 1, 1,
0.06713701, 0.1450941, -0.3228388, 0, 0.6941177, 1, 1,
0.06771823, 0.255542, 1.247263, 0, 0.6862745, 1, 1,
0.07082247, 0.8529201, -0.5416023, 0, 0.682353, 1, 1,
0.07610317, 0.2969045, -0.9775238, 0, 0.6745098, 1, 1,
0.07820938, 0.2596457, 1.157834, 0, 0.6705883, 1, 1,
0.07840934, -0.4883983, 3.474909, 0, 0.6627451, 1, 1,
0.07856859, -0.01127279, 3.928088, 0, 0.6588235, 1, 1,
0.08088181, 0.7410632, 0.9623479, 0, 0.6509804, 1, 1,
0.0847968, 0.08681637, 0.1575121, 0, 0.6470588, 1, 1,
0.08527382, -0.7898577, 0.08756461, 0, 0.6392157, 1, 1,
0.08799864, 1.834255, 0.164083, 0, 0.6352941, 1, 1,
0.09044566, -0.2861977, 3.353325, 0, 0.627451, 1, 1,
0.0906589, -0.6455433, 1.470972, 0, 0.6235294, 1, 1,
0.09167759, -1.180505, 2.617574, 0, 0.6156863, 1, 1,
0.09410347, 0.8414017, 0.03294512, 0, 0.6117647, 1, 1,
0.09777847, 1.162582, 0.3618506, 0, 0.6039216, 1, 1,
0.100209, 1.874485, 0.508241, 0, 0.5960785, 1, 1,
0.1046013, 0.1234805, 1.020446, 0, 0.5921569, 1, 1,
0.1056795, -0.8727402, 1.454903, 0, 0.5843138, 1, 1,
0.1164187, -1.256534, 2.385145, 0, 0.5803922, 1, 1,
0.1171162, 1.337996, -1.484459, 0, 0.572549, 1, 1,
0.117353, 1.869255, -1.594036, 0, 0.5686275, 1, 1,
0.1195305, -1.51602, 1.250062, 0, 0.5607843, 1, 1,
0.1200331, 1.061505, 0.1436319, 0, 0.5568628, 1, 1,
0.1207358, 0.7923403, 2.697271, 0, 0.5490196, 1, 1,
0.1266784, 0.09025312, -0.3397918, 0, 0.5450981, 1, 1,
0.1283635, -1.59467, 1.814189, 0, 0.5372549, 1, 1,
0.1339685, -0.7220088, 3.749788, 0, 0.5333334, 1, 1,
0.136325, 0.7719716, -0.2663745, 0, 0.5254902, 1, 1,
0.1376093, -0.3004919, 4.423909, 0, 0.5215687, 1, 1,
0.1425768, 0.9699376, -0.201409, 0, 0.5137255, 1, 1,
0.1462936, 1.011792, 0.1465525, 0, 0.509804, 1, 1,
0.151643, -1.049748, 2.290198, 0, 0.5019608, 1, 1,
0.1564287, -1.666975, 3.72042, 0, 0.4941176, 1, 1,
0.1624905, -0.6035023, 3.782442, 0, 0.4901961, 1, 1,
0.1664953, 2.480889, 0.4598623, 0, 0.4823529, 1, 1,
0.1675229, -0.9512601, 2.508856, 0, 0.4784314, 1, 1,
0.1680833, -0.9259745, 3.945127, 0, 0.4705882, 1, 1,
0.1687467, 0.6664315, 1.187624, 0, 0.4666667, 1, 1,
0.1694286, -0.4784389, 3.476972, 0, 0.4588235, 1, 1,
0.169624, -0.382891, 3.404274, 0, 0.454902, 1, 1,
0.1712644, 0.1869815, 1.608946, 0, 0.4470588, 1, 1,
0.1743243, -0.09942438, 3.002256, 0, 0.4431373, 1, 1,
0.1765328, -1.895979, 4.964532, 0, 0.4352941, 1, 1,
0.1786056, -0.8741561, 2.91318, 0, 0.4313726, 1, 1,
0.1810692, 0.8785174, -0.6288317, 0, 0.4235294, 1, 1,
0.1817449, -0.08132625, 1.232128, 0, 0.4196078, 1, 1,
0.183396, 0.8782738, 0.1765776, 0, 0.4117647, 1, 1,
0.1839453, 0.2268608, 0.3306507, 0, 0.4078431, 1, 1,
0.1896923, -0.3890872, 1.911983, 0, 0.4, 1, 1,
0.1903246, 1.036152, -1.315371, 0, 0.3921569, 1, 1,
0.1935056, 1.259999, 0.7014013, 0, 0.3882353, 1, 1,
0.2004687, -0.2785499, 1.796209, 0, 0.3803922, 1, 1,
0.2004944, -0.6270305, 3.179853, 0, 0.3764706, 1, 1,
0.2017609, 0.7860965, 0.7633797, 0, 0.3686275, 1, 1,
0.206753, 0.565838, -0.5207674, 0, 0.3647059, 1, 1,
0.2094924, -0.8843911, 1.353186, 0, 0.3568628, 1, 1,
0.2158899, 0.5276595, -0.5029774, 0, 0.3529412, 1, 1,
0.2179373, -0.6742337, 3.502854, 0, 0.345098, 1, 1,
0.2186681, 0.4126849, 2.444568, 0, 0.3411765, 1, 1,
0.2186995, 0.6879081, 0.2019085, 0, 0.3333333, 1, 1,
0.2190441, -0.2810739, 2.049409, 0, 0.3294118, 1, 1,
0.2191447, 0.5128751, 0.3035339, 0, 0.3215686, 1, 1,
0.2211557, -0.2463154, 4.280156, 0, 0.3176471, 1, 1,
0.2266928, 0.908758, -0.8747531, 0, 0.3098039, 1, 1,
0.2280171, -0.3130214, 1.996848, 0, 0.3058824, 1, 1,
0.2284369, 0.1992634, -0.6851274, 0, 0.2980392, 1, 1,
0.2336771, 0.591264, 0.7110813, 0, 0.2901961, 1, 1,
0.2374229, -1.76325, 3.767762, 0, 0.2862745, 1, 1,
0.2378254, -0.7809792, 1.919487, 0, 0.2784314, 1, 1,
0.2385222, -0.7427503, 2.255036, 0, 0.2745098, 1, 1,
0.2474125, 0.1832557, 2.049066, 0, 0.2666667, 1, 1,
0.2637146, 1.040112, 1.569918, 0, 0.2627451, 1, 1,
0.2639862, 1.040144, 0.8375671, 0, 0.254902, 1, 1,
0.2644802, 1.163831, 1.151581, 0, 0.2509804, 1, 1,
0.2665212, 0.03575779, 0.2772027, 0, 0.2431373, 1, 1,
0.2680934, -0.441128, 4.017207, 0, 0.2392157, 1, 1,
0.2696956, 0.2619105, -1.641814, 0, 0.2313726, 1, 1,
0.2697332, 1.037756, -0.1993213, 0, 0.227451, 1, 1,
0.2699516, -0.3322116, 2.827103, 0, 0.2196078, 1, 1,
0.2717849, -1.286146, 3.73835, 0, 0.2156863, 1, 1,
0.2757321, 1.74675, -1.522981, 0, 0.2078431, 1, 1,
0.2775941, -0.2117276, 4.443623, 0, 0.2039216, 1, 1,
0.2799997, -1.111583, 5.249693, 0, 0.1960784, 1, 1,
0.2809504, 1.12188, -0.4200823, 0, 0.1882353, 1, 1,
0.2824849, 0.8521602, -0.6615097, 0, 0.1843137, 1, 1,
0.2829968, -0.9948919, 2.35454, 0, 0.1764706, 1, 1,
0.2840145, -0.9380987, 2.696476, 0, 0.172549, 1, 1,
0.2846386, -1.931948, 4.790236, 0, 0.1647059, 1, 1,
0.2853892, -1.261072, 2.682899, 0, 0.1607843, 1, 1,
0.287157, 0.7024702, 1.317294, 0, 0.1529412, 1, 1,
0.3074709, 0.3531378, 1.402377, 0, 0.1490196, 1, 1,
0.311053, -1.976679, 3.720925, 0, 0.1411765, 1, 1,
0.3116704, 0.3209578, 0.2930415, 0, 0.1372549, 1, 1,
0.3138679, 0.4308263, 0.2666814, 0, 0.1294118, 1, 1,
0.321136, -0.6455809, 2.478405, 0, 0.1254902, 1, 1,
0.3221136, -1.900713, 0.8828635, 0, 0.1176471, 1, 1,
0.328906, -0.4358532, 3.957682, 0, 0.1137255, 1, 1,
0.3291585, -0.3660391, 1.63698, 0, 0.1058824, 1, 1,
0.3354893, -0.7452117, 1.327162, 0, 0.09803922, 1, 1,
0.340364, 0.5958973, -0.1983287, 0, 0.09411765, 1, 1,
0.3480366, -2.302592, 4.508495, 0, 0.08627451, 1, 1,
0.3494762, -0.5647789, 0.5761055, 0, 0.08235294, 1, 1,
0.3496173, 0.8770899, 1.276983, 0, 0.07450981, 1, 1,
0.3504023, -0.8520153, 3.749928, 0, 0.07058824, 1, 1,
0.3559332, -0.3662308, 2.875789, 0, 0.0627451, 1, 1,
0.357357, 0.321412, 0.2539119, 0, 0.05882353, 1, 1,
0.3605098, -0.8488078, 4.630982, 0, 0.05098039, 1, 1,
0.3646947, 1.718357, 0.570915, 0, 0.04705882, 1, 1,
0.3650549, -0.8640001, 2.817095, 0, 0.03921569, 1, 1,
0.3673797, -0.8514509, 3.12041, 0, 0.03529412, 1, 1,
0.3685033, 2.590868, -0.687084, 0, 0.02745098, 1, 1,
0.3851067, 0.5165045, 1.569395, 0, 0.02352941, 1, 1,
0.385882, 0.006066984, 1.355156, 0, 0.01568628, 1, 1,
0.3923464, -0.4075232, 3.565027, 0, 0.01176471, 1, 1,
0.3985751, -0.4116978, 2.156286, 0, 0.003921569, 1, 1,
0.4058307, -0.8996132, 3.045476, 0.003921569, 0, 1, 1,
0.4066571, -0.3506699, 1.316398, 0.007843138, 0, 1, 1,
0.4281858, 0.2663965, 1.615377, 0.01568628, 0, 1, 1,
0.4309621, 0.8490211, 1.280638, 0.01960784, 0, 1, 1,
0.4334894, 1.79808, -1.758566, 0.02745098, 0, 1, 1,
0.4458021, 0.6802371, 1.085907, 0.03137255, 0, 1, 1,
0.4464888, -0.5551936, 2.340691, 0.03921569, 0, 1, 1,
0.4492658, -0.6670338, 2.290576, 0.04313726, 0, 1, 1,
0.4503857, -1.822586, 3.102827, 0.05098039, 0, 1, 1,
0.4527048, 1.233426, 1.3677, 0.05490196, 0, 1, 1,
0.4528936, -1.196934, 2.444565, 0.0627451, 0, 1, 1,
0.4599641, 0.4395602, 0.7811731, 0.06666667, 0, 1, 1,
0.4607416, -0.03164867, 0.432797, 0.07450981, 0, 1, 1,
0.4613219, -0.9046884, 3.068775, 0.07843138, 0, 1, 1,
0.4625941, 0.147667, 0.9916367, 0.08627451, 0, 1, 1,
0.4628591, 0.6322501, 0.9064527, 0.09019608, 0, 1, 1,
0.4672882, -0.2272383, 0.1512548, 0.09803922, 0, 1, 1,
0.4694455, -0.0009342088, 4.67291, 0.1058824, 0, 1, 1,
0.4722081, 0.04959046, 0.8580564, 0.1098039, 0, 1, 1,
0.4725819, 0.594727, 1.292828, 0.1176471, 0, 1, 1,
0.4780494, -0.0950638, 1.159447, 0.1215686, 0, 1, 1,
0.4801418, 1.258024, 2.03412, 0.1294118, 0, 1, 1,
0.4864883, 1.506418, -0.5919997, 0.1333333, 0, 1, 1,
0.4940694, -0.09746719, 1.571308, 0.1411765, 0, 1, 1,
0.4993877, -0.8202158, 3.077474, 0.145098, 0, 1, 1,
0.5013697, 1.586299, 0.4353677, 0.1529412, 0, 1, 1,
0.5023464, -0.3979612, 1.165511, 0.1568628, 0, 1, 1,
0.5040215, 0.2008888, 1.012747, 0.1647059, 0, 1, 1,
0.5059009, -0.4217602, 2.857732, 0.1686275, 0, 1, 1,
0.509432, 0.4331679, 0.0873598, 0.1764706, 0, 1, 1,
0.5143656, 1.762696, 0.8354228, 0.1803922, 0, 1, 1,
0.5152842, -0.7811648, 2.013137, 0.1882353, 0, 1, 1,
0.5195671, 1.200369, 2.42605, 0.1921569, 0, 1, 1,
0.5223979, 1.040561, 0.1118643, 0.2, 0, 1, 1,
0.5254218, -0.4546937, 3.509861, 0.2078431, 0, 1, 1,
0.5281848, 1.463164, 0.9397483, 0.2117647, 0, 1, 1,
0.5287525, 0.1481019, 2.053885, 0.2196078, 0, 1, 1,
0.5338542, 0.7918243, 1.304404, 0.2235294, 0, 1, 1,
0.53871, 0.01201835, -0.3378564, 0.2313726, 0, 1, 1,
0.5392333, -0.2234357, 2.48924, 0.2352941, 0, 1, 1,
0.541284, -1.074985, 1.256791, 0.2431373, 0, 1, 1,
0.5417462, -1.57218, 2.065313, 0.2470588, 0, 1, 1,
0.5467699, 1.15235, -0.88907, 0.254902, 0, 1, 1,
0.5470614, -0.04682229, 0.9986851, 0.2588235, 0, 1, 1,
0.5553249, -0.5243309, 1.491916, 0.2666667, 0, 1, 1,
0.5581357, 0.065416, 1.792959, 0.2705882, 0, 1, 1,
0.5643797, -0.1972423, 1.998512, 0.2784314, 0, 1, 1,
0.5725347, -1.064073, 3.374971, 0.282353, 0, 1, 1,
0.5739554, -2.698853, 2.388068, 0.2901961, 0, 1, 1,
0.5845243, 1.331558, 0.8796861, 0.2941177, 0, 1, 1,
0.5853395, 1.038777, 0.3510432, 0.3019608, 0, 1, 1,
0.5910645, -0.956469, 2.921233, 0.3098039, 0, 1, 1,
0.5911714, -2.127741, 4.024835, 0.3137255, 0, 1, 1,
0.5955092, 0.1526502, 0.85468, 0.3215686, 0, 1, 1,
0.6083795, 0.8910473, 1.179856, 0.3254902, 0, 1, 1,
0.612776, -0.3713622, 3.85894, 0.3333333, 0, 1, 1,
0.6132773, 0.6082107, -0.4902631, 0.3372549, 0, 1, 1,
0.6229205, -0.2586828, 3.284837, 0.345098, 0, 1, 1,
0.6259634, 0.18116, 0.8841832, 0.3490196, 0, 1, 1,
0.6299845, 0.5254377, 0.578056, 0.3568628, 0, 1, 1,
0.6314192, -2.979075, 1.971542, 0.3607843, 0, 1, 1,
0.6341156, -0.1186047, 1.692162, 0.3686275, 0, 1, 1,
0.6353493, 1.113695, 1.97411, 0.372549, 0, 1, 1,
0.6404817, 0.1146979, 0.7662291, 0.3803922, 0, 1, 1,
0.6443387, -0.8997703, 2.524239, 0.3843137, 0, 1, 1,
0.6517109, 1.741654, -0.5310577, 0.3921569, 0, 1, 1,
0.6530024, -0.1875328, 2.268989, 0.3960784, 0, 1, 1,
0.6536003, 1.644216, -1.648955, 0.4039216, 0, 1, 1,
0.6540145, 0.06951068, 1.902746, 0.4117647, 0, 1, 1,
0.6567922, 0.2933368, 0.3584087, 0.4156863, 0, 1, 1,
0.6572072, -0.6579334, 1.50691, 0.4235294, 0, 1, 1,
0.6596603, 0.2223789, 2.55494, 0.427451, 0, 1, 1,
0.6613111, 0.3450795, 0.6717201, 0.4352941, 0, 1, 1,
0.6615345, -0.9887676, 2.673717, 0.4392157, 0, 1, 1,
0.6659667, 0.4593631, 0.5416204, 0.4470588, 0, 1, 1,
0.666378, -1.247147, 3.222698, 0.4509804, 0, 1, 1,
0.6692892, 0.6172578, 0.1706258, 0.4588235, 0, 1, 1,
0.6708191, 1.070146, 0.05180696, 0.4627451, 0, 1, 1,
0.671743, 1.565074, -0.9705362, 0.4705882, 0, 1, 1,
0.672647, 0.3623046, -0.05149245, 0.4745098, 0, 1, 1,
0.6780167, -1.49398, -0.1166706, 0.4823529, 0, 1, 1,
0.6791586, 1.96078, 1.512333, 0.4862745, 0, 1, 1,
0.6802366, -1.699133, 2.734491, 0.4941176, 0, 1, 1,
0.6805452, -0.09654826, 1.65435, 0.5019608, 0, 1, 1,
0.6810112, 0.08811958, -0.4374942, 0.5058824, 0, 1, 1,
0.6859544, -0.6155627, 3.699748, 0.5137255, 0, 1, 1,
0.6889782, -1.169091, 1.798731, 0.5176471, 0, 1, 1,
0.6959352, 0.3818015, 1.593733, 0.5254902, 0, 1, 1,
0.6985618, -0.01453245, 2.040298, 0.5294118, 0, 1, 1,
0.70462, -0.4551409, 1.483484, 0.5372549, 0, 1, 1,
0.7057623, 0.7610861, -0.02624203, 0.5411765, 0, 1, 1,
0.7095999, 0.206854, 2.679433, 0.5490196, 0, 1, 1,
0.7120233, 0.2760586, 0.987049, 0.5529412, 0, 1, 1,
0.7120532, 0.66381, -1.19683, 0.5607843, 0, 1, 1,
0.713108, 0.2026291, 1.65172, 0.5647059, 0, 1, 1,
0.7161909, -0.9730965, 2.695194, 0.572549, 0, 1, 1,
0.7185704, -0.1389703, 2.485325, 0.5764706, 0, 1, 1,
0.7194187, -0.624437, 1.849784, 0.5843138, 0, 1, 1,
0.7228782, 0.1778011, -0.8956466, 0.5882353, 0, 1, 1,
0.7245097, -0.09278674, 1.180029, 0.5960785, 0, 1, 1,
0.735331, -0.8184501, 3.050611, 0.6039216, 0, 1, 1,
0.7448439, -0.2504877, 2.540441, 0.6078432, 0, 1, 1,
0.7468051, 0.4922291, 0.669777, 0.6156863, 0, 1, 1,
0.7468148, 1.75265, -0.1752703, 0.6196079, 0, 1, 1,
0.7478171, -0.5654583, 2.764431, 0.627451, 0, 1, 1,
0.7480059, 1.231288, 1.488219, 0.6313726, 0, 1, 1,
0.7505971, -0.8313962, 2.80589, 0.6392157, 0, 1, 1,
0.7531746, 0.7748948, 1.437559, 0.6431373, 0, 1, 1,
0.7532159, -0.09725884, 2.577062, 0.6509804, 0, 1, 1,
0.7655622, -0.5326205, 0.622607, 0.654902, 0, 1, 1,
0.7665707, 0.4174097, 1.25957, 0.6627451, 0, 1, 1,
0.7670261, -1.001336, 1.222066, 0.6666667, 0, 1, 1,
0.7720649, -0.330723, -0.3479932, 0.6745098, 0, 1, 1,
0.7727771, 0.7185724, 2.204267, 0.6784314, 0, 1, 1,
0.7762653, -0.2860609, 4.252147, 0.6862745, 0, 1, 1,
0.7768434, 0.3556549, -0.06617787, 0.6901961, 0, 1, 1,
0.7817738, -0.2634567, 2.263517, 0.6980392, 0, 1, 1,
0.784112, 0.627297, -0.3322558, 0.7058824, 0, 1, 1,
0.7870501, 0.8055834, 1.880333, 0.7098039, 0, 1, 1,
0.7875378, 0.2329796, 0.5353314, 0.7176471, 0, 1, 1,
0.7896383, 0.1392892, 1.486629, 0.7215686, 0, 1, 1,
0.7928226, 0.976187, 1.191845, 0.7294118, 0, 1, 1,
0.7930486, 1.782471, 0.7560984, 0.7333333, 0, 1, 1,
0.8023285, 0.755479, -0.01355048, 0.7411765, 0, 1, 1,
0.805141, 0.1300685, 2.255444, 0.7450981, 0, 1, 1,
0.8114116, -0.5671095, 3.38604, 0.7529412, 0, 1, 1,
0.8135911, 1.123472, 0.4847174, 0.7568628, 0, 1, 1,
0.8159627, 0.2643786, 0.5873223, 0.7647059, 0, 1, 1,
0.8202708, 0.6497394, 1.176632, 0.7686275, 0, 1, 1,
0.8239766, -1.666935, 2.199095, 0.7764706, 0, 1, 1,
0.8282701, 1.464344, 0.7739156, 0.7803922, 0, 1, 1,
0.8378619, -0.9763426, 0.5294891, 0.7882353, 0, 1, 1,
0.8381259, 1.78524, -1.803675, 0.7921569, 0, 1, 1,
0.8391745, 0.09453667, 1.448442, 0.8, 0, 1, 1,
0.8444606, 1.964243, 0.2041232, 0.8078431, 0, 1, 1,
0.8471147, -1.4268, 0.8216451, 0.8117647, 0, 1, 1,
0.8492084, -0.6887322, 0.3752594, 0.8196079, 0, 1, 1,
0.852657, 0.6069055, 0.2376203, 0.8235294, 0, 1, 1,
0.8611007, 1.739689, -0.1142483, 0.8313726, 0, 1, 1,
0.8644373, 1.059375, 0.2537681, 0.8352941, 0, 1, 1,
0.8674538, 0.754333, 1.637814, 0.8431373, 0, 1, 1,
0.8779207, -0.2581657, 2.332668, 0.8470588, 0, 1, 1,
0.8789196, -0.9492623, 1.832697, 0.854902, 0, 1, 1,
0.8798787, -0.3566441, 1.409323, 0.8588235, 0, 1, 1,
0.8839176, -1.620234, 2.383582, 0.8666667, 0, 1, 1,
0.8887132, -1.936138, 3.180967, 0.8705882, 0, 1, 1,
0.8927217, 1.848292, -0.01294298, 0.8784314, 0, 1, 1,
0.897136, 1.308445, -0.0327494, 0.8823529, 0, 1, 1,
0.9000504, -1.265518, 2.784948, 0.8901961, 0, 1, 1,
0.9004352, 1.197013, -0.01671996, 0.8941177, 0, 1, 1,
0.9047112, -0.1953131, -0.6040717, 0.9019608, 0, 1, 1,
0.9114925, -1.139064, 2.503994, 0.9098039, 0, 1, 1,
0.9200464, -1.889761, 2.100737, 0.9137255, 0, 1, 1,
0.9294444, -1.5992, 3.317674, 0.9215686, 0, 1, 1,
0.9312965, 0.567711, 2.962241, 0.9254902, 0, 1, 1,
0.9404454, -0.4621308, 2.629629, 0.9333333, 0, 1, 1,
0.9409962, -0.1847994, 0.291537, 0.9372549, 0, 1, 1,
0.9488242, 0.6531398, 2.363861, 0.945098, 0, 1, 1,
0.9505236, 0.2514574, 0.1659222, 0.9490196, 0, 1, 1,
0.9557377, -1.245403, 4.809713, 0.9568627, 0, 1, 1,
0.9568648, -1.937297, 2.541642, 0.9607843, 0, 1, 1,
0.9574, -0.5820047, 1.44848, 0.9686275, 0, 1, 1,
0.9604846, 1.144367, 2.445932, 0.972549, 0, 1, 1,
0.9656184, 0.3202277, 0.5965467, 0.9803922, 0, 1, 1,
0.9770923, -1.448315, 3.299871, 0.9843137, 0, 1, 1,
0.984929, 0.1763229, 0.9873263, 0.9921569, 0, 1, 1,
0.9902068, -0.4182633, 1.525726, 0.9960784, 0, 1, 1,
0.9951125, 0.6798696, 2.233946, 1, 0, 0.9960784, 1,
1.004475, 0.7909063, 0.8540722, 1, 0, 0.9882353, 1,
1.004618, 0.5621101, 2.284837, 1, 0, 0.9843137, 1,
1.01092, -0.382399, 1.125431, 1, 0, 0.9764706, 1,
1.011237, -0.101572, 0.8857026, 1, 0, 0.972549, 1,
1.012982, -0.1052291, 2.165128, 1, 0, 0.9647059, 1,
1.019068, -0.2860192, 1.916202, 1, 0, 0.9607843, 1,
1.0206, 0.1975854, 1.659623, 1, 0, 0.9529412, 1,
1.039331, 0.3815531, 0.1521854, 1, 0, 0.9490196, 1,
1.052814, -0.1680786, 1.334484, 1, 0, 0.9411765, 1,
1.054938, 1.449675, 0.5908723, 1, 0, 0.9372549, 1,
1.055383, 0.662865, -0.05686916, 1, 0, 0.9294118, 1,
1.057744, -0.5525847, 1.778687, 1, 0, 0.9254902, 1,
1.059223, -0.1633105, 2.878102, 1, 0, 0.9176471, 1,
1.062222, 0.1038114, 1.268117, 1, 0, 0.9137255, 1,
1.071411, 0.5926929, 2.570486, 1, 0, 0.9058824, 1,
1.080569, -0.3455164, 3.174431, 1, 0, 0.9019608, 1,
1.082009, -2.110316, 2.90541, 1, 0, 0.8941177, 1,
1.082919, 2.470247, -0.1215842, 1, 0, 0.8862745, 1,
1.082965, 0.5096719, 2.444071, 1, 0, 0.8823529, 1,
1.089769, -0.08168434, 2.414567, 1, 0, 0.8745098, 1,
1.095616, 1.370638, 0.5466597, 1, 0, 0.8705882, 1,
1.101179, 0.1619127, 1.065907, 1, 0, 0.8627451, 1,
1.106682, -0.3201268, 2.540534, 1, 0, 0.8588235, 1,
1.110319, -2.750226, 2.484203, 1, 0, 0.8509804, 1,
1.113666, -0.343837, 3.180054, 1, 0, 0.8470588, 1,
1.116119, 0.2957171, -0.1952416, 1, 0, 0.8392157, 1,
1.119769, -0.4691198, 3.215884, 1, 0, 0.8352941, 1,
1.130379, -1.468403, 2.541366, 1, 0, 0.827451, 1,
1.131552, -2.33622, 2.151402, 1, 0, 0.8235294, 1,
1.1318, 0.005683881, 1.544533, 1, 0, 0.8156863, 1,
1.133068, 0.9355922, 1.980186, 1, 0, 0.8117647, 1,
1.135679, 0.01596241, 1.635422, 1, 0, 0.8039216, 1,
1.146149, 0.148022, 2.306812, 1, 0, 0.7960784, 1,
1.15027, 1.664495, 0.7144606, 1, 0, 0.7921569, 1,
1.155952, 0.4420021, 0.2902797, 1, 0, 0.7843137, 1,
1.160106, -0.8054757, 1.950749, 1, 0, 0.7803922, 1,
1.160347, -1.988195, 0.8240625, 1, 0, 0.772549, 1,
1.176104, 0.3376809, 2.292981, 1, 0, 0.7686275, 1,
1.176906, 0.2546065, 2.426357, 1, 0, 0.7607843, 1,
1.178823, 1.793335, 0.5288466, 1, 0, 0.7568628, 1,
1.191635, 0.04191902, 1.012843, 1, 0, 0.7490196, 1,
1.199466, 1.520602, -0.3302412, 1, 0, 0.7450981, 1,
1.20081, -0.7135317, 2.77724, 1, 0, 0.7372549, 1,
1.204376, -1.297471, 1.853598, 1, 0, 0.7333333, 1,
1.205254, -0.1772909, 0.06928528, 1, 0, 0.7254902, 1,
1.20982, -0.9921911, 2.181799, 1, 0, 0.7215686, 1,
1.211394, -0.5509074, 2.748212, 1, 0, 0.7137255, 1,
1.215022, -0.7194083, 2.426603, 1, 0, 0.7098039, 1,
1.217282, -0.3579996, 1.929906, 1, 0, 0.7019608, 1,
1.228319, -0.2126715, 0.9373417, 1, 0, 0.6941177, 1,
1.235379, -0.2642225, 1.123131, 1, 0, 0.6901961, 1,
1.239614, -1.577927, 2.77192, 1, 0, 0.682353, 1,
1.239674, -3.0356, 1.144336, 1, 0, 0.6784314, 1,
1.24804, -0.6570785, 2.542141, 1, 0, 0.6705883, 1,
1.252699, -0.9459671, 3.439628, 1, 0, 0.6666667, 1,
1.254664, 0.4915508, 0.3830722, 1, 0, 0.6588235, 1,
1.257535, -1.066908, 2.59333, 1, 0, 0.654902, 1,
1.284179, 0.8883666, 1.289979, 1, 0, 0.6470588, 1,
1.284567, -0.831296, 1.53966, 1, 0, 0.6431373, 1,
1.284773, -1.499776, 1.337549, 1, 0, 0.6352941, 1,
1.294267, 0.8113439, 1.304639, 1, 0, 0.6313726, 1,
1.294526, 0.7415782, 0.8782298, 1, 0, 0.6235294, 1,
1.295601, -0.7323524, 2.359126, 1, 0, 0.6196079, 1,
1.307131, -0.8681798, 0.93104, 1, 0, 0.6117647, 1,
1.309128, -0.3615077, 0.8452733, 1, 0, 0.6078432, 1,
1.312014, 2.16749, -0.824317, 1, 0, 0.6, 1,
1.326018, -1.534432, 2.756788, 1, 0, 0.5921569, 1,
1.326841, 0.5962667, 1.343374, 1, 0, 0.5882353, 1,
1.331883, -1.068995, 1.475057, 1, 0, 0.5803922, 1,
1.359361, 0.4088577, 1.635088, 1, 0, 0.5764706, 1,
1.359481, -0.1600922, 1.517436, 1, 0, 0.5686275, 1,
1.367451, -0.7454947, 2.418217, 1, 0, 0.5647059, 1,
1.367734, 1.219008, 1.085835, 1, 0, 0.5568628, 1,
1.37281, -0.294119, 2.822843, 1, 0, 0.5529412, 1,
1.380331, 0.4078596, 0.338957, 1, 0, 0.5450981, 1,
1.388647, 1.359735, 1.655109, 1, 0, 0.5411765, 1,
1.388818, -0.4613899, 1.186123, 1, 0, 0.5333334, 1,
1.392533, -1.247944, 1.71546, 1, 0, 0.5294118, 1,
1.393942, 0.7062676, 0.9168406, 1, 0, 0.5215687, 1,
1.401215, 0.9063159, 2.060955, 1, 0, 0.5176471, 1,
1.403899, -1.684829, 4.004753, 1, 0, 0.509804, 1,
1.404044, 0.09789111, 1.24545, 1, 0, 0.5058824, 1,
1.409773, 0.4108937, 2.738804, 1, 0, 0.4980392, 1,
1.419817, -0.335208, 1.734945, 1, 0, 0.4901961, 1,
1.426954, 0.5306714, 0.4796104, 1, 0, 0.4862745, 1,
1.429733, 0.6487567, 1.608592, 1, 0, 0.4784314, 1,
1.443771, 0.8030406, 2.029976, 1, 0, 0.4745098, 1,
1.45093, 0.3825803, 0.3375983, 1, 0, 0.4666667, 1,
1.454986, 1.778192, 1.652457, 1, 0, 0.4627451, 1,
1.45672, -0.7106056, 1.520674, 1, 0, 0.454902, 1,
1.460189, -0.8463781, 1.272782, 1, 0, 0.4509804, 1,
1.462323, 1.453231, 1.116906, 1, 0, 0.4431373, 1,
1.469271, 0.4478439, 1.202909, 1, 0, 0.4392157, 1,
1.470407, 0.06125499, 2.58143, 1, 0, 0.4313726, 1,
1.474316, -1.15098, 2.057095, 1, 0, 0.427451, 1,
1.496029, -1.224878, 1.481818, 1, 0, 0.4196078, 1,
1.504362, -0.7074096, 3.316442, 1, 0, 0.4156863, 1,
1.511169, -0.5903473, 0.7491967, 1, 0, 0.4078431, 1,
1.531688, 0.7356374, 1.216632, 1, 0, 0.4039216, 1,
1.536071, -0.5160716, 0.5654473, 1, 0, 0.3960784, 1,
1.538822, -0.7305716, 1.872777, 1, 0, 0.3882353, 1,
1.542202, -0.4178241, 0.1767823, 1, 0, 0.3843137, 1,
1.550572, -0.5238918, 1.701509, 1, 0, 0.3764706, 1,
1.557898, 2.613543, -0.552372, 1, 0, 0.372549, 1,
1.557899, -0.1571594, 2.810077, 1, 0, 0.3647059, 1,
1.562358, -0.5698788, 1.179315, 1, 0, 0.3607843, 1,
1.580622, -0.2187445, 0.3047288, 1, 0, 0.3529412, 1,
1.614181, -0.1965834, 1.047522, 1, 0, 0.3490196, 1,
1.617076, 0.2947737, 2.246445, 1, 0, 0.3411765, 1,
1.627851, 0.3268323, 1.041798, 1, 0, 0.3372549, 1,
1.642704, -1.204697, 3.144891, 1, 0, 0.3294118, 1,
1.645972, -1.677402, 1.832645, 1, 0, 0.3254902, 1,
1.646152, -1.165846, 1.051534, 1, 0, 0.3176471, 1,
1.649213, -1.780177, 1.717356, 1, 0, 0.3137255, 1,
1.653468, -1.690191, 0.9392441, 1, 0, 0.3058824, 1,
1.659606, -0.1909885, 2.440522, 1, 0, 0.2980392, 1,
1.66772, 0.6451619, 0.8694445, 1, 0, 0.2941177, 1,
1.673666, -0.01488489, 1.692273, 1, 0, 0.2862745, 1,
1.67816, -0.2929477, 2.259484, 1, 0, 0.282353, 1,
1.68459, -1.617535, 2.995083, 1, 0, 0.2745098, 1,
1.690134, -0.4422465, 1.781552, 1, 0, 0.2705882, 1,
1.693086, -0.399683, 1.734383, 1, 0, 0.2627451, 1,
1.693957, -1.339021, 4.444707, 1, 0, 0.2588235, 1,
1.698164, -1.312363, 4.128296, 1, 0, 0.2509804, 1,
1.703475, -0.6767646, 1.198507, 1, 0, 0.2470588, 1,
1.7076, 0.1725314, 1.894757, 1, 0, 0.2392157, 1,
1.740505, 0.237081, 0.1286425, 1, 0, 0.2352941, 1,
1.746361, -1.57621, 2.244632, 1, 0, 0.227451, 1,
1.780938, -0.1013024, 1.320045, 1, 0, 0.2235294, 1,
1.784293, 0.7574471, 0.5612757, 1, 0, 0.2156863, 1,
1.78744, 0.04313136, 0.2871587, 1, 0, 0.2117647, 1,
1.797166, -1.323325, 2.211298, 1, 0, 0.2039216, 1,
1.829879, 0.002601405, 3.201826, 1, 0, 0.1960784, 1,
1.83755, -0.3994974, 1.510846, 1, 0, 0.1921569, 1,
1.859882, 1.589882, -0.598176, 1, 0, 0.1843137, 1,
1.861189, 0.7387407, 2.506369, 1, 0, 0.1803922, 1,
1.861459, 0.6181698, 0.1419482, 1, 0, 0.172549, 1,
1.862452, 0.1556757, 1.252921, 1, 0, 0.1686275, 1,
1.880883, -0.5832529, 2.137088, 1, 0, 0.1607843, 1,
1.890823, 0.6434084, -0.5552883, 1, 0, 0.1568628, 1,
1.947183, -0.4111094, 0.9811948, 1, 0, 0.1490196, 1,
1.948697, 1.828935, 0.9800609, 1, 0, 0.145098, 1,
1.94872, -0.08525141, 1.93724, 1, 0, 0.1372549, 1,
1.959783, -0.8743578, 2.821988, 1, 0, 0.1333333, 1,
1.986459, 0.6200212, 2.193545, 1, 0, 0.1254902, 1,
2.002239, -0.5103672, 2.573494, 1, 0, 0.1215686, 1,
2.014009, 1.379037, 0.5117588, 1, 0, 0.1137255, 1,
2.029271, 1.272156, 1.525948, 1, 0, 0.1098039, 1,
2.037851, -0.5289742, 2.002908, 1, 0, 0.1019608, 1,
2.125588, 0.8920979, 0.8275334, 1, 0, 0.09411765, 1,
2.155209, -0.1711985, 2.240214, 1, 0, 0.09019608, 1,
2.170709, -1.273266, 1.767626, 1, 0, 0.08235294, 1,
2.17571, -1.331562, 3.711055, 1, 0, 0.07843138, 1,
2.278014, 1.09593, 0.7193654, 1, 0, 0.07058824, 1,
2.30753, 2.226428, 2.074913, 1, 0, 0.06666667, 1,
2.337976, 0.4427042, 0.7794171, 1, 0, 0.05882353, 1,
2.380336, 2.342984, 1.922716, 1, 0, 0.05490196, 1,
2.396931, 0.8430357, 2.605923, 1, 0, 0.04705882, 1,
2.417397, -0.1752772, 2.091542, 1, 0, 0.04313726, 1,
2.491377, 0.08098442, 1.852171, 1, 0, 0.03529412, 1,
2.549246, -0.4950878, 1.332495, 1, 0, 0.03137255, 1,
2.660806, 0.4445835, 1.3327, 1, 0, 0.02352941, 1,
3.071443, 1.486507, 1.042969, 1, 0, 0.01960784, 1,
3.106867, -0.6209153, 0.494456, 1, 0, 0.01176471, 1,
3.45105, 0.08673339, -0.5324593, 1, 0, 0.007843138, 1
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
0.1063933, -5.30865, -6.811977, 0, -0.5, 0.5, 0.5,
0.1063933, -5.30865, -6.811977, 1, -0.5, 0.5, 0.5,
0.1063933, -5.30865, -6.811977, 1, 1.5, 0.5, 0.5,
0.1063933, -5.30865, -6.811977, 0, 1.5, 0.5, 0.5
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
-4.372102, -0.6359122, -6.811977, 0, -0.5, 0.5, 0.5,
-4.372102, -0.6359122, -6.811977, 1, -0.5, 0.5, 0.5,
-4.372102, -0.6359122, -6.811977, 1, 1.5, 0.5, 0.5,
-4.372102, -0.6359122, -6.811977, 0, 1.5, 0.5, 0.5
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
-4.372102, -5.30865, 0.0929296, 0, -0.5, 0.5, 0.5,
-4.372102, -5.30865, 0.0929296, 1, -0.5, 0.5, 0.5,
-4.372102, -5.30865, 0.0929296, 1, 1.5, 0.5, 0.5,
-4.372102, -5.30865, 0.0929296, 0, 1.5, 0.5, 0.5
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
-3, -4.230326, -5.218537,
3, -4.230326, -5.218537,
-3, -4.230326, -5.218537,
-3, -4.410047, -5.48411,
-2, -4.230326, -5.218537,
-2, -4.410047, -5.48411,
-1, -4.230326, -5.218537,
-1, -4.410047, -5.48411,
0, -4.230326, -5.218537,
0, -4.410047, -5.48411,
1, -4.230326, -5.218537,
1, -4.410047, -5.48411,
2, -4.230326, -5.218537,
2, -4.410047, -5.48411,
3, -4.230326, -5.218537,
3, -4.410047, -5.48411
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
-3, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
-3, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
-3, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
-3, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
-2, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
-2, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
-2, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
-2, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
-1, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
-1, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
-1, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
-1, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
0, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
0, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
0, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
0, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
1, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
1, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
1, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
1, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
2, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
2, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
2, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
2, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5,
3, -4.769488, -6.015257, 0, -0.5, 0.5, 0.5,
3, -4.769488, -6.015257, 1, -0.5, 0.5, 0.5,
3, -4.769488, -6.015257, 1, 1.5, 0.5, 0.5,
3, -4.769488, -6.015257, 0, 1.5, 0.5, 0.5
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
-3.338603, -4, -5.218537,
-3.338603, 2, -5.218537,
-3.338603, -4, -5.218537,
-3.510853, -4, -5.48411,
-3.338603, -3, -5.218537,
-3.510853, -3, -5.48411,
-3.338603, -2, -5.218537,
-3.510853, -2, -5.48411,
-3.338603, -1, -5.218537,
-3.510853, -1, -5.48411,
-3.338603, 0, -5.218537,
-3.510853, 0, -5.48411,
-3.338603, 1, -5.218537,
-3.510853, 1, -5.48411,
-3.338603, 2, -5.218537,
-3.510853, 2, -5.48411
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
-3.855353, -4, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, -4, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, -4, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, -4, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, -3, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, -3, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, -3, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, -3, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, -2, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, -2, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, -2, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, -2, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, -1, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, -1, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, -1, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, -1, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, 0, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, 0, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, 0, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, 0, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, 1, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, 1, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, 1, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, 1, -6.015257, 0, 1.5, 0.5, 0.5,
-3.855353, 2, -6.015257, 0, -0.5, 0.5, 0.5,
-3.855353, 2, -6.015257, 1, -0.5, 0.5, 0.5,
-3.855353, 2, -6.015257, 1, 1.5, 0.5, 0.5,
-3.855353, 2, -6.015257, 0, 1.5, 0.5, 0.5
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
-3.338603, -4.230326, -4,
-3.338603, -4.230326, 4,
-3.338603, -4.230326, -4,
-3.510853, -4.410047, -4,
-3.338603, -4.230326, -2,
-3.510853, -4.410047, -2,
-3.338603, -4.230326, 0,
-3.510853, -4.410047, 0,
-3.338603, -4.230326, 2,
-3.510853, -4.410047, 2,
-3.338603, -4.230326, 4,
-3.510853, -4.410047, 4
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
-3.855353, -4.769488, -4, 0, -0.5, 0.5, 0.5,
-3.855353, -4.769488, -4, 1, -0.5, 0.5, 0.5,
-3.855353, -4.769488, -4, 1, 1.5, 0.5, 0.5,
-3.855353, -4.769488, -4, 0, 1.5, 0.5, 0.5,
-3.855353, -4.769488, -2, 0, -0.5, 0.5, 0.5,
-3.855353, -4.769488, -2, 1, -0.5, 0.5, 0.5,
-3.855353, -4.769488, -2, 1, 1.5, 0.5, 0.5,
-3.855353, -4.769488, -2, 0, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 0, 0, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 0, 1, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 0, 1, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 0, 0, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 2, 0, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 2, 1, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 2, 1, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 2, 0, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 4, 0, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 4, 1, -0.5, 0.5, 0.5,
-3.855353, -4.769488, 4, 1, 1.5, 0.5, 0.5,
-3.855353, -4.769488, 4, 0, 1.5, 0.5, 0.5
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
-3.338603, -4.230326, -5.218537,
-3.338603, 2.958502, -5.218537,
-3.338603, -4.230326, 5.404397,
-3.338603, 2.958502, 5.404397,
-3.338603, -4.230326, -5.218537,
-3.338603, -4.230326, 5.404397,
-3.338603, 2.958502, -5.218537,
-3.338603, 2.958502, 5.404397,
-3.338603, -4.230326, -5.218537,
3.55139, -4.230326, -5.218537,
-3.338603, -4.230326, 5.404397,
3.55139, -4.230326, 5.404397,
-3.338603, 2.958502, -5.218537,
3.55139, 2.958502, -5.218537,
-3.338603, 2.958502, 5.404397,
3.55139, 2.958502, 5.404397,
3.55139, -4.230326, -5.218537,
3.55139, 2.958502, -5.218537,
3.55139, -4.230326, 5.404397,
3.55139, 2.958502, 5.404397,
3.55139, -4.230326, -5.218537,
3.55139, -4.230326, 5.404397,
3.55139, 2.958502, -5.218537,
3.55139, 2.958502, 5.404397
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
var radius = 7.774837;
var distance = 34.59113;
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
mvMatrix.translate( -0.1063933, 0.6359122, -0.0929296 );
mvMatrix.scale( 1.220075, 1.169357, 0.7913357 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59113);
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
2-chloro-4-trichloro<-read.table("2-chloro-4-trichloro.xyz")
```

```
## Error in read.table("2-chloro-4-trichloro.xyz"): no lines available in input
```

```r
x<-2-chloro-4-trichloro$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
y<-2-chloro-4-trichloro$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
z<-2-chloro-4-trichloro$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
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
-3.238263, -1.05642, -3.38623, 0, 0, 1, 1, 1,
-3.036973, 1.158695, -1.771167, 1, 0, 0, 1, 1,
-2.824126, -1.059432, -0.8402207, 1, 0, 0, 1, 1,
-2.786955, -2.816577, -1.86395, 1, 0, 0, 1, 1,
-2.689298, -0.2359544, -1.553197, 1, 0, 0, 1, 1,
-2.608076, 1.220271, -1.00835, 1, 0, 0, 1, 1,
-2.480766, -0.3471595, -1.739896, 0, 0, 0, 1, 1,
-2.474702, 0.6528659, -1.970384, 0, 0, 0, 1, 1,
-2.474375, -0.5562489, -1.686721, 0, 0, 0, 1, 1,
-2.420549, 0.3890469, -0.699869, 0, 0, 0, 1, 1,
-2.417763, -1.664966, -3.330258, 0, 0, 0, 1, 1,
-2.323576, -1.097756, -1.534812, 0, 0, 0, 1, 1,
-2.234266, 0.5619161, -3.183053, 0, 0, 0, 1, 1,
-2.212196, 0.9652072, 0.5077986, 1, 1, 1, 1, 1,
-2.186151, 0.1877357, -1.640048, 1, 1, 1, 1, 1,
-2.182425, 1.483629, -0.3340665, 1, 1, 1, 1, 1,
-2.178326, 0.6604749, -0.7464491, 1, 1, 1, 1, 1,
-2.122305, -0.403717, -2.344618, 1, 1, 1, 1, 1,
-2.107709, -0.2293894, 0.09272524, 1, 1, 1, 1, 1,
-2.074172, 0.4818391, -1.372337, 1, 1, 1, 1, 1,
-2.066782, 1.643704, 0.2248437, 1, 1, 1, 1, 1,
-2.050193, -2.220745, -3.451184, 1, 1, 1, 1, 1,
-2.041952, -2.181015, -1.949636, 1, 1, 1, 1, 1,
-2.016212, 0.01352497, -1.912394, 1, 1, 1, 1, 1,
-2.00541, 2.026907, -0.342165, 1, 1, 1, 1, 1,
-1.979084, -0.9819106, -1.896999, 1, 1, 1, 1, 1,
-1.966002, -0.4359319, -2.766024, 1, 1, 1, 1, 1,
-1.959453, -1.712779, -2.028437, 1, 1, 1, 1, 1,
-1.945322, 0.02431688, -1.551144, 0, 0, 1, 1, 1,
-1.943175, 1.075857, 0.0577898, 1, 0, 0, 1, 1,
-1.930908, -0.4384236, -2.042145, 1, 0, 0, 1, 1,
-1.92566, 0.7795085, -2.651885, 1, 0, 0, 1, 1,
-1.910722, -2.475645, -1.766895, 1, 0, 0, 1, 1,
-1.908485, -0.4737209, -1.325825, 1, 0, 0, 1, 1,
-1.888992, 1.002276, -1.509771, 0, 0, 0, 1, 1,
-1.879426, 1.390305, -0.3140638, 0, 0, 0, 1, 1,
-1.87833, 0.002589542, -2.560834, 0, 0, 0, 1, 1,
-1.877061, -0.9867635, -2.827812, 0, 0, 0, 1, 1,
-1.875356, -1.064321, -1.99219, 0, 0, 0, 1, 1,
-1.869167, 0.1074068, -2.638191, 0, 0, 0, 1, 1,
-1.865613, 0.02233326, -1.112219, 0, 0, 0, 1, 1,
-1.849638, 0.9120368, -1.145649, 1, 1, 1, 1, 1,
-1.84668, -0.08549857, -0.8596686, 1, 1, 1, 1, 1,
-1.846317, -0.3944328, -3.141389, 1, 1, 1, 1, 1,
-1.830265, -0.9950884, -3.245377, 1, 1, 1, 1, 1,
-1.818355, -1.382574, -3.901411, 1, 1, 1, 1, 1,
-1.807225, -0.5089874, -4.292489, 1, 1, 1, 1, 1,
-1.7981, 1.078031, -2.323768, 1, 1, 1, 1, 1,
-1.783776, -1.210578, -2.573186, 1, 1, 1, 1, 1,
-1.78067, 0.5082055, -0.3180777, 1, 1, 1, 1, 1,
-1.776403, -0.7840849, -2.543803, 1, 1, 1, 1, 1,
-1.77213, 0.1752989, -2.824348, 1, 1, 1, 1, 1,
-1.725545, 0.287812, -2.527864, 1, 1, 1, 1, 1,
-1.712243, -0.08709345, -1.087006, 1, 1, 1, 1, 1,
-1.705622, 0.1936262, -1.498321, 1, 1, 1, 1, 1,
-1.694994, -0.8672457, -1.623967, 1, 1, 1, 1, 1,
-1.692323, 0.5240152, -0.9745604, 0, 0, 1, 1, 1,
-1.687834, -0.4274135, -1.782411, 1, 0, 0, 1, 1,
-1.683417, 0.3043304, -0.6434491, 1, 0, 0, 1, 1,
-1.671798, 0.05072176, -2.200963, 1, 0, 0, 1, 1,
-1.656681, -0.357524, -0.4259161, 1, 0, 0, 1, 1,
-1.648477, 0.1124573, -1.966406, 1, 0, 0, 1, 1,
-1.647287, -0.3699339, -2.032166, 0, 0, 0, 1, 1,
-1.645432, -0.2847138, -2.786359, 0, 0, 0, 1, 1,
-1.64154, -0.2875807, -2.383113, 0, 0, 0, 1, 1,
-1.640729, -0.8236209, -1.877904, 0, 0, 0, 1, 1,
-1.632219, 1.666771, 0.07451952, 0, 0, 0, 1, 1,
-1.610623, -1.956467, -4.102775, 0, 0, 0, 1, 1,
-1.604726, -2.045584, -1.351502, 0, 0, 0, 1, 1,
-1.597668, 0.8083537, -0.7978364, 1, 1, 1, 1, 1,
-1.592394, 0.7708477, -0.03169672, 1, 1, 1, 1, 1,
-1.590524, -0.5436329, -2.062944, 1, 1, 1, 1, 1,
-1.588208, 0.1113143, -0.2205657, 1, 1, 1, 1, 1,
-1.58777, -0.8406366, -1.955263, 1, 1, 1, 1, 1,
-1.576035, -0.3812646, -0.6654544, 1, 1, 1, 1, 1,
-1.569762, -1.063433, -0.1750432, 1, 1, 1, 1, 1,
-1.561183, -0.7093645, -1.528007, 1, 1, 1, 1, 1,
-1.559976, 1.712123, -1.691687, 1, 1, 1, 1, 1,
-1.549582, -0.3566089, -3.247025, 1, 1, 1, 1, 1,
-1.535586, -0.06492966, -1.945549, 1, 1, 1, 1, 1,
-1.51638, 0.3082055, -2.582424, 1, 1, 1, 1, 1,
-1.515843, -0.1256908, -2.483065, 1, 1, 1, 1, 1,
-1.513852, 2.088744, -0.9991421, 1, 1, 1, 1, 1,
-1.513498, 0.0682419, -1.670217, 1, 1, 1, 1, 1,
-1.507547, 0.3939651, -1.086951, 0, 0, 1, 1, 1,
-1.507031, -1.656092, -3.565268, 1, 0, 0, 1, 1,
-1.495334, 0.4890284, -1.768504, 1, 0, 0, 1, 1,
-1.490687, -0.1273846, -0.8636214, 1, 0, 0, 1, 1,
-1.48854, 0.6328375, -0.7721416, 1, 0, 0, 1, 1,
-1.477476, -0.8599386, -2.816228, 1, 0, 0, 1, 1,
-1.472917, -0.6528729, -2.851222, 0, 0, 0, 1, 1,
-1.47127, 0.6554048, -0.144711, 0, 0, 0, 1, 1,
-1.466617, 0.4792448, -1.16216, 0, 0, 0, 1, 1,
-1.462069, -1.835374, -1.803046, 0, 0, 0, 1, 1,
-1.45864, -0.2916365, -2.440969, 0, 0, 0, 1, 1,
-1.453759, -0.6512337, -1.95618, 0, 0, 0, 1, 1,
-1.439542, 0.5983221, -0.9660257, 0, 0, 0, 1, 1,
-1.432972, -0.7040958, -3.957265, 1, 1, 1, 1, 1,
-1.407089, 0.123148, -2.517098, 1, 1, 1, 1, 1,
-1.402946, 0.5303854, -4.173083, 1, 1, 1, 1, 1,
-1.400434, -0.3324583, -2.733276, 1, 1, 1, 1, 1,
-1.399559, 0.02991103, -1.421069, 1, 1, 1, 1, 1,
-1.396429, -0.1833145, -1.248325, 1, 1, 1, 1, 1,
-1.387809, 0.3709562, -2.817456, 1, 1, 1, 1, 1,
-1.371325, -0.24243, -2.000037, 1, 1, 1, 1, 1,
-1.370862, -0.1520527, -0.6832814, 1, 1, 1, 1, 1,
-1.370103, 0.8073574, -1.651368, 1, 1, 1, 1, 1,
-1.370089, 0.3579533, -0.7361456, 1, 1, 1, 1, 1,
-1.369792, 0.03500377, -1.728791, 1, 1, 1, 1, 1,
-1.367676, 1.588432, -0.944886, 1, 1, 1, 1, 1,
-1.355023, 1.660127, -1.201019, 1, 1, 1, 1, 1,
-1.351311, -0.6515049, -3.613108, 1, 1, 1, 1, 1,
-1.347739, -0.9950005, -2.577948, 0, 0, 1, 1, 1,
-1.343536, 0.4244473, -1.81707, 1, 0, 0, 1, 1,
-1.337813, -1.166822, -0.5425702, 1, 0, 0, 1, 1,
-1.330934, 1.077906, -1.016719, 1, 0, 0, 1, 1,
-1.31672, -1.526437, -1.808089, 1, 0, 0, 1, 1,
-1.315439, 0.6955495, -2.02257, 1, 0, 0, 1, 1,
-1.304776, 0.4882505, -2.114855, 0, 0, 0, 1, 1,
-1.30072, -0.5425069, 0.3852311, 0, 0, 0, 1, 1,
-1.293018, 0.01787046, -1.94498, 0, 0, 0, 1, 1,
-1.292434, 0.7637972, -0.1856005, 0, 0, 0, 1, 1,
-1.291998, 1.340381, -0.3797237, 0, 0, 0, 1, 1,
-1.281729, 0.4119046, 1.209843, 0, 0, 0, 1, 1,
-1.268199, 1.424606, -0.6136335, 0, 0, 0, 1, 1,
-1.267044, -1.139182, -2.80962, 1, 1, 1, 1, 1,
-1.262698, 0.7513369, -0.4329844, 1, 1, 1, 1, 1,
-1.253779, -1.54977, 0.9794623, 1, 1, 1, 1, 1,
-1.253518, 1.67195, -1.421316, 1, 1, 1, 1, 1,
-1.252463, 0.6159865, -0.6851385, 1, 1, 1, 1, 1,
-1.251158, -0.149378, -2.16755, 1, 1, 1, 1, 1,
-1.244517, -0.4579767, -0.966053, 1, 1, 1, 1, 1,
-1.243909, 0.9542595, -1.293633, 1, 1, 1, 1, 1,
-1.23957, -0.3157427, -0.7010641, 1, 1, 1, 1, 1,
-1.220773, -0.5622883, -4.641938, 1, 1, 1, 1, 1,
-1.219213, 0.1319828, -3.427218, 1, 1, 1, 1, 1,
-1.217199, -0.3711878, 0.1762351, 1, 1, 1, 1, 1,
-1.214941, -1.30255, -3.911173, 1, 1, 1, 1, 1,
-1.209478, -0.3173231, -2.616929, 1, 1, 1, 1, 1,
-1.202105, -0.002394646, -0.7712268, 1, 1, 1, 1, 1,
-1.193703, 0.9649819, -1.787485, 0, 0, 1, 1, 1,
-1.191316, -0.57789, -1.742236, 1, 0, 0, 1, 1,
-1.188992, 2.638067, -1.404786, 1, 0, 0, 1, 1,
-1.18487, -0.5608922, -1.20167, 1, 0, 0, 1, 1,
-1.182737, 0.721195, -1.597287, 1, 0, 0, 1, 1,
-1.181096, -1.67822, -2.618623, 1, 0, 0, 1, 1,
-1.166417, -0.2986319, -1.91228, 0, 0, 0, 1, 1,
-1.159982, -1.561808, -2.549626, 0, 0, 0, 1, 1,
-1.159275, -0.0778297, -0.5689081, 0, 0, 0, 1, 1,
-1.155195, -0.2108309, -1.398819, 0, 0, 0, 1, 1,
-1.150914, 0.01189098, -1.518747, 0, 0, 0, 1, 1,
-1.150646, 0.2913393, -2.024663, 0, 0, 0, 1, 1,
-1.143077, 1.327816, 0.2927556, 0, 0, 0, 1, 1,
-1.141933, -0.2317082, -3.111588, 1, 1, 1, 1, 1,
-1.133449, 0.5462546, 0.1123412, 1, 1, 1, 1, 1,
-1.131821, 0.7984177, -3.247319, 1, 1, 1, 1, 1,
-1.129741, -0.6203696, -1.603905, 1, 1, 1, 1, 1,
-1.129403, 0.787183, -1.7659, 1, 1, 1, 1, 1,
-1.128524, 2.291398, 0.5472261, 1, 1, 1, 1, 1,
-1.126878, 1.961029, -0.3779964, 1, 1, 1, 1, 1,
-1.125014, -1.452559, -1.358616, 1, 1, 1, 1, 1,
-1.108269, -0.5728856, -3.542506, 1, 1, 1, 1, 1,
-1.093094, 1.828781, 0.1409898, 1, 1, 1, 1, 1,
-1.091753, 1.583046, -1.004408, 1, 1, 1, 1, 1,
-1.08318, -0.579694, -1.166496, 1, 1, 1, 1, 1,
-1.078092, 1.270756, -0.5923798, 1, 1, 1, 1, 1,
-1.072888, -0.2933166, -2.355745, 1, 1, 1, 1, 1,
-1.070848, 0.09894832, -3.294846, 1, 1, 1, 1, 1,
-1.07002, -1.336238, -2.38063, 0, 0, 1, 1, 1,
-1.069442, -0.3520524, -1.421166, 1, 0, 0, 1, 1,
-1.065927, 0.4636055, -0.6992726, 1, 0, 0, 1, 1,
-1.06173, 0.6947222, 0.05397005, 1, 0, 0, 1, 1,
-1.057372, -1.337714, -3.646294, 1, 0, 0, 1, 1,
-1.051232, -0.3038063, -2.520242, 1, 0, 0, 1, 1,
-1.04623, -0.04447478, -0.8074027, 0, 0, 0, 1, 1,
-1.044355, -1.156518, -2.334625, 0, 0, 0, 1, 1,
-1.031757, -0.2994542, -1.53376, 0, 0, 0, 1, 1,
-1.027552, 0.1105246, -1.912165, 0, 0, 0, 1, 1,
-1.021963, -0.3166676, -2.655405, 0, 0, 0, 1, 1,
-1.020256, -0.4872462, -0.8318939, 0, 0, 0, 1, 1,
-1.012331, -1.395634, -2.956496, 0, 0, 0, 1, 1,
-1.010591, 0.2412198, -2.98707, 1, 1, 1, 1, 1,
-1.002561, 0.744055, -1.76601, 1, 1, 1, 1, 1,
-1.000515, 0.6836401, -3.389709, 1, 1, 1, 1, 1,
-0.9943848, 0.6029058, 0.7927812, 1, 1, 1, 1, 1,
-0.9867046, 0.3607009, -0.5228837, 1, 1, 1, 1, 1,
-0.9834538, 0.0772833, -2.129808, 1, 1, 1, 1, 1,
-0.9810472, -0.3027947, -1.208512, 1, 1, 1, 1, 1,
-0.9768452, 1.033967, -2.002372, 1, 1, 1, 1, 1,
-0.9766756, 0.1612293, -2.436275, 1, 1, 1, 1, 1,
-0.9731808, 1.840176, -0.4755233, 1, 1, 1, 1, 1,
-0.9729909, -0.813551, -1.770869, 1, 1, 1, 1, 1,
-0.9716803, -1.559545, -3.954735, 1, 1, 1, 1, 1,
-0.9706442, 0.1720609, -1.327615, 1, 1, 1, 1, 1,
-0.9659829, 1.078926, -0.2532814, 1, 1, 1, 1, 1,
-0.9581262, -0.7354569, -2.767835, 1, 1, 1, 1, 1,
-0.9503839, -0.0500024, -2.338508, 0, 0, 1, 1, 1,
-0.9481602, 0.1657003, -1.128958, 1, 0, 0, 1, 1,
-0.9471784, 0.04189731, -0.8363618, 1, 0, 0, 1, 1,
-0.9460648, 0.7099867, 0.4202315, 1, 0, 0, 1, 1,
-0.9393199, 1.825075, -0.4013206, 1, 0, 0, 1, 1,
-0.9377027, -1.475593, -3.239716, 1, 0, 0, 1, 1,
-0.9368403, -2.040627, -3.340158, 0, 0, 0, 1, 1,
-0.934489, -1.19197, -3.117441, 0, 0, 0, 1, 1,
-0.9322549, 2.055021, 1.348553, 0, 0, 0, 1, 1,
-0.9322348, -0.4677291, -2.65696, 0, 0, 0, 1, 1,
-0.9295257, -0.7850605, -1.624962, 0, 0, 0, 1, 1,
-0.9256366, 0.213261, -1.206264, 0, 0, 0, 1, 1,
-0.9206659, -0.523452, -1.632805, 0, 0, 0, 1, 1,
-0.9135184, 0.3132713, -0.3441621, 1, 1, 1, 1, 1,
-0.9059979, -1.299769, -1.348076, 1, 1, 1, 1, 1,
-0.9055295, 0.3426554, -1.771034, 1, 1, 1, 1, 1,
-0.9033599, -0.2078797, -1.412546, 1, 1, 1, 1, 1,
-0.9019806, 0.01073988, 0.2924763, 1, 1, 1, 1, 1,
-0.8915733, 1.643315, 0.5070443, 1, 1, 1, 1, 1,
-0.8913031, -0.1822677, -0.6592029, 1, 1, 1, 1, 1,
-0.886539, -0.352431, -3.661528, 1, 1, 1, 1, 1,
-0.8857497, -0.5793428, -2.174175, 1, 1, 1, 1, 1,
-0.8855603, -0.09273054, -1.031782, 1, 1, 1, 1, 1,
-0.8839949, 2.507594, -0.4548065, 1, 1, 1, 1, 1,
-0.8722997, -0.1850851, -0.7843807, 1, 1, 1, 1, 1,
-0.868551, -0.4208057, -2.572369, 1, 1, 1, 1, 1,
-0.8618809, 0.9085287, 0.6108096, 1, 1, 1, 1, 1,
-0.8550956, -0.8159662, -2.222606, 1, 1, 1, 1, 1,
-0.8549368, 1.185181, 0.01879333, 0, 0, 1, 1, 1,
-0.8488627, -1.241078, -2.317485, 1, 0, 0, 1, 1,
-0.8435248, 0.2402648, -2.695735, 1, 0, 0, 1, 1,
-0.8394493, 0.3496714, -1.040808, 1, 0, 0, 1, 1,
-0.8355933, 0.5348782, -1.027211, 1, 0, 0, 1, 1,
-0.8318319, -1.578074, -3.348475, 1, 0, 0, 1, 1,
-0.8298021, 0.2928627, -0.428281, 0, 0, 0, 1, 1,
-0.8231633, -0.1625073, -2.776429, 0, 0, 0, 1, 1,
-0.8113666, -1.148553, -3.947045, 0, 0, 0, 1, 1,
-0.7992026, 0.8102759, 0.6972588, 0, 0, 0, 1, 1,
-0.7885964, 2.68422, 0.7426246, 0, 0, 0, 1, 1,
-0.787253, -0.9101655, -3.414291, 0, 0, 0, 1, 1,
-0.7680005, -1.280729, -2.06357, 0, 0, 0, 1, 1,
-0.7652122, 0.2051932, -1.124798, 1, 1, 1, 1, 1,
-0.7635859, -0.2330605, -1.309361, 1, 1, 1, 1, 1,
-0.7615157, 0.02904547, -2.003774, 1, 1, 1, 1, 1,
-0.7612542, 0.2168951, -2.076215, 1, 1, 1, 1, 1,
-0.7600616, 0.05268098, -1.301679, 1, 1, 1, 1, 1,
-0.7572346, 0.7378755, 0.5495986, 1, 1, 1, 1, 1,
-0.7516152, -0.8352534, -2.965191, 1, 1, 1, 1, 1,
-0.7484822, -1.577754, -2.914369, 1, 1, 1, 1, 1,
-0.7468925, 1.965532, 0.4250544, 1, 1, 1, 1, 1,
-0.7411139, -0.05636605, -1.624135, 1, 1, 1, 1, 1,
-0.7350215, -0.2924125, -1.699861, 1, 1, 1, 1, 1,
-0.7321566, -1.195761, -2.69275, 1, 1, 1, 1, 1,
-0.7290286, 0.9556034, -1.626223, 1, 1, 1, 1, 1,
-0.7255676, -0.1118326, -0.3652645, 1, 1, 1, 1, 1,
-0.725216, 0.6005929, -1.318725, 1, 1, 1, 1, 1,
-0.7244892, -0.1577719, -1.617313, 0, 0, 1, 1, 1,
-0.7236785, 0.5541272, -1.561743, 1, 0, 0, 1, 1,
-0.7176027, 1.557681, -0.7356652, 1, 0, 0, 1, 1,
-0.7157915, 0.6258978, -1.797588, 1, 0, 0, 1, 1,
-0.7156163, 0.5632259, -1.340967, 1, 0, 0, 1, 1,
-0.7069002, -0.370789, -0.5908065, 1, 0, 0, 1, 1,
-0.7037827, 2.701464, -0.4597465, 0, 0, 0, 1, 1,
-0.6992688, 1.063074, -0.4302331, 0, 0, 0, 1, 1,
-0.6966164, -0.1273235, -1.469463, 0, 0, 0, 1, 1,
-0.6960772, -2.125328, -3.662434, 0, 0, 0, 1, 1,
-0.6959591, 0.3307927, -0.5731176, 0, 0, 0, 1, 1,
-0.6922762, 0.3922739, -2.772486, 0, 0, 0, 1, 1,
-0.6910704, -0.1284428, -2.832622, 0, 0, 0, 1, 1,
-0.6884938, 0.4636249, -1.699527, 1, 1, 1, 1, 1,
-0.68581, -0.4461592, -2.324402, 1, 1, 1, 1, 1,
-0.6827721, -1.076911, -3.019694, 1, 1, 1, 1, 1,
-0.6816603, 0.1712966, -0.6232597, 1, 1, 1, 1, 1,
-0.6804658, -0.6822295, -2.796593, 1, 1, 1, 1, 1,
-0.677794, -0.656899, -1.952938, 1, 1, 1, 1, 1,
-0.6747038, -1.482718, -1.919758, 1, 1, 1, 1, 1,
-0.6737725, -0.9688362, -1.875997, 1, 1, 1, 1, 1,
-0.6733303, -1.484328, -1.308501, 1, 1, 1, 1, 1,
-0.6663139, 1.452405, -0.1748589, 1, 1, 1, 1, 1,
-0.6643051, 2.328518, -0.3758993, 1, 1, 1, 1, 1,
-0.6623512, 1.733967, 1.29353, 1, 1, 1, 1, 1,
-0.6605819, 1.781068, 0.3851089, 1, 1, 1, 1, 1,
-0.653767, -0.01912359, -1.361822, 1, 1, 1, 1, 1,
-0.6531683, -0.02824595, -1.551651, 1, 1, 1, 1, 1,
-0.6458527, 0.3533035, -0.255971, 0, 0, 1, 1, 1,
-0.6435578, 0.8516483, -0.03277505, 1, 0, 0, 1, 1,
-0.6405943, 0.04981599, -1.950422, 1, 0, 0, 1, 1,
-0.6335079, 0.6250272, -0.7600582, 1, 0, 0, 1, 1,
-0.6326445, -1.879088, -3.358905, 1, 0, 0, 1, 1,
-0.6309577, -0.3015298, -3.076437, 1, 0, 0, 1, 1,
-0.6272094, 1.072987, 0.1444211, 0, 0, 0, 1, 1,
-0.6253937, -1.545717, -3.970753, 0, 0, 0, 1, 1,
-0.6242903, 0.8162514, -1.867326, 0, 0, 0, 1, 1,
-0.6235079, -1.162068, -3.093997, 0, 0, 0, 1, 1,
-0.6220171, -1.230425, -1.645012, 0, 0, 0, 1, 1,
-0.6209207, 0.2733042, -1.532022, 0, 0, 0, 1, 1,
-0.6200324, -0.4667636, -1.964452, 0, 0, 0, 1, 1,
-0.6174521, -1.436786, -4.129344, 1, 1, 1, 1, 1,
-0.6167052, 1.0938, -0.6357769, 1, 1, 1, 1, 1,
-0.6161854, 0.8170621, -1.964059, 1, 1, 1, 1, 1,
-0.6134356, 0.6142243, -0.06065414, 1, 1, 1, 1, 1,
-0.6117141, -1.606631, -3.127603, 1, 1, 1, 1, 1,
-0.6104088, -1.21078, -4.42498, 1, 1, 1, 1, 1,
-0.6094466, 1.038822, 1.988114, 1, 1, 1, 1, 1,
-0.605359, 0.1440671, -1.524467, 1, 1, 1, 1, 1,
-0.6024276, 0.001455089, -1.529353, 1, 1, 1, 1, 1,
-0.5993665, -0.9246374, -2.916699, 1, 1, 1, 1, 1,
-0.597755, -0.8142951, -2.895655, 1, 1, 1, 1, 1,
-0.5960212, -0.8173991, -1.802369, 1, 1, 1, 1, 1,
-0.5852477, 0.6730646, -1.837082, 1, 1, 1, 1, 1,
-0.5849773, 0.4071558, -1.257752, 1, 1, 1, 1, 1,
-0.5788689, 0.3131204, 0.2342336, 1, 1, 1, 1, 1,
-0.5769269, -0.1848834, -1.872569, 0, 0, 1, 1, 1,
-0.5759243, -0.1715655, -0.8104212, 1, 0, 0, 1, 1,
-0.5755849, 1.594953, -1.03307, 1, 0, 0, 1, 1,
-0.5754708, -0.2018586, -2.819835, 1, 0, 0, 1, 1,
-0.5713024, -0.8753754, -2.225146, 1, 0, 0, 1, 1,
-0.5709778, -0.08068605, -0.576916, 1, 0, 0, 1, 1,
-0.5696468, -0.6738853, -1.589284, 0, 0, 0, 1, 1,
-0.5692632, -0.8022149, -4.16784, 0, 0, 0, 1, 1,
-0.566739, -1.505685, -3.257321, 0, 0, 0, 1, 1,
-0.565093, -0.8337135, -3.047196, 0, 0, 0, 1, 1,
-0.564241, -0.3970725, -3.044498, 0, 0, 0, 1, 1,
-0.5579469, 1.675177, -1.226372, 0, 0, 0, 1, 1,
-0.552718, -0.1460997, -2.928067, 0, 0, 0, 1, 1,
-0.5510417, 0.188622, -0.6250968, 1, 1, 1, 1, 1,
-0.5415641, -0.5640925, -2.308207, 1, 1, 1, 1, 1,
-0.5406523, 1.026167, -0.9257649, 1, 1, 1, 1, 1,
-0.5365936, -0.7086627, -2.86364, 1, 1, 1, 1, 1,
-0.5333741, -0.4869253, -1.60981, 1, 1, 1, 1, 1,
-0.5280918, -0.4218826, -1.268471, 1, 1, 1, 1, 1,
-0.5248934, -1.317253, -1.429233, 1, 1, 1, 1, 1,
-0.5186784, 1.536457, -0.3856863, 1, 1, 1, 1, 1,
-0.5180768, 0.1550389, -0.3430431, 1, 1, 1, 1, 1,
-0.5156578, 0.06762493, -2.256329, 1, 1, 1, 1, 1,
-0.5137672, 0.09677896, -1.128652, 1, 1, 1, 1, 1,
-0.5115438, 0.2381233, -1.594371, 1, 1, 1, 1, 1,
-0.5103267, -1.13995, -3.267157, 1, 1, 1, 1, 1,
-0.510286, -0.102581, -2.139637, 1, 1, 1, 1, 1,
-0.5090604, 1.342467, 0.3038425, 1, 1, 1, 1, 1,
-0.5062845, 0.1496683, -1.950249, 0, 0, 1, 1, 1,
-0.5040144, 0.725996, 1.833426, 1, 0, 0, 1, 1,
-0.5022591, 0.3649614, -0.3946141, 1, 0, 0, 1, 1,
-0.5017806, 1.284521, -0.2104505, 1, 0, 0, 1, 1,
-0.5005223, -0.227432, -0.8371221, 1, 0, 0, 1, 1,
-0.4967465, -0.7245971, -0.5322794, 1, 0, 0, 1, 1,
-0.4887411, 0.1568636, -2.152817, 0, 0, 0, 1, 1,
-0.4876541, -0.3231551, -0.5771657, 0, 0, 0, 1, 1,
-0.4874865, -1.446487, -2.801711, 0, 0, 0, 1, 1,
-0.4854842, -0.8061461, -3.204411, 0, 0, 0, 1, 1,
-0.4774642, -0.7134427, -2.228526, 0, 0, 0, 1, 1,
-0.475038, 0.2926224, -0.4029409, 0, 0, 0, 1, 1,
-0.4730456, 0.2499732, -0.6673283, 0, 0, 0, 1, 1,
-0.4693533, 2.85381, -0.04897277, 1, 1, 1, 1, 1,
-0.4679539, 0.3834863, 0.6935764, 1, 1, 1, 1, 1,
-0.4654163, 0.2317891, -1.237997, 1, 1, 1, 1, 1,
-0.4638648, -0.4526938, -0.3873477, 1, 1, 1, 1, 1,
-0.462254, 0.05184002, -1.611623, 1, 1, 1, 1, 1,
-0.4538905, 0.9643834, -1.570623, 1, 1, 1, 1, 1,
-0.452336, -0.456678, -0.5643001, 1, 1, 1, 1, 1,
-0.4440153, 0.1334542, -0.03111758, 1, 1, 1, 1, 1,
-0.4364778, 0.3137474, -2.378694, 1, 1, 1, 1, 1,
-0.434794, -1.987992, -3.611748, 1, 1, 1, 1, 1,
-0.4345392, -0.3616316, -3.128529, 1, 1, 1, 1, 1,
-0.4324749, -1.684824, -3.506829, 1, 1, 1, 1, 1,
-0.4288935, -0.3822786, -1.257688, 1, 1, 1, 1, 1,
-0.4282346, -1.032261, -2.20021, 1, 1, 1, 1, 1,
-0.4260924, -0.5071091, -2.646881, 1, 1, 1, 1, 1,
-0.4252927, 0.433525, -2.278049, 0, 0, 1, 1, 1,
-0.4238996, 0.477237, -2.831942, 1, 0, 0, 1, 1,
-0.4169169, -0.5734235, -3.026695, 1, 0, 0, 1, 1,
-0.4152364, 0.9741752, 1.515584, 1, 0, 0, 1, 1,
-0.4139518, -0.08529044, -3.278502, 1, 0, 0, 1, 1,
-0.4138096, -2.174962, -3.313947, 1, 0, 0, 1, 1,
-0.4117029, 1.121306, 1.233648, 0, 0, 0, 1, 1,
-0.4021916, 0.3656451, -0.1977675, 0, 0, 0, 1, 1,
-0.3922547, -0.1538243, -3.647118, 0, 0, 0, 1, 1,
-0.3908411, 0.4148515, -2.417331, 0, 0, 0, 1, 1,
-0.3903211, 0.3069738, -1.825065, 0, 0, 0, 1, 1,
-0.3868204, 1.393153, -1.710544, 0, 0, 0, 1, 1,
-0.3865293, -0.7244587, -4.219508, 0, 0, 0, 1, 1,
-0.3839614, -0.7397103, -2.652363, 1, 1, 1, 1, 1,
-0.3808265, -0.4499774, -2.221941, 1, 1, 1, 1, 1,
-0.3796451, -1.32177, -4.170648, 1, 1, 1, 1, 1,
-0.3771932, -1.835066, -3.427567, 1, 1, 1, 1, 1,
-0.3766111, 1.675046, 0.4411522, 1, 1, 1, 1, 1,
-0.3761143, -0.8692473, -4.020101, 1, 1, 1, 1, 1,
-0.3705274, -0.311344, -1.719504, 1, 1, 1, 1, 1,
-0.3682153, -0.6113911, -3.407924, 1, 1, 1, 1, 1,
-0.3661936, 1.086357, 1.054405, 1, 1, 1, 1, 1,
-0.3588095, 1.018821, 1.053222, 1, 1, 1, 1, 1,
-0.3582368, -0.9073527, -0.8917927, 1, 1, 1, 1, 1,
-0.3579449, 0.2148572, -3.279477, 1, 1, 1, 1, 1,
-0.3521521, -0.3176172, -2.728383, 1, 1, 1, 1, 1,
-0.3476506, -0.277472, -2.509161, 1, 1, 1, 1, 1,
-0.3396063, 1.058193, -0.706284, 1, 1, 1, 1, 1,
-0.3391825, -0.2846668, -4.090922, 0, 0, 1, 1, 1,
-0.3336251, -0.3958459, -2.658248, 1, 0, 0, 1, 1,
-0.3324758, 0.1271199, 0.5160912, 1, 0, 0, 1, 1,
-0.3320246, 0.3957673, -0.7979458, 1, 0, 0, 1, 1,
-0.3297653, 0.5541473, -1.492296, 1, 0, 0, 1, 1,
-0.3263668, 0.6015654, -1.390082, 1, 0, 0, 1, 1,
-0.3262605, -0.3853643, -2.486966, 0, 0, 0, 1, 1,
-0.3248134, 0.2878201, 0.1728918, 0, 0, 0, 1, 1,
-0.3242607, -0.9039989, -4.04452, 0, 0, 0, 1, 1,
-0.3237188, -0.1907182, -2.215295, 0, 0, 0, 1, 1,
-0.3193488, 0.4926887, 0.2902042, 0, 0, 0, 1, 1,
-0.3187959, 0.7605823, 1.370012, 0, 0, 0, 1, 1,
-0.3181098, 1.239883, -0.4157339, 0, 0, 0, 1, 1,
-0.3178042, 0.3036926, -0.4001051, 1, 1, 1, 1, 1,
-0.3125288, 1.53181, 0.06377689, 1, 1, 1, 1, 1,
-0.3051958, 0.8408054, -1.697529, 1, 1, 1, 1, 1,
-0.2983014, 1.914393, -0.7488315, 1, 1, 1, 1, 1,
-0.2971219, 0.607461, -0.5833112, 1, 1, 1, 1, 1,
-0.2953211, -0.3314665, -2.523434, 1, 1, 1, 1, 1,
-0.2953095, 0.6907815, 0.2232677, 1, 1, 1, 1, 1,
-0.2933162, -1.734513, -1.870367, 1, 1, 1, 1, 1,
-0.2900888, 0.5643784, 0.04472695, 1, 1, 1, 1, 1,
-0.2900451, 0.5597712, -1.356146, 1, 1, 1, 1, 1,
-0.2876811, 1.798328, 1.012742, 1, 1, 1, 1, 1,
-0.2865387, -0.2307098, -2.205081, 1, 1, 1, 1, 1,
-0.285843, 0.2340779, -1.852007, 1, 1, 1, 1, 1,
-0.2847999, 1.07776, 1.364756, 1, 1, 1, 1, 1,
-0.2836222, 0.2485486, -0.6267861, 1, 1, 1, 1, 1,
-0.2832752, 0.443681, -1.702311, 0, 0, 1, 1, 1,
-0.2832462, 0.2875587, -0.4249451, 1, 0, 0, 1, 1,
-0.2828592, 1.014794, 2.622536, 1, 0, 0, 1, 1,
-0.2824147, -0.2956812, -3.638823, 1, 0, 0, 1, 1,
-0.2787443, 1.516947, 0.4975058, 1, 0, 0, 1, 1,
-0.2782909, -0.4669766, -3.877493, 1, 0, 0, 1, 1,
-0.2761928, 0.2272518, -0.3093844, 0, 0, 0, 1, 1,
-0.2758433, -0.1879008, -3.692073, 0, 0, 0, 1, 1,
-0.2748106, -0.3870864, -2.240293, 0, 0, 0, 1, 1,
-0.2621778, -0.3623816, -3.824651, 0, 0, 0, 1, 1,
-0.2588253, 0.242127, -1.588768, 0, 0, 0, 1, 1,
-0.2580525, 0.3925953, -0.7867633, 0, 0, 0, 1, 1,
-0.2547669, -0.1901719, -1.969633, 0, 0, 0, 1, 1,
-0.2513418, 0.04313635, -2.574614, 1, 1, 1, 1, 1,
-0.2503256, 0.3907782, -0.9373494, 1, 1, 1, 1, 1,
-0.2502045, 0.407696, -1.571472, 1, 1, 1, 1, 1,
-0.2470644, 0.7953486, -0.6583931, 1, 1, 1, 1, 1,
-0.2465812, -1.893581, -4.73337, 1, 1, 1, 1, 1,
-0.2421801, 1.047884, -0.7890372, 1, 1, 1, 1, 1,
-0.2392803, -1.422676, -1.915407, 1, 1, 1, 1, 1,
-0.2388019, -0.5026284, -1.316111, 1, 1, 1, 1, 1,
-0.2378717, -0.7598603, -3.626878, 1, 1, 1, 1, 1,
-0.2346821, 0.3456559, -0.493183, 1, 1, 1, 1, 1,
-0.2261366, 0.2185373, -0.3807102, 1, 1, 1, 1, 1,
-0.2260255, -0.2048563, -1.568072, 1, 1, 1, 1, 1,
-0.2225814, 0.6184431, -1.486238, 1, 1, 1, 1, 1,
-0.2207534, -0.8858493, -3.064998, 1, 1, 1, 1, 1,
-0.2179665, 1.176537, 0.2957481, 1, 1, 1, 1, 1,
-0.2164162, 2.074608, -1.067141, 0, 0, 1, 1, 1,
-0.2147067, 0.7657675, -0.06543735, 1, 0, 0, 1, 1,
-0.2096867, 0.3865038, 1.231458, 1, 0, 0, 1, 1,
-0.2071421, 2.223681, -0.3674445, 1, 0, 0, 1, 1,
-0.2061656, -0.04210791, -1.926315, 1, 0, 0, 1, 1,
-0.2042128, -0.04502772, -1.86416, 1, 0, 0, 1, 1,
-0.2039712, 0.5358991, -0.2379541, 0, 0, 0, 1, 1,
-0.2002001, 0.706718, -0.3896741, 0, 0, 0, 1, 1,
-0.1995347, -4.125635, -2.385506, 0, 0, 0, 1, 1,
-0.1913397, -1.401339, -2.766932, 0, 0, 0, 1, 1,
-0.1769986, 0.3451549, -0.4437531, 0, 0, 0, 1, 1,
-0.1754101, 0.6321675, -1.259551, 0, 0, 0, 1, 1,
-0.1674196, 0.6412485, -0.8076798, 0, 0, 0, 1, 1,
-0.1646454, 0.606479, -0.007068712, 1, 1, 1, 1, 1,
-0.1523716, -1.029425, -0.6489145, 1, 1, 1, 1, 1,
-0.1504918, -0.6693116, -2.585252, 1, 1, 1, 1, 1,
-0.147385, 1.460498, -0.8401865, 1, 1, 1, 1, 1,
-0.1444158, -0.7712264, -1.626588, 1, 1, 1, 1, 1,
-0.1439296, 0.6881061, -0.7526092, 1, 1, 1, 1, 1,
-0.1432686, 0.5102195, 0.5403832, 1, 1, 1, 1, 1,
-0.1414159, -1.335138, -2.485958, 1, 1, 1, 1, 1,
-0.1356664, 0.02743024, -0.7266179, 1, 1, 1, 1, 1,
-0.1340443, 0.428547, 1.46239, 1, 1, 1, 1, 1,
-0.1335836, 1.929397, 1.165533, 1, 1, 1, 1, 1,
-0.1244223, -0.1143101, -2.887546, 1, 1, 1, 1, 1,
-0.123102, 0.9891759, -0.8457815, 1, 1, 1, 1, 1,
-0.1226403, -1.8074, -3.537629, 1, 1, 1, 1, 1,
-0.1196287, 0.15567, -1.825005, 1, 1, 1, 1, 1,
-0.1180297, -0.1325161, -2.517009, 0, 0, 1, 1, 1,
-0.1160929, 1.977292, 0.3099272, 1, 0, 0, 1, 1,
-0.1149483, 0.7151572, -1.655303, 1, 0, 0, 1, 1,
-0.1142977, 0.2723623, -0.3139732, 1, 0, 0, 1, 1,
-0.1128396, -0.2080622, -3.12262, 1, 0, 0, 1, 1,
-0.1096336, -0.5961719, -2.284987, 1, 0, 0, 1, 1,
-0.1093271, 0.4390887, -0.3687121, 0, 0, 0, 1, 1,
-0.1084976, -0.0986608, -1.820529, 0, 0, 0, 1, 1,
-0.1071184, 1.663215, -0.327287, 0, 0, 0, 1, 1,
-0.103536, -0.456217, -2.496386, 0, 0, 0, 1, 1,
-0.100303, 0.4101402, -1.024742, 0, 0, 0, 1, 1,
-0.09020026, 0.6342288, -0.236137, 0, 0, 0, 1, 1,
-0.08687812, -0.5923377, -3.061478, 0, 0, 0, 1, 1,
-0.0868248, 0.5055587, -1.22504, 1, 1, 1, 1, 1,
-0.08620403, -0.2208677, -2.4252, 1, 1, 1, 1, 1,
-0.08557151, 0.2683947, -1.780875, 1, 1, 1, 1, 1,
-0.0824357, -0.3089001, -3.723944, 1, 1, 1, 1, 1,
-0.08059183, 0.2196406, -1.529236, 1, 1, 1, 1, 1,
-0.07442909, 0.2850463, 0.1232961, 1, 1, 1, 1, 1,
-0.0646205, -0.132233, -4.092473, 1, 1, 1, 1, 1,
-0.06320937, 0.5124248, 0.6359949, 1, 1, 1, 1, 1,
-0.06239646, -0.1610001, -2.016558, 1, 1, 1, 1, 1,
-0.06124739, 0.883628, -0.03884118, 1, 1, 1, 1, 1,
-0.06112903, -0.788378, -4.599433, 1, 1, 1, 1, 1,
-0.06000561, 0.2468069, -1.550309, 1, 1, 1, 1, 1,
-0.05838628, -0.1943039, -4.969915, 1, 1, 1, 1, 1,
-0.05263214, -0.4399937, -3.214289, 1, 1, 1, 1, 1,
-0.05173687, 1.645196, 0.181559, 1, 1, 1, 1, 1,
-0.04986309, 0.8066795, 1.299191, 0, 0, 1, 1, 1,
-0.04671718, -0.4017252, -3.884756, 1, 0, 0, 1, 1,
-0.04597175, -1.16841, -2.378042, 1, 0, 0, 1, 1,
-0.04156803, -0.5029473, -1.144158, 1, 0, 0, 1, 1,
-0.04147626, -0.4258746, -4.028595, 1, 0, 0, 1, 1,
-0.04066039, -1.512893, -3.439086, 1, 0, 0, 1, 1,
-0.04007985, -1.38922, -4.007702, 0, 0, 0, 1, 1,
-0.03903576, 1.042335, 1.297108, 0, 0, 0, 1, 1,
-0.03880933, -0.02140049, -1.27081, 0, 0, 0, 1, 1,
-0.0386547, 1.546984, 1.466715, 0, 0, 0, 1, 1,
-0.03571022, -0.1292302, -1.564134, 0, 0, 0, 1, 1,
-0.03216778, 0.3309561, -0.1858662, 0, 0, 0, 1, 1,
-0.03193503, -0.552591, -5.063834, 0, 0, 0, 1, 1,
-0.02905838, 0.08443171, 0.7103531, 1, 1, 1, 1, 1,
-0.02892339, 0.749249, -0.2957669, 1, 1, 1, 1, 1,
-0.02805102, 0.01107769, -1.425088, 1, 1, 1, 1, 1,
-0.0229728, 0.01697491, -1.935313, 1, 1, 1, 1, 1,
-0.01927937, 0.1718425, -1.872285, 1, 1, 1, 1, 1,
-0.01774121, 1.701293, -1.66501, 1, 1, 1, 1, 1,
-0.01301764, -1.075235, -2.792454, 1, 1, 1, 1, 1,
-0.01082292, 1.17818, 0.4369698, 1, 1, 1, 1, 1,
-0.01010196, -1.047663, -4.223117, 1, 1, 1, 1, 1,
-0.008193421, -1.329229, -4.396312, 1, 1, 1, 1, 1,
-0.001155911, 0.3483627, 0.1420958, 1, 1, 1, 1, 1,
0.0002680293, 0.6505283, 0.9983662, 1, 1, 1, 1, 1,
0.003095393, 0.2900763, -0.388881, 1, 1, 1, 1, 1,
0.003288337, -0.04244475, 3.029532, 1, 1, 1, 1, 1,
0.004581449, 1.130382, 0.5610232, 1, 1, 1, 1, 1,
0.004924116, -0.5029088, 3.18159, 0, 0, 1, 1, 1,
0.0104732, -0.533201, 4.099288, 1, 0, 0, 1, 1,
0.01250468, 2.134268, 0.5744435, 1, 0, 0, 1, 1,
0.0144415, -0.4839876, 4.014535, 1, 0, 0, 1, 1,
0.0178596, 0.03420753, 1.136267, 1, 0, 0, 1, 1,
0.02357964, 0.3825176, -0.8491482, 1, 0, 0, 1, 1,
0.02664093, 0.6167098, 0.01220492, 0, 0, 0, 1, 1,
0.0269456, -0.1406109, 2.916744, 0, 0, 0, 1, 1,
0.03076656, 0.4324454, -1.740082, 0, 0, 0, 1, 1,
0.03726448, -0.6744961, 2.344533, 0, 0, 0, 1, 1,
0.03916039, -0.3815962, 2.20117, 0, 0, 0, 1, 1,
0.03976154, 1.023362, 1.159445, 0, 0, 0, 1, 1,
0.0438981, -0.4206051, 1.675907, 0, 0, 0, 1, 1,
0.04431535, 0.6904474, -0.683293, 1, 1, 1, 1, 1,
0.04487751, -0.004199756, 1.168085, 1, 1, 1, 1, 1,
0.05566175, 0.623952, 0.9775155, 1, 1, 1, 1, 1,
0.05741097, -0.236059, 2.414207, 1, 1, 1, 1, 1,
0.06004338, -1.050169, 2.58277, 1, 1, 1, 1, 1,
0.0648104, -1.335714, 2.384669, 1, 1, 1, 1, 1,
0.06713701, 0.1450941, -0.3228388, 1, 1, 1, 1, 1,
0.06771823, 0.255542, 1.247263, 1, 1, 1, 1, 1,
0.07082247, 0.8529201, -0.5416023, 1, 1, 1, 1, 1,
0.07610317, 0.2969045, -0.9775238, 1, 1, 1, 1, 1,
0.07820938, 0.2596457, 1.157834, 1, 1, 1, 1, 1,
0.07840934, -0.4883983, 3.474909, 1, 1, 1, 1, 1,
0.07856859, -0.01127279, 3.928088, 1, 1, 1, 1, 1,
0.08088181, 0.7410632, 0.9623479, 1, 1, 1, 1, 1,
0.0847968, 0.08681637, 0.1575121, 1, 1, 1, 1, 1,
0.08527382, -0.7898577, 0.08756461, 0, 0, 1, 1, 1,
0.08799864, 1.834255, 0.164083, 1, 0, 0, 1, 1,
0.09044566, -0.2861977, 3.353325, 1, 0, 0, 1, 1,
0.0906589, -0.6455433, 1.470972, 1, 0, 0, 1, 1,
0.09167759, -1.180505, 2.617574, 1, 0, 0, 1, 1,
0.09410347, 0.8414017, 0.03294512, 1, 0, 0, 1, 1,
0.09777847, 1.162582, 0.3618506, 0, 0, 0, 1, 1,
0.100209, 1.874485, 0.508241, 0, 0, 0, 1, 1,
0.1046013, 0.1234805, 1.020446, 0, 0, 0, 1, 1,
0.1056795, -0.8727402, 1.454903, 0, 0, 0, 1, 1,
0.1164187, -1.256534, 2.385145, 0, 0, 0, 1, 1,
0.1171162, 1.337996, -1.484459, 0, 0, 0, 1, 1,
0.117353, 1.869255, -1.594036, 0, 0, 0, 1, 1,
0.1195305, -1.51602, 1.250062, 1, 1, 1, 1, 1,
0.1200331, 1.061505, 0.1436319, 1, 1, 1, 1, 1,
0.1207358, 0.7923403, 2.697271, 1, 1, 1, 1, 1,
0.1266784, 0.09025312, -0.3397918, 1, 1, 1, 1, 1,
0.1283635, -1.59467, 1.814189, 1, 1, 1, 1, 1,
0.1339685, -0.7220088, 3.749788, 1, 1, 1, 1, 1,
0.136325, 0.7719716, -0.2663745, 1, 1, 1, 1, 1,
0.1376093, -0.3004919, 4.423909, 1, 1, 1, 1, 1,
0.1425768, 0.9699376, -0.201409, 1, 1, 1, 1, 1,
0.1462936, 1.011792, 0.1465525, 1, 1, 1, 1, 1,
0.151643, -1.049748, 2.290198, 1, 1, 1, 1, 1,
0.1564287, -1.666975, 3.72042, 1, 1, 1, 1, 1,
0.1624905, -0.6035023, 3.782442, 1, 1, 1, 1, 1,
0.1664953, 2.480889, 0.4598623, 1, 1, 1, 1, 1,
0.1675229, -0.9512601, 2.508856, 1, 1, 1, 1, 1,
0.1680833, -0.9259745, 3.945127, 0, 0, 1, 1, 1,
0.1687467, 0.6664315, 1.187624, 1, 0, 0, 1, 1,
0.1694286, -0.4784389, 3.476972, 1, 0, 0, 1, 1,
0.169624, -0.382891, 3.404274, 1, 0, 0, 1, 1,
0.1712644, 0.1869815, 1.608946, 1, 0, 0, 1, 1,
0.1743243, -0.09942438, 3.002256, 1, 0, 0, 1, 1,
0.1765328, -1.895979, 4.964532, 0, 0, 0, 1, 1,
0.1786056, -0.8741561, 2.91318, 0, 0, 0, 1, 1,
0.1810692, 0.8785174, -0.6288317, 0, 0, 0, 1, 1,
0.1817449, -0.08132625, 1.232128, 0, 0, 0, 1, 1,
0.183396, 0.8782738, 0.1765776, 0, 0, 0, 1, 1,
0.1839453, 0.2268608, 0.3306507, 0, 0, 0, 1, 1,
0.1896923, -0.3890872, 1.911983, 0, 0, 0, 1, 1,
0.1903246, 1.036152, -1.315371, 1, 1, 1, 1, 1,
0.1935056, 1.259999, 0.7014013, 1, 1, 1, 1, 1,
0.2004687, -0.2785499, 1.796209, 1, 1, 1, 1, 1,
0.2004944, -0.6270305, 3.179853, 1, 1, 1, 1, 1,
0.2017609, 0.7860965, 0.7633797, 1, 1, 1, 1, 1,
0.206753, 0.565838, -0.5207674, 1, 1, 1, 1, 1,
0.2094924, -0.8843911, 1.353186, 1, 1, 1, 1, 1,
0.2158899, 0.5276595, -0.5029774, 1, 1, 1, 1, 1,
0.2179373, -0.6742337, 3.502854, 1, 1, 1, 1, 1,
0.2186681, 0.4126849, 2.444568, 1, 1, 1, 1, 1,
0.2186995, 0.6879081, 0.2019085, 1, 1, 1, 1, 1,
0.2190441, -0.2810739, 2.049409, 1, 1, 1, 1, 1,
0.2191447, 0.5128751, 0.3035339, 1, 1, 1, 1, 1,
0.2211557, -0.2463154, 4.280156, 1, 1, 1, 1, 1,
0.2266928, 0.908758, -0.8747531, 1, 1, 1, 1, 1,
0.2280171, -0.3130214, 1.996848, 0, 0, 1, 1, 1,
0.2284369, 0.1992634, -0.6851274, 1, 0, 0, 1, 1,
0.2336771, 0.591264, 0.7110813, 1, 0, 0, 1, 1,
0.2374229, -1.76325, 3.767762, 1, 0, 0, 1, 1,
0.2378254, -0.7809792, 1.919487, 1, 0, 0, 1, 1,
0.2385222, -0.7427503, 2.255036, 1, 0, 0, 1, 1,
0.2474125, 0.1832557, 2.049066, 0, 0, 0, 1, 1,
0.2637146, 1.040112, 1.569918, 0, 0, 0, 1, 1,
0.2639862, 1.040144, 0.8375671, 0, 0, 0, 1, 1,
0.2644802, 1.163831, 1.151581, 0, 0, 0, 1, 1,
0.2665212, 0.03575779, 0.2772027, 0, 0, 0, 1, 1,
0.2680934, -0.441128, 4.017207, 0, 0, 0, 1, 1,
0.2696956, 0.2619105, -1.641814, 0, 0, 0, 1, 1,
0.2697332, 1.037756, -0.1993213, 1, 1, 1, 1, 1,
0.2699516, -0.3322116, 2.827103, 1, 1, 1, 1, 1,
0.2717849, -1.286146, 3.73835, 1, 1, 1, 1, 1,
0.2757321, 1.74675, -1.522981, 1, 1, 1, 1, 1,
0.2775941, -0.2117276, 4.443623, 1, 1, 1, 1, 1,
0.2799997, -1.111583, 5.249693, 1, 1, 1, 1, 1,
0.2809504, 1.12188, -0.4200823, 1, 1, 1, 1, 1,
0.2824849, 0.8521602, -0.6615097, 1, 1, 1, 1, 1,
0.2829968, -0.9948919, 2.35454, 1, 1, 1, 1, 1,
0.2840145, -0.9380987, 2.696476, 1, 1, 1, 1, 1,
0.2846386, -1.931948, 4.790236, 1, 1, 1, 1, 1,
0.2853892, -1.261072, 2.682899, 1, 1, 1, 1, 1,
0.287157, 0.7024702, 1.317294, 1, 1, 1, 1, 1,
0.3074709, 0.3531378, 1.402377, 1, 1, 1, 1, 1,
0.311053, -1.976679, 3.720925, 1, 1, 1, 1, 1,
0.3116704, 0.3209578, 0.2930415, 0, 0, 1, 1, 1,
0.3138679, 0.4308263, 0.2666814, 1, 0, 0, 1, 1,
0.321136, -0.6455809, 2.478405, 1, 0, 0, 1, 1,
0.3221136, -1.900713, 0.8828635, 1, 0, 0, 1, 1,
0.328906, -0.4358532, 3.957682, 1, 0, 0, 1, 1,
0.3291585, -0.3660391, 1.63698, 1, 0, 0, 1, 1,
0.3354893, -0.7452117, 1.327162, 0, 0, 0, 1, 1,
0.340364, 0.5958973, -0.1983287, 0, 0, 0, 1, 1,
0.3480366, -2.302592, 4.508495, 0, 0, 0, 1, 1,
0.3494762, -0.5647789, 0.5761055, 0, 0, 0, 1, 1,
0.3496173, 0.8770899, 1.276983, 0, 0, 0, 1, 1,
0.3504023, -0.8520153, 3.749928, 0, 0, 0, 1, 1,
0.3559332, -0.3662308, 2.875789, 0, 0, 0, 1, 1,
0.357357, 0.321412, 0.2539119, 1, 1, 1, 1, 1,
0.3605098, -0.8488078, 4.630982, 1, 1, 1, 1, 1,
0.3646947, 1.718357, 0.570915, 1, 1, 1, 1, 1,
0.3650549, -0.8640001, 2.817095, 1, 1, 1, 1, 1,
0.3673797, -0.8514509, 3.12041, 1, 1, 1, 1, 1,
0.3685033, 2.590868, -0.687084, 1, 1, 1, 1, 1,
0.3851067, 0.5165045, 1.569395, 1, 1, 1, 1, 1,
0.385882, 0.006066984, 1.355156, 1, 1, 1, 1, 1,
0.3923464, -0.4075232, 3.565027, 1, 1, 1, 1, 1,
0.3985751, -0.4116978, 2.156286, 1, 1, 1, 1, 1,
0.4058307, -0.8996132, 3.045476, 1, 1, 1, 1, 1,
0.4066571, -0.3506699, 1.316398, 1, 1, 1, 1, 1,
0.4281858, 0.2663965, 1.615377, 1, 1, 1, 1, 1,
0.4309621, 0.8490211, 1.280638, 1, 1, 1, 1, 1,
0.4334894, 1.79808, -1.758566, 1, 1, 1, 1, 1,
0.4458021, 0.6802371, 1.085907, 0, 0, 1, 1, 1,
0.4464888, -0.5551936, 2.340691, 1, 0, 0, 1, 1,
0.4492658, -0.6670338, 2.290576, 1, 0, 0, 1, 1,
0.4503857, -1.822586, 3.102827, 1, 0, 0, 1, 1,
0.4527048, 1.233426, 1.3677, 1, 0, 0, 1, 1,
0.4528936, -1.196934, 2.444565, 1, 0, 0, 1, 1,
0.4599641, 0.4395602, 0.7811731, 0, 0, 0, 1, 1,
0.4607416, -0.03164867, 0.432797, 0, 0, 0, 1, 1,
0.4613219, -0.9046884, 3.068775, 0, 0, 0, 1, 1,
0.4625941, 0.147667, 0.9916367, 0, 0, 0, 1, 1,
0.4628591, 0.6322501, 0.9064527, 0, 0, 0, 1, 1,
0.4672882, -0.2272383, 0.1512548, 0, 0, 0, 1, 1,
0.4694455, -0.0009342088, 4.67291, 0, 0, 0, 1, 1,
0.4722081, 0.04959046, 0.8580564, 1, 1, 1, 1, 1,
0.4725819, 0.594727, 1.292828, 1, 1, 1, 1, 1,
0.4780494, -0.0950638, 1.159447, 1, 1, 1, 1, 1,
0.4801418, 1.258024, 2.03412, 1, 1, 1, 1, 1,
0.4864883, 1.506418, -0.5919997, 1, 1, 1, 1, 1,
0.4940694, -0.09746719, 1.571308, 1, 1, 1, 1, 1,
0.4993877, -0.8202158, 3.077474, 1, 1, 1, 1, 1,
0.5013697, 1.586299, 0.4353677, 1, 1, 1, 1, 1,
0.5023464, -0.3979612, 1.165511, 1, 1, 1, 1, 1,
0.5040215, 0.2008888, 1.012747, 1, 1, 1, 1, 1,
0.5059009, -0.4217602, 2.857732, 1, 1, 1, 1, 1,
0.509432, 0.4331679, 0.0873598, 1, 1, 1, 1, 1,
0.5143656, 1.762696, 0.8354228, 1, 1, 1, 1, 1,
0.5152842, -0.7811648, 2.013137, 1, 1, 1, 1, 1,
0.5195671, 1.200369, 2.42605, 1, 1, 1, 1, 1,
0.5223979, 1.040561, 0.1118643, 0, 0, 1, 1, 1,
0.5254218, -0.4546937, 3.509861, 1, 0, 0, 1, 1,
0.5281848, 1.463164, 0.9397483, 1, 0, 0, 1, 1,
0.5287525, 0.1481019, 2.053885, 1, 0, 0, 1, 1,
0.5338542, 0.7918243, 1.304404, 1, 0, 0, 1, 1,
0.53871, 0.01201835, -0.3378564, 1, 0, 0, 1, 1,
0.5392333, -0.2234357, 2.48924, 0, 0, 0, 1, 1,
0.541284, -1.074985, 1.256791, 0, 0, 0, 1, 1,
0.5417462, -1.57218, 2.065313, 0, 0, 0, 1, 1,
0.5467699, 1.15235, -0.88907, 0, 0, 0, 1, 1,
0.5470614, -0.04682229, 0.9986851, 0, 0, 0, 1, 1,
0.5553249, -0.5243309, 1.491916, 0, 0, 0, 1, 1,
0.5581357, 0.065416, 1.792959, 0, 0, 0, 1, 1,
0.5643797, -0.1972423, 1.998512, 1, 1, 1, 1, 1,
0.5725347, -1.064073, 3.374971, 1, 1, 1, 1, 1,
0.5739554, -2.698853, 2.388068, 1, 1, 1, 1, 1,
0.5845243, 1.331558, 0.8796861, 1, 1, 1, 1, 1,
0.5853395, 1.038777, 0.3510432, 1, 1, 1, 1, 1,
0.5910645, -0.956469, 2.921233, 1, 1, 1, 1, 1,
0.5911714, -2.127741, 4.024835, 1, 1, 1, 1, 1,
0.5955092, 0.1526502, 0.85468, 1, 1, 1, 1, 1,
0.6083795, 0.8910473, 1.179856, 1, 1, 1, 1, 1,
0.612776, -0.3713622, 3.85894, 1, 1, 1, 1, 1,
0.6132773, 0.6082107, -0.4902631, 1, 1, 1, 1, 1,
0.6229205, -0.2586828, 3.284837, 1, 1, 1, 1, 1,
0.6259634, 0.18116, 0.8841832, 1, 1, 1, 1, 1,
0.6299845, 0.5254377, 0.578056, 1, 1, 1, 1, 1,
0.6314192, -2.979075, 1.971542, 1, 1, 1, 1, 1,
0.6341156, -0.1186047, 1.692162, 0, 0, 1, 1, 1,
0.6353493, 1.113695, 1.97411, 1, 0, 0, 1, 1,
0.6404817, 0.1146979, 0.7662291, 1, 0, 0, 1, 1,
0.6443387, -0.8997703, 2.524239, 1, 0, 0, 1, 1,
0.6517109, 1.741654, -0.5310577, 1, 0, 0, 1, 1,
0.6530024, -0.1875328, 2.268989, 1, 0, 0, 1, 1,
0.6536003, 1.644216, -1.648955, 0, 0, 0, 1, 1,
0.6540145, 0.06951068, 1.902746, 0, 0, 0, 1, 1,
0.6567922, 0.2933368, 0.3584087, 0, 0, 0, 1, 1,
0.6572072, -0.6579334, 1.50691, 0, 0, 0, 1, 1,
0.6596603, 0.2223789, 2.55494, 0, 0, 0, 1, 1,
0.6613111, 0.3450795, 0.6717201, 0, 0, 0, 1, 1,
0.6615345, -0.9887676, 2.673717, 0, 0, 0, 1, 1,
0.6659667, 0.4593631, 0.5416204, 1, 1, 1, 1, 1,
0.666378, -1.247147, 3.222698, 1, 1, 1, 1, 1,
0.6692892, 0.6172578, 0.1706258, 1, 1, 1, 1, 1,
0.6708191, 1.070146, 0.05180696, 1, 1, 1, 1, 1,
0.671743, 1.565074, -0.9705362, 1, 1, 1, 1, 1,
0.672647, 0.3623046, -0.05149245, 1, 1, 1, 1, 1,
0.6780167, -1.49398, -0.1166706, 1, 1, 1, 1, 1,
0.6791586, 1.96078, 1.512333, 1, 1, 1, 1, 1,
0.6802366, -1.699133, 2.734491, 1, 1, 1, 1, 1,
0.6805452, -0.09654826, 1.65435, 1, 1, 1, 1, 1,
0.6810112, 0.08811958, -0.4374942, 1, 1, 1, 1, 1,
0.6859544, -0.6155627, 3.699748, 1, 1, 1, 1, 1,
0.6889782, -1.169091, 1.798731, 1, 1, 1, 1, 1,
0.6959352, 0.3818015, 1.593733, 1, 1, 1, 1, 1,
0.6985618, -0.01453245, 2.040298, 1, 1, 1, 1, 1,
0.70462, -0.4551409, 1.483484, 0, 0, 1, 1, 1,
0.7057623, 0.7610861, -0.02624203, 1, 0, 0, 1, 1,
0.7095999, 0.206854, 2.679433, 1, 0, 0, 1, 1,
0.7120233, 0.2760586, 0.987049, 1, 0, 0, 1, 1,
0.7120532, 0.66381, -1.19683, 1, 0, 0, 1, 1,
0.713108, 0.2026291, 1.65172, 1, 0, 0, 1, 1,
0.7161909, -0.9730965, 2.695194, 0, 0, 0, 1, 1,
0.7185704, -0.1389703, 2.485325, 0, 0, 0, 1, 1,
0.7194187, -0.624437, 1.849784, 0, 0, 0, 1, 1,
0.7228782, 0.1778011, -0.8956466, 0, 0, 0, 1, 1,
0.7245097, -0.09278674, 1.180029, 0, 0, 0, 1, 1,
0.735331, -0.8184501, 3.050611, 0, 0, 0, 1, 1,
0.7448439, -0.2504877, 2.540441, 0, 0, 0, 1, 1,
0.7468051, 0.4922291, 0.669777, 1, 1, 1, 1, 1,
0.7468148, 1.75265, -0.1752703, 1, 1, 1, 1, 1,
0.7478171, -0.5654583, 2.764431, 1, 1, 1, 1, 1,
0.7480059, 1.231288, 1.488219, 1, 1, 1, 1, 1,
0.7505971, -0.8313962, 2.80589, 1, 1, 1, 1, 1,
0.7531746, 0.7748948, 1.437559, 1, 1, 1, 1, 1,
0.7532159, -0.09725884, 2.577062, 1, 1, 1, 1, 1,
0.7655622, -0.5326205, 0.622607, 1, 1, 1, 1, 1,
0.7665707, 0.4174097, 1.25957, 1, 1, 1, 1, 1,
0.7670261, -1.001336, 1.222066, 1, 1, 1, 1, 1,
0.7720649, -0.330723, -0.3479932, 1, 1, 1, 1, 1,
0.7727771, 0.7185724, 2.204267, 1, 1, 1, 1, 1,
0.7762653, -0.2860609, 4.252147, 1, 1, 1, 1, 1,
0.7768434, 0.3556549, -0.06617787, 1, 1, 1, 1, 1,
0.7817738, -0.2634567, 2.263517, 1, 1, 1, 1, 1,
0.784112, 0.627297, -0.3322558, 0, 0, 1, 1, 1,
0.7870501, 0.8055834, 1.880333, 1, 0, 0, 1, 1,
0.7875378, 0.2329796, 0.5353314, 1, 0, 0, 1, 1,
0.7896383, 0.1392892, 1.486629, 1, 0, 0, 1, 1,
0.7928226, 0.976187, 1.191845, 1, 0, 0, 1, 1,
0.7930486, 1.782471, 0.7560984, 1, 0, 0, 1, 1,
0.8023285, 0.755479, -0.01355048, 0, 0, 0, 1, 1,
0.805141, 0.1300685, 2.255444, 0, 0, 0, 1, 1,
0.8114116, -0.5671095, 3.38604, 0, 0, 0, 1, 1,
0.8135911, 1.123472, 0.4847174, 0, 0, 0, 1, 1,
0.8159627, 0.2643786, 0.5873223, 0, 0, 0, 1, 1,
0.8202708, 0.6497394, 1.176632, 0, 0, 0, 1, 1,
0.8239766, -1.666935, 2.199095, 0, 0, 0, 1, 1,
0.8282701, 1.464344, 0.7739156, 1, 1, 1, 1, 1,
0.8378619, -0.9763426, 0.5294891, 1, 1, 1, 1, 1,
0.8381259, 1.78524, -1.803675, 1, 1, 1, 1, 1,
0.8391745, 0.09453667, 1.448442, 1, 1, 1, 1, 1,
0.8444606, 1.964243, 0.2041232, 1, 1, 1, 1, 1,
0.8471147, -1.4268, 0.8216451, 1, 1, 1, 1, 1,
0.8492084, -0.6887322, 0.3752594, 1, 1, 1, 1, 1,
0.852657, 0.6069055, 0.2376203, 1, 1, 1, 1, 1,
0.8611007, 1.739689, -0.1142483, 1, 1, 1, 1, 1,
0.8644373, 1.059375, 0.2537681, 1, 1, 1, 1, 1,
0.8674538, 0.754333, 1.637814, 1, 1, 1, 1, 1,
0.8779207, -0.2581657, 2.332668, 1, 1, 1, 1, 1,
0.8789196, -0.9492623, 1.832697, 1, 1, 1, 1, 1,
0.8798787, -0.3566441, 1.409323, 1, 1, 1, 1, 1,
0.8839176, -1.620234, 2.383582, 1, 1, 1, 1, 1,
0.8887132, -1.936138, 3.180967, 0, 0, 1, 1, 1,
0.8927217, 1.848292, -0.01294298, 1, 0, 0, 1, 1,
0.897136, 1.308445, -0.0327494, 1, 0, 0, 1, 1,
0.9000504, -1.265518, 2.784948, 1, 0, 0, 1, 1,
0.9004352, 1.197013, -0.01671996, 1, 0, 0, 1, 1,
0.9047112, -0.1953131, -0.6040717, 1, 0, 0, 1, 1,
0.9114925, -1.139064, 2.503994, 0, 0, 0, 1, 1,
0.9200464, -1.889761, 2.100737, 0, 0, 0, 1, 1,
0.9294444, -1.5992, 3.317674, 0, 0, 0, 1, 1,
0.9312965, 0.567711, 2.962241, 0, 0, 0, 1, 1,
0.9404454, -0.4621308, 2.629629, 0, 0, 0, 1, 1,
0.9409962, -0.1847994, 0.291537, 0, 0, 0, 1, 1,
0.9488242, 0.6531398, 2.363861, 0, 0, 0, 1, 1,
0.9505236, 0.2514574, 0.1659222, 1, 1, 1, 1, 1,
0.9557377, -1.245403, 4.809713, 1, 1, 1, 1, 1,
0.9568648, -1.937297, 2.541642, 1, 1, 1, 1, 1,
0.9574, -0.5820047, 1.44848, 1, 1, 1, 1, 1,
0.9604846, 1.144367, 2.445932, 1, 1, 1, 1, 1,
0.9656184, 0.3202277, 0.5965467, 1, 1, 1, 1, 1,
0.9770923, -1.448315, 3.299871, 1, 1, 1, 1, 1,
0.984929, 0.1763229, 0.9873263, 1, 1, 1, 1, 1,
0.9902068, -0.4182633, 1.525726, 1, 1, 1, 1, 1,
0.9951125, 0.6798696, 2.233946, 1, 1, 1, 1, 1,
1.004475, 0.7909063, 0.8540722, 1, 1, 1, 1, 1,
1.004618, 0.5621101, 2.284837, 1, 1, 1, 1, 1,
1.01092, -0.382399, 1.125431, 1, 1, 1, 1, 1,
1.011237, -0.101572, 0.8857026, 1, 1, 1, 1, 1,
1.012982, -0.1052291, 2.165128, 1, 1, 1, 1, 1,
1.019068, -0.2860192, 1.916202, 0, 0, 1, 1, 1,
1.0206, 0.1975854, 1.659623, 1, 0, 0, 1, 1,
1.039331, 0.3815531, 0.1521854, 1, 0, 0, 1, 1,
1.052814, -0.1680786, 1.334484, 1, 0, 0, 1, 1,
1.054938, 1.449675, 0.5908723, 1, 0, 0, 1, 1,
1.055383, 0.662865, -0.05686916, 1, 0, 0, 1, 1,
1.057744, -0.5525847, 1.778687, 0, 0, 0, 1, 1,
1.059223, -0.1633105, 2.878102, 0, 0, 0, 1, 1,
1.062222, 0.1038114, 1.268117, 0, 0, 0, 1, 1,
1.071411, 0.5926929, 2.570486, 0, 0, 0, 1, 1,
1.080569, -0.3455164, 3.174431, 0, 0, 0, 1, 1,
1.082009, -2.110316, 2.90541, 0, 0, 0, 1, 1,
1.082919, 2.470247, -0.1215842, 0, 0, 0, 1, 1,
1.082965, 0.5096719, 2.444071, 1, 1, 1, 1, 1,
1.089769, -0.08168434, 2.414567, 1, 1, 1, 1, 1,
1.095616, 1.370638, 0.5466597, 1, 1, 1, 1, 1,
1.101179, 0.1619127, 1.065907, 1, 1, 1, 1, 1,
1.106682, -0.3201268, 2.540534, 1, 1, 1, 1, 1,
1.110319, -2.750226, 2.484203, 1, 1, 1, 1, 1,
1.113666, -0.343837, 3.180054, 1, 1, 1, 1, 1,
1.116119, 0.2957171, -0.1952416, 1, 1, 1, 1, 1,
1.119769, -0.4691198, 3.215884, 1, 1, 1, 1, 1,
1.130379, -1.468403, 2.541366, 1, 1, 1, 1, 1,
1.131552, -2.33622, 2.151402, 1, 1, 1, 1, 1,
1.1318, 0.005683881, 1.544533, 1, 1, 1, 1, 1,
1.133068, 0.9355922, 1.980186, 1, 1, 1, 1, 1,
1.135679, 0.01596241, 1.635422, 1, 1, 1, 1, 1,
1.146149, 0.148022, 2.306812, 1, 1, 1, 1, 1,
1.15027, 1.664495, 0.7144606, 0, 0, 1, 1, 1,
1.155952, 0.4420021, 0.2902797, 1, 0, 0, 1, 1,
1.160106, -0.8054757, 1.950749, 1, 0, 0, 1, 1,
1.160347, -1.988195, 0.8240625, 1, 0, 0, 1, 1,
1.176104, 0.3376809, 2.292981, 1, 0, 0, 1, 1,
1.176906, 0.2546065, 2.426357, 1, 0, 0, 1, 1,
1.178823, 1.793335, 0.5288466, 0, 0, 0, 1, 1,
1.191635, 0.04191902, 1.012843, 0, 0, 0, 1, 1,
1.199466, 1.520602, -0.3302412, 0, 0, 0, 1, 1,
1.20081, -0.7135317, 2.77724, 0, 0, 0, 1, 1,
1.204376, -1.297471, 1.853598, 0, 0, 0, 1, 1,
1.205254, -0.1772909, 0.06928528, 0, 0, 0, 1, 1,
1.20982, -0.9921911, 2.181799, 0, 0, 0, 1, 1,
1.211394, -0.5509074, 2.748212, 1, 1, 1, 1, 1,
1.215022, -0.7194083, 2.426603, 1, 1, 1, 1, 1,
1.217282, -0.3579996, 1.929906, 1, 1, 1, 1, 1,
1.228319, -0.2126715, 0.9373417, 1, 1, 1, 1, 1,
1.235379, -0.2642225, 1.123131, 1, 1, 1, 1, 1,
1.239614, -1.577927, 2.77192, 1, 1, 1, 1, 1,
1.239674, -3.0356, 1.144336, 1, 1, 1, 1, 1,
1.24804, -0.6570785, 2.542141, 1, 1, 1, 1, 1,
1.252699, -0.9459671, 3.439628, 1, 1, 1, 1, 1,
1.254664, 0.4915508, 0.3830722, 1, 1, 1, 1, 1,
1.257535, -1.066908, 2.59333, 1, 1, 1, 1, 1,
1.284179, 0.8883666, 1.289979, 1, 1, 1, 1, 1,
1.284567, -0.831296, 1.53966, 1, 1, 1, 1, 1,
1.284773, -1.499776, 1.337549, 1, 1, 1, 1, 1,
1.294267, 0.8113439, 1.304639, 1, 1, 1, 1, 1,
1.294526, 0.7415782, 0.8782298, 0, 0, 1, 1, 1,
1.295601, -0.7323524, 2.359126, 1, 0, 0, 1, 1,
1.307131, -0.8681798, 0.93104, 1, 0, 0, 1, 1,
1.309128, -0.3615077, 0.8452733, 1, 0, 0, 1, 1,
1.312014, 2.16749, -0.824317, 1, 0, 0, 1, 1,
1.326018, -1.534432, 2.756788, 1, 0, 0, 1, 1,
1.326841, 0.5962667, 1.343374, 0, 0, 0, 1, 1,
1.331883, -1.068995, 1.475057, 0, 0, 0, 1, 1,
1.359361, 0.4088577, 1.635088, 0, 0, 0, 1, 1,
1.359481, -0.1600922, 1.517436, 0, 0, 0, 1, 1,
1.367451, -0.7454947, 2.418217, 0, 0, 0, 1, 1,
1.367734, 1.219008, 1.085835, 0, 0, 0, 1, 1,
1.37281, -0.294119, 2.822843, 0, 0, 0, 1, 1,
1.380331, 0.4078596, 0.338957, 1, 1, 1, 1, 1,
1.388647, 1.359735, 1.655109, 1, 1, 1, 1, 1,
1.388818, -0.4613899, 1.186123, 1, 1, 1, 1, 1,
1.392533, -1.247944, 1.71546, 1, 1, 1, 1, 1,
1.393942, 0.7062676, 0.9168406, 1, 1, 1, 1, 1,
1.401215, 0.9063159, 2.060955, 1, 1, 1, 1, 1,
1.403899, -1.684829, 4.004753, 1, 1, 1, 1, 1,
1.404044, 0.09789111, 1.24545, 1, 1, 1, 1, 1,
1.409773, 0.4108937, 2.738804, 1, 1, 1, 1, 1,
1.419817, -0.335208, 1.734945, 1, 1, 1, 1, 1,
1.426954, 0.5306714, 0.4796104, 1, 1, 1, 1, 1,
1.429733, 0.6487567, 1.608592, 1, 1, 1, 1, 1,
1.443771, 0.8030406, 2.029976, 1, 1, 1, 1, 1,
1.45093, 0.3825803, 0.3375983, 1, 1, 1, 1, 1,
1.454986, 1.778192, 1.652457, 1, 1, 1, 1, 1,
1.45672, -0.7106056, 1.520674, 0, 0, 1, 1, 1,
1.460189, -0.8463781, 1.272782, 1, 0, 0, 1, 1,
1.462323, 1.453231, 1.116906, 1, 0, 0, 1, 1,
1.469271, 0.4478439, 1.202909, 1, 0, 0, 1, 1,
1.470407, 0.06125499, 2.58143, 1, 0, 0, 1, 1,
1.474316, -1.15098, 2.057095, 1, 0, 0, 1, 1,
1.496029, -1.224878, 1.481818, 0, 0, 0, 1, 1,
1.504362, -0.7074096, 3.316442, 0, 0, 0, 1, 1,
1.511169, -0.5903473, 0.7491967, 0, 0, 0, 1, 1,
1.531688, 0.7356374, 1.216632, 0, 0, 0, 1, 1,
1.536071, -0.5160716, 0.5654473, 0, 0, 0, 1, 1,
1.538822, -0.7305716, 1.872777, 0, 0, 0, 1, 1,
1.542202, -0.4178241, 0.1767823, 0, 0, 0, 1, 1,
1.550572, -0.5238918, 1.701509, 1, 1, 1, 1, 1,
1.557898, 2.613543, -0.552372, 1, 1, 1, 1, 1,
1.557899, -0.1571594, 2.810077, 1, 1, 1, 1, 1,
1.562358, -0.5698788, 1.179315, 1, 1, 1, 1, 1,
1.580622, -0.2187445, 0.3047288, 1, 1, 1, 1, 1,
1.614181, -0.1965834, 1.047522, 1, 1, 1, 1, 1,
1.617076, 0.2947737, 2.246445, 1, 1, 1, 1, 1,
1.627851, 0.3268323, 1.041798, 1, 1, 1, 1, 1,
1.642704, -1.204697, 3.144891, 1, 1, 1, 1, 1,
1.645972, -1.677402, 1.832645, 1, 1, 1, 1, 1,
1.646152, -1.165846, 1.051534, 1, 1, 1, 1, 1,
1.649213, -1.780177, 1.717356, 1, 1, 1, 1, 1,
1.653468, -1.690191, 0.9392441, 1, 1, 1, 1, 1,
1.659606, -0.1909885, 2.440522, 1, 1, 1, 1, 1,
1.66772, 0.6451619, 0.8694445, 1, 1, 1, 1, 1,
1.673666, -0.01488489, 1.692273, 0, 0, 1, 1, 1,
1.67816, -0.2929477, 2.259484, 1, 0, 0, 1, 1,
1.68459, -1.617535, 2.995083, 1, 0, 0, 1, 1,
1.690134, -0.4422465, 1.781552, 1, 0, 0, 1, 1,
1.693086, -0.399683, 1.734383, 1, 0, 0, 1, 1,
1.693957, -1.339021, 4.444707, 1, 0, 0, 1, 1,
1.698164, -1.312363, 4.128296, 0, 0, 0, 1, 1,
1.703475, -0.6767646, 1.198507, 0, 0, 0, 1, 1,
1.7076, 0.1725314, 1.894757, 0, 0, 0, 1, 1,
1.740505, 0.237081, 0.1286425, 0, 0, 0, 1, 1,
1.746361, -1.57621, 2.244632, 0, 0, 0, 1, 1,
1.780938, -0.1013024, 1.320045, 0, 0, 0, 1, 1,
1.784293, 0.7574471, 0.5612757, 0, 0, 0, 1, 1,
1.78744, 0.04313136, 0.2871587, 1, 1, 1, 1, 1,
1.797166, -1.323325, 2.211298, 1, 1, 1, 1, 1,
1.829879, 0.002601405, 3.201826, 1, 1, 1, 1, 1,
1.83755, -0.3994974, 1.510846, 1, 1, 1, 1, 1,
1.859882, 1.589882, -0.598176, 1, 1, 1, 1, 1,
1.861189, 0.7387407, 2.506369, 1, 1, 1, 1, 1,
1.861459, 0.6181698, 0.1419482, 1, 1, 1, 1, 1,
1.862452, 0.1556757, 1.252921, 1, 1, 1, 1, 1,
1.880883, -0.5832529, 2.137088, 1, 1, 1, 1, 1,
1.890823, 0.6434084, -0.5552883, 1, 1, 1, 1, 1,
1.947183, -0.4111094, 0.9811948, 1, 1, 1, 1, 1,
1.948697, 1.828935, 0.9800609, 1, 1, 1, 1, 1,
1.94872, -0.08525141, 1.93724, 1, 1, 1, 1, 1,
1.959783, -0.8743578, 2.821988, 1, 1, 1, 1, 1,
1.986459, 0.6200212, 2.193545, 1, 1, 1, 1, 1,
2.002239, -0.5103672, 2.573494, 0, 0, 1, 1, 1,
2.014009, 1.379037, 0.5117588, 1, 0, 0, 1, 1,
2.029271, 1.272156, 1.525948, 1, 0, 0, 1, 1,
2.037851, -0.5289742, 2.002908, 1, 0, 0, 1, 1,
2.125588, 0.8920979, 0.8275334, 1, 0, 0, 1, 1,
2.155209, -0.1711985, 2.240214, 1, 0, 0, 1, 1,
2.170709, -1.273266, 1.767626, 0, 0, 0, 1, 1,
2.17571, -1.331562, 3.711055, 0, 0, 0, 1, 1,
2.278014, 1.09593, 0.7193654, 0, 0, 0, 1, 1,
2.30753, 2.226428, 2.074913, 0, 0, 0, 1, 1,
2.337976, 0.4427042, 0.7794171, 0, 0, 0, 1, 1,
2.380336, 2.342984, 1.922716, 0, 0, 0, 1, 1,
2.396931, 0.8430357, 2.605923, 0, 0, 0, 1, 1,
2.417397, -0.1752772, 2.091542, 1, 1, 1, 1, 1,
2.491377, 0.08098442, 1.852171, 1, 1, 1, 1, 1,
2.549246, -0.4950878, 1.332495, 1, 1, 1, 1, 1,
2.660806, 0.4445835, 1.3327, 1, 1, 1, 1, 1,
3.071443, 1.486507, 1.042969, 1, 1, 1, 1, 1,
3.106867, -0.6209153, 0.494456, 1, 1, 1, 1, 1,
3.45105, 0.08673339, -0.5324593, 1, 1, 1, 1, 1
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
var radius = 9.648661;
var distance = 33.89051;
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
mvMatrix.translate( -0.1063933, 0.6359122, -0.0929296 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89051);
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
