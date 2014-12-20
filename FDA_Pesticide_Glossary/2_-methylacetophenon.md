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
-3.199931, 1.315387, -0.09792305, 1, 0, 0, 1,
-3.094911, 0.304212, -1.465724, 1, 0.007843138, 0, 1,
-3.014276, -0.6423951, -1.829363, 1, 0.01176471, 0, 1,
-2.987619, -0.5058935, -2.683652, 1, 0.01960784, 0, 1,
-2.924725, 0.2107503, -0.2359619, 1, 0.02352941, 0, 1,
-2.857646, 0.9109588, -0.6247125, 1, 0.03137255, 0, 1,
-2.776264, 0.7821372, -1.046475, 1, 0.03529412, 0, 1,
-2.72934, 0.4162797, -1.557913, 1, 0.04313726, 0, 1,
-2.673227, -0.4097199, -1.918712, 1, 0.04705882, 0, 1,
-2.656582, -1.086141, -2.949597, 1, 0.05490196, 0, 1,
-2.592678, 0.445878, -0.857972, 1, 0.05882353, 0, 1,
-2.576063, 0.7609907, -0.9972494, 1, 0.06666667, 0, 1,
-2.545734, 1.788627, -0.449889, 1, 0.07058824, 0, 1,
-2.476777, -1.045289, -1.470793, 1, 0.07843138, 0, 1,
-2.414682, -0.6917887, -3.482337, 1, 0.08235294, 0, 1,
-2.301043, -0.07693341, -2.39192, 1, 0.09019608, 0, 1,
-2.293389, 0.1773366, -1.743502, 1, 0.09411765, 0, 1,
-2.206964, 2.747071, -1.995845, 1, 0.1019608, 0, 1,
-2.202985, 1.040109, -2.218328, 1, 0.1098039, 0, 1,
-2.167885, -1.327131, -1.401452, 1, 0.1137255, 0, 1,
-2.151311, -2.278219, -1.773908, 1, 0.1215686, 0, 1,
-2.129665, -1.566562, -2.833024, 1, 0.1254902, 0, 1,
-2.081578, 0.9688692, -1.308563, 1, 0.1333333, 0, 1,
-2.056542, -0.3736325, -2.168846, 1, 0.1372549, 0, 1,
-2.00655, -1.303416, -2.906178, 1, 0.145098, 0, 1,
-2.006197, -0.3795041, -2.483629, 1, 0.1490196, 0, 1,
-1.941909, -0.156506, -0.8216532, 1, 0.1568628, 0, 1,
-1.931437, -1.201638, -1.232541, 1, 0.1607843, 0, 1,
-1.920533, -0.8806266, -2.585672, 1, 0.1686275, 0, 1,
-1.918355, -0.8038362, -1.415839, 1, 0.172549, 0, 1,
-1.896395, 1.65282, -0.4939255, 1, 0.1803922, 0, 1,
-1.886192, -0.7087593, -0.5952909, 1, 0.1843137, 0, 1,
-1.869987, 1.02038, -1.297668, 1, 0.1921569, 0, 1,
-1.869549, -1.058265, -1.444897, 1, 0.1960784, 0, 1,
-1.859971, -0.2035341, -1.343284, 1, 0.2039216, 0, 1,
-1.851282, -0.7825881, -2.256595, 1, 0.2117647, 0, 1,
-1.851198, 0.6750708, -0.6469451, 1, 0.2156863, 0, 1,
-1.844493, -0.5154206, -3.242655, 1, 0.2235294, 0, 1,
-1.842449, 0.7604724, -0.2805306, 1, 0.227451, 0, 1,
-1.84142, -0.495057, -0.3397405, 1, 0.2352941, 0, 1,
-1.833867, -1.642637, -4.049444, 1, 0.2392157, 0, 1,
-1.824857, -0.1941738, -2.107751, 1, 0.2470588, 0, 1,
-1.824225, 1.661193, -0.6870943, 1, 0.2509804, 0, 1,
-1.822932, -0.7392993, -3.312138, 1, 0.2588235, 0, 1,
-1.797418, -0.06540425, -1.822557, 1, 0.2627451, 0, 1,
-1.769389, -0.4150069, -4.303545, 1, 0.2705882, 0, 1,
-1.743057, 1.001032, -0.204995, 1, 0.2745098, 0, 1,
-1.734383, -0.9592546, -1.843792, 1, 0.282353, 0, 1,
-1.719475, 0.4541337, -0.04511594, 1, 0.2862745, 0, 1,
-1.713387, 0.135968, -2.609462, 1, 0.2941177, 0, 1,
-1.71331, -0.3386582, -3.076562, 1, 0.3019608, 0, 1,
-1.713216, -0.3786643, -1.613203, 1, 0.3058824, 0, 1,
-1.701042, -1.826694, -1.675564, 1, 0.3137255, 0, 1,
-1.672623, 0.4237445, -1.896233, 1, 0.3176471, 0, 1,
-1.657958, 1.715316, 0.4615951, 1, 0.3254902, 0, 1,
-1.64755, 0.6335125, -0.170132, 1, 0.3294118, 0, 1,
-1.637949, 1.771734, 0.05888753, 1, 0.3372549, 0, 1,
-1.625266, -0.7012652, -1.14597, 1, 0.3411765, 0, 1,
-1.624522, 0.1735778, -2.575893, 1, 0.3490196, 0, 1,
-1.608132, 1.615599, -0.003546403, 1, 0.3529412, 0, 1,
-1.56996, 0.5400551, 0.3074682, 1, 0.3607843, 0, 1,
-1.569139, 0.05716242, -0.1123881, 1, 0.3647059, 0, 1,
-1.56362, -0.7646126, -0.3371516, 1, 0.372549, 0, 1,
-1.562694, 0.4873437, 0.0002002674, 1, 0.3764706, 0, 1,
-1.555834, 0.2242471, -1.76541, 1, 0.3843137, 0, 1,
-1.554356, -1.312953, -3.773988, 1, 0.3882353, 0, 1,
-1.539087, 0.02922702, -2.057115, 1, 0.3960784, 0, 1,
-1.522587, -1.219542, -2.327335, 1, 0.4039216, 0, 1,
-1.515858, -1.121462, -4.521835, 1, 0.4078431, 0, 1,
-1.512518, -0.6599201, -0.2837383, 1, 0.4156863, 0, 1,
-1.509025, 2.631844, -3.068538, 1, 0.4196078, 0, 1,
-1.508787, -1.007928, -2.380467, 1, 0.427451, 0, 1,
-1.502995, 0.5628673, -1.16425, 1, 0.4313726, 0, 1,
-1.498643, 1.137489, -1.296672, 1, 0.4392157, 0, 1,
-1.494799, -0.1359375, -1.624173, 1, 0.4431373, 0, 1,
-1.491665, 0.6155298, -1.485078, 1, 0.4509804, 0, 1,
-1.491639, 1.901005, 0.1044643, 1, 0.454902, 0, 1,
-1.487589, -1.313637, -1.049903, 1, 0.4627451, 0, 1,
-1.477226, -1.22064, -0.5506085, 1, 0.4666667, 0, 1,
-1.474215, -0.4750517, -2.166951, 1, 0.4745098, 0, 1,
-1.473224, 0.8949394, -0.760838, 1, 0.4784314, 0, 1,
-1.472387, -0.95382, -2.89299, 1, 0.4862745, 0, 1,
-1.468507, 0.5016192, -1.255482, 1, 0.4901961, 0, 1,
-1.464752, -0.4276343, -1.832736, 1, 0.4980392, 0, 1,
-1.459545, 1.222383, -0.8434865, 1, 0.5058824, 0, 1,
-1.451271, -1.030519, -3.423935, 1, 0.509804, 0, 1,
-1.447554, 0.6755717, -0.5253575, 1, 0.5176471, 0, 1,
-1.431685, 0.3445507, -0.9660091, 1, 0.5215687, 0, 1,
-1.424872, -1.775063, -1.806662, 1, 0.5294118, 0, 1,
-1.422355, -0.01076663, -3.48104, 1, 0.5333334, 0, 1,
-1.418562, 1.209266, -0.9612874, 1, 0.5411765, 0, 1,
-1.418437, -0.7719843, -2.132012, 1, 0.5450981, 0, 1,
-1.40941, -0.01725718, -1.238079, 1, 0.5529412, 0, 1,
-1.408874, -1.509661, -3.657979, 1, 0.5568628, 0, 1,
-1.401295, -2.196584, -1.965341, 1, 0.5647059, 0, 1,
-1.394652, -1.256612, -3.716936, 1, 0.5686275, 0, 1,
-1.391681, -1.37156, -2.120203, 1, 0.5764706, 0, 1,
-1.383874, 0.4091546, -1.672222, 1, 0.5803922, 0, 1,
-1.363158, 1.745917, -0.3508288, 1, 0.5882353, 0, 1,
-1.360665, 0.3624282, -1.273405, 1, 0.5921569, 0, 1,
-1.358449, 0.5211554, 0.612753, 1, 0.6, 0, 1,
-1.327577, -1.118803, -4.408463, 1, 0.6078432, 0, 1,
-1.326829, -0.06973618, -1.556201, 1, 0.6117647, 0, 1,
-1.326688, -0.1087353, -0.787696, 1, 0.6196079, 0, 1,
-1.32262, 0.5084426, -1.677113, 1, 0.6235294, 0, 1,
-1.320038, 1.566371, -1.647374, 1, 0.6313726, 0, 1,
-1.319914, 0.549651, -3.618808, 1, 0.6352941, 0, 1,
-1.30598, -0.6833404, -3.305526, 1, 0.6431373, 0, 1,
-1.303792, 0.1110867, -1.15813, 1, 0.6470588, 0, 1,
-1.292175, -0.3885612, -1.336195, 1, 0.654902, 0, 1,
-1.286033, 1.442869, -0.2840921, 1, 0.6588235, 0, 1,
-1.282531, 1.033351, -0.07293402, 1, 0.6666667, 0, 1,
-1.279413, -0.3085528, -1.710849, 1, 0.6705883, 0, 1,
-1.274915, 0.1685683, -2.072141, 1, 0.6784314, 0, 1,
-1.272975, -1.884665, -2.433509, 1, 0.682353, 0, 1,
-1.270133, 0.8063185, -0.4467578, 1, 0.6901961, 0, 1,
-1.260817, -1.139687, -4.264008, 1, 0.6941177, 0, 1,
-1.25009, 0.07498009, -1.475824, 1, 0.7019608, 0, 1,
-1.249105, -0.1568527, -2.37422, 1, 0.7098039, 0, 1,
-1.244275, -1.137973, -2.305032, 1, 0.7137255, 0, 1,
-1.239156, -0.2655137, -1.487427, 1, 0.7215686, 0, 1,
-1.238815, 1.054898, -1.966766, 1, 0.7254902, 0, 1,
-1.232767, 0.4153445, 0.9150916, 1, 0.7333333, 0, 1,
-1.227295, -0.311021, -2.790602, 1, 0.7372549, 0, 1,
-1.22566, 0.5025952, -2.842729, 1, 0.7450981, 0, 1,
-1.222256, -0.4557773, -0.4908864, 1, 0.7490196, 0, 1,
-1.209916, -0.104413, -2.437701, 1, 0.7568628, 0, 1,
-1.207134, -1.079629, -2.095098, 1, 0.7607843, 0, 1,
-1.201076, -0.9837978, -2.501111, 1, 0.7686275, 0, 1,
-1.19654, -1.255849, -1.475265, 1, 0.772549, 0, 1,
-1.191889, 0.09625544, -1.118409, 1, 0.7803922, 0, 1,
-1.168667, -1.286221, -2.830115, 1, 0.7843137, 0, 1,
-1.151793, 2.79096, -1.164038, 1, 0.7921569, 0, 1,
-1.130942, -1.195503, -4.101636, 1, 0.7960784, 0, 1,
-1.130484, 1.405562, 0.455491, 1, 0.8039216, 0, 1,
-1.129526, -0.9923314, -3.256985, 1, 0.8117647, 0, 1,
-1.128937, -0.9651631, -3.380566, 1, 0.8156863, 0, 1,
-1.123234, 1.028465, 0.7297011, 1, 0.8235294, 0, 1,
-1.116033, 0.8068876, -0.5779985, 1, 0.827451, 0, 1,
-1.114062, 0.6389664, -0.565202, 1, 0.8352941, 0, 1,
-1.112222, -0.02702396, -1.965721, 1, 0.8392157, 0, 1,
-1.111774, 0.1826283, -1.347726, 1, 0.8470588, 0, 1,
-1.103781, 1.177922, -1.109467, 1, 0.8509804, 0, 1,
-1.099159, 0.8601082, 0.0004024656, 1, 0.8588235, 0, 1,
-1.093704, -1.498884, -2.779386, 1, 0.8627451, 0, 1,
-1.093541, 1.274079, -0.6638765, 1, 0.8705882, 0, 1,
-1.083802, 0.6076869, -1.283342, 1, 0.8745098, 0, 1,
-1.082669, 1.476337, -0.9975985, 1, 0.8823529, 0, 1,
-1.080002, 0.9432625, 1.260281, 1, 0.8862745, 0, 1,
-1.078833, 2.038785, -0.4076251, 1, 0.8941177, 0, 1,
-1.072543, -1.760981, -1.712413, 1, 0.8980392, 0, 1,
-1.07064, -0.6058748, -2.926181, 1, 0.9058824, 0, 1,
-1.069614, 0.1894462, -0.1954696, 1, 0.9137255, 0, 1,
-1.043169, 1.225881, -1.260106, 1, 0.9176471, 0, 1,
-1.039022, 0.8516712, -1.927455, 1, 0.9254902, 0, 1,
-1.0329, 0.8198428, -1.144794, 1, 0.9294118, 0, 1,
-1.03091, -0.0248661, -1.159522, 1, 0.9372549, 0, 1,
-1.022625, 0.5226942, -1.764383, 1, 0.9411765, 0, 1,
-1.020792, -0.4983603, -1.666642, 1, 0.9490196, 0, 1,
-1.018647, -0.8266748, -2.060622, 1, 0.9529412, 0, 1,
-1.01369, 0.3679124, -3.554184, 1, 0.9607843, 0, 1,
-1.007911, 0.3526919, -0.1642449, 1, 0.9647059, 0, 1,
-1.005416, -1.624423, -2.424275, 1, 0.972549, 0, 1,
-1.004885, 0.1534098, -2.611762, 1, 0.9764706, 0, 1,
-0.999455, -0.372469, -2.241279, 1, 0.9843137, 0, 1,
-0.9937316, 1.138538, -1.577927, 1, 0.9882353, 0, 1,
-0.9919569, -1.15543, -3.594791, 1, 0.9960784, 0, 1,
-0.9792981, -1.5489, -2.63576, 0.9960784, 1, 0, 1,
-0.9692294, 0.5788106, -2.859679, 0.9921569, 1, 0, 1,
-0.9667633, -1.13132, -2.981432, 0.9843137, 1, 0, 1,
-0.9647666, -0.8535531, -1.794746, 0.9803922, 1, 0, 1,
-0.9617626, 1.282752, -0.3546877, 0.972549, 1, 0, 1,
-0.9564218, 0.1156511, -1.903754, 0.9686275, 1, 0, 1,
-0.9518806, -0.8443754, -0.5838141, 0.9607843, 1, 0, 1,
-0.9413654, -0.05467688, -1.814016, 0.9568627, 1, 0, 1,
-0.9371741, 0.1002197, -0.5313281, 0.9490196, 1, 0, 1,
-0.9358027, 2.026761, -1.156131, 0.945098, 1, 0, 1,
-0.9277136, -0.2342083, -1.497581, 0.9372549, 1, 0, 1,
-0.9262217, 0.9151377, -2.761875, 0.9333333, 1, 0, 1,
-0.9258291, -0.2118732, -0.4591051, 0.9254902, 1, 0, 1,
-0.9181112, -0.4514555, -1.892879, 0.9215686, 1, 0, 1,
-0.9158913, -1.692557, -3.326272, 0.9137255, 1, 0, 1,
-0.913463, 0.3634965, -0.2884429, 0.9098039, 1, 0, 1,
-0.9087592, -0.32482, -2.090573, 0.9019608, 1, 0, 1,
-0.9019247, -0.1424336, -2.280967, 0.8941177, 1, 0, 1,
-0.9003137, 1.326362, -1.175918, 0.8901961, 1, 0, 1,
-0.9001033, -0.6634127, -2.915688, 0.8823529, 1, 0, 1,
-0.8959774, -1.286574, -1.696447, 0.8784314, 1, 0, 1,
-0.8947167, 0.2247346, -0.0629212, 0.8705882, 1, 0, 1,
-0.8916326, 0.419327, -0.7197336, 0.8666667, 1, 0, 1,
-0.8907779, -0.03680506, -2.554162, 0.8588235, 1, 0, 1,
-0.8888291, -1.159653, -2.501226, 0.854902, 1, 0, 1,
-0.8851269, 0.03942787, -1.151048, 0.8470588, 1, 0, 1,
-0.8839365, 0.860871, 0.8775474, 0.8431373, 1, 0, 1,
-0.8775496, 0.293257, -2.443388, 0.8352941, 1, 0, 1,
-0.872727, -0.06779453, -0.8549571, 0.8313726, 1, 0, 1,
-0.872023, -0.8315656, -2.70425, 0.8235294, 1, 0, 1,
-0.8632935, -0.2234378, -1.785798, 0.8196079, 1, 0, 1,
-0.8622634, 1.070276, -0.6506352, 0.8117647, 1, 0, 1,
-0.8565107, -1.841287, -2.165569, 0.8078431, 1, 0, 1,
-0.8542337, 0.3804811, 0.6568024, 0.8, 1, 0, 1,
-0.8527664, 1.067372, -2.183882, 0.7921569, 1, 0, 1,
-0.8517885, 1.477572, -1.578558, 0.7882353, 1, 0, 1,
-0.8511634, 0.6881152, -0.1518709, 0.7803922, 1, 0, 1,
-0.8483594, 1.214765, -0.9207717, 0.7764706, 1, 0, 1,
-0.8389747, -0.166557, -1.902316, 0.7686275, 1, 0, 1,
-0.8380641, -2.473402, -2.745237, 0.7647059, 1, 0, 1,
-0.8343461, 0.4251182, -2.543382, 0.7568628, 1, 0, 1,
-0.8295519, 0.1329993, -2.51751, 0.7529412, 1, 0, 1,
-0.8287659, -0.3906269, -2.98579, 0.7450981, 1, 0, 1,
-0.8263614, 1.344743, -1.522837, 0.7411765, 1, 0, 1,
-0.822533, -0.1424065, -1.255315, 0.7333333, 1, 0, 1,
-0.8162029, 0.07302167, -3.377237, 0.7294118, 1, 0, 1,
-0.8119532, -1.678438, -0.7396387, 0.7215686, 1, 0, 1,
-0.8110323, -0.718592, -2.420584, 0.7176471, 1, 0, 1,
-0.8101857, 0.4824225, -0.795648, 0.7098039, 1, 0, 1,
-0.8060641, -0.7602458, -3.662384, 0.7058824, 1, 0, 1,
-0.8037902, -0.4421388, -2.293311, 0.6980392, 1, 0, 1,
-0.8003681, -0.2694844, -1.122872, 0.6901961, 1, 0, 1,
-0.7966219, 0.9987289, -1.032256, 0.6862745, 1, 0, 1,
-0.7960656, -0.5090817, -2.521812, 0.6784314, 1, 0, 1,
-0.7933393, 1.722571, 0.03695248, 0.6745098, 1, 0, 1,
-0.7895588, 0.06995116, -1.767245, 0.6666667, 1, 0, 1,
-0.7865493, -0.03332957, -2.314237, 0.6627451, 1, 0, 1,
-0.7844856, -2.14781, -3.032709, 0.654902, 1, 0, 1,
-0.7809578, -0.4071762, -2.242801, 0.6509804, 1, 0, 1,
-0.7790395, -1.266754, -1.862588, 0.6431373, 1, 0, 1,
-0.7756821, 0.8895712, -0.8608043, 0.6392157, 1, 0, 1,
-0.7709998, -1.550417, -1.052018, 0.6313726, 1, 0, 1,
-0.7579169, 0.4964799, -0.1823265, 0.627451, 1, 0, 1,
-0.7543328, 0.4519824, -2.015775, 0.6196079, 1, 0, 1,
-0.7538508, -1.155841, -3.099868, 0.6156863, 1, 0, 1,
-0.7514905, 0.2765276, -0.6217912, 0.6078432, 1, 0, 1,
-0.7506043, 0.25185, -2.306354, 0.6039216, 1, 0, 1,
-0.7495696, -1.262026, -1.90554, 0.5960785, 1, 0, 1,
-0.7416481, -1.216692, -3.384119, 0.5882353, 1, 0, 1,
-0.7406612, -0.9599364, -2.466571, 0.5843138, 1, 0, 1,
-0.7386978, -1.311007, -1.791309, 0.5764706, 1, 0, 1,
-0.7366592, 0.2205538, -0.7290984, 0.572549, 1, 0, 1,
-0.7364756, 1.569515, 0.9673823, 0.5647059, 1, 0, 1,
-0.730845, -2.114455, -4.635209, 0.5607843, 1, 0, 1,
-0.7260143, -0.7373451, -2.550127, 0.5529412, 1, 0, 1,
-0.7178852, 0.9995614, 0.163538, 0.5490196, 1, 0, 1,
-0.7147785, 1.12137, -1.07148, 0.5411765, 1, 0, 1,
-0.707164, -0.1007844, -1.25342, 0.5372549, 1, 0, 1,
-0.7060308, 0.7975504, 0.5545766, 0.5294118, 1, 0, 1,
-0.696171, -0.08184857, -2.572353, 0.5254902, 1, 0, 1,
-0.6924027, 2.084585, -0.7658663, 0.5176471, 1, 0, 1,
-0.690865, 0.2135421, -0.3361467, 0.5137255, 1, 0, 1,
-0.6888174, 1.330069, -2.282087, 0.5058824, 1, 0, 1,
-0.6887313, -0.9504573, -0.1146148, 0.5019608, 1, 0, 1,
-0.685951, -1.120813, -2.710331, 0.4941176, 1, 0, 1,
-0.6857662, 0.02854115, -1.815575, 0.4862745, 1, 0, 1,
-0.6798961, -0.3206459, -1.081338, 0.4823529, 1, 0, 1,
-0.6730025, 1.819098, -0.2704391, 0.4745098, 1, 0, 1,
-0.6715875, 0.2919333, -2.525206, 0.4705882, 1, 0, 1,
-0.6676596, 1.405716, 0.3014235, 0.4627451, 1, 0, 1,
-0.6656048, 0.04809148, -2.030855, 0.4588235, 1, 0, 1,
-0.6652743, 1.243337, -0.4531799, 0.4509804, 1, 0, 1,
-0.6650265, 1.526319, -0.5602886, 0.4470588, 1, 0, 1,
-0.6630415, -2.113267, -2.794764, 0.4392157, 1, 0, 1,
-0.6554425, -0.03114486, -1.868198, 0.4352941, 1, 0, 1,
-0.6519227, -1.134516, -1.590388, 0.427451, 1, 0, 1,
-0.6470041, -0.1597263, -1.759562, 0.4235294, 1, 0, 1,
-0.6415332, 1.422168, -0.4943165, 0.4156863, 1, 0, 1,
-0.6367459, 0.3628598, -1.080852, 0.4117647, 1, 0, 1,
-0.6348833, -0.2823384, -2.948426, 0.4039216, 1, 0, 1,
-0.6339214, -0.2860026, -1.826156, 0.3960784, 1, 0, 1,
-0.6331092, -1.38063, -3.042077, 0.3921569, 1, 0, 1,
-0.6274821, 1.846661, 0.9338468, 0.3843137, 1, 0, 1,
-0.6233199, 0.2342328, -1.574597, 0.3803922, 1, 0, 1,
-0.622098, -0.2150494, -0.3399964, 0.372549, 1, 0, 1,
-0.6190949, 1.651437, -0.1512779, 0.3686275, 1, 0, 1,
-0.6185739, 0.1734559, -0.08435832, 0.3607843, 1, 0, 1,
-0.6122375, 0.437027, 0.2792456, 0.3568628, 1, 0, 1,
-0.6119437, -0.6260942, -0.8591896, 0.3490196, 1, 0, 1,
-0.6113646, 0.5968721, -1.734078, 0.345098, 1, 0, 1,
-0.6052629, 0.5204023, -0.5075868, 0.3372549, 1, 0, 1,
-0.6032763, 1.574845, -0.3569387, 0.3333333, 1, 0, 1,
-0.5980844, 0.9929464, -0.9986189, 0.3254902, 1, 0, 1,
-0.5946133, 0.3504687, -0.2249678, 0.3215686, 1, 0, 1,
-0.5940393, -1.05812, -2.809563, 0.3137255, 1, 0, 1,
-0.5911496, -2.018726, -3.759747, 0.3098039, 1, 0, 1,
-0.5895615, -1.799865, -3.027074, 0.3019608, 1, 0, 1,
-0.5784743, -0.6827941, -1.157321, 0.2941177, 1, 0, 1,
-0.5765568, 1.008389, 0.2061799, 0.2901961, 1, 0, 1,
-0.5707397, -1.141942, -1.460748, 0.282353, 1, 0, 1,
-0.5595943, -0.837393, -2.970692, 0.2784314, 1, 0, 1,
-0.5566756, -0.7438828, -4.790646, 0.2705882, 1, 0, 1,
-0.5548028, -1.82672, -2.411269, 0.2666667, 1, 0, 1,
-0.5524054, 0.4701498, -0.8698198, 0.2588235, 1, 0, 1,
-0.5480765, 0.3549618, -0.7611197, 0.254902, 1, 0, 1,
-0.5416943, 0.8468977, -0.9451724, 0.2470588, 1, 0, 1,
-0.5392242, 0.5500185, -1.566128, 0.2431373, 1, 0, 1,
-0.5390328, -1.987767, -3.321955, 0.2352941, 1, 0, 1,
-0.5384076, -1.720915, -3.296121, 0.2313726, 1, 0, 1,
-0.5369502, -1.238265, -3.87144, 0.2235294, 1, 0, 1,
-0.5337667, 2.837885, -0.8330793, 0.2196078, 1, 0, 1,
-0.5323292, -1.647754, -3.181934, 0.2117647, 1, 0, 1,
-0.5261865, 0.5240245, -0.3716171, 0.2078431, 1, 0, 1,
-0.5215691, -0.9719858, -1.389412, 0.2, 1, 0, 1,
-0.5200226, 0.5233704, -0.6582969, 0.1921569, 1, 0, 1,
-0.518757, 1.290266, 0.4110624, 0.1882353, 1, 0, 1,
-0.5169908, 0.3196551, -1.498706, 0.1803922, 1, 0, 1,
-0.5147489, 0.1329546, -1.074793, 0.1764706, 1, 0, 1,
-0.5123599, -0.3420644, -2.251212, 0.1686275, 1, 0, 1,
-0.505098, -1.24042, -2.685405, 0.1647059, 1, 0, 1,
-0.5044052, 0.9474584, -0.9826667, 0.1568628, 1, 0, 1,
-0.5008261, 0.4470621, -0.3890977, 0.1529412, 1, 0, 1,
-0.4990816, 0.7455932, -0.1799545, 0.145098, 1, 0, 1,
-0.4909153, 1.554414, -0.5735204, 0.1411765, 1, 0, 1,
-0.4877363, 0.397813, -3.285626, 0.1333333, 1, 0, 1,
-0.4844502, 0.676092, -2.159562, 0.1294118, 1, 0, 1,
-0.4799927, 2.00337, -0.7719379, 0.1215686, 1, 0, 1,
-0.4793508, -1.245997, -2.053747, 0.1176471, 1, 0, 1,
-0.4782327, -0.9828566, -4.924215, 0.1098039, 1, 0, 1,
-0.475001, 1.077555, -0.09041485, 0.1058824, 1, 0, 1,
-0.4746554, -1.792272, -3.061148, 0.09803922, 1, 0, 1,
-0.473348, 0.2681005, -2.206718, 0.09019608, 1, 0, 1,
-0.4723372, -0.3157264, -3.271703, 0.08627451, 1, 0, 1,
-0.4715851, -0.1311554, -0.6462324, 0.07843138, 1, 0, 1,
-0.4664051, 0.9432557, 2.240791, 0.07450981, 1, 0, 1,
-0.4576159, -1.770071, -2.758656, 0.06666667, 1, 0, 1,
-0.4571399, 0.2192054, -2.695807, 0.0627451, 1, 0, 1,
-0.4513195, -0.1137344, -1.098435, 0.05490196, 1, 0, 1,
-0.4470171, -1.218214, -2.771704, 0.05098039, 1, 0, 1,
-0.4426004, 1.072057, -0.5690328, 0.04313726, 1, 0, 1,
-0.4417712, 0.703512, -0.6767398, 0.03921569, 1, 0, 1,
-0.438295, 1.067121, -0.3537129, 0.03137255, 1, 0, 1,
-0.4359422, 0.7886531, -1.276928, 0.02745098, 1, 0, 1,
-0.4320263, 0.3052302, -0.6220768, 0.01960784, 1, 0, 1,
-0.428419, -0.5891549, -1.642456, 0.01568628, 1, 0, 1,
-0.424649, 1.398968, 0.1591279, 0.007843138, 1, 0, 1,
-0.4242559, 2.294136, -0.759883, 0.003921569, 1, 0, 1,
-0.4236778, 0.7003613, 0.3667364, 0, 1, 0.003921569, 1,
-0.4198426, 0.03097913, -2.314818, 0, 1, 0.01176471, 1,
-0.4187914, 0.4875562, -1.282806, 0, 1, 0.01568628, 1,
-0.4177716, -0.3071549, -2.636901, 0, 1, 0.02352941, 1,
-0.4167991, -0.1439107, -2.077159, 0, 1, 0.02745098, 1,
-0.4138471, -0.235376, -2.410221, 0, 1, 0.03529412, 1,
-0.4135569, 0.6347385, -1.27473, 0, 1, 0.03921569, 1,
-0.4133763, -0.06176227, -1.370494, 0, 1, 0.04705882, 1,
-0.4117726, 0.3935823, -1.119311, 0, 1, 0.05098039, 1,
-0.4106359, -0.7869902, -0.6392376, 0, 1, 0.05882353, 1,
-0.3972672, 0.3672672, -0.2696534, 0, 1, 0.0627451, 1,
-0.3962213, -0.6440592, -3.340542, 0, 1, 0.07058824, 1,
-0.393966, 0.8460571, -0.05838838, 0, 1, 0.07450981, 1,
-0.3939239, -0.7637719, -3.017015, 0, 1, 0.08235294, 1,
-0.3919836, -0.5369684, -2.486521, 0, 1, 0.08627451, 1,
-0.391268, -0.09578215, -3.401491, 0, 1, 0.09411765, 1,
-0.3827494, -0.6185784, -2.043086, 0, 1, 0.1019608, 1,
-0.3792813, 0.1099658, -1.702702, 0, 1, 0.1058824, 1,
-0.3738722, -1.164281, -2.149493, 0, 1, 0.1137255, 1,
-0.3735765, 0.01900609, -2.465257, 0, 1, 0.1176471, 1,
-0.3730193, 1.210588, -1.284177, 0, 1, 0.1254902, 1,
-0.371996, 1.637744, 1.790107, 0, 1, 0.1294118, 1,
-0.3677523, 0.3841849, -0.5772671, 0, 1, 0.1372549, 1,
-0.3670935, -1.234361, -1.807172, 0, 1, 0.1411765, 1,
-0.3659671, -0.8090289, -3.220658, 0, 1, 0.1490196, 1,
-0.3595894, 0.919148, -0.9723713, 0, 1, 0.1529412, 1,
-0.3563354, -0.9607964, -0.5886503, 0, 1, 0.1607843, 1,
-0.3555158, -0.09126654, -1.078248, 0, 1, 0.1647059, 1,
-0.3552032, -1.398877, -4.481254, 0, 1, 0.172549, 1,
-0.3545192, -0.06438188, -1.039268, 0, 1, 0.1764706, 1,
-0.3485847, 0.798385, -2.603979, 0, 1, 0.1843137, 1,
-0.3446246, 0.6646591, -0.359067, 0, 1, 0.1882353, 1,
-0.3423362, 0.2157121, -1.232541, 0, 1, 0.1960784, 1,
-0.3361458, -1.111629, -2.476978, 0, 1, 0.2039216, 1,
-0.3343855, -0.1422714, -2.171436, 0, 1, 0.2078431, 1,
-0.3330905, 0.2593259, -0.7534314, 0, 1, 0.2156863, 1,
-0.3328095, 1.234313, -0.7713299, 0, 1, 0.2196078, 1,
-0.3325271, -0.2713704, -1.292188, 0, 1, 0.227451, 1,
-0.3321484, -0.05211216, -0.4063988, 0, 1, 0.2313726, 1,
-0.3317093, 0.7856548, 0.5766187, 0, 1, 0.2392157, 1,
-0.3274197, -0.7933476, -3.41178, 0, 1, 0.2431373, 1,
-0.3252565, 1.056874, -0.6972794, 0, 1, 0.2509804, 1,
-0.3250361, -0.1043334, -2.050138, 0, 1, 0.254902, 1,
-0.3241382, 0.4951601, -0.896946, 0, 1, 0.2627451, 1,
-0.3233357, -2.230471, -4.7386, 0, 1, 0.2666667, 1,
-0.3201591, 0.7047882, 1.442642, 0, 1, 0.2745098, 1,
-0.3172664, -0.3635701, -1.932848, 0, 1, 0.2784314, 1,
-0.3169518, 0.8028731, -0.6029783, 0, 1, 0.2862745, 1,
-0.3168673, -0.4429136, -4.501127, 0, 1, 0.2901961, 1,
-0.3166744, -0.5212897, -3.554092, 0, 1, 0.2980392, 1,
-0.3028012, 0.4842552, -0.6040913, 0, 1, 0.3058824, 1,
-0.3003482, 0.169847, -1.600919, 0, 1, 0.3098039, 1,
-0.300337, -0.6967795, -2.537049, 0, 1, 0.3176471, 1,
-0.2943228, 0.08655938, -1.033184, 0, 1, 0.3215686, 1,
-0.2885596, 1.456941, 0.9195497, 0, 1, 0.3294118, 1,
-0.2874421, -1.813382, -0.9514281, 0, 1, 0.3333333, 1,
-0.2829399, -0.2273174, -0.9849529, 0, 1, 0.3411765, 1,
-0.2826506, -1.658251, -2.416387, 0, 1, 0.345098, 1,
-0.2823259, -0.4636632, -3.45553, 0, 1, 0.3529412, 1,
-0.282021, 1.199551, 0.6973392, 0, 1, 0.3568628, 1,
-0.281227, 0.0170251, -1.922153, 0, 1, 0.3647059, 1,
-0.2796442, 0.7340598, 0.1047276, 0, 1, 0.3686275, 1,
-0.27865, 1.606572, -0.8958486, 0, 1, 0.3764706, 1,
-0.2727665, 0.272287, -0.7930216, 0, 1, 0.3803922, 1,
-0.2673672, -0.7511651, -1.683921, 0, 1, 0.3882353, 1,
-0.2609163, 0.2163775, -1.541578, 0, 1, 0.3921569, 1,
-0.2548758, 1.189317, -0.8989356, 0, 1, 0.4, 1,
-0.2537059, -0.5568235, -2.902499, 0, 1, 0.4078431, 1,
-0.2446448, 0.270082, -0.8266433, 0, 1, 0.4117647, 1,
-0.2427577, 0.7476415, -0.1358166, 0, 1, 0.4196078, 1,
-0.2379399, 1.649749, -0.8814562, 0, 1, 0.4235294, 1,
-0.2366469, -1.041595, -4.247382, 0, 1, 0.4313726, 1,
-0.2360851, 0.1782223, -0.3143032, 0, 1, 0.4352941, 1,
-0.231443, 1.446975, -1.116808, 0, 1, 0.4431373, 1,
-0.2287167, 0.8690147, -1.115913, 0, 1, 0.4470588, 1,
-0.2273668, -0.4751476, -2.228333, 0, 1, 0.454902, 1,
-0.2209459, 0.9910955, 0.4112008, 0, 1, 0.4588235, 1,
-0.2163382, -0.5405173, -5.576787, 0, 1, 0.4666667, 1,
-0.2149671, -0.4451072, -1.606008, 0, 1, 0.4705882, 1,
-0.2140543, 0.3318949, 0.7779052, 0, 1, 0.4784314, 1,
-0.2129374, 0.4821678, -3.027731, 0, 1, 0.4823529, 1,
-0.2054666, -0.6879499, -2.841902, 0, 1, 0.4901961, 1,
-0.2046839, 0.04039457, -1.509899, 0, 1, 0.4941176, 1,
-0.2022476, -1.334293, -2.115648, 0, 1, 0.5019608, 1,
-0.2016419, -0.009579864, -2.564181, 0, 1, 0.509804, 1,
-0.2007621, -0.1039183, -2.441243, 0, 1, 0.5137255, 1,
-0.1990139, 0.5255418, -0.04783993, 0, 1, 0.5215687, 1,
-0.1828756, -0.8645259, -3.032294, 0, 1, 0.5254902, 1,
-0.1758369, -1.080248, -4.963351, 0, 1, 0.5333334, 1,
-0.1757246, 0.3080722, -2.201757, 0, 1, 0.5372549, 1,
-0.1756168, 0.2222043, -0.6787784, 0, 1, 0.5450981, 1,
-0.170428, -0.5923505, -3.102618, 0, 1, 0.5490196, 1,
-0.1674009, 0.5320749, -0.3786705, 0, 1, 0.5568628, 1,
-0.1639208, -0.005848747, -1.027591, 0, 1, 0.5607843, 1,
-0.1602191, -1.034744, -2.699617, 0, 1, 0.5686275, 1,
-0.1598323, 1.328742, -0.9881047, 0, 1, 0.572549, 1,
-0.1595361, -1.964922, -3.886806, 0, 1, 0.5803922, 1,
-0.1578176, -0.7627648, -2.539702, 0, 1, 0.5843138, 1,
-0.1501402, 1.159567, 2.322762, 0, 1, 0.5921569, 1,
-0.1498748, 1.573208, 1.843904, 0, 1, 0.5960785, 1,
-0.1475493, -0.04140273, -1.356401, 0, 1, 0.6039216, 1,
-0.1449157, -1.763039, -3.71214, 0, 1, 0.6117647, 1,
-0.1432904, 0.4710857, -1.286643, 0, 1, 0.6156863, 1,
-0.1401536, -1.391371, -2.218065, 0, 1, 0.6235294, 1,
-0.132664, -0.09178584, -2.177257, 0, 1, 0.627451, 1,
-0.131273, -0.5927993, -2.854203, 0, 1, 0.6352941, 1,
-0.1311438, 0.9250011, 0.2997729, 0, 1, 0.6392157, 1,
-0.1304613, -0.5536613, -3.256904, 0, 1, 0.6470588, 1,
-0.1301465, -0.08881734, -2.478557, 0, 1, 0.6509804, 1,
-0.1301303, -0.4412348, -2.876833, 0, 1, 0.6588235, 1,
-0.1295142, 1.081726, 0.8338796, 0, 1, 0.6627451, 1,
-0.1289039, -0.7540616, -4.273732, 0, 1, 0.6705883, 1,
-0.1283622, 0.7763479, 0.7854629, 0, 1, 0.6745098, 1,
-0.1228156, 0.2500636, 0.5339279, 0, 1, 0.682353, 1,
-0.121911, -0.8593039, -2.581328, 0, 1, 0.6862745, 1,
-0.1196529, -0.364522, -1.445458, 0, 1, 0.6941177, 1,
-0.1173682, -0.7789641, -2.654881, 0, 1, 0.7019608, 1,
-0.1151512, -1.915266, -3.308974, 0, 1, 0.7058824, 1,
-0.1109664, -0.0232843, -3.356447, 0, 1, 0.7137255, 1,
-0.1098885, -1.424229, -4.454026, 0, 1, 0.7176471, 1,
-0.1091997, -0.2194569, -3.887152, 0, 1, 0.7254902, 1,
-0.09769565, 0.3549939, 0.0660107, 0, 1, 0.7294118, 1,
-0.09179541, -0.1822253, -3.03132, 0, 1, 0.7372549, 1,
-0.09160384, -0.3321774, -1.772739, 0, 1, 0.7411765, 1,
-0.08643221, -0.3513747, -1.377835, 0, 1, 0.7490196, 1,
-0.08512509, 0.1273003, -0.01425915, 0, 1, 0.7529412, 1,
-0.0812052, 1.971383, -2.114328, 0, 1, 0.7607843, 1,
-0.07897396, -2.220505, -2.327901, 0, 1, 0.7647059, 1,
-0.07894314, 1.151425, 1.272642, 0, 1, 0.772549, 1,
-0.07799767, 1.036153, -0.8384941, 0, 1, 0.7764706, 1,
-0.07717755, -2.699639, -3.933431, 0, 1, 0.7843137, 1,
-0.07058139, 0.1259119, -0.4400908, 0, 1, 0.7882353, 1,
-0.06847146, 0.7377797, 0.7116901, 0, 1, 0.7960784, 1,
-0.06598223, 0.1993563, -1.581689, 0, 1, 0.8039216, 1,
-0.05578686, 1.656864, -1.541301, 0, 1, 0.8078431, 1,
-0.05061942, 0.6655425, 0.1776235, 0, 1, 0.8156863, 1,
-0.04971354, -0.9099485, -2.794446, 0, 1, 0.8196079, 1,
-0.04913825, -0.7604861, -3.049932, 0, 1, 0.827451, 1,
-0.04793005, -1.651871, -2.410903, 0, 1, 0.8313726, 1,
-0.04358186, -1.353532, -3.809135, 0, 1, 0.8392157, 1,
-0.04120979, 0.3383025, -0.007290253, 0, 1, 0.8431373, 1,
-0.03778454, 0.9208342, 0.7618046, 0, 1, 0.8509804, 1,
-0.03681346, 1.083196, 0.8764566, 0, 1, 0.854902, 1,
-0.03678141, -0.90514, -2.408773, 0, 1, 0.8627451, 1,
-0.03507518, -0.2221289, -5.100806, 0, 1, 0.8666667, 1,
-0.02520866, -0.6653943, -3.198153, 0, 1, 0.8745098, 1,
-0.0250481, 0.1751953, -1.527456, 0, 1, 0.8784314, 1,
-0.02392877, -0.07524453, -2.907972, 0, 1, 0.8862745, 1,
-0.02207514, 0.4361974, 0.1037048, 0, 1, 0.8901961, 1,
-0.02099688, 0.8587559, 0.1759562, 0, 1, 0.8980392, 1,
-0.02070136, 0.8839452, 0.5641623, 0, 1, 0.9058824, 1,
-0.01739472, 0.4259721, 1.012446, 0, 1, 0.9098039, 1,
-0.01425624, -0.2210228, -2.83314, 0, 1, 0.9176471, 1,
-0.01303399, 0.763272, 1.31529, 0, 1, 0.9215686, 1,
-0.01299551, -0.2577652, -3.176337, 0, 1, 0.9294118, 1,
-0.01130985, 0.4925941, -0.8020967, 0, 1, 0.9333333, 1,
-0.008035781, -0.2899976, -2.855389, 0, 1, 0.9411765, 1,
0.0002600364, -0.3298333, 2.304791, 0, 1, 0.945098, 1,
0.004675761, 1.339656, 1.001829, 0, 1, 0.9529412, 1,
0.005224614, 0.3365315, 0.4121421, 0, 1, 0.9568627, 1,
0.006821727, -1.01408, 2.281119, 0, 1, 0.9647059, 1,
0.008639897, -0.3577864, 4.042335, 0, 1, 0.9686275, 1,
0.009557916, 0.6807134, -1.187428, 0, 1, 0.9764706, 1,
0.01030764, 2.254271, -1.679636, 0, 1, 0.9803922, 1,
0.01132079, -0.1659457, 4.023806, 0, 1, 0.9882353, 1,
0.0120527, 2.096666, 0.2393149, 0, 1, 0.9921569, 1,
0.01478154, 0.05897164, -0.6125523, 0, 1, 1, 1,
0.01861206, 0.06097105, -0.2159346, 0, 0.9921569, 1, 1,
0.01914982, -0.840314, 2.918272, 0, 0.9882353, 1, 1,
0.02016264, 0.6589687, -1.570925, 0, 0.9803922, 1, 1,
0.02034754, -0.8235471, 3.243104, 0, 0.9764706, 1, 1,
0.02066716, -0.1081227, 2.40495, 0, 0.9686275, 1, 1,
0.02292501, -0.628811, 2.820955, 0, 0.9647059, 1, 1,
0.0285791, 0.5624842, 1.127673, 0, 0.9568627, 1, 1,
0.02937292, 0.1058881, 0.2411152, 0, 0.9529412, 1, 1,
0.03353271, 0.5485429, -0.2015235, 0, 0.945098, 1, 1,
0.03409248, -0.1831271, 2.080928, 0, 0.9411765, 1, 1,
0.03551228, -1.254979, 3.877291, 0, 0.9333333, 1, 1,
0.03661324, 0.8529075, 0.2292279, 0, 0.9294118, 1, 1,
0.03788593, -0.01128683, 2.409794, 0, 0.9215686, 1, 1,
0.04504703, 0.2316105, -0.00720086, 0, 0.9176471, 1, 1,
0.04940489, -0.1271949, 2.864372, 0, 0.9098039, 1, 1,
0.05407113, 0.7149759, -1.718049, 0, 0.9058824, 1, 1,
0.05851901, 0.1629735, -0.6695281, 0, 0.8980392, 1, 1,
0.06229321, -0.5313498, 3.046607, 0, 0.8901961, 1, 1,
0.06256174, 0.7754471, 0.7266933, 0, 0.8862745, 1, 1,
0.06489124, 0.9821947, -0.1647613, 0, 0.8784314, 1, 1,
0.06603684, -1.102093, 3.585635, 0, 0.8745098, 1, 1,
0.07425024, 0.6473517, -1.504646, 0, 0.8666667, 1, 1,
0.07447126, -1.785465, 4.586433, 0, 0.8627451, 1, 1,
0.07705169, -1.119149, 1.737605, 0, 0.854902, 1, 1,
0.08427254, 0.9514354, 1.733319, 0, 0.8509804, 1, 1,
0.08571082, -0.5630197, 1.848482, 0, 0.8431373, 1, 1,
0.08671556, 0.5980505, 2.47723, 0, 0.8392157, 1, 1,
0.08936219, -1.349145, 2.229532, 0, 0.8313726, 1, 1,
0.09095124, 0.1106246, 0.4294748, 0, 0.827451, 1, 1,
0.09111781, 0.879633, -0.175263, 0, 0.8196079, 1, 1,
0.09351441, -0.1867321, 1.347366, 0, 0.8156863, 1, 1,
0.09523255, -1.139626, 3.997885, 0, 0.8078431, 1, 1,
0.1011323, 0.3142949, 0.6068445, 0, 0.8039216, 1, 1,
0.1016136, 0.9281134, 0.6511055, 0, 0.7960784, 1, 1,
0.1019355, -1.967332, 2.705954, 0, 0.7882353, 1, 1,
0.1061444, 1.135705, 2.319558, 0, 0.7843137, 1, 1,
0.1082308, -2.017078, 4.329566, 0, 0.7764706, 1, 1,
0.1088038, -0.6223973, 2.433546, 0, 0.772549, 1, 1,
0.108807, -1.201341, 2.629893, 0, 0.7647059, 1, 1,
0.1109102, -0.3199771, 2.34831, 0, 0.7607843, 1, 1,
0.1109944, -0.09636765, 2.772712, 0, 0.7529412, 1, 1,
0.1123744, -0.7568584, 3.673342, 0, 0.7490196, 1, 1,
0.1142706, -0.8609263, 3.242028, 0, 0.7411765, 1, 1,
0.1158356, 0.5866803, 0.593876, 0, 0.7372549, 1, 1,
0.1165185, -1.479725, 3.612421, 0, 0.7294118, 1, 1,
0.1220021, 1.142916, 1.611527, 0, 0.7254902, 1, 1,
0.1223188, 0.9309023, -1.999706, 0, 0.7176471, 1, 1,
0.1271321, 0.9220618, 1.469892, 0, 0.7137255, 1, 1,
0.1304892, -2.209137, 3.368555, 0, 0.7058824, 1, 1,
0.1306316, 0.5890716, 0.1101366, 0, 0.6980392, 1, 1,
0.1334289, -0.008728114, 0.6961817, 0, 0.6941177, 1, 1,
0.1335253, 0.4451282, 0.5244132, 0, 0.6862745, 1, 1,
0.135862, 1.207494, -0.526238, 0, 0.682353, 1, 1,
0.1398221, 0.3262591, -0.01692273, 0, 0.6745098, 1, 1,
0.1428038, -0.8760102, 2.130784, 0, 0.6705883, 1, 1,
0.1441232, 1.736675, 0.6467776, 0, 0.6627451, 1, 1,
0.1442783, 0.1624108, -0.07251651, 0, 0.6588235, 1, 1,
0.1472377, -0.3168, 2.434805, 0, 0.6509804, 1, 1,
0.1492442, -0.00858844, 1.672907, 0, 0.6470588, 1, 1,
0.153075, -1.463202, 5.050131, 0, 0.6392157, 1, 1,
0.1543777, 0.5422552, 0.9011554, 0, 0.6352941, 1, 1,
0.1562283, -0.1712402, 0.04083547, 0, 0.627451, 1, 1,
0.1570986, 1.878855, -0.1756557, 0, 0.6235294, 1, 1,
0.1575573, -1.356875, 1.950247, 0, 0.6156863, 1, 1,
0.1582028, -0.9205143, 2.211145, 0, 0.6117647, 1, 1,
0.1591535, 2.144161, -0.09598251, 0, 0.6039216, 1, 1,
0.1597036, -1.060603, 3.460907, 0, 0.5960785, 1, 1,
0.1624005, 0.6754354, 0.6227234, 0, 0.5921569, 1, 1,
0.1713012, 1.003873, 1.554832, 0, 0.5843138, 1, 1,
0.1749922, 0.7045635, 0.3919393, 0, 0.5803922, 1, 1,
0.1840851, -0.9778345, 2.0151, 0, 0.572549, 1, 1,
0.1859291, 3.053687, 0.5845875, 0, 0.5686275, 1, 1,
0.1883045, 0.09527947, 0.3156163, 0, 0.5607843, 1, 1,
0.1986548, 0.3814108, 1.438343, 0, 0.5568628, 1, 1,
0.2003532, -1.055403, 3.307967, 0, 0.5490196, 1, 1,
0.2027237, -0.0420305, 2.662438, 0, 0.5450981, 1, 1,
0.2076106, 1.006062, 0.2327714, 0, 0.5372549, 1, 1,
0.2144978, -0.859015, 1.915113, 0, 0.5333334, 1, 1,
0.222435, -0.1998683, 2.201826, 0, 0.5254902, 1, 1,
0.222484, -1.680967, 3.524377, 0, 0.5215687, 1, 1,
0.222888, 2.192716, 0.7358987, 0, 0.5137255, 1, 1,
0.227541, -0.9322833, 2.135308, 0, 0.509804, 1, 1,
0.2350703, -2.246175, 4.00437, 0, 0.5019608, 1, 1,
0.2368931, -0.116848, 1.952799, 0, 0.4941176, 1, 1,
0.2376858, -0.8404096, 2.189271, 0, 0.4901961, 1, 1,
0.239916, 0.7842571, 1.605512, 0, 0.4823529, 1, 1,
0.2415975, -0.8195769, 4.654367, 0, 0.4784314, 1, 1,
0.2416648, -0.5963799, 4.340113, 0, 0.4705882, 1, 1,
0.2579311, -0.5005652, 2.76557, 0, 0.4666667, 1, 1,
0.2658204, -0.2445107, 3.563184, 0, 0.4588235, 1, 1,
0.2660652, 0.01902918, 0.8143142, 0, 0.454902, 1, 1,
0.2689835, -0.2136354, 1.875425, 0, 0.4470588, 1, 1,
0.2698881, 0.5839609, 1.037897, 0, 0.4431373, 1, 1,
0.2739656, 0.1519074, 0.8680778, 0, 0.4352941, 1, 1,
0.2750024, -0.3119045, 2.30262, 0, 0.4313726, 1, 1,
0.2861159, 1.798006, -0.4032124, 0, 0.4235294, 1, 1,
0.2924809, 2.067462, -0.362186, 0, 0.4196078, 1, 1,
0.2962236, -0.3818169, 2.401037, 0, 0.4117647, 1, 1,
0.2976238, 0.2227353, 2.027926, 0, 0.4078431, 1, 1,
0.3132634, -0.2086392, 1.35013, 0, 0.4, 1, 1,
0.3160535, 0.9486055, 2.25862, 0, 0.3921569, 1, 1,
0.3177414, 1.349353, 0.0206121, 0, 0.3882353, 1, 1,
0.3232482, -1.074965, 1.974405, 0, 0.3803922, 1, 1,
0.3250193, -0.165379, 1.962848, 0, 0.3764706, 1, 1,
0.3274327, 0.5459063, 2.977578, 0, 0.3686275, 1, 1,
0.3295577, 1.069319, 0.1103154, 0, 0.3647059, 1, 1,
0.329568, -0.5373268, 2.573076, 0, 0.3568628, 1, 1,
0.3335825, 2.346609, 0.8138709, 0, 0.3529412, 1, 1,
0.3358147, 1.122816, -1.025607, 0, 0.345098, 1, 1,
0.3433124, -0.4921687, 2.48341, 0, 0.3411765, 1, 1,
0.3465559, -0.2836354, 2.950473, 0, 0.3333333, 1, 1,
0.3493182, 0.08660351, 0.7734838, 0, 0.3294118, 1, 1,
0.3564672, 1.474862, 1.382541, 0, 0.3215686, 1, 1,
0.3581371, 0.1473308, 0.3058338, 0, 0.3176471, 1, 1,
0.3666773, 0.1052058, 0.07444568, 0, 0.3098039, 1, 1,
0.3678652, -0.972341, 3.66864, 0, 0.3058824, 1, 1,
0.3699382, -1.168595, 2.321952, 0, 0.2980392, 1, 1,
0.3738443, 0.5420455, 0.6386464, 0, 0.2901961, 1, 1,
0.377619, 0.7974737, -0.007325433, 0, 0.2862745, 1, 1,
0.3805621, 0.7617944, 0.5533587, 0, 0.2784314, 1, 1,
0.3838316, -1.305878, 2.740071, 0, 0.2745098, 1, 1,
0.3843107, -0.2650645, 2.166332, 0, 0.2666667, 1, 1,
0.3868466, 0.1596786, 1.596615, 0, 0.2627451, 1, 1,
0.3894899, 1.35293, -0.06023434, 0, 0.254902, 1, 1,
0.4006755, 0.8622259, 0.4821197, 0, 0.2509804, 1, 1,
0.4040504, -1.092466, 2.913982, 0, 0.2431373, 1, 1,
0.4048683, 0.01117273, 2.409899, 0, 0.2392157, 1, 1,
0.405466, -1.241543, 3.05632, 0, 0.2313726, 1, 1,
0.4087114, -0.1954274, 2.148877, 0, 0.227451, 1, 1,
0.4105778, 0.3222613, 1.195212, 0, 0.2196078, 1, 1,
0.4182696, -0.7933181, 5.141056, 0, 0.2156863, 1, 1,
0.4187298, -2.062924, 3.160517, 0, 0.2078431, 1, 1,
0.4260309, 1.04464, -0.07911625, 0, 0.2039216, 1, 1,
0.427371, 1.383825, 0.09270913, 0, 0.1960784, 1, 1,
0.4291057, -0.4729739, 2.865526, 0, 0.1882353, 1, 1,
0.4298655, -0.6439427, 2.46026, 0, 0.1843137, 1, 1,
0.429947, -0.1163639, 0.6788309, 0, 0.1764706, 1, 1,
0.4323068, -0.5446231, 1.902856, 0, 0.172549, 1, 1,
0.4325923, -0.1338186, 0.7139815, 0, 0.1647059, 1, 1,
0.4374726, 1.23674, -0.5830538, 0, 0.1607843, 1, 1,
0.4387733, 0.7582633, -0.1211701, 0, 0.1529412, 1, 1,
0.4400284, 1.596259, 1.177511, 0, 0.1490196, 1, 1,
0.44015, 2.192972, -0.9796191, 0, 0.1411765, 1, 1,
0.4414268, -1.588799, 5.324425, 0, 0.1372549, 1, 1,
0.4459954, -1.03947, 3.316696, 0, 0.1294118, 1, 1,
0.4494162, 0.8249443, 0.9414448, 0, 0.1254902, 1, 1,
0.4499596, 0.9020851, 1.311358, 0, 0.1176471, 1, 1,
0.4511011, -0.3139689, 3.338402, 0, 0.1137255, 1, 1,
0.4537115, -0.8041022, 2.420402, 0, 0.1058824, 1, 1,
0.4556824, -0.1569311, 0.7154042, 0, 0.09803922, 1, 1,
0.4599327, 0.1877712, 1.188573, 0, 0.09411765, 1, 1,
0.4642949, -0.2941864, -0.4664475, 0, 0.08627451, 1, 1,
0.4646396, 0.8430815, -0.0043361, 0, 0.08235294, 1, 1,
0.4654566, 1.400405, 0.0308209, 0, 0.07450981, 1, 1,
0.4661533, 0.2455036, 1.705701, 0, 0.07058824, 1, 1,
0.4669995, -0.4016595, 2.919402, 0, 0.0627451, 1, 1,
0.4672444, -1.696488, 2.88496, 0, 0.05882353, 1, 1,
0.4743177, 1.76852, -0.5625451, 0, 0.05098039, 1, 1,
0.4811734, -0.5972631, 0.9309478, 0, 0.04705882, 1, 1,
0.4828116, -0.5446463, 2.493032, 0, 0.03921569, 1, 1,
0.4840102, 0.9047941, 0.6426796, 0, 0.03529412, 1, 1,
0.4861789, -0.3422891, 1.662301, 0, 0.02745098, 1, 1,
0.4892966, 0.7724538, -0.3475705, 0, 0.02352941, 1, 1,
0.4941466, -1.459627, 3.971196, 0, 0.01568628, 1, 1,
0.4954052, -0.6898975, 1.014924, 0, 0.01176471, 1, 1,
0.4958737, -0.4842744, 3.40081, 0, 0.003921569, 1, 1,
0.4974325, 0.5863109, 1.050106, 0.003921569, 0, 1, 1,
0.4990902, 2.486783, 2.025129, 0.007843138, 0, 1, 1,
0.5018298, 0.9770581, 1.565544, 0.01568628, 0, 1, 1,
0.5107342, -0.6966279, 2.717777, 0.01960784, 0, 1, 1,
0.5132728, 0.2244267, 2.535192, 0.02745098, 0, 1, 1,
0.5155383, -0.005206705, 2.607649, 0.03137255, 0, 1, 1,
0.5198377, 1.987507, -1.023423, 0.03921569, 0, 1, 1,
0.5213637, -0.02666083, 0.3019565, 0.04313726, 0, 1, 1,
0.5226969, -0.7742468, 3.39005, 0.05098039, 0, 1, 1,
0.5238076, -1.111582, 3.583641, 0.05490196, 0, 1, 1,
0.5252404, -0.6445218, 2.293547, 0.0627451, 0, 1, 1,
0.5268975, 0.09022983, 1.90589, 0.06666667, 0, 1, 1,
0.5298024, 1.288191, 1.188551, 0.07450981, 0, 1, 1,
0.533614, 0.4021707, 1.209203, 0.07843138, 0, 1, 1,
0.5354486, 0.03871787, 0.9387523, 0.08627451, 0, 1, 1,
0.5390011, -0.07289643, 1.230205, 0.09019608, 0, 1, 1,
0.5476329, 1.14143, -0.9909813, 0.09803922, 0, 1, 1,
0.5477581, -0.7169805, 0.7975541, 0.1058824, 0, 1, 1,
0.5529348, 0.6896301, 4.661279, 0.1098039, 0, 1, 1,
0.5533945, 1.13948, 0.4158652, 0.1176471, 0, 1, 1,
0.5549352, -0.1782494, 3.436709, 0.1215686, 0, 1, 1,
0.5591776, 0.6931361, 1.530961, 0.1294118, 0, 1, 1,
0.5633318, -0.05536541, 1.378859, 0.1333333, 0, 1, 1,
0.5682935, 0.3218033, 0.120602, 0.1411765, 0, 1, 1,
0.5693039, -0.1414087, 1.999819, 0.145098, 0, 1, 1,
0.5694398, 0.6318418, 0.3732843, 0.1529412, 0, 1, 1,
0.5716991, -1.125037, 4.133595, 0.1568628, 0, 1, 1,
0.5774239, -0.5524599, 3.06789, 0.1647059, 0, 1, 1,
0.5784051, -1.224634, 1.121108, 0.1686275, 0, 1, 1,
0.585842, 0.4146217, -0.9487464, 0.1764706, 0, 1, 1,
0.5909288, 1.457057, -0.9162089, 0.1803922, 0, 1, 1,
0.5909871, -0.04364187, 2.45511, 0.1882353, 0, 1, 1,
0.5960659, -0.09475268, 0.8726897, 0.1921569, 0, 1, 1,
0.5995116, 0.8097304, 0.4793212, 0.2, 0, 1, 1,
0.6010658, 0.1520319, 0.3896511, 0.2078431, 0, 1, 1,
0.6022343, 0.594653, 0.06766433, 0.2117647, 0, 1, 1,
0.6034099, 0.04824911, 2.334168, 0.2196078, 0, 1, 1,
0.6070215, -0.3240718, 0.9177305, 0.2235294, 0, 1, 1,
0.6072592, 0.9598815, 0.7117321, 0.2313726, 0, 1, 1,
0.6079713, 0.4277542, 1.734609, 0.2352941, 0, 1, 1,
0.6176784, 0.3530405, 1.461105, 0.2431373, 0, 1, 1,
0.6277305, -2.181582, 1.851148, 0.2470588, 0, 1, 1,
0.6280363, -0.8462401, 2.643132, 0.254902, 0, 1, 1,
0.6282637, 0.1736426, 1.522329, 0.2588235, 0, 1, 1,
0.6289654, -0.4022211, 2.533872, 0.2666667, 0, 1, 1,
0.6317593, -1.67498, 3.510458, 0.2705882, 0, 1, 1,
0.6320451, 0.5952272, 1.972995, 0.2784314, 0, 1, 1,
0.636301, -0.5883339, 1.02584, 0.282353, 0, 1, 1,
0.6390992, -0.3580703, 2.914837, 0.2901961, 0, 1, 1,
0.6443576, 1.245554, 2.629779, 0.2941177, 0, 1, 1,
0.6482826, 1.074822, -0.03147951, 0.3019608, 0, 1, 1,
0.650079, -2.036991, 3.343365, 0.3098039, 0, 1, 1,
0.6533603, 0.8979865, 0.6621245, 0.3137255, 0, 1, 1,
0.6558835, 0.2787545, 3.490774, 0.3215686, 0, 1, 1,
0.6562803, -1.008539, 2.879591, 0.3254902, 0, 1, 1,
0.6638898, 1.343181, 0.008594705, 0.3333333, 0, 1, 1,
0.6645811, -1.366229, 1.41203, 0.3372549, 0, 1, 1,
0.6650411, -0.2336796, 0.3142053, 0.345098, 0, 1, 1,
0.6665061, -1.706848, 1.770135, 0.3490196, 0, 1, 1,
0.6753544, 1.84345, 1.1607, 0.3568628, 0, 1, 1,
0.6753978, -1.901738, 4.604762, 0.3607843, 0, 1, 1,
0.6812526, 0.4803318, -0.4576684, 0.3686275, 0, 1, 1,
0.6895587, -1.218306, 2.482531, 0.372549, 0, 1, 1,
0.6950052, 0.09463481, 0.5127794, 0.3803922, 0, 1, 1,
0.6969815, -0.4275217, 1.702148, 0.3843137, 0, 1, 1,
0.7035556, -0.1010157, 2.369786, 0.3921569, 0, 1, 1,
0.7046847, -0.2031417, 2.266693, 0.3960784, 0, 1, 1,
0.7070516, 1.006427, -0.3821201, 0.4039216, 0, 1, 1,
0.708342, 1.278446, 0.1890238, 0.4117647, 0, 1, 1,
0.7083789, -0.03910222, 1.692708, 0.4156863, 0, 1, 1,
0.714875, 0.3980974, 0.7655329, 0.4235294, 0, 1, 1,
0.7151189, -0.3732641, 3.566685, 0.427451, 0, 1, 1,
0.7203391, -0.1682257, 3.31806, 0.4352941, 0, 1, 1,
0.7257156, 0.02839906, 1.494682, 0.4392157, 0, 1, 1,
0.7265384, -0.3462871, 1.035413, 0.4470588, 0, 1, 1,
0.727433, 0.5614262, 1.689137, 0.4509804, 0, 1, 1,
0.7278453, 0.2050565, 2.606143, 0.4588235, 0, 1, 1,
0.7346112, 0.8290129, -0.6595793, 0.4627451, 0, 1, 1,
0.7363244, -0.6050403, 1.889289, 0.4705882, 0, 1, 1,
0.7373917, 0.9345794, 1.378602, 0.4745098, 0, 1, 1,
0.7409277, -1.452935, 2.818795, 0.4823529, 0, 1, 1,
0.7422638, 0.6577181, 0.9978773, 0.4862745, 0, 1, 1,
0.7422772, -1.384339, 2.357946, 0.4941176, 0, 1, 1,
0.7430712, -1.162, 3.609015, 0.5019608, 0, 1, 1,
0.7454512, -0.9773523, 2.201847, 0.5058824, 0, 1, 1,
0.7477926, -1.189383, 2.921751, 0.5137255, 0, 1, 1,
0.7486073, -0.6366479, 2.401394, 0.5176471, 0, 1, 1,
0.7491506, -0.1859259, -0.1555224, 0.5254902, 0, 1, 1,
0.7618779, -1.50248, 1.546822, 0.5294118, 0, 1, 1,
0.7657239, 0.7982222, 0.9069729, 0.5372549, 0, 1, 1,
0.7659526, 0.3573864, 0.5096458, 0.5411765, 0, 1, 1,
0.7806459, 0.1422486, 2.120166, 0.5490196, 0, 1, 1,
0.781586, -0.5059437, 2.322395, 0.5529412, 0, 1, 1,
0.7841223, -0.619665, 3.209563, 0.5607843, 0, 1, 1,
0.7857463, -0.9262026, 2.916194, 0.5647059, 0, 1, 1,
0.7893963, -0.009784605, 2.008358, 0.572549, 0, 1, 1,
0.7939372, -0.1704796, 3.048338, 0.5764706, 0, 1, 1,
0.7951253, 0.6594356, -1.43452, 0.5843138, 0, 1, 1,
0.7996422, -0.5078425, 2.863278, 0.5882353, 0, 1, 1,
0.8001701, 0.5952696, 2.384128, 0.5960785, 0, 1, 1,
0.8088945, -0.5380485, 1.510378, 0.6039216, 0, 1, 1,
0.8129706, -0.7933463, 1.313918, 0.6078432, 0, 1, 1,
0.813302, 0.743395, -0.8115352, 0.6156863, 0, 1, 1,
0.8263766, -1.315353, 3.99367, 0.6196079, 0, 1, 1,
0.8265439, 1.275421, 0.2116476, 0.627451, 0, 1, 1,
0.8284665, 0.9183746, -0.1367961, 0.6313726, 0, 1, 1,
0.8303145, -0.6530005, 2.391501, 0.6392157, 0, 1, 1,
0.8335023, 0.3405274, 0.5854292, 0.6431373, 0, 1, 1,
0.8427189, -0.8943366, 0.1112675, 0.6509804, 0, 1, 1,
0.8438295, -0.9149148, 4.005328, 0.654902, 0, 1, 1,
0.8449655, 0.4559063, 1.160013, 0.6627451, 0, 1, 1,
0.8465209, -1.236137, 2.666833, 0.6666667, 0, 1, 1,
0.8466667, 1.378404, 0.8524386, 0.6745098, 0, 1, 1,
0.846991, 1.353997, 1.625857, 0.6784314, 0, 1, 1,
0.8479192, -0.1527879, 4.172602, 0.6862745, 0, 1, 1,
0.8485618, -0.8219166, 1.039157, 0.6901961, 0, 1, 1,
0.8509131, -0.6437488, 2.836506, 0.6980392, 0, 1, 1,
0.8512487, 0.6084927, 0.2574344, 0.7058824, 0, 1, 1,
0.8535864, -0.3120698, 3.255208, 0.7098039, 0, 1, 1,
0.8561853, -0.182461, 2.825328, 0.7176471, 0, 1, 1,
0.8571337, 0.963326, 1.818331, 0.7215686, 0, 1, 1,
0.8580224, -0.07760213, -0.103148, 0.7294118, 0, 1, 1,
0.8617042, -0.209633, 1.47186, 0.7333333, 0, 1, 1,
0.8738692, -0.02930685, -0.2938942, 0.7411765, 0, 1, 1,
0.8758357, -0.4336003, 2.217318, 0.7450981, 0, 1, 1,
0.878139, -0.8768266, 1.901024, 0.7529412, 0, 1, 1,
0.878678, 0.4084815, 2.004993, 0.7568628, 0, 1, 1,
0.8788037, -0.1547861, 1.568518, 0.7647059, 0, 1, 1,
0.8802487, 1.493505, 1.043594, 0.7686275, 0, 1, 1,
0.8848485, 0.2471417, 2.42747, 0.7764706, 0, 1, 1,
0.8858445, 0.03048415, 2.85564, 0.7803922, 0, 1, 1,
0.8865833, 1.084396, 1.300333, 0.7882353, 0, 1, 1,
0.8890308, 1.405408, -0.2724397, 0.7921569, 0, 1, 1,
0.8925298, -0.08390422, -0.3309695, 0.8, 0, 1, 1,
0.8941816, -1.903854, 3.753053, 0.8078431, 0, 1, 1,
0.8992552, -0.2436976, 1.342799, 0.8117647, 0, 1, 1,
0.9030451, -0.4859434, 2.273163, 0.8196079, 0, 1, 1,
0.9068608, -1.960354, 2.255206, 0.8235294, 0, 1, 1,
0.9127547, 1.359921, -0.4422331, 0.8313726, 0, 1, 1,
0.9131047, 0.2121986, 0.3146857, 0.8352941, 0, 1, 1,
0.9192175, -0.6296524, 3.306988, 0.8431373, 0, 1, 1,
0.9210615, -2.027599, 4.85091, 0.8470588, 0, 1, 1,
0.945524, 1.002345, -0.729389, 0.854902, 0, 1, 1,
0.9474582, 0.9153963, 3.234807, 0.8588235, 0, 1, 1,
0.9498048, 0.67356, 1.12737, 0.8666667, 0, 1, 1,
0.9544147, 0.7080197, 0.4584085, 0.8705882, 0, 1, 1,
0.960066, 1.760223, 1.666851, 0.8784314, 0, 1, 1,
0.961677, -1.075263, 2.239928, 0.8823529, 0, 1, 1,
0.9658522, -0.04339831, 0.07646091, 0.8901961, 0, 1, 1,
0.9664012, 1.770854, 0.6009167, 0.8941177, 0, 1, 1,
0.9669597, 0.9110513, 0.6204236, 0.9019608, 0, 1, 1,
0.9671392, 1.1629, -0.2079844, 0.9098039, 0, 1, 1,
0.9741172, 0.421299, 1.557977, 0.9137255, 0, 1, 1,
0.9797775, 0.6946927, 1.222325, 0.9215686, 0, 1, 1,
0.9802828, 0.9004964, 0.4618615, 0.9254902, 0, 1, 1,
0.9938843, 1.35355, 2.022825, 0.9333333, 0, 1, 1,
0.9955524, 0.1671949, 1.764464, 0.9372549, 0, 1, 1,
0.9961766, 1.655347, 0.4939449, 0.945098, 0, 1, 1,
0.9983176, 0.5534168, 1.207578, 0.9490196, 0, 1, 1,
0.9986237, -0.03331767, -0.04424313, 0.9568627, 0, 1, 1,
1.002439, 0.1264038, 1.662383, 0.9607843, 0, 1, 1,
1.009995, 1.437292, 1.168385, 0.9686275, 0, 1, 1,
1.014557, 1.331745, 0.464304, 0.972549, 0, 1, 1,
1.019374, -1.164118, 2.651855, 0.9803922, 0, 1, 1,
1.020049, 0.1141379, 0.5830925, 0.9843137, 0, 1, 1,
1.021928, -1.354845, 2.220161, 0.9921569, 0, 1, 1,
1.026282, 0.3476834, 3.41235, 0.9960784, 0, 1, 1,
1.027735, 1.39801, 0.7917593, 1, 0, 0.9960784, 1,
1.033855, 0.8654277, -0.4273803, 1, 0, 0.9882353, 1,
1.034255, 0.3012237, 0.8035483, 1, 0, 0.9843137, 1,
1.036747, -1.226479, 0.77479, 1, 0, 0.9764706, 1,
1.037439, -1.191569, 1.991487, 1, 0, 0.972549, 1,
1.044076, -0.3025646, 0.9291238, 1, 0, 0.9647059, 1,
1.046469, -0.2576154, 1.973988, 1, 0, 0.9607843, 1,
1.047048, -0.9146477, 2.960872, 1, 0, 0.9529412, 1,
1.051305, 0.3734684, -0.1607987, 1, 0, 0.9490196, 1,
1.057497, -1.00255, 2.482117, 1, 0, 0.9411765, 1,
1.059289, 0.4369364, 1.688961, 1, 0, 0.9372549, 1,
1.062722, -0.07279822, 0.3567854, 1, 0, 0.9294118, 1,
1.06363, 0.2853381, 2.455902, 1, 0, 0.9254902, 1,
1.066278, -0.1115933, 1.640695, 1, 0, 0.9176471, 1,
1.068361, 0.5080814, 1.499256, 1, 0, 0.9137255, 1,
1.069199, -0.7195922, 2.318488, 1, 0, 0.9058824, 1,
1.090286, -0.6608928, 2.959601, 1, 0, 0.9019608, 1,
1.092708, 0.4446756, 1.72832, 1, 0, 0.8941177, 1,
1.097799, 2.349071, 0.6548225, 1, 0, 0.8862745, 1,
1.098333, -0.9956586, 2.869447, 1, 0, 0.8823529, 1,
1.09942, -0.1874693, 2.461634, 1, 0, 0.8745098, 1,
1.099713, -1.032392, 3.149483, 1, 0, 0.8705882, 1,
1.099948, 0.5668778, 2.199906, 1, 0, 0.8627451, 1,
1.100321, 0.6385391, 2.107064, 1, 0, 0.8588235, 1,
1.101775, 0.05472521, 2.170005, 1, 0, 0.8509804, 1,
1.109171, 1.154205, 1.926763, 1, 0, 0.8470588, 1,
1.110972, -1.433195, 1.51158, 1, 0, 0.8392157, 1,
1.115942, -1.43082, 3.004591, 1, 0, 0.8352941, 1,
1.121717, 1.046532, 0.3462374, 1, 0, 0.827451, 1,
1.124362, -0.1238559, 2.38309, 1, 0, 0.8235294, 1,
1.131111, 0.6610897, 1.436903, 1, 0, 0.8156863, 1,
1.138337, -1.744486, 2.492109, 1, 0, 0.8117647, 1,
1.141178, 0.2869034, 2.332331, 1, 0, 0.8039216, 1,
1.155815, -2.481566, 4.730422, 1, 0, 0.7960784, 1,
1.158788, -1.47012, 2.835802, 1, 0, 0.7921569, 1,
1.168634, -0.1557863, -0.5718831, 1, 0, 0.7843137, 1,
1.170712, -1.119764, 2.348017, 1, 0, 0.7803922, 1,
1.170792, 0.1786253, 1.06132, 1, 0, 0.772549, 1,
1.173059, 0.7013186, 1.242072, 1, 0, 0.7686275, 1,
1.182384, 0.2330286, -1.717712, 1, 0, 0.7607843, 1,
1.184833, 0.5659105, 0.4180341, 1, 0, 0.7568628, 1,
1.185109, -0.8464003, 3.363295, 1, 0, 0.7490196, 1,
1.185274, -1.562851, 1.817493, 1, 0, 0.7450981, 1,
1.191862, 1.093367, -0.2573054, 1, 0, 0.7372549, 1,
1.192708, 1.271403, 1.391425, 1, 0, 0.7333333, 1,
1.202015, 0.234302, 2.891252, 1, 0, 0.7254902, 1,
1.202491, -0.7499227, 3.738021, 1, 0, 0.7215686, 1,
1.209402, 1.294828, 1.353679, 1, 0, 0.7137255, 1,
1.210066, -0.3873423, 2.193043, 1, 0, 0.7098039, 1,
1.211073, 0.09698922, -0.5860972, 1, 0, 0.7019608, 1,
1.215344, 0.2528636, 1.921966, 1, 0, 0.6941177, 1,
1.220601, -0.1605874, 1.851408, 1, 0, 0.6901961, 1,
1.220673, -1.38697, 1.499287, 1, 0, 0.682353, 1,
1.224239, 0.03185521, 0.6954001, 1, 0, 0.6784314, 1,
1.225194, -0.4800336, 1.881449, 1, 0, 0.6705883, 1,
1.228239, 0.4402329, -0.1267981, 1, 0, 0.6666667, 1,
1.235604, 0.192693, 0.5655506, 1, 0, 0.6588235, 1,
1.237305, 1.800631, -0.2984924, 1, 0, 0.654902, 1,
1.242343, 1.334952, 2.121188, 1, 0, 0.6470588, 1,
1.282051, 0.2209935, 0.1442123, 1, 0, 0.6431373, 1,
1.293175, -0.8426867, 2.230192, 1, 0, 0.6352941, 1,
1.294709, 0.5629733, 1.419835, 1, 0, 0.6313726, 1,
1.302038, -0.9485585, 3.419934, 1, 0, 0.6235294, 1,
1.308215, 1.221541, 1.246411, 1, 0, 0.6196079, 1,
1.313775, 0.009707515, 2.286589, 1, 0, 0.6117647, 1,
1.315947, -1.562256, 2.214335, 1, 0, 0.6078432, 1,
1.317332, 1.150803, 0.8610518, 1, 0, 0.6, 1,
1.322527, -0.1610674, 3.254523, 1, 0, 0.5921569, 1,
1.325298, 2.208184, 2.088001, 1, 0, 0.5882353, 1,
1.32798, -1.856459, 3.455433, 1, 0, 0.5803922, 1,
1.328373, 0.01523303, 1.57684, 1, 0, 0.5764706, 1,
1.328721, -1.293029, 2.464359, 1, 0, 0.5686275, 1,
1.333448, -0.1104067, -0.2673552, 1, 0, 0.5647059, 1,
1.336972, -0.4790109, 2.12462, 1, 0, 0.5568628, 1,
1.348282, -0.8052675, 0.6799551, 1, 0, 0.5529412, 1,
1.350293, 0.7330479, 1.472861, 1, 0, 0.5450981, 1,
1.352278, -0.3134089, 0.7677089, 1, 0, 0.5411765, 1,
1.355031, 0.07828784, 2.185602, 1, 0, 0.5333334, 1,
1.35933, -0.6297847, 4.201629, 1, 0, 0.5294118, 1,
1.389979, 1.179508, 1.600347, 1, 0, 0.5215687, 1,
1.390903, -0.8371202, 2.588539, 1, 0, 0.5176471, 1,
1.393793, -0.8508554, 1.556038, 1, 0, 0.509804, 1,
1.422369, -1.429009, 2.837788, 1, 0, 0.5058824, 1,
1.424012, 1.096398, 1.04536, 1, 0, 0.4980392, 1,
1.437574, 1.570817, 1.460616, 1, 0, 0.4901961, 1,
1.44536, 0.4245786, 1.761911, 1, 0, 0.4862745, 1,
1.458043, -0.1688651, 1.874785, 1, 0, 0.4784314, 1,
1.475253, 2.189387, 0.08506275, 1, 0, 0.4745098, 1,
1.47875, -1.304152, 0.9548933, 1, 0, 0.4666667, 1,
1.494347, 1.522027, 1.685135, 1, 0, 0.4627451, 1,
1.496292, 0.1299843, 1.078143, 1, 0, 0.454902, 1,
1.499303, -0.05068056, 2.016395, 1, 0, 0.4509804, 1,
1.499785, 0.5309313, 1.028745, 1, 0, 0.4431373, 1,
1.503527, -0.1788658, 1.866371, 1, 0, 0.4392157, 1,
1.504897, 0.3738314, 1.402451, 1, 0, 0.4313726, 1,
1.509497, -0.4624503, 2.529459, 1, 0, 0.427451, 1,
1.514134, 1.910265, 1.665097, 1, 0, 0.4196078, 1,
1.516488, -1.515692, 2.254185, 1, 0, 0.4156863, 1,
1.519184, -2.623259, 2.857446, 1, 0, 0.4078431, 1,
1.520443, -0.537994, 2.007609, 1, 0, 0.4039216, 1,
1.524577, 0.6962406, 1.508548, 1, 0, 0.3960784, 1,
1.539574, -0.9017059, 1.020016, 1, 0, 0.3882353, 1,
1.539887, -0.8437373, 2.973293, 1, 0, 0.3843137, 1,
1.554322, 1.426952, -0.3489307, 1, 0, 0.3764706, 1,
1.55616, -0.6007071, 2.231013, 1, 0, 0.372549, 1,
1.557475, 2.197267, 0.9343763, 1, 0, 0.3647059, 1,
1.560979, -2.526292, 3.439666, 1, 0, 0.3607843, 1,
1.561845, 0.764097, 0.4183357, 1, 0, 0.3529412, 1,
1.564159, 0.7780911, 2.090085, 1, 0, 0.3490196, 1,
1.567514, -0.7062726, 0.9139944, 1, 0, 0.3411765, 1,
1.572902, -1.697272, 1.721668, 1, 0, 0.3372549, 1,
1.579771, 0.1816702, 3.005147, 1, 0, 0.3294118, 1,
1.59017, 0.8550712, 0.4809789, 1, 0, 0.3254902, 1,
1.597935, -0.3542688, -0.1335208, 1, 0, 0.3176471, 1,
1.615045, -0.7188208, 1.107203, 1, 0, 0.3137255, 1,
1.643832, 0.2400029, 0.4241416, 1, 0, 0.3058824, 1,
1.657955, 0.6552568, 1.270189, 1, 0, 0.2980392, 1,
1.679963, -1.023614, 2.296297, 1, 0, 0.2941177, 1,
1.712223, -0.3473164, 2.019468, 1, 0, 0.2862745, 1,
1.73438, -0.1298422, 0.3155668, 1, 0, 0.282353, 1,
1.750631, 0.7208233, 0.9588412, 1, 0, 0.2745098, 1,
1.752845, 2.089669, 2.12354, 1, 0, 0.2705882, 1,
1.760485, -0.01027505, 2.248334, 1, 0, 0.2627451, 1,
1.772752, 0.9276056, 0.5322288, 1, 0, 0.2588235, 1,
1.774229, -0.04579317, 2.474639, 1, 0, 0.2509804, 1,
1.777613, -1.391007, 1.403675, 1, 0, 0.2470588, 1,
1.784192, -0.4518487, 2.004909, 1, 0, 0.2392157, 1,
1.808702, 2.269092, -0.6022806, 1, 0, 0.2352941, 1,
1.820168, 2.016751, 1.761775, 1, 0, 0.227451, 1,
1.845739, -0.1736101, 2.436219, 1, 0, 0.2235294, 1,
1.856994, -0.04898006, 0.876856, 1, 0, 0.2156863, 1,
1.870504, -0.7020652, 1.783991, 1, 0, 0.2117647, 1,
1.903544, 0.4904727, 4.087127, 1, 0, 0.2039216, 1,
1.907221, 0.6012357, 1.386181, 1, 0, 0.1960784, 1,
1.935869, 0.5369132, 1.369937, 1, 0, 0.1921569, 1,
1.939834, -0.3273079, 1.568079, 1, 0, 0.1843137, 1,
1.951212, 1.269487, 0.3037761, 1, 0, 0.1803922, 1,
1.952049, -0.4347493, 0.4671391, 1, 0, 0.172549, 1,
1.973469, 0.03152601, -0.05719594, 1, 0, 0.1686275, 1,
1.983292, -0.5066161, 2.83115, 1, 0, 0.1607843, 1,
1.998446, 1.913829, 0.686385, 1, 0, 0.1568628, 1,
1.999295, 0.8345414, 1.120944, 1, 0, 0.1490196, 1,
2.023445, -0.5226522, 3.957534, 1, 0, 0.145098, 1,
2.037188, 0.6996489, 1.390156, 1, 0, 0.1372549, 1,
2.074992, 0.245406, 2.431095, 1, 0, 0.1333333, 1,
2.096882, 0.5357434, 1.636861, 1, 0, 0.1254902, 1,
2.10391, -0.9911923, 1.554034, 1, 0, 0.1215686, 1,
2.108998, -0.728833, 0.8969862, 1, 0, 0.1137255, 1,
2.123084, 0.1863656, -0.3380893, 1, 0, 0.1098039, 1,
2.12442, 0.3057221, 1.072278, 1, 0, 0.1019608, 1,
2.140426, 0.6792712, 1.01246, 1, 0, 0.09411765, 1,
2.148475, -0.2517163, 2.885141, 1, 0, 0.09019608, 1,
2.15174, 0.3298219, 1.245652, 1, 0, 0.08235294, 1,
2.161412, -1.284538, 2.148578, 1, 0, 0.07843138, 1,
2.193065, -0.2973975, 2.944632, 1, 0, 0.07058824, 1,
2.253693, 0.5021641, 1.071397, 1, 0, 0.06666667, 1,
2.291277, -0.4444517, 4.136462, 1, 0, 0.05882353, 1,
2.330601, 0.03553402, 0.4845679, 1, 0, 0.05490196, 1,
2.363664, -2.557958, 1.931629, 1, 0, 0.04705882, 1,
2.367363, 2.136405, 1.398342, 1, 0, 0.04313726, 1,
2.399849, 0.2529111, 0.7969248, 1, 0, 0.03529412, 1,
2.465827, -1.462401, 1.312389, 1, 0, 0.03137255, 1,
2.470972, 0.8032484, 2.531825, 1, 0, 0.02352941, 1,
3.011885, 0.5743089, 2.272229, 1, 0, 0.01960784, 1,
3.120639, -0.3703819, 0.3443117, 1, 0, 0.01176471, 1,
3.416713, 1.080915, 0.2706879, 1, 0, 0.007843138, 1
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
0.108391, -3.674828, -7.424543, 0, -0.5, 0.5, 0.5,
0.108391, -3.674828, -7.424543, 1, -0.5, 0.5, 0.5,
0.108391, -3.674828, -7.424543, 1, 1.5, 0.5, 0.5,
0.108391, -3.674828, -7.424543, 0, 1.5, 0.5, 0.5
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
-4.321452, 0.177024, -7.424543, 0, -0.5, 0.5, 0.5,
-4.321452, 0.177024, -7.424543, 1, -0.5, 0.5, 0.5,
-4.321452, 0.177024, -7.424543, 1, 1.5, 0.5, 0.5,
-4.321452, 0.177024, -7.424543, 0, 1.5, 0.5, 0.5
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
-4.321452, -3.674828, -0.1261811, 0, -0.5, 0.5, 0.5,
-4.321452, -3.674828, -0.1261811, 1, -0.5, 0.5, 0.5,
-4.321452, -3.674828, -0.1261811, 1, 1.5, 0.5, 0.5,
-4.321452, -3.674828, -0.1261811, 0, 1.5, 0.5, 0.5
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
-3, -2.785939, -5.740306,
3, -2.785939, -5.740306,
-3, -2.785939, -5.740306,
-3, -2.934087, -6.021012,
-2, -2.785939, -5.740306,
-2, -2.934087, -6.021012,
-1, -2.785939, -5.740306,
-1, -2.934087, -6.021012,
0, -2.785939, -5.740306,
0, -2.934087, -6.021012,
1, -2.785939, -5.740306,
1, -2.934087, -6.021012,
2, -2.785939, -5.740306,
2, -2.934087, -6.021012,
3, -2.785939, -5.740306,
3, -2.934087, -6.021012
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
-3, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
-3, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
-3, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
-3, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
-2, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
-2, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
-2, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
-2, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
-1, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
-1, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
-1, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
-1, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
0, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
0, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
0, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
0, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
1, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
1, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
1, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
1, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
2, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
2, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
2, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
2, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5,
3, -3.230383, -6.582424, 0, -0.5, 0.5, 0.5,
3, -3.230383, -6.582424, 1, -0.5, 0.5, 0.5,
3, -3.230383, -6.582424, 1, 1.5, 0.5, 0.5,
3, -3.230383, -6.582424, 0, 1.5, 0.5, 0.5
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
-3.299181, -2, -5.740306,
-3.299181, 3, -5.740306,
-3.299181, -2, -5.740306,
-3.469559, -2, -6.021012,
-3.299181, -1, -5.740306,
-3.469559, -1, -6.021012,
-3.299181, 0, -5.740306,
-3.469559, 0, -6.021012,
-3.299181, 1, -5.740306,
-3.469559, 1, -6.021012,
-3.299181, 2, -5.740306,
-3.469559, 2, -6.021012,
-3.299181, 3, -5.740306,
-3.469559, 3, -6.021012
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
-3.810316, -2, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, -2, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, -2, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, -2, -6.582424, 0, 1.5, 0.5, 0.5,
-3.810316, -1, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, -1, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, -1, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, -1, -6.582424, 0, 1.5, 0.5, 0.5,
-3.810316, 0, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, 0, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, 0, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, 0, -6.582424, 0, 1.5, 0.5, 0.5,
-3.810316, 1, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, 1, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, 1, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, 1, -6.582424, 0, 1.5, 0.5, 0.5,
-3.810316, 2, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, 2, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, 2, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, 2, -6.582424, 0, 1.5, 0.5, 0.5,
-3.810316, 3, -6.582424, 0, -0.5, 0.5, 0.5,
-3.810316, 3, -6.582424, 1, -0.5, 0.5, 0.5,
-3.810316, 3, -6.582424, 1, 1.5, 0.5, 0.5,
-3.810316, 3, -6.582424, 0, 1.5, 0.5, 0.5
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
-3.299181, -2.785939, -4,
-3.299181, -2.785939, 4,
-3.299181, -2.785939, -4,
-3.469559, -2.934087, -4,
-3.299181, -2.785939, -2,
-3.469559, -2.934087, -2,
-3.299181, -2.785939, 0,
-3.469559, -2.934087, 0,
-3.299181, -2.785939, 2,
-3.469559, -2.934087, 2,
-3.299181, -2.785939, 4,
-3.469559, -2.934087, 4
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
-3.810316, -3.230383, -4, 0, -0.5, 0.5, 0.5,
-3.810316, -3.230383, -4, 1, -0.5, 0.5, 0.5,
-3.810316, -3.230383, -4, 1, 1.5, 0.5, 0.5,
-3.810316, -3.230383, -4, 0, 1.5, 0.5, 0.5,
-3.810316, -3.230383, -2, 0, -0.5, 0.5, 0.5,
-3.810316, -3.230383, -2, 1, -0.5, 0.5, 0.5,
-3.810316, -3.230383, -2, 1, 1.5, 0.5, 0.5,
-3.810316, -3.230383, -2, 0, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 0, 0, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 0, 1, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 0, 1, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 0, 0, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 2, 0, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 2, 1, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 2, 1, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 2, 0, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 4, 0, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 4, 1, -0.5, 0.5, 0.5,
-3.810316, -3.230383, 4, 1, 1.5, 0.5, 0.5,
-3.810316, -3.230383, 4, 0, 1.5, 0.5, 0.5
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
-3.299181, -2.785939, -5.740306,
-3.299181, 3.139987, -5.740306,
-3.299181, -2.785939, 5.487944,
-3.299181, 3.139987, 5.487944,
-3.299181, -2.785939, -5.740306,
-3.299181, -2.785939, 5.487944,
-3.299181, 3.139987, -5.740306,
-3.299181, 3.139987, 5.487944,
-3.299181, -2.785939, -5.740306,
3.515963, -2.785939, -5.740306,
-3.299181, -2.785939, 5.487944,
3.515963, -2.785939, 5.487944,
-3.299181, 3.139987, -5.740306,
3.515963, 3.139987, -5.740306,
-3.299181, 3.139987, 5.487944,
3.515963, 3.139987, 5.487944,
3.515963, -2.785939, -5.740306,
3.515963, 3.139987, -5.740306,
3.515963, -2.785939, 5.487944,
3.515963, 3.139987, 5.487944,
3.515963, -2.785939, -5.740306,
3.515963, -2.785939, 5.487944,
3.515963, 3.139987, -5.740306,
3.515963, 3.139987, 5.487944
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
var radius = 7.694442;
var distance = 34.23344;
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
mvMatrix.translate( -0.108391, -0.177024, 0.1261811 );
mvMatrix.scale( 1.22072, 1.403896, 0.7409331 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.23344);
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


