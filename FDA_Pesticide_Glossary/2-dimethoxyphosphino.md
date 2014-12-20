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
-3.727939, -0.4738879, -1.126441, 1, 0, 0, 1,
-3.192573, 0.6223848, -1.540343, 1, 0.007843138, 0, 1,
-3.120689, -1.768347, -0.9826393, 1, 0.01176471, 0, 1,
-3.047087, 0.2162345, -1.233921, 1, 0.01960784, 0, 1,
-2.940348, -1.790718, -0.9562137, 1, 0.02352941, 0, 1,
-2.692188, 0.7120467, -1.984679, 1, 0.03137255, 0, 1,
-2.689346, -0.3958996, -3.533157, 1, 0.03529412, 0, 1,
-2.666471, -0.4464442, -1.738411, 1, 0.04313726, 0, 1,
-2.577289, -0.7417905, -4.183382, 1, 0.04705882, 0, 1,
-2.560322, 1.259579, -0.8073194, 1, 0.05490196, 0, 1,
-2.511375, -0.3764012, -1.218541, 1, 0.05882353, 0, 1,
-2.456781, 0.5795015, 0.9610893, 1, 0.06666667, 0, 1,
-2.449858, -0.05636245, -1.696754, 1, 0.07058824, 0, 1,
-2.411855, -0.8893524, -2.575863, 1, 0.07843138, 0, 1,
-2.366853, -0.1122031, -1.268968, 1, 0.08235294, 0, 1,
-2.300436, 0.2670207, -2.771059, 1, 0.09019608, 0, 1,
-2.293502, -1.935532, -1.571834, 1, 0.09411765, 0, 1,
-2.288074, 0.9389734, -0.03775027, 1, 0.1019608, 0, 1,
-2.252148, 0.6470588, -1.462723, 1, 0.1098039, 0, 1,
-2.214808, 0.7833142, -1.729163, 1, 0.1137255, 0, 1,
-2.140916, 0.5154228, -0.5507827, 1, 0.1215686, 0, 1,
-2.123976, -1.148138, -2.557501, 1, 0.1254902, 0, 1,
-2.092879, -0.9298306, -2.049234, 1, 0.1333333, 0, 1,
-2.071827, 0.5237048, -1.10103, 1, 0.1372549, 0, 1,
-2.06521, 1.880753, 0.4909779, 1, 0.145098, 0, 1,
-2.063224, 1.695689, 1.212715, 1, 0.1490196, 0, 1,
-2.043368, 0.8536834, -0.004420513, 1, 0.1568628, 0, 1,
-2.032636, -2.931578, -2.284357, 1, 0.1607843, 0, 1,
-2.023318, -0.5774165, -0.8959465, 1, 0.1686275, 0, 1,
-2.01944, -0.9219934, -2.918599, 1, 0.172549, 0, 1,
-1.928891, 0.4712277, -0.5744963, 1, 0.1803922, 0, 1,
-1.924063, 0.1702241, -0.3105558, 1, 0.1843137, 0, 1,
-1.915497, 0.6021867, -0.8160277, 1, 0.1921569, 0, 1,
-1.903701, -0.8618074, -2.567339, 1, 0.1960784, 0, 1,
-1.878579, 0.1210614, -2.145578, 1, 0.2039216, 0, 1,
-1.878268, 0.05894673, -1.552768, 1, 0.2117647, 0, 1,
-1.876043, 1.606436, -2.805794, 1, 0.2156863, 0, 1,
-1.870982, 0.999361, -2.036601, 1, 0.2235294, 0, 1,
-1.856888, -0.4244027, -2.302395, 1, 0.227451, 0, 1,
-1.845763, 0.506254, -2.75688, 1, 0.2352941, 0, 1,
-1.82589, -0.4654489, -2.218163, 1, 0.2392157, 0, 1,
-1.809328, 1.595236, -0.4709854, 1, 0.2470588, 0, 1,
-1.80691, 0.9421052, -2.283303, 1, 0.2509804, 0, 1,
-1.768291, 2.242777, 0.2818858, 1, 0.2588235, 0, 1,
-1.763999, -1.171372, -3.344136, 1, 0.2627451, 0, 1,
-1.763411, 0.6237143, -0.7505931, 1, 0.2705882, 0, 1,
-1.754069, 0.03898141, -1.632509, 1, 0.2745098, 0, 1,
-1.745652, -1.168216, -3.250411, 1, 0.282353, 0, 1,
-1.7245, 1.231187, -1.246284, 1, 0.2862745, 0, 1,
-1.718712, -1.217374, -2.721093, 1, 0.2941177, 0, 1,
-1.708681, 0.6003127, -0.6324732, 1, 0.3019608, 0, 1,
-1.698399, -0.03713028, -3.0184, 1, 0.3058824, 0, 1,
-1.685, -0.3558994, -2.067437, 1, 0.3137255, 0, 1,
-1.683693, -1.34999, -2.122746, 1, 0.3176471, 0, 1,
-1.681451, 0.02249195, -2.701437, 1, 0.3254902, 0, 1,
-1.676721, -0.7301207, -1.177508, 1, 0.3294118, 0, 1,
-1.673237, -0.3748853, -1.118889, 1, 0.3372549, 0, 1,
-1.673113, 1.115918, 0.06026372, 1, 0.3411765, 0, 1,
-1.668201, 0.1201034, -0.582337, 1, 0.3490196, 0, 1,
-1.659899, -0.4626538, -2.689096, 1, 0.3529412, 0, 1,
-1.652822, 0.5569043, -3.814005, 1, 0.3607843, 0, 1,
-1.648909, -2.295856, -3.70147, 1, 0.3647059, 0, 1,
-1.636217, -1.528874, -3.724801, 1, 0.372549, 0, 1,
-1.618398, 1.396963, 0.5455509, 1, 0.3764706, 0, 1,
-1.577479, 0.8020476, -0.1789595, 1, 0.3843137, 0, 1,
-1.574583, -1.181369, -2.232415, 1, 0.3882353, 0, 1,
-1.568794, -0.2522201, -0.8550115, 1, 0.3960784, 0, 1,
-1.557232, 0.9035263, 0.04354255, 1, 0.4039216, 0, 1,
-1.552867, 0.7333216, -0.3296153, 1, 0.4078431, 0, 1,
-1.548215, 1.485355, -0.7744538, 1, 0.4156863, 0, 1,
-1.547773, -0.08752681, -1.193691, 1, 0.4196078, 0, 1,
-1.544723, -1.751931, -5.615748, 1, 0.427451, 0, 1,
-1.539012, 0.3661276, -0.594555, 1, 0.4313726, 0, 1,
-1.536822, -0.331523, -0.4194109, 1, 0.4392157, 0, 1,
-1.529849, -0.2829623, -4.388204, 1, 0.4431373, 0, 1,
-1.510366, 1.473691, 0.1618668, 1, 0.4509804, 0, 1,
-1.504528, -0.1573662, -2.100719, 1, 0.454902, 0, 1,
-1.497279, -0.8004507, -2.969203, 1, 0.4627451, 0, 1,
-1.496643, 2.387944, 0.4081098, 1, 0.4666667, 0, 1,
-1.49249, -0.7576491, -1.238706, 1, 0.4745098, 0, 1,
-1.481459, -0.2151699, -3.042798, 1, 0.4784314, 0, 1,
-1.470922, 0.1451439, -2.089383, 1, 0.4862745, 0, 1,
-1.463066, -0.8721859, -1.693774, 1, 0.4901961, 0, 1,
-1.451437, -0.8252815, -1.578977, 1, 0.4980392, 0, 1,
-1.450894, 1.191347, -0.9127167, 1, 0.5058824, 0, 1,
-1.434462, -0.503103, -0.5224282, 1, 0.509804, 0, 1,
-1.430334, 0.4469894, -1.133087, 1, 0.5176471, 0, 1,
-1.427098, 0.8016297, 0.03657807, 1, 0.5215687, 0, 1,
-1.422786, 0.5816424, -0.3578281, 1, 0.5294118, 0, 1,
-1.418347, -0.7565553, -2.096021, 1, 0.5333334, 0, 1,
-1.412487, -0.1802644, -2.736833, 1, 0.5411765, 0, 1,
-1.41207, 1.6808, -3.047006, 1, 0.5450981, 0, 1,
-1.407946, -1.965113, -1.827197, 1, 0.5529412, 0, 1,
-1.399215, 1.017279, -0.5806267, 1, 0.5568628, 0, 1,
-1.387054, -0.01158981, -2.669817, 1, 0.5647059, 0, 1,
-1.384706, 1.508111, -0.02092907, 1, 0.5686275, 0, 1,
-1.384647, -0.47265, -0.9291329, 1, 0.5764706, 0, 1,
-1.382748, 1.254861, -0.1622429, 1, 0.5803922, 0, 1,
-1.380695, 1.138503, -1.059435, 1, 0.5882353, 0, 1,
-1.369276, 0.01362581, -2.507696, 1, 0.5921569, 0, 1,
-1.35849, 0.7840672, -1.723251, 1, 0.6, 0, 1,
-1.356105, 0.03012258, -1.703995, 1, 0.6078432, 0, 1,
-1.355461, 1.758421, 0.9160479, 1, 0.6117647, 0, 1,
-1.35183, 1.185998, -0.7583454, 1, 0.6196079, 0, 1,
-1.348347, -0.04086179, -1.483185, 1, 0.6235294, 0, 1,
-1.347046, 0.5798045, -0.276937, 1, 0.6313726, 0, 1,
-1.342887, 0.3081708, -0.6423012, 1, 0.6352941, 0, 1,
-1.342282, -0.3900908, -2.478328, 1, 0.6431373, 0, 1,
-1.338595, -1.960461, -2.912211, 1, 0.6470588, 0, 1,
-1.336219, 0.3922528, 0.1456835, 1, 0.654902, 0, 1,
-1.329482, 0.08101263, -0.8444511, 1, 0.6588235, 0, 1,
-1.32287, -0.7327454, -0.5679671, 1, 0.6666667, 0, 1,
-1.316928, 0.2501548, -3.145526, 1, 0.6705883, 0, 1,
-1.306449, 0.2770928, -0.2236, 1, 0.6784314, 0, 1,
-1.296928, 0.3070977, -1.101187, 1, 0.682353, 0, 1,
-1.295715, -1.446096, -1.896949, 1, 0.6901961, 0, 1,
-1.282742, -0.8171667, -3.833922, 1, 0.6941177, 0, 1,
-1.279178, -0.7182031, -1.015213, 1, 0.7019608, 0, 1,
-1.278573, -0.04393705, -1.59834, 1, 0.7098039, 0, 1,
-1.273654, -0.6260862, -3.371777, 1, 0.7137255, 0, 1,
-1.26226, -0.7685398, -1.955227, 1, 0.7215686, 0, 1,
-1.260332, -0.01104254, -3.017027, 1, 0.7254902, 0, 1,
-1.244941, -1.255004, -2.568672, 1, 0.7333333, 0, 1,
-1.23189, 2.124141, -1.356694, 1, 0.7372549, 0, 1,
-1.231475, -0.09046986, -1.133959, 1, 0.7450981, 0, 1,
-1.225728, -0.1250511, -2.498591, 1, 0.7490196, 0, 1,
-1.214632, 2.496037, -0.3094994, 1, 0.7568628, 0, 1,
-1.210215, 0.4213951, -3.649106, 1, 0.7607843, 0, 1,
-1.201032, 1.473208, -1.401049, 1, 0.7686275, 0, 1,
-1.200863, 2.366457, -1.607774, 1, 0.772549, 0, 1,
-1.197812, 0.7252664, -0.4683003, 1, 0.7803922, 0, 1,
-1.191521, -0.0927914, -0.3917047, 1, 0.7843137, 0, 1,
-1.189912, -0.03891456, 0.1126651, 1, 0.7921569, 0, 1,
-1.183844, 0.8333095, -0.9190452, 1, 0.7960784, 0, 1,
-1.182646, -0.3431364, -0.4368211, 1, 0.8039216, 0, 1,
-1.18116, 0.005994514, -2.672996, 1, 0.8117647, 0, 1,
-1.178401, -1.086383, -2.678738, 1, 0.8156863, 0, 1,
-1.174153, 1.938303, 2.166097, 1, 0.8235294, 0, 1,
-1.168318, 1.703439, 0.1148663, 1, 0.827451, 0, 1,
-1.157218, 0.9123626, -1.09407, 1, 0.8352941, 0, 1,
-1.156053, -0.06883775, -0.6547667, 1, 0.8392157, 0, 1,
-1.15549, 0.1334602, -2.453998, 1, 0.8470588, 0, 1,
-1.152664, 0.6441401, -1.729833, 1, 0.8509804, 0, 1,
-1.147508, 0.6723157, 0.09560301, 1, 0.8588235, 0, 1,
-1.146724, -0.3298283, -2.529673, 1, 0.8627451, 0, 1,
-1.139508, -0.4947401, -1.950149, 1, 0.8705882, 0, 1,
-1.139467, 0.7189335, -0.5089165, 1, 0.8745098, 0, 1,
-1.136115, -0.2597853, -3.878917, 1, 0.8823529, 0, 1,
-1.134207, -0.0837179, -2.730214, 1, 0.8862745, 0, 1,
-1.129456, -0.6337371, -1.527098, 1, 0.8941177, 0, 1,
-1.120261, 1.478255, -1.133636, 1, 0.8980392, 0, 1,
-1.119092, -0.1939905, -0.5341607, 1, 0.9058824, 0, 1,
-1.118481, 0.2720385, -3.03053, 1, 0.9137255, 0, 1,
-1.115866, -0.9813839, -1.717051, 1, 0.9176471, 0, 1,
-1.113604, -0.1205963, -2.060739, 1, 0.9254902, 0, 1,
-1.108456, 0.683176, 1.045904, 1, 0.9294118, 0, 1,
-1.102014, 1.544656, -1.790476, 1, 0.9372549, 0, 1,
-1.101915, -0.6414731, -3.214204, 1, 0.9411765, 0, 1,
-1.091218, 2.499256, -2.922346, 1, 0.9490196, 0, 1,
-1.09079, -1.392632, -3.640318, 1, 0.9529412, 0, 1,
-1.078243, 0.5826561, -1.761149, 1, 0.9607843, 0, 1,
-1.074269, 0.4134428, -2.703307, 1, 0.9647059, 0, 1,
-1.069167, 1.843909, 1.267278, 1, 0.972549, 0, 1,
-1.053102, 1.304542, -0.9771036, 1, 0.9764706, 0, 1,
-1.051648, -1.137176, -0.8155941, 1, 0.9843137, 0, 1,
-1.043934, 0.6263525, -0.6226451, 1, 0.9882353, 0, 1,
-1.041264, -0.003472532, -3.190954, 1, 0.9960784, 0, 1,
-1.039316, 1.566123, 0.525444, 0.9960784, 1, 0, 1,
-1.038132, 1.108675, -0.2508183, 0.9921569, 1, 0, 1,
-1.033617, 0.8608122, -0.4245737, 0.9843137, 1, 0, 1,
-1.026449, 0.4451399, 0.04148741, 0.9803922, 1, 0, 1,
-1.013486, -0.699338, -3.723656, 0.972549, 1, 0, 1,
-1.012715, -0.5941767, -0.875065, 0.9686275, 1, 0, 1,
-1.008262, 2.027396, -0.4857339, 0.9607843, 1, 0, 1,
-1.004147, 1.194706, -0.4089539, 0.9568627, 1, 0, 1,
-1.002568, -1.268298, -2.717841, 0.9490196, 1, 0, 1,
-1.002193, -0.4476695, 0.9313959, 0.945098, 1, 0, 1,
-0.9947546, 0.2664248, -2.17913, 0.9372549, 1, 0, 1,
-0.9809623, -1.125682, -4.03072, 0.9333333, 1, 0, 1,
-0.9771702, -0.6749099, -2.234027, 0.9254902, 1, 0, 1,
-0.9656078, -1.203954, -4.450946, 0.9215686, 1, 0, 1,
-0.96403, 1.59225, -1.806178, 0.9137255, 1, 0, 1,
-0.9623887, 0.04387705, -0.5267465, 0.9098039, 1, 0, 1,
-0.9476452, -0.09368609, -1.132794, 0.9019608, 1, 0, 1,
-0.9460194, 0.4786864, -1.146661, 0.8941177, 1, 0, 1,
-0.9424998, -0.610982, -4.025732, 0.8901961, 1, 0, 1,
-0.9420965, 0.628186, 0.09571773, 0.8823529, 1, 0, 1,
-0.9415262, -1.287869, -3.25755, 0.8784314, 1, 0, 1,
-0.93026, -0.9547016, -2.337424, 0.8705882, 1, 0, 1,
-0.9278818, -1.116898, -1.227044, 0.8666667, 1, 0, 1,
-0.9252095, -0.6246781, -2.242604, 0.8588235, 1, 0, 1,
-0.9214026, 0.3650338, -2.341298, 0.854902, 1, 0, 1,
-0.9138777, 1.231579, -1.256924, 0.8470588, 1, 0, 1,
-0.9079599, 0.8724898, 2.832114, 0.8431373, 1, 0, 1,
-0.9077202, -1.587795, -2.395711, 0.8352941, 1, 0, 1,
-0.8996117, -0.2503448, -1.866782, 0.8313726, 1, 0, 1,
-0.8969972, 0.02700762, -1.301534, 0.8235294, 1, 0, 1,
-0.8965707, 0.7119198, -0.4066788, 0.8196079, 1, 0, 1,
-0.8876029, -0.6240953, -3.018161, 0.8117647, 1, 0, 1,
-0.8816325, -1.197436, -1.469324, 0.8078431, 1, 0, 1,
-0.875414, 1.692028, 0.2948583, 0.8, 1, 0, 1,
-0.8731695, -0.6881773, -2.116856, 0.7921569, 1, 0, 1,
-0.8609239, -1.208827, -2.916575, 0.7882353, 1, 0, 1,
-0.8506172, -0.2300462, -0.4878195, 0.7803922, 1, 0, 1,
-0.8462659, -0.529424, -3.6338, 0.7764706, 1, 0, 1,
-0.8366079, 0.01648691, -0.9072213, 0.7686275, 1, 0, 1,
-0.8345543, -0.3014401, -0.5656733, 0.7647059, 1, 0, 1,
-0.8209209, 0.5558321, -0.6655836, 0.7568628, 1, 0, 1,
-0.8206913, -0.7131628, -4.179634, 0.7529412, 1, 0, 1,
-0.814763, -1.818394, -3.788679, 0.7450981, 1, 0, 1,
-0.7870533, 0.219964, -0.9518891, 0.7411765, 1, 0, 1,
-0.7772226, 0.8244768, 0.003232936, 0.7333333, 1, 0, 1,
-0.7718661, 0.5829105, -0.6969378, 0.7294118, 1, 0, 1,
-0.7617027, -0.09569976, -2.043309, 0.7215686, 1, 0, 1,
-0.7603474, -0.8308147, -2.324559, 0.7176471, 1, 0, 1,
-0.7570966, -0.7106495, -2.869799, 0.7098039, 1, 0, 1,
-0.756182, -0.04366038, -0.3370955, 0.7058824, 1, 0, 1,
-0.7526758, -2.251088, -2.094817, 0.6980392, 1, 0, 1,
-0.7511039, 0.9074792, -0.2303827, 0.6901961, 1, 0, 1,
-0.7500066, 0.3012459, -1.836578, 0.6862745, 1, 0, 1,
-0.7466946, 0.445009, -1.353967, 0.6784314, 1, 0, 1,
-0.7401347, 1.494935, 0.8750003, 0.6745098, 1, 0, 1,
-0.739327, 0.509579, 0.57595, 0.6666667, 1, 0, 1,
-0.7388416, -0.4207382, -2.418735, 0.6627451, 1, 0, 1,
-0.736284, 0.4522023, -0.008385334, 0.654902, 1, 0, 1,
-0.7279388, -0.1423152, -3.324359, 0.6509804, 1, 0, 1,
-0.7261766, 1.130412, -0.07087804, 0.6431373, 1, 0, 1,
-0.7212846, 0.1064142, 0.1489189, 0.6392157, 1, 0, 1,
-0.7194226, 1.287939, -0.2382586, 0.6313726, 1, 0, 1,
-0.7131075, -0.043388, -1.781677, 0.627451, 1, 0, 1,
-0.7070985, 1.434553, -0.7599713, 0.6196079, 1, 0, 1,
-0.7032109, -1.720501, -3.856736, 0.6156863, 1, 0, 1,
-0.6969228, -0.3592291, -1.691779, 0.6078432, 1, 0, 1,
-0.6940724, -0.5187172, -2.507746, 0.6039216, 1, 0, 1,
-0.6940498, 0.1233535, -2.569994, 0.5960785, 1, 0, 1,
-0.6933053, -0.5853714, -0.9865986, 0.5882353, 1, 0, 1,
-0.6854456, 0.2906786, 0.09234414, 0.5843138, 1, 0, 1,
-0.6753129, -0.2147321, -2.766073, 0.5764706, 1, 0, 1,
-0.6721866, -0.8514323, -4.845266, 0.572549, 1, 0, 1,
-0.6701295, 1.464315, 1.091753, 0.5647059, 1, 0, 1,
-0.6701129, -0.5470939, -3.201538, 0.5607843, 1, 0, 1,
-0.6620451, -0.1876147, -2.734806, 0.5529412, 1, 0, 1,
-0.6606996, 0.412479, -1.869141, 0.5490196, 1, 0, 1,
-0.6591768, -0.4560674, -2.567264, 0.5411765, 1, 0, 1,
-0.6519045, -0.4349479, -2.365972, 0.5372549, 1, 0, 1,
-0.6490258, 1.861656, -0.1413531, 0.5294118, 1, 0, 1,
-0.6430203, 0.4786609, -2.486164, 0.5254902, 1, 0, 1,
-0.637999, -1.80893, -3.076047, 0.5176471, 1, 0, 1,
-0.6342602, -2.54078, -1.411648, 0.5137255, 1, 0, 1,
-0.633642, 1.391592, -0.2705809, 0.5058824, 1, 0, 1,
-0.6325346, -1.57106, -2.457589, 0.5019608, 1, 0, 1,
-0.6323622, 1.175744, 0.2914761, 0.4941176, 1, 0, 1,
-0.6216412, -1.076219, -3.391762, 0.4862745, 1, 0, 1,
-0.6164292, -1.355061, -1.920158, 0.4823529, 1, 0, 1,
-0.615265, 0.06154896, 0.2841776, 0.4745098, 1, 0, 1,
-0.6055012, 1.139161, 0.3435266, 0.4705882, 1, 0, 1,
-0.6054272, -0.171441, -3.045122, 0.4627451, 1, 0, 1,
-0.6027464, 0.7050558, -1.067771, 0.4588235, 1, 0, 1,
-0.5940378, 0.1915015, -1.890297, 0.4509804, 1, 0, 1,
-0.5888293, -0.4109825, -1.107005, 0.4470588, 1, 0, 1,
-0.5813913, -0.7938023, -2.857648, 0.4392157, 1, 0, 1,
-0.5804384, 1.929929, -0.7817855, 0.4352941, 1, 0, 1,
-0.5799804, 2.285284, -1.405627, 0.427451, 1, 0, 1,
-0.5744793, 0.9683521, 0.3823681, 0.4235294, 1, 0, 1,
-0.5727664, 1.301425, -1.32598, 0.4156863, 1, 0, 1,
-0.5718378, 2.028997, 0.4763772, 0.4117647, 1, 0, 1,
-0.57174, -1.104116, -3.086118, 0.4039216, 1, 0, 1,
-0.5710598, -0.7810578, -2.133677, 0.3960784, 1, 0, 1,
-0.5698869, -1.046527, -2.566046, 0.3921569, 1, 0, 1,
-0.5693524, -0.8544605, -2.929773, 0.3843137, 1, 0, 1,
-0.5670256, 1.643111, -1.439001, 0.3803922, 1, 0, 1,
-0.5652352, -0.144728, -3.719856, 0.372549, 1, 0, 1,
-0.564259, 0.5104915, -0.5644606, 0.3686275, 1, 0, 1,
-0.5627997, 2.368013, 1.398911, 0.3607843, 1, 0, 1,
-0.5601399, 0.6337612, -1.667458, 0.3568628, 1, 0, 1,
-0.5509882, -1.443807, -3.002322, 0.3490196, 1, 0, 1,
-0.5476032, 0.8268942, 1.510786, 0.345098, 1, 0, 1,
-0.5452718, -0.192547, -2.956342, 0.3372549, 1, 0, 1,
-0.5424297, 1.242652, 0.5860809, 0.3333333, 1, 0, 1,
-0.5406947, -0.559882, -4.296364, 0.3254902, 1, 0, 1,
-0.5287328, 1.526086, -0.152111, 0.3215686, 1, 0, 1,
-0.5257915, -0.7122058, -2.068815, 0.3137255, 1, 0, 1,
-0.5257744, 0.5844132, -1.286189, 0.3098039, 1, 0, 1,
-0.5120225, 1.802964, -1.394935, 0.3019608, 1, 0, 1,
-0.5064061, 0.6824728, 0.2266158, 0.2941177, 1, 0, 1,
-0.5021056, -1.161143, -2.415947, 0.2901961, 1, 0, 1,
-0.5012787, 0.179686, -1.879069, 0.282353, 1, 0, 1,
-0.4999246, 1.495174, 0.4924821, 0.2784314, 1, 0, 1,
-0.4990571, -0.1897826, -1.992106, 0.2705882, 1, 0, 1,
-0.4963269, -1.590116, -3.710436, 0.2666667, 1, 0, 1,
-0.4937947, 0.4190387, 0.8540834, 0.2588235, 1, 0, 1,
-0.4921059, 0.06554139, -0.7261857, 0.254902, 1, 0, 1,
-0.4918417, -1.433328, -3.950277, 0.2470588, 1, 0, 1,
-0.4891557, 0.09668517, -3.231238, 0.2431373, 1, 0, 1,
-0.4879334, -0.07231022, -0.8923985, 0.2352941, 1, 0, 1,
-0.4834231, 0.4692874, -1.588227, 0.2313726, 1, 0, 1,
-0.4713585, 1.460112, -3.211812, 0.2235294, 1, 0, 1,
-0.4641335, 0.1657914, 0.1092513, 0.2196078, 1, 0, 1,
-0.4637864, 0.8696494, -1.110601, 0.2117647, 1, 0, 1,
-0.4628201, 0.2293997, 0.2718152, 0.2078431, 1, 0, 1,
-0.4618565, -0.7858877, -2.547092, 0.2, 1, 0, 1,
-0.459975, -1.975116, -3.487459, 0.1921569, 1, 0, 1,
-0.4581439, -1.280687, -2.770562, 0.1882353, 1, 0, 1,
-0.4566649, 0.936173, -1.115857, 0.1803922, 1, 0, 1,
-0.4558117, 0.5000322, -0.5571263, 0.1764706, 1, 0, 1,
-0.455433, 1.215574, 0.1084109, 0.1686275, 1, 0, 1,
-0.4507074, -0.577674, -1.594021, 0.1647059, 1, 0, 1,
-0.4506387, -0.7454648, -4.078018, 0.1568628, 1, 0, 1,
-0.4501626, 0.3582177, 0.5010858, 0.1529412, 1, 0, 1,
-0.4501235, -0.4984426, -3.581921, 0.145098, 1, 0, 1,
-0.450003, -1.054213, -2.974064, 0.1411765, 1, 0, 1,
-0.4467322, -0.8638957, -1.738405, 0.1333333, 1, 0, 1,
-0.4393094, -1.702691, -3.615162, 0.1294118, 1, 0, 1,
-0.4376356, 0.06329653, -2.043051, 0.1215686, 1, 0, 1,
-0.4368629, -0.6128032, -2.313282, 0.1176471, 1, 0, 1,
-0.4360995, -0.0754059, -1.938374, 0.1098039, 1, 0, 1,
-0.4351071, -0.943142, -3.79933, 0.1058824, 1, 0, 1,
-0.4319499, -0.1729015, -2.265665, 0.09803922, 1, 0, 1,
-0.4303347, 0.8404113, -1.032231, 0.09019608, 1, 0, 1,
-0.4299553, -1.734895, -3.158691, 0.08627451, 1, 0, 1,
-0.4290887, -0.3328527, -1.774267, 0.07843138, 1, 0, 1,
-0.4286041, -0.1626956, -0.4846237, 0.07450981, 1, 0, 1,
-0.4241429, -0.3664486, -1.718931, 0.06666667, 1, 0, 1,
-0.4234163, -0.3611214, -1.927315, 0.0627451, 1, 0, 1,
-0.4230004, -1.007155, -2.810873, 0.05490196, 1, 0, 1,
-0.4227574, 0.02059082, -2.9388, 0.05098039, 1, 0, 1,
-0.4200803, -1.010149, -3.156754, 0.04313726, 1, 0, 1,
-0.4144528, -1.572206, -2.336264, 0.03921569, 1, 0, 1,
-0.4138705, 0.4551894, -0.2134895, 0.03137255, 1, 0, 1,
-0.4114165, 0.3368003, -2.343094, 0.02745098, 1, 0, 1,
-0.4049164, -1.251569, -3.150959, 0.01960784, 1, 0, 1,
-0.3986864, -0.1986922, -2.244704, 0.01568628, 1, 0, 1,
-0.3942502, -0.5274968, -2.526117, 0.007843138, 1, 0, 1,
-0.3886453, -0.2084496, -2.986571, 0.003921569, 1, 0, 1,
-0.3853809, 1.040178, -0.8935807, 0, 1, 0.003921569, 1,
-0.3853534, -0.2610197, -3.264493, 0, 1, 0.01176471, 1,
-0.3806693, -0.3579177, -0.6776327, 0, 1, 0.01568628, 1,
-0.3739348, 0.5480105, -0.7575386, 0, 1, 0.02352941, 1,
-0.3729426, 2.798772, -1.087619, 0, 1, 0.02745098, 1,
-0.3718991, 0.9647903, -0.7047301, 0, 1, 0.03529412, 1,
-0.3663723, 0.6201381, -1.007817, 0, 1, 0.03921569, 1,
-0.3655074, -1.058848, -4.130815, 0, 1, 0.04705882, 1,
-0.3624296, 1.856155, -0.338721, 0, 1, 0.05098039, 1,
-0.3606895, -0.7529299, -2.251725, 0, 1, 0.05882353, 1,
-0.3572524, 0.7793896, -0.1883079, 0, 1, 0.0627451, 1,
-0.3564883, 1.096279, 0.0841599, 0, 1, 0.07058824, 1,
-0.3559664, 1.59033, -0.2602541, 0, 1, 0.07450981, 1,
-0.3542889, -0.248252, -2.21641, 0, 1, 0.08235294, 1,
-0.3470374, -0.3786294, -1.931776, 0, 1, 0.08627451, 1,
-0.3449373, -0.5665181, -1.882144, 0, 1, 0.09411765, 1,
-0.3437476, -0.7138434, -3.043627, 0, 1, 0.1019608, 1,
-0.3411044, -0.523086, -1.909283, 0, 1, 0.1058824, 1,
-0.3391079, -0.7280813, -4.793177, 0, 1, 0.1137255, 1,
-0.3340053, 0.7501923, -2.343046, 0, 1, 0.1176471, 1,
-0.3325883, -0.08902694, -1.733953, 0, 1, 0.1254902, 1,
-0.3323407, -2.131206, -1.652672, 0, 1, 0.1294118, 1,
-0.3320413, 1.254466, -0.2462658, 0, 1, 0.1372549, 1,
-0.33121, -0.1957141, -0.0267409, 0, 1, 0.1411765, 1,
-0.3308002, 0.5945218, -1.134404, 0, 1, 0.1490196, 1,
-0.3295546, 0.6965601, 0.3300335, 0, 1, 0.1529412, 1,
-0.3274285, 1.065946, -0.2582765, 0, 1, 0.1607843, 1,
-0.3266062, 1.253255, -0.5007822, 0, 1, 0.1647059, 1,
-0.3260234, -1.229954, -1.780119, 0, 1, 0.172549, 1,
-0.3223093, 0.3332311, -1.248167, 0, 1, 0.1764706, 1,
-0.3221759, -1.349147, -3.945764, 0, 1, 0.1843137, 1,
-0.3194026, -0.1941587, -4.610206, 0, 1, 0.1882353, 1,
-0.315457, 0.9263052, -0.3918605, 0, 1, 0.1960784, 1,
-0.3133917, 1.173203, 1.333157, 0, 1, 0.2039216, 1,
-0.3098518, 0.1537754, -3.18979, 0, 1, 0.2078431, 1,
-0.3098145, -0.5076212, -3.753426, 0, 1, 0.2156863, 1,
-0.3048127, -0.8172686, -3.644116, 0, 1, 0.2196078, 1,
-0.2992561, 0.06898972, -2.728977, 0, 1, 0.227451, 1,
-0.297767, -0.1669097, -2.224906, 0, 1, 0.2313726, 1,
-0.2892031, 1.481754, -0.4105946, 0, 1, 0.2392157, 1,
-0.2887182, 0.9379834, 0.4699494, 0, 1, 0.2431373, 1,
-0.2879055, -1.136128, -4.887027, 0, 1, 0.2509804, 1,
-0.2877343, -1.368336, -3.997679, 0, 1, 0.254902, 1,
-0.287381, 1.060158, -1.723768, 0, 1, 0.2627451, 1,
-0.2859088, -1.253098, -3.582211, 0, 1, 0.2666667, 1,
-0.2841069, 0.357562, -0.5113076, 0, 1, 0.2745098, 1,
-0.2837403, 1.743888, 0.470001, 0, 1, 0.2784314, 1,
-0.2831728, 1.676908, -0.318707, 0, 1, 0.2862745, 1,
-0.2772777, 0.8638909, 0.587731, 0, 1, 0.2901961, 1,
-0.2757842, -0.6510203, -3.232211, 0, 1, 0.2980392, 1,
-0.2740915, 0.6577324, -1.169619, 0, 1, 0.3058824, 1,
-0.2736683, -0.9792562, -3.070012, 0, 1, 0.3098039, 1,
-0.2708533, 1.173194, 0.4843344, 0, 1, 0.3176471, 1,
-0.2698624, 0.5157676, -1.291419, 0, 1, 0.3215686, 1,
-0.2646517, -0.2712674, -1.933839, 0, 1, 0.3294118, 1,
-0.2581239, -0.904319, -3.132712, 0, 1, 0.3333333, 1,
-0.2565512, 0.4348463, -0.1597014, 0, 1, 0.3411765, 1,
-0.2516146, -3.004632, -4.341067, 0, 1, 0.345098, 1,
-0.2510405, 0.7061681, -1.847964, 0, 1, 0.3529412, 1,
-0.2483103, -0.2478123, -2.154804, 0, 1, 0.3568628, 1,
-0.2452086, -0.7353548, -3.324842, 0, 1, 0.3647059, 1,
-0.2430874, 0.7604093, -0.654354, 0, 1, 0.3686275, 1,
-0.2422867, -0.1163476, -2.985794, 0, 1, 0.3764706, 1,
-0.2408284, -0.328279, -2.740127, 0, 1, 0.3803922, 1,
-0.2397585, 1.916856, -1.14804, 0, 1, 0.3882353, 1,
-0.2393588, 1.727406, -0.4668357, 0, 1, 0.3921569, 1,
-0.2388888, -0.937219, -1.204328, 0, 1, 0.4, 1,
-0.2365492, 0.2154706, -0.2482784, 0, 1, 0.4078431, 1,
-0.2332371, 3.260226, -0.9102423, 0, 1, 0.4117647, 1,
-0.2287332, 1.11134, 1.321885, 0, 1, 0.4196078, 1,
-0.2286616, 1.027455, -0.2656353, 0, 1, 0.4235294, 1,
-0.2277843, -1.38394, -2.682465, 0, 1, 0.4313726, 1,
-0.2272731, -0.3342125, -3.113785, 0, 1, 0.4352941, 1,
-0.2267876, -0.8709273, -3.072877, 0, 1, 0.4431373, 1,
-0.2267259, -0.1059416, -2.465641, 0, 1, 0.4470588, 1,
-0.2264764, -0.4575574, -2.881946, 0, 1, 0.454902, 1,
-0.2244497, -0.6663433, -3.465514, 0, 1, 0.4588235, 1,
-0.2229995, -1.892514, -3.489181, 0, 1, 0.4666667, 1,
-0.2228788, 0.2594559, -0.9869114, 0, 1, 0.4705882, 1,
-0.2200854, 1.407624, -0.3406646, 0, 1, 0.4784314, 1,
-0.2174008, -0.6933085, -2.160995, 0, 1, 0.4823529, 1,
-0.2109626, -1.071427, -2.007862, 0, 1, 0.4901961, 1,
-0.2078433, -1.002302, -1.205866, 0, 1, 0.4941176, 1,
-0.2054258, -1.63856, -3.691078, 0, 1, 0.5019608, 1,
-0.203203, -0.9090703, -2.241164, 0, 1, 0.509804, 1,
-0.2027281, 0.2474001, 0.2706133, 0, 1, 0.5137255, 1,
-0.1965414, -0.07305992, -1.587061, 0, 1, 0.5215687, 1,
-0.1953513, -1.692321, -3.785642, 0, 1, 0.5254902, 1,
-0.1932478, 0.585052, 0.251824, 0, 1, 0.5333334, 1,
-0.1927205, -0.416179, -3.7799, 0, 1, 0.5372549, 1,
-0.1915557, -1.741079, -1.629644, 0, 1, 0.5450981, 1,
-0.1905598, 0.001586646, -2.747488, 0, 1, 0.5490196, 1,
-0.1894276, -0.6917549, -2.37717, 0, 1, 0.5568628, 1,
-0.1841192, 0.3720293, -0.6772265, 0, 1, 0.5607843, 1,
-0.1837703, -0.6594819, -4.509394, 0, 1, 0.5686275, 1,
-0.1827294, 0.8542002, -1.348651, 0, 1, 0.572549, 1,
-0.1811054, 0.1951555, -1.324612, 0, 1, 0.5803922, 1,
-0.1760208, -0.679028, -3.663203, 0, 1, 0.5843138, 1,
-0.1727725, 1.041779, -0.08940949, 0, 1, 0.5921569, 1,
-0.1715493, -0.5232941, -3.958162, 0, 1, 0.5960785, 1,
-0.1694422, -0.2967593, -5.179378, 0, 1, 0.6039216, 1,
-0.1671547, -0.7029032, -3.207485, 0, 1, 0.6117647, 1,
-0.1657445, -0.4742182, -3.365687, 0, 1, 0.6156863, 1,
-0.1569144, -0.08463658, -1.896031, 0, 1, 0.6235294, 1,
-0.1526739, 1.380752, 1.222564, 0, 1, 0.627451, 1,
-0.1508542, -0.2784754, -2.285399, 0, 1, 0.6352941, 1,
-0.1484356, -1.078554, -2.454751, 0, 1, 0.6392157, 1,
-0.146978, -2.43454, -3.040501, 0, 1, 0.6470588, 1,
-0.1469733, -0.09700794, -3.262118, 0, 1, 0.6509804, 1,
-0.1465591, 0.3107981, -0.005621547, 0, 1, 0.6588235, 1,
-0.1388849, -0.05689328, -2.106396, 0, 1, 0.6627451, 1,
-0.1375388, 1.820607, -1.701981, 0, 1, 0.6705883, 1,
-0.1352186, -0.6861407, -2.803041, 0, 1, 0.6745098, 1,
-0.1325137, 0.6349224, -1.601716, 0, 1, 0.682353, 1,
-0.1313441, -1.038649, -3.467356, 0, 1, 0.6862745, 1,
-0.1303635, 1.058153, -1.254501, 0, 1, 0.6941177, 1,
-0.1292689, 0.8297244, 0.3676126, 0, 1, 0.7019608, 1,
-0.1285448, -0.7477019, -2.080203, 0, 1, 0.7058824, 1,
-0.1252925, -1.730039, -4.622241, 0, 1, 0.7137255, 1,
-0.1190896, -0.3034597, -2.90466, 0, 1, 0.7176471, 1,
-0.1153588, 0.04906718, -0.5604355, 0, 1, 0.7254902, 1,
-0.1151074, 0.5595275, -2.569135, 0, 1, 0.7294118, 1,
-0.1075582, -0.922767, -3.657526, 0, 1, 0.7372549, 1,
-0.101528, 0.6029723, -1.165424, 0, 1, 0.7411765, 1,
-0.1008424, 0.5410067, -1.597724, 0, 1, 0.7490196, 1,
-0.09764727, -0.5923907, -3.848153, 0, 1, 0.7529412, 1,
-0.09763667, 0.2221092, -0.1522951, 0, 1, 0.7607843, 1,
-0.09674115, -0.8184234, -3.737822, 0, 1, 0.7647059, 1,
-0.09647086, -0.22783, -2.891837, 0, 1, 0.772549, 1,
-0.0958939, 2.42071, 0.8584612, 0, 1, 0.7764706, 1,
-0.09478808, -1.17513, -4.802629, 0, 1, 0.7843137, 1,
-0.09035254, -2.007913, -3.373164, 0, 1, 0.7882353, 1,
-0.08716593, -0.4165294, -2.608924, 0, 1, 0.7960784, 1,
-0.0849791, -0.3018222, -0.9212025, 0, 1, 0.8039216, 1,
-0.08216426, -0.6732625, -3.656619, 0, 1, 0.8078431, 1,
-0.07995752, -0.07013594, -2.627939, 0, 1, 0.8156863, 1,
-0.07908805, 1.111656, 0.04307871, 0, 1, 0.8196079, 1,
-0.07856209, -1.84538, -1.415917, 0, 1, 0.827451, 1,
-0.07676519, -0.5782428, -2.232665, 0, 1, 0.8313726, 1,
-0.07652526, 1.076618, -0.8611476, 0, 1, 0.8392157, 1,
-0.07633067, -1.356743, -3.051298, 0, 1, 0.8431373, 1,
-0.06916532, -0.3626546, -3.786059, 0, 1, 0.8509804, 1,
-0.06702615, 2.009385, 0.1705657, 0, 1, 0.854902, 1,
-0.06642663, 1.360504, -0.2425558, 0, 1, 0.8627451, 1,
-0.06330026, -0.3204545, -2.011528, 0, 1, 0.8666667, 1,
-0.06172604, 0.1633514, -0.4959923, 0, 1, 0.8745098, 1,
-0.06144087, -0.3224926, -4.739046, 0, 1, 0.8784314, 1,
-0.06099389, 1.094286, -0.7824553, 0, 1, 0.8862745, 1,
-0.05895498, 1.045883, -1.094137, 0, 1, 0.8901961, 1,
-0.0552376, 0.1065915, 1.108646, 0, 1, 0.8980392, 1,
-0.05132188, -1.204974, -3.760468, 0, 1, 0.9058824, 1,
-0.05007168, 1.131797, -0.5467587, 0, 1, 0.9098039, 1,
-0.04644896, 1.125893, 2.282318, 0, 1, 0.9176471, 1,
-0.04375397, -0.7226669, -2.150968, 0, 1, 0.9215686, 1,
-0.04275058, -0.5571207, -4.176381, 0, 1, 0.9294118, 1,
-0.04040753, 0.252861, -1.345706, 0, 1, 0.9333333, 1,
-0.0369058, -1.519247, -2.642455, 0, 1, 0.9411765, 1,
-0.03237642, -0.919807, -3.893943, 0, 1, 0.945098, 1,
-0.03070975, 0.65772, 0.9949281, 0, 1, 0.9529412, 1,
-0.02663433, 1.300765, 0.198603, 0, 1, 0.9568627, 1,
-0.02648096, 1.434679, -1.159765, 0, 1, 0.9647059, 1,
-0.02239485, 0.06867639, -1.053926, 0, 1, 0.9686275, 1,
-0.01906343, 1.276173, -0.3150461, 0, 1, 0.9764706, 1,
-0.01657509, 0.06746358, -0.2371414, 0, 1, 0.9803922, 1,
-0.01451788, -0.4360352, -4.036567, 0, 1, 0.9882353, 1,
-0.01352718, -0.6598102, -4.524404, 0, 1, 0.9921569, 1,
-0.0005331696, -0.09130345, -2.668023, 0, 1, 1, 1,
0.00134424, -0.1206791, 1.571265, 0, 0.9921569, 1, 1,
0.001964024, -1.584521, 3.67952, 0, 0.9882353, 1, 1,
0.002249698, -1.000827, 5.270736, 0, 0.9803922, 1, 1,
0.008099017, 1.260592, 0.9781798, 0, 0.9764706, 1, 1,
0.01350861, -1.256989, 2.343464, 0, 0.9686275, 1, 1,
0.01394347, -0.3193131, 2.881013, 0, 0.9647059, 1, 1,
0.01564664, -1.855761, 4.467227, 0, 0.9568627, 1, 1,
0.01583267, -0.03289569, 2.155253, 0, 0.9529412, 1, 1,
0.01834481, 3.450981, -0.4497865, 0, 0.945098, 1, 1,
0.01913404, 0.3406324, -0.2534475, 0, 0.9411765, 1, 1,
0.0223104, -0.02812734, 4.122705, 0, 0.9333333, 1, 1,
0.03231368, -0.1932705, 4.709914, 0, 0.9294118, 1, 1,
0.03778652, -0.5362587, 2.261691, 0, 0.9215686, 1, 1,
0.03996694, -0.08412196, 1.541779, 0, 0.9176471, 1, 1,
0.04217242, 1.155095, 0.6115732, 0, 0.9098039, 1, 1,
0.04380764, 0.02990839, -0.01019956, 0, 0.9058824, 1, 1,
0.04839471, -0.4272687, 2.948431, 0, 0.8980392, 1, 1,
0.0490985, 0.6221446, 0.03837483, 0, 0.8901961, 1, 1,
0.06126837, 0.6129652, 1.153165, 0, 0.8862745, 1, 1,
0.06585541, 0.5001113, -1.442063, 0, 0.8784314, 1, 1,
0.06888159, -0.09399884, 3.530551, 0, 0.8745098, 1, 1,
0.07264175, -1.268264, 2.07602, 0, 0.8666667, 1, 1,
0.07269909, 0.4162079, -0.3695775, 0, 0.8627451, 1, 1,
0.07272161, 1.688862, -2.143462, 0, 0.854902, 1, 1,
0.07292613, 0.1095442, 0.4984885, 0, 0.8509804, 1, 1,
0.07375944, 0.9870924, 0.4434615, 0, 0.8431373, 1, 1,
0.07459018, 0.9644726, 0.8943138, 0, 0.8392157, 1, 1,
0.07476383, 0.6093924, 0.1406488, 0, 0.8313726, 1, 1,
0.07519711, 1.576537, -0.2203126, 0, 0.827451, 1, 1,
0.07598252, -0.9301112, 2.929135, 0, 0.8196079, 1, 1,
0.07936592, 0.4240366, -0.2338715, 0, 0.8156863, 1, 1,
0.08177241, -0.9468497, 2.715094, 0, 0.8078431, 1, 1,
0.08339017, 2.941137, 0.9089154, 0, 0.8039216, 1, 1,
0.08358908, -1.884529, 3.220568, 0, 0.7960784, 1, 1,
0.08360212, -1.620049, 3.648432, 0, 0.7882353, 1, 1,
0.08563938, 0.3407837, 0.2626874, 0, 0.7843137, 1, 1,
0.08901675, -0.9089543, 3.677971, 0, 0.7764706, 1, 1,
0.09860667, 0.6914238, 1.812217, 0, 0.772549, 1, 1,
0.1012593, -0.6622546, 1.366639, 0, 0.7647059, 1, 1,
0.1024703, 0.2100699, 1.73936, 0, 0.7607843, 1, 1,
0.1033921, 0.005444785, 2.073415, 0, 0.7529412, 1, 1,
0.1044348, -0.3017323, 3.798588, 0, 0.7490196, 1, 1,
0.1067864, -1.580946, 2.288246, 0, 0.7411765, 1, 1,
0.1076029, -0.7348373, 3.085606, 0, 0.7372549, 1, 1,
0.1227487, -0.3345957, 2.57236, 0, 0.7294118, 1, 1,
0.123517, 0.3453958, -0.04895763, 0, 0.7254902, 1, 1,
0.1257917, -0.4973312, 2.710372, 0, 0.7176471, 1, 1,
0.1264849, 0.3089796, 1.595034, 0, 0.7137255, 1, 1,
0.127222, -0.8249822, 3.522976, 0, 0.7058824, 1, 1,
0.1311546, -0.3417709, 2.200679, 0, 0.6980392, 1, 1,
0.1351032, -0.4261096, 2.461107, 0, 0.6941177, 1, 1,
0.1373043, 1.533361, -0.7934704, 0, 0.6862745, 1, 1,
0.1375179, -0.625174, 2.967584, 0, 0.682353, 1, 1,
0.1391794, -0.9496236, 4.011391, 0, 0.6745098, 1, 1,
0.139845, -0.7806575, 4.618639, 0, 0.6705883, 1, 1,
0.1428075, -0.6831803, 3.406244, 0, 0.6627451, 1, 1,
0.1468195, 1.033294, 0.7743266, 0, 0.6588235, 1, 1,
0.1475328, -0.378779, 5.028345, 0, 0.6509804, 1, 1,
0.1476402, -0.5459606, 2.660503, 0, 0.6470588, 1, 1,
0.1483605, 1.307792, -0.4363145, 0, 0.6392157, 1, 1,
0.1494007, 0.2679778, 0.1843997, 0, 0.6352941, 1, 1,
0.1496451, -0.07734063, 3.311775, 0, 0.627451, 1, 1,
0.1504959, -1.445881, 4.205205, 0, 0.6235294, 1, 1,
0.1547839, 0.03507069, 1.758976, 0, 0.6156863, 1, 1,
0.1553535, 0.7063223, -1.998093, 0, 0.6117647, 1, 1,
0.15646, -1.781213, 1.749624, 0, 0.6039216, 1, 1,
0.1626402, 0.6610234, -1.062829, 0, 0.5960785, 1, 1,
0.1634701, 0.3967564, -0.653185, 0, 0.5921569, 1, 1,
0.1663669, -0.3722113, 2.21398, 0, 0.5843138, 1, 1,
0.1752566, 1.279747, 1.352386, 0, 0.5803922, 1, 1,
0.1775223, -0.4383106, 1.598149, 0, 0.572549, 1, 1,
0.1889043, 1.606138, -1.352199, 0, 0.5686275, 1, 1,
0.1890527, 0.1811964, 0.004087767, 0, 0.5607843, 1, 1,
0.1890819, -0.6178124, 1.73529, 0, 0.5568628, 1, 1,
0.1904972, -1.468977, 1.114992, 0, 0.5490196, 1, 1,
0.1917583, 0.1275012, 1.645429, 0, 0.5450981, 1, 1,
0.1934576, -0.5593815, 4.187941, 0, 0.5372549, 1, 1,
0.1939734, 0.3190807, 1.820105, 0, 0.5333334, 1, 1,
0.1990166, 0.5394908, 1.44469, 0, 0.5254902, 1, 1,
0.2031224, -0.1479172, 1.252707, 0, 0.5215687, 1, 1,
0.2067329, -1.274266, 4.632493, 0, 0.5137255, 1, 1,
0.2136502, 0.2494551, 0.2442618, 0, 0.509804, 1, 1,
0.2154827, -0.5606555, 4.419463, 0, 0.5019608, 1, 1,
0.2187468, 0.3628502, 0.6154941, 0, 0.4941176, 1, 1,
0.220146, 1.526236, -0.4112515, 0, 0.4901961, 1, 1,
0.2297848, -0.1919066, 1.729857, 0, 0.4823529, 1, 1,
0.2314841, -0.6004483, 3.258625, 0, 0.4784314, 1, 1,
0.2330354, -1.142781, 3.135068, 0, 0.4705882, 1, 1,
0.2343493, -1.570614, 3.667663, 0, 0.4666667, 1, 1,
0.2351889, -1.506601, 4.421666, 0, 0.4588235, 1, 1,
0.2377227, -0.4013915, 2.817662, 0, 0.454902, 1, 1,
0.2409044, -0.3127836, 4.288909, 0, 0.4470588, 1, 1,
0.2426132, -0.9173241, 4.086494, 0, 0.4431373, 1, 1,
0.2447982, 1.764451, 0.3610033, 0, 0.4352941, 1, 1,
0.2467467, 0.3653188, -0.6262723, 0, 0.4313726, 1, 1,
0.2487287, -0.7503642, 2.526202, 0, 0.4235294, 1, 1,
0.2513183, -0.4300901, 3.679092, 0, 0.4196078, 1, 1,
0.2513846, -0.6659588, 4.359559, 0, 0.4117647, 1, 1,
0.2514852, 1.258797, -0.8273793, 0, 0.4078431, 1, 1,
0.2522496, 2.039645, 0.309032, 0, 0.4, 1, 1,
0.2597984, 0.5389692, -0.3631798, 0, 0.3921569, 1, 1,
0.2620034, 0.4521107, 0.1005132, 0, 0.3882353, 1, 1,
0.2634529, -0.4785392, 3.450609, 0, 0.3803922, 1, 1,
0.2667363, -0.2671573, 2.68603, 0, 0.3764706, 1, 1,
0.2690395, -0.8695305, 2.490845, 0, 0.3686275, 1, 1,
0.2697205, -0.2650536, 1.434601, 0, 0.3647059, 1, 1,
0.2702031, -0.7066999, 2.665405, 0, 0.3568628, 1, 1,
0.2707804, 1.965589, 0.481137, 0, 0.3529412, 1, 1,
0.2733592, -1.792972, 2.505308, 0, 0.345098, 1, 1,
0.2736767, 1.904648, -0.2926922, 0, 0.3411765, 1, 1,
0.2738498, -0.5718194, 1.197716, 0, 0.3333333, 1, 1,
0.2741886, -0.2417411, 1.973, 0, 0.3294118, 1, 1,
0.2777153, -0.07229769, 0.5128997, 0, 0.3215686, 1, 1,
0.2778592, 0.565115, -0.8477266, 0, 0.3176471, 1, 1,
0.2800671, 1.177482, 0.08494881, 0, 0.3098039, 1, 1,
0.281331, 1.113393, -0.7307306, 0, 0.3058824, 1, 1,
0.2846318, -1.403946, 2.794284, 0, 0.2980392, 1, 1,
0.285162, -0.9714316, 0.6800007, 0, 0.2901961, 1, 1,
0.2874509, 0.9717426, -0.2466048, 0, 0.2862745, 1, 1,
0.288171, 1.418627, 1.244556, 0, 0.2784314, 1, 1,
0.2909053, 0.1123193, 1.800274, 0, 0.2745098, 1, 1,
0.2951523, -0.4782875, 3.081153, 0, 0.2666667, 1, 1,
0.2959439, -0.6798639, 2.155951, 0, 0.2627451, 1, 1,
0.2982486, -0.9463875, 2.43548, 0, 0.254902, 1, 1,
0.298836, 0.9293272, -0.6325768, 0, 0.2509804, 1, 1,
0.2994702, -1.405316, 2.467976, 0, 0.2431373, 1, 1,
0.3009142, -0.02150109, 2.167063, 0, 0.2392157, 1, 1,
0.3141885, 1.164414, -0.3779303, 0, 0.2313726, 1, 1,
0.3171503, 0.8830211, 0.5420377, 0, 0.227451, 1, 1,
0.3211476, -1.415625, 2.610864, 0, 0.2196078, 1, 1,
0.3221595, 0.6213456, 1.458988, 0, 0.2156863, 1, 1,
0.3238989, 0.8277009, 0.9657211, 0, 0.2078431, 1, 1,
0.3242547, 0.003790113, 1.459502, 0, 0.2039216, 1, 1,
0.325716, 1.293942, 1.325143, 0, 0.1960784, 1, 1,
0.3282187, 1.042299, -0.7352133, 0, 0.1882353, 1, 1,
0.3283296, -0.5157104, 1.968439, 0, 0.1843137, 1, 1,
0.3383199, 0.120239, 1.462784, 0, 0.1764706, 1, 1,
0.3390613, -1.003278, 3.772219, 0, 0.172549, 1, 1,
0.3419656, 0.2850383, 0.5871614, 0, 0.1647059, 1, 1,
0.3443389, -0.2123589, 1.862907, 0, 0.1607843, 1, 1,
0.3457695, 0.4824671, 0.4966019, 0, 0.1529412, 1, 1,
0.3494735, 0.4967754, 1.856597, 0, 0.1490196, 1, 1,
0.3494974, 1.058555, 2.140791, 0, 0.1411765, 1, 1,
0.3520724, -0.5108265, 3.080268, 0, 0.1372549, 1, 1,
0.3532547, 0.3343085, -0.9791604, 0, 0.1294118, 1, 1,
0.3557021, -0.06138623, 1.453847, 0, 0.1254902, 1, 1,
0.3572733, 1.244148, 0.4455075, 0, 0.1176471, 1, 1,
0.3577725, 0.1020456, 1.229575, 0, 0.1137255, 1, 1,
0.3594328, -1.635148, 3.633437, 0, 0.1058824, 1, 1,
0.363443, -0.4725851, 2.506799, 0, 0.09803922, 1, 1,
0.3635911, 0.2915162, 1.518826, 0, 0.09411765, 1, 1,
0.3643757, -0.9658058, 3.817708, 0, 0.08627451, 1, 1,
0.3732603, -0.2502822, 1.762963, 0, 0.08235294, 1, 1,
0.3781737, -0.1127136, 1.553383, 0, 0.07450981, 1, 1,
0.3854902, 1.114711, 0.8760768, 0, 0.07058824, 1, 1,
0.3860478, 0.1239611, 1.778372, 0, 0.0627451, 1, 1,
0.3910043, -0.4707079, 2.075989, 0, 0.05882353, 1, 1,
0.3983486, -0.754303, 2.546137, 0, 0.05098039, 1, 1,
0.4008653, 0.3987832, -0.6218739, 0, 0.04705882, 1, 1,
0.4011021, 0.3223115, 1.55954, 0, 0.03921569, 1, 1,
0.4066722, -1.619594, 3.501198, 0, 0.03529412, 1, 1,
0.4089246, -0.1480094, 1.82909, 0, 0.02745098, 1, 1,
0.4154729, -1.141507, 0.9136423, 0, 0.02352941, 1, 1,
0.4195548, -0.1003348, 2.307322, 0, 0.01568628, 1, 1,
0.4206201, 0.2990288, 2.582042, 0, 0.01176471, 1, 1,
0.4218572, 1.026925, 0.1292654, 0, 0.003921569, 1, 1,
0.4222963, 0.5794607, 0.787733, 0.003921569, 0, 1, 1,
0.4238205, -0.2316426, 3.12695, 0.007843138, 0, 1, 1,
0.4259748, -1.582435, 2.278707, 0.01568628, 0, 1, 1,
0.4288613, 0.9137158, -0.6217996, 0.01960784, 0, 1, 1,
0.43287, 0.9554637, 0.1016648, 0.02745098, 0, 1, 1,
0.4361792, -0.8499528, 3.03653, 0.03137255, 0, 1, 1,
0.4384464, -0.5619939, 1.755515, 0.03921569, 0, 1, 1,
0.4465295, -0.3415863, 3.837752, 0.04313726, 0, 1, 1,
0.4486811, -0.7357635, 3.818171, 0.05098039, 0, 1, 1,
0.4506657, -0.9086529, 2.564595, 0.05490196, 0, 1, 1,
0.4541854, -0.3191587, 1.698123, 0.0627451, 0, 1, 1,
0.4561576, 0.01306404, 1.333324, 0.06666667, 0, 1, 1,
0.4561641, 0.3293026, 0.8489546, 0.07450981, 0, 1, 1,
0.4611987, 0.820406, 1.41296, 0.07843138, 0, 1, 1,
0.4619496, 0.4047083, 1.716159, 0.08627451, 0, 1, 1,
0.4626189, 1.015456, -1.503821, 0.09019608, 0, 1, 1,
0.4631537, 1.252346, -1.082295, 0.09803922, 0, 1, 1,
0.4724714, 1.705951, 1.285349, 0.1058824, 0, 1, 1,
0.478045, 0.9262139, 1.294387, 0.1098039, 0, 1, 1,
0.4782771, 1.275545, 0.8033518, 0.1176471, 0, 1, 1,
0.4792727, 0.5344071, 0.4613218, 0.1215686, 0, 1, 1,
0.4812899, 0.312042, 1.012706, 0.1294118, 0, 1, 1,
0.4861646, 0.9921244, 0.9543241, 0.1333333, 0, 1, 1,
0.4864242, 1.694176, -1.347008, 0.1411765, 0, 1, 1,
0.490255, 0.8452986, 1.333688, 0.145098, 0, 1, 1,
0.4911182, 0.1722212, 0.4332155, 0.1529412, 0, 1, 1,
0.4912701, 0.3901066, 0.3610461, 0.1568628, 0, 1, 1,
0.4962965, -1.799509, 3.829894, 0.1647059, 0, 1, 1,
0.4979071, -2.041623, 3.091151, 0.1686275, 0, 1, 1,
0.4988673, 0.7524671, -0.5063449, 0.1764706, 0, 1, 1,
0.50001, 2.200628, 0.9189016, 0.1803922, 0, 1, 1,
0.5041788, 0.6644794, 0.8063179, 0.1882353, 0, 1, 1,
0.5077539, -0.7968466, 1.065603, 0.1921569, 0, 1, 1,
0.511372, 0.6504325, 0.03573604, 0.2, 0, 1, 1,
0.5126665, -1.3612, 3.397241, 0.2078431, 0, 1, 1,
0.5135939, 1.637747, 0.5808284, 0.2117647, 0, 1, 1,
0.5146454, 0.5690467, 1.138815, 0.2196078, 0, 1, 1,
0.519664, -0.0170406, 0.7488847, 0.2235294, 0, 1, 1,
0.5211601, 0.2821023, 0.5901281, 0.2313726, 0, 1, 1,
0.5268635, -1.562786, 2.729336, 0.2352941, 0, 1, 1,
0.5299116, -1.227471, 2.884491, 0.2431373, 0, 1, 1,
0.5303262, -0.5875331, 1.476246, 0.2470588, 0, 1, 1,
0.5323499, -0.233564, 2.371674, 0.254902, 0, 1, 1,
0.5339687, -0.9302195, 1.965284, 0.2588235, 0, 1, 1,
0.5393226, 0.3074512, 1.283174, 0.2666667, 0, 1, 1,
0.5405101, 0.4181544, 1.37311, 0.2705882, 0, 1, 1,
0.5582732, 0.3050651, 2.43643, 0.2784314, 0, 1, 1,
0.559993, 0.3657188, 0.954931, 0.282353, 0, 1, 1,
0.5624632, -0.055878, 1.273163, 0.2901961, 0, 1, 1,
0.56349, -1.190414, 3.206109, 0.2941177, 0, 1, 1,
0.5635214, -1.068675, 3.198055, 0.3019608, 0, 1, 1,
0.5685089, 0.1913189, -0.2451758, 0.3098039, 0, 1, 1,
0.5721336, -1.474051, 3.424581, 0.3137255, 0, 1, 1,
0.5734543, 0.4359504, 2.732298, 0.3215686, 0, 1, 1,
0.582663, -1.633201, 4.167792, 0.3254902, 0, 1, 1,
0.5902895, 1.307508, -0.7234926, 0.3333333, 0, 1, 1,
0.5916228, -0.2024977, 2.596513, 0.3372549, 0, 1, 1,
0.593253, -1.42371, 5.881696, 0.345098, 0, 1, 1,
0.5941073, 0.8635625, 0.753056, 0.3490196, 0, 1, 1,
0.5951344, -0.5535074, 0.8857012, 0.3568628, 0, 1, 1,
0.6027754, -0.5548087, 3.131139, 0.3607843, 0, 1, 1,
0.6045529, 1.047037, 0.1698658, 0.3686275, 0, 1, 1,
0.6052091, 0.2937114, 0.7467541, 0.372549, 0, 1, 1,
0.6052312, 0.6198655, 1.565345, 0.3803922, 0, 1, 1,
0.6056497, 2.42837, -0.604202, 0.3843137, 0, 1, 1,
0.6056968, -0.8395719, 2.974395, 0.3921569, 0, 1, 1,
0.6169763, -2.121497, 4.298813, 0.3960784, 0, 1, 1,
0.6201004, 0.397031, 0.2751091, 0.4039216, 0, 1, 1,
0.6234969, 0.3248169, -1.184013, 0.4117647, 0, 1, 1,
0.635253, -0.9719031, 2.65838, 0.4156863, 0, 1, 1,
0.6377068, 0.9036461, 0.3142383, 0.4235294, 0, 1, 1,
0.639935, 0.6814885, 1.115242, 0.427451, 0, 1, 1,
0.6469679, -1.698777, 4.045321, 0.4352941, 0, 1, 1,
0.6480514, -0.8310573, 3.834903, 0.4392157, 0, 1, 1,
0.6483661, 1.971351, -0.9444913, 0.4470588, 0, 1, 1,
0.6520151, -1.446705, 4.518101, 0.4509804, 0, 1, 1,
0.6552603, -0.9175591, 0.2270644, 0.4588235, 0, 1, 1,
0.6564924, 1.467319, -1.281625, 0.4627451, 0, 1, 1,
0.660593, 0.2742699, 0.1114678, 0.4705882, 0, 1, 1,
0.6610394, 0.7570494, 0.6351976, 0.4745098, 0, 1, 1,
0.6617208, 1.655327, -1.263714, 0.4823529, 0, 1, 1,
0.6623616, 0.5218793, 0.2665069, 0.4862745, 0, 1, 1,
0.6629974, 1.540297, 2.39309, 0.4941176, 0, 1, 1,
0.6630314, 1.904308, 0.05017986, 0.5019608, 0, 1, 1,
0.663853, 1.088205, 0.429731, 0.5058824, 0, 1, 1,
0.6675375, 0.90435, -0.08177481, 0.5137255, 0, 1, 1,
0.6702152, 0.558866, 2.327193, 0.5176471, 0, 1, 1,
0.6732255, 1.167071, 2.057943, 0.5254902, 0, 1, 1,
0.6755751, -0.9159265, 1.752622, 0.5294118, 0, 1, 1,
0.6756659, 1.11992, 2.296002, 0.5372549, 0, 1, 1,
0.6794753, -0.08823273, 3.142488, 0.5411765, 0, 1, 1,
0.6912022, 0.1143286, -1.602277, 0.5490196, 0, 1, 1,
0.6921622, -0.1413887, 1.1412, 0.5529412, 0, 1, 1,
0.6974966, 0.07449654, 2.558789, 0.5607843, 0, 1, 1,
0.7007877, -1.030004, 2.715896, 0.5647059, 0, 1, 1,
0.7010179, 0.8506036, -1.075111, 0.572549, 0, 1, 1,
0.7020023, 1.23244, 3.094546, 0.5764706, 0, 1, 1,
0.7025638, 0.155028, 0.6743059, 0.5843138, 0, 1, 1,
0.7032093, -0.5435824, 3.339801, 0.5882353, 0, 1, 1,
0.7129577, -0.7059345, 3.088487, 0.5960785, 0, 1, 1,
0.7283658, -0.5848171, 3.23151, 0.6039216, 0, 1, 1,
0.7315212, 0.4690201, 0.5962639, 0.6078432, 0, 1, 1,
0.7324029, -0.8097034, 2.596677, 0.6156863, 0, 1, 1,
0.7332803, -1.626171, 3.141202, 0.6196079, 0, 1, 1,
0.7334724, -0.6608428, 1.310488, 0.627451, 0, 1, 1,
0.7343209, 0.7298739, 2.754246, 0.6313726, 0, 1, 1,
0.7367489, -0.08074514, 1.832648, 0.6392157, 0, 1, 1,
0.7406595, 1.291833, 1.587281, 0.6431373, 0, 1, 1,
0.7461714, -0.7274215, 1.761018, 0.6509804, 0, 1, 1,
0.7472993, -1.134925, 3.205802, 0.654902, 0, 1, 1,
0.7506261, 1.374177, 1.839592, 0.6627451, 0, 1, 1,
0.7590968, 1.448368, 1.48629, 0.6666667, 0, 1, 1,
0.7611456, 0.3648614, 1.547117, 0.6745098, 0, 1, 1,
0.7640555, -0.8532901, 1.770332, 0.6784314, 0, 1, 1,
0.7647814, 1.255955, 0.07083669, 0.6862745, 0, 1, 1,
0.7680191, -0.7956997, 1.420383, 0.6901961, 0, 1, 1,
0.7684909, -0.5196399, 3.154174, 0.6980392, 0, 1, 1,
0.7704828, -0.6454244, 2.223741, 0.7058824, 0, 1, 1,
0.7741281, 0.796668, 0.5038794, 0.7098039, 0, 1, 1,
0.7741603, 0.6946403, 0.7690889, 0.7176471, 0, 1, 1,
0.778612, -0.2846505, 1.881183, 0.7215686, 0, 1, 1,
0.781539, -1.812508, 1.711881, 0.7294118, 0, 1, 1,
0.7820351, -0.08104084, 2.906278, 0.7333333, 0, 1, 1,
0.7835904, -0.4176149, 2.152022, 0.7411765, 0, 1, 1,
0.7850077, 0.2268855, 3.072959, 0.7450981, 0, 1, 1,
0.7871869, 0.3190743, 3.159029, 0.7529412, 0, 1, 1,
0.790528, 0.2934859, 0.5782072, 0.7568628, 0, 1, 1,
0.7932973, -0.001357342, 3.986989, 0.7647059, 0, 1, 1,
0.7942116, -0.991019, 3.190639, 0.7686275, 0, 1, 1,
0.7943985, 0.005868086, -0.4266918, 0.7764706, 0, 1, 1,
0.7946225, 0.2286448, -0.5499713, 0.7803922, 0, 1, 1,
0.7972896, -0.7044882, 1.639643, 0.7882353, 0, 1, 1,
0.7988318, -1.580583, 2.68089, 0.7921569, 0, 1, 1,
0.7998051, -0.8176228, 3.072052, 0.8, 0, 1, 1,
0.8005885, -0.2351999, 2.285991, 0.8078431, 0, 1, 1,
0.8018848, -0.05499569, 0.3361439, 0.8117647, 0, 1, 1,
0.8031048, -0.9602848, 2.523419, 0.8196079, 0, 1, 1,
0.8054107, -1.00289, 3.369923, 0.8235294, 0, 1, 1,
0.8077604, -0.6047151, 2.92417, 0.8313726, 0, 1, 1,
0.816748, -0.02651754, 2.786174, 0.8352941, 0, 1, 1,
0.8181022, -1.458517, 3.785298, 0.8431373, 0, 1, 1,
0.8193827, -0.6913422, 3.333222, 0.8470588, 0, 1, 1,
0.8230446, -0.3726137, 2.189618, 0.854902, 0, 1, 1,
0.8232098, 0.4540578, 2.687019, 0.8588235, 0, 1, 1,
0.8266521, -0.5262002, 2.897481, 0.8666667, 0, 1, 1,
0.8420113, 1.160864, 2.065017, 0.8705882, 0, 1, 1,
0.8532193, -0.9773879, 2.709401, 0.8784314, 0, 1, 1,
0.8565808, 1.536832, -0.9646024, 0.8823529, 0, 1, 1,
0.863147, -1.39555, 2.822706, 0.8901961, 0, 1, 1,
0.8659523, 0.2145266, 0.8754294, 0.8941177, 0, 1, 1,
0.8727643, 1.296005, -0.08760836, 0.9019608, 0, 1, 1,
0.8735525, -0.8191362, 2.35126, 0.9098039, 0, 1, 1,
0.8743595, 0.08024484, 1.518216, 0.9137255, 0, 1, 1,
0.8802611, 1.59758, 0.3613459, 0.9215686, 0, 1, 1,
0.8856902, -0.6767514, 1.683826, 0.9254902, 0, 1, 1,
0.8865288, -0.8591611, 2.681604, 0.9333333, 0, 1, 1,
0.8865378, -0.4847187, 0.8906824, 0.9372549, 0, 1, 1,
0.9047927, -2.025474, 2.513103, 0.945098, 0, 1, 1,
0.9083396, 1.064893, 0.7958293, 0.9490196, 0, 1, 1,
0.9099575, -0.9940251, 2.161052, 0.9568627, 0, 1, 1,
0.9148054, -0.4338432, 2.452875, 0.9607843, 0, 1, 1,
0.9281924, -0.6071999, 2.316147, 0.9686275, 0, 1, 1,
0.9283887, -1.356537, 3.519141, 0.972549, 0, 1, 1,
0.9349042, -0.6264453, 2.879068, 0.9803922, 0, 1, 1,
0.9451174, -1.109151, 4.388354, 0.9843137, 0, 1, 1,
0.9457843, 1.024932, 1.49253, 0.9921569, 0, 1, 1,
0.9584333, 0.427686, 1.599147, 0.9960784, 0, 1, 1,
0.96033, 1.164116, 1.214452, 1, 0, 0.9960784, 1,
0.9617661, 0.7826213, 1.285671, 1, 0, 0.9882353, 1,
0.9713804, -1.047485, 1.722162, 1, 0, 0.9843137, 1,
0.974524, -1.186144, 1.965057, 1, 0, 0.9764706, 1,
0.9749609, -1.316112, 3.915456, 1, 0, 0.972549, 1,
0.9774356, 1.45926, 2.253861, 1, 0, 0.9647059, 1,
0.9815144, 0.652889, 4.228899, 1, 0, 0.9607843, 1,
0.985653, -1.153215, 1.256176, 1, 0, 0.9529412, 1,
0.9886925, -0.7137363, 1.269863, 1, 0, 0.9490196, 1,
0.9888082, -2.232364, 1.327808, 1, 0, 0.9411765, 1,
0.9910237, -1.290905, 1.505746, 1, 0, 0.9372549, 1,
0.9935358, 0.7773294, -0.3820755, 1, 0, 0.9294118, 1,
1.015186, -1.560664, 4.611012, 1, 0, 0.9254902, 1,
1.019024, -1.501869, 3.158835, 1, 0, 0.9176471, 1,
1.021013, -0.7851005, 1.538786, 1, 0, 0.9137255, 1,
1.031964, 0.9594545, -0.767276, 1, 0, 0.9058824, 1,
1.034506, -0.07135943, 1.415261, 1, 0, 0.9019608, 1,
1.038241, 1.76439, 0.3648196, 1, 0, 0.8941177, 1,
1.038309, 1.006158, 1.230562, 1, 0, 0.8862745, 1,
1.04442, 0.9057887, 2.065564, 1, 0, 0.8823529, 1,
1.048811, -0.008017641, 1.452208, 1, 0, 0.8745098, 1,
1.051041, 0.9640563, 1.907374, 1, 0, 0.8705882, 1,
1.051416, -0.6872237, 2.462082, 1, 0, 0.8627451, 1,
1.05228, 0.1055615, 1.504704, 1, 0, 0.8588235, 1,
1.053129, 1.372029, 1.302452, 1, 0, 0.8509804, 1,
1.057804, 1.722591, 0.5939175, 1, 0, 0.8470588, 1,
1.059429, 0.08473376, 2.798376, 1, 0, 0.8392157, 1,
1.070331, -0.1836707, 2.641732, 1, 0, 0.8352941, 1,
1.088675, -0.1791633, 2.14188, 1, 0, 0.827451, 1,
1.092104, 1.762801, -0.1366503, 1, 0, 0.8235294, 1,
1.096396, 0.4433977, 0.7340602, 1, 0, 0.8156863, 1,
1.100372, 0.06386146, 2.184348, 1, 0, 0.8117647, 1,
1.101473, -1.094695, 2.146742, 1, 0, 0.8039216, 1,
1.104134, 1.993065, -1.239327, 1, 0, 0.7960784, 1,
1.104939, 0.1615328, 0.3325756, 1, 0, 0.7921569, 1,
1.111627, 0.1986029, 3.59633, 1, 0, 0.7843137, 1,
1.112166, 0.2017497, 0.5353113, 1, 0, 0.7803922, 1,
1.114058, 0.1084872, 1.624075, 1, 0, 0.772549, 1,
1.11528, -0.5956877, 2.939305, 1, 0, 0.7686275, 1,
1.128458, -0.3790208, 1.958576, 1, 0, 0.7607843, 1,
1.130463, 1.436425, 0.2940636, 1, 0, 0.7568628, 1,
1.135714, -0.6289464, 1.592119, 1, 0, 0.7490196, 1,
1.136859, 1.091602, 0.7705758, 1, 0, 0.7450981, 1,
1.166556, 0.390286, 1.838442, 1, 0, 0.7372549, 1,
1.166733, -1.745204, 2.147202, 1, 0, 0.7333333, 1,
1.17722, -0.2360116, 3.133187, 1, 0, 0.7254902, 1,
1.17882, 0.845023, 0.4345926, 1, 0, 0.7215686, 1,
1.186173, 0.7046259, 1.368288, 1, 0, 0.7137255, 1,
1.187276, 1.295259, 0.3204064, 1, 0, 0.7098039, 1,
1.18783, 0.07616561, 1.798327, 1, 0, 0.7019608, 1,
1.189225, 1.847329, -0.7230922, 1, 0, 0.6941177, 1,
1.198539, -0.4527797, 3.905184, 1, 0, 0.6901961, 1,
1.205667, -0.2760192, 3.376646, 1, 0, 0.682353, 1,
1.209283, 0.4690422, 1.610618, 1, 0, 0.6784314, 1,
1.219036, -0.3257436, 1.788247, 1, 0, 0.6705883, 1,
1.222007, -0.2586453, 2.330209, 1, 0, 0.6666667, 1,
1.230481, -0.3276895, 1.343811, 1, 0, 0.6588235, 1,
1.238333, 1.259039, 1.357498, 1, 0, 0.654902, 1,
1.245784, -0.4654939, 2.576497, 1, 0, 0.6470588, 1,
1.256086, 1.355783, -0.4966749, 1, 0, 0.6431373, 1,
1.256624, -0.9947293, 1.640491, 1, 0, 0.6352941, 1,
1.256826, 1.287344, 0.5531392, 1, 0, 0.6313726, 1,
1.258772, -0.8684722, 3.330757, 1, 0, 0.6235294, 1,
1.264872, 0.07880484, 1.377744, 1, 0, 0.6196079, 1,
1.267082, -0.7948451, 4.084029, 1, 0, 0.6117647, 1,
1.281577, 0.1758123, 1.048834, 1, 0, 0.6078432, 1,
1.290043, -0.9194891, 1.733814, 1, 0, 0.6, 1,
1.299186, -0.9019492, 2.862705, 1, 0, 0.5921569, 1,
1.300137, 1.818409, -0.7974604, 1, 0, 0.5882353, 1,
1.300562, 0.2707922, 1.734448, 1, 0, 0.5803922, 1,
1.305031, -2.777682, 2.767835, 1, 0, 0.5764706, 1,
1.310838, 1.782148, 0.1908358, 1, 0, 0.5686275, 1,
1.317145, -0.8699844, 2.162611, 1, 0, 0.5647059, 1,
1.32974, 1.099993, 2.738571, 1, 0, 0.5568628, 1,
1.343843, 2.279606, 0.5054415, 1, 0, 0.5529412, 1,
1.358278, 0.04547274, 3.242267, 1, 0, 0.5450981, 1,
1.359976, 1.192025, 1.682743, 1, 0, 0.5411765, 1,
1.360658, -0.168948, 1.350295, 1, 0, 0.5333334, 1,
1.361695, -0.6807697, 3.227895, 1, 0, 0.5294118, 1,
1.364164, 0.2769363, 0.9795001, 1, 0, 0.5215687, 1,
1.365363, 1.024738, -0.6194719, 1, 0, 0.5176471, 1,
1.369384, -0.8791044, 2.664318, 1, 0, 0.509804, 1,
1.381357, 0.9941188, 0.2897277, 1, 0, 0.5058824, 1,
1.386662, -1.567913, 1.139613, 1, 0, 0.4980392, 1,
1.386666, 2.133826, 0.6626085, 1, 0, 0.4901961, 1,
1.394331, 0.224573, 2.490822, 1, 0, 0.4862745, 1,
1.395551, -2.065645, 2.941966, 1, 0, 0.4784314, 1,
1.399304, -0.7477785, 2.351112, 1, 0, 0.4745098, 1,
1.405965, 0.2542436, 0.1448709, 1, 0, 0.4666667, 1,
1.420256, -1.174137, 2.479553, 1, 0, 0.4627451, 1,
1.42037, -0.6887367, 1.601099, 1, 0, 0.454902, 1,
1.423274, -0.4754883, 1.222506, 1, 0, 0.4509804, 1,
1.448083, -1.303478, 2.248968, 1, 0, 0.4431373, 1,
1.460054, 0.1533024, 3.241311, 1, 0, 0.4392157, 1,
1.460274, 1.741056, 2.80306, 1, 0, 0.4313726, 1,
1.466884, -0.6722462, 1.125846, 1, 0, 0.427451, 1,
1.478408, -1.650191, 3.311421, 1, 0, 0.4196078, 1,
1.492347, -0.5409875, 1.756757, 1, 0, 0.4156863, 1,
1.493793, 1.100606, 2.270543, 1, 0, 0.4078431, 1,
1.497725, -0.5910434, 0.2995627, 1, 0, 0.4039216, 1,
1.499576, -0.05714474, 0.7519847, 1, 0, 0.3960784, 1,
1.506312, -1.304346, 3.536664, 1, 0, 0.3882353, 1,
1.533113, -1.794101, 3.231129, 1, 0, 0.3843137, 1,
1.537072, 1.347087, -0.5645902, 1, 0, 0.3764706, 1,
1.537257, 0.474705, 2.85599, 1, 0, 0.372549, 1,
1.564278, -0.6073291, 3.776119, 1, 0, 0.3647059, 1,
1.582106, 0.6964536, 1.034364, 1, 0, 0.3607843, 1,
1.583483, 0.1874559, 2.913971, 1, 0, 0.3529412, 1,
1.588379, 0.7949632, 2.853858, 1, 0, 0.3490196, 1,
1.590664, 0.1768973, 0.8075168, 1, 0, 0.3411765, 1,
1.604662, 0.653273, 2.0844, 1, 0, 0.3372549, 1,
1.619008, 0.1386781, 1.199815, 1, 0, 0.3294118, 1,
1.62276, 0.9817207, 0.7835661, 1, 0, 0.3254902, 1,
1.625201, -1.029956, 1.459859, 1, 0, 0.3176471, 1,
1.627375, 1.243967, 1.446032, 1, 0, 0.3137255, 1,
1.628629, -0.6715546, 2.113858, 1, 0, 0.3058824, 1,
1.631479, 1.304277, 1.351697, 1, 0, 0.2980392, 1,
1.633582, 1.369397, -1.346476, 1, 0, 0.2941177, 1,
1.644358, 1.095669, 0.2063278, 1, 0, 0.2862745, 1,
1.644367, 1.597414, -0.1094634, 1, 0, 0.282353, 1,
1.655446, 0.2753013, 1.097411, 1, 0, 0.2745098, 1,
1.684391, 0.8110922, 1.805481, 1, 0, 0.2705882, 1,
1.694084, 0.8479595, 0.1984957, 1, 0, 0.2627451, 1,
1.716939, -0.301542, 0.7940559, 1, 0, 0.2588235, 1,
1.725954, -0.1833909, 1.023894, 1, 0, 0.2509804, 1,
1.732816, 1.455859, 0.7853119, 1, 0, 0.2470588, 1,
1.742064, 0.5951238, 1.517249, 1, 0, 0.2392157, 1,
1.756523, 0.7987521, 2.089895, 1, 0, 0.2352941, 1,
1.760536, -0.5531394, 3.384136, 1, 0, 0.227451, 1,
1.782679, -0.3791282, 1.471721, 1, 0, 0.2235294, 1,
1.812407, 1.471211, -0.3733221, 1, 0, 0.2156863, 1,
1.823701, -0.3746135, 2.441685, 1, 0, 0.2117647, 1,
1.839998, 1.242613, 0.4307428, 1, 0, 0.2039216, 1,
1.857418, 0.7225033, 1.705896, 1, 0, 0.1960784, 1,
1.862201, 0.421469, 1.175081, 1, 0, 0.1921569, 1,
1.864943, -0.3317344, 1.229424, 1, 0, 0.1843137, 1,
1.878935, -1.495352, 4.564234, 1, 0, 0.1803922, 1,
1.888578, 0.3543363, 1.856772, 1, 0, 0.172549, 1,
1.894034, 0.8465915, 1.663282, 1, 0, 0.1686275, 1,
1.934742, 0.5063097, -0.2632727, 1, 0, 0.1607843, 1,
1.937174, -1.639896, 1.61096, 1, 0, 0.1568628, 1,
1.954215, -0.9720519, 1.148289, 1, 0, 0.1490196, 1,
1.987663, 0.6321931, 1.64939, 1, 0, 0.145098, 1,
1.998789, -1.12307, 3.204124, 1, 0, 0.1372549, 1,
2.008441, -1.042222, 1.999073, 1, 0, 0.1333333, 1,
2.023921, -1.181537, 0.512014, 1, 0, 0.1254902, 1,
2.029639, 0.3042544, 3.67971, 1, 0, 0.1215686, 1,
2.080046, -0.3708353, 0.2570358, 1, 0, 0.1137255, 1,
2.148975, -0.992891, 2.179136, 1, 0, 0.1098039, 1,
2.157896, -1.987058, 2.776696, 1, 0, 0.1019608, 1,
2.192072, -1.395556, 1.556005, 1, 0, 0.09411765, 1,
2.226265, -1.409136, 2.687762, 1, 0, 0.09019608, 1,
2.247328, -0.2978825, 1.997269, 1, 0, 0.08235294, 1,
2.276716, 1.592247, -0.8599404, 1, 0, 0.07843138, 1,
2.316629, 0.4851081, 1.68933, 1, 0, 0.07058824, 1,
2.329673, 0.1319765, 1.883151, 1, 0, 0.06666667, 1,
2.363761, -1.149267, 1.735158, 1, 0, 0.05882353, 1,
2.365777, 0.1121256, 0.8704358, 1, 0, 0.05490196, 1,
2.490988, 0.4060736, 1.763687, 1, 0, 0.04705882, 1,
2.503024, 1.73126, -0.3027161, 1, 0, 0.04313726, 1,
2.523482, 0.07760496, 2.074972, 1, 0, 0.03529412, 1,
2.549839, 0.5869178, 1.803598, 1, 0, 0.03137255, 1,
2.572718, -0.1779133, 0.7653749, 1, 0, 0.02352941, 1,
2.637606, 0.0766622, 0.9806488, 1, 0, 0.01960784, 1,
2.860749, 0.6423465, 1.603796, 1, 0, 0.01176471, 1,
3.419304, 0.6142136, 1.535343, 1, 0, 0.007843138, 1
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
-0.1543176, -4.098859, -7.564565, 0, -0.5, 0.5, 0.5,
-0.1543176, -4.098859, -7.564565, 1, -0.5, 0.5, 0.5,
-0.1543176, -4.098859, -7.564565, 1, 1.5, 0.5, 0.5,
-0.1543176, -4.098859, -7.564565, 0, 1.5, 0.5, 0.5
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
-4.939397, 0.2231745, -7.564565, 0, -0.5, 0.5, 0.5,
-4.939397, 0.2231745, -7.564565, 1, -0.5, 0.5, 0.5,
-4.939397, 0.2231745, -7.564565, 1, 1.5, 0.5, 0.5,
-4.939397, 0.2231745, -7.564565, 0, 1.5, 0.5, 0.5
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
-4.939397, -4.098859, 0.1329739, 0, -0.5, 0.5, 0.5,
-4.939397, -4.098859, 0.1329739, 1, -0.5, 0.5, 0.5,
-4.939397, -4.098859, 0.1329739, 1, 1.5, 0.5, 0.5,
-4.939397, -4.098859, 0.1329739, 0, 1.5, 0.5, 0.5
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
-2, -3.101466, -5.78821,
2, -3.101466, -5.78821,
-2, -3.101466, -5.78821,
-2, -3.267699, -6.084269,
0, -3.101466, -5.78821,
0, -3.267699, -6.084269,
2, -3.101466, -5.78821,
2, -3.267699, -6.084269
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
"0",
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
-2, -3.600163, -6.676388, 0, -0.5, 0.5, 0.5,
-2, -3.600163, -6.676388, 1, -0.5, 0.5, 0.5,
-2, -3.600163, -6.676388, 1, 1.5, 0.5, 0.5,
-2, -3.600163, -6.676388, 0, 1.5, 0.5, 0.5,
0, -3.600163, -6.676388, 0, -0.5, 0.5, 0.5,
0, -3.600163, -6.676388, 1, -0.5, 0.5, 0.5,
0, -3.600163, -6.676388, 1, 1.5, 0.5, 0.5,
0, -3.600163, -6.676388, 0, 1.5, 0.5, 0.5,
2, -3.600163, -6.676388, 0, -0.5, 0.5, 0.5,
2, -3.600163, -6.676388, 1, -0.5, 0.5, 0.5,
2, -3.600163, -6.676388, 1, 1.5, 0.5, 0.5,
2, -3.600163, -6.676388, 0, 1.5, 0.5, 0.5
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
-3.835148, -3, -5.78821,
-3.835148, 3, -5.78821,
-3.835148, -3, -5.78821,
-4.019189, -3, -6.084269,
-3.835148, -2, -5.78821,
-4.019189, -2, -6.084269,
-3.835148, -1, -5.78821,
-4.019189, -1, -6.084269,
-3.835148, 0, -5.78821,
-4.019189, 0, -6.084269,
-3.835148, 1, -5.78821,
-4.019189, 1, -6.084269,
-3.835148, 2, -5.78821,
-4.019189, 2, -6.084269,
-3.835148, 3, -5.78821,
-4.019189, 3, -6.084269
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
-4.387272, -3, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, -3, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, -3, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, -3, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, -2, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, -2, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, -2, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, -2, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, -1, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, -1, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, -1, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, -1, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, 0, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, 0, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, 0, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, 0, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, 1, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, 1, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, 1, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, 1, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, 2, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, 2, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, 2, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, 2, -6.676388, 0, 1.5, 0.5, 0.5,
-4.387272, 3, -6.676388, 0, -0.5, 0.5, 0.5,
-4.387272, 3, -6.676388, 1, -0.5, 0.5, 0.5,
-4.387272, 3, -6.676388, 1, 1.5, 0.5, 0.5,
-4.387272, 3, -6.676388, 0, 1.5, 0.5, 0.5
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
-3.835148, -3.101466, -4,
-3.835148, -3.101466, 4,
-3.835148, -3.101466, -4,
-4.019189, -3.267699, -4,
-3.835148, -3.101466, -2,
-4.019189, -3.267699, -2,
-3.835148, -3.101466, 0,
-4.019189, -3.267699, 0,
-3.835148, -3.101466, 2,
-4.019189, -3.267699, 2,
-3.835148, -3.101466, 4,
-4.019189, -3.267699, 4
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
-4.387272, -3.600163, -4, 0, -0.5, 0.5, 0.5,
-4.387272, -3.600163, -4, 1, -0.5, 0.5, 0.5,
-4.387272, -3.600163, -4, 1, 1.5, 0.5, 0.5,
-4.387272, -3.600163, -4, 0, 1.5, 0.5, 0.5,
-4.387272, -3.600163, -2, 0, -0.5, 0.5, 0.5,
-4.387272, -3.600163, -2, 1, -0.5, 0.5, 0.5,
-4.387272, -3.600163, -2, 1, 1.5, 0.5, 0.5,
-4.387272, -3.600163, -2, 0, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 0, 0, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 0, 1, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 0, 1, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 0, 0, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 2, 0, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 2, 1, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 2, 1, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 2, 0, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 4, 0, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 4, 1, -0.5, 0.5, 0.5,
-4.387272, -3.600163, 4, 1, 1.5, 0.5, 0.5,
-4.387272, -3.600163, 4, 0, 1.5, 0.5, 0.5
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
-3.835148, -3.101466, -5.78821,
-3.835148, 3.547815, -5.78821,
-3.835148, -3.101466, 6.054158,
-3.835148, 3.547815, 6.054158,
-3.835148, -3.101466, -5.78821,
-3.835148, -3.101466, 6.054158,
-3.835148, 3.547815, -5.78821,
-3.835148, 3.547815, 6.054158,
-3.835148, -3.101466, -5.78821,
3.526513, -3.101466, -5.78821,
-3.835148, -3.101466, 6.054158,
3.526513, -3.101466, 6.054158,
-3.835148, 3.547815, -5.78821,
3.526513, 3.547815, -5.78821,
-3.835148, 3.547815, 6.054158,
3.526513, 3.547815, 6.054158,
3.526513, -3.101466, -5.78821,
3.526513, 3.547815, -5.78821,
3.526513, -3.101466, 6.054158,
3.526513, 3.547815, 6.054158,
3.526513, -3.101466, -5.78821,
3.526513, -3.101466, 6.054158,
3.526513, 3.547815, -5.78821,
3.526513, 3.547815, 6.054158
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
var radius = 8.24907;
var distance = 36.70104;
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
mvMatrix.translate( 0.1543176, -0.2231745, -0.1329739 );
mvMatrix.scale( 1.211555, 1.341356, 0.753148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.70104);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
2-dimethoxyphosphino<-read.table("2-dimethoxyphosphino.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-dimethoxyphosphino$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethoxyphosphino' not found
```

```r
y<-2-dimethoxyphosphino$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethoxyphosphino' not found
```

```r
z<-2-dimethoxyphosphino$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethoxyphosphino' not found
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
-3.727939, -0.4738879, -1.126441, 0, 0, 1, 1, 1,
-3.192573, 0.6223848, -1.540343, 1, 0, 0, 1, 1,
-3.120689, -1.768347, -0.9826393, 1, 0, 0, 1, 1,
-3.047087, 0.2162345, -1.233921, 1, 0, 0, 1, 1,
-2.940348, -1.790718, -0.9562137, 1, 0, 0, 1, 1,
-2.692188, 0.7120467, -1.984679, 1, 0, 0, 1, 1,
-2.689346, -0.3958996, -3.533157, 0, 0, 0, 1, 1,
-2.666471, -0.4464442, -1.738411, 0, 0, 0, 1, 1,
-2.577289, -0.7417905, -4.183382, 0, 0, 0, 1, 1,
-2.560322, 1.259579, -0.8073194, 0, 0, 0, 1, 1,
-2.511375, -0.3764012, -1.218541, 0, 0, 0, 1, 1,
-2.456781, 0.5795015, 0.9610893, 0, 0, 0, 1, 1,
-2.449858, -0.05636245, -1.696754, 0, 0, 0, 1, 1,
-2.411855, -0.8893524, -2.575863, 1, 1, 1, 1, 1,
-2.366853, -0.1122031, -1.268968, 1, 1, 1, 1, 1,
-2.300436, 0.2670207, -2.771059, 1, 1, 1, 1, 1,
-2.293502, -1.935532, -1.571834, 1, 1, 1, 1, 1,
-2.288074, 0.9389734, -0.03775027, 1, 1, 1, 1, 1,
-2.252148, 0.6470588, -1.462723, 1, 1, 1, 1, 1,
-2.214808, 0.7833142, -1.729163, 1, 1, 1, 1, 1,
-2.140916, 0.5154228, -0.5507827, 1, 1, 1, 1, 1,
-2.123976, -1.148138, -2.557501, 1, 1, 1, 1, 1,
-2.092879, -0.9298306, -2.049234, 1, 1, 1, 1, 1,
-2.071827, 0.5237048, -1.10103, 1, 1, 1, 1, 1,
-2.06521, 1.880753, 0.4909779, 1, 1, 1, 1, 1,
-2.063224, 1.695689, 1.212715, 1, 1, 1, 1, 1,
-2.043368, 0.8536834, -0.004420513, 1, 1, 1, 1, 1,
-2.032636, -2.931578, -2.284357, 1, 1, 1, 1, 1,
-2.023318, -0.5774165, -0.8959465, 0, 0, 1, 1, 1,
-2.01944, -0.9219934, -2.918599, 1, 0, 0, 1, 1,
-1.928891, 0.4712277, -0.5744963, 1, 0, 0, 1, 1,
-1.924063, 0.1702241, -0.3105558, 1, 0, 0, 1, 1,
-1.915497, 0.6021867, -0.8160277, 1, 0, 0, 1, 1,
-1.903701, -0.8618074, -2.567339, 1, 0, 0, 1, 1,
-1.878579, 0.1210614, -2.145578, 0, 0, 0, 1, 1,
-1.878268, 0.05894673, -1.552768, 0, 0, 0, 1, 1,
-1.876043, 1.606436, -2.805794, 0, 0, 0, 1, 1,
-1.870982, 0.999361, -2.036601, 0, 0, 0, 1, 1,
-1.856888, -0.4244027, -2.302395, 0, 0, 0, 1, 1,
-1.845763, 0.506254, -2.75688, 0, 0, 0, 1, 1,
-1.82589, -0.4654489, -2.218163, 0, 0, 0, 1, 1,
-1.809328, 1.595236, -0.4709854, 1, 1, 1, 1, 1,
-1.80691, 0.9421052, -2.283303, 1, 1, 1, 1, 1,
-1.768291, 2.242777, 0.2818858, 1, 1, 1, 1, 1,
-1.763999, -1.171372, -3.344136, 1, 1, 1, 1, 1,
-1.763411, 0.6237143, -0.7505931, 1, 1, 1, 1, 1,
-1.754069, 0.03898141, -1.632509, 1, 1, 1, 1, 1,
-1.745652, -1.168216, -3.250411, 1, 1, 1, 1, 1,
-1.7245, 1.231187, -1.246284, 1, 1, 1, 1, 1,
-1.718712, -1.217374, -2.721093, 1, 1, 1, 1, 1,
-1.708681, 0.6003127, -0.6324732, 1, 1, 1, 1, 1,
-1.698399, -0.03713028, -3.0184, 1, 1, 1, 1, 1,
-1.685, -0.3558994, -2.067437, 1, 1, 1, 1, 1,
-1.683693, -1.34999, -2.122746, 1, 1, 1, 1, 1,
-1.681451, 0.02249195, -2.701437, 1, 1, 1, 1, 1,
-1.676721, -0.7301207, -1.177508, 1, 1, 1, 1, 1,
-1.673237, -0.3748853, -1.118889, 0, 0, 1, 1, 1,
-1.673113, 1.115918, 0.06026372, 1, 0, 0, 1, 1,
-1.668201, 0.1201034, -0.582337, 1, 0, 0, 1, 1,
-1.659899, -0.4626538, -2.689096, 1, 0, 0, 1, 1,
-1.652822, 0.5569043, -3.814005, 1, 0, 0, 1, 1,
-1.648909, -2.295856, -3.70147, 1, 0, 0, 1, 1,
-1.636217, -1.528874, -3.724801, 0, 0, 0, 1, 1,
-1.618398, 1.396963, 0.5455509, 0, 0, 0, 1, 1,
-1.577479, 0.8020476, -0.1789595, 0, 0, 0, 1, 1,
-1.574583, -1.181369, -2.232415, 0, 0, 0, 1, 1,
-1.568794, -0.2522201, -0.8550115, 0, 0, 0, 1, 1,
-1.557232, 0.9035263, 0.04354255, 0, 0, 0, 1, 1,
-1.552867, 0.7333216, -0.3296153, 0, 0, 0, 1, 1,
-1.548215, 1.485355, -0.7744538, 1, 1, 1, 1, 1,
-1.547773, -0.08752681, -1.193691, 1, 1, 1, 1, 1,
-1.544723, -1.751931, -5.615748, 1, 1, 1, 1, 1,
-1.539012, 0.3661276, -0.594555, 1, 1, 1, 1, 1,
-1.536822, -0.331523, -0.4194109, 1, 1, 1, 1, 1,
-1.529849, -0.2829623, -4.388204, 1, 1, 1, 1, 1,
-1.510366, 1.473691, 0.1618668, 1, 1, 1, 1, 1,
-1.504528, -0.1573662, -2.100719, 1, 1, 1, 1, 1,
-1.497279, -0.8004507, -2.969203, 1, 1, 1, 1, 1,
-1.496643, 2.387944, 0.4081098, 1, 1, 1, 1, 1,
-1.49249, -0.7576491, -1.238706, 1, 1, 1, 1, 1,
-1.481459, -0.2151699, -3.042798, 1, 1, 1, 1, 1,
-1.470922, 0.1451439, -2.089383, 1, 1, 1, 1, 1,
-1.463066, -0.8721859, -1.693774, 1, 1, 1, 1, 1,
-1.451437, -0.8252815, -1.578977, 1, 1, 1, 1, 1,
-1.450894, 1.191347, -0.9127167, 0, 0, 1, 1, 1,
-1.434462, -0.503103, -0.5224282, 1, 0, 0, 1, 1,
-1.430334, 0.4469894, -1.133087, 1, 0, 0, 1, 1,
-1.427098, 0.8016297, 0.03657807, 1, 0, 0, 1, 1,
-1.422786, 0.5816424, -0.3578281, 1, 0, 0, 1, 1,
-1.418347, -0.7565553, -2.096021, 1, 0, 0, 1, 1,
-1.412487, -0.1802644, -2.736833, 0, 0, 0, 1, 1,
-1.41207, 1.6808, -3.047006, 0, 0, 0, 1, 1,
-1.407946, -1.965113, -1.827197, 0, 0, 0, 1, 1,
-1.399215, 1.017279, -0.5806267, 0, 0, 0, 1, 1,
-1.387054, -0.01158981, -2.669817, 0, 0, 0, 1, 1,
-1.384706, 1.508111, -0.02092907, 0, 0, 0, 1, 1,
-1.384647, -0.47265, -0.9291329, 0, 0, 0, 1, 1,
-1.382748, 1.254861, -0.1622429, 1, 1, 1, 1, 1,
-1.380695, 1.138503, -1.059435, 1, 1, 1, 1, 1,
-1.369276, 0.01362581, -2.507696, 1, 1, 1, 1, 1,
-1.35849, 0.7840672, -1.723251, 1, 1, 1, 1, 1,
-1.356105, 0.03012258, -1.703995, 1, 1, 1, 1, 1,
-1.355461, 1.758421, 0.9160479, 1, 1, 1, 1, 1,
-1.35183, 1.185998, -0.7583454, 1, 1, 1, 1, 1,
-1.348347, -0.04086179, -1.483185, 1, 1, 1, 1, 1,
-1.347046, 0.5798045, -0.276937, 1, 1, 1, 1, 1,
-1.342887, 0.3081708, -0.6423012, 1, 1, 1, 1, 1,
-1.342282, -0.3900908, -2.478328, 1, 1, 1, 1, 1,
-1.338595, -1.960461, -2.912211, 1, 1, 1, 1, 1,
-1.336219, 0.3922528, 0.1456835, 1, 1, 1, 1, 1,
-1.329482, 0.08101263, -0.8444511, 1, 1, 1, 1, 1,
-1.32287, -0.7327454, -0.5679671, 1, 1, 1, 1, 1,
-1.316928, 0.2501548, -3.145526, 0, 0, 1, 1, 1,
-1.306449, 0.2770928, -0.2236, 1, 0, 0, 1, 1,
-1.296928, 0.3070977, -1.101187, 1, 0, 0, 1, 1,
-1.295715, -1.446096, -1.896949, 1, 0, 0, 1, 1,
-1.282742, -0.8171667, -3.833922, 1, 0, 0, 1, 1,
-1.279178, -0.7182031, -1.015213, 1, 0, 0, 1, 1,
-1.278573, -0.04393705, -1.59834, 0, 0, 0, 1, 1,
-1.273654, -0.6260862, -3.371777, 0, 0, 0, 1, 1,
-1.26226, -0.7685398, -1.955227, 0, 0, 0, 1, 1,
-1.260332, -0.01104254, -3.017027, 0, 0, 0, 1, 1,
-1.244941, -1.255004, -2.568672, 0, 0, 0, 1, 1,
-1.23189, 2.124141, -1.356694, 0, 0, 0, 1, 1,
-1.231475, -0.09046986, -1.133959, 0, 0, 0, 1, 1,
-1.225728, -0.1250511, -2.498591, 1, 1, 1, 1, 1,
-1.214632, 2.496037, -0.3094994, 1, 1, 1, 1, 1,
-1.210215, 0.4213951, -3.649106, 1, 1, 1, 1, 1,
-1.201032, 1.473208, -1.401049, 1, 1, 1, 1, 1,
-1.200863, 2.366457, -1.607774, 1, 1, 1, 1, 1,
-1.197812, 0.7252664, -0.4683003, 1, 1, 1, 1, 1,
-1.191521, -0.0927914, -0.3917047, 1, 1, 1, 1, 1,
-1.189912, -0.03891456, 0.1126651, 1, 1, 1, 1, 1,
-1.183844, 0.8333095, -0.9190452, 1, 1, 1, 1, 1,
-1.182646, -0.3431364, -0.4368211, 1, 1, 1, 1, 1,
-1.18116, 0.005994514, -2.672996, 1, 1, 1, 1, 1,
-1.178401, -1.086383, -2.678738, 1, 1, 1, 1, 1,
-1.174153, 1.938303, 2.166097, 1, 1, 1, 1, 1,
-1.168318, 1.703439, 0.1148663, 1, 1, 1, 1, 1,
-1.157218, 0.9123626, -1.09407, 1, 1, 1, 1, 1,
-1.156053, -0.06883775, -0.6547667, 0, 0, 1, 1, 1,
-1.15549, 0.1334602, -2.453998, 1, 0, 0, 1, 1,
-1.152664, 0.6441401, -1.729833, 1, 0, 0, 1, 1,
-1.147508, 0.6723157, 0.09560301, 1, 0, 0, 1, 1,
-1.146724, -0.3298283, -2.529673, 1, 0, 0, 1, 1,
-1.139508, -0.4947401, -1.950149, 1, 0, 0, 1, 1,
-1.139467, 0.7189335, -0.5089165, 0, 0, 0, 1, 1,
-1.136115, -0.2597853, -3.878917, 0, 0, 0, 1, 1,
-1.134207, -0.0837179, -2.730214, 0, 0, 0, 1, 1,
-1.129456, -0.6337371, -1.527098, 0, 0, 0, 1, 1,
-1.120261, 1.478255, -1.133636, 0, 0, 0, 1, 1,
-1.119092, -0.1939905, -0.5341607, 0, 0, 0, 1, 1,
-1.118481, 0.2720385, -3.03053, 0, 0, 0, 1, 1,
-1.115866, -0.9813839, -1.717051, 1, 1, 1, 1, 1,
-1.113604, -0.1205963, -2.060739, 1, 1, 1, 1, 1,
-1.108456, 0.683176, 1.045904, 1, 1, 1, 1, 1,
-1.102014, 1.544656, -1.790476, 1, 1, 1, 1, 1,
-1.101915, -0.6414731, -3.214204, 1, 1, 1, 1, 1,
-1.091218, 2.499256, -2.922346, 1, 1, 1, 1, 1,
-1.09079, -1.392632, -3.640318, 1, 1, 1, 1, 1,
-1.078243, 0.5826561, -1.761149, 1, 1, 1, 1, 1,
-1.074269, 0.4134428, -2.703307, 1, 1, 1, 1, 1,
-1.069167, 1.843909, 1.267278, 1, 1, 1, 1, 1,
-1.053102, 1.304542, -0.9771036, 1, 1, 1, 1, 1,
-1.051648, -1.137176, -0.8155941, 1, 1, 1, 1, 1,
-1.043934, 0.6263525, -0.6226451, 1, 1, 1, 1, 1,
-1.041264, -0.003472532, -3.190954, 1, 1, 1, 1, 1,
-1.039316, 1.566123, 0.525444, 1, 1, 1, 1, 1,
-1.038132, 1.108675, -0.2508183, 0, 0, 1, 1, 1,
-1.033617, 0.8608122, -0.4245737, 1, 0, 0, 1, 1,
-1.026449, 0.4451399, 0.04148741, 1, 0, 0, 1, 1,
-1.013486, -0.699338, -3.723656, 1, 0, 0, 1, 1,
-1.012715, -0.5941767, -0.875065, 1, 0, 0, 1, 1,
-1.008262, 2.027396, -0.4857339, 1, 0, 0, 1, 1,
-1.004147, 1.194706, -0.4089539, 0, 0, 0, 1, 1,
-1.002568, -1.268298, -2.717841, 0, 0, 0, 1, 1,
-1.002193, -0.4476695, 0.9313959, 0, 0, 0, 1, 1,
-0.9947546, 0.2664248, -2.17913, 0, 0, 0, 1, 1,
-0.9809623, -1.125682, -4.03072, 0, 0, 0, 1, 1,
-0.9771702, -0.6749099, -2.234027, 0, 0, 0, 1, 1,
-0.9656078, -1.203954, -4.450946, 0, 0, 0, 1, 1,
-0.96403, 1.59225, -1.806178, 1, 1, 1, 1, 1,
-0.9623887, 0.04387705, -0.5267465, 1, 1, 1, 1, 1,
-0.9476452, -0.09368609, -1.132794, 1, 1, 1, 1, 1,
-0.9460194, 0.4786864, -1.146661, 1, 1, 1, 1, 1,
-0.9424998, -0.610982, -4.025732, 1, 1, 1, 1, 1,
-0.9420965, 0.628186, 0.09571773, 1, 1, 1, 1, 1,
-0.9415262, -1.287869, -3.25755, 1, 1, 1, 1, 1,
-0.93026, -0.9547016, -2.337424, 1, 1, 1, 1, 1,
-0.9278818, -1.116898, -1.227044, 1, 1, 1, 1, 1,
-0.9252095, -0.6246781, -2.242604, 1, 1, 1, 1, 1,
-0.9214026, 0.3650338, -2.341298, 1, 1, 1, 1, 1,
-0.9138777, 1.231579, -1.256924, 1, 1, 1, 1, 1,
-0.9079599, 0.8724898, 2.832114, 1, 1, 1, 1, 1,
-0.9077202, -1.587795, -2.395711, 1, 1, 1, 1, 1,
-0.8996117, -0.2503448, -1.866782, 1, 1, 1, 1, 1,
-0.8969972, 0.02700762, -1.301534, 0, 0, 1, 1, 1,
-0.8965707, 0.7119198, -0.4066788, 1, 0, 0, 1, 1,
-0.8876029, -0.6240953, -3.018161, 1, 0, 0, 1, 1,
-0.8816325, -1.197436, -1.469324, 1, 0, 0, 1, 1,
-0.875414, 1.692028, 0.2948583, 1, 0, 0, 1, 1,
-0.8731695, -0.6881773, -2.116856, 1, 0, 0, 1, 1,
-0.8609239, -1.208827, -2.916575, 0, 0, 0, 1, 1,
-0.8506172, -0.2300462, -0.4878195, 0, 0, 0, 1, 1,
-0.8462659, -0.529424, -3.6338, 0, 0, 0, 1, 1,
-0.8366079, 0.01648691, -0.9072213, 0, 0, 0, 1, 1,
-0.8345543, -0.3014401, -0.5656733, 0, 0, 0, 1, 1,
-0.8209209, 0.5558321, -0.6655836, 0, 0, 0, 1, 1,
-0.8206913, -0.7131628, -4.179634, 0, 0, 0, 1, 1,
-0.814763, -1.818394, -3.788679, 1, 1, 1, 1, 1,
-0.7870533, 0.219964, -0.9518891, 1, 1, 1, 1, 1,
-0.7772226, 0.8244768, 0.003232936, 1, 1, 1, 1, 1,
-0.7718661, 0.5829105, -0.6969378, 1, 1, 1, 1, 1,
-0.7617027, -0.09569976, -2.043309, 1, 1, 1, 1, 1,
-0.7603474, -0.8308147, -2.324559, 1, 1, 1, 1, 1,
-0.7570966, -0.7106495, -2.869799, 1, 1, 1, 1, 1,
-0.756182, -0.04366038, -0.3370955, 1, 1, 1, 1, 1,
-0.7526758, -2.251088, -2.094817, 1, 1, 1, 1, 1,
-0.7511039, 0.9074792, -0.2303827, 1, 1, 1, 1, 1,
-0.7500066, 0.3012459, -1.836578, 1, 1, 1, 1, 1,
-0.7466946, 0.445009, -1.353967, 1, 1, 1, 1, 1,
-0.7401347, 1.494935, 0.8750003, 1, 1, 1, 1, 1,
-0.739327, 0.509579, 0.57595, 1, 1, 1, 1, 1,
-0.7388416, -0.4207382, -2.418735, 1, 1, 1, 1, 1,
-0.736284, 0.4522023, -0.008385334, 0, 0, 1, 1, 1,
-0.7279388, -0.1423152, -3.324359, 1, 0, 0, 1, 1,
-0.7261766, 1.130412, -0.07087804, 1, 0, 0, 1, 1,
-0.7212846, 0.1064142, 0.1489189, 1, 0, 0, 1, 1,
-0.7194226, 1.287939, -0.2382586, 1, 0, 0, 1, 1,
-0.7131075, -0.043388, -1.781677, 1, 0, 0, 1, 1,
-0.7070985, 1.434553, -0.7599713, 0, 0, 0, 1, 1,
-0.7032109, -1.720501, -3.856736, 0, 0, 0, 1, 1,
-0.6969228, -0.3592291, -1.691779, 0, 0, 0, 1, 1,
-0.6940724, -0.5187172, -2.507746, 0, 0, 0, 1, 1,
-0.6940498, 0.1233535, -2.569994, 0, 0, 0, 1, 1,
-0.6933053, -0.5853714, -0.9865986, 0, 0, 0, 1, 1,
-0.6854456, 0.2906786, 0.09234414, 0, 0, 0, 1, 1,
-0.6753129, -0.2147321, -2.766073, 1, 1, 1, 1, 1,
-0.6721866, -0.8514323, -4.845266, 1, 1, 1, 1, 1,
-0.6701295, 1.464315, 1.091753, 1, 1, 1, 1, 1,
-0.6701129, -0.5470939, -3.201538, 1, 1, 1, 1, 1,
-0.6620451, -0.1876147, -2.734806, 1, 1, 1, 1, 1,
-0.6606996, 0.412479, -1.869141, 1, 1, 1, 1, 1,
-0.6591768, -0.4560674, -2.567264, 1, 1, 1, 1, 1,
-0.6519045, -0.4349479, -2.365972, 1, 1, 1, 1, 1,
-0.6490258, 1.861656, -0.1413531, 1, 1, 1, 1, 1,
-0.6430203, 0.4786609, -2.486164, 1, 1, 1, 1, 1,
-0.637999, -1.80893, -3.076047, 1, 1, 1, 1, 1,
-0.6342602, -2.54078, -1.411648, 1, 1, 1, 1, 1,
-0.633642, 1.391592, -0.2705809, 1, 1, 1, 1, 1,
-0.6325346, -1.57106, -2.457589, 1, 1, 1, 1, 1,
-0.6323622, 1.175744, 0.2914761, 1, 1, 1, 1, 1,
-0.6216412, -1.076219, -3.391762, 0, 0, 1, 1, 1,
-0.6164292, -1.355061, -1.920158, 1, 0, 0, 1, 1,
-0.615265, 0.06154896, 0.2841776, 1, 0, 0, 1, 1,
-0.6055012, 1.139161, 0.3435266, 1, 0, 0, 1, 1,
-0.6054272, -0.171441, -3.045122, 1, 0, 0, 1, 1,
-0.6027464, 0.7050558, -1.067771, 1, 0, 0, 1, 1,
-0.5940378, 0.1915015, -1.890297, 0, 0, 0, 1, 1,
-0.5888293, -0.4109825, -1.107005, 0, 0, 0, 1, 1,
-0.5813913, -0.7938023, -2.857648, 0, 0, 0, 1, 1,
-0.5804384, 1.929929, -0.7817855, 0, 0, 0, 1, 1,
-0.5799804, 2.285284, -1.405627, 0, 0, 0, 1, 1,
-0.5744793, 0.9683521, 0.3823681, 0, 0, 0, 1, 1,
-0.5727664, 1.301425, -1.32598, 0, 0, 0, 1, 1,
-0.5718378, 2.028997, 0.4763772, 1, 1, 1, 1, 1,
-0.57174, -1.104116, -3.086118, 1, 1, 1, 1, 1,
-0.5710598, -0.7810578, -2.133677, 1, 1, 1, 1, 1,
-0.5698869, -1.046527, -2.566046, 1, 1, 1, 1, 1,
-0.5693524, -0.8544605, -2.929773, 1, 1, 1, 1, 1,
-0.5670256, 1.643111, -1.439001, 1, 1, 1, 1, 1,
-0.5652352, -0.144728, -3.719856, 1, 1, 1, 1, 1,
-0.564259, 0.5104915, -0.5644606, 1, 1, 1, 1, 1,
-0.5627997, 2.368013, 1.398911, 1, 1, 1, 1, 1,
-0.5601399, 0.6337612, -1.667458, 1, 1, 1, 1, 1,
-0.5509882, -1.443807, -3.002322, 1, 1, 1, 1, 1,
-0.5476032, 0.8268942, 1.510786, 1, 1, 1, 1, 1,
-0.5452718, -0.192547, -2.956342, 1, 1, 1, 1, 1,
-0.5424297, 1.242652, 0.5860809, 1, 1, 1, 1, 1,
-0.5406947, -0.559882, -4.296364, 1, 1, 1, 1, 1,
-0.5287328, 1.526086, -0.152111, 0, 0, 1, 1, 1,
-0.5257915, -0.7122058, -2.068815, 1, 0, 0, 1, 1,
-0.5257744, 0.5844132, -1.286189, 1, 0, 0, 1, 1,
-0.5120225, 1.802964, -1.394935, 1, 0, 0, 1, 1,
-0.5064061, 0.6824728, 0.2266158, 1, 0, 0, 1, 1,
-0.5021056, -1.161143, -2.415947, 1, 0, 0, 1, 1,
-0.5012787, 0.179686, -1.879069, 0, 0, 0, 1, 1,
-0.4999246, 1.495174, 0.4924821, 0, 0, 0, 1, 1,
-0.4990571, -0.1897826, -1.992106, 0, 0, 0, 1, 1,
-0.4963269, -1.590116, -3.710436, 0, 0, 0, 1, 1,
-0.4937947, 0.4190387, 0.8540834, 0, 0, 0, 1, 1,
-0.4921059, 0.06554139, -0.7261857, 0, 0, 0, 1, 1,
-0.4918417, -1.433328, -3.950277, 0, 0, 0, 1, 1,
-0.4891557, 0.09668517, -3.231238, 1, 1, 1, 1, 1,
-0.4879334, -0.07231022, -0.8923985, 1, 1, 1, 1, 1,
-0.4834231, 0.4692874, -1.588227, 1, 1, 1, 1, 1,
-0.4713585, 1.460112, -3.211812, 1, 1, 1, 1, 1,
-0.4641335, 0.1657914, 0.1092513, 1, 1, 1, 1, 1,
-0.4637864, 0.8696494, -1.110601, 1, 1, 1, 1, 1,
-0.4628201, 0.2293997, 0.2718152, 1, 1, 1, 1, 1,
-0.4618565, -0.7858877, -2.547092, 1, 1, 1, 1, 1,
-0.459975, -1.975116, -3.487459, 1, 1, 1, 1, 1,
-0.4581439, -1.280687, -2.770562, 1, 1, 1, 1, 1,
-0.4566649, 0.936173, -1.115857, 1, 1, 1, 1, 1,
-0.4558117, 0.5000322, -0.5571263, 1, 1, 1, 1, 1,
-0.455433, 1.215574, 0.1084109, 1, 1, 1, 1, 1,
-0.4507074, -0.577674, -1.594021, 1, 1, 1, 1, 1,
-0.4506387, -0.7454648, -4.078018, 1, 1, 1, 1, 1,
-0.4501626, 0.3582177, 0.5010858, 0, 0, 1, 1, 1,
-0.4501235, -0.4984426, -3.581921, 1, 0, 0, 1, 1,
-0.450003, -1.054213, -2.974064, 1, 0, 0, 1, 1,
-0.4467322, -0.8638957, -1.738405, 1, 0, 0, 1, 1,
-0.4393094, -1.702691, -3.615162, 1, 0, 0, 1, 1,
-0.4376356, 0.06329653, -2.043051, 1, 0, 0, 1, 1,
-0.4368629, -0.6128032, -2.313282, 0, 0, 0, 1, 1,
-0.4360995, -0.0754059, -1.938374, 0, 0, 0, 1, 1,
-0.4351071, -0.943142, -3.79933, 0, 0, 0, 1, 1,
-0.4319499, -0.1729015, -2.265665, 0, 0, 0, 1, 1,
-0.4303347, 0.8404113, -1.032231, 0, 0, 0, 1, 1,
-0.4299553, -1.734895, -3.158691, 0, 0, 0, 1, 1,
-0.4290887, -0.3328527, -1.774267, 0, 0, 0, 1, 1,
-0.4286041, -0.1626956, -0.4846237, 1, 1, 1, 1, 1,
-0.4241429, -0.3664486, -1.718931, 1, 1, 1, 1, 1,
-0.4234163, -0.3611214, -1.927315, 1, 1, 1, 1, 1,
-0.4230004, -1.007155, -2.810873, 1, 1, 1, 1, 1,
-0.4227574, 0.02059082, -2.9388, 1, 1, 1, 1, 1,
-0.4200803, -1.010149, -3.156754, 1, 1, 1, 1, 1,
-0.4144528, -1.572206, -2.336264, 1, 1, 1, 1, 1,
-0.4138705, 0.4551894, -0.2134895, 1, 1, 1, 1, 1,
-0.4114165, 0.3368003, -2.343094, 1, 1, 1, 1, 1,
-0.4049164, -1.251569, -3.150959, 1, 1, 1, 1, 1,
-0.3986864, -0.1986922, -2.244704, 1, 1, 1, 1, 1,
-0.3942502, -0.5274968, -2.526117, 1, 1, 1, 1, 1,
-0.3886453, -0.2084496, -2.986571, 1, 1, 1, 1, 1,
-0.3853809, 1.040178, -0.8935807, 1, 1, 1, 1, 1,
-0.3853534, -0.2610197, -3.264493, 1, 1, 1, 1, 1,
-0.3806693, -0.3579177, -0.6776327, 0, 0, 1, 1, 1,
-0.3739348, 0.5480105, -0.7575386, 1, 0, 0, 1, 1,
-0.3729426, 2.798772, -1.087619, 1, 0, 0, 1, 1,
-0.3718991, 0.9647903, -0.7047301, 1, 0, 0, 1, 1,
-0.3663723, 0.6201381, -1.007817, 1, 0, 0, 1, 1,
-0.3655074, -1.058848, -4.130815, 1, 0, 0, 1, 1,
-0.3624296, 1.856155, -0.338721, 0, 0, 0, 1, 1,
-0.3606895, -0.7529299, -2.251725, 0, 0, 0, 1, 1,
-0.3572524, 0.7793896, -0.1883079, 0, 0, 0, 1, 1,
-0.3564883, 1.096279, 0.0841599, 0, 0, 0, 1, 1,
-0.3559664, 1.59033, -0.2602541, 0, 0, 0, 1, 1,
-0.3542889, -0.248252, -2.21641, 0, 0, 0, 1, 1,
-0.3470374, -0.3786294, -1.931776, 0, 0, 0, 1, 1,
-0.3449373, -0.5665181, -1.882144, 1, 1, 1, 1, 1,
-0.3437476, -0.7138434, -3.043627, 1, 1, 1, 1, 1,
-0.3411044, -0.523086, -1.909283, 1, 1, 1, 1, 1,
-0.3391079, -0.7280813, -4.793177, 1, 1, 1, 1, 1,
-0.3340053, 0.7501923, -2.343046, 1, 1, 1, 1, 1,
-0.3325883, -0.08902694, -1.733953, 1, 1, 1, 1, 1,
-0.3323407, -2.131206, -1.652672, 1, 1, 1, 1, 1,
-0.3320413, 1.254466, -0.2462658, 1, 1, 1, 1, 1,
-0.33121, -0.1957141, -0.0267409, 1, 1, 1, 1, 1,
-0.3308002, 0.5945218, -1.134404, 1, 1, 1, 1, 1,
-0.3295546, 0.6965601, 0.3300335, 1, 1, 1, 1, 1,
-0.3274285, 1.065946, -0.2582765, 1, 1, 1, 1, 1,
-0.3266062, 1.253255, -0.5007822, 1, 1, 1, 1, 1,
-0.3260234, -1.229954, -1.780119, 1, 1, 1, 1, 1,
-0.3223093, 0.3332311, -1.248167, 1, 1, 1, 1, 1,
-0.3221759, -1.349147, -3.945764, 0, 0, 1, 1, 1,
-0.3194026, -0.1941587, -4.610206, 1, 0, 0, 1, 1,
-0.315457, 0.9263052, -0.3918605, 1, 0, 0, 1, 1,
-0.3133917, 1.173203, 1.333157, 1, 0, 0, 1, 1,
-0.3098518, 0.1537754, -3.18979, 1, 0, 0, 1, 1,
-0.3098145, -0.5076212, -3.753426, 1, 0, 0, 1, 1,
-0.3048127, -0.8172686, -3.644116, 0, 0, 0, 1, 1,
-0.2992561, 0.06898972, -2.728977, 0, 0, 0, 1, 1,
-0.297767, -0.1669097, -2.224906, 0, 0, 0, 1, 1,
-0.2892031, 1.481754, -0.4105946, 0, 0, 0, 1, 1,
-0.2887182, 0.9379834, 0.4699494, 0, 0, 0, 1, 1,
-0.2879055, -1.136128, -4.887027, 0, 0, 0, 1, 1,
-0.2877343, -1.368336, -3.997679, 0, 0, 0, 1, 1,
-0.287381, 1.060158, -1.723768, 1, 1, 1, 1, 1,
-0.2859088, -1.253098, -3.582211, 1, 1, 1, 1, 1,
-0.2841069, 0.357562, -0.5113076, 1, 1, 1, 1, 1,
-0.2837403, 1.743888, 0.470001, 1, 1, 1, 1, 1,
-0.2831728, 1.676908, -0.318707, 1, 1, 1, 1, 1,
-0.2772777, 0.8638909, 0.587731, 1, 1, 1, 1, 1,
-0.2757842, -0.6510203, -3.232211, 1, 1, 1, 1, 1,
-0.2740915, 0.6577324, -1.169619, 1, 1, 1, 1, 1,
-0.2736683, -0.9792562, -3.070012, 1, 1, 1, 1, 1,
-0.2708533, 1.173194, 0.4843344, 1, 1, 1, 1, 1,
-0.2698624, 0.5157676, -1.291419, 1, 1, 1, 1, 1,
-0.2646517, -0.2712674, -1.933839, 1, 1, 1, 1, 1,
-0.2581239, -0.904319, -3.132712, 1, 1, 1, 1, 1,
-0.2565512, 0.4348463, -0.1597014, 1, 1, 1, 1, 1,
-0.2516146, -3.004632, -4.341067, 1, 1, 1, 1, 1,
-0.2510405, 0.7061681, -1.847964, 0, 0, 1, 1, 1,
-0.2483103, -0.2478123, -2.154804, 1, 0, 0, 1, 1,
-0.2452086, -0.7353548, -3.324842, 1, 0, 0, 1, 1,
-0.2430874, 0.7604093, -0.654354, 1, 0, 0, 1, 1,
-0.2422867, -0.1163476, -2.985794, 1, 0, 0, 1, 1,
-0.2408284, -0.328279, -2.740127, 1, 0, 0, 1, 1,
-0.2397585, 1.916856, -1.14804, 0, 0, 0, 1, 1,
-0.2393588, 1.727406, -0.4668357, 0, 0, 0, 1, 1,
-0.2388888, -0.937219, -1.204328, 0, 0, 0, 1, 1,
-0.2365492, 0.2154706, -0.2482784, 0, 0, 0, 1, 1,
-0.2332371, 3.260226, -0.9102423, 0, 0, 0, 1, 1,
-0.2287332, 1.11134, 1.321885, 0, 0, 0, 1, 1,
-0.2286616, 1.027455, -0.2656353, 0, 0, 0, 1, 1,
-0.2277843, -1.38394, -2.682465, 1, 1, 1, 1, 1,
-0.2272731, -0.3342125, -3.113785, 1, 1, 1, 1, 1,
-0.2267876, -0.8709273, -3.072877, 1, 1, 1, 1, 1,
-0.2267259, -0.1059416, -2.465641, 1, 1, 1, 1, 1,
-0.2264764, -0.4575574, -2.881946, 1, 1, 1, 1, 1,
-0.2244497, -0.6663433, -3.465514, 1, 1, 1, 1, 1,
-0.2229995, -1.892514, -3.489181, 1, 1, 1, 1, 1,
-0.2228788, 0.2594559, -0.9869114, 1, 1, 1, 1, 1,
-0.2200854, 1.407624, -0.3406646, 1, 1, 1, 1, 1,
-0.2174008, -0.6933085, -2.160995, 1, 1, 1, 1, 1,
-0.2109626, -1.071427, -2.007862, 1, 1, 1, 1, 1,
-0.2078433, -1.002302, -1.205866, 1, 1, 1, 1, 1,
-0.2054258, -1.63856, -3.691078, 1, 1, 1, 1, 1,
-0.203203, -0.9090703, -2.241164, 1, 1, 1, 1, 1,
-0.2027281, 0.2474001, 0.2706133, 1, 1, 1, 1, 1,
-0.1965414, -0.07305992, -1.587061, 0, 0, 1, 1, 1,
-0.1953513, -1.692321, -3.785642, 1, 0, 0, 1, 1,
-0.1932478, 0.585052, 0.251824, 1, 0, 0, 1, 1,
-0.1927205, -0.416179, -3.7799, 1, 0, 0, 1, 1,
-0.1915557, -1.741079, -1.629644, 1, 0, 0, 1, 1,
-0.1905598, 0.001586646, -2.747488, 1, 0, 0, 1, 1,
-0.1894276, -0.6917549, -2.37717, 0, 0, 0, 1, 1,
-0.1841192, 0.3720293, -0.6772265, 0, 0, 0, 1, 1,
-0.1837703, -0.6594819, -4.509394, 0, 0, 0, 1, 1,
-0.1827294, 0.8542002, -1.348651, 0, 0, 0, 1, 1,
-0.1811054, 0.1951555, -1.324612, 0, 0, 0, 1, 1,
-0.1760208, -0.679028, -3.663203, 0, 0, 0, 1, 1,
-0.1727725, 1.041779, -0.08940949, 0, 0, 0, 1, 1,
-0.1715493, -0.5232941, -3.958162, 1, 1, 1, 1, 1,
-0.1694422, -0.2967593, -5.179378, 1, 1, 1, 1, 1,
-0.1671547, -0.7029032, -3.207485, 1, 1, 1, 1, 1,
-0.1657445, -0.4742182, -3.365687, 1, 1, 1, 1, 1,
-0.1569144, -0.08463658, -1.896031, 1, 1, 1, 1, 1,
-0.1526739, 1.380752, 1.222564, 1, 1, 1, 1, 1,
-0.1508542, -0.2784754, -2.285399, 1, 1, 1, 1, 1,
-0.1484356, -1.078554, -2.454751, 1, 1, 1, 1, 1,
-0.146978, -2.43454, -3.040501, 1, 1, 1, 1, 1,
-0.1469733, -0.09700794, -3.262118, 1, 1, 1, 1, 1,
-0.1465591, 0.3107981, -0.005621547, 1, 1, 1, 1, 1,
-0.1388849, -0.05689328, -2.106396, 1, 1, 1, 1, 1,
-0.1375388, 1.820607, -1.701981, 1, 1, 1, 1, 1,
-0.1352186, -0.6861407, -2.803041, 1, 1, 1, 1, 1,
-0.1325137, 0.6349224, -1.601716, 1, 1, 1, 1, 1,
-0.1313441, -1.038649, -3.467356, 0, 0, 1, 1, 1,
-0.1303635, 1.058153, -1.254501, 1, 0, 0, 1, 1,
-0.1292689, 0.8297244, 0.3676126, 1, 0, 0, 1, 1,
-0.1285448, -0.7477019, -2.080203, 1, 0, 0, 1, 1,
-0.1252925, -1.730039, -4.622241, 1, 0, 0, 1, 1,
-0.1190896, -0.3034597, -2.90466, 1, 0, 0, 1, 1,
-0.1153588, 0.04906718, -0.5604355, 0, 0, 0, 1, 1,
-0.1151074, 0.5595275, -2.569135, 0, 0, 0, 1, 1,
-0.1075582, -0.922767, -3.657526, 0, 0, 0, 1, 1,
-0.101528, 0.6029723, -1.165424, 0, 0, 0, 1, 1,
-0.1008424, 0.5410067, -1.597724, 0, 0, 0, 1, 1,
-0.09764727, -0.5923907, -3.848153, 0, 0, 0, 1, 1,
-0.09763667, 0.2221092, -0.1522951, 0, 0, 0, 1, 1,
-0.09674115, -0.8184234, -3.737822, 1, 1, 1, 1, 1,
-0.09647086, -0.22783, -2.891837, 1, 1, 1, 1, 1,
-0.0958939, 2.42071, 0.8584612, 1, 1, 1, 1, 1,
-0.09478808, -1.17513, -4.802629, 1, 1, 1, 1, 1,
-0.09035254, -2.007913, -3.373164, 1, 1, 1, 1, 1,
-0.08716593, -0.4165294, -2.608924, 1, 1, 1, 1, 1,
-0.0849791, -0.3018222, -0.9212025, 1, 1, 1, 1, 1,
-0.08216426, -0.6732625, -3.656619, 1, 1, 1, 1, 1,
-0.07995752, -0.07013594, -2.627939, 1, 1, 1, 1, 1,
-0.07908805, 1.111656, 0.04307871, 1, 1, 1, 1, 1,
-0.07856209, -1.84538, -1.415917, 1, 1, 1, 1, 1,
-0.07676519, -0.5782428, -2.232665, 1, 1, 1, 1, 1,
-0.07652526, 1.076618, -0.8611476, 1, 1, 1, 1, 1,
-0.07633067, -1.356743, -3.051298, 1, 1, 1, 1, 1,
-0.06916532, -0.3626546, -3.786059, 1, 1, 1, 1, 1,
-0.06702615, 2.009385, 0.1705657, 0, 0, 1, 1, 1,
-0.06642663, 1.360504, -0.2425558, 1, 0, 0, 1, 1,
-0.06330026, -0.3204545, -2.011528, 1, 0, 0, 1, 1,
-0.06172604, 0.1633514, -0.4959923, 1, 0, 0, 1, 1,
-0.06144087, -0.3224926, -4.739046, 1, 0, 0, 1, 1,
-0.06099389, 1.094286, -0.7824553, 1, 0, 0, 1, 1,
-0.05895498, 1.045883, -1.094137, 0, 0, 0, 1, 1,
-0.0552376, 0.1065915, 1.108646, 0, 0, 0, 1, 1,
-0.05132188, -1.204974, -3.760468, 0, 0, 0, 1, 1,
-0.05007168, 1.131797, -0.5467587, 0, 0, 0, 1, 1,
-0.04644896, 1.125893, 2.282318, 0, 0, 0, 1, 1,
-0.04375397, -0.7226669, -2.150968, 0, 0, 0, 1, 1,
-0.04275058, -0.5571207, -4.176381, 0, 0, 0, 1, 1,
-0.04040753, 0.252861, -1.345706, 1, 1, 1, 1, 1,
-0.0369058, -1.519247, -2.642455, 1, 1, 1, 1, 1,
-0.03237642, -0.919807, -3.893943, 1, 1, 1, 1, 1,
-0.03070975, 0.65772, 0.9949281, 1, 1, 1, 1, 1,
-0.02663433, 1.300765, 0.198603, 1, 1, 1, 1, 1,
-0.02648096, 1.434679, -1.159765, 1, 1, 1, 1, 1,
-0.02239485, 0.06867639, -1.053926, 1, 1, 1, 1, 1,
-0.01906343, 1.276173, -0.3150461, 1, 1, 1, 1, 1,
-0.01657509, 0.06746358, -0.2371414, 1, 1, 1, 1, 1,
-0.01451788, -0.4360352, -4.036567, 1, 1, 1, 1, 1,
-0.01352718, -0.6598102, -4.524404, 1, 1, 1, 1, 1,
-0.0005331696, -0.09130345, -2.668023, 1, 1, 1, 1, 1,
0.00134424, -0.1206791, 1.571265, 1, 1, 1, 1, 1,
0.001964024, -1.584521, 3.67952, 1, 1, 1, 1, 1,
0.002249698, -1.000827, 5.270736, 1, 1, 1, 1, 1,
0.008099017, 1.260592, 0.9781798, 0, 0, 1, 1, 1,
0.01350861, -1.256989, 2.343464, 1, 0, 0, 1, 1,
0.01394347, -0.3193131, 2.881013, 1, 0, 0, 1, 1,
0.01564664, -1.855761, 4.467227, 1, 0, 0, 1, 1,
0.01583267, -0.03289569, 2.155253, 1, 0, 0, 1, 1,
0.01834481, 3.450981, -0.4497865, 1, 0, 0, 1, 1,
0.01913404, 0.3406324, -0.2534475, 0, 0, 0, 1, 1,
0.0223104, -0.02812734, 4.122705, 0, 0, 0, 1, 1,
0.03231368, -0.1932705, 4.709914, 0, 0, 0, 1, 1,
0.03778652, -0.5362587, 2.261691, 0, 0, 0, 1, 1,
0.03996694, -0.08412196, 1.541779, 0, 0, 0, 1, 1,
0.04217242, 1.155095, 0.6115732, 0, 0, 0, 1, 1,
0.04380764, 0.02990839, -0.01019956, 0, 0, 0, 1, 1,
0.04839471, -0.4272687, 2.948431, 1, 1, 1, 1, 1,
0.0490985, 0.6221446, 0.03837483, 1, 1, 1, 1, 1,
0.06126837, 0.6129652, 1.153165, 1, 1, 1, 1, 1,
0.06585541, 0.5001113, -1.442063, 1, 1, 1, 1, 1,
0.06888159, -0.09399884, 3.530551, 1, 1, 1, 1, 1,
0.07264175, -1.268264, 2.07602, 1, 1, 1, 1, 1,
0.07269909, 0.4162079, -0.3695775, 1, 1, 1, 1, 1,
0.07272161, 1.688862, -2.143462, 1, 1, 1, 1, 1,
0.07292613, 0.1095442, 0.4984885, 1, 1, 1, 1, 1,
0.07375944, 0.9870924, 0.4434615, 1, 1, 1, 1, 1,
0.07459018, 0.9644726, 0.8943138, 1, 1, 1, 1, 1,
0.07476383, 0.6093924, 0.1406488, 1, 1, 1, 1, 1,
0.07519711, 1.576537, -0.2203126, 1, 1, 1, 1, 1,
0.07598252, -0.9301112, 2.929135, 1, 1, 1, 1, 1,
0.07936592, 0.4240366, -0.2338715, 1, 1, 1, 1, 1,
0.08177241, -0.9468497, 2.715094, 0, 0, 1, 1, 1,
0.08339017, 2.941137, 0.9089154, 1, 0, 0, 1, 1,
0.08358908, -1.884529, 3.220568, 1, 0, 0, 1, 1,
0.08360212, -1.620049, 3.648432, 1, 0, 0, 1, 1,
0.08563938, 0.3407837, 0.2626874, 1, 0, 0, 1, 1,
0.08901675, -0.9089543, 3.677971, 1, 0, 0, 1, 1,
0.09860667, 0.6914238, 1.812217, 0, 0, 0, 1, 1,
0.1012593, -0.6622546, 1.366639, 0, 0, 0, 1, 1,
0.1024703, 0.2100699, 1.73936, 0, 0, 0, 1, 1,
0.1033921, 0.005444785, 2.073415, 0, 0, 0, 1, 1,
0.1044348, -0.3017323, 3.798588, 0, 0, 0, 1, 1,
0.1067864, -1.580946, 2.288246, 0, 0, 0, 1, 1,
0.1076029, -0.7348373, 3.085606, 0, 0, 0, 1, 1,
0.1227487, -0.3345957, 2.57236, 1, 1, 1, 1, 1,
0.123517, 0.3453958, -0.04895763, 1, 1, 1, 1, 1,
0.1257917, -0.4973312, 2.710372, 1, 1, 1, 1, 1,
0.1264849, 0.3089796, 1.595034, 1, 1, 1, 1, 1,
0.127222, -0.8249822, 3.522976, 1, 1, 1, 1, 1,
0.1311546, -0.3417709, 2.200679, 1, 1, 1, 1, 1,
0.1351032, -0.4261096, 2.461107, 1, 1, 1, 1, 1,
0.1373043, 1.533361, -0.7934704, 1, 1, 1, 1, 1,
0.1375179, -0.625174, 2.967584, 1, 1, 1, 1, 1,
0.1391794, -0.9496236, 4.011391, 1, 1, 1, 1, 1,
0.139845, -0.7806575, 4.618639, 1, 1, 1, 1, 1,
0.1428075, -0.6831803, 3.406244, 1, 1, 1, 1, 1,
0.1468195, 1.033294, 0.7743266, 1, 1, 1, 1, 1,
0.1475328, -0.378779, 5.028345, 1, 1, 1, 1, 1,
0.1476402, -0.5459606, 2.660503, 1, 1, 1, 1, 1,
0.1483605, 1.307792, -0.4363145, 0, 0, 1, 1, 1,
0.1494007, 0.2679778, 0.1843997, 1, 0, 0, 1, 1,
0.1496451, -0.07734063, 3.311775, 1, 0, 0, 1, 1,
0.1504959, -1.445881, 4.205205, 1, 0, 0, 1, 1,
0.1547839, 0.03507069, 1.758976, 1, 0, 0, 1, 1,
0.1553535, 0.7063223, -1.998093, 1, 0, 0, 1, 1,
0.15646, -1.781213, 1.749624, 0, 0, 0, 1, 1,
0.1626402, 0.6610234, -1.062829, 0, 0, 0, 1, 1,
0.1634701, 0.3967564, -0.653185, 0, 0, 0, 1, 1,
0.1663669, -0.3722113, 2.21398, 0, 0, 0, 1, 1,
0.1752566, 1.279747, 1.352386, 0, 0, 0, 1, 1,
0.1775223, -0.4383106, 1.598149, 0, 0, 0, 1, 1,
0.1889043, 1.606138, -1.352199, 0, 0, 0, 1, 1,
0.1890527, 0.1811964, 0.004087767, 1, 1, 1, 1, 1,
0.1890819, -0.6178124, 1.73529, 1, 1, 1, 1, 1,
0.1904972, -1.468977, 1.114992, 1, 1, 1, 1, 1,
0.1917583, 0.1275012, 1.645429, 1, 1, 1, 1, 1,
0.1934576, -0.5593815, 4.187941, 1, 1, 1, 1, 1,
0.1939734, 0.3190807, 1.820105, 1, 1, 1, 1, 1,
0.1990166, 0.5394908, 1.44469, 1, 1, 1, 1, 1,
0.2031224, -0.1479172, 1.252707, 1, 1, 1, 1, 1,
0.2067329, -1.274266, 4.632493, 1, 1, 1, 1, 1,
0.2136502, 0.2494551, 0.2442618, 1, 1, 1, 1, 1,
0.2154827, -0.5606555, 4.419463, 1, 1, 1, 1, 1,
0.2187468, 0.3628502, 0.6154941, 1, 1, 1, 1, 1,
0.220146, 1.526236, -0.4112515, 1, 1, 1, 1, 1,
0.2297848, -0.1919066, 1.729857, 1, 1, 1, 1, 1,
0.2314841, -0.6004483, 3.258625, 1, 1, 1, 1, 1,
0.2330354, -1.142781, 3.135068, 0, 0, 1, 1, 1,
0.2343493, -1.570614, 3.667663, 1, 0, 0, 1, 1,
0.2351889, -1.506601, 4.421666, 1, 0, 0, 1, 1,
0.2377227, -0.4013915, 2.817662, 1, 0, 0, 1, 1,
0.2409044, -0.3127836, 4.288909, 1, 0, 0, 1, 1,
0.2426132, -0.9173241, 4.086494, 1, 0, 0, 1, 1,
0.2447982, 1.764451, 0.3610033, 0, 0, 0, 1, 1,
0.2467467, 0.3653188, -0.6262723, 0, 0, 0, 1, 1,
0.2487287, -0.7503642, 2.526202, 0, 0, 0, 1, 1,
0.2513183, -0.4300901, 3.679092, 0, 0, 0, 1, 1,
0.2513846, -0.6659588, 4.359559, 0, 0, 0, 1, 1,
0.2514852, 1.258797, -0.8273793, 0, 0, 0, 1, 1,
0.2522496, 2.039645, 0.309032, 0, 0, 0, 1, 1,
0.2597984, 0.5389692, -0.3631798, 1, 1, 1, 1, 1,
0.2620034, 0.4521107, 0.1005132, 1, 1, 1, 1, 1,
0.2634529, -0.4785392, 3.450609, 1, 1, 1, 1, 1,
0.2667363, -0.2671573, 2.68603, 1, 1, 1, 1, 1,
0.2690395, -0.8695305, 2.490845, 1, 1, 1, 1, 1,
0.2697205, -0.2650536, 1.434601, 1, 1, 1, 1, 1,
0.2702031, -0.7066999, 2.665405, 1, 1, 1, 1, 1,
0.2707804, 1.965589, 0.481137, 1, 1, 1, 1, 1,
0.2733592, -1.792972, 2.505308, 1, 1, 1, 1, 1,
0.2736767, 1.904648, -0.2926922, 1, 1, 1, 1, 1,
0.2738498, -0.5718194, 1.197716, 1, 1, 1, 1, 1,
0.2741886, -0.2417411, 1.973, 1, 1, 1, 1, 1,
0.2777153, -0.07229769, 0.5128997, 1, 1, 1, 1, 1,
0.2778592, 0.565115, -0.8477266, 1, 1, 1, 1, 1,
0.2800671, 1.177482, 0.08494881, 1, 1, 1, 1, 1,
0.281331, 1.113393, -0.7307306, 0, 0, 1, 1, 1,
0.2846318, -1.403946, 2.794284, 1, 0, 0, 1, 1,
0.285162, -0.9714316, 0.6800007, 1, 0, 0, 1, 1,
0.2874509, 0.9717426, -0.2466048, 1, 0, 0, 1, 1,
0.288171, 1.418627, 1.244556, 1, 0, 0, 1, 1,
0.2909053, 0.1123193, 1.800274, 1, 0, 0, 1, 1,
0.2951523, -0.4782875, 3.081153, 0, 0, 0, 1, 1,
0.2959439, -0.6798639, 2.155951, 0, 0, 0, 1, 1,
0.2982486, -0.9463875, 2.43548, 0, 0, 0, 1, 1,
0.298836, 0.9293272, -0.6325768, 0, 0, 0, 1, 1,
0.2994702, -1.405316, 2.467976, 0, 0, 0, 1, 1,
0.3009142, -0.02150109, 2.167063, 0, 0, 0, 1, 1,
0.3141885, 1.164414, -0.3779303, 0, 0, 0, 1, 1,
0.3171503, 0.8830211, 0.5420377, 1, 1, 1, 1, 1,
0.3211476, -1.415625, 2.610864, 1, 1, 1, 1, 1,
0.3221595, 0.6213456, 1.458988, 1, 1, 1, 1, 1,
0.3238989, 0.8277009, 0.9657211, 1, 1, 1, 1, 1,
0.3242547, 0.003790113, 1.459502, 1, 1, 1, 1, 1,
0.325716, 1.293942, 1.325143, 1, 1, 1, 1, 1,
0.3282187, 1.042299, -0.7352133, 1, 1, 1, 1, 1,
0.3283296, -0.5157104, 1.968439, 1, 1, 1, 1, 1,
0.3383199, 0.120239, 1.462784, 1, 1, 1, 1, 1,
0.3390613, -1.003278, 3.772219, 1, 1, 1, 1, 1,
0.3419656, 0.2850383, 0.5871614, 1, 1, 1, 1, 1,
0.3443389, -0.2123589, 1.862907, 1, 1, 1, 1, 1,
0.3457695, 0.4824671, 0.4966019, 1, 1, 1, 1, 1,
0.3494735, 0.4967754, 1.856597, 1, 1, 1, 1, 1,
0.3494974, 1.058555, 2.140791, 1, 1, 1, 1, 1,
0.3520724, -0.5108265, 3.080268, 0, 0, 1, 1, 1,
0.3532547, 0.3343085, -0.9791604, 1, 0, 0, 1, 1,
0.3557021, -0.06138623, 1.453847, 1, 0, 0, 1, 1,
0.3572733, 1.244148, 0.4455075, 1, 0, 0, 1, 1,
0.3577725, 0.1020456, 1.229575, 1, 0, 0, 1, 1,
0.3594328, -1.635148, 3.633437, 1, 0, 0, 1, 1,
0.363443, -0.4725851, 2.506799, 0, 0, 0, 1, 1,
0.3635911, 0.2915162, 1.518826, 0, 0, 0, 1, 1,
0.3643757, -0.9658058, 3.817708, 0, 0, 0, 1, 1,
0.3732603, -0.2502822, 1.762963, 0, 0, 0, 1, 1,
0.3781737, -0.1127136, 1.553383, 0, 0, 0, 1, 1,
0.3854902, 1.114711, 0.8760768, 0, 0, 0, 1, 1,
0.3860478, 0.1239611, 1.778372, 0, 0, 0, 1, 1,
0.3910043, -0.4707079, 2.075989, 1, 1, 1, 1, 1,
0.3983486, -0.754303, 2.546137, 1, 1, 1, 1, 1,
0.4008653, 0.3987832, -0.6218739, 1, 1, 1, 1, 1,
0.4011021, 0.3223115, 1.55954, 1, 1, 1, 1, 1,
0.4066722, -1.619594, 3.501198, 1, 1, 1, 1, 1,
0.4089246, -0.1480094, 1.82909, 1, 1, 1, 1, 1,
0.4154729, -1.141507, 0.9136423, 1, 1, 1, 1, 1,
0.4195548, -0.1003348, 2.307322, 1, 1, 1, 1, 1,
0.4206201, 0.2990288, 2.582042, 1, 1, 1, 1, 1,
0.4218572, 1.026925, 0.1292654, 1, 1, 1, 1, 1,
0.4222963, 0.5794607, 0.787733, 1, 1, 1, 1, 1,
0.4238205, -0.2316426, 3.12695, 1, 1, 1, 1, 1,
0.4259748, -1.582435, 2.278707, 1, 1, 1, 1, 1,
0.4288613, 0.9137158, -0.6217996, 1, 1, 1, 1, 1,
0.43287, 0.9554637, 0.1016648, 1, 1, 1, 1, 1,
0.4361792, -0.8499528, 3.03653, 0, 0, 1, 1, 1,
0.4384464, -0.5619939, 1.755515, 1, 0, 0, 1, 1,
0.4465295, -0.3415863, 3.837752, 1, 0, 0, 1, 1,
0.4486811, -0.7357635, 3.818171, 1, 0, 0, 1, 1,
0.4506657, -0.9086529, 2.564595, 1, 0, 0, 1, 1,
0.4541854, -0.3191587, 1.698123, 1, 0, 0, 1, 1,
0.4561576, 0.01306404, 1.333324, 0, 0, 0, 1, 1,
0.4561641, 0.3293026, 0.8489546, 0, 0, 0, 1, 1,
0.4611987, 0.820406, 1.41296, 0, 0, 0, 1, 1,
0.4619496, 0.4047083, 1.716159, 0, 0, 0, 1, 1,
0.4626189, 1.015456, -1.503821, 0, 0, 0, 1, 1,
0.4631537, 1.252346, -1.082295, 0, 0, 0, 1, 1,
0.4724714, 1.705951, 1.285349, 0, 0, 0, 1, 1,
0.478045, 0.9262139, 1.294387, 1, 1, 1, 1, 1,
0.4782771, 1.275545, 0.8033518, 1, 1, 1, 1, 1,
0.4792727, 0.5344071, 0.4613218, 1, 1, 1, 1, 1,
0.4812899, 0.312042, 1.012706, 1, 1, 1, 1, 1,
0.4861646, 0.9921244, 0.9543241, 1, 1, 1, 1, 1,
0.4864242, 1.694176, -1.347008, 1, 1, 1, 1, 1,
0.490255, 0.8452986, 1.333688, 1, 1, 1, 1, 1,
0.4911182, 0.1722212, 0.4332155, 1, 1, 1, 1, 1,
0.4912701, 0.3901066, 0.3610461, 1, 1, 1, 1, 1,
0.4962965, -1.799509, 3.829894, 1, 1, 1, 1, 1,
0.4979071, -2.041623, 3.091151, 1, 1, 1, 1, 1,
0.4988673, 0.7524671, -0.5063449, 1, 1, 1, 1, 1,
0.50001, 2.200628, 0.9189016, 1, 1, 1, 1, 1,
0.5041788, 0.6644794, 0.8063179, 1, 1, 1, 1, 1,
0.5077539, -0.7968466, 1.065603, 1, 1, 1, 1, 1,
0.511372, 0.6504325, 0.03573604, 0, 0, 1, 1, 1,
0.5126665, -1.3612, 3.397241, 1, 0, 0, 1, 1,
0.5135939, 1.637747, 0.5808284, 1, 0, 0, 1, 1,
0.5146454, 0.5690467, 1.138815, 1, 0, 0, 1, 1,
0.519664, -0.0170406, 0.7488847, 1, 0, 0, 1, 1,
0.5211601, 0.2821023, 0.5901281, 1, 0, 0, 1, 1,
0.5268635, -1.562786, 2.729336, 0, 0, 0, 1, 1,
0.5299116, -1.227471, 2.884491, 0, 0, 0, 1, 1,
0.5303262, -0.5875331, 1.476246, 0, 0, 0, 1, 1,
0.5323499, -0.233564, 2.371674, 0, 0, 0, 1, 1,
0.5339687, -0.9302195, 1.965284, 0, 0, 0, 1, 1,
0.5393226, 0.3074512, 1.283174, 0, 0, 0, 1, 1,
0.5405101, 0.4181544, 1.37311, 0, 0, 0, 1, 1,
0.5582732, 0.3050651, 2.43643, 1, 1, 1, 1, 1,
0.559993, 0.3657188, 0.954931, 1, 1, 1, 1, 1,
0.5624632, -0.055878, 1.273163, 1, 1, 1, 1, 1,
0.56349, -1.190414, 3.206109, 1, 1, 1, 1, 1,
0.5635214, -1.068675, 3.198055, 1, 1, 1, 1, 1,
0.5685089, 0.1913189, -0.2451758, 1, 1, 1, 1, 1,
0.5721336, -1.474051, 3.424581, 1, 1, 1, 1, 1,
0.5734543, 0.4359504, 2.732298, 1, 1, 1, 1, 1,
0.582663, -1.633201, 4.167792, 1, 1, 1, 1, 1,
0.5902895, 1.307508, -0.7234926, 1, 1, 1, 1, 1,
0.5916228, -0.2024977, 2.596513, 1, 1, 1, 1, 1,
0.593253, -1.42371, 5.881696, 1, 1, 1, 1, 1,
0.5941073, 0.8635625, 0.753056, 1, 1, 1, 1, 1,
0.5951344, -0.5535074, 0.8857012, 1, 1, 1, 1, 1,
0.6027754, -0.5548087, 3.131139, 1, 1, 1, 1, 1,
0.6045529, 1.047037, 0.1698658, 0, 0, 1, 1, 1,
0.6052091, 0.2937114, 0.7467541, 1, 0, 0, 1, 1,
0.6052312, 0.6198655, 1.565345, 1, 0, 0, 1, 1,
0.6056497, 2.42837, -0.604202, 1, 0, 0, 1, 1,
0.6056968, -0.8395719, 2.974395, 1, 0, 0, 1, 1,
0.6169763, -2.121497, 4.298813, 1, 0, 0, 1, 1,
0.6201004, 0.397031, 0.2751091, 0, 0, 0, 1, 1,
0.6234969, 0.3248169, -1.184013, 0, 0, 0, 1, 1,
0.635253, -0.9719031, 2.65838, 0, 0, 0, 1, 1,
0.6377068, 0.9036461, 0.3142383, 0, 0, 0, 1, 1,
0.639935, 0.6814885, 1.115242, 0, 0, 0, 1, 1,
0.6469679, -1.698777, 4.045321, 0, 0, 0, 1, 1,
0.6480514, -0.8310573, 3.834903, 0, 0, 0, 1, 1,
0.6483661, 1.971351, -0.9444913, 1, 1, 1, 1, 1,
0.6520151, -1.446705, 4.518101, 1, 1, 1, 1, 1,
0.6552603, -0.9175591, 0.2270644, 1, 1, 1, 1, 1,
0.6564924, 1.467319, -1.281625, 1, 1, 1, 1, 1,
0.660593, 0.2742699, 0.1114678, 1, 1, 1, 1, 1,
0.6610394, 0.7570494, 0.6351976, 1, 1, 1, 1, 1,
0.6617208, 1.655327, -1.263714, 1, 1, 1, 1, 1,
0.6623616, 0.5218793, 0.2665069, 1, 1, 1, 1, 1,
0.6629974, 1.540297, 2.39309, 1, 1, 1, 1, 1,
0.6630314, 1.904308, 0.05017986, 1, 1, 1, 1, 1,
0.663853, 1.088205, 0.429731, 1, 1, 1, 1, 1,
0.6675375, 0.90435, -0.08177481, 1, 1, 1, 1, 1,
0.6702152, 0.558866, 2.327193, 1, 1, 1, 1, 1,
0.6732255, 1.167071, 2.057943, 1, 1, 1, 1, 1,
0.6755751, -0.9159265, 1.752622, 1, 1, 1, 1, 1,
0.6756659, 1.11992, 2.296002, 0, 0, 1, 1, 1,
0.6794753, -0.08823273, 3.142488, 1, 0, 0, 1, 1,
0.6912022, 0.1143286, -1.602277, 1, 0, 0, 1, 1,
0.6921622, -0.1413887, 1.1412, 1, 0, 0, 1, 1,
0.6974966, 0.07449654, 2.558789, 1, 0, 0, 1, 1,
0.7007877, -1.030004, 2.715896, 1, 0, 0, 1, 1,
0.7010179, 0.8506036, -1.075111, 0, 0, 0, 1, 1,
0.7020023, 1.23244, 3.094546, 0, 0, 0, 1, 1,
0.7025638, 0.155028, 0.6743059, 0, 0, 0, 1, 1,
0.7032093, -0.5435824, 3.339801, 0, 0, 0, 1, 1,
0.7129577, -0.7059345, 3.088487, 0, 0, 0, 1, 1,
0.7283658, -0.5848171, 3.23151, 0, 0, 0, 1, 1,
0.7315212, 0.4690201, 0.5962639, 0, 0, 0, 1, 1,
0.7324029, -0.8097034, 2.596677, 1, 1, 1, 1, 1,
0.7332803, -1.626171, 3.141202, 1, 1, 1, 1, 1,
0.7334724, -0.6608428, 1.310488, 1, 1, 1, 1, 1,
0.7343209, 0.7298739, 2.754246, 1, 1, 1, 1, 1,
0.7367489, -0.08074514, 1.832648, 1, 1, 1, 1, 1,
0.7406595, 1.291833, 1.587281, 1, 1, 1, 1, 1,
0.7461714, -0.7274215, 1.761018, 1, 1, 1, 1, 1,
0.7472993, -1.134925, 3.205802, 1, 1, 1, 1, 1,
0.7506261, 1.374177, 1.839592, 1, 1, 1, 1, 1,
0.7590968, 1.448368, 1.48629, 1, 1, 1, 1, 1,
0.7611456, 0.3648614, 1.547117, 1, 1, 1, 1, 1,
0.7640555, -0.8532901, 1.770332, 1, 1, 1, 1, 1,
0.7647814, 1.255955, 0.07083669, 1, 1, 1, 1, 1,
0.7680191, -0.7956997, 1.420383, 1, 1, 1, 1, 1,
0.7684909, -0.5196399, 3.154174, 1, 1, 1, 1, 1,
0.7704828, -0.6454244, 2.223741, 0, 0, 1, 1, 1,
0.7741281, 0.796668, 0.5038794, 1, 0, 0, 1, 1,
0.7741603, 0.6946403, 0.7690889, 1, 0, 0, 1, 1,
0.778612, -0.2846505, 1.881183, 1, 0, 0, 1, 1,
0.781539, -1.812508, 1.711881, 1, 0, 0, 1, 1,
0.7820351, -0.08104084, 2.906278, 1, 0, 0, 1, 1,
0.7835904, -0.4176149, 2.152022, 0, 0, 0, 1, 1,
0.7850077, 0.2268855, 3.072959, 0, 0, 0, 1, 1,
0.7871869, 0.3190743, 3.159029, 0, 0, 0, 1, 1,
0.790528, 0.2934859, 0.5782072, 0, 0, 0, 1, 1,
0.7932973, -0.001357342, 3.986989, 0, 0, 0, 1, 1,
0.7942116, -0.991019, 3.190639, 0, 0, 0, 1, 1,
0.7943985, 0.005868086, -0.4266918, 0, 0, 0, 1, 1,
0.7946225, 0.2286448, -0.5499713, 1, 1, 1, 1, 1,
0.7972896, -0.7044882, 1.639643, 1, 1, 1, 1, 1,
0.7988318, -1.580583, 2.68089, 1, 1, 1, 1, 1,
0.7998051, -0.8176228, 3.072052, 1, 1, 1, 1, 1,
0.8005885, -0.2351999, 2.285991, 1, 1, 1, 1, 1,
0.8018848, -0.05499569, 0.3361439, 1, 1, 1, 1, 1,
0.8031048, -0.9602848, 2.523419, 1, 1, 1, 1, 1,
0.8054107, -1.00289, 3.369923, 1, 1, 1, 1, 1,
0.8077604, -0.6047151, 2.92417, 1, 1, 1, 1, 1,
0.816748, -0.02651754, 2.786174, 1, 1, 1, 1, 1,
0.8181022, -1.458517, 3.785298, 1, 1, 1, 1, 1,
0.8193827, -0.6913422, 3.333222, 1, 1, 1, 1, 1,
0.8230446, -0.3726137, 2.189618, 1, 1, 1, 1, 1,
0.8232098, 0.4540578, 2.687019, 1, 1, 1, 1, 1,
0.8266521, -0.5262002, 2.897481, 1, 1, 1, 1, 1,
0.8420113, 1.160864, 2.065017, 0, 0, 1, 1, 1,
0.8532193, -0.9773879, 2.709401, 1, 0, 0, 1, 1,
0.8565808, 1.536832, -0.9646024, 1, 0, 0, 1, 1,
0.863147, -1.39555, 2.822706, 1, 0, 0, 1, 1,
0.8659523, 0.2145266, 0.8754294, 1, 0, 0, 1, 1,
0.8727643, 1.296005, -0.08760836, 1, 0, 0, 1, 1,
0.8735525, -0.8191362, 2.35126, 0, 0, 0, 1, 1,
0.8743595, 0.08024484, 1.518216, 0, 0, 0, 1, 1,
0.8802611, 1.59758, 0.3613459, 0, 0, 0, 1, 1,
0.8856902, -0.6767514, 1.683826, 0, 0, 0, 1, 1,
0.8865288, -0.8591611, 2.681604, 0, 0, 0, 1, 1,
0.8865378, -0.4847187, 0.8906824, 0, 0, 0, 1, 1,
0.9047927, -2.025474, 2.513103, 0, 0, 0, 1, 1,
0.9083396, 1.064893, 0.7958293, 1, 1, 1, 1, 1,
0.9099575, -0.9940251, 2.161052, 1, 1, 1, 1, 1,
0.9148054, -0.4338432, 2.452875, 1, 1, 1, 1, 1,
0.9281924, -0.6071999, 2.316147, 1, 1, 1, 1, 1,
0.9283887, -1.356537, 3.519141, 1, 1, 1, 1, 1,
0.9349042, -0.6264453, 2.879068, 1, 1, 1, 1, 1,
0.9451174, -1.109151, 4.388354, 1, 1, 1, 1, 1,
0.9457843, 1.024932, 1.49253, 1, 1, 1, 1, 1,
0.9584333, 0.427686, 1.599147, 1, 1, 1, 1, 1,
0.96033, 1.164116, 1.214452, 1, 1, 1, 1, 1,
0.9617661, 0.7826213, 1.285671, 1, 1, 1, 1, 1,
0.9713804, -1.047485, 1.722162, 1, 1, 1, 1, 1,
0.974524, -1.186144, 1.965057, 1, 1, 1, 1, 1,
0.9749609, -1.316112, 3.915456, 1, 1, 1, 1, 1,
0.9774356, 1.45926, 2.253861, 1, 1, 1, 1, 1,
0.9815144, 0.652889, 4.228899, 0, 0, 1, 1, 1,
0.985653, -1.153215, 1.256176, 1, 0, 0, 1, 1,
0.9886925, -0.7137363, 1.269863, 1, 0, 0, 1, 1,
0.9888082, -2.232364, 1.327808, 1, 0, 0, 1, 1,
0.9910237, -1.290905, 1.505746, 1, 0, 0, 1, 1,
0.9935358, 0.7773294, -0.3820755, 1, 0, 0, 1, 1,
1.015186, -1.560664, 4.611012, 0, 0, 0, 1, 1,
1.019024, -1.501869, 3.158835, 0, 0, 0, 1, 1,
1.021013, -0.7851005, 1.538786, 0, 0, 0, 1, 1,
1.031964, 0.9594545, -0.767276, 0, 0, 0, 1, 1,
1.034506, -0.07135943, 1.415261, 0, 0, 0, 1, 1,
1.038241, 1.76439, 0.3648196, 0, 0, 0, 1, 1,
1.038309, 1.006158, 1.230562, 0, 0, 0, 1, 1,
1.04442, 0.9057887, 2.065564, 1, 1, 1, 1, 1,
1.048811, -0.008017641, 1.452208, 1, 1, 1, 1, 1,
1.051041, 0.9640563, 1.907374, 1, 1, 1, 1, 1,
1.051416, -0.6872237, 2.462082, 1, 1, 1, 1, 1,
1.05228, 0.1055615, 1.504704, 1, 1, 1, 1, 1,
1.053129, 1.372029, 1.302452, 1, 1, 1, 1, 1,
1.057804, 1.722591, 0.5939175, 1, 1, 1, 1, 1,
1.059429, 0.08473376, 2.798376, 1, 1, 1, 1, 1,
1.070331, -0.1836707, 2.641732, 1, 1, 1, 1, 1,
1.088675, -0.1791633, 2.14188, 1, 1, 1, 1, 1,
1.092104, 1.762801, -0.1366503, 1, 1, 1, 1, 1,
1.096396, 0.4433977, 0.7340602, 1, 1, 1, 1, 1,
1.100372, 0.06386146, 2.184348, 1, 1, 1, 1, 1,
1.101473, -1.094695, 2.146742, 1, 1, 1, 1, 1,
1.104134, 1.993065, -1.239327, 1, 1, 1, 1, 1,
1.104939, 0.1615328, 0.3325756, 0, 0, 1, 1, 1,
1.111627, 0.1986029, 3.59633, 1, 0, 0, 1, 1,
1.112166, 0.2017497, 0.5353113, 1, 0, 0, 1, 1,
1.114058, 0.1084872, 1.624075, 1, 0, 0, 1, 1,
1.11528, -0.5956877, 2.939305, 1, 0, 0, 1, 1,
1.128458, -0.3790208, 1.958576, 1, 0, 0, 1, 1,
1.130463, 1.436425, 0.2940636, 0, 0, 0, 1, 1,
1.135714, -0.6289464, 1.592119, 0, 0, 0, 1, 1,
1.136859, 1.091602, 0.7705758, 0, 0, 0, 1, 1,
1.166556, 0.390286, 1.838442, 0, 0, 0, 1, 1,
1.166733, -1.745204, 2.147202, 0, 0, 0, 1, 1,
1.17722, -0.2360116, 3.133187, 0, 0, 0, 1, 1,
1.17882, 0.845023, 0.4345926, 0, 0, 0, 1, 1,
1.186173, 0.7046259, 1.368288, 1, 1, 1, 1, 1,
1.187276, 1.295259, 0.3204064, 1, 1, 1, 1, 1,
1.18783, 0.07616561, 1.798327, 1, 1, 1, 1, 1,
1.189225, 1.847329, -0.7230922, 1, 1, 1, 1, 1,
1.198539, -0.4527797, 3.905184, 1, 1, 1, 1, 1,
1.205667, -0.2760192, 3.376646, 1, 1, 1, 1, 1,
1.209283, 0.4690422, 1.610618, 1, 1, 1, 1, 1,
1.219036, -0.3257436, 1.788247, 1, 1, 1, 1, 1,
1.222007, -0.2586453, 2.330209, 1, 1, 1, 1, 1,
1.230481, -0.3276895, 1.343811, 1, 1, 1, 1, 1,
1.238333, 1.259039, 1.357498, 1, 1, 1, 1, 1,
1.245784, -0.4654939, 2.576497, 1, 1, 1, 1, 1,
1.256086, 1.355783, -0.4966749, 1, 1, 1, 1, 1,
1.256624, -0.9947293, 1.640491, 1, 1, 1, 1, 1,
1.256826, 1.287344, 0.5531392, 1, 1, 1, 1, 1,
1.258772, -0.8684722, 3.330757, 0, 0, 1, 1, 1,
1.264872, 0.07880484, 1.377744, 1, 0, 0, 1, 1,
1.267082, -0.7948451, 4.084029, 1, 0, 0, 1, 1,
1.281577, 0.1758123, 1.048834, 1, 0, 0, 1, 1,
1.290043, -0.9194891, 1.733814, 1, 0, 0, 1, 1,
1.299186, -0.9019492, 2.862705, 1, 0, 0, 1, 1,
1.300137, 1.818409, -0.7974604, 0, 0, 0, 1, 1,
1.300562, 0.2707922, 1.734448, 0, 0, 0, 1, 1,
1.305031, -2.777682, 2.767835, 0, 0, 0, 1, 1,
1.310838, 1.782148, 0.1908358, 0, 0, 0, 1, 1,
1.317145, -0.8699844, 2.162611, 0, 0, 0, 1, 1,
1.32974, 1.099993, 2.738571, 0, 0, 0, 1, 1,
1.343843, 2.279606, 0.5054415, 0, 0, 0, 1, 1,
1.358278, 0.04547274, 3.242267, 1, 1, 1, 1, 1,
1.359976, 1.192025, 1.682743, 1, 1, 1, 1, 1,
1.360658, -0.168948, 1.350295, 1, 1, 1, 1, 1,
1.361695, -0.6807697, 3.227895, 1, 1, 1, 1, 1,
1.364164, 0.2769363, 0.9795001, 1, 1, 1, 1, 1,
1.365363, 1.024738, -0.6194719, 1, 1, 1, 1, 1,
1.369384, -0.8791044, 2.664318, 1, 1, 1, 1, 1,
1.381357, 0.9941188, 0.2897277, 1, 1, 1, 1, 1,
1.386662, -1.567913, 1.139613, 1, 1, 1, 1, 1,
1.386666, 2.133826, 0.6626085, 1, 1, 1, 1, 1,
1.394331, 0.224573, 2.490822, 1, 1, 1, 1, 1,
1.395551, -2.065645, 2.941966, 1, 1, 1, 1, 1,
1.399304, -0.7477785, 2.351112, 1, 1, 1, 1, 1,
1.405965, 0.2542436, 0.1448709, 1, 1, 1, 1, 1,
1.420256, -1.174137, 2.479553, 1, 1, 1, 1, 1,
1.42037, -0.6887367, 1.601099, 0, 0, 1, 1, 1,
1.423274, -0.4754883, 1.222506, 1, 0, 0, 1, 1,
1.448083, -1.303478, 2.248968, 1, 0, 0, 1, 1,
1.460054, 0.1533024, 3.241311, 1, 0, 0, 1, 1,
1.460274, 1.741056, 2.80306, 1, 0, 0, 1, 1,
1.466884, -0.6722462, 1.125846, 1, 0, 0, 1, 1,
1.478408, -1.650191, 3.311421, 0, 0, 0, 1, 1,
1.492347, -0.5409875, 1.756757, 0, 0, 0, 1, 1,
1.493793, 1.100606, 2.270543, 0, 0, 0, 1, 1,
1.497725, -0.5910434, 0.2995627, 0, 0, 0, 1, 1,
1.499576, -0.05714474, 0.7519847, 0, 0, 0, 1, 1,
1.506312, -1.304346, 3.536664, 0, 0, 0, 1, 1,
1.533113, -1.794101, 3.231129, 0, 0, 0, 1, 1,
1.537072, 1.347087, -0.5645902, 1, 1, 1, 1, 1,
1.537257, 0.474705, 2.85599, 1, 1, 1, 1, 1,
1.564278, -0.6073291, 3.776119, 1, 1, 1, 1, 1,
1.582106, 0.6964536, 1.034364, 1, 1, 1, 1, 1,
1.583483, 0.1874559, 2.913971, 1, 1, 1, 1, 1,
1.588379, 0.7949632, 2.853858, 1, 1, 1, 1, 1,
1.590664, 0.1768973, 0.8075168, 1, 1, 1, 1, 1,
1.604662, 0.653273, 2.0844, 1, 1, 1, 1, 1,
1.619008, 0.1386781, 1.199815, 1, 1, 1, 1, 1,
1.62276, 0.9817207, 0.7835661, 1, 1, 1, 1, 1,
1.625201, -1.029956, 1.459859, 1, 1, 1, 1, 1,
1.627375, 1.243967, 1.446032, 1, 1, 1, 1, 1,
1.628629, -0.6715546, 2.113858, 1, 1, 1, 1, 1,
1.631479, 1.304277, 1.351697, 1, 1, 1, 1, 1,
1.633582, 1.369397, -1.346476, 1, 1, 1, 1, 1,
1.644358, 1.095669, 0.2063278, 0, 0, 1, 1, 1,
1.644367, 1.597414, -0.1094634, 1, 0, 0, 1, 1,
1.655446, 0.2753013, 1.097411, 1, 0, 0, 1, 1,
1.684391, 0.8110922, 1.805481, 1, 0, 0, 1, 1,
1.694084, 0.8479595, 0.1984957, 1, 0, 0, 1, 1,
1.716939, -0.301542, 0.7940559, 1, 0, 0, 1, 1,
1.725954, -0.1833909, 1.023894, 0, 0, 0, 1, 1,
1.732816, 1.455859, 0.7853119, 0, 0, 0, 1, 1,
1.742064, 0.5951238, 1.517249, 0, 0, 0, 1, 1,
1.756523, 0.7987521, 2.089895, 0, 0, 0, 1, 1,
1.760536, -0.5531394, 3.384136, 0, 0, 0, 1, 1,
1.782679, -0.3791282, 1.471721, 0, 0, 0, 1, 1,
1.812407, 1.471211, -0.3733221, 0, 0, 0, 1, 1,
1.823701, -0.3746135, 2.441685, 1, 1, 1, 1, 1,
1.839998, 1.242613, 0.4307428, 1, 1, 1, 1, 1,
1.857418, 0.7225033, 1.705896, 1, 1, 1, 1, 1,
1.862201, 0.421469, 1.175081, 1, 1, 1, 1, 1,
1.864943, -0.3317344, 1.229424, 1, 1, 1, 1, 1,
1.878935, -1.495352, 4.564234, 1, 1, 1, 1, 1,
1.888578, 0.3543363, 1.856772, 1, 1, 1, 1, 1,
1.894034, 0.8465915, 1.663282, 1, 1, 1, 1, 1,
1.934742, 0.5063097, -0.2632727, 1, 1, 1, 1, 1,
1.937174, -1.639896, 1.61096, 1, 1, 1, 1, 1,
1.954215, -0.9720519, 1.148289, 1, 1, 1, 1, 1,
1.987663, 0.6321931, 1.64939, 1, 1, 1, 1, 1,
1.998789, -1.12307, 3.204124, 1, 1, 1, 1, 1,
2.008441, -1.042222, 1.999073, 1, 1, 1, 1, 1,
2.023921, -1.181537, 0.512014, 1, 1, 1, 1, 1,
2.029639, 0.3042544, 3.67971, 0, 0, 1, 1, 1,
2.080046, -0.3708353, 0.2570358, 1, 0, 0, 1, 1,
2.148975, -0.992891, 2.179136, 1, 0, 0, 1, 1,
2.157896, -1.987058, 2.776696, 1, 0, 0, 1, 1,
2.192072, -1.395556, 1.556005, 1, 0, 0, 1, 1,
2.226265, -1.409136, 2.687762, 1, 0, 0, 1, 1,
2.247328, -0.2978825, 1.997269, 0, 0, 0, 1, 1,
2.276716, 1.592247, -0.8599404, 0, 0, 0, 1, 1,
2.316629, 0.4851081, 1.68933, 0, 0, 0, 1, 1,
2.329673, 0.1319765, 1.883151, 0, 0, 0, 1, 1,
2.363761, -1.149267, 1.735158, 0, 0, 0, 1, 1,
2.365777, 0.1121256, 0.8704358, 0, 0, 0, 1, 1,
2.490988, 0.4060736, 1.763687, 0, 0, 0, 1, 1,
2.503024, 1.73126, -0.3027161, 1, 1, 1, 1, 1,
2.523482, 0.07760496, 2.074972, 1, 1, 1, 1, 1,
2.549839, 0.5869178, 1.803598, 1, 1, 1, 1, 1,
2.572718, -0.1779133, 0.7653749, 1, 1, 1, 1, 1,
2.637606, 0.0766622, 0.9806488, 1, 1, 1, 1, 1,
2.860749, 0.6423465, 1.603796, 1, 1, 1, 1, 1,
3.419304, 0.6142136, 1.535343, 1, 1, 1, 1, 1
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
var radius = 10.10191;
var distance = 35.48252;
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
mvMatrix.translate( 0.1543176, -0.2231746, -0.1329739 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.48252);
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
