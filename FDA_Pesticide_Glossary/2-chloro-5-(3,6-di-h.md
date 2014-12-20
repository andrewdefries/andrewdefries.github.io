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
-3.858666, 1.086558, -0.7610488, 1, 0, 0, 1,
-3.832598, -1.440004, -1.763605, 1, 0.007843138, 0, 1,
-3.565762, -0.2219875, -3.498387, 1, 0.01176471, 0, 1,
-3.520277, -0.008304164, -1.358626, 1, 0.01960784, 0, 1,
-3.040996, 0.7860045, -0.9955716, 1, 0.02352941, 0, 1,
-2.819847, -0.453692, -2.077698, 1, 0.03137255, 0, 1,
-2.702178, 0.9666852, 0.7683507, 1, 0.03529412, 0, 1,
-2.587359, -0.4620698, 0.1362133, 1, 0.04313726, 0, 1,
-2.526307, 0.548568, -1.214939, 1, 0.04705882, 0, 1,
-2.500595, 0.5130416, -1.107711, 1, 0.05490196, 0, 1,
-2.476804, 0.8331297, -1.559447, 1, 0.05882353, 0, 1,
-2.441456, -0.8492023, -0.5448398, 1, 0.06666667, 0, 1,
-2.438742, -0.3664112, -0.3514878, 1, 0.07058824, 0, 1,
-2.398536, 1.94802, 0.3876183, 1, 0.07843138, 0, 1,
-2.379054, -1.530264, -2.857927, 1, 0.08235294, 0, 1,
-2.336013, 0.5717583, -0.9488625, 1, 0.09019608, 0, 1,
-2.266474, -0.04061701, -2.703144, 1, 0.09411765, 0, 1,
-2.251658, 0.3521721, -2.910901, 1, 0.1019608, 0, 1,
-2.194039, -0.8818584, -1.73423, 1, 0.1098039, 0, 1,
-2.156132, 0.1388798, -0.0009960777, 1, 0.1137255, 0, 1,
-2.123602, -0.1925509, 0.01400132, 1, 0.1215686, 0, 1,
-2.112487, -0.3879869, -3.324939, 1, 0.1254902, 0, 1,
-2.042173, 0.150402, -0.8479834, 1, 0.1333333, 0, 1,
-2.030481, -0.2597448, -1.965589, 1, 0.1372549, 0, 1,
-2.028086, -2.168547, -4.449604, 1, 0.145098, 0, 1,
-1.998913, 0.4111646, -1.334203, 1, 0.1490196, 0, 1,
-1.993546, -1.012605, -4.240835, 1, 0.1568628, 0, 1,
-1.987237, -0.9563489, -1.265942, 1, 0.1607843, 0, 1,
-1.975814, 2.080857, -1.315354, 1, 0.1686275, 0, 1,
-1.972657, 0.7440024, -1.940121, 1, 0.172549, 0, 1,
-1.96582, -0.02521089, -1.144126, 1, 0.1803922, 0, 1,
-1.936849, -1.992929, -2.595291, 1, 0.1843137, 0, 1,
-1.90414, 0.03082178, -0.8603251, 1, 0.1921569, 0, 1,
-1.902322, -1.187194, -0.6212328, 1, 0.1960784, 0, 1,
-1.890177, 0.05925012, -0.6229939, 1, 0.2039216, 0, 1,
-1.866041, 0.6382816, -0.5716604, 1, 0.2117647, 0, 1,
-1.852165, 1.404426, -0.3811941, 1, 0.2156863, 0, 1,
-1.839399, 0.8998257, -1.183751, 1, 0.2235294, 0, 1,
-1.834748, -2.278075, -3.048686, 1, 0.227451, 0, 1,
-1.81847, 0.3775017, -0.7516845, 1, 0.2352941, 0, 1,
-1.7879, -1.289178, -1.251583, 1, 0.2392157, 0, 1,
-1.783376, 0.3003554, -2.21762, 1, 0.2470588, 0, 1,
-1.776037, -0.1532635, -1.65169, 1, 0.2509804, 0, 1,
-1.770725, 0.3067297, -0.6902675, 1, 0.2588235, 0, 1,
-1.767154, -0.5955988, -1.790703, 1, 0.2627451, 0, 1,
-1.758443, 0.4913087, -2.17866, 1, 0.2705882, 0, 1,
-1.732833, 0.3031419, -1.861002, 1, 0.2745098, 0, 1,
-1.729612, -0.7473345, -2.893312, 1, 0.282353, 0, 1,
-1.722795, 0.9412622, -1.567344, 1, 0.2862745, 0, 1,
-1.721899, -0.432117, -1.646788, 1, 0.2941177, 0, 1,
-1.718488, 0.7420233, -0.4536196, 1, 0.3019608, 0, 1,
-1.708642, 0.2612348, -2.436392, 1, 0.3058824, 0, 1,
-1.708113, -0.5659251, -1.514871, 1, 0.3137255, 0, 1,
-1.701119, 0.320332, -2.6604, 1, 0.3176471, 0, 1,
-1.699726, 0.2160589, -0.06638779, 1, 0.3254902, 0, 1,
-1.691609, -0.08317645, -0.9096389, 1, 0.3294118, 0, 1,
-1.68023, -1.849107, -1.64313, 1, 0.3372549, 0, 1,
-1.660796, -2.409497, -2.199446, 1, 0.3411765, 0, 1,
-1.652599, 0.2487634, -2.880519, 1, 0.3490196, 0, 1,
-1.650682, -1.8882, -0.2469616, 1, 0.3529412, 0, 1,
-1.640018, -0.1683889, -1.980436, 1, 0.3607843, 0, 1,
-1.633954, 0.1680709, 0.8526218, 1, 0.3647059, 0, 1,
-1.625003, 1.728048, -0.5007544, 1, 0.372549, 0, 1,
-1.604522, 1.215187, -1.979507, 1, 0.3764706, 0, 1,
-1.594232, -0.02369857, -3.894548, 1, 0.3843137, 0, 1,
-1.590836, 0.6128639, -1.259438, 1, 0.3882353, 0, 1,
-1.589125, 0.6950387, -2.435851, 1, 0.3960784, 0, 1,
-1.584836, 0.4139985, -1.182549, 1, 0.4039216, 0, 1,
-1.582051, 0.9562384, -1.562066, 1, 0.4078431, 0, 1,
-1.575098, -1.127656, -2.62668, 1, 0.4156863, 0, 1,
-1.574998, -0.6793827, -2.106452, 1, 0.4196078, 0, 1,
-1.574924, 0.9719006, 0.4704978, 1, 0.427451, 0, 1,
-1.571343, 0.06262472, -0.6796309, 1, 0.4313726, 0, 1,
-1.556942, -1.203868, -2.214337, 1, 0.4392157, 0, 1,
-1.556072, 0.2418368, -0.5776286, 1, 0.4431373, 0, 1,
-1.540288, -2.559982, -3.48854, 1, 0.4509804, 0, 1,
-1.53557, -0.9173904, -3.784472, 1, 0.454902, 0, 1,
-1.526953, -0.2718794, -2.283271, 1, 0.4627451, 0, 1,
-1.512712, -0.5352052, -2.12677, 1, 0.4666667, 0, 1,
-1.512364, 0.1965835, -1.304369, 1, 0.4745098, 0, 1,
-1.5075, -0.05422283, -1.184931, 1, 0.4784314, 0, 1,
-1.473085, -0.9420472, -0.9412951, 1, 0.4862745, 0, 1,
-1.465357, 0.4125356, -1.755654, 1, 0.4901961, 0, 1,
-1.458131, -0.1060773, -1.094481, 1, 0.4980392, 0, 1,
-1.434299, 1.417997, -1.580682, 1, 0.5058824, 0, 1,
-1.427997, -1.182878, -2.122513, 1, 0.509804, 0, 1,
-1.425079, -1.164559, -2.462177, 1, 0.5176471, 0, 1,
-1.425069, -0.5197427, -2.393194, 1, 0.5215687, 0, 1,
-1.42248, 1.85258, -1.639904, 1, 0.5294118, 0, 1,
-1.418459, 0.9564691, -0.6539909, 1, 0.5333334, 0, 1,
-1.41759, 0.9835158, 0.3312305, 1, 0.5411765, 0, 1,
-1.409408, 0.3562197, -1.152671, 1, 0.5450981, 0, 1,
-1.409394, 1.403677, 0.1380171, 1, 0.5529412, 0, 1,
-1.393177, 1.638965, -0.5104141, 1, 0.5568628, 0, 1,
-1.392918, -2.1593, -3.416343, 1, 0.5647059, 0, 1,
-1.392186, 0.05454485, -3.189691, 1, 0.5686275, 0, 1,
-1.380023, -2.536741, -2.271336, 1, 0.5764706, 0, 1,
-1.360911, -0.6332681, -0.3449677, 1, 0.5803922, 0, 1,
-1.355582, -2.078412, -2.540604, 1, 0.5882353, 0, 1,
-1.355135, -1.969481, -3.090226, 1, 0.5921569, 0, 1,
-1.35043, -0.3157361, 0.6062662, 1, 0.6, 0, 1,
-1.333699, 0.009549637, 0.5670716, 1, 0.6078432, 0, 1,
-1.332588, -0.0592038, -2.076587, 1, 0.6117647, 0, 1,
-1.32743, 0.03208135, -2.953887, 1, 0.6196079, 0, 1,
-1.327249, 0.8548533, -1.815465, 1, 0.6235294, 0, 1,
-1.319995, 0.1414811, -0.5445235, 1, 0.6313726, 0, 1,
-1.304813, -1.690746, -2.235393, 1, 0.6352941, 0, 1,
-1.303244, -0.4091127, -2.292987, 1, 0.6431373, 0, 1,
-1.296597, 1.673709, -0.8519121, 1, 0.6470588, 0, 1,
-1.276269, 0.27496, -1.953662, 1, 0.654902, 0, 1,
-1.270695, 0.9452451, -2.879945, 1, 0.6588235, 0, 1,
-1.257604, 0.4740717, -0.6012641, 1, 0.6666667, 0, 1,
-1.250743, 0.224268, -2.638315, 1, 0.6705883, 0, 1,
-1.248772, 0.2358053, -0.3896632, 1, 0.6784314, 0, 1,
-1.248062, -0.7233537, -0.6455339, 1, 0.682353, 0, 1,
-1.245681, 1.090783, -2.685997, 1, 0.6901961, 0, 1,
-1.244281, -1.639338, -2.421681, 1, 0.6941177, 0, 1,
-1.240827, 0.7743713, -0.6624198, 1, 0.7019608, 0, 1,
-1.230175, 0.8107095, 0.7748088, 1, 0.7098039, 0, 1,
-1.227327, 0.9559977, -0.05156901, 1, 0.7137255, 0, 1,
-1.214083, -2.803592, -3.143575, 1, 0.7215686, 0, 1,
-1.20764, -0.705503, -2.558323, 1, 0.7254902, 0, 1,
-1.205268, -0.3769252, -2.846906, 1, 0.7333333, 0, 1,
-1.201825, -0.4575774, -2.745982, 1, 0.7372549, 0, 1,
-1.198512, 0.1831613, -1.026194, 1, 0.7450981, 0, 1,
-1.196978, -0.5875818, -2.29432, 1, 0.7490196, 0, 1,
-1.190191, -0.5967373, -2.802183, 1, 0.7568628, 0, 1,
-1.189653, -0.8571727, -1.78757, 1, 0.7607843, 0, 1,
-1.175871, -2.889812, -2.593437, 1, 0.7686275, 0, 1,
-1.173643, 0.9120586, -1.126539, 1, 0.772549, 0, 1,
-1.168466, -0.69531, -1.613592, 1, 0.7803922, 0, 1,
-1.166052, -2.175142, -4.60952, 1, 0.7843137, 0, 1,
-1.164431, 0.3395257, -2.11631, 1, 0.7921569, 0, 1,
-1.151043, -0.6070424, -1.371991, 1, 0.7960784, 0, 1,
-1.150057, 0.2193465, -2.991428, 1, 0.8039216, 0, 1,
-1.147699, -2.331587, -6.211549, 1, 0.8117647, 0, 1,
-1.139056, 0.8562139, -2.802493, 1, 0.8156863, 0, 1,
-1.131726, 0.823735, -2.420341, 1, 0.8235294, 0, 1,
-1.131402, -0.04988362, 0.7969598, 1, 0.827451, 0, 1,
-1.131154, 0.5598013, -1.914975, 1, 0.8352941, 0, 1,
-1.13054, -1.398222, -3.898587, 1, 0.8392157, 0, 1,
-1.127868, -0.006340318, -1.661731, 1, 0.8470588, 0, 1,
-1.125586, -2.806036, -3.523866, 1, 0.8509804, 0, 1,
-1.124571, 0.4700346, -1.086737, 1, 0.8588235, 0, 1,
-1.115281, -0.322809, -1.575485, 1, 0.8627451, 0, 1,
-1.110832, 0.9655523, -0.3024824, 1, 0.8705882, 0, 1,
-1.107077, 0.1259344, -1.253903, 1, 0.8745098, 0, 1,
-1.105674, 0.1892474, -0.6832498, 1, 0.8823529, 0, 1,
-1.103625, -1.295123, -2.191543, 1, 0.8862745, 0, 1,
-1.100738, -0.8332065, -1.611989, 1, 0.8941177, 0, 1,
-1.092134, 0.1410729, -0.1526038, 1, 0.8980392, 0, 1,
-1.091403, -0.3889693, -1.804565, 1, 0.9058824, 0, 1,
-1.086171, 0.8002235, -3.708456, 1, 0.9137255, 0, 1,
-1.082705, 0.6019054, -0.4669544, 1, 0.9176471, 0, 1,
-1.079528, -0.7238932, -2.082628, 1, 0.9254902, 0, 1,
-1.073322, 0.889827, -1.488709, 1, 0.9294118, 0, 1,
-1.063163, 0.1613097, -0.6079789, 1, 0.9372549, 0, 1,
-1.062018, -0.008095181, -1.379403, 1, 0.9411765, 0, 1,
-1.060969, 1.074324, -0.5495966, 1, 0.9490196, 0, 1,
-1.060593, 1.524904, -0.6160966, 1, 0.9529412, 0, 1,
-1.052957, 0.2066107, -1.975034, 1, 0.9607843, 0, 1,
-1.04909, -3.353714, -4.078401, 1, 0.9647059, 0, 1,
-1.048463, -0.898377, -2.714833, 1, 0.972549, 0, 1,
-1.0435, -1.860659, -0.2965842, 1, 0.9764706, 0, 1,
-1.042206, -0.4239072, -3.857603, 1, 0.9843137, 0, 1,
-1.040053, -1.79661, -0.6959675, 1, 0.9882353, 0, 1,
-1.033611, 0.08463977, -0.28815, 1, 0.9960784, 0, 1,
-1.032038, 0.9725929, -0.1153698, 0.9960784, 1, 0, 1,
-1.028325, 0.4802748, -0.5160754, 0.9921569, 1, 0, 1,
-1.021416, -0.298965, -2.889308, 0.9843137, 1, 0, 1,
-1.01835, 0.07483533, -1.867361, 0.9803922, 1, 0, 1,
-1.013732, 0.3475004, -1.301938, 0.972549, 1, 0, 1,
-1.011599, 0.321728, -2.962524, 0.9686275, 1, 0, 1,
-1.011294, -2.509848, -2.934071, 0.9607843, 1, 0, 1,
-1.011128, 1.199, 0.616088, 0.9568627, 1, 0, 1,
-1.008643, -0.4012469, -1.667511, 0.9490196, 1, 0, 1,
-1.00091, -1.031409, -0.3719697, 0.945098, 1, 0, 1,
-0.9998363, 0.861556, -0.8413261, 0.9372549, 1, 0, 1,
-0.9970795, 0.2777841, -1.687905, 0.9333333, 1, 0, 1,
-0.997051, 0.2910599, -0.3592734, 0.9254902, 1, 0, 1,
-0.9942854, -1.747503, -1.866625, 0.9215686, 1, 0, 1,
-0.9896063, 1.865816, -0.8622903, 0.9137255, 1, 0, 1,
-0.9895812, 0.119533, -2.856723, 0.9098039, 1, 0, 1,
-0.9867758, 0.3581401, -1.586809, 0.9019608, 1, 0, 1,
-0.9778779, -0.2188035, -2.09814, 0.8941177, 1, 0, 1,
-0.9770899, -0.7823129, -2.958321, 0.8901961, 1, 0, 1,
-0.9770372, -1.701018, -3.22302, 0.8823529, 1, 0, 1,
-0.975867, 0.0147508, -0.210492, 0.8784314, 1, 0, 1,
-0.9753233, 1.441352, -0.8285105, 0.8705882, 1, 0, 1,
-0.9554865, 0.149916, -0.2865702, 0.8666667, 1, 0, 1,
-0.9531054, 0.7934493, -0.6065621, 0.8588235, 1, 0, 1,
-0.9437018, 1.215013, -1.463747, 0.854902, 1, 0, 1,
-0.9373327, 0.1185582, -0.8346756, 0.8470588, 1, 0, 1,
-0.9279362, -1.164664, -0.5879988, 0.8431373, 1, 0, 1,
-0.9252703, -0.6257549, -3.723415, 0.8352941, 1, 0, 1,
-0.9191775, -0.1021765, -2.806347, 0.8313726, 1, 0, 1,
-0.918697, -1.937934, -2.453574, 0.8235294, 1, 0, 1,
-0.9089117, -1.038132, -0.2236608, 0.8196079, 1, 0, 1,
-0.9080087, -0.1818865, -0.5216056, 0.8117647, 1, 0, 1,
-0.90538, 0.8951454, -1.522399, 0.8078431, 1, 0, 1,
-0.9037861, -0.7569984, -2.830492, 0.8, 1, 0, 1,
-0.9036753, 0.917502, 0.6971416, 0.7921569, 1, 0, 1,
-0.8901081, -0.2072928, -1.240042, 0.7882353, 1, 0, 1,
-0.88752, -1.601094, -2.720212, 0.7803922, 1, 0, 1,
-0.8872668, -2.546009, -2.812972, 0.7764706, 1, 0, 1,
-0.8841477, 0.108772, -0.2431108, 0.7686275, 1, 0, 1,
-0.8833712, -0.03233169, -1.739216, 0.7647059, 1, 0, 1,
-0.8800785, 0.7293096, -0.8387532, 0.7568628, 1, 0, 1,
-0.8764834, -1.756736, -1.320605, 0.7529412, 1, 0, 1,
-0.8736302, 0.5907135, -1.170522, 0.7450981, 1, 0, 1,
-0.8711625, 0.4792223, -1.588815, 0.7411765, 1, 0, 1,
-0.8672326, -0.2732302, -1.666801, 0.7333333, 1, 0, 1,
-0.8659785, 0.2305322, -0.7926431, 0.7294118, 1, 0, 1,
-0.8597791, -0.8594646, -1.835075, 0.7215686, 1, 0, 1,
-0.8588023, 1.289026, -1.389707, 0.7176471, 1, 0, 1,
-0.8543103, -1.225676, -2.808256, 0.7098039, 1, 0, 1,
-0.8527184, -0.4472294, -0.6910283, 0.7058824, 1, 0, 1,
-0.846849, 0.1452132, -1.470471, 0.6980392, 1, 0, 1,
-0.8430176, 0.2384456, -1.369462, 0.6901961, 1, 0, 1,
-0.8425805, -0.8469595, -3.802901, 0.6862745, 1, 0, 1,
-0.8374277, -0.386792, -2.839998, 0.6784314, 1, 0, 1,
-0.8365592, 0.0371835, -1.143685, 0.6745098, 1, 0, 1,
-0.8359657, 1.051716, -0.2267515, 0.6666667, 1, 0, 1,
-0.8265052, 0.6544937, -1.825203, 0.6627451, 1, 0, 1,
-0.8166289, -0.5172286, -0.2407012, 0.654902, 1, 0, 1,
-0.8125862, -1.976046, -3.079103, 0.6509804, 1, 0, 1,
-0.8079965, -0.3489753, -2.421261, 0.6431373, 1, 0, 1,
-0.8069269, 1.744306, -0.3978548, 0.6392157, 1, 0, 1,
-0.8051845, 2.306627, -0.290635, 0.6313726, 1, 0, 1,
-0.7995111, -0.3093462, -2.889563, 0.627451, 1, 0, 1,
-0.7965591, -0.6331612, -2.325795, 0.6196079, 1, 0, 1,
-0.7935174, 0.6264713, 0.04390085, 0.6156863, 1, 0, 1,
-0.7920998, -0.5094611, -1.794652, 0.6078432, 1, 0, 1,
-0.7919454, -1.730022, -0.8826537, 0.6039216, 1, 0, 1,
-0.7885263, -0.2694144, -0.4358366, 0.5960785, 1, 0, 1,
-0.7873092, -0.5720245, -2.017777, 0.5882353, 1, 0, 1,
-0.7865482, -1.05254, -2.326166, 0.5843138, 1, 0, 1,
-0.7856376, -0.4077527, -1.257625, 0.5764706, 1, 0, 1,
-0.782765, 0.1905922, 0.4366621, 0.572549, 1, 0, 1,
-0.7795868, -1.091004, -3.390444, 0.5647059, 1, 0, 1,
-0.7767432, -0.3253851, -2.476812, 0.5607843, 1, 0, 1,
-0.7725764, 1.792465, -0.2995273, 0.5529412, 1, 0, 1,
-0.7663549, 1.240143, -0.8966007, 0.5490196, 1, 0, 1,
-0.763029, -1.45372, -2.245799, 0.5411765, 1, 0, 1,
-0.7626812, 0.5389941, -1.103652, 0.5372549, 1, 0, 1,
-0.758754, 0.1021613, -0.4077421, 0.5294118, 1, 0, 1,
-0.7575731, 0.1665617, -0.1297489, 0.5254902, 1, 0, 1,
-0.7574692, 0.193642, -1.10361, 0.5176471, 1, 0, 1,
-0.7557263, 0.8573674, -1.614125, 0.5137255, 1, 0, 1,
-0.7529504, 0.3846903, -0.1322563, 0.5058824, 1, 0, 1,
-0.7498869, 1.324116, 0.3121033, 0.5019608, 1, 0, 1,
-0.7460809, 1.196395, -1.470941, 0.4941176, 1, 0, 1,
-0.7434044, -0.4125804, -2.071467, 0.4862745, 1, 0, 1,
-0.7405795, 0.893254, -1.476632, 0.4823529, 1, 0, 1,
-0.7297105, -0.427318, -2.897732, 0.4745098, 1, 0, 1,
-0.7296466, 0.7650872, 0.8178784, 0.4705882, 1, 0, 1,
-0.7291561, 0.1677388, -0.05421323, 0.4627451, 1, 0, 1,
-0.7258313, 0.4713287, -1.161904, 0.4588235, 1, 0, 1,
-0.7233437, 0.4118002, -1.461331, 0.4509804, 1, 0, 1,
-0.7217608, 0.9375306, -0.8861911, 0.4470588, 1, 0, 1,
-0.7217413, -0.4688854, -2.302226, 0.4392157, 1, 0, 1,
-0.7191476, 0.1500757, -3.444474, 0.4352941, 1, 0, 1,
-0.7141519, 1.480307, -0.2421394, 0.427451, 1, 0, 1,
-0.7136428, 1.434057, -2.485401, 0.4235294, 1, 0, 1,
-0.7057544, -0.0461706, -1.014113, 0.4156863, 1, 0, 1,
-0.7043627, 0.129116, -1.669955, 0.4117647, 1, 0, 1,
-0.6999329, 1.009198, 1.110758, 0.4039216, 1, 0, 1,
-0.693612, -1.242539, -0.7428788, 0.3960784, 1, 0, 1,
-0.6890182, 0.2081731, -1.452331, 0.3921569, 1, 0, 1,
-0.6776938, -1.025619, 1.024354, 0.3843137, 1, 0, 1,
-0.6723348, -1.869953, -3.472528, 0.3803922, 1, 0, 1,
-0.6647918, -3.31338, -2.405736, 0.372549, 1, 0, 1,
-0.6639853, -0.3617846, -0.3721099, 0.3686275, 1, 0, 1,
-0.663537, -0.3539972, -2.324528, 0.3607843, 1, 0, 1,
-0.6539962, -0.8942005, -1.321511, 0.3568628, 1, 0, 1,
-0.653146, -1.189954, 0.2374053, 0.3490196, 1, 0, 1,
-0.6530992, -0.8922119, -3.565449, 0.345098, 1, 0, 1,
-0.6522112, 0.4636276, -0.4601681, 0.3372549, 1, 0, 1,
-0.6502191, -1.973133, -5.239651, 0.3333333, 1, 0, 1,
-0.6419988, 1.021029, -0.9110681, 0.3254902, 1, 0, 1,
-0.6266591, 0.03689084, -2.008926, 0.3215686, 1, 0, 1,
-0.6262702, 0.03602269, -0.1589007, 0.3137255, 1, 0, 1,
-0.6198397, -0.9010167, 0.0950391, 0.3098039, 1, 0, 1,
-0.6092948, 0.5546821, -1.922088, 0.3019608, 1, 0, 1,
-0.6092939, -0.5958386, -2.723366, 0.2941177, 1, 0, 1,
-0.5990903, 1.850751, 0.7604036, 0.2901961, 1, 0, 1,
-0.5969757, -1.112457, -2.154746, 0.282353, 1, 0, 1,
-0.5907434, -0.4753993, -0.8659543, 0.2784314, 1, 0, 1,
-0.5899727, -0.05096289, -2.225595, 0.2705882, 1, 0, 1,
-0.5853247, -1.069923, -1.942663, 0.2666667, 1, 0, 1,
-0.5852264, 0.335439, -2.343106, 0.2588235, 1, 0, 1,
-0.5850928, 0.1741401, -2.024095, 0.254902, 1, 0, 1,
-0.5796815, 0.674594, -2.123486, 0.2470588, 1, 0, 1,
-0.576933, 0.6665708, -0.2467573, 0.2431373, 1, 0, 1,
-0.5714235, -0.912394, -3.133063, 0.2352941, 1, 0, 1,
-0.5687391, 1.836054, 0.7900031, 0.2313726, 1, 0, 1,
-0.5678537, 0.3574895, -0.411751, 0.2235294, 1, 0, 1,
-0.5648455, -1.264488, -4.378697, 0.2196078, 1, 0, 1,
-0.5646346, -1.712677, -2.514348, 0.2117647, 1, 0, 1,
-0.5627384, 0.5046574, -0.258362, 0.2078431, 1, 0, 1,
-0.5465536, -0.3210037, -1.750826, 0.2, 1, 0, 1,
-0.5453146, 0.1543205, -1.210377, 0.1921569, 1, 0, 1,
-0.5315853, -0.02203589, 0.05473059, 0.1882353, 1, 0, 1,
-0.5310737, 0.5086734, -3.037302, 0.1803922, 1, 0, 1,
-0.5305466, -1.384506, -3.364271, 0.1764706, 1, 0, 1,
-0.5279239, 0.7886318, -0.6848238, 0.1686275, 1, 0, 1,
-0.5254507, 0.09850773, -1.607714, 0.1647059, 1, 0, 1,
-0.524346, -0.5604168, -3.088546, 0.1568628, 1, 0, 1,
-0.5235488, -0.7339272, -3.07999, 0.1529412, 1, 0, 1,
-0.5218247, -0.4061261, -2.293154, 0.145098, 1, 0, 1,
-0.5144318, 2.441034, -0.1756583, 0.1411765, 1, 0, 1,
-0.5132809, -1.373802, -3.225636, 0.1333333, 1, 0, 1,
-0.5101863, -0.05984958, -2.406894, 0.1294118, 1, 0, 1,
-0.4977108, -1.521046, -3.943499, 0.1215686, 1, 0, 1,
-0.4975367, -0.1303721, -0.1546228, 0.1176471, 1, 0, 1,
-0.4966709, 1.66228, -1.231551, 0.1098039, 1, 0, 1,
-0.4898221, -0.01418967, 0.5764415, 0.1058824, 1, 0, 1,
-0.4846991, -0.4988761, -2.345203, 0.09803922, 1, 0, 1,
-0.4825934, -0.4874198, -3.21452, 0.09019608, 1, 0, 1,
-0.4807677, -0.7206132, -1.71129, 0.08627451, 1, 0, 1,
-0.4786721, -0.8146184, -3.668741, 0.07843138, 1, 0, 1,
-0.4785906, 1.633214, 1.298108, 0.07450981, 1, 0, 1,
-0.4773487, 0.304443, -1.1943, 0.06666667, 1, 0, 1,
-0.474388, -2.538314, -4.728296, 0.0627451, 1, 0, 1,
-0.4743215, -0.7827448, -1.616865, 0.05490196, 1, 0, 1,
-0.4734938, -0.6492556, -3.698637, 0.05098039, 1, 0, 1,
-0.4703285, -2.177068, -2.830166, 0.04313726, 1, 0, 1,
-0.4673917, 0.9279023, 0.6185869, 0.03921569, 1, 0, 1,
-0.4616742, -0.132923, -2.335796, 0.03137255, 1, 0, 1,
-0.4601675, 0.5161069, -0.6544899, 0.02745098, 1, 0, 1,
-0.452899, 1.333875, 1.454906, 0.01960784, 1, 0, 1,
-0.4522191, 0.8198563, -1.248031, 0.01568628, 1, 0, 1,
-0.4513377, 0.5251863, -1.004962, 0.007843138, 1, 0, 1,
-0.4501326, -1.288509, -1.85309, 0.003921569, 1, 0, 1,
-0.4497298, -1.110262, -4.780077, 0, 1, 0.003921569, 1,
-0.4496465, -0.2242499, -2.632421, 0, 1, 0.01176471, 1,
-0.4479927, -1.604377, -3.73815, 0, 1, 0.01568628, 1,
-0.4476402, -1.625875, -3.741267, 0, 1, 0.02352941, 1,
-0.447429, 0.4419376, 0.6826727, 0, 1, 0.02745098, 1,
-0.4461468, 1.985795, 0.4654257, 0, 1, 0.03529412, 1,
-0.4411771, 0.1990956, -1.291938, 0, 1, 0.03921569, 1,
-0.4383603, -0.8399214, -3.923656, 0, 1, 0.04705882, 1,
-0.4372257, 1.19033, -0.3252285, 0, 1, 0.05098039, 1,
-0.4358923, 1.614625, -1.506521, 0, 1, 0.05882353, 1,
-0.429088, -0.1840799, -0.8281548, 0, 1, 0.0627451, 1,
-0.428673, 1.854202, -0.7898565, 0, 1, 0.07058824, 1,
-0.4224764, 0.8226649, -1.694337, 0, 1, 0.07450981, 1,
-0.4214004, -0.4401382, -3.110054, 0, 1, 0.08235294, 1,
-0.4207535, 0.3669617, -0.7930972, 0, 1, 0.08627451, 1,
-0.4205068, -2.337157, -2.953814, 0, 1, 0.09411765, 1,
-0.4183399, 0.07762711, -3.102742, 0, 1, 0.1019608, 1,
-0.4178494, 0.7676294, -1.543377, 0, 1, 0.1058824, 1,
-0.4088846, 1.530011, -2.315551, 0, 1, 0.1137255, 1,
-0.4058655, -0.6810103, -2.106814, 0, 1, 0.1176471, 1,
-0.4022606, -0.4062167, -3.219779, 0, 1, 0.1254902, 1,
-0.4011431, 0.6506819, -1.783015, 0, 1, 0.1294118, 1,
-0.401058, 0.01287146, -2.297673, 0, 1, 0.1372549, 1,
-0.3975836, 0.7741253, 0.7161973, 0, 1, 0.1411765, 1,
-0.3947881, -1.539029, -2.811126, 0, 1, 0.1490196, 1,
-0.3887885, 1.224306, -0.2298188, 0, 1, 0.1529412, 1,
-0.3820409, -0.7685735, -4.013093, 0, 1, 0.1607843, 1,
-0.3817803, 1.748289, -0.1934266, 0, 1, 0.1647059, 1,
-0.3791204, 0.09898671, -0.2790682, 0, 1, 0.172549, 1,
-0.3738983, 0.7267835, -0.1044735, 0, 1, 0.1764706, 1,
-0.3708723, -0.5703903, -2.110286, 0, 1, 0.1843137, 1,
-0.3676408, 0.06647471, -1.202184, 0, 1, 0.1882353, 1,
-0.364966, -0.9257931, -3.150159, 0, 1, 0.1960784, 1,
-0.3610917, 0.2123374, 0.441192, 0, 1, 0.2039216, 1,
-0.3556632, 1.153782, 0.644142, 0, 1, 0.2078431, 1,
-0.3512637, -0.860389, -0.6611775, 0, 1, 0.2156863, 1,
-0.3434748, 0.1122, -1.141257, 0, 1, 0.2196078, 1,
-0.3423416, -1.29332, -2.622541, 0, 1, 0.227451, 1,
-0.3417982, 0.9919559, 0.1715659, 0, 1, 0.2313726, 1,
-0.3378925, -0.6093624, -2.334172, 0, 1, 0.2392157, 1,
-0.3295854, 0.08351788, -1.526839, 0, 1, 0.2431373, 1,
-0.3287645, 0.5399683, -0.7712091, 0, 1, 0.2509804, 1,
-0.3267493, -1.016611, -3.02241, 0, 1, 0.254902, 1,
-0.3258329, -1.447322, -2.680544, 0, 1, 0.2627451, 1,
-0.3239761, 0.3718233, -0.1489581, 0, 1, 0.2666667, 1,
-0.3170916, 0.9474683, -2.089367, 0, 1, 0.2745098, 1,
-0.3159012, -1.193018, -3.921965, 0, 1, 0.2784314, 1,
-0.3134656, -0.06676784, 0.8098274, 0, 1, 0.2862745, 1,
-0.3109909, -0.7664306, -4.718113, 0, 1, 0.2901961, 1,
-0.3106178, 1.479746, 0.2504479, 0, 1, 0.2980392, 1,
-0.310462, -0.1846756, -1.73684, 0, 1, 0.3058824, 1,
-0.3088908, -0.5168505, -1.396046, 0, 1, 0.3098039, 1,
-0.3067955, 1.280887, 0.1748084, 0, 1, 0.3176471, 1,
-0.3049918, -1.022091, -1.426088, 0, 1, 0.3215686, 1,
-0.3022068, 1.521976, -0.5980053, 0, 1, 0.3294118, 1,
-0.301308, -0.4876681, -3.670563, 0, 1, 0.3333333, 1,
-0.2996771, -1.289556, -3.035848, 0, 1, 0.3411765, 1,
-0.2959857, -1.403374, -2.446454, 0, 1, 0.345098, 1,
-0.2955559, -0.8386462, -0.6304401, 0, 1, 0.3529412, 1,
-0.2917521, 0.08537795, 0.2702643, 0, 1, 0.3568628, 1,
-0.2893646, 0.4334674, -0.941216, 0, 1, 0.3647059, 1,
-0.2880002, 0.013383, -1.307802, 0, 1, 0.3686275, 1,
-0.2861805, 0.06404209, -2.146764, 0, 1, 0.3764706, 1,
-0.2858685, 2.109526, 2.241794, 0, 1, 0.3803922, 1,
-0.2829541, 0.005779447, -2.658796, 0, 1, 0.3882353, 1,
-0.2817425, -1.339356, -1.227098, 0, 1, 0.3921569, 1,
-0.2697022, 1.164532, -1.732484, 0, 1, 0.4, 1,
-0.2696605, 0.8634591, 1.346609, 0, 1, 0.4078431, 1,
-0.2668587, -0.3341061, -2.345927, 0, 1, 0.4117647, 1,
-0.2642347, 1.426517, -2.21527, 0, 1, 0.4196078, 1,
-0.2613751, 1.066913, -0.879137, 0, 1, 0.4235294, 1,
-0.2605277, 0.8323782, -0.5543226, 0, 1, 0.4313726, 1,
-0.2586096, -0.2681021, -5.878394, 0, 1, 0.4352941, 1,
-0.2565285, -0.4380843, -3.07256, 0, 1, 0.4431373, 1,
-0.2519383, 0.6890289, 0.4265441, 0, 1, 0.4470588, 1,
-0.2504643, 0.5754526, -1.518807, 0, 1, 0.454902, 1,
-0.2490678, 0.4890193, -0.6962533, 0, 1, 0.4588235, 1,
-0.24778, 0.184562, -1.19108, 0, 1, 0.4666667, 1,
-0.2447573, -1.930182, -3.210174, 0, 1, 0.4705882, 1,
-0.2382784, -0.6156483, -3.012165, 0, 1, 0.4784314, 1,
-0.2379405, -0.8987564, -3.725228, 0, 1, 0.4823529, 1,
-0.237379, -0.7395504, -1.413339, 0, 1, 0.4901961, 1,
-0.2369786, 0.1719251, -1.247828, 0, 1, 0.4941176, 1,
-0.2355026, 1.510255, 0.7939156, 0, 1, 0.5019608, 1,
-0.2260176, -2.07834, -1.47909, 0, 1, 0.509804, 1,
-0.2243418, 0.4094782, -1.202237, 0, 1, 0.5137255, 1,
-0.2239426, 0.3776939, 0.1607609, 0, 1, 0.5215687, 1,
-0.2234479, -0.1487499, -0.2584516, 0, 1, 0.5254902, 1,
-0.2211967, -0.04091368, -2.692336, 0, 1, 0.5333334, 1,
-0.2209378, -0.06783891, -1.552803, 0, 1, 0.5372549, 1,
-0.218846, 0.9213306, -1.879792, 0, 1, 0.5450981, 1,
-0.2131155, -0.5810719, -2.960413, 0, 1, 0.5490196, 1,
-0.212258, 0.9374547, 1.174864, 0, 1, 0.5568628, 1,
-0.2111207, -1.218442, -4.102204, 0, 1, 0.5607843, 1,
-0.2078754, 1.422353, -0.2893319, 0, 1, 0.5686275, 1,
-0.2071312, 0.7459016, 1.841636, 0, 1, 0.572549, 1,
-0.2043973, -2.059662, -2.309122, 0, 1, 0.5803922, 1,
-0.200609, 0.8952168, -0.3038007, 0, 1, 0.5843138, 1,
-0.1992125, -0.159632, -2.841915, 0, 1, 0.5921569, 1,
-0.1988386, 0.4495279, -1.118425, 0, 1, 0.5960785, 1,
-0.1892348, -1.071514, -1.490134, 0, 1, 0.6039216, 1,
-0.1861935, -0.04291989, -3.203404, 0, 1, 0.6117647, 1,
-0.1852289, 1.377535, -0.2619734, 0, 1, 0.6156863, 1,
-0.1796027, -0.2014977, -1.918784, 0, 1, 0.6235294, 1,
-0.1765619, -0.7201368, -4.238353, 0, 1, 0.627451, 1,
-0.1763214, -1.362055, -2.169302, 0, 1, 0.6352941, 1,
-0.1693482, 0.9859861, -1.108934, 0, 1, 0.6392157, 1,
-0.1662475, -1.582847, -4.448885, 0, 1, 0.6470588, 1,
-0.1656414, -0.8266482, -2.461549, 0, 1, 0.6509804, 1,
-0.1530878, -1.729257, -1.373298, 0, 1, 0.6588235, 1,
-0.1512876, -0.5153197, -3.076894, 0, 1, 0.6627451, 1,
-0.148377, 0.2010018, 0.3433284, 0, 1, 0.6705883, 1,
-0.1455125, 1.970834, -0.02944371, 0, 1, 0.6745098, 1,
-0.1348778, -1.503006, -2.376658, 0, 1, 0.682353, 1,
-0.1344488, 0.3638879, 0.3795278, 0, 1, 0.6862745, 1,
-0.1322673, 0.2311382, -0.9683203, 0, 1, 0.6941177, 1,
-0.1289876, 0.4343935, -0.9978843, 0, 1, 0.7019608, 1,
-0.1253389, -0.2497928, -4.076738, 0, 1, 0.7058824, 1,
-0.1214059, -0.6238407, -2.785673, 0, 1, 0.7137255, 1,
-0.1179746, -0.5841512, -1.823456, 0, 1, 0.7176471, 1,
-0.1175364, -0.007444349, -0.430671, 0, 1, 0.7254902, 1,
-0.1171417, -1.452597, -1.117767, 0, 1, 0.7294118, 1,
-0.1126715, -0.1908208, -1.540511, 0, 1, 0.7372549, 1,
-0.1118481, -0.6195576, -3.48394, 0, 1, 0.7411765, 1,
-0.1044331, -1.138215, -1.459589, 0, 1, 0.7490196, 1,
-0.10424, -0.02125484, -1.529812, 0, 1, 0.7529412, 1,
-0.1017293, -0.332339, -3.291346, 0, 1, 0.7607843, 1,
-0.098114, 0.5664141, 0.1353825, 0, 1, 0.7647059, 1,
-0.09540341, -1.028842, -3.349536, 0, 1, 0.772549, 1,
-0.08979621, 1.945122, 0.9353048, 0, 1, 0.7764706, 1,
-0.0888054, 0.2335623, -0.2385742, 0, 1, 0.7843137, 1,
-0.08708952, 0.1112372, -1.20031, 0, 1, 0.7882353, 1,
-0.08380629, 0.804498, -2.44047, 0, 1, 0.7960784, 1,
-0.08340237, -0.233926, -3.638162, 0, 1, 0.8039216, 1,
-0.06954769, 0.6860143, 0.9898657, 0, 1, 0.8078431, 1,
-0.06632596, -2.200037, -3.851557, 0, 1, 0.8156863, 1,
-0.06534468, 1.213425, -1.034992, 0, 1, 0.8196079, 1,
-0.06216658, 0.675844, -1.50383, 0, 1, 0.827451, 1,
-0.06200619, -0.7756804, -3.773787, 0, 1, 0.8313726, 1,
-0.05743064, 0.2715551, 0.4444238, 0, 1, 0.8392157, 1,
-0.05563841, 0.01452745, -2.378877, 0, 1, 0.8431373, 1,
-0.0538669, -0.8701248, -2.006355, 0, 1, 0.8509804, 1,
-0.0480874, -0.8984874, -4.048255, 0, 1, 0.854902, 1,
-0.04668463, 0.4437909, -0.2651618, 0, 1, 0.8627451, 1,
-0.0461056, -1.507678, -3.749179, 0, 1, 0.8666667, 1,
-0.04424174, -0.1233813, -2.342922, 0, 1, 0.8745098, 1,
-0.03982816, 1.36198, 1.119227, 0, 1, 0.8784314, 1,
-0.03896911, 0.1592687, -2.341472, 0, 1, 0.8862745, 1,
-0.0387956, 1.401544, 1.565134, 0, 1, 0.8901961, 1,
-0.03454513, -0.6204898, -2.810054, 0, 1, 0.8980392, 1,
-0.03254275, -1.150611, -3.365102, 0, 1, 0.9058824, 1,
-0.02888334, -0.1353707, -4.338904, 0, 1, 0.9098039, 1,
-0.02860457, -0.1729829, -1.309489, 0, 1, 0.9176471, 1,
-0.02816223, 2.434484, 1.855278, 0, 1, 0.9215686, 1,
-0.0280718, -0.1839706, -2.49693, 0, 1, 0.9294118, 1,
-0.02765334, 1.338072, -0.5107852, 0, 1, 0.9333333, 1,
-0.02729029, -0.2247801, -2.406193, 0, 1, 0.9411765, 1,
-0.02545547, 0.7141823, -0.6361493, 0, 1, 0.945098, 1,
-0.02142376, -1.405335, -4.23184, 0, 1, 0.9529412, 1,
-0.01755302, 1.002364, -0.9427968, 0, 1, 0.9568627, 1,
-0.01545298, -0.0516882, -3.649734, 0, 1, 0.9647059, 1,
-0.01542791, -0.1956969, -2.580196, 0, 1, 0.9686275, 1,
-0.01481856, -1.082512, -2.143736, 0, 1, 0.9764706, 1,
-0.0125504, 0.6442392, -0.5291415, 0, 1, 0.9803922, 1,
-0.01137879, 0.4653534, 1.647079, 0, 1, 0.9882353, 1,
-0.01078375, -0.7636904, -2.415162, 0, 1, 0.9921569, 1,
-0.008224517, -1.220353, -2.410447, 0, 1, 1, 1,
-0.008095802, -1.025745, -2.147583, 0, 0.9921569, 1, 1,
-0.007771863, -0.3496816, -2.530744, 0, 0.9882353, 1, 1,
-0.002390659, -0.8393524, -4.195822, 0, 0.9803922, 1, 1,
0.0008023472, -0.2664654, 3.19743, 0, 0.9764706, 1, 1,
0.003132171, -0.03168042, 3.343103, 0, 0.9686275, 1, 1,
0.01158615, 0.49586, 0.5711086, 0, 0.9647059, 1, 1,
0.01586011, -1.322366, 4.08127, 0, 0.9568627, 1, 1,
0.01712648, 0.6529551, -0.6389993, 0, 0.9529412, 1, 1,
0.01856326, 0.3419401, -1.379462, 0, 0.945098, 1, 1,
0.02736445, -1.923261, 3.098111, 0, 0.9411765, 1, 1,
0.02851861, 0.283542, 1.056731, 0, 0.9333333, 1, 1,
0.03103027, 0.5523952, 0.3027637, 0, 0.9294118, 1, 1,
0.03361002, 1.131347, 1.829744, 0, 0.9215686, 1, 1,
0.04016815, 2.072119, 0.5946774, 0, 0.9176471, 1, 1,
0.04205018, -0.2735007, 3.691662, 0, 0.9098039, 1, 1,
0.04570351, 1.76626, -0.2649393, 0, 0.9058824, 1, 1,
0.05088254, -2.063585, 1.206768, 0, 0.8980392, 1, 1,
0.05704629, -0.553705, 1.760122, 0, 0.8901961, 1, 1,
0.06140625, -0.2118092, 4.177526, 0, 0.8862745, 1, 1,
0.06768639, -2.664015, 4.045916, 0, 0.8784314, 1, 1,
0.0689693, 0.4936677, 1.503669, 0, 0.8745098, 1, 1,
0.07115531, 0.3153171, 1.765913, 0, 0.8666667, 1, 1,
0.0726894, 0.9781456, 0.8469793, 0, 0.8627451, 1, 1,
0.07593369, -0.6515133, 3.080704, 0, 0.854902, 1, 1,
0.0762644, -1.437666, 3.387456, 0, 0.8509804, 1, 1,
0.07959928, -0.3079403, 3.217885, 0, 0.8431373, 1, 1,
0.08175906, 0.09697471, -0.5687673, 0, 0.8392157, 1, 1,
0.0847927, 1.721108, -0.2497344, 0, 0.8313726, 1, 1,
0.08545105, -0.7384942, 1.974626, 0, 0.827451, 1, 1,
0.08660595, 0.4964424, -0.5268395, 0, 0.8196079, 1, 1,
0.0872689, -0.8073325, 4.039381, 0, 0.8156863, 1, 1,
0.08733869, 0.8676407, 0.8232037, 0, 0.8078431, 1, 1,
0.08762791, -0.1131747, 3.829093, 0, 0.8039216, 1, 1,
0.09227605, 0.2637328, 0.3844188, 0, 0.7960784, 1, 1,
0.09355845, -2.154322, 2.970954, 0, 0.7882353, 1, 1,
0.09423404, -0.7614264, 3.952743, 0, 0.7843137, 1, 1,
0.09581313, -2.310592, 3.077014, 0, 0.7764706, 1, 1,
0.09716354, -0.6113241, 3.003935, 0, 0.772549, 1, 1,
0.1000067, -0.5607387, 2.777757, 0, 0.7647059, 1, 1,
0.1011857, -0.2742767, 4.3054, 0, 0.7607843, 1, 1,
0.1013671, -0.1116755, 2.363744, 0, 0.7529412, 1, 1,
0.1055621, 0.9906662, 2.074624e-05, 0, 0.7490196, 1, 1,
0.1076509, -0.7196077, 1.296184, 0, 0.7411765, 1, 1,
0.1090278, 1.571766, -0.04340671, 0, 0.7372549, 1, 1,
0.1111352, -1.597276, 3.842823, 0, 0.7294118, 1, 1,
0.1129278, 0.1004849, 0.9000112, 0, 0.7254902, 1, 1,
0.1142448, 1.089072, -0.06432074, 0, 0.7176471, 1, 1,
0.1175372, 0.4562242, 1.240985, 0, 0.7137255, 1, 1,
0.1177737, -0.8510847, 3.60839, 0, 0.7058824, 1, 1,
0.1207373, -0.3341121, 3.145465, 0, 0.6980392, 1, 1,
0.1246275, 0.9105769, -1.215741, 0, 0.6941177, 1, 1,
0.1282794, -0.6894128, 1.421551, 0, 0.6862745, 1, 1,
0.1299638, 0.07114545, 0.9018704, 0, 0.682353, 1, 1,
0.1309198, 0.364085, -0.02834333, 0, 0.6745098, 1, 1,
0.1316632, -0.8317949, 3.748862, 0, 0.6705883, 1, 1,
0.1344828, -0.1292351, 1.546852, 0, 0.6627451, 1, 1,
0.1373967, 1.033937, 1.521368, 0, 0.6588235, 1, 1,
0.1412137, 0.8639845, 1.780734, 0, 0.6509804, 1, 1,
0.1433898, -1.756183, 4.966748, 0, 0.6470588, 1, 1,
0.1449883, 1.268565, -1.444789, 0, 0.6392157, 1, 1,
0.1504882, 2.365572, 0.8355697, 0, 0.6352941, 1, 1,
0.1507969, 0.3865982, -1.124833, 0, 0.627451, 1, 1,
0.1513288, -1.869882, 2.918692, 0, 0.6235294, 1, 1,
0.1559959, 1.946695, -2.007202, 0, 0.6156863, 1, 1,
0.1584726, -0.7496608, 2.003437, 0, 0.6117647, 1, 1,
0.1605716, -0.1160403, 4.275772, 0, 0.6039216, 1, 1,
0.1624041, 0.1043663, 0.07716078, 0, 0.5960785, 1, 1,
0.1628083, -2.234391, 1.647598, 0, 0.5921569, 1, 1,
0.1634316, 0.255893, -1.063387, 0, 0.5843138, 1, 1,
0.1679248, 1.622669, -1.239213, 0, 0.5803922, 1, 1,
0.1696524, -0.4620006, 4.455331, 0, 0.572549, 1, 1,
0.1716155, -0.6096671, 3.922136, 0, 0.5686275, 1, 1,
0.1733669, -0.2983251, 2.805337, 0, 0.5607843, 1, 1,
0.1738251, 1.014718, -0.6422133, 0, 0.5568628, 1, 1,
0.1755524, 0.3300594, -2.859983, 0, 0.5490196, 1, 1,
0.1769157, -0.3800227, 2.113091, 0, 0.5450981, 1, 1,
0.1834128, 1.337191, -1.449865, 0, 0.5372549, 1, 1,
0.1836723, 0.134494, 1.216649, 0, 0.5333334, 1, 1,
0.1857615, 0.09355505, 1.028408, 0, 0.5254902, 1, 1,
0.1858377, -0.2246753, 1.979685, 0, 0.5215687, 1, 1,
0.1876753, 0.3379379, -0.3165174, 0, 0.5137255, 1, 1,
0.1894968, 1.168083, -0.5718918, 0, 0.509804, 1, 1,
0.1911733, -0.02067566, 3.58078, 0, 0.5019608, 1, 1,
0.1921172, 0.7116888, -1.665546, 0, 0.4941176, 1, 1,
0.1941432, -1.945897, 5.19651, 0, 0.4901961, 1, 1,
0.2046555, -1.718281, 2.986734, 0, 0.4823529, 1, 1,
0.2061593, 0.2891566, 1.610613, 0, 0.4784314, 1, 1,
0.2078741, -0.8140944, 2.977732, 0, 0.4705882, 1, 1,
0.2088657, 1.351788, 0.2982237, 0, 0.4666667, 1, 1,
0.2109517, -0.1352641, 2.457149, 0, 0.4588235, 1, 1,
0.212201, 0.02635656, 1.537075, 0, 0.454902, 1, 1,
0.2148813, -0.01003674, 0.05330906, 0, 0.4470588, 1, 1,
0.2165923, -0.9681049, 3.758623, 0, 0.4431373, 1, 1,
0.2227713, 1.083266, 0.5449272, 0, 0.4352941, 1, 1,
0.2240108, 1.42308, 1.053944, 0, 0.4313726, 1, 1,
0.2259588, 0.1312628, 0.3004049, 0, 0.4235294, 1, 1,
0.2260066, 0.7256839, -1.265092, 0, 0.4196078, 1, 1,
0.2278104, -0.1204099, 3.288359, 0, 0.4117647, 1, 1,
0.2286833, -0.7973076, 2.389628, 0, 0.4078431, 1, 1,
0.2295025, 0.08674963, 2.154598, 0, 0.4, 1, 1,
0.2311373, -1.507464, 1.641473, 0, 0.3921569, 1, 1,
0.2356353, 0.06475235, 1.346811, 0, 0.3882353, 1, 1,
0.2378957, -0.284108, 3.500072, 0, 0.3803922, 1, 1,
0.2388705, 0.6008385, 0.2246527, 0, 0.3764706, 1, 1,
0.2397913, 0.3943139, 0.7892966, 0, 0.3686275, 1, 1,
0.2407765, 0.5440857, 0.8874893, 0, 0.3647059, 1, 1,
0.2484739, -1.876796, 3.213002, 0, 0.3568628, 1, 1,
0.2521917, -0.5038433, 2.625961, 0, 0.3529412, 1, 1,
0.253501, 0.1533907, 2.189936, 0, 0.345098, 1, 1,
0.2553714, -1.684151, 1.829429, 0, 0.3411765, 1, 1,
0.2638963, -0.01166946, 2.000557, 0, 0.3333333, 1, 1,
0.2666319, 0.9658044, 1.095282, 0, 0.3294118, 1, 1,
0.2728063, -1.46653, 2.00893, 0, 0.3215686, 1, 1,
0.2740782, 0.5804104, 1.68327, 0, 0.3176471, 1, 1,
0.2802243, 0.4591127, -0.06247623, 0, 0.3098039, 1, 1,
0.2804385, -0.893154, 3.018772, 0, 0.3058824, 1, 1,
0.2863048, 0.4313486, 1.323357, 0, 0.2980392, 1, 1,
0.2882072, -1.298104, 1.534838, 0, 0.2901961, 1, 1,
0.2936432, -1.154978, 3.211433, 0, 0.2862745, 1, 1,
0.2972816, 0.9482705, -0.3808917, 0, 0.2784314, 1, 1,
0.2991602, -1.557287, 4.144978, 0, 0.2745098, 1, 1,
0.3021981, -0.0351425, 2.022348, 0, 0.2666667, 1, 1,
0.3078715, 0.6728271, 1.003609, 0, 0.2627451, 1, 1,
0.3084133, -2.452652, 2.518709, 0, 0.254902, 1, 1,
0.3185224, 0.9437492, -0.8813445, 0, 0.2509804, 1, 1,
0.3191657, 1.217319, 1.016483, 0, 0.2431373, 1, 1,
0.3196067, 1.046077, 1.161912, 0, 0.2392157, 1, 1,
0.3237852, 0.1964708, 0.7896053, 0, 0.2313726, 1, 1,
0.3244075, 0.1537564, 1.281176, 0, 0.227451, 1, 1,
0.3291469, 0.8296626, -0.1825456, 0, 0.2196078, 1, 1,
0.3291499, 0.7790608, -1.692855, 0, 0.2156863, 1, 1,
0.3304306, 1.52493, 0.8213003, 0, 0.2078431, 1, 1,
0.3306929, 1.082493, 0.3096305, 0, 0.2039216, 1, 1,
0.3339043, -0.2487267, 1.436795, 0, 0.1960784, 1, 1,
0.3354749, -0.2874055, 1.581126, 0, 0.1882353, 1, 1,
0.3373075, 0.351801, -0.09987949, 0, 0.1843137, 1, 1,
0.3392936, 0.8814187, 1.954318, 0, 0.1764706, 1, 1,
0.339516, 1.682283, 1.29833, 0, 0.172549, 1, 1,
0.3406008, -0.6649863, 2.284595, 0, 0.1647059, 1, 1,
0.3438397, -1.99041, 4.325218, 0, 0.1607843, 1, 1,
0.3459982, -0.8917738, 1.691906, 0, 0.1529412, 1, 1,
0.3539668, 0.8368587, -1.555216, 0, 0.1490196, 1, 1,
0.3541909, 0.8077761, 0.3021473, 0, 0.1411765, 1, 1,
0.3565863, -1.099507, 3.745675, 0, 0.1372549, 1, 1,
0.3599845, -0.02644589, 1.419073, 0, 0.1294118, 1, 1,
0.3619694, -1.462365, 3.950824, 0, 0.1254902, 1, 1,
0.3668733, 0.8792809, 0.767069, 0, 0.1176471, 1, 1,
0.3709391, -1.6474, 4.042608, 0, 0.1137255, 1, 1,
0.3735902, -0.7084376, 1.888424, 0, 0.1058824, 1, 1,
0.3736038, 0.3390749, 2.101501, 0, 0.09803922, 1, 1,
0.3742582, 0.8914446, -1.223726, 0, 0.09411765, 1, 1,
0.3796146, 0.3326887, 0.4555043, 0, 0.08627451, 1, 1,
0.3833845, 0.03254258, 0.09029525, 0, 0.08235294, 1, 1,
0.3842671, 0.2032134, 0.9231334, 0, 0.07450981, 1, 1,
0.3889096, 0.08625356, 0.783599, 0, 0.07058824, 1, 1,
0.3916428, 0.7332443, -1.275494, 0, 0.0627451, 1, 1,
0.3917947, 0.3226924, 0.2554507, 0, 0.05882353, 1, 1,
0.392188, 0.3756895, 1.447594, 0, 0.05098039, 1, 1,
0.392996, -0.06276895, 0.6345109, 0, 0.04705882, 1, 1,
0.3952907, 0.5641923, 1.786303, 0, 0.03921569, 1, 1,
0.3984115, 0.53003, 0.02657448, 0, 0.03529412, 1, 1,
0.3995875, -1.388475, 3.025506, 0, 0.02745098, 1, 1,
0.4037275, 0.1321127, 1.36186, 0, 0.02352941, 1, 1,
0.4048744, 0.2080194, 2.856266, 0, 0.01568628, 1, 1,
0.4089491, 0.2177398, -1.829553, 0, 0.01176471, 1, 1,
0.4091047, -0.9414191, 3.684343, 0, 0.003921569, 1, 1,
0.4133813, -0.2646327, 2.027261, 0.003921569, 0, 1, 1,
0.414147, 0.6795598, 1.317924, 0.007843138, 0, 1, 1,
0.4162709, -0.3631577, 3.819779, 0.01568628, 0, 1, 1,
0.4168082, -0.2668813, 2.410141, 0.01960784, 0, 1, 1,
0.4239336, 0.5637071, 0.888642, 0.02745098, 0, 1, 1,
0.4239985, 0.9906599, 0.4445616, 0.03137255, 0, 1, 1,
0.4295468, -0.3326403, 2.20602, 0.03921569, 0, 1, 1,
0.4316601, 0.1262365, 1.75422, 0.04313726, 0, 1, 1,
0.433397, 0.8054067, -0.9747027, 0.05098039, 0, 1, 1,
0.4377645, -1.414903, 4.285593, 0.05490196, 0, 1, 1,
0.4438414, 1.179097, 0.7554623, 0.0627451, 0, 1, 1,
0.4474857, 2.109191, 0.2460653, 0.06666667, 0, 1, 1,
0.4510042, -0.8018314, 2.355676, 0.07450981, 0, 1, 1,
0.4512285, 0.5203394, 2.095036, 0.07843138, 0, 1, 1,
0.4531667, 0.07721292, 0.6071312, 0.08627451, 0, 1, 1,
0.4543517, 1.999654, 0.4636132, 0.09019608, 0, 1, 1,
0.4669572, -0.593539, 2.696133, 0.09803922, 0, 1, 1,
0.4678422, -0.09303214, 1.910921, 0.1058824, 0, 1, 1,
0.4680681, 0.3687522, 0.2380913, 0.1098039, 0, 1, 1,
0.4700377, -0.6306867, 2.03091, 0.1176471, 0, 1, 1,
0.4701999, -0.9286579, 2.494493, 0.1215686, 0, 1, 1,
0.4732554, -0.8540462, 2.153508, 0.1294118, 0, 1, 1,
0.4755613, 0.07436556, 0.9026259, 0.1333333, 0, 1, 1,
0.4768507, -0.2943586, 1.918327, 0.1411765, 0, 1, 1,
0.4771131, 0.3684526, 0.108603, 0.145098, 0, 1, 1,
0.4772096, -0.2002607, 0.2418461, 0.1529412, 0, 1, 1,
0.4789433, 0.6383866, 1.591073, 0.1568628, 0, 1, 1,
0.4792907, -0.8546792, 1.845563, 0.1647059, 0, 1, 1,
0.4799791, -0.4367745, 0.7382293, 0.1686275, 0, 1, 1,
0.480005, 0.6724582, -0.01125715, 0.1764706, 0, 1, 1,
0.4815204, 0.7224123, 2.141856, 0.1803922, 0, 1, 1,
0.4966692, -0.09242949, 1.287004, 0.1882353, 0, 1, 1,
0.4967389, -0.3328601, 2.893808, 0.1921569, 0, 1, 1,
0.5053323, 0.5621442, 0.8433217, 0.2, 0, 1, 1,
0.5061435, 0.7888536, 1.928367, 0.2078431, 0, 1, 1,
0.5177802, -0.1635893, 3.065658, 0.2117647, 0, 1, 1,
0.5253089, -0.3375715, 1.800901, 0.2196078, 0, 1, 1,
0.5256746, -0.05435237, 1.346357, 0.2235294, 0, 1, 1,
0.5272038, 0.2837708, 0.7393038, 0.2313726, 0, 1, 1,
0.5308672, 2.709705, -0.3651953, 0.2352941, 0, 1, 1,
0.5318444, -0.5529494, 2.175664, 0.2431373, 0, 1, 1,
0.5349323, 1.29163, 1.174981, 0.2470588, 0, 1, 1,
0.5389749, -0.8364033, 1.994893, 0.254902, 0, 1, 1,
0.5422129, 0.3075779, 1.209252, 0.2588235, 0, 1, 1,
0.5439525, -0.4780381, 0.3692271, 0.2666667, 0, 1, 1,
0.5472914, 0.3611997, 2.246236, 0.2705882, 0, 1, 1,
0.5533306, 1.071846, 0.6797416, 0.2784314, 0, 1, 1,
0.5571896, 2.212431, 1.536758, 0.282353, 0, 1, 1,
0.5577922, -0.4645807, 1.579852, 0.2901961, 0, 1, 1,
0.564631, -0.399491, 1.763662, 0.2941177, 0, 1, 1,
0.5744714, -0.08565739, 2.546971, 0.3019608, 0, 1, 1,
0.578585, -0.4905981, 2.528537, 0.3098039, 0, 1, 1,
0.5856026, 0.1592086, 0.6979046, 0.3137255, 0, 1, 1,
0.5863562, 0.3005941, 1.284714, 0.3215686, 0, 1, 1,
0.5894665, 1.197515, 1.444856, 0.3254902, 0, 1, 1,
0.5927022, 0.4824012, 1.002913, 0.3333333, 0, 1, 1,
0.5929559, 0.6142197, 0.8615404, 0.3372549, 0, 1, 1,
0.5984045, -0.5771682, 3.303486, 0.345098, 0, 1, 1,
0.5998873, 0.507797, 2.983766, 0.3490196, 0, 1, 1,
0.6063301, 0.9435163, 1.643352, 0.3568628, 0, 1, 1,
0.6111821, -1.105473, 2.087104, 0.3607843, 0, 1, 1,
0.6161128, -0.08030638, 2.009743, 0.3686275, 0, 1, 1,
0.6165006, 0.4240705, 0.9164524, 0.372549, 0, 1, 1,
0.617735, 0.06857827, 1.183855, 0.3803922, 0, 1, 1,
0.621576, 0.09885394, 2.115321, 0.3843137, 0, 1, 1,
0.6232489, -0.87001, 2.784866, 0.3921569, 0, 1, 1,
0.6250687, -0.6555502, 3.185822, 0.3960784, 0, 1, 1,
0.6301993, 0.1547977, 2.683503, 0.4039216, 0, 1, 1,
0.6320118, -0.4527388, 3.083237, 0.4117647, 0, 1, 1,
0.6415251, 0.4528208, 0.3451362, 0.4156863, 0, 1, 1,
0.6444161, 0.6287107, 0.9715842, 0.4235294, 0, 1, 1,
0.6487796, 0.07963599, 1.866735, 0.427451, 0, 1, 1,
0.6534573, 0.9938694, 1.514815, 0.4352941, 0, 1, 1,
0.6542594, -0.3839473, 1.265575, 0.4392157, 0, 1, 1,
0.6562833, 0.3065971, 0.5091246, 0.4470588, 0, 1, 1,
0.662738, 0.7957395, -0.2959729, 0.4509804, 0, 1, 1,
0.6735607, -1.092999, 1.522344, 0.4588235, 0, 1, 1,
0.675135, -0.52959, 1.326122, 0.4627451, 0, 1, 1,
0.6768215, 0.8126009, 0.3163716, 0.4705882, 0, 1, 1,
0.6791547, -1.305595, 3.518543, 0.4745098, 0, 1, 1,
0.6849335, -1.258821, 1.834712, 0.4823529, 0, 1, 1,
0.6882535, -2.134312, 2.297839, 0.4862745, 0, 1, 1,
0.6886036, -1.363398, 1.051841, 0.4941176, 0, 1, 1,
0.6918331, -0.09209573, 0.4095885, 0.5019608, 0, 1, 1,
0.6947842, 0.9209379, 1.243948, 0.5058824, 0, 1, 1,
0.698634, -0.1287275, 2.059401, 0.5137255, 0, 1, 1,
0.7014505, -0.9505573, 0.5589501, 0.5176471, 0, 1, 1,
0.7022533, -1.640706, 3.143615, 0.5254902, 0, 1, 1,
0.7030721, 0.05063239, 2.508545, 0.5294118, 0, 1, 1,
0.7053055, -0.3399612, 2.661469, 0.5372549, 0, 1, 1,
0.7137571, -0.722716, 2.101858, 0.5411765, 0, 1, 1,
0.7142325, -0.5445173, 3.187696, 0.5490196, 0, 1, 1,
0.7186443, -1.38885, 1.435284, 0.5529412, 0, 1, 1,
0.7230053, 0.1893617, 1.77858, 0.5607843, 0, 1, 1,
0.724205, -0.4892889, 2.791739, 0.5647059, 0, 1, 1,
0.7270478, -0.01748651, 1.245488, 0.572549, 0, 1, 1,
0.7276185, -0.1179869, 3.360763, 0.5764706, 0, 1, 1,
0.7309102, -0.1303753, 1.125974, 0.5843138, 0, 1, 1,
0.7334936, 0.3112668, 0.5743313, 0.5882353, 0, 1, 1,
0.7400408, 1.313668, -0.5207962, 0.5960785, 0, 1, 1,
0.7401684, -1.604441, 2.067113, 0.6039216, 0, 1, 1,
0.7489747, 1.698972, -2.029346, 0.6078432, 0, 1, 1,
0.7652667, 0.4432333, 1.828552, 0.6156863, 0, 1, 1,
0.7703103, 0.8858466, -0.5019237, 0.6196079, 0, 1, 1,
0.7735432, -0.5831583, 2.736474, 0.627451, 0, 1, 1,
0.7743349, 0.3114998, 1.873633, 0.6313726, 0, 1, 1,
0.783419, -1.905313, 2.803723, 0.6392157, 0, 1, 1,
0.7871605, 1.548897, -0.9337208, 0.6431373, 0, 1, 1,
0.7926524, 0.7678989, 1.578116, 0.6509804, 0, 1, 1,
0.8005554, -0.1009829, 1.795384, 0.654902, 0, 1, 1,
0.8038066, -2.850271, 3.101366, 0.6627451, 0, 1, 1,
0.808281, 0.7648495, -0.1962765, 0.6666667, 0, 1, 1,
0.8273938, 0.008277977, 1.235489, 0.6745098, 0, 1, 1,
0.828696, 1.16948, -0.0009900971, 0.6784314, 0, 1, 1,
0.8305058, -0.8419912, 3.803298, 0.6862745, 0, 1, 1,
0.8328973, -0.01799944, 2.304919, 0.6901961, 0, 1, 1,
0.8350123, -0.7269297, 2.643748, 0.6980392, 0, 1, 1,
0.8362092, -0.8525779, 2.444383, 0.7058824, 0, 1, 1,
0.8365067, 0.3369655, 1.630865, 0.7098039, 0, 1, 1,
0.8466685, -0.2711107, 1.151321, 0.7176471, 0, 1, 1,
0.8488593, 0.742474, 1.401737, 0.7215686, 0, 1, 1,
0.850415, -0.4102052, 1.986564, 0.7294118, 0, 1, 1,
0.8518342, 0.2149009, 2.004443, 0.7333333, 0, 1, 1,
0.8534699, 1.093536, 0.1247149, 0.7411765, 0, 1, 1,
0.8557366, -0.2134207, 1.69132, 0.7450981, 0, 1, 1,
0.8584496, -0.3319793, 3.013113, 0.7529412, 0, 1, 1,
0.8675411, -0.7929668, 1.152058, 0.7568628, 0, 1, 1,
0.868153, 0.3541092, -0.08618846, 0.7647059, 0, 1, 1,
0.8699655, -1.519326, 2.37511, 0.7686275, 0, 1, 1,
0.8805906, -0.7602729, 3.796911, 0.7764706, 0, 1, 1,
0.8809435, 1.559799, 0.4101639, 0.7803922, 0, 1, 1,
0.8852019, -2.078979, 1.68943, 0.7882353, 0, 1, 1,
0.8948765, -0.3994218, 1.386111, 0.7921569, 0, 1, 1,
0.9001096, 0.6104193, 1.239341, 0.8, 0, 1, 1,
0.9091643, 1.065383, 1.44522, 0.8078431, 0, 1, 1,
0.909225, -0.2615327, 0.03480328, 0.8117647, 0, 1, 1,
0.9124967, -1.961367, 4.161983, 0.8196079, 0, 1, 1,
0.9166479, -0.1556152, 2.056909, 0.8235294, 0, 1, 1,
0.9189354, 0.1673568, 1.55872, 0.8313726, 0, 1, 1,
0.9203659, 0.8488615, 2.82548, 0.8352941, 0, 1, 1,
0.9212365, 0.8503234, 1.82434, 0.8431373, 0, 1, 1,
0.9236954, 0.3578886, 0.04003966, 0.8470588, 0, 1, 1,
0.9246764, 1.686599, 1.195229, 0.854902, 0, 1, 1,
0.9249859, 0.7446128, -0.1415335, 0.8588235, 0, 1, 1,
0.9251471, 0.4096241, 0.5637262, 0.8666667, 0, 1, 1,
0.9306289, 0.1255264, 1.516711, 0.8705882, 0, 1, 1,
0.933523, -0.2761933, 1.538587, 0.8784314, 0, 1, 1,
0.9354082, -0.4674731, 1.414647, 0.8823529, 0, 1, 1,
0.9387608, -1.945522, 2.842756, 0.8901961, 0, 1, 1,
0.9440272, 0.0280616, 0.2235628, 0.8941177, 0, 1, 1,
0.9515828, 0.5971714, 1.082087, 0.9019608, 0, 1, 1,
0.9563211, -2.213767, 1.727797, 0.9098039, 0, 1, 1,
0.965918, -1.447878, 1.875348, 0.9137255, 0, 1, 1,
0.9690158, 0.4927922, 1.261047, 0.9215686, 0, 1, 1,
0.9719209, 0.2414417, 2.403378, 0.9254902, 0, 1, 1,
0.9761253, -0.6455719, 2.299936, 0.9333333, 0, 1, 1,
0.976506, -0.5969349, 2.878517, 0.9372549, 0, 1, 1,
0.9813853, -0.4255574, 3.375221, 0.945098, 0, 1, 1,
0.9880233, -0.07038233, 0.5205101, 0.9490196, 0, 1, 1,
1.001561, -0.4463831, 4.190971, 0.9568627, 0, 1, 1,
1.004719, -0.6123705, 3.274546, 0.9607843, 0, 1, 1,
1.00489, -0.8376456, 1.940285, 0.9686275, 0, 1, 1,
1.010066, 2.75539, 0.9325618, 0.972549, 0, 1, 1,
1.02012, -0.3688572, -0.315652, 0.9803922, 0, 1, 1,
1.020428, 1.10833, 2.184415, 0.9843137, 0, 1, 1,
1.02087, 1.29381, 1.39207, 0.9921569, 0, 1, 1,
1.025864, 0.6438847, 2.862542, 0.9960784, 0, 1, 1,
1.027351, 1.380379, 1.443284, 1, 0, 0.9960784, 1,
1.035282, -0.616092, 3.969122, 1, 0, 0.9882353, 1,
1.036672, 1.11108, 1.94624, 1, 0, 0.9843137, 1,
1.038562, -0.723304, -0.02345191, 1, 0, 0.9764706, 1,
1.040792, 1.530969, 2.578294, 1, 0, 0.972549, 1,
1.052869, -0.4634107, 2.594965, 1, 0, 0.9647059, 1,
1.053277, -0.04226658, 2.306511, 1, 0, 0.9607843, 1,
1.05334, 0.3190495, 0.1926063, 1, 0, 0.9529412, 1,
1.054091, 1.564379, -0.3213755, 1, 0, 0.9490196, 1,
1.056843, 0.7310445, 2.731951, 1, 0, 0.9411765, 1,
1.061577, -1.07687, 3.860758, 1, 0, 0.9372549, 1,
1.068266, -1.01608, 4.318677, 1, 0, 0.9294118, 1,
1.069003, 0.1567971, 1.34727, 1, 0, 0.9254902, 1,
1.07015, 0.3823794, 0.3459408, 1, 0, 0.9176471, 1,
1.070613, 0.324551, 2.722185, 1, 0, 0.9137255, 1,
1.073462, -0.7388566, 2.86667, 1, 0, 0.9058824, 1,
1.074896, -0.1633396, 0.94291, 1, 0, 0.9019608, 1,
1.091041, 0.5563849, 0.9750924, 1, 0, 0.8941177, 1,
1.094287, -1.00699, 3.507729, 1, 0, 0.8862745, 1,
1.097636, -0.9703677, 2.832311, 1, 0, 0.8823529, 1,
1.098778, -0.1860694, 0.9395149, 1, 0, 0.8745098, 1,
1.104188, -0.9433027, 3.026999, 1, 0, 0.8705882, 1,
1.107177, 1.862061, 1.492086, 1, 0, 0.8627451, 1,
1.107459, 0.6015344, 2.117468, 1, 0, 0.8588235, 1,
1.107853, 1.175561, 2.740617, 1, 0, 0.8509804, 1,
1.110353, -2.337273, 3.413652, 1, 0, 0.8470588, 1,
1.114191, -0.6627921, 1.948184, 1, 0, 0.8392157, 1,
1.12465, 0.543293, 1.024147, 1, 0, 0.8352941, 1,
1.125665, 2.890004, 1.508012, 1, 0, 0.827451, 1,
1.128742, 0.2807614, 2.130759, 1, 0, 0.8235294, 1,
1.129261, -0.9109817, 1.237266, 1, 0, 0.8156863, 1,
1.130637, -2.839296, 3.078372, 1, 0, 0.8117647, 1,
1.138058, -0.1283723, 1.825345, 1, 0, 0.8039216, 1,
1.138966, -0.2353057, 0.9162189, 1, 0, 0.7960784, 1,
1.139132, 3.397655, 0.4349028, 1, 0, 0.7921569, 1,
1.14848, -0.0333707, 2.623291, 1, 0, 0.7843137, 1,
1.166987, -1.233068, 2.009034, 1, 0, 0.7803922, 1,
1.168363, -0.2821568, 1.577938, 1, 0, 0.772549, 1,
1.172721, 0.009977424, 0.7710936, 1, 0, 0.7686275, 1,
1.175288, 0.9928318, 0.9291607, 1, 0, 0.7607843, 1,
1.178868, 0.06825487, 3.638755, 1, 0, 0.7568628, 1,
1.179763, -0.4458456, 2.046409, 1, 0, 0.7490196, 1,
1.185942, -1.432167, 0.995995, 1, 0, 0.7450981, 1,
1.188814, -0.06094049, 1.994739, 1, 0, 0.7372549, 1,
1.191364, -0.8776101, 4.38512, 1, 0, 0.7333333, 1,
1.193169, 0.9876008, 0.6724965, 1, 0, 0.7254902, 1,
1.198398, 0.8798791, 2.435648, 1, 0, 0.7215686, 1,
1.221476, 2.175783, -0.6754994, 1, 0, 0.7137255, 1,
1.222234, 0.1354642, -0.6123179, 1, 0, 0.7098039, 1,
1.222544, -0.5993581, 2.809485, 1, 0, 0.7019608, 1,
1.224191, 0.1697909, 2.468292, 1, 0, 0.6941177, 1,
1.226786, 0.5155768, 1.245385, 1, 0, 0.6901961, 1,
1.228423, -0.6756128, 1.949017, 1, 0, 0.682353, 1,
1.248377, -1.042863, 0.889582, 1, 0, 0.6784314, 1,
1.250041, -1.124819, 3.715247, 1, 0, 0.6705883, 1,
1.25146, 0.3008693, 0.175032, 1, 0, 0.6666667, 1,
1.25261, 1.057609, 1.397214, 1, 0, 0.6588235, 1,
1.259701, -0.2386603, 3.139215, 1, 0, 0.654902, 1,
1.269456, 0.6600762, 2.028865, 1, 0, 0.6470588, 1,
1.270834, 0.3697625, 2.251154, 1, 0, 0.6431373, 1,
1.275466, -1.302039, 2.720114, 1, 0, 0.6352941, 1,
1.277595, -0.4758411, 1.027556, 1, 0, 0.6313726, 1,
1.281412, 0.4514162, 2.756825, 1, 0, 0.6235294, 1,
1.284446, 0.8282998, 1.479003, 1, 0, 0.6196079, 1,
1.308994, -1.634499, 3.164806, 1, 0, 0.6117647, 1,
1.317118, -1.191546, 2.017597, 1, 0, 0.6078432, 1,
1.321872, -1.265787, 3.804969, 1, 0, 0.6, 1,
1.32757, -0.5099429, 2.032574, 1, 0, 0.5921569, 1,
1.331461, 1.47093, -0.2904368, 1, 0, 0.5882353, 1,
1.332129, 0.2879803, 1.556244, 1, 0, 0.5803922, 1,
1.346158, 0.3807689, 0.3760246, 1, 0, 0.5764706, 1,
1.347353, -0.06908609, 0.5460712, 1, 0, 0.5686275, 1,
1.350111, 1.585358, 0.6947383, 1, 0, 0.5647059, 1,
1.351228, -0.3429825, -0.01838312, 1, 0, 0.5568628, 1,
1.354417, -0.6865177, 1.439911, 1, 0, 0.5529412, 1,
1.361518, 0.02581315, -0.4495772, 1, 0, 0.5450981, 1,
1.366202, -0.5170289, 2.535439, 1, 0, 0.5411765, 1,
1.369021, -1.146123, 3.174761, 1, 0, 0.5333334, 1,
1.369046, 0.1002459, -0.02505378, 1, 0, 0.5294118, 1,
1.373927, 0.6080959, 3.038946, 1, 0, 0.5215687, 1,
1.381099, 1.639452, 1.442224, 1, 0, 0.5176471, 1,
1.38168, 0.6234059, 0.9725217, 1, 0, 0.509804, 1,
1.384712, -0.9570211, 2.138917, 1, 0, 0.5058824, 1,
1.392408, -0.9204458, 1.481891, 1, 0, 0.4980392, 1,
1.393315, -1.630973, 2.445672, 1, 0, 0.4901961, 1,
1.393989, 0.7927797, 1.180827, 1, 0, 0.4862745, 1,
1.407936, 0.7799433, 1.120462, 1, 0, 0.4784314, 1,
1.410863, -0.7973524, 2.62708, 1, 0, 0.4745098, 1,
1.412013, -2.31805, 3.693039, 1, 0, 0.4666667, 1,
1.416603, 0.7940299, 0.6901072, 1, 0, 0.4627451, 1,
1.418831, 1.25261, 0.05918216, 1, 0, 0.454902, 1,
1.423514, 0.8490274, 0.1970201, 1, 0, 0.4509804, 1,
1.430946, -0.7242051, 3.204148, 1, 0, 0.4431373, 1,
1.436942, 0.1275727, 3.164804, 1, 0, 0.4392157, 1,
1.438898, 1.646094, -0.6375789, 1, 0, 0.4313726, 1,
1.448279, 0.860065, 0.4254837, 1, 0, 0.427451, 1,
1.45017, -2.499264, 4.078825, 1, 0, 0.4196078, 1,
1.454934, -0.1330882, 1.973494, 1, 0, 0.4156863, 1,
1.455098, 1.006075, 1.291151, 1, 0, 0.4078431, 1,
1.455813, 0.2429207, 2.942079, 1, 0, 0.4039216, 1,
1.459774, -0.2932585, 0.9318789, 1, 0, 0.3960784, 1,
1.464487, 0.5005246, 1.394274, 1, 0, 0.3882353, 1,
1.471597, -0.2663106, 1.274031, 1, 0, 0.3843137, 1,
1.474321, 1.58377, -1.448946, 1, 0, 0.3764706, 1,
1.481014, 0.06875432, 1.395547, 1, 0, 0.372549, 1,
1.486666, -0.154714, 2.441603, 1, 0, 0.3647059, 1,
1.490381, 0.2856601, 1.284141, 1, 0, 0.3607843, 1,
1.494309, 0.4954168, 0.9939814, 1, 0, 0.3529412, 1,
1.496827, -0.1482912, 3.630105, 1, 0, 0.3490196, 1,
1.500866, -0.4867725, 3.545602, 1, 0, 0.3411765, 1,
1.504672, -0.6785838, 3.059716, 1, 0, 0.3372549, 1,
1.505722, -0.1900625, 0.7108866, 1, 0, 0.3294118, 1,
1.519527, 0.3021698, 2.605909, 1, 0, 0.3254902, 1,
1.523541, -0.5787954, -0.126301, 1, 0, 0.3176471, 1,
1.532989, 1.430928, 0.02139578, 1, 0, 0.3137255, 1,
1.538415, -0.9485166, 2.191993, 1, 0, 0.3058824, 1,
1.538968, -2.115283, 2.619882, 1, 0, 0.2980392, 1,
1.545815, -1.911484, 2.200212, 1, 0, 0.2941177, 1,
1.546703, 0.3645436, 0.9510603, 1, 0, 0.2862745, 1,
1.552305, 0.8584937, -0.6032865, 1, 0, 0.282353, 1,
1.556229, -0.6621189, 1.241278, 1, 0, 0.2745098, 1,
1.560568, -0.06446878, 2.498244, 1, 0, 0.2705882, 1,
1.574487, 0.8857946, 0.04232449, 1, 0, 0.2627451, 1,
1.588021, 0.2813522, 0.9881734, 1, 0, 0.2588235, 1,
1.589211, 0.5011711, 0.5396906, 1, 0, 0.2509804, 1,
1.59403, 0.8572333, 0.568472, 1, 0, 0.2470588, 1,
1.601345, 1.792483, 1.138368, 1, 0, 0.2392157, 1,
1.604631, 0.2488364, 0.8513613, 1, 0, 0.2352941, 1,
1.610065, -1.073792, 1.376601, 1, 0, 0.227451, 1,
1.629333, 1.59765, 1.110305, 1, 0, 0.2235294, 1,
1.644204, -2.068469, 2.172084, 1, 0, 0.2156863, 1,
1.650894, -0.3805176, -1.448475, 1, 0, 0.2117647, 1,
1.660049, -0.4716049, 2.187946, 1, 0, 0.2039216, 1,
1.687225, -0.04114087, 1.648735, 1, 0, 0.1960784, 1,
1.721113, -0.4308734, 1.77469, 1, 0, 0.1921569, 1,
1.726131, -1.350744, 2.63314, 1, 0, 0.1843137, 1,
1.7454, -2.171163, 1.973978, 1, 0, 0.1803922, 1,
1.75603, 0.6755601, 1.413335, 1, 0, 0.172549, 1,
1.768853, 1.546457, 1.354431, 1, 0, 0.1686275, 1,
1.785858, 0.211681, 1.225452, 1, 0, 0.1607843, 1,
1.806941, 0.1940547, 1.772888, 1, 0, 0.1568628, 1,
1.842976, 0.7840733, 2.359956, 1, 0, 0.1490196, 1,
1.87802, 0.2188462, 2.748222, 1, 0, 0.145098, 1,
1.910027, 0.4116174, -0.6402661, 1, 0, 0.1372549, 1,
1.92839, -0.3211075, 1.859344, 1, 0, 0.1333333, 1,
1.969809, -0.2186304, 0.2746717, 1, 0, 0.1254902, 1,
1.983502, 1.956774, 2.528034, 1, 0, 0.1215686, 1,
1.997198, 2.109868, 1.343438, 1, 0, 0.1137255, 1,
2.034, -1.664262, 1.806911, 1, 0, 0.1098039, 1,
2.035137, -0.002729672, 0.7672088, 1, 0, 0.1019608, 1,
2.044431, -2.345238, 0.8048604, 1, 0, 0.09411765, 1,
2.108159, -0.1529116, 0.3576818, 1, 0, 0.09019608, 1,
2.127209, -0.0708915, 1.149611, 1, 0, 0.08235294, 1,
2.128184, -0.5531191, 1.813132, 1, 0, 0.07843138, 1,
2.13578, -0.1641221, 2.188838, 1, 0, 0.07058824, 1,
2.164161, -0.09372635, 2.766673, 1, 0, 0.06666667, 1,
2.181412, -1.540917, 2.542825, 1, 0, 0.05882353, 1,
2.3114, -1.16508, -0.06390312, 1, 0, 0.05490196, 1,
2.314606, 0.2301557, 1.568313, 1, 0, 0.04705882, 1,
2.32443, 0.3942167, 2.83067, 1, 0, 0.04313726, 1,
2.327426, 0.1257695, 0.6202653, 1, 0, 0.03529412, 1,
2.361638, -1.366604, 1.519033, 1, 0, 0.03137255, 1,
2.52275, -0.2085354, 0.9631148, 1, 0, 0.02352941, 1,
2.534138, 0.2574044, 3.273164, 1, 0, 0.01960784, 1,
2.651172, 2.199519, 2.197065, 1, 0, 0.01176471, 1,
2.876904, -0.688705, 1.738671, 1, 0, 0.007843138, 1
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
-0.4908812, -4.498072, -8.145215, 0, -0.5, 0.5, 0.5,
-0.4908812, -4.498072, -8.145215, 1, -0.5, 0.5, 0.5,
-0.4908812, -4.498072, -8.145215, 1, 1.5, 0.5, 0.5,
-0.4908812, -4.498072, -8.145215, 0, 1.5, 0.5, 0.5
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
-5.000345, 0.02197051, -8.145215, 0, -0.5, 0.5, 0.5,
-5.000345, 0.02197051, -8.145215, 1, -0.5, 0.5, 0.5,
-5.000345, 0.02197051, -8.145215, 1, 1.5, 0.5, 0.5,
-5.000345, 0.02197051, -8.145215, 0, 1.5, 0.5, 0.5
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
-5.000345, -4.498072, -0.5075192, 0, -0.5, 0.5, 0.5,
-5.000345, -4.498072, -0.5075192, 1, -0.5, 0.5, 0.5,
-5.000345, -4.498072, -0.5075192, 1, 1.5, 0.5, 0.5,
-5.000345, -4.498072, -0.5075192, 0, 1.5, 0.5, 0.5
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
-3, -3.454985, -6.38267,
2, -3.454985, -6.38267,
-3, -3.454985, -6.38267,
-3, -3.628833, -6.676427,
-2, -3.454985, -6.38267,
-2, -3.628833, -6.676427,
-1, -3.454985, -6.38267,
-1, -3.628833, -6.676427,
0, -3.454985, -6.38267,
0, -3.628833, -6.676427,
1, -3.454985, -6.38267,
1, -3.628833, -6.676427,
2, -3.454985, -6.38267,
2, -3.628833, -6.676427
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
-3, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
-3, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
-3, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
-3, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5,
-2, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
-2, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
-2, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
-2, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5,
-1, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
-1, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
-1, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
-1, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5,
0, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
0, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
0, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
0, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5,
1, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
1, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
1, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
1, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5,
2, -3.976528, -7.263942, 0, -0.5, 0.5, 0.5,
2, -3.976528, -7.263942, 1, -0.5, 0.5, 0.5,
2, -3.976528, -7.263942, 1, 1.5, 0.5, 0.5,
2, -3.976528, -7.263942, 0, 1.5, 0.5, 0.5
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
-3.9597, -3, -6.38267,
-3.9597, 3, -6.38267,
-3.9597, -3, -6.38267,
-4.133141, -3, -6.676427,
-3.9597, -2, -6.38267,
-4.133141, -2, -6.676427,
-3.9597, -1, -6.38267,
-4.133141, -1, -6.676427,
-3.9597, 0, -6.38267,
-4.133141, 0, -6.676427,
-3.9597, 1, -6.38267,
-4.133141, 1, -6.676427,
-3.9597, 2, -6.38267,
-4.133141, 2, -6.676427,
-3.9597, 3, -6.38267,
-4.133141, 3, -6.676427
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
-4.480022, -3, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, -3, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, -3, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, -3, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, -2, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, -2, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, -2, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, -2, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, -1, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, -1, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, -1, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, -1, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, 0, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, 0, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, 0, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, 0, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, 1, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, 1, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, 1, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, 1, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, 2, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, 2, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, 2, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, 2, -7.263942, 0, 1.5, 0.5, 0.5,
-4.480022, 3, -7.263942, 0, -0.5, 0.5, 0.5,
-4.480022, 3, -7.263942, 1, -0.5, 0.5, 0.5,
-4.480022, 3, -7.263942, 1, 1.5, 0.5, 0.5,
-4.480022, 3, -7.263942, 0, 1.5, 0.5, 0.5
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
-3.9597, -3.454985, -6,
-3.9597, -3.454985, 4,
-3.9597, -3.454985, -6,
-4.133141, -3.628833, -6,
-3.9597, -3.454985, -4,
-4.133141, -3.628833, -4,
-3.9597, -3.454985, -2,
-4.133141, -3.628833, -2,
-3.9597, -3.454985, 0,
-4.133141, -3.628833, 0,
-3.9597, -3.454985, 2,
-4.133141, -3.628833, 2,
-3.9597, -3.454985, 4,
-4.133141, -3.628833, 4
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
-4.480022, -3.976528, -6, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -6, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -6, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, -6, 0, 1.5, 0.5, 0.5,
-4.480022, -3.976528, -4, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -4, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -4, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, -4, 0, 1.5, 0.5, 0.5,
-4.480022, -3.976528, -2, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -2, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, -2, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, -2, 0, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 0, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 0, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 0, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 0, 0, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 2, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 2, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 2, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 2, 0, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 4, 0, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 4, 1, -0.5, 0.5, 0.5,
-4.480022, -3.976528, 4, 1, 1.5, 0.5, 0.5,
-4.480022, -3.976528, 4, 0, 1.5, 0.5, 0.5
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
-3.9597, -3.454985, -6.38267,
-3.9597, 3.498926, -6.38267,
-3.9597, -3.454985, 5.367631,
-3.9597, 3.498926, 5.367631,
-3.9597, -3.454985, -6.38267,
-3.9597, -3.454985, 5.367631,
-3.9597, 3.498926, -6.38267,
-3.9597, 3.498926, 5.367631,
-3.9597, -3.454985, -6.38267,
2.977937, -3.454985, -6.38267,
-3.9597, -3.454985, 5.367631,
2.977937, -3.454985, 5.367631,
-3.9597, 3.498926, -6.38267,
2.977937, 3.498926, -6.38267,
-3.9597, 3.498926, 5.367631,
2.977937, 3.498926, 5.367631,
2.977937, -3.454985, -6.38267,
2.977937, 3.498926, -6.38267,
2.977937, -3.454985, 5.367631,
2.977937, 3.498926, 5.367631,
2.977937, -3.454985, -6.38267,
2.977937, -3.454985, 5.367631,
2.977937, 3.498926, -6.38267,
2.977937, 3.498926, 5.367631
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
var radius = 8.178053;
var distance = 36.38508;
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
mvMatrix.translate( 0.4908812, -0.02197051, 0.5075192 );
mvMatrix.scale( 1.274536, 1.271554, 0.7525144 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.38508);
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


