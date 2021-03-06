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
-3.271922, 1.378466, -1.618541, 1, 0, 0, 1,
-3.191604, -0.1459206, -2.904542, 1, 0.007843138, 0, 1,
-3.137079, -0.4689045, -3.773792, 1, 0.01176471, 0, 1,
-2.949621, -0.5209336, -0.8136574, 1, 0.01960784, 0, 1,
-2.828994, 1.238698, -0.714023, 1, 0.02352941, 0, 1,
-2.797957, 1.061458, -0.2492849, 1, 0.03137255, 0, 1,
-2.792688, 3.242479, 0.04939419, 1, 0.03529412, 0, 1,
-2.752258, 2.027749, 1.13404, 1, 0.04313726, 0, 1,
-2.537732, 1.209767, -0.8261754, 1, 0.04705882, 0, 1,
-2.523421, -0.03799163, -1.070167, 1, 0.05490196, 0, 1,
-2.488013, 0.07307441, -2.48628, 1, 0.05882353, 0, 1,
-2.391598, 1.168504, -1.121049, 1, 0.06666667, 0, 1,
-2.334678, 1.733738, -1.167808, 1, 0.07058824, 0, 1,
-2.316247, 0.2806791, -1.641879, 1, 0.07843138, 0, 1,
-2.288488, -1.548271, -1.68199, 1, 0.08235294, 0, 1,
-2.284233, -0.07976539, -1.589597, 1, 0.09019608, 0, 1,
-2.279722, -0.9858111, -2.891037, 1, 0.09411765, 0, 1,
-2.197117, -1.012561, -3.069758, 1, 0.1019608, 0, 1,
-2.17854, -0.6699104, -2.116671, 1, 0.1098039, 0, 1,
-2.160105, 0.5330649, 0.01248362, 1, 0.1137255, 0, 1,
-2.116287, -0.9353258, -1.787517, 1, 0.1215686, 0, 1,
-2.094498, -0.0558162, -2.640415, 1, 0.1254902, 0, 1,
-2.047127, 2.176885, -1.944027, 1, 0.1333333, 0, 1,
-2.039207, -0.3074374, 0.540983, 1, 0.1372549, 0, 1,
-2.014165, -0.09494635, -1.367958, 1, 0.145098, 0, 1,
-2.003695, -1.529123, -2.004536, 1, 0.1490196, 0, 1,
-1.989562, 0.3099012, -2.367305, 1, 0.1568628, 0, 1,
-1.964478, 0.3521891, -2.033465, 1, 0.1607843, 0, 1,
-1.957482, 0.4954522, -1.7741, 1, 0.1686275, 0, 1,
-1.954031, 1.571739, -1.133102, 1, 0.172549, 0, 1,
-1.94872, -0.7723877, -1.00435, 1, 0.1803922, 0, 1,
-1.947662, 1.204143, -1.145351, 1, 0.1843137, 0, 1,
-1.925966, -0.2939475, -1.905207, 1, 0.1921569, 0, 1,
-1.917371, 0.003535154, -0.9996447, 1, 0.1960784, 0, 1,
-1.90984, -0.3480657, -0.8615852, 1, 0.2039216, 0, 1,
-1.903745, 2.376825, 1.129581, 1, 0.2117647, 0, 1,
-1.887312, -0.6467796, -2.504741, 1, 0.2156863, 0, 1,
-1.859964, -1.261924, -2.854929, 1, 0.2235294, 0, 1,
-1.852078, 1.413309, -0.6938381, 1, 0.227451, 0, 1,
-1.829897, -0.4700563, -1.776484, 1, 0.2352941, 0, 1,
-1.829334, 1.455382, 0.1265646, 1, 0.2392157, 0, 1,
-1.821838, -0.9303538, -2.914162, 1, 0.2470588, 0, 1,
-1.809629, 0.1670163, -2.733499, 1, 0.2509804, 0, 1,
-1.783589, -0.1279359, -0.5296226, 1, 0.2588235, 0, 1,
-1.764103, 0.1892768, -0.5292191, 1, 0.2627451, 0, 1,
-1.763707, -0.7458642, -1.719802, 1, 0.2705882, 0, 1,
-1.752547, 0.1535081, -2.284199, 1, 0.2745098, 0, 1,
-1.736685, -0.680977, -1.907913, 1, 0.282353, 0, 1,
-1.71956, -1.208522, -2.110252, 1, 0.2862745, 0, 1,
-1.713227, -0.1064311, -2.097412, 1, 0.2941177, 0, 1,
-1.711644, 0.9385088, -1.796151, 1, 0.3019608, 0, 1,
-1.701654, -0.680096, -1.574988, 1, 0.3058824, 0, 1,
-1.69677, -1.803483, -4.472991, 1, 0.3137255, 0, 1,
-1.680748, 1.264833, -1.151315, 1, 0.3176471, 0, 1,
-1.661018, -0.9307036, -1.430324, 1, 0.3254902, 0, 1,
-1.638492, 0.3991915, -1.646882, 1, 0.3294118, 0, 1,
-1.616082, -0.01446127, -1.275488, 1, 0.3372549, 0, 1,
-1.608899, 1.087452, -0.6598583, 1, 0.3411765, 0, 1,
-1.607964, -0.3071986, -0.5659209, 1, 0.3490196, 0, 1,
-1.607244, -0.1850725, -1.548838, 1, 0.3529412, 0, 1,
-1.599344, 0.6585508, -1.786371, 1, 0.3607843, 0, 1,
-1.585156, 0.4676301, -0.6486095, 1, 0.3647059, 0, 1,
-1.58301, -0.9363956, -1.071754, 1, 0.372549, 0, 1,
-1.579569, -0.02272042, -1.566581, 1, 0.3764706, 0, 1,
-1.571937, -0.10711, -0.4993025, 1, 0.3843137, 0, 1,
-1.566549, 1.388643, -1.357066, 1, 0.3882353, 0, 1,
-1.554255, 0.6122088, -0.5938925, 1, 0.3960784, 0, 1,
-1.552487, 0.182265, -1.4606, 1, 0.4039216, 0, 1,
-1.550974, -0.6875219, -2.923763, 1, 0.4078431, 0, 1,
-1.549106, 1.712078, 0.5906682, 1, 0.4156863, 0, 1,
-1.545614, 1.195256, -1.583872, 1, 0.4196078, 0, 1,
-1.544474, -0.1984481, -3.507182, 1, 0.427451, 0, 1,
-1.536563, 0.9638925, -1.826405, 1, 0.4313726, 0, 1,
-1.525735, -1.752109, -1.648795, 1, 0.4392157, 0, 1,
-1.494756, -0.7435311, -1.061168, 1, 0.4431373, 0, 1,
-1.490044, 0.5640773, -0.8107699, 1, 0.4509804, 0, 1,
-1.480188, -1.561733, -2.287244, 1, 0.454902, 0, 1,
-1.478638, -0.9763988, -2.811147, 1, 0.4627451, 0, 1,
-1.467219, -0.2786928, -2.874073, 1, 0.4666667, 0, 1,
-1.444177, 1.472547, -1.432735, 1, 0.4745098, 0, 1,
-1.433451, -0.1243627, -1.083479, 1, 0.4784314, 0, 1,
-1.425954, 1.547944, -1.840244, 1, 0.4862745, 0, 1,
-1.416885, -0.9567251, -1.427872, 1, 0.4901961, 0, 1,
-1.415814, 0.09772728, -1.085508, 1, 0.4980392, 0, 1,
-1.415291, 0.9201266, -0.9233199, 1, 0.5058824, 0, 1,
-1.402618, 0.06023369, -0.7023166, 1, 0.509804, 0, 1,
-1.40224, 0.4654643, -3.210417, 1, 0.5176471, 0, 1,
-1.39925, 0.2161004, -3.139131, 1, 0.5215687, 0, 1,
-1.393083, -0.203311, -0.6003327, 1, 0.5294118, 0, 1,
-1.392909, 0.5687051, -1.016094, 1, 0.5333334, 0, 1,
-1.390239, 0.0842736, -3.951856, 1, 0.5411765, 0, 1,
-1.381618, 0.6264712, -1.378372, 1, 0.5450981, 0, 1,
-1.381326, 0.904462, 0.8092373, 1, 0.5529412, 0, 1,
-1.374139, -1.360143, -2.897323, 1, 0.5568628, 0, 1,
-1.357674, -0.02694486, -1.886381, 1, 0.5647059, 0, 1,
-1.336966, 0.3714113, -1.834919, 1, 0.5686275, 0, 1,
-1.334152, 0.6780542, -0.631552, 1, 0.5764706, 0, 1,
-1.325198, 0.2441739, -2.180895, 1, 0.5803922, 0, 1,
-1.319212, -1.189993, -3.098147, 1, 0.5882353, 0, 1,
-1.318435, 0.7674163, -0.5081915, 1, 0.5921569, 0, 1,
-1.317506, 0.01156241, -1.582813, 1, 0.6, 0, 1,
-1.316448, 0.2926866, -1.875236, 1, 0.6078432, 0, 1,
-1.290998, 2.750696, 0.4569114, 1, 0.6117647, 0, 1,
-1.290758, 1.299355, -1.215784, 1, 0.6196079, 0, 1,
-1.282499, 1.330931, 0.4551999, 1, 0.6235294, 0, 1,
-1.281899, -0.798551, -2.655675, 1, 0.6313726, 0, 1,
-1.279061, 2.22629, -0.6715767, 1, 0.6352941, 0, 1,
-1.273312, 0.1599567, -2.357574, 1, 0.6431373, 0, 1,
-1.271182, -0.8630359, -2.270256, 1, 0.6470588, 0, 1,
-1.269864, -1.500226, -3.508279, 1, 0.654902, 0, 1,
-1.24187, 1.342932, 0.4296448, 1, 0.6588235, 0, 1,
-1.240388, -0.2056017, -2.735595, 1, 0.6666667, 0, 1,
-1.234957, 0.6776786, 0.08013722, 1, 0.6705883, 0, 1,
-1.217757, -0.9005858, -4.425685, 1, 0.6784314, 0, 1,
-1.215698, -0.3544804, -3.256742, 1, 0.682353, 0, 1,
-1.207629, 0.6685594, -0.9442459, 1, 0.6901961, 0, 1,
-1.204318, -0.7466547, -2.393259, 1, 0.6941177, 0, 1,
-1.199122, 0.8571928, -2.460706, 1, 0.7019608, 0, 1,
-1.188038, 1.820456, -0.03837802, 1, 0.7098039, 0, 1,
-1.181681, -0.9530618, -1.39177, 1, 0.7137255, 0, 1,
-1.181372, -1.642539, -1.559349, 1, 0.7215686, 0, 1,
-1.176376, 1.821703, 0.3697293, 1, 0.7254902, 0, 1,
-1.176275, 0.5383996, -0.6165878, 1, 0.7333333, 0, 1,
-1.172315, 0.04696277, -1.707783, 1, 0.7372549, 0, 1,
-1.149959, 0.1806191, -1.528694, 1, 0.7450981, 0, 1,
-1.147952, 1.415757, 0.3360927, 1, 0.7490196, 0, 1,
-1.147878, -0.7295884, -3.591084, 1, 0.7568628, 0, 1,
-1.14756, -0.2601032, -2.364943, 1, 0.7607843, 0, 1,
-1.143551, 0.2629624, 1.052734, 1, 0.7686275, 0, 1,
-1.141208, 0.1335505, -1.160874, 1, 0.772549, 0, 1,
-1.141102, -0.7697881, -3.486599, 1, 0.7803922, 0, 1,
-1.136497, 0.1285203, -0.07166447, 1, 0.7843137, 0, 1,
-1.134454, 0.897526, -0.2436318, 1, 0.7921569, 0, 1,
-1.124003, -2.100849, -2.29964, 1, 0.7960784, 0, 1,
-1.12278, 0.1619176, -0.5020292, 1, 0.8039216, 0, 1,
-1.111249, 1.642668, 0.5648417, 1, 0.8117647, 0, 1,
-1.110052, 0.7931204, -0.7103423, 1, 0.8156863, 0, 1,
-1.107379, -1.585865, -4.238381, 1, 0.8235294, 0, 1,
-1.082946, 1.358311, -1.536019, 1, 0.827451, 0, 1,
-1.081262, 0.3356979, -1.724812, 1, 0.8352941, 0, 1,
-1.063569, -0.1068294, -2.560647, 1, 0.8392157, 0, 1,
-1.062886, -0.04549614, -1.584665, 1, 0.8470588, 0, 1,
-1.05086, -0.1370801, -2.909561, 1, 0.8509804, 0, 1,
-1.048413, 0.5088624, -1.747553, 1, 0.8588235, 0, 1,
-1.03478, -0.767338, -2.380588, 1, 0.8627451, 0, 1,
-1.032554, 0.1035613, -1.489216, 1, 0.8705882, 0, 1,
-1.024226, 1.177403, -2.070599, 1, 0.8745098, 0, 1,
-1.016518, -0.2638693, -3.446465, 1, 0.8823529, 0, 1,
-1.016428, -0.5798899, -2.506874, 1, 0.8862745, 0, 1,
-1.01324, -0.1918504, -1.293852, 1, 0.8941177, 0, 1,
-1.005131, -2.590923, -2.112839, 1, 0.8980392, 0, 1,
-0.9981539, -0.1326736, -1.767131, 1, 0.9058824, 0, 1,
-0.9938467, 0.3139907, -1.507612, 1, 0.9137255, 0, 1,
-0.9851745, 1.56357, 0.7529081, 1, 0.9176471, 0, 1,
-0.9833611, 0.4878738, 0.4470658, 1, 0.9254902, 0, 1,
-0.9828711, 0.2805321, -0.9796322, 1, 0.9294118, 0, 1,
-0.9825213, 1.080663, -1.11604, 1, 0.9372549, 0, 1,
-0.9804559, -0.2730038, -1.808321, 1, 0.9411765, 0, 1,
-0.9784179, -1.835434, -2.937932, 1, 0.9490196, 0, 1,
-0.9768096, -0.8637825, -2.616504, 1, 0.9529412, 0, 1,
-0.9687678, -0.2097799, -2.050819, 1, 0.9607843, 0, 1,
-0.9669682, 1.566938, -0.2832662, 1, 0.9647059, 0, 1,
-0.9646513, 1.223807, -0.6858029, 1, 0.972549, 0, 1,
-0.9604663, 0.6092633, -0.3330305, 1, 0.9764706, 0, 1,
-0.9575345, 0.2634526, 0.04240445, 1, 0.9843137, 0, 1,
-0.9533584, -1.764265, -3.701868, 1, 0.9882353, 0, 1,
-0.9500058, 0.1686801, -1.035636, 1, 0.9960784, 0, 1,
-0.949782, 0.1274925, 0.4052079, 0.9960784, 1, 0, 1,
-0.9456261, 0.4797603, 0.4344533, 0.9921569, 1, 0, 1,
-0.9445996, -2.541474, -2.91901, 0.9843137, 1, 0, 1,
-0.9427079, 0.8310459, -1.144616, 0.9803922, 1, 0, 1,
-0.942269, 0.7818659, -1.00695, 0.972549, 1, 0, 1,
-0.9386628, 0.2147683, 0.5815736, 0.9686275, 1, 0, 1,
-0.9367354, -0.4391811, 0.09528686, 0.9607843, 1, 0, 1,
-0.9361637, -0.4002827, -2.209242, 0.9568627, 1, 0, 1,
-0.93148, 0.6015309, -1.283903, 0.9490196, 1, 0, 1,
-0.9314795, 0.4982887, 0.453172, 0.945098, 1, 0, 1,
-0.9231021, 0.3005898, -1.684799, 0.9372549, 1, 0, 1,
-0.9172381, -0.8402199, -1.970159, 0.9333333, 1, 0, 1,
-0.9071458, -0.2820712, 0.2908887, 0.9254902, 1, 0, 1,
-0.9001486, 0.634366, -2.287069, 0.9215686, 1, 0, 1,
-0.898841, -0.004782651, 0.3671671, 0.9137255, 1, 0, 1,
-0.8884625, -1.473339, -1.33288, 0.9098039, 1, 0, 1,
-0.8862675, -2.008154, -3.157802, 0.9019608, 1, 0, 1,
-0.8698877, 1.53064, -2.534328, 0.8941177, 1, 0, 1,
-0.8698553, -0.3418863, 0.1592002, 0.8901961, 1, 0, 1,
-0.8690242, -0.1671029, -0.8553944, 0.8823529, 1, 0, 1,
-0.8665631, -1.091092, -2.578131, 0.8784314, 1, 0, 1,
-0.8641707, 0.6877248, -0.8160812, 0.8705882, 1, 0, 1,
-0.8640751, -0.7673968, -1.637665, 0.8666667, 1, 0, 1,
-0.8583084, -1.325416, -2.528131, 0.8588235, 1, 0, 1,
-0.8557903, -1.106868, -2.179946, 0.854902, 1, 0, 1,
-0.8524045, 1.212377, 0.2072105, 0.8470588, 1, 0, 1,
-0.847052, 0.8710189, -1.844146, 0.8431373, 1, 0, 1,
-0.8458912, 0.7368863, 0.2755166, 0.8352941, 1, 0, 1,
-0.8429867, -0.7035491, -3.863484, 0.8313726, 1, 0, 1,
-0.8417959, -0.7497759, -2.23174, 0.8235294, 1, 0, 1,
-0.8361259, -0.7264683, -3.621113, 0.8196079, 1, 0, 1,
-0.8303936, -0.2783791, -1.587514, 0.8117647, 1, 0, 1,
-0.8262869, 1.334807, -0.3145325, 0.8078431, 1, 0, 1,
-0.8217338, 1.252575, -1.458014, 0.8, 1, 0, 1,
-0.8150126, 0.6309786, -0.2802749, 0.7921569, 1, 0, 1,
-0.8101823, -0.6223708, -0.6920496, 0.7882353, 1, 0, 1,
-0.8085045, 2.4587, 0.6142866, 0.7803922, 1, 0, 1,
-0.8053546, -0.6695293, -1.045979, 0.7764706, 1, 0, 1,
-0.8041897, 2.284309, -1.637961, 0.7686275, 1, 0, 1,
-0.7957944, 0.7362614, 0.2372927, 0.7647059, 1, 0, 1,
-0.7950867, -0.3598844, -2.735162, 0.7568628, 1, 0, 1,
-0.792728, 0.5580793, 0.2757996, 0.7529412, 1, 0, 1,
-0.7904525, -0.5568104, -2.349405, 0.7450981, 1, 0, 1,
-0.7810858, -1.948684, -2.011663, 0.7411765, 1, 0, 1,
-0.7782764, 0.2426197, -2.060408, 0.7333333, 1, 0, 1,
-0.7746428, -1.491285, -2.414505, 0.7294118, 1, 0, 1,
-0.7720389, -2.049906, -3.19977, 0.7215686, 1, 0, 1,
-0.7712093, -0.6311147, -5.580099, 0.7176471, 1, 0, 1,
-0.7712091, -1.076871, -1.886682, 0.7098039, 1, 0, 1,
-0.7706283, 0.4211494, -1.713805, 0.7058824, 1, 0, 1,
-0.7698722, -0.2256778, -2.384105, 0.6980392, 1, 0, 1,
-0.7679507, 0.2698615, -2.541465, 0.6901961, 1, 0, 1,
-0.7671185, -0.8899678, -1.16054, 0.6862745, 1, 0, 1,
-0.7645262, -0.637204, -2.759846, 0.6784314, 1, 0, 1,
-0.7590445, -0.7636696, -4.295257, 0.6745098, 1, 0, 1,
-0.757245, 0.9056246, -0.9468414, 0.6666667, 1, 0, 1,
-0.7542823, 0.6404952, -0.05042795, 0.6627451, 1, 0, 1,
-0.7510373, -0.2059048, -1.361097, 0.654902, 1, 0, 1,
-0.748823, -0.4315418, -1.294959, 0.6509804, 1, 0, 1,
-0.7444986, 0.5823407, -1.141685, 0.6431373, 1, 0, 1,
-0.7443392, 0.3246806, -0.7062505, 0.6392157, 1, 0, 1,
-0.7353528, 0.9775403, -0.2202115, 0.6313726, 1, 0, 1,
-0.7263932, 0.0450845, -2.54546, 0.627451, 1, 0, 1,
-0.7260549, -0.2857861, -3.713134, 0.6196079, 1, 0, 1,
-0.7217646, -0.1952887, -0.7670434, 0.6156863, 1, 0, 1,
-0.7207201, 0.06308568, 0.06409886, 0.6078432, 1, 0, 1,
-0.715809, 1.309199, 0.6771458, 0.6039216, 1, 0, 1,
-0.7154546, -0.9614286, -4.00307, 0.5960785, 1, 0, 1,
-0.714551, -0.6167204, -4.307026, 0.5882353, 1, 0, 1,
-0.7104703, -0.4126065, -2.147155, 0.5843138, 1, 0, 1,
-0.7100226, -1.041538, -3.582312, 0.5764706, 1, 0, 1,
-0.7090417, 1.719456, 0.4461994, 0.572549, 1, 0, 1,
-0.7081934, 2.271598, -0.5115654, 0.5647059, 1, 0, 1,
-0.705382, -0.3708438, -1.981911, 0.5607843, 1, 0, 1,
-0.6865543, -0.008969063, -1.124526, 0.5529412, 1, 0, 1,
-0.6843388, 0.1067166, -0.5850999, 0.5490196, 1, 0, 1,
-0.6842989, 0.9419429, 0.2486607, 0.5411765, 1, 0, 1,
-0.6837928, -1.051035, -0.6691595, 0.5372549, 1, 0, 1,
-0.6822522, 0.4841498, 1.149016, 0.5294118, 1, 0, 1,
-0.6818979, 0.3283655, -1.488771, 0.5254902, 1, 0, 1,
-0.6784766, 0.643667, -1.331345, 0.5176471, 1, 0, 1,
-0.6777839, 0.6426015, 1.170935, 0.5137255, 1, 0, 1,
-0.6730008, -0.1426727, -1.589855, 0.5058824, 1, 0, 1,
-0.6727626, -0.7362869, -1.185259, 0.5019608, 1, 0, 1,
-0.6682362, 1.496421, -0.481937, 0.4941176, 1, 0, 1,
-0.6671886, 1.374326, -1.033699, 0.4862745, 1, 0, 1,
-0.666802, -0.2359103, -3.662903, 0.4823529, 1, 0, 1,
-0.6661101, -1.50204, -3.175733, 0.4745098, 1, 0, 1,
-0.6620858, 0.2596607, -0.6826508, 0.4705882, 1, 0, 1,
-0.6617408, 1.591161, 0.02736527, 0.4627451, 1, 0, 1,
-0.6582778, 0.9072646, -1.681481, 0.4588235, 1, 0, 1,
-0.655083, 2.008041, 0.3934474, 0.4509804, 1, 0, 1,
-0.65295, 0.3207745, -0.2825075, 0.4470588, 1, 0, 1,
-0.6523508, 0.1779691, -0.3167569, 0.4392157, 1, 0, 1,
-0.6505451, 1.013883, -0.08991201, 0.4352941, 1, 0, 1,
-0.6434552, -0.686103, -2.498162, 0.427451, 1, 0, 1,
-0.6414505, -0.5582961, -2.260695, 0.4235294, 1, 0, 1,
-0.6399434, -2.531485, -4.24435, 0.4156863, 1, 0, 1,
-0.6384514, 0.1846104, -0.2628559, 0.4117647, 1, 0, 1,
-0.6383845, 0.4086952, -0.3687002, 0.4039216, 1, 0, 1,
-0.6356089, -2.2934, -1.742485, 0.3960784, 1, 0, 1,
-0.6255722, 0.5271084, -0.574064, 0.3921569, 1, 0, 1,
-0.6246017, 0.1140719, -0.5611802, 0.3843137, 1, 0, 1,
-0.622308, -0.1979319, -3.074179, 0.3803922, 1, 0, 1,
-0.6208986, -0.5903158, -3.55359, 0.372549, 1, 0, 1,
-0.6148052, 1.239549, 1.76053, 0.3686275, 1, 0, 1,
-0.6135776, -0.3619178, -1.600256, 0.3607843, 1, 0, 1,
-0.6082249, -2.198107, -4.08912, 0.3568628, 1, 0, 1,
-0.6006467, 0.294793, -1.359833, 0.3490196, 1, 0, 1,
-0.5998324, -0.1198996, -3.360883, 0.345098, 1, 0, 1,
-0.5988006, -0.9792324, -1.340328, 0.3372549, 1, 0, 1,
-0.5982955, 0.6077768, -0.0933418, 0.3333333, 1, 0, 1,
-0.5975223, -0.6846368, -1.521796, 0.3254902, 1, 0, 1,
-0.5971586, -0.5364944, -3.62664, 0.3215686, 1, 0, 1,
-0.5949974, -1.684522, -2.662285, 0.3137255, 1, 0, 1,
-0.5921599, -1.148574, -2.795004, 0.3098039, 1, 0, 1,
-0.588782, -1.651504, -1.855906, 0.3019608, 1, 0, 1,
-0.5875644, 0.6101416, -0.001162914, 0.2941177, 1, 0, 1,
-0.5862185, 1.071246, -0.1091199, 0.2901961, 1, 0, 1,
-0.584299, 0.6234025, -2.917268, 0.282353, 1, 0, 1,
-0.5820134, 0.6978911, -0.5115306, 0.2784314, 1, 0, 1,
-0.5775038, 1.076331, 1.337574, 0.2705882, 1, 0, 1,
-0.5706676, -0.4114222, -1.303702, 0.2666667, 1, 0, 1,
-0.5683258, 0.2369349, -2.596167, 0.2588235, 1, 0, 1,
-0.5679857, 0.1860957, -1.605808, 0.254902, 1, 0, 1,
-0.5655299, 0.4169407, 0.4051577, 0.2470588, 1, 0, 1,
-0.5630635, 0.580173, -0.2930918, 0.2431373, 1, 0, 1,
-0.5607182, -3.385449, -1.497139, 0.2352941, 1, 0, 1,
-0.5575081, 0.2164464, -1.745123, 0.2313726, 1, 0, 1,
-0.555858, 0.451079, -2.128702, 0.2235294, 1, 0, 1,
-0.5558076, -2.558878, -4.175909, 0.2196078, 1, 0, 1,
-0.5537691, 0.5710129, -1.424777, 0.2117647, 1, 0, 1,
-0.5495687, 0.04049173, -1.833508, 0.2078431, 1, 0, 1,
-0.5457137, 0.3898389, -0.6922497, 0.2, 1, 0, 1,
-0.5452905, 0.09011852, -2.764574, 0.1921569, 1, 0, 1,
-0.5440685, 0.5838485, -1.179732, 0.1882353, 1, 0, 1,
-0.5438818, 0.8851246, -0.5636691, 0.1803922, 1, 0, 1,
-0.5414473, 0.8968837, -1.430521, 0.1764706, 1, 0, 1,
-0.5354919, -2.003972, -2.268628, 0.1686275, 1, 0, 1,
-0.533735, 0.5877163, -1.007842, 0.1647059, 1, 0, 1,
-0.5319095, 0.08172058, 0.2091439, 0.1568628, 1, 0, 1,
-0.5313182, 0.7842395, 0.7695149, 0.1529412, 1, 0, 1,
-0.530737, -0.7980119, -2.139889, 0.145098, 1, 0, 1,
-0.5239655, 0.115819, -1.834275, 0.1411765, 1, 0, 1,
-0.5236269, -0.80107, -2.519931, 0.1333333, 1, 0, 1,
-0.518697, -1.888953, -4.559752, 0.1294118, 1, 0, 1,
-0.5177408, -0.5888995, -3.376309, 0.1215686, 1, 0, 1,
-0.5171518, 0.1509727, -0.4492925, 0.1176471, 1, 0, 1,
-0.516143, -0.1359058, -2.058375, 0.1098039, 1, 0, 1,
-0.5142062, 1.817362, -1.175621, 0.1058824, 1, 0, 1,
-0.5125225, -1.547436, -3.382699, 0.09803922, 1, 0, 1,
-0.5117804, 0.1804522, -0.7255558, 0.09019608, 1, 0, 1,
-0.5090383, 0.9541057, -0.8734564, 0.08627451, 1, 0, 1,
-0.5022002, 0.2090895, -1.364656, 0.07843138, 1, 0, 1,
-0.500398, 0.431107, -0.244593, 0.07450981, 1, 0, 1,
-0.5002976, 2.598722, -0.8112457, 0.06666667, 1, 0, 1,
-0.4994619, 0.1803834, -1.805582, 0.0627451, 1, 0, 1,
-0.4986949, 0.6485701, -1.611129, 0.05490196, 1, 0, 1,
-0.4964328, -0.01532526, -0.1359914, 0.05098039, 1, 0, 1,
-0.4921374, -0.9895189, -3.295643, 0.04313726, 1, 0, 1,
-0.4902141, -0.09783472, -1.172314, 0.03921569, 1, 0, 1,
-0.4888118, -0.3437238, -3.755089, 0.03137255, 1, 0, 1,
-0.487783, 1.843708, 0.1600014, 0.02745098, 1, 0, 1,
-0.4839285, -1.728266, -3.416432, 0.01960784, 1, 0, 1,
-0.4790249, 1.814372, 1.832102, 0.01568628, 1, 0, 1,
-0.4768729, -0.3679529, -1.980365, 0.007843138, 1, 0, 1,
-0.4755152, -1.089477, -1.969571, 0.003921569, 1, 0, 1,
-0.4673136, -0.2876915, -1.523863, 0, 1, 0.003921569, 1,
-0.4656144, 0.9622362, -0.9721957, 0, 1, 0.01176471, 1,
-0.4651197, -0.2523056, -3.228145, 0, 1, 0.01568628, 1,
-0.4593086, 1.428191, 0.7094166, 0, 1, 0.02352941, 1,
-0.4575612, 0.6535229, -0.7007251, 0, 1, 0.02745098, 1,
-0.4565738, -1.444952, -1.506507, 0, 1, 0.03529412, 1,
-0.4559625, 0.2179101, -2.020066, 0, 1, 0.03921569, 1,
-0.4543675, -0.4082944, -2.003921, 0, 1, 0.04705882, 1,
-0.451259, 0.2540487, -1.256788, 0, 1, 0.05098039, 1,
-0.4508609, 1.521417, -1.211882, 0, 1, 0.05882353, 1,
-0.4504502, -0.04879745, -2.137698, 0, 1, 0.0627451, 1,
-0.4494503, 1.141885, 1.739533, 0, 1, 0.07058824, 1,
-0.4412829, -1.272779, -4.288128, 0, 1, 0.07450981, 1,
-0.4395291, 0.6659445, 1.109893, 0, 1, 0.08235294, 1,
-0.4368087, -0.3442093, -2.210595, 0, 1, 0.08627451, 1,
-0.4348147, 0.8811078, -0.3122978, 0, 1, 0.09411765, 1,
-0.4299462, -0.2626099, -2.864137, 0, 1, 0.1019608, 1,
-0.4234755, 0.644245, 0.2281831, 0, 1, 0.1058824, 1,
-0.4182048, -0.2317592, 0.2755916, 0, 1, 0.1137255, 1,
-0.4179083, -0.7682502, -2.227631, 0, 1, 0.1176471, 1,
-0.4177479, -1.940893, -2.481607, 0, 1, 0.1254902, 1,
-0.4131843, -0.9133899, -3.941388, 0, 1, 0.1294118, 1,
-0.4130693, 1.659865, -1.695783, 0, 1, 0.1372549, 1,
-0.4127619, -0.4452389, -4.161263, 0, 1, 0.1411765, 1,
-0.4108366, -1.971689, -5.195403, 0, 1, 0.1490196, 1,
-0.4071641, 0.08366323, -0.9171736, 0, 1, 0.1529412, 1,
-0.4021869, 0.4938076, -0.699948, 0, 1, 0.1607843, 1,
-0.4000787, 0.42087, -0.6336814, 0, 1, 0.1647059, 1,
-0.3977863, -1.19285, -2.21973, 0, 1, 0.172549, 1,
-0.3974046, 1.434754, 0.7425613, 0, 1, 0.1764706, 1,
-0.3953399, -0.605499, -3.59453, 0, 1, 0.1843137, 1,
-0.3935531, -2.289287, -1.960999, 0, 1, 0.1882353, 1,
-0.390443, -1.254554, -4.184505, 0, 1, 0.1960784, 1,
-0.3902881, -1.338309, -4.277377, 0, 1, 0.2039216, 1,
-0.3897212, -0.4861613, -2.154149, 0, 1, 0.2078431, 1,
-0.3865482, -2.197207, -1.839264, 0, 1, 0.2156863, 1,
-0.3830012, -0.1279999, -0.5607857, 0, 1, 0.2196078, 1,
-0.3803104, 0.9430336, -4.154021, 0, 1, 0.227451, 1,
-0.3795253, -0.4018743, -2.30821, 0, 1, 0.2313726, 1,
-0.3793819, 0.4834037, -0.3537449, 0, 1, 0.2392157, 1,
-0.3721572, -1.957153, -1.983541, 0, 1, 0.2431373, 1,
-0.3710224, -0.06879136, -1.724005, 0, 1, 0.2509804, 1,
-0.3637609, 1.132728, -0.08447315, 0, 1, 0.254902, 1,
-0.362169, 0.5782766, -0.5615142, 0, 1, 0.2627451, 1,
-0.3621421, -0.7516807, -2.016845, 0, 1, 0.2666667, 1,
-0.3608938, -0.1108549, 0.1022592, 0, 1, 0.2745098, 1,
-0.3568734, 1.145296, -0.4616119, 0, 1, 0.2784314, 1,
-0.3541682, -0.6680586, -2.307209, 0, 1, 0.2862745, 1,
-0.3539575, -0.3518377, -3.484734, 0, 1, 0.2901961, 1,
-0.3539509, 0.6026782, 1.156443, 0, 1, 0.2980392, 1,
-0.3500531, -0.9896526, -2.757632, 0, 1, 0.3058824, 1,
-0.3452729, -1.089183, -2.806072, 0, 1, 0.3098039, 1,
-0.3399075, -0.892845, -0.8637831, 0, 1, 0.3176471, 1,
-0.338455, 0.1183716, 0.01346228, 0, 1, 0.3215686, 1,
-0.3348764, -0.764468, -3.432042, 0, 1, 0.3294118, 1,
-0.3321231, 0.1419821, -3.027288, 0, 1, 0.3333333, 1,
-0.3288549, -0.166939, -1.057567, 0, 1, 0.3411765, 1,
-0.3259916, -0.3133615, -2.118307, 0, 1, 0.345098, 1,
-0.322252, 0.1697244, -0.6769268, 0, 1, 0.3529412, 1,
-0.3204318, -0.1904497, -3.845501, 0, 1, 0.3568628, 1,
-0.3191598, -0.4124654, -3.656186, 0, 1, 0.3647059, 1,
-0.3149825, -0.9520468, -1.728244, 0, 1, 0.3686275, 1,
-0.3101111, 1.247398, -0.3563951, 0, 1, 0.3764706, 1,
-0.303934, -0.2708075, -2.072024, 0, 1, 0.3803922, 1,
-0.302245, 0.3496318, -0.00692312, 0, 1, 0.3882353, 1,
-0.2996382, 0.5866437, -2.515203, 0, 1, 0.3921569, 1,
-0.2994162, -0.5563388, -3.014551, 0, 1, 0.4, 1,
-0.2966321, 1.460719, -0.09142102, 0, 1, 0.4078431, 1,
-0.2887973, -0.06645793, -5.615728, 0, 1, 0.4117647, 1,
-0.2782459, 1.739171, 0.633812, 0, 1, 0.4196078, 1,
-0.2781535, 0.2529501, -1.622819, 0, 1, 0.4235294, 1,
-0.2729739, 0.1230785, -0.3882119, 0, 1, 0.4313726, 1,
-0.2687977, -1.86596, -1.584468, 0, 1, 0.4352941, 1,
-0.2683627, 1.667871, -0.9891855, 0, 1, 0.4431373, 1,
-0.2663045, -0.5597977, -4.398312, 0, 1, 0.4470588, 1,
-0.2639413, 0.01951244, -2.417136, 0, 1, 0.454902, 1,
-0.261925, -0.621191, -1.628376, 0, 1, 0.4588235, 1,
-0.2573351, -1.068153, -4.16411, 0, 1, 0.4666667, 1,
-0.2494355, 0.2948067, -2.171386, 0, 1, 0.4705882, 1,
-0.2435143, -0.7695621, -1.981071, 0, 1, 0.4784314, 1,
-0.2432547, -2.855189, -1.703299, 0, 1, 0.4823529, 1,
-0.240778, 0.7029896, 0.4789377, 0, 1, 0.4901961, 1,
-0.2406679, -1.080283, -3.211171, 0, 1, 0.4941176, 1,
-0.2326816, -0.5033681, -2.957551, 0, 1, 0.5019608, 1,
-0.228511, 1.004727, -0.4890915, 0, 1, 0.509804, 1,
-0.2274164, -0.5871642, -1.789231, 0, 1, 0.5137255, 1,
-0.2260976, 1.811317, -0.7381929, 0, 1, 0.5215687, 1,
-0.2248308, 0.2642823, 0.8567747, 0, 1, 0.5254902, 1,
-0.22472, -0.5365298, -3.559455, 0, 1, 0.5333334, 1,
-0.2230754, 0.7052964, 0.2130613, 0, 1, 0.5372549, 1,
-0.2206802, -0.1228358, -1.377602, 0, 1, 0.5450981, 1,
-0.2124018, 1.852707, -0.6265486, 0, 1, 0.5490196, 1,
-0.1944079, -0.007069382, -2.915983, 0, 1, 0.5568628, 1,
-0.1939449, -0.08232474, -2.130909, 0, 1, 0.5607843, 1,
-0.1928781, -1.981566, -4.074697, 0, 1, 0.5686275, 1,
-0.1815239, 1.133149, 0.398462, 0, 1, 0.572549, 1,
-0.1803464, -1.132722, -3.651283, 0, 1, 0.5803922, 1,
-0.1800638, 0.2706209, -2.433867, 0, 1, 0.5843138, 1,
-0.1786996, 1.674939, -1.113737, 0, 1, 0.5921569, 1,
-0.1758499, 0.05657976, -2.03101, 0, 1, 0.5960785, 1,
-0.1744825, -0.1606307, -1.954082, 0, 1, 0.6039216, 1,
-0.1718207, 0.9309961, 0.01562114, 0, 1, 0.6117647, 1,
-0.1700494, -0.05860122, -3.094547, 0, 1, 0.6156863, 1,
-0.1643436, 0.6916339, 1.725499, 0, 1, 0.6235294, 1,
-0.1579281, 1.082631, -0.4473763, 0, 1, 0.627451, 1,
-0.1523299, 0.8500683, -0.4885284, 0, 1, 0.6352941, 1,
-0.1520834, 0.5078727, -0.5541327, 0, 1, 0.6392157, 1,
-0.1515996, -0.9481722, -2.914596, 0, 1, 0.6470588, 1,
-0.1509252, 0.6729523, -3.143148, 0, 1, 0.6509804, 1,
-0.1463529, -0.9438769, -4.888665, 0, 1, 0.6588235, 1,
-0.1454802, 0.7720731, 0.3866236, 0, 1, 0.6627451, 1,
-0.1408358, -0.350988, -2.861831, 0, 1, 0.6705883, 1,
-0.1354106, 0.5770441, 0.1083123, 0, 1, 0.6745098, 1,
-0.1310664, -0.8315642, -3.928638, 0, 1, 0.682353, 1,
-0.1287678, 0.02453492, -1.642951, 0, 1, 0.6862745, 1,
-0.1265257, 1.354265, 1.367709, 0, 1, 0.6941177, 1,
-0.1264198, 0.008337807, -2.888343, 0, 1, 0.7019608, 1,
-0.1259868, 0.6178738, -1.455027, 0, 1, 0.7058824, 1,
-0.125876, -0.2799173, -2.465537, 0, 1, 0.7137255, 1,
-0.1218122, -2.414841, -2.706627, 0, 1, 0.7176471, 1,
-0.1212298, 0.9963031, -1.06684, 0, 1, 0.7254902, 1,
-0.1212203, -1.179244, -3.097243, 0, 1, 0.7294118, 1,
-0.11314, 0.4769953, -0.8466919, 0, 1, 0.7372549, 1,
-0.112965, -1.171183, -3.352386, 0, 1, 0.7411765, 1,
-0.1099101, 2.160734, -0.8033392, 0, 1, 0.7490196, 1,
-0.1082952, -1.379605, -3.761462, 0, 1, 0.7529412, 1,
-0.106409, 0.0233319, -2.070382, 0, 1, 0.7607843, 1,
-0.1046246, 1.527992, 0.3809085, 0, 1, 0.7647059, 1,
-0.09977145, 1.321361, 1.081839, 0, 1, 0.772549, 1,
-0.09653094, -0.5395268, -3.464034, 0, 1, 0.7764706, 1,
-0.09270588, 0.3383052, 0.8930695, 0, 1, 0.7843137, 1,
-0.09259222, -2.011281, -3.140966, 0, 1, 0.7882353, 1,
-0.09258889, 0.1386613, -1.96814, 0, 1, 0.7960784, 1,
-0.09042633, 0.2694523, 1.185814, 0, 1, 0.8039216, 1,
-0.08840196, -0.3604987, -2.516749, 0, 1, 0.8078431, 1,
-0.08793862, -0.2973291, -3.664122, 0, 1, 0.8156863, 1,
-0.08626526, 0.04740674, -2.135037, 0, 1, 0.8196079, 1,
-0.08500782, -1.917007, -1.911362, 0, 1, 0.827451, 1,
-0.08443905, 0.6402461, 1.091192, 0, 1, 0.8313726, 1,
-0.08065658, -0.4037299, -2.897554, 0, 1, 0.8392157, 1,
-0.07763605, -0.07269683, -2.638159, 0, 1, 0.8431373, 1,
-0.07055044, 0.1900698, 0.2082543, 0, 1, 0.8509804, 1,
-0.07031985, 0.7055502, 0.4635048, 0, 1, 0.854902, 1,
-0.06993318, 1.329889, 1.73124, 0, 1, 0.8627451, 1,
-0.06547353, 1.451067, 0.07597458, 0, 1, 0.8666667, 1,
-0.06495652, -0.9849926, -1.258055, 0, 1, 0.8745098, 1,
-0.06241972, 1.483732, 1.491521, 0, 1, 0.8784314, 1,
-0.06234746, -0.003462531, -1.05359, 0, 1, 0.8862745, 1,
-0.06190746, -0.6849119, -2.9388, 0, 1, 0.8901961, 1,
-0.05917891, 1.129616, -0.7874049, 0, 1, 0.8980392, 1,
-0.05523756, -1.388903, -2.657078, 0, 1, 0.9058824, 1,
-0.05440652, -0.387605, -3.11585, 0, 1, 0.9098039, 1,
-0.05189954, -1.629803, -3.294766, 0, 1, 0.9176471, 1,
-0.0480613, 1.421778, -0.1964705, 0, 1, 0.9215686, 1,
-0.04783237, -0.27656, -1.855279, 0, 1, 0.9294118, 1,
-0.04444418, 0.973856, 0.5383725, 0, 1, 0.9333333, 1,
-0.04311212, 1.176007, -1.066306, 0, 1, 0.9411765, 1,
-0.04092719, 0.4777206, 0.4483899, 0, 1, 0.945098, 1,
-0.0401202, -0.3454515, -2.678917, 0, 1, 0.9529412, 1,
-0.03617436, -1.657709, -3.660841, 0, 1, 0.9568627, 1,
-0.03468967, 0.2340528, 1.16878, 0, 1, 0.9647059, 1,
-0.02649119, 1.334179, -0.005734155, 0, 1, 0.9686275, 1,
-0.02296855, -1.015565, -1.311149, 0, 1, 0.9764706, 1,
-0.02198816, -0.1586209, -2.475124, 0, 1, 0.9803922, 1,
-0.02064619, 0.6197364, -0.6714334, 0, 1, 0.9882353, 1,
-0.02051869, 0.05332275, -1.888581, 0, 1, 0.9921569, 1,
-0.01992169, 0.6060399, 0.5660717, 0, 1, 1, 1,
-0.01641919, 1.351788, -1.682262, 0, 0.9921569, 1, 1,
-0.01553116, 0.8297979, -0.4713547, 0, 0.9882353, 1, 1,
-0.01467617, -0.8013259, -5.333013, 0, 0.9803922, 1, 1,
-0.004596651, 1.668777, 1.373817, 0, 0.9764706, 1, 1,
-0.004309075, -0.03353158, -2.801158, 0, 0.9686275, 1, 1,
-0.00329011, -0.3210266, -2.601799, 0, 0.9647059, 1, 1,
-0.001983041, -0.9089516, -3.220957, 0, 0.9568627, 1, 1,
-0.001811215, 0.6545243, 0.8247398, 0, 0.9529412, 1, 1,
-0.0006308176, 0.04384413, 0.1312417, 0, 0.945098, 1, 1,
0.007852597, -0.4039567, 2.156962, 0, 0.9411765, 1, 1,
0.008167388, -3.108265, 3.459758, 0, 0.9333333, 1, 1,
0.01202715, -1.446097, 2.675976, 0, 0.9294118, 1, 1,
0.01220932, -0.4604713, 2.880757, 0, 0.9215686, 1, 1,
0.01308195, -0.1436613, 2.892623, 0, 0.9176471, 1, 1,
0.01722266, 0.8453561, 0.3938383, 0, 0.9098039, 1, 1,
0.0196811, -1.607141, 3.947452, 0, 0.9058824, 1, 1,
0.02558452, 0.9982737, 1.532253, 0, 0.8980392, 1, 1,
0.02579579, -1.162105, 2.591072, 0, 0.8901961, 1, 1,
0.02732032, -1.225203, 4.25112, 0, 0.8862745, 1, 1,
0.0332502, 1.351073, 1.381844, 0, 0.8784314, 1, 1,
0.03661909, -0.2115366, 3.42683, 0, 0.8745098, 1, 1,
0.03740651, -0.05348957, 2.35349, 0, 0.8666667, 1, 1,
0.04019317, -0.1658049, 4.267491, 0, 0.8627451, 1, 1,
0.04263494, 0.9275041, 0.6306248, 0, 0.854902, 1, 1,
0.04589243, -0.383083, 3.495047, 0, 0.8509804, 1, 1,
0.04806605, -0.5248085, 3.54289, 0, 0.8431373, 1, 1,
0.0539913, -2.061174, 1.267761, 0, 0.8392157, 1, 1,
0.05898389, -1.270866, 5.349863, 0, 0.8313726, 1, 1,
0.06084526, 0.2218108, -0.644309, 0, 0.827451, 1, 1,
0.06171232, 1.277696, 1.559761, 0, 0.8196079, 1, 1,
0.07209033, 0.4177714, 0.2414408, 0, 0.8156863, 1, 1,
0.08691104, -0.1297976, 4.158492, 0, 0.8078431, 1, 1,
0.09211703, 0.3409263, 0.2758294, 0, 0.8039216, 1, 1,
0.09281036, 0.9968679, -0.7151045, 0, 0.7960784, 1, 1,
0.09357834, -1.312669, 2.482292, 0, 0.7882353, 1, 1,
0.09522691, -0.6561333, 4.489961, 0, 0.7843137, 1, 1,
0.09672947, -1.235208, 3.738696, 0, 0.7764706, 1, 1,
0.09900946, 0.6073169, -1.646106, 0, 0.772549, 1, 1,
0.1040818, 0.8471721, -0.0460288, 0, 0.7647059, 1, 1,
0.1044108, -1.210647, 3.412297, 0, 0.7607843, 1, 1,
0.1062017, 0.432766, 0.6539694, 0, 0.7529412, 1, 1,
0.1068218, 0.5512755, 0.107696, 0, 0.7490196, 1, 1,
0.1086467, 0.4927281, -0.9170103, 0, 0.7411765, 1, 1,
0.1100653, -0.4225124, 2.750415, 0, 0.7372549, 1, 1,
0.1115046, 0.902445, 0.2978385, 0, 0.7294118, 1, 1,
0.1161797, 1.358906, -0.3530841, 0, 0.7254902, 1, 1,
0.1177588, 0.5895511, -0.8394269, 0, 0.7176471, 1, 1,
0.1199703, -0.9112507, 0.7616501, 0, 0.7137255, 1, 1,
0.1201029, -1.64123, 3.01867, 0, 0.7058824, 1, 1,
0.1226738, -0.1849579, 3.057178, 0, 0.6980392, 1, 1,
0.1232133, -0.4840267, 1.487871, 0, 0.6941177, 1, 1,
0.1306792, -0.6914648, 2.380324, 0, 0.6862745, 1, 1,
0.1327543, -1.575864, 1.729461, 0, 0.682353, 1, 1,
0.1327852, -0.7829443, 3.018757, 0, 0.6745098, 1, 1,
0.1351219, -0.480452, 2.250311, 0, 0.6705883, 1, 1,
0.1373089, -2.070856, 4.50377, 0, 0.6627451, 1, 1,
0.1375952, 1.180799, 0.9045832, 0, 0.6588235, 1, 1,
0.1400352, -1.055751, 3.072379, 0, 0.6509804, 1, 1,
0.1437525, 1.291509, 0.3989481, 0, 0.6470588, 1, 1,
0.1461939, 0.5482492, 1.994645, 0, 0.6392157, 1, 1,
0.1497435, -0.3330035, 1.598327, 0, 0.6352941, 1, 1,
0.1535905, -1.912882, 1.822017, 0, 0.627451, 1, 1,
0.154646, 0.8881068, 0.5646067, 0, 0.6235294, 1, 1,
0.156713, -0.1239609, 2.570503, 0, 0.6156863, 1, 1,
0.1583575, -0.5327892, 3.921152, 0, 0.6117647, 1, 1,
0.159725, -0.7456493, 1.604445, 0, 0.6039216, 1, 1,
0.1602474, -0.2957098, 2.020909, 0, 0.5960785, 1, 1,
0.1636293, 0.1362995, 2.412066, 0, 0.5921569, 1, 1,
0.1665209, 0.07117645, 0.6013754, 0, 0.5843138, 1, 1,
0.1678339, -0.2444791, 1.619139, 0, 0.5803922, 1, 1,
0.1681045, 0.5970149, -1.464782, 0, 0.572549, 1, 1,
0.1738381, 1.616064, 0.7417369, 0, 0.5686275, 1, 1,
0.1751117, -0.17202, -0.1933099, 0, 0.5607843, 1, 1,
0.1809651, -1.148825, 2.938185, 0, 0.5568628, 1, 1,
0.1814196, 1.399009, 1.487679, 0, 0.5490196, 1, 1,
0.1818847, 1.950532, -0.6806586, 0, 0.5450981, 1, 1,
0.1839466, -0.03904797, 2.375448, 0, 0.5372549, 1, 1,
0.1860337, -2.210662, 3.560369, 0, 0.5333334, 1, 1,
0.1886403, 0.629059, -0.1384145, 0, 0.5254902, 1, 1,
0.1899727, 1.986858, -0.6622295, 0, 0.5215687, 1, 1,
0.1905226, -0.06125307, 0.8368159, 0, 0.5137255, 1, 1,
0.1916778, 0.5213076, 1.150666, 0, 0.509804, 1, 1,
0.2020167, 0.8916054, -0.3683153, 0, 0.5019608, 1, 1,
0.2047122, 0.6782082, -1.722431, 0, 0.4941176, 1, 1,
0.2047234, 0.3121369, 2.4561, 0, 0.4901961, 1, 1,
0.204986, -0.6640215, 0.5145791, 0, 0.4823529, 1, 1,
0.2060198, 1.077089, 0.755559, 0, 0.4784314, 1, 1,
0.2101925, -0.04358963, 3.4478, 0, 0.4705882, 1, 1,
0.2102711, 0.4995117, -0.07883754, 0, 0.4666667, 1, 1,
0.2133568, -0.5925096, 2.42999, 0, 0.4588235, 1, 1,
0.2157177, 1.505784, -1.326023, 0, 0.454902, 1, 1,
0.2161472, -0.3939063, 3.476523, 0, 0.4470588, 1, 1,
0.2217916, 1.090957, 0.1219062, 0, 0.4431373, 1, 1,
0.2266514, -0.248656, 4.649255, 0, 0.4352941, 1, 1,
0.2305682, -1.443061, 3.267437, 0, 0.4313726, 1, 1,
0.23126, -0.2606691, 3.230539, 0, 0.4235294, 1, 1,
0.2339154, 1.853131, -1.136147, 0, 0.4196078, 1, 1,
0.2345444, 0.1841806, 1.332327, 0, 0.4117647, 1, 1,
0.2351716, 1.242887, -0.230881, 0, 0.4078431, 1, 1,
0.2409854, -0.2950345, 4.505875, 0, 0.4, 1, 1,
0.2436975, 0.2728747, 3.790854, 0, 0.3921569, 1, 1,
0.244954, 1.194891, -0.1247958, 0, 0.3882353, 1, 1,
0.2461531, 0.006581028, 1.488092, 0, 0.3803922, 1, 1,
0.247017, -1.887713, 4.744056, 0, 0.3764706, 1, 1,
0.2487937, -0.1492872, 0.7399602, 0, 0.3686275, 1, 1,
0.2488265, 1.529142, 0.9192547, 0, 0.3647059, 1, 1,
0.2491101, 1.530207, 0.4972492, 0, 0.3568628, 1, 1,
0.2494702, -0.6897742, 3.433725, 0, 0.3529412, 1, 1,
0.2500083, 0.8841157, 0.6267032, 0, 0.345098, 1, 1,
0.2502837, -1.63281, 2.298004, 0, 0.3411765, 1, 1,
0.2513205, 0.2353075, 0.8024625, 0, 0.3333333, 1, 1,
0.2514039, 0.7531126, 1.569978, 0, 0.3294118, 1, 1,
0.2519633, -0.66719, 1.058519, 0, 0.3215686, 1, 1,
0.259713, 0.8270199, 0.1145552, 0, 0.3176471, 1, 1,
0.2614956, 0.5767836, -0.1309085, 0, 0.3098039, 1, 1,
0.2636874, -0.4839501, 2.735275, 0, 0.3058824, 1, 1,
0.2663887, -1.416443, 3.59331, 0, 0.2980392, 1, 1,
0.2682508, -1.002651, 1.547864, 0, 0.2901961, 1, 1,
0.2722053, -1.145598, 2.927661, 0, 0.2862745, 1, 1,
0.2725084, 0.8885504, 0.3320393, 0, 0.2784314, 1, 1,
0.2740808, -0.2899013, 2.085996, 0, 0.2745098, 1, 1,
0.2810474, -0.1469068, -0.1638773, 0, 0.2666667, 1, 1,
0.2819741, 1.133512, 1.058261, 0, 0.2627451, 1, 1,
0.2828616, 0.3726046, 0.8917702, 0, 0.254902, 1, 1,
0.2848055, -0.7339596, 2.947723, 0, 0.2509804, 1, 1,
0.2866938, 0.00441936, 1.476221, 0, 0.2431373, 1, 1,
0.2867405, 1.907542, -2.252411, 0, 0.2392157, 1, 1,
0.2868385, -1.463018, 3.906337, 0, 0.2313726, 1, 1,
0.288433, 1.893814, -1.505386, 0, 0.227451, 1, 1,
0.2906963, 0.06189455, -0.877138, 0, 0.2196078, 1, 1,
0.2984778, 0.5648543, 1.133427, 0, 0.2156863, 1, 1,
0.3017659, 0.9842511, 0.5834105, 0, 0.2078431, 1, 1,
0.3040194, 0.6675068, -0.5339039, 0, 0.2039216, 1, 1,
0.3055649, -0.7931802, 4.600461, 0, 0.1960784, 1, 1,
0.3064098, 0.7296401, 2.367346, 0, 0.1882353, 1, 1,
0.3119431, 0.4715774, 1.098203, 0, 0.1843137, 1, 1,
0.317389, -1.034256, 3.500947, 0, 0.1764706, 1, 1,
0.3182008, -1.020717, 1.981802, 0, 0.172549, 1, 1,
0.3205933, -1.465028, 2.825552, 0, 0.1647059, 1, 1,
0.3231555, 0.6839675, 2.98903, 0, 0.1607843, 1, 1,
0.3269595, 0.4599547, 0.2463115, 0, 0.1529412, 1, 1,
0.3286825, -1.109478, 4.520398, 0, 0.1490196, 1, 1,
0.3288812, -0.08446141, 1.282919, 0, 0.1411765, 1, 1,
0.3292554, 1.718669, 1.262128, 0, 0.1372549, 1, 1,
0.3294089, -0.2372547, 0.9833334, 0, 0.1294118, 1, 1,
0.3340223, -1.03779, 2.286007, 0, 0.1254902, 1, 1,
0.3411908, -0.2955936, 2.560847, 0, 0.1176471, 1, 1,
0.341695, 0.5718592, 2.697063, 0, 0.1137255, 1, 1,
0.3425645, -0.3216113, 2.72252, 0, 0.1058824, 1, 1,
0.3469459, -1.01778, 2.689166, 0, 0.09803922, 1, 1,
0.3485759, -0.2533961, 1.98429, 0, 0.09411765, 1, 1,
0.3497679, -0.4058902, 1.37623, 0, 0.08627451, 1, 1,
0.351994, 0.5139142, 1.545172, 0, 0.08235294, 1, 1,
0.3597569, 1.681638, -0.08739147, 0, 0.07450981, 1, 1,
0.3600497, 0.7633151, 1.167841, 0, 0.07058824, 1, 1,
0.360108, 2.96928, 0.5735365, 0, 0.0627451, 1, 1,
0.3630022, 0.7760497, -1.397292, 0, 0.05882353, 1, 1,
0.3648173, -0.4929839, 4.917531, 0, 0.05098039, 1, 1,
0.364957, -1.884991, 1.073001, 0, 0.04705882, 1, 1,
0.3652038, -0.4377384, 2.620624, 0, 0.03921569, 1, 1,
0.3676212, 1.270516, 0.5788689, 0, 0.03529412, 1, 1,
0.3746873, 0.9011176, -0.727041, 0, 0.02745098, 1, 1,
0.3804943, -1.000173, 2.960794, 0, 0.02352941, 1, 1,
0.3913386, 0.7514955, 0.8829573, 0, 0.01568628, 1, 1,
0.3928152, 0.6305834, 0.9876128, 0, 0.01176471, 1, 1,
0.3952015, -0.455783, 1.422029, 0, 0.003921569, 1, 1,
0.3966266, -1.16641, 1.08855, 0.003921569, 0, 1, 1,
0.3985346, -0.8298633, 2.8306, 0.007843138, 0, 1, 1,
0.4027498, 0.7091361, 1.369446, 0.01568628, 0, 1, 1,
0.4070993, -0.299881, 1.411975, 0.01960784, 0, 1, 1,
0.4082325, 0.2251978, -0.03749459, 0.02745098, 0, 1, 1,
0.4087166, 1.312934, 0.2491847, 0.03137255, 0, 1, 1,
0.4100994, -0.158524, 1.458121, 0.03921569, 0, 1, 1,
0.4109962, 0.4534795, 0.7084793, 0.04313726, 0, 1, 1,
0.4125635, -1.724986, 2.218911, 0.05098039, 0, 1, 1,
0.4170102, 0.2518808, 0.7870044, 0.05490196, 0, 1, 1,
0.4183315, -0.08817554, -1.403349, 0.0627451, 0, 1, 1,
0.4189892, 1.049214, 1.756549, 0.06666667, 0, 1, 1,
0.4193345, 0.6862487, -0.6980642, 0.07450981, 0, 1, 1,
0.4300929, 0.4499479, -0.06669763, 0.07843138, 0, 1, 1,
0.4309016, -0.08976696, 1.81746, 0.08627451, 0, 1, 1,
0.4338099, 0.12501, 2.123365, 0.09019608, 0, 1, 1,
0.4347165, 1.579505, 1.46599, 0.09803922, 0, 1, 1,
0.43574, -0.09413557, 1.89054, 0.1058824, 0, 1, 1,
0.4373186, 0.4769586, 2.120541, 0.1098039, 0, 1, 1,
0.4375601, 0.1724558, 0.8998667, 0.1176471, 0, 1, 1,
0.4381429, 0.3508129, -0.3403599, 0.1215686, 0, 1, 1,
0.4381837, 0.7540648, 2.648739, 0.1294118, 0, 1, 1,
0.4394902, 1.764226, -0.1409151, 0.1333333, 0, 1, 1,
0.446193, 0.4650013, 2.105625, 0.1411765, 0, 1, 1,
0.4464459, -1.482259, 1.027033, 0.145098, 0, 1, 1,
0.4494851, 0.9752806, 1.556543, 0.1529412, 0, 1, 1,
0.4496759, -1.242585, 2.530044, 0.1568628, 0, 1, 1,
0.4498145, -0.8188279, 2.60439, 0.1647059, 0, 1, 1,
0.4508731, 0.8832037, 1.939495, 0.1686275, 0, 1, 1,
0.4574178, 0.3569179, 1.56597, 0.1764706, 0, 1, 1,
0.4599983, 0.1139362, 2.20124, 0.1803922, 0, 1, 1,
0.4685295, -0.734764, 2.874411, 0.1882353, 0, 1, 1,
0.4731113, -1.299701, 2.762586, 0.1921569, 0, 1, 1,
0.4740767, -1.207506, 3.778768, 0.2, 0, 1, 1,
0.4769954, 0.6411656, 0.8555222, 0.2078431, 0, 1, 1,
0.4939852, 1.370361, 0.3320598, 0.2117647, 0, 1, 1,
0.4986896, -0.6016206, 3.603122, 0.2196078, 0, 1, 1,
0.5007156, -1.25679, 1.956508, 0.2235294, 0, 1, 1,
0.5018041, 1.488881, -2.257545, 0.2313726, 0, 1, 1,
0.5051175, -0.34947, 2.210951, 0.2352941, 0, 1, 1,
0.5052957, -1.180214, 3.133133, 0.2431373, 0, 1, 1,
0.5075661, 2.621221, 0.6015647, 0.2470588, 0, 1, 1,
0.5109783, 1.044268, -1.306993, 0.254902, 0, 1, 1,
0.51287, -0.3137403, 1.482597, 0.2588235, 0, 1, 1,
0.5172031, -1.100995, 2.743416, 0.2666667, 0, 1, 1,
0.5249659, -0.4958223, 2.678879, 0.2705882, 0, 1, 1,
0.5365228, 1.344033, 1.189189, 0.2784314, 0, 1, 1,
0.5471125, 0.1897762, 1.708292, 0.282353, 0, 1, 1,
0.5474924, -1.041223, 3.558976, 0.2901961, 0, 1, 1,
0.5558398, 1.271687, -0.8963436, 0.2941177, 0, 1, 1,
0.5564719, 0.03611323, 0.3671822, 0.3019608, 0, 1, 1,
0.5625562, -0.7005391, 2.143348, 0.3098039, 0, 1, 1,
0.5642018, -0.321001, 1.752004, 0.3137255, 0, 1, 1,
0.5685806, -0.8177499, 3.263132, 0.3215686, 0, 1, 1,
0.5702456, -1.06645, 2.254102, 0.3254902, 0, 1, 1,
0.5765774, -0.2501813, 1.262848, 0.3333333, 0, 1, 1,
0.5775262, -0.413685, 0.6896213, 0.3372549, 0, 1, 1,
0.5781229, -0.5872038, 0.3105432, 0.345098, 0, 1, 1,
0.582874, 0.6264334, 1.658474, 0.3490196, 0, 1, 1,
0.5832552, 1.215607, 1.263589, 0.3568628, 0, 1, 1,
0.5909473, 0.9147744, 1.478668, 0.3607843, 0, 1, 1,
0.5935398, 1.08178, 0.2429582, 0.3686275, 0, 1, 1,
0.5938891, -0.4969321, 1.413718, 0.372549, 0, 1, 1,
0.5955109, 0.5255483, 1.473617, 0.3803922, 0, 1, 1,
0.6004366, 0.02090765, 1.752129, 0.3843137, 0, 1, 1,
0.60274, -0.4070387, 2.07752, 0.3921569, 0, 1, 1,
0.6097955, -0.9018352, 2.836227, 0.3960784, 0, 1, 1,
0.6115907, 0.1615868, 2.237959, 0.4039216, 0, 1, 1,
0.6117129, 1.758598, 0.8679039, 0.4117647, 0, 1, 1,
0.6117913, 0.1382545, 0.3366924, 0.4156863, 0, 1, 1,
0.613883, 0.5022306, 0.2867091, 0.4235294, 0, 1, 1,
0.6148127, -0.2762606, 0.7920991, 0.427451, 0, 1, 1,
0.6198506, 0.2011528, 3.551757, 0.4352941, 0, 1, 1,
0.6200031, 0.7305565, 1.36169, 0.4392157, 0, 1, 1,
0.6256807, -1.439792, 3.366694, 0.4470588, 0, 1, 1,
0.633408, -0.2613149, 1.02627, 0.4509804, 0, 1, 1,
0.6352029, -1.09871, 5.227658, 0.4588235, 0, 1, 1,
0.6370718, 0.8254134, 2.019486, 0.4627451, 0, 1, 1,
0.6407954, 1.230824, -0.3617136, 0.4705882, 0, 1, 1,
0.6413228, 0.6005574, 0.9147421, 0.4745098, 0, 1, 1,
0.6421242, -2.221401, 2.929213, 0.4823529, 0, 1, 1,
0.6457962, -0.7358936, 3.102277, 0.4862745, 0, 1, 1,
0.6461861, 0.3554323, 0.5234913, 0.4941176, 0, 1, 1,
0.6474811, 1.284992, 2.151953, 0.5019608, 0, 1, 1,
0.6541992, -0.8584982, 2.842285, 0.5058824, 0, 1, 1,
0.6545022, 0.5865453, 0.520615, 0.5137255, 0, 1, 1,
0.6557346, 1.030041, 1.211194, 0.5176471, 0, 1, 1,
0.6562353, -0.2623139, 1.245285, 0.5254902, 0, 1, 1,
0.6593332, 1.397784, 0.4964488, 0.5294118, 0, 1, 1,
0.6609039, -1.162088, 2.927543, 0.5372549, 0, 1, 1,
0.6611535, 0.589491, 0.3013115, 0.5411765, 0, 1, 1,
0.6658548, 0.3098995, 2.115913, 0.5490196, 0, 1, 1,
0.6668022, 0.06382004, 3.256442, 0.5529412, 0, 1, 1,
0.667616, -0.8142611, 2.363889, 0.5607843, 0, 1, 1,
0.6773421, -1.436518, 1.502081, 0.5647059, 0, 1, 1,
0.6826805, 0.7967611, 1.121751, 0.572549, 0, 1, 1,
0.6833551, 1.61732, -0.624589, 0.5764706, 0, 1, 1,
0.6868819, 0.3083578, 3.407531, 0.5843138, 0, 1, 1,
0.6895165, -1.079051, 3.774385, 0.5882353, 0, 1, 1,
0.689746, -0.4226389, 1.97053, 0.5960785, 0, 1, 1,
0.6935797, 1.40711, 0.4016656, 0.6039216, 0, 1, 1,
0.69444, -0.8869256, 2.3708, 0.6078432, 0, 1, 1,
0.6993145, -1.002167, 3.857232, 0.6156863, 0, 1, 1,
0.7006015, 1.433977, 0.220306, 0.6196079, 0, 1, 1,
0.7021674, -0.5812982, 0.409146, 0.627451, 0, 1, 1,
0.7117733, -0.04014817, 1.381001, 0.6313726, 0, 1, 1,
0.7168443, -1.81028, 5.041514, 0.6392157, 0, 1, 1,
0.71719, 0.563484, 1.209842, 0.6431373, 0, 1, 1,
0.7184283, -0.6139966, 2.680295, 0.6509804, 0, 1, 1,
0.7186004, 1.017416, 0.2281535, 0.654902, 0, 1, 1,
0.7191758, -2.504621, 4.177643, 0.6627451, 0, 1, 1,
0.7203266, -1.077034, 2.082879, 0.6666667, 0, 1, 1,
0.7210563, 0.7533105, 1.261299, 0.6745098, 0, 1, 1,
0.7367855, -1.239564, 3.806201, 0.6784314, 0, 1, 1,
0.7369916, -0.887802, 2.354467, 0.6862745, 0, 1, 1,
0.7402077, 0.7192749, 0.9502504, 0.6901961, 0, 1, 1,
0.740735, 1.12315, -0.03516352, 0.6980392, 0, 1, 1,
0.7434748, 0.5335083, -0.2632891, 0.7058824, 0, 1, 1,
0.7452051, -0.7576755, 0.4997312, 0.7098039, 0, 1, 1,
0.7457979, 0.2900541, 1.08213, 0.7176471, 0, 1, 1,
0.7488812, 1.006794, 1.115174, 0.7215686, 0, 1, 1,
0.7618461, -1.152955, 2.49262, 0.7294118, 0, 1, 1,
0.7618576, -0.5409899, 1.891685, 0.7333333, 0, 1, 1,
0.7641522, -1.715212, 2.894395, 0.7411765, 0, 1, 1,
0.7659046, 1.004714, 0.5235398, 0.7450981, 0, 1, 1,
0.7681364, 1.105093, 0.9439736, 0.7529412, 0, 1, 1,
0.7699787, -0.1573897, 2.696162, 0.7568628, 0, 1, 1,
0.7823813, 0.9459833, 2.303992, 0.7647059, 0, 1, 1,
0.7846051, 0.7632294, -0.1317866, 0.7686275, 0, 1, 1,
0.7882328, -1.768211, 2.23197, 0.7764706, 0, 1, 1,
0.7913802, -0.6606817, 2.057107, 0.7803922, 0, 1, 1,
0.7950662, -0.5139298, 0.4605725, 0.7882353, 0, 1, 1,
0.7963969, -1.43194, 3.05133, 0.7921569, 0, 1, 1,
0.7977411, -2.53275, -0.3601476, 0.8, 0, 1, 1,
0.7982472, 0.7841518, 0.6794679, 0.8078431, 0, 1, 1,
0.8047311, 0.2036541, 1.769918, 0.8117647, 0, 1, 1,
0.808115, -1.339809, 2.360542, 0.8196079, 0, 1, 1,
0.8141851, 0.174716, 1.144385, 0.8235294, 0, 1, 1,
0.8147612, -0.5808197, 1.793749, 0.8313726, 0, 1, 1,
0.8183527, -0.2837096, 3.018947, 0.8352941, 0, 1, 1,
0.824439, 1.679902, 0.2778456, 0.8431373, 0, 1, 1,
0.8246847, -0.392056, 3.106191, 0.8470588, 0, 1, 1,
0.8247396, -1.39274, 3.528687, 0.854902, 0, 1, 1,
0.8278027, 0.6945423, 1.160296, 0.8588235, 0, 1, 1,
0.8322167, -1.015725, 4.064339, 0.8666667, 0, 1, 1,
0.8347893, -0.01900645, 3.802473, 0.8705882, 0, 1, 1,
0.8354409, 0.05956519, 0.9632525, 0.8784314, 0, 1, 1,
0.8429782, 1.047657, -0.3025459, 0.8823529, 0, 1, 1,
0.8545613, 0.9078766, 0.3723193, 0.8901961, 0, 1, 1,
0.8558447, -0.8452836, 2.593627, 0.8941177, 0, 1, 1,
0.8602827, -0.2973683, 1.723438, 0.9019608, 0, 1, 1,
0.8603193, 1.104241, -0.3639451, 0.9098039, 0, 1, 1,
0.8640369, 1.677471, 0.4628794, 0.9137255, 0, 1, 1,
0.865369, -1.497988, 4.29634, 0.9215686, 0, 1, 1,
0.8656488, -0.2864451, 3.043591, 0.9254902, 0, 1, 1,
0.8657596, 0.2876281, 2.91608, 0.9333333, 0, 1, 1,
0.8686633, 0.00461586, 2.248516, 0.9372549, 0, 1, 1,
0.8702962, 2.578107, 0.5214253, 0.945098, 0, 1, 1,
0.8717033, 1.260564, 1.205085, 0.9490196, 0, 1, 1,
0.8788994, 0.2632934, 2.21145, 0.9568627, 0, 1, 1,
0.8847576, -1.002858, 0.7871503, 0.9607843, 0, 1, 1,
0.889676, -1.252224, 1.679863, 0.9686275, 0, 1, 1,
0.8935078, -1.006131, 2.359005, 0.972549, 0, 1, 1,
0.9011553, 0.07524098, 1.648896, 0.9803922, 0, 1, 1,
0.9085931, 1.699882, 0.4638294, 0.9843137, 0, 1, 1,
0.9116327, 0.8599105, -0.7467653, 0.9921569, 0, 1, 1,
0.915205, 0.7540463, 1.478834, 0.9960784, 0, 1, 1,
0.9168061, 0.5457487, 1.788616, 1, 0, 0.9960784, 1,
0.9170327, -1.27706, 3.26177, 1, 0, 0.9882353, 1,
0.9176847, -1.276992, 2.621293, 1, 0, 0.9843137, 1,
0.9183505, -0.6525825, -0.4483949, 1, 0, 0.9764706, 1,
0.9295765, -0.07692663, 1.62264, 1, 0, 0.972549, 1,
0.9352967, 0.0600548, -0.307494, 1, 0, 0.9647059, 1,
0.9365043, -0.111438, 2.311072, 1, 0, 0.9607843, 1,
0.9398652, -0.1710792, 1.52199, 1, 0, 0.9529412, 1,
0.944105, 0.2768269, 0.2857869, 1, 0, 0.9490196, 1,
0.945269, 0.274253, 1.036583, 1, 0, 0.9411765, 1,
0.9473854, -0.04113417, 3.211977, 1, 0, 0.9372549, 1,
0.9482512, -0.6513149, 2.674573, 1, 0, 0.9294118, 1,
0.9496014, -0.3556978, 1.311411, 1, 0, 0.9254902, 1,
0.9603369, 0.1951553, 2.873749, 1, 0, 0.9176471, 1,
0.9606041, -0.06289557, 0.6667838, 1, 0, 0.9137255, 1,
0.9632723, -1.679674, 1.919253, 1, 0, 0.9058824, 1,
0.9651194, 0.901082, 0.9609601, 1, 0, 0.9019608, 1,
0.9734812, -0.1031464, 0.8201748, 1, 0, 0.8941177, 1,
0.9796004, -0.1377493, 2.529732, 1, 0, 0.8862745, 1,
0.9796346, 1.493928, 2.273358, 1, 0, 0.8823529, 1,
0.9890353, 0.1859379, 1.663252, 1, 0, 0.8745098, 1,
0.9910116, 1.582879, -2.56831, 1, 0, 0.8705882, 1,
0.9952111, -0.6557367, 1.287618, 1, 0, 0.8627451, 1,
1.002782, 0.1332448, 1.691633, 1, 0, 0.8588235, 1,
1.004647, -0.8738648, 2.787533, 1, 0, 0.8509804, 1,
1.010038, -0.4945004, 2.975322, 1, 0, 0.8470588, 1,
1.011934, -0.3472636, 2.331591, 1, 0, 0.8392157, 1,
1.012244, -0.7361258, 2.657147, 1, 0, 0.8352941, 1,
1.014918, 0.009739056, 2.530962, 1, 0, 0.827451, 1,
1.029732, 0.2473317, 2.297573, 1, 0, 0.8235294, 1,
1.033622, -0.1083652, 2.629135, 1, 0, 0.8156863, 1,
1.034075, 0.5823742, 0.8222698, 1, 0, 0.8117647, 1,
1.034291, -1.130549, 4.144775, 1, 0, 0.8039216, 1,
1.036136, 1.134951, 0.9677563, 1, 0, 0.7960784, 1,
1.039652, -0.5582973, 2.621298, 1, 0, 0.7921569, 1,
1.04638, -0.6728949, 3.007705, 1, 0, 0.7843137, 1,
1.047457, -0.05697021, 2.372352, 1, 0, 0.7803922, 1,
1.050695, -0.6660336, 1.982878, 1, 0, 0.772549, 1,
1.056777, -0.2272832, 2.693526, 1, 0, 0.7686275, 1,
1.060699, 0.07934368, 1.09988, 1, 0, 0.7607843, 1,
1.063993, 0.9209751, -1.810598, 1, 0, 0.7568628, 1,
1.065995, 0.4917681, -0.593918, 1, 0, 0.7490196, 1,
1.071255, 0.3362937, 0.2568703, 1, 0, 0.7450981, 1,
1.072452, -1.022278, 1.529236, 1, 0, 0.7372549, 1,
1.073736, 1.180453, 2.033054, 1, 0, 0.7333333, 1,
1.075721, -0.7969593, 0.4614045, 1, 0, 0.7254902, 1,
1.086634, -0.7045797, 3.055823, 1, 0, 0.7215686, 1,
1.086803, -2.835803, 2.575228, 1, 0, 0.7137255, 1,
1.092049, -0.6044903, 1.53787, 1, 0, 0.7098039, 1,
1.104588, 1.135638, 2.178702, 1, 0, 0.7019608, 1,
1.11118, -0.1940487, 2.723795, 1, 0, 0.6941177, 1,
1.111694, -0.06578867, 1.788422, 1, 0, 0.6901961, 1,
1.111918, -0.2859589, 0.8800215, 1, 0, 0.682353, 1,
1.115072, -0.6887454, 2.279448, 1, 0, 0.6784314, 1,
1.117572, 0.413717, 1.766391, 1, 0, 0.6705883, 1,
1.127631, 0.8684744, -0.5986339, 1, 0, 0.6666667, 1,
1.146203, 1.334867, 0.05534559, 1, 0, 0.6588235, 1,
1.147794, 0.3485469, 0.2385248, 1, 0, 0.654902, 1,
1.149021, 0.2079659, 0.4397638, 1, 0, 0.6470588, 1,
1.15845, 0.3819095, 0.1040005, 1, 0, 0.6431373, 1,
1.16028, -1.590432, 2.89835, 1, 0, 0.6352941, 1,
1.166617, 0.9543259, -0.566174, 1, 0, 0.6313726, 1,
1.167157, 0.3931578, 0.3962062, 1, 0, 0.6235294, 1,
1.170005, -0.9082642, 1.147974, 1, 0, 0.6196079, 1,
1.170204, -0.3370911, 0.6131116, 1, 0, 0.6117647, 1,
1.189442, -0.3430986, 0.9088112, 1, 0, 0.6078432, 1,
1.19025, -1.611336, 2.361166, 1, 0, 0.6, 1,
1.198652, -0.001225245, -0.002799264, 1, 0, 0.5921569, 1,
1.199687, 0.09364417, 3.332892, 1, 0, 0.5882353, 1,
1.200993, 0.1739626, 1.186143, 1, 0, 0.5803922, 1,
1.206458, 1.189308, 0.4294567, 1, 0, 0.5764706, 1,
1.226717, -1.226443, 2.707251, 1, 0, 0.5686275, 1,
1.230767, 0.08969523, 0.5298203, 1, 0, 0.5647059, 1,
1.232987, -0.003311499, -0.1798586, 1, 0, 0.5568628, 1,
1.244876, 1.181076, 2.287409, 1, 0, 0.5529412, 1,
1.251025, -0.258758, 2.095217, 1, 0, 0.5450981, 1,
1.253429, -1.843024, 5.008048, 1, 0, 0.5411765, 1,
1.25924, 1.430095, -0.4674807, 1, 0, 0.5333334, 1,
1.26013, 0.6118215, 1.316442, 1, 0, 0.5294118, 1,
1.273257, -2.003833, 1.043365, 1, 0, 0.5215687, 1,
1.286595, 0.3903339, 1.021584, 1, 0, 0.5176471, 1,
1.293142, -2.471676, 2.762054, 1, 0, 0.509804, 1,
1.325102, 1.612264, 0.1264025, 1, 0, 0.5058824, 1,
1.333309, 0.6053277, 1.486186, 1, 0, 0.4980392, 1,
1.335071, 0.08825205, 2.000377, 1, 0, 0.4901961, 1,
1.335608, -0.8028979, 1.843917, 1, 0, 0.4862745, 1,
1.339119, 0.04774781, 0.7004226, 1, 0, 0.4784314, 1,
1.339733, -1.087453, 2.53622, 1, 0, 0.4745098, 1,
1.340367, 0.5307478, 1.193099, 1, 0, 0.4666667, 1,
1.356991, -1.555663, 1.478327, 1, 0, 0.4627451, 1,
1.36848, -2.93679, 2.583483, 1, 0, 0.454902, 1,
1.376149, 0.9619872, 1.450135, 1, 0, 0.4509804, 1,
1.399325, -0.7238541, 2.812832, 1, 0, 0.4431373, 1,
1.405869, 1.903597, 1.291173, 1, 0, 0.4392157, 1,
1.4091, -0.1178461, 1.38623, 1, 0, 0.4313726, 1,
1.414639, -0.2051495, 1.298613, 1, 0, 0.427451, 1,
1.415281, -1.062598, 2.7746, 1, 0, 0.4196078, 1,
1.415319, 1.068503, 0.5658866, 1, 0, 0.4156863, 1,
1.421588, -1.210393, 2.397941, 1, 0, 0.4078431, 1,
1.431738, 0.06717031, 0.522983, 1, 0, 0.4039216, 1,
1.443098, -0.2527926, 1.238617, 1, 0, 0.3960784, 1,
1.445037, 0.2652339, 1.457861, 1, 0, 0.3882353, 1,
1.445402, -1.215493, 2.942007, 1, 0, 0.3843137, 1,
1.451906, -1.422462, 1.416952, 1, 0, 0.3764706, 1,
1.45314, 1.123238, 3.213611, 1, 0, 0.372549, 1,
1.457425, -2.227501, 3.173739, 1, 0, 0.3647059, 1,
1.45832, -2.004928, 4.535504, 1, 0, 0.3607843, 1,
1.466112, -0.04071856, 2.20037, 1, 0, 0.3529412, 1,
1.467396, -0.9596973, 2.618224, 1, 0, 0.3490196, 1,
1.477355, 0.05208403, 0.7071145, 1, 0, 0.3411765, 1,
1.484565, 0.9574412, 1.121482, 1, 0, 0.3372549, 1,
1.489507, 0.1753015, 0.8531288, 1, 0, 0.3294118, 1,
1.518415, -0.8034143, 4.318832, 1, 0, 0.3254902, 1,
1.522948, -0.2270282, 1.435229, 1, 0, 0.3176471, 1,
1.529897, 1.432519, 1.76193, 1, 0, 0.3137255, 1,
1.531784, -0.3333665, 1.917322, 1, 0, 0.3058824, 1,
1.541737, -1.402195, 0.9159312, 1, 0, 0.2980392, 1,
1.548441, 1.299173, -1.110243, 1, 0, 0.2941177, 1,
1.554943, 0.4789342, 2.254146, 1, 0, 0.2862745, 1,
1.555058, 0.7105927, -0.4212012, 1, 0, 0.282353, 1,
1.569996, -1.574331, 1.649831, 1, 0, 0.2745098, 1,
1.570633, -0.5739978, 0.6966372, 1, 0, 0.2705882, 1,
1.572787, -0.525611, 1.158111, 1, 0, 0.2627451, 1,
1.574414, 0.1742934, 0.7646142, 1, 0, 0.2588235, 1,
1.57843, -0.149832, 2.220227, 1, 0, 0.2509804, 1,
1.592954, 0.9231795, -0.1088231, 1, 0, 0.2470588, 1,
1.606278, -0.2031311, 1.557451, 1, 0, 0.2392157, 1,
1.612209, 0.3084705, 0.9978595, 1, 0, 0.2352941, 1,
1.628756, -1.352892, 2.900443, 1, 0, 0.227451, 1,
1.638548, 0.348497, 0.5403091, 1, 0, 0.2235294, 1,
1.648561, 0.1018588, 2.421736, 1, 0, 0.2156863, 1,
1.659594, 0.6953617, 2.558814, 1, 0, 0.2117647, 1,
1.666828, -1.045326, 1.974519, 1, 0, 0.2039216, 1,
1.673699, -0.7789236, 1.025003, 1, 0, 0.1960784, 1,
1.69028, 1.545373, -0.03040613, 1, 0, 0.1921569, 1,
1.715057, 1.655297, 1.264164, 1, 0, 0.1843137, 1,
1.803302, 2.054761, 0.7777621, 1, 0, 0.1803922, 1,
1.884074, 0.02177208, 2.108276, 1, 0, 0.172549, 1,
1.904969, -1.136021, -0.7081733, 1, 0, 0.1686275, 1,
1.907656, -1.788327, 2.061344, 1, 0, 0.1607843, 1,
1.910731, 2.137347, -0.6138194, 1, 0, 0.1568628, 1,
1.910751, -2.221203, 2.826283, 1, 0, 0.1490196, 1,
1.935886, 0.3822035, 2.058765, 1, 0, 0.145098, 1,
1.963186, 0.2214797, 4.649294, 1, 0, 0.1372549, 1,
1.981383, -1.238583, 3.332649, 1, 0, 0.1333333, 1,
1.982447, 0.4135802, 0.6803854, 1, 0, 0.1254902, 1,
1.984178, -0.6764678, 2.579978, 1, 0, 0.1215686, 1,
1.986054, 0.2263627, 1.653674, 1, 0, 0.1137255, 1,
2.027152, 0.5932043, 1.755791, 1, 0, 0.1098039, 1,
2.06003, 0.1874642, 1.635221, 1, 0, 0.1019608, 1,
2.090022, -0.1209322, 1.116376, 1, 0, 0.09411765, 1,
2.132847, -0.1642555, 1.371956, 1, 0, 0.09019608, 1,
2.167387, -1.367485, 2.117593, 1, 0, 0.08235294, 1,
2.167515, 0.4032301, 1.507725, 1, 0, 0.07843138, 1,
2.203967, -0.3373538, 1.06123, 1, 0, 0.07058824, 1,
2.225117, -0.004480405, -0.4832489, 1, 0, 0.06666667, 1,
2.276594, -0.6625006, 2.478284, 1, 0, 0.05882353, 1,
2.346381, -1.014787, 2.609072, 1, 0, 0.05490196, 1,
2.392072, -0.8333399, 1.941125, 1, 0, 0.04705882, 1,
2.477855, -0.1324367, 0.6610389, 1, 0, 0.04313726, 1,
2.526212, -0.2786212, 1.928306, 1, 0, 0.03529412, 1,
2.5492, -0.3131962, 2.327889, 1, 0, 0.03137255, 1,
2.661133, 0.07183993, 3.372406, 1, 0, 0.02352941, 1,
2.904877, -1.015456, 1.310273, 1, 0, 0.01960784, 1,
2.906372, 1.157638, 3.335603, 1, 0, 0.01176471, 1,
3.374807, 0.5218822, 1.402959, 1, 0, 0.007843138, 1
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
0.05144238, -4.508883, -7.474396, 0, -0.5, 0.5, 0.5,
0.05144238, -4.508883, -7.474396, 1, -0.5, 0.5, 0.5,
0.05144238, -4.508883, -7.474396, 1, 1.5, 0.5, 0.5,
0.05144238, -4.508883, -7.474396, 0, 1.5, 0.5, 0.5
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
-4.398543, -0.07148504, -7.474396, 0, -0.5, 0.5, 0.5,
-4.398543, -0.07148504, -7.474396, 1, -0.5, 0.5, 0.5,
-4.398543, -0.07148504, -7.474396, 1, 1.5, 0.5, 0.5,
-4.398543, -0.07148504, -7.474396, 0, 1.5, 0.5, 0.5
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
-4.398543, -4.508883, -0.1329327, 0, -0.5, 0.5, 0.5,
-4.398543, -4.508883, -0.1329327, 1, -0.5, 0.5, 0.5,
-4.398543, -4.508883, -0.1329327, 1, 1.5, 0.5, 0.5,
-4.398543, -4.508883, -0.1329327, 0, 1.5, 0.5, 0.5
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
-3, -3.484868, -5.780212,
3, -3.484868, -5.780212,
-3, -3.484868, -5.780212,
-3, -3.655538, -6.062576,
-2, -3.484868, -5.780212,
-2, -3.655538, -6.062576,
-1, -3.484868, -5.780212,
-1, -3.655538, -6.062576,
0, -3.484868, -5.780212,
0, -3.655538, -6.062576,
1, -3.484868, -5.780212,
1, -3.655538, -6.062576,
2, -3.484868, -5.780212,
2, -3.655538, -6.062576,
3, -3.484868, -5.780212,
3, -3.655538, -6.062576
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
-3, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
-3, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
-3, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
-3, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
-2, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
-2, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
-2, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
-2, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
-1, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
-1, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
-1, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
-1, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
0, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
0, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
0, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
0, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
1, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
1, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
1, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
1, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
2, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
2, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
2, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
2, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5,
3, -3.996876, -6.627304, 0, -0.5, 0.5, 0.5,
3, -3.996876, -6.627304, 1, -0.5, 0.5, 0.5,
3, -3.996876, -6.627304, 1, 1.5, 0.5, 0.5,
3, -3.996876, -6.627304, 0, 1.5, 0.5, 0.5
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
-3.371623, -3, -5.780212,
-3.371623, 3, -5.780212,
-3.371623, -3, -5.780212,
-3.542777, -3, -6.062576,
-3.371623, -2, -5.780212,
-3.542777, -2, -6.062576,
-3.371623, -1, -5.780212,
-3.542777, -1, -6.062576,
-3.371623, 0, -5.780212,
-3.542777, 0, -6.062576,
-3.371623, 1, -5.780212,
-3.542777, 1, -6.062576,
-3.371623, 2, -5.780212,
-3.542777, 2, -6.062576,
-3.371623, 3, -5.780212,
-3.542777, 3, -6.062576
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
-3.885083, -3, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, -3, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, -3, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, -3, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, -2, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, -2, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, -2, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, -2, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, -1, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, -1, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, -1, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, -1, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, 0, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, 0, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, 0, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, 0, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, 1, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, 1, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, 1, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, 1, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, 2, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, 2, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, 2, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, 2, -6.627304, 0, 1.5, 0.5, 0.5,
-3.885083, 3, -6.627304, 0, -0.5, 0.5, 0.5,
-3.885083, 3, -6.627304, 1, -0.5, 0.5, 0.5,
-3.885083, 3, -6.627304, 1, 1.5, 0.5, 0.5,
-3.885083, 3, -6.627304, 0, 1.5, 0.5, 0.5
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
-3.371623, -3.484868, -4,
-3.371623, -3.484868, 4,
-3.371623, -3.484868, -4,
-3.542777, -3.655538, -4,
-3.371623, -3.484868, -2,
-3.542777, -3.655538, -2,
-3.371623, -3.484868, 0,
-3.542777, -3.655538, 0,
-3.371623, -3.484868, 2,
-3.542777, -3.655538, 2,
-3.371623, -3.484868, 4,
-3.542777, -3.655538, 4
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
-3.885083, -3.996876, -4, 0, -0.5, 0.5, 0.5,
-3.885083, -3.996876, -4, 1, -0.5, 0.5, 0.5,
-3.885083, -3.996876, -4, 1, 1.5, 0.5, 0.5,
-3.885083, -3.996876, -4, 0, 1.5, 0.5, 0.5,
-3.885083, -3.996876, -2, 0, -0.5, 0.5, 0.5,
-3.885083, -3.996876, -2, 1, -0.5, 0.5, 0.5,
-3.885083, -3.996876, -2, 1, 1.5, 0.5, 0.5,
-3.885083, -3.996876, -2, 0, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 0, 0, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 0, 1, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 0, 1, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 0, 0, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 2, 0, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 2, 1, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 2, 1, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 2, 0, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 4, 0, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 4, 1, -0.5, 0.5, 0.5,
-3.885083, -3.996876, 4, 1, 1.5, 0.5, 0.5,
-3.885083, -3.996876, 4, 0, 1.5, 0.5, 0.5
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
-3.371623, -3.484868, -5.780212,
-3.371623, 3.341898, -5.780212,
-3.371623, -3.484868, 5.514347,
-3.371623, 3.341898, 5.514347,
-3.371623, -3.484868, -5.780212,
-3.371623, -3.484868, 5.514347,
-3.371623, 3.341898, -5.780212,
-3.371623, 3.341898, 5.514347,
-3.371623, -3.484868, -5.780212,
3.474508, -3.484868, -5.780212,
-3.371623, -3.484868, 5.514347,
3.474508, -3.484868, 5.514347,
-3.371623, 3.341898, -5.780212,
3.474508, 3.341898, -5.780212,
-3.371623, 3.341898, 5.514347,
3.474508, 3.341898, 5.514347,
3.474508, -3.484868, -5.780212,
3.474508, 3.341898, -5.780212,
3.474508, -3.484868, 5.514347,
3.474508, 3.341898, 5.514347,
3.474508, -3.484868, -5.780212,
3.474508, -3.484868, 5.514347,
3.474508, 3.341898, -5.780212,
3.474508, 3.341898, 5.514347
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
var radius = 7.938934;
var distance = 35.32121;
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
mvMatrix.translate( -0.05144238, 0.07148504, 0.1329327 );
mvMatrix.scale( 1.253808, 1.257364, 0.7599881 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32121);
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


