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
-3.292145, -0.84521, -3.143682, 1, 0, 0, 1,
-2.848564, 1.105422, -1.049765, 1, 0.007843138, 0, 1,
-2.729831, -0.2759122, -0.5323082, 1, 0.01176471, 0, 1,
-2.626545, -0.1952502, -3.134022, 1, 0.01960784, 0, 1,
-2.611967, 1.369838, -1.578805, 1, 0.02352941, 0, 1,
-2.535404, 1.524736, -0.2483771, 1, 0.03137255, 0, 1,
-2.532209, -0.4041419, -0.05318405, 1, 0.03529412, 0, 1,
-2.442629, -0.8707862, -0.5544957, 1, 0.04313726, 0, 1,
-2.400914, -1.106829, -1.110452, 1, 0.04705882, 0, 1,
-2.373462, 0.2975018, -1.715633, 1, 0.05490196, 0, 1,
-2.366138, 0.3576786, -2.15105, 1, 0.05882353, 0, 1,
-2.350855, 0.2289384, -1.545872, 1, 0.06666667, 0, 1,
-2.28081, 0.9208968, -2.24853, 1, 0.07058824, 0, 1,
-2.191244, 0.267691, -0.8757467, 1, 0.07843138, 0, 1,
-2.168672, 0.07609519, 1.084887, 1, 0.08235294, 0, 1,
-2.130731, -1.089363, -1.621927, 1, 0.09019608, 0, 1,
-2.104288, 0.1969242, -2.094436, 1, 0.09411765, 0, 1,
-2.095654, 1.50067, -1.272027, 1, 0.1019608, 0, 1,
-2.075808, 0.002441769, -4.342948, 1, 0.1098039, 0, 1,
-1.995145, -1.070122, -2.461407, 1, 0.1137255, 0, 1,
-1.955365, -0.6235488, -0.995339, 1, 0.1215686, 0, 1,
-1.941212, -0.4864774, -2.052258, 1, 0.1254902, 0, 1,
-1.940785, -0.9552834, -2.902354, 1, 0.1333333, 0, 1,
-1.93814, -1.170158, -2.226773, 1, 0.1372549, 0, 1,
-1.931901, 1.266802, -1.55082, 1, 0.145098, 0, 1,
-1.918412, -0.3942752, -2.310201, 1, 0.1490196, 0, 1,
-1.900048, 0.3074358, -1.628743, 1, 0.1568628, 0, 1,
-1.881729, 0.503489, -2.648891, 1, 0.1607843, 0, 1,
-1.831732, 0.3598516, -3.755253, 1, 0.1686275, 0, 1,
-1.804673, 0.7902991, -0.3781669, 1, 0.172549, 0, 1,
-1.763861, 2.365278, -2.196115, 1, 0.1803922, 0, 1,
-1.733733, -0.8081372, -2.912526, 1, 0.1843137, 0, 1,
-1.73158, -0.06151666, -1.461097, 1, 0.1921569, 0, 1,
-1.713301, 2.27914, 1.563443, 1, 0.1960784, 0, 1,
-1.687987, -0.5131679, -0.3761261, 1, 0.2039216, 0, 1,
-1.677449, 0.5997312, 0.4442599, 1, 0.2117647, 0, 1,
-1.662547, -0.2740977, -3.418682, 1, 0.2156863, 0, 1,
-1.658221, 1.376722, -0.5908271, 1, 0.2235294, 0, 1,
-1.649485, -0.01255191, -1.180761, 1, 0.227451, 0, 1,
-1.638882, -1.303067, -2.502745, 1, 0.2352941, 0, 1,
-1.637276, 0.7247978, -0.7210514, 1, 0.2392157, 0, 1,
-1.62871, -1.591615, -0.3198251, 1, 0.2470588, 0, 1,
-1.623801, -1.253091, -0.4856459, 1, 0.2509804, 0, 1,
-1.608816, -2.036402, -2.506263, 1, 0.2588235, 0, 1,
-1.594186, 1.572382, -1.085738, 1, 0.2627451, 0, 1,
-1.589571, 1.629544, 0.218757, 1, 0.2705882, 0, 1,
-1.588764, 0.5699508, -1.326675, 1, 0.2745098, 0, 1,
-1.58598, -1.549274, -1.203318, 1, 0.282353, 0, 1,
-1.571491, 0.09836782, -2.752869, 1, 0.2862745, 0, 1,
-1.559177, 0.4562027, -1.48183, 1, 0.2941177, 0, 1,
-1.555204, -0.4544909, -1.705194, 1, 0.3019608, 0, 1,
-1.553622, -0.5163035, -2.050689, 1, 0.3058824, 0, 1,
-1.548654, 0.5370923, -0.1113874, 1, 0.3137255, 0, 1,
-1.543318, -1.739245, -2.350507, 1, 0.3176471, 0, 1,
-1.534784, -0.1975492, -1.729684, 1, 0.3254902, 0, 1,
-1.532712, -0.4623054, -1.442915, 1, 0.3294118, 0, 1,
-1.525311, 1.066076, -0.1804284, 1, 0.3372549, 0, 1,
-1.518397, 0.004783212, -1.770975, 1, 0.3411765, 0, 1,
-1.510471, 1.159125, 0.04274279, 1, 0.3490196, 0, 1,
-1.509158, 0.819512, -0.8516979, 1, 0.3529412, 0, 1,
-1.507971, -0.1811772, -2.321243, 1, 0.3607843, 0, 1,
-1.497917, -0.7541313, -3.653964, 1, 0.3647059, 0, 1,
-1.484315, -0.8889277, -3.16258, 1, 0.372549, 0, 1,
-1.482009, -0.1725635, -3.586238, 1, 0.3764706, 0, 1,
-1.480592, -0.2316206, -1.847848, 1, 0.3843137, 0, 1,
-1.468912, 2.092545, 0.9723506, 1, 0.3882353, 0, 1,
-1.468084, 0.4131438, -2.520766, 1, 0.3960784, 0, 1,
-1.466381, -1.001489, -1.756569, 1, 0.4039216, 0, 1,
-1.465484, -1.075433, -0.3045125, 1, 0.4078431, 0, 1,
-1.465004, 0.6216446, -1.091195, 1, 0.4156863, 0, 1,
-1.453223, 1.641606, -0.3905483, 1, 0.4196078, 0, 1,
-1.448557, 0.2649806, 0.1825804, 1, 0.427451, 0, 1,
-1.44823, 1.464475, -1.783874, 1, 0.4313726, 0, 1,
-1.433852, -0.518352, -1.040909, 1, 0.4392157, 0, 1,
-1.432827, 0.3001142, -1.936728, 1, 0.4431373, 0, 1,
-1.42681, 1.613474, -0.5935656, 1, 0.4509804, 0, 1,
-1.421594, -1.595206, -3.964208, 1, 0.454902, 0, 1,
-1.420166, 0.1510398, -0.4158599, 1, 0.4627451, 0, 1,
-1.397766, 0.1824574, -1.344972, 1, 0.4666667, 0, 1,
-1.391472, 0.8337113, 0.4740348, 1, 0.4745098, 0, 1,
-1.384163, -0.1950681, -1.144101, 1, 0.4784314, 0, 1,
-1.38173, -0.8793361, -0.2631874, 1, 0.4862745, 0, 1,
-1.380614, 0.4655311, -1.309858, 1, 0.4901961, 0, 1,
-1.366763, 0.9989675, -0.2658627, 1, 0.4980392, 0, 1,
-1.333613, -0.3466784, -1.207355, 1, 0.5058824, 0, 1,
-1.321976, -0.5172496, -2.87189, 1, 0.509804, 0, 1,
-1.308744, 0.08593847, -1.075352, 1, 0.5176471, 0, 1,
-1.300318, 0.9364851, -0.8476439, 1, 0.5215687, 0, 1,
-1.296589, 0.9108651, -1.943288, 1, 0.5294118, 0, 1,
-1.293473, -1.558066, -1.348029, 1, 0.5333334, 0, 1,
-1.292357, 0.5919843, -1.518646, 1, 0.5411765, 0, 1,
-1.29044, -1.121862, -3.975755, 1, 0.5450981, 0, 1,
-1.288631, 0.9563802, -2.529742, 1, 0.5529412, 0, 1,
-1.281807, -1.735144, -4.02819, 1, 0.5568628, 0, 1,
-1.270416, -2.339968, -2.047178, 1, 0.5647059, 0, 1,
-1.26997, 0.7659744, -1.898618, 1, 0.5686275, 0, 1,
-1.26425, 0.8351988, -1.597908, 1, 0.5764706, 0, 1,
-1.25629, -0.03564816, -3.065691, 1, 0.5803922, 0, 1,
-1.235586, 1.154927, -1.702151, 1, 0.5882353, 0, 1,
-1.23061, -0.3609049, -3.182293, 1, 0.5921569, 0, 1,
-1.229745, -0.6894785, -2.840132, 1, 0.6, 0, 1,
-1.221004, -0.8692751, -1.311311, 1, 0.6078432, 0, 1,
-1.211492, -0.04672161, -1.17132, 1, 0.6117647, 0, 1,
-1.199378, 0.1767602, -0.5503821, 1, 0.6196079, 0, 1,
-1.1919, -0.03318333, -2.070847, 1, 0.6235294, 0, 1,
-1.188501, -1.16352, -2.089398, 1, 0.6313726, 0, 1,
-1.178518, -1.31023, -0.816222, 1, 0.6352941, 0, 1,
-1.177118, 0.3086305, -0.9232075, 1, 0.6431373, 0, 1,
-1.17497, 0.7979011, -0.7468257, 1, 0.6470588, 0, 1,
-1.174277, -1.529336, -2.889356, 1, 0.654902, 0, 1,
-1.174079, 1.245807, 0.7885105, 1, 0.6588235, 0, 1,
-1.153675, 0.05106264, -2.90592, 1, 0.6666667, 0, 1,
-1.153236, -0.6717312, -3.24175, 1, 0.6705883, 0, 1,
-1.146368, 2.293648, -0.9167039, 1, 0.6784314, 0, 1,
-1.143589, -0.7081649, -1.010146, 1, 0.682353, 0, 1,
-1.13712, 0.7750747, 1.037242, 1, 0.6901961, 0, 1,
-1.125491, 1.617111, -1.208611, 1, 0.6941177, 0, 1,
-1.124462, -1.576659, -3.13686, 1, 0.7019608, 0, 1,
-1.123442, -0.8098657, -1.394109, 1, 0.7098039, 0, 1,
-1.117548, -0.487796, -3.225151, 1, 0.7137255, 0, 1,
-1.108711, -0.8670744, -2.203555, 1, 0.7215686, 0, 1,
-1.106193, 0.750798, -0.6202919, 1, 0.7254902, 0, 1,
-1.103081, 0.1488826, -2.553456, 1, 0.7333333, 0, 1,
-1.098037, -1.013543, -2.181612, 1, 0.7372549, 0, 1,
-1.096149, 0.09410713, -2.39633, 1, 0.7450981, 0, 1,
-1.088796, -0.3435907, -1.772935, 1, 0.7490196, 0, 1,
-1.081945, -0.3007902, -1.418784, 1, 0.7568628, 0, 1,
-1.070207, 0.4411369, -2.411992, 1, 0.7607843, 0, 1,
-1.067659, 0.7489059, -2.766293, 1, 0.7686275, 0, 1,
-1.064829, -0.2875109, -1.451722, 1, 0.772549, 0, 1,
-1.060647, -1.062013, -1.979058, 1, 0.7803922, 0, 1,
-1.059486, -0.02948499, -0.913423, 1, 0.7843137, 0, 1,
-1.058013, 0.9817834, -1.691454, 1, 0.7921569, 0, 1,
-1.057322, -1.43351, -0.5760596, 1, 0.7960784, 0, 1,
-1.046795, 0.606263, -2.39361, 1, 0.8039216, 0, 1,
-1.043168, -0.5152395, -1.351944, 1, 0.8117647, 0, 1,
-1.042944, -1.172058, -3.237343, 1, 0.8156863, 0, 1,
-1.040122, -0.5487267, -3.434471, 1, 0.8235294, 0, 1,
-1.036356, -0.2598358, -2.334646, 1, 0.827451, 0, 1,
-1.022478, -0.5213628, -1.691522, 1, 0.8352941, 0, 1,
-1.021546, 0.1663439, -0.4169983, 1, 0.8392157, 0, 1,
-1.021282, -0.5622283, -1.683741, 1, 0.8470588, 0, 1,
-1.012618, 0.5083296, -2.943161, 1, 0.8509804, 0, 1,
-1.011315, -0.5847116, -2.317012, 1, 0.8588235, 0, 1,
-1.010307, -0.9728174, -1.608244, 1, 0.8627451, 0, 1,
-1.009082, -0.4441093, -1.818527, 1, 0.8705882, 0, 1,
-1.008907, 0.7561904, -1.283111, 1, 0.8745098, 0, 1,
-1.008879, -0.9732712, -1.751959, 1, 0.8823529, 0, 1,
-1.008602, -0.7356023, -2.993033, 1, 0.8862745, 0, 1,
-0.9994838, -0.9894557, -1.626244, 1, 0.8941177, 0, 1,
-0.9985253, -0.2835231, -1.556485, 1, 0.8980392, 0, 1,
-0.9958551, 0.3922681, 0.265015, 1, 0.9058824, 0, 1,
-0.9944305, 0.9914473, -2.213701, 1, 0.9137255, 0, 1,
-0.9911107, 0.3918928, -0.3001461, 1, 0.9176471, 0, 1,
-0.9885559, -1.00937, -1.93365, 1, 0.9254902, 0, 1,
-0.9881727, -0.7889655, 0.750343, 1, 0.9294118, 0, 1,
-0.9877111, 3.162177, -0.7155637, 1, 0.9372549, 0, 1,
-0.9850512, -0.3596582, -2.718573, 1, 0.9411765, 0, 1,
-0.9822129, 0.02248353, -2.610921, 1, 0.9490196, 0, 1,
-0.9798285, 0.5290797, -2.761569, 1, 0.9529412, 0, 1,
-0.9793756, 1.205132, -0.9210457, 1, 0.9607843, 0, 1,
-0.9775215, -1.819914, -2.4934, 1, 0.9647059, 0, 1,
-0.9769627, -0.5412817, -1.794056, 1, 0.972549, 0, 1,
-0.9726059, -0.8370026, -3.577729, 1, 0.9764706, 0, 1,
-0.9617081, -0.7352017, -2.211417, 1, 0.9843137, 0, 1,
-0.9600745, -0.9823995, -1.902909, 1, 0.9882353, 0, 1,
-0.9442241, 1.391267, -1.766371, 1, 0.9960784, 0, 1,
-0.9304752, 0.3573316, -2.266299, 0.9960784, 1, 0, 1,
-0.9264566, -0.5868405, -1.947728, 0.9921569, 1, 0, 1,
-0.9146888, 0.7427647, -0.0882241, 0.9843137, 1, 0, 1,
-0.913376, -0.8051456, -3.421822, 0.9803922, 1, 0, 1,
-0.9131836, 0.5848818, -1.819002, 0.972549, 1, 0, 1,
-0.908321, -0.8308772, 0.004022725, 0.9686275, 1, 0, 1,
-0.9020116, 0.1095557, -1.130751, 0.9607843, 1, 0, 1,
-0.9001168, -0.6131276, -1.106759, 0.9568627, 1, 0, 1,
-0.8999849, 0.9089211, -2.045845, 0.9490196, 1, 0, 1,
-0.8998777, 0.2146127, -1.194265, 0.945098, 1, 0, 1,
-0.8993709, -0.7081906, -2.141626, 0.9372549, 1, 0, 1,
-0.8986937, -0.7454042, -3.173109, 0.9333333, 1, 0, 1,
-0.8927467, -1.033115, -1.84724, 0.9254902, 1, 0, 1,
-0.8907592, 0.4384901, 0.1247553, 0.9215686, 1, 0, 1,
-0.8895016, -0.6370246, -1.73684, 0.9137255, 1, 0, 1,
-0.8893424, -0.4249591, -2.559687, 0.9098039, 1, 0, 1,
-0.8889669, 1.820626, -0.1298546, 0.9019608, 1, 0, 1,
-0.8757507, -0.8293625, -2.458194, 0.8941177, 1, 0, 1,
-0.874624, -0.816225, -3.070017, 0.8901961, 1, 0, 1,
-0.8686877, -1.083702, -2.43552, 0.8823529, 1, 0, 1,
-0.8654744, 0.1986138, -0.9403782, 0.8784314, 1, 0, 1,
-0.8629082, 1.077971, -2.678887, 0.8705882, 1, 0, 1,
-0.8616869, 1.080007, 0.1433403, 0.8666667, 1, 0, 1,
-0.8568149, -1.20718, -1.153682, 0.8588235, 1, 0, 1,
-0.8560629, 0.8830301, -0.2333536, 0.854902, 1, 0, 1,
-0.8466819, 1.552127, 1.662356, 0.8470588, 1, 0, 1,
-0.8456973, 0.8366292, 0.1194965, 0.8431373, 1, 0, 1,
-0.8451983, -0.1317421, 0.04501539, 0.8352941, 1, 0, 1,
-0.8429608, 0.3024983, -2.242165, 0.8313726, 1, 0, 1,
-0.8421935, 0.3989771, -1.725953, 0.8235294, 1, 0, 1,
-0.8374307, 0.4400775, -1.015355, 0.8196079, 1, 0, 1,
-0.8349541, 1.119833, -0.6556517, 0.8117647, 1, 0, 1,
-0.8332915, 0.9574426, -1.232974, 0.8078431, 1, 0, 1,
-0.8245444, 0.02242392, -2.555092, 0.8, 1, 0, 1,
-0.8202472, 0.3149397, -0.9473343, 0.7921569, 1, 0, 1,
-0.8162153, 0.06720217, -0.4927676, 0.7882353, 1, 0, 1,
-0.8129236, 0.9787788, -0.9014096, 0.7803922, 1, 0, 1,
-0.8108263, -0.5406555, -1.995805, 0.7764706, 1, 0, 1,
-0.8075994, 0.6609774, -1.500549, 0.7686275, 1, 0, 1,
-0.806347, -0.6244994, -0.977909, 0.7647059, 1, 0, 1,
-0.8046635, -0.5271436, -1.406094, 0.7568628, 1, 0, 1,
-0.803531, 0.1616324, -0.5233876, 0.7529412, 1, 0, 1,
-0.7977876, 0.8905045, -0.2643806, 0.7450981, 1, 0, 1,
-0.7962521, -0.002246609, -1.260329, 0.7411765, 1, 0, 1,
-0.788243, -1.402001, -3.947511, 0.7333333, 1, 0, 1,
-0.7848964, -0.4348722, -3.371472, 0.7294118, 1, 0, 1,
-0.7785687, 0.001914178, -2.368468, 0.7215686, 1, 0, 1,
-0.7697084, 0.2973926, -1.355915, 0.7176471, 1, 0, 1,
-0.7685928, -1.626866, -1.68719, 0.7098039, 1, 0, 1,
-0.7651117, 0.4520345, -1.59897, 0.7058824, 1, 0, 1,
-0.7620643, -0.02672348, -0.8713062, 0.6980392, 1, 0, 1,
-0.7571911, 2.538996, -0.2915481, 0.6901961, 1, 0, 1,
-0.7568741, -1.128063, -0.9577161, 0.6862745, 1, 0, 1,
-0.7542523, 0.7414416, -1.402091, 0.6784314, 1, 0, 1,
-0.7495885, 0.9460635, -0.6072538, 0.6745098, 1, 0, 1,
-0.7446499, -0.6984851, -3.077342, 0.6666667, 1, 0, 1,
-0.7414048, 0.6287755, -1.945923, 0.6627451, 1, 0, 1,
-0.7333295, 0.05086501, -1.862445, 0.654902, 1, 0, 1,
-0.7318534, -0.6549867, -3.008278, 0.6509804, 1, 0, 1,
-0.7287385, -0.001942325, -1.212534, 0.6431373, 1, 0, 1,
-0.7270575, 0.2929802, -1.341086, 0.6392157, 1, 0, 1,
-0.7257169, 0.5482988, -0.09818976, 0.6313726, 1, 0, 1,
-0.7253109, 0.7366441, -0.473924, 0.627451, 1, 0, 1,
-0.7239755, -0.8543019, -1.882824, 0.6196079, 1, 0, 1,
-0.7186137, 0.4674485, -0.1293793, 0.6156863, 1, 0, 1,
-0.7145312, -1.320731, -1.715068, 0.6078432, 1, 0, 1,
-0.7129037, 0.7214876, -0.8129204, 0.6039216, 1, 0, 1,
-0.712479, -1.756474, -2.004287, 0.5960785, 1, 0, 1,
-0.7121944, -0.4862488, -2.331877, 0.5882353, 1, 0, 1,
-0.7059535, 2.520073, -0.3709515, 0.5843138, 1, 0, 1,
-0.7052774, 0.3025576, -2.05258, 0.5764706, 1, 0, 1,
-0.6970222, -0.5402306, -2.686636, 0.572549, 1, 0, 1,
-0.6967204, -1.476436, -3.076765, 0.5647059, 1, 0, 1,
-0.6915556, -1.619389, -3.886918, 0.5607843, 1, 0, 1,
-0.6884307, 0.1345176, -2.728546, 0.5529412, 1, 0, 1,
-0.6855661, -0.0008222294, -1.238457, 0.5490196, 1, 0, 1,
-0.6818893, 0.4532776, -1.068477, 0.5411765, 1, 0, 1,
-0.6707833, 0.4872123, -1.629893, 0.5372549, 1, 0, 1,
-0.670333, -1.360285, -2.787031, 0.5294118, 1, 0, 1,
-0.6677636, 1.814602, 0.253891, 0.5254902, 1, 0, 1,
-0.6660145, 0.3557783, -2.423849, 0.5176471, 1, 0, 1,
-0.6655124, -0.239132, -0.3308966, 0.5137255, 1, 0, 1,
-0.664626, -1.336373, -3.36617, 0.5058824, 1, 0, 1,
-0.6612494, -0.1705377, -2.286112, 0.5019608, 1, 0, 1,
-0.6608786, -0.465656, -1.630213, 0.4941176, 1, 0, 1,
-0.6604706, -0.9336455, -2.511291, 0.4862745, 1, 0, 1,
-0.6600279, 0.1587845, -0.6003928, 0.4823529, 1, 0, 1,
-0.6534014, 1.956135, 0.2364578, 0.4745098, 1, 0, 1,
-0.6497933, 1.904924, 0.3713062, 0.4705882, 1, 0, 1,
-0.6406787, -1.293002, -2.64672, 0.4627451, 1, 0, 1,
-0.6362043, -0.930932, -3.083713, 0.4588235, 1, 0, 1,
-0.6355616, 1.168735, -1.82501, 0.4509804, 1, 0, 1,
-0.634021, 1.473641, -0.8007382, 0.4470588, 1, 0, 1,
-0.6294805, 2.152406, 1.233725, 0.4392157, 1, 0, 1,
-0.6152746, 0.2728576, -1.409922, 0.4352941, 1, 0, 1,
-0.6126781, -1.260859, -2.432396, 0.427451, 1, 0, 1,
-0.611783, 0.6817433, -0.7717906, 0.4235294, 1, 0, 1,
-0.6090598, 0.1758273, -2.138485, 0.4156863, 1, 0, 1,
-0.6078738, -0.1533157, 0.6266966, 0.4117647, 1, 0, 1,
-0.6061724, -0.2858391, -1.843578, 0.4039216, 1, 0, 1,
-0.604534, 1.548964, -0.8542312, 0.3960784, 1, 0, 1,
-0.6013302, -2.554641, -2.14082, 0.3921569, 1, 0, 1,
-0.6010269, 0.4937057, -1.415945, 0.3843137, 1, 0, 1,
-0.6005096, -0.240258, -2.048069, 0.3803922, 1, 0, 1,
-0.5883077, -0.669562, -3.051367, 0.372549, 1, 0, 1,
-0.5861983, 0.6109881, -1.55382, 0.3686275, 1, 0, 1,
-0.5860157, -1.127299, -1.473811, 0.3607843, 1, 0, 1,
-0.5814055, 0.06174125, -0.8750072, 0.3568628, 1, 0, 1,
-0.5804151, 0.08921544, -1.91049, 0.3490196, 1, 0, 1,
-0.5761766, -0.6837937, -2.698246, 0.345098, 1, 0, 1,
-0.5747967, -0.4777426, -1.681746, 0.3372549, 1, 0, 1,
-0.5735193, 1.131198, -1.633444, 0.3333333, 1, 0, 1,
-0.5716302, -0.752516, -2.629262, 0.3254902, 1, 0, 1,
-0.5704042, -0.8466241, -1.881258, 0.3215686, 1, 0, 1,
-0.5694795, -0.2948216, -0.4857838, 0.3137255, 1, 0, 1,
-0.5655574, 1.265237, -1.189544, 0.3098039, 1, 0, 1,
-0.5618722, -0.6929097, -1.304939, 0.3019608, 1, 0, 1,
-0.5576604, -0.4286161, -1.77647, 0.2941177, 1, 0, 1,
-0.5518118, 0.6340086, 0.1200511, 0.2901961, 1, 0, 1,
-0.5473202, 0.7448613, -0.8091604, 0.282353, 1, 0, 1,
-0.5452827, 1.554082, -1.145818, 0.2784314, 1, 0, 1,
-0.5410137, -0.3572174, -1.583531, 0.2705882, 1, 0, 1,
-0.536954, -1.026777, -2.472715, 0.2666667, 1, 0, 1,
-0.5347337, 1.474124, -0.5684663, 0.2588235, 1, 0, 1,
-0.534343, 0.3829999, 0.06003575, 0.254902, 1, 0, 1,
-0.5323683, 0.7261917, -0.2938255, 0.2470588, 1, 0, 1,
-0.525713, 1.1074, -0.4065003, 0.2431373, 1, 0, 1,
-0.5250275, 0.1127474, -0.789256, 0.2352941, 1, 0, 1,
-0.5244555, 1.626363, 1.079205, 0.2313726, 1, 0, 1,
-0.5217397, 1.226196, 0.6268108, 0.2235294, 1, 0, 1,
-0.5111605, 1.150431, -1.59521, 0.2196078, 1, 0, 1,
-0.5090383, 0.07089943, -0.6477663, 0.2117647, 1, 0, 1,
-0.5087408, 0.9664478, -0.1855286, 0.2078431, 1, 0, 1,
-0.5040853, -0.7582, -2.290032, 0.2, 1, 0, 1,
-0.5024989, 0.4862691, -0.1548227, 0.1921569, 1, 0, 1,
-0.4997879, -1.072526, -1.94697, 0.1882353, 1, 0, 1,
-0.4907056, -0.490726, -2.148425, 0.1803922, 1, 0, 1,
-0.4903149, -0.9550587, -3.542583, 0.1764706, 1, 0, 1,
-0.4893014, 0.6120332, 0.5843167, 0.1686275, 1, 0, 1,
-0.4809951, 0.5265433, 0.4144917, 0.1647059, 1, 0, 1,
-0.4804608, -0.6124542, -1.387747, 0.1568628, 1, 0, 1,
-0.4716786, 0.6711317, -0.2376503, 0.1529412, 1, 0, 1,
-0.4716343, -0.402367, -1.551753, 0.145098, 1, 0, 1,
-0.4562592, -0.3280586, -1.919474, 0.1411765, 1, 0, 1,
-0.4550031, -0.9184578, -1.542999, 0.1333333, 1, 0, 1,
-0.452673, 1.165155, 0.5113767, 0.1294118, 1, 0, 1,
-0.4513287, -0.5051769, -0.6265907, 0.1215686, 1, 0, 1,
-0.4471982, -0.2939089, -1.547665, 0.1176471, 1, 0, 1,
-0.4466753, 0.8600609, -0.9999437, 0.1098039, 1, 0, 1,
-0.4464962, -0.5571361, -0.9267558, 0.1058824, 1, 0, 1,
-0.4443602, 0.5382354, 0.4390598, 0.09803922, 1, 0, 1,
-0.442656, 0.6320166, -1.710517, 0.09019608, 1, 0, 1,
-0.4395198, -0.7759069, -2.97721, 0.08627451, 1, 0, 1,
-0.43806, -0.9297943, -2.395844, 0.07843138, 1, 0, 1,
-0.4372362, 1.040124, -1.965558, 0.07450981, 1, 0, 1,
-0.4335854, -0.8505788, -1.052946, 0.06666667, 1, 0, 1,
-0.4281927, -0.912528, -1.889426, 0.0627451, 1, 0, 1,
-0.4278408, 0.4617902, -1.54773, 0.05490196, 1, 0, 1,
-0.4261764, 0.9906285, -0.693239, 0.05098039, 1, 0, 1,
-0.4258948, -0.118025, -2.591359, 0.04313726, 1, 0, 1,
-0.4235655, -0.5249232, -2.501035, 0.03921569, 1, 0, 1,
-0.4168364, 1.313132, -0.2049603, 0.03137255, 1, 0, 1,
-0.4145287, -0.1429535, -2.623602, 0.02745098, 1, 0, 1,
-0.4113599, 1.776114, 0.5271361, 0.01960784, 1, 0, 1,
-0.4089618, -0.407499, -2.140965, 0.01568628, 1, 0, 1,
-0.40682, 0.2860813, -0.0982691, 0.007843138, 1, 0, 1,
-0.4046968, -0.7001643, -2.40799, 0.003921569, 1, 0, 1,
-0.4011151, 1.918534, -2.188935, 0, 1, 0.003921569, 1,
-0.4010516, 0.4175393, 1.303772, 0, 1, 0.01176471, 1,
-0.4009902, 0.1186095, -2.099999, 0, 1, 0.01568628, 1,
-0.3998257, 0.4391945, -2.000259, 0, 1, 0.02352941, 1,
-0.3996721, 1.73493, 0.2462907, 0, 1, 0.02745098, 1,
-0.3989798, 1.279534, -2.113523, 0, 1, 0.03529412, 1,
-0.3949656, -1.34517, -1.545219, 0, 1, 0.03921569, 1,
-0.39359, -1.755365, -3.074581, 0, 1, 0.04705882, 1,
-0.391265, 1.559431, -0.8618701, 0, 1, 0.05098039, 1,
-0.3802859, -0.8196349, -4.129166, 0, 1, 0.05882353, 1,
-0.3794293, -0.9547831, -2.542514, 0, 1, 0.0627451, 1,
-0.3755321, -0.2650991, -3.629073, 0, 1, 0.07058824, 1,
-0.3736789, 0.05343755, -1.687929, 0, 1, 0.07450981, 1,
-0.3706404, 2.079465, 1.438445, 0, 1, 0.08235294, 1,
-0.3698874, 0.03851175, -1.680254, 0, 1, 0.08627451, 1,
-0.3660319, 0.7198882, -1.530752, 0, 1, 0.09411765, 1,
-0.3626512, -1.51969, -2.439013, 0, 1, 0.1019608, 1,
-0.3596645, 0.8350929, -1.230443, 0, 1, 0.1058824, 1,
-0.3594505, 0.01926844, -0.6674607, 0, 1, 0.1137255, 1,
-0.355011, -0.3201819, -1.308294, 0, 1, 0.1176471, 1,
-0.3519702, -0.288457, -3.336144, 0, 1, 0.1254902, 1,
-0.3509804, -0.562161, -0.9395196, 0, 1, 0.1294118, 1,
-0.3461525, -0.2505607, -1.128402, 0, 1, 0.1372549, 1,
-0.3439115, -0.4532342, -2.691239, 0, 1, 0.1411765, 1,
-0.3436775, -0.6230856, -3.519901, 0, 1, 0.1490196, 1,
-0.3428471, -1.621595, -3.046236, 0, 1, 0.1529412, 1,
-0.3414699, 0.1541668, -0.7720716, 0, 1, 0.1607843, 1,
-0.339134, -0.7626248, -2.881523, 0, 1, 0.1647059, 1,
-0.3304945, -0.8963739, -4.582982, 0, 1, 0.172549, 1,
-0.3288779, -1.405358, -4.077245, 0, 1, 0.1764706, 1,
-0.3271772, -0.1840189, -2.199386, 0, 1, 0.1843137, 1,
-0.3258385, 0.3134637, -0.4397951, 0, 1, 0.1882353, 1,
-0.32454, -1.979846, -1.684099, 0, 1, 0.1960784, 1,
-0.3230874, 1.367955, 0.9831658, 0, 1, 0.2039216, 1,
-0.3211414, 0.1886962, -2.38309, 0, 1, 0.2078431, 1,
-0.3209824, -0.5762945, -1.621837, 0, 1, 0.2156863, 1,
-0.3198982, 0.9136068, 0.1459403, 0, 1, 0.2196078, 1,
-0.3187036, -1.525699, -3.027889, 0, 1, 0.227451, 1,
-0.3090562, 0.01202935, -0.3375866, 0, 1, 0.2313726, 1,
-0.3085775, 0.8981131, -0.3958772, 0, 1, 0.2392157, 1,
-0.3079304, 0.1336171, -0.8690181, 0, 1, 0.2431373, 1,
-0.3042628, -0.6863337, -4.075123, 0, 1, 0.2509804, 1,
-0.3022451, -0.3331064, -2.104056, 0, 1, 0.254902, 1,
-0.3015704, -0.5516075, -0.5993968, 0, 1, 0.2627451, 1,
-0.3005308, 1.613484, 1.323302, 0, 1, 0.2666667, 1,
-0.2999373, 1.242716, 1.062245, 0, 1, 0.2745098, 1,
-0.2974848, -0.5965282, -2.711036, 0, 1, 0.2784314, 1,
-0.2961853, -1.10177, -3.334411, 0, 1, 0.2862745, 1,
-0.2953094, 0.9253581, -1.033473, 0, 1, 0.2901961, 1,
-0.2918661, 0.9494334, 0.2072744, 0, 1, 0.2980392, 1,
-0.2850159, -1.180259, -3.22808, 0, 1, 0.3058824, 1,
-0.2772339, 0.2127386, 0.5450403, 0, 1, 0.3098039, 1,
-0.2757711, -0.3514963, -2.273258, 0, 1, 0.3176471, 1,
-0.2731909, -0.2636177, -2.680223, 0, 1, 0.3215686, 1,
-0.2715563, -0.5892335, -2.459382, 0, 1, 0.3294118, 1,
-0.2712462, -0.1038922, -2.025128, 0, 1, 0.3333333, 1,
-0.2690479, -0.5054029, -3.505045, 0, 1, 0.3411765, 1,
-0.2648616, 0.6649376, -1.03627, 0, 1, 0.345098, 1,
-0.264797, -0.2410855, -1.839881, 0, 1, 0.3529412, 1,
-0.2644451, 0.4089321, -0.1247716, 0, 1, 0.3568628, 1,
-0.2626298, -0.6047169, -2.829882, 0, 1, 0.3647059, 1,
-0.2569478, -0.1895507, -1.85856, 0, 1, 0.3686275, 1,
-0.2569368, 0.7464072, -0.8015768, 0, 1, 0.3764706, 1,
-0.2568862, 0.2091211, -3.049608, 0, 1, 0.3803922, 1,
-0.2539693, -0.3153428, -3.87727, 0, 1, 0.3882353, 1,
-0.2535405, 1.256665, -0.3854205, 0, 1, 0.3921569, 1,
-0.2500602, -0.6899051, -1.276974, 0, 1, 0.4, 1,
-0.2409808, 0.55585, 0.01377206, 0, 1, 0.4078431, 1,
-0.2408197, 0.265548, 0.3580888, 0, 1, 0.4117647, 1,
-0.2321221, 0.276861, 0.3091016, 0, 1, 0.4196078, 1,
-0.2292701, 0.114643, -1.895614, 0, 1, 0.4235294, 1,
-0.2276785, 0.04235339, -1.167021, 0, 1, 0.4313726, 1,
-0.222963, 2.037592, -2.176399, 0, 1, 0.4352941, 1,
-0.2226478, 0.6591479, -0.6833162, 0, 1, 0.4431373, 1,
-0.2218511, -1.593216, -2.940292, 0, 1, 0.4470588, 1,
-0.2195812, 0.104374, 0.5042724, 0, 1, 0.454902, 1,
-0.2161877, 0.9203036, -1.296118, 0, 1, 0.4588235, 1,
-0.2161453, -0.36951, -2.061406, 0, 1, 0.4666667, 1,
-0.2120869, 0.6253608, -0.2916534, 0, 1, 0.4705882, 1,
-0.2114612, -0.1470942, -3.279303, 0, 1, 0.4784314, 1,
-0.208535, 0.9876382, -0.7912681, 0, 1, 0.4823529, 1,
-0.2083181, -0.1435985, -1.831215, 0, 1, 0.4901961, 1,
-0.2058766, 0.8006077, -0.9339178, 0, 1, 0.4941176, 1,
-0.2035109, 1.155388, -0.07485258, 0, 1, 0.5019608, 1,
-0.2026429, 0.2487602, -0.08549324, 0, 1, 0.509804, 1,
-0.2019772, 0.3221119, -1.521075, 0, 1, 0.5137255, 1,
-0.2013059, 0.7209307, -1.369781, 0, 1, 0.5215687, 1,
-0.2006333, -1.550254, -4.568867, 0, 1, 0.5254902, 1,
-0.1983221, 0.7550567, -0.07318722, 0, 1, 0.5333334, 1,
-0.1926986, -1.412188, -2.694801, 0, 1, 0.5372549, 1,
-0.1888887, 0.9404477, 1.560995, 0, 1, 0.5450981, 1,
-0.1866648, -0.02509703, -2.520509, 0, 1, 0.5490196, 1,
-0.1866102, -0.04853582, -1.667358, 0, 1, 0.5568628, 1,
-0.1851932, -0.8311415, -1.611323, 0, 1, 0.5607843, 1,
-0.181937, -0.02399717, -1.019969, 0, 1, 0.5686275, 1,
-0.1809351, -0.3122442, -3.221756, 0, 1, 0.572549, 1,
-0.1726252, -1.53156, -2.524633, 0, 1, 0.5803922, 1,
-0.1707303, 1.728819, 0.01900513, 0, 1, 0.5843138, 1,
-0.1694373, -1.312771, -3.375226, 0, 1, 0.5921569, 1,
-0.1693807, 0.7613922, -0.2574192, 0, 1, 0.5960785, 1,
-0.1666753, 1.949188, -0.938526, 0, 1, 0.6039216, 1,
-0.1659065, -1.517854, -2.366564, 0, 1, 0.6117647, 1,
-0.1627293, 0.5894166, 0.4168082, 0, 1, 0.6156863, 1,
-0.1559584, -1.439101, -2.027123, 0, 1, 0.6235294, 1,
-0.1498901, -0.1503542, -1.910965, 0, 1, 0.627451, 1,
-0.1481654, 0.6374919, 0.09767383, 0, 1, 0.6352941, 1,
-0.1471128, -0.3595442, -5.486735, 0, 1, 0.6392157, 1,
-0.1459905, -0.6858945, -2.218432, 0, 1, 0.6470588, 1,
-0.1440158, -0.8165435, -4.442226, 0, 1, 0.6509804, 1,
-0.1431172, 0.9693424, -0.9748778, 0, 1, 0.6588235, 1,
-0.1425027, 0.4865492, -0.08182468, 0, 1, 0.6627451, 1,
-0.1422638, 0.8425257, -0.6150261, 0, 1, 0.6705883, 1,
-0.1402523, 1.293055, 2.113501, 0, 1, 0.6745098, 1,
-0.1399863, -0.7742333, -2.194913, 0, 1, 0.682353, 1,
-0.135352, 1.187853, 1.132578, 0, 1, 0.6862745, 1,
-0.1337596, 1.071556, -0.5754932, 0, 1, 0.6941177, 1,
-0.132218, 0.1331834, -2.580508, 0, 1, 0.7019608, 1,
-0.1300253, 0.2609407, -0.5085522, 0, 1, 0.7058824, 1,
-0.1282858, -0.6731956, -2.693321, 0, 1, 0.7137255, 1,
-0.1230024, 0.4139619, -0.6927472, 0, 1, 0.7176471, 1,
-0.1227481, 0.7157637, 0.7031221, 0, 1, 0.7254902, 1,
-0.1118001, -0.9022489, -3.881958, 0, 1, 0.7294118, 1,
-0.1077991, -1.991237, -4.613554, 0, 1, 0.7372549, 1,
-0.1049212, -0.3616235, -2.78001, 0, 1, 0.7411765, 1,
-0.0967944, 1.333625, 0.8463957, 0, 1, 0.7490196, 1,
-0.09509651, -1.228287, -2.316843, 0, 1, 0.7529412, 1,
-0.09293557, 1.535094, 1.911069, 0, 1, 0.7607843, 1,
-0.08798251, -1.114673, -1.690779, 0, 1, 0.7647059, 1,
-0.08763416, 0.2278681, -0.6259485, 0, 1, 0.772549, 1,
-0.08759613, -0.6288403, -3.024609, 0, 1, 0.7764706, 1,
-0.08688417, 0.0197251, -2.298399, 0, 1, 0.7843137, 1,
-0.08426976, 2.339014, -0.7597665, 0, 1, 0.7882353, 1,
-0.08366137, -1.066736, -4.20425, 0, 1, 0.7960784, 1,
-0.07833404, -0.8686975, -4.810911, 0, 1, 0.8039216, 1,
-0.07701492, 0.56177, -0.3790554, 0, 1, 0.8078431, 1,
-0.0703027, -0.5936837, -3.078055, 0, 1, 0.8156863, 1,
-0.06951534, -1.290052, -3.039808, 0, 1, 0.8196079, 1,
-0.06899361, -0.9196618, -2.098772, 0, 1, 0.827451, 1,
-0.06468495, -0.02966674, -3.004919, 0, 1, 0.8313726, 1,
-0.06233247, 0.1581249, -1.710938, 0, 1, 0.8392157, 1,
-0.05999829, -0.01500546, -2.292385, 0, 1, 0.8431373, 1,
-0.05612355, -0.1287081, -1.728055, 0, 1, 0.8509804, 1,
-0.05426743, 0.2526618, -0.6325571, 0, 1, 0.854902, 1,
-0.05367924, -0.2090209, -3.150003, 0, 1, 0.8627451, 1,
-0.05227771, 1.438563, 1.191788, 0, 1, 0.8666667, 1,
-0.05178531, -0.05145026, -2.491539, 0, 1, 0.8745098, 1,
-0.04535496, 0.4348645, -0.003019982, 0, 1, 0.8784314, 1,
-0.04338964, 1.599052, 2.922567, 0, 1, 0.8862745, 1,
-0.03957092, 1.142753, 0.2235083, 0, 1, 0.8901961, 1,
-0.03761305, -0.7230658, -2.843528, 0, 1, 0.8980392, 1,
-0.03586532, 1.00202, -0.6387477, 0, 1, 0.9058824, 1,
-0.02905737, -0.7828668, -2.802675, 0, 1, 0.9098039, 1,
-0.02770359, 0.881037, -1.232192, 0, 1, 0.9176471, 1,
-0.01787694, 0.7119805, 2.503826, 0, 1, 0.9215686, 1,
-0.01550639, 0.7718063, -1.263988, 0, 1, 0.9294118, 1,
-0.01289446, 0.1225303, 1.800822, 0, 1, 0.9333333, 1,
-0.01181881, -0.2102422, -4.179675, 0, 1, 0.9411765, 1,
-0.01157281, -2.787399, -3.359039, 0, 1, 0.945098, 1,
-0.0034515, 0.9776387, -1.062099, 0, 1, 0.9529412, 1,
-0.0005395321, -0.2923827, -3.43061, 0, 1, 0.9568627, 1,
0.001079488, 1.57654, -0.08876495, 0, 1, 0.9647059, 1,
0.00163898, -0.7244328, 1.785845, 0, 1, 0.9686275, 1,
0.002247725, 1.820687, -0.1010475, 0, 1, 0.9764706, 1,
0.002988945, -0.3071561, 5.145845, 0, 1, 0.9803922, 1,
0.003263737, 0.09094232, -0.5068465, 0, 1, 0.9882353, 1,
0.01624471, 0.2080872, 0.5063168, 0, 1, 0.9921569, 1,
0.01815596, 1.024002, 0.06055159, 0, 1, 1, 1,
0.02050091, -0.1565185, 3.615726, 0, 0.9921569, 1, 1,
0.02732712, -1.395551, 3.469126, 0, 0.9882353, 1, 1,
0.02781324, 0.7820385, 1.239341, 0, 0.9803922, 1, 1,
0.0308455, 1.875123, -1.250154, 0, 0.9764706, 1, 1,
0.03333798, -0.4851842, 2.888841, 0, 0.9686275, 1, 1,
0.04079701, 0.744006, -0.3031541, 0, 0.9647059, 1, 1,
0.04091149, 0.1991023, -0.9023767, 0, 0.9568627, 1, 1,
0.04558939, 0.2766507, -0.4608988, 0, 0.9529412, 1, 1,
0.05087585, -0.7222528, 2.123765, 0, 0.945098, 1, 1,
0.05185305, -0.296542, 1.7086, 0, 0.9411765, 1, 1,
0.05437297, 0.3914095, 1.091124, 0, 0.9333333, 1, 1,
0.0589174, -0.513961, 3.025183, 0, 0.9294118, 1, 1,
0.0623127, 0.7104269, -1.837828, 0, 0.9215686, 1, 1,
0.0708099, -1.017425, 3.163522, 0, 0.9176471, 1, 1,
0.07123061, -0.8708296, 4.001331, 0, 0.9098039, 1, 1,
0.07209381, -1.782256, 2.554995, 0, 0.9058824, 1, 1,
0.07502861, -0.3742624, 2.535202, 0, 0.8980392, 1, 1,
0.07587127, 1.933686, -0.4198308, 0, 0.8901961, 1, 1,
0.08000079, 1.310953, -1.050554, 0, 0.8862745, 1, 1,
0.08244959, 1.225553, 0.8985847, 0, 0.8784314, 1, 1,
0.08274827, 0.7733181, 0.8953605, 0, 0.8745098, 1, 1,
0.0843176, 0.3279255, -0.1445664, 0, 0.8666667, 1, 1,
0.08888958, -1.128644, 3.412267, 0, 0.8627451, 1, 1,
0.08907493, -0.07733236, 4.205366, 0, 0.854902, 1, 1,
0.0903784, -0.7167228, 1.720551, 0, 0.8509804, 1, 1,
0.09288745, -1.21403, 2.894186, 0, 0.8431373, 1, 1,
0.09623463, 1.63395, -0.7196761, 0, 0.8392157, 1, 1,
0.09713747, -0.6167266, 2.751383, 0, 0.8313726, 1, 1,
0.09854756, -0.8922279, 2.743699, 0, 0.827451, 1, 1,
0.09906612, 1.962751, 1.217556, 0, 0.8196079, 1, 1,
0.1028075, -2.245232, 4.324654, 0, 0.8156863, 1, 1,
0.1079562, -0.4599076, 2.972306, 0, 0.8078431, 1, 1,
0.1079643, 3.491257, 0.07600195, 0, 0.8039216, 1, 1,
0.1092942, -1.486125, 4.358943, 0, 0.7960784, 1, 1,
0.1101025, -0.5883334, 3.392104, 0, 0.7882353, 1, 1,
0.1155498, 2.442913, -2.192206, 0, 0.7843137, 1, 1,
0.1199496, -0.9283687, 3.258538, 0, 0.7764706, 1, 1,
0.1215662, -0.9331723, 2.748994, 0, 0.772549, 1, 1,
0.1286692, -0.3423385, 2.360196, 0, 0.7647059, 1, 1,
0.1317121, -0.3627313, 3.12941, 0, 0.7607843, 1, 1,
0.1318518, -0.4717847, 1.430336, 0, 0.7529412, 1, 1,
0.1345523, -0.240648, 1.942022, 0, 0.7490196, 1, 1,
0.1376044, -0.4600819, 1.935176, 0, 0.7411765, 1, 1,
0.1458639, -1.169571, 3.046511, 0, 0.7372549, 1, 1,
0.1466798, -0.5035555, 2.502677, 0, 0.7294118, 1, 1,
0.1481515, -0.3579698, 2.56993, 0, 0.7254902, 1, 1,
0.1490681, 0.5042922, -0.9253764, 0, 0.7176471, 1, 1,
0.1560908, 0.4975175, -0.6921699, 0, 0.7137255, 1, 1,
0.1595057, -0.1530962, 0.8539928, 0, 0.7058824, 1, 1,
0.1598919, -1.591413, 2.316259, 0, 0.6980392, 1, 1,
0.1624832, 0.2678253, 0.3282654, 0, 0.6941177, 1, 1,
0.1637625, 0.5082297, 0.7355217, 0, 0.6862745, 1, 1,
0.1706058, 0.2444983, 0.6746194, 0, 0.682353, 1, 1,
0.1716567, 0.4562739, 0.2936108, 0, 0.6745098, 1, 1,
0.173237, -0.2067319, 4.213992, 0, 0.6705883, 1, 1,
0.1732524, -1.102339, 4.260819, 0, 0.6627451, 1, 1,
0.1735147, 0.08832956, 1.213539, 0, 0.6588235, 1, 1,
0.1753893, -1.041158, 2.692017, 0, 0.6509804, 1, 1,
0.1785783, -0.4358836, 2.913316, 0, 0.6470588, 1, 1,
0.1789905, 0.1593179, 1.253475, 0, 0.6392157, 1, 1,
0.1795733, -0.792174, 4.728216, 0, 0.6352941, 1, 1,
0.1806142, 0.9060091, -0.6144311, 0, 0.627451, 1, 1,
0.1831634, 0.1452719, 1.00793, 0, 0.6235294, 1, 1,
0.1844322, -2.43609, 4.20959, 0, 0.6156863, 1, 1,
0.1873069, 0.04412528, 1.600382, 0, 0.6117647, 1, 1,
0.1905167, -0.08156666, 3.375814, 0, 0.6039216, 1, 1,
0.1922836, -0.09471749, 3.015476, 0, 0.5960785, 1, 1,
0.1932018, 1.276229, 0.2531611, 0, 0.5921569, 1, 1,
0.1936091, 1.088793, 1.318223, 0, 0.5843138, 1, 1,
0.1938852, 1.233551, 0.8136492, 0, 0.5803922, 1, 1,
0.1948009, -1.217623, 3.923582, 0, 0.572549, 1, 1,
0.1952611, -1.631604, 3.454759, 0, 0.5686275, 1, 1,
0.1981205, 0.05324574, 1.674894, 0, 0.5607843, 1, 1,
0.1987151, -1.26795, 3.467851, 0, 0.5568628, 1, 1,
0.2003082, 0.5010121, -0.7416832, 0, 0.5490196, 1, 1,
0.2032396, -1.180402, 3.870852, 0, 0.5450981, 1, 1,
0.2073173, -0.5467036, 2.242903, 0, 0.5372549, 1, 1,
0.2077561, -1.176209, 4.61537, 0, 0.5333334, 1, 1,
0.2084365, 0.926022, 0.1343441, 0, 0.5254902, 1, 1,
0.2104883, 0.09269043, -0.2016817, 0, 0.5215687, 1, 1,
0.2145093, -0.9824262, 2.815326, 0, 0.5137255, 1, 1,
0.2167051, 1.115639, 1.469922, 0, 0.509804, 1, 1,
0.2229043, -2.421265, 2.993991, 0, 0.5019608, 1, 1,
0.2248198, 0.5752451, -0.1621808, 0, 0.4941176, 1, 1,
0.2298828, 0.5304516, -0.3304618, 0, 0.4901961, 1, 1,
0.2322498, -1.390597, 4.416218, 0, 0.4823529, 1, 1,
0.2367253, -0.7320493, 0.8173428, 0, 0.4784314, 1, 1,
0.2389918, -1.794897, 2.835781, 0, 0.4705882, 1, 1,
0.2408819, -1.880461, 4.884705, 0, 0.4666667, 1, 1,
0.2412688, -1.103541, 2.960998, 0, 0.4588235, 1, 1,
0.2424419, 0.1927488, 2.174077, 0, 0.454902, 1, 1,
0.2473673, -0.8750554, 2.406043, 0, 0.4470588, 1, 1,
0.2519306, -0.6636099, 1.839039, 0, 0.4431373, 1, 1,
0.2538812, 1.015259, 2.555249, 0, 0.4352941, 1, 1,
0.2539036, 0.7297189, 0.3108438, 0, 0.4313726, 1, 1,
0.2576724, -0.6140354, 3.54257, 0, 0.4235294, 1, 1,
0.2594582, -0.5672243, 4.65495, 0, 0.4196078, 1, 1,
0.2647874, 0.1370947, 2.390968, 0, 0.4117647, 1, 1,
0.2677236, 1.538989, 1.674102, 0, 0.4078431, 1, 1,
0.2717963, -1.077702, 3.665909, 0, 0.4, 1, 1,
0.2737278, -0.2945139, 3.065246, 0, 0.3921569, 1, 1,
0.2748521, -0.3626947, 2.99148, 0, 0.3882353, 1, 1,
0.2763233, 0.6373113, 1.711205, 0, 0.3803922, 1, 1,
0.2828977, -0.8811166, 1.487371, 0, 0.3764706, 1, 1,
0.2845935, 0.4408728, 1.050922, 0, 0.3686275, 1, 1,
0.2854073, -0.6464674, 1.147983, 0, 0.3647059, 1, 1,
0.2949631, 0.7154686, -0.09435634, 0, 0.3568628, 1, 1,
0.2984201, 1.454163, 2.315547, 0, 0.3529412, 1, 1,
0.2993473, -1.438178, 4.602976, 0, 0.345098, 1, 1,
0.2996463, 1.575145, -0.6890857, 0, 0.3411765, 1, 1,
0.2996609, 1.143763, -0.1113683, 0, 0.3333333, 1, 1,
0.3012272, 0.1507615, 2.040352, 0, 0.3294118, 1, 1,
0.3041926, -0.4825003, 1.764298, 0, 0.3215686, 1, 1,
0.3174927, 1.952205, 0.3049426, 0, 0.3176471, 1, 1,
0.3190848, -0.554041, 0.1280723, 0, 0.3098039, 1, 1,
0.3219992, -0.5320404, 1.967403, 0, 0.3058824, 1, 1,
0.3260651, -0.769189, 3.865403, 0, 0.2980392, 1, 1,
0.329351, -0.7333141, 1.783399, 0, 0.2901961, 1, 1,
0.3310587, 0.732613, 2.595464, 0, 0.2862745, 1, 1,
0.3316015, 0.108897, 2.521863, 0, 0.2784314, 1, 1,
0.3329402, 0.2854625, 0.3707027, 0, 0.2745098, 1, 1,
0.3329856, 0.01127956, 4.037918, 0, 0.2666667, 1, 1,
0.3338065, -0.6125193, 2.308873, 0, 0.2627451, 1, 1,
0.3367088, -1.023151, 2.812479, 0, 0.254902, 1, 1,
0.338909, -0.80915, 2.664281, 0, 0.2509804, 1, 1,
0.3424604, 0.3309999, 2.161959, 0, 0.2431373, 1, 1,
0.343238, 0.4432099, 1.838422, 0, 0.2392157, 1, 1,
0.3474579, 0.1555177, -0.3105875, 0, 0.2313726, 1, 1,
0.355225, 1.398218, 1.793147, 0, 0.227451, 1, 1,
0.3563902, -0.251727, 0.003094683, 0, 0.2196078, 1, 1,
0.3578503, 0.1748564, 1.328113, 0, 0.2156863, 1, 1,
0.3623329, 0.3967176, 0.9596515, 0, 0.2078431, 1, 1,
0.3636789, -0.1297786, 2.874787, 0, 0.2039216, 1, 1,
0.3735864, -0.7822766, 3.137635, 0, 0.1960784, 1, 1,
0.3752741, -0.2991543, 1.403892, 0, 0.1882353, 1, 1,
0.3755222, 1.695197, 0.9784128, 0, 0.1843137, 1, 1,
0.3779565, -0.8245718, 3.557811, 0, 0.1764706, 1, 1,
0.3804932, -0.492327, 3.159028, 0, 0.172549, 1, 1,
0.380612, 0.2546665, 1.28087, 0, 0.1647059, 1, 1,
0.3828649, -0.08947188, 3.085918, 0, 0.1607843, 1, 1,
0.3837735, 0.8192147, 0.9285482, 0, 0.1529412, 1, 1,
0.3863851, 0.7661834, 0.1164626, 0, 0.1490196, 1, 1,
0.386867, -0.2655296, 1.131299, 0, 0.1411765, 1, 1,
0.3935648, 0.01396502, 1.067639, 0, 0.1372549, 1, 1,
0.3952314, -2.433395, 1.665279, 0, 0.1294118, 1, 1,
0.3968298, -2.238587, 2.185827, 0, 0.1254902, 1, 1,
0.4000145, -2.032498, 1.697399, 0, 0.1176471, 1, 1,
0.4001468, 1.140496, 1.030938, 0, 0.1137255, 1, 1,
0.4026082, 1.80946, 1.12414, 0, 0.1058824, 1, 1,
0.4064071, -0.9762852, 2.361392, 0, 0.09803922, 1, 1,
0.4075931, -1.458595, 3.165123, 0, 0.09411765, 1, 1,
0.4086418, -0.1808221, 1.114863, 0, 0.08627451, 1, 1,
0.4154968, -0.8472773, 2.121978, 0, 0.08235294, 1, 1,
0.4181742, 0.6979256, -0.5548726, 0, 0.07450981, 1, 1,
0.4192689, -0.03470485, 1.882697, 0, 0.07058824, 1, 1,
0.4216805, -0.9744856, 2.997142, 0, 0.0627451, 1, 1,
0.4237538, 0.6115997, 0.5567173, 0, 0.05882353, 1, 1,
0.4239466, -1.285551, 2.744363, 0, 0.05098039, 1, 1,
0.425579, 1.452487, 1.111742, 0, 0.04705882, 1, 1,
0.4270673, -0.8971005, 2.81102, 0, 0.03921569, 1, 1,
0.4325984, 0.8178762, 0.752757, 0, 0.03529412, 1, 1,
0.4346004, 0.468187, 0.856373, 0, 0.02745098, 1, 1,
0.4364176, -0.579533, 2.529421, 0, 0.02352941, 1, 1,
0.439208, -0.5909317, 3.631959, 0, 0.01568628, 1, 1,
0.4419371, 0.3375658, 1.038194, 0, 0.01176471, 1, 1,
0.4441703, 1.03002, -0.7439936, 0, 0.003921569, 1, 1,
0.4449409, 0.8007165, -0.1283533, 0.003921569, 0, 1, 1,
0.449676, -0.7900428, 2.552768, 0.007843138, 0, 1, 1,
0.4530356, 0.6074222, 0.05352496, 0.01568628, 0, 1, 1,
0.4532717, -0.5398496, 3.118001, 0.01960784, 0, 1, 1,
0.4538061, 1.124961, 1.744321, 0.02745098, 0, 1, 1,
0.4541937, 1.305258, -0.6798859, 0.03137255, 0, 1, 1,
0.4572371, 0.2797253, 0.6723313, 0.03921569, 0, 1, 1,
0.4612049, 1.70439, 0.5672284, 0.04313726, 0, 1, 1,
0.4616898, -1.264448, 0.3340116, 0.05098039, 0, 1, 1,
0.4616992, 0.7799411, 0.5689186, 0.05490196, 0, 1, 1,
0.4686383, 1.189903, 1.25906, 0.0627451, 0, 1, 1,
0.477662, -1.19976, 1.985352, 0.06666667, 0, 1, 1,
0.4787036, 1.815576, -0.8744028, 0.07450981, 0, 1, 1,
0.4789454, -0.1589325, 1.439747, 0.07843138, 0, 1, 1,
0.4806618, 0.38749, 1.737371, 0.08627451, 0, 1, 1,
0.4825481, -0.6557496, 1.294897, 0.09019608, 0, 1, 1,
0.4866843, 2.53732, -0.8835506, 0.09803922, 0, 1, 1,
0.487118, 1.338844, -0.1935357, 0.1058824, 0, 1, 1,
0.4893708, 0.07644553, 1.471888, 0.1098039, 0, 1, 1,
0.4896221, 0.4924769, -0.328068, 0.1176471, 0, 1, 1,
0.4901185, -2.832438, 0.3202143, 0.1215686, 0, 1, 1,
0.5010519, 0.8395213, 0.06384052, 0.1294118, 0, 1, 1,
0.5020767, -0.7150728, 2.268094, 0.1333333, 0, 1, 1,
0.5029124, 0.7724129, 0.7831381, 0.1411765, 0, 1, 1,
0.5128836, -0.04873396, 2.51221, 0.145098, 0, 1, 1,
0.5154032, 1.494016, 0.2323068, 0.1529412, 0, 1, 1,
0.5167901, 0.5578239, 2.034915, 0.1568628, 0, 1, 1,
0.5179389, -0.6709306, 1.012155, 0.1647059, 0, 1, 1,
0.5223618, 0.4891966, -1.431236, 0.1686275, 0, 1, 1,
0.5238167, -1.727916, 4.08007, 0.1764706, 0, 1, 1,
0.5284455, -0.2510017, 2.378494, 0.1803922, 0, 1, 1,
0.5310342, 0.5781673, 0.9707389, 0.1882353, 0, 1, 1,
0.5376814, 1.407713, -0.08949545, 0.1921569, 0, 1, 1,
0.5380507, 0.4444081, 0.9114614, 0.2, 0, 1, 1,
0.5393596, -1.436999, 1.244852, 0.2078431, 0, 1, 1,
0.5399695, 2.430441, -0.3074378, 0.2117647, 0, 1, 1,
0.5426384, 0.2967692, 0.5320531, 0.2196078, 0, 1, 1,
0.5440621, 1.426665, -0.4664007, 0.2235294, 0, 1, 1,
0.5494713, -0.8718693, 1.318795, 0.2313726, 0, 1, 1,
0.553538, 0.3764083, 0.2103748, 0.2352941, 0, 1, 1,
0.5588484, -1.078158, 1.875455, 0.2431373, 0, 1, 1,
0.5696091, 1.043374, -0.8222313, 0.2470588, 0, 1, 1,
0.5724385, 1.370947, 0.793418, 0.254902, 0, 1, 1,
0.5762576, -0.2963956, 1.744637, 0.2588235, 0, 1, 1,
0.5851361, -1.209888, 2.465049, 0.2666667, 0, 1, 1,
0.5863194, 0.8334944, -0.2877201, 0.2705882, 0, 1, 1,
0.5879959, -0.4811806, 2.737146, 0.2784314, 0, 1, 1,
0.5882933, 0.2511577, 2.470662, 0.282353, 0, 1, 1,
0.5932137, 0.978772, 0.9711248, 0.2901961, 0, 1, 1,
0.5947307, 2.245686, 0.7106248, 0.2941177, 0, 1, 1,
0.6004777, -0.3096466, 2.155341, 0.3019608, 0, 1, 1,
0.6015013, -0.5737668, 1.889518, 0.3098039, 0, 1, 1,
0.6034952, 0.77571, 1.067868, 0.3137255, 0, 1, 1,
0.6046166, 0.593901, -0.5276901, 0.3215686, 0, 1, 1,
0.6080373, 0.08090908, 0.4313866, 0.3254902, 0, 1, 1,
0.6104471, 0.1654578, 1.537409, 0.3333333, 0, 1, 1,
0.6116098, -1.708317, 2.605088, 0.3372549, 0, 1, 1,
0.6151204, -2.312994, 4.410568, 0.345098, 0, 1, 1,
0.616668, -1.103742, 1.904285, 0.3490196, 0, 1, 1,
0.6176503, -1.089344, 2.902089, 0.3568628, 0, 1, 1,
0.6199757, 0.5403375, 2.422763, 0.3607843, 0, 1, 1,
0.6217932, 0.5245109, 3.398629, 0.3686275, 0, 1, 1,
0.6246967, -0.4089906, 3.673887, 0.372549, 0, 1, 1,
0.6354811, -0.5937967, 2.227937, 0.3803922, 0, 1, 1,
0.6388529, 0.373467, 0.6546733, 0.3843137, 0, 1, 1,
0.6404853, 0.395415, 1.002294, 0.3921569, 0, 1, 1,
0.6469586, 1.627551, -0.5208871, 0.3960784, 0, 1, 1,
0.6473485, 0.8609482, -0.6352822, 0.4039216, 0, 1, 1,
0.6497019, -1.51906, 2.715883, 0.4117647, 0, 1, 1,
0.6541281, -0.8722636, 4.296613, 0.4156863, 0, 1, 1,
0.655, 1.436285, 2.191755, 0.4235294, 0, 1, 1,
0.6565158, -0.5025389, 1.846117, 0.427451, 0, 1, 1,
0.657653, -0.7681497, 1.021226, 0.4352941, 0, 1, 1,
0.6580946, -0.5591022, 2.449074, 0.4392157, 0, 1, 1,
0.6637726, -0.3805152, 1.243504, 0.4470588, 0, 1, 1,
0.6662508, -0.6918883, 4.231903, 0.4509804, 0, 1, 1,
0.6669389, -0.5669838, 2.269097, 0.4588235, 0, 1, 1,
0.6685178, -0.6101946, 2.962668, 0.4627451, 0, 1, 1,
0.6792656, 0.5591803, 0.6782739, 0.4705882, 0, 1, 1,
0.6800802, -1.423035, 3.712698, 0.4745098, 0, 1, 1,
0.6815791, -0.3052659, 0.7057592, 0.4823529, 0, 1, 1,
0.6827392, -0.3590963, 4.025091, 0.4862745, 0, 1, 1,
0.6847603, -0.7853978, 1.72099, 0.4941176, 0, 1, 1,
0.6860584, 0.8033106, 1.664347, 0.5019608, 0, 1, 1,
0.6876292, 0.01593166, 0.4234804, 0.5058824, 0, 1, 1,
0.6969212, -0.503988, 2.206098, 0.5137255, 0, 1, 1,
0.7032794, 1.851713, 0.9056842, 0.5176471, 0, 1, 1,
0.7041921, -0.834666, 0.9834992, 0.5254902, 0, 1, 1,
0.7052745, -1.365723, 0.9692327, 0.5294118, 0, 1, 1,
0.7060977, -1.655003, 3.166957, 0.5372549, 0, 1, 1,
0.7062483, -0.142445, 1.630093, 0.5411765, 0, 1, 1,
0.7102835, -1.490927, 2.445879, 0.5490196, 0, 1, 1,
0.7127673, -1.121797, 2.871469, 0.5529412, 0, 1, 1,
0.7133965, -1.419804, 0.7194548, 0.5607843, 0, 1, 1,
0.716819, -0.7859411, 2.94873, 0.5647059, 0, 1, 1,
0.7178892, -0.1683162, 2.387769, 0.572549, 0, 1, 1,
0.718161, 0.2577022, 2.134557, 0.5764706, 0, 1, 1,
0.7191974, 0.06636901, 2.160692, 0.5843138, 0, 1, 1,
0.7202339, 0.8215605, -0.8855871, 0.5882353, 0, 1, 1,
0.7226668, 0.5948091, 1.723816, 0.5960785, 0, 1, 1,
0.7419776, 0.7962662, -0.4388557, 0.6039216, 0, 1, 1,
0.7423282, -0.8145763, 2.239625, 0.6078432, 0, 1, 1,
0.7502871, 0.396097, 2.031055, 0.6156863, 0, 1, 1,
0.7504873, 0.6230729, 2.168316, 0.6196079, 0, 1, 1,
0.7506581, -0.3361648, 1.930085, 0.627451, 0, 1, 1,
0.753996, 1.723741, 0.4714345, 0.6313726, 0, 1, 1,
0.7573994, 1.141837, 0.618646, 0.6392157, 0, 1, 1,
0.7581147, 0.03744293, 2.586088, 0.6431373, 0, 1, 1,
0.7588804, 1.07656, 1.876564, 0.6509804, 0, 1, 1,
0.7614274, -1.209025, -0.402783, 0.654902, 0, 1, 1,
0.7666951, 0.1975962, 0.7894111, 0.6627451, 0, 1, 1,
0.774834, 1.262707, -0.9086995, 0.6666667, 0, 1, 1,
0.7815796, -0.5794958, 2.167525, 0.6745098, 0, 1, 1,
0.7897579, -2.574063, 2.720872, 0.6784314, 0, 1, 1,
0.7903064, -1.590573, 3.523754, 0.6862745, 0, 1, 1,
0.7903299, -2.746684, 3.721243, 0.6901961, 0, 1, 1,
0.8018136, -0.8040304, 2.476574, 0.6980392, 0, 1, 1,
0.8045246, 0.7049378, 0.7212366, 0.7058824, 0, 1, 1,
0.8073043, -0.4520539, 3.416199, 0.7098039, 0, 1, 1,
0.8151221, -0.4652885, 1.896312, 0.7176471, 0, 1, 1,
0.8182545, -0.9568574, -1.659478, 0.7215686, 0, 1, 1,
0.8218731, -0.6751748, 1.629966, 0.7294118, 0, 1, 1,
0.8223579, 0.1378577, 2.123283, 0.7333333, 0, 1, 1,
0.823276, -0.3501828, 2.094754, 0.7411765, 0, 1, 1,
0.8251395, -1.350354, 1.977172, 0.7450981, 0, 1, 1,
0.8285951, -0.7652849, 1.760061, 0.7529412, 0, 1, 1,
0.8356521, -0.2318755, 0.1312625, 0.7568628, 0, 1, 1,
0.8378029, -1.160553, 1.583932, 0.7647059, 0, 1, 1,
0.841544, 1.152294, -0.01485831, 0.7686275, 0, 1, 1,
0.8425595, -1.626256, 2.19489, 0.7764706, 0, 1, 1,
0.8439331, -1.211997, 2.857085, 0.7803922, 0, 1, 1,
0.8486348, -0.1690837, 4.353882, 0.7882353, 0, 1, 1,
0.8492634, -0.5836933, 1.437709, 0.7921569, 0, 1, 1,
0.8589464, -0.07669311, 1.63673, 0.8, 0, 1, 1,
0.8603502, 0.3871216, 0.4581748, 0.8078431, 0, 1, 1,
0.8622848, -2.573997, 3.333389, 0.8117647, 0, 1, 1,
0.8640943, -0.4211889, 2.866326, 0.8196079, 0, 1, 1,
0.8700265, 2.174496, -0.5798901, 0.8235294, 0, 1, 1,
0.8721802, -0.9595415, 3.338251, 0.8313726, 0, 1, 1,
0.8738506, -1.899284, 1.739999, 0.8352941, 0, 1, 1,
0.8947576, 0.7388924, 1.516757, 0.8431373, 0, 1, 1,
0.8983976, -0.9201362, 3.890639, 0.8470588, 0, 1, 1,
0.901334, 0.04922386, 2.080468, 0.854902, 0, 1, 1,
0.9025797, 0.239831, 1.064163, 0.8588235, 0, 1, 1,
0.9062379, 0.860048, -0.4120227, 0.8666667, 0, 1, 1,
0.9077773, 1.027264, -0.3513709, 0.8705882, 0, 1, 1,
0.90834, 0.5536824, 0.5212961, 0.8784314, 0, 1, 1,
0.9123378, 0.1183137, 2.122211, 0.8823529, 0, 1, 1,
0.9164568, -2.20049, 3.884596, 0.8901961, 0, 1, 1,
0.9237952, 0.9724444, 2.244588, 0.8941177, 0, 1, 1,
0.9241396, 1.782735, 0.9342082, 0.9019608, 0, 1, 1,
0.9254827, -0.7355663, 1.687631, 0.9098039, 0, 1, 1,
0.9287459, -0.6557384, 1.938154, 0.9137255, 0, 1, 1,
0.9365882, 2.226996, 0.0390469, 0.9215686, 0, 1, 1,
0.9368953, -0.1013867, 1.196279, 0.9254902, 0, 1, 1,
0.937704, 0.8988702, 1.772247, 0.9333333, 0, 1, 1,
0.9410184, 1.295985, 0.3001797, 0.9372549, 0, 1, 1,
0.9417424, 0.4026685, 1.067511, 0.945098, 0, 1, 1,
0.946451, -0.4284663, 1.100671, 0.9490196, 0, 1, 1,
0.9491758, -0.2147721, 2.090331, 0.9568627, 0, 1, 1,
0.9519863, -0.04773564, 1.520231, 0.9607843, 0, 1, 1,
0.962514, 0.3169256, 0.7290608, 0.9686275, 0, 1, 1,
0.9672143, -0.2355336, 1.883331, 0.972549, 0, 1, 1,
0.9704129, 0.3079982, 2.144409, 0.9803922, 0, 1, 1,
0.9741148, -0.3185841, 2.929439, 0.9843137, 0, 1, 1,
0.9795792, 1.601027, 0.5348631, 0.9921569, 0, 1, 1,
0.9840999, -0.08620886, 1.690853, 0.9960784, 0, 1, 1,
0.9841134, 2.644066, 0.01904842, 1, 0, 0.9960784, 1,
0.9852846, 0.9985524, 0.9646714, 1, 0, 0.9882353, 1,
0.9965962, -1.788601, 3.888777, 1, 0, 0.9843137, 1,
1.010988, -0.1199357, 0.9222226, 1, 0, 0.9764706, 1,
1.012472, 0.8313361, -0.09040545, 1, 0, 0.972549, 1,
1.017605, -0.453814, 0.9388341, 1, 0, 0.9647059, 1,
1.018275, 2.231682, 2.468312, 1, 0, 0.9607843, 1,
1.019031, 0.2044373, 0.4347627, 1, 0, 0.9529412, 1,
1.022109, 0.8476498, -0.3876209, 1, 0, 0.9490196, 1,
1.022433, 0.6364502, 1.367911, 1, 0, 0.9411765, 1,
1.023049, 0.677539, 2.115637, 1, 0, 0.9372549, 1,
1.025074, -0.7537752, 1.430324, 1, 0, 0.9294118, 1,
1.028081, -0.8449602, 2.256279, 1, 0, 0.9254902, 1,
1.037532, 1.068155, 2.990103, 1, 0, 0.9176471, 1,
1.037642, -0.07839196, 0.465739, 1, 0, 0.9137255, 1,
1.046826, -0.06798629, 1.254264, 1, 0, 0.9058824, 1,
1.047157, -1.287322, 1.977349, 1, 0, 0.9019608, 1,
1.052866, -0.8182732, 1.774426, 1, 0, 0.8941177, 1,
1.059564, -1.200138, 1.560683, 1, 0, 0.8862745, 1,
1.069654, 0.1160996, 2.173835, 1, 0, 0.8823529, 1,
1.072429, -0.2792997, 2.182395, 1, 0, 0.8745098, 1,
1.076425, 1.290471, 2.016446, 1, 0, 0.8705882, 1,
1.080896, -0.004725785, 0.6653135, 1, 0, 0.8627451, 1,
1.084761, 1.322581, -0.5789638, 1, 0, 0.8588235, 1,
1.085652, -0.9450824, 3.162571, 1, 0, 0.8509804, 1,
1.088045, 1.033832, 0.4122418, 1, 0, 0.8470588, 1,
1.088856, -0.2325455, 1.153114, 1, 0, 0.8392157, 1,
1.090567, 0.6797451, 2.723557, 1, 0, 0.8352941, 1,
1.093433, 1.225952, -0.2886261, 1, 0, 0.827451, 1,
1.095736, 1.198351, 0.2670057, 1, 0, 0.8235294, 1,
1.101269, 1.256922, 0.4420526, 1, 0, 0.8156863, 1,
1.105722, -0.8507819, 2.337807, 1, 0, 0.8117647, 1,
1.107527, -0.5657543, 2.214412, 1, 0, 0.8039216, 1,
1.109199, -1.397638, 3.490214, 1, 0, 0.7960784, 1,
1.110218, -1.761231, 2.717933, 1, 0, 0.7921569, 1,
1.111538, -0.5004586, 1.43279, 1, 0, 0.7843137, 1,
1.113249, 1.390059, 0.873734, 1, 0, 0.7803922, 1,
1.113319, 0.5474171, 0.3931831, 1, 0, 0.772549, 1,
1.117415, 0.4784601, 0.673834, 1, 0, 0.7686275, 1,
1.118712, 0.02114926, 0.8313173, 1, 0, 0.7607843, 1,
1.121649, 0.1576047, 0.9538535, 1, 0, 0.7568628, 1,
1.124421, -1.49223, 3.654383, 1, 0, 0.7490196, 1,
1.12778, -1.7052, 0.5112937, 1, 0, 0.7450981, 1,
1.152731, 0.06337882, -0.02648483, 1, 0, 0.7372549, 1,
1.155395, 0.201937, 2.139132, 1, 0, 0.7333333, 1,
1.168662, 0.02177892, 2.817269, 1, 0, 0.7254902, 1,
1.173625, 0.4834468, -2.530816, 1, 0, 0.7215686, 1,
1.182922, -0.6382889, 1.604792, 1, 0, 0.7137255, 1,
1.188315, -1.151834, 2.124923, 1, 0, 0.7098039, 1,
1.189433, 0.2969241, 0.9748968, 1, 0, 0.7019608, 1,
1.191694, -1.893114, 3.141348, 1, 0, 0.6941177, 1,
1.193734, -1.240106, 1.411219, 1, 0, 0.6901961, 1,
1.194475, -0.09481508, 1.80487, 1, 0, 0.682353, 1,
1.19846, 0.01495903, 2.543547, 1, 0, 0.6784314, 1,
1.204102, 0.5277023, -0.3472344, 1, 0, 0.6705883, 1,
1.211952, -0.5973073, 3.057943, 1, 0, 0.6666667, 1,
1.214787, -1.124172, 2.087279, 1, 0, 0.6588235, 1,
1.221482, 0.3257769, 2.02472, 1, 0, 0.654902, 1,
1.224498, 0.7702439, 1.86044, 1, 0, 0.6470588, 1,
1.230407, 2.145881, 0.4000749, 1, 0, 0.6431373, 1,
1.234342, -0.1974215, 2.872858, 1, 0, 0.6352941, 1,
1.234822, -0.04203687, 0.351804, 1, 0, 0.6313726, 1,
1.23994, -0.6712811, 3.721034, 1, 0, 0.6235294, 1,
1.240805, -0.05601898, 1.517576, 1, 0, 0.6196079, 1,
1.24094, -0.6100972, 2.125882, 1, 0, 0.6117647, 1,
1.245138, 0.1028523, 0.977212, 1, 0, 0.6078432, 1,
1.266818, 0.9279988, -0.5339323, 1, 0, 0.6, 1,
1.267667, 0.6988792, 1.499788, 1, 0, 0.5921569, 1,
1.276609, -0.3605849, 3.811287, 1, 0, 0.5882353, 1,
1.276696, -1.987033, 3.995427, 1, 0, 0.5803922, 1,
1.280739, 1.808829, -0.892974, 1, 0, 0.5764706, 1,
1.284245, 0.04759279, 2.061171, 1, 0, 0.5686275, 1,
1.291491, -0.1825657, 0.9783602, 1, 0, 0.5647059, 1,
1.30616, 1.37558, -0.06800484, 1, 0, 0.5568628, 1,
1.309579, 0.8509701, 1.062814, 1, 0, 0.5529412, 1,
1.312796, 0.4043466, 0.6948193, 1, 0, 0.5450981, 1,
1.316411, 0.08091593, 1.464171, 1, 0, 0.5411765, 1,
1.317358, -0.1856038, 4.73195, 1, 0, 0.5333334, 1,
1.326321, 0.9544649, 0.3679362, 1, 0, 0.5294118, 1,
1.330146, -0.6196542, 2.790277, 1, 0, 0.5215687, 1,
1.330753, 0.1298018, 1.926296, 1, 0, 0.5176471, 1,
1.331633, 1.113447, 1.639905, 1, 0, 0.509804, 1,
1.332644, 0.3280466, 2.646294, 1, 0, 0.5058824, 1,
1.335249, -0.2753713, 1.086042, 1, 0, 0.4980392, 1,
1.339856, -0.4029442, 0.9856669, 1, 0, 0.4901961, 1,
1.340047, -0.9580156, 2.347975, 1, 0, 0.4862745, 1,
1.344548, -0.110775, 0.9611073, 1, 0, 0.4784314, 1,
1.353899, 1.451789, -0.07435413, 1, 0, 0.4745098, 1,
1.354601, 0.1263148, 1.532069, 1, 0, 0.4666667, 1,
1.356947, 1.465011, 2.070455, 1, 0, 0.4627451, 1,
1.362949, 0.9067391, 1.620574, 1, 0, 0.454902, 1,
1.365779, 0.769048, 0.03526193, 1, 0, 0.4509804, 1,
1.371543, 0.9434742, 2.321177, 1, 0, 0.4431373, 1,
1.374351, -0.1337957, 1.788149, 1, 0, 0.4392157, 1,
1.376271, -1.991474, 2.973706, 1, 0, 0.4313726, 1,
1.381813, 1.056809, 1.428957, 1, 0, 0.427451, 1,
1.387594, -1.499136, 1.770844, 1, 0, 0.4196078, 1,
1.388744, -1.544306, 1.336161, 1, 0, 0.4156863, 1,
1.39177, -0.3554587, 0.938535, 1, 0, 0.4078431, 1,
1.42258, 0.7623035, 1.932832, 1, 0, 0.4039216, 1,
1.429466, 1.547275, 2.614173, 1, 0, 0.3960784, 1,
1.435121, 0.875757, 0.3861019, 1, 0, 0.3882353, 1,
1.444035, -0.8618518, -0.9647882, 1, 0, 0.3843137, 1,
1.444788, 2.169897, 3.051095, 1, 0, 0.3764706, 1,
1.466192, -1.728827, 3.290732, 1, 0, 0.372549, 1,
1.477252, 1.119934, 0.2296663, 1, 0, 0.3647059, 1,
1.488626, 0.5906239, 2.060548, 1, 0, 0.3607843, 1,
1.493567, -1.344177, 1.670496, 1, 0, 0.3529412, 1,
1.497485, 0.5599246, 1.119176, 1, 0, 0.3490196, 1,
1.506186, -1.519485, 2.511199, 1, 0, 0.3411765, 1,
1.514182, -0.5215112, 0.3364114, 1, 0, 0.3372549, 1,
1.521529, -0.5882584, 0.7614111, 1, 0, 0.3294118, 1,
1.528434, -0.957095, 4.452009, 1, 0, 0.3254902, 1,
1.528497, -1.273807, 3.214839, 1, 0, 0.3176471, 1,
1.532038, 0.06569251, 0.3787202, 1, 0, 0.3137255, 1,
1.536357, 0.6215497, 1.541956, 1, 0, 0.3058824, 1,
1.550461, -0.3645265, 3.119196, 1, 0, 0.2980392, 1,
1.559127, -2.777943, 1.642089, 1, 0, 0.2941177, 1,
1.572267, -0.7723494, 2.950723, 1, 0, 0.2862745, 1,
1.576825, 1.01757, 0.6962637, 1, 0, 0.282353, 1,
1.583369, -1.41214, 3.215606, 1, 0, 0.2745098, 1,
1.583386, -0.0499679, 2.074836, 1, 0, 0.2705882, 1,
1.597177, 0.721578, 2.20521, 1, 0, 0.2627451, 1,
1.605297, 1.677314, 0.5193006, 1, 0, 0.2588235, 1,
1.606628, 0.6987534, -0.4931775, 1, 0, 0.2509804, 1,
1.612558, -0.8082529, 1.683811, 1, 0, 0.2470588, 1,
1.627097, 0.7538484, 1.545148, 1, 0, 0.2392157, 1,
1.628602, 1.602844, 2.277193, 1, 0, 0.2352941, 1,
1.630378, 0.4473139, 2.860593, 1, 0, 0.227451, 1,
1.63868, 0.5536464, 1.616325, 1, 0, 0.2235294, 1,
1.674109, 0.8399588, 0.3812865, 1, 0, 0.2156863, 1,
1.678871, 1.112786, 0.5413594, 1, 0, 0.2117647, 1,
1.692327, 1.138348, 1.566911, 1, 0, 0.2039216, 1,
1.693785, 0.1166816, 0.4762615, 1, 0, 0.1960784, 1,
1.706993, 0.5242328, 1.352447, 1, 0, 0.1921569, 1,
1.728001, 0.9209415, 0.4784189, 1, 0, 0.1843137, 1,
1.750572, 0.3904211, -0.01915371, 1, 0, 0.1803922, 1,
1.757912, 0.1881898, 0.0599518, 1, 0, 0.172549, 1,
1.764678, 1.340517, 1.723199, 1, 0, 0.1686275, 1,
1.777658, -0.1813406, 1.660007, 1, 0, 0.1607843, 1,
1.797018, -0.4584093, 1.052207, 1, 0, 0.1568628, 1,
1.827196, -0.9883176, 3.406119, 1, 0, 0.1490196, 1,
1.834638, -1.263629, 2.176249, 1, 0, 0.145098, 1,
1.840427, -0.9073354, 3.479528, 1, 0, 0.1372549, 1,
1.896714, 1.054929, 1.545606, 1, 0, 0.1333333, 1,
1.900963, 0.6748577, 0.9734613, 1, 0, 0.1254902, 1,
1.905547, 3.089348, 0.4008068, 1, 0, 0.1215686, 1,
1.945708, -0.5836951, 1.858047, 1, 0, 0.1137255, 1,
1.956865, -0.1484136, 2.154757, 1, 0, 0.1098039, 1,
1.975171, -0.2537975, 4.147091, 1, 0, 0.1019608, 1,
1.990053, 0.2093371, 0.9429485, 1, 0, 0.09411765, 1,
2.005068, -0.6357877, 2.47646, 1, 0, 0.09019608, 1,
2.017637, -0.6304061, 2.62844, 1, 0, 0.08235294, 1,
2.072919, 0.6308202, 2.972189, 1, 0, 0.07843138, 1,
2.114149, 0.06506734, 1.482869, 1, 0, 0.07058824, 1,
2.120017, 1.004993, 1.708292, 1, 0, 0.06666667, 1,
2.130217, 0.4775648, 0.8780549, 1, 0, 0.05882353, 1,
2.221965, -0.3645509, 0.9577821, 1, 0, 0.05490196, 1,
2.288356, 1.419871, -0.2648071, 1, 0, 0.04705882, 1,
2.421887, -0.1127959, 2.445622, 1, 0, 0.04313726, 1,
2.45918, -0.1921135, 1.076768, 1, 0, 0.03529412, 1,
2.489882, -1.286584, -0.1521409, 1, 0, 0.03137255, 1,
2.570563, 1.581157, 1.460119, 1, 0, 0.02352941, 1,
2.572512, 1.26491, 0.4346435, 1, 0, 0.01960784, 1,
2.85543, 1.371598, 2.083607, 1, 0, 0.01176471, 1,
3.126633, 0.8510456, 0.8219097, 1, 0, 0.007843138, 1
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
-0.08275616, -3.904305, -7.288957, 0, -0.5, 0.5, 0.5,
-0.08275616, -3.904305, -7.288957, 1, -0.5, 0.5, 0.5,
-0.08275616, -3.904305, -7.288957, 1, 1.5, 0.5, 0.5,
-0.08275616, -3.904305, -7.288957, 0, 1.5, 0.5, 0.5
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
-4.380128, 0.3294091, -7.288957, 0, -0.5, 0.5, 0.5,
-4.380128, 0.3294091, -7.288957, 1, -0.5, 0.5, 0.5,
-4.380128, 0.3294091, -7.288957, 1, 1.5, 0.5, 0.5,
-4.380128, 0.3294091, -7.288957, 0, 1.5, 0.5, 0.5
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
-4.380128, -3.904305, -0.1704447, 0, -0.5, 0.5, 0.5,
-4.380128, -3.904305, -0.1704447, 1, -0.5, 0.5, 0.5,
-4.380128, -3.904305, -0.1704447, 1, 1.5, 0.5, 0.5,
-4.380128, -3.904305, -0.1704447, 0, 1.5, 0.5, 0.5
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
-3, -2.927294, -5.646224,
3, -2.927294, -5.646224,
-3, -2.927294, -5.646224,
-3, -3.090129, -5.920012,
-2, -2.927294, -5.646224,
-2, -3.090129, -5.920012,
-1, -2.927294, -5.646224,
-1, -3.090129, -5.920012,
0, -2.927294, -5.646224,
0, -3.090129, -5.920012,
1, -2.927294, -5.646224,
1, -3.090129, -5.920012,
2, -2.927294, -5.646224,
2, -3.090129, -5.920012,
3, -2.927294, -5.646224,
3, -3.090129, -5.920012
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
-3, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
-3, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
-3, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
-3, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
-2, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
-2, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
-2, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
-2, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
-1, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
-1, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
-1, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
-1, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
0, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
0, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
0, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
0, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
1, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
1, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
1, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
1, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
2, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
2, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
2, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
2, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5,
3, -3.415799, -6.46759, 0, -0.5, 0.5, 0.5,
3, -3.415799, -6.46759, 1, -0.5, 0.5, 0.5,
3, -3.415799, -6.46759, 1, 1.5, 0.5, 0.5,
3, -3.415799, -6.46759, 0, 1.5, 0.5, 0.5
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
-3.388427, -2, -5.646224,
-3.388427, 3, -5.646224,
-3.388427, -2, -5.646224,
-3.553711, -2, -5.920012,
-3.388427, -1, -5.646224,
-3.553711, -1, -5.920012,
-3.388427, 0, -5.646224,
-3.553711, 0, -5.920012,
-3.388427, 1, -5.646224,
-3.553711, 1, -5.920012,
-3.388427, 2, -5.646224,
-3.553711, 2, -5.920012,
-3.388427, 3, -5.646224,
-3.553711, 3, -5.920012
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
-3.884278, -2, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, -2, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, -2, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, -2, -6.46759, 0, 1.5, 0.5, 0.5,
-3.884278, -1, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, -1, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, -1, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, -1, -6.46759, 0, 1.5, 0.5, 0.5,
-3.884278, 0, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, 0, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, 0, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, 0, -6.46759, 0, 1.5, 0.5, 0.5,
-3.884278, 1, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, 1, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, 1, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, 1, -6.46759, 0, 1.5, 0.5, 0.5,
-3.884278, 2, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, 2, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, 2, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, 2, -6.46759, 0, 1.5, 0.5, 0.5,
-3.884278, 3, -6.46759, 0, -0.5, 0.5, 0.5,
-3.884278, 3, -6.46759, 1, -0.5, 0.5, 0.5,
-3.884278, 3, -6.46759, 1, 1.5, 0.5, 0.5,
-3.884278, 3, -6.46759, 0, 1.5, 0.5, 0.5
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
-3.388427, -2.927294, -4,
-3.388427, -2.927294, 4,
-3.388427, -2.927294, -4,
-3.553711, -3.090129, -4,
-3.388427, -2.927294, -2,
-3.553711, -3.090129, -2,
-3.388427, -2.927294, 0,
-3.553711, -3.090129, 0,
-3.388427, -2.927294, 2,
-3.553711, -3.090129, 2,
-3.388427, -2.927294, 4,
-3.553711, -3.090129, 4
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
-3.884278, -3.415799, -4, 0, -0.5, 0.5, 0.5,
-3.884278, -3.415799, -4, 1, -0.5, 0.5, 0.5,
-3.884278, -3.415799, -4, 1, 1.5, 0.5, 0.5,
-3.884278, -3.415799, -4, 0, 1.5, 0.5, 0.5,
-3.884278, -3.415799, -2, 0, -0.5, 0.5, 0.5,
-3.884278, -3.415799, -2, 1, -0.5, 0.5, 0.5,
-3.884278, -3.415799, -2, 1, 1.5, 0.5, 0.5,
-3.884278, -3.415799, -2, 0, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 0, 0, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 0, 1, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 0, 1, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 0, 0, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 2, 0, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 2, 1, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 2, 1, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 2, 0, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 4, 0, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 4, 1, -0.5, 0.5, 0.5,
-3.884278, -3.415799, 4, 1, 1.5, 0.5, 0.5,
-3.884278, -3.415799, 4, 0, 1.5, 0.5, 0.5
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
-3.388427, -2.927294, -5.646224,
-3.388427, 3.586112, -5.646224,
-3.388427, -2.927294, 5.305334,
-3.388427, 3.586112, 5.305334,
-3.388427, -2.927294, -5.646224,
-3.388427, -2.927294, 5.305334,
-3.388427, 3.586112, -5.646224,
-3.388427, 3.586112, 5.305334,
-3.388427, -2.927294, -5.646224,
3.222915, -2.927294, -5.646224,
-3.388427, -2.927294, 5.305334,
3.222915, -2.927294, 5.305334,
-3.388427, 3.586112, -5.646224,
3.222915, 3.586112, -5.646224,
-3.388427, 3.586112, 5.305334,
3.222915, 3.586112, 5.305334,
3.222915, -2.927294, -5.646224,
3.222915, 3.586112, -5.646224,
3.222915, -2.927294, 5.305334,
3.222915, 3.586112, 5.305334,
3.222915, -2.927294, -5.646224,
3.222915, -2.927294, 5.305334,
3.222915, 3.586112, -5.646224,
3.222915, 3.586112, 5.305334
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
var radius = 7.665382;
var distance = 34.10415;
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
mvMatrix.translate( 0.08275616, -0.3294091, 0.1704447 );
mvMatrix.scale( 1.253597, 1.272447, 0.7567838 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10415);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
2-heptadecyl-2-imida<-read.table("2-heptadecyl-2-imida.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-2-heptadecyl-2-imida$V2
```

```
## Error in eval(expr, envir, enclos): object 'heptadecyl' not found
```

```r
y<-2-heptadecyl-2-imida$V3
```

```
## Error in eval(expr, envir, enclos): object 'heptadecyl' not found
```

```r
z<-2-heptadecyl-2-imida$V4
```

```
## Error in eval(expr, envir, enclos): object 'heptadecyl' not found
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
-3.292145, -0.84521, -3.143682, 0, 0, 1, 1, 1,
-2.848564, 1.105422, -1.049765, 1, 0, 0, 1, 1,
-2.729831, -0.2759122, -0.5323082, 1, 0, 0, 1, 1,
-2.626545, -0.1952502, -3.134022, 1, 0, 0, 1, 1,
-2.611967, 1.369838, -1.578805, 1, 0, 0, 1, 1,
-2.535404, 1.524736, -0.2483771, 1, 0, 0, 1, 1,
-2.532209, -0.4041419, -0.05318405, 0, 0, 0, 1, 1,
-2.442629, -0.8707862, -0.5544957, 0, 0, 0, 1, 1,
-2.400914, -1.106829, -1.110452, 0, 0, 0, 1, 1,
-2.373462, 0.2975018, -1.715633, 0, 0, 0, 1, 1,
-2.366138, 0.3576786, -2.15105, 0, 0, 0, 1, 1,
-2.350855, 0.2289384, -1.545872, 0, 0, 0, 1, 1,
-2.28081, 0.9208968, -2.24853, 0, 0, 0, 1, 1,
-2.191244, 0.267691, -0.8757467, 1, 1, 1, 1, 1,
-2.168672, 0.07609519, 1.084887, 1, 1, 1, 1, 1,
-2.130731, -1.089363, -1.621927, 1, 1, 1, 1, 1,
-2.104288, 0.1969242, -2.094436, 1, 1, 1, 1, 1,
-2.095654, 1.50067, -1.272027, 1, 1, 1, 1, 1,
-2.075808, 0.002441769, -4.342948, 1, 1, 1, 1, 1,
-1.995145, -1.070122, -2.461407, 1, 1, 1, 1, 1,
-1.955365, -0.6235488, -0.995339, 1, 1, 1, 1, 1,
-1.941212, -0.4864774, -2.052258, 1, 1, 1, 1, 1,
-1.940785, -0.9552834, -2.902354, 1, 1, 1, 1, 1,
-1.93814, -1.170158, -2.226773, 1, 1, 1, 1, 1,
-1.931901, 1.266802, -1.55082, 1, 1, 1, 1, 1,
-1.918412, -0.3942752, -2.310201, 1, 1, 1, 1, 1,
-1.900048, 0.3074358, -1.628743, 1, 1, 1, 1, 1,
-1.881729, 0.503489, -2.648891, 1, 1, 1, 1, 1,
-1.831732, 0.3598516, -3.755253, 0, 0, 1, 1, 1,
-1.804673, 0.7902991, -0.3781669, 1, 0, 0, 1, 1,
-1.763861, 2.365278, -2.196115, 1, 0, 0, 1, 1,
-1.733733, -0.8081372, -2.912526, 1, 0, 0, 1, 1,
-1.73158, -0.06151666, -1.461097, 1, 0, 0, 1, 1,
-1.713301, 2.27914, 1.563443, 1, 0, 0, 1, 1,
-1.687987, -0.5131679, -0.3761261, 0, 0, 0, 1, 1,
-1.677449, 0.5997312, 0.4442599, 0, 0, 0, 1, 1,
-1.662547, -0.2740977, -3.418682, 0, 0, 0, 1, 1,
-1.658221, 1.376722, -0.5908271, 0, 0, 0, 1, 1,
-1.649485, -0.01255191, -1.180761, 0, 0, 0, 1, 1,
-1.638882, -1.303067, -2.502745, 0, 0, 0, 1, 1,
-1.637276, 0.7247978, -0.7210514, 0, 0, 0, 1, 1,
-1.62871, -1.591615, -0.3198251, 1, 1, 1, 1, 1,
-1.623801, -1.253091, -0.4856459, 1, 1, 1, 1, 1,
-1.608816, -2.036402, -2.506263, 1, 1, 1, 1, 1,
-1.594186, 1.572382, -1.085738, 1, 1, 1, 1, 1,
-1.589571, 1.629544, 0.218757, 1, 1, 1, 1, 1,
-1.588764, 0.5699508, -1.326675, 1, 1, 1, 1, 1,
-1.58598, -1.549274, -1.203318, 1, 1, 1, 1, 1,
-1.571491, 0.09836782, -2.752869, 1, 1, 1, 1, 1,
-1.559177, 0.4562027, -1.48183, 1, 1, 1, 1, 1,
-1.555204, -0.4544909, -1.705194, 1, 1, 1, 1, 1,
-1.553622, -0.5163035, -2.050689, 1, 1, 1, 1, 1,
-1.548654, 0.5370923, -0.1113874, 1, 1, 1, 1, 1,
-1.543318, -1.739245, -2.350507, 1, 1, 1, 1, 1,
-1.534784, -0.1975492, -1.729684, 1, 1, 1, 1, 1,
-1.532712, -0.4623054, -1.442915, 1, 1, 1, 1, 1,
-1.525311, 1.066076, -0.1804284, 0, 0, 1, 1, 1,
-1.518397, 0.004783212, -1.770975, 1, 0, 0, 1, 1,
-1.510471, 1.159125, 0.04274279, 1, 0, 0, 1, 1,
-1.509158, 0.819512, -0.8516979, 1, 0, 0, 1, 1,
-1.507971, -0.1811772, -2.321243, 1, 0, 0, 1, 1,
-1.497917, -0.7541313, -3.653964, 1, 0, 0, 1, 1,
-1.484315, -0.8889277, -3.16258, 0, 0, 0, 1, 1,
-1.482009, -0.1725635, -3.586238, 0, 0, 0, 1, 1,
-1.480592, -0.2316206, -1.847848, 0, 0, 0, 1, 1,
-1.468912, 2.092545, 0.9723506, 0, 0, 0, 1, 1,
-1.468084, 0.4131438, -2.520766, 0, 0, 0, 1, 1,
-1.466381, -1.001489, -1.756569, 0, 0, 0, 1, 1,
-1.465484, -1.075433, -0.3045125, 0, 0, 0, 1, 1,
-1.465004, 0.6216446, -1.091195, 1, 1, 1, 1, 1,
-1.453223, 1.641606, -0.3905483, 1, 1, 1, 1, 1,
-1.448557, 0.2649806, 0.1825804, 1, 1, 1, 1, 1,
-1.44823, 1.464475, -1.783874, 1, 1, 1, 1, 1,
-1.433852, -0.518352, -1.040909, 1, 1, 1, 1, 1,
-1.432827, 0.3001142, -1.936728, 1, 1, 1, 1, 1,
-1.42681, 1.613474, -0.5935656, 1, 1, 1, 1, 1,
-1.421594, -1.595206, -3.964208, 1, 1, 1, 1, 1,
-1.420166, 0.1510398, -0.4158599, 1, 1, 1, 1, 1,
-1.397766, 0.1824574, -1.344972, 1, 1, 1, 1, 1,
-1.391472, 0.8337113, 0.4740348, 1, 1, 1, 1, 1,
-1.384163, -0.1950681, -1.144101, 1, 1, 1, 1, 1,
-1.38173, -0.8793361, -0.2631874, 1, 1, 1, 1, 1,
-1.380614, 0.4655311, -1.309858, 1, 1, 1, 1, 1,
-1.366763, 0.9989675, -0.2658627, 1, 1, 1, 1, 1,
-1.333613, -0.3466784, -1.207355, 0, 0, 1, 1, 1,
-1.321976, -0.5172496, -2.87189, 1, 0, 0, 1, 1,
-1.308744, 0.08593847, -1.075352, 1, 0, 0, 1, 1,
-1.300318, 0.9364851, -0.8476439, 1, 0, 0, 1, 1,
-1.296589, 0.9108651, -1.943288, 1, 0, 0, 1, 1,
-1.293473, -1.558066, -1.348029, 1, 0, 0, 1, 1,
-1.292357, 0.5919843, -1.518646, 0, 0, 0, 1, 1,
-1.29044, -1.121862, -3.975755, 0, 0, 0, 1, 1,
-1.288631, 0.9563802, -2.529742, 0, 0, 0, 1, 1,
-1.281807, -1.735144, -4.02819, 0, 0, 0, 1, 1,
-1.270416, -2.339968, -2.047178, 0, 0, 0, 1, 1,
-1.26997, 0.7659744, -1.898618, 0, 0, 0, 1, 1,
-1.26425, 0.8351988, -1.597908, 0, 0, 0, 1, 1,
-1.25629, -0.03564816, -3.065691, 1, 1, 1, 1, 1,
-1.235586, 1.154927, -1.702151, 1, 1, 1, 1, 1,
-1.23061, -0.3609049, -3.182293, 1, 1, 1, 1, 1,
-1.229745, -0.6894785, -2.840132, 1, 1, 1, 1, 1,
-1.221004, -0.8692751, -1.311311, 1, 1, 1, 1, 1,
-1.211492, -0.04672161, -1.17132, 1, 1, 1, 1, 1,
-1.199378, 0.1767602, -0.5503821, 1, 1, 1, 1, 1,
-1.1919, -0.03318333, -2.070847, 1, 1, 1, 1, 1,
-1.188501, -1.16352, -2.089398, 1, 1, 1, 1, 1,
-1.178518, -1.31023, -0.816222, 1, 1, 1, 1, 1,
-1.177118, 0.3086305, -0.9232075, 1, 1, 1, 1, 1,
-1.17497, 0.7979011, -0.7468257, 1, 1, 1, 1, 1,
-1.174277, -1.529336, -2.889356, 1, 1, 1, 1, 1,
-1.174079, 1.245807, 0.7885105, 1, 1, 1, 1, 1,
-1.153675, 0.05106264, -2.90592, 1, 1, 1, 1, 1,
-1.153236, -0.6717312, -3.24175, 0, 0, 1, 1, 1,
-1.146368, 2.293648, -0.9167039, 1, 0, 0, 1, 1,
-1.143589, -0.7081649, -1.010146, 1, 0, 0, 1, 1,
-1.13712, 0.7750747, 1.037242, 1, 0, 0, 1, 1,
-1.125491, 1.617111, -1.208611, 1, 0, 0, 1, 1,
-1.124462, -1.576659, -3.13686, 1, 0, 0, 1, 1,
-1.123442, -0.8098657, -1.394109, 0, 0, 0, 1, 1,
-1.117548, -0.487796, -3.225151, 0, 0, 0, 1, 1,
-1.108711, -0.8670744, -2.203555, 0, 0, 0, 1, 1,
-1.106193, 0.750798, -0.6202919, 0, 0, 0, 1, 1,
-1.103081, 0.1488826, -2.553456, 0, 0, 0, 1, 1,
-1.098037, -1.013543, -2.181612, 0, 0, 0, 1, 1,
-1.096149, 0.09410713, -2.39633, 0, 0, 0, 1, 1,
-1.088796, -0.3435907, -1.772935, 1, 1, 1, 1, 1,
-1.081945, -0.3007902, -1.418784, 1, 1, 1, 1, 1,
-1.070207, 0.4411369, -2.411992, 1, 1, 1, 1, 1,
-1.067659, 0.7489059, -2.766293, 1, 1, 1, 1, 1,
-1.064829, -0.2875109, -1.451722, 1, 1, 1, 1, 1,
-1.060647, -1.062013, -1.979058, 1, 1, 1, 1, 1,
-1.059486, -0.02948499, -0.913423, 1, 1, 1, 1, 1,
-1.058013, 0.9817834, -1.691454, 1, 1, 1, 1, 1,
-1.057322, -1.43351, -0.5760596, 1, 1, 1, 1, 1,
-1.046795, 0.606263, -2.39361, 1, 1, 1, 1, 1,
-1.043168, -0.5152395, -1.351944, 1, 1, 1, 1, 1,
-1.042944, -1.172058, -3.237343, 1, 1, 1, 1, 1,
-1.040122, -0.5487267, -3.434471, 1, 1, 1, 1, 1,
-1.036356, -0.2598358, -2.334646, 1, 1, 1, 1, 1,
-1.022478, -0.5213628, -1.691522, 1, 1, 1, 1, 1,
-1.021546, 0.1663439, -0.4169983, 0, 0, 1, 1, 1,
-1.021282, -0.5622283, -1.683741, 1, 0, 0, 1, 1,
-1.012618, 0.5083296, -2.943161, 1, 0, 0, 1, 1,
-1.011315, -0.5847116, -2.317012, 1, 0, 0, 1, 1,
-1.010307, -0.9728174, -1.608244, 1, 0, 0, 1, 1,
-1.009082, -0.4441093, -1.818527, 1, 0, 0, 1, 1,
-1.008907, 0.7561904, -1.283111, 0, 0, 0, 1, 1,
-1.008879, -0.9732712, -1.751959, 0, 0, 0, 1, 1,
-1.008602, -0.7356023, -2.993033, 0, 0, 0, 1, 1,
-0.9994838, -0.9894557, -1.626244, 0, 0, 0, 1, 1,
-0.9985253, -0.2835231, -1.556485, 0, 0, 0, 1, 1,
-0.9958551, 0.3922681, 0.265015, 0, 0, 0, 1, 1,
-0.9944305, 0.9914473, -2.213701, 0, 0, 0, 1, 1,
-0.9911107, 0.3918928, -0.3001461, 1, 1, 1, 1, 1,
-0.9885559, -1.00937, -1.93365, 1, 1, 1, 1, 1,
-0.9881727, -0.7889655, 0.750343, 1, 1, 1, 1, 1,
-0.9877111, 3.162177, -0.7155637, 1, 1, 1, 1, 1,
-0.9850512, -0.3596582, -2.718573, 1, 1, 1, 1, 1,
-0.9822129, 0.02248353, -2.610921, 1, 1, 1, 1, 1,
-0.9798285, 0.5290797, -2.761569, 1, 1, 1, 1, 1,
-0.9793756, 1.205132, -0.9210457, 1, 1, 1, 1, 1,
-0.9775215, -1.819914, -2.4934, 1, 1, 1, 1, 1,
-0.9769627, -0.5412817, -1.794056, 1, 1, 1, 1, 1,
-0.9726059, -0.8370026, -3.577729, 1, 1, 1, 1, 1,
-0.9617081, -0.7352017, -2.211417, 1, 1, 1, 1, 1,
-0.9600745, -0.9823995, -1.902909, 1, 1, 1, 1, 1,
-0.9442241, 1.391267, -1.766371, 1, 1, 1, 1, 1,
-0.9304752, 0.3573316, -2.266299, 1, 1, 1, 1, 1,
-0.9264566, -0.5868405, -1.947728, 0, 0, 1, 1, 1,
-0.9146888, 0.7427647, -0.0882241, 1, 0, 0, 1, 1,
-0.913376, -0.8051456, -3.421822, 1, 0, 0, 1, 1,
-0.9131836, 0.5848818, -1.819002, 1, 0, 0, 1, 1,
-0.908321, -0.8308772, 0.004022725, 1, 0, 0, 1, 1,
-0.9020116, 0.1095557, -1.130751, 1, 0, 0, 1, 1,
-0.9001168, -0.6131276, -1.106759, 0, 0, 0, 1, 1,
-0.8999849, 0.9089211, -2.045845, 0, 0, 0, 1, 1,
-0.8998777, 0.2146127, -1.194265, 0, 0, 0, 1, 1,
-0.8993709, -0.7081906, -2.141626, 0, 0, 0, 1, 1,
-0.8986937, -0.7454042, -3.173109, 0, 0, 0, 1, 1,
-0.8927467, -1.033115, -1.84724, 0, 0, 0, 1, 1,
-0.8907592, 0.4384901, 0.1247553, 0, 0, 0, 1, 1,
-0.8895016, -0.6370246, -1.73684, 1, 1, 1, 1, 1,
-0.8893424, -0.4249591, -2.559687, 1, 1, 1, 1, 1,
-0.8889669, 1.820626, -0.1298546, 1, 1, 1, 1, 1,
-0.8757507, -0.8293625, -2.458194, 1, 1, 1, 1, 1,
-0.874624, -0.816225, -3.070017, 1, 1, 1, 1, 1,
-0.8686877, -1.083702, -2.43552, 1, 1, 1, 1, 1,
-0.8654744, 0.1986138, -0.9403782, 1, 1, 1, 1, 1,
-0.8629082, 1.077971, -2.678887, 1, 1, 1, 1, 1,
-0.8616869, 1.080007, 0.1433403, 1, 1, 1, 1, 1,
-0.8568149, -1.20718, -1.153682, 1, 1, 1, 1, 1,
-0.8560629, 0.8830301, -0.2333536, 1, 1, 1, 1, 1,
-0.8466819, 1.552127, 1.662356, 1, 1, 1, 1, 1,
-0.8456973, 0.8366292, 0.1194965, 1, 1, 1, 1, 1,
-0.8451983, -0.1317421, 0.04501539, 1, 1, 1, 1, 1,
-0.8429608, 0.3024983, -2.242165, 1, 1, 1, 1, 1,
-0.8421935, 0.3989771, -1.725953, 0, 0, 1, 1, 1,
-0.8374307, 0.4400775, -1.015355, 1, 0, 0, 1, 1,
-0.8349541, 1.119833, -0.6556517, 1, 0, 0, 1, 1,
-0.8332915, 0.9574426, -1.232974, 1, 0, 0, 1, 1,
-0.8245444, 0.02242392, -2.555092, 1, 0, 0, 1, 1,
-0.8202472, 0.3149397, -0.9473343, 1, 0, 0, 1, 1,
-0.8162153, 0.06720217, -0.4927676, 0, 0, 0, 1, 1,
-0.8129236, 0.9787788, -0.9014096, 0, 0, 0, 1, 1,
-0.8108263, -0.5406555, -1.995805, 0, 0, 0, 1, 1,
-0.8075994, 0.6609774, -1.500549, 0, 0, 0, 1, 1,
-0.806347, -0.6244994, -0.977909, 0, 0, 0, 1, 1,
-0.8046635, -0.5271436, -1.406094, 0, 0, 0, 1, 1,
-0.803531, 0.1616324, -0.5233876, 0, 0, 0, 1, 1,
-0.7977876, 0.8905045, -0.2643806, 1, 1, 1, 1, 1,
-0.7962521, -0.002246609, -1.260329, 1, 1, 1, 1, 1,
-0.788243, -1.402001, -3.947511, 1, 1, 1, 1, 1,
-0.7848964, -0.4348722, -3.371472, 1, 1, 1, 1, 1,
-0.7785687, 0.001914178, -2.368468, 1, 1, 1, 1, 1,
-0.7697084, 0.2973926, -1.355915, 1, 1, 1, 1, 1,
-0.7685928, -1.626866, -1.68719, 1, 1, 1, 1, 1,
-0.7651117, 0.4520345, -1.59897, 1, 1, 1, 1, 1,
-0.7620643, -0.02672348, -0.8713062, 1, 1, 1, 1, 1,
-0.7571911, 2.538996, -0.2915481, 1, 1, 1, 1, 1,
-0.7568741, -1.128063, -0.9577161, 1, 1, 1, 1, 1,
-0.7542523, 0.7414416, -1.402091, 1, 1, 1, 1, 1,
-0.7495885, 0.9460635, -0.6072538, 1, 1, 1, 1, 1,
-0.7446499, -0.6984851, -3.077342, 1, 1, 1, 1, 1,
-0.7414048, 0.6287755, -1.945923, 1, 1, 1, 1, 1,
-0.7333295, 0.05086501, -1.862445, 0, 0, 1, 1, 1,
-0.7318534, -0.6549867, -3.008278, 1, 0, 0, 1, 1,
-0.7287385, -0.001942325, -1.212534, 1, 0, 0, 1, 1,
-0.7270575, 0.2929802, -1.341086, 1, 0, 0, 1, 1,
-0.7257169, 0.5482988, -0.09818976, 1, 0, 0, 1, 1,
-0.7253109, 0.7366441, -0.473924, 1, 0, 0, 1, 1,
-0.7239755, -0.8543019, -1.882824, 0, 0, 0, 1, 1,
-0.7186137, 0.4674485, -0.1293793, 0, 0, 0, 1, 1,
-0.7145312, -1.320731, -1.715068, 0, 0, 0, 1, 1,
-0.7129037, 0.7214876, -0.8129204, 0, 0, 0, 1, 1,
-0.712479, -1.756474, -2.004287, 0, 0, 0, 1, 1,
-0.7121944, -0.4862488, -2.331877, 0, 0, 0, 1, 1,
-0.7059535, 2.520073, -0.3709515, 0, 0, 0, 1, 1,
-0.7052774, 0.3025576, -2.05258, 1, 1, 1, 1, 1,
-0.6970222, -0.5402306, -2.686636, 1, 1, 1, 1, 1,
-0.6967204, -1.476436, -3.076765, 1, 1, 1, 1, 1,
-0.6915556, -1.619389, -3.886918, 1, 1, 1, 1, 1,
-0.6884307, 0.1345176, -2.728546, 1, 1, 1, 1, 1,
-0.6855661, -0.0008222294, -1.238457, 1, 1, 1, 1, 1,
-0.6818893, 0.4532776, -1.068477, 1, 1, 1, 1, 1,
-0.6707833, 0.4872123, -1.629893, 1, 1, 1, 1, 1,
-0.670333, -1.360285, -2.787031, 1, 1, 1, 1, 1,
-0.6677636, 1.814602, 0.253891, 1, 1, 1, 1, 1,
-0.6660145, 0.3557783, -2.423849, 1, 1, 1, 1, 1,
-0.6655124, -0.239132, -0.3308966, 1, 1, 1, 1, 1,
-0.664626, -1.336373, -3.36617, 1, 1, 1, 1, 1,
-0.6612494, -0.1705377, -2.286112, 1, 1, 1, 1, 1,
-0.6608786, -0.465656, -1.630213, 1, 1, 1, 1, 1,
-0.6604706, -0.9336455, -2.511291, 0, 0, 1, 1, 1,
-0.6600279, 0.1587845, -0.6003928, 1, 0, 0, 1, 1,
-0.6534014, 1.956135, 0.2364578, 1, 0, 0, 1, 1,
-0.6497933, 1.904924, 0.3713062, 1, 0, 0, 1, 1,
-0.6406787, -1.293002, -2.64672, 1, 0, 0, 1, 1,
-0.6362043, -0.930932, -3.083713, 1, 0, 0, 1, 1,
-0.6355616, 1.168735, -1.82501, 0, 0, 0, 1, 1,
-0.634021, 1.473641, -0.8007382, 0, 0, 0, 1, 1,
-0.6294805, 2.152406, 1.233725, 0, 0, 0, 1, 1,
-0.6152746, 0.2728576, -1.409922, 0, 0, 0, 1, 1,
-0.6126781, -1.260859, -2.432396, 0, 0, 0, 1, 1,
-0.611783, 0.6817433, -0.7717906, 0, 0, 0, 1, 1,
-0.6090598, 0.1758273, -2.138485, 0, 0, 0, 1, 1,
-0.6078738, -0.1533157, 0.6266966, 1, 1, 1, 1, 1,
-0.6061724, -0.2858391, -1.843578, 1, 1, 1, 1, 1,
-0.604534, 1.548964, -0.8542312, 1, 1, 1, 1, 1,
-0.6013302, -2.554641, -2.14082, 1, 1, 1, 1, 1,
-0.6010269, 0.4937057, -1.415945, 1, 1, 1, 1, 1,
-0.6005096, -0.240258, -2.048069, 1, 1, 1, 1, 1,
-0.5883077, -0.669562, -3.051367, 1, 1, 1, 1, 1,
-0.5861983, 0.6109881, -1.55382, 1, 1, 1, 1, 1,
-0.5860157, -1.127299, -1.473811, 1, 1, 1, 1, 1,
-0.5814055, 0.06174125, -0.8750072, 1, 1, 1, 1, 1,
-0.5804151, 0.08921544, -1.91049, 1, 1, 1, 1, 1,
-0.5761766, -0.6837937, -2.698246, 1, 1, 1, 1, 1,
-0.5747967, -0.4777426, -1.681746, 1, 1, 1, 1, 1,
-0.5735193, 1.131198, -1.633444, 1, 1, 1, 1, 1,
-0.5716302, -0.752516, -2.629262, 1, 1, 1, 1, 1,
-0.5704042, -0.8466241, -1.881258, 0, 0, 1, 1, 1,
-0.5694795, -0.2948216, -0.4857838, 1, 0, 0, 1, 1,
-0.5655574, 1.265237, -1.189544, 1, 0, 0, 1, 1,
-0.5618722, -0.6929097, -1.304939, 1, 0, 0, 1, 1,
-0.5576604, -0.4286161, -1.77647, 1, 0, 0, 1, 1,
-0.5518118, 0.6340086, 0.1200511, 1, 0, 0, 1, 1,
-0.5473202, 0.7448613, -0.8091604, 0, 0, 0, 1, 1,
-0.5452827, 1.554082, -1.145818, 0, 0, 0, 1, 1,
-0.5410137, -0.3572174, -1.583531, 0, 0, 0, 1, 1,
-0.536954, -1.026777, -2.472715, 0, 0, 0, 1, 1,
-0.5347337, 1.474124, -0.5684663, 0, 0, 0, 1, 1,
-0.534343, 0.3829999, 0.06003575, 0, 0, 0, 1, 1,
-0.5323683, 0.7261917, -0.2938255, 0, 0, 0, 1, 1,
-0.525713, 1.1074, -0.4065003, 1, 1, 1, 1, 1,
-0.5250275, 0.1127474, -0.789256, 1, 1, 1, 1, 1,
-0.5244555, 1.626363, 1.079205, 1, 1, 1, 1, 1,
-0.5217397, 1.226196, 0.6268108, 1, 1, 1, 1, 1,
-0.5111605, 1.150431, -1.59521, 1, 1, 1, 1, 1,
-0.5090383, 0.07089943, -0.6477663, 1, 1, 1, 1, 1,
-0.5087408, 0.9664478, -0.1855286, 1, 1, 1, 1, 1,
-0.5040853, -0.7582, -2.290032, 1, 1, 1, 1, 1,
-0.5024989, 0.4862691, -0.1548227, 1, 1, 1, 1, 1,
-0.4997879, -1.072526, -1.94697, 1, 1, 1, 1, 1,
-0.4907056, -0.490726, -2.148425, 1, 1, 1, 1, 1,
-0.4903149, -0.9550587, -3.542583, 1, 1, 1, 1, 1,
-0.4893014, 0.6120332, 0.5843167, 1, 1, 1, 1, 1,
-0.4809951, 0.5265433, 0.4144917, 1, 1, 1, 1, 1,
-0.4804608, -0.6124542, -1.387747, 1, 1, 1, 1, 1,
-0.4716786, 0.6711317, -0.2376503, 0, 0, 1, 1, 1,
-0.4716343, -0.402367, -1.551753, 1, 0, 0, 1, 1,
-0.4562592, -0.3280586, -1.919474, 1, 0, 0, 1, 1,
-0.4550031, -0.9184578, -1.542999, 1, 0, 0, 1, 1,
-0.452673, 1.165155, 0.5113767, 1, 0, 0, 1, 1,
-0.4513287, -0.5051769, -0.6265907, 1, 0, 0, 1, 1,
-0.4471982, -0.2939089, -1.547665, 0, 0, 0, 1, 1,
-0.4466753, 0.8600609, -0.9999437, 0, 0, 0, 1, 1,
-0.4464962, -0.5571361, -0.9267558, 0, 0, 0, 1, 1,
-0.4443602, 0.5382354, 0.4390598, 0, 0, 0, 1, 1,
-0.442656, 0.6320166, -1.710517, 0, 0, 0, 1, 1,
-0.4395198, -0.7759069, -2.97721, 0, 0, 0, 1, 1,
-0.43806, -0.9297943, -2.395844, 0, 0, 0, 1, 1,
-0.4372362, 1.040124, -1.965558, 1, 1, 1, 1, 1,
-0.4335854, -0.8505788, -1.052946, 1, 1, 1, 1, 1,
-0.4281927, -0.912528, -1.889426, 1, 1, 1, 1, 1,
-0.4278408, 0.4617902, -1.54773, 1, 1, 1, 1, 1,
-0.4261764, 0.9906285, -0.693239, 1, 1, 1, 1, 1,
-0.4258948, -0.118025, -2.591359, 1, 1, 1, 1, 1,
-0.4235655, -0.5249232, -2.501035, 1, 1, 1, 1, 1,
-0.4168364, 1.313132, -0.2049603, 1, 1, 1, 1, 1,
-0.4145287, -0.1429535, -2.623602, 1, 1, 1, 1, 1,
-0.4113599, 1.776114, 0.5271361, 1, 1, 1, 1, 1,
-0.4089618, -0.407499, -2.140965, 1, 1, 1, 1, 1,
-0.40682, 0.2860813, -0.0982691, 1, 1, 1, 1, 1,
-0.4046968, -0.7001643, -2.40799, 1, 1, 1, 1, 1,
-0.4011151, 1.918534, -2.188935, 1, 1, 1, 1, 1,
-0.4010516, 0.4175393, 1.303772, 1, 1, 1, 1, 1,
-0.4009902, 0.1186095, -2.099999, 0, 0, 1, 1, 1,
-0.3998257, 0.4391945, -2.000259, 1, 0, 0, 1, 1,
-0.3996721, 1.73493, 0.2462907, 1, 0, 0, 1, 1,
-0.3989798, 1.279534, -2.113523, 1, 0, 0, 1, 1,
-0.3949656, -1.34517, -1.545219, 1, 0, 0, 1, 1,
-0.39359, -1.755365, -3.074581, 1, 0, 0, 1, 1,
-0.391265, 1.559431, -0.8618701, 0, 0, 0, 1, 1,
-0.3802859, -0.8196349, -4.129166, 0, 0, 0, 1, 1,
-0.3794293, -0.9547831, -2.542514, 0, 0, 0, 1, 1,
-0.3755321, -0.2650991, -3.629073, 0, 0, 0, 1, 1,
-0.3736789, 0.05343755, -1.687929, 0, 0, 0, 1, 1,
-0.3706404, 2.079465, 1.438445, 0, 0, 0, 1, 1,
-0.3698874, 0.03851175, -1.680254, 0, 0, 0, 1, 1,
-0.3660319, 0.7198882, -1.530752, 1, 1, 1, 1, 1,
-0.3626512, -1.51969, -2.439013, 1, 1, 1, 1, 1,
-0.3596645, 0.8350929, -1.230443, 1, 1, 1, 1, 1,
-0.3594505, 0.01926844, -0.6674607, 1, 1, 1, 1, 1,
-0.355011, -0.3201819, -1.308294, 1, 1, 1, 1, 1,
-0.3519702, -0.288457, -3.336144, 1, 1, 1, 1, 1,
-0.3509804, -0.562161, -0.9395196, 1, 1, 1, 1, 1,
-0.3461525, -0.2505607, -1.128402, 1, 1, 1, 1, 1,
-0.3439115, -0.4532342, -2.691239, 1, 1, 1, 1, 1,
-0.3436775, -0.6230856, -3.519901, 1, 1, 1, 1, 1,
-0.3428471, -1.621595, -3.046236, 1, 1, 1, 1, 1,
-0.3414699, 0.1541668, -0.7720716, 1, 1, 1, 1, 1,
-0.339134, -0.7626248, -2.881523, 1, 1, 1, 1, 1,
-0.3304945, -0.8963739, -4.582982, 1, 1, 1, 1, 1,
-0.3288779, -1.405358, -4.077245, 1, 1, 1, 1, 1,
-0.3271772, -0.1840189, -2.199386, 0, 0, 1, 1, 1,
-0.3258385, 0.3134637, -0.4397951, 1, 0, 0, 1, 1,
-0.32454, -1.979846, -1.684099, 1, 0, 0, 1, 1,
-0.3230874, 1.367955, 0.9831658, 1, 0, 0, 1, 1,
-0.3211414, 0.1886962, -2.38309, 1, 0, 0, 1, 1,
-0.3209824, -0.5762945, -1.621837, 1, 0, 0, 1, 1,
-0.3198982, 0.9136068, 0.1459403, 0, 0, 0, 1, 1,
-0.3187036, -1.525699, -3.027889, 0, 0, 0, 1, 1,
-0.3090562, 0.01202935, -0.3375866, 0, 0, 0, 1, 1,
-0.3085775, 0.8981131, -0.3958772, 0, 0, 0, 1, 1,
-0.3079304, 0.1336171, -0.8690181, 0, 0, 0, 1, 1,
-0.3042628, -0.6863337, -4.075123, 0, 0, 0, 1, 1,
-0.3022451, -0.3331064, -2.104056, 0, 0, 0, 1, 1,
-0.3015704, -0.5516075, -0.5993968, 1, 1, 1, 1, 1,
-0.3005308, 1.613484, 1.323302, 1, 1, 1, 1, 1,
-0.2999373, 1.242716, 1.062245, 1, 1, 1, 1, 1,
-0.2974848, -0.5965282, -2.711036, 1, 1, 1, 1, 1,
-0.2961853, -1.10177, -3.334411, 1, 1, 1, 1, 1,
-0.2953094, 0.9253581, -1.033473, 1, 1, 1, 1, 1,
-0.2918661, 0.9494334, 0.2072744, 1, 1, 1, 1, 1,
-0.2850159, -1.180259, -3.22808, 1, 1, 1, 1, 1,
-0.2772339, 0.2127386, 0.5450403, 1, 1, 1, 1, 1,
-0.2757711, -0.3514963, -2.273258, 1, 1, 1, 1, 1,
-0.2731909, -0.2636177, -2.680223, 1, 1, 1, 1, 1,
-0.2715563, -0.5892335, -2.459382, 1, 1, 1, 1, 1,
-0.2712462, -0.1038922, -2.025128, 1, 1, 1, 1, 1,
-0.2690479, -0.5054029, -3.505045, 1, 1, 1, 1, 1,
-0.2648616, 0.6649376, -1.03627, 1, 1, 1, 1, 1,
-0.264797, -0.2410855, -1.839881, 0, 0, 1, 1, 1,
-0.2644451, 0.4089321, -0.1247716, 1, 0, 0, 1, 1,
-0.2626298, -0.6047169, -2.829882, 1, 0, 0, 1, 1,
-0.2569478, -0.1895507, -1.85856, 1, 0, 0, 1, 1,
-0.2569368, 0.7464072, -0.8015768, 1, 0, 0, 1, 1,
-0.2568862, 0.2091211, -3.049608, 1, 0, 0, 1, 1,
-0.2539693, -0.3153428, -3.87727, 0, 0, 0, 1, 1,
-0.2535405, 1.256665, -0.3854205, 0, 0, 0, 1, 1,
-0.2500602, -0.6899051, -1.276974, 0, 0, 0, 1, 1,
-0.2409808, 0.55585, 0.01377206, 0, 0, 0, 1, 1,
-0.2408197, 0.265548, 0.3580888, 0, 0, 0, 1, 1,
-0.2321221, 0.276861, 0.3091016, 0, 0, 0, 1, 1,
-0.2292701, 0.114643, -1.895614, 0, 0, 0, 1, 1,
-0.2276785, 0.04235339, -1.167021, 1, 1, 1, 1, 1,
-0.222963, 2.037592, -2.176399, 1, 1, 1, 1, 1,
-0.2226478, 0.6591479, -0.6833162, 1, 1, 1, 1, 1,
-0.2218511, -1.593216, -2.940292, 1, 1, 1, 1, 1,
-0.2195812, 0.104374, 0.5042724, 1, 1, 1, 1, 1,
-0.2161877, 0.9203036, -1.296118, 1, 1, 1, 1, 1,
-0.2161453, -0.36951, -2.061406, 1, 1, 1, 1, 1,
-0.2120869, 0.6253608, -0.2916534, 1, 1, 1, 1, 1,
-0.2114612, -0.1470942, -3.279303, 1, 1, 1, 1, 1,
-0.208535, 0.9876382, -0.7912681, 1, 1, 1, 1, 1,
-0.2083181, -0.1435985, -1.831215, 1, 1, 1, 1, 1,
-0.2058766, 0.8006077, -0.9339178, 1, 1, 1, 1, 1,
-0.2035109, 1.155388, -0.07485258, 1, 1, 1, 1, 1,
-0.2026429, 0.2487602, -0.08549324, 1, 1, 1, 1, 1,
-0.2019772, 0.3221119, -1.521075, 1, 1, 1, 1, 1,
-0.2013059, 0.7209307, -1.369781, 0, 0, 1, 1, 1,
-0.2006333, -1.550254, -4.568867, 1, 0, 0, 1, 1,
-0.1983221, 0.7550567, -0.07318722, 1, 0, 0, 1, 1,
-0.1926986, -1.412188, -2.694801, 1, 0, 0, 1, 1,
-0.1888887, 0.9404477, 1.560995, 1, 0, 0, 1, 1,
-0.1866648, -0.02509703, -2.520509, 1, 0, 0, 1, 1,
-0.1866102, -0.04853582, -1.667358, 0, 0, 0, 1, 1,
-0.1851932, -0.8311415, -1.611323, 0, 0, 0, 1, 1,
-0.181937, -0.02399717, -1.019969, 0, 0, 0, 1, 1,
-0.1809351, -0.3122442, -3.221756, 0, 0, 0, 1, 1,
-0.1726252, -1.53156, -2.524633, 0, 0, 0, 1, 1,
-0.1707303, 1.728819, 0.01900513, 0, 0, 0, 1, 1,
-0.1694373, -1.312771, -3.375226, 0, 0, 0, 1, 1,
-0.1693807, 0.7613922, -0.2574192, 1, 1, 1, 1, 1,
-0.1666753, 1.949188, -0.938526, 1, 1, 1, 1, 1,
-0.1659065, -1.517854, -2.366564, 1, 1, 1, 1, 1,
-0.1627293, 0.5894166, 0.4168082, 1, 1, 1, 1, 1,
-0.1559584, -1.439101, -2.027123, 1, 1, 1, 1, 1,
-0.1498901, -0.1503542, -1.910965, 1, 1, 1, 1, 1,
-0.1481654, 0.6374919, 0.09767383, 1, 1, 1, 1, 1,
-0.1471128, -0.3595442, -5.486735, 1, 1, 1, 1, 1,
-0.1459905, -0.6858945, -2.218432, 1, 1, 1, 1, 1,
-0.1440158, -0.8165435, -4.442226, 1, 1, 1, 1, 1,
-0.1431172, 0.9693424, -0.9748778, 1, 1, 1, 1, 1,
-0.1425027, 0.4865492, -0.08182468, 1, 1, 1, 1, 1,
-0.1422638, 0.8425257, -0.6150261, 1, 1, 1, 1, 1,
-0.1402523, 1.293055, 2.113501, 1, 1, 1, 1, 1,
-0.1399863, -0.7742333, -2.194913, 1, 1, 1, 1, 1,
-0.135352, 1.187853, 1.132578, 0, 0, 1, 1, 1,
-0.1337596, 1.071556, -0.5754932, 1, 0, 0, 1, 1,
-0.132218, 0.1331834, -2.580508, 1, 0, 0, 1, 1,
-0.1300253, 0.2609407, -0.5085522, 1, 0, 0, 1, 1,
-0.1282858, -0.6731956, -2.693321, 1, 0, 0, 1, 1,
-0.1230024, 0.4139619, -0.6927472, 1, 0, 0, 1, 1,
-0.1227481, 0.7157637, 0.7031221, 0, 0, 0, 1, 1,
-0.1118001, -0.9022489, -3.881958, 0, 0, 0, 1, 1,
-0.1077991, -1.991237, -4.613554, 0, 0, 0, 1, 1,
-0.1049212, -0.3616235, -2.78001, 0, 0, 0, 1, 1,
-0.0967944, 1.333625, 0.8463957, 0, 0, 0, 1, 1,
-0.09509651, -1.228287, -2.316843, 0, 0, 0, 1, 1,
-0.09293557, 1.535094, 1.911069, 0, 0, 0, 1, 1,
-0.08798251, -1.114673, -1.690779, 1, 1, 1, 1, 1,
-0.08763416, 0.2278681, -0.6259485, 1, 1, 1, 1, 1,
-0.08759613, -0.6288403, -3.024609, 1, 1, 1, 1, 1,
-0.08688417, 0.0197251, -2.298399, 1, 1, 1, 1, 1,
-0.08426976, 2.339014, -0.7597665, 1, 1, 1, 1, 1,
-0.08366137, -1.066736, -4.20425, 1, 1, 1, 1, 1,
-0.07833404, -0.8686975, -4.810911, 1, 1, 1, 1, 1,
-0.07701492, 0.56177, -0.3790554, 1, 1, 1, 1, 1,
-0.0703027, -0.5936837, -3.078055, 1, 1, 1, 1, 1,
-0.06951534, -1.290052, -3.039808, 1, 1, 1, 1, 1,
-0.06899361, -0.9196618, -2.098772, 1, 1, 1, 1, 1,
-0.06468495, -0.02966674, -3.004919, 1, 1, 1, 1, 1,
-0.06233247, 0.1581249, -1.710938, 1, 1, 1, 1, 1,
-0.05999829, -0.01500546, -2.292385, 1, 1, 1, 1, 1,
-0.05612355, -0.1287081, -1.728055, 1, 1, 1, 1, 1,
-0.05426743, 0.2526618, -0.6325571, 0, 0, 1, 1, 1,
-0.05367924, -0.2090209, -3.150003, 1, 0, 0, 1, 1,
-0.05227771, 1.438563, 1.191788, 1, 0, 0, 1, 1,
-0.05178531, -0.05145026, -2.491539, 1, 0, 0, 1, 1,
-0.04535496, 0.4348645, -0.003019982, 1, 0, 0, 1, 1,
-0.04338964, 1.599052, 2.922567, 1, 0, 0, 1, 1,
-0.03957092, 1.142753, 0.2235083, 0, 0, 0, 1, 1,
-0.03761305, -0.7230658, -2.843528, 0, 0, 0, 1, 1,
-0.03586532, 1.00202, -0.6387477, 0, 0, 0, 1, 1,
-0.02905737, -0.7828668, -2.802675, 0, 0, 0, 1, 1,
-0.02770359, 0.881037, -1.232192, 0, 0, 0, 1, 1,
-0.01787694, 0.7119805, 2.503826, 0, 0, 0, 1, 1,
-0.01550639, 0.7718063, -1.263988, 0, 0, 0, 1, 1,
-0.01289446, 0.1225303, 1.800822, 1, 1, 1, 1, 1,
-0.01181881, -0.2102422, -4.179675, 1, 1, 1, 1, 1,
-0.01157281, -2.787399, -3.359039, 1, 1, 1, 1, 1,
-0.0034515, 0.9776387, -1.062099, 1, 1, 1, 1, 1,
-0.0005395321, -0.2923827, -3.43061, 1, 1, 1, 1, 1,
0.001079488, 1.57654, -0.08876495, 1, 1, 1, 1, 1,
0.00163898, -0.7244328, 1.785845, 1, 1, 1, 1, 1,
0.002247725, 1.820687, -0.1010475, 1, 1, 1, 1, 1,
0.002988945, -0.3071561, 5.145845, 1, 1, 1, 1, 1,
0.003263737, 0.09094232, -0.5068465, 1, 1, 1, 1, 1,
0.01624471, 0.2080872, 0.5063168, 1, 1, 1, 1, 1,
0.01815596, 1.024002, 0.06055159, 1, 1, 1, 1, 1,
0.02050091, -0.1565185, 3.615726, 1, 1, 1, 1, 1,
0.02732712, -1.395551, 3.469126, 1, 1, 1, 1, 1,
0.02781324, 0.7820385, 1.239341, 1, 1, 1, 1, 1,
0.0308455, 1.875123, -1.250154, 0, 0, 1, 1, 1,
0.03333798, -0.4851842, 2.888841, 1, 0, 0, 1, 1,
0.04079701, 0.744006, -0.3031541, 1, 0, 0, 1, 1,
0.04091149, 0.1991023, -0.9023767, 1, 0, 0, 1, 1,
0.04558939, 0.2766507, -0.4608988, 1, 0, 0, 1, 1,
0.05087585, -0.7222528, 2.123765, 1, 0, 0, 1, 1,
0.05185305, -0.296542, 1.7086, 0, 0, 0, 1, 1,
0.05437297, 0.3914095, 1.091124, 0, 0, 0, 1, 1,
0.0589174, -0.513961, 3.025183, 0, 0, 0, 1, 1,
0.0623127, 0.7104269, -1.837828, 0, 0, 0, 1, 1,
0.0708099, -1.017425, 3.163522, 0, 0, 0, 1, 1,
0.07123061, -0.8708296, 4.001331, 0, 0, 0, 1, 1,
0.07209381, -1.782256, 2.554995, 0, 0, 0, 1, 1,
0.07502861, -0.3742624, 2.535202, 1, 1, 1, 1, 1,
0.07587127, 1.933686, -0.4198308, 1, 1, 1, 1, 1,
0.08000079, 1.310953, -1.050554, 1, 1, 1, 1, 1,
0.08244959, 1.225553, 0.8985847, 1, 1, 1, 1, 1,
0.08274827, 0.7733181, 0.8953605, 1, 1, 1, 1, 1,
0.0843176, 0.3279255, -0.1445664, 1, 1, 1, 1, 1,
0.08888958, -1.128644, 3.412267, 1, 1, 1, 1, 1,
0.08907493, -0.07733236, 4.205366, 1, 1, 1, 1, 1,
0.0903784, -0.7167228, 1.720551, 1, 1, 1, 1, 1,
0.09288745, -1.21403, 2.894186, 1, 1, 1, 1, 1,
0.09623463, 1.63395, -0.7196761, 1, 1, 1, 1, 1,
0.09713747, -0.6167266, 2.751383, 1, 1, 1, 1, 1,
0.09854756, -0.8922279, 2.743699, 1, 1, 1, 1, 1,
0.09906612, 1.962751, 1.217556, 1, 1, 1, 1, 1,
0.1028075, -2.245232, 4.324654, 1, 1, 1, 1, 1,
0.1079562, -0.4599076, 2.972306, 0, 0, 1, 1, 1,
0.1079643, 3.491257, 0.07600195, 1, 0, 0, 1, 1,
0.1092942, -1.486125, 4.358943, 1, 0, 0, 1, 1,
0.1101025, -0.5883334, 3.392104, 1, 0, 0, 1, 1,
0.1155498, 2.442913, -2.192206, 1, 0, 0, 1, 1,
0.1199496, -0.9283687, 3.258538, 1, 0, 0, 1, 1,
0.1215662, -0.9331723, 2.748994, 0, 0, 0, 1, 1,
0.1286692, -0.3423385, 2.360196, 0, 0, 0, 1, 1,
0.1317121, -0.3627313, 3.12941, 0, 0, 0, 1, 1,
0.1318518, -0.4717847, 1.430336, 0, 0, 0, 1, 1,
0.1345523, -0.240648, 1.942022, 0, 0, 0, 1, 1,
0.1376044, -0.4600819, 1.935176, 0, 0, 0, 1, 1,
0.1458639, -1.169571, 3.046511, 0, 0, 0, 1, 1,
0.1466798, -0.5035555, 2.502677, 1, 1, 1, 1, 1,
0.1481515, -0.3579698, 2.56993, 1, 1, 1, 1, 1,
0.1490681, 0.5042922, -0.9253764, 1, 1, 1, 1, 1,
0.1560908, 0.4975175, -0.6921699, 1, 1, 1, 1, 1,
0.1595057, -0.1530962, 0.8539928, 1, 1, 1, 1, 1,
0.1598919, -1.591413, 2.316259, 1, 1, 1, 1, 1,
0.1624832, 0.2678253, 0.3282654, 1, 1, 1, 1, 1,
0.1637625, 0.5082297, 0.7355217, 1, 1, 1, 1, 1,
0.1706058, 0.2444983, 0.6746194, 1, 1, 1, 1, 1,
0.1716567, 0.4562739, 0.2936108, 1, 1, 1, 1, 1,
0.173237, -0.2067319, 4.213992, 1, 1, 1, 1, 1,
0.1732524, -1.102339, 4.260819, 1, 1, 1, 1, 1,
0.1735147, 0.08832956, 1.213539, 1, 1, 1, 1, 1,
0.1753893, -1.041158, 2.692017, 1, 1, 1, 1, 1,
0.1785783, -0.4358836, 2.913316, 1, 1, 1, 1, 1,
0.1789905, 0.1593179, 1.253475, 0, 0, 1, 1, 1,
0.1795733, -0.792174, 4.728216, 1, 0, 0, 1, 1,
0.1806142, 0.9060091, -0.6144311, 1, 0, 0, 1, 1,
0.1831634, 0.1452719, 1.00793, 1, 0, 0, 1, 1,
0.1844322, -2.43609, 4.20959, 1, 0, 0, 1, 1,
0.1873069, 0.04412528, 1.600382, 1, 0, 0, 1, 1,
0.1905167, -0.08156666, 3.375814, 0, 0, 0, 1, 1,
0.1922836, -0.09471749, 3.015476, 0, 0, 0, 1, 1,
0.1932018, 1.276229, 0.2531611, 0, 0, 0, 1, 1,
0.1936091, 1.088793, 1.318223, 0, 0, 0, 1, 1,
0.1938852, 1.233551, 0.8136492, 0, 0, 0, 1, 1,
0.1948009, -1.217623, 3.923582, 0, 0, 0, 1, 1,
0.1952611, -1.631604, 3.454759, 0, 0, 0, 1, 1,
0.1981205, 0.05324574, 1.674894, 1, 1, 1, 1, 1,
0.1987151, -1.26795, 3.467851, 1, 1, 1, 1, 1,
0.2003082, 0.5010121, -0.7416832, 1, 1, 1, 1, 1,
0.2032396, -1.180402, 3.870852, 1, 1, 1, 1, 1,
0.2073173, -0.5467036, 2.242903, 1, 1, 1, 1, 1,
0.2077561, -1.176209, 4.61537, 1, 1, 1, 1, 1,
0.2084365, 0.926022, 0.1343441, 1, 1, 1, 1, 1,
0.2104883, 0.09269043, -0.2016817, 1, 1, 1, 1, 1,
0.2145093, -0.9824262, 2.815326, 1, 1, 1, 1, 1,
0.2167051, 1.115639, 1.469922, 1, 1, 1, 1, 1,
0.2229043, -2.421265, 2.993991, 1, 1, 1, 1, 1,
0.2248198, 0.5752451, -0.1621808, 1, 1, 1, 1, 1,
0.2298828, 0.5304516, -0.3304618, 1, 1, 1, 1, 1,
0.2322498, -1.390597, 4.416218, 1, 1, 1, 1, 1,
0.2367253, -0.7320493, 0.8173428, 1, 1, 1, 1, 1,
0.2389918, -1.794897, 2.835781, 0, 0, 1, 1, 1,
0.2408819, -1.880461, 4.884705, 1, 0, 0, 1, 1,
0.2412688, -1.103541, 2.960998, 1, 0, 0, 1, 1,
0.2424419, 0.1927488, 2.174077, 1, 0, 0, 1, 1,
0.2473673, -0.8750554, 2.406043, 1, 0, 0, 1, 1,
0.2519306, -0.6636099, 1.839039, 1, 0, 0, 1, 1,
0.2538812, 1.015259, 2.555249, 0, 0, 0, 1, 1,
0.2539036, 0.7297189, 0.3108438, 0, 0, 0, 1, 1,
0.2576724, -0.6140354, 3.54257, 0, 0, 0, 1, 1,
0.2594582, -0.5672243, 4.65495, 0, 0, 0, 1, 1,
0.2647874, 0.1370947, 2.390968, 0, 0, 0, 1, 1,
0.2677236, 1.538989, 1.674102, 0, 0, 0, 1, 1,
0.2717963, -1.077702, 3.665909, 0, 0, 0, 1, 1,
0.2737278, -0.2945139, 3.065246, 1, 1, 1, 1, 1,
0.2748521, -0.3626947, 2.99148, 1, 1, 1, 1, 1,
0.2763233, 0.6373113, 1.711205, 1, 1, 1, 1, 1,
0.2828977, -0.8811166, 1.487371, 1, 1, 1, 1, 1,
0.2845935, 0.4408728, 1.050922, 1, 1, 1, 1, 1,
0.2854073, -0.6464674, 1.147983, 1, 1, 1, 1, 1,
0.2949631, 0.7154686, -0.09435634, 1, 1, 1, 1, 1,
0.2984201, 1.454163, 2.315547, 1, 1, 1, 1, 1,
0.2993473, -1.438178, 4.602976, 1, 1, 1, 1, 1,
0.2996463, 1.575145, -0.6890857, 1, 1, 1, 1, 1,
0.2996609, 1.143763, -0.1113683, 1, 1, 1, 1, 1,
0.3012272, 0.1507615, 2.040352, 1, 1, 1, 1, 1,
0.3041926, -0.4825003, 1.764298, 1, 1, 1, 1, 1,
0.3174927, 1.952205, 0.3049426, 1, 1, 1, 1, 1,
0.3190848, -0.554041, 0.1280723, 1, 1, 1, 1, 1,
0.3219992, -0.5320404, 1.967403, 0, 0, 1, 1, 1,
0.3260651, -0.769189, 3.865403, 1, 0, 0, 1, 1,
0.329351, -0.7333141, 1.783399, 1, 0, 0, 1, 1,
0.3310587, 0.732613, 2.595464, 1, 0, 0, 1, 1,
0.3316015, 0.108897, 2.521863, 1, 0, 0, 1, 1,
0.3329402, 0.2854625, 0.3707027, 1, 0, 0, 1, 1,
0.3329856, 0.01127956, 4.037918, 0, 0, 0, 1, 1,
0.3338065, -0.6125193, 2.308873, 0, 0, 0, 1, 1,
0.3367088, -1.023151, 2.812479, 0, 0, 0, 1, 1,
0.338909, -0.80915, 2.664281, 0, 0, 0, 1, 1,
0.3424604, 0.3309999, 2.161959, 0, 0, 0, 1, 1,
0.343238, 0.4432099, 1.838422, 0, 0, 0, 1, 1,
0.3474579, 0.1555177, -0.3105875, 0, 0, 0, 1, 1,
0.355225, 1.398218, 1.793147, 1, 1, 1, 1, 1,
0.3563902, -0.251727, 0.003094683, 1, 1, 1, 1, 1,
0.3578503, 0.1748564, 1.328113, 1, 1, 1, 1, 1,
0.3623329, 0.3967176, 0.9596515, 1, 1, 1, 1, 1,
0.3636789, -0.1297786, 2.874787, 1, 1, 1, 1, 1,
0.3735864, -0.7822766, 3.137635, 1, 1, 1, 1, 1,
0.3752741, -0.2991543, 1.403892, 1, 1, 1, 1, 1,
0.3755222, 1.695197, 0.9784128, 1, 1, 1, 1, 1,
0.3779565, -0.8245718, 3.557811, 1, 1, 1, 1, 1,
0.3804932, -0.492327, 3.159028, 1, 1, 1, 1, 1,
0.380612, 0.2546665, 1.28087, 1, 1, 1, 1, 1,
0.3828649, -0.08947188, 3.085918, 1, 1, 1, 1, 1,
0.3837735, 0.8192147, 0.9285482, 1, 1, 1, 1, 1,
0.3863851, 0.7661834, 0.1164626, 1, 1, 1, 1, 1,
0.386867, -0.2655296, 1.131299, 1, 1, 1, 1, 1,
0.3935648, 0.01396502, 1.067639, 0, 0, 1, 1, 1,
0.3952314, -2.433395, 1.665279, 1, 0, 0, 1, 1,
0.3968298, -2.238587, 2.185827, 1, 0, 0, 1, 1,
0.4000145, -2.032498, 1.697399, 1, 0, 0, 1, 1,
0.4001468, 1.140496, 1.030938, 1, 0, 0, 1, 1,
0.4026082, 1.80946, 1.12414, 1, 0, 0, 1, 1,
0.4064071, -0.9762852, 2.361392, 0, 0, 0, 1, 1,
0.4075931, -1.458595, 3.165123, 0, 0, 0, 1, 1,
0.4086418, -0.1808221, 1.114863, 0, 0, 0, 1, 1,
0.4154968, -0.8472773, 2.121978, 0, 0, 0, 1, 1,
0.4181742, 0.6979256, -0.5548726, 0, 0, 0, 1, 1,
0.4192689, -0.03470485, 1.882697, 0, 0, 0, 1, 1,
0.4216805, -0.9744856, 2.997142, 0, 0, 0, 1, 1,
0.4237538, 0.6115997, 0.5567173, 1, 1, 1, 1, 1,
0.4239466, -1.285551, 2.744363, 1, 1, 1, 1, 1,
0.425579, 1.452487, 1.111742, 1, 1, 1, 1, 1,
0.4270673, -0.8971005, 2.81102, 1, 1, 1, 1, 1,
0.4325984, 0.8178762, 0.752757, 1, 1, 1, 1, 1,
0.4346004, 0.468187, 0.856373, 1, 1, 1, 1, 1,
0.4364176, -0.579533, 2.529421, 1, 1, 1, 1, 1,
0.439208, -0.5909317, 3.631959, 1, 1, 1, 1, 1,
0.4419371, 0.3375658, 1.038194, 1, 1, 1, 1, 1,
0.4441703, 1.03002, -0.7439936, 1, 1, 1, 1, 1,
0.4449409, 0.8007165, -0.1283533, 1, 1, 1, 1, 1,
0.449676, -0.7900428, 2.552768, 1, 1, 1, 1, 1,
0.4530356, 0.6074222, 0.05352496, 1, 1, 1, 1, 1,
0.4532717, -0.5398496, 3.118001, 1, 1, 1, 1, 1,
0.4538061, 1.124961, 1.744321, 1, 1, 1, 1, 1,
0.4541937, 1.305258, -0.6798859, 0, 0, 1, 1, 1,
0.4572371, 0.2797253, 0.6723313, 1, 0, 0, 1, 1,
0.4612049, 1.70439, 0.5672284, 1, 0, 0, 1, 1,
0.4616898, -1.264448, 0.3340116, 1, 0, 0, 1, 1,
0.4616992, 0.7799411, 0.5689186, 1, 0, 0, 1, 1,
0.4686383, 1.189903, 1.25906, 1, 0, 0, 1, 1,
0.477662, -1.19976, 1.985352, 0, 0, 0, 1, 1,
0.4787036, 1.815576, -0.8744028, 0, 0, 0, 1, 1,
0.4789454, -0.1589325, 1.439747, 0, 0, 0, 1, 1,
0.4806618, 0.38749, 1.737371, 0, 0, 0, 1, 1,
0.4825481, -0.6557496, 1.294897, 0, 0, 0, 1, 1,
0.4866843, 2.53732, -0.8835506, 0, 0, 0, 1, 1,
0.487118, 1.338844, -0.1935357, 0, 0, 0, 1, 1,
0.4893708, 0.07644553, 1.471888, 1, 1, 1, 1, 1,
0.4896221, 0.4924769, -0.328068, 1, 1, 1, 1, 1,
0.4901185, -2.832438, 0.3202143, 1, 1, 1, 1, 1,
0.5010519, 0.8395213, 0.06384052, 1, 1, 1, 1, 1,
0.5020767, -0.7150728, 2.268094, 1, 1, 1, 1, 1,
0.5029124, 0.7724129, 0.7831381, 1, 1, 1, 1, 1,
0.5128836, -0.04873396, 2.51221, 1, 1, 1, 1, 1,
0.5154032, 1.494016, 0.2323068, 1, 1, 1, 1, 1,
0.5167901, 0.5578239, 2.034915, 1, 1, 1, 1, 1,
0.5179389, -0.6709306, 1.012155, 1, 1, 1, 1, 1,
0.5223618, 0.4891966, -1.431236, 1, 1, 1, 1, 1,
0.5238167, -1.727916, 4.08007, 1, 1, 1, 1, 1,
0.5284455, -0.2510017, 2.378494, 1, 1, 1, 1, 1,
0.5310342, 0.5781673, 0.9707389, 1, 1, 1, 1, 1,
0.5376814, 1.407713, -0.08949545, 1, 1, 1, 1, 1,
0.5380507, 0.4444081, 0.9114614, 0, 0, 1, 1, 1,
0.5393596, -1.436999, 1.244852, 1, 0, 0, 1, 1,
0.5399695, 2.430441, -0.3074378, 1, 0, 0, 1, 1,
0.5426384, 0.2967692, 0.5320531, 1, 0, 0, 1, 1,
0.5440621, 1.426665, -0.4664007, 1, 0, 0, 1, 1,
0.5494713, -0.8718693, 1.318795, 1, 0, 0, 1, 1,
0.553538, 0.3764083, 0.2103748, 0, 0, 0, 1, 1,
0.5588484, -1.078158, 1.875455, 0, 0, 0, 1, 1,
0.5696091, 1.043374, -0.8222313, 0, 0, 0, 1, 1,
0.5724385, 1.370947, 0.793418, 0, 0, 0, 1, 1,
0.5762576, -0.2963956, 1.744637, 0, 0, 0, 1, 1,
0.5851361, -1.209888, 2.465049, 0, 0, 0, 1, 1,
0.5863194, 0.8334944, -0.2877201, 0, 0, 0, 1, 1,
0.5879959, -0.4811806, 2.737146, 1, 1, 1, 1, 1,
0.5882933, 0.2511577, 2.470662, 1, 1, 1, 1, 1,
0.5932137, 0.978772, 0.9711248, 1, 1, 1, 1, 1,
0.5947307, 2.245686, 0.7106248, 1, 1, 1, 1, 1,
0.6004777, -0.3096466, 2.155341, 1, 1, 1, 1, 1,
0.6015013, -0.5737668, 1.889518, 1, 1, 1, 1, 1,
0.6034952, 0.77571, 1.067868, 1, 1, 1, 1, 1,
0.6046166, 0.593901, -0.5276901, 1, 1, 1, 1, 1,
0.6080373, 0.08090908, 0.4313866, 1, 1, 1, 1, 1,
0.6104471, 0.1654578, 1.537409, 1, 1, 1, 1, 1,
0.6116098, -1.708317, 2.605088, 1, 1, 1, 1, 1,
0.6151204, -2.312994, 4.410568, 1, 1, 1, 1, 1,
0.616668, -1.103742, 1.904285, 1, 1, 1, 1, 1,
0.6176503, -1.089344, 2.902089, 1, 1, 1, 1, 1,
0.6199757, 0.5403375, 2.422763, 1, 1, 1, 1, 1,
0.6217932, 0.5245109, 3.398629, 0, 0, 1, 1, 1,
0.6246967, -0.4089906, 3.673887, 1, 0, 0, 1, 1,
0.6354811, -0.5937967, 2.227937, 1, 0, 0, 1, 1,
0.6388529, 0.373467, 0.6546733, 1, 0, 0, 1, 1,
0.6404853, 0.395415, 1.002294, 1, 0, 0, 1, 1,
0.6469586, 1.627551, -0.5208871, 1, 0, 0, 1, 1,
0.6473485, 0.8609482, -0.6352822, 0, 0, 0, 1, 1,
0.6497019, -1.51906, 2.715883, 0, 0, 0, 1, 1,
0.6541281, -0.8722636, 4.296613, 0, 0, 0, 1, 1,
0.655, 1.436285, 2.191755, 0, 0, 0, 1, 1,
0.6565158, -0.5025389, 1.846117, 0, 0, 0, 1, 1,
0.657653, -0.7681497, 1.021226, 0, 0, 0, 1, 1,
0.6580946, -0.5591022, 2.449074, 0, 0, 0, 1, 1,
0.6637726, -0.3805152, 1.243504, 1, 1, 1, 1, 1,
0.6662508, -0.6918883, 4.231903, 1, 1, 1, 1, 1,
0.6669389, -0.5669838, 2.269097, 1, 1, 1, 1, 1,
0.6685178, -0.6101946, 2.962668, 1, 1, 1, 1, 1,
0.6792656, 0.5591803, 0.6782739, 1, 1, 1, 1, 1,
0.6800802, -1.423035, 3.712698, 1, 1, 1, 1, 1,
0.6815791, -0.3052659, 0.7057592, 1, 1, 1, 1, 1,
0.6827392, -0.3590963, 4.025091, 1, 1, 1, 1, 1,
0.6847603, -0.7853978, 1.72099, 1, 1, 1, 1, 1,
0.6860584, 0.8033106, 1.664347, 1, 1, 1, 1, 1,
0.6876292, 0.01593166, 0.4234804, 1, 1, 1, 1, 1,
0.6969212, -0.503988, 2.206098, 1, 1, 1, 1, 1,
0.7032794, 1.851713, 0.9056842, 1, 1, 1, 1, 1,
0.7041921, -0.834666, 0.9834992, 1, 1, 1, 1, 1,
0.7052745, -1.365723, 0.9692327, 1, 1, 1, 1, 1,
0.7060977, -1.655003, 3.166957, 0, 0, 1, 1, 1,
0.7062483, -0.142445, 1.630093, 1, 0, 0, 1, 1,
0.7102835, -1.490927, 2.445879, 1, 0, 0, 1, 1,
0.7127673, -1.121797, 2.871469, 1, 0, 0, 1, 1,
0.7133965, -1.419804, 0.7194548, 1, 0, 0, 1, 1,
0.716819, -0.7859411, 2.94873, 1, 0, 0, 1, 1,
0.7178892, -0.1683162, 2.387769, 0, 0, 0, 1, 1,
0.718161, 0.2577022, 2.134557, 0, 0, 0, 1, 1,
0.7191974, 0.06636901, 2.160692, 0, 0, 0, 1, 1,
0.7202339, 0.8215605, -0.8855871, 0, 0, 0, 1, 1,
0.7226668, 0.5948091, 1.723816, 0, 0, 0, 1, 1,
0.7419776, 0.7962662, -0.4388557, 0, 0, 0, 1, 1,
0.7423282, -0.8145763, 2.239625, 0, 0, 0, 1, 1,
0.7502871, 0.396097, 2.031055, 1, 1, 1, 1, 1,
0.7504873, 0.6230729, 2.168316, 1, 1, 1, 1, 1,
0.7506581, -0.3361648, 1.930085, 1, 1, 1, 1, 1,
0.753996, 1.723741, 0.4714345, 1, 1, 1, 1, 1,
0.7573994, 1.141837, 0.618646, 1, 1, 1, 1, 1,
0.7581147, 0.03744293, 2.586088, 1, 1, 1, 1, 1,
0.7588804, 1.07656, 1.876564, 1, 1, 1, 1, 1,
0.7614274, -1.209025, -0.402783, 1, 1, 1, 1, 1,
0.7666951, 0.1975962, 0.7894111, 1, 1, 1, 1, 1,
0.774834, 1.262707, -0.9086995, 1, 1, 1, 1, 1,
0.7815796, -0.5794958, 2.167525, 1, 1, 1, 1, 1,
0.7897579, -2.574063, 2.720872, 1, 1, 1, 1, 1,
0.7903064, -1.590573, 3.523754, 1, 1, 1, 1, 1,
0.7903299, -2.746684, 3.721243, 1, 1, 1, 1, 1,
0.8018136, -0.8040304, 2.476574, 1, 1, 1, 1, 1,
0.8045246, 0.7049378, 0.7212366, 0, 0, 1, 1, 1,
0.8073043, -0.4520539, 3.416199, 1, 0, 0, 1, 1,
0.8151221, -0.4652885, 1.896312, 1, 0, 0, 1, 1,
0.8182545, -0.9568574, -1.659478, 1, 0, 0, 1, 1,
0.8218731, -0.6751748, 1.629966, 1, 0, 0, 1, 1,
0.8223579, 0.1378577, 2.123283, 1, 0, 0, 1, 1,
0.823276, -0.3501828, 2.094754, 0, 0, 0, 1, 1,
0.8251395, -1.350354, 1.977172, 0, 0, 0, 1, 1,
0.8285951, -0.7652849, 1.760061, 0, 0, 0, 1, 1,
0.8356521, -0.2318755, 0.1312625, 0, 0, 0, 1, 1,
0.8378029, -1.160553, 1.583932, 0, 0, 0, 1, 1,
0.841544, 1.152294, -0.01485831, 0, 0, 0, 1, 1,
0.8425595, -1.626256, 2.19489, 0, 0, 0, 1, 1,
0.8439331, -1.211997, 2.857085, 1, 1, 1, 1, 1,
0.8486348, -0.1690837, 4.353882, 1, 1, 1, 1, 1,
0.8492634, -0.5836933, 1.437709, 1, 1, 1, 1, 1,
0.8589464, -0.07669311, 1.63673, 1, 1, 1, 1, 1,
0.8603502, 0.3871216, 0.4581748, 1, 1, 1, 1, 1,
0.8622848, -2.573997, 3.333389, 1, 1, 1, 1, 1,
0.8640943, -0.4211889, 2.866326, 1, 1, 1, 1, 1,
0.8700265, 2.174496, -0.5798901, 1, 1, 1, 1, 1,
0.8721802, -0.9595415, 3.338251, 1, 1, 1, 1, 1,
0.8738506, -1.899284, 1.739999, 1, 1, 1, 1, 1,
0.8947576, 0.7388924, 1.516757, 1, 1, 1, 1, 1,
0.8983976, -0.9201362, 3.890639, 1, 1, 1, 1, 1,
0.901334, 0.04922386, 2.080468, 1, 1, 1, 1, 1,
0.9025797, 0.239831, 1.064163, 1, 1, 1, 1, 1,
0.9062379, 0.860048, -0.4120227, 1, 1, 1, 1, 1,
0.9077773, 1.027264, -0.3513709, 0, 0, 1, 1, 1,
0.90834, 0.5536824, 0.5212961, 1, 0, 0, 1, 1,
0.9123378, 0.1183137, 2.122211, 1, 0, 0, 1, 1,
0.9164568, -2.20049, 3.884596, 1, 0, 0, 1, 1,
0.9237952, 0.9724444, 2.244588, 1, 0, 0, 1, 1,
0.9241396, 1.782735, 0.9342082, 1, 0, 0, 1, 1,
0.9254827, -0.7355663, 1.687631, 0, 0, 0, 1, 1,
0.9287459, -0.6557384, 1.938154, 0, 0, 0, 1, 1,
0.9365882, 2.226996, 0.0390469, 0, 0, 0, 1, 1,
0.9368953, -0.1013867, 1.196279, 0, 0, 0, 1, 1,
0.937704, 0.8988702, 1.772247, 0, 0, 0, 1, 1,
0.9410184, 1.295985, 0.3001797, 0, 0, 0, 1, 1,
0.9417424, 0.4026685, 1.067511, 0, 0, 0, 1, 1,
0.946451, -0.4284663, 1.100671, 1, 1, 1, 1, 1,
0.9491758, -0.2147721, 2.090331, 1, 1, 1, 1, 1,
0.9519863, -0.04773564, 1.520231, 1, 1, 1, 1, 1,
0.962514, 0.3169256, 0.7290608, 1, 1, 1, 1, 1,
0.9672143, -0.2355336, 1.883331, 1, 1, 1, 1, 1,
0.9704129, 0.3079982, 2.144409, 1, 1, 1, 1, 1,
0.9741148, -0.3185841, 2.929439, 1, 1, 1, 1, 1,
0.9795792, 1.601027, 0.5348631, 1, 1, 1, 1, 1,
0.9840999, -0.08620886, 1.690853, 1, 1, 1, 1, 1,
0.9841134, 2.644066, 0.01904842, 1, 1, 1, 1, 1,
0.9852846, 0.9985524, 0.9646714, 1, 1, 1, 1, 1,
0.9965962, -1.788601, 3.888777, 1, 1, 1, 1, 1,
1.010988, -0.1199357, 0.9222226, 1, 1, 1, 1, 1,
1.012472, 0.8313361, -0.09040545, 1, 1, 1, 1, 1,
1.017605, -0.453814, 0.9388341, 1, 1, 1, 1, 1,
1.018275, 2.231682, 2.468312, 0, 0, 1, 1, 1,
1.019031, 0.2044373, 0.4347627, 1, 0, 0, 1, 1,
1.022109, 0.8476498, -0.3876209, 1, 0, 0, 1, 1,
1.022433, 0.6364502, 1.367911, 1, 0, 0, 1, 1,
1.023049, 0.677539, 2.115637, 1, 0, 0, 1, 1,
1.025074, -0.7537752, 1.430324, 1, 0, 0, 1, 1,
1.028081, -0.8449602, 2.256279, 0, 0, 0, 1, 1,
1.037532, 1.068155, 2.990103, 0, 0, 0, 1, 1,
1.037642, -0.07839196, 0.465739, 0, 0, 0, 1, 1,
1.046826, -0.06798629, 1.254264, 0, 0, 0, 1, 1,
1.047157, -1.287322, 1.977349, 0, 0, 0, 1, 1,
1.052866, -0.8182732, 1.774426, 0, 0, 0, 1, 1,
1.059564, -1.200138, 1.560683, 0, 0, 0, 1, 1,
1.069654, 0.1160996, 2.173835, 1, 1, 1, 1, 1,
1.072429, -0.2792997, 2.182395, 1, 1, 1, 1, 1,
1.076425, 1.290471, 2.016446, 1, 1, 1, 1, 1,
1.080896, -0.004725785, 0.6653135, 1, 1, 1, 1, 1,
1.084761, 1.322581, -0.5789638, 1, 1, 1, 1, 1,
1.085652, -0.9450824, 3.162571, 1, 1, 1, 1, 1,
1.088045, 1.033832, 0.4122418, 1, 1, 1, 1, 1,
1.088856, -0.2325455, 1.153114, 1, 1, 1, 1, 1,
1.090567, 0.6797451, 2.723557, 1, 1, 1, 1, 1,
1.093433, 1.225952, -0.2886261, 1, 1, 1, 1, 1,
1.095736, 1.198351, 0.2670057, 1, 1, 1, 1, 1,
1.101269, 1.256922, 0.4420526, 1, 1, 1, 1, 1,
1.105722, -0.8507819, 2.337807, 1, 1, 1, 1, 1,
1.107527, -0.5657543, 2.214412, 1, 1, 1, 1, 1,
1.109199, -1.397638, 3.490214, 1, 1, 1, 1, 1,
1.110218, -1.761231, 2.717933, 0, 0, 1, 1, 1,
1.111538, -0.5004586, 1.43279, 1, 0, 0, 1, 1,
1.113249, 1.390059, 0.873734, 1, 0, 0, 1, 1,
1.113319, 0.5474171, 0.3931831, 1, 0, 0, 1, 1,
1.117415, 0.4784601, 0.673834, 1, 0, 0, 1, 1,
1.118712, 0.02114926, 0.8313173, 1, 0, 0, 1, 1,
1.121649, 0.1576047, 0.9538535, 0, 0, 0, 1, 1,
1.124421, -1.49223, 3.654383, 0, 0, 0, 1, 1,
1.12778, -1.7052, 0.5112937, 0, 0, 0, 1, 1,
1.152731, 0.06337882, -0.02648483, 0, 0, 0, 1, 1,
1.155395, 0.201937, 2.139132, 0, 0, 0, 1, 1,
1.168662, 0.02177892, 2.817269, 0, 0, 0, 1, 1,
1.173625, 0.4834468, -2.530816, 0, 0, 0, 1, 1,
1.182922, -0.6382889, 1.604792, 1, 1, 1, 1, 1,
1.188315, -1.151834, 2.124923, 1, 1, 1, 1, 1,
1.189433, 0.2969241, 0.9748968, 1, 1, 1, 1, 1,
1.191694, -1.893114, 3.141348, 1, 1, 1, 1, 1,
1.193734, -1.240106, 1.411219, 1, 1, 1, 1, 1,
1.194475, -0.09481508, 1.80487, 1, 1, 1, 1, 1,
1.19846, 0.01495903, 2.543547, 1, 1, 1, 1, 1,
1.204102, 0.5277023, -0.3472344, 1, 1, 1, 1, 1,
1.211952, -0.5973073, 3.057943, 1, 1, 1, 1, 1,
1.214787, -1.124172, 2.087279, 1, 1, 1, 1, 1,
1.221482, 0.3257769, 2.02472, 1, 1, 1, 1, 1,
1.224498, 0.7702439, 1.86044, 1, 1, 1, 1, 1,
1.230407, 2.145881, 0.4000749, 1, 1, 1, 1, 1,
1.234342, -0.1974215, 2.872858, 1, 1, 1, 1, 1,
1.234822, -0.04203687, 0.351804, 1, 1, 1, 1, 1,
1.23994, -0.6712811, 3.721034, 0, 0, 1, 1, 1,
1.240805, -0.05601898, 1.517576, 1, 0, 0, 1, 1,
1.24094, -0.6100972, 2.125882, 1, 0, 0, 1, 1,
1.245138, 0.1028523, 0.977212, 1, 0, 0, 1, 1,
1.266818, 0.9279988, -0.5339323, 1, 0, 0, 1, 1,
1.267667, 0.6988792, 1.499788, 1, 0, 0, 1, 1,
1.276609, -0.3605849, 3.811287, 0, 0, 0, 1, 1,
1.276696, -1.987033, 3.995427, 0, 0, 0, 1, 1,
1.280739, 1.808829, -0.892974, 0, 0, 0, 1, 1,
1.284245, 0.04759279, 2.061171, 0, 0, 0, 1, 1,
1.291491, -0.1825657, 0.9783602, 0, 0, 0, 1, 1,
1.30616, 1.37558, -0.06800484, 0, 0, 0, 1, 1,
1.309579, 0.8509701, 1.062814, 0, 0, 0, 1, 1,
1.312796, 0.4043466, 0.6948193, 1, 1, 1, 1, 1,
1.316411, 0.08091593, 1.464171, 1, 1, 1, 1, 1,
1.317358, -0.1856038, 4.73195, 1, 1, 1, 1, 1,
1.326321, 0.9544649, 0.3679362, 1, 1, 1, 1, 1,
1.330146, -0.6196542, 2.790277, 1, 1, 1, 1, 1,
1.330753, 0.1298018, 1.926296, 1, 1, 1, 1, 1,
1.331633, 1.113447, 1.639905, 1, 1, 1, 1, 1,
1.332644, 0.3280466, 2.646294, 1, 1, 1, 1, 1,
1.335249, -0.2753713, 1.086042, 1, 1, 1, 1, 1,
1.339856, -0.4029442, 0.9856669, 1, 1, 1, 1, 1,
1.340047, -0.9580156, 2.347975, 1, 1, 1, 1, 1,
1.344548, -0.110775, 0.9611073, 1, 1, 1, 1, 1,
1.353899, 1.451789, -0.07435413, 1, 1, 1, 1, 1,
1.354601, 0.1263148, 1.532069, 1, 1, 1, 1, 1,
1.356947, 1.465011, 2.070455, 1, 1, 1, 1, 1,
1.362949, 0.9067391, 1.620574, 0, 0, 1, 1, 1,
1.365779, 0.769048, 0.03526193, 1, 0, 0, 1, 1,
1.371543, 0.9434742, 2.321177, 1, 0, 0, 1, 1,
1.374351, -0.1337957, 1.788149, 1, 0, 0, 1, 1,
1.376271, -1.991474, 2.973706, 1, 0, 0, 1, 1,
1.381813, 1.056809, 1.428957, 1, 0, 0, 1, 1,
1.387594, -1.499136, 1.770844, 0, 0, 0, 1, 1,
1.388744, -1.544306, 1.336161, 0, 0, 0, 1, 1,
1.39177, -0.3554587, 0.938535, 0, 0, 0, 1, 1,
1.42258, 0.7623035, 1.932832, 0, 0, 0, 1, 1,
1.429466, 1.547275, 2.614173, 0, 0, 0, 1, 1,
1.435121, 0.875757, 0.3861019, 0, 0, 0, 1, 1,
1.444035, -0.8618518, -0.9647882, 0, 0, 0, 1, 1,
1.444788, 2.169897, 3.051095, 1, 1, 1, 1, 1,
1.466192, -1.728827, 3.290732, 1, 1, 1, 1, 1,
1.477252, 1.119934, 0.2296663, 1, 1, 1, 1, 1,
1.488626, 0.5906239, 2.060548, 1, 1, 1, 1, 1,
1.493567, -1.344177, 1.670496, 1, 1, 1, 1, 1,
1.497485, 0.5599246, 1.119176, 1, 1, 1, 1, 1,
1.506186, -1.519485, 2.511199, 1, 1, 1, 1, 1,
1.514182, -0.5215112, 0.3364114, 1, 1, 1, 1, 1,
1.521529, -0.5882584, 0.7614111, 1, 1, 1, 1, 1,
1.528434, -0.957095, 4.452009, 1, 1, 1, 1, 1,
1.528497, -1.273807, 3.214839, 1, 1, 1, 1, 1,
1.532038, 0.06569251, 0.3787202, 1, 1, 1, 1, 1,
1.536357, 0.6215497, 1.541956, 1, 1, 1, 1, 1,
1.550461, -0.3645265, 3.119196, 1, 1, 1, 1, 1,
1.559127, -2.777943, 1.642089, 1, 1, 1, 1, 1,
1.572267, -0.7723494, 2.950723, 0, 0, 1, 1, 1,
1.576825, 1.01757, 0.6962637, 1, 0, 0, 1, 1,
1.583369, -1.41214, 3.215606, 1, 0, 0, 1, 1,
1.583386, -0.0499679, 2.074836, 1, 0, 0, 1, 1,
1.597177, 0.721578, 2.20521, 1, 0, 0, 1, 1,
1.605297, 1.677314, 0.5193006, 1, 0, 0, 1, 1,
1.606628, 0.6987534, -0.4931775, 0, 0, 0, 1, 1,
1.612558, -0.8082529, 1.683811, 0, 0, 0, 1, 1,
1.627097, 0.7538484, 1.545148, 0, 0, 0, 1, 1,
1.628602, 1.602844, 2.277193, 0, 0, 0, 1, 1,
1.630378, 0.4473139, 2.860593, 0, 0, 0, 1, 1,
1.63868, 0.5536464, 1.616325, 0, 0, 0, 1, 1,
1.674109, 0.8399588, 0.3812865, 0, 0, 0, 1, 1,
1.678871, 1.112786, 0.5413594, 1, 1, 1, 1, 1,
1.692327, 1.138348, 1.566911, 1, 1, 1, 1, 1,
1.693785, 0.1166816, 0.4762615, 1, 1, 1, 1, 1,
1.706993, 0.5242328, 1.352447, 1, 1, 1, 1, 1,
1.728001, 0.9209415, 0.4784189, 1, 1, 1, 1, 1,
1.750572, 0.3904211, -0.01915371, 1, 1, 1, 1, 1,
1.757912, 0.1881898, 0.0599518, 1, 1, 1, 1, 1,
1.764678, 1.340517, 1.723199, 1, 1, 1, 1, 1,
1.777658, -0.1813406, 1.660007, 1, 1, 1, 1, 1,
1.797018, -0.4584093, 1.052207, 1, 1, 1, 1, 1,
1.827196, -0.9883176, 3.406119, 1, 1, 1, 1, 1,
1.834638, -1.263629, 2.176249, 1, 1, 1, 1, 1,
1.840427, -0.9073354, 3.479528, 1, 1, 1, 1, 1,
1.896714, 1.054929, 1.545606, 1, 1, 1, 1, 1,
1.900963, 0.6748577, 0.9734613, 1, 1, 1, 1, 1,
1.905547, 3.089348, 0.4008068, 0, 0, 1, 1, 1,
1.945708, -0.5836951, 1.858047, 1, 0, 0, 1, 1,
1.956865, -0.1484136, 2.154757, 1, 0, 0, 1, 1,
1.975171, -0.2537975, 4.147091, 1, 0, 0, 1, 1,
1.990053, 0.2093371, 0.9429485, 1, 0, 0, 1, 1,
2.005068, -0.6357877, 2.47646, 1, 0, 0, 1, 1,
2.017637, -0.6304061, 2.62844, 0, 0, 0, 1, 1,
2.072919, 0.6308202, 2.972189, 0, 0, 0, 1, 1,
2.114149, 0.06506734, 1.482869, 0, 0, 0, 1, 1,
2.120017, 1.004993, 1.708292, 0, 0, 0, 1, 1,
2.130217, 0.4775648, 0.8780549, 0, 0, 0, 1, 1,
2.221965, -0.3645509, 0.9577821, 0, 0, 0, 1, 1,
2.288356, 1.419871, -0.2648071, 0, 0, 0, 1, 1,
2.421887, -0.1127959, 2.445622, 1, 1, 1, 1, 1,
2.45918, -0.1921135, 1.076768, 1, 1, 1, 1, 1,
2.489882, -1.286584, -0.1521409, 1, 1, 1, 1, 1,
2.570563, 1.581157, 1.460119, 1, 1, 1, 1, 1,
2.572512, 1.26491, 0.4346435, 1, 1, 1, 1, 1,
2.85543, 1.371598, 2.083607, 1, 1, 1, 1, 1,
3.126633, 0.8510456, 0.8219097, 1, 1, 1, 1, 1
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
var radius = 9.522179;
var distance = 33.44625;
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
mvMatrix.translate( 0.08275628, -0.3294091, 0.1704447 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44625);
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
