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
-3.670793, 0.7977238, -0.9995012, 1, 0, 0, 1,
-3.067921, -0.165608, -1.13737, 1, 0.007843138, 0, 1,
-2.849446, -0.6552636, 0.24081, 1, 0.01176471, 0, 1,
-2.590649, 1.007473, -3.452992, 1, 0.01960784, 0, 1,
-2.468215, -0.904199, -2.174818, 1, 0.02352941, 0, 1,
-2.444549, 0.6929315, -0.4322805, 1, 0.03137255, 0, 1,
-2.435954, 0.982072, -1.560502, 1, 0.03529412, 0, 1,
-2.409979, -0.4315291, -0.4843732, 1, 0.04313726, 0, 1,
-2.397772, -1.205844, -3.895214, 1, 0.04705882, 0, 1,
-2.387176, -1.104805, -2.257422, 1, 0.05490196, 0, 1,
-2.359929, -0.0205344, -1.06228, 1, 0.05882353, 0, 1,
-2.359249, 0.9012049, -0.4610918, 1, 0.06666667, 0, 1,
-2.172092, 0.09967741, -2.119404, 1, 0.07058824, 0, 1,
-2.163946, -1.651244, -2.462873, 1, 0.07843138, 0, 1,
-2.113252, 0.3913043, -0.3295724, 1, 0.08235294, 0, 1,
-2.112347, 1.194276, 0.05100109, 1, 0.09019608, 0, 1,
-2.078858, 1.583209, -1.820806, 1, 0.09411765, 0, 1,
-2.066083, 1.376504, -1.277728, 1, 0.1019608, 0, 1,
-2.043544, 0.9054896, -0.8839383, 1, 0.1098039, 0, 1,
-2.026719, 1.128501, -2.294021, 1, 0.1137255, 0, 1,
-2.020705, 1.146802, -0.9955648, 1, 0.1215686, 0, 1,
-1.969762, -1.987198, -3.31597, 1, 0.1254902, 0, 1,
-1.959197, -0.9272054, -1.214654, 1, 0.1333333, 0, 1,
-1.909851, 1.109526, 0.2716746, 1, 0.1372549, 0, 1,
-1.903168, -0.7636992, -1.839174, 1, 0.145098, 0, 1,
-1.874287, -0.2978023, -2.171043, 1, 0.1490196, 0, 1,
-1.848727, -1.684625, -2.012175, 1, 0.1568628, 0, 1,
-1.844116, 0.6423713, 0.3450853, 1, 0.1607843, 0, 1,
-1.8372, 0.5260408, -1.060231, 1, 0.1686275, 0, 1,
-1.836175, -0.4711092, -2.148595, 1, 0.172549, 0, 1,
-1.833881, 0.1360731, -3.602035, 1, 0.1803922, 0, 1,
-1.822175, -2.388394, -3.322219, 1, 0.1843137, 0, 1,
-1.811892, -1.08974, -1.912628, 1, 0.1921569, 0, 1,
-1.79019, 0.3870467, -2.998745, 1, 0.1960784, 0, 1,
-1.757224, -0.4928828, -2.024887, 1, 0.2039216, 0, 1,
-1.746807, 1.768775, 0.3581145, 1, 0.2117647, 0, 1,
-1.745642, -0.3342856, -1.258519, 1, 0.2156863, 0, 1,
-1.723258, 0.7023743, -0.9426559, 1, 0.2235294, 0, 1,
-1.701367, -0.9696468, -0.3627361, 1, 0.227451, 0, 1,
-1.697667, -0.03170878, -2.930907, 1, 0.2352941, 0, 1,
-1.6904, 0.3916501, -2.708176, 1, 0.2392157, 0, 1,
-1.685251, -1.832306, -2.561097, 1, 0.2470588, 0, 1,
-1.685195, -1.389836, -3.001663, 1, 0.2509804, 0, 1,
-1.676145, -0.4062906, -1.633422, 1, 0.2588235, 0, 1,
-1.665048, -0.4024492, -0.476815, 1, 0.2627451, 0, 1,
-1.665042, -0.3204564, -2.181607, 1, 0.2705882, 0, 1,
-1.662331, 0.2614437, -0.6092218, 1, 0.2745098, 0, 1,
-1.652492, -0.4119349, -2.446588, 1, 0.282353, 0, 1,
-1.643442, -2.8743, -3.511546, 1, 0.2862745, 0, 1,
-1.639478, 0.7398008, -1.481897, 1, 0.2941177, 0, 1,
-1.620011, -2.573103, -3.711392, 1, 0.3019608, 0, 1,
-1.616881, 1.443745, -0.9660987, 1, 0.3058824, 0, 1,
-1.610678, 0.474291, -2.751707, 1, 0.3137255, 0, 1,
-1.584968, -0.2858189, -2.06673, 1, 0.3176471, 0, 1,
-1.580184, -0.2707788, -1.606997, 1, 0.3254902, 0, 1,
-1.5783, 0.4088393, -2.082019, 1, 0.3294118, 0, 1,
-1.563385, 1.345353, -1.857876, 1, 0.3372549, 0, 1,
-1.554043, 1.824908, 1.718354, 1, 0.3411765, 0, 1,
-1.552086, -0.0953545, 0.4318637, 1, 0.3490196, 0, 1,
-1.547619, 0.61743, -2.968192, 1, 0.3529412, 0, 1,
-1.530831, 0.8584691, -0.4057283, 1, 0.3607843, 0, 1,
-1.52619, 0.7178989, -2.250481, 1, 0.3647059, 0, 1,
-1.522573, 0.3497488, -1.419938, 1, 0.372549, 0, 1,
-1.504626, 2.08723, -2.165025, 1, 0.3764706, 0, 1,
-1.475654, -1.728191, -2.631275, 1, 0.3843137, 0, 1,
-1.467681, 2.322299, -0.5255365, 1, 0.3882353, 0, 1,
-1.457506, -0.440325, -1.360807, 1, 0.3960784, 0, 1,
-1.456743, 1.293226, -0.7279418, 1, 0.4039216, 0, 1,
-1.445716, -0.07249215, -1.234727, 1, 0.4078431, 0, 1,
-1.439763, -2.472493, -1.877796, 1, 0.4156863, 0, 1,
-1.428929, -0.09941047, -1.487074, 1, 0.4196078, 0, 1,
-1.428629, -0.8113188, -2.391059, 1, 0.427451, 0, 1,
-1.411066, 1.186526, 0.7011628, 1, 0.4313726, 0, 1,
-1.407761, -0.6067701, -1.623406, 1, 0.4392157, 0, 1,
-1.397075, -0.5672466, -1.612622, 1, 0.4431373, 0, 1,
-1.396725, -1.390319, -1.551406, 1, 0.4509804, 0, 1,
-1.394419, -1.591655, -1.814651, 1, 0.454902, 0, 1,
-1.383231, 0.6954592, -1.312021, 1, 0.4627451, 0, 1,
-1.376709, 0.2359281, -0.4040617, 1, 0.4666667, 0, 1,
-1.363799, 0.8432203, 0.1571715, 1, 0.4745098, 0, 1,
-1.355987, -1.359512, -0.6838998, 1, 0.4784314, 0, 1,
-1.352993, 0.05100115, -1.829781, 1, 0.4862745, 0, 1,
-1.350558, 1.347518, -0.7441926, 1, 0.4901961, 0, 1,
-1.346385, -0.7393034, -2.675805, 1, 0.4980392, 0, 1,
-1.341368, -0.1812505, -1.130281, 1, 0.5058824, 0, 1,
-1.336532, 0.2913338, -3.257924, 1, 0.509804, 0, 1,
-1.324256, 0.3070591, 0.8153815, 1, 0.5176471, 0, 1,
-1.311063, -0.03755268, -2.995263, 1, 0.5215687, 0, 1,
-1.308252, 1.516153, -0.2806668, 1, 0.5294118, 0, 1,
-1.304286, -0.6174371, -0.8646113, 1, 0.5333334, 0, 1,
-1.303537, 1.274006, -1.592267, 1, 0.5411765, 0, 1,
-1.302107, -1.260511, -3.626446, 1, 0.5450981, 0, 1,
-1.297264, 1.304958, -1.559398, 1, 0.5529412, 0, 1,
-1.290056, -0.5010355, -1.348842, 1, 0.5568628, 0, 1,
-1.271139, -0.3959354, -0.4968463, 1, 0.5647059, 0, 1,
-1.26326, 1.172656, -0.5791185, 1, 0.5686275, 0, 1,
-1.26234, -1.035038, -2.898414, 1, 0.5764706, 0, 1,
-1.259489, 1.783027, -0.03232048, 1, 0.5803922, 0, 1,
-1.258207, 0.8536773, -0.262947, 1, 0.5882353, 0, 1,
-1.246807, -0.2674527, -1.647515, 1, 0.5921569, 0, 1,
-1.229686, 1.105599, -0.4951575, 1, 0.6, 0, 1,
-1.228028, 1.037477, -2.03718, 1, 0.6078432, 0, 1,
-1.227684, 2.144496, 0.906338, 1, 0.6117647, 0, 1,
-1.222677, -0.2663018, -1.149139, 1, 0.6196079, 0, 1,
-1.221281, 0.7889718, -0.3059664, 1, 0.6235294, 0, 1,
-1.220341, -0.4226986, -1.236529, 1, 0.6313726, 0, 1,
-1.217399, 1.524305, -1.281225, 1, 0.6352941, 0, 1,
-1.214906, -0.1802938, 0.6936304, 1, 0.6431373, 0, 1,
-1.206725, -0.7597526, -2.692909, 1, 0.6470588, 0, 1,
-1.200702, -0.1488102, -0.9747019, 1, 0.654902, 0, 1,
-1.191839, -0.9591107, -2.204819, 1, 0.6588235, 0, 1,
-1.178718, 1.46174, -0.5826813, 1, 0.6666667, 0, 1,
-1.176063, -1.016189, -0.9156454, 1, 0.6705883, 0, 1,
-1.174304, 0.1751457, -3.019513, 1, 0.6784314, 0, 1,
-1.169341, -0.4110813, -2.949002, 1, 0.682353, 0, 1,
-1.16138, -0.8556026, -0.9109798, 1, 0.6901961, 0, 1,
-1.15894, 0.7160749, -1.33739, 1, 0.6941177, 0, 1,
-1.155914, 0.2103487, -0.8984985, 1, 0.7019608, 0, 1,
-1.152511, 0.02988212, -0.8123799, 1, 0.7098039, 0, 1,
-1.152225, 1.560218, 0.2098125, 1, 0.7137255, 0, 1,
-1.147362, 0.1568659, -1.366071, 1, 0.7215686, 0, 1,
-1.142291, -1.157474, -2.758397, 1, 0.7254902, 0, 1,
-1.140883, 1.216795, -0.9876412, 1, 0.7333333, 0, 1,
-1.129471, -0.3943942, -2.9483, 1, 0.7372549, 0, 1,
-1.126332, -0.05294785, -0.1137605, 1, 0.7450981, 0, 1,
-1.125601, 0.7324476, -0.5079433, 1, 0.7490196, 0, 1,
-1.125102, 0.9541435, -0.6176795, 1, 0.7568628, 0, 1,
-1.121287, 0.6267709, -1.037178, 1, 0.7607843, 0, 1,
-1.113235, 0.04406653, -1.036905, 1, 0.7686275, 0, 1,
-1.110356, 0.5638205, -0.9836416, 1, 0.772549, 0, 1,
-1.106086, -0.1975413, 0.07606099, 1, 0.7803922, 0, 1,
-1.1058, -0.8971716, -2.06462, 1, 0.7843137, 0, 1,
-1.105789, -1.087296, -0.9893238, 1, 0.7921569, 0, 1,
-1.105647, 1.408703, -0.1580909, 1, 0.7960784, 0, 1,
-1.102704, -0.02421087, -0.8567793, 1, 0.8039216, 0, 1,
-1.094686, 0.4202199, -1.980592, 1, 0.8117647, 0, 1,
-1.086014, 0.05095124, -0.3523497, 1, 0.8156863, 0, 1,
-1.072128, 0.2154633, -0.8484312, 1, 0.8235294, 0, 1,
-1.069417, -0.1710147, -0.9519839, 1, 0.827451, 0, 1,
-1.066733, -0.09734906, 0.2677692, 1, 0.8352941, 0, 1,
-1.065394, -0.2390987, -1.521873, 1, 0.8392157, 0, 1,
-1.063278, -1.017876, -1.003562, 1, 0.8470588, 0, 1,
-1.059609, 0.5601531, -2.766754, 1, 0.8509804, 0, 1,
-1.052414, 1.595678, 0.1601534, 1, 0.8588235, 0, 1,
-1.047339, -0.5813751, -1.505056, 1, 0.8627451, 0, 1,
-1.047093, -0.5378051, -3.35491, 1, 0.8705882, 0, 1,
-1.046707, 0.6218545, -1.021128, 1, 0.8745098, 0, 1,
-1.040778, -0.7045188, -2.346927, 1, 0.8823529, 0, 1,
-1.035544, -0.2907101, -1.474111, 1, 0.8862745, 0, 1,
-1.027185, 1.305806, 1.17352, 1, 0.8941177, 0, 1,
-1.023702, 1.550959, 1.899273, 1, 0.8980392, 0, 1,
-1.023376, -0.443652, -0.6400081, 1, 0.9058824, 0, 1,
-1.018082, -0.5112178, -2.434049, 1, 0.9137255, 0, 1,
-1.011353, 1.564407, 0.09968505, 1, 0.9176471, 0, 1,
-1.003545, 0.6211337, -1.407587, 1, 0.9254902, 0, 1,
-1.001383, 0.1754889, -0.8456103, 1, 0.9294118, 0, 1,
-0.9920018, -0.4643565, -1.901891, 1, 0.9372549, 0, 1,
-0.9905773, 1.098571, -1.434773, 1, 0.9411765, 0, 1,
-0.989957, -0.2423134, -2.410844, 1, 0.9490196, 0, 1,
-0.9844313, -0.4290193, -0.9573697, 1, 0.9529412, 0, 1,
-0.9725748, 0.9011992, -0.09572855, 1, 0.9607843, 0, 1,
-0.9692125, -0.9041283, -3.202757, 1, 0.9647059, 0, 1,
-0.9649851, 0.7055317, 0.1205744, 1, 0.972549, 0, 1,
-0.9599674, -0.3300763, -1.501628, 1, 0.9764706, 0, 1,
-0.9580504, 1.475827, 0.230512, 1, 0.9843137, 0, 1,
-0.9563258, 0.5603501, 1.173406, 1, 0.9882353, 0, 1,
-0.953373, -0.2450911, -0.8016683, 1, 0.9960784, 0, 1,
-0.951556, 2.094919, 0.7230015, 0.9960784, 1, 0, 1,
-0.9515178, 0.4115626, -2.638792, 0.9921569, 1, 0, 1,
-0.9496723, -0.7480458, -1.618159, 0.9843137, 1, 0, 1,
-0.9482605, -0.1561022, -2.000279, 0.9803922, 1, 0, 1,
-0.9462392, 0.3587605, -1.651417, 0.972549, 1, 0, 1,
-0.9455817, -0.03040207, -2.098719, 0.9686275, 1, 0, 1,
-0.9448133, 0.9878854, -0.9128566, 0.9607843, 1, 0, 1,
-0.9425483, -0.8431957, -0.5386374, 0.9568627, 1, 0, 1,
-0.939761, 0.3768526, -1.388904, 0.9490196, 1, 0, 1,
-0.9344143, -1.017789, -1.893899, 0.945098, 1, 0, 1,
-0.9236835, 0.4294659, -3.380355, 0.9372549, 1, 0, 1,
-0.9171105, 0.06612001, -0.9576594, 0.9333333, 1, 0, 1,
-0.9146706, 1.307861, -1.895383, 0.9254902, 1, 0, 1,
-0.9131208, 0.7362845, -0.7083066, 0.9215686, 1, 0, 1,
-0.9107211, 0.7848541, -0.3937408, 0.9137255, 1, 0, 1,
-0.907877, -0.2268884, -1.705281, 0.9098039, 1, 0, 1,
-0.9060573, -0.09354573, -2.067015, 0.9019608, 1, 0, 1,
-0.9050547, 0.1228723, 0.4487713, 0.8941177, 1, 0, 1,
-0.9045568, -0.5785704, -1.137403, 0.8901961, 1, 0, 1,
-0.9031153, 1.429773, -0.5469188, 0.8823529, 1, 0, 1,
-0.8942342, -0.6299926, -3.292995, 0.8784314, 1, 0, 1,
-0.8932952, 1.114097, 0.8209785, 0.8705882, 1, 0, 1,
-0.8930739, -1.235516, -0.8807593, 0.8666667, 1, 0, 1,
-0.8922003, -0.3840782, -1.595537, 0.8588235, 1, 0, 1,
-0.890156, -0.141888, -2.021122, 0.854902, 1, 0, 1,
-0.8874518, 1.411409, -0.9161548, 0.8470588, 1, 0, 1,
-0.8821978, -1.449878, -3.17247, 0.8431373, 1, 0, 1,
-0.8818814, 0.4749756, -0.7015408, 0.8352941, 1, 0, 1,
-0.879518, -0.09921989, 0.3347358, 0.8313726, 1, 0, 1,
-0.8725184, 0.445263, -2.42564, 0.8235294, 1, 0, 1,
-0.8711532, 0.8106946, -2.154688, 0.8196079, 1, 0, 1,
-0.8711342, 0.03283912, -1.360142, 0.8117647, 1, 0, 1,
-0.8632676, 1.968751, -1.629001, 0.8078431, 1, 0, 1,
-0.8599917, 0.1227298, 0.09663178, 0.8, 1, 0, 1,
-0.8583786, -1.264887, -1.068209, 0.7921569, 1, 0, 1,
-0.8559297, -0.3521304, -1.129745, 0.7882353, 1, 0, 1,
-0.8550296, -1.786041, -2.408103, 0.7803922, 1, 0, 1,
-0.8451725, 0.07626607, -1.555335, 0.7764706, 1, 0, 1,
-0.8352979, -0.9005136, -1.526274, 0.7686275, 1, 0, 1,
-0.8262334, -0.3498445, -3.777216, 0.7647059, 1, 0, 1,
-0.8221937, -0.3332179, -3.077849, 0.7568628, 1, 0, 1,
-0.8215718, 0.5702985, -1.232911, 0.7529412, 1, 0, 1,
-0.81714, 0.881242, 2.110325, 0.7450981, 1, 0, 1,
-0.8167873, 0.3406359, -1.119167, 0.7411765, 1, 0, 1,
-0.8165969, -0.4924303, -3.175339, 0.7333333, 1, 0, 1,
-0.812579, -0.7930751, -1.226581, 0.7294118, 1, 0, 1,
-0.8061101, 0.2642624, -1.037668, 0.7215686, 1, 0, 1,
-0.8027692, -0.4199228, -1.578503, 0.7176471, 1, 0, 1,
-0.8019569, -0.2926143, -1.569746, 0.7098039, 1, 0, 1,
-0.796811, 1.355739, -1.491125, 0.7058824, 1, 0, 1,
-0.7942232, -0.6337526, -2.625287, 0.6980392, 1, 0, 1,
-0.7918566, -2.81632, -2.568278, 0.6901961, 1, 0, 1,
-0.7873933, -0.008429845, -1.993609, 0.6862745, 1, 0, 1,
-0.7843663, -0.8408933, -1.831097, 0.6784314, 1, 0, 1,
-0.7814246, -0.9998981, -1.280259, 0.6745098, 1, 0, 1,
-0.7763426, 1.250139, 0.3891923, 0.6666667, 1, 0, 1,
-0.7696072, 1.023775, -2.554583, 0.6627451, 1, 0, 1,
-0.7569399, -2.244694, -1.318209, 0.654902, 1, 0, 1,
-0.7558857, 2.167814, -0.2674257, 0.6509804, 1, 0, 1,
-0.7514508, 0.5305011, -0.8544918, 0.6431373, 1, 0, 1,
-0.7500823, -0.6599151, -1.193531, 0.6392157, 1, 0, 1,
-0.7498995, -0.9914005, -2.023236, 0.6313726, 1, 0, 1,
-0.7498363, 0.734564, -0.422629, 0.627451, 1, 0, 1,
-0.7476646, 0.6299781, -0.1389989, 0.6196079, 1, 0, 1,
-0.7469593, -1.146981, -1.076228, 0.6156863, 1, 0, 1,
-0.7436969, 1.341538, -1.757057, 0.6078432, 1, 0, 1,
-0.7378979, -0.3930931, -1.670814, 0.6039216, 1, 0, 1,
-0.7369506, 0.3329068, -0.9928073, 0.5960785, 1, 0, 1,
-0.7326611, -0.7694128, -1.984904, 0.5882353, 1, 0, 1,
-0.7293066, -0.8238136, -2.050578, 0.5843138, 1, 0, 1,
-0.7263647, 1.087492, -0.3564692, 0.5764706, 1, 0, 1,
-0.7242106, -0.4405912, -2.895521, 0.572549, 1, 0, 1,
-0.7186941, 0.3778243, -1.508461, 0.5647059, 1, 0, 1,
-0.7172987, -0.9543457, -1.199409, 0.5607843, 1, 0, 1,
-0.7138637, 0.8852579, -0.03309563, 0.5529412, 1, 0, 1,
-0.7096635, 0.3501379, -1.987949, 0.5490196, 1, 0, 1,
-0.708544, 2.816518, -1.385008, 0.5411765, 1, 0, 1,
-0.7071306, 1.557104, -1.271924, 0.5372549, 1, 0, 1,
-0.7068485, -1.465626, -1.04669, 0.5294118, 1, 0, 1,
-0.7063155, -0.7346902, -0.3920123, 0.5254902, 1, 0, 1,
-0.7055273, -0.7956859, -1.46872, 0.5176471, 1, 0, 1,
-0.7038245, -0.01002767, -1.082616, 0.5137255, 1, 0, 1,
-0.7004949, 2.36297, 1.039133, 0.5058824, 1, 0, 1,
-0.6933733, -0.3726345, -2.805178, 0.5019608, 1, 0, 1,
-0.6930575, 1.360126, -0.9416415, 0.4941176, 1, 0, 1,
-0.6919891, -0.07205074, -2.204645, 0.4862745, 1, 0, 1,
-0.6851866, -0.227354, -0.8040756, 0.4823529, 1, 0, 1,
-0.6849175, -0.1728514, -3.11018, 0.4745098, 1, 0, 1,
-0.6817382, 1.559206, 1.228783, 0.4705882, 1, 0, 1,
-0.6807565, -0.868549, -2.467712, 0.4627451, 1, 0, 1,
-0.679819, -0.4694417, -2.827513, 0.4588235, 1, 0, 1,
-0.6774516, -2.356811, -2.316512, 0.4509804, 1, 0, 1,
-0.6717743, 0.2180622, -2.415367, 0.4470588, 1, 0, 1,
-0.6695473, 0.4856596, -1.096448, 0.4392157, 1, 0, 1,
-0.6651531, 0.9133627, -1.648895, 0.4352941, 1, 0, 1,
-0.6414565, 1.13299, -0.3503997, 0.427451, 1, 0, 1,
-0.6383433, -0.9025965, -3.145102, 0.4235294, 1, 0, 1,
-0.6372345, -0.3111177, -3.801831, 0.4156863, 1, 0, 1,
-0.6348612, 0.8332978, -1.527879, 0.4117647, 1, 0, 1,
-0.6333913, -0.01667495, -1.659245, 0.4039216, 1, 0, 1,
-0.6311033, 0.6336561, 0.711193, 0.3960784, 1, 0, 1,
-0.6302657, -0.437133, -1.8157, 0.3921569, 1, 0, 1,
-0.6256454, -0.8476061, -1.426138, 0.3843137, 1, 0, 1,
-0.6235088, -0.462033, -0.3973091, 0.3803922, 1, 0, 1,
-0.6234964, -0.1807708, -1.490007, 0.372549, 1, 0, 1,
-0.6221368, 1.739897, -0.2909364, 0.3686275, 1, 0, 1,
-0.6193897, -0.103204, -2.255609, 0.3607843, 1, 0, 1,
-0.6188032, 0.582085, -1.002649, 0.3568628, 1, 0, 1,
-0.6179532, -0.7071525, -4.643204, 0.3490196, 1, 0, 1,
-0.617496, -2.452364, -3.250079, 0.345098, 1, 0, 1,
-0.6166081, 0.5377759, -0.6664984, 0.3372549, 1, 0, 1,
-0.6146787, 0.6851521, -0.3635168, 0.3333333, 1, 0, 1,
-0.6143906, -0.7115785, -3.771122, 0.3254902, 1, 0, 1,
-0.6124191, 0.1780858, -1.523776, 0.3215686, 1, 0, 1,
-0.6110224, 0.4092154, -1.921724, 0.3137255, 1, 0, 1,
-0.6108122, 1.044783, -1.489885, 0.3098039, 1, 0, 1,
-0.61053, 1.046158, -0.5617469, 0.3019608, 1, 0, 1,
-0.6063532, 1.95155, -0.9695759, 0.2941177, 1, 0, 1,
-0.6043488, -1.503907, -2.368968, 0.2901961, 1, 0, 1,
-0.5942925, 0.6509305, -0.5545048, 0.282353, 1, 0, 1,
-0.5930731, -0.3043273, -0.5440043, 0.2784314, 1, 0, 1,
-0.5907934, -1.241475, -1.137782, 0.2705882, 1, 0, 1,
-0.5891941, -0.8938535, -3.062457, 0.2666667, 1, 0, 1,
-0.5879547, -0.08471409, 0.9279991, 0.2588235, 1, 0, 1,
-0.5877856, -1.422046, -2.668474, 0.254902, 1, 0, 1,
-0.585812, -0.1413977, -1.347215, 0.2470588, 1, 0, 1,
-0.575599, -0.2290731, -2.124326, 0.2431373, 1, 0, 1,
-0.5713822, -0.7177947, -3.243638, 0.2352941, 1, 0, 1,
-0.5711254, -0.02471969, -1.470617, 0.2313726, 1, 0, 1,
-0.5705414, -1.458865, -2.29978, 0.2235294, 1, 0, 1,
-0.5641439, -0.02301186, -0.7124579, 0.2196078, 1, 0, 1,
-0.5454669, -0.3472239, -0.872869, 0.2117647, 1, 0, 1,
-0.54544, 2.473436, 1.842744, 0.2078431, 1, 0, 1,
-0.5428182, -2.473416, -1.817834, 0.2, 1, 0, 1,
-0.5325671, 0.3757389, 0.3630356, 0.1921569, 1, 0, 1,
-0.531506, 1.023391, -1.203124, 0.1882353, 1, 0, 1,
-0.5218185, -0.9901955, -1.339059, 0.1803922, 1, 0, 1,
-0.5161435, -0.6473463, -3.992916, 0.1764706, 1, 0, 1,
-0.5143795, -2.046438, -2.446123, 0.1686275, 1, 0, 1,
-0.5118111, 0.8075688, 0.4016611, 0.1647059, 1, 0, 1,
-0.5081252, -0.8347133, -1.052097, 0.1568628, 1, 0, 1,
-0.5071414, 0.8352008, -2.528199, 0.1529412, 1, 0, 1,
-0.5046865, -0.8064014, -5.361759, 0.145098, 1, 0, 1,
-0.5042213, 1.166533, -0.1709564, 0.1411765, 1, 0, 1,
-0.4945111, -0.5470268, -2.62061, 0.1333333, 1, 0, 1,
-0.4931538, 0.4518999, -1.149343, 0.1294118, 1, 0, 1,
-0.4818892, -1.553533, -1.443463, 0.1215686, 1, 0, 1,
-0.4816011, -0.132738, -2.199673, 0.1176471, 1, 0, 1,
-0.4745216, 0.8735117, -0.2362197, 0.1098039, 1, 0, 1,
-0.47389, 0.7401171, -0.9952924, 0.1058824, 1, 0, 1,
-0.4726426, 0.01351805, 0.3373529, 0.09803922, 1, 0, 1,
-0.4722311, -0.2200602, -0.9223167, 0.09019608, 1, 0, 1,
-0.4721436, -1.154608, -2.27903, 0.08627451, 1, 0, 1,
-0.4711194, -1.190272, -3.060814, 0.07843138, 1, 0, 1,
-0.4706625, -0.364819, -3.228458, 0.07450981, 1, 0, 1,
-0.4700101, -0.6214893, -2.477388, 0.06666667, 1, 0, 1,
-0.4595074, 0.4039753, -1.706881, 0.0627451, 1, 0, 1,
-0.4589966, -0.1951851, -1.786017, 0.05490196, 1, 0, 1,
-0.4564148, -0.7125044, -1.193457, 0.05098039, 1, 0, 1,
-0.4557987, 1.202719, 0.04992399, 0.04313726, 1, 0, 1,
-0.4553118, 0.2179248, -1.38353, 0.03921569, 1, 0, 1,
-0.4510117, 0.4767406, 2.026562, 0.03137255, 1, 0, 1,
-0.4459137, -0.07640968, -0.3980659, 0.02745098, 1, 0, 1,
-0.4390311, -0.185149, -2.484143, 0.01960784, 1, 0, 1,
-0.4346943, 0.4578485, -1.402617, 0.01568628, 1, 0, 1,
-0.4344991, 0.6010978, 0.9260619, 0.007843138, 1, 0, 1,
-0.4335671, 1.644033, -1.345482, 0.003921569, 1, 0, 1,
-0.429564, -1.328149, -2.64219, 0, 1, 0.003921569, 1,
-0.427656, 0.462038, -0.3136571, 0, 1, 0.01176471, 1,
-0.4256371, 1.501488, 1.145069, 0, 1, 0.01568628, 1,
-0.4216336, -0.3900232, -3.88275, 0, 1, 0.02352941, 1,
-0.4212244, -0.7429445, -3.453391, 0, 1, 0.02745098, 1,
-0.4157746, 0.8671376, -0.1185651, 0, 1, 0.03529412, 1,
-0.4048119, -0.07102485, -1.454902, 0, 1, 0.03921569, 1,
-0.4034623, -0.08354992, -1.749966, 0, 1, 0.04705882, 1,
-0.3992589, -0.4603966, -3.773914, 0, 1, 0.05098039, 1,
-0.3989478, 0.6053111, -0.5767926, 0, 1, 0.05882353, 1,
-0.3972412, -0.1182899, -1.802035, 0, 1, 0.0627451, 1,
-0.3966898, -0.4712866, -1.877225, 0, 1, 0.07058824, 1,
-0.3963795, -0.4662473, -1.971186, 0, 1, 0.07450981, 1,
-0.3962624, -1.949645, -3.750447, 0, 1, 0.08235294, 1,
-0.3957633, -0.6395007, -4.279369, 0, 1, 0.08627451, 1,
-0.3929721, -0.9917277, -2.298048, 0, 1, 0.09411765, 1,
-0.3925883, -0.4119065, -3.235036, 0, 1, 0.1019608, 1,
-0.3855575, -0.4481419, -2.812713, 0, 1, 0.1058824, 1,
-0.3822645, 0.4543687, -1.859952, 0, 1, 0.1137255, 1,
-0.3815475, -0.6583244, -1.772907, 0, 1, 0.1176471, 1,
-0.3807625, -0.7411639, -2.78349, 0, 1, 0.1254902, 1,
-0.3805695, 0.5818672, -1.931166, 0, 1, 0.1294118, 1,
-0.3764589, 0.6464451, -0.6149963, 0, 1, 0.1372549, 1,
-0.3764283, -2.280356, -2.070393, 0, 1, 0.1411765, 1,
-0.3735197, -0.00987068, -1.544278, 0, 1, 0.1490196, 1,
-0.3727662, -1.460182, -2.765744, 0, 1, 0.1529412, 1,
-0.3705881, -0.03701838, -1.050536, 0, 1, 0.1607843, 1,
-0.3507608, 0.3511883, -1.563473, 0, 1, 0.1647059, 1,
-0.3492214, 0.292507, -0.6381341, 0, 1, 0.172549, 1,
-0.3476958, 0.23347, -1.161611, 0, 1, 0.1764706, 1,
-0.346294, -1.02339, -1.98824, 0, 1, 0.1843137, 1,
-0.3459225, 1.548535, 0.9839149, 0, 1, 0.1882353, 1,
-0.3424743, 0.01362605, -1.374321, 0, 1, 0.1960784, 1,
-0.340022, 0.05151922, -2.389829, 0, 1, 0.2039216, 1,
-0.3383977, 0.05900844, -1.514434, 0, 1, 0.2078431, 1,
-0.3378366, 0.1789408, -3.279813, 0, 1, 0.2156863, 1,
-0.3359496, 0.6045626, 0.9327943, 0, 1, 0.2196078, 1,
-0.3324141, -0.8208759, -1.685779, 0, 1, 0.227451, 1,
-0.3318325, -1.089403, -3.191954, 0, 1, 0.2313726, 1,
-0.3317621, -1.312949, -3.719458, 0, 1, 0.2392157, 1,
-0.3314411, -0.1670546, -3.228317, 0, 1, 0.2431373, 1,
-0.3284726, -0.7420173, -0.8727154, 0, 1, 0.2509804, 1,
-0.3277698, 0.006313297, -1.602328, 0, 1, 0.254902, 1,
-0.3272298, -0.5006868, -2.681048, 0, 1, 0.2627451, 1,
-0.321904, 1.59075, 0.4093642, 0, 1, 0.2666667, 1,
-0.3213586, -0.04110014, -1.28675, 0, 1, 0.2745098, 1,
-0.3083819, -1.511385, -2.265013, 0, 1, 0.2784314, 1,
-0.3078576, -0.5380734, -0.8754255, 0, 1, 0.2862745, 1,
-0.3024188, 0.7207817, -1.489696, 0, 1, 0.2901961, 1,
-0.2961437, -0.957292, -2.488114, 0, 1, 0.2980392, 1,
-0.2938282, -1.765923, -4.200356, 0, 1, 0.3058824, 1,
-0.2938077, -1.179863, -2.217347, 0, 1, 0.3098039, 1,
-0.2923052, -0.3894671, -4.364723, 0, 1, 0.3176471, 1,
-0.2886679, -0.3663358, -1.339985, 0, 1, 0.3215686, 1,
-0.2879419, 0.04465256, -4.193728, 0, 1, 0.3294118, 1,
-0.2803955, -0.1218741, -1.643856, 0, 1, 0.3333333, 1,
-0.2803203, -0.004887463, -0.9619692, 0, 1, 0.3411765, 1,
-0.2788541, -0.2561784, -1.880281, 0, 1, 0.345098, 1,
-0.2786759, -0.6302335, -2.38586, 0, 1, 0.3529412, 1,
-0.2782255, 0.9064525, 0.7011764, 0, 1, 0.3568628, 1,
-0.2777675, -0.8438352, -2.907636, 0, 1, 0.3647059, 1,
-0.2736526, -1.719783, -3.488108, 0, 1, 0.3686275, 1,
-0.2705368, -0.3666064, -2.572692, 0, 1, 0.3764706, 1,
-0.2696812, 1.038074, 0.598596, 0, 1, 0.3803922, 1,
-0.2673657, -1.315642, -2.644351, 0, 1, 0.3882353, 1,
-0.2659739, -0.7144874, -3.718043, 0, 1, 0.3921569, 1,
-0.2659547, -2.245686, -2.567319, 0, 1, 0.4, 1,
-0.2640566, 0.1741821, -2.110765, 0, 1, 0.4078431, 1,
-0.2589412, 0.1714107, 0.05939982, 0, 1, 0.4117647, 1,
-0.258, 0.6815636, 0.8143543, 0, 1, 0.4196078, 1,
-0.2536397, 1.712709, 0.9196113, 0, 1, 0.4235294, 1,
-0.2509397, 0.3119722, 0.7090361, 0, 1, 0.4313726, 1,
-0.245616, 0.6049042, -0.7451259, 0, 1, 0.4352941, 1,
-0.244685, -0.6692107, -2.75967, 0, 1, 0.4431373, 1,
-0.2444607, -0.6636637, -1.458302, 0, 1, 0.4470588, 1,
-0.2401348, 0.3312186, -1.558372, 0, 1, 0.454902, 1,
-0.2391262, 0.5687663, 0.1822935, 0, 1, 0.4588235, 1,
-0.2379467, -0.02958874, -2.62483, 0, 1, 0.4666667, 1,
-0.2347493, 0.4309964, -0.120107, 0, 1, 0.4705882, 1,
-0.2278863, -1.02586, -4.92625, 0, 1, 0.4784314, 1,
-0.2166125, -1.303094, -2.498776, 0, 1, 0.4823529, 1,
-0.2146316, 0.2494486, -1.879813, 0, 1, 0.4901961, 1,
-0.2145479, 3.112658, -0.9888479, 0, 1, 0.4941176, 1,
-0.2127127, -0.5217993, -3.890699, 0, 1, 0.5019608, 1,
-0.2109838, -0.5255191, -2.572178, 0, 1, 0.509804, 1,
-0.2076363, 0.753013, -0.3777902, 0, 1, 0.5137255, 1,
-0.2025243, 0.8347714, -0.4118736, 0, 1, 0.5215687, 1,
-0.1992043, -0.2391372, -2.361244, 0, 1, 0.5254902, 1,
-0.1932323, -0.7329532, -3.662562, 0, 1, 0.5333334, 1,
-0.1931099, 0.9569074, -0.6637292, 0, 1, 0.5372549, 1,
-0.1929418, 0.5667747, -1.456307, 0, 1, 0.5450981, 1,
-0.186664, -0.7470209, -3.081769, 0, 1, 0.5490196, 1,
-0.1859552, -0.8745162, -2.524901, 0, 1, 0.5568628, 1,
-0.1847374, -0.5593376, -3.515615, 0, 1, 0.5607843, 1,
-0.1823193, -0.309661, -2.172261, 0, 1, 0.5686275, 1,
-0.1807487, -0.6264936, -3.330019, 0, 1, 0.572549, 1,
-0.1792821, 1.498203, -0.3194913, 0, 1, 0.5803922, 1,
-0.1792009, -0.109995, -1.515872, 0, 1, 0.5843138, 1,
-0.1785807, 0.6195182, -0.2201138, 0, 1, 0.5921569, 1,
-0.1785056, -0.4040214, -6.137985, 0, 1, 0.5960785, 1,
-0.1774757, -1.043126, -2.768671, 0, 1, 0.6039216, 1,
-0.1760811, 0.6029562, 0.6601685, 0, 1, 0.6117647, 1,
-0.1704571, -1.439497, -2.883753, 0, 1, 0.6156863, 1,
-0.1700716, -0.6017302, -3.542253, 0, 1, 0.6235294, 1,
-0.1685522, -1.498197, -5.141554, 0, 1, 0.627451, 1,
-0.1664795, -0.5974164, -1.584854, 0, 1, 0.6352941, 1,
-0.165793, -0.9567415, -3.518139, 0, 1, 0.6392157, 1,
-0.1656672, 1.417253, 0.4875794, 0, 1, 0.6470588, 1,
-0.1650534, 0.9097397, 0.6397947, 0, 1, 0.6509804, 1,
-0.164838, -0.2783863, -3.701355, 0, 1, 0.6588235, 1,
-0.1639147, -0.1187485, -1.116207, 0, 1, 0.6627451, 1,
-0.1609318, 2.727808, -1.122408, 0, 1, 0.6705883, 1,
-0.1553743, 0.2944974, -0.1042746, 0, 1, 0.6745098, 1,
-0.1552902, 1.027369, 0.7297053, 0, 1, 0.682353, 1,
-0.1520763, -1.117548, -2.296308, 0, 1, 0.6862745, 1,
-0.1512439, 2.073219, 1.322623, 0, 1, 0.6941177, 1,
-0.1511459, 0.4419208, -0.2578526, 0, 1, 0.7019608, 1,
-0.1507304, -0.8206309, -2.779339, 0, 1, 0.7058824, 1,
-0.1506374, -0.3509141, -2.109855, 0, 1, 0.7137255, 1,
-0.1502916, -1.691089, -5.256996, 0, 1, 0.7176471, 1,
-0.1493963, 0.7107313, -2.064095, 0, 1, 0.7254902, 1,
-0.1453526, -1.001468, -3.460063, 0, 1, 0.7294118, 1,
-0.1446205, 0.5578009, -0.5679842, 0, 1, 0.7372549, 1,
-0.1429664, -0.3092635, -2.585758, 0, 1, 0.7411765, 1,
-0.1342569, 0.07584272, -1.771925, 0, 1, 0.7490196, 1,
-0.1306171, 1.678602, -0.718755, 0, 1, 0.7529412, 1,
-0.1306044, -1.13637, -3.525069, 0, 1, 0.7607843, 1,
-0.1303468, -0.4259377, -1.529459, 0, 1, 0.7647059, 1,
-0.1289638, 0.7822003, 1.170781, 0, 1, 0.772549, 1,
-0.1282939, -0.9517124, -1.935364, 0, 1, 0.7764706, 1,
-0.1276303, -1.399651, -4.302846, 0, 1, 0.7843137, 1,
-0.1222281, -0.3620891, -4.949258, 0, 1, 0.7882353, 1,
-0.121706, -0.5618818, -1.981033, 0, 1, 0.7960784, 1,
-0.1064421, -0.05333284, -1.575546, 0, 1, 0.8039216, 1,
-0.1057033, 1.314612, -0.3574741, 0, 1, 0.8078431, 1,
-0.1011788, -0.2139156, -2.952965, 0, 1, 0.8156863, 1,
-0.09858223, -0.1587757, -0.7930969, 0, 1, 0.8196079, 1,
-0.09234568, 0.608024, -1.649394, 0, 1, 0.827451, 1,
-0.09074173, -0.1103428, -2.085654, 0, 1, 0.8313726, 1,
-0.08603952, 0.4867416, -0.8801503, 0, 1, 0.8392157, 1,
-0.07741055, 0.3630708, -0.5824126, 0, 1, 0.8431373, 1,
-0.07703036, 0.5247362, 0.6769979, 0, 1, 0.8509804, 1,
-0.075819, -0.4803981, -4.170324, 0, 1, 0.854902, 1,
-0.07381611, -0.6849964, -3.342565, 0, 1, 0.8627451, 1,
-0.07277428, 1.73018, 1.697308, 0, 1, 0.8666667, 1,
-0.07194006, 0.848094, -0.2693391, 0, 1, 0.8745098, 1,
-0.07021545, -1.08959, -3.297001, 0, 1, 0.8784314, 1,
-0.06982984, -0.2499999, -4.845937, 0, 1, 0.8862745, 1,
-0.06799816, 0.2919804, -0.9770321, 0, 1, 0.8901961, 1,
-0.06615245, 0.7249646, 2.153224, 0, 1, 0.8980392, 1,
-0.06389476, -1.383846, -2.472363, 0, 1, 0.9058824, 1,
-0.06043321, 0.5789053, 0.05693467, 0, 1, 0.9098039, 1,
-0.05817646, -0.7937132, -5.955581, 0, 1, 0.9176471, 1,
-0.05561271, -1.802089, -3.750601, 0, 1, 0.9215686, 1,
-0.05168958, 0.6616168, 0.687956, 0, 1, 0.9294118, 1,
-0.05158272, 0.6769387, 0.2392937, 0, 1, 0.9333333, 1,
-0.0455732, 0.3583965, -0.04013625, 0, 1, 0.9411765, 1,
-0.04497631, 1.009723, 0.1451526, 0, 1, 0.945098, 1,
-0.04424376, 0.06283904, 0.7937821, 0, 1, 0.9529412, 1,
-0.04221445, -0.7990454, -4.024879, 0, 1, 0.9568627, 1,
-0.04103184, -1.940971, -2.462706, 0, 1, 0.9647059, 1,
-0.03770707, -0.6097133, -2.964465, 0, 1, 0.9686275, 1,
-0.03473386, 1.482253, -0.6006845, 0, 1, 0.9764706, 1,
-0.03098093, -0.4700522, -2.7533, 0, 1, 0.9803922, 1,
-0.02479444, -1.511213, -0.8993285, 0, 1, 0.9882353, 1,
-0.02199703, 0.7245523, -0.411523, 0, 1, 0.9921569, 1,
-0.01915176, 1.043975, 0.2639667, 0, 1, 1, 1,
-0.01871374, 1.010776, -0.267899, 0, 0.9921569, 1, 1,
-0.01859346, 0.6573747, 1.183869, 0, 0.9882353, 1, 1,
-0.01129478, 0.5701066, -0.4201345, 0, 0.9803922, 1, 1,
-0.002271258, 0.6720271, 1.087131, 0, 0.9764706, 1, 1,
0.005394374, 0.9209685, 0.3246019, 0, 0.9686275, 1, 1,
0.007918806, 0.8092431, -0.6977158, 0, 0.9647059, 1, 1,
0.01211676, 1.433441, -1.777897, 0, 0.9568627, 1, 1,
0.01295575, 0.4691891, 1.546334, 0, 0.9529412, 1, 1,
0.01334482, -0.2083859, 4.819131, 0, 0.945098, 1, 1,
0.02029962, 1.015217, -0.05601086, 0, 0.9411765, 1, 1,
0.02317717, -0.3335415, 3.235727, 0, 0.9333333, 1, 1,
0.02351866, -0.5418892, 3.976881, 0, 0.9294118, 1, 1,
0.02547419, 0.788223, 0.3422937, 0, 0.9215686, 1, 1,
0.02811953, -1.066013, 2.927515, 0, 0.9176471, 1, 1,
0.02857853, 0.8346384, -0.02916581, 0, 0.9098039, 1, 1,
0.03004278, 1.107879, -1.369561, 0, 0.9058824, 1, 1,
0.0307407, 1.485453, -0.0405451, 0, 0.8980392, 1, 1,
0.03575096, -0.3883722, 2.03115, 0, 0.8901961, 1, 1,
0.03676075, 0.8813854, 0.9176129, 0, 0.8862745, 1, 1,
0.0397535, 0.3836937, 1.112555, 0, 0.8784314, 1, 1,
0.04088135, 0.5019826, -3.768313, 0, 0.8745098, 1, 1,
0.04256389, 0.03733781, 1.440913, 0, 0.8666667, 1, 1,
0.04708338, -0.477439, 2.897027, 0, 0.8627451, 1, 1,
0.04838791, 0.1729136, -1.10293, 0, 0.854902, 1, 1,
0.05772398, -0.7889823, 3.209991, 0, 0.8509804, 1, 1,
0.05869612, 0.7150952, -0.9909524, 0, 0.8431373, 1, 1,
0.06226311, 0.1605273, 1.146245, 0, 0.8392157, 1, 1,
0.07436283, 0.03608542, 1.366666, 0, 0.8313726, 1, 1,
0.07558058, -0.1830325, 3.895757, 0, 0.827451, 1, 1,
0.07708852, -0.6308601, 3.092362, 0, 0.8196079, 1, 1,
0.07746162, 2.17897, 0.302066, 0, 0.8156863, 1, 1,
0.07814997, -0.1666267, 1.210395, 0, 0.8078431, 1, 1,
0.07941645, 0.1214433, 0.7720252, 0, 0.8039216, 1, 1,
0.07963895, 0.5311532, 0.4756089, 0, 0.7960784, 1, 1,
0.08167266, 0.2910173, 1.071918, 0, 0.7882353, 1, 1,
0.08268456, 1.483861, -1.210472, 0, 0.7843137, 1, 1,
0.0866821, -0.044893, 3.464773, 0, 0.7764706, 1, 1,
0.09346334, -0.4102367, 3.718375, 0, 0.772549, 1, 1,
0.09482431, 1.149364, 1.265199, 0, 0.7647059, 1, 1,
0.09628353, 0.03781126, 0.2104922, 0, 0.7607843, 1, 1,
0.0971773, 0.1060607, 0.4845847, 0, 0.7529412, 1, 1,
0.09811272, 0.3532373, -1.35218, 0, 0.7490196, 1, 1,
0.1020872, -1.465603, 2.122755, 0, 0.7411765, 1, 1,
0.1028293, 0.8276734, 0.2789727, 0, 0.7372549, 1, 1,
0.1029357, 0.7848828, -1.000562, 0, 0.7294118, 1, 1,
0.1029498, 2.27976, -1.193887, 0, 0.7254902, 1, 1,
0.1059451, -0.6252207, 3.093302, 0, 0.7176471, 1, 1,
0.1070447, -0.361964, 2.090878, 0, 0.7137255, 1, 1,
0.107592, -0.364371, 3.993836, 0, 0.7058824, 1, 1,
0.1128155, 0.9095334, 1.624386, 0, 0.6980392, 1, 1,
0.1129643, -0.5545157, 1.675946, 0, 0.6941177, 1, 1,
0.1202878, 0.5463462, -0.7039999, 0, 0.6862745, 1, 1,
0.1223387, 0.6730198, -0.251976, 0, 0.682353, 1, 1,
0.1285384, 1.558203, -0.7010153, 0, 0.6745098, 1, 1,
0.1298746, -1.262363, 4.048466, 0, 0.6705883, 1, 1,
0.1360873, -0.05080312, 2.203949, 0, 0.6627451, 1, 1,
0.1434071, 0.743857, -0.6635399, 0, 0.6588235, 1, 1,
0.143663, -0.722195, 3.827604, 0, 0.6509804, 1, 1,
0.1449691, -1.038676, 3.422681, 0, 0.6470588, 1, 1,
0.1479744, 0.2020222, -0.01602985, 0, 0.6392157, 1, 1,
0.1518258, -0.03567675, 2.293331, 0, 0.6352941, 1, 1,
0.152063, -0.2200859, 2.73621, 0, 0.627451, 1, 1,
0.1523481, 0.9774658, -0.9061373, 0, 0.6235294, 1, 1,
0.1525406, -0.2906488, 1.3835, 0, 0.6156863, 1, 1,
0.1527196, 1.393833, 2.064704, 0, 0.6117647, 1, 1,
0.153905, 0.3597811, 0.6494347, 0, 0.6039216, 1, 1,
0.1589355, -1.631878, 3.544375, 0, 0.5960785, 1, 1,
0.1590028, -1.765705, 1.446819, 0, 0.5921569, 1, 1,
0.1593685, 1.220745, -0.3226281, 0, 0.5843138, 1, 1,
0.1631697, -1.0966, 3.681178, 0, 0.5803922, 1, 1,
0.1687214, -0.0272154, 0.2754467, 0, 0.572549, 1, 1,
0.168841, -0.1302723, 2.032041, 0, 0.5686275, 1, 1,
0.17279, -1.217227, 4.209003, 0, 0.5607843, 1, 1,
0.1743362, -0.1617756, -0.3420251, 0, 0.5568628, 1, 1,
0.1790566, -1.603088, 3.601043, 0, 0.5490196, 1, 1,
0.1793178, 0.7109488, -0.8527771, 0, 0.5450981, 1, 1,
0.1797072, 0.2692199, 2.210097, 0, 0.5372549, 1, 1,
0.182455, 1.851334, -0.4246065, 0, 0.5333334, 1, 1,
0.1862017, 0.5569424, -0.9656223, 0, 0.5254902, 1, 1,
0.1880709, -0.2350488, 4.458675, 0, 0.5215687, 1, 1,
0.1911272, -0.06247672, 1.182327, 0, 0.5137255, 1, 1,
0.1957299, 1.657334, -0.1345812, 0, 0.509804, 1, 1,
0.1966563, -0.4898154, 3.115557, 0, 0.5019608, 1, 1,
0.2009918, 1.771183, 0.04276919, 0, 0.4941176, 1, 1,
0.201938, 0.7984473, 0.948656, 0, 0.4901961, 1, 1,
0.2027747, 1.241411, -0.1719714, 0, 0.4823529, 1, 1,
0.2029399, 1.817671, 0.1363822, 0, 0.4784314, 1, 1,
0.2075167, 0.3558662, 0.8253572, 0, 0.4705882, 1, 1,
0.2131281, -1.103323, 2.614874, 0, 0.4666667, 1, 1,
0.2195734, 2.227781, 0.4102387, 0, 0.4588235, 1, 1,
0.2210185, -0.3385985, 1.593414, 0, 0.454902, 1, 1,
0.2219573, 0.6347905, 1.523399, 0, 0.4470588, 1, 1,
0.2228075, -0.0513744, 2.011797, 0, 0.4431373, 1, 1,
0.2228557, -0.3622095, 4.698796, 0, 0.4352941, 1, 1,
0.2239379, 0.07880038, 3.677819, 0, 0.4313726, 1, 1,
0.2256543, 0.6293275, -0.2501316, 0, 0.4235294, 1, 1,
0.2404597, 1.307706, 0.8108214, 0, 0.4196078, 1, 1,
0.2459296, 0.3196269, 1.558352, 0, 0.4117647, 1, 1,
0.2483325, -1.153606, 3.534242, 0, 0.4078431, 1, 1,
0.2503792, 1.146625, 2.108073, 0, 0.4, 1, 1,
0.2509542, -0.3797538, 2.125279, 0, 0.3921569, 1, 1,
0.2540601, -1.296806, 2.63421, 0, 0.3882353, 1, 1,
0.2597526, 0.7311968, 0.9394335, 0, 0.3803922, 1, 1,
0.2627147, 0.611405, 0.325109, 0, 0.3764706, 1, 1,
0.2631165, -1.453246, 3.098398, 0, 0.3686275, 1, 1,
0.2651139, -0.5483291, 5.234043, 0, 0.3647059, 1, 1,
0.2672276, 0.5567427, 0.7599905, 0, 0.3568628, 1, 1,
0.2672633, -0.280625, 1.696524, 0, 0.3529412, 1, 1,
0.2695544, 0.1826866, 1.741405, 0, 0.345098, 1, 1,
0.2718887, -0.9327728, 2.654964, 0, 0.3411765, 1, 1,
0.27207, 0.2817634, 1.820328, 0, 0.3333333, 1, 1,
0.2756172, -1.587106, 1.933506, 0, 0.3294118, 1, 1,
0.2761929, 1.469295, -0.6550298, 0, 0.3215686, 1, 1,
0.2829313, 1.143044, 0.3175923, 0, 0.3176471, 1, 1,
0.2842202, 1.104172, -0.6947285, 0, 0.3098039, 1, 1,
0.2895684, 0.2332665, 1.269195, 0, 0.3058824, 1, 1,
0.293372, -0.6218928, 2.880285, 0, 0.2980392, 1, 1,
0.2934534, -0.9644308, 4.789142, 0, 0.2901961, 1, 1,
0.2956055, -0.9863229, 2.359046, 0, 0.2862745, 1, 1,
0.3037779, -0.955134, 2.868225, 0, 0.2784314, 1, 1,
0.3049159, 1.744522, -1.20399, 0, 0.2745098, 1, 1,
0.3049574, 1.303582, 1.200499, 0, 0.2666667, 1, 1,
0.3090754, 1.256168, -0.3796749, 0, 0.2627451, 1, 1,
0.3120445, 0.1769508, 1.14219, 0, 0.254902, 1, 1,
0.3158083, -0.08290618, 1.809233, 0, 0.2509804, 1, 1,
0.3176528, -2.024289, 4.239392, 0, 0.2431373, 1, 1,
0.3234627, 0.7550141, 1.988405, 0, 0.2392157, 1, 1,
0.3284009, -1.049968, 3.472103, 0, 0.2313726, 1, 1,
0.3299533, 0.2939214, 1.5608, 0, 0.227451, 1, 1,
0.3300448, -1.062759, 3.557459, 0, 0.2196078, 1, 1,
0.3301384, 1.179394, -0.2676455, 0, 0.2156863, 1, 1,
0.3331534, -0.3272533, 3.199752, 0, 0.2078431, 1, 1,
0.3357219, 0.1289041, 1.379614, 0, 0.2039216, 1, 1,
0.3365375, -0.2314841, 2.968846, 0, 0.1960784, 1, 1,
0.3408827, -1.015104, 3.297167, 0, 0.1882353, 1, 1,
0.3461064, -1.283743, 2.372746, 0, 0.1843137, 1, 1,
0.3472343, 1.936628, 0.3012727, 0, 0.1764706, 1, 1,
0.3473544, -0.2220343, 2.774238, 0, 0.172549, 1, 1,
0.3520448, -1.071105, 2.095026, 0, 0.1647059, 1, 1,
0.3530874, -0.3122554, 2.617394, 0, 0.1607843, 1, 1,
0.3539567, -0.4565033, 2.772568, 0, 0.1529412, 1, 1,
0.3541681, 0.1469794, 1.688193, 0, 0.1490196, 1, 1,
0.3555031, 2.287162, 1.691265, 0, 0.1411765, 1, 1,
0.3567534, 0.7052191, 0.6207512, 0, 0.1372549, 1, 1,
0.3707519, -0.890259, 2.231381, 0, 0.1294118, 1, 1,
0.3749767, -1.488579, 2.774487, 0, 0.1254902, 1, 1,
0.3760561, -1.734403, 3.552455, 0, 0.1176471, 1, 1,
0.3769512, 1.152633, 1.391913, 0, 0.1137255, 1, 1,
0.3782224, 0.5308894, 1.239556, 0, 0.1058824, 1, 1,
0.3899451, -0.3045428, 1.971828, 0, 0.09803922, 1, 1,
0.3920269, -0.03151062, 1.03387, 0, 0.09411765, 1, 1,
0.3982664, -0.499888, 2.75132, 0, 0.08627451, 1, 1,
0.3999128, 1.683034, 2.650821, 0, 0.08235294, 1, 1,
0.4034043, 0.181446, 1.456354, 0, 0.07450981, 1, 1,
0.40554, -1.378736, 4.454908, 0, 0.07058824, 1, 1,
0.4099878, -0.3188788, 2.251778, 0, 0.0627451, 1, 1,
0.4170941, -0.3043872, 3.129918, 0, 0.05882353, 1, 1,
0.4191516, -0.2156696, 2.100509, 0, 0.05098039, 1, 1,
0.4250974, -0.9722706, 2.692814, 0, 0.04705882, 1, 1,
0.4275302, 0.4937145, 2.527614, 0, 0.03921569, 1, 1,
0.4284361, -1.065415, 2.619507, 0, 0.03529412, 1, 1,
0.4315064, -0.08434443, 1.295008, 0, 0.02745098, 1, 1,
0.4323057, -0.4047917, 2.349648, 0, 0.02352941, 1, 1,
0.4346996, 0.6224555, 3.204949, 0, 0.01568628, 1, 1,
0.4390248, 0.07005232, 0.3026292, 0, 0.01176471, 1, 1,
0.4395506, -0.1185836, 3.634764, 0, 0.003921569, 1, 1,
0.4421901, 1.724468, 0.7089596, 0.003921569, 0, 1, 1,
0.4427971, -0.134758, 3.839401, 0.007843138, 0, 1, 1,
0.4434677, 0.3397823, 0.5430536, 0.01568628, 0, 1, 1,
0.4435855, 1.53563, 0.9744875, 0.01960784, 0, 1, 1,
0.4552568, -1.287503, 2.789558, 0.02745098, 0, 1, 1,
0.4559886, 0.6565628, -0.5603628, 0.03137255, 0, 1, 1,
0.4638529, 0.1840836, 1.061621, 0.03921569, 0, 1, 1,
0.4639028, -0.02378336, 1.135771, 0.04313726, 0, 1, 1,
0.4643553, 1.930614, 0.9712551, 0.05098039, 0, 1, 1,
0.4659673, -1.306047, 2.9804, 0.05490196, 0, 1, 1,
0.4697313, 0.6296822, 0.2823862, 0.0627451, 0, 1, 1,
0.473449, 0.1387268, -0.6926256, 0.06666667, 0, 1, 1,
0.4762842, 0.3763357, 1.055314, 0.07450981, 0, 1, 1,
0.4805993, -0.6086454, 2.219371, 0.07843138, 0, 1, 1,
0.4848132, 0.5136965, -0.2746701, 0.08627451, 0, 1, 1,
0.4904869, -0.3617624, 3.001911, 0.09019608, 0, 1, 1,
0.4944968, 1.476581, -0.6661832, 0.09803922, 0, 1, 1,
0.4953533, -0.6964782, 3.764989, 0.1058824, 0, 1, 1,
0.4958792, -0.300194, 2.453897, 0.1098039, 0, 1, 1,
0.4981176, -1.238493, 1.506584, 0.1176471, 0, 1, 1,
0.5064328, 0.01182572, 1.217852, 0.1215686, 0, 1, 1,
0.5068313, 0.55576, 1.066038, 0.1294118, 0, 1, 1,
0.5121419, 1.665912, 0.1957807, 0.1333333, 0, 1, 1,
0.5136978, 1.666061, -0.5221467, 0.1411765, 0, 1, 1,
0.5146736, -1.899318, 2.854075, 0.145098, 0, 1, 1,
0.5171865, -1.138554, 3.465402, 0.1529412, 0, 1, 1,
0.5259526, -1.104225, 3.477774, 0.1568628, 0, 1, 1,
0.5278667, -0.3380656, 0.6250592, 0.1647059, 0, 1, 1,
0.5298781, 0.8009053, 0.5939854, 0.1686275, 0, 1, 1,
0.5366581, 1.377781, 0.1631572, 0.1764706, 0, 1, 1,
0.536671, -1.353015, 2.791994, 0.1803922, 0, 1, 1,
0.5423557, -0.9862497, 1.359755, 0.1882353, 0, 1, 1,
0.5432974, 0.5668207, 0.9429102, 0.1921569, 0, 1, 1,
0.5435562, 0.3681083, 0.9434382, 0.2, 0, 1, 1,
0.5453305, -0.4098282, 2.025633, 0.2078431, 0, 1, 1,
0.5455055, -1.058978, 3.395738, 0.2117647, 0, 1, 1,
0.555381, -0.2492948, 2.721379, 0.2196078, 0, 1, 1,
0.5557402, -0.7340311, 3.336393, 0.2235294, 0, 1, 1,
0.5632073, -0.5939361, 3.708323, 0.2313726, 0, 1, 1,
0.5660912, 0.5948297, 2.705604, 0.2352941, 0, 1, 1,
0.5670493, 0.9785209, -0.2071488, 0.2431373, 0, 1, 1,
0.5678241, 0.8186336, 3.023441, 0.2470588, 0, 1, 1,
0.5733739, -1.704985, 3.095516, 0.254902, 0, 1, 1,
0.5760202, -0.9328391, 2.629342, 0.2588235, 0, 1, 1,
0.5769315, -0.7271502, 2.294183, 0.2666667, 0, 1, 1,
0.5798241, -0.6083781, 1.922427, 0.2705882, 0, 1, 1,
0.5831093, -1.265053, 3.417283, 0.2784314, 0, 1, 1,
0.5839714, -1.69976, 2.091032, 0.282353, 0, 1, 1,
0.5847796, 0.7526866, 0.789284, 0.2901961, 0, 1, 1,
0.5856357, 0.8393043, -0.8182466, 0.2941177, 0, 1, 1,
0.5899103, -0.7402185, 0.7343662, 0.3019608, 0, 1, 1,
0.6002243, 0.2086305, 1.330166, 0.3098039, 0, 1, 1,
0.6009299, 1.213953, -0.1858428, 0.3137255, 0, 1, 1,
0.6033598, -0.7210207, 2.512148, 0.3215686, 0, 1, 1,
0.6059353, -1.164436, 2.59119, 0.3254902, 0, 1, 1,
0.6062829, 0.3783793, 1.480159, 0.3333333, 0, 1, 1,
0.6063492, 0.5461509, -0.8553692, 0.3372549, 0, 1, 1,
0.6093853, -0.5093623, 0.9062198, 0.345098, 0, 1, 1,
0.6164484, -0.9605632, 2.019023, 0.3490196, 0, 1, 1,
0.6193206, 0.5498043, -0.1282562, 0.3568628, 0, 1, 1,
0.6197723, -0.8770455, 4.718886, 0.3607843, 0, 1, 1,
0.62572, -1.104437, 3.234963, 0.3686275, 0, 1, 1,
0.6282244, -1.595086, 1.757913, 0.372549, 0, 1, 1,
0.6288801, 2.373923, 0.6000635, 0.3803922, 0, 1, 1,
0.6315528, 1.257056, -0.7779689, 0.3843137, 0, 1, 1,
0.6321896, 1.157158, 1.619539, 0.3921569, 0, 1, 1,
0.6352065, 0.1120509, 2.604045, 0.3960784, 0, 1, 1,
0.6379402, 1.022518, 1.864866, 0.4039216, 0, 1, 1,
0.6387487, -1.08005, 2.822416, 0.4117647, 0, 1, 1,
0.6388413, -0.2038461, 3.359234, 0.4156863, 0, 1, 1,
0.6403129, -0.4301454, 2.886175, 0.4235294, 0, 1, 1,
0.6417233, 1.187782, -0.6906937, 0.427451, 0, 1, 1,
0.6421867, -1.332924, 2.527195, 0.4352941, 0, 1, 1,
0.6507885, 1.090766, 2.376338, 0.4392157, 0, 1, 1,
0.6644951, -1.100823, 1.112212, 0.4470588, 0, 1, 1,
0.666508, -0.9820585, 1.15344, 0.4509804, 0, 1, 1,
0.672921, 0.5919828, -0.3257239, 0.4588235, 0, 1, 1,
0.6755204, 1.834004, 0.2977691, 0.4627451, 0, 1, 1,
0.676244, -1.080984, 1.596744, 0.4705882, 0, 1, 1,
0.6790371, -0.7425198, 1.340141, 0.4745098, 0, 1, 1,
0.6836769, -0.2949841, 1.838607, 0.4823529, 0, 1, 1,
0.6862663, -0.987685, 3.865436, 0.4862745, 0, 1, 1,
0.6953341, 0.960857, -1.300279, 0.4941176, 0, 1, 1,
0.7003983, -0.9250442, 0.9019575, 0.5019608, 0, 1, 1,
0.7077481, 1.997471, 1.256016, 0.5058824, 0, 1, 1,
0.7086378, -0.09099304, -0.111069, 0.5137255, 0, 1, 1,
0.7125503, 0.4411671, 0.7419716, 0.5176471, 0, 1, 1,
0.713288, -0.2199458, 1.990716, 0.5254902, 0, 1, 1,
0.7138612, -0.3871989, 0.9419181, 0.5294118, 0, 1, 1,
0.7201719, -0.7010681, 1.163127, 0.5372549, 0, 1, 1,
0.7214336, 0.09768762, 1.484222, 0.5411765, 0, 1, 1,
0.7216421, 1.871449, 0.254564, 0.5490196, 0, 1, 1,
0.7221969, 0.5712939, 1.286831, 0.5529412, 0, 1, 1,
0.7250102, -1.616388, 2.371026, 0.5607843, 0, 1, 1,
0.7258311, 1.499795, 0.4235226, 0.5647059, 0, 1, 1,
0.7269799, -0.5994937, 0.8851351, 0.572549, 0, 1, 1,
0.7296304, 0.4702265, 0.09120683, 0.5764706, 0, 1, 1,
0.7334999, -0.117653, 0.53292, 0.5843138, 0, 1, 1,
0.7378018, -0.04549601, 1.097197, 0.5882353, 0, 1, 1,
0.7383196, -2.007216, 4.160806, 0.5960785, 0, 1, 1,
0.7450859, -1.389561, 2.049436, 0.6039216, 0, 1, 1,
0.7453573, 2.637545, 0.02322632, 0.6078432, 0, 1, 1,
0.7498894, 0.7992507, -0.1774173, 0.6156863, 0, 1, 1,
0.7505244, -1.385186, 2.529162, 0.6196079, 0, 1, 1,
0.7538273, 0.2532017, -0.4059497, 0.627451, 0, 1, 1,
0.7600932, -0.5720847, 2.19278, 0.6313726, 0, 1, 1,
0.7664397, 1.305946, 2.135337, 0.6392157, 0, 1, 1,
0.7703764, 0.4807228, 1.932072, 0.6431373, 0, 1, 1,
0.7706299, 0.6667775, 1.491343, 0.6509804, 0, 1, 1,
0.7805963, 0.4038504, 3.153667, 0.654902, 0, 1, 1,
0.7842324, 1.544615, 2.014283, 0.6627451, 0, 1, 1,
0.7901562, 1.736656, 1.271821, 0.6666667, 0, 1, 1,
0.790204, 0.8849739, 2.376123, 0.6745098, 0, 1, 1,
0.7903427, 0.9251746, 0.8830218, 0.6784314, 0, 1, 1,
0.7921853, 0.2224112, 1.616821, 0.6862745, 0, 1, 1,
0.7935799, 1.393723, 0.5917574, 0.6901961, 0, 1, 1,
0.8000633, 0.8031459, 0.7503105, 0.6980392, 0, 1, 1,
0.8005171, -0.09490404, 1.689198, 0.7058824, 0, 1, 1,
0.8069738, 0.04990386, 2.891162, 0.7098039, 0, 1, 1,
0.8102378, 0.9846799, 0.7837257, 0.7176471, 0, 1, 1,
0.8130211, 0.2849253, 1.020315, 0.7215686, 0, 1, 1,
0.815244, 0.437274, -0.2829989, 0.7294118, 0, 1, 1,
0.815653, -1.376727, 1.309673, 0.7333333, 0, 1, 1,
0.8188699, 0.9377869, 1.177975, 0.7411765, 0, 1, 1,
0.8193222, -0.00154569, -0.6238826, 0.7450981, 0, 1, 1,
0.8204138, 1.098086, 0.3286276, 0.7529412, 0, 1, 1,
0.8365854, -1.096325, 1.654605, 0.7568628, 0, 1, 1,
0.8417919, -0.1603038, 0.6075338, 0.7647059, 0, 1, 1,
0.848886, -0.2949475, 2.334669, 0.7686275, 0, 1, 1,
0.8555259, 0.6650529, 1.414315, 0.7764706, 0, 1, 1,
0.8655177, -0.9014586, 1.845042, 0.7803922, 0, 1, 1,
0.8662012, -3.148929, 2.431895, 0.7882353, 0, 1, 1,
0.8665604, -1.347395, 4.792256, 0.7921569, 0, 1, 1,
0.8677435, -0.06464503, 2.307601, 0.8, 0, 1, 1,
0.8750412, 2.054164, 1.181856, 0.8078431, 0, 1, 1,
0.875115, 0.4454217, 1.49582, 0.8117647, 0, 1, 1,
0.876348, -0.1760306, 4.192556, 0.8196079, 0, 1, 1,
0.8805689, -1.141247, 3.164272, 0.8235294, 0, 1, 1,
0.8832439, 0.2502155, 0.6168566, 0.8313726, 0, 1, 1,
0.8890306, 0.3842518, 2.287964, 0.8352941, 0, 1, 1,
0.88932, 0.7558532, 0.5512422, 0.8431373, 0, 1, 1,
0.8905651, 0.1572867, 0.2527319, 0.8470588, 0, 1, 1,
0.892976, 1.569042, 2.026917, 0.854902, 0, 1, 1,
0.8961777, -1.025016, 1.5509, 0.8588235, 0, 1, 1,
0.9016158, -0.2575667, 3.091355, 0.8666667, 0, 1, 1,
0.9047241, -1.25268, 2.997282, 0.8705882, 0, 1, 1,
0.9073817, 0.6791539, 1.955883, 0.8784314, 0, 1, 1,
0.9119785, 0.2933533, 3.021504, 0.8823529, 0, 1, 1,
0.9120343, -1.128633, 1.245763, 0.8901961, 0, 1, 1,
0.9141703, -0.5465173, 2.664559, 0.8941177, 0, 1, 1,
0.9143007, -1.150554, 3.457006, 0.9019608, 0, 1, 1,
0.9170033, 0.6896766, 1.28664, 0.9098039, 0, 1, 1,
0.9179548, 0.7763041, 0.6789705, 0.9137255, 0, 1, 1,
0.9180891, -0.8448681, 3.845401, 0.9215686, 0, 1, 1,
0.9223251, 0.5159597, 0.6088345, 0.9254902, 0, 1, 1,
0.922991, 0.876211, -0.3604972, 0.9333333, 0, 1, 1,
0.9276978, 1.907415, 1.237641, 0.9372549, 0, 1, 1,
0.9327018, -0.847173, 2.735028, 0.945098, 0, 1, 1,
0.9332988, 1.091274, 1.408855, 0.9490196, 0, 1, 1,
0.9505748, 1.514168, 1.439875, 0.9568627, 0, 1, 1,
0.9516863, -0.901594, 2.362522, 0.9607843, 0, 1, 1,
0.9565681, -0.2660667, 1.337565, 0.9686275, 0, 1, 1,
0.9821541, 0.8901087, -0.734476, 0.972549, 0, 1, 1,
0.9900157, 0.9174877, 1.491534, 0.9803922, 0, 1, 1,
1.00072, -1.403554, 3.561646, 0.9843137, 0, 1, 1,
1.002358, -1.334222, 1.120971, 0.9921569, 0, 1, 1,
1.004417, 0.3814797, 1.166873, 0.9960784, 0, 1, 1,
1.008772, 2.36554, 0.907186, 1, 0, 0.9960784, 1,
1.02351, 0.2760401, 0.223543, 1, 0, 0.9882353, 1,
1.024721, 0.09899778, -0.3662144, 1, 0, 0.9843137, 1,
1.024805, 0.3465014, 1.561554, 1, 0, 0.9764706, 1,
1.0299, -0.7776335, 0.8910003, 1, 0, 0.972549, 1,
1.033107, 0.526886, 0.5502439, 1, 0, 0.9647059, 1,
1.03396, -0.8687972, 1.285612, 1, 0, 0.9607843, 1,
1.035655, 0.1485876, 0.1769857, 1, 0, 0.9529412, 1,
1.036317, 0.02607891, 1.656128, 1, 0, 0.9490196, 1,
1.036656, -0.5111221, 1.583911, 1, 0, 0.9411765, 1,
1.037448, 0.4554543, 2.290277, 1, 0, 0.9372549, 1,
1.049909, 0.7664172, 1.379351, 1, 0, 0.9294118, 1,
1.051532, 0.8024892, 0.3378733, 1, 0, 0.9254902, 1,
1.052034, -1.4944, 3.533741, 1, 0, 0.9176471, 1,
1.054765, -1.928314, 3.393806, 1, 0, 0.9137255, 1,
1.056141, -1.788526, 2.810528, 1, 0, 0.9058824, 1,
1.057188, 0.5359541, -0.6379058, 1, 0, 0.9019608, 1,
1.058979, 0.14238, 1.464612, 1, 0, 0.8941177, 1,
1.060848, -0.3346794, 1.577448, 1, 0, 0.8862745, 1,
1.065619, -0.9528435, 2.526896, 1, 0, 0.8823529, 1,
1.067181, 0.8863528, 1.346349, 1, 0, 0.8745098, 1,
1.067924, -0.3524163, 3.775111, 1, 0, 0.8705882, 1,
1.074794, -1.1424, 2.546521, 1, 0, 0.8627451, 1,
1.082346, 0.504629, 0.7674596, 1, 0, 0.8588235, 1,
1.0907, -0.1514073, 3.054511, 1, 0, 0.8509804, 1,
1.093321, -1.156229, 2.749359, 1, 0, 0.8470588, 1,
1.094511, -0.5039997, 2.030011, 1, 0, 0.8392157, 1,
1.099598, -0.9683878, 3.354863, 1, 0, 0.8352941, 1,
1.101386, -1.117815, 2.878541, 1, 0, 0.827451, 1,
1.105401, 0.6320471, 2.054521, 1, 0, 0.8235294, 1,
1.107131, -0.07353582, 0.4134406, 1, 0, 0.8156863, 1,
1.130868, 2.684807, -0.1361597, 1, 0, 0.8117647, 1,
1.141245, 0.6315641, 1.38841, 1, 0, 0.8039216, 1,
1.146899, -0.5087462, 1.274175, 1, 0, 0.7960784, 1,
1.14696, -0.6814376, 2.886412, 1, 0, 0.7921569, 1,
1.153549, -1.118729, 2.174284, 1, 0, 0.7843137, 1,
1.165842, 0.4082664, -0.2593624, 1, 0, 0.7803922, 1,
1.18845, 0.6289465, 0.9116164, 1, 0, 0.772549, 1,
1.190126, -1.038947, 1.330625, 1, 0, 0.7686275, 1,
1.203524, 0.6040058, 2.08382, 1, 0, 0.7607843, 1,
1.212132, -0.2960248, 1.456213, 1, 0, 0.7568628, 1,
1.212996, 1.391381, -1.147704, 1, 0, 0.7490196, 1,
1.215946, -0.05943339, 1.794206, 1, 0, 0.7450981, 1,
1.219756, 0.7600557, 0.7273225, 1, 0, 0.7372549, 1,
1.226266, 0.4395159, 2.333951, 1, 0, 0.7333333, 1,
1.228711, 0.1388645, 2.033534, 1, 0, 0.7254902, 1,
1.232242, 0.62456, -0.1187879, 1, 0, 0.7215686, 1,
1.234407, -0.1722402, 2.325562, 1, 0, 0.7137255, 1,
1.236882, 0.4046899, 0.703012, 1, 0, 0.7098039, 1,
1.236883, -0.2650429, 0.5503068, 1, 0, 0.7019608, 1,
1.23866, 0.8266327, 0.7286939, 1, 0, 0.6941177, 1,
1.238774, 0.1489271, 3.793499, 1, 0, 0.6901961, 1,
1.259103, 0.1541666, 2.801152, 1, 0, 0.682353, 1,
1.268151, 0.929939, -0.3485083, 1, 0, 0.6784314, 1,
1.271413, 1.114098, -0.227001, 1, 0, 0.6705883, 1,
1.276813, -0.08749389, 1.900399, 1, 0, 0.6666667, 1,
1.285046, -0.4134259, 1.365572, 1, 0, 0.6588235, 1,
1.293185, 2.103652, -1.172561, 1, 0, 0.654902, 1,
1.294559, -0.7382275, 0.5747626, 1, 0, 0.6470588, 1,
1.296301, -0.9742107, 2.339571, 1, 0, 0.6431373, 1,
1.313636, 0.7691538, 3.476485, 1, 0, 0.6352941, 1,
1.316638, -1.360747, 1.520826, 1, 0, 0.6313726, 1,
1.320704, 1.23134, 0.8275936, 1, 0, 0.6235294, 1,
1.321306, -0.1992923, 1.310112, 1, 0, 0.6196079, 1,
1.324111, -0.9311378, 3.623273, 1, 0, 0.6117647, 1,
1.332665, -1.932668, 1.996757, 1, 0, 0.6078432, 1,
1.335606, -0.001372214, 2.957341, 1, 0, 0.6, 1,
1.33716, 0.779567, 2.849424, 1, 0, 0.5921569, 1,
1.353254, 2.073334, 2.056031, 1, 0, 0.5882353, 1,
1.364881, 0.894143, -0.9721324, 1, 0, 0.5803922, 1,
1.367332, 1.479622, 0.5508119, 1, 0, 0.5764706, 1,
1.369593, -1.95982, 1.567853, 1, 0, 0.5686275, 1,
1.374395, 0.09879103, 1.996005, 1, 0, 0.5647059, 1,
1.37847, -0.6997269, 2.936695, 1, 0, 0.5568628, 1,
1.383166, -0.7414688, 2.38699, 1, 0, 0.5529412, 1,
1.383441, 0.8858667, -0.4120992, 1, 0, 0.5450981, 1,
1.396796, 1.228573, 1.240091, 1, 0, 0.5411765, 1,
1.4173, 0.7571192, -0.02707683, 1, 0, 0.5333334, 1,
1.418705, 0.9930704, 2.496293, 1, 0, 0.5294118, 1,
1.419473, -2.824509, -0.01556396, 1, 0, 0.5215687, 1,
1.423714, -0.3897964, 2.053194, 1, 0, 0.5176471, 1,
1.425496, 0.5337632, 1.672895, 1, 0, 0.509804, 1,
1.451155, -1.27584, 1.882641, 1, 0, 0.5058824, 1,
1.451195, 1.113572, -1.304704, 1, 0, 0.4980392, 1,
1.452601, 0.5767928, -0.528531, 1, 0, 0.4901961, 1,
1.459701, 0.004084349, 0.2521222, 1, 0, 0.4862745, 1,
1.460281, -2.388024, 1.767803, 1, 0, 0.4784314, 1,
1.461826, -1.450865, 2.435352, 1, 0, 0.4745098, 1,
1.464992, 1.646395, 1.254167, 1, 0, 0.4666667, 1,
1.469074, 0.2407341, 1.948509, 1, 0, 0.4627451, 1,
1.475763, -1.590175, 1.136726, 1, 0, 0.454902, 1,
1.477335, -0.7074465, 0.3674498, 1, 0, 0.4509804, 1,
1.47803, 0.01786033, 1.896453, 1, 0, 0.4431373, 1,
1.481268, -2.228776, 2.34274, 1, 0, 0.4392157, 1,
1.48167, 0.6743411, 0.5174851, 1, 0, 0.4313726, 1,
1.48492, -2.398542, 2.472087, 1, 0, 0.427451, 1,
1.501839, -0.5186586, 2.841078, 1, 0, 0.4196078, 1,
1.510478, 0.862655, 0.6854777, 1, 0, 0.4156863, 1,
1.514414, 1.304756, 1.026051, 1, 0, 0.4078431, 1,
1.51752, 0.448039, 2.577044, 1, 0, 0.4039216, 1,
1.519064, -0.8368102, 1.651341, 1, 0, 0.3960784, 1,
1.522499, 0.2480157, 1.290862, 1, 0, 0.3882353, 1,
1.539649, 1.651417, 0.9978952, 1, 0, 0.3843137, 1,
1.540836, 0.005064461, 0.2881692, 1, 0, 0.3764706, 1,
1.542312, -0.7582582, 2.35611, 1, 0, 0.372549, 1,
1.559022, -0.4466438, 1.738148, 1, 0, 0.3647059, 1,
1.564602, -0.3422376, 1.462568, 1, 0, 0.3607843, 1,
1.571784, 0.8742571, -0.2767512, 1, 0, 0.3529412, 1,
1.580998, 1.053883, 1.495131, 1, 0, 0.3490196, 1,
1.591322, -1.401895, 3.229547, 1, 0, 0.3411765, 1,
1.608004, -0.02279819, 1.951416, 1, 0, 0.3372549, 1,
1.614654, 0.5818984, 1.14214, 1, 0, 0.3294118, 1,
1.622147, 1.88245, -0.8162689, 1, 0, 0.3254902, 1,
1.626107, -1.085751, 3.814581, 1, 0, 0.3176471, 1,
1.650901, 0.6407884, 1.83106, 1, 0, 0.3137255, 1,
1.661881, -0.8195277, 2.31016, 1, 0, 0.3058824, 1,
1.673477, 0.03644213, 0.9492414, 1, 0, 0.2980392, 1,
1.673517, -0.817714, 2.424041, 1, 0, 0.2941177, 1,
1.675, -1.853786, 2.523484, 1, 0, 0.2862745, 1,
1.676208, 1.554578, 1.550184, 1, 0, 0.282353, 1,
1.696915, -0.2403844, 1.868227, 1, 0, 0.2745098, 1,
1.700633, -1.936095, 0.8870268, 1, 0, 0.2705882, 1,
1.725297, -0.1777321, -0.3744471, 1, 0, 0.2627451, 1,
1.736175, 0.5283752, 1.416171, 1, 0, 0.2588235, 1,
1.739617, -1.860855, -0.2372073, 1, 0, 0.2509804, 1,
1.771975, -0.04343721, 1.253708, 1, 0, 0.2470588, 1,
1.77237, -0.880266, 0.608015, 1, 0, 0.2392157, 1,
1.775732, 0.6949586, 1.778338, 1, 0, 0.2352941, 1,
1.783124, -1.402012, 1.445589, 1, 0, 0.227451, 1,
1.81984, 2.182364, 0.6593617, 1, 0, 0.2235294, 1,
1.829264, -0.2307673, 1.193963, 1, 0, 0.2156863, 1,
1.829641, 0.05803686, 0.8386418, 1, 0, 0.2117647, 1,
1.830048, -0.3057559, 0.5796966, 1, 0, 0.2039216, 1,
1.830838, -0.706232, 2.848828, 1, 0, 0.1960784, 1,
1.835672, 0.2634223, 1.043219, 1, 0, 0.1921569, 1,
1.837969, -1.126795, 0.9578771, 1, 0, 0.1843137, 1,
1.839415, -0.190233, 1.363747, 1, 0, 0.1803922, 1,
1.843412, 0.1355536, 1.981612, 1, 0, 0.172549, 1,
1.87851, 0.3244984, 1.737525, 1, 0, 0.1686275, 1,
1.882389, 0.3999083, 2.624094, 1, 0, 0.1607843, 1,
1.921827, -1.175416, 1.404465, 1, 0, 0.1568628, 1,
1.926017, -0.9342179, 1.995692, 1, 0, 0.1490196, 1,
1.930479, -0.4486097, 1.474863, 1, 0, 0.145098, 1,
1.932918, 0.7456198, 1.089814, 1, 0, 0.1372549, 1,
1.951177, -0.1176174, -0.7563418, 1, 0, 0.1333333, 1,
2.050449, 1.560183, 1.127844, 1, 0, 0.1254902, 1,
2.097964, 1.311456, 0.5268896, 1, 0, 0.1215686, 1,
2.141078, -0.9139839, 4.295556, 1, 0, 0.1137255, 1,
2.147254, 1.231692, 2.142188, 1, 0, 0.1098039, 1,
2.167617, -1.15978, 1.0473, 1, 0, 0.1019608, 1,
2.198487, 0.912011, 2.004641, 1, 0, 0.09411765, 1,
2.224806, -0.3649125, 3.136694, 1, 0, 0.09019608, 1,
2.236977, -0.2216952, 0.6803527, 1, 0, 0.08235294, 1,
2.3371, 0.04264128, 2.96331, 1, 0, 0.07843138, 1,
2.378989, -0.3877815, 2.399396, 1, 0, 0.07058824, 1,
2.389894, 0.5476157, 4.378855, 1, 0, 0.06666667, 1,
2.414564, 0.05093527, 2.40448, 1, 0, 0.05882353, 1,
2.42928, -0.9095135, 2.42748, 1, 0, 0.05490196, 1,
2.4541, 0.9866452, 0.1242736, 1, 0, 0.04705882, 1,
2.498841, 0.5508295, 1.902126, 1, 0, 0.04313726, 1,
2.52454, -0.3240162, 1.7264, 1, 0, 0.03529412, 1,
2.604869, -0.8682766, 1.625243, 1, 0, 0.03137255, 1,
2.676468, -0.2050089, 1.272061, 1, 0, 0.02352941, 1,
2.728679, -0.8044434, 0.5428955, 1, 0, 0.01960784, 1,
2.998744, 1.239441, 2.025661, 1, 0, 0.01176471, 1,
3.065385, -0.608309, 1.440103, 1, 0, 0.007843138, 1
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
-0.3027042, -4.210268, -8.065544, 0, -0.5, 0.5, 0.5,
-0.3027042, -4.210268, -8.065544, 1, -0.5, 0.5, 0.5,
-0.3027042, -4.210268, -8.065544, 1, 1.5, 0.5, 0.5,
-0.3027042, -4.210268, -8.065544, 0, 1.5, 0.5, 0.5
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
-4.812575, -0.01813543, -8.065544, 0, -0.5, 0.5, 0.5,
-4.812575, -0.01813543, -8.065544, 1, -0.5, 0.5, 0.5,
-4.812575, -0.01813543, -8.065544, 1, 1.5, 0.5, 0.5,
-4.812575, -0.01813543, -8.065544, 0, 1.5, 0.5, 0.5
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
-4.812575, -4.210268, -0.4519711, 0, -0.5, 0.5, 0.5,
-4.812575, -4.210268, -0.4519711, 1, -0.5, 0.5, 0.5,
-4.812575, -4.210268, -0.4519711, 1, 1.5, 0.5, 0.5,
-4.812575, -4.210268, -0.4519711, 0, 1.5, 0.5, 0.5
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
-3, -3.242853, -6.308566,
3, -3.242853, -6.308566,
-3, -3.242853, -6.308566,
-3, -3.404088, -6.601396,
-2, -3.242853, -6.308566,
-2, -3.404088, -6.601396,
-1, -3.242853, -6.308566,
-1, -3.404088, -6.601396,
0, -3.242853, -6.308566,
0, -3.404088, -6.601396,
1, -3.242853, -6.308566,
1, -3.404088, -6.601396,
2, -3.242853, -6.308566,
2, -3.404088, -6.601396,
3, -3.242853, -6.308566,
3, -3.404088, -6.601396
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
-3, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
-3, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
-3, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
-3, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
-2, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
-2, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
-2, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
-2, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
-1, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
-1, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
-1, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
-1, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
0, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
0, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
0, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
0, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
1, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
1, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
1, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
1, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
2, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
2, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
2, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
2, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5,
3, -3.72656, -7.187055, 0, -0.5, 0.5, 0.5,
3, -3.72656, -7.187055, 1, -0.5, 0.5, 0.5,
3, -3.72656, -7.187055, 1, 1.5, 0.5, 0.5,
3, -3.72656, -7.187055, 0, 1.5, 0.5, 0.5
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
-3.771836, -3, -6.308566,
-3.771836, 3, -6.308566,
-3.771836, -3, -6.308566,
-3.945292, -3, -6.601396,
-3.771836, -2, -6.308566,
-3.945292, -2, -6.601396,
-3.771836, -1, -6.308566,
-3.945292, -1, -6.601396,
-3.771836, 0, -6.308566,
-3.945292, 0, -6.601396,
-3.771836, 1, -6.308566,
-3.945292, 1, -6.601396,
-3.771836, 2, -6.308566,
-3.945292, 2, -6.601396,
-3.771836, 3, -6.308566,
-3.945292, 3, -6.601396
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
-4.292205, -3, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, -3, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, -3, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, -3, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, -2, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, -2, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, -2, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, -2, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, -1, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, -1, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, -1, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, -1, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, 0, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, 0, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, 0, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, 0, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, 1, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, 1, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, 1, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, 1, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, 2, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, 2, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, 2, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, 2, -7.187055, 0, 1.5, 0.5, 0.5,
-4.292205, 3, -7.187055, 0, -0.5, 0.5, 0.5,
-4.292205, 3, -7.187055, 1, -0.5, 0.5, 0.5,
-4.292205, 3, -7.187055, 1, 1.5, 0.5, 0.5,
-4.292205, 3, -7.187055, 0, 1.5, 0.5, 0.5
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
-3.771836, -3.242853, -6,
-3.771836, -3.242853, 4,
-3.771836, -3.242853, -6,
-3.945292, -3.404088, -6,
-3.771836, -3.242853, -4,
-3.945292, -3.404088, -4,
-3.771836, -3.242853, -2,
-3.945292, -3.404088, -2,
-3.771836, -3.242853, 0,
-3.945292, -3.404088, 0,
-3.771836, -3.242853, 2,
-3.945292, -3.404088, 2,
-3.771836, -3.242853, 4,
-3.945292, -3.404088, 4
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
-4.292205, -3.72656, -6, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -6, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -6, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, -6, 0, 1.5, 0.5, 0.5,
-4.292205, -3.72656, -4, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -4, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -4, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, -4, 0, 1.5, 0.5, 0.5,
-4.292205, -3.72656, -2, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -2, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, -2, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, -2, 0, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 0, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 0, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 0, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 0, 0, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 2, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 2, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 2, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 2, 0, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 4, 0, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 4, 1, -0.5, 0.5, 0.5,
-4.292205, -3.72656, 4, 1, 1.5, 0.5, 0.5,
-4.292205, -3.72656, 4, 0, 1.5, 0.5, 0.5
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
-3.771836, -3.242853, -6.308566,
-3.771836, 3.206582, -6.308566,
-3.771836, -3.242853, 5.404624,
-3.771836, 3.206582, 5.404624,
-3.771836, -3.242853, -6.308566,
-3.771836, -3.242853, 5.404624,
-3.771836, 3.206582, -6.308566,
-3.771836, 3.206582, 5.404624,
-3.771836, -3.242853, -6.308566,
3.166427, -3.242853, -6.308566,
-3.771836, -3.242853, 5.404624,
3.166427, -3.242853, 5.404624,
-3.771836, 3.206582, -6.308566,
3.166427, 3.206582, -6.308566,
-3.771836, 3.206582, 5.404624,
3.166427, 3.206582, 5.404624,
3.166427, -3.242853, -6.308566,
3.166427, 3.206582, -6.308566,
3.166427, -3.242853, 5.404624,
3.166427, 3.206582, 5.404624,
3.166427, -3.242853, -6.308566,
3.166427, -3.242853, 5.404624,
3.166427, 3.206582, -6.308566,
3.166427, 3.206582, 5.404624
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
var radius = 8.04405;
var distance = 35.78889;
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
mvMatrix.translate( 0.3027042, 0.01813543, 0.4519711 );
mvMatrix.scale( 1.253539, 1.34855, 0.7425292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78889);
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


