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
-3.759927, -2.032954, -1.219375, 1, 0, 0, 1,
-3.715738, 2.415948, -0.9969941, 1, 0.007843138, 0, 1,
-3.588909, -0.311333, -2.768257, 1, 0.01176471, 0, 1,
-2.760527, -0.6592072, 0.9655237, 1, 0.01960784, 0, 1,
-2.684273, -0.4897267, -2.142909, 1, 0.02352941, 0, 1,
-2.621775, -0.4990285, -1.001822, 1, 0.03137255, 0, 1,
-2.540015, -0.6502768, 0.2937807, 1, 0.03529412, 0, 1,
-2.44733, 0.6422018, -1.54455, 1, 0.04313726, 0, 1,
-2.413905, -0.4358782, -2.34342, 1, 0.04705882, 0, 1,
-2.329798, 0.7901579, -2.463296, 1, 0.05490196, 0, 1,
-2.315542, 1.07709, -2.188389, 1, 0.05882353, 0, 1,
-2.272292, 0.2610121, -1.203509, 1, 0.06666667, 0, 1,
-2.247676, -0.3713016, -2.685462, 1, 0.07058824, 0, 1,
-2.195585, 1.147216, -1.446479, 1, 0.07843138, 0, 1,
-2.177285, 1.880649, -1.582722, 1, 0.08235294, 0, 1,
-2.170377, -0.3996324, -2.162542, 1, 0.09019608, 0, 1,
-2.169874, -1.139494, -3.012809, 1, 0.09411765, 0, 1,
-2.162824, -0.96787, -1.929244, 1, 0.1019608, 0, 1,
-2.154331, 0.2197773, 0.07177992, 1, 0.1098039, 0, 1,
-2.149661, 0.9172698, -2.004816, 1, 0.1137255, 0, 1,
-2.124832, -0.9426531, -1.850665, 1, 0.1215686, 0, 1,
-2.124695, -0.3606499, -2.175086, 1, 0.1254902, 0, 1,
-2.090942, 0.638813, 0.1706264, 1, 0.1333333, 0, 1,
-2.073669, 0.6840403, -1.189488, 1, 0.1372549, 0, 1,
-2.06983, 1.152628, -1.619546, 1, 0.145098, 0, 1,
-2.066097, -1.632178, -1.289867, 1, 0.1490196, 0, 1,
-2.040898, -1.360371, -4.042042, 1, 0.1568628, 0, 1,
-2.027058, -1.149156, -2.02051, 1, 0.1607843, 0, 1,
-2.010143, -0.2473196, -3.810774, 1, 0.1686275, 0, 1,
-2.005774, 0.8592702, -1.535664, 1, 0.172549, 0, 1,
-1.992138, 1.419868, -1.246518, 1, 0.1803922, 0, 1,
-1.977586, -0.09362803, -1.767685, 1, 0.1843137, 0, 1,
-1.942483, 1.344989, -0.7800147, 1, 0.1921569, 0, 1,
-1.914256, -1.185844, -2.131086, 1, 0.1960784, 0, 1,
-1.911401, -1.343285, 0.02155051, 1, 0.2039216, 0, 1,
-1.822257, 0.46758, -1.62289, 1, 0.2117647, 0, 1,
-1.818919, 2.526841, -1.781327, 1, 0.2156863, 0, 1,
-1.815098, 0.3880008, 0.1081451, 1, 0.2235294, 0, 1,
-1.798022, 0.8678007, -1.022795, 1, 0.227451, 0, 1,
-1.776984, -0.3129446, -1.784716, 1, 0.2352941, 0, 1,
-1.775374, 0.9562874, -0.4779727, 1, 0.2392157, 0, 1,
-1.773, -0.5474963, -0.3559754, 1, 0.2470588, 0, 1,
-1.761065, -2.01907, -5.075308, 1, 0.2509804, 0, 1,
-1.759633, 0.0675761, -1.13286, 1, 0.2588235, 0, 1,
-1.759195, -0.4404902, -0.7731721, 1, 0.2627451, 0, 1,
-1.755953, -0.09607484, -0.5146538, 1, 0.2705882, 0, 1,
-1.740226, -0.01039029, -2.141341, 1, 0.2745098, 0, 1,
-1.733845, -2.096398, -4.934241, 1, 0.282353, 0, 1,
-1.719198, 0.7913569, -1.503008, 1, 0.2862745, 0, 1,
-1.704114, 0.4350488, 0.4682339, 1, 0.2941177, 0, 1,
-1.700994, 0.2332477, -3.008433, 1, 0.3019608, 0, 1,
-1.699583, 0.2909324, -2.930209, 1, 0.3058824, 0, 1,
-1.698182, -1.29922, -3.607301, 1, 0.3137255, 0, 1,
-1.688144, -0.1893498, -1.946874, 1, 0.3176471, 0, 1,
-1.685637, 1.390162, 0.2593583, 1, 0.3254902, 0, 1,
-1.642222, -1.758186, -3.044062, 1, 0.3294118, 0, 1,
-1.640552, 1.729867, -0.7159064, 1, 0.3372549, 0, 1,
-1.639855, 0.8253967, -1.395656, 1, 0.3411765, 0, 1,
-1.608846, 0.1621545, -0.9245677, 1, 0.3490196, 0, 1,
-1.603449, -1.428793, -2.689888, 1, 0.3529412, 0, 1,
-1.602878, 0.8484349, -0.8742499, 1, 0.3607843, 0, 1,
-1.601833, -0.7501436, -2.909691, 1, 0.3647059, 0, 1,
-1.598755, 0.1201751, -2.663193, 1, 0.372549, 0, 1,
-1.586557, 0.09004176, -0.4028409, 1, 0.3764706, 0, 1,
-1.583278, 0.128042, -1.716309, 1, 0.3843137, 0, 1,
-1.582223, -2.093748, -0.9121835, 1, 0.3882353, 0, 1,
-1.575022, -1.861968, -3.365371, 1, 0.3960784, 0, 1,
-1.571456, 0.2485286, -3.627307, 1, 0.4039216, 0, 1,
-1.556628, -1.428694, -3.463696, 1, 0.4078431, 0, 1,
-1.551842, 2.024267, -2.025082, 1, 0.4156863, 0, 1,
-1.550274, -0.1603937, -1.274045, 1, 0.4196078, 0, 1,
-1.548273, -2.267503, -2.744359, 1, 0.427451, 0, 1,
-1.535625, 0.4397885, -0.5016861, 1, 0.4313726, 0, 1,
-1.532306, -0.7757154, -0.8086805, 1, 0.4392157, 0, 1,
-1.526137, 1.180447, -2.078834, 1, 0.4431373, 0, 1,
-1.52353, 0.7374361, -1.719933, 1, 0.4509804, 0, 1,
-1.501816, -0.937262, -4.396411, 1, 0.454902, 0, 1,
-1.501552, -0.3439945, -2.107216, 1, 0.4627451, 0, 1,
-1.453527, 0.293246, -2.269291, 1, 0.4666667, 0, 1,
-1.448607, 0.1140812, -2.82015, 1, 0.4745098, 0, 1,
-1.448078, -1.679625, -2.35609, 1, 0.4784314, 0, 1,
-1.434768, -1.138904, -2.813353, 1, 0.4862745, 0, 1,
-1.425689, -0.3211359, -1.658114, 1, 0.4901961, 0, 1,
-1.424495, -1.903917, -3.511737, 1, 0.4980392, 0, 1,
-1.420852, 0.5867088, -1.387484, 1, 0.5058824, 0, 1,
-1.408726, 1.337795, -0.2354409, 1, 0.509804, 0, 1,
-1.406976, -2.597144, -3.058722, 1, 0.5176471, 0, 1,
-1.389231, 0.6273782, -0.4472664, 1, 0.5215687, 0, 1,
-1.385786, 0.7970775, -1.640425, 1, 0.5294118, 0, 1,
-1.380987, -0.2371408, -2.330815, 1, 0.5333334, 0, 1,
-1.363101, 0.2853181, -1.367283, 1, 0.5411765, 0, 1,
-1.360964, -1.643157, -0.5618768, 1, 0.5450981, 0, 1,
-1.360745, -1.787485, -2.250091, 1, 0.5529412, 0, 1,
-1.358782, 0.6676292, -2.724898, 1, 0.5568628, 0, 1,
-1.352615, -0.0985612, -3.891307, 1, 0.5647059, 0, 1,
-1.337527, -1.937725, -1.685344, 1, 0.5686275, 0, 1,
-1.336802, -0.3344942, -2.224944, 1, 0.5764706, 0, 1,
-1.321936, -1.04522, -1.568205, 1, 0.5803922, 0, 1,
-1.316478, -0.5784157, -3.739101, 1, 0.5882353, 0, 1,
-1.31547, 1.60794, -0.7808111, 1, 0.5921569, 0, 1,
-1.315393, 0.9769993, -1.058797, 1, 0.6, 0, 1,
-1.312288, -0.9032166, -3.66632, 1, 0.6078432, 0, 1,
-1.308824, -1.846717, -2.910861, 1, 0.6117647, 0, 1,
-1.305172, 0.6000283, -1.326254, 1, 0.6196079, 0, 1,
-1.305094, -0.98415, -2.715798, 1, 0.6235294, 0, 1,
-1.301393, -0.7572282, -1.461021, 1, 0.6313726, 0, 1,
-1.298688, -1.578209, -3.012191, 1, 0.6352941, 0, 1,
-1.297276, -0.6677354, -2.141801, 1, 0.6431373, 0, 1,
-1.271006, 0.6547288, -1.278096, 1, 0.6470588, 0, 1,
-1.263423, -2.062061, -1.858346, 1, 0.654902, 0, 1,
-1.2473, -1.021741, -3.032135, 1, 0.6588235, 0, 1,
-1.247102, 0.5706663, -1.724153, 1, 0.6666667, 0, 1,
-1.239113, 0.007410653, -0.713357, 1, 0.6705883, 0, 1,
-1.232074, 1.790179, -1.174505, 1, 0.6784314, 0, 1,
-1.231204, 1.38965, -0.7909321, 1, 0.682353, 0, 1,
-1.221781, -0.5828821, -1.703956, 1, 0.6901961, 0, 1,
-1.217182, 0.8722482, 0.1308469, 1, 0.6941177, 0, 1,
-1.210137, 0.3087846, -1.480729, 1, 0.7019608, 0, 1,
-1.205368, -1.806857, -3.548752, 1, 0.7098039, 0, 1,
-1.20427, -1.790876, -1.955722, 1, 0.7137255, 0, 1,
-1.201789, -0.7187401, -1.821554, 1, 0.7215686, 0, 1,
-1.197095, -1.111447, -1.064412, 1, 0.7254902, 0, 1,
-1.193085, 0.780145, -0.9240414, 1, 0.7333333, 0, 1,
-1.189723, -0.3857051, -2.512109, 1, 0.7372549, 0, 1,
-1.185523, -0.2802553, -2.47934, 1, 0.7450981, 0, 1,
-1.184379, -0.2906714, -1.23932, 1, 0.7490196, 0, 1,
-1.176057, -0.004636756, 0.08987278, 1, 0.7568628, 0, 1,
-1.159273, 0.04579684, -0.4332941, 1, 0.7607843, 0, 1,
-1.155166, -0.2975836, -2.446973, 1, 0.7686275, 0, 1,
-1.148098, -0.3582107, 0.007147709, 1, 0.772549, 0, 1,
-1.145769, 0.03548828, -1.871038, 1, 0.7803922, 0, 1,
-1.139016, 0.5026144, -1.829863, 1, 0.7843137, 0, 1,
-1.136764, -0.07826523, -1.401395, 1, 0.7921569, 0, 1,
-1.131465, -0.09152953, -0.8724651, 1, 0.7960784, 0, 1,
-1.128718, -0.1857278, -1.240221, 1, 0.8039216, 0, 1,
-1.123897, 1.372011, -1.71367, 1, 0.8117647, 0, 1,
-1.123328, 0.2384446, 0.6054069, 1, 0.8156863, 0, 1,
-1.103908, -0.3285515, -0.9595971, 1, 0.8235294, 0, 1,
-1.102636, 0.5139592, 0.5393039, 1, 0.827451, 0, 1,
-1.098254, 1.049829, -0.7426129, 1, 0.8352941, 0, 1,
-1.09781, 0.3948759, -1.042586, 1, 0.8392157, 0, 1,
-1.093222, -0.4750557, -0.9882814, 1, 0.8470588, 0, 1,
-1.091463, -2.712703, -2.002731, 1, 0.8509804, 0, 1,
-1.09141, -0.8559439, -2.278677, 1, 0.8588235, 0, 1,
-1.079533, -0.6616232, -2.089854, 1, 0.8627451, 0, 1,
-1.069982, 0.1518549, -2.668925, 1, 0.8705882, 0, 1,
-1.067961, -0.5174608, -3.580322, 1, 0.8745098, 0, 1,
-1.067429, 1.305319, -1.914052, 1, 0.8823529, 0, 1,
-1.066886, 0.5781022, -1.372604, 1, 0.8862745, 0, 1,
-1.066478, 0.3925689, -1.125668, 1, 0.8941177, 0, 1,
-1.066346, 0.02257804, -3.445999, 1, 0.8980392, 0, 1,
-1.064038, 0.172771, -1.059042, 1, 0.9058824, 0, 1,
-1.060844, 0.6905982, -1.248494, 1, 0.9137255, 0, 1,
-1.058495, 0.5913095, -1.554664, 1, 0.9176471, 0, 1,
-1.051739, -0.6652252, -0.9208589, 1, 0.9254902, 0, 1,
-1.051431, -0.7983341, -0.9036444, 1, 0.9294118, 0, 1,
-1.042332, -0.5453898, -2.604142, 1, 0.9372549, 0, 1,
-1.034454, -0.7352725, -0.8605192, 1, 0.9411765, 0, 1,
-1.031249, -1.58695, -1.61, 1, 0.9490196, 0, 1,
-1.022936, -0.5657058, -2.361803, 1, 0.9529412, 0, 1,
-1.017136, -0.4577295, -1.91339, 1, 0.9607843, 0, 1,
-1.002782, -0.3240111, -1.970164, 1, 0.9647059, 0, 1,
-1.000092, -1.167245, -0.7094473, 1, 0.972549, 0, 1,
-0.9923163, 0.8172539, -0.5941228, 1, 0.9764706, 0, 1,
-0.9867731, 0.8013856, -1.08535, 1, 0.9843137, 0, 1,
-0.981418, -1.642575, -2.117482, 1, 0.9882353, 0, 1,
-0.980038, 1.456031, -0.6373645, 1, 0.9960784, 0, 1,
-0.9787058, 0.2630505, -1.484241, 0.9960784, 1, 0, 1,
-0.9774116, 0.3418996, -0.538524, 0.9921569, 1, 0, 1,
-0.9634002, 0.04596961, -2.171786, 0.9843137, 1, 0, 1,
-0.9604332, 1.147838, -0.7694775, 0.9803922, 1, 0, 1,
-0.9592636, -0.8022352, -0.74379, 0.972549, 1, 0, 1,
-0.9499161, -1.79586, -2.502028, 0.9686275, 1, 0, 1,
-0.9468322, -0.8280944, -3.260068, 0.9607843, 1, 0, 1,
-0.9443394, 1.222906, -0.7780566, 0.9568627, 1, 0, 1,
-0.9409452, 1.471541, -2.375648, 0.9490196, 1, 0, 1,
-0.9398701, 1.632468, -1.695171, 0.945098, 1, 0, 1,
-0.9379091, -0.4648187, -0.7455068, 0.9372549, 1, 0, 1,
-0.9372291, -0.5523654, -0.4706088, 0.9333333, 1, 0, 1,
-0.9351509, 0.0483768, -3.356725, 0.9254902, 1, 0, 1,
-0.9231682, 0.2416809, -2.777401, 0.9215686, 1, 0, 1,
-0.9230359, 0.2725339, 0.06912398, 0.9137255, 1, 0, 1,
-0.9207119, -0.987139, -2.220131, 0.9098039, 1, 0, 1,
-0.9161874, 0.5067819, -0.966108, 0.9019608, 1, 0, 1,
-0.9041298, -0.4473116, -1.76394, 0.8941177, 1, 0, 1,
-0.9000514, -1.298702, -3.296071, 0.8901961, 1, 0, 1,
-0.8978633, 0.06411497, -0.9203825, 0.8823529, 1, 0, 1,
-0.8978019, -0.6850774, -1.290842, 0.8784314, 1, 0, 1,
-0.8937175, 0.04028252, -2.255474, 0.8705882, 1, 0, 1,
-0.8933673, 0.7548097, -1.660704, 0.8666667, 1, 0, 1,
-0.890241, -0.290595, -1.459353, 0.8588235, 1, 0, 1,
-0.8882724, -1.260742, -1.529224, 0.854902, 1, 0, 1,
-0.8874213, -1.774758, -2.285287, 0.8470588, 1, 0, 1,
-0.8803435, -0.1558177, -1.40127, 0.8431373, 1, 0, 1,
-0.8741447, 1.969862, -0.465338, 0.8352941, 1, 0, 1,
-0.8668363, 0.3394425, -1.638997, 0.8313726, 1, 0, 1,
-0.866626, -0.1330121, -1.645925, 0.8235294, 1, 0, 1,
-0.8663364, 2.264033, 0.4675162, 0.8196079, 1, 0, 1,
-0.8560246, -0.9575659, -1.939887, 0.8117647, 1, 0, 1,
-0.8551571, -0.3803589, -2.197293, 0.8078431, 1, 0, 1,
-0.8503927, 0.2264532, -1.233203, 0.8, 1, 0, 1,
-0.8442674, -0.8412134, -1.710013, 0.7921569, 1, 0, 1,
-0.8435397, -0.8646347, -3.037898, 0.7882353, 1, 0, 1,
-0.8394122, 1.323375, 0.2063978, 0.7803922, 1, 0, 1,
-0.8325562, 0.7368501, -0.4433854, 0.7764706, 1, 0, 1,
-0.8299636, 0.9734664, 0.01242659, 0.7686275, 1, 0, 1,
-0.819643, -2.066838, -1.959714, 0.7647059, 1, 0, 1,
-0.8111889, 0.7922044, -1.21747, 0.7568628, 1, 0, 1,
-0.8083797, -0.02915699, 0.331273, 0.7529412, 1, 0, 1,
-0.8067789, -2.425833, -1.488893, 0.7450981, 1, 0, 1,
-0.806017, 0.2734833, -0.08036131, 0.7411765, 1, 0, 1,
-0.8043146, 0.7428004, 0.4744928, 0.7333333, 1, 0, 1,
-0.7988259, -1.561333, -3.865527, 0.7294118, 1, 0, 1,
-0.7934098, -0.5488892, -2.41563, 0.7215686, 1, 0, 1,
-0.7914457, 0.8212149, -1.918441, 0.7176471, 1, 0, 1,
-0.7896506, 0.8778827, -2.243047, 0.7098039, 1, 0, 1,
-0.7886254, 0.3897593, -2.245533, 0.7058824, 1, 0, 1,
-0.785919, -0.1363148, -1.390865, 0.6980392, 1, 0, 1,
-0.7773832, -0.397689, -1.961656, 0.6901961, 1, 0, 1,
-0.7771657, -1.889266, -1.793658, 0.6862745, 1, 0, 1,
-0.7685652, -0.7351866, -1.830989, 0.6784314, 1, 0, 1,
-0.767445, -0.5413454, -1.53497, 0.6745098, 1, 0, 1,
-0.7631052, 0.4434075, -0.539615, 0.6666667, 1, 0, 1,
-0.7597635, 0.3343966, -0.3610409, 0.6627451, 1, 0, 1,
-0.7562574, -1.294816, -1.815844, 0.654902, 1, 0, 1,
-0.7539015, 0.5019473, -0.7688704, 0.6509804, 1, 0, 1,
-0.7514433, 0.7900181, -0.8209888, 0.6431373, 1, 0, 1,
-0.7487296, 1.901887, -1.67616, 0.6392157, 1, 0, 1,
-0.7482317, 0.4490476, -1.018954, 0.6313726, 1, 0, 1,
-0.7453328, 0.3719489, -0.05080406, 0.627451, 1, 0, 1,
-0.7423676, -0.7889656, -2.244726, 0.6196079, 1, 0, 1,
-0.7346364, -1.319308, -1.338662, 0.6156863, 1, 0, 1,
-0.7298697, -0.4390801, -2.083076, 0.6078432, 1, 0, 1,
-0.7297529, -0.7678208, -2.781673, 0.6039216, 1, 0, 1,
-0.7250978, 0.2472025, -2.559864, 0.5960785, 1, 0, 1,
-0.7228069, -0.3358921, -2.519959, 0.5882353, 1, 0, 1,
-0.7189846, -2.089844, -3.967811, 0.5843138, 1, 0, 1,
-0.7185751, -0.6789079, -1.879581, 0.5764706, 1, 0, 1,
-0.716813, -0.2366598, -0.2966399, 0.572549, 1, 0, 1,
-0.7024658, 0.3547744, -1.93965, 0.5647059, 1, 0, 1,
-0.6967102, 0.2156817, -0.9696983, 0.5607843, 1, 0, 1,
-0.6939068, -0.8464113, -3.441987, 0.5529412, 1, 0, 1,
-0.6890371, -0.07106455, -1.015408, 0.5490196, 1, 0, 1,
-0.6860975, -1.579083, -3.723058, 0.5411765, 1, 0, 1,
-0.6836603, -1.104012, -2.263066, 0.5372549, 1, 0, 1,
-0.6835568, 0.4646892, -2.110212, 0.5294118, 1, 0, 1,
-0.6731535, 1.334268, -0.1453207, 0.5254902, 1, 0, 1,
-0.6704252, -0.1230417, -0.7391548, 0.5176471, 1, 0, 1,
-0.668912, -0.4976885, -2.663376, 0.5137255, 1, 0, 1,
-0.6649616, 0.1275036, -3.026844, 0.5058824, 1, 0, 1,
-0.6596817, -0.6234416, -5.217795, 0.5019608, 1, 0, 1,
-0.6557776, -0.8845425, -2.45656, 0.4941176, 1, 0, 1,
-0.6551216, -0.3644642, -2.033105, 0.4862745, 1, 0, 1,
-0.6511239, 0.105493, -0.8275048, 0.4823529, 1, 0, 1,
-0.6484423, 0.1050986, 1.789763, 0.4745098, 1, 0, 1,
-0.6441969, -0.2880584, -0.7805561, 0.4705882, 1, 0, 1,
-0.6396316, 0.1200293, -1.375166, 0.4627451, 1, 0, 1,
-0.6391084, -1.121701, -4.799246, 0.4588235, 1, 0, 1,
-0.6361268, 0.08848149, -0.7634252, 0.4509804, 1, 0, 1,
-0.6351056, -0.4243011, -1.911131, 0.4470588, 1, 0, 1,
-0.6320617, 0.4262092, -2.17444, 0.4392157, 1, 0, 1,
-0.6227694, 1.393157, 0.7909486, 0.4352941, 1, 0, 1,
-0.6203436, 0.5330036, -0.7081053, 0.427451, 1, 0, 1,
-0.6175597, -0.6287149, -1.556873, 0.4235294, 1, 0, 1,
-0.6121434, -1.478013, -1.459336, 0.4156863, 1, 0, 1,
-0.6096324, 0.4502826, -1.479435, 0.4117647, 1, 0, 1,
-0.6095491, 0.660316, -0.09613153, 0.4039216, 1, 0, 1,
-0.6078321, 1.052763, 0.8672311, 0.3960784, 1, 0, 1,
-0.6074924, 0.02947869, -1.096985, 0.3921569, 1, 0, 1,
-0.6074124, 1.153681, 0.2466553, 0.3843137, 1, 0, 1,
-0.606613, 0.2769251, -1.730659, 0.3803922, 1, 0, 1,
-0.6048058, -0.2920276, -2.033921, 0.372549, 1, 0, 1,
-0.6044319, 0.2961342, -1.348844, 0.3686275, 1, 0, 1,
-0.6032742, 0.3993759, -2.040113, 0.3607843, 1, 0, 1,
-0.602896, 0.1753773, -0.6246369, 0.3568628, 1, 0, 1,
-0.6024458, -0.9033195, -2.248557, 0.3490196, 1, 0, 1,
-0.6014592, -0.3232506, -1.580956, 0.345098, 1, 0, 1,
-0.6003843, 1.155627, -1.758301, 0.3372549, 1, 0, 1,
-0.5991246, 0.117954, -1.744543, 0.3333333, 1, 0, 1,
-0.5894024, 0.3207375, -1.374452, 0.3254902, 1, 0, 1,
-0.5855919, 0.1554312, -2.279505, 0.3215686, 1, 0, 1,
-0.5848629, 1.74954, -2.135366, 0.3137255, 1, 0, 1,
-0.5840262, -1.593965, -3.153018, 0.3098039, 1, 0, 1,
-0.5835412, -1.002069, -1.185811, 0.3019608, 1, 0, 1,
-0.578688, 1.095233, 0.9124034, 0.2941177, 1, 0, 1,
-0.5780551, 0.1765452, -0.4894817, 0.2901961, 1, 0, 1,
-0.5758125, -0.8202019, -2.917428, 0.282353, 1, 0, 1,
-0.5754388, 0.8086013, -1.440887, 0.2784314, 1, 0, 1,
-0.5744361, -0.3417054, -1.813794, 0.2705882, 1, 0, 1,
-0.5713372, 0.3918545, -1.45507, 0.2666667, 1, 0, 1,
-0.5647138, 1.002596, -0.5672658, 0.2588235, 1, 0, 1,
-0.5624207, -0.1453903, -0.8142716, 0.254902, 1, 0, 1,
-0.5594321, 0.9116154, 0.3784327, 0.2470588, 1, 0, 1,
-0.5556033, -0.7403693, -2.218523, 0.2431373, 1, 0, 1,
-0.5555226, -0.6535365, -3.023189, 0.2352941, 1, 0, 1,
-0.5554457, -0.09189348, -1.668492, 0.2313726, 1, 0, 1,
-0.5535474, -0.08780213, -3.003728, 0.2235294, 1, 0, 1,
-0.5490325, -1.031915, -1.033428, 0.2196078, 1, 0, 1,
-0.5456569, 0.7427177, -1.109653, 0.2117647, 1, 0, 1,
-0.545577, -0.7292863, -0.9898148, 0.2078431, 1, 0, 1,
-0.5447531, 0.08155039, -2.398413, 0.2, 1, 0, 1,
-0.5427833, 1.150978, 0.1813472, 0.1921569, 1, 0, 1,
-0.5406987, -0.9433064, -1.338524, 0.1882353, 1, 0, 1,
-0.5350276, 0.9391502, -0.9528176, 0.1803922, 1, 0, 1,
-0.5348738, -1.704285, -2.80608, 0.1764706, 1, 0, 1,
-0.5346587, 0.1356423, -0.3965062, 0.1686275, 1, 0, 1,
-0.5339258, 0.1849377, -3.219553, 0.1647059, 1, 0, 1,
-0.5303772, 1.235029, -0.2327293, 0.1568628, 1, 0, 1,
-0.5261437, -0.2024871, -0.9536899, 0.1529412, 1, 0, 1,
-0.5187718, 0.6317346, 0.3702135, 0.145098, 1, 0, 1,
-0.5148031, 1.126805, 0.4687977, 0.1411765, 1, 0, 1,
-0.5142645, -0.6567366, -1.388963, 0.1333333, 1, 0, 1,
-0.5140291, 0.1235652, -1.405051, 0.1294118, 1, 0, 1,
-0.5110238, 1.423559, -0.07206134, 0.1215686, 1, 0, 1,
-0.5107564, 0.3788921, -0.7624506, 0.1176471, 1, 0, 1,
-0.5097129, -0.98542, -1.604796, 0.1098039, 1, 0, 1,
-0.507039, 0.2118221, -2.043853, 0.1058824, 1, 0, 1,
-0.5013732, 0.1150483, -1.426209, 0.09803922, 1, 0, 1,
-0.499384, 0.2890751, -1.495277, 0.09019608, 1, 0, 1,
-0.4990814, 0.03390735, -2.05043, 0.08627451, 1, 0, 1,
-0.4989869, 0.1990378, -2.78944, 0.07843138, 1, 0, 1,
-0.4952058, 1.237376, 0.0618953, 0.07450981, 1, 0, 1,
-0.4896972, -0.3206352, -1.87527, 0.06666667, 1, 0, 1,
-0.4880319, -0.7900029, -3.655596, 0.0627451, 1, 0, 1,
-0.4858266, 0.7267163, -1.436551, 0.05490196, 1, 0, 1,
-0.4836867, 0.7340358, -0.681753, 0.05098039, 1, 0, 1,
-0.4833758, -1.957299, -3.620367, 0.04313726, 1, 0, 1,
-0.4768018, -0.9238198, -2.769805, 0.03921569, 1, 0, 1,
-0.466991, 0.5634338, -1.052417, 0.03137255, 1, 0, 1,
-0.4520737, -1.01232, -4.498196, 0.02745098, 1, 0, 1,
-0.4491183, 0.5039961, 0.4200552, 0.01960784, 1, 0, 1,
-0.4468901, 0.9440119, 0.4721311, 0.01568628, 1, 0, 1,
-0.4454322, 1.279879, -0.9448853, 0.007843138, 1, 0, 1,
-0.4448134, -1.341544, -1.943962, 0.003921569, 1, 0, 1,
-0.4438736, -0.1324457, -3.228025, 0, 1, 0.003921569, 1,
-0.4409456, -0.1623111, -1.69165, 0, 1, 0.01176471, 1,
-0.4359611, -1.153147, -5.622918, 0, 1, 0.01568628, 1,
-0.4337416, -0.2498208, -1.685816, 0, 1, 0.02352941, 1,
-0.4326903, 0.3841914, -0.3790972, 0, 1, 0.02745098, 1,
-0.4305938, 0.02768326, -1.088337, 0, 1, 0.03529412, 1,
-0.4296833, -0.3401676, -1.08383, 0, 1, 0.03921569, 1,
-0.4288465, -0.6227411, -2.482807, 0, 1, 0.04705882, 1,
-0.4271558, -1.200804, -0.815693, 0, 1, 0.05098039, 1,
-0.4215019, -0.467878, -2.6153, 0, 1, 0.05882353, 1,
-0.4205845, -0.8133668, -2.371248, 0, 1, 0.0627451, 1,
-0.4203175, -1.405458, -1.733193, 0, 1, 0.07058824, 1,
-0.4195436, -0.04887869, -2.063732, 0, 1, 0.07450981, 1,
-0.4162896, 0.4098119, -0.2049689, 0, 1, 0.08235294, 1,
-0.4162011, -0.2863148, -1.441115, 0, 1, 0.08627451, 1,
-0.4103247, -0.06431066, -2.239416, 0, 1, 0.09411765, 1,
-0.4088947, -1.238186, -3.202143, 0, 1, 0.1019608, 1,
-0.408561, 0.7961586, -0.2864291, 0, 1, 0.1058824, 1,
-0.4079061, 0.2269046, -2.386207, 0, 1, 0.1137255, 1,
-0.4076486, -1.073555, -1.760522, 0, 1, 0.1176471, 1,
-0.40398, -0.01269349, -3.177375, 0, 1, 0.1254902, 1,
-0.4021101, -0.2221321, -1.102894, 0, 1, 0.1294118, 1,
-0.3964455, -0.1108155, -0.7605199, 0, 1, 0.1372549, 1,
-0.396377, 0.6670521, -1.055702, 0, 1, 0.1411765, 1,
-0.3851175, 1.934648, -1.10309, 0, 1, 0.1490196, 1,
-0.3831834, 0.7096365, -0.8203247, 0, 1, 0.1529412, 1,
-0.3825724, -1.054742, -3.361372, 0, 1, 0.1607843, 1,
-0.380989, -1.297668, -1.439391, 0, 1, 0.1647059, 1,
-0.3723675, -1.273504, -3.214089, 0, 1, 0.172549, 1,
-0.3721164, 1.15681, 0.2981138, 0, 1, 0.1764706, 1,
-0.3711663, -1.353449, -3.553733, 0, 1, 0.1843137, 1,
-0.3706901, 1.371377, -0.4514176, 0, 1, 0.1882353, 1,
-0.3705215, -1.429607, -3.817859, 0, 1, 0.1960784, 1,
-0.3700241, 2.086055, -0.8579654, 0, 1, 0.2039216, 1,
-0.3669712, 1.994737, -0.08501551, 0, 1, 0.2078431, 1,
-0.3669118, -0.6640766, -3.664601, 0, 1, 0.2156863, 1,
-0.3653209, 0.009383949, -1.500826, 0, 1, 0.2196078, 1,
-0.3631819, -0.5697334, 0.06380914, 0, 1, 0.227451, 1,
-0.3540296, 0.1238855, -0.6492025, 0, 1, 0.2313726, 1,
-0.3466283, -1.387992, -1.350064, 0, 1, 0.2392157, 1,
-0.3459786, 1.15929, -0.8675831, 0, 1, 0.2431373, 1,
-0.3419609, -0.8145577, -2.145109, 0, 1, 0.2509804, 1,
-0.3412422, -0.1495121, -2.160944, 0, 1, 0.254902, 1,
-0.3345665, -1.205917, -3.931607, 0, 1, 0.2627451, 1,
-0.3329192, -0.1715058, -1.627019, 0, 1, 0.2666667, 1,
-0.3321663, 0.3404364, -0.366249, 0, 1, 0.2745098, 1,
-0.3318384, 1.35904, -0.1400254, 0, 1, 0.2784314, 1,
-0.3251263, -0.0867517, -1.292017, 0, 1, 0.2862745, 1,
-0.3204917, 0.3710456, 0.3353, 0, 1, 0.2901961, 1,
-0.3135587, 0.3139749, -0.330227, 0, 1, 0.2980392, 1,
-0.3117705, -0.7529531, -1.956782, 0, 1, 0.3058824, 1,
-0.3083133, 0.731259, -0.0332131, 0, 1, 0.3098039, 1,
-0.3062696, 1.398062, -0.477467, 0, 1, 0.3176471, 1,
-0.3050387, -0.0100611, -2.683064, 0, 1, 0.3215686, 1,
-0.305018, -0.8399428, -1.818272, 0, 1, 0.3294118, 1,
-0.3049493, 0.2885382, -0.8345297, 0, 1, 0.3333333, 1,
-0.3041413, -0.4768451, -3.556961, 0, 1, 0.3411765, 1,
-0.3031957, 0.06942967, -0.2311014, 0, 1, 0.345098, 1,
-0.2951939, -0.497139, -4.169077, 0, 1, 0.3529412, 1,
-0.2951238, -0.4973528, -2.867186, 0, 1, 0.3568628, 1,
-0.2920357, -0.05823008, 0.02968496, 0, 1, 0.3647059, 1,
-0.2914841, -0.6577831, -2.200998, 0, 1, 0.3686275, 1,
-0.289975, -0.3402209, -2.848872, 0, 1, 0.3764706, 1,
-0.2877429, -0.3944765, -1.836165, 0, 1, 0.3803922, 1,
-0.2839223, -0.3731753, -3.61856, 0, 1, 0.3882353, 1,
-0.2776071, -1.29933, -3.811788, 0, 1, 0.3921569, 1,
-0.2769736, 0.6599187, -1.414257, 0, 1, 0.4, 1,
-0.2762267, 1.28985, -1.93551, 0, 1, 0.4078431, 1,
-0.2739411, 0.1623995, -0.3767365, 0, 1, 0.4117647, 1,
-0.272774, -0.3205211, -3.165356, 0, 1, 0.4196078, 1,
-0.2707479, 1.096232, -0.6929142, 0, 1, 0.4235294, 1,
-0.2626393, 1.430732, 1.348578, 0, 1, 0.4313726, 1,
-0.2620729, -2.193858, -2.13667, 0, 1, 0.4352941, 1,
-0.260551, 0.2351502, 0.3966746, 0, 1, 0.4431373, 1,
-0.2603187, -0.7894275, -5.236126, 0, 1, 0.4470588, 1,
-0.2589171, 0.7998829, -1.075621, 0, 1, 0.454902, 1,
-0.2549764, 0.4236602, 0.3545243, 0, 1, 0.4588235, 1,
-0.2541605, -0.3219789, -1.931435, 0, 1, 0.4666667, 1,
-0.2438536, 2.831676, 1.176663, 0, 1, 0.4705882, 1,
-0.2434153, -0.8662694, -3.132319, 0, 1, 0.4784314, 1,
-0.2433991, 0.4775201, 0.07380691, 0, 1, 0.4823529, 1,
-0.2395967, 1.343582, 0.3204389, 0, 1, 0.4901961, 1,
-0.2325675, -1.45022, -1.691744, 0, 1, 0.4941176, 1,
-0.2267082, -1.946225, -3.45436, 0, 1, 0.5019608, 1,
-0.2249379, -0.9748644, -3.591021, 0, 1, 0.509804, 1,
-0.2247196, -0.0475889, -1.306803, 0, 1, 0.5137255, 1,
-0.2229867, 1.815086, -0.01251781, 0, 1, 0.5215687, 1,
-0.2223641, 1.814314, 0.6141406, 0, 1, 0.5254902, 1,
-0.2124711, 0.7607729, -0.4276891, 0, 1, 0.5333334, 1,
-0.2115064, 0.1013432, -0.4748376, 0, 1, 0.5372549, 1,
-0.2104236, 0.6354542, 0.7862194, 0, 1, 0.5450981, 1,
-0.2092338, -0.06216352, -1.402537, 0, 1, 0.5490196, 1,
-0.2072925, -1.927015, -4.45399, 0, 1, 0.5568628, 1,
-0.2048561, 0.415038, 0.2803713, 0, 1, 0.5607843, 1,
-0.1985094, 0.0466828, -3.252866, 0, 1, 0.5686275, 1,
-0.1971883, -0.9989554, -3.02113, 0, 1, 0.572549, 1,
-0.1848959, -0.1291073, -3.935723, 0, 1, 0.5803922, 1,
-0.1832982, 0.8913942, 0.3280746, 0, 1, 0.5843138, 1,
-0.1829527, 1.375346, -0.4127585, 0, 1, 0.5921569, 1,
-0.1808824, -0.6779098, -4.193074, 0, 1, 0.5960785, 1,
-0.1784433, -0.03954507, -1.442715, 0, 1, 0.6039216, 1,
-0.1744741, 0.2653321, -0.463899, 0, 1, 0.6117647, 1,
-0.173392, -1.533504, -3.015467, 0, 1, 0.6156863, 1,
-0.1721986, 0.2066068, 0.8372856, 0, 1, 0.6235294, 1,
-0.1716907, -0.4231726, -3.252343, 0, 1, 0.627451, 1,
-0.1704772, 0.1679009, -2.427219, 0, 1, 0.6352941, 1,
-0.1682567, -0.5318528, -3.17033, 0, 1, 0.6392157, 1,
-0.1660928, -0.04310155, -2.968613, 0, 1, 0.6470588, 1,
-0.1655905, 0.006591882, -1.797914, 0, 1, 0.6509804, 1,
-0.1647962, 0.4448512, 0.169617, 0, 1, 0.6588235, 1,
-0.1646063, -0.7183195, -3.438695, 0, 1, 0.6627451, 1,
-0.1633378, 0.8782886, -0.3761054, 0, 1, 0.6705883, 1,
-0.1631646, 0.3298875, -0.3036571, 0, 1, 0.6745098, 1,
-0.154446, 0.09369351, -0.5751034, 0, 1, 0.682353, 1,
-0.1438549, 0.4682534, -0.08143011, 0, 1, 0.6862745, 1,
-0.1413837, 1.532152, -1.664525, 0, 1, 0.6941177, 1,
-0.1411194, 2.336756, 0.2699828, 0, 1, 0.7019608, 1,
-0.1395987, 2.409361, 1.128392, 0, 1, 0.7058824, 1,
-0.1235843, -0.3711583, -2.544341, 0, 1, 0.7137255, 1,
-0.123123, 0.2418356, -1.986935, 0, 1, 0.7176471, 1,
-0.1230021, -1.041701, -4.427411, 0, 1, 0.7254902, 1,
-0.1188269, -1.094237, -3.917536, 0, 1, 0.7294118, 1,
-0.1167825, 0.1041544, -0.7139276, 0, 1, 0.7372549, 1,
-0.116531, 0.005239312, -0.7416001, 0, 1, 0.7411765, 1,
-0.1137737, 0.8330809, -0.1572348, 0, 1, 0.7490196, 1,
-0.1124902, -0.06524611, -3.433407, 0, 1, 0.7529412, 1,
-0.109448, 0.1478385, -1.82993, 0, 1, 0.7607843, 1,
-0.108193, 0.1348651, -0.3893498, 0, 1, 0.7647059, 1,
-0.1056987, 0.2017803, 3.461739, 0, 1, 0.772549, 1,
-0.1017429, 0.2514736, -1.721723, 0, 1, 0.7764706, 1,
-0.1014941, -1.336726, -1.524034, 0, 1, 0.7843137, 1,
-0.1009213, -0.04152567, -0.5409315, 0, 1, 0.7882353, 1,
-0.1007658, -2.408279, -3.622395, 0, 1, 0.7960784, 1,
-0.09917578, 2.023857, 0.8207494, 0, 1, 0.8039216, 1,
-0.09856125, -0.6916523, -3.457034, 0, 1, 0.8078431, 1,
-0.08971764, 0.743673, -1.321559, 0, 1, 0.8156863, 1,
-0.08359842, 0.7777588, 0.2927491, 0, 1, 0.8196079, 1,
-0.07747378, -0.1326088, -4.472879, 0, 1, 0.827451, 1,
-0.07407623, 1.086293, -0.6725001, 0, 1, 0.8313726, 1,
-0.07203215, 0.6982924, -0.04659485, 0, 1, 0.8392157, 1,
-0.07121055, -1.154193, -2.575003, 0, 1, 0.8431373, 1,
-0.0640218, 0.9440161, 1.371222, 0, 1, 0.8509804, 1,
-0.06181137, -0.1272579, -3.904805, 0, 1, 0.854902, 1,
-0.05977549, 0.1599185, 0.7727477, 0, 1, 0.8627451, 1,
-0.05948519, -0.3806395, -2.354148, 0, 1, 0.8666667, 1,
-0.05942527, -1.187686, -3.096519, 0, 1, 0.8745098, 1,
-0.05782262, -1.294313, -3.195292, 0, 1, 0.8784314, 1,
-0.05654094, -0.08660285, -2.722722, 0, 1, 0.8862745, 1,
-0.05625531, 0.7552322, 0.02800196, 0, 1, 0.8901961, 1,
-0.05585256, 1.361893, 0.7480347, 0, 1, 0.8980392, 1,
-0.05557464, 0.502645, -0.1574485, 0, 1, 0.9058824, 1,
-0.05541096, 0.1289746, -2.052998, 0, 1, 0.9098039, 1,
-0.05516302, 0.2124854, 0.5945143, 0, 1, 0.9176471, 1,
-0.0540246, -1.281905, -2.320568, 0, 1, 0.9215686, 1,
-0.04623489, -0.1457173, -1.600116, 0, 1, 0.9294118, 1,
-0.04362036, 0.5478897, 0.5092743, 0, 1, 0.9333333, 1,
-0.04330508, -1.344313, -3.075211, 0, 1, 0.9411765, 1,
-0.03683923, -1.631979, -2.72004, 0, 1, 0.945098, 1,
-0.03570517, -0.9610171, -4.282121, 0, 1, 0.9529412, 1,
-0.02976581, 0.8758211, 0.6004435, 0, 1, 0.9568627, 1,
-0.02948893, 0.6714125, -0.2906732, 0, 1, 0.9647059, 1,
-0.02833039, -0.5017715, -1.777609, 0, 1, 0.9686275, 1,
-0.02808419, -1.89329, -3.086655, 0, 1, 0.9764706, 1,
-0.02630332, 1.01051, 0.7340377, 0, 1, 0.9803922, 1,
-0.02607954, -0.3438478, -1.517305, 0, 1, 0.9882353, 1,
-0.02194013, -1.043488, -2.212719, 0, 1, 0.9921569, 1,
-0.02043039, -0.1830599, -2.210349, 0, 1, 1, 1,
-0.01787858, 0.7615063, -0.4766781, 0, 0.9921569, 1, 1,
-0.01533108, -0.8009955, -4.472993, 0, 0.9882353, 1, 1,
-0.01319907, -0.7130105, -4.536853, 0, 0.9803922, 1, 1,
-0.01234807, -0.8553839, -2.781672, 0, 0.9764706, 1, 1,
-0.01165381, -0.2726456, -3.163562, 0, 0.9686275, 1, 1,
-0.007702882, -0.6524964, -3.25214, 0, 0.9647059, 1, 1,
-0.007620106, -0.5138741, -3.947887, 0, 0.9568627, 1, 1,
-0.00732688, -0.7787979, -3.500764, 0, 0.9529412, 1, 1,
-0.006924822, -1.407358, -4.615728, 0, 0.945098, 1, 1,
-0.003929144, 0.9212154, -0.2846432, 0, 0.9411765, 1, 1,
-0.002920084, 0.3523321, 1.406831, 0, 0.9333333, 1, 1,
-0.002397033, -1.324194, -3.218198, 0, 0.9294118, 1, 1,
-0.0016968, -0.87797, -1.903884, 0, 0.9215686, 1, 1,
0.003632512, -1.349315, 2.060559, 0, 0.9176471, 1, 1,
0.007259936, 0.1467969, 0.6949567, 0, 0.9098039, 1, 1,
0.007712818, 0.9408925, -0.2574584, 0, 0.9058824, 1, 1,
0.008054644, -0.1984507, 1.600908, 0, 0.8980392, 1, 1,
0.009095388, -0.4310336, 2.995424, 0, 0.8901961, 1, 1,
0.01140577, -1.007197, 3.575915, 0, 0.8862745, 1, 1,
0.02387108, 1.965214, 2.056551, 0, 0.8784314, 1, 1,
0.0261922, -0.3116436, 3.889406, 0, 0.8745098, 1, 1,
0.02774349, -0.06603354, 3.043416, 0, 0.8666667, 1, 1,
0.02832756, 1.018249, 0.2549507, 0, 0.8627451, 1, 1,
0.03110952, -0.2306381, 3.803814, 0, 0.854902, 1, 1,
0.03236357, 0.5201743, 0.7992319, 0, 0.8509804, 1, 1,
0.03421754, -0.04897983, 2.397745, 0, 0.8431373, 1, 1,
0.0411405, -0.5401294, 1.807382, 0, 0.8392157, 1, 1,
0.04697685, -0.0688777, 3.568315, 0, 0.8313726, 1, 1,
0.0505621, -1.539444, 2.654199, 0, 0.827451, 1, 1,
0.05320453, 1.389253, -0.6810162, 0, 0.8196079, 1, 1,
0.05636308, -0.06161701, 2.032598, 0, 0.8156863, 1, 1,
0.05987471, -2.104141, 3.494463, 0, 0.8078431, 1, 1,
0.06097217, 1.114949, 0.2326761, 0, 0.8039216, 1, 1,
0.06508756, 0.8189996, 0.3946398, 0, 0.7960784, 1, 1,
0.065644, 0.2067622, -0.9156617, 0, 0.7882353, 1, 1,
0.06681032, -0.2195172, 1.701396, 0, 0.7843137, 1, 1,
0.06722803, 1.040626, -0.111639, 0, 0.7764706, 1, 1,
0.07034402, 0.0571718, 0.9257711, 0, 0.772549, 1, 1,
0.07359581, 0.6612161, -0.3800114, 0, 0.7647059, 1, 1,
0.07710062, 1.657751, 1.681484, 0, 0.7607843, 1, 1,
0.07765142, -0.01005966, 2.076829, 0, 0.7529412, 1, 1,
0.08206851, -0.2466424, 4.379032, 0, 0.7490196, 1, 1,
0.08294868, 1.421237, 3.609399, 0, 0.7411765, 1, 1,
0.09015131, 0.09006608, 1.518425, 0, 0.7372549, 1, 1,
0.09807615, 0.5611092, -0.1684725, 0, 0.7294118, 1, 1,
0.1083122, -0.101357, 3.068115, 0, 0.7254902, 1, 1,
0.1239108, 1.74321, -1.096241, 0, 0.7176471, 1, 1,
0.1324577, -0.7624246, 3.146753, 0, 0.7137255, 1, 1,
0.1328299, -0.740296, 4.693089, 0, 0.7058824, 1, 1,
0.1332236, 0.3242771, -0.1987223, 0, 0.6980392, 1, 1,
0.1343418, -1.426349, 1.977461, 0, 0.6941177, 1, 1,
0.1370099, 0.2211753, 0.8153221, 0, 0.6862745, 1, 1,
0.1372212, 0.4632279, 1.53572, 0, 0.682353, 1, 1,
0.1374351, -0.2605415, 1.082325, 0, 0.6745098, 1, 1,
0.1380939, 1.610615, -0.5076818, 0, 0.6705883, 1, 1,
0.1428241, -0.05108809, 0.7255089, 0, 0.6627451, 1, 1,
0.1456704, -0.2570147, 1.206621, 0, 0.6588235, 1, 1,
0.1474164, -1.898533, 3.948002, 0, 0.6509804, 1, 1,
0.1498153, -0.3388519, 4.225433, 0, 0.6470588, 1, 1,
0.1507404, 1.297611, 0.3241084, 0, 0.6392157, 1, 1,
0.1535138, 1.150962, 0.1247335, 0, 0.6352941, 1, 1,
0.1541736, 0.6201788, 1.221532, 0, 0.627451, 1, 1,
0.1585341, 0.8581843, -1.040886, 0, 0.6235294, 1, 1,
0.1623194, -1.270872, 3.600667, 0, 0.6156863, 1, 1,
0.162331, 0.03587929, 0.602039, 0, 0.6117647, 1, 1,
0.1643588, -0.3768713, 3.043525, 0, 0.6039216, 1, 1,
0.1678815, -0.1554662, 3.062507, 0, 0.5960785, 1, 1,
0.1726524, 0.3772654, -0.6781148, 0, 0.5921569, 1, 1,
0.1736232, -0.9379935, 3.772707, 0, 0.5843138, 1, 1,
0.1751474, 1.239885, -0.1148677, 0, 0.5803922, 1, 1,
0.1762927, -2.358911, 4.043574, 0, 0.572549, 1, 1,
0.1769229, -0.9145399, 1.240823, 0, 0.5686275, 1, 1,
0.1791891, 0.190719, 0.9745407, 0, 0.5607843, 1, 1,
0.179831, 0.9391364, -1.566673, 0, 0.5568628, 1, 1,
0.1850409, 0.9111012, 0.4553665, 0, 0.5490196, 1, 1,
0.189029, -1.505939, 2.978229, 0, 0.5450981, 1, 1,
0.1947168, 0.5205391, -0.09378573, 0, 0.5372549, 1, 1,
0.1959816, 0.5528166, 0.4171582, 0, 0.5333334, 1, 1,
0.1978603, -0.01411771, 1.752568, 0, 0.5254902, 1, 1,
0.200808, -1.048484, 3.577079, 0, 0.5215687, 1, 1,
0.2021889, -0.357723, 3.201835, 0, 0.5137255, 1, 1,
0.2097813, 0.4812776, 0.3310031, 0, 0.509804, 1, 1,
0.2100664, 0.2491912, 0.229247, 0, 0.5019608, 1, 1,
0.2110483, -0.9095316, 6.420506, 0, 0.4941176, 1, 1,
0.2150799, -1.47687, 2.195066, 0, 0.4901961, 1, 1,
0.215586, -0.03322486, 1.220672, 0, 0.4823529, 1, 1,
0.2162073, -1.645205, 3.846142, 0, 0.4784314, 1, 1,
0.2193702, 1.247918, 0.906814, 0, 0.4705882, 1, 1,
0.2197167, 0.4322557, 0.8874339, 0, 0.4666667, 1, 1,
0.2199624, 0.4949128, -0.2502295, 0, 0.4588235, 1, 1,
0.2202996, -1.372977, 3.380486, 0, 0.454902, 1, 1,
0.2257441, 0.3853101, 0.3580817, 0, 0.4470588, 1, 1,
0.2279272, 0.4625009, 1.481438, 0, 0.4431373, 1, 1,
0.2332043, -2.108421, 1.323696, 0, 0.4352941, 1, 1,
0.2355267, -0.206529, 1.930424, 0, 0.4313726, 1, 1,
0.2363141, 0.7752539, -0.6941918, 0, 0.4235294, 1, 1,
0.2394754, 0.8727998, 1.84652, 0, 0.4196078, 1, 1,
0.2410957, 1.191363, -0.3483953, 0, 0.4117647, 1, 1,
0.2428189, -0.2800974, 2.860339, 0, 0.4078431, 1, 1,
0.244821, -0.3697568, 2.620977, 0, 0.4, 1, 1,
0.2483336, -0.3332984, 0.5690331, 0, 0.3921569, 1, 1,
0.2497476, 1.012292, 0.08631259, 0, 0.3882353, 1, 1,
0.2537868, -2.074296, 2.891799, 0, 0.3803922, 1, 1,
0.2543128, 0.8580751, 0.6739268, 0, 0.3764706, 1, 1,
0.2609724, 0.1294508, 0.7883195, 0, 0.3686275, 1, 1,
0.2680752, 1.904573, 0.9948799, 0, 0.3647059, 1, 1,
0.273167, 0.5838866, 0.0411898, 0, 0.3568628, 1, 1,
0.2750756, 1.086273, 0.3111302, 0, 0.3529412, 1, 1,
0.2755286, -0.1006783, 0.6517228, 0, 0.345098, 1, 1,
0.276124, 0.9990916, -0.4039874, 0, 0.3411765, 1, 1,
0.2786191, 0.06328648, 2.150582, 0, 0.3333333, 1, 1,
0.2793427, -0.05449284, 0.7891411, 0, 0.3294118, 1, 1,
0.2831464, -0.2385236, 0.4537861, 0, 0.3215686, 1, 1,
0.2842838, -0.007486713, 0.1754249, 0, 0.3176471, 1, 1,
0.2849499, 1.710596, 0.1664967, 0, 0.3098039, 1, 1,
0.2886373, -0.8376126, 1.861336, 0, 0.3058824, 1, 1,
0.2931331, -1.810844, 3.319222, 0, 0.2980392, 1, 1,
0.2967707, -1.660709, 2.782022, 0, 0.2901961, 1, 1,
0.2970907, 0.6066757, -0.2778457, 0, 0.2862745, 1, 1,
0.30431, 0.4009799, -0.4944529, 0, 0.2784314, 1, 1,
0.3120621, 1.184778, 0.1933728, 0, 0.2745098, 1, 1,
0.3174926, -0.4559739, 2.026147, 0, 0.2666667, 1, 1,
0.3194894, -0.8808085, 4.928564, 0, 0.2627451, 1, 1,
0.3294799, -0.1464348, 2.335845, 0, 0.254902, 1, 1,
0.3378194, 0.5918689, 0.4510059, 0, 0.2509804, 1, 1,
0.3378417, 0.4925384, 1.058319, 0, 0.2431373, 1, 1,
0.3405881, -0.1866966, 1.06631, 0, 0.2392157, 1, 1,
0.3463641, 0.5739473, -0.0266144, 0, 0.2313726, 1, 1,
0.3468853, 1.037923, -0.1320407, 0, 0.227451, 1, 1,
0.3470674, -0.1721195, 1.485014, 0, 0.2196078, 1, 1,
0.3512182, 0.3198852, -0.4535152, 0, 0.2156863, 1, 1,
0.3525661, 0.5409821, -1.104144, 0, 0.2078431, 1, 1,
0.3532202, -1.491897, 3.656418, 0, 0.2039216, 1, 1,
0.357504, 0.1698736, 0.375342, 0, 0.1960784, 1, 1,
0.3681956, -0.4787453, 2.785641, 0, 0.1882353, 1, 1,
0.3710691, -0.9180129, 2.842081, 0, 0.1843137, 1, 1,
0.3730393, 0.4194305, 0.1361022, 0, 0.1764706, 1, 1,
0.3819428, 1.168645, 0.2590246, 0, 0.172549, 1, 1,
0.3864465, -0.410019, 1.102595, 0, 0.1647059, 1, 1,
0.3873404, -1.338603, 1.760289, 0, 0.1607843, 1, 1,
0.3878662, 1.085932, 0.3490135, 0, 0.1529412, 1, 1,
0.3937051, 2.173275, 1.613351, 0, 0.1490196, 1, 1,
0.3967426, -0.1921954, 2.972256, 0, 0.1411765, 1, 1,
0.4028338, 0.399436, 0.3990578, 0, 0.1372549, 1, 1,
0.4118582, 2.133715, 1.009309, 0, 0.1294118, 1, 1,
0.4132421, 0.02557048, 3.694041, 0, 0.1254902, 1, 1,
0.4182966, 0.3025906, 1.309529, 0, 0.1176471, 1, 1,
0.4189537, 1.961823, 0.6075757, 0, 0.1137255, 1, 1,
0.4189751, 0.1972839, 3.104776, 0, 0.1058824, 1, 1,
0.4196955, -0.56155, 1.852005, 0, 0.09803922, 1, 1,
0.4236639, 0.1174409, 2.057651, 0, 0.09411765, 1, 1,
0.4278765, -1.166169, 2.728577, 0, 0.08627451, 1, 1,
0.4294808, -0.02033724, 2.619185, 0, 0.08235294, 1, 1,
0.4324081, -0.3151459, 3.951501, 0, 0.07450981, 1, 1,
0.442913, 0.8237878, -1.31941, 0, 0.07058824, 1, 1,
0.4498198, 0.7954015, 0.6571181, 0, 0.0627451, 1, 1,
0.4500337, -1.178967, 3.880128, 0, 0.05882353, 1, 1,
0.4530244, -1.860511, 2.487962, 0, 0.05098039, 1, 1,
0.4573, -0.6178898, 0.9767384, 0, 0.04705882, 1, 1,
0.4579032, -0.05332011, 1.672289, 0, 0.03921569, 1, 1,
0.4594274, 1.289433, -0.5544285, 0, 0.03529412, 1, 1,
0.4598541, 1.105462, 2.848993, 0, 0.02745098, 1, 1,
0.4650118, -0.0407367, 2.255088, 0, 0.02352941, 1, 1,
0.4684694, -1.01872, 2.780568, 0, 0.01568628, 1, 1,
0.4760695, -0.7246132, 2.853288, 0, 0.01176471, 1, 1,
0.489846, -1.531017, 0.7954605, 0, 0.003921569, 1, 1,
0.4908024, 0.6028466, 1.282834, 0.003921569, 0, 1, 1,
0.4952154, -0.2541912, 2.552593, 0.007843138, 0, 1, 1,
0.4971608, -0.3309304, 0.5342273, 0.01568628, 0, 1, 1,
0.4984892, -1.868667, 3.24745, 0.01960784, 0, 1, 1,
0.5031735, -0.1421643, 1.488382, 0.02745098, 0, 1, 1,
0.5035354, -0.4011355, 3.606596, 0.03137255, 0, 1, 1,
0.5053533, 0.7114633, 2.305451, 0.03921569, 0, 1, 1,
0.5084167, 1.064709, 1.37947, 0.04313726, 0, 1, 1,
0.5095047, -0.8447452, 3.348968, 0.05098039, 0, 1, 1,
0.5095557, 1.694002, 2.44857, 0.05490196, 0, 1, 1,
0.5171847, 0.1799504, 1.344853, 0.0627451, 0, 1, 1,
0.5223061, 0.2073205, 2.511775, 0.06666667, 0, 1, 1,
0.5232601, 0.7768807, 0.9976246, 0.07450981, 0, 1, 1,
0.5236441, 0.2759178, -1.259596, 0.07843138, 0, 1, 1,
0.5251946, 0.2564396, 0.0536419, 0.08627451, 0, 1, 1,
0.5289009, -1.235364, 2.168044, 0.09019608, 0, 1, 1,
0.5292963, 0.9414362, 1.137801, 0.09803922, 0, 1, 1,
0.5506508, 1.296694, 1.73136, 0.1058824, 0, 1, 1,
0.5511583, 1.561921, 0.4178288, 0.1098039, 0, 1, 1,
0.5550418, 0.5944567, 2.224838, 0.1176471, 0, 1, 1,
0.5550714, 0.06100814, 1.731477, 0.1215686, 0, 1, 1,
0.5552504, 0.4651553, 2.081172, 0.1294118, 0, 1, 1,
0.5554382, -0.2945096, 1.668013, 0.1333333, 0, 1, 1,
0.5582443, 0.1363773, 2.412382, 0.1411765, 0, 1, 1,
0.5632406, 0.00938003, 1.00461, 0.145098, 0, 1, 1,
0.5637527, 0.187546, 2.179824, 0.1529412, 0, 1, 1,
0.5638371, 0.4293826, -0.2736035, 0.1568628, 0, 1, 1,
0.5668012, -0.9131062, 2.617934, 0.1647059, 0, 1, 1,
0.578645, -0.02776505, 0.7484365, 0.1686275, 0, 1, 1,
0.5828468, 0.4219113, -0.9761387, 0.1764706, 0, 1, 1,
0.5852636, 0.8556041, 0.7529342, 0.1803922, 0, 1, 1,
0.5978873, -0.837788, 2.706005, 0.1882353, 0, 1, 1,
0.5993774, 0.6975613, 1.048846, 0.1921569, 0, 1, 1,
0.6044352, 0.3069922, 0.8312247, 0.2, 0, 1, 1,
0.6091406, 2.533447, -0.1284073, 0.2078431, 0, 1, 1,
0.6151887, 0.5315065, 1.552702, 0.2117647, 0, 1, 1,
0.6166053, 0.4581907, 2.030665, 0.2196078, 0, 1, 1,
0.6202976, -1.512625, 2.068245, 0.2235294, 0, 1, 1,
0.6261339, 2.131404, 1.931775, 0.2313726, 0, 1, 1,
0.6272527, 0.9528399, 0.1356258, 0.2352941, 0, 1, 1,
0.6282764, -0.3734219, 2.294274, 0.2431373, 0, 1, 1,
0.6305812, -0.7289037, 1.487235, 0.2470588, 0, 1, 1,
0.6313977, -0.5265012, 2.607589, 0.254902, 0, 1, 1,
0.6318644, 0.7208324, -0.1803848, 0.2588235, 0, 1, 1,
0.6319598, 0.804687, 1.498436, 0.2666667, 0, 1, 1,
0.6491698, -1.495227, 3.551985, 0.2705882, 0, 1, 1,
0.6528083, 1.025463, 0.9564431, 0.2784314, 0, 1, 1,
0.6535047, -2.202218, 1.950963, 0.282353, 0, 1, 1,
0.6537828, -0.4192216, 2.709438, 0.2901961, 0, 1, 1,
0.6537836, 0.9778959, -0.7374237, 0.2941177, 0, 1, 1,
0.6538222, 0.8378273, 0.364527, 0.3019608, 0, 1, 1,
0.6553495, 1.141026, -0.3234217, 0.3098039, 0, 1, 1,
0.6569957, 0.2938026, 0.8382573, 0.3137255, 0, 1, 1,
0.6585093, 0.02071385, -0.3681986, 0.3215686, 0, 1, 1,
0.669368, 1.036178, 0.5526408, 0.3254902, 0, 1, 1,
0.6743988, -0.3955449, 2.774635, 0.3333333, 0, 1, 1,
0.6811482, 0.800416, -0.6727892, 0.3372549, 0, 1, 1,
0.6847353, -1.262538, 1.962156, 0.345098, 0, 1, 1,
0.6874434, -0.01619107, 2.276177, 0.3490196, 0, 1, 1,
0.6893959, -0.1898419, 4.678702, 0.3568628, 0, 1, 1,
0.6898597, -0.3959408, 2.654207, 0.3607843, 0, 1, 1,
0.6906717, 0.08052791, 0.2491769, 0.3686275, 0, 1, 1,
0.6945639, -2.063458, 3.389332, 0.372549, 0, 1, 1,
0.6971423, 0.5274159, 0.1469337, 0.3803922, 0, 1, 1,
0.702052, -0.05811146, 1.830553, 0.3843137, 0, 1, 1,
0.7026977, -0.6382068, 1.910155, 0.3921569, 0, 1, 1,
0.7029523, -0.8747079, 2.174951, 0.3960784, 0, 1, 1,
0.7033835, 0.4915321, 1.654541, 0.4039216, 0, 1, 1,
0.7042152, -0.3174551, 3.996849, 0.4117647, 0, 1, 1,
0.7042266, -1.382092, 1.911605, 0.4156863, 0, 1, 1,
0.7075347, -0.531581, 2.962781, 0.4235294, 0, 1, 1,
0.7106017, 0.4921288, 1.411865, 0.427451, 0, 1, 1,
0.7124137, -0.5081043, 3.257594, 0.4352941, 0, 1, 1,
0.7163846, -1.189689, 2.015791, 0.4392157, 0, 1, 1,
0.72223, -0.5240415, 2.04871, 0.4470588, 0, 1, 1,
0.7287868, -0.1460335, 1.661372, 0.4509804, 0, 1, 1,
0.7328447, 0.873697, -0.7061585, 0.4588235, 0, 1, 1,
0.7426123, -0.7132004, 1.048552, 0.4627451, 0, 1, 1,
0.7485425, 0.4621833, 2.721612, 0.4705882, 0, 1, 1,
0.7502499, -0.1007568, 2.449049, 0.4745098, 0, 1, 1,
0.7543159, 1.58113, -0.8707868, 0.4823529, 0, 1, 1,
0.764075, 2.601311, -0.8304652, 0.4862745, 0, 1, 1,
0.7689131, 0.0360673, 2.288914, 0.4941176, 0, 1, 1,
0.770593, -0.2105787, 2.267002, 0.5019608, 0, 1, 1,
0.7728554, 0.8145779, 3.166464, 0.5058824, 0, 1, 1,
0.7757232, -0.07093363, 1.397505, 0.5137255, 0, 1, 1,
0.7784253, 1.585759, 1.557056, 0.5176471, 0, 1, 1,
0.7891381, 1.340824, -0.44627, 0.5254902, 0, 1, 1,
0.7928908, 1.603812, -0.3070142, 0.5294118, 0, 1, 1,
0.7930744, 2.121187, 0.6311923, 0.5372549, 0, 1, 1,
0.8021888, -0.8441101, 0.619925, 0.5411765, 0, 1, 1,
0.806901, -0.06334273, -0.4057409, 0.5490196, 0, 1, 1,
0.8081383, 0.8876502, 0.8968343, 0.5529412, 0, 1, 1,
0.8154199, -1.06431, 3.336176, 0.5607843, 0, 1, 1,
0.8173437, -0.9821476, 0.9608333, 0.5647059, 0, 1, 1,
0.818815, -1.457319, 3.048886, 0.572549, 0, 1, 1,
0.8207299, 0.01254543, 2.826756, 0.5764706, 0, 1, 1,
0.8234967, -1.653846, 1.767791, 0.5843138, 0, 1, 1,
0.825807, 0.3440892, 2.919925, 0.5882353, 0, 1, 1,
0.8267128, 1.630081, 1.889527, 0.5960785, 0, 1, 1,
0.8307114, -1.138474, 1.307435, 0.6039216, 0, 1, 1,
0.8349618, 0.3383721, 1.748103, 0.6078432, 0, 1, 1,
0.835569, -0.4266093, 2.50815, 0.6156863, 0, 1, 1,
0.836966, -0.7794977, 1.047484, 0.6196079, 0, 1, 1,
0.8376001, -0.989911, 3.217913, 0.627451, 0, 1, 1,
0.8426939, 0.7937909, -0.4994598, 0.6313726, 0, 1, 1,
0.8432044, 0.004186653, 0.6516846, 0.6392157, 0, 1, 1,
0.8532202, 0.08381178, 3.993956, 0.6431373, 0, 1, 1,
0.8554401, 0.8632436, 0.6017859, 0.6509804, 0, 1, 1,
0.856692, 0.6036199, -0.3246333, 0.654902, 0, 1, 1,
0.8614979, -0.8564304, 3.743388, 0.6627451, 0, 1, 1,
0.8618433, -1.075837, 2.081245, 0.6666667, 0, 1, 1,
0.8654981, 0.2088843, 3.058838, 0.6745098, 0, 1, 1,
0.8714693, -0.9455488, 4.209682, 0.6784314, 0, 1, 1,
0.8781369, -1.252688, 2.045319, 0.6862745, 0, 1, 1,
0.8820814, -1.728022, 4.838751, 0.6901961, 0, 1, 1,
0.8954603, 0.6219614, 0.004404609, 0.6980392, 0, 1, 1,
0.899051, 1.145331, 1.998247, 0.7058824, 0, 1, 1,
0.9017118, 0.8163338, 0.7921529, 0.7098039, 0, 1, 1,
0.9042563, 0.7211971, 0.9451615, 0.7176471, 0, 1, 1,
0.9043604, -0.2870528, 2.357415, 0.7215686, 0, 1, 1,
0.9053882, -0.7621199, 2.214475, 0.7294118, 0, 1, 1,
0.9059264, 0.8474814, 0.7953623, 0.7333333, 0, 1, 1,
0.9069204, 1.542141, 0.5798892, 0.7411765, 0, 1, 1,
0.9086381, 0.9522776, 0.1595182, 0.7450981, 0, 1, 1,
0.9099445, -0.1345551, 1.892976, 0.7529412, 0, 1, 1,
0.9199968, 0.9934847, 0.2476469, 0.7568628, 0, 1, 1,
0.9217563, 0.8219768, 2.051981, 0.7647059, 0, 1, 1,
0.9252918, -0.3904617, 1.310241, 0.7686275, 0, 1, 1,
0.9265378, -1.590481, 3.038407, 0.7764706, 0, 1, 1,
0.9272462, 0.4165371, 1.46693, 0.7803922, 0, 1, 1,
0.928471, -0.8262799, 2.580607, 0.7882353, 0, 1, 1,
0.9307203, 0.9318114, 1.426449, 0.7921569, 0, 1, 1,
0.9368654, 0.1630061, 1.064051, 0.8, 0, 1, 1,
0.938828, 0.6610838, -0.05660218, 0.8078431, 0, 1, 1,
0.9393761, 0.3185791, 2.295558, 0.8117647, 0, 1, 1,
0.9401637, 0.4474989, 1.122267, 0.8196079, 0, 1, 1,
0.9402847, -0.2270261, 2.308818, 0.8235294, 0, 1, 1,
0.9416783, -1.142886, 3.204748, 0.8313726, 0, 1, 1,
0.9426388, 0.5224029, 1.16554, 0.8352941, 0, 1, 1,
0.9442754, 0.5950127, -1.218229, 0.8431373, 0, 1, 1,
0.9457172, -1.273222, 1.508738, 0.8470588, 0, 1, 1,
0.9544334, -0.9743056, 0.7815906, 0.854902, 0, 1, 1,
0.9548692, 0.02530465, 1.907837, 0.8588235, 0, 1, 1,
0.9568176, -1.757327, 1.719027, 0.8666667, 0, 1, 1,
0.9581584, -0.4891189, 0.8725711, 0.8705882, 0, 1, 1,
0.9624707, -0.4306951, 3.595346, 0.8784314, 0, 1, 1,
0.9625871, -0.8900739, 2.18613, 0.8823529, 0, 1, 1,
0.9627023, 2.043811, -1.059187, 0.8901961, 0, 1, 1,
0.9643881, 0.1419705, 1.276336, 0.8941177, 0, 1, 1,
0.9644403, 0.6201606, 1.245121, 0.9019608, 0, 1, 1,
0.9684143, -0.0428704, -0.1928645, 0.9098039, 0, 1, 1,
0.9747976, -2.287702, 2.250985, 0.9137255, 0, 1, 1,
0.9769275, 0.3714555, 0.9122965, 0.9215686, 0, 1, 1,
0.9788572, -0.854767, 2.240114, 0.9254902, 0, 1, 1,
0.9862453, -0.4954287, 2.209328, 0.9333333, 0, 1, 1,
0.9883713, -1.062145, 3.15759, 0.9372549, 0, 1, 1,
0.9902366, -0.5652294, 3.247874, 0.945098, 0, 1, 1,
0.9966932, 0.9686906, 0.9061392, 0.9490196, 0, 1, 1,
0.9970347, -0.28306, 0.4842411, 0.9568627, 0, 1, 1,
1.004554, -0.2814109, 3.86887, 0.9607843, 0, 1, 1,
1.011872, 0.2185026, 0.8980617, 0.9686275, 0, 1, 1,
1.022377, 1.674033, 1.709108, 0.972549, 0, 1, 1,
1.024673, 0.4778844, 1.499427, 0.9803922, 0, 1, 1,
1.029024, 0.1994578, 0.6981986, 0.9843137, 0, 1, 1,
1.030019, 1.392097, 0.5319528, 0.9921569, 0, 1, 1,
1.032802, -2.083576, 4.040164, 0.9960784, 0, 1, 1,
1.057762, -0.6031694, 0.9381198, 1, 0, 0.9960784, 1,
1.057828, -0.3555225, 3.134749, 1, 0, 0.9882353, 1,
1.060465, 0.3050692, 0.8172799, 1, 0, 0.9843137, 1,
1.060926, -0.6071332, 3.969549, 1, 0, 0.9764706, 1,
1.071396, -0.3197551, 5.378032, 1, 0, 0.972549, 1,
1.073045, 0.02857967, 1.675714, 1, 0, 0.9647059, 1,
1.075229, -1.6204, 1.576178, 1, 0, 0.9607843, 1,
1.080698, 0.8791892, 1.322383, 1, 0, 0.9529412, 1,
1.087157, 0.9734792, -1.324032, 1, 0, 0.9490196, 1,
1.090941, 0.4596914, 1.292088, 1, 0, 0.9411765, 1,
1.096985, 1.072473, 1.412948, 1, 0, 0.9372549, 1,
1.097223, 0.5450593, 2.210349, 1, 0, 0.9294118, 1,
1.123819, -1.544996, 1.747156, 1, 0, 0.9254902, 1,
1.131384, -0.8577724, 3.385696, 1, 0, 0.9176471, 1,
1.139299, -0.02535863, 1.043749, 1, 0, 0.9137255, 1,
1.140369, 1.041092, 1.686014, 1, 0, 0.9058824, 1,
1.140751, -3.660196, 0.07725828, 1, 0, 0.9019608, 1,
1.140991, -0.2751262, 2.267955, 1, 0, 0.8941177, 1,
1.141779, -0.09003831, 1.204924, 1, 0, 0.8862745, 1,
1.166172, 1.831161, 1.683707, 1, 0, 0.8823529, 1,
1.166292, 0.4410822, 0.8173108, 1, 0, 0.8745098, 1,
1.171026, -1.042277, 1.676777, 1, 0, 0.8705882, 1,
1.174428, 0.2277901, -0.391819, 1, 0, 0.8627451, 1,
1.177453, -1.401304, 3.147107, 1, 0, 0.8588235, 1,
1.180113, 1.57831, 2.16513, 1, 0, 0.8509804, 1,
1.189544, 1.005967, -0.0280704, 1, 0, 0.8470588, 1,
1.191636, 0.08941934, 1.098114, 1, 0, 0.8392157, 1,
1.195561, 0.4741188, -0.2359212, 1, 0, 0.8352941, 1,
1.196756, -1.360088, 2.444532, 1, 0, 0.827451, 1,
1.198372, 0.7543548, 0.7140839, 1, 0, 0.8235294, 1,
1.209848, -0.1539536, 3.740295, 1, 0, 0.8156863, 1,
1.217257, 0.9110309, 1.731721, 1, 0, 0.8117647, 1,
1.22436, -1.13754, 1.215528, 1, 0, 0.8039216, 1,
1.227974, -1.6838, 3.65074, 1, 0, 0.7960784, 1,
1.23206, 1.244783, 2.199743, 1, 0, 0.7921569, 1,
1.235687, 0.06696681, 1.694667, 1, 0, 0.7843137, 1,
1.23721, -0.07458332, 0.8343322, 1, 0, 0.7803922, 1,
1.238611, -1.285738, 1.321333, 1, 0, 0.772549, 1,
1.26143, -0.8308166, 2.316674, 1, 0, 0.7686275, 1,
1.265489, 0.5586592, 1.543464, 1, 0, 0.7607843, 1,
1.266128, -0.1703764, 1.707651, 1, 0, 0.7568628, 1,
1.273572, -0.5215747, 2.278385, 1, 0, 0.7490196, 1,
1.285854, 1.042954, 1.76923, 1, 0, 0.7450981, 1,
1.287694, 1.464131, -0.5550948, 1, 0, 0.7372549, 1,
1.288996, 0.08740454, 0.1914063, 1, 0, 0.7333333, 1,
1.296291, -1.055953, 0.3810129, 1, 0, 0.7254902, 1,
1.298493, 0.6853232, 1.864928, 1, 0, 0.7215686, 1,
1.298728, 1.422144, 0.4812165, 1, 0, 0.7137255, 1,
1.299372, 0.3404696, -0.6791022, 1, 0, 0.7098039, 1,
1.314896, 1.414107, -0.2909848, 1, 0, 0.7019608, 1,
1.324274, 0.1484076, 2.186541, 1, 0, 0.6941177, 1,
1.324742, 0.03190476, 1.078358, 1, 0, 0.6901961, 1,
1.333556, -0.1317032, -0.01170306, 1, 0, 0.682353, 1,
1.336523, 0.1364654, 0.6424466, 1, 0, 0.6784314, 1,
1.339513, 0.7787998, -0.9305885, 1, 0, 0.6705883, 1,
1.342906, 0.1010686, 2.326486, 1, 0, 0.6666667, 1,
1.343171, 0.7812678, 1.382008, 1, 0, 0.6588235, 1,
1.34555, -2.495309, 2.662727, 1, 0, 0.654902, 1,
1.347391, -0.5398368, 1.3112, 1, 0, 0.6470588, 1,
1.347923, -1.184181, 3.865704, 1, 0, 0.6431373, 1,
1.349088, -0.007446041, 3.074618, 1, 0, 0.6352941, 1,
1.354158, -0.192065, 1.522043, 1, 0, 0.6313726, 1,
1.354571, -1.708143, 4.207596, 1, 0, 0.6235294, 1,
1.357718, 0.8634081, 0.9238923, 1, 0, 0.6196079, 1,
1.357802, -1.435453, 1.706417, 1, 0, 0.6117647, 1,
1.364032, -1.061629, 1.906976, 1, 0, 0.6078432, 1,
1.377175, 1.792065, -1.480764, 1, 0, 0.6, 1,
1.377338, 0.07086251, 1.699504, 1, 0, 0.5921569, 1,
1.380865, -0.2235465, 1.770788, 1, 0, 0.5882353, 1,
1.386794, -0.004847159, 1.8696, 1, 0, 0.5803922, 1,
1.391567, 0.4641093, 1.485252, 1, 0, 0.5764706, 1,
1.392038, -0.5394638, 3.854813, 1, 0, 0.5686275, 1,
1.39407, -0.06289196, 0.824374, 1, 0, 0.5647059, 1,
1.396318, 0.0199207, 2.160558, 1, 0, 0.5568628, 1,
1.40037, -0.1644937, 2.129055, 1, 0, 0.5529412, 1,
1.405352, 0.3652136, 2.493308, 1, 0, 0.5450981, 1,
1.417798, 0.2113747, 1.369294, 1, 0, 0.5411765, 1,
1.418361, 0.27516, 0.6179144, 1, 0, 0.5333334, 1,
1.420731, -1.180186, 3.944256, 1, 0, 0.5294118, 1,
1.423377, 1.008611, 2.557295, 1, 0, 0.5215687, 1,
1.431175, -0.8317567, 1.37985, 1, 0, 0.5176471, 1,
1.43638, 1.762101, -0.4743919, 1, 0, 0.509804, 1,
1.443148, 0.5420586, 1.291543, 1, 0, 0.5058824, 1,
1.456806, -0.2702855, 1.937825, 1, 0, 0.4980392, 1,
1.468318, -0.4180827, 1.682857, 1, 0, 0.4901961, 1,
1.47553, 0.0900731, 0.9702387, 1, 0, 0.4862745, 1,
1.482036, -2.854803, 1.964586, 1, 0, 0.4784314, 1,
1.494665, 0.3565617, 0.7942974, 1, 0, 0.4745098, 1,
1.501589, 0.1598886, 2.580782, 1, 0, 0.4666667, 1,
1.514164, -0.4221864, 1.678111, 1, 0, 0.4627451, 1,
1.522246, -0.4140057, 0.5695103, 1, 0, 0.454902, 1,
1.52368, -0.04542936, 0.8616349, 1, 0, 0.4509804, 1,
1.525793, 0.5093726, 0.3699672, 1, 0, 0.4431373, 1,
1.539976, 0.7842071, 0.2609686, 1, 0, 0.4392157, 1,
1.544015, -0.3221139, 1.5426, 1, 0, 0.4313726, 1,
1.550907, 0.1442794, 2.639661, 1, 0, 0.427451, 1,
1.584938, 0.1512704, 0.3679406, 1, 0, 0.4196078, 1,
1.600631, -0.5849146, 3.088337, 1, 0, 0.4156863, 1,
1.603635, 0.2021688, 2.200007, 1, 0, 0.4078431, 1,
1.610485, -0.4366322, 2.461831, 1, 0, 0.4039216, 1,
1.619931, -0.05788529, 0.4503166, 1, 0, 0.3960784, 1,
1.636171, -1.511076, 1.38536, 1, 0, 0.3882353, 1,
1.63731, 0.2153522, 2.491725, 1, 0, 0.3843137, 1,
1.640839, -1.169691, 2.346082, 1, 0, 0.3764706, 1,
1.643384, -0.278041, 1.90012, 1, 0, 0.372549, 1,
1.648362, 0.03199968, 0.9036742, 1, 0, 0.3647059, 1,
1.654677, 0.1569241, 2.530417, 1, 0, 0.3607843, 1,
1.660906, -2.79812, 3.69359, 1, 0, 0.3529412, 1,
1.683348, -0.621236, 1.559263, 1, 0, 0.3490196, 1,
1.697181, -0.09714299, -0.5351576, 1, 0, 0.3411765, 1,
1.704924, 0.08810148, 0.3883829, 1, 0, 0.3372549, 1,
1.721284, 0.05449317, 1.187417, 1, 0, 0.3294118, 1,
1.733631, -1.11587, 2.885787, 1, 0, 0.3254902, 1,
1.759936, 0.9710327, 0.2793329, 1, 0, 0.3176471, 1,
1.771899, 1.701945, 1.622831, 1, 0, 0.3137255, 1,
1.772429, -1.622622, 2.370119, 1, 0, 0.3058824, 1,
1.772513, -0.5576006, 2.28077, 1, 0, 0.2980392, 1,
1.776071, 0.2343049, -0.4353756, 1, 0, 0.2941177, 1,
1.788665, -2.714967, 3.6368, 1, 0, 0.2862745, 1,
1.794873, -0.8521953, 0.7801518, 1, 0, 0.282353, 1,
1.803558, 1.637547, -0.1446245, 1, 0, 0.2745098, 1,
1.81145, 0.2369162, 0.8747536, 1, 0, 0.2705882, 1,
1.812607, 1.312739, 1.021342, 1, 0, 0.2627451, 1,
1.831244, -1.028252, 2.443635, 1, 0, 0.2588235, 1,
1.865437, 1.871816, 0.2734709, 1, 0, 0.2509804, 1,
1.866859, 2.155508, -1.240025, 1, 0, 0.2470588, 1,
1.867203, 0.2061573, -0.05294049, 1, 0, 0.2392157, 1,
1.868408, -0.428784, 0.9672089, 1, 0, 0.2352941, 1,
1.871301, -0.3402417, 1.830599, 1, 0, 0.227451, 1,
1.873766, -0.6041311, 1.30529, 1, 0, 0.2235294, 1,
1.874048, -1.166157, 1.389559, 1, 0, 0.2156863, 1,
1.882885, 0.8760224, -1.517942, 1, 0, 0.2117647, 1,
1.883502, -0.65535, 1.688048, 1, 0, 0.2039216, 1,
1.897143, 1.641901, 0.7626581, 1, 0, 0.1960784, 1,
1.905712, -0.261878, 0.9499499, 1, 0, 0.1921569, 1,
1.924696, 1.453133, -0.8422161, 1, 0, 0.1843137, 1,
1.939179, 0.02799392, 0.685188, 1, 0, 0.1803922, 1,
1.993454, -0.5124056, 2.419949, 1, 0, 0.172549, 1,
2.015209, 0.4443145, 0.2939855, 1, 0, 0.1686275, 1,
2.019498, -0.3323018, 1.756896, 1, 0, 0.1607843, 1,
2.025438, 1.168158, 1.23606, 1, 0, 0.1568628, 1,
2.040904, 0.5191666, 2.137367, 1, 0, 0.1490196, 1,
2.048705, 0.9371618, 0.3189692, 1, 0, 0.145098, 1,
2.066057, -0.4608819, 1.849948, 1, 0, 0.1372549, 1,
2.081586, 1.066663, 0.08177229, 1, 0, 0.1333333, 1,
2.098985, 0.8756119, 1.635404, 1, 0, 0.1254902, 1,
2.123079, -0.2956472, -0.063489, 1, 0, 0.1215686, 1,
2.123973, 0.1679096, 2.495193, 1, 0, 0.1137255, 1,
2.141622, -0.9577708, 2.40729, 1, 0, 0.1098039, 1,
2.18601, -1.967685, 1.643616, 1, 0, 0.1019608, 1,
2.193819, 0.1310071, 0.5138364, 1, 0, 0.09411765, 1,
2.234766, 0.4536487, 2.162442, 1, 0, 0.09019608, 1,
2.246979, 0.2268714, -0.7772259, 1, 0, 0.08235294, 1,
2.277067, -0.1085481, 1.230661, 1, 0, 0.07843138, 1,
2.28224, -0.4806873, 1.572568, 1, 0, 0.07058824, 1,
2.302804, 0.1966716, 3.04292, 1, 0, 0.06666667, 1,
2.311116, -0.9288338, 0.4210984, 1, 0, 0.05882353, 1,
2.345235, -0.2254472, 1.606476, 1, 0, 0.05490196, 1,
2.367469, -0.1790447, 1.457746, 1, 0, 0.04705882, 1,
2.385416, -0.5973769, 3.530456, 1, 0, 0.04313726, 1,
2.576083, 1.228106, 0.1692991, 1, 0, 0.03529412, 1,
2.69783, 1.091907, 0.02665533, 1, 0, 0.03137255, 1,
2.855245, 0.91452, 0.1960017, 1, 0, 0.02352941, 1,
3.030247, -0.003452248, 2.124055, 1, 0, 0.01960784, 1,
3.190107, -1.055901, 1.798555, 1, 0, 0.01176471, 1,
3.281903, -1.096769, -0.3080389, 1, 0, 0.007843138, 1
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
-0.239012, -4.760568, -7.664278, 0, -0.5, 0.5, 0.5,
-0.239012, -4.760568, -7.664278, 1, -0.5, 0.5, 0.5,
-0.239012, -4.760568, -7.664278, 1, 1.5, 0.5, 0.5,
-0.239012, -4.760568, -7.664278, 0, 1.5, 0.5, 0.5
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
-4.953517, -0.4142599, -7.664278, 0, -0.5, 0.5, 0.5,
-4.953517, -0.4142599, -7.664278, 1, -0.5, 0.5, 0.5,
-4.953517, -0.4142599, -7.664278, 1, 1.5, 0.5, 0.5,
-4.953517, -0.4142599, -7.664278, 0, 1.5, 0.5, 0.5
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
-4.953517, -4.760568, 0.3987944, 0, -0.5, 0.5, 0.5,
-4.953517, -4.760568, 0.3987944, 1, -0.5, 0.5, 0.5,
-4.953517, -4.760568, 0.3987944, 1, 1.5, 0.5, 0.5,
-4.953517, -4.760568, 0.3987944, 0, 1.5, 0.5, 0.5
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
-2, -3.757574, -5.803569,
2, -3.757574, -5.803569,
-2, -3.757574, -5.803569,
-2, -3.924739, -6.113687,
0, -3.757574, -5.803569,
0, -3.924739, -6.113687,
2, -3.757574, -5.803569,
2, -3.924739, -6.113687
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
-2, -4.259071, -6.733923, 0, -0.5, 0.5, 0.5,
-2, -4.259071, -6.733923, 1, -0.5, 0.5, 0.5,
-2, -4.259071, -6.733923, 1, 1.5, 0.5, 0.5,
-2, -4.259071, -6.733923, 0, 1.5, 0.5, 0.5,
0, -4.259071, -6.733923, 0, -0.5, 0.5, 0.5,
0, -4.259071, -6.733923, 1, -0.5, 0.5, 0.5,
0, -4.259071, -6.733923, 1, 1.5, 0.5, 0.5,
0, -4.259071, -6.733923, 0, 1.5, 0.5, 0.5,
2, -4.259071, -6.733923, 0, -0.5, 0.5, 0.5,
2, -4.259071, -6.733923, 1, -0.5, 0.5, 0.5,
2, -4.259071, -6.733923, 1, 1.5, 0.5, 0.5,
2, -4.259071, -6.733923, 0, 1.5, 0.5, 0.5
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
-3.865555, -3, -5.803569,
-3.865555, 2, -5.803569,
-3.865555, -3, -5.803569,
-4.046882, -3, -6.113687,
-3.865555, -2, -5.803569,
-4.046882, -2, -6.113687,
-3.865555, -1, -5.803569,
-4.046882, -1, -6.113687,
-3.865555, 0, -5.803569,
-4.046882, 0, -6.113687,
-3.865555, 1, -5.803569,
-4.046882, 1, -6.113687,
-3.865555, 2, -5.803569,
-4.046882, 2, -6.113687
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
"2"
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
-4.409536, -3, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, -3, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, -3, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, -3, -6.733923, 0, 1.5, 0.5, 0.5,
-4.409536, -2, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, -2, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, -2, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, -2, -6.733923, 0, 1.5, 0.5, 0.5,
-4.409536, -1, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, -1, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, -1, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, -1, -6.733923, 0, 1.5, 0.5, 0.5,
-4.409536, 0, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, 0, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, 0, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, 0, -6.733923, 0, 1.5, 0.5, 0.5,
-4.409536, 1, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, 1, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, 1, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, 1, -6.733923, 0, 1.5, 0.5, 0.5,
-4.409536, 2, -6.733923, 0, -0.5, 0.5, 0.5,
-4.409536, 2, -6.733923, 1, -0.5, 0.5, 0.5,
-4.409536, 2, -6.733923, 1, 1.5, 0.5, 0.5,
-4.409536, 2, -6.733923, 0, 1.5, 0.5, 0.5
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
-3.865555, -3.757574, -4,
-3.865555, -3.757574, 6,
-3.865555, -3.757574, -4,
-4.046882, -3.924739, -4,
-3.865555, -3.757574, -2,
-4.046882, -3.924739, -2,
-3.865555, -3.757574, 0,
-4.046882, -3.924739, 0,
-3.865555, -3.757574, 2,
-4.046882, -3.924739, 2,
-3.865555, -3.757574, 4,
-4.046882, -3.924739, 4,
-3.865555, -3.757574, 6,
-4.046882, -3.924739, 6
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
"4",
"6"
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
-4.409536, -4.259071, -4, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, -4, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, -4, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, -4, 0, 1.5, 0.5, 0.5,
-4.409536, -4.259071, -2, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, -2, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, -2, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, -2, 0, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 0, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 0, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 0, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 0, 0, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 2, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 2, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 2, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 2, 0, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 4, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 4, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 4, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 4, 0, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 6, 0, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 6, 1, -0.5, 0.5, 0.5,
-4.409536, -4.259071, 6, 1, 1.5, 0.5, 0.5,
-4.409536, -4.259071, 6, 0, 1.5, 0.5, 0.5
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
-3.865555, -3.757574, -5.803569,
-3.865555, 2.929054, -5.803569,
-3.865555, -3.757574, 6.601158,
-3.865555, 2.929054, 6.601158,
-3.865555, -3.757574, -5.803569,
-3.865555, -3.757574, 6.601158,
-3.865555, 2.929054, -5.803569,
-3.865555, 2.929054, 6.601158,
-3.865555, -3.757574, -5.803569,
3.387531, -3.757574, -5.803569,
-3.865555, -3.757574, 6.601158,
3.387531, -3.757574, 6.601158,
-3.865555, 2.929054, -5.803569,
3.387531, 2.929054, -5.803569,
-3.865555, 2.929054, 6.601158,
3.387531, 2.929054, 6.601158,
3.387531, -3.757574, -5.803569,
3.387531, 2.929054, -5.803569,
3.387531, -3.757574, 6.601158,
3.387531, 2.929054, 6.601158,
3.387531, -3.757574, -5.803569,
3.387531, -3.757574, 6.601158,
3.387531, 2.929054, -5.803569,
3.387531, 2.929054, 6.601158
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
var radius = 8.463137;
var distance = 37.65345;
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
mvMatrix.translate( 0.239012, 0.4142599, -0.3987944 );
mvMatrix.scale( 1.261602, 1.368479, 0.7376631 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.65345);
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


