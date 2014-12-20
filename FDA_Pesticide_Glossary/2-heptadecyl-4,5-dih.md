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
-3.260515, -0.3369035, -2.820771, 1, 0, 0, 1,
-3.142401, 0.08228581, -1.633596, 1, 0.007843138, 0, 1,
-2.915483, 0.5785898, -1.245084, 1, 0.01176471, 0, 1,
-2.906406, 0.602518, -0.3551521, 1, 0.01960784, 0, 1,
-2.788972, -0.4090859, -1.300501, 1, 0.02352941, 0, 1,
-2.630376, 0.5516179, -0.972562, 1, 0.03137255, 0, 1,
-2.625741, -0.5936218, -1.526361, 1, 0.03529412, 0, 1,
-2.553984, 0.2913176, -2.999272, 1, 0.04313726, 0, 1,
-2.427562, 0.487136, 0.3597236, 1, 0.04705882, 0, 1,
-2.32029, 0.8811575, -0.9378476, 1, 0.05490196, 0, 1,
-2.30512, 0.5428635, -2.147366, 1, 0.05882353, 0, 1,
-2.266818, -0.5178415, -2.192903, 1, 0.06666667, 0, 1,
-2.256191, 0.5935451, -0.03224725, 1, 0.07058824, 0, 1,
-2.253979, -0.3293314, -1.314119, 1, 0.07843138, 0, 1,
-2.243047, 0.3349658, -2.433868, 1, 0.08235294, 0, 1,
-2.231959, 1.412038, -1.002308, 1, 0.09019608, 0, 1,
-2.198068, 0.2991167, -0.5356886, 1, 0.09411765, 0, 1,
-2.151648, -2.078882, -1.645238, 1, 0.1019608, 0, 1,
-2.105451, 1.456436, -1.630307, 1, 0.1098039, 0, 1,
-2.06704, -0.7640499, -1.817473, 1, 0.1137255, 0, 1,
-2.054645, 2.494925, -0.5883324, 1, 0.1215686, 0, 1,
-2.049509, -0.3638589, -1.422072, 1, 0.1254902, 0, 1,
-2.032744, 1.917651, 1.418804, 1, 0.1333333, 0, 1,
-2.001601, 0.8580508, -2.662505, 1, 0.1372549, 0, 1,
-1.999868, 1.324036, -1.04014, 1, 0.145098, 0, 1,
-1.989987, -0.3814864, -2.301497, 1, 0.1490196, 0, 1,
-1.963814, -2.046435, -2.531526, 1, 0.1568628, 0, 1,
-1.932894, -1.205704, -0.884979, 1, 0.1607843, 0, 1,
-1.920419, 0.4473035, -2.088529, 1, 0.1686275, 0, 1,
-1.907052, 0.229206, -1.410304, 1, 0.172549, 0, 1,
-1.899456, 0.4613395, -1.94144, 1, 0.1803922, 0, 1,
-1.883249, -0.5561414, -1.99654, 1, 0.1843137, 0, 1,
-1.868908, 1.153852, 0.406644, 1, 0.1921569, 0, 1,
-1.83618, 0.6435537, 0.5089619, 1, 0.1960784, 0, 1,
-1.826912, -0.7465663, -2.759995, 1, 0.2039216, 0, 1,
-1.817199, 0.4450892, -2.230997, 1, 0.2117647, 0, 1,
-1.768556, 0.1403275, -2.619427, 1, 0.2156863, 0, 1,
-1.765042, -0.769274, 0.5928492, 1, 0.2235294, 0, 1,
-1.75713, -0.1046868, -0.6460723, 1, 0.227451, 0, 1,
-1.755857, 0.2911584, -0.7708895, 1, 0.2352941, 0, 1,
-1.752538, -0.2652051, -2.810934, 1, 0.2392157, 0, 1,
-1.749808, -0.8546435, -0.7769886, 1, 0.2470588, 0, 1,
-1.749162, -1.031785, -2.380027, 1, 0.2509804, 0, 1,
-1.748723, 0.7763134, 0.3820453, 1, 0.2588235, 0, 1,
-1.738816, -0.4955621, -1.212766, 1, 0.2627451, 0, 1,
-1.735971, -0.1478626, -0.3569123, 1, 0.2705882, 0, 1,
-1.734069, 2.048434, 0.9397671, 1, 0.2745098, 0, 1,
-1.727805, 0.8684795, -1.897704, 1, 0.282353, 0, 1,
-1.72384, -2.735951, -2.059383, 1, 0.2862745, 0, 1,
-1.696145, 2.052551, -1.388913, 1, 0.2941177, 0, 1,
-1.681702, 1.5965, -0.1369891, 1, 0.3019608, 0, 1,
-1.676601, -0.02559402, -1.894717, 1, 0.3058824, 0, 1,
-1.648439, 0.5471969, -0.9561413, 1, 0.3137255, 0, 1,
-1.639753, 0.4485034, -1.234402, 1, 0.3176471, 0, 1,
-1.637765, -0.5113735, -1.485804, 1, 0.3254902, 0, 1,
-1.631301, -1.193405, -0.6932773, 1, 0.3294118, 0, 1,
-1.62054, 1.673104, -0.7141604, 1, 0.3372549, 0, 1,
-1.61197, -0.3326439, -2.356766, 1, 0.3411765, 0, 1,
-1.610127, -1.159508, -2.372621, 1, 0.3490196, 0, 1,
-1.606694, -0.2484028, -1.620094, 1, 0.3529412, 0, 1,
-1.601579, -0.8016077, -1.655385, 1, 0.3607843, 0, 1,
-1.592116, 0.4674087, -3.114335, 1, 0.3647059, 0, 1,
-1.59053, 0.0005276586, -0.8389072, 1, 0.372549, 0, 1,
-1.575941, 0.6311725, -3.962841, 1, 0.3764706, 0, 1,
-1.572192, -0.1700148, -3.618837, 1, 0.3843137, 0, 1,
-1.565615, -3.468801, -2.535584, 1, 0.3882353, 0, 1,
-1.542607, 1.176811, -0.2970546, 1, 0.3960784, 0, 1,
-1.523664, 0.6344845, -0.5928211, 1, 0.4039216, 0, 1,
-1.516063, -0.8805355, -1.555852, 1, 0.4078431, 0, 1,
-1.516006, 1.517826, -0.7526639, 1, 0.4156863, 0, 1,
-1.501633, 1.717639, 0.6870795, 1, 0.4196078, 0, 1,
-1.49776, 0.5954789, -2.286038, 1, 0.427451, 0, 1,
-1.497442, 0.7470827, 0.01916745, 1, 0.4313726, 0, 1,
-1.469664, -0.4615093, -3.658489, 1, 0.4392157, 0, 1,
-1.462506, 0.4470297, -0.7363298, 1, 0.4431373, 0, 1,
-1.449901, 1.479101, -2.199809, 1, 0.4509804, 0, 1,
-1.448341, -1.424208, -1.885119, 1, 0.454902, 0, 1,
-1.448182, 0.06484242, 0.5408939, 1, 0.4627451, 0, 1,
-1.432926, -0.6556808, -0.5281253, 1, 0.4666667, 0, 1,
-1.432261, -0.1566645, -2.01387, 1, 0.4745098, 0, 1,
-1.431972, 1.32724, -0.4127666, 1, 0.4784314, 0, 1,
-1.431248, -0.4658477, -2.315994, 1, 0.4862745, 0, 1,
-1.427001, -1.538936, -1.526958, 1, 0.4901961, 0, 1,
-1.418293, -0.5311348, -1.691977, 1, 0.4980392, 0, 1,
-1.410889, 0.5844123, -1.421469, 1, 0.5058824, 0, 1,
-1.406433, -0.4849645, -2.852847, 1, 0.509804, 0, 1,
-1.401335, 0.182884, -1.759766, 1, 0.5176471, 0, 1,
-1.38961, -0.4436415, -1.74573, 1, 0.5215687, 0, 1,
-1.389504, 0.7787523, -0.7407978, 1, 0.5294118, 0, 1,
-1.375679, -1.423643, -3.541606, 1, 0.5333334, 0, 1,
-1.361076, -0.5017576, -3.446759, 1, 0.5411765, 0, 1,
-1.355381, 0.7949927, -1.465148, 1, 0.5450981, 0, 1,
-1.352328, 0.5493556, -2.60564, 1, 0.5529412, 0, 1,
-1.347503, -1.420104, -3.843305, 1, 0.5568628, 0, 1,
-1.328017, 0.5082934, -0.7880903, 1, 0.5647059, 0, 1,
-1.322831, -0.7254977, -2.197798, 1, 0.5686275, 0, 1,
-1.321101, 1.161885, -1.727335, 1, 0.5764706, 0, 1,
-1.315249, -2.068828, -2.096062, 1, 0.5803922, 0, 1,
-1.304798, 0.4094071, -2.07621, 1, 0.5882353, 0, 1,
-1.268199, -1.079816, -3.504749, 1, 0.5921569, 0, 1,
-1.258897, -1.339785, -2.071925, 1, 0.6, 0, 1,
-1.251711, 0.9293604, -0.4082699, 1, 0.6078432, 0, 1,
-1.245082, -0.5724226, -2.259851, 1, 0.6117647, 0, 1,
-1.241924, 0.3703771, -0.6297177, 1, 0.6196079, 0, 1,
-1.241219, 0.746941, -1.439278, 1, 0.6235294, 0, 1,
-1.239263, 0.1720309, -1.546127, 1, 0.6313726, 0, 1,
-1.234902, 0.3502195, -0.7180042, 1, 0.6352941, 0, 1,
-1.22897, 0.6772935, -1.290889, 1, 0.6431373, 0, 1,
-1.226722, -1.142928, -2.201783, 1, 0.6470588, 0, 1,
-1.22446, -1.346136, -2.172649, 1, 0.654902, 0, 1,
-1.220782, 1.258033, 0.6202826, 1, 0.6588235, 0, 1,
-1.218047, 0.8124753, 0.9901723, 1, 0.6666667, 0, 1,
-1.217535, 0.0323778, -1.804731, 1, 0.6705883, 0, 1,
-1.21594, -0.4673199, -4.171518, 1, 0.6784314, 0, 1,
-1.213355, 0.3764227, -1.658102, 1, 0.682353, 0, 1,
-1.212444, -0.3787465, -2.12378, 1, 0.6901961, 0, 1,
-1.20767, 0.5456725, -0.2059134, 1, 0.6941177, 0, 1,
-1.206193, -0.7581368, -2.232569, 1, 0.7019608, 0, 1,
-1.202783, 0.723042, -2.76587, 1, 0.7098039, 0, 1,
-1.199377, -0.5248255, -2.235076, 1, 0.7137255, 0, 1,
-1.19612, 0.3666313, -0.418407, 1, 0.7215686, 0, 1,
-1.194808, -0.673162, -0.9696556, 1, 0.7254902, 0, 1,
-1.188623, 1.455929, -0.519749, 1, 0.7333333, 0, 1,
-1.181479, -0.3195194, -2.140852, 1, 0.7372549, 0, 1,
-1.172505, -0.8770431, -3.102651, 1, 0.7450981, 0, 1,
-1.166943, -1.607795, -1.308232, 1, 0.7490196, 0, 1,
-1.165117, 1.458915, 0.2175416, 1, 0.7568628, 0, 1,
-1.16245, 0.499963, -1.108306, 1, 0.7607843, 0, 1,
-1.161219, -1.362972, -2.393167, 1, 0.7686275, 0, 1,
-1.148026, 2.156981, -0.9155174, 1, 0.772549, 0, 1,
-1.146252, 0.2067645, -0.4537866, 1, 0.7803922, 0, 1,
-1.146123, -0.8017999, -0.6356725, 1, 0.7843137, 0, 1,
-1.136042, -0.8366815, -0.8875989, 1, 0.7921569, 0, 1,
-1.129315, 0.07670997, -1.685699, 1, 0.7960784, 0, 1,
-1.129057, -1.360574, -1.812124, 1, 0.8039216, 0, 1,
-1.126866, 1.042295, -1.03591, 1, 0.8117647, 0, 1,
-1.126261, 1.215148, -0.7663015, 1, 0.8156863, 0, 1,
-1.119466, 1.652303, -2.00124, 1, 0.8235294, 0, 1,
-1.118933, 0.4483779, 0.02425175, 1, 0.827451, 0, 1,
-1.111955, -1.092834, -1.791161, 1, 0.8352941, 0, 1,
-1.109218, -1.358625, -2.45685, 1, 0.8392157, 0, 1,
-1.099474, 0.3347635, -0.1927813, 1, 0.8470588, 0, 1,
-1.094477, -0.2129419, -0.6905515, 1, 0.8509804, 0, 1,
-1.089799, 0.7400927, -1.367396, 1, 0.8588235, 0, 1,
-1.082829, -0.06720801, -1.100786, 1, 0.8627451, 0, 1,
-1.081817, -0.9126754, -2.511511, 1, 0.8705882, 0, 1,
-1.076393, -0.3757691, -2.372314, 1, 0.8745098, 0, 1,
-1.074312, 1.242076, -1.398673, 1, 0.8823529, 0, 1,
-1.072235, -0.7636816, -3.062236, 1, 0.8862745, 0, 1,
-1.055982, 0.5666383, -1.587306, 1, 0.8941177, 0, 1,
-1.055607, -0.4934762, -2.93251, 1, 0.8980392, 0, 1,
-1.052939, 0.2130318, -1.192394, 1, 0.9058824, 0, 1,
-1.045448, -0.5457197, -2.824875, 1, 0.9137255, 0, 1,
-1.03345, 1.002762, -0.2110708, 1, 0.9176471, 0, 1,
-1.033224, -1.348772, -3.518675, 1, 0.9254902, 0, 1,
-1.033099, -1.355549, -1.392232, 1, 0.9294118, 0, 1,
-1.03198, 0.4112222, -1.689825, 1, 0.9372549, 0, 1,
-1.029032, -0.1781923, -1.543373, 1, 0.9411765, 0, 1,
-1.025607, 0.372673, -1.925135, 1, 0.9490196, 0, 1,
-1.024081, -1.645018, -2.894098, 1, 0.9529412, 0, 1,
-1.009588, 0.502031, 0.3962291, 1, 0.9607843, 0, 1,
-1.004713, 0.1672303, -1.803311, 1, 0.9647059, 0, 1,
-0.995184, 0.6774097, -0.5860152, 1, 0.972549, 0, 1,
-0.9820748, 1.655448, -1.880686, 1, 0.9764706, 0, 1,
-0.9742171, 1.910855, 1.290657, 1, 0.9843137, 0, 1,
-0.965549, 0.8232161, 1.363643, 1, 0.9882353, 0, 1,
-0.9638502, 0.6497383, -2.170796, 1, 0.9960784, 0, 1,
-0.9635325, 0.691637, 0.1656953, 0.9960784, 1, 0, 1,
-0.9627876, -0.01497311, 0.2633224, 0.9921569, 1, 0, 1,
-0.9624121, -0.6260759, -0.7822398, 0.9843137, 1, 0, 1,
-0.9609134, -0.7757328, -2.711126, 0.9803922, 1, 0, 1,
-0.9580684, -0.3337645, -2.841311, 0.972549, 1, 0, 1,
-0.9518158, -0.8150728, -1.688717, 0.9686275, 1, 0, 1,
-0.948891, -0.2366281, -2.812664, 0.9607843, 1, 0, 1,
-0.946744, -0.2988132, -2.394536, 0.9568627, 1, 0, 1,
-0.9388716, 1.329332, 1.08517, 0.9490196, 1, 0, 1,
-0.9364567, -0.4192718, -1.75897, 0.945098, 1, 0, 1,
-0.9339641, -0.912567, -0.9687716, 0.9372549, 1, 0, 1,
-0.9329811, 1.529092, 0.3676109, 0.9333333, 1, 0, 1,
-0.9321111, 0.6928744, -0.9359692, 0.9254902, 1, 0, 1,
-0.9206825, 0.4565096, -1.341028, 0.9215686, 1, 0, 1,
-0.9165545, 1.182393, 0.2863567, 0.9137255, 1, 0, 1,
-0.9138459, -0.4429258, -2.361221, 0.9098039, 1, 0, 1,
-0.9091904, 0.9355339, 0.4334441, 0.9019608, 1, 0, 1,
-0.9079536, -0.3687268, -0.4527105, 0.8941177, 1, 0, 1,
-0.9070768, 0.1921891, -0.3478245, 0.8901961, 1, 0, 1,
-0.9068338, 1.126337, -0.0658632, 0.8823529, 1, 0, 1,
-0.9030142, 0.6050008, -0.4664592, 0.8784314, 1, 0, 1,
-0.8945772, 0.4597052, -2.452271, 0.8705882, 1, 0, 1,
-0.8930255, 0.8154204, -1.235837, 0.8666667, 1, 0, 1,
-0.8894994, -0.005507275, -0.9709266, 0.8588235, 1, 0, 1,
-0.8798011, -0.2987202, -1.498246, 0.854902, 1, 0, 1,
-0.8788121, 0.9157294, -0.6123933, 0.8470588, 1, 0, 1,
-0.8773904, -1.693218, -1.95459, 0.8431373, 1, 0, 1,
-0.8734141, -1.971702, -2.340149, 0.8352941, 1, 0, 1,
-0.872321, -1.072422, -2.857355, 0.8313726, 1, 0, 1,
-0.8711655, 1.333698, 0.03251667, 0.8235294, 1, 0, 1,
-0.8686218, 1.332336, -1.461346, 0.8196079, 1, 0, 1,
-0.8685532, -0.8123714, -3.64067, 0.8117647, 1, 0, 1,
-0.8467492, -0.5771934, -1.626194, 0.8078431, 1, 0, 1,
-0.8453147, 1.311392, 0.1152275, 0.8, 1, 0, 1,
-0.845217, -0.3522707, -1.784531, 0.7921569, 1, 0, 1,
-0.8395686, -0.3945739, -4.461751, 0.7882353, 1, 0, 1,
-0.8378798, -0.7191232, -2.97111, 0.7803922, 1, 0, 1,
-0.8368117, 0.9322055, -1.037211, 0.7764706, 1, 0, 1,
-0.8340448, -0.1873726, -2.96184, 0.7686275, 1, 0, 1,
-0.823936, 1.827795, 0.2758616, 0.7647059, 1, 0, 1,
-0.8167861, -0.7365873, -2.92451, 0.7568628, 1, 0, 1,
-0.8103042, -0.769336, -3.359117, 0.7529412, 1, 0, 1,
-0.8083108, 0.6680292, -2.794418, 0.7450981, 1, 0, 1,
-0.8017237, 0.3132992, -0.6145449, 0.7411765, 1, 0, 1,
-0.7985293, -0.7784393, -2.388432, 0.7333333, 1, 0, 1,
-0.7909499, 1.482974, -1.792469, 0.7294118, 1, 0, 1,
-0.7909369, 1.006764, -1.074158, 0.7215686, 1, 0, 1,
-0.7876875, 0.9192849, -1.658133, 0.7176471, 1, 0, 1,
-0.7874606, 1.501791, -2.225941, 0.7098039, 1, 0, 1,
-0.7855317, -0.5756576, -1.978256, 0.7058824, 1, 0, 1,
-0.7819472, -0.4765208, -1.781209, 0.6980392, 1, 0, 1,
-0.7792696, 0.6573501, -2.253228, 0.6901961, 1, 0, 1,
-0.7774535, 0.4714391, -0.7146655, 0.6862745, 1, 0, 1,
-0.766834, 0.01885067, -1.647457, 0.6784314, 1, 0, 1,
-0.7619449, 0.8311696, -2.678761, 0.6745098, 1, 0, 1,
-0.7593169, 1.614832, 0.2940749, 0.6666667, 1, 0, 1,
-0.7570144, 0.9325913, 0.5918143, 0.6627451, 1, 0, 1,
-0.7541339, 1.010342, -1.183621, 0.654902, 1, 0, 1,
-0.7535743, -0.111992, -1.92849, 0.6509804, 1, 0, 1,
-0.7520387, 1.670519, -0.1135982, 0.6431373, 1, 0, 1,
-0.7501475, -0.1791877, -1.366758, 0.6392157, 1, 0, 1,
-0.7462986, -1.239057, -2.439602, 0.6313726, 1, 0, 1,
-0.7446343, 0.8605787, 0.8523092, 0.627451, 1, 0, 1,
-0.7384167, -1.171886, -2.48223, 0.6196079, 1, 0, 1,
-0.7368686, 1.450647, -0.1914975, 0.6156863, 1, 0, 1,
-0.7360019, 1.287731, 0.05292974, 0.6078432, 1, 0, 1,
-0.7353694, 0.7934664, -1.33097, 0.6039216, 1, 0, 1,
-0.7281908, 0.3760767, -0.6030486, 0.5960785, 1, 0, 1,
-0.720717, 1.261256, -0.4615032, 0.5882353, 1, 0, 1,
-0.7194753, 0.3103546, -0.6742545, 0.5843138, 1, 0, 1,
-0.7133542, -0.4710461, -1.875257, 0.5764706, 1, 0, 1,
-0.7082859, -0.313157, -3.539918, 0.572549, 1, 0, 1,
-0.7063813, 1.322302, -1.395839, 0.5647059, 1, 0, 1,
-0.7046756, 0.7961013, -0.01910417, 0.5607843, 1, 0, 1,
-0.7041212, -0.4960763, -3.155195, 0.5529412, 1, 0, 1,
-0.7040287, -1.117427, -2.525195, 0.5490196, 1, 0, 1,
-0.693069, -0.8194649, -3.725535, 0.5411765, 1, 0, 1,
-0.6929253, 0.1402541, -0.7293317, 0.5372549, 1, 0, 1,
-0.6883807, -0.4078273, -1.152194, 0.5294118, 1, 0, 1,
-0.6878571, 0.09669712, -2.090979, 0.5254902, 1, 0, 1,
-0.6845849, 1.284341, 0.0662226, 0.5176471, 1, 0, 1,
-0.6828787, -1.691258, -1.708181, 0.5137255, 1, 0, 1,
-0.6795154, 1.163784, 2.149112, 0.5058824, 1, 0, 1,
-0.6743258, 0.695105, 0.4628793, 0.5019608, 1, 0, 1,
-0.6595988, -0.6042298, -4.613064, 0.4941176, 1, 0, 1,
-0.6580309, 0.3637229, -1.152765, 0.4862745, 1, 0, 1,
-0.6546926, -1.342629, -1.995956, 0.4823529, 1, 0, 1,
-0.6543936, -1.253403, -1.44317, 0.4745098, 1, 0, 1,
-0.651207, 1.243702, -0.7817036, 0.4705882, 1, 0, 1,
-0.649315, -1.483431, -3.537856, 0.4627451, 1, 0, 1,
-0.649173, -0.4190883, -1.411286, 0.4588235, 1, 0, 1,
-0.6474462, 0.2938859, 0.5747522, 0.4509804, 1, 0, 1,
-0.6454072, -0.4305752, -1.902617, 0.4470588, 1, 0, 1,
-0.6389539, -0.3915989, -2.528947, 0.4392157, 1, 0, 1,
-0.6356506, -1.439587, -4.523799, 0.4352941, 1, 0, 1,
-0.6316974, -2.748633, -3.692051, 0.427451, 1, 0, 1,
-0.6306552, -0.3730016, -1.237559, 0.4235294, 1, 0, 1,
-0.630153, -0.3472239, -2.623722, 0.4156863, 1, 0, 1,
-0.6279851, -0.09434201, -2.197083, 0.4117647, 1, 0, 1,
-0.6225203, 2.470158, 0.01323578, 0.4039216, 1, 0, 1,
-0.6113179, 1.662632, -0.8391343, 0.3960784, 1, 0, 1,
-0.6105679, -0.154662, -1.189838, 0.3921569, 1, 0, 1,
-0.6088772, 0.4920878, -2.205803, 0.3843137, 1, 0, 1,
-0.6073771, -1.994859, -2.311603, 0.3803922, 1, 0, 1,
-0.6059597, -1.051163, -2.469898, 0.372549, 1, 0, 1,
-0.6049143, -0.1004237, -1.220171, 0.3686275, 1, 0, 1,
-0.6007758, 0.8351999, 0.66658, 0.3607843, 1, 0, 1,
-0.5993569, -0.3995085, -0.243921, 0.3568628, 1, 0, 1,
-0.5990343, -0.7822644, -4.16443, 0.3490196, 1, 0, 1,
-0.5949914, 0.8331019, -1.411072, 0.345098, 1, 0, 1,
-0.5906188, 0.80136, -0.04016609, 0.3372549, 1, 0, 1,
-0.5905108, -0.2757832, -0.3572237, 0.3333333, 1, 0, 1,
-0.5847313, 1.220331, 1.209084, 0.3254902, 1, 0, 1,
-0.579828, 1.505807, -0.05369717, 0.3215686, 1, 0, 1,
-0.5745578, -0.7971886, -2.379228, 0.3137255, 1, 0, 1,
-0.5722064, 0.6332176, -1.840244, 0.3098039, 1, 0, 1,
-0.5711095, -0.5902743, -1.645208, 0.3019608, 1, 0, 1,
-0.5666956, -0.8495009, -2.049174, 0.2941177, 1, 0, 1,
-0.5659248, 0.08725706, -1.872518, 0.2901961, 1, 0, 1,
-0.5652583, 0.4538754, -1.154726, 0.282353, 1, 0, 1,
-0.5637314, -0.713588, -0.09699751, 0.2784314, 1, 0, 1,
-0.5630506, -1.397951, -1.222448, 0.2705882, 1, 0, 1,
-0.5589197, 1.288744, -0.957464, 0.2666667, 1, 0, 1,
-0.5583979, 1.096356, 0.3586831, 0.2588235, 1, 0, 1,
-0.551137, -0.300625, -2.536108, 0.254902, 1, 0, 1,
-0.546882, -0.6460239, -2.310488, 0.2470588, 1, 0, 1,
-0.5449823, 0.4083448, -2.805693, 0.2431373, 1, 0, 1,
-0.5447196, -0.6982433, -1.090448, 0.2352941, 1, 0, 1,
-0.5444221, 0.1238428, -1.910253, 0.2313726, 1, 0, 1,
-0.5318378, -0.6081867, -2.591712, 0.2235294, 1, 0, 1,
-0.5254681, -0.985778, -2.27518, 0.2196078, 1, 0, 1,
-0.5244611, 0.08184027, -2.034184, 0.2117647, 1, 0, 1,
-0.5229739, -1.294011, -3.400945, 0.2078431, 1, 0, 1,
-0.5212604, -1.687586, -3.45609, 0.2, 1, 0, 1,
-0.5201975, -0.3074406, -2.118333, 0.1921569, 1, 0, 1,
-0.5199221, -1.828679, -2.350957, 0.1882353, 1, 0, 1,
-0.5184433, -1.433395, -4.53594, 0.1803922, 1, 0, 1,
-0.5181307, -0.7814063, -1.76665, 0.1764706, 1, 0, 1,
-0.5154174, 0.2988704, -2.289685, 0.1686275, 1, 0, 1,
-0.5131937, 0.3385178, 1.375213, 0.1647059, 1, 0, 1,
-0.5122766, -0.8162892, -1.448067, 0.1568628, 1, 0, 1,
-0.5022664, -0.7048974, -2.452895, 0.1529412, 1, 0, 1,
-0.4965128, -0.9925015, -3.487582, 0.145098, 1, 0, 1,
-0.4949948, 0.8386908, -1.677285, 0.1411765, 1, 0, 1,
-0.4941953, 0.4750839, -2.039806, 0.1333333, 1, 0, 1,
-0.486736, 0.4746273, -0.08961531, 0.1294118, 1, 0, 1,
-0.4864449, 0.755486, -0.3196802, 0.1215686, 1, 0, 1,
-0.4859975, 0.02184829, 0.3061192, 0.1176471, 1, 0, 1,
-0.485804, 1.763266, -0.5642931, 0.1098039, 1, 0, 1,
-0.4839742, 1.043993, 1.845933, 0.1058824, 1, 0, 1,
-0.4826568, -1.243829, -1.495535, 0.09803922, 1, 0, 1,
-0.4808087, 0.5311238, -1.321934, 0.09019608, 1, 0, 1,
-0.479178, 0.9753526, -0.8497714, 0.08627451, 1, 0, 1,
-0.4727612, 0.2677305, -0.2797103, 0.07843138, 1, 0, 1,
-0.4694304, 0.6270624, -0.4970593, 0.07450981, 1, 0, 1,
-0.4689896, 0.1358414, -0.4016319, 0.06666667, 1, 0, 1,
-0.4670031, -0.7726682, -5.002679, 0.0627451, 1, 0, 1,
-0.4636858, -0.1665643, -0.3681535, 0.05490196, 1, 0, 1,
-0.4632562, -0.696786, -2.247446, 0.05098039, 1, 0, 1,
-0.4610292, 0.9250239, -1.435231, 0.04313726, 1, 0, 1,
-0.4476295, -0.326261, -2.535197, 0.03921569, 1, 0, 1,
-0.446786, 1.593154, -0.433794, 0.03137255, 1, 0, 1,
-0.4426466, -1.266396, -3.569336, 0.02745098, 1, 0, 1,
-0.4304294, -0.2047572, -1.450009, 0.01960784, 1, 0, 1,
-0.4280836, 0.08507565, -2.005041, 0.01568628, 1, 0, 1,
-0.4267029, 1.564313, 0.8508672, 0.007843138, 1, 0, 1,
-0.418002, 0.7916597, -1.220733, 0.003921569, 1, 0, 1,
-0.412261, 0.01411413, 0.6161376, 0, 1, 0.003921569, 1,
-0.4122218, -0.7528433, -2.854093, 0, 1, 0.01176471, 1,
-0.4107399, 0.3351486, -0.6862455, 0, 1, 0.01568628, 1,
-0.4027035, 0.4262244, -2.592999, 0, 1, 0.02352941, 1,
-0.399602, -1.11478, -4.121857, 0, 1, 0.02745098, 1,
-0.3993722, -0.02613122, -0.2507217, 0, 1, 0.03529412, 1,
-0.396134, 0.09437477, -1.012828, 0, 1, 0.03921569, 1,
-0.3956205, -0.7509133, -3.666097, 0, 1, 0.04705882, 1,
-0.3951248, 1.461499, -0.86246, 0, 1, 0.05098039, 1,
-0.3948125, 0.08905636, -1.682117, 0, 1, 0.05882353, 1,
-0.3940609, 0.7257297, -0.4635481, 0, 1, 0.0627451, 1,
-0.3934513, 0.7048228, 0.4603818, 0, 1, 0.07058824, 1,
-0.3886521, -0.7509882, -3.741987, 0, 1, 0.07450981, 1,
-0.3831865, -0.7359802, -2.006253, 0, 1, 0.08235294, 1,
-0.3822065, -1.054355, -2.5399, 0, 1, 0.08627451, 1,
-0.3804537, -2.307664, -2.656774, 0, 1, 0.09411765, 1,
-0.3795497, -0.06711262, -3.255665, 0, 1, 0.1019608, 1,
-0.3766811, -0.5392256, -3.168052, 0, 1, 0.1058824, 1,
-0.3723875, -1.996222, -4.225121, 0, 1, 0.1137255, 1,
-0.3718365, -1.013488, -2.273958, 0, 1, 0.1176471, 1,
-0.3688026, 1.116165, -0.9222018, 0, 1, 0.1254902, 1,
-0.3670607, -0.2402009, -2.251661, 0, 1, 0.1294118, 1,
-0.3665405, 2.000878, 0.0207356, 0, 1, 0.1372549, 1,
-0.3664713, 2.250167, -0.1576317, 0, 1, 0.1411765, 1,
-0.3657757, -0.6443299, -2.160393, 0, 1, 0.1490196, 1,
-0.3651082, 0.5777396, -0.5574239, 0, 1, 0.1529412, 1,
-0.3601124, 3.089571, 0.4538884, 0, 1, 0.1607843, 1,
-0.3571478, -1.488517, -4.267565, 0, 1, 0.1647059, 1,
-0.3568082, 0.007031663, -1.014564, 0, 1, 0.172549, 1,
-0.3564318, -0.8718247, -1.954492, 0, 1, 0.1764706, 1,
-0.3561381, 0.4018077, -1.450384, 0, 1, 0.1843137, 1,
-0.3545422, -0.8475817, -2.776168, 0, 1, 0.1882353, 1,
-0.3480127, -0.9640998, -3.083273, 0, 1, 0.1960784, 1,
-0.3476838, 0.4299192, 1.443987, 0, 1, 0.2039216, 1,
-0.342177, 0.3166708, -1.531628, 0, 1, 0.2078431, 1,
-0.3421305, 0.5096488, -1.581604, 0, 1, 0.2156863, 1,
-0.3371319, -0.7657157, -1.278569, 0, 1, 0.2196078, 1,
-0.3338889, 0.7497772, -1.653391, 0, 1, 0.227451, 1,
-0.3300132, -1.590518, -4.153286, 0, 1, 0.2313726, 1,
-0.3297912, -1.932863, -2.836746, 0, 1, 0.2392157, 1,
-0.3260663, 1.681838, -0.8402145, 0, 1, 0.2431373, 1,
-0.3241841, -1.97481, -2.842528, 0, 1, 0.2509804, 1,
-0.3240352, -0.0355604, -3.133306, 0, 1, 0.254902, 1,
-0.3225476, 1.843575, 0.5417939, 0, 1, 0.2627451, 1,
-0.3216743, 0.4086255, -2.046873, 0, 1, 0.2666667, 1,
-0.3207669, -0.9210171, -2.656279, 0, 1, 0.2745098, 1,
-0.3187554, 0.3787774, -0.5199295, 0, 1, 0.2784314, 1,
-0.3185973, 0.07848842, -2.839106, 0, 1, 0.2862745, 1,
-0.3176335, 0.3049311, -0.1828359, 0, 1, 0.2901961, 1,
-0.3158479, -0.6659757, -3.432181, 0, 1, 0.2980392, 1,
-0.3150748, -0.1972405, -1.670245, 0, 1, 0.3058824, 1,
-0.3139432, -1.048362, -2.986482, 0, 1, 0.3098039, 1,
-0.3137637, -0.9754519, -2.649294, 0, 1, 0.3176471, 1,
-0.3136594, -0.03818312, -2.618894, 0, 1, 0.3215686, 1,
-0.309041, 0.9434763, 0.8562272, 0, 1, 0.3294118, 1,
-0.3085704, -0.2376836, -3.551973, 0, 1, 0.3333333, 1,
-0.3071535, 0.4323783, 0.8726271, 0, 1, 0.3411765, 1,
-0.3004344, -0.9307036, -2.725197, 0, 1, 0.345098, 1,
-0.3002125, 1.639119, -0.2173568, 0, 1, 0.3529412, 1,
-0.2931933, 0.35201, -0.562604, 0, 1, 0.3568628, 1,
-0.2907711, -0.02137277, -2.24005, 0, 1, 0.3647059, 1,
-0.2907687, -0.2089437, -2.686434, 0, 1, 0.3686275, 1,
-0.2869417, -1.369842, -2.074811, 0, 1, 0.3764706, 1,
-0.2825056, -0.2864642, -2.475239, 0, 1, 0.3803922, 1,
-0.2778747, -0.6220862, -1.013213, 0, 1, 0.3882353, 1,
-0.2762664, 0.05565028, -0.7200471, 0, 1, 0.3921569, 1,
-0.2746709, -0.9901886, -4.149186, 0, 1, 0.4, 1,
-0.2742419, 0.1598992, -0.8365907, 0, 1, 0.4078431, 1,
-0.2717146, -1.028721, -4.681927, 0, 1, 0.4117647, 1,
-0.2711399, 0.7876733, -1.374344, 0, 1, 0.4196078, 1,
-0.2704229, 1.247939, 0.2983652, 0, 1, 0.4235294, 1,
-0.2672868, 0.7568669, -0.4673756, 0, 1, 0.4313726, 1,
-0.2663032, -1.295987, -3.17921, 0, 1, 0.4352941, 1,
-0.2654892, 1.363814, 1.391242, 0, 1, 0.4431373, 1,
-0.2635996, -0.2001157, -2.259016, 0, 1, 0.4470588, 1,
-0.2626447, -0.9148357, -4.321274, 0, 1, 0.454902, 1,
-0.260818, 1.660126, 0.7274659, 0, 1, 0.4588235, 1,
-0.2596748, -0.3841218, -2.926115, 0, 1, 0.4666667, 1,
-0.2593514, 2.095427, -0.9059703, 0, 1, 0.4705882, 1,
-0.2588039, -0.3026427, -1.62908, 0, 1, 0.4784314, 1,
-0.2461787, -0.6795085, -4.873403, 0, 1, 0.4823529, 1,
-0.2459484, 0.3857085, -1.094708, 0, 1, 0.4901961, 1,
-0.2409276, 0.6626686, -0.4343005, 0, 1, 0.4941176, 1,
-0.2405115, -0.3166758, -2.670894, 0, 1, 0.5019608, 1,
-0.2367812, 0.4822462, -0.9911101, 0, 1, 0.509804, 1,
-0.2308968, -2.957981, -2.342386, 0, 1, 0.5137255, 1,
-0.2261086, -0.2190614, -1.308528, 0, 1, 0.5215687, 1,
-0.2240549, 0.9822755, -0.04779692, 0, 1, 0.5254902, 1,
-0.2167546, -0.1813517, -3.633904, 0, 1, 0.5333334, 1,
-0.2126125, -1.007775, -3.387911, 0, 1, 0.5372549, 1,
-0.204905, -0.4204245, -4.334743, 0, 1, 0.5450981, 1,
-0.2040427, -0.8538273, -2.41466, 0, 1, 0.5490196, 1,
-0.2033297, -0.2209022, -2.723774, 0, 1, 0.5568628, 1,
-0.2004356, 1.174944, 2.07637, 0, 1, 0.5607843, 1,
-0.198399, -1.50773, -2.580744, 0, 1, 0.5686275, 1,
-0.1949123, 2.086809, 1.028285, 0, 1, 0.572549, 1,
-0.1943258, -1.413708, -3.884685, 0, 1, 0.5803922, 1,
-0.1942118, -1.220492, -2.302566, 0, 1, 0.5843138, 1,
-0.1933727, 0.7492485, 0.2969035, 0, 1, 0.5921569, 1,
-0.1927025, 0.5775354, 1.072055, 0, 1, 0.5960785, 1,
-0.1831367, 0.05193375, -2.968944, 0, 1, 0.6039216, 1,
-0.1800292, -0.4623495, -3.946259, 0, 1, 0.6117647, 1,
-0.1747168, -1.464266, -1.820532, 0, 1, 0.6156863, 1,
-0.168418, 0.9481971, 0.06356327, 0, 1, 0.6235294, 1,
-0.1679014, -1.030644, -1.566646, 0, 1, 0.627451, 1,
-0.1663839, -1.106385, -2.259456, 0, 1, 0.6352941, 1,
-0.1661239, 1.304028, 1.288992, 0, 1, 0.6392157, 1,
-0.1661088, -0.08704089, -2.632073, 0, 1, 0.6470588, 1,
-0.1659472, 0.437664, -0.3693397, 0, 1, 0.6509804, 1,
-0.1582682, -0.9365932, -3.016837, 0, 1, 0.6588235, 1,
-0.153482, 0.6926643, -0.7659945, 0, 1, 0.6627451, 1,
-0.1472757, -1.043406, -3.181756, 0, 1, 0.6705883, 1,
-0.1466781, -0.1872857, -2.87738, 0, 1, 0.6745098, 1,
-0.1456198, -0.5011846, -2.843329, 0, 1, 0.682353, 1,
-0.1439524, 0.2451209, -2.671832, 0, 1, 0.6862745, 1,
-0.1332357, 0.8880326, -0.8694933, 0, 1, 0.6941177, 1,
-0.1329002, 0.4193973, -0.2734941, 0, 1, 0.7019608, 1,
-0.1289632, 1.084544, 0.9001197, 0, 1, 0.7058824, 1,
-0.128359, -1.994777, -3.717231, 0, 1, 0.7137255, 1,
-0.1246754, -1.736615, -3.018841, 0, 1, 0.7176471, 1,
-0.122008, -1.042691, -2.842072, 0, 1, 0.7254902, 1,
-0.1152662, 0.1997786, -0.03320376, 0, 1, 0.7294118, 1,
-0.111286, 0.342772, -0.4465171, 0, 1, 0.7372549, 1,
-0.1070236, 0.1794147, 0.02366184, 0, 1, 0.7411765, 1,
-0.1064675, -0.3296871, -1.514901, 0, 1, 0.7490196, 1,
-0.104403, 0.1026102, -0.8478513, 0, 1, 0.7529412, 1,
-0.1043092, -1.995806, -3.613256, 0, 1, 0.7607843, 1,
-0.1037694, 0.4889573, 0.838272, 0, 1, 0.7647059, 1,
-0.09684049, -0.6310318, -3.393093, 0, 1, 0.772549, 1,
-0.0939704, -0.3874027, -1.813042, 0, 1, 0.7764706, 1,
-0.0871406, -0.4464614, -1.984418, 0, 1, 0.7843137, 1,
-0.08688833, 0.02643543, -0.4528392, 0, 1, 0.7882353, 1,
-0.08644185, -0.6425523, -3.391892, 0, 1, 0.7960784, 1,
-0.08179719, -0.9026703, -4.067773, 0, 1, 0.8039216, 1,
-0.0780574, 0.720217, -0.3963828, 0, 1, 0.8078431, 1,
-0.07693157, 0.02239427, -0.3119212, 0, 1, 0.8156863, 1,
-0.0753525, -1.269287, -4.572011, 0, 1, 0.8196079, 1,
-0.06990271, 0.6157551, -0.6046091, 0, 1, 0.827451, 1,
-0.06952834, 0.8396786, 1.035598, 0, 1, 0.8313726, 1,
-0.06841438, -0.9566468, -1.086952, 0, 1, 0.8392157, 1,
-0.06837244, -1.822701, -4.996058, 0, 1, 0.8431373, 1,
-0.06506754, -0.6772057, -4.710186, 0, 1, 0.8509804, 1,
-0.06227031, 0.2275492, 1.830143, 0, 1, 0.854902, 1,
-0.0615459, -0.3145703, -4.566259, 0, 1, 0.8627451, 1,
-0.06089371, -0.5570829, -4.289215, 0, 1, 0.8666667, 1,
-0.0608753, 0.4054264, 0.0007262573, 0, 1, 0.8745098, 1,
-0.05775292, -1.984226, -3.764288, 0, 1, 0.8784314, 1,
-0.0520115, -0.2572954, -2.096657, 0, 1, 0.8862745, 1,
-0.04185082, -0.02202043, -1.945238, 0, 1, 0.8901961, 1,
-0.04060357, -0.9218606, -4.401633, 0, 1, 0.8980392, 1,
-0.0389461, 0.3945585, -0.4758439, 0, 1, 0.9058824, 1,
-0.03523819, -1.014531, -2.79624, 0, 1, 0.9098039, 1,
-0.03228941, 1.734426, 0.8531271, 0, 1, 0.9176471, 1,
-0.03132564, 0.263609, -0.9458527, 0, 1, 0.9215686, 1,
-0.03084461, -0.6398501, -1.663859, 0, 1, 0.9294118, 1,
-0.03020002, 1.069428, -0.7800406, 0, 1, 0.9333333, 1,
-0.02797418, -1.247984, -4.545147, 0, 1, 0.9411765, 1,
-0.02440116, -0.6275716, -3.170002, 0, 1, 0.945098, 1,
-0.0241096, -1.046845, -3.257495, 0, 1, 0.9529412, 1,
-0.02293097, -0.4464553, -1.775341, 0, 1, 0.9568627, 1,
-0.02188308, 0.9572015, 1.550474, 0, 1, 0.9647059, 1,
-0.01964521, -0.4877734, -4.393724, 0, 1, 0.9686275, 1,
-0.008649157, -1.087441, -3.668137, 0, 1, 0.9764706, 1,
-0.007567915, 1.334515, 1.181497, 0, 1, 0.9803922, 1,
-0.006037192, 0.2753277, -0.5375735, 0, 1, 0.9882353, 1,
-0.004960531, 1.377403, 2.360568, 0, 1, 0.9921569, 1,
-0.003011634, 1.863116, -0.1234258, 0, 1, 1, 1,
0.003491943, 1.624701, 0.4649454, 0, 0.9921569, 1, 1,
0.008244654, -1.095067, 2.451229, 0, 0.9882353, 1, 1,
0.01900753, 0.915893, 2.436133, 0, 0.9803922, 1, 1,
0.0205088, 0.7617211, 0.7379853, 0, 0.9764706, 1, 1,
0.0206168, 0.06304671, -0.07077806, 0, 0.9686275, 1, 1,
0.02144619, -0.5292417, 4.836139, 0, 0.9647059, 1, 1,
0.02477178, -0.2864988, 2.675129, 0, 0.9568627, 1, 1,
0.02508527, 0.07277282, 0.2863915, 0, 0.9529412, 1, 1,
0.0290812, 0.6683657, -0.5248939, 0, 0.945098, 1, 1,
0.02930186, -0.964, 1.098395, 0, 0.9411765, 1, 1,
0.03040657, -0.2666865, 2.875952, 0, 0.9333333, 1, 1,
0.03203922, 1.983214, -1.336519, 0, 0.9294118, 1, 1,
0.03432158, -1.425005, 3.671496, 0, 0.9215686, 1, 1,
0.03585758, -1.436076, 3.258067, 0, 0.9176471, 1, 1,
0.03663914, 0.4733589, -2.279407, 0, 0.9098039, 1, 1,
0.03688536, 0.1896995, 0.3088136, 0, 0.9058824, 1, 1,
0.03746578, 1.157269, -0.2547775, 0, 0.8980392, 1, 1,
0.03749297, 0.3953498, 1.227499, 0, 0.8901961, 1, 1,
0.04044843, -1.732651, 2.392978, 0, 0.8862745, 1, 1,
0.04156354, 1.50277, -0.7081755, 0, 0.8784314, 1, 1,
0.0421324, 0.1529646, -0.1742905, 0, 0.8745098, 1, 1,
0.04710431, 1.371705, -1.078284, 0, 0.8666667, 1, 1,
0.04717379, -0.6924021, 2.895164, 0, 0.8627451, 1, 1,
0.05040253, 0.8213251, 0.2717377, 0, 0.854902, 1, 1,
0.05145218, 0.5024986, 1.714284, 0, 0.8509804, 1, 1,
0.05361449, -0.1365677, 3.812809, 0, 0.8431373, 1, 1,
0.05524781, -1.173737, 3.874617, 0, 0.8392157, 1, 1,
0.0585756, -0.2150121, 4.29597, 0, 0.8313726, 1, 1,
0.06032302, 1.173676, 0.903091, 0, 0.827451, 1, 1,
0.06046112, -0.4083337, 4.335372, 0, 0.8196079, 1, 1,
0.06207982, 0.9902945, 1.055792, 0, 0.8156863, 1, 1,
0.06409693, 1.392514, -0.5410693, 0, 0.8078431, 1, 1,
0.0665717, -1.31753, 2.296571, 0, 0.8039216, 1, 1,
0.06912426, -1.22748, 4.58338, 0, 0.7960784, 1, 1,
0.07011124, 1.943208, -1.461905, 0, 0.7882353, 1, 1,
0.07184484, 0.2670214, 0.1088721, 0, 0.7843137, 1, 1,
0.0759607, -0.05405842, 1.473766, 0, 0.7764706, 1, 1,
0.07610864, -0.4561613, 3.401178, 0, 0.772549, 1, 1,
0.07709958, 0.04915673, -2.183572, 0, 0.7647059, 1, 1,
0.07795905, 0.849628, -0.250747, 0, 0.7607843, 1, 1,
0.07926656, 1.512875, -1.387109, 0, 0.7529412, 1, 1,
0.08843631, 0.5024321, 1.929513, 0, 0.7490196, 1, 1,
0.08975235, 1.142027, 0.229066, 0, 0.7411765, 1, 1,
0.09333035, -0.2107504, 1.156743, 0, 0.7372549, 1, 1,
0.09338731, 1.624312, -0.2992139, 0, 0.7294118, 1, 1,
0.09748607, 0.1498976, 0.947755, 0, 0.7254902, 1, 1,
0.09759624, 1.35119, 0.9321601, 0, 0.7176471, 1, 1,
0.09899672, -1.990579, 2.56301, 0, 0.7137255, 1, 1,
0.1058379, 0.6613023, 1.244376, 0, 0.7058824, 1, 1,
0.1113643, -1.144418, 2.802047, 0, 0.6980392, 1, 1,
0.118319, 0.2293628, 1.573334, 0, 0.6941177, 1, 1,
0.1193795, 0.411019, 0.3094718, 0, 0.6862745, 1, 1,
0.121912, -1.263423, 3.388938, 0, 0.682353, 1, 1,
0.1226037, -0.06951234, 2.04881, 0, 0.6745098, 1, 1,
0.1411492, 1.565845, 0.1907256, 0, 0.6705883, 1, 1,
0.1416074, -1.23575, 2.766956, 0, 0.6627451, 1, 1,
0.1468993, 0.5214396, 1.692593, 0, 0.6588235, 1, 1,
0.1491485, 1.956707, 2.028965, 0, 0.6509804, 1, 1,
0.1551906, -0.5330816, 2.27894, 0, 0.6470588, 1, 1,
0.1555164, 1.913613, -1.037157, 0, 0.6392157, 1, 1,
0.158392, 0.1788589, -0.07307601, 0, 0.6352941, 1, 1,
0.1592453, 1.17618, 0.4125556, 0, 0.627451, 1, 1,
0.1602623, -1.832675, 3.191575, 0, 0.6235294, 1, 1,
0.1612494, -1.7994, 2.294164, 0, 0.6156863, 1, 1,
0.1616887, 0.6463993, 1.18021, 0, 0.6117647, 1, 1,
0.1638544, -1.841819, 3.833826, 0, 0.6039216, 1, 1,
0.1646704, 0.1127226, 1.762589, 0, 0.5960785, 1, 1,
0.1801874, 0.5501508, 0.6881704, 0, 0.5921569, 1, 1,
0.1836949, -1.020719, 2.480366, 0, 0.5843138, 1, 1,
0.1846139, 0.548717, 2.065875, 0, 0.5803922, 1, 1,
0.1869019, 1.577692, -0.8634616, 0, 0.572549, 1, 1,
0.1890539, -0.002683952, 4.561249, 0, 0.5686275, 1, 1,
0.1914555, -0.9062061, 4.912596, 0, 0.5607843, 1, 1,
0.1915772, 1.35553, -2.053769, 0, 0.5568628, 1, 1,
0.1935795, -0.09892518, 1.168079, 0, 0.5490196, 1, 1,
0.1949292, -0.2946033, 0.8682184, 0, 0.5450981, 1, 1,
0.1949997, -0.2224532, 2.934417, 0, 0.5372549, 1, 1,
0.2006433, -0.03267192, 2.079424, 0, 0.5333334, 1, 1,
0.205088, 0.3079986, 0.3803704, 0, 0.5254902, 1, 1,
0.2121456, 0.4113904, 1.482225, 0, 0.5215687, 1, 1,
0.212495, -2.077016, 3.53438, 0, 0.5137255, 1, 1,
0.2202369, 0.3216253, 1.346027, 0, 0.509804, 1, 1,
0.2306699, -0.1587694, 0.7212821, 0, 0.5019608, 1, 1,
0.2344699, 0.8832046, 0.4783414, 0, 0.4941176, 1, 1,
0.2399008, -1.028485, 2.749987, 0, 0.4901961, 1, 1,
0.2399501, 0.4570912, -0.04386954, 0, 0.4823529, 1, 1,
0.24028, 0.6684919, 0.2888111, 0, 0.4784314, 1, 1,
0.2427807, 2.7003, 0.9054458, 0, 0.4705882, 1, 1,
0.2450242, 1.460626, -0.9608601, 0, 0.4666667, 1, 1,
0.2524583, -1.024819, 0.7821097, 0, 0.4588235, 1, 1,
0.2545679, -3.034606, 3.202507, 0, 0.454902, 1, 1,
0.2555803, 1.215093, 0.5354568, 0, 0.4470588, 1, 1,
0.2577132, 0.226662, -0.02459291, 0, 0.4431373, 1, 1,
0.2597096, -0.8897129, 4.322, 0, 0.4352941, 1, 1,
0.2625394, -1.253449, 1.525516, 0, 0.4313726, 1, 1,
0.263072, 0.04674461, 2.022441, 0, 0.4235294, 1, 1,
0.2637807, -0.7675171, 1.074472, 0, 0.4196078, 1, 1,
0.2665583, 0.5882875, -0.04813519, 0, 0.4117647, 1, 1,
0.268438, 0.3107531, 0.4016836, 0, 0.4078431, 1, 1,
0.2715683, 0.464629, 1.675708, 0, 0.4, 1, 1,
0.2719982, -0.9122579, 3.877599, 0, 0.3921569, 1, 1,
0.274234, 0.765264, -0.283863, 0, 0.3882353, 1, 1,
0.2789095, -1.158429, 3.445864, 0, 0.3803922, 1, 1,
0.2789537, -0.134067, 1.913126, 0, 0.3764706, 1, 1,
0.2807007, 0.176847, -0.5848939, 0, 0.3686275, 1, 1,
0.2807117, 1.582725, -0.7569691, 0, 0.3647059, 1, 1,
0.2811488, 2.106953, -0.6503577, 0, 0.3568628, 1, 1,
0.2818769, -1.019706, 4.175682, 0, 0.3529412, 1, 1,
0.2858646, 1.37759, -1.320617, 0, 0.345098, 1, 1,
0.2862028, 1.108553, -0.006744091, 0, 0.3411765, 1, 1,
0.2871515, 0.7452086, 1.103086, 0, 0.3333333, 1, 1,
0.2875088, -0.8267038, 4.364889, 0, 0.3294118, 1, 1,
0.2897137, 0.9611942, 1.227951, 0, 0.3215686, 1, 1,
0.2973898, 0.5592329, -0.4079912, 0, 0.3176471, 1, 1,
0.298408, -0.06545042, 1.760952, 0, 0.3098039, 1, 1,
0.301952, 0.4755804, 0.430914, 0, 0.3058824, 1, 1,
0.3057513, -1.826615, 3.071475, 0, 0.2980392, 1, 1,
0.3064618, -1.852185, 2.636987, 0, 0.2901961, 1, 1,
0.3076028, -0.2122118, 1.315464, 0, 0.2862745, 1, 1,
0.3108154, 0.2606724, 2.395952, 0, 0.2784314, 1, 1,
0.3110494, -0.2152316, 2.433315, 0, 0.2745098, 1, 1,
0.313307, -0.3297523, 4.27097, 0, 0.2666667, 1, 1,
0.314303, 0.4877867, 1.281095, 0, 0.2627451, 1, 1,
0.3221337, 1.063699, -0.1506542, 0, 0.254902, 1, 1,
0.3240408, -0.1237178, 3.386488, 0, 0.2509804, 1, 1,
0.3248552, 0.6493093, 1.511683, 0, 0.2431373, 1, 1,
0.3251932, 1.267985, 0.05891096, 0, 0.2392157, 1, 1,
0.3261669, 1.442787, -0.1320119, 0, 0.2313726, 1, 1,
0.3263606, -0.8972293, 1.786488, 0, 0.227451, 1, 1,
0.3274647, 0.1674896, -0.2676663, 0, 0.2196078, 1, 1,
0.3282946, -0.4392695, 1.878719, 0, 0.2156863, 1, 1,
0.3296449, 1.416613, -0.930427, 0, 0.2078431, 1, 1,
0.332109, -0.1366678, 2.159679, 0, 0.2039216, 1, 1,
0.3355516, -0.249031, 1.573596, 0, 0.1960784, 1, 1,
0.336403, -0.633573, 2.741463, 0, 0.1882353, 1, 1,
0.3382524, 0.4243924, 2.391942, 0, 0.1843137, 1, 1,
0.3434576, -1.036075, 3.169744, 0, 0.1764706, 1, 1,
0.345547, 1.116199, -0.3933742, 0, 0.172549, 1, 1,
0.3490038, 1.616053, -0.1592434, 0, 0.1647059, 1, 1,
0.3491557, -0.1727026, 1.292863, 0, 0.1607843, 1, 1,
0.350419, -0.5146165, 3.372269, 0, 0.1529412, 1, 1,
0.3515679, -0.6320685, 2.035167, 0, 0.1490196, 1, 1,
0.3573906, 0.7503852, -0.9027337, 0, 0.1411765, 1, 1,
0.3582056, 1.087031, 0.7179103, 0, 0.1372549, 1, 1,
0.3621382, -0.7717413, 3.319778, 0, 0.1294118, 1, 1,
0.3633968, 2.059063, 0.635131, 0, 0.1254902, 1, 1,
0.3672896, -0.05181119, 2.022483, 0, 0.1176471, 1, 1,
0.3693826, 0.3083318, 3.0398, 0, 0.1137255, 1, 1,
0.3744653, -0.2697932, 1.579602, 0, 0.1058824, 1, 1,
0.3801349, 0.2816721, 1.025038, 0, 0.09803922, 1, 1,
0.3832012, 0.5164659, 1.964, 0, 0.09411765, 1, 1,
0.3834772, -1.485337, 3.096765, 0, 0.08627451, 1, 1,
0.3843383, -0.5897819, 2.278214, 0, 0.08235294, 1, 1,
0.3880759, 0.8529206, -0.4087166, 0, 0.07450981, 1, 1,
0.3890799, -1.232592, 2.332202, 0, 0.07058824, 1, 1,
0.3915821, 2.04264, 0.4623228, 0, 0.0627451, 1, 1,
0.3926992, -0.6119705, 2.804035, 0, 0.05882353, 1, 1,
0.3931671, 0.2219184, 1.459103, 0, 0.05098039, 1, 1,
0.3937271, 0.2966664, 2.636297, 0, 0.04705882, 1, 1,
0.3953657, 0.4490063, 1.835593, 0, 0.03921569, 1, 1,
0.4008709, -1.005258, 2.200887, 0, 0.03529412, 1, 1,
0.4049484, 0.3642196, 1.492765, 0, 0.02745098, 1, 1,
0.4068003, 0.5875029, 1.369839, 0, 0.02352941, 1, 1,
0.4097557, 0.1649501, -0.773977, 0, 0.01568628, 1, 1,
0.4112252, 1.047278, 0.6442836, 0, 0.01176471, 1, 1,
0.4134626, -1.517061, 3.152322, 0, 0.003921569, 1, 1,
0.4171001, -0.01772169, 1.428201, 0.003921569, 0, 1, 1,
0.4184211, -0.3709498, 1.393498, 0.007843138, 0, 1, 1,
0.4215565, 1.588012, -0.07249503, 0.01568628, 0, 1, 1,
0.4218723, 0.7127048, 0.7670799, 0.01960784, 0, 1, 1,
0.4265609, -0.2897207, 3.09854, 0.02745098, 0, 1, 1,
0.4275352, -0.2482042, 1.693684, 0.03137255, 0, 1, 1,
0.4309224, 0.7005373, 0.06159112, 0.03921569, 0, 1, 1,
0.437605, -1.281814, 3.01001, 0.04313726, 0, 1, 1,
0.4401838, -0.0827373, 2.731186, 0.05098039, 0, 1, 1,
0.4423444, 1.938435, 0.8566907, 0.05490196, 0, 1, 1,
0.442702, 0.6494964, 0.3608472, 0.0627451, 0, 1, 1,
0.4428946, -1.441672, 1.514185, 0.06666667, 0, 1, 1,
0.4498684, 1.282895, -0.3256526, 0.07450981, 0, 1, 1,
0.4581059, 0.7770885, 0.6357982, 0.07843138, 0, 1, 1,
0.4598787, 0.4178719, 1.551836, 0.08627451, 0, 1, 1,
0.4648864, 1.26091, -0.2323543, 0.09019608, 0, 1, 1,
0.4651135, -0.5492184, 0.7850871, 0.09803922, 0, 1, 1,
0.4698175, 1.403079, 0.1887327, 0.1058824, 0, 1, 1,
0.4702814, 0.1944178, 2.304149, 0.1098039, 0, 1, 1,
0.4749672, -1.229548, 2.865295, 0.1176471, 0, 1, 1,
0.4768716, -0.5217883, 3.601264, 0.1215686, 0, 1, 1,
0.4829838, -0.710534, 1.815556, 0.1294118, 0, 1, 1,
0.4847254, 0.7845497, 2.01175, 0.1333333, 0, 1, 1,
0.4851393, -0.3133736, 2.667581, 0.1411765, 0, 1, 1,
0.4860909, -0.1762836, 1.043835, 0.145098, 0, 1, 1,
0.4862592, -1.315262, 3.66814, 0.1529412, 0, 1, 1,
0.490478, -1.241969, 3.349484, 0.1568628, 0, 1, 1,
0.4916516, 2.339401, 1.015007, 0.1647059, 0, 1, 1,
0.4920597, -1.59231, 0.5524818, 0.1686275, 0, 1, 1,
0.4936087, 0.7042987, 2.311307, 0.1764706, 0, 1, 1,
0.5006335, 0.3052406, 2.078183, 0.1803922, 0, 1, 1,
0.5072634, 3.264157, -0.0867312, 0.1882353, 0, 1, 1,
0.5152754, -0.2638752, 2.178796, 0.1921569, 0, 1, 1,
0.5154456, -0.9022799, 2.542775, 0.2, 0, 1, 1,
0.5209388, 0.6171805, -0.3204686, 0.2078431, 0, 1, 1,
0.5228167, 0.5594655, 0.3968818, 0.2117647, 0, 1, 1,
0.5266853, 1.33616, -1.323066, 0.2196078, 0, 1, 1,
0.5270005, -0.8440449, 1.715784, 0.2235294, 0, 1, 1,
0.5274948, 0.3153111, 1.313349, 0.2313726, 0, 1, 1,
0.5326259, -1.841578, 4.864686, 0.2352941, 0, 1, 1,
0.5370762, 0.9274322, 0.8422395, 0.2431373, 0, 1, 1,
0.5382631, -0.4046974, 0.1299532, 0.2470588, 0, 1, 1,
0.5388516, -0.7085137, 0.7892346, 0.254902, 0, 1, 1,
0.5391958, -0.02166759, 2.562035, 0.2588235, 0, 1, 1,
0.5443866, 0.7605765, 0.9104148, 0.2666667, 0, 1, 1,
0.5450211, 2.623277, 0.1371216, 0.2705882, 0, 1, 1,
0.5510144, 0.4845622, 1.54853, 0.2784314, 0, 1, 1,
0.5513304, -1.25754, 2.788357, 0.282353, 0, 1, 1,
0.5562841, -2.688813, 3.263824, 0.2901961, 0, 1, 1,
0.561927, -1.627184, 1.704548, 0.2941177, 0, 1, 1,
0.5658957, 0.703063, 0.01165279, 0.3019608, 0, 1, 1,
0.5673859, -0.1205997, 2.180078, 0.3098039, 0, 1, 1,
0.5707993, 0.8485719, 0.9370205, 0.3137255, 0, 1, 1,
0.5723287, -0.08722154, 2.199692, 0.3215686, 0, 1, 1,
0.5724533, 0.9613261, -0.07840475, 0.3254902, 0, 1, 1,
0.5727239, 0.9821162, -0.9660103, 0.3333333, 0, 1, 1,
0.5728488, -0.2497719, 1.492164, 0.3372549, 0, 1, 1,
0.5731958, -2.517895, 3.39292, 0.345098, 0, 1, 1,
0.5757112, 0.09969136, 1.332018, 0.3490196, 0, 1, 1,
0.5808662, -0.3700928, 4.107593, 0.3568628, 0, 1, 1,
0.582418, 1.779198, 0.3117891, 0.3607843, 0, 1, 1,
0.5848152, -0.3186718, 1.788423, 0.3686275, 0, 1, 1,
0.5858191, 2.37599, 1.997252, 0.372549, 0, 1, 1,
0.5893945, -0.06212625, 1.537847, 0.3803922, 0, 1, 1,
0.596646, -1.335827, 3.731945, 0.3843137, 0, 1, 1,
0.5982183, 1.352646, 0.9513939, 0.3921569, 0, 1, 1,
0.5996132, 0.06567799, 1.080899, 0.3960784, 0, 1, 1,
0.6010157, -0.9241309, 3.417245, 0.4039216, 0, 1, 1,
0.6012473, 1.420432, 0.503445, 0.4117647, 0, 1, 1,
0.6017822, 2.170809, 1.318534, 0.4156863, 0, 1, 1,
0.6028327, -0.7896861, 2.089509, 0.4235294, 0, 1, 1,
0.6048245, -0.5688637, 3.698401, 0.427451, 0, 1, 1,
0.6073213, -0.7129512, 2.503465, 0.4352941, 0, 1, 1,
0.6134992, -2.347096, 1.432011, 0.4392157, 0, 1, 1,
0.6139812, -0.983475, 0.9968035, 0.4470588, 0, 1, 1,
0.6162673, -0.915489, 2.744153, 0.4509804, 0, 1, 1,
0.6217251, 1.747855, 1.155695, 0.4588235, 0, 1, 1,
0.6228642, 0.68338, -0.55498, 0.4627451, 0, 1, 1,
0.6229493, -0.9780445, 2.702984, 0.4705882, 0, 1, 1,
0.626264, 1.035743, 2.697944, 0.4745098, 0, 1, 1,
0.626601, -1.964918, 3.202869, 0.4823529, 0, 1, 1,
0.6278521, -0.472897, 3.721634, 0.4862745, 0, 1, 1,
0.6282211, -0.4492961, 1.62339, 0.4941176, 0, 1, 1,
0.6306155, 0.6360269, 1.10835, 0.5019608, 0, 1, 1,
0.6319185, -1.040027, 5.072371, 0.5058824, 0, 1, 1,
0.636097, 2.07104, -1.16606, 0.5137255, 0, 1, 1,
0.636147, -0.5775898, 2.239448, 0.5176471, 0, 1, 1,
0.6386415, -0.12259, 4.094842, 0.5254902, 0, 1, 1,
0.6387365, -0.9975187, 1.086749, 0.5294118, 0, 1, 1,
0.641547, -0.4237471, 2.292924, 0.5372549, 0, 1, 1,
0.6473279, -0.6636697, 1.020396, 0.5411765, 0, 1, 1,
0.6479562, 0.4930398, 0.7439345, 0.5490196, 0, 1, 1,
0.6495416, 0.5194772, 0.8544312, 0.5529412, 0, 1, 1,
0.65951, 0.828603, 0.8809288, 0.5607843, 0, 1, 1,
0.6602167, -0.4658418, 2.061297, 0.5647059, 0, 1, 1,
0.6611505, -0.4322413, 1.755932, 0.572549, 0, 1, 1,
0.6642972, -0.6575637, 2.502398, 0.5764706, 0, 1, 1,
0.6702069, 1.695155, 0.7995135, 0.5843138, 0, 1, 1,
0.675177, 1.000627, 3.210006, 0.5882353, 0, 1, 1,
0.6774632, -0.5111346, 2.529211, 0.5960785, 0, 1, 1,
0.6845892, -0.9771511, 2.1242, 0.6039216, 0, 1, 1,
0.6876835, -1.185707, 3.246443, 0.6078432, 0, 1, 1,
0.6890198, -0.2465525, 2.340951, 0.6156863, 0, 1, 1,
0.6892754, -1.76169, 3.137434, 0.6196079, 0, 1, 1,
0.7005311, 0.3866406, 2.434064, 0.627451, 0, 1, 1,
0.700674, 0.6447318, 1.78547, 0.6313726, 0, 1, 1,
0.7015273, 1.586704, 1.24062, 0.6392157, 0, 1, 1,
0.7041663, 0.6593419, 1.701247, 0.6431373, 0, 1, 1,
0.7049237, 1.159759, 0.5043361, 0.6509804, 0, 1, 1,
0.7072069, -0.7881575, 1.287458, 0.654902, 0, 1, 1,
0.7181785, 0.864147, 0.5377586, 0.6627451, 0, 1, 1,
0.7233927, 0.2540766, 1.141429, 0.6666667, 0, 1, 1,
0.727677, -0.9365405, 3.474247, 0.6745098, 0, 1, 1,
0.7303548, 0.05390248, -0.3195347, 0.6784314, 0, 1, 1,
0.7352204, -1.698049, 1.80828, 0.6862745, 0, 1, 1,
0.7381289, -0.1741863, 1.733759, 0.6901961, 0, 1, 1,
0.7392422, -0.5924651, 2.288639, 0.6980392, 0, 1, 1,
0.748943, 0.1725886, 0.5391437, 0.7058824, 0, 1, 1,
0.7499413, -1.071043, 2.201935, 0.7098039, 0, 1, 1,
0.7615405, -1.58571, 2.332728, 0.7176471, 0, 1, 1,
0.7684094, -1.565953, 2.414253, 0.7215686, 0, 1, 1,
0.7693766, 0.5297893, 1.090913, 0.7294118, 0, 1, 1,
0.7757447, 2.385779, 1.500032, 0.7333333, 0, 1, 1,
0.7767639, -1.646325, 2.858523, 0.7411765, 0, 1, 1,
0.7775759, 0.254986, 2.199566, 0.7450981, 0, 1, 1,
0.7808961, -0.4337602, 1.974968, 0.7529412, 0, 1, 1,
0.7819068, 0.6304184, 1.854966, 0.7568628, 0, 1, 1,
0.7821729, -0.676746, 3.511484, 0.7647059, 0, 1, 1,
0.7843907, 1.555981, 0.530928, 0.7686275, 0, 1, 1,
0.7882935, 0.06141704, 1.060032, 0.7764706, 0, 1, 1,
0.8026447, -1.585155, 1.399169, 0.7803922, 0, 1, 1,
0.8027988, 0.3812203, 2.847322, 0.7882353, 0, 1, 1,
0.8042093, 1.254962, 0.1029401, 0.7921569, 0, 1, 1,
0.8140073, -0.5414702, 2.040422, 0.8, 0, 1, 1,
0.823931, 0.8050333, 0.006533358, 0.8078431, 0, 1, 1,
0.8262211, -2.002584, 3.275928, 0.8117647, 0, 1, 1,
0.8643574, -0.4058135, 1.652198, 0.8196079, 0, 1, 1,
0.8669774, 0.5501255, 0.7328994, 0.8235294, 0, 1, 1,
0.8689275, -1.570825, 2.072719, 0.8313726, 0, 1, 1,
0.8706958, 1.310583, 1.020316, 0.8352941, 0, 1, 1,
0.8750612, 1.273869, -1.315131, 0.8431373, 0, 1, 1,
0.8796629, 0.7301582, 2.007227, 0.8470588, 0, 1, 1,
0.8893434, 0.1812449, 2.563004, 0.854902, 0, 1, 1,
0.8955507, 0.8881821, 3.219639, 0.8588235, 0, 1, 1,
0.8969826, -0.1479941, 3.322559, 0.8666667, 0, 1, 1,
0.8973327, 0.1246979, 2.893891, 0.8705882, 0, 1, 1,
0.8979095, -0.1582796, 0.5379782, 0.8784314, 0, 1, 1,
0.9035458, 1.918626, 1.573329, 0.8823529, 0, 1, 1,
0.9056081, -0.8461516, 3.673383, 0.8901961, 0, 1, 1,
0.9156594, -0.7781112, 1.022532, 0.8941177, 0, 1, 1,
0.916827, 0.3744278, 0.3317803, 0.9019608, 0, 1, 1,
0.91835, -0.6248875, 2.157954, 0.9098039, 0, 1, 1,
0.9188542, -1.285233, 1.347584, 0.9137255, 0, 1, 1,
0.9270602, 0.6664237, 0.4598888, 0.9215686, 0, 1, 1,
0.9277739, 0.7612906, 0.5471469, 0.9254902, 0, 1, 1,
0.9278799, -1.378778, 3.160957, 0.9333333, 0, 1, 1,
0.9359523, -1.091025, 4.262768, 0.9372549, 0, 1, 1,
0.9408859, 0.5839701, -1.50125, 0.945098, 0, 1, 1,
0.9454724, -0.3700768, 0.5195365, 0.9490196, 0, 1, 1,
0.9455508, -1.947081, 2.892427, 0.9568627, 0, 1, 1,
0.9457175, 0.3164407, 0.7677556, 0.9607843, 0, 1, 1,
0.9463767, 1.202073, 0.9790427, 0.9686275, 0, 1, 1,
0.9475701, 2.500775, 0.1117783, 0.972549, 0, 1, 1,
0.962487, -0.7049922, 3.171531, 0.9803922, 0, 1, 1,
0.9664715, -1.607621, 2.175944, 0.9843137, 0, 1, 1,
0.97114, 2.247871, 0.6623583, 0.9921569, 0, 1, 1,
0.9738622, 1.079793, 2.560633, 0.9960784, 0, 1, 1,
0.9938774, -1.67722, 2.106933, 1, 0, 0.9960784, 1,
0.9947037, 2.584382, -1.691673, 1, 0, 0.9882353, 1,
0.9952657, 0.5889837, -0.9390714, 1, 0, 0.9843137, 1,
1.005619, 0.3960662, 0.9264978, 1, 0, 0.9764706, 1,
1.007848, 0.1273261, 2.052115, 1, 0, 0.972549, 1,
1.01182, -0.8404942, 1.849731, 1, 0, 0.9647059, 1,
1.016798, 0.1309957, 0.8987021, 1, 0, 0.9607843, 1,
1.019703, 0.3778863, 0.3719495, 1, 0, 0.9529412, 1,
1.031378, -0.3195511, 1.351472, 1, 0, 0.9490196, 1,
1.039527, -0.8901486, 2.426519, 1, 0, 0.9411765, 1,
1.047516, -1.694085, 2.917878, 1, 0, 0.9372549, 1,
1.056627, -0.1032756, 0.2707189, 1, 0, 0.9294118, 1,
1.058233, 0.5054039, 1.219567, 1, 0, 0.9254902, 1,
1.069623, 0.6885306, 2.276075, 1, 0, 0.9176471, 1,
1.07128, 1.362156, -0.4223682, 1, 0, 0.9137255, 1,
1.078356, -1.149812, 3.493818, 1, 0, 0.9058824, 1,
1.090156, 1.501572, 1.949649, 1, 0, 0.9019608, 1,
1.091578, 0.9437105, 1.327193, 1, 0, 0.8941177, 1,
1.094446, -0.4818719, 1.214439, 1, 0, 0.8862745, 1,
1.095942, 0.1192406, 1.642989, 1, 0, 0.8823529, 1,
1.09663, -1.097468, 3.825898, 1, 0, 0.8745098, 1,
1.098488, 2.079461, 0.5533792, 1, 0, 0.8705882, 1,
1.100227, -1.277574, 1.93031, 1, 0, 0.8627451, 1,
1.10639, -0.1618476, 0.2979648, 1, 0, 0.8588235, 1,
1.116295, 0.1905986, 2.792221, 1, 0, 0.8509804, 1,
1.117454, -0.5379618, -0.146292, 1, 0, 0.8470588, 1,
1.12216, 1.43291, 3.206482, 1, 0, 0.8392157, 1,
1.125105, -0.5379465, 2.50345, 1, 0, 0.8352941, 1,
1.125816, -0.393408, 1.997779, 1, 0, 0.827451, 1,
1.130581, -0.5994481, 1.624645, 1, 0, 0.8235294, 1,
1.146057, 0.5495608, -0.02116977, 1, 0, 0.8156863, 1,
1.146873, 0.3419188, 2.02002, 1, 0, 0.8117647, 1,
1.148124, 0.7469628, 2.156445, 1, 0, 0.8039216, 1,
1.160012, 1.212229, 1.067369, 1, 0, 0.7960784, 1,
1.161128, -0.2219593, 1.897823, 1, 0, 0.7921569, 1,
1.162139, -0.3179387, -0.006372662, 1, 0, 0.7843137, 1,
1.163537, 0.2818689, 1.895887, 1, 0, 0.7803922, 1,
1.165088, 1.981318, 0.3062338, 1, 0, 0.772549, 1,
1.171899, 0.9315003, -0.7005682, 1, 0, 0.7686275, 1,
1.173023, -0.3710521, 0.7717969, 1, 0, 0.7607843, 1,
1.183455, -0.1261423, 0.9336334, 1, 0, 0.7568628, 1,
1.186864, 0.6205264, 1.751705, 1, 0, 0.7490196, 1,
1.19558, -0.5950184, 2.999022, 1, 0, 0.7450981, 1,
1.197984, 0.4866333, 2.575533, 1, 0, 0.7372549, 1,
1.209702, 0.06401404, -0.6175703, 1, 0, 0.7333333, 1,
1.209991, 0.7609928, 0.6018724, 1, 0, 0.7254902, 1,
1.217166, -1.297831, 2.935519, 1, 0, 0.7215686, 1,
1.239383, 0.4907023, 2.703716, 1, 0, 0.7137255, 1,
1.247912, 1.510367, -0.38541, 1, 0, 0.7098039, 1,
1.249038, 0.3999762, 1.131507, 1, 0, 0.7019608, 1,
1.251903, -0.2907824, 0.4823901, 1, 0, 0.6941177, 1,
1.254977, -1.060771, 3.793391, 1, 0, 0.6901961, 1,
1.266593, -0.6844167, 1.129687, 1, 0, 0.682353, 1,
1.269678, -0.3014298, 1.278039, 1, 0, 0.6784314, 1,
1.271636, -0.4448878, 1.511755, 1, 0, 0.6705883, 1,
1.272397, -0.02062384, 2.955385, 1, 0, 0.6666667, 1,
1.279427, 0.08227734, 0.9732717, 1, 0, 0.6588235, 1,
1.281876, -0.4969151, 0.3212197, 1, 0, 0.654902, 1,
1.28458, -1.566661, 3.911168, 1, 0, 0.6470588, 1,
1.286906, 1.476468, 0.02666583, 1, 0, 0.6431373, 1,
1.293857, 1.859445, 1.273995, 1, 0, 0.6352941, 1,
1.307618, -0.04964302, 2.623709, 1, 0, 0.6313726, 1,
1.309149, -1.251599, 1.587033, 1, 0, 0.6235294, 1,
1.314307, -0.1129273, 3.459406, 1, 0, 0.6196079, 1,
1.319502, -0.485947, 3.085854, 1, 0, 0.6117647, 1,
1.32111, -0.9651381, 4.486, 1, 0, 0.6078432, 1,
1.3219, 0.3795023, 0.8008021, 1, 0, 0.6, 1,
1.324175, 1.148393, -1.850831, 1, 0, 0.5921569, 1,
1.32512, 1.664175, -0.5386262, 1, 0, 0.5882353, 1,
1.334249, -0.7972996, 2.968198, 1, 0, 0.5803922, 1,
1.338516, 0.6563351, 2.857396, 1, 0, 0.5764706, 1,
1.349054, -1.634307, 2.916161, 1, 0, 0.5686275, 1,
1.355023, 0.154196, 2.582368, 1, 0, 0.5647059, 1,
1.355435, -1.797523, 2.710407, 1, 0, 0.5568628, 1,
1.356615, -0.8833822, 2.142732, 1, 0, 0.5529412, 1,
1.364678, 0.894745, 1.2017, 1, 0, 0.5450981, 1,
1.365184, 2.143421, 1.910134, 1, 0, 0.5411765, 1,
1.365545, -0.6728117, 3.860123, 1, 0, 0.5333334, 1,
1.366246, -0.2885813, 1.752077, 1, 0, 0.5294118, 1,
1.369865, -0.02936246, 2.478294, 1, 0, 0.5215687, 1,
1.378114, 2.576823, 1.182683, 1, 0, 0.5176471, 1,
1.380395, 0.4423389, 1.097778, 1, 0, 0.509804, 1,
1.381752, -0.009746492, 1.131883, 1, 0, 0.5058824, 1,
1.384, 0.6025099, 1.398194, 1, 0, 0.4980392, 1,
1.400159, -0.9710005, 1.616737, 1, 0, 0.4901961, 1,
1.405908, -0.07929602, 1.403506, 1, 0, 0.4862745, 1,
1.406414, 1.004569, 2.192019, 1, 0, 0.4784314, 1,
1.421497, -0.4186285, 2.733198, 1, 0, 0.4745098, 1,
1.433371, 0.7044913, 2.263139, 1, 0, 0.4666667, 1,
1.438891, 1.124205, 1.559663, 1, 0, 0.4627451, 1,
1.446053, 1.684529, 1.600079, 1, 0, 0.454902, 1,
1.455023, 0.4488689, 1.56768, 1, 0, 0.4509804, 1,
1.459384, 0.2802578, 2.894412, 1, 0, 0.4431373, 1,
1.464988, 0.8313094, 0.7791135, 1, 0, 0.4392157, 1,
1.477036, -0.4407665, 1.691067, 1, 0, 0.4313726, 1,
1.479961, -0.4535354, -1.18537, 1, 0, 0.427451, 1,
1.483294, 0.07350282, 2.180092, 1, 0, 0.4196078, 1,
1.487419, 1.886197, 1.064151, 1, 0, 0.4156863, 1,
1.489544, 1.933931, 0.675384, 1, 0, 0.4078431, 1,
1.508385, 1.48492, 1.307754, 1, 0, 0.4039216, 1,
1.51138, 0.5538669, -0.5780283, 1, 0, 0.3960784, 1,
1.51351, 1.107051, 2.303257, 1, 0, 0.3882353, 1,
1.540563, -0.03045761, 1.760339, 1, 0, 0.3843137, 1,
1.545273, -0.5244668, 1.094481, 1, 0, 0.3764706, 1,
1.554561, -0.3952222, 1.041964, 1, 0, 0.372549, 1,
1.561038, 1.937743, 1.501865, 1, 0, 0.3647059, 1,
1.561795, 0.8947742, 2.186138, 1, 0, 0.3607843, 1,
1.56691, -0.8698018, 2.510622, 1, 0, 0.3529412, 1,
1.597126, -1.942654, 2.732841, 1, 0, 0.3490196, 1,
1.603834, -0.8219444, 2.146414, 1, 0, 0.3411765, 1,
1.605934, 0.6523699, 1.736813, 1, 0, 0.3372549, 1,
1.624475, 0.7336723, 1.688881, 1, 0, 0.3294118, 1,
1.628261, 0.6527578, 1.070681, 1, 0, 0.3254902, 1,
1.628965, 0.1623187, 1.93079, 1, 0, 0.3176471, 1,
1.633204, -1.436455, 1.22565, 1, 0, 0.3137255, 1,
1.636652, -1.246202, 2.36156, 1, 0, 0.3058824, 1,
1.648347, 0.1814048, 0.5844254, 1, 0, 0.2980392, 1,
1.656674, -1.990567, 4.376619, 1, 0, 0.2941177, 1,
1.659468, 0.2329382, 3.088249, 1, 0, 0.2862745, 1,
1.661418, 1.206808, -0.1535877, 1, 0, 0.282353, 1,
1.667071, 0.01342515, 2.456831, 1, 0, 0.2745098, 1,
1.673211, -0.4251035, 1.293999, 1, 0, 0.2705882, 1,
1.674708, -0.142487, 1.873316, 1, 0, 0.2627451, 1,
1.69002, -0.3061999, -1.292396, 1, 0, 0.2588235, 1,
1.693065, 0.3290478, 1.49164, 1, 0, 0.2509804, 1,
1.712181, -1.178342, 1.409969, 1, 0, 0.2470588, 1,
1.725367, 0.04207509, 1.968661, 1, 0, 0.2392157, 1,
1.728404, 0.7950539, 2.056211, 1, 0, 0.2352941, 1,
1.729404, 0.7317849, 2.911885, 1, 0, 0.227451, 1,
1.734772, 0.4135281, 0.6752955, 1, 0, 0.2235294, 1,
1.79326, 0.7937231, 0.5081529, 1, 0, 0.2156863, 1,
1.80002, 0.9667299, 1.407842, 1, 0, 0.2117647, 1,
1.803979, -0.7372873, 1.815092, 1, 0, 0.2039216, 1,
1.805905, -0.7587194, 1.067993, 1, 0, 0.1960784, 1,
1.810215, -2.835295, 2.969837, 1, 0, 0.1921569, 1,
1.813017, 0.2981734, 3.646287, 1, 0, 0.1843137, 1,
1.823579, 0.365441, 0.2253123, 1, 0, 0.1803922, 1,
1.857529, -0.0593788, 1.082602, 1, 0, 0.172549, 1,
1.903048, 0.2877344, 1.485442, 1, 0, 0.1686275, 1,
1.909427, -0.6141232, 1.503609, 1, 0, 0.1607843, 1,
1.972174, -1.324369, 1.511881, 1, 0, 0.1568628, 1,
1.973606, -0.9581708, 3.01502, 1, 0, 0.1490196, 1,
1.988122, -0.8408735, 1.095991, 1, 0, 0.145098, 1,
1.991987, 0.5944557, 1.473952, 1, 0, 0.1372549, 1,
2.054625, 1.418039, 2.108828, 1, 0, 0.1333333, 1,
2.055125, 0.06725109, 0.6970994, 1, 0, 0.1254902, 1,
2.117445, 2.173813, 2.055542, 1, 0, 0.1215686, 1,
2.132066, -0.6636212, 1.16609, 1, 0, 0.1137255, 1,
2.167909, -0.8230273, 1.338043, 1, 0, 0.1098039, 1,
2.193113, 1.564378, 0.1814315, 1, 0, 0.1019608, 1,
2.195282, 1.413388, 1.520432, 1, 0, 0.09411765, 1,
2.203162, -1.497935, 2.876097, 1, 0, 0.09019608, 1,
2.326676, -0.5233653, 3.883875, 1, 0, 0.08235294, 1,
2.340118, -0.1756014, 0.5315149, 1, 0, 0.07843138, 1,
2.426553, 0.6095473, 2.45383, 1, 0, 0.07058824, 1,
2.433848, -0.2684778, 2.241627, 1, 0, 0.06666667, 1,
2.577387, 0.4241051, 0.9816905, 1, 0, 0.05882353, 1,
2.652104, 0.4186784, 2.44951, 1, 0, 0.05490196, 1,
2.664639, -2.397434, 2.130415, 1, 0, 0.04705882, 1,
2.737277, 0.5217708, 1.002749, 1, 0, 0.04313726, 1,
2.777211, 0.4900264, 1.15713, 1, 0, 0.03529412, 1,
2.781369, 0.7914353, 0.6838685, 1, 0, 0.03137255, 1,
2.801283, -0.5810348, 2.061969, 1, 0, 0.02352941, 1,
2.84901, 0.1417406, 2.504539, 1, 0, 0.01960784, 1,
3.284236, -1.40047, 2.00275, 1, 0, 0.01176471, 1,
4.579725, -0.1834788, 3.551999, 1, 0, 0.007843138, 1
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
0.659605, -4.610037, -6.7104, 0, -0.5, 0.5, 0.5,
0.659605, -4.610037, -6.7104, 1, -0.5, 0.5, 0.5,
0.659605, -4.610037, -6.7104, 1, 1.5, 0.5, 0.5,
0.659605, -4.610037, -6.7104, 0, 1.5, 0.5, 0.5
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
-4.589436, -0.1023219, -6.7104, 0, -0.5, 0.5, 0.5,
-4.589436, -0.1023219, -6.7104, 1, -0.5, 0.5, 0.5,
-4.589436, -0.1023219, -6.7104, 1, 1.5, 0.5, 0.5,
-4.589436, -0.1023219, -6.7104, 0, 1.5, 0.5, 0.5
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
-4.589436, -4.610037, 0.03484607, 0, -0.5, 0.5, 0.5,
-4.589436, -4.610037, 0.03484607, 1, -0.5, 0.5, 0.5,
-4.589436, -4.610037, 0.03484607, 1, 1.5, 0.5, 0.5,
-4.589436, -4.610037, 0.03484607, 0, 1.5, 0.5, 0.5
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
-2, -3.569795, -5.153805,
4, -3.569795, -5.153805,
-2, -3.569795, -5.153805,
-2, -3.743169, -5.413237,
0, -3.569795, -5.153805,
0, -3.743169, -5.413237,
2, -3.569795, -5.153805,
2, -3.743169, -5.413237,
4, -3.569795, -5.153805,
4, -3.743169, -5.413237
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
"2",
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
-2, -4.089916, -5.932102, 0, -0.5, 0.5, 0.5,
-2, -4.089916, -5.932102, 1, -0.5, 0.5, 0.5,
-2, -4.089916, -5.932102, 1, 1.5, 0.5, 0.5,
-2, -4.089916, -5.932102, 0, 1.5, 0.5, 0.5,
0, -4.089916, -5.932102, 0, -0.5, 0.5, 0.5,
0, -4.089916, -5.932102, 1, -0.5, 0.5, 0.5,
0, -4.089916, -5.932102, 1, 1.5, 0.5, 0.5,
0, -4.089916, -5.932102, 0, 1.5, 0.5, 0.5,
2, -4.089916, -5.932102, 0, -0.5, 0.5, 0.5,
2, -4.089916, -5.932102, 1, -0.5, 0.5, 0.5,
2, -4.089916, -5.932102, 1, 1.5, 0.5, 0.5,
2, -4.089916, -5.932102, 0, 1.5, 0.5, 0.5,
4, -4.089916, -5.932102, 0, -0.5, 0.5, 0.5,
4, -4.089916, -5.932102, 1, -0.5, 0.5, 0.5,
4, -4.089916, -5.932102, 1, 1.5, 0.5, 0.5,
4, -4.089916, -5.932102, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.378119, -3, -5.153805,
-3.378119, 3, -5.153805,
-3.378119, -3, -5.153805,
-3.580005, -3, -5.413237,
-3.378119, -2, -5.153805,
-3.580005, -2, -5.413237,
-3.378119, -1, -5.153805,
-3.580005, -1, -5.413237,
-3.378119, 0, -5.153805,
-3.580005, 0, -5.413237,
-3.378119, 1, -5.153805,
-3.580005, 1, -5.413237,
-3.378119, 2, -5.153805,
-3.580005, 2, -5.413237,
-3.378119, 3, -5.153805,
-3.580005, 3, -5.413237
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
-3.983777, -3, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, -3, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, -3, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, -3, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, -2, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, -2, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, -2, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, -2, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, -1, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, -1, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, -1, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, -1, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, 0, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, 0, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, 0, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, 0, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, 1, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, 1, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, 1, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, 1, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, 2, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, 2, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, 2, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, 2, -5.932102, 0, 1.5, 0.5, 0.5,
-3.983777, 3, -5.932102, 0, -0.5, 0.5, 0.5,
-3.983777, 3, -5.932102, 1, -0.5, 0.5, 0.5,
-3.983777, 3, -5.932102, 1, 1.5, 0.5, 0.5,
-3.983777, 3, -5.932102, 0, 1.5, 0.5, 0.5
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
-3.378119, -3.569795, -4,
-3.378119, -3.569795, 4,
-3.378119, -3.569795, -4,
-3.580005, -3.743169, -4,
-3.378119, -3.569795, -2,
-3.580005, -3.743169, -2,
-3.378119, -3.569795, 0,
-3.580005, -3.743169, 0,
-3.378119, -3.569795, 2,
-3.580005, -3.743169, 2,
-3.378119, -3.569795, 4,
-3.580005, -3.743169, 4
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
-3.983777, -4.089916, -4, 0, -0.5, 0.5, 0.5,
-3.983777, -4.089916, -4, 1, -0.5, 0.5, 0.5,
-3.983777, -4.089916, -4, 1, 1.5, 0.5, 0.5,
-3.983777, -4.089916, -4, 0, 1.5, 0.5, 0.5,
-3.983777, -4.089916, -2, 0, -0.5, 0.5, 0.5,
-3.983777, -4.089916, -2, 1, -0.5, 0.5, 0.5,
-3.983777, -4.089916, -2, 1, 1.5, 0.5, 0.5,
-3.983777, -4.089916, -2, 0, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 0, 0, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 0, 1, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 0, 1, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 0, 0, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 2, 0, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 2, 1, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 2, 1, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 2, 0, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 4, 0, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 4, 1, -0.5, 0.5, 0.5,
-3.983777, -4.089916, 4, 1, 1.5, 0.5, 0.5,
-3.983777, -4.089916, 4, 0, 1.5, 0.5, 0.5
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
-3.378119, -3.569795, -5.153805,
-3.378119, 3.365151, -5.153805,
-3.378119, -3.569795, 5.223497,
-3.378119, 3.365151, 5.223497,
-3.378119, -3.569795, -5.153805,
-3.378119, -3.569795, 5.223497,
-3.378119, 3.365151, -5.153805,
-3.378119, 3.365151, 5.223497,
-3.378119, -3.569795, -5.153805,
4.697329, -3.569795, -5.153805,
-3.378119, -3.569795, 5.223497,
4.697329, -3.569795, 5.223497,
-3.378119, 3.365151, -5.153805,
4.697329, 3.365151, -5.153805,
-3.378119, 3.365151, 5.223497,
4.697329, 3.365151, 5.223497,
4.697329, -3.569795, -5.153805,
4.697329, 3.365151, -5.153805,
4.697329, -3.569795, 5.223497,
4.697329, 3.365151, 5.223497,
4.697329, -3.569795, -5.153805,
4.697329, -3.569795, 5.223497,
4.697329, 3.365151, -5.153805,
4.697329, 3.365151, 5.223497
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
var radius = 7.938097;
var distance = 35.31749;
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
mvMatrix.translate( -0.659605, 0.1023219, -0.03484607 );
mvMatrix.scale( 1.06283, 1.23762, 0.8270769 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31749);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


