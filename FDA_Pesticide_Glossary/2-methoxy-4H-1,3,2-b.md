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
-3.94159, 0.008290218, -1.44022, 1, 0, 0, 1,
-2.786822, 0.9486277, -2.494684, 1, 0.007843138, 0, 1,
-2.779707, -1.763389, -1.02369, 1, 0.01176471, 0, 1,
-2.553055, 0.5388792, -0.1273349, 1, 0.01960784, 0, 1,
-2.26912, 1.093954, -0.484948, 1, 0.02352941, 0, 1,
-2.266601, 0.3675288, -0.8306726, 1, 0.03137255, 0, 1,
-2.261611, 0.948434, 0.341647, 1, 0.03529412, 0, 1,
-2.243422, 1.11505, -0.4738672, 1, 0.04313726, 0, 1,
-2.200264, -0.2108856, -1.21069, 1, 0.04705882, 0, 1,
-2.192933, -0.2947603, -2.063231, 1, 0.05490196, 0, 1,
-2.176164, 0.5264246, -0.2142841, 1, 0.05882353, 0, 1,
-2.171534, -0.4697039, -2.411465, 1, 0.06666667, 0, 1,
-2.163096, 0.09810098, -1.025658, 1, 0.07058824, 0, 1,
-2.137746, 0.3800235, -0.3624131, 1, 0.07843138, 0, 1,
-2.052371, 0.7862005, -0.9761262, 1, 0.08235294, 0, 1,
-2.041396, -0.8475245, -2.369011, 1, 0.09019608, 0, 1,
-2.026536, -0.7491924, -2.919832, 1, 0.09411765, 0, 1,
-2.022647, -0.1257981, -0.7650751, 1, 0.1019608, 0, 1,
-2.016989, 3.068719, -0.9836354, 1, 0.1098039, 0, 1,
-1.999492, 1.588924, -0.07678642, 1, 0.1137255, 0, 1,
-1.989781, -0.8649018, -2.473851, 1, 0.1215686, 0, 1,
-1.987914, 0.5659814, -1.146235, 1, 0.1254902, 0, 1,
-1.964588, 0.02390956, -1.703798, 1, 0.1333333, 0, 1,
-1.956422, -0.2666858, -0.9140368, 1, 0.1372549, 0, 1,
-1.95206, -0.8623782, -1.839966, 1, 0.145098, 0, 1,
-1.941432, 0.3743426, -0.2509154, 1, 0.1490196, 0, 1,
-1.908648, 0.7396997, -0.4924387, 1, 0.1568628, 0, 1,
-1.882639, 0.6570771, -1.621512, 1, 0.1607843, 0, 1,
-1.856287, 0.1232295, -0.9461681, 1, 0.1686275, 0, 1,
-1.83577, -0.7131953, -0.5166124, 1, 0.172549, 0, 1,
-1.824039, 0.2394081, -2.823676, 1, 0.1803922, 0, 1,
-1.805196, 1.052551, -1.654949, 1, 0.1843137, 0, 1,
-1.787192, -1.867985, -1.642002, 1, 0.1921569, 0, 1,
-1.785123, 1.440371, -1.858413, 1, 0.1960784, 0, 1,
-1.77597, 0.9355424, -2.722414, 1, 0.2039216, 0, 1,
-1.773025, 2.128563, -0.07365761, 1, 0.2117647, 0, 1,
-1.765296, 1.34444, -0.7909418, 1, 0.2156863, 0, 1,
-1.74745, -1.733864, -0.8299388, 1, 0.2235294, 0, 1,
-1.715961, -0.61498, -3.150353, 1, 0.227451, 0, 1,
-1.699351, 1.045751, -0.4446343, 1, 0.2352941, 0, 1,
-1.688401, 0.4131048, -1.933991, 1, 0.2392157, 0, 1,
-1.68802, -2.162336, -0.6285405, 1, 0.2470588, 0, 1,
-1.682721, -1.071098, -0.02725472, 1, 0.2509804, 0, 1,
-1.673196, -0.09907844, -1.669187, 1, 0.2588235, 0, 1,
-1.670393, -2.46852, -2.488188, 1, 0.2627451, 0, 1,
-1.669841, -1.293767, -2.765519, 1, 0.2705882, 0, 1,
-1.664322, -0.5816939, -3.53836, 1, 0.2745098, 0, 1,
-1.66081, 0.6991119, -0.6051141, 1, 0.282353, 0, 1,
-1.65357, -1.46874, -1.499793, 1, 0.2862745, 0, 1,
-1.647197, 1.193185, -0.8777034, 1, 0.2941177, 0, 1,
-1.645237, 0.3049436, -1.251165, 1, 0.3019608, 0, 1,
-1.635065, -0.5002292, -2.345789, 1, 0.3058824, 0, 1,
-1.615929, -1.161827, -1.574878, 1, 0.3137255, 0, 1,
-1.613118, 0.9040677, 0.1722597, 1, 0.3176471, 0, 1,
-1.612388, 1.035539, -0.03798795, 1, 0.3254902, 0, 1,
-1.591614, 0.8225724, -1.680618, 1, 0.3294118, 0, 1,
-1.555333, -0.03803548, -0.6378599, 1, 0.3372549, 0, 1,
-1.552913, -0.2859347, -1.778508, 1, 0.3411765, 0, 1,
-1.53885, 0.4712776, -0.2489022, 1, 0.3490196, 0, 1,
-1.533135, 0.5484009, -1.507502, 1, 0.3529412, 0, 1,
-1.532423, -0.6729009, -2.363872, 1, 0.3607843, 0, 1,
-1.513405, -1.467981, -2.760834, 1, 0.3647059, 0, 1,
-1.512741, 0.7492145, -0.862085, 1, 0.372549, 0, 1,
-1.508615, 0.3945393, -3.646124, 1, 0.3764706, 0, 1,
-1.502465, -0.122942, -2.089515, 1, 0.3843137, 0, 1,
-1.494727, -0.3711132, -3.184038, 1, 0.3882353, 0, 1,
-1.477415, -0.8545634, -2.126956, 1, 0.3960784, 0, 1,
-1.47415, -0.8943863, -2.59633, 1, 0.4039216, 0, 1,
-1.471612, 0.9277706, -0.5123827, 1, 0.4078431, 0, 1,
-1.446936, -0.54843, -2.768517, 1, 0.4156863, 0, 1,
-1.427872, 1.383973, -1.846116, 1, 0.4196078, 0, 1,
-1.416474, 0.3829189, -2.158872, 1, 0.427451, 0, 1,
-1.399246, 0.5869551, -1.804997, 1, 0.4313726, 0, 1,
-1.398592, -1.216009, -2.806691, 1, 0.4392157, 0, 1,
-1.348972, -0.8112746, -2.056558, 1, 0.4431373, 0, 1,
-1.338246, 1.441513, -0.3767731, 1, 0.4509804, 0, 1,
-1.336392, -0.7707694, -1.659824, 1, 0.454902, 0, 1,
-1.328349, -1.35185, -3.149886, 1, 0.4627451, 0, 1,
-1.325121, -0.1267645, -2.808519, 1, 0.4666667, 0, 1,
-1.32129, -1.987588, -2.178573, 1, 0.4745098, 0, 1,
-1.319571, -2.154579, -4.865243, 1, 0.4784314, 0, 1,
-1.318567, -0.2843479, -2.271229, 1, 0.4862745, 0, 1,
-1.314134, 1.146949, -2.777489, 1, 0.4901961, 0, 1,
-1.308573, -0.2619896, -1.241288, 1, 0.4980392, 0, 1,
-1.30148, -1.231439, -2.507544, 1, 0.5058824, 0, 1,
-1.28398, 0.6774534, 0.06539805, 1, 0.509804, 0, 1,
-1.283326, -0.5436532, -2.470262, 1, 0.5176471, 0, 1,
-1.279936, -0.4284784, -1.889042, 1, 0.5215687, 0, 1,
-1.275074, -0.2319374, -2.206167, 1, 0.5294118, 0, 1,
-1.271907, -0.4333948, -2.787327, 1, 0.5333334, 0, 1,
-1.268496, -2.342804, -4.544344, 1, 0.5411765, 0, 1,
-1.267653, 0.03305036, -1.914116, 1, 0.5450981, 0, 1,
-1.26673, -0.5713434, -1.672555, 1, 0.5529412, 0, 1,
-1.266646, -0.1959869, -0.8238131, 1, 0.5568628, 0, 1,
-1.256685, -0.9001694, -3.467525, 1, 0.5647059, 0, 1,
-1.25157, 0.4293509, -0.1521601, 1, 0.5686275, 0, 1,
-1.247226, -0.575025, -2.787668, 1, 0.5764706, 0, 1,
-1.233829, 2.146878, -0.2087877, 1, 0.5803922, 0, 1,
-1.228419, -0.271799, -3.092723, 1, 0.5882353, 0, 1,
-1.225527, 0.3573239, -1.286044, 1, 0.5921569, 0, 1,
-1.220515, -1.813674, -2.306767, 1, 0.6, 0, 1,
-1.220498, 1.298654, -0.06082855, 1, 0.6078432, 0, 1,
-1.215144, -2.270658, -2.522203, 1, 0.6117647, 0, 1,
-1.214323, 0.6143285, 0.06462406, 1, 0.6196079, 0, 1,
-1.212913, -0.3570233, -2.078452, 1, 0.6235294, 0, 1,
-1.209416, -0.3353944, -2.503867, 1, 0.6313726, 0, 1,
-1.208254, 1.195842, -0.3500541, 1, 0.6352941, 0, 1,
-1.205032, -0.6674806, -0.1459157, 1, 0.6431373, 0, 1,
-1.204363, -0.2817556, -2.80571, 1, 0.6470588, 0, 1,
-1.203594, 0.772498, -1.51572, 1, 0.654902, 0, 1,
-1.182809, -0.6581873, -1.905824, 1, 0.6588235, 0, 1,
-1.179606, 0.2845896, 0.0292516, 1, 0.6666667, 0, 1,
-1.177416, 0.7386652, -2.209672, 1, 0.6705883, 0, 1,
-1.175781, 0.009793827, -0.2064499, 1, 0.6784314, 0, 1,
-1.17521, -0.1319773, -0.6482081, 1, 0.682353, 0, 1,
-1.170262, -0.4730509, -1.819949, 1, 0.6901961, 0, 1,
-1.16388, -1.169863, -2.664433, 1, 0.6941177, 0, 1,
-1.163021, 2.52642, -0.4763861, 1, 0.7019608, 0, 1,
-1.160845, -0.07253054, -0.8326953, 1, 0.7098039, 0, 1,
-1.160657, -1.054903, -1.326177, 1, 0.7137255, 0, 1,
-1.157596, 0.1344901, -1.903034, 1, 0.7215686, 0, 1,
-1.154378, 0.1750699, -2.154717, 1, 0.7254902, 0, 1,
-1.154159, 0.187516, -2.299119, 1, 0.7333333, 0, 1,
-1.147743, -1.064666, -0.8918771, 1, 0.7372549, 0, 1,
-1.145553, -0.691647, -2.461728, 1, 0.7450981, 0, 1,
-1.135431, -0.4939528, -2.183966, 1, 0.7490196, 0, 1,
-1.122312, -0.2192934, -0.4507014, 1, 0.7568628, 0, 1,
-1.121863, -1.517497, -2.944632, 1, 0.7607843, 0, 1,
-1.120258, -0.7093324, -3.020799, 1, 0.7686275, 0, 1,
-1.119564, 0.6808955, -1.17794, 1, 0.772549, 0, 1,
-1.114179, -1.49531, -1.375942, 1, 0.7803922, 0, 1,
-1.113209, 0.3738895, -1.939783, 1, 0.7843137, 0, 1,
-1.111687, 0.06078468, -1.554187, 1, 0.7921569, 0, 1,
-1.107377, -1.754279, -1.326494, 1, 0.7960784, 0, 1,
-1.10526, 0.626589, -1.834483, 1, 0.8039216, 0, 1,
-1.105002, 1.786353, 0.612576, 1, 0.8117647, 0, 1,
-1.104961, 0.2235566, -0.3790854, 1, 0.8156863, 0, 1,
-1.103215, 0.6195769, -0.8928811, 1, 0.8235294, 0, 1,
-1.094607, -2.487467, -1.349055, 1, 0.827451, 0, 1,
-1.088838, 1.548129, -0.4276155, 1, 0.8352941, 0, 1,
-1.086273, -0.04967308, -0.3506626, 1, 0.8392157, 0, 1,
-1.083028, -1.30434, -1.266691, 1, 0.8470588, 0, 1,
-1.08145, -1.428552, -1.892955, 1, 0.8509804, 0, 1,
-1.059214, -0.3013289, -2.981522, 1, 0.8588235, 0, 1,
-1.056077, -1.619984, -2.361501, 1, 0.8627451, 0, 1,
-1.051171, 1.564437, -0.7966973, 1, 0.8705882, 0, 1,
-1.042921, 1.219373, -0.4704603, 1, 0.8745098, 0, 1,
-1.035339, 1.132252, 0.1207098, 1, 0.8823529, 0, 1,
-1.022252, -0.368255, -1.494767, 1, 0.8862745, 0, 1,
-1.01184, -0.3016651, -2.282645, 1, 0.8941177, 0, 1,
-1.010697, -1.0748, -0.5082301, 1, 0.8980392, 0, 1,
-1.008527, -0.6765236, -3.070552, 1, 0.9058824, 0, 1,
-1.006355, 1.164029, -0.9350192, 1, 0.9137255, 0, 1,
-1.003142, -0.5737615, -0.943537, 1, 0.9176471, 0, 1,
-1.002789, 1.019588, -1.009533, 1, 0.9254902, 0, 1,
-0.9982244, -1.063115, -2.424113, 1, 0.9294118, 0, 1,
-0.9939572, -1.009404, -3.553467, 1, 0.9372549, 0, 1,
-0.9737735, 0.7894073, -0.3589753, 1, 0.9411765, 0, 1,
-0.9729105, -0.4599068, -1.667256, 1, 0.9490196, 0, 1,
-0.9683136, 0.3410364, -0.7523008, 1, 0.9529412, 0, 1,
-0.9671633, 0.1218536, -1.000228, 1, 0.9607843, 0, 1,
-0.9660516, -1.339909, -3.81396, 1, 0.9647059, 0, 1,
-0.9639602, -0.5711542, -1.873516, 1, 0.972549, 0, 1,
-0.9576771, -0.126824, -2.700317, 1, 0.9764706, 0, 1,
-0.9560895, 0.4087349, -1.287828, 1, 0.9843137, 0, 1,
-0.9476359, -0.7097363, -2.06512, 1, 0.9882353, 0, 1,
-0.9452514, 0.6929752, -1.164354, 1, 0.9960784, 0, 1,
-0.9407015, 1.272766, -0.7165142, 0.9960784, 1, 0, 1,
-0.9400783, 1.545658, 1.329334, 0.9921569, 1, 0, 1,
-0.9386767, 0.753711, -0.6916144, 0.9843137, 1, 0, 1,
-0.9314696, -0.655319, -3.38446, 0.9803922, 1, 0, 1,
-0.9299527, -2.244864, -2.957397, 0.972549, 1, 0, 1,
-0.9288493, 0.1544648, -2.493602, 0.9686275, 1, 0, 1,
-0.9212425, -0.2762123, -0.99584, 0.9607843, 1, 0, 1,
-0.9187858, -0.4705572, -3.170481, 0.9568627, 1, 0, 1,
-0.9151718, 0.9527984, -0.5407198, 0.9490196, 1, 0, 1,
-0.9151086, 0.7215419, -0.6864726, 0.945098, 1, 0, 1,
-0.905789, 0.2572778, -0.8067186, 0.9372549, 1, 0, 1,
-0.9055728, -0.3995242, 0.1735045, 0.9333333, 1, 0, 1,
-0.9052658, -1.192209, -2.97222, 0.9254902, 1, 0, 1,
-0.8934352, -1.617232, -3.421157, 0.9215686, 1, 0, 1,
-0.8918657, -0.2201598, -1.706436, 0.9137255, 1, 0, 1,
-0.8891467, -0.07470047, -1.933451, 0.9098039, 1, 0, 1,
-0.8800056, 1.75952, 0.0592025, 0.9019608, 1, 0, 1,
-0.877291, 0.6768556, -0.1890514, 0.8941177, 1, 0, 1,
-0.8742392, -0.9156929, -2.569458, 0.8901961, 1, 0, 1,
-0.8720052, 1.500132, 0.1538226, 0.8823529, 1, 0, 1,
-0.8681158, -1.390279, -3.171257, 0.8784314, 1, 0, 1,
-0.8679194, -0.3422129, -1.57463, 0.8705882, 1, 0, 1,
-0.8674666, 0.2210754, -2.229013, 0.8666667, 1, 0, 1,
-0.8610377, -0.6424722, -1.123914, 0.8588235, 1, 0, 1,
-0.848266, -1.39801, -2.388921, 0.854902, 1, 0, 1,
-0.8457015, 0.4963652, -1.737931, 0.8470588, 1, 0, 1,
-0.8432224, -0.16715, -2.631467, 0.8431373, 1, 0, 1,
-0.8397589, -0.5647632, -3.799581, 0.8352941, 1, 0, 1,
-0.8374357, -2.478026, -4.075761, 0.8313726, 1, 0, 1,
-0.8332376, -0.2600577, -1.029007, 0.8235294, 1, 0, 1,
-0.8285384, -0.4053317, -1.481275, 0.8196079, 1, 0, 1,
-0.8278087, 1.259348, -0.7794322, 0.8117647, 1, 0, 1,
-0.8254787, 1.2628, -1.803616, 0.8078431, 1, 0, 1,
-0.8183168, 1.282979, -1.165766, 0.8, 1, 0, 1,
-0.8164699, 1.049956, 0.8097528, 0.7921569, 1, 0, 1,
-0.8138534, 1.966531, 0.4486205, 0.7882353, 1, 0, 1,
-0.8115292, -0.321444, -1.91854, 0.7803922, 1, 0, 1,
-0.8083302, 0.3651549, -1.091123, 0.7764706, 1, 0, 1,
-0.8060615, 0.5254573, -0.1385413, 0.7686275, 1, 0, 1,
-0.803092, 0.3569399, -1.751126, 0.7647059, 1, 0, 1,
-0.7977481, -1.172213, -3.108603, 0.7568628, 1, 0, 1,
-0.796667, 1.043807, 1.664297, 0.7529412, 1, 0, 1,
-0.7965903, 0.1347283, -1.273052, 0.7450981, 1, 0, 1,
-0.7854152, -1.093986, -3.772517, 0.7411765, 1, 0, 1,
-0.7839662, -1.104541, -2.727157, 0.7333333, 1, 0, 1,
-0.7836013, -0.2155657, -0.5678927, 0.7294118, 1, 0, 1,
-0.7804714, 0.2861076, -0.170461, 0.7215686, 1, 0, 1,
-0.7777325, 1.693983, -0.2715681, 0.7176471, 1, 0, 1,
-0.7752053, 0.711415, -2.198688, 0.7098039, 1, 0, 1,
-0.7744244, 0.4570473, -1.243165, 0.7058824, 1, 0, 1,
-0.7703456, 0.432026, 0.4233607, 0.6980392, 1, 0, 1,
-0.7699733, 0.08885156, -1.967116, 0.6901961, 1, 0, 1,
-0.766842, 0.8291948, -1.236252, 0.6862745, 1, 0, 1,
-0.7652615, 0.4941168, -0.6181301, 0.6784314, 1, 0, 1,
-0.7643601, 0.1970614, -0.5564359, 0.6745098, 1, 0, 1,
-0.7370693, 1.082378, -0.5355597, 0.6666667, 1, 0, 1,
-0.7370692, -0.03106698, -1.370369, 0.6627451, 1, 0, 1,
-0.7362888, 0.5929621, -0.7529184, 0.654902, 1, 0, 1,
-0.7345389, 0.6949936, -1.704776, 0.6509804, 1, 0, 1,
-0.7267504, 0.5239139, 0.3058534, 0.6431373, 1, 0, 1,
-0.7219096, -1.286059, -2.379416, 0.6392157, 1, 0, 1,
-0.7196067, 0.08993746, -0.9743822, 0.6313726, 1, 0, 1,
-0.7149267, 0.5237856, -2.267471, 0.627451, 1, 0, 1,
-0.7124339, 0.4012719, -3.396929, 0.6196079, 1, 0, 1,
-0.7110534, 1.423609, -1.948291, 0.6156863, 1, 0, 1,
-0.7093254, -0.6852968, -2.330276, 0.6078432, 1, 0, 1,
-0.7074311, -0.61025, -3.212159, 0.6039216, 1, 0, 1,
-0.703235, 0.4979264, -1.801523, 0.5960785, 1, 0, 1,
-0.6974975, -0.2800758, -0.8817712, 0.5882353, 1, 0, 1,
-0.697025, -0.7267141, -0.9497464, 0.5843138, 1, 0, 1,
-0.6938724, -0.6029106, -2.301709, 0.5764706, 1, 0, 1,
-0.6910933, 1.0345, 0.9553593, 0.572549, 1, 0, 1,
-0.6895681, -1.039871, -3.858057, 0.5647059, 1, 0, 1,
-0.6855101, -0.7064298, -2.525486, 0.5607843, 1, 0, 1,
-0.6827635, -0.1041722, -2.642352, 0.5529412, 1, 0, 1,
-0.6806238, 1.18159, -0.02658269, 0.5490196, 1, 0, 1,
-0.680306, 1.958427, 1.6757, 0.5411765, 1, 0, 1,
-0.6774482, 1.107113, 0.8043736, 0.5372549, 1, 0, 1,
-0.6686865, 1.303172, -0.437873, 0.5294118, 1, 0, 1,
-0.6644499, 1.776785, -0.5807915, 0.5254902, 1, 0, 1,
-0.659666, 0.5181707, 0.4630361, 0.5176471, 1, 0, 1,
-0.6551476, -0.367625, -1.42474, 0.5137255, 1, 0, 1,
-0.6545994, 0.4535056, -2.510006, 0.5058824, 1, 0, 1,
-0.6497558, -1.443201, -1.827049, 0.5019608, 1, 0, 1,
-0.6423957, -0.5734195, -3.458551, 0.4941176, 1, 0, 1,
-0.6412305, 0.8254144, -0.667187, 0.4862745, 1, 0, 1,
-0.6412048, 0.3326838, -0.2654286, 0.4823529, 1, 0, 1,
-0.6368594, 0.5461266, -1.158862, 0.4745098, 1, 0, 1,
-0.633215, -0.06022045, -2.144985, 0.4705882, 1, 0, 1,
-0.6299543, 0.3206943, -1.550455, 0.4627451, 1, 0, 1,
-0.6238011, 1.008392, 0.1160539, 0.4588235, 1, 0, 1,
-0.6230963, -0.579491, -2.994727, 0.4509804, 1, 0, 1,
-0.6186284, 0.1378605, -2.228184, 0.4470588, 1, 0, 1,
-0.618216, -0.3635256, -1.118156, 0.4392157, 1, 0, 1,
-0.6076585, -0.8553441, -4.180362, 0.4352941, 1, 0, 1,
-0.6027016, -0.7292981, -3.887965, 0.427451, 1, 0, 1,
-0.598188, 0.006554788, -3.970606, 0.4235294, 1, 0, 1,
-0.5960009, 0.6681629, -0.6299497, 0.4156863, 1, 0, 1,
-0.5882381, -0.7159266, -2.253604, 0.4117647, 1, 0, 1,
-0.5822404, 0.9660862, -1.204509, 0.4039216, 1, 0, 1,
-0.5801455, -0.3008051, -1.676831, 0.3960784, 1, 0, 1,
-0.5783414, 0.1217245, -1.816548, 0.3921569, 1, 0, 1,
-0.5780999, -0.2713645, -0.4497291, 0.3843137, 1, 0, 1,
-0.5736285, -0.1973174, -4.080429, 0.3803922, 1, 0, 1,
-0.5726122, -0.1081677, -0.6615534, 0.372549, 1, 0, 1,
-0.5710297, 0.8847357, 0.7849352, 0.3686275, 1, 0, 1,
-0.5700363, 0.3924199, 0.1716342, 0.3607843, 1, 0, 1,
-0.5675433, 0.7161084, -0.5755264, 0.3568628, 1, 0, 1,
-0.563369, 1.407412, 0.6561851, 0.3490196, 1, 0, 1,
-0.562498, -0.2058943, -1.236115, 0.345098, 1, 0, 1,
-0.561021, 0.9607958, -2.273464, 0.3372549, 1, 0, 1,
-0.5605769, -0.4548208, -3.007147, 0.3333333, 1, 0, 1,
-0.5598382, -0.004417737, -3.089544, 0.3254902, 1, 0, 1,
-0.5589495, -0.4892728, -1.810036, 0.3215686, 1, 0, 1,
-0.5568056, -0.9970928, -4.412232, 0.3137255, 1, 0, 1,
-0.5558133, 0.4824782, -1.073441, 0.3098039, 1, 0, 1,
-0.5510367, -0.9892191, -1.824949, 0.3019608, 1, 0, 1,
-0.5495482, -0.4504614, -2.751605, 0.2941177, 1, 0, 1,
-0.544338, -1.04539, -1.227253, 0.2901961, 1, 0, 1,
-0.5373856, -0.9265679, -2.838244, 0.282353, 1, 0, 1,
-0.5373046, 0.3128896, -1.838598, 0.2784314, 1, 0, 1,
-0.537123, 0.6686728, -1.708486, 0.2705882, 1, 0, 1,
-0.5363746, 2.301478, -0.8091495, 0.2666667, 1, 0, 1,
-0.5362906, -0.4942281, -1.644595, 0.2588235, 1, 0, 1,
-0.5340924, 1.157531, -2.777445, 0.254902, 1, 0, 1,
-0.5331447, -2.10882, -3.864134, 0.2470588, 1, 0, 1,
-0.5295382, 0.2667706, -0.56654, 0.2431373, 1, 0, 1,
-0.5287969, 0.7665958, -0.5995461, 0.2352941, 1, 0, 1,
-0.5181811, -1.452548, -2.657579, 0.2313726, 1, 0, 1,
-0.5147316, 0.2333398, -1.078254, 0.2235294, 1, 0, 1,
-0.5088398, 1.031294, -1.697654, 0.2196078, 1, 0, 1,
-0.5075954, 1.40796, 0.08238917, 0.2117647, 1, 0, 1,
-0.5047938, 1.419171, 0.7389258, 0.2078431, 1, 0, 1,
-0.5031124, 0.9045612, 0.08874804, 0.2, 1, 0, 1,
-0.4988302, -0.926048, -3.901857, 0.1921569, 1, 0, 1,
-0.4974597, 1.384906, -0.02151053, 0.1882353, 1, 0, 1,
-0.4939328, 1.486503, -0.4614789, 0.1803922, 1, 0, 1,
-0.4936727, -0.385731, -2.239952, 0.1764706, 1, 0, 1,
-0.4823785, 1.261937, -1.671178, 0.1686275, 1, 0, 1,
-0.4807557, -0.235054, -1.521695, 0.1647059, 1, 0, 1,
-0.4802738, -0.488697, -1.797365, 0.1568628, 1, 0, 1,
-0.4792563, 0.1438852, -0.8577437, 0.1529412, 1, 0, 1,
-0.4787599, -0.9164739, -2.392187, 0.145098, 1, 0, 1,
-0.4728711, 0.8577011, -1.364131, 0.1411765, 1, 0, 1,
-0.4723729, 0.7822506, -1.471001, 0.1333333, 1, 0, 1,
-0.471725, -0.6630731, -3.227924, 0.1294118, 1, 0, 1,
-0.4696431, 0.1222787, 0.4423266, 0.1215686, 1, 0, 1,
-0.4661353, -1.928975, -3.157118, 0.1176471, 1, 0, 1,
-0.4653225, -0.2888098, -2.551497, 0.1098039, 1, 0, 1,
-0.4635458, -1.362194, -2.475157, 0.1058824, 1, 0, 1,
-0.450486, 0.273739, 0.5436004, 0.09803922, 1, 0, 1,
-0.4488599, -0.01484301, -3.29377, 0.09019608, 1, 0, 1,
-0.4487055, -2.370108, -1.947933, 0.08627451, 1, 0, 1,
-0.4457687, 0.01992368, 0.2772475, 0.07843138, 1, 0, 1,
-0.445305, 0.3173938, -0.7274566, 0.07450981, 1, 0, 1,
-0.4432668, -0.230514, -3.316538, 0.06666667, 1, 0, 1,
-0.4402371, -1.389641, -3.00374, 0.0627451, 1, 0, 1,
-0.4373567, 0.1983002, -1.224652, 0.05490196, 1, 0, 1,
-0.4355957, -0.4954657, -3.376523, 0.05098039, 1, 0, 1,
-0.4340888, -0.9247654, -3.209962, 0.04313726, 1, 0, 1,
-0.4323986, 0.9924372, 0.2353933, 0.03921569, 1, 0, 1,
-0.4300667, 1.571746, 0.5882623, 0.03137255, 1, 0, 1,
-0.4290249, 0.04900036, -2.551558, 0.02745098, 1, 0, 1,
-0.4283716, 0.9854447, 1.369425, 0.01960784, 1, 0, 1,
-0.4270129, -0.1417574, -2.100074, 0.01568628, 1, 0, 1,
-0.4252834, -0.1318894, -0.8607672, 0.007843138, 1, 0, 1,
-0.4214074, 0.2320859, -1.164665, 0.003921569, 1, 0, 1,
-0.4167545, 1.395523, 0.2992638, 0, 1, 0.003921569, 1,
-0.4119772, 0.8269888, -0.4282961, 0, 1, 0.01176471, 1,
-0.4106002, -0.5274845, -1.53652, 0, 1, 0.01568628, 1,
-0.4098904, -0.5538768, -1.89686, 0, 1, 0.02352941, 1,
-0.4098662, 0.8792399, -1.118402, 0, 1, 0.02745098, 1,
-0.4040061, -0.0820337, -1.178751, 0, 1, 0.03529412, 1,
-0.3997701, -1.600186, -3.143306, 0, 1, 0.03921569, 1,
-0.3953671, 1.945735, 0.5469219, 0, 1, 0.04705882, 1,
-0.3942565, -0.4007975, -2.783964, 0, 1, 0.05098039, 1,
-0.3919521, -0.7975504, -1.778323, 0, 1, 0.05882353, 1,
-0.3904913, -0.237826, -4.91274, 0, 1, 0.0627451, 1,
-0.3869277, 0.6215572, -1.06135, 0, 1, 0.07058824, 1,
-0.3854711, -0.6544984, -3.336873, 0, 1, 0.07450981, 1,
-0.3845512, -0.6143032, -2.799077, 0, 1, 0.08235294, 1,
-0.3817004, 1.363438, -0.8348412, 0, 1, 0.08627451, 1,
-0.3780886, -0.6304717, -4.081099, 0, 1, 0.09411765, 1,
-0.3727067, -0.5625599, -2.778448, 0, 1, 0.1019608, 1,
-0.368157, -0.981337, -0.07929213, 0, 1, 0.1058824, 1,
-0.362897, 1.153471, -1.127694, 0, 1, 0.1137255, 1,
-0.3612206, 0.9477034, 0.8010526, 0, 1, 0.1176471, 1,
-0.3598811, -0.9930133, -3.349219, 0, 1, 0.1254902, 1,
-0.3589522, -1.10409, -1.278423, 0, 1, 0.1294118, 1,
-0.3574122, -2.181353, -3.106179, 0, 1, 0.1372549, 1,
-0.355367, -0.5487384, -5.117012, 0, 1, 0.1411765, 1,
-0.3531719, -0.8703088, -3.460748, 0, 1, 0.1490196, 1,
-0.3482512, -0.06501201, -0.1727075, 0, 1, 0.1529412, 1,
-0.3456933, -0.09676914, -1.756976, 0, 1, 0.1607843, 1,
-0.3455435, 0.7634616, -0.8257812, 0, 1, 0.1647059, 1,
-0.3431245, 0.02930974, -0.5038894, 0, 1, 0.172549, 1,
-0.3421763, 0.1389739, -0.7589853, 0, 1, 0.1764706, 1,
-0.3420801, 0.4148382, -0.8001303, 0, 1, 0.1843137, 1,
-0.3399865, 1.301096, -0.7383252, 0, 1, 0.1882353, 1,
-0.3381613, 0.2491524, -1.43172, 0, 1, 0.1960784, 1,
-0.3381452, -0.642697, -2.047639, 0, 1, 0.2039216, 1,
-0.336048, -0.489775, -2.846673, 0, 1, 0.2078431, 1,
-0.3355267, -0.9772156, -3.38221, 0, 1, 0.2156863, 1,
-0.333443, -0.4339918, -1.031725, 0, 1, 0.2196078, 1,
-0.3322704, 1.082301, 0.5176822, 0, 1, 0.227451, 1,
-0.3295683, 0.4940144, 1.119564, 0, 1, 0.2313726, 1,
-0.3295234, -0.3899785, -3.222411, 0, 1, 0.2392157, 1,
-0.3278263, 0.1828593, -0.8454673, 0, 1, 0.2431373, 1,
-0.327207, -1.29835, -4.765797, 0, 1, 0.2509804, 1,
-0.3225684, -0.2137214, -2.075777, 0, 1, 0.254902, 1,
-0.3193113, -0.3987066, -0.7092646, 0, 1, 0.2627451, 1,
-0.3117598, -1.075765, -2.624004, 0, 1, 0.2666667, 1,
-0.305734, -1.43494, -3.662201, 0, 1, 0.2745098, 1,
-0.3041886, -0.1242602, -2.008036, 0, 1, 0.2784314, 1,
-0.3019141, -0.4065351, -3.347051, 0, 1, 0.2862745, 1,
-0.2956367, 0.09175005, -1.813654, 0, 1, 0.2901961, 1,
-0.2921465, -0.4526712, -3.687083, 0, 1, 0.2980392, 1,
-0.2910056, -1.368447, -3.402719, 0, 1, 0.3058824, 1,
-0.2891055, -1.781287, -3.180164, 0, 1, 0.3098039, 1,
-0.2860379, -0.4597447, -2.224413, 0, 1, 0.3176471, 1,
-0.282701, -0.6321107, -1.473174, 0, 1, 0.3215686, 1,
-0.2826041, 0.08271272, -0.2019767, 0, 1, 0.3294118, 1,
-0.2825693, -0.04779635, 0.3739896, 0, 1, 0.3333333, 1,
-0.2763666, -1.609918, -2.949148, 0, 1, 0.3411765, 1,
-0.2728442, -1.753701, -2.444426, 0, 1, 0.345098, 1,
-0.2723395, 1.893068, 0.6571399, 0, 1, 0.3529412, 1,
-0.2685788, 0.08233877, -0.4262996, 0, 1, 0.3568628, 1,
-0.2666352, 1.06699, 1.178343, 0, 1, 0.3647059, 1,
-0.2597685, -0.7531201, -4.242538, 0, 1, 0.3686275, 1,
-0.2573236, 1.238466, -1.066695, 0, 1, 0.3764706, 1,
-0.2572191, 1.604226, 1.302516, 0, 1, 0.3803922, 1,
-0.2558109, 0.05152526, -1.036092, 0, 1, 0.3882353, 1,
-0.2549483, 0.482232, -0.3158619, 0, 1, 0.3921569, 1,
-0.2531496, -1.915369, -4.110129, 0, 1, 0.4, 1,
-0.2516243, 1.863452, 0.1847271, 0, 1, 0.4078431, 1,
-0.2514935, 0.2291768, -2.18148, 0, 1, 0.4117647, 1,
-0.2513321, -1.345433, -2.697317, 0, 1, 0.4196078, 1,
-0.2500386, 1.664317, -0.6324849, 0, 1, 0.4235294, 1,
-0.2483793, -0.005851006, -1.533465, 0, 1, 0.4313726, 1,
-0.2483634, 0.06515075, -0.3092202, 0, 1, 0.4352941, 1,
-0.2446363, 0.3513443, -1.214794, 0, 1, 0.4431373, 1,
-0.2425758, 0.4292405, 2.309351, 0, 1, 0.4470588, 1,
-0.2405448, 0.3243613, -1.784781, 0, 1, 0.454902, 1,
-0.2383725, 0.4991003, -1.444915, 0, 1, 0.4588235, 1,
-0.2328328, -0.9120458, -2.314469, 0, 1, 0.4666667, 1,
-0.2327296, -1.091149, -3.272756, 0, 1, 0.4705882, 1,
-0.2239111, 0.1943881, -1.180999, 0, 1, 0.4784314, 1,
-0.2219479, 0.280728, 0.2397598, 0, 1, 0.4823529, 1,
-0.2205434, -0.00663182, -2.389196, 0, 1, 0.4901961, 1,
-0.2168605, 1.008441, -0.1045712, 0, 1, 0.4941176, 1,
-0.2167351, -1.589531, -2.168744, 0, 1, 0.5019608, 1,
-0.2153288, -0.7808744, -4.042031, 0, 1, 0.509804, 1,
-0.2150477, 0.06826557, -0.2585693, 0, 1, 0.5137255, 1,
-0.2142465, 0.9571652, -2.615658, 0, 1, 0.5215687, 1,
-0.2131273, -0.1818395, -1.818955, 0, 1, 0.5254902, 1,
-0.2063797, 1.004269, -0.8101391, 0, 1, 0.5333334, 1,
-0.2041558, 0.09102655, -2.263869, 0, 1, 0.5372549, 1,
-0.2034453, 0.3003082, 0.9043565, 0, 1, 0.5450981, 1,
-0.1997524, -0.0002040488, -2.774125, 0, 1, 0.5490196, 1,
-0.1964613, -0.9171432, -3.238098, 0, 1, 0.5568628, 1,
-0.1947648, 0.6532863, 0.1141807, 0, 1, 0.5607843, 1,
-0.1942951, 0.6769744, -0.7889811, 0, 1, 0.5686275, 1,
-0.1914054, -0.1724699, -2.986045, 0, 1, 0.572549, 1,
-0.1912311, -0.1301582, -3.253248, 0, 1, 0.5803922, 1,
-0.1904332, -1.942227, -2.483553, 0, 1, 0.5843138, 1,
-0.1903404, -0.05417093, -0.8726971, 0, 1, 0.5921569, 1,
-0.1864521, 1.167348, -0.8317903, 0, 1, 0.5960785, 1,
-0.1837783, 0.4206107, -1.048729, 0, 1, 0.6039216, 1,
-0.1798593, -0.5879926, -2.778848, 0, 1, 0.6117647, 1,
-0.1764369, -0.8301027, -1.87042, 0, 1, 0.6156863, 1,
-0.1732995, 0.1293532, -1.301933, 0, 1, 0.6235294, 1,
-0.1702686, 0.4607031, 0.8085067, 0, 1, 0.627451, 1,
-0.1675929, 0.306338, -0.9161345, 0, 1, 0.6352941, 1,
-0.1659402, -0.8270226, -2.142015, 0, 1, 0.6392157, 1,
-0.1643022, 0.4795832, -0.8075693, 0, 1, 0.6470588, 1,
-0.1630106, 0.6824433, 0.2718509, 0, 1, 0.6509804, 1,
-0.1621278, 1.58007, -0.9001042, 0, 1, 0.6588235, 1,
-0.154682, 0.8390165, 0.506748, 0, 1, 0.6627451, 1,
-0.1530523, -2.08551, -1.46851, 0, 1, 0.6705883, 1,
-0.1522318, -0.8052623, -2.615365, 0, 1, 0.6745098, 1,
-0.1501412, 0.1375195, -0.5496014, 0, 1, 0.682353, 1,
-0.1499587, -0.4426324, -2.713039, 0, 1, 0.6862745, 1,
-0.1418668, 0.7389585, 1.441728, 0, 1, 0.6941177, 1,
-0.1399986, 0.7410806, -0.5292221, 0, 1, 0.7019608, 1,
-0.1359626, 0.4879619, -1.028833, 0, 1, 0.7058824, 1,
-0.1354125, 1.193622, 0.2752331, 0, 1, 0.7137255, 1,
-0.1315579, 1.908248, -0.05657965, 0, 1, 0.7176471, 1,
-0.122436, 1.210603, -0.06027355, 0, 1, 0.7254902, 1,
-0.1145103, -0.02212745, -2.688937, 0, 1, 0.7294118, 1,
-0.1117676, 1.177646, -0.270164, 0, 1, 0.7372549, 1,
-0.1104068, -0.5801666, -3.702181, 0, 1, 0.7411765, 1,
-0.109012, -0.7055629, -4.015712, 0, 1, 0.7490196, 1,
-0.1051424, 0.8202057, 1.171607, 0, 1, 0.7529412, 1,
-0.104249, 2.389579e-05, -0.3853943, 0, 1, 0.7607843, 1,
-0.09999213, -0.545722, -3.507819, 0, 1, 0.7647059, 1,
-0.09368885, -0.8262179, -3.249676, 0, 1, 0.772549, 1,
-0.09124042, 0.3926769, 0.09986805, 0, 1, 0.7764706, 1,
-0.09115938, -2.674518, -3.395126, 0, 1, 0.7843137, 1,
-0.08714195, 0.02245988, -2.788639, 0, 1, 0.7882353, 1,
-0.07418299, 2.075119, 0.4226654, 0, 1, 0.7960784, 1,
-0.07281779, 0.4840041, -0.3175222, 0, 1, 0.8039216, 1,
-0.07219171, -0.2679624, -3.555169, 0, 1, 0.8078431, 1,
-0.06723055, -1.159514, -2.854266, 0, 1, 0.8156863, 1,
-0.06481527, -0.8645491, -1.824907, 0, 1, 0.8196079, 1,
-0.06295788, 0.3795247, 0.1597615, 0, 1, 0.827451, 1,
-0.06181698, 1.277915, -1.171927, 0, 1, 0.8313726, 1,
-0.05720441, 1.313458, 1.330671, 0, 1, 0.8392157, 1,
-0.05714629, -0.1412421, -3.977464, 0, 1, 0.8431373, 1,
-0.05411069, 2.63521, -0.8588848, 0, 1, 0.8509804, 1,
-0.05231801, 0.9313025, -0.5417814, 0, 1, 0.854902, 1,
-0.04897095, 1.264087, -0.2115268, 0, 1, 0.8627451, 1,
-0.0455755, 2.171657, 1.184344, 0, 1, 0.8666667, 1,
-0.04454288, -0.9179991, -4.076119, 0, 1, 0.8745098, 1,
-0.04226632, 0.9886937, -0.2783547, 0, 1, 0.8784314, 1,
-0.04212617, 1.710125, -0.4784058, 0, 1, 0.8862745, 1,
-0.04205804, -1.3984, -2.20053, 0, 1, 0.8901961, 1,
-0.04150935, -1.454918, -3.190171, 0, 1, 0.8980392, 1,
-0.02945511, 0.3946691, -1.39192, 0, 1, 0.9058824, 1,
-0.02595029, 0.8325461, -1.008883, 0, 1, 0.9098039, 1,
-0.02142145, 1.318763, -0.4219961, 0, 1, 0.9176471, 1,
-0.01675871, -1.108744, -3.131031, 0, 1, 0.9215686, 1,
-0.01605912, 0.4910619, 0.7880961, 0, 1, 0.9294118, 1,
0.002148424, -0.3194201, 3.442081, 0, 1, 0.9333333, 1,
0.003551102, -0.03475405, 2.621586, 0, 1, 0.9411765, 1,
0.003925513, 1.158054, -1.259282, 0, 1, 0.945098, 1,
0.00655474, -1.123037, 3.390966, 0, 1, 0.9529412, 1,
0.007253835, -0.8767403, 1.119686, 0, 1, 0.9568627, 1,
0.01046122, -0.9322648, 2.938845, 0, 1, 0.9647059, 1,
0.01425371, -0.5841349, 3.287021, 0, 1, 0.9686275, 1,
0.01543206, 0.8208836, -0.8136736, 0, 1, 0.9764706, 1,
0.017219, 0.9962834, 0.8403131, 0, 1, 0.9803922, 1,
0.01926023, -0.2694618, 1.745316, 0, 1, 0.9882353, 1,
0.0259633, -0.8113095, 1.54863, 0, 1, 0.9921569, 1,
0.02894987, 2.301129, 0.4259891, 0, 1, 1, 1,
0.02895202, -1.954854, 2.986756, 0, 0.9921569, 1, 1,
0.03083014, 0.2082872, 0.2686376, 0, 0.9882353, 1, 1,
0.0331471, -1.030358, 3.784387, 0, 0.9803922, 1, 1,
0.03324745, -0.102241, 4.472011, 0, 0.9764706, 1, 1,
0.03339569, -2.657838, 3.759038, 0, 0.9686275, 1, 1,
0.04290756, -1.362281, 3.273028, 0, 0.9647059, 1, 1,
0.04466195, 1.783434, -0.4874431, 0, 0.9568627, 1, 1,
0.04665523, -1.175612, 3.322865, 0, 0.9529412, 1, 1,
0.04858348, -1.425363, 3.288531, 0, 0.945098, 1, 1,
0.05045076, 1.307549, 1.08841, 0, 0.9411765, 1, 1,
0.05244311, 0.862532, -0.0346551, 0, 0.9333333, 1, 1,
0.05772243, 0.03909205, 1.250916, 0, 0.9294118, 1, 1,
0.05888972, -1.548225, 3.30028, 0, 0.9215686, 1, 1,
0.0597971, -0.399069, 2.556757, 0, 0.9176471, 1, 1,
0.07548762, -0.3066328, 2.786097, 0, 0.9098039, 1, 1,
0.0785059, -0.5650456, 1.451585, 0, 0.9058824, 1, 1,
0.08166125, 1.034792, 1.750502, 0, 0.8980392, 1, 1,
0.08237348, 1.101717, 0.5289573, 0, 0.8901961, 1, 1,
0.08825148, 0.584883, 1.559699, 0, 0.8862745, 1, 1,
0.09360471, 1.73985, 1.445977, 0, 0.8784314, 1, 1,
0.09461419, -1.196763, 2.750161, 0, 0.8745098, 1, 1,
0.09764388, 0.5659996, 1.339262, 0, 0.8666667, 1, 1,
0.1078136, 0.664572, 0.5540522, 0, 0.8627451, 1, 1,
0.1079213, -0.3938768, 2.42492, 0, 0.854902, 1, 1,
0.1107369, -0.5994219, 1.625401, 0, 0.8509804, 1, 1,
0.1109697, 0.5272598, 1.897769, 0, 0.8431373, 1, 1,
0.1117137, -1.425219, 2.609139, 0, 0.8392157, 1, 1,
0.1191343, -0.6613646, 3.466865, 0, 0.8313726, 1, 1,
0.1207868, 1.453424, -0.5179626, 0, 0.827451, 1, 1,
0.1247983, 0.6160442, 2.029257, 0, 0.8196079, 1, 1,
0.1251482, 0.7166774, -0.0354134, 0, 0.8156863, 1, 1,
0.1255914, 1.055525, 0.4661112, 0, 0.8078431, 1, 1,
0.1258579, 0.6809756, 0.4162736, 0, 0.8039216, 1, 1,
0.1258992, 1.468739, 1.40938, 0, 0.7960784, 1, 1,
0.1277447, -1.29884, 4.352663, 0, 0.7882353, 1, 1,
0.1341697, 0.7611588, -0.4049585, 0, 0.7843137, 1, 1,
0.135396, 0.6742238, 0.7788224, 0, 0.7764706, 1, 1,
0.1370339, -0.2805121, 3.762266, 0, 0.772549, 1, 1,
0.1373783, -0.6993337, 2.323465, 0, 0.7647059, 1, 1,
0.1383296, -0.1937314, 2.758213, 0, 0.7607843, 1, 1,
0.139241, 0.8082076, 1.082717, 0, 0.7529412, 1, 1,
0.1444334, 1.071965, 1.350085, 0, 0.7490196, 1, 1,
0.1473278, -0.2545364, 3.210719, 0, 0.7411765, 1, 1,
0.1473956, 0.07248782, 1.655772, 0, 0.7372549, 1, 1,
0.1499234, 0.2597783, -0.3386641, 0, 0.7294118, 1, 1,
0.1513837, -0.1182886, 2.144128, 0, 0.7254902, 1, 1,
0.1544854, -0.2585135, 0.2107964, 0, 0.7176471, 1, 1,
0.158865, 1.923357, 0.2028347, 0, 0.7137255, 1, 1,
0.1628418, -3.12308, 2.878108, 0, 0.7058824, 1, 1,
0.1639558, -0.6550391, 2.929611, 0, 0.6980392, 1, 1,
0.167058, -0.6212799, 3.662146, 0, 0.6941177, 1, 1,
0.1679468, -0.5004098, 2.201454, 0, 0.6862745, 1, 1,
0.1682693, 0.7131414, 0.1387195, 0, 0.682353, 1, 1,
0.1690934, -0.8634775, 2.150201, 0, 0.6745098, 1, 1,
0.169945, -0.222371, 3.202815, 0, 0.6705883, 1, 1,
0.1711347, 0.03182786, 1.286598, 0, 0.6627451, 1, 1,
0.1720927, -0.1244769, 1.571283, 0, 0.6588235, 1, 1,
0.1787601, 0.1750697, -0.7902098, 0, 0.6509804, 1, 1,
0.1790482, -1.385225, 3.862921, 0, 0.6470588, 1, 1,
0.1798293, 1.884602, -0.09318528, 0, 0.6392157, 1, 1,
0.1823789, 0.3317036, 0.3862516, 0, 0.6352941, 1, 1,
0.1825244, 0.6911898, 0.138419, 0, 0.627451, 1, 1,
0.1889491, 1.648052, -1.71374, 0, 0.6235294, 1, 1,
0.1891624, -0.9717048, 1.221673, 0, 0.6156863, 1, 1,
0.1914457, 0.1914397, 1.002591, 0, 0.6117647, 1, 1,
0.1971842, 1.391965, 0.2324535, 0, 0.6039216, 1, 1,
0.2003048, 0.6601613, -0.2955558, 0, 0.5960785, 1, 1,
0.2025513, 0.7139546, 1.268296, 0, 0.5921569, 1, 1,
0.2025692, 0.6690617, 0.9684523, 0, 0.5843138, 1, 1,
0.2035423, -0.558601, 3.465795, 0, 0.5803922, 1, 1,
0.2036456, 0.0656176, -0.3254459, 0, 0.572549, 1, 1,
0.2040427, 1.408823, -0.5345333, 0, 0.5686275, 1, 1,
0.2053737, -0.8939432, 1.742078, 0, 0.5607843, 1, 1,
0.2061335, 1.217482, -0.2006139, 0, 0.5568628, 1, 1,
0.2131915, 1.395165, -1.04699, 0, 0.5490196, 1, 1,
0.216458, -0.2713217, 1.669658, 0, 0.5450981, 1, 1,
0.2198909, 0.5211726, -0.3341774, 0, 0.5372549, 1, 1,
0.2225731, 0.4382622, 0.7590333, 0, 0.5333334, 1, 1,
0.2239586, 0.04213861, 1.178835, 0, 0.5254902, 1, 1,
0.224808, 0.8986835, 0.4013765, 0, 0.5215687, 1, 1,
0.2301202, 2.363804, 1.405698, 0, 0.5137255, 1, 1,
0.2324526, 0.4872694, -0.5124457, 0, 0.509804, 1, 1,
0.2344059, -0.1095981, 1.837458, 0, 0.5019608, 1, 1,
0.2355, -0.4657723, 2.463658, 0, 0.4941176, 1, 1,
0.2363559, -0.2626791, 4.408843, 0, 0.4901961, 1, 1,
0.2410148, 0.6674551, 1.075503, 0, 0.4823529, 1, 1,
0.2422165, -0.0549478, 1.605989, 0, 0.4784314, 1, 1,
0.2432784, -0.9025267, 2.21894, 0, 0.4705882, 1, 1,
0.251936, -0.4359263, 3.10344, 0, 0.4666667, 1, 1,
0.2530632, 0.2709645, 0.5807036, 0, 0.4588235, 1, 1,
0.2546848, -0.4065429, 1.662087, 0, 0.454902, 1, 1,
0.2566328, 1.103354, 1.345357, 0, 0.4470588, 1, 1,
0.2570326, -1.991307, 4.01721, 0, 0.4431373, 1, 1,
0.2657615, 0.9980513, -2.210713, 0, 0.4352941, 1, 1,
0.2687496, -1.390206, 2.734095, 0, 0.4313726, 1, 1,
0.2789629, -0.7658417, 2.190069, 0, 0.4235294, 1, 1,
0.2814779, -0.3441799, 4.146443, 0, 0.4196078, 1, 1,
0.288068, -1.663916, 3.99572, 0, 0.4117647, 1, 1,
0.2882584, -0.9210899, 3.471152, 0, 0.4078431, 1, 1,
0.2907779, -0.3005723, 3.574286, 0, 0.4, 1, 1,
0.290915, -0.5332916, 0.883521, 0, 0.3921569, 1, 1,
0.2909916, -0.8448413, 2.374303, 0, 0.3882353, 1, 1,
0.2927545, -1.466001, 5.180756, 0, 0.3803922, 1, 1,
0.2964447, -1.946194, 3.202397, 0, 0.3764706, 1, 1,
0.3091491, 0.2780471, 1.31094, 0, 0.3686275, 1, 1,
0.3210967, -0.6601784, 1.324003, 0, 0.3647059, 1, 1,
0.3246306, 0.4673016, -0.8333893, 0, 0.3568628, 1, 1,
0.3299232, 0.310329, 2.080692, 0, 0.3529412, 1, 1,
0.3315727, 0.3666491, 0.02676116, 0, 0.345098, 1, 1,
0.3324672, -1.385741, 1.570347, 0, 0.3411765, 1, 1,
0.3340552, -0.3955778, 1.248993, 0, 0.3333333, 1, 1,
0.3374135, 1.086322, 0.4775536, 0, 0.3294118, 1, 1,
0.338633, -0.07693301, 4.117087, 0, 0.3215686, 1, 1,
0.3445772, -0.03700453, 2.208301, 0, 0.3176471, 1, 1,
0.3446563, -1.594941, 1.592443, 0, 0.3098039, 1, 1,
0.3453336, 0.5586892, -0.1666497, 0, 0.3058824, 1, 1,
0.350315, 0.1929648, 1.570599, 0, 0.2980392, 1, 1,
0.3507416, 0.5351057, 1.282742, 0, 0.2901961, 1, 1,
0.3513764, -0.6418854, 2.90891, 0, 0.2862745, 1, 1,
0.3514388, -0.729486, 3.559455, 0, 0.2784314, 1, 1,
0.3530338, -0.6952516, 2.316036, 0, 0.2745098, 1, 1,
0.3617779, 0.06423865, 2.502818, 0, 0.2666667, 1, 1,
0.3641969, 0.02341773, 3.447706, 0, 0.2627451, 1, 1,
0.3672936, 0.8956967, 0.4105612, 0, 0.254902, 1, 1,
0.3683385, 0.1923056, 3.239277, 0, 0.2509804, 1, 1,
0.3684482, 0.3015866, 1.51628, 0, 0.2431373, 1, 1,
0.3695173, -2.193632, 2.072143, 0, 0.2392157, 1, 1,
0.3696822, -0.1911767, 2.506963, 0, 0.2313726, 1, 1,
0.3703677, -1.073999, 2.96189, 0, 0.227451, 1, 1,
0.3760712, 1.159325, 2.541562, 0, 0.2196078, 1, 1,
0.3772443, -1.112065, 2.027196, 0, 0.2156863, 1, 1,
0.3775593, -0.5242079, 2.05552, 0, 0.2078431, 1, 1,
0.3784478, -0.4376322, 1.776278, 0, 0.2039216, 1, 1,
0.3788352, 0.7573952, 1.489837, 0, 0.1960784, 1, 1,
0.3789385, -0.4174891, 3.359437, 0, 0.1882353, 1, 1,
0.379225, -0.1079829, 3.209157, 0, 0.1843137, 1, 1,
0.3826023, 0.9532524, 1.14939, 0, 0.1764706, 1, 1,
0.3857802, 1.229985, 0.9381015, 0, 0.172549, 1, 1,
0.3867339, -0.2276168, 0.7521484, 0, 0.1647059, 1, 1,
0.3875888, 2.407615, 1.816357, 0, 0.1607843, 1, 1,
0.3893567, -0.3567995, 1.976247, 0, 0.1529412, 1, 1,
0.4033972, -1.72103, 1.342469, 0, 0.1490196, 1, 1,
0.4048542, 1.190462, 0.003260863, 0, 0.1411765, 1, 1,
0.4064785, -0.2970219, 3.741383, 0, 0.1372549, 1, 1,
0.4082295, 1.087978, -0.5713277, 0, 0.1294118, 1, 1,
0.408971, -0.3065096, 3.4309, 0, 0.1254902, 1, 1,
0.409243, -1.215833, 0.09654846, 0, 0.1176471, 1, 1,
0.4132692, -0.3813787, 1.639413, 0, 0.1137255, 1, 1,
0.416502, 1.15004, -0.4492086, 0, 0.1058824, 1, 1,
0.4165049, -0.3526223, 2.293234, 0, 0.09803922, 1, 1,
0.42108, 0.03183893, 0.9474858, 0, 0.09411765, 1, 1,
0.421882, 0.5064051, 2.453631, 0, 0.08627451, 1, 1,
0.4223125, 0.162426, 0.1319176, 0, 0.08235294, 1, 1,
0.430649, -0.1993402, 1.949508, 0, 0.07450981, 1, 1,
0.4327734, 0.9180426, 0.6968271, 0, 0.07058824, 1, 1,
0.4341809, -0.4331693, 3.796407, 0, 0.0627451, 1, 1,
0.434314, -0.5161793, 2.636185, 0, 0.05882353, 1, 1,
0.4347387, 0.3326441, -1.31126, 0, 0.05098039, 1, 1,
0.4360065, -0.6927843, 1.659748, 0, 0.04705882, 1, 1,
0.449929, -1.367929, 3.332363, 0, 0.03921569, 1, 1,
0.4500983, 0.1519877, 3.548928, 0, 0.03529412, 1, 1,
0.4509777, -0.8712927, 2.345221, 0, 0.02745098, 1, 1,
0.4574049, 0.9948457, 1.228517, 0, 0.02352941, 1, 1,
0.4599318, -1.69958, 2.06732, 0, 0.01568628, 1, 1,
0.4600363, -0.2216456, 2.345918, 0, 0.01176471, 1, 1,
0.4621789, -0.1759665, 3.198349, 0, 0.003921569, 1, 1,
0.4680105, -1.254657, 3.663042, 0.003921569, 0, 1, 1,
0.4686127, 0.4198436, -0.02278675, 0.007843138, 0, 1, 1,
0.4788986, 1.539568, 1.535927, 0.01568628, 0, 1, 1,
0.4838691, 0.2406356, -0.264388, 0.01960784, 0, 1, 1,
0.4840128, 0.6149718, 2.048201, 0.02745098, 0, 1, 1,
0.4924787, -0.2363025, 2.890922, 0.03137255, 0, 1, 1,
0.493285, -0.8071774, 2.611768, 0.03921569, 0, 1, 1,
0.4958212, -0.1742629, 1.841206, 0.04313726, 0, 1, 1,
0.5001794, 1.695546, 1.773783, 0.05098039, 0, 1, 1,
0.5018818, -0.747405, 2.012049, 0.05490196, 0, 1, 1,
0.5024692, -0.09894946, 1.615875, 0.0627451, 0, 1, 1,
0.5029568, -2.846115, 3.308764, 0.06666667, 0, 1, 1,
0.5103442, -0.4477241, 0.5837743, 0.07450981, 0, 1, 1,
0.5160931, -2.022568, 2.222786, 0.07843138, 0, 1, 1,
0.5175166, -0.4271493, 1.254184, 0.08627451, 0, 1, 1,
0.5213996, -1.065432, 2.772948, 0.09019608, 0, 1, 1,
0.5219806, 0.404311, -0.1551249, 0.09803922, 0, 1, 1,
0.5248869, 1.013943, 0.8746517, 0.1058824, 0, 1, 1,
0.5259629, -1.462022, 3.22443, 0.1098039, 0, 1, 1,
0.5280035, 0.3129188, 1.612514, 0.1176471, 0, 1, 1,
0.5308677, 0.8364198, -0.8377739, 0.1215686, 0, 1, 1,
0.537862, -0.9776244, 3.65367, 0.1294118, 0, 1, 1,
0.5379429, 0.7431272, -0.5278485, 0.1333333, 0, 1, 1,
0.5382531, -1.579885, 3.544703, 0.1411765, 0, 1, 1,
0.5407759, -0.3233282, 2.302432, 0.145098, 0, 1, 1,
0.5410869, 2.162721, 1.330725, 0.1529412, 0, 1, 1,
0.5412655, 1.501954, -0.2686948, 0.1568628, 0, 1, 1,
0.5468263, -0.7696866, 2.724736, 0.1647059, 0, 1, 1,
0.5474428, -0.07917452, 1.975616, 0.1686275, 0, 1, 1,
0.5524856, -0.06708927, 2.723182, 0.1764706, 0, 1, 1,
0.5525171, 0.6110333, 1.334951, 0.1803922, 0, 1, 1,
0.5526976, 1.123686, 0.7437679, 0.1882353, 0, 1, 1,
0.5540003, 1.192337, 0.1518353, 0.1921569, 0, 1, 1,
0.5596213, -0.2660603, 1.587777, 0.2, 0, 1, 1,
0.5616454, 0.4179735, 1.892509, 0.2078431, 0, 1, 1,
0.5628464, 1.60539, 0.3407696, 0.2117647, 0, 1, 1,
0.5660973, 1.32758, 0.1399166, 0.2196078, 0, 1, 1,
0.572473, -1.454637, 2.840487, 0.2235294, 0, 1, 1,
0.5758911, -0.01581869, 0.980173, 0.2313726, 0, 1, 1,
0.5764689, 1.876174, 1.274188, 0.2352941, 0, 1, 1,
0.5803798, -1.011928, 2.918673, 0.2431373, 0, 1, 1,
0.5829206, -1.168553, 2.315597, 0.2470588, 0, 1, 1,
0.5842162, -0.5051566, 1.168857, 0.254902, 0, 1, 1,
0.5866535, 1.179931, 1.659908, 0.2588235, 0, 1, 1,
0.586892, 0.1104191, 2.676293, 0.2666667, 0, 1, 1,
0.5882704, 0.3075741, 2.091387, 0.2705882, 0, 1, 1,
0.5897171, -2.472219, 1.848063, 0.2784314, 0, 1, 1,
0.5974885, 0.96947, 0.1899378, 0.282353, 0, 1, 1,
0.5983068, 1.050254, 1.242621, 0.2901961, 0, 1, 1,
0.5992733, -0.3014266, 1.955789, 0.2941177, 0, 1, 1,
0.6014872, 0.6425682, 0.481092, 0.3019608, 0, 1, 1,
0.602727, -0.6142477, 0.2854005, 0.3098039, 0, 1, 1,
0.6061845, 0.9498917, 2.036491, 0.3137255, 0, 1, 1,
0.6089413, 0.6169541, 1.044892, 0.3215686, 0, 1, 1,
0.6090372, -0.2893818, 1.567873, 0.3254902, 0, 1, 1,
0.6102443, 0.6245748, 1.343274, 0.3333333, 0, 1, 1,
0.6179166, 0.3690498, 0.9778906, 0.3372549, 0, 1, 1,
0.6192954, -0.3404949, 1.069499, 0.345098, 0, 1, 1,
0.619996, -0.3315986, 1.624552, 0.3490196, 0, 1, 1,
0.622633, 1.139145, 2.114797, 0.3568628, 0, 1, 1,
0.6227475, 0.4579417, 1.351854, 0.3607843, 0, 1, 1,
0.628985, 0.1994337, 1.818269, 0.3686275, 0, 1, 1,
0.6315809, -0.1587316, 2.233626, 0.372549, 0, 1, 1,
0.6339286, -0.4640003, 3.200312, 0.3803922, 0, 1, 1,
0.6365204, -0.4048679, 3.29319, 0.3843137, 0, 1, 1,
0.6382238, 0.9397673, -0.05328481, 0.3921569, 0, 1, 1,
0.6384643, -0.3159647, 2.879062, 0.3960784, 0, 1, 1,
0.6414058, -0.7371323, 2.379401, 0.4039216, 0, 1, 1,
0.6439942, 1.714448, -1.391524, 0.4117647, 0, 1, 1,
0.6492327, 1.463865, 0.7459837, 0.4156863, 0, 1, 1,
0.650551, 0.7937784, -0.1582487, 0.4235294, 0, 1, 1,
0.6571798, 1.655351, -0.013895, 0.427451, 0, 1, 1,
0.6590068, -1.477296, 4.93668, 0.4352941, 0, 1, 1,
0.6604674, 0.1087011, 1.197826, 0.4392157, 0, 1, 1,
0.6631444, -0.2008523, 3.23169, 0.4470588, 0, 1, 1,
0.6679329, -0.5440756, 0.6189297, 0.4509804, 0, 1, 1,
0.6698885, -0.7780722, 1.877483, 0.4588235, 0, 1, 1,
0.6730204, 0.2662917, 1.951973, 0.4627451, 0, 1, 1,
0.6762829, 0.2965295, 1.845376, 0.4705882, 0, 1, 1,
0.6822588, 1.924664, 0.004330692, 0.4745098, 0, 1, 1,
0.6834106, 0.8712678, 3.828357, 0.4823529, 0, 1, 1,
0.6836293, -0.1963416, 1.629558, 0.4862745, 0, 1, 1,
0.6926853, 0.2201573, 0.1839175, 0.4941176, 0, 1, 1,
0.6932286, -0.7947226, 3.044322, 0.5019608, 0, 1, 1,
0.6936436, -0.2147738, 2.263205, 0.5058824, 0, 1, 1,
0.6959886, -0.6884277, 2.375222, 0.5137255, 0, 1, 1,
0.7022836, 1.401839, -0.3460253, 0.5176471, 0, 1, 1,
0.7032555, -0.3004886, 3.142991, 0.5254902, 0, 1, 1,
0.7033885, -1.189047, 1.460601, 0.5294118, 0, 1, 1,
0.7076752, -0.1754687, 0.3464417, 0.5372549, 0, 1, 1,
0.708929, 0.04697752, 1.969256, 0.5411765, 0, 1, 1,
0.7108681, -0.60746, 1.528972, 0.5490196, 0, 1, 1,
0.7119171, 1.601193, -0.2358294, 0.5529412, 0, 1, 1,
0.7152293, -0.2277862, 1.35411, 0.5607843, 0, 1, 1,
0.7218985, -2.112617, 2.037398, 0.5647059, 0, 1, 1,
0.7254729, -0.2516743, 1.926606, 0.572549, 0, 1, 1,
0.7302172, -2.128479, 4.362514, 0.5764706, 0, 1, 1,
0.7364562, 0.755102, 2.086072, 0.5843138, 0, 1, 1,
0.7365358, -0.7397207, 3.134955, 0.5882353, 0, 1, 1,
0.7385032, -2.521881, 2.994517, 0.5960785, 0, 1, 1,
0.7423059, 0.005127409, 1.386866, 0.6039216, 0, 1, 1,
0.7474589, -0.06831649, 1.168695, 0.6078432, 0, 1, 1,
0.7537673, -0.007729933, 2.643778, 0.6156863, 0, 1, 1,
0.757165, -0.748755, 2.665843, 0.6196079, 0, 1, 1,
0.7579149, 0.4061876, 1.176112, 0.627451, 0, 1, 1,
0.7600316, 0.9971213, 0.3633152, 0.6313726, 0, 1, 1,
0.7654625, -0.3538661, 1.44995, 0.6392157, 0, 1, 1,
0.7698978, -0.7609629, 5.019966, 0.6431373, 0, 1, 1,
0.7740206, 0.2825939, -0.9960234, 0.6509804, 0, 1, 1,
0.7793108, -0.2106382, 1.18037, 0.654902, 0, 1, 1,
0.7806291, -0.5475376, -0.2420606, 0.6627451, 0, 1, 1,
0.7814491, 0.3137479, 2.524601, 0.6666667, 0, 1, 1,
0.7816914, -0.06588131, 0.8099151, 0.6745098, 0, 1, 1,
0.7818985, -0.9141091, 1.698633, 0.6784314, 0, 1, 1,
0.7826654, -0.05071367, 2.165829, 0.6862745, 0, 1, 1,
0.783744, -1.789266, 2.845405, 0.6901961, 0, 1, 1,
0.7880646, 0.3344443, 2.219409, 0.6980392, 0, 1, 1,
0.7924342, -2.563561, 4.210155, 0.7058824, 0, 1, 1,
0.7928937, 1.5128, 0.3426759, 0.7098039, 0, 1, 1,
0.8030472, -0.9224115, 3.610606, 0.7176471, 0, 1, 1,
0.8137578, 0.0112957, 2.066948, 0.7215686, 0, 1, 1,
0.8143541, 1.408439, 1.262066, 0.7294118, 0, 1, 1,
0.8228286, -0.9614635, 2.857616, 0.7333333, 0, 1, 1,
0.8286864, -0.9482477, 3.570835, 0.7411765, 0, 1, 1,
0.8356931, -0.5198148, 1.816722, 0.7450981, 0, 1, 1,
0.8407743, -1.480605, 2.376693, 0.7529412, 0, 1, 1,
0.8427238, 0.636978, 0.2724576, 0.7568628, 0, 1, 1,
0.8427363, -0.5695931, 1.883346, 0.7647059, 0, 1, 1,
0.844156, -0.1610992, 2.302138, 0.7686275, 0, 1, 1,
0.8463359, -0.590133, 4.005547, 0.7764706, 0, 1, 1,
0.851634, -0.1292963, 3.255042, 0.7803922, 0, 1, 1,
0.8569885, -0.1990539, 4.349468, 0.7882353, 0, 1, 1,
0.8637793, -1.045787, 2.63027, 0.7921569, 0, 1, 1,
0.863976, 0.04766699, 1.794125, 0.8, 0, 1, 1,
0.8694598, 0.966536, 0.613113, 0.8078431, 0, 1, 1,
0.8706731, 0.5626596, 1.708811, 0.8117647, 0, 1, 1,
0.8710282, -1.986351, 2.629287, 0.8196079, 0, 1, 1,
0.873238, -0.1071019, 0.6173069, 0.8235294, 0, 1, 1,
0.8736311, 0.1732587, 1.139149, 0.8313726, 0, 1, 1,
0.8746433, -1.635924, 2.106422, 0.8352941, 0, 1, 1,
0.8791372, -1.000142, 2.610991, 0.8431373, 0, 1, 1,
0.8814746, 0.5817557, 1.200912, 0.8470588, 0, 1, 1,
0.8830089, -0.07225467, 1.103929, 0.854902, 0, 1, 1,
0.8830338, -0.6611804, 2.68749, 0.8588235, 0, 1, 1,
0.8912541, 0.09834511, 4.026819, 0.8666667, 0, 1, 1,
0.9026765, 1.358346, 0.4393702, 0.8705882, 0, 1, 1,
0.9034703, -0.08343159, 0.9751276, 0.8784314, 0, 1, 1,
0.9084902, 0.6266685, 1.322916, 0.8823529, 0, 1, 1,
0.9120713, 1.279998, 0.5918897, 0.8901961, 0, 1, 1,
0.9159662, -1.036258, 2.201219, 0.8941177, 0, 1, 1,
0.9201841, 0.5845915, 1.367456, 0.9019608, 0, 1, 1,
0.9210411, -0.3276, 0.7318305, 0.9098039, 0, 1, 1,
0.9256302, -0.385014, 2.620796, 0.9137255, 0, 1, 1,
0.9263352, -0.7452899, 3.337591, 0.9215686, 0, 1, 1,
0.9339757, 1.13493, -0.1691129, 0.9254902, 0, 1, 1,
0.936011, -0.1056115, 2.281418, 0.9333333, 0, 1, 1,
0.9369445, 0.4150741, 1.265379, 0.9372549, 0, 1, 1,
0.9468822, -0.2399272, 1.603866, 0.945098, 0, 1, 1,
0.9516563, 0.5753928, 0.7096488, 0.9490196, 0, 1, 1,
0.9516743, -1.816359, 3.485757, 0.9568627, 0, 1, 1,
0.9528368, 0.3608822, 2.064226, 0.9607843, 0, 1, 1,
0.9552432, -0.3956463, 1.405835, 0.9686275, 0, 1, 1,
0.9556717, 0.4061796, 1.116154, 0.972549, 0, 1, 1,
0.9576474, 1.100878, 1.483918, 0.9803922, 0, 1, 1,
0.9597156, 0.8189631, 0.9111312, 0.9843137, 0, 1, 1,
0.9646111, 1.173495, 0.249008, 0.9921569, 0, 1, 1,
0.9658617, -0.8655899, 1.378541, 0.9960784, 0, 1, 1,
0.9664593, -0.2877316, -0.3471849, 1, 0, 0.9960784, 1,
0.9711848, -0.6736587, 1.769484, 1, 0, 0.9882353, 1,
0.9723864, -0.5741012, 3.444159, 1, 0, 0.9843137, 1,
0.9847206, 1.902657, 0.1044068, 1, 0, 0.9764706, 1,
0.9884682, -0.6562551, 1.210697, 1, 0, 0.972549, 1,
0.9902075, -2.934996, 2.963698, 1, 0, 0.9647059, 1,
0.9913459, 0.009917912, 0.5284869, 1, 0, 0.9607843, 1,
0.9938517, 1.589523, 0.196583, 1, 0, 0.9529412, 1,
1.001587, 0.8557288, 0.2962472, 1, 0, 0.9490196, 1,
1.016503, 0.04321767, 2.688056, 1, 0, 0.9411765, 1,
1.01723, 1.171901, 0.1696774, 1, 0, 0.9372549, 1,
1.017345, 0.3499974, 1.272658, 1, 0, 0.9294118, 1,
1.025313, 0.6132116, 1.302705, 1, 0, 0.9254902, 1,
1.02602, -0.7274389, 2.722834, 1, 0, 0.9176471, 1,
1.04191, 0.242885, 2.192488, 1, 0, 0.9137255, 1,
1.042265, 0.598102, 0.6473213, 1, 0, 0.9058824, 1,
1.052417, -0.1299405, 2.812983, 1, 0, 0.9019608, 1,
1.060491, 0.9595481, 2.41848, 1, 0, 0.8941177, 1,
1.06103, -1.395989, 3.153255, 1, 0, 0.8862745, 1,
1.066311, 2.075995, -0.6589082, 1, 0, 0.8823529, 1,
1.067909, 1.087609, -0.379063, 1, 0, 0.8745098, 1,
1.071835, -0.1621609, 0.8349538, 1, 0, 0.8705882, 1,
1.072568, 0.3299146, 2.119986, 1, 0, 0.8627451, 1,
1.074793, 0.6362217, -0.5139467, 1, 0, 0.8588235, 1,
1.07571, -2.005984, 3.827142, 1, 0, 0.8509804, 1,
1.076102, -0.1841856, 2.861633, 1, 0, 0.8470588, 1,
1.079574, 0.2488366, 0.8572571, 1, 0, 0.8392157, 1,
1.082243, 0.9982917, 1.828819, 1, 0, 0.8352941, 1,
1.085418, -0.2699365, 0.859337, 1, 0, 0.827451, 1,
1.087137, -0.7251199, 3.123214, 1, 0, 0.8235294, 1,
1.09088, 1.783179, -1.394569, 1, 0, 0.8156863, 1,
1.095493, -1.039734, 3.226995, 1, 0, 0.8117647, 1,
1.098046, 0.487943, -0.3007381, 1, 0, 0.8039216, 1,
1.103901, -0.5165986, 3.400374, 1, 0, 0.7960784, 1,
1.114742, -0.8549595, 1.568551, 1, 0, 0.7921569, 1,
1.120324, -0.7316124, 2.045195, 1, 0, 0.7843137, 1,
1.126003, -0.3407355, 1.201153, 1, 0, 0.7803922, 1,
1.138282, -0.7580327, 3.08964, 1, 0, 0.772549, 1,
1.142358, -0.6177627, 2.430805, 1, 0, 0.7686275, 1,
1.145644, 1.611632, 0.5300694, 1, 0, 0.7607843, 1,
1.150914, -1.748873, -0.001950261, 1, 0, 0.7568628, 1,
1.158483, 0.07401001, 1.811541, 1, 0, 0.7490196, 1,
1.164816, -0.3713052, 0.0633574, 1, 0, 0.7450981, 1,
1.167809, 0.9971192, 0.7057291, 1, 0, 0.7372549, 1,
1.172374, 0.3114377, 2.658813, 1, 0, 0.7333333, 1,
1.175146, -0.4883082, 2.186645, 1, 0, 0.7254902, 1,
1.184074, 0.8826287, 0.1585823, 1, 0, 0.7215686, 1,
1.19059, 1.31901, 2.042026, 1, 0, 0.7137255, 1,
1.198682, 1.664285, 1.121294, 1, 0, 0.7098039, 1,
1.199955, -0.4668447, 1.265184, 1, 0, 0.7019608, 1,
1.201755, 1.301982, 0.9183122, 1, 0, 0.6941177, 1,
1.20334, 0.0715187, 4.384473, 1, 0, 0.6901961, 1,
1.208354, -0.5645693, 2.891714, 1, 0, 0.682353, 1,
1.20991, 0.9812068, -0.1449291, 1, 0, 0.6784314, 1,
1.221938, 0.4016248, 0.9738713, 1, 0, 0.6705883, 1,
1.242001, 0.4646722, 1.025397, 1, 0, 0.6666667, 1,
1.246205, 0.3735147, 1.918314, 1, 0, 0.6588235, 1,
1.247777, -0.5008972, 2.723778, 1, 0, 0.654902, 1,
1.259865, 0.4625112, 2.008354, 1, 0, 0.6470588, 1,
1.280773, -0.5316958, 1.67845, 1, 0, 0.6431373, 1,
1.281502, -0.4862422, 2.256766, 1, 0, 0.6352941, 1,
1.283032, -1.188641, 3.036049, 1, 0, 0.6313726, 1,
1.288104, 0.3175818, 1.367902, 1, 0, 0.6235294, 1,
1.296308, -0.4583639, 0.7809293, 1, 0, 0.6196079, 1,
1.300139, 0.2753609, -1.256538, 1, 0, 0.6117647, 1,
1.314694, -0.486257, 3.746742, 1, 0, 0.6078432, 1,
1.318427, 1.766138, 0.6079395, 1, 0, 0.6, 1,
1.318691, -0.4796881, 2.92666, 1, 0, 0.5921569, 1,
1.327288, -0.0444042, 2.093494, 1, 0, 0.5882353, 1,
1.33103, 0.1087784, 0.7215658, 1, 0, 0.5803922, 1,
1.333215, 0.3101461, -0.2307339, 1, 0, 0.5764706, 1,
1.335786, -0.874132, 2.684614, 1, 0, 0.5686275, 1,
1.336593, -0.9088717, 3.01571, 1, 0, 0.5647059, 1,
1.350132, 0.1660887, 1.799253, 1, 0, 0.5568628, 1,
1.357496, 0.00201786, 1.532636, 1, 0, 0.5529412, 1,
1.361197, 0.5379409, 1.643639, 1, 0, 0.5450981, 1,
1.367477, -0.824599, 0.9748722, 1, 0, 0.5411765, 1,
1.369747, -0.3597249, 0.1212207, 1, 0, 0.5333334, 1,
1.371574, -0.6532944, 0.9716033, 1, 0, 0.5294118, 1,
1.37368, -0.3473571, 1.814162, 1, 0, 0.5215687, 1,
1.379773, -1.36493, 3.892977, 1, 0, 0.5176471, 1,
1.380481, -0.1231608, 0.9921175, 1, 0, 0.509804, 1,
1.382776, -0.5357563, 2.26722, 1, 0, 0.5058824, 1,
1.390365, -1.101509, 2.144217, 1, 0, 0.4980392, 1,
1.391876, -0.3571434, 0.1428503, 1, 0, 0.4901961, 1,
1.393662, -0.4366195, 3.307957, 1, 0, 0.4862745, 1,
1.407792, -0.9980233, -0.828174, 1, 0, 0.4784314, 1,
1.412065, -1.447599, 1.190347, 1, 0, 0.4745098, 1,
1.440687, 0.05483146, 2.005804, 1, 0, 0.4666667, 1,
1.450084, 2.211419, 1.297014, 1, 0, 0.4627451, 1,
1.462509, 1.336772, 2.245252, 1, 0, 0.454902, 1,
1.464425, -1.886039, 2.252921, 1, 0, 0.4509804, 1,
1.467424, 1.736928, 0.5901864, 1, 0, 0.4431373, 1,
1.476108, 1.121623, 0.8548775, 1, 0, 0.4392157, 1,
1.478202, 1.617274, 2.24472, 1, 0, 0.4313726, 1,
1.481, -2.052564, 4.118007, 1, 0, 0.427451, 1,
1.487178, 0.8191377, 2.098916, 1, 0, 0.4196078, 1,
1.501499, 1.97554, 1.808916, 1, 0, 0.4156863, 1,
1.502077, 0.5367209, 1.456616, 1, 0, 0.4078431, 1,
1.503346, 0.3158361, 2.461795, 1, 0, 0.4039216, 1,
1.515609, 0.2873296, 2.035515, 1, 0, 0.3960784, 1,
1.521972, -0.06078399, 2.556819, 1, 0, 0.3882353, 1,
1.532309, 0.1993064, -0.1195448, 1, 0, 0.3843137, 1,
1.535851, 0.6884063, 1.518828, 1, 0, 0.3764706, 1,
1.544662, -0.71408, 0.6280948, 1, 0, 0.372549, 1,
1.545144, 1.382132, 1.221815, 1, 0, 0.3647059, 1,
1.545435, -1.064735, 1.568347, 1, 0, 0.3607843, 1,
1.553579, 2.417552, 1.506487, 1, 0, 0.3529412, 1,
1.555357, -0.1831743, 0.04523297, 1, 0, 0.3490196, 1,
1.560176, 1.451611, 2.350876, 1, 0, 0.3411765, 1,
1.589936, 1.35806, 0.7891437, 1, 0, 0.3372549, 1,
1.592511, 0.2583036, 0.3370086, 1, 0, 0.3294118, 1,
1.611602, 0.01097414, -0.5960302, 1, 0, 0.3254902, 1,
1.614902, -0.6526824, 2.134194, 1, 0, 0.3176471, 1,
1.634635, -0.3700747, 1.176864, 1, 0, 0.3137255, 1,
1.641388, 0.3466285, 0.7412266, 1, 0, 0.3058824, 1,
1.647964, -1.418347, 3.794361, 1, 0, 0.2980392, 1,
1.655486, -0.2225068, 3.105429, 1, 0, 0.2941177, 1,
1.661775, -0.1484459, 1.662848, 1, 0, 0.2862745, 1,
1.673622, 1.392746, 0.42847, 1, 0, 0.282353, 1,
1.686806, -2.437246, 3.661063, 1, 0, 0.2745098, 1,
1.690985, 0.05040286, 3.308346, 1, 0, 0.2705882, 1,
1.698566, 0.2200589, 3.072931, 1, 0, 0.2627451, 1,
1.701134, -1.074017, 2.013808, 1, 0, 0.2588235, 1,
1.704906, -0.9923118, 1.573863, 1, 0, 0.2509804, 1,
1.712896, 0.7360785, -0.586749, 1, 0, 0.2470588, 1,
1.714324, -1.818143, 4.43707, 1, 0, 0.2392157, 1,
1.715523, 0.744808, 1.75911, 1, 0, 0.2352941, 1,
1.724724, -0.8106631, 2.134421, 1, 0, 0.227451, 1,
1.73399, -0.5189748, 1.030139, 1, 0, 0.2235294, 1,
1.758966, -0.6794423, 2.213833, 1, 0, 0.2156863, 1,
1.758979, -1.561373, 1.996256, 1, 0, 0.2117647, 1,
1.774249, -0.8401627, 1.145892, 1, 0, 0.2039216, 1,
1.782502, -0.2091431, 0.4721902, 1, 0, 0.1960784, 1,
1.790334, 0.6785027, 1.747523, 1, 0, 0.1921569, 1,
1.814759, -1.308738, 2.9394, 1, 0, 0.1843137, 1,
1.854722, -0.4826825, 2.389949, 1, 0, 0.1803922, 1,
1.856445, 0.6003944, -0.1096738, 1, 0, 0.172549, 1,
1.869909, 2.094968, 1.72397, 1, 0, 0.1686275, 1,
1.881602, 1.80874, 2.55234, 1, 0, 0.1607843, 1,
1.881669, 0.4299216, 0.2626148, 1, 0, 0.1568628, 1,
1.888285, 0.4997779, -0.4537568, 1, 0, 0.1490196, 1,
1.892204, 0.05076792, 1.454094, 1, 0, 0.145098, 1,
1.964679, 1.561692, 0.6608127, 1, 0, 0.1372549, 1,
1.968351, 0.604044, 1.194584, 1, 0, 0.1333333, 1,
1.98779, 0.481394, 1.727011, 1, 0, 0.1254902, 1,
1.996764, -0.4849631, 1.272049, 1, 0, 0.1215686, 1,
1.998986, -0.8276468, 1.658006, 1, 0, 0.1137255, 1,
2.026323, 0.1839496, 1.316013, 1, 0, 0.1098039, 1,
2.055728, -0.2938895, 0.8538501, 1, 0, 0.1019608, 1,
2.058236, -1.312655, 3.563327, 1, 0, 0.09411765, 1,
2.201744, 0.1792617, 2.04608, 1, 0, 0.09019608, 1,
2.230077, -0.7181885, 1.319694, 1, 0, 0.08235294, 1,
2.264324, -1.589236, 2.706222, 1, 0, 0.07843138, 1,
2.292782, -0.05210414, 1.024373, 1, 0, 0.07058824, 1,
2.334004, -0.6927767, 0.637893, 1, 0, 0.06666667, 1,
2.365822, 1.320492, 1.155097, 1, 0, 0.05882353, 1,
2.532031, -0.3280841, 0.7513299, 1, 0, 0.05490196, 1,
2.616464, -0.9569235, 2.013363, 1, 0, 0.04705882, 1,
2.76916, 0.03398671, 2.206954, 1, 0, 0.04313726, 1,
2.96826, -0.6185889, 1.894284, 1, 0, 0.03529412, 1,
3.004396, 1.532462, 1.501289, 1, 0, 0.03137255, 1,
3.074051, 1.32251, 0.3190033, 1, 0, 0.02352941, 1,
3.241741, 1.241008, 0.5772241, 1, 0, 0.01960784, 1,
3.394666, -0.2699196, 3.564244, 1, 0, 0.01176471, 1,
3.398968, -0.4421079, -1.785245, 1, 0, 0.007843138, 1
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
-0.2713113, -4.17259, -6.862484, 0, -0.5, 0.5, 0.5,
-0.2713113, -4.17259, -6.862484, 1, -0.5, 0.5, 0.5,
-0.2713113, -4.17259, -6.862484, 1, 1.5, 0.5, 0.5,
-0.2713113, -4.17259, -6.862484, 0, 1.5, 0.5, 0.5
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
-5.185815, -0.02718043, -6.862484, 0, -0.5, 0.5, 0.5,
-5.185815, -0.02718043, -6.862484, 1, -0.5, 0.5, 0.5,
-5.185815, -0.02718043, -6.862484, 1, 1.5, 0.5, 0.5,
-5.185815, -0.02718043, -6.862484, 0, 1.5, 0.5, 0.5
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
-5.185815, -4.17259, 0.0318718, 0, -0.5, 0.5, 0.5,
-5.185815, -4.17259, 0.0318718, 1, -0.5, 0.5, 0.5,
-5.185815, -4.17259, 0.0318718, 1, 1.5, 0.5, 0.5,
-5.185815, -4.17259, 0.0318718, 0, 1.5, 0.5, 0.5
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
-2, -3.215957, -5.271479,
2, -3.215957, -5.271479,
-2, -3.215957, -5.271479,
-2, -3.375396, -5.536646,
0, -3.215957, -5.271479,
0, -3.375396, -5.536646,
2, -3.215957, -5.271479,
2, -3.375396, -5.536646
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
-2, -3.694273, -6.066981, 0, -0.5, 0.5, 0.5,
-2, -3.694273, -6.066981, 1, -0.5, 0.5, 0.5,
-2, -3.694273, -6.066981, 1, 1.5, 0.5, 0.5,
-2, -3.694273, -6.066981, 0, 1.5, 0.5, 0.5,
0, -3.694273, -6.066981, 0, -0.5, 0.5, 0.5,
0, -3.694273, -6.066981, 1, -0.5, 0.5, 0.5,
0, -3.694273, -6.066981, 1, 1.5, 0.5, 0.5,
0, -3.694273, -6.066981, 0, 1.5, 0.5, 0.5,
2, -3.694273, -6.066981, 0, -0.5, 0.5, 0.5,
2, -3.694273, -6.066981, 1, -0.5, 0.5, 0.5,
2, -3.694273, -6.066981, 1, 1.5, 0.5, 0.5,
2, -3.694273, -6.066981, 0, 1.5, 0.5, 0.5
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
-4.051699, -3, -5.271479,
-4.051699, 3, -5.271479,
-4.051699, -3, -5.271479,
-4.240718, -3, -5.536646,
-4.051699, -2, -5.271479,
-4.240718, -2, -5.536646,
-4.051699, -1, -5.271479,
-4.240718, -1, -5.536646,
-4.051699, 0, -5.271479,
-4.240718, 0, -5.536646,
-4.051699, 1, -5.271479,
-4.240718, 1, -5.536646,
-4.051699, 2, -5.271479,
-4.240718, 2, -5.536646,
-4.051699, 3, -5.271479,
-4.240718, 3, -5.536646
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
-4.618757, -3, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, -3, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, -3, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, -3, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, -2, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, -2, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, -2, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, -2, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, -1, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, -1, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, -1, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, -1, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, 0, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, 0, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, 0, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, 0, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, 1, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, 1, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, 1, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, 1, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, 2, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, 2, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, 2, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, 2, -6.066981, 0, 1.5, 0.5, 0.5,
-4.618757, 3, -6.066981, 0, -0.5, 0.5, 0.5,
-4.618757, 3, -6.066981, 1, -0.5, 0.5, 0.5,
-4.618757, 3, -6.066981, 1, 1.5, 0.5, 0.5,
-4.618757, 3, -6.066981, 0, 1.5, 0.5, 0.5
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
-4.051699, -3.215957, -4,
-4.051699, -3.215957, 4,
-4.051699, -3.215957, -4,
-4.240718, -3.375396, -4,
-4.051699, -3.215957, -2,
-4.240718, -3.375396, -2,
-4.051699, -3.215957, 0,
-4.240718, -3.375396, 0,
-4.051699, -3.215957, 2,
-4.240718, -3.375396, 2,
-4.051699, -3.215957, 4,
-4.240718, -3.375396, 4
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
-4.618757, -3.694273, -4, 0, -0.5, 0.5, 0.5,
-4.618757, -3.694273, -4, 1, -0.5, 0.5, 0.5,
-4.618757, -3.694273, -4, 1, 1.5, 0.5, 0.5,
-4.618757, -3.694273, -4, 0, 1.5, 0.5, 0.5,
-4.618757, -3.694273, -2, 0, -0.5, 0.5, 0.5,
-4.618757, -3.694273, -2, 1, -0.5, 0.5, 0.5,
-4.618757, -3.694273, -2, 1, 1.5, 0.5, 0.5,
-4.618757, -3.694273, -2, 0, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 0, 0, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 0, 1, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 0, 1, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 0, 0, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 2, 0, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 2, 1, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 2, 1, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 2, 0, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 4, 0, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 4, 1, -0.5, 0.5, 0.5,
-4.618757, -3.694273, 4, 1, 1.5, 0.5, 0.5,
-4.618757, -3.694273, 4, 0, 1.5, 0.5, 0.5
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
-4.051699, -3.215957, -5.271479,
-4.051699, 3.161596, -5.271479,
-4.051699, -3.215957, 5.335222,
-4.051699, 3.161596, 5.335222,
-4.051699, -3.215957, -5.271479,
-4.051699, -3.215957, 5.335222,
-4.051699, 3.161596, -5.271479,
-4.051699, 3.161596, 5.335222,
-4.051699, -3.215957, -5.271479,
3.509076, -3.215957, -5.271479,
-4.051699, -3.215957, 5.335222,
3.509076, -3.215957, 5.335222,
-4.051699, 3.161596, -5.271479,
3.509076, 3.161596, -5.271479,
-4.051699, 3.161596, 5.335222,
3.509076, 3.161596, 5.335222,
3.509076, -3.215957, -5.271479,
3.509076, 3.161596, -5.271479,
3.509076, -3.215957, 5.335222,
3.509076, 3.161596, 5.335222,
3.509076, -3.215957, -5.271479,
3.509076, -3.215957, 5.335222,
3.509076, 3.161596, -5.271479,
3.509076, 3.161596, 5.335222
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
var radius = 7.744386;
var distance = 34.45565;
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
mvMatrix.translate( 0.2713113, 0.02718043, -0.0318718 );
mvMatrix.scale( 1.107477, 1.312946, 0.7894427 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45565);
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


