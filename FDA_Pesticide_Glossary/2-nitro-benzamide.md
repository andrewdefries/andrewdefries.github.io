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
-3.189877, -1.150632, -2.458716, 1, 0, 0, 1,
-3.038872, 0.07420491, -1.818577, 1, 0.007843138, 0, 1,
-2.903554, 0.342057, -0.05483743, 1, 0.01176471, 0, 1,
-2.848594, 1.794591, 0.76013, 1, 0.01960784, 0, 1,
-2.750973, -0.3284425, -1.063395, 1, 0.02352941, 0, 1,
-2.673634, 0.8100628, -1.879888, 1, 0.03137255, 0, 1,
-2.582423, 1.016586, -1.291524, 1, 0.03529412, 0, 1,
-2.532327, 1.305469, -0.7397618, 1, 0.04313726, 0, 1,
-2.379821, -1.750178, -2.005954, 1, 0.04705882, 0, 1,
-2.345771, -0.3291137, -1.102652, 1, 0.05490196, 0, 1,
-2.343244, -2.600379, -5.714663, 1, 0.05882353, 0, 1,
-2.340787, -0.1953321, -2.589504, 1, 0.06666667, 0, 1,
-2.338843, -0.464752, -1.760785, 1, 0.07058824, 0, 1,
-2.296965, 0.5177597, -1.168794, 1, 0.07843138, 0, 1,
-2.290637, -0.319706, -1.342853, 1, 0.08235294, 0, 1,
-2.259466, -1.067347, -1.353061, 1, 0.09019608, 0, 1,
-2.255886, -0.4635381, -1.329859, 1, 0.09411765, 0, 1,
-2.20944, 0.03482459, -0.8798733, 1, 0.1019608, 0, 1,
-2.201782, 0.2284224, -0.4059275, 1, 0.1098039, 0, 1,
-2.193095, -0.6021762, 0.1855781, 1, 0.1137255, 0, 1,
-2.189147, 0.8025833, -1.512495, 1, 0.1215686, 0, 1,
-2.177488, -0.2666765, -0.9927757, 1, 0.1254902, 0, 1,
-2.122202, 0.04146262, -2.340266, 1, 0.1333333, 0, 1,
-2.115962, -1.557064, -2.484398, 1, 0.1372549, 0, 1,
-2.114116, -0.1111013, -1.664493, 1, 0.145098, 0, 1,
-2.097386, -1.020179, -2.971702, 1, 0.1490196, 0, 1,
-2.071809, -0.940595, -1.049243, 1, 0.1568628, 0, 1,
-2.011725, -0.1963074, -1.574253, 1, 0.1607843, 0, 1,
-1.9898, -0.0002253919, -1.871065, 1, 0.1686275, 0, 1,
-1.970447, -0.09077719, -1.991547, 1, 0.172549, 0, 1,
-1.930737, -0.2724047, -2.656687, 1, 0.1803922, 0, 1,
-1.925529, 1.128485, -2.577164, 1, 0.1843137, 0, 1,
-1.922978, -2.223547, -1.965611, 1, 0.1921569, 0, 1,
-1.91133, -0.738216, -0.4812841, 1, 0.1960784, 0, 1,
-1.886888, 0.6351419, -2.298839, 1, 0.2039216, 0, 1,
-1.874244, -0.2816183, -0.3968722, 1, 0.2117647, 0, 1,
-1.870839, -0.5205485, -1.128859, 1, 0.2156863, 0, 1,
-1.86853, 2.367399, 0.1353551, 1, 0.2235294, 0, 1,
-1.828209, 0.9933026, -1.416412, 1, 0.227451, 0, 1,
-1.795548, 0.03283204, -1.349436, 1, 0.2352941, 0, 1,
-1.788845, -0.3485543, -1.812722, 1, 0.2392157, 0, 1,
-1.788573, 1.178808, -0.192429, 1, 0.2470588, 0, 1,
-1.778232, -0.4120027, -1.717201, 1, 0.2509804, 0, 1,
-1.77787, -0.05226872, -2.917744, 1, 0.2588235, 0, 1,
-1.776312, -1.700451, -2.057927, 1, 0.2627451, 0, 1,
-1.748534, 0.1958813, -1.452394, 1, 0.2705882, 0, 1,
-1.744569, 0.3280957, -2.400766, 1, 0.2745098, 0, 1,
-1.739456, -1.666416, -0.1525869, 1, 0.282353, 0, 1,
-1.725685, 0.5589203, -1.462086, 1, 0.2862745, 0, 1,
-1.697373, 0.8348994, -0.8650546, 1, 0.2941177, 0, 1,
-1.692665, 0.2085266, -1.123743, 1, 0.3019608, 0, 1,
-1.687407, -0.9904788, -2.690024, 1, 0.3058824, 0, 1,
-1.681649, 0.7806402, -0.1685776, 1, 0.3137255, 0, 1,
-1.672329, -0.2051098, -1.90257, 1, 0.3176471, 0, 1,
-1.669057, 2.478947, -0.02969719, 1, 0.3254902, 0, 1,
-1.651789, -1.52849, -2.970725, 1, 0.3294118, 0, 1,
-1.638647, -0.5975077, -1.351324, 1, 0.3372549, 0, 1,
-1.637972, 1.189401, -0.6412265, 1, 0.3411765, 0, 1,
-1.63273, 0.8218057, 1.870738, 1, 0.3490196, 0, 1,
-1.63098, 0.2358685, -1.979983, 1, 0.3529412, 0, 1,
-1.614166, 0.4739365, -2.572958, 1, 0.3607843, 0, 1,
-1.584553, 0.5054937, -0.8191816, 1, 0.3647059, 0, 1,
-1.579584, -1.104896, -0.1108817, 1, 0.372549, 0, 1,
-1.567626, 1.05942, 0.04228394, 1, 0.3764706, 0, 1,
-1.560645, -0.6771708, -1.092556, 1, 0.3843137, 0, 1,
-1.557052, 0.2402282, -2.239581, 1, 0.3882353, 0, 1,
-1.544636, 0.1466044, -0.3174523, 1, 0.3960784, 0, 1,
-1.542613, 1.220497, -0.5719057, 1, 0.4039216, 0, 1,
-1.532355, 2.268164, -0.8027822, 1, 0.4078431, 0, 1,
-1.528556, 1.616515, -0.9189942, 1, 0.4156863, 0, 1,
-1.508973, 0.2410078, -0.9539074, 1, 0.4196078, 0, 1,
-1.507922, 0.09327347, -2.336967, 1, 0.427451, 0, 1,
-1.502045, -1.873222, 1.297819, 1, 0.4313726, 0, 1,
-1.487498, -1.237211, -3.046584, 1, 0.4392157, 0, 1,
-1.477933, 0.4736877, -1.588202, 1, 0.4431373, 0, 1,
-1.475915, 0.126887, -2.102003, 1, 0.4509804, 0, 1,
-1.474332, -0.007640354, -1.092387, 1, 0.454902, 0, 1,
-1.472832, -0.9716199, -1.698871, 1, 0.4627451, 0, 1,
-1.465466, 0.1619791, -1.391068, 1, 0.4666667, 0, 1,
-1.459066, 0.7330598, -1.670391, 1, 0.4745098, 0, 1,
-1.45771, 1.713201, -0.9802939, 1, 0.4784314, 0, 1,
-1.454457, -1.655286, -2.378825, 1, 0.4862745, 0, 1,
-1.449773, 0.5118042, -2.707665, 1, 0.4901961, 0, 1,
-1.442395, -1.070779, -1.621272, 1, 0.4980392, 0, 1,
-1.410889, -1.203982, -1.36443, 1, 0.5058824, 0, 1,
-1.398224, -2.436833, -1.913301, 1, 0.509804, 0, 1,
-1.398093, 0.1855381, -0.247255, 1, 0.5176471, 0, 1,
-1.397852, 1.128409, -0.4486805, 1, 0.5215687, 0, 1,
-1.397554, 0.1284461, -1.36534, 1, 0.5294118, 0, 1,
-1.392814, 0.5080656, -2.419378, 1, 0.5333334, 0, 1,
-1.384612, 0.2911009, -1.604609, 1, 0.5411765, 0, 1,
-1.361523, 0.3758284, -2.248718, 1, 0.5450981, 0, 1,
-1.358586, -0.6066679, -2.729627, 1, 0.5529412, 0, 1,
-1.352152, -0.003984639, -2.471571, 1, 0.5568628, 0, 1,
-1.349943, 2.166821, 0.1606964, 1, 0.5647059, 0, 1,
-1.344675, 1.458267, -0.4775241, 1, 0.5686275, 0, 1,
-1.341735, 0.3177437, -0.9127798, 1, 0.5764706, 0, 1,
-1.333047, 0.245563, -2.875909, 1, 0.5803922, 0, 1,
-1.325978, -0.3920753, -1.475074, 1, 0.5882353, 0, 1,
-1.30609, -0.638943, -1.511127, 1, 0.5921569, 0, 1,
-1.297442, -0.03787367, -2.392615, 1, 0.6, 0, 1,
-1.29456, -0.4107035, -2.352217, 1, 0.6078432, 0, 1,
-1.289882, 0.6962221, -1.15867, 1, 0.6117647, 0, 1,
-1.28386, 0.04450968, -1.467751, 1, 0.6196079, 0, 1,
-1.281388, -0.1469667, -2.353243, 1, 0.6235294, 0, 1,
-1.278929, -1.132318, -0.5921338, 1, 0.6313726, 0, 1,
-1.255533, -0.7913685, -2.89293, 1, 0.6352941, 0, 1,
-1.251694, 0.7728863, -2.684982, 1, 0.6431373, 0, 1,
-1.251309, -0.07476162, -2.313739, 1, 0.6470588, 0, 1,
-1.250168, 1.166835, -0.8204093, 1, 0.654902, 0, 1,
-1.244635, -0.86985, -3.459294, 1, 0.6588235, 0, 1,
-1.240921, -0.4106807, -1.21847, 1, 0.6666667, 0, 1,
-1.240467, -0.2068002, -0.484303, 1, 0.6705883, 0, 1,
-1.229765, -0.9774349, -2.892369, 1, 0.6784314, 0, 1,
-1.22429, -0.2262696, -3.236451, 1, 0.682353, 0, 1,
-1.220961, -0.4042734, -3.141975, 1, 0.6901961, 0, 1,
-1.21912, -0.3700617, -2.151269, 1, 0.6941177, 0, 1,
-1.211932, -0.3212796, -3.556849, 1, 0.7019608, 0, 1,
-1.211437, 1.018365, -1.234333, 1, 0.7098039, 0, 1,
-1.194246, 1.341997, -0.1627544, 1, 0.7137255, 0, 1,
-1.187827, 0.4275538, -2.751011, 1, 0.7215686, 0, 1,
-1.18652, 0.1862738, -1.008812, 1, 0.7254902, 0, 1,
-1.175308, 1.838695, -0.8593325, 1, 0.7333333, 0, 1,
-1.163115, 0.293614, -0.6468803, 1, 0.7372549, 0, 1,
-1.162701, -0.5232383, -1.755866, 1, 0.7450981, 0, 1,
-1.156996, -2.06724, -1.908736, 1, 0.7490196, 0, 1,
-1.150797, 0.1972152, -2.539034, 1, 0.7568628, 0, 1,
-1.150037, 1.388189, 0.5228854, 1, 0.7607843, 0, 1,
-1.145884, 1.797062, -1.110889, 1, 0.7686275, 0, 1,
-1.142367, -0.3558613, -0.6781643, 1, 0.772549, 0, 1,
-1.140713, 0.512896, -2.822803, 1, 0.7803922, 0, 1,
-1.1396, -1.497929, -2.355205, 1, 0.7843137, 0, 1,
-1.134317, 0.3322926, 0.6776286, 1, 0.7921569, 0, 1,
-1.134107, 1.081529, -0.3894546, 1, 0.7960784, 0, 1,
-1.130165, -0.609967, -4.044149, 1, 0.8039216, 0, 1,
-1.126229, -0.8495954, -3.119205, 1, 0.8117647, 0, 1,
-1.122997, 0.4681154, -1.284024, 1, 0.8156863, 0, 1,
-1.109912, -0.8141964, -2.639759, 1, 0.8235294, 0, 1,
-1.108223, 0.4784724, -2.168437, 1, 0.827451, 0, 1,
-1.105914, 0.1741844, -2.051043, 1, 0.8352941, 0, 1,
-1.102643, -0.1106254, -0.9084179, 1, 0.8392157, 0, 1,
-1.101091, 1.658641, -1.452335, 1, 0.8470588, 0, 1,
-1.096772, 0.7367247, -0.4866716, 1, 0.8509804, 0, 1,
-1.09477, -0.6243525, -1.570074, 1, 0.8588235, 0, 1,
-1.088669, 0.6205988, 0.1011417, 1, 0.8627451, 0, 1,
-1.075189, -0.9401324, -1.344671, 1, 0.8705882, 0, 1,
-1.070438, 0.2196507, -0.6776116, 1, 0.8745098, 0, 1,
-1.061859, -1.704826, -1.783763, 1, 0.8823529, 0, 1,
-1.060971, 0.1336368, -0.6227891, 1, 0.8862745, 0, 1,
-1.060073, 0.1757132, -2.617056, 1, 0.8941177, 0, 1,
-1.059524, -1.126054, -1.492503, 1, 0.8980392, 0, 1,
-1.058948, -2.837273, -1.270613, 1, 0.9058824, 0, 1,
-1.047702, -1.905819, -1.022021, 1, 0.9137255, 0, 1,
-1.044616, 0.3326481, -0.4490809, 1, 0.9176471, 0, 1,
-1.042421, -1.784266, -1.38136, 1, 0.9254902, 0, 1,
-1.038885, 0.1255814, -2.251595, 1, 0.9294118, 0, 1,
-1.033208, -0.270458, -2.479683, 1, 0.9372549, 0, 1,
-1.031124, 0.2932346, -0.3744749, 1, 0.9411765, 0, 1,
-1.025845, 1.141523, 0.640245, 1, 0.9490196, 0, 1,
-1.025148, -1.295218, -1.147813, 1, 0.9529412, 0, 1,
-1.02142, -0.921527, -1.866528, 1, 0.9607843, 0, 1,
-1.018259, 1.11407, -1.265709, 1, 0.9647059, 0, 1,
-1.017493, -0.9968867, -1.857049, 1, 0.972549, 0, 1,
-1.0166, 0.1190073, -0.2182451, 1, 0.9764706, 0, 1,
-1.014428, 0.4882068, -0.293797, 1, 0.9843137, 0, 1,
-1.013908, 0.2017117, -1.649471, 1, 0.9882353, 0, 1,
-1.006006, 0.2324858, -0.9008695, 1, 0.9960784, 0, 1,
-1.004608, 0.5469756, -1.859303, 0.9960784, 1, 0, 1,
-1.00262, -1.640292, -1.813326, 0.9921569, 1, 0, 1,
-1.002378, -0.8341997, -1.701964, 0.9843137, 1, 0, 1,
-1.001511, 0.530662, -1.110613, 0.9803922, 1, 0, 1,
-0.9995707, -1.322671, -1.633822, 0.972549, 1, 0, 1,
-0.9984227, -0.09234799, -2.63549, 0.9686275, 1, 0, 1,
-0.996418, 0.1502941, -2.072937, 0.9607843, 1, 0, 1,
-0.9957697, 2.765417, 0.5292609, 0.9568627, 1, 0, 1,
-0.9905664, 0.4534697, -2.011542, 0.9490196, 1, 0, 1,
-0.9884501, -0.2245219, -2.79045, 0.945098, 1, 0, 1,
-0.985, 0.9338506, -1.405356, 0.9372549, 1, 0, 1,
-0.9827377, 2.149035, 2.083315, 0.9333333, 1, 0, 1,
-0.9822841, -0.8126897, -1.211303, 0.9254902, 1, 0, 1,
-0.9802324, 0.146875, -2.846235, 0.9215686, 1, 0, 1,
-0.9783812, -0.5533568, -1.452121, 0.9137255, 1, 0, 1,
-0.9770122, 0.6140885, 0.6208714, 0.9098039, 1, 0, 1,
-0.969384, 1.251082, -2.879485, 0.9019608, 1, 0, 1,
-0.9685935, 0.670935, -0.627239, 0.8941177, 1, 0, 1,
-0.9601759, 0.6059116, -0.1734405, 0.8901961, 1, 0, 1,
-0.9581106, 0.7168458, -1.344257, 0.8823529, 1, 0, 1,
-0.9538097, 0.8426907, -1.092492, 0.8784314, 1, 0, 1,
-0.953243, -0.6463253, -2.755013, 0.8705882, 1, 0, 1,
-0.9475783, -1.791906, -2.149804, 0.8666667, 1, 0, 1,
-0.9400997, 1.584455, -1.725444, 0.8588235, 1, 0, 1,
-0.9377317, 0.02477185, -2.033609, 0.854902, 1, 0, 1,
-0.9193102, 0.2797914, -1.272963, 0.8470588, 1, 0, 1,
-0.9187791, 0.3983142, -0.740555, 0.8431373, 1, 0, 1,
-0.9076921, 0.2999292, -2.181442, 0.8352941, 1, 0, 1,
-0.9026501, 0.4252477, -0.05505484, 0.8313726, 1, 0, 1,
-0.9002355, -0.7889661, -3.345605, 0.8235294, 1, 0, 1,
-0.8997999, -0.2773811, -1.433977, 0.8196079, 1, 0, 1,
-0.8990754, 1.088132, -0.5647184, 0.8117647, 1, 0, 1,
-0.8988646, -0.3391016, -2.952819, 0.8078431, 1, 0, 1,
-0.8958051, -0.6715614, -1.435155, 0.8, 1, 0, 1,
-0.8949016, -0.5620378, -3.146142, 0.7921569, 1, 0, 1,
-0.8943626, 0.5961159, 0.08311256, 0.7882353, 1, 0, 1,
-0.8934573, 0.2743187, -1.795271, 0.7803922, 1, 0, 1,
-0.890478, -0.3338238, -2.912073, 0.7764706, 1, 0, 1,
-0.8889452, -0.08052341, -2.839561, 0.7686275, 1, 0, 1,
-0.88544, -0.8285528, -3.032668, 0.7647059, 1, 0, 1,
-0.8769297, -1.379564, -2.987374, 0.7568628, 1, 0, 1,
-0.8766305, -0.02856291, -1.324605, 0.7529412, 1, 0, 1,
-0.8743301, -1.204127, -3.178762, 0.7450981, 1, 0, 1,
-0.8741106, -1.968426, -1.950729, 0.7411765, 1, 0, 1,
-0.8704275, 0.7093822, -0.4228483, 0.7333333, 1, 0, 1,
-0.8697324, 0.4091205, -1.762839, 0.7294118, 1, 0, 1,
-0.8594547, -1.36878, -3.454282, 0.7215686, 1, 0, 1,
-0.8569688, -0.09930241, -2.304375, 0.7176471, 1, 0, 1,
-0.8549761, 0.4053064, -1.985441, 0.7098039, 1, 0, 1,
-0.8541083, -0.419454, -1.070358, 0.7058824, 1, 0, 1,
-0.8494633, -0.1454061, -1.83076, 0.6980392, 1, 0, 1,
-0.8479331, 1.080138, -0.2760679, 0.6901961, 1, 0, 1,
-0.8476946, 1.335855, -0.3760303, 0.6862745, 1, 0, 1,
-0.8447112, 0.8507105, -1.933843, 0.6784314, 1, 0, 1,
-0.8322317, -1.036373, -3.31736, 0.6745098, 1, 0, 1,
-0.8304793, 0.5073593, 0.5901955, 0.6666667, 1, 0, 1,
-0.8284043, -0.4424387, -2.228033, 0.6627451, 1, 0, 1,
-0.8278784, -0.8514966, -2.168896, 0.654902, 1, 0, 1,
-0.8251456, 0.5306584, 0.009669932, 0.6509804, 1, 0, 1,
-0.8250126, -0.410942, -1.846086, 0.6431373, 1, 0, 1,
-0.8194478, -0.2090206, -1.428399, 0.6392157, 1, 0, 1,
-0.8179622, 0.9399316, 0.06942516, 0.6313726, 1, 0, 1,
-0.8148252, -0.6589362, -2.941277, 0.627451, 1, 0, 1,
-0.8118189, -1.456611, -3.108586, 0.6196079, 1, 0, 1,
-0.8117517, 0.7262862, -1.888499, 0.6156863, 1, 0, 1,
-0.8087595, -0.9372536, -1.379662, 0.6078432, 1, 0, 1,
-0.8005593, -1.223903, -3.870661, 0.6039216, 1, 0, 1,
-0.7999997, -1.044454, -2.042551, 0.5960785, 1, 0, 1,
-0.7966451, 0.8383218, -0.09538803, 0.5882353, 1, 0, 1,
-0.7891923, 0.5948194, 0.2833262, 0.5843138, 1, 0, 1,
-0.7725149, -0.02201322, -0.5036218, 0.5764706, 1, 0, 1,
-0.7706742, -1.469404, -0.2934273, 0.572549, 1, 0, 1,
-0.767864, -0.9305829, -1.280122, 0.5647059, 1, 0, 1,
-0.7668692, -1.878764, -4.155299, 0.5607843, 1, 0, 1,
-0.7651217, 2.720897, -1.222779, 0.5529412, 1, 0, 1,
-0.7409537, 2.61788, -0.01067068, 0.5490196, 1, 0, 1,
-0.7405254, 1.918469, -1.165286, 0.5411765, 1, 0, 1,
-0.7384563, -0.5666606, -2.972932, 0.5372549, 1, 0, 1,
-0.7342648, 0.405374, 0.1353451, 0.5294118, 1, 0, 1,
-0.7325305, 0.7393241, -1.099733, 0.5254902, 1, 0, 1,
-0.7282447, -0.8522801, -2.361645, 0.5176471, 1, 0, 1,
-0.7222089, -0.330428, -1.042078, 0.5137255, 1, 0, 1,
-0.713955, 0.2230743, -0.08129858, 0.5058824, 1, 0, 1,
-0.7118198, 0.7863373, -1.95408, 0.5019608, 1, 0, 1,
-0.7077797, -0.0974533, -2.078614, 0.4941176, 1, 0, 1,
-0.7037893, 1.86797, -2.238792, 0.4862745, 1, 0, 1,
-0.6962203, 1.715338, 0.3315753, 0.4823529, 1, 0, 1,
-0.6947448, 0.2431993, -1.433923, 0.4745098, 1, 0, 1,
-0.6870102, -2.238767, -1.579084, 0.4705882, 1, 0, 1,
-0.6868885, 1.550334, -0.3324909, 0.4627451, 1, 0, 1,
-0.6851592, -0.1352812, -2.468863, 0.4588235, 1, 0, 1,
-0.6802676, -0.07377113, -1.678468, 0.4509804, 1, 0, 1,
-0.6794263, 0.4518653, -2.341589, 0.4470588, 1, 0, 1,
-0.6732931, 0.1225979, -2.016289, 0.4392157, 1, 0, 1,
-0.6723917, -0.4899233, -0.8031551, 0.4352941, 1, 0, 1,
-0.6698872, 0.4025509, -2.168677, 0.427451, 1, 0, 1,
-0.6595959, 2.055961, -1.228154, 0.4235294, 1, 0, 1,
-0.6585206, -0.06630941, -1.403539, 0.4156863, 1, 0, 1,
-0.6553838, 0.9159214, -0.7083846, 0.4117647, 1, 0, 1,
-0.6553431, 1.413311, -0.4923631, 0.4039216, 1, 0, 1,
-0.6551008, 0.9365343, -0.2569757, 0.3960784, 1, 0, 1,
-0.650104, -1.49841, -2.896718, 0.3921569, 1, 0, 1,
-0.6356052, -1.882473, -2.987083, 0.3843137, 1, 0, 1,
-0.6244918, -0.1852509, -2.875674, 0.3803922, 1, 0, 1,
-0.6231095, 1.321761, -2.200047, 0.372549, 1, 0, 1,
-0.620981, 2.02803, -0.6744744, 0.3686275, 1, 0, 1,
-0.6185918, -0.5920064, -2.656025, 0.3607843, 1, 0, 1,
-0.6183727, -0.4157447, -4.075427, 0.3568628, 1, 0, 1,
-0.6176361, 1.662478, -0.1361127, 0.3490196, 1, 0, 1,
-0.6132119, 0.4908173, -1.965922, 0.345098, 1, 0, 1,
-0.6114464, -0.2963974, -1.284154, 0.3372549, 1, 0, 1,
-0.6105149, -0.6876757, -2.055689, 0.3333333, 1, 0, 1,
-0.6098836, -1.136288, -0.4267059, 0.3254902, 1, 0, 1,
-0.6063155, -1.276636, -1.36825, 0.3215686, 1, 0, 1,
-0.605422, -1.791488, -3.163744, 0.3137255, 1, 0, 1,
-0.6034007, 0.5215159, -0.9139758, 0.3098039, 1, 0, 1,
-0.5977551, -1.21315, -2.8426, 0.3019608, 1, 0, 1,
-0.5950369, -1.227027, -2.83361, 0.2941177, 1, 0, 1,
-0.5901392, 0.6395661, -1.211899, 0.2901961, 1, 0, 1,
-0.5846314, 0.3072726, -0.4653808, 0.282353, 1, 0, 1,
-0.5815125, -0.7255026, -3.658873, 0.2784314, 1, 0, 1,
-0.5789788, -0.3593715, -2.483453, 0.2705882, 1, 0, 1,
-0.5713401, -0.6240181, -4.612029, 0.2666667, 1, 0, 1,
-0.5712435, 0.3215593, -1.482865, 0.2588235, 1, 0, 1,
-0.5705676, -0.3700091, -2.355753, 0.254902, 1, 0, 1,
-0.5528131, 0.5433098, -1.5476, 0.2470588, 1, 0, 1,
-0.5465275, -0.304188, 0.9114985, 0.2431373, 1, 0, 1,
-0.5441734, -0.8809847, -2.859598, 0.2352941, 1, 0, 1,
-0.5328565, -0.8547879, -3.106058, 0.2313726, 1, 0, 1,
-0.5308149, 0.2181264, -1.883796, 0.2235294, 1, 0, 1,
-0.5306959, -0.01528331, -1.767067, 0.2196078, 1, 0, 1,
-0.5241637, 0.08069728, -0.3114872, 0.2117647, 1, 0, 1,
-0.5154653, 1.915092, 0.1730194, 0.2078431, 1, 0, 1,
-0.5153231, -0.9808912, -2.850316, 0.2, 1, 0, 1,
-0.5141354, 0.02441052, -0.2430911, 0.1921569, 1, 0, 1,
-0.5137914, 1.873951, -0.1029641, 0.1882353, 1, 0, 1,
-0.5117229, -1.167838, -0.3440502, 0.1803922, 1, 0, 1,
-0.5104527, -0.854521, -3.485507, 0.1764706, 1, 0, 1,
-0.5024921, 0.3261174, -1.609075, 0.1686275, 1, 0, 1,
-0.5018759, 0.3120241, -1.978001, 0.1647059, 1, 0, 1,
-0.499458, -1.023458, -2.827278, 0.1568628, 1, 0, 1,
-0.4939024, 1.405716, 0.5040123, 0.1529412, 1, 0, 1,
-0.4899104, 1.341102, -1.217604, 0.145098, 1, 0, 1,
-0.4857399, 1.238684, -1.26844, 0.1411765, 1, 0, 1,
-0.4831923, -1.541773, -2.947352, 0.1333333, 1, 0, 1,
-0.4805246, 1.550546, -2.577387, 0.1294118, 1, 0, 1,
-0.477977, 1.335182, 0.08084571, 0.1215686, 1, 0, 1,
-0.4769403, -0.02262759, -0.9299028, 0.1176471, 1, 0, 1,
-0.4768908, -1.317469, -1.177815, 0.1098039, 1, 0, 1,
-0.4702988, -0.1218943, -1.808508, 0.1058824, 1, 0, 1,
-0.4673598, 0.443689, -0.7936172, 0.09803922, 1, 0, 1,
-0.4638825, 0.3988072, -2.778284, 0.09019608, 1, 0, 1,
-0.46149, 0.07325704, 0.1774249, 0.08627451, 1, 0, 1,
-0.459713, -0.687016, -2.836648, 0.07843138, 1, 0, 1,
-0.4561958, 0.254902, -0.1275285, 0.07450981, 1, 0, 1,
-0.4541633, -0.7921918, -2.097734, 0.06666667, 1, 0, 1,
-0.4503825, 0.6153155, -1.05859, 0.0627451, 1, 0, 1,
-0.4499963, 1.450376, -0.07451041, 0.05490196, 1, 0, 1,
-0.4492045, 0.9279649, -0.6547325, 0.05098039, 1, 0, 1,
-0.4477056, 1.68165, -1.572374, 0.04313726, 1, 0, 1,
-0.4459175, -0.2811267, -1.081146, 0.03921569, 1, 0, 1,
-0.4439873, -0.4654799, -1.893264, 0.03137255, 1, 0, 1,
-0.4429662, 0.7128913, -0.0554481, 0.02745098, 1, 0, 1,
-0.4412816, 0.7452702, -2.239752, 0.01960784, 1, 0, 1,
-0.4326396, 0.3880243, 0.1581719, 0.01568628, 1, 0, 1,
-0.4324608, 0.1175475, -1.637116, 0.007843138, 1, 0, 1,
-0.428556, 0.2474332, -1.736234, 0.003921569, 1, 0, 1,
-0.4269339, -0.4977026, -1.526748, 0, 1, 0.003921569, 1,
-0.4229638, -0.6737123, -2.324101, 0, 1, 0.01176471, 1,
-0.4156375, -0.7172257, -4.604481, 0, 1, 0.01568628, 1,
-0.4092858, -0.4071368, -2.179292, 0, 1, 0.02352941, 1,
-0.4076111, 0.5239147, -0.06552948, 0, 1, 0.02745098, 1,
-0.4075448, -0.7498423, -1.269289, 0, 1, 0.03529412, 1,
-0.4069889, -0.322505, -3.896507, 0, 1, 0.03921569, 1,
-0.4038803, 0.4836322, -0.9549083, 0, 1, 0.04705882, 1,
-0.402238, 0.2136628, -0.5197974, 0, 1, 0.05098039, 1,
-0.3996879, -0.01199161, -1.57138, 0, 1, 0.05882353, 1,
-0.3955728, -0.925658, -2.925343, 0, 1, 0.0627451, 1,
-0.3952676, -0.355069, -2.605017, 0, 1, 0.07058824, 1,
-0.3887503, 0.2246682, -0.4856264, 0, 1, 0.07450981, 1,
-0.3855989, -2.401175, -2.508073, 0, 1, 0.08235294, 1,
-0.3805611, 0.3295523, 1.417831, 0, 1, 0.08627451, 1,
-0.3805572, -0.003395092, -0.8918781, 0, 1, 0.09411765, 1,
-0.3749843, 0.5806438, 0.7290247, 0, 1, 0.1019608, 1,
-0.3742522, 0.7221799, 0.03550083, 0, 1, 0.1058824, 1,
-0.3731466, -0.6801301, -3.156917, 0, 1, 0.1137255, 1,
-0.3709655, -2.140792, -2.327428, 0, 1, 0.1176471, 1,
-0.3695555, 0.2517936, 0.5578943, 0, 1, 0.1254902, 1,
-0.3680367, -1.292371, -3.874401, 0, 1, 0.1294118, 1,
-0.3672228, -0.2982275, -3.424302, 0, 1, 0.1372549, 1,
-0.3649673, 0.9047531, 0.5978851, 0, 1, 0.1411765, 1,
-0.3608797, -0.287625, -0.9319985, 0, 1, 0.1490196, 1,
-0.3595794, -0.1504264, -1.732258, 0, 1, 0.1529412, 1,
-0.3590949, -0.1462829, -1.97538, 0, 1, 0.1607843, 1,
-0.358974, 0.7492682, -1.140943, 0, 1, 0.1647059, 1,
-0.356378, -0.7697167, -3.918089, 0, 1, 0.172549, 1,
-0.3503188, -1.129762, -5.119106, 0, 1, 0.1764706, 1,
-0.3489131, -0.3287342, -0.2140559, 0, 1, 0.1843137, 1,
-0.3439637, 1.112616, -1.794257, 0, 1, 0.1882353, 1,
-0.3425075, -0.7840743, -4.385666, 0, 1, 0.1960784, 1,
-0.3422334, 0.4475335, -0.5787641, 0, 1, 0.2039216, 1,
-0.3412329, 0.5770701, -0.823433, 0, 1, 0.2078431, 1,
-0.3393469, 1.486511, 0.04157518, 0, 1, 0.2156863, 1,
-0.3325592, 0.6362388, -1.145633, 0, 1, 0.2196078, 1,
-0.3300354, -1.011669, -0.3904481, 0, 1, 0.227451, 1,
-0.3294352, -0.1435074, -0.5272452, 0, 1, 0.2313726, 1,
-0.3289148, -0.7719631, -3.915053, 0, 1, 0.2392157, 1,
-0.3280748, 0.7894642, -0.485794, 0, 1, 0.2431373, 1,
-0.3269172, -0.7105231, -1.829114, 0, 1, 0.2509804, 1,
-0.3240056, 0.6304696, -1.128534, 0, 1, 0.254902, 1,
-0.3106367, 0.9930094, 1.079123, 0, 1, 0.2627451, 1,
-0.3104842, -0.006176121, -2.477203, 0, 1, 0.2666667, 1,
-0.3082265, -0.1812285, -0.849576, 0, 1, 0.2745098, 1,
-0.3033326, 0.2498137, -1.493763, 0, 1, 0.2784314, 1,
-0.30075, 0.03775481, -2.406189, 0, 1, 0.2862745, 1,
-0.2977397, -0.4660505, -3.241459, 0, 1, 0.2901961, 1,
-0.2950185, 0.8862966, 2.145393, 0, 1, 0.2980392, 1,
-0.2940009, -0.8048918, -3.636017, 0, 1, 0.3058824, 1,
-0.2934417, 3.124479, 0.8930967, 0, 1, 0.3098039, 1,
-0.2904431, 1.680814, 1.711554, 0, 1, 0.3176471, 1,
-0.2867447, 0.9495683, -1.979573, 0, 1, 0.3215686, 1,
-0.2813246, -0.5537323, -3.787698, 0, 1, 0.3294118, 1,
-0.2806201, -1.855559, -2.478664, 0, 1, 0.3333333, 1,
-0.2794588, -0.4217603, -3.302609, 0, 1, 0.3411765, 1,
-0.2793395, -0.1614376, -1.276797, 0, 1, 0.345098, 1,
-0.277161, 0.3720198, -0.9289446, 0, 1, 0.3529412, 1,
-0.2758623, 1.415908, 0.5975087, 0, 1, 0.3568628, 1,
-0.2726298, 0.1469144, -1.554452, 0, 1, 0.3647059, 1,
-0.2663397, -1.214663, -3.438029, 0, 1, 0.3686275, 1,
-0.2602042, 0.722293, 0.09658585, 0, 1, 0.3764706, 1,
-0.2576857, 0.9746517, -0.122567, 0, 1, 0.3803922, 1,
-0.255335, 1.023986, -0.5595859, 0, 1, 0.3882353, 1,
-0.2545061, 0.7203734, -0.06271725, 0, 1, 0.3921569, 1,
-0.2532638, 0.1131027, -1.323911, 0, 1, 0.4, 1,
-0.2511286, 0.1229541, -1.484277, 0, 1, 0.4078431, 1,
-0.2507747, 0.3707289, -0.1916558, 0, 1, 0.4117647, 1,
-0.2442849, -0.09942225, -1.548522, 0, 1, 0.4196078, 1,
-0.2442217, -0.5519369, -0.9614384, 0, 1, 0.4235294, 1,
-0.238882, -0.04306269, -1.796113, 0, 1, 0.4313726, 1,
-0.2368099, -0.2132801, -2.379189, 0, 1, 0.4352941, 1,
-0.2338418, 1.427131, -0.9882486, 0, 1, 0.4431373, 1,
-0.232816, -0.5487552, -2.043993, 0, 1, 0.4470588, 1,
-0.2303425, -0.9757026, -1.859317, 0, 1, 0.454902, 1,
-0.2296288, -1.320044, -3.170282, 0, 1, 0.4588235, 1,
-0.2274792, -0.5397342, -3.035966, 0, 1, 0.4666667, 1,
-0.2242414, -0.4104097, -1.148782, 0, 1, 0.4705882, 1,
-0.2228752, -0.6020311, -4.88568, 0, 1, 0.4784314, 1,
-0.209043, 0.2174163, -0.9521991, 0, 1, 0.4823529, 1,
-0.2089475, -0.03450337, -2.84673, 0, 1, 0.4901961, 1,
-0.2018093, -0.4583738, -3.1132, 0, 1, 0.4941176, 1,
-0.2004995, -0.7798803, -3.360541, 0, 1, 0.5019608, 1,
-0.2003953, 0.4147818, -0.976562, 0, 1, 0.509804, 1,
-0.1966468, 0.9723235, -0.3431918, 0, 1, 0.5137255, 1,
-0.1940252, -0.1513927, -2.113873, 0, 1, 0.5215687, 1,
-0.1920685, -0.4289593, -3.913364, 0, 1, 0.5254902, 1,
-0.190966, -0.1410692, -2.232715, 0, 1, 0.5333334, 1,
-0.1834293, -1.809785, -5.216421, 0, 1, 0.5372549, 1,
-0.1825228, 1.047622, 0.8667635, 0, 1, 0.5450981, 1,
-0.1796541, 0.04360196, -2.043897, 0, 1, 0.5490196, 1,
-0.1789447, 0.0103625, -1.118009, 0, 1, 0.5568628, 1,
-0.1745548, -1.313166, -4.113945, 0, 1, 0.5607843, 1,
-0.167282, 1.929834, -1.875452, 0, 1, 0.5686275, 1,
-0.1637798, -0.5922002, -3.000754, 0, 1, 0.572549, 1,
-0.1620516, 0.4449111, 0.9015381, 0, 1, 0.5803922, 1,
-0.1596514, -1.303543, -2.542693, 0, 1, 0.5843138, 1,
-0.1563921, 1.06619, -2.557871, 0, 1, 0.5921569, 1,
-0.1511976, -0.2174596, -2.921904, 0, 1, 0.5960785, 1,
-0.146832, 2.129049, -1.455029, 0, 1, 0.6039216, 1,
-0.1443973, 0.7376583, -0.239814, 0, 1, 0.6117647, 1,
-0.1443379, 0.3359933, 0.2073466, 0, 1, 0.6156863, 1,
-0.142426, -0.4281007, -2.504866, 0, 1, 0.6235294, 1,
-0.1418864, -1.257798, -1.935335, 0, 1, 0.627451, 1,
-0.1382929, 0.7530258, 1.034227, 0, 1, 0.6352941, 1,
-0.1371651, 0.6611534, -1.21562, 0, 1, 0.6392157, 1,
-0.1365222, 1.233287, -1.653123, 0, 1, 0.6470588, 1,
-0.1351697, 0.3891253, 1.789509, 0, 1, 0.6509804, 1,
-0.1339034, -0.9022126, -0.8404559, 0, 1, 0.6588235, 1,
-0.1308716, 1.698213, 0.1903916, 0, 1, 0.6627451, 1,
-0.1304825, -0.3971178, -2.559262, 0, 1, 0.6705883, 1,
-0.1269774, -0.9472234, -2.085521, 0, 1, 0.6745098, 1,
-0.120627, 1.716338, 0.4036978, 0, 1, 0.682353, 1,
-0.1154937, 0.9514202, -1.17016, 0, 1, 0.6862745, 1,
-0.1139783, -0.5993378, -2.568691, 0, 1, 0.6941177, 1,
-0.1133136, 0.6495531, -0.1516655, 0, 1, 0.7019608, 1,
-0.1092358, -0.9302505, -5.665792, 0, 1, 0.7058824, 1,
-0.1078375, -0.8638296, -3.343229, 0, 1, 0.7137255, 1,
-0.1033456, -1.777946, -4.345756, 0, 1, 0.7176471, 1,
-0.1017143, 1.164446, -0.5815598, 0, 1, 0.7254902, 1,
-0.09924751, 0.3649464, -0.4968663, 0, 1, 0.7294118, 1,
-0.09869689, -1.028813, -2.524043, 0, 1, 0.7372549, 1,
-0.09289376, 0.1259922, -0.7027724, 0, 1, 0.7411765, 1,
-0.09004957, 0.5508228, -1.105727, 0, 1, 0.7490196, 1,
-0.08543879, -0.616982, -3.956916, 0, 1, 0.7529412, 1,
-0.08479141, -0.804229, -4.254449, 0, 1, 0.7607843, 1,
-0.08428984, 0.1759274, -0.9775498, 0, 1, 0.7647059, 1,
-0.08339106, -2.400682, -2.353538, 0, 1, 0.772549, 1,
-0.08169369, -1.707455, -4.338545, 0, 1, 0.7764706, 1,
-0.07831357, -1.014676, -4.751007, 0, 1, 0.7843137, 1,
-0.07507116, -0.2438037, -3.711932, 0, 1, 0.7882353, 1,
-0.07286068, -0.8910182, -4.280747, 0, 1, 0.7960784, 1,
-0.06867892, 0.4181689, 0.5290138, 0, 1, 0.8039216, 1,
-0.06432974, -0.2811534, -3.538583, 0, 1, 0.8078431, 1,
-0.06281152, 1.325432, 0.9243275, 0, 1, 0.8156863, 1,
-0.05550421, -0.2997858, -2.776089, 0, 1, 0.8196079, 1,
-0.05287255, -0.7354928, -2.445213, 0, 1, 0.827451, 1,
-0.05223271, -0.1951862, -2.30374, 0, 1, 0.8313726, 1,
-0.05183145, 0.5661764, 0.0838595, 0, 1, 0.8392157, 1,
-0.05135784, 1.728931, 1.203268, 0, 1, 0.8431373, 1,
-0.04976869, 1.931837, 1.072927, 0, 1, 0.8509804, 1,
-0.04940498, 0.1529149, -1.765641, 0, 1, 0.854902, 1,
-0.04613282, -1.552821, -4.708606, 0, 1, 0.8627451, 1,
-0.04214118, -1.526664, -2.662911, 0, 1, 0.8666667, 1,
-0.03832345, -0.8080505, -3.579256, 0, 1, 0.8745098, 1,
-0.03226685, 1.194988, -2.744326, 0, 1, 0.8784314, 1,
-0.03087068, 0.8697415, -0.7371429, 0, 1, 0.8862745, 1,
-0.0288588, 0.08215469, 1.724999, 0, 1, 0.8901961, 1,
-0.02407998, -0.5317044, -2.68372, 0, 1, 0.8980392, 1,
-0.02240301, -1.79158, -3.14556, 0, 1, 0.9058824, 1,
-0.02184582, 0.2162609, -1.373615, 0, 1, 0.9098039, 1,
-0.02179817, 1.084246, -0.04355352, 0, 1, 0.9176471, 1,
-0.02080123, 1.823951, -1.923159, 0, 1, 0.9215686, 1,
-0.01865513, 0.6978309, 0.5623821, 0, 1, 0.9294118, 1,
-0.01661219, -0.752643, -1.897189, 0, 1, 0.9333333, 1,
-0.01651063, -1.047664, -2.904295, 0, 1, 0.9411765, 1,
-0.01034758, -1.302124, -3.655164, 0, 1, 0.945098, 1,
-0.007180141, 0.6845369, -0.7546153, 0, 1, 0.9529412, 1,
-0.003457741, -0.3986295, -3.093382, 0, 1, 0.9568627, 1,
-0.003071587, -0.7279265, -4.489515, 0, 1, 0.9647059, 1,
-0.00239175, -0.9134666, -2.465449, 0, 1, 0.9686275, 1,
0.004604846, -0.4366367, 2.664466, 0, 1, 0.9764706, 1,
0.009891042, -0.09436779, 2.73961, 0, 1, 0.9803922, 1,
0.01204706, -0.14727, 3.412509, 0, 1, 0.9882353, 1,
0.01257563, -2.628794, 2.127756, 0, 1, 0.9921569, 1,
0.01303619, -0.7719194, 2.815662, 0, 1, 1, 1,
0.01540238, -0.9652145, 3.391147, 0, 0.9921569, 1, 1,
0.01680411, -0.2585874, 2.759288, 0, 0.9882353, 1, 1,
0.02689029, 0.3549096, -1.451322, 0, 0.9803922, 1, 1,
0.03496842, -0.8190791, 3.71964, 0, 0.9764706, 1, 1,
0.03677947, 0.2626191, 1.100675, 0, 0.9686275, 1, 1,
0.04744355, -0.8326689, 2.147448, 0, 0.9647059, 1, 1,
0.0508197, 0.837379, -0.7640177, 0, 0.9568627, 1, 1,
0.05728313, 1.404241, -0.0614039, 0, 0.9529412, 1, 1,
0.05779644, -1.369777, 2.507591, 0, 0.945098, 1, 1,
0.06018478, -0.5611309, 2.445078, 0, 0.9411765, 1, 1,
0.06267807, -0.5954873, 4.763531, 0, 0.9333333, 1, 1,
0.06583072, 0.974431, 0.4754481, 0, 0.9294118, 1, 1,
0.06676516, -0.6577191, 2.325275, 0, 0.9215686, 1, 1,
0.0683248, 0.1652664, 2.053372, 0, 0.9176471, 1, 1,
0.0708238, -1.320072, 2.985483, 0, 0.9098039, 1, 1,
0.07123671, 0.3385345, 0.3826098, 0, 0.9058824, 1, 1,
0.0776202, -0.7909557, 4.736959, 0, 0.8980392, 1, 1,
0.08023629, 0.3178747, -1.209086, 0, 0.8901961, 1, 1,
0.08163963, -1.285959, 4.341587, 0, 0.8862745, 1, 1,
0.08281571, -0.8124247, 1.826114, 0, 0.8784314, 1, 1,
0.08588997, 0.978318, 1.444706, 0, 0.8745098, 1, 1,
0.09183195, 1.128042, -0.6201814, 0, 0.8666667, 1, 1,
0.09202422, -0.9507332, 3.16839, 0, 0.8627451, 1, 1,
0.09449586, -0.1026427, 1.585366, 0, 0.854902, 1, 1,
0.09488795, 0.4552931, 0.7408169, 0, 0.8509804, 1, 1,
0.09542233, -0.136965, 2.936481, 0, 0.8431373, 1, 1,
0.0978236, -0.5942568, 2.908624, 0, 0.8392157, 1, 1,
0.1031308, -2.332326, 3.834004, 0, 0.8313726, 1, 1,
0.1064145, -1.022544, 3.089872, 0, 0.827451, 1, 1,
0.1102009, -0.5678586, 2.685992, 0, 0.8196079, 1, 1,
0.1178896, 1.200724, -0.1020887, 0, 0.8156863, 1, 1,
0.1198723, -0.2939568, 2.194646, 0, 0.8078431, 1, 1,
0.120752, -0.9962105, 3.395041, 0, 0.8039216, 1, 1,
0.1240028, -0.7224622, 1.68022, 0, 0.7960784, 1, 1,
0.1252491, -1.582513, 3.568469, 0, 0.7882353, 1, 1,
0.1277051, 0.2141126, 1.028771, 0, 0.7843137, 1, 1,
0.1283387, 1.126435, -0.1080405, 0, 0.7764706, 1, 1,
0.1284661, 0.2339321, 1.861081, 0, 0.772549, 1, 1,
0.1312571, 0.1211413, 1.648854, 0, 0.7647059, 1, 1,
0.136303, -1.525241, 4.312664, 0, 0.7607843, 1, 1,
0.1372049, -0.5305793, 2.657574, 0, 0.7529412, 1, 1,
0.1398292, 0.7203442, -0.6257249, 0, 0.7490196, 1, 1,
0.1417292, -0.7202007, 3.03726, 0, 0.7411765, 1, 1,
0.1466275, -0.1533104, 2.050009, 0, 0.7372549, 1, 1,
0.147254, 0.2570477, 1.323499, 0, 0.7294118, 1, 1,
0.1474143, 0.3684781, 0.02208381, 0, 0.7254902, 1, 1,
0.1517155, 0.9082364, -0.2771085, 0, 0.7176471, 1, 1,
0.1536819, -1.137769, 4.939533, 0, 0.7137255, 1, 1,
0.1539508, 0.9675019, -0.1518978, 0, 0.7058824, 1, 1,
0.1544956, 1.675624, -0.1017521, 0, 0.6980392, 1, 1,
0.1566496, 0.2611519, 1.106152, 0, 0.6941177, 1, 1,
0.1587324, -2.08353, 1.754264, 0, 0.6862745, 1, 1,
0.1604866, 0.6702381, 1.692209, 0, 0.682353, 1, 1,
0.1609025, -0.4211529, 3.141842, 0, 0.6745098, 1, 1,
0.1616017, 0.7603059, -1.039801, 0, 0.6705883, 1, 1,
0.1616914, -0.4164734, 1.644173, 0, 0.6627451, 1, 1,
0.1637909, -0.218399, 2.60665, 0, 0.6588235, 1, 1,
0.1794836, -0.6237104, 1.071462, 0, 0.6509804, 1, 1,
0.1806233, -1.073659, 3.747025, 0, 0.6470588, 1, 1,
0.1817283, 1.663669, 0.8292417, 0, 0.6392157, 1, 1,
0.187657, 0.87679, 1.146365, 0, 0.6352941, 1, 1,
0.1879771, 0.4792421, 2.457468, 0, 0.627451, 1, 1,
0.1885585, -1.351392, 3.55043, 0, 0.6235294, 1, 1,
0.1903586, 1.811906, 0.5637503, 0, 0.6156863, 1, 1,
0.1904453, 0.2723499, 0.2069239, 0, 0.6117647, 1, 1,
0.1950866, 0.3229346, 0.5754091, 0, 0.6039216, 1, 1,
0.1964423, -0.4072342, 2.182013, 0, 0.5960785, 1, 1,
0.1976828, -1.157374, 3.539078, 0, 0.5921569, 1, 1,
0.2018278, -0.3455452, 3.592638, 0, 0.5843138, 1, 1,
0.2079756, 1.149733, -1.106344, 0, 0.5803922, 1, 1,
0.2084364, 0.01217146, 1.53207, 0, 0.572549, 1, 1,
0.2092984, 0.4283847, 1.778589, 0, 0.5686275, 1, 1,
0.2139066, 1.691945, 1.199, 0, 0.5607843, 1, 1,
0.2160123, -2.731046, 4.123869, 0, 0.5568628, 1, 1,
0.2195066, -0.2899053, 2.319746, 0, 0.5490196, 1, 1,
0.2203049, -0.7675139, 2.821362, 0, 0.5450981, 1, 1,
0.2285015, -0.4593185, 3.727126, 0, 0.5372549, 1, 1,
0.2295964, 0.2376797, 0.5021212, 0, 0.5333334, 1, 1,
0.231339, -0.1857555, 2.779921, 0, 0.5254902, 1, 1,
0.2337366, 1.154944, -0.5325559, 0, 0.5215687, 1, 1,
0.2347408, -0.7419137, 3.219727, 0, 0.5137255, 1, 1,
0.2420663, 0.2982805, 0.2454084, 0, 0.509804, 1, 1,
0.2513086, 0.0009160267, 2.161837, 0, 0.5019608, 1, 1,
0.2546419, 0.3151432, 0.07320465, 0, 0.4941176, 1, 1,
0.2549679, 0.2474307, 0.7330435, 0, 0.4901961, 1, 1,
0.2559609, 0.1677784, 0.7508568, 0, 0.4823529, 1, 1,
0.2585344, -0.1331109, 1.664127, 0, 0.4784314, 1, 1,
0.2619201, -0.950009, 3.711092, 0, 0.4705882, 1, 1,
0.2636899, -0.1476327, 2.110556, 0, 0.4666667, 1, 1,
0.266191, -0.7272466, 2.726187, 0, 0.4588235, 1, 1,
0.2676022, -0.07288969, 3.471374, 0, 0.454902, 1, 1,
0.2700348, -0.9769803, 3.220521, 0, 0.4470588, 1, 1,
0.274043, 0.01733197, 1.409071, 0, 0.4431373, 1, 1,
0.2760103, -0.2884934, 1.030294, 0, 0.4352941, 1, 1,
0.2769078, 0.08126251, 1.761675, 0, 0.4313726, 1, 1,
0.2774697, -0.6425812, 2.757457, 0, 0.4235294, 1, 1,
0.2785971, 0.2125119, 1.444273, 0, 0.4196078, 1, 1,
0.2798222, 0.001311658, 0.8621557, 0, 0.4117647, 1, 1,
0.2910433, -0.5983719, 2.842148, 0, 0.4078431, 1, 1,
0.2918417, -0.4370815, 3.455173, 0, 0.4, 1, 1,
0.2941419, 0.2134514, 0.3807661, 0, 0.3921569, 1, 1,
0.2982596, -1.008947, 3.4962, 0, 0.3882353, 1, 1,
0.2997662, 0.1158014, 1.297832, 0, 0.3803922, 1, 1,
0.3013626, -0.6766692, 2.984503, 0, 0.3764706, 1, 1,
0.3044873, -0.2459799, 1.165333, 0, 0.3686275, 1, 1,
0.3098107, 0.6545745, -0.3832841, 0, 0.3647059, 1, 1,
0.3162639, -0.2982681, 1.059424, 0, 0.3568628, 1, 1,
0.3163137, 0.2893651, 0.2057999, 0, 0.3529412, 1, 1,
0.3174553, 1.99269, 1.149041, 0, 0.345098, 1, 1,
0.3178272, 0.1676908, 1.455324, 0, 0.3411765, 1, 1,
0.317914, 2.116341, -0.4689819, 0, 0.3333333, 1, 1,
0.3186001, 1.488005, 0.7406577, 0, 0.3294118, 1, 1,
0.3215261, -1.611203, 3.00256, 0, 0.3215686, 1, 1,
0.3219456, 0.8986332, 1.551445, 0, 0.3176471, 1, 1,
0.3232868, 1.0115, -0.28292, 0, 0.3098039, 1, 1,
0.3294545, 2.255623, -0.9179121, 0, 0.3058824, 1, 1,
0.3302785, -0.6799132, 3.411806, 0, 0.2980392, 1, 1,
0.3416147, 1.098425, -0.0438829, 0, 0.2901961, 1, 1,
0.3482229, 1.628961, 1.917503, 0, 0.2862745, 1, 1,
0.3483231, 0.5404745, -0.3715011, 0, 0.2784314, 1, 1,
0.3499682, -2.512696, 2.177574, 0, 0.2745098, 1, 1,
0.3588005, 0.07966762, 2.229113, 0, 0.2666667, 1, 1,
0.3611581, -0.05719557, 2.04073, 0, 0.2627451, 1, 1,
0.3617063, 2.507437, 0.867025, 0, 0.254902, 1, 1,
0.3622478, -0.9755419, 3.673187, 0, 0.2509804, 1, 1,
0.3623433, 1.600738, -0.03346069, 0, 0.2431373, 1, 1,
0.368301, 0.1515595, 2.114772, 0, 0.2392157, 1, 1,
0.3738791, 0.4359011, 1.26298, 0, 0.2313726, 1, 1,
0.3806221, 0.2738517, 0.6995868, 0, 0.227451, 1, 1,
0.3869142, -0.3238317, 0.6798039, 0, 0.2196078, 1, 1,
0.3955725, 0.2532966, 0.7800775, 0, 0.2156863, 1, 1,
0.3964813, 1.011761, 0.9587567, 0, 0.2078431, 1, 1,
0.4002261, -0.7696906, 3.060516, 0, 0.2039216, 1, 1,
0.402299, 0.0872936, 3.254166, 0, 0.1960784, 1, 1,
0.4047062, 0.551421, -0.6453955, 0, 0.1882353, 1, 1,
0.4095133, -1.384074, 2.376879, 0, 0.1843137, 1, 1,
0.4099534, 0.976053, -1.474013, 0, 0.1764706, 1, 1,
0.4167541, 0.2693852, 0.5440376, 0, 0.172549, 1, 1,
0.4167764, -0.2044723, 1.282948, 0, 0.1647059, 1, 1,
0.4215897, 0.09397877, 0.9130204, 0, 0.1607843, 1, 1,
0.422796, 0.2484136, 2.796197, 0, 0.1529412, 1, 1,
0.4247577, -0.1611267, 2.157584, 0, 0.1490196, 1, 1,
0.4270872, -1.21277, 4.69371, 0, 0.1411765, 1, 1,
0.4276518, 0.5264452, 2.05976, 0, 0.1372549, 1, 1,
0.4306394, 1.654594, 2.786531, 0, 0.1294118, 1, 1,
0.438013, 1.220356, 0.1091228, 0, 0.1254902, 1, 1,
0.4389939, -0.6744071, 2.228532, 0, 0.1176471, 1, 1,
0.4484868, -0.5395038, 1.208988, 0, 0.1137255, 1, 1,
0.4519126, 0.5288265, -0.1019529, 0, 0.1058824, 1, 1,
0.4531453, 0.7636232, -0.6512963, 0, 0.09803922, 1, 1,
0.4609208, -0.1337218, 2.31251, 0, 0.09411765, 1, 1,
0.4624019, 0.2059756, 2.258344, 0, 0.08627451, 1, 1,
0.464942, -1.007136, 0.882945, 0, 0.08235294, 1, 1,
0.4682485, -0.1235731, 0.09228273, 0, 0.07450981, 1, 1,
0.4693079, -0.6460509, 2.003655, 0, 0.07058824, 1, 1,
0.4782215, 0.2014866, -0.2063589, 0, 0.0627451, 1, 1,
0.4900993, -0.1219456, 1.655582, 0, 0.05882353, 1, 1,
0.4930373, 0.1875738, 1.993385, 0, 0.05098039, 1, 1,
0.4952278, -1.410742, 3.231389, 0, 0.04705882, 1, 1,
0.4963953, -0.5656164, 3.067682, 0, 0.03921569, 1, 1,
0.4973127, 0.1648207, 0.8187922, 0, 0.03529412, 1, 1,
0.4981295, 2.412292, -1.257191, 0, 0.02745098, 1, 1,
0.4984506, 0.3332958, 2.336906, 0, 0.02352941, 1, 1,
0.5025671, 0.4623786, -1.722432, 0, 0.01568628, 1, 1,
0.5037158, 0.9505231, -0.4514118, 0, 0.01176471, 1, 1,
0.5053273, -0.1686664, 0.271574, 0, 0.003921569, 1, 1,
0.5055904, -0.9447893, 1.562086, 0.003921569, 0, 1, 1,
0.5089636, -1.792274, 3.300366, 0.007843138, 0, 1, 1,
0.509002, 1.033461, 0.7154166, 0.01568628, 0, 1, 1,
0.5109955, -0.5622988, 2.61921, 0.01960784, 0, 1, 1,
0.5118441, -0.6628191, 1.474611, 0.02745098, 0, 1, 1,
0.512665, -0.7214125, 0.6205384, 0.03137255, 0, 1, 1,
0.5132301, -1.386896, 0.4791882, 0.03921569, 0, 1, 1,
0.5151577, 0.04298023, 4.264875, 0.04313726, 0, 1, 1,
0.5155618, -0.04191684, 2.94265, 0.05098039, 0, 1, 1,
0.5166187, -0.153758, 2.06848, 0.05490196, 0, 1, 1,
0.5240938, -0.07819579, 1.647211, 0.0627451, 0, 1, 1,
0.5342395, 1.059403, 0.7950685, 0.06666667, 0, 1, 1,
0.536014, -0.06695039, 1.849659, 0.07450981, 0, 1, 1,
0.5374091, -3.039917, 3.709353, 0.07843138, 0, 1, 1,
0.5411045, 0.6992317, 1.689965, 0.08627451, 0, 1, 1,
0.5427081, -0.07322975, 3.373241, 0.09019608, 0, 1, 1,
0.5438074, 2.747347, -0.02783775, 0.09803922, 0, 1, 1,
0.5438198, -1.003274, 2.745546, 0.1058824, 0, 1, 1,
0.5467793, -1.821127, 3.424155, 0.1098039, 0, 1, 1,
0.5512618, 0.1935956, 2.338587, 0.1176471, 0, 1, 1,
0.5554266, 0.4836181, 1.077113, 0.1215686, 0, 1, 1,
0.5577872, -0.6197213, 1.054322, 0.1294118, 0, 1, 1,
0.5578488, -2.007853, 2.541121, 0.1333333, 0, 1, 1,
0.5596672, -0.2115417, 1.058549, 0.1411765, 0, 1, 1,
0.5609946, 0.7187388, -0.2407359, 0.145098, 0, 1, 1,
0.5639787, -0.6410414, 0.9312643, 0.1529412, 0, 1, 1,
0.5731905, 0.8665434, 0.0228179, 0.1568628, 0, 1, 1,
0.5762597, -1.241575, 3.649594, 0.1647059, 0, 1, 1,
0.578043, 1.12677, -0.2607379, 0.1686275, 0, 1, 1,
0.5873511, -1.307465, 0.9198083, 0.1764706, 0, 1, 1,
0.5955261, 1.374881, 1.102555, 0.1803922, 0, 1, 1,
0.5957375, 0.4682595, 0.2631376, 0.1882353, 0, 1, 1,
0.6039996, 2.471371, 1.989732, 0.1921569, 0, 1, 1,
0.605754, 1.143293, 1.048498, 0.2, 0, 1, 1,
0.6060441, 0.7556701, 1.138617, 0.2078431, 0, 1, 1,
0.6143817, -0.8640862, 2.01098, 0.2117647, 0, 1, 1,
0.6157737, -0.6314061, 3.060792, 0.2196078, 0, 1, 1,
0.6159165, -1.014505, 1.316572, 0.2235294, 0, 1, 1,
0.6172817, -0.4409958, 2.774645, 0.2313726, 0, 1, 1,
0.6180825, 0.7448449, 0.3565922, 0.2352941, 0, 1, 1,
0.6202911, -0.5171502, 0.1321226, 0.2431373, 0, 1, 1,
0.6204857, 0.6862488, 1.678021, 0.2470588, 0, 1, 1,
0.6208511, -1.260988, 2.090137, 0.254902, 0, 1, 1,
0.621253, -0.04032716, 3.683275, 0.2588235, 0, 1, 1,
0.6258425, 0.3156773, 1.294644, 0.2666667, 0, 1, 1,
0.6335691, 2.561223, -0.6880167, 0.2705882, 0, 1, 1,
0.6352353, 1.623417, 0.1836002, 0.2784314, 0, 1, 1,
0.6363169, -0.0475857, 2.185811, 0.282353, 0, 1, 1,
0.6370126, 0.05184485, 1.686372, 0.2901961, 0, 1, 1,
0.6386542, 0.2515856, -0.06839962, 0.2941177, 0, 1, 1,
0.6397686, -0.8228547, 1.219013, 0.3019608, 0, 1, 1,
0.6421531, -0.8254423, 3.666772, 0.3098039, 0, 1, 1,
0.644617, 0.6203816, -0.1885878, 0.3137255, 0, 1, 1,
0.6493214, 1.21524, -0.07976894, 0.3215686, 0, 1, 1,
0.6550108, -0.2925474, 0.4196929, 0.3254902, 0, 1, 1,
0.6563355, 0.2287654, 1.386193, 0.3333333, 0, 1, 1,
0.6607822, -1.82587, 1.861834, 0.3372549, 0, 1, 1,
0.664267, 0.5252324, 2.166454, 0.345098, 0, 1, 1,
0.6730841, -0.3129005, 1.449049, 0.3490196, 0, 1, 1,
0.6735237, -0.4712863, 1.787396, 0.3568628, 0, 1, 1,
0.6747203, -0.9483763, 3.91748, 0.3607843, 0, 1, 1,
0.678889, -0.3345965, 2.406058, 0.3686275, 0, 1, 1,
0.6807208, 1.327997, 1.588435, 0.372549, 0, 1, 1,
0.6832542, 0.6583979, -0.3606924, 0.3803922, 0, 1, 1,
0.6849889, 1.194483, 1.128303, 0.3843137, 0, 1, 1,
0.6881097, 0.2274909, 0.4334763, 0.3921569, 0, 1, 1,
0.6917288, -0.2072078, 1.04305, 0.3960784, 0, 1, 1,
0.6985785, 0.1446516, 0.6975576, 0.4039216, 0, 1, 1,
0.7030973, 0.6356452, 1.771734, 0.4117647, 0, 1, 1,
0.7049654, 0.3460785, 1.768683, 0.4156863, 0, 1, 1,
0.7060559, 1.721875, 0.1751482, 0.4235294, 0, 1, 1,
0.706871, 2.773217, 0.3202132, 0.427451, 0, 1, 1,
0.7083123, -0.6228083, 3.648405, 0.4352941, 0, 1, 1,
0.7086042, 0.6280549, -0.01207673, 0.4392157, 0, 1, 1,
0.7102072, -1.000332, 3.731951, 0.4470588, 0, 1, 1,
0.7113059, 1.370296, 0.7519596, 0.4509804, 0, 1, 1,
0.7129076, 1.500313, -0.2079346, 0.4588235, 0, 1, 1,
0.7138366, -1.270475, 3.407867, 0.4627451, 0, 1, 1,
0.7162157, 0.1947719, 0.8207545, 0.4705882, 0, 1, 1,
0.7171376, -1.023249, 3.089275, 0.4745098, 0, 1, 1,
0.7215337, -0.6324644, 2.764517, 0.4823529, 0, 1, 1,
0.7256941, -1.468355, 1.073513, 0.4862745, 0, 1, 1,
0.7284904, 0.6149486, 0.4418542, 0.4941176, 0, 1, 1,
0.7291443, -1.537255, 4.186206, 0.5019608, 0, 1, 1,
0.7346393, 2.10025, 0.9455288, 0.5058824, 0, 1, 1,
0.7365888, -0.6949587, 1.863997, 0.5137255, 0, 1, 1,
0.7411498, 0.411904, 1.486834, 0.5176471, 0, 1, 1,
0.7487344, 0.91267, 0.5590354, 0.5254902, 0, 1, 1,
0.7504088, -1.690951, 1.849778, 0.5294118, 0, 1, 1,
0.7534182, 0.7848231, -0.08549543, 0.5372549, 0, 1, 1,
0.7539764, -2.128039, 0.6810394, 0.5411765, 0, 1, 1,
0.7602471, -1.610355, 2.556582, 0.5490196, 0, 1, 1,
0.7645298, 0.4305433, 1.142083, 0.5529412, 0, 1, 1,
0.7680096, 1.266488, -0.9291044, 0.5607843, 0, 1, 1,
0.7869326, -0.9148495, 2.247458, 0.5647059, 0, 1, 1,
0.7883407, -1.278027, 3.464835, 0.572549, 0, 1, 1,
0.7914762, -0.2708471, 0.0515092, 0.5764706, 0, 1, 1,
0.7971798, 0.7988316, 0.01624414, 0.5843138, 0, 1, 1,
0.7998961, 0.6390287, 2.60605, 0.5882353, 0, 1, 1,
0.8000929, 0.859571, -0.7987393, 0.5960785, 0, 1, 1,
0.8006499, 1.617875, 1.475929, 0.6039216, 0, 1, 1,
0.8007249, -1.245933, 2.847476, 0.6078432, 0, 1, 1,
0.8027109, -1.532282, 3.035888, 0.6156863, 0, 1, 1,
0.8049724, 1.053278, 1.305731, 0.6196079, 0, 1, 1,
0.8093335, -1.235998, 2.362632, 0.627451, 0, 1, 1,
0.8151509, -0.6809094, 1.557197, 0.6313726, 0, 1, 1,
0.8176977, -1.041777, 1.804677, 0.6392157, 0, 1, 1,
0.8238839, 0.2052707, 2.441644, 0.6431373, 0, 1, 1,
0.8239862, -1.611128, 2.591529, 0.6509804, 0, 1, 1,
0.8254937, -0.1457281, 1.46261, 0.654902, 0, 1, 1,
0.829271, 0.3036848, 1.244887, 0.6627451, 0, 1, 1,
0.8327978, 0.7405434, 1.834365, 0.6666667, 0, 1, 1,
0.8362241, 0.06730681, 3.75735, 0.6745098, 0, 1, 1,
0.8377068, 0.9696822, 0.7259241, 0.6784314, 0, 1, 1,
0.8394816, -0.6658036, 2.10311, 0.6862745, 0, 1, 1,
0.8429068, 0.2917071, 1.047202, 0.6901961, 0, 1, 1,
0.8436826, 0.0558628, 1.879694, 0.6980392, 0, 1, 1,
0.8513954, 2.454439, -0.5902942, 0.7058824, 0, 1, 1,
0.860023, 0.8739285, 0.9884362, 0.7098039, 0, 1, 1,
0.8626531, -0.4480737, 1.100129, 0.7176471, 0, 1, 1,
0.8631261, 0.8778887, 1.470625, 0.7215686, 0, 1, 1,
0.8637782, 1.050217, 1.4464, 0.7294118, 0, 1, 1,
0.8649455, 0.0056254, 3.406234, 0.7333333, 0, 1, 1,
0.8674055, -0.5309642, 2.960682, 0.7411765, 0, 1, 1,
0.8709823, 0.3712258, 1.451127, 0.7450981, 0, 1, 1,
0.8755415, -0.1046704, 2.929188, 0.7529412, 0, 1, 1,
0.8758609, 0.09200183, 2.238633, 0.7568628, 0, 1, 1,
0.8765169, -1.289409, 2.656793, 0.7647059, 0, 1, 1,
0.8794192, -1.423679, 2.154796, 0.7686275, 0, 1, 1,
0.8795167, -1.090909, 2.051302, 0.7764706, 0, 1, 1,
0.8868087, 0.1329783, 2.850767, 0.7803922, 0, 1, 1,
0.8870165, -1.832034, 1.623791, 0.7882353, 0, 1, 1,
0.8923401, 0.1095466, 1.038809, 0.7921569, 0, 1, 1,
0.8976979, -2.454336, 3.918121, 0.8, 0, 1, 1,
0.9028467, 1.043295, -0.1343127, 0.8078431, 0, 1, 1,
0.9029897, 0.3284444, -0.7544391, 0.8117647, 0, 1, 1,
0.9039256, -2.019081, 3.770057, 0.8196079, 0, 1, 1,
0.9047249, -0.7051144, 2.363031, 0.8235294, 0, 1, 1,
0.9091276, 0.1601298, 1.347475, 0.8313726, 0, 1, 1,
0.9099393, 1.505748, 1.65146, 0.8352941, 0, 1, 1,
0.913078, -0.2310168, 0.8538413, 0.8431373, 0, 1, 1,
0.9158855, 0.4337714, 1.698417, 0.8470588, 0, 1, 1,
0.9176756, -0.8463685, 0.7161408, 0.854902, 0, 1, 1,
0.9231108, -1.084249, 2.122297, 0.8588235, 0, 1, 1,
0.9258201, 0.04623274, -0.1816943, 0.8666667, 0, 1, 1,
0.9264101, -0.2500907, 2.827062, 0.8705882, 0, 1, 1,
0.9352775, -0.8090098, -0.05104953, 0.8784314, 0, 1, 1,
0.9358668, -0.1929692, 1.436344, 0.8823529, 0, 1, 1,
0.9379647, 0.1621496, 0.2843435, 0.8901961, 0, 1, 1,
0.9430431, -0.0372227, 1.298197, 0.8941177, 0, 1, 1,
0.9447696, -0.9678006, 2.698729, 0.9019608, 0, 1, 1,
0.9523065, -1.881133, 2.847821, 0.9098039, 0, 1, 1,
0.953746, 0.3256317, 1.613624, 0.9137255, 0, 1, 1,
0.9542189, 0.2498565, 1.92392, 0.9215686, 0, 1, 1,
0.9543451, 1.012276, -0.4762145, 0.9254902, 0, 1, 1,
0.9544522, 0.1341206, 0.1068648, 0.9333333, 0, 1, 1,
0.9574386, 0.5744094, 1.789331, 0.9372549, 0, 1, 1,
0.9577711, 0.07770254, 0.7675211, 0.945098, 0, 1, 1,
0.9587154, -0.4264321, 2.375404, 0.9490196, 0, 1, 1,
0.9609875, 0.6768038, 0.05702203, 0.9568627, 0, 1, 1,
0.9619602, -0.267845, 2.049172, 0.9607843, 0, 1, 1,
0.9651985, -0.4102834, 1.943341, 0.9686275, 0, 1, 1,
0.9655122, -0.1129993, 1.774794, 0.972549, 0, 1, 1,
0.9687124, -0.9936316, 0.8121937, 0.9803922, 0, 1, 1,
0.971128, -0.421163, 3.459386, 0.9843137, 0, 1, 1,
0.9768955, -0.2620349, 1.196137, 0.9921569, 0, 1, 1,
0.9883157, -0.1188002, -0.1308057, 0.9960784, 0, 1, 1,
0.9910982, -0.1941525, 4.083799, 1, 0, 0.9960784, 1,
0.9928166, -1.142379, 2.827483, 1, 0, 0.9882353, 1,
0.9947031, -0.7940463, 3.603539, 1, 0, 0.9843137, 1,
0.9953936, 1.499994, 0.7003784, 1, 0, 0.9764706, 1,
0.9961289, 0.3582092, 0.9814792, 1, 0, 0.972549, 1,
0.9991125, 0.3121479, 2.064203, 1, 0, 0.9647059, 1,
1.001997, 0.08492678, 0.8505706, 1, 0, 0.9607843, 1,
1.003933, -0.7734275, 2.249149, 1, 0, 0.9529412, 1,
1.010888, -0.6103297, 2.501028, 1, 0, 0.9490196, 1,
1.014845, -0.7070834, 1.973555, 1, 0, 0.9411765, 1,
1.016828, 0.6947475, 2.183785, 1, 0, 0.9372549, 1,
1.016942, 0.2481397, -0.3759785, 1, 0, 0.9294118, 1,
1.018703, -1.773923, 2.855756, 1, 0, 0.9254902, 1,
1.023366, 1.615089, 1.235061, 1, 0, 0.9176471, 1,
1.028465, -0.2974268, 0.3103199, 1, 0, 0.9137255, 1,
1.030985, 1.073907, 0.5248897, 1, 0, 0.9058824, 1,
1.031562, -0.3267878, 1.480775, 1, 0, 0.9019608, 1,
1.031627, -1.509295, 2.084048, 1, 0, 0.8941177, 1,
1.033333, -0.68019, 1.714115, 1, 0, 0.8862745, 1,
1.034917, 0.0999064, -0.2067581, 1, 0, 0.8823529, 1,
1.036906, 1.516284, 0.3177427, 1, 0, 0.8745098, 1,
1.0371, 1.254027, 0.6300797, 1, 0, 0.8705882, 1,
1.044819, -0.4887283, 2.156229, 1, 0, 0.8627451, 1,
1.048072, 1.188485, 1.604082, 1, 0, 0.8588235, 1,
1.050874, 1.49532, -0.6092787, 1, 0, 0.8509804, 1,
1.054481, 0.9598312, 0.2005021, 1, 0, 0.8470588, 1,
1.058885, -1.15015, 2.076966, 1, 0, 0.8392157, 1,
1.06042, 0.1288927, 1.837458, 1, 0, 0.8352941, 1,
1.06155, 0.3170511, 1.340093, 1, 0, 0.827451, 1,
1.068716, -0.2675024, 0.9391223, 1, 0, 0.8235294, 1,
1.069384, 0.2833274, 0.3294582, 1, 0, 0.8156863, 1,
1.084513, 0.8528786, -0.5637851, 1, 0, 0.8117647, 1,
1.085309, 1.349823, 0.1856659, 1, 0, 0.8039216, 1,
1.091144, 0.1148538, 1.63083, 1, 0, 0.7960784, 1,
1.094483, -0.5851512, 1.687849, 1, 0, 0.7921569, 1,
1.100698, 0.6258815, 0.5096468, 1, 0, 0.7843137, 1,
1.109801, 2.767554, -0.1423464, 1, 0, 0.7803922, 1,
1.111214, 0.0001431889, 2.000347, 1, 0, 0.772549, 1,
1.117048, 0.0631636, 0.4711602, 1, 0, 0.7686275, 1,
1.119522, -0.3577999, 1.983313, 1, 0, 0.7607843, 1,
1.120234, 0.5849897, 1.042552, 1, 0, 0.7568628, 1,
1.124313, 0.6306059, 2.694943, 1, 0, 0.7490196, 1,
1.128679, -0.8526523, 2.292439, 1, 0, 0.7450981, 1,
1.129488, -1.656774, 4.113276, 1, 0, 0.7372549, 1,
1.132432, -0.3183139, 1.824338, 1, 0, 0.7333333, 1,
1.13621, 0.7595801, 0.8964797, 1, 0, 0.7254902, 1,
1.137447, 1.538894, 1.03794, 1, 0, 0.7215686, 1,
1.138557, 2.565633, 0.2796209, 1, 0, 0.7137255, 1,
1.142984, 0.09633778, 1.223172, 1, 0, 0.7098039, 1,
1.143773, 0.1539091, 1.911944, 1, 0, 0.7019608, 1,
1.152874, -1.01498, 1.264083, 1, 0, 0.6941177, 1,
1.154996, -0.4824627, 2.055188, 1, 0, 0.6901961, 1,
1.155142, 0.661185, 0.2082431, 1, 0, 0.682353, 1,
1.155458, 1.457536, 0.524512, 1, 0, 0.6784314, 1,
1.158637, -0.2407186, 1.292674, 1, 0, 0.6705883, 1,
1.167338, 0.3965228, 0.813685, 1, 0, 0.6666667, 1,
1.179245, -0.6391484, 1.141677, 1, 0, 0.6588235, 1,
1.180964, -0.231015, 1.291459, 1, 0, 0.654902, 1,
1.19915, 0.5145398, 1.782366, 1, 0, 0.6470588, 1,
1.209418, 0.5258729, 0.05243059, 1, 0, 0.6431373, 1,
1.213342, -0.5505605, 0.3714883, 1, 0, 0.6352941, 1,
1.214117, -0.2947074, 1.399195, 1, 0, 0.6313726, 1,
1.22249, -0.7228299, 3.755392, 1, 0, 0.6235294, 1,
1.249561, -0.4167998, 3.689101, 1, 0, 0.6196079, 1,
1.250352, 0.4734797, 1.327102, 1, 0, 0.6117647, 1,
1.252155, 0.4838526, 1.458529, 1, 0, 0.6078432, 1,
1.254597, 0.5982928, 0.4397057, 1, 0, 0.6, 1,
1.26142, 1.237519, -0.3773671, 1, 0, 0.5921569, 1,
1.262042, 1.198074, 1.176478, 1, 0, 0.5882353, 1,
1.267429, -0.8429243, 2.089141, 1, 0, 0.5803922, 1,
1.284141, 0.5232743, -1.122815, 1, 0, 0.5764706, 1,
1.284815, 0.7546149, 0.3845313, 1, 0, 0.5686275, 1,
1.300205, 0.6119857, 1.581953, 1, 0, 0.5647059, 1,
1.307152, -0.4920365, 2.575558, 1, 0, 0.5568628, 1,
1.312042, 1.97483, -0.04296955, 1, 0, 0.5529412, 1,
1.313643, 0.4849643, 1.421696, 1, 0, 0.5450981, 1,
1.313984, -1.795121, 1.896738, 1, 0, 0.5411765, 1,
1.314903, 0.5851267, 1.935397, 1, 0, 0.5333334, 1,
1.315322, 0.8888419, 0.4767534, 1, 0, 0.5294118, 1,
1.317841, 1.665906, 2.327525, 1, 0, 0.5215687, 1,
1.318413, -0.4402721, 1.793642, 1, 0, 0.5176471, 1,
1.330288, -0.9479414, 0.9648229, 1, 0, 0.509804, 1,
1.33247, 0.2798673, 2.14912, 1, 0, 0.5058824, 1,
1.338962, -1.918378, 2.173414, 1, 0, 0.4980392, 1,
1.344825, 1.429057, 0.02773658, 1, 0, 0.4901961, 1,
1.346914, 0.3253247, 0.5916148, 1, 0, 0.4862745, 1,
1.354231, -0.4938625, 2.571764, 1, 0, 0.4784314, 1,
1.358516, -0.3984139, 2.140232, 1, 0, 0.4745098, 1,
1.363147, 0.4133417, 1.350811, 1, 0, 0.4666667, 1,
1.368365, 1.056344, 1.062111, 1, 0, 0.4627451, 1,
1.369291, -0.04414859, 1.681754, 1, 0, 0.454902, 1,
1.3816, 0.5368784, 2.403129, 1, 0, 0.4509804, 1,
1.383135, -0.527232, 0.05899327, 1, 0, 0.4431373, 1,
1.38769, 1.568488, -1.063187, 1, 0, 0.4392157, 1,
1.395977, 0.3560535, 1.584522, 1, 0, 0.4313726, 1,
1.400762, 1.656211, 0.9152708, 1, 0, 0.427451, 1,
1.422929, 1.049789, 2.174723, 1, 0, 0.4196078, 1,
1.427708, 1.049418, 1.839588, 1, 0, 0.4156863, 1,
1.441161, -0.9578149, 3.849971, 1, 0, 0.4078431, 1,
1.442035, 0.4705389, 1.82154, 1, 0, 0.4039216, 1,
1.443498, -0.06132211, 1.452002, 1, 0, 0.3960784, 1,
1.448149, -0.09026673, 1.784273, 1, 0, 0.3882353, 1,
1.451322, -2.191394, 2.677517, 1, 0, 0.3843137, 1,
1.451736, -0.5709885, 1.095589, 1, 0, 0.3764706, 1,
1.464292, 0.2887684, 1.843143, 1, 0, 0.372549, 1,
1.46515, -0.5109886, 1.267502, 1, 0, 0.3647059, 1,
1.471585, 0.1926209, -0.02962188, 1, 0, 0.3607843, 1,
1.489535, -0.3933131, 3.168128, 1, 0, 0.3529412, 1,
1.4969, -0.7976725, 1.07852, 1, 0, 0.3490196, 1,
1.499663, -0.4962015, 2.074023, 1, 0, 0.3411765, 1,
1.520516, 0.6510355, 1.924301, 1, 0, 0.3372549, 1,
1.522632, -0.08550458, 1.057594, 1, 0, 0.3294118, 1,
1.526393, -1.707244, 2.504498, 1, 0, 0.3254902, 1,
1.537624, -0.8102332, 3.253024, 1, 0, 0.3176471, 1,
1.546732, 0.1676032, 2.523087, 1, 0, 0.3137255, 1,
1.551604, 0.8662121, 1.764427, 1, 0, 0.3058824, 1,
1.57138, -1.59368, 4.429393, 1, 0, 0.2980392, 1,
1.584012, -1.554328, 2.06994, 1, 0, 0.2941177, 1,
1.607676, 0.8419743, 1.703788, 1, 0, 0.2862745, 1,
1.632088, 1.17672, 1.648469, 1, 0, 0.282353, 1,
1.63998, -0.757494, 3.559767, 1, 0, 0.2745098, 1,
1.64184, 1.794244, 1.188832, 1, 0, 0.2705882, 1,
1.65157, 0.2291426, 1.023901, 1, 0, 0.2627451, 1,
1.65997, 0.0007653034, 2.416695, 1, 0, 0.2588235, 1,
1.665929, -0.4314446, 2.14226, 1, 0, 0.2509804, 1,
1.687024, 0.9913381, -0.9719173, 1, 0, 0.2470588, 1,
1.698761, 0.4352008, 0.9459774, 1, 0, 0.2392157, 1,
1.706516, 1.221128, 2.30863, 1, 0, 0.2352941, 1,
1.728323, -0.5293822, 1.089264, 1, 0, 0.227451, 1,
1.737333, 0.8849919, 1.154029, 1, 0, 0.2235294, 1,
1.744521, -0.8596322, 2.041342, 1, 0, 0.2156863, 1,
1.775759, 1.795003, 0.6225554, 1, 0, 0.2117647, 1,
1.788326, -1.116532, 3.013733, 1, 0, 0.2039216, 1,
1.796065, -0.002796559, 2.274648, 1, 0, 0.1960784, 1,
1.842017, 0.8880194, 1.02433, 1, 0, 0.1921569, 1,
1.853741, 0.2219299, 2.165236, 1, 0, 0.1843137, 1,
1.867198, 0.07427149, 0.3202708, 1, 0, 0.1803922, 1,
1.877633, 0.6384652, 2.52709, 1, 0, 0.172549, 1,
1.884614, -1.117886, 2.88705, 1, 0, 0.1686275, 1,
1.89777, 0.2010211, 1.286493, 1, 0, 0.1607843, 1,
1.906068, 0.3900606, -0.2034847, 1, 0, 0.1568628, 1,
1.922302, -0.04005833, 0.6586107, 1, 0, 0.1490196, 1,
1.92967, -1.862857, 4.315174, 1, 0, 0.145098, 1,
1.948906, -1.09825, 2.399025, 1, 0, 0.1372549, 1,
1.955082, 0.3635061, 2.393275, 1, 0, 0.1333333, 1,
1.958465, -1.242359, 1.857768, 1, 0, 0.1254902, 1,
1.992307, 0.09573148, 1.003355, 1, 0, 0.1215686, 1,
2.039642, 0.4800163, -0.06486755, 1, 0, 0.1137255, 1,
2.0851, -0.263114, 3.205188, 1, 0, 0.1098039, 1,
2.120718, -1.158446, 1.701102, 1, 0, 0.1019608, 1,
2.141814, -1.070535, 1.718548, 1, 0, 0.09411765, 1,
2.176182, -0.8886556, 2.627267, 1, 0, 0.09019608, 1,
2.218014, -1.491324, 2.159987, 1, 0, 0.08235294, 1,
2.236255, -1.641882, 3.485389, 1, 0, 0.07843138, 1,
2.300249, -1.028224, 2.603887, 1, 0, 0.07058824, 1,
2.338611, 0.7216337, 0.1384172, 1, 0, 0.06666667, 1,
2.413547, 0.3062696, 2.408506, 1, 0, 0.05882353, 1,
2.417217, -1.950467, 2.53505, 1, 0, 0.05490196, 1,
2.428388, 0.1316124, 1.108873, 1, 0, 0.04705882, 1,
2.469037, -0.1254825, -0.1046126, 1, 0, 0.04313726, 1,
2.563359, 0.07738375, 0.5578303, 1, 0, 0.03529412, 1,
2.568408, 0.5558353, 0.7418066, 1, 0, 0.03137255, 1,
2.693369, 0.2440515, 3.721923, 1, 0, 0.02352941, 1,
3.006362, 0.6996216, 0.7653402, 1, 0, 0.01960784, 1,
3.067796, 0.9969208, 2.359314, 1, 0, 0.01176471, 1,
3.091358, -0.4375514, 2.705034, 1, 0, 0.007843138, 1
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
-0.04925931, -4.084782, -7.520549, 0, -0.5, 0.5, 0.5,
-0.04925931, -4.084782, -7.520549, 1, -0.5, 0.5, 0.5,
-0.04925931, -4.084782, -7.520549, 1, 1.5, 0.5, 0.5,
-0.04925931, -4.084782, -7.520549, 0, 1.5, 0.5, 0.5
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
-4.254546, 0.04228067, -7.520549, 0, -0.5, 0.5, 0.5,
-4.254546, 0.04228067, -7.520549, 1, -0.5, 0.5, 0.5,
-4.254546, 0.04228067, -7.520549, 1, 1.5, 0.5, 0.5,
-4.254546, 0.04228067, -7.520549, 0, 1.5, 0.5, 0.5
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
-4.254546, -4.084782, -0.3875649, 0, -0.5, 0.5, 0.5,
-4.254546, -4.084782, -0.3875649, 1, -0.5, 0.5, 0.5,
-4.254546, -4.084782, -0.3875649, 1, 1.5, 0.5, 0.5,
-4.254546, -4.084782, -0.3875649, 0, 1.5, 0.5, 0.5
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
-3, -3.132383, -5.874475,
3, -3.132383, -5.874475,
-3, -3.132383, -5.874475,
-3, -3.291116, -6.148821,
-2, -3.132383, -5.874475,
-2, -3.291116, -6.148821,
-1, -3.132383, -5.874475,
-1, -3.291116, -6.148821,
0, -3.132383, -5.874475,
0, -3.291116, -6.148821,
1, -3.132383, -5.874475,
1, -3.291116, -6.148821,
2, -3.132383, -5.874475,
2, -3.291116, -6.148821,
3, -3.132383, -5.874475,
3, -3.291116, -6.148821
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
-3, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
-3, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
-3, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
-3, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
-2, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
-2, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
-2, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
-2, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
-1, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
-1, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
-1, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
-1, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
0, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
0, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
0, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
0, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
1, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
1, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
1, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
1, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
2, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
2, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
2, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
2, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5,
3, -3.608583, -6.697512, 0, -0.5, 0.5, 0.5,
3, -3.608583, -6.697512, 1, -0.5, 0.5, 0.5,
3, -3.608583, -6.697512, 1, 1.5, 0.5, 0.5,
3, -3.608583, -6.697512, 0, 1.5, 0.5, 0.5
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
-3.284095, -3, -5.874475,
-3.284095, 3, -5.874475,
-3.284095, -3, -5.874475,
-3.445837, -3, -6.148821,
-3.284095, -2, -5.874475,
-3.445837, -2, -6.148821,
-3.284095, -1, -5.874475,
-3.445837, -1, -6.148821,
-3.284095, 0, -5.874475,
-3.445837, 0, -6.148821,
-3.284095, 1, -5.874475,
-3.445837, 1, -6.148821,
-3.284095, 2, -5.874475,
-3.445837, 2, -6.148821,
-3.284095, 3, -5.874475,
-3.445837, 3, -6.148821
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
-3.76932, -3, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, -3, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, -3, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, -3, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, -2, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, -2, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, -2, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, -2, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, -1, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, -1, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, -1, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, -1, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, 0, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, 0, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, 0, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, 0, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, 1, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, 1, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, 1, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, 1, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, 2, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, 2, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, 2, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, 2, -6.697512, 0, 1.5, 0.5, 0.5,
-3.76932, 3, -6.697512, 0, -0.5, 0.5, 0.5,
-3.76932, 3, -6.697512, 1, -0.5, 0.5, 0.5,
-3.76932, 3, -6.697512, 1, 1.5, 0.5, 0.5,
-3.76932, 3, -6.697512, 0, 1.5, 0.5, 0.5
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
-3.284095, -3.132383, -4,
-3.284095, -3.132383, 4,
-3.284095, -3.132383, -4,
-3.445837, -3.291116, -4,
-3.284095, -3.132383, -2,
-3.445837, -3.291116, -2,
-3.284095, -3.132383, 0,
-3.445837, -3.291116, 0,
-3.284095, -3.132383, 2,
-3.445837, -3.291116, 2,
-3.284095, -3.132383, 4,
-3.445837, -3.291116, 4
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
-3.76932, -3.608583, -4, 0, -0.5, 0.5, 0.5,
-3.76932, -3.608583, -4, 1, -0.5, 0.5, 0.5,
-3.76932, -3.608583, -4, 1, 1.5, 0.5, 0.5,
-3.76932, -3.608583, -4, 0, 1.5, 0.5, 0.5,
-3.76932, -3.608583, -2, 0, -0.5, 0.5, 0.5,
-3.76932, -3.608583, -2, 1, -0.5, 0.5, 0.5,
-3.76932, -3.608583, -2, 1, 1.5, 0.5, 0.5,
-3.76932, -3.608583, -2, 0, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 0, 0, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 0, 1, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 0, 1, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 0, 0, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 2, 0, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 2, 1, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 2, 1, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 2, 0, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 4, 0, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 4, 1, -0.5, 0.5, 0.5,
-3.76932, -3.608583, 4, 1, 1.5, 0.5, 0.5,
-3.76932, -3.608583, 4, 0, 1.5, 0.5, 0.5
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
-3.284095, -3.132383, -5.874475,
-3.284095, 3.216944, -5.874475,
-3.284095, -3.132383, 5.099346,
-3.284095, 3.216944, 5.099346,
-3.284095, -3.132383, -5.874475,
-3.284095, -3.132383, 5.099346,
-3.284095, 3.216944, -5.874475,
-3.284095, 3.216944, 5.099346,
-3.284095, -3.132383, -5.874475,
3.185576, -3.132383, -5.874475,
-3.284095, -3.132383, 5.099346,
3.185576, -3.132383, 5.099346,
-3.284095, 3.216944, -5.874475,
3.185576, 3.216944, -5.874475,
-3.284095, 3.216944, 5.099346,
3.185576, 3.216944, 5.099346,
3.185576, -3.132383, -5.874475,
3.185576, 3.216944, -5.874475,
3.185576, -3.132383, 5.099346,
3.185576, 3.216944, 5.099346,
3.185576, -3.132383, -5.874475,
3.185576, -3.132383, 5.099346,
3.185576, 3.216944, -5.874475,
3.185576, 3.216944, 5.099346
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
var radius = 7.600466;
var distance = 33.81533;
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
mvMatrix.translate( 0.04925931, -0.04228067, 0.3875649 );
mvMatrix.scale( 1.270199, 1.294274, 0.7488524 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81533);
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
2-nitro-benzamide<-read.table("2-nitro-benzamide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-2-nitro-benzamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitro' not found
```

```r
y<-2-nitro-benzamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitro' not found
```

```r
z<-2-nitro-benzamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitro' not found
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
-3.189877, -1.150632, -2.458716, 0, 0, 1, 1, 1,
-3.038872, 0.07420491, -1.818577, 1, 0, 0, 1, 1,
-2.903554, 0.342057, -0.05483743, 1, 0, 0, 1, 1,
-2.848594, 1.794591, 0.76013, 1, 0, 0, 1, 1,
-2.750973, -0.3284425, -1.063395, 1, 0, 0, 1, 1,
-2.673634, 0.8100628, -1.879888, 1, 0, 0, 1, 1,
-2.582423, 1.016586, -1.291524, 0, 0, 0, 1, 1,
-2.532327, 1.305469, -0.7397618, 0, 0, 0, 1, 1,
-2.379821, -1.750178, -2.005954, 0, 0, 0, 1, 1,
-2.345771, -0.3291137, -1.102652, 0, 0, 0, 1, 1,
-2.343244, -2.600379, -5.714663, 0, 0, 0, 1, 1,
-2.340787, -0.1953321, -2.589504, 0, 0, 0, 1, 1,
-2.338843, -0.464752, -1.760785, 0, 0, 0, 1, 1,
-2.296965, 0.5177597, -1.168794, 1, 1, 1, 1, 1,
-2.290637, -0.319706, -1.342853, 1, 1, 1, 1, 1,
-2.259466, -1.067347, -1.353061, 1, 1, 1, 1, 1,
-2.255886, -0.4635381, -1.329859, 1, 1, 1, 1, 1,
-2.20944, 0.03482459, -0.8798733, 1, 1, 1, 1, 1,
-2.201782, 0.2284224, -0.4059275, 1, 1, 1, 1, 1,
-2.193095, -0.6021762, 0.1855781, 1, 1, 1, 1, 1,
-2.189147, 0.8025833, -1.512495, 1, 1, 1, 1, 1,
-2.177488, -0.2666765, -0.9927757, 1, 1, 1, 1, 1,
-2.122202, 0.04146262, -2.340266, 1, 1, 1, 1, 1,
-2.115962, -1.557064, -2.484398, 1, 1, 1, 1, 1,
-2.114116, -0.1111013, -1.664493, 1, 1, 1, 1, 1,
-2.097386, -1.020179, -2.971702, 1, 1, 1, 1, 1,
-2.071809, -0.940595, -1.049243, 1, 1, 1, 1, 1,
-2.011725, -0.1963074, -1.574253, 1, 1, 1, 1, 1,
-1.9898, -0.0002253919, -1.871065, 0, 0, 1, 1, 1,
-1.970447, -0.09077719, -1.991547, 1, 0, 0, 1, 1,
-1.930737, -0.2724047, -2.656687, 1, 0, 0, 1, 1,
-1.925529, 1.128485, -2.577164, 1, 0, 0, 1, 1,
-1.922978, -2.223547, -1.965611, 1, 0, 0, 1, 1,
-1.91133, -0.738216, -0.4812841, 1, 0, 0, 1, 1,
-1.886888, 0.6351419, -2.298839, 0, 0, 0, 1, 1,
-1.874244, -0.2816183, -0.3968722, 0, 0, 0, 1, 1,
-1.870839, -0.5205485, -1.128859, 0, 0, 0, 1, 1,
-1.86853, 2.367399, 0.1353551, 0, 0, 0, 1, 1,
-1.828209, 0.9933026, -1.416412, 0, 0, 0, 1, 1,
-1.795548, 0.03283204, -1.349436, 0, 0, 0, 1, 1,
-1.788845, -0.3485543, -1.812722, 0, 0, 0, 1, 1,
-1.788573, 1.178808, -0.192429, 1, 1, 1, 1, 1,
-1.778232, -0.4120027, -1.717201, 1, 1, 1, 1, 1,
-1.77787, -0.05226872, -2.917744, 1, 1, 1, 1, 1,
-1.776312, -1.700451, -2.057927, 1, 1, 1, 1, 1,
-1.748534, 0.1958813, -1.452394, 1, 1, 1, 1, 1,
-1.744569, 0.3280957, -2.400766, 1, 1, 1, 1, 1,
-1.739456, -1.666416, -0.1525869, 1, 1, 1, 1, 1,
-1.725685, 0.5589203, -1.462086, 1, 1, 1, 1, 1,
-1.697373, 0.8348994, -0.8650546, 1, 1, 1, 1, 1,
-1.692665, 0.2085266, -1.123743, 1, 1, 1, 1, 1,
-1.687407, -0.9904788, -2.690024, 1, 1, 1, 1, 1,
-1.681649, 0.7806402, -0.1685776, 1, 1, 1, 1, 1,
-1.672329, -0.2051098, -1.90257, 1, 1, 1, 1, 1,
-1.669057, 2.478947, -0.02969719, 1, 1, 1, 1, 1,
-1.651789, -1.52849, -2.970725, 1, 1, 1, 1, 1,
-1.638647, -0.5975077, -1.351324, 0, 0, 1, 1, 1,
-1.637972, 1.189401, -0.6412265, 1, 0, 0, 1, 1,
-1.63273, 0.8218057, 1.870738, 1, 0, 0, 1, 1,
-1.63098, 0.2358685, -1.979983, 1, 0, 0, 1, 1,
-1.614166, 0.4739365, -2.572958, 1, 0, 0, 1, 1,
-1.584553, 0.5054937, -0.8191816, 1, 0, 0, 1, 1,
-1.579584, -1.104896, -0.1108817, 0, 0, 0, 1, 1,
-1.567626, 1.05942, 0.04228394, 0, 0, 0, 1, 1,
-1.560645, -0.6771708, -1.092556, 0, 0, 0, 1, 1,
-1.557052, 0.2402282, -2.239581, 0, 0, 0, 1, 1,
-1.544636, 0.1466044, -0.3174523, 0, 0, 0, 1, 1,
-1.542613, 1.220497, -0.5719057, 0, 0, 0, 1, 1,
-1.532355, 2.268164, -0.8027822, 0, 0, 0, 1, 1,
-1.528556, 1.616515, -0.9189942, 1, 1, 1, 1, 1,
-1.508973, 0.2410078, -0.9539074, 1, 1, 1, 1, 1,
-1.507922, 0.09327347, -2.336967, 1, 1, 1, 1, 1,
-1.502045, -1.873222, 1.297819, 1, 1, 1, 1, 1,
-1.487498, -1.237211, -3.046584, 1, 1, 1, 1, 1,
-1.477933, 0.4736877, -1.588202, 1, 1, 1, 1, 1,
-1.475915, 0.126887, -2.102003, 1, 1, 1, 1, 1,
-1.474332, -0.007640354, -1.092387, 1, 1, 1, 1, 1,
-1.472832, -0.9716199, -1.698871, 1, 1, 1, 1, 1,
-1.465466, 0.1619791, -1.391068, 1, 1, 1, 1, 1,
-1.459066, 0.7330598, -1.670391, 1, 1, 1, 1, 1,
-1.45771, 1.713201, -0.9802939, 1, 1, 1, 1, 1,
-1.454457, -1.655286, -2.378825, 1, 1, 1, 1, 1,
-1.449773, 0.5118042, -2.707665, 1, 1, 1, 1, 1,
-1.442395, -1.070779, -1.621272, 1, 1, 1, 1, 1,
-1.410889, -1.203982, -1.36443, 0, 0, 1, 1, 1,
-1.398224, -2.436833, -1.913301, 1, 0, 0, 1, 1,
-1.398093, 0.1855381, -0.247255, 1, 0, 0, 1, 1,
-1.397852, 1.128409, -0.4486805, 1, 0, 0, 1, 1,
-1.397554, 0.1284461, -1.36534, 1, 0, 0, 1, 1,
-1.392814, 0.5080656, -2.419378, 1, 0, 0, 1, 1,
-1.384612, 0.2911009, -1.604609, 0, 0, 0, 1, 1,
-1.361523, 0.3758284, -2.248718, 0, 0, 0, 1, 1,
-1.358586, -0.6066679, -2.729627, 0, 0, 0, 1, 1,
-1.352152, -0.003984639, -2.471571, 0, 0, 0, 1, 1,
-1.349943, 2.166821, 0.1606964, 0, 0, 0, 1, 1,
-1.344675, 1.458267, -0.4775241, 0, 0, 0, 1, 1,
-1.341735, 0.3177437, -0.9127798, 0, 0, 0, 1, 1,
-1.333047, 0.245563, -2.875909, 1, 1, 1, 1, 1,
-1.325978, -0.3920753, -1.475074, 1, 1, 1, 1, 1,
-1.30609, -0.638943, -1.511127, 1, 1, 1, 1, 1,
-1.297442, -0.03787367, -2.392615, 1, 1, 1, 1, 1,
-1.29456, -0.4107035, -2.352217, 1, 1, 1, 1, 1,
-1.289882, 0.6962221, -1.15867, 1, 1, 1, 1, 1,
-1.28386, 0.04450968, -1.467751, 1, 1, 1, 1, 1,
-1.281388, -0.1469667, -2.353243, 1, 1, 1, 1, 1,
-1.278929, -1.132318, -0.5921338, 1, 1, 1, 1, 1,
-1.255533, -0.7913685, -2.89293, 1, 1, 1, 1, 1,
-1.251694, 0.7728863, -2.684982, 1, 1, 1, 1, 1,
-1.251309, -0.07476162, -2.313739, 1, 1, 1, 1, 1,
-1.250168, 1.166835, -0.8204093, 1, 1, 1, 1, 1,
-1.244635, -0.86985, -3.459294, 1, 1, 1, 1, 1,
-1.240921, -0.4106807, -1.21847, 1, 1, 1, 1, 1,
-1.240467, -0.2068002, -0.484303, 0, 0, 1, 1, 1,
-1.229765, -0.9774349, -2.892369, 1, 0, 0, 1, 1,
-1.22429, -0.2262696, -3.236451, 1, 0, 0, 1, 1,
-1.220961, -0.4042734, -3.141975, 1, 0, 0, 1, 1,
-1.21912, -0.3700617, -2.151269, 1, 0, 0, 1, 1,
-1.211932, -0.3212796, -3.556849, 1, 0, 0, 1, 1,
-1.211437, 1.018365, -1.234333, 0, 0, 0, 1, 1,
-1.194246, 1.341997, -0.1627544, 0, 0, 0, 1, 1,
-1.187827, 0.4275538, -2.751011, 0, 0, 0, 1, 1,
-1.18652, 0.1862738, -1.008812, 0, 0, 0, 1, 1,
-1.175308, 1.838695, -0.8593325, 0, 0, 0, 1, 1,
-1.163115, 0.293614, -0.6468803, 0, 0, 0, 1, 1,
-1.162701, -0.5232383, -1.755866, 0, 0, 0, 1, 1,
-1.156996, -2.06724, -1.908736, 1, 1, 1, 1, 1,
-1.150797, 0.1972152, -2.539034, 1, 1, 1, 1, 1,
-1.150037, 1.388189, 0.5228854, 1, 1, 1, 1, 1,
-1.145884, 1.797062, -1.110889, 1, 1, 1, 1, 1,
-1.142367, -0.3558613, -0.6781643, 1, 1, 1, 1, 1,
-1.140713, 0.512896, -2.822803, 1, 1, 1, 1, 1,
-1.1396, -1.497929, -2.355205, 1, 1, 1, 1, 1,
-1.134317, 0.3322926, 0.6776286, 1, 1, 1, 1, 1,
-1.134107, 1.081529, -0.3894546, 1, 1, 1, 1, 1,
-1.130165, -0.609967, -4.044149, 1, 1, 1, 1, 1,
-1.126229, -0.8495954, -3.119205, 1, 1, 1, 1, 1,
-1.122997, 0.4681154, -1.284024, 1, 1, 1, 1, 1,
-1.109912, -0.8141964, -2.639759, 1, 1, 1, 1, 1,
-1.108223, 0.4784724, -2.168437, 1, 1, 1, 1, 1,
-1.105914, 0.1741844, -2.051043, 1, 1, 1, 1, 1,
-1.102643, -0.1106254, -0.9084179, 0, 0, 1, 1, 1,
-1.101091, 1.658641, -1.452335, 1, 0, 0, 1, 1,
-1.096772, 0.7367247, -0.4866716, 1, 0, 0, 1, 1,
-1.09477, -0.6243525, -1.570074, 1, 0, 0, 1, 1,
-1.088669, 0.6205988, 0.1011417, 1, 0, 0, 1, 1,
-1.075189, -0.9401324, -1.344671, 1, 0, 0, 1, 1,
-1.070438, 0.2196507, -0.6776116, 0, 0, 0, 1, 1,
-1.061859, -1.704826, -1.783763, 0, 0, 0, 1, 1,
-1.060971, 0.1336368, -0.6227891, 0, 0, 0, 1, 1,
-1.060073, 0.1757132, -2.617056, 0, 0, 0, 1, 1,
-1.059524, -1.126054, -1.492503, 0, 0, 0, 1, 1,
-1.058948, -2.837273, -1.270613, 0, 0, 0, 1, 1,
-1.047702, -1.905819, -1.022021, 0, 0, 0, 1, 1,
-1.044616, 0.3326481, -0.4490809, 1, 1, 1, 1, 1,
-1.042421, -1.784266, -1.38136, 1, 1, 1, 1, 1,
-1.038885, 0.1255814, -2.251595, 1, 1, 1, 1, 1,
-1.033208, -0.270458, -2.479683, 1, 1, 1, 1, 1,
-1.031124, 0.2932346, -0.3744749, 1, 1, 1, 1, 1,
-1.025845, 1.141523, 0.640245, 1, 1, 1, 1, 1,
-1.025148, -1.295218, -1.147813, 1, 1, 1, 1, 1,
-1.02142, -0.921527, -1.866528, 1, 1, 1, 1, 1,
-1.018259, 1.11407, -1.265709, 1, 1, 1, 1, 1,
-1.017493, -0.9968867, -1.857049, 1, 1, 1, 1, 1,
-1.0166, 0.1190073, -0.2182451, 1, 1, 1, 1, 1,
-1.014428, 0.4882068, -0.293797, 1, 1, 1, 1, 1,
-1.013908, 0.2017117, -1.649471, 1, 1, 1, 1, 1,
-1.006006, 0.2324858, -0.9008695, 1, 1, 1, 1, 1,
-1.004608, 0.5469756, -1.859303, 1, 1, 1, 1, 1,
-1.00262, -1.640292, -1.813326, 0, 0, 1, 1, 1,
-1.002378, -0.8341997, -1.701964, 1, 0, 0, 1, 1,
-1.001511, 0.530662, -1.110613, 1, 0, 0, 1, 1,
-0.9995707, -1.322671, -1.633822, 1, 0, 0, 1, 1,
-0.9984227, -0.09234799, -2.63549, 1, 0, 0, 1, 1,
-0.996418, 0.1502941, -2.072937, 1, 0, 0, 1, 1,
-0.9957697, 2.765417, 0.5292609, 0, 0, 0, 1, 1,
-0.9905664, 0.4534697, -2.011542, 0, 0, 0, 1, 1,
-0.9884501, -0.2245219, -2.79045, 0, 0, 0, 1, 1,
-0.985, 0.9338506, -1.405356, 0, 0, 0, 1, 1,
-0.9827377, 2.149035, 2.083315, 0, 0, 0, 1, 1,
-0.9822841, -0.8126897, -1.211303, 0, 0, 0, 1, 1,
-0.9802324, 0.146875, -2.846235, 0, 0, 0, 1, 1,
-0.9783812, -0.5533568, -1.452121, 1, 1, 1, 1, 1,
-0.9770122, 0.6140885, 0.6208714, 1, 1, 1, 1, 1,
-0.969384, 1.251082, -2.879485, 1, 1, 1, 1, 1,
-0.9685935, 0.670935, -0.627239, 1, 1, 1, 1, 1,
-0.9601759, 0.6059116, -0.1734405, 1, 1, 1, 1, 1,
-0.9581106, 0.7168458, -1.344257, 1, 1, 1, 1, 1,
-0.9538097, 0.8426907, -1.092492, 1, 1, 1, 1, 1,
-0.953243, -0.6463253, -2.755013, 1, 1, 1, 1, 1,
-0.9475783, -1.791906, -2.149804, 1, 1, 1, 1, 1,
-0.9400997, 1.584455, -1.725444, 1, 1, 1, 1, 1,
-0.9377317, 0.02477185, -2.033609, 1, 1, 1, 1, 1,
-0.9193102, 0.2797914, -1.272963, 1, 1, 1, 1, 1,
-0.9187791, 0.3983142, -0.740555, 1, 1, 1, 1, 1,
-0.9076921, 0.2999292, -2.181442, 1, 1, 1, 1, 1,
-0.9026501, 0.4252477, -0.05505484, 1, 1, 1, 1, 1,
-0.9002355, -0.7889661, -3.345605, 0, 0, 1, 1, 1,
-0.8997999, -0.2773811, -1.433977, 1, 0, 0, 1, 1,
-0.8990754, 1.088132, -0.5647184, 1, 0, 0, 1, 1,
-0.8988646, -0.3391016, -2.952819, 1, 0, 0, 1, 1,
-0.8958051, -0.6715614, -1.435155, 1, 0, 0, 1, 1,
-0.8949016, -0.5620378, -3.146142, 1, 0, 0, 1, 1,
-0.8943626, 0.5961159, 0.08311256, 0, 0, 0, 1, 1,
-0.8934573, 0.2743187, -1.795271, 0, 0, 0, 1, 1,
-0.890478, -0.3338238, -2.912073, 0, 0, 0, 1, 1,
-0.8889452, -0.08052341, -2.839561, 0, 0, 0, 1, 1,
-0.88544, -0.8285528, -3.032668, 0, 0, 0, 1, 1,
-0.8769297, -1.379564, -2.987374, 0, 0, 0, 1, 1,
-0.8766305, -0.02856291, -1.324605, 0, 0, 0, 1, 1,
-0.8743301, -1.204127, -3.178762, 1, 1, 1, 1, 1,
-0.8741106, -1.968426, -1.950729, 1, 1, 1, 1, 1,
-0.8704275, 0.7093822, -0.4228483, 1, 1, 1, 1, 1,
-0.8697324, 0.4091205, -1.762839, 1, 1, 1, 1, 1,
-0.8594547, -1.36878, -3.454282, 1, 1, 1, 1, 1,
-0.8569688, -0.09930241, -2.304375, 1, 1, 1, 1, 1,
-0.8549761, 0.4053064, -1.985441, 1, 1, 1, 1, 1,
-0.8541083, -0.419454, -1.070358, 1, 1, 1, 1, 1,
-0.8494633, -0.1454061, -1.83076, 1, 1, 1, 1, 1,
-0.8479331, 1.080138, -0.2760679, 1, 1, 1, 1, 1,
-0.8476946, 1.335855, -0.3760303, 1, 1, 1, 1, 1,
-0.8447112, 0.8507105, -1.933843, 1, 1, 1, 1, 1,
-0.8322317, -1.036373, -3.31736, 1, 1, 1, 1, 1,
-0.8304793, 0.5073593, 0.5901955, 1, 1, 1, 1, 1,
-0.8284043, -0.4424387, -2.228033, 1, 1, 1, 1, 1,
-0.8278784, -0.8514966, -2.168896, 0, 0, 1, 1, 1,
-0.8251456, 0.5306584, 0.009669932, 1, 0, 0, 1, 1,
-0.8250126, -0.410942, -1.846086, 1, 0, 0, 1, 1,
-0.8194478, -0.2090206, -1.428399, 1, 0, 0, 1, 1,
-0.8179622, 0.9399316, 0.06942516, 1, 0, 0, 1, 1,
-0.8148252, -0.6589362, -2.941277, 1, 0, 0, 1, 1,
-0.8118189, -1.456611, -3.108586, 0, 0, 0, 1, 1,
-0.8117517, 0.7262862, -1.888499, 0, 0, 0, 1, 1,
-0.8087595, -0.9372536, -1.379662, 0, 0, 0, 1, 1,
-0.8005593, -1.223903, -3.870661, 0, 0, 0, 1, 1,
-0.7999997, -1.044454, -2.042551, 0, 0, 0, 1, 1,
-0.7966451, 0.8383218, -0.09538803, 0, 0, 0, 1, 1,
-0.7891923, 0.5948194, 0.2833262, 0, 0, 0, 1, 1,
-0.7725149, -0.02201322, -0.5036218, 1, 1, 1, 1, 1,
-0.7706742, -1.469404, -0.2934273, 1, 1, 1, 1, 1,
-0.767864, -0.9305829, -1.280122, 1, 1, 1, 1, 1,
-0.7668692, -1.878764, -4.155299, 1, 1, 1, 1, 1,
-0.7651217, 2.720897, -1.222779, 1, 1, 1, 1, 1,
-0.7409537, 2.61788, -0.01067068, 1, 1, 1, 1, 1,
-0.7405254, 1.918469, -1.165286, 1, 1, 1, 1, 1,
-0.7384563, -0.5666606, -2.972932, 1, 1, 1, 1, 1,
-0.7342648, 0.405374, 0.1353451, 1, 1, 1, 1, 1,
-0.7325305, 0.7393241, -1.099733, 1, 1, 1, 1, 1,
-0.7282447, -0.8522801, -2.361645, 1, 1, 1, 1, 1,
-0.7222089, -0.330428, -1.042078, 1, 1, 1, 1, 1,
-0.713955, 0.2230743, -0.08129858, 1, 1, 1, 1, 1,
-0.7118198, 0.7863373, -1.95408, 1, 1, 1, 1, 1,
-0.7077797, -0.0974533, -2.078614, 1, 1, 1, 1, 1,
-0.7037893, 1.86797, -2.238792, 0, 0, 1, 1, 1,
-0.6962203, 1.715338, 0.3315753, 1, 0, 0, 1, 1,
-0.6947448, 0.2431993, -1.433923, 1, 0, 0, 1, 1,
-0.6870102, -2.238767, -1.579084, 1, 0, 0, 1, 1,
-0.6868885, 1.550334, -0.3324909, 1, 0, 0, 1, 1,
-0.6851592, -0.1352812, -2.468863, 1, 0, 0, 1, 1,
-0.6802676, -0.07377113, -1.678468, 0, 0, 0, 1, 1,
-0.6794263, 0.4518653, -2.341589, 0, 0, 0, 1, 1,
-0.6732931, 0.1225979, -2.016289, 0, 0, 0, 1, 1,
-0.6723917, -0.4899233, -0.8031551, 0, 0, 0, 1, 1,
-0.6698872, 0.4025509, -2.168677, 0, 0, 0, 1, 1,
-0.6595959, 2.055961, -1.228154, 0, 0, 0, 1, 1,
-0.6585206, -0.06630941, -1.403539, 0, 0, 0, 1, 1,
-0.6553838, 0.9159214, -0.7083846, 1, 1, 1, 1, 1,
-0.6553431, 1.413311, -0.4923631, 1, 1, 1, 1, 1,
-0.6551008, 0.9365343, -0.2569757, 1, 1, 1, 1, 1,
-0.650104, -1.49841, -2.896718, 1, 1, 1, 1, 1,
-0.6356052, -1.882473, -2.987083, 1, 1, 1, 1, 1,
-0.6244918, -0.1852509, -2.875674, 1, 1, 1, 1, 1,
-0.6231095, 1.321761, -2.200047, 1, 1, 1, 1, 1,
-0.620981, 2.02803, -0.6744744, 1, 1, 1, 1, 1,
-0.6185918, -0.5920064, -2.656025, 1, 1, 1, 1, 1,
-0.6183727, -0.4157447, -4.075427, 1, 1, 1, 1, 1,
-0.6176361, 1.662478, -0.1361127, 1, 1, 1, 1, 1,
-0.6132119, 0.4908173, -1.965922, 1, 1, 1, 1, 1,
-0.6114464, -0.2963974, -1.284154, 1, 1, 1, 1, 1,
-0.6105149, -0.6876757, -2.055689, 1, 1, 1, 1, 1,
-0.6098836, -1.136288, -0.4267059, 1, 1, 1, 1, 1,
-0.6063155, -1.276636, -1.36825, 0, 0, 1, 1, 1,
-0.605422, -1.791488, -3.163744, 1, 0, 0, 1, 1,
-0.6034007, 0.5215159, -0.9139758, 1, 0, 0, 1, 1,
-0.5977551, -1.21315, -2.8426, 1, 0, 0, 1, 1,
-0.5950369, -1.227027, -2.83361, 1, 0, 0, 1, 1,
-0.5901392, 0.6395661, -1.211899, 1, 0, 0, 1, 1,
-0.5846314, 0.3072726, -0.4653808, 0, 0, 0, 1, 1,
-0.5815125, -0.7255026, -3.658873, 0, 0, 0, 1, 1,
-0.5789788, -0.3593715, -2.483453, 0, 0, 0, 1, 1,
-0.5713401, -0.6240181, -4.612029, 0, 0, 0, 1, 1,
-0.5712435, 0.3215593, -1.482865, 0, 0, 0, 1, 1,
-0.5705676, -0.3700091, -2.355753, 0, 0, 0, 1, 1,
-0.5528131, 0.5433098, -1.5476, 0, 0, 0, 1, 1,
-0.5465275, -0.304188, 0.9114985, 1, 1, 1, 1, 1,
-0.5441734, -0.8809847, -2.859598, 1, 1, 1, 1, 1,
-0.5328565, -0.8547879, -3.106058, 1, 1, 1, 1, 1,
-0.5308149, 0.2181264, -1.883796, 1, 1, 1, 1, 1,
-0.5306959, -0.01528331, -1.767067, 1, 1, 1, 1, 1,
-0.5241637, 0.08069728, -0.3114872, 1, 1, 1, 1, 1,
-0.5154653, 1.915092, 0.1730194, 1, 1, 1, 1, 1,
-0.5153231, -0.9808912, -2.850316, 1, 1, 1, 1, 1,
-0.5141354, 0.02441052, -0.2430911, 1, 1, 1, 1, 1,
-0.5137914, 1.873951, -0.1029641, 1, 1, 1, 1, 1,
-0.5117229, -1.167838, -0.3440502, 1, 1, 1, 1, 1,
-0.5104527, -0.854521, -3.485507, 1, 1, 1, 1, 1,
-0.5024921, 0.3261174, -1.609075, 1, 1, 1, 1, 1,
-0.5018759, 0.3120241, -1.978001, 1, 1, 1, 1, 1,
-0.499458, -1.023458, -2.827278, 1, 1, 1, 1, 1,
-0.4939024, 1.405716, 0.5040123, 0, 0, 1, 1, 1,
-0.4899104, 1.341102, -1.217604, 1, 0, 0, 1, 1,
-0.4857399, 1.238684, -1.26844, 1, 0, 0, 1, 1,
-0.4831923, -1.541773, -2.947352, 1, 0, 0, 1, 1,
-0.4805246, 1.550546, -2.577387, 1, 0, 0, 1, 1,
-0.477977, 1.335182, 0.08084571, 1, 0, 0, 1, 1,
-0.4769403, -0.02262759, -0.9299028, 0, 0, 0, 1, 1,
-0.4768908, -1.317469, -1.177815, 0, 0, 0, 1, 1,
-0.4702988, -0.1218943, -1.808508, 0, 0, 0, 1, 1,
-0.4673598, 0.443689, -0.7936172, 0, 0, 0, 1, 1,
-0.4638825, 0.3988072, -2.778284, 0, 0, 0, 1, 1,
-0.46149, 0.07325704, 0.1774249, 0, 0, 0, 1, 1,
-0.459713, -0.687016, -2.836648, 0, 0, 0, 1, 1,
-0.4561958, 0.254902, -0.1275285, 1, 1, 1, 1, 1,
-0.4541633, -0.7921918, -2.097734, 1, 1, 1, 1, 1,
-0.4503825, 0.6153155, -1.05859, 1, 1, 1, 1, 1,
-0.4499963, 1.450376, -0.07451041, 1, 1, 1, 1, 1,
-0.4492045, 0.9279649, -0.6547325, 1, 1, 1, 1, 1,
-0.4477056, 1.68165, -1.572374, 1, 1, 1, 1, 1,
-0.4459175, -0.2811267, -1.081146, 1, 1, 1, 1, 1,
-0.4439873, -0.4654799, -1.893264, 1, 1, 1, 1, 1,
-0.4429662, 0.7128913, -0.0554481, 1, 1, 1, 1, 1,
-0.4412816, 0.7452702, -2.239752, 1, 1, 1, 1, 1,
-0.4326396, 0.3880243, 0.1581719, 1, 1, 1, 1, 1,
-0.4324608, 0.1175475, -1.637116, 1, 1, 1, 1, 1,
-0.428556, 0.2474332, -1.736234, 1, 1, 1, 1, 1,
-0.4269339, -0.4977026, -1.526748, 1, 1, 1, 1, 1,
-0.4229638, -0.6737123, -2.324101, 1, 1, 1, 1, 1,
-0.4156375, -0.7172257, -4.604481, 0, 0, 1, 1, 1,
-0.4092858, -0.4071368, -2.179292, 1, 0, 0, 1, 1,
-0.4076111, 0.5239147, -0.06552948, 1, 0, 0, 1, 1,
-0.4075448, -0.7498423, -1.269289, 1, 0, 0, 1, 1,
-0.4069889, -0.322505, -3.896507, 1, 0, 0, 1, 1,
-0.4038803, 0.4836322, -0.9549083, 1, 0, 0, 1, 1,
-0.402238, 0.2136628, -0.5197974, 0, 0, 0, 1, 1,
-0.3996879, -0.01199161, -1.57138, 0, 0, 0, 1, 1,
-0.3955728, -0.925658, -2.925343, 0, 0, 0, 1, 1,
-0.3952676, -0.355069, -2.605017, 0, 0, 0, 1, 1,
-0.3887503, 0.2246682, -0.4856264, 0, 0, 0, 1, 1,
-0.3855989, -2.401175, -2.508073, 0, 0, 0, 1, 1,
-0.3805611, 0.3295523, 1.417831, 0, 0, 0, 1, 1,
-0.3805572, -0.003395092, -0.8918781, 1, 1, 1, 1, 1,
-0.3749843, 0.5806438, 0.7290247, 1, 1, 1, 1, 1,
-0.3742522, 0.7221799, 0.03550083, 1, 1, 1, 1, 1,
-0.3731466, -0.6801301, -3.156917, 1, 1, 1, 1, 1,
-0.3709655, -2.140792, -2.327428, 1, 1, 1, 1, 1,
-0.3695555, 0.2517936, 0.5578943, 1, 1, 1, 1, 1,
-0.3680367, -1.292371, -3.874401, 1, 1, 1, 1, 1,
-0.3672228, -0.2982275, -3.424302, 1, 1, 1, 1, 1,
-0.3649673, 0.9047531, 0.5978851, 1, 1, 1, 1, 1,
-0.3608797, -0.287625, -0.9319985, 1, 1, 1, 1, 1,
-0.3595794, -0.1504264, -1.732258, 1, 1, 1, 1, 1,
-0.3590949, -0.1462829, -1.97538, 1, 1, 1, 1, 1,
-0.358974, 0.7492682, -1.140943, 1, 1, 1, 1, 1,
-0.356378, -0.7697167, -3.918089, 1, 1, 1, 1, 1,
-0.3503188, -1.129762, -5.119106, 1, 1, 1, 1, 1,
-0.3489131, -0.3287342, -0.2140559, 0, 0, 1, 1, 1,
-0.3439637, 1.112616, -1.794257, 1, 0, 0, 1, 1,
-0.3425075, -0.7840743, -4.385666, 1, 0, 0, 1, 1,
-0.3422334, 0.4475335, -0.5787641, 1, 0, 0, 1, 1,
-0.3412329, 0.5770701, -0.823433, 1, 0, 0, 1, 1,
-0.3393469, 1.486511, 0.04157518, 1, 0, 0, 1, 1,
-0.3325592, 0.6362388, -1.145633, 0, 0, 0, 1, 1,
-0.3300354, -1.011669, -0.3904481, 0, 0, 0, 1, 1,
-0.3294352, -0.1435074, -0.5272452, 0, 0, 0, 1, 1,
-0.3289148, -0.7719631, -3.915053, 0, 0, 0, 1, 1,
-0.3280748, 0.7894642, -0.485794, 0, 0, 0, 1, 1,
-0.3269172, -0.7105231, -1.829114, 0, 0, 0, 1, 1,
-0.3240056, 0.6304696, -1.128534, 0, 0, 0, 1, 1,
-0.3106367, 0.9930094, 1.079123, 1, 1, 1, 1, 1,
-0.3104842, -0.006176121, -2.477203, 1, 1, 1, 1, 1,
-0.3082265, -0.1812285, -0.849576, 1, 1, 1, 1, 1,
-0.3033326, 0.2498137, -1.493763, 1, 1, 1, 1, 1,
-0.30075, 0.03775481, -2.406189, 1, 1, 1, 1, 1,
-0.2977397, -0.4660505, -3.241459, 1, 1, 1, 1, 1,
-0.2950185, 0.8862966, 2.145393, 1, 1, 1, 1, 1,
-0.2940009, -0.8048918, -3.636017, 1, 1, 1, 1, 1,
-0.2934417, 3.124479, 0.8930967, 1, 1, 1, 1, 1,
-0.2904431, 1.680814, 1.711554, 1, 1, 1, 1, 1,
-0.2867447, 0.9495683, -1.979573, 1, 1, 1, 1, 1,
-0.2813246, -0.5537323, -3.787698, 1, 1, 1, 1, 1,
-0.2806201, -1.855559, -2.478664, 1, 1, 1, 1, 1,
-0.2794588, -0.4217603, -3.302609, 1, 1, 1, 1, 1,
-0.2793395, -0.1614376, -1.276797, 1, 1, 1, 1, 1,
-0.277161, 0.3720198, -0.9289446, 0, 0, 1, 1, 1,
-0.2758623, 1.415908, 0.5975087, 1, 0, 0, 1, 1,
-0.2726298, 0.1469144, -1.554452, 1, 0, 0, 1, 1,
-0.2663397, -1.214663, -3.438029, 1, 0, 0, 1, 1,
-0.2602042, 0.722293, 0.09658585, 1, 0, 0, 1, 1,
-0.2576857, 0.9746517, -0.122567, 1, 0, 0, 1, 1,
-0.255335, 1.023986, -0.5595859, 0, 0, 0, 1, 1,
-0.2545061, 0.7203734, -0.06271725, 0, 0, 0, 1, 1,
-0.2532638, 0.1131027, -1.323911, 0, 0, 0, 1, 1,
-0.2511286, 0.1229541, -1.484277, 0, 0, 0, 1, 1,
-0.2507747, 0.3707289, -0.1916558, 0, 0, 0, 1, 1,
-0.2442849, -0.09942225, -1.548522, 0, 0, 0, 1, 1,
-0.2442217, -0.5519369, -0.9614384, 0, 0, 0, 1, 1,
-0.238882, -0.04306269, -1.796113, 1, 1, 1, 1, 1,
-0.2368099, -0.2132801, -2.379189, 1, 1, 1, 1, 1,
-0.2338418, 1.427131, -0.9882486, 1, 1, 1, 1, 1,
-0.232816, -0.5487552, -2.043993, 1, 1, 1, 1, 1,
-0.2303425, -0.9757026, -1.859317, 1, 1, 1, 1, 1,
-0.2296288, -1.320044, -3.170282, 1, 1, 1, 1, 1,
-0.2274792, -0.5397342, -3.035966, 1, 1, 1, 1, 1,
-0.2242414, -0.4104097, -1.148782, 1, 1, 1, 1, 1,
-0.2228752, -0.6020311, -4.88568, 1, 1, 1, 1, 1,
-0.209043, 0.2174163, -0.9521991, 1, 1, 1, 1, 1,
-0.2089475, -0.03450337, -2.84673, 1, 1, 1, 1, 1,
-0.2018093, -0.4583738, -3.1132, 1, 1, 1, 1, 1,
-0.2004995, -0.7798803, -3.360541, 1, 1, 1, 1, 1,
-0.2003953, 0.4147818, -0.976562, 1, 1, 1, 1, 1,
-0.1966468, 0.9723235, -0.3431918, 1, 1, 1, 1, 1,
-0.1940252, -0.1513927, -2.113873, 0, 0, 1, 1, 1,
-0.1920685, -0.4289593, -3.913364, 1, 0, 0, 1, 1,
-0.190966, -0.1410692, -2.232715, 1, 0, 0, 1, 1,
-0.1834293, -1.809785, -5.216421, 1, 0, 0, 1, 1,
-0.1825228, 1.047622, 0.8667635, 1, 0, 0, 1, 1,
-0.1796541, 0.04360196, -2.043897, 1, 0, 0, 1, 1,
-0.1789447, 0.0103625, -1.118009, 0, 0, 0, 1, 1,
-0.1745548, -1.313166, -4.113945, 0, 0, 0, 1, 1,
-0.167282, 1.929834, -1.875452, 0, 0, 0, 1, 1,
-0.1637798, -0.5922002, -3.000754, 0, 0, 0, 1, 1,
-0.1620516, 0.4449111, 0.9015381, 0, 0, 0, 1, 1,
-0.1596514, -1.303543, -2.542693, 0, 0, 0, 1, 1,
-0.1563921, 1.06619, -2.557871, 0, 0, 0, 1, 1,
-0.1511976, -0.2174596, -2.921904, 1, 1, 1, 1, 1,
-0.146832, 2.129049, -1.455029, 1, 1, 1, 1, 1,
-0.1443973, 0.7376583, -0.239814, 1, 1, 1, 1, 1,
-0.1443379, 0.3359933, 0.2073466, 1, 1, 1, 1, 1,
-0.142426, -0.4281007, -2.504866, 1, 1, 1, 1, 1,
-0.1418864, -1.257798, -1.935335, 1, 1, 1, 1, 1,
-0.1382929, 0.7530258, 1.034227, 1, 1, 1, 1, 1,
-0.1371651, 0.6611534, -1.21562, 1, 1, 1, 1, 1,
-0.1365222, 1.233287, -1.653123, 1, 1, 1, 1, 1,
-0.1351697, 0.3891253, 1.789509, 1, 1, 1, 1, 1,
-0.1339034, -0.9022126, -0.8404559, 1, 1, 1, 1, 1,
-0.1308716, 1.698213, 0.1903916, 1, 1, 1, 1, 1,
-0.1304825, -0.3971178, -2.559262, 1, 1, 1, 1, 1,
-0.1269774, -0.9472234, -2.085521, 1, 1, 1, 1, 1,
-0.120627, 1.716338, 0.4036978, 1, 1, 1, 1, 1,
-0.1154937, 0.9514202, -1.17016, 0, 0, 1, 1, 1,
-0.1139783, -0.5993378, -2.568691, 1, 0, 0, 1, 1,
-0.1133136, 0.6495531, -0.1516655, 1, 0, 0, 1, 1,
-0.1092358, -0.9302505, -5.665792, 1, 0, 0, 1, 1,
-0.1078375, -0.8638296, -3.343229, 1, 0, 0, 1, 1,
-0.1033456, -1.777946, -4.345756, 1, 0, 0, 1, 1,
-0.1017143, 1.164446, -0.5815598, 0, 0, 0, 1, 1,
-0.09924751, 0.3649464, -0.4968663, 0, 0, 0, 1, 1,
-0.09869689, -1.028813, -2.524043, 0, 0, 0, 1, 1,
-0.09289376, 0.1259922, -0.7027724, 0, 0, 0, 1, 1,
-0.09004957, 0.5508228, -1.105727, 0, 0, 0, 1, 1,
-0.08543879, -0.616982, -3.956916, 0, 0, 0, 1, 1,
-0.08479141, -0.804229, -4.254449, 0, 0, 0, 1, 1,
-0.08428984, 0.1759274, -0.9775498, 1, 1, 1, 1, 1,
-0.08339106, -2.400682, -2.353538, 1, 1, 1, 1, 1,
-0.08169369, -1.707455, -4.338545, 1, 1, 1, 1, 1,
-0.07831357, -1.014676, -4.751007, 1, 1, 1, 1, 1,
-0.07507116, -0.2438037, -3.711932, 1, 1, 1, 1, 1,
-0.07286068, -0.8910182, -4.280747, 1, 1, 1, 1, 1,
-0.06867892, 0.4181689, 0.5290138, 1, 1, 1, 1, 1,
-0.06432974, -0.2811534, -3.538583, 1, 1, 1, 1, 1,
-0.06281152, 1.325432, 0.9243275, 1, 1, 1, 1, 1,
-0.05550421, -0.2997858, -2.776089, 1, 1, 1, 1, 1,
-0.05287255, -0.7354928, -2.445213, 1, 1, 1, 1, 1,
-0.05223271, -0.1951862, -2.30374, 1, 1, 1, 1, 1,
-0.05183145, 0.5661764, 0.0838595, 1, 1, 1, 1, 1,
-0.05135784, 1.728931, 1.203268, 1, 1, 1, 1, 1,
-0.04976869, 1.931837, 1.072927, 1, 1, 1, 1, 1,
-0.04940498, 0.1529149, -1.765641, 0, 0, 1, 1, 1,
-0.04613282, -1.552821, -4.708606, 1, 0, 0, 1, 1,
-0.04214118, -1.526664, -2.662911, 1, 0, 0, 1, 1,
-0.03832345, -0.8080505, -3.579256, 1, 0, 0, 1, 1,
-0.03226685, 1.194988, -2.744326, 1, 0, 0, 1, 1,
-0.03087068, 0.8697415, -0.7371429, 1, 0, 0, 1, 1,
-0.0288588, 0.08215469, 1.724999, 0, 0, 0, 1, 1,
-0.02407998, -0.5317044, -2.68372, 0, 0, 0, 1, 1,
-0.02240301, -1.79158, -3.14556, 0, 0, 0, 1, 1,
-0.02184582, 0.2162609, -1.373615, 0, 0, 0, 1, 1,
-0.02179817, 1.084246, -0.04355352, 0, 0, 0, 1, 1,
-0.02080123, 1.823951, -1.923159, 0, 0, 0, 1, 1,
-0.01865513, 0.6978309, 0.5623821, 0, 0, 0, 1, 1,
-0.01661219, -0.752643, -1.897189, 1, 1, 1, 1, 1,
-0.01651063, -1.047664, -2.904295, 1, 1, 1, 1, 1,
-0.01034758, -1.302124, -3.655164, 1, 1, 1, 1, 1,
-0.007180141, 0.6845369, -0.7546153, 1, 1, 1, 1, 1,
-0.003457741, -0.3986295, -3.093382, 1, 1, 1, 1, 1,
-0.003071587, -0.7279265, -4.489515, 1, 1, 1, 1, 1,
-0.00239175, -0.9134666, -2.465449, 1, 1, 1, 1, 1,
0.004604846, -0.4366367, 2.664466, 1, 1, 1, 1, 1,
0.009891042, -0.09436779, 2.73961, 1, 1, 1, 1, 1,
0.01204706, -0.14727, 3.412509, 1, 1, 1, 1, 1,
0.01257563, -2.628794, 2.127756, 1, 1, 1, 1, 1,
0.01303619, -0.7719194, 2.815662, 1, 1, 1, 1, 1,
0.01540238, -0.9652145, 3.391147, 1, 1, 1, 1, 1,
0.01680411, -0.2585874, 2.759288, 1, 1, 1, 1, 1,
0.02689029, 0.3549096, -1.451322, 1, 1, 1, 1, 1,
0.03496842, -0.8190791, 3.71964, 0, 0, 1, 1, 1,
0.03677947, 0.2626191, 1.100675, 1, 0, 0, 1, 1,
0.04744355, -0.8326689, 2.147448, 1, 0, 0, 1, 1,
0.0508197, 0.837379, -0.7640177, 1, 0, 0, 1, 1,
0.05728313, 1.404241, -0.0614039, 1, 0, 0, 1, 1,
0.05779644, -1.369777, 2.507591, 1, 0, 0, 1, 1,
0.06018478, -0.5611309, 2.445078, 0, 0, 0, 1, 1,
0.06267807, -0.5954873, 4.763531, 0, 0, 0, 1, 1,
0.06583072, 0.974431, 0.4754481, 0, 0, 0, 1, 1,
0.06676516, -0.6577191, 2.325275, 0, 0, 0, 1, 1,
0.0683248, 0.1652664, 2.053372, 0, 0, 0, 1, 1,
0.0708238, -1.320072, 2.985483, 0, 0, 0, 1, 1,
0.07123671, 0.3385345, 0.3826098, 0, 0, 0, 1, 1,
0.0776202, -0.7909557, 4.736959, 1, 1, 1, 1, 1,
0.08023629, 0.3178747, -1.209086, 1, 1, 1, 1, 1,
0.08163963, -1.285959, 4.341587, 1, 1, 1, 1, 1,
0.08281571, -0.8124247, 1.826114, 1, 1, 1, 1, 1,
0.08588997, 0.978318, 1.444706, 1, 1, 1, 1, 1,
0.09183195, 1.128042, -0.6201814, 1, 1, 1, 1, 1,
0.09202422, -0.9507332, 3.16839, 1, 1, 1, 1, 1,
0.09449586, -0.1026427, 1.585366, 1, 1, 1, 1, 1,
0.09488795, 0.4552931, 0.7408169, 1, 1, 1, 1, 1,
0.09542233, -0.136965, 2.936481, 1, 1, 1, 1, 1,
0.0978236, -0.5942568, 2.908624, 1, 1, 1, 1, 1,
0.1031308, -2.332326, 3.834004, 1, 1, 1, 1, 1,
0.1064145, -1.022544, 3.089872, 1, 1, 1, 1, 1,
0.1102009, -0.5678586, 2.685992, 1, 1, 1, 1, 1,
0.1178896, 1.200724, -0.1020887, 1, 1, 1, 1, 1,
0.1198723, -0.2939568, 2.194646, 0, 0, 1, 1, 1,
0.120752, -0.9962105, 3.395041, 1, 0, 0, 1, 1,
0.1240028, -0.7224622, 1.68022, 1, 0, 0, 1, 1,
0.1252491, -1.582513, 3.568469, 1, 0, 0, 1, 1,
0.1277051, 0.2141126, 1.028771, 1, 0, 0, 1, 1,
0.1283387, 1.126435, -0.1080405, 1, 0, 0, 1, 1,
0.1284661, 0.2339321, 1.861081, 0, 0, 0, 1, 1,
0.1312571, 0.1211413, 1.648854, 0, 0, 0, 1, 1,
0.136303, -1.525241, 4.312664, 0, 0, 0, 1, 1,
0.1372049, -0.5305793, 2.657574, 0, 0, 0, 1, 1,
0.1398292, 0.7203442, -0.6257249, 0, 0, 0, 1, 1,
0.1417292, -0.7202007, 3.03726, 0, 0, 0, 1, 1,
0.1466275, -0.1533104, 2.050009, 0, 0, 0, 1, 1,
0.147254, 0.2570477, 1.323499, 1, 1, 1, 1, 1,
0.1474143, 0.3684781, 0.02208381, 1, 1, 1, 1, 1,
0.1517155, 0.9082364, -0.2771085, 1, 1, 1, 1, 1,
0.1536819, -1.137769, 4.939533, 1, 1, 1, 1, 1,
0.1539508, 0.9675019, -0.1518978, 1, 1, 1, 1, 1,
0.1544956, 1.675624, -0.1017521, 1, 1, 1, 1, 1,
0.1566496, 0.2611519, 1.106152, 1, 1, 1, 1, 1,
0.1587324, -2.08353, 1.754264, 1, 1, 1, 1, 1,
0.1604866, 0.6702381, 1.692209, 1, 1, 1, 1, 1,
0.1609025, -0.4211529, 3.141842, 1, 1, 1, 1, 1,
0.1616017, 0.7603059, -1.039801, 1, 1, 1, 1, 1,
0.1616914, -0.4164734, 1.644173, 1, 1, 1, 1, 1,
0.1637909, -0.218399, 2.60665, 1, 1, 1, 1, 1,
0.1794836, -0.6237104, 1.071462, 1, 1, 1, 1, 1,
0.1806233, -1.073659, 3.747025, 1, 1, 1, 1, 1,
0.1817283, 1.663669, 0.8292417, 0, 0, 1, 1, 1,
0.187657, 0.87679, 1.146365, 1, 0, 0, 1, 1,
0.1879771, 0.4792421, 2.457468, 1, 0, 0, 1, 1,
0.1885585, -1.351392, 3.55043, 1, 0, 0, 1, 1,
0.1903586, 1.811906, 0.5637503, 1, 0, 0, 1, 1,
0.1904453, 0.2723499, 0.2069239, 1, 0, 0, 1, 1,
0.1950866, 0.3229346, 0.5754091, 0, 0, 0, 1, 1,
0.1964423, -0.4072342, 2.182013, 0, 0, 0, 1, 1,
0.1976828, -1.157374, 3.539078, 0, 0, 0, 1, 1,
0.2018278, -0.3455452, 3.592638, 0, 0, 0, 1, 1,
0.2079756, 1.149733, -1.106344, 0, 0, 0, 1, 1,
0.2084364, 0.01217146, 1.53207, 0, 0, 0, 1, 1,
0.2092984, 0.4283847, 1.778589, 0, 0, 0, 1, 1,
0.2139066, 1.691945, 1.199, 1, 1, 1, 1, 1,
0.2160123, -2.731046, 4.123869, 1, 1, 1, 1, 1,
0.2195066, -0.2899053, 2.319746, 1, 1, 1, 1, 1,
0.2203049, -0.7675139, 2.821362, 1, 1, 1, 1, 1,
0.2285015, -0.4593185, 3.727126, 1, 1, 1, 1, 1,
0.2295964, 0.2376797, 0.5021212, 1, 1, 1, 1, 1,
0.231339, -0.1857555, 2.779921, 1, 1, 1, 1, 1,
0.2337366, 1.154944, -0.5325559, 1, 1, 1, 1, 1,
0.2347408, -0.7419137, 3.219727, 1, 1, 1, 1, 1,
0.2420663, 0.2982805, 0.2454084, 1, 1, 1, 1, 1,
0.2513086, 0.0009160267, 2.161837, 1, 1, 1, 1, 1,
0.2546419, 0.3151432, 0.07320465, 1, 1, 1, 1, 1,
0.2549679, 0.2474307, 0.7330435, 1, 1, 1, 1, 1,
0.2559609, 0.1677784, 0.7508568, 1, 1, 1, 1, 1,
0.2585344, -0.1331109, 1.664127, 1, 1, 1, 1, 1,
0.2619201, -0.950009, 3.711092, 0, 0, 1, 1, 1,
0.2636899, -0.1476327, 2.110556, 1, 0, 0, 1, 1,
0.266191, -0.7272466, 2.726187, 1, 0, 0, 1, 1,
0.2676022, -0.07288969, 3.471374, 1, 0, 0, 1, 1,
0.2700348, -0.9769803, 3.220521, 1, 0, 0, 1, 1,
0.274043, 0.01733197, 1.409071, 1, 0, 0, 1, 1,
0.2760103, -0.2884934, 1.030294, 0, 0, 0, 1, 1,
0.2769078, 0.08126251, 1.761675, 0, 0, 0, 1, 1,
0.2774697, -0.6425812, 2.757457, 0, 0, 0, 1, 1,
0.2785971, 0.2125119, 1.444273, 0, 0, 0, 1, 1,
0.2798222, 0.001311658, 0.8621557, 0, 0, 0, 1, 1,
0.2910433, -0.5983719, 2.842148, 0, 0, 0, 1, 1,
0.2918417, -0.4370815, 3.455173, 0, 0, 0, 1, 1,
0.2941419, 0.2134514, 0.3807661, 1, 1, 1, 1, 1,
0.2982596, -1.008947, 3.4962, 1, 1, 1, 1, 1,
0.2997662, 0.1158014, 1.297832, 1, 1, 1, 1, 1,
0.3013626, -0.6766692, 2.984503, 1, 1, 1, 1, 1,
0.3044873, -0.2459799, 1.165333, 1, 1, 1, 1, 1,
0.3098107, 0.6545745, -0.3832841, 1, 1, 1, 1, 1,
0.3162639, -0.2982681, 1.059424, 1, 1, 1, 1, 1,
0.3163137, 0.2893651, 0.2057999, 1, 1, 1, 1, 1,
0.3174553, 1.99269, 1.149041, 1, 1, 1, 1, 1,
0.3178272, 0.1676908, 1.455324, 1, 1, 1, 1, 1,
0.317914, 2.116341, -0.4689819, 1, 1, 1, 1, 1,
0.3186001, 1.488005, 0.7406577, 1, 1, 1, 1, 1,
0.3215261, -1.611203, 3.00256, 1, 1, 1, 1, 1,
0.3219456, 0.8986332, 1.551445, 1, 1, 1, 1, 1,
0.3232868, 1.0115, -0.28292, 1, 1, 1, 1, 1,
0.3294545, 2.255623, -0.9179121, 0, 0, 1, 1, 1,
0.3302785, -0.6799132, 3.411806, 1, 0, 0, 1, 1,
0.3416147, 1.098425, -0.0438829, 1, 0, 0, 1, 1,
0.3482229, 1.628961, 1.917503, 1, 0, 0, 1, 1,
0.3483231, 0.5404745, -0.3715011, 1, 0, 0, 1, 1,
0.3499682, -2.512696, 2.177574, 1, 0, 0, 1, 1,
0.3588005, 0.07966762, 2.229113, 0, 0, 0, 1, 1,
0.3611581, -0.05719557, 2.04073, 0, 0, 0, 1, 1,
0.3617063, 2.507437, 0.867025, 0, 0, 0, 1, 1,
0.3622478, -0.9755419, 3.673187, 0, 0, 0, 1, 1,
0.3623433, 1.600738, -0.03346069, 0, 0, 0, 1, 1,
0.368301, 0.1515595, 2.114772, 0, 0, 0, 1, 1,
0.3738791, 0.4359011, 1.26298, 0, 0, 0, 1, 1,
0.3806221, 0.2738517, 0.6995868, 1, 1, 1, 1, 1,
0.3869142, -0.3238317, 0.6798039, 1, 1, 1, 1, 1,
0.3955725, 0.2532966, 0.7800775, 1, 1, 1, 1, 1,
0.3964813, 1.011761, 0.9587567, 1, 1, 1, 1, 1,
0.4002261, -0.7696906, 3.060516, 1, 1, 1, 1, 1,
0.402299, 0.0872936, 3.254166, 1, 1, 1, 1, 1,
0.4047062, 0.551421, -0.6453955, 1, 1, 1, 1, 1,
0.4095133, -1.384074, 2.376879, 1, 1, 1, 1, 1,
0.4099534, 0.976053, -1.474013, 1, 1, 1, 1, 1,
0.4167541, 0.2693852, 0.5440376, 1, 1, 1, 1, 1,
0.4167764, -0.2044723, 1.282948, 1, 1, 1, 1, 1,
0.4215897, 0.09397877, 0.9130204, 1, 1, 1, 1, 1,
0.422796, 0.2484136, 2.796197, 1, 1, 1, 1, 1,
0.4247577, -0.1611267, 2.157584, 1, 1, 1, 1, 1,
0.4270872, -1.21277, 4.69371, 1, 1, 1, 1, 1,
0.4276518, 0.5264452, 2.05976, 0, 0, 1, 1, 1,
0.4306394, 1.654594, 2.786531, 1, 0, 0, 1, 1,
0.438013, 1.220356, 0.1091228, 1, 0, 0, 1, 1,
0.4389939, -0.6744071, 2.228532, 1, 0, 0, 1, 1,
0.4484868, -0.5395038, 1.208988, 1, 0, 0, 1, 1,
0.4519126, 0.5288265, -0.1019529, 1, 0, 0, 1, 1,
0.4531453, 0.7636232, -0.6512963, 0, 0, 0, 1, 1,
0.4609208, -0.1337218, 2.31251, 0, 0, 0, 1, 1,
0.4624019, 0.2059756, 2.258344, 0, 0, 0, 1, 1,
0.464942, -1.007136, 0.882945, 0, 0, 0, 1, 1,
0.4682485, -0.1235731, 0.09228273, 0, 0, 0, 1, 1,
0.4693079, -0.6460509, 2.003655, 0, 0, 0, 1, 1,
0.4782215, 0.2014866, -0.2063589, 0, 0, 0, 1, 1,
0.4900993, -0.1219456, 1.655582, 1, 1, 1, 1, 1,
0.4930373, 0.1875738, 1.993385, 1, 1, 1, 1, 1,
0.4952278, -1.410742, 3.231389, 1, 1, 1, 1, 1,
0.4963953, -0.5656164, 3.067682, 1, 1, 1, 1, 1,
0.4973127, 0.1648207, 0.8187922, 1, 1, 1, 1, 1,
0.4981295, 2.412292, -1.257191, 1, 1, 1, 1, 1,
0.4984506, 0.3332958, 2.336906, 1, 1, 1, 1, 1,
0.5025671, 0.4623786, -1.722432, 1, 1, 1, 1, 1,
0.5037158, 0.9505231, -0.4514118, 1, 1, 1, 1, 1,
0.5053273, -0.1686664, 0.271574, 1, 1, 1, 1, 1,
0.5055904, -0.9447893, 1.562086, 1, 1, 1, 1, 1,
0.5089636, -1.792274, 3.300366, 1, 1, 1, 1, 1,
0.509002, 1.033461, 0.7154166, 1, 1, 1, 1, 1,
0.5109955, -0.5622988, 2.61921, 1, 1, 1, 1, 1,
0.5118441, -0.6628191, 1.474611, 1, 1, 1, 1, 1,
0.512665, -0.7214125, 0.6205384, 0, 0, 1, 1, 1,
0.5132301, -1.386896, 0.4791882, 1, 0, 0, 1, 1,
0.5151577, 0.04298023, 4.264875, 1, 0, 0, 1, 1,
0.5155618, -0.04191684, 2.94265, 1, 0, 0, 1, 1,
0.5166187, -0.153758, 2.06848, 1, 0, 0, 1, 1,
0.5240938, -0.07819579, 1.647211, 1, 0, 0, 1, 1,
0.5342395, 1.059403, 0.7950685, 0, 0, 0, 1, 1,
0.536014, -0.06695039, 1.849659, 0, 0, 0, 1, 1,
0.5374091, -3.039917, 3.709353, 0, 0, 0, 1, 1,
0.5411045, 0.6992317, 1.689965, 0, 0, 0, 1, 1,
0.5427081, -0.07322975, 3.373241, 0, 0, 0, 1, 1,
0.5438074, 2.747347, -0.02783775, 0, 0, 0, 1, 1,
0.5438198, -1.003274, 2.745546, 0, 0, 0, 1, 1,
0.5467793, -1.821127, 3.424155, 1, 1, 1, 1, 1,
0.5512618, 0.1935956, 2.338587, 1, 1, 1, 1, 1,
0.5554266, 0.4836181, 1.077113, 1, 1, 1, 1, 1,
0.5577872, -0.6197213, 1.054322, 1, 1, 1, 1, 1,
0.5578488, -2.007853, 2.541121, 1, 1, 1, 1, 1,
0.5596672, -0.2115417, 1.058549, 1, 1, 1, 1, 1,
0.5609946, 0.7187388, -0.2407359, 1, 1, 1, 1, 1,
0.5639787, -0.6410414, 0.9312643, 1, 1, 1, 1, 1,
0.5731905, 0.8665434, 0.0228179, 1, 1, 1, 1, 1,
0.5762597, -1.241575, 3.649594, 1, 1, 1, 1, 1,
0.578043, 1.12677, -0.2607379, 1, 1, 1, 1, 1,
0.5873511, -1.307465, 0.9198083, 1, 1, 1, 1, 1,
0.5955261, 1.374881, 1.102555, 1, 1, 1, 1, 1,
0.5957375, 0.4682595, 0.2631376, 1, 1, 1, 1, 1,
0.6039996, 2.471371, 1.989732, 1, 1, 1, 1, 1,
0.605754, 1.143293, 1.048498, 0, 0, 1, 1, 1,
0.6060441, 0.7556701, 1.138617, 1, 0, 0, 1, 1,
0.6143817, -0.8640862, 2.01098, 1, 0, 0, 1, 1,
0.6157737, -0.6314061, 3.060792, 1, 0, 0, 1, 1,
0.6159165, -1.014505, 1.316572, 1, 0, 0, 1, 1,
0.6172817, -0.4409958, 2.774645, 1, 0, 0, 1, 1,
0.6180825, 0.7448449, 0.3565922, 0, 0, 0, 1, 1,
0.6202911, -0.5171502, 0.1321226, 0, 0, 0, 1, 1,
0.6204857, 0.6862488, 1.678021, 0, 0, 0, 1, 1,
0.6208511, -1.260988, 2.090137, 0, 0, 0, 1, 1,
0.621253, -0.04032716, 3.683275, 0, 0, 0, 1, 1,
0.6258425, 0.3156773, 1.294644, 0, 0, 0, 1, 1,
0.6335691, 2.561223, -0.6880167, 0, 0, 0, 1, 1,
0.6352353, 1.623417, 0.1836002, 1, 1, 1, 1, 1,
0.6363169, -0.0475857, 2.185811, 1, 1, 1, 1, 1,
0.6370126, 0.05184485, 1.686372, 1, 1, 1, 1, 1,
0.6386542, 0.2515856, -0.06839962, 1, 1, 1, 1, 1,
0.6397686, -0.8228547, 1.219013, 1, 1, 1, 1, 1,
0.6421531, -0.8254423, 3.666772, 1, 1, 1, 1, 1,
0.644617, 0.6203816, -0.1885878, 1, 1, 1, 1, 1,
0.6493214, 1.21524, -0.07976894, 1, 1, 1, 1, 1,
0.6550108, -0.2925474, 0.4196929, 1, 1, 1, 1, 1,
0.6563355, 0.2287654, 1.386193, 1, 1, 1, 1, 1,
0.6607822, -1.82587, 1.861834, 1, 1, 1, 1, 1,
0.664267, 0.5252324, 2.166454, 1, 1, 1, 1, 1,
0.6730841, -0.3129005, 1.449049, 1, 1, 1, 1, 1,
0.6735237, -0.4712863, 1.787396, 1, 1, 1, 1, 1,
0.6747203, -0.9483763, 3.91748, 1, 1, 1, 1, 1,
0.678889, -0.3345965, 2.406058, 0, 0, 1, 1, 1,
0.6807208, 1.327997, 1.588435, 1, 0, 0, 1, 1,
0.6832542, 0.6583979, -0.3606924, 1, 0, 0, 1, 1,
0.6849889, 1.194483, 1.128303, 1, 0, 0, 1, 1,
0.6881097, 0.2274909, 0.4334763, 1, 0, 0, 1, 1,
0.6917288, -0.2072078, 1.04305, 1, 0, 0, 1, 1,
0.6985785, 0.1446516, 0.6975576, 0, 0, 0, 1, 1,
0.7030973, 0.6356452, 1.771734, 0, 0, 0, 1, 1,
0.7049654, 0.3460785, 1.768683, 0, 0, 0, 1, 1,
0.7060559, 1.721875, 0.1751482, 0, 0, 0, 1, 1,
0.706871, 2.773217, 0.3202132, 0, 0, 0, 1, 1,
0.7083123, -0.6228083, 3.648405, 0, 0, 0, 1, 1,
0.7086042, 0.6280549, -0.01207673, 0, 0, 0, 1, 1,
0.7102072, -1.000332, 3.731951, 1, 1, 1, 1, 1,
0.7113059, 1.370296, 0.7519596, 1, 1, 1, 1, 1,
0.7129076, 1.500313, -0.2079346, 1, 1, 1, 1, 1,
0.7138366, -1.270475, 3.407867, 1, 1, 1, 1, 1,
0.7162157, 0.1947719, 0.8207545, 1, 1, 1, 1, 1,
0.7171376, -1.023249, 3.089275, 1, 1, 1, 1, 1,
0.7215337, -0.6324644, 2.764517, 1, 1, 1, 1, 1,
0.7256941, -1.468355, 1.073513, 1, 1, 1, 1, 1,
0.7284904, 0.6149486, 0.4418542, 1, 1, 1, 1, 1,
0.7291443, -1.537255, 4.186206, 1, 1, 1, 1, 1,
0.7346393, 2.10025, 0.9455288, 1, 1, 1, 1, 1,
0.7365888, -0.6949587, 1.863997, 1, 1, 1, 1, 1,
0.7411498, 0.411904, 1.486834, 1, 1, 1, 1, 1,
0.7487344, 0.91267, 0.5590354, 1, 1, 1, 1, 1,
0.7504088, -1.690951, 1.849778, 1, 1, 1, 1, 1,
0.7534182, 0.7848231, -0.08549543, 0, 0, 1, 1, 1,
0.7539764, -2.128039, 0.6810394, 1, 0, 0, 1, 1,
0.7602471, -1.610355, 2.556582, 1, 0, 0, 1, 1,
0.7645298, 0.4305433, 1.142083, 1, 0, 0, 1, 1,
0.7680096, 1.266488, -0.9291044, 1, 0, 0, 1, 1,
0.7869326, -0.9148495, 2.247458, 1, 0, 0, 1, 1,
0.7883407, -1.278027, 3.464835, 0, 0, 0, 1, 1,
0.7914762, -0.2708471, 0.0515092, 0, 0, 0, 1, 1,
0.7971798, 0.7988316, 0.01624414, 0, 0, 0, 1, 1,
0.7998961, 0.6390287, 2.60605, 0, 0, 0, 1, 1,
0.8000929, 0.859571, -0.7987393, 0, 0, 0, 1, 1,
0.8006499, 1.617875, 1.475929, 0, 0, 0, 1, 1,
0.8007249, -1.245933, 2.847476, 0, 0, 0, 1, 1,
0.8027109, -1.532282, 3.035888, 1, 1, 1, 1, 1,
0.8049724, 1.053278, 1.305731, 1, 1, 1, 1, 1,
0.8093335, -1.235998, 2.362632, 1, 1, 1, 1, 1,
0.8151509, -0.6809094, 1.557197, 1, 1, 1, 1, 1,
0.8176977, -1.041777, 1.804677, 1, 1, 1, 1, 1,
0.8238839, 0.2052707, 2.441644, 1, 1, 1, 1, 1,
0.8239862, -1.611128, 2.591529, 1, 1, 1, 1, 1,
0.8254937, -0.1457281, 1.46261, 1, 1, 1, 1, 1,
0.829271, 0.3036848, 1.244887, 1, 1, 1, 1, 1,
0.8327978, 0.7405434, 1.834365, 1, 1, 1, 1, 1,
0.8362241, 0.06730681, 3.75735, 1, 1, 1, 1, 1,
0.8377068, 0.9696822, 0.7259241, 1, 1, 1, 1, 1,
0.8394816, -0.6658036, 2.10311, 1, 1, 1, 1, 1,
0.8429068, 0.2917071, 1.047202, 1, 1, 1, 1, 1,
0.8436826, 0.0558628, 1.879694, 1, 1, 1, 1, 1,
0.8513954, 2.454439, -0.5902942, 0, 0, 1, 1, 1,
0.860023, 0.8739285, 0.9884362, 1, 0, 0, 1, 1,
0.8626531, -0.4480737, 1.100129, 1, 0, 0, 1, 1,
0.8631261, 0.8778887, 1.470625, 1, 0, 0, 1, 1,
0.8637782, 1.050217, 1.4464, 1, 0, 0, 1, 1,
0.8649455, 0.0056254, 3.406234, 1, 0, 0, 1, 1,
0.8674055, -0.5309642, 2.960682, 0, 0, 0, 1, 1,
0.8709823, 0.3712258, 1.451127, 0, 0, 0, 1, 1,
0.8755415, -0.1046704, 2.929188, 0, 0, 0, 1, 1,
0.8758609, 0.09200183, 2.238633, 0, 0, 0, 1, 1,
0.8765169, -1.289409, 2.656793, 0, 0, 0, 1, 1,
0.8794192, -1.423679, 2.154796, 0, 0, 0, 1, 1,
0.8795167, -1.090909, 2.051302, 0, 0, 0, 1, 1,
0.8868087, 0.1329783, 2.850767, 1, 1, 1, 1, 1,
0.8870165, -1.832034, 1.623791, 1, 1, 1, 1, 1,
0.8923401, 0.1095466, 1.038809, 1, 1, 1, 1, 1,
0.8976979, -2.454336, 3.918121, 1, 1, 1, 1, 1,
0.9028467, 1.043295, -0.1343127, 1, 1, 1, 1, 1,
0.9029897, 0.3284444, -0.7544391, 1, 1, 1, 1, 1,
0.9039256, -2.019081, 3.770057, 1, 1, 1, 1, 1,
0.9047249, -0.7051144, 2.363031, 1, 1, 1, 1, 1,
0.9091276, 0.1601298, 1.347475, 1, 1, 1, 1, 1,
0.9099393, 1.505748, 1.65146, 1, 1, 1, 1, 1,
0.913078, -0.2310168, 0.8538413, 1, 1, 1, 1, 1,
0.9158855, 0.4337714, 1.698417, 1, 1, 1, 1, 1,
0.9176756, -0.8463685, 0.7161408, 1, 1, 1, 1, 1,
0.9231108, -1.084249, 2.122297, 1, 1, 1, 1, 1,
0.9258201, 0.04623274, -0.1816943, 1, 1, 1, 1, 1,
0.9264101, -0.2500907, 2.827062, 0, 0, 1, 1, 1,
0.9352775, -0.8090098, -0.05104953, 1, 0, 0, 1, 1,
0.9358668, -0.1929692, 1.436344, 1, 0, 0, 1, 1,
0.9379647, 0.1621496, 0.2843435, 1, 0, 0, 1, 1,
0.9430431, -0.0372227, 1.298197, 1, 0, 0, 1, 1,
0.9447696, -0.9678006, 2.698729, 1, 0, 0, 1, 1,
0.9523065, -1.881133, 2.847821, 0, 0, 0, 1, 1,
0.953746, 0.3256317, 1.613624, 0, 0, 0, 1, 1,
0.9542189, 0.2498565, 1.92392, 0, 0, 0, 1, 1,
0.9543451, 1.012276, -0.4762145, 0, 0, 0, 1, 1,
0.9544522, 0.1341206, 0.1068648, 0, 0, 0, 1, 1,
0.9574386, 0.5744094, 1.789331, 0, 0, 0, 1, 1,
0.9577711, 0.07770254, 0.7675211, 0, 0, 0, 1, 1,
0.9587154, -0.4264321, 2.375404, 1, 1, 1, 1, 1,
0.9609875, 0.6768038, 0.05702203, 1, 1, 1, 1, 1,
0.9619602, -0.267845, 2.049172, 1, 1, 1, 1, 1,
0.9651985, -0.4102834, 1.943341, 1, 1, 1, 1, 1,
0.9655122, -0.1129993, 1.774794, 1, 1, 1, 1, 1,
0.9687124, -0.9936316, 0.8121937, 1, 1, 1, 1, 1,
0.971128, -0.421163, 3.459386, 1, 1, 1, 1, 1,
0.9768955, -0.2620349, 1.196137, 1, 1, 1, 1, 1,
0.9883157, -0.1188002, -0.1308057, 1, 1, 1, 1, 1,
0.9910982, -0.1941525, 4.083799, 1, 1, 1, 1, 1,
0.9928166, -1.142379, 2.827483, 1, 1, 1, 1, 1,
0.9947031, -0.7940463, 3.603539, 1, 1, 1, 1, 1,
0.9953936, 1.499994, 0.7003784, 1, 1, 1, 1, 1,
0.9961289, 0.3582092, 0.9814792, 1, 1, 1, 1, 1,
0.9991125, 0.3121479, 2.064203, 1, 1, 1, 1, 1,
1.001997, 0.08492678, 0.8505706, 0, 0, 1, 1, 1,
1.003933, -0.7734275, 2.249149, 1, 0, 0, 1, 1,
1.010888, -0.6103297, 2.501028, 1, 0, 0, 1, 1,
1.014845, -0.7070834, 1.973555, 1, 0, 0, 1, 1,
1.016828, 0.6947475, 2.183785, 1, 0, 0, 1, 1,
1.016942, 0.2481397, -0.3759785, 1, 0, 0, 1, 1,
1.018703, -1.773923, 2.855756, 0, 0, 0, 1, 1,
1.023366, 1.615089, 1.235061, 0, 0, 0, 1, 1,
1.028465, -0.2974268, 0.3103199, 0, 0, 0, 1, 1,
1.030985, 1.073907, 0.5248897, 0, 0, 0, 1, 1,
1.031562, -0.3267878, 1.480775, 0, 0, 0, 1, 1,
1.031627, -1.509295, 2.084048, 0, 0, 0, 1, 1,
1.033333, -0.68019, 1.714115, 0, 0, 0, 1, 1,
1.034917, 0.0999064, -0.2067581, 1, 1, 1, 1, 1,
1.036906, 1.516284, 0.3177427, 1, 1, 1, 1, 1,
1.0371, 1.254027, 0.6300797, 1, 1, 1, 1, 1,
1.044819, -0.4887283, 2.156229, 1, 1, 1, 1, 1,
1.048072, 1.188485, 1.604082, 1, 1, 1, 1, 1,
1.050874, 1.49532, -0.6092787, 1, 1, 1, 1, 1,
1.054481, 0.9598312, 0.2005021, 1, 1, 1, 1, 1,
1.058885, -1.15015, 2.076966, 1, 1, 1, 1, 1,
1.06042, 0.1288927, 1.837458, 1, 1, 1, 1, 1,
1.06155, 0.3170511, 1.340093, 1, 1, 1, 1, 1,
1.068716, -0.2675024, 0.9391223, 1, 1, 1, 1, 1,
1.069384, 0.2833274, 0.3294582, 1, 1, 1, 1, 1,
1.084513, 0.8528786, -0.5637851, 1, 1, 1, 1, 1,
1.085309, 1.349823, 0.1856659, 1, 1, 1, 1, 1,
1.091144, 0.1148538, 1.63083, 1, 1, 1, 1, 1,
1.094483, -0.5851512, 1.687849, 0, 0, 1, 1, 1,
1.100698, 0.6258815, 0.5096468, 1, 0, 0, 1, 1,
1.109801, 2.767554, -0.1423464, 1, 0, 0, 1, 1,
1.111214, 0.0001431889, 2.000347, 1, 0, 0, 1, 1,
1.117048, 0.0631636, 0.4711602, 1, 0, 0, 1, 1,
1.119522, -0.3577999, 1.983313, 1, 0, 0, 1, 1,
1.120234, 0.5849897, 1.042552, 0, 0, 0, 1, 1,
1.124313, 0.6306059, 2.694943, 0, 0, 0, 1, 1,
1.128679, -0.8526523, 2.292439, 0, 0, 0, 1, 1,
1.129488, -1.656774, 4.113276, 0, 0, 0, 1, 1,
1.132432, -0.3183139, 1.824338, 0, 0, 0, 1, 1,
1.13621, 0.7595801, 0.8964797, 0, 0, 0, 1, 1,
1.137447, 1.538894, 1.03794, 0, 0, 0, 1, 1,
1.138557, 2.565633, 0.2796209, 1, 1, 1, 1, 1,
1.142984, 0.09633778, 1.223172, 1, 1, 1, 1, 1,
1.143773, 0.1539091, 1.911944, 1, 1, 1, 1, 1,
1.152874, -1.01498, 1.264083, 1, 1, 1, 1, 1,
1.154996, -0.4824627, 2.055188, 1, 1, 1, 1, 1,
1.155142, 0.661185, 0.2082431, 1, 1, 1, 1, 1,
1.155458, 1.457536, 0.524512, 1, 1, 1, 1, 1,
1.158637, -0.2407186, 1.292674, 1, 1, 1, 1, 1,
1.167338, 0.3965228, 0.813685, 1, 1, 1, 1, 1,
1.179245, -0.6391484, 1.141677, 1, 1, 1, 1, 1,
1.180964, -0.231015, 1.291459, 1, 1, 1, 1, 1,
1.19915, 0.5145398, 1.782366, 1, 1, 1, 1, 1,
1.209418, 0.5258729, 0.05243059, 1, 1, 1, 1, 1,
1.213342, -0.5505605, 0.3714883, 1, 1, 1, 1, 1,
1.214117, -0.2947074, 1.399195, 1, 1, 1, 1, 1,
1.22249, -0.7228299, 3.755392, 0, 0, 1, 1, 1,
1.249561, -0.4167998, 3.689101, 1, 0, 0, 1, 1,
1.250352, 0.4734797, 1.327102, 1, 0, 0, 1, 1,
1.252155, 0.4838526, 1.458529, 1, 0, 0, 1, 1,
1.254597, 0.5982928, 0.4397057, 1, 0, 0, 1, 1,
1.26142, 1.237519, -0.3773671, 1, 0, 0, 1, 1,
1.262042, 1.198074, 1.176478, 0, 0, 0, 1, 1,
1.267429, -0.8429243, 2.089141, 0, 0, 0, 1, 1,
1.284141, 0.5232743, -1.122815, 0, 0, 0, 1, 1,
1.284815, 0.7546149, 0.3845313, 0, 0, 0, 1, 1,
1.300205, 0.6119857, 1.581953, 0, 0, 0, 1, 1,
1.307152, -0.4920365, 2.575558, 0, 0, 0, 1, 1,
1.312042, 1.97483, -0.04296955, 0, 0, 0, 1, 1,
1.313643, 0.4849643, 1.421696, 1, 1, 1, 1, 1,
1.313984, -1.795121, 1.896738, 1, 1, 1, 1, 1,
1.314903, 0.5851267, 1.935397, 1, 1, 1, 1, 1,
1.315322, 0.8888419, 0.4767534, 1, 1, 1, 1, 1,
1.317841, 1.665906, 2.327525, 1, 1, 1, 1, 1,
1.318413, -0.4402721, 1.793642, 1, 1, 1, 1, 1,
1.330288, -0.9479414, 0.9648229, 1, 1, 1, 1, 1,
1.33247, 0.2798673, 2.14912, 1, 1, 1, 1, 1,
1.338962, -1.918378, 2.173414, 1, 1, 1, 1, 1,
1.344825, 1.429057, 0.02773658, 1, 1, 1, 1, 1,
1.346914, 0.3253247, 0.5916148, 1, 1, 1, 1, 1,
1.354231, -0.4938625, 2.571764, 1, 1, 1, 1, 1,
1.358516, -0.3984139, 2.140232, 1, 1, 1, 1, 1,
1.363147, 0.4133417, 1.350811, 1, 1, 1, 1, 1,
1.368365, 1.056344, 1.062111, 1, 1, 1, 1, 1,
1.369291, -0.04414859, 1.681754, 0, 0, 1, 1, 1,
1.3816, 0.5368784, 2.403129, 1, 0, 0, 1, 1,
1.383135, -0.527232, 0.05899327, 1, 0, 0, 1, 1,
1.38769, 1.568488, -1.063187, 1, 0, 0, 1, 1,
1.395977, 0.3560535, 1.584522, 1, 0, 0, 1, 1,
1.400762, 1.656211, 0.9152708, 1, 0, 0, 1, 1,
1.422929, 1.049789, 2.174723, 0, 0, 0, 1, 1,
1.427708, 1.049418, 1.839588, 0, 0, 0, 1, 1,
1.441161, -0.9578149, 3.849971, 0, 0, 0, 1, 1,
1.442035, 0.4705389, 1.82154, 0, 0, 0, 1, 1,
1.443498, -0.06132211, 1.452002, 0, 0, 0, 1, 1,
1.448149, -0.09026673, 1.784273, 0, 0, 0, 1, 1,
1.451322, -2.191394, 2.677517, 0, 0, 0, 1, 1,
1.451736, -0.5709885, 1.095589, 1, 1, 1, 1, 1,
1.464292, 0.2887684, 1.843143, 1, 1, 1, 1, 1,
1.46515, -0.5109886, 1.267502, 1, 1, 1, 1, 1,
1.471585, 0.1926209, -0.02962188, 1, 1, 1, 1, 1,
1.489535, -0.3933131, 3.168128, 1, 1, 1, 1, 1,
1.4969, -0.7976725, 1.07852, 1, 1, 1, 1, 1,
1.499663, -0.4962015, 2.074023, 1, 1, 1, 1, 1,
1.520516, 0.6510355, 1.924301, 1, 1, 1, 1, 1,
1.522632, -0.08550458, 1.057594, 1, 1, 1, 1, 1,
1.526393, -1.707244, 2.504498, 1, 1, 1, 1, 1,
1.537624, -0.8102332, 3.253024, 1, 1, 1, 1, 1,
1.546732, 0.1676032, 2.523087, 1, 1, 1, 1, 1,
1.551604, 0.8662121, 1.764427, 1, 1, 1, 1, 1,
1.57138, -1.59368, 4.429393, 1, 1, 1, 1, 1,
1.584012, -1.554328, 2.06994, 1, 1, 1, 1, 1,
1.607676, 0.8419743, 1.703788, 0, 0, 1, 1, 1,
1.632088, 1.17672, 1.648469, 1, 0, 0, 1, 1,
1.63998, -0.757494, 3.559767, 1, 0, 0, 1, 1,
1.64184, 1.794244, 1.188832, 1, 0, 0, 1, 1,
1.65157, 0.2291426, 1.023901, 1, 0, 0, 1, 1,
1.65997, 0.0007653034, 2.416695, 1, 0, 0, 1, 1,
1.665929, -0.4314446, 2.14226, 0, 0, 0, 1, 1,
1.687024, 0.9913381, -0.9719173, 0, 0, 0, 1, 1,
1.698761, 0.4352008, 0.9459774, 0, 0, 0, 1, 1,
1.706516, 1.221128, 2.30863, 0, 0, 0, 1, 1,
1.728323, -0.5293822, 1.089264, 0, 0, 0, 1, 1,
1.737333, 0.8849919, 1.154029, 0, 0, 0, 1, 1,
1.744521, -0.8596322, 2.041342, 0, 0, 0, 1, 1,
1.775759, 1.795003, 0.6225554, 1, 1, 1, 1, 1,
1.788326, -1.116532, 3.013733, 1, 1, 1, 1, 1,
1.796065, -0.002796559, 2.274648, 1, 1, 1, 1, 1,
1.842017, 0.8880194, 1.02433, 1, 1, 1, 1, 1,
1.853741, 0.2219299, 2.165236, 1, 1, 1, 1, 1,
1.867198, 0.07427149, 0.3202708, 1, 1, 1, 1, 1,
1.877633, 0.6384652, 2.52709, 1, 1, 1, 1, 1,
1.884614, -1.117886, 2.88705, 1, 1, 1, 1, 1,
1.89777, 0.2010211, 1.286493, 1, 1, 1, 1, 1,
1.906068, 0.3900606, -0.2034847, 1, 1, 1, 1, 1,
1.922302, -0.04005833, 0.6586107, 1, 1, 1, 1, 1,
1.92967, -1.862857, 4.315174, 1, 1, 1, 1, 1,
1.948906, -1.09825, 2.399025, 1, 1, 1, 1, 1,
1.955082, 0.3635061, 2.393275, 1, 1, 1, 1, 1,
1.958465, -1.242359, 1.857768, 1, 1, 1, 1, 1,
1.992307, 0.09573148, 1.003355, 0, 0, 1, 1, 1,
2.039642, 0.4800163, -0.06486755, 1, 0, 0, 1, 1,
2.0851, -0.263114, 3.205188, 1, 0, 0, 1, 1,
2.120718, -1.158446, 1.701102, 1, 0, 0, 1, 1,
2.141814, -1.070535, 1.718548, 1, 0, 0, 1, 1,
2.176182, -0.8886556, 2.627267, 1, 0, 0, 1, 1,
2.218014, -1.491324, 2.159987, 0, 0, 0, 1, 1,
2.236255, -1.641882, 3.485389, 0, 0, 0, 1, 1,
2.300249, -1.028224, 2.603887, 0, 0, 0, 1, 1,
2.338611, 0.7216337, 0.1384172, 0, 0, 0, 1, 1,
2.413547, 0.3062696, 2.408506, 0, 0, 0, 1, 1,
2.417217, -1.950467, 2.53505, 0, 0, 0, 1, 1,
2.428388, 0.1316124, 1.108873, 0, 0, 0, 1, 1,
2.469037, -0.1254825, -0.1046126, 1, 1, 1, 1, 1,
2.563359, 0.07738375, 0.5578303, 1, 1, 1, 1, 1,
2.568408, 0.5558353, 0.7418066, 1, 1, 1, 1, 1,
2.693369, 0.2440515, 3.721923, 1, 1, 1, 1, 1,
3.006362, 0.6996216, 0.7653402, 1, 1, 1, 1, 1,
3.067796, 0.9969208, 2.359314, 1, 1, 1, 1, 1,
3.091358, -0.4375514, 2.705034, 1, 1, 1, 1, 1
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
var radius = 9.4524;
var distance = 33.20115;
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
mvMatrix.translate( 0.04925919, -0.04228067, 0.3875649 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.20115);
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
