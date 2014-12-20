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
-2.825693, -0.4346335, -1.537915, 1, 0, 0, 1,
-2.813251, -0.8209078, -1.903878, 1, 0.007843138, 0, 1,
-2.799685, -0.7463328, -1.322914, 1, 0.01176471, 0, 1,
-2.411513, -0.005092301, -1.059383, 1, 0.01960784, 0, 1,
-2.33385, -0.1409915, -2.825932, 1, 0.02352941, 0, 1,
-2.289478, 0.2886077, -1.129936, 1, 0.03137255, 0, 1,
-2.266959, 0.7477025, -3.103396, 1, 0.03529412, 0, 1,
-2.19644, -0.8407679, -2.064829, 1, 0.04313726, 0, 1,
-2.186089, 0.3230753, -1.811157, 1, 0.04705882, 0, 1,
-2.183244, -0.3509198, -1.452731, 1, 0.05490196, 0, 1,
-2.155016, 0.2821935, -0.722712, 1, 0.05882353, 0, 1,
-2.146566, -0.8093702, -1.850088, 1, 0.06666667, 0, 1,
-2.13843, 0.1772079, -2.127503, 1, 0.07058824, 0, 1,
-2.124109, 0.3391581, -2.047094, 1, 0.07843138, 0, 1,
-2.107014, -1.169338, -2.569951, 1, 0.08235294, 0, 1,
-2.083826, 1.100166, 0.4492235, 1, 0.09019608, 0, 1,
-2.080183, 0.6956332, -0.3279257, 1, 0.09411765, 0, 1,
-2.038327, -0.3805148, -1.136501, 1, 0.1019608, 0, 1,
-2.022793, 0.5267341, -1.10474, 1, 0.1098039, 0, 1,
-1.998861, 1.182991, -1.442344, 1, 0.1137255, 0, 1,
-1.997638, -0.7416644, -0.9825093, 1, 0.1215686, 0, 1,
-1.99397, 0.4172426, -2.016156, 1, 0.1254902, 0, 1,
-1.985714, 0.5388288, -0.1747306, 1, 0.1333333, 0, 1,
-1.961728, 0.427622, -1.520102, 1, 0.1372549, 0, 1,
-1.94519, -1.386115, -1.594315, 1, 0.145098, 0, 1,
-1.915675, -1.577318, -2.35946, 1, 0.1490196, 0, 1,
-1.881154, 0.918511, 0.1182223, 1, 0.1568628, 0, 1,
-1.878168, 0.5081525, -0.243904, 1, 0.1607843, 0, 1,
-1.874258, -1.590433, -2.026433, 1, 0.1686275, 0, 1,
-1.861426, -0.5283254, -1.27946, 1, 0.172549, 0, 1,
-1.838597, 0.4403082, -0.4129739, 1, 0.1803922, 0, 1,
-1.821413, -0.7406101, -2.599528, 1, 0.1843137, 0, 1,
-1.812919, -0.7058503, -2.433825, 1, 0.1921569, 0, 1,
-1.810211, 0.1439172, -0.02036852, 1, 0.1960784, 0, 1,
-1.780081, -1.021903, -0.7029492, 1, 0.2039216, 0, 1,
-1.770918, 1.281075, -0.7021291, 1, 0.2117647, 0, 1,
-1.769667, 0.472298, -0.7624605, 1, 0.2156863, 0, 1,
-1.750559, -2.391301, -3.571035, 1, 0.2235294, 0, 1,
-1.750098, 0.4213081, -0.7031959, 1, 0.227451, 0, 1,
-1.749333, -0.06644411, -1.175307, 1, 0.2352941, 0, 1,
-1.746371, 0.2008551, -2.894677, 1, 0.2392157, 0, 1,
-1.740639, 1.65292, -2.620446, 1, 0.2470588, 0, 1,
-1.723356, 0.200989, -1.78386, 1, 0.2509804, 0, 1,
-1.692299, 0.0007792564, -2.80143, 1, 0.2588235, 0, 1,
-1.677671, 0.3032779, -2.572383, 1, 0.2627451, 0, 1,
-1.67299, -0.6230623, -1.550719, 1, 0.2705882, 0, 1,
-1.670376, 0.02615139, -2.197022, 1, 0.2745098, 0, 1,
-1.666815, 0.2286104, -0.889309, 1, 0.282353, 0, 1,
-1.666576, -0.3882501, -2.698766, 1, 0.2862745, 0, 1,
-1.664125, -0.6319003, -1.963133, 1, 0.2941177, 0, 1,
-1.652608, -0.09372763, -1.933883, 1, 0.3019608, 0, 1,
-1.630625, -0.1827182, -2.65777, 1, 0.3058824, 0, 1,
-1.608942, -0.006403646, -0.0155214, 1, 0.3137255, 0, 1,
-1.580009, 1.396275, -1.663471, 1, 0.3176471, 0, 1,
-1.57932, 2.058001, -1.007303, 1, 0.3254902, 0, 1,
-1.575147, 0.3732988, -1.654582, 1, 0.3294118, 0, 1,
-1.565418, -1.704583, -1.335162, 1, 0.3372549, 0, 1,
-1.558515, 0.7024434, -0.02942747, 1, 0.3411765, 0, 1,
-1.555512, 1.804506, -0.8316699, 1, 0.3490196, 0, 1,
-1.548926, 1.116023, 0.2275724, 1, 0.3529412, 0, 1,
-1.542739, 1.449956, 0.0336401, 1, 0.3607843, 0, 1,
-1.540416, -0.04870366, -0.387063, 1, 0.3647059, 0, 1,
-1.533985, 0.4578801, -0.6705945, 1, 0.372549, 0, 1,
-1.529387, -1.772226, -0.3291966, 1, 0.3764706, 0, 1,
-1.526736, 1.079885, -1.921235, 1, 0.3843137, 0, 1,
-1.525588, 1.578093, 0.6246911, 1, 0.3882353, 0, 1,
-1.524698, 0.4733464, -1.416566, 1, 0.3960784, 0, 1,
-1.521571, -0.08444934, -1.936647, 1, 0.4039216, 0, 1,
-1.520137, 0.5399371, -0.1086822, 1, 0.4078431, 0, 1,
-1.50923, 0.00102347, -1.838696, 1, 0.4156863, 0, 1,
-1.50892, 0.5273556, -1.676854, 1, 0.4196078, 0, 1,
-1.498453, 0.1285199, -1.706823, 1, 0.427451, 0, 1,
-1.496512, -0.615256, -1.223799, 1, 0.4313726, 0, 1,
-1.492309, 0.7193822, -0.08511525, 1, 0.4392157, 0, 1,
-1.490755, 1.167939, 1.380132, 1, 0.4431373, 0, 1,
-1.490569, 0.5629125, -2.647997, 1, 0.4509804, 0, 1,
-1.474442, -0.06670441, -1.104968, 1, 0.454902, 0, 1,
-1.413912, 0.821146, -0.9278819, 1, 0.4627451, 0, 1,
-1.412968, 0.2619985, -1.246284, 1, 0.4666667, 0, 1,
-1.40823, 1.046581, -1.717221, 1, 0.4745098, 0, 1,
-1.405909, -1.533923, -3.682315, 1, 0.4784314, 0, 1,
-1.404825, -1.340365, -3.059694, 1, 0.4862745, 0, 1,
-1.400493, -0.2306256, -0.7364333, 1, 0.4901961, 0, 1,
-1.384582, -1.28935, -1.639243, 1, 0.4980392, 0, 1,
-1.374625, 1.806264, -0.4955247, 1, 0.5058824, 0, 1,
-1.372588, 1.146962, 0.02151797, 1, 0.509804, 0, 1,
-1.359794, 1.742441, -1.956134, 1, 0.5176471, 0, 1,
-1.356808, 0.5063748, -1.6701, 1, 0.5215687, 0, 1,
-1.341363, 1.095001, 0.717159, 1, 0.5294118, 0, 1,
-1.338005, -0.5903968, -2.830759, 1, 0.5333334, 0, 1,
-1.336066, 0.9196869, -2.600525, 1, 0.5411765, 0, 1,
-1.335125, -1.333731, -3.148086, 1, 0.5450981, 0, 1,
-1.334251, 0.3219205, -1.810263, 1, 0.5529412, 0, 1,
-1.326513, 0.5214195, -2.55041, 1, 0.5568628, 0, 1,
-1.325041, 0.5381183, -1.415502, 1, 0.5647059, 0, 1,
-1.308789, 0.4183042, -1.95605, 1, 0.5686275, 0, 1,
-1.307797, -0.00135957, -0.8192376, 1, 0.5764706, 0, 1,
-1.30171, 0.1757452, -2.728674, 1, 0.5803922, 0, 1,
-1.301009, 2.556081, -1.004926, 1, 0.5882353, 0, 1,
-1.290637, 2.679043, -2.709401, 1, 0.5921569, 0, 1,
-1.288398, -0.9844949, -1.651563, 1, 0.6, 0, 1,
-1.288025, 1.568348, 0.1012692, 1, 0.6078432, 0, 1,
-1.273821, 0.4280864, -0.7703047, 1, 0.6117647, 0, 1,
-1.26454, -1.351071, -4.295631, 1, 0.6196079, 0, 1,
-1.253863, 1.872995, 0.1679963, 1, 0.6235294, 0, 1,
-1.243717, -0.339548, -2.519994, 1, 0.6313726, 0, 1,
-1.230919, -0.3743331, -2.264042, 1, 0.6352941, 0, 1,
-1.228188, 1.184754, -1.210283, 1, 0.6431373, 0, 1,
-1.227952, 0.8719374, -1.219169, 1, 0.6470588, 0, 1,
-1.22325, -0.4146448, -2.776318, 1, 0.654902, 0, 1,
-1.22324, 0.9121101, 0.2928916, 1, 0.6588235, 0, 1,
-1.219432, 1.036061, -0.5370007, 1, 0.6666667, 0, 1,
-1.218752, -0.9327709, -2.189053, 1, 0.6705883, 0, 1,
-1.205125, 0.5964698, -1.432866, 1, 0.6784314, 0, 1,
-1.201712, -0.5938111, -2.486243, 1, 0.682353, 0, 1,
-1.199714, 2.129974, -2.139288, 1, 0.6901961, 0, 1,
-1.198478, -1.112649, -2.150819, 1, 0.6941177, 0, 1,
-1.189391, -0.4464015, -2.373662, 1, 0.7019608, 0, 1,
-1.181195, -0.3070971, -0.969779, 1, 0.7098039, 0, 1,
-1.180401, 1.185252, -0.4681836, 1, 0.7137255, 0, 1,
-1.179603, 1.063011, -0.5114769, 1, 0.7215686, 0, 1,
-1.179357, 2.551691, 0.5400191, 1, 0.7254902, 0, 1,
-1.176839, -0.02718966, -3.153609, 1, 0.7333333, 0, 1,
-1.176157, -0.9654857, -2.456388, 1, 0.7372549, 0, 1,
-1.173495, 0.6660374, -1.281907, 1, 0.7450981, 0, 1,
-1.17321, -0.04415676, -0.9692799, 1, 0.7490196, 0, 1,
-1.169991, -0.1262481, -2.718721, 1, 0.7568628, 0, 1,
-1.167361, -2.056229, -3.072175, 1, 0.7607843, 0, 1,
-1.1652, 0.3278084, -0.1323735, 1, 0.7686275, 0, 1,
-1.155295, -0.4262393, -2.629433, 1, 0.772549, 0, 1,
-1.150628, -0.4753192, -4.291497, 1, 0.7803922, 0, 1,
-1.148809, 0.1984164, -1.095225, 1, 0.7843137, 0, 1,
-1.146253, 0.05290833, 0.01462003, 1, 0.7921569, 0, 1,
-1.137342, -0.4405885, -4.325183, 1, 0.7960784, 0, 1,
-1.132108, 0.5830219, -0.5409456, 1, 0.8039216, 0, 1,
-1.131608, 0.2377527, -0.8408273, 1, 0.8117647, 0, 1,
-1.13078, -1.730009, 0.4084728, 1, 0.8156863, 0, 1,
-1.129436, -1.705579, -3.658637, 1, 0.8235294, 0, 1,
-1.123726, -1.328679, -2.749649, 1, 0.827451, 0, 1,
-1.119066, -0.3664237, -0.9874722, 1, 0.8352941, 0, 1,
-1.112407, 1.295364, -0.53809, 1, 0.8392157, 0, 1,
-1.108473, 0.389649, 1.023265, 1, 0.8470588, 0, 1,
-1.100584, -0.0971657, -0.7148271, 1, 0.8509804, 0, 1,
-1.092328, -0.806494, -1.256815, 1, 0.8588235, 0, 1,
-1.086359, -0.6186491, -1.080444, 1, 0.8627451, 0, 1,
-1.085716, -0.3410056, -2.705767, 1, 0.8705882, 0, 1,
-1.084961, -0.7001395, -1.4598, 1, 0.8745098, 0, 1,
-1.07736, 0.6886616, -2.098474, 1, 0.8823529, 0, 1,
-1.073339, 0.5190305, -1.377286, 1, 0.8862745, 0, 1,
-1.072741, 0.3092475, -0.8352845, 1, 0.8941177, 0, 1,
-1.069953, 0.2569471, -0.9218781, 1, 0.8980392, 0, 1,
-1.067736, -1.491596, -4.437431, 1, 0.9058824, 0, 1,
-1.06507, -0.5064059, -0.7673606, 1, 0.9137255, 0, 1,
-1.064862, 0.4163816, -1.859177, 1, 0.9176471, 0, 1,
-1.055834, -1.929454, -2.223708, 1, 0.9254902, 0, 1,
-1.045805, 0.03965905, -0.6779647, 1, 0.9294118, 0, 1,
-1.044017, 0.4625016, -1.710045, 1, 0.9372549, 0, 1,
-1.041753, -0.7583427, -2.342649, 1, 0.9411765, 0, 1,
-1.04054, 1.285773, -0.1998167, 1, 0.9490196, 0, 1,
-1.040036, -0.2050692, -2.017764, 1, 0.9529412, 0, 1,
-1.03243, 1.20331, -0.1042832, 1, 0.9607843, 0, 1,
-1.032085, 0.1936961, -1.585936, 1, 0.9647059, 0, 1,
-1.031697, -0.4801981, -3.134579, 1, 0.972549, 0, 1,
-1.020455, 1.725322, -1.652209, 1, 0.9764706, 0, 1,
-1.015427, 0.1049178, -0.2509373, 1, 0.9843137, 0, 1,
-1.003415, 0.4652992, -0.4388769, 1, 0.9882353, 0, 1,
-1.0021, -0.08641862, 0.6069198, 1, 0.9960784, 0, 1,
-1.00207, -0.239346, 0.7522988, 0.9960784, 1, 0, 1,
-0.9997535, 0.8085803, -3.193067, 0.9921569, 1, 0, 1,
-0.9976132, 0.4988759, -1.108053, 0.9843137, 1, 0, 1,
-0.9927476, -1.352412, -1.338384, 0.9803922, 1, 0, 1,
-0.9864307, 1.946559, 0.2995603, 0.972549, 1, 0, 1,
-0.9721833, -1.253895, -3.844495, 0.9686275, 1, 0, 1,
-0.9694569, -0.8898799, -3.025987, 0.9607843, 1, 0, 1,
-0.9584461, 0.587132, -0.9224436, 0.9568627, 1, 0, 1,
-0.9578032, 1.388939, -1.024919, 0.9490196, 1, 0, 1,
-0.9570473, -0.5621442, -2.42692, 0.945098, 1, 0, 1,
-0.9520146, 1.421551, 0.7239676, 0.9372549, 1, 0, 1,
-0.9386761, -0.7372038, -1.157982, 0.9333333, 1, 0, 1,
-0.9383223, -2.304837, -3.119502, 0.9254902, 1, 0, 1,
-0.9370963, -0.8758249, -2.453339, 0.9215686, 1, 0, 1,
-0.9331628, 0.7691803, 0.7523477, 0.9137255, 1, 0, 1,
-0.9317245, -0.8793479, -1.182866, 0.9098039, 1, 0, 1,
-0.9243166, 0.9178746, 0.739213, 0.9019608, 1, 0, 1,
-0.9224429, 1.758431, -0.1659732, 0.8941177, 1, 0, 1,
-0.9206527, 0.7449774, -1.788948, 0.8901961, 1, 0, 1,
-0.9129528, 0.8954673, -1.001214, 0.8823529, 1, 0, 1,
-0.9039649, 0.484418, 0.6138794, 0.8784314, 1, 0, 1,
-0.9039258, 0.1869838, -1.631299, 0.8705882, 1, 0, 1,
-0.9034132, 0.2216268, 1.370012, 0.8666667, 1, 0, 1,
-0.899303, 0.3771454, -3.379119, 0.8588235, 1, 0, 1,
-0.8937598, 0.1970692, -1.574037, 0.854902, 1, 0, 1,
-0.8884473, 0.2361761, -1.803595, 0.8470588, 1, 0, 1,
-0.8857846, 0.02852954, -0.7977617, 0.8431373, 1, 0, 1,
-0.8849314, 2.270094, 0.0002578186, 0.8352941, 1, 0, 1,
-0.884901, 0.8823881, -0.2375932, 0.8313726, 1, 0, 1,
-0.8845916, -1.112966, -2.023638, 0.8235294, 1, 0, 1,
-0.882388, -0.04927285, -0.9099439, 0.8196079, 1, 0, 1,
-0.8802003, -1.371085, -1.93673, 0.8117647, 1, 0, 1,
-0.8775197, 0.4432289, -2.658114, 0.8078431, 1, 0, 1,
-0.8717395, -1.149777, -1.515699, 0.8, 1, 0, 1,
-0.8680887, -1.339731, -1.944869, 0.7921569, 1, 0, 1,
-0.8648661, 0.4565766, 0.03896283, 0.7882353, 1, 0, 1,
-0.8625937, -0.8585159, -0.6046253, 0.7803922, 1, 0, 1,
-0.848585, -0.1381518, -1.895461, 0.7764706, 1, 0, 1,
-0.8436116, -1.329109, -2.637359, 0.7686275, 1, 0, 1,
-0.8343146, 0.1829427, -3.620487, 0.7647059, 1, 0, 1,
-0.8322477, -1.062895, -0.9276047, 0.7568628, 1, 0, 1,
-0.831147, -1.072279, -0.3585186, 0.7529412, 1, 0, 1,
-0.8268409, -1.007977, -0.8198909, 0.7450981, 1, 0, 1,
-0.8247976, -1.36812, -1.562365, 0.7411765, 1, 0, 1,
-0.8236389, -0.7941839, -0.4530742, 0.7333333, 1, 0, 1,
-0.8189413, 0.3372277, -2.327528, 0.7294118, 1, 0, 1,
-0.813882, -2.019429, -4.242995, 0.7215686, 1, 0, 1,
-0.8107046, -0.01290178, -0.2967364, 0.7176471, 1, 0, 1,
-0.8105782, 0.2355974, -0.2574699, 0.7098039, 1, 0, 1,
-0.8097333, 0.9900861, -1.569465, 0.7058824, 1, 0, 1,
-0.8052811, 0.2102353, -2.028914, 0.6980392, 1, 0, 1,
-0.8018901, 0.01997329, -1.468248, 0.6901961, 1, 0, 1,
-0.8004513, 0.949319, -1.808639, 0.6862745, 1, 0, 1,
-0.7990833, 1.410762, -1.41019, 0.6784314, 1, 0, 1,
-0.7959301, -1.140764, -1.661661, 0.6745098, 1, 0, 1,
-0.7958213, 0.3875144, -1.80063, 0.6666667, 1, 0, 1,
-0.7943278, -0.6279853, -3.498284, 0.6627451, 1, 0, 1,
-0.7907003, 0.349598, -1.476896, 0.654902, 1, 0, 1,
-0.7872648, 0.3903866, -0.5143131, 0.6509804, 1, 0, 1,
-0.7832513, -1.921242, -2.167139, 0.6431373, 1, 0, 1,
-0.781079, -1.672724, -3.276577, 0.6392157, 1, 0, 1,
-0.779918, -0.9719182, -3.509698, 0.6313726, 1, 0, 1,
-0.7748922, -0.4840803, -1.989022, 0.627451, 1, 0, 1,
-0.7651591, -1.132627, -2.188206, 0.6196079, 1, 0, 1,
-0.7616608, 0.8118873, 0.7136514, 0.6156863, 1, 0, 1,
-0.7597244, 0.6610126, 1.360785, 0.6078432, 1, 0, 1,
-0.7586787, -1.158158, -1.761754, 0.6039216, 1, 0, 1,
-0.7539315, -0.59741, -2.734463, 0.5960785, 1, 0, 1,
-0.7505906, 0.5604305, -1.743101, 0.5882353, 1, 0, 1,
-0.7459767, -0.09896709, -2.370005, 0.5843138, 1, 0, 1,
-0.7420534, -1.074875, -2.466004, 0.5764706, 1, 0, 1,
-0.7411733, -1.156671, -2.149003, 0.572549, 1, 0, 1,
-0.7331443, 0.108694, -2.023729, 0.5647059, 1, 0, 1,
-0.7246904, -0.6988446, -2.175565, 0.5607843, 1, 0, 1,
-0.7227258, 1.207267, -0.1653004, 0.5529412, 1, 0, 1,
-0.7199271, -2.501757, -4.409265, 0.5490196, 1, 0, 1,
-0.7154997, -0.1070495, -1.871922, 0.5411765, 1, 0, 1,
-0.7140454, -1.852079, -2.526127, 0.5372549, 1, 0, 1,
-0.7097451, -0.4541047, -2.38541, 0.5294118, 1, 0, 1,
-0.7046694, -0.06673129, -1.361569, 0.5254902, 1, 0, 1,
-0.7030501, -1.065339, -3.042123, 0.5176471, 1, 0, 1,
-0.7027549, 0.1070035, -0.169178, 0.5137255, 1, 0, 1,
-0.7005844, -0.2326901, -2.300345, 0.5058824, 1, 0, 1,
-0.6966566, -1.16589, -3.038642, 0.5019608, 1, 0, 1,
-0.6961446, 0.6508776, 2.366242, 0.4941176, 1, 0, 1,
-0.6960375, 1.167353, -1.548532, 0.4862745, 1, 0, 1,
-0.6952056, -0.9708118, -2.532502, 0.4823529, 1, 0, 1,
-0.6924329, 0.2537281, -1.655941, 0.4745098, 1, 0, 1,
-0.6917048, -0.2817287, -1.97683, 0.4705882, 1, 0, 1,
-0.6906148, -0.004961732, -1.458111, 0.4627451, 1, 0, 1,
-0.688796, -0.123297, -0.01318469, 0.4588235, 1, 0, 1,
-0.6852409, 1.826421, 1.110324, 0.4509804, 1, 0, 1,
-0.6837944, 1.753548, 0.8971844, 0.4470588, 1, 0, 1,
-0.6826274, 0.0494654, -2.053585, 0.4392157, 1, 0, 1,
-0.6816353, -0.2544399, -1.680845, 0.4352941, 1, 0, 1,
-0.6746666, 0.6642944, -0.889594, 0.427451, 1, 0, 1,
-0.6710705, -1.408586, -3.169733, 0.4235294, 1, 0, 1,
-0.6644878, 0.08289657, -0.5341229, 0.4156863, 1, 0, 1,
-0.6614907, -0.6804441, -2.881466, 0.4117647, 1, 0, 1,
-0.6608141, 0.3403192, -1.446549, 0.4039216, 1, 0, 1,
-0.6574473, -0.5245324, -2.048368, 0.3960784, 1, 0, 1,
-0.6559005, -0.5177631, -1.655598, 0.3921569, 1, 0, 1,
-0.6517982, 1.343137, -1.006235, 0.3843137, 1, 0, 1,
-0.6506004, -0.728704, -1.253616, 0.3803922, 1, 0, 1,
-0.6497476, -0.5635269, -3.202095, 0.372549, 1, 0, 1,
-0.6476359, -0.08574524, -2.558394, 0.3686275, 1, 0, 1,
-0.6470299, -0.6998229, -2.10694, 0.3607843, 1, 0, 1,
-0.6454319, 0.1343451, -1.538807, 0.3568628, 1, 0, 1,
-0.6406317, 0.1811093, -2.027261, 0.3490196, 1, 0, 1,
-0.6402665, 1.546351, -1.901037, 0.345098, 1, 0, 1,
-0.6351513, 0.5258298, -0.6849865, 0.3372549, 1, 0, 1,
-0.634221, 0.3089325, -0.6182891, 0.3333333, 1, 0, 1,
-0.6306407, 0.2006309, -1.528852, 0.3254902, 1, 0, 1,
-0.6293865, -0.5436733, -3.013468, 0.3215686, 1, 0, 1,
-0.6292422, -1.059602, -4.415839, 0.3137255, 1, 0, 1,
-0.6284042, -0.5365626, -3.907738, 0.3098039, 1, 0, 1,
-0.6282977, -0.5763403, -1.519897, 0.3019608, 1, 0, 1,
-0.6259962, 0.509756, -1.454101, 0.2941177, 1, 0, 1,
-0.6240267, 0.009741822, 1.20791, 0.2901961, 1, 0, 1,
-0.6229283, -0.3810726, -1.927612, 0.282353, 1, 0, 1,
-0.6204334, -0.596211, -2.968846, 0.2784314, 1, 0, 1,
-0.6124005, -2.974871, -3.994853, 0.2705882, 1, 0, 1,
-0.6120748, -0.1777443, -2.316615, 0.2666667, 1, 0, 1,
-0.6064864, -0.2428929, -3.421849, 0.2588235, 1, 0, 1,
-0.6063894, 0.2917842, -2.414692, 0.254902, 1, 0, 1,
-0.6034243, -2.25034, -1.703692, 0.2470588, 1, 0, 1,
-0.6032755, -1.002852, -2.319402, 0.2431373, 1, 0, 1,
-0.5999449, 0.7649541, 1.129778, 0.2352941, 1, 0, 1,
-0.5995193, -0.3954211, -1.382372, 0.2313726, 1, 0, 1,
-0.593621, 1.710516, -1.49472, 0.2235294, 1, 0, 1,
-0.5934111, -1.294425, -1.584423, 0.2196078, 1, 0, 1,
-0.5924766, -2.48814, -1.437962, 0.2117647, 1, 0, 1,
-0.5888011, -0.1897031, -3.278131, 0.2078431, 1, 0, 1,
-0.5831369, -0.132061, -2.132273, 0.2, 1, 0, 1,
-0.582106, 0.8149788, 1.052155, 0.1921569, 1, 0, 1,
-0.5762792, -0.403533, -0.8572302, 0.1882353, 1, 0, 1,
-0.5682688, -0.6188283, -2.949153, 0.1803922, 1, 0, 1,
-0.560061, -1.873434, -3.051132, 0.1764706, 1, 0, 1,
-0.5597163, -1.603004, -3.222294, 0.1686275, 1, 0, 1,
-0.554973, 1.322012, -2.373841, 0.1647059, 1, 0, 1,
-0.5546318, -0.4223474, -2.515237, 0.1568628, 1, 0, 1,
-0.5457912, -0.2629785, -1.465028, 0.1529412, 1, 0, 1,
-0.5362589, 0.5195221, 0.3431028, 0.145098, 1, 0, 1,
-0.5340396, -0.9021595, -2.844862, 0.1411765, 1, 0, 1,
-0.5302051, -0.5666587, -2.263375, 0.1333333, 1, 0, 1,
-0.5300778, 0.1717982, -1.75059, 0.1294118, 1, 0, 1,
-0.5245452, -0.7499277, -1.157765, 0.1215686, 1, 0, 1,
-0.5138775, 1.242987, -1.441975, 0.1176471, 1, 0, 1,
-0.5089476, -0.5383639, -3.200106, 0.1098039, 1, 0, 1,
-0.508324, -0.2272958, -3.297102, 0.1058824, 1, 0, 1,
-0.507607, -0.677238, -2.338202, 0.09803922, 1, 0, 1,
-0.5066593, -0.9620753, -1.989402, 0.09019608, 1, 0, 1,
-0.5006669, -1.250022, -3.630577, 0.08627451, 1, 0, 1,
-0.4986062, 0.02967082, -0.6035494, 0.07843138, 1, 0, 1,
-0.4981869, -1.638273, -3.030745, 0.07450981, 1, 0, 1,
-0.4957471, -1.099471, -4.411267, 0.06666667, 1, 0, 1,
-0.4954827, 1.276118, -0.3195722, 0.0627451, 1, 0, 1,
-0.4932225, 1.703729, -1.31828, 0.05490196, 1, 0, 1,
-0.4916083, -0.219405, -0.855341, 0.05098039, 1, 0, 1,
-0.489163, -0.6615086, -2.690948, 0.04313726, 1, 0, 1,
-0.4869837, 0.2767845, -1.006421, 0.03921569, 1, 0, 1,
-0.4861922, -0.7400749, -3.672996, 0.03137255, 1, 0, 1,
-0.4718118, -1.150313, -1.214467, 0.02745098, 1, 0, 1,
-0.4702448, 0.8346931, -1.241168, 0.01960784, 1, 0, 1,
-0.4693824, 0.8130042, -1.36155, 0.01568628, 1, 0, 1,
-0.4689687, 0.3251193, 0.9687284, 0.007843138, 1, 0, 1,
-0.4676208, 1.691299, 0.910101, 0.003921569, 1, 0, 1,
-0.4647666, 2.268349, -1.059697, 0, 1, 0.003921569, 1,
-0.4624272, -0.4329212, -3.690396, 0, 1, 0.01176471, 1,
-0.4608389, -0.919786, -4.258256, 0, 1, 0.01568628, 1,
-0.460276, -0.6796014, -1.112557, 0, 1, 0.02352941, 1,
-0.4558915, -1.460892, -4.065677, 0, 1, 0.02745098, 1,
-0.4548316, -0.1518869, -2.344047, 0, 1, 0.03529412, 1,
-0.4531096, 0.03789617, -1.738766, 0, 1, 0.03921569, 1,
-0.4501446, -0.8106023, -1.063243, 0, 1, 0.04705882, 1,
-0.4429826, -1.085473, -2.980641, 0, 1, 0.05098039, 1,
-0.4425773, -0.194094, -1.624326, 0, 1, 0.05882353, 1,
-0.4419187, -0.1652966, -2.775548, 0, 1, 0.0627451, 1,
-0.439442, 0.943996, -0.8451566, 0, 1, 0.07058824, 1,
-0.4358328, -0.2805539, -0.663323, 0, 1, 0.07450981, 1,
-0.4351323, -0.3266477, -2.336835, 0, 1, 0.08235294, 1,
-0.4335309, 0.2136624, -1.341516, 0, 1, 0.08627451, 1,
-0.4327864, -0.2314895, -1.358637, 0, 1, 0.09411765, 1,
-0.4326099, -0.1805164, -0.2993636, 0, 1, 0.1019608, 1,
-0.4315646, 1.386639, -1.634526, 0, 1, 0.1058824, 1,
-0.4289715, -0.5440184, -1.716148, 0, 1, 0.1137255, 1,
-0.4272793, -0.3960775, -0.7198842, 0, 1, 0.1176471, 1,
-0.4271608, -0.3692612, -3.405801, 0, 1, 0.1254902, 1,
-0.4229321, 1.808989, -1.776658, 0, 1, 0.1294118, 1,
-0.4189037, 0.5834512, 0.5680732, 0, 1, 0.1372549, 1,
-0.418001, -0.5260911, -3.373726, 0, 1, 0.1411765, 1,
-0.4169268, -0.8187693, -2.163791, 0, 1, 0.1490196, 1,
-0.4089235, -0.3860268, -2.313784, 0, 1, 0.1529412, 1,
-0.4074859, 0.1250032, -1.464374, 0, 1, 0.1607843, 1,
-0.406835, -1.863025, -2.980473, 0, 1, 0.1647059, 1,
-0.4033257, 0.4158614, 0.2268146, 0, 1, 0.172549, 1,
-0.4022253, -1.11894, -3.419156, 0, 1, 0.1764706, 1,
-0.4019496, -1.256537, -3.797731, 0, 1, 0.1843137, 1,
-0.3961866, -1.215381, -2.835201, 0, 1, 0.1882353, 1,
-0.3888189, -0.9263698, -2.65423, 0, 1, 0.1960784, 1,
-0.3871912, 0.3764541, -0.8100795, 0, 1, 0.2039216, 1,
-0.3833465, 0.595534, -1.28123, 0, 1, 0.2078431, 1,
-0.3832568, 0.3586791, -3.276485, 0, 1, 0.2156863, 1,
-0.3824557, -0.03028072, -2.332191, 0, 1, 0.2196078, 1,
-0.3823532, -0.2397364, -2.289884, 0, 1, 0.227451, 1,
-0.3820805, 0.7979156, -1.487618, 0, 1, 0.2313726, 1,
-0.3729781, 0.1789073, -3.140731, 0, 1, 0.2392157, 1,
-0.3689477, -0.7722616, -1.1578, 0, 1, 0.2431373, 1,
-0.3659989, 0.002677787, -0.6007561, 0, 1, 0.2509804, 1,
-0.3638041, 1.288066, -0.1679385, 0, 1, 0.254902, 1,
-0.3637763, 0.4111215, 0.08123616, 0, 1, 0.2627451, 1,
-0.357639, -0.5218211, -1.871536, 0, 1, 0.2666667, 1,
-0.3551544, 0.9240465, -2.34223, 0, 1, 0.2745098, 1,
-0.3548606, 0.7714834, -1.180413, 0, 1, 0.2784314, 1,
-0.3547626, 1.196042, -0.1808674, 0, 1, 0.2862745, 1,
-0.3519973, -0.4122792, -2.398215, 0, 1, 0.2901961, 1,
-0.3414528, -1.758062, -4.872025, 0, 1, 0.2980392, 1,
-0.3372168, -0.1142018, -1.372681, 0, 1, 0.3058824, 1,
-0.3355374, -0.8592772, -2.361397, 0, 1, 0.3098039, 1,
-0.3338204, -0.5289754, -3.097955, 0, 1, 0.3176471, 1,
-0.3337649, -1.617791, -2.970514, 0, 1, 0.3215686, 1,
-0.3313813, 1.112118, 0.1432311, 0, 1, 0.3294118, 1,
-0.3265375, 1.031873, -0.7490755, 0, 1, 0.3333333, 1,
-0.3228159, 0.6603034, -1.233584, 0, 1, 0.3411765, 1,
-0.3208672, -1.391572, -2.229728, 0, 1, 0.345098, 1,
-0.3177619, 0.1834201, 1.127873, 0, 1, 0.3529412, 1,
-0.3170306, -0.4497879, -2.682623, 0, 1, 0.3568628, 1,
-0.3158717, -0.9069759, -3.177045, 0, 1, 0.3647059, 1,
-0.3147495, -0.09891713, -1.228032, 0, 1, 0.3686275, 1,
-0.3099707, 0.5873404, -1.535999, 0, 1, 0.3764706, 1,
-0.3064291, 0.4645087, -1.281164, 0, 1, 0.3803922, 1,
-0.302134, -0.06613651, -3.176817, 0, 1, 0.3882353, 1,
-0.302073, 0.09771371, -1.686496, 0, 1, 0.3921569, 1,
-0.3002668, 0.1778656, 0.1104185, 0, 1, 0.4, 1,
-0.2993876, 0.5587739, -2.491508, 0, 1, 0.4078431, 1,
-0.2981679, 0.4566665, -0.7597556, 0, 1, 0.4117647, 1,
-0.2915636, 0.04960641, -1.29224, 0, 1, 0.4196078, 1,
-0.2912497, -0.9640071, -2.421052, 0, 1, 0.4235294, 1,
-0.2881064, -0.1970782, -2.139046, 0, 1, 0.4313726, 1,
-0.2878193, -1.56676, -5.041442, 0, 1, 0.4352941, 1,
-0.2847247, 0.7537378, -1.636847, 0, 1, 0.4431373, 1,
-0.2800251, -1.736422, -3.424095, 0, 1, 0.4470588, 1,
-0.2778023, 0.8001823, 0.2913282, 0, 1, 0.454902, 1,
-0.2760909, 0.1169336, -1.874698, 0, 1, 0.4588235, 1,
-0.2742429, -0.9861854, -1.950749, 0, 1, 0.4666667, 1,
-0.2678895, -0.4896425, -2.588839, 0, 1, 0.4705882, 1,
-0.2663303, 1.930435, 0.6396683, 0, 1, 0.4784314, 1,
-0.2643457, 0.3111525, -1.036901, 0, 1, 0.4823529, 1,
-0.2608462, 0.8729482, -1.907175, 0, 1, 0.4901961, 1,
-0.2604909, -0.2867547, -0.705301, 0, 1, 0.4941176, 1,
-0.2604435, 0.08975177, -2.832956, 0, 1, 0.5019608, 1,
-0.2567573, 0.3655424, -1.649953, 0, 1, 0.509804, 1,
-0.2545472, 0.1406617, -0.758462, 0, 1, 0.5137255, 1,
-0.2537688, 0.9009149, -0.9130638, 0, 1, 0.5215687, 1,
-0.2486299, -0.391708, -3.631905, 0, 1, 0.5254902, 1,
-0.2481404, 0.5705887, 0.6589102, 0, 1, 0.5333334, 1,
-0.247041, -0.1235592, -1.902965, 0, 1, 0.5372549, 1,
-0.2438131, -0.6151018, -0.69562, 0, 1, 0.5450981, 1,
-0.2424813, -1.28389, -3.865738, 0, 1, 0.5490196, 1,
-0.235385, -1.498909, -4.928065, 0, 1, 0.5568628, 1,
-0.2320257, -0.6770291, -2.16793, 0, 1, 0.5607843, 1,
-0.2289278, 0.2483064, 0.347589, 0, 1, 0.5686275, 1,
-0.2265994, -0.1992364, -1.658308, 0, 1, 0.572549, 1,
-0.2178425, 1.297633, -1.657179, 0, 1, 0.5803922, 1,
-0.2166909, -1.20919, -2.703497, 0, 1, 0.5843138, 1,
-0.2163894, 0.1785571, -0.7329978, 0, 1, 0.5921569, 1,
-0.2152218, -0.1480715, -3.548526, 0, 1, 0.5960785, 1,
-0.215216, 0.1249457, -1.254742, 0, 1, 0.6039216, 1,
-0.2142472, -0.4268452, -1.794417, 0, 1, 0.6117647, 1,
-0.2140389, -0.4754072, -2.446919, 0, 1, 0.6156863, 1,
-0.2106691, 0.1043328, -2.147353, 0, 1, 0.6235294, 1,
-0.2066315, -0.6595582, -5.005211, 0, 1, 0.627451, 1,
-0.2051945, 1.246509, -0.04291999, 0, 1, 0.6352941, 1,
-0.203907, -0.6189532, -3.790473, 0, 1, 0.6392157, 1,
-0.2038353, -0.5438905, -2.420548, 0, 1, 0.6470588, 1,
-0.2026973, 1.67585, -0.3277782, 0, 1, 0.6509804, 1,
-0.2001696, 0.3239862, -0.09280188, 0, 1, 0.6588235, 1,
-0.1995873, 1.778935, -0.8661685, 0, 1, 0.6627451, 1,
-0.1946058, 0.6623969, -0.3587921, 0, 1, 0.6705883, 1,
-0.1908456, 1.911897, -1.685383, 0, 1, 0.6745098, 1,
-0.1896508, 0.3126696, 1.882221, 0, 1, 0.682353, 1,
-0.1882772, 1.925887, -2.163707, 0, 1, 0.6862745, 1,
-0.1829657, 0.5898897, -0.1467602, 0, 1, 0.6941177, 1,
-0.1801658, -0.718983, -3.316233, 0, 1, 0.7019608, 1,
-0.1800618, -0.6513822, -2.997743, 0, 1, 0.7058824, 1,
-0.1783163, -0.7246464, -2.374342, 0, 1, 0.7137255, 1,
-0.1781464, -1.911634, -3.5377, 0, 1, 0.7176471, 1,
-0.1756386, -0.8798671, -3.499883, 0, 1, 0.7254902, 1,
-0.1696226, 1.926942, -1.063597, 0, 1, 0.7294118, 1,
-0.1671829, -0.1715417, -2.89999, 0, 1, 0.7372549, 1,
-0.1656521, 1.240136, 0.6768792, 0, 1, 0.7411765, 1,
-0.162557, 2.253365, 1.512624, 0, 1, 0.7490196, 1,
-0.1616436, 0.6199716, 0.487871, 0, 1, 0.7529412, 1,
-0.1610963, 1.145568, 0.2387625, 0, 1, 0.7607843, 1,
-0.1575814, 1.797134, 0.02735716, 0, 1, 0.7647059, 1,
-0.1542494, -1.62612, -3.032304, 0, 1, 0.772549, 1,
-0.1522002, -0.3662044, -3.583211, 0, 1, 0.7764706, 1,
-0.1507837, -0.3322615, -1.915148, 0, 1, 0.7843137, 1,
-0.1469129, -0.5210142, -4.193861, 0, 1, 0.7882353, 1,
-0.146819, 0.5100566, -0.8929871, 0, 1, 0.7960784, 1,
-0.1462376, -1.998366, -3.991129, 0, 1, 0.8039216, 1,
-0.143168, 0.08588409, -0.5202062, 0, 1, 0.8078431, 1,
-0.1327386, 0.3119369, 0.4793032, 0, 1, 0.8156863, 1,
-0.1314694, -0.1406787, -2.414476, 0, 1, 0.8196079, 1,
-0.1310228, -0.6248429, -2.228806, 0, 1, 0.827451, 1,
-0.1300616, -0.5454015, -1.785729, 0, 1, 0.8313726, 1,
-0.1259413, -0.1458389, -1.31503, 0, 1, 0.8392157, 1,
-0.125566, -0.4629721, -3.813812, 0, 1, 0.8431373, 1,
-0.1233141, -0.2985553, -4.042249, 0, 1, 0.8509804, 1,
-0.1218943, -1.727365, -2.561942, 0, 1, 0.854902, 1,
-0.1171807, 0.03391573, -1.096315, 0, 1, 0.8627451, 1,
-0.11211, 1.194667, 0.8254154, 0, 1, 0.8666667, 1,
-0.1062887, -0.8367668, -4.527446, 0, 1, 0.8745098, 1,
-0.0970754, -0.5967475, -3.33801, 0, 1, 0.8784314, 1,
-0.09621228, 0.3132287, -1.156407, 0, 1, 0.8862745, 1,
-0.08873425, 1.328238, -1.788352, 0, 1, 0.8901961, 1,
-0.08180049, -0.4285596, -3.994967, 0, 1, 0.8980392, 1,
-0.08172142, -0.7125443, -3.184101, 0, 1, 0.9058824, 1,
-0.07645266, 0.4710463, -0.1755476, 0, 1, 0.9098039, 1,
-0.07348051, 2.099221, 1.183905, 0, 1, 0.9176471, 1,
-0.07174055, 0.4551199, 1.248943, 0, 1, 0.9215686, 1,
-0.07151748, 1.426207, -0.3659213, 0, 1, 0.9294118, 1,
-0.06962603, 0.09182555, -1.612473, 0, 1, 0.9333333, 1,
-0.0644503, 0.5558411, 1.212105, 0, 1, 0.9411765, 1,
-0.06426843, 0.6463983, -2.423196, 0, 1, 0.945098, 1,
-0.06291336, -1.0483, -4.43596, 0, 1, 0.9529412, 1,
-0.06011049, -1.248889, -2.255161, 0, 1, 0.9568627, 1,
-0.05891277, -0.5784429, -2.356328, 0, 1, 0.9647059, 1,
-0.04983158, 0.4421797, -0.3070844, 0, 1, 0.9686275, 1,
-0.04831546, 0.515034, -1.086786, 0, 1, 0.9764706, 1,
-0.04340441, -1.48091, -1.888672, 0, 1, 0.9803922, 1,
-0.03813206, 1.867949, 0.04271078, 0, 1, 0.9882353, 1,
-0.03553243, 0.549013, 0.2347644, 0, 1, 0.9921569, 1,
-0.03503503, -0.05774551, -2.895664, 0, 1, 1, 1,
-0.03319661, 0.2726373, -1.171543, 0, 0.9921569, 1, 1,
-0.01586056, 1.17702, 0.01815307, 0, 0.9882353, 1, 1,
-0.01473324, -0.4201185, -1.810217, 0, 0.9803922, 1, 1,
-0.003715658, 0.5262325, -0.526081, 0, 0.9764706, 1, 1,
-0.003709666, -0.9595268, -2.141152, 0, 0.9686275, 1, 1,
0.007555064, -0.3936407, 3.77114, 0, 0.9647059, 1, 1,
0.01602718, -0.4548814, 2.142515, 0, 0.9568627, 1, 1,
0.016101, 0.06084629, 1.780458, 0, 0.9529412, 1, 1,
0.01703035, -0.28767, 1.951337, 0, 0.945098, 1, 1,
0.01705103, 0.6994131, -1.710856, 0, 0.9411765, 1, 1,
0.0244924, 0.006474736, 0.7411978, 0, 0.9333333, 1, 1,
0.02658746, -1.643878, 0.959044, 0, 0.9294118, 1, 1,
0.02906809, -3.015869, 1.964694, 0, 0.9215686, 1, 1,
0.02938867, 0.1701289, 0.02430929, 0, 0.9176471, 1, 1,
0.0320253, -0.9202483, 4.071652, 0, 0.9098039, 1, 1,
0.03261792, -0.6342006, 3.816093, 0, 0.9058824, 1, 1,
0.03436469, -0.2557436, 4.637283, 0, 0.8980392, 1, 1,
0.03440965, 0.4510692, -0.3154135, 0, 0.8901961, 1, 1,
0.04063492, -0.8702121, 4.493658, 0, 0.8862745, 1, 1,
0.04126265, 0.9234588, -0.61369, 0, 0.8784314, 1, 1,
0.04183504, -2.210474, 3.46775, 0, 0.8745098, 1, 1,
0.04277445, 0.5786237, 1.018694, 0, 0.8666667, 1, 1,
0.04595813, 1.955328, 1.189871, 0, 0.8627451, 1, 1,
0.04764076, -0.7277231, 0.9154916, 0, 0.854902, 1, 1,
0.04808656, 0.4332269, 0.5968161, 0, 0.8509804, 1, 1,
0.0509809, 0.658428, -1.286266, 0, 0.8431373, 1, 1,
0.05579717, 0.1954718, -0.5491455, 0, 0.8392157, 1, 1,
0.05712468, -0.4857903, 1.32292, 0, 0.8313726, 1, 1,
0.05903033, 0.5768033, 1.052723, 0, 0.827451, 1, 1,
0.0594206, 0.2239923, 0.6106572, 0, 0.8196079, 1, 1,
0.06275508, 0.6026647, 1.186052, 0, 0.8156863, 1, 1,
0.06439918, 1.480379, -0.3956771, 0, 0.8078431, 1, 1,
0.06584337, -1.570794, 4.608181, 0, 0.8039216, 1, 1,
0.06846432, 0.0617519, 1.005428, 0, 0.7960784, 1, 1,
0.07702099, -0.9368307, 3.752448, 0, 0.7882353, 1, 1,
0.07711753, 0.01264092, 2.314316, 0, 0.7843137, 1, 1,
0.0773074, -1.039399, 2.978093, 0, 0.7764706, 1, 1,
0.07846218, 0.3508726, -0.81564, 0, 0.772549, 1, 1,
0.07919116, 0.9890188, -0.2100432, 0, 0.7647059, 1, 1,
0.07949342, -0.6537471, 4.018256, 0, 0.7607843, 1, 1,
0.08329863, -0.7096592, 4.905154, 0, 0.7529412, 1, 1,
0.08425792, -0.06212562, 2.677237, 0, 0.7490196, 1, 1,
0.08763608, 0.187471, 1.539562, 0, 0.7411765, 1, 1,
0.09316234, 1.453705, 0.8855923, 0, 0.7372549, 1, 1,
0.09472652, 0.5325795, -0.07646057, 0, 0.7294118, 1, 1,
0.09669966, -0.2510695, 2.849329, 0, 0.7254902, 1, 1,
0.09721122, 0.4433492, 1.438983, 0, 0.7176471, 1, 1,
0.09753712, 0.08429999, 2.126626, 0, 0.7137255, 1, 1,
0.09980332, -0.5354303, 2.770438, 0, 0.7058824, 1, 1,
0.1058499, -0.2402235, 3.158011, 0, 0.6980392, 1, 1,
0.1083434, -1.068707, 3.540826, 0, 0.6941177, 1, 1,
0.1087772, -0.3938597, 3.677049, 0, 0.6862745, 1, 1,
0.1099055, -0.326983, 0.7311543, 0, 0.682353, 1, 1,
0.118847, -0.08216089, 2.113017, 0, 0.6745098, 1, 1,
0.1191688, 0.1232721, -0.6914381, 0, 0.6705883, 1, 1,
0.1220115, -1.876431, 4.358687, 0, 0.6627451, 1, 1,
0.1228456, -0.5744516, 2.499931, 0, 0.6588235, 1, 1,
0.1257724, -0.1446789, 2.564015, 0, 0.6509804, 1, 1,
0.1313015, 2.277409, -1.602585, 0, 0.6470588, 1, 1,
0.1315768, 0.2141175, 2.271623, 0, 0.6392157, 1, 1,
0.1453118, 1.474649, -1.314342, 0, 0.6352941, 1, 1,
0.1463073, -0.7538295, 4.7202, 0, 0.627451, 1, 1,
0.1499674, -0.3923858, 3.150011, 0, 0.6235294, 1, 1,
0.1501097, 0.2731178, -1.657711, 0, 0.6156863, 1, 1,
0.1501208, -1.10628, 2.031184, 0, 0.6117647, 1, 1,
0.1519381, 1.193396, 1.662817, 0, 0.6039216, 1, 1,
0.1537514, -0.1631846, 3.11603, 0, 0.5960785, 1, 1,
0.1539432, -1.634468, 2.758963, 0, 0.5921569, 1, 1,
0.1542314, -0.2353651, 2.332066, 0, 0.5843138, 1, 1,
0.1618298, 0.6865892, 0.3142239, 0, 0.5803922, 1, 1,
0.1620675, -0.6291664, 2.959329, 0, 0.572549, 1, 1,
0.1623692, -1.134258, 2.156027, 0, 0.5686275, 1, 1,
0.1638791, -0.04894679, 2.109838, 0, 0.5607843, 1, 1,
0.1681327, 1.730368, -2.543099, 0, 0.5568628, 1, 1,
0.1696546, 0.911783, 0.3321646, 0, 0.5490196, 1, 1,
0.1705578, 0.5445358, 3.591211, 0, 0.5450981, 1, 1,
0.1712626, -0.2442905, 2.351756, 0, 0.5372549, 1, 1,
0.1722341, -1.286045, 3.328528, 0, 0.5333334, 1, 1,
0.1754875, 1.134582, -0.3847519, 0, 0.5254902, 1, 1,
0.177191, -0.7597644, 1.885801, 0, 0.5215687, 1, 1,
0.1788763, -1.67964, 1.453351, 0, 0.5137255, 1, 1,
0.1803024, 0.1638744, 1.063777, 0, 0.509804, 1, 1,
0.1806419, 0.7381133, 0.331398, 0, 0.5019608, 1, 1,
0.1807728, 1.019262, 1.300347, 0, 0.4941176, 1, 1,
0.1812613, 0.3497745, 1.826549, 0, 0.4901961, 1, 1,
0.1827935, -0.3723937, 3.208306, 0, 0.4823529, 1, 1,
0.1849996, -1.903912, 1.451989, 0, 0.4784314, 1, 1,
0.1971185, -1.153744, 3.288177, 0, 0.4705882, 1, 1,
0.1971754, 0.2124223, 0.007657006, 0, 0.4666667, 1, 1,
0.1982469, -0.4387105, 2.770897, 0, 0.4588235, 1, 1,
0.1983423, -0.257385, 1.878232, 0, 0.454902, 1, 1,
0.1990274, -1.681273, 1.656135, 0, 0.4470588, 1, 1,
0.2022749, -0.2917189, 1.921699, 0, 0.4431373, 1, 1,
0.2057961, 0.08210935, 0.795986, 0, 0.4352941, 1, 1,
0.2109551, 2.194813, 0.3908102, 0, 0.4313726, 1, 1,
0.215561, 0.6346335, 0.2243594, 0, 0.4235294, 1, 1,
0.2167316, 1.64178, -0.4942606, 0, 0.4196078, 1, 1,
0.2179261, 0.1946894, 1.30414, 0, 0.4117647, 1, 1,
0.2213175, 1.149683, 1.395108, 0, 0.4078431, 1, 1,
0.2224476, 2.532511, 0.1876724, 0, 0.4, 1, 1,
0.2230919, 0.3045292, 1.681694, 0, 0.3921569, 1, 1,
0.2242667, -0.4939676, 4.336616, 0, 0.3882353, 1, 1,
0.2246996, -0.8231055, 2.840091, 0, 0.3803922, 1, 1,
0.2252384, -2.387514, 3.736169, 0, 0.3764706, 1, 1,
0.2269631, -1.491444, 2.376965, 0, 0.3686275, 1, 1,
0.227418, -0.2828902, 1.981926, 0, 0.3647059, 1, 1,
0.2276651, -0.9915402, 2.931738, 0, 0.3568628, 1, 1,
0.2278836, 0.4520113, 0.6045113, 0, 0.3529412, 1, 1,
0.2282145, 0.9235767, 0.1167955, 0, 0.345098, 1, 1,
0.2282233, -0.9079252, 2.561529, 0, 0.3411765, 1, 1,
0.2294034, -0.6657856, 0.794053, 0, 0.3333333, 1, 1,
0.2294829, 0.7905593, 0.4777429, 0, 0.3294118, 1, 1,
0.2294858, 1.342734, 0.395632, 0, 0.3215686, 1, 1,
0.2362215, 0.4692338, -0.7107753, 0, 0.3176471, 1, 1,
0.2400458, -1.771883, 1.355014, 0, 0.3098039, 1, 1,
0.2430574, 1.324641, -0.4313082, 0, 0.3058824, 1, 1,
0.2466351, -1.327967, 2.13339, 0, 0.2980392, 1, 1,
0.2467056, 0.009771855, 1.620228, 0, 0.2901961, 1, 1,
0.2474548, -0.5907606, 2.707743, 0, 0.2862745, 1, 1,
0.2495676, -0.3476937, 1.645077, 0, 0.2784314, 1, 1,
0.2547949, 0.683248, -0.08720332, 0, 0.2745098, 1, 1,
0.2573045, -1.750446, 4.709454, 0, 0.2666667, 1, 1,
0.2601053, 1.36838, -0.3057765, 0, 0.2627451, 1, 1,
0.2646776, -0.1568092, 1.437262, 0, 0.254902, 1, 1,
0.2673532, -1.427089, 2.562111, 0, 0.2509804, 1, 1,
0.2739973, -1.908387, 3.600489, 0, 0.2431373, 1, 1,
0.2760362, -0.655836, 2.473898, 0, 0.2392157, 1, 1,
0.2816709, 0.4170507, 0.5304587, 0, 0.2313726, 1, 1,
0.2825464, -0.3446139, 2.036765, 0, 0.227451, 1, 1,
0.2897785, -0.1086665, 2.690774, 0, 0.2196078, 1, 1,
0.2899509, 0.4986747, -0.1948666, 0, 0.2156863, 1, 1,
0.2922873, -0.249096, 3.863743, 0, 0.2078431, 1, 1,
0.292572, 0.8178606, -0.3715758, 0, 0.2039216, 1, 1,
0.2976215, 0.09964814, 2.303163, 0, 0.1960784, 1, 1,
0.2985098, 0.01954983, 1.248528, 0, 0.1882353, 1, 1,
0.298689, -0.006703491, 3.823151, 0, 0.1843137, 1, 1,
0.300467, -0.2167212, 3.299318, 0, 0.1764706, 1, 1,
0.3013099, -0.3093496, 1.439128, 0, 0.172549, 1, 1,
0.306733, -0.09218645, 1.130658, 0, 0.1647059, 1, 1,
0.3107446, 0.8223819, -0.3796268, 0, 0.1607843, 1, 1,
0.3117739, 1.172684, -1.043082, 0, 0.1529412, 1, 1,
0.3181204, 1.078693, 1.592241, 0, 0.1490196, 1, 1,
0.3184531, 1.16575, -0.4673963, 0, 0.1411765, 1, 1,
0.3187943, 0.8182585, -0.03561451, 0, 0.1372549, 1, 1,
0.3233232, -0.3138884, 2.080834, 0, 0.1294118, 1, 1,
0.3244725, -0.2678623, 0.3241597, 0, 0.1254902, 1, 1,
0.3321414, -0.1870178, 1.9763, 0, 0.1176471, 1, 1,
0.3338205, -1.610495, 3.36388, 0, 0.1137255, 1, 1,
0.3343332, 1.241002, 0.1626373, 0, 0.1058824, 1, 1,
0.3362352, 0.6553004, 3.027612, 0, 0.09803922, 1, 1,
0.3379485, -0.01389794, 1.691829, 0, 0.09411765, 1, 1,
0.3382579, -0.65266, 1.16199, 0, 0.08627451, 1, 1,
0.3416068, 1.731984, -1.356235, 0, 0.08235294, 1, 1,
0.3442014, 0.3398731, 0.9067577, 0, 0.07450981, 1, 1,
0.3485, -1.318157, 2.81445, 0, 0.07058824, 1, 1,
0.3485657, -0.6221825, 3.799076, 0, 0.0627451, 1, 1,
0.3517498, 1.869141, 0.2004572, 0, 0.05882353, 1, 1,
0.3522248, -2.020232, 3.108516, 0, 0.05098039, 1, 1,
0.3533401, -0.6818141, 4.630432, 0, 0.04705882, 1, 1,
0.3543422, 1.53604, 2.584384, 0, 0.03921569, 1, 1,
0.3546377, -0.1350859, 0.5802455, 0, 0.03529412, 1, 1,
0.3701486, -1.303721, 4.027966, 0, 0.02745098, 1, 1,
0.3759872, 2.07518, 0.4242839, 0, 0.02352941, 1, 1,
0.3801884, -0.5477877, 2.451622, 0, 0.01568628, 1, 1,
0.3859296, 0.6736994, -0.007203729, 0, 0.01176471, 1, 1,
0.3863206, -0.6062077, 1.847718, 0, 0.003921569, 1, 1,
0.3875608, -0.6281273, 2.968177, 0.003921569, 0, 1, 1,
0.3904511, -0.04825966, 1.16586, 0.007843138, 0, 1, 1,
0.3918413, 0.4547801, 0.8151522, 0.01568628, 0, 1, 1,
0.3922733, 1.672262, 0.6050556, 0.01960784, 0, 1, 1,
0.3928741, 0.3387062, 0.7517304, 0.02745098, 0, 1, 1,
0.3933133, 2.271748, 0.01694476, 0.03137255, 0, 1, 1,
0.3935713, 1.03493, 1.776877, 0.03921569, 0, 1, 1,
0.3954745, 2.004403, 0.01470452, 0.04313726, 0, 1, 1,
0.4067806, 0.03754198, 2.014133, 0.05098039, 0, 1, 1,
0.4083862, 0.2434614, 1.580823, 0.05490196, 0, 1, 1,
0.4114025, 1.406382, -0.731652, 0.0627451, 0, 1, 1,
0.4122728, 0.5530428, 0.5617218, 0.06666667, 0, 1, 1,
0.4149942, -0.5339651, 3.439207, 0.07450981, 0, 1, 1,
0.4152224, -0.1311019, 2.349907, 0.07843138, 0, 1, 1,
0.4152385, -0.1732179, 0.8617121, 0.08627451, 0, 1, 1,
0.4160147, 0.1786289, 2.216554, 0.09019608, 0, 1, 1,
0.4170976, -0.8485447, 2.603055, 0.09803922, 0, 1, 1,
0.4190244, 0.8031393, 0.4750063, 0.1058824, 0, 1, 1,
0.4200061, -1.048625, 3.031189, 0.1098039, 0, 1, 1,
0.4227588, -1.315147, 2.871834, 0.1176471, 0, 1, 1,
0.4240896, 1.37771, -0.7675519, 0.1215686, 0, 1, 1,
0.4274126, -0.0894039, 0.94401, 0.1294118, 0, 1, 1,
0.4327834, -0.7470718, 2.437373, 0.1333333, 0, 1, 1,
0.4328603, -1.114798, 5.360787, 0.1411765, 0, 1, 1,
0.4384832, -1.535734, 2.69034, 0.145098, 0, 1, 1,
0.4397976, -0.6605011, 3.138713, 0.1529412, 0, 1, 1,
0.4422585, 1.761204, 1.65911, 0.1568628, 0, 1, 1,
0.4466692, 1.485319, -0.6369308, 0.1647059, 0, 1, 1,
0.4628977, -0.05733971, 0.797305, 0.1686275, 0, 1, 1,
0.4651172, -1.013287, 0.4509475, 0.1764706, 0, 1, 1,
0.4813023, -0.7224185, 3.650853, 0.1803922, 0, 1, 1,
0.481676, 0.03844111, 1.367783, 0.1882353, 0, 1, 1,
0.4820475, 0.05226537, 2.759669, 0.1921569, 0, 1, 1,
0.4841668, 0.1411095, 2.051474, 0.2, 0, 1, 1,
0.4876711, -0.8272504, 2.018044, 0.2078431, 0, 1, 1,
0.4887913, 0.5229427, 2.88182, 0.2117647, 0, 1, 1,
0.4912339, -0.4559376, 2.006377, 0.2196078, 0, 1, 1,
0.4924181, 1.056364, 1.604088, 0.2235294, 0, 1, 1,
0.4934552, 0.4769211, 1.399906, 0.2313726, 0, 1, 1,
0.4991294, -1.061296, 3.925871, 0.2352941, 0, 1, 1,
0.5003239, -0.1162863, 1.386392, 0.2431373, 0, 1, 1,
0.50233, 0.07237738, 1.758109, 0.2470588, 0, 1, 1,
0.5036208, -0.5508659, 2.588868, 0.254902, 0, 1, 1,
0.5069509, 1.737255, -2.022857, 0.2588235, 0, 1, 1,
0.5075176, 2.411841, -0.08451156, 0.2666667, 0, 1, 1,
0.5075555, -0.09824262, 1.880694, 0.2705882, 0, 1, 1,
0.5085807, -0.0427875, 1.757813, 0.2784314, 0, 1, 1,
0.5113009, 1.073901, -1.043343, 0.282353, 0, 1, 1,
0.5118747, 0.3720609, 0.5295869, 0.2901961, 0, 1, 1,
0.514563, 0.1417572, 1.784193, 0.2941177, 0, 1, 1,
0.5157929, -0.9867025, 2.235301, 0.3019608, 0, 1, 1,
0.5202974, 0.4119667, 1.683779, 0.3098039, 0, 1, 1,
0.5230809, 1.03439, 0.7641954, 0.3137255, 0, 1, 1,
0.5311651, -0.5974265, 3.000837, 0.3215686, 0, 1, 1,
0.5333145, 0.7056633, 1.72384, 0.3254902, 0, 1, 1,
0.5413911, -2.985544, 2.65165, 0.3333333, 0, 1, 1,
0.5439088, -0.2000231, 1.381076, 0.3372549, 0, 1, 1,
0.5533145, -0.1285488, 0.5621355, 0.345098, 0, 1, 1,
0.553757, -0.5118065, 0.9384888, 0.3490196, 0, 1, 1,
0.5549551, 0.5296999, 1.739881, 0.3568628, 0, 1, 1,
0.5550703, 0.5615476, -0.9637246, 0.3607843, 0, 1, 1,
0.5750902, -0.2387868, 2.190602, 0.3686275, 0, 1, 1,
0.5845372, 0.3590049, -0.2167644, 0.372549, 0, 1, 1,
0.5866175, -1.170292, 2.000685, 0.3803922, 0, 1, 1,
0.5900121, -0.05382417, 0.474963, 0.3843137, 0, 1, 1,
0.5919484, 0.4738598, -0.3990474, 0.3921569, 0, 1, 1,
0.5919951, 0.7450224, 0.7400952, 0.3960784, 0, 1, 1,
0.5954457, 0.633587, 0.9052064, 0.4039216, 0, 1, 1,
0.5982602, 1.355461, -0.1673781, 0.4117647, 0, 1, 1,
0.5990328, 0.04775165, 3.670711, 0.4156863, 0, 1, 1,
0.6028197, -1.682417, 1.369881, 0.4235294, 0, 1, 1,
0.6034026, -1.173688, 2.951927, 0.427451, 0, 1, 1,
0.6041317, -1.94896, 3.06356, 0.4352941, 0, 1, 1,
0.6069959, 0.06560451, 0.9604639, 0.4392157, 0, 1, 1,
0.6095712, 0.9311169, 1.527469, 0.4470588, 0, 1, 1,
0.6101046, 0.4567621, 1.621258, 0.4509804, 0, 1, 1,
0.6127571, -1.640177, 3.539861, 0.4588235, 0, 1, 1,
0.6142462, -0.9957572, 1.971787, 0.4627451, 0, 1, 1,
0.6154577, 0.3643441, 1.247792, 0.4705882, 0, 1, 1,
0.6170571, -1.075986, 1.325777, 0.4745098, 0, 1, 1,
0.6258896, 1.194182, 0.1954067, 0.4823529, 0, 1, 1,
0.6393928, -0.3590326, 0.5166635, 0.4862745, 0, 1, 1,
0.6477622, 0.3601469, -1.463153, 0.4941176, 0, 1, 1,
0.6499656, 0.4644139, 0.9186578, 0.5019608, 0, 1, 1,
0.65473, -0.7461929, 2.277564, 0.5058824, 0, 1, 1,
0.6585953, -1.929955, 3.264, 0.5137255, 0, 1, 1,
0.6604164, 1.463151, 1.461474, 0.5176471, 0, 1, 1,
0.6633173, 0.1821119, 0.5657513, 0.5254902, 0, 1, 1,
0.6713072, -0.2635412, 2.0422, 0.5294118, 0, 1, 1,
0.6734856, 1.212336, -0.1011521, 0.5372549, 0, 1, 1,
0.6822532, -0.06595173, 1.182168, 0.5411765, 0, 1, 1,
0.6867595, 0.6566994, 0.4369388, 0.5490196, 0, 1, 1,
0.6937463, 0.4032102, 1.454865, 0.5529412, 0, 1, 1,
0.6961157, 1.21635, -1.001321, 0.5607843, 0, 1, 1,
0.6975915, 0.2443978, 1.630749, 0.5647059, 0, 1, 1,
0.6991095, -0.646053, 3.140455, 0.572549, 0, 1, 1,
0.7024749, 1.442564, -0.1654688, 0.5764706, 0, 1, 1,
0.7062386, -0.4943453, 2.405508, 0.5843138, 0, 1, 1,
0.7091836, -0.1002103, 2.985273, 0.5882353, 0, 1, 1,
0.7194335, 0.4931991, 1.076065, 0.5960785, 0, 1, 1,
0.7204828, 0.9218432, 2.092551, 0.6039216, 0, 1, 1,
0.7213509, 0.9157708, 0.06760328, 0.6078432, 0, 1, 1,
0.7286748, -1.11305, 3.853562, 0.6156863, 0, 1, 1,
0.7299692, -0.02986818, 0.5435941, 0.6196079, 0, 1, 1,
0.7308078, 0.9643849, -0.6078553, 0.627451, 0, 1, 1,
0.7356265, 0.1924752, 2.808608, 0.6313726, 0, 1, 1,
0.7474144, -1.256727, 3.55214, 0.6392157, 0, 1, 1,
0.7512356, -0.48696, 0.7615184, 0.6431373, 0, 1, 1,
0.7527715, -1.268306, 3.042168, 0.6509804, 0, 1, 1,
0.7530875, -0.4629653, 1.331884, 0.654902, 0, 1, 1,
0.7545854, -0.1536102, 2.615042, 0.6627451, 0, 1, 1,
0.7573578, -1.140672, 1.786946, 0.6666667, 0, 1, 1,
0.7591432, 1.475325, -0.2794916, 0.6745098, 0, 1, 1,
0.7638258, 0.5066684, -0.05350647, 0.6784314, 0, 1, 1,
0.7641261, 0.4166662, 2.874626, 0.6862745, 0, 1, 1,
0.7667619, -0.3660117, 1.693579, 0.6901961, 0, 1, 1,
0.7748814, 1.146228, -0.3675092, 0.6980392, 0, 1, 1,
0.7916296, -0.5824175, 1.205528, 0.7058824, 0, 1, 1,
0.7935202, 1.059939, 0.4364749, 0.7098039, 0, 1, 1,
0.7952265, -0.7724708, 1.566104, 0.7176471, 0, 1, 1,
0.8022836, 1.376279, 1.66555, 0.7215686, 0, 1, 1,
0.8075674, 1.805807, -0.7635757, 0.7294118, 0, 1, 1,
0.8111095, 0.4169292, 1.487226, 0.7333333, 0, 1, 1,
0.8112872, -0.8828505, 1.420749, 0.7411765, 0, 1, 1,
0.8131045, 0.3519989, 1.459863, 0.7450981, 0, 1, 1,
0.8138521, 1.340072, -1.477424, 0.7529412, 0, 1, 1,
0.8148192, 0.5512167, 1.94075, 0.7568628, 0, 1, 1,
0.8244878, 0.9469307, 1.615282, 0.7647059, 0, 1, 1,
0.824729, 0.9287164, -0.1962927, 0.7686275, 0, 1, 1,
0.8269843, -0.4285703, 1.140844, 0.7764706, 0, 1, 1,
0.8376883, 0.5905635, -1.893656, 0.7803922, 0, 1, 1,
0.8424398, 0.9978552, 1.495795, 0.7882353, 0, 1, 1,
0.8536988, 0.6113797, 1.362287, 0.7921569, 0, 1, 1,
0.8552689, -0.7539259, 4.049682, 0.8, 0, 1, 1,
0.8559521, -0.9276378, 1.353927, 0.8078431, 0, 1, 1,
0.8589132, -0.4621367, -0.07454396, 0.8117647, 0, 1, 1,
0.861016, -1.539599, 1.997588, 0.8196079, 0, 1, 1,
0.867624, 0.4786829, 2.499815, 0.8235294, 0, 1, 1,
0.8680415, -0.05560835, 1.242994, 0.8313726, 0, 1, 1,
0.8682722, -0.9502416, 2.457135, 0.8352941, 0, 1, 1,
0.8703863, 0.3511251, 1.058313, 0.8431373, 0, 1, 1,
0.878161, 0.4236555, -0.541012, 0.8470588, 0, 1, 1,
0.8803353, 2.330237, 0.8611714, 0.854902, 0, 1, 1,
0.896134, 0.1311231, -0.1881154, 0.8588235, 0, 1, 1,
0.9008397, 0.5508243, 2.325587, 0.8666667, 0, 1, 1,
0.9050906, 0.704152, -0.8698274, 0.8705882, 0, 1, 1,
0.9089067, -0.8517019, 4.170893, 0.8784314, 0, 1, 1,
0.9135209, -1.332518, 2.183732, 0.8823529, 0, 1, 1,
0.9177382, 0.1674195, 1.838054, 0.8901961, 0, 1, 1,
0.9195747, -0.4919336, 3.388303, 0.8941177, 0, 1, 1,
0.925503, 0.1473423, 1.58932, 0.9019608, 0, 1, 1,
0.9287567, -0.04192959, -0.236516, 0.9098039, 0, 1, 1,
0.935318, -2.404793, 1.72218, 0.9137255, 0, 1, 1,
0.9408451, 0.04827474, 0.1601525, 0.9215686, 0, 1, 1,
0.9409893, 1.419303, 1.536255, 0.9254902, 0, 1, 1,
0.9497956, -0.2299809, 3.582924, 0.9333333, 0, 1, 1,
0.9520938, -0.2765393, 1.170041, 0.9372549, 0, 1, 1,
0.9520975, -0.6941807, 3.117242, 0.945098, 0, 1, 1,
0.9534013, 0.4143541, 0.9460485, 0.9490196, 0, 1, 1,
0.9634919, 1.067272, 0.0705144, 0.9568627, 0, 1, 1,
0.9657966, 0.8268686, 1.214868, 0.9607843, 0, 1, 1,
0.9673159, -0.2295987, 1.323255, 0.9686275, 0, 1, 1,
0.9675301, -0.8107944, 2.149987, 0.972549, 0, 1, 1,
0.972352, -1.235059, 3.286261, 0.9803922, 0, 1, 1,
0.9737569, 1.877189, 1.251205, 0.9843137, 0, 1, 1,
0.9782687, -1.052604, 2.94265, 0.9921569, 0, 1, 1,
0.9808897, 1.422483, -0.3833915, 0.9960784, 0, 1, 1,
0.9821116, 0.2074189, -0.7742001, 1, 0, 0.9960784, 1,
0.9914436, 0.4841422, 2.491455, 1, 0, 0.9882353, 1,
0.9941161, -0.4770155, 2.492135, 1, 0, 0.9843137, 1,
1.003346, 0.2716756, 1.823199, 1, 0, 0.9764706, 1,
1.008496, -1.821207, 3.003671, 1, 0, 0.972549, 1,
1.015318, 0.4951175, -0.6689202, 1, 0, 0.9647059, 1,
1.019897, 0.3235571, 1.252693, 1, 0, 0.9607843, 1,
1.020441, 0.4115321, 2.022515, 1, 0, 0.9529412, 1,
1.021185, -2.444216, 1.860404, 1, 0, 0.9490196, 1,
1.024089, -0.8062112, 0.1121415, 1, 0, 0.9411765, 1,
1.025373, -0.4905853, 3.114444, 1, 0, 0.9372549, 1,
1.030662, -0.04794693, 3.006842, 1, 0, 0.9294118, 1,
1.030786, 0.05459622, 1.296684, 1, 0, 0.9254902, 1,
1.031608, -1.900226, 2.766392, 1, 0, 0.9176471, 1,
1.033981, -0.1075711, 0.861447, 1, 0, 0.9137255, 1,
1.03437, 0.2643645, 1.793472, 1, 0, 0.9058824, 1,
1.045113, 0.01001002, 0.5048427, 1, 0, 0.9019608, 1,
1.0486, 0.07972983, 1.83304, 1, 0, 0.8941177, 1,
1.049305, 0.6022915, 1.210231, 1, 0, 0.8862745, 1,
1.054649, -0.1259157, 0.7215223, 1, 0, 0.8823529, 1,
1.055272, -0.1726862, 1.878694, 1, 0, 0.8745098, 1,
1.058467, -0.4891801, 1.4603, 1, 0, 0.8705882, 1,
1.076889, 0.1519323, -0.02705892, 1, 0, 0.8627451, 1,
1.07702, 0.9525478, 0.7993596, 1, 0, 0.8588235, 1,
1.081441, -1.389733, 2.743317, 1, 0, 0.8509804, 1,
1.084476, -0.4124663, 1.168028, 1, 0, 0.8470588, 1,
1.095904, 0.3248074, 1.742405, 1, 0, 0.8392157, 1,
1.127037, -0.4994725, 1.656933, 1, 0, 0.8352941, 1,
1.132848, -0.2717133, 2.218742, 1, 0, 0.827451, 1,
1.13858, 0.2663473, 1.649086, 1, 0, 0.8235294, 1,
1.143463, 1.911471, 0.4309754, 1, 0, 0.8156863, 1,
1.144117, -1.347333, 3.188591, 1, 0, 0.8117647, 1,
1.14683, -0.3052243, 1.916689, 1, 0, 0.8039216, 1,
1.153737, -1.361119, 4.014274, 1, 0, 0.7960784, 1,
1.160389, -1.703383, 3.761693, 1, 0, 0.7921569, 1,
1.160836, 2.677668, -0.7279981, 1, 0, 0.7843137, 1,
1.161987, -1.221806, 2.707141, 1, 0, 0.7803922, 1,
1.16317, 0.4403818, 0.954866, 1, 0, 0.772549, 1,
1.164459, 0.157258, 1.327155, 1, 0, 0.7686275, 1,
1.16779, 0.1511435, 0.02526025, 1, 0, 0.7607843, 1,
1.175246, 1.087871, 1.000608, 1, 0, 0.7568628, 1,
1.179025, -0.7999445, 3.809451, 1, 0, 0.7490196, 1,
1.1792, 1.16173, 2.26727, 1, 0, 0.7450981, 1,
1.189344, 1.141452, 1.773511, 1, 0, 0.7372549, 1,
1.197646, -0.4851302, 2.426467, 1, 0, 0.7333333, 1,
1.197955, -0.3664339, 3.057414, 1, 0, 0.7254902, 1,
1.2009, 0.3265095, 2.134489, 1, 0, 0.7215686, 1,
1.202812, 0.2842222, 2.112943, 1, 0, 0.7137255, 1,
1.204091, 2.160591, 0.2793035, 1, 0, 0.7098039, 1,
1.215047, -0.2410597, 2.828904, 1, 0, 0.7019608, 1,
1.219632, -1.203347, 1.00767, 1, 0, 0.6941177, 1,
1.22189, -0.3846972, 2.947208, 1, 0, 0.6901961, 1,
1.223756, 0.002221873, 1.32676, 1, 0, 0.682353, 1,
1.224618, -0.1989657, 2.555785, 1, 0, 0.6784314, 1,
1.225034, 1.078908, 1.019316, 1, 0, 0.6705883, 1,
1.225947, -0.7799917, 2.294855, 1, 0, 0.6666667, 1,
1.22824, -2.531391, 0.4321094, 1, 0, 0.6588235, 1,
1.231054, 0.702941, 1.042197, 1, 0, 0.654902, 1,
1.240027, -0.2322316, 2.01119, 1, 0, 0.6470588, 1,
1.243528, -0.5079608, 2.339262, 1, 0, 0.6431373, 1,
1.246796, -0.7527004, 2.82787, 1, 0, 0.6352941, 1,
1.247214, -0.2618017, 2.102186, 1, 0, 0.6313726, 1,
1.267055, 0.06493112, 1.902448, 1, 0, 0.6235294, 1,
1.267191, 0.9415792, -0.1330218, 1, 0, 0.6196079, 1,
1.268911, -0.03522832, 1.670585, 1, 0, 0.6117647, 1,
1.277236, -1.838462, 2.265814, 1, 0, 0.6078432, 1,
1.279441, -0.1188935, 1.016971, 1, 0, 0.6, 1,
1.284915, -0.238415, 5.083718, 1, 0, 0.5921569, 1,
1.285872, -0.5133074, 0.5549369, 1, 0, 0.5882353, 1,
1.289588, 0.04816798, 1.960348, 1, 0, 0.5803922, 1,
1.295724, 0.7819142, -0.1411468, 1, 0, 0.5764706, 1,
1.298592, 0.06243387, 0.9186298, 1, 0, 0.5686275, 1,
1.300986, -0.1652329, 1.29755, 1, 0, 0.5647059, 1,
1.303421, 0.3378486, 1.83425, 1, 0, 0.5568628, 1,
1.313112, -0.2638476, 2.777142, 1, 0, 0.5529412, 1,
1.321815, -0.5495189, 2.021374, 1, 0, 0.5450981, 1,
1.323675, -1.091576, 2.223481, 1, 0, 0.5411765, 1,
1.325323, 0.6320361, 2.308416, 1, 0, 0.5333334, 1,
1.352121, -0.04352651, 1.46621, 1, 0, 0.5294118, 1,
1.355599, 0.4009067, 0.4572263, 1, 0, 0.5215687, 1,
1.356744, 0.4390767, 1.055242, 1, 0, 0.5176471, 1,
1.359167, 0.3579701, 0.3580283, 1, 0, 0.509804, 1,
1.370677, 0.7611554, 1.310503, 1, 0, 0.5058824, 1,
1.383816, 0.7156591, 1.447484, 1, 0, 0.4980392, 1,
1.399556, 1.593103, -0.2490507, 1, 0, 0.4901961, 1,
1.405831, 0.2245014, 1.59486, 1, 0, 0.4862745, 1,
1.409972, -0.4768294, 1.579895, 1, 0, 0.4784314, 1,
1.413767, 0.7531505, 2.340898, 1, 0, 0.4745098, 1,
1.414559, 0.3054674, 1.567025, 1, 0, 0.4666667, 1,
1.417906, 1.052554, 0.8256876, 1, 0, 0.4627451, 1,
1.4206, 0.1079499, 0.9162815, 1, 0, 0.454902, 1,
1.423968, 1.343414, 2.005831, 1, 0, 0.4509804, 1,
1.426989, -0.08262002, 1.350371, 1, 0, 0.4431373, 1,
1.427813, 0.75189, 0.9175326, 1, 0, 0.4392157, 1,
1.442659, -1.161272, 1.284876, 1, 0, 0.4313726, 1,
1.442937, 1.483142, 0.5350107, 1, 0, 0.427451, 1,
1.447767, -0.2563277, 0.7199025, 1, 0, 0.4196078, 1,
1.448911, -1.057966, 2.083311, 1, 0, 0.4156863, 1,
1.449431, 3.49309, -0.5288795, 1, 0, 0.4078431, 1,
1.450226, 1.250612, 1.250995, 1, 0, 0.4039216, 1,
1.486696, 0.2949967, 1.079791, 1, 0, 0.3960784, 1,
1.499789, 1.048483, -0.2021088, 1, 0, 0.3882353, 1,
1.509549, 0.567152, 1.515847, 1, 0, 0.3843137, 1,
1.517451, -0.7141086, 1.607219, 1, 0, 0.3764706, 1,
1.521678, 1.273025, 0.9478692, 1, 0, 0.372549, 1,
1.532425, -0.9457577, 1.622338, 1, 0, 0.3647059, 1,
1.540576, 0.1498771, 1.827373, 1, 0, 0.3607843, 1,
1.548333, -1.642468, 1.262372, 1, 0, 0.3529412, 1,
1.563967, -1.241045, 2.044607, 1, 0, 0.3490196, 1,
1.571135, 0.1707059, 2.874547, 1, 0, 0.3411765, 1,
1.576037, -0.9879659, 1.454948, 1, 0, 0.3372549, 1,
1.57951, -1.563196, 2.416373, 1, 0, 0.3294118, 1,
1.585606, 0.1353604, 1.161194, 1, 0, 0.3254902, 1,
1.604535, -0.3061114, 3.27951, 1, 0, 0.3176471, 1,
1.604824, -0.9179459, 2.849289, 1, 0, 0.3137255, 1,
1.627085, -0.5937371, 1.40155, 1, 0, 0.3058824, 1,
1.639272, 1.829448, 0.6182418, 1, 0, 0.2980392, 1,
1.658682, 0.702022, 1.109161, 1, 0, 0.2941177, 1,
1.69892, 0.29258, 2.730187, 1, 0, 0.2862745, 1,
1.726133, -0.1725891, 0.6192504, 1, 0, 0.282353, 1,
1.742789, -1.029322, 1.022966, 1, 0, 0.2745098, 1,
1.747643, -0.1197919, 2.109292, 1, 0, 0.2705882, 1,
1.750639, -0.9896407, 3.287667, 1, 0, 0.2627451, 1,
1.750918, -1.060599, 3.031725, 1, 0, 0.2588235, 1,
1.782754, 0.6172826, 3.132481, 1, 0, 0.2509804, 1,
1.789519, 0.5979757, 0.6249371, 1, 0, 0.2470588, 1,
1.791825, 1.192751, 0.8201379, 1, 0, 0.2392157, 1,
1.803689, 0.1305971, 1.373558, 1, 0, 0.2352941, 1,
1.853577, 0.5285382, 2.64236, 1, 0, 0.227451, 1,
1.853582, -0.004631437, 3.084153, 1, 0, 0.2235294, 1,
1.859115, 0.07341567, 1.950064, 1, 0, 0.2156863, 1,
1.861837, 1.426571, 1.986701, 1, 0, 0.2117647, 1,
1.868242, 1.858725, 0.3235353, 1, 0, 0.2039216, 1,
1.876635, -0.9004007, 1.4692, 1, 0, 0.1960784, 1,
1.885519, 1.463624, 0.8337951, 1, 0, 0.1921569, 1,
1.888727, 0.323289, -0.06927196, 1, 0, 0.1843137, 1,
1.8998, -0.06212486, 1.89034, 1, 0, 0.1803922, 1,
1.92384, 0.8681282, -0.2523323, 1, 0, 0.172549, 1,
1.997977, 0.8607633, -1.833933, 1, 0, 0.1686275, 1,
1.999048, -0.172692, 2.482748, 1, 0, 0.1607843, 1,
2.002132, -0.5053039, 2.098117, 1, 0, 0.1568628, 1,
2.059391, 0.197491, 1.077095, 1, 0, 0.1490196, 1,
2.092268, 0.05180705, 1.157838, 1, 0, 0.145098, 1,
2.095432, 1.655511, 0.3896418, 1, 0, 0.1372549, 1,
2.150082, 1.284657, 3.535601, 1, 0, 0.1333333, 1,
2.177527, 0.3747889, 1.361454, 1, 0, 0.1254902, 1,
2.190931, -1.11168, 3.166175, 1, 0, 0.1215686, 1,
2.205308, -0.780857, 2.270426, 1, 0, 0.1137255, 1,
2.225542, 0.9627095, -0.1437906, 1, 0, 0.1098039, 1,
2.231615, -0.8161642, 1.527756, 1, 0, 0.1019608, 1,
2.284845, 1.375648, 0.8139906, 1, 0, 0.09411765, 1,
2.286381, 1.301757, 0.4173523, 1, 0, 0.09019608, 1,
2.334837, 0.8991944, 1.107474, 1, 0, 0.08235294, 1,
2.411078, 0.09942443, 2.24705, 1, 0, 0.07843138, 1,
2.51584, 0.04093041, 2.024025, 1, 0, 0.07058824, 1,
2.534505, -0.4220463, 1.827888, 1, 0, 0.06666667, 1,
2.548904, -0.2648329, 2.15931, 1, 0, 0.05882353, 1,
2.564736, 0.2228345, 2.688655, 1, 0, 0.05490196, 1,
2.598722, -2.306225, 3.576691, 1, 0, 0.04705882, 1,
2.743448, 0.6877459, 0.6462008, 1, 0, 0.04313726, 1,
2.786137, -1.042762, 2.493727, 1, 0, 0.03529412, 1,
2.803185, -1.075648, 3.399156, 1, 0, 0.03137255, 1,
2.869012, 1.128937, 1.096293, 1, 0, 0.02352941, 1,
3.162419, -0.1240553, 1.490969, 1, 0, 0.01960784, 1,
3.35639, 0.9095841, 0.3428341, 1, 0, 0.01176471, 1,
3.838179, 0.5839781, 2.299259, 1, 0, 0.007843138, 1
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
0.506243, -4.119138, -6.80462, 0, -0.5, 0.5, 0.5,
0.506243, -4.119138, -6.80462, 1, -0.5, 0.5, 0.5,
0.506243, -4.119138, -6.80462, 1, 1.5, 0.5, 0.5,
0.506243, -4.119138, -6.80462, 0, 1.5, 0.5, 0.5
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
-3.955219, 0.2386104, -6.80462, 0, -0.5, 0.5, 0.5,
-3.955219, 0.2386104, -6.80462, 1, -0.5, 0.5, 0.5,
-3.955219, 0.2386104, -6.80462, 1, 1.5, 0.5, 0.5,
-3.955219, 0.2386104, -6.80462, 0, 1.5, 0.5, 0.5
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
-3.955219, -4.119138, 0.1596723, 0, -0.5, 0.5, 0.5,
-3.955219, -4.119138, 0.1596723, 1, -0.5, 0.5, 0.5,
-3.955219, -4.119138, 0.1596723, 1, 1.5, 0.5, 0.5,
-3.955219, -4.119138, 0.1596723, 0, 1.5, 0.5, 0.5
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
-2, -3.113503, -5.197476,
3, -3.113503, -5.197476,
-2, -3.113503, -5.197476,
-2, -3.281109, -5.465333,
-1, -3.113503, -5.197476,
-1, -3.281109, -5.465333,
0, -3.113503, -5.197476,
0, -3.281109, -5.465333,
1, -3.113503, -5.197476,
1, -3.281109, -5.465333,
2, -3.113503, -5.197476,
2, -3.281109, -5.465333,
3, -3.113503, -5.197476,
3, -3.281109, -5.465333
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
-2, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
-2, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
-2, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
-2, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5,
-1, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
-1, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
-1, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
-1, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5,
0, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
0, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
0, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
0, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5,
1, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
1, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
1, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
1, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5,
2, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
2, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
2, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
2, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5,
3, -3.616321, -6.001048, 0, -0.5, 0.5, 0.5,
3, -3.616321, -6.001048, 1, -0.5, 0.5, 0.5,
3, -3.616321, -6.001048, 1, 1.5, 0.5, 0.5,
3, -3.616321, -6.001048, 0, 1.5, 0.5, 0.5
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
-2.925651, -3, -5.197476,
-2.925651, 3, -5.197476,
-2.925651, -3, -5.197476,
-3.097246, -3, -5.465333,
-2.925651, -2, -5.197476,
-3.097246, -2, -5.465333,
-2.925651, -1, -5.197476,
-3.097246, -1, -5.465333,
-2.925651, 0, -5.197476,
-3.097246, 0, -5.465333,
-2.925651, 1, -5.197476,
-3.097246, 1, -5.465333,
-2.925651, 2, -5.197476,
-3.097246, 2, -5.465333,
-2.925651, 3, -5.197476,
-3.097246, 3, -5.465333
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
-3.440435, -3, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, -3, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, -3, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, -3, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, -2, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, -2, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, -2, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, -2, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, -1, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, -1, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, -1, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, -1, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, 0, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, 0, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, 0, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, 0, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, 1, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, 1, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, 1, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, 1, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, 2, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, 2, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, 2, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, 2, -6.001048, 0, 1.5, 0.5, 0.5,
-3.440435, 3, -6.001048, 0, -0.5, 0.5, 0.5,
-3.440435, 3, -6.001048, 1, -0.5, 0.5, 0.5,
-3.440435, 3, -6.001048, 1, 1.5, 0.5, 0.5,
-3.440435, 3, -6.001048, 0, 1.5, 0.5, 0.5
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
-2.925651, -3.113503, -4,
-2.925651, -3.113503, 4,
-2.925651, -3.113503, -4,
-3.097246, -3.281109, -4,
-2.925651, -3.113503, -2,
-3.097246, -3.281109, -2,
-2.925651, -3.113503, 0,
-3.097246, -3.281109, 0,
-2.925651, -3.113503, 2,
-3.097246, -3.281109, 2,
-2.925651, -3.113503, 4,
-3.097246, -3.281109, 4
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
-3.440435, -3.616321, -4, 0, -0.5, 0.5, 0.5,
-3.440435, -3.616321, -4, 1, -0.5, 0.5, 0.5,
-3.440435, -3.616321, -4, 1, 1.5, 0.5, 0.5,
-3.440435, -3.616321, -4, 0, 1.5, 0.5, 0.5,
-3.440435, -3.616321, -2, 0, -0.5, 0.5, 0.5,
-3.440435, -3.616321, -2, 1, -0.5, 0.5, 0.5,
-3.440435, -3.616321, -2, 1, 1.5, 0.5, 0.5,
-3.440435, -3.616321, -2, 0, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 0, 0, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 0, 1, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 0, 1, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 0, 0, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 2, 0, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 2, 1, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 2, 1, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 2, 0, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 4, 0, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 4, 1, -0.5, 0.5, 0.5,
-3.440435, -3.616321, 4, 1, 1.5, 0.5, 0.5,
-3.440435, -3.616321, 4, 0, 1.5, 0.5, 0.5
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
-2.925651, -3.113503, -5.197476,
-2.925651, 3.590724, -5.197476,
-2.925651, -3.113503, 5.51682,
-2.925651, 3.590724, 5.51682,
-2.925651, -3.113503, -5.197476,
-2.925651, -3.113503, 5.51682,
-2.925651, 3.590724, -5.197476,
-2.925651, 3.590724, 5.51682,
-2.925651, -3.113503, -5.197476,
3.938137, -3.113503, -5.197476,
-2.925651, -3.113503, 5.51682,
3.938137, -3.113503, 5.51682,
-2.925651, 3.590724, -5.197476,
3.938137, 3.590724, -5.197476,
-2.925651, 3.590724, 5.51682,
3.938137, 3.590724, 5.51682,
3.938137, -3.113503, -5.197476,
3.938137, 3.590724, -5.197476,
3.938137, -3.113503, 5.51682,
3.938137, 3.590724, 5.51682,
3.938137, -3.113503, -5.197476,
3.938137, -3.113503, 5.51682,
3.938137, 3.590724, -5.197476,
3.938137, 3.590724, 5.51682
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
var radius = 7.67994;
var distance = 34.16892;
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
mvMatrix.translate( -0.506243, -0.2386104, -0.1596723 );
mvMatrix.scale( 1.209784, 1.238577, 0.7750114 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16892);
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


