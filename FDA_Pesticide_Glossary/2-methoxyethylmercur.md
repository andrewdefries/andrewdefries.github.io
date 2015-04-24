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
-2.965646, -0.2994418, -2.120522, 1, 0, 0, 1,
-2.928462, 0.4396775, -0.3468398, 1, 0.007843138, 0, 1,
-2.818374, 0.8195829, -2.664823, 1, 0.01176471, 0, 1,
-2.779181, -0.02820035, -1.060927, 1, 0.01960784, 0, 1,
-2.646714, -1.973337, -0.1612049, 1, 0.02352941, 0, 1,
-2.585222, 0.8467404, -2.563045, 1, 0.03137255, 0, 1,
-2.573937, 1.014201, -1.454658, 1, 0.03529412, 0, 1,
-2.51815, 1.082438, -0.4143865, 1, 0.04313726, 0, 1,
-2.346329, -0.6608501, -2.310712, 1, 0.04705882, 0, 1,
-2.330333, -1.42407, -0.6647515, 1, 0.05490196, 0, 1,
-2.317286, 0.8655874, -1.089078, 1, 0.05882353, 0, 1,
-2.312213, 0.03895973, -3.052268, 1, 0.06666667, 0, 1,
-2.307438, -0.1942509, -0.6970336, 1, 0.07058824, 0, 1,
-2.274534, -0.1036344, -0.4002078, 1, 0.07843138, 0, 1,
-2.246768, 0.4873742, -1.142863, 1, 0.08235294, 0, 1,
-2.243209, -0.6099229, -3.65965, 1, 0.09019608, 0, 1,
-2.230117, -0.5577215, 0.7594537, 1, 0.09411765, 0, 1,
-2.220936, 0.5215191, -1.655415, 1, 0.1019608, 0, 1,
-2.13955, 0.4308789, -0.001475465, 1, 0.1098039, 0, 1,
-2.123033, -0.1834873, -2.628291, 1, 0.1137255, 0, 1,
-2.091426, 1.489638, -0.5367016, 1, 0.1215686, 0, 1,
-2.080237, -0.8602299, -2.25421, 1, 0.1254902, 0, 1,
-2.07926, 2.527912, -0.7762673, 1, 0.1333333, 0, 1,
-2.060979, 0.01155528, -2.49398, 1, 0.1372549, 0, 1,
-2.045109, 1.213282, -1.67846, 1, 0.145098, 0, 1,
-2.023345, -0.2392781, -2.826735, 1, 0.1490196, 0, 1,
-1.990769, 0.4440277, -2.130666, 1, 0.1568628, 0, 1,
-1.987871, 0.7707682, 0.2758446, 1, 0.1607843, 0, 1,
-1.960295, 1.129757, -1.20803, 1, 0.1686275, 0, 1,
-1.950719, 0.5177761, -1.592664, 1, 0.172549, 0, 1,
-1.944481, 1.204934, -1.000332, 1, 0.1803922, 0, 1,
-1.912364, -0.1516599, -1.659606, 1, 0.1843137, 0, 1,
-1.893671, -2.286313, -1.949745, 1, 0.1921569, 0, 1,
-1.890418, 0.5025996, -0.7280834, 1, 0.1960784, 0, 1,
-1.886747, -1.958315, -0.9280017, 1, 0.2039216, 0, 1,
-1.885959, 2.17608, -1.558865, 1, 0.2117647, 0, 1,
-1.876536, -1.555989, -3.094157, 1, 0.2156863, 0, 1,
-1.851282, -1.280784, -1.379163, 1, 0.2235294, 0, 1,
-1.842177, 1.212962, 0.8524535, 1, 0.227451, 0, 1,
-1.826976, -0.06675113, -2.453321, 1, 0.2352941, 0, 1,
-1.813011, -0.8390391, -1.920244, 1, 0.2392157, 0, 1,
-1.81146, -1.751677, -3.133356, 1, 0.2470588, 0, 1,
-1.81093, -0.4349646, -1.041214, 1, 0.2509804, 0, 1,
-1.808283, -1.441741, -0.3248048, 1, 0.2588235, 0, 1,
-1.797294, -1.912802, -2.270356, 1, 0.2627451, 0, 1,
-1.795847, 0.3916583, -1.068815, 1, 0.2705882, 0, 1,
-1.767019, 1.005624, -0.5820836, 1, 0.2745098, 0, 1,
-1.764917, 1.0714, -1.288107, 1, 0.282353, 0, 1,
-1.76304, -0.5446839, -1.363891, 1, 0.2862745, 0, 1,
-1.760623, 0.4598144, -2.284637, 1, 0.2941177, 0, 1,
-1.754917, 0.8109779, -2.969248, 1, 0.3019608, 0, 1,
-1.751597, -1.149528, -0.3601621, 1, 0.3058824, 0, 1,
-1.739516, -0.1154778, -0.7042943, 1, 0.3137255, 0, 1,
-1.73177, 1.192509, 0.8100049, 1, 0.3176471, 0, 1,
-1.708382, -0.6476346, -1.615986, 1, 0.3254902, 0, 1,
-1.698783, 0.2783541, -2.613676, 1, 0.3294118, 0, 1,
-1.697917, 2.683001, 0.4491785, 1, 0.3372549, 0, 1,
-1.695434, -1.432385, -2.338347, 1, 0.3411765, 0, 1,
-1.695218, 0.6523369, -1.123483, 1, 0.3490196, 0, 1,
-1.693584, 0.2896426, -1.969179, 1, 0.3529412, 0, 1,
-1.669944, 0.6398619, -0.6751308, 1, 0.3607843, 0, 1,
-1.656078, 0.6101918, -0.3835776, 1, 0.3647059, 0, 1,
-1.647042, -0.5095691, -2.76397, 1, 0.372549, 0, 1,
-1.624508, -1.691173, -2.641878, 1, 0.3764706, 0, 1,
-1.615409, 1.569625, -0.6814167, 1, 0.3843137, 0, 1,
-1.609357, 0.5340976, 0.3264425, 1, 0.3882353, 0, 1,
-1.604416, 1.750335, 0.1476491, 1, 0.3960784, 0, 1,
-1.601499, 1.755785, -0.2842679, 1, 0.4039216, 0, 1,
-1.586336, -1.123118, -2.503612, 1, 0.4078431, 0, 1,
-1.584453, 0.02366498, -0.6332834, 1, 0.4156863, 0, 1,
-1.584169, -1.697808, -3.839592, 1, 0.4196078, 0, 1,
-1.574702, 1.249072, -1.601104, 1, 0.427451, 0, 1,
-1.565517, 0.06993612, -0.3254267, 1, 0.4313726, 0, 1,
-1.557529, -0.04038088, -1.656839, 1, 0.4392157, 0, 1,
-1.555596, 0.5327541, -1.098377, 1, 0.4431373, 0, 1,
-1.555261, 0.3425383, -1.72675, 1, 0.4509804, 0, 1,
-1.541381, -0.3018644, -1.321623, 1, 0.454902, 0, 1,
-1.532398, -0.1756592, -2.163569, 1, 0.4627451, 0, 1,
-1.528152, 0.2020749, -1.258394, 1, 0.4666667, 0, 1,
-1.517602, -0.7464663, -3.331069, 1, 0.4745098, 0, 1,
-1.514545, 2.213358, -0.6742112, 1, 0.4784314, 0, 1,
-1.509599, -2.200782, -1.783557, 1, 0.4862745, 0, 1,
-1.476529, 1.308243, 0.1302629, 1, 0.4901961, 0, 1,
-1.467985, 0.3519974, -1.827407, 1, 0.4980392, 0, 1,
-1.465878, -0.7294942, -4.650908, 1, 0.5058824, 0, 1,
-1.454956, 0.174873, -0.4194764, 1, 0.509804, 0, 1,
-1.445957, -0.287037, -1.162363, 1, 0.5176471, 0, 1,
-1.444629, -0.3185154, -1.487346, 1, 0.5215687, 0, 1,
-1.420655, 0.2723808, 0.1134897, 1, 0.5294118, 0, 1,
-1.412711, -0.3417152, -1.080966, 1, 0.5333334, 0, 1,
-1.410304, 2.375585, 0.7557339, 1, 0.5411765, 0, 1,
-1.403478, -0.3827069, -2.626832, 1, 0.5450981, 0, 1,
-1.402214, 0.7131547, -2.033647, 1, 0.5529412, 0, 1,
-1.399555, -1.220407, -2.282571, 1, 0.5568628, 0, 1,
-1.394433, -2.286922, -3.53397, 1, 0.5647059, 0, 1,
-1.388958, 0.9008666, -0.6409322, 1, 0.5686275, 0, 1,
-1.383026, 0.4745388, -1.894779, 1, 0.5764706, 0, 1,
-1.380841, 0.2060405, -0.9743464, 1, 0.5803922, 0, 1,
-1.376257, -0.4828905, -2.937563, 1, 0.5882353, 0, 1,
-1.372827, 0.2228065, 0.7519418, 1, 0.5921569, 0, 1,
-1.357475, -0.1391849, -3.812118, 1, 0.6, 0, 1,
-1.350247, -1.131001, -0.7511865, 1, 0.6078432, 0, 1,
-1.330608, 0.7401903, 0.4989635, 1, 0.6117647, 0, 1,
-1.305158, 0.7761657, -1.066016, 1, 0.6196079, 0, 1,
-1.276207, -0.2184271, -2.40657, 1, 0.6235294, 0, 1,
-1.268473, -0.2555342, -3.342426, 1, 0.6313726, 0, 1,
-1.255569, -0.562384, -1.984575, 1, 0.6352941, 0, 1,
-1.247041, -0.3322936, -2.83483, 1, 0.6431373, 0, 1,
-1.235284, -0.9573935, -4.10127, 1, 0.6470588, 0, 1,
-1.233905, -1.172556, -3.763066, 1, 0.654902, 0, 1,
-1.228233, -0.4123664, -2.165075, 1, 0.6588235, 0, 1,
-1.226628, -0.0873084, -0.2826604, 1, 0.6666667, 0, 1,
-1.211631, 0.8418204, -1.258897, 1, 0.6705883, 0, 1,
-1.204123, 0.1708248, -0.6400576, 1, 0.6784314, 0, 1,
-1.203752, 0.3164448, -2.561438, 1, 0.682353, 0, 1,
-1.195578, 0.8029429, -1.50336, 1, 0.6901961, 0, 1,
-1.177157, 0.9950004, -0.08720832, 1, 0.6941177, 0, 1,
-1.171327, -1.515961, -0.9684622, 1, 0.7019608, 0, 1,
-1.16995, 0.5527708, -1.429751, 1, 0.7098039, 0, 1,
-1.163498, 0.4488747, -3.298671, 1, 0.7137255, 0, 1,
-1.160792, 0.1929734, -0.9746394, 1, 0.7215686, 0, 1,
-1.15943, -0.4484106, -2.108503, 1, 0.7254902, 0, 1,
-1.150601, -0.251332, -4.056336, 1, 0.7333333, 0, 1,
-1.146879, 0.5475463, -1.253717, 1, 0.7372549, 0, 1,
-1.145615, 1.069461, -0.7222186, 1, 0.7450981, 0, 1,
-1.145434, 0.6376969, -0.4623675, 1, 0.7490196, 0, 1,
-1.136352, -1.106854, -3.124017, 1, 0.7568628, 0, 1,
-1.132589, 0.9098759, -0.7590352, 1, 0.7607843, 0, 1,
-1.130373, 0.04623382, -1.889295, 1, 0.7686275, 0, 1,
-1.128556, -0.05473844, -1.755096, 1, 0.772549, 0, 1,
-1.121444, -1.331819, -2.06094, 1, 0.7803922, 0, 1,
-1.116597, 0.4474081, -0.8882254, 1, 0.7843137, 0, 1,
-1.116077, -1.005754, -1.879116, 1, 0.7921569, 0, 1,
-1.113999, 1.055427, -0.548247, 1, 0.7960784, 0, 1,
-1.105394, 0.1638139, 0.3078517, 1, 0.8039216, 0, 1,
-1.095236, 0.02333712, 0.4736858, 1, 0.8117647, 0, 1,
-1.090355, -1.885162, -2.309038, 1, 0.8156863, 0, 1,
-1.088261, -0.1211049, -2.299347, 1, 0.8235294, 0, 1,
-1.081433, -0.01906964, -1.136882, 1, 0.827451, 0, 1,
-1.078873, 1.568665, -1.635232, 1, 0.8352941, 0, 1,
-1.068331, 1.42019, -0.7454876, 1, 0.8392157, 0, 1,
-1.065619, 0.593554, -1.594305, 1, 0.8470588, 0, 1,
-1.061345, 1.532892, -1.904528, 1, 0.8509804, 0, 1,
-1.050134, 1.067574, -0.5128924, 1, 0.8588235, 0, 1,
-1.048646, 0.05994504, -4.099889, 1, 0.8627451, 0, 1,
-1.044213, -1.765976, -4.463084, 1, 0.8705882, 0, 1,
-1.044069, 1.021441, -0.392217, 1, 0.8745098, 0, 1,
-1.04286, 0.03148845, -2.931389, 1, 0.8823529, 0, 1,
-1.037593, -1.791303, -3.865332, 1, 0.8862745, 0, 1,
-1.036667, 0.006205227, -1.02588, 1, 0.8941177, 0, 1,
-1.036323, -1.408921, -2.62781, 1, 0.8980392, 0, 1,
-1.029045, 0.9959732, -0.6184837, 1, 0.9058824, 0, 1,
-1.022526, 0.2277839, -2.277197, 1, 0.9137255, 0, 1,
-1.019455, -0.02402995, -1.641628, 1, 0.9176471, 0, 1,
-1.01919, 0.5661644, -0.4372849, 1, 0.9254902, 0, 1,
-1.018603, 0.4648707, 1.406549, 1, 0.9294118, 0, 1,
-1.015467, -1.287898, -2.60307, 1, 0.9372549, 0, 1,
-1.015354, -1.632252, -3.327273, 1, 0.9411765, 0, 1,
-1.013174, 0.9551434, -2.319468, 1, 0.9490196, 0, 1,
-1.00809, 1.301945, -0.1260725, 1, 0.9529412, 0, 1,
-1.002724, 1.014718, -0.3847137, 1, 0.9607843, 0, 1,
-1.0021, 0.2701113, -1.427627, 1, 0.9647059, 0, 1,
-1.001137, 1.374282, 1.064814, 1, 0.972549, 0, 1,
-0.9965818, 1.094445, -0.7525185, 1, 0.9764706, 0, 1,
-0.992119, 1.917025, -1.774985, 1, 0.9843137, 0, 1,
-0.9816313, 0.336132, 0.8880545, 1, 0.9882353, 0, 1,
-0.9797896, -1.045507, -3.266995, 1, 0.9960784, 0, 1,
-0.9775667, -0.2381188, -3.417782, 0.9960784, 1, 0, 1,
-0.9742415, 1.388631, 0.5913458, 0.9921569, 1, 0, 1,
-0.9599563, 0.2872084, 1.028035, 0.9843137, 1, 0, 1,
-0.956862, -0.8381043, -3.496874, 0.9803922, 1, 0, 1,
-0.9568222, 1.01638, -0.2262712, 0.972549, 1, 0, 1,
-0.9457492, -0.8634599, -2.061791, 0.9686275, 1, 0, 1,
-0.9454288, -0.4154257, -3.427171, 0.9607843, 1, 0, 1,
-0.9395837, -0.799823, -1.677155, 0.9568627, 1, 0, 1,
-0.9352472, 1.458198, 0.03691348, 0.9490196, 1, 0, 1,
-0.9336424, -0.1161592, -2.736012, 0.945098, 1, 0, 1,
-0.9330549, -0.895217, -4.155362, 0.9372549, 1, 0, 1,
-0.9330047, -0.6353337, -0.487633, 0.9333333, 1, 0, 1,
-0.9252053, -1.035638, -2.325348, 0.9254902, 1, 0, 1,
-0.9246321, -0.7429146, -5.05975, 0.9215686, 1, 0, 1,
-0.9110482, -0.4900548, 0.5007685, 0.9137255, 1, 0, 1,
-0.9105811, 1.843824, -2.0961, 0.9098039, 1, 0, 1,
-0.9054319, -0.7061564, -1.039051, 0.9019608, 1, 0, 1,
-0.9053235, 0.4681365, -1.50784, 0.8941177, 1, 0, 1,
-0.8939937, -0.058968, -1.120092, 0.8901961, 1, 0, 1,
-0.8921495, -0.7546049, -1.561425, 0.8823529, 1, 0, 1,
-0.8916, -1.419662, -2.338843, 0.8784314, 1, 0, 1,
-0.88323, 0.1868282, -1.071208, 0.8705882, 1, 0, 1,
-0.8792468, 0.2867182, -2.012376, 0.8666667, 1, 0, 1,
-0.8736268, -0.6195522, -1.937022, 0.8588235, 1, 0, 1,
-0.8647056, 0.04575778, -2.237405, 0.854902, 1, 0, 1,
-0.8610552, 1.48322, -0.1043842, 0.8470588, 1, 0, 1,
-0.8583519, 1.554307, 0.2661626, 0.8431373, 1, 0, 1,
-0.8554834, -0.5151716, -3.323101, 0.8352941, 1, 0, 1,
-0.8513648, -1.757244, -3.804236, 0.8313726, 1, 0, 1,
-0.8496479, 0.2097022, -0.7682369, 0.8235294, 1, 0, 1,
-0.8487626, 0.2247962, -1.02815, 0.8196079, 1, 0, 1,
-0.847261, -1.082576, -4.31872, 0.8117647, 1, 0, 1,
-0.8437537, -0.4910655, -3.037238, 0.8078431, 1, 0, 1,
-0.8436475, -0.9380416, -1.494577, 0.8, 1, 0, 1,
-0.8264608, 0.6966302, -0.1563548, 0.7921569, 1, 0, 1,
-0.8253055, -0.1414927, -2.616167, 0.7882353, 1, 0, 1,
-0.8186458, 0.1380923, -2.232255, 0.7803922, 1, 0, 1,
-0.8169935, -0.1768235, -1.457219, 0.7764706, 1, 0, 1,
-0.8155113, -2.074271, -2.624501, 0.7686275, 1, 0, 1,
-0.8151713, 0.5922893, 0.1030775, 0.7647059, 1, 0, 1,
-0.8122913, 0.9506949, -1.638881, 0.7568628, 1, 0, 1,
-0.8037021, -0.3260563, -1.004118, 0.7529412, 1, 0, 1,
-0.7980915, 0.04015365, -2.670534, 0.7450981, 1, 0, 1,
-0.7915878, -2.03477, -2.40502, 0.7411765, 1, 0, 1,
-0.7908612, 0.8297157, 1.124092, 0.7333333, 1, 0, 1,
-0.7894466, 0.5587376, 0.4222971, 0.7294118, 1, 0, 1,
-0.7867144, -0.7652674, -3.732781, 0.7215686, 1, 0, 1,
-0.7827362, -2.385926, -4.326293, 0.7176471, 1, 0, 1,
-0.7783374, 0.2235546, 0.3408191, 0.7098039, 1, 0, 1,
-0.7743304, -0.1961487, -2.913943, 0.7058824, 1, 0, 1,
-0.7575127, -0.844996, -2.803696, 0.6980392, 1, 0, 1,
-0.7571439, 0.3135717, -0.1938771, 0.6901961, 1, 0, 1,
-0.7551963, 0.3215345, -2.516244, 0.6862745, 1, 0, 1,
-0.7545121, -0.3582104, -1.898637, 0.6784314, 1, 0, 1,
-0.7508992, -0.5331304, -1.103357, 0.6745098, 1, 0, 1,
-0.7466365, 0.176788, -2.691656, 0.6666667, 1, 0, 1,
-0.7425322, 0.03957536, -2.292464, 0.6627451, 1, 0, 1,
-0.7371056, -1.266975, -3.102747, 0.654902, 1, 0, 1,
-0.735921, -1.146293, -1.811879, 0.6509804, 1, 0, 1,
-0.731297, 0.607803, -0.7168953, 0.6431373, 1, 0, 1,
-0.7301689, -1.284257, -4.112627, 0.6392157, 1, 0, 1,
-0.7260719, 1.059921, -1.049897, 0.6313726, 1, 0, 1,
-0.7237445, -0.1479338, -2.098907, 0.627451, 1, 0, 1,
-0.7232475, 0.59344, -1.0456, 0.6196079, 1, 0, 1,
-0.7170393, -1.955133, -3.164511, 0.6156863, 1, 0, 1,
-0.7115, 0.7465303, -0.9547719, 0.6078432, 1, 0, 1,
-0.7114875, -0.4693767, -1.149309, 0.6039216, 1, 0, 1,
-0.7073691, -2.572891, -1.475994, 0.5960785, 1, 0, 1,
-0.7057161, -0.5581901, -2.321737, 0.5882353, 1, 0, 1,
-0.7053952, -1.381231, -2.50919, 0.5843138, 1, 0, 1,
-0.7029209, -1.243374, -2.170141, 0.5764706, 1, 0, 1,
-0.7027299, -0.09968415, -0.1809382, 0.572549, 1, 0, 1,
-0.702717, -0.7009236, -0.8335357, 0.5647059, 1, 0, 1,
-0.6943756, -1.094869, -3.227652, 0.5607843, 1, 0, 1,
-0.6915913, 0.7234074, -1.708072, 0.5529412, 1, 0, 1,
-0.6908715, -1.029542, -2.269465, 0.5490196, 1, 0, 1,
-0.6889646, -0.07350865, 0.3324617, 0.5411765, 1, 0, 1,
-0.6882539, -0.5429083, -2.276075, 0.5372549, 1, 0, 1,
-0.6868248, -0.110739, -0.763651, 0.5294118, 1, 0, 1,
-0.6840245, -0.2942713, -1.497889, 0.5254902, 1, 0, 1,
-0.6832413, -0.5893974, -1.646811, 0.5176471, 1, 0, 1,
-0.6771803, -0.8245877, -3.483603, 0.5137255, 1, 0, 1,
-0.6752023, -1.289551, -2.586335, 0.5058824, 1, 0, 1,
-0.669229, 1.072659, -1.778747, 0.5019608, 1, 0, 1,
-0.6671576, -1.426694, -2.472324, 0.4941176, 1, 0, 1,
-0.6598714, 1.244169, -1.004758, 0.4862745, 1, 0, 1,
-0.6540117, 0.4822479, -1.40886, 0.4823529, 1, 0, 1,
-0.6481323, 0.2481911, -2.131071, 0.4745098, 1, 0, 1,
-0.645103, -2.124074, -1.869788, 0.4705882, 1, 0, 1,
-0.6444753, -1.396982, -3.762553, 0.4627451, 1, 0, 1,
-0.644366, 0.4124498, 0.5762935, 0.4588235, 1, 0, 1,
-0.6433257, 0.2997611, -1.957636, 0.4509804, 1, 0, 1,
-0.6419495, 0.407185, -0.3720696, 0.4470588, 1, 0, 1,
-0.6311528, 0.9336433, -0.06422126, 0.4392157, 1, 0, 1,
-0.6304548, -0.5843039, -0.9063432, 0.4352941, 1, 0, 1,
-0.627308, -1.255425, -2.841897, 0.427451, 1, 0, 1,
-0.6252681, -1.012752, -2.368976, 0.4235294, 1, 0, 1,
-0.6251224, -0.576339, -1.663009, 0.4156863, 1, 0, 1,
-0.6246636, 1.472425, -0.9618498, 0.4117647, 1, 0, 1,
-0.62161, 0.8418381, -1.648832, 0.4039216, 1, 0, 1,
-0.6215208, 1.686719, -1.629074, 0.3960784, 1, 0, 1,
-0.6185361, 1.242706, -0.003509016, 0.3921569, 1, 0, 1,
-0.6175023, -0.6074945, -2.697762, 0.3843137, 1, 0, 1,
-0.6141512, 0.7604001, -3.310651, 0.3803922, 1, 0, 1,
-0.6133657, 0.7612825, -0.1877694, 0.372549, 1, 0, 1,
-0.6122357, 0.1493043, -1.451014, 0.3686275, 1, 0, 1,
-0.6116173, -1.529317, -3.655037, 0.3607843, 1, 0, 1,
-0.6109957, 0.09306397, 0.4055236, 0.3568628, 1, 0, 1,
-0.6105985, 0.451773, -0.1753661, 0.3490196, 1, 0, 1,
-0.6088274, -0.3189934, -1.806885, 0.345098, 1, 0, 1,
-0.6080407, 0.7664196, -1.30864, 0.3372549, 1, 0, 1,
-0.6037798, 0.05991305, -0.8528243, 0.3333333, 1, 0, 1,
-0.6024339, 0.9102519, -1.278424, 0.3254902, 1, 0, 1,
-0.5996664, -0.6294887, -1.83029, 0.3215686, 1, 0, 1,
-0.5995523, 0.1932093, -0.4292455, 0.3137255, 1, 0, 1,
-0.5992714, -0.553305, -4.374558, 0.3098039, 1, 0, 1,
-0.5940248, 0.553381, 0.04513419, 0.3019608, 1, 0, 1,
-0.5914041, -0.9335092, -4.772115, 0.2941177, 1, 0, 1,
-0.5895734, 0.4806866, -1.071364, 0.2901961, 1, 0, 1,
-0.5853426, -1.010869, -1.954489, 0.282353, 1, 0, 1,
-0.5761225, -0.3560263, -1.775885, 0.2784314, 1, 0, 1,
-0.5677645, 1.649315, 1.912091, 0.2705882, 1, 0, 1,
-0.5651101, -1.881762, -2.804378, 0.2666667, 1, 0, 1,
-0.560268, -0.3116786, -2.320074, 0.2588235, 1, 0, 1,
-0.5575254, -0.1910061, -3.124971, 0.254902, 1, 0, 1,
-0.557218, -0.801159, -3.595188, 0.2470588, 1, 0, 1,
-0.5570227, -1.108773, -2.608454, 0.2431373, 1, 0, 1,
-0.5552602, -1.084251, -3.317164, 0.2352941, 1, 0, 1,
-0.5512732, -0.8797877, -4.130519, 0.2313726, 1, 0, 1,
-0.5462299, -2.009529, -1.734642, 0.2235294, 1, 0, 1,
-0.5445507, -0.5537314, -1.061228, 0.2196078, 1, 0, 1,
-0.5409543, -1.023801, -2.599299, 0.2117647, 1, 0, 1,
-0.5396473, 0.3026818, -0.3550678, 0.2078431, 1, 0, 1,
-0.5324748, 1.068344, -0.9252467, 0.2, 1, 0, 1,
-0.5294076, 0.3861123, -0.5245238, 0.1921569, 1, 0, 1,
-0.5200179, 0.6158714, -0.5315993, 0.1882353, 1, 0, 1,
-0.5159591, 1.661791, 0.6597843, 0.1803922, 1, 0, 1,
-0.5151243, 0.1238516, -0.7730021, 0.1764706, 1, 0, 1,
-0.5080509, 0.3808292, -0.5756884, 0.1686275, 1, 0, 1,
-0.49907, 0.8277123, -1.894476, 0.1647059, 1, 0, 1,
-0.490727, -0.2256261, -2.727636, 0.1568628, 1, 0, 1,
-0.4866679, -0.2713168, -1.844431, 0.1529412, 1, 0, 1,
-0.4860319, 1.065401, 0.1625229, 0.145098, 1, 0, 1,
-0.4812051, 2.687904, -2.014521, 0.1411765, 1, 0, 1,
-0.4780807, 0.8808497, 0.5784198, 0.1333333, 1, 0, 1,
-0.476553, 1.55174, 0.02283411, 0.1294118, 1, 0, 1,
-0.474121, -0.7758096, -1.917886, 0.1215686, 1, 0, 1,
-0.4737884, 0.4678454, -0.7112067, 0.1176471, 1, 0, 1,
-0.4715438, -1.368737, -1.860056, 0.1098039, 1, 0, 1,
-0.4641563, 0.1626622, -1.176068, 0.1058824, 1, 0, 1,
-0.4605365, 0.01462287, -2.678065, 0.09803922, 1, 0, 1,
-0.4587358, -0.4310962, -2.778038, 0.09019608, 1, 0, 1,
-0.4539164, 1.874344, -0.2571833, 0.08627451, 1, 0, 1,
-0.453828, 0.9890643, -1.652005, 0.07843138, 1, 0, 1,
-0.4533222, -0.246692, -0.8379055, 0.07450981, 1, 0, 1,
-0.4502531, -0.352203, -2.300143, 0.06666667, 1, 0, 1,
-0.4478977, -2.326495, -3.703557, 0.0627451, 1, 0, 1,
-0.4459399, -0.9506026, -3.97963, 0.05490196, 1, 0, 1,
-0.4451964, 1.277916, -1.561299, 0.05098039, 1, 0, 1,
-0.4437, -1.273115, -3.340926, 0.04313726, 1, 0, 1,
-0.4429092, -0.6389431, -3.153848, 0.03921569, 1, 0, 1,
-0.4400111, -0.7943031, -1.941258, 0.03137255, 1, 0, 1,
-0.4392294, 0.6900285, 0.3816379, 0.02745098, 1, 0, 1,
-0.4385734, 0.7296413, -1.677272, 0.01960784, 1, 0, 1,
-0.4385552, 1.48279, -1.04819, 0.01568628, 1, 0, 1,
-0.430198, 1.607956, 0.003329129, 0.007843138, 1, 0, 1,
-0.4282613, 0.3742853, -2.088944, 0.003921569, 1, 0, 1,
-0.4251835, 0.300509, -2.172832, 0, 1, 0.003921569, 1,
-0.4234619, 1.444246, -1.567741, 0, 1, 0.01176471, 1,
-0.421044, -0.7544746, -3.25797, 0, 1, 0.01568628, 1,
-0.4131974, 0.625737, -2.180858, 0, 1, 0.02352941, 1,
-0.409263, -0.8426225, -3.334992, 0, 1, 0.02745098, 1,
-0.408212, 0.2676207, -1.351883, 0, 1, 0.03529412, 1,
-0.4065033, -1.859129, -3.109866, 0, 1, 0.03921569, 1,
-0.4058913, 0.7924464, 1.057299, 0, 1, 0.04705882, 1,
-0.4055779, -0.5673596, -1.710433, 0, 1, 0.05098039, 1,
-0.4049127, 0.4713071, 0.1562467, 0, 1, 0.05882353, 1,
-0.4016574, 2.340224, 0.4069716, 0, 1, 0.0627451, 1,
-0.4014304, 1.172954, 1.092003, 0, 1, 0.07058824, 1,
-0.3995474, -0.7585204, -2.947775, 0, 1, 0.07450981, 1,
-0.3992761, 0.2527881, -0.6155761, 0, 1, 0.08235294, 1,
-0.3969085, -0.4896623, -0.1955435, 0, 1, 0.08627451, 1,
-0.3955356, -0.1228074, -0.8086761, 0, 1, 0.09411765, 1,
-0.3938511, 0.5359578, -2.473924, 0, 1, 0.1019608, 1,
-0.3905551, 0.1840438, -3.668216, 0, 1, 0.1058824, 1,
-0.3863148, -0.7307823, -1.582281, 0, 1, 0.1137255, 1,
-0.3833226, 0.004891477, -1.171445, 0, 1, 0.1176471, 1,
-0.3817659, 1.94264, -2.081579, 0, 1, 0.1254902, 1,
-0.380735, 0.8175217, -0.473868, 0, 1, 0.1294118, 1,
-0.3782254, 0.6019978, -0.3593291, 0, 1, 0.1372549, 1,
-0.3773629, 1.048862, 0.08453545, 0, 1, 0.1411765, 1,
-0.3747258, 0.8073061, -1.349897, 0, 1, 0.1490196, 1,
-0.3747099, 1.7793, -0.08526883, 0, 1, 0.1529412, 1,
-0.3641598, -0.34567, -1.847905, 0, 1, 0.1607843, 1,
-0.3632271, -1.31072, -2.565821, 0, 1, 0.1647059, 1,
-0.3629186, -0.5165566, -3.483608, 0, 1, 0.172549, 1,
-0.3608815, -0.6196628, -0.4278663, 0, 1, 0.1764706, 1,
-0.3556663, -0.3372856, -3.283802, 0, 1, 0.1843137, 1,
-0.3503724, 0.0989211, -3.755814, 0, 1, 0.1882353, 1,
-0.3489584, -1.642518, -1.95508, 0, 1, 0.1960784, 1,
-0.3444642, -0.4385415, -2.317671, 0, 1, 0.2039216, 1,
-0.3433285, 0.9750453, 2.212759, 0, 1, 0.2078431, 1,
-0.3423233, 0.9274536, 0.6213403, 0, 1, 0.2156863, 1,
-0.3390778, 0.8065432, -0.08699411, 0, 1, 0.2196078, 1,
-0.338698, 1.038168, 1.005276, 0, 1, 0.227451, 1,
-0.3374429, -0.336756, -3.068268, 0, 1, 0.2313726, 1,
-0.3361583, -0.03382213, -0.9266756, 0, 1, 0.2392157, 1,
-0.3339817, 0.765743, 0.4780103, 0, 1, 0.2431373, 1,
-0.3334589, 1.504018, -0.1946695, 0, 1, 0.2509804, 1,
-0.3273728, -0.769446, 0.1580805, 0, 1, 0.254902, 1,
-0.3252051, 0.1203931, -1.448267, 0, 1, 0.2627451, 1,
-0.3242776, -0.7459576, -2.465965, 0, 1, 0.2666667, 1,
-0.320172, 0.596274, -0.5182798, 0, 1, 0.2745098, 1,
-0.3197316, 0.03920451, -1.932661, 0, 1, 0.2784314, 1,
-0.319073, 0.1122935, -2.790996, 0, 1, 0.2862745, 1,
-0.3156674, -0.4350427, -2.67556, 0, 1, 0.2901961, 1,
-0.3132701, 1.531998, -1.209273, 0, 1, 0.2980392, 1,
-0.311811, 1.086746, -0.1199874, 0, 1, 0.3058824, 1,
-0.3090371, -1.288751, -3.838917, 0, 1, 0.3098039, 1,
-0.308509, 1.189655, -0.559358, 0, 1, 0.3176471, 1,
-0.3077669, -0.6686882, -1.050169, 0, 1, 0.3215686, 1,
-0.3003273, -0.02794726, -0.8940858, 0, 1, 0.3294118, 1,
-0.2994958, -1.535982, -3.373558, 0, 1, 0.3333333, 1,
-0.2965758, 0.8118789, -0.8373389, 0, 1, 0.3411765, 1,
-0.2940732, -0.0935718, -2.610976, 0, 1, 0.345098, 1,
-0.2885512, 0.6047567, 0.2696541, 0, 1, 0.3529412, 1,
-0.2876028, 0.4014444, -0.1403329, 0, 1, 0.3568628, 1,
-0.2868237, 1.138279, 0.9985108, 0, 1, 0.3647059, 1,
-0.2856314, -0.1980462, -0.5267456, 0, 1, 0.3686275, 1,
-0.2827265, 0.9062926, 0.4901549, 0, 1, 0.3764706, 1,
-0.2813774, -0.2175634, -2.056454, 0, 1, 0.3803922, 1,
-0.2760077, -0.1300294, 0.09915582, 0, 1, 0.3882353, 1,
-0.2755937, -1.183764, -2.619841, 0, 1, 0.3921569, 1,
-0.2746771, 0.6836206, -1.464009, 0, 1, 0.4, 1,
-0.272678, -0.5469182, -2.860382, 0, 1, 0.4078431, 1,
-0.2689667, 0.2668223, -0.7395846, 0, 1, 0.4117647, 1,
-0.2676578, -0.4983097, -3.333859, 0, 1, 0.4196078, 1,
-0.2668892, -0.1200757, -2.008794, 0, 1, 0.4235294, 1,
-0.2638117, -1.158857, -3.455413, 0, 1, 0.4313726, 1,
-0.2565037, 0.6098193, -1.095515, 0, 1, 0.4352941, 1,
-0.2530604, -0.1715931, -3.860007, 0, 1, 0.4431373, 1,
-0.2528882, -1.557597, -1.715124, 0, 1, 0.4470588, 1,
-0.2517984, -2.085272, -4.999985, 0, 1, 0.454902, 1,
-0.2494467, -1.329873, -3.448032, 0, 1, 0.4588235, 1,
-0.2481118, -1.012556, -3.979173, 0, 1, 0.4666667, 1,
-0.2474313, 0.7591895, 0.06904673, 0, 1, 0.4705882, 1,
-0.2458018, -0.8962125, -1.84908, 0, 1, 0.4784314, 1,
-0.2449013, 1.14414, -2.74529, 0, 1, 0.4823529, 1,
-0.241452, 0.09830176, 0.7298118, 0, 1, 0.4901961, 1,
-0.239188, -1.720908, -2.329824, 0, 1, 0.4941176, 1,
-0.2356306, 0.267676, -1.121962, 0, 1, 0.5019608, 1,
-0.2298682, 0.3966544, 1.541921, 0, 1, 0.509804, 1,
-0.2287119, -0.01509213, -2.744378, 0, 1, 0.5137255, 1,
-0.2265338, 0.6217628, 0.8252915, 0, 1, 0.5215687, 1,
-0.2165613, -0.4461171, -1.711313, 0, 1, 0.5254902, 1,
-0.2130781, 0.2286461, 1.299312, 0, 1, 0.5333334, 1,
-0.2124985, 0.02505449, -1.402591, 0, 1, 0.5372549, 1,
-0.2112954, 0.7014825, 0.2043411, 0, 1, 0.5450981, 1,
-0.2112937, 1.717074, -0.4451905, 0, 1, 0.5490196, 1,
-0.2048276, 0.5242314, -0.8474037, 0, 1, 0.5568628, 1,
-0.2040753, -0.7934753, -4.768456, 0, 1, 0.5607843, 1,
-0.2014274, -0.003385275, -1.28214, 0, 1, 0.5686275, 1,
-0.1983792, -1.122116, -2.299025, 0, 1, 0.572549, 1,
-0.1941442, 1.334937, 1.138172, 0, 1, 0.5803922, 1,
-0.1906283, -0.2999359, -0.3148038, 0, 1, 0.5843138, 1,
-0.1896292, 0.2519203, -1.245612, 0, 1, 0.5921569, 1,
-0.188925, -0.1546979, -1.006341, 0, 1, 0.5960785, 1,
-0.1888958, 1.206116, -0.1897977, 0, 1, 0.6039216, 1,
-0.185287, -0.07396859, -3.159931, 0, 1, 0.6117647, 1,
-0.1852456, 0.6411036, -0.4594162, 0, 1, 0.6156863, 1,
-0.1849811, 0.2903326, -1.311018, 0, 1, 0.6235294, 1,
-0.1834567, -0.1305779, -0.5448948, 0, 1, 0.627451, 1,
-0.1824424, -0.05388233, -2.299108, 0, 1, 0.6352941, 1,
-0.1775975, 0.789946, -1.044865, 0, 1, 0.6392157, 1,
-0.174102, -0.7850273, -5.71672, 0, 1, 0.6470588, 1,
-0.1730199, 0.2177317, 0.1373105, 0, 1, 0.6509804, 1,
-0.1673899, 2.172313, 0.2985822, 0, 1, 0.6588235, 1,
-0.1630769, 0.07745915, -0.3632583, 0, 1, 0.6627451, 1,
-0.1599445, -0.03560937, -0.8055593, 0, 1, 0.6705883, 1,
-0.1555182, 2.028672, 0.3300774, 0, 1, 0.6745098, 1,
-0.1499601, 1.119181, 0.8659623, 0, 1, 0.682353, 1,
-0.1499107, 0.2520508, -1.260669, 0, 1, 0.6862745, 1,
-0.1489218, 3.027472, 0.1224788, 0, 1, 0.6941177, 1,
-0.1463541, 1.346204, -0.1809229, 0, 1, 0.7019608, 1,
-0.1451656, -0.1034223, -2.19338, 0, 1, 0.7058824, 1,
-0.1411237, -0.1051779, -2.350692, 0, 1, 0.7137255, 1,
-0.141105, 0.2137559, 0.01671937, 0, 1, 0.7176471, 1,
-0.1386653, -0.07192729, -4.423522, 0, 1, 0.7254902, 1,
-0.1381872, -0.6761173, -1.910859, 0, 1, 0.7294118, 1,
-0.1378512, 0.01947426, -1.514006, 0, 1, 0.7372549, 1,
-0.136323, -2.189405, -3.415012, 0, 1, 0.7411765, 1,
-0.1361357, -0.3166568, -1.714761, 0, 1, 0.7490196, 1,
-0.1357092, 0.4309283, -0.5623742, 0, 1, 0.7529412, 1,
-0.1307917, 1.613307, -0.8827614, 0, 1, 0.7607843, 1,
-0.1298715, -0.1373232, -2.621244, 0, 1, 0.7647059, 1,
-0.1246773, 0.1189433, -0.9796899, 0, 1, 0.772549, 1,
-0.1174715, -1.712664, -1.820575, 0, 1, 0.7764706, 1,
-0.1133716, -0.7498502, -4.075081, 0, 1, 0.7843137, 1,
-0.1104019, -1.927672, -3.385921, 0, 1, 0.7882353, 1,
-0.1070262, -2.385164, -5.051619, 0, 1, 0.7960784, 1,
-0.1070257, -0.4163087, -3.177293, 0, 1, 0.8039216, 1,
-0.1035578, -0.1000122, -2.039853, 0, 1, 0.8078431, 1,
-0.1033513, 1.258415, -1.026999, 0, 1, 0.8156863, 1,
-0.1022702, -0.469521, -2.754227, 0, 1, 0.8196079, 1,
-0.1001352, 1.123755, -0.4930927, 0, 1, 0.827451, 1,
-0.09972232, 1.055598, -0.2264478, 0, 1, 0.8313726, 1,
-0.09121899, 1.254154, -0.2282494, 0, 1, 0.8392157, 1,
-0.08962411, -0.691941, -4.159316, 0, 1, 0.8431373, 1,
-0.08370815, 1.146474, -0.3889886, 0, 1, 0.8509804, 1,
-0.07997228, -0.3877534, -3.237962, 0, 1, 0.854902, 1,
-0.07633375, 0.107868, -0.5604276, 0, 1, 0.8627451, 1,
-0.07274245, 0.881626, 2.064371, 0, 1, 0.8666667, 1,
-0.06760536, 0.6387004, -0.3636877, 0, 1, 0.8745098, 1,
-0.06238469, 0.4291729, 1.023515, 0, 1, 0.8784314, 1,
-0.06088708, 0.1024407, -0.5402232, 0, 1, 0.8862745, 1,
-0.05789376, -0.6190492, -3.995348, 0, 1, 0.8901961, 1,
-0.05623413, -0.2918882, -4.119867, 0, 1, 0.8980392, 1,
-0.05102842, -0.9646788, -3.846713, 0, 1, 0.9058824, 1,
-0.05078457, 1.543213, 0.7883351, 0, 1, 0.9098039, 1,
-0.0506667, 0.4113756, -1.496179, 0, 1, 0.9176471, 1,
-0.04788417, -0.4532035, -3.10515, 0, 1, 0.9215686, 1,
-0.0478518, 0.7113605, -0.5681915, 0, 1, 0.9294118, 1,
-0.0446289, 0.03190181, -1.453035, 0, 1, 0.9333333, 1,
-0.04139852, -0.6670047, -1.533483, 0, 1, 0.9411765, 1,
-0.03785149, 0.4312484, -1.169682, 0, 1, 0.945098, 1,
-0.03351892, -0.9815816, -0.6818547, 0, 1, 0.9529412, 1,
-0.03146333, -0.3229325, -3.329349, 0, 1, 0.9568627, 1,
-0.03121263, -0.3467606, -2.655923, 0, 1, 0.9647059, 1,
-0.02679723, -0.897997, -5.28999, 0, 1, 0.9686275, 1,
-0.02616966, 0.1675018, -0.566682, 0, 1, 0.9764706, 1,
-0.02551266, -1.901856, -2.931575, 0, 1, 0.9803922, 1,
-0.02360472, 0.5068666, -1.416179, 0, 1, 0.9882353, 1,
-0.01888455, 1.38936, -1.118136, 0, 1, 0.9921569, 1,
-0.01839665, 0.9621717, -1.789633, 0, 1, 1, 1,
-0.01813547, 2.109782, 1.861429, 0, 0.9921569, 1, 1,
-0.01552802, -0.9228466, -3.106234, 0, 0.9882353, 1, 1,
-0.01222718, 1.332398, -0.1967766, 0, 0.9803922, 1, 1,
-0.011677, -0.7351654, -3.442926, 0, 0.9764706, 1, 1,
-0.01111117, -1.087095, -1.776527, 0, 0.9686275, 1, 1,
-0.01034525, -0.8851294, -3.206894, 0, 0.9647059, 1, 1,
-0.009313701, -0.1119346, -1.987965, 0, 0.9568627, 1, 1,
-0.005998177, 0.6472512, -0.4896623, 0, 0.9529412, 1, 1,
-0.004775011, -0.3791925, -3.040478, 0, 0.945098, 1, 1,
-0.004230733, -0.2153498, -3.173004, 0, 0.9411765, 1, 1,
-0.0012758, -0.5550983, -5.049382, 0, 0.9333333, 1, 1,
-0.0009117155, -0.8450842, -2.277708, 0, 0.9294118, 1, 1,
5.943534e-05, 1.525925, 0.6906718, 0, 0.9215686, 1, 1,
0.0006987347, -0.9813922, 3.345404, 0, 0.9176471, 1, 1,
0.004897073, -1.591637, 3.600747, 0, 0.9098039, 1, 1,
0.01146089, -0.4235886, 3.908398, 0, 0.9058824, 1, 1,
0.01470088, -0.7807482, 3.210213, 0, 0.8980392, 1, 1,
0.02996066, 0.2318818, 1.030362, 0, 0.8901961, 1, 1,
0.03394618, -2.292659, 3.271107, 0, 0.8862745, 1, 1,
0.03917157, -0.2518227, 1.382482, 0, 0.8784314, 1, 1,
0.03946189, -1.074331, 2.744025, 0, 0.8745098, 1, 1,
0.04363303, 0.7383603, -0.7817631, 0, 0.8666667, 1, 1,
0.04778632, 1.573821, 0.7929245, 0, 0.8627451, 1, 1,
0.04908312, 0.7065026, -1.535332, 0, 0.854902, 1, 1,
0.05439661, 1.004168, 0.1788441, 0, 0.8509804, 1, 1,
0.06250116, 0.4514008, -0.6040478, 0, 0.8431373, 1, 1,
0.06281238, 0.3545241, -0.6094021, 0, 0.8392157, 1, 1,
0.06342591, 0.5984675, 0.7062974, 0, 0.8313726, 1, 1,
0.06598967, 0.4730108, 1.529115, 0, 0.827451, 1, 1,
0.06650078, -0.7201051, 1.405204, 0, 0.8196079, 1, 1,
0.06720039, 1.143082, -0.05882998, 0, 0.8156863, 1, 1,
0.07356879, 2.571446, -0.8954127, 0, 0.8078431, 1, 1,
0.07394469, 0.4436444, 0.9570049, 0, 0.8039216, 1, 1,
0.07874591, 0.9572169, 0.6885189, 0, 0.7960784, 1, 1,
0.07952221, 0.9809896, -0.3095806, 0, 0.7882353, 1, 1,
0.07956218, -1.305881, 2.696557, 0, 0.7843137, 1, 1,
0.08384863, -0.2635899, 3.087511, 0, 0.7764706, 1, 1,
0.0859364, -2.15268, 2.461916, 0, 0.772549, 1, 1,
0.08598698, -0.3823005, 2.69717, 0, 0.7647059, 1, 1,
0.08718368, 0.4809124, -1.81119, 0, 0.7607843, 1, 1,
0.08742174, -1.440135, 1.422613, 0, 0.7529412, 1, 1,
0.09188568, 0.2186602, 2.605961, 0, 0.7490196, 1, 1,
0.09270996, 1.986392, -0.08420987, 0, 0.7411765, 1, 1,
0.09331249, 0.9558842, 0.7749074, 0, 0.7372549, 1, 1,
0.1029072, -0.1480678, 3.565055, 0, 0.7294118, 1, 1,
0.1029777, -2.614671, 2.941382, 0, 0.7254902, 1, 1,
0.1043889, -1.258033, 1.994644, 0, 0.7176471, 1, 1,
0.1045487, 0.651284, -1.65367, 0, 0.7137255, 1, 1,
0.1055295, -0.6989983, 5.148724, 0, 0.7058824, 1, 1,
0.1058104, 1.808821, -0.5530083, 0, 0.6980392, 1, 1,
0.1079934, 0.3278511, 0.3804884, 0, 0.6941177, 1, 1,
0.1094879, -0.8176812, 3.278877, 0, 0.6862745, 1, 1,
0.1128911, 1.017213, 1.718328, 0, 0.682353, 1, 1,
0.1151062, 0.1672983, 0.2743365, 0, 0.6745098, 1, 1,
0.1199432, 0.550858, 1.461465, 0, 0.6705883, 1, 1,
0.1294203, 0.3782235, 0.2490718, 0, 0.6627451, 1, 1,
0.1298567, -0.02677531, 2.280763, 0, 0.6588235, 1, 1,
0.1317993, 0.08557151, 1.064348, 0, 0.6509804, 1, 1,
0.1347585, -0.7788928, 1.51962, 0, 0.6470588, 1, 1,
0.135444, 0.9479669, 0.852777, 0, 0.6392157, 1, 1,
0.1475369, 2.005382, -0.07461433, 0, 0.6352941, 1, 1,
0.1498433, 0.5240133, -0.2876282, 0, 0.627451, 1, 1,
0.1507032, -1.076498, 2.944794, 0, 0.6235294, 1, 1,
0.1558704, -0.8409547, 4.218299, 0, 0.6156863, 1, 1,
0.1564718, -0.009518001, 2.257376, 0, 0.6117647, 1, 1,
0.1568324, -0.2264095, 2.298262, 0, 0.6039216, 1, 1,
0.1570181, -0.2190393, 2.784468, 0, 0.5960785, 1, 1,
0.1591248, 0.1501976, 0.9861686, 0, 0.5921569, 1, 1,
0.1622092, 1.106441, 0.05607124, 0, 0.5843138, 1, 1,
0.1661707, -0.8790225, 3.530013, 0, 0.5803922, 1, 1,
0.1664779, 2.147203, -0.7557044, 0, 0.572549, 1, 1,
0.1670314, 0.2373164, 0.1173671, 0, 0.5686275, 1, 1,
0.1746745, -1.081882, 3.325016, 0, 0.5607843, 1, 1,
0.1774042, 1.992206, 1.572916, 0, 0.5568628, 1, 1,
0.1850659, 1.430226, -0.6986709, 0, 0.5490196, 1, 1,
0.1853625, -0.6960033, 3.989566, 0, 0.5450981, 1, 1,
0.1853817, 1.801214, -0.1417916, 0, 0.5372549, 1, 1,
0.189339, -1.83983, 4.183568, 0, 0.5333334, 1, 1,
0.1926398, 1.039333, -0.471261, 0, 0.5254902, 1, 1,
0.1929582, -1.360164, 1.906816, 0, 0.5215687, 1, 1,
0.2044871, -0.3763869, 3.627807, 0, 0.5137255, 1, 1,
0.2054728, 0.9594175, 0.7775885, 0, 0.509804, 1, 1,
0.2078372, 1.886732, 0.3877362, 0, 0.5019608, 1, 1,
0.2113065, 0.7116536, 2.1901, 0, 0.4941176, 1, 1,
0.2151724, -0.8338184, 2.597555, 0, 0.4901961, 1, 1,
0.2153939, 0.6285229, -0.9372352, 0, 0.4823529, 1, 1,
0.2160659, 0.8140543, 0.5277383, 0, 0.4784314, 1, 1,
0.2174254, 0.4098738, 1.40979, 0, 0.4705882, 1, 1,
0.2235884, -1.768426, 3.419591, 0, 0.4666667, 1, 1,
0.2242008, -0.546975, 3.313788, 0, 0.4588235, 1, 1,
0.2247555, -0.6795937, 3.915533, 0, 0.454902, 1, 1,
0.2286918, -0.6534381, 4.113141, 0, 0.4470588, 1, 1,
0.2287124, 0.1731699, 0.2250243, 0, 0.4431373, 1, 1,
0.230445, -0.7003122, 1.543802, 0, 0.4352941, 1, 1,
0.2343674, 0.5847591, 1.934198, 0, 0.4313726, 1, 1,
0.2345431, 0.8953299, 1.133777, 0, 0.4235294, 1, 1,
0.2360708, 0.8937335, 0.8353351, 0, 0.4196078, 1, 1,
0.2369383, 0.0919422, 0.7154105, 0, 0.4117647, 1, 1,
0.2390519, -0.4340976, 3.36231, 0, 0.4078431, 1, 1,
0.2448819, -0.004986755, -0.3190401, 0, 0.4, 1, 1,
0.2513796, -0.2989536, 2.002428, 0, 0.3921569, 1, 1,
0.2532702, -1.781979, 2.659753, 0, 0.3882353, 1, 1,
0.2579399, -1.303638, 2.193839, 0, 0.3803922, 1, 1,
0.2597938, -1.642147, 4.272756, 0, 0.3764706, 1, 1,
0.2599653, -1.087184, 3.272095, 0, 0.3686275, 1, 1,
0.2646592, 0.3412066, -0.2127957, 0, 0.3647059, 1, 1,
0.265903, 0.3419713, -0.2215488, 0, 0.3568628, 1, 1,
0.2669946, -1.022183, 3.49171, 0, 0.3529412, 1, 1,
0.2711371, -0.9642293, 2.049258, 0, 0.345098, 1, 1,
0.2739372, 0.518431, 1.072851, 0, 0.3411765, 1, 1,
0.2749571, -2.567369, 1.882276, 0, 0.3333333, 1, 1,
0.2778631, -1.851475, 2.999683, 0, 0.3294118, 1, 1,
0.2787634, 0.1567014, 2.700515, 0, 0.3215686, 1, 1,
0.2817599, -0.2157029, 2.14567, 0, 0.3176471, 1, 1,
0.2818455, -0.1102109, 1.112106, 0, 0.3098039, 1, 1,
0.2856449, 1.239859, 0.3761697, 0, 0.3058824, 1, 1,
0.2899977, -0.9488825, 2.299853, 0, 0.2980392, 1, 1,
0.2913933, -1.114818, 2.997685, 0, 0.2901961, 1, 1,
0.305063, -1.715864, 3.847797, 0, 0.2862745, 1, 1,
0.3083383, -0.04460136, 1.607428, 0, 0.2784314, 1, 1,
0.3123447, -1.916433, 3.124921, 0, 0.2745098, 1, 1,
0.3143259, 0.6019969, 1.931618, 0, 0.2666667, 1, 1,
0.3157492, 0.8056555, 0.9344037, 0, 0.2627451, 1, 1,
0.315875, 1.885497, 0.4651216, 0, 0.254902, 1, 1,
0.3210904, -0.3961596, 4.120436, 0, 0.2509804, 1, 1,
0.3228461, 0.3564497, 0.2423742, 0, 0.2431373, 1, 1,
0.3273195, -0.4877396, 0.9019873, 0, 0.2392157, 1, 1,
0.3282317, 0.9955164, 1.348099, 0, 0.2313726, 1, 1,
0.3289776, -0.4332629, 0.6857684, 0, 0.227451, 1, 1,
0.3301035, -1.999777, 3.152445, 0, 0.2196078, 1, 1,
0.332732, -1.214967, 2.984574, 0, 0.2156863, 1, 1,
0.3338636, -0.7984522, 2.664119, 0, 0.2078431, 1, 1,
0.3344482, -1.72206, 3.294163, 0, 0.2039216, 1, 1,
0.3361684, -0.5107694, 1.438216, 0, 0.1960784, 1, 1,
0.336736, -0.9745595, 2.209985, 0, 0.1882353, 1, 1,
0.3368869, -1.943881, 2.107785, 0, 0.1843137, 1, 1,
0.3394244, 0.5694689, -0.9284036, 0, 0.1764706, 1, 1,
0.339815, 0.0009157759, 1.619065, 0, 0.172549, 1, 1,
0.3462163, -1.097616, 2.574733, 0, 0.1647059, 1, 1,
0.3513971, 0.1497084, -0.4386938, 0, 0.1607843, 1, 1,
0.3566738, 1.371811, -0.1471551, 0, 0.1529412, 1, 1,
0.3587084, -0.1533594, 1.362716, 0, 0.1490196, 1, 1,
0.3606113, -0.8193821, 0.2872989, 0, 0.1411765, 1, 1,
0.3611775, -2.160333, 3.514797, 0, 0.1372549, 1, 1,
0.3612322, -0.6009465, 1.3181, 0, 0.1294118, 1, 1,
0.3654562, -0.5493335, 3.799861, 0, 0.1254902, 1, 1,
0.367052, -0.6778769, 1.625913, 0, 0.1176471, 1, 1,
0.3749212, -0.1339116, 1.768552, 0, 0.1137255, 1, 1,
0.3764236, -0.233345, 2.751926, 0, 0.1058824, 1, 1,
0.3775258, 0.8491176, 0.9321417, 0, 0.09803922, 1, 1,
0.3824183, 1.22787, 1.481644, 0, 0.09411765, 1, 1,
0.3866197, -0.08329143, 1.371187, 0, 0.08627451, 1, 1,
0.4011705, 0.9447811, 1.974526, 0, 0.08235294, 1, 1,
0.4020094, 0.002661336, 1.124742, 0, 0.07450981, 1, 1,
0.4046573, -0.205457, 0.4794001, 0, 0.07058824, 1, 1,
0.4139407, -0.2478298, 3.83365, 0, 0.0627451, 1, 1,
0.4163246, 0.2876587, 2.295728, 0, 0.05882353, 1, 1,
0.4165705, 0.9036365, 1.252767, 0, 0.05098039, 1, 1,
0.417229, 0.439079, 0.7481185, 0, 0.04705882, 1, 1,
0.4173826, 1.638827, -1.001264, 0, 0.03921569, 1, 1,
0.4182312, -0.3958753, 3.222743, 0, 0.03529412, 1, 1,
0.4189665, -0.563089, 2.623435, 0, 0.02745098, 1, 1,
0.4212363, 0.9245807, 2.27389, 0, 0.02352941, 1, 1,
0.4229566, 0.08692414, 1.600798, 0, 0.01568628, 1, 1,
0.4252091, -0.01049092, 1.27931, 0, 0.01176471, 1, 1,
0.4268612, -0.4502957, 2.043255, 0, 0.003921569, 1, 1,
0.4286488, 0.955834, 0.2691767, 0.003921569, 0, 1, 1,
0.4299653, -1.396584, 2.393912, 0.007843138, 0, 1, 1,
0.4330425, 1.143167, 1.908582, 0.01568628, 0, 1, 1,
0.4348484, 0.7160432, 0.2392025, 0.01960784, 0, 1, 1,
0.4378224, -1.546923, 3.65035, 0.02745098, 0, 1, 1,
0.4454503, -0.1132282, 2.785743, 0.03137255, 0, 1, 1,
0.4479303, -0.08217838, 2.515445, 0.03921569, 0, 1, 1,
0.4486052, -0.5301446, 2.842518, 0.04313726, 0, 1, 1,
0.4491536, 1.507048, -1.33831, 0.05098039, 0, 1, 1,
0.4503758, -0.1519385, 2.629234, 0.05490196, 0, 1, 1,
0.4535404, -1.056816, 3.8134, 0.0627451, 0, 1, 1,
0.4536365, 0.1783656, 1.756071, 0.06666667, 0, 1, 1,
0.4585297, 0.08593416, 0.8207334, 0.07450981, 0, 1, 1,
0.4604853, -0.3079884, 3.293138, 0.07843138, 0, 1, 1,
0.4636673, 0.6228102, 0.1818446, 0.08627451, 0, 1, 1,
0.4647002, -0.1285567, 3.110396, 0.09019608, 0, 1, 1,
0.4667888, 0.8013474, 1.337392, 0.09803922, 0, 1, 1,
0.4685878, -2.007954, 4.537923, 0.1058824, 0, 1, 1,
0.4716736, -0.665749, 2.638013, 0.1098039, 0, 1, 1,
0.4720055, 1.031426, 0.8300261, 0.1176471, 0, 1, 1,
0.4777372, 0.1362753, 1.077432, 0.1215686, 0, 1, 1,
0.4781132, -1.005303, 2.289232, 0.1294118, 0, 1, 1,
0.4833558, -0.1670223, 2.95983, 0.1333333, 0, 1, 1,
0.4873312, 2.273542, -0.2376451, 0.1411765, 0, 1, 1,
0.4921151, 0.1040068, 1.403977, 0.145098, 0, 1, 1,
0.5102709, 0.4152676, 1.561901, 0.1529412, 0, 1, 1,
0.5103146, 0.6601185, -0.1451696, 0.1568628, 0, 1, 1,
0.5109344, 0.1707075, -0.7322329, 0.1647059, 0, 1, 1,
0.5118954, 1.365528, 1.953783, 0.1686275, 0, 1, 1,
0.5185226, 0.2326888, 0.9545235, 0.1764706, 0, 1, 1,
0.5249173, -0.06075484, 0.3289674, 0.1803922, 0, 1, 1,
0.5251804, -0.9237115, 0.9608049, 0.1882353, 0, 1, 1,
0.5282879, 0.07067022, -0.2123631, 0.1921569, 0, 1, 1,
0.5293013, -0.3805743, 2.647359, 0.2, 0, 1, 1,
0.5347573, -0.3081713, 2.89566, 0.2078431, 0, 1, 1,
0.537653, 0.06299885, 1.13054, 0.2117647, 0, 1, 1,
0.5396266, -0.07968607, 1.390675, 0.2196078, 0, 1, 1,
0.5452886, -1.502849, 2.742871, 0.2235294, 0, 1, 1,
0.548289, -0.7035628, 2.459001, 0.2313726, 0, 1, 1,
0.5488378, -2.26218, 4.223114, 0.2352941, 0, 1, 1,
0.5489998, -0.2420368, 3.107567, 0.2431373, 0, 1, 1,
0.5510152, 0.1885993, 0.9575909, 0.2470588, 0, 1, 1,
0.5568751, 0.04179474, 3.375437, 0.254902, 0, 1, 1,
0.5627356, 0.4516176, 0.9247078, 0.2588235, 0, 1, 1,
0.5694422, -0.3043568, 1.438676, 0.2666667, 0, 1, 1,
0.5702674, -0.3191077, 1.151275, 0.2705882, 0, 1, 1,
0.5712429, -0.1242264, 2.342753, 0.2784314, 0, 1, 1,
0.5713583, -0.1235994, 0.6813737, 0.282353, 0, 1, 1,
0.5719282, -0.3495711, 2.098606, 0.2901961, 0, 1, 1,
0.576418, -0.306923, 1.793979, 0.2941177, 0, 1, 1,
0.5772404, 1.669271, -0.5326507, 0.3019608, 0, 1, 1,
0.5775005, 0.7720312, -0.1894483, 0.3098039, 0, 1, 1,
0.5801853, 1.648975, 0.926514, 0.3137255, 0, 1, 1,
0.5855442, 0.1784663, 1.615014, 0.3215686, 0, 1, 1,
0.5907557, -0.8364932, 2.789306, 0.3254902, 0, 1, 1,
0.5954962, -0.7334771, 1.174279, 0.3333333, 0, 1, 1,
0.5999389, -1.613259, 3.331146, 0.3372549, 0, 1, 1,
0.6012464, -2.004972, 3.637694, 0.345098, 0, 1, 1,
0.6087485, 0.2673503, 1.87395, 0.3490196, 0, 1, 1,
0.6096427, 0.01212675, 1.745775, 0.3568628, 0, 1, 1,
0.6206919, 2.051524, 0.1843917, 0.3607843, 0, 1, 1,
0.6219926, -1.233484, 2.785468, 0.3686275, 0, 1, 1,
0.6285084, 0.1212065, 1.536192, 0.372549, 0, 1, 1,
0.6290691, 0.2848476, 2.03145, 0.3803922, 0, 1, 1,
0.6301588, -0.007923653, 3.159878, 0.3843137, 0, 1, 1,
0.6347852, 1.071196, 0.9453002, 0.3921569, 0, 1, 1,
0.6373416, 0.4088255, 0.6634623, 0.3960784, 0, 1, 1,
0.6427565, -0.935361, 3.107981, 0.4039216, 0, 1, 1,
0.6515425, 0.04720841, 0.5095852, 0.4117647, 0, 1, 1,
0.6550369, 1.252362, 1.265605, 0.4156863, 0, 1, 1,
0.6566861, 0.7692571, 1.972517, 0.4235294, 0, 1, 1,
0.658215, -0.2238476, -0.6373792, 0.427451, 0, 1, 1,
0.6585357, 0.5398836, 1.706571, 0.4352941, 0, 1, 1,
0.6587051, 0.9359915, 0.3759783, 0.4392157, 0, 1, 1,
0.6610748, 0.7093279, 1.440257, 0.4470588, 0, 1, 1,
0.6645119, 0.7316284, 0.06923857, 0.4509804, 0, 1, 1,
0.6651437, -0.4809363, 0.7700718, 0.4588235, 0, 1, 1,
0.6706396, 1.038012, 2.088039, 0.4627451, 0, 1, 1,
0.6713539, 0.2072166, 0.8417232, 0.4705882, 0, 1, 1,
0.6730218, 0.2554362, 1.33228, 0.4745098, 0, 1, 1,
0.674977, -0.3593987, 0.9327531, 0.4823529, 0, 1, 1,
0.6752433, 0.5528048, 0.1807322, 0.4862745, 0, 1, 1,
0.6819318, 0.192593, 1.16293, 0.4941176, 0, 1, 1,
0.6850898, -0.2120863, 1.549015, 0.5019608, 0, 1, 1,
0.6860707, 0.2168286, 1.394951, 0.5058824, 0, 1, 1,
0.6866069, -0.4861363, 2.077643, 0.5137255, 0, 1, 1,
0.6880189, 1.068332, 1.095745, 0.5176471, 0, 1, 1,
0.6915773, -2.753824, 2.235645, 0.5254902, 0, 1, 1,
0.6934813, -0.5382503, 3.404854, 0.5294118, 0, 1, 1,
0.695245, 0.05179792, 0.9750301, 0.5372549, 0, 1, 1,
0.696613, 0.08559314, 1.33912, 0.5411765, 0, 1, 1,
0.7042154, 2.487141, 0.8173176, 0.5490196, 0, 1, 1,
0.711789, 1.612062, -0.3439495, 0.5529412, 0, 1, 1,
0.7140561, 1.05831, 1.944794, 0.5607843, 0, 1, 1,
0.7177613, -0.1022699, 1.906698, 0.5647059, 0, 1, 1,
0.7183035, -0.5005235, 2.047772, 0.572549, 0, 1, 1,
0.7323232, -0.1407903, 2.093441, 0.5764706, 0, 1, 1,
0.7332028, 0.6607445, 0.1956035, 0.5843138, 0, 1, 1,
0.7360317, 1.864609, 0.3213253, 0.5882353, 0, 1, 1,
0.7372999, -0.9730328, 2.667484, 0.5960785, 0, 1, 1,
0.7379409, -1.402615, 2.648931, 0.6039216, 0, 1, 1,
0.7424437, 0.7261307, 1.639015, 0.6078432, 0, 1, 1,
0.74542, -0.9244469, 2.119276, 0.6156863, 0, 1, 1,
0.7462665, -0.9128928, 1.065341, 0.6196079, 0, 1, 1,
0.752413, -0.4131655, 3.667308, 0.627451, 0, 1, 1,
0.7576444, -2.040138, 1.392061, 0.6313726, 0, 1, 1,
0.7606409, -0.4841725, 0.5942267, 0.6392157, 0, 1, 1,
0.7621996, 0.2304421, 0.7075481, 0.6431373, 0, 1, 1,
0.7641925, 0.03476264, 1.449616, 0.6509804, 0, 1, 1,
0.7675313, 0.195076, 0.3436528, 0.654902, 0, 1, 1,
0.7721993, -0.5563398, 1.005002, 0.6627451, 0, 1, 1,
0.7734954, 0.07801255, 3.429124, 0.6666667, 0, 1, 1,
0.7759298, -2.437824, 1.907135, 0.6745098, 0, 1, 1,
0.7792856, 0.2468433, 1.228124, 0.6784314, 0, 1, 1,
0.7810678, 0.3698373, 1.292357, 0.6862745, 0, 1, 1,
0.7811449, 0.7643639, 1.745406, 0.6901961, 0, 1, 1,
0.7816618, 0.04592156, 1.810625, 0.6980392, 0, 1, 1,
0.7859535, 0.1770237, 1.017236, 0.7058824, 0, 1, 1,
0.7865929, -0.006089781, -0.6273441, 0.7098039, 0, 1, 1,
0.7876659, 1.091419, 0.5517468, 0.7176471, 0, 1, 1,
0.7953424, -0.9110264, 1.78599, 0.7215686, 0, 1, 1,
0.7955391, -0.3274305, 1.549546, 0.7294118, 0, 1, 1,
0.8026841, 1.039095, 0.6875101, 0.7333333, 0, 1, 1,
0.8064302, 1.102504, 1.695564, 0.7411765, 0, 1, 1,
0.8068289, -0.1360566, 2.093518, 0.7450981, 0, 1, 1,
0.8094666, -0.1340588, 2.016964, 0.7529412, 0, 1, 1,
0.8163152, -0.9220564, 3.852769, 0.7568628, 0, 1, 1,
0.8167688, 0.06580091, 1.623212, 0.7647059, 0, 1, 1,
0.817014, 0.1801582, 0.137811, 0.7686275, 0, 1, 1,
0.8235791, 1.049564, 2.26423, 0.7764706, 0, 1, 1,
0.8237571, -0.1842475, 1.277255, 0.7803922, 0, 1, 1,
0.8284332, -1.306638, 0.5073161, 0.7882353, 0, 1, 1,
0.8294166, 0.4464412, 1.007541, 0.7921569, 0, 1, 1,
0.8337423, 0.4560038, 1.586144, 0.8, 0, 1, 1,
0.8449975, -1.103845, 1.343918, 0.8078431, 0, 1, 1,
0.8498994, 0.4520127, 0.5460974, 0.8117647, 0, 1, 1,
0.852453, 0.1999765, 0.3422378, 0.8196079, 0, 1, 1,
0.8557456, 0.14646, 0.3080644, 0.8235294, 0, 1, 1,
0.8563161, -1.558985, 3.707355, 0.8313726, 0, 1, 1,
0.8566539, 2.455067, 0.5452373, 0.8352941, 0, 1, 1,
0.8581173, -0.1839167, 1.262915, 0.8431373, 0, 1, 1,
0.8611772, -1.277712, 0.2932478, 0.8470588, 0, 1, 1,
0.8624189, 0.4177247, 1.893052, 0.854902, 0, 1, 1,
0.8769397, -0.3753963, 2.895062, 0.8588235, 0, 1, 1,
0.8777938, 0.7726138, -0.3146356, 0.8666667, 0, 1, 1,
0.8789051, 1.153712, 1.012031, 0.8705882, 0, 1, 1,
0.8866798, -0.1346538, 1.059428, 0.8784314, 0, 1, 1,
0.8924815, -0.04517858, 2.241608, 0.8823529, 0, 1, 1,
0.8954065, -0.4687396, 0.1693661, 0.8901961, 0, 1, 1,
0.8957173, -0.3046344, 0.7497216, 0.8941177, 0, 1, 1,
0.899501, -0.8021163, 1.92368, 0.9019608, 0, 1, 1,
0.8999556, -2.749177, 2.864997, 0.9098039, 0, 1, 1,
0.9051868, 0.05221459, 0.06816877, 0.9137255, 0, 1, 1,
0.9053907, -0.09356022, 3.102631, 0.9215686, 0, 1, 1,
0.9103719, 0.03089263, 1.80877, 0.9254902, 0, 1, 1,
0.9158887, 1.019946, -1.210932, 0.9333333, 0, 1, 1,
0.9186288, -0.4549474, 2.475445, 0.9372549, 0, 1, 1,
0.9209304, -2.286322, 4.170975, 0.945098, 0, 1, 1,
0.9261373, -1.517382, 3.713187, 0.9490196, 0, 1, 1,
0.9311273, 2.053287, 0.9695728, 0.9568627, 0, 1, 1,
0.9342177, 0.1415317, 0.02503789, 0.9607843, 0, 1, 1,
0.9374923, -1.562776, 2.069857, 0.9686275, 0, 1, 1,
0.9412222, 0.8121256, 2.535084, 0.972549, 0, 1, 1,
0.9438791, 0.267295, 2.044631, 0.9803922, 0, 1, 1,
0.9474525, 0.05532332, 1.643987, 0.9843137, 0, 1, 1,
0.9475276, 1.022882, 1.233919, 0.9921569, 0, 1, 1,
0.9485399, 1.943083, 0.4347573, 0.9960784, 0, 1, 1,
0.9489538, 0.5087691, 0.6555963, 1, 0, 0.9960784, 1,
0.9498275, -0.3911885, 2.274833, 1, 0, 0.9882353, 1,
0.9502369, 0.1010747, 1.132731, 1, 0, 0.9843137, 1,
0.9654884, -0.24475, 2.013153, 1, 0, 0.9764706, 1,
0.9665007, -0.2383252, 1.394767, 1, 0, 0.972549, 1,
0.9709124, -0.9837616, 2.795141, 1, 0, 0.9647059, 1,
0.9714015, -0.2972572, 1.017592, 1, 0, 0.9607843, 1,
0.9733421, -1.971429, 2.235093, 1, 0, 0.9529412, 1,
0.9821854, -0.7179792, 2.810327, 1, 0, 0.9490196, 1,
0.9846365, -0.2132858, 1.120355, 1, 0, 0.9411765, 1,
0.9869334, -1.976348, 3.213728, 1, 0, 0.9372549, 1,
0.9910228, 1.044763, 0.4500905, 1, 0, 0.9294118, 1,
0.9914261, -0.669063, 3.831894, 1, 0, 0.9254902, 1,
0.9936962, 0.7198514, -0.6052527, 1, 0, 0.9176471, 1,
0.9958952, -1.400246, 4.607593, 1, 0, 0.9137255, 1,
0.9967562, -0.5614495, 2.233566, 1, 0, 0.9058824, 1,
1.018569, -0.1585243, 0.8514134, 1, 0, 0.9019608, 1,
1.019295, 0.7131519, 1.34431, 1, 0, 0.8941177, 1,
1.024593, 0.6596174, -0.9233989, 1, 0, 0.8862745, 1,
1.025693, 0.9274588, 1.192979, 1, 0, 0.8823529, 1,
1.034031, -0.1721507, 0.54898, 1, 0, 0.8745098, 1,
1.036592, -1.503316, 1.251845, 1, 0, 0.8705882, 1,
1.038198, 1.010182, 1.169976, 1, 0, 0.8627451, 1,
1.039156, -1.408301, 3.235733, 1, 0, 0.8588235, 1,
1.039545, 0.6793206, -0.1378749, 1, 0, 0.8509804, 1,
1.041228, -0.8104532, 3.624251, 1, 0, 0.8470588, 1,
1.046797, 1.453077, 1.030205, 1, 0, 0.8392157, 1,
1.046979, 0.8529819, 1.32448, 1, 0, 0.8352941, 1,
1.047129, -1.814449, 3.312163, 1, 0, 0.827451, 1,
1.05958, 0.438668, 1.496047, 1, 0, 0.8235294, 1,
1.060924, 1.816904, 1.281241, 1, 0, 0.8156863, 1,
1.067818, 0.7391723, -0.5349789, 1, 0, 0.8117647, 1,
1.074858, -1.638255, 3.585038, 1, 0, 0.8039216, 1,
1.07564, 1.06223, 1.54629, 1, 0, 0.7960784, 1,
1.078073, 0.625169, 1.141831, 1, 0, 0.7921569, 1,
1.07816, 0.3452957, 1.373715, 1, 0, 0.7843137, 1,
1.079501, -1.011983, 3.377818, 1, 0, 0.7803922, 1,
1.094366, -0.3653111, 1.243168, 1, 0, 0.772549, 1,
1.09646, 0.08519349, 2.30634, 1, 0, 0.7686275, 1,
1.097992, 1.177661, 0.1789166, 1, 0, 0.7607843, 1,
1.103818, 0.1518817, 0.2931964, 1, 0, 0.7568628, 1,
1.106377, 3.572307, 0.06600048, 1, 0, 0.7490196, 1,
1.114214, -1.410404, 2.47654, 1, 0, 0.7450981, 1,
1.114682, 0.2454726, 0.2710944, 1, 0, 0.7372549, 1,
1.117118, -0.2674231, 1.15941, 1, 0, 0.7333333, 1,
1.123129, 0.206262, 1.702516, 1, 0, 0.7254902, 1,
1.125451, -0.8269812, 3.489968, 1, 0, 0.7215686, 1,
1.127764, 0.1785343, 1.733565, 1, 0, 0.7137255, 1,
1.130131, -0.4904945, 2.019716, 1, 0, 0.7098039, 1,
1.131217, 0.3612149, 1.074937, 1, 0, 0.7019608, 1,
1.134706, -0.02593986, 1.604409, 1, 0, 0.6941177, 1,
1.141409, -0.3903616, 2.47543, 1, 0, 0.6901961, 1,
1.143596, -0.4861919, 3.158657, 1, 0, 0.682353, 1,
1.163572, -2.295323, 2.582049, 1, 0, 0.6784314, 1,
1.17712, 1.512541, 0.1763077, 1, 0, 0.6705883, 1,
1.1801, -1.296692, 2.711292, 1, 0, 0.6666667, 1,
1.182763, -0.3915497, 2.589425, 1, 0, 0.6588235, 1,
1.183024, 1.690968, 1.223317, 1, 0, 0.654902, 1,
1.183657, 0.1155984, 2.427461, 1, 0, 0.6470588, 1,
1.199003, 0.3524568, 2.310462, 1, 0, 0.6431373, 1,
1.20293, -1.283223, 1.366568, 1, 0, 0.6352941, 1,
1.213007, -0.9824711, 2.077432, 1, 0, 0.6313726, 1,
1.214623, 0.004265124, 0.6346899, 1, 0, 0.6235294, 1,
1.215304, 0.6060086, 1.598276, 1, 0, 0.6196079, 1,
1.215692, 0.07869091, 0.1765482, 1, 0, 0.6117647, 1,
1.225129, 1.685971, 1.446924, 1, 0, 0.6078432, 1,
1.227147, 0.759311, 1.330489, 1, 0, 0.6, 1,
1.239145, 0.3038249, 0.5233735, 1, 0, 0.5921569, 1,
1.24954, 0.6671928, 2.10398, 1, 0, 0.5882353, 1,
1.253349, 0.6198258, -0.2214858, 1, 0, 0.5803922, 1,
1.257136, -0.3363502, 0.2393371, 1, 0, 0.5764706, 1,
1.291363, 0.5418099, 0.1946519, 1, 0, 0.5686275, 1,
1.302066, 0.5321605, 2.450738, 1, 0, 0.5647059, 1,
1.303367, 0.7365906, 2.855759, 1, 0, 0.5568628, 1,
1.312619, -0.1796482, 2.915484, 1, 0, 0.5529412, 1,
1.316488, 0.2003648, 3.525506, 1, 0, 0.5450981, 1,
1.323496, 0.7945181, 1.746121, 1, 0, 0.5411765, 1,
1.326862, 0.5963934, -0.2664565, 1, 0, 0.5333334, 1,
1.333237, -1.282455, 3.324698, 1, 0, 0.5294118, 1,
1.33449, -1.593091, 2.301921, 1, 0, 0.5215687, 1,
1.33478, 0.5431228, 2.20084, 1, 0, 0.5176471, 1,
1.33482, -0.5222078, 1.476787, 1, 0, 0.509804, 1,
1.335107, -0.6576027, -0.4184695, 1, 0, 0.5058824, 1,
1.360447, 1.513948, -0.1488287, 1, 0, 0.4980392, 1,
1.368556, 0.05362178, 1.523655, 1, 0, 0.4901961, 1,
1.37427, 0.002789323, 1.369046, 1, 0, 0.4862745, 1,
1.377607, -0.4887219, 2.413178, 1, 0, 0.4784314, 1,
1.394752, 1.927866, -2.002551, 1, 0, 0.4745098, 1,
1.399571, -0.2391428, -0.3276005, 1, 0, 0.4666667, 1,
1.404162, -1.337234, 0.3414389, 1, 0, 0.4627451, 1,
1.406183, -0.3018663, 2.236344, 1, 0, 0.454902, 1,
1.406193, -0.005301271, 1.44307, 1, 0, 0.4509804, 1,
1.411658, 0.1687989, 3.038701, 1, 0, 0.4431373, 1,
1.420908, 1.54952, -1.311275, 1, 0, 0.4392157, 1,
1.422071, -0.2870713, 1.455456, 1, 0, 0.4313726, 1,
1.430251, -1.798362, 1.951017, 1, 0, 0.427451, 1,
1.431937, 0.9093493, 2.875511, 1, 0, 0.4196078, 1,
1.445303, 0.8573691, 1.321888, 1, 0, 0.4156863, 1,
1.447521, -0.3978107, 2.055103, 1, 0, 0.4078431, 1,
1.456822, 0.3849335, 2.006237, 1, 0, 0.4039216, 1,
1.467114, -0.180072, 0.6376556, 1, 0, 0.3960784, 1,
1.492644, 0.3196979, 2.659509, 1, 0, 0.3882353, 1,
1.500957, -2.359589, 3.423401, 1, 0, 0.3843137, 1,
1.507837, 1.117972, 1.084058, 1, 0, 0.3764706, 1,
1.51635, 0.9458097, 1.364537, 1, 0, 0.372549, 1,
1.534131, 1.078707, 1.678388, 1, 0, 0.3647059, 1,
1.535416, -0.5274493, 2.016297, 1, 0, 0.3607843, 1,
1.550422, 1.142943, 2.714779, 1, 0, 0.3529412, 1,
1.565487, 0.1548326, 2.537568, 1, 0, 0.3490196, 1,
1.568292, -0.4706569, 2.369649, 1, 0, 0.3411765, 1,
1.5949, 0.7473128, 0.207013, 1, 0, 0.3372549, 1,
1.597603, -1.18426, 1.013091, 1, 0, 0.3294118, 1,
1.610658, -0.4693728, 1.94955, 1, 0, 0.3254902, 1,
1.637449, 0.4281342, 1.575104, 1, 0, 0.3176471, 1,
1.641476, 0.6418497, 0.8239047, 1, 0, 0.3137255, 1,
1.647982, -0.7983479, 1.109779, 1, 0, 0.3058824, 1,
1.654796, -0.3076842, 0.3115094, 1, 0, 0.2980392, 1,
1.67228, -2.418936, 2.538187, 1, 0, 0.2941177, 1,
1.682227, 0.4301071, 0.2281469, 1, 0, 0.2862745, 1,
1.682944, 1.560798, 0.1909081, 1, 0, 0.282353, 1,
1.699224, 1.872638, 0.4263479, 1, 0, 0.2745098, 1,
1.709612, 0.1641875, 1.10885, 1, 0, 0.2705882, 1,
1.719985, -1.518864, 3.358641, 1, 0, 0.2627451, 1,
1.721378, -1.064472, 3.252631, 1, 0, 0.2588235, 1,
1.723875, 1.669144, 1.889454, 1, 0, 0.2509804, 1,
1.737067, -0.5709416, 1.871453, 1, 0, 0.2470588, 1,
1.749427, 0.12174, 1.745802, 1, 0, 0.2392157, 1,
1.766328, -0.02522187, 0.4009342, 1, 0, 0.2352941, 1,
1.768853, 1.044056, 2.090251, 1, 0, 0.227451, 1,
1.802822, 0.1425725, 1.897657, 1, 0, 0.2235294, 1,
1.810984, 1.54045, 1.229149, 1, 0, 0.2156863, 1,
1.811939, -0.7556262, 3.162879, 1, 0, 0.2117647, 1,
1.82432, 0.102625, 1.078857, 1, 0, 0.2039216, 1,
1.824866, -1.026974, 1.726914, 1, 0, 0.1960784, 1,
1.851197, 0.7948417, -0.03574926, 1, 0, 0.1921569, 1,
1.875188, -1.033668, 1.404506, 1, 0, 0.1843137, 1,
1.891788, 0.7500507, 1.022821, 1, 0, 0.1803922, 1,
1.909986, -1.16749, 1.440609, 1, 0, 0.172549, 1,
1.935078, -1.530495, 1.804611, 1, 0, 0.1686275, 1,
1.941478, 1.023507, 0.01417109, 1, 0, 0.1607843, 1,
1.949305, 0.2364607, 0.2521175, 1, 0, 0.1568628, 1,
1.95114, 1.164858, 2.952644, 1, 0, 0.1490196, 1,
1.983978, 0.2814625, 1.613856, 1, 0, 0.145098, 1,
2.038656, 0.01626498, 0.7370425, 1, 0, 0.1372549, 1,
2.05794, -0.3163742, 0.685229, 1, 0, 0.1333333, 1,
2.069447, -0.3645364, 0.9230561, 1, 0, 0.1254902, 1,
2.11872, 1.682516, 1.688523, 1, 0, 0.1215686, 1,
2.127244, -1.682934, 2.783763, 1, 0, 0.1137255, 1,
2.173626, -1.183151, 0.637136, 1, 0, 0.1098039, 1,
2.189443, -0.7654255, 0.6833971, 1, 0, 0.1019608, 1,
2.224548, 0.8718497, 1.587167, 1, 0, 0.09411765, 1,
2.23436, -0.2114683, 1.325209, 1, 0, 0.09019608, 1,
2.247211, 1.652862, 1.125223, 1, 0, 0.08235294, 1,
2.261836, -0.4805537, 2.236891, 1, 0, 0.07843138, 1,
2.272285, 0.8122955, -0.1872554, 1, 0, 0.07058824, 1,
2.290902, -0.4554453, 1.864447, 1, 0, 0.06666667, 1,
2.312704, 0.6243126, 2.609504, 1, 0, 0.05882353, 1,
2.316671, -1.893652, 2.694053, 1, 0, 0.05490196, 1,
2.330182, 2.075897, 0.574064, 1, 0, 0.04705882, 1,
2.396209, 0.7145464, 0.1288507, 1, 0, 0.04313726, 1,
2.457351, 0.7934232, 1.63885, 1, 0, 0.03529412, 1,
2.794965, -0.5931977, 3.222612, 1, 0, 0.03137255, 1,
2.81598, -0.4980508, 2.648407, 1, 0, 0.02352941, 1,
2.822139, 0.4436012, 0.6836241, 1, 0, 0.01960784, 1,
2.830636, -0.07523664, 0.7624781, 1, 0, 0.01176471, 1,
3.312325, 0.5684563, 1.98008, 1, 0, 0.007843138, 1
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
0.1733397, -3.826104, -7.558413, 0, -0.5, 0.5, 0.5,
0.1733397, -3.826104, -7.558413, 1, -0.5, 0.5, 0.5,
0.1733397, -3.826104, -7.558413, 1, 1.5, 0.5, 0.5,
0.1733397, -3.826104, -7.558413, 0, 1.5, 0.5, 0.5
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
-4.029762, 0.4092411, -7.558413, 0, -0.5, 0.5, 0.5,
-4.029762, 0.4092411, -7.558413, 1, -0.5, 0.5, 0.5,
-4.029762, 0.4092411, -7.558413, 1, 1.5, 0.5, 0.5,
-4.029762, 0.4092411, -7.558413, 0, 1.5, 0.5, 0.5
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
-4.029762, -3.826104, -0.2839978, 0, -0.5, 0.5, 0.5,
-4.029762, -3.826104, -0.2839978, 1, -0.5, 0.5, 0.5,
-4.029762, -3.826104, -0.2839978, 1, 1.5, 0.5, 0.5,
-4.029762, -3.826104, -0.2839978, 0, 1.5, 0.5, 0.5
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
-2, -2.848716, -5.879701,
3, -2.848716, -5.879701,
-2, -2.848716, -5.879701,
-2, -3.011614, -6.159486,
-1, -2.848716, -5.879701,
-1, -3.011614, -6.159486,
0, -2.848716, -5.879701,
0, -3.011614, -6.159486,
1, -2.848716, -5.879701,
1, -3.011614, -6.159486,
2, -2.848716, -5.879701,
2, -3.011614, -6.159486,
3, -2.848716, -5.879701,
3, -3.011614, -6.159486
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
-2, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
-2, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
-2, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
-2, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5,
-1, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
-1, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
-1, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
-1, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5,
0, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
0, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
0, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
0, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5,
1, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
1, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
1, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
1, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5,
2, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
2, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
2, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
2, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5,
3, -3.33741, -6.719057, 0, -0.5, 0.5, 0.5,
3, -3.33741, -6.719057, 1, -0.5, 0.5, 0.5,
3, -3.33741, -6.719057, 1, 1.5, 0.5, 0.5,
3, -3.33741, -6.719057, 0, 1.5, 0.5, 0.5
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
-3.059816, -2, -5.879701,
-3.059816, 3, -5.879701,
-3.059816, -2, -5.879701,
-3.221473, -2, -6.159486,
-3.059816, -1, -5.879701,
-3.221473, -1, -6.159486,
-3.059816, 0, -5.879701,
-3.221473, 0, -6.159486,
-3.059816, 1, -5.879701,
-3.221473, 1, -6.159486,
-3.059816, 2, -5.879701,
-3.221473, 2, -6.159486,
-3.059816, 3, -5.879701,
-3.221473, 3, -6.159486
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
-3.544789, -2, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, -2, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, -2, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, -2, -6.719057, 0, 1.5, 0.5, 0.5,
-3.544789, -1, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, -1, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, -1, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, -1, -6.719057, 0, 1.5, 0.5, 0.5,
-3.544789, 0, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, 0, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, 0, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, 0, -6.719057, 0, 1.5, 0.5, 0.5,
-3.544789, 1, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, 1, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, 1, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, 1, -6.719057, 0, 1.5, 0.5, 0.5,
-3.544789, 2, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, 2, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, 2, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, 2, -6.719057, 0, 1.5, 0.5, 0.5,
-3.544789, 3, -6.719057, 0, -0.5, 0.5, 0.5,
-3.544789, 3, -6.719057, 1, -0.5, 0.5, 0.5,
-3.544789, 3, -6.719057, 1, 1.5, 0.5, 0.5,
-3.544789, 3, -6.719057, 0, 1.5, 0.5, 0.5
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
-3.059816, -2.848716, -4,
-3.059816, -2.848716, 4,
-3.059816, -2.848716, -4,
-3.221473, -3.011614, -4,
-3.059816, -2.848716, -2,
-3.221473, -3.011614, -2,
-3.059816, -2.848716, 0,
-3.221473, -3.011614, 0,
-3.059816, -2.848716, 2,
-3.221473, -3.011614, 2,
-3.059816, -2.848716, 4,
-3.221473, -3.011614, 4
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
-3.544789, -3.33741, -4, 0, -0.5, 0.5, 0.5,
-3.544789, -3.33741, -4, 1, -0.5, 0.5, 0.5,
-3.544789, -3.33741, -4, 1, 1.5, 0.5, 0.5,
-3.544789, -3.33741, -4, 0, 1.5, 0.5, 0.5,
-3.544789, -3.33741, -2, 0, -0.5, 0.5, 0.5,
-3.544789, -3.33741, -2, 1, -0.5, 0.5, 0.5,
-3.544789, -3.33741, -2, 1, 1.5, 0.5, 0.5,
-3.544789, -3.33741, -2, 0, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 0, 0, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 0, 1, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 0, 1, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 0, 0, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 2, 0, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 2, 1, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 2, 1, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 2, 0, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 4, 0, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 4, 1, -0.5, 0.5, 0.5,
-3.544789, -3.33741, 4, 1, 1.5, 0.5, 0.5,
-3.544789, -3.33741, 4, 0, 1.5, 0.5, 0.5
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
-3.059816, -2.848716, -5.879701,
-3.059816, 3.667199, -5.879701,
-3.059816, -2.848716, 5.311706,
-3.059816, 3.667199, 5.311706,
-3.059816, -2.848716, -5.879701,
-3.059816, -2.848716, 5.311706,
-3.059816, 3.667199, -5.879701,
-3.059816, 3.667199, 5.311706,
-3.059816, -2.848716, -5.879701,
3.406495, -2.848716, -5.879701,
-3.059816, -2.848716, 5.311706,
3.406495, -2.848716, 5.311706,
-3.059816, 3.667199, -5.879701,
3.406495, 3.667199, -5.879701,
-3.059816, 3.667199, 5.311706,
3.406495, 3.667199, 5.311706,
3.406495, -2.848716, -5.879701,
3.406495, 3.667199, -5.879701,
3.406495, -2.848716, 5.311706,
3.406495, 3.667199, 5.311706,
3.406495, -2.848716, -5.879701,
3.406495, -2.848716, 5.311706,
3.406495, 3.667199, -5.879701,
3.406495, 3.667199, 5.311706
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
var radius = 7.729227;
var distance = 34.3882;
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
mvMatrix.translate( -0.1733397, -0.4092411, 0.2839978 );
mvMatrix.scale( 1.292389, 1.282551, 0.7467328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3882);
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
2-methoxyethylmercur<-read.table("2-methoxyethylmercur.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-methoxyethylmercur$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoxyethylmercur' not found
```

```r
y<-2-methoxyethylmercur$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoxyethylmercur' not found
```

```r
z<-2-methoxyethylmercur$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoxyethylmercur' not found
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
-2.965646, -0.2994418, -2.120522, 0, 0, 1, 1, 1,
-2.928462, 0.4396775, -0.3468398, 1, 0, 0, 1, 1,
-2.818374, 0.8195829, -2.664823, 1, 0, 0, 1, 1,
-2.779181, -0.02820035, -1.060927, 1, 0, 0, 1, 1,
-2.646714, -1.973337, -0.1612049, 1, 0, 0, 1, 1,
-2.585222, 0.8467404, -2.563045, 1, 0, 0, 1, 1,
-2.573937, 1.014201, -1.454658, 0, 0, 0, 1, 1,
-2.51815, 1.082438, -0.4143865, 0, 0, 0, 1, 1,
-2.346329, -0.6608501, -2.310712, 0, 0, 0, 1, 1,
-2.330333, -1.42407, -0.6647515, 0, 0, 0, 1, 1,
-2.317286, 0.8655874, -1.089078, 0, 0, 0, 1, 1,
-2.312213, 0.03895973, -3.052268, 0, 0, 0, 1, 1,
-2.307438, -0.1942509, -0.6970336, 0, 0, 0, 1, 1,
-2.274534, -0.1036344, -0.4002078, 1, 1, 1, 1, 1,
-2.246768, 0.4873742, -1.142863, 1, 1, 1, 1, 1,
-2.243209, -0.6099229, -3.65965, 1, 1, 1, 1, 1,
-2.230117, -0.5577215, 0.7594537, 1, 1, 1, 1, 1,
-2.220936, 0.5215191, -1.655415, 1, 1, 1, 1, 1,
-2.13955, 0.4308789, -0.001475465, 1, 1, 1, 1, 1,
-2.123033, -0.1834873, -2.628291, 1, 1, 1, 1, 1,
-2.091426, 1.489638, -0.5367016, 1, 1, 1, 1, 1,
-2.080237, -0.8602299, -2.25421, 1, 1, 1, 1, 1,
-2.07926, 2.527912, -0.7762673, 1, 1, 1, 1, 1,
-2.060979, 0.01155528, -2.49398, 1, 1, 1, 1, 1,
-2.045109, 1.213282, -1.67846, 1, 1, 1, 1, 1,
-2.023345, -0.2392781, -2.826735, 1, 1, 1, 1, 1,
-1.990769, 0.4440277, -2.130666, 1, 1, 1, 1, 1,
-1.987871, 0.7707682, 0.2758446, 1, 1, 1, 1, 1,
-1.960295, 1.129757, -1.20803, 0, 0, 1, 1, 1,
-1.950719, 0.5177761, -1.592664, 1, 0, 0, 1, 1,
-1.944481, 1.204934, -1.000332, 1, 0, 0, 1, 1,
-1.912364, -0.1516599, -1.659606, 1, 0, 0, 1, 1,
-1.893671, -2.286313, -1.949745, 1, 0, 0, 1, 1,
-1.890418, 0.5025996, -0.7280834, 1, 0, 0, 1, 1,
-1.886747, -1.958315, -0.9280017, 0, 0, 0, 1, 1,
-1.885959, 2.17608, -1.558865, 0, 0, 0, 1, 1,
-1.876536, -1.555989, -3.094157, 0, 0, 0, 1, 1,
-1.851282, -1.280784, -1.379163, 0, 0, 0, 1, 1,
-1.842177, 1.212962, 0.8524535, 0, 0, 0, 1, 1,
-1.826976, -0.06675113, -2.453321, 0, 0, 0, 1, 1,
-1.813011, -0.8390391, -1.920244, 0, 0, 0, 1, 1,
-1.81146, -1.751677, -3.133356, 1, 1, 1, 1, 1,
-1.81093, -0.4349646, -1.041214, 1, 1, 1, 1, 1,
-1.808283, -1.441741, -0.3248048, 1, 1, 1, 1, 1,
-1.797294, -1.912802, -2.270356, 1, 1, 1, 1, 1,
-1.795847, 0.3916583, -1.068815, 1, 1, 1, 1, 1,
-1.767019, 1.005624, -0.5820836, 1, 1, 1, 1, 1,
-1.764917, 1.0714, -1.288107, 1, 1, 1, 1, 1,
-1.76304, -0.5446839, -1.363891, 1, 1, 1, 1, 1,
-1.760623, 0.4598144, -2.284637, 1, 1, 1, 1, 1,
-1.754917, 0.8109779, -2.969248, 1, 1, 1, 1, 1,
-1.751597, -1.149528, -0.3601621, 1, 1, 1, 1, 1,
-1.739516, -0.1154778, -0.7042943, 1, 1, 1, 1, 1,
-1.73177, 1.192509, 0.8100049, 1, 1, 1, 1, 1,
-1.708382, -0.6476346, -1.615986, 1, 1, 1, 1, 1,
-1.698783, 0.2783541, -2.613676, 1, 1, 1, 1, 1,
-1.697917, 2.683001, 0.4491785, 0, 0, 1, 1, 1,
-1.695434, -1.432385, -2.338347, 1, 0, 0, 1, 1,
-1.695218, 0.6523369, -1.123483, 1, 0, 0, 1, 1,
-1.693584, 0.2896426, -1.969179, 1, 0, 0, 1, 1,
-1.669944, 0.6398619, -0.6751308, 1, 0, 0, 1, 1,
-1.656078, 0.6101918, -0.3835776, 1, 0, 0, 1, 1,
-1.647042, -0.5095691, -2.76397, 0, 0, 0, 1, 1,
-1.624508, -1.691173, -2.641878, 0, 0, 0, 1, 1,
-1.615409, 1.569625, -0.6814167, 0, 0, 0, 1, 1,
-1.609357, 0.5340976, 0.3264425, 0, 0, 0, 1, 1,
-1.604416, 1.750335, 0.1476491, 0, 0, 0, 1, 1,
-1.601499, 1.755785, -0.2842679, 0, 0, 0, 1, 1,
-1.586336, -1.123118, -2.503612, 0, 0, 0, 1, 1,
-1.584453, 0.02366498, -0.6332834, 1, 1, 1, 1, 1,
-1.584169, -1.697808, -3.839592, 1, 1, 1, 1, 1,
-1.574702, 1.249072, -1.601104, 1, 1, 1, 1, 1,
-1.565517, 0.06993612, -0.3254267, 1, 1, 1, 1, 1,
-1.557529, -0.04038088, -1.656839, 1, 1, 1, 1, 1,
-1.555596, 0.5327541, -1.098377, 1, 1, 1, 1, 1,
-1.555261, 0.3425383, -1.72675, 1, 1, 1, 1, 1,
-1.541381, -0.3018644, -1.321623, 1, 1, 1, 1, 1,
-1.532398, -0.1756592, -2.163569, 1, 1, 1, 1, 1,
-1.528152, 0.2020749, -1.258394, 1, 1, 1, 1, 1,
-1.517602, -0.7464663, -3.331069, 1, 1, 1, 1, 1,
-1.514545, 2.213358, -0.6742112, 1, 1, 1, 1, 1,
-1.509599, -2.200782, -1.783557, 1, 1, 1, 1, 1,
-1.476529, 1.308243, 0.1302629, 1, 1, 1, 1, 1,
-1.467985, 0.3519974, -1.827407, 1, 1, 1, 1, 1,
-1.465878, -0.7294942, -4.650908, 0, 0, 1, 1, 1,
-1.454956, 0.174873, -0.4194764, 1, 0, 0, 1, 1,
-1.445957, -0.287037, -1.162363, 1, 0, 0, 1, 1,
-1.444629, -0.3185154, -1.487346, 1, 0, 0, 1, 1,
-1.420655, 0.2723808, 0.1134897, 1, 0, 0, 1, 1,
-1.412711, -0.3417152, -1.080966, 1, 0, 0, 1, 1,
-1.410304, 2.375585, 0.7557339, 0, 0, 0, 1, 1,
-1.403478, -0.3827069, -2.626832, 0, 0, 0, 1, 1,
-1.402214, 0.7131547, -2.033647, 0, 0, 0, 1, 1,
-1.399555, -1.220407, -2.282571, 0, 0, 0, 1, 1,
-1.394433, -2.286922, -3.53397, 0, 0, 0, 1, 1,
-1.388958, 0.9008666, -0.6409322, 0, 0, 0, 1, 1,
-1.383026, 0.4745388, -1.894779, 0, 0, 0, 1, 1,
-1.380841, 0.2060405, -0.9743464, 1, 1, 1, 1, 1,
-1.376257, -0.4828905, -2.937563, 1, 1, 1, 1, 1,
-1.372827, 0.2228065, 0.7519418, 1, 1, 1, 1, 1,
-1.357475, -0.1391849, -3.812118, 1, 1, 1, 1, 1,
-1.350247, -1.131001, -0.7511865, 1, 1, 1, 1, 1,
-1.330608, 0.7401903, 0.4989635, 1, 1, 1, 1, 1,
-1.305158, 0.7761657, -1.066016, 1, 1, 1, 1, 1,
-1.276207, -0.2184271, -2.40657, 1, 1, 1, 1, 1,
-1.268473, -0.2555342, -3.342426, 1, 1, 1, 1, 1,
-1.255569, -0.562384, -1.984575, 1, 1, 1, 1, 1,
-1.247041, -0.3322936, -2.83483, 1, 1, 1, 1, 1,
-1.235284, -0.9573935, -4.10127, 1, 1, 1, 1, 1,
-1.233905, -1.172556, -3.763066, 1, 1, 1, 1, 1,
-1.228233, -0.4123664, -2.165075, 1, 1, 1, 1, 1,
-1.226628, -0.0873084, -0.2826604, 1, 1, 1, 1, 1,
-1.211631, 0.8418204, -1.258897, 0, 0, 1, 1, 1,
-1.204123, 0.1708248, -0.6400576, 1, 0, 0, 1, 1,
-1.203752, 0.3164448, -2.561438, 1, 0, 0, 1, 1,
-1.195578, 0.8029429, -1.50336, 1, 0, 0, 1, 1,
-1.177157, 0.9950004, -0.08720832, 1, 0, 0, 1, 1,
-1.171327, -1.515961, -0.9684622, 1, 0, 0, 1, 1,
-1.16995, 0.5527708, -1.429751, 0, 0, 0, 1, 1,
-1.163498, 0.4488747, -3.298671, 0, 0, 0, 1, 1,
-1.160792, 0.1929734, -0.9746394, 0, 0, 0, 1, 1,
-1.15943, -0.4484106, -2.108503, 0, 0, 0, 1, 1,
-1.150601, -0.251332, -4.056336, 0, 0, 0, 1, 1,
-1.146879, 0.5475463, -1.253717, 0, 0, 0, 1, 1,
-1.145615, 1.069461, -0.7222186, 0, 0, 0, 1, 1,
-1.145434, 0.6376969, -0.4623675, 1, 1, 1, 1, 1,
-1.136352, -1.106854, -3.124017, 1, 1, 1, 1, 1,
-1.132589, 0.9098759, -0.7590352, 1, 1, 1, 1, 1,
-1.130373, 0.04623382, -1.889295, 1, 1, 1, 1, 1,
-1.128556, -0.05473844, -1.755096, 1, 1, 1, 1, 1,
-1.121444, -1.331819, -2.06094, 1, 1, 1, 1, 1,
-1.116597, 0.4474081, -0.8882254, 1, 1, 1, 1, 1,
-1.116077, -1.005754, -1.879116, 1, 1, 1, 1, 1,
-1.113999, 1.055427, -0.548247, 1, 1, 1, 1, 1,
-1.105394, 0.1638139, 0.3078517, 1, 1, 1, 1, 1,
-1.095236, 0.02333712, 0.4736858, 1, 1, 1, 1, 1,
-1.090355, -1.885162, -2.309038, 1, 1, 1, 1, 1,
-1.088261, -0.1211049, -2.299347, 1, 1, 1, 1, 1,
-1.081433, -0.01906964, -1.136882, 1, 1, 1, 1, 1,
-1.078873, 1.568665, -1.635232, 1, 1, 1, 1, 1,
-1.068331, 1.42019, -0.7454876, 0, 0, 1, 1, 1,
-1.065619, 0.593554, -1.594305, 1, 0, 0, 1, 1,
-1.061345, 1.532892, -1.904528, 1, 0, 0, 1, 1,
-1.050134, 1.067574, -0.5128924, 1, 0, 0, 1, 1,
-1.048646, 0.05994504, -4.099889, 1, 0, 0, 1, 1,
-1.044213, -1.765976, -4.463084, 1, 0, 0, 1, 1,
-1.044069, 1.021441, -0.392217, 0, 0, 0, 1, 1,
-1.04286, 0.03148845, -2.931389, 0, 0, 0, 1, 1,
-1.037593, -1.791303, -3.865332, 0, 0, 0, 1, 1,
-1.036667, 0.006205227, -1.02588, 0, 0, 0, 1, 1,
-1.036323, -1.408921, -2.62781, 0, 0, 0, 1, 1,
-1.029045, 0.9959732, -0.6184837, 0, 0, 0, 1, 1,
-1.022526, 0.2277839, -2.277197, 0, 0, 0, 1, 1,
-1.019455, -0.02402995, -1.641628, 1, 1, 1, 1, 1,
-1.01919, 0.5661644, -0.4372849, 1, 1, 1, 1, 1,
-1.018603, 0.4648707, 1.406549, 1, 1, 1, 1, 1,
-1.015467, -1.287898, -2.60307, 1, 1, 1, 1, 1,
-1.015354, -1.632252, -3.327273, 1, 1, 1, 1, 1,
-1.013174, 0.9551434, -2.319468, 1, 1, 1, 1, 1,
-1.00809, 1.301945, -0.1260725, 1, 1, 1, 1, 1,
-1.002724, 1.014718, -0.3847137, 1, 1, 1, 1, 1,
-1.0021, 0.2701113, -1.427627, 1, 1, 1, 1, 1,
-1.001137, 1.374282, 1.064814, 1, 1, 1, 1, 1,
-0.9965818, 1.094445, -0.7525185, 1, 1, 1, 1, 1,
-0.992119, 1.917025, -1.774985, 1, 1, 1, 1, 1,
-0.9816313, 0.336132, 0.8880545, 1, 1, 1, 1, 1,
-0.9797896, -1.045507, -3.266995, 1, 1, 1, 1, 1,
-0.9775667, -0.2381188, -3.417782, 1, 1, 1, 1, 1,
-0.9742415, 1.388631, 0.5913458, 0, 0, 1, 1, 1,
-0.9599563, 0.2872084, 1.028035, 1, 0, 0, 1, 1,
-0.956862, -0.8381043, -3.496874, 1, 0, 0, 1, 1,
-0.9568222, 1.01638, -0.2262712, 1, 0, 0, 1, 1,
-0.9457492, -0.8634599, -2.061791, 1, 0, 0, 1, 1,
-0.9454288, -0.4154257, -3.427171, 1, 0, 0, 1, 1,
-0.9395837, -0.799823, -1.677155, 0, 0, 0, 1, 1,
-0.9352472, 1.458198, 0.03691348, 0, 0, 0, 1, 1,
-0.9336424, -0.1161592, -2.736012, 0, 0, 0, 1, 1,
-0.9330549, -0.895217, -4.155362, 0, 0, 0, 1, 1,
-0.9330047, -0.6353337, -0.487633, 0, 0, 0, 1, 1,
-0.9252053, -1.035638, -2.325348, 0, 0, 0, 1, 1,
-0.9246321, -0.7429146, -5.05975, 0, 0, 0, 1, 1,
-0.9110482, -0.4900548, 0.5007685, 1, 1, 1, 1, 1,
-0.9105811, 1.843824, -2.0961, 1, 1, 1, 1, 1,
-0.9054319, -0.7061564, -1.039051, 1, 1, 1, 1, 1,
-0.9053235, 0.4681365, -1.50784, 1, 1, 1, 1, 1,
-0.8939937, -0.058968, -1.120092, 1, 1, 1, 1, 1,
-0.8921495, -0.7546049, -1.561425, 1, 1, 1, 1, 1,
-0.8916, -1.419662, -2.338843, 1, 1, 1, 1, 1,
-0.88323, 0.1868282, -1.071208, 1, 1, 1, 1, 1,
-0.8792468, 0.2867182, -2.012376, 1, 1, 1, 1, 1,
-0.8736268, -0.6195522, -1.937022, 1, 1, 1, 1, 1,
-0.8647056, 0.04575778, -2.237405, 1, 1, 1, 1, 1,
-0.8610552, 1.48322, -0.1043842, 1, 1, 1, 1, 1,
-0.8583519, 1.554307, 0.2661626, 1, 1, 1, 1, 1,
-0.8554834, -0.5151716, -3.323101, 1, 1, 1, 1, 1,
-0.8513648, -1.757244, -3.804236, 1, 1, 1, 1, 1,
-0.8496479, 0.2097022, -0.7682369, 0, 0, 1, 1, 1,
-0.8487626, 0.2247962, -1.02815, 1, 0, 0, 1, 1,
-0.847261, -1.082576, -4.31872, 1, 0, 0, 1, 1,
-0.8437537, -0.4910655, -3.037238, 1, 0, 0, 1, 1,
-0.8436475, -0.9380416, -1.494577, 1, 0, 0, 1, 1,
-0.8264608, 0.6966302, -0.1563548, 1, 0, 0, 1, 1,
-0.8253055, -0.1414927, -2.616167, 0, 0, 0, 1, 1,
-0.8186458, 0.1380923, -2.232255, 0, 0, 0, 1, 1,
-0.8169935, -0.1768235, -1.457219, 0, 0, 0, 1, 1,
-0.8155113, -2.074271, -2.624501, 0, 0, 0, 1, 1,
-0.8151713, 0.5922893, 0.1030775, 0, 0, 0, 1, 1,
-0.8122913, 0.9506949, -1.638881, 0, 0, 0, 1, 1,
-0.8037021, -0.3260563, -1.004118, 0, 0, 0, 1, 1,
-0.7980915, 0.04015365, -2.670534, 1, 1, 1, 1, 1,
-0.7915878, -2.03477, -2.40502, 1, 1, 1, 1, 1,
-0.7908612, 0.8297157, 1.124092, 1, 1, 1, 1, 1,
-0.7894466, 0.5587376, 0.4222971, 1, 1, 1, 1, 1,
-0.7867144, -0.7652674, -3.732781, 1, 1, 1, 1, 1,
-0.7827362, -2.385926, -4.326293, 1, 1, 1, 1, 1,
-0.7783374, 0.2235546, 0.3408191, 1, 1, 1, 1, 1,
-0.7743304, -0.1961487, -2.913943, 1, 1, 1, 1, 1,
-0.7575127, -0.844996, -2.803696, 1, 1, 1, 1, 1,
-0.7571439, 0.3135717, -0.1938771, 1, 1, 1, 1, 1,
-0.7551963, 0.3215345, -2.516244, 1, 1, 1, 1, 1,
-0.7545121, -0.3582104, -1.898637, 1, 1, 1, 1, 1,
-0.7508992, -0.5331304, -1.103357, 1, 1, 1, 1, 1,
-0.7466365, 0.176788, -2.691656, 1, 1, 1, 1, 1,
-0.7425322, 0.03957536, -2.292464, 1, 1, 1, 1, 1,
-0.7371056, -1.266975, -3.102747, 0, 0, 1, 1, 1,
-0.735921, -1.146293, -1.811879, 1, 0, 0, 1, 1,
-0.731297, 0.607803, -0.7168953, 1, 0, 0, 1, 1,
-0.7301689, -1.284257, -4.112627, 1, 0, 0, 1, 1,
-0.7260719, 1.059921, -1.049897, 1, 0, 0, 1, 1,
-0.7237445, -0.1479338, -2.098907, 1, 0, 0, 1, 1,
-0.7232475, 0.59344, -1.0456, 0, 0, 0, 1, 1,
-0.7170393, -1.955133, -3.164511, 0, 0, 0, 1, 1,
-0.7115, 0.7465303, -0.9547719, 0, 0, 0, 1, 1,
-0.7114875, -0.4693767, -1.149309, 0, 0, 0, 1, 1,
-0.7073691, -2.572891, -1.475994, 0, 0, 0, 1, 1,
-0.7057161, -0.5581901, -2.321737, 0, 0, 0, 1, 1,
-0.7053952, -1.381231, -2.50919, 0, 0, 0, 1, 1,
-0.7029209, -1.243374, -2.170141, 1, 1, 1, 1, 1,
-0.7027299, -0.09968415, -0.1809382, 1, 1, 1, 1, 1,
-0.702717, -0.7009236, -0.8335357, 1, 1, 1, 1, 1,
-0.6943756, -1.094869, -3.227652, 1, 1, 1, 1, 1,
-0.6915913, 0.7234074, -1.708072, 1, 1, 1, 1, 1,
-0.6908715, -1.029542, -2.269465, 1, 1, 1, 1, 1,
-0.6889646, -0.07350865, 0.3324617, 1, 1, 1, 1, 1,
-0.6882539, -0.5429083, -2.276075, 1, 1, 1, 1, 1,
-0.6868248, -0.110739, -0.763651, 1, 1, 1, 1, 1,
-0.6840245, -0.2942713, -1.497889, 1, 1, 1, 1, 1,
-0.6832413, -0.5893974, -1.646811, 1, 1, 1, 1, 1,
-0.6771803, -0.8245877, -3.483603, 1, 1, 1, 1, 1,
-0.6752023, -1.289551, -2.586335, 1, 1, 1, 1, 1,
-0.669229, 1.072659, -1.778747, 1, 1, 1, 1, 1,
-0.6671576, -1.426694, -2.472324, 1, 1, 1, 1, 1,
-0.6598714, 1.244169, -1.004758, 0, 0, 1, 1, 1,
-0.6540117, 0.4822479, -1.40886, 1, 0, 0, 1, 1,
-0.6481323, 0.2481911, -2.131071, 1, 0, 0, 1, 1,
-0.645103, -2.124074, -1.869788, 1, 0, 0, 1, 1,
-0.6444753, -1.396982, -3.762553, 1, 0, 0, 1, 1,
-0.644366, 0.4124498, 0.5762935, 1, 0, 0, 1, 1,
-0.6433257, 0.2997611, -1.957636, 0, 0, 0, 1, 1,
-0.6419495, 0.407185, -0.3720696, 0, 0, 0, 1, 1,
-0.6311528, 0.9336433, -0.06422126, 0, 0, 0, 1, 1,
-0.6304548, -0.5843039, -0.9063432, 0, 0, 0, 1, 1,
-0.627308, -1.255425, -2.841897, 0, 0, 0, 1, 1,
-0.6252681, -1.012752, -2.368976, 0, 0, 0, 1, 1,
-0.6251224, -0.576339, -1.663009, 0, 0, 0, 1, 1,
-0.6246636, 1.472425, -0.9618498, 1, 1, 1, 1, 1,
-0.62161, 0.8418381, -1.648832, 1, 1, 1, 1, 1,
-0.6215208, 1.686719, -1.629074, 1, 1, 1, 1, 1,
-0.6185361, 1.242706, -0.003509016, 1, 1, 1, 1, 1,
-0.6175023, -0.6074945, -2.697762, 1, 1, 1, 1, 1,
-0.6141512, 0.7604001, -3.310651, 1, 1, 1, 1, 1,
-0.6133657, 0.7612825, -0.1877694, 1, 1, 1, 1, 1,
-0.6122357, 0.1493043, -1.451014, 1, 1, 1, 1, 1,
-0.6116173, -1.529317, -3.655037, 1, 1, 1, 1, 1,
-0.6109957, 0.09306397, 0.4055236, 1, 1, 1, 1, 1,
-0.6105985, 0.451773, -0.1753661, 1, 1, 1, 1, 1,
-0.6088274, -0.3189934, -1.806885, 1, 1, 1, 1, 1,
-0.6080407, 0.7664196, -1.30864, 1, 1, 1, 1, 1,
-0.6037798, 0.05991305, -0.8528243, 1, 1, 1, 1, 1,
-0.6024339, 0.9102519, -1.278424, 1, 1, 1, 1, 1,
-0.5996664, -0.6294887, -1.83029, 0, 0, 1, 1, 1,
-0.5995523, 0.1932093, -0.4292455, 1, 0, 0, 1, 1,
-0.5992714, -0.553305, -4.374558, 1, 0, 0, 1, 1,
-0.5940248, 0.553381, 0.04513419, 1, 0, 0, 1, 1,
-0.5914041, -0.9335092, -4.772115, 1, 0, 0, 1, 1,
-0.5895734, 0.4806866, -1.071364, 1, 0, 0, 1, 1,
-0.5853426, -1.010869, -1.954489, 0, 0, 0, 1, 1,
-0.5761225, -0.3560263, -1.775885, 0, 0, 0, 1, 1,
-0.5677645, 1.649315, 1.912091, 0, 0, 0, 1, 1,
-0.5651101, -1.881762, -2.804378, 0, 0, 0, 1, 1,
-0.560268, -0.3116786, -2.320074, 0, 0, 0, 1, 1,
-0.5575254, -0.1910061, -3.124971, 0, 0, 0, 1, 1,
-0.557218, -0.801159, -3.595188, 0, 0, 0, 1, 1,
-0.5570227, -1.108773, -2.608454, 1, 1, 1, 1, 1,
-0.5552602, -1.084251, -3.317164, 1, 1, 1, 1, 1,
-0.5512732, -0.8797877, -4.130519, 1, 1, 1, 1, 1,
-0.5462299, -2.009529, -1.734642, 1, 1, 1, 1, 1,
-0.5445507, -0.5537314, -1.061228, 1, 1, 1, 1, 1,
-0.5409543, -1.023801, -2.599299, 1, 1, 1, 1, 1,
-0.5396473, 0.3026818, -0.3550678, 1, 1, 1, 1, 1,
-0.5324748, 1.068344, -0.9252467, 1, 1, 1, 1, 1,
-0.5294076, 0.3861123, -0.5245238, 1, 1, 1, 1, 1,
-0.5200179, 0.6158714, -0.5315993, 1, 1, 1, 1, 1,
-0.5159591, 1.661791, 0.6597843, 1, 1, 1, 1, 1,
-0.5151243, 0.1238516, -0.7730021, 1, 1, 1, 1, 1,
-0.5080509, 0.3808292, -0.5756884, 1, 1, 1, 1, 1,
-0.49907, 0.8277123, -1.894476, 1, 1, 1, 1, 1,
-0.490727, -0.2256261, -2.727636, 1, 1, 1, 1, 1,
-0.4866679, -0.2713168, -1.844431, 0, 0, 1, 1, 1,
-0.4860319, 1.065401, 0.1625229, 1, 0, 0, 1, 1,
-0.4812051, 2.687904, -2.014521, 1, 0, 0, 1, 1,
-0.4780807, 0.8808497, 0.5784198, 1, 0, 0, 1, 1,
-0.476553, 1.55174, 0.02283411, 1, 0, 0, 1, 1,
-0.474121, -0.7758096, -1.917886, 1, 0, 0, 1, 1,
-0.4737884, 0.4678454, -0.7112067, 0, 0, 0, 1, 1,
-0.4715438, -1.368737, -1.860056, 0, 0, 0, 1, 1,
-0.4641563, 0.1626622, -1.176068, 0, 0, 0, 1, 1,
-0.4605365, 0.01462287, -2.678065, 0, 0, 0, 1, 1,
-0.4587358, -0.4310962, -2.778038, 0, 0, 0, 1, 1,
-0.4539164, 1.874344, -0.2571833, 0, 0, 0, 1, 1,
-0.453828, 0.9890643, -1.652005, 0, 0, 0, 1, 1,
-0.4533222, -0.246692, -0.8379055, 1, 1, 1, 1, 1,
-0.4502531, -0.352203, -2.300143, 1, 1, 1, 1, 1,
-0.4478977, -2.326495, -3.703557, 1, 1, 1, 1, 1,
-0.4459399, -0.9506026, -3.97963, 1, 1, 1, 1, 1,
-0.4451964, 1.277916, -1.561299, 1, 1, 1, 1, 1,
-0.4437, -1.273115, -3.340926, 1, 1, 1, 1, 1,
-0.4429092, -0.6389431, -3.153848, 1, 1, 1, 1, 1,
-0.4400111, -0.7943031, -1.941258, 1, 1, 1, 1, 1,
-0.4392294, 0.6900285, 0.3816379, 1, 1, 1, 1, 1,
-0.4385734, 0.7296413, -1.677272, 1, 1, 1, 1, 1,
-0.4385552, 1.48279, -1.04819, 1, 1, 1, 1, 1,
-0.430198, 1.607956, 0.003329129, 1, 1, 1, 1, 1,
-0.4282613, 0.3742853, -2.088944, 1, 1, 1, 1, 1,
-0.4251835, 0.300509, -2.172832, 1, 1, 1, 1, 1,
-0.4234619, 1.444246, -1.567741, 1, 1, 1, 1, 1,
-0.421044, -0.7544746, -3.25797, 0, 0, 1, 1, 1,
-0.4131974, 0.625737, -2.180858, 1, 0, 0, 1, 1,
-0.409263, -0.8426225, -3.334992, 1, 0, 0, 1, 1,
-0.408212, 0.2676207, -1.351883, 1, 0, 0, 1, 1,
-0.4065033, -1.859129, -3.109866, 1, 0, 0, 1, 1,
-0.4058913, 0.7924464, 1.057299, 1, 0, 0, 1, 1,
-0.4055779, -0.5673596, -1.710433, 0, 0, 0, 1, 1,
-0.4049127, 0.4713071, 0.1562467, 0, 0, 0, 1, 1,
-0.4016574, 2.340224, 0.4069716, 0, 0, 0, 1, 1,
-0.4014304, 1.172954, 1.092003, 0, 0, 0, 1, 1,
-0.3995474, -0.7585204, -2.947775, 0, 0, 0, 1, 1,
-0.3992761, 0.2527881, -0.6155761, 0, 0, 0, 1, 1,
-0.3969085, -0.4896623, -0.1955435, 0, 0, 0, 1, 1,
-0.3955356, -0.1228074, -0.8086761, 1, 1, 1, 1, 1,
-0.3938511, 0.5359578, -2.473924, 1, 1, 1, 1, 1,
-0.3905551, 0.1840438, -3.668216, 1, 1, 1, 1, 1,
-0.3863148, -0.7307823, -1.582281, 1, 1, 1, 1, 1,
-0.3833226, 0.004891477, -1.171445, 1, 1, 1, 1, 1,
-0.3817659, 1.94264, -2.081579, 1, 1, 1, 1, 1,
-0.380735, 0.8175217, -0.473868, 1, 1, 1, 1, 1,
-0.3782254, 0.6019978, -0.3593291, 1, 1, 1, 1, 1,
-0.3773629, 1.048862, 0.08453545, 1, 1, 1, 1, 1,
-0.3747258, 0.8073061, -1.349897, 1, 1, 1, 1, 1,
-0.3747099, 1.7793, -0.08526883, 1, 1, 1, 1, 1,
-0.3641598, -0.34567, -1.847905, 1, 1, 1, 1, 1,
-0.3632271, -1.31072, -2.565821, 1, 1, 1, 1, 1,
-0.3629186, -0.5165566, -3.483608, 1, 1, 1, 1, 1,
-0.3608815, -0.6196628, -0.4278663, 1, 1, 1, 1, 1,
-0.3556663, -0.3372856, -3.283802, 0, 0, 1, 1, 1,
-0.3503724, 0.0989211, -3.755814, 1, 0, 0, 1, 1,
-0.3489584, -1.642518, -1.95508, 1, 0, 0, 1, 1,
-0.3444642, -0.4385415, -2.317671, 1, 0, 0, 1, 1,
-0.3433285, 0.9750453, 2.212759, 1, 0, 0, 1, 1,
-0.3423233, 0.9274536, 0.6213403, 1, 0, 0, 1, 1,
-0.3390778, 0.8065432, -0.08699411, 0, 0, 0, 1, 1,
-0.338698, 1.038168, 1.005276, 0, 0, 0, 1, 1,
-0.3374429, -0.336756, -3.068268, 0, 0, 0, 1, 1,
-0.3361583, -0.03382213, -0.9266756, 0, 0, 0, 1, 1,
-0.3339817, 0.765743, 0.4780103, 0, 0, 0, 1, 1,
-0.3334589, 1.504018, -0.1946695, 0, 0, 0, 1, 1,
-0.3273728, -0.769446, 0.1580805, 0, 0, 0, 1, 1,
-0.3252051, 0.1203931, -1.448267, 1, 1, 1, 1, 1,
-0.3242776, -0.7459576, -2.465965, 1, 1, 1, 1, 1,
-0.320172, 0.596274, -0.5182798, 1, 1, 1, 1, 1,
-0.3197316, 0.03920451, -1.932661, 1, 1, 1, 1, 1,
-0.319073, 0.1122935, -2.790996, 1, 1, 1, 1, 1,
-0.3156674, -0.4350427, -2.67556, 1, 1, 1, 1, 1,
-0.3132701, 1.531998, -1.209273, 1, 1, 1, 1, 1,
-0.311811, 1.086746, -0.1199874, 1, 1, 1, 1, 1,
-0.3090371, -1.288751, -3.838917, 1, 1, 1, 1, 1,
-0.308509, 1.189655, -0.559358, 1, 1, 1, 1, 1,
-0.3077669, -0.6686882, -1.050169, 1, 1, 1, 1, 1,
-0.3003273, -0.02794726, -0.8940858, 1, 1, 1, 1, 1,
-0.2994958, -1.535982, -3.373558, 1, 1, 1, 1, 1,
-0.2965758, 0.8118789, -0.8373389, 1, 1, 1, 1, 1,
-0.2940732, -0.0935718, -2.610976, 1, 1, 1, 1, 1,
-0.2885512, 0.6047567, 0.2696541, 0, 0, 1, 1, 1,
-0.2876028, 0.4014444, -0.1403329, 1, 0, 0, 1, 1,
-0.2868237, 1.138279, 0.9985108, 1, 0, 0, 1, 1,
-0.2856314, -0.1980462, -0.5267456, 1, 0, 0, 1, 1,
-0.2827265, 0.9062926, 0.4901549, 1, 0, 0, 1, 1,
-0.2813774, -0.2175634, -2.056454, 1, 0, 0, 1, 1,
-0.2760077, -0.1300294, 0.09915582, 0, 0, 0, 1, 1,
-0.2755937, -1.183764, -2.619841, 0, 0, 0, 1, 1,
-0.2746771, 0.6836206, -1.464009, 0, 0, 0, 1, 1,
-0.272678, -0.5469182, -2.860382, 0, 0, 0, 1, 1,
-0.2689667, 0.2668223, -0.7395846, 0, 0, 0, 1, 1,
-0.2676578, -0.4983097, -3.333859, 0, 0, 0, 1, 1,
-0.2668892, -0.1200757, -2.008794, 0, 0, 0, 1, 1,
-0.2638117, -1.158857, -3.455413, 1, 1, 1, 1, 1,
-0.2565037, 0.6098193, -1.095515, 1, 1, 1, 1, 1,
-0.2530604, -0.1715931, -3.860007, 1, 1, 1, 1, 1,
-0.2528882, -1.557597, -1.715124, 1, 1, 1, 1, 1,
-0.2517984, -2.085272, -4.999985, 1, 1, 1, 1, 1,
-0.2494467, -1.329873, -3.448032, 1, 1, 1, 1, 1,
-0.2481118, -1.012556, -3.979173, 1, 1, 1, 1, 1,
-0.2474313, 0.7591895, 0.06904673, 1, 1, 1, 1, 1,
-0.2458018, -0.8962125, -1.84908, 1, 1, 1, 1, 1,
-0.2449013, 1.14414, -2.74529, 1, 1, 1, 1, 1,
-0.241452, 0.09830176, 0.7298118, 1, 1, 1, 1, 1,
-0.239188, -1.720908, -2.329824, 1, 1, 1, 1, 1,
-0.2356306, 0.267676, -1.121962, 1, 1, 1, 1, 1,
-0.2298682, 0.3966544, 1.541921, 1, 1, 1, 1, 1,
-0.2287119, -0.01509213, -2.744378, 1, 1, 1, 1, 1,
-0.2265338, 0.6217628, 0.8252915, 0, 0, 1, 1, 1,
-0.2165613, -0.4461171, -1.711313, 1, 0, 0, 1, 1,
-0.2130781, 0.2286461, 1.299312, 1, 0, 0, 1, 1,
-0.2124985, 0.02505449, -1.402591, 1, 0, 0, 1, 1,
-0.2112954, 0.7014825, 0.2043411, 1, 0, 0, 1, 1,
-0.2112937, 1.717074, -0.4451905, 1, 0, 0, 1, 1,
-0.2048276, 0.5242314, -0.8474037, 0, 0, 0, 1, 1,
-0.2040753, -0.7934753, -4.768456, 0, 0, 0, 1, 1,
-0.2014274, -0.003385275, -1.28214, 0, 0, 0, 1, 1,
-0.1983792, -1.122116, -2.299025, 0, 0, 0, 1, 1,
-0.1941442, 1.334937, 1.138172, 0, 0, 0, 1, 1,
-0.1906283, -0.2999359, -0.3148038, 0, 0, 0, 1, 1,
-0.1896292, 0.2519203, -1.245612, 0, 0, 0, 1, 1,
-0.188925, -0.1546979, -1.006341, 1, 1, 1, 1, 1,
-0.1888958, 1.206116, -0.1897977, 1, 1, 1, 1, 1,
-0.185287, -0.07396859, -3.159931, 1, 1, 1, 1, 1,
-0.1852456, 0.6411036, -0.4594162, 1, 1, 1, 1, 1,
-0.1849811, 0.2903326, -1.311018, 1, 1, 1, 1, 1,
-0.1834567, -0.1305779, -0.5448948, 1, 1, 1, 1, 1,
-0.1824424, -0.05388233, -2.299108, 1, 1, 1, 1, 1,
-0.1775975, 0.789946, -1.044865, 1, 1, 1, 1, 1,
-0.174102, -0.7850273, -5.71672, 1, 1, 1, 1, 1,
-0.1730199, 0.2177317, 0.1373105, 1, 1, 1, 1, 1,
-0.1673899, 2.172313, 0.2985822, 1, 1, 1, 1, 1,
-0.1630769, 0.07745915, -0.3632583, 1, 1, 1, 1, 1,
-0.1599445, -0.03560937, -0.8055593, 1, 1, 1, 1, 1,
-0.1555182, 2.028672, 0.3300774, 1, 1, 1, 1, 1,
-0.1499601, 1.119181, 0.8659623, 1, 1, 1, 1, 1,
-0.1499107, 0.2520508, -1.260669, 0, 0, 1, 1, 1,
-0.1489218, 3.027472, 0.1224788, 1, 0, 0, 1, 1,
-0.1463541, 1.346204, -0.1809229, 1, 0, 0, 1, 1,
-0.1451656, -0.1034223, -2.19338, 1, 0, 0, 1, 1,
-0.1411237, -0.1051779, -2.350692, 1, 0, 0, 1, 1,
-0.141105, 0.2137559, 0.01671937, 1, 0, 0, 1, 1,
-0.1386653, -0.07192729, -4.423522, 0, 0, 0, 1, 1,
-0.1381872, -0.6761173, -1.910859, 0, 0, 0, 1, 1,
-0.1378512, 0.01947426, -1.514006, 0, 0, 0, 1, 1,
-0.136323, -2.189405, -3.415012, 0, 0, 0, 1, 1,
-0.1361357, -0.3166568, -1.714761, 0, 0, 0, 1, 1,
-0.1357092, 0.4309283, -0.5623742, 0, 0, 0, 1, 1,
-0.1307917, 1.613307, -0.8827614, 0, 0, 0, 1, 1,
-0.1298715, -0.1373232, -2.621244, 1, 1, 1, 1, 1,
-0.1246773, 0.1189433, -0.9796899, 1, 1, 1, 1, 1,
-0.1174715, -1.712664, -1.820575, 1, 1, 1, 1, 1,
-0.1133716, -0.7498502, -4.075081, 1, 1, 1, 1, 1,
-0.1104019, -1.927672, -3.385921, 1, 1, 1, 1, 1,
-0.1070262, -2.385164, -5.051619, 1, 1, 1, 1, 1,
-0.1070257, -0.4163087, -3.177293, 1, 1, 1, 1, 1,
-0.1035578, -0.1000122, -2.039853, 1, 1, 1, 1, 1,
-0.1033513, 1.258415, -1.026999, 1, 1, 1, 1, 1,
-0.1022702, -0.469521, -2.754227, 1, 1, 1, 1, 1,
-0.1001352, 1.123755, -0.4930927, 1, 1, 1, 1, 1,
-0.09972232, 1.055598, -0.2264478, 1, 1, 1, 1, 1,
-0.09121899, 1.254154, -0.2282494, 1, 1, 1, 1, 1,
-0.08962411, -0.691941, -4.159316, 1, 1, 1, 1, 1,
-0.08370815, 1.146474, -0.3889886, 1, 1, 1, 1, 1,
-0.07997228, -0.3877534, -3.237962, 0, 0, 1, 1, 1,
-0.07633375, 0.107868, -0.5604276, 1, 0, 0, 1, 1,
-0.07274245, 0.881626, 2.064371, 1, 0, 0, 1, 1,
-0.06760536, 0.6387004, -0.3636877, 1, 0, 0, 1, 1,
-0.06238469, 0.4291729, 1.023515, 1, 0, 0, 1, 1,
-0.06088708, 0.1024407, -0.5402232, 1, 0, 0, 1, 1,
-0.05789376, -0.6190492, -3.995348, 0, 0, 0, 1, 1,
-0.05623413, -0.2918882, -4.119867, 0, 0, 0, 1, 1,
-0.05102842, -0.9646788, -3.846713, 0, 0, 0, 1, 1,
-0.05078457, 1.543213, 0.7883351, 0, 0, 0, 1, 1,
-0.0506667, 0.4113756, -1.496179, 0, 0, 0, 1, 1,
-0.04788417, -0.4532035, -3.10515, 0, 0, 0, 1, 1,
-0.0478518, 0.7113605, -0.5681915, 0, 0, 0, 1, 1,
-0.0446289, 0.03190181, -1.453035, 1, 1, 1, 1, 1,
-0.04139852, -0.6670047, -1.533483, 1, 1, 1, 1, 1,
-0.03785149, 0.4312484, -1.169682, 1, 1, 1, 1, 1,
-0.03351892, -0.9815816, -0.6818547, 1, 1, 1, 1, 1,
-0.03146333, -0.3229325, -3.329349, 1, 1, 1, 1, 1,
-0.03121263, -0.3467606, -2.655923, 1, 1, 1, 1, 1,
-0.02679723, -0.897997, -5.28999, 1, 1, 1, 1, 1,
-0.02616966, 0.1675018, -0.566682, 1, 1, 1, 1, 1,
-0.02551266, -1.901856, -2.931575, 1, 1, 1, 1, 1,
-0.02360472, 0.5068666, -1.416179, 1, 1, 1, 1, 1,
-0.01888455, 1.38936, -1.118136, 1, 1, 1, 1, 1,
-0.01839665, 0.9621717, -1.789633, 1, 1, 1, 1, 1,
-0.01813547, 2.109782, 1.861429, 1, 1, 1, 1, 1,
-0.01552802, -0.9228466, -3.106234, 1, 1, 1, 1, 1,
-0.01222718, 1.332398, -0.1967766, 1, 1, 1, 1, 1,
-0.011677, -0.7351654, -3.442926, 0, 0, 1, 1, 1,
-0.01111117, -1.087095, -1.776527, 1, 0, 0, 1, 1,
-0.01034525, -0.8851294, -3.206894, 1, 0, 0, 1, 1,
-0.009313701, -0.1119346, -1.987965, 1, 0, 0, 1, 1,
-0.005998177, 0.6472512, -0.4896623, 1, 0, 0, 1, 1,
-0.004775011, -0.3791925, -3.040478, 1, 0, 0, 1, 1,
-0.004230733, -0.2153498, -3.173004, 0, 0, 0, 1, 1,
-0.0012758, -0.5550983, -5.049382, 0, 0, 0, 1, 1,
-0.0009117155, -0.8450842, -2.277708, 0, 0, 0, 1, 1,
5.943534e-05, 1.525925, 0.6906718, 0, 0, 0, 1, 1,
0.0006987347, -0.9813922, 3.345404, 0, 0, 0, 1, 1,
0.004897073, -1.591637, 3.600747, 0, 0, 0, 1, 1,
0.01146089, -0.4235886, 3.908398, 0, 0, 0, 1, 1,
0.01470088, -0.7807482, 3.210213, 1, 1, 1, 1, 1,
0.02996066, 0.2318818, 1.030362, 1, 1, 1, 1, 1,
0.03394618, -2.292659, 3.271107, 1, 1, 1, 1, 1,
0.03917157, -0.2518227, 1.382482, 1, 1, 1, 1, 1,
0.03946189, -1.074331, 2.744025, 1, 1, 1, 1, 1,
0.04363303, 0.7383603, -0.7817631, 1, 1, 1, 1, 1,
0.04778632, 1.573821, 0.7929245, 1, 1, 1, 1, 1,
0.04908312, 0.7065026, -1.535332, 1, 1, 1, 1, 1,
0.05439661, 1.004168, 0.1788441, 1, 1, 1, 1, 1,
0.06250116, 0.4514008, -0.6040478, 1, 1, 1, 1, 1,
0.06281238, 0.3545241, -0.6094021, 1, 1, 1, 1, 1,
0.06342591, 0.5984675, 0.7062974, 1, 1, 1, 1, 1,
0.06598967, 0.4730108, 1.529115, 1, 1, 1, 1, 1,
0.06650078, -0.7201051, 1.405204, 1, 1, 1, 1, 1,
0.06720039, 1.143082, -0.05882998, 1, 1, 1, 1, 1,
0.07356879, 2.571446, -0.8954127, 0, 0, 1, 1, 1,
0.07394469, 0.4436444, 0.9570049, 1, 0, 0, 1, 1,
0.07874591, 0.9572169, 0.6885189, 1, 0, 0, 1, 1,
0.07952221, 0.9809896, -0.3095806, 1, 0, 0, 1, 1,
0.07956218, -1.305881, 2.696557, 1, 0, 0, 1, 1,
0.08384863, -0.2635899, 3.087511, 1, 0, 0, 1, 1,
0.0859364, -2.15268, 2.461916, 0, 0, 0, 1, 1,
0.08598698, -0.3823005, 2.69717, 0, 0, 0, 1, 1,
0.08718368, 0.4809124, -1.81119, 0, 0, 0, 1, 1,
0.08742174, -1.440135, 1.422613, 0, 0, 0, 1, 1,
0.09188568, 0.2186602, 2.605961, 0, 0, 0, 1, 1,
0.09270996, 1.986392, -0.08420987, 0, 0, 0, 1, 1,
0.09331249, 0.9558842, 0.7749074, 0, 0, 0, 1, 1,
0.1029072, -0.1480678, 3.565055, 1, 1, 1, 1, 1,
0.1029777, -2.614671, 2.941382, 1, 1, 1, 1, 1,
0.1043889, -1.258033, 1.994644, 1, 1, 1, 1, 1,
0.1045487, 0.651284, -1.65367, 1, 1, 1, 1, 1,
0.1055295, -0.6989983, 5.148724, 1, 1, 1, 1, 1,
0.1058104, 1.808821, -0.5530083, 1, 1, 1, 1, 1,
0.1079934, 0.3278511, 0.3804884, 1, 1, 1, 1, 1,
0.1094879, -0.8176812, 3.278877, 1, 1, 1, 1, 1,
0.1128911, 1.017213, 1.718328, 1, 1, 1, 1, 1,
0.1151062, 0.1672983, 0.2743365, 1, 1, 1, 1, 1,
0.1199432, 0.550858, 1.461465, 1, 1, 1, 1, 1,
0.1294203, 0.3782235, 0.2490718, 1, 1, 1, 1, 1,
0.1298567, -0.02677531, 2.280763, 1, 1, 1, 1, 1,
0.1317993, 0.08557151, 1.064348, 1, 1, 1, 1, 1,
0.1347585, -0.7788928, 1.51962, 1, 1, 1, 1, 1,
0.135444, 0.9479669, 0.852777, 0, 0, 1, 1, 1,
0.1475369, 2.005382, -0.07461433, 1, 0, 0, 1, 1,
0.1498433, 0.5240133, -0.2876282, 1, 0, 0, 1, 1,
0.1507032, -1.076498, 2.944794, 1, 0, 0, 1, 1,
0.1558704, -0.8409547, 4.218299, 1, 0, 0, 1, 1,
0.1564718, -0.009518001, 2.257376, 1, 0, 0, 1, 1,
0.1568324, -0.2264095, 2.298262, 0, 0, 0, 1, 1,
0.1570181, -0.2190393, 2.784468, 0, 0, 0, 1, 1,
0.1591248, 0.1501976, 0.9861686, 0, 0, 0, 1, 1,
0.1622092, 1.106441, 0.05607124, 0, 0, 0, 1, 1,
0.1661707, -0.8790225, 3.530013, 0, 0, 0, 1, 1,
0.1664779, 2.147203, -0.7557044, 0, 0, 0, 1, 1,
0.1670314, 0.2373164, 0.1173671, 0, 0, 0, 1, 1,
0.1746745, -1.081882, 3.325016, 1, 1, 1, 1, 1,
0.1774042, 1.992206, 1.572916, 1, 1, 1, 1, 1,
0.1850659, 1.430226, -0.6986709, 1, 1, 1, 1, 1,
0.1853625, -0.6960033, 3.989566, 1, 1, 1, 1, 1,
0.1853817, 1.801214, -0.1417916, 1, 1, 1, 1, 1,
0.189339, -1.83983, 4.183568, 1, 1, 1, 1, 1,
0.1926398, 1.039333, -0.471261, 1, 1, 1, 1, 1,
0.1929582, -1.360164, 1.906816, 1, 1, 1, 1, 1,
0.2044871, -0.3763869, 3.627807, 1, 1, 1, 1, 1,
0.2054728, 0.9594175, 0.7775885, 1, 1, 1, 1, 1,
0.2078372, 1.886732, 0.3877362, 1, 1, 1, 1, 1,
0.2113065, 0.7116536, 2.1901, 1, 1, 1, 1, 1,
0.2151724, -0.8338184, 2.597555, 1, 1, 1, 1, 1,
0.2153939, 0.6285229, -0.9372352, 1, 1, 1, 1, 1,
0.2160659, 0.8140543, 0.5277383, 1, 1, 1, 1, 1,
0.2174254, 0.4098738, 1.40979, 0, 0, 1, 1, 1,
0.2235884, -1.768426, 3.419591, 1, 0, 0, 1, 1,
0.2242008, -0.546975, 3.313788, 1, 0, 0, 1, 1,
0.2247555, -0.6795937, 3.915533, 1, 0, 0, 1, 1,
0.2286918, -0.6534381, 4.113141, 1, 0, 0, 1, 1,
0.2287124, 0.1731699, 0.2250243, 1, 0, 0, 1, 1,
0.230445, -0.7003122, 1.543802, 0, 0, 0, 1, 1,
0.2343674, 0.5847591, 1.934198, 0, 0, 0, 1, 1,
0.2345431, 0.8953299, 1.133777, 0, 0, 0, 1, 1,
0.2360708, 0.8937335, 0.8353351, 0, 0, 0, 1, 1,
0.2369383, 0.0919422, 0.7154105, 0, 0, 0, 1, 1,
0.2390519, -0.4340976, 3.36231, 0, 0, 0, 1, 1,
0.2448819, -0.004986755, -0.3190401, 0, 0, 0, 1, 1,
0.2513796, -0.2989536, 2.002428, 1, 1, 1, 1, 1,
0.2532702, -1.781979, 2.659753, 1, 1, 1, 1, 1,
0.2579399, -1.303638, 2.193839, 1, 1, 1, 1, 1,
0.2597938, -1.642147, 4.272756, 1, 1, 1, 1, 1,
0.2599653, -1.087184, 3.272095, 1, 1, 1, 1, 1,
0.2646592, 0.3412066, -0.2127957, 1, 1, 1, 1, 1,
0.265903, 0.3419713, -0.2215488, 1, 1, 1, 1, 1,
0.2669946, -1.022183, 3.49171, 1, 1, 1, 1, 1,
0.2711371, -0.9642293, 2.049258, 1, 1, 1, 1, 1,
0.2739372, 0.518431, 1.072851, 1, 1, 1, 1, 1,
0.2749571, -2.567369, 1.882276, 1, 1, 1, 1, 1,
0.2778631, -1.851475, 2.999683, 1, 1, 1, 1, 1,
0.2787634, 0.1567014, 2.700515, 1, 1, 1, 1, 1,
0.2817599, -0.2157029, 2.14567, 1, 1, 1, 1, 1,
0.2818455, -0.1102109, 1.112106, 1, 1, 1, 1, 1,
0.2856449, 1.239859, 0.3761697, 0, 0, 1, 1, 1,
0.2899977, -0.9488825, 2.299853, 1, 0, 0, 1, 1,
0.2913933, -1.114818, 2.997685, 1, 0, 0, 1, 1,
0.305063, -1.715864, 3.847797, 1, 0, 0, 1, 1,
0.3083383, -0.04460136, 1.607428, 1, 0, 0, 1, 1,
0.3123447, -1.916433, 3.124921, 1, 0, 0, 1, 1,
0.3143259, 0.6019969, 1.931618, 0, 0, 0, 1, 1,
0.3157492, 0.8056555, 0.9344037, 0, 0, 0, 1, 1,
0.315875, 1.885497, 0.4651216, 0, 0, 0, 1, 1,
0.3210904, -0.3961596, 4.120436, 0, 0, 0, 1, 1,
0.3228461, 0.3564497, 0.2423742, 0, 0, 0, 1, 1,
0.3273195, -0.4877396, 0.9019873, 0, 0, 0, 1, 1,
0.3282317, 0.9955164, 1.348099, 0, 0, 0, 1, 1,
0.3289776, -0.4332629, 0.6857684, 1, 1, 1, 1, 1,
0.3301035, -1.999777, 3.152445, 1, 1, 1, 1, 1,
0.332732, -1.214967, 2.984574, 1, 1, 1, 1, 1,
0.3338636, -0.7984522, 2.664119, 1, 1, 1, 1, 1,
0.3344482, -1.72206, 3.294163, 1, 1, 1, 1, 1,
0.3361684, -0.5107694, 1.438216, 1, 1, 1, 1, 1,
0.336736, -0.9745595, 2.209985, 1, 1, 1, 1, 1,
0.3368869, -1.943881, 2.107785, 1, 1, 1, 1, 1,
0.3394244, 0.5694689, -0.9284036, 1, 1, 1, 1, 1,
0.339815, 0.0009157759, 1.619065, 1, 1, 1, 1, 1,
0.3462163, -1.097616, 2.574733, 1, 1, 1, 1, 1,
0.3513971, 0.1497084, -0.4386938, 1, 1, 1, 1, 1,
0.3566738, 1.371811, -0.1471551, 1, 1, 1, 1, 1,
0.3587084, -0.1533594, 1.362716, 1, 1, 1, 1, 1,
0.3606113, -0.8193821, 0.2872989, 1, 1, 1, 1, 1,
0.3611775, -2.160333, 3.514797, 0, 0, 1, 1, 1,
0.3612322, -0.6009465, 1.3181, 1, 0, 0, 1, 1,
0.3654562, -0.5493335, 3.799861, 1, 0, 0, 1, 1,
0.367052, -0.6778769, 1.625913, 1, 0, 0, 1, 1,
0.3749212, -0.1339116, 1.768552, 1, 0, 0, 1, 1,
0.3764236, -0.233345, 2.751926, 1, 0, 0, 1, 1,
0.3775258, 0.8491176, 0.9321417, 0, 0, 0, 1, 1,
0.3824183, 1.22787, 1.481644, 0, 0, 0, 1, 1,
0.3866197, -0.08329143, 1.371187, 0, 0, 0, 1, 1,
0.4011705, 0.9447811, 1.974526, 0, 0, 0, 1, 1,
0.4020094, 0.002661336, 1.124742, 0, 0, 0, 1, 1,
0.4046573, -0.205457, 0.4794001, 0, 0, 0, 1, 1,
0.4139407, -0.2478298, 3.83365, 0, 0, 0, 1, 1,
0.4163246, 0.2876587, 2.295728, 1, 1, 1, 1, 1,
0.4165705, 0.9036365, 1.252767, 1, 1, 1, 1, 1,
0.417229, 0.439079, 0.7481185, 1, 1, 1, 1, 1,
0.4173826, 1.638827, -1.001264, 1, 1, 1, 1, 1,
0.4182312, -0.3958753, 3.222743, 1, 1, 1, 1, 1,
0.4189665, -0.563089, 2.623435, 1, 1, 1, 1, 1,
0.4212363, 0.9245807, 2.27389, 1, 1, 1, 1, 1,
0.4229566, 0.08692414, 1.600798, 1, 1, 1, 1, 1,
0.4252091, -0.01049092, 1.27931, 1, 1, 1, 1, 1,
0.4268612, -0.4502957, 2.043255, 1, 1, 1, 1, 1,
0.4286488, 0.955834, 0.2691767, 1, 1, 1, 1, 1,
0.4299653, -1.396584, 2.393912, 1, 1, 1, 1, 1,
0.4330425, 1.143167, 1.908582, 1, 1, 1, 1, 1,
0.4348484, 0.7160432, 0.2392025, 1, 1, 1, 1, 1,
0.4378224, -1.546923, 3.65035, 1, 1, 1, 1, 1,
0.4454503, -0.1132282, 2.785743, 0, 0, 1, 1, 1,
0.4479303, -0.08217838, 2.515445, 1, 0, 0, 1, 1,
0.4486052, -0.5301446, 2.842518, 1, 0, 0, 1, 1,
0.4491536, 1.507048, -1.33831, 1, 0, 0, 1, 1,
0.4503758, -0.1519385, 2.629234, 1, 0, 0, 1, 1,
0.4535404, -1.056816, 3.8134, 1, 0, 0, 1, 1,
0.4536365, 0.1783656, 1.756071, 0, 0, 0, 1, 1,
0.4585297, 0.08593416, 0.8207334, 0, 0, 0, 1, 1,
0.4604853, -0.3079884, 3.293138, 0, 0, 0, 1, 1,
0.4636673, 0.6228102, 0.1818446, 0, 0, 0, 1, 1,
0.4647002, -0.1285567, 3.110396, 0, 0, 0, 1, 1,
0.4667888, 0.8013474, 1.337392, 0, 0, 0, 1, 1,
0.4685878, -2.007954, 4.537923, 0, 0, 0, 1, 1,
0.4716736, -0.665749, 2.638013, 1, 1, 1, 1, 1,
0.4720055, 1.031426, 0.8300261, 1, 1, 1, 1, 1,
0.4777372, 0.1362753, 1.077432, 1, 1, 1, 1, 1,
0.4781132, -1.005303, 2.289232, 1, 1, 1, 1, 1,
0.4833558, -0.1670223, 2.95983, 1, 1, 1, 1, 1,
0.4873312, 2.273542, -0.2376451, 1, 1, 1, 1, 1,
0.4921151, 0.1040068, 1.403977, 1, 1, 1, 1, 1,
0.5102709, 0.4152676, 1.561901, 1, 1, 1, 1, 1,
0.5103146, 0.6601185, -0.1451696, 1, 1, 1, 1, 1,
0.5109344, 0.1707075, -0.7322329, 1, 1, 1, 1, 1,
0.5118954, 1.365528, 1.953783, 1, 1, 1, 1, 1,
0.5185226, 0.2326888, 0.9545235, 1, 1, 1, 1, 1,
0.5249173, -0.06075484, 0.3289674, 1, 1, 1, 1, 1,
0.5251804, -0.9237115, 0.9608049, 1, 1, 1, 1, 1,
0.5282879, 0.07067022, -0.2123631, 1, 1, 1, 1, 1,
0.5293013, -0.3805743, 2.647359, 0, 0, 1, 1, 1,
0.5347573, -0.3081713, 2.89566, 1, 0, 0, 1, 1,
0.537653, 0.06299885, 1.13054, 1, 0, 0, 1, 1,
0.5396266, -0.07968607, 1.390675, 1, 0, 0, 1, 1,
0.5452886, -1.502849, 2.742871, 1, 0, 0, 1, 1,
0.548289, -0.7035628, 2.459001, 1, 0, 0, 1, 1,
0.5488378, -2.26218, 4.223114, 0, 0, 0, 1, 1,
0.5489998, -0.2420368, 3.107567, 0, 0, 0, 1, 1,
0.5510152, 0.1885993, 0.9575909, 0, 0, 0, 1, 1,
0.5568751, 0.04179474, 3.375437, 0, 0, 0, 1, 1,
0.5627356, 0.4516176, 0.9247078, 0, 0, 0, 1, 1,
0.5694422, -0.3043568, 1.438676, 0, 0, 0, 1, 1,
0.5702674, -0.3191077, 1.151275, 0, 0, 0, 1, 1,
0.5712429, -0.1242264, 2.342753, 1, 1, 1, 1, 1,
0.5713583, -0.1235994, 0.6813737, 1, 1, 1, 1, 1,
0.5719282, -0.3495711, 2.098606, 1, 1, 1, 1, 1,
0.576418, -0.306923, 1.793979, 1, 1, 1, 1, 1,
0.5772404, 1.669271, -0.5326507, 1, 1, 1, 1, 1,
0.5775005, 0.7720312, -0.1894483, 1, 1, 1, 1, 1,
0.5801853, 1.648975, 0.926514, 1, 1, 1, 1, 1,
0.5855442, 0.1784663, 1.615014, 1, 1, 1, 1, 1,
0.5907557, -0.8364932, 2.789306, 1, 1, 1, 1, 1,
0.5954962, -0.7334771, 1.174279, 1, 1, 1, 1, 1,
0.5999389, -1.613259, 3.331146, 1, 1, 1, 1, 1,
0.6012464, -2.004972, 3.637694, 1, 1, 1, 1, 1,
0.6087485, 0.2673503, 1.87395, 1, 1, 1, 1, 1,
0.6096427, 0.01212675, 1.745775, 1, 1, 1, 1, 1,
0.6206919, 2.051524, 0.1843917, 1, 1, 1, 1, 1,
0.6219926, -1.233484, 2.785468, 0, 0, 1, 1, 1,
0.6285084, 0.1212065, 1.536192, 1, 0, 0, 1, 1,
0.6290691, 0.2848476, 2.03145, 1, 0, 0, 1, 1,
0.6301588, -0.007923653, 3.159878, 1, 0, 0, 1, 1,
0.6347852, 1.071196, 0.9453002, 1, 0, 0, 1, 1,
0.6373416, 0.4088255, 0.6634623, 1, 0, 0, 1, 1,
0.6427565, -0.935361, 3.107981, 0, 0, 0, 1, 1,
0.6515425, 0.04720841, 0.5095852, 0, 0, 0, 1, 1,
0.6550369, 1.252362, 1.265605, 0, 0, 0, 1, 1,
0.6566861, 0.7692571, 1.972517, 0, 0, 0, 1, 1,
0.658215, -0.2238476, -0.6373792, 0, 0, 0, 1, 1,
0.6585357, 0.5398836, 1.706571, 0, 0, 0, 1, 1,
0.6587051, 0.9359915, 0.3759783, 0, 0, 0, 1, 1,
0.6610748, 0.7093279, 1.440257, 1, 1, 1, 1, 1,
0.6645119, 0.7316284, 0.06923857, 1, 1, 1, 1, 1,
0.6651437, -0.4809363, 0.7700718, 1, 1, 1, 1, 1,
0.6706396, 1.038012, 2.088039, 1, 1, 1, 1, 1,
0.6713539, 0.2072166, 0.8417232, 1, 1, 1, 1, 1,
0.6730218, 0.2554362, 1.33228, 1, 1, 1, 1, 1,
0.674977, -0.3593987, 0.9327531, 1, 1, 1, 1, 1,
0.6752433, 0.5528048, 0.1807322, 1, 1, 1, 1, 1,
0.6819318, 0.192593, 1.16293, 1, 1, 1, 1, 1,
0.6850898, -0.2120863, 1.549015, 1, 1, 1, 1, 1,
0.6860707, 0.2168286, 1.394951, 1, 1, 1, 1, 1,
0.6866069, -0.4861363, 2.077643, 1, 1, 1, 1, 1,
0.6880189, 1.068332, 1.095745, 1, 1, 1, 1, 1,
0.6915773, -2.753824, 2.235645, 1, 1, 1, 1, 1,
0.6934813, -0.5382503, 3.404854, 1, 1, 1, 1, 1,
0.695245, 0.05179792, 0.9750301, 0, 0, 1, 1, 1,
0.696613, 0.08559314, 1.33912, 1, 0, 0, 1, 1,
0.7042154, 2.487141, 0.8173176, 1, 0, 0, 1, 1,
0.711789, 1.612062, -0.3439495, 1, 0, 0, 1, 1,
0.7140561, 1.05831, 1.944794, 1, 0, 0, 1, 1,
0.7177613, -0.1022699, 1.906698, 1, 0, 0, 1, 1,
0.7183035, -0.5005235, 2.047772, 0, 0, 0, 1, 1,
0.7323232, -0.1407903, 2.093441, 0, 0, 0, 1, 1,
0.7332028, 0.6607445, 0.1956035, 0, 0, 0, 1, 1,
0.7360317, 1.864609, 0.3213253, 0, 0, 0, 1, 1,
0.7372999, -0.9730328, 2.667484, 0, 0, 0, 1, 1,
0.7379409, -1.402615, 2.648931, 0, 0, 0, 1, 1,
0.7424437, 0.7261307, 1.639015, 0, 0, 0, 1, 1,
0.74542, -0.9244469, 2.119276, 1, 1, 1, 1, 1,
0.7462665, -0.9128928, 1.065341, 1, 1, 1, 1, 1,
0.752413, -0.4131655, 3.667308, 1, 1, 1, 1, 1,
0.7576444, -2.040138, 1.392061, 1, 1, 1, 1, 1,
0.7606409, -0.4841725, 0.5942267, 1, 1, 1, 1, 1,
0.7621996, 0.2304421, 0.7075481, 1, 1, 1, 1, 1,
0.7641925, 0.03476264, 1.449616, 1, 1, 1, 1, 1,
0.7675313, 0.195076, 0.3436528, 1, 1, 1, 1, 1,
0.7721993, -0.5563398, 1.005002, 1, 1, 1, 1, 1,
0.7734954, 0.07801255, 3.429124, 1, 1, 1, 1, 1,
0.7759298, -2.437824, 1.907135, 1, 1, 1, 1, 1,
0.7792856, 0.2468433, 1.228124, 1, 1, 1, 1, 1,
0.7810678, 0.3698373, 1.292357, 1, 1, 1, 1, 1,
0.7811449, 0.7643639, 1.745406, 1, 1, 1, 1, 1,
0.7816618, 0.04592156, 1.810625, 1, 1, 1, 1, 1,
0.7859535, 0.1770237, 1.017236, 0, 0, 1, 1, 1,
0.7865929, -0.006089781, -0.6273441, 1, 0, 0, 1, 1,
0.7876659, 1.091419, 0.5517468, 1, 0, 0, 1, 1,
0.7953424, -0.9110264, 1.78599, 1, 0, 0, 1, 1,
0.7955391, -0.3274305, 1.549546, 1, 0, 0, 1, 1,
0.8026841, 1.039095, 0.6875101, 1, 0, 0, 1, 1,
0.8064302, 1.102504, 1.695564, 0, 0, 0, 1, 1,
0.8068289, -0.1360566, 2.093518, 0, 0, 0, 1, 1,
0.8094666, -0.1340588, 2.016964, 0, 0, 0, 1, 1,
0.8163152, -0.9220564, 3.852769, 0, 0, 0, 1, 1,
0.8167688, 0.06580091, 1.623212, 0, 0, 0, 1, 1,
0.817014, 0.1801582, 0.137811, 0, 0, 0, 1, 1,
0.8235791, 1.049564, 2.26423, 0, 0, 0, 1, 1,
0.8237571, -0.1842475, 1.277255, 1, 1, 1, 1, 1,
0.8284332, -1.306638, 0.5073161, 1, 1, 1, 1, 1,
0.8294166, 0.4464412, 1.007541, 1, 1, 1, 1, 1,
0.8337423, 0.4560038, 1.586144, 1, 1, 1, 1, 1,
0.8449975, -1.103845, 1.343918, 1, 1, 1, 1, 1,
0.8498994, 0.4520127, 0.5460974, 1, 1, 1, 1, 1,
0.852453, 0.1999765, 0.3422378, 1, 1, 1, 1, 1,
0.8557456, 0.14646, 0.3080644, 1, 1, 1, 1, 1,
0.8563161, -1.558985, 3.707355, 1, 1, 1, 1, 1,
0.8566539, 2.455067, 0.5452373, 1, 1, 1, 1, 1,
0.8581173, -0.1839167, 1.262915, 1, 1, 1, 1, 1,
0.8611772, -1.277712, 0.2932478, 1, 1, 1, 1, 1,
0.8624189, 0.4177247, 1.893052, 1, 1, 1, 1, 1,
0.8769397, -0.3753963, 2.895062, 1, 1, 1, 1, 1,
0.8777938, 0.7726138, -0.3146356, 1, 1, 1, 1, 1,
0.8789051, 1.153712, 1.012031, 0, 0, 1, 1, 1,
0.8866798, -0.1346538, 1.059428, 1, 0, 0, 1, 1,
0.8924815, -0.04517858, 2.241608, 1, 0, 0, 1, 1,
0.8954065, -0.4687396, 0.1693661, 1, 0, 0, 1, 1,
0.8957173, -0.3046344, 0.7497216, 1, 0, 0, 1, 1,
0.899501, -0.8021163, 1.92368, 1, 0, 0, 1, 1,
0.8999556, -2.749177, 2.864997, 0, 0, 0, 1, 1,
0.9051868, 0.05221459, 0.06816877, 0, 0, 0, 1, 1,
0.9053907, -0.09356022, 3.102631, 0, 0, 0, 1, 1,
0.9103719, 0.03089263, 1.80877, 0, 0, 0, 1, 1,
0.9158887, 1.019946, -1.210932, 0, 0, 0, 1, 1,
0.9186288, -0.4549474, 2.475445, 0, 0, 0, 1, 1,
0.9209304, -2.286322, 4.170975, 0, 0, 0, 1, 1,
0.9261373, -1.517382, 3.713187, 1, 1, 1, 1, 1,
0.9311273, 2.053287, 0.9695728, 1, 1, 1, 1, 1,
0.9342177, 0.1415317, 0.02503789, 1, 1, 1, 1, 1,
0.9374923, -1.562776, 2.069857, 1, 1, 1, 1, 1,
0.9412222, 0.8121256, 2.535084, 1, 1, 1, 1, 1,
0.9438791, 0.267295, 2.044631, 1, 1, 1, 1, 1,
0.9474525, 0.05532332, 1.643987, 1, 1, 1, 1, 1,
0.9475276, 1.022882, 1.233919, 1, 1, 1, 1, 1,
0.9485399, 1.943083, 0.4347573, 1, 1, 1, 1, 1,
0.9489538, 0.5087691, 0.6555963, 1, 1, 1, 1, 1,
0.9498275, -0.3911885, 2.274833, 1, 1, 1, 1, 1,
0.9502369, 0.1010747, 1.132731, 1, 1, 1, 1, 1,
0.9654884, -0.24475, 2.013153, 1, 1, 1, 1, 1,
0.9665007, -0.2383252, 1.394767, 1, 1, 1, 1, 1,
0.9709124, -0.9837616, 2.795141, 1, 1, 1, 1, 1,
0.9714015, -0.2972572, 1.017592, 0, 0, 1, 1, 1,
0.9733421, -1.971429, 2.235093, 1, 0, 0, 1, 1,
0.9821854, -0.7179792, 2.810327, 1, 0, 0, 1, 1,
0.9846365, -0.2132858, 1.120355, 1, 0, 0, 1, 1,
0.9869334, -1.976348, 3.213728, 1, 0, 0, 1, 1,
0.9910228, 1.044763, 0.4500905, 1, 0, 0, 1, 1,
0.9914261, -0.669063, 3.831894, 0, 0, 0, 1, 1,
0.9936962, 0.7198514, -0.6052527, 0, 0, 0, 1, 1,
0.9958952, -1.400246, 4.607593, 0, 0, 0, 1, 1,
0.9967562, -0.5614495, 2.233566, 0, 0, 0, 1, 1,
1.018569, -0.1585243, 0.8514134, 0, 0, 0, 1, 1,
1.019295, 0.7131519, 1.34431, 0, 0, 0, 1, 1,
1.024593, 0.6596174, -0.9233989, 0, 0, 0, 1, 1,
1.025693, 0.9274588, 1.192979, 1, 1, 1, 1, 1,
1.034031, -0.1721507, 0.54898, 1, 1, 1, 1, 1,
1.036592, -1.503316, 1.251845, 1, 1, 1, 1, 1,
1.038198, 1.010182, 1.169976, 1, 1, 1, 1, 1,
1.039156, -1.408301, 3.235733, 1, 1, 1, 1, 1,
1.039545, 0.6793206, -0.1378749, 1, 1, 1, 1, 1,
1.041228, -0.8104532, 3.624251, 1, 1, 1, 1, 1,
1.046797, 1.453077, 1.030205, 1, 1, 1, 1, 1,
1.046979, 0.8529819, 1.32448, 1, 1, 1, 1, 1,
1.047129, -1.814449, 3.312163, 1, 1, 1, 1, 1,
1.05958, 0.438668, 1.496047, 1, 1, 1, 1, 1,
1.060924, 1.816904, 1.281241, 1, 1, 1, 1, 1,
1.067818, 0.7391723, -0.5349789, 1, 1, 1, 1, 1,
1.074858, -1.638255, 3.585038, 1, 1, 1, 1, 1,
1.07564, 1.06223, 1.54629, 1, 1, 1, 1, 1,
1.078073, 0.625169, 1.141831, 0, 0, 1, 1, 1,
1.07816, 0.3452957, 1.373715, 1, 0, 0, 1, 1,
1.079501, -1.011983, 3.377818, 1, 0, 0, 1, 1,
1.094366, -0.3653111, 1.243168, 1, 0, 0, 1, 1,
1.09646, 0.08519349, 2.30634, 1, 0, 0, 1, 1,
1.097992, 1.177661, 0.1789166, 1, 0, 0, 1, 1,
1.103818, 0.1518817, 0.2931964, 0, 0, 0, 1, 1,
1.106377, 3.572307, 0.06600048, 0, 0, 0, 1, 1,
1.114214, -1.410404, 2.47654, 0, 0, 0, 1, 1,
1.114682, 0.2454726, 0.2710944, 0, 0, 0, 1, 1,
1.117118, -0.2674231, 1.15941, 0, 0, 0, 1, 1,
1.123129, 0.206262, 1.702516, 0, 0, 0, 1, 1,
1.125451, -0.8269812, 3.489968, 0, 0, 0, 1, 1,
1.127764, 0.1785343, 1.733565, 1, 1, 1, 1, 1,
1.130131, -0.4904945, 2.019716, 1, 1, 1, 1, 1,
1.131217, 0.3612149, 1.074937, 1, 1, 1, 1, 1,
1.134706, -0.02593986, 1.604409, 1, 1, 1, 1, 1,
1.141409, -0.3903616, 2.47543, 1, 1, 1, 1, 1,
1.143596, -0.4861919, 3.158657, 1, 1, 1, 1, 1,
1.163572, -2.295323, 2.582049, 1, 1, 1, 1, 1,
1.17712, 1.512541, 0.1763077, 1, 1, 1, 1, 1,
1.1801, -1.296692, 2.711292, 1, 1, 1, 1, 1,
1.182763, -0.3915497, 2.589425, 1, 1, 1, 1, 1,
1.183024, 1.690968, 1.223317, 1, 1, 1, 1, 1,
1.183657, 0.1155984, 2.427461, 1, 1, 1, 1, 1,
1.199003, 0.3524568, 2.310462, 1, 1, 1, 1, 1,
1.20293, -1.283223, 1.366568, 1, 1, 1, 1, 1,
1.213007, -0.9824711, 2.077432, 1, 1, 1, 1, 1,
1.214623, 0.004265124, 0.6346899, 0, 0, 1, 1, 1,
1.215304, 0.6060086, 1.598276, 1, 0, 0, 1, 1,
1.215692, 0.07869091, 0.1765482, 1, 0, 0, 1, 1,
1.225129, 1.685971, 1.446924, 1, 0, 0, 1, 1,
1.227147, 0.759311, 1.330489, 1, 0, 0, 1, 1,
1.239145, 0.3038249, 0.5233735, 1, 0, 0, 1, 1,
1.24954, 0.6671928, 2.10398, 0, 0, 0, 1, 1,
1.253349, 0.6198258, -0.2214858, 0, 0, 0, 1, 1,
1.257136, -0.3363502, 0.2393371, 0, 0, 0, 1, 1,
1.291363, 0.5418099, 0.1946519, 0, 0, 0, 1, 1,
1.302066, 0.5321605, 2.450738, 0, 0, 0, 1, 1,
1.303367, 0.7365906, 2.855759, 0, 0, 0, 1, 1,
1.312619, -0.1796482, 2.915484, 0, 0, 0, 1, 1,
1.316488, 0.2003648, 3.525506, 1, 1, 1, 1, 1,
1.323496, 0.7945181, 1.746121, 1, 1, 1, 1, 1,
1.326862, 0.5963934, -0.2664565, 1, 1, 1, 1, 1,
1.333237, -1.282455, 3.324698, 1, 1, 1, 1, 1,
1.33449, -1.593091, 2.301921, 1, 1, 1, 1, 1,
1.33478, 0.5431228, 2.20084, 1, 1, 1, 1, 1,
1.33482, -0.5222078, 1.476787, 1, 1, 1, 1, 1,
1.335107, -0.6576027, -0.4184695, 1, 1, 1, 1, 1,
1.360447, 1.513948, -0.1488287, 1, 1, 1, 1, 1,
1.368556, 0.05362178, 1.523655, 1, 1, 1, 1, 1,
1.37427, 0.002789323, 1.369046, 1, 1, 1, 1, 1,
1.377607, -0.4887219, 2.413178, 1, 1, 1, 1, 1,
1.394752, 1.927866, -2.002551, 1, 1, 1, 1, 1,
1.399571, -0.2391428, -0.3276005, 1, 1, 1, 1, 1,
1.404162, -1.337234, 0.3414389, 1, 1, 1, 1, 1,
1.406183, -0.3018663, 2.236344, 0, 0, 1, 1, 1,
1.406193, -0.005301271, 1.44307, 1, 0, 0, 1, 1,
1.411658, 0.1687989, 3.038701, 1, 0, 0, 1, 1,
1.420908, 1.54952, -1.311275, 1, 0, 0, 1, 1,
1.422071, -0.2870713, 1.455456, 1, 0, 0, 1, 1,
1.430251, -1.798362, 1.951017, 1, 0, 0, 1, 1,
1.431937, 0.9093493, 2.875511, 0, 0, 0, 1, 1,
1.445303, 0.8573691, 1.321888, 0, 0, 0, 1, 1,
1.447521, -0.3978107, 2.055103, 0, 0, 0, 1, 1,
1.456822, 0.3849335, 2.006237, 0, 0, 0, 1, 1,
1.467114, -0.180072, 0.6376556, 0, 0, 0, 1, 1,
1.492644, 0.3196979, 2.659509, 0, 0, 0, 1, 1,
1.500957, -2.359589, 3.423401, 0, 0, 0, 1, 1,
1.507837, 1.117972, 1.084058, 1, 1, 1, 1, 1,
1.51635, 0.9458097, 1.364537, 1, 1, 1, 1, 1,
1.534131, 1.078707, 1.678388, 1, 1, 1, 1, 1,
1.535416, -0.5274493, 2.016297, 1, 1, 1, 1, 1,
1.550422, 1.142943, 2.714779, 1, 1, 1, 1, 1,
1.565487, 0.1548326, 2.537568, 1, 1, 1, 1, 1,
1.568292, -0.4706569, 2.369649, 1, 1, 1, 1, 1,
1.5949, 0.7473128, 0.207013, 1, 1, 1, 1, 1,
1.597603, -1.18426, 1.013091, 1, 1, 1, 1, 1,
1.610658, -0.4693728, 1.94955, 1, 1, 1, 1, 1,
1.637449, 0.4281342, 1.575104, 1, 1, 1, 1, 1,
1.641476, 0.6418497, 0.8239047, 1, 1, 1, 1, 1,
1.647982, -0.7983479, 1.109779, 1, 1, 1, 1, 1,
1.654796, -0.3076842, 0.3115094, 1, 1, 1, 1, 1,
1.67228, -2.418936, 2.538187, 1, 1, 1, 1, 1,
1.682227, 0.4301071, 0.2281469, 0, 0, 1, 1, 1,
1.682944, 1.560798, 0.1909081, 1, 0, 0, 1, 1,
1.699224, 1.872638, 0.4263479, 1, 0, 0, 1, 1,
1.709612, 0.1641875, 1.10885, 1, 0, 0, 1, 1,
1.719985, -1.518864, 3.358641, 1, 0, 0, 1, 1,
1.721378, -1.064472, 3.252631, 1, 0, 0, 1, 1,
1.723875, 1.669144, 1.889454, 0, 0, 0, 1, 1,
1.737067, -0.5709416, 1.871453, 0, 0, 0, 1, 1,
1.749427, 0.12174, 1.745802, 0, 0, 0, 1, 1,
1.766328, -0.02522187, 0.4009342, 0, 0, 0, 1, 1,
1.768853, 1.044056, 2.090251, 0, 0, 0, 1, 1,
1.802822, 0.1425725, 1.897657, 0, 0, 0, 1, 1,
1.810984, 1.54045, 1.229149, 0, 0, 0, 1, 1,
1.811939, -0.7556262, 3.162879, 1, 1, 1, 1, 1,
1.82432, 0.102625, 1.078857, 1, 1, 1, 1, 1,
1.824866, -1.026974, 1.726914, 1, 1, 1, 1, 1,
1.851197, 0.7948417, -0.03574926, 1, 1, 1, 1, 1,
1.875188, -1.033668, 1.404506, 1, 1, 1, 1, 1,
1.891788, 0.7500507, 1.022821, 1, 1, 1, 1, 1,
1.909986, -1.16749, 1.440609, 1, 1, 1, 1, 1,
1.935078, -1.530495, 1.804611, 1, 1, 1, 1, 1,
1.941478, 1.023507, 0.01417109, 1, 1, 1, 1, 1,
1.949305, 0.2364607, 0.2521175, 1, 1, 1, 1, 1,
1.95114, 1.164858, 2.952644, 1, 1, 1, 1, 1,
1.983978, 0.2814625, 1.613856, 1, 1, 1, 1, 1,
2.038656, 0.01626498, 0.7370425, 1, 1, 1, 1, 1,
2.05794, -0.3163742, 0.685229, 1, 1, 1, 1, 1,
2.069447, -0.3645364, 0.9230561, 1, 1, 1, 1, 1,
2.11872, 1.682516, 1.688523, 0, 0, 1, 1, 1,
2.127244, -1.682934, 2.783763, 1, 0, 0, 1, 1,
2.173626, -1.183151, 0.637136, 1, 0, 0, 1, 1,
2.189443, -0.7654255, 0.6833971, 1, 0, 0, 1, 1,
2.224548, 0.8718497, 1.587167, 1, 0, 0, 1, 1,
2.23436, -0.2114683, 1.325209, 1, 0, 0, 1, 1,
2.247211, 1.652862, 1.125223, 0, 0, 0, 1, 1,
2.261836, -0.4805537, 2.236891, 0, 0, 0, 1, 1,
2.272285, 0.8122955, -0.1872554, 0, 0, 0, 1, 1,
2.290902, -0.4554453, 1.864447, 0, 0, 0, 1, 1,
2.312704, 0.6243126, 2.609504, 0, 0, 0, 1, 1,
2.316671, -1.893652, 2.694053, 0, 0, 0, 1, 1,
2.330182, 2.075897, 0.574064, 0, 0, 0, 1, 1,
2.396209, 0.7145464, 0.1288507, 1, 1, 1, 1, 1,
2.457351, 0.7934232, 1.63885, 1, 1, 1, 1, 1,
2.794965, -0.5931977, 3.222612, 1, 1, 1, 1, 1,
2.81598, -0.4980508, 2.648407, 1, 1, 1, 1, 1,
2.822139, 0.4436012, 0.6836241, 1, 1, 1, 1, 1,
2.830636, -0.07523664, 0.7624781, 1, 1, 1, 1, 1,
3.312325, 0.5684563, 1.98008, 1, 1, 1, 1, 1
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
var radius = 9.579619;
var distance = 33.64801;
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
mvMatrix.translate( -0.1733397, -0.4092411, 0.2839978 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64801);
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