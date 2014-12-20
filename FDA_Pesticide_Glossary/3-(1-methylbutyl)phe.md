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
-3.086574, 0.5564494, -2.104876, 1, 0, 0, 1,
-2.854164, -1.346559, -0.8986151, 1, 0.007843138, 0, 1,
-2.706431, 1.415013, -1.577876, 1, 0.01176471, 0, 1,
-2.557365, 1.137565, 2.133516, 1, 0.01960784, 0, 1,
-2.517239, -0.4531007, -3.01464, 1, 0.02352941, 0, 1,
-2.460778, 0.6306433, -1.116922, 1, 0.03137255, 0, 1,
-2.317758, -0.3843126, -2.53559, 1, 0.03529412, 0, 1,
-2.306865, -1.97576, -2.949632, 1, 0.04313726, 0, 1,
-2.20178, -0.1265094, -1.884034, 1, 0.04705882, 0, 1,
-2.195716, -0.2464199, 0.1628952, 1, 0.05490196, 0, 1,
-2.125816, 0.0391151, -1.626067, 1, 0.05882353, 0, 1,
-2.110595, 1.947231, 0.1845674, 1, 0.06666667, 0, 1,
-2.061335, 1.260518, -1.507572, 1, 0.07058824, 0, 1,
-2.046961, -0.8633729, -1.406921, 1, 0.07843138, 0, 1,
-2.040372, 0.6222342, -2.786395, 1, 0.08235294, 0, 1,
-1.99818, -1.099139, -4.838488, 1, 0.09019608, 0, 1,
-1.993143, -0.9533011, -1.908473, 1, 0.09411765, 0, 1,
-1.983044, 1.066787, -0.7367702, 1, 0.1019608, 0, 1,
-1.975001, -2.72458, -3.374137, 1, 0.1098039, 0, 1,
-1.953819, 0.436316, -1.288425, 1, 0.1137255, 0, 1,
-1.94398, 0.3379801, -2.624514, 1, 0.1215686, 0, 1,
-1.934221, -0.3203412, -2.394899, 1, 0.1254902, 0, 1,
-1.932835, 0.4946531, -0.2173746, 1, 0.1333333, 0, 1,
-1.926054, -0.1982661, -2.076101, 1, 0.1372549, 0, 1,
-1.925049, 1.07694, -1.364594, 1, 0.145098, 0, 1,
-1.915268, -0.09786997, -0.972877, 1, 0.1490196, 0, 1,
-1.910146, -1.378235, -1.526312, 1, 0.1568628, 0, 1,
-1.90484, -0.1360906, 0.02875513, 1, 0.1607843, 0, 1,
-1.899684, 0.8459813, -1.692793, 1, 0.1686275, 0, 1,
-1.886986, 0.02609544, -1.590476, 1, 0.172549, 0, 1,
-1.886942, 1.188407, -0.7656104, 1, 0.1803922, 0, 1,
-1.884191, -0.1469262, -3.310966, 1, 0.1843137, 0, 1,
-1.852854, 1.217065, -0.5939465, 1, 0.1921569, 0, 1,
-1.819678, -0.7839184, -2.792227, 1, 0.1960784, 0, 1,
-1.812919, 1.721798, -0.9592294, 1, 0.2039216, 0, 1,
-1.809255, -0.6110145, -2.002351, 1, 0.2117647, 0, 1,
-1.760507, 0.6017828, -2.569256, 1, 0.2156863, 0, 1,
-1.727653, -0.5443871, -0.785937, 1, 0.2235294, 0, 1,
-1.714152, -0.9386528, -2.814856, 1, 0.227451, 0, 1,
-1.708783, 0.6468276, -2.797022, 1, 0.2352941, 0, 1,
-1.704431, 0.2045374, -0.9183905, 1, 0.2392157, 0, 1,
-1.694011, -1.411574, -2.450794, 1, 0.2470588, 0, 1,
-1.693491, -1.159425, -1.52062, 1, 0.2509804, 0, 1,
-1.689101, 1.466117, 0.109358, 1, 0.2588235, 0, 1,
-1.686453, -0.5079676, -2.956975, 1, 0.2627451, 0, 1,
-1.681469, 1.109369, -0.6427287, 1, 0.2705882, 0, 1,
-1.679127, -1.152879, -1.584838, 1, 0.2745098, 0, 1,
-1.663989, 1.194746, -1.224481, 1, 0.282353, 0, 1,
-1.655007, 1.537183, -1.434372, 1, 0.2862745, 0, 1,
-1.653004, -1.16604, -2.348727, 1, 0.2941177, 0, 1,
-1.649916, -0.2547915, -2.566656, 1, 0.3019608, 0, 1,
-1.642791, -0.06907577, -2.143699, 1, 0.3058824, 0, 1,
-1.641091, 0.171619, -2.621547, 1, 0.3137255, 0, 1,
-1.639807, 0.4721664, 0.8161716, 1, 0.3176471, 0, 1,
-1.635888, 1.351851, -0.2154779, 1, 0.3254902, 0, 1,
-1.631803, -1.615681, -3.286693, 1, 0.3294118, 0, 1,
-1.629158, 2.511427, 0.6642801, 1, 0.3372549, 0, 1,
-1.620521, 2.21033, -1.471489, 1, 0.3411765, 0, 1,
-1.615351, 0.7497309, -0.7065668, 1, 0.3490196, 0, 1,
-1.602047, 1.63195, -1.772233, 1, 0.3529412, 0, 1,
-1.601685, -1.064399, -0.592323, 1, 0.3607843, 0, 1,
-1.600284, -0.09385315, -1.707277, 1, 0.3647059, 0, 1,
-1.597793, -1.068433, -2.810424, 1, 0.372549, 0, 1,
-1.595435, -0.0009316972, -2.709855, 1, 0.3764706, 0, 1,
-1.580507, 1.938081, -1.330618, 1, 0.3843137, 0, 1,
-1.574159, -0.1272562, -2.095482, 1, 0.3882353, 0, 1,
-1.572245, 0.7033386, -1.22501, 1, 0.3960784, 0, 1,
-1.569664, -1.088811, -3.628011, 1, 0.4039216, 0, 1,
-1.531366, 0.1208497, -0.6134945, 1, 0.4078431, 0, 1,
-1.529974, 0.7717168, -0.6897825, 1, 0.4156863, 0, 1,
-1.524672, 0.3764107, -1.080298, 1, 0.4196078, 0, 1,
-1.523096, -0.2634323, -3.347572, 1, 0.427451, 0, 1,
-1.521213, 0.7558767, -0.1558738, 1, 0.4313726, 0, 1,
-1.501415, -0.1173814, -2.740573, 1, 0.4392157, 0, 1,
-1.49237, -0.3754675, -1.887951, 1, 0.4431373, 0, 1,
-1.491113, -0.4052254, -0.7433109, 1, 0.4509804, 0, 1,
-1.489067, 1.21431, -1.402341, 1, 0.454902, 0, 1,
-1.488611, -0.4180556, -3.190417, 1, 0.4627451, 0, 1,
-1.467306, -2.057808, -2.305699, 1, 0.4666667, 0, 1,
-1.452017, 2.208708, -1.551646, 1, 0.4745098, 0, 1,
-1.450626, -0.98418, -2.080112, 1, 0.4784314, 0, 1,
-1.448244, -0.3608306, -2.39904, 1, 0.4862745, 0, 1,
-1.433748, 0.3632176, 0.9616677, 1, 0.4901961, 0, 1,
-1.433482, 0.6953297, -0.05647495, 1, 0.4980392, 0, 1,
-1.419008, 0.1695501, -0.778761, 1, 0.5058824, 0, 1,
-1.419003, 0.2544576, -2.921947, 1, 0.509804, 0, 1,
-1.405408, 0.6004392, -1.859424, 1, 0.5176471, 0, 1,
-1.360871, -1.480566, -2.156936, 1, 0.5215687, 0, 1,
-1.359866, -0.2413732, 0.08899461, 1, 0.5294118, 0, 1,
-1.356209, 0.2533022, -0.7346368, 1, 0.5333334, 0, 1,
-1.353701, -0.0127825, -1.79134, 1, 0.5411765, 0, 1,
-1.336023, 1.64708, -0.6201618, 1, 0.5450981, 0, 1,
-1.334669, 0.8894804, 1.160107, 1, 0.5529412, 0, 1,
-1.327278, -0.4967819, -1.00956, 1, 0.5568628, 0, 1,
-1.294063, -1.151808, -3.195716, 1, 0.5647059, 0, 1,
-1.290795, 0.09100293, -0.2680737, 1, 0.5686275, 0, 1,
-1.290666, -0.2391695, -3.569901, 1, 0.5764706, 0, 1,
-1.284402, 0.2531131, -2.276221, 1, 0.5803922, 0, 1,
-1.279098, 0.007862506, 0.01650063, 1, 0.5882353, 0, 1,
-1.279042, 0.4114946, -1.631995, 1, 0.5921569, 0, 1,
-1.262056, -0.3003358, -2.562751, 1, 0.6, 0, 1,
-1.256269, -0.2754707, -0.2354684, 1, 0.6078432, 0, 1,
-1.249091, 0.5494456, -0.1462873, 1, 0.6117647, 0, 1,
-1.239908, 1.888497, -0.5516461, 1, 0.6196079, 0, 1,
-1.238564, -0.1983793, -3.584715, 1, 0.6235294, 0, 1,
-1.23722, -0.2767702, -2.188622, 1, 0.6313726, 0, 1,
-1.233282, 0.08949456, -0.9259309, 1, 0.6352941, 0, 1,
-1.232607, -1.698668, -2.527626, 1, 0.6431373, 0, 1,
-1.227685, 0.0135265, -0.03723296, 1, 0.6470588, 0, 1,
-1.227614, -0.2530481, -2.185718, 1, 0.654902, 0, 1,
-1.222544, -1.618304, -1.929066, 1, 0.6588235, 0, 1,
-1.209064, -1.159812, -4.649341, 1, 0.6666667, 0, 1,
-1.202024, -0.3492625, -2.168415, 1, 0.6705883, 0, 1,
-1.190262, -2.0692, -3.569267, 1, 0.6784314, 0, 1,
-1.178163, 0.5226348, -0.5708828, 1, 0.682353, 0, 1,
-1.170466, -0.02488639, -2.344727, 1, 0.6901961, 0, 1,
-1.169508, -0.4095516, -3.489552, 1, 0.6941177, 0, 1,
-1.165253, 0.8473232, -1.587776, 1, 0.7019608, 0, 1,
-1.154412, 1.552032, 1.766435, 1, 0.7098039, 0, 1,
-1.152086, 0.3812957, -3.048779, 1, 0.7137255, 0, 1,
-1.147021, -0.7158459, -1.806106, 1, 0.7215686, 0, 1,
-1.140186, -0.1666496, -1.91557, 1, 0.7254902, 0, 1,
-1.138712, -0.5280229, -2.365127, 1, 0.7333333, 0, 1,
-1.136986, 1.468216, -1.601352, 1, 0.7372549, 0, 1,
-1.135776, -0.6784031, -1.957259, 1, 0.7450981, 0, 1,
-1.126972, -1.216045, -2.246406, 1, 0.7490196, 0, 1,
-1.12349, -0.05288706, -2.410305, 1, 0.7568628, 0, 1,
-1.114841, 0.109941, -1.349382, 1, 0.7607843, 0, 1,
-1.107825, 1.071023, -1.304608, 1, 0.7686275, 0, 1,
-1.107599, 1.49939, -0.9335779, 1, 0.772549, 0, 1,
-1.106924, 0.9761723, -1.94034, 1, 0.7803922, 0, 1,
-1.10604, -0.3869825, -3.116146, 1, 0.7843137, 0, 1,
-1.102947, -2.11489, -3.456574, 1, 0.7921569, 0, 1,
-1.101781, -1.568991, -2.661923, 1, 0.7960784, 0, 1,
-1.100856, 0.4843559, -0.1595049, 1, 0.8039216, 0, 1,
-1.087043, 0.1451561, -2.7159, 1, 0.8117647, 0, 1,
-1.078018, 1.30234, 0.0635106, 1, 0.8156863, 0, 1,
-1.073606, 0.9461231, -0.001804403, 1, 0.8235294, 0, 1,
-1.073356, 0.4231144, -0.6500754, 1, 0.827451, 0, 1,
-1.068406, -0.6818724, -1.305768, 1, 0.8352941, 0, 1,
-1.060879, 0.7288826, -2.39758, 1, 0.8392157, 0, 1,
-1.056322, 1.22926, -3.826437, 1, 0.8470588, 0, 1,
-1.051508, -1.295494, -2.791038, 1, 0.8509804, 0, 1,
-1.04868, -0.1835171, -3.611189, 1, 0.8588235, 0, 1,
-1.047272, -0.6115162, -1.497674, 1, 0.8627451, 0, 1,
-1.044735, 0.8135014, -6.807392e-05, 1, 0.8705882, 0, 1,
-1.030112, -0.786567, -2.232805, 1, 0.8745098, 0, 1,
-1.022261, 1.566489, -0.02220506, 1, 0.8823529, 0, 1,
-1.012645, -0.08969337, -1.622079, 1, 0.8862745, 0, 1,
-1.002031, -0.4988183, -2.398968, 1, 0.8941177, 0, 1,
-0.9968762, 0.5390553, -0.4772086, 1, 0.8980392, 0, 1,
-0.9942949, 0.6101605, -0.1190003, 1, 0.9058824, 0, 1,
-0.9941849, -0.6024499, -2.361037, 1, 0.9137255, 0, 1,
-0.9875278, 0.7850225, -1.050952, 1, 0.9176471, 0, 1,
-0.9858172, 1.096125, -1.273347, 1, 0.9254902, 0, 1,
-0.9821996, -1.764713, -3.384933, 1, 0.9294118, 0, 1,
-0.9820328, 0.03844034, -2.473512, 1, 0.9372549, 0, 1,
-0.98103, -1.400587, -3.4146, 1, 0.9411765, 0, 1,
-0.9711366, 0.6081031, -3.196525, 1, 0.9490196, 0, 1,
-0.9701959, -0.2498153, -1.568162, 1, 0.9529412, 0, 1,
-0.9618819, 0.2473242, -2.065025, 1, 0.9607843, 0, 1,
-0.9565919, -0.08753308, -0.5288581, 1, 0.9647059, 0, 1,
-0.9565035, -1.794072, -2.263438, 1, 0.972549, 0, 1,
-0.9490775, -1.537111, -3.965784, 1, 0.9764706, 0, 1,
-0.9464428, -0.0283411, -0.2174294, 1, 0.9843137, 0, 1,
-0.9419549, 0.4460955, -2.192273, 1, 0.9882353, 0, 1,
-0.9359788, 1.920475, -1.125159, 1, 0.9960784, 0, 1,
-0.9356467, 1.288608, -0.04917669, 0.9960784, 1, 0, 1,
-0.9334947, -0.9006673, -2.54533, 0.9921569, 1, 0, 1,
-0.9310018, 1.324695, -1.942726, 0.9843137, 1, 0, 1,
-0.9295197, -1.56455, -2.266628, 0.9803922, 1, 0, 1,
-0.9278531, 0.5653245, -0.2028326, 0.972549, 1, 0, 1,
-0.9245239, -0.09377667, -2.019929, 0.9686275, 1, 0, 1,
-0.9235315, 0.4699111, -0.9151847, 0.9607843, 1, 0, 1,
-0.9224203, 0.3426935, -0.8964239, 0.9568627, 1, 0, 1,
-0.9169886, -1.801414, -1.956301, 0.9490196, 1, 0, 1,
-0.916865, 0.2693339, -2.07705, 0.945098, 1, 0, 1,
-0.9126654, -2.285671, -2.106462, 0.9372549, 1, 0, 1,
-0.9023638, 0.7269933, -1.101514, 0.9333333, 1, 0, 1,
-0.899963, -1.516667, -2.459595, 0.9254902, 1, 0, 1,
-0.8990387, -0.1147481, -1.791391, 0.9215686, 1, 0, 1,
-0.8937872, 0.2176771, -0.9255036, 0.9137255, 1, 0, 1,
-0.8889551, 0.5565299, -3.22964, 0.9098039, 1, 0, 1,
-0.8877602, 1.350938, 1.252832, 0.9019608, 1, 0, 1,
-0.8852611, -0.3783836, -1.850711, 0.8941177, 1, 0, 1,
-0.8850201, 0.8907492, -1.43396, 0.8901961, 1, 0, 1,
-0.8847697, -0.3661094, -1.85135, 0.8823529, 1, 0, 1,
-0.8723562, 0.2488898, -0.3893456, 0.8784314, 1, 0, 1,
-0.8576116, -0.2431389, -2.021427, 0.8705882, 1, 0, 1,
-0.8571729, -0.3425787, -2.465487, 0.8666667, 1, 0, 1,
-0.8534642, -1.330009, -2.069695, 0.8588235, 1, 0, 1,
-0.8419299, 2.493922, -1.164544, 0.854902, 1, 0, 1,
-0.8368223, 0.2871315, -0.66114, 0.8470588, 1, 0, 1,
-0.8367234, -0.9406617, -2.184937, 0.8431373, 1, 0, 1,
-0.8339571, 0.3716458, -1.502295, 0.8352941, 1, 0, 1,
-0.8308985, 0.056598, -1.564147, 0.8313726, 1, 0, 1,
-0.8307872, 1.192916, -0.2958764, 0.8235294, 1, 0, 1,
-0.8303284, -1.468387, -2.646733, 0.8196079, 1, 0, 1,
-0.8222397, -0.9361773, -1.172213, 0.8117647, 1, 0, 1,
-0.8209633, -0.1630809, -3.956247, 0.8078431, 1, 0, 1,
-0.8156548, -1.338394, -2.660135, 0.8, 1, 0, 1,
-0.8088901, -1.049177, -1.682658, 0.7921569, 1, 0, 1,
-0.8072848, -0.8191278, -3.406049, 0.7882353, 1, 0, 1,
-0.8036456, -1.425788, -5.600284, 0.7803922, 1, 0, 1,
-0.8030302, 1.379529, 1.387594, 0.7764706, 1, 0, 1,
-0.8021486, -0.02095479, -1.642651, 0.7686275, 1, 0, 1,
-0.800099, 0.5828805, -2.102774, 0.7647059, 1, 0, 1,
-0.7952505, 1.12496, 0.1242154, 0.7568628, 1, 0, 1,
-0.7951517, 0.1401389, -2.143214, 0.7529412, 1, 0, 1,
-0.7925113, -1.498161, -3.839646, 0.7450981, 1, 0, 1,
-0.7876585, 0.3288842, -1.704866, 0.7411765, 1, 0, 1,
-0.7858148, 0.05880163, -1.433328, 0.7333333, 1, 0, 1,
-0.7832403, 0.9912098, 0.2917377, 0.7294118, 1, 0, 1,
-0.7795685, -0.7628003, -2.644834, 0.7215686, 1, 0, 1,
-0.7780258, -0.4215643, -2.982406, 0.7176471, 1, 0, 1,
-0.7686935, -1.671339, -2.002826, 0.7098039, 1, 0, 1,
-0.7682295, -2.056389, -0.3253333, 0.7058824, 1, 0, 1,
-0.7679842, 1.038393, -1.245307, 0.6980392, 1, 0, 1,
-0.7650292, 1.387469, 1.515377, 0.6901961, 1, 0, 1,
-0.7602442, 1.01898, -1.708443, 0.6862745, 1, 0, 1,
-0.7561755, -0.2489102, -1.496529, 0.6784314, 1, 0, 1,
-0.7490027, -0.01282792, -2.942862, 0.6745098, 1, 0, 1,
-0.7438704, 1.739795, -0.9405591, 0.6666667, 1, 0, 1,
-0.7384885, 2.517948, 0.8035858, 0.6627451, 1, 0, 1,
-0.7380849, -0.1744868, -0.4820692, 0.654902, 1, 0, 1,
-0.7344432, 1.147618, -1.567733, 0.6509804, 1, 0, 1,
-0.7330662, 1.087264, -0.6536035, 0.6431373, 1, 0, 1,
-0.7329958, -0.2601521, -1.562663, 0.6392157, 1, 0, 1,
-0.731276, -0.1186341, -3.880939, 0.6313726, 1, 0, 1,
-0.7306709, 0.6972569, -1.22511, 0.627451, 1, 0, 1,
-0.7209678, 0.6860215, -1.713614, 0.6196079, 1, 0, 1,
-0.7199852, 0.4150671, -1.31099, 0.6156863, 1, 0, 1,
-0.7180853, 0.05246671, -2.836115, 0.6078432, 1, 0, 1,
-0.7168604, -1.097309, -1.749921, 0.6039216, 1, 0, 1,
-0.7162042, 0.3514039, 1.531131, 0.5960785, 1, 0, 1,
-0.71311, 1.114018, -0.5905778, 0.5882353, 1, 0, 1,
-0.7122057, -0.2452837, -1.356804, 0.5843138, 1, 0, 1,
-0.7119741, 1.916208, 1.691599, 0.5764706, 1, 0, 1,
-0.7090841, 0.368192, -1.684279, 0.572549, 1, 0, 1,
-0.7059672, -0.6027676, -2.441174, 0.5647059, 1, 0, 1,
-0.7047861, 1.613172, 0.5172579, 0.5607843, 1, 0, 1,
-0.702311, 0.2836564, -1.146489, 0.5529412, 1, 0, 1,
-0.7018775, -0.03798211, -1.038497, 0.5490196, 1, 0, 1,
-0.6966189, 0.8252572, 1.041173, 0.5411765, 1, 0, 1,
-0.6911675, 0.3182379, -3.250968, 0.5372549, 1, 0, 1,
-0.6895297, -0.8767274, -2.155717, 0.5294118, 1, 0, 1,
-0.6817431, 0.3275416, -0.9870243, 0.5254902, 1, 0, 1,
-0.6806304, 0.6164602, -2.323307, 0.5176471, 1, 0, 1,
-0.6787387, -0.5256182, -2.765916, 0.5137255, 1, 0, 1,
-0.6720461, -1.339803, -3.117559, 0.5058824, 1, 0, 1,
-0.6702477, 1.002679, -1.248349, 0.5019608, 1, 0, 1,
-0.6681271, 1.253567, 0.7667763, 0.4941176, 1, 0, 1,
-0.661268, 0.9728476, -0.8334939, 0.4862745, 1, 0, 1,
-0.6592544, -2.871281, -3.367785, 0.4823529, 1, 0, 1,
-0.6555454, 1.402579, -1.125987, 0.4745098, 1, 0, 1,
-0.6553083, -0.2791424, -1.77136, 0.4705882, 1, 0, 1,
-0.6484451, -1.054186, -3.545937, 0.4627451, 1, 0, 1,
-0.6468987, 0.51955, -1.649838, 0.4588235, 1, 0, 1,
-0.6419623, -0.3684423, -2.811255, 0.4509804, 1, 0, 1,
-0.6408474, -0.3345136, -2.607787, 0.4470588, 1, 0, 1,
-0.6389674, -1.596589, -2.41639, 0.4392157, 1, 0, 1,
-0.6328023, -0.01266246, -1.241168, 0.4352941, 1, 0, 1,
-0.6177489, 0.3762724, -2.333651, 0.427451, 1, 0, 1,
-0.6109209, 0.8431624, 0.192763, 0.4235294, 1, 0, 1,
-0.6093433, 1.829774, 0.4166341, 0.4156863, 1, 0, 1,
-0.6081532, 1.343358, -0.4095728, 0.4117647, 1, 0, 1,
-0.6019693, -1.437622, -1.650748, 0.4039216, 1, 0, 1,
-0.6002291, -1.008169, -3.096367, 0.3960784, 1, 0, 1,
-0.5987864, 0.6433072, -1.367642, 0.3921569, 1, 0, 1,
-0.5983778, 1.297687, -0.7100092, 0.3843137, 1, 0, 1,
-0.5927573, 0.04202751, -2.119683, 0.3803922, 1, 0, 1,
-0.5901442, 1.23278, -0.06536829, 0.372549, 1, 0, 1,
-0.5869205, -0.09147781, 0.4171917, 0.3686275, 1, 0, 1,
-0.5826718, 0.1156211, -2.068124, 0.3607843, 1, 0, 1,
-0.5801401, 1.604607, 0.1923419, 0.3568628, 1, 0, 1,
-0.5775496, 1.489365, -0.9713027, 0.3490196, 1, 0, 1,
-0.5654085, 0.3345255, -1.373194, 0.345098, 1, 0, 1,
-0.5608194, -0.344874, -1.580094, 0.3372549, 1, 0, 1,
-0.5603148, -0.3058041, -1.847847, 0.3333333, 1, 0, 1,
-0.5579369, 0.1759664, -0.006215844, 0.3254902, 1, 0, 1,
-0.5570586, -0.8864651, -2.41278, 0.3215686, 1, 0, 1,
-0.549885, -0.3046631, -2.498784, 0.3137255, 1, 0, 1,
-0.5476682, -0.2912045, -1.305246, 0.3098039, 1, 0, 1,
-0.5456163, -0.6313972, -2.856677, 0.3019608, 1, 0, 1,
-0.5353188, 0.6798954, -1.346278, 0.2941177, 1, 0, 1,
-0.5334729, -0.1631739, -0.253837, 0.2901961, 1, 0, 1,
-0.532864, -0.6198547, -4.69711, 0.282353, 1, 0, 1,
-0.5309573, 0.5355631, -0.3257657, 0.2784314, 1, 0, 1,
-0.5309098, 2.057451, -0.3261968, 0.2705882, 1, 0, 1,
-0.5296638, 0.5606098, -2.46606, 0.2666667, 1, 0, 1,
-0.5253705, -0.4133085, -0.1740031, 0.2588235, 1, 0, 1,
-0.5250686, -0.6627038, -1.289897, 0.254902, 1, 0, 1,
-0.5200352, 1.114178, 0.5768193, 0.2470588, 1, 0, 1,
-0.5188904, -0.3558252, -1.028332, 0.2431373, 1, 0, 1,
-0.5181341, 1.612997, -1.361105, 0.2352941, 1, 0, 1,
-0.5146868, 0.4419781, -0.6784852, 0.2313726, 1, 0, 1,
-0.5129501, -0.1636882, -1.323418, 0.2235294, 1, 0, 1,
-0.5115202, 0.2947111, -0.2353138, 0.2196078, 1, 0, 1,
-0.5085229, 0.02479349, -2.006066, 0.2117647, 1, 0, 1,
-0.5060341, -0.2831237, -2.072514, 0.2078431, 1, 0, 1,
-0.5037214, -0.9636983, -0.8217692, 0.2, 1, 0, 1,
-0.4965644, -0.3449933, -1.212548, 0.1921569, 1, 0, 1,
-0.4963137, -1.285142, -2.435527, 0.1882353, 1, 0, 1,
-0.4953867, 2.854848, -0.08676851, 0.1803922, 1, 0, 1,
-0.4944118, -1.000651, -3.124608, 0.1764706, 1, 0, 1,
-0.4926857, 0.4987285, -0.3238095, 0.1686275, 1, 0, 1,
-0.4899064, -1.095436, -2.49319, 0.1647059, 1, 0, 1,
-0.4891348, -1.054855, -2.309495, 0.1568628, 1, 0, 1,
-0.4887272, -1.394651, -3.85105, 0.1529412, 1, 0, 1,
-0.4846182, -1.210995, -2.791924, 0.145098, 1, 0, 1,
-0.4802512, -1.430127, -3.051677, 0.1411765, 1, 0, 1,
-0.4767429, -2.205993, -5.616155, 0.1333333, 1, 0, 1,
-0.4718233, 1.055935, -1.376948, 0.1294118, 1, 0, 1,
-0.4684536, 0.2801725, 0.4526629, 0.1215686, 1, 0, 1,
-0.4650172, 0.9568318, -1.227933, 0.1176471, 1, 0, 1,
-0.463987, 1.731214, -0.07191498, 0.1098039, 1, 0, 1,
-0.4613115, 0.138727, -1.655429, 0.1058824, 1, 0, 1,
-0.4597925, -0.1543, -0.9789274, 0.09803922, 1, 0, 1,
-0.4570006, 0.6025611, -1.107868, 0.09019608, 1, 0, 1,
-0.4553578, -1.881343, -3.662772, 0.08627451, 1, 0, 1,
-0.4547645, -0.5267738, -3.152754, 0.07843138, 1, 0, 1,
-0.4520094, 0.2690592, -0.227404, 0.07450981, 1, 0, 1,
-0.4500528, -0.6982087, -3.845633, 0.06666667, 1, 0, 1,
-0.4482034, -0.1975666, -3.267314, 0.0627451, 1, 0, 1,
-0.446998, 0.5380961, 0.3987658, 0.05490196, 1, 0, 1,
-0.445567, -0.4140358, -0.5939292, 0.05098039, 1, 0, 1,
-0.4440428, 0.9667931, -0.7364756, 0.04313726, 1, 0, 1,
-0.4405288, 0.2291597, -2.855666, 0.03921569, 1, 0, 1,
-0.4376684, -0.2770199, -1.199648, 0.03137255, 1, 0, 1,
-0.431493, 0.1619925, -1.87268, 0.02745098, 1, 0, 1,
-0.422984, 0.09255163, 0.1754349, 0.01960784, 1, 0, 1,
-0.4224915, -0.268638, -1.729284, 0.01568628, 1, 0, 1,
-0.4223715, -2.439287, -2.488126, 0.007843138, 1, 0, 1,
-0.4217708, 0.7492604, 0.8056397, 0.003921569, 1, 0, 1,
-0.4208878, 1.056701, -1.060734, 0, 1, 0.003921569, 1,
-0.4166757, 0.05782623, -1.524836, 0, 1, 0.01176471, 1,
-0.4124517, 0.3850342, -1.916073, 0, 1, 0.01568628, 1,
-0.4110243, 0.3070306, -0.9561735, 0, 1, 0.02352941, 1,
-0.4078143, 1.071571, -1.043525, 0, 1, 0.02745098, 1,
-0.4026411, -0.1048938, -2.683774, 0, 1, 0.03529412, 1,
-0.4026147, 0.63772, 0.02227505, 0, 1, 0.03921569, 1,
-0.3977513, -0.4404052, -0.8135872, 0, 1, 0.04705882, 1,
-0.3973146, -1.128651, -3.012067, 0, 1, 0.05098039, 1,
-0.3885631, -0.6434972, -2.072136, 0, 1, 0.05882353, 1,
-0.3837577, 0.4604765, 0.3092488, 0, 1, 0.0627451, 1,
-0.3826169, -0.7230772, -2.194131, 0, 1, 0.07058824, 1,
-0.381028, -1.369249, -2.903646, 0, 1, 0.07450981, 1,
-0.3800247, -0.05343543, -0.9838467, 0, 1, 0.08235294, 1,
-0.3792071, 0.3883227, -2.266199, 0, 1, 0.08627451, 1,
-0.3787849, -0.647081, -3.376987, 0, 1, 0.09411765, 1,
-0.3784142, 1.344134, -1.444053, 0, 1, 0.1019608, 1,
-0.3725999, -0.6324624, -2.176406, 0, 1, 0.1058824, 1,
-0.3718812, 0.6165156, -0.7107043, 0, 1, 0.1137255, 1,
-0.370527, 1.188987, 0.4873437, 0, 1, 0.1176471, 1,
-0.3682714, 0.9799739, 0.5679618, 0, 1, 0.1254902, 1,
-0.3681265, 1.016931, 0.2337535, 0, 1, 0.1294118, 1,
-0.3671903, 0.3433476, 0.03781668, 0, 1, 0.1372549, 1,
-0.3663261, 0.04970206, -2.328839, 0, 1, 0.1411765, 1,
-0.3662617, 0.3238364, -1.315984, 0, 1, 0.1490196, 1,
-0.3620121, -0.5736289, -0.9517324, 0, 1, 0.1529412, 1,
-0.3616942, -0.5681252, -2.803512, 0, 1, 0.1607843, 1,
-0.3612694, -0.4248114, -1.658361, 0, 1, 0.1647059, 1,
-0.3603275, 0.7333145, 1.098425, 0, 1, 0.172549, 1,
-0.3585567, -1.389898, -1.378939, 0, 1, 0.1764706, 1,
-0.3579228, -0.7263955, -2.088439, 0, 1, 0.1843137, 1,
-0.3574143, 0.5139905, 0.1197103, 0, 1, 0.1882353, 1,
-0.3568912, 0.9157444, -1.37161, 0, 1, 0.1960784, 1,
-0.3542687, -1.570257, -3.434811, 0, 1, 0.2039216, 1,
-0.3534591, 0.1175502, -1.687661, 0, 1, 0.2078431, 1,
-0.3514128, -1.452199, -3.191241, 0, 1, 0.2156863, 1,
-0.3494093, 0.1526913, 0.6341602, 0, 1, 0.2196078, 1,
-0.3473499, 0.7827775, 0.1658829, 0, 1, 0.227451, 1,
-0.3468554, -0.06064636, -1.489524, 0, 1, 0.2313726, 1,
-0.342147, -2.817163, -2.484198, 0, 1, 0.2392157, 1,
-0.3368942, -0.447524, -2.244002, 0, 1, 0.2431373, 1,
-0.3364014, -0.3546075, -3.694361, 0, 1, 0.2509804, 1,
-0.3362503, 1.162998, -0.583801, 0, 1, 0.254902, 1,
-0.3350793, 0.534509, 1.093467, 0, 1, 0.2627451, 1,
-0.3310792, 0.007952181, 0.1155065, 0, 1, 0.2666667, 1,
-0.3305242, 2.807988, -0.5629272, 0, 1, 0.2745098, 1,
-0.3289234, -1.26682, -4.134378, 0, 1, 0.2784314, 1,
-0.3211493, -0.108992, -1.089789, 0, 1, 0.2862745, 1,
-0.3206057, 1.254704, -0.7254093, 0, 1, 0.2901961, 1,
-0.3162659, 0.1029846, -0.3823994, 0, 1, 0.2980392, 1,
-0.3136134, 0.8123722, 0.6008444, 0, 1, 0.3058824, 1,
-0.3092413, 0.5266551, 0.6292461, 0, 1, 0.3098039, 1,
-0.3079503, -0.3991792, -0.6424178, 0, 1, 0.3176471, 1,
-0.3056629, 0.9649303, -0.3444363, 0, 1, 0.3215686, 1,
-0.3055172, -0.6244016, -1.607285, 0, 1, 0.3294118, 1,
-0.3004367, -1.058757, -3.975176, 0, 1, 0.3333333, 1,
-0.2959185, 0.443525, -2.209055, 0, 1, 0.3411765, 1,
-0.2949849, -0.04707012, -1.353033, 0, 1, 0.345098, 1,
-0.2931873, 1.350552, 0.4646148, 0, 1, 0.3529412, 1,
-0.2853975, -0.3584996, -0.6592034, 0, 1, 0.3568628, 1,
-0.2851836, -1.09357, -1.535577, 0, 1, 0.3647059, 1,
-0.2766773, 1.02234, -1.959165, 0, 1, 0.3686275, 1,
-0.2757809, 0.5562067, 0.3129161, 0, 1, 0.3764706, 1,
-0.2748521, 1.299165, 0.9645925, 0, 1, 0.3803922, 1,
-0.2712592, -0.2560163, -3.275818, 0, 1, 0.3882353, 1,
-0.2707239, 1.00619, -2.848219, 0, 1, 0.3921569, 1,
-0.2689827, -0.7669207, -3.137408, 0, 1, 0.4, 1,
-0.2628352, 0.4165571, -0.516039, 0, 1, 0.4078431, 1,
-0.2616019, 0.8542215, -0.6216373, 0, 1, 0.4117647, 1,
-0.2588092, -0.6219135, -4.393716, 0, 1, 0.4196078, 1,
-0.2587999, -0.0965402, -0.797981, 0, 1, 0.4235294, 1,
-0.25841, 0.2633332, 0.1839216, 0, 1, 0.4313726, 1,
-0.2554428, 1.671069, 1.145377, 0, 1, 0.4352941, 1,
-0.2542664, -0.7426298, -1.471771, 0, 1, 0.4431373, 1,
-0.2533797, 0.06789654, -0.6197277, 0, 1, 0.4470588, 1,
-0.2531338, -1.065216, -1.432994, 0, 1, 0.454902, 1,
-0.2519804, -0.008773184, -1.577432, 0, 1, 0.4588235, 1,
-0.2509065, 0.1091002, -0.09119542, 0, 1, 0.4666667, 1,
-0.2492411, -1.388324, -5.03321, 0, 1, 0.4705882, 1,
-0.2460122, 0.2423151, -1.911032, 0, 1, 0.4784314, 1,
-0.2437171, -0.4014966, -1.895774, 0, 1, 0.4823529, 1,
-0.238834, -0.2023433, -1.505775, 0, 1, 0.4901961, 1,
-0.2383169, 0.2395787, -0.888479, 0, 1, 0.4941176, 1,
-0.235945, 0.2862568, 0.01656748, 0, 1, 0.5019608, 1,
-0.2302816, 0.8794057, -1.007578, 0, 1, 0.509804, 1,
-0.2287029, -0.2697821, -1.047237, 0, 1, 0.5137255, 1,
-0.2276527, 0.05791235, -1.096524, 0, 1, 0.5215687, 1,
-0.2266847, 0.1697427, -0.9079901, 0, 1, 0.5254902, 1,
-0.225743, -1.027218, -2.535719, 0, 1, 0.5333334, 1,
-0.225389, 3.691108, 1.322834, 0, 1, 0.5372549, 1,
-0.2243837, 0.4320414, 1.296818, 0, 1, 0.5450981, 1,
-0.2231975, -1.099747, -3.306757, 0, 1, 0.5490196, 1,
-0.2209178, 0.4958679, 1.146019, 0, 1, 0.5568628, 1,
-0.2189202, 0.5068467, 1.926442, 0, 1, 0.5607843, 1,
-0.2165394, -0.8322253, -3.590416, 0, 1, 0.5686275, 1,
-0.2102786, -0.2458594, -0.8680714, 0, 1, 0.572549, 1,
-0.2052524, -0.3375926, -2.457073, 0, 1, 0.5803922, 1,
-0.2028308, -0.200238, -3.357225, 0, 1, 0.5843138, 1,
-0.1990146, 0.0255188, -1.084695, 0, 1, 0.5921569, 1,
-0.1989493, 0.4120693, -1.481195, 0, 1, 0.5960785, 1,
-0.1982912, -1.294319, -2.398721, 0, 1, 0.6039216, 1,
-0.1972726, 0.6851434, -0.5560511, 0, 1, 0.6117647, 1,
-0.1954399, -0.5503995, -2.441123, 0, 1, 0.6156863, 1,
-0.1943588, -0.3054975, -4.028868, 0, 1, 0.6235294, 1,
-0.1937314, 1.71367, -1.690595, 0, 1, 0.627451, 1,
-0.1923901, 1.434057, -0.342647, 0, 1, 0.6352941, 1,
-0.1914891, -0.2046549, -1.712803, 0, 1, 0.6392157, 1,
-0.1896382, 1.580926, -0.0464345, 0, 1, 0.6470588, 1,
-0.1866326, -1.32727, -0.8178375, 0, 1, 0.6509804, 1,
-0.1838978, -0.9649129, -4.143608, 0, 1, 0.6588235, 1,
-0.1820768, -0.270701, -2.505457, 0, 1, 0.6627451, 1,
-0.1817496, 0.7476296, 0.6001176, 0, 1, 0.6705883, 1,
-0.180427, 0.003396644, -2.424137, 0, 1, 0.6745098, 1,
-0.1777112, -0.6361939, -3.358724, 0, 1, 0.682353, 1,
-0.1765223, -1.596074, -2.181882, 0, 1, 0.6862745, 1,
-0.1756675, 0.01643188, -2.037803, 0, 1, 0.6941177, 1,
-0.17526, -2.084918, -4.330779, 0, 1, 0.7019608, 1,
-0.1729833, -0.6041151, -1.900045, 0, 1, 0.7058824, 1,
-0.1690113, 0.4246702, -1.66208, 0, 1, 0.7137255, 1,
-0.1644613, -0.3941883, -3.102226, 0, 1, 0.7176471, 1,
-0.1631604, 0.3742372, 0.09631895, 0, 1, 0.7254902, 1,
-0.1624533, 1.343919, 0.4737356, 0, 1, 0.7294118, 1,
-0.1611859, -0.9766734, -3.776336, 0, 1, 0.7372549, 1,
-0.141722, 0.7101978, 2.08159, 0, 1, 0.7411765, 1,
-0.1388852, 1.108614, -0.1136872, 0, 1, 0.7490196, 1,
-0.1385239, -0.5669132, -3.105197, 0, 1, 0.7529412, 1,
-0.1382143, 0.2546953, -0.2850538, 0, 1, 0.7607843, 1,
-0.1323684, 1.586649, -0.5182263, 0, 1, 0.7647059, 1,
-0.1268255, 0.3558865, -1.298381, 0, 1, 0.772549, 1,
-0.1247769, -0.8302704, -4.68434, 0, 1, 0.7764706, 1,
-0.1220011, -0.4712365, -2.97053, 0, 1, 0.7843137, 1,
-0.1216813, -0.9154471, -3.541538, 0, 1, 0.7882353, 1,
-0.1201831, 0.6209459, -0.1184258, 0, 1, 0.7960784, 1,
-0.1193309, -0.04991377, -1.445487, 0, 1, 0.8039216, 1,
-0.1191376, -0.2025356, -2.045831, 0, 1, 0.8078431, 1,
-0.1148085, -0.1117487, -1.735498, 0, 1, 0.8156863, 1,
-0.114307, -0.9360014, -3.980065, 0, 1, 0.8196079, 1,
-0.1136207, 0.9470101, 0.03539571, 0, 1, 0.827451, 1,
-0.1116034, 0.8520797, 0.6776591, 0, 1, 0.8313726, 1,
-0.110607, -0.8381342, -2.810464, 0, 1, 0.8392157, 1,
-0.1047836, -1.760706, -3.617217, 0, 1, 0.8431373, 1,
-0.1035403, -1.168988, -3.587599, 0, 1, 0.8509804, 1,
-0.09571854, 0.3980275, 0.04588037, 0, 1, 0.854902, 1,
-0.09570677, 0.1333764, 1.921211, 0, 1, 0.8627451, 1,
-0.09008674, 1.242922, 0.4438491, 0, 1, 0.8666667, 1,
-0.08973764, -1.227799, -2.617906, 0, 1, 0.8745098, 1,
-0.08859301, -2.437276, -2.994416, 0, 1, 0.8784314, 1,
-0.08735038, 1.410067, 0.3588936, 0, 1, 0.8862745, 1,
-0.08714703, 0.3366898, -0.1867736, 0, 1, 0.8901961, 1,
-0.08667159, 0.2864713, -1.017625, 0, 1, 0.8980392, 1,
-0.08405943, -1.433978, -3.1141, 0, 1, 0.9058824, 1,
-0.08046342, -1.279639, -3.821705, 0, 1, 0.9098039, 1,
-0.07915424, -1.842905, -2.858692, 0, 1, 0.9176471, 1,
-0.0780912, -0.6521741, -3.98333, 0, 1, 0.9215686, 1,
-0.07755043, -1.036308, -2.389518, 0, 1, 0.9294118, 1,
-0.07649709, 0.3649687, -0.6295323, 0, 1, 0.9333333, 1,
-0.07327433, -0.2578909, -2.980333, 0, 1, 0.9411765, 1,
-0.07055899, 0.6101551, -1.193335, 0, 1, 0.945098, 1,
-0.06924492, -1.677355, -3.666066, 0, 1, 0.9529412, 1,
-0.06675346, -0.688224, -4.132713, 0, 1, 0.9568627, 1,
-0.06527195, -0.7751009, -3.496956, 0, 1, 0.9647059, 1,
-0.06264538, -0.5316367, -4.751883, 0, 1, 0.9686275, 1,
-0.04243654, 0.6514096, 1.926663, 0, 1, 0.9764706, 1,
-0.03713637, -0.206361, -4.12333, 0, 1, 0.9803922, 1,
-0.03508051, -0.6863039, -2.473031, 0, 1, 0.9882353, 1,
-0.03296478, -0.08170391, -3.958439, 0, 1, 0.9921569, 1,
-0.02904359, 0.6904176, 0.1168299, 0, 1, 1, 1,
-0.02678012, 0.223431, 0.5627918, 0, 0.9921569, 1, 1,
-0.02174409, 1.500407, -0.9971942, 0, 0.9882353, 1, 1,
-0.0213593, -0.9963377, -3.194937, 0, 0.9803922, 1, 1,
-0.02116635, -0.2578124, -3.457114, 0, 0.9764706, 1, 1,
-0.01563671, -0.1835799, -3.331989, 0, 0.9686275, 1, 1,
-0.01370745, -1.405805, -3.826583, 0, 0.9647059, 1, 1,
-0.01092661, -0.3833846, -3.368371, 0, 0.9568627, 1, 1,
-0.00469674, 0.7201992, 1.602744, 0, 0.9529412, 1, 1,
-0.000507923, 0.6825752, 1.266705, 0, 0.945098, 1, 1,
0.001554215, -0.2464053, 3.981993, 0, 0.9411765, 1, 1,
0.004945667, -1.250684, 1.766712, 0, 0.9333333, 1, 1,
0.005057387, -1.117012, 4.798506, 0, 0.9294118, 1, 1,
0.008103929, 0.8050674, -0.8584382, 0, 0.9215686, 1, 1,
0.008259634, -0.9878359, 2.552537, 0, 0.9176471, 1, 1,
0.01137505, -0.1372609, 2.917085, 0, 0.9098039, 1, 1,
0.0200033, 0.3387764, 0.4147508, 0, 0.9058824, 1, 1,
0.02030715, 1.796303, -0.5917159, 0, 0.8980392, 1, 1,
0.02588785, 0.7052603, 1.64444, 0, 0.8901961, 1, 1,
0.02746695, 1.637153, -0.4978998, 0, 0.8862745, 1, 1,
0.02752437, -1.05519, 4.727183, 0, 0.8784314, 1, 1,
0.03004587, 0.5815604, -1.389393, 0, 0.8745098, 1, 1,
0.03282399, 0.1993849, 0.1962589, 0, 0.8666667, 1, 1,
0.03437081, 0.3423001, 0.9815186, 0, 0.8627451, 1, 1,
0.03448348, -0.5084177, 1.71937, 0, 0.854902, 1, 1,
0.0370463, -1.528056, 1.35326, 0, 0.8509804, 1, 1,
0.03790651, -1.299974, 2.6368, 0, 0.8431373, 1, 1,
0.03823657, -0.1468229, 3.032019, 0, 0.8392157, 1, 1,
0.03876932, -0.1259729, 1.933696, 0, 0.8313726, 1, 1,
0.03995764, -0.6454823, 1.652388, 0, 0.827451, 1, 1,
0.04316063, 1.625383, -1.009087, 0, 0.8196079, 1, 1,
0.04527884, 0.1453626, -1.550715, 0, 0.8156863, 1, 1,
0.04646492, 1.170934, -0.2397992, 0, 0.8078431, 1, 1,
0.04967497, -0.1892679, 3.089731, 0, 0.8039216, 1, 1,
0.05075591, -1.235741, 3.64565, 0, 0.7960784, 1, 1,
0.05122868, -1.010387, 3.154739, 0, 0.7882353, 1, 1,
0.05228209, -2.209384, 2.142012, 0, 0.7843137, 1, 1,
0.05429816, -0.5463327, 3.816975, 0, 0.7764706, 1, 1,
0.05982893, -1.960475, 2.014986, 0, 0.772549, 1, 1,
0.0600189, -0.6390502, 1.075877, 0, 0.7647059, 1, 1,
0.06146418, -0.4348896, 2.996062, 0, 0.7607843, 1, 1,
0.06601945, -1.071007, 3.796326, 0, 0.7529412, 1, 1,
0.06672389, -1.867929, 4.270517, 0, 0.7490196, 1, 1,
0.06952506, -0.4836426, 5.488794, 0, 0.7411765, 1, 1,
0.07440467, -0.2339804, 1.706507, 0, 0.7372549, 1, 1,
0.07929332, 0.2570377, 1.379712, 0, 0.7294118, 1, 1,
0.08243095, 0.4433854, 1.190466, 0, 0.7254902, 1, 1,
0.08751551, -1.208528, 3.177164, 0, 0.7176471, 1, 1,
0.08752926, 0.1069697, 1.211136, 0, 0.7137255, 1, 1,
0.08869831, -0.08787908, 0.7518548, 0, 0.7058824, 1, 1,
0.09241521, -0.4534834, 1.749743, 0, 0.6980392, 1, 1,
0.09743011, 0.05898754, 0.9750304, 0, 0.6941177, 1, 1,
0.1009767, 1.477208, 1.454119, 0, 0.6862745, 1, 1,
0.1032613, -1.134795, 1.958254, 0, 0.682353, 1, 1,
0.104924, 0.2125818, 0.4229816, 0, 0.6745098, 1, 1,
0.1085125, 1.012906, -1.747998, 0, 0.6705883, 1, 1,
0.1199453, -0.7603608, 4.116084, 0, 0.6627451, 1, 1,
0.1311819, 0.06254942, 0.05098747, 0, 0.6588235, 1, 1,
0.1355177, -0.01051468, 0.5651934, 0, 0.6509804, 1, 1,
0.1362643, 1.427029, -0.2134452, 0, 0.6470588, 1, 1,
0.1431989, -0.4508218, 2.461206, 0, 0.6392157, 1, 1,
0.1437858, -0.7191151, 2.898613, 0, 0.6352941, 1, 1,
0.1458123, -1.413113, 1.921736, 0, 0.627451, 1, 1,
0.1464192, 1.15675, -0.7449809, 0, 0.6235294, 1, 1,
0.1466663, -1.271694, 3.558606, 0, 0.6156863, 1, 1,
0.1468588, -2.005385, 2.719289, 0, 0.6117647, 1, 1,
0.147641, -0.4155626, 1.877211, 0, 0.6039216, 1, 1,
0.1477995, 1.37189, 1.32533, 0, 0.5960785, 1, 1,
0.1484591, -1.550317, 3.451374, 0, 0.5921569, 1, 1,
0.1534248, 0.9308648, -1.57556, 0, 0.5843138, 1, 1,
0.1534345, -1.51891, 2.779984, 0, 0.5803922, 1, 1,
0.155443, -1.111575, 1.733773, 0, 0.572549, 1, 1,
0.1566085, 0.1152185, 0.6457501, 0, 0.5686275, 1, 1,
0.1570304, -0.4029976, 1.90811, 0, 0.5607843, 1, 1,
0.1622202, 1.292262, -1.939334, 0, 0.5568628, 1, 1,
0.1658131, -0.02932095, 1.437825, 0, 0.5490196, 1, 1,
0.1708656, -0.1788343, 2.623957, 0, 0.5450981, 1, 1,
0.1708996, 0.2662508, -0.05805036, 0, 0.5372549, 1, 1,
0.1787681, -0.4503757, 3.857643, 0, 0.5333334, 1, 1,
0.1791479, -0.8149408, 4.497328, 0, 0.5254902, 1, 1,
0.1822803, -0.1443704, 0.04739823, 0, 0.5215687, 1, 1,
0.1867959, 1.263265, 1.616264, 0, 0.5137255, 1, 1,
0.1870824, 0.7500136, 0.8818545, 0, 0.509804, 1, 1,
0.1899589, 0.2749062, 0.4180197, 0, 0.5019608, 1, 1,
0.1907374, 1.527821, 1.779397, 0, 0.4941176, 1, 1,
0.1910874, 0.2314076, 2.270717, 0, 0.4901961, 1, 1,
0.193533, -1.508606, 3.76627, 0, 0.4823529, 1, 1,
0.1956542, 0.1547398, 0.8146159, 0, 0.4784314, 1, 1,
0.1972983, -0.08037633, 2.411468, 0, 0.4705882, 1, 1,
0.1973291, 1.525625, 0.3728909, 0, 0.4666667, 1, 1,
0.2011146, -1.038479, 3.516822, 0, 0.4588235, 1, 1,
0.2123539, -1.590704, 2.597981, 0, 0.454902, 1, 1,
0.2142633, -0.3948596, 1.82905, 0, 0.4470588, 1, 1,
0.2145353, -0.3848916, 2.661908, 0, 0.4431373, 1, 1,
0.214892, -1.262102, 3.239038, 0, 0.4352941, 1, 1,
0.2166625, -2.061495, 4.431686, 0, 0.4313726, 1, 1,
0.2201232, 1.536307, -0.4625221, 0, 0.4235294, 1, 1,
0.2226358, 0.4261688, 1.387485, 0, 0.4196078, 1, 1,
0.2287523, 0.05017477, 1.779438, 0, 0.4117647, 1, 1,
0.2321106, -1.392446, 2.756499, 0, 0.4078431, 1, 1,
0.2340743, -0.5653037, 4.087091, 0, 0.4, 1, 1,
0.2355949, -0.5079914, 4.355482, 0, 0.3921569, 1, 1,
0.2372131, -0.9543937, 1.518994, 0, 0.3882353, 1, 1,
0.2390853, -0.8737205, 4.310079, 0, 0.3803922, 1, 1,
0.2415108, -1.096423, 2.765655, 0, 0.3764706, 1, 1,
0.2433226, 0.7282319, 0.8419635, 0, 0.3686275, 1, 1,
0.2440251, -0.6488227, 1.392648, 0, 0.3647059, 1, 1,
0.2464458, -0.9418443, 1.972825, 0, 0.3568628, 1, 1,
0.2502092, -0.6154521, 3.443145, 0, 0.3529412, 1, 1,
0.2517768, 0.6320348, -0.7271872, 0, 0.345098, 1, 1,
0.2551707, 0.6440863, 0.4273604, 0, 0.3411765, 1, 1,
0.25947, 0.4226548, -0.2171337, 0, 0.3333333, 1, 1,
0.260174, 0.03788918, 0.3015608, 0, 0.3294118, 1, 1,
0.2607558, -1.098031, 3.394507, 0, 0.3215686, 1, 1,
0.2635235, -0.1197618, 2.677161, 0, 0.3176471, 1, 1,
0.2659924, 0.6901577, 1.00748, 0, 0.3098039, 1, 1,
0.2662801, -0.5146517, 3.311253, 0, 0.3058824, 1, 1,
0.2686036, 0.02523973, 4.256466, 0, 0.2980392, 1, 1,
0.2688804, 0.594551, 1.212373, 0, 0.2901961, 1, 1,
0.2699721, -0.6952762, 4.338528, 0, 0.2862745, 1, 1,
0.2703053, 0.9708255, -1.799145, 0, 0.2784314, 1, 1,
0.2725591, 0.03651606, 3.079797, 0, 0.2745098, 1, 1,
0.2770136, 1.517096, -0.8580723, 0, 0.2666667, 1, 1,
0.2797032, 0.7693223, 0.6231083, 0, 0.2627451, 1, 1,
0.2826931, 0.5804946, 1.870611, 0, 0.254902, 1, 1,
0.2830801, -0.7433501, 1.929638, 0, 0.2509804, 1, 1,
0.2833335, 0.6662846, -0.761412, 0, 0.2431373, 1, 1,
0.2857127, -1.021922, 3.745131, 0, 0.2392157, 1, 1,
0.2879646, -0.8085892, 3.994015, 0, 0.2313726, 1, 1,
0.2886557, 0.4048647, 0.9393342, 0, 0.227451, 1, 1,
0.2896678, -0.815699, 2.88183, 0, 0.2196078, 1, 1,
0.2901524, 0.5956258, 0.4780102, 0, 0.2156863, 1, 1,
0.2905636, -1.530302, 3.283445, 0, 0.2078431, 1, 1,
0.2970978, 0.6194401, 0.265723, 0, 0.2039216, 1, 1,
0.2992688, 0.8089389, 0.6288388, 0, 0.1960784, 1, 1,
0.3029388, -1.014192, 1.542385, 0, 0.1882353, 1, 1,
0.3059909, 0.6269805, 0.5904508, 0, 0.1843137, 1, 1,
0.3062349, -1.544301, 2.201413, 0, 0.1764706, 1, 1,
0.3065621, 1.422627, 0.2892561, 0, 0.172549, 1, 1,
0.3084437, -0.9132007, 3.441522, 0, 0.1647059, 1, 1,
0.3110391, -1.104505, 2.662065, 0, 0.1607843, 1, 1,
0.311829, -1.237876, 1.534868, 0, 0.1529412, 1, 1,
0.3175995, 1.045997, -0.8116854, 0, 0.1490196, 1, 1,
0.3179574, -0.5796153, 0.7094696, 0, 0.1411765, 1, 1,
0.3220266, 1.928998, -1.364326, 0, 0.1372549, 1, 1,
0.3233028, 0.3210513, 0.7075658, 0, 0.1294118, 1, 1,
0.3235832, 0.1879945, 0.5873773, 0, 0.1254902, 1, 1,
0.3245302, -0.02112274, 0.9054509, 0, 0.1176471, 1, 1,
0.3278246, 0.02534935, 1.022276, 0, 0.1137255, 1, 1,
0.3285849, 0.5372396, 1.017632, 0, 0.1058824, 1, 1,
0.3285961, 0.01585636, 2.226323, 0, 0.09803922, 1, 1,
0.3320092, -1.162202, 1.97981, 0, 0.09411765, 1, 1,
0.3375034, 1.815216, 0.1719072, 0, 0.08627451, 1, 1,
0.3397714, 1.152, 0.03135399, 0, 0.08235294, 1, 1,
0.3435575, 0.255001, 1.974942, 0, 0.07450981, 1, 1,
0.3458116, -0.4466281, 1.642448, 0, 0.07058824, 1, 1,
0.3468407, 0.4741569, 1.004996, 0, 0.0627451, 1, 1,
0.3574825, -0.909305, 4.022827, 0, 0.05882353, 1, 1,
0.3581536, -1.335768, 2.061166, 0, 0.05098039, 1, 1,
0.3585578, 0.158825, 1.726893, 0, 0.04705882, 1, 1,
0.3589568, -0.4628787, 0.6350241, 0, 0.03921569, 1, 1,
0.3602357, -1.774415, 5.639285, 0, 0.03529412, 1, 1,
0.360477, 1.752173, -0.04605803, 0, 0.02745098, 1, 1,
0.3633997, -0.4606145, 2.500487, 0, 0.02352941, 1, 1,
0.3636683, 0.6588463, 2.000594, 0, 0.01568628, 1, 1,
0.3669722, 2.230041, 0.001848808, 0, 0.01176471, 1, 1,
0.372402, -0.7592738, 2.410365, 0, 0.003921569, 1, 1,
0.3734861, -1.325812, 4.855989, 0.003921569, 0, 1, 1,
0.3851923, -1.079013, 1.868549, 0.007843138, 0, 1, 1,
0.3887961, 0.5244147, 0.07412023, 0.01568628, 0, 1, 1,
0.3890902, 1.60351, 0.1246159, 0.01960784, 0, 1, 1,
0.3992866, -1.09753, 2.557188, 0.02745098, 0, 1, 1,
0.400841, 1.048991, -0.8989322, 0.03137255, 0, 1, 1,
0.4085548, 0.01258004, 2.234115, 0.03921569, 0, 1, 1,
0.4101006, -0.3634888, 3.789171, 0.04313726, 0, 1, 1,
0.4129002, 0.01667716, 0.9326967, 0.05098039, 0, 1, 1,
0.4138709, 0.13276, 2.899742, 0.05490196, 0, 1, 1,
0.4167556, -0.2571815, 2.593281, 0.0627451, 0, 1, 1,
0.4220108, 0.1883407, 1.944146, 0.06666667, 0, 1, 1,
0.4254784, 0.541697, 0.8002577, 0.07450981, 0, 1, 1,
0.4288807, -0.208674, 3.64724, 0.07843138, 0, 1, 1,
0.4289676, 0.3220036, 1.132371, 0.08627451, 0, 1, 1,
0.4303349, 0.7921607, 0.3025076, 0.09019608, 0, 1, 1,
0.4332049, 0.3412837, 1.892048, 0.09803922, 0, 1, 1,
0.4350589, 1.658158, 0.2506833, 0.1058824, 0, 1, 1,
0.4392988, 1.308208, -0.6678285, 0.1098039, 0, 1, 1,
0.4450089, -0.06016394, 2.28667, 0.1176471, 0, 1, 1,
0.4463362, 0.125413, 2.876598, 0.1215686, 0, 1, 1,
0.4466673, 1.79902, -0.1989053, 0.1294118, 0, 1, 1,
0.4513853, 0.9064745, -0.2535521, 0.1333333, 0, 1, 1,
0.4514164, -0.5503813, 2.709092, 0.1411765, 0, 1, 1,
0.4525915, -0.8807822, 2.442462, 0.145098, 0, 1, 1,
0.4586409, 1.169942, 1.177619, 0.1529412, 0, 1, 1,
0.4594283, -0.8842946, 2.78385, 0.1568628, 0, 1, 1,
0.461538, 0.4907669, 0.8570035, 0.1647059, 0, 1, 1,
0.4633247, 2.295907, -0.3650022, 0.1686275, 0, 1, 1,
0.4659775, 1.191851, 0.6370831, 0.1764706, 0, 1, 1,
0.4695807, 0.6510422, -1.013632, 0.1803922, 0, 1, 1,
0.4756223, 0.5014696, 2.760204, 0.1882353, 0, 1, 1,
0.4759066, -0.9668869, 2.501904, 0.1921569, 0, 1, 1,
0.477174, 0.6373031, 0.6797766, 0.2, 0, 1, 1,
0.4773659, -0.6075499, 1.007259, 0.2078431, 0, 1, 1,
0.4836883, 0.5696135, 0.4592679, 0.2117647, 0, 1, 1,
0.4870274, -1.142972, 3.037297, 0.2196078, 0, 1, 1,
0.4885568, 1.368661, 1.149392, 0.2235294, 0, 1, 1,
0.4925196, 0.2608121, 0.6606917, 0.2313726, 0, 1, 1,
0.5019408, -1.210422, 1.131025, 0.2352941, 0, 1, 1,
0.5034757, -1.151217, 3.723169, 0.2431373, 0, 1, 1,
0.5045344, 0.7606283, 0.01372139, 0.2470588, 0, 1, 1,
0.5052828, -2.040848, 2.569934, 0.254902, 0, 1, 1,
0.5158117, -0.1823384, 1.46268, 0.2588235, 0, 1, 1,
0.522816, 2.058018, 0.5051547, 0.2666667, 0, 1, 1,
0.5233788, -1.438285, 1.498496, 0.2705882, 0, 1, 1,
0.5236831, -0.2462473, 0.7872378, 0.2784314, 0, 1, 1,
0.5240338, -0.8582128, 3.01928, 0.282353, 0, 1, 1,
0.5313607, 0.1846794, 0.4317999, 0.2901961, 0, 1, 1,
0.5318586, -0.2191637, 3.151462, 0.2941177, 0, 1, 1,
0.5327475, -0.476958, 2.451746, 0.3019608, 0, 1, 1,
0.5402086, 1.291057, 1.998761, 0.3098039, 0, 1, 1,
0.5403643, 0.5245464, -0.02065294, 0.3137255, 0, 1, 1,
0.5457688, 0.1780776, 1.204541, 0.3215686, 0, 1, 1,
0.5552436, -0.9545549, 2.194695, 0.3254902, 0, 1, 1,
0.5563223, 2.153228, 0.2442763, 0.3333333, 0, 1, 1,
0.5566885, 0.03296148, 2.089607, 0.3372549, 0, 1, 1,
0.562848, -2.523199, 4.0714, 0.345098, 0, 1, 1,
0.5703175, -0.1533434, 2.031526, 0.3490196, 0, 1, 1,
0.5718089, -1.294525, 2.336132, 0.3568628, 0, 1, 1,
0.5726488, 0.5558792, 0.7000858, 0.3607843, 0, 1, 1,
0.5777297, 0.8225548, 0.7315851, 0.3686275, 0, 1, 1,
0.5805184, 0.9817165, 0.03980747, 0.372549, 0, 1, 1,
0.5856873, 0.2633028, 2.40682, 0.3803922, 0, 1, 1,
0.5857835, -1.924919, 4.190986, 0.3843137, 0, 1, 1,
0.5915306, 0.9138988, 0.6779994, 0.3921569, 0, 1, 1,
0.5939981, 0.6912242, -0.215248, 0.3960784, 0, 1, 1,
0.5950572, 0.302481, 0.1463829, 0.4039216, 0, 1, 1,
0.5963724, 1.554661, 0.7294055, 0.4117647, 0, 1, 1,
0.5975932, -0.00791591, 1.237171, 0.4156863, 0, 1, 1,
0.6046944, 0.04187607, 2.48244, 0.4235294, 0, 1, 1,
0.6062365, -0.2098511, 2.690838, 0.427451, 0, 1, 1,
0.6170201, -0.1496688, 2.98433, 0.4352941, 0, 1, 1,
0.6199294, -0.02277306, 2.526586, 0.4392157, 0, 1, 1,
0.6237431, 0.8071418, 0.03679208, 0.4470588, 0, 1, 1,
0.6244087, 1.8347, 1.049327, 0.4509804, 0, 1, 1,
0.6334682, -0.7076082, 2.546107, 0.4588235, 0, 1, 1,
0.634263, -1.676291, 1.396086, 0.4627451, 0, 1, 1,
0.6353157, 1.414785, -0.4349005, 0.4705882, 0, 1, 1,
0.6359015, -0.4963578, 2.942561, 0.4745098, 0, 1, 1,
0.6366781, -0.4834821, 3.060844, 0.4823529, 0, 1, 1,
0.6392887, -1.781251, 2.975627, 0.4862745, 0, 1, 1,
0.6427975, -0.3347161, 2.229012, 0.4941176, 0, 1, 1,
0.6441459, 0.1922887, 0.2228239, 0.5019608, 0, 1, 1,
0.6443098, -0.7342492, 1.745688, 0.5058824, 0, 1, 1,
0.6453775, -0.8476075, 2.280118, 0.5137255, 0, 1, 1,
0.6454156, -2.320331, 4.346582, 0.5176471, 0, 1, 1,
0.6473101, -0.4557064, 1.985188, 0.5254902, 0, 1, 1,
0.6546869, -0.06251149, 2.118459, 0.5294118, 0, 1, 1,
0.6571241, -0.1522637, 3.233336, 0.5372549, 0, 1, 1,
0.6632183, -1.561381, 1.753078, 0.5411765, 0, 1, 1,
0.6666609, -1.613302, 1.705941, 0.5490196, 0, 1, 1,
0.6673211, -0.3680272, 3.398669, 0.5529412, 0, 1, 1,
0.6732438, 1.587306, -0.04091603, 0.5607843, 0, 1, 1,
0.6746191, 0.1192836, 3.296395, 0.5647059, 0, 1, 1,
0.6760283, -0.9454846, 1.883215, 0.572549, 0, 1, 1,
0.6807631, 2.251293, 1.095921, 0.5764706, 0, 1, 1,
0.6889498, 1.173707, 0.2167796, 0.5843138, 0, 1, 1,
0.6910174, 0.1739145, -0.4535235, 0.5882353, 0, 1, 1,
0.7033823, 0.9954954, 0.8332084, 0.5960785, 0, 1, 1,
0.7044951, -0.4834812, 1.996889, 0.6039216, 0, 1, 1,
0.7053939, -0.7397693, 1.750672, 0.6078432, 0, 1, 1,
0.7061418, 1.477775, 0.1655306, 0.6156863, 0, 1, 1,
0.7110656, -1.088011, 0.9350663, 0.6196079, 0, 1, 1,
0.7137772, -0.5429415, 0.1747818, 0.627451, 0, 1, 1,
0.7171736, 0.9379481, -0.9471771, 0.6313726, 0, 1, 1,
0.7202153, -0.9444677, 3.58172, 0.6392157, 0, 1, 1,
0.728105, -1.032326, 1.90286, 0.6431373, 0, 1, 1,
0.7301908, -1.973656, 3.009192, 0.6509804, 0, 1, 1,
0.7319067, -0.4871748, 2.624676, 0.654902, 0, 1, 1,
0.7343773, 0.297093, -0.9809259, 0.6627451, 0, 1, 1,
0.7410448, -1.465955, 2.864528, 0.6666667, 0, 1, 1,
0.7442382, 0.01058583, -0.1617559, 0.6745098, 0, 1, 1,
0.7460871, 0.2892825, 3.00203, 0.6784314, 0, 1, 1,
0.7461829, -1.679946, 2.751799, 0.6862745, 0, 1, 1,
0.7464645, -0.9380499, 1.751402, 0.6901961, 0, 1, 1,
0.7498738, -1.260061, 2.868611, 0.6980392, 0, 1, 1,
0.7524343, -2.064614, 2.417394, 0.7058824, 0, 1, 1,
0.75474, -0.4777941, 0.751851, 0.7098039, 0, 1, 1,
0.7566754, 1.119412, 2.372324, 0.7176471, 0, 1, 1,
0.7578572, 0.6167567, 3.000832, 0.7215686, 0, 1, 1,
0.7607811, 0.8926484, 0.5249956, 0.7294118, 0, 1, 1,
0.7622169, 0.419793, 0.6663345, 0.7333333, 0, 1, 1,
0.7625681, -1.960225, 3.714907, 0.7411765, 0, 1, 1,
0.7686515, -1.427367, 0.7214693, 0.7450981, 0, 1, 1,
0.7828362, -1.80263, 3.672743, 0.7529412, 0, 1, 1,
0.7856589, -1.659308, 1.745312, 0.7568628, 0, 1, 1,
0.7925594, -0.3210253, 2.938418, 0.7647059, 0, 1, 1,
0.7948136, -0.9789641, 2.867734, 0.7686275, 0, 1, 1,
0.7975051, 1.927903, -0.9327611, 0.7764706, 0, 1, 1,
0.7995932, -1.480688, 4.447332, 0.7803922, 0, 1, 1,
0.806711, -0.2244018, 1.378009, 0.7882353, 0, 1, 1,
0.8106399, 0.9093623, -1.238859, 0.7921569, 0, 1, 1,
0.8109936, -0.8029215, 1.721991, 0.8, 0, 1, 1,
0.8152282, -0.4380368, 1.052041, 0.8078431, 0, 1, 1,
0.824124, 0.08218259, 0.801778, 0.8117647, 0, 1, 1,
0.8275843, 1.257968, 0.04541237, 0.8196079, 0, 1, 1,
0.836831, 1.903428, -1.322478, 0.8235294, 0, 1, 1,
0.8380238, 0.7566974, -0.4085625, 0.8313726, 0, 1, 1,
0.841854, -0.9424986, 2.702029, 0.8352941, 0, 1, 1,
0.8452429, 1.023638, 0.448674, 0.8431373, 0, 1, 1,
0.8515983, -1.252481, 0.5659578, 0.8470588, 0, 1, 1,
0.8584406, -1.021148, 3.79187, 0.854902, 0, 1, 1,
0.8600569, -0.5748118, 3.75134, 0.8588235, 0, 1, 1,
0.8623983, -1.135298, 1.374624, 0.8666667, 0, 1, 1,
0.8624238, -1.275951, 2.316111, 0.8705882, 0, 1, 1,
0.8641121, -0.4852481, 1.678373, 0.8784314, 0, 1, 1,
0.8653073, -1.288138, 2.455792, 0.8823529, 0, 1, 1,
0.8856531, 2.023788, 0.7795327, 0.8901961, 0, 1, 1,
0.8870568, -0.198308, 1.075527, 0.8941177, 0, 1, 1,
0.8871617, 0.3964587, -0.1620315, 0.9019608, 0, 1, 1,
0.8877854, 1.784455, 0.5018584, 0.9098039, 0, 1, 1,
0.8891223, 1.916614, 0.5549707, 0.9137255, 0, 1, 1,
0.8907626, 0.7578874, 1.510688, 0.9215686, 0, 1, 1,
0.8913248, -0.6457426, 1.828563, 0.9254902, 0, 1, 1,
0.893104, 1.24169, 1.127454, 0.9333333, 0, 1, 1,
0.8936503, 0.5985247, 1.926538, 0.9372549, 0, 1, 1,
0.8952224, -0.8236471, 0.4043789, 0.945098, 0, 1, 1,
0.8974498, -0.8970622, 3.308268, 0.9490196, 0, 1, 1,
0.8989078, -0.04393141, -0.3475098, 0.9568627, 0, 1, 1,
0.9039457, -0.2450927, 2.709108, 0.9607843, 0, 1, 1,
0.9048583, -1.468581, 3.823327, 0.9686275, 0, 1, 1,
0.9048598, -0.7685534, 2.244657, 0.972549, 0, 1, 1,
0.9049757, -0.02718184, 1.079102, 0.9803922, 0, 1, 1,
0.907596, -0.01477965, 2.588491, 0.9843137, 0, 1, 1,
0.9100581, -0.245504, 3.292967, 0.9921569, 0, 1, 1,
0.9104246, 1.534876, 0.9475785, 0.9960784, 0, 1, 1,
0.9352691, 1.310174, 0.3524818, 1, 0, 0.9960784, 1,
0.9408984, 0.6275841, 2.265727, 1, 0, 0.9882353, 1,
0.946709, -0.1669486, 0.7518303, 1, 0, 0.9843137, 1,
0.9477428, 0.06678999, 0.8400285, 1, 0, 0.9764706, 1,
0.9555361, -0.3714077, 2.218169, 1, 0, 0.972549, 1,
0.9603072, -0.04146812, 3.469691, 1, 0, 0.9647059, 1,
0.9606732, -1.012888, 2.447215, 1, 0, 0.9607843, 1,
0.9654595, 0.3124275, 1.881475, 1, 0, 0.9529412, 1,
0.9688023, -0.9372633, 3.410372, 1, 0, 0.9490196, 1,
0.9701425, 0.7827759, 0.07410929, 1, 0, 0.9411765, 1,
0.9710122, 0.9845293, 0.4966097, 1, 0, 0.9372549, 1,
0.9718038, -0.9868388, 2.204905, 1, 0, 0.9294118, 1,
0.9784139, 1.426184, 0.1889313, 1, 0, 0.9254902, 1,
0.9822189, -0.5260569, 2.467903, 1, 0, 0.9176471, 1,
0.9862341, -0.1892218, 1.972026, 1, 0, 0.9137255, 1,
0.9909195, 0.3568178, 2.051165, 1, 0, 0.9058824, 1,
0.9920377, -1.691623, 2.907859, 1, 0, 0.9019608, 1,
0.994865, 1.297626, -1.007393, 1, 0, 0.8941177, 1,
0.999746, -2.143849, 3.115705, 1, 0, 0.8862745, 1,
1.002226, -0.2661461, 2.507917, 1, 0, 0.8823529, 1,
1.006132, 0.312267, 0.9194586, 1, 0, 0.8745098, 1,
1.007902, 0.483527, 0.4753763, 1, 0, 0.8705882, 1,
1.009972, 0.5573227, 1.957969, 1, 0, 0.8627451, 1,
1.012785, 0.8248904, 1.585757, 1, 0, 0.8588235, 1,
1.014388, 0.2461151, 0.9820701, 1, 0, 0.8509804, 1,
1.015721, 1.11015, 1.128359, 1, 0, 0.8470588, 1,
1.019578, 0.9444634, -0.4570671, 1, 0, 0.8392157, 1,
1.023491, -0.603591, 2.211563, 1, 0, 0.8352941, 1,
1.024604, -0.7741509, 3.61872, 1, 0, 0.827451, 1,
1.034085, -1.929327, 1.515392, 1, 0, 0.8235294, 1,
1.035611, -1.392173, 2.483442, 1, 0, 0.8156863, 1,
1.036152, -0.3575926, -0.5123462, 1, 0, 0.8117647, 1,
1.038172, 0.1424041, 3.956951, 1, 0, 0.8039216, 1,
1.044697, 2.00657, 0.3211876, 1, 0, 0.7960784, 1,
1.045219, -0.6836203, 0.9486327, 1, 0, 0.7921569, 1,
1.046353, -0.330437, 1.615453, 1, 0, 0.7843137, 1,
1.050112, 0.2323322, 0.6019632, 1, 0, 0.7803922, 1,
1.056379, 0.8946035, 1.720884, 1, 0, 0.772549, 1,
1.067741, -0.2795261, 0.5981824, 1, 0, 0.7686275, 1,
1.083592, -0.3963545, 2.673522, 1, 0, 0.7607843, 1,
1.101165, 1.285578, 1.409813, 1, 0, 0.7568628, 1,
1.103665, 0.2104557, 1.244073, 1, 0, 0.7490196, 1,
1.104193, -0.1927503, 2.982771, 1, 0, 0.7450981, 1,
1.107874, 0.859778, 1.557312, 1, 0, 0.7372549, 1,
1.109168, -0.01871782, 2.9533, 1, 0, 0.7333333, 1,
1.109469, 0.3748538, 2.414811, 1, 0, 0.7254902, 1,
1.112512, 1.644199, 0.7308232, 1, 0, 0.7215686, 1,
1.115606, -1.536177, 2.973835, 1, 0, 0.7137255, 1,
1.116416, 0.376983, 1.225164, 1, 0, 0.7098039, 1,
1.122823, -2.395975, 1.979347, 1, 0, 0.7019608, 1,
1.123119, -1.10201, 4.0152, 1, 0, 0.6941177, 1,
1.127868, -0.27128, 1.539489, 1, 0, 0.6901961, 1,
1.129648, 0.2991444, 1.14861, 1, 0, 0.682353, 1,
1.130735, -0.5463189, 2.00894, 1, 0, 0.6784314, 1,
1.131368, -0.6416979, 3.075444, 1, 0, 0.6705883, 1,
1.13275, -0.6994069, -0.0335217, 1, 0, 0.6666667, 1,
1.134983, 1.028184, 2.466451, 1, 0, 0.6588235, 1,
1.139089, -0.7434147, 2.217114, 1, 0, 0.654902, 1,
1.146604, -1.054791, 3.799947, 1, 0, 0.6470588, 1,
1.148991, 1.570678, -0.3849304, 1, 0, 0.6431373, 1,
1.150357, 1.493569, 1.444196, 1, 0, 0.6352941, 1,
1.150421, 0.1621853, 1.028694, 1, 0, 0.6313726, 1,
1.156934, -0.2917916, 2.416389, 1, 0, 0.6235294, 1,
1.169469, -0.7960661, 2.111728, 1, 0, 0.6196079, 1,
1.174483, -0.1003979, -0.335323, 1, 0, 0.6117647, 1,
1.175242, -0.2144469, 3.387332, 1, 0, 0.6078432, 1,
1.177754, 0.02233286, 2.867179, 1, 0, 0.6, 1,
1.20931, -1.085438, 3.997272, 1, 0, 0.5921569, 1,
1.212589, -0.596867, 1.672357, 1, 0, 0.5882353, 1,
1.219771, -1.209719, 3.704882, 1, 0, 0.5803922, 1,
1.232374, -0.1450272, 2.596859, 1, 0, 0.5764706, 1,
1.238038, 1.620363, 0.7321625, 1, 0, 0.5686275, 1,
1.244847, 0.6415561, 1.30709, 1, 0, 0.5647059, 1,
1.250185, -0.6211816, 1.309768, 1, 0, 0.5568628, 1,
1.259457, -0.8756505, 4.059888, 1, 0, 0.5529412, 1,
1.26185, -1.084504, 2.2194, 1, 0, 0.5450981, 1,
1.27225, -0.783955, 3.483257, 1, 0, 0.5411765, 1,
1.274484, -0.1476878, 3.283639, 1, 0, 0.5333334, 1,
1.278394, 0.8331614, 0.04648009, 1, 0, 0.5294118, 1,
1.291263, 0.3499649, 2.21501, 1, 0, 0.5215687, 1,
1.298456, -0.5023369, 2.286778, 1, 0, 0.5176471, 1,
1.311289, 0.3591827, 2.719735, 1, 0, 0.509804, 1,
1.313112, -0.9464771, 1.747814, 1, 0, 0.5058824, 1,
1.316867, -0.02870607, 3.17445, 1, 0, 0.4980392, 1,
1.31854, 0.5523786, 1.129015, 1, 0, 0.4901961, 1,
1.322532, 0.3728726, 1.295502, 1, 0, 0.4862745, 1,
1.325155, 1.886444, 1.416919, 1, 0, 0.4784314, 1,
1.328867, -0.3490394, 2.097954, 1, 0, 0.4745098, 1,
1.332995, -1.282845, 2.549833, 1, 0, 0.4666667, 1,
1.347896, 0.1678868, 2.441708, 1, 0, 0.4627451, 1,
1.34902, -2.072499, 3.785312, 1, 0, 0.454902, 1,
1.357132, -1.786019, 0.01610679, 1, 0, 0.4509804, 1,
1.366271, 2.141669, 1.229726, 1, 0, 0.4431373, 1,
1.366671, 1.941779, -0.1113172, 1, 0, 0.4392157, 1,
1.368705, 0.4999934, 1.969114, 1, 0, 0.4313726, 1,
1.377126, 0.1440884, 1.535372, 1, 0, 0.427451, 1,
1.394173, -0.3037841, 0.6524595, 1, 0, 0.4196078, 1,
1.40051, 0.2085771, 1.460469, 1, 0, 0.4156863, 1,
1.43261, 2.112733, -0.2109825, 1, 0, 0.4078431, 1,
1.439501, 1.413765, -0.2396079, 1, 0, 0.4039216, 1,
1.440427, 0.6243296, 0.2185084, 1, 0, 0.3960784, 1,
1.448305, 1.473221, -0.2321586, 1, 0, 0.3882353, 1,
1.455347, 0.6870553, 0.4223392, 1, 0, 0.3843137, 1,
1.46656, -1.184422, 2.830399, 1, 0, 0.3764706, 1,
1.477398, -1.008808, 1.714941, 1, 0, 0.372549, 1,
1.479006, 2.420178, 0.2400011, 1, 0, 0.3647059, 1,
1.485492, -0.621261, 0.3141677, 1, 0, 0.3607843, 1,
1.488114, -0.3123294, 1.125177, 1, 0, 0.3529412, 1,
1.509825, 1.656941, 0.7353495, 1, 0, 0.3490196, 1,
1.515399, -1.224252, 2.786412, 1, 0, 0.3411765, 1,
1.51752, 2.290684, -0.1211106, 1, 0, 0.3372549, 1,
1.51831, 0.576782, 0.6471463, 1, 0, 0.3294118, 1,
1.539117, 0.4916686, 1.223813, 1, 0, 0.3254902, 1,
1.550469, 1.320279, 0.483286, 1, 0, 0.3176471, 1,
1.557684, -0.9210691, 2.258298, 1, 0, 0.3137255, 1,
1.575713, 1.322839, 1.514297, 1, 0, 0.3058824, 1,
1.591594, -0.4742931, 2.831389, 1, 0, 0.2980392, 1,
1.611252, -1.115122, 2.54478, 1, 0, 0.2941177, 1,
1.612168, -0.1961206, 1.429358, 1, 0, 0.2862745, 1,
1.612584, -0.8499609, 2.416692, 1, 0, 0.282353, 1,
1.617979, 0.2962019, 0.1151081, 1, 0, 0.2745098, 1,
1.620477, -0.02406942, 1.379566, 1, 0, 0.2705882, 1,
1.655882, -0.8804495, 2.892868, 1, 0, 0.2627451, 1,
1.657957, -0.1665381, 1.663182, 1, 0, 0.2588235, 1,
1.709673, 0.528936, 1.078323, 1, 0, 0.2509804, 1,
1.722809, 1.76358, 0.1042297, 1, 0, 0.2470588, 1,
1.723219, -1.519421, 2.138671, 1, 0, 0.2392157, 1,
1.765858, 1.288549, 1.381136, 1, 0, 0.2352941, 1,
1.771236, -1.185767, 1.708817, 1, 0, 0.227451, 1,
1.784786, 1.157347, 1.477229, 1, 0, 0.2235294, 1,
1.809437, 1.562899, 2.022968, 1, 0, 0.2156863, 1,
1.821718, 0.7849457, 1.012157, 1, 0, 0.2117647, 1,
1.897805, 0.2936909, 1.053833, 1, 0, 0.2039216, 1,
1.925404, 0.03971192, 1.862321, 1, 0, 0.1960784, 1,
1.927878, -0.2785213, 2.821071, 1, 0, 0.1921569, 1,
1.938857, 0.07102533, 3.811264, 1, 0, 0.1843137, 1,
1.956061, -0.2691256, 1.349541, 1, 0, 0.1803922, 1,
1.964622, -0.7883465, 2.0564, 1, 0, 0.172549, 1,
1.985212, 0.6202278, 2.329592, 1, 0, 0.1686275, 1,
2.010233, -0.08634289, 2.580202, 1, 0, 0.1607843, 1,
2.013694, 0.288047, 0.9588195, 1, 0, 0.1568628, 1,
2.047024, -0.1441124, 0.3826658, 1, 0, 0.1490196, 1,
2.058419, -1.294518, 3.443715, 1, 0, 0.145098, 1,
2.075033, 0.2113129, 1.983106, 1, 0, 0.1372549, 1,
2.083344, -1.79979, 1.788963, 1, 0, 0.1333333, 1,
2.086335, 1.014666, 0.3028048, 1, 0, 0.1254902, 1,
2.122301, -0.3521183, 2.268076, 1, 0, 0.1215686, 1,
2.135417, 0.9789582, 0.5382033, 1, 0, 0.1137255, 1,
2.135999, 0.2569774, 1.619914, 1, 0, 0.1098039, 1,
2.136754, -0.6485111, 2.89812, 1, 0, 0.1019608, 1,
2.188577, 0.7723138, 0.3525977, 1, 0, 0.09411765, 1,
2.188769, 0.5761413, -0.1246654, 1, 0, 0.09019608, 1,
2.203123, -0.6782154, 1.945601, 1, 0, 0.08235294, 1,
2.257494, 0.1321924, 2.91804, 1, 0, 0.07843138, 1,
2.400164, -1.592267, 1.633232, 1, 0, 0.07058824, 1,
2.464728, 0.954704, 1.262021, 1, 0, 0.06666667, 1,
2.535685, -0.3876387, 2.941725, 1, 0, 0.05882353, 1,
2.537005, -0.9143172, 1.42295, 1, 0, 0.05490196, 1,
2.575251, -0.1690594, 3.03405, 1, 0, 0.04705882, 1,
2.597196, -0.7517434, 1.193784, 1, 0, 0.04313726, 1,
2.737803, -0.7066657, 3.456278, 1, 0, 0.03529412, 1,
2.806117, -0.5978389, 1.967638, 1, 0, 0.03137255, 1,
2.818562, 0.6159991, 0.8465677, 1, 0, 0.02352941, 1,
3.000344, -0.3799455, 2.840778, 1, 0, 0.01960784, 1,
3.152226, 0.574651, 1.684039, 1, 0, 0.01176471, 1,
3.470861, 1.916777, -0.8606715, 1, 0, 0.007843138, 1
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
0.1921434, -3.983606, -7.523952, 0, -0.5, 0.5, 0.5,
0.1921434, -3.983606, -7.523952, 1, -0.5, 0.5, 0.5,
0.1921434, -3.983606, -7.523952, 1, 1.5, 0.5, 0.5,
0.1921434, -3.983606, -7.523952, 0, 1.5, 0.5, 0.5
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
-4.19806, 0.4099133, -7.523952, 0, -0.5, 0.5, 0.5,
-4.19806, 0.4099133, -7.523952, 1, -0.5, 0.5, 0.5,
-4.19806, 0.4099133, -7.523952, 1, 1.5, 0.5, 0.5,
-4.19806, 0.4099133, -7.523952, 0, 1.5, 0.5, 0.5
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
-4.19806, -3.983606, 0.01156473, 0, -0.5, 0.5, 0.5,
-4.19806, -3.983606, 0.01156473, 1, -0.5, 0.5, 0.5,
-4.19806, -3.983606, 0.01156473, 1, 1.5, 0.5, 0.5,
-4.19806, -3.983606, 0.01156473, 0, 1.5, 0.5, 0.5
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
-3, -2.969717, -5.784987,
3, -2.969717, -5.784987,
-3, -2.969717, -5.784987,
-3, -3.138699, -6.074814,
-2, -2.969717, -5.784987,
-2, -3.138699, -6.074814,
-1, -2.969717, -5.784987,
-1, -3.138699, -6.074814,
0, -2.969717, -5.784987,
0, -3.138699, -6.074814,
1, -2.969717, -5.784987,
1, -3.138699, -6.074814,
2, -2.969717, -5.784987,
2, -3.138699, -6.074814,
3, -2.969717, -5.784987,
3, -3.138699, -6.074814
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
-3, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
-3, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
-3, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
-3, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
-2, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
-2, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
-2, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
-2, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
-1, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
-1, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
-1, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
-1, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
0, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
0, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
0, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
0, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
1, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
1, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
1, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
1, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
2, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
2, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
2, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
2, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5,
3, -3.476662, -6.654469, 0, -0.5, 0.5, 0.5,
3, -3.476662, -6.654469, 1, -0.5, 0.5, 0.5,
3, -3.476662, -6.654469, 1, 1.5, 0.5, 0.5,
3, -3.476662, -6.654469, 0, 1.5, 0.5, 0.5
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
-3.184936, -2, -5.784987,
-3.184936, 3, -5.784987,
-3.184936, -2, -5.784987,
-3.35379, -2, -6.074814,
-3.184936, -1, -5.784987,
-3.35379, -1, -6.074814,
-3.184936, 0, -5.784987,
-3.35379, 0, -6.074814,
-3.184936, 1, -5.784987,
-3.35379, 1, -6.074814,
-3.184936, 2, -5.784987,
-3.35379, 2, -6.074814,
-3.184936, 3, -5.784987,
-3.35379, 3, -6.074814
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
-3.691498, -2, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, -2, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, -2, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, -2, -6.654469, 0, 1.5, 0.5, 0.5,
-3.691498, -1, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, -1, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, -1, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, -1, -6.654469, 0, 1.5, 0.5, 0.5,
-3.691498, 0, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, 0, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, 0, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, 0, -6.654469, 0, 1.5, 0.5, 0.5,
-3.691498, 1, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, 1, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, 1, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, 1, -6.654469, 0, 1.5, 0.5, 0.5,
-3.691498, 2, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, 2, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, 2, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, 2, -6.654469, 0, 1.5, 0.5, 0.5,
-3.691498, 3, -6.654469, 0, -0.5, 0.5, 0.5,
-3.691498, 3, -6.654469, 1, -0.5, 0.5, 0.5,
-3.691498, 3, -6.654469, 1, 1.5, 0.5, 0.5,
-3.691498, 3, -6.654469, 0, 1.5, 0.5, 0.5
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
-3.184936, -2.969717, -4,
-3.184936, -2.969717, 4,
-3.184936, -2.969717, -4,
-3.35379, -3.138699, -4,
-3.184936, -2.969717, -2,
-3.35379, -3.138699, -2,
-3.184936, -2.969717, 0,
-3.35379, -3.138699, 0,
-3.184936, -2.969717, 2,
-3.35379, -3.138699, 2,
-3.184936, -2.969717, 4,
-3.35379, -3.138699, 4
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
-3.691498, -3.476662, -4, 0, -0.5, 0.5, 0.5,
-3.691498, -3.476662, -4, 1, -0.5, 0.5, 0.5,
-3.691498, -3.476662, -4, 1, 1.5, 0.5, 0.5,
-3.691498, -3.476662, -4, 0, 1.5, 0.5, 0.5,
-3.691498, -3.476662, -2, 0, -0.5, 0.5, 0.5,
-3.691498, -3.476662, -2, 1, -0.5, 0.5, 0.5,
-3.691498, -3.476662, -2, 1, 1.5, 0.5, 0.5,
-3.691498, -3.476662, -2, 0, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 0, 0, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 0, 1, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 0, 1, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 0, 0, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 2, 0, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 2, 1, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 2, 1, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 2, 0, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 4, 0, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 4, 1, -0.5, 0.5, 0.5,
-3.691498, -3.476662, 4, 1, 1.5, 0.5, 0.5,
-3.691498, -3.476662, 4, 0, 1.5, 0.5, 0.5
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
-3.184936, -2.969717, -5.784987,
-3.184936, 3.789544, -5.784987,
-3.184936, -2.969717, 5.808116,
-3.184936, 3.789544, 5.808116,
-3.184936, -2.969717, -5.784987,
-3.184936, -2.969717, 5.808116,
-3.184936, 3.789544, -5.784987,
-3.184936, 3.789544, 5.808116,
-3.184936, -2.969717, -5.784987,
3.569223, -2.969717, -5.784987,
-3.184936, -2.969717, 5.808116,
3.569223, -2.969717, 5.808116,
-3.184936, 3.789544, -5.784987,
3.569223, 3.789544, -5.784987,
-3.184936, 3.789544, 5.808116,
3.569223, 3.789544, 5.808116,
3.569223, -2.969717, -5.784987,
3.569223, 3.789544, -5.784987,
3.569223, -2.969717, 5.808116,
3.569223, 3.789544, 5.808116,
3.569223, -2.969717, -5.784987,
3.569223, -2.969717, 5.808116,
3.569223, 3.789544, -5.784987,
3.569223, 3.789544, 5.808116
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
var radius = 8.02227;
var distance = 35.69199;
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
mvMatrix.translate( -0.1921434, -0.4099133, -0.01156473 );
mvMatrix.scale( 1.284222, 1.283252, 0.7481893 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69199);
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


