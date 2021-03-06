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
-3.450195, 2.212592, -2.535479, 1, 0, 0, 1,
-3.318942, 0.8156211, -2.216832, 1, 0.007843138, 0, 1,
-3.209847, 0.2787055, -1.538376, 1, 0.01176471, 0, 1,
-2.926339, -0.8828579, -2.233498, 1, 0.01960784, 0, 1,
-2.866898, 0.2086402, -2.878575, 1, 0.02352941, 0, 1,
-2.864662, 0.1332328, -0.4392308, 1, 0.03137255, 0, 1,
-2.812086, -0.3383716, -2.174176, 1, 0.03529412, 0, 1,
-2.672376, 0.9644064, -0.439983, 1, 0.04313726, 0, 1,
-2.53511, -0.3405902, -2.347359, 1, 0.04705882, 0, 1,
-2.499718, 0.2341345, -0.5305027, 1, 0.05490196, 0, 1,
-2.236887, -0.7863104, -1.550097, 1, 0.05882353, 0, 1,
-2.233355, -0.1540878, -1.319271, 1, 0.06666667, 0, 1,
-2.23094, 1.734543, -0.1673978, 1, 0.07058824, 0, 1,
-2.156113, -0.7280543, -0.7167906, 1, 0.07843138, 0, 1,
-2.146329, 2.719527, -0.6244144, 1, 0.08235294, 0, 1,
-2.089562, -0.8576125, -0.7681658, 1, 0.09019608, 0, 1,
-2.063654, 0.3513466, -2.293279, 1, 0.09411765, 0, 1,
-2.060633, 0.8395826, -2.149774, 1, 0.1019608, 0, 1,
-2.042033, 1.374738, -1.122694, 1, 0.1098039, 0, 1,
-2.030647, -0.172202, -1.518899, 1, 0.1137255, 0, 1,
-1.985705, -0.2080878, -2.38798, 1, 0.1215686, 0, 1,
-1.984341, -0.3226759, 0.2367348, 1, 0.1254902, 0, 1,
-1.984021, 0.1425111, -3.524043, 1, 0.1333333, 0, 1,
-1.983469, -0.409591, -2.108374, 1, 0.1372549, 0, 1,
-1.884171, 0.807171, -2.293331, 1, 0.145098, 0, 1,
-1.874694, 0.447995, -0.8710988, 1, 0.1490196, 0, 1,
-1.874335, 0.3661405, -1.447232, 1, 0.1568628, 0, 1,
-1.865426, -0.05294675, -1.31257, 1, 0.1607843, 0, 1,
-1.862112, 0.5714722, -0.6528718, 1, 0.1686275, 0, 1,
-1.856619, -0.2056268, 0.2111412, 1, 0.172549, 0, 1,
-1.854093, -0.2096099, -0.2267909, 1, 0.1803922, 0, 1,
-1.851587, 0.5167592, -2.05444, 1, 0.1843137, 0, 1,
-1.832623, 2.130789, -0.420815, 1, 0.1921569, 0, 1,
-1.805645, 0.1506311, -0.146252, 1, 0.1960784, 0, 1,
-1.800266, -0.5362615, -2.817572, 1, 0.2039216, 0, 1,
-1.775606, 1.584302, 0.05739559, 1, 0.2117647, 0, 1,
-1.773613, 1.910425, -1.525879, 1, 0.2156863, 0, 1,
-1.771205, 0.6328379, -2.305417, 1, 0.2235294, 0, 1,
-1.76075, -1.562558, -3.697567, 1, 0.227451, 0, 1,
-1.760639, 0.1727575, -2.333734, 1, 0.2352941, 0, 1,
-1.752571, -2.286719, -1.728677, 1, 0.2392157, 0, 1,
-1.748797, -0.355315, -1.823136, 1, 0.2470588, 0, 1,
-1.742109, 0.1379315, -1.014374, 1, 0.2509804, 0, 1,
-1.729657, -1.664056, -0.4026189, 1, 0.2588235, 0, 1,
-1.72272, -0.1240158, -1.185735, 1, 0.2627451, 0, 1,
-1.699029, 0.3196893, -1.520531, 1, 0.2705882, 0, 1,
-1.695628, 1.351399, -3.74105, 1, 0.2745098, 0, 1,
-1.691547, 0.3234789, -1.48939, 1, 0.282353, 0, 1,
-1.664679, 0.5673235, -1.994072, 1, 0.2862745, 0, 1,
-1.659213, 0.5146164, 0.3024465, 1, 0.2941177, 0, 1,
-1.653168, 0.6883243, -0.5274057, 1, 0.3019608, 0, 1,
-1.64448, -0.02128936, 0.2561209, 1, 0.3058824, 0, 1,
-1.634363, 0.1575608, -3.655761, 1, 0.3137255, 0, 1,
-1.625547, -0.1622756, -1.946175, 1, 0.3176471, 0, 1,
-1.617083, -0.4885388, -2.292828, 1, 0.3254902, 0, 1,
-1.613718, 0.543889, -1.694819, 1, 0.3294118, 0, 1,
-1.613266, -1.4672, -2.575305, 1, 0.3372549, 0, 1,
-1.607315, 0.3291614, -0.1529665, 1, 0.3411765, 0, 1,
-1.598727, -1.306522, -3.872391, 1, 0.3490196, 0, 1,
-1.597412, 1.02962, -1.126977, 1, 0.3529412, 0, 1,
-1.588949, 0.5148636, -1.199292, 1, 0.3607843, 0, 1,
-1.574494, -0.5756686, -2.610995, 1, 0.3647059, 0, 1,
-1.565448, -0.9294403, -1.218385, 1, 0.372549, 0, 1,
-1.556382, -0.6137534, -3.658327, 1, 0.3764706, 0, 1,
-1.554656, 0.06815958, -0.6642482, 1, 0.3843137, 0, 1,
-1.554316, -0.312175, -0.9640786, 1, 0.3882353, 0, 1,
-1.550116, -0.6860116, -3.553156, 1, 0.3960784, 0, 1,
-1.541224, -0.5415878, -2.782865, 1, 0.4039216, 0, 1,
-1.531273, -0.1936277, -0.5665371, 1, 0.4078431, 0, 1,
-1.523611, -0.8542287, -3.168024, 1, 0.4156863, 0, 1,
-1.522411, -0.1424597, -1.849744, 1, 0.4196078, 0, 1,
-1.497675, 0.1448652, 0.7861662, 1, 0.427451, 0, 1,
-1.496187, 0.6776669, -1.027246, 1, 0.4313726, 0, 1,
-1.495376, 1.974203, -0.7951581, 1, 0.4392157, 0, 1,
-1.491478, 0.7400112, 0.01337843, 1, 0.4431373, 0, 1,
-1.479437, 0.1444293, -0.6779981, 1, 0.4509804, 0, 1,
-1.478512, -0.5942751, -2.638065, 1, 0.454902, 0, 1,
-1.467454, -0.2642314, -0.07830297, 1, 0.4627451, 0, 1,
-1.454263, 0.3416115, -2.476257, 1, 0.4666667, 0, 1,
-1.444097, -0.3552477, -2.161761, 1, 0.4745098, 0, 1,
-1.440213, -1.244552, -3.178011, 1, 0.4784314, 0, 1,
-1.432155, -0.128378, -2.039104, 1, 0.4862745, 0, 1,
-1.425077, 1.125307, 0.349481, 1, 0.4901961, 0, 1,
-1.421332, 0.8564202, -0.5212368, 1, 0.4980392, 0, 1,
-1.410594, -0.4204867, -0.541922, 1, 0.5058824, 0, 1,
-1.408149, 0.1029506, -1.302924, 1, 0.509804, 0, 1,
-1.40514, -0.03373576, 0.4346241, 1, 0.5176471, 0, 1,
-1.404917, -0.6839522, -1.923486, 1, 0.5215687, 0, 1,
-1.40296, -1.383491, -2.126712, 1, 0.5294118, 0, 1,
-1.395598, 0.9083037, -1.824462, 1, 0.5333334, 0, 1,
-1.38749, 0.9024549, -0.4296625, 1, 0.5411765, 0, 1,
-1.370903, 0.9871884, -0.5500236, 1, 0.5450981, 0, 1,
-1.365278, 0.03585436, -0.179211, 1, 0.5529412, 0, 1,
-1.357424, 0.5166386, -0.1551143, 1, 0.5568628, 0, 1,
-1.350966, 0.1974378, -1.236369, 1, 0.5647059, 0, 1,
-1.3497, 0.3272678, -1.856439, 1, 0.5686275, 0, 1,
-1.342876, -1.076457, -1.350843, 1, 0.5764706, 0, 1,
-1.342466, 0.7032495, 0.02152097, 1, 0.5803922, 0, 1,
-1.339221, 0.8650708, -1.460591, 1, 0.5882353, 0, 1,
-1.333175, -0.07377357, -1.032008, 1, 0.5921569, 0, 1,
-1.331498, 2.020837, -1.642079, 1, 0.6, 0, 1,
-1.326885, -1.356479, -2.584868, 1, 0.6078432, 0, 1,
-1.326838, 0.00299305, -1.521108, 1, 0.6117647, 0, 1,
-1.322792, -1.24385, -2.594014, 1, 0.6196079, 0, 1,
-1.310037, 0.8102444, -1.746094, 1, 0.6235294, 0, 1,
-1.309916, 0.1010739, -0.6928249, 1, 0.6313726, 0, 1,
-1.307095, -1.211374, -2.070711, 1, 0.6352941, 0, 1,
-1.305271, 1.570594, -1.103641, 1, 0.6431373, 0, 1,
-1.302397, 0.1685882, -2.266245, 1, 0.6470588, 0, 1,
-1.295645, -0.5795426, -2.17288, 1, 0.654902, 0, 1,
-1.293159, -0.3286585, -1.394329, 1, 0.6588235, 0, 1,
-1.28407, 0.2698838, -1.696443, 1, 0.6666667, 0, 1,
-1.279334, 0.8829696, -1.094791, 1, 0.6705883, 0, 1,
-1.270297, -0.358826, -2.843578, 1, 0.6784314, 0, 1,
-1.267355, -0.8484871, -1.41611, 1, 0.682353, 0, 1,
-1.256718, 0.03188939, -3.50189, 1, 0.6901961, 0, 1,
-1.252532, 0.2124631, -0.6989987, 1, 0.6941177, 0, 1,
-1.2471, 0.01733907, -0.9252509, 1, 0.7019608, 0, 1,
-1.235788, -0.7325875, 0.0009937023, 1, 0.7098039, 0, 1,
-1.233205, -0.7611483, -2.536686, 1, 0.7137255, 0, 1,
-1.232654, 0.3380542, -2.542694, 1, 0.7215686, 0, 1,
-1.223522, 1.467799, 1.226566, 1, 0.7254902, 0, 1,
-1.215322, -0.1961048, -3.187023, 1, 0.7333333, 0, 1,
-1.210909, 0.09921462, -0.5164, 1, 0.7372549, 0, 1,
-1.202331, -0.2197207, -0.9019151, 1, 0.7450981, 0, 1,
-1.200984, 0.6375188, -1.361961, 1, 0.7490196, 0, 1,
-1.19783, -0.09034695, -4.304114, 1, 0.7568628, 0, 1,
-1.19614, -2.18651, -2.173433, 1, 0.7607843, 0, 1,
-1.194926, -0.5135446, -1.418359, 1, 0.7686275, 0, 1,
-1.188396, -0.3086966, -2.360775, 1, 0.772549, 0, 1,
-1.187151, 2.312182, 2.035725, 1, 0.7803922, 0, 1,
-1.179236, -0.2417006, -1.753516, 1, 0.7843137, 0, 1,
-1.179232, 0.05475416, -0.5408995, 1, 0.7921569, 0, 1,
-1.178949, 1.641627, 0.09669126, 1, 0.7960784, 0, 1,
-1.178909, -1.352155, -3.263112, 1, 0.8039216, 0, 1,
-1.174597, -0.1293409, -2.57914, 1, 0.8117647, 0, 1,
-1.169902, 0.5814772, 0.01403075, 1, 0.8156863, 0, 1,
-1.167431, 1.316468, -0.3684857, 1, 0.8235294, 0, 1,
-1.16692, -0.01865525, -0.409046, 1, 0.827451, 0, 1,
-1.141711, -0.129306, -3.014571, 1, 0.8352941, 0, 1,
-1.132534, -0.8247818, -3.61283, 1, 0.8392157, 0, 1,
-1.13191, -0.1062294, -0.7822902, 1, 0.8470588, 0, 1,
-1.130126, 0.1517756, 0.2987978, 1, 0.8509804, 0, 1,
-1.124348, 0.7299137, -1.680673, 1, 0.8588235, 0, 1,
-1.118126, -0.7634156, -0.9710032, 1, 0.8627451, 0, 1,
-1.112204, -1.026478, -3.104435, 1, 0.8705882, 0, 1,
-1.111212, 0.2202486, -1.549105, 1, 0.8745098, 0, 1,
-1.101024, -0.02064297, -2.363864, 1, 0.8823529, 0, 1,
-1.099318, 0.8661824, 0.2972478, 1, 0.8862745, 0, 1,
-1.096587, -0.6996562, -3.948904, 1, 0.8941177, 0, 1,
-1.094033, -1.596368, -0.3593899, 1, 0.8980392, 0, 1,
-1.091582, 0.2661836, -0.6340669, 1, 0.9058824, 0, 1,
-1.090889, 1.818183, -2.642297, 1, 0.9137255, 0, 1,
-1.084686, -0.9019008, -1.456796, 1, 0.9176471, 0, 1,
-1.073641, 1.879485, 0.4845316, 1, 0.9254902, 0, 1,
-1.069664, -0.3465538, -2.673578, 1, 0.9294118, 0, 1,
-1.066752, 1.605641, -0.008569933, 1, 0.9372549, 0, 1,
-1.059937, 1.694775, 0.9938805, 1, 0.9411765, 0, 1,
-1.05523, -0.1797116, -2.612694, 1, 0.9490196, 0, 1,
-1.051419, 0.701538, 0.6396384, 1, 0.9529412, 0, 1,
-1.049132, 0.09002852, -1.286617, 1, 0.9607843, 0, 1,
-1.047662, 0.8212255, -0.7145182, 1, 0.9647059, 0, 1,
-1.047259, 0.9878435, 0.09231044, 1, 0.972549, 0, 1,
-1.044406, 1.039044, -0.08584686, 1, 0.9764706, 0, 1,
-1.044007, -0.5426676, -2.698449, 1, 0.9843137, 0, 1,
-1.03651, 0.4021218, -1.908182, 1, 0.9882353, 0, 1,
-1.03525, 1.705121, -0.7248479, 1, 0.9960784, 0, 1,
-1.03463, -1.535209, -1.428395, 0.9960784, 1, 0, 1,
-1.011788, 0.9176527, -0.7182233, 0.9921569, 1, 0, 1,
-1.010937, -0.6499389, -4.190051, 0.9843137, 1, 0, 1,
-1.007156, 0.6142815, -3.232132, 0.9803922, 1, 0, 1,
-1.004963, -0.4684127, -2.241015, 0.972549, 1, 0, 1,
-1.003872, -1.773803, -3.320709, 0.9686275, 1, 0, 1,
-1.003676, -0.3712672, -1.934446, 0.9607843, 1, 0, 1,
-1.002983, -0.1387154, -3.269669, 0.9568627, 1, 0, 1,
-0.9956566, 0.9635596, -1.4059, 0.9490196, 1, 0, 1,
-0.993762, -1.364972, -1.942069, 0.945098, 1, 0, 1,
-0.9911452, 0.5444522, -0.2449705, 0.9372549, 1, 0, 1,
-0.9885345, 0.4903514, -0.1174086, 0.9333333, 1, 0, 1,
-0.9866359, 0.1741957, -0.538558, 0.9254902, 1, 0, 1,
-0.98594, 1.892187, -1.106229, 0.9215686, 1, 0, 1,
-0.9830669, 0.2206082, -0.3172007, 0.9137255, 1, 0, 1,
-0.9745222, -1.552885, -2.80296, 0.9098039, 1, 0, 1,
-0.9734451, -0.8494678, -1.467478, 0.9019608, 1, 0, 1,
-0.9732614, -0.8422382, -3.22341, 0.8941177, 1, 0, 1,
-0.9682281, 0.887299, -1.840994, 0.8901961, 1, 0, 1,
-0.9681226, 0.8682163, -2.903538, 0.8823529, 1, 0, 1,
-0.95408, 0.1568055, -0.8772926, 0.8784314, 1, 0, 1,
-0.9512187, -1.090177, -3.511437, 0.8705882, 1, 0, 1,
-0.9334456, -0.6276692, -2.31755, 0.8666667, 1, 0, 1,
-0.932396, -0.9979812, -3.060072, 0.8588235, 1, 0, 1,
-0.9303091, 1.231955, -0.1654058, 0.854902, 1, 0, 1,
-0.9272107, -0.5106638, -2.860291, 0.8470588, 1, 0, 1,
-0.9250513, 1.127717, -1.653359, 0.8431373, 1, 0, 1,
-0.9233985, -0.6865553, -4.264668, 0.8352941, 1, 0, 1,
-0.913843, 0.8505197, -1.556967, 0.8313726, 1, 0, 1,
-0.9124529, -0.8375065, -3.168449, 0.8235294, 1, 0, 1,
-0.9085479, 0.2032115, -0.5030022, 0.8196079, 1, 0, 1,
-0.9072255, -0.3880062, 0.6206232, 0.8117647, 1, 0, 1,
-0.9072139, 1.067513, -1.512914, 0.8078431, 1, 0, 1,
-0.9070376, -0.4551595, -1.569172, 0.8, 1, 0, 1,
-0.9069599, -0.6916128, -3.899802, 0.7921569, 1, 0, 1,
-0.906546, -1.265432, 0.147561, 0.7882353, 1, 0, 1,
-0.9023032, 1.411634, -1.170495, 0.7803922, 1, 0, 1,
-0.8962424, 0.974875, -0.5351762, 0.7764706, 1, 0, 1,
-0.8930993, -0.2316024, -3.088139, 0.7686275, 1, 0, 1,
-0.8922876, 0.8236851, -1.34643, 0.7647059, 1, 0, 1,
-0.8866906, -0.6995687, -0.4523625, 0.7568628, 1, 0, 1,
-0.8707181, 2.179084, 1.14691, 0.7529412, 1, 0, 1,
-0.8684532, 0.2338307, -2.094229, 0.7450981, 1, 0, 1,
-0.8634089, 0.4370157, -0.7562616, 0.7411765, 1, 0, 1,
-0.8502614, 0.8741319, 1.350543, 0.7333333, 1, 0, 1,
-0.8423692, 0.2396179, -1.357146, 0.7294118, 1, 0, 1,
-0.8388937, -1.20336, -2.87171, 0.7215686, 1, 0, 1,
-0.8348039, 1.767397, -0.009640296, 0.7176471, 1, 0, 1,
-0.8304915, 0.3482007, -0.464574, 0.7098039, 1, 0, 1,
-0.8280141, -0.06811664, -0.6903252, 0.7058824, 1, 0, 1,
-0.8259372, 1.548251, -1.247761, 0.6980392, 1, 0, 1,
-0.8229398, 1.286045, 1.004573, 0.6901961, 1, 0, 1,
-0.8222091, 1.910023, -1.355512, 0.6862745, 1, 0, 1,
-0.8172649, -0.1359309, -2.734016, 0.6784314, 1, 0, 1,
-0.8148888, 0.3090099, -1.179588, 0.6745098, 1, 0, 1,
-0.8108952, -0.9090078, -0.2074498, 0.6666667, 1, 0, 1,
-0.8031821, 0.5544856, 0.03803058, 0.6627451, 1, 0, 1,
-0.8031503, -1.736038, -3.049783, 0.654902, 1, 0, 1,
-0.7928154, -0.5530419, -1.861747, 0.6509804, 1, 0, 1,
-0.7926758, -1.861923, -3.490477, 0.6431373, 1, 0, 1,
-0.7893382, -0.4310221, -2.366539, 0.6392157, 1, 0, 1,
-0.7855185, -1.360555, -1.946888, 0.6313726, 1, 0, 1,
-0.7688807, 2.513837, -0.2625244, 0.627451, 1, 0, 1,
-0.7679854, -0.6795884, -2.76355, 0.6196079, 1, 0, 1,
-0.7572992, -0.1491146, -3.351, 0.6156863, 1, 0, 1,
-0.7557176, -2.808426, -3.546567, 0.6078432, 1, 0, 1,
-0.7555504, 2.910334, -2.574203, 0.6039216, 1, 0, 1,
-0.7472039, -0.5237167, -1.926629, 0.5960785, 1, 0, 1,
-0.7440594, 0.4392824, -1.209511, 0.5882353, 1, 0, 1,
-0.7433475, 0.6793697, -1.773853, 0.5843138, 1, 0, 1,
-0.7394904, -1.470804, -1.324379, 0.5764706, 1, 0, 1,
-0.7376043, 0.4039137, -0.711164, 0.572549, 1, 0, 1,
-0.7354198, -1.900801, -1.792398, 0.5647059, 1, 0, 1,
-0.7316294, 0.6260677, -0.3992726, 0.5607843, 1, 0, 1,
-0.7284392, 1.200914, 1.202137, 0.5529412, 1, 0, 1,
-0.7244632, -0.805201, -3.286318, 0.5490196, 1, 0, 1,
-0.7237697, 0.1597665, -1.50174, 0.5411765, 1, 0, 1,
-0.7142763, -1.300175, -2.793254, 0.5372549, 1, 0, 1,
-0.709955, 1.674735, -0.6056817, 0.5294118, 1, 0, 1,
-0.7098284, -0.9840101, -1.243989, 0.5254902, 1, 0, 1,
-0.7091312, 0.532585, 0.6780176, 0.5176471, 1, 0, 1,
-0.6979458, -1.179742, -3.218006, 0.5137255, 1, 0, 1,
-0.6932194, 0.868865, 0.3316303, 0.5058824, 1, 0, 1,
-0.6908913, 0.9928154, -0.3224339, 0.5019608, 1, 0, 1,
-0.6887436, 1.010178, 0.0418645, 0.4941176, 1, 0, 1,
-0.6830609, -0.6685227, -2.497157, 0.4862745, 1, 0, 1,
-0.6799296, 1.570364, -0.4049883, 0.4823529, 1, 0, 1,
-0.6760569, 0.151523, -1.046872, 0.4745098, 1, 0, 1,
-0.6752659, 0.9582938, -1.934432, 0.4705882, 1, 0, 1,
-0.6741292, 0.3801845, -1.560798, 0.4627451, 1, 0, 1,
-0.6680115, 0.6500556, -0.6192079, 0.4588235, 1, 0, 1,
-0.6660066, -0.7764147, -2.104991, 0.4509804, 1, 0, 1,
-0.6639456, -0.07700587, -3.754958, 0.4470588, 1, 0, 1,
-0.663, 0.2229512, 0.2528351, 0.4392157, 1, 0, 1,
-0.6575341, -0.2658956, -1.620515, 0.4352941, 1, 0, 1,
-0.6502442, -0.3745473, -1.510801, 0.427451, 1, 0, 1,
-0.6494359, 2.19805, -0.3934353, 0.4235294, 1, 0, 1,
-0.6423569, -0.4536233, -1.878177, 0.4156863, 1, 0, 1,
-0.6420829, -1.491586, -2.539851, 0.4117647, 1, 0, 1,
-0.6373889, -0.9696807, -3.818086, 0.4039216, 1, 0, 1,
-0.6321487, -1.273762, -2.306185, 0.3960784, 1, 0, 1,
-0.6320667, 0.7332698, -2.595109, 0.3921569, 1, 0, 1,
-0.6317125, -0.1908782, -0.81484, 0.3843137, 1, 0, 1,
-0.630482, -0.2150159, -2.883285, 0.3803922, 1, 0, 1,
-0.6293588, 0.696844, -0.2237364, 0.372549, 1, 0, 1,
-0.6285294, 0.3978438, -2.70192, 0.3686275, 1, 0, 1,
-0.6269968, -1.276494, -2.657896, 0.3607843, 1, 0, 1,
-0.6254659, 1.617872, 0.9334945, 0.3568628, 1, 0, 1,
-0.6245094, 0.003875562, -2.080124, 0.3490196, 1, 0, 1,
-0.6188166, -0.5241964, -1.647162, 0.345098, 1, 0, 1,
-0.6105346, -0.220872, -2.122753, 0.3372549, 1, 0, 1,
-0.6098934, -1.546849, -2.293249, 0.3333333, 1, 0, 1,
-0.6095918, 0.2630573, -2.390132, 0.3254902, 1, 0, 1,
-0.6086209, -0.09221926, -2.474622, 0.3215686, 1, 0, 1,
-0.6068686, -1.383853, -2.466389, 0.3137255, 1, 0, 1,
-0.6038768, 0.7432138, -0.3365264, 0.3098039, 1, 0, 1,
-0.6020176, -1.175543, -2.117442, 0.3019608, 1, 0, 1,
-0.5954952, -0.6312668, -4.332963, 0.2941177, 1, 0, 1,
-0.5934034, -0.03369977, -0.2375398, 0.2901961, 1, 0, 1,
-0.5916501, 1.74831, -1.518624, 0.282353, 1, 0, 1,
-0.5870903, -0.2295766, -1.601429, 0.2784314, 1, 0, 1,
-0.5870283, -0.5411624, -1.919979, 0.2705882, 1, 0, 1,
-0.5854118, 0.4657839, -0.8782277, 0.2666667, 1, 0, 1,
-0.5821601, 0.0921889, -0.9481333, 0.2588235, 1, 0, 1,
-0.5811484, -1.654888, -4.608358, 0.254902, 1, 0, 1,
-0.5788367, -1.131617, -3.969853, 0.2470588, 1, 0, 1,
-0.5757216, -0.02167174, -1.070475, 0.2431373, 1, 0, 1,
-0.5739203, 0.2644729, -0.1610665, 0.2352941, 1, 0, 1,
-0.5734111, 2.018763, 1.259769, 0.2313726, 1, 0, 1,
-0.5728371, -0.6189864, -2.948646, 0.2235294, 1, 0, 1,
-0.572455, 0.7662312, -0.9799938, 0.2196078, 1, 0, 1,
-0.5689494, 1.806403, -0.9500918, 0.2117647, 1, 0, 1,
-0.5672655, -1.858268, -3.432274, 0.2078431, 1, 0, 1,
-0.5652297, -0.05223539, -2.964416, 0.2, 1, 0, 1,
-0.564033, -0.8512108, -3.802425, 0.1921569, 1, 0, 1,
-0.5537357, -0.03126695, -2.335451, 0.1882353, 1, 0, 1,
-0.5464172, -1.380893, -2.548967, 0.1803922, 1, 0, 1,
-0.5459011, -0.1558712, -2.179743, 0.1764706, 1, 0, 1,
-0.5435233, -0.3801781, -2.096004, 0.1686275, 1, 0, 1,
-0.5429748, 1.472175, 0.2510772, 0.1647059, 1, 0, 1,
-0.5420796, -1.092077, -3.131083, 0.1568628, 1, 0, 1,
-0.5363688, 1.288722, -1.17627, 0.1529412, 1, 0, 1,
-0.5320941, 2.589362, 0.5562675, 0.145098, 1, 0, 1,
-0.53203, -1.668244, -2.870908, 0.1411765, 1, 0, 1,
-0.5304252, -1.017667, -1.716762, 0.1333333, 1, 0, 1,
-0.5176594, 0.7771087, -1.20969, 0.1294118, 1, 0, 1,
-0.5158259, -1.345695, -4.164619, 0.1215686, 1, 0, 1,
-0.5140407, -1.149698, -1.029005, 0.1176471, 1, 0, 1,
-0.5135334, -0.4754829, -2.349066, 0.1098039, 1, 0, 1,
-0.5113403, 0.003476039, -0.07902714, 0.1058824, 1, 0, 1,
-0.5101365, 0.4945665, 0.1855727, 0.09803922, 1, 0, 1,
-0.5039129, 1.017494, -0.2273613, 0.09019608, 1, 0, 1,
-0.5018758, 0.006054126, 0.2854535, 0.08627451, 1, 0, 1,
-0.5002876, 0.4254357, -1.488711, 0.07843138, 1, 0, 1,
-0.4983828, 0.4787749, 0.1489766, 0.07450981, 1, 0, 1,
-0.4956721, -0.240669, -2.791656, 0.06666667, 1, 0, 1,
-0.494703, 0.9481723, -0.376645, 0.0627451, 1, 0, 1,
-0.4924588, -0.5727262, -4.256311, 0.05490196, 1, 0, 1,
-0.4913054, -0.8724402, -3.60199, 0.05098039, 1, 0, 1,
-0.4902364, 1.370095, -0.7836508, 0.04313726, 1, 0, 1,
-0.4849813, 0.05339415, -2.073982, 0.03921569, 1, 0, 1,
-0.4840067, 0.3599911, 0.1619736, 0.03137255, 1, 0, 1,
-0.4838062, 0.5821105, -1.749525, 0.02745098, 1, 0, 1,
-0.4828542, 3.19026, -1.688964, 0.01960784, 1, 0, 1,
-0.4812401, 0.4637713, -0.6833594, 0.01568628, 1, 0, 1,
-0.4798104, 0.4349005, -1.124907, 0.007843138, 1, 0, 1,
-0.4787562, -0.1618027, -2.789178, 0.003921569, 1, 0, 1,
-0.4787268, 0.8038204, -2.261876, 0, 1, 0.003921569, 1,
-0.462395, -0.3621388, -4.201477, 0, 1, 0.01176471, 1,
-0.4618055, -0.04139713, -2.410124, 0, 1, 0.01568628, 1,
-0.4610822, -0.5681604, -1.33281, 0, 1, 0.02352941, 1,
-0.4557061, -0.1567334, -3.090191, 0, 1, 0.02745098, 1,
-0.4542865, 1.091217, -2.466429, 0, 1, 0.03529412, 1,
-0.4480675, -0.2508758, -2.194739, 0, 1, 0.03921569, 1,
-0.4473796, -0.7265591, -2.495976, 0, 1, 0.04705882, 1,
-0.4466621, 0.9968001, 0.8858704, 0, 1, 0.05098039, 1,
-0.4462605, -1.986241, -3.897979, 0, 1, 0.05882353, 1,
-0.4453744, -1.10303, -3.931931, 0, 1, 0.0627451, 1,
-0.4421257, -0.01817424, -3.013717, 0, 1, 0.07058824, 1,
-0.4415343, 0.2863317, -0.4770461, 0, 1, 0.07450981, 1,
-0.4413885, -1.496923, -3.16076, 0, 1, 0.08235294, 1,
-0.4355345, 1.116947, -0.7084846, 0, 1, 0.08627451, 1,
-0.4351931, 0.4638077, -0.7668706, 0, 1, 0.09411765, 1,
-0.4290555, 0.6755904, -1.108069, 0, 1, 0.1019608, 1,
-0.4260031, 0.1624895, -1.456588, 0, 1, 0.1058824, 1,
-0.422603, 1.074163, -2.047371, 0, 1, 0.1137255, 1,
-0.4215478, 0.8687644, -0.2363857, 0, 1, 0.1176471, 1,
-0.4192146, 0.2778809, 0.87921, 0, 1, 0.1254902, 1,
-0.4184785, 0.9503717, 0.4753554, 0, 1, 0.1294118, 1,
-0.4159205, -1.328923, -2.46608, 0, 1, 0.1372549, 1,
-0.4152913, -0.4975411, -3.227504, 0, 1, 0.1411765, 1,
-0.4139428, 0.1397624, -1.579856, 0, 1, 0.1490196, 1,
-0.4082688, -1.535798, -1.867798, 0, 1, 0.1529412, 1,
-0.4038558, 0.1535355, -2.908076, 0, 1, 0.1607843, 1,
-0.4012043, 0.794872, -0.07988149, 0, 1, 0.1647059, 1,
-0.3893674, 0.5519183, -2.549533, 0, 1, 0.172549, 1,
-0.380987, -0.1594905, -1.841584, 0, 1, 0.1764706, 1,
-0.3758164, -0.2061475, -2.352091, 0, 1, 0.1843137, 1,
-0.371391, 0.06712305, -2.89176, 0, 1, 0.1882353, 1,
-0.3677762, -1.009667, -1.913125, 0, 1, 0.1960784, 1,
-0.3656882, 1.297012, 0.08640081, 0, 1, 0.2039216, 1,
-0.3654571, -0.285091, -2.450424, 0, 1, 0.2078431, 1,
-0.3631602, -1.844043, -2.015014, 0, 1, 0.2156863, 1,
-0.3601226, 0.6393642, 1.28211, 0, 1, 0.2196078, 1,
-0.3587592, 0.8280885, -0.7374794, 0, 1, 0.227451, 1,
-0.3566664, 0.498438, -1.690512, 0, 1, 0.2313726, 1,
-0.3558549, -0.5338764, -1.26609, 0, 1, 0.2392157, 1,
-0.354404, -1.17893, -3.620296, 0, 1, 0.2431373, 1,
-0.3532142, 1.309156, 0.2845536, 0, 1, 0.2509804, 1,
-0.352228, -1.638518, -3.899453, 0, 1, 0.254902, 1,
-0.3367677, -0.7068402, -3.310525, 0, 1, 0.2627451, 1,
-0.3359108, -0.2299497, -2.187855, 0, 1, 0.2666667, 1,
-0.3336228, 0.5732006, -0.6544752, 0, 1, 0.2745098, 1,
-0.3333058, -0.3082103, -0.1999373, 0, 1, 0.2784314, 1,
-0.3298464, 0.8431468, 0.07213835, 0, 1, 0.2862745, 1,
-0.3258795, -0.225904, -1.609508, 0, 1, 0.2901961, 1,
-0.3240067, 1.210752, 0.241372, 0, 1, 0.2980392, 1,
-0.3217547, 0.2187405, -0.908525, 0, 1, 0.3058824, 1,
-0.3197479, 0.3708578, -0.9517684, 0, 1, 0.3098039, 1,
-0.3194779, 0.5447986, 1.617912, 0, 1, 0.3176471, 1,
-0.3077387, 1.803186, -1.209056, 0, 1, 0.3215686, 1,
-0.3040927, -0.825645, -1.850559, 0, 1, 0.3294118, 1,
-0.3034961, -0.575286, -3.214373, 0, 1, 0.3333333, 1,
-0.3029751, -1.512621, -5.182709, 0, 1, 0.3411765, 1,
-0.3006975, -0.1619585, -0.1356657, 0, 1, 0.345098, 1,
-0.298536, 0.4347824, 0.974837, 0, 1, 0.3529412, 1,
-0.291871, 0.6566954, 0.9244831, 0, 1, 0.3568628, 1,
-0.2886116, -0.825555, -3.859283, 0, 1, 0.3647059, 1,
-0.2844827, -0.6542343, -2.585438, 0, 1, 0.3686275, 1,
-0.2837468, -1.577672, -3.235698, 0, 1, 0.3764706, 1,
-0.2808811, 0.1369928, -2.48288, 0, 1, 0.3803922, 1,
-0.2718668, -0.433657, -3.704399, 0, 1, 0.3882353, 1,
-0.2696285, -0.7280257, -2.980654, 0, 1, 0.3921569, 1,
-0.2694632, -0.340704, -1.076435, 0, 1, 0.4, 1,
-0.2666419, -1.374061, -3.372851, 0, 1, 0.4078431, 1,
-0.2663601, -0.1324497, -2.231115, 0, 1, 0.4117647, 1,
-0.2653117, -0.1668115, -1.912535, 0, 1, 0.4196078, 1,
-0.2646886, -0.06432693, -2.510818, 0, 1, 0.4235294, 1,
-0.2646833, 0.9523953, -1.22646, 0, 1, 0.4313726, 1,
-0.2645043, -0.4392195, -2.06465, 0, 1, 0.4352941, 1,
-0.2640769, -0.08739001, -2.516912, 0, 1, 0.4431373, 1,
-0.2628729, -0.1841029, -2.981441, 0, 1, 0.4470588, 1,
-0.2618863, 0.4789381, -1.114289, 0, 1, 0.454902, 1,
-0.2582048, -1.72037, -2.815857, 0, 1, 0.4588235, 1,
-0.2564857, -0.2982345, -1.718006, 0, 1, 0.4666667, 1,
-0.2555581, 1.023572, -0.186008, 0, 1, 0.4705882, 1,
-0.253642, -1.44368, -3.884659, 0, 1, 0.4784314, 1,
-0.2535304, 0.4077711, -0.8960463, 0, 1, 0.4823529, 1,
-0.2529816, -0.05977708, -0.8822749, 0, 1, 0.4901961, 1,
-0.2495229, 0.3981007, 0.2308383, 0, 1, 0.4941176, 1,
-0.248261, -0.2378767, -3.582863, 0, 1, 0.5019608, 1,
-0.2472987, -2.083364, -2.735858, 0, 1, 0.509804, 1,
-0.2458639, 0.9923, -0.1378234, 0, 1, 0.5137255, 1,
-0.2409585, -0.4856922, -1.71292, 0, 1, 0.5215687, 1,
-0.2340015, -0.3640056, -2.713234, 0, 1, 0.5254902, 1,
-0.2321436, -0.4453731, -1.094894, 0, 1, 0.5333334, 1,
-0.2315244, -1.13418, -5.578713, 0, 1, 0.5372549, 1,
-0.2279723, 1.367673, -1.848935, 0, 1, 0.5450981, 1,
-0.2273106, -0.3507053, -1.122899, 0, 1, 0.5490196, 1,
-0.2178606, 0.06037573, -2.009123, 0, 1, 0.5568628, 1,
-0.2130749, 1.371943, -0.9384935, 0, 1, 0.5607843, 1,
-0.2123842, -1.894179, -2.553717, 0, 1, 0.5686275, 1,
-0.2101187, 0.3307713, -2.371794, 0, 1, 0.572549, 1,
-0.2079305, 1.779007, -0.3536145, 0, 1, 0.5803922, 1,
-0.206803, 0.01740661, -0.701628, 0, 1, 0.5843138, 1,
-0.2065611, -1.194028, -2.202113, 0, 1, 0.5921569, 1,
-0.2057386, -1.628361, -3.180586, 0, 1, 0.5960785, 1,
-0.1983942, -0.3842011, -5.132301, 0, 1, 0.6039216, 1,
-0.1946988, -1.382641, -1.473386, 0, 1, 0.6117647, 1,
-0.1928736, 0.9936327, 0.3990561, 0, 1, 0.6156863, 1,
-0.1851599, 1.367904, -0.4921954, 0, 1, 0.6235294, 1,
-0.1821829, 1.625858, -1.169618, 0, 1, 0.627451, 1,
-0.1710984, 1.212796, -0.5417981, 0, 1, 0.6352941, 1,
-0.1708172, -1.833519, -3.839221, 0, 1, 0.6392157, 1,
-0.170107, -0.7756526, -3.810039, 0, 1, 0.6470588, 1,
-0.1668919, -0.2354042, -4.001291, 0, 1, 0.6509804, 1,
-0.1624967, 0.6041412, -1.446723, 0, 1, 0.6588235, 1,
-0.1621949, -1.54077, -3.32816, 0, 1, 0.6627451, 1,
-0.1602878, -0.765686, -2.20452, 0, 1, 0.6705883, 1,
-0.1592091, -0.5329241, -3.677716, 0, 1, 0.6745098, 1,
-0.1574636, 0.3969328, -0.04098106, 0, 1, 0.682353, 1,
-0.1555558, 1.153422, -1.518185, 0, 1, 0.6862745, 1,
-0.1522471, 0.1440662, -0.1374906, 0, 1, 0.6941177, 1,
-0.1495202, 1.546738, -1.828626, 0, 1, 0.7019608, 1,
-0.1483628, -0.2941386, -1.627267, 0, 1, 0.7058824, 1,
-0.1470663, 0.7218497, 0.7483409, 0, 1, 0.7137255, 1,
-0.1464385, 0.3458017, 0.1037145, 0, 1, 0.7176471, 1,
-0.143652, -0.02213621, -0.635328, 0, 1, 0.7254902, 1,
-0.1382002, -1.38906, -3.846592, 0, 1, 0.7294118, 1,
-0.1351364, -0.2308487, -3.372412, 0, 1, 0.7372549, 1,
-0.1337419, 1.058479, 0.1801353, 0, 1, 0.7411765, 1,
-0.1334267, 0.5965086, -0.9844136, 0, 1, 0.7490196, 1,
-0.133022, 0.0963756, -1.303096, 0, 1, 0.7529412, 1,
-0.1314077, -1.041665, -2.854941, 0, 1, 0.7607843, 1,
-0.1234068, -0.548526, -1.601239, 0, 1, 0.7647059, 1,
-0.1229808, -1.74475, -3.556154, 0, 1, 0.772549, 1,
-0.1224802, -0.2490588, -2.854711, 0, 1, 0.7764706, 1,
-0.1221295, 1.59561, 0.01799146, 0, 1, 0.7843137, 1,
-0.118457, 0.5739375, 0.7878987, 0, 1, 0.7882353, 1,
-0.1125224, 0.3506807, -0.3083118, 0, 1, 0.7960784, 1,
-0.1100746, -0.8900292, -5.387077, 0, 1, 0.8039216, 1,
-0.1053565, 0.1931605, -1.673952, 0, 1, 0.8078431, 1,
-0.1047824, -0.7664243, -3.26066, 0, 1, 0.8156863, 1,
-0.1042071, 0.09079814, -2.004288, 0, 1, 0.8196079, 1,
-0.1031014, 2.426273, -0.7847716, 0, 1, 0.827451, 1,
-0.1011111, 0.8849149, -2.463063, 0, 1, 0.8313726, 1,
-0.099635, 0.9059047, -1.145572, 0, 1, 0.8392157, 1,
-0.09855573, -1.219936, -4.894656, 0, 1, 0.8431373, 1,
-0.09439524, 0.4603507, 0.7809144, 0, 1, 0.8509804, 1,
-0.09437622, -1.067171, -2.371789, 0, 1, 0.854902, 1,
-0.09230909, -0.3909452, -4.30458, 0, 1, 0.8627451, 1,
-0.09214924, -1.491334, -2.706911, 0, 1, 0.8666667, 1,
-0.09000546, -0.8486168, -4.387179, 0, 1, 0.8745098, 1,
-0.08324257, 1.461644, 0.6134517, 0, 1, 0.8784314, 1,
-0.08254954, 0.4391559, -0.1814184, 0, 1, 0.8862745, 1,
-0.08210249, -1.562947, -2.678567, 0, 1, 0.8901961, 1,
-0.07969831, 0.9424027, -1.540475, 0, 1, 0.8980392, 1,
-0.0783905, 0.3745901, -1.158613, 0, 1, 0.9058824, 1,
-0.07420617, -1.009019, -2.273866, 0, 1, 0.9098039, 1,
-0.07338686, -0.0898554, -3.448039, 0, 1, 0.9176471, 1,
-0.07277538, -0.9215167, -3.794913, 0, 1, 0.9215686, 1,
-0.0708619, 0.5133415, -1.275633, 0, 1, 0.9294118, 1,
-0.06763013, 0.7702217, -1.258388, 0, 1, 0.9333333, 1,
-0.06226584, 0.7316146, -0.2439041, 0, 1, 0.9411765, 1,
-0.05886445, 0.2165655, 1.184358, 0, 1, 0.945098, 1,
-0.05884663, -0.7336126, -3.993964, 0, 1, 0.9529412, 1,
-0.05646913, 0.4393343, -2.053624, 0, 1, 0.9568627, 1,
-0.0564194, 0.5313812, 0.3317957, 0, 1, 0.9647059, 1,
-0.04992887, 0.4484864, -1.028792, 0, 1, 0.9686275, 1,
-0.04933181, -0.7073053, -3.703299, 0, 1, 0.9764706, 1,
-0.04901884, -0.5919799, -4.042944, 0, 1, 0.9803922, 1,
-0.04384527, -0.7042118, -2.976976, 0, 1, 0.9882353, 1,
-0.04296158, -0.4059715, -2.856527, 0, 1, 0.9921569, 1,
-0.03459886, -1.596426, -1.258566, 0, 1, 1, 1,
-0.03151558, -0.8601657, -1.903581, 0, 0.9921569, 1, 1,
-0.02095306, -1.069791, -3.006197, 0, 0.9882353, 1, 1,
-0.01662236, -1.042124, -3.27107, 0, 0.9803922, 1, 1,
-0.01622607, 0.02918988, -0.407282, 0, 0.9764706, 1, 1,
-0.01395644, 1.626393, 0.2137805, 0, 0.9686275, 1, 1,
-0.01167266, 1.32498, -0.2371409, 0, 0.9647059, 1, 1,
-0.01136131, -0.02689815, -3.383574, 0, 0.9568627, 1, 1,
-0.007148552, -0.7804739, -3.151379, 0, 0.9529412, 1, 1,
-0.005903884, -1.224046, -3.854724, 0, 0.945098, 1, 1,
-0.005269375, 1.228513, 1.510464, 0, 0.9411765, 1, 1,
-0.003564112, -1.018292, -3.589072, 0, 0.9333333, 1, 1,
-0.003486413, -0.8928921, -3.028256, 0, 0.9294118, 1, 1,
0.003439988, -1.608839, 2.52978, 0, 0.9215686, 1, 1,
0.004708578, -1.594467, 2.296138, 0, 0.9176471, 1, 1,
0.004816873, 2.552762, 0.3841684, 0, 0.9098039, 1, 1,
0.009670915, -0.2665161, 2.421948, 0, 0.9058824, 1, 1,
0.01402833, 0.3454452, -2.132904, 0, 0.8980392, 1, 1,
0.01801111, -1.707699, 2.191165, 0, 0.8901961, 1, 1,
0.01888513, 0.3490249, -0.7438822, 0, 0.8862745, 1, 1,
0.02470346, 0.7868169, 0.01059608, 0, 0.8784314, 1, 1,
0.02491341, 0.2656662, -1.077911, 0, 0.8745098, 1, 1,
0.02593997, -0.5454308, 3.462322, 0, 0.8666667, 1, 1,
0.02969291, -0.0353978, 0.9881473, 0, 0.8627451, 1, 1,
0.03056248, -0.09651275, 3.730723, 0, 0.854902, 1, 1,
0.03218971, -0.08346102, 1.924309, 0, 0.8509804, 1, 1,
0.03255681, 1.234362, 0.2455029, 0, 0.8431373, 1, 1,
0.0354646, 0.1469016, 0.251599, 0, 0.8392157, 1, 1,
0.04216371, 2.006635, 0.4925034, 0, 0.8313726, 1, 1,
0.04290779, 1.007617, -0.03204749, 0, 0.827451, 1, 1,
0.04636936, -0.3581386, 2.389792, 0, 0.8196079, 1, 1,
0.04990799, 0.3407164, 0.7026188, 0, 0.8156863, 1, 1,
0.05332984, -0.04558508, 2.537551, 0, 0.8078431, 1, 1,
0.06157363, 0.3135308, -0.1316293, 0, 0.8039216, 1, 1,
0.06204714, 0.5992581, 1.561291, 0, 0.7960784, 1, 1,
0.06218877, 0.3908071, -0.4459271, 0, 0.7882353, 1, 1,
0.06222526, -1.198643, 3.655046, 0, 0.7843137, 1, 1,
0.06645227, -0.2876118, 2.845215, 0, 0.7764706, 1, 1,
0.06667411, -0.8814305, 3.804847, 0, 0.772549, 1, 1,
0.06682242, -1.027727, 5.640489, 0, 0.7647059, 1, 1,
0.06791501, -1.158119, 2.330919, 0, 0.7607843, 1, 1,
0.06843585, 1.264348, -0.1949377, 0, 0.7529412, 1, 1,
0.07064887, 1.068122, 2.328011, 0, 0.7490196, 1, 1,
0.07287642, 0.3020094, -0.008301258, 0, 0.7411765, 1, 1,
0.07500561, -0.1141587, 2.188027, 0, 0.7372549, 1, 1,
0.07984541, 1.377427, 1.33793, 0, 0.7294118, 1, 1,
0.0877021, 0.2464946, 1.225742, 0, 0.7254902, 1, 1,
0.08812618, 1.275108, 1.176682, 0, 0.7176471, 1, 1,
0.09097831, 0.1173586, 1.406397, 0, 0.7137255, 1, 1,
0.09139435, -1.46255, 2.181844, 0, 0.7058824, 1, 1,
0.09242747, -0.1030943, 2.658449, 0, 0.6980392, 1, 1,
0.09783457, -0.04684893, 2.66613, 0, 0.6941177, 1, 1,
0.09856487, 0.524417, -0.1976362, 0, 0.6862745, 1, 1,
0.1004403, -0.7421163, 3.298447, 0, 0.682353, 1, 1,
0.1005318, -0.02931978, 0.1792876, 0, 0.6745098, 1, 1,
0.1026348, 0.3022968, -0.2649113, 0, 0.6705883, 1, 1,
0.1078269, 0.07380626, 0.4031212, 0, 0.6627451, 1, 1,
0.1095923, -0.8623725, 2.95226, 0, 0.6588235, 1, 1,
0.1119683, -0.1460032, 2.81918, 0, 0.6509804, 1, 1,
0.114805, -0.5419036, 5.481265, 0, 0.6470588, 1, 1,
0.1177127, 0.3500649, 0.219436, 0, 0.6392157, 1, 1,
0.1226057, 1.292551, -0.05726652, 0, 0.6352941, 1, 1,
0.1256534, -0.1078005, 1.347087, 0, 0.627451, 1, 1,
0.1303775, -0.04304151, 2.709747, 0, 0.6235294, 1, 1,
0.1358672, -0.7540829, 1.97155, 0, 0.6156863, 1, 1,
0.1373379, 1.453301, -0.5963539, 0, 0.6117647, 1, 1,
0.1378976, 0.33858, -0.1183705, 0, 0.6039216, 1, 1,
0.1432189, 1.407082, 1.316513, 0, 0.5960785, 1, 1,
0.1432484, -1.170513, 2.579112, 0, 0.5921569, 1, 1,
0.1454064, 0.3375152, -0.6923917, 0, 0.5843138, 1, 1,
0.1481579, 0.1163558, 1.100835, 0, 0.5803922, 1, 1,
0.1557018, -0.3153734, 4.584669, 0, 0.572549, 1, 1,
0.1562043, -0.5365378, 4.445144, 0, 0.5686275, 1, 1,
0.1608153, -0.7261214, 3.512095, 0, 0.5607843, 1, 1,
0.1658376, -2.041925, 3.590368, 0, 0.5568628, 1, 1,
0.1675149, -0.299762, 3.917803, 0, 0.5490196, 1, 1,
0.1684947, -0.1966517, 1.905901, 0, 0.5450981, 1, 1,
0.169557, -1.442695, 2.860131, 0, 0.5372549, 1, 1,
0.1745329, -1.238917, 2.838497, 0, 0.5333334, 1, 1,
0.1757433, -0.543174, 2.348015, 0, 0.5254902, 1, 1,
0.1759251, -0.1445111, 2.792403, 0, 0.5215687, 1, 1,
0.1768572, 0.889896, -1.340876, 0, 0.5137255, 1, 1,
0.1803768, 0.6196976, -0.9288892, 0, 0.509804, 1, 1,
0.1847288, 1.075083, -0.419652, 0, 0.5019608, 1, 1,
0.1934126, 0.1150888, 0.1289126, 0, 0.4941176, 1, 1,
0.1961241, -1.902839, 4.121095, 0, 0.4901961, 1, 1,
0.1966544, -2.519023, 3.376406, 0, 0.4823529, 1, 1,
0.2024112, 0.04629067, 3.437665, 0, 0.4784314, 1, 1,
0.2042981, 1.270109, 1.202214, 0, 0.4705882, 1, 1,
0.205217, 0.5637131, 1.259461, 0, 0.4666667, 1, 1,
0.2123969, 0.4334497, 2.014126, 0, 0.4588235, 1, 1,
0.2129046, 0.2404318, 1.004955, 0, 0.454902, 1, 1,
0.2155519, -0.1795644, 2.798955, 0, 0.4470588, 1, 1,
0.2181002, 0.1729237, -0.3830266, 0, 0.4431373, 1, 1,
0.2189202, 1.071466, 1.944288, 0, 0.4352941, 1, 1,
0.2206107, 1.279269, -0.266671, 0, 0.4313726, 1, 1,
0.2218522, -2.052395, 4.076237, 0, 0.4235294, 1, 1,
0.2252638, 0.5180469, -0.144385, 0, 0.4196078, 1, 1,
0.2299567, -0.01598625, 0.1487991, 0, 0.4117647, 1, 1,
0.2353798, 0.6496632, 0.5215918, 0, 0.4078431, 1, 1,
0.2369646, 0.1271555, 1.500559, 0, 0.4, 1, 1,
0.239754, -0.7318828, 4.157017, 0, 0.3921569, 1, 1,
0.240588, 0.9140667, -0.9629027, 0, 0.3882353, 1, 1,
0.24179, -0.362878, 1.961802, 0, 0.3803922, 1, 1,
0.2477194, 1.218726, -0.5841325, 0, 0.3764706, 1, 1,
0.2514059, 1.008121, -0.5754787, 0, 0.3686275, 1, 1,
0.2526511, 0.717227, -1.177892, 0, 0.3647059, 1, 1,
0.2534218, 1.42337, 0.8944671, 0, 0.3568628, 1, 1,
0.2543729, -0.1139699, 1.36155, 0, 0.3529412, 1, 1,
0.2555157, -0.3172481, 2.210474, 0, 0.345098, 1, 1,
0.2582474, 0.7564493, 0.9495357, 0, 0.3411765, 1, 1,
0.2622522, -0.3755117, 2.764305, 0, 0.3333333, 1, 1,
0.2628001, 0.851546, -1.349382, 0, 0.3294118, 1, 1,
0.26297, 0.06244479, 1.487313, 0, 0.3215686, 1, 1,
0.2657899, -0.6402869, 3.97098, 0, 0.3176471, 1, 1,
0.2663195, 0.3889964, 0.6033516, 0, 0.3098039, 1, 1,
0.2675917, 0.7131563, 1.884039, 0, 0.3058824, 1, 1,
0.2719803, -1.223757, 2.326721, 0, 0.2980392, 1, 1,
0.2736582, 0.5948655, 1.285376, 0, 0.2901961, 1, 1,
0.2753577, -0.3620693, 2.01288, 0, 0.2862745, 1, 1,
0.2758387, 0.2166968, 1.042808, 0, 0.2784314, 1, 1,
0.2768726, 0.8971807, 1.16871, 0, 0.2745098, 1, 1,
0.2770434, -1.433714, 2.883003, 0, 0.2666667, 1, 1,
0.2842676, 0.7249056, -0.9022993, 0, 0.2627451, 1, 1,
0.2858886, 0.9192016, 1.744186, 0, 0.254902, 1, 1,
0.2924518, -1.713152, 2.390536, 0, 0.2509804, 1, 1,
0.2927532, 0.04120296, 1.76398, 0, 0.2431373, 1, 1,
0.2986859, 0.8689891, 2.247073, 0, 0.2392157, 1, 1,
0.2987332, 0.7603918, 1.010177, 0, 0.2313726, 1, 1,
0.3057938, -0.8405612, 3.130806, 0, 0.227451, 1, 1,
0.3071059, 0.7318868, -0.4580411, 0, 0.2196078, 1, 1,
0.3078418, 2.181591, 1.569857, 0, 0.2156863, 1, 1,
0.310148, 0.5108234, 0.4889592, 0, 0.2078431, 1, 1,
0.3143661, -1.549643, 2.780541, 0, 0.2039216, 1, 1,
0.3152113, 1.287623, -0.02556156, 0, 0.1960784, 1, 1,
0.3166046, 1.240818, 1.113626, 0, 0.1882353, 1, 1,
0.3237626, 0.07968999, 0.7862905, 0, 0.1843137, 1, 1,
0.3239976, 0.9226408, 0.7404726, 0, 0.1764706, 1, 1,
0.3261206, -1.214741, 2.566343, 0, 0.172549, 1, 1,
0.3283217, 0.1229177, -0.06080631, 0, 0.1647059, 1, 1,
0.3294884, 0.1751274, 0.6959448, 0, 0.1607843, 1, 1,
0.3296166, -1.409765, 2.394524, 0, 0.1529412, 1, 1,
0.3316965, 0.4971557, 0.8059475, 0, 0.1490196, 1, 1,
0.3327798, 0.09681159, 0.5717601, 0, 0.1411765, 1, 1,
0.3342611, 1.011286, 0.4651457, 0, 0.1372549, 1, 1,
0.3380394, -0.4749004, 2.955917, 0, 0.1294118, 1, 1,
0.3380896, 0.1566934, 2.79328, 0, 0.1254902, 1, 1,
0.3392986, 2.117326, 0.7647714, 0, 0.1176471, 1, 1,
0.339337, 1.543225, 0.2720085, 0, 0.1137255, 1, 1,
0.3428428, 0.6409003, 0.7368193, 0, 0.1058824, 1, 1,
0.3432488, -0.9044182, 0.8712033, 0, 0.09803922, 1, 1,
0.3504478, -0.2941473, 1.444035, 0, 0.09411765, 1, 1,
0.3547883, -0.842275, 2.799909, 0, 0.08627451, 1, 1,
0.3565247, 0.6447348, -0.4874368, 0, 0.08235294, 1, 1,
0.3582069, -0.2043579, 2.224549, 0, 0.07450981, 1, 1,
0.3665018, 0.6775926, -0.06674285, 0, 0.07058824, 1, 1,
0.3695226, 0.9906396, 0.4601891, 0, 0.0627451, 1, 1,
0.3721027, -0.005720402, 2.508793, 0, 0.05882353, 1, 1,
0.3732712, -2.117957, 1.183895, 0, 0.05098039, 1, 1,
0.3736925, 0.8133028, 0.1526542, 0, 0.04705882, 1, 1,
0.3821306, -0.1941947, 3.796917, 0, 0.03921569, 1, 1,
0.3822928, 0.2544796, 1.427467, 0, 0.03529412, 1, 1,
0.3892289, 0.1203531, 2.368721, 0, 0.02745098, 1, 1,
0.3914223, 0.04161291, 1.564339, 0, 0.02352941, 1, 1,
0.4091586, 0.9206822, 0.8084019, 0, 0.01568628, 1, 1,
0.4112849, 1.097878, -0.8329281, 0, 0.01176471, 1, 1,
0.425976, -0.5590147, 2.637351, 0, 0.003921569, 1, 1,
0.4260842, -1.074374, 3.8385, 0.003921569, 0, 1, 1,
0.4267712, -0.1876422, 3.491233, 0.007843138, 0, 1, 1,
0.4290681, -0.3091819, 2.979792, 0.01568628, 0, 1, 1,
0.43001, 1.745617, 0.5202801, 0.01960784, 0, 1, 1,
0.4315535, -0.3489529, 1.327194, 0.02745098, 0, 1, 1,
0.4577399, 0.2628156, 0.160294, 0.03137255, 0, 1, 1,
0.461386, -0.4262882, 2.43615, 0.03921569, 0, 1, 1,
0.4616905, -0.2349592, 2.360587, 0.04313726, 0, 1, 1,
0.4647873, 0.1567444, 3.23978, 0.05098039, 0, 1, 1,
0.4657061, -1.896768, 4.205745, 0.05490196, 0, 1, 1,
0.47028, -3.038282, 2.405618, 0.0627451, 0, 1, 1,
0.4720175, 0.8714507, 0.3789259, 0.06666667, 0, 1, 1,
0.4723335, 0.2275544, 2.052946, 0.07450981, 0, 1, 1,
0.4773041, -0.4316869, 2.568747, 0.07843138, 0, 1, 1,
0.4825127, 1.197142, 1.682284, 0.08627451, 0, 1, 1,
0.4825863, -0.1705396, 0.5017227, 0.09019608, 0, 1, 1,
0.4833036, 1.30152, 0.3366285, 0.09803922, 0, 1, 1,
0.4862102, 0.2829901, 0.3815982, 0.1058824, 0, 1, 1,
0.4876673, -0.746231, 2.03405, 0.1098039, 0, 1, 1,
0.4908379, 0.7217597, 0.9223081, 0.1176471, 0, 1, 1,
0.4930779, -2.285302, 2.306147, 0.1215686, 0, 1, 1,
0.4989153, -2.373481, 3.362198, 0.1294118, 0, 1, 1,
0.5011213, -0.932663, 2.659363, 0.1333333, 0, 1, 1,
0.5061111, -0.1582732, 0.615334, 0.1411765, 0, 1, 1,
0.5076742, -1.260196, 2.525321, 0.145098, 0, 1, 1,
0.5079602, 1.432598, 0.7208501, 0.1529412, 0, 1, 1,
0.5115532, 0.8355113, 0.154945, 0.1568628, 0, 1, 1,
0.5141522, 1.574974, 0.2989953, 0.1647059, 0, 1, 1,
0.5176381, -0.07177558, 2.903056, 0.1686275, 0, 1, 1,
0.5216008, -0.3908359, 3.634316, 0.1764706, 0, 1, 1,
0.5227389, -0.2829754, 1.482219, 0.1803922, 0, 1, 1,
0.5231554, -2.210274, 2.137181, 0.1882353, 0, 1, 1,
0.5255502, -0.2606664, 0.7568763, 0.1921569, 0, 1, 1,
0.5282795, -0.483466, 3.958434, 0.2, 0, 1, 1,
0.534382, -0.2514518, 4.006773, 0.2078431, 0, 1, 1,
0.5382004, 0.9066954, -0.4222841, 0.2117647, 0, 1, 1,
0.5414109, -1.188937, 2.321206, 0.2196078, 0, 1, 1,
0.5425444, -0.3058959, 1.316566, 0.2235294, 0, 1, 1,
0.5429849, -0.7456995, 4.94192, 0.2313726, 0, 1, 1,
0.544516, 0.03244784, 0.9034233, 0.2352941, 0, 1, 1,
0.5464221, -1.202598, 4.544934, 0.2431373, 0, 1, 1,
0.5467302, -1.913203, 4.073954, 0.2470588, 0, 1, 1,
0.5498585, -0.7731165, 2.841913, 0.254902, 0, 1, 1,
0.5530013, -1.207677, 4.060806, 0.2588235, 0, 1, 1,
0.5530447, 0.5376975, 0.5378937, 0.2666667, 0, 1, 1,
0.5538526, 0.4002644, -0.3059115, 0.2705882, 0, 1, 1,
0.5554658, 1.512313, 0.3025231, 0.2784314, 0, 1, 1,
0.5569288, -1.271701, 2.903569, 0.282353, 0, 1, 1,
0.5570554, -1.309174, 3.444477, 0.2901961, 0, 1, 1,
0.5579104, 2.30038, 1.061569, 0.2941177, 0, 1, 1,
0.5669032, 0.3591245, 1.59352, 0.3019608, 0, 1, 1,
0.5696447, -0.3420651, 3.332741, 0.3098039, 0, 1, 1,
0.5752684, 1.662717, 0.1785438, 0.3137255, 0, 1, 1,
0.5791292, -0.526904, 2.612965, 0.3215686, 0, 1, 1,
0.5864272, 1.35208, 1.024104, 0.3254902, 0, 1, 1,
0.5897954, -1.271995, 3.624418, 0.3333333, 0, 1, 1,
0.5916693, -0.1754026, 4.054883, 0.3372549, 0, 1, 1,
0.6003052, 0.02222821, 1.33956, 0.345098, 0, 1, 1,
0.6027921, 0.2548018, 1.656415, 0.3490196, 0, 1, 1,
0.6050057, -1.551036, 3.009195, 0.3568628, 0, 1, 1,
0.6077933, -1.466396, 4.450819, 0.3607843, 0, 1, 1,
0.6115578, 0.5438231, 1.481154, 0.3686275, 0, 1, 1,
0.613197, -0.7021213, 2.819245, 0.372549, 0, 1, 1,
0.6151506, -1.001739, 0.6593219, 0.3803922, 0, 1, 1,
0.6153873, 0.4455459, 0.2904157, 0.3843137, 0, 1, 1,
0.616616, -2.925724, 2.938757, 0.3921569, 0, 1, 1,
0.6171772, 1.370234, 0.6508582, 0.3960784, 0, 1, 1,
0.6178265, 3.384851, 0.1950013, 0.4039216, 0, 1, 1,
0.6198825, -0.0707259, 0.9212386, 0.4117647, 0, 1, 1,
0.6219763, 2.221259, 0.9472517, 0.4156863, 0, 1, 1,
0.6270586, 0.714559, 0.197166, 0.4235294, 0, 1, 1,
0.6292748, 1.845917, -0.9111768, 0.427451, 0, 1, 1,
0.6353637, -1.192471, 1.185776, 0.4352941, 0, 1, 1,
0.6367654, -0.2702438, 2.210986, 0.4392157, 0, 1, 1,
0.6380864, -0.5337788, 1.373009, 0.4470588, 0, 1, 1,
0.638105, -0.8230165, 3.196536, 0.4509804, 0, 1, 1,
0.6402969, -0.1226254, 3.146494, 0.4588235, 0, 1, 1,
0.6528928, -0.6618672, 1.530656, 0.4627451, 0, 1, 1,
0.6574377, 0.6188304, 1.725561, 0.4705882, 0, 1, 1,
0.6639633, 0.2953208, 1.114106, 0.4745098, 0, 1, 1,
0.6662362, 2.639784, 0.7734565, 0.4823529, 0, 1, 1,
0.6720005, -0.3863636, 1.286614, 0.4862745, 0, 1, 1,
0.6825703, -0.6535898, 0.452607, 0.4941176, 0, 1, 1,
0.6866601, 0.002018855, -0.3953774, 0.5019608, 0, 1, 1,
0.6889817, -2.349241, 1.109421, 0.5058824, 0, 1, 1,
0.6918802, -0.7779262, 1.130427, 0.5137255, 0, 1, 1,
0.6955988, -0.009097505, 1.77274, 0.5176471, 0, 1, 1,
0.7004352, 0.4492624, 1.662384, 0.5254902, 0, 1, 1,
0.7020428, -0.4171993, 0.6065543, 0.5294118, 0, 1, 1,
0.7033604, 0.7110366, 2.366909, 0.5372549, 0, 1, 1,
0.7053416, 0.2950257, 1.233267, 0.5411765, 0, 1, 1,
0.7139688, 1.587592, 0.07487547, 0.5490196, 0, 1, 1,
0.7184395, 1.434909, 1.799069, 0.5529412, 0, 1, 1,
0.7227112, 0.2622157, 1.689984, 0.5607843, 0, 1, 1,
0.7269882, 0.4619414, -0.9264533, 0.5647059, 0, 1, 1,
0.7350509, -1.592131, 2.354932, 0.572549, 0, 1, 1,
0.7376382, 1.232559, 1.434039, 0.5764706, 0, 1, 1,
0.7384865, -1.446056, 4.333235, 0.5843138, 0, 1, 1,
0.738746, -0.4593389, 1.796642, 0.5882353, 0, 1, 1,
0.7393726, -0.08519109, 0.9735238, 0.5960785, 0, 1, 1,
0.7446595, 0.2056721, 0.7412974, 0.6039216, 0, 1, 1,
0.7447627, 0.4137042, 0.1149408, 0.6078432, 0, 1, 1,
0.752386, 0.3056992, 0.6202849, 0.6156863, 0, 1, 1,
0.7571665, -0.474547, 2.8101, 0.6196079, 0, 1, 1,
0.7601019, 0.2744062, 1.82589, 0.627451, 0, 1, 1,
0.7641113, 0.2318677, 0.6483086, 0.6313726, 0, 1, 1,
0.7707074, -1.002978, 0.405126, 0.6392157, 0, 1, 1,
0.7747286, -0.06083168, 0.926097, 0.6431373, 0, 1, 1,
0.7763805, 0.7468585, -0.5146109, 0.6509804, 0, 1, 1,
0.7799685, 0.3687762, 2.112048, 0.654902, 0, 1, 1,
0.7802722, 0.0703553, 0.6074818, 0.6627451, 0, 1, 1,
0.7845888, 2.458345, 0.3131638, 0.6666667, 0, 1, 1,
0.7854441, -0.02490265, 0.6797368, 0.6745098, 0, 1, 1,
0.787854, 0.08440571, 0.9779878, 0.6784314, 0, 1, 1,
0.7880394, 0.2852131, 1.271787, 0.6862745, 0, 1, 1,
0.7896142, 1.219379, 0.8315721, 0.6901961, 0, 1, 1,
0.7909169, -1.021831, 3.235698, 0.6980392, 0, 1, 1,
0.7913697, 0.6627195, 1.487744, 0.7058824, 0, 1, 1,
0.794459, -0.171509, 1.603305, 0.7098039, 0, 1, 1,
0.7971007, 0.5214289, 1.838955, 0.7176471, 0, 1, 1,
0.8017537, 0.1026875, 1.028521, 0.7215686, 0, 1, 1,
0.8030466, 0.57947, 0.6907128, 0.7294118, 0, 1, 1,
0.8057803, -0.08230714, 3.214704, 0.7333333, 0, 1, 1,
0.8090956, 1.933458, 0.3035504, 0.7411765, 0, 1, 1,
0.8104641, 0.8834587, -0.5296962, 0.7450981, 0, 1, 1,
0.8151655, 1.948476, -0.5040367, 0.7529412, 0, 1, 1,
0.830384, -2.23596, 2.558071, 0.7568628, 0, 1, 1,
0.8332145, 0.06999686, 3.669988, 0.7647059, 0, 1, 1,
0.8339006, 0.1012201, 0.2540813, 0.7686275, 0, 1, 1,
0.8434864, -1.790523, 3.179688, 0.7764706, 0, 1, 1,
0.8447757, 0.1616686, 1.13536, 0.7803922, 0, 1, 1,
0.8496954, -0.6114847, 2.395154, 0.7882353, 0, 1, 1,
0.8497224, 0.982321, 1.142004, 0.7921569, 0, 1, 1,
0.8506449, -0.411608, 1.044263, 0.8, 0, 1, 1,
0.8538672, -0.7921658, 3.523587, 0.8078431, 0, 1, 1,
0.8542413, -1.146186, 4.196573, 0.8117647, 0, 1, 1,
0.8584216, -1.387449, 2.75052, 0.8196079, 0, 1, 1,
0.8635402, -2.193459, 2.597185, 0.8235294, 0, 1, 1,
0.8767486, -0.3575764, 0.4639131, 0.8313726, 0, 1, 1,
0.8794371, 1.5711, -0.9908422, 0.8352941, 0, 1, 1,
0.8843461, -1.033706, 1.700199, 0.8431373, 0, 1, 1,
0.8874082, -1.530351, 2.480263, 0.8470588, 0, 1, 1,
0.8874952, 0.4757874, 1.355772, 0.854902, 0, 1, 1,
0.8913386, 0.4991143, 0.07028384, 0.8588235, 0, 1, 1,
0.8987612, -0.8067501, 1.375649, 0.8666667, 0, 1, 1,
0.9056209, 0.4676522, 0.9217992, 0.8705882, 0, 1, 1,
0.9059424, 0.02924526, 1.892798, 0.8784314, 0, 1, 1,
0.9087692, -0.5706353, 4.095638, 0.8823529, 0, 1, 1,
0.9090633, -0.003737405, 1.994491, 0.8901961, 0, 1, 1,
0.9141126, -0.3488637, 4.874198, 0.8941177, 0, 1, 1,
0.9210321, 0.09641431, 1.449011, 0.9019608, 0, 1, 1,
0.9231464, -0.445987, -0.5010222, 0.9098039, 0, 1, 1,
0.9368588, 1.095001, 0.1020577, 0.9137255, 0, 1, 1,
0.9372682, 1.261498, -0.638449, 0.9215686, 0, 1, 1,
0.9374795, 1.579199, 0.3030567, 0.9254902, 0, 1, 1,
0.938825, 0.2747776, -0.2267168, 0.9333333, 0, 1, 1,
0.9444098, -0.6615786, 3.079858, 0.9372549, 0, 1, 1,
0.9470937, -0.1058162, 1.536903, 0.945098, 0, 1, 1,
0.9581483, 0.9391909, -0.5070966, 0.9490196, 0, 1, 1,
0.9618897, -0.8555739, 1.316951, 0.9568627, 0, 1, 1,
0.9739602, 1.230816, -1.417488, 0.9607843, 0, 1, 1,
0.9743019, 0.5592439, 0.2657301, 0.9686275, 0, 1, 1,
0.9758282, 0.04605591, 0.3697482, 0.972549, 0, 1, 1,
0.9775384, 0.6598134, -0.4249377, 0.9803922, 0, 1, 1,
0.9794215, 1.880516, 0.6473594, 0.9843137, 0, 1, 1,
0.9797497, 0.7575085, 0.2470559, 0.9921569, 0, 1, 1,
0.9835068, -1.987436, 2.151677, 0.9960784, 0, 1, 1,
0.9838612, -0.3760237, 2.617662, 1, 0, 0.9960784, 1,
1.003162, 0.1222291, 1.426675, 1, 0, 0.9882353, 1,
1.004119, -1.647533, 1.716838, 1, 0, 0.9843137, 1,
1.006282, -1.002584, 2.313418, 1, 0, 0.9764706, 1,
1.00756, 0.3790736, 0.8268468, 1, 0, 0.972549, 1,
1.016711, -1.838663, 3.157815, 1, 0, 0.9647059, 1,
1.023272, -1.178028, 0.5724261, 1, 0, 0.9607843, 1,
1.023894, -0.6255002, 3.700899, 1, 0, 0.9529412, 1,
1.024805, 1.040238, 2.584857, 1, 0, 0.9490196, 1,
1.034997, 0.4167158, 2.305871, 1, 0, 0.9411765, 1,
1.041724, -1.561879, 3.12419, 1, 0, 0.9372549, 1,
1.047934, -0.5442064, 3.216214, 1, 0, 0.9294118, 1,
1.048774, 0.3299686, 2.147665, 1, 0, 0.9254902, 1,
1.052466, -0.5371307, 0.5009497, 1, 0, 0.9176471, 1,
1.063147, 2.087813, 1.637518, 1, 0, 0.9137255, 1,
1.066623, -0.6711268, 2.3119, 1, 0, 0.9058824, 1,
1.075202, 0.616901, 1.928784, 1, 0, 0.9019608, 1,
1.081265, 0.9281678, 2.362731, 1, 0, 0.8941177, 1,
1.085308, -0.7333052, 3.347883, 1, 0, 0.8862745, 1,
1.088869, 0.122106, 1.113242, 1, 0, 0.8823529, 1,
1.090419, -1.46422, 2.64819, 1, 0, 0.8745098, 1,
1.095091, -0.5561737, 1.647568, 1, 0, 0.8705882, 1,
1.099422, -0.5784729, 2.291121, 1, 0, 0.8627451, 1,
1.100736, -0.3953448, 1.981369, 1, 0, 0.8588235, 1,
1.103385, 0.9377326, 0.9658812, 1, 0, 0.8509804, 1,
1.104433, 0.5207301, 1.603889, 1, 0, 0.8470588, 1,
1.105888, -1.184046, 4.083196, 1, 0, 0.8392157, 1,
1.106544, -0.8461918, 3.784294, 1, 0, 0.8352941, 1,
1.106673, -0.9545619, 3.795624, 1, 0, 0.827451, 1,
1.106912, -1.63022, 1.546394, 1, 0, 0.8235294, 1,
1.108945, 1.972531, 0.1478654, 1, 0, 0.8156863, 1,
1.110573, 0.8783402, -2.233401, 1, 0, 0.8117647, 1,
1.111479, 0.780139, 0.3813287, 1, 0, 0.8039216, 1,
1.115748, 0.9399037, 1.252233, 1, 0, 0.7960784, 1,
1.11979, -2.144018, 2.156188, 1, 0, 0.7921569, 1,
1.120566, 2.844677, 2.245528, 1, 0, 0.7843137, 1,
1.123255, -1.139202, 3.914936, 1, 0, 0.7803922, 1,
1.126327, 0.6023859, 0.9757569, 1, 0, 0.772549, 1,
1.134588, -0.1027242, 2.967602, 1, 0, 0.7686275, 1,
1.135789, 0.8339064, 1.617111, 1, 0, 0.7607843, 1,
1.142939, 2.278984, 0.0940434, 1, 0, 0.7568628, 1,
1.14346, -0.7776334, 1.359046, 1, 0, 0.7490196, 1,
1.150975, 0.2574082, 1.258898, 1, 0, 0.7450981, 1,
1.158236, 0.3724315, 0.5227629, 1, 0, 0.7372549, 1,
1.162725, 0.2839077, 1.080675, 1, 0, 0.7333333, 1,
1.164236, -0.2043169, 0.8609412, 1, 0, 0.7254902, 1,
1.168088, -1.30767, 2.218666, 1, 0, 0.7215686, 1,
1.170106, 0.2050779, 2.323338, 1, 0, 0.7137255, 1,
1.172191, 0.5246658, 0.4487855, 1, 0, 0.7098039, 1,
1.19148, -0.5199312, 3.21488, 1, 0, 0.7019608, 1,
1.194129, -0.632056, 1.995587, 1, 0, 0.6941177, 1,
1.194882, -1.512126, 2.021477, 1, 0, 0.6901961, 1,
1.198292, -0.9733177, 2.460458, 1, 0, 0.682353, 1,
1.200867, 1.518474, 0.3281964, 1, 0, 0.6784314, 1,
1.213778, 0.1434632, 1.550567, 1, 0, 0.6705883, 1,
1.214023, 0.3217355, 1.341939, 1, 0, 0.6666667, 1,
1.214465, -1.151652, 2.949644, 1, 0, 0.6588235, 1,
1.217793, 0.9317581, 0.6180061, 1, 0, 0.654902, 1,
1.219801, 0.0259491, 2.91036, 1, 0, 0.6470588, 1,
1.226046, -0.5048906, 1.762052, 1, 0, 0.6431373, 1,
1.227598, 0.4804835, 1.992629, 1, 0, 0.6352941, 1,
1.233784, 0.6861897, 1.320009, 1, 0, 0.6313726, 1,
1.234647, -0.325231, 3.391504, 1, 0, 0.6235294, 1,
1.2357, -0.1140889, 2.317963, 1, 0, 0.6196079, 1,
1.238521, 0.4234432, 2.319471, 1, 0, 0.6117647, 1,
1.245008, -0.07973009, 1.841739, 1, 0, 0.6078432, 1,
1.249255, 1.026251, 2.50346, 1, 0, 0.6, 1,
1.255751, -0.7656463, 4.299832, 1, 0, 0.5921569, 1,
1.270865, 0.1761365, 1.32526, 1, 0, 0.5882353, 1,
1.275787, -0.66124, 0.06856585, 1, 0, 0.5803922, 1,
1.291753, 0.1739714, 2.560246, 1, 0, 0.5764706, 1,
1.296064, -0.9045703, 2.972001, 1, 0, 0.5686275, 1,
1.297369, -0.5325825, 1.999845, 1, 0, 0.5647059, 1,
1.303023, 1.192939, 1.29558, 1, 0, 0.5568628, 1,
1.304802, -0.9315209, 4.04561, 1, 0, 0.5529412, 1,
1.304869, 1.992584, 1.535728, 1, 0, 0.5450981, 1,
1.311021, -0.1093293, 2.641147, 1, 0, 0.5411765, 1,
1.325012, -0.4992125, 1.551891, 1, 0, 0.5333334, 1,
1.325994, 0.6637009, 0.5228084, 1, 0, 0.5294118, 1,
1.333402, -0.5994008, 0.4567984, 1, 0, 0.5215687, 1,
1.339284, 1.470283, -1.489277, 1, 0, 0.5176471, 1,
1.340423, 0.1629987, 1.619265, 1, 0, 0.509804, 1,
1.341061, 0.8780356, 0.5207284, 1, 0, 0.5058824, 1,
1.359554, 0.4024749, 0.2458363, 1, 0, 0.4980392, 1,
1.366571, -0.7580367, 0.8565878, 1, 0, 0.4901961, 1,
1.375524, 0.5531237, 1.265704, 1, 0, 0.4862745, 1,
1.378707, -0.5604349, 0.1760669, 1, 0, 0.4784314, 1,
1.387418, -0.4917974, 2.770683, 1, 0, 0.4745098, 1,
1.388275, -0.0326226, 1.336181, 1, 0, 0.4666667, 1,
1.391937, 0.4683982, 4.201533, 1, 0, 0.4627451, 1,
1.405552, -1.347737, 3.954507, 1, 0, 0.454902, 1,
1.418278, 0.06508877, 1.472892, 1, 0, 0.4509804, 1,
1.419162, -0.7108796, 1.088634, 1, 0, 0.4431373, 1,
1.424128, 0.2926742, 1.521951, 1, 0, 0.4392157, 1,
1.424448, -0.005564029, 2.445039, 1, 0, 0.4313726, 1,
1.436811, 0.8929095, 0.8590899, 1, 0, 0.427451, 1,
1.43751, -0.1650584, 1.867785, 1, 0, 0.4196078, 1,
1.447407, 1.053042, 2.95262, 1, 0, 0.4156863, 1,
1.460279, 0.8731242, 2.861276, 1, 0, 0.4078431, 1,
1.464185, -0.6518117, 0.8037851, 1, 0, 0.4039216, 1,
1.517727, -0.5357015, 1.591591, 1, 0, 0.3960784, 1,
1.519928, -0.8042067, 1.426634, 1, 0, 0.3882353, 1,
1.520058, 1.198683, 2.277314, 1, 0, 0.3843137, 1,
1.526842, 0.6175589, 1.337009, 1, 0, 0.3764706, 1,
1.546465, 0.0271096, 1.882383, 1, 0, 0.372549, 1,
1.555181, 0.3636092, 0.8000984, 1, 0, 0.3647059, 1,
1.568687, 0.5070632, 1.062995, 1, 0, 0.3607843, 1,
1.5833, -1.515012, 2.259097, 1, 0, 0.3529412, 1,
1.602857, 1.274174, 1.312852, 1, 0, 0.3490196, 1,
1.604963, 3.288198, -2.098526, 1, 0, 0.3411765, 1,
1.61034, -0.3481574, 2.912758, 1, 0, 0.3372549, 1,
1.620482, 0.3911035, 0.7108864, 1, 0, 0.3294118, 1,
1.620924, -2.619817, 0.8401775, 1, 0, 0.3254902, 1,
1.629355, 0.9662334, -0.2551103, 1, 0, 0.3176471, 1,
1.636444, -1.572038, 2.723831, 1, 0, 0.3137255, 1,
1.638135, -0.6239934, 0.4941331, 1, 0, 0.3058824, 1,
1.662376, -0.2553597, 2.299148, 1, 0, 0.2980392, 1,
1.676151, -0.7710803, 0.4749826, 1, 0, 0.2941177, 1,
1.676949, -1.438211, 4.260281, 1, 0, 0.2862745, 1,
1.680827, -0.4215606, 2.153655, 1, 0, 0.282353, 1,
1.685297, -0.1750679, 1.769585, 1, 0, 0.2745098, 1,
1.695805, -2.634832, 1.929167, 1, 0, 0.2705882, 1,
1.700386, -0.7654101, 1.475226, 1, 0, 0.2627451, 1,
1.709379, -0.1551505, 1.894465, 1, 0, 0.2588235, 1,
1.714203, -0.5731437, 2.2085, 1, 0, 0.2509804, 1,
1.715395, -0.003914625, 2.811571, 1, 0, 0.2470588, 1,
1.719069, -0.705501, 2.315423, 1, 0, 0.2392157, 1,
1.723887, 0.2721612, 2.648588, 1, 0, 0.2352941, 1,
1.725942, -1.041193, 1.07851, 1, 0, 0.227451, 1,
1.743574, -1.051293, 1.724498, 1, 0, 0.2235294, 1,
1.751205, 0.6047412, 0.4178136, 1, 0, 0.2156863, 1,
1.798951, 1.247365, 1.994714, 1, 0, 0.2117647, 1,
1.803106, -0.2505811, 0.7810156, 1, 0, 0.2039216, 1,
1.806967, 0.3802114, 1.269021, 1, 0, 0.1960784, 1,
1.821287, 2.497715, 2.930333, 1, 0, 0.1921569, 1,
1.841419, 0.3879642, 1.989097, 1, 0, 0.1843137, 1,
1.854436, -0.6824118, 2.905684, 1, 0, 0.1803922, 1,
1.912877, 0.8301145, 0.5771908, 1, 0, 0.172549, 1,
1.913307, -0.9337283, 1.483502, 1, 0, 0.1686275, 1,
1.928688, 0.2560503, 2.535768, 1, 0, 0.1607843, 1,
1.928955, -1.19033, 2.233562, 1, 0, 0.1568628, 1,
1.936713, 1.582885, 0.9627837, 1, 0, 0.1490196, 1,
1.942042, 1.422324, 1.452678, 1, 0, 0.145098, 1,
1.948302, 1.549262, 0.6280622, 1, 0, 0.1372549, 1,
1.968797, 1.502036, -1.488121, 1, 0, 0.1333333, 1,
1.978412, -0.3949439, 1.368374, 1, 0, 0.1254902, 1,
1.98548, -0.09915063, 0.753085, 1, 0, 0.1215686, 1,
1.989246, 0.3020362, 1.500625, 1, 0, 0.1137255, 1,
2.01317, 0.4823211, 2.415484, 1, 0, 0.1098039, 1,
2.08353, 0.3052573, 0.9970866, 1, 0, 0.1019608, 1,
2.169629, -1.891025, 3.52639, 1, 0, 0.09411765, 1,
2.183928, 0.8439094, 0.5274327, 1, 0, 0.09019608, 1,
2.197273, -0.2417165, 2.295975, 1, 0, 0.08235294, 1,
2.257224, -0.1582278, 0.5207484, 1, 0, 0.07843138, 1,
2.27501, -1.428641, 0.9695312, 1, 0, 0.07058824, 1,
2.311544, 0.5783687, -0.7666778, 1, 0, 0.06666667, 1,
2.337235, 1.001004, 2.37232, 1, 0, 0.05882353, 1,
2.381539, -1.469299, 1.274569, 1, 0, 0.05490196, 1,
2.533661, -0.6467422, 3.419447, 1, 0, 0.04705882, 1,
2.57402, 0.09566194, 2.228117, 1, 0, 0.04313726, 1,
2.775491, 1.372543, 1.288411, 1, 0, 0.03529412, 1,
2.805367, -0.7448904, 1.941127, 1, 0, 0.03137255, 1,
2.938686, 0.9167354, 0.4173671, 1, 0, 0.02352941, 1,
2.939041, -0.3384732, -1.72426, 1, 0, 0.01960784, 1,
3.094612, 0.2349911, 2.568062, 1, 0, 0.01176471, 1,
3.184765, -1.902323, 3.003681, 1, 0, 0.007843138, 1
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
-0.1327147, -4.127003, -7.480368, 0, -0.5, 0.5, 0.5,
-0.1327147, -4.127003, -7.480368, 1, -0.5, 0.5, 0.5,
-0.1327147, -4.127003, -7.480368, 1, 1.5, 0.5, 0.5,
-0.1327147, -4.127003, -7.480368, 0, 1.5, 0.5, 0.5
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
-4.57482, 0.1732843, -7.480368, 0, -0.5, 0.5, 0.5,
-4.57482, 0.1732843, -7.480368, 1, -0.5, 0.5, 0.5,
-4.57482, 0.1732843, -7.480368, 1, 1.5, 0.5, 0.5,
-4.57482, 0.1732843, -7.480368, 0, 1.5, 0.5, 0.5
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
-4.57482, -4.127003, 0.0308876, 0, -0.5, 0.5, 0.5,
-4.57482, -4.127003, 0.0308876, 1, -0.5, 0.5, 0.5,
-4.57482, -4.127003, 0.0308876, 1, 1.5, 0.5, 0.5,
-4.57482, -4.127003, 0.0308876, 0, 1.5, 0.5, 0.5
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
-3, -3.134629, -5.747002,
3, -3.134629, -5.747002,
-3, -3.134629, -5.747002,
-3, -3.300025, -6.035896,
-2, -3.134629, -5.747002,
-2, -3.300025, -6.035896,
-1, -3.134629, -5.747002,
-1, -3.300025, -6.035896,
0, -3.134629, -5.747002,
0, -3.300025, -6.035896,
1, -3.134629, -5.747002,
1, -3.300025, -6.035896,
2, -3.134629, -5.747002,
2, -3.300025, -6.035896,
3, -3.134629, -5.747002,
3, -3.300025, -6.035896
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
-3, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
-3, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
-3, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
-3, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
-2, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
-2, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
-2, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
-2, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
-1, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
-1, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
-1, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
-1, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
0, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
0, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
0, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
0, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
1, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
1, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
1, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
1, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
2, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
2, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
2, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
2, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5,
3, -3.630816, -6.613685, 0, -0.5, 0.5, 0.5,
3, -3.630816, -6.613685, 1, -0.5, 0.5, 0.5,
3, -3.630816, -6.613685, 1, 1.5, 0.5, 0.5,
3, -3.630816, -6.613685, 0, 1.5, 0.5, 0.5
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
-3.549719, -3, -5.747002,
-3.549719, 3, -5.747002,
-3.549719, -3, -5.747002,
-3.720569, -3, -6.035896,
-3.549719, -2, -5.747002,
-3.720569, -2, -6.035896,
-3.549719, -1, -5.747002,
-3.720569, -1, -6.035896,
-3.549719, 0, -5.747002,
-3.720569, 0, -6.035896,
-3.549719, 1, -5.747002,
-3.720569, 1, -6.035896,
-3.549719, 2, -5.747002,
-3.720569, 2, -6.035896,
-3.549719, 3, -5.747002,
-3.720569, 3, -6.035896
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
-4.06227, -3, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, -3, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, -3, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, -3, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, -2, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, -2, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, -2, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, -2, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, -1, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, -1, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, -1, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, -1, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, 0, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, 0, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, 0, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, 0, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, 1, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, 1, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, 1, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, 1, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, 2, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, 2, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, 2, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, 2, -6.613685, 0, 1.5, 0.5, 0.5,
-4.06227, 3, -6.613685, 0, -0.5, 0.5, 0.5,
-4.06227, 3, -6.613685, 1, -0.5, 0.5, 0.5,
-4.06227, 3, -6.613685, 1, 1.5, 0.5, 0.5,
-4.06227, 3, -6.613685, 0, 1.5, 0.5, 0.5
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
-3.549719, -3.134629, -4,
-3.549719, -3.134629, 4,
-3.549719, -3.134629, -4,
-3.720569, -3.300025, -4,
-3.549719, -3.134629, -2,
-3.720569, -3.300025, -2,
-3.549719, -3.134629, 0,
-3.720569, -3.300025, 0,
-3.549719, -3.134629, 2,
-3.720569, -3.300025, 2,
-3.549719, -3.134629, 4,
-3.720569, -3.300025, 4
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
-4.06227, -3.630816, -4, 0, -0.5, 0.5, 0.5,
-4.06227, -3.630816, -4, 1, -0.5, 0.5, 0.5,
-4.06227, -3.630816, -4, 1, 1.5, 0.5, 0.5,
-4.06227, -3.630816, -4, 0, 1.5, 0.5, 0.5,
-4.06227, -3.630816, -2, 0, -0.5, 0.5, 0.5,
-4.06227, -3.630816, -2, 1, -0.5, 0.5, 0.5,
-4.06227, -3.630816, -2, 1, 1.5, 0.5, 0.5,
-4.06227, -3.630816, -2, 0, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 0, 0, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 0, 1, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 0, 1, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 0, 0, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 2, 0, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 2, 1, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 2, 1, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 2, 0, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 4, 0, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 4, 1, -0.5, 0.5, 0.5,
-4.06227, -3.630816, 4, 1, 1.5, 0.5, 0.5,
-4.06227, -3.630816, 4, 0, 1.5, 0.5, 0.5
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
-3.549719, -3.134629, -5.747002,
-3.549719, 3.481198, -5.747002,
-3.549719, -3.134629, 5.808777,
-3.549719, 3.481198, 5.808777,
-3.549719, -3.134629, -5.747002,
-3.549719, -3.134629, 5.808777,
-3.549719, 3.481198, -5.747002,
-3.549719, 3.481198, 5.808777,
-3.549719, -3.134629, -5.747002,
3.28429, -3.134629, -5.747002,
-3.549719, -3.134629, 5.808777,
3.28429, -3.134629, 5.808777,
-3.549719, 3.481198, -5.747002,
3.28429, 3.481198, -5.747002,
-3.549719, 3.481198, 5.808777,
3.28429, 3.481198, 5.808777,
3.28429, -3.134629, -5.747002,
3.28429, 3.481198, -5.747002,
3.28429, -3.134629, 5.808777,
3.28429, 3.481198, 5.808777,
3.28429, -3.134629, -5.747002,
3.28429, -3.134629, 5.808777,
3.28429, 3.481198, -5.747002,
3.28429, 3.481198, 5.808777
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
var radius = 7.992047;
var distance = 35.55752;
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
mvMatrix.translate( 0.1327147, -0.1732843, -0.0308876 );
mvMatrix.scale( 1.264435, 1.306134, 0.7477781 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55752);
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
2-hydroxybenzamide<-read.table("2-hydroxybenzamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-hydroxybenzamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxybenzamide' not found
```

```r
y<-2-hydroxybenzamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxybenzamide' not found
```

```r
z<-2-hydroxybenzamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxybenzamide' not found
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
-3.450195, 2.212592, -2.535479, 0, 0, 1, 1, 1,
-3.318942, 0.8156211, -2.216832, 1, 0, 0, 1, 1,
-3.209847, 0.2787055, -1.538376, 1, 0, 0, 1, 1,
-2.926339, -0.8828579, -2.233498, 1, 0, 0, 1, 1,
-2.866898, 0.2086402, -2.878575, 1, 0, 0, 1, 1,
-2.864662, 0.1332328, -0.4392308, 1, 0, 0, 1, 1,
-2.812086, -0.3383716, -2.174176, 0, 0, 0, 1, 1,
-2.672376, 0.9644064, -0.439983, 0, 0, 0, 1, 1,
-2.53511, -0.3405902, -2.347359, 0, 0, 0, 1, 1,
-2.499718, 0.2341345, -0.5305027, 0, 0, 0, 1, 1,
-2.236887, -0.7863104, -1.550097, 0, 0, 0, 1, 1,
-2.233355, -0.1540878, -1.319271, 0, 0, 0, 1, 1,
-2.23094, 1.734543, -0.1673978, 0, 0, 0, 1, 1,
-2.156113, -0.7280543, -0.7167906, 1, 1, 1, 1, 1,
-2.146329, 2.719527, -0.6244144, 1, 1, 1, 1, 1,
-2.089562, -0.8576125, -0.7681658, 1, 1, 1, 1, 1,
-2.063654, 0.3513466, -2.293279, 1, 1, 1, 1, 1,
-2.060633, 0.8395826, -2.149774, 1, 1, 1, 1, 1,
-2.042033, 1.374738, -1.122694, 1, 1, 1, 1, 1,
-2.030647, -0.172202, -1.518899, 1, 1, 1, 1, 1,
-1.985705, -0.2080878, -2.38798, 1, 1, 1, 1, 1,
-1.984341, -0.3226759, 0.2367348, 1, 1, 1, 1, 1,
-1.984021, 0.1425111, -3.524043, 1, 1, 1, 1, 1,
-1.983469, -0.409591, -2.108374, 1, 1, 1, 1, 1,
-1.884171, 0.807171, -2.293331, 1, 1, 1, 1, 1,
-1.874694, 0.447995, -0.8710988, 1, 1, 1, 1, 1,
-1.874335, 0.3661405, -1.447232, 1, 1, 1, 1, 1,
-1.865426, -0.05294675, -1.31257, 1, 1, 1, 1, 1,
-1.862112, 0.5714722, -0.6528718, 0, 0, 1, 1, 1,
-1.856619, -0.2056268, 0.2111412, 1, 0, 0, 1, 1,
-1.854093, -0.2096099, -0.2267909, 1, 0, 0, 1, 1,
-1.851587, 0.5167592, -2.05444, 1, 0, 0, 1, 1,
-1.832623, 2.130789, -0.420815, 1, 0, 0, 1, 1,
-1.805645, 0.1506311, -0.146252, 1, 0, 0, 1, 1,
-1.800266, -0.5362615, -2.817572, 0, 0, 0, 1, 1,
-1.775606, 1.584302, 0.05739559, 0, 0, 0, 1, 1,
-1.773613, 1.910425, -1.525879, 0, 0, 0, 1, 1,
-1.771205, 0.6328379, -2.305417, 0, 0, 0, 1, 1,
-1.76075, -1.562558, -3.697567, 0, 0, 0, 1, 1,
-1.760639, 0.1727575, -2.333734, 0, 0, 0, 1, 1,
-1.752571, -2.286719, -1.728677, 0, 0, 0, 1, 1,
-1.748797, -0.355315, -1.823136, 1, 1, 1, 1, 1,
-1.742109, 0.1379315, -1.014374, 1, 1, 1, 1, 1,
-1.729657, -1.664056, -0.4026189, 1, 1, 1, 1, 1,
-1.72272, -0.1240158, -1.185735, 1, 1, 1, 1, 1,
-1.699029, 0.3196893, -1.520531, 1, 1, 1, 1, 1,
-1.695628, 1.351399, -3.74105, 1, 1, 1, 1, 1,
-1.691547, 0.3234789, -1.48939, 1, 1, 1, 1, 1,
-1.664679, 0.5673235, -1.994072, 1, 1, 1, 1, 1,
-1.659213, 0.5146164, 0.3024465, 1, 1, 1, 1, 1,
-1.653168, 0.6883243, -0.5274057, 1, 1, 1, 1, 1,
-1.64448, -0.02128936, 0.2561209, 1, 1, 1, 1, 1,
-1.634363, 0.1575608, -3.655761, 1, 1, 1, 1, 1,
-1.625547, -0.1622756, -1.946175, 1, 1, 1, 1, 1,
-1.617083, -0.4885388, -2.292828, 1, 1, 1, 1, 1,
-1.613718, 0.543889, -1.694819, 1, 1, 1, 1, 1,
-1.613266, -1.4672, -2.575305, 0, 0, 1, 1, 1,
-1.607315, 0.3291614, -0.1529665, 1, 0, 0, 1, 1,
-1.598727, -1.306522, -3.872391, 1, 0, 0, 1, 1,
-1.597412, 1.02962, -1.126977, 1, 0, 0, 1, 1,
-1.588949, 0.5148636, -1.199292, 1, 0, 0, 1, 1,
-1.574494, -0.5756686, -2.610995, 1, 0, 0, 1, 1,
-1.565448, -0.9294403, -1.218385, 0, 0, 0, 1, 1,
-1.556382, -0.6137534, -3.658327, 0, 0, 0, 1, 1,
-1.554656, 0.06815958, -0.6642482, 0, 0, 0, 1, 1,
-1.554316, -0.312175, -0.9640786, 0, 0, 0, 1, 1,
-1.550116, -0.6860116, -3.553156, 0, 0, 0, 1, 1,
-1.541224, -0.5415878, -2.782865, 0, 0, 0, 1, 1,
-1.531273, -0.1936277, -0.5665371, 0, 0, 0, 1, 1,
-1.523611, -0.8542287, -3.168024, 1, 1, 1, 1, 1,
-1.522411, -0.1424597, -1.849744, 1, 1, 1, 1, 1,
-1.497675, 0.1448652, 0.7861662, 1, 1, 1, 1, 1,
-1.496187, 0.6776669, -1.027246, 1, 1, 1, 1, 1,
-1.495376, 1.974203, -0.7951581, 1, 1, 1, 1, 1,
-1.491478, 0.7400112, 0.01337843, 1, 1, 1, 1, 1,
-1.479437, 0.1444293, -0.6779981, 1, 1, 1, 1, 1,
-1.478512, -0.5942751, -2.638065, 1, 1, 1, 1, 1,
-1.467454, -0.2642314, -0.07830297, 1, 1, 1, 1, 1,
-1.454263, 0.3416115, -2.476257, 1, 1, 1, 1, 1,
-1.444097, -0.3552477, -2.161761, 1, 1, 1, 1, 1,
-1.440213, -1.244552, -3.178011, 1, 1, 1, 1, 1,
-1.432155, -0.128378, -2.039104, 1, 1, 1, 1, 1,
-1.425077, 1.125307, 0.349481, 1, 1, 1, 1, 1,
-1.421332, 0.8564202, -0.5212368, 1, 1, 1, 1, 1,
-1.410594, -0.4204867, -0.541922, 0, 0, 1, 1, 1,
-1.408149, 0.1029506, -1.302924, 1, 0, 0, 1, 1,
-1.40514, -0.03373576, 0.4346241, 1, 0, 0, 1, 1,
-1.404917, -0.6839522, -1.923486, 1, 0, 0, 1, 1,
-1.40296, -1.383491, -2.126712, 1, 0, 0, 1, 1,
-1.395598, 0.9083037, -1.824462, 1, 0, 0, 1, 1,
-1.38749, 0.9024549, -0.4296625, 0, 0, 0, 1, 1,
-1.370903, 0.9871884, -0.5500236, 0, 0, 0, 1, 1,
-1.365278, 0.03585436, -0.179211, 0, 0, 0, 1, 1,
-1.357424, 0.5166386, -0.1551143, 0, 0, 0, 1, 1,
-1.350966, 0.1974378, -1.236369, 0, 0, 0, 1, 1,
-1.3497, 0.3272678, -1.856439, 0, 0, 0, 1, 1,
-1.342876, -1.076457, -1.350843, 0, 0, 0, 1, 1,
-1.342466, 0.7032495, 0.02152097, 1, 1, 1, 1, 1,
-1.339221, 0.8650708, -1.460591, 1, 1, 1, 1, 1,
-1.333175, -0.07377357, -1.032008, 1, 1, 1, 1, 1,
-1.331498, 2.020837, -1.642079, 1, 1, 1, 1, 1,
-1.326885, -1.356479, -2.584868, 1, 1, 1, 1, 1,
-1.326838, 0.00299305, -1.521108, 1, 1, 1, 1, 1,
-1.322792, -1.24385, -2.594014, 1, 1, 1, 1, 1,
-1.310037, 0.8102444, -1.746094, 1, 1, 1, 1, 1,
-1.309916, 0.1010739, -0.6928249, 1, 1, 1, 1, 1,
-1.307095, -1.211374, -2.070711, 1, 1, 1, 1, 1,
-1.305271, 1.570594, -1.103641, 1, 1, 1, 1, 1,
-1.302397, 0.1685882, -2.266245, 1, 1, 1, 1, 1,
-1.295645, -0.5795426, -2.17288, 1, 1, 1, 1, 1,
-1.293159, -0.3286585, -1.394329, 1, 1, 1, 1, 1,
-1.28407, 0.2698838, -1.696443, 1, 1, 1, 1, 1,
-1.279334, 0.8829696, -1.094791, 0, 0, 1, 1, 1,
-1.270297, -0.358826, -2.843578, 1, 0, 0, 1, 1,
-1.267355, -0.8484871, -1.41611, 1, 0, 0, 1, 1,
-1.256718, 0.03188939, -3.50189, 1, 0, 0, 1, 1,
-1.252532, 0.2124631, -0.6989987, 1, 0, 0, 1, 1,
-1.2471, 0.01733907, -0.9252509, 1, 0, 0, 1, 1,
-1.235788, -0.7325875, 0.0009937023, 0, 0, 0, 1, 1,
-1.233205, -0.7611483, -2.536686, 0, 0, 0, 1, 1,
-1.232654, 0.3380542, -2.542694, 0, 0, 0, 1, 1,
-1.223522, 1.467799, 1.226566, 0, 0, 0, 1, 1,
-1.215322, -0.1961048, -3.187023, 0, 0, 0, 1, 1,
-1.210909, 0.09921462, -0.5164, 0, 0, 0, 1, 1,
-1.202331, -0.2197207, -0.9019151, 0, 0, 0, 1, 1,
-1.200984, 0.6375188, -1.361961, 1, 1, 1, 1, 1,
-1.19783, -0.09034695, -4.304114, 1, 1, 1, 1, 1,
-1.19614, -2.18651, -2.173433, 1, 1, 1, 1, 1,
-1.194926, -0.5135446, -1.418359, 1, 1, 1, 1, 1,
-1.188396, -0.3086966, -2.360775, 1, 1, 1, 1, 1,
-1.187151, 2.312182, 2.035725, 1, 1, 1, 1, 1,
-1.179236, -0.2417006, -1.753516, 1, 1, 1, 1, 1,
-1.179232, 0.05475416, -0.5408995, 1, 1, 1, 1, 1,
-1.178949, 1.641627, 0.09669126, 1, 1, 1, 1, 1,
-1.178909, -1.352155, -3.263112, 1, 1, 1, 1, 1,
-1.174597, -0.1293409, -2.57914, 1, 1, 1, 1, 1,
-1.169902, 0.5814772, 0.01403075, 1, 1, 1, 1, 1,
-1.167431, 1.316468, -0.3684857, 1, 1, 1, 1, 1,
-1.16692, -0.01865525, -0.409046, 1, 1, 1, 1, 1,
-1.141711, -0.129306, -3.014571, 1, 1, 1, 1, 1,
-1.132534, -0.8247818, -3.61283, 0, 0, 1, 1, 1,
-1.13191, -0.1062294, -0.7822902, 1, 0, 0, 1, 1,
-1.130126, 0.1517756, 0.2987978, 1, 0, 0, 1, 1,
-1.124348, 0.7299137, -1.680673, 1, 0, 0, 1, 1,
-1.118126, -0.7634156, -0.9710032, 1, 0, 0, 1, 1,
-1.112204, -1.026478, -3.104435, 1, 0, 0, 1, 1,
-1.111212, 0.2202486, -1.549105, 0, 0, 0, 1, 1,
-1.101024, -0.02064297, -2.363864, 0, 0, 0, 1, 1,
-1.099318, 0.8661824, 0.2972478, 0, 0, 0, 1, 1,
-1.096587, -0.6996562, -3.948904, 0, 0, 0, 1, 1,
-1.094033, -1.596368, -0.3593899, 0, 0, 0, 1, 1,
-1.091582, 0.2661836, -0.6340669, 0, 0, 0, 1, 1,
-1.090889, 1.818183, -2.642297, 0, 0, 0, 1, 1,
-1.084686, -0.9019008, -1.456796, 1, 1, 1, 1, 1,
-1.073641, 1.879485, 0.4845316, 1, 1, 1, 1, 1,
-1.069664, -0.3465538, -2.673578, 1, 1, 1, 1, 1,
-1.066752, 1.605641, -0.008569933, 1, 1, 1, 1, 1,
-1.059937, 1.694775, 0.9938805, 1, 1, 1, 1, 1,
-1.05523, -0.1797116, -2.612694, 1, 1, 1, 1, 1,
-1.051419, 0.701538, 0.6396384, 1, 1, 1, 1, 1,
-1.049132, 0.09002852, -1.286617, 1, 1, 1, 1, 1,
-1.047662, 0.8212255, -0.7145182, 1, 1, 1, 1, 1,
-1.047259, 0.9878435, 0.09231044, 1, 1, 1, 1, 1,
-1.044406, 1.039044, -0.08584686, 1, 1, 1, 1, 1,
-1.044007, -0.5426676, -2.698449, 1, 1, 1, 1, 1,
-1.03651, 0.4021218, -1.908182, 1, 1, 1, 1, 1,
-1.03525, 1.705121, -0.7248479, 1, 1, 1, 1, 1,
-1.03463, -1.535209, -1.428395, 1, 1, 1, 1, 1,
-1.011788, 0.9176527, -0.7182233, 0, 0, 1, 1, 1,
-1.010937, -0.6499389, -4.190051, 1, 0, 0, 1, 1,
-1.007156, 0.6142815, -3.232132, 1, 0, 0, 1, 1,
-1.004963, -0.4684127, -2.241015, 1, 0, 0, 1, 1,
-1.003872, -1.773803, -3.320709, 1, 0, 0, 1, 1,
-1.003676, -0.3712672, -1.934446, 1, 0, 0, 1, 1,
-1.002983, -0.1387154, -3.269669, 0, 0, 0, 1, 1,
-0.9956566, 0.9635596, -1.4059, 0, 0, 0, 1, 1,
-0.993762, -1.364972, -1.942069, 0, 0, 0, 1, 1,
-0.9911452, 0.5444522, -0.2449705, 0, 0, 0, 1, 1,
-0.9885345, 0.4903514, -0.1174086, 0, 0, 0, 1, 1,
-0.9866359, 0.1741957, -0.538558, 0, 0, 0, 1, 1,
-0.98594, 1.892187, -1.106229, 0, 0, 0, 1, 1,
-0.9830669, 0.2206082, -0.3172007, 1, 1, 1, 1, 1,
-0.9745222, -1.552885, -2.80296, 1, 1, 1, 1, 1,
-0.9734451, -0.8494678, -1.467478, 1, 1, 1, 1, 1,
-0.9732614, -0.8422382, -3.22341, 1, 1, 1, 1, 1,
-0.9682281, 0.887299, -1.840994, 1, 1, 1, 1, 1,
-0.9681226, 0.8682163, -2.903538, 1, 1, 1, 1, 1,
-0.95408, 0.1568055, -0.8772926, 1, 1, 1, 1, 1,
-0.9512187, -1.090177, -3.511437, 1, 1, 1, 1, 1,
-0.9334456, -0.6276692, -2.31755, 1, 1, 1, 1, 1,
-0.932396, -0.9979812, -3.060072, 1, 1, 1, 1, 1,
-0.9303091, 1.231955, -0.1654058, 1, 1, 1, 1, 1,
-0.9272107, -0.5106638, -2.860291, 1, 1, 1, 1, 1,
-0.9250513, 1.127717, -1.653359, 1, 1, 1, 1, 1,
-0.9233985, -0.6865553, -4.264668, 1, 1, 1, 1, 1,
-0.913843, 0.8505197, -1.556967, 1, 1, 1, 1, 1,
-0.9124529, -0.8375065, -3.168449, 0, 0, 1, 1, 1,
-0.9085479, 0.2032115, -0.5030022, 1, 0, 0, 1, 1,
-0.9072255, -0.3880062, 0.6206232, 1, 0, 0, 1, 1,
-0.9072139, 1.067513, -1.512914, 1, 0, 0, 1, 1,
-0.9070376, -0.4551595, -1.569172, 1, 0, 0, 1, 1,
-0.9069599, -0.6916128, -3.899802, 1, 0, 0, 1, 1,
-0.906546, -1.265432, 0.147561, 0, 0, 0, 1, 1,
-0.9023032, 1.411634, -1.170495, 0, 0, 0, 1, 1,
-0.8962424, 0.974875, -0.5351762, 0, 0, 0, 1, 1,
-0.8930993, -0.2316024, -3.088139, 0, 0, 0, 1, 1,
-0.8922876, 0.8236851, -1.34643, 0, 0, 0, 1, 1,
-0.8866906, -0.6995687, -0.4523625, 0, 0, 0, 1, 1,
-0.8707181, 2.179084, 1.14691, 0, 0, 0, 1, 1,
-0.8684532, 0.2338307, -2.094229, 1, 1, 1, 1, 1,
-0.8634089, 0.4370157, -0.7562616, 1, 1, 1, 1, 1,
-0.8502614, 0.8741319, 1.350543, 1, 1, 1, 1, 1,
-0.8423692, 0.2396179, -1.357146, 1, 1, 1, 1, 1,
-0.8388937, -1.20336, -2.87171, 1, 1, 1, 1, 1,
-0.8348039, 1.767397, -0.009640296, 1, 1, 1, 1, 1,
-0.8304915, 0.3482007, -0.464574, 1, 1, 1, 1, 1,
-0.8280141, -0.06811664, -0.6903252, 1, 1, 1, 1, 1,
-0.8259372, 1.548251, -1.247761, 1, 1, 1, 1, 1,
-0.8229398, 1.286045, 1.004573, 1, 1, 1, 1, 1,
-0.8222091, 1.910023, -1.355512, 1, 1, 1, 1, 1,
-0.8172649, -0.1359309, -2.734016, 1, 1, 1, 1, 1,
-0.8148888, 0.3090099, -1.179588, 1, 1, 1, 1, 1,
-0.8108952, -0.9090078, -0.2074498, 1, 1, 1, 1, 1,
-0.8031821, 0.5544856, 0.03803058, 1, 1, 1, 1, 1,
-0.8031503, -1.736038, -3.049783, 0, 0, 1, 1, 1,
-0.7928154, -0.5530419, -1.861747, 1, 0, 0, 1, 1,
-0.7926758, -1.861923, -3.490477, 1, 0, 0, 1, 1,
-0.7893382, -0.4310221, -2.366539, 1, 0, 0, 1, 1,
-0.7855185, -1.360555, -1.946888, 1, 0, 0, 1, 1,
-0.7688807, 2.513837, -0.2625244, 1, 0, 0, 1, 1,
-0.7679854, -0.6795884, -2.76355, 0, 0, 0, 1, 1,
-0.7572992, -0.1491146, -3.351, 0, 0, 0, 1, 1,
-0.7557176, -2.808426, -3.546567, 0, 0, 0, 1, 1,
-0.7555504, 2.910334, -2.574203, 0, 0, 0, 1, 1,
-0.7472039, -0.5237167, -1.926629, 0, 0, 0, 1, 1,
-0.7440594, 0.4392824, -1.209511, 0, 0, 0, 1, 1,
-0.7433475, 0.6793697, -1.773853, 0, 0, 0, 1, 1,
-0.7394904, -1.470804, -1.324379, 1, 1, 1, 1, 1,
-0.7376043, 0.4039137, -0.711164, 1, 1, 1, 1, 1,
-0.7354198, -1.900801, -1.792398, 1, 1, 1, 1, 1,
-0.7316294, 0.6260677, -0.3992726, 1, 1, 1, 1, 1,
-0.7284392, 1.200914, 1.202137, 1, 1, 1, 1, 1,
-0.7244632, -0.805201, -3.286318, 1, 1, 1, 1, 1,
-0.7237697, 0.1597665, -1.50174, 1, 1, 1, 1, 1,
-0.7142763, -1.300175, -2.793254, 1, 1, 1, 1, 1,
-0.709955, 1.674735, -0.6056817, 1, 1, 1, 1, 1,
-0.7098284, -0.9840101, -1.243989, 1, 1, 1, 1, 1,
-0.7091312, 0.532585, 0.6780176, 1, 1, 1, 1, 1,
-0.6979458, -1.179742, -3.218006, 1, 1, 1, 1, 1,
-0.6932194, 0.868865, 0.3316303, 1, 1, 1, 1, 1,
-0.6908913, 0.9928154, -0.3224339, 1, 1, 1, 1, 1,
-0.6887436, 1.010178, 0.0418645, 1, 1, 1, 1, 1,
-0.6830609, -0.6685227, -2.497157, 0, 0, 1, 1, 1,
-0.6799296, 1.570364, -0.4049883, 1, 0, 0, 1, 1,
-0.6760569, 0.151523, -1.046872, 1, 0, 0, 1, 1,
-0.6752659, 0.9582938, -1.934432, 1, 0, 0, 1, 1,
-0.6741292, 0.3801845, -1.560798, 1, 0, 0, 1, 1,
-0.6680115, 0.6500556, -0.6192079, 1, 0, 0, 1, 1,
-0.6660066, -0.7764147, -2.104991, 0, 0, 0, 1, 1,
-0.6639456, -0.07700587, -3.754958, 0, 0, 0, 1, 1,
-0.663, 0.2229512, 0.2528351, 0, 0, 0, 1, 1,
-0.6575341, -0.2658956, -1.620515, 0, 0, 0, 1, 1,
-0.6502442, -0.3745473, -1.510801, 0, 0, 0, 1, 1,
-0.6494359, 2.19805, -0.3934353, 0, 0, 0, 1, 1,
-0.6423569, -0.4536233, -1.878177, 0, 0, 0, 1, 1,
-0.6420829, -1.491586, -2.539851, 1, 1, 1, 1, 1,
-0.6373889, -0.9696807, -3.818086, 1, 1, 1, 1, 1,
-0.6321487, -1.273762, -2.306185, 1, 1, 1, 1, 1,
-0.6320667, 0.7332698, -2.595109, 1, 1, 1, 1, 1,
-0.6317125, -0.1908782, -0.81484, 1, 1, 1, 1, 1,
-0.630482, -0.2150159, -2.883285, 1, 1, 1, 1, 1,
-0.6293588, 0.696844, -0.2237364, 1, 1, 1, 1, 1,
-0.6285294, 0.3978438, -2.70192, 1, 1, 1, 1, 1,
-0.6269968, -1.276494, -2.657896, 1, 1, 1, 1, 1,
-0.6254659, 1.617872, 0.9334945, 1, 1, 1, 1, 1,
-0.6245094, 0.003875562, -2.080124, 1, 1, 1, 1, 1,
-0.6188166, -0.5241964, -1.647162, 1, 1, 1, 1, 1,
-0.6105346, -0.220872, -2.122753, 1, 1, 1, 1, 1,
-0.6098934, -1.546849, -2.293249, 1, 1, 1, 1, 1,
-0.6095918, 0.2630573, -2.390132, 1, 1, 1, 1, 1,
-0.6086209, -0.09221926, -2.474622, 0, 0, 1, 1, 1,
-0.6068686, -1.383853, -2.466389, 1, 0, 0, 1, 1,
-0.6038768, 0.7432138, -0.3365264, 1, 0, 0, 1, 1,
-0.6020176, -1.175543, -2.117442, 1, 0, 0, 1, 1,
-0.5954952, -0.6312668, -4.332963, 1, 0, 0, 1, 1,
-0.5934034, -0.03369977, -0.2375398, 1, 0, 0, 1, 1,
-0.5916501, 1.74831, -1.518624, 0, 0, 0, 1, 1,
-0.5870903, -0.2295766, -1.601429, 0, 0, 0, 1, 1,
-0.5870283, -0.5411624, -1.919979, 0, 0, 0, 1, 1,
-0.5854118, 0.4657839, -0.8782277, 0, 0, 0, 1, 1,
-0.5821601, 0.0921889, -0.9481333, 0, 0, 0, 1, 1,
-0.5811484, -1.654888, -4.608358, 0, 0, 0, 1, 1,
-0.5788367, -1.131617, -3.969853, 0, 0, 0, 1, 1,
-0.5757216, -0.02167174, -1.070475, 1, 1, 1, 1, 1,
-0.5739203, 0.2644729, -0.1610665, 1, 1, 1, 1, 1,
-0.5734111, 2.018763, 1.259769, 1, 1, 1, 1, 1,
-0.5728371, -0.6189864, -2.948646, 1, 1, 1, 1, 1,
-0.572455, 0.7662312, -0.9799938, 1, 1, 1, 1, 1,
-0.5689494, 1.806403, -0.9500918, 1, 1, 1, 1, 1,
-0.5672655, -1.858268, -3.432274, 1, 1, 1, 1, 1,
-0.5652297, -0.05223539, -2.964416, 1, 1, 1, 1, 1,
-0.564033, -0.8512108, -3.802425, 1, 1, 1, 1, 1,
-0.5537357, -0.03126695, -2.335451, 1, 1, 1, 1, 1,
-0.5464172, -1.380893, -2.548967, 1, 1, 1, 1, 1,
-0.5459011, -0.1558712, -2.179743, 1, 1, 1, 1, 1,
-0.5435233, -0.3801781, -2.096004, 1, 1, 1, 1, 1,
-0.5429748, 1.472175, 0.2510772, 1, 1, 1, 1, 1,
-0.5420796, -1.092077, -3.131083, 1, 1, 1, 1, 1,
-0.5363688, 1.288722, -1.17627, 0, 0, 1, 1, 1,
-0.5320941, 2.589362, 0.5562675, 1, 0, 0, 1, 1,
-0.53203, -1.668244, -2.870908, 1, 0, 0, 1, 1,
-0.5304252, -1.017667, -1.716762, 1, 0, 0, 1, 1,
-0.5176594, 0.7771087, -1.20969, 1, 0, 0, 1, 1,
-0.5158259, -1.345695, -4.164619, 1, 0, 0, 1, 1,
-0.5140407, -1.149698, -1.029005, 0, 0, 0, 1, 1,
-0.5135334, -0.4754829, -2.349066, 0, 0, 0, 1, 1,
-0.5113403, 0.003476039, -0.07902714, 0, 0, 0, 1, 1,
-0.5101365, 0.4945665, 0.1855727, 0, 0, 0, 1, 1,
-0.5039129, 1.017494, -0.2273613, 0, 0, 0, 1, 1,
-0.5018758, 0.006054126, 0.2854535, 0, 0, 0, 1, 1,
-0.5002876, 0.4254357, -1.488711, 0, 0, 0, 1, 1,
-0.4983828, 0.4787749, 0.1489766, 1, 1, 1, 1, 1,
-0.4956721, -0.240669, -2.791656, 1, 1, 1, 1, 1,
-0.494703, 0.9481723, -0.376645, 1, 1, 1, 1, 1,
-0.4924588, -0.5727262, -4.256311, 1, 1, 1, 1, 1,
-0.4913054, -0.8724402, -3.60199, 1, 1, 1, 1, 1,
-0.4902364, 1.370095, -0.7836508, 1, 1, 1, 1, 1,
-0.4849813, 0.05339415, -2.073982, 1, 1, 1, 1, 1,
-0.4840067, 0.3599911, 0.1619736, 1, 1, 1, 1, 1,
-0.4838062, 0.5821105, -1.749525, 1, 1, 1, 1, 1,
-0.4828542, 3.19026, -1.688964, 1, 1, 1, 1, 1,
-0.4812401, 0.4637713, -0.6833594, 1, 1, 1, 1, 1,
-0.4798104, 0.4349005, -1.124907, 1, 1, 1, 1, 1,
-0.4787562, -0.1618027, -2.789178, 1, 1, 1, 1, 1,
-0.4787268, 0.8038204, -2.261876, 1, 1, 1, 1, 1,
-0.462395, -0.3621388, -4.201477, 1, 1, 1, 1, 1,
-0.4618055, -0.04139713, -2.410124, 0, 0, 1, 1, 1,
-0.4610822, -0.5681604, -1.33281, 1, 0, 0, 1, 1,
-0.4557061, -0.1567334, -3.090191, 1, 0, 0, 1, 1,
-0.4542865, 1.091217, -2.466429, 1, 0, 0, 1, 1,
-0.4480675, -0.2508758, -2.194739, 1, 0, 0, 1, 1,
-0.4473796, -0.7265591, -2.495976, 1, 0, 0, 1, 1,
-0.4466621, 0.9968001, 0.8858704, 0, 0, 0, 1, 1,
-0.4462605, -1.986241, -3.897979, 0, 0, 0, 1, 1,
-0.4453744, -1.10303, -3.931931, 0, 0, 0, 1, 1,
-0.4421257, -0.01817424, -3.013717, 0, 0, 0, 1, 1,
-0.4415343, 0.2863317, -0.4770461, 0, 0, 0, 1, 1,
-0.4413885, -1.496923, -3.16076, 0, 0, 0, 1, 1,
-0.4355345, 1.116947, -0.7084846, 0, 0, 0, 1, 1,
-0.4351931, 0.4638077, -0.7668706, 1, 1, 1, 1, 1,
-0.4290555, 0.6755904, -1.108069, 1, 1, 1, 1, 1,
-0.4260031, 0.1624895, -1.456588, 1, 1, 1, 1, 1,
-0.422603, 1.074163, -2.047371, 1, 1, 1, 1, 1,
-0.4215478, 0.8687644, -0.2363857, 1, 1, 1, 1, 1,
-0.4192146, 0.2778809, 0.87921, 1, 1, 1, 1, 1,
-0.4184785, 0.9503717, 0.4753554, 1, 1, 1, 1, 1,
-0.4159205, -1.328923, -2.46608, 1, 1, 1, 1, 1,
-0.4152913, -0.4975411, -3.227504, 1, 1, 1, 1, 1,
-0.4139428, 0.1397624, -1.579856, 1, 1, 1, 1, 1,
-0.4082688, -1.535798, -1.867798, 1, 1, 1, 1, 1,
-0.4038558, 0.1535355, -2.908076, 1, 1, 1, 1, 1,
-0.4012043, 0.794872, -0.07988149, 1, 1, 1, 1, 1,
-0.3893674, 0.5519183, -2.549533, 1, 1, 1, 1, 1,
-0.380987, -0.1594905, -1.841584, 1, 1, 1, 1, 1,
-0.3758164, -0.2061475, -2.352091, 0, 0, 1, 1, 1,
-0.371391, 0.06712305, -2.89176, 1, 0, 0, 1, 1,
-0.3677762, -1.009667, -1.913125, 1, 0, 0, 1, 1,
-0.3656882, 1.297012, 0.08640081, 1, 0, 0, 1, 1,
-0.3654571, -0.285091, -2.450424, 1, 0, 0, 1, 1,
-0.3631602, -1.844043, -2.015014, 1, 0, 0, 1, 1,
-0.3601226, 0.6393642, 1.28211, 0, 0, 0, 1, 1,
-0.3587592, 0.8280885, -0.7374794, 0, 0, 0, 1, 1,
-0.3566664, 0.498438, -1.690512, 0, 0, 0, 1, 1,
-0.3558549, -0.5338764, -1.26609, 0, 0, 0, 1, 1,
-0.354404, -1.17893, -3.620296, 0, 0, 0, 1, 1,
-0.3532142, 1.309156, 0.2845536, 0, 0, 0, 1, 1,
-0.352228, -1.638518, -3.899453, 0, 0, 0, 1, 1,
-0.3367677, -0.7068402, -3.310525, 1, 1, 1, 1, 1,
-0.3359108, -0.2299497, -2.187855, 1, 1, 1, 1, 1,
-0.3336228, 0.5732006, -0.6544752, 1, 1, 1, 1, 1,
-0.3333058, -0.3082103, -0.1999373, 1, 1, 1, 1, 1,
-0.3298464, 0.8431468, 0.07213835, 1, 1, 1, 1, 1,
-0.3258795, -0.225904, -1.609508, 1, 1, 1, 1, 1,
-0.3240067, 1.210752, 0.241372, 1, 1, 1, 1, 1,
-0.3217547, 0.2187405, -0.908525, 1, 1, 1, 1, 1,
-0.3197479, 0.3708578, -0.9517684, 1, 1, 1, 1, 1,
-0.3194779, 0.5447986, 1.617912, 1, 1, 1, 1, 1,
-0.3077387, 1.803186, -1.209056, 1, 1, 1, 1, 1,
-0.3040927, -0.825645, -1.850559, 1, 1, 1, 1, 1,
-0.3034961, -0.575286, -3.214373, 1, 1, 1, 1, 1,
-0.3029751, -1.512621, -5.182709, 1, 1, 1, 1, 1,
-0.3006975, -0.1619585, -0.1356657, 1, 1, 1, 1, 1,
-0.298536, 0.4347824, 0.974837, 0, 0, 1, 1, 1,
-0.291871, 0.6566954, 0.9244831, 1, 0, 0, 1, 1,
-0.2886116, -0.825555, -3.859283, 1, 0, 0, 1, 1,
-0.2844827, -0.6542343, -2.585438, 1, 0, 0, 1, 1,
-0.2837468, -1.577672, -3.235698, 1, 0, 0, 1, 1,
-0.2808811, 0.1369928, -2.48288, 1, 0, 0, 1, 1,
-0.2718668, -0.433657, -3.704399, 0, 0, 0, 1, 1,
-0.2696285, -0.7280257, -2.980654, 0, 0, 0, 1, 1,
-0.2694632, -0.340704, -1.076435, 0, 0, 0, 1, 1,
-0.2666419, -1.374061, -3.372851, 0, 0, 0, 1, 1,
-0.2663601, -0.1324497, -2.231115, 0, 0, 0, 1, 1,
-0.2653117, -0.1668115, -1.912535, 0, 0, 0, 1, 1,
-0.2646886, -0.06432693, -2.510818, 0, 0, 0, 1, 1,
-0.2646833, 0.9523953, -1.22646, 1, 1, 1, 1, 1,
-0.2645043, -0.4392195, -2.06465, 1, 1, 1, 1, 1,
-0.2640769, -0.08739001, -2.516912, 1, 1, 1, 1, 1,
-0.2628729, -0.1841029, -2.981441, 1, 1, 1, 1, 1,
-0.2618863, 0.4789381, -1.114289, 1, 1, 1, 1, 1,
-0.2582048, -1.72037, -2.815857, 1, 1, 1, 1, 1,
-0.2564857, -0.2982345, -1.718006, 1, 1, 1, 1, 1,
-0.2555581, 1.023572, -0.186008, 1, 1, 1, 1, 1,
-0.253642, -1.44368, -3.884659, 1, 1, 1, 1, 1,
-0.2535304, 0.4077711, -0.8960463, 1, 1, 1, 1, 1,
-0.2529816, -0.05977708, -0.8822749, 1, 1, 1, 1, 1,
-0.2495229, 0.3981007, 0.2308383, 1, 1, 1, 1, 1,
-0.248261, -0.2378767, -3.582863, 1, 1, 1, 1, 1,
-0.2472987, -2.083364, -2.735858, 1, 1, 1, 1, 1,
-0.2458639, 0.9923, -0.1378234, 1, 1, 1, 1, 1,
-0.2409585, -0.4856922, -1.71292, 0, 0, 1, 1, 1,
-0.2340015, -0.3640056, -2.713234, 1, 0, 0, 1, 1,
-0.2321436, -0.4453731, -1.094894, 1, 0, 0, 1, 1,
-0.2315244, -1.13418, -5.578713, 1, 0, 0, 1, 1,
-0.2279723, 1.367673, -1.848935, 1, 0, 0, 1, 1,
-0.2273106, -0.3507053, -1.122899, 1, 0, 0, 1, 1,
-0.2178606, 0.06037573, -2.009123, 0, 0, 0, 1, 1,
-0.2130749, 1.371943, -0.9384935, 0, 0, 0, 1, 1,
-0.2123842, -1.894179, -2.553717, 0, 0, 0, 1, 1,
-0.2101187, 0.3307713, -2.371794, 0, 0, 0, 1, 1,
-0.2079305, 1.779007, -0.3536145, 0, 0, 0, 1, 1,
-0.206803, 0.01740661, -0.701628, 0, 0, 0, 1, 1,
-0.2065611, -1.194028, -2.202113, 0, 0, 0, 1, 1,
-0.2057386, -1.628361, -3.180586, 1, 1, 1, 1, 1,
-0.1983942, -0.3842011, -5.132301, 1, 1, 1, 1, 1,
-0.1946988, -1.382641, -1.473386, 1, 1, 1, 1, 1,
-0.1928736, 0.9936327, 0.3990561, 1, 1, 1, 1, 1,
-0.1851599, 1.367904, -0.4921954, 1, 1, 1, 1, 1,
-0.1821829, 1.625858, -1.169618, 1, 1, 1, 1, 1,
-0.1710984, 1.212796, -0.5417981, 1, 1, 1, 1, 1,
-0.1708172, -1.833519, -3.839221, 1, 1, 1, 1, 1,
-0.170107, -0.7756526, -3.810039, 1, 1, 1, 1, 1,
-0.1668919, -0.2354042, -4.001291, 1, 1, 1, 1, 1,
-0.1624967, 0.6041412, -1.446723, 1, 1, 1, 1, 1,
-0.1621949, -1.54077, -3.32816, 1, 1, 1, 1, 1,
-0.1602878, -0.765686, -2.20452, 1, 1, 1, 1, 1,
-0.1592091, -0.5329241, -3.677716, 1, 1, 1, 1, 1,
-0.1574636, 0.3969328, -0.04098106, 1, 1, 1, 1, 1,
-0.1555558, 1.153422, -1.518185, 0, 0, 1, 1, 1,
-0.1522471, 0.1440662, -0.1374906, 1, 0, 0, 1, 1,
-0.1495202, 1.546738, -1.828626, 1, 0, 0, 1, 1,
-0.1483628, -0.2941386, -1.627267, 1, 0, 0, 1, 1,
-0.1470663, 0.7218497, 0.7483409, 1, 0, 0, 1, 1,
-0.1464385, 0.3458017, 0.1037145, 1, 0, 0, 1, 1,
-0.143652, -0.02213621, -0.635328, 0, 0, 0, 1, 1,
-0.1382002, -1.38906, -3.846592, 0, 0, 0, 1, 1,
-0.1351364, -0.2308487, -3.372412, 0, 0, 0, 1, 1,
-0.1337419, 1.058479, 0.1801353, 0, 0, 0, 1, 1,
-0.1334267, 0.5965086, -0.9844136, 0, 0, 0, 1, 1,
-0.133022, 0.0963756, -1.303096, 0, 0, 0, 1, 1,
-0.1314077, -1.041665, -2.854941, 0, 0, 0, 1, 1,
-0.1234068, -0.548526, -1.601239, 1, 1, 1, 1, 1,
-0.1229808, -1.74475, -3.556154, 1, 1, 1, 1, 1,
-0.1224802, -0.2490588, -2.854711, 1, 1, 1, 1, 1,
-0.1221295, 1.59561, 0.01799146, 1, 1, 1, 1, 1,
-0.118457, 0.5739375, 0.7878987, 1, 1, 1, 1, 1,
-0.1125224, 0.3506807, -0.3083118, 1, 1, 1, 1, 1,
-0.1100746, -0.8900292, -5.387077, 1, 1, 1, 1, 1,
-0.1053565, 0.1931605, -1.673952, 1, 1, 1, 1, 1,
-0.1047824, -0.7664243, -3.26066, 1, 1, 1, 1, 1,
-0.1042071, 0.09079814, -2.004288, 1, 1, 1, 1, 1,
-0.1031014, 2.426273, -0.7847716, 1, 1, 1, 1, 1,
-0.1011111, 0.8849149, -2.463063, 1, 1, 1, 1, 1,
-0.099635, 0.9059047, -1.145572, 1, 1, 1, 1, 1,
-0.09855573, -1.219936, -4.894656, 1, 1, 1, 1, 1,
-0.09439524, 0.4603507, 0.7809144, 1, 1, 1, 1, 1,
-0.09437622, -1.067171, -2.371789, 0, 0, 1, 1, 1,
-0.09230909, -0.3909452, -4.30458, 1, 0, 0, 1, 1,
-0.09214924, -1.491334, -2.706911, 1, 0, 0, 1, 1,
-0.09000546, -0.8486168, -4.387179, 1, 0, 0, 1, 1,
-0.08324257, 1.461644, 0.6134517, 1, 0, 0, 1, 1,
-0.08254954, 0.4391559, -0.1814184, 1, 0, 0, 1, 1,
-0.08210249, -1.562947, -2.678567, 0, 0, 0, 1, 1,
-0.07969831, 0.9424027, -1.540475, 0, 0, 0, 1, 1,
-0.0783905, 0.3745901, -1.158613, 0, 0, 0, 1, 1,
-0.07420617, -1.009019, -2.273866, 0, 0, 0, 1, 1,
-0.07338686, -0.0898554, -3.448039, 0, 0, 0, 1, 1,
-0.07277538, -0.9215167, -3.794913, 0, 0, 0, 1, 1,
-0.0708619, 0.5133415, -1.275633, 0, 0, 0, 1, 1,
-0.06763013, 0.7702217, -1.258388, 1, 1, 1, 1, 1,
-0.06226584, 0.7316146, -0.2439041, 1, 1, 1, 1, 1,
-0.05886445, 0.2165655, 1.184358, 1, 1, 1, 1, 1,
-0.05884663, -0.7336126, -3.993964, 1, 1, 1, 1, 1,
-0.05646913, 0.4393343, -2.053624, 1, 1, 1, 1, 1,
-0.0564194, 0.5313812, 0.3317957, 1, 1, 1, 1, 1,
-0.04992887, 0.4484864, -1.028792, 1, 1, 1, 1, 1,
-0.04933181, -0.7073053, -3.703299, 1, 1, 1, 1, 1,
-0.04901884, -0.5919799, -4.042944, 1, 1, 1, 1, 1,
-0.04384527, -0.7042118, -2.976976, 1, 1, 1, 1, 1,
-0.04296158, -0.4059715, -2.856527, 1, 1, 1, 1, 1,
-0.03459886, -1.596426, -1.258566, 1, 1, 1, 1, 1,
-0.03151558, -0.8601657, -1.903581, 1, 1, 1, 1, 1,
-0.02095306, -1.069791, -3.006197, 1, 1, 1, 1, 1,
-0.01662236, -1.042124, -3.27107, 1, 1, 1, 1, 1,
-0.01622607, 0.02918988, -0.407282, 0, 0, 1, 1, 1,
-0.01395644, 1.626393, 0.2137805, 1, 0, 0, 1, 1,
-0.01167266, 1.32498, -0.2371409, 1, 0, 0, 1, 1,
-0.01136131, -0.02689815, -3.383574, 1, 0, 0, 1, 1,
-0.007148552, -0.7804739, -3.151379, 1, 0, 0, 1, 1,
-0.005903884, -1.224046, -3.854724, 1, 0, 0, 1, 1,
-0.005269375, 1.228513, 1.510464, 0, 0, 0, 1, 1,
-0.003564112, -1.018292, -3.589072, 0, 0, 0, 1, 1,
-0.003486413, -0.8928921, -3.028256, 0, 0, 0, 1, 1,
0.003439988, -1.608839, 2.52978, 0, 0, 0, 1, 1,
0.004708578, -1.594467, 2.296138, 0, 0, 0, 1, 1,
0.004816873, 2.552762, 0.3841684, 0, 0, 0, 1, 1,
0.009670915, -0.2665161, 2.421948, 0, 0, 0, 1, 1,
0.01402833, 0.3454452, -2.132904, 1, 1, 1, 1, 1,
0.01801111, -1.707699, 2.191165, 1, 1, 1, 1, 1,
0.01888513, 0.3490249, -0.7438822, 1, 1, 1, 1, 1,
0.02470346, 0.7868169, 0.01059608, 1, 1, 1, 1, 1,
0.02491341, 0.2656662, -1.077911, 1, 1, 1, 1, 1,
0.02593997, -0.5454308, 3.462322, 1, 1, 1, 1, 1,
0.02969291, -0.0353978, 0.9881473, 1, 1, 1, 1, 1,
0.03056248, -0.09651275, 3.730723, 1, 1, 1, 1, 1,
0.03218971, -0.08346102, 1.924309, 1, 1, 1, 1, 1,
0.03255681, 1.234362, 0.2455029, 1, 1, 1, 1, 1,
0.0354646, 0.1469016, 0.251599, 1, 1, 1, 1, 1,
0.04216371, 2.006635, 0.4925034, 1, 1, 1, 1, 1,
0.04290779, 1.007617, -0.03204749, 1, 1, 1, 1, 1,
0.04636936, -0.3581386, 2.389792, 1, 1, 1, 1, 1,
0.04990799, 0.3407164, 0.7026188, 1, 1, 1, 1, 1,
0.05332984, -0.04558508, 2.537551, 0, 0, 1, 1, 1,
0.06157363, 0.3135308, -0.1316293, 1, 0, 0, 1, 1,
0.06204714, 0.5992581, 1.561291, 1, 0, 0, 1, 1,
0.06218877, 0.3908071, -0.4459271, 1, 0, 0, 1, 1,
0.06222526, -1.198643, 3.655046, 1, 0, 0, 1, 1,
0.06645227, -0.2876118, 2.845215, 1, 0, 0, 1, 1,
0.06667411, -0.8814305, 3.804847, 0, 0, 0, 1, 1,
0.06682242, -1.027727, 5.640489, 0, 0, 0, 1, 1,
0.06791501, -1.158119, 2.330919, 0, 0, 0, 1, 1,
0.06843585, 1.264348, -0.1949377, 0, 0, 0, 1, 1,
0.07064887, 1.068122, 2.328011, 0, 0, 0, 1, 1,
0.07287642, 0.3020094, -0.008301258, 0, 0, 0, 1, 1,
0.07500561, -0.1141587, 2.188027, 0, 0, 0, 1, 1,
0.07984541, 1.377427, 1.33793, 1, 1, 1, 1, 1,
0.0877021, 0.2464946, 1.225742, 1, 1, 1, 1, 1,
0.08812618, 1.275108, 1.176682, 1, 1, 1, 1, 1,
0.09097831, 0.1173586, 1.406397, 1, 1, 1, 1, 1,
0.09139435, -1.46255, 2.181844, 1, 1, 1, 1, 1,
0.09242747, -0.1030943, 2.658449, 1, 1, 1, 1, 1,
0.09783457, -0.04684893, 2.66613, 1, 1, 1, 1, 1,
0.09856487, 0.524417, -0.1976362, 1, 1, 1, 1, 1,
0.1004403, -0.7421163, 3.298447, 1, 1, 1, 1, 1,
0.1005318, -0.02931978, 0.1792876, 1, 1, 1, 1, 1,
0.1026348, 0.3022968, -0.2649113, 1, 1, 1, 1, 1,
0.1078269, 0.07380626, 0.4031212, 1, 1, 1, 1, 1,
0.1095923, -0.8623725, 2.95226, 1, 1, 1, 1, 1,
0.1119683, -0.1460032, 2.81918, 1, 1, 1, 1, 1,
0.114805, -0.5419036, 5.481265, 1, 1, 1, 1, 1,
0.1177127, 0.3500649, 0.219436, 0, 0, 1, 1, 1,
0.1226057, 1.292551, -0.05726652, 1, 0, 0, 1, 1,
0.1256534, -0.1078005, 1.347087, 1, 0, 0, 1, 1,
0.1303775, -0.04304151, 2.709747, 1, 0, 0, 1, 1,
0.1358672, -0.7540829, 1.97155, 1, 0, 0, 1, 1,
0.1373379, 1.453301, -0.5963539, 1, 0, 0, 1, 1,
0.1378976, 0.33858, -0.1183705, 0, 0, 0, 1, 1,
0.1432189, 1.407082, 1.316513, 0, 0, 0, 1, 1,
0.1432484, -1.170513, 2.579112, 0, 0, 0, 1, 1,
0.1454064, 0.3375152, -0.6923917, 0, 0, 0, 1, 1,
0.1481579, 0.1163558, 1.100835, 0, 0, 0, 1, 1,
0.1557018, -0.3153734, 4.584669, 0, 0, 0, 1, 1,
0.1562043, -0.5365378, 4.445144, 0, 0, 0, 1, 1,
0.1608153, -0.7261214, 3.512095, 1, 1, 1, 1, 1,
0.1658376, -2.041925, 3.590368, 1, 1, 1, 1, 1,
0.1675149, -0.299762, 3.917803, 1, 1, 1, 1, 1,
0.1684947, -0.1966517, 1.905901, 1, 1, 1, 1, 1,
0.169557, -1.442695, 2.860131, 1, 1, 1, 1, 1,
0.1745329, -1.238917, 2.838497, 1, 1, 1, 1, 1,
0.1757433, -0.543174, 2.348015, 1, 1, 1, 1, 1,
0.1759251, -0.1445111, 2.792403, 1, 1, 1, 1, 1,
0.1768572, 0.889896, -1.340876, 1, 1, 1, 1, 1,
0.1803768, 0.6196976, -0.9288892, 1, 1, 1, 1, 1,
0.1847288, 1.075083, -0.419652, 1, 1, 1, 1, 1,
0.1934126, 0.1150888, 0.1289126, 1, 1, 1, 1, 1,
0.1961241, -1.902839, 4.121095, 1, 1, 1, 1, 1,
0.1966544, -2.519023, 3.376406, 1, 1, 1, 1, 1,
0.2024112, 0.04629067, 3.437665, 1, 1, 1, 1, 1,
0.2042981, 1.270109, 1.202214, 0, 0, 1, 1, 1,
0.205217, 0.5637131, 1.259461, 1, 0, 0, 1, 1,
0.2123969, 0.4334497, 2.014126, 1, 0, 0, 1, 1,
0.2129046, 0.2404318, 1.004955, 1, 0, 0, 1, 1,
0.2155519, -0.1795644, 2.798955, 1, 0, 0, 1, 1,
0.2181002, 0.1729237, -0.3830266, 1, 0, 0, 1, 1,
0.2189202, 1.071466, 1.944288, 0, 0, 0, 1, 1,
0.2206107, 1.279269, -0.266671, 0, 0, 0, 1, 1,
0.2218522, -2.052395, 4.076237, 0, 0, 0, 1, 1,
0.2252638, 0.5180469, -0.144385, 0, 0, 0, 1, 1,
0.2299567, -0.01598625, 0.1487991, 0, 0, 0, 1, 1,
0.2353798, 0.6496632, 0.5215918, 0, 0, 0, 1, 1,
0.2369646, 0.1271555, 1.500559, 0, 0, 0, 1, 1,
0.239754, -0.7318828, 4.157017, 1, 1, 1, 1, 1,
0.240588, 0.9140667, -0.9629027, 1, 1, 1, 1, 1,
0.24179, -0.362878, 1.961802, 1, 1, 1, 1, 1,
0.2477194, 1.218726, -0.5841325, 1, 1, 1, 1, 1,
0.2514059, 1.008121, -0.5754787, 1, 1, 1, 1, 1,
0.2526511, 0.717227, -1.177892, 1, 1, 1, 1, 1,
0.2534218, 1.42337, 0.8944671, 1, 1, 1, 1, 1,
0.2543729, -0.1139699, 1.36155, 1, 1, 1, 1, 1,
0.2555157, -0.3172481, 2.210474, 1, 1, 1, 1, 1,
0.2582474, 0.7564493, 0.9495357, 1, 1, 1, 1, 1,
0.2622522, -0.3755117, 2.764305, 1, 1, 1, 1, 1,
0.2628001, 0.851546, -1.349382, 1, 1, 1, 1, 1,
0.26297, 0.06244479, 1.487313, 1, 1, 1, 1, 1,
0.2657899, -0.6402869, 3.97098, 1, 1, 1, 1, 1,
0.2663195, 0.3889964, 0.6033516, 1, 1, 1, 1, 1,
0.2675917, 0.7131563, 1.884039, 0, 0, 1, 1, 1,
0.2719803, -1.223757, 2.326721, 1, 0, 0, 1, 1,
0.2736582, 0.5948655, 1.285376, 1, 0, 0, 1, 1,
0.2753577, -0.3620693, 2.01288, 1, 0, 0, 1, 1,
0.2758387, 0.2166968, 1.042808, 1, 0, 0, 1, 1,
0.2768726, 0.8971807, 1.16871, 1, 0, 0, 1, 1,
0.2770434, -1.433714, 2.883003, 0, 0, 0, 1, 1,
0.2842676, 0.7249056, -0.9022993, 0, 0, 0, 1, 1,
0.2858886, 0.9192016, 1.744186, 0, 0, 0, 1, 1,
0.2924518, -1.713152, 2.390536, 0, 0, 0, 1, 1,
0.2927532, 0.04120296, 1.76398, 0, 0, 0, 1, 1,
0.2986859, 0.8689891, 2.247073, 0, 0, 0, 1, 1,
0.2987332, 0.7603918, 1.010177, 0, 0, 0, 1, 1,
0.3057938, -0.8405612, 3.130806, 1, 1, 1, 1, 1,
0.3071059, 0.7318868, -0.4580411, 1, 1, 1, 1, 1,
0.3078418, 2.181591, 1.569857, 1, 1, 1, 1, 1,
0.310148, 0.5108234, 0.4889592, 1, 1, 1, 1, 1,
0.3143661, -1.549643, 2.780541, 1, 1, 1, 1, 1,
0.3152113, 1.287623, -0.02556156, 1, 1, 1, 1, 1,
0.3166046, 1.240818, 1.113626, 1, 1, 1, 1, 1,
0.3237626, 0.07968999, 0.7862905, 1, 1, 1, 1, 1,
0.3239976, 0.9226408, 0.7404726, 1, 1, 1, 1, 1,
0.3261206, -1.214741, 2.566343, 1, 1, 1, 1, 1,
0.3283217, 0.1229177, -0.06080631, 1, 1, 1, 1, 1,
0.3294884, 0.1751274, 0.6959448, 1, 1, 1, 1, 1,
0.3296166, -1.409765, 2.394524, 1, 1, 1, 1, 1,
0.3316965, 0.4971557, 0.8059475, 1, 1, 1, 1, 1,
0.3327798, 0.09681159, 0.5717601, 1, 1, 1, 1, 1,
0.3342611, 1.011286, 0.4651457, 0, 0, 1, 1, 1,
0.3380394, -0.4749004, 2.955917, 1, 0, 0, 1, 1,
0.3380896, 0.1566934, 2.79328, 1, 0, 0, 1, 1,
0.3392986, 2.117326, 0.7647714, 1, 0, 0, 1, 1,
0.339337, 1.543225, 0.2720085, 1, 0, 0, 1, 1,
0.3428428, 0.6409003, 0.7368193, 1, 0, 0, 1, 1,
0.3432488, -0.9044182, 0.8712033, 0, 0, 0, 1, 1,
0.3504478, -0.2941473, 1.444035, 0, 0, 0, 1, 1,
0.3547883, -0.842275, 2.799909, 0, 0, 0, 1, 1,
0.3565247, 0.6447348, -0.4874368, 0, 0, 0, 1, 1,
0.3582069, -0.2043579, 2.224549, 0, 0, 0, 1, 1,
0.3665018, 0.6775926, -0.06674285, 0, 0, 0, 1, 1,
0.3695226, 0.9906396, 0.4601891, 0, 0, 0, 1, 1,
0.3721027, -0.005720402, 2.508793, 1, 1, 1, 1, 1,
0.3732712, -2.117957, 1.183895, 1, 1, 1, 1, 1,
0.3736925, 0.8133028, 0.1526542, 1, 1, 1, 1, 1,
0.3821306, -0.1941947, 3.796917, 1, 1, 1, 1, 1,
0.3822928, 0.2544796, 1.427467, 1, 1, 1, 1, 1,
0.3892289, 0.1203531, 2.368721, 1, 1, 1, 1, 1,
0.3914223, 0.04161291, 1.564339, 1, 1, 1, 1, 1,
0.4091586, 0.9206822, 0.8084019, 1, 1, 1, 1, 1,
0.4112849, 1.097878, -0.8329281, 1, 1, 1, 1, 1,
0.425976, -0.5590147, 2.637351, 1, 1, 1, 1, 1,
0.4260842, -1.074374, 3.8385, 1, 1, 1, 1, 1,
0.4267712, -0.1876422, 3.491233, 1, 1, 1, 1, 1,
0.4290681, -0.3091819, 2.979792, 1, 1, 1, 1, 1,
0.43001, 1.745617, 0.5202801, 1, 1, 1, 1, 1,
0.4315535, -0.3489529, 1.327194, 1, 1, 1, 1, 1,
0.4577399, 0.2628156, 0.160294, 0, 0, 1, 1, 1,
0.461386, -0.4262882, 2.43615, 1, 0, 0, 1, 1,
0.4616905, -0.2349592, 2.360587, 1, 0, 0, 1, 1,
0.4647873, 0.1567444, 3.23978, 1, 0, 0, 1, 1,
0.4657061, -1.896768, 4.205745, 1, 0, 0, 1, 1,
0.47028, -3.038282, 2.405618, 1, 0, 0, 1, 1,
0.4720175, 0.8714507, 0.3789259, 0, 0, 0, 1, 1,
0.4723335, 0.2275544, 2.052946, 0, 0, 0, 1, 1,
0.4773041, -0.4316869, 2.568747, 0, 0, 0, 1, 1,
0.4825127, 1.197142, 1.682284, 0, 0, 0, 1, 1,
0.4825863, -0.1705396, 0.5017227, 0, 0, 0, 1, 1,
0.4833036, 1.30152, 0.3366285, 0, 0, 0, 1, 1,
0.4862102, 0.2829901, 0.3815982, 0, 0, 0, 1, 1,
0.4876673, -0.746231, 2.03405, 1, 1, 1, 1, 1,
0.4908379, 0.7217597, 0.9223081, 1, 1, 1, 1, 1,
0.4930779, -2.285302, 2.306147, 1, 1, 1, 1, 1,
0.4989153, -2.373481, 3.362198, 1, 1, 1, 1, 1,
0.5011213, -0.932663, 2.659363, 1, 1, 1, 1, 1,
0.5061111, -0.1582732, 0.615334, 1, 1, 1, 1, 1,
0.5076742, -1.260196, 2.525321, 1, 1, 1, 1, 1,
0.5079602, 1.432598, 0.7208501, 1, 1, 1, 1, 1,
0.5115532, 0.8355113, 0.154945, 1, 1, 1, 1, 1,
0.5141522, 1.574974, 0.2989953, 1, 1, 1, 1, 1,
0.5176381, -0.07177558, 2.903056, 1, 1, 1, 1, 1,
0.5216008, -0.3908359, 3.634316, 1, 1, 1, 1, 1,
0.5227389, -0.2829754, 1.482219, 1, 1, 1, 1, 1,
0.5231554, -2.210274, 2.137181, 1, 1, 1, 1, 1,
0.5255502, -0.2606664, 0.7568763, 1, 1, 1, 1, 1,
0.5282795, -0.483466, 3.958434, 0, 0, 1, 1, 1,
0.534382, -0.2514518, 4.006773, 1, 0, 0, 1, 1,
0.5382004, 0.9066954, -0.4222841, 1, 0, 0, 1, 1,
0.5414109, -1.188937, 2.321206, 1, 0, 0, 1, 1,
0.5425444, -0.3058959, 1.316566, 1, 0, 0, 1, 1,
0.5429849, -0.7456995, 4.94192, 1, 0, 0, 1, 1,
0.544516, 0.03244784, 0.9034233, 0, 0, 0, 1, 1,
0.5464221, -1.202598, 4.544934, 0, 0, 0, 1, 1,
0.5467302, -1.913203, 4.073954, 0, 0, 0, 1, 1,
0.5498585, -0.7731165, 2.841913, 0, 0, 0, 1, 1,
0.5530013, -1.207677, 4.060806, 0, 0, 0, 1, 1,
0.5530447, 0.5376975, 0.5378937, 0, 0, 0, 1, 1,
0.5538526, 0.4002644, -0.3059115, 0, 0, 0, 1, 1,
0.5554658, 1.512313, 0.3025231, 1, 1, 1, 1, 1,
0.5569288, -1.271701, 2.903569, 1, 1, 1, 1, 1,
0.5570554, -1.309174, 3.444477, 1, 1, 1, 1, 1,
0.5579104, 2.30038, 1.061569, 1, 1, 1, 1, 1,
0.5669032, 0.3591245, 1.59352, 1, 1, 1, 1, 1,
0.5696447, -0.3420651, 3.332741, 1, 1, 1, 1, 1,
0.5752684, 1.662717, 0.1785438, 1, 1, 1, 1, 1,
0.5791292, -0.526904, 2.612965, 1, 1, 1, 1, 1,
0.5864272, 1.35208, 1.024104, 1, 1, 1, 1, 1,
0.5897954, -1.271995, 3.624418, 1, 1, 1, 1, 1,
0.5916693, -0.1754026, 4.054883, 1, 1, 1, 1, 1,
0.6003052, 0.02222821, 1.33956, 1, 1, 1, 1, 1,
0.6027921, 0.2548018, 1.656415, 1, 1, 1, 1, 1,
0.6050057, -1.551036, 3.009195, 1, 1, 1, 1, 1,
0.6077933, -1.466396, 4.450819, 1, 1, 1, 1, 1,
0.6115578, 0.5438231, 1.481154, 0, 0, 1, 1, 1,
0.613197, -0.7021213, 2.819245, 1, 0, 0, 1, 1,
0.6151506, -1.001739, 0.6593219, 1, 0, 0, 1, 1,
0.6153873, 0.4455459, 0.2904157, 1, 0, 0, 1, 1,
0.616616, -2.925724, 2.938757, 1, 0, 0, 1, 1,
0.6171772, 1.370234, 0.6508582, 1, 0, 0, 1, 1,
0.6178265, 3.384851, 0.1950013, 0, 0, 0, 1, 1,
0.6198825, -0.0707259, 0.9212386, 0, 0, 0, 1, 1,
0.6219763, 2.221259, 0.9472517, 0, 0, 0, 1, 1,
0.6270586, 0.714559, 0.197166, 0, 0, 0, 1, 1,
0.6292748, 1.845917, -0.9111768, 0, 0, 0, 1, 1,
0.6353637, -1.192471, 1.185776, 0, 0, 0, 1, 1,
0.6367654, -0.2702438, 2.210986, 0, 0, 0, 1, 1,
0.6380864, -0.5337788, 1.373009, 1, 1, 1, 1, 1,
0.638105, -0.8230165, 3.196536, 1, 1, 1, 1, 1,
0.6402969, -0.1226254, 3.146494, 1, 1, 1, 1, 1,
0.6528928, -0.6618672, 1.530656, 1, 1, 1, 1, 1,
0.6574377, 0.6188304, 1.725561, 1, 1, 1, 1, 1,
0.6639633, 0.2953208, 1.114106, 1, 1, 1, 1, 1,
0.6662362, 2.639784, 0.7734565, 1, 1, 1, 1, 1,
0.6720005, -0.3863636, 1.286614, 1, 1, 1, 1, 1,
0.6825703, -0.6535898, 0.452607, 1, 1, 1, 1, 1,
0.6866601, 0.002018855, -0.3953774, 1, 1, 1, 1, 1,
0.6889817, -2.349241, 1.109421, 1, 1, 1, 1, 1,
0.6918802, -0.7779262, 1.130427, 1, 1, 1, 1, 1,
0.6955988, -0.009097505, 1.77274, 1, 1, 1, 1, 1,
0.7004352, 0.4492624, 1.662384, 1, 1, 1, 1, 1,
0.7020428, -0.4171993, 0.6065543, 1, 1, 1, 1, 1,
0.7033604, 0.7110366, 2.366909, 0, 0, 1, 1, 1,
0.7053416, 0.2950257, 1.233267, 1, 0, 0, 1, 1,
0.7139688, 1.587592, 0.07487547, 1, 0, 0, 1, 1,
0.7184395, 1.434909, 1.799069, 1, 0, 0, 1, 1,
0.7227112, 0.2622157, 1.689984, 1, 0, 0, 1, 1,
0.7269882, 0.4619414, -0.9264533, 1, 0, 0, 1, 1,
0.7350509, -1.592131, 2.354932, 0, 0, 0, 1, 1,
0.7376382, 1.232559, 1.434039, 0, 0, 0, 1, 1,
0.7384865, -1.446056, 4.333235, 0, 0, 0, 1, 1,
0.738746, -0.4593389, 1.796642, 0, 0, 0, 1, 1,
0.7393726, -0.08519109, 0.9735238, 0, 0, 0, 1, 1,
0.7446595, 0.2056721, 0.7412974, 0, 0, 0, 1, 1,
0.7447627, 0.4137042, 0.1149408, 0, 0, 0, 1, 1,
0.752386, 0.3056992, 0.6202849, 1, 1, 1, 1, 1,
0.7571665, -0.474547, 2.8101, 1, 1, 1, 1, 1,
0.7601019, 0.2744062, 1.82589, 1, 1, 1, 1, 1,
0.7641113, 0.2318677, 0.6483086, 1, 1, 1, 1, 1,
0.7707074, -1.002978, 0.405126, 1, 1, 1, 1, 1,
0.7747286, -0.06083168, 0.926097, 1, 1, 1, 1, 1,
0.7763805, 0.7468585, -0.5146109, 1, 1, 1, 1, 1,
0.7799685, 0.3687762, 2.112048, 1, 1, 1, 1, 1,
0.7802722, 0.0703553, 0.6074818, 1, 1, 1, 1, 1,
0.7845888, 2.458345, 0.3131638, 1, 1, 1, 1, 1,
0.7854441, -0.02490265, 0.6797368, 1, 1, 1, 1, 1,
0.787854, 0.08440571, 0.9779878, 1, 1, 1, 1, 1,
0.7880394, 0.2852131, 1.271787, 1, 1, 1, 1, 1,
0.7896142, 1.219379, 0.8315721, 1, 1, 1, 1, 1,
0.7909169, -1.021831, 3.235698, 1, 1, 1, 1, 1,
0.7913697, 0.6627195, 1.487744, 0, 0, 1, 1, 1,
0.794459, -0.171509, 1.603305, 1, 0, 0, 1, 1,
0.7971007, 0.5214289, 1.838955, 1, 0, 0, 1, 1,
0.8017537, 0.1026875, 1.028521, 1, 0, 0, 1, 1,
0.8030466, 0.57947, 0.6907128, 1, 0, 0, 1, 1,
0.8057803, -0.08230714, 3.214704, 1, 0, 0, 1, 1,
0.8090956, 1.933458, 0.3035504, 0, 0, 0, 1, 1,
0.8104641, 0.8834587, -0.5296962, 0, 0, 0, 1, 1,
0.8151655, 1.948476, -0.5040367, 0, 0, 0, 1, 1,
0.830384, -2.23596, 2.558071, 0, 0, 0, 1, 1,
0.8332145, 0.06999686, 3.669988, 0, 0, 0, 1, 1,
0.8339006, 0.1012201, 0.2540813, 0, 0, 0, 1, 1,
0.8434864, -1.790523, 3.179688, 0, 0, 0, 1, 1,
0.8447757, 0.1616686, 1.13536, 1, 1, 1, 1, 1,
0.8496954, -0.6114847, 2.395154, 1, 1, 1, 1, 1,
0.8497224, 0.982321, 1.142004, 1, 1, 1, 1, 1,
0.8506449, -0.411608, 1.044263, 1, 1, 1, 1, 1,
0.8538672, -0.7921658, 3.523587, 1, 1, 1, 1, 1,
0.8542413, -1.146186, 4.196573, 1, 1, 1, 1, 1,
0.8584216, -1.387449, 2.75052, 1, 1, 1, 1, 1,
0.8635402, -2.193459, 2.597185, 1, 1, 1, 1, 1,
0.8767486, -0.3575764, 0.4639131, 1, 1, 1, 1, 1,
0.8794371, 1.5711, -0.9908422, 1, 1, 1, 1, 1,
0.8843461, -1.033706, 1.700199, 1, 1, 1, 1, 1,
0.8874082, -1.530351, 2.480263, 1, 1, 1, 1, 1,
0.8874952, 0.4757874, 1.355772, 1, 1, 1, 1, 1,
0.8913386, 0.4991143, 0.07028384, 1, 1, 1, 1, 1,
0.8987612, -0.8067501, 1.375649, 1, 1, 1, 1, 1,
0.9056209, 0.4676522, 0.9217992, 0, 0, 1, 1, 1,
0.9059424, 0.02924526, 1.892798, 1, 0, 0, 1, 1,
0.9087692, -0.5706353, 4.095638, 1, 0, 0, 1, 1,
0.9090633, -0.003737405, 1.994491, 1, 0, 0, 1, 1,
0.9141126, -0.3488637, 4.874198, 1, 0, 0, 1, 1,
0.9210321, 0.09641431, 1.449011, 1, 0, 0, 1, 1,
0.9231464, -0.445987, -0.5010222, 0, 0, 0, 1, 1,
0.9368588, 1.095001, 0.1020577, 0, 0, 0, 1, 1,
0.9372682, 1.261498, -0.638449, 0, 0, 0, 1, 1,
0.9374795, 1.579199, 0.3030567, 0, 0, 0, 1, 1,
0.938825, 0.2747776, -0.2267168, 0, 0, 0, 1, 1,
0.9444098, -0.6615786, 3.079858, 0, 0, 0, 1, 1,
0.9470937, -0.1058162, 1.536903, 0, 0, 0, 1, 1,
0.9581483, 0.9391909, -0.5070966, 1, 1, 1, 1, 1,
0.9618897, -0.8555739, 1.316951, 1, 1, 1, 1, 1,
0.9739602, 1.230816, -1.417488, 1, 1, 1, 1, 1,
0.9743019, 0.5592439, 0.2657301, 1, 1, 1, 1, 1,
0.9758282, 0.04605591, 0.3697482, 1, 1, 1, 1, 1,
0.9775384, 0.6598134, -0.4249377, 1, 1, 1, 1, 1,
0.9794215, 1.880516, 0.6473594, 1, 1, 1, 1, 1,
0.9797497, 0.7575085, 0.2470559, 1, 1, 1, 1, 1,
0.9835068, -1.987436, 2.151677, 1, 1, 1, 1, 1,
0.9838612, -0.3760237, 2.617662, 1, 1, 1, 1, 1,
1.003162, 0.1222291, 1.426675, 1, 1, 1, 1, 1,
1.004119, -1.647533, 1.716838, 1, 1, 1, 1, 1,
1.006282, -1.002584, 2.313418, 1, 1, 1, 1, 1,
1.00756, 0.3790736, 0.8268468, 1, 1, 1, 1, 1,
1.016711, -1.838663, 3.157815, 1, 1, 1, 1, 1,
1.023272, -1.178028, 0.5724261, 0, 0, 1, 1, 1,
1.023894, -0.6255002, 3.700899, 1, 0, 0, 1, 1,
1.024805, 1.040238, 2.584857, 1, 0, 0, 1, 1,
1.034997, 0.4167158, 2.305871, 1, 0, 0, 1, 1,
1.041724, -1.561879, 3.12419, 1, 0, 0, 1, 1,
1.047934, -0.5442064, 3.216214, 1, 0, 0, 1, 1,
1.048774, 0.3299686, 2.147665, 0, 0, 0, 1, 1,
1.052466, -0.5371307, 0.5009497, 0, 0, 0, 1, 1,
1.063147, 2.087813, 1.637518, 0, 0, 0, 1, 1,
1.066623, -0.6711268, 2.3119, 0, 0, 0, 1, 1,
1.075202, 0.616901, 1.928784, 0, 0, 0, 1, 1,
1.081265, 0.9281678, 2.362731, 0, 0, 0, 1, 1,
1.085308, -0.7333052, 3.347883, 0, 0, 0, 1, 1,
1.088869, 0.122106, 1.113242, 1, 1, 1, 1, 1,
1.090419, -1.46422, 2.64819, 1, 1, 1, 1, 1,
1.095091, -0.5561737, 1.647568, 1, 1, 1, 1, 1,
1.099422, -0.5784729, 2.291121, 1, 1, 1, 1, 1,
1.100736, -0.3953448, 1.981369, 1, 1, 1, 1, 1,
1.103385, 0.9377326, 0.9658812, 1, 1, 1, 1, 1,
1.104433, 0.5207301, 1.603889, 1, 1, 1, 1, 1,
1.105888, -1.184046, 4.083196, 1, 1, 1, 1, 1,
1.106544, -0.8461918, 3.784294, 1, 1, 1, 1, 1,
1.106673, -0.9545619, 3.795624, 1, 1, 1, 1, 1,
1.106912, -1.63022, 1.546394, 1, 1, 1, 1, 1,
1.108945, 1.972531, 0.1478654, 1, 1, 1, 1, 1,
1.110573, 0.8783402, -2.233401, 1, 1, 1, 1, 1,
1.111479, 0.780139, 0.3813287, 1, 1, 1, 1, 1,
1.115748, 0.9399037, 1.252233, 1, 1, 1, 1, 1,
1.11979, -2.144018, 2.156188, 0, 0, 1, 1, 1,
1.120566, 2.844677, 2.245528, 1, 0, 0, 1, 1,
1.123255, -1.139202, 3.914936, 1, 0, 0, 1, 1,
1.126327, 0.6023859, 0.9757569, 1, 0, 0, 1, 1,
1.134588, -0.1027242, 2.967602, 1, 0, 0, 1, 1,
1.135789, 0.8339064, 1.617111, 1, 0, 0, 1, 1,
1.142939, 2.278984, 0.0940434, 0, 0, 0, 1, 1,
1.14346, -0.7776334, 1.359046, 0, 0, 0, 1, 1,
1.150975, 0.2574082, 1.258898, 0, 0, 0, 1, 1,
1.158236, 0.3724315, 0.5227629, 0, 0, 0, 1, 1,
1.162725, 0.2839077, 1.080675, 0, 0, 0, 1, 1,
1.164236, -0.2043169, 0.8609412, 0, 0, 0, 1, 1,
1.168088, -1.30767, 2.218666, 0, 0, 0, 1, 1,
1.170106, 0.2050779, 2.323338, 1, 1, 1, 1, 1,
1.172191, 0.5246658, 0.4487855, 1, 1, 1, 1, 1,
1.19148, -0.5199312, 3.21488, 1, 1, 1, 1, 1,
1.194129, -0.632056, 1.995587, 1, 1, 1, 1, 1,
1.194882, -1.512126, 2.021477, 1, 1, 1, 1, 1,
1.198292, -0.9733177, 2.460458, 1, 1, 1, 1, 1,
1.200867, 1.518474, 0.3281964, 1, 1, 1, 1, 1,
1.213778, 0.1434632, 1.550567, 1, 1, 1, 1, 1,
1.214023, 0.3217355, 1.341939, 1, 1, 1, 1, 1,
1.214465, -1.151652, 2.949644, 1, 1, 1, 1, 1,
1.217793, 0.9317581, 0.6180061, 1, 1, 1, 1, 1,
1.219801, 0.0259491, 2.91036, 1, 1, 1, 1, 1,
1.226046, -0.5048906, 1.762052, 1, 1, 1, 1, 1,
1.227598, 0.4804835, 1.992629, 1, 1, 1, 1, 1,
1.233784, 0.6861897, 1.320009, 1, 1, 1, 1, 1,
1.234647, -0.325231, 3.391504, 0, 0, 1, 1, 1,
1.2357, -0.1140889, 2.317963, 1, 0, 0, 1, 1,
1.238521, 0.4234432, 2.319471, 1, 0, 0, 1, 1,
1.245008, -0.07973009, 1.841739, 1, 0, 0, 1, 1,
1.249255, 1.026251, 2.50346, 1, 0, 0, 1, 1,
1.255751, -0.7656463, 4.299832, 1, 0, 0, 1, 1,
1.270865, 0.1761365, 1.32526, 0, 0, 0, 1, 1,
1.275787, -0.66124, 0.06856585, 0, 0, 0, 1, 1,
1.291753, 0.1739714, 2.560246, 0, 0, 0, 1, 1,
1.296064, -0.9045703, 2.972001, 0, 0, 0, 1, 1,
1.297369, -0.5325825, 1.999845, 0, 0, 0, 1, 1,
1.303023, 1.192939, 1.29558, 0, 0, 0, 1, 1,
1.304802, -0.9315209, 4.04561, 0, 0, 0, 1, 1,
1.304869, 1.992584, 1.535728, 1, 1, 1, 1, 1,
1.311021, -0.1093293, 2.641147, 1, 1, 1, 1, 1,
1.325012, -0.4992125, 1.551891, 1, 1, 1, 1, 1,
1.325994, 0.6637009, 0.5228084, 1, 1, 1, 1, 1,
1.333402, -0.5994008, 0.4567984, 1, 1, 1, 1, 1,
1.339284, 1.470283, -1.489277, 1, 1, 1, 1, 1,
1.340423, 0.1629987, 1.619265, 1, 1, 1, 1, 1,
1.341061, 0.8780356, 0.5207284, 1, 1, 1, 1, 1,
1.359554, 0.4024749, 0.2458363, 1, 1, 1, 1, 1,
1.366571, -0.7580367, 0.8565878, 1, 1, 1, 1, 1,
1.375524, 0.5531237, 1.265704, 1, 1, 1, 1, 1,
1.378707, -0.5604349, 0.1760669, 1, 1, 1, 1, 1,
1.387418, -0.4917974, 2.770683, 1, 1, 1, 1, 1,
1.388275, -0.0326226, 1.336181, 1, 1, 1, 1, 1,
1.391937, 0.4683982, 4.201533, 1, 1, 1, 1, 1,
1.405552, -1.347737, 3.954507, 0, 0, 1, 1, 1,
1.418278, 0.06508877, 1.472892, 1, 0, 0, 1, 1,
1.419162, -0.7108796, 1.088634, 1, 0, 0, 1, 1,
1.424128, 0.2926742, 1.521951, 1, 0, 0, 1, 1,
1.424448, -0.005564029, 2.445039, 1, 0, 0, 1, 1,
1.436811, 0.8929095, 0.8590899, 1, 0, 0, 1, 1,
1.43751, -0.1650584, 1.867785, 0, 0, 0, 1, 1,
1.447407, 1.053042, 2.95262, 0, 0, 0, 1, 1,
1.460279, 0.8731242, 2.861276, 0, 0, 0, 1, 1,
1.464185, -0.6518117, 0.8037851, 0, 0, 0, 1, 1,
1.517727, -0.5357015, 1.591591, 0, 0, 0, 1, 1,
1.519928, -0.8042067, 1.426634, 0, 0, 0, 1, 1,
1.520058, 1.198683, 2.277314, 0, 0, 0, 1, 1,
1.526842, 0.6175589, 1.337009, 1, 1, 1, 1, 1,
1.546465, 0.0271096, 1.882383, 1, 1, 1, 1, 1,
1.555181, 0.3636092, 0.8000984, 1, 1, 1, 1, 1,
1.568687, 0.5070632, 1.062995, 1, 1, 1, 1, 1,
1.5833, -1.515012, 2.259097, 1, 1, 1, 1, 1,
1.602857, 1.274174, 1.312852, 1, 1, 1, 1, 1,
1.604963, 3.288198, -2.098526, 1, 1, 1, 1, 1,
1.61034, -0.3481574, 2.912758, 1, 1, 1, 1, 1,
1.620482, 0.3911035, 0.7108864, 1, 1, 1, 1, 1,
1.620924, -2.619817, 0.8401775, 1, 1, 1, 1, 1,
1.629355, 0.9662334, -0.2551103, 1, 1, 1, 1, 1,
1.636444, -1.572038, 2.723831, 1, 1, 1, 1, 1,
1.638135, -0.6239934, 0.4941331, 1, 1, 1, 1, 1,
1.662376, -0.2553597, 2.299148, 1, 1, 1, 1, 1,
1.676151, -0.7710803, 0.4749826, 1, 1, 1, 1, 1,
1.676949, -1.438211, 4.260281, 0, 0, 1, 1, 1,
1.680827, -0.4215606, 2.153655, 1, 0, 0, 1, 1,
1.685297, -0.1750679, 1.769585, 1, 0, 0, 1, 1,
1.695805, -2.634832, 1.929167, 1, 0, 0, 1, 1,
1.700386, -0.7654101, 1.475226, 1, 0, 0, 1, 1,
1.709379, -0.1551505, 1.894465, 1, 0, 0, 1, 1,
1.714203, -0.5731437, 2.2085, 0, 0, 0, 1, 1,
1.715395, -0.003914625, 2.811571, 0, 0, 0, 1, 1,
1.719069, -0.705501, 2.315423, 0, 0, 0, 1, 1,
1.723887, 0.2721612, 2.648588, 0, 0, 0, 1, 1,
1.725942, -1.041193, 1.07851, 0, 0, 0, 1, 1,
1.743574, -1.051293, 1.724498, 0, 0, 0, 1, 1,
1.751205, 0.6047412, 0.4178136, 0, 0, 0, 1, 1,
1.798951, 1.247365, 1.994714, 1, 1, 1, 1, 1,
1.803106, -0.2505811, 0.7810156, 1, 1, 1, 1, 1,
1.806967, 0.3802114, 1.269021, 1, 1, 1, 1, 1,
1.821287, 2.497715, 2.930333, 1, 1, 1, 1, 1,
1.841419, 0.3879642, 1.989097, 1, 1, 1, 1, 1,
1.854436, -0.6824118, 2.905684, 1, 1, 1, 1, 1,
1.912877, 0.8301145, 0.5771908, 1, 1, 1, 1, 1,
1.913307, -0.9337283, 1.483502, 1, 1, 1, 1, 1,
1.928688, 0.2560503, 2.535768, 1, 1, 1, 1, 1,
1.928955, -1.19033, 2.233562, 1, 1, 1, 1, 1,
1.936713, 1.582885, 0.9627837, 1, 1, 1, 1, 1,
1.942042, 1.422324, 1.452678, 1, 1, 1, 1, 1,
1.948302, 1.549262, 0.6280622, 1, 1, 1, 1, 1,
1.968797, 1.502036, -1.488121, 1, 1, 1, 1, 1,
1.978412, -0.3949439, 1.368374, 1, 1, 1, 1, 1,
1.98548, -0.09915063, 0.753085, 0, 0, 1, 1, 1,
1.989246, 0.3020362, 1.500625, 1, 0, 0, 1, 1,
2.01317, 0.4823211, 2.415484, 1, 0, 0, 1, 1,
2.08353, 0.3052573, 0.9970866, 1, 0, 0, 1, 1,
2.169629, -1.891025, 3.52639, 1, 0, 0, 1, 1,
2.183928, 0.8439094, 0.5274327, 1, 0, 0, 1, 1,
2.197273, -0.2417165, 2.295975, 0, 0, 0, 1, 1,
2.257224, -0.1582278, 0.5207484, 0, 0, 0, 1, 1,
2.27501, -1.428641, 0.9695312, 0, 0, 0, 1, 1,
2.311544, 0.5783687, -0.7666778, 0, 0, 0, 1, 1,
2.337235, 1.001004, 2.37232, 0, 0, 0, 1, 1,
2.381539, -1.469299, 1.274569, 0, 0, 0, 1, 1,
2.533661, -0.6467422, 3.419447, 0, 0, 0, 1, 1,
2.57402, 0.09566194, 2.228117, 1, 1, 1, 1, 1,
2.775491, 1.372543, 1.288411, 1, 1, 1, 1, 1,
2.805367, -0.7448904, 1.941127, 1, 1, 1, 1, 1,
2.938686, 0.9167354, 0.4173671, 1, 1, 1, 1, 1,
2.939041, -0.3384732, -1.72426, 1, 1, 1, 1, 1,
3.094612, 0.2349911, 2.568062, 1, 1, 1, 1, 1,
3.184765, -1.902323, 3.003681, 1, 1, 1, 1, 1
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
var radius = 9.84268;
var distance = 34.57199;
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
mvMatrix.translate( 0.1327147, -0.1732843, -0.0308876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57199);
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
